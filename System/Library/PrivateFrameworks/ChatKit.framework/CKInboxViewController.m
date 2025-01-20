@interface CKInboxViewController
- (BOOL)_shouldShowJunkCell;
- (BOOL)_spamFilteringEnabled;
- (BOOL)_wantsThreeColumnLayout;
- (BOOL)shouldHideInboxFooterTextView;
- (BOOL)shouldProcessBackButtonUpdates;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (BOOL)wantsCollapsedAppearance;
- (CKConversationListControllerProtocol)conversationListController;
- (CKInboxViewController)initWithConversationListController:(id)a3;
- (CKInboxViewControllerDelegate)delegate;
- (NSArray)categoriesCellsDataArray;
- (NSArray)junkCellsDataArray;
- (NSArray)primaryCellsData;
- (NSArray)recentlyDeletedCellDataArray;
- (NSDictionary)cellDataForFilterMode;
- (UICollectionViewCell)initiallySelectedCell;
- (UICollectionViewDiffableDataSource)collectionViewDataSource;
- (UITextView)pinnedFooterTextView;
- (UITextView)scrollingFooterTextView;
- (id)_conversationList;
- (id)_getHeaderStringForExtension:(id)a3;
- (id)_getSpamExtensionName;
- (id)_setHeaderAttributedStringForFont:(id)a3;
- (id)_unreadCountStringForIndexPath:(id)a3;
- (id)_updateCategoriesCellsDataArray;
- (id)footerTextView;
- (int64_t)_categoriesSectionIndex;
- (int64_t)_folderIndentationAtIndexPath:(id)a3;
- (int64_t)_junkSectionIndex;
- (int64_t)_lastSectionIndex;
- (int64_t)_primarySectionIndex;
- (int64_t)_recentlyDeletedSectionIndex;
- (unint64_t)_filterModeForIndexPath:(id)a3;
- (void)_chatUnreadCountDidChange:(id)a3;
- (void)_contentSizeCategoryChanged;
- (void)_conversationListDidFinishSorting:(id)a3;
- (void)_localeDidChange;
- (void)_messageFilteringEnabledDidChange:(id)a3;
- (void)_setCommonTextProperties:(uint64_t)a1;
- (void)_spamFilteringStateChanged;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)focusStateDidChange;
- (void)prepareForResume;
- (void)prepareForSuspend;
- (void)reloadCollectionViewData;
- (void)setCategoriesCellsDataArray:(id)a3;
- (void)setCellDataForFilterMode:(id)a3;
- (void)setCollectionViewDataSource:(id)a3;
- (void)setConversationListController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInitiallySelectedCell:(id)a3;
- (void)setJunkCellsDataArray:(id)a3;
- (void)setPinnedFooterTextView:(id)a3;
- (void)setPrimaryCellsData:(id)a3;
- (void)setRecentlyDeletedCellDataArray:(id)a3;
- (void)setScrollingFooterTextView:(id)a3;
- (void)setShouldProcessBackButtonUpdates:(BOOL)a3;
- (void)setupCollectionView;
- (void)updateBackButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CKInboxViewController

- (CKInboxViewController)initWithConversationListController:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F42870]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__CKInboxViewController_initWithConversationListController___block_invoke;
  v11[3] = &unk_1E562CCB8;
  v6 = self;
  v12 = v6;
  v7 = (void *)[v5 initWithSectionProvider:v11];
  v10.receiver = v6;
  v10.super_class = (Class)CKInboxViewController;
  v8 = [(CKInboxViewController *)&v10 initWithCollectionViewLayout:v7];

  if (v8)
  {
    [(CKInboxViewController *)v8 setConversationListController:v4];
    [(CKInboxViewController *)v8 updateBackButton];
    [(CKInboxViewController *)v8 setupCollectionView];
    v8->_shouldProcessBackButtonUpdates = 1;
  }

  return v8;
}

id __60__CKInboxViewController_initWithConversationListController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([*(id *)(a1 + 32) wantsCollapsedAppearance]) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 3;
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F42848]) initWithAppearance:v6];
  if ([*(id *)(a1 + 32) _primarySectionIndex] == a2 && CKIsRunningInMacCatalyst()
    || [*(id *)(a1 + 32) _categoriesSectionIndex] == a2)
  {
    [v7 setHeaderMode:1];
  }
  else if (([*(id *)(a1 + 32) shouldHideInboxFooterTextView] & 1) == 0 {
         && [*(id *)(a1 + 32) _lastSectionIndex] == a2)
  }
  {
    [v7 setFooterMode:1];
  }
  v8 = [MEMORY[0x1E4F42630] sectionWithListConfiguration:v7 layoutEnvironment:v5];
  if ([*(id *)(a1 + 32) _primarySectionIndex] == a2 && !CKIsRunningInMacCatalyst())
  {
    [v8 contentInsets];
    double v10 = v9;
    [v8 contentInsets];
    double v12 = v11;
    [v8 contentInsets];
    objc_msgSend(v8, "setContentInsets:", 10.0, v10, v12);
  }

  return v8;
}

- (void)viewDidLoad
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)CKInboxViewController;
  [(CKInboxViewController *)&v18 viewDidLoad];
  v3 = CKFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"MESSAGES" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [(CKInboxViewController *)self setTitle:v4];

  int v5 = CKIsRunningInMacCatalyst();
  uint64_t v6 = [(CKInboxViewController *)self navigationController];
  v7 = [v6 navigationBar];
  v8 = v7;
  if (v5)
  {
    [v7 setPrefersLargeTitles:0];

    double v9 = [(CKInboxViewController *)self navigationItem];
    [v9 setLargeTitleDisplayMode:2];

    id v10 = objc_alloc_init(MEMORY[0x1E4F42BF0]);
    uint64_t v19 = *MEMORY[0x1E4FB0700];
    double v11 = [MEMORY[0x1E4F428B8] clearColor];
    v20[0] = v11;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    [v10 setTitleTextAttributes:v12];

    [v10 configureWithTransparentBackground];
    v13 = [(CKInboxViewController *)self navigationItem];
    [v13 setStandardAppearance:v10];
  }
  else
  {
    [v7 setPrefersLargeTitles:1];

    id v10 = [(CKInboxViewController *)self navigationItem];
    [v10 setLargeTitleDisplayMode:1];
  }

  v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 addObserver:self selector:sel__chatUnreadCountDidChange_ name:*MEMORY[0x1E4F6BAA0] object:0];
  [v14 addObserver:self selector:sel__chatUnreadCountDidChange_ name:@"CKConversationListChangedNotification" object:0];
  [v14 addObserver:self selector:sel__chatUnreadCountDidChange_ name:*MEMORY[0x1E4F6BA90] object:0];
  [v14 addObserver:self selector:sel__conversationListDidFinishSorting_ name:@"CKConversationListDidFinishSorting" object:0];
  [v14 addObserver:self selector:sel__messageFilteringEnabledDidChange_ name:CKMessageFilteringChangedNotification[0] object:0];
  [v14 addObserver:self selector:sel__spamFilteringStateChanged name:CKMessageSpamFilteringChangedNotification object:0];
  [v14 addObserver:self selector:sel__contentSizeCategoryChanged name:*MEMORY[0x1E4F43788] object:0];
  [v14 addObserver:self selector:sel__localeDidChange name:*MEMORY[0x1E4F1C370] object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v16 = self;
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v16, (CFNotificationCallback)_SMSSubClassificationParamsUpdated, @"CKSMSFilterExtensionParamsUpdateDistributedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v17 = [MEMORY[0x1E4F6E788] sharedManager];
  [v17 addDelegate:v16];
}

- (void)viewWillAppear:(BOOL)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)CKInboxViewController;
  [(CKInboxViewController *)&v13 viewWillAppear:a3];
  id v4 = [(CKInboxViewController *)self navigationController];
  int v5 = [v4 navigationBar];
  [v5 setNeedsLayout];

  uint64_t v6 = [(CKInboxViewController *)self navigationController];
  [v6 setToolbarHidden:1 animated:1];

  v7 = +[CKUIBehavior sharedBehaviors];
  v8 = [(CKInboxViewController *)self navigationController];
  double v9 = [MEMORY[0x1E4F428B8] clearColor];
  [v7 setupNavBarAppearanceWithNavigationController:v8 withBackgroundColor:v9];

  [(CKInboxViewController *)self reloadCollectionViewData];
  self->_isVisible = 1;
  id v10 = [MEMORY[0x1E4F6E890] sharedInstance];
  uint64_t v11 = *MEMORY[0x1E4F6D868];
  v14[0] = @"actionType";
  v14[1] = @"fromView";
  v15[0] = @"ViewedInbox";
  v15[1] = @"InboxView";
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v10 trackEvent:v11 withDictionary:v12];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKInboxViewController;
  [(CKInboxViewController *)&v10 viewDidAppear:a3];
  if ([(CKInboxViewController *)self wantsCollapsedAppearance])
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v9 = 0;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "[Filter Mode] Setting filter mode to no junk", v9, 2u);
      }
    }
    int v5 = [(CKInboxViewController *)self conversationListController];
    [v5 setFilterMode:1];

    uint64_t v6 = [(CKInboxViewController *)self _conversationList];
    [v6 releaseWasKnownSenderHold];

    v7 = [(CKInboxViewController *)self _conversationList];
    [v7 updateConversationsWasKnownSender];

    v8 = [(CKInboxViewController *)self _conversationList];
    [v8 clearHoldInUnreadFilter];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = +[CKUIBehavior sharedBehaviors];
  uint64_t v6 = [(CKInboxViewController *)self navigationController];
  [v5 setupNavBarAppearanceWithNavigationController:v6];

  v7.receiver = self;
  v7.super_class = (Class)CKInboxViewController;
  [(CKInboxViewController *)&v7 viewWillDisappear:v3];
  self->_isVisible = 0;
}

- (void)viewDidLayoutSubviews
{
  v40.receiver = self;
  v40.super_class = (Class)CKInboxViewController;
  [(CKInboxViewController *)&v40 viewDidLayoutSubviews];
  if (![(CKInboxViewController *)self shouldHideInboxFooterTextView])
  {
    BOOL v3 = [(CKInboxViewController *)self collectionView];
    [v3 contentInset];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;

    objc_super v10 = [(CKInboxViewController *)self collectionView];
    objc_msgSend(v10, "setContentInset:", v5, v7, 25.0, v9);

    uint64_t v11 = [(CKInboxViewController *)self collectionView];
    [v11 bounds];
    uint64_t v13 = (uint64_t)v12;

    v14 = [(CKInboxViewController *)self collectionView];
    [v14 safeAreaInsets];
    double v16 = v15;
    v17 = [(CKInboxViewController *)self collectionView];
    [v17 safeAreaInsets];
    uint64_t v19 = (uint64_t)(v16 + v18);

    v20 = [(CKInboxViewController *)self pinnedFooterTextView];
    v21 = [(CKInboxViewController *)self collectionView];
    [v21 bounds];
    objc_msgSend(v20, "sizeThatFits:", (double)(v13 - v19), v22);
    double v24 = v23;

    v25 = [(CKInboxViewController *)self scrollingFooterTextView];
    [v25 sizeToFit];

    v26 = [(CKInboxViewController *)self collectionView];
    [v26 contentSize];
    double v28 = v27;
    v29 = [(CKInboxViewController *)self scrollingFooterTextView];
    [v29 bounds];
    uint64_t v31 = (uint64_t)(v28 - v30);

    v32 = [(CKInboxViewController *)self collectionView];
    [v32 adjustedContentInset];
    double v34 = v33 + 25.0;

    v35 = [(CKInboxViewController *)self collectionView];
    [v35 visibleSize];
    double v37 = v36 - (double)(2 * v31) - (double)(uint64_t)v34;

    double v38 = (double)(uint64_t)v37;
    BOOL v39 = v24 > v38;
    [(UITextView *)self->_scrollingFooterTextView setHidden:v24 <= v38];
    [(UITextView *)self->_pinnedFooterTextView setHidden:v39];
  }
}

- (void)prepareForSuspend
{
  self->_shouldProcessBackButtonUpdates = 0;
}

- (void)prepareForResume
{
  self->_shouldProcessBackButtonUpdates = 1;
  [(CKInboxViewController *)self updateBackButton];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    double v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Selected index path: %@", buf, 0xCu);
    }
  }
  double v9 = [(CKInboxViewController *)self initiallySelectedCell];
  [v9 setSelected:0];

  [(CKInboxViewController *)self setInitiallySelectedCell:0];
  unint64_t v10 = [(CKInboxViewController *)self _filterModeForIndexPath:v7];
  uint64_t v11 = [(CKInboxViewController *)self delegate];
  [v11 inboxViewController:self didSelectFilterMode:v10];

  [(CKInboxViewController *)self updateBackButton];
  unint64_t v12 = [MEMORY[0x1E4F6E938] conversationFilterModeForMessageFilter:v10];
  uint64_t v13 = [MEMORY[0x1E4F6E890] sharedInstance];
  v19[0] = @"ChoseFilter";
  double v16 = @"actionType";
  v17 = @"filterType";
  v14 = CKConversationListFilterModeStringValue(v12);
  v19[1] = v14;
  double v18 = @"fromView";
  v19[2] = @"InboxView";
  double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v16 count:3];
  objc_msgSend(v13, "trackEvent:withDictionary:", *MEMORY[0x1E4F6D868], v15, v16, v17);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  if (![(CKInboxViewController *)self wantsCollapsedAppearance])
  {
    double v8 = [(CKInboxViewController *)self collectionViewDataSource];
    double v9 = [v8 itemIdentifierForIndexPath:v7];

    uint64_t v10 = [v9 filterMode];
    uint64_t v11 = [(CKInboxViewController *)self conversationListController];
    uint64_t v12 = [v11 filterMode];

    if (v10 == v12)
    {
      [v13 setSelected:1];
      [(CKInboxViewController *)self setInitiallySelectedCell:v13];
    }
    else
    {
      [v13 setSelected:0];
    }
  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"prefs:root=MESSAGES&path=JUNK_CONVERSATIONS_BUTTON"];
  id v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v7 openSensitiveURL:v6 withOptions:0];

  double v8 = [MEMORY[0x1E4F6E890] sharedInstance];
  uint64_t v9 = *MEMORY[0x1E4F6D868];
  v12[0] = @"actionType";
  v12[1] = @"fromView";
  v13[0] = @"JumpToJunkInbox";
  v13[1] = @"InboxView";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v8 trackEvent:v9 withDictionary:v10];

  return 0;
}

- (id)_unreadCountStringForIndexPath:(id)a3
{
  unint64_t v4 = [(CKInboxViewController *)self _filterModeForIndexPath:a3];
  double v5 = [(CKInboxViewController *)self _conversationList];
  uint64_t v6 = [v5 unreadCountForFilterMode:v4];

  id v7 = [NSNumber numberWithUnsignedInteger:v6];
  double v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "__ck_localizedString");
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = &stru_1EDE4CA38;
  }

  return v9;
}

- (unint64_t)_filterModeForIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(CKInboxViewController *)self collectionViewDataSource];
  uint64_t v6 = [v5 itemIdentifierForIndexPath:v4];

  unint64_t v7 = [v6 filterMode];
  return v7;
}

- (UITextView)pinnedFooterTextView
{
  BOOL v3 = [(CKInboxViewController *)self shouldHideInboxFooterTextView];
  pinnedFooterTextView = self->_pinnedFooterTextView;
  if (v3)
  {
    [(UITextView *)pinnedFooterTextView removeFromSuperview];
    double v5 = 0;
  }
  else
  {
    if (!pinnedFooterTextView)
    {
      uint64_t v6 = [(CKInboxViewController *)self footerTextView];
      unint64_t v7 = self->_pinnedFooterTextView;
      self->_pinnedFooterTextView = v6;

      double v8 = [(CKInboxViewController *)self view];
      [v8 addSubview:self->_pinnedFooterTextView];

      uint64_t v9 = [(UITextView *)self->_pinnedFooterTextView bottomAnchor];
      uint64_t v10 = [(CKInboxViewController *)self view];
      uint64_t v11 = [v10 safeAreaLayoutGuide];
      uint64_t v12 = [v11 bottomAnchor];
      id v13 = [v9 constraintEqualToAnchor:v12 constant:-25.0];
      [v13 setActive:1];

      v14 = [(UITextView *)self->_pinnedFooterTextView widthAnchor];
      double v15 = [(CKInboxViewController *)self view];
      double v16 = [v15 safeAreaLayoutGuide];
      v17 = [v16 widthAnchor];
      double v18 = [v14 constraintEqualToAnchor:v17];
      [v18 setActive:1];

      uint64_t v19 = [(UITextView *)self->_pinnedFooterTextView centerXAnchor];
      v20 = [(CKInboxViewController *)self view];
      id v21 = [v20 safeAreaLayoutGuide];
      uint64_t v22 = [v21 centerXAnchor];
      double v23 = [v19 constraintEqualToAnchor:v22];
      [v23 setActive:1];

      pinnedFooterTextView = self->_pinnedFooterTextView;
    }
    double v5 = pinnedFooterTextView;
  }

  return v5;
}

- (UITextView)scrollingFooterTextView
{
  BOOL v3 = [(CKInboxViewController *)self shouldHideInboxFooterTextView];
  scrollingFooterTextView = self->_scrollingFooterTextView;
  if (v3)
  {
    [(UITextView *)scrollingFooterTextView removeFromSuperview];
    double v5 = 0;
  }
  else
  {
    if (!scrollingFooterTextView)
    {
      uint64_t v6 = [(CKInboxViewController *)self footerTextView];
      unint64_t v7 = self->_scrollingFooterTextView;
      self->_scrollingFooterTextView = v6;

      scrollingFooterTextView = self->_scrollingFooterTextView;
    }
    double v5 = scrollingFooterTextView;
  }

  return v5;
}

- (BOOL)shouldHideInboxFooterTextView
{
  return !CKIsBlackholeEnabled();
}

- (id)footerTextView
{
  BOOL v3 = CKFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"FILTER_JUNK_LINK" value:&stru_1EDE4CA38 table:@"ChatKit"];

  double v5 = NSString;
  uint64_t v6 = CKFrameworkBundle();
  unint64_t v7 = [v6 localizedStringForKey:@"FILTER_FOOTER_TEXT_%@" value:&stru_1EDE4CA38 table:@"ChatKit"];
  double v8 = objc_msgSend(v5, "stringWithFormat:", v7, v4);

  uint64_t v9 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v10 = [v9 userInterfaceLayoutDirection];

  if (v10 == 1) {
    uint64_t v11 = @"\u200F";
  }
  else {
    uint64_t v11 = @"\u200E";
  }
  uint64_t v12 = [(__CFString *)v11 stringByAppendingString:v8];

  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v12];
  v14 = objc_opt_new();
  [v14 setAlignment:1];
  objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v14, 0, objc_msgSend(v13, "length"));
  double v15 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v15, 0, objc_msgSend(v13, "length"));
  double v16 = [v13 string];
  uint64_t v17 = [v16 rangeOfString:v4];
  uint64_t v19 = v18;

  objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E4FB0720], &stru_1EDE4CA38, v17, v19);
  uint64_t v20 = *MEMORY[0x1E4FB06F8];
  id v21 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4F43880]];
  objc_msgSend(v13, "addAttribute:value:range:", v20, v21, 0, objc_msgSend(v13, "length"));

  id v22 = objc_alloc(MEMORY[0x1E4F42F58]);
  double v23 = objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v23 _setInteractiveTextSelectionDisabled:1];
  [v23 setScrollEnabled:0];
  [v23 setEditable:0];
  [v23 setSelectable:1];
  [v23 setUserInteractionEnabled:1];
  [v23 setDelegate:self];
  double v24 = [v23 textDragInteraction];
  [v24 setEnabled:0];

  [v23 setClipsToBounds:0];
  [v23 setAdjustsFontForContentSizeCategory:1];
  [v23 setAttributedText:v13];
  v25 = [(CKInboxViewController *)self view];
  v26 = [v25 backgroundColor];
  [v23 setBackgroundColor:v26];

  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v23;
}

- (NSArray)primaryCellsData
{
  primaryCellsData = self->_primaryCellsData;
  if (!primaryCellsData)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v5 = +[CKInboxCellData allMessagesCellData];
    [v4 addObject:v5];

    if (CKMessageFilteringEnabled())
    {
      uint64_t v6 = +[CKInboxCellData knownSendersCellData];
      [v4 addObject:v6];

      unint64_t v7 = +[CKInboxCellData unknownSendersCellData];
      [v4 addObject:v7];
    }
    double v8 = [(CKInboxViewController *)self delegate];
    int v9 = [v8 inboxViewController:self shouldShowFilterMode:8];

    if (v9)
    {
      uint64_t v10 = +[CKInboxCellData unreadMessagesCellData];
      [v4 addObject:v10];
    }
    uint64_t v11 = (NSArray *)[v4 copy];
    uint64_t v12 = self->_primaryCellsData;
    self->_primaryCellsData = v11;

    primaryCellsData = self->_primaryCellsData;
  }

  return primaryCellsData;
}

- (NSArray)categoriesCellsDataArray
{
  v2 = self;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)self->_categoriesCellsDataArray count])
  {
    uint64_t v20 = v2;
    id v22 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [MEMORY[0x1E4F6E938] fetchSMSFilterExtensionParams];
    uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v24 != v5) {
            objc_enumerationMutation(obj);
          }
          unint64_t v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          double v8 = [CKInboxCellData alloc];
          int v9 = (void *)MEMORY[0x1E4F42A80];
          uint64_t v10 = [v7 iconName];
          uint64_t v11 = [v9 _systemImageNamed:v10];
          uint64_t v12 = IMSharedUtilitiesFrameworkBundle();
          id v13 = [v7 folderName];
          v14 = [v12 localizedStringForKey:v13 value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
          double v15 = -[CKInboxCellData initWithImage:title:filterMode:](v8, "initWithImage:title:filterMode:", v11, v14, [v7 filterMode]);

          [v22 addObject:v15];
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v4);
    }

    uint64_t v16 = [v22 copy];
    v2 = v20;
    categoriesCellsDataArray = v20->_categoriesCellsDataArray;
    v20->_categoriesCellsDataArray = (NSArray *)v16;
  }
  uint64_t v18 = v2->_categoriesCellsDataArray;

  return v18;
}

- (NSArray)junkCellsDataArray
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([(CKInboxViewController *)self _shouldShowJunkCell])
  {
    if (!self->_junkCellsDataArray)
    {
      if (IMIsOscarEnabled())
      {
        uint64_t v3 = +[CKInboxCellData oscarCellData];
        v11[0] = v3;
        uint64_t v4 = (void **)v11;
      }
      else if (CKIsBlackholeEnabled())
      {
        uint64_t v3 = +[CKInboxCellData blackholeJunkCellData];
        uint64_t v10 = v3;
        uint64_t v4 = &v10;
      }
      else
      {
        uint64_t v3 = +[CKInboxCellData junkCellData];
        int v9 = v3;
        uint64_t v4 = &v9;
      }
      objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v4, 1, v9, v10, v11[0]);
      uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      junkCellsDataArray = self->_junkCellsDataArray;
      self->_junkCellsDataArray = v6;
    }
    uint64_t v5 = self->_junkCellsDataArray;
  }
  else
  {
    uint64_t v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (BOOL)_shouldShowJunkCell
{
  int v3 = IMIsOscarEnabled();
  uint64_t v4 = [(CKInboxViewController *)self delegate];
  uint64_t v5 = v4;
  if (v3) {
    uint64_t v6 = 9;
  }
  else {
    uint64_t v6 = 6;
  }
  char v7 = [v4 inboxViewController:self shouldShowFilterMode:v6];

  return v7;
}

- (NSArray)recentlyDeletedCellDataArray
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (!self->_recentlyDeletedCellDataArray)
  {
    int v3 = +[CKInboxCellData recentlyDeletedCellData];
    v10[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    recentlyDeletedCellDataArray = self->_recentlyDeletedCellDataArray;
    self->_recentlyDeletedCellDataArray = v4;
  }
  uint64_t v6 = [(CKInboxViewController *)self delegate];
  int v7 = [v6 inboxViewController:self shouldShowFilterMode:7];

  if (v7) {
    double v8 = self->_recentlyDeletedCellDataArray;
  }
  else {
    double v8 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (void)setupCollectionView
{
  int v3 = [(CKInboxViewController *)self collectionView];
  [v3 setDelegate:self];

  uint64_t v4 = [(CKInboxViewController *)self collectionView];
  [v4 setAutoresizingMask:18];

  uint64_t v5 = [(CKInboxViewController *)self collectionView];
  [v5 setShowsHorizontalScrollIndicator:0];

  uint64_t v6 = (void *)MEMORY[0x1E4F428B0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = *MEMORY[0x1E4F43758];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __44__CKInboxViewController_setupCollectionView__block_invoke;
  v31[3] = &unk_1E562CCE0;
  v31[4] = self;
  int v9 = [v6 registrationWithSupplementaryClass:v7 elementKind:v8 configurationHandler:v31];
  uint64_t v10 = (void *)MEMORY[0x1E4F42868];
  uint64_t v11 = objc_opt_class();
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __44__CKInboxViewController_setupCollectionView__block_invoke_191;
  v30[3] = &unk_1E562CD08;
  v30[4] = self;
  uint64_t v12 = [v10 registrationWithCellClass:v11 configurationHandler:v30];
  id v13 = (void *)MEMORY[0x1E4F428B0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = *MEMORY[0x1E4F43750];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __44__CKInboxViewController_setupCollectionView__block_invoke_2;
  v29[3] = &unk_1E562CCE0;
  v29[4] = self;
  uint64_t v16 = [v13 registrationWithSupplementaryClass:v14 elementKind:v15 configurationHandler:v29];
  id v17 = objc_alloc(MEMORY[0x1E4F42880]);
  uint64_t v18 = [(CKInboxViewController *)self collectionView];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __44__CKInboxViewController_setupCollectionView__block_invoke_3;
  v27[3] = &unk_1E562CD30;
  id v28 = v12;
  id v19 = v12;
  uint64_t v20 = (void *)[v17 initWithCollectionView:v18 cellProvider:v27];
  [(CKInboxViewController *)self setCollectionViewDataSource:v20];

  id v21 = [(CKInboxViewController *)self collectionViewDataSource];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __44__CKInboxViewController_setupCollectionView__block_invoke_4;
  v24[3] = &unk_1E562CD58;
  id v25 = v16;
  id v26 = v9;
  id v22 = v9;
  id v23 = v16;
  [v21 setSupplementaryViewProvider:v24];
}

void __44__CKInboxViewController_setupCollectionView__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  if (v8 == [*(id *)(a1 + 32) _primarySectionIndex] && CKIsRunningInMacCatalyst())
  {
    int v9 = [MEMORY[0x1E4F42B58] prominentInsetGroupedHeaderConfiguration];
    uint64_t v10 = CKFrameworkBundle();
    uint64_t v11 = [v10 localizedStringForKey:@"MESSAGES" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v9 setText:v11];

    [v6 setContentConfiguration:v9];
  }
  else
  {
    uint64_t v12 = [v7 section];
    if (v12 == [*(id *)(a1 + 32) _categoriesSectionIndex])
    {
      id v13 = [MEMORY[0x1E4F42B58] groupedHeaderConfiguration];
      uint64_t v14 = [*(id *)(a1 + 32) _getSpamExtensionName];
      if ([v14 length])
      {
        uint64_t v15 = *(void **)(a1 + 32);
        uint64_t v16 = [v13 textProperties];
        id v17 = [v16 font];
        uint64_t v18 = [v15 _setHeaderAttributedStringForFont:v17];
        [v13 setAttributedText:v18];

        -[CKInboxViewController _setCommonTextProperties:](*(void *)(a1 + 32), v13);
      }
      else
      {
        id v19 = IMLogHandleForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          __44__CKInboxViewController_setupCollectionView__block_invoke_cold_1(v19);
        }
      }
      [v6 setContentConfiguration:v13];
    }
  }
}

- (void)_setCommonTextProperties:(uint64_t)a1
{
  id v10 = a2;
  if (a1)
  {
    int v3 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

    uint64_t v5 = [v10 textProperties];
    id v6 = v5;
    if (IsAccessibilityCategory)
    {
      [v5 setNumberOfLines:0];
    }
    else
    {
      [v5 setNumberOfLines:1];

      id v7 = [v10 textProperties];
      [v7 setLineBreakMode:4];

      uint64_t v8 = [v10 textProperties];
      [v8 setAdjustsFontSizeToFitWidth:1];

      int v9 = [v10 textProperties];
      [v9 setMinimumScaleFactor:0.949999988];

      id v6 = [v10 textProperties];
      [v6 setAllowsDefaultTighteningForTruncation:1];
    }
  }
}

void __44__CKInboxViewController_setupCollectionView__block_invoke_191(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v19 = a2;
  id v7 = a3;
  id v8 = a4;
  int v9 = [v19 defaultContentConfiguration];
  id v10 = [v8 image];
  uint64_t v11 = [MEMORY[0x1E4F42A98] defaultConfiguration];
  uint64_t v12 = [v10 imageWithSymbolConfiguration:v11];
  [v9 setImage:v12];

  id v13 = [v8 title];

  [v9 setText:v13];
  [v19 setContentConfiguration:v9];
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  id v15 = objc_alloc(MEMORY[0x1E4F42838]);
  uint64_t v16 = [*(id *)(a1 + 32) _unreadCountStringForIndexPath:v7];
  id v17 = (void *)[v15 initWithText:v16];
  [v14 addObject:v17];

  if ([*(id *)(a1 + 32) wantsCollapsedAppearance])
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F42830]);
    [v14 addObject:v18];
  }
  [v19 setAccessories:v14];
  objc_msgSend(v19, "setIndentationLevel:", objc_msgSend(*(id *)(a1 + 32), "_folderIndentationAtIndexPath:", v7));
}

void __44__CKInboxViewController_setupCollectionView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v27 = a2;
  uint64_t v6 = [a4 section];
  if (v6 == [*(id *)(a1 + 32) _lastSectionIndex])
  {
    id v7 = [*(id *)(a1 + 32) scrollingFooterTextView];
    id v8 = [v7 superview];

    if (v8 != v27)
    {
      int v9 = [*(id *)(a1 + 32) scrollingFooterTextView];
      [v9 removeFromSuperview];

      id v10 = [*(id *)(a1 + 32) scrollingFooterTextView];
      [v27 addSubview:v10];

      uint64_t v11 = [*(id *)(a1 + 32) scrollingFooterTextView];
      uint64_t v12 = [v11 leadingAnchor];
      id v13 = [v27 leadingAnchor];
      uint64_t v14 = [v12 constraintEqualToAnchor:v13];
      [v14 setActive:1];

      id v15 = [*(id *)(a1 + 32) scrollingFooterTextView];
      uint64_t v16 = [v15 trailingAnchor];
      id v17 = [v27 trailingAnchor];
      id v18 = [v16 constraintEqualToAnchor:v17];
      [v18 setActive:1];

      id v19 = [*(id *)(a1 + 32) scrollingFooterTextView];
      uint64_t v20 = [v19 topAnchor];
      id v21 = [v27 topAnchor];
      id v22 = [v20 constraintEqualToAnchor:v21 constant:25.0];
      [v22 setActive:1];

      id v23 = [*(id *)(a1 + 32) scrollingFooterTextView];
      long long v24 = [v23 bottomAnchor];
      id v25 = [v27 bottomAnchor];
      id v26 = [v24 constraintEqualToAnchor:v25];
      [v26 setActive:1];
    }
  }
}

uint64_t __44__CKInboxViewController_setupCollectionView__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 32) forIndexPath:a3 item:a4];
}

id __44__CKInboxViewController_setupCollectionView__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = 40;
  if (*MEMORY[0x1E4F43750] == a3) {
    uint64_t v3 = 32;
  }
  uint64_t v4 = objc_msgSend(a2, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", *(void *)(a1 + v3));

  return v4;
}

- (void)reloadCollectionViewData
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  v17[0] = @"CKInboxViewPrimarySectionID";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v3 appendSectionsWithIdentifiers:v4];

  uint64_t v5 = [(CKInboxViewController *)self primaryCellsData];
  [v3 appendItemsWithIdentifiers:v5 intoSectionWithIdentifier:@"CKInboxViewPrimarySectionID"];

  if ([(CKInboxViewController *)self _spamFilteringEnabled])
  {
    uint64_t v16 = @"CKInboxViewCategoriesSectionID";
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    [v3 appendSectionsWithIdentifiers:v6];

    id v7 = [(CKInboxViewController *)self categoriesCellsDataArray];
    [v3 appendItemsWithIdentifiers:v7 intoSectionWithIdentifier:@"CKInboxViewCategoriesSectionID"];
  }
  id v8 = [(CKInboxViewController *)self junkCellsDataArray];
  if ([v8 count])
  {
    id v15 = @"CKInboxViewJunkSectionID";
    int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    [v3 appendSectionsWithIdentifiers:v9];

    [v3 appendItemsWithIdentifiers:v8 intoSectionWithIdentifier:@"CKInboxViewJunkSectionID"];
  }
  id v10 = [(CKInboxViewController *)self recentlyDeletedCellDataArray];
  if ([v10 count])
  {
    uint64_t v14 = @"kCKInboxViewRecentlyDeletedSectionID";
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    [v3 appendSectionsWithIdentifiers:v11];

    [v3 appendItemsWithIdentifiers:v10 intoSectionWithIdentifier:@"kCKInboxViewRecentlyDeletedSectionID"];
  }
  uint64_t v12 = [(CKInboxViewController *)self collectionViewDataSource];
  [v12 applySnapshot:v3 animatingDifferences:self->_isVisible];

  id v13 = [(CKInboxViewController *)self collectionView];
  [v13 reloadData];
}

- (void)updateBackButton
{
  if (self->_shouldProcessBackButtonUpdates)
  {
    uint64_t v3 = [(CKInboxViewController *)self conversationListController];
    uint64_t v4 = [v3 filterMode];

    if (v4 == 1) {
      goto LABEL_13;
    }
    uint64_t v5 = [(CKInboxViewController *)self _conversationList];
    uint64_t v6 = [v5 unreadCountForFilterMode:1];

    id v7 = [(CKInboxViewController *)self conversationListController];
    if ([v7 filterMode] == 6)
    {
      uint64_t v8 = 0;
    }
    else
    {
      id v10 = [(CKInboxViewController *)self _conversationList];
      uint64_t v11 = [(CKInboxViewController *)self conversationListController];
      uint64_t v8 = objc_msgSend(v10, "unreadCountForFilterMode:", objc_msgSend(v11, "filterMode"));
    }
    uint64_t v12 = v6 - v8;
    if (v12 < 1)
    {
LABEL_13:
      id v13 = [CKBackBarButtonItem alloc];
      uint64_t v14 = CKFrameworkBundle();
      id v15 = [v14 localizedStringForKey:@"FILTERS_BACK_BUTTON" value:&stru_1EDE4CA38 table:@"ChatKit"];
      id v17 = [(CKBackBarButtonItem *)v13 initWithTitle:v15];
    }
    else
    {
      id v17 = [[CKBackBarButtonItem alloc] initWithUnreadCount:v12];
    }
    uint64_t v16 = [(CKInboxViewController *)self navigationItem];
    [v16 setBackBarButtonItem:v17];
  }
  else if (IMOSLoggingEnabled())
  {
    int v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "ignoring back button updates", buf, 2u);
    }
  }
}

- (int64_t)_primarySectionIndex
{
  v2 = [(CKInboxViewController *)self collectionViewDataSource];
  int64_t v3 = [v2 indexForSectionIdentifier:@"CKInboxViewPrimarySectionID"];

  return v3;
}

- (int64_t)_categoriesSectionIndex
{
  v2 = [(CKInboxViewController *)self collectionViewDataSource];
  int64_t v3 = [v2 indexForSectionIdentifier:@"CKInboxViewCategoriesSectionID"];

  return v3;
}

- (int64_t)_junkSectionIndex
{
  v2 = [(CKInboxViewController *)self collectionViewDataSource];
  int64_t v3 = [v2 indexForSectionIdentifier:@"CKInboxViewJunkSectionID"];

  return v3;
}

- (int64_t)_recentlyDeletedSectionIndex
{
  v2 = [(CKInboxViewController *)self collectionViewDataSource];
  int64_t v3 = [v2 indexForSectionIdentifier:@"kCKInboxViewRecentlyDeletedSectionID"];

  return v3;
}

- (int64_t)_lastSectionIndex
{
  int64_t v3 = [(CKInboxViewController *)self collectionViewDataSource];
  uint64_t v4 = [(CKInboxViewController *)self collectionView];
  int64_t v5 = [v3 numberOfSectionsInCollectionView:v4] - 1;

  return v5;
}

- (int64_t)_folderIndentationAtIndexPath:(id)a3
{
  return [(CKInboxViewController *)self _filterModeForIndexPath:a3] > 0xF;
}

- (id)_conversationList
{
  return +[CKConversationList sharedConversationList];
}

- (void)_chatUnreadCountDidChange:(id)a3
{
  id v3 = [(CKInboxViewController *)self _conversationList];
  [v3 updateConversationListsAndSortIfEnabled];
}

- (void)_conversationListDidFinishSorting:(id)a3
{
  if (self->_isVisible) {
    [(CKInboxViewController *)self reloadCollectionViewData];
  }
  else {
    [(CKInboxViewController *)self updateBackButton];
  }
}

- (void)_messageFilteringEnabledDidChange:(id)a3
{
  id v4 = a3;
  primaryCellsData = self->_primaryCellsData;
  self->_primaryCellsData = 0;

  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "_messageFilteringEnabledDidChange", buf, 2u);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CKInboxViewController__messageFilteringEnabledDidChange___block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__CKInboxViewController__messageFilteringEnabledDidChange___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F6E938] updateSMSFilterExtensionParams];
  id v2 = (id)[*(id *)(a1 + 32) _updateCategoriesCellsDataArray];
  id v3 = [*(id *)(a1 + 32) _conversationList];
  [v3 updateConversationListsAndSortIfEnabled];

  id v4 = [*(id *)(a1 + 32) view];
  [v4 setNeedsLayout];

  id v5 = [*(id *)(a1 + 32) view];
  [v5 layoutIfNeeded];
}

- (void)_spamFilteringStateChanged
{
  primaryCellsData = self->_primaryCellsData;
  self->_primaryCellsData = 0;

  categoriesCellsDataArray = self->_categoriesCellsDataArray;
  self->_categoriesCellsDataArray = 0;

  junkCellsDataArray = self->_junkCellsDataArray;
  self->_junkCellsDataArray = 0;

  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "_spamFilteringStateChanged", v11, 2u);
    }
  }
  [MEMORY[0x1E4F6E938] updateSMSFilterExtensionParams];
  id v7 = [(CKInboxViewController *)self _updateCategoriesCellsDataArray];
  uint64_t v8 = [(CKInboxViewController *)self _conversationList];
  [v8 updateConversationListsAndSortIfEnabled];

  int v9 = [(CKInboxViewController *)self view];
  [v9 setNeedsLayout];

  id v10 = [(CKInboxViewController *)self view];
  [v10 layoutIfNeeded];
}

- (id)_updateCategoriesCellsDataArray
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [MEMORY[0x1E4F6E938] fetchSMSFilterExtensionParams];
  uint64_t v2 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v23;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v23 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v22 + 1) + 8 * v5);
        id v7 = [CKInboxCellData alloc];
        uint64_t v8 = (void *)MEMORY[0x1E4F42A80];
        int v9 = [v6 iconName];
        id v10 = [v8 _systemImageNamed:v9];
        uint64_t v11 = IMSharedUtilitiesFrameworkBundle();
        uint64_t v12 = [v6 folderName];
        id v13 = [v11 localizedStringForKey:v12 value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
        uint64_t v14 = -[CKInboxCellData initWithImage:title:filterMode:](v7, "initWithImage:title:filterMode:", v10, v13, [v6 filterMode]);

        [v21 addObject:v14];
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v3);
  }

  id v15 = (NSArray *)[v21 copy];
  categoriesCellsDataArray = self->_categoriesCellsDataArray;
  self->_categoriesCellsDataArray = v15;

  id v17 = self->_categoriesCellsDataArray;
  return v17;
}

- (void)_contentSizeCategoryChanged
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CKInboxViewController__contentSizeCategoryChanged__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __52__CKInboxViewController__contentSizeCategoryChanged__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) collectionView];
  [v2 reloadData];

  uint64_t v3 = [*(id *)(a1 + 32) view];
  [v3 setNeedsLayout];

  id v4 = [*(id *)(a1 + 32) view];
  [v4 layoutIfNeeded];
}

- (BOOL)_spamFilteringEnabled
{
  return CKMessageSpamFilteringEnabled() != 0;
}

- (id)_getSpamExtensionName
{
}

- (void)_localeDidChange
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "_localeDidChange", v4, 2u);
    }
  }
  [(CKInboxViewController *)self _spamFilteringStateChanged];
}

- (void)focusStateDidChange
{
  uint64_t v3 = [(CKInboxViewController *)self _conversationList];
  [v3 updateConversationListsAndSortIfEnabled];

  id v4 = [(CKInboxViewController *)self view];
  [v4 setNeedsLayout];

  id v5 = [(CKInboxViewController *)self view];
  [v5 layoutIfNeeded];
}

- (id)_setHeaderAttributedStringForFont:(id)a3
{
  id v4 = a3;
  id v5 = [(CKInboxViewController *)self _getSpamExtensionName];
  if ([v5 length])
  {
    uint64_t v6 = [(CKInboxViewController *)self _getHeaderStringForExtension:v5];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v6];
    uint64_t v8 = [v7 string];
    int v9 = [v5 localizedUppercaseString];
    uint64_t v10 = [v8 rangeOfString:v9];
    uint64_t v12 = v11;

    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = *MEMORY[0x1E4FB06F8];
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_emphasizedFontFromFont:", v4);
      objc_msgSend(v7, "addAttribute:value:range:", v13, v14, v10, v12);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_getHeaderStringForExtension:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = a3;
  id v5 = CKFrameworkBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"FILTERED_BY_APP_NAME" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v7 = objc_msgSend(v3, "stringWithFormat:", v6, v4);

  uint64_t v8 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v9 = [v8 userInterfaceLayoutDirection];

  if (v9 == 1) {
    uint64_t v10 = @"\u200F";
  }
  else {
    uint64_t v10 = @"\u200E";
  }
  uint64_t v11 = [(__CFString *)v10 stringByAppendingString:v7];

  uint64_t v12 = [v11 localizedUppercaseString];

  return v12;
}

- (BOOL)wantsCollapsedAppearance
{
  BOOL v3 = [(CKInboxViewController *)self _wantsThreeColumnLayout];
  id v4 = [(CKInboxViewController *)self splitViewController];
  char v5 = [v4 isCollapsed];
  char v6 = !v3 | v5;
  if (!v3 && (v5 & 1) == 0)
  {
    id v7 = [(CKInboxViewController *)self splitViewController];
    char v6 = [v7 displayMode] == 2;
  }
  return v6;
}

- (BOOL)_wantsThreeColumnLayout
{
  uint64_t v2 = +[CKUIBehavior sharedBehaviors];
  char v3 = [v2 wantsUniversalThreeColumn];

  return v3;
}

- (CKInboxViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKInboxViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKConversationListControllerProtocol)conversationListController
{
  return self->_conversationListController;
}

- (void)setConversationListController:(id)a3
{
}

- (UICollectionViewDiffableDataSource)collectionViewDataSource
{
  return self->_collectionViewDataSource;
}

- (void)setCollectionViewDataSource:(id)a3
{
}

- (UICollectionViewCell)initiallySelectedCell
{
  return self->_initiallySelectedCell;
}

- (void)setInitiallySelectedCell:(id)a3
{
}

- (void)setPrimaryCellsData:(id)a3
{
}

- (void)setCategoriesCellsDataArray:(id)a3
{
}

- (void)setJunkCellsDataArray:(id)a3
{
}

- (void)setRecentlyDeletedCellDataArray:(id)a3
{
}

- (void)setPinnedFooterTextView:(id)a3
{
}

- (void)setScrollingFooterTextView:(id)a3
{
}

- (NSDictionary)cellDataForFilterMode
{
  return self->_cellDataForFilterMode;
}

- (void)setCellDataForFilterMode:(id)a3
{
}

- (BOOL)shouldProcessBackButtonUpdates
{
  return self->_shouldProcessBackButtonUpdates;
}

- (void)setShouldProcessBackButtonUpdates:(BOOL)a3
{
  self->_shouldProcessBackButtonUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellDataForFilterMode, 0);
  objc_storeStrong((id *)&self->_scrollingFooterTextView, 0);
  objc_storeStrong((id *)&self->_pinnedFooterTextView, 0);
  objc_storeStrong((id *)&self->_recentlyDeletedCellDataArray, 0);
  objc_storeStrong((id *)&self->_junkCellsDataArray, 0);
  objc_storeStrong((id *)&self->_categoriesCellsDataArray, 0);
  objc_storeStrong((id *)&self->_primaryCellsData, 0);
  objc_storeStrong((id *)&self->_initiallySelectedCell, 0);
  objc_storeStrong((id *)&self->_collectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_conversationListController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __44__CKInboxViewController_setupCollectionView__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Couldn't get extension filter name", v1, 2u);
}

@end