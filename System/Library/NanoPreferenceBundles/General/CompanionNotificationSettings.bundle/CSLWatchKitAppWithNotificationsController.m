@interface CSLWatchKitAppWithNotificationsController
- (id)mirrorState:(id)a3;
- (id)specifiers;
- (void)setMirrorState:(id)a3 specifier:(id)a4;
@end

@implementation CSLWatchKitAppWithNotificationsController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"MIRROR_ALERTS" value:&stru_C650 table:@"Notifications"];
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"setMirrorState:specifier:" get:"mirrorState:" detail:0 cell:6 edit:0];

    [v5 addObject:v8];
    v9 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)setMirrorState:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v7 = +[CSLNotificationsDataSource sharedInstance];
  v6 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"SpecifierID"];
  [v7 _setShowOnGizmoState:v5 forBundleID:v6];
}

- (id)mirrorState:(id)a3
{
  v4 = +[CSLNotificationsDataSource sharedInstance];
  id v5 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"SpecifierID"];
  v6 = [v4 _showOnGizmoStateForBundleID:v5];

  return v6;
}

@end