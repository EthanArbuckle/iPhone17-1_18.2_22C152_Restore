@interface CNFInternalLoggingListController
- (id)specifiers;
- (id)technicalFailureUI:(id)a3;
- (id)vcpLogging:(id)a3;
- (void)setTechnicalFailureUI:(id)a3 specifier:(id)a4;
- (void)setVCPLogging:(id)a3 specifier:(id)a4;
@end

@implementation CNFInternalLoggingListController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(CNFInternalLoggingListController *)self loadSpecifiersFromPlistName:@"ConferenceInternalLoggingSettings" target:self];
    v6 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)technicalFailureUI:(id)a3
{
  uint64_t v3 = CNFGetAppBooleanValueForKey();

  return +[NSNumber numberWithBool:v3];
}

- (void)setTechnicalFailureUI:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];
  CNFSetAppBooleanValueForKey();
  if (CNFSyncPreferences())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kCNFTechnicalFailureUIPrefChangedNotification", 0, 0, 0);
  }
}

- (id)vcpLogging:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"EnableVCPLogging", @"com.apple.VideoProcessing", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 1;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = v4;
  v6 = +[NSNumber numberWithBool:v5];

  return v6;
}

- (void)setVCPLogging:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    BOOL v4 = +[NSNumber numberWithBool:1];
  }
  else {
    BOOL v4 = 0;
  }
  CFPreferencesSetAppValue(@"EnableVCPLogging", v4, @"com.apple.VideoProcessing");
  CFPreferencesAppSynchronize(@"com.apple.VideoProcessing");
  id v5 = [@"killall -9 mediaserverd SpringBoard imagent MobilePhone" UTF8String];

  _IMPerformSystem(v5);
}

@end