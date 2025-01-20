@interface ZoomFilterController
- (ZoomFilterController)init;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ZoomFilterController

- (ZoomFilterController)init
{
  v9.receiver = self;
  v9.super_class = (Class)ZoomFilterController;
  v2 = [(ZoomFilterController *)&v9 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[AXSettings sharedInstance];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __28__ZoomFilterController_init__block_invoke;
    v6[3] = &unk_208798;
    objc_copyWeak(&v7, &location);
    [v3 registerUpdateBlock:v6 forRetrieveSelector:"zoomCurrentLensEffect" withListener:v2];

    objc_destroyWeak(&v7);
    v4 = v2;
    objc_destroyWeak(&location);
  }

  return v2;
}

void __28__ZoomFilterController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v16 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v15 = +[PSSpecifier groupSpecifierWithID:0 name:0];
    objc_msgSend(v4, "addObject:");
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = AXZoomAllLensEffects();
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        objc_super v9 = 0;
        do
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v9);
          v11 = AXUILocalizedTitleForZoomLensEffect();
          v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v12 setProperty:v10 forKey:@"ZoomFilter"];
          [v4 addObject:v12];

          objc_super v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    v13 = *(void **)&self->AXUISettingsBaseListController_opaque[v16];
    *(void *)&self->AXUISettingsBaseListController_opaque[v16] = v4;

    v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v16];
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ZoomFilterController;
  id v4 = [(ZoomFilterController *)&v10 tableView:a3 cellForRowAtIndexPath:a4];
  v5 = +[AXSettings sharedInstance];
  id v6 = [v5 zoomCurrentLensEffect];

  id v7 = [v4 specifier];
  uint64_t v8 = [v7 propertyForKey:@"ZoomFilter"];

  if (v8) {
    objc_msgSend(v4, "setChecked:", objc_msgSend(v6, "isEqualToString:", v8));
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ZoomFilterController;
  id v7 = a4;
  uint64_t v8 = [(ZoomFilterController *)&v12 tableView:v6 cellForRowAtIndexPath:v7];
  objc_super v9 = objc_msgSend(v8, "specifier", v12.receiver, v12.super_class);
  objc_super v10 = [v9 propertyForKey:@"ZoomFilter"];

  if (v10)
  {
    v11 = +[AXSettings sharedInstance];
    [v11 setZoomCurrentLensEffect:v10];
  }
  [v6 deselectRowAtIndexPath:v7 animated:1];
  [(ZoomFilterController *)self updateTableCheckedSelection:v7];
}

@end