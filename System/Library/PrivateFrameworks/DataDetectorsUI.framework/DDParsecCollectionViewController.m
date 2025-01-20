@interface DDParsecCollectionViewController
- (BOOL)_allowsStylingSheetsAsCards;
- (BOOL)_canShowWhileLocked;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (CGSize)preferredContentSize;
- (DDParsecCollectionDelegate)parsecDelegate;
- (DDParsecCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (DDParsecCollectionViewController)initWithQuery:(id)a3;
- (DDParsecCollectionViewController)initWithRVItem:(id)a3;
- (DDParsecCollectionViewController)initWithResult:(__DDResult *)a3 context:(id)a4;
- (DDParsecCollectionViewController)initWithString:(id)a3 range:(_NSRange)a4;
- (DDParsecCollectionViewController)initWithString:(id)a3 range:(_NSRange)a4 dictionaryOnly:(BOOL)a5;
- (NSArray)actions;
- (_UIRemoteViewController)_containedRemoteViewController;
- (id)dismissCompletionHandler;
- (id)overrideTraitCollectionForChildViewController:(id)a3;
- (id)popoverPresentationController;
- (id)presentationController;
- (id)reportAnIssueBlock;
- (id)reportAnIssueMetadataFetchingBlock;
- (int64_t)_preferredModalPresentationStyle;
- (int64_t)modalPresentationStyle;
- (int64_t)style;
- (void)_interactionEnded;
- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4;
- (void)adaptForPresentationInPopover:(BOOL)a3;
- (void)appDidEnterBackground;
- (void)appWillEnterForeground;
- (void)doneButtonPressed:(id)a3;
- (void)doneButtonPressed:(id)a3 punchout:(BOOL)a4;
- (void)fetchRemoteViewControllerWithValidInput:(BOOL)a3;
- (void)getStatusBarHidden:(id)a3;
- (void)interactionEndedWithPunchout:(BOOL)a3;
- (void)loadReportAnIssueImage:(id)a3;
- (void)openParsecURL:(id)a3;
- (void)openTrailerPunchout:(id)a3;
- (void)performClientQueryWithServerAccessPermitted:(BOOL)a3 localSearchPermitted:(BOOL)a4;
- (void)performClientTextQueryWithTerm:(id)a3 queryId:(unint64_t)a4 sessionId:(id)a5 userAgent:(id)a6 reply:(id)a7;
- (void)presentRemoteCollection:(id)a3;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)remoteVCIsReady;
- (void)replaceControllerWithController:(id)a3;
- (void)reportAnIssueWithReportIdentifier:(id)a3 sfReportData:(id)a4;
- (void)setActions:(id)a3;
- (void)setDismissCompletionHandler:(id)a3;
- (void)setParsecDelegate:(id)a3;
- (void)setPreviewMode:(BOOL)a3;
- (void)setReportAnIssueBlock:(id)a3;
- (void)setReportAnIssueMetadataFetchingBlock:(id)a3;
- (void)setSheetMode:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)showError:(id)a3;
- (void)showSpinner;
- (void)showingErrorView:(BOOL)a3;
- (void)showingFTE:(BOOL)a3;
- (void)updateDelegateOfPresentationController:(id)a3;
- (void)updateVisualMode;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation DDParsecCollectionViewController

- (DDParsecCollectionViewController)initWithString:(id)a3 range:(_NSRange)a4
{
  return -[DDParsecCollectionViewController initWithString:range:dictionaryOnly:](self, "initWithString:range:dictionaryOnly:", a3, a4.location, a4.length, 0);
}

- (DDParsecCollectionViewController)initWithString:(id)a3 range:(_NSRange)a4 dictionaryOnly:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a3;
  v11 = [(DDParsecCollectionViewController *)self initWithNibName:0 bundle:0];
  if (v11)
  {
    if (v10)
    {
      v21.NSUInteger length = [v10 length];
      v20.NSUInteger location = location;
      v20.NSUInteger length = length;
      v21.NSUInteger location = 0;
      if (NSIntersectionRange(v20, v21).length)
      {
        v12 = objc_msgSend(v10, "substringWithRange:", location, length);
        v13 = [MEMORY[0x1E4F28E58] controlCharacterSet];
        v14 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        [v13 formUnionWithCharacterSet:v14];

        objc_msgSend(v13, "addCharactersInRange:", 65529, 7);
        v15 = [v13 invertedSet];
        uint64_t v16 = [v12 rangeOfCharacterFromSet:v15];

        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_storeStrong((id *)&v11->_queryString, a3);
          v17 = [v12 stringByTrimmingCharactersInSet:v13];

          uint64_t v18 = [v17 length];
          v11->_queryRange.NSUInteger location = v16 + location;
          v11->_queryRange.NSUInteger length = v18;
          [(DDParsecCollectionViewController *)v11 setTitle:v17];
          v12 = v17;
        }
      }
    }
    v11->_dictionaryMode = v5;
    if (v5) {
      v11->_popoverMode = 0;
    }
    [(DDParsecCollectionViewController *)v11 fetchRemoteViewControllerWithValidInput:v11->_queryString != 0];
  }

  return v11;
}

- (DDParsecCollectionViewController)initWithQuery:(id)a3
{
  id v5 = a3;
  v6 = [(DDParsecCollectionViewController *)self initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_query, a3);
      v8 = [v5 title];
      [(DDParsecCollectionViewController *)v7 setTitle:v8];
    }
    [(DDParsecCollectionViewController *)v7 fetchRemoteViewControllerWithValidInput:v7->_query != 0];
  }

  return v7;
}

- (DDParsecCollectionViewController)initWithRVItem:(id)a3
{
  id v5 = a3;
  v6 = [v5 query];

  objc_storeStrong((id *)&self->_item, a3);
  if (v6)
  {
    v7 = [v5 query];
    v8 = [(DDParsecCollectionViewController *)self initWithQuery:v7];
  }
  else
  {
    uint64_t v9 = [v5 text];
    id v10 = (void *)v9;
    v11 = &stru_1EF5023D8;
    if (v9) {
      v11 = (__CFString *)v9;
    }
    v7 = v11;

    uint64_t v12 = [v5 highlightRange];
    uint64_t v14 = v13;
    if ([v5 type] == 3)
    {
      v15 = [v5 ddResult];
      uint64_t v16 = [v15 matchedString];

      uint64_t v14 = [(__CFString *)v16 length];
      uint64_t v12 = 0;
      v7 = v16;
    }
    v8 = -[DDParsecCollectionViewController initWithString:range:](self, "initWithString:range:", v7, v12, v14);
  }
  v17 = v8;

  return v17;
}

- (void)setTitle:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  v6 = [v4 newlineCharacterSet];
  v7 = [v5 componentsSeparatedByCharactersInSet:v6];

  v8 = [v7 componentsJoinedByString:@" "];
  v9.receiver = self;
  v9.super_class = (Class)DDParsecCollectionViewController;
  [(DDParsecCollectionViewController *)&v9 setTitle:v8];
}

- (DDParsecCollectionViewController)initWithResult:(__DDResult *)a3 context:(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(DDParsecCollectionViewController *)self initWithNibName:0 bundle:0];
  if (v7)
  {
    if (a3)
    {
      v8 = DDResultGetMatchedString();
      if (v8)
      {
        [(DDParsecCollectionViewController *)v7 setTitle:v8];
        uint64_t v9 = [MEMORY[0x1E4F5F150] resultFromCoreResult:a3];
        id v10 = v7->_result;
        v7->_result = (DDScannerResult *)v9;

        if (v6)
        {
          v11 = [MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v12 = [v6 objectForKeyedSubscript:@"LeadingText"];
          [v11 setObject:v12 forKeyedSubscript:@"LeadingText"];

          uint64_t v13 = [v6 objectForKeyedSubscript:@"TrailingText"];
          [v11 setObject:v13 forKeyedSubscript:@"TrailingText"];

          uint64_t v14 = [v6 objectForKeyedSubscript:@"SelectedText"];
          [v11 setObject:v14 forKeyedSubscript:@"SelectedText"];

          v15 = [v11 allKeys];
          uint64_t v16 = [v15 count];

          if (v16)
          {
            uint64_t v17 = [v11 copy];
            context = v7->_context;
            v7->_context = (NSDictionary *)v17;
          }
        }
        v19 = +[DDAction actionWithURL:0 result:a3 context:v6];
        v23[0] = v19;
        NSRange v20 = +[DDAction actionWithURL:0 result:a3 context:v6];
        v23[1] = v20;
        NSRange v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
        [(DDParsecCollectionViewController *)v7 setActions:v21];
      }
    }
    [(DDParsecCollectionViewController *)v7 fetchRemoteViewControllerWithValidInput:v7->_result != 0];
  }

  return v7;
}

- (DDParsecCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)DDParsecCollectionViewController;
  v4 = [(DDParsecCollectionViewController *)&v12 initWithNibName:a3 bundle:a4];
  id v5 = v4;
  if (v4)
  {
    v4->_needsBackground = 1;
    [(DDParsecCollectionViewController *)v4 setNavigationBarHidden:1 animated:0];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v5 action:sel__interactionEnded];
    tapGesture = v5->_tapGesture;
    v5->_tapGesture = (UITapGestureRecognizer *)v6;

    v8 = [(DDParsecCollectionViewController *)v5 view];
    [v8 addGestureRecognizer:v5->_tapGesture];

    [(DDParsecCollectionViewController *)v5 setModalPresentationStyle:7];
    [(DDParsecCollectionViewController *)v5 setModalInPresentation:0];
    uint64_t v9 = [(DDParsecCollectionViewController *)v5 presentationController];
    [v9 setDelegate:v5];

    v5->_popoverMode = 1;
    [(DDParsecCollectionViewController *)v5 updateVisualMode];
    id v10 = v5;
  }

  return v5;
}

- (void)updateDelegateOfPresentationController:(id)a3
{
  id v10 = a3;
  v4 = [v10 delegate];
  if (v4 != self)
  {
    if (v4)
    {
      id v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      char v7 = [v6 isEqualToString:@"DDDelegateMultiplexer"];

      if ((v7 & 1) == 0)
      {
        v8 = [[DDDelegateMultiplexer alloc] initWithDelegate:self andDelegate:v4];
        [v10 setDelegate:v8];
        presentationDelegateProxy = self->_presentationDelegateProxy;
        self->_presentationDelegateProxy = v8;
      }
    }
    else
    {
      [v10 setDelegate:self];
    }
  }
}

- (id)popoverPresentationController
{
  self->_requestingPopoverPresentationController = 1;
  v7.receiver = self;
  v7.super_class = (Class)DDParsecCollectionViewController;
  v3 = [(DDParsecCollectionViewController *)&v7 popoverPresentationController];
  [v3 _setCentersPopoverIfSourceViewNotSet:1];
  v4 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  [v3 setBackgroundColor:v4];

  id v5 = [(DDParsecCollectionViewController *)self view];
  [v5 _setOverrideVibrancyTrait:0];

  [(DDParsecCollectionViewController *)self updateDelegateOfPresentationController:v3];
  self->_requestingPopoverPresentationController = 0;
  return v3;
}

- (id)presentationController
{
  v5.receiver = self;
  v5.super_class = (Class)DDParsecCollectionViewController;
  v3 = [(DDParsecCollectionViewController *)&v5 presentationController];
  [(DDParsecCollectionViewController *)self updateDelegateOfPresentationController:v3];
  return v3;
}

- (int64_t)modalPresentationStyle
{
  if (!self->_requestingPopoverPresentationController)
  {
    self->_requestingPopoverPresentationController = 1;
    v6.receiver = self;
    v6.super_class = (Class)DDParsecCollectionViewController;
    v3 = [(DDParsecCollectionViewController *)&v6 popoverPresentationController];
    [(DDParsecCollectionViewController *)self updateDelegateOfPresentationController:v3];
    self->_requestingPopoverPresentationController = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DDParsecCollectionViewController;
  return [(DDParsecCollectionViewController *)&v5 modalPresentationStyle];
}

- (int64_t)_preferredModalPresentationStyle
{
  return 7;
}

- (void)setPreviewMode:(BOOL)a3
{
  if (self->_previewMode != a3)
  {
    BOOL v3 = a3;
    self->_previewMode = a3;
    objc_super v5 = [(_UIRemoteViewController *)self->_remoteViewController serviceViewControllerProxy];
    [v5 setPreviewMode:v3];

    [(DDParsecCollectionViewController *)self updateVisualMode];
  }
}

- (void)adaptForPresentationInPopover:(BOOL)a3
{
  BOOL v3 = !self->_dictionaryMode && a3;
  if (self->_popoverMode != v3)
  {
    self->_popoverMode = v3;
    id v4 = [(_UIRemoteViewController *)self->_remoteViewController serviceViewControllerProxy];
    [v4 setPopoverMode:v3];
  }
}

- (void)setSheetMode:(BOOL)a3
{
  if (self->_sheetMode != a3)
  {
    BOOL v3 = a3;
    self->_sheetMode = a3;
    objc_super v5 = [(_UIRemoteViewController *)self->_remoteViewController serviceViewControllerProxy];
    [v5 setSheetMode:v3];

    [(DDParsecCollectionViewController *)self updateVisualMode];
  }
}

- (CGSize)preferredContentSize
{
  double v2 = 360.0;
  double v3 = 480.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)overrideTraitCollectionForChildViewController:(id)a3
{
  return (id)[MEMORY[0x1E4F42F80] _traitCollectionWithValue:&unk_1EF50FE10 forTraitNamed:*MEMORY[0x1E4F44220]];
}

- (void)updateVisualMode
{
  double v3 = [(DDParsecCollectionViewController *)self view];
  [v3 _setOverrideVibrancyTrait:0];

  BOOL needsBackground = self->_needsBackground;
  if (self->_needsBackground)
  {
    objc_super v5 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  }
  else
  {
    objc_super v5 = 0;
  }
  objc_super v6 = [(DDParsecCollectionViewController *)self view];
  [v6 setBackgroundColor:v5];

  if (needsBackground) {
  objc_super v7 = [(DDParsecCollectionViewController *)self topViewController];
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [(DDParsecCollectionViewController *)self topViewController];
    [v9 updateStyle];
  }
}

- (void)doneButtonPressed:(id)a3
{
}

- (void)doneButtonPressed:(id)a3 punchout:(BOOL)a4
{
}

- (void)fetchRemoteViewControllerWithValidInput:(BOOL)a3
{
  if (a3)
  {
    [(DDParsecCollectionViewController *)self showSpinner];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__DDParsecCollectionViewController_fetchRemoteViewControllerWithValidInput___block_invoke;
    v7[3] = &unk_1E5A858A0;
    v7[4] = self;
    id v4 = +[_UIRemoteViewController requestViewController:@"DDParsecServiceCollectionViewController" fromServiceWithBundleIdentifier:0x1EF502578 connectionHandler:v7];
  }
  else
  {
    [(DDParsecCollectionViewController *)self setTitle:&stru_1EF5023D8];
    if (self->_query) {
      objc_super v5 = @"No Content Found";
    }
    else {
      objc_super v5 = @"Nothing to Look Up";
    }
    DDLocalizedString(v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(DDParsecCollectionViewController *)self showError:v6];
  }
}

void __76__DDParsecCollectionViewController_fetchRemoteViewControllerWithValidInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v9 = objc_opt_class();
      DDUILogAssertionFailure((uint64_t)"[readyController isKindOfClass:DDParsecRemoteCollectionViewController.class]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileDataDetectorsUI/DDPreviewActions/DDParsecCollectionViewController.m", (uint64_t)"-[DDParsecCollectionViewController fetchRemoteViewControllerWithValidInput:]_block_invoke", 556, @"unexpected remote controller class: %@", v10, v11, v12, v9);
    }
    [*(id *)(a1 + 32) presentRemoteCollection:v5];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __76__DDParsecCollectionViewController_fetchRemoteViewControllerWithValidInput___block_invoke_cold_1((uint64_t)v6);
    }
    objc_super v7 = *(void **)(a1 + 32);
    v8 = DDLocalizedString(@"An Error Occurred");
    [v7 showError:v8];
  }
}

- (void)appDidEnterBackground
{
  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
  {
    id v3 = [(_UIRemoteViewController *)remoteViewController serviceViewControllerProxy];
    [v3 appDidEnterBackground];
  }
}

- (void)appWillEnterForeground
{
  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
  {
    id v3 = [(_UIRemoteViewController *)remoteViewController serviceViewControllerProxy];
    [v3 appWillEnterForeground];
  }
}

- (void)presentRemoteCollection:(id)a3
{
  id v23 = a3;
  objc_storeStrong((id *)&self->_remoteViewController, a3);
  [v23 setHostSideDelegate:self];
  id v5 = [v23 serviceViewControllerProxy];
  query = self->_query;
  BOOL previewMode = self->_previewMode;
  BOOL sheetMode = self->_sheetMode;
  BOOL popoverMode = self->_popoverMode;
  int64_t style = self->_style;
  uint64_t v11 = [(DDParsecCollectionViewController *)self traitCollection];
  [v11 displayScale];
  double v13 = v12;
  BOOL dictionaryMode = self->_dictionaryMode;
  v15 = [(RVItem *)self->_item textQueryProvider];
  LOBYTE(v22) = v15 != 0;
  [v5 prepareWithQueryObject:query previewMode:previewMode sheetMode:sheetMode popoverMode:popoverMode viewStyle:style scale:dictionaryMode dictionaryMode:v13 remoteTextQuery:v22];

  uint64_t v16 = [(DDParsecCollectionViewController *)self title];

  if (v16)
  {
    uint64_t v17 = [(DDParsecCollectionViewController *)self title];
    [v5 setOriginalTitle:v17];
  }
  queryString = self->_queryString;
  if (queryString)
  {
    objc_msgSend(v5, "startQueryWithString:range:", queryString, self->_queryRange.location, self->_queryRange.length);
  }
  else
  {
    CGSize result = self->_result;
    if (result) {
      [v5 startQueryWithResult:result context:self->_context];
    }
  }
  if (self->_query) {
    objc_msgSend(v5, "startQueryWithQuery:");
  }
  NSRange v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v20 addObserver:self selector:sel_appWillEnterForeground name:*MEMORY[0x1E4F43708] object:0];

  NSRange v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v21 addObserver:self selector:sel_appDidEnterBackground name:*MEMORY[0x1E4F43660] object:0];
}

- (void)remoteVCIsReady
{
  [(DDParsecCollectionViewController *)self replaceControllerWithController:self->_remoteViewController];
  self->_BOOL needsBackground = 0;
  [(DDParsecCollectionViewController *)self updateVisualMode];
}

- (void)performClientQueryWithServerAccessPermitted:(BOOL)a3 localSearchPermitted:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  objc_super v7 = [(RVQuery *)self->_query queryProvider];

  if (v7)
  {
    v8 = [(_UIRemoteViewController *)self->_remoteViewController serviceViewControllerProxy];
    uint64_t v9 = [(RVQuery *)self->_query queryProvider];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __101__DDParsecCollectionViewController_performClientQueryWithServerAccessPermitted_localSearchPermitted___block_invoke;
    v12[3] = &unk_1E5A858C8;
    id v13 = v8;
    uint64_t v10 = (void (*)(void *, BOOL, BOOL, void *))v9[2];
    id v11 = v8;
    v10(v9, v5, v4, v12);
  }
}

uint64_t __101__DDParsecCollectionViewController_performClientQueryWithServerAccessPermitted_localSearchPermitted___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) showClientQueryResults:a2 error:a3];
}

- (void)performClientTextQueryWithTerm:(id)a3 queryId:(unint64_t)a4 sessionId:(id)a5 userAgent:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [(RVItem *)self->_item textQueryProvider];

  if (v16)
  {
    uint64_t v17 = objc_alloc_init(DDHostTextQueryContext);
    [(DDHostTextQueryContext *)v17 setTitle:v12];
    [(DDHostTextQueryContext *)v17 setQueryString:v12];
    [(DDHostTextQueryContext *)v17 setQueryID:a4];
    [(DDHostTextQueryContext *)v17 setIdentifier:v13];
    [(DDHostTextQueryContext *)v17 setUserAgent:v14];
    uint64_t v18 = [(RVItem *)self->_item textQueryProvider];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __101__DDParsecCollectionViewController_performClientTextQueryWithTerm_queryId_sessionId_userAgent_reply___block_invoke;
    v19[3] = &unk_1E5A858F0;
    id v20 = v15;
    ((void (**)(void, DDHostTextQueryContext *, void *))v18)[2](v18, v17, v19);
  }
}

uint64_t __101__DDParsecCollectionViewController_performClientTextQueryWithTerm_queryId_sessionId_userAgent_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showError:(id)a3
{
  id v4 = a3;
  id v12 = (id)objc_opt_new();
  uint64_t v5 = [(DDParsecCollectionViewController *)self title];
  id v6 = (void *)v5;
  objc_super v7 = &stru_1EF5023D8;
  if (v5) {
    objc_super v7 = (__CFString *)v5;
  }
  v8 = v7;

  [v12 setTitle:v8];
  [v12 setSearchWebQuery:v8];

  [v12 setReason:v4];
  if (self->_query)
  {
    [v12 setLookup:0];
  }
  else
  {
    uint64_t v9 = [(DDParsecCollectionViewController *)self title];
    objc_msgSend(v12, "setLookup:", objc_msgSend(v9, "length") != 0);
  }
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:24 target:self action:sel_doneButtonPressed_];
  id v11 = [v12 navigationItem];
  [v11 setRightBarButtonItem:v10];

  [v12 updateStyle];
  [(DDParsecCollectionViewController *)self showingErrorView:1];
  [(DDParsecCollectionViewController *)self replaceControllerWithController:v12];
  [(DDParsecCollectionViewController *)self setNavigationBarHidden:0 animated:0];
}

- (void)showSpinner
{
  id v7 = (id)objc_opt_new();
  uint64_t v3 = [(DDParsecCollectionViewController *)self title];
  id v4 = (void *)v3;
  uint64_t v5 = &stru_1EF5023D8;
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  id v6 = v5;

  [v7 setTitle:v6];
  [(DDParsecCollectionViewController *)self replaceControllerWithController:v7];
}

- (void)replaceControllerWithController:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  -[DDParsecCollectionViewController setViewControllers:](self, "setViewControllers:", v6, v7, v8);
}

- (void)interactionEndedWithPunchout:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[DDParsecCollectionViewController interactionEndedWithPunchout:]();
    if (v3) {
      goto LABEL_3;
    }
  }
  else if (v3)
  {
LABEL_3:
    dispatch_time_t v5 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__DDParsecCollectionViewController_interactionEndedWithPunchout___block_invoke;
    block[3] = &unk_1E5A853B0;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x1E4F14428], block);
    return;
  }
  [(DDParsecCollectionViewController *)self _interactionEnded];
}

uint64_t __65__DDParsecCollectionViewController_interactionEndedWithPunchout___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setModalTransitionStyle:2];
  double v2 = *(void **)(a1 + 32);
  return [v2 _interactionEnded];
}

- (void)_interactionEnded
{
  BOOL v3 = [(DDParsecCollectionViewController *)self parsecDelegate];

  if (v3)
  {
    id v4 = [(DDParsecCollectionViewController *)self parsecDelegate];
    [v4 interactionDidFinishAndRequiresDismissal:!self->_dismissed];

    [(DDParsecCollectionViewController *)self setParsecDelegate:0];
  }
  else
  {
    dispatch_time_t v5 = [(DDParsecCollectionViewController *)self dismissCompletionHandler];
    [(DDParsecCollectionViewController *)self dismissViewControllerAnimated:1 completion:v5];

    [(DDParsecCollectionViewController *)self setDismissCompletionHandler:0];
  }
  self->_dismissed = 1;
}

- (void)showingErrorView:(BOOL)a3
{
  self->_showingError = a3;
}

- (void)showingFTE:(BOOL)a3
{
  self->_showingFTE = a3;
  -[UITapGestureRecognizer setEnabled:](self->_tapGesture, "setEnabled:");
}

- (void)openParsecURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_time_t v5 = dispatch_get_global_queue(33, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__DDParsecCollectionViewController_openParsecURL___block_invoke;
    v6[3] = &unk_1E5A85428;
    id v7 = v4;
    uint64_t v8 = self;
    dispatch_async(v5, v6);
  }
  else
  {
    [(DDParsecCollectionViewController *)self interactionEndedWithPunchout:0];
  }
}

void __50__DDParsecCollectionViewController_openParsecURL___block_invoke(uint64_t a1)
{
  double v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__DDParsecCollectionViewController_openParsecURL___block_invoke_2;
  v4[3] = &unk_1E5A85918;
  uint64_t v3 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  [v2 openURL:v3 configuration:0 completionHandler:v4];
}

void __50__DDParsecCollectionViewController_openParsecURL___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "openParsecURL: failed with error: %@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__DDParsecCollectionViewController_openParsecURL___block_invoke_237;
  v8[3] = &unk_1E5A85428;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __50__DDParsecCollectionViewController_openParsecURL___block_invoke_237(uint64_t a1)
{
  return [*(id *)(a1 + 32) interactionEndedWithPunchout:*(void *)(a1 + 40) == 0];
}

- (void)getStatusBarHidden:(id)a3
{
  id v5 = (void (**)(id, uint64_t))a3;
  if ([(DDParsecCollectionViewController *)self prefersStatusBarHidden])
  {
    v5[2](v5, 1);
  }
  else
  {
    id v4 = [MEMORY[0x1E4F42738] sharedApplication];
    v5[2](v5, [v4 isStatusBarHidden]);
  }
}

- (void)openTrailerPunchout:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__DDParsecCollectionViewController_openTrailerPunchout___block_invoke;
  v6[3] = &unk_1E5A85428;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __56__DDParsecCollectionViewController_openTrailerPunchout___block_invoke(uint64_t a1, double a2)
{
  gotLoadHelper_x8__OBJC_CLASS___SearchUIMediaPlayerViewController(a2);
  id v4 = (id)[objc_alloc(*(Class *)(v3 + 1472)) initWithDestination:*(void *)(a1 + 32)];
  [v4 setModalPresentationStyle:5];
  [*(id *)(a1 + 40) presentViewController:v4 animated:1 completion:0];
}

- (void)reportAnIssueWithReportIdentifier:(id)a3 sfReportData:(id)a4
{
  if (a4 && a3)
  {
    reportAnIssueBlock = (void (**)(id, id, id))self->_reportAnIssueBlock;
    if (reportAnIssueBlock) {
      reportAnIssueBlock[2](reportAnIssueBlock, a3, a4);
    }
  }
}

- (void)loadReportAnIssueImage:(id)a3
{
  reportAnIssueMetadataFetchingBlock = (void (**)(id, void *))self->_reportAnIssueMetadataFetchingBlock;
  if (reportAnIssueMetadataFetchingBlock)
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = *MEMORY[0x1E4F96300];
    id v6 = (void (**)(id, void *))a3;
    id v7 = [v4 setWithObject:v5];
    reportAnIssueMetadataFetchingBlock[2](reportAnIssueMetadataFetchingBlock, v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = [v10 objectForKey:v5];
    v6[2](v6, v8);
  }
  else
  {
    id v9 = (void (*)(void))*((void *)a3 + 2);
    id v10 = a3;
    v9();
  }
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_remoteViewController;
}

- (BOOL)_allowsStylingSheetsAsCards
{
  return 1;
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  [(DDParsecCollectionViewController *)self adaptForPresentationInPopover:a4 == -1];
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (void *)MEMORY[0x1E4F42DE8];
    id v7 = v5;
    uint64_t v8 = [v6 mediumDetent];
    v11[0] = v8;
    id v9 = [MEMORY[0x1E4F42DE8] largeDetent];
    v11[1] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [v7 setDetents:v10];

    [v7 setPrefersGrabberVisible:1];
  }
  objc_opt_class();
  [(DDParsecCollectionViewController *)self adaptForPresentationInPopover:objc_opt_isKindOfClass() & 1];
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = [(DDParsecCollectionViewController *)self dismissCompletionHandler];

  if (v4)
  {
    id v5 = [(DDParsecCollectionViewController *)self dismissCompletionHandler];
    v5[2]();

    [(DDParsecCollectionViewController *)self setDismissCompletionHandler:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DDParsecCollectionViewController;
  -[DDParsecCollectionViewController viewWillAppear:](&v7, sel_viewWillAppear_);
  id v5 = [MEMORY[0x1E4F42738] sharedApplication];
  self->_previousStatusBarStyle = [v5 statusBarStyle];

  if (self->_previousStatusBarStyle)
  {
    id v6 = [MEMORY[0x1E4F42738] sharedApplication];
    [v6 setStatusBarStyle:0 animation:v3];
  }
  self->_dismissed = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(DDParsecCollectionViewController *)self _interactionEnded];
  v5.receiver = self;
  v5.super_class = (Class)DDParsecCollectionViewController;
  [(DDParsecCollectionViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_dismissed = 1;
  if (self->_remoteViewController)
  {
    objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:*MEMORY[0x1E4F43708] object:0];

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:*MEMORY[0x1E4F43660] object:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)DDParsecCollectionViewController;
  [(DDParsecCollectionViewController *)&v8 viewWillDisappear:v3];
  if (self->_previousStatusBarStyle)
  {
    objc_super v7 = [MEMORY[0x1E4F42738] sharedApplication];
    [v7 setStatusBarStyle:self->_previousStatusBarStyle animation:v3];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)dismissCompletionHandler
{
  return objc_getProperty(self, a2, 1544, 1);
}

- (void)setDismissCompletionHandler:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_int64_t style = a3;
}

- (id)reportAnIssueBlock
{
  return self->_reportAnIssueBlock;
}

- (void)setReportAnIssueBlock:(id)a3
{
}

- (id)reportAnIssueMetadataFetchingBlock
{
  return self->_reportAnIssueMetadataFetchingBlock;
}

- (void)setReportAnIssueMetadataFetchingBlock:(id)a3
{
}

- (NSArray)actions
{
  return (NSArray *)objc_getProperty(self, a2, 1576, 1);
}

- (void)setActions:(id)a3
{
}

- (DDParsecCollectionDelegate)parsecDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parsecDelegate);
  return (DDParsecCollectionDelegate *)WeakRetained;
}

- (void)setParsecDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parsecDelegate);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong(&self->_reportAnIssueMetadataFetchingBlock, 0);
  objc_storeStrong(&self->_reportAnIssueBlock, 0);
  objc_storeStrong(&self->_dismissCompletionHandler, 0);
  objc_storeStrong((id *)&self->_presentationDelegateMultiplexer, 0);
  objc_storeStrong((id *)&self->_presentationDelegateProxy, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

void __76__DDParsecCollectionViewController_fetchRemoteViewControllerWithValidInput___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not get an out-of-process view controller. Error %@", (uint8_t *)&v1, 0xCu);
}

- (void)interactionEndedWithPunchout:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Notifying host client that the action did finish.", v0, 2u);
}

@end