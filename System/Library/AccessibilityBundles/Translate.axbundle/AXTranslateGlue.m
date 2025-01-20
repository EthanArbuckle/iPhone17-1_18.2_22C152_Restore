@interface AXTranslateGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXTranslateGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXTranslateGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __48__AXTranslateGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __48__AXTranslateGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Translate AX"];
  [v2 setOverrideProcessName:@"Translate"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __48__AXTranslateGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"TextViewWithPlaceHolderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TranslationCardAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ConversationManagerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HighlightTextViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SenseRowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AccessibilityNodeAccessibility__Translate__SwiftUI" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LanguageAwareTextViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RecordingHelperAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIButtonAccessibility__Translate__UIKit" canInteractWithTargetClass:1];
}

@end