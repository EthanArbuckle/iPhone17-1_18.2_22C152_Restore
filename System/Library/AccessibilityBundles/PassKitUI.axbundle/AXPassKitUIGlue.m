@interface AXPassKitUIGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXPassKitUIGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __48__AXPassKitUIGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_288 withPreValidationHandler:&__block_literal_global_440 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_449];
}

uint64_t __48__AXPassKitUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
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

uint64_t __48__AXPassKitUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AX PassKitUI"];
  [v2 setOverrideProcessName:@"PassKitUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __48__AXPassKitUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"PKGSVWalletHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentPassTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPassFaceViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPassFrontFaceViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPassFieldViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPassGroupViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKBarcodeStickerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPassColorProfileAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPassGroupStackViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIViewAccessibility__PassKitUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIImageViewAccessibility__PassKitUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UILabelAccessibility__PassKitUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKLinkedAppViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKLinkedAppUserRatingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKSettingTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPassPaymentCardFrontFaceViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPassPaymentPayStateViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPassPaymentContainerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UITableViewCellAccessibility__PassKitUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentAuthorizationItemCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKTableHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentRemoteAlertViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentPassDetailViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentSetupHeroViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKLinkedAppIconViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKContinuityPaymentViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPerformActionEnterValueViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKEnterValueNewBalanceViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKStackedTextItemViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKReaderModeHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKBorderedButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKNumberPadInputViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentTransactionCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentTransactionTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPeerPaymentBubbleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentAuthorizationServiceViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPeerPaymentExplanationViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKEnterCurrencyAmountViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPeerPaymentBankAccountDetailCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPeerPaymentMessageBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPassHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKAddPaymentPassDevicePickerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKLabeledValueAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentSetupFieldsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentAuthorizationSummaryItemsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPassFooterContentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKNavigationDashboardPassViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKDashboardMessageViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKDashboardTitleHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKAccountBillPaymentAmountContainerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKBillPaymentRingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKCurvedTextLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKApplyOfferCreditCardViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKCreditActivityCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKCreditPaymentDueCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKCreditBalanceCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKSpendingSummaryChartViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKFeatureOnBoardingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKDashboardBalanceViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentTransactionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPerformActionViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKExplanationViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentMoreInformationViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKAccountPassActivationResultViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKTransactionHistoryTransactionGroupHeaderCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentTransactionLocationTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentTransactionDetailLineItemTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKMultilineKeyValueTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentSetupFieldCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKTransactionHistoryViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKOrderPhysicalCardHeroViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKMonthDayCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKAccountAutomaticPaymentsDateFooterViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKSpendingSingleSummaryViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKSpendingSummaryViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPhysicalCardReaderModeActivationViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKContinuousButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentTransactionDetailViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKApplyHeroCardViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKGroupsControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPassGroupsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKSpendingSummaryViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKCreditBalanceAndPaymentPresenterAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKFooterHyperlinkViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentAuthorizationNavigationBarAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_UIButtonBarButtonAccessibility__PassKitUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKSwitchSpinnerTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKProvisioningProgressViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPinCodeFieldAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKCredentialPairingExplanationHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentSetupAssistantRegistrationViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKDiscoveryCardViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentPreferenceCardCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKSpendingSummaryAccountUserCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentAuthorizationFooterViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKDashboardActionButtonCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKDashboardViewControllerFooterViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPassBannerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPaymentTransactionDetailHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKSearchSuggestionCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKEnhancedMerchantCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKAccountModuleCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKEnhancedMerchantCollectionViewListCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKSegmentedBarViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKIdentityHeroViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKCellAccessoryMultiSelectIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKDashboardCurrencyAmountCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPassTileViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPassPosterEventTicketFaceViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKPassViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PKTrailingAccessoryLabelAccessibility" canInteractWithTargetClass:1];
}

@end