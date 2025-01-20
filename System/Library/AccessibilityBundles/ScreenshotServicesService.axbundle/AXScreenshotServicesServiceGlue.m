@interface AXScreenshotServicesServiceGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXScreenshotServicesServiceGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __64__AXScreenshotServicesServiceGlue_accessibilityInitializeBundle__block_invoke()
{
  v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];

  id v1 = [MEMORY[0x263F22850] sharedInstance];
  [v1 addHandler:&__block_literal_global_306 forBundleID:@"com.apple.AnnotationKit.axbundle"];
}

uint64_t __64__AXScreenshotServicesServiceGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __64__AXScreenshotServicesServiceGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"ScreenshotServicesService AX Bundle"];
  [v2 setOverrideProcessName:@"Screenshot"];

  return MEMORY[0x270F0A270]();
}

void __64__AXScreenshotServicesServiceGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SSSScreenshotsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SSSScreenshotsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SSSCropOverlayGrabberViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SSSCropOverlayCornerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SSSScreenshotViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SSS_UIWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SSSDittoRootViewControllerAccessibility" canInteractWithTargetClass:1];
}

void __64__AXScreenshotServicesServiceGlue_accessibilityInitializeBundle__block_invoke_5()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_308 withPreValidationHandler:&__block_literal_global_320 postValidationHandler:0];
}

uint64_t __64__AXScreenshotServicesServiceGlue_accessibilityInitializeBundle__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"AKOverlayView"];
  [v2 validateClass:@"AKOverlayViewAccessibility"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"AKOverlayViewAccessibility", @"_accessibilityCreateOverlayViewElement", "@", 0);

  return 1;
}

uint64_t __64__AXScreenshotServicesServiceGlue_accessibilityInitializeBundle__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AnnotationKit"];
  [v2 setOverrideProcessName:@"AnnotationKit"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

@end