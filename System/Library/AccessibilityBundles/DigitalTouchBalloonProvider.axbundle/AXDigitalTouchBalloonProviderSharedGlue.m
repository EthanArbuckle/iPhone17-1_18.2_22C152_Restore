@interface AXDigitalTouchBalloonProviderSharedGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXDigitalTouchBalloonProviderSharedGlue

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

void __72__AXDigitalTouchBalloonProviderSharedGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_274 withPreValidationHandler:&__block_literal_global_276 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_282];
}

uint64_t __72__AXDigitalTouchBalloonProviderSharedGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __72__AXDigitalTouchBalloonProviderSharedGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AX DigitalTouchBalloonProvider"];
  [v2 setOverrideProcessName:@"AX DigitalTouchBalloonProvider"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __72__AXDigitalTouchBalloonProviderSharedGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"ETTranscriptDetailCanvasViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ETTranscriptColorWheelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ColorWheelPickerCircleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ETCompositionUIButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GestureInstructionItemViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ETHorizontalColorPickerAccessibility" canInteractWithTargetClass:1];
}

@end