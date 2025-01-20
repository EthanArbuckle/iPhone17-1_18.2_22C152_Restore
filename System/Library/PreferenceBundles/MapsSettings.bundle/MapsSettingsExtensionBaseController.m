@interface MapsSettingsExtensionBaseController
- (BOOL)_countAndIdentifiersOfApplications:(id)a3 matchCountAndIdentifiersOfApplications:(id)a4;
- (BOOL)hasInstalledApplications;
- (MapsSettingsExtensionBaseController)initWithNibName:(id)a3 bundle:(id)a4;
- (MapsSettingsExtensionBaseController)initWithUpdateHandler:(id)a3;
- (NSArray)applications;
- (_MXExtensionManager)extensionManager;
- (id)_extensionEnabled:(id)a3;
- (id)_extensionEnabled:(id)a3 applications:(id)a4;
- (id)extensionLookupPolicy;
- (id)localizedExtensionsFooter;
- (id)localizedExtensionsHeader;
- (id)specifiers;
- (id)updateHandler;
- (void)_callUpdateHandler;
- (void)_setExtensionEnabled:(id)a3 specifier:(id)a4;
- (void)_setExtensionEnabled:(id)a3 specifier:(id)a4 applications:(id)a5;
- (void)_setupExtensionManager;
- (void)setApplications:(id)a3;
- (void)setExtensionManager:(id)a3;
- (void)setUpdateHandler:(id)a3;
@end

@implementation MapsSettingsExtensionBaseController

- (BOOL)hasInstalledApplications
{
  v2 = [(MapsSettingsExtensionBaseController *)self applications];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (MapsSettingsExtensionBaseController)initWithUpdateHandler:(id)a3
{
  id v4 = a3;
  v5 = [(MapsSettingsExtensionBaseController *)self initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(MapsSettingsExtensionBaseController *)v5 setUpdateHandler:v4];
  }

  return v6;
}

- (MapsSettingsExtensionBaseController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MapsSettingsExtensionBaseController;
  id v4 = [(MapsSettingBaseController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(MapsSettingsExtensionBaseController *)v4 _setupExtensionManager];
  }
  return v5;
}

- (void)_callUpdateHandler
{
  BOOL v3 = [(MapsSettingsExtensionBaseController *)self updateHandler];

  if (v3)
  {
    id v4 = [(MapsSettingsExtensionBaseController *)self updateHandler];
    v4[2]();
  }
}

- (id)specifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(MapsSettingsExtensionBaseController *)self applications];
  id v5 = [v4 count];

  if (v5)
  {
    v6 = [(MapsSettingsExtensionBaseController *)self localizedExtensionsHeader];
    objc_super v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    v8 = [(MapsSettingsExtensionBaseController *)self localizedExtensionsFooter];
    [v7 setProperty:v8 forKey:PSFooterTextGroupKey];

    [v3 addObject:v7];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [(MapsSettingsExtensionBaseController *)self applications];
    id v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      id v10 = v9;
      v21 = v7;
      v11 = 0;
      uint64_t v23 = *(void *)v26;
      v24 = self;
      uint64_t v12 = PSIconImageKey;
      do
      {
        v13 = 0;
        v14 = v11;
        do
        {
          v15 = v3;
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v13);
          v17 = [v16 displayName];
          v11 = +[PSSpecifier preferenceSpecifierNamed:v17 target:v24 set:"_setExtensionEnabled:specifier:" get:"_extensionEnabled:" detail:0 cell:6 edit:0];

          v18 = [v16 displayImage];
          [v11 setProperty:v18 forKey:v12];
          v19 = [v16 identifier];
          [v11 setIdentifier:v19];

          id v3 = v15;
          [v15 addObject:v11];

          v13 = (char *)v13 + 1;
          v14 = v11;
        }
        while (v10 != v13);
        id v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);

      self = v24;
      objc_super v7 = v21;
    }
  }
  [(MapsSettingsExtensionBaseController *)self setSpecifiers:v3];

  return v3;
}

- (id)extensionLookupPolicy
{
  return 0;
}

- (void)_setupExtensionManager
{
  objc_initWeak(&location, self);
  id v3 = [(MapsSettingsExtensionBaseController *)self extensionLookupPolicy];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1B0F8;
  v6[3] = &unk_72700;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = +[_MXExtensionManager managerWithExtensionLookupPolicy:v3 updateHandler:v6];
  id v5 = *(void **)(&self->super + 1);
  *(void *)(&self->super + 1) = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (BOOL)_countAndIdentifiersOfApplications:(id)a3 matchCountAndIdentifiersOfApplications:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 count];
  if (v7 == [v6 count])
  {
    v8 = [v5 valueForKey:@"identifier"];
    id v9 = [v6 valueForKey:@"identifier"];
    unsigned __int8 v10 = [v8 isEqualToArray:v9];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)_setExtensionEnabled:(id)a3 specifier:(id)a4
{
}

- (id)_extensionEnabled:(id)a3
{
  return [(MapsSettingsExtensionBaseController *)self _extensionEnabled:a3 applications:*(_MXExtensionManager **)((char *)&self->_extensionManager + 3)];
}

- (void)_setExtensionEnabled:(id)a3 specifier:(id)a4 applications:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1B594;
  v23[3] = &unk_72728;
  id v10 = v8;
  id v24 = v10;
  id v11 = [v9 indexOfObjectPassingTest:v23];
  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = [v9 objectAtIndexedSubscript:v11];
    objc_msgSend(v12, "setEnabled:", objc_msgSend(v7, "BOOLValue"));
    if (([v12 isEnabled] & 1) == 0)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v13 = objc_msgSend(v12, "extensions", 0);
      id v14 = [v13 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v20;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v20 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = [*(id *)(*((void *)&v19 + 1) + 8 * i) extension];
            [v18 _kill:9];
          }
          id v15 = [v13 countByEnumeratingWithState:&v19 objects:v25 count:16];
        }
        while (v15);
      }
    }
  }
}

- (id)_extensionEnabled:(id)a3 applications:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1B708;
  v12[3] = &unk_72728;
  id v7 = v5;
  id v13 = v7;
  id v8 = [v6 indexOfObjectPassingTest:v12];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = &__kCFBooleanFalse;
  }
  else
  {
    id v10 = [v6 objectAtIndexedSubscript:v8];
    id v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 isEnabled]);
  }

  return v9;
}

- (id)localizedExtensionsHeader
{
  return 0;
}

- (id)localizedExtensionsFooter
{
  return 0;
}

- (_MXExtensionManager)extensionManager
{
  return *(_MXExtensionManager **)(&self->super + 1);
}

- (void)setExtensionManager:(id)a3
{
}

- (NSArray)applications
{
  return *(NSArray **)((char *)&self->_extensionManager + 3);
}

- (void)setApplications:(id)a3
{
}

- (id)updateHandler
{
  return *(NSArray **)((char *)&self->_applications + 3);
}

- (void)setUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_applications + 3), 0);
  objc_storeStrong((id *)((char *)&self->_extensionManager + 3), 0);

  objc_storeStrong((id *)(&self->super + 1), 0);
}

@end