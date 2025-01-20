@interface CBPreferencesSettingsProvider
+ (CBPreferencesSettingsProvider)sharedInstance;
- (BOOL)specifiesAABCurveUpdateStrategy;
- (unint64_t)aabUpdateStrategyType;
@end

@implementation CBPreferencesSettingsProvider

+ (CBPreferencesSettingsProvider)sharedInstance
{
  objc_sync_enter(a1);
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_16);
  }
  v3 = (CBPreferencesSettingsProvider *)sharedInstance__sharedObject_6;
  objc_sync_exit(a1);
  return v3;
}

CBPreferencesSettingsProvider *__47__CBPreferencesSettingsProvider_sharedInstance__block_invoke()
{
  result = objc_alloc_init(CBPreferencesSettingsProvider);
  sharedInstance__sharedObject_6 = (uint64_t)result;
  return result;
}

- (BOOL)specifiesAABCurveUpdateStrategy
{
  v3 = (CFStringRef *)MEMORY[0x1E4F1D3F0];
  CFPreferencesSynchronize(@"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  id v4 = (id)CFPreferencesCopyValue(@"CBAABCurveUpdateStrategyType", @"com.apple.CoreBrightness", *v3, (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if (!v4) {
    return 0;
  }

  return 1;
}

- (unint64_t)aabUpdateStrategyType
{
  unint64_t v5 = 2;
  v3 = (CFStringRef *)MEMORY[0x1E4F1D3F0];
  CFPreferencesSynchronize(@"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  id v4 = (id)CFPreferencesCopyValue(@"CBAABCurveUpdateStrategyType", @"com.apple.CoreBrightness", *v3, (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v5 = (int)[v4 intValue];
  }

  return v5;
}

@end