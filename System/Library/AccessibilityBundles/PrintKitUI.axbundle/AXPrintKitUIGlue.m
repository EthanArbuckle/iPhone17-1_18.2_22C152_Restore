@interface AXPrintKitUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXPrintKitUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXPrintKitUIGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __49__AXPrintKitUIGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __49__AXPrintKitUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"PrintKitUI AX"];
  [v2 setOverrideProcessName:@"PrintKitUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __49__AXPrintKitUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"UIPrintSegmentedSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIPrintPanelWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIPrinterTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIPrinterBrowserViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIPrinterSearchingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIPrintPanelViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIPrintOrientationOptionAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIPrintPreviewPageCellAccessibility" canInteractWithTargetClass:1];
}

@end