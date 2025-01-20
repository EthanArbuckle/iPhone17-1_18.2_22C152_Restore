@interface ClarityUISettingsWrapperController
- (ClarityUISettingsWrapperController)initWithPSSpecifier:(id)a3;
- (ClarityUISettingsWrapperControllerDelegate)delegate;
- (PSSpecifier)cachedSpecifier;
- (PSSpecifier)calendarNoneSpecifier;
- (PSSpecifier)clarityGroupSpecifier;
- (PSSpecifier)privacySpecifier;
- (id)_axFooterText:(BOOL)a3;
- (id)_axHandleCalendarAuthorizationController:(id)a3;
- (id)_axHandleContactsAuthorizationController:(id)a3;
- (id)_axHandleLocationAuthorizationController:(id)a3;
- (id)_axHandlePhotosAuthorizationController:(id)a3;
- (id)_axPreciseLocationEnabled:(id)a3;
- (id)_axSelectSpecifierFromSpecifiers:(id)a3;
- (id)specifiers;
- (int64_t)tableViewStyle;
- (void)_axSetPreciseLocationEnabled:(id)a3 specifier:(id)a4;
- (void)_axValidateAuthenticationController;
- (void)_handleUpgradePromptNotification:(id)a3;
- (void)_updateFooterText:(id)a3;
- (void)setCachedSpecifier:(id)a3;
- (void)setCalendarNoneSpecifier:(id)a3;
- (void)setClarityGroupSpecifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPrivacySpecifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ClarityUISettingsWrapperController

- (ClarityUISettingsWrapperController)initWithPSSpecifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ClarityUISettingsWrapperController;
  v6 = [(ClarityUISettingsWrapperController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_privacySpecifier, a3);
  }

  return v7;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (void)_handleUpgradePromptNotification:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __71__ClarityUISettingsWrapperController__handleUpgradePromptNotification___block_invoke;
  v4[3] = &unk_208948;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

void __71__ClarityUISettingsWrapperController__handleUpgradePromptNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 200) performGetter];
  id v3 = CLFLogSettings();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 200);
    int v11 = 138412546;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    v14 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Specifier: %@, updated value: %@", (uint8_t *)&v11, 0x16u);
  }

  id v5 = [*(id *)(a1 + 40) name];
  unsigned __int8 v6 = [v5 isEqualToString:@"PSCalendarPrivacyUpgradePromptCompletedNotification"];

  if ((v6 & 1) != 0
    || ([*(id *)(a1 + 40) name],
        v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 isEqualToString:@"PUIPhotosPrivacyUpgradePromptCompletedNotification"], v7, v8))
  {
    if ([v2 intValue] != 2) {
      [*(id *)(a1 + 32) setCachedSpecifier:0];
    }
    objc_super v9 = [*(id *)(a1 + 32) delegate];
    v10 = [*(id *)(a1 + 32) cachedSpecifier];
    [v9 updateContinueButtonForSpecifier:v10];

    [*(id *)(a1 + 32) reloadSpecifiers];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ClarityUISettingsWrapperController;
  [(ClarityUISettingsWrapperController *)&v5 viewWillAppear:a3];
  [(ClarityUISettingsWrapperController *)self reloadSpecifiers];
  uint64_t v4 = +[PSSpecifier groupSpecifierWithID:@"Privacy Choices"];
  [(ClarityUISettingsWrapperController *)self _updateFooterText:v4];
}

- (void)_axValidateAuthenticationController
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Received a privacy specifier to create settings for with no identifier. Specifier: %@", (uint8_t *)&v3, 0xCu);
}

void __73__ClarityUISettingsWrapperController__axValidateAuthenticationController__block_invoke(id a1)
{
  if (!AXSafeClassFromString())
  {
    v1 = CLFLogSettings();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      __73__ClarityUISettingsWrapperController__axValidateAuthenticationController__block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
}

void __73__ClarityUISettingsWrapperController__axValidateAuthenticationController__block_invoke_355(id a1)
{
  if (!AXSafeClassFromString())
  {
    v1 = CLFLogSettings();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      __73__ClarityUISettingsWrapperController__axValidateAuthenticationController__block_invoke_355_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
}

void __73__ClarityUISettingsWrapperController__axValidateAuthenticationController__block_invoke_361(id a1)
{
  if (!AXSafeClassFromString())
  {
    v1 = CLFLogSettings();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      __73__ClarityUISettingsWrapperController__axValidateAuthenticationController__block_invoke_361_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
}

void __73__ClarityUISettingsWrapperController__axValidateAuthenticationController__block_invoke_367(id a1)
{
  if (!AXSafeClassFromString())
  {
    v1 = CLFLogSettings();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      __73__ClarityUISettingsWrapperController__axValidateAuthenticationController__block_invoke_367_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  uint64_t v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = +[PSSpecifier groupSpecifierWithID:@"Privacy Choices"];
    [v6 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    [(ClarityUISettingsWrapperController *)self setClarityGroupSpecifier:v6];
    if ([(PSSpecifier *)self->_privacySpecifier cellType] == (char *)&dword_4 + 2)
    {
      [v5 addObject:v6];
      uint64_t v7 = settingsLocString(@"PRIVACY_ALLOW_ACCESS", @"ClarityUISettings");
      uint64_t v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v8 setProperty:@"AllowSpecifierID" forKey:@"ClarityIDKey"];
      [v5 addObject:v8];
      objc_super v9 = settingsLocString(@"PRIVACY_DO_NOT_ALLOW_ACCESS", @"ClarityUISettings");
      v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v10 setProperty:@"DoNotAllowSpecifierID" forKey:@"ClarityIDKey"];
      [v5 addObject:v10];

LABEL_20:
LABEL_21:
      v23 = *(void **)&self->PSListController_opaque[v3];
      *(void *)&self->PSListController_opaque[v3] = v5;

      uint64_t v4 = *(void **)&self->PSListController_opaque[v3];
      goto LABEL_22;
    }
    if ([(PSSpecifier *)self->_privacySpecifier cellType] != (char *)&dword_0 + 2)
    {
      v15 = CLFLogSettings();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        privacySpecifier = self->_privacySpecifier;
        *(_DWORD *)buf = 138412290;
        v26 = privacySpecifier;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Specifier not handled and added via fallback. Specifier: %@", buf, 0xCu);
      }

      [v5 addObject:self->_privacySpecifier];
      goto LABEL_21;
    }
    [(ClarityUISettingsWrapperController *)self _axValidateAuthenticationController];
    uint64_t v8 = NSStringFromClass((Class)[(PSSpecifier *)self->_privacySpecifier detailControllerClass]);
    if ([v8 isEqualToString:@"PSPhotoServicesAuthorizationLevelController"])
    {
      int v11 = +[NSNotificationCenter defaultCenter];
      [v11 addObserver:self selector:"_handleUpgradePromptNotification:" name:@"PUIPhotosPrivacyUpgradePromptCompletedNotification" object:0];

      [v5 addObject:v6];
      uint64_t v12 = [(ClarityUISettingsWrapperController *)self selectSpecifier:self->_privacySpecifier];
      __int16 v13 = [v12 safeArrayForKey:@"specifiers"];
      uint64_t v14 = [(ClarityUISettingsWrapperController *)self _axHandlePhotosAuthorizationController:v13];
    }
    else if ([v8 isEqualToString:@"PUILocationServicesAuthorizationLevelController"])
    {
      [v5 addObject:v6];
      uint64_t v12 = [(ClarityUISettingsWrapperController *)self selectSpecifier:self->_privacySpecifier];
      __int16 v13 = [v12 safeArrayForKey:@"specifiers"];
      uint64_t v14 = [(ClarityUISettingsWrapperController *)self _axHandleLocationAuthorizationController:v13];
    }
    else if ([v8 isEqualToString:@"PSCalendarPolicyAuthorizationLevelController"])
    {
      v17 = +[NSNotificationCenter defaultCenter];
      [v17 addObserver:self selector:"_handleUpgradePromptNotification:" name:@"PSCalendarPrivacyUpgradePromptCompletedNotification" object:0];

      [v5 addObject:v6];
      uint64_t v12 = [(ClarityUISettingsWrapperController *)self selectSpecifier:self->_privacySpecifier];
      __int16 v13 = [v12 safeArrayForKey:@"specifiers"];
      uint64_t v14 = [(ClarityUISettingsWrapperController *)self _axHandleCalendarAuthorizationController:v13];
    }
    else
    {
      if (![v8 isEqualToString:@"PSContactsAuthorizationLevelController"])
      {
LABEL_17:
        v20 = [(ClarityUISettingsWrapperController *)self _axSelectSpecifierFromSpecifiers:v5];
        if (v20)
        {
          v21 = [(ClarityUISettingsWrapperController *)self clarityGroupSpecifier];
          [v21 setProperty:v20 forKey:PSRadioGroupCheckedSpecifierKey];

          v22 = [(ClarityUISettingsWrapperController *)self clarityGroupSpecifier];
          [(ClarityUISettingsWrapperController *)self _updateFooterText:v22];
        }
        goto LABEL_20;
      }
      v18 = +[NSNotificationCenter defaultCenter];
      [v18 addObserver:self selector:"_handleUpgradePromptNotification:" name:@"PSContactsPrivacyUpgradePromptCompletedNotification" object:0];

      [v5 addObject:v6];
      uint64_t v12 = [(ClarityUISettingsWrapperController *)self selectSpecifier:self->_privacySpecifier];
      __int16 v13 = [v12 safeArrayForKey:@"specifiers"];
      uint64_t v14 = [(ClarityUISettingsWrapperController *)self _axHandleContactsAuthorizationController:v13];
    }
    v19 = (void *)v14;

    [v5 addObjectsFromArray:v19];
    goto LABEL_17;
  }
LABEL_22:

  return v4;
}

- (id)_axFooterText:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PSSpecifier *)self->_privacySpecifier propertyForKey:@"ClarityTCCAppNameKey"];
  uint64_t v6 = [(PSSpecifier *)self->_privacySpecifier name];
  uint64_t v7 = [(PSSpecifier *)self->_privacySpecifier identifier];
  unsigned int v8 = [v7 isEqualToString:@"Allow Tracking"];

  if (v8)
  {
    if (v3) {
      objc_super v9 = @"PRIVACY_FOOTER_TRACKING_ALLOW";
    }
    else {
      objc_super v9 = @"PRIVACY_FOOTER_TRACKING_NO_ALLOW";
    }
  }
  else if (v3)
  {
    objc_super v9 = @"PRIVACY_FOOTER_TEXT_ALLOW";
  }
  else
  {
    objc_super v9 = @"PRIVACY_FOOTER_TEXT_NO_ALLOW";
  }
  v10 = settingsLocString(v9, @"ClarityUISettings");
  int v11 = AXCFormattedString();

  return v11;
}

- (id)_axHandlePhotosAuthorizationController:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  if (v3)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    obj = v3;
    id v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (!v5) {
      goto LABEL_17;
    }
    id v6 = v5;
    id v19 = v3;
    uint64_t v7 = *(void *)v23;
    uint64_t v8 = PSIDKey;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v11 = [v10 cellType];
        uint64_t v12 = [v10 propertyForKey:v8];
        __int16 v13 = v12;
        if (v11)
        {
          unsigned int v14 = [v12 isEqualToString:@"PHOTOS_PICKER_INFO_CELL"];

          CFStringRef v15 = @"PhotosSpecifierID";
          if (v14)
          {
            v16 = [(ClarityUISettingsWrapperController *)self delegate];
            [v16 updateContinueButtonForSpecifier:v10];

            CFStringRef v15 = @"PhotosSpecifierID";
          }
        }
        else
        {
          uint64_t v17 = [v12 isEqualToString:@"PHOTOS_MANUAL_SELECTION_GROUP"];

          CFStringRef v15 = @"PhotosGroupSpecifierID";
          if ((v17 & 1) == 0) {
            continue;
          }
        }
        [v10 setProperty:v15 forKey:@"ClarityIDKey"];
        [v4 addObject:v10];
      }
      id v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (!v6)
      {
        id v3 = v19;
        goto LABEL_17;
      }
    }
  }
  obj = CLFLogSettings();
  if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
    -[ClarityUISettingsWrapperController _axHandlePhotosAuthorizationController:]();
  }
LABEL_17:

  return v4;
}

- (void)_updateFooterText:(id)a3
{
  privacySpecifier = self->_privacySpecifier;
  id v5 = a3;
  NSStringFromClass((Class)[(PSSpecifier *)privacySpecifier detailControllerClass]);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if ([v13 isEqualToString:@"PUILocationServicesAuthorizationLevelController"])
  {
    id v6 = +[NSBundle bundleWithIdentifier:@"com.apple.preferences-framework"];
    uint64_t v7 = [v6 localizedStringForKey:@"NEVER_AUTHORIZATION" value:0 table:@"LocationServicesPrivacy"];
    uint64_t v8 = [(PSSpecifier *)self->_privacySpecifier performGetter];
    unint64_t v9 = [v8 isEqualToString:v7] ^ 1;

    goto LABEL_8;
  }
  if ([v13 isEqualToString:@"PSCalendarPolicyAuthorizationLevelController"])
  {
    v10 = [(PSSpecifier *)self->_privacySpecifier performGetter];
    id v6 = v10;
LABEL_6:
    unint64_t v9 = (int)[v10 intValue] > 0;
    goto LABEL_8;
  }
  unsigned int v11 = [v13 isEqualToString:@"PSPhotoServicesAuthorizationLevelController"];
  v10 = [(PSSpecifier *)self->_privacySpecifier performGetter];
  id v6 = v10;
  if (v11) {
    goto LABEL_6;
  }
  unint64_t v9 = (unint64_t)[v10 BOOLValue];
LABEL_8:

  uint64_t v12 = [(ClarityUISettingsWrapperController *)self _axFooterText:v9];
  [v5 setProperty:v12 forKey:PSFooterTextGroupKey];
}

- (id)_axHandleLocationAuthorizationController:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  if (v3)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (!v6) {
      goto LABEL_21;
    }
    id v7 = v6;
    id v19 = v3;
    char v8 = 0;
    uint64_t v9 = *(void *)v23;
    uint64_t v21 = PSIDKey;
    while (1)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        unsigned int v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (![v11 cellType])
        {
          unsigned int v14 = [v11 propertyForKey:v21];
          unsigned __int8 v15 = [v14 isEqualToString:@"LOCATION_SERVICES_AUTH_GROUP"];

          if (v15) {
            continue;
          }
          [v4 addObject:v11];
          goto LABEL_12;
        }
        if (v8)
        {
          uint64_t v12 = [v11 name];
          id v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:"_axSetPreciseLocationEnabled:specifier:" get:"_axPreciseLocationEnabled:" detail:0 cell:6 edit:0];

          [v13 setProperty:@"LocationPreciseSpecifierID" forKey:@"ClarityIDKey"];
          [v4 addObject:v13];

LABEL_12:
          char v8 = 1;
          continue;
        }
        v16 = [v11 identifier];
        unsigned __int8 v17 = [v16 isEqualToString:@"LOCATION_SERVICES_AUTH_NOT_DETERMINED"];

        if ((v17 & 1) == 0)
        {
          [v11 setProperty:@"LocationSpecifierID" forKey:@"ClarityIDKey"];
          [v4 addObject:v11];
        }
        char v8 = 0;
      }
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (!v7)
      {
        id v3 = v19;
        goto LABEL_21;
      }
    }
  }
  id v5 = CLFLogSettings();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[ClarityUISettingsWrapperController _axHandleLocationAuthorizationController:]();
  }
LABEL_21:

  return v4;
}

- (id)_axHandleCalendarAuthorizationController:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "cellType", (void)v12))
          {
            [v10 setProperty:@"CalendarSpecifierID" forKey:@"ClarityIDKey"];
            [v4 addObject:v10];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = CLFLogSettings();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ClarityUISettingsWrapperController _axHandleCalendarAuthorizationController:]();
    }
  }

  return v4;
}

- (id)_axHandleContactsAuthorizationController:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  if (v3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      id v14 = v3;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (![v10 cellType])
          {
            unsigned int v11 = [v10 identifier];
            unsigned __int8 v12 = [v11 isEqualToString:@"LIST_ITEMS_GROUP_SPECIFIER"];

            if (v12) {
              continue;
            }
          }
          [v10 setProperty:@"ContactsSpecifierID" forKey:@"ClarityIDKey"];
          [v4 addObject:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
      id v3 = v14;
    }
  }
  else
  {
    id v5 = CLFLogSettings();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ClarityUISettingsWrapperController _axHandleContactsAuthorizationController:]();
    }
  }

  return v4;
}

- (id)_axSelectSpecifierFromSpecifiers:(id)a3
{
  id v4 = a3;
  cachedSpecifier = self->_cachedSpecifier;
  if (cachedSpecifier)
  {
    id v6 = [(PSSpecifier *)cachedSpecifier identifier];
    unsigned int v7 = [v6 intValue];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v14 = objc_msgSend(v13, "identifier", (void)v18);
          unsigned int v15 = [v14 intValue];

          if (v7 == v15)
          {
            id v16 = v13;
            goto LABEL_12;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    id v16 = 0;
LABEL_12:
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v75.receiver = self;
  v75.super_class = (Class)ClarityUISettingsWrapperController;
  [(ClarityUISettingsWrapperController *)&v75 tableView:v6 didSelectRowAtIndexPath:v7];
  id v8 = [(ClarityUISettingsWrapperController *)self specifierAtIndexPath:v7];
  id v9 = [v8 propertyForKey:@"ClarityIDKey"];
  if (([v9 isEqualToString:@"AllowSpecifierID"] & 1) == 0
    && ![v9 isEqualToString:@"DoNotAllowSpecifierID"])
  {
    if ([v9 isEqualToString:@"LocationPreciseSpecifierID"]) {
      goto LABEL_8;
    }
    if ([v9 isEqualToString:@"LocationSpecifierID"])
    {
      id v67 = v7;
      id v68 = v6;
      long long v13 = [v8 propertyForKey:PSIDKey];
      [(PSSpecifier *)self->_privacySpecifier performSetterWithValue:v13];
      long long v18 = CLFLogSettings();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        privacySpecifier = self->_privacySpecifier;
        long long v20 = [(PSSpecifier *)privacySpecifier performGetter];
        *(_DWORD *)buf = 138412546;
        v78 = privacySpecifier;
        __int16 v79 = 2112;
        v80 = v20;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Specifier: %@, updated value: %@", buf, 0x16u);
      }
      v70 = v9;

      [(ClarityUISettingsWrapperController *)self selectSpecifier:self->_privacySpecifier];
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      v69 = long long v74 = 0u;
      long long v21 = [v69 specifiers];
      id v22 = [v21 countByEnumeratingWithState:&v71 objects:v76 count:16];
      if (v22)
      {
        id v23 = v22;
        v66 = v13;
        v65 = self;
        long long v24 = 0;
        uint64_t v25 = *(void *)v72;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v72 != v25) {
              objc_enumerationMutation(v21);
            }
            v27 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            v28 = [v27 identifier];
            v29 = [v8 identifier];
            unsigned int v30 = [v28 isEqualToString:v29];

            if (v30)
            {
              id v31 = v27;

              long long v24 = v31;
            }
          }
          id v23 = [v21 countByEnumeratingWithState:&v71 objects:v76 count:16];
        }
        while (v23);

        long long v13 = v66;
        if (v24)
        {
          v32 = CLFLogSettings();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v78 = (PSSpecifier *)v24;
            __int16 v79 = 2112;
            v80 = v8;
            _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "Found matching location specifier: %@, for selected specifier: %@", buf, 0x16u);
          }

          v33 = [v69 indexPathForSpecifier:v24];
          v34 = CLFLogSettings();
          id v9 = v70;
          self = v65;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v78 = v33;
            _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "Location Specifier index path: %@", buf, 0xCu);
          }

          [v69 tableView:v68 didSelectRowAtIndexPath:v33];
          v35 = CLFLogSettings();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36 = v65->_privacySpecifier;
            v37 = [(PSSpecifier *)v36 performGetter];
            *(_DWORD *)buf = 138412546;
            v78 = v36;
            __int16 v79 = 2112;
            v80 = v37;
            _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "Specifier: %@, updated value: %@", buf, 0x16u);
          }
          id v7 = v67;
          id v6 = v68;
          goto LABEL_6;
        }
      }
      else
      {
      }
      v47 = CLFLogSettings();
      id v7 = v67;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        -[ClarityUISettingsWrapperController tableView:didSelectRowAtIndexPath:]((uint64_t)v8, v47);
      }

      id v6 = v68;
LABEL_43:
      id v9 = v70;
      goto LABEL_7;
    }
    if ([v9 isEqualToString:@"PhotosSpecifierID"])
    {
      v70 = v9;
      v38 = [v8 propertyForKey:PSIDKey];
      id v39 = [v38 intValue];

      v40 = self->_privacySpecifier;
      v41 = +[NSNumber numberWithInt:v39];
      [(PSSpecifier *)v40 performSetterWithValue:v41];

      if (v39 != 2)
      {
        long long v13 = CLFLogSettings();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v48 = self->_privacySpecifier;
          v49 = [(PSSpecifier *)v48 performGetter];
          *(_DWORD *)buf = 138412546;
          v78 = v48;
          __int16 v79 = 2112;
          v80 = v49;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Specifier: %@, updated value: %@", buf, 0x16u);
        }
        id v9 = v70;
        goto LABEL_6;
      }
      [(ClarityUISettingsWrapperController *)self setCachedSpecifier:v8];
      long long v13 = CLFLogSettings();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = (PSSpecifier *)v8;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Photos Full Access was chosen. Caching specifier until user agrees. Specifier: %@", buf, 0xCu);
      }
      goto LABEL_43;
    }
    if ([v9 isEqualToString:@"CalendarSpecifierID"])
    {
      v42 = [v8 propertyForKey:PSIDKey];
      id v43 = [v42 intValue];

      v44 = [(PSSpecifier *)self->_privacySpecifier performGetter];
      unsigned int v45 = [v44 intValue];

      if (v43 == 2 && v45 == 2)
      {
        v46 = CLFLogSettings();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v46, OS_LOG_TYPE_DEFAULT, "Calendar Full Access was chosen but existing value is already Full Access. Ignoring.", buf, 2u);
        }
LABEL_63:

        long long v13 = CLFLogSettings();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_6;
        }
LABEL_67:
        v63 = self->_privacySpecifier;
        v64 = [(PSSpecifier *)v63 performGetter];
        *(_DWORD *)buf = 138412546;
        v78 = v63;
        __int16 v79 = 2112;
        v80 = v64;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Specifier: %@, updated value: %@", buf, 0x16u);

        goto LABEL_6;
      }
      if (v43 != 2)
      {
        v61 = self->_privacySpecifier;
        v46 = +[NSNumber numberWithInt:v43];
        [(PSSpecifier *)v61 performSetterWithValue:v46];
        goto LABEL_63;
      }
      [(ClarityUISettingsWrapperController *)self setCachedSpecifier:v8];
      v56 = self->_privacySpecifier;
      v57 = +[NSNumber numberWithInt:2];
      [(PSSpecifier *)v56 performSetterWithValue:v57];

      long long v13 = CLFLogSettings();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      *(_DWORD *)buf = 138412290;
      v78 = (PSSpecifier *)v8;
      v58 = "Calendar Full Access was chosen. Caching specifier until user agrees. Specifier: %@";
LABEL_61:
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, v58, buf, 0xCu);
      goto LABEL_7;
    }
    if (![v9 isEqualToString:@"ContactsSpecifierID"])
    {
      long long v13 = [(ClarityUISettingsWrapperController *)self selectSpecifier:self->_privacySpecifier];
      [v13 tableView:v6 didSelectRowAtIndexPath:v7];
      unsigned int v15 = CLFLogSettings();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ClarityUISettingsWrapperController tableView:didSelectRowAtIndexPath:]((uint64_t)v8, (uint64_t *)&self->_privacySpecifier, v15);
      }
      goto LABEL_5;
    }
    v50 = [v8 values];
    v51 = [v50 firstObject];
    id v52 = [v51 intValue];

    v53 = [(PSSpecifier *)self->_privacySpecifier performGetter];
    unsigned int v54 = [v53 intValue];

    if (v52 == 2 && v54 == 2)
    {
      v55 = CLFLogSettings();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v55, OS_LOG_TYPE_DEFAULT, "Contacts Full Access was chosen but existing value is already Full Access. Ignoring.", buf, 2u);
      }
    }
    else
    {
      if (v52 == 2)
      {
        [(ClarityUISettingsWrapperController *)self setCachedSpecifier:v8];
        v59 = self->_privacySpecifier;
        v60 = +[NSNumber numberWithInt:2];
        [(PSSpecifier *)v59 performSetterWithValue:v60];

        long long v13 = CLFLogSettings();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_7;
        }
        *(_DWORD *)buf = 138412290;
        v78 = (PSSpecifier *)v8;
        v58 = "Contacts Full Access was chosen. Caching specifier until user agrees. Specifier: %@";
        goto LABEL_61;
      }
      v62 = self->_privacySpecifier;
      v55 = +[NSNumber numberWithInt:v52];
      [(PSSpecifier *)v62 performSetterWithValue:v55];
    }

    long long v13 = CLFLogSettings();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    goto LABEL_67;
  }
  id v10 = [v9 isEqualToString:@"AllowSpecifierID"];
  uint64_t v11 = self->_privacySpecifier;
  unsigned __int8 v12 = +[NSNumber numberWithBool:v10];
  [(PSSpecifier *)v11 performSetterWithValue:v12];

  long long v13 = CLFLogSettings();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = self->_privacySpecifier;
    unsigned int v15 = [(PSSpecifier *)v14 performGetter];
    *(_DWORD *)buf = 138412546;
    v78 = v14;
    __int16 v79 = 2112;
    v80 = v15;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Specifier: %@, updated value: %@", buf, 0x16u);
LABEL_5:
  }
LABEL_6:

  id v16 = [(ClarityUISettingsWrapperController *)self clarityGroupSpecifier];
  [(ClarityUISettingsWrapperController *)self _updateFooterText:v16];

  long long v17 = [(ClarityUISettingsWrapperController *)self clarityGroupSpecifier];
  [(ClarityUISettingsWrapperController *)self reloadSpecifier:v17];

  long long v13 = [(ClarityUISettingsWrapperController *)self delegate];
  [v13 updateContinueButtonForSpecifier:v8];
LABEL_7:

LABEL_8:
}

- (void)_axSetPreciseLocationEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ClarityUISettingsWrapperController *)self selectSpecifier:self->_privacySpecifier];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = objc_msgSend(v8, "specifiers", 0);
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    unsigned __int8 v12 = 0;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v9);
        }
        unsigned int v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v15 cellType] == (char *)&dword_4 + 2)
        {
          id v16 = v15;

          unsigned __int8 v12 = v16;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v11);

    if (v12)
    {
      [v12 performSetterWithValue:v6];
      long long v17 = CLFLogSettings();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        long long v18 = [v12 performGetter];
        *(_DWORD *)buf = 138412546;
        long long v24 = v12;
        __int16 v25 = 2112;
        v26 = v18;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Precise Location Specifier: %@, updated value: %@", buf, 0x16u);
      }
      goto LABEL_17;
    }
  }
  else
  {
  }
  unsigned __int8 v12 = CLFLogSettings();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[ClarityUISettingsWrapperController _axSetPreciseLocationEnabled:specifier:]();
  }
LABEL_17:
}

- (id)_axPreciseLocationEnabled:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64__ClarityUISettingsWrapperController__axPreciseLocationEnabled___block_invoke;
  block[3] = &unk_2087C0;
  block[4] = self;
  if (_axPreciseLocationEnabled__onceToken != -1) {
    dispatch_once(&_axPreciseLocationEnabled__onceToken, block);
  }
  return &off_2291E0;
}

id __64__ClarityUISettingsWrapperController__axPreciseLocationEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axSetPreciseLocationEnabled:&off_2291E0 specifier:0];
}

- (ClarityUISettingsWrapperControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ClarityUISettingsWrapperControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PSSpecifier)privacySpecifier
{
  return self->_privacySpecifier;
}

- (void)setPrivacySpecifier:(id)a3
{
}

- (PSSpecifier)clarityGroupSpecifier
{
  return self->_clarityGroupSpecifier;
}

- (void)setClarityGroupSpecifier:(id)a3
{
}

- (PSSpecifier)calendarNoneSpecifier
{
  return self->_calendarNoneSpecifier;
}

- (void)setCalendarNoneSpecifier:(id)a3
{
}

- (PSSpecifier)cachedSpecifier
{
  return self->_cachedSpecifier;
}

- (void)setCachedSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSpecifier, 0);
  objc_storeStrong((id *)&self->_calendarNoneSpecifier, 0);
  objc_storeStrong((id *)&self->_clarityGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_privacySpecifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __73__ClarityUISettingsWrapperController__axValidateAuthenticationController__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__ClarityUISettingsWrapperController__axValidateAuthenticationController__block_invoke_355_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__ClarityUISettingsWrapperController__axValidateAuthenticationController__block_invoke_361_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__ClarityUISettingsWrapperController__axValidateAuthenticationController__block_invoke_367_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_axHandlePhotosAuthorizationController:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Received nil specifiers list when trying to create Onboarding for Photos Privacy Authorization Controller.", v2, v3, v4, v5, v6);
}

- (void)_axHandleLocationAuthorizationController:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Received nil specifiers list when trying to create Onboarding for Location Privacy Authorization Controller.", v2, v3, v4, v5, v6);
}

- (void)_axHandleCalendarAuthorizationController:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Received nil specifiers list when trying to create Onboarding for Calendar Privacy Authorization Controller.", v2, v3, v4, v5, v6);
}

- (void)_axHandleContactsAuthorizationController:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Received nil specifiers list when trying to create Onboarding for Contacts Privacy Authorization Controller.", v2, v3, v4, v5, v6);
}

- (void)tableView:(uint64_t)a1 didSelectRowAtIndexPath:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Did not found matching location specifier for selected specifier: %@", (uint8_t *)&v2, 0xCu);
}

- (void)tableView:(os_log_t)log didSelectRowAtIndexPath:.cold.2(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unknown specifier id selected for privacy specifier. Specifier: %@. Privacy Specifier: %@", (uint8_t *)&v4, 0x16u);
}

- (void)_axSetPreciseLocationEnabled:specifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Did not find precise location specifier! Can't forward the new value.", v2, v3, v4, v5, v6);
}

@end