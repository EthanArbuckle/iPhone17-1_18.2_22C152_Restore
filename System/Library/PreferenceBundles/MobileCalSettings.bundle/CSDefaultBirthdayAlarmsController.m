@interface CSDefaultBirthdayAlarmsController
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation CSDefaultBirthdayAlarmsController

- (void)viewDidAppear:(BOOL)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CSDefaultBirthdayAlarmsController;
  [(CSDefaultBirthdayAlarmsController *)&v22 viewDidAppear:a3];
  v21 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.mobilecal/defaultAlertTimes/birthdaysDefaultAlertTimes"];
  id v4 = objc_alloc((Class)_NSLocalizedStringResource);
  v5 = +[NSLocale currentLocale];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 bundleURL];
  id v8 = [v4 initWithKey:@"Birthday Calendar" table:@"MobileCalSettings" locale:v5 bundleURL:v7];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  v10 = +[NSLocale currentLocale];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 bundleURL];
  id v13 = [v9 initWithKey:@"Calendar" table:@"MobileCalSettings" locale:v10 bundleURL:v12];

  id v14 = objc_alloc((Class)_NSLocalizedStringResource);
  v15 = +[NSLocale currentLocale];
  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = [v16 bundleURL];
  id v18 = [v14 initWithKey:@"Default Alert Times" table:@"MobileCalSettings" locale:v15 bundleURL:v17];

  v23[0] = v13;
  v23[1] = v18;
  v19 = +[NSArray arrayWithObjects:v23 count:2];
  [(CSDefaultBirthdayAlarmsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.mobilecal" title:v8 localizedNavigationComponents:v19 deepLink:v21];

  v20 = +[NSNotificationCenter defaultCenter];
  [v20 addObserver:self selector:"_defaultBirthdaysAlarmChanged" name:EKEventStoreChangedNotification object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSDefaultBirthdayAlarmsController;
  [(CSDefaultBirthdayAlarmsController *)&v5 viewDidDisappear:a3];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:EKEventStoreChangedNotification object:0];
}

@end