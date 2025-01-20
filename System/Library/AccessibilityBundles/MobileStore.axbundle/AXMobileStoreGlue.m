@interface AXMobileStoreGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMobileStoreGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_355 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_364];

    _Failover = [objc_allocWithZone((Class)AXMobileStoreGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __50__AXMobileStoreGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"MSTrackListCellConfiguration"];
  [v2 validateClass:@"MSTrackListCopyrightFooterView"];
  [v2 validateClass:@"MSTrackListHeaderView"];
  [v2 validateClass:@"MPMoviePlayerViewController"];
  [v2 validateClass:@"SUTableCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUTableCell", @"configuration", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MSTrackListCopyrightFooterView", @"text", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPMoviePlayerViewController", @"moviePlayer", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUItem", @"artistName", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUItem", @"reviewStatistics", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUItemReviewStatistics", @"numberOfUserRatings", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUItemReviewStatistics", @"averageUserRating", "f", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUItem", @"contentRating", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUItemContentRating", @"isExplicitContent", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPMoviePlayerViewController", @"moviePlayer", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCellAccessibility", @"_accessibilityClearChildren", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SSDownloadStatus", @"isPaused", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SSDownloadStatus", @"isFailed", "B", 0);
  [v2 validateClass:@"MSTrackListHeaderView" hasInstanceVariable:@"_offerButton" withType:"SUItemOfferButton"];
  [v2 validateClass:@"MSTrackListHeaderView" hasInstanceVariable:@"_albumLabel" withType:"UILabel"];
  [v2 validateClass:@"MSTrackListHeaderView" hasInstanceVariable:@"_artistLabel" withType:"UILabel"];
  [v2 validateClass:@"MSTrackListHeaderView" hasInstanceVariable:@"_releaseDateLabel" withType:"UILabel"];

  return 1;
}

uint64_t __50__AXMobileStoreGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MobileStore AX Bundle"];
  [v2 setOverrideProcessName:@"MobileStore"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __50__AXMobileStoreGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"UIMobileStoreApplicationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MSTrackListCellConfigurationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MSTrackListHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MSTrackListCopyrightFooterViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MSTrackListLinkCellConfigurationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MSTableCellAccessibility" canInteractWithTargetClass:1];
}

@end