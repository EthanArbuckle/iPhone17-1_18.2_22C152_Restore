@interface CSDurationForNewEventsController
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation CSDurationForNewEventsController

- (void)viewDidAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CSDurationForNewEventsController;
  [(CSDurationForNewEventsController *)&v16 viewDidAppear:a3];
  v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.mobilecal/durationForNewEvents"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  v6 = +[NSLocale currentLocale];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"Duration for New Events" table:@"MobileCalSettings" locale:v6 bundleURL:v8];

  id v10 = objc_alloc((Class)_NSLocalizedStringResource);
  v11 = +[NSLocale currentLocale];
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 bundleURL];
  id v14 = [v10 initWithKey:@"Calendar" table:@"MobileCalSettings" locale:v11 bundleURL:v13];

  id v17 = v14;
  v15 = +[NSArray arrayWithObjects:&v17 count:1];
  [(CSDurationForNewEventsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.mobilecal" title:v9 localizedNavigationComponents:v15 deepLink:v4];

  +[CalDistributedNotificationCenter addObserver:self selector:"_defaultEventDurationChanged" name:CalFoundationPreferencesNotification_DefaultEventDuration];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSDurationForNewEventsController;
  [(CSDurationForNewEventsController *)&v4 viewDidDisappear:a3];
  +[CalDistributedNotificationCenter removeObserver:self name:CalFoundationPreferencesNotification_DefaultEventDuration];
}

@end