@interface STSMessagesAppViewController
- (BOOL)browserIsPresentedFullscreen:(id)a3;
- (BOOL)searchBrowserRootViewControllerSearchBarShouldBeginEditing:(id)a3;
- (id)dictForSearchResult:(id)a3;
- (id)engagementFeedbackBlock;
- (id)requestExpandedCompletion;
- (id)searchResultForDict:(id)a3;
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
- (void)didTransitionToPresentationStyle:(unint64_t)a3;
- (void)requestExpandedPresentationStyleForBrowser:(id)a3 completion:(id)a4;
- (void)saveRecents;
- (void)searchBrowserRootViewControllerDidSelectCancel:(id)a3;
- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5;
- (void)setEngagementFeedbackBlock:(id)a3;
- (void)setRequestExpandedCompletion:(id)a3;
- (void)updateConstraintsForSearchBrowser;
- (void)updateConstraintsForZKWBrowser;
- (void)updateRecentResults:(id)a3;
- (void)updateSnapshotWithCompletionBlock:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActiveWithConversation:(id)a3;
- (void)willResignActiveWithConversation:(id)a3;
- (void)willTransitionToPresentationStyle:(unint64_t)a3;
@end

@implementation STSMessagesAppViewController

- (void)updateConstraintsForZKWBrowser
{
  +[NSLayoutConstraint deactivateConstraints:self->_constraints];
  [(NSMutableArray *)self->_constraints removeAllObjects];
  v3 = [(STSPicker *)self->_zkwPicker view];
  v4 = [v3 topAnchor];
  v5 = [(STSMessagesAppViewController *)self view];
  v6 = [v5 topAnchor];
  id v23 = [v4 constraintEqualToAnchor:v6];

  v7 = [(STSPicker *)self->_zkwPicker view];
  v8 = [v7 bottomAnchor];
  v9 = [(STSMessagesAppViewController *)self view];
  v10 = [v9 superview];
  v11 = [v10 bottomAnchor];
  v12 = [v8 constraintEqualToAnchor:v11];

  v13 = [(STSPicker *)self->_zkwPicker view];
  v14 = [v13 leadingAnchor];
  v15 = [(STSMessagesAppViewController *)self view];
  v16 = [v15 leadingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];

  v18 = [(STSPicker *)self->_zkwPicker view];
  v19 = [v18 trailingAnchor];
  v20 = [(STSMessagesAppViewController *)self view];
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
  v5 = [(STSMessagesAppViewController *)self view];
  v6 = [v5 topAnchor];
  id v23 = [v4 constraintEqualToAnchor:v6];

  v7 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController view];
  v8 = [v7 bottomAnchor];
  v9 = [(STSMessagesAppViewController *)self view];
  v10 = [v9 superview];
  v11 = [v10 bottomAnchor];
  v12 = [v8 constraintEqualToAnchor:v11];

  v13 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController view];
  v14 = [v13 leadingAnchor];
  v15 = [(STSMessagesAppViewController *)self view];
  v16 = [v15 leadingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];

  v18 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController view];
  v19 = [v18 trailingAnchor];
  v20 = [(STSMessagesAppViewController *)self view];
  v21 = [v20 trailingAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];

  [(NSMutableArray *)self->_constraints addObject:v23];
  [(NSMutableArray *)self->_constraints addObject:v12];
  [(NSMutableArray *)self->_constraints addObject:v17];
  [(NSMutableArray *)self->_constraints addObject:v22];
  +[NSLayoutConstraint activateConstraints:self->_constraints];
}

- (void)awakeFromNib
{
  v5.receiver = self;
  v5.super_class = (Class)STSMessagesAppViewController;
  [(STSMessagesAppViewController *)&v5 awakeFromNib];
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  recentResults = self->_recentResults;
  self->_recentResults = v3;

  self->_updateRecents = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STSMessagesAppViewController;
  [(STSMessagesAppViewController *)&v4 viewWillAppear:a3];
  [(STSMessagesAppViewController *)self _updatePickerBottomInset];
}

- (void)viewDidLoad
{
  id v2 = [(STSMessagesAppViewController *)self view];
  [v2 setNeedsLayout];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STSMessagesAppViewController;
  [(STSMessagesAppViewController *)&v5 viewDidAppear:a3];
  if (+[UIScribbleInteraction isPencilInputExpected])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Launching app to expanded presentation because the user is expected to use handwriting", v4, 2u);
    }
    [(STSMessagesAppViewController *)self requestPresentationStyle:1];
  }
  [(STSMessagesAppViewController *)self setEngagementFeedbackBlock:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STSMessagesAppViewController;
  [(STSMessagesAppViewController *)&v4 viewDidDisappear:a3];
  [(STSMessagesAppViewController *)self setEngagementFeedbackBlock:0];
}

- (void)viewDidLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)STSMessagesAppViewController;
  [(STSMessagesAppViewController *)&v12 viewDidLayoutSubviews];
  v3 = [(STSPicker *)self->_zkwPicker pickerView];
  [v3 setTopInset:4.0];

  objc_super v4 = [(STSPicker *)self->_zkwPicker pickerView];
  objc_super v5 = [(STSMessagesAppViewController *)self view];
  [v5 layoutMargins];
  [v4 setBottomInset:v6];

  searchBrowserRootViewController = self->_searchBrowserRootViewController;
  v8 = [(STSMessagesAppViewController *)self view];
  [v8 layoutMargins];
  -[STSSearchBrowserRootViewController setTopInset:](searchBrowserRootViewController, "setTopInset:");

  v9 = self->_searchBrowserRootViewController;
  v10 = [(STSMessagesAppViewController *)self view];
  [v10 layoutMargins];
  [(STSSearchBrowserRootViewController *)v9 setBottomInset:v11];
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  p_currentConversation = &self->_currentConversation;
  objc_storeStrong((id *)&self->_currentConversation, a3);
  id v6 = a3;
  [(STSMessagesAppViewController *)self _setup];
  zkwSearchModel = self->_zkwSearchModel;
  v8 = [(MSConversation *)*p_currentConversation conversationIdentifier];
  [(STSSearchModel *)zkwSearchModel setConversationID:v8];

  searchBrowserSearchModel = self->_searchBrowserSearchModel;
  v10 = [(MSConversation *)*p_currentConversation conversationIdentifier];
  [(STSSearchModel *)searchBrowserSearchModel setConversationID:v10];

  [(STSPicker *)self->_zkwPicker performZKWSearchQuery];
  [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController fetchCategories];
  id v11 = +[STSFeedbackReporter sharedInstance];

  [v11 searchViewDidAppearWithEvent:7];
}

- (void)willResignActiveWithConversation:(id)a3
{
  zkwPicker = self->_zkwPicker;
  id v5 = a3;
  [(STSPicker *)zkwPicker willResignActiveWithConversation:v5];
  id v6 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController pickerViewController];
  [v6 willResignActiveWithConversation:v5];

  id v7 = +[STSFeedbackReporter sharedInstance];
  [v7 searchViewDidDisappear];
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  p_searchBrowserRootViewController = &self->_searchBrowserRootViewController;
  -[STSSearchBrowserRootViewController setPresentationStyle:](self->_searchBrowserRootViewController, "setPresentationStyle:");
  if (a3 == 1)
  {
    id v6 = [(STSMessagesAppViewController *)self requestExpandedCompletion];

    if (v6)
    {
      id v7 = [(STSMessagesAppViewController *)self requestExpandedCompletion];
      v7[2]();
    }
  }
  [(STSMessagesAppViewController *)self setRequestExpandedCompletion:0];
  v8 = [(STSSearchBrowserRootViewController *)*p_searchBrowserRootViewController parentViewController];

  if (!v8) {
    p_searchBrowserRootViewController = &self->_zkwPicker;
  }
  v9 = *p_searchBrowserRootViewController;

  [(STSSearchBrowserRootViewController *)v9 sendVisibleResultsFeedback];
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  if (!a3)
  {
    uint64_t v4 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController parentViewController];
    if (v4
      && (id v5 = (void *)v4,
          unsigned __int8 v6 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController isPickerVisible], v5, (v6 & 1) == 0))
    {
      id v7 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController pickerViewController];
      [v7 willTransitionToPresentationStyle:0];

      v8 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController pickerViewController];
      [v8 resetContent];

      searchBrowserRootViewController = self->_searchBrowserRootViewController;
      zkwPicker = self->_zkwPicker;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000020BC;
      v12[3] = &unk_100008280;
      v12[4] = self;
      [(STSMessagesAppViewController *)self _transitionContentFromViewController:searchBrowserRootViewController toViewController:zkwPicker animations:v12 completion:0];
    }
    else
    {
      [(STSPicker *)self->_zkwPicker willTransitionToPresentationStyle:0];
      id v11 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController pickerViewController];
      [v11 willTransitionToPresentationStyle:0];
    }
  }
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  zkwPicker = self->_zkwPicker;
  uint64_t v4 = (void (**)(id, id))a3;
  id v5 = [(STSPicker *)zkwPicker snapshotImage];
  v4[2](v4, v5);
}

- (void)browser:(id)a3 didSelectCategoryResult:(id)a4
{
}

- (void)browser:(id)a3 didSelectProviderLink:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v7 = [(STSMessagesAppViewController *)self extensionContext];
    unsigned __int8 v6 = [v5 sts_providerHostPageURL];

    [v7 openURL:v6 completionHandler:0];
  }
}

- (void)browser:(id)a3 didSelectResult:(id)a4 withPayload:(id)a5
{
  v8 = (STSPicker *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 copy];
  objc_super v12 = [v10 imageURL];

  if (v12)
  {
    zkwPicker = self->_zkwPicker;
    if (zkwPicker != v8) {
      [(STSPicker *)zkwPicker resetContent];
    }
    v14 = [v9 sts_appProviderName];
    v15 = [v9 storeIdentifier];
    v16 = v15;
    if (v15)
    {
      v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v15 integerValue]);
    }
    else
    {
      v17 = 0;
    }
    currentConversation = self->_currentConversation;
    id v23 = [v10 imageURL];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100002518;
    v33[3] = &unk_1000082A8;
    v33[4] = self;
    id v34 = v9;
    [(MSConversation *)currentConversation _insertAttachment:v23 adamID:v17 appName:v14 completionHandler:v33];

    v8 = v26;
  }
  else
  {
    v18 = [v10 videoURL];

    if (v18)
    {
      v19 = self->_currentConversation;
      v20 = [v10 videoURL];
      v21 = [v20 absoluteString];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000025F0;
      v32[3] = &unk_1000082D0;
      v32[4] = self;
      [(MSConversation *)v19 insertText:v21 completionHandler:v32];
    }
    else
    {
      [(STSMessagesAppViewController *)self requestPresentationStyle:0];
    }
  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000025FC;
  v30[3] = &unk_100008280;
  id v31 = v11;
  id v24 = v11;
  [(STSMessagesAppViewController *)self setEngagementFeedbackBlock:v30];
  objc_initWeak(&location, self);
  dispatch_time_t v25 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002654;
  block[3] = &unk_1000082F8;
  objc_copyWeak(&v28, &location);
  dispatch_after(v25, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)browserSearchBarButtonClicked:(id)a3
{
  [(STSPicker *)self->_zkwPicker cancelImageDownloads];
  uint64_t v4 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController searchHeaderView];
  id v5 = [v4 searchBar];
  [v5 setText:0];

  [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController showCategories];
  zkwPicker = self->_zkwPicker;
  searchBrowserRootViewController = self->_searchBrowserRootViewController;
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002810;
  v9[3] = &unk_100008280;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002818;
  v8[3] = &unk_100008280;
  [(STSMessagesAppViewController *)self _transitionContentFromViewController:zkwPicker toViewController:searchBrowserRootViewController animations:v9 completion:v8];
}

- (void)browser:(id)a3 didSearchFor:(id)a4
{
  id v5 = a4;
  [(STSPicker *)self->_zkwPicker cancelImageDownloads];
  zkwPicker = self->_zkwPicker;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000029AC;
  v8[3] = &unk_100008320;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(STSMessagesAppViewController *)self requestExpandedPresentationStyleForBrowser:zkwPicker completion:v8];
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
  v10[2] = sub_100002C34;
  v10[3] = &unk_100008320;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  [(STSMessagesAppViewController *)self requestExpandedPresentationStyleForBrowser:zkwPicker completion:v10];
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
  v10[2] = sub_100002E80;
  v10[3] = &unk_100008320;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  [(STSMessagesAppViewController *)self requestExpandedPresentationStyleForBrowser:zkwPicker completion:v10];
}

- (BOOL)browserIsPresentedFullscreen:(id)a3
{
  return [(STSMessagesAppViewController *)self presentationStyle] == (id)1;
}

- (void)requestExpandedPresentationStyleForBrowser:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(void))a4;
  if ([(STSMessagesAppViewController *)self presentationStyle] == (id)1)
  {
    if (v5) {
      v5[2]();
    }
  }
  else
  {
    [(STSMessagesAppViewController *)self setRequestExpandedCompletion:v5];
    [(STSMessagesAppViewController *)self requestPresentationStyle:1];
  }
}

- (void)browserDidTapLogo:(id)a3
{
  uint64_t v4 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController parentViewController];

  if (v4)
  {
    id v5 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController searchHeaderView];
    unsigned __int8 v6 = [v5 searchBar];
    id v14 = [v6 text];

    id v7 = +[NSCharacterSet URLQueryAllowedCharacterSet];
    v8 = [v14 stringByAddingPercentEncodingWithAllowedCharacters:v7];

    id v9 = +[NSString stringWithFormat:@"%@?q=%@", @"http://www.bing.com/images/search", v8];
    id v10 = +[NSURL URLWithString:v9];

    id v11 = +[STSFeedbackReporter sharedInstance];
    [v11 didEngageProviderLogo];

    objc_super v12 = [(STSMessagesAppViewController *)self extensionContext];
    [v12 openURL:v10 completionHandler:0];
  }
  else
  {
    id v14 = +[NSURL URLWithString:@"http://www.bing.com/images/search"];
    v13 = +[STSFeedbackReporter sharedInstance];
    [v13 didEngageProviderLogo];

    v8 = [(STSMessagesAppViewController *)self extensionContext];
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

    unsigned __int8 v6 = self->_zkwSearchModel;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100003398;
    v11[3] = &unk_100008348;
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
    v10[2] = sub_1000034AC;
    v10[3] = &unk_100008280;
    v10[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000034B4;
    v9[3] = &unk_100008280;
    [(STSMessagesAppViewController *)self _transitionContentFromViewController:searchBrowserRootViewController toViewController:zkwPicker animations:v10 completion:v9];
  }
}

- (BOOL)searchBrowserRootViewControllerSearchBarShouldBeginEditing:(id)a3
{
  id v4 = a3;
  if ([(STSMessagesAppViewController *)self presentationStyle])
  {
    BOOL v5 = 1;
  }
  else
  {
    zkwPicker = self->_zkwPicker;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000035DC;
    v8[3] = &unk_100008280;
    id v9 = v4;
    [(STSMessagesAppViewController *)self requestExpandedPresentationStyleForBrowser:zkwPicker completion:v8];
    BOOL v5 = [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController presentationStyle] == (id)1;
  }
  return v5;
}

- (void)updateRecentResults:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "updating recent results: %@", (uint8_t *)&v7, 0xCu);
  }
  BOOL v5 = (NSMutableArray *)[v4 mutableCopy];
  recentResults = self->_recentResults;
  self->_recentResults = v5;

  [(STSMessagesAppViewController *)self saveRecents];
}

- (void)_transitionContentFromViewController:(id)a3 toViewController:(id)a4 animations:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(void))a6;
  [(STSMessagesAppViewController *)self addChildViewController:v11];
  if (v10)
  {
    id v14 = [v10 parentViewController];

    if (!v14) {
      [(STSMessagesAppViewController *)self addChildViewController:v10];
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
    v18[2] = sub_1000039A4;
    v18[3] = &unk_100008370;
    id v19 = v10;
    v20 = self;
    id v21 = v11;
    v22 = v13;
    [(STSMessagesAppViewController *)self transitionFromViewController:v19 toViewController:v21 duration:5242880 options:v12 animations:v18 completion:v15];
  }
  else
  {
    v16 = [(STSMessagesAppViewController *)self view];
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
  v54 = v3;
  uint64_t v4 = +[PARSession sessionWithConfiguration:v3 delegate:self startImmediately:1];
  id v5 = objc_alloc_init((Class)STSSearchModel);
  objc_storeStrong((id *)&self->_searchBrowserSearchModel, v5);
  v51 = (void *)v4;
  [v5 setParsecSession:v4];
  v53 = v5;
  unsigned __int8 v6 = (STSSearchBrowserRootViewController *)[objc_alloc((Class)STSSearchBrowserRootViewController) initWithSearchModel:v5];
  searchBrowserRootViewController = self->_searchBrowserRootViewController;
  self->_searchBrowserRootViewController = v6;

  [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController setSelectionDelegate:self];
  [(STSSearchBrowserRootViewController *)self->_searchBrowserRootViewController setPickerSelectionDelegate:self];
  id v8 = objc_alloc_init((Class)STSSearchModel);
  [v8 setParsecSession:v4];
  objc_storeStrong((id *)&self->_zkwSearchModel, v8);
  p_zkwSearchModel = &self->_zkwSearchModel;
  [(STSSearchModel *)self->_zkwSearchModel setRecentsDelegate:self];
  v52 = v8;
  id v9 = (STSPicker *)[objc_alloc((Class)STSPicker) initWithSearchModel:v8 showSuggestions:1];
  zkwPicker = self->_zkwPicker;
  self->_zkwPicker = v9;

  [(STSPicker *)self->_zkwPicker setSelectionDelegate:self];
  id v11 = +[NSMutableArray array];
  id v12 = [(STSMessagesAppViewController *)self view];
  v13 = [v12 topAnchor];
  id v14 = [(STSMessagesAppViewController *)self parentViewController];
  double v15 = [v14 view];
  v16 = [v15 topAnchor];
  v50 = [v13 constraintEqualToAnchor:v16];

  v17 = [(STSMessagesAppViewController *)self view];
  v18 = [v17 bottomAnchor];
  id v19 = [(STSMessagesAppViewController *)self parentViewController];
  v20 = [v19 view];
  id v21 = [v20 safeAreaLayoutGuide];
  v22 = [v21 bottomAnchor];
  v55 = [v18 constraintEqualToAnchor:v22];

  id v23 = [(STSMessagesAppViewController *)self view];
  id v24 = [v23 leadingAnchor];
  dispatch_time_t v25 = [(STSMessagesAppViewController *)self parentViewController];
  v26 = [v25 view];
  v27 = [v26 leadingAnchor];
  id v28 = [v24 constraintEqualToAnchor:v27];

  v29 = [(STSMessagesAppViewController *)self view];
  v30 = [v29 trailingAnchor];
  id v31 = [(STSMessagesAppViewController *)self parentViewController];
  v32 = [v31 view];
  v33 = [v32 trailingAnchor];
  id v34 = [v30 constraintEqualToAnchor:v33];

  [v11 addObject:v50];
  [v11 addObject:v55];
  [v11 addObject:v28];
  [v11 addObject:v34];
  +[NSLayoutConstraint activateConstraints:v11];
  v35 = (STSZKWBrowserHeaderView *)objc_alloc_init((Class)STSZKWBrowserHeaderView);
  zkwHeaderView = self->_zkwHeaderView;
  self->_zkwHeaderView = v35;

  v37 = [(STSPicker *)self->_zkwPicker pickerView];
  [v37 setHeaderView:self->_zkwHeaderView];

  [(STSZKWBrowserHeaderView *)self->_zkwHeaderView setDelegate:self->_zkwPicker];
  v38 = +[STSFeedbackReporter sharedInstance];
  [v38 setParsecSession:v51];

  v39 = +[NSMutableArray array];
  constraints = self->_constraints;
  self->_constraints = v39;

  v41 = self->_zkwPicker;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_100004060;
  v58[3] = &unk_100008280;
  v58[4] = self;
  [(STSMessagesAppViewController *)self _transitionContentFromViewController:0 toViewController:v41 animations:0 completion:v58];
  v42 = +[NSUserDefaults standardUserDefaults];
  [v42 setObject:0 forKey:@"STSRecentResults"];
  v43 = [v42 objectForKey:@"STSRecentResults1"];
  id v44 = objc_alloc_init((Class)NSMutableArray);
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100004068;
  v56[3] = &unk_100008398;
  v56[4] = self;
  id v45 = v44;
  id v57 = v45;
  [v43 enumerateObjectsUsingBlock:v56];
  p_recentResults = &self->_recentResults;
  objc_storeStrong((id *)p_recentResults, v44);
  if (!*p_recentResults)
  {
    uint64_t v47 = objc_opt_new();
    v48 = *p_recentResults;
    *p_recentResults = (NSMutableArray *)v47;
  }
  -[STSSearchModel setRecentResults:](*p_zkwSearchModel, "setRecentResults:");
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
    v12[2] = sub_1000042C8;
    v12[3] = &unk_1000083C0;
    id v8 = v4;
    id v13 = v8;
    id v9 = [(NSMutableArray *)recentResults indexOfObjectPassingTest:v12];
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [v8 setType:2];
      [v8 setFbr:&stru_1000084C8];
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
      [v11 setFbr:&stru_1000084C8];
      [v11 setSectionBundleIdentifier:@"com.apple.parsec.image_search.msgs-zkw"];
      [(NSMutableArray *)self->_recentResults removeObjectAtIndex:v10];
      [(NSMutableArray *)self->_recentResults insertObject:v11 atIndex:0];
    }
    [(STSMessagesAppViewController *)self saveRecents];
  }
}

- (void)saveRecents
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  recentResults = self->_recentResults;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_100004430;
  id v11 = &unk_1000083E8;
  id v12 = self;
  id v13 = v3;
  id v5 = v3;
  [(NSMutableArray *)recentResults enumerateObjectsUsingBlock:&v8];
  unsigned int v6 = +[NSUserDefaults standardUserDefaults];
  id v7 = [v5 copy];
  [v6 setObject:v7 forKey:@"STSRecentResults1"];

  [v6 synchronize];
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
      CFStringRef v8 = &stru_1000084C8;
    }
    [v4 setObject:v8 forKey:@"url"];

    uint64_t v9 = [v3 identifier];
    id v10 = (void *)v9;
    if (v9) {
      CFStringRef v11 = (const __CFString *)v9;
    }
    else {
      CFStringRef v11 = &stru_1000084C8;
    }
    [v4 setObject:v11 forKey:@"id"];

    uint64_t v12 = [v3 storeIdentifier];
    id v13 = (void *)v12;
    if (v12) {
      CFStringRef v14 = (const __CFString *)v12;
    }
    else {
      CFStringRef v14 = &stru_1000084C8;
    }
    [v4 setObject:v14 forKey:@"store-identifier"];

    uint64_t v15 = [v3 sts_appProviderName];
    v16 = (void *)v15;
    if (v15) {
      CFStringRef v17 = (const __CFString *)v15;
    }
    else {
      CFStringRef v17 = &stru_1000084C8;
    }
    [v4 setObject:v17 forKey:@"app-provider-name"];

    uint64_t v18 = [v3 sts_providerName];
    id v19 = (void *)v18;
    if (v18) {
      CFStringRef v20 = (const __CFString *)v18;
    }
    else {
      CFStringRef v20 = &stru_1000084C8;
    }
    [v4 setObject:v20 forKey:@"desc-provider-name"];

    id v21 = [v3 thumbnail];
    v22 = [v21 urlValue];
    uint64_t v23 = [v22 absoluteString];
    id v24 = (void *)v23;
    if (v23) {
      CFStringRef v25 = (const __CFString *)v23;
    }
    else {
      CFStringRef v25 = &stru_1000084C8;
    }
    [v4 setObject:v25 forKey:@"thumbnail-url"];

    v26 = [v3 sts_providerHostPageURL];

    uint64_t v27 = [v26 absoluteString];
    id v28 = (void *)v27;
    if (v27) {
      CFStringRef v29 = (const __CFString *)v27;
    }
    else {
      CFStringRef v29 = &stru_1000084C8;
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
  v22 = +[NSArray arrayWithObjects:v26 count:2];
  [v21 setCardSections:v22];

  id v23 = objc_alloc_init((Class)SFPunchout);
  id v24 = [v3 objectForKey:@"app-provider-name"];

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

  objc_storeStrong((id *)&self->_currentConversation, 0);
}

@end