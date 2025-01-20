@interface FCUISettingsAvailabilityStatusListController
- (FCUISettingsAvailabilityStatusListController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_availabilityStatus:(id)a3;
- (id)specifiers;
- (void)_setAvailabilityStatus:(id)a3 specifier:(id)a4;
@end

@implementation FCUISettingsAvailabilityStatusListController

- (FCUISettingsAvailabilityStatusListController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)FCUISettingsAvailabilityStatusListController;
  v4 = [(FCUISettingsAvailabilityStatusListController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = +[DNDGlobalConfigurationService serviceForClientIdentifier:@"com.apple.donotdisturb.preferences"];
    globalConfigurationService = v4->_globalConfigurationService;
    v4->_globalConfigurationService = (DNDGlobalConfigurationService *)v5;
  }
  return v4;
}

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v32 = OBJC_IVAR___PSListController__specifiers;
    v38 = self;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v5 = +[PSSpecifier emptyGroupSpecifier];
    v6 = +[NSBundle fcui_focusSettingsLocalizationBundle];
    v7 = [v6 localizedStringForKey:@"AVAILABILITY_STATUS_EXPLANATION" value:&stru_1D300 table:0];
    uint64_t v8 = PSFooterTextGroupKey;
    [v5 setProperty:v7 forKey:PSFooterTextGroupKey];

    v31 = v5;
    [v4 addObject:v5];
    v9 = +[PSSpecifier emptyGroupSpecifier];
    v10 = +[NSBundle fcui_focusSettingsLocalizationBundle];
    v11 = [v10 localizedStringForKey:@"AVAILABILITY_STATUS_SHARING_HEADER" value:&stru_1D300 table:0];
    [v9 setName:v11];

    v12 = +[NSBundle fcui_focusSettingsLocalizationBundle];
    v13 = [v12 localizedStringForKey:@"AVAILABILITY_STATUS_APP_LIST_FOOTER" value:&stru_1D300 table:0];
    [v9 setProperty:v13 forKey:v8];

    v37 = v4;
    v30 = v9;
    [v4 addObject:v9];
    v14 = (void *)TCCAccessCopyInformation();
    v15 = (void *)TCCAccessCopyBundleIdentifiersForService();
    v36 = +[NSSet setWithArray:v15];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v14;
    id v16 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v40;
      uint64_t v35 = PSLazyIconLoading;
      uint64_t v34 = PSLazyIconAppID;
      uint64_t v19 = PSValueKey;
      do
      {
        v20 = 0;
        do
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(obj);
          }
          v21 = (__CFBundle *)[*(id *)(*((void *)&v39 + 1) + 8 * (void)v20) objectForKey:kTCCInfoBundle];
          if (v21)
          {
            v22 = CFBundleGetIdentifier(v21);
            id v23 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v22 allowPlaceholder:0 error:0];
            v24 = [v23 localizedName];
            v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:v38 set:"_setAvailabilityStatus:specifier:" get:"_availabilityStatus:" detail:0 cell:6 edit:0];

            [v25 setProperty:&__kCFBooleanTrue forKey:v35];
            [v25 setProperty:v22 forKey:@"appBundleID"];
            [v25 setProperty:v22 forKey:v34];
            v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v36 containsObject:v22]);
            [v25 setProperty:v26 forKey:v19];

            [v37 addObject:v25];
          }
          v20 = (char *)v20 + 1;
        }
        while (v17 != v20);
        id v17 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v17);
    }

    id v27 = [v37 copy];
    v28 = *(void **)&v38->PSListController_opaque[v32];
    *(void *)&v38->PSListController_opaque[v32] = v27;

    v3 = *(void **)&v38->PSListController_opaque[v32];
  }

  return v3;
}

- (id)_availabilityStatus:(id)a3
{
  return [a3 propertyForKey:PSValueKey];
}

- (void)_setAvailabilityStatus:(id)a3 specifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = PSValueKey;
  uint64_t v8 = [v6 propertyForKey:PSValueKey];
  unsigned __int8 v9 = [v11 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    v10 = [v6 propertyForKey:@"appBundleID"];
    [v11 BOOLValue];
    TCCAccessSetForBundleId();
    [(DNDGlobalConfigurationService *)self->_globalConfigurationService didChangeFocusStatusSharingSettingForApplicationIdentifier:v10];
    [v6 setProperty:v11 forKey:v7];
  }
}

- (void).cxx_destruct
{
}

@end