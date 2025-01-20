@interface HPRFSessionTrackerAppAutoPauseController
- (HPRFSessionTrackerAppAutoPauseController)init;
- (id)applicationBundleIdentifier;
- (id)bundle;
- (id)isAutoPauseEnabled;
- (id)isCyclingAutoPauseEnabled;
- (id)isRunningAutoPauseEnabled;
- (id)specifierPlistName;
- (id)specifiers;
- (void)dealloc;
@end

@implementation HPRFSessionTrackerAppAutoPauseController

- (HPRFSessionTrackerAppAutoPauseController)init
{
  v5.receiver = self;
  v5.super_class = (Class)HPRFSessionTrackerAppAutoPauseController;
  v2 = [(HPRFSessionTrackerAppAutoPauseController *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_6F58, @"NanoLifestyleSessionTrackerAppPreferencesChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)HPRFSessionTrackerAppAutoPauseController;
  [(HPRFSessionTrackerAppAutoPauseController *)&v4 dealloc];
}

- (id)specifierPlistName
{
  return @"SessionTrackerAutoPause";
}

- (id)specifiers
{
  v3 = [(HPRFSessionTrackerAppAutoPauseController *)self loadSpecifiersFromPlistName:@"SessionTrackerAutoPause" target:self];
  objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 localizedStringForKey:@"AUTO_PAUSE_ENABLED_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  [(HPRFSessionTrackerAppAutoPauseController *)self setTitle:v5];

  v6 = [v3 specifierForID:@"WorkoutAutoPauseSwitch"];
  if (v6)
  {
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"AUTO_PAUSE_ENABLED_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];

    [v6 setName:v8];
  }
  v9 = [(HPRFSessionTrackerAppAutoPauseController *)self isAutoPauseEnabled];
  unsigned __int8 v10 = [v9 BOOLValue];

  if ((v10 & 1) == 0)
  {
    v11 = [v3 specifierForID:@"AutoPauseWorkoutTypesGroup"];
    [v3 removeObject:v11];

    v12 = [v3 specifierForID:@"WorkoutAutoPauseRunning"];
    [v3 removeObject:v12];

    v13 = [v3 specifierForID:@"WorkoutAutoPauseCycling"];
    [v3 removeObject:v13];
  }
  uint64_t v14 = OBJC_IVAR___PSListController__specifiers;
  v15 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v16 = v3;

  id v17 = *(id *)&self->BPSNotificationAppController_opaque[v14];
  return v17;
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)applicationBundleIdentifier
{
  uint64_t v2 = [(HPRFSessionTrackerAppAutoPauseController *)self bundle];
  v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)isAutoPauseEnabled
{
  uint64_t v2 = FIUIIsAutoPauseEnabled();

  return +[NSNumber numberWithBool:v2];
}

- (id)isRunningAutoPauseEnabled
{
  uint64_t v2 = FIUIIsRunningAutoPauseEnabled();

  return +[NSNumber numberWithBool:v2];
}

- (id)isCyclingAutoPauseEnabled
{
  uint64_t v2 = FIUIIsCyclingAutoPauseEnabled();

  return +[NSNumber numberWithBool:v2];
}

@end