@interface STKInternalSettings
+ (BOOL)BOOLForKey:(id)a3 withDefaultValue:(BOOL)a4;
+ (BOOL)autoPopulateDebugPrompts;
+ (BOOL)autoSelectSingleAmbiguity;
+ (BOOL)bypassPersonCheck;
+ (BOOL)disableImageSafety;
+ (BOOL)disablePromptSafety;
+ (BOOL)disableRewrites;
+ (BOOL)emulateNonInternalBuild;
+ (BOOL)emulateSeedBuild;
+ (BOOL)isInternalBuild;
+ (BOOL)isSeedBuild;
+ (BOOL)pinBottomLabelToBottom;
+ (BOOL)runVGFRemoveBackground;
+ (BOOL)showCamera;
+ (BOOL)showDisambiguationUI;
+ (NSUserDefaults)defaults;
+ (double)floatForKey:(id)a3 withDefaultValue:(double)a4;
+ (id)autoPopulateDebugPromptsSettingsValue;
+ (id)autoSelectSingleAmbiguitySettingsValue;
+ (id)bypassPersonCheckSettingsValue;
+ (id)defaultRewriteCountSettingsValue;
+ (id)defaultsKeyForKey:(id)a3;
+ (id)disableImageSafetySettingsValue;
+ (id)disablePromptSafetySettingsValue;
+ (id)disableRewritesSettingsValue;
+ (id)emulateNonInternalBuildSettingsValue;
+ (id)emulateSeedBuildSettingsValue;
+ (id)maxRewriteWordCountSettingsValue;
+ (id)pinBottomLabelToBottomSettingsValue;
+ (id)runVGFRemoveBackgroundSettingsValue;
+ (id)settingsValueForKey:(id)a3;
+ (id)showCameraSettingsValue;
+ (id)showDisambiguationUISettingsValue;
+ (int64_t)defaultRewriteCount;
+ (int64_t)integerForKey:(id)a3 withDefaultValue:(int64_t)a4;
+ (int64_t)maxRewriteWordCount;
@end

@implementation STKInternalSettings

+ (NSUserDefaults)defaults
{
  if (defaults_onceToken[0] != -1) {
    dispatch_once(defaults_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)defaults_sDefaults;

  return (NSUserDefaults *)v2;
}

uint64_t __31__STKInternalSettings_defaults__block_invoke()
{
  defaults_sDefaults = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.StickerKit.InternalSettings"];

  return MEMORY[0x270F9A758]();
}

+ (id)settingsValueForKey:(id)a3
{
  v4 = [a3 stringByAppendingString:@"SettingsValue"];
  SEL v5 = NSSelectorFromString(v4);
  if (objc_opt_respondsToSelector())
  {
    v6 = [a1 performSelector:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)runVGFRemoveBackground
{
  return [a1 BOOLForKey:@"runVGFRemoveBackground" withDefaultValue:1];
}

+ (BOOL)autoPopulateDebugPrompts
{
  return [a1 BOOLForKey:@"autoPopulateDebugPrompts" withDefaultValue:0];
}

+ (BOOL)bypassPersonCheck
{
  return [a1 BOOLForKey:@"bypassPersonCheck" withDefaultValue:0];
}

+ (BOOL)disablePromptSafety
{
  return [a1 BOOLForKey:@"disablePromptSafety" withDefaultValue:0];
}

+ (BOOL)disableImageSafety
{
  return [a1 BOOLForKey:@"disableImageSafety" withDefaultValue:0];
}

+ (BOOL)showCamera
{
  return [a1 BOOLForKey:@"showCamera" withDefaultValue:0];
}

+ (BOOL)showDisambiguationUI
{
  return [a1 BOOLForKey:@"showDisambiguationUI" withDefaultValue:1];
}

+ (BOOL)autoSelectSingleAmbiguity
{
  return [a1 BOOLForKey:@"autoSelectSingleAmbiguity" withDefaultValue:1];
}

+ (BOOL)emulateNonInternalBuild
{
  return [a1 BOOLForKey:@"emulateNonInternalBuild" withDefaultValue:0];
}

+ (BOOL)isInternalBuild
{
  if ([a1 emulateNonInternalBuild]) {
    return 0;
  }

  return MEMORY[0x270F3D618]();
}

+ (BOOL)emulateSeedBuild
{
  return [a1 BOOLForKey:@"emulateSeedBuild" withDefaultValue:0];
}

+ (BOOL)isSeedBuild
{
  if ([a1 emulateSeedBuild]) {
    return 1;
  }

  return MEMORY[0x270F3D628]();
}

+ (BOOL)disableRewrites
{
  return [a1 BOOLForKey:@"disableRewrites" withDefaultValue:0];
}

+ (int64_t)defaultRewriteCount
{
  return [a1 integerForKey:@"defaultRewriteCount" withDefaultValue:4];
}

+ (int64_t)maxRewriteWordCount
{
  return [a1 integerForKey:@"maxRewriteWordCount" withDefaultValue:5];
}

+ (BOOL)pinBottomLabelToBottom
{
  return [a1 BOOLForKey:@"pinBottomLabelToBottom" withDefaultValue:0];
}

+ (id)runVGFRemoveBackgroundSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 runVGFRemoveBackground];

  return (id)[v2 numberWithBool:v3];
}

+ (id)autoPopulateDebugPromptsSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 autoPopulateDebugPrompts];

  return (id)[v2 numberWithBool:v3];
}

+ (id)bypassPersonCheckSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 bypassPersonCheck];

  return (id)[v2 numberWithBool:v3];
}

+ (id)disablePromptSafetySettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 disablePromptSafety];

  return (id)[v2 numberWithBool:v3];
}

+ (id)disableImageSafetySettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 disableImageSafety];

  return (id)[v2 numberWithBool:v3];
}

+ (id)showCameraSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 showCamera];

  return (id)[v2 numberWithBool:v3];
}

+ (id)showDisambiguationUISettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 showDisambiguationUI];

  return (id)[v2 numberWithBool:v3];
}

+ (id)autoSelectSingleAmbiguitySettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 autoSelectSingleAmbiguity];

  return (id)[v2 numberWithBool:v3];
}

+ (id)disableRewritesSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 disableRewrites];

  return (id)[v2 numberWithBool:v3];
}

+ (id)defaultRewriteCountSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 defaultRewriteCount];

  return (id)[v2 numberWithInteger:v3];
}

+ (id)maxRewriteWordCountSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 maxRewriteWordCount];

  return (id)[v2 numberWithInteger:v3];
}

+ (id)emulateNonInternalBuildSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 emulateNonInternalBuild];

  return (id)[v2 numberWithBool:v3];
}

+ (id)emulateSeedBuildSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 emulateSeedBuild];

  return (id)[v2 numberWithBool:v3];
}

+ (id)pinBottomLabelToBottomSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 pinBottomLabelToBottom];

  return (id)[v2 numberWithBool:v3];
}

+ (id)defaultsKeyForKey:(id)a3
{
  return (id)[@"com.apple.StickerKit.InternalSettings" stringByAppendingPathExtension:a3];
}

+ (BOOL)BOOLForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  v6 = [a1 defaultsKeyForKey:a3];
  v7 = [a1 defaults];
  v8 = [v7 objectForKey:v6];

  if (v8) {
    a4 = [v8 BOOLValue];
  }

  return a4;
}

+ (double)floatForKey:(id)a3 withDefaultValue:(double)a4
{
  v6 = [a1 defaultsKeyForKey:a3];
  v7 = [a1 defaults];
  v8 = [v7 objectForKey:v6];

  if (v8)
  {
    [v8 floatValue];
    a4 = v9;
  }

  return a4;
}

+ (int64_t)integerForKey:(id)a3 withDefaultValue:(int64_t)a4
{
  v6 = [a1 defaultsKeyForKey:a3];
  v7 = [a1 defaults];
  v8 = [v7 objectForKey:v6];

  if (v8) {
    a4 = [v8 integerValue];
  }

  return a4;
}

@end