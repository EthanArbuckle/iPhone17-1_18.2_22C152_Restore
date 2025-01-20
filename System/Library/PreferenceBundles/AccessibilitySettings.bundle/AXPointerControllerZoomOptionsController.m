@interface AXPointerControllerZoomOptionsController
+ (id)currentZoomStyleTitle;
+ (id)localizedDescriptionForPanningStyle:(unint64_t)a3;
+ (id)localizedTitleForPanningStyle:(unint64_t)a3;
+ (unint64_t)currentZoomPanningStyle;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (unint64_t)_panningStyleForIndexPath:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation AXPointerControllerZoomOptionsController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = +[PSSpecifier groupSpecifierWithID:@"kAXZoomGroupSpecifierId"];
    v7 = objc_opt_class();
    v8 = objc_msgSend(v7, "localizedDescriptionForPanningStyle:", objc_msgSend((id)objc_opt_class(), "currentZoomPanningStyle"));
    [v6 setProperty:v8 forKey:PSFooterTextGroupKey];

    [v5 addObject:v6];
    unint64_t v9 = kAXSZWPanningStyleFirst;
    unint64_t v10 = kAXSZWPanningStyleLast;
    while (v9 <= v10)
    {
      v11 = [(id)objc_opt_class() localizedTitleForPanningStyle:v9];
      v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v5 addObject:v12];
      ++v9;
    }
    v13 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (unint64_t)_panningStyleForIndexPath:(id)a3
{
  return (unint64_t)[a3 row];
}

+ (id)currentZoomStyleTitle
{
  id v3 = [a1 currentZoomPanningStyle];

  return [a1 localizedTitleForPanningStyle:v3];
}

+ (unint64_t)currentZoomPanningStyle
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 laserZoomPanningStyle];

  return (unint64_t)v3;
}

+ (id)localizedTitleForPanningStyle:(unint64_t)a3
{
  if (a3 <= 2)
  {
    settingsLocString(*(&off_20BD38 + a3), @"Accessibility-hello");
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)localizedDescriptionForPanningStyle:(unint64_t)a3
{
  if (a3 <= 2)
  {
    settingsLocString(*(&off_20BD50 + a3), @"Accessibility-hello");
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AXPointerControllerZoomOptionsController;
  id v6 = a4;
  v7 = [(AXPointerControllerZoomOptionsController *)&v10 tableView:a3 cellForRowAtIndexPath:v6];
  id v8 = -[AXPointerControllerZoomOptionsController _panningStyleForIndexPath:](self, "_panningStyleForIndexPath:", v6, v10.receiver, v10.super_class);

  objc_msgSend(v7, "setChecked:", v8 == objc_msgSend((id)objc_opt_class(), "currentZoomPanningStyle"));

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(AXPointerControllerZoomOptionsController *)self _panningStyleForIndexPath:v6];
  unint64_t v9 = +[AXSettings sharedInstance];
  [v9 setLaserZoomPanningStyle:v8];

  [(AXPointerControllerZoomOptionsController *)self updateTableCheckedSelection:v6];
  [v7 deselectRowAtIndexPath:v6 animated:1];

  id v11 = [(AXPointerControllerZoomOptionsController *)self specifierForID:@"kAXZoomGroupSpecifierId"];
  objc_super v10 = [(id)objc_opt_class() localizedDescriptionForPanningStyle:v8];
  [v11 setProperty:v10 forKey:PSFooterTextGroupKey];

  [(AXPointerControllerZoomOptionsController *)self reloadSpecifier:v11 animated:0];
}

@end