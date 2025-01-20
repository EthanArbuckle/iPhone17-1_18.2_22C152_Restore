@interface AXInvertColors_MaterialKit
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_MaterialKit

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MTMaterialView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTMaterialView", @"_materialLayer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTMaterialView", @"_invalidateAlphaTransformer", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTMaterialView", @"_setupAlphaTransformer", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTMaterialView", @"setContentReplacedWithSnapshot:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTMaterialLayer", @"setReduceTransparencyEnabled:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTMaterialLayer", @"isReduceTransparencyEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTMaterialLayer", @"_configureIfNecessaryWithSettingsInterpolator:", "v", "@", 0);
  if (AXProcessIsSpringBoard()) {
    [v3 validateClass:@"SBDockView"];
  }
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"MTMaterialViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MTMaterialLayerInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end