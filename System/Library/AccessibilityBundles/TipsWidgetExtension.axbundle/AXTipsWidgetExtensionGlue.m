@interface AXTipsWidgetExtensionGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXTipsWidgetExtensionGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F21400] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];

    _Failover = [objc_allocWithZone((Class)AXTipsWidgetExtensionGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __58__AXTipsWidgetExtensionGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __58__AXTipsWidgetExtensionGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"TipsWidgetExtension AX Bundle"];
  [v2 setOverrideProcessName:@"TipsWidgetExtension"];

  return MEMORY[0x270F09468]();
}

void __58__AXTipsWidgetExtensionGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"TPSWidgetTipViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TipsWidgetExtensionUIViewAccessibility" canInteractWithTargetClass:1];
}

@end