@interface AXInvertColors_CameraUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_CameraUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CAMPreviewView"];
  [v3 validateClass:@"CAMVideoPreviewView"];
  [v3 validateClass:@"CAMViewfinderView"];
  [v3 validateClass:@"CAMCameraViewControllerContainerView"];
  [v3 validateClass:@"CAMFullscreenViewfinder"];
  [v3 validateClass:@"CAMSemanticStyleSettingsView" hasInstanceVariable:@"__semanticStyleImageViews" withType:"NSArray"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"CAMPreviewViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CAMVideoPreviewViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CAMCameraViewControllerContainerViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CAMViewfinderViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CAMSecureWindowInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CAMFullscreenViewfinderInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CAMSemanticStyleSettingsViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end