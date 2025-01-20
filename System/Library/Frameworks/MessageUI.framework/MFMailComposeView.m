@interface MFMailComposeView
+ (OS_os_log)log;
+ (double)preferredHeaderHeight;
- (BOOL)_presentsSearchResultsTableAsPopover;
- (BOOL)_shouldShowCorecipientsTableView;
- (BOOL)_userInterfaceConfigurationSupportsCorecipientsTableView;
- (BOOL)chooseSelectedSearchResult;
- (BOOL)dragSource:(id)a3 sessionAllowsMoveOperation:(id)a4;
- (BOOL)dropTarget:(id)a3 shouldAddDroppedContactsToTargetView:(id)a4 forSession:(id)a5;
- (BOOL)endEditing:(BOOL)a3;
- (BOOL)isAnimationDisabled;
- (BOOL)isChangingRecipients;
- (BOOL)isForEditing;
- (BOOL)isKeyboardVisible;
- (BOOL)isLoading;
- (BOOL)isLoadingFromAddress;
- (BOOL)isQuickReply;
- (BOOL)isReplyToHME;
- (BOOL)isSearchResultsPopoverVisible;
- (BOOL)isSearching;
- (BOOL)isSending;
- (BOOL)isShowingPeoplePicker;
- (BOOL)presentSearchResults;
- (BOOL)presentSearchResults:(id)a3;
- (BOOL)shouldScrollLastChangedRecipientViewToTop;
- (CGPoint)_headerViewOriginWithScrollViewOffsetCalculation;
- (CGRect)_headerFrame;
- (CNAutocompleteResultsTableViewController)searchViewController;
- (ComposeViewNavigationBarDelegate)navigationBarDelegate;
- (EFCancelable)autoCompleteTableViewContentSizeObserver;
- (MFComposeDisplayMetrics)displayMetrics;
- (MFComposeFromView)fromField;
- (MFComposeImageSizeView)imageSizeField;
- (MFComposeMultiView)multiField;
- (MFComposeSubjectView)subjectField;
- (MFComposeWebContentVariationView)webContentVariationField;
- (MFComposeWebView)composeWebView;
- (MFMailComposeContactsSearchController)searchController;
- (MFMailComposeCoordinator)composeCoordinator;
- (MFMailComposeRecipientTextView)bccField;
- (MFMailComposeRecipientTextView)ccField;
- (MFMailComposeRecipientTextViewDelegate)composeRecipientDelegate;
- (MFMailComposeToField)toField;
- (MFMailComposeToFieldDelegate)toFieldDelegate;
- (MFMailComposeView)initWithFrame:(CGRect)a3 options:(unint64_t)a4 isQuickReply:(BOOL)a5;
- (MFMailComposeViewDelegate)composeViewDelegate;
- (UIScrollView)bodyScroller;
- (UITableView)searchTableView;
- (UIViewController)popoverOwner;
- (double)_heightForBottomView;
- (double)_verticalPadding;
- (id)_corecipientResultsTable;
- (id)_focusedRecipientView;
- (id)_searchResultsTable;
- (id)dragSource:(id)a3 draggableItemsAtPoint:(CGPoint)a4;
- (id)dragSource:(id)a3 localObjectForDraggableItem:(id)a4;
- (id)dragSource:(id)a3 suggestedNameForDraggableItem:(id)a4;
- (id)dragSource:(id)a3 targetedPreviewForDraggableItem:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)recipientTextViewForComposeMultiView:(id)a3;
- (id)sendingAccountProxyForComposeContactsSearchController:(id)a3;
- (id)sendingAddressForDropTarget:(id)a3 withTargetView:(id)a4;
- (int64_t)addressableGroupResultStyleForComposeContactsSearchController:(id)a3;
- (void)_adjustHeaderFieldsPreferredContentSize;
- (void)_adjustScrollerContentSize;
- (void)_adjustScrollerForBottomView;
- (void)_cancelAnimations;
- (void)_cancelDelayedPopover;
- (void)_collectKeyViews:(id)a3;
- (void)_createCCAndBCCFieldIfNeededAndCompleteSetup:(BOOL)a3;
- (void)_createImageSizeFieldIfNeededAndAddSubview:(BOOL)a3;
- (void)_displayMetricsDidChange;
- (void)_dropItems:(id)a3 recipientTextView:(id)a4;
- (void)_finishUpRotationToInterfaceOrientation:(int64_t)a3;
- (void)_layoutComposeHeaderViewsWithChangingHeader:(id)a3 toSize:(CGSize)a4 withPinFrame:(CGRect *)a5;
- (void)_layoutFindPanelHostView;
- (void)_layoutLoadingView;
- (void)_layoutSubviews:(BOOL)a3;
- (void)_layoutSubviews:(BOOL)a3 changingView:(id)a4 toSize:(CGSize)a5;
- (void)_layoutSubviews:(BOOL)a3 changingView:(id)a4 toSize:(CGSize)a5 searchResultsWereDismissed:(BOOL)a6;
- (void)_layoutSubviewsWithActiveRecipientView:(BOOL)a3 changingView:(id)a4 toSize:(CGSize)a5;
- (void)_multiFieldClicked;
- (void)_performBlockWithStrongComposeCoordinator:(id)a3;
- (void)_presentDelayedPopover;
- (void)_setCorecipientsTableViewVisible:(BOOL)a3 withFieldFrame:(CGRect)a4;
- (void)_setDragging:(BOOL)a3;
- (void)_setHeaderFrame:(CGRect)a3;
- (void)_setShadowViewVisible:(BOOL)a3 frame:(CGRect)a4;
- (void)_setUpContentView;
- (void)_setupBodyFieldWithHeaderFrame:(double)a3 enclosingFrame:(double)a4 changingView:(double)a5 frameToPin:(uint64_t)a6 wasSearching:(void *)a7;
- (void)_setupField:(id)a3 withLabel:(id)a4 navTitle:(id)a5;
- (void)_updateFromField;
- (void)_updateKeyboardIntersection:(CGRect)a3;
- (void)_updateMultiField;
- (void)_updateOptionalHeaderVisibilityForceVisible:(BOOL)a3;
- (void)autocompleteResultsController:(id)a3 didAskToRemoveRecipient:(id)a4;
- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4;
- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5;
- (void)automaticKeyboardFinishedAppearing:(id)a3;
- (void)automaticKeyboardFinishedDisappearing:(id)a3;
- (void)beginSearchForText:(id)a3 recipientView:(id)a4;
- (void)cancelSearch;
- (void)clearSearchForActiveRecipientView;
- (void)clearSearchForRecipientView:(id)a3 reflow:(BOOL)a4 clear:(BOOL)a5;
- (void)composeContactsSearchController:(id)a3 didFindCorecipients:(id)a4;
- (void)composeContactsSearchController:(id)a3 didSortResults:(id)a4;
- (void)composeContactsSearchController:(id)a3 finishedWithResults:(BOOL)a4;
- (void)composeFromView:(id)a3 didSelectAddress:(id)a4;
- (void)composeHeaderViewClicked:(id)a3;
- (void)composeWebView:(id)a3 composeBodyIsEmpty:(BOOL)a4;
- (void)composeWebView:(id)a3 didChangeHeight:(double)a4;
- (void)composeWebView:(id)a3 hasActiveWritingToolsSession:(BOOL)a4;
- (void)composeWebViewTextChanged:(id)a3;
- (void)dealloc;
- (void)didAppear;
- (void)didIgnoreSearchResults;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)disambiguateRecipient:(id)a3 recipientView:(id)a4;
- (void)dismissSearchResults;
- (void)dismissSearchResultsIfDisambiguating;
- (void)displayQuickReplyView:(BOOL)a3;
- (void)dragSource:(id)a3 willEndInteractionWithItems:(id)a4 dropOperation:(unint64_t)a5;
- (void)dropTarget:(id)a3 didDropDragItems:(id)a4 atPoint:(CGPoint)a5;
- (void)dropTarget:(id)a3 dragDidMoveToPoint:(CGPoint)a4;
- (void)dropTarget:(id)a3 dragEnteredAtPoint:(CGPoint)a4;
- (void)dropTargetDragExited:(id)a3;
- (void)findCorecipientsWithRecipientView:(id)a3;
- (void)findNavigatorPanelDidChangeHeight:(double)a3;
- (void)focusFirstResponderAfterRecipientView:(id)a3;
- (void)invalidateSearchResultRecipient:(id)a3;
- (void)layoutForChangedComposeHeaderView:(id)a3 size:(CGSize)a4;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)menuDidHide;
- (void)parentDidClose;
- (void)parentWillClose;
- (void)removeFromSuperview;
- (void)resetContentSize;
- (void)restoreFirstResponder;
- (void)restoreFirstResponderWithKeyboardPinning:(BOOL)a3;
- (void)saveFirstResponder;
- (void)saveFirstResponderWithKeyboardPinning:(BOOL)a3;
- (void)scrollToRecipientTextView:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)searchResultsPopoverWasDismissed;
- (void)selectNextSearchResult;
- (void)selectPreviousSearchResult;
- (void)setAnimationDisabled:(BOOL)a3;
- (void)setAutoCompleteTableViewContentSizeObserver:(id)a3;
- (void)setAutoresizingMask:(unint64_t)a3;
- (void)setChangingRecipients:(BOOL)a3;
- (void)setComposeCoordinator:(id)a3;
- (void)setComposeRecipientDelegate:(id)a3;
- (void)setComposeViewDelegate:(id)a3;
- (void)setDisplayMetrics:(id)a3;
- (void)setIsForEditing:(BOOL)a3;
- (void)setKeyboardVisible:(BOOL)a3 animate:(BOOL)a4;
- (void)setLoading:(BOOL)a3;
- (void)setLoadingFromAddress:(BOOL)a3;
- (void)setNavigationBarDelegate:(id)a3;
- (void)setPopoverOwner:(id)a3;
- (void)setQuickReply:(BOOL)a3;
- (void)setRecipientFieldsEditable:(BOOL)a3 animated:(BOOL)a4;
- (void)setReplyToHME:(BOOL)a3;
- (void)setScrollsToTop:(BOOL)a3;
- (void)setSending:(BOOL)a3;
- (void)setShowingPeoplePicker:(BOOL)a3;
- (void)setToFieldDelegate:(id)a3;
- (void)toggleImageSizeFieldIfNecessary;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateOptionalHeaderVisibility;
- (void)viewDidBecomeFirstResponder:(id)a3;
- (void)willDisappear;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation MFMailComposeView

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__MFMailComposeView_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1) {
    dispatch_once(&log_onceToken_3, block);
  }
  v2 = (void *)log_log_3;

  return (OS_os_log *)v2;
}

void __24__MFMailComposeView_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;
}

+ (double)preferredHeaderHeight
{
  [MEMORY[0x1E4F5A130] preferredHeight];
  return result;
}

- (MFMailComposeView)initWithFrame:(CGRect)a3 options:(unint64_t)a4 isQuickReply:(BOOL)a5
{
  BOOL v5 = a5;
  double width = a3.size.width;
  v37.receiver = self;
  v37.super_class = (Class)MFMailComposeView;
  v8 = -[UITransitionView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = v8;
  if (v8)
  {
    v8->_options = a4;
    if (v5) {
      char v10 = 64;
    }
    else {
      char v10 = 0;
    }
    *((unsigned char *)v8 + 777) = *((unsigned char *)v8 + 777) & 0xBF | v10;
    [(UITransitionView *)v8 setDelegate:v8];
    [(MFMailComposeView *)v9 setAutoresizingMask:18];
    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    headerView = v9->_headerView;
    v9->_headerView = v11;

    [(UIView *)v9->_headerView setAutoresizingMask:2];
    [(UIView *)v9->_headerView setAutoresizesSubviews:0];
    v13 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(UIView *)v9->_headerView setBackgroundColor:v13];

    [(UIView *)v9->_headerView setInsetsLayoutMarginsFromSafeArea:0];
    [(UIView *)v9->_headerView setClipsToBounds:1];
    [(id)objc_opt_class() preferredHeaderHeight];
    double v15 = v14;
    v16 = -[CNComposeRecipientTextView initWithFrame:dragDropDelegate:]([MFMailComposeToField alloc], "initWithFrame:dragDropDelegate:", v9, 0.0, 0.0, width, v14);
    toField = v9->_toField;
    v9->_toField = v16;

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_toFieldDelegate);
    [(MFMailComposeToField *)v9->_toField setToFieldDelegate:WeakRetained];

    v19 = v9->_toField;
    v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"TO" value:&stru_1F0817A00 table:@"Main"];
    v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"To:" value:&stru_1F0817A00 table:@"Main"];
    [(MFMailComposeView *)v9 _setupField:v19 withLabel:v21 navTitle:v23];

    [(MFMailComposeToField *)v9->_toField setAccessibilityIdentifier:*MEMORY[0x1E4F73CB0]];
    v24 = -[MFComposeFromView initWithFrame:]([MFComposeFromView alloc], "initWithFrame:", 0.0, 0.0, width, v15);
    fromField = v9->_fromField;
    v9->_fromField = v24;

    [(MFComposeFromView *)v9->_fromField setAutoresizingMask:2];
    [(MFComposeFromView *)v9->_fromField setDelegate:v9];
    [(MFMailComposeView *)v9 _addHoverEffectToField:v9->_fromField];
    v26 = -[MFComposeSubjectView initWithFrame:]([MFComposeSubjectView alloc], "initWithFrame:", 0.0, 0.0, width, v15);
    subjectField = v9->_subjectField;
    v9->_subjectField = v26;

    [(MFComposeSubjectView *)v9->_subjectField setAutoresizingMask:2];
    [(MFMailComposeView *)v9 _addHoverEffectToField:v9->_subjectField];
    v28 = -[MFComposeWebContentVariationView initWithFrame:]([MFComposeWebContentVariationView alloc], "initWithFrame:", 0.0, 0.0, width, v15);
    webContentVariationField = v9->_webContentVariationField;
    v9->_webContentVariationField = v28;

    v30 = -[MFComposeMultiView initWithFrame:]([MFComposeMultiView alloc], "initWithFrame:", 0.0, 0.0, width, v15);
    multiField = v9->_multiField;
    v9->_multiField = v30;

    [(MFComposeMultiView *)v9->_multiField setAutoresizingMask:2];
    [(MFComposeMultiView *)v9->_multiField setDelegate:v9];
    [(MFMailComposeView *)v9 _addHoverEffectToField:v9->_multiField];
    [(MFMailComposeView *)v9 _setUpContentView];
    [(MFMailComposeView *)v9 displayQuickReplyView:v5];
    [(UIScrollView *)v9->_bodyScroller setKeyboardDismissMode:2];
    v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v32 addObserver:v9 selector:sel_menuDidHide name:*MEMORY[0x1E4FB2CB0] object:0];

    v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v33 addObserver:v9 selector:sel_automaticKeyboardFinishedAppearing_ name:*MEMORY[0x1E4FB2BC8] object:0];

    v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v34 addObserver:v9 selector:sel_automaticKeyboardFinishedDisappearing_ name:*MEMORY[0x1E4FB2BC0] object:0];

    v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v35 addObserver:v9 selector:sel__adjustHeaderFieldsPreferredContentSize name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v9;
}

- (void)displayQuickReplyView:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 777) = *((unsigned char *)self + 777) & 0xBF | v3;
  if (!a3)
  {
    [(UIScrollView *)self->_bodyScroller addSubview:self->_headerView];
    [(UIView *)self->_headerView addSubview:self->_fromField];
    [(UIView *)self->_headerView addSubview:self->_subjectField];
    [(MFComposeSubjectView *)self->_subjectField setAccessibilityIdentifier:*MEMORY[0x1E4F73C90]];
    [(UIView *)self->_headerView addSubview:self->_webContentVariationField];
    [(UIView *)self->_headerView addSubview:self->_multiField];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v5 = objc_alloc(MEMORY[0x1E4FB1C50]);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    v9 = __43__MFMailComposeView_displayQuickReplyView___block_invoke;
    char v10 = &unk_1E5F7C2A0;
    objc_copyWeak(&v11, &location);
    v6 = (void *)[v5 initWithActivationHandler:&v7];
    -[MFComposeMultiView addInteraction:](self->_multiField, "addInteraction:", v6, v7, v8, v9, v10);
    [(MFComposeMultiView *)self->_multiField setScribbleDelegate:self];
    [(MFComposeMultiView *)self->_multiField setAccessibilityIdentifier:*MEMORY[0x1E4F73B90]];
    [(MFMailComposeView *)self _layoutSubviews:1];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __43__MFMailComposeView_displayQuickReplyView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _multiFieldClicked];
}

- (void)dealloc
{
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(MFMailComposeContactsSearchController *)self->_searchController cancelSearch];
  [(MFMailComposeContactsSearchController *)self->_searchController setDelegate:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pinningResponder);
  [WeakRetained _endPinningInputViews];

  [(MFComposeMultiView *)self->_multiField setDelegate:0];
  [(MFComposeWebView *)self->_webView _close];
  v5.receiver = self;
  v5.super_class = (Class)MFMailComposeView;
  [(MFMailComposeView *)&v5 dealloc];
}

- (void)_setUpContentView
{
  id v20 = [(MFMailComposeView *)self _mainContainerView];
  char v3 = [MFComposeWebView alloc];
  [(MFMailComposeView *)self _frameForMainContainerView];
  uint64_t v8 = -[MFComposeWebView initWithFrame:isQuickReply:](v3, "initWithFrame:isQuickReply:", [(MFMailComposeView *)self isQuickReply], v4, v5, v6, v7);
  webView = self->_webView;
  self->_webView = v8;

  p_contentView = &self->_contentView;
  objc_storeStrong((id *)&self->_contentView, self->_webView);
  [(UIView *)self->_contentView setAutoresizingMask:18];
  if ([(MFMailComposeView *)self isQuickReply]) {
    [MEMORY[0x1E4FB1618] mailQuickComposeBackgroundColor];
  }
  else {
  id v11 = [MEMORY[0x1E4FB1618] mailGeneralBackgroundColor];
  }
  [(UIView *)*p_contentView setBackgroundColor:v11];

  [v20 addSubview:*p_contentView];
  [(MFComposeWebView *)self->_webView setComposeWebViewDelegate:self];
  [(MFComposeWebView *)self->_webView _setEditable:1];
  id v12 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v13 = (UIView *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  findPanelHostView = self->_findPanelHostView;
  self->_findPanelHostView = v13;

  double v15 = self->_findPanelHostView;
  v16 = [(MFComposeWebView *)self->_webView findInteraction];
  [v16 _setHostView:v15];

  v17 = [(MFComposeWebView *)self->_webView scrollView];
  [v17 addSubview:self->_findPanelHostView];

  v18 = [(MFComposeWebView *)self->_webView scrollView];
  bodyScroller = self->_bodyScroller;
  self->_bodyScroller = v18;

  [(UIScrollView *)self->_bodyScroller setAutoresizingMask:18];
  [(UIScrollView *)self->_bodyScroller setDelegate:self];
  [(UIScrollView *)self->_bodyScroller setAlwaysBounceVertical:[(MFMailComposeView *)self isQuickReply] ^ 1];
  [(UIScrollView *)self->_bodyScroller _setFirstResponderKeyboardAvoidanceEnabled:0];
  if ([(MFMailComposeView *)self isQuickReply])
  {
    [(UIScrollView *)self->_bodyScroller setContentInsetAdjustmentBehavior:2];
    [(UIScrollView *)self->_bodyScroller setScrollEnabled:0];
    [(UIScrollView *)self->_bodyScroller setBounces:0];
  }
  [(MFMailComposeView *)self _adjustContentViewStyle];
}

- (CGRect)_headerFrame
{
  [(UIView *)self->_headerView frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIScrollView *)self->_bodyScroller contentInset];
  double v12 = v6 + v11;
  double v13 = v4;
  double v14 = v8;
  double v15 = v10;
  result.size.height = v15;
  result.size.double width = v14;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

- (void)_setHeaderFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  [(UIScrollView *)self->_bodyScroller contentInset];
  [(UIScrollView *)self->_bodyScroller contentOffset];
  double v9 = v8;
  double v11 = v10;
  v19.origin.double x = x;
  v19.origin.CGFloat y = y;
  v19.size.double width = width;
  v19.size.double height = height;
  double v12 = CGRectGetHeight(v19);
  [(UIView *)self->_headerView frame];
  double v13 = v12 - CGRectGetHeight(v20);
  double findPanelHeight = self->_findPanelHeight;
  double v15 = v11 - v13;
  if ([(MFMailComposeView *)self isQuickReply]) {
    double v15 = 0.0;
  }
  -[UIScrollView setContentInset:](self->_bodyScroller, "setContentInset:");
  -[UIScrollView setContentOffset:](self->_bodyScroller, "setContentOffset:", v9, v15);
  -[UIScrollView setContentOffset:](self->_bodyScroller, "setContentOffset:", v9, v15);
  headerView = self->_headerView;

  -[UIView setFrame:](headerView, "setFrame:", x, -(height + findPanelHeight), width, height);
}

- (void)setComposeViewDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_mailComposeViewDelegate, obj);
    [(MFComposeWebView *)self->_webView setMailComposeViewDelegate:obj];
  }
}

- (void)setComposeRecipientDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeRecipientViewDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_composeRecipientViewDelegate, obj);
    [(MFMailComposeToField *)self->_toField setDelegate:obj];
    [(MFMailComposeRecipientTextView *)self->_ccField setDelegate:obj];
    [(MFMailComposeRecipientTextView *)self->_bccField setDelegate:obj];
  }
}

- (void)setToFieldDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toFieldDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_toFieldDelegate, obj);
    [(MFMailComposeToField *)self->_toField setToFieldDelegate:obj];
  }
}

- (BOOL)_presentsSearchResultsTableAsPopover
{
  v2 = [(MFMailComposeView *)self traitCollection];
  char v3 = objc_msgSend(v2, "mf_supportsPopoverPresentation");

  return v3;
}

- (CNAutocompleteResultsTableViewController)searchViewController
{
  searchViewController = self->_searchViewController;
  if (!searchViewController)
  {
    double v4 = (CNAutocompleteResultsTableViewController *)[objc_alloc(MEMORY[0x1E4F5A0F0]) initWithStyle:1];
    double v5 = self->_searchViewController;
    self->_searchViewController = v4;

    [(CNAutocompleteResultsTableViewController *)self->_searchViewController setDelegate:self];
    searchViewController = self->_searchViewController;
  }

  return searchViewController;
}

- (id)_searchResultsTable
{
  return (id)[(CNAutocompleteResultsTableViewController *)self->_searchViewController view];
}

- (id)_corecipientResultsTable
{
  return (id)[(CNAutocompleteResultsTableViewController *)self->_corecipientsSearchViewController view];
}

- (void)setDisplayMetrics:(id)a3
{
  double v5 = (MFComposeDisplayMetrics *)a3;
  if (self->_displayMetrics != v5)
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    [(MFMailComposeView *)self _displayMetricsDidChange];
  }
}

- (MFComposeImageSizeView)imageSizeField
{
  imageSizeField = self->_imageSizeField;
  if (!imageSizeField)
  {
    [(MFMailComposeView *)self _createImageSizeFieldIfNeededAndAddSubview:0];
    imageSizeField = self->_imageSizeField;
  }

  return imageSizeField;
}

- (MFMailComposeRecipientTextView)ccField
{
  ccField = self->_ccField;
  if (!ccField)
  {
    [(MFMailComposeView *)self _createCCAndBCCFieldIfNeededAndCompleteSetup:0];
    ccField = self->_ccField;
  }

  return ccField;
}

- (MFMailComposeRecipientTextView)bccField
{
  bccField = self->_bccField;
  if (!bccField)
  {
    [(MFMailComposeView *)self _createCCAndBCCFieldIfNeededAndCompleteSetup:0];
    bccField = self->_bccField;
  }

  return bccField;
}

- (void)_cancelAnimations
{
  id v3 = [MEMORY[0x1E4FB1430] sharedAnimator];
  [v3 removeAnimationsForTarget:self->_toField];
  [v3 removeAnimationsForTarget:self->_ccField];
  [v3 removeAnimationsForTarget:self->_subjectField];
  [v3 removeAnimationsForTarget:self->_headerView];
  [v3 removeAnimationsForTarget:self->_bodyScroller];
}

- (void)resetContentSize
{
  [(MFMailComposeView *)self bounds];
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[UIScrollView setContentSize:](self->_bodyScroller, "setContentSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  [(MFMailComposeView *)self bounds];
  double Width = CGRectGetWidth(v8);

  -[MFMailComposeView _setHeaderFrame:](self, "_setHeaderFrame:", v3, v4, Width, v5);
}

- (void)removeFromSuperview
{
  [(MFMailComposeView *)self _cancelAnimations];
  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeView;
  [(MFMailComposeView *)&v3 removeFromSuperview];
}

- (void)_collectKeyViews:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFMailComposeView;
  [(MFMailComposeView *)&v10 _collectKeyViews:v4];
  double v5 = [(CNComposeRecipientTextView *)self->_toField textView];
  if ([(MFMailComposeView *)self _presentsSearchResultsTableAsPopover]
    && [v5 isFirstResponder])
  {
    double v6 = self->_ccField;
    [(MFMailComposeRecipientTextView *)v6 alpha];
    if (v7 == 0.0)
    {
      BOOL v9 = 1;
    }
    else
    {
      CGRect v8 = [(MFMailComposeRecipientTextView *)v6 superview];
      BOOL v9 = v8 == 0;
    }
    if (v9 && !*MEMORY[0x1E4F5A0B8]) {
      objc_msgSend(v4, "insertObject:atIndex:", self->_ccField, objc_msgSend(v4, "indexOfObject:", v5) + 1);
    }
  }
}

- (void)composeHeaderViewClicked:(id)a3
{
  if (self->_multiField == a3) {
    [(MFMailComposeView *)self _multiFieldClicked];
  }
}

- (double)_verticalPadding
{
  [(MFMailComposeView *)self bounds];
  double v4 = v3;
  double v5 = [(MFMailComposeView *)self traitCollection];
  uint64_t v6 = [v5 verticalSizeClass];

  BOOL v7 = v4 <= 768.0 || v6 == 1;
  double result = 44.0;
  if (v7) {
    return 0.0;
  }
  return result;
}

- (void)_setShadowViewVisible:(BOOL)a3 frame:(CGRect)a4
{
  shadowView = self->_shadowView;
  if (a3)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    if (shadowView)
    {
      [(UIView *)shadowView setAlpha:1.0];
      -[UIView setFrame:](self->_shadowView, "setFrame:", x, y, width, height);
    }
    else
    {
      objc_super v10 = -[MFSearchShadowView initWithFrame:]([MFSearchShadowView alloc], "initWithFrame:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
      double v11 = self->_shadowView;
      self->_shadowView = &v10->super.super;

      [(UIView *)self->_shadowView setAutoresizingMask:2];
      [(UIView *)self->_shadowView setOpaque:0];
    }
    double v12 = [(UIView *)self->_shadowView superview];

    bodyScroller = self->_bodyScroller;
    double v14 = self->_shadowView;
    if (v12)
    {
      [(UIScrollView *)bodyScroller bringSubviewToFront:v14];
    }
    else
    {
      [(UIScrollView *)bodyScroller addSubview:v14];
    }
  }
  else
  {
    [(UIView *)shadowView removeFromSuperview];
  }
}

- (void)_layoutFindPanelHostView
{
  [(UIView *)self->_headerView frame];
  double v4 = v3 + self->_findPanelHeight;
  [(UIScrollView *)self->_bodyScroller bounds];
  double v6 = v5;
  [(UIScrollView *)self->_bodyScroller safeAreaInsets];
  double v8 = v6 + v7;
  [(UIScrollView *)self->_bodyScroller contentInset];
  double v10 = v9 - v4;
  if (v8 < v10) {
    double v8 = v10;
  }
  [(MFMailComposeView *)self bounds];
  findPanelHostView = self->_findPanelHostView;

  -[UIView setFrame:](findPanelHostView, "setFrame:", 0.0, v8);
}

- (void)_setupBodyFieldWithHeaderFrame:(double)a3 enclosingFrame:(double)a4 changingView:(double)a5 frameToPin:(uint64_t)a6 wasSearching:(void *)a7
{
  id v28 = a7;
  objc_msgSend((id)a1, "_updateTextViewHeightWithHeaderFrame:", a2, a3, a4, a5);
  [(id)a1 _adjustScrollerContentSize];
  [(id)a1 _layoutFindPanelHostView];
  [(id)a1 bounds];
  objc_msgSend(*(id *)(a1 + 504), "setFrame:");
  [*(id *)(a1 + 504) setScrollEnabled:1];
  if (v28)
  {
    v30.origin.double x = a13;
    v30.origin.double y = a14;
    v30.size.double width = a15;
    v30.size.double height = a16;
    double MaxY = CGRectGetMaxY(v30);
    [*(id *)(a1 + 504) contentOffset];
    double v25 = v24;
    if (a8)
    {
      double v26 = *(double *)(a1 + 712);
      [*(id *)(a1 + 504) frame];
      if (v26 >= MaxY - v27) {
        double v23 = v26;
      }
      else {
        double v23 = MaxY - v27;
      }
    }
    objc_msgSend(*(id *)(a1 + 504), "setContentOffset:", v25, v23);
  }
  [(id)a1 _revealSelectionIfNeededWithChangingView:v28];
}

- (MFComposeWebView)composeWebView
{
  return self->_webView;
}

- (void)_layoutSubviewsWithActiveRecipientView:(BOOL)a3 changingView:(id)a4 toSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  v131[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  [(MFMailComposeView *)self _cancelAnimations];
  [(UIScrollView *)self->_bodyScroller setScrollEnabled:0];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  v130[0] = *MEMORY[0x1E4F1DB28];
  v130[1] = v9;
  -[MFMailComposeView _layoutComposeHeaderViewsWithChangingHeader:toSize:withPinFrame:](self, "_layoutComposeHeaderViewsWithChangingHeader:toSize:withPinFrame:", v8, v130, width, height);
  [(MFMailComposeView *)self _heightForBottomView];
  double v11 = v10;
  [(MFMailComposeRecipientTextView *)self->_activeRecipientView frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(MFMailComposeView *)self frame];
  double v21 = v20;
  double v23 = v22;
  bodyScroller = self->_bodyScroller;
  double v25 = [(MFMailComposeRecipientTextView *)self->_activeRecipientView superview];
  -[UIScrollView convertRect:fromView:](bodyScroller, "convertRect:fromView:", v25, v13, v15, v17, v19);
  uint64_t v117 = v27;
  uint64_t v119 = v26;
  double rect = v28;
  double v30 = v29;

  [(MFMailComposeView *)self bounds];
  double v32 = v31;
  [(MFMailComposeView *)self _headerFrame];
  double v124 = v33;
  double v35 = v34;
  double v37 = v36;
  [(MFComposeSubjectView *)self->_subjectField frame];
  double MaxY = CGRectGetMaxY(v132);
  double v122 = v32 - v11;
  if ([(MFMailComposeView *)self _presentsSearchResultsTableAsPopover])
  {
    -[MFMailComposeView _setHeaderFrame:](self, "_setHeaderFrame:", v35, v37, v124, MaxY);
    double v39 = 0.0;
    if ((*((unsigned char *)self + 776) & 0x40) == 0)
    {
      +[CNComposeHeaderView preferredHeight];
      uint64_t v41 = (uint64_t)((v21 + v23 - (v30 + rect) - v11 + -20.0) / v40);
      if (v41 <= 3)
      {
        +[CNComposeHeaderView preferredHeight];
        [(CNComposeRecipientTextView *)self->_activeRecipientView textFieldOffsetForNumberOfRowsToScroll:4 - v41 numberOfRowsAboveField:(uint64_t)((v30 - v30) / v42)];
        double v39 = v43;
      }
    }
  }
  else
  {
    [(CNComposeRecipientTextView *)self->_activeRecipientView offsetForRowWithTextField];
    double v45 = v44;
    [MEMORY[0x1E4F5A130] separatorHeight];
    if (v30 + v45 - v37 <= ceil(v46)) {
      double v39 = 0.0;
    }
    else {
      double v39 = v30 + v45 - v37;
    }
    [(UIView *)self->_headerView frame];
    double v48 = v47;
    if (MaxY < v122 + v39) {
      double MaxY = v122 + v39;
    }
    -[MFMailComposeView _setHeaderFrame:](self, "_setHeaderFrame:", v35, v37, v124, MaxY);
    [(UIView *)self->_headerView frame];
    double v30 = v30 + v49 - v48;
  }
  -[MFMailComposeView _updateTextViewOriginWithHeaderFrame:](self, "_updateTextViewOriginWithHeaderFrame:", v35, v37, v124, MaxY, v117, v119);
  [(MFMailComposeView *)self _adjustScrollerContentSize];
  BOOL v50 = [(MFMailComposeView *)self isSearchResultsPopoverVisible];
  [(UIScrollView *)self->_bodyScroller _effectiveContentInset];
  double v52 = v51;
  double v53 = v39 - v51;
  double v54 = 0.0;
  if (![(MFMailComposeView *)self shouldScrollLastChangedRecipientViewToTop])
  {
    [(UIScrollView *)self->_bodyScroller contentOffset];
    char v56 = v53 == v55 || v50;
    if ((v56 & 1) == 0)
    {
      v57 = (void *)[objc_alloc(MEMORY[0x1E4FB1BC0]) initWithTarget:self->_bodyScroller];
      [(UIScrollView *)self->_bodyScroller contentOffset];
      objc_msgSend(v57, "setStartPoint:");
      objc_msgSend(v57, "setEndPoint:", 0.0, v39 - v52);
      v58 = [MEMORY[0x1E4FB1430] sharedAnimator];
      [v58 addAnimation:v57 withDuration:1 start:0.349999994];

      [(UIScrollView *)self->_bodyScroller contentOffset];
      double v60 = v59;

      double v54 = v53 - v60;
    }
  }
  v61 = [(MFMailComposeView *)self _searchResultsTable];
  [v61 frame];
  double v63 = v62;
  double v65 = v64;
  double v67 = v66;
  if ([(MFMailComposeView *)self _presentsSearchResultsTableAsPopover])
  {
    double v124 = v67;
    double v35 = v63;
  }
  else
  {
    v133.size.double width = v118;
    v133.origin.double x = v120;
    v133.origin.double y = v30;
    v133.size.double height = rect;
    CGRectGetMaxY(v133);
    +[CNComposeHeaderView separatorHeight];
    UIRoundToViewScale();
    double v65 = v68;
    BOOL v69 = [(MFMailComposeView *)self shouldScrollLastChangedRecipientViewToTop];
    double v70 = MaxY + v30;
    if (!v69) {
      double v70 = 0.0;
    }
    double v71 = v122;
    if (v122 >= MaxY) {
      double v71 = MaxY;
    }
    objc_msgSend(v61, "setFrame:", v35, v65, v124, v71 - (v65 - v53) + v70);
    +[MFSearchShadowView defaultHeight];
    -[UIView setFrame:](self->_shadowView, "setFrame:", v35, v65, v124, v72);
  }
  if (![(MFMailComposeView *)self _presentsSearchResultsTableAsPopover])
  {
    v75 = [v61 superview];
    BOOL v76 = v75 == 0;

    if (!v76) {
      goto LABEL_46;
    }
    goto LABEL_31;
  }
  if (*((char *)self + 776) < 0) {
    goto LABEL_46;
  }
  v73 = [(MFMailComposeView *)self toField];
  if (([v73 isFirstResponder] & 1) == 0)
  {
    v74 = [(MFMailComposeView *)self ccField];
    if (![v74 isFirstResponder])
    {
      v115 = [(MFMailComposeView *)self bccField];
      char v116 = [v115 isFirstResponder];

      if ((v116 & 1) == 0) {
        goto LABEL_46;
      }
      goto LABEL_31;
    }
  }
LABEL_31:
  v77 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  if ([(MFMailComposeView *)self _presentsSearchResultsTableAsPopover])
  {
    uint64_t v78 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];

    v77 = (void *)v78;
  }
  v79 = [(MFMailComposeView *)self searchViewController];
  v80 = [v79 view];
  [v80 setBackgroundColor:v77];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_popoverOwner);
  if ([(MFMailComposeView *)self _presentsSearchResultsTableAsPopover])
  {
    if (WeakRetained) {
      char v82 = v50;
    }
    else {
      char v82 = 1;
    }
    if ((v82 & 1) == 0)
    {
      v83 = [(MFMailComposeView *)self searchViewController];
      v84 = [(MFMailComposeRecipientTextView *)self->_activeRecipientView navTitle];
      [v83 setTitle:v84];

      v131[0] = self->_activeRecipientView;
      v85 = [MEMORY[0x1E4FB18E0] activeKeyboard];
      v131[1] = v85;
      v123 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:2];

      id v86 = objc_alloc(MEMORY[0x1E4FB19E8]);
      v87 = [(MFMailComposeView *)self searchViewController];
      v88 = (void *)[v86 initWithRootViewController:v87];

      v125 = [(CNComposeRecipientTextView *)self->_activeRecipientView textView];
      v89 = [v125 selectedTextRange];
      v90 = [v89 end];
      [v125 caretRectForPosition:v90];
      double v92 = v91;
      double v94 = v93;
      double v96 = v95;
      double v98 = v97;

      -[MFMailComposeView convertRect:fromView:](self, "convertRect:fromView:", v125, v92, v94, v96, v98);
      double v100 = v99;
      double v102 = v101;
      double v104 = v103;
      double v106 = v105;
      [v88 setModalPresentationStyle:7];
      id obj = 0;
      [v88 setModalPresentationStyle:7];
      v107 = [v88 popoverPresentationController];
      [v107 setSourceView:self];
      objc_msgSend(v107, "setSourceRect:", v100, v102 + v106 - v54, v104, v106);
      [v107 setPermittedArrowDirections:1];
      [v107 _setShouldDisableInteractionDuringTransitions:0];
      v108 = objc_msgSend(WeakRetained, "pep_getInvocation:", &obj);
      v126[0] = MEMORY[0x1E4F143A8];
      v126[1] = 3221225472;
      v126[2] = __80__MFMailComposeView__layoutSubviewsWithActiveRecipientView_changingView_toSize___block_invoke;
      v126[3] = &unk_1E5F79038;
      id v109 = v107;
      id v127 = v109;
      id v110 = v123;
      id v128 = v110;
      [v108 presentViewController:v88 animated:1 completion:v126];

      [(MFMailComposeView *)self _cancelDelayedPopover];
      if (v54 == 0.0)
      {
        [obj invoke];
      }
      else
      {
        [obj retainArguments];
        objc_storeStrong((id *)&self->_delayedPopoverInvocation, obj);
        UIAnimationDragCoefficient();
        [(MFMailComposeView *)self performSelector:sel__presentDelayedPopover withObject:0 afterDelay:(float)(v111 * 0.35)];
      }
    }
  }
  else
  {
    v112 = self->_bodyScroller;
    v113 = [(MFMailComposeView *)self _searchResultsTable];
    [(UIScrollView *)v112 addSubview:v113];

    +[MFSearchShadowView defaultHeight];
    -[MFMailComposeView _setShadowViewVisible:frame:](self, "_setShadowViewVisible:frame:", 1, v35, v65, v124, v114);
  }

LABEL_46:
}

uint64_t __80__MFMailComposeView__layoutSubviewsWithActiveRecipientView_changingView_toSize___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPassthroughViews:*(void *)(a1 + 40)];
}

- (BOOL)isSearchResultsPopoverVisible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popoverOwner);
  BOOL v4 = [(MFMailComposeView *)self _presentsSearchResultsTableAsPopover];
  if (WeakRetained) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    double v6 = [WeakRetained presentedViewController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v6 isBeingDismissed] & 1) == 0)
    {
      id v8 = [v6 viewControllers];
      if ([v8 count])
      {
        long long v9 = [v8 objectAtIndex:0];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
      }
      else
      {
        char isKindOfClass = 0;
      }
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_userInterfaceConfigurationSupportsCorecipientsTableView
{
  [(MFMailComposeView *)self bounds];
  double v4 = v3;
  [(MFMailComposeView *)self _heightForBottomView];
  double v6 = v5;
  double v7 = [(MFMailComposeView *)self traitCollection];
  uint64_t v8 = [v7 horizontalSizeClass];

  return v4 - v6 > 300.0 && v8 == 1;
}

- (BOOL)_shouldShowCorecipientsTableView
{
  if (![(MFMailComposeView *)self _userInterfaceConfigurationSupportsCorecipientsTableView]|| ![(CNComposeRecipientTextView *)self->_toField isFirstResponder])
  {
    return 0;
  }
  double v3 = [(CNAutocompleteResultsTableViewController *)self->_corecipientsSearchViewController recipients];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)_setCorecipientsTableViewVisible:(BOOL)a3 withFieldFrame:(CGRect)a4
{
  if (a3)
  {
    double width = a4.size.width;
    double y = a4.origin.y;
    double v7 = [(MFMailComposeView *)self _corecipientResultsTable];
    [v7 setHidden:0];
    uint64_t v8 = [(MFMailComposeView *)self _corecipientResultsTable];
    long long v9 = [v8 superview];

    if (!v9) {
      [(UIView *)self->_headerView insertSubview:v7 belowSubview:self->_ccField];
    }
    +[CNComposeHeaderView separatorHeight];
    double v11 = v10;
    [v7 frame];
    uint64_t v13 = v12;
    [(MFMailComposeView *)self bounds];
    double v15 = v14;
    +[MFSearchShadowView defaultHeight];
    double v16 = y + v11 * -3.0;
    -[MFMailComposeView _setShadowViewVisible:frame:](self, "_setShadowViewVisible:frame:", 1, 0.0, v16, width, v17);
    [v7 frame];
    if (CGRectIsEmpty(v37))
    {
      double v18 = (void *)MEMORY[0x1E4FB1EB0];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __69__MFMailComposeView__setCorecipientsTableViewVisible_withFieldFrame___block_invoke;
      v31[3] = &unk_1E5F7C2C8;
      id v32 = v7;
      uint64_t v33 = 0;
      double v34 = v16;
      double v35 = v15;
      uint64_t v36 = v13;
      [v18 performWithoutAnimation:v31];
    }
    [v7 contentSize];
    CGFloat v20 = v19 + -2.0;
    objc_msgSend(v7, "setFrame:", 0.0, v16, v15, v19 + -2.0);
    [v7 setScrollEnabled:0];
    v38.origin.double x = 0.0;
    v38.origin.double y = v16;
    v38.size.double width = v15;
    v38.size.double height = v20;
    double MaxY = CGRectGetMaxY(v38);
    if (!self->_corecipientsSearchTableViewSeparator)
    {
      id v22 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      double v23 = (UIView *)objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      corecipientsSearchTableViewSeparator = self->_corecipientsSearchTableViewSeparator;
      self->_corecipientsSearchTableViewSeparator = v23;

      double v25 = self->_corecipientsSearchTableViewSeparator;
      uint64_t v26 = [MEMORY[0x1E4F5A130] defaultSeparatorColor];
      [(UIView *)v25 setBackgroundColor:v26];
    }
    [MEMORY[0x1E4F5A130] separatorHeight];
    -[UIView setFrame:](self->_corecipientsSearchTableViewSeparator, "setFrame:", 0.0, MaxY, width, v27);
    [(UIView *)self->_headerView addSubview:self->_corecipientsSearchTableViewSeparator];

    char v28 = 32;
  }
  else
  {
    if ((*((unsigned char *)self + 777) & 0x20) != 0)
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __69__MFMailComposeView__setCorecipientsTableViewVisible_withFieldFrame___block_invoke_2;
      v30[3] = &unk_1E5F79088;
      v30[4] = self;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __69__MFMailComposeView__setCorecipientsTableViewVisible_withFieldFrame___block_invoke_3;
      v29[3] = &unk_1E5F7A210;
      v29[4] = self;
      objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:animations:completion:", v30, v29, 0.8, a4.origin.y, a4.size.width, a4.size.height);
    }
    char v28 = 0;
  }
  *((unsigned char *)self + 777) = *((unsigned char *)self + 777) & 0xDF | v28;
}

uint64_t __69__MFMailComposeView__setCorecipientsTableViewVisible_withFieldFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __69__MFMailComposeView__setCorecipientsTableViewVisible_withFieldFrame___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 704) setAlpha:0.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 528);

  return [v2 setAlpha:0.0];
}

void __69__MFMailComposeView__setCorecipientsTableViewVisible_withFieldFrame___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setShadowViewVisible:frame:", 0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    double v3 = [*(id *)(a1 + 32) _corecipientResultsTable];
    [v3 setHidden:1];

    [*(id *)(*(void *)(a1 + 32) + 704) removeFromSuperview];
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = *(void **)(v4 + 704);
    *(void *)(v4 + 704) = 0;
  }
}

- (void)_layoutSubviews:(BOOL)a3 changingView:(id)a4 toSize:(CGSize)a5
{
}

- (void)_layoutComposeHeaderViewsWithChangingHeader:(id)a3 toSize:(CGSize)a4 withPinFrame:(CGRect *)a5
{
  CGFloat height = a4.height;
  double width = a4.width;
  double v19 = (MFMailComposeToField *)a3;
  [(MFMailComposeView *)self bounds];
  CGFloat v10 = v9;
  [MEMORY[0x1E4F5A130] separatorHeight];
  v20.double x = 0.0;
  v20.double y = ceil(v11);
  v21.double width = v10;
  [(id)objc_opt_class() preferredHeaderHeight];
  v21.CGFloat height = v12;
  _layoutField(self->_toField, v19, &v20.x, width, height);
  if (self->_toField == v19)
  {
    CGSize v13 = v21;
    a5->origin = v20;
    a5->size = v13;
  }
  BOOL v14 = [(MFMailComposeView *)self _shouldShowCorecipientsTableView];
  -[MFMailComposeView _setCorecipientsTableViewVisible:withFieldFrame:](self, "_setCorecipientsTableViewVisible:withFieldFrame:", v14, v20, v21);
  if (v14)
  {
    double v15 = [(MFMailComposeView *)self _corecipientResultsTable];
    [v15 frame];
    v20.double y = CGRectGetMaxY(v23);
  }
  _layoutField(self->_ccField, v19, &v20.x, width, height);
  _layoutField(self->_bccField, v19, &v20.x, width, height);
  [(MFMailComposeView *)self _updateFromField];
  _layoutField(self->_fromField, v19, &v20.x, width, height);
  double v16 = [(MFMailComposeView *)self traitCollection];
  uint64_t v17 = [v16 horizontalSizeClass];

  if (v17 == 2) {
    _layoutField(self->_imageSizeField, v19, &v20.x, width, height);
  }
  [(MFMailComposeView *)self _updateMultiField];
  _layoutField(self->_multiField, v19, &v20.x, width, height);
  if (self->_toField != v19)
  {
    CGSize v18 = v21;
    a5->origin = v20;
    a5->size = v18;
  }
  _layoutField(self->_subjectField, v19, &v20.x, width, height);
  _layoutField(self->_webContentVariationField, v19, &v20.x, width, height);
}

- (void)_layoutSubviews:(BOOL)a3 changingView:(id)a4 toSize:(CGSize)a5 searchResultsWereDismissed:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.height;
  double width = a5.width;
  id v11 = a4;
  uint64_t v12 = a3 & (*((unsigned __int8 *)self + 777) >> 4);
  if (!self->_activeRecipientView
    || [(MFMailComposeView *)self _presentsSearchResultsTableAsPopover] && v6)
  {
    [(MFMailComposeView *)self _frameForContentView];
    -[UIView setFrame:](self->_contentView, "setFrame:");
    if ([(MFMailComposeView *)self _presentsSearchResultsTableAsPopover])
    {
      if (!v6)
      {
        [(MFMailComposeView *)self _cancelDelayedPopover];
        if ([(MFMailComposeView *)self isSearchResultsPopoverVisible])
        {
          uint64_t v13 = [(UIScrollView *)self->_bodyScroller mf_needsToAdjustContentOffset] ^ 1;
          id WeakRetained = objc_loadWeakRetained((id *)&self->_popoverOwner);
          [WeakRetained dismissViewControllerAnimated:v13 completion:0];
        }
      }
    }
    else
    {
      double v15 = [(MFMailComposeView *)self _searchResultsTable];
      double v16 = [v15 superview];

      if (v16)
      {
        uint64_t v17 = [(MFMailComposeView *)self _searchResultsTable];
        [v17 removeFromSuperview];

        -[MFMailComposeView _setShadowViewVisible:frame:](self, "_setShadowViewVisible:frame:", 0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
        char v18 = 1;
LABEL_10:
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __84__MFMailComposeView__layoutSubviews_changingView_toSize_searchResultsWereDismissed___block_invoke_2;
        aBlock[3] = &unk_1E5F7C318;
        aBlock[4] = self;
        v29[0] = v11;
        *(double *)&v29[1] = width;
        *(double *)&v29[2] = height;
        char v30 = v18;
        double v19 = _Block_copy(aBlock);
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __84__MFMailComposeView__layoutSubviews_changingView_toSize_searchResultsWereDismissed___block_invoke_3;
        v27[3] = &unk_1E5F7A210;
        v27[4] = self;
        CGPoint v20 = _Block_copy(v27);
        CGSize v21 = (void *)MEMORY[0x1E4FB1EB0];
        if (v12)
        {
          [MEMORY[0x1E4FB1EB0] animateWithDuration:6 delay:v19 options:v20 animations:0.2 completion:0.0];
        }
        else
        {
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __84__MFMailComposeView__layoutSubviews_changingView_toSize_searchResultsWereDismissed___block_invoke_4;
          v24[3] = &unk_1E5F7C340;
          id v25 = v19;
          id v26 = v20;
          [v21 performWithoutAnimation:v24];
        }
        id v22 = (id *)v29;

        goto LABEL_14;
      }
    }
    char v18 = 0;
    goto LABEL_10;
  }
  if (![(MFMailComposeView *)self shouldScrollLastChangedRecipientViewToTop])
  {
    -[MFMailComposeView _layoutSubviewsWithActiveRecipientView:changingView:toSize:](self, "_layoutSubviewsWithActiveRecipientView:changingView:toSize:", v12, v11, width, height);
    goto LABEL_15;
  }
  lastChangedRecipientView = self->_lastChangedRecipientView;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __84__MFMailComposeView__layoutSubviews_changingView_toSize_searchResultsWereDismissed___block_invoke;
  v31[3] = &unk_1E5F7C2F0;
  void v31[4] = self;
  char v33 = v12;
  v32[0] = v11;
  *(double *)&v32[1] = width;
  *(double *)&v32[2] = height;
  [(MFMailComposeView *)self scrollToRecipientTextView:lastChangedRecipientView animated:1 completion:v31];
  id v22 = (id *)v32;
LABEL_14:

LABEL_15:
}

uint64_t __84__MFMailComposeView__layoutSubviews_changingView_toSize_searchResultsWereDismissed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutSubviewsWithActiveRecipientView:changingView:toSize:", *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void __84__MFMailComposeView__layoutSubviews_changingView_toSize_searchResultsWereDismissed___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelAnimations];
  [(id)objc_opt_class() preferredHeaderHeight];
  [*(id *)(a1 + 32) bounds];
  double v3 = v2;
  double v5 = v4;
  double v38 = v6;
  double v8 = v7;
  double v9 = [*(id *)(*(void *)(a1 + 32) + 536) labelView];
  [v9 frame];
  double v11 = v10;
  uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 536) labelView];
  [v12 baselinePoint];
  double v14 = v13;
  double v15 = [*(id *)(*(void *)(a1 + 32) + 536) baseFont];
  [v15 capHeight];
  double v17 = v16;

  [*(id *)(a1 + 32) _verticalPadding];
  double v19 = v18;
  [*(id *)(a1 + 32) _headerViewOriginWithScrollViewOffsetCalculation];
  double v37 = v20;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 784));
  int v22 = [WeakRetained canShowImageSizeField];
  uint64_t v23 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v23 + 777) & 8) != 0)
  {
    int v24 = v22;
    int v25 = [WeakRetained canShowFromField];
    [*(id *)(*(void *)(a1 + 32) + 600) setAlpha:0.0];
    [*(id *)(*(void *)(a1 + 32) + 544) setAlpha:1.0];
    [*(id *)(*(void *)(a1 + 32) + 552) setAlpha:1.0];
    if (v25) {
      [*(id *)(*(void *)(a1 + 32) + 592) setAlpha:1.0];
    }
    id v26 = *(id **)(a1 + 32);
    double v27 = 0.0;
    if (v24)
    {
      objc_msgSend(v26, "_createImageSizeFieldIfNeededAndAddSubview:", 1, 0.0);
      id v26 = *(id **)(a1 + 32);
      double v27 = 1.0;
    }
    [v26[76] setAlpha:v27];
  }
  else
  {
    [*(id *)(v23 + 600) setAlpha:1.0];
    [*(id *)(*(void *)(a1 + 32) + 544) setAlpha:0.0];
    [*(id *)(*(void *)(a1 + 32) + 552) setAlpha:0.0];
    [*(id *)(*(void *)(a1 + 32) + 592) setAlpha:0.0];
    [*(id *)(*(void *)(a1 + 32) + 608) setAlpha:0.0];
  }
  uint64_t v28 = 584;
  [*(id *)(*(void *)(a1 + 32) + 584) setAllowsNotifyOption:1];
  if ([WeakRetained canShowContentVariationPicker]
    && [MEMORY[0x1E4F602E0] preferenceEnabled:5])
  {
    double v29 = v5;
    double v30 = v3;
    uint64_t v28 = 616;
    [*(id *)(*(void *)(a1 + 32) + 616) setAlpha:1.0];
  }
  else
  {
    double v29 = v5;
    double v30 = v3;
    [*(id *)(*(void *)(a1 + 32) + 616) setAlpha:0.0];
  }
  id v31 = *(id *)(*(void *)(a1 + 32) + v28);
  long long v32 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v39 = *MEMORY[0x1E4F1DB28];
  long long v40 = v32;
  objc_msgSend(*(id *)(a1 + 32), "_layoutComposeHeaderViewsWithChangingHeader:toSize:withPinFrame:", *(void *)(a1 + 40), &v39, *(double *)(a1 + 48), *(double *)(a1 + 56));
  [v31 frame];
  double MaxY = CGRectGetMaxY(v41);
  double v34 = fmax(round(v19 - (v11 + v14 - v17)), 0.0);
  objc_msgSend(*(id *)(a1 + 32), "_setHeaderFrame:", v37, v34, v38, MaxY);
  double v35 = [*(id *)(a1 + 32) traitCollection];
  if ([v35 horizontalSizeClass] == 1)
  {
    if ([*(id *)(a1 + 32) isChangingRecipients])
    {

LABEL_17:
      [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:0];
      goto LABEL_18;
    }
    int v36 = *(unsigned __int8 *)(a1 + 64);

    if (v36) {
      goto LABEL_17;
    }
  }
  else
  {
  }
LABEL_18:
  objc_msgSend(*(id *)(a1 + 32), "_setupBodyFieldWithHeaderFrame:enclosingFrame:changingView:frameToPin:wasSearching:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), v37, v34, v38, MaxY, v30, v29, v38, v8, v39, v40);
  if (([*(id *)(a1 + 32) _presentsSearchResultsTableAsPopover] & 1) == 0
    && (([*(id *)(a1 + 32) isChangingRecipients] & 1) != 0 || *(unsigned char *)(a1 + 64)))
  {
    [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:1];
  }
}

void __84__MFMailComposeView__layoutSubviews_changingView_toSize_searchResultsWereDismissed___block_invoke_3(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) composeWebView];
  int v3 = [v2 isFirstResponder];

  if (v3)
  {
    double v4 = *(void **)(a1 + 32);
    [v4 _revealSelection];
  }
}

uint64_t __84__MFMailComposeView__layoutSubviews_changingView_toSize_searchResultsWereDismissed___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)_layoutSubviews:(BOOL)a3
{
}

- (void)toggleImageSizeFieldIfNecessary
{
  int v3 = [(MFMailComposeView *)self traitCollection];
  uint64_t v4 = [v3 horizontalSizeClass];

  if (v4 == 2)
  {
    [(MFMailComposeView *)self _beginBlockingBodyScroll];
    [(MFMailComposeView *)self _layoutSubviews:1];
    [(MFMailComposeView *)self _endBlockingBodyScroll];
  }
}

- (void)setAutoresizingMask:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFMailComposeView;
  -[MFMailComposeView setAutoresizingMask:](&v5, sel_setAutoresizingMask_);
  [(UIView *)self->_contentView setAutoresizingMask:a3];
}

- (BOOL)endEditing:(BOOL)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = [(MFMailComposeView *)self subjectField];
  LOBYTE(v3) = [v4 endEditing:v3];

  return v3;
}

- (void)setRecipientFieldsEditable:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[CNComposeRecipientTextView setEditable:animated:](self->_toField, "setEditable:animated:");
  [(CNComposeRecipientTextView *)self->_ccField setEditable:v5 animated:v4];
  bccField = self->_bccField;

  [(CNComposeRecipientTextView *)bccField setEditable:v5 animated:v4];
}

- (BOOL)isLoading
{
  return (*((unsigned __int8 *)self + 776) >> 1) & 1;
}

- (void)setLoading:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  *((unsigned char *)self + 776) = *((unsigned char *)self + 776) & 0xFD | v5;
  loadingView = self->_loadingView;
  if (a3)
  {
    if (!loadingView)
    {
      double v7 = [MFMessageContentLoadingView alloc];
      double v8 = -[MFMessageContentLoadingView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v9 = self->_loadingView;
      self->_loadingView = v8;
    }
    double v10 = [(MFMailComposeView *)self bodyScroller];
    [v10 resignFirstResponder];

    double v11 = [(MFMailComposeView *)self bodyScroller];
    [v11 addSubview:self->_loadingView];

    [(MFMailComposeView *)self _layoutLoadingView];
    [(MFMessageContentLoadingView *)self->_loadingView setLoadingIndicatorVisible:1 animated:1];
  }
  else
  {
    uint64_t v12 = [(MFMessageContentLoadingView *)loadingView superview];

    if (v12) {
      [(MFMessageContentLoadingView *)self->_loadingView removeFromSuperview];
    }
  }
  webView = self->_webView;

  [(MFComposeWebView *)webView _setEditable:!v3];
}

- (BOOL)isSending
{
  return (*((unsigned __int8 *)self + 776) >> 2) & 1;
}

- (void)setSending:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 776);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 4;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 776) = v3 & 0xFB | v4;
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MFMailComposeView;
  -[UITransitionView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  char v5 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
  double v6 = v5;
  if ((*((unsigned char *)self + 776) & 2) != 0 && v5 == self->_bodyScroller) {
    double v7 = 0;
  }
  else {
    double v7 = v5;
  }

  return v7;
}

- (void)searchResultsPopoverWasDismissed
{
  -[MFMailComposeView _layoutSubviews:changingView:toSize:searchResultsWereDismissed:](self, "_layoutSubviews:changingView:toSize:searchResultsWereDismissed:", 1, 0, 1, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  activeRecipientView = self->_activeRecipientView;
  if (activeRecipientView)
  {
    if ([(CNComposeRecipientTextView *)activeRecipientView didIgnoreFirstResponderResign])
    {
      [(CNComposeRecipientTextView *)self->_activeRecipientView becomeFirstResponder];
    }
    char v4 = self->_activeRecipientView;
    [(MFMailComposeView *)self clearSearchForRecipientView:v4 reflow:0 clear:0];
  }
}

- (BOOL)isForEditing
{
  return *((unsigned char *)self + 777) & 1;
}

- (void)setIsForEditing:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 777);
  if (a3)
  {
    *((unsigned char *)self + 777) = v3 | 1;
    char v4 = *((unsigned char *)self + 777) & 0xFD;
  }
  else
  {
    *((unsigned char *)self + 777) = v3 & 0xFE;
    char v4 = *((unsigned char *)self + 777) | 2;
  }
  *((unsigned char *)self + 777) = v4;
  [(MFMailComposeView *)self _adjustScrollerContentSize];
}

- (void)setAnimationDisabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 777) = *((unsigned char *)self + 777) & 0xFD | v3;
}

- (BOOL)isAnimationDisabled
{
  return (*((unsigned __int8 *)self + 777) >> 1) & 1;
}

- (void)setChangingRecipients:(BOOL)a3
{
  *((unsigned char *)self + 776) = *((unsigned char *)self + 776) & 0xFE | a3;
}

- (BOOL)isChangingRecipients
{
  return *((unsigned char *)self + 776) & 1;
}

- (void)setShowingPeoplePicker:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 776) = *((unsigned char *)self + 776) & 0xF7 | v3;
}

- (BOOL)isShowingPeoplePicker
{
  return (*((unsigned __int8 *)self + 776) >> 3) & 1;
}

- (void)setLoadingFromAddress:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 776);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    BOOL v4 = a3;
    if (a3) {
      char v6 = 16;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 776) = v3 & 0xEF | v6;
    if (a3)
    {
      [(CNComposeRecipientTextView *)self->_toField setEnabled:0];
      [(CNComposeRecipientTextView *)self->_ccField setEnabled:0];
      BOOL v7 = 0;
    }
    else
    {
      [(CNComposeRecipientTextView *)self->_toField setEnabled:(*((unsigned char *)self + 776) & 0x20) == 0];
      [(CNComposeRecipientTextView *)self->_ccField setEnabled:(*((unsigned char *)self + 776) & 0x20) == 0];
      BOOL v7 = (*((unsigned char *)self + 776) & 0x20) == 0;
    }
    [(CNComposeRecipientTextView *)self->_bccField setEnabled:v7];
    id v8 = [(MFMailComposeView *)self fromField];
    [v8 showLoadingState:v4];

    id v9 = [(MFMailComposeView *)self multiField];
    [v9 showLoadingState:v4];
  }
}

- (BOOL)isLoadingFromAddress
{
  return (*((unsigned __int8 *)self + 776) >> 4) & 1;
}

- (void)setReplyToHME:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 776);
  if (((((v3 & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 32;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 776) = v3 & 0xDF | v5;
    BOOL v6 = !a3;
    [(CNComposeRecipientTextView *)self->_toField setEnabled:v6];
    [(CNComposeRecipientTextView *)self->_ccField setEnabled:v6];
    [(CNComposeRecipientTextView *)self->_bccField setEnabled:v6];
    [(MFComposeFromView *)self->_fromField setUserInteractionEnabled:v6];
    BOOL v7 = (*((unsigned char *)self + 776) & 0x20) == 0;
    multiField = self->_multiField;
    [(MFComposeMultiView *)multiField setUserInteractionEnabled:v7];
  }
}

- (BOOL)isReplyToHME
{
  return (*((unsigned __int8 *)self + 776) >> 5) & 1;
}

- (void)setQuickReply:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 777);
  if (((((v3 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    BOOL v4 = a3;
    if (a3) {
      char v6 = 64;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 777) = v3 & 0xBF | v6;
    -[MFMailComposeToField setHidden:](self->_toField, "setHidden:");
    [(MFMailComposeRecipientTextView *)self->_ccField setHidden:v4];
    [(MFMailComposeRecipientTextView *)self->_bccField setHidden:v4];
    [(MFComposeFromView *)self->_fromField setHidden:v4];
    [(MFComposeMultiView *)self->_multiField setHidden:v4];
    webView = self->_webView;
    [(MFComposeWebView *)webView setIsQuickReply:v4];
  }
}

- (BOOL)isQuickReply
{
  return (*((unsigned __int8 *)self + 777) >> 6) & 1;
}

- (void)_createCCAndBCCFieldIfNeededAndCompleteSetup:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_ccField)
  {
    if (!a3) {
      return;
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_composeRecipientViewDelegate);
    [(MFMailComposeView *)self frame];
    double v6 = v5;
    [(id)objc_opt_class() preferredHeaderHeight];
    double v8 = v7;
    id v9 = -[CNComposeRecipientTextView initWithFrame:dragDropDelegate:]([MFMailComposeRecipientTextView alloc], "initWithFrame:dragDropDelegate:", self, 0.0, 0.0, v6, v7);
    ccField = self->_ccField;
    self->_ccField = v9;

    [(MFMailComposeRecipientTextView *)self->_ccField setAccessibilityIdentifier:*MEMORY[0x1E4F73B98]];
    [(MFMailComposeRecipientTextView *)self->_ccField setDelegate:WeakRetained];
    double v11 = -[CNComposeRecipientTextView initWithFrame:dragDropDelegate:]([MFMailComposeRecipientTextView alloc], "initWithFrame:dragDropDelegate:", self, 0.0, 0.0, v6, v8);
    bccField = self->_bccField;
    self->_bccField = v11;

    [(MFMailComposeRecipientTextView *)self->_bccField setAccessibilityIdentifier:*MEMORY[0x1E4F73B88]];
    [(MFMailComposeRecipientTextView *)self->_bccField setDelegate:WeakRetained];

    if (!v3) {
      return;
    }
  }
  if (!self->_completedCCAndBCCFieldSetup)
  {
    self->_completedCCAndBCCFieldSetup = 1;
    double v13 = self->_ccField;
    id v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v14 = [v22 localizedStringForKey:@"CC" value:&stru_1F0817A00 table:@"Main"];
    double v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v16 = [v15 localizedStringForKey:@"Cc:" value:&stru_1F0817A00 table:@"Main"];
    [(MFMailComposeView *)self _setupField:v13 withLabel:v14 navTitle:v16];

    double v17 = self->_bccField;
    id v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v18 = [v23 localizedStringForKey:@"BCC" value:&stru_1F0817A00 table:@"Main"];
    double v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v20 = [v19 localizedStringForKey:@"Bcc:" value:&stru_1F0817A00 table:@"Main"];
    [(MFMailComposeView *)self _setupField:v17 withLabel:v18 navTitle:v20];
  }
}

- (void)_createImageSizeFieldIfNeededAndAddSubview:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_imageSizeField)
  {
    if (!a3) {
      return;
    }
  }
  else
  {
    [(MFMailComposeView *)self frame];
    double v6 = v5;
    [(id)objc_opt_class() preferredHeaderHeight];
    double v8 = -[MFComposeImageSizeView initWithFrame:]([MFComposeImageSizeView alloc], "initWithFrame:", 0.0, 0.0, v6, v7);
    imageSizeField = self->_imageSizeField;
    self->_imageSizeField = v8;

    [(MFComposeImageSizeView *)self->_imageSizeField setAutoresizingMask:2];
    [(MFComposeImageSizeView *)self->_imageSizeField setAccessibilityIdentifier:*MEMORY[0x1E4F73BE8]];
    if (!v3) {
      return;
    }
  }
  double v10 = [(MFComposeImageSizeView *)self->_imageSizeField superview];

  if (!v10)
  {
    headerView = self->_headerView;
    uint64_t v12 = self->_imageSizeField;
    [(UIView *)headerView addSubview:v12];
  }
}

- (void)_multiFieldClicked
{
  [(MFMailComposeView *)self _createCCAndBCCFieldIfNeededAndCompleteSetup:1];
  ccField = self->_ccField;

  [(CNComposeRecipientTextView *)ccField becomeFirstResponder];
}

- (void)_setupField:(id)a3 withLabel:(id)a4 navTitle:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  [v11 setAutoresizingMask:2];
  [v11 setLabel:v8];
  [v11 setNavTitle:v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeRecipientViewDelegate);
  [v11 setDelegate:WeakRetained];

  [v11 setIndicatesUnsafeRecipientsWhenCollapsed:1];
  [(MFMailComposeView *)self _addHoverEffectToField:v11];
  [(UIView *)self->_headerView addSubview:v11];
}

- (void)_updateFromField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  if ([WeakRetained canShowFromField] && (*((unsigned char *)self + 776) & 4) == 0)
  {
    BOOL v3 = [WeakRetained sendingEmailAddressIfExists];
    if (v3 && [WeakRetained isAddressHideMyEmail:v3])
    {
      [(MFComposeFromView *)self->_fromField setSelectedAddressToHME:v3];
    }
    else
    {
      id v4 = v3;
      double v5 = [v4 emailAddressValue];
      double v6 = [v5 simpleAddress];
      double v7 = v6;
      if (v6)
      {
        id v8 = v6;
      }
      else
      {
        id v8 = [v4 stringValue];
      }
      id v9 = v8;

      [(MFComposeFromView *)self->_fromField setSelectedAddress:v9];
    }
  }
}

- (void)_updateMultiField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  int v4 = [WeakRetained canShowFromField];
  double v5 = self->_ccField;
  [(MFMailComposeRecipientTextView *)v5 alpha];
  if (v6 == 0.0)
  {
    BOOL v8 = 0;
  }
  else
  {
    double v7 = [(MFMailComposeRecipientTextView *)v5 superview];
    BOOL v8 = v7 != 0;
  }
  id v9 = self->_bccField;
  [(MFMailComposeRecipientTextView *)v9 alpha];
  if (v10 == 0.0)
  {
    BOOL v12 = 0;
  }
  else
  {
    id v11 = [(MFMailComposeRecipientTextView *)v9 superview];
    BOOL v12 = v11 != 0;
  }
  double v13 = self->_fromField;
  [(MFComposeFromView *)v13 alpha];
  if (v14 == 0.0)
  {
    BOOL v16 = 0;
  }
  else
  {
    double v15 = [(MFComposeFromView *)v13 superview];
    BOOL v16 = v15 != 0;
  }
  int v17 = v4 ^ 1;
  if (!v8 && !v12 && !v16 && (v17 & 1) == 0)
  {
    double v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v31 = [v18 localizedStringForKey:@"CC/BCC/FROM" value:&stru_1F0817A00 table:@"Main"];
    goto LABEL_23;
  }
  if (!v8 && !v12)
  {
    double v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v31 = [v19 localizedStringForKey:@"CC/BCC" value:&stru_1F0817A00 table:@"Main"];

    if (v4)
    {
      double v20 = 0;
      goto LABEL_36;
    }
    goto LABEL_26;
  }
  if ((((v16 || v12) | v17) & 1) == 0)
  {
    double v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v31 = [v18 localizedStringForKey:@"BCC/FROM" value:&stru_1F0817A00 table:@"Main"];
    goto LABEL_23;
  }
  if ((((v16 || v8) | v17) & 1) == 0)
  {
    double v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v31 = [v18 localizedStringForKey:@"CC/FROM" value:&stru_1F0817A00 table:@"Main"];
LABEL_23:

    if (v4) {
      goto LABEL_24;
    }
    goto LABEL_26;
  }
  id v31 = 0;
  if (v4)
  {
LABEL_24:
    id v21 = [WeakRetained sendingEmailAddressIfExists];
    id v22 = [v21 emailAddressValue];
    id v23 = [v22 simpleAddress];
    int v24 = v23;
    if (v23)
    {
      id v25 = v23;
    }
    else
    {
      id v25 = [v21 stringValue];
    }
    double v20 = v25;
    id v26 = v21;
LABEL_34:

    goto LABEL_35;
  }
LABEL_26:
  id v26 = [(CNComposeRecipientTextView *)self->_bccField addresses];
  if ([v26 count] == 1)
  {
    id v22 = [v26 objectAtIndex:0];
    int v24 = [v22 emailAddressValue];
    double v27 = [v24 displayName];
    uint64_t v28 = v27;
    if (v27)
    {
      id v29 = v27;
    }
    else
    {
      id v29 = [v22 stringValue];
    }
    double v20 = v29;

    id v21 = v22;
    goto LABEL_34;
  }
  double v20 = 0;
LABEL_35:

LABEL_36:
  [(MFComposeMultiView *)self->_multiField setLabel:v31];
  if ((*((unsigned char *)self + 776) & 4) == 0) {
    [(MFComposeMultiView *)self->_multiField setAccountDescription:v20];
  }
  if ([WeakRetained canShowImageSizeField])
  {
    if ([WeakRetained canShowImageSizeField])
    {
      double v30 = [WeakRetained currentScaleImageSize];
    }
    else
    {
      double v30 = 0;
    }
    [(MFComposeMultiView *)self->_multiField setImageSizeDescription:v30];
    [(MFComposeMultiView *)self->_multiField setShowsImageSize:1];
  }
  else
  {
    [(MFComposeMultiView *)self->_multiField setShowsImageSize:0];
  }
  [(MFComposeMultiView *)self->_multiField setNeedsLayout];
}

- (void)_adjustHeaderFieldsPreferredContentSize
{
  v22[5] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F5A0D8] sharedFontMetricCache];
  [v3 ensureCacheIsValid];

  [(MFMailComposeView *)self bounds];
  double v5 = v4;
  [(id)objc_opt_class() preferredHeaderHeight];
  double v7 = v6;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((*((unsigned char *)self + 777) & 0x40) == 0)
  {
    fromField = self->_fromField;
    v22[0] = self->_toField;
    v22[1] = fromField;
    subjectField = self->_subjectField;
    v22[2] = self->_multiField;
    v22[3] = subjectField;
    v22[4] = self->_webContentVariationField;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];
    [v8 addObjectsFromArray:v11];

    objc_msgSend(v8, "ef_addOptionalObject:", self->_ccField);
    objc_msgSend(v8, "ef_addOptionalObject:", self->_bccField);
    objc_msgSend(v8, "ef_addOptionalObject:", self->_imageSizeField);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v12);
        }
        BOOL v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        -[MFMailComposeView _layoutSubviews:changingView:toSize:](self, "_layoutSubviews:changingView:toSize:", 0, v16, v5, v7, (void)v17);
        [v16 refreshPreferredContentSize];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (void)_presentDelayedPopover
{
  [(NSInvocation *)self->_delayedPopoverInvocation invoke];
  delayedPopoverInvocation = self->_delayedPopoverInvocation;
  self->_delayedPopoverInvocation = 0;
}

- (void)_cancelDelayedPopover
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__presentDelayedPopover object:0];
  delayedPopoverInvocation = self->_delayedPopoverInvocation;
  self->_delayedPopoverInvocation = 0;
}

- (BOOL)dragSource:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  return 1;
}

- (id)dragSource:(id)a3 draggableItemsAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [v7 sourceView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v10 = [v7 sourceView];
    [(MFMailComposeView *)self _setDragging:1];
    id v11 = objc_msgSend(v10, "hitTest:withEvent:", 0, x, y);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;
      [v12 setSelected:1];
      uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
      if (v12)
      {
        uint64_t v14 = [v12 recipient];
        [v13 addObject:v14];
      }
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      double v15 = [v10 selectedAtoms];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v15);
            }
            id v19 = *(id *)(*((void *)&v22 + 1) + 8 * i);
            if (v19 != v12)
            {
              long long v20 = [v19 recipient];
              [v13 addObject:v20];
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v16);
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)dragSource:(id)a3 targetedPreviewForDraggableItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v6 sourceView],
        id v8 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        (isKindOfClass & 1) != 0))
  {
    double v10 = [v6 sourceView];
    id v11 = [v10 dragPreviewForDraggedItem:v7 withContainer:self->_bodyScroller];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)dragSource:(id)a3 localObjectForDraggableItem:(id)a4
{
  id v4 = a4;

  return v4;
}

- (id)dragSource:(id)a3 suggestedNameForDraggableItem:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [v4 displayString];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)dragSource:(id)a3 willEndInteractionWithItems:(id)a4 dropOperation:(unint64_t)a5
{
}

- (void)_setDragging:(BOOL)a3
{
  if (self->_isDragging != a3)
  {
    self->_isDragging = a3;
    if (a3)
    {
      [(MFMailComposeView *)self _updateOptionalHeaderVisibilityForceVisible:1];
      [(MFMailComposeView *)self setRecipientFieldsEditable:1 animated:1];
    }
  }
}

- (void)dropTarget:(id)a3 dragEnteredAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  id v7 = [v10 targetView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(MFMailComposeView *)self _setDragging:1];
    id v9 = [v10 targetView];
    objc_msgSend(v9, "dragEnteredAtPoint:", x, y);
  }
}

- (void)dropTarget:(id)a3 dragDidMoveToPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  id v7 = [v10 targetView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(MFMailComposeView *)self _setDragging:1];
    id v9 = [v10 targetView];
    objc_msgSend(v9, "dragMovedToPoint:", x, y);
  }
}

- (void)dropTargetDragExited:(id)a3
{
  id v7 = a3;
  id v4 = [v7 targetView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(MFMailComposeView *)self _setDragging:0];
    id v6 = [v7 targetView];
    [v6 dragExited];
  }
}

- (void)dropTarget:(id)a3 didDropDragItems:(id)a4 atPoint:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 targetView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v11 = [v7 targetView];
    id v12 = [MEMORY[0x1E4F1CA48] array];
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke;
    aBlock[3] = &unk_1E5F7C368;
    id v29 = v30;
    id v13 = v8;
    id v25 = v13;
    id v26 = self;
    id v14 = v12;
    id v27 = v14;
    id v15 = v11;
    id v28 = v15;
    uint64_t v16 = _Block_copy(aBlock);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_2;
    v20[3] = &unk_1E5F7C458;
    v20[4] = self;
    id v17 = v15;
    id v21 = v17;
    id v22 = v14;
    id v23 = v16;
    id v18 = v16;
    id v19 = v14;
    [v13 enumerateObjectsUsingBlock:v20];

    _Block_object_dispose(v30, 8);
  }
}

uint64_t __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke(uint64_t a1)
{
  uint64_t v2 = ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  uint64_t result = [*(id *)(a1 + 32) count];
  if (v2 == result)
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    return [v4 _dropItems:v5 recipientTextView:v6];
  }
  return result;
}

void __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 localObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [v3 localObject];
    uint64_t v37 = 0;
    double v38 = &v37;
    uint64_t v39 = 0x3032000000;
    long long v40 = __Block_byref_object_copy__6;
    CGRect v41 = __Block_byref_object_dispose__6;
    id v42 = 0;
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", *(void *)(*(void *)(a1 + 32) + 536), *(void *)(*(void *)(a1 + 32) + 544), *(void *)(*(void *)(a1 + 32) + 552), 0);
    [v7 removeObject:*(void *)(a1 + 40)];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_134;
    v34[3] = &unk_1E5F7C3B8;
    id v8 = v6;
    id v35 = v8;
    int v36 = &v37;
    [v7 enumerateObjectsUsingBlock:v34];
    id v9 = (void *)v38[5];
    if (v9) {
      [v9 removeRecipient:v8];
    }
    [*(id *)(a1 + 48) addObject:v8];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

    _Block_object_dispose(&v37, 8);
  }
  else
  {
    id v10 = [v3 itemProvider];
    int v11 = [v10 canLoadObjectOfClass:objc_opt_class()];

    if (v11)
    {
      id v12 = [v3 itemProvider];
      uint64_t v13 = objc_opt_class();
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_3;
      v31[3] = &unk_1E5F7C3E0;
      id v32 = *(id *)(a1 + 48);
      id v33 = *(id *)(a1 + 56);
      id v14 = (id)[v12 loadObjectOfClass:v13 completionHandler:v31];

      id v8 = v32;
    }
    else
    {
      id v15 = [v3 itemProvider];
      int v16 = [v15 canLoadObjectOfClass:objc_opt_class()];

      if (v16)
      {
        id v17 = [v3 itemProvider];
        uint64_t v18 = objc_opt_class();
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_4;
        v28[3] = &unk_1E5F7C3E0;
        id v29 = *(id *)(a1 + 48);
        id v30 = *(id *)(a1 + 56);
        id v19 = (id)[v17 loadObjectOfClass:v18 completionHandler:v28];

        id v8 = v29;
      }
      else
      {
        long long v20 = [v3 itemProvider];
        int v21 = [v20 canLoadObjectOfClass:objc_opt_class()];

        if (!v21)
        {
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          goto LABEL_12;
        }
        id v22 = [v3 itemProvider];
        uint64_t v23 = objc_opt_class();
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_6;
        v25[3] = &unk_1E5F7C430;
        id v26 = *(id *)(a1 + 48);
        id v27 = *(id *)(a1 + 56);
        id v24 = (id)[v22 loadObjectOfClass:v23 completionHandler:v25];

        id v8 = v26;
      }
    }
  }

LABEL_12:
}

void __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_134(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6 = a2;
  id v7 = [v6 recipients];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_2_135;
  v11[3] = &unk_1E5F7C390;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v12 = v8;
  uint64_t v14 = v9;
  id v10 = v6;
  id v13 = v10;
  [v7 enumerateObjectsUsingBlock:v11];

  *a4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

void __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_2_135(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(a1 + 32) == a2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    *a4 = 1;
  }
}

void __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) addObject:v6];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v5 draggingContacts];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_5;
      v8[3] = &unk_1E5F7C408;
      id v9 = *(id *)(a1 + 32);
      [v7 enumerateObjectsUsingBlock:v8];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_5(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [MEMORY[0x1E4F1BB78] descriptorForRequiredKeys];
  id v4 = [v9 fetchContactWithKeys:v3];

  id v5 = [v4 emailAddresses];
  id v6 = [v5 firstObject];
  id v7 = [v6 value];

  if (v7)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F5A140]) initWithContact:v4 address:v7 kind:0];
    [*(id *)(a1 + 32) addObject:v8];
  }
}

void __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v8 recipients];
    [v6 addObjectsFromArray:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_dropItems:(id)a3 recipientTextView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__MFMailComposeView__dropItems_recipientTextView___block_invoke;
  v16[3] = &unk_1E5F791F0;
  id v9 = v8;
  id v17 = v9;
  [v6 enumerateObjectsUsingBlock:v16];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__MFMailComposeView__dropItems_recipientTextView___block_invoke_2;
  v12[3] = &unk_1E5F79770;
  id v13 = v9;
  id v14 = v7;
  id v15 = self;
  id v10 = v7;
  id v11 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __50__MFMailComposeView__dropItems_recipientTextView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

uint64_t __50__MFMailComposeView__dropItems_recipientTextView___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) count];
  id v3 = *(void **)(a1 + 40);
  if (v2) {
    [v3 dropItems:*(void *)(a1 + 32)];
  }
  else {
    [v3 dragExited];
  }
  id v4 = *(void **)(a1 + 48);

  return [v4 _setDragging:0];
}

- (BOOL)dropTarget:(id)a3 shouldAddDroppedContactsToTargetView:(id)a4 forSession:(id)a5
{
  return 1;
}

- (id)sendingAddressForDropTarget:(id)a3 withTargetView:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  id v5 = [WeakRetained sendingEmailAddressIfExists];

  return v5;
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  *((unsigned char *)self + 776) |= 0x40u;
  if ([(UIScrollView *)self->_bodyScroller isDecelerating])
  {
    [(UIScrollView *)self->_bodyScroller contentOffset];
    -[UIScrollView setContentOffset:animated:](self->_bodyScroller, "setContentOffset:animated:", 0);
  }
  if ([(MFMailComposeView *)self _presentsSearchResultsTableAsPopover])
  {
    [(MFMailComposeView *)self _cancelDelayedPopover];
  }
}

- (id)_focusedRecipientView
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  ccField = self->_ccField;
  v19[0] = self->_toField;
  v19[1] = ccField;
  v19[2] = self->_bccField;
  id v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 3, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = [v8 textView];
        if ([v9 isFirstResponder])
        {

LABEL_13:
          id v13 = v8;
          goto LABEL_14;
        }
        id v10 = [v8 textView];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_pinningResponder);
        BOOL v12 = v10 == WeakRetained;

        if (v12) {
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
      id v13 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v13 = 0;
  }
LABEL_14:

  return v13;
}

- (void)_finishUpRotationToInterfaceOrientation:(int64_t)a3
{
  [(MFMailComposeView *)self _layoutSubviews:0];

  [(MFMailComposeView *)self _adjustScrollerForBottomView];
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  *((unsigned char *)self + 776) &= ~0x40u;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MFMailComposeView;
  [(UITransitionView *)&v4 layoutSubviews];
  [(MFMailComposeView *)self _adjustScrollerContentSize];
  [(MFMailComposeView *)self _layoutSubviews:0];
  id v3 = [(MFMailComposeView *)self _focusedRecipientView];
  [v3 reflow];

  [(MFMailComposeView *)self _layoutLoadingView];
}

- (void)_layoutLoadingView
{
  id v7 = [(MFMailComposeView *)self bodyScroller];
  [v7 adjustedContentInset];
  double v4 = v3;
  [v7 bounds];
  -[MFMessageContentLoadingView setFrame:](self->_loadingView, "setFrame:", v5 + 0.0, v4 + v6);
}

- (void)_adjustScrollerContentSize
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1AF945000, log, OS_LOG_TYPE_DEBUG, "previous web view scroll inset: %{public}@, current web view scroll inset%{public}@", buf, 0x16u);
}

- (void)_adjustScrollerForBottomView
{
  [(UIScrollView *)self->_bodyScroller contentOffset];
  double v4 = v3;
  double v6 = v5;
  [(MFMailComposeView *)self _normalizeBodyFieldFrame];
  [(MFMailComposeView *)self _adjustScrollerContentSize];
  -[UIScrollView setContentOffset:](self->_bodyScroller, "setContentOffset:", v4, v6);
  id v7 = [(MFMailComposeView *)self firstResponder];

  if (v7)
  {
    id v28 = [(MFMailComposeView *)self firstResponder];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v28;
      bodyScroller = self->_bodyScroller;
      [v8 frame];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      long long v18 = [v8 superview];
      -[UIScrollView convertRect:fromView:](bodyScroller, "convertRect:fromView:", v18, v11, v13, v15, v17);
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;

      [(UIScrollView *)self->_bodyScroller contentInset];
      -[UIScrollView scrollRectToVisible:animated:](self->_bodyScroller, "scrollRectToVisible:animated:", 1, v20, v22 + v27, v24, v26);
    }
  }
}

- (BOOL)shouldScrollLastChangedRecipientViewToTop
{
  double v3 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v3);

  if (IsAccessibilityCategory) {
    return ![(MFMailComposeView *)self _presentsSearchResultsTableAsPopover];
  }
  else {
    return 0;
  }
}

- (void)_updateKeyboardIntersection:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(MFMailComposeView *)self window];
  id v9 = [v8 screen];
  id v31 = [v9 coordinateSpace];

  [(MFMailComposeView *)self bounds];
  -[MFMailComposeView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v31);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v17 = v16;
  objc_msgSend(v31, "convertRect:toCoordinateSpace:", v31, x, y, width, height);
  v36.origin.double x = v18;
  v36.origin.double y = v19;
  v36.size.double width = v20;
  v36.size.double height = v21;
  v33.origin.double x = v11;
  v33.origin.double y = v13;
  v33.size.double width = v15;
  v33.size.double height = v17;
  CGRect v34 = CGRectIntersection(v33, v36);
  CGFloat v22 = v34.size.height;
  double v23 = [(MFMailComposeView *)self composeWebView];
  if ([v23 _contentViewIsFirstResponder])
  {
    char v24 = *((unsigned char *)self + 777);

    if ((v24 & 0x40) == 0)
    {
      headerView = self->_headerView;
      [(UIView *)headerView bounds];
      -[UIView convertRect:toView:](headerView, "convertRect:toView:", self);
      double v26 = v17 - height - CGRectGetMaxY(v35);
      if (v26 < 40.0)
      {
        bodyScroller = self->_bodyScroller;
        [(UIScrollView *)bodyScroller contentOffset];
        double v29 = v28;
        [(UIScrollView *)self->_bodyScroller contentOffset];
        -[UIScrollView setContentOffset:](bodyScroller, "setContentOffset:", v29, fabs(v26) + v30);
      }
    }
  }
  else
  {
  }
  if (self->_keyboardIntersection != v22)
  {
    self->_keyboardIntersection = v22;
    [(MFMailComposeView *)self _adjustScrollerForBottomView];
    [(MFMailComposeView *)self _layoutSubviews:0];
  }
}

- (void)automaticKeyboardFinishedAppearing:(id)a3
{
  id v14 = a3;
  double v4 = [v14 userInfo];
  double v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[MFMailComposeView _updateKeyboardIntersection:](self, "_updateKeyboardIntersection:", v7, v9, v11, v13);
}

- (void)automaticKeyboardFinishedDisappearing:(id)a3
{
  id v14 = a3;
  double v4 = [v14 userInfo];
  double v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  [(MFMailComposeView *)self _beginPreventingScrollingToRevealSelection];
  -[MFMailComposeView _updateKeyboardIntersection:](self, "_updateKeyboardIntersection:", v7, v9, v11, v13);
  [(MFMailComposeView *)self _endPreventingScrollingToRevealSelection];
}

- (void)setKeyboardVisible:(BOOL)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  char IsAutomaticAppearanceEnabled = UIKeyboardIsAutomaticAppearanceEnabled();
  if (v5)
  {
    if ((IsAutomaticAppearanceEnabled & 1) == 0)
    {
      MEMORY[0x1F4166CF8](v4);
    }
  }
  else if ((IsAutomaticAppearanceEnabled & 1) == 0)
  {
    MEMORY[0x1F4166D00](v4);
  }
}

- (BOOL)isKeyboardVisible
{
  uint64_t v2 = [MEMORY[0x1E4FB18E0] activeKeyboard];
  if ([v2 isMinimized]) {
    char v3 = 0;
  }
  else {
    char v3 = UIKeyboardAutomaticIsOnScreen();
  }

  return v3;
}

- (double)_heightForBottomView
{
  double keyboardIntersection = self->_keyboardIntersection;
  BOOL v4 = [(MFMailComposeView *)self window];
  [v4 frame];
  double v6 = v5;
  double v7 = [(MFMailComposeView *)self window];
  [v7 frame];
  double v9 = v8;

  double v10 = [(MFMailComposeView *)self window];
  objc_msgSend(v10, "convertRect:fromWindow:", 0, 0.0, v6, v9, 100.0);
  -[MFMailComposeView convertRect:fromView:](self, "convertRect:fromView:", 0);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  [(MFMailComposeView *)self bounds];
  v22.origin.double x = v12;
  v22.origin.double y = v14;
  v22.size.double width = v16;
  v22.size.double height = v18;
  CGRect v21 = CGRectIntersection(v20, v22);
  return keyboardIntersection + v21.size.height;
}

- (void)saveFirstResponder
{
}

- (void)saveFirstResponderWithKeyboardPinning:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = [(MFMailComposeView *)self firstResponder];
  objc_storeWeak((id *)&self->_firstResponderBeforeSheet, obj);
  if (v3)
  {
    p_pinningResponder = &self->_pinningResponder;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pinningResponder);
    if (WeakRetained != obj)
    {
      [WeakRetained _endPinningInputViews];
      objc_storeWeak((id *)p_pinningResponder, obj);
      [obj _beginPinningInputViews];
    }
  }
}

- (void)restoreFirstResponder
{
  [(MFMailComposeView *)self restoreFirstResponderWithKeyboardPinning:0];

  objc_storeWeak((id *)&self->_firstResponderBeforeSheet, 0);
}

- (void)restoreFirstResponderWithKeyboardPinning:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstResponderBeforeSheet);
  [WeakRetained becomeFirstResponder];

  if (v3)
  {
    p_pinningResponder = &self->_pinningResponder;
    id v7 = objc_loadWeakRetained((id *)p_pinningResponder);
    [v7 _endPinningInputViews];

    objc_storeWeak((id *)p_pinningResponder, 0);
  }
}

- (void)focusFirstResponderAfterRecipientView:(id)a3
{
  BOOL v4 = (MFMailComposeToField *)a3;
  p_ccField = (id *)&self->_ccField;
  ccField = self->_ccField;
  CGFloat v12 = v4;
  if (self->_toField == v4)
  {
    double v8 = ccField;
    [(MFMailComposeRecipientTextView *)v8 alpha];
    if (v9 != 0.0) {
      goto LABEL_8;
    }
LABEL_10:

LABEL_11:
    p_ccField = (id *)&self->_subjectField;
    goto LABEL_12;
  }
  p_ccField = (id *)&self->_bccField;
  bccField = self->_bccField;
  if (ccField != (MFMailComposeRecipientTextView *)v4)
  {
    if (bccField != (MFMailComposeRecipientTextView *)v4) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  double v8 = bccField;
  [(MFMailComposeRecipientTextView *)v8 alpha];
  if (v10 == 0.0) {
    goto LABEL_10;
  }
LABEL_8:
  double v11 = [(MFMailComposeRecipientTextView *)v8 superview];

  if (!v11) {
    goto LABEL_11;
  }
LABEL_12:
  [*p_ccField becomeFirstResponder];
LABEL_13:
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIScrollView *)self->_bodyScroller contentOffset];
  double v6 = v5;
  [(UIScrollView *)self->_bodyScroller _effectiveContentInset];
  bodyScroller = self->_bodyScroller;

  -[UIScrollView setContentOffset:animated:](bodyScroller, "setContentOffset:animated:", v3, v6, -v7);
}

- (void)setScrollsToTop:(BOOL)a3
{
}

- (void)scrollToRecipientTextView:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 isDescendantOfView:self])
  {
    double v10 = [(MFMailComposeView *)self navigationBarDelegate];
    char v11 = [v10 getPrefersLargeTitles];
    [v10 setPrefersLargeTitles:0];
    CGFloat v12 = (void *)MEMORY[0x1E4F39CF8];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__MFMailComposeView_scrollToRecipientTextView_animated_completion___block_invoke;
    v15[3] = &unk_1E5F7C4A8;
    v15[4] = self;
    id v16 = v8;
    BOOL v19 = a4;
    id v13 = v10;
    id v17 = v13;
    char v20 = v11;
    id v18 = v9;
    [v12 setCompletionBlock:v15];
  }
  else
  {
    CGFloat v14 = +[MFMailComposeView log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF945000, v14, OS_LOG_TYPE_DEFAULT, "Unable to scroll to unrelated recipient view.", buf, 2u);
    }

    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }
}

void __67__MFMailComposeView_scrollToRecipientTextView_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) bodyScroller];
  [*(id *)(a1 + 40) frame];
  double v4 = v3;
  double v6 = v5;
  double v7 = [*(id *)(a1 + 32) bodyScroller];
  objc_msgSend(v2, "convertPoint:toView:", v7, v4, v6);
  double v9 = v8;

  double v10 = [*(id *)(a1 + 32) bodyScroller];
  [v10 _effectiveContentInset];
  double v12 = v11;

  double v13 = v9 - v12;
  if (*(unsigned char *)(a1 + 64)) {
    double v14 = 0.200000003;
  }
  else {
    double v14 = 0.0;
  }
  double v15 = (void *)MEMORY[0x1E4FB1EB0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__MFMailComposeView_scrollToRecipientTextView_animated_completion___block_invoke_2;
  v20[3] = &unk_1E5F79BC0;
  v20[4] = *(void *)(a1 + 32);
  void v20[5] = 0;
  *(double *)&v20[6] = v13;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__MFMailComposeView_scrollToRecipientTextView_animated_completion___block_invoke_3;
  v16[3] = &unk_1E5F7C480;
  id v17 = *(id *)(a1 + 48);
  char v19 = *(unsigned char *)(a1 + 65);
  id v18 = *(id *)(a1 + 56);
  [v15 animateWithDuration:v20 animations:v16 completion:v14];
}

void __67__MFMailComposeView_scrollToRecipientTextView_animated_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) bodyScroller];
  objc_msgSend(v2, "setContentOffset:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __67__MFMailComposeView_scrollToRecipientTextView_animated_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setPrefersLargeTitles:*(unsigned __int8 *)(a1 + 48)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)layoutForChangedComposeHeaderView:(id)a3 size:(CGSize)a4
{
  -[MFMailComposeView _layoutSubviews:changingView:toSize:](self, "_layoutSubviews:changingView:toSize:", (*((unsigned char *)self + 777) & 2) == 0, a3, a4.width, a4.height);
}

- (void)viewDidBecomeFirstResponder:(id)a3
{
  double v4 = (MFMailComposeToField *)a3;
  if (self->_toField == v4
    && [(MFMailComposeView *)self _shouldShowCorecipientsTableView])
  {
    [(MFMailComposeView *)self _layoutSubviews:1];
  }
  BOOL v5 = (MFMailComposeToField *)self->_ccField == v4 || self->_bccField == (MFMailComposeRecipientTextView *)v4;
  [(MFMailComposeView *)self _updateOptionalHeaderVisibilityForceVisible:v5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__MFMailComposeView_viewDidBecomeFirstResponder___block_invoke;
  v7[3] = &unk_1E5F7B3A0;
  double v6 = v4;
  double v8 = v6;
  double v9 = self;
  [(MFMailComposeView *)self _performBlockWithStrongComposeCoordinator:v7];
}

void __49__MFMailComposeView_viewDidBecomeFirstResponder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(a1 + 40);
  id v7 = v3;
  if (v4 == v5[67])
  {
    double v6 = @"to";
  }
  else if (v4 == v5[68])
  {
    double v6 = @"cc";
  }
  else if (v4 == v5[69])
  {
    double v6 = @"bcc";
  }
  else
  {
    if (v4 != v5[73]) {
      goto LABEL_10;
    }
    double v6 = @"subject";
  }
  [v3 setFocusedField:v6];
LABEL_10:
}

- (void)updateOptionalHeaderVisibility
{
}

- (void)_updateOptionalHeaderVisibilityForceVisible:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = (char *)self + 777;
    if ((*((unsigned char *)self + 777) & 8) != 0) {
      return;
    }
    goto LABEL_10;
  }
  BOOL v5 = [(CNComposeRecipientTextView *)self->_ccField recipients];
  if ([v5 count] || self->_isDragging)
  {
    int v6 = 1;
  }
  else
  {
    double v10 = [(CNComposeRecipientTextView *)self->_bccField recipients];
    if ([v10 count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
      int v6 = [WeakRetained bccAddressesDirtied];
    }
    else
    {
      int v6 = 0;
    }
  }
  uint64_t v4 = (char *)self + 777;
  char v7 = *((unsigned char *)self + 777);
  if (((v6 ^ ((v7 & 8) == 0)) & 1) == 0)
  {
    if (!v6)
    {
      char v8 = 0;
      goto LABEL_12;
    }
LABEL_10:
    [(MFMailComposeView *)self _createCCAndBCCFieldIfNeededAndCompleteSetup:1];
    char v7 = *v4;
    char v8 = 8;
LABEL_12:
    *uint64_t v4 = v7 & 0xF7 | v8;
    BOOL v9 = (*((unsigned char *)self + 777) & 2) == 0;
    [(MFMailComposeView *)self _layoutSubviews:v9];
  }
}

- (void)menuDidHide
{
  id v3 = [(MFMailComposeView *)self composeWebView];
  int v4 = [v3 isFirstResponder];

  if (v4)
  {
    [(MFMailComposeView *)self _updateQuoteLevelMenu];
  }
}

- (id)recipientTextViewForComposeMultiView:(id)a3
{
  return self->_ccField;
}

- (BOOL)isSearching
{
  return self->_activeRecipientView != 0;
}

- (void)selectNextSearchResult
{
}

- (void)selectPreviousSearchResult
{
}

- (BOOL)chooseSelectedSearchResult
{
  return [(CNAutocompleteResultsTableViewController *)self->_searchViewController confirmSelectedRecipient];
}

- (UITableView)searchTableView
{
  id v2 = [(MFMailComposeView *)self searchViewController];
  id v3 = [v2 tableView];

  return (UITableView *)v3;
}

- (BOOL)presentSearchResults
{
  id v3 = [(MFMailComposeView *)self searchViewController];
  int v4 = [v3 recipients];
  uint64_t v5 = [v4 count];

  if (v5 && !self->_activeRecipientView)
  {
    int v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"MFMailComposeViewDidSortSearchResults" object:0];

    objc_storeStrong((id *)&self->_activeRecipientView, self->_lastChangedRecipientView);
    [(UIScrollView *)self->_bodyScroller contentOffset];
    self->_offsetBeforeSearch = v7;
    [(MFMailComposeView *)self _layoutSubviews:0];
  }
  return v5 != 0;
}

- (void)dismissSearchResults
{
  activeRecipientView = self->_activeRecipientView;
  if (activeRecipientView) {
    [(MFMailComposeView *)self clearSearchForRecipientView:activeRecipientView reflow:1 clear:1];
  }
}

- (BOOL)presentSearchResults:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [(MFMailComposeView *)self searchViewController];
    [v5 setRecipients:v4];

    BOOL v6 = [(MFMailComposeView *)self presentSearchResults];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)beginSearchForText:(id)a3 recipientView:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  objc_storeStrong((id *)&self->_lastChangedRecipientView, a4);
  if (!self->_searchController)
  {
    double v7 = objc_alloc_init(MFMailComposeContactsSearchController);
    searchController = self->_searchController;
    self->_searchController = v7;

    [(MFMailComposeContactsSearchController *)self->_searchController setDelegate:self];
  }
  BOOL v9 = [MEMORY[0x1E4F1CA48] array];
  double v10 = [(CNComposeRecipientTextView *)self->_toField recipients];
  [v9 addObjectsFromArray:v10];

  double v11 = [(CNComposeRecipientTextView *)self->_ccField recipients];
  [v9 addObjectsFromArray:v11];

  double v12 = [(CNComposeRecipientTextView *)self->_bccField recipients];
  [v9 addObjectsFromArray:v12];

  double v13 = self->_searchController;
  double v14 = [(MFComposeSubjectView *)self->_subjectField text];
  [(MFMailComposeContactsSearchController *)v13 searchWithString:v17 enteredRecipients:v9 title:v14];

  double v15 = [(MFMailComposeView *)self _searchResultsTable];
  [v15 selectRowAtIndexPath:0 animated:0 scrollPosition:0];

  id v16 = [(MFMailComposeView *)self _searchResultsTable];
  objc_msgSend(v16, "scrollRectToVisible:animated:", 0, 0.0, 0.0, 1.0, 1.0);
}

- (void)cancelSearch
{
}

- (void)clearSearchForActiveRecipientView
{
  if (self->_activeRecipientView || self->_lastChangedRecipientView)
  {
    -[MFMailComposeView clearSearchForRecipientView:reflow:clear:](self, "clearSearchForRecipientView:reflow:clear:");
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"_MFComposeRecipientTextViewSearchEnd" object:self userInfo:0];
  }
}

- (void)invalidateSearchResultRecipient:(id)a3
{
  id v6 = a3;
  id v4 = [(CNAutocompleteResultsTableViewController *)self->_searchViewController recipients];
  uint64_t v5 = [v4 count];

  if (v5 == 1) {
    [(MFMailComposeView *)self clearSearchForRecipientView:self->_activeRecipientView reflow:0 clear:0];
  }
  else {
    [(CNAutocompleteResultsTableViewController *)self->_searchViewController invalidateSearchResultRecipient:v6];
  }
}

- (void)findCorecipientsWithRecipientView:(id)a3
{
  id v7 = a3;
  if ([(MFMailComposeView *)self _userInterfaceConfigurationSupportsCorecipientsTableView])
  {
    if (!self->_searchController)
    {
      id v4 = objc_alloc_init(MFMailComposeContactsSearchController);
      searchController = self->_searchController;
      self->_searchController = v4;

      [(MFMailComposeContactsSearchController *)self->_searchController setDelegate:self];
    }
    id v6 = [v7 uncommentedAddresses];
    if ((unint64_t)[v6 count] < 2)
    {
      [(CNAutocompleteResultsTableViewController *)self->_corecipientsSearchViewController setDeferTableViewUpdates:1];
      [(CNAutocompleteResultsTableViewController *)self->_corecipientsSearchViewController setRecipients:0];
      [(MFMailComposeView *)self _layoutSubviews:1];
    }
    else
    {
      [(MFMailComposeContactsSearchController *)self->_searchController findCorecipientsWithRecipients:v6];
    }
  }
}

- (void)disambiguateRecipient:(id)a3 recipientView:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_searchController)
  {
    char v8 = objc_alloc_init(MFMailComposeContactsSearchController);
    searchController = self->_searchController;
    self->_searchController = v8;

    [(MFMailComposeContactsSearchController *)self->_searchController setDelegate:self];
  }
  *((unsigned char *)self + 777) |= 4u;
  objc_storeStrong((id *)&self->_lastChangedRecipientView, a4);
  double v10 = [(MFMailComposeView *)self searchViewController];
  v12[0] = v6;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v10 updateRecipients:v11 disambiguatingRecipient:v6];

  [(MFMailComposeView *)self presentSearchResults];
}

- (void)dismissSearchResultsIfDisambiguating
{
  if ((*((unsigned char *)self + 777) & 4) != 0)
  {
    *((unsigned char *)self + 777) &= ~4u;
    [(MFMailComposeView *)self dismissSearchResults];
  }
}

- (void)didIgnoreSearchResults
{
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  double v14 = (CNAutocompleteResultsTableViewController *)a3;
  id v8 = a4;
  BOOL v9 = v8;
  if (v8)
  {
    double v10 = [v8 address];

    if (v10)
    {
      [(MFMailComposeContactsSearchController *)self->_searchController didSelectRecipient:v9 atIndex:a5];
      p_super = self->_activeRecipientView;
      if (self->_corecipientsSearchViewController == v14)
      {
        double v12 = self->_toField;

        p_super = &v12->super;
      }
      id v13 = v9;
      [(MFMailComposeView *)self clearSearchForRecipientView:self->_activeRecipientView reflow:0 clear:1];
      [(MFMailComposeView *)self setChangingRecipients:1];
      [(MFMailComposeRecipientTextView *)p_super addRecipient:v13];
      [(MFMailComposeView *)self setChangingRecipients:0];
    }
  }
}

- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeRecipientViewDelegate);
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained composeRecipientView:self->_activeRecipientView showPersonCardForRecipient:v6];
  }
}

- (void)autocompleteResultsController:(id)a3 didAskToRemoveRecipient:(id)a4
{
  id v6 = a4;
  uint64_t v5 = [(MFMailComposeView *)self searchController];
  [v5 removeRecipient:v6];
}

- (id)sendingAccountProxyForComposeContactsSearchController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  id v4 = [WeakRetained sendingAccountProxy];

  return v4;
}

- (int64_t)addressableGroupResultStyleForComposeContactsSearchController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  int v4 = [WeakRetained isCloudKitShare];

  return v4 ^ 1u;
}

- (void)composeContactsSearchController:(id)a3 didSortResults:(id)a4
{
}

- (void)composeContactsSearchController:(id)a3 finishedWithResults:(BOOL)a4
{
  if (!a4 && (self->_activeRecipientView || self->_lastChangedRecipientView)) {
    -[MFMailComposeView clearSearchForRecipientView:reflow:clear:](self, "clearSearchForRecipientView:reflow:clear:");
  }
}

- (void)composeContactsSearchController:(id)a3 didFindCorecipients:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (!self->_corecipientsSearchViewController)
  {
    id v7 = (CNAutocompleteResultsTableViewController *)[objc_alloc(MEMORY[0x1E4F5A0F0]) initWithStyle:0];
    corecipientsSearchViewController = self->_corecipientsSearchViewController;
    self->_corecipientsSearchViewController = v7;

    [(CNAutocompleteResultsTableViewController *)self->_corecipientsSearchViewController setDelegate:self];
    BOOL v9 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
    double v10 = [(CNAutocompleteResultsTableViewController *)self->_corecipientsSearchViewController view];
    [v10 setBackgroundColor:v9];
  }
  if ((unint64_t)[v6 count] >= 4)
  {
    uint64_t v11 = objc_msgSend(v6, "subarrayWithRange:", 0, 3);

    id v6 = (id)v11;
  }
  -[CNAutocompleteResultsTableViewController setDeferTableViewUpdates:](self->_corecipientsSearchViewController, "setDeferTableViewUpdates:", [v6 count] == 0);
  [(CNAutocompleteResultsTableViewController *)self->_corecipientsSearchViewController setRecipients:v6];
  [(MFMailComposeView *)self _layoutSubviews:1];
}

- (void)clearSearchForRecipientView:(id)a3 reflow:(BOOL)a4 clear:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  [(MFMailComposeContactsSearchController *)self->_searchController cancelSearch];
  activeRecipientView = self->_activeRecipientView;
  self->_activeRecipientView = 0;

  if (v5) {
    [v9 clearText];
  }
  if (v6) {
    [v9 reflow];
  }
  [(MFMailComposeView *)self _layoutSubviews:0];
}

- (void)parentWillClose
{
  *((unsigned char *)self + 776) |= 0x80u;
  [(CNComposeRecipientTextView *)self->_toField parentWillClose];
  [(CNComposeRecipientTextView *)self->_ccField parentWillClose];
  bccField = self->_bccField;

  [(CNComposeRecipientTextView *)bccField parentWillClose];
}

- (void)parentDidClose
{
  [(CNComposeRecipientTextView *)self->_toField parentDidClose];
  [(CNComposeRecipientTextView *)self->_ccField parentDidClose];
  bccField = self->_bccField;

  [(CNComposeRecipientTextView *)bccField parentDidClose];
}

- (void)didAppear
{
  *((unsigned char *)self + 777) |= 0x10u;
  [(UIScrollView *)self->_bodyScroller flashScrollIndicators];

  [(MFMailComposeView *)self _createCCAndBCCFieldIfNeededAndCompleteSetup:1];
}

- (void)willDisappear
{
  *((unsigned char *)self + 777) &= ~0x10u;
}

- (CGPoint)_headerViewOriginWithScrollViewOffsetCalculation
{
  [(UIView *)self->_headerView origin];
  double v4 = v3;
  [(UIScrollView *)self->_bodyScroller contentOffset];
  if ((*((unsigned char *)self + 777) & 1) == 0)
  {
    if (v5 >= 0.0) {
      double v6 = v5;
    }
    else {
      double v6 = 0.0;
    }
    id v7 = [(MFMailComposeView *)self composeWebView];
    [v7 frame];
    double v9 = v8;
    [(UIView *)self->_headerView frame];
    double v11 = v9 - v10;

    if (v6 <= v11) {
      double v5 = v6;
    }
    else {
      double v5 = v11;
    }
  }
  double v12 = v4;
  result.double y = v12;
  result.double x = v5;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v17 = [(MFMailComposeView *)self traitCollection];
  [(MFMailComposeView *)self directionalLayoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(MFMailComposeView *)self safeAreaInsets];
  id v16 = +[MFComposeDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:](MFComposeDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:", v17, v5, v7, v9, v11, v12, v13, v14, v15);
  [(MFMailComposeView *)self setDisplayMetrics:v16];
}

- (void)layoutMarginsDidChange
{
  v17.receiver = self;
  v17.super_class = (Class)MFMailComposeView;
  [(MFMailComposeView *)&v17 layoutMarginsDidChange];
  [(MFMailComposeView *)self layoutMargins];
  [(UIView *)self->_headerView setLayoutMargins:"setLayoutMargins:"];
  double v3 = [(MFMailComposeView *)self traitCollection];
  [(MFMailComposeView *)self directionalLayoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(MFMailComposeView *)self safeAreaInsets];
  id v16 = +[MFComposeDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:](MFComposeDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:", v3, v5, v7, v9, v11, v12, v13, v14, v15);
  [(MFMailComposeView *)self setDisplayMetrics:v16];
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4 = (UIScrollView *)a3;
  if ((*((unsigned char *)self + 777) & 0x40) == 0)
  {
    objc_super v17 = v4;
    headerView = self->_headerView;
    if (headerView && self->_bodyScroller == v17)
    {
      [(UIView *)headerView frame];
      [(MFMailComposeView *)self _headerViewOriginWithScrollViewOffsetCalculation];
      double v7 = v6;
      -[UIView setFrame:](self->_headerView, "setFrame:");
      if (![(MFMailComposeView *)self _presentsSearchResultsTableAsPopover]
        && self->_searchViewController
        && self->_shadowView)
      {
        double v8 = [(MFMailComposeView *)self _searchResultsTable];
        [v8 frame];
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;

        double v15 = [(MFMailComposeView *)self _searchResultsTable];
        objc_msgSend(v15, "setFrame:", v7, v10, v12, v14);

        [(UIView *)self->_shadowView frame];
        [(UIView *)self->_shadowView setFrame:v7];
      }
      [(MFMailComposeView *)self _layoutFindPanelHostView];
    }
    id v16 = [(MFMailComposeView *)self composeWebView];
    [v16 hideMakeLinkAccessoryButton];

    double v4 = v17;
  }
}

- (void)_displayMetricsDidChange
{
  id v6 = [(MFMailComposeView *)self displayMetrics];
  [v6 trailingButtonMidlineOffset];
  double v4 = v3;
  double v5 = [(MFMailComposeView *)self searchViewController];
  [v5 setTrailingButtonMidlineInsetFromLayoutMargin:v4];
}

- (void)composeWebViewTextChanged:(id)a3
{
  id v4 = [(MFMailComposeView *)self composeViewDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 composeViewBodyTextChanged:self];
  }
}

- (void)findNavigatorPanelDidChangeHeight:(double)a3
{
  self->_double findPanelHeight = a3;
  [(MFMailComposeView *)self _layoutSubviews:1];
}

- (void)composeWebView:(id)a3 didChangeHeight:(double)a4
{
  id v7 = a3;
  if (_os_feature_enabled_impl())
  {
    id v6 = [(MFMailComposeView *)self composeViewDelegate];
    [v6 composeWebView:v7 didChangeHeight:a4];
  }
}

- (void)composeWebView:(id)a3 composeBodyIsEmpty:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (_os_feature_enabled_impl())
  {
    id v6 = [(MFMailComposeView *)self composeViewDelegate];
    [v6 composeWebView:v7 composeBodyIsEmpty:v4];
  }
}

- (void)composeWebView:(id)a3 hasActiveWritingToolsSession:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = [(MFMailComposeView *)self composeViewDelegate];
  [v6 composeWebView:v7 hasActiveWritingToolsSession:v4];
}

- (void)composeFromView:(id)a3 didSelectAddress:(id)a4
{
  id v6 = a4;
  double v5 = [(MFMailComposeView *)self composeViewDelegate];
  [v5 setSendingEmailAddress:v6];
}

- (void)_performBlockWithStrongComposeCoordinator:(id)a3
{
  double v5 = (void (**)(id, id))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeCoordinator);
  if (WeakRetained) {
    v5[2](v5, WeakRetained);
  }
}

- (MFMailComposeViewDelegate)composeViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);

  return (MFMailComposeViewDelegate *)WeakRetained;
}

- (MFMailComposeRecipientTextViewDelegate)composeRecipientDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeRecipientViewDelegate);

  return (MFMailComposeRecipientTextViewDelegate *)WeakRetained;
}

- (UIViewController)popoverOwner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popoverOwner);

  return (UIViewController *)WeakRetained;
}

- (void)setPopoverOwner:(id)a3
{
}

- (MFMailComposeToFieldDelegate)toFieldDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toFieldDelegate);

  return (MFMailComposeToFieldDelegate *)WeakRetained;
}

- (MFMailComposeToField)toField
{
  return self->_toField;
}

- (MFComposeSubjectView)subjectField
{
  return self->_subjectField;
}

- (MFComposeMultiView)multiField
{
  return self->_multiField;
}

- (UIScrollView)bodyScroller
{
  return self->_bodyScroller;
}

- (MFMailComposeContactsSearchController)searchController
{
  return self->_searchController;
}

- (MFComposeWebContentVariationView)webContentVariationField
{
  return self->_webContentVariationField;
}

- (ComposeViewNavigationBarDelegate)navigationBarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBarDelegate);

  return (ComposeViewNavigationBarDelegate *)WeakRetained;
}

- (void)setNavigationBarDelegate:(id)a3
{
}

- (MFComposeFromView)fromField
{
  return self->_fromField;
}

- (MFMailComposeCoordinator)composeCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeCoordinator);

  return (MFMailComposeCoordinator *)WeakRetained;
}

- (void)setComposeCoordinator:(id)a3
{
}

- (MFComposeDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (EFCancelable)autoCompleteTableViewContentSizeObserver
{
  return self->_autoCompleteTableViewContentSizeObserver;
}

- (void)setAutoCompleteTableViewContentSizeObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoCompleteTableViewContentSizeObserver, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_destroyWeak((id *)&self->_composeCoordinator);
  objc_destroyWeak((id *)&self->_navigationBarDelegate);
  objc_destroyWeak((id *)&self->_toFieldDelegate);
  objc_destroyWeak((id *)&self->_popoverOwner);
  objc_destroyWeak((id *)&self->_composeRecipientViewDelegate);
  objc_destroyWeak((id *)&self->_mailComposeViewDelegate);
  objc_storeStrong((id *)&self->_findPanelHostView, 0);
  objc_storeStrong((id *)&self->_corecipientsSearchTableViewSeparator, 0);
  objc_storeStrong((id *)&self->_corecipientsSearchViewController, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_delayedPopoverInvocation, 0);
  objc_destroyWeak((id *)&self->_pinningResponder);
  objc_destroyWeak((id *)&self->_firstResponderBeforeSheet);
  objc_storeStrong((id *)&self->_pendingDropRecipients, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_webContentVariationField, 0);
  objc_storeStrong((id *)&self->_imageSizeField, 0);
  objc_storeStrong((id *)&self->_multiField, 0);
  objc_storeStrong((id *)&self->_fromField, 0);
  objc_storeStrong((id *)&self->_subjectField, 0);
  objc_storeStrong((id *)&self->_activeRecipientView, 0);
  objc_storeStrong((id *)&self->_lastChangedRecipientView, 0);
  objc_storeStrong((id *)&self->_bccField, 0);
  objc_storeStrong((id *)&self->_ccField, 0);
  objc_storeStrong((id *)&self->_toField, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong((id *)&self->_bodyScroller, 0);
}

@end