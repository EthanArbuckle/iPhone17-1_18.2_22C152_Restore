@interface AXInvertColors_CoverSheet
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_CoverSheet

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CSCoverSheetViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"CSModalButton" isKindOfClass:@"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"_updateBackground", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"coverSheetView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetView", @"backgroundView", "@", 0);
  [v3 validateClass:@"CSPasscodeViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"_screenWakeAnimationController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFLegacyWallpaperWakeAnimator", @"wakeEffectView", "@", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"CSBatteryFillViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CSCoverSheetViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CSModalButtonInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CSPasscodeViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CSPasscodeBackgroundViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end