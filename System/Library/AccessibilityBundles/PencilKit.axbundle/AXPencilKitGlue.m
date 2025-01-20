@interface AXPencilKitGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXPencilKitGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __48__AXPencilKitGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_271 withPreValidationHandler:&__block_literal_global_273 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];
}

uint64_t __48__AXPencilKitGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __48__AXPencilKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AX PencilKit"];
  [v2 setOverrideProcessName:@"AX PencilKit"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __48__AXPencilKitGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"PKColorMatrixViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKRulerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_PKColorAlphaSliderIOSAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_PKInkThicknessPickerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_PKInkThicknessButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaletteToolViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaletteInkingToolViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaletteAdditionalOptionsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaletteColorSwatchAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaletteContentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaletteUndoRedoViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaletteViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaletteHostViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKDragIndicatorViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaletteReturnKeyButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CHTextInputGestureAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKTextInputHandwritingShotAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKCanvasViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKStrokeAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaletteButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKSqueezePaletteButtonFactoryAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKSqueezePaletteMulticolorSwatchButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaletteOptionSwitchCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaletteDictationBarButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaletteMoreOptionsViewControllerAccessibility" canInteractWithTargetClass:1];
}

@end