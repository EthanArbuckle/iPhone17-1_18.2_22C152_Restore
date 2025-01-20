@interface AXPassKitFrameworkGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXPassKitFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  id v2 = [MEMORY[0x263F229D0] sharedInstance];
  [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_417 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_426];
}

uint64_t __55__AXPassKitFrameworkGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"PKPassGroupStackView" hasInstanceVariable:@"_groupViewsByGroupID" withType:"NSMutableDictionary"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassFieldView", @"labelLabel", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassFieldView", @"valueLabel", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassGroupView", @"frontmostPassView", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassGroupView", @"presentationState", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassGroupView", @"group", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKGroup", @"passCount", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKGroup", @"groupID", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKGroup", @"passAtIndex:", "@", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassView", @"pass", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPass", @"organizationName", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPass", @"localizedDescription", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPass", @"logoRect", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassFrontFaceView", @"createBodyContentViews", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassFaceView", @"setPass: colorProfile:", "v", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassColorProfile", @"_imageForGlyph: color:", "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassGroupStackView", @"setModalGroupIndex:", "v", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassGroupStackView", @"setPresentationState: animated:", "v", "q", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassGroupStackView", @"datasource", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassGroupStackView", @"_indexOfGroupView:", "Q", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassGroupsViewController", @"numberOfGroups", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassFaceView", @"createBodyInvariantViews", "v", 0);
  [v2 validateClass:@"PKPassGroupStackView" hasInstanceVariable:@"_animatorsByGroupID" withType:"NSMutableDictionary"];
  [v2 validateClass:@"PKPassGroupStackView" hasInstanceVariable:@"_modalGroupIndex" withType:"NSUInteger"];
  [v2 validateClass:@"PKPassGroupStackView" hasInstanceVariable:@"_modallyPresentedGroupView" withType:"PKPassGroupView"];
  [v2 validateClass:@"PKPassFaceView" hasInstanceVariable:@"_backgroundView" withType:"UIImageView"];
  [v2 validateClass:@"PKPassFaceView" hasInstanceVariable:@"_pass" withType:"PKPass"];
  [v2 validateClass:@"PKPassGroupStackView" hasInstanceVariable:@"_passPileViews" withType:"NSMutableArray"];
  [v2 validateClass:@"PKBarcodeStickerView" hasInstanceVariable:@"_altTextLabel" withType:"UILabel"];
  [v2 validateClass:@"PKPassGroupViewVerticalPanAnimator" hasInstanceVariable:@"_gestureRecognizer" withType:"UIPanGestureRecognizer"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassFaceView", @"createHeaderContentViews", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PKLinkedAppUserRatingView", @"userRating", "f", 0);

  return 1;
}

uint64_t __55__AXPassKitFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"PassKit"];
  [v2 setOverrideProcessName:@"PassKit Framework"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

@end