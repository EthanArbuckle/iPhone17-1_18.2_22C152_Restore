@interface AXWorkflowUIServicesGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXWorkflowUIServicesGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXWorkflowUIServicesGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __57__AXWorkflowUIServicesGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __57__AXWorkflowUIServicesGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"WorkflowUIServices AX"];
  [v2 setOverrideProcessName:@"WorkflowUIServices"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __57__AXWorkflowUIServicesGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"WFWidgetConfigurationViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WFWidgetCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WFWidgetConfigurationCardHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WFWidgetConfigurationCardViewAccessibility" canInteractWithTargetClass:1];
}

@end