@interface CPSDeveloperSettingsLocalOverrideController
- (id)_loadOverrideSpecifiers;
- (id)specifiers;
- (void)addURLOverride:(id)a3;
@end

@implementation CPSDeveloperSettingsLocalOverrideController

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [(CPSDeveloperSettingsLocalOverrideController *)self loadSpecifiersFromPlistName:@"DeveloperSettings" target:self bundle:v6];

    v8 = [(CPSDeveloperSettingsLocalOverrideController *)self _loadOverrideSpecifiers];
    if ([v8 count])
    {
      v9 = [v7 specifierForID:@"URL_OVERRIDES"];
      objc_msgSend(v7, "ps_insertObjectsFromArray:afterObject:", v8, v9);
    }
    v10 = *(void **)&self->PSListController_opaque[v2];
    *(void *)&self->PSListController_opaque[v2] = v7;
    id v11 = v7;

    id v4 = *(id *)&self->PSListController_opaque[v2];
  }

  return v4;
}

- (id)_loadOverrideSpecifiers
{
  uint64_t v2 = +[CPSDeveloperOverride allOverrides];
  v3 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = v2;
  id v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v9 = [v8 title];
        v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

        [v10 setProperty:v8 forKey:@"DeveloperOverride"];
        [v3 addObject:v10];
      }
      id v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)addURLOverride:(id)a3
{
  id v4 = objc_alloc_init(CPSURLOverrideDetailsController);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_6020;
  v6[3] = &unk_30F40;
  v6[4] = self;
  [(CPSURLOverrideDetailsController *)v4 setDismissHandler:v6];
  id v5 = [(CPSDeveloperSettingsLocalOverrideController *)self navigationController];
  [v5 pushViewController:v4 animated:1];
}

@end