@interface CARDashboardSuggestionsSpecifier
- (BOOL)smartWidgetHidden;
- (CARDashboardSuggestionsSpecifier)init;
- (void)_performAction:(id)a3;
- (void)setSmartWidgetHidden:(BOOL)a3;
@end

@implementation CARDashboardSuggestionsSpecifier

- (CARDashboardSuggestionsSpecifier)init
{
  v3 = sub_1000210C8(@"SUGGESTIONS_TITLE");
  v4 = +[CARSettingsImageCache siriImage];
  v14.receiver = self;
  v14.super_class = (Class)CARDashboardSuggestionsSpecifier;
  v5 = [(CARSettingsSwitchCellSpecifier *)&v14 initWithTitle:v3 image:v4];

  if (v5)
  {
    objc_initWeak(&location, v5);
    v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    v10 = sub_10002A4B0;
    v11 = &unk_100092008;
    objc_copyWeak(&v12, &location);
    [(CARSettingsCellSpecifier *)v5 setActionBlock:&v8];
    v6 = +[NSNumber numberWithInt:[(CARDashboardSuggestionsSpecifier *)v5 smartWidgetHidden] ^ 1];
    [(CARSettingsCellSpecifier *)v5 setCellValue:v6];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)_performAction:(id)a3
{
  if (a3) {
    id v4 = [a3 BOOLValue];
  }
  else {
    id v4 = (id)[(CARDashboardSuggestionsSpecifier *)self smartWidgetHidden];
  }
  id v5 = v4;
  [(CARDashboardSuggestionsSpecifier *)self setSmartWidgetHidden:v4 ^ 1];
  id v6 = +[NSNumber numberWithBool:v5];
  [(CARSettingsCellSpecifier *)self setCellValue:v6];
}

- (BOOL)smartWidgetHidden
{
  CFPreferencesAppSynchronize(@"com.apple.CarPlay");
  v2 = (void *)CFPreferencesCopyAppValue(@"CARSmartWidgetHidden", @"com.apple.CarPlayApp");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSmartWidgetHidden:(BOOL)a3
{
  CFPreferencesSetAppValue(@"CARSmartWidgetHidden", +[NSNumber numberWithBool:a3], @"com.apple.CarPlayApp");
  CFPreferencesAppSynchronize(@"com.apple.CarPlay");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CARSmartWidgetHiddenDefaultChanged", 0, 0, 1u);
}

@end