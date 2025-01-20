@interface LPSettings
+ (BOOL)disableAnimations;
+ (BOOL)disableAutoPlay;
+ (BOOL)disableLegacyStoreLookups;
+ (BOOL)showDebugIndicators;
+ (BOOL)subsampleImagesToScreenSize;
+ (BOOL)useLightweightMaterials;
+ (void)updateFromDefaults;
@end

@implementation LPSettings

+ (void)updateFromDefaults
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  showDebugIndicators = [v2 BOOLForKey:@"LPShowDebugIndicators"];
  disableLegacyStoreLookups = [v2 BOOLForKey:@"LPDisableLegacyStoreLookups"];
  disableAutoPlay = UIAccessibilityIsReduceMotionEnabled();
  disableAnimations = disableAutoPlay;
  if (updateFromDefaults_hasEverUpdated) {
    goto LABEL_3;
  }
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v5 = *MEMORY[0x1E4FB2498];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__LPSettings_updateFromDefaults__block_invoke_2;
  v7[3] = &unk_1E5B05600;
  id v8 = &__block_literal_global_7;
  id v6 = (id)[v3 addObserverForName:v5 object:0 queue:v4 usingBlock:v7];

  if (updateFromDefaults_hasEverUpdated == 1) {
LABEL_3:
  }
    +[LPTheme invalidateThemeCache];
  updateFromDefaults_hasEverUpdated = 1;
}

BOOL __32__LPSettings_updateFromDefaults__block_invoke()
{
  BOOL result = UIAccessibilityIsReduceMotionEnabled();
  disableAutoPlay = result;
  disableAnimations = result;
  return result;
}

uint64_t __32__LPSettings_updateFromDefaults__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)showDebugIndicators
{
  return showDebugIndicators;
}

+ (BOOL)disableLegacyStoreLookups
{
  return disableLegacyStoreLookups;
}

+ (BOOL)disableAutoPlay
{
  return disableAutoPlay;
}

+ (BOOL)disableAnimations
{
  return disableAnimations;
}

+ (BOOL)subsampleImagesToScreenSize
{
  v2 = +[LPTestingOverrides forceSubsampleImagesToScreenSize];

  if (!v2) {
    return 0;
  }
  v3 = +[LPTestingOverrides forceSubsampleImagesToScreenSize];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)useLightweightMaterials
{
  if (useLightweightMaterials_onceToken != -1) {
    dispatch_once(&useLightweightMaterials_onceToken, &__block_literal_global_11);
  }
  return useLightweightMaterials_lightweightMaterialsEnabled;
}

void __37__LPSettings_useLightweightMaterials__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  v0 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v2 setBackgroundColor:v0];

  v1 = [v2 layer];
  useLightweightMaterials_lightweightMaterialsEnabled = [v1 backgroundColor] == 0;
}

@end