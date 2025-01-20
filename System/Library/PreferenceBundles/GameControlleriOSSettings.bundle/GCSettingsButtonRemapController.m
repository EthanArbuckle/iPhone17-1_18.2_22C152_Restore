@interface GCSettingsButtonRemapController
- (id)newSpecifiers;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation GCSettingsButtonRemapController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [(GCSettingsButtonRemapController *)self newSpecifiers];
    v6 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)newSpecifiers
{
  uint64_t v3 = OBJC_IVAR___PSViewController__specifier;
  v4 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"ButtonRemapControllerValues"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v18 = v4;
    id v6 = v4;
    uint64_t v7 = [*(id *)&self->PSListController_opaque[v3] propertyForKey:@"ButtonRemapControllerFooter"];
    if (v7)
    {
      v8 = +[PSSpecifier emptyGroupSpecifier];
      [v8 setProperty:v7 forKey:PSFooterTextGroupKey];
      [v5 addObject:v8];
    }
    v17 = (void *)v7;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v13);
          v15 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:3 edit:0];
          [v15 setProperty:v14 forKey:@"ControllerElement"];
          [v5 addObject:v15];

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    v4 = v18;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)GCSettingsButtonRemapController;
  id v6 = a4;
  uint64_t v7 = [(GCSettingsButtonRemapController *)&v14 tableView:a3 cellForRowAtIndexPath:v6];
  v8 = -[GCSettingsButtonRemapController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v14.receiver, v14.super_class);

  id v9 = [v8 propertyForKey:@"ControllerElement"];
  id v10 = [(GCSettingsButtonRemapController *)self parentController];
  unsigned int v11 = [v10 conformsToProtocol:&OBJC_PROTOCOL___GCSettingsRemapControllerDelegate];

  if (v11)
  {
    uint64_t v12 = [(GCSettingsButtonRemapController *)self parentController];
    [v12 onLoadItemInRemapController:self item:v9 cell:v7];
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = [(GCSettingsButtonRemapController *)self specifierAtIndexPath:v6];
  v8 = [v12 propertyForKey:@"ControllerElement"];
  id v9 = [(GCSettingsButtonRemapController *)self parentController];
  unsigned int v10 = [v9 conformsToProtocol:&OBJC_PROTOCOL___GCSettingsRemapControllerDelegate];

  if (v10)
  {
    unsigned int v11 = [(GCSettingsButtonRemapController *)self parentController];
    [v11 didSelectItemInRemapController:self item:v8];
  }
  [(GCSettingsButtonRemapController *)self reloadSpecifiers];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

@end