@interface VSDeveloperSettingsViewController_iOS
- (BOOL)hasLoadedInitialSettings;
- (BOOL)providersDirty;
- (NSArray)providerSpecifiers;
- (NSNumber)disableRequestTimeouts;
- (NSNumber)enableCacheBuster;
- (NSNumber)simulateExpiredToken;
- (NSOperationQueue)privateQueue;
- (PSSpecifier)cacheBusterSpecifier;
- (PSSpecifier)requestTimeoutsSpecifier;
- (PSSpecifier)simulateExpiredTokenSpecifier;
- (VSDeveloperSettingsFacade)settingsFacade;
- (VSDeveloperSettingsViewController_iOS)init;
- (VSDeveloperSettingsViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4;
- (id)providerForUniqueID:(id)a3;
- (id)specifiers;
- (void)addProviderSelected;
- (void)dealloc;
- (void)developerProvidersDidChange;
- (void)developerSettingsDidChange;
- (void)setCacheBusterSpecifier:(id)a3;
- (void)setDisableRequestTimeouts:(id)a3;
- (void)setEnableCacheBuster:(id)a3;
- (void)setHasLoadedInitialSettings:(BOOL)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setProviderSpecifiers:(id)a3;
- (void)setProvidersDirty:(BOOL)a3;
- (void)setRequestTimeoutsSpecifier:(id)a3;
- (void)setSettingsFacade:(id)a3;
- (void)setSimulateExpiredToken:(id)a3;
- (void)setSimulateExpiredTokenSpecifier:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VSDeveloperSettingsViewController_iOS

- (VSDeveloperSettingsViewController_iOS)init
{
  return [(VSDeveloperSettingsViewController_iOS *)self initWithNibName:0 bundle:0];
}

- (VSDeveloperSettingsViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)VSDeveloperSettingsViewController_iOS;
  v4 = [(VSDeveloperSettingsViewController_iOS *)&v15 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"developerSettingsDidChange" name:@"VSDeveloperSettingsFacadeSettingsDidUpdateNotification" object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v4 selector:"developerProvidersDidChange" name:@"VSDeveloperSettingsFacadeProvidersDidUpdateNotification" object:0];

    v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    privateQueue = v4->_privateQueue;
    v4->_privateQueue = v7;

    v9 = v4->_privateQueue;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [(NSOperationQueue *)v9 setName:v11];

    v4->_hasLoadedInitialSettings = 0;
    v4->_providersDirty = 1;
    uint64_t v12 = +[VSDeveloperSettingsFacade sharedFacade];
    settingsFacade = v4->_settingsFacade;
    v4->_settingsFacade = (VSDeveloperSettingsFacade *)v12;
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VSDeveloperSettingsViewController_iOS;
  [(VSDeveloperSettingsViewController_iOS *)&v6 viewWillAppear:a3];
  v4 = [(VSDeveloperSettingsViewController_iOS *)self settingsFacade];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5860;
  v5[3] = &unk_C6E0;
  v5[4] = self;
  [v4 fetchDeveloperSettingsWithCompletionHandler:v5];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)VSDeveloperSettingsViewController_iOS;
  [(VSDeveloperSettingsViewController_iOS *)&v2 dealloc];
}

- (void)setEnableCacheBuster:(id)a3
{
  v4 = (NSNumber *)a3;
  id v5 = [(NSNumber *)self->_enableCacheBuster copy];
  enableCacheBuster = self->_enableCacheBuster;
  self->_enableCacheBuster = v4;
  v7 = v4;

  v8 = [(VSDeveloperSettingsViewController_iOS *)self settingsFacade];
  v9 = [v8 settings];
  id v10 = [v9 copy];

  objc_msgSend(v10, "setCacheBusterEnabled:", -[NSNumber BOOLValue](v7, "BOOLValue"));
  v11 = [(VSDeveloperSettingsViewController_iOS *)self settingsFacade];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_5B94;
  v13[3] = &unk_C770;
  v13[4] = self;
  id v14 = v5;
  id v12 = v5;
  [v11 updateDeveloperSettings:v10 withCompletionHandler:v13];
}

- (void)setDisableRequestTimeouts:(id)a3
{
  v4 = (NSNumber *)a3;
  id v5 = [(NSNumber *)self->_disableRequestTimeouts copy];
  disableRequestTimeouts = self->_disableRequestTimeouts;
  self->_disableRequestTimeouts = v4;
  v7 = v4;

  v8 = [(VSDeveloperSettingsViewController_iOS *)self settingsFacade];
  v9 = [v8 settings];
  id v10 = [v9 copy];

  objc_msgSend(v10, "setRequestTimeoutsDisabled:", -[NSNumber BOOLValue](v7, "BOOLValue"));
  v11 = [(VSDeveloperSettingsViewController_iOS *)self settingsFacade];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_5E40;
  v13[3] = &unk_C770;
  v13[4] = self;
  id v14 = v5;
  id v12 = v5;
  [v11 updateDeveloperSettings:v10 withCompletionHandler:v13];
}

- (void)setSimulateExpiredToken:(id)a3
{
  v4 = (NSNumber *)a3;
  id v5 = [(NSNumber *)self->_simulateExpiredToken copy];
  simulateExpiredToken = self->_simulateExpiredToken;
  self->_simulateExpiredToken = v4;
  v7 = v4;

  v8 = [(VSDeveloperSettingsViewController_iOS *)self settingsFacade];
  v9 = [v8 settings];
  id v10 = [v9 copy];

  objc_msgSend(v10, "setSimulateExpiredToken:", -[NSNumber BOOLValue](v7, "BOOLValue"));
  v11 = [(VSDeveloperSettingsViewController_iOS *)self settingsFacade];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_60EC;
  v13[3] = &unk_C770;
  v13[4] = self;
  id v14 = v5;
  id v12 = v5;
  [v11 updateDeveloperSettings:v10 withCompletionHandler:v13];
}

- (void)addProviderSelected
{
  v3 = +[NSBundle vs_frameworkBundle];
  id v6 = [v3 localizedStringForKey:@"IDENTITY_PROVIDER_PICKER_OTHER_PROVIDERS_ROW_TITLE_DEVELOPER" value:0 table:0];

  v4 = objc_alloc_init(VSDeveloperIdentityProviderViewController_iOS);
  [(VSDeveloperIdentityProviderViewController_iOS *)v4 setTitle:v6];
  id v5 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];
  [v5 setModalPresentationStyle:2];
  [(VSDeveloperSettingsViewController_iOS *)self presentViewController:v5 animated:1 completion:0];
}

- (id)providerForUniqueID:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(VSDeveloperSettingsViewController_iOS *)self settingsFacade];
  id v6 = [v5 providers];

  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 uniqueID];
        id v12 = [v11 forceUnwrapObject];
        unsigned int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (NSArray)providerSpecifiers
{
  if ([(VSDeveloperSettingsViewController_iOS *)self providersDirty])
  {
    v3 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = [(VSDeveloperSettingsViewController_iOS *)self settingsFacade];
    id v5 = [v4 providers];

    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v11 = [v10 displayName];
          id v12 = [v11 forceUnwrapObject];

          unsigned int v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
          id v14 = [v10 uniqueID];
          long long v15 = [v14 forceUnwrapObject];
          [v13 setIdentifier:v15];

          [(NSArray *)v3 addObject:v13];
        }
        id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    providerSpecifiers = self->_providerSpecifiers;
    self->_providerSpecifiers = v3;
  }
  long long v17 = self->_providerSpecifiers;

  return v17;
}

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v52 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v5 = +[NSBundle vs_frameworkBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"DEVELOPER_IS_CACHEBUSTER_ENABLED_ACTION_DESCRIPTION" value:0 table:0];

    id v7 = +[NSBundle vs_frameworkBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"DEVELOPER_OPTIONS_GROUP_TITLE" value:0 table:0];

    v50 = (void *)v8;
    v9 = +[PSSpecifier groupSpecifierWithName:v8];
    uint64_t v10 = PSFooterTextGroupKey;
    v51 = (void *)v6;
    uint64_t v42 = PSFooterTextGroupKey;
    [v9 setProperty:v6 forKey:PSFooterTextGroupKey];
    v49 = v9;
    [v4 addObject:v9];
    v11 = +[NSBundle vs_frameworkBundle];
    uint64_t v12 = [v11 localizedStringForKey:@"DEVELOPER_IS_CACHEBUSTER_ENABLED_ACTION_TITLE" value:0 table:0];

    v48 = (void *)v12;
    unsigned int v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:"setEnableCacheBuster:" get:"enableCacheBuster" detail:0 cell:6 edit:0];
    [(VSDeveloperSettingsViewController_iOS *)self setCacheBusterSpecifier:v13];
    id v14 = +[NSNumber numberWithInt:[(VSDeveloperSettingsViewController_iOS *)self hasLoadedInitialSettings] ^ 1];
    uint64_t v15 = PSControlIsLoadingKey;
    [v13 setProperty:v14 forKey:PSControlIsLoadingKey];

    uint64_t v16 = PSDefaultValueKey;
    [v13 setProperty:&__kCFBooleanFalse forKey:PSDefaultValueKey];
    v47 = v13;
    [v4 addObject:v13];
    long long v17 = +[NSBundle vs_frameworkBundle];
    uint64_t v18 = [v17 localizedStringForKey:@"DEVELOPER_REQUEST_TIMEOUTS_DESCRIPTION" value:0 table:0];

    long long v19 = +[PSSpecifier groupSpecifierWithName:0];
    v46 = (void *)v18;
    [v19 setProperty:v18 forKey:v10];
    v45 = v19;
    [v4 addObject:v19];
    long long v20 = +[NSBundle vs_frameworkBundle];
    uint64_t v21 = [v20 localizedStringForKey:@"DEVELOPER_REQUEST_TIMEOUTS_TITLE" value:0 table:0];

    v44 = (void *)v21;
    long long v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:self set:"setDisableRequestTimeouts:" get:"disableRequestTimeouts" detail:0 cell:6 edit:0];
    [(VSDeveloperSettingsViewController_iOS *)self setRequestTimeoutsSpecifier:v22];
    v23 = +[NSNumber numberWithInt:[(VSDeveloperSettingsViewController_iOS *)self hasLoadedInitialSettings] ^ 1];
    [v22 setProperty:v23 forKey:v15];

    [v22 setProperty:&__kCFBooleanTrue forKey:v16];
    [v4 addObject:v22];
    v24 = +[NSBundle vs_frameworkBundle];
    uint64_t v25 = [v24 localizedStringForKey:@"DEVELOPER_SIMULATE_EXPIRED_TOKEN_TITLE" value:0 table:0];

    v26 = +[NSBundle vs_frameworkBundle];
    uint64_t v27 = [v26 localizedStringForKey:@"DEVELOPER_SIMULATE_EXPIRED_TOKEN_DESCRIPTION" value:0 table:0];

    v28 = +[PSSpecifier groupSpecifierWithName:0];
    v41 = (void *)v27;
    [v28 setProperty:v27 forKey:v42];
    [v4 addObject:v28];
    v43 = (void *)v25;
    v29 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:"setSimulateExpiredToken:" get:"simulateExpiredToken" detail:0 cell:6 edit:0];
    [(VSDeveloperSettingsViewController_iOS *)self setSimulateExpiredTokenSpecifier:v29];
    v30 = +[NSNumber numberWithInt:[(VSDeveloperSettingsViewController_iOS *)self hasLoadedInitialSettings] ^ 1];
    [v29 setProperty:v30 forKey:v15];

    [v29 setProperty:&__kCFBooleanFalse forKey:v16];
    [v4 addObject:v29];
    v31 = +[NSBundle vs_frameworkBundle];
    v32 = [v31 localizedStringForKey:@"DEVELOPER_PROVIDERS_TITLE" value:0 table:0];

    v33 = +[PSSpecifier groupSpecifierWithName:v32];
    [v4 addObject:v33];
    v34 = [(VSDeveloperSettingsViewController_iOS *)self providerSpecifiers];
    if ([v34 count])
    {
      [v4 addObjectsFromArray:v34];
      v35 = +[PSSpecifier groupSpecifierWithName:0];
      [v4 addObject:v35];
    }
    v36 = +[NSBundle vs_frameworkBundle];
    v37 = [v36 localizedStringForKey:@"IDENTITY_PROVIDER_PICKER_OTHER_PROVIDERS_ROW_TITLE_DEVELOPER" value:0 table:0];

    v38 = +[PSSpecifier preferenceSpecifierNamed:v37 target:self set:0 get:0 detail:0 cell:13 edit:0];
    [v38 setButtonAction:"addProviderSelected"];
    [v38 setProperty:&off_CD88 forKey:PSAlignmentKey];
    [v4 addObject:v38];
    v39 = *(void **)&self->PSListController_opaque[v52];
    *(void *)&self->PSListController_opaque[v52] = v4;

    v3 = *(void **)&self->PSListController_opaque[v52];
  }

  return v3;
}

- (void)developerSettingsDidChange
{
  v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Received developer settings did change notification.", v23, 2u);
  }

  [(VSDeveloperSettingsViewController_iOS *)self setHasLoadedInitialSettings:1];
  id v4 = [(VSDeveloperSettingsViewController_iOS *)self settingsFacade];
  id v5 = [v4 settings];
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 cacheBusterEnabled]);
  uint64_t v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  enableCacheBuster = self->_enableCacheBuster;
  self->_enableCacheBuster = v6;

  uint64_t v8 = [(VSDeveloperSettingsViewController_iOS *)self settingsFacade];
  v9 = [v8 settings];
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 requestTimeoutsDisabled]);
  uint64_t v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  disableRequestTimeouts = self->_disableRequestTimeouts;
  self->_disableRequestTimeouts = v10;

  uint64_t v12 = [(VSDeveloperSettingsViewController_iOS *)self settingsFacade];
  unsigned int v13 = [v12 settings];
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 simulateExpiredToken]);
  id v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  simulateExpiredToken = self->_simulateExpiredToken;
  self->_simulateExpiredToken = v14;

  uint64_t v16 = [(VSDeveloperSettingsViewController_iOS *)self cacheBusterSpecifier];
  uint64_t v17 = PSControlIsLoadingKey;
  [v16 setProperty:&__kCFBooleanFalse forKey:PSControlIsLoadingKey];

  uint64_t v18 = [(VSDeveloperSettingsViewController_iOS *)self cacheBusterSpecifier];
  [(VSDeveloperSettingsViewController_iOS *)self reloadSpecifier:v18];

  long long v19 = [(VSDeveloperSettingsViewController_iOS *)self requestTimeoutsSpecifier];
  [v19 setProperty:&__kCFBooleanFalse forKey:v17];

  long long v20 = [(VSDeveloperSettingsViewController_iOS *)self requestTimeoutsSpecifier];
  [(VSDeveloperSettingsViewController_iOS *)self reloadSpecifier:v20];

  uint64_t v21 = [(VSDeveloperSettingsViewController_iOS *)self simulateExpiredTokenSpecifier];
  [v21 setProperty:&__kCFBooleanFalse forKey:v17];

  long long v22 = [(VSDeveloperSettingsViewController_iOS *)self simulateExpiredTokenSpecifier];
  [(VSDeveloperSettingsViewController_iOS *)self reloadSpecifier:v22];
}

- (void)developerProvidersDidChange
{
  [(VSDeveloperSettingsViewController_iOS *)self setProvidersDirty:1];

  [(VSDeveloperSettingsViewController_iOS *)self reloadSpecifiers];
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (VSDeveloperSettingsFacade)settingsFacade
{
  return self->_settingsFacade;
}

- (void)setSettingsFacade:(id)a3
{
}

- (BOOL)hasLoadedInitialSettings
{
  return self->_hasLoadedInitialSettings;
}

- (void)setHasLoadedInitialSettings:(BOOL)a3
{
  self->_hasLoadedInitialSettings = a3;
}

- (NSNumber)enableCacheBuster
{
  return self->_enableCacheBuster;
}

- (NSNumber)disableRequestTimeouts
{
  return self->_disableRequestTimeouts;
}

- (NSNumber)simulateExpiredToken
{
  return self->_simulateExpiredToken;
}

- (PSSpecifier)cacheBusterSpecifier
{
  return self->_cacheBusterSpecifier;
}

- (void)setCacheBusterSpecifier:(id)a3
{
}

- (PSSpecifier)requestTimeoutsSpecifier
{
  return self->_requestTimeoutsSpecifier;
}

- (void)setRequestTimeoutsSpecifier:(id)a3
{
}

- (PSSpecifier)simulateExpiredTokenSpecifier
{
  return self->_simulateExpiredTokenSpecifier;
}

- (void)setSimulateExpiredTokenSpecifier:(id)a3
{
}

- (BOOL)providersDirty
{
  return self->_providersDirty;
}

- (void)setProvidersDirty:(BOOL)a3
{
  self->_providersDirty = a3;
}

- (void)setProviderSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerSpecifiers, 0);
  objc_storeStrong((id *)&self->_simulateExpiredTokenSpecifier, 0);
  objc_storeStrong((id *)&self->_requestTimeoutsSpecifier, 0);
  objc_storeStrong((id *)&self->_cacheBusterSpecifier, 0);
  objc_storeStrong((id *)&self->_simulateExpiredToken, 0);
  objc_storeStrong((id *)&self->_disableRequestTimeouts, 0);
  objc_storeStrong((id *)&self->_enableCacheBuster, 0);
  objc_storeStrong((id *)&self->_settingsFacade, 0);

  objc_storeStrong((id *)&self->_privateQueue, 0);
}

@end