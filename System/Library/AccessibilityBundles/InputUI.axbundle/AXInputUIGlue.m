@interface AXInputUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXInputUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_295 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_304];

    _Failover = [objc_allocWithZone((Class)AXInputUIGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __46__AXInputUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"IUIInputSourceViewController", @"textInputSource", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"IUIRTIInputSource", @"sourceSession", "@", 0);
  [v2 validateClass:@"RTIInputSystemSourceSession" isKindOfClass:@"RTIInputSystemSession"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"RTIInputSystemSession", @"documentTraits", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"RTIDocumentTraits", @"bundleId", "@", 0);

  return 1;
}

uint64_t __46__AXInputUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"InputUI AX"];
  [v2 setOverrideProcessName:@"InputUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

uint64_t __46__AXInputUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"InputUIWindowAccessibility" canInteractWithTargetClass:1];
}

@end