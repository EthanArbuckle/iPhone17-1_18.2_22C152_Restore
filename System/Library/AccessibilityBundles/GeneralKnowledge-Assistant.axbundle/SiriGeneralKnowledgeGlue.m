@interface SiriGeneralKnowledgeGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation SiriGeneralKnowledgeGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __57__SiriGeneralKnowledgeGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_299 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_308];
}

uint64_t __57__SiriGeneralKnowledgeGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"SiriGKImageLinkView" hasInstanceVariable:@"_imageLinkedAnswer" withType:"SAGKImageLinkedAnswer"];
  [v2 validateClass:@"SiriGKAttributionView" isKindOfClass:@"SiriGKView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SAGKLinkedAnswer", @"name", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriGKView", @"command", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SAUIAppPunchOut", @"punchOutUri", "@", 0);

  return 1;
}

uint64_t __57__SiriGeneralKnowledgeGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Siri General Knowledge AX Bundle"];
  [v2 setOverrideProcessName:@"Siri General Knowledge"];

  return MEMORY[0x270F0A270]();
}

void __57__SiriGeneralKnowledgeGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SiriGKImageLinkViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SiriGKAttributionViewAccessibility" canInteractWithTargetClass:1];
}

@end