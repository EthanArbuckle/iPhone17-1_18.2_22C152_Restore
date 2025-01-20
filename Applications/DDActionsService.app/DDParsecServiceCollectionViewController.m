@interface DDParsecServiceCollectionViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (BOOL)firstTimeExperienceIsInPopoverPresentation;
- (BOOL)presentsWithMargins;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldHandleCardSectionEngagement:(id)a3;
- (BOOL)showBackgroundEffect;
- (DDParsecServiceCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSArray)sections;
- (double)DDViewScale;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)queryBlock;
- (unint64_t)queryId;
- (void)_willAppearInRemoteViewController;
- (void)addSections:(id)a3 error:(id)a4;
- (void)appDidEnterBackground;
- (void)appWillEnterForeground;
- (void)dealloc;
- (void)didEngageCardSection:(id)a3;
- (void)didEngageResult:(id)a3;
- (void)didReportUserResponseFeedback:(id)a3;
- (void)doneButtonPressed:(id)a3;
- (void)doneButtonPressed:(id)a3 punchout:(BOOL)a4;
- (void)fetchPreviewImageForResult:(id)a3 completion:(id)a4;
- (void)firstTimeExperienceContinueButtonPressed;
- (void)forwardInvocation:(id)a3;
- (void)interactionEndedWithPunchout:(BOOL)a3;
- (void)prepareWithQueryObject:(id)a3 previewMode:(BOOL)a4 sheetMode:(BOOL)a5 popoverMode:(BOOL)a6 viewStyle:(int64_t)a7 scale:(double)a8 dictionaryMode:(BOOL)a9 remoteTextQuery:(BOOL)a10;
- (void)setDDViewScale:(double)a3;
- (void)setOriginalTitle:(id)a3;
- (void)setPopoverMode:(BOOL)a3;
- (void)setPreviewMode:(BOOL)a3;
- (void)setQuery:(id)a3;
- (void)setQueryBlock:(id)a3;
- (void)setQueryId:(unint64_t)a3;
- (void)setSearchVisible:(BOOL)a3;
- (void)setSections:(id)a3;
- (void)setSheetMode:(BOOL)a3;
- (void)showClientQueryResults:(id)a3 error:(id)a4;
- (void)showContent:(BOOL)a3;
- (void)showError:(id)a3 animated:(BOOL)a4;
- (void)showLoadingSpinner:(BOOL)a3;
- (void)startQueryWithQuery:(id)a3;
- (void)startQueryWithResult:(id)a3 context:(id)a4;
- (void)startQueryWithString:(id)a3 range:(_NSRange)a4;
- (void)updateVisualMode:(BOOL)a3;
- (void)updateVisualModeWithController:(id)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DDParsecServiceCollectionViewController

+ (id)_remoteViewControllerInterface
{
  return (id)_ddui_parsec_xpcInterface();
}

+ (id)_exportedInterface
{
  return (id)_ddui_parsec_xpcInterface();
}

- (void)startQueryWithString:(id)a3 range:(_NSRange)a4
{
  _NSRange v31 = a4;
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v30);
  BOOL useNetwork = 0;
  BOOL useNetwork = v30->_useNetwork;
  id v26 = [(DDParsecServiceCollectionViewController *)v30 _hostApplicationBundleIdentifier];
  id v25 = [(DDParsecServiceCollectionViewController *)v30 queryId];
  BOOL remoteTextQuery = v30->_remoteTextQuery;
  char v22 = 0;
  char v20 = 0;
  if (remoteTextQuery)
  {
    id v23 = objc_loadWeakRetained(&from);
    char v22 = 1;
    id v21 = [v23 _remoteViewControllerProxy];
    char v20 = 1;
    id v5 = v21;
  }
  else
  {
    id v5 = 0;
  }
  id v24 = v5;
  if (v20) {

  }
  if (v22) {
  id v19 = v30->_lookupQuery;
  }
  v6 = v30;
  v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = sub_10000B26C;
  v11 = &unk_100020920;
  id v12 = location[0];
  objc_copyWeak(v16, &from);
  id v13 = v19;
  BOOL v18 = useNetwork;
  id v14 = v26;
  v16[1] = v25;
  _NSRange v17 = v31;
  id v15 = v24;
  [(DDParsecServiceCollectionViewController *)v6 setQuery:&v7];
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_destroyWeak(v16);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v26, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

- (void)startQueryWithQuery:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&v12, v14);
  BOOL useNetwork = 0;
  BOOL useNetwork = v14->_useNetwork;
  v3 = v14;
  v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_10000B600;
  int v8 = &unk_100020948;
  objc_copyWeak(&v9, &v12);
  BOOL v10 = useNetwork;
  [(DDParsecServiceCollectionViewController *)v3 setQuery:&v4];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v12);
  objc_storeStrong(location, 0);
}

- (void)showClientQueryResults:(id)a3 error:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(DDParsecServiceCollectionViewController *)v7 addSections:location[0] error:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)startQueryWithResult:(id)a3 context:(id)a4
{
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  objc_initWeak(&from, v32);
  BOOL useNetwork = 0;
  BOOL useNetwork = v32->_useNetwork;
  id v27 = [(DDParsecServiceCollectionViewController *)v32 _hostApplicationBundleIdentifier];
  id v26 = [(DDParsecServiceCollectionViewController *)v32 queryId];
  id v25 = v32->_lookupQuery;
  BOOL remoteTextQuery = v32->_remoteTextQuery;
  char v22 = 0;
  char v20 = 0;
  if (remoteTextQuery)
  {
    id v23 = objc_loadWeakRetained(&from);
    char v22 = 1;
    id v21 = [v23 _remoteViewControllerProxy];
    char v20 = 1;
    id v5 = v21;
  }
  else
  {
    id v5 = 0;
  }
  id v24 = v5;
  if (v20) {

  }
  if (v22) {
  int v6 = v32;
  }
  int v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  v11 = sub_10000BA9C;
  id v12 = &unk_100020970;
  id v13 = location[0];
  objc_copyWeak(v18, &from);
  id v14 = v32;
  id v15 = v25;
  BOOL v19 = useNetwork;
  id v16 = v27;
  v18[1] = v26;
  id v17 = v24;
  [(DDParsecServiceCollectionViewController *)v6 setQuery:&v8];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_destroyWeak(v18);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v27, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void)setQuery:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_fteMode)
  {
    [(DDParsecServiceCollectionViewController *)v4 setQueryBlock:location[0]];
  }
  else if (location[0])
  {
    (*((void (**)(void))location[0] + 2))();
  }
  objc_storeStrong(location, 0);
}

- (DDParsecServiceCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = v12;
  id v12 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)DDParsecServiceCollectionViewController;
  int v8 = [(DDParsecServiceCollectionViewController *)&v9 initWithNibName:location[0] bundle:v10];
  id v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8) {
    [(DDParsecServiceCollectionViewController *)v12 setDelegate:v12];
  }
  int v6 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (void)prepareWithQueryObject:(id)a3 previewMode:(BOOL)a4 sheetMode:(BOOL)a5 popoverMode:(BOOL)a6 viewStyle:(int64_t)a7 scale:(double)a8 dictionaryMode:(BOOL)a9 remoteTextQuery:(BOOL)a10
{
  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v38->_dictionaryMode = a9;
  v38->_scale = a8;
  v38->_style = a7;
  v38->_popoverMode = a6;
  v38->_sheetMode = a5;
  v38->_previewMode = a4;
  v38->_BOOL remoteTextQuery = a10;
  v38->_hasExternaDataSource = location[0] != 0;
  id WeakRetained = objc_loadWeakRetained(&qword_100028740);
  [WeakRetained doneButtonPressed:0 punchout:0];

  objc_storeWeak(&qword_100028740, v38);
  if (v38->_dictionaryMode)
  {
    v38->_BOOL useNetwork = 0;
    id v10 = +[DDLookupQuery queryWithoutNetwork];
    lookupQuery = v38->_lookupQuery;
    v38->_lookupQuery = v10;
  }
  else
  {
    id v12 = +[DDLookupQuery queryWithQuery:location[0]];
    id v13 = v38->_lookupQuery;
    v38->_lookupQuery = v12;

    if (location[0])
    {
      id v14 = [location[0] queryID];
      v38->_queryId = (unint64_t)v14;
      id v27 = [location[0] userAgent];
      id v15 = (NSString *)[v27 stringByAppendingString:@".fte.acknowledged"];
      fte_ack_key = v38->_fte_ack_key;
      v38->_fte_ack_key = v15;
    }
    else
    {
      qword_100028748 += arc4random_uniform(0x10u) + 1;
      v38->_queryId = qword_100028748;
      objc_storeStrong((id *)&v38->_fte_ack_key, @"com.apple.lookup.fte.acknowledged");
    }
    unsigned __int8 v17 = [(DDLookupQuery *)v38->_lookupQuery parsecEnabled];
    v38->_BOOL useNetwork = v17 & 1;
  }
  char v35 = 0;
  char v26 = 0;
  if (v38->_useNetwork)
  {
    unsigned __int8 v25 = 0;
    if (v38->_fte_ack_key)
    {
      v36 = +[NSUserDefaults standardUserDefaults];
      char v35 = 1;
      unsigned __int8 v25 = [(NSUserDefaults *)v36 BOOLForKey:v38->_fte_ack_key];
    }
    char v26 = v25 ^ 1;
  }
  if (v35) {

  }
  if (v26)
  {
    id v21 = [DDParsecFirstTimeViewController alloc];
    id v22 = [(DDLookupQuery *)v38->_lookupQuery bag];
    BOOL v18 = -[DDParsecFirstTimeViewController initWithNibName:bundle:bag:sceneAwareVariant:](v21, "initWithNibName:bundle:bag:sceneAwareVariant:", 0);
    firstTimeViewController = v38->_firstTimeViewController;
    v38->_firstTimeViewController = v18;

    [(DDParsecFirstTimeViewController *)v38->_firstTimeViewController setDelegate:v38];
    [(DDParsecServiceCollectionViewController *)v38 setNavigationBarHidden:1 animated:0];
    id v23 = v38;
    v39 = v38->_firstTimeViewController;
    id v24 = +[NSArray arrayWithObjects:&v39 count:1];
    -[DDParsecServiceCollectionViewController setViewControllers:](v23, "setViewControllers:");

    v38->_fteMode = 1;
  }
  else
  {
    [(DDParsecServiceCollectionViewController *)v38 showContent:0];
  }
  [(DDParsecServiceCollectionViewController *)v38 updateVisualMode:0];
  id v20 = [(DDParsecServiceCollectionViewController *)v38 _remoteViewControllerProxy];
  [v20 remoteVCIsReady];

  objc_storeStrong(location, 0);
}

- (BOOL)presentsWithMargins
{
  BOOL v3 = 1;
  if (!self->_previewMode)
  {
    BOOL v3 = 1;
    if (!self->_sheetMode) {
      return self->_popoverMode;
    }
  }
  return v3;
}

- (void)_willAppearInRemoteViewController
{
  id v2 = [(DDParsecServiceCollectionViewController *)self _remoteViewControllerProxy];
  [v2 showingFTE:self->_fteMode];
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(DDParsecServiceCollectionViewController *)self setSearchVisible:0];
  v2.receiver = v4;
  v2.super_class = (Class)DDParsecServiceCollectionViewController;
  [(DDParsecServiceCollectionViewController *)&v2 dealloc];
}

- (void)addSections:(id)a3 error:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  dispatch_queue_t queue = &_dispatch_main_q;
  int v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  objc_super v9 = sub_10000C754;
  id v10 = &unk_100020650;
  id v11 = v14;
  id v12 = location[0];
  id v13 = v16;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)setOriginalTitle:(id)a3
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] length]) {
    objc_storeStrong((id *)&v8->_originalTitle, location[0]);
  }
  id v4 = [(DDParsecServiceCollectionViewController *)v8 topViewController];
  [v4 setTitle:v3];

  id v5 = [(SearchUIResultsViewController *)v8->_resultsViewController title];
  BOOL v6 = [v5 length] != 0;

  if (!v6) {
    [(SearchUIResultsViewController *)v8->_resultsViewController setTitle:v8->_originalTitle];
  }
  [(DDParsecFirstTimeViewController *)v8->_firstTimeViewController setTitle:&stru_100020FA8];
  objc_storeStrong(location, 0);
}

- (void)setDDViewScale:(double)a3
{
  if (a3 > 0.0 && self->_scale != a3) {
    self->_scale = a3;
  }
}

- (void)setSearchVisible:(BOOL)a3
{
  if (self->_searchViewVisible != a3) {
    self->_searchViewVisible = a3;
  }
}

- (void)appDidEnterBackground
{
  int v7 = self;
  v6[1] = (id)a2;
  if (self->_searchViewVisible && v7->_useNetwork)
  {
    v6[0] = [objc_alloc((Class)SFSearchViewDisappearFeedback) initWithEvent:23];
    id v2 = [(DDParsecServiceCollectionViewController *)v7 queryId];
    [v6[0] setQueryId:v2];
    id v3 = [(DDLookupQuery *)v7->_lookupQuery feedbackListener];
    [v3 searchViewDidDisappear:v6[0]];

    id v4 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v4 postNotificationName:UIApplicationWillResignActiveNotification object:UIApp];

    id v5 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v5 postNotificationName:UIApplicationDidEnterBackgroundNotification object:UIApp];

    objc_storeStrong(v6, 0);
  }
}

- (void)appWillEnterForeground
{
  id v12 = self;
  v11[1] = (id)a2;
  if (self->_searchViewVisible && v12->_useNetwork)
  {
    v11[0] = [objc_alloc((Class)SFSearchViewAppearFeedback) initWithEvent:26];
    [v11[0] setQueryId:[v12 queryId]];
    id v2 = [(DDLookupQuery *)v12->_lookupQuery feedbackListener];
    [v2 searchViewDidAppear:v11[0]];

    id v3 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v3 postNotificationName:UIApplicationWillEnterForegroundNotification object:UIApp];

    id v4 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v4 postNotificationName:UIApplicationDidBecomeActiveNotification object:UIApp];

    id v10 = 0;
    unsigned int v9 = [(DDParsecServiceCollectionViewController *)v12 _hostProcessIdentifier];
    id v6 = +[AVSystemController sharedAVSystemController];
    id v5 = +[NSNumber numberWithInteger:(int)v9];
    id v8 = v10;
    unsigned __int8 v7 = [v6 setAttribute:forKey:error:];
    objc_storeStrong(&v10, v8);

    if ((v7 & 1) == 0) {
      NSLog(@"Failed to inherit CoreMedia permissions from %d: %@", v9, v10);
    }
    objc_storeStrong(&v10, 0);
    objc_storeStrong(v11, 0);
  }
}

- (void)showLoadingSpinner:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setTitle:v8->_originalTitle];
  id v3 = v8;
  id v9 = v5;
  id v4 = +[NSArray arrayWithObjects:&v9 count:1];
  -[DDParsecServiceCollectionViewController setViewControllers:animated:](v3, "setViewControllers:animated:");

  objc_storeStrong(&v5, 0);
}

- (void)doneButtonPressed:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(DDParsecServiceCollectionViewController *)v4 doneButtonPressed:location[0] punchout:0];
  objc_storeStrong(location, 0);
}

- (void)doneButtonPressed:(id)a3 punchout:(BOOL)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v8 = a4;
  v10->_doneClicked = 1;
  [(DDParsecServiceCollectionViewController *)v10 setSearchVisible:0];
  if (v10->_useNetwork)
  {
    id v7 = [objc_alloc((Class)SFSearchViewDisappearFeedback) initWithEvent:16];
    id v4 = [(DDParsecServiceCollectionViewController *)v10 queryId];
    [v7 setQueryId:v4];
    id v5 = [(DDLookupQuery *)v10->_lookupQuery feedbackListener];
    [v5 searchViewDidDisappear:v7];

    objc_storeStrong(&v7, 0);
  }
  [(DDParsecServiceCollectionViewController *)v10 interactionEndedWithPunchout:v8];
  objc_storeStrong(location, 0);
}

- (void)interactionEndedWithPunchout:(BOOL)a3
{
  BOOL v4 = a3;
  id v3 = [(DDParsecServiceCollectionViewController *)self _remoteViewControllerProxy];
  [v3 interactionEndedWithPunchout:v4];
}

- (void)setSections:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4->_sectionsIsSet = 1;
  objc_storeStrong((id *)&v4->_sections, location[0]);
  [(DDParsecServiceCollectionViewController *)v4 showContent:0];
  objc_storeStrong(location, 0);
}

- (void)showContent:(BOOL)a3
{
  id v30 = self;
  SEL v29 = a2;
  BOOL v28 = a3;
  if (!self->_firstTimeViewController && !v30->_loadingError)
  {
    if (v30->_sectionsIsSet)
    {
      id v12 = [(DDParsecServiceCollectionViewController *)v30 sections];
      BOOL v13 = [(NSArray *)v12 count] != 0;

      if (v13)
      {
        if (!v30->_resultsViewController)
        {
          uint64_t v3 = objc_opt_new();
          resultsViewController = v30->_resultsViewController;
          v30->_resultsViewController = (SearchUIResultsViewController *)v3;

          [(SearchUIResultsViewController *)v30->_resultsViewController setFeedbackListener:v30];
          [(SearchUIResultsViewController *)v30->_resultsViewController setShouldUseInsetRoundedSections:(_os_feature_enabled_impl() ^ 1) & 1];
          [(SearchUIResultsViewController *)v30->_resultsViewController setShouldUseStandardSectionInsets:1];
          id v10 = [(SearchUIResultsViewController *)v30->_resultsViewController title];
          BOOL v11 = [v10 length] != 0;

          if (!v11) {
            [(SearchUIResultsViewController *)v30->_resultsViewController setTitle:v30->_originalTitle];
          }
          [(DDParsecServiceCollectionViewController *)v30 updateVisualModeWithController:v30->_resultsViewController animated:0];
          _NSRange v31 = v30->_resultsViewController;
          id v9 = +[NSArray arrayWithObjects:&v31 count:1];
          -[DDParsecServiceCollectionViewController setViewControllers:](v30, "setViewControllers:");
        }
        if (!v30->_hasExternaDataSource)
        {
          BOOL v5 = (id)[(NSArray *)v30->_sections count] != (id)2;
          char v26 = 0;
          char v24 = 0;
          char v22 = 0;
          char v20 = 0;
          unsigned __int8 v8 = 0;
          if (!v5)
          {
            id v27 = [(NSArray *)v30->_sections firstObject];
            char v26 = 1;
            id v25 = [v27 bundleIdentifier];
            char v24 = 1;
            unsigned __int8 v8 = 0;
            if ([v25 isEqualToString:@"com.apple.lookup.dictionary"])
            {
              id v23 = [(NSArray *)v30->_sections lastObject];
              char v22 = 1;
              id v21 = [v23 bundleIdentifier];
              char v20 = 1;
              unsigned __int8 v8 = [v21 isEqualToString:@"com.apple.lookup.search-through"];
            }
          }
          [(SearchUIResultsViewController *)v30->_resultsViewController setImmediatelyShowCardForSingleResult:(v8 ^ 1) & 1];
          if (v20) {

          }
          if (v22) {
          if (v24)
          }

          if (v26) {
        }
          }
        -[SearchUIResultsViewController setQueryString:](v30->_resultsViewController, "setQueryString:", v30->_originalTitle, &selRef_currentCalendar);
        [*(id *)((char *)&v30->super.super.super.super.isa + *(int *)(v6 + 2944)) setSections:v30->_sections];
        id v7 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&v30->super.super.super.super.isa
                                                                   + *(int *)(v6 + 2944)), "view"));
        [v7 setAlpha:0.0];

        id v14 = _NSConcreteStackBlock;
        int v15 = -1073741824;
        int v16 = 0;
        unsigned __int8 v17 = sub_10000D958;
        BOOL v18 = &unk_100020998;
        BOOL v19 = v30;
        +[SearchUIUtilities performAnimatableChanges:&v14];
        objc_storeStrong((id *)&v19, 0);
      }
      else
      {
        [(DDParsecServiceCollectionViewController *)v30 showError:0 animated:v28];
      }
    }
    else
    {
      [(DDParsecServiceCollectionViewController *)v30 showLoadingSpinner:v28];
    }
  }
}

- (void)showError:(id)a3 animated:(BOOL)a4
{
  v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v34 = a4;
  v36->_loadingError = 1;
  BOOL v4 = v36->_firstTimeViewController != 0;
  char v32 = 0;
  char v30 = 0;
  char v28 = 0;
  char v18 = 1;
  if (!v4)
  {
    id v33 = [(DDParsecServiceCollectionViewController *)v36 viewControllers];
    char v32 = 1;
    char isKindOfClass = 0;
    if ([v33 count] == (id)1)
    {
      id v31 = [(DDParsecServiceCollectionViewController *)v36 viewControllers];
      char v30 = 1;
      id v29 = [v31 objectAtIndexedSubscript:0];
      char v28 = 1;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    char v18 = isKindOfClass;
  }
  if (v28) {

  }
  if (v30) {
  if (v32)
  }

  if (v18)
  {
    int v27 = 1;
  }
  else
  {
    id v26 = (id)objc_opt_new();
    [v26 setTitle:v36->_originalTitle];
    [v26 setAltURL:0];
    [v26 setLookup:!v36->_hasExternaDataSource];
    char v24 = 0;
    unsigned __int8 v15 = 0;
    if (location[0])
    {
      unsigned __int8 v15 = 0;
      if ([location[0] code] == (id)-1009)
      {
        id v25 = [location[0] domain];
        char v24 = 1;
        unsigned __int8 v15 = [v25 isEqualToString:NSURLErrorDomain];
      }
    }
    if (v24) {

    }
    if (v15)
    {
      id v13 = (id)DDLocalizedString();
      id v12 = +[UIDevice currentDevice];
      BOOL v11 = [(UIDevice *)v12 localizedModel];
      id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v11);
      [v26 setReason:];

      id v14 = +[NSURL URLWithString:@"prefs:root=ROOT#AIRPLANE_MODE"];
      [v26 setAltURL:];
    }
    else
    {
      if (location[0])
      {
        char v22 = 0;
        unsigned __int8 v9 = 0;
        if ([location[0] code] == (id)-1001)
        {
          id v23 = [location[0] domain];
          char v22 = 1;
          unsigned __int8 v9 = [v23 isEqualToString:NSURLErrorDomain];
        }
        if (v22) {

        }
        if (v9)
        {
          id v21 = &_os_log_default;
          os_log_type_t v20 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
          {
            sub_10000A468((uint64_t)v39, (uint64_t)location[0]);
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v21, v20, "Could no fetch lookup data: %@", v39, 0xCu);
          }
          objc_storeStrong(&v21, 0);
        }
        else
        {
          id v19 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_FAULT))
          {
            sub_10000A468((uint64_t)v38, (uint64_t)location[0]);
            _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_FAULT, "Could no fetch lookup data: %@", v38, 0xCu);
          }
          objc_storeStrong(&v19, 0);
        }
      }
      id v8 = (id)DDLocalizedString();
      [v26 setReason:];
    }
    [v26 setSearchWebQuery:v36->_originalTitle];
    [(DDParsecServiceCollectionViewController *)v36 updateVisualModeWithController:v26 animated:v34];
    id v5 = [(DDParsecServiceCollectionViewController *)v36 _remoteViewControllerProxy];
    [v5 showingErrorView:1];

    uint64_t v6 = v36;
    id v37 = v26;
    id v7 = +[NSArray arrayWithObjects:&v37 count:1];
    -[DDParsecServiceCollectionViewController setViewControllers:animated:](v6, "setViewControllers:animated:");

    objc_storeStrong(&v26, 0);
    int v27 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  unsigned __int8 v15 = self;
  SEL v14 = a2;
  BOOL v13 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DDParsecServiceCollectionViewController;
  [(DDParsecServiceCollectionViewController *)&v12 viewDidAppear:a3];
  uint64_t v3 = +[NSDate date];
  lastAppearTime = v15->_lastAppearTime;
  v15->_lastAppearTime = v3;

  [(DDParsecServiceCollectionViewController *)v15 setSearchVisible:1];
  if (v15->_lastDisappearTime
    && ([(NSDate *)v15->_lastDisappearTime timeIntervalSinceNow], v5 > -0.5))
  {
    [(DDParsecServiceCollectionViewController *)v15 setPreviewMode:0];
  }
  else if (v15->_useNetwork)
  {
    uint64_t v11 = 0;
    if (v15->_previewMode)
    {
      uint64_t v9 = 13;
    }
    else
    {
      uint64_t v6 = 15;
      if (!v15->_sourceIsHint) {
        uint64_t v6 = 16;
      }
      uint64_t v9 = v6;
    }
    uint64_t v11 = v9;
    id v10 = [objc_alloc((Class)SFSearchViewAppearFeedback) initWithEvent:v9];
    id v7 = [(DDParsecServiceCollectionViewController *)v15 queryId];
    [v10 setQueryId:v7];
    id v8 = [(DDLookupQuery *)v15->_lookupQuery feedbackListener];
    [v8 searchViewDidAppear:v10];

    objc_storeStrong(&v10, 0);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  [(DDParsecServiceCollectionViewController *)self setSearchVisible:0];
  v3.receiver = v6;
  v3.super_class = (Class)DDParsecServiceCollectionViewController;
  [(DDParsecServiceCollectionViewController *)&v3 viewWillDisappear:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v29 = self;
  SEL v28 = a2;
  BOOL v27 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DDParsecServiceCollectionViewController;
  [(DDParsecServiceCollectionViewController *)&v26 viewDidDisappear:a3];
  objc_super v3 = +[NSDate date];
  lastDisappearTime = v29->_lastDisappearTime;
  v29->_lastDisappearTime = v3;

  id v25 = 0;
  if (v29->_useNetwork && !v29->_doneClicked)
  {
    id v5 = [objc_alloc((Class)SFSearchViewDisappearFeedback) initWithEvent:15];
    id v6 = v25;
    id v25 = v5;

    [v25 setQueryId:[v29 queryId]];
  }
  [UIApp backgroundTimeRemaining];
  if (v7 >= 0.5)
  {
    id v20 = [UIApp beginBackgroundTaskWithExpirationHandler:];
    dispatch_time_t v8 = dispatch_time(0, 500000000);
    dispatch_queue_t queue = &_dispatch_main_q;
    BOOL v13 = _NSConcreteStackBlock;
    int v14 = -1073741824;
    int v15 = 0;
    int v16 = sub_10000E734;
    unsigned __int8 v17 = &unk_1000209C0;
    char v18 = v29;
    v19[0] = v25;
    v19[1] = v20;
    dispatch_after(v8, queue, &v13);

    objc_storeStrong(v19, 0);
    objc_storeStrong((id *)&v18, 0);
    int v21 = 0;
  }
  else
  {
    [(DDParsecServiceCollectionViewController *)v29 setQueryBlock:0];
    if (v25)
    {
      id v12 = [(DDLookupQuery *)v29->_lookupQuery feedbackListener];
      [v12 searchViewDidDisappear:v25];

      id location = &_os_log_default;
      char v23 = 2;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
      {
        log = location;
        os_log_type_t type = v23;
        sub_100005458(v22);
        _os_log_debug_impl((void *)&_mh_execute_header, log, type, "Sending immediate viewDisappearFeedback", v22, 2u);
      }
      objc_storeStrong(&location, 0);
    }
    int v21 = 1;
  }
  objc_storeStrong(&v25, 0);
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  char v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  v15.receiver = v18;
  v15.super_class = (Class)DDParsecServiceCollectionViewController;
  [(DDParsecServiceCollectionViewController *)&v15 willTransitionToTraitCollection:location[0] withTransitionCoordinator:v16];
  id v6 = [location[0] verticalSizeClass];
  id v7 = [(DDParsecServiceCollectionViewController *)v18 traitCollection];
  BOOL v8 = v6 == [v7 verticalSizeClass];

  if (!v8)
  {
    id v4 = [(DDParsecServiceCollectionViewController *)v18 _remoteViewControllerProxy];
    uint64_t v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    id v12 = sub_10000EAFC;
    BOOL v13 = &unk_100020A10;
    id v14 = location[0];
    [v4 getStatusBarHidden:&v9];

    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12[1] = (id)a4;
  v12[0] = 0;
  objc_storeStrong(v12, a5);
  id v11 = 0;
  objc_storeStrong(&v11, a6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v14->_sheetMode) {
    uint64_t v15 = objc_opt_new();
  }
  else {
    uint64_t v15 = 0;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
  id v6 = (void *)v15;

  return v6;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)setPopoverMode:(BOOL)a3
{
  if (self->_popoverMode != a3)
  {
    self->_popoverMode = a3;
    [(DDParsecServiceCollectionViewController *)self updateVisualMode:0];
  }
}

- (void)setPreviewMode:(BOOL)a3
{
  if (self->_previewMode != a3)
  {
    self->_previewMode = a3;
    [(DDParsecServiceCollectionViewController *)self updateVisualMode:0];
  }
}

- (void)setSheetMode:(BOOL)a3
{
  if (self->_sheetMode != a3)
  {
    self->_sheetMode = a3;
    [(DDParsecServiceCollectionViewController *)self updateVisualMode:0];
  }
}

- (void)updateVisualMode:(BOOL)a3
{
  id v4 = [(DDParsecServiceCollectionViewController *)self topViewController];
  -[DDParsecServiceCollectionViewController updateVisualModeWithController:animated:](self, "updateVisualModeWithController:animated:");
}

- (void)updateVisualModeWithController:(id)a3 animated:(BOOL)a4
{
  v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v45 = a4;
  if ([(DDParsecServiceCollectionViewController *)v47 showBackgroundEffect]) {
    [(DDParsecServiceCollectionViewController *)v47 _setBuiltinTransitionStyle:1];
  }
  if (location[0] && location[0] == v47->_firstTimeViewController) {
    [(DDParsecFirstTimeViewController *)v47->_firstTimeViewController updateForCurrentTraitCollection];
  }
  id v25 = [(DDParsecServiceCollectionViewController *)v47 traitCollection];
  [v25 displayScale];
  -[DDParsecServiceCollectionViewController setDDViewScale:](v47, "setDDViewScale:");

  id v44 = 0;
  if (!v47->_previewMode && !v47->_popoverMode)
  {
    id v4 = objc_alloc((Class)UIBarButtonItem);
    id v5 = [v4 initWithBarButtonSystemItem:24 target:v47 action:"doneButtonPressed:"];
    id v6 = v44;
    id v44 = v5;

    [v44 setAccessibilityIdentifier:@"DDUIDone"];
  }
  id v23 = [location[0] navigationItem];
  [v23 setRightBarButtonItem:v44 animated:v45];

  BOOL v24 = 0;
  if (v47->_fteMode) {
    BOOL v24 = v44 == 0;
  }
  [(DDParsecServiceCollectionViewController *)v47 setNavigationBarHidden:v24 animated:0];
  if ([(DDParsecServiceCollectionViewController *)v47 showBackgroundEffect])
  {
    id v22 = [(DDParsecServiceCollectionViewController *)v47 view];
    id v21 = [v22 subviews];
    id v43 = [v21 firstObject];

    objc_opt_class();
    char v42 = objc_opt_isKindOfClass() & 1;
    if (v42 || v47->_popoverMode)
    {
      if ((v42 & 1) != 0 && v47->_popoverMode) {
        [v43 removeFromSuperview];
      }
    }
    else
    {
      id v17 = objc_alloc((Class)UIVisualEffectView);
      char v18 = +[UIBlurEffect effectWithStyle:9];
      id v41 = [v17 initWithEffect:];

      id v19 = [(DDParsecServiceCollectionViewController *)v47 view];
      [v19 bounds];
      uint64_t v37 = v7;
      uint64_t v38 = v8;
      *(void *)&long long v39 = v9;
      *((void *)&v39 + 1) = v10;
      long long v40 = v39;

      sub_10000F5A8();
      *(double *)&long long v35 = v11;
      *((double *)&v35 + 1) = v12;
      *(double *)&long long v36 = v13;
      *((double *)&v36 + 1) = v14;
      long long v33 = v35;
      long long v34 = v36;
      [v41 setFrame:v11, v12, v13, v14];
      [v41 setAutoresizingMask:18];
      id v20 = [(DDParsecServiceCollectionViewController *)v47 view];
      [v20 insertSubview:v41 atIndex:0];

      objc_storeStrong(&v41, 0);
    }
    objc_storeStrong(&v43, 0);
  }
  else
  {
    id v16 = +[UIColor systemGroupedBackgroundColor];
    id v15 = [(DDParsecServiceCollectionViewController *)v47 view];
    [v15 setBackgroundColor:v16];
  }
  BOOL v27 = _NSConcreteStackBlock;
  int v28 = -1073741824;
  int v29 = 0;
  char v30 = sub_10000F600;
  id v31 = &unk_100020998;
  id v32 = location[0];
  +[SearchUIUtilities performAnimatableChanges:&v27 animated:v45];
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)showBackgroundEffect
{
  return 0;
}

- (void)firstTimeExperienceContinueButtonPressed
{
  if (self->_fte_ack_key)
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
    [(NSUserDefaults *)v5 setBool:1 forKey:self->_fte_ack_key];
  }
  self->_fteMode = 0;
  objc_storeStrong((id *)&self->_firstTimeViewController, 0);
  id v3 = [(DDParsecServiceCollectionViewController *)self _remoteViewControllerProxy];
  [v3 showingFTE:0];

  [(DDParsecServiceCollectionViewController *)self showContent:1];
  id v4 = [(DDParsecServiceCollectionViewController *)self queryBlock];

  if (v4)
  {
    id v2 = (void (**)(void))[(DDParsecServiceCollectionViewController *)self queryBlock];
    v2[2]();

    [(DDParsecServiceCollectionViewController *)self setQueryBlock:0];
  }
}

- (BOOL)firstTimeExperienceIsInPopoverPresentation
{
  return self->_popoverMode;
}

- (void)didEngageCardSection:(id)a3
{
  double v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v12->_useNetwork)
  {
    id v3 = [(DDParsecServiceCollectionViewController *)v12 queryId];
    [location[0] setQueryId:v3];
    id v6 = [(DDLookupQuery *)v12->_lookupQuery feedbackListener];
    [v6 didEngageCardSection:location[0]];
  }
  id v4 = [location[0] destination];
  char v9 = 0;
  char v7 = 0;
  LOBYTE(v5) = 0;
  if (v4)
  {
    id v10 = [location[0] cardSection];
    char v9 = 1;
    objc_opt_class();
    LOBYTE(v5) = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v8 = [location[0] cardSection];
      char v7 = 1;
      objc_opt_class();
      int v5 = objc_opt_isKindOfClass() ^ 1;
    }
  }
  if (v7) {

  }
  if (v9) {
  if (v5)
  }
    [(DDParsecServiceCollectionViewController *)v12 doneButtonPressed:0 punchout:1];
  objc_storeStrong(location, 0);
}

- (void)didEngageResult:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v6->_useNetwork)
  {
    id v4 = [(DDLookupQuery *)v6->_lookupQuery feedbackListener];
    [v4 didEngageResult:location[0]];
  }
  if ([location[0] destination] == (id)2)
  {
    id v3 = [(DDParsecServiceCollectionViewController *)v6 _remoteViewControllerProxy];
    [v3 interactionEndedWithPunchout:1];
  }
  objc_storeStrong(location, 0);
}

- (BOOL)shouldHandleCardSectionEngagement:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(DDParsecServiceCollectionViewController *)v10 queryId];
  [location[0] setQueryId:v3];
  id v6 = [location[0] cardSection];
  objc_opt_class();
  BOOL sheetMode = 0;
  if (objc_opt_isKindOfClass()) {
    BOOL sheetMode = v10->_sheetMode;
  }

  if (sheetMode)
  {
    id v8 = [location[0] destination];
    id v5 = [(DDParsecServiceCollectionViewController *)v10 _remoteViewControllerProxy];
    [v5 openTrailerPunchout:v8];

    char v11 = 0;
    objc_storeStrong(&v8, 0);
  }
  else
  {
    char v11 = 1;
  }
  objc_storeStrong(location, 0);
  return v11 & 1;
}

- (void)didReportUserResponseFeedback:(id)a3
{
  BOOL v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL useNetwork = v24->_useNetwork;
  char v21 = 0;
  char v19 = 0;
  BOOL v13 = 0;
  if (useNetwork)
  {
    id v22 = [location[0] userSelection];
    char v21 = 1;
    id v20 = [v22 name];
    char v19 = 1;
    BOOL v13 = v20 != 0;
  }
  if (v19) {

  }
  if (v21) {
  if (v13)
  }
  {
    id v10 = +[NSUUID UUID];
    char v18 = [(NSUUID *)v10 UUIDString];

    [location[0] setUploadedDataIdentifier:v18];
    [location[0] setReportType:1];
    [location[0] setSections:v24->_sections];
    id v11 = [(DDLookupQuery *)v24->_lookupQuery feedbackListener];
    [v11 didSubmitUserReportFeedback:location[0]];

    id v4 = objc_alloc((Class)_CPUserReportFeedback);
    id v12 = [v4 initWithFacade:location[0]];
    id v17 = [v12 data];

    if (!v17)
    {
      id v16 = &_os_log_default;
      char v15 = 16;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        log = v16;
        os_log_type_t type = v15;
        sub_100005458(v14);
        _os_log_error_impl((void *)&_mh_execute_header, log, type, "didReportUserResponseFeedback(): failed to serialize report data", v14, 2u);
      }
      objc_storeStrong(&v16, 0);
    }
    id v7 = [(DDParsecServiceCollectionViewController *)v24 _remoteViewControllerProxy];
    [v7 reportAnIssueWithReportIdentifier:v18 sfReportData:v17];

    objc_storeStrong(&v17, 0);
    objc_storeStrong((id *)&v18, 0);
  }
  id v5 = [location[0] userSelection];
  id v6 = [v5 preferredOpenableURL];

  if (v6) {
    [(DDParsecServiceCollectionViewController *)v24 interactionEndedWithPunchout:1];
  }
  objc_storeStrong(location, 0);
}

- (void)fetchPreviewImageForResult:(id)a3 completion:(id)a4
{
  double v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v5 = [(DDParsecServiceCollectionViewController *)v14 _remoteViewControllerProxy];
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  char v9 = sub_100010134;
  id v10 = &unk_100020A38;
  id v11 = v12;
  [v5 loadReportAnIssueImage:];

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)forwardInvocation:(id)a3
{
  char v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(DDLookupQuery *)v9->_lookupQuery feedbackListener];
  [location[0] selector];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (v9->_useNetwork)
    {
      id v3 = location[0];
      id v4 = [(DDLookupQuery *)v9->_lookupQuery feedbackListener];
      [v3 invokeWithTarget:];
    }
  }
  else
  {
    v7.receiver = v9;
    v7.super_class = (Class)DDParsecServiceCollectionViewController;
    [(DDParsecServiceCollectionViewController *)&v7 forwardInvocation:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  id v10 = self;
  SEL v9 = a2;
  SEL v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DDParsecServiceCollectionViewController;
  char v5 = 0;
  char v4 = 1;
  if (![(DDParsecServiceCollectionViewController *)&v7 respondsToSelector:a3])
  {
    id v6 = [(DDLookupQuery *)v10->_lookupQuery feedbackListener];
    char v5 = 1;
    char v4 = objc_opt_respondsToSelector();
  }
  char v11 = v4 & 1;
  if (v5) {

  }
  return v11 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v12 = self;
  SEL v11 = a2;
  SEL v10 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DDParsecServiceCollectionViewController;
  id v9 = [(DDParsecServiceCollectionViewController *)&v8 methodSignatureForSelector:a3];
  if (!v9)
  {
    id v7 = [(DDLookupQuery *)v12->_lookupQuery feedbackListener];
    id v3 = [v7 methodSignatureForSelector:v10];
    id v4 = v9;
    id v9 = v3;
  }
  id v6 = v9;
  objc_storeStrong(&v9, 0);

  return v6;
}

- (double)DDViewScale
{
  return self->_scale;
}

- (id)queryBlock
{
  return self->_queryBlock;
}

- (void)setQueryBlock:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (void).cxx_destruct
{
}

@end