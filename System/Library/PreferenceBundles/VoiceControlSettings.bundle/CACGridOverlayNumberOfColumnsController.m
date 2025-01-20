@interface CACGridOverlayNumberOfColumnsController
- (CACGridOverlayNumberOfColumnsController)init;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)dealloc;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation CACGridOverlayNumberOfColumnsController

- (CACGridOverlayNumberOfColumnsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CACGridOverlayNumberOfColumnsController;
  v2 = [(CACGridOverlayNumberOfColumnsController *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_A9AC, @"CACNotificationGridOverlaySettingsChanged", 0, (CFNotificationSuspensionBehavior)1028);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"CACNotificationGridOverlaySettingsChanged", 0);
  v4.receiver = self;
  v4.super_class = (Class)CACGridOverlayNumberOfColumnsController;
  [(CACGridOverlayNumberOfColumnsController *)&v4 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = objc_opt_new();
    v14 = +[PSSpecifier emptyGroupSpecifier];
    objc_msgSend(v5, "addObject:");
    v6 = settingsLocString(@"FEATURE_AUTO", @"CommandAndControlSettings");
    v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v7 setProperty:&off_4FC70 forKey:@"GridOverlayNumberOfColumns"];
    [v5 addObject:v7];
    if (+[CACLabeledGridOverlayManager maxNumberOfColumnsForDevice])
    {
      unint64_t v8 = 1;
      do
      {
        v9 = AXFormatInteger();
        v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:3 edit:0];

        v11 = +[NSNumber numberWithUnsignedInteger:v8];
        [v10 setProperty:v11 forKey:@"GridOverlayNumberOfColumns"];

        [v5 addObject:v10];
        ++v8;
      }
      while (v8 <= (unint64_t)+[CACLabeledGridOverlayManager maxNumberOfColumnsForDevice]);
    }
    v12 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    objc_super v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)CACGridOverlayNumberOfColumnsController;
  id v6 = a4;
  v7 = [(CACGridOverlayNumberOfColumnsController *)&v16 tableView:a3 cellForRowAtIndexPath:v6];
  unint64_t v8 = -[CACGridOverlayNumberOfColumnsController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v16.receiver, v16.super_class);

  v9 = [v8 propertyForKey:@"GridOverlayNumberOfColumns"];
  v10 = +[CACPreferences sharedPreferences];
  unsigned int v11 = [v10 gridOverlayCustomColumnsEnabled];

  if ([v9 integerValue])
  {
    if (v11)
    {
      v12 = +[CACPreferences sharedPreferences];
      objc_msgSend(v7, "setChecked:", objc_msgSend(v12, "gridOverlayCustomColumnsCount") == objc_msgSend(v9, "integerValue"));

      goto LABEL_7;
    }
    v14 = v7;
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = v11 ^ 1;
    v14 = v7;
  }
  [v14 setChecked:v13];
LABEL_7:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CACGridOverlayNumberOfColumnsController;
  [(CACGridOverlayNumberOfColumnsController *)&v12 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = [(CACGridOverlayNumberOfColumnsController *)self specifierAtIndexPath:v6];
  unint64_t v8 = [v7 propertyForKey:@"GridOverlayNumberOfColumns"];
  id v9 = [v8 integerValue];
  v10 = +[CACPreferences sharedPreferences];
  unsigned int v11 = v10;
  if (v9)
  {
    [v10 setGridOverlayCustomColumnsEnabled:1];

    unsigned int v11 = +[CACPreferences sharedPreferences];
    objc_msgSend(v11, "setGridOverlayCustomColumnsCount:", objc_msgSend(v8, "integerValue"));
  }
  else
  {
    [v10 setGridOverlayCustomColumnsEnabled:0];
  }

  [(CACGridOverlayNumberOfColumnsController *)self updateTableCheckedSelection:v6];
}

@end