@interface AXWAAnswerGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXWAAnswerGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __47__AXWAAnswerGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_305 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_314];
}

uint64_t __47__AXWAAnswerGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SAAnswerSnippet", @"answers", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SAAnswerObject", @"title", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SAAnswerObject", @"lines", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SAAnswerObjectLine", @"text", "@", 0);
  [v2 validateClass:@"WADetailedSnippetViewController" hasInstanceVariable:@"_answerViews" withType:"NSMutableArray"];
  [v2 validateClass:@"WATextHeaderView"];
  [v2 validateClass:@"WAImageView"];

  return 1;
}

uint64_t __47__AXWAAnswerGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Siri Wolfram Alpha AX Bundle"];
  [v2 setOverrideProcessName:@"Siri Wolfram Alpha"];

  return MEMORY[0x270F0A270]();
}

void __47__AXWAAnswerGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"WADetailedSnippetViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WAAttributionViewAccessibility" canInteractWithTargetClass:1];
}

@end