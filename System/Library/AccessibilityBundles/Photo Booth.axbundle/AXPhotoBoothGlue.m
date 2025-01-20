@interface AXPhotoBoothGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXPhotoBoothGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_346 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_355];

    _Failover = [objc_allocWithZone((Class)AXPhotoBoothGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __49__AXPhotoBoothGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PBShelfTile", @"isSelected", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PBEffectsController", @"takePicture:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"AVCaptureDeviceInput", @"device", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"AVCaptureDevice", @"position", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PBFilter", @"localizedName", "@", 0);
  [v2 validateClass:@"PBEffectsController" hasInstanceVariable:@"_cameraController" withType:"CUCaptureController"];
  [v2 validateClass:@"PhotoBoothApplication" hasInstanceVariable:@"_photoBoothController" withType:"PBController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CUCaptureController", @"_captureEngine", "@", 0);
  [v2 validateClass:@"PBController"];
  [v2 validateClass:@"PBController" hasInstanceVariable:@"_effectsController" withType:"PBEffectsController"];
  [v2 validateClass:@"PBEffectsController" hasInstanceVariable:@"_effectsView" withType:"PBEffectsView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PBEffectsView", @"currentEffect", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PBEffectsController", @"_currentDevicePosition", "q", 0);

  return 1;
}

uint64_t __49__AXPhotoBoothGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"PBControllerAccessibility.m"];
  [v2 setOverrideProcessName:@"Photobooth"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __49__AXPhotoBoothGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"PBControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PBShelfTileAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PBEffectsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PBContainerViewAccessibility" canInteractWithTargetClass:1];
}

@end