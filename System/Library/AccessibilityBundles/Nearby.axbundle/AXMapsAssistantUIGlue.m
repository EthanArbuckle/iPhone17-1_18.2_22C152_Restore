@interface AXMapsAssistantUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMapsAssistantUIGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_276);
  }
}

void __54__AXMapsAssistantUIGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_280 withPreValidationHandler:&__block_literal_global_305 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_314];
}

uint64_t __54__AXMapsAssistantUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MAListSnippetView", @"tableView: cellForRowAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SALocalSearchMapItem", @"detailType", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SALocalSearchMapItem", @"detail", "@", 0);
  [v2 validateClass:@"MAResultView" hasInstanceVariable:@"_mapItem" withType:"SALocalSearchMapItem"];

  return 1;
}

uint64_t __54__AXMapsAssistantUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setOverrideProcessName:@"MapsAssistantUI"];
  [v2 setValidationTargetName:@"Maps AssistantUI Accessibility Bundle"];

  return MEMORY[0x270F0A270]();
}

void __54__AXMapsAssistantUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"MAListSnippetViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MAResultViewAccessibility" canInteractWithTargetClass:1];
}

@end