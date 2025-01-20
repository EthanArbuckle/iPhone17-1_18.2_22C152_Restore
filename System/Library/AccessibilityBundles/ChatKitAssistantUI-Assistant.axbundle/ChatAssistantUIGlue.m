@interface ChatAssistantUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation ChatAssistantUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_290 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_299];

    _Failover = [objc_allocWithZone((Class)ChatAssistantUIGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __52__ChatAssistantUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"CKMessageSnippetContentView"];
  [v2 validateClass:@"CKMessageSnippetContentView" hasInstanceVariable:@"_toLabel" withType:"UILabel"];
  [v2 validateClass:@"CKMessageSnippetContentView" hasInstanceVariable:@"_balloonImageView" withType:"CKTextBalloonView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageSnippetContentView", @"setBalloonType:", "v", "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTextBalloonView", @"attributedText", "@", 0);

  return 1;
}

uint64_t __52__ChatAssistantUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Assistant Chat AX Bundle"];
  [v2 setOverrideProcessName:@"Assistant Chat"];

  return MEMORY[0x270F0A270]();
}

uint64_t __52__ChatAssistantUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"CKMessageSnippetContentViewAccessibility" canInteractWithTargetClass:1];
}

@end