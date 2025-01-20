@interface SearchToShareAppViewController
- (BOOL)browserIsPresentedFullscreen:(id)a3;
- (id)dictForSearchResult:(id)a3;
- (id)engagementFeedbackBlock;
- (id)requestExpandedCompletion;
- (id)searchResultForDict:(id)a3;
- (unint64_t)presentationStyle;
- (void)_addResultToRecents:(id)a3;
- (void)_setup;
- (void)_transitionContentFromViewController:(id)a3 toViewController:(id)a4 animations:(id)a5 completion:(id)a6;
- (void)_updatePickerBottomInset;
- (void)awakeFromNib;
- (void)browser:(id)a3 didSearchFor:(id)a4;
- (void)browser:(id)a3 didSelectCategoryResult:(id)a4;
- (void)browser:(id)a3 didSelectProviderLink:(id)a4;
- (void)browser:(id)a3 didSelectResult:(id)a4 withPayload:(id)a5;
- (void)browserCategoryButtonClicked:(id)a3 result:(id)a4;
- (void)browserDidTapLogo:(id)a3;
- (void)browserSearchBarButtonClicked:(id)a3;
- (void)browserSuggestionButtonClicked:(id)a3 suggestion:(id)a4;
- (void)requestExpandedPresentationStyleForBrowser:(id)a3 completion:(id)a4;
- (void)saveRecents;
- (void)searchBrowserRootViewControllerDidSelectCancel:(id)a3;
- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5;
- (void)setEngagementFeedbackBlock:(id)a3;
- (void)setRequestExpandedCompletion:(id)a3;
- (void)updateConstraintsForSearchBrowser;
- (void)updateConstraintsForZKWBrowser;
- (void)updateRecentResults:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SearchToShareAppViewController

- (void)updateConstraintsForZKWBrowser
{
  +[NSLayoutConstraint deactivateConstraints:self->_constraints];
  [(NSMutableArray *)self->_constraints removeAllObjects];
  v3 = [(STSPicker *)self->_zkwPicker view];
  v4 = [v3 topAnchor];
  v5 = [(SearchToShareAppViewController *)self view];
  v6 = [v5 topAnchor];
  id v23 = [v4 constraintEqualToAnchor:v6];

  v7 = [(STSPicker *)self->_zkwPicker view];
  v8 = [v7 bottomAnchor];
  v9 = [(SearchToShareAppViewController *)self view];
  v10 = [v9 window];
  v11 = [v10 bottomAnchor];
  v12 = [v8 constraintEqualToAnchor:v11];

  v13 = [(STSPicker *)self->_zkwPicker view];
  v14 = [v13 leadingAnchor];
  v15 = [(SearchToShareAppViewController *)self view];
  v16 = [v15 leadingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];

  v18 = [(STSPicker *)self->_zkwPicker view];
  v19 = [v18 trailingAnchor];
  v20 = [(SearchToShareAppViewController *)self view];
  v21 = [v20 trailingAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];

  [(NSMutableArray *)self->_constraints addObject:v23];
  [(NSMutableArray *)self->_constraints addObject:v12];
  [(NSMutableArray *)self->_constraints addObject:v17];
  [(NSMutableArray *)self->_constraints addObject:v22];
  +[NSLayoutConstraint activateConstraints:self->_constraints];
}

- (void)updateConstraintsForSearchBrowser
{
  +[NSLayoutConstraint deactivateConstraints:self->_constraints];
  [(NSMutableArray *)self->_constraints removeAllObjects];
  v3 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController view];
  v4 = [v3 topAnchor];
  v5 = [(SearchToShareAppViewController *)self view];
  v6 = [v5 topAnchor];
  id v22 = [v4 constraintEqualToAnchor:v6];

  v7 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController view];
  v8 = [v7 bottomAnchor];
  v9 = [(SearchToShareAppViewController *)self view];
  v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];

  v12 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController view];
  v13 = [v12 leadingAnchor];
  v14 = [(SearchToShareAppViewController *)self view];
  v15 = [v14 leadingAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];

  v17 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController view];
  v18 = [v17 trailingAnchor];
  v19 = [(SearchToShareAppViewController *)self view];
  v20 = [v19 trailingAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];

  [(NSMutableArray *)self->_constraints addObject:v22];
  [(NSMutableArray *)self->_constraints addObject:v11];
  [(NSMutableArray *)self->_constraints addObject:v16];
  [(NSMutableArray *)self->_constraints addObject:v21];
  +[NSLayoutConstraint activateConstraints:self->_constraints];
}

- (void)awakeFromNib
{
  v5.receiver = self;
  v5.super_class = (Class)SearchToShareAppViewController;
  [(SearchToShareAppViewController *)&v5 awakeFromNib];
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  recentResults = self->_recentResults;
  self->_recentResults = v3;

  self->_updateRecents = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SearchToShareAppViewController;
  [(SearchToShareAppViewController *)&v5 viewWillAppear:a3];
  [(SearchToShareAppViewController *)self _setup];
  [(SearchToShareAppViewController *)self _updatePickerBottomInset];
  [(STSPicker *)self->_zkwPicker performZKWSearchQuery];
  [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController fetchCategories];
  v4 = +[STSFeedbackReporter sharedInstance];
  [v4 searchViewDidAppearWithEvent:7];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SearchToShareAppViewController;
  [(SearchToShareAppViewController *)&v4 viewDidAppear:a3];
  [(STSZKWBrowserHeaderView *)self->_zkwHeaderView becomeFirstResponder];
  [(SearchToShareAppViewController *)self setEngagementFeedbackBlock:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SearchToShareAppViewController;
  [(SearchToShareAppViewController *)&v5 viewDidDisappear:a3];
  [(SearchToShareAppViewController *)self setEngagementFeedbackBlock:0];
  objc_super v4 = +[STSFeedbackReporter sharedInstance];
  [v4 searchViewDidDisappear];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SearchToShareAppViewController;
  [(SearchToShareAppViewController *)&v13 viewDidLayoutSubviews];
  v3 = [(STSPicker *)self->_zkwPicker pickerView];
  objc_super v4 = [(SearchToShareAppViewController *)self view];
  [v4 layoutMargins];
  [v3 setTopInset:];

  objc_super v5 = [(STSPicker *)self->_zkwPicker pickerView];
  v6 = [(SearchToShareAppViewController *)self view];
  [v6 layoutMargins];
  [v5 setBottomInset:v7];

  searchBrowserRootViewController = self->_searchBrowserRootViewController;
  v9 = [(SearchToShareAppViewController *)self view];
  [v9 layoutMargins];
  -[STSSearchBrowserRootViewController setTopInset:](searchBrowserRootViewController, "setTopInset:");

  v10 = self->_searchBrowserRootViewController;
  v11 = [(SearchToShareAppViewController *)self view];
  [v11 layoutMargins];
  [(STSSearchBrowserRootViewController *)v10 setBottomInset:v12];
}

- (void)browser:(id)a3 didSelectCategoryResult:(id)a4
{
}

- (void)browser:(id)a3 didSelectProviderLink:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v7 = [(SearchToShareAppViewController *)self extensionContext];
    v6 = [v5 sts_providerHostPageURL];

    [v7 openURL:v6 completionHandler:0];
  }
}

- (void)browser:(id)a3 didSelectResult:(id)a4 withPayload:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = dispatch_get_global_queue(-32768, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001E54;
  block[3] = &unk_100008260;
  id v10 = v8;
  id v13 = v10;
  dispatch_async(v9, block);
  v11 = [v10 imageURL];

  if (v11)
  {
    [(SearchToShareAppViewController *)self _addResultToRecents:v7];
    self->_updateRecents = 1;
  }
}

- (void)browserSearchBarButtonClicked:(id)a3
{
  [(STSPicker *)self->_zkwPicker cancelImageDownloads];
  objc_super v4 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController searchHeaderView];
  id v5 = [v4 searchBar];
  [v5 setText:0];

  [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController showCategories];
  zkwPicker = self->_zkwPicker;
  searchBrowserRootViewController = self->_searchBrowserRootViewController;
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000208C;
  v9[3] = &unk_100008260;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002094;
  v8[3] = &unk_100008260;
  [(SearchToShareAppViewController *)self _transitionContentFromViewController:zkwPicker toViewController:searchBrowserRootViewController animations:v9 completion:v8];
}

- (void)browser:(id)a3 didSearchFor:(id)a4
{
  id v5 = a4;
  [(STSPicker *)self->_zkwPicker cancelImageDownloads];
  zkwPicker = self->_zkwPicker;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000021E4;
  v8[3] = &unk_100008288;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(SearchToShareAppViewController *)self requestExpandedPresentationStyleForBrowser:zkwPicker completion:v8];
}

- (void)browserCategoryButtonClicked:(id)a3 result:(id)a4
{
  id v5 = a4;
  [(STSPicker *)self->_zkwPicker cancelImageDownloads];
  searchBrowserRootViewController = self->_searchBrowserRootViewController;
  id v7 = [v5 secondaryTitle];
  [(STSSearchBrowserRootViewController *)searchBrowserRootViewController showPickerAndPerformQuery:v7 requestType:5];

  zkwPicker = self->_zkwPicker;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000246C;
  v10[3] = &unk_100008288;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  [(SearchToShareAppViewController *)self requestExpandedPresentationStyleForBrowser:zkwPicker completion:v10];
}

- (void)browserSuggestionButtonClicked:(id)a3 suggestion:(id)a4
{
  id v5 = a4;
  [(STSPicker *)self->_zkwPicker cancelImageDownloads];
  searchBrowserRootViewController = self->_searchBrowserRootViewController;
  id v7 = [v5 query];
  [(STSSearchBrowserRootViewController *)searchBrowserRootViewController showPickerAndPerformQuery:v7 requestType:3];

  zkwPicker = self->_zkwPicker;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000026B8;
  v10[3] = &unk_100008288;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  [(SearchToShareAppViewController *)self requestExpandedPresentationStyleForBrowser:zkwPicker completion:v10];
}

- (BOOL)browserIsPresentedFullscreen:(id)a3
{
  return (id)[(SearchToShareAppViewController *)self presentationStyle] == (id)1;
}

- (void)requestExpandedPresentationStyleForBrowser:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(void))a4;
  if ((id)[(SearchToShareAppViewController *)self presentationStyle] != (id)1) {
    [(SearchToShareAppViewController *)self setRequestExpandedCompletion:v5];
  }
  if (v5) {
    v5[2]();
  }
}

- (void)browserDidTapLogo:(id)a3
{
  objc_super v4 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController parentViewController];

  if (v4)
  {
    id v5 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController searchHeaderView];
    v6 = [v5 searchBar];
    id v14 = [v6 text];

    id v7 = +[NSCharacterSet URLQueryAllowedCharacterSet];
    id v8 = [v14 stringByAddingPercentEncodingWithAllowedCharacters:v7];

    id v9 = +[NSString stringWithFormat:@"%@?q=%@", @"http://www.bing.com/images/search", v8];
    id v10 = +[NSURL URLWithString:v9];

    id v11 = +[STSFeedbackReporter sharedInstance];
    [v11 didEngageProviderLogo];

    double v12 = [(SearchToShareAppViewController *)self extensionContext];
    [v12 openURL:v10 completionHandler:0];
  }
  else
  {
    id v14 = +[NSURL URLWithString:@"http://www.bing.com/images/search"];
    id v13 = +[STSFeedbackReporter sharedInstance];
    [v13 didEngageProviderLogo];

    id v8 = [(SearchToShareAppViewController *)self extensionContext];
    [v8 openURL:v14 completionHandler:0];
  }
}

- (void)searchBrowserRootViewControllerDidSelectCancel:(id)a3
{
  if (self->_updateRecents)
  {
    self->_updateRecents = 0;
    zkwSearchModel = self->_zkwSearchModel;
    id v5 = [(NSMutableArray *)self->_recentResults copy];
    [(STSSearchModel *)zkwSearchModel setRecentResults:v5];

    v6 = self->_zkwSearchModel;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100002BD4;
    v11[3] = &unk_1000082B0;
    v11[4] = self;
    [(STSSearchModel *)v6 performZKWSearchQueryWithCompletion:v11];
  }
  else
  {
    searchBrowserRootViewController = self->_searchBrowserRootViewController;
    zkwPicker = self->_zkwPicker;
    v9[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100002CE8;
    v10[3] = &unk_100008260;
    v10[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100002CF0;
    v9[3] = &unk_100008260;
    [(SearchToShareAppViewController *)self _transitionContentFromViewController:searchBrowserRootViewController toViewController:zkwPicker animations:v10 completion:v9];
  }
  [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController setPresentationStyle:0];
}

- (void)updateRecentResults:(id)a3
{
  objc_super v4 = (NSMutableArray *)[a3 mutableCopy];
  recentResults = self->_recentResults;
  self->_recentResults = v4;

  [(SearchToShareAppViewController *)self saveRecents];
}

- (void)_transitionContentFromViewController:(id)a3 toViewController:(id)a4 animations:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  [(SearchToShareAppViewController *)self addChildViewController:v11];
  if (v10)
  {
    id v14 = [v10 parentViewController];

    if (!v14) {
      [(SearchToShareAppViewController *)self addChildViewController:v10];
    }
    [v10 willMoveToParentViewController:0];
    if (v12) {
      double v15 = 0.25;
    }
    else {
      double v15 = 0.0;
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100002F54;
    v18[3] = &unk_1000082D8;
    id v19 = v10;
    v20 = self;
    id v21 = v11;
    id v22 = v13;
    [(SearchToShareAppViewController *)self transitionFromViewController:v19 toViewController:v21 duration:5242880 options:v12 animations:v18 completion:v15];
  }
  else
  {
    v16 = [(SearchToShareAppViewController *)self view];
    v17 = [v11 view];
    [v16 setContentView:v17];

    [v11 didMoveToParentViewController:self];
    if (v13) {
      v13[2](v13);
    }
  }
}

- (void)_setup
{
  id v3 = [objc_alloc((Class)PARSessionConfiguration) initWithId:@"Messages-searchToShare-session" userAgent:@"Messages/1.0"];
  [v3 setDontPreloadImages:1];
  objc_super v4 = +[PARSession sessionWithConfiguration:v3 delegate:self startImmediately:1];
  id v5 = objc_alloc_init((Class)STSSearchModel);
  objc_storeStrong((id *)&self->_searchBrowserSearchModel, v5);
  [v5 setParsecSession:v4];
  v6 = (STSSearchBrowserRootViewController *)[objc_alloc((Class)STSSearchBrowserRootViewController) initWithSearchModel:v5];
  searchBrowserRootViewController = self->_searchBrowserRootViewController;
  self->_searchBrowserRootViewController = v6;

  [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController setSelectionDelegate:self];
  [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController setPickerSelectionDelegate:self];
  id v8 = objc_alloc_init((Class)STSSearchModel);
  [v8 setParsecSession:v4];
  objc_storeStrong((id *)&self->_zkwSearchModel, v8);
  [(STSSearchModel *)self->_zkwSearchModel setRecentsDelegate:self];
  id v9 = (STSPicker *)[objc_alloc((Class)STSPicker) initWithSearchModel:v8 showSuggestions:1];
  zkwPicker = self->_zkwPicker;
  self->_zkwPicker = v9;

  [(STSPicker *)self->_zkwPicker setSelectionDelegate:self];
  id v11 = (STSZKWBrowserHeaderView *)objc_alloc_init((Class)STSZKWBrowserHeaderView);
  zkwHeaderView = self->_zkwHeaderView;
  self->_zkwHeaderView = v11;

  id v13 = [(STSPicker *)self->_zkwPicker pickerView];
  [v13 setHeaderView:self->_zkwHeaderView];

  [(STSZKWBrowserHeaderView *)self->_zkwHeaderView setDelegate:self->_zkwPicker];
  id v14 = +[STSFeedbackReporter sharedInstance];
  [v14 setParsecSession:v4];

  double v15 = +[NSMutableArray array];
  constraints = self->_constraints;
  self->_constraints = v15;

  v17 = self->_zkwPicker;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000033B4;
  v28[3] = &unk_100008260;
  v28[4] = self;
  [(SearchToShareAppViewController *)self _transitionContentFromViewController:0 toViewController:v17 animations:v28 completion:0];
  v25 = v3;
  v18 = +[NSUserDefaults standardUserDefaults];
  [v18 setObject:0 forKey:@"STSRecentResults"];
  id v19 = [v18 objectForKey:@"STSRecentResults1"];
  id v20 = objc_alloc_init((Class)NSMutableArray);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000033BC;
  v26[3] = &unk_100008300;
  v26[4] = self;
  id v21 = v20;
  id v27 = v21;
  [v19 enumerateObjectsUsingBlock:v26];
  p_recentResults = &self->_recentResults;
  objc_storeStrong((id *)&self->_recentResults, v20);
  if (!self->_recentResults)
  {
    uint64_t v23 = objc_opt_new();
    v24 = *p_recentResults;
    *p_recentResults = (NSMutableArray *)v23;
  }
  -[STSSearchModel setRecentResults:](self->_zkwSearchModel, "setRecentResults:");

  [(SearchToShareAppViewController *)self updateConstraintsForZKWBrowser];
}

- (void)_updatePickerBottomInset
{
  id v2 = [(STSPicker *)self->_zkwPicker pickerView];
  [v2 setBottomInset:44.0];
}

- (void)_addResultToRecents:(id)a3
{
  id v4 = a3;
  id v5 = [v4 resultType];
  unsigned int v6 = [v5 isEqualToString:STSSearchModelResultTypeImage];

  if (v6)
  {
    recentResults = self->_recentResults;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000361C;
    v12[3] = &unk_100008328;
    id v8 = v4;
    id v13 = v8;
    id v9 = [(NSMutableArray *)recentResults indexOfObjectPassingTest:v12];
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [v8 setType:2];
      [v8 setFbr:&stru_100008430];
      [v8 setSectionBundleIdentifier:@"com.apple.parsec.image_search.msgs-zkw"];
      [(NSMutableArray *)self->_recentResults insertObject:v8 atIndex:0];
      if ((unint64_t)[(NSMutableArray *)self->_recentResults count] >= 4) {
        [(NSMutableArray *)self->_recentResults removeLastObject];
      }
    }
    else
    {
      id v10 = v9;
      id v11 = [(NSMutableArray *)self->_recentResults objectAtIndex:v9];
      [v11 setType:2];
      [v11 setFbr:&stru_100008430];
      [v11 setSectionBundleIdentifier:@"com.apple.parsec.image_search.msgs-zkw"];
      [(NSMutableArray *)self->_recentResults removeObjectAtIndex:v10];
      [(NSMutableArray *)self->_recentResults insertObject:v11 atIndex:0];
    }
    [(SearchToShareAppViewController *)self saveRecents];
  }
}

- (void)saveRecents
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  recentResults = self->_recentResults;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_100003794;
  id v11 = &unk_100008350;
  id v12 = self;
  id v5 = v3;
  id v13 = v5;
  [(NSMutableArray *)recentResults enumerateObjectsUsingBlock:&v8];
  if (objc_msgSend(v5, "count", v8, v9, v10, v11, v12))
  {
    unsigned int v6 = +[NSUserDefaults standardUserDefaults];
    id v7 = [v5 copy];
    [v6 setObject:v7 forKey:@"STSRecentResults1"];

    [v6 synchronize];
  }
}

- (id)dictForSearchResult:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [v4 setObject:@"image_search" forKey:@"result-type"];
    id v5 = [v3 url];
    uint64_t v6 = [v5 absoluteString];
    id v7 = (void *)v6;
    if (v6) {
      CFStringRef v8 = (const __CFString *)v6;
    }
    else {
      CFStringRef v8 = &stru_100008430;
    }
    [v4 setObject:v8 forKey:@"url"];

    uint64_t v9 = [v3 identifier];
    id v10 = (void *)v9;
    if (v9) {
      CFStringRef v11 = (const __CFString *)v9;
    }
    else {
      CFStringRef v11 = &stru_100008430;
    }
    [v4 setObject:v11 forKey:@"id"];

    uint64_t v12 = [v3 storeIdentifier];
    id v13 = (void *)v12;
    if (v12) {
      CFStringRef v14 = (const __CFString *)v12;
    }
    else {
      CFStringRef v14 = &stru_100008430;
    }
    [v4 setObject:v14 forKey:@"store-identifier"];

    uint64_t v15 = [v3 sts_appProviderName];
    v16 = (void *)v15;
    if (v15) {
      CFStringRef v17 = (const __CFString *)v15;
    }
    else {
      CFStringRef v17 = &stru_100008430;
    }
    [v4 setObject:v17 forKey:@"app-provider-name"];

    uint64_t v18 = [v3 sts_providerName];
    id v19 = (void *)v18;
    if (v18) {
      CFStringRef v20 = (const __CFString *)v18;
    }
    else {
      CFStringRef v20 = &stru_100008430;
    }
    [v4 setObject:v20 forKey:@"desc-provider-name"];

    id v21 = [v3 thumbnail];
    id v22 = [v21 urlValue];
    uint64_t v23 = [v22 absoluteString];
    v24 = (void *)v23;
    if (v23) {
      CFStringRef v25 = (const __CFString *)v23;
    }
    else {
      CFStringRef v25 = &stru_100008430;
    }
    [v4 setObject:v25 forKey:@"thumbnail-url"];

    v26 = [v3 sts_providerHostPageURL];

    uint64_t v27 = [v26 absoluteString];
    v28 = (void *)v27;
    if (v27) {
      CFStringRef v29 = (const __CFString *)v27;
    }
    else {
      CFStringRef v29 = &stru_100008430;
    }
    [v4 setObject:v29 forKey:@"meta-hostpage-url"];

    id v30 = [v4 copy];
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

- (id)searchResultForDict:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)SFSearchResult);
  uint64_t v5 = [v3 objectForKey:@"result-type"];
  uint64_t v6 = (void *)v5;
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  else {
    CFStringRef v7 = @"image_search";
  }
  [v4 setResultType:v7];

  CFStringRef v8 = [v3 objectForKey:@"url"];
  uint64_t v9 = +[NSURL URLWithString:v8];
  [v4 setUrl:v9];

  id v10 = [v3 objectForKey:@"id"];
  [v4 setIdentifier:v10];

  CFStringRef v11 = [v3 objectForKey:@"store-identifier"];
  [v4 setStoreIdentifier:v11];

  [v4 setType:2];
  [v4 setSectionBundleIdentifier:@"com.apple.parsec.image_search.msgs-zkw"];
  id v12 = objc_alloc((Class)SFURLImage);
  id v13 = [v3 objectForKey:@"thumbnail-url"];
  CFStringRef v14 = +[NSURL URLWithString:v13];
  id v15 = [v12 initWithURL:v14];

  [v4 setThumbnail:v15];
  id v16 = objc_alloc_init((Class)SFDescriptionCardSection);
  CFStringRef v17 = [v3 objectForKey:@"desc-provider-name"];
  [v16 setTitle:v17];

  id v18 = objc_alloc_init((Class)SFMetaInfoCardSection);
  id v19 = [v3 objectForKey:@"meta-hostpage-url"];
  CFStringRef v20 = +[NSURL URLWithString:v19];
  [v18 setHostPageURL:v20];

  id v21 = objc_alloc_init((Class)SFCard);
  v26[0] = v16;
  v26[1] = v18;
  id v22 = +[NSArray arrayWithObjects:v26 count:2];
  [v21 setCardSections:v22];

  id v23 = objc_alloc_init((Class)SFPunchout);
  v24 = [v3 objectForKey:@"app-provider-name"];

  [v23 setLabel:v24];
  [v4 setPunchout:v23];
  [v4 setInlineCard:v21];

  return v4;
}

- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v10)
    {
      int v12 = 138412290;
      id v13 = v7;
      CFStringRef v11 = "session %@ parsec bag failed to load";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0xCu);
    }
  }
  else if (v10)
  {
    int v12 = 138412290;
    id v13 = v7;
    CFStringRef v11 = "session %@ parsec bag loaded";
    goto LABEL_6;
  }
}

- (id)requestExpandedCompletion
{
  return self->_requestExpandedCompletion;
}

- (void)setRequestExpandedCompletion:(id)a3
{
}

- (id)engagementFeedbackBlock
{
  return self->_engagementFeedbackBlock;
}

- (void)setEngagementFeedbackBlock:(id)a3
{
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_engagementFeedbackBlock, 0);
  objc_storeStrong(&self->_requestExpandedCompletion, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_recentResults, 0);
  objc_storeStrong((id *)&self->_searchBrowserSearchModel, 0);
  objc_storeStrong((id *)&self->_zkwSearchModel, 0);
  objc_storeStrong((id *)&self->_searchBrowserRootViewController, 0);
  objc_storeStrong((id *)&self->_zkwHeaderView, 0);

  objc_storeStrong((id *)&self->_zkwPicker, 0);
}

@end