@interface AXSpotlightUIInternalFrameworkGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXSpotlightUIInternalFrameworkGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = objc_alloc_init(AXSpotlightUIInternalFrameworkGlue);
    MEMORY[0x270F9A758]();
  }
}

uint64_t __67__AXSpotlightUIInternalFrameworkGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __67__AXSpotlightUIInternalFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"SpotlightUIInternal Framework AX bundle"];
  [v2 setOverrideProcessName:@"SpotlightUIInternal Framework"];

  return MEMORY[0x270F0A270]();
}

void __67__AXSpotlightUIInternalFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SPUISearchHeaderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SPUISearchViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SPUIViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SPUIResultsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIButtonAccessibility__SpotlightUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SPUITextFieldAccessibility" canInteractWithTargetClass:1];
}

@end