@interface FLEnvironment
+ (id)currentEnvironment;
- (BOOL)followUpExtensionSupportEnabled;
- (BOOL)followUpZeroActionsForTheWorld;
- (BOOL)isInternal;
- (BOOL)isUnlocked;
- (BOOL)normalizeExpirationToMidnight;
- (BOOL)shouldHideAllFollowUps;
- (BOOL)shouldShowUnapprovedItems;
- (BOOL)stressMode;
- (FLEnvironment)init;
- (NSUserDefaults)followupDefaults;
- (double)oneDayTimeInterval;
- (id)stressBundleIdentifiers;
- (id)supportedBundleIdentifiers;
- (id)supportedNotifyingAppIds;
- (void)setFollowupDefaults:(id)a3;
@end

@implementation FLEnvironment

uint64_t __35__FLEnvironment_currentEnvironment__block_invoke(uint64_t a1)
{
  currentEnvironment_env = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (FLEnvironment)init
{
  v5.receiver = self;
  v5.super_class = (Class)FLEnvironment;
  v2 = [(FLEnvironment *)&v5 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.followup"];
    [(FLEnvironment *)v2 setFollowupDefaults:v3];
  }
  return v2;
}

- (void)setFollowupDefaults:(id)a3
{
}

- (id)supportedBundleIdentifiers
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__FLEnvironment_supportedBundleIdentifiers__block_invoke;
  block[3] = &unk_1E637B070;
  block[4] = self;
  if (supportedBundleIdentifiers_onceToken != -1) {
    dispatch_once(&supportedBundleIdentifiers_onceToken, block);
  }
  return (id)supportedBundleIdentifiers_bundleIdentifiers;
}

+ (id)currentEnvironment
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__FLEnvironment_currentEnvironment__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentEnvironment_onceToken != -1) {
    dispatch_once(&currentEnvironment_onceToken, block);
  }
  v2 = (void *)currentEnvironment_env;

  return v2;
}

- (BOOL)shouldHideAllFollowUps
{
  if (shouldHideAllFollowUps_onceToken != -1) {
    dispatch_once(&shouldHideAllFollowUps_onceToken, &__block_literal_global_10_0);
  }
  return shouldHideAllFollowUps_hideAll;
}

- (BOOL)isInternal
{
  if (isInternal_onceToken != -1) {
    dispatch_once(&isInternal_onceToken, &__block_literal_global_7);
  }
  return isInternal_isInternalBuild;
}

uint64_t __27__FLEnvironment_isInternal__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isInternal_isInternalBuild = result;
  return result;
}

- (BOOL)shouldShowUnapprovedItems
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__FLEnvironment_shouldShowUnapprovedItems__block_invoke;
  block[3] = &unk_1E637B070;
  block[4] = self;
  if (shouldShowUnapprovedItems_onceToken != -1) {
    dispatch_once(&shouldShowUnapprovedItems_onceToken, block);
  }
  return shouldShowUnapprovedItems_shouldShowUnapprovedItems;
}

void __42__FLEnvironment_shouldShowUnapprovedItems__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) followupDefaults];
  v2 = [v1 valueForKey:@"ShouldShowUnapprovedItems"];

  v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    objc_super v5 = v2;
    _os_log_impl(&dword_1BE24A000, v3, OS_LOG_TYPE_DEFAULT, "Read ShouldShowUnapprovedItems: %@", (uint8_t *)&v4, 0xCu);
  }

  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      shouldShowUnapprovedItems_shouldShowUnapprovedItems = [v2 BOOLValue];
    }
  }
}

- (BOOL)isUnlocked
{
  return !MEMORY[0x1E4F780B0] || MKBGetDeviceLockState() == 0;
}

void __39__FLEnvironment_shouldHideAllFollowUps__block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  shouldHideAllFollowUps_hideAll = CFPreferencesGetAppBooleanValue(@"HideAll", @"com.apple.followup", 0) != 0;
  v0 = _FLLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = [NSNumber numberWithBool:shouldHideAllFollowUps_hideAll];
    int v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_1BE24A000, v0, OS_LOG_TYPE_DEFAULT, "Read HideAll: %@", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)followUpExtensionSupportEnabled
{
  return 1;
}

- (BOOL)followUpZeroActionsForTheWorld
{
  return CFPreferencesGetAppBooleanValue(@"ZeroActionsEnabled", @"com.apple.followup", 0) != 0;
}

- (BOOL)stressMode
{
  if (stressMode_onceToken != -1) {
    dispatch_once(&stressMode_onceToken, &__block_literal_global_18);
  }
  return stressMode_stress;
}

void __27__FLEnvironment_stressMode__block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  stressMode_stress = CFPreferencesGetAppBooleanValue(@"StressMode", @"com.apple.followup", 0) != 0;
  v0 = _FLLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = [NSNumber numberWithBool:stressMode_stress];
    int v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_1BE24A000, v0, OS_LOG_TYPE_DEFAULT, "Read StressMode: %@", (uint8_t *)&v2, 0xCu);
  }
}

void __43__FLEnvironment_supportedBundleIdentifiers__block_invoke(uint64_t a1)
{
  v4[2] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) stressMode])
  {
    supportedBundleIdentifiers_bundleIdentifiers = [*(id *)(a1 + 32) stressBundleIdentifiers];
    MEMORY[0x1F41817F8]();
  }
  else
  {
    v4[0] = @"com.apple.Preferences";
    v4[1] = @"com.apple.Bridge";
    uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
    v3 = (void *)supportedBundleIdentifiers_bundleIdentifiers;
    supportedBundleIdentifiers_bundleIdentifiers = v2;
  }
}

- (id)stressBundleIdentifiers
{
  if (stressBundleIdentifiers_onceToken != -1) {
    dispatch_once(&stressBundleIdentifiers_onceToken, &__block_literal_global_24);
  }
  uint64_t v2 = (void *)stressBundleIdentifiers_bundleIdentifiers;

  return v2;
}

void __40__FLEnvironment_stressBundleIdentifiers__block_invoke()
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.Preferences";
  v2[1] = @"com.apple.Bridge";
  v2[2] = @"com.apple.Home";
  v2[3] = @"com.apple.mobilesafari";
  v2[4] = @"com.apple.MobileSMS";
  v2[5] = @"com.apple.mobileslideshow";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  v1 = (void *)stressBundleIdentifiers_bundleIdentifiers;
  stressBundleIdentifiers_bundleIdentifiers = v0;
}

- (BOOL)normalizeExpirationToMidnight
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(FLEnvironment *)self followupDefaults];
  v3 = [v2 valueForKey:@"NormalizeToMidnight"];

  uint64_t v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1BE24A000, v4, OS_LOG_TYPE_DEFAULT, "Read NormalizeToMidnight: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = normalizeExpirationToMidnight_result != 0;
  }
  normalizeExpirationToMidnight_uint64_t result = v5;

  return v5;
}

- (double)oneDayTimeInterval
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__FLEnvironment_oneDayTimeInterval__block_invoke;
  block[3] = &unk_1E637B070;
  block[4] = self;
  if (oneDayTimeInterval_onceToken != -1) {
    dispatch_once(&oneDayTimeInterval_onceToken, block);
  }
  return *(double *)&oneDayTimeInterval_timeInterval;
}

void __35__FLEnvironment_oneDayTimeInterval__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) followupDefaults];
  uint64_t v2 = [v1 valueForKey:@"OneDayInterval"];

  v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    int v7 = v2;
    _os_log_impl(&dword_1BE24A000, v3, OS_LOG_TYPE_DEFAULT, "Read OneDayInterval: %@", (uint8_t *)&v6, 0xCu);
  }

  [v2 doubleValue];
  if (v4 > 0.0)
  {
    [v2 doubleValue];
    oneDayTimeInterval_timeInterval = v5;
  }
}

- (id)supportedNotifyingAppIds
{
  if (supportedNotifyingAppIds_onceToken != -1) {
    dispatch_once(&supportedNotifyingAppIds_onceToken, &__block_literal_global_44);
  }
  uint64_t v2 = (void *)supportedNotifyingAppIds_appIds;

  return v2;
}

void __41__FLEnvironment_supportedNotifyingAppIds__block_invoke()
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.Preferences";
  v2[1] = @"com.apple.iCloud.FollowUp";
  v2[2] = @"com.apple.NDO.FollowUp";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  v1 = (void *)supportedNotifyingAppIds_appIds;
  supportedNotifyingAppIds_appIds = v0;
}

- (NSUserDefaults)followupDefaults
{
  return self->_followupDefaults;
}

- (void).cxx_destruct
{
}

@end