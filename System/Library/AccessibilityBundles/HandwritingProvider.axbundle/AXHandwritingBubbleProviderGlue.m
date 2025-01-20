@interface AXHandwritingBubbleProviderGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXHandwritingBubbleProviderGlue

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

    _Failover = [objc_allocWithZone((Class)AXHandwritingBubbleProviderGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __64__AXHandwritingBubbleProviderGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __64__AXHandwritingBubbleProviderGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MobileSMS HandwritingProvider AX"];
  [v2 setOverrideProcessName:@"MobileSMS HandwritingProvider"];

  return MEMORY[0x270F0A270]();
}

void __64__AXHandwritingBubbleProviderGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"HWBrowserViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HWHandwritingItemColectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HWFavoritesPickerViewAccessibility" canInteractWithTargetClass:1];
}

@end