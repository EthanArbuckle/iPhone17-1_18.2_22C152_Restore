@interface SiriUIFrameworkGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation SiriUIFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __52__SiriUIFrameworkGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_320 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_329];
}

uint64_t __52__SiriUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"SiriUIContentButton" isKindOfClass:@"UIButton"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriUIReusableHeaderView", @"titleText", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriUIReusableHeaderView", @"snippetViewController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriUISiriStatusView", @"setMode:", "v", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriUISnippetViewController", @"headerPunchOut", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriUIReusableSubtitledHeaderView", @"subtitleText", "@", 0);
  [v2 validateClass:@"SiriUIReviewItemCell" hasInstanceVariable:@"_commentLabel" withType:"UILabel"];
  [v2 validateClass:@"SiriUIReviewItemCell" hasInstanceVariable:@"_authorLabel" withType:"UILabel"];
  [v2 validateClass:@"SiriUIReviewItemCell" hasInstanceVariable:@"_ratingView" withType:"UIView"];

  return 1;
}

uint64_t __52__SiriUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Siri UI Framework AX Bundle"];
  [v2 setOverrideProcessName:@"Siri UI Framework"];

  return MEMORY[0x270F09468]();
}

void __52__SiriUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SiriUIContentButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SiriUIReusableHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SiriUISiriStatusViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SiriUIHelpButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SiriUIReviewItemCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SiriUIReusableSubtitledHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SiriUIAudioRoutePickerButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SiriUISashViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SiriUISnippetControllerCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SiriUIAceObjectControllerCellAccessibility" canInteractWithTargetClass:1];
}

@end