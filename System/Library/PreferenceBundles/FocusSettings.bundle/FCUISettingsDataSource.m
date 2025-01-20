@interface FCUISettingsDataSource
+ (void)initialize;
- (BOOL)_shouldShowWelcomeController;
- (FCUISettingsDataSource)init;
- (NSSet)allReservedModes;
- (NSSet)placeholderModes;
- (id)_cloudSyncingEnabled:(id)a3;
- (id)_focusStatusDetailLabel;
- (id)_listController;
- (id)_modeLabel:(id)a3;
- (id)placeholderModeForSemanticType:(int64_t)a3;
- (unint64_t)_cloudSyncState;
- (void)_modeSetUp:(id)a3;
- (void)_setCloudSyncPreferenceEnabled:(BOOL)a3;
- (void)_setCloudSyncingEnabled:(id)a3 specifier:(id)a4;
- (void)createDefaultModeConfigurationForMode:(id)a3;
- (void)createDefaultModeConfigurationForMode:(id)a3 animate:(BOOL)a4;
- (void)dealloc;
- (void)didUpdateActiveModesForActivationManager:(id)a3 assertion:(id)a4;
- (void)globalConfigurationService:(id)a3 didEditCloudSyncPreference:(BOOL)a4;
- (void)loadSpecifiers;
- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4;
@end

@implementation FCUISettingsDataSource

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FCUISettingsRegisterLogging();
  }
}

- (FCUISettingsDataSource)init
{
  v16.receiver = self;
  v16.super_class = (Class)FCUISettingsDataSource;
  v2 = [(FCUISettingsDataSource *)&v16 init];
  if (v2)
  {
    uint64_t v3 = +[DNDModeConfigurationService serviceForClientIdentifier:@"com.apple.donotdisturb.preferences"];
    modeConfigurationService = v2->_modeConfigurationService;
    v2->_modeConfigurationService = (DNDModeConfigurationService *)v3;

    [(DNDModeConfigurationService *)v2->_modeConfigurationService addListener:v2 withCompletionHandler:0];
    uint64_t v5 = +[FSUIFocusActivationManager sharedInstance];
    focusActivationManager = v2->_focusActivationManager;
    v2->_focusActivationManager = (FSUIFocusActivationManager *)v5;

    [(FSUIFocusActivationManager *)v2->_focusActivationManager addListenerForFocusActivationChanges:v2];
    uint64_t v7 = +[DNDGlobalConfigurationService serviceForClientIdentifier:@"com.apple.donotdisturb.preferences"];
    globalConfigurationService = v2->_globalConfigurationService;
    v2->_globalConfigurationService = (DNDGlobalConfigurationService *)v7;

    [(DNDGlobalConfigurationService *)v2->_globalConfigurationService addListener:v2 withCompletionHandler:0];
    uint64_t v9 = +[DNDSettingsService serviceForClientIdentifier:@"com.apple.donotdisturb.preferences"];
    settingsService = v2->_settingsService;
    v2->_settingsService = (DNDSettingsService *)v9;

    v11 = (CNContactStore *)objc_alloc_init((Class)CNContactStore);
    contactStore = v2->_contactStore;
    v2->_contactStore = v11;

    [(CNContactStore *)v2->_contactStore requestAccessForEntityType:0 completionHandler:&stru_1CB88];
    [(DNDSettingsService *)v2->_settingsService addSettingsUpdateListener:v2 withCompletionHandler:0];
    availableModes = v2->_availableModes;
    v2->_availableModes = 0;

    allReservedModes = v2->_allReservedModes;
    v2->_allReservedModes = 0;

    v2->_hasIncompatibleMode = 0;
  }
  return v2;
}

- (void)dealloc
{
  [(DNDGlobalConfigurationService *)self->_globalConfigurationService removeListener:self];
  [(FSUIFocusActivationManager *)self->_focusActivationManager removeListenerForFocusActivationChanges:self];
  focusActivationManager = self->_focusActivationManager;
  self->_focusActivationManager = 0;

  v4.receiver = self;
  v4.super_class = (Class)FCUISettingsDataSource;
  [(FCUISettingsDataSource *)&v4 dealloc];
}

- (NSSet)placeholderModes
{
  return (NSSet *)[(NSSet *)self->_allReservedModes bs_filter:&stru_1CBC8];
}

- (id)placeholderModeForSemanticType:(int64_t)a3
{
  allReservedModes = self->_allReservedModes;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_4E64;
  v6[3] = &unk_1CBE8;
  v6[4] = a3;
  objc_super v4 = [(NSSet *)allReservedModes bs_firstObjectPassingTest:v6];

  return v4;
}

- (void)createDefaultModeConfigurationForMode:(id)a3
{
}

- (void)createDefaultModeConfigurationForMode:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 semanticType];
  modeConfigurationService = self->_modeConfigurationService;
  if (v7 == (id)-1)
  {
    id v16 = 0;
    v10 = [(DNDModeConfigurationService *)modeConfigurationService createEmptyModeConfigurationForMode:v6 error:&v16];

    id v11 = v16;
    if (v11)
    {
LABEL_3:
      if (os_log_type_enabled((os_log_t)FCUILogSettings, OS_LOG_TYPE_ERROR)) {
        sub_14060();
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v9 = [v6 modeIdentifier];

    id v17 = 0;
    v10 = [(DNDModeConfigurationService *)modeConfigurationService createModeConfigurationUsingTemplateForModeIdentifier:v9 error:&v17];
    id v11 = v17;

    if (v11) {
      goto LABEL_3;
    }
  }
  v12 = [v10 mode];
  v13 = FCUILogSettings;
  if (os_log_type_enabled((os_log_t)FCUILogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v12;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Created mode:\n %@", buf, 0xCu);
  }
  [(FCUISettingsDataSource *)self reloadSpecifiers];
  v14 = [(FCUISettingsDataSource *)self _listController];
  v15 = [v12 modeIdentifier];
  [v14 showConfigurationForModeIdentifier:v15 animate:v4];

LABEL_9:
}

- (void)loadSpecifiers
{
  uint64_t v3 = +[NSBundle fcui_focusSettingsLocalizationBundle];
  v71 = [(FCUISettingsDataSource *)self specifiers];
  modeConfigurationService = self->_modeConfigurationService;
  id v78 = 0;
  uint64_t v5 = [(DNDModeConfigurationService *)modeConfigurationService allModesReturningError:&v78];
  id v6 = v78;
  allReservedModes = self->_allReservedModes;
  self->_allReservedModes = v5;

  v8 = [(NSSet *)self->_allReservedModes bs_filter:&stru_1CC08];
  availableModes = self->_availableModes;
  self->_availableModes = v8;

  v10 = [(NSSet *)self->_allReservedModes bs_reduce:&off_1D858 block:&stru_1CC48];
  id v11 = [v10 unsignedIntegerValue];

  [(FCUISettingsDataSource *)self _listController];
  v61 = unint64_t v69 = (unint64_t)v11;
  objc_msgSend(v61, "setAddButtonHidden:", v11 >= +[DNDMode maxUIAddableModes](DNDMode, "maxUIAddableModes"));
  if (v6 && os_log_type_enabled((os_log_t)FCUILogSettings, OS_LOG_TYPE_ERROR)) {
    sub_140C8();
  }
  v62 = v6;
  v12 = &_s10Foundation12CharacterSetV13alphanumericsACvgZ_ptr;
  v63 = v3;
  v67 = self;
  if ([(NSSet *)self->_availableModes count])
  {
    v13 = +[PSSpecifier emptyGroupSpecifier];
    v14 = [v3 localizedStringForKey:@"FOCUS_MODES_FOOTER_TEXT" value:&stru_1D300 table:0];
    [v13 setProperty:v14 forKey:PSFooterTextGroupKey];

    v60 = v13;
    [v71 addObject:v13];
    v15 = [(NSSet *)self->_availableModes allObjects];
    id v16 = [v15 sortedArrayUsingComparator:&stru_1CC88];

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id obj = v16;
    id v72 = [obj countByEnumeratingWithState:&v74 objects:v79 count:16];
    if (!v72) {
      goto LABEL_28;
    }
    uint64_t v17 = *(void *)v75;
    uint64_t v18 = PSIDKey;
    uint64_t v65 = PSIconImageKey;
    uint64_t v68 = PSCellClassKey;
    uint64_t v66 = PSIDKey;
    uint64_t v64 = *(void *)v75;
    while (1)
    {
      for (i = 0; i != v72; i = (char *)i + 1)
      {
        if (*(void *)v75 != v17) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        v21 = v12[268];
        v22 = [v20 name];
        v23 = [v21 preferenceSpecifierNamed:v22 target:self set:0 get:0 detail:0 cell:2 edit:0];

        if ([v20 isPlaceholder])
        {
          if (v69 >= (unint64_t)+[DNDMode maxUIAddableModes]) {
            goto LABEL_26;
          }
          [v23 setControllerLoadAction:"_modeSetUp:"];
        }
        else
        {
          [v23 setDetailControllerClass:objc_opt_class()];
        }
        v24 = [v20 modeIdentifier];
        [v23 setProperty:v24 forKey:v18];

        v25 = [v20 symbolImageName];
        if (v25)
        {
          uint64_t v26 = +[UIImage _systemImageNamed:v25];
          if (v26)
          {
            v27 = (void *)v26;
            v28 = v12;
            v29 = [v20 tintColorName];
            v30 = v29;
            if (v29)
            {
              v31 = v29;
            }
            else
            {
              v31 = +[DNDMode defaultTintColorName];
            }
            v32 = v31;

            SEL v33 = NSSelectorFromString(v32);
            if (objc_opt_respondsToSelector())
            {
              id v34 = +[UIColor performSelector:v33];
              if (v34)
              {
                v35 = v34;
                uint64_t v36 = [v27 imageWithTintColor:v34 renderingMode:1];

                v27 = (void *)v36;
              }
            }
            [v23 setProperty:v27 forKey:v65];

            uint64_t v18 = v66;
            self = v67;
            v12 = v28;
            uint64_t v17 = v64;
          }
        }
        v37 = +[SettingsActivityViewController dndModeKey];
        [v23 setProperty:v20 forKey:v37];

        v38 = [(FCUISettingsDataSource *)self _modeLabel:v23];
        if (v38)
        {
          [v23 setProperty:v38 forKey:@"FCUIDetailKey"];
          [v23 setProperty:objc_opt_class() forKey:v68];
        }
        [v71 addObject:v23];

LABEL_26:
      }
      id v72 = [obj countByEnumeratingWithState:&v74 objects:v79 count:16];
      if (!v72)
      {
LABEL_28:

        uint64_t v3 = v63;
        break;
      }
    }
  }
  v39 = [v12[268] emptyGroupSpecifier];
  unsigned __int8 v40 = [(FCUISettingsDataSource *)self _cloudSyncState];
  uint64_t v41 = v40 & 0xE;
  if (v41 != 14)
  {
    if ((v40 & 8) == 0)
    {
      CFStringRef v42 = @"CLOUD_SYNCING_UNSUPPORTED_DEVICE_TEXT";
      goto LABEL_36;
    }
    if ((v40 & 4) == 0)
    {
      CFStringRef v42 = @"CLOUD_SYNCING_MISSING_ACCOUNT_TEXT";
      goto LABEL_36;
    }
    if ((v40 & 2) == 0)
    {
      CFStringRef v42 = @"CLOUD_SYNCING_MISSING_HSA2_TEXT";
LABEL_36:
      v43 = [v3 localizedStringForKey:v42 value:&stru_1D300 table:0];
      if (v43) {
        goto LABEL_38;
      }
    }
  }
  v43 = [v3 localizedStringForKey:@"CLOUD_SYNCING_FOOTER_TEXT" value:&stru_1D300 table:0];
LABEL_38:
  BOOL v44 = v41 == 14;
  uint64_t v45 = PSFooterTextGroupKey;
  [v39 setProperty:v43 forKey:PSFooterTextGroupKey];
  v73 = v39;
  [v71 addObject:v39];
  v46 = v12[268];
  v47 = [v3 localizedStringForKey:@"CLOUD_SYNCING" value:&stru_1D300 table:0];
  uint64_t v48 = [v46 preferenceSpecifierNamed:v47 target:v67 set:"_setCloudSyncingEnabled:specifier:" get:"_cloudSyncingEnabled:" detail:0 cell:6 edit:0];
  cloudSyncingSpecifier = v67->_cloudSyncingSpecifier;
  v67->_cloudSyncingSpecifier = (PSSpecifier *)v48;

  v50 = v67->_cloudSyncingSpecifier;
  v51 = +[NSNumber numberWithBool:v44];
  [(PSSpecifier *)v50 setProperty:v51 forKey:PSEnabledKey];

  uint64_t v52 = PSAllowMultilineTitleKey;
  [(PSSpecifier *)v67->_cloudSyncingSpecifier setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v71 addObject:v67->_cloudSyncingSpecifier];
  v53 = [v12[268] emptyGroupSpecifier];
  v54 = v12[268];
  v55 = [v63 localizedStringForKey:@"FOCUS_STATUS" value:&stru_1D300 table:0];
  uint64_t v56 = [v54 preferenceSpecifierNamed:v55 target:v67 set:0 get:0 detail:0 cell:2 edit:0];
  focusStatusSpecifier = v67->_focusStatusSpecifier;
  v67->_focusStatusSpecifier = (PSSpecifier *)v56;

  [(PSSpecifier *)v67->_focusStatusSpecifier setProperty:&__kCFBooleanTrue forKey:v52];
  [(PSSpecifier *)v67->_focusStatusSpecifier setDetailControllerClass:objc_opt_class()];
  v58 = [v63 localizedStringForKey:@"FOCUS_STATUS_DESCRIPTION" value:&stru_1D300 table:0];
  [v53 setProperty:v58 forKey:v45];

  [v71 addObject:v53];
  [v71 addObject:v67->_focusStatusSpecifier];
  v59 = [(FCUISettingsDataSource *)v67 _focusStatusDetailLabel];
  if (v59)
  {
    [(PSSpecifier *)v67->_focusStatusSpecifier setProperty:v59 forKey:@"FCUIDetailKey"];
    [(PSSpecifier *)v67->_focusStatusSpecifier setProperty:objc_opt_class() forKey:PSCellClassKey];
  }
}

- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5B00;
  v5[3] = &unk_1CCB0;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)globalConfigurationService:(id)a3 didEditCloudSyncPreference:(BOOL)a4
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5BB0;
  v4[3] = &unk_1CCD8;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)didUpdateActiveModesForActivationManager:(id)a3 assertion:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5C6C;
  block[3] = &unk_1CD00;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (unint64_t)_cloudSyncState
{
  globalConfigurationService = self->_globalConfigurationService;
  id v6 = 0;
  id v3 = [(DNDGlobalConfigurationService *)globalConfigurationService getCloudSyncStateReturningError:&v6];
  id v4 = v6;
  if (v4 && os_log_type_enabled((os_log_t)FCUILogSettings, OS_LOG_TYPE_ERROR)) {
    sub_14130();
  }

  return (unint64_t)v3;
}

- (id)_cloudSyncingEnabled:(id)a3
{
  id v3 = [(DNDGlobalConfigurationService *)self->_globalConfigurationService isCloudSyncActive];

  return +[NSNumber numberWithBool:v3];
}

- (void)_setCloudSyncingEnabled:(id)a3 specifier:(id)a4
{
  -[FCUISettingsDataSource _setCloudSyncPreferenceEnabled:](self, "_setCloudSyncPreferenceEnabled:", [a3 BOOLValue]);

  [(FCUISettingsDataSource *)self reloadSpecifiers];
}

- (void)_setCloudSyncPreferenceEnabled:(BOOL)a3
{
  globalConfigurationService = self->_globalConfigurationService;
  id v6 = 0;
  [(DNDGlobalConfigurationService *)globalConfigurationService setCloudSyncPreferenceEnabled:a3 error:&v6];
  id v5 = v6;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)FCUILogSettings, OS_LOG_TYPE_ERROR)) {
      sub_14198();
    }
    [(FCUISettingsDataSource *)self reloadSpecifiers];
  }
}

- (id)_modeLabel:(id)a3
{
  id v4 = a3;
  id v5 = +[SettingsActivityViewController dndModeKey];
  id v6 = [v4 propertyForKey:v5];

  if ([v6 isPlaceholder])
  {
    id v7 = objc_alloc((Class)NSAttributedString);
    v8 = +[NSBundle fcui_focusSettingsLocalizationBundle];
    uint64_t v9 = v8;
    CFStringRef v10 = @"SETUP";
LABEL_5:
    id v11 = [v8 localizedStringForKey:v10 value:&stru_1D300 table:0];
    id v12 = [v7 initWithString:v11];

    goto LABEL_7;
  }
  if ([(FSUIFocusActivationManager *)self->_focusActivationManager isActiveMode:v6])
  {
    id v7 = objc_alloc((Class)NSAttributedString);
    v8 = +[NSBundle fcui_focusSettingsLocalizationBundle];
    uint64_t v9 = v8;
    CFStringRef v10 = @"ON";
    goto LABEL_5;
  }
  id v12 = 0;
LABEL_7:

  return v12;
}

- (id)_focusStatusDetailLabel
{
  id v3 = objc_alloc((Class)NSAttributedString);
  id v4 = +[NSBundle fcui_focusSettingsLocalizationBundle];
  CFStringRef v5 = @"OFF";
  if ([(DNDGlobalConfigurationService *)self->_globalConfigurationService isCloudSyncActive]&& [(DNDGlobalConfigurationService *)self->_globalConfigurationService modesCanImpactAvailability])
  {
    CFStringRef v5 = @"ON";
  }
  id v6 = [v4 localizedStringForKey:v5 value:&stru_1D300 table:0];
  id v7 = [v3 initWithString:v6];

  return v7;
}

- (void)_modeSetUp:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = +[SettingsActivityViewController dndModeKey];
  id v12 = [v4 propertyForKey:v5];

  if ([(FCUISettingsDataSource *)self _shouldShowWelcomeController])
  {
    id v6 = [(FCUISettingsDataSource *)self _listController];
    [v6 presentSetupControllerForPlaceholderMode:v12];
  }
  else
  {
    id v7 = objc_alloc((Class)DNDMode);
    v8 = [v12 name];
    uint64_t v9 = [v12 modeIdentifier];
    CFStringRef v10 = [v12 symbolImageName];
    id v11 = [v12 tintColorName];
    id v6 = objc_msgSend(v7, "initWithName:modeIdentifier:symbolImageName:tintColorName:semanticType:", v8, v9, v10, v11, objc_msgSend(v12, "semanticType"));

    [(FCUISettingsDataSource *)self createDefaultModeConfigurationForMode:v6];
  }
}

- (BOOL)_shouldShowWelcomeController
{
  return 1;
}

- (id)_listController
{
  v2 = [(FCUISettingsDataSource *)self observersOfClass:objc_opt_class()];
  id v3 = [v2 anyObject];

  return v3;
}

- (NSSet)allReservedModes
{
  return self->_allReservedModes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allReservedModes, 0);
  objc_storeStrong((id *)&self->_focusActivationManager, 0);
  objc_storeStrong((id *)&self->_focusStatusSpecifier, 0);
  objc_storeStrong((id *)&self->_cloudSyncingSpecifier, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_availableModes, 0);
  objc_storeStrong((id *)&self->_settingsService, 0);
  objc_storeStrong((id *)&self->_globalConfigurationService, 0);

  objc_storeStrong((id *)&self->_modeConfigurationService, 0);
}

@end