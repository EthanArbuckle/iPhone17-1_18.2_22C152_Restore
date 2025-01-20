@interface SRGuideViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_hasTitle;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)usePlatterStyle;
- (BOOL)wantsToManageBackgroundColor;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (Class)transparentHeaderViewClass;
- (SAGuidanceGuideSnippet)_guideSnippet;
- (SRGuideViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)_heightOfRowForDomainSnippet:(id)a3;
- (double)desiredHeightForTransparentHeaderView;
- (double)desiredHeightForWidth:(double)a3;
- (id)_bigButtonViewController;
- (id)_domainSnippetForEnabledIntentSupportedAppAtIndex:(unint64_t)a3;
- (id)_domainSnippetForHelpDomainAtIndex:(unint64_t)a3;
- (id)_domainSnippetForIndexPath:(id)a3;
- (id)_fallbackImage;
- (id)_iconImageForGuideDomainSnippet:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)_numberOfHelpDomains;
- (int64_t)_numberOfIntentEnabledApps;
- (int64_t)_numberOfIntentSupportedApps;
- (int64_t)_pinAnimationType;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_endTrackingGuideShowTimeIfNecessary;
- (void)_prepareSiriEnabledAppList;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureReusableTransparentHeaderView:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setGuideSnippet:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SRGuideViewController

- (SRGuideViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SRGuideViewController;
  v4 = [(SRGuideViewController *)&v12 initWithNibName:0 bundle:0];
  if (v4)
  {
    v5 = (NSCache *)objc_alloc_init((Class)NSCache);
    domainIconCache = v4->_domainIconCache;
    v4->_domainIconCache = v5;

    v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    guideImageOperationQueue = v4->_guideImageOperationQueue;
    v4->_guideImageOperationQueue = v7;

    [(NSOperationQueue *)v4->_guideImageOperationQueue setQualityOfService:25];
    [(NSOperationQueue *)v4->_guideImageOperationQueue setMaxConcurrentOperationCount:2];
    uint64_t v9 = +[NSMutableSet set];
    spawnedGuideImageFetches = v4->_spawnedGuideImageFetches;
    v4->_spawnedGuideImageFetches = (NSMutableSet *)v9;

    -[SRGuideViewController setDefaultViewInsets:](v4, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  }
  return v4;
}

- (void)didReceiveMemoryWarning
{
  v3.receiver = self;
  v3.super_class = (Class)SRGuideViewController;
  [(SRGuideViewController *)&v3 didReceiveMemoryWarning];
  [(NSCache *)self->_domainIconCache removeAllObjects];
}

- (void)setDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SRGuideViewController;
  [(SRGuideViewController *)&v4 setDelegate:a3];
  [(SRGuideViewController *)self _prepareSiriEnabledAppList];
}

- (id)_bigButtonViewController
{
  bigButtonController = self->_bigButtonController;
  if (!bigButtonController)
  {
    objc_super v4 = objc_alloc_init(SRBigButtonController);
    v5 = self->_bigButtonController;
    self->_bigButtonController = v4;

    v6 = self->_bigButtonController;
    v7 = [(SRGuideViewController *)self _guideSnippet];
    v8 = [v7 appPunchOutButton];
    [(SRBigButtonController *)v6 setAceObject:v8];

    uint64_t v9 = self->_bigButtonController;
    v10 = [(SRGuideViewController *)self delegate];
    [(SRBigButtonController *)v9 setDelegate:v10];

    bigButtonController = self->_bigButtonController;
  }

  return bigButtonController;
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)SRGuideViewController;
  [(SRGuideViewController *)&v12 loadView];
  objc_super v3 = [(SRGuideViewController *)self collectionView];
  [v3 setDataSource:self];
  [v3 setDelegate:self];
  uint64_t v4 = objc_opt_class();
  v5 = +[SRGuideViewCell reuseIdentifier];
  [v3 registerClass:v4 forCellWithReuseIdentifier:v5];

  uint64_t v6 = objc_opt_class();
  v7 = +[SiriUIContentCollectionViewCell reuseIdentifier];
  [v3 registerClass:v6 forCellWithReuseIdentifier:v7];

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = +[SiriUISnippetControllerCell reuseIdentifier];
  [v3 registerClass:v8 forCellWithReuseIdentifier:v9];

  uint64_t v10 = objc_opt_class();
  v11 = +[SRGuideViewHeader reuseIdentifier];
  [v3 registerClass:v10 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v11];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(SRGuideViewController *)self collectionView];
  uint64_t v6 = [v5 indexPathsForSelectedItems];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v10);
        objc_super v12 = [(SRGuideViewController *)self collectionView];
        [v12 deselectItemAtIndexPath:v11 animated:v3];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v13.receiver = self;
  v13.super_class = (Class)SRGuideViewController;
  [(SRGuideViewController *)&v13 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SRGuideViewController *)self delegate];
  unsigned int v6 = [v5 siriSnippetViewControllerIsVisible:self];

  if (v6)
  {
    if (self->_showingDetails)
    {
      self->_showingDetails = 0;
    }
    else
    {
      id v8 = +[NSDate date];
      startViewingTime = self->_startViewingTime;
      self->_startViewingTime = v8;
    }
  }
  else
  {
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      objc_super v12 = "-[SRGuideViewController viewDidAppear:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Not visible, no need to create a new view time", buf, 0xCu);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)SRGuideViewController;
  [(SRGuideViewController *)&v10 viewDidAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SRGuideViewController *)self delegate];
  unsigned int v6 = [v5 siriSnippetViewControllerIsVisible:self];

  if (v6)
  {
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      objc_super v10 = "-[SRGuideViewController viewDidDisappear:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Showing details, do nothing", buf, 0xCu);
    }
  }
  else
  {
    self->_showingDetails = 0;
    [(SRGuideViewController *)self _endTrackingGuideShowTimeIfNecessary];
  }
  v8.receiver = self;
  v8.super_class = (Class)SRGuideViewController;
  [(SRGuideViewController *)&v8 viewDidDisappear:v3];
}

- (double)desiredHeightForWidth:(double)a3
{
  int64_t v4 = [(SRGuideViewController *)self _numberOfHelpDomains];
  int64_t v5 = [(SRGuideViewController *)self _numberOfIntentEnabledApps];
  int64_t v6 = v5;
  if (!v4)
  {
    double v8 = 0.0;
    if (!v5) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  uint64_t v7 = 0;
  double v8 = 0.0;
  do
  {
    uint64_t v9 = [(SRGuideViewController *)self _domainSnippetForHelpDomainAtIndex:v7];
    [(SRGuideViewController *)self _heightOfRowForDomainSnippet:v9];
    double v8 = v8 + v10;

    ++v7;
  }
  while (v4 != v7);
  if (v6)
  {
LABEL_7:
    uint64_t v11 = 0;
    do
    {
      objc_super v12 = [(SRGuideViewController *)self _domainSnippetForEnabledIntentSupportedAppAtIndex:v11];
      [(SRGuideViewController *)self _heightOfRowForDomainSnippet:v12];
      double v8 = v8 + v13;

      ++v11;
    }
    while (v6 != v11);
  }
LABEL_9:
  long long v14 = [(SRGuideViewController *)self _guideSnippet];
  long long v15 = [v14 appPunchOutButton];

  if (v15)
  {
    long long v16 = [(SRGuideViewController *)self _bigButtonViewController];
    long long v17 = [v16 view];
    [v17 sizeThatFits:CGSizeZero.width, CGSizeZero.height];
    double v8 = v8 + v18 + 8.0;
  }
  return v8;
}

- (void)_endTrackingGuideShowTimeIfNecessary
{
  if (self->_startViewingTime)
  {
    id v5 = +[NSDate date];
    BOOL v3 = [(SRGuideViewController *)self delegate];
    [v3 siriSnippetViewController:self didShowGuideStartDate:self->_startViewingTime endDate:v5];

    startViewingTime = self->_startViewingTime;
    self->_startViewingTime = 0;
  }
}

- (SAGuidanceGuideSnippet)_guideSnippet
{
  guideSnippet = self->_guideSnippet;
  if (!guideSnippet)
  {
    int64_t v4 = [(SRGuideViewController *)self snippet];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int64_t v6 = self->_guideSnippet;
      self->_guideSnippet = v5;
    }
    else
    {
      int64_t v6 = +[AFUIGuideCacheManager sharedManager];
      uint64_t v7 = [v6 cachedGuideSnippet];
      double v8 = self->_guideSnippet;
      self->_guideSnippet = v7;
    }
    guideSnippet = self->_guideSnippet;
  }

  return guideSnippet;
}

- (Class)transparentHeaderViewClass
{
  if ([(SRGuideViewController *)self _hasTitle]) {
    v2 = objc_opt_class();
  }
  else {
    v2 = 0;
  }

  return (Class)v2;
}

- (void)configureReusableTransparentHeaderView:(id)a3
{
  id v4 = a3;
  id v6 = [(SRGuideViewController *)self _guideSnippet];
  id v5 = [v6 headerText];
  [v4 setTitle:v5];
}

- (double)desiredHeightForTransparentHeaderView
{
  BOOL v3 = [(SRGuideViewController *)self delegate];
  [v3 siriViewControllerExpectedWidth:self];
  double v5 = v4;
  id v6 = [(SRGuideViewController *)self _guideSnippet];
  uint64_t v7 = [v6 headerText];
  +[SRGuideViewHeader sizeThatFits:text:](SRGuideViewHeader, "sizeThatFits:text:", v7, v5, 1.79769313e308);
  double v9 = v8;

  return v9;
}

- (BOOL)wantsToManageBackgroundColor
{
  return 1;
}

- (BOOL)usePlatterStyle
{
  return 0;
}

- (int64_t)_pinAnimationType
{
  return [(SRGuideViewController *)self _hasTitle];
}

- (int64_t)_numberOfHelpDomains
{
  v2 = [(SRGuideViewController *)self _guideSnippet];
  BOOL v3 = [v2 domainSnippets];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)_numberOfIntentSupportedApps
{
  v2 = [(SRGuideViewController *)self _guideSnippet];
  BOOL v3 = [v2 intentEnabledAppSnippets];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)_numberOfIntentEnabledApps
{
  return (int64_t)[(NSMutableArray *)self->_enabledIntentSupportedAppSnippets count];
}

- (id)_domainSnippetForHelpDomainAtIndex:(unint64_t)a3
{
  id v4 = [(SRGuideViewController *)self _guideSnippet];
  double v5 = [v4 domainSnippets];
  id v6 = [v5 objectAtIndexedSubscript:a3];

  return v6;
}

- (id)_domainSnippetForEnabledIntentSupportedAppAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_enabledIntentSupportedAppSnippets objectAtIndexedSubscript:a3];
}

- (id)_domainSnippetForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  id v6 = [v4 item];

  if (v5) {
    [(SRGuideViewController *)self _domainSnippetForEnabledIntentSupportedAppAtIndex:v6];
  }
  else {
  uint64_t v7 = [(SRGuideViewController *)self _domainSnippetForHelpDomainAtIndex:v6];
  }

  return v7;
}

- (double)_heightOfRowForDomainSnippet:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domainDisplayName];
  id v6 = [v4 tagPhrase];

  uint64_t v7 = [(SRGuideViewController *)self delegate];
  [v7 siriViewControllerExpectedWidth:self];
  +[SRGuideViewCell heightOfCellWithName:tagPhrase:width:](SRGuideViewCell, "heightOfCellWithName:tagPhrase:width:", v5, v6);
  double v9 = v8;

  return v9;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 2:
      double v8 = [(SRGuideViewController *)self _guideSnippet];
      double v9 = [v8 appPunchOutButton];
      int64_t v10 = v9 != 0;

      break;
    case 1:
      int64_t v7 = [(SRGuideViewController *)self _numberOfIntentEnabledApps];
      goto LABEL_7;
    case 0:
      int64_t v7 = [(SRGuideViewController *)self _numberOfHelpDomains];
LABEL_7:
      int64_t v10 = v7;
      break;
    default:
      uint64_t v11 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_1000B777C(a4, v11);
      }
      int64_t v10 = 0;
      break;
  }

  return v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 section];
  if ((unint64_t)v8 > 1)
  {
    int64_t v10 = +[SiriUISnippetControllerCell reuseIdentifier];
    uint64_t v11 = [v7 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v6];

    v24 = [(SRGuideViewController *)self _bigButtonViewController];
    [v11 setSnippetViewController:v24];

    [v11 setTopPadding:8.0];
  }
  else
  {
    id v9 = v8;
    int64_t v10 = +[SRGuideViewCell reuseIdentifier];
    uint64_t v11 = [v7 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v6];

    objc_super v12 = [(SRGuideViewController *)self _domainSnippetForIndexPath:v6];
    double v13 = [v12 aceId];
    [v11 setAceId:v13];
    long long v14 = [(NSCache *)self->_domainIconCache objectForKey:v13];
    if (!v14)
    {
      long long v14 = [(SRGuideViewController *)self _fallbackImage];
      spawnedGuideImageFetches = self->_spawnedGuideImageFetches;
      long long v16 = [v12 aceId];
      LOBYTE(spawnedGuideImageFetches) = [(NSMutableSet *)spawnedGuideImageFetches containsObject:v16];

      if ((spawnedGuideImageFetches & 1) == 0)
      {
        guideImageOperationQueue = self->_guideImageOperationQueue;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10001A2E8;
        v28[3] = &unk_1001434D8;
        v28[4] = self;
        id v18 = v12;
        id v29 = v18;
        id v30 = v13;
        id v31 = v11;
        [(NSOperationQueue *)guideImageOperationQueue addOperationWithBlock:v28];
        v19 = self->_spawnedGuideImageFetches;
        v20 = [v18 aceId];
        [(NSMutableSet *)v19 addObject:v20];
      }
    }
    [v11 setIconImage:v14];
    v21 = [v12 domainDisplayName];
    [v11 setName:v21];

    v22 = [v12 tagPhrase];
    [v11 setTagPhrase:v22];

    if (v9)
    {
      v23 = [(SRGuideViewController *)self _numberOfIntentEnabledApps];
      if (v23 == (char *)[v6 item] + 1) {
        [v11 setKeylineType:0];
      }
    }
    else
    {
      v25 = [(SRGuideViewController *)self _numberOfHelpDomains];
      if (v25 == (char *)[v6 item] + 1)
      {
        [v11 setKeylineType:1];
        v26 = +[UIColor siriui_lightKeylineColor];
        [v11 setKeylineCustomBackgroundColor:v26];
      }
    }
  }

  return v11;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  id v8 = +[SRGuideViewHeader reuseIdentifier];
  id v9 = [v7 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v8 forIndexPath:v6];

  return v9;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectItemAtIndexPath:v6 animated:1];
  id v7 = [v6 section];
  if ((unint64_t)v7 <= 1)
  {
    if (v7)
    {
      id v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_enabledIntentSupportedAppSnippets, "objectAtIndexedSubscript:", [v6 item]);
    }
    else
    {
      id v9 = [(SRGuideViewController *)self _guideSnippet];
      int64_t v10 = [v9 domainSnippets];
      id v8 = [v10 objectAtIndexedSubscript:[v6 item]];
    }
    uint64_t v11 = [(SRGuideViewController *)self delegate];
    double v13 = v8;
    objc_super v12 = +[NSArray arrayWithObjects:&v13 count:1];
    [v11 siriSnippetViewController:self pushSirilandSnippets:v12];

    self->_showingDetails = 1;
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [v6 section];
  id v8 = [(SRGuideViewController *)self delegate];
  [v8 siriViewControllerExpectedWidth:self];
  double v10 = v9;

  if (v7 == (id)2)
  {
    uint64_t v11 = [(SRGuideViewController *)self _bigButtonViewController];
    objc_super v12 = [v11 view];
    [v12 sizeThatFits:CGSizeZero.width, CGSizeZero.height];
    double v14 = v13 + 8.0;
  }
  else
  {
    uint64_t v11 = [(SRGuideViewController *)self _domainSnippetForIndexPath:v6];
    [(SRGuideViewController *)self _heightOfRowForDomainSnippet:v11];
    double v14 = v15;
  }

  double v16 = v10;
  double v17 = v14;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)_iconImageForGuideDomainSnippet:(id)a3
{
  id v4 = a3;
  id v5 = [v4 iconDisplayIdentifier];
  id v6 = [v4 iconResourceName];
  if (v5 && [v4 isAppIcon])
  {
    id v7 = +[UIScreen mainScreen];
    [v7 scale];
    +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v5, 1);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8) {
      goto LABEL_13;
    }
  }
  else
  {
    id v8 = 0;
  }
  if (v6)
  {
    double v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = +[UIImage _deviceSpecificImageNamed:v6 inBundle:v9];
    if ([v4 iconNeedsProcessing])
    {
      double v10 = +[UIScreen mainScreen];
      [v10 scale];
      double v12 = v11;

      if (v12 != 2.0)
      {
        double v13 = +[UIScreen mainScreen];
        [v13 scale];
      }
      id v8 = v8;
      [v8 CGImage];
      uint64_t v14 = LICreateIconForImage();
      if (v14)
      {
        double v15 = (CGImage *)v14;
        uint64_t v16 = +[UIImage imageWithCGImage:v14];

        CGImageRelease(v15);
        id v8 = (id)v16;
      }
    }
  }
LABEL_13:
  if (!v8)
  {
    id v8 = [(SRGuideViewController *)self _fallbackImage];
  }

  return v8;
}

- (id)_fallbackImage
{
  fallbackImage = self->_fallbackImage;
  if (!fallbackImage)
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = +[UIImage _deviceSpecificImageNamed:@"Siri" inBundle:v4];
    id v6 = self->_fallbackImage;
    self->_fallbackImage = v5;

    fallbackImage = self->_fallbackImage;
  }

  return fallbackImage;
}

- (BOOL)_hasTitle
{
  v2 = [(SRGuideViewController *)self _guideSnippet];
  BOOL v3 = [v2 headerText];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)_prepareSiriEnabledAppList
{
  BOOL v3 = [(SRGuideViewController *)self delegate];
  BOOL v4 = [v3 siriEnabledAppListForSiriViewController:self];
  siriEnabledAppList = self->_siriEnabledAppList;
  self->_siriEnabledAppList = v4;

  id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  enabledIntentSupportedAppSnippets = self->_enabledIntentSupportedAppSnippets;
  self->_enabledIntentSupportedAppSnippets = v6;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [(SRGuideViewController *)self _guideSnippet];
  double v9 = [v8 intentEnabledAppSnippets];

  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v14 performIntentEnabledAppAuthorizationCheck])
        {
          double v15 = self->_siriEnabledAppList;
          uint64_t v16 = [v14 iconDisplayIdentifier];
          LODWORD(v15) = [(NSSet *)v15 containsObject:v16];

          if (!v15) {
            continue;
          }
        }
        [(NSMutableArray *)self->_enabledIntentSupportedAppSnippets addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (BOOL)_canShowWhileLocked
{
  return _SiriUISafeForLockScreen(self, a2);
}

- (void)setGuideSnippet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guideSnippet, 0);
  objc_storeStrong((id *)&self->_enabledIntentSupportedAppSnippets, 0);
  objc_storeStrong((id *)&self->_fallbackImage, 0);
  objc_storeStrong((id *)&self->_spawnedGuideImageFetches, 0);
  objc_storeStrong((id *)&self->_guideImageOperationQueue, 0);
  objc_storeStrong((id *)&self->_bigButtonController, 0);
  objc_storeStrong((id *)&self->_siriEnabledAppList, 0);
  objc_storeStrong((id *)&self->_startViewingTime, 0);

  objc_storeStrong((id *)&self->_domainIconCache, 0);
}

@end