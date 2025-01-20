@interface iFBASurveyDetailViewController
- (BOOL)isLoading;
- (BOOL)isObserving;
- (FBAAdaptiveWebView)webView;
- (FBKContentItem)contentItem;
- (FBKTeam)team;
- (NSLayoutConstraint)webViewHeightConstraint;
- (NSObject)dataChangeObserver;
- (UIButton)actionButton;
- (UIScrollView)scrollView;
- (UIView)actionView;
- (iFBASurveyDetailViewController)initWithCoder:(id)a3;
- (id)surveyBugForm;
- (void)dealloc;
- (void)didPressTakeSurveyButton:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActionButton:(id)a3;
- (void)setActionView:(id)a3;
- (void)setContentItem:(id)a3;
- (void)setDataChangeObserver:(id)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setIsObserving:(BOOL)a3;
- (void)setScrollView:(id)a3;
- (void)setTeam:(id)a3;
- (void)setWebView:(id)a3;
- (void)setWebViewHeightConstraint:(id)a3;
- (void)updateActionView;
- (void)updateNavigation;
- (void)updateScrollView;
- (void)updateWebView;
- (void)updateWebViewFittingSize;
- (void)updateWebViewHeight:(double)a3;
- (void)viewDidLoad;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation iFBASurveyDetailViewController

- (iFBASurveyDetailViewController)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)iFBASurveyDetailViewController;
  v3 = [(iFBASurveyDetailViewController *)&v12 initWithCoder:a3];
  if (v3)
  {
    id v4 = objc_alloc_init((Class)WKWebViewConfiguration);
    [v4 setSelectionGranularity:1];
    [v4 _setColorFilterEnabled:1];
    v5 = -[FBAAdaptiveWebView initWithFrame:configuration:]([FBAAdaptiveWebView alloc], "initWithFrame:configuration:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    webView = v3->_webView;
    v3->_webView = v5;

    v7 = +[UIColor clearColor];
    [(FBAAdaptiveWebView *)v3->_webView setBackgroundColor:v7];

    v8 = +[UIColor clearColor];
    v9 = [(FBAAdaptiveWebView *)v3->_webView scrollView];
    [v9 setBackgroundColor:v8];

    [(FBAAdaptiveWebView *)v3->_webView setNavigationDelegate:v3];
    webViewHeightConstraint = v3->_webViewHeightConstraint;
    v3->_webViewHeightConstraint = 0;

    v3->_isLoading = 0;
    v3->_isObserving = 0;
  }
  return v3;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)iFBASurveyDetailViewController;
  [(iFBASurveyDetailViewController *)&v23 viewDidLoad];
  v3 = +[UIColor systemBackgroundColor];
  id v4 = [(iFBASurveyDetailViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(iFBASurveyDetailViewController *)self navigationItem];
  [v5 setLargeTitleDisplayMode:2];

  v6 = +[UIColor systemBackgroundColor];
  v7 = [(iFBASurveyDetailViewController *)self scrollView];
  [v7 setBackgroundColor:v6];

  v8 = +[UIColor systemBackgroundColor];
  v9 = [(iFBASurveyDetailViewController *)self actionView];
  [v9 setBackgroundColor:v8];

  v10 = [(iFBASurveyDetailViewController *)self webView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(iFBASurveyDetailViewController *)self actionView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(iFBASurveyDetailViewController *)self updateScrollView];
  [(iFBASurveyDetailViewController *)self updateActionView];
  objc_super v12 = [(iFBASurveyDetailViewController *)self webView];
  v13 = [v12 scrollView];
  [v13 addObserver:self forKeyPath:@"contentSize" options:0 context:off_1001211C0];

  objc_initWeak(&location, self);
  v14 = +[FBKData sharedInstance];
  v15 = [v14 mainQueueContext];
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100003AEC;
  v20 = &unk_1000F24F0;
  objc_copyWeak(&v21, &location);
  v16 = [v15 addObjectsDidChangeNotificationObserver:&v17];
  -[iFBASurveyDetailViewController setDataChangeObserver:](self, "setDataChangeObserver:", v16, v17, v18, v19, v20);

  self->_isObserving = 1;
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  if (self->_isObserving)
  {
    v3 = +[FBKData sharedInstance];
    id v4 = [v3 notificationCenter];
    [v4 removeObserver:self];

    v5 = +[FBKData sharedInstance];
    v6 = [v5 notificationCenter];
    v7 = [(iFBASurveyDetailViewController *)self dataChangeObserver];
    [v6 removeObserver:v7];

    [(iFBASurveyDetailViewController *)self setDataChangeObserver:0];
    v8 = [(iFBASurveyDetailViewController *)self webView];
    v9 = [v8 scrollView];
    [v9 removeObserver:self forKeyPath:@"contentSize"];
  }
  v10.receiver = self;
  v10.super_class = (Class)iFBASurveyDetailViewController;
  [(iFBASurveyDetailViewController *)&v10 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001211C0 == a6)
  {
    [(iFBASurveyDetailViewController *)self updateWebViewFittingSize];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)iFBASurveyDetailViewController;
    -[iFBASurveyDetailViewController observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (id)surveyBugForm
{
  v2 = [(iFBASurveyDetailViewController *)self contentItem];
  v3 = [v2 detailedItem];

  return v3;
}

- (void)setContentItem:(id)a3
{
  objc_storeStrong((id *)&self->_contentItem, a3);
  id v5 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100004114;
  v12[3] = &unk_1000F2518;
  v12[4] = self;
  objc_super v6 = objc_retainBlock(v12);
  v7 = +[FBKData sharedInstance];
  v8 = [(iFBASurveyDetailViewController *)self team];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004164;
  v10[3] = &unk_1000F2568;
  v10[4] = self;
  id v11 = v6;
  v9 = v6;
  [v7 refreshSurveyFromContentItem:v5 forTeam:v8 completion:v10];
}

- (void)updateNavigation
{
  uint64_t v3 = [(iFBASurveyDetailViewController *)self surveyBugForm];
  if (v3
    && (id v4 = (void *)v3,
        unsigned __int8 v5 = [(iFBASurveyDetailViewController *)self isLoading],
        v4,
        (v5 & 1) == 0))
  {
    id v8 = [(iFBASurveyDetailViewController *)self surveyBugForm];
    objc_super v6 = [v8 name];
    v7 = [(iFBASurveyDetailViewController *)self navigationItem];
    [v7 setTitle:v6];
  }
  else
  {
    id v8 = [(iFBASurveyDetailViewController *)self navigationItem];
    [v8 setTitle:&stru_1000F6658];
  }
}

- (void)updateScrollView
{
  uint64_t v3 = [(iFBASurveyDetailViewController *)self scrollView];

  if (v3)
  {
    id v4 = [(iFBASurveyDetailViewController *)self webView];
    unsigned __int8 v5 = [v4 superview];
    objc_super v6 = [(iFBASurveyDetailViewController *)self scrollView];
    unsigned __int8 v7 = [v5 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      id v8 = [(iFBASurveyDetailViewController *)self scrollView];
      v9 = [(iFBASurveyDetailViewController *)self webView];
      [v8 addSubview:v9];

      objc_super v10 = [(iFBASurveyDetailViewController *)self scrollView];
      id v11 = [(iFBASurveyDetailViewController *)self scrollView];
      objc_super v12 = [(iFBASurveyDetailViewController *)self webView];
      v13 = +[NSLayoutConstraint constraintWithItem:v11 attribute:7 relatedBy:0 toItem:v12 attribute:7 multiplier:1.0 constant:0.0];
      [v10 addConstraint:v13];

      v14 = [(iFBASurveyDetailViewController *)self scrollView];
      v15 = [(iFBASurveyDetailViewController *)self scrollView];
      v16 = [(iFBASurveyDetailViewController *)self webView];
      v17 = +[NSLayoutConstraint constraintWithItem:v15 attribute:5 relatedBy:0 toItem:v16 attribute:5 multiplier:1.0 constant:0.0];
      [v14 addConstraint:v17];

      uint64_t v18 = [(iFBASurveyDetailViewController *)self scrollView];
      v19 = [(iFBASurveyDetailViewController *)self scrollView];
      v20 = [(iFBASurveyDetailViewController *)self webView];
      id v21 = +[NSLayoutConstraint constraintWithItem:v19 attribute:3 relatedBy:0 toItem:v20 attribute:3 multiplier:1.0 constant:0.0];
      [v18 addConstraint:v21];
    }
    v22 = [(iFBASurveyDetailViewController *)self actionView];
    objc_super v23 = [v22 superview];
    v24 = [(iFBASurveyDetailViewController *)self scrollView];
    unsigned __int8 v25 = [v23 isEqual:v24];

    if ((v25 & 1) == 0)
    {
      v26 = [(iFBASurveyDetailViewController *)self scrollView];
      v27 = [(iFBASurveyDetailViewController *)self actionView];
      [v26 addSubview:v27];

      v28 = [(iFBASurveyDetailViewController *)self scrollView];
      v29 = [(iFBASurveyDetailViewController *)self scrollView];
      v30 = [(iFBASurveyDetailViewController *)self actionView];
      v31 = +[NSLayoutConstraint constraintWithItem:v29 attribute:7 relatedBy:0 toItem:v30 attribute:7 multiplier:1.0 constant:0.0];
      [v28 addConstraint:v31];

      v32 = [(iFBASurveyDetailViewController *)self scrollView];
      v33 = [(iFBASurveyDetailViewController *)self scrollView];
      v34 = [(iFBASurveyDetailViewController *)self actionView];
      v35 = +[NSLayoutConstraint constraintWithItem:v33 attribute:5 relatedBy:0 toItem:v34 attribute:5 multiplier:1.0 constant:0.0];
      [v32 addConstraint:v35];

      v36 = [(iFBASurveyDetailViewController *)self scrollView];
      v37 = [(iFBASurveyDetailViewController *)self webView];
      v38 = [(iFBASurveyDetailViewController *)self actionView];
      v39 = +[NSLayoutConstraint constraintWithItem:v37 attribute:4 relatedBy:0 toItem:v38 attribute:3 multiplier:1.0 constant:0.0];
      [v36 addConstraint:v39];

      id v43 = [(iFBASurveyDetailViewController *)self scrollView];
      v40 = [(iFBASurveyDetailViewController *)self scrollView];
      v41 = [(iFBASurveyDetailViewController *)self actionView];
      v42 = +[NSLayoutConstraint constraintWithItem:v40 attribute:4 relatedBy:0 toItem:v41 attribute:4 multiplier:1.0 constant:0.0];
      [v43 addConstraint:v42];
    }
  }
}

- (void)updateWebView
{
  uint64_t v3 = [(iFBASurveyDetailViewController *)self surveyBugForm];
  if (v3
    && (id v4 = (void *)v3,
        unsigned __int8 v5 = [(iFBASurveyDetailViewController *)self isLoading],
        v4,
        (v5 & 1) == 0))
  {
    v9 = [(iFBASurveyDetailViewController *)self webView];
    objc_super v10 = [v9 scrollView];
    [v10 setScrollEnabled:0];

    id v14 = [(iFBASurveyDetailViewController *)self webView];
    unsigned __int8 v7 = [(iFBASurveyDetailViewController *)self surveyBugForm];
    id v11 = [v7 fullAnnouncementHTML];
    objc_super v12 = +[iFBAConstants appleSeedURL];
    id v13 = [v14 loadHTMLString:v11 baseURL:v12];
  }
  else
  {
    objc_super v6 = +[NSURL URLWithString:@"about://blank"];
    id v14 = +[NSURLRequest requestWithURL:v6];

    unsigned __int8 v7 = [(iFBASurveyDetailViewController *)self webView];
    id v8 = [v7 loadRequest:v14];
  }
}

- (void)updateWebViewFittingSize
{
  uint64_t v3 = [(iFBASurveyDetailViewController *)self webView];
  [v3 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
  double v5 = v4;

  objc_super v6 = [(iFBASurveyDetailViewController *)self webView];
  unsigned __int8 v7 = [v6 scrollView];
  [v7 contentSize];
  double v9 = v8;

  objc_super v10 = [(iFBASurveyDetailViewController *)self webView];
  id v11 = [v10 scrollView];
  [v11 contentInset];
  double v13 = v12;
  double v15 = v14;

  if (v5 >= v9) {
    double v16 = v5;
  }
  else {
    double v16 = v9;
  }
  double v17 = v15 + v16 + v13;

  [(iFBASurveyDetailViewController *)self updateWebViewHeight:v17];
}

- (void)updateActionView
{
  uint64_t v3 = [(iFBASurveyDetailViewController *)self surveyBugForm];
  if (v3
    && (double v4 = (void *)v3,
        unsigned __int8 v5 = [(iFBASurveyDetailViewController *)self isLoading],
        v4,
        (v5 & 1) == 0))
  {
    unsigned __int8 v7 = [(iFBASurveyDetailViewController *)self actionButton];
    double v8 = [(iFBASurveyDetailViewController *)self surveyBugForm];
    double v9 = [(iFBASurveyDetailViewController *)self team];
    objc_super v10 = [v8 surveyActionTextForTeam:v9];
    [v7 setTitle:v10 forState:0];

    id v11 = [(iFBASurveyDetailViewController *)self surveyBugForm];
    double v12 = [(iFBASurveyDetailViewController *)self team];
    id v13 = [v11 canTakeForTeam:v12];

    double v14 = [(iFBASurveyDetailViewController *)self actionButton];
    [v14 setEnabled:v13];

    id v15 = [(iFBASurveyDetailViewController *)self actionButton];
    [v15 setHidden:0];
  }
  else
  {
    objc_super v6 = [(iFBASurveyDetailViewController *)self actionButton];
    [v6 setHidden:1];

    id v15 = [(iFBASurveyDetailViewController *)self actionButton];
    [v15 setTitle:&stru_1000F6658 forState:0];
  }
}

- (void)updateWebViewHeight:(double)a3
{
  unsigned __int8 v5 = [(iFBASurveyDetailViewController *)self webViewHeightConstraint];

  if (v5)
  {
    objc_super v6 = [(iFBASurveyDetailViewController *)self webViewHeightConstraint];
    [v6 constant];
    double v8 = vabdd_f64(v7, a3);

    if (v8 <= 4.0) {
      return;
    }
    id v12 = [(iFBASurveyDetailViewController *)self webViewHeightConstraint];
    [v12 setConstant:a3];
  }
  else
  {
    double v9 = [(iFBASurveyDetailViewController *)self webView];
    objc_super v10 = +[NSLayoutConstraint constraintWithItem:v9 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:a3];
    [(iFBASurveyDetailViewController *)self setWebViewHeightConstraint:v10];

    id v12 = [(iFBASurveyDetailViewController *)self webView];
    id v11 = [(iFBASurveyDetailViewController *)self webViewHeightConstraint];
    [v12 addConstraint:v11];
  }
}

- (void)didPressTakeSurveyButton:(id)a3
{
  id v8 = [(iFBASurveyDetailViewController *)self surveyBugForm];
  double v4 = [(iFBASurveyDetailViewController *)self surveyBugForm];

  if (v4)
  {
    unsigned __int8 v5 = +[FBADraftManager sharedInstance];
    objc_super v6 = [(iFBASurveyDetailViewController *)self contentItem];
    double v7 = [(iFBASurveyDetailViewController *)self team];
    [v5 beginFeedbackForSurvey:v8 contentItem:v6 forTeam:v7];
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 updateViewport];
  }
}

- (FBKContentItem)contentItem
{
  return self->_contentItem;
}

- (FBKTeam)team
{
  return self->_team;
}

- (void)setTeam:(id)a3
{
}

- (UIView)actionView
{
  return self->_actionView;
}

- (void)setActionView:(id)a3
{
}

- (UIButton)actionButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionButton);

  return (UIButton *)WeakRetained;
}

- (void)setActionButton:(id)a3
{
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  return (UIScrollView *)WeakRetained;
}

- (void)setScrollView:(id)a3
{
}

- (FBAAdaptiveWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (NSLayoutConstraint)webViewHeightConstraint
{
  return self->_webViewHeightConstraint;
}

- (void)setWebViewHeightConstraint:(id)a3
{
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (NSObject)dataChangeObserver
{
  return self->_dataChangeObserver;
}

- (void)setDataChangeObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataChangeObserver, 0);
  objc_storeStrong((id *)&self->_webViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_actionButton);
  objc_storeStrong((id *)&self->_actionView, 0);
  objc_storeStrong((id *)&self->_team, 0);

  objc_storeStrong((id *)&self->_contentItem, 0);
}

@end