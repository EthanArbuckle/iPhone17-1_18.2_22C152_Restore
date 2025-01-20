@interface AXMobileMailGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMobileMailGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F21400] sharedInstance];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __49__AXMobileMailGlue_accessibilityInitializeBundle__block_invoke_2;
    v7[3] = &unk_265133110;
    v8 = @"MobileMail";
    v9 = @"MobileMail AX Bundle";
    [v2 performValidations:&__block_literal_global withPreValidationHandler:v7 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_348];

    v3 = [MEMORY[0x263F21400] sharedInstance];
    [v3 installSafeCategories:&__block_literal_global_506 afterDelay:@"MobileMail AX Bundle" validationTargetName:@"MobileMail" overrideProcessName:1.0];

    uint64_t v4 = [objc_allocWithZone((Class)AXMobileMailGlue) init];
    v5 = (void *)_Failover;
    _Failover = v4;

    v6 = [MEMORY[0x263F21388] sharedInstance];
    [v6 addHandler:&__block_literal_global_517 forFramework:@"QuickLook"];
  }
}

uint64_t __49__AXMobileMailGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"MFWindow"];
  [v2 validateClass:@"MailboxTableCell"];
  [v2 validateClass:@"MailStatusBarView"];
  [v2 validateClass:@"MailStatusUpdateView"];
  [v2 validateClass:@"MFMailMessage"];
  [v2 validateClass:@"MFMessage"];
  [v2 validateClass:@"FlaggedMailboxController"];
  [v2 validateClass:@"VIPMailboxController"];
  [v2 validateClass:@"MFMailMessage" isKindOfClass:@"MFMessage"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"StackElement", @"itemViewCreateIfNeeded:", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"StackElement", @"item", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMessage", @"subject", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"ECSubject", @"subjectWithoutPrefix", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMessage", @"messageID", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageStatusIndicatorManager", @"effectiveIndicatorOptions", "Q", 0);
  [v2 validateClass:@"FavoriteItem_SharedMailbox"];
  [v2 validateClass:@"MailboxTableCell" hasInstanceVariable:@"_textLabel" withType:"UILabel"];
  [v2 validateClass:@"MailboxTableCell" hasInstanceVariable:@"_detailTextLabel" withType:"UILabel"];
  [v2 validateClass:@"MailboxTableCell" hasInstanceVariable:@"_unreadCountLabel" withType:"UILabel"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PreviousDraftPickerController", @"viewDidAppear:", "v", "B", 0);

  return 1;
}

uint64_t __49__AXMobileMailGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setOverrideProcessName:v3];
  [v4 setValidationTargetName:*(void *)(a1 + 40)];
  [v4 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __49__AXMobileMailGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"UIMailToolbarButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSSpecifierAccessibility__MobileMail__Preferences" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MailStatusBarViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MailStatusLabelViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MailStatusProgressBarViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MailboxTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIViewAccessibility__MobileMail__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"StackElementAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ComposeButtonItemAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PreviousDraftPickerControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFTiltedTabViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MessageStatusIndicatorManagerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MessageViewStatusIndicatorManagerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFMessageContentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ComposeNavigationControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MobileMail_UISwipeHandlerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFConversationViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFMailboxFilterPickerControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"Mail_UIScrollViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFConversationItemFooterViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_MFConversationViewCollectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MailAppControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFMessageViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ConversationHeaderContentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFExpandedMessageCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFTriageInteractionAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFMessageHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFCollapsedMessageCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFSwipableCollectionViewLayoutAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MessageListCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MessageListViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ConversationViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DockContainerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TiltedTabViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MailActionCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MailActionFlagColorCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MessageListSearchViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SelectedColorButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MailActionsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MobileMail_UIDimmingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFMailboxFilterBarButtonItemAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFConversationItemHeaderBlockAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SwipeOptionsControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"IndividualSwipeOptionControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ComposePlaceholderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UISplitViewControllerPanelImplViewAccessibility__MobileMail__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MailTrackingProtectionOnboardingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MailboxPickerOutlineControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MailboxOutlineCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MailMailboxGroupedPickerTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFArrowControlsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UITableViewAccessibility__MobileMail__UIKit" canInteractWithTargetClass:1];
}

void __49__AXMobileMailGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"WKContentViewAccessibility__MobileMail__WebKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFMailDropBannerViewAccessibility" canInteractWithTargetClass:1];
}

void __49__AXMobileMailGlue_accessibilityInitializeBundle__block_invoke_5()
{
  v0 = AXLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_2422B1000, v0, OS_LOG_TYPE_DEFAULT, "Loading QuickLook", v3, 2u);
  }

  v1 = (void *)MEMORY[0x263F811C8];
  id v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.quicklook"];
  [v1 loadAccessibilityBundleForBundle:v2 didLoadCallback:&__block_literal_global_526];
}

void __49__AXMobileMailGlue_accessibilityInitializeBundle__block_invoke_523(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = AXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_2422B1000, v3, OS_LOG_TYPE_DEFAULT, "Loaded QuickLook %d", (uint8_t *)v4, 8u);
  }
}

@end