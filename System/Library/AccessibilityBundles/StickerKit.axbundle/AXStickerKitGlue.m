@interface AXStickerKitGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXStickerKitGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_280 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_289];

    _Failover = [objc_allocWithZone((Class)AXStickerKitGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __49__AXStickerKitGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"STKImageGlyph", @"searchText", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"STKImageGlyph", @"toString", "@", 0);
  [v2 validateClass:@"STKStickerRemoteSearchViewController"];

  return 1;
}

uint64_t __49__AXStickerKitGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"StickerKit AX"];
  [v2 setOverrideProcessName:@"StickerKit"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

uint64_t __49__AXStickerKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"EmojiGenerationBlobViewAccessibility" canInteractWithTargetClass:1];
}

@end