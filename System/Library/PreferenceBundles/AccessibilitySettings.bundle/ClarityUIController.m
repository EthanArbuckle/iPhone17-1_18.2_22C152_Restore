@interface ClarityUIController
- (BSInvalidatable)appAvailabilityObserver;
- (ClarityUIController)init;
- (NSMutableDictionary)hasSettingsByBundleIdentifier;
- (NSString)selectedIdentifier;
- (OBNavigationController)setUpNavigationController;
- (OBTextWelcomeController)whatsNewController;
- (id)_allowSiri:(id)a3;
- (id)_appCustomizationSpecifierForFirstPartyAppWithIdentifier:(id)a3 title:(id)a4;
- (id)_appCustomizationSpecifiers;
- (id)_appSpecifierWithTitle:(id)a3 hasChevron:(BOOL)a4 identifier:(id)a5 appIconImage:(id)a6;
- (id)_batteryMonitoring:(id)a3;
- (id)_colorFromData:(id)a3;
- (id)_lockScreenClock:(id)a3;
- (id)_notificationsEnabled:(id)a3;
- (id)_silentModeToggleEnabled:(id)a3;
- (id)_volumeButtons:(id)a3;
- (id)createClarityUIIntroductionGroupSpecifier;
- (id)specifiers;
- (void)_appCustomizationSpecifiers;
- (void)_checkExistenceOfSettingsForAppSpecifier:(id)a3 identifier:(id)a4 bundleIdentifiersCheckingExistenceOfSettings:(id)a5 specifiersRequiringReload:(id)a6;
- (void)_goToSiriSettings:(id)a3;
- (void)_loadAppSetupControllerForSpecifier:(id)a3;
- (void)_resetButtonTapped:(id)a3;
- (void)_setAllowSiri:(id)a3 specifier:(id)a4;
- (void)_setBatteryMonitorningEnabled:(id)a3 specifier:(id)a4;
- (void)_setNotificationsEnabled:(id)a3 specifier:(id)a4;
- (void)_setSilentModeToggleEnabled:(id)a3 specifier:(id)a4;
- (void)_setUpForSpecifier:(id)a3;
- (void)_setVolumeButtonsEnabled:(id)a3 specifier:(id)a4;
- (void)_setlockScreenClockEnabled:(id)a3 specifier:(id)a4;
- (void)_showClarityUIHelp:(id)a3;
- (void)_startButtonTapped:(id)a3;
- (void)_updateAppSpecifier:(id)a3 hasChevron:(BOOL)a4;
- (void)confirmationViewAcceptedForSpecifier:(id)a3;
- (void)dealloc;
- (void)doneButtonTapped:(id)a3;
- (void)setAppAvailabilityObserver:(id)a3;
- (void)setHasSettingsByBundleIdentifier:(id)a3;
- (void)setSelectedIdentifier:(id)a3;
- (void)setSetUpNavigationController:(id)a3;
- (void)setWhatsNewController:(id)a3;
@end

@implementation ClarityUIController

- (ClarityUIController)init
{
  v21.receiver = self;
  v21.super_class = (Class)ClarityUIController;
  v2 = [(ClarityUIController *)&v21 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_clarityUIEnabledDidChange:" name:kAXSClarityUIEnabledNotification object:0];

    v4 = +[CLFSettings sharedInstance];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __27__ClarityUIController_init__block_invoke;
    v18[3] = &unk_208798;
    objc_copyWeak(&v19, &location);
    [v4 registerUpdateBlock:v18 forRetrieveSelector:"applicationBundleIdentifiers" withListener:v2];

    objc_destroyWeak(&v19);
    v5 = +[CLFSettings sharedInstance];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __27__ClarityUIController_init__block_invoke_2;
    v16[3] = &unk_208798;
    objc_copyWeak(&v17, &location);
    [v5 registerUpdateBlock:v16 forRetrieveSelector:"listLayout" withListener:v2];

    objc_destroyWeak(&v17);
    v6 = +[CLFAppAvailabilityChecker sharedInstance];
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = __27__ClarityUIController_init__block_invoke_3;
    v14 = &unk_208798;
    objc_copyWeak(&v15, &location);
    v7 = [v6 observeUpdatesWithHandler:&v11];
    -[ClarityUIController setAppAvailabilityObserver:](v2, "setAppAvailabilityObserver:", v7, v11, v12, v13, v14);

    uint64_t v8 = +[NSMutableDictionary dictionary];
    hasSettingsByBundleIdentifier = v2->_hasSettingsByBundleIdentifier;
    v2->_hasSettingsByBundleIdentifier = (NSMutableDictionary *)v8;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __27__ClarityUIController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __27__ClarityUIController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __27__ClarityUIController_init__block_invoke_3(uint64_t a1)
{
  v2 = CLFLogSettings();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Reloading specifiers because app availability changed.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (void)dealloc
{
  v3 = [(ClarityUIController *)self appAvailabilityObserver];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)ClarityUIController;
  [(ClarityUIController *)&v4 dealloc];
}

- (id)createClarityUIIntroductionGroupSpecifier
{
  id v35 = +[PSSpecifier emptyGroupSpecifier];
  v33 = settingsLocString(@"CLARITY_UI_USER_GUIDE_FOOTER", @"ClarityUISettings");
  v31 = settingsLocString(@"CLARITY_UI_SETUP_AFTER_FOOTER", @"ClarityUISettings");
  v3 = AXLocStringKeyForModel();
  v32 = settingsLocString(v3, @"ClarityUISettings");

  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v35 setProperty:v5 forKey:PSFooterCellClassGroupKey];

  objc_initWeak(&location, self);
  v54[0] = @"contentLabel";
  v54[1] = @"alreadyLocalized";
  v55[0] = v32;
  v55[1] = &__kCFBooleanTrue;
  v6 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
  v56[0] = v6;
  v52[0] = @"moreLabel";
  v52[1] = @"alreadyLocalized";
  v53[0] = v33;
  v53[1] = &__kCFBooleanTrue;
  v52[2] = @"customActionBlock";
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = __64__ClarityUIController_createClarityUIIntroductionGroupSpecifier__block_invoke;
  v40[3] = &unk_208798;
  v29 = &v41;
  objc_copyWeak(&v41, &location);
  v7 = objc_retainBlock(v40);
  v53[2] = v7;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:3];
  v56[1] = v8;
  v50[0] = @"contentLabel";
  v50[1] = @"alreadyLocalized";
  v51[0] = v31;
  v51[1] = &__kCFBooleanTrue;
  v9 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
  v56[2] = v9;
  v10 = +[NSArray arrayWithObjects:v56 count:3];
  id v34 = [v10 mutableCopy];

  uint64_t v11 = AXTeachableFeatureAssistiveAccess;
  uint64_t v12 = +[AXTeachableMomentsManager teachableItemsForFeature:AXTeachableFeatureAssistiveAccess];
  if ([v12 count])
  {
    v28 = v12;
    v48[0] = @"moreLabel";
    v13 = settingsLocString(@"AssistiveAccessWhatsNewLink", @"Accessibility");
    v49[0] = v13;
    v48[1] = @"additionalTitleLabel";
    v14 = settingsLocString(@"AssistiveAccessTitle", @"Accessibility");
    v49[1] = v14;
    v49[2] = &__kCFBooleanTrue;
    v48[2] = @"alreadyLocalized";
    v48[3] = @"symbolName";
    v49[3] = @"apps.iphone.assistive.access";
    id v15 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:4];
    id v30 = [v15 mutableCopy];

    v16 = objc_opt_new();
    v46[0] = @"sectionLabel";
    id v17 = +[AXTeachableMomentsManager notificationTitleForFeature:v11];
    v46[1] = @"alreadyLocalized";
    v47[0] = v17;
    v47[1] = &__kCFBooleanTrue;
    v18 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
    [v16 addObject:v18];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v19 = v12;
    id v20 = [v19 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v37;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(v19);
          }
          v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v43[0] = @"headerLabel";
          v24 = objc_msgSend(v23, "itemTitle", v28, v29);
          v44[0] = v24;
          v43[1] = @"contentLabel";
          v25 = [v23 itemDescription];
          v43[2] = @"alreadyLocalized";
          v44[1] = v25;
          v44[2] = &__kCFBooleanTrue;
          v26 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3];
          [v16 addObject:v26];
        }
        id v20 = [v19 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v20);
    }

    [v30 setObject:v16 forKey:@"additionalContent"];
    [v34 addObject:v30];

    uint64_t v12 = v28;
  }
  objc_msgSend(v35, "setProperty:forKey:", v34, @"content", v28);

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);

  return v35;
}

void __64__ClarityUIController_createClarityUIIntroductionGroupSpecifier__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showClarityUIHelp:0];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    int v6 = _AXSClarityUIEnabled();
    v7 = [(ClarityUIController *)self createClarityUIIntroductionGroupSpecifier];
    [v5 addObject:v7];
    if (!v6)
    {
      id v17 = settingsLocString(@"SET_UP_TITLE", @"ClarityUISettings");
      v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v18 setProperty:@"SetUpClarityUISpecifier" forKey:PSIDKey];
      [v18 setButtonAction:"_setUpForSpecifier:"];
      [v18 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
      [v5 addObject:v18];

LABEL_17:
      v60 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
      *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

      objc_super v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
      goto LABEL_18;
    }
    uint64_t v8 = settingsLocString(@"CLARITY_UI_START", @"ClarityUISettings");
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v9 setButtonAction:"_startButtonTapped:"];
    uint64_t v68 = PSAllowMultilineTitleKey;
    objc_msgSend(v9, "setProperty:forKey:", &__kCFBooleanTrue);
    uint64_t v10 = PSIDKey;
    [v9 setProperty:@"ClarityUIStart" forKey:PSIDKey];
    [v5 addObject:v9];
    int v72 = 0;
    uint64_t v11 = +[MCProfileConnection sharedConnection];
    unsigned int v12 = [v11 unlockScreenTypeWithOutSimplePasscodeType:&v72];

    v13 = +[MCProfileConnection sharedConnection];
    uint64_t v71 = v3;
    if ([v13 isPasscodeSet])
    {
      int v14 = v72;

      if (v12 || v14 == -1)
      {
        uint64_t v15 = PSEnabledKey;
        v16 = &__kCFBooleanFalse;
        goto LABEL_10;
      }
    }
    else
    {
    }
    uint64_t v15 = PSEnabledKey;
    v16 = &__kCFBooleanTrue;
LABEL_10:
    uint64_t v62 = v15;
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16);
    v69 = v9;
    id v19 = [(ClarityUIController *)self _appCustomizationSpecifiers];
    [v5 addObjectsFromArray:v19];

    id v20 = settingsLocString(@"OPTIONS_TITLE", @"ClarityUISettings");
    uint64_t v21 = +[PSSpecifier groupSpecifierWithName:v20];

    v22 = settingsLocString(@"LIST_LAYOUT_FOOTNOTE", @"ClarityUISettings");
    uint64_t v23 = PSFooterTextGroupKey;
    [v21 setProperty:v22 forKey:PSFooterTextGroupKey];

    [v21 setProperty:@"Options" forKey:v10];
    v67 = v21;
    [v5 addObject:v21];
    v66 = +[ClarityUILayoutSetupTableCell visualLayoutPickerSpecifier];
    objc_msgSend(v5, "addObject:");
    v24 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v24];

    v25 = settingsLocString(@"WALLPAPER", @"ClarityUISettings");
    v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v26 setProperty:@"Wallpaper" forKey:v10];
    v65 = v26;
    [v5 addObject:v26];
    uint64_t v27 = settingsLocString(@"VOLUME_BUTTONS", @"ClarityUISettings");
    v28 = +[PSSpecifier preferenceSpecifierNamed:v27 target:self set:"_setVolumeButtonsEnabled:specifier:" get:"_volumeButtons:" detail:0 cell:6 edit:0];

    [v28 setProperty:@"VolumeButtons" forKey:v10];
    v64 = v28;
    [v5 addObject:v28];
    LOBYTE(v27) = AXDeviceIsRingerSwitchAvailable();
    int HasStaccato = AXDeviceHasStaccato();
    if ((v27 & 1) != 0 || HasStaccato)
    {
      id v30 = +[PSSpecifier emptyGroupSpecifier];
      v31 = AXLocStringKeyForModel();
      v32 = settingsLocString(v31, @"ClarityUISettings");

      [v30 setProperty:v32 forKey:v23];
      [v5 addObject:v30];
      v33 = settingsLocString(@"SILENT_MODE", @"ClarityUISettings");
      id v34 = +[PSSpecifier preferenceSpecifierNamed:v33 target:self set:"_setSilentModeToggleEnabled:specifier:" get:"_silentModeToggleEnabled:" detail:0 cell:6 edit:0];

      [v5 addObject:v34];
      id v35 = +[PSSpecifier emptyGroupSpecifier];
      [v5 addObject:v35];
    }
    long long v36 = settingsLocString(@"LOCK_SCREEN_CLOCK", @"ClarityUISettings");
    long long v37 = +[PSSpecifier preferenceSpecifierNamed:v36 target:self set:"_setlockScreenClockEnabled:specifier:" get:"_lockScreenClock:" detail:0 cell:6 edit:0];

    [v37 setProperty:@"ShowTime" forKey:v10];
    [v5 addObject:v37];
    long long v38 = settingsLocString(@"BATTERY_MONITORING", @"ClarityUISettings");
    long long v39 = +[PSSpecifier preferenceSpecifierNamed:v38 target:self set:"_setBatteryMonitorningEnabled:specifier:" get:"_batteryMonitoring:" detail:0 cell:6 edit:0];

    [v39 setProperty:@"ShowBattery" forKey:v10];
    [v5 addObject:v39];
    v40 = settingsLocString(@"NOTIFICATIONS_ENABLED", @"ClarityUISettings");
    id v41 = +[PSSpecifier preferenceSpecifierNamed:v40 target:self set:"_setNotificationsEnabled:specifier:" get:"_notificationsEnabled:" detail:0 cell:6 edit:0];

    [v41 setProperty:@"ShowNotification" forKey:v10];
    [v5 addObject:v41];
    v42 = +[PSSpecifier groupSpecifierWithName:0];
    [v5 addObject:v42];
    v70 = v7;
    v63 = v37;
    if (AFPreferencesAssistantEnabled())
    {
      v43 = settingsLocString(@"ALLOW_SIRI", @"ClarityUISettings");
      v44 = +[PSSpecifier preferenceSpecifierNamed:v43 target:self set:"_setAllowSiri:specifier:" get:"_allowSiri:" detail:0 cell:6 edit:0];

      v45 = settingsLocString(@"SIRI_SETTINGS_FOOTER", @"ClarityUISettings");
      v46 = settingsLocString(@"CONFIGURE_SIRI_FOOTER", @"ClarityUISettings");
      v47 = AXCFormattedString();

      v48 = (objc_class *)objc_opt_class();
      v49 = NSStringFromClass(v48);
      objc_msgSend(v42, "setProperty:forKey:", v49, PSFooterCellClassGroupKey, v45);

      [v42 setProperty:v47 forKey:PSFooterHyperlinkViewTitleKey];
      v74.id location = (NSUInteger)[v47 rangeOfString:v45 options:4];
      v50 = NSStringFromRange(v74);
      [v42 setProperty:v50 forKey:PSFooterHyperlinkViewLinkRangeKey];

      v51 = +[NSValue valueWithNonretainedObject:self];
      [v42 setProperty:v51 forKey:PSFooterHyperlinkViewTargetKey];

      v52 = NSStringFromSelector("_goToSiriSettings:");
      [v42 setProperty:v52 forKey:PSFooterHyperlinkViewActionKey];

      [v44 setProperty:@"AllowSiri" forKey:v10];
      [v5 addObject:v44];
    }
    else
    {
      v53 = settingsLocString(@"SET_UP_SIRI", @"ClarityUISettings");
      v44 = +[PSSpecifier preferenceSpecifierNamed:v53 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v44 setButtonAction:"_goToSiriSettings:"];
      [v44 setProperty:&__kCFBooleanTrue forKey:v62];
      [v5 addObject:v44];
    }

    v54 = +[PSSpecifier groupSpecifierWithID:@"ClarityUIAdminSpecifierID"];
    [v5 addObject:v54];
    v55 = settingsLocString(@"ADMIN_PASSCODE_SETTINGS", @"ClarityUISettings");
    v56 = +[PSSpecifier preferenceSpecifierNamed:v55 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v56 setProperty:@"PasscodeSettings" forKey:v10];
    [v5 addObject:v56];
    v57 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v57];
    v58 = settingsLocString(@"CLARITY_UI_RESET", @"ClarityUISettings");
    v59 = +[PSSpecifier deleteButtonSpecifierWithName:v58 target:self action:"_resetButtonTapped:"];

    [v59 setProperty:&__kCFBooleanTrue forKey:v68];
    [v5 addObject:v59];

    uint64_t v3 = v71;
    goto LABEL_17;
  }
LABEL_18:

  return v4;
}

- (void)doneButtonTapped:(id)a3
{
  objc_super v4 = [(ClarityUIController *)self whatsNewController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __40__ClarityUIController_doneButtonTapped___block_invoke;
  v5[3] = &unk_2087C0;
  v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

id __40__ClarityUIController_doneButtonTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWhatsNewController:0];
}

- (id)_appCustomizationSpecifierForFirstPartyAppWithIdentifier:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[ClarityUIAppSetupCoordinator sharedInstance];
  v9 = [v8 clarityBundleNameForBundleIdentifier:v6];

  if (v9)
  {
    uint64_t v10 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:2 edit:0];
    uint64_t v11 = PSBundlePathForPreferenceBundle();
    [v10 setProperty:v11 forKey:PSLazilyLoadedBundleKey];

    [v10 setProperty:&__kCFBooleanTrue forKey:PSBundleIsControllerKey];
    [v10 setControllerLoadAction:"lazyLoadBundle:"];
    unsigned int v12 = +[UIScreen mainScreen];
    [v12 scale];
    v13 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 0);

    [v10 setProperty:v13 forKey:PSIconImageKey];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_appCustomizationSpecifiers
{
  uint64_t v3 = +[NSMutableArray array];
  objc_super v4 = settingsLocString(@"APP_CUSTOMIZATION_TITLE", @"ClarityUISettings");
  v5 = +[PSSpecifier groupSpecifierWithName:v4];

  [v5 setProperty:@"Applications" forKey:PSIDKey];
  long long v36 = v5;
  [v3 insertObject:v5 atIndex:0];
  id v6 = +[CLFSettings sharedInstance];
  id v7 = [v6 applicationBundleIdentifiers];

  uint64_t v8 = ClarityUIAllInstalledAppIdentifiers();
  long long v38 = +[NSMutableSet set];
  v9 = v3;
  long long v37 = +[NSMutableArray array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v46;
    v13 = CAGradientLayer_ptr;
    id v41 = self;
    long long v39 = v3;
    do
    {
      int v14 = 0;
      do
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v14);
        if ([v8 containsObject:v15])
        {
          [v13[6] sharedInstance];
          id v17 = v16 = v13;
          unsigned int v18 = [v17 requiresPreflightForBundleIdentifier:v15];

          if (v18)
          {
            id v19 = CLFLogSettings();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v15;
              id v20 = v19;
              uint64_t v21 = "Skipping selected application that requires preflight: %@";
              goto LABEL_15;
            }
            goto LABEL_21;
          }
          v22 = [v16[6] sharedInstance];
          unsigned int v23 = [v22 isHiddenByUserForBundleIdentifier:v15];

          if (v23)
          {
            id v19 = CLFLogSettings();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v15;
              id v20 = v19;
              uint64_t v21 = "Skipping selected application that was hidden by the user: %@";
LABEL_15:
              _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
            }
LABEL_21:
            v13 = CAGradientLayer_ptr;
            goto LABEL_22;
          }
          v24 = [v16[6] sharedInstance];
          int v25 = [v24 isAppAvailableForBundleIdentifier:v15];

          if ((v25 & 1) == 0)
          {
            id v19 = CLFLogSettings();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
              [(ClarityUIController *)&v43 _appCustomizationSpecifiers];
            }
            goto LABEL_21;
          }
          id v19 = ClarityUIDisplayNameForApp(v15);
          [(ClarityUIController *)self _appCustomizationSpecifierForFirstPartyAppWithIdentifier:v15 title:v19];
          uint64_t v27 = v26 = self;
          if (v27)
          {
            [v9 addObject:v27];
          }
          else
          {
            v28 = +[UIScreen mainScreen];
            [v28 scale];
            v40 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v15, 0);

            v29 = [(ClarityUIController *)v26 hasSettingsByBundleIdentifier];
            id v30 = [v29 objectForKeyedSubscript:v15];

            v31 = -[ClarityUIController _appSpecifierWithTitle:hasChevron:identifier:appIconImage:](v26, "_appSpecifierWithTitle:hasChevron:identifier:appIconImage:", v19, [v30 BOOLValue], v15, v40);
            if (!v30) {
              [(ClarityUIController *)v41 _checkExistenceOfSettingsForAppSpecifier:v31 identifier:v15 bundleIdentifiersCheckingExistenceOfSettings:v38 specifiersRequiringReload:v37];
            }
            [v39 addObject:v31];

            v9 = v39;
          }
          v13 = CAGradientLayer_ptr;

          self = v41;
        }
        else
        {
          id v19 = CLFLogSettings();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v50 = v15;
            _os_log_debug_impl(&dword_0, v19, OS_LOG_TYPE_DEBUG, "Application is no longer installed: %@", buf, 0xCu);
          }
        }
LABEL_22:

        int v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      id v32 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
      id v11 = v32;
    }
    while (v32);
  }

  v33 = settingsLocString(@"MANAGE_APPS", @"ClarityUISettings");
  id v34 = +[PSSpecifier preferenceSpecifierNamed:v33 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v9 addObject:v34];

  return v9;
}

- (void)_checkExistenceOfSettingsForAppSpecifier:(id)a3 identifier:(id)a4 bundleIdentifiersCheckingExistenceOfSettings:(id)a5 specifiersRequiringReload:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [(ClarityUIController *)self hasSettingsByBundleIdentifier];
  [v14 setObject:&__kCFBooleanFalse forKeyedSubscript:v11];

  [v12 addObject:v11];
  uint64_t v15 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __146__ClarityUIController__checkExistenceOfSettingsForAppSpecifier_identifier_bundleIdentifiersCheckingExistenceOfSettings_specifiersRequiringReload___block_invoke;
  block[3] = &unk_20C5F8;
  id v21 = v11;
  id v22 = v12;
  unsigned int v23 = self;
  id v24 = v10;
  id v25 = v13;
  id v16 = v13;
  id v17 = v10;
  id v18 = v12;
  id v19 = v11;
  dispatch_async(v15, block);
}

void __146__ClarityUIController__checkExistenceOfSettingsForAppSpecifier_identifier_bundleIdentifiersCheckingExistenceOfSettings_specifiersRequiringReload___block_invoke(uint64_t a1)
{
  v2 = CLFLogSettings();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Fetching whether app %@ has settings in the background.", buf, 0xCu);
  }

  objc_super v4 = +[ClarityUIAppSetupCoordinator sharedInstance];
  unsigned int v5 = [v4 bundleIdentifierHasClaritySettings:*(void *)(a1 + 32)];

  id v6 = CLFLogSettings();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v7;
    __int16 v20 = 1024;
    unsigned int v21 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Finished fetching whether app %@ has settings in the background: %i", buf, 0x12u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __146__ClarityUIController__checkExistenceOfSettingsForAppSpecifier_identifier_bundleIdentifiersCheckingExistenceOfSettings_specifiersRequiringReload___block_invoke_484;
  v11[3] = &unk_209790;
  id v12 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  char v17 = v5;
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = *(void **)(a1 + 56);
  id v13 = v8;
  uint64_t v14 = v9;
  id v15 = v10;
  id v16 = *(id *)(a1 + 64);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

id __146__ClarityUIController__checkExistenceOfSettingsForAppSpecifier_identifier_bundleIdentifiersCheckingExistenceOfSettings_specifiersRequiringReload___block_invoke_484(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v3 = [*(id *)(a1 + 48) hasSettingsByBundleIdentifier];
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:*(void *)(a1 + 40)];

    objc_super v4 = CLFLogSettings();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Adding chevron to specifier for app: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 48) _updateAppSpecifier:*(void *)(a1 + 56) hasChevron:1];
    [*(id *)(a1 + 64) addObject:*(void *)(a1 + 56)];
    id result = [*(id *)(a1 + 32) count];
    if (!result)
    {
      id v6 = CLFLogSettings();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v7;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Reloading specifiers that need update: %@", buf, 0xCu);
      }

      [*(id *)(a1 + 48) beginUpdates];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v8 = *(id *)(a1 + 64);
      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            objc_msgSend(*(id *)(a1 + 48), "reloadSpecifier:animated:", *(void *)(*((void *)&v13 + 1) + 8 * i), 1, (void)v13);
          }
          id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }

      return [*(id *)(a1 + 48) endUpdates];
    }
  }
  return result;
}

- (id)_appSpecifierWithTitle:(id)a3 hasChevron:(BOOL)a4 identifier:(id)a5 appIconImage:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  long long v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:4 edit:0];
  [v13 setProperty:v12 forKey:PSControllerTitleKey];

  [v13 setProperty:v11 forKey:PSIDKey];
  [v13 setProperty:v10 forKey:PSIconImageKey];

  [(ClarityUIController *)self _updateAppSpecifier:v13 hasChevron:v7];

  return v13;
}

- (void)_updateAppSpecifier:(id)a3 hasChevron:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v7 = v5;
  if (v4)
  {
    [v5 setCellType:2];
    id v6 = "_loadAppSetupControllerForSpecifier:";
  }
  else
  {
    [v5 setCellType:4];
    id v6 = 0;
  }
  [v7 setControllerLoadAction:v6];
}

- (id)_volumeButtons:(id)a3
{
  uint64_t v3 = +[CLFSettings sharedInstance];
  BOOL v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 volumeButtonsEnabled]);

  return v4;
}

- (void)_setVolumeButtonsEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CLFSettings sharedInstance];
  [v5 setVolumeButtonsEnabled:v4];
}

- (id)_silentModeToggleEnabled:(id)a3
{
  uint64_t v3 = +[CLFSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 silentModeToggleEnabled]);

  return v4;
}

- (void)_setSilentModeToggleEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CLFSettings sharedInstance];
  [v5 setSilentModeToggleEnabled:v4];
}

- (id)_lockScreenClock:(id)a3
{
  uint64_t v3 = +[CLFSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 lockScreenClockEnabled]);

  return v4;
}

- (void)_setlockScreenClockEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CLFSettings sharedInstance];
  [v5 setLockScreenClockEnabled:v4];
}

- (id)_notificationsEnabled:(id)a3
{
  uint64_t v3 = +[CLFSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 notificationsEnabled]);

  return v4;
}

- (void)_setNotificationsEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CLFSettings sharedInstance];
  [v5 setNotificationsEnabled:v4];
}

- (id)_batteryMonitoring:(id)a3
{
  uint64_t v3 = +[CLFSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 batteryMonitoringEnabled]);

  return v4;
}

- (void)_setBatteryMonitorningEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CLFSettings sharedInstance];
  [v5 setBatteryMonitoringEnabled:v4];
}

- (id)_allowSiri:(id)a3
{
  uint64_t v3 = +[CLFSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 allowSiri]);

  return v4;
}

- (void)_setAllowSiri:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CLFSettings sharedInstance];
  [v5 setAllowSiri:v4];
}

- (void)_goToSiriSettings:(id)a3
{
  +[NSURL URLWithString:@"prefs:root=SIRI"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (void)_showClarityUIHelp:(id)a3
{
}

- (void)_setUpForSpecifier:(id)a3
{
  id v4 = +[CLFPhoneFaceTimeSettings sharedInstance];
  [v4 setNeedsMigrationFor117558856:0];

  id v5 = +[CLFMessagesSettings sharedInstance];
  [v5 setNeedsMigrationFor117558856:0];

  [(ClarityUIController *)self setDefinesPresentationContext:1];
  id v6 = objc_alloc_init(ClarityOnboardingController);
  [(ClarityOnboardingController *)v6 setModalPresentationStyle:5];
  [(ClarityUIController *)self presentViewController:v6 animated:0 completion:0];
}

- (id)_colorFromData:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    id v9 = 0;
    id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v9];
    id v6 = v9;
    if (v6)
    {
      id v7 = CLFLogSettings();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ClarityUIController _colorFromData:]((uint64_t)v6, v7);
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_loadAppSetupControllerForSpecifier:(id)a3
{
  id v6 = [a3 propertyForKey:PSIDKey];
  id v4 = +[ClarityUIAppSetupCoordinator sharedInstance];
  id v5 = [v4 createSettingsControllerForBundleIdentifier:v6];

  [(ClarityUIController *)self showController:v5];
}

- (void)_resetButtonTapped:(id)a3
{
  id v8 = objc_alloc_init((Class)PSConfirmationSpecifier);
  id v4 = settingsLocString(@"CLARITY_UI_RESET_TITLE", @"ClarityUISettings");
  [v8 setTitle:v4];

  id v5 = settingsLocString(@"CLARITY_UI_RESET_PROMPT", @"ClarityUISettings");
  [v8 setPrompt:v5];

  id v6 = settingsLocString(@"CLARITY_UI_RESET_CANCEL", @"ClarityUISettings");
  [v8 setCancelButton:v6];

  id v7 = settingsLocString(@"CLARITY_UI_RESET_OK", @"ClarityUISettings");
  [v8 setOkButton:v7];

  [v8 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
  [(ClarityUIController *)self showConfirmationViewForSpecifier:v8];
}

- (void)_startButtonTapped:(id)a3
{
}

- (void)confirmationViewAcceptedForSpecifier:(id)a3
{
  [(ClarityUIController *)self resetAllSettings];

  [(ClarityUIController *)self reloadSpecifiers];
}

- (OBNavigationController)setUpNavigationController
{
  return self->_setUpNavigationController;
}

- (void)setSetUpNavigationController:(id)a3
{
}

- (NSString)selectedIdentifier
{
  return self->_selectedIdentifier;
}

- (void)setSelectedIdentifier:(id)a3
{
}

- (BSInvalidatable)appAvailabilityObserver
{
  return self->_appAvailabilityObserver;
}

- (void)setAppAvailabilityObserver:(id)a3
{
}

- (OBTextWelcomeController)whatsNewController
{
  return self->_whatsNewController;
}

- (void)setWhatsNewController:(id)a3
{
}

- (NSMutableDictionary)hasSettingsByBundleIdentifier
{
  return self->_hasSettingsByBundleIdentifier;
}

- (void)setHasSettingsByBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasSettingsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_whatsNewController, 0);
  objc_storeStrong((id *)&self->_appAvailabilityObserver, 0);
  objc_storeStrong((id *)&self->_selectedIdentifier, 0);

  objc_storeStrong((id *)&self->_setUpNavigationController, 0);
}

- (void)_appCustomizationSpecifiers
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Found unavailable application that was not covered by checks.", buf, 2u);
}

- (void)_colorFromData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to decode Clarity Lock Screen color: %@", (uint8_t *)&v2, 0xCu);
}

@end