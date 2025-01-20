@interface CSAlternateCalendarsController
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation CSAlternateCalendarsController

- (void)viewDidAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CSAlternateCalendarsController;
  [(CSAlternateCalendarsController *)&v17 viewDidAppear:a3];
  v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.mobilecal/alternateCalendars"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  v6 = +[NSLocale currentLocale];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"Alternate Calendars" table:@"MobileCalSettings" locale:v6 bundleURL:v8];

  id v10 = objc_alloc((Class)_NSLocalizedStringResource);
  v11 = +[NSLocale currentLocale];
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 bundleURL];
  id v14 = [v10 initWithKey:@"Calendar" table:@"MobileCalSettings" locale:v11 bundleURL:v13];

  id v18 = v14;
  v15 = +[NSArray arrayWithObjects:&v18 count:1];
  [(CSAlternateCalendarsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.mobilecal" title:v9 localizedNavigationComponents:v15 deepLink:v4];

  v16 = +[NSNotificationCenter defaultCenter];
  [v16 addObserver:self selector:"_alternativeCalendarChanged" name:CUIKPreferencesNotification_OverlayCalendarID object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSAlternateCalendarsController;
  [(CSAlternateCalendarsController *)&v5 viewDidDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:CUIKPreferencesNotification_OverlayCalendarID object:0];
}

@end