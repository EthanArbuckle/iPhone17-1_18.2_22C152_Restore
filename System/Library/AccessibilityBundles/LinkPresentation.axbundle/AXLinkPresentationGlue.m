@interface AXLinkPresentationGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXLinkPresentationGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F21400] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_273 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];

    _Failover = [objc_allocWithZone((Class)AXLinkPresentationGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __55__AXLinkPresentationGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (NSClassFromString(&cfstr_Richlinkplugin.isa)) {
    [v2 validateClass:@"RichLinkView"];
  }

  return 1;
}

uint64_t __55__AXLinkPresentationGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setOverrideProcessName:@"LinkPresentationFramework"];
  [v2 setDebugBuild:0];
  [v2 setValidationTargetName:@"LinkPresentationFramework"];

  return MEMORY[0x270F09468]();
}

void __55__AXLinkPresentationGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"LPLinkViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LPTextViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LPCollaborationFooterViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LPCaptionBarButtonViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LPPlayButtonControlAccessibility" canInteractWithTargetClass:1];
}

@end