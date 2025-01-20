@interface AXVectorKitGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXVectorKitGlue

+ (void)accessibilityInitializeBundle
{
  if (+[AXVectorKitGlue accessibilityInitializeBundle]::onceToken != -1) {
    dispatch_once(&+[AXVectorKitGlue accessibilityInitializeBundle]::onceToken, &__block_literal_global_285);
  }
}

void __48__AXVectorKitGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_289_0 withPreValidationHandler:&__block_literal_global_322 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_331];
}

uint64_t __48__AXVectorKitGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"VKMapCanvas"];
  [v2 validateClass:@"VKMapView" isKindOfClass:@"CALayer"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"VKMapView", @"convertPoint: toCoordinateFromLayer:", "{?=dd}", "{CGPoint=dd}", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"VKMapView", @"convertCoordinate: toPointToLayer:", "{CGPoint=dd}", "{?=dd}", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"VKMapView", @"roadLabelTilesInScene", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"VKMapView", @"localizeLabels", "B", 0);
  [v2 validateClass:@"_MKAnnotationViewCustomFeatureAnnotation"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"_MKAnnotationViewCustomFeatureAnnotation", @"annotationView", "@", 0);

  return 1;
}

uint64_t __48__AXVectorKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setOverrideProcessName:@"VectorKit"];
  [v2 setValidationTargetName:@"VectorKit Accessibility Bundle"];
  uint64_t v3 = AXPerformValidationChecks();

  return v3;
}

void __48__AXVectorKitGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"VKMapCanvasAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VKMapViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VKMapCameraControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VKCameraDelegateMediatorAccessibility" canInteractWithTargetClass:1];
}

@end