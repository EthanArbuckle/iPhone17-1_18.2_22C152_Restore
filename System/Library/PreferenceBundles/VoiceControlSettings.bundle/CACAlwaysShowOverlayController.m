@interface CACAlwaysShowOverlayController
- (BOOL)didAddGridSpecifiers;
- (BOOL)didAddOverlaySpecifiers;
- (CACAlwaysShowOverlayController)init;
- (NSArray)dimmingSpecifiers;
- (NSArray)gridSpecifiers;
- (id)gridOverlayColumnsSummary:(id)a3;
- (id)gridOverlayMaxLevelSummary:(id)a3;
- (id)gridOverlayPressOnFirstLevelEnabled:(id)a3;
- (id)gridOverlayRowsSummary:(id)a3;
- (id)overlayFadeDelaySummary:(id)a3;
- (id)overlayFadeOpacitySummary:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)dealloc;
- (void)setDimmingSpecifiers:(id)a3;
- (void)setGridOverlayPressOnFirstLevel:(id)a3 specifier:(id)a4;
- (void)setGridSpecifiers:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CACAlwaysShowOverlayController

- (CACAlwaysShowOverlayController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CACAlwaysShowOverlayController;
  v2 = [(CACAlwaysShowOverlayController *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_BE2C, @"NotificationAlwaysShowOverlayTypeSettingsChanged", 0, (CFNotificationSuspensionBehavior)1028);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"NotificationAlwaysShowOverlayTypeSettingsChanged", 0);
  v4.receiver = self;
  v4.super_class = (Class)CACAlwaysShowOverlayController;
  [(CACAlwaysShowOverlayController *)&v4 dealloc];
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v45 = OBJC_IVAR___PSListController__specifiers;
    v47 = +[PSSpecifier emptyGroupSpecifier];
    objc_super v4 = settingsLocString(@"OVERLAY_NONE", @"CommandAndControlSettings");
    objc_super v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v5 setProperty:@"None" forKey:@"AlwaysShowOverlay"];
    uint64_t v6 = PSIDKey;
    [v5 setProperty:@"OVERLAY_NONE" forKey:PSIDKey];
    v7 = settingsLocString(@"OVERLAY_NUMBERS", @"CommandAndControlSettings");
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v8 setProperty:@"NumberedElements" forKey:@"AlwaysShowOverlay"];
    [v8 setProperty:@"OVERLAY_NUMBERS" forKey:v6];
    v9 = settingsLocString(@"OVERLAY_NAMES", @"CommandAndControlSettings");
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v10 setProperty:@"NamedElements" forKey:@"AlwaysShowOverlay"];
    [v10 setProperty:@"OVERLAY_NAMES" forKey:v6];
    v11 = settingsLocString(@"OVERLAY_GRID", @"CommandAndControlSettings");
    v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v12 setProperty:@"NumberedGrid" forKey:@"AlwaysShowOverlay"];
    [v12 setProperty:@"OVERLAY_GRID" forKey:v6];
    v50[0] = v47;
    v50[1] = v5;
    v43 = v8;
    v44 = v5;
    v50[2] = v8;
    v50[3] = v10;
    v41 = v12;
    v42 = v10;
    v50[4] = v12;
    v13 = +[NSArray arrayWithObjects:v50 count:5];
    v14 = +[NSMutableArray arrayWithArray:v13];

    uint64_t v15 = +[PSSpecifier emptyGroupSpecifier];
    v16 = settingsLocString(@"OVERLAY_FADE_DELAY_TITLE", @"CommandAndControlSettings");
    uint64_t v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:"overlayFadeDelaySummary:" detail:objc_opt_class() cell:2 edit:0];

    v18 = settingsLocString(@"OVERLAY_FADE_OPACITY_TITLE", @"CommandAndControlSettings");
    uint64_t v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:"overlayFadeOpacitySummary:" detail:objc_opt_class() cell:2 edit:0];

    v39 = (void *)v17;
    v40 = (void *)v15;
    v49[0] = v15;
    v49[1] = v17;
    v38 = (void *)v19;
    v49[2] = v19;
    v20 = +[NSArray arrayWithObjects:v49 count:3];
    v21 = +[CACPreferences sharedPreferences];
    v22 = [v21 alwaysShowOverlayType];
    LOBYTE(v6) = [v22 isEqualToString:@"None"];

    [(CACAlwaysShowOverlayController *)self setDimmingSpecifiers:v20];
    if ((v6 & 1) == 0) {
      [v14 addObjectsFromArray:v20];
    }
    v46 = v14;
    v23 = settingsLocString(@"GRID_OVERLAY_GROUP_TITLE", @"CommandAndControlSettings");
    v24 = +[PSSpecifier groupSpecifierWithName:v23];

    v25 = settingsLocString(@"GRID_OVERLAY_GROUP_FOOTER", @"CommandAndControlSettings");
    [v24 setProperty:v25 forKey:PSFooterTextGroupKey];

    v26 = settingsLocString(@"GRID_OVERLAY_ROWS_TITLE", @"CommandAndControlSettings");
    v27 = +[PSSpecifier preferenceSpecifierNamed:v26 target:self set:0 get:"gridOverlayRowsSummary:" detail:objc_opt_class() cell:2 edit:0];

    v28 = settingsLocString(@"GRID_OVERLAY_COLUMNS_TITLE", @"CommandAndControlSettings");
    v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:self set:0 get:"gridOverlayColumnsSummary:" detail:objc_opt_class() cell:2 edit:0];

    v30 = settingsLocString(@"GRID_OVERLAY_PRESS_IMMEDIATELY_TITLE", @"CommandAndControlSettings");
    v31 = +[PSSpecifier preferenceSpecifierNamed:v30 target:self set:"setGridOverlayPressOnFirstLevel:specifier:" get:"gridOverlayPressOnFirstLevelEnabled:" detail:0 cell:6 edit:0];

    v48[0] = v24;
    v48[1] = v31;
    v48[2] = v27;
    v48[3] = v29;
    v32 = +[NSArray arrayWithObjects:v48 count:4];
    [(CACAlwaysShowOverlayController *)self setGridSpecifiers:v32];
    v33 = +[CACPreferences sharedPreferences];
    v34 = [v33 alwaysShowOverlayType];
    unsigned int v35 = [v34 isEqualToString:@"NumberedGrid"];

    if (v35 && ![(CACAlwaysShowOverlayController *)self didAddGridSpecifiers]) {
      [v46 addObjectsFromArray:v32];
    }
    v36 = *(void **)&self->AXUISettingsBaseListController_opaque[v45];
    *(void *)&self->AXUISettingsBaseListController_opaque[v45] = v46;

    v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v45];
  }

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CACAlwaysShowOverlayController;
  [(CACAlwaysShowOverlayController *)&v4 viewWillAppear:a3];
  [(CACAlwaysShowOverlayController *)self reloadSpecifiers];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CACAlwaysShowOverlayController;
  v7 = [(CACAlwaysShowOverlayController *)&v14 tableView:a3 cellForRowAtIndexPath:v6];
  if (![v6 section])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [(CACAlwaysShowOverlayController *)self specifierAtIndexPath:v6];
      v9 = [v8 propertyForKey:@"AlwaysShowOverlay"];
      v10 = +[CACPreferences sharedPreferences];
      v11 = [v10 alwaysShowOverlayType];
      id v12 = [v11 isEqualToString:v9];

      [v7 setChecked:v12];
    }
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v58.receiver = self;
  v58.super_class = (Class)CACAlwaysShowOverlayController;
  [(CACAlwaysShowOverlayController *)&v58 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = [(CACAlwaysShowOverlayController *)self specifierAtIndexPath:v6];
  if (![v6 section])
  {
    v8 = [v7 propertyForKey:@"AlwaysShowOverlay"];
    v9 = +[CACPreferences sharedPreferences];
    [v9 setAlwaysShowOverlayType:v8];

    [(CACAlwaysShowOverlayController *)self updateTableCheckedSelection:v6];
  }
  v10 = [v7 propertyForKey:@"AlwaysShowOverlay"];
  unsigned int v11 = [v10 isEqualToString:@"None"];

  if (v11)
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v12 = [(CACAlwaysShowOverlayController *)self dimmingSpecifiers];
    id v13 = [v12 countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v55;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v55 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          v18 = [(CACAlwaysShowOverlayController *)self specifiers];
          unsigned int v19 = [v18 containsObject:v17];

          if (v19) {
            [(CACAlwaysShowOverlayController *)self removeSpecifier:v17 animated:1];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v54 objects:v62 count:16];
      }
      while (v14);
    }
  }
  else
  {
    if ([(CACAlwaysShowOverlayController *)self didAddOverlaySpecifiers]) {
      goto LABEL_25;
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v12 = [(CACAlwaysShowOverlayController *)self dimmingSpecifiers];
    id v20 = [v12 countByEnumeratingWithState:&v50 objects:v61 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v51;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v51 != v22) {
            objc_enumerationMutation(v12);
          }
          uint64_t v24 = *(void *)(*((void *)&v50 + 1) + 8 * (void)j);
          v25 = [(CACAlwaysShowOverlayController *)self specifiers];
          unsigned int v26 = [v25 containsObject:v24];

          if (v26) {
            [(CACAlwaysShowOverlayController *)self addSpecifier:v24 animated:1];
          }
        }
        id v21 = [v12 countByEnumeratingWithState:&v50 objects:v61 count:16];
      }
      while (v21);
    }
  }

LABEL_25:
  v27 = +[CACPreferences sharedPreferences];
  v28 = [v27 alwaysShowOverlayType];
  unsigned int v29 = [v28 isEqualToString:@"NumberedGrid"];

  if (!v29)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v30 = [(CACAlwaysShowOverlayController *)self gridSpecifiers];
    id v35 = [v30 countByEnumeratingWithState:&v42 objects:v59 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v43;
      do
      {
        for (k = 0; k != v36; k = (char *)k + 1)
        {
          if (*(void *)v43 != v37) {
            objc_enumerationMutation(v30);
          }
          uint64_t v39 = *(void *)(*((void *)&v42 + 1) + 8 * (void)k);
          v40 = [(CACAlwaysShowOverlayController *)self specifiers];
          unsigned int v41 = [v40 containsObject:v39];

          if (v41) {
            [(CACAlwaysShowOverlayController *)self removeSpecifier:v39 animated:1];
          }
        }
        id v36 = [v30 countByEnumeratingWithState:&v42 objects:v59 count:16];
      }
      while (v36);
    }
    goto LABEL_44;
  }
  if (![(CACAlwaysShowOverlayController *)self didAddGridSpecifiers])
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v30 = [(CACAlwaysShowOverlayController *)self gridSpecifiers];
    id v31 = [v30 countByEnumeratingWithState:&v46 objects:v60 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v47;
      do
      {
        for (m = 0; m != v32; m = (char *)m + 1)
        {
          if (*(void *)v47 != v33) {
            objc_enumerationMutation(v30);
          }
          [(CACAlwaysShowOverlayController *)self addSpecifier:*(void *)(*((void *)&v46 + 1) + 8 * (void)m) animated:1];
        }
        id v32 = [v30 countByEnumeratingWithState:&v46 objects:v60 count:16];
      }
      while (v32);
    }
LABEL_44:
  }
}

- (BOOL)didAddGridSpecifiers
{
  v2 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  v3 = [(CACAlwaysShowOverlayController *)self gridSpecifiers];
  objc_super v4 = [v3 firstObject];
  LOBYTE(v2) = [v2 containsObject:v4];

  return (char)v2;
}

- (BOOL)didAddOverlaySpecifiers
{
  v2 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  v3 = [(CACAlwaysShowOverlayController *)self dimmingSpecifiers];
  objc_super v4 = [v3 firstObject];
  LOBYTE(v2) = [v2 containsObject:v4];

  return (char)v2;
}

- (id)overlayFadeDelaySummary:(id)a3
{
  v3 = +[CACPreferences sharedPreferences];
  unsigned int v4 = [v3 overlayFadingEnabled];

  if (v4)
  {
    objc_super v5 = +[CACPreferences sharedPreferences];
    [v5 overlayFadeDelay];
    id v6 = AXLocalizedTimeSummary();
  }
  else
  {
    id v6 = settingsLocString(@"FEATURE_OFF", @"CommandAndControlSettings");
  }

  return v6;
}

- (id)overlayFadeOpacitySummary:(id)a3
{
  v3 = +[CACPreferences sharedPreferences];
  [v3 overlayFadeOpacity];
  unsigned int v4 = AXFormatFloatWithPercentage();

  return v4;
}

- (id)gridOverlayColumnsSummary:(id)a3
{
  v3 = +[CACPreferences sharedPreferences];
  unsigned int v4 = [v3 gridOverlayCustomColumnsEnabled];

  if (v4)
  {
    objc_super v5 = +[CACPreferences sharedPreferences];
    [v5 gridOverlayCustomColumnsCount];
    id v6 = AXFormatInteger();
    v7 = +[NSString stringWithFormat:@"%@", v6];
  }
  else
  {
    v7 = settingsLocString(@"FEATURE_AUTO", @"CommandAndControlSettings");
  }

  return v7;
}

- (id)gridOverlayRowsSummary:(id)a3
{
  v3 = +[CACPreferences sharedPreferences];
  unsigned int v4 = [v3 gridOverlayCustomRowsEnabled];

  if (v4)
  {
    objc_super v5 = +[CACPreferences sharedPreferences];
    [v5 gridOverlayCustomRowsCount];
    id v6 = AXFormatInteger();
    v7 = +[NSString stringWithFormat:@"%@", v6];
  }
  else
  {
    v7 = settingsLocString(@"FEATURE_AUTO", @"CommandAndControlSettings");
  }

  return v7;
}

- (void)setGridOverlayPressOnFirstLevel:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[CACPreferences sharedPreferences];
  id v5 = [v4 BOOLValue];

  [v6 setGridOverlayPressOnFirstLevelEnabled:v5];
}

- (id)gridOverlayPressOnFirstLevelEnabled:(id)a3
{
  v3 = +[CACPreferences sharedPreferences];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 gridOverlayPressOnFirstLevelEnabled]);

  return v4;
}

- (id)gridOverlayMaxLevelSummary:(id)a3
{
  v3 = +[CACPreferences sharedPreferences];
  [v3 gridOverlayMaxLevel];
  id v4 = AXFormatInteger();

  return v4;
}

- (NSArray)dimmingSpecifiers
{
  return self->_dimmingSpecifiers;
}

- (void)setDimmingSpecifiers:(id)a3
{
}

- (NSArray)gridSpecifiers
{
  return self->_gridSpecifiers;
}

- (void)setGridSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridSpecifiers, 0);

  objc_storeStrong((id *)&self->_dimmingSpecifiers, 0);
}

@end