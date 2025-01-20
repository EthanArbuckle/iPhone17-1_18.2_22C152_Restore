@interface AXSharingUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXSharingUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_284 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_290];

    uint64_t v3 = [objc_allocWithZone((Class)AXSharingUIGlue) init];
    v4 = (void *)_Failover;
    _Failover = v3;

    id v5 = [MEMORY[0x263F22850] sharedInstance];
    [v5 addHandler:&__block_literal_global_322 forFramework:@"PlatterKit"];
  }
}

uint64_t __48__AXSharingUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SFPersonCollectionViewCell", @"person", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SFAirDropNode", @"realName", "@", 0);
  [v2 validateClass:@"SFPersonCollectionViewCell" hasInstanceVariable:@"_nameLabel" withType:"UILabel"];

  return 1;
}

uint64_t __48__AXSharingUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"SharingUI Framework"];
  [v2 setOverrideProcessName:@"SharingUI Framework"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __48__AXSharingUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SFCircleProgressViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFAirDropIconViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFAirDropActiveIconViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFPersonCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFAirDropActivityViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFShareAudioViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFAirDropMagicHeadViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFMagicHeadWheelViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFMagicHeadPlaceholderViewAccessibility" canInteractWithTargetClass:1];
}

void __48__AXSharingUIGlue_accessibilityInitializeBundle__block_invoke_4()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_324 withPreValidationHandler:&__block_literal_global_326 postValidationHandler:0];
}

uint64_t __48__AXSharingUIGlue_accessibilityInitializeBundle__block_invoke_5()
{
  return 1;
}

uint64_t __48__AXSharingUIGlue_accessibilityInitializeBundle__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"SharingUI/PlatterKit Framework"];
  [v2 setOverrideProcessName:@"SharingUI/PlatterKit Framework"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

@end