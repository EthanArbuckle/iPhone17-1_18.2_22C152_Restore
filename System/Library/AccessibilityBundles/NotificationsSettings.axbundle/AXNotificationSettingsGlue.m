@interface AXNotificationSettingsGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXNotificationSettingsGlue

+ (void)accessibilityInitializeBundle
{
  id v2 = [MEMORY[0x263F229D0] sharedInstance];
  [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_275 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_284];
}

uint64_t __59__AXNotificationSettingsGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __59__AXNotificationSettingsGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"NotificationSettings AX Bundle"];
  [v2 setOverrideProcessName:@"NotificationSettings"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __59__AXNotificationSettingsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"NotificationCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AlertDeliveryLocationViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AlertDeliveryTypeCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NCNotificationListDisplayStyleSelectionViewAccessibility" canInteractWithTargetClass:1];
}

@end