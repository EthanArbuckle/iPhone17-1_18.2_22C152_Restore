@interface HKCDADocumentReportViewController
+ (id)xmlToHTMLTranslator;
- (BOOL)javascriptIsRunning;
- (BOOL)javascriptSearchInstalled;
- (BOOL)searchInProgress;
- (HKCDADocumentReportViewController)initWithDocumentData:(id)a3;
- (HKIncrementalSearchBar)incrementalSearchBar;
- (NSData)documentData;
- (NSMutableArray)javascriptOperationQueue;
- (UIView)disclosureView;
- (WKWebView)webView;
- (id)buildDisclosureView;
- (int64_t)currentHighlightedHit;
- (int64_t)hitCount;
- (unint64_t)supportedInterfaceOrientations;
- (void)_finishJavascriptOperation;
- (void)_incrementCurrentHitBy:(int64_t)a3;
- (void)_runJavascript:(id)a3 clearQueuedCommands:(BOOL)a4 completion:(id)a5;
- (void)_runJavascriptOperation:(id)a3 clearQueuedCommands:(BOOL)a4;
- (void)_translateXMLInBackground;
- (void)_updateMatchDisplayString:(int64_t)a3 numMatches:(int64_t)a4;
- (void)_updateSearchBarState;
- (void)_updateSearchHits:(int64_t)a3;
- (void)hideDisclosure:(id)a3;
- (void)searchBarChangeSearch:(id)a3 searchString:(id)a4;
- (void)searchBarDoneAction:(id)a3;
- (void)searchBarDownAction:(id)a3;
- (void)searchBarUpAction:(id)a3;
- (void)setCurrentHighlightedHit:(int64_t)a3;
- (void)setHitCount:(int64_t)a3;
- (void)setJavascriptIsRunning:(BOOL)a3;
- (void)setJavascriptOperationQueue:(id)a3;
- (void)setJavascriptSearchInstalled:(BOOL)a3;
- (void)setSearchInProgress:(BOOL)a3;
- (void)startIncrementalSearch;
- (void)viewDidLoad;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HKCDADocumentReportViewController

- (HKCDADocumentReportViewController)initWithDocumentData:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKCDADocumentReportViewController;
  v6 = [(HKCDADocumentReportViewController *)&v14 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_documentData, a3);
    disclosureView = v7->_disclosureView;
    v7->_disclosureView = 0;

    webView = v7->_webView;
    v7->_webView = 0;

    incrementalSearchBar = v7->_incrementalSearchBar;
    v7->_incrementalSearchBar = 0;

    v7->_javascriptSearchInstalled = 0;
    v7->_javascriptIsRunning = 0;
    v7->_searchInProgress = 0;
    v7->_hitCount = 0;
    v7->_currentHighlightedHit = 0;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    javascriptOperationQueue = v7->_javascriptOperationQueue;
    v7->_javascriptOperationQueue = v11;
  }
  return v7;
}

+ (id)xmlToHTMLTranslator
{
  if (xmlToHTMLTranslator_oncePredicate != -1) {
    dispatch_once(&xmlToHTMLTranslator_oncePredicate, &__block_literal_global_82);
  }
  v2 = (void *)xmlToHTMLTranslator_translator;
  return v2;
}

void __56__HKCDADocumentReportViewController_xmlToHTMLTranslator__block_invoke()
{
  v0 = HKHealthUIFrameworkBundle();
  id v5 = [v0 pathForResource:@"CDAINTL" ofType:@"xsl"];

  v1 = [MEMORY[0x1E4F28CB8] defaultManager];
  v2 = [v1 contentsAtPath:v5];

  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F2B9B8]) initWithXSL:v2 localizationTableName:@"CDA" localizationOverride:0];
  v4 = (void *)xmlToHTMLTranslator_translator;
  xmlToHTMLTranslator_translator = v3;
}

- (void)hideDisclosure:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__HKCDADocumentReportViewController_hideDisclosure___block_invoke;
  v5[3] = &unk_1E6D50ED8;
  v5[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0.3];
  v4 = [(HKCDADocumentReportViewController *)self view];
  [v4 setNeedsLayout];
}

uint64_t __52__HKCDADocumentReportViewController_hideDisclosure___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) setHidden:1];
}

- (id)buildDisclosureView
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [_DisclosureLabel alloc];
  v4 = -[_DisclosureLabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v5 = [MEMORY[0x1E4FB14D0] buttonWithType:122];
  v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v5 setBackgroundColor:v6];

  LODWORD(v7) = 1148846080;
  [v5 setContentCompressionResistancePriority:0 forAxis:v7];
  [v5 addTarget:self action:sel_hideDisclosure_ forControlEvents:64];
  objc_msgSend(v5, "setContentEdgeInsets:", 0.0, 5.0, 0.0, 20.0);
  LODWORD(v8) = 1148846080;
  [v5 setContentHuggingPriority:0 forAxis:v8];
  id v9 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v13[0] = v4;
  v13[1] = v5;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v11 = (void *)[v9 initWithArrangedSubviews:v10];

  [v11 setAxis:0];
  return v11;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)HKCDADocumentReportViewController;
  [(HKCDADocumentReportViewController *)&v20 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v4 = (void *)[v3 initWithArrangedSubviews:MEMORY[0x1E4F1CBF0]];
  [v4 setAxis:1];
  id v5 = [(HKCDADocumentReportViewController *)self buildDisclosureView];
  disclosureView = self->_disclosureView;
  self->_disclosureView = v5;

  [v4 addArrangedSubview:self->_disclosureView];
  LODWORD(v7) = 1148846080;
  [(UIView *)self->_disclosureView setContentCompressionResistancePriority:1 forAxis:v7];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  double v8 = (void *)getWKWebViewConfigurationClass_softClass;
  uint64_t v29 = getWKWebViewConfigurationClass_softClass;
  if (!getWKWebViewConfigurationClass_softClass)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getWKWebViewConfigurationClass_block_invoke;
    v24 = &unk_1E6D514F8;
    v25 = &v26;
    __getWKWebViewConfigurationClass_block_invoke((uint64_t)&v21);
    double v8 = (void *)v27[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v26, 8);
  id v10 = objc_alloc_init(v9);
  v11 = [v10 preferences];
  [v11 setJavaScriptEnabled:1];

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v12 = (void *)getWKWebViewClass_softClass;
  uint64_t v29 = getWKWebViewClass_softClass;
  if (!getWKWebViewClass_softClass)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getWKWebViewClass_block_invoke;
    v24 = &unk_1E6D514F8;
    v25 = &v26;
    __getWKWebViewClass_block_invoke((uint64_t)&v21);
    v12 = (void *)v27[3];
  }
  v13 = v12;
  _Block_object_dispose(&v26, 8);
  id v14 = [v13 alloc];
  v15 = (WKWebView *)objc_msgSend(v14, "initWithFrame:configuration:", v10, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  webView = self->_webView;
  self->_webView = v15;

  [v4 addArrangedSubview:self->_webView];
  v17 = objc_alloc_init(HKIncrementalSearchBar);
  incrementalSearchBar = self->_incrementalSearchBar;
  self->_incrementalSearchBar = v17;

  [(HKIncrementalSearchBar *)self->_incrementalSearchBar setSearchBarDelegate:self];
  LODWORD(v19) = 1148846080;
  [(HKIncrementalSearchBar *)self->_incrementalSearchBar setContentHuggingPriority:1 forAxis:v19];
  [v4 addArrangedSubview:self->_incrementalSearchBar];
  [(HKCDADocumentReportViewController *)self setView:v4];
  [(HKCDADocumentReportViewController *)self _translateXMLInBackground];
}

- (void)_translateXMLInBackground
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  HKDispatchAsyncOnGlobalConcurrentQueue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __62__HKCDADocumentReportViewController__translateXMLInBackground__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained documentData];

  v4 = +[HKCDADocumentReportViewController xmlToHTMLTranslator];
  id v5 = [v4 convertToHTMLFromXML:v3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HKCDADocumentReportViewController__translateXMLInBackground__block_invoke_2;
  v7[3] = &unk_1E6D527B8;
  objc_copyWeak(&v9, v1);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v9);
}

void __62__HKCDADocumentReportViewController__translateXMLInBackground__block_invoke_2(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1F3B9CF20];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained webView];

  id v4 = (id)[v3 loadHTMLString:*(void *)(a1 + 32) baseURL:v5];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)startIncrementalSearch
{
  if (self->_javascriptSearchInstalled)
  {
    [(HKIncrementalSearchBar *)self->_incrementalSearchBar activateSearch:1];
    id v9 = [(HKCDADocumentReportViewController *)self view];
    [v9 setNeedsLayout];
  }
  else
  {
    id v3 = HKHealthUIFrameworkBundle();
    id v4 = [v3 pathForResource:@"HKHTMLIncrementalSearch" ofType:@"js"];
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v6 = [v5 contentsAtPath:v4];

    double v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
    webView = self->_webView;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__HKCDADocumentReportViewController_startIncrementalSearch__block_invoke;
    v10[3] = &unk_1E6D56780;
    v10[4] = self;
    [(WKWebView *)webView evaluateJavaScript:v7 completionHandler:v10];
  }
}

void __59__HKCDADocumentReportViewController_startIncrementalSearch__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    [*(id *)(*(void *)(a1 + 32) + 1008) activateSearch:1];
    id v4 = [*(id *)(a1 + 32) view];
    [v4 setNeedsLayout];

    *(unsigned char *)(*(void *)(a1 + 32) + 976) = 1;
  }
}

- (void)_runJavascript:(id)a3 clearQueuedCommands:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [[_JavascriptOperation alloc] initWithJavascript:v9 completion:v8];

  [(HKCDADocumentReportViewController *)self _runJavascriptOperation:v10 clearQueuedCommands:v5];
}

- (void)_runJavascriptOperation:(id)a3 clearQueuedCommands:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->_javascriptIsRunning || [(NSMutableArray *)self->_javascriptOperationQueue count])
  {
    if (v4) {
      [(NSMutableArray *)self->_javascriptOperationQueue removeAllObjects];
    }
    [(NSMutableArray *)self->_javascriptOperationQueue addObject:v6];
  }
  else
  {
    self->_javascriptIsRunning = 1;
    webView = self->_webView;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__HKCDADocumentReportViewController__runJavascriptOperation_clearQueuedCommands___block_invoke;
    v8[3] = &unk_1E6D50ED8;
    v8[4] = self;
    [v6 submitJavascript:webView finishBlock:v8];
  }
}

uint64_t __81__HKCDADocumentReportViewController__runJavascriptOperation_clearQueuedCommands___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishJavascriptOperation];
}

- (void)_finishJavascriptOperation
{
  self->_javascriptIsRunning = 0;
  if ([(NSMutableArray *)self->_javascriptOperationQueue count])
  {
    id v3 = [(NSMutableArray *)self->_javascriptOperationQueue firstObject];
    [(NSMutableArray *)self->_javascriptOperationQueue removeObjectAtIndex:0];
    self->_javascriptIsRunning = 1;
    webView = self->_webView;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__HKCDADocumentReportViewController__finishJavascriptOperation__block_invoke;
    v5[3] = &unk_1E6D50ED8;
    v5[4] = self;
    [v3 submitJavascript:webView finishBlock:v5];
  }
}

uint64_t __63__HKCDADocumentReportViewController__finishJavascriptOperation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishJavascriptOperation];
}

- (void)_updateSearchHits:(int64_t)a3
{
  int64_t hitCount = self->_hitCount;
  if (a3 < 0)
  {
    if (!hitCount) {
      self->_int64_t hitCount = -1;
    }
  }
  else
  {
    self->_int64_t hitCount = hitCount + a3;
    objc_initWeak(&location, self);
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    double v7 = __55__HKCDADocumentReportViewController__updateSearchHits___block_invoke;
    id v8 = &unk_1E6D567A8;
    objc_copyWeak(&v9, &location);
    -[HKCDADocumentReportViewController _runJavascript:clearQueuedCommands:completion:](self, "_runJavascript:clearQueuedCommands:completion:", @"searchController.continueSearch();",
      0,
      &v5);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  [(HKCDADocumentReportViewController *)self _updateSearchBarState];
}

void __55__HKCDADocumentReportViewController__updateSearchHits___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v5 = [a2 integerValue];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _updateSearchHits:v5];
  }
}

- (void)_updateSearchBarState
{
  incrementalSearchBar = self->_incrementalSearchBar;
  BOOL v4 = self->_hitCount >= 1 && self->_currentHighlightedHit > 0;
  [(HKIncrementalSearchBar *)incrementalSearchBar setUpEnabled:v4];
  int64_t hitCount = self->_hitCount;
  BOOL v6 = hitCount < 1;
  int64_t v7 = hitCount - 1;
  BOOL v8 = !v6 && self->_currentHighlightedHit < v7;
  [(HKIncrementalSearchBar *)self->_incrementalSearchBar setDownEnabled:v8];
  int64_t currentHighlightedHit = self->_currentHighlightedHit;
  int64_t v10 = self->_hitCount;
  [(HKCDADocumentReportViewController *)self _updateMatchDisplayString:currentHighlightedHit numMatches:v10];
}

- (void)_updateMatchDisplayString:(int64_t)a3 numMatches:(int64_t)a4
{
  if (a4 < 1)
  {
    if ((a4 & 0x8000000000000000) == 0
      || ([(HKIncrementalSearchBar *)self->_incrementalSearchBar searchText],
          objc_super v20 = objc_claimAutoreleasedReturnValue(),
          uint64_t v21 = [v20 length],
          v20,
          !v21))
    {
      uint64_t v10 = 0;
      goto LABEL_13;
    }
    v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v9 = [v12 localizedStringForKey:@"INCREMENTAL_SEARCH_NO_MATCHES" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  }
  else
  {
    if (a4 == 1)
    {
      v12 = HKLocalizedStringForNumberWithTemplate(&unk_1F3C227B0, 0);
      BOOL v6 = NSString;
      int64_t v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      BOOL v8 = [v7 localizedStringForKey:@"INCREMENTAL_SEARCH_ONE_MATCH %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      id v9 = objc_msgSend(v6, "stringWithFormat:", v8, v12);
    }
    else
    {
      v11 = [NSNumber numberWithInteger:a3 + 1];
      v12 = HKLocalizedStringForNumberWithTemplate(v11, 1);

      if ((unint64_t)a4 > 0x3E6)
      {
        v17 = [NSNumber numberWithInteger:999];
        int64_t v7 = HKLocalizedStringForNumberWithTemplate(v17, 1);

        id v14 = NSString;
        v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        BOOL v8 = v15;
        v16 = @"INCREMENTAL_SEARCH_MAX_ITEM %@ %@";
      }
      else
      {
        v13 = [NSNumber numberWithInteger:a4];
        int64_t v7 = HKLocalizedStringForNumberWithTemplate(v13, 1);

        id v14 = NSString;
        v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        BOOL v8 = v15;
        v16 = @"INCREMENTAL_SEARCH_MATCH_ITEM %@ %@";
      }
      v18 = [v15 localizedStringForKey:v16 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      id v9 = objc_msgSend(v14, "stringWithFormat:", v18, v12, v7);
    }
  }

  [(HKIncrementalSearchBar *)self->_incrementalSearchBar setMatchDisplayText:v9];
  uint64_t v10 = 1;
LABEL_13:
  incrementalSearchBar = self->_incrementalSearchBar;
  [(HKIncrementalSearchBar *)incrementalSearchBar setMatchDisplayVisible:v10];
}

- (void)_incrementCurrentHitBy:(int64_t)a3
{
  int64_t v3 = self->_currentHighlightedHit + a3;
  if (v3 >= 0 && v3 < self->_hitCount)
  {
    self->_int64_t currentHighlightedHit = v3;
    [(HKCDADocumentReportViewController *)self _updateSearchBarState];
  }
}

- (void)searchBarUpAction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__HKCDADocumentReportViewController_searchBarUpAction___block_invoke;
  v5[3] = &unk_1E6D567A8;
  objc_copyWeak(&v6, &location);
  -[HKCDADocumentReportViewController _runJavascript:clearQueuedCommands:completion:](self, "_runJavascript:clearQueuedCommands:completion:", @"searchController.previousHit();",
    0,
    v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__HKCDADocumentReportViewController_searchBarUpAction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _incrementCurrentHitBy:-1];
  }
}

- (void)searchBarDownAction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__HKCDADocumentReportViewController_searchBarDownAction___block_invoke;
  v5[3] = &unk_1E6D567A8;
  objc_copyWeak(&v6, &location);
  -[HKCDADocumentReportViewController _runJavascript:clearQueuedCommands:completion:](self, "_runJavascript:clearQueuedCommands:completion:", @"searchController.nextHit();",
    0,
    v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __57__HKCDADocumentReportViewController_searchBarDownAction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _incrementCurrentHitBy:1];
  }
}

- (void)searchBarDoneAction:(id)a3
{
  [(HKIncrementalSearchBar *)self->_incrementalSearchBar activateSearch:0];
  -[HKCDADocumentReportViewController _runJavascript:clearQueuedCommands:completion:](self, "_runJavascript:clearQueuedCommands:completion:", @"searchController.setSearchPattern('', '');",
    1,
    0);
}

- (void)searchBarChangeSearch:(id)a3 searchString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v14 = 0;
  BOOL v8 = +[HKIncrementalSearchBar regularExpressionFromString:v7 quoteForJavascript:1 caseless:&v14];
  if (v14) {
    id v9 = @"searchController.setSearchPattern('%@', 'mi');";
  }
  else {
    id v9 = @"searchController.setSearchPattern('%@', 'm');";
  }
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", v9, v8);
  self->_int64_t hitCount = 0;
  self->_int64_t currentHighlightedHit = 0;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__HKCDADocumentReportViewController_searchBarChangeSearch_searchString___block_invoke;
  v11[3] = &unk_1E6D567A8;
  objc_copyWeak(&v12, &location);
  [(HKCDADocumentReportViewController *)self _runJavascript:v10 clearQueuedCommands:1 completion:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __72__HKCDADocumentReportViewController_searchBarChangeSearch_searchString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v5 = [a2 integerValue];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _updateSearchHits:v5];
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 verticalSizeClass] == 1;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__HKCDADocumentReportViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E6D567D0;
  objc_copyWeak(&v11, &location);
  BOOL v12 = v8;
  [v7 animateAlongsideTransition:v10 completion:0];
  v9.receiver = self;
  v9.super_class = (Class)HKCDADocumentReportViewController;
  [(HKCDADocumentReportViewController *)&v9 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __95__HKCDADocumentReportViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setControlsHidden:*(unsigned __int8 *)(a1 + 40) animated:1];
}

- (NSData)documentData
{
  return (NSData *)objc_getProperty(self, a2, 984, 1);
}

- (UIView)disclosureView
{
  return self->_disclosureView;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (HKIncrementalSearchBar)incrementalSearchBar
{
  return self->_incrementalSearchBar;
}

- (BOOL)javascriptSearchInstalled
{
  return self->_javascriptSearchInstalled;
}

- (void)setJavascriptSearchInstalled:(BOOL)a3
{
  self->_javascriptSearchInstalled = a3;
}

- (BOOL)javascriptIsRunning
{
  return self->_javascriptIsRunning;
}

- (void)setJavascriptIsRunning:(BOOL)a3
{
  self->_javascriptIsRunning = a3;
}

- (BOOL)searchInProgress
{
  return self->_searchInProgress;
}

- (void)setSearchInProgress:(BOOL)a3
{
  self->_searchInProgress = a3;
}

- (int64_t)hitCount
{
  return self->_hitCount;
}

- (void)setHitCount:(int64_t)a3
{
  self->_int64_t hitCount = a3;
}

- (int64_t)currentHighlightedHit
{
  return self->_currentHighlightedHit;
}

- (void)setCurrentHighlightedHit:(int64_t)a3
{
  self->_int64_t currentHighlightedHit = a3;
}

- (NSMutableArray)javascriptOperationQueue
{
  return self->_javascriptOperationQueue;
}

- (void)setJavascriptOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_javascriptOperationQueue, 0);
  objc_storeStrong((id *)&self->_incrementalSearchBar, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_documentData, 0);
}

@end