@interface HLPHelpTopicViewController
- (BOOL)darkModeEnabled;
- (BOOL)displayHelpTopicsOnly;
- (BOOL)fullBookView;
- (BOOL)hideDoneButton;
- (BOOL)isSingleTopic;
- (BOOL)showTopicNameAsTitle;
- (BOOL)supportsDarkMode;
- (HLPHelpBookController)helpBookController;
- (HLPHelpLoadingView)loadingView;
- (HLPHelpLocale)locale;
- (HLPHelpTopicHistoryItem)currentTopicHistoryItem;
- (HLPHelpTopicViewController)init;
- (HLPHelpTopicViewControllerDelegate)delegate;
- (HLPURLSessionItem)URLSessionItem;
- (NSArray)searchTerms;
- (NSCache)topicCache;
- (NSMutableDictionary)webViewRequestsDataMap;
- (NSMutableDictionary)webViewRequestsMap;
- (NSURL)helpBookURL;
- (WKWebView)webView;
- (_NSRange)rangeFromData:(id)a3 byteRangeString:(id)a4;
- (void)_loadWithInfo:(id)a3;
- (void)_loadWithInfo:(id)a3 allowErrorMessage:(BOOL)a4;
- (void)backButtonTapped;
- (void)cleanup;
- (void)dealloc;
- (void)dismiss;
- (void)forwardButtonTapped;
- (void)helpTopicViewController:(id)a3 failToLoadWithError:(id)a4;
- (void)helpTopicViewController:(id)a3 selectedHelpTopicItem:(id)a4 accessType:(int64_t)a5;
- (void)helpTopicViewControllerContentViewed:(id)a3 topicID:(id)a4 topicTitle:(id)a5 source:(id)a6 interfaceStyle:(int64_t)a7 fromTopicID:(id)a8 externalURLString:(id)a9;
- (void)helpTopicViewControllerCurrentTopicIsPassionPoint:(id)a3;
- (void)helpTopicViewControllerShowHelpBookInfo:(id)a3;
- (void)loadHTMLString:(id)a3 anchor:(id)a4;
- (void)loadHelpTopicItem:(id)a3 searchTerms:(id)a4 anchor:(id)a5;
- (void)loadWithInfo:(id)a3;
- (void)loadWithInfo:(id)a3 allowErrorMessage:(BOOL)a4;
- (void)logAnalyticsContentViewedWithTopicID:(id)a3 topicTitle:(id)a4 source:(id)a5 fromTopicID:(id)a6 externalURLString:(id)a7;
- (void)registerTraitChanges;
- (void)reloadCurrentTopic;
- (void)saveCurrentTopicItem;
- (void)scrollViewDidScroll:(id)a3;
- (void)setCurrentTopicHistoryItem:(id)a3;
- (void)setDarkModeEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayHelpTopicsOnly:(BOOL)a3;
- (void)setFullBookView:(BOOL)a3;
- (void)setHelpBookController:(id)a3;
- (void)setHelpBookURL:(id)a3;
- (void)setHideDoneButton:(BOOL)a3;
- (void)setLoadingView:(id)a3;
- (void)setLocale:(id)a3;
- (void)setSearchTerms:(id)a3;
- (void)setShowTopicNameAsTitle:(BOOL)a3;
- (void)setSingleTopic:(BOOL)a3;
- (void)setSupportsDarkMode:(BOOL)a3;
- (void)setTopicCache:(id)a3;
- (void)setURLSessionItem:(id)a3;
- (void)setWebView:(id)a3;
- (void)setWebViewRequestsDataMap:(id)a3;
- (void)setWebViewRequestsMap:(id)a3;
- (void)showHelpBookInfo:(id)a3;
- (void)showTableOfContent;
- (void)showWebViewDelay;
- (void)updateBackgroundColor;
- (void)updateDoneButton;
- (void)updateHTMLStringPath:(id)a3 tag:(id)a4 attribute:(id)a5;
- (void)updateHTMLStringPath:(id)a3 tag:(id)a4 attribute:(id)a5 useScheme:(BOOL)a6 extension:(id)a7;
- (void)updateNavigationBar;
- (void)updateNavigationButtons;
- (void)updateScrollPositionForCurrentTopicItem;
- (void)updateURLSchemeTask:(id)a3 URL:(id)a4 MIMEType:(id)a5 data:(id)a6 error:(id)a7;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
- (void)webView:(id)a3 startURLSchemeTask:(id)a4;
- (void)webView:(id)a3 stopURLSchemeTask:(id)a4;
@end

@implementation HLPHelpTopicViewController

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D158] object:0];

  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_showWebViewDelay object:0];
  objc_storeWeak((id *)&self->_delegate, 0);
  [(WKWebView *)self->_webView setNavigationDelegate:0];
  v4 = +[HLPURLSessionManager defaultManager];
  [v4 cancelSessionItem:self->_URLSessionItem];

  v5.receiver = self;
  v5.super_class = (Class)HLPHelpTopicViewController;
  [(HLPHelpTopicViewController *)&v5 dealloc];
}

- (HLPHelpTopicViewController)init
{
  v13.receiver = self;
  v13.super_class = (Class)HLPHelpTopicViewController;
  v2 = [(HLPHelpTopicViewController *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    webViewRequestsMap = v2->_webViewRequestsMap;
    v2->_webViewRequestsMap = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    webViewRequestsDataMap = v2->_webViewRequestsDataMap;
    v2->_webViewRequestsDataMap = (NSMutableDictionary *)v5;

    v7 = [MEMORY[0x263F1C408] sharedApplication];
    v2->_RTL = [v7 userInterfaceLayoutDirection] == 1;

    v8 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    topicCache = v2->_topicCache;
    v2->_topicCache = v8;

    [(NSCache *)v2->_topicCache setTotalCostLimit:0x200000];
    uint64_t v10 = [MEMORY[0x263EFFA68] mutableCopy];
    topicHistory = v2->_topicHistory;
    v2->_topicHistory = (NSMutableArray *)v10;
  }
  return v2;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HLPHelpTopicViewController;
  [(HLPHelpTopicViewController *)&v4 viewDidLoad];
  uint64_t v3 = [(HLPHelpTopicViewController *)self webView];
  [v3 setAlpha:0.0];

  [(HLPHelpTopicViewController *)self updateNavigationBar];
  [(HLPHelpTopicViewController *)self updateBackgroundColor];
  [(HLPHelpTopicViewController *)self registerTraitChanges];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)HLPHelpTopicViewController;
  [(HLPHelpTopicViewController *)&v4 viewDidLayoutSubviews];
  uint64_t v3 = [(HLPHelpTopicViewController *)self view];
  [v3 safeAreaInsets];
  -[NSLayoutConstraint setConstant:](self->_loadingViewTopConstraint, "setConstant:");
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)HLPHelpTopicViewController;
  [(HLPHelpTopicViewController *)&v14 viewWillAppear:a3];
  objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];

  uint64_t v5 = [(HLPHelpTopicViewController *)self navigationController];
  v6 = [v5 interactivePopGestureRecognizer];
  v7 = [v6 delegate];
  id interactivePopGestureRecognizerDelegate = self->_interactivePopGestureRecognizerDelegate;
  self->_id interactivePopGestureRecognizerDelegate = v7;

  v9 = [(HLPHelpTopicViewController *)self navigationController];
  uint64_t v10 = [v9 interactivePopGestureRecognizer];
  [v10 setDelegate:self];

  [(HLPHelpTopicViewController *)self updateDoneButton];
  v11 = [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem identifier];
  if ([(HLPHelpTopicViewController *)self fullBookView] && v11)
  {
    v12 = [(HLPHelpBookController *)self->_helpBookController helpTopicItemForID:v11];
    objc_super v13 = [(HLPHelpTopicViewController *)self delegate];
    [v13 helpTopicViewController:self selectedHelpTopicItem:v12 accessType:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HLPHelpTopicViewController;
  [(HLPHelpTopicViewController *)&v4 viewDidAppear:a3];
  self->_canShowTOC = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HLPHelpTopicViewController;
  [(HLPHelpTopicViewController *)&v8 viewWillDisappear:a3];
  [(HLPHelpTopicViewController *)self updateScrollPositionForCurrentTopicItem];
  [(HLPHelpTopicViewController *)self saveCurrentTopicItem];
  id interactivePopGestureRecognizerDelegate = self->_interactivePopGestureRecognizerDelegate;
  uint64_t v5 = [(HLPHelpTopicViewController *)self navigationController];
  v6 = [v5 interactivePopGestureRecognizer];
  [v6 setDelegate:interactivePopGestureRecognizerDelegate];

  id v7 = self->_interactivePopGestureRecognizerDelegate;
  self->_id interactivePopGestureRecognizerDelegate = 0;
}

- (void)setFullBookView:(BOOL)a3
{
  if (self->_fullBookView != a3)
  {
    self->_fullBookView = a3;
    [(HLPHelpTopicViewController *)self updateNavigationBar];
  }
}

- (void)updateNavigationBar
{
  v26[5] = *MEMORY[0x263EF8340];
  if (self->_displayHelpTopicsOnly || [(HLPHelpTopicViewController *)self fullBookView])
  {
    uint64_t v3 = 0;
  }
  else
  {
    v25 = [MEMORY[0x263F1C6B0] systemImageNamed:@"list.bullet"];
    uint64_t v5 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F1C468]) initWithImage:v25 style:0 target:self action:sel_showTableOfContent];
    tocBarButtonItem = self->_tocBarButtonItem;
    self->_tocBarButtonItem = v5;

    id v7 = [MEMORY[0x263F086E0] HLPBundle];
    objc_super v8 = [v7 localizedStringForKey:@"Show Table of Contents" value:&stru_26D29FC58 table:0];
    [(UIBarButtonItem *)self->_tocBarButtonItem setAccessibilityLabel:v8];

    v23 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:6 target:0 action:0];
    [v23 setWidth:*(double *)&gHLPHelpTopicViewSpacerWidth];
    v24 = [MEMORY[0x263F1C6B0] systemImageNamed:@"chevron.backward"];
    v9 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F1C468]) initWithImage:v24 style:0 target:self action:sel_backButtonTapped];
    backBarButtonItem = self->_backBarButtonItem;
    self->_backBarButtonItem = v9;

    [(UIBarButtonItem *)self->_backBarButtonItem setEnabled:0];
    v11 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:6 target:0 action:0];
    [v11 setWidth:*(double *)&gHLPHelpTopicViewSpacerWidth];
    v12 = [MEMORY[0x263F1C6B0] systemImageNamed:@"chevron.forward"];
    objc_super v13 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F1C468]) initWithImage:v12 style:0 target:self action:sel_forwardButtonTapped];
    forwardBarButtonItem = self->_forwardBarButtonItem;
    self->_forwardBarButtonItem = v13;

    [(UIBarButtonItem *)self->_forwardBarButtonItem setEnabled:0];
    v15 = [MEMORY[0x263F086E0] HLPBundle];
    v16 = [v15 localizedStringForKey:@"Back" value:&stru_26D29FC58 table:0];
    [(UIBarButtonItem *)self->_backBarButtonItem setAccessibilityLabel:v16];

    v17 = [MEMORY[0x263F086E0] HLPBundle];
    v18 = [v17 localizedStringForKey:@"Returns to the previously-visited topic." value:&stru_26D29FC58 table:0];
    [(UIBarButtonItem *)self->_backBarButtonItem setAccessibilityHint:v18];

    v19 = [MEMORY[0x263F086E0] HLPBundle];
    v20 = [v19 localizedStringForKey:@"Forward" value:&stru_26D29FC58 table:0];
    [(UIBarButtonItem *)self->_forwardBarButtonItem setAccessibilityLabel:v20];

    v21 = [MEMORY[0x263F086E0] HLPBundle];
    v22 = [v21 localizedStringForKey:@"Navigates forward in the history of visited topics." value:&stru_26D29FC58 table:0];
    [(UIBarButtonItem *)self->_forwardBarButtonItem setAccessibilityHint:v22];

    v26[0] = self->_tocBarButtonItem;
    v26[1] = v23;
    v26[2] = self->_backBarButtonItem;
    v26[3] = v11;
    v26[4] = self->_forwardBarButtonItem;
    uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:5];
  }
  objc_super v4 = [(HLPHelpTopicViewController *)self navigationItem];
  [v4 setLeftBarButtonItems:v3];
}

- (HLPHelpLoadingView)loadingView
{
  loadingView = self->_loadingView;
  if (!loadingView)
  {
    objc_super v4 = [HLPHelpLoadingView alloc];
    uint64_t v5 = -[HLPHelpLoadingView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v6 = self->_loadingView;
    self->_loadingView = v5;

    [(HLPHelpLoadingView *)self->_loadingView setDelegate:self];
    [(HLPHelpLoadingView *)self->_loadingView setSupportsDarkMode:self->_supportsDarkMode];
    [(HLPHelpLoadingView *)self->_loadingView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v7 = [(HLPHelpTopicViewController *)self view];
    [v7 addSubview:self->_loadingView];

    objc_super v8 = [(HLPHelpLoadingView *)self->_loadingView topAnchor];
    v9 = [(HLPHelpTopicViewController *)self view];
    uint64_t v10 = [v9 topAnchor];
    v11 = [v8 constraintEqualToAnchor:v10];
    loadingViewTopConstraint = self->_loadingViewTopConstraint;
    self->_loadingViewTopConstraint = v11;

    [(NSLayoutConstraint *)self->_loadingViewTopConstraint setActive:1];
    objc_super v13 = [(HLPHelpLoadingView *)self->_loadingView bottomAnchor];
    objc_super v14 = [(HLPHelpTopicViewController *)self view];
    v15 = [v14 bottomAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    v17 = [(HLPHelpLoadingView *)self->_loadingView leadingAnchor];
    v18 = [(HLPHelpTopicViewController *)self view];
    v19 = [v18 leadingAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    [v20 setActive:1];

    v21 = [(HLPHelpLoadingView *)self->_loadingView trailingAnchor];
    v22 = [(HLPHelpTopicViewController *)self view];
    v23 = [v22 trailingAnchor];
    v24 = [v21 constraintEqualToAnchor:v23];
    [v24 setActive:1];

    loadingView = self->_loadingView;
  }
  return loadingView;
}

- (WKWebView)webView
{
  webView = self->_webView;
  if (!webView)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F1FA60]);
    [v4 setAllowsInlineMediaPlayback:1];
    [v4 setURLSchemeHandler:self forURLScheme:@"apple-help-local"];
    [v4 setURLSchemeHandler:self forURLScheme:@"apple-help-remote-asset"];
    id v5 = objc_alloc(MEMORY[0x263F1FA58]);
    v6 = (WKWebView *)objc_msgSend(v5, "initWithFrame:configuration:", v4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v7 = self->_webView;
    self->_webView = v6;

    [(WKWebView *)self->_webView setNavigationDelegate:self];
    objc_super v8 = [(WKWebView *)self->_webView scrollView];
    [v8 setDelegate:self];

    [(WKWebView *)self->_webView setAllowsLinkPreview:0];
    [(WKWebView *)self->_webView setTranslatesAutoresizingMaskIntoConstraints:0];
    if (+[HLPCommonDefines isVisionOS]) {
      [(WKWebView *)self->_webView setOpaque:0];
    }
    v9 = [(HLPHelpTopicViewController *)self view];
    [v9 addSubview:self->_webView];

    uint64_t v10 = [(WKWebView *)self->_webView leadingAnchor];
    v11 = [(HLPHelpTopicViewController *)self view];
    v12 = [v11 leadingAnchor];
    objc_super v13 = [v10 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    objc_super v14 = [(WKWebView *)self->_webView trailingAnchor];
    v15 = [(HLPHelpTopicViewController *)self view];
    v16 = [v15 trailingAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    v18 = [(WKWebView *)self->_webView topAnchor];
    v19 = [(HLPHelpTopicViewController *)self view];
    v20 = [v19 topAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    v22 = [(WKWebView *)self->_webView bottomAnchor];
    v23 = [(HLPHelpTopicViewController *)self view];
    v24 = [v23 bottomAnchor];
    v25 = [v22 constraintEqualToAnchor:v24];
    [v25 setActive:1];

    webView = self->_webView;
  }
  return webView;
}

- (void)cleanup
{
  v2 = [(HLPHelpTopicViewController *)self navigationItem];
  [v2 setLeftBarButtonItems:0];

  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v3 removeObjectForKey:kHLPHelpTopicViewControllerLastTopicHistoryItem];
}

- (void)setSupportsDarkMode:(BOOL)a3
{
  if (self->_supportsDarkMode != a3) {
    self->_supportsDarkMode = a3;
  }
  [(HLPHelpTopicViewController *)self updateBackgroundColor];
}

- (void)updateBackgroundColor
{
  if (self->_supportsDarkMode)
  {
    if (+[HLPCommonDefines isVisionOS]) {
      [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
    }
    else {
    id v6 = [MEMORY[0x263F1C550] systemBackgroundColor];
    }
    id v5 = [(HLPHelpTopicViewController *)self view];
    [v5 setBackgroundColor:v6];

    [(WKWebView *)self->_webView setBackgroundColor:v6];
  }
  else
  {
    id v3 = [MEMORY[0x263F1C550] whiteColor];
    id v4 = [(HLPHelpTopicViewController *)self view];
    [v4 setBackgroundColor:v3];

    id v6 = [MEMORY[0x263F1C550] clearColor];
    [(WKWebView *)self->_webView setBackgroundColor:v6];
  }
}

- (void)setHideDoneButton:(BOOL)a3
{
  self->_hideDoneButton = a3;
  [(HLPHelpTopicViewController *)self updateDoneButton];
}

- (void)updateDoneButton
{
  if ([(HLPHelpTopicViewController *)self isViewLoaded])
  {
    if (self->_hideDoneButton) {
      id v4 = 0;
    }
    else {
      id v4 = (id)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel_dismiss];
    }
    id v3 = [(HLPHelpTopicViewController *)self navigationItem];
    [v3 setRightBarButtonItem:v4];
  }
}

- (void)backButtonTapped
{
  id v3 = +[HLPLoadInfo infoWithTopicItem:0 accesstype:2 searchTerms:0 anchor:0];
  [(HLPHelpTopicViewController *)self _loadWithInfo:v3];
}

- (void)forwardButtonTapped
{
  id v3 = +[HLPLoadInfo infoWithTopicItem:0 accesstype:3 searchTerms:0 anchor:0];
  [(HLPHelpTopicViewController *)self _loadWithInfo:v3];
}

- (void)updateScrollPositionForCurrentTopicItem
{
  id v3 = [(WKWebView *)self->_webView scrollView];
  [v3 contentSize];
  -[HLPHelpTopicHistoryItem setContentSize:](self->_currentTopicHistoryItem, "setContentSize:");

  id v4 = [(WKWebView *)self->_webView scrollView];
  [v4 contentOffset];
  -[HLPHelpTopicHistoryItem setContentOffset:](self->_currentTopicHistoryItem, "setContentOffset:");
}

- (void)updateNavigationButtons
{
  if ([(NSMutableArray *)self->_topicHistory count])
  {
    id v3 = [(NSMutableArray *)self->_topicHistory firstObject];
    [(UIBarButtonItem *)self->_backBarButtonItem setEnabled:v3 != self->_currentTopicHistoryItem];
  }
  else
  {
    [(UIBarButtonItem *)self->_backBarButtonItem setEnabled:0];
  }
  if ([(NSMutableArray *)self->_topicHistory count])
  {
    id v5 = [(NSMutableArray *)self->_topicHistory lastObject];
    [(UIBarButtonItem *)self->_forwardBarButtonItem setEnabled:v5 != self->_currentTopicHistoryItem];
  }
  else
  {
    forwardBarButtonItem = self->_forwardBarButtonItem;
    [(UIBarButtonItem *)forwardBarButtonItem setEnabled:0];
  }
}

- (void)showTableOfContent
{
  if (self->_canShowTOC)
  {
    if ([(UIBarButtonItem *)self->_tocBarButtonItem isEnabled])
    {
      id v3 = [(HLPHelpTopicViewController *)self delegate];
      char v4 = objc_opt_respondsToSelector();

      if (v4)
      {
        self->_canShowTOC = 0;
        id v5 = [(HLPHelpTopicViewController *)self delegate];
        [v5 helpTopicViewControllerTableOfContentButtonTapped:self];
      }
    }
  }
}

- (void)dismiss
{
  id v3 = [(HLPHelpTopicViewController *)self delegate];
  [v3 helpTopicViewControllerDoneButtonTapped:self];
}

- (void)logAnalyticsContentViewedWithTopicID:(id)a3 topicTitle:(id)a4 source:(id)a5 fromTopicID:(id)a6 externalURLString:(id)a7
{
  id v21 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [(HLPHelpTopicViewController *)self traitCollection];
  v17 = +[HLPAnalyticsEventContentViewed eventWithTopicID:topicTitle:source:interfaceStyle:](HLPAnalyticsEventContentViewed, "eventWithTopicID:topicTitle:source:interfaceStyle:", v21, v12, v13, [v16 userInterfaceStyle]);

  if ([v14 length])
  {
    v18 = [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem identifier];
    [v17 setFromTopicID:v18];
  }
  if ([v15 length]) {
    [v17 setExternalURLString:v15];
  }
  [v17 log];
  v19 = [(HLPHelpTopicViewController *)self delegate];
  v20 = [(HLPHelpTopicViewController *)self traitCollection];
  objc_msgSend(v19, "helpTopicViewControllerContentViewed:topicID:topicTitle:source:interfaceStyle:fromTopicID:externalURLString:", self, v21, v12, v13, objc_msgSend(v20, "userInterfaceStyle"), v14, v15);
}

- (void)saveCurrentTopicItem
{
  helpBookController = self->_helpBookController;
  char v4 = [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem identifier];
  id v5 = [(HLPHelpBookController *)helpBookController helpTopicItemForID:v4];

  if (([v5 isGlossary] & 1) == 0)
  {
    currentTopicHistoryItem = self->_currentTopicHistoryItem;
    if (currentTopicHistoryItem)
    {
      id v11 = 0;
      id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:currentTopicHistoryItem requiringSecureCoding:1 error:&v11];
      id v8 = v11;
      if (v8)
      {
LABEL_7:

        goto LABEL_8;
      }
    }
    else
    {
      id v7 = 0;
    }
    v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v9 setObject:v7 forKey:kHLPHelpTopicViewControllerLastTopicHistoryItem];

    uint64_t v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v10 synchronize];

    id v8 = 0;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)setDarkModeEnabled:(BOOL)a3
{
  if (self->_darkModeEnabled != a3)
  {
    self->_darkModeEnabled = a3;
    if (a3 && !self->_supportsDarkMode) {
      [(HLPHelpTopicViewController *)self setSupportsDarkMode:1];
    }
  }
}

- (void)reloadCurrentTopic
{
  helpBookController = self->_helpBookController;
  char v4 = [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem identifier];
  id v7 = [(HLPHelpBookController *)helpBookController helpTopicItemForID:v4];

  id v5 = [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem anchor];
  id v6 = +[HLPLoadInfo infoWithTopicItem:v7 accesstype:4 searchTerms:0 anchor:v5];
  [(HLPHelpTopicViewController *)self _loadWithInfo:v6];
}

- (void)loadWithInfo:(id)a3
{
}

- (void)loadWithInfo:(id)a3 allowErrorMessage:(BOOL)a4
{
  BOOL v4 = a4;
  topicHistory = self->_topicHistory;
  id v8 = a3;
  if ([(NSMutableArray *)topicHistory count])
  {
    [(UIBarButtonItem *)self->_tocBarButtonItem setEnabled:1];
  }
  else
  {
    id v7 = [v8 helpTopicItem];
    [(UIBarButtonItem *)self->_tocBarButtonItem setEnabled:v7 != 0];
  }
  [(HLPHelpTopicViewController *)self _loadWithInfo:v8 allowErrorMessage:v4];
}

- (void)loadHelpTopicItem:(id)a3 searchTerms:(id)a4 anchor:(id)a5
{
  id v6 = +[HLPLoadInfo infoWithTopicItem:a3 accesstype:0 searchTerms:a4 anchor:a5];
  [(HLPHelpTopicViewController *)self loadWithInfo:v6];
}

- (void)_loadWithInfo:(id)a3
{
}

- (void)_loadWithInfo:(id)a3 allowErrorMessage:(BOOL)a4
{
  BOOL v92 = a4;
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 helpTopicItem];
  id obj = [v5 searchTerms];
  v95 = [v5 anchor];
  uint64_t v93 = [v5 accessType];
  id v7 = HLPLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v106 = v6;
    _os_log_impl(&dword_220BD8000, v7, OS_LOG_TYPE_DEFAULT, "Loading topic %@", buf, 0xCu);
  }

  if (!self->_helpBookURL)
  {
    v9 = [(HLPHelpTopicViewController *)self loadingView];
    [(HLPHelpTopicViewController *)v9 showActivityIndicator:1];
LABEL_67:

    goto LABEL_68;
  }
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_showWebViewDelay object:0];
  BOOL v8 = self->_displayHelpTopicsOnly || +[HLPCommonDefines isVisionOS];
  if (v8 && v93 == 1)
  {
    uint64_t v10 = [v6 identifier];
    id v11 = [v6 name];
    id v12 = [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem identifier];
    [(HLPHelpTopicViewController *)self logAnalyticsContentViewedWithTopicID:v10 topicTitle:v11 source:@"link" fromTopicID:v12 externalURLString:&stru_26D29FC58];

    v9 = objc_alloc_init(HLPHelpTopicViewController);
    [(HLPHelpTopicViewController *)v9 setDisplayHelpTopicsOnly:self->_displayHelpTopicsOnly];
    if ([v6 isGlossary])
    {
      id v13 = [MEMORY[0x263F086E0] HLPBundle];
      id v14 = [v13 localizedStringForKey:@"Glossary" value:&stru_26D29FC58 table:0];
      [(HLPHelpTopicViewController *)v9 setTitle:v14];
    }
    else
    {
      if (!self->_showTopicNameAsTitle)
      {
LABEL_34:
        v33 = [(HLPHelpTopicViewController *)self navigationController];
        [v33 pushViewController:v9 animated:1];

        [(HLPHelpTopicViewController *)v9 setFullBookView:self->_fullBookView];
        [(HLPHelpTopicViewController *)v9 setHideDoneButton:self->_hideDoneButton];
        [(HLPHelpTopicViewController *)v9 setHelpBookController:self->_helpBookController];
        [(HLPHelpTopicViewController *)v9 setShowTopicNameAsTitle:self->_showTopicNameAsTitle];
        [(HLPHelpTopicViewController *)v9 setSingleTopic:self->_singleTopic];
        [(HLPHelpTopicViewController *)v9 setDelegate:self];
        [(HLPHelpTopicViewController *)v9 setHelpBookURL:self->_helpBookURL];
        [(HLPHelpTopicViewController *)v9 setSupportsDarkMode:self->_supportsDarkMode];
        [(HLPHelpTopicViewController *)v9 loadHelpTopicItem:v6 searchTerms:0 anchor:v95];
        goto LABEL_67;
      }
      uint64_t v31 = [v6 name];
      id v13 = (void *)v31;
      if (v31) {
        v32 = (__CFString *)v31;
      }
      else {
        v32 = &stru_26D29FC58;
      }
      [(HLPHelpTopicViewController *)v9 setTitle:v32];
    }

    goto LABEL_34;
  }
  char v15 = !v8;
  if (v93 != 5) {
    char v15 = 1;
  }
  if (v15)
  {
    if ((unint64_t)(v93 + 1) > 7) {
      goto LABEL_43;
    }
    if (((1 << (v93 + 1)) & 0xC7) == 0)
    {
      if (v93 == 2)
      {
        unint64_t v87 = [(NSMutableArray *)self->_topicHistory indexOfObject:self->_currentTopicHistoryItem]
            - 1;
        if (v87 > 0x7FFFFFFFFFFFFFFDLL) {
          goto LABEL_43;
        }
        [(HLPHelpTopicViewController *)self updateScrollPositionForCurrentTopicItem];
        v88 = [(NSMutableArray *)self->_topicHistory objectAtIndexedSubscript:v87];
        currentTopicHistoryItem = self->_currentTopicHistoryItem;
        self->_currentTopicHistoryItem = v88;

        helpBookController = self->_helpBookController;
        v91 = [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem identifier];
        uint64_t v72 = [(HLPHelpBookController *)helpBookController helpTopicItemForID:v91];

        uint64_t v73 = [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem anchor];
      }
      else
      {
        if (v93 != 3) {
          goto LABEL_43;
        }
        uint64_t v67 = [(NSMutableArray *)self->_topicHistory indexOfObject:self->_currentTopicHistoryItem];
        if (v67 == 0x7FFFFFFFFFFFFFFFLL
          || v67 + 1 >= (unint64_t)[(NSMutableArray *)self->_topicHistory count])
        {
          goto LABEL_43;
        }
        [(HLPHelpTopicViewController *)self updateScrollPositionForCurrentTopicItem];
        v68 = [(NSMutableArray *)self->_topicHistory objectAtIndexedSubscript:v67 + 1];
        v69 = self->_currentTopicHistoryItem;
        self->_currentTopicHistoryItem = v68;

        v70 = self->_helpBookController;
        v71 = [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem identifier];
        uint64_t v72 = [(HLPHelpBookController *)v70 helpTopicItemForID:v71];

        uint64_t v73 = [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem anchor];
      }
      v95 = (void *)v73;
      id v6 = (void *)v72;
      goto LABEL_43;
    }
  }
  else
  {
    v16 = [(HLPHelpTopicViewController *)self navigationController];
    id v17 = (id)[v16 popToRootViewControllerAnimated:0];
  }
  v18 = [v6 identifier];
  v19 = [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem identifier];
  int v20 = [v18 isEqualToString:v19];

  if (!v20
    || ([(HLPHelpTopicViewController *)self searchTerms],
        id v21 = (id)objc_claimAutoreleasedReturnValue(),
        BOOL v22 = v21 == obj,
        v21,
        !v22))
  {
    if (v93 == 1)
    {
      [(HLPHelpTopicViewController *)self updateScrollPositionForCurrentTopicItem];
      v23 = [v6 identifier];
      v24 = [v6 name];
      v25 = [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem identifier];
      [(HLPHelpTopicViewController *)self logAnalyticsContentViewedWithTopicID:v23 topicTitle:v24 source:@"link" fromTopicID:v25 externalURLString:&stru_26D29FC58];

      [v5 setAnalyticsLogged:1];
    }
    uint64_t v26 = [(NSMutableArray *)self->_topicHistory indexOfObject:self->_currentTopicHistoryItem];
    if (v26 != 0x7FFFFFFFFFFFFFFFLL && (unint64_t)[(NSMutableArray *)self->_topicHistory count] >= 2)
    {
      unint64_t v27 = v26 + 1;
      if ([(NSMutableArray *)self->_topicHistory count] > v27)
      {
        uint64_t v28 = [(NSMutableArray *)self->_topicHistory count];
        v29 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v27, v28 - v27);
        [(NSMutableArray *)self->_topicHistory removeObjectsAtIndexes:v29];
      }
    }
    v30 = self->_currentTopicHistoryItem;
    if (v30)
    {
      self->_currentTopicHistoryItem = 0;
    }
    else
    {
      v34 = [MEMORY[0x263EFFA40] standardUserDefaults];
      v30 = [v34 objectForKey:kHLPHelpTopicViewControllerLastTopicHistoryItem];

      if (v30)
      {
        v35 = (void *)MEMORY[0x263EFFA08];
        uint64_t v36 = objc_opt_class();
        v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
        id v104 = 0;
        v38 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v37 fromData:v30 error:&v104];
        id v39 = v104;
        v40 = self->_currentTopicHistoryItem;
        self->_currentTopicHistoryItem = v38;
      }
      v41 = [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem identifier];
      v42 = [v6 identifier];
      char v43 = [v41 isEqualToString:v42];

      if ((v43 & 1) == 0)
      {
        v44 = self->_currentTopicHistoryItem;
        self->_currentTopicHistoryItem = 0;
      }
    }

    if (v6)
    {
      v45 = self->_currentTopicHistoryItem;
      if (!v45)
      {
        v46 = objc_alloc_init(HLPHelpTopicHistoryItem);
        v47 = [v6 identifier];
        [(HLPHelpTopicHistoryItem *)v46 setIdentifier:v47];

        v48 = [v6 name];
        [(HLPHelpTopicHistoryItem *)v46 setName:v48];

        [(HLPHelpTopicHistoryItem *)v46 setAnchor:v95];
        v49 = self->_currentTopicHistoryItem;
        self->_currentTopicHistoryItem = v46;

        v45 = self->_currentTopicHistoryItem;
      }
      [(NSMutableArray *)self->_topicHistory addObject:v45];
    }
LABEL_43:
    objc_storeStrong((id *)&self->_searchTerms, obj);
    topicCache = self->_topicCache;
    v51 = [v6 identifier];
    v9 = [(NSCache *)topicCache objectForKey:v51];

    self->_webViewLoaded = 0;
    v52 = [(HLPHelpTopicViewController *)self webView];
    [v52 setAlpha:0.0];

    if ([(HLPHelpTopicViewController *)v9 length])
    {
      [(HLPHelpTopicViewController *)self loadHTMLString:v9 anchor:v95];
      goto LABEL_65;
    }
    objc_initWeak((id *)buf, self);
    if (![(HLPHelpBookController *)self->_helpBookController serverType])
    {
      v53 = [v6 hrefID];
      BOOL v54 = [v53 length] == 0;

      if (v54)
      {
        if (!v92) {
          goto LABEL_64;
        }
        v82 = [(HLPHelpTopicViewController *)self loadingView];
        [v82 showDefaultErrorMessage];
LABEL_63:

LABEL_64:
        objc_destroyWeak((id *)buf);
LABEL_65:
        v83 = [(HLPHelpTopicViewController *)self delegate];
        [v83 helpTopicViewController:self selectedHelpTopicItem:v6 accessType:v93];

        [(HLPHelpTopicViewController *)self updateNavigationButtons];
        [(HLPHelpTopicViewController *)self saveCurrentTopicItem];
        if (([v5 analyticsLogged] & 1) == 0)
        {
          v84 = [v6 identifier];
          v85 = [v6 name];
          v86 = [v5 analyticsSourceType];
          [(HLPHelpTopicViewController *)self logAnalyticsContentViewedWithTopicID:v84 topicTitle:v85 source:v86 fromTopicID:&stru_26D29FC58 externalURLString:&stru_26D29FC58];
        }
        goto LABEL_67;
      }
    }
    v55 = [(HLPHelpTopicViewController *)self loadingView];
    [v55 showActivityIndicator:1];

    if ([(HLPHelpBookController *)self->_helpBookController serverType])
    {
      v56 = NSString;
      v57 = [(HLPHelpBookController *)self->_helpBookController topicPathFormat];
      v58 = [v6 identifier];
      v59 = objc_msgSend(v56, "stringWithFormat:", v57, v58);

      v60 = [NSURL URLWithString:v59];
      if (v60)
      {
        v61 = [MEMORY[0x263F089E0] requestWithURL:v60];
        v62 = +[HLPCommonDefines contentRequestHeaderFields];
        if (v62)
        {
          [v61 setCachePolicy:1];
          [v61 setAllHTTPHeaderFields:v62];
        }
        v63 = +[HLPJSONCacheController sharedInstance];
        v64 = [v6 identifier];
        v96[0] = MEMORY[0x263EF8330];
        v96[1] = 3221225472;
        v96[2] = __62__HLPHelpTopicViewController__loadWithInfo_allowErrorMessage___block_invoke_2;
        v96[3] = &unk_264579428;
        objc_copyWeak(&v99, (id *)buf);
        id v97 = v6;
        id v98 = v95;
        v65 = [v63 formattedDataForRequest:v61 identifier:v64 completionHandler:v96];
        URLSessionItem = self->_URLSessionItem;
        self->_URLSessionItem = v65;

        objc_destroyWeak(&v99);
      }
    }
    else
    {
      v75 = [v6 hrefID];

      if (!v75)
      {
LABEL_62:
        v82 = +[HLPURLSessionManager defaultManager];
        [v82 resumeSessionItem:self->_URLSessionItem];
        goto LABEL_63;
      }
      helpBookURL = self->_helpBookURL;
      v77 = [v6 hrefID];
      v59 = [(NSURL *)helpBookURL URLByAppendingPathComponent:v77];

      v60 = [MEMORY[0x263F08BD8] requestWithURL:v59];
      v78 = +[HLPStringCacheController sharedInstance];
      v79 = [v6 hrefID];
      v100[0] = MEMORY[0x263EF8330];
      v100[1] = 3221225472;
      v100[2] = __62__HLPHelpTopicViewController__loadWithInfo_allowErrorMessage___block_invoke;
      v100[3] = &unk_264579400;
      objc_copyWeak(&v103, (id *)buf);
      id v101 = v95;
      id v102 = v6;
      v80 = [v78 formattedDataForRequest:v60 identifier:v79 completionHandler:v100];
      v81 = self->_URLSessionItem;
      self->_URLSessionItem = v80;

      objc_destroyWeak(&v103);
    }

    goto LABEL_62;
  }
  if (v95)
  {
    [NSString stringWithFormat:@"window.location.hash='#%@'", v95];
    v9 = (HLPHelpTopicViewController *)objc_claimAutoreleasedReturnValue();
    v74 = [(HLPHelpTopicViewController *)self webView];
    [v74 evaluateJavaScript:v9 completionHandler:0];

    goto LABEL_67;
  }
LABEL_68:
}

void __62__HLPHelpTopicViewController__loadWithInfo_allowErrorMessage___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v16 = a2;
  id v9 = a3;
  id v10 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v12 = [WeakRetained delegate];

  if (v12)
  {
    if (!v16 || v10)
    {
      char v15 = [WeakRetained delegate];
      [v15 helpTopicViewController:WeakRetained failToLoadWithError:v10];
    }
    else
    {
      [WeakRetained loadHTMLString:v16 anchor:*(void *)(a1 + 32)];
      id v13 = [WeakRetained topicCache];
      id v14 = [*(id *)(a1 + 40) identifier];
      objc_msgSend(v13, "setObject:forKey:cost:", v16, v14, objc_msgSend(v9, "length"));

      char v15 = [WeakRetained delegate];
      [v15 helpTopicViewController:WeakRetained topicLoaded:*(void *)(a1 + 40)];
    }
  }
  [WeakRetained setURLSessionItem:0];
}

void __62__HLPHelpTopicViewController__loadWithInfo_allowErrorMessage___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v10 = a2;
  id v45 = a3;
  id v44 = a5;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v13 = [WeakRetained delegate];

  if (v13)
  {
    if (v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v23 = [WeakRetained delegate];
      [v23 helpTopicViewController:WeakRetained failToLoadWithError:v11];
    }
    else
    {
      id v14 = [v10 objectForKeyedSubscript:@"bookResponse"];
      char v15 = [v14 objectForKeyedSubscript:@"articles"];
      id v16 = [v15 firstObject];
      v42 = v14;

      char v43 = v16;
      id v17 = [v16 objectForKeyedSubscript:@"categoryInfo"];
      v18 = [v17 objectForKeyedSubscript:@"categories"];

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v47;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v47 != v21) {
              objc_enumerationMutation(v19);
            }
            if ([*(id *)(*((void *)&v46 + 1) + 8 * i) containsString:@"passionpoints"])
            {
              [*(id *)(a1 + 32) setCategories:&unk_26D2A85B0];
              v24 = [WeakRetained delegate];
              [v24 helpTopicViewControllerCurrentTopicIsPassionPoint:WeakRetained];

              goto LABEL_16;
            }
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v50 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }
LABEL_16:

      v25 = [v43 objectForKeyedSubscript:@"content"];
      v41 = [v25 objectForKeyedSubscript:@"sections"];

      v40 = [v42 objectForKeyedSubscript:@"title"];
      uint64_t v26 = [v41 firstObject];
      id v39 = [v26 objectForKeyedSubscript:@"text"];

      unint64_t v27 = [WeakRetained helpBookController];
      uint64_t v28 = [v27 locale];
      v29 = [v28 isoCodes];
      uint64_t v30 = [v29 firstObject];
      uint64_t v31 = (void *)v30;
      v32 = @"en";
      if (v30) {
        v32 = (__CFString *)v30;
      }
      v33 = v32;

      v34 = [NSString stringWithFormat:@"<html lang=\"%@\"><head><meta charset=\"UTF-8\"><title>%@</title></head>", v33, v40];
      v35 = [NSString stringWithFormat:@"%@%@</html>", v34, v39];

      [WeakRetained loadHTMLString:v35 anchor:*(void *)(a1 + 40)];
      uint64_t v36 = [WeakRetained topicCache];
      v37 = [*(id *)(a1 + 32) identifier];
      objc_msgSend(v36, "setObject:forKey:cost:", v35, v37, objc_msgSend(v45, "length"));

      v38 = [WeakRetained delegate];
      [v38 helpTopicViewController:WeakRetained topicLoaded:*(void *)(a1 + 32)];
    }
  }
  [WeakRetained setURLSessionItem:0];
}

- (void)loadHTMLString:(id)a3 anchor:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v75 = v6;
    id v7 = a3;
    BOOL v8 = [(HLPHelpTopicViewController *)self webViewRequestsDataMap];
    [v8 removeAllObjects];

    -[HLPHelpTopicViewController setDarkModeEnabled:](self, "setDarkModeEnabled:", [v7 containsString:@"dark-mode-enabled"]);
    id v9 = [MEMORY[0x263F086E0] HLPBundle];
    id v10 = [MEMORY[0x263F089D8] stringWithString:v7];

    if ([(HLPHelpBookController *)self->_helpBookController contentFormatVersion] <= 4) {
      id v11 = @"app_old";
    }
    else {
      id v11 = @"app";
    }
    id v12 = [v9 URLForResource:v11 withExtension:@"css"];
    id v13 = [NSString stringWithContentsOfURL:v12 encoding:4 error:0];
    if ([(HLPHelpTopicViewController *)self supportsDarkMode]
      || [(HLPHelpTopicViewController *)self supportsDarkMode])
    {
      uint64_t v14 = [@":root{color-scheme:light dark}" stringByAppendingString:v13];

      id v13 = (void *)v14;
    }
    v74 = v12;
    char v15 = [v12 absoluteString];
    uint64_t v16 = [v15 stringByDeletingLastPathComponent];

    uint64_t v73 = (void *)v16;
    id v17 = objc_msgSend(NSString, "stringWithFormat:", @"background-image: url(%@/"), v16;
    uint64_t v18 = objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", @"background-image: url(./"), v17;

    uint64_t v72 = (void *)v18;
    objc_msgSend(NSString, "stringWithFormat:", @"<meta name='viewport' content='width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0'><style type=\"text/css\">%@</style></head>",
    v71 = v18);
    uint64_t v19 = [v10 rangeOfString:@"</head>"];
    uint64_t v21 = v20;
    uint64_t v22 = [v10 rangeOfString:@"<body"];
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v24 = v22;
      uint64_t v25 = v23;
      uint64_t v26 = objc_msgSend(v10, "rangeOfString:options:range:", @">", 0, v22 + v23, objc_msgSend(v10, "length") - (v22 + v23));
      if (v26 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v28 = v26;
        uint64_t v29 = v27;
        uint64_t v69 = v21;
        uint64_t v67 = v19;
        uint64_t v30 = [MEMORY[0x263F1C5C0] currentDevice];
        uint64_t v31 = [v30 userInterfaceIdiom];

        v32 = @"phone";
        if (v31 == 6) {
          v32 = @"vision";
        }
        if (v31 == 1) {
          v33 = @"pad";
        }
        else {
          v33 = v32;
        }
        uint64_t v70 = objc_msgSend(v10, "rangeOfString:options:range:", @"class=\"", 0, v24, v29 - v24 + v28);
        uint64_t v65 = v34;
        v66 = v33;
        if (v75)
        {
          uint64_t v35 = [NSString stringWithFormat:@"data-anchorId=%@", v75];
        }
        else
        {
          uint64_t v35 = 0;
        }
        uint64_t v36 = [(HLPHelpLocale *)self->_locale isoCodes];
        v37 = [v36 firstObject];

        if (v37)
        {
          v38 = NSString;
          id v39 = [(HLPHelpLocale *)self->_locale isoCodes];
          v40 = [v39 firstObject];
          uint64_t v68 = [v38 stringWithFormat:@"data-locale=\"%@\"", v40];
        }
        else
        {
          uint64_t v68 = 0;
        }
        uint64_t v21 = v69;
        v41 = (void *)v35;
        if (v70 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v42 = [MEMORY[0x263F089D8] stringWithFormat:@"%@ class=\"%@", @"<body", v66];
          [v42 appendString:@"\""];
          char v43 = (void *)v68;
          if (v68) {
            [v42 appendFormat:@" %@", v68];
          }
          uint64_t v19 = v67;
          if (v41) {
            [v42 appendFormat:@" %@", v41];
          }
          if (self->_fullBookView) {
            [v42 appendFormat:@" %@", @"hide-toc-button"];
          }
          if (self->_supportsDarkMode) {
            [v42 appendFormat:@" %@", @"dark-mode-supported"];
          }
          if (self->_singleTopic) {
            [v42 appendFormat:@" %@", @"single-topic"];
          }
          id v44 = @"<body";
          id v45 = v10;
          long long v46 = v42;
          uint64_t v47 = v24;
          uint64_t v48 = v25;
        }
        else
        {
          long long v49 = [NSString stringWithFormat:@"%@%@ ", @"class=\"", v66];
          v42 = v49;
          if (self->_supportsDarkMode)
          {
            uint64_t v50 = [v49 stringByAppendingFormat:@"%@ ", @"dark-mode-supported"];

            v42 = (void *)v50;
          }
          uint64_t v19 = v67;
          if (self->_fullBookView)
          {
            uint64_t v51 = [NSString stringWithFormat:@"%@%@ ", v42, @"hide-toc-button"];

            v42 = (void *)v51;
          }
          if (self->_singleTopic)
          {
            uint64_t v52 = [NSString stringWithFormat:@"%@%@ ", v42, @"single-topic"];

            v42 = (void *)v52;
          }
          if (v68)
          {
            uint64_t v53 = [NSString stringWithFormat:@"%@ %@", v68, v42];

            v42 = (void *)v53;
          }
          if (v41)
          {
            uint64_t v54 = [NSString stringWithFormat:@"%@ %@", v41, v42];

            v42 = (void *)v54;
          }
          char v43 = (void *)v68;
          uint64_t v21 = v69;
          uint64_t v48 = v65;
          id v44 = @"class=\"";
          id v45 = v10;
          long long v46 = v42;
          uint64_t v47 = v70;
        }
        objc_msgSend(v45, "replaceOccurrencesOfString:withString:options:range:", v44, v46, 0, v47, v48);
      }
    }
    if (v19 != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v10, "replaceCharactersInRange:withString:", v19, v21, v71);
    }
    if (+[HLPCommonDefines isInternalBuild]
      || [(NSURL *)self->_helpBookURL isFileURL])
    {
      [(HLPHelpTopicViewController *)self updateHTMLStringPath:v10 tag:@"<img" attribute:@"src=\""];
      [(HLPHelpTopicViewController *)self updateHTMLStringPath:v10 tag:@"<video" attribute:@"poster=\""];
      [(HLPHelpTopicViewController *)self updateHTMLStringPath:v10 tag:@"<source" attribute:@"srcset=\""];
      [(HLPHelpTopicViewController *)self updateHTMLStringPath:v10 tag:@"<source" attribute:@"src=\" useScheme:1 extension:@"mp4""];
    }
    uint64_t v55 = [v10 rangeOfString:@"</html>" options:4];
    if (v55 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v57 = v55;
      uint64_t v58 = v56;
      v59 = [v9 URLForResource:@"app" withExtension:@"js"];
      v60 = [NSString stringWithContentsOfURL:v59 encoding:4 error:0];
      v61 = [NSString stringWithFormat:@"<script>%@</script></html>", v60];
      objc_msgSend(v10, "replaceCharactersInRange:withString:", v57, v58, v61);
    }
    v62 = [(HLPHelpTopicViewController *)self webView];
    v63 = [v9 bundleURL];
    id v64 = (id)[v62 loadHTMLString:v10 baseURL:v63];

    id v6 = v75;
  }
}

- (void)updateHTMLStringPath:(id)a3 tag:(id)a4 attribute:(id)a5
{
}

- (void)updateHTMLStringPath:(id)a3 tag:(id)a4 attribute:(id)a5 useScheme:(BOOL)a6 extension:(id)a7
{
  BOOL v8 = a6;
  id v41 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v15 = [v41 rangeOfString:v12];
  uint64_t v17 = v16;
  BOOL v18 = [(NSURL *)self->_helpBookURL isFileURL];
  v40 = self;
  helpBookURL = self->_helpBookURL;
  if (v18) {
    [(NSURL *)helpBookURL path];
  }
  else {
  uint64_t v20 = [(NSURL *)helpBookURL absoluteString];
  }
  uint64_t v21 = [(HLPHelpBookController *)v40->_helpBookController serverType];
  if (v20) {
    BOOL v22 = v15 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v22 = 1;
  }
  if (!v22)
  {
    BOOL v23 = v21 == 1 && v8;
    BOOL v39 = v23;
    while (1)
    {
      uint64_t v24 = v15 + v17;
      uint64_t v25 = objc_msgSend(v41, "rangeOfString:options:range:", v13, 0, v24, objc_msgSend(v41, "length") - v24);
      if (v25 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
LABEL_30:
      uint64_t v15 = objc_msgSend(v41, "rangeOfString:options:range:", v12, 0, v24, objc_msgSend(v41, "length") - v24);
      uint64_t v17 = v38;
      if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_31;
      }
    }
    uint64_t v27 = v25 + v26;
    uint64_t v28 = objc_msgSend(v41, "rangeOfString:options:range:", @"\", 0, v27, objc_msgSend(v41, "length"") - v27);
    uint64_t v29 = v28 - v27;
    uint64_t v30 = objc_msgSend(v41, "substringWithRange:", v27, v28 - v27);
    uint64_t v31 = v30;
    if (v14)
    {
      v32 = [v30 pathExtension];
      int v33 = [v32 isEqualToString:v14];
    }
    else
    {
      int v33 = 1;
    }
    if ([v31 length]) {
      BOOL v34 = v33 == 0;
    }
    else {
      BOOL v34 = 1;
    }
    if (v34)
    {
LABEL_29:

      goto LABEL_30;
    }
    if ([(NSURL *)v40->_helpBookURL isFileURL]
      || ![v31 hasPrefix:@"http"])
    {
      uint64_t v35 = [v20 stringByAppendingPathComponent:v31];
    }
    else
    {
      if (!v39)
      {
LABEL_26:
        if ([(NSURL *)v40->_helpBookURL isFileURL])
        {
          v37 = [NSString stringWithFormat:@"%@://load?url=%@", @"apple-help-local", v31];

          uint64_t v31 = [v37 stringByAddingPercentEscapes];
        }
        objc_msgSend(v41, "replaceCharactersInRange:withString:", v27, v29, v31);
        uint64_t v24 = [v31 length] + v27;
        goto LABEL_29;
      }
      uint64_t v35 = [NSString stringWithFormat:@"%@://load?url=%@", @"apple-help-remote-asset", v31];
    }
    uint64_t v36 = (void *)v35;

    uint64_t v31 = v36;
    goto LABEL_26;
  }
LABEL_31:
}

- (void)showWebViewDelay
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_showWebViewDelay object:0];
  if (!self->_webViewLoaded)
  {
    self->_webViewLoaded = 1;
    id v3 = [(HLPHelpTopicViewController *)self webView];
    [v3 alpha];
    double v5 = v4;

    if (v5 != 1.0)
    {
      id v6 = [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem identifier];
      id v7 = [(HLPHelpBookController *)self->_helpBookController welcomeTopicIdentifier];
      int v8 = [v6 isEqualToString:v7];

      if (v8)
      {
        helpBookController = self->_helpBookController;
        id v10 = [(HLPHelpBookController *)helpBookController welcomeTopicIdentifier];
        id v11 = [(HLPHelpBookController *)helpBookController helpItemForID:v10];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v12 = [v11 isPassionPoints] ^ 1;
        }
        else {
          int v12 = 1;
        }
      }
      else
      {
        int v12 = 0;
      }
      id v13 = [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem anchor];
      if (v13)
      {
      }
      else if (!+[HLPCommonDefines isVisionOS])
      {
        id v14 = [(WKWebView *)self->_webView scrollView];
        [v14 contentSize];
        double v16 = v15;
        double v18 = v17;
        [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem contentSize];
        double v20 = v19;
        double v22 = v21;

        if (v16 == v20 && v18 == v22)
        {
          [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem contentOffset];
          double v28 = v27;
          double v30 = v29;
          uint64_t v31 = [(WKWebView *)self->_webView scrollView];
          objc_msgSend(v31, "setContentOffset:", v28, v30);
        }
        else
        {
          -[HLPHelpTopicHistoryItem setContentSize:](self->_currentTopicHistoryItem, "setContentSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
          double v24 = 0.0;
          if ((v12 & 1) == 0)
          {
            uint64_t v25 = [(HLPHelpTopicViewController *)self view];
            [v25 safeAreaInsets];
            double v24 = v26;
          }
          -[HLPHelpTopicHistoryItem setContentOffset:](self->_currentTopicHistoryItem, "setContentOffset:", 0.0, v24);
        }
      }
      if (v12)
      {
        v32 = [(WKWebView *)self->_webView scrollView];
        objc_msgSend(v32, "setContentOffset:", 0.0, 0.0);
      }
      int v33 = [(HLPHelpTopicViewController *)self loadingView];
      [v33 showActivityIndicator:0];

      if ([(HLPHelpTopicViewController *)self isViewLoaded])
      {
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __46__HLPHelpTopicViewController_showWebViewDelay__block_invoke;
        v35[3] = &unk_264578B58;
        v35[4] = self;
        [MEMORY[0x263F1CB60] animateWithDuration:v35 animations:0.2];
      }
      else
      {
        id v34 = [(HLPHelpTopicViewController *)self webView];
        [v34 setAlpha:1.0];
      }
    }
  }
}

void __46__HLPHelpTopicViewController_showWebViewDelay__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) webView];
  [v1 setAlpha:1.0];
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_showWebViewDelay object:0];
  [(HLPHelpTopicViewController *)self performSelector:sel_showWebViewDelay withObject:0 afterDelay:3.0];
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  objc_msgSend(a3, "evaluateJavaScript:completionHandler:", @"document.body.style.webkitUserSelect = \"none\";",
    0);
  if (!self->_webViewLoaded)
  {
    [(HLPHelpTopicViewController *)self performSelector:sel_showWebViewDelay withObject:0 afterDelay:0.1];
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_showWebViewDelay object:0];
  id v6 = [(HLPHelpTopicViewController *)self loadingView];
  [v6 showActivityIndicator:0];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v59 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  id v10 = [v8 request];
  id v11 = [v10 URL];
  int v12 = [v11 scheme];
  int v13 = [v12 hasPrefix:@"helpkit"];

  if (v13)
  {
    id v14 = (void *)MEMORY[0x263F08BA0];
    double v15 = [v10 URL];
    double v16 = [v15 absoluteString];
    double v17 = [v14 componentsWithString:v16];

    double v18 = [v17 queryItems];
    double v19 = [v18 firstObject];

    double v20 = [v19 name];
    double v21 = HLPLogForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      double v22 = [v10 URL];
      BOOL v23 = [v22 absoluteString];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v23;
      _os_log_impl(&dword_220BD8000, v21, OS_LOG_TYPE_DEFAULT, "decidePolicy %@", (uint8_t *)&buf, 0xCu);
    }
    if ([v20 isEqualToString:@"type"])
    {
      double v24 = [v19 value];
      if ([v24 isEqualToString:@"TOC"])
      {
        [(HLPHelpTopicViewController *)self showTableOfContent];
      }
      else if (([v24 isEqualToString:@"pp"] & 1) != 0 {
             || [v24 isEqualToString:@"task"])
      }
      {
        uint64_t v35 = [v17 queryItems];
        BOOL v36 = [v35 count] == 3;

        if (v36)
        {
          v37 = [v17 queryItems];
          uint64_t v38 = [v37 objectAtIndexedSubscript:1];
          uint64_t v58 = [v38 value];

          BOOL v39 = [(HLPHelpTopicViewController *)self traitCollection];
          v40 = +[HLPAnalyticsEventContentViewed eventWithTopicID:topicTitle:source:interfaceStyle:](HLPAnalyticsEventContentViewed, "eventWithTopicID:topicTitle:source:interfaceStyle:", v58, &stru_26D29FC58, @"deep_link", [v39 userInterfaceStyle]);
          [v40 log];
        }
      }
    }
    goto LABEL_34;
  }
  if (![v8 navigationType])
  {
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x2020000000;
    char v64 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v66 = 0x3032000000;
    uint64_t v67 = __Block_byref_object_copy__2;
    uint64_t v68 = __Block_byref_object_dispose__2;
    id v69 = 0;
    if ([(HLPHelpBookController *)self->_helpBookController serverType] == 1)
    {
      id v26 = objc_alloc(MEMORY[0x263F08BA0]);
      double v27 = [v10 URL];
      double v28 = [v27 absoluteString];
      double v29 = (void *)[v26 initWithString:v28];

      double v30 = [v29 queryItems];
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __86__HLPHelpTopicViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
      v60[3] = &unk_264579450;
      v60[4] = &v61;
      v60[5] = &buf;
      [v30 enumerateObjectsWithOptions:2 usingBlock:v60];
    }
    uint64_t v31 = [v10 URL];
    v32 = [v31 scheme];
    if ([v32 hasPrefix:@"http"])
    {
      BOOL v33 = *(void *)(*((void *)&buf + 1) + 40) == 0;

      if (v33)
      {
        id v34 = 0;
        goto LABEL_32;
      }
    }
    else
    {
    }
    if (!*(void *)(*((void *)&buf + 1) + 40)
      && ![(HLPHelpBookController *)self->_helpBookController serverType])
    {
      id v41 = [v10 URL];
      uint64_t v42 = [v41 lastPathComponent];
      char v43 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v42;

      uint64_t v44 = [*(id *)(*((void *)&buf + 1) + 40) stringByDeletingPathExtension];
      id v45 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v44;
    }
    long long v46 = [v10 URL];
    id v34 = [v46 fragment];

    if ([v34 isEqualToString:*(void *)(*((void *)&buf + 1) + 40)])
    {

      id v34 = 0;
    }
    uint64_t v47 = [(HLPHelpBookController *)self->_helpBookController helpTopicItemForID:*(void *)(*((void *)&buf + 1) + 40)];
    if (v47
      || *((unsigned char *)v62 + 24)
      && (uint64_t v47 = objc_alloc_init(HLPHelpTopicItem),
          [(HLPHelpItem *)v47 setIdentifier:*(void *)(*((void *)&buf + 1) + 40)],
          [(HLPHelpTopicItem *)v47 setCategories:&unk_26D2A85C8],
          [(HLPHelpBookController *)self->_helpBookController addAsideTopic:v47],
          v47))
    {
      uint64_t v48 = [(HLPHelpTopicItem *)v47 hrefID];
      int v49 = [v48 hasPrefix:@"http"];

      if (v49)
      {
        uint64_t v50 = [MEMORY[0x263F1C408] sharedApplication];
        uint64_t v51 = NSURL;
        uint64_t v52 = [(HLPHelpTopicItem *)v47 hrefID];
        uint64_t v53 = [v51 URLWithString:v52];
        [v50 openURL:v53 options:MEMORY[0x263EFFA78] completionHandler:0];
      }
      else
      {
        uint64_t v50 = +[HLPLoadInfo infoWithTopicItem:v47 accesstype:1 searchTerms:0 anchor:v34];
        [(HLPHelpTopicViewController *)self _loadWithInfo:v50];
      }
      goto LABEL_33;
    }
LABEL_32:
    uint64_t v54 = [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem identifier];
    uint64_t v55 = [(HLPHelpTopicHistoryItem *)self->_currentTopicHistoryItem name];
    uint64_t v56 = [v10 URL];
    uint64_t v57 = [v56 absoluteString];
    [(HLPHelpTopicViewController *)self logAnalyticsContentViewedWithTopicID:v54 topicTitle:v55 source:@"link" fromTopicID:&stru_26D29FC58 externalURLString:v57];

    uint64_t v47 = [MEMORY[0x263F1C408] sharedApplication];
    uint64_t v50 = [v10 URL];
    [(HLPHelpTopicItem *)v47 openURL:v50 options:MEMORY[0x263EFFA78] completionHandler:0];
LABEL_33:

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v61, 8);
LABEL_34:
    uint64_t v25 = 0;
    goto LABEL_35;
  }
  uint64_t v25 = 1;
LABEL_35:
  v9[2](v9, v25);
}

void __86__HLPHelpTopicViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  id v6 = [v14 name];
  int v7 = [v6 isEqualToString:@"aside"];

  if (v7)
  {
    id v8 = [v14 value];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v8 BOOLValue];
  }
  else
  {
    id v9 = [v14 name];
    int v10 = [v9 isEqualToString:@"topicid"];

    if (v10)
    {
      uint64_t v11 = [v14 value];
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      int v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      *a4 = 1;
    }
  }
}

- (void)helpTopicViewControllerContentViewed:(id)a3 topicID:(id)a4 topicTitle:(id)a5 source:(id)a6 interfaceStyle:(int64_t)a7 fromTopicID:(id)a8 externalURLString:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = [(HLPHelpTopicViewController *)self delegate];
  [v20 helpTopicViewControllerContentViewed:self topicID:v19 topicTitle:v18 source:v17 interfaceStyle:a7 fromTopicID:v16 externalURLString:v15];
}

- (void)helpTopicViewControllerCurrentTopicIsPassionPoint:(id)a3
{
  id v3 = [(HLPHelpTopicViewController *)self webView];
  [v3 setUserInteractionEnabled:1];
}

- (void)helpTopicViewController:(id)a3 failToLoadWithError:(id)a4
{
  id v4 = [a3 loadingView];
  [v4 showDefaultErrorMessage];
}

- (void)helpTopicViewControllerShowHelpBookInfo:(id)a3
{
  id v4 = [(HLPHelpTopicViewController *)self delegate];
  [v4 helpTopicViewControllerShowHelpBookInfo:self];
}

- (void)helpTopicViewController:(id)a3 selectedHelpTopicItem:(id)a4 accessType:(int64_t)a5
{
  id v7 = a4;
  id v8 = [(HLPHelpTopicViewController *)self delegate];
  [v8 helpTopicViewController:self selectedHelpTopicItem:v7 accessType:a5];
}

- (void)showHelpBookInfo:(id)a3
{
  id v4 = [(HLPHelpTopicViewController *)self delegate];
  [v4 helpTopicViewControllerShowHelpBookInfo:self];
}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  double v5 = objc_msgSend(a4, "request", a3);
  id v10 = [v5 URL];

  id v6 = [v10 scheme];
  int v7 = [v6 isEqualToString:@"apple-help-remote-asset"];

  if (v7)
  {
    id v8 = [(NSMutableDictionary *)self->_webViewRequestsMap objectForKeyedSubscript:v10];
    if (v8)
    {
      [(NSMutableDictionary *)self->_webViewRequestsMap setObject:0 forKeyedSubscript:v10];
      [(NSMutableDictionary *)self->_webViewRequestsDataMap setObject:0 forKeyedSubscript:v10];
      id v9 = +[HLPURLSessionManager defaultManager];
      [v9 cancelSessionItem:v8];
    }
  }
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  v52[1] = *MEMORY[0x263EF8340];
  id v38 = a3;
  id v5 = a4;
  id v6 = [v5 request];
  BOOL v39 = [v6 URL];

  id v7 = objc_alloc(MEMORY[0x263F08BA0]);
  id v8 = [v5 request];
  id v9 = [v8 URL];
  id v10 = (void *)[v7 initWithURL:v9 resolvingAgainstBaseURL:0];

  uint64_t v11 = [v10 scheme];
  uint64_t v12 = [v10 queryItems];
  v40 = [v12 firstObject];

  int v13 = [v40 value];
  id v14 = [v13 pathExtension];
  id v15 = [v14 lowercaseString];

  if ([v15 isEqualToString:@"png"])
  {
    id v16 = @"image/png";
  }
  else if (([v15 isEqualToString:@"jpg"] & 1) != 0 {
         || ([v15 isEqualToString:@"jpeg"] & 1) != 0)
  }
  {
    id v16 = @"image/jpeg";
  }
  else if ([v15 isEqualToString:@"mp4"])
  {
    id v16 = @"video/mp4";
  }
  else
  {
    id v16 = @"text/plain";
  }
  if ([v11 isEqualToString:@"apple-help-local"])
  {
    id v17 = [NSURL fileURLWithPath:v13];
    if (v17)
    {
      id v18 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v13];
      if (v18
        && (uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x263F08BE8]), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v17, v16, objc_msgSend(v18, "length"), 0)) != 0)
      {
        id v20 = (void *)v19;
        [v5 didReceiveResponse:v19];
        double v21 = v18;
        [v5 didReceiveData:v18];
        [v5 didFinish];
      }
      else
      {
        double v21 = v18;
        double v24 = (void *)MEMORY[0x263F087E8];
        uint64_t v51 = @"URL";
        v52[0] = v13;
        id v20 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
        uint64_t v25 = [v24 errorWithDomain:@"file not found" code:-1 userInfo:v20];
        [v5 didFailWithError:v25];
      }
      goto LABEL_20;
    }
  }
  else if ([v11 isEqualToString:@"apple-help-remote-asset"])
  {
    id v17 = [NSURL URLWithString:v13];
    if (!v17)
    {
LABEL_21:

      goto LABEL_22;
    }
    double v22 = [(HLPHelpTopicViewController *)self webViewRequestsDataMap];
    BOOL v23 = [v39 absoluteString];
    uint64_t v36 = [v22 objectForKeyedSubscript:v23];

    double v21 = (void *)v36;
    if (v36)
    {
      [(HLPHelpTopicViewController *)self updateURLSchemeTask:v5 URL:v17 MIMEType:v16 data:v36 error:0];
    }
    else
    {
      objc_initWeak(&location, self);
      id v26 = [MEMORY[0x263F089E0] requestWithURL:v17];
      uint64_t v35 = +[HLPCommonDefines assetRequestHeaderFields];
      if (v35)
      {
        [v26 setCachePolicy:1];
        [v26 setAllHTTPHeaderFields:v35];
      }
      id from = 0;
      double v27 = +[HLPDataCacheController sharedInstance];
      id v34 = [v17 lastPathComponent];
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __57__HLPHelpTopicViewController_webView_startURLSchemeTask___block_invoke;
      v41[3] = &unk_264579478;
      objc_copyWeak(&v47, &location);
      id v33 = v39;
      id v42 = v33;
      objc_copyWeak(&v48, &from);
      char v43 = self;
      id v44 = v5;
      id v45 = v17;
      long long v46 = v16;
      double v28 = [v27 formattedDataForRequest:v26 identifier:v34 completionHandler:v41];
      objc_storeWeak(&from, v28);

      id v29 = objc_loadWeakRetained(&from);
      if (v29)
      {
        double v30 = +[HLPURLSessionManager defaultManager];
        id v31 = objc_loadWeakRetained(&from);
        [v30 resumeSessionItem:v31];

        id v32 = objc_loadWeakRetained(&from);
        [(NSMutableDictionary *)self->_webViewRequestsMap setObject:v32 forKeyedSubscript:v33];
      }
      objc_destroyWeak(&v48);

      objc_destroyWeak(&v47);
      objc_destroyWeak(&from);

      objc_destroyWeak(&location);
      double v21 = 0;
    }
LABEL_20:

    goto LABEL_21;
  }
LABEL_22:
}

void __57__HLPHelpTopicViewController_webView_startURLSchemeTask___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v18 = a2;
  id v9 = a3;
  id v10 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v12 = [WeakRetained webViewRequestsMap];
  int v13 = [v12 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)(a1 + 80));
    char v15 = [v14 isCancelled];

    if ((v15 & 1) == 0)
    {
      if (v18) {
        id v16 = v18;
      }
      else {
        id v16 = v9;
      }
      [*(id *)(a1 + 40) updateURLSchemeTask:*(void *)(a1 + 48) URL:*(void *)(a1 + 56) MIMEType:*(void *)(a1 + 64) data:v16 error:v10];
    }
    id v17 = [WeakRetained webViewRequestsMap];
    [v17 setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

- (void)updateURLSchemeTask:(id)a3 URL:(id)a4 MIMEType:(id)a5 data:(id)a6 error:(id)a7
{
  v49[2] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  char v15 = [v11 request];
  id v16 = [v15 allHTTPHeaderFields];
  uint64_t v17 = [v16 objectForKey:@"Range"];

  id v44 = (void *)v17;
  uint64_t v18 = [(HLPHelpTopicViewController *)self rangeFromData:v14 byteRangeString:v17];
  unint64_t v20 = 0x263EFF000;
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v21 = objc_msgSend(objc_alloc(MEMORY[0x263F08BE8]), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v12, v13, objc_msgSend(v14, "length"), 0);
  }
  else
  {
    uint64_t v22 = v18;
    id v42 = v13;
    uint64_t v23 = v19 - v18 + 1;
    v48[0] = @"Content-Range";
    double v24 = objc_msgSend(NSString, "stringWithFormat:", @"bytes %ld-%ld/%lu", v18, v19, objc_msgSend(v14, "length"));
    v48[1] = @"Content-Length";
    v49[0] = v24;
    uint64_t v41 = v23;
    uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v23);
    v49[1] = v25;
    id v26 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];

    id v27 = objc_alloc(MEMORY[0x263F088A0]);
    double v28 = NSURL;
    id v43 = v12;
    id v29 = [v12 absoluteString];
    double v30 = [v28 URLWithString:v29];
    double v21 = (void *)[v27 initWithURL:v30 statusCode:206 HTTPVersion:@"HTTP/1.1" headerFields:v26];

    id v31 = [v15 URL];
    id v32 = [v31 absoluteString];

    id v33 = [(HLPHelpTopicViewController *)self webViewRequestsDataMap];
    id v34 = [v33 objectForKeyedSubscript:v32];

    if (!v34)
    {
      uint64_t v35 = [(HLPHelpTopicViewController *)self webViewRequestsDataMap];
      [v35 setObject:v14 forKeyedSubscript:v32];
    }
    uint64_t v36 = objc_msgSend(v14, "subdataWithRange:", v22, v41);

    id v14 = (id)v36;
    id v13 = v42;
    id v12 = v43;
    unint64_t v20 = 0x263EFF000uLL;
  }
  [v11 didReceiveResponse:v21];
  if (a7 || !v14)
  {
    unint64_t v37 = v20;
    id v38 = (void *)MEMORY[0x263F087E8];
    long long v46 = @"URL";
    id v47 = v12;
    BOOL v39 = [*(id *)(v37 + 2352) dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    v40 = [v38 errorWithDomain:@"file not found" code:-1 userInfo:v39];
    [v11 didFailWithError:v40];
  }
  else
  {
    [v11 didReceiveData:v14];
    [v11 didFinish];
  }
}

- (_NSRange)rangeFromData:(id)a3 byteRangeString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 && (uint64_t v9 = [v6 rangeOfString:@"bytes="], v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v12 = [v7 substringFromIndex:v9 + v10];
    id v13 = [v12 componentsSeparatedByString:@"-"];
    if ([v13 count] == 2)
    {
      id v14 = [v13 objectAtIndexedSubscript:0];
      uint64_t v8 = [v14 integerValue];

      char v15 = [v13 objectAtIndexedSubscript:1];
      uint64_t v11 = [v15 integerValue];
      if ([v15 isEqualToString:@"*"]) {
        uint64_t v11 = [v5 length];
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  NSUInteger v16 = v8;
  NSUInteger v17 = v11;
  result.length = v17;
  result.id location = v16;
  return result;
}

- (void)registerTraitChanges
{
  v6[1] = *MEMORY[0x263EF8340];
  v6[0] = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__HLPHelpTopicViewController_registerTraitChanges__block_invoke;
  v5[3] = &unk_264578A00;
  v5[4] = self;
  id v4 = (id)[(HLPHelpTopicViewController *)self registerForTraitChanges:v3 withHandler:v5];
}

void __50__HLPHelpTopicViewController_registerTraitChanges__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 delegate];
  [v6 helpTopicViewController:*(void *)(a1 + 32) traitCollectionChanged:v5];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  if (+[HLPCommonDefines isVisionOS])
  {
    [v4 contentOffset];
    if (v3 != 0.0)
    {
      [v4 contentOffset];
      [v4 setContentOffset:0.0];
    }
  }
}

- (HLPHelpTopicViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HLPHelpTopicViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)fullBookView
{
  return self->_fullBookView;
}

- (BOOL)supportsDarkMode
{
  return self->_supportsDarkMode;
}

- (BOOL)displayHelpTopicsOnly
{
  return self->_displayHelpTopicsOnly;
}

- (void)setDisplayHelpTopicsOnly:(BOOL)a3
{
  self->_displayHelpTopicsOnly = a3;
}

- (BOOL)hideDoneButton
{
  return self->_hideDoneButton;
}

- (BOOL)showTopicNameAsTitle
{
  return self->_showTopicNameAsTitle;
}

- (void)setShowTopicNameAsTitle:(BOOL)a3
{
  self->_showTopicNameAsTitle = a3;
}

- (BOOL)isSingleTopic
{
  return self->_singleTopic;
}

- (void)setSingleTopic:(BOOL)a3
{
  self->_singleTopic = a3;
}

- (NSURL)helpBookURL
{
  return self->_helpBookURL;
}

- (void)setHelpBookURL:(id)a3
{
}

- (void)setWebView:(id)a3
{
}

- (HLPHelpLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (HLPHelpBookController)helpBookController
{
  return self->_helpBookController;
}

- (void)setHelpBookController:(id)a3
{
}

- (HLPHelpTopicHistoryItem)currentTopicHistoryItem
{
  return self->_currentTopicHistoryItem;
}

- (void)setCurrentTopicHistoryItem:(id)a3
{
}

- (void)setLoadingView:(id)a3
{
}

- (BOOL)darkModeEnabled
{
  return self->_darkModeEnabled;
}

- (HLPURLSessionItem)URLSessionItem
{
  return self->_URLSessionItem;
}

- (void)setURLSessionItem:(id)a3
{
}

- (NSCache)topicCache
{
  return self->_topicCache;
}

- (void)setTopicCache:(id)a3
{
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (void)setSearchTerms:(id)a3
{
}

- (NSMutableDictionary)webViewRequestsMap
{
  return self->_webViewRequestsMap;
}

- (void)setWebViewRequestsMap:(id)a3
{
}

- (NSMutableDictionary)webViewRequestsDataMap
{
  return self->_webViewRequestsDataMap;
}

- (void)setWebViewRequestsDataMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViewRequestsDataMap, 0);
  objc_storeStrong((id *)&self->_webViewRequestsMap, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_topicCache, 0);
  objc_storeStrong((id *)&self->_URLSessionItem, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_currentTopicHistoryItem, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_helpBookURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadingViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_forwardBarButtonItem, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_storeStrong((id *)&self->_tocBarButtonItem, 0);
  objc_storeStrong((id *)&self->_topicHistory, 0);
  objc_storeStrong((id *)&self->_helpBookController, 0);
  objc_storeStrong(&self->_interactivePopGestureRecognizerDelegate, 0);
}

@end