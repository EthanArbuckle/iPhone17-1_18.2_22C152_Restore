@interface AssistantUIAXGlue
+ (void)accessibilityInitializeBundle;
+ (void)initialize;
@end

@implementation AssistantUIAXGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __50__AssistantUIAXGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_276 withPreValidationHandler:&__block_literal_global_286 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_295];
}

uint64_t __50__AssistantUIAXGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __50__AssistantUIAXGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AssistantUI.framework AX Bundle"];
  [v2 setOverrideProcessName:@"AssistantUI framework"];

  return MEMORY[0x270F0A270]();
}

void __50__AssistantUIAXGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"AFUISiriViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AFUISiriCompactViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AFUISiriSessionAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AFUISiriViewControllerAccessibility" canInteractWithTargetClass:1];
}

+ (void)initialize
{
  v3 = objc_opt_new();
  int v4 = [v3 isClarityBoardEnabled];

  if (v4)
  {
    [a1 accessibilityInitializeBundle];
  }
}

@end