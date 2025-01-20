@interface CACOverlayOpacityDetailController
- (id)overlayOpacity:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)setOverlayOpacity:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation CACOverlayOpacityDetailController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = +[PSSpecifier groupSpecifierWithID:@"OVERLAY_OPACITY_GROUP" name:0];
    v7 = settingsLocString(@"OVERLAY_FADE_OPACITY_FOOTER", @"CommandAndControlSettings");
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    [v5 addObject:v6];
    v8 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setOverlayOpacity:specifier:" get:"overlayOpacity:" detail:0 cell:5 edit:0];
    [v8 setProperty:@"OVERLAY_OPACITY_CELL" forKey:PSIDKey];
    [v8 setProperty:&off_4FCA0 forKey:PSControlMinimumKey];
    [v8 setProperty:&off_4FCB0 forKey:PSControlMaximumKey];
    v9 = +[CACPreferences sharedPreferences];
    [v9 overlayFadeOpacity];
    v10 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v8 setProperty:v10 forKey:PSDefaultValueKey];

    [v8 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v5 addObject:v8];
    v11 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v13 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v13 contentView];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    v12 = [v13 control];
    objc_msgSend(v12, "setFrame:", (v9 - v9 * 0.8) * 0.5, v7, v9 * 0.8, v11);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CACOverlayOpacityDetailController;
  v4 = [(CACOverlayOpacityDetailController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 control];
    [v5 setContinuous:1];
  }

  return v4;
}

- (id)overlayOpacity:(id)a3
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  [v3 overlayFadeOpacity];
  v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  return v4;
}

- (void)setOverlayOpacity:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v8 = +[CACPreferences sharedPreferences];
  [v4 floatValue];
  int v6 = v5;

  LODWORD(v7) = v6;
  [v8 setOverlayFadeOpacity:v7];
}

@end