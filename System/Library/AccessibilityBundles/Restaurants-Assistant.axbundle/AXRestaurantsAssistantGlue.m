@interface AXRestaurantsAssistantGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXRestaurantsAssistantGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __59__AXRestaurantsAssistantGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_276 withPreValidationHandler:&__block_literal_global_322 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_331];
}

uint64_t __59__AXRestaurantsAssistantGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"SiriRestaurantsDetailDescriptionCell" hasInstanceVariable:@"_priceLabel" withType:"UILabel"];
  [v2 validateClass:@"SiriRestaurantsOpenHoursCell" hasInstanceVariable:@"_dayRangeLabels" withType:"NSArray"];
  [v2 validateClass:@"SiriRestaurantsOpenHoursCell" hasInstanceVariable:@"_hoursLabelPerRange" withType:"NSArray"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriUIContentCollectionViewCell", @"textLabel", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriRestaurantsDetailDescriptionCell", @"_setPriceInfoWithRestaurant:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriRestaurantsOpenHoursCell", @"configureWithParsedOpenHoursInfo:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriRestaurantsDetailViewController", @"_configurePhoneCell: forItem:", "v", "@", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriRestaurantsDetailViewController", @"_configureURLCell: forItem:", "v", "@", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriRestaurantsDetailViewController", @"_configureReviewsCell: forItem:", "v", "@", "q", 0);

  return 1;
}

uint64_t __59__AXRestaurantsAssistantGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Assistant Restaurants AX Bundle"];
  [v2 setOverrideProcessName:@"Assistant Restaurants"];

  return MEMORY[0x270F0A270]();
}

void __59__AXRestaurantsAssistantGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SiriRestaurantsListItemCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SiriRestaurantsDetailDescriptionCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SiriRestaurantsOpenHoursCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SiriRestaurantsDetailViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SiriRestaurantsLogoButtonAccessibility" canInteractWithTargetClass:1];
}

@end