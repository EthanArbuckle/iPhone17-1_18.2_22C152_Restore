@interface AXSearchFoundationGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXSearchFoundationGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover_0)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global_0 withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover_0 = objc_alloc_init(AXSearchFoundationGlue);
    MEMORY[0x270F9A758]();
  }
}

uint64_t __55__AXSearchFoundationGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __55__AXSearchFoundationGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"SearchFoundation Framework AX bundle"];
  [v2 setOverrideProcessName:@"SearchFoundation Framework"];

  return MEMORY[0x270F0A270]();
}

void __55__AXSearchFoundationGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SFSearchResultAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFTextAccessibility" canInteractWithTargetClass:1];
}

@end