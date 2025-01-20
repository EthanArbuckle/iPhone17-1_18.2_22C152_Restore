@interface AXInvertColors_CameraEffectsKit
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_CameraEffectsKit

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CFXCaptureViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"CFXFilterEffectPickerView"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"CFXCaptureViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CFXFilterEffectPickerViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CFXFilterPickerCollectionViewCellInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end