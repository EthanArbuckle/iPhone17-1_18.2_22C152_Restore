@interface AXMobileSlideShowGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMobileSlideShowGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_288 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_297];

    _Failover = [objc_allocWithZone((Class)AXMobileSlideShowGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __54__AXMobileSlideShowGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLGenericAlbum", @"localizedTitle", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLGenericAlbum", @"count", "Q", 0);

  return 1;
}

uint64_t __54__AXMobileSlideShowGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MobileSlideShow AX Bundle"];
  [v2 setOverrideProcessName:@"MobileSlideShow"];

  return MEMORY[0x270F0A270]();
}

uint64_t __54__AXMobileSlideShowGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"WAUIDimmingViewAccessibility" canInteractWithTargetClass:1];
}

@end