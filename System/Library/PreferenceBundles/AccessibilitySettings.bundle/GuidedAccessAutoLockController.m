@interface GuidedAccessAutoLockController
- (id)_specifierForTimeInSeconds:(int64_t)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation GuidedAccessAutoLockController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = +[PSSpecifier emptyGroupSpecifier];
    [v6 setProperty:@"DurationsGroup" forKey:PSIDKey];
    v7 = +[AXSettings sharedInstance];
    id v8 = [v7 guidedAccessAutoLockTimeInSeconds];
    id v9 = (id)AXSGuidedAccessAutoLockTimeMirrorSystem;

    if (v8 == v9)
    {
      v10 = AXLocStringKeyForModel();
      v11 = settingsLocString(v10, @"GuidedAccessSettings");
      [v6 setProperty:v11 forKey:PSFooterTextGroupKey];
    }
    [v5 addObject:v6];
    if (specifiers_onceToken_0 != -1) {
      dispatch_once(&specifiers_onceToken_0, &__block_literal_global_14);
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = (id)specifiers_standardDurations;
    id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = -[GuidedAccessAutoLockController _specifierForTimeInSeconds:](self, "_specifierForTimeInSeconds:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "integerValue", (void)v20));
          [v5 addObject:v17];
        }
        id v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    v18 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

void __44__GuidedAccessAutoLockController_specifiers__block_invoke(id a1)
{
  v1 = +[NSNumber numberWithInteger:AXSGuidedAccessAutoLockTimeMirrorSystem];
  v5[0] = v1;
  v5[1] = &off_22C390;
  v5[2] = &off_229330;
  v5[3] = &off_229348;
  v5[4] = &off_229360;
  v5[5] = &off_229378;
  v5[6] = &off_229390;
  v5[7] = &off_2293A8;
  v5[8] = &off_2293C0;
  v2 = +[NSNumber numberWithInteger:AXSGuidedAccessAutoLockTimeNever];
  v5[9] = v2;
  uint64_t v3 = +[NSArray arrayWithObjects:v5 count:10];
  v4 = (void *)specifiers_standardDurations;
  specifiers_standardDurations = v3;
}

- (id)_specifierForTimeInSeconds:(int64_t)a3
{
  v4 = GuidedAccessDescriptionForAutoLockTime(a3);
  v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:0 set:0 get:0 detail:0 cell:3 edit:0];

  v6 = +[NSNumber numberWithInteger:a3];
  [v5 setProperty:v6 forKey:@"TimeInSeconds"];

  [v5 setProperty:&__kCFBooleanFalse forKey:PSSpecifierIsSearchableKey];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)GuidedAccessAutoLockController;
  v4 = [(GuidedAccessAutoLockController *)&v10 tableView:a3 cellForRowAtIndexPath:a4];
  v5 = [v4 specifier];
  v6 = [v5 propertyForKey:@"TimeInSeconds"];
  id v7 = [v6 integerValue];
  id v8 = +[AXSettings sharedInstance];
  objc_msgSend(v4, "setChecked:", v7 == objc_msgSend(v8, "guidedAccessAutoLockTimeInSeconds"));

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GuidedAccessAutoLockController;
  [(GuidedAccessAutoLockController *)&v17 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = [(GuidedAccessAutoLockController *)self specifierAtIndexPath:v6];
  id v8 = +[AXSettings sharedInstance];
  double v9 = (double)(uint64_t)[v8 guidedAccessAutoLockTimeInSeconds];

  objc_super v10 = [v7 propertyForKey:@"TimeInSeconds"];
  double v11 = (double)(uint64_t)[v10 integerValue];

  if (v9 != v11)
  {
    id v12 = +[AXSettings sharedInstance];
    [v12 setGuidedAccessAutoLockTimeInSeconds:(uint64_t)v11];

    [(GuidedAccessAutoLockController *)self updateVisibleCellsWithCheckedSelection:v6];
    id v13 = [(GuidedAccessAutoLockController *)self specifierForID:@"DurationsGroup"];
    id v14 = v13;
    if (v9 == (double)AXSGuidedAccessAutoLockTimeMirrorSystem)
    {
      [v13 setProperty:&stru_20F6B8 forKey:PSFooterTextGroupKey];
    }
    else
    {
      if (v11 != (double)AXSGuidedAccessAutoLockTimeMirrorSystem)
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v15 = AXLocStringKeyForModel();
      v16 = settingsLocString(v15, @"GuidedAccessSettings");
      [v14 setProperty:v16 forKey:PSFooterTextGroupKey];
    }
    [(GuidedAccessAutoLockController *)self reloadSpecifier:v14 animated:1];
    goto LABEL_7;
  }
LABEL_8:
}

@end