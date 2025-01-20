@interface AXTipsGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXTipsGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXTipsGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __43__AXTipsGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __43__AXTipsGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Tips AX Bundle"];
  [v2 setOverrideProcessName:@"Tips"];

  return MEMORY[0x270F0A270]();
}

void __43__AXTipsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"TPSUICollectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TPSTipCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TPSViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TPSPageControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIBarButtonItemAccessibility__Tips__UIKit" canInteractWithTargetClass:1];
}

@end