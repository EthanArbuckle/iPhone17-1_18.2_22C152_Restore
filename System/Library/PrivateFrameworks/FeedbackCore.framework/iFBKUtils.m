@interface iFBKUtils
+ (BOOL)deviceSupportsFaceID;
+ (BOOL)isFBAVisibleInHomeScreen;
+ (BOOL)wasFBAVisibleAtFirstLaunch;
+ (id)getPreferencesValueforKey:(id)a3 domain:(__CFString *)a4;
+ (void)addToHomeScreen;
+ (void)exitCaptiveModeRemovingFromHomeScreen:(BOOL)a3;
+ (void)removeFromHomeScreen;
+ (void)setFBKVisibleInHomeScreen:(BOOL)a3;
+ (void)setPreferencesValue:(id)a3 forKey:(id)a4 domain:(__CFString *)a5;
@end

@implementation iFBKUtils

+ (BOOL)deviceSupportsFaceID
{
  if (deviceSupportsFaceID_onceToken != -1) {
    dispatch_once(&deviceSupportsFaceID_onceToken, &__block_literal_global_29);
  }
  return deviceSupportsFaceID__usesFaceID;
}

+ (void)addToHomeScreen
{
  v3 = +[FBKLog appHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22A36D000, v3, OS_LOG_TYPE_DEFAULT, "Adding to home screen", v4, 2u);
  }

  [a1 setFBKVisibleInHomeScreen:1];
}

+ (void)removeFromHomeScreen
{
  v3 = +[FBKLog appHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22A36D000, v3, OS_LOG_TYPE_DEFAULT, "Removing from home screen", v4, 2u);
  }

  [a1 setFBKVisibleInHomeScreen:0];
}

+ (void)exitCaptiveModeRemovingFromHomeScreen:(BOOL)a3
{
  v5 = +[FBKData sharedInstance];
  v6 = [v5 loginManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__iFBKUtils_exitCaptiveModeRemovingFromHomeScreen___block_invoke;
  v7[3] = &__block_descriptor_41_e5_v8__0l;
  BOOL v8 = a3;
  v7[4] = a1;
  [v6 logOutIfNeededAndRun:v7];
}

+ (void)setFBKVisibleInHomeScreen:(BOOL)a3
{
  v4 = [NSNumber numberWithBool:a3];
  [a1 setPreferencesValue:v4 forKey:@"SBIconVisibility" domain:@"com.apple.appleseed.FeedbackAssistant"];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.appIconVisibilityPreferencesChanged", 0, 0, 1u);
}

+ (BOOL)wasFBAVisibleAtFirstLaunch
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__iFBKUtils_wasFBAVisibleAtFirstLaunch__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (wasFBAVisibleAtFirstLaunch_onceToken != -1) {
    dispatch_once(&wasFBAVisibleAtFirstLaunch_onceToken, block);
  }
  return wasFBAVisibleAtFirstLaunch__wasVisible;
}

+ (BOOL)isFBAVisibleInHomeScreen
{
  v2 = [a1 getPreferencesValueforKey:@"SBIconVisibility" domain:@"com.apple.appleseed.FeedbackAssistant"];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (id)getPreferencesValueforKey:(id)a3 domain:(__CFString *)a4
{
  v5 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a4);
  v6 = (void *)CFPreferencesCopyAppValue(v5, a4);

  return v6;
}

+ (void)setPreferencesValue:(id)a3 forKey:(id)a4 domain:(__CFString *)a5
{
  CFStringRef v6 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSetValue((CFStringRef)a4, a3, a5, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);

  CFPreferencesSynchronize(a5, v6, v7);
}

@end