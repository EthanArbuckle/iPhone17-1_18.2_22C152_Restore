@interface AXPreferencesFrameworkGlue
+ (void)accessibilityInitializeBundle;
- (id)_formatTime:(double)a3 showHours:(BOOL *)a4 showSubseconds:(BOOL)a5;
@end

@implementation AXPreferencesFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_360 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_369];

    v3 = [MEMORY[0x263F22850] sharedInstance];
    [v3 addHandler:&__block_literal_global_469 forFramework:@"Preferences"];

    _Failover = [objc_allocWithZone((Class)AXPreferencesFrameworkGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __59__AXPreferencesFrameworkGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"PSSpecifier"];
  [v2 validateClass:@"PSTableCell"];
  [v2 validateClass:@"PSControlTableCell"];
  [v2 validateClass:@"PSTextViewTableCell"];
  [v2 validateClass:@"PSSetupController"];
  [v2 validateClass:@"PSTableCell" hasInstanceVariable:@"_checked" withType:"BOOL"];
  [v2 validateClass:@"PSTextViewTableCell" hasInstanceVariable:@"_textView" withType:"PSTextView"];
  [v2 validateClass:@"PSControlTableCell" hasInstanceVariable:@"_control" withType:"UIControl"];
  [v2 validateClass:@"PSListController" hasInstanceVariable:@"_specifiers" withType:"NSArray"];
  [v2 validateClass:@"PSListController" hasInstanceVariable:@"_table" withType:"UITableView"];
  [v2 validateClass:@"PSListController" hasInstanceVariable:@"_cachesCells" withType:"BOOL"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PSTableCell", @"cellEnabled", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PSTableCell", @"cellTarget", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PSListController", @"loadSpecifiersFromPlistName: target:", "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PSListController", @"bundle", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PSControlTableCell", @"control", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PSSpecifier", @"values", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PSListController", @"reloadSpecifierAtIndex: animated:", "v", "q", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PSListController", @"viewWillAppear:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PSListController", @"_updateSectionContentInsetWithAnimation:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PSTableCell", @"initWithStyle: reuseIdentifier: specifier:", "@", "q", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PSEditableTableCell", @"textField", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PSEditableTableCell", @"isEditing", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_viewDelegate", "@", 0);
  [v2 validateClass:@"PSTableCell" isKindOfClass:@"UITableViewCell"];

  return 1;
}

uint64_t __59__AXPreferencesFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Preferences Framework Accessibility Bundle"];
  [v2 setOverrideProcessName:@"Preferences Framework"];

  return MEMORY[0x270F0A270]();
}

void __59__AXPreferencesFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"PSSpecifierAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UITableViewAccessibility__Preferences__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UITableViewCellAccessibility__Preferences__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSControlTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSSliderTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSSegmentTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSEditableTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSRootControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSListControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSSetupControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSPasscodeFieldAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSSegmentableSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSUsageSizeHeaderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSUsageBundleCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSSubtitleSwitchTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSTimeRangeCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSDateTimePickerCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSKeychainSyncSecurityCodeControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSFooterHyperlinkViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSBadgedTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DevicePINPaneAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSCapacityBarCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PrefsUILinkLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PINViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"FailureBarViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DevicePINKeypadAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AlphanumericPINTextFieldAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSKeyboardNavigationSearchBarAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUIKSearchResultCollectionViewListCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSReversedSubtitleDisclosureTableCellAccessibility" canInteractWithTargetClass:1];
}

uint64_t __59__AXPreferencesFrameworkGlue_accessibilityInitializeBundle__block_invoke_4()
{
  return MEMORY[0x270F0A258](&__block_literal_global_471, 0.25);
}

void __59__AXPreferencesFrameworkGlue_accessibilityInitializeBundle__block_invoke_5()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 installSafeCategories:&__block_literal_global_473 afterDelay:@"Preferences Framework Accessibility Bundle" validationTargetName:0 overrideProcessName:0.25];
}

uint64_t __59__AXPreferencesFrameworkGlue_accessibilityInitializeBundle__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"PreferencesPSTableCellAccessibility" canInteractWithTargetClass:1];
}

- (id)_formatTime:(double)a3 showHours:(BOOL *)a4 showSubseconds:(BOOL)a5
{
  return 0;
}

@end