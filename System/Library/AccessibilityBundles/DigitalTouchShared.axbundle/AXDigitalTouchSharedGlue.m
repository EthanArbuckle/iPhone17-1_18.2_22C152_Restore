@interface AXDigitalTouchSharedGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXDigitalTouchSharedGlue

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

void __57__AXDigitalTouchSharedGlue_accessibilityInitializeBundle__block_invoke()
{
  v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

  id v1 = [MEMORY[0x263F22850] sharedInstance];
  [v1 addHandler:&__block_literal_global_300 forFramework:@"DigitalTouchBalloonProvider"];
}

uint64_t __57__AXDigitalTouchSharedGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __57__AXDigitalTouchSharedGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AX DigitalTouchShared"];
  [v2 setOverrideProcessName:@"AX DigitalTouchShared"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __57__AXDigitalTouchSharedGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"ETCanvasViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIColorAccessibility_ElectricTouch_UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ETMessageAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ETTapMessageAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ETHeartbeatMessageAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ETSketchMessageAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ETPaletteCircleViewAccessibility" canInteractWithTargetClass:1];
}

void __57__AXDigitalTouchSharedGlue_accessibilityInitializeBundle__block_invoke_5()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_302 withPreValidationHandler:&__block_literal_global_307 postValidationHandler:&__block_literal_global_310];
}

uint64_t __57__AXDigitalTouchSharedGlue_accessibilityInitializeBundle__block_invoke_6(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __57__AXDigitalTouchSharedGlue_accessibilityInitializeBundle__block_invoke_7()
{
  return 1;
}

@end