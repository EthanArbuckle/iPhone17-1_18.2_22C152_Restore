@interface AXBusinessGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXBusinessGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXBusinessGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __47__AXBusinessGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __47__AXBusinessGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Business AX"];
  [v2 setOverrideProcessName:@"Business"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __47__AXBusinessGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"IMBTimeslotViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"IMBDateTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"IMBTimeslotsContainerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ListPickerTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"IMBBubbleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ApplePayBubbleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"IMBDefaultSectionHeaderAccessibility" canInteractWithTargetClass:1];
}

@end