@interface AXWorkflowUIGlue
+ (void)_accessibilityPostScreenChangedAfterAnimation;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXWorkflowUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXWorkflowUIGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __49__AXWorkflowUIGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __49__AXWorkflowUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"WorkflowUI AX"];
  [v2 setOverrideProcessName:@"WorkflowUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __49__AXWorkflowUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"WFBackgroundFadingButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WFAutomationListViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WFWorkflowWizardNameIconButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WFSlotTemplateViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WFRunWorkflowToolbarAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WFRichContentItemCellViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WFTriggerOptionSelectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WFTableViewFooterLinkViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WFComposeViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WFAutomationTypeExplanationPlatterViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WFAutomationEmptyStateCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WFCompactPlatterPresentationControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WFCompactDialogViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WFCompactPlatterSashViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WFDrawerActionCellAccessibility" canInteractWithTargetClass:1];
}

+ (void)_accessibilityPostScreenChangedAfterAnimation
{
}

void __65__AXWorkflowUIGlue__accessibilityPostScreenChangedAfterAnimation__block_invoke()
{
}

@end