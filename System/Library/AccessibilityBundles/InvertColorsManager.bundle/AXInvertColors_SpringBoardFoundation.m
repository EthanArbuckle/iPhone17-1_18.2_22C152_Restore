@interface AXInvertColors_SpringBoardFoundation
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_SpringBoardFoundation

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBFWallpaperView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFWakeAnimationSettings", @"sleepColorBrightness", "d", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"SBFWallpaperViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBFWakeAnimationSettingsInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBFLockScreenDateViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end