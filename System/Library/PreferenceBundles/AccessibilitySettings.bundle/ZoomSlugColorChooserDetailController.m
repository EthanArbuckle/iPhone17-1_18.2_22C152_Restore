@interface ZoomSlugColorChooserDetailController
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ZoomSlugColorChooserDetailController

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v17 = OBJC_IVAR___PSListController__specifiers;
    v20 = objc_opt_new();
    uint64_t v19 = PSCellClassKey;
    uint64_t v18 = PSSpecifierIsSearchableKey;
    for (uint64_t i = 1; i != 7; ++i)
    {
      v5 = AXLocalizedTitleForColor(i);
      v6 = (CGColor *)AXUIZoomControllerColor();
      Components = CGColorGetComponents(v6);
      v8 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:3 edit:0];
      [v8 setProperty:objc_opt_class() forKey:v19];
      v9 = +[NSNumber numberWithDouble:*Components];
      v21[0] = v9;
      v10 = +[NSNumber numberWithDouble:Components[1]];
      v21[1] = v10;
      v11 = +[NSNumber numberWithDouble:Components[2]];
      v21[2] = v11;
      v12 = +[NSNumber numberWithDouble:Components[3]];
      v21[3] = v12;
      v13 = +[NSArray arrayWithObjects:v21 count:4];
      [v8 setProperty:v13 forKey:@"rgb"];

      [v8 setProperty:&off_22A8F0 forKey:@"colorType"];
      v14 = +[NSNumber numberWithInteger:i];
      [v8 setProperty:v14 forKey:@"controllerColor"];

      [v8 setProperty:&__kCFBooleanFalse forKey:v18];
      [v8 setCellType:3];
      [v20 addObject:v8];
    }
    v15 = *(void **)&self->AXUISettingsBaseListController_opaque[v17];
    *(void *)&self->AXUISettingsBaseListController_opaque[v17] = v20;

    v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v17];
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)ZoomSlugColorChooserDetailController;
  v4 = [(ZoomSlugColorChooserDetailController *)&v13 tableView:a3 cellForRowAtIndexPath:a4];
  v5 = [v4 circle];
  [v5 setAccessibilityIgnoresInvertColors:1];

  v6 = [v4 specifier];
  v7 = [v6 propertyForKey:@"controllerColor"];
  v8 = (char *)[v7 integerValue];

  if (v8 == (unsigned char *)&dword_0 + 1 && _AXSInvertColorsEnabled())
  {
    v9 = [v4 circle];
    v10 = +[UIColor whiteColor];
    [v9 setColor:v10];
  }
  v11 = +[AXSettings sharedInstance];
  objc_msgSend(v4, "setChecked:", objc_msgSend(v11, "zoomControllerColor") == v8);

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)ZoomSlugColorChooserDetailController;
  id v6 = a4;
  id v7 = a3;
  v8 = [(ZoomSlugColorChooserDetailController *)&v13 tableView:v7 cellForRowAtIndexPath:v6];
  v9 = objc_msgSend(v8, "specifier", v13.receiver, v13.super_class);
  v10 = [v9 propertyForKey:@"controllerColor"];
  id v11 = [v10 integerValue];

  v12 = +[AXSettings sharedInstance];
  [v12 setZoomControllerColor:v11];

  [(ZoomSlugColorChooserDetailController *)self updateTableCheckedSelection:v6];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

@end