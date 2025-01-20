@interface AXGameKitFrameworkGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXGameKitFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_0);
  }
}

void __55__AXGameKitFrameworkGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_309 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_318];
}

uint64_t __55__AXGameKitFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"GKAchievementViewController"];
  [v2 validateClass:@"GKLocalPlayer"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"GKLocalPlayer", @"localPlayer", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"GKPlayer", @"internal", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"GKPlayerInternal", @"alias", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"GKScore", @"internal", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"GKScoreInternal", @"formattedValue", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"GKScoreInternal", @"rank", "I", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"GKScoreInternal", @"value", "q", 0);

  return 1;
}

uint64_t __55__AXGameKitFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setOverrideProcessName:@"GameKitFramework"];
  [v2 setValidationTargetName:@"GameKitFramework Accessibility Bundle"];

  return MEMORY[0x270F0A270]();
}

@end