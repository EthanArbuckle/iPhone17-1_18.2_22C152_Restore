@interface AXMobilePiPGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMobilePiPGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_297 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_306];

    _Failover = [objc_allocWithZone((Class)AXMobilePiPGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __48__AXMobilePiPGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"PGHostedWindow"];
  [v2 validateClass:@"PGPictureInPictureViewController"];
  [v2 validateClass:@"PGHitTestExtendableView" isKindOfClass:@"UIView"];
  [v2 validateClass:@"PGStashView" isKindOfClass:@"UIView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PGHitTestExtendableView", @"hitTestExtenderView", "@", 0);
  [v2 validateClass:@"PGPictureInPictureViewController" hasInstanceVariable:@"_stashView" withType:"PGStashView"];
  [v2 validateClass:@"PGStashedMaskView" hasInstanceVariable:@"_tab" withType:"UIView"];

  return 1;
}

uint64_t __48__AXMobilePiPGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Pegasus AX Bundle"];
  [v2 setOverrideProcessName:@"Pegasus"];

  return MEMORY[0x270F0A270]();
}

void __48__AXMobilePiPGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"PGButtonViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PGPictureInPictureViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"__PGViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PGControlsContainerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PGProgressIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PGStashViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PGHitTestExtendableViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PGLayerHostViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PGHostedWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_PGPictureInPictureContainerViewAccessibility" canInteractWithTargetClass:1];
}

@end