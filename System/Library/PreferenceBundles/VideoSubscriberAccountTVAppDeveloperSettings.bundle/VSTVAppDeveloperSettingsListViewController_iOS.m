@interface VSTVAppDeveloperSettingsListViewController_iOS
- (NSArray)listItems;
- (id)specifiers;
- (void)setListItems:(id)a3;
- (void)viewDidLoad;
@end

@implementation VSTVAppDeveloperSettingsListViewController_iOS

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)VSTVAppDeveloperSettingsListViewController_iOS;
  [(VSTVAppDeveloperSettingsListViewController_iOS *)&v5 viewDidLoad];
  v3 = [(VSTVAppDeveloperSettingsListViewController_iOS *)self specifier];
  v4 = [v3 propertyForKey:@"VSTVAppDeveloperSettingsAccountDetailsListKey"];
  [(VSTVAppDeveloperSettingsListViewController_iOS *)self setListItems:v4];

  [(VSTVAppDeveloperSettingsListViewController_iOS *)self reloadSpecifiers];
}

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    v4 = [(VSTVAppDeveloperSettingsListViewController_iOS *)self listItems];
    id v5 = [v4 count];

    if (v5)
    {
      uint64_t v20 = v3;
      id v23 = objc_alloc_init((Class)NSMutableArray);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id obj = [(VSTVAppDeveloperSettingsListViewController_iOS *)v2 listItems];
      id v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v22 = *(void *)v25;
        uint64_t v8 = PSCopyableCellKey;
        uint64_t v9 = PSAllowMultilineTitleKey;
        uint64_t v10 = PSEnabledKey;
        uint64_t v11 = PSTableCellHeightKey;
        do
        {
          v12 = 0;
          do
          {
            if (*(void *)v25 != v22) {
              objc_enumerationMutation(obj);
            }
            +[PSSpecifier preferenceSpecifierNamed:*(void *)(*((void *)&v24 + 1) + 8 * (void)v12) target:v2 set:0 get:0 detail:0 cell:-1 edit:0];
            v14 = v13 = v2;
            [v14 setProperty:&__kCFBooleanTrue forKey:v8];
            [v14 setProperty:&__kCFBooleanTrue forKey:v9];
            [v14 setProperty:&__kCFBooleanTrue forKey:v10];
            v15 = +[NSNumber numberWithDouble:UITableViewAutomaticDimension];
            [v14 setProperty:v15 forKey:v11];

            [v23 addObject:v14];
            v2 = v13;
            v12 = (char *)v12 + 1;
          }
          while (v7 != v12);
          id v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v7);
      }

      id v16 = [v23 copy];
      uint64_t v3 = v20;
      v17 = *(void **)&v2->PSListController_opaque[v20];
      *(void *)&v2->PSListController_opaque[v20] = v16;
    }
  }
  v18 = *(void **)&v2->PSListController_opaque[v3];

  return v18;
}

- (NSArray)listItems
{
  return self->_listItems;
}

- (void)setListItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end