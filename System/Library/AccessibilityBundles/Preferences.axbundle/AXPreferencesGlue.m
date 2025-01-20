@interface AXPreferencesGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXPreferencesGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F21400] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_318 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_327];

    uint64_t v3 = [objc_allocWithZone((Class)AXPreferencesGlue) init];
    v4 = (void *)_Failover;
    _Failover = v3;

    v5 = [MEMORY[0x263F21388] sharedInstance];
    [v5 addHandler:&__block_literal_global_338 forFramework:@"CoreRecognition"];

    v6 = [MEMORY[0x263F21388] sharedInstance];
    [v6 addHandler:&__block_literal_global_351 forFramework:@"PassKit"];

    v7 = [MEMORY[0x263F21388] sharedInstance];
    [v7 addHandler:&__block_literal_global_361 forFramework:@"VoiceTriggerUI"];

    v8 = [MEMORY[0x263F21388] sharedInstance];
    [v8 addHandler:&__block_literal_global_371 forFramework:@"SetupAssistantUI"];

    v9 = [MEMORY[0x263F21388] sharedInstance];
    [v9 addHandler:&__block_literal_global_381 forBundleName:@"StorageSettings"];

    id v10 = [MEMORY[0x263F21388] sharedInstance];
    [v10 addHandler:&__block_literal_global_391 forFramework:@"BiometricKitUI"];
  }
}

uint64_t __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"FailureBarView"];
  [v2 validateClass:@"PINView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"DevicePINPane", @"setPINPolicyString: visible:", "v", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"FailureBarView", @"setFailureCount:", "v", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PSBadgedTableCell", @"badgeWithInteger:", "v", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PSSpecifier", @"values", "@", 0);
  [v2 validateClass:@"PINView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v2 validateClass:@"FailureBarView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v2 validateClass:@"DevicePINPane" hasInstanceVariable:@"_pinView" withType:"UIView<PINEntryView>"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"DevicePINController", @"_updateErrorTextAndFailureCount:", "v", "B", 0);
  [v2 validateClass:@"PSTableCell" isKindOfClass:@"PreferencesTableCell"];

  return 1;
}

uint64_t __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Preferences AX Bundle"];
  [v2 setOverrideProcessName:@"Preferences"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"PreferencesSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PreferencesUITextFieldAccessibility" canInteractWithTargetClass:1];
}

uint64_t __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_4()
{
  return MEMORY[0x270F09440](&__block_literal_global_340, 0.25);
}

void __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_5()
{
  v0 = (void *)MEMORY[0x263F811C8];
  v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreRecognition"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];

  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];
}

uint64_t __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_6()
{
  return MEMORY[0x270F09440](&__block_literal_global_353, 0.25);
}

void __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_7()
{
  v0 = (void *)MEMORY[0x263F811C8];
  v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.PassKit"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];

  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];
}

uint64_t __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_8()
{
  return MEMORY[0x270F09440](&__block_literal_global_363, 0.25);
}

void __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_9()
{
  v0 = (void *)MEMORY[0x263F811C8];
  v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.VoiceTriggerUI"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];

  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];
}

uint64_t __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_10()
{
  return MEMORY[0x270F09440](&__block_literal_global_373, 0.25);
}

void __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_11()
{
  v0 = (void *)MEMORY[0x263F811C8];
  v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SetupAssistantUI"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];

  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];
}

uint64_t __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_12()
{
  return MEMORY[0x270F09440](&__block_literal_global_383, 0.25);
}

void __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_13()
{
  v0 = (void *)MEMORY[0x263F811C8];
  v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.settings.storage"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];

  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];
}

uint64_t __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_14()
{
  return MEMORY[0x270F09440](&__block_literal_global_393, 0.25);
}

void __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_15()
{
  v0 = (void *)MEMORY[0x263F811C8];
  v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BiometricKitUI"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];

  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];
}

@end