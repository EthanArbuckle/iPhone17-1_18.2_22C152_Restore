@interface AXAnnotationKitGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXAnnotationKitGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global_0 withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXAnnotationKitGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __52__AXAnnotationKitGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __52__AXAnnotationKitGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AnnotationKit AX Bundle"];
  [v2 setOverrideProcessName:@"AnnotationKit"];

  return MEMORY[0x270F0A270]();
}

void __52__AXAnnotationKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"UIToolbarButtonAccessibility__AnnotationKit__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIButtonAccessibility__AnnotationKit__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIColorAccessibility__AnnotationKit__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKAnnotationLayerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKOverlayViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKColorPaletteViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKLineStylesViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKTextAttributesViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKFontSizePickerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKSegmentedCtrlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKSignatureTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKSignatureViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKCandidatePickerView_iOSAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKSmoothPathViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKColorPaletteButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKToolbarViewController_iOSAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKHighlightColorEditorControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKLegacyDoodleControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKPageControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKToolbarViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKShapesPickerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKToggleButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AKInkSignatureViewAccessibility" canInteractWithTargetClass:1];
}

@end