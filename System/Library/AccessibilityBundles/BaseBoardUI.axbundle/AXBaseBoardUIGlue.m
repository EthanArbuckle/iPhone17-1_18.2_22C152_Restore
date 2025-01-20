@interface AXBaseBoardUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXBaseBoardUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __50__AXBaseBoardUIGlue_accessibilityInitializeBundle__block_invoke_2;
    v5[3] = &unk_26510DA98;
    v6 = @"BaseBoardUI AX Bundle";
    v7 = @"BaseBoardUI";
    [v2 performValidations:&__block_literal_global withPreValidationHandler:v5 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_274];

    uint64_t v3 = [objc_allocWithZone((Class)AXBaseBoardUIGlue) init];
    v4 = (void *)_Failover;
    _Failover = v3;
  }
}

uint64_t __50__AXBaseBoardUIGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __50__AXBaseBoardUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setValidationTargetName:v3];
  [v4 setOverrideProcessName:*(void *)(a1 + 40)];
  [v4 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __50__AXBaseBoardUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"BSUIRelativeDateLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BSUIEmojiLabelViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BSUIVibrancyEffectViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BSUIOrientationTransformWrapperViewAccessibility" canInteractWithTargetClass:1];
}

@end