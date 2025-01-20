@interface ExtensionsSettingsPane
+ (OS_os_log)log;
- (PSListController)parentListController;
- (id)_valueOfExtensionSpecifier:(id)a3;
- (id)specifiers;
- (void)_handleExtensionsAdded:(id)a3;
- (void)_handleExtensionsRemoved:(id)a3;
- (void)_registerForExtensionsIfNeeded;
- (void)extensionsNoLongerMatching:(id)a3;
- (void)setParentListController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation ExtensionsSettingsPane

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_94C0;
  block[3] = &unk_38B80;
  block[4] = a1;
  if (qword_40AA8 != -1) {
    dispatch_once(&qword_40AA8, block);
  }
  v2 = (void *)qword_40AA0;

  return (OS_os_log *)v2;
}

- (id)specifiers
{
  [(ExtensionsSettingsPane *)self _registerForExtensionsIfNeeded];
  v3 = self;
  v4 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v5 = *v4;
  if (!*v4)
  {
    v34 = v3;
    v28 = v4;
    id v33 = objc_alloc_init((Class)NSMutableArray);
    objc_storeStrong(v4, v33);
    v29 = +[PSSpecifier groupSpecifierWithID:@"ExtensionHeaderSpecifier"];
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"INSTALLED_EXTENSIONS_HEADER" value:&stru_39200 table:@"Preferences"];
    [v29 setName:v7];

    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"INSTALLED_EXTENSIONS_FOOTER" value:&stru_39200 table:@"Preferences"];
    [v29 setProperty:v9 forKey:PSFooterTextGroupKey];

    [v33 addObject:v29];
    if ([(NSMutableArray *)v34->_remoteExtensions count])
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      obj = v34->_remoteExtensions;
      id v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v10)
      {
        uint64_t v32 = *(void *)v36;
        uint64_t v31 = PSIconImageKey;
        uint64_t v11 = PSEnabledKey;
        uint64_t v12 = PSPrioritizeValueTextDisplayKey;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v36 != v32) {
              objc_enumerationMutation(obj);
            }
            v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            v15 = [v14 displayName];
            v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:v34 set:0 get:"_valueOfExtensionSpecifier:" detail:objc_opt_class() cell:2 edit:0];

            v17 = [v14 menuIcon];
            [v16 setProperty:v17 forKey:v31];

            [v16 setProperty:&__kCFBooleanTrue forKey:v11];
            [v16 setProperty:&__kCFBooleanTrue forKey:v12];
            CFStringRef v39 = @"EXTENSION_IDENIFIER";
            v18 = [v14 extensionID];
            v40 = v18;
            v19 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
            [v16 setUserInfo:v19];

            [v33 addObject:v16];
          }
          id v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v35 objects:v41 count:16];
        }
        while (v10);
      }
    }
    else
    {
      v20 = +[NSBundle bundleForClass:objc_opt_class()];
      v21 = [v20 localizedStringForKey:@"NO_EXTENSIONS_INSTALLED" value:&stru_39200 table:@"Preferences"];
      [v29 setName:v21];
    }
    v22 = +[PSSpecifier groupSpecifierWithID:@"MoreExtensionsButtonGroup"];
    [v33 addObject:v22];
    id v23 = objc_alloc((Class)PSSpecifier);
    v24 = +[NSBundle bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"MORE_EXTENSIONS" value:&stru_39200 table:@"Preferences"];
    id v26 = [v23 initWithName:v25 target:v34 set:0 get:0 detail:0 cell:13 edit:0];

    [v26 setButtonAction:"_moreExtensionsButtonTapped:"];
    [v33 addObject:v26];

    id v5 = *v28;
  }

  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ExtensionsSettingsPane;
  [(ExtensionsSettingsPane *)&v5 viewDidAppear:a3];
  v4 = [(ExtensionsSettingsPane *)self parentController];
  [(ExtensionsSettingsPane *)self setParentListController:v4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ExtensionsSettingsPane;
  [(ExtensionsSettingsPane *)&v4 viewDidDisappear:a3];
  [(ExtensionsSettingsPane *)self setParentListController:0];
}

- (id)_valueOfExtensionSpecifier:(id)a3
{
  v3 = [a3 userInfo];
  objc_super v4 = [v3 objectForKeyedSubscript:@"EXTENSION_IDENIFIER"];
  objc_super v5 = +[MEAppExtensionsController sharedInstance];
  v6 = [v5 extensionForIdentifier:v4];

  if ([v6 isEnabled])
  {
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    [v7 localizedStringForKey:@"EXTENSION_ON" value:&stru_39200 table:@"Preferences"];
  }
  else
  {
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    [v7 localizedStringForKey:@"EXTENSION_OFF" value:&stru_39200 table:@"Preferences"];
  v8 = };

  return v8;
}

- (void)_registerForExtensionsIfNeeded
{
  if (!self->_remoteExtensions)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    remoteExtensions = self->_remoteExtensions;
    self->_remoteExtensions = v3;

    objc_super v5 = (EFCancelationToken *)objc_alloc_init((Class)EFCancelationToken);
    extensionsObserverCancelable = self->_extensionsObserverCancelable;
    self->_extensionsObserverCancelable = v5;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v7 = +[MEAppExtensionsController sharedInstance];
    v8 = +[MERemoteExtension allCapabilities];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_9ECC;
    v9[3] = &unk_38BB0;
    objc_copyWeak(&v10, &location);
    [v7 registerMailAppExtensionsObserver:self capabilities:v8 includeDisabled:1 completion:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)_handleExtensionsAdded:(id)a3
{
  v6 = self;
  id v3 = a3;
  id v7 = v3;
  objc_super v4 = +[EFScheduler mainThreadScheduler];
  [v4 performSyncBlock:&v5];
}

- (void)_handleExtensionsRemoved:(id)a3
{
  v6 = self;
  id v3 = a3;
  id v7 = v3;
  objc_super v4 = +[EFScheduler mainThreadScheduler];
  [v4 performSyncBlock:&v5];
}

- (void)extensionsNoLongerMatching:(id)a3
{
}

- (PSListController)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentListController);

  return (PSListController *)WeakRetained;
}

- (void)setParentListController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentListController);
  objc_storeStrong((id *)&self->_remoteExtensions, 0);
  objc_storeStrong((id *)&self->_extensionsObserverCancelable, 0);

  objc_storeStrong((id *)&self->_extensionsController, 0);
}

@end