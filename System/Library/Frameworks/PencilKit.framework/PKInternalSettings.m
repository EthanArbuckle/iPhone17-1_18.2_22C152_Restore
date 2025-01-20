@interface PKInternalSettings
+ (id)sharedInstance;
- (uint64_t)forceShowImageWandOnboarding;
- (uint64_t)imageWandOnboardingDisabled;
- (uint64_t)showResetImageWandOnboardingInPalette;
@end

@implementation PKInternalSettings

+ (id)sharedInstance
{
  self;
  if (_MergedGlobals_166 != -1) {
    dispatch_once(&_MergedGlobals_166, &__block_literal_global_93);
  }
  v0 = (void *)qword_1EB3C6398;

  return v0;
}

void __36__PKInternalSettings_sharedInstance__block_invoke()
{
  if (os_variant_has_internal_diagnostics()) {
    v0 = objc_alloc_init(PKInternalSettings);
  }
  else {
    v0 = 0;
  }
  v1 = (void *)qword_1EB3C6398;
  qword_1EB3C6398 = (uint64_t)v0;
}

- (uint64_t)showResetImageWandOnboardingInPalette
{
  if (result)
  {
    v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v2 = [v1 BOOLForKey:@"internalSettings.drawing.showResetImageWandOnboardingInPalette"];

    return v2;
  }
  return result;
}

- (uint64_t)forceShowImageWandOnboarding
{
  if (result)
  {
    v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v2 = [v1 BOOLForKey:@"PKForceShowImageWandOnboarding"];

    return v2;
  }
  return result;
}

- (uint64_t)imageWandOnboardingDisabled
{
  if (result)
  {
    v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v2 = [v1 BOOLForKey:@"PKImageWandOnboardingDisabled"];

    return v2;
  }
  return result;
}

@end