@interface AXSetupGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXSetupGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_344 postValidationHandler:&__block_literal_global_353 safeCategoryInstallationHandler:&__block_literal_global_356];

    uint64_t v3 = [objc_allocWithZone((Class)AXSetupGlue) init];
    v4 = (void *)_Failover;
    _Failover = v3;

    v5 = [MEMORY[0x263F22850] sharedInstance];
    [v5 addHandler:&__block_literal_global_439 forFramework:@"WiFiKitUI"];

    v6 = [MEMORY[0x263F22850] sharedInstance];
    [v6 addHandler:&__block_literal_global_451 forFramework:@"VoiceTriggerUI"];

    v7 = [MEMORY[0x263F22850] sharedInstance];
    [v7 addHandler:&__block_literal_global_461 forFramework:@"BiometricKitUI"];

    v8 = [MEMORY[0x263F22850] sharedInstance];
    [v8 addHandler:&__block_literal_global_471 forFramework:@"PassKit"];

    v9 = [MEMORY[0x263F22850] sharedInstance];
    [v9 addHandler:&__block_literal_global_481 forFramework:@"PassKitUI"];

    UIAccessibilityIsVoiceOverRunning();
  }
}

uint64_t __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyLanguageController", @"tableView: cellForRowAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"navigationItem", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyLocaleController", @"tableView: didSelectRowAtIndexPath:", "v", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"textLabel", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"editableTextField", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyAppleIDTableHeaderView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SetupChoiceController", @"tableView: cellForRowAtIndexPath:", "@", "@", "@", 0);
  [v2 validateClass:@"BuddyTableViewController" hasInstanceVariable:@"_containerView" withType:"UIView"];
  [v2 validateClass:@"BuddyTableViewController" hasInstanceVariable:@"_tableView" withType:"UITableView"];
  [v2 validateClass:@"BuddyAppleIDTableHeaderView" hasInstanceVariable:@"_textLabel" withType:"UILabel"];
  [v2 validateClass:@"BuddyLanguageController" isKindOfClass:@"UIViewController"];
  [v2 validateClass:@"PSListController" isKindOfClass:@"UIViewController"];

  return 1;
}

uint64_t __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Setup Accessibility"];
  [v2 setOverrideProcessName:@"SetupBundle"];

  return MEMORY[0x270F0A270]();
}

void __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"BuddyUIViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddyUITableViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SetupControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddyNavigationFlowControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIBuddyApplicationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddyLanguageControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddyLocaleControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddyTableViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddyUIImageViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddyFinishedControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SetupChoiceControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddyAppleIDTableHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddyUINavigationBarAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddyUILabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CDPRemoteSecretEntryViewControllerAccessibility__Setup__CoreCDPUI" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BFFProximityVisualPairingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddyPosedDeviceSelectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddyProximitySetupControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddyAppleIDServiceViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddySceneDelegateAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddyExpressSetupFeatureCardCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddyExpressSetupFeatureCardPrimaryCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddyAccessibilityUtilitiesAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LabeledSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BuddyPosedDeviceSelectionItemViewAccessibility" canInteractWithTargetClass:1];
}

uint64_t __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_5()
{
  return MEMORY[0x270F0A258](&__block_literal_global_441, 0.25);
}

void __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_6()
{
  v0 = (void *)MEMORY[0x263F811C8];
  v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.framework.WiFiKitUI"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];

  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];
}

uint64_t __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_7()
{
  return MEMORY[0x270F0A258](&__block_literal_global_453, 0.25);
}

void __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_8()
{
  v0 = (void *)MEMORY[0x263F811C8];
  v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.VoiceTriggerUI"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];

  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];
}

uint64_t __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_9()
{
  return MEMORY[0x270F0A258](&__block_literal_global_463, 0.25);
}

void __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_10()
{
  v0 = (void *)MEMORY[0x263F811C8];
  v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BiometricKitUI"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];

  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];
}

uint64_t __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_11()
{
  return MEMORY[0x270F0A258](&__block_literal_global_473, 0.25);
}

void __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_12()
{
  v0 = (void *)MEMORY[0x263F811C8];
  v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.PassKit"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];

  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];
}

uint64_t __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_13()
{
  return MEMORY[0x270F0A258](&__block_literal_global_483, 0.25);
}

void __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_14()
{
  v0 = (void *)MEMORY[0x263F811C8];
  v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.PassKitUI"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];

  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];
}

@end