@interface HLPHelpViewController
+ (id)URLWithBookID:(id)a3 topicID:(id)a4;
+ (id)URLWithBookID:(id)a3 topicID:(id)a4 anchorID:(id)a5 version:(id)a6;
+ (id)URLWithBookID:(id)a3 topicID:(id)a4 anchorID:(id)a5 version:(id)a6 platformIndependent:(BOOL)a7;
+ (id)URLWithBookID:(id)a3 topicID:(id)a4 version:(id)a5;
+ (id)URLWithTopicID:(id)a3;
+ (id)deviceFamily;
+ (id)helpViewController;
+ (id)helpViewControllerWithIdentifier:(id)a3 version:(id)a4;
+ (id)helpViewControllerWithLocalHelpBookFileURL:(id)a3;
+ (id)helpViewControllerWithTitle:(id)a3 identifier:(id)a4 version:(id)a5;
+ (id)helpViewControllerWithTitle:(id)a3 identifier:(id)a4 version:(id)a5 subpath:(id)a6;
+ (id)helpViewControllerWithURL:(id)a3;
+ (id)mainUserGuideIdentifier;
+ (id)platform;
+ (id)platformIndependentIdentifiers;
+ (id)platformVersion;
+ (void)clearCacheControllers;
+ (void)updateViewController:(id)a3 title:(id)a4 identifier:(id)a5 version:(id)a6 subpath:(id)a7;
- (BOOL)displayHelpTopicsOnly;
- (BOOL)hideDoneButton;
- (BOOL)platformIndependent;
- (BOOL)prefersLandingViewOnLoad;
- (BOOL)shouldDisallowOffSiteRedirects;
- (BOOL)showTopicNameAsTitle;
- (BOOL)showTopicViewOnLoad;
- (BOOL)useModalPresentation;
- (HLPHelpBookController)helpBookController;
- (HLPHelpLoadingView)loadingView;
- (HLPHelpLocaleController)localeListController;
- (HLPHelpTableOfContentViewController)tableOfContentViewController;
- (HLPHelpTopicViewController)topicViewController;
- (HLPHelpViewController)init;
- (HLPHelpViewControllerDelegate)delegate;
- (HLPReachabilityManager)reachabilityManager;
- (NSArray)additionalSupportedLanguages;
- (NSArray)preferredLanguagesOverride;
- (NSMutableDictionary)localHelpBookNameIDMap;
- (NSString)helpBookBasePath;
- (NSString)identifier;
- (NSString)selectedHelpTopicID;
- (NSString)selectedHelpTopicName;
- (NSString)subpath;
- (NSString)version;
- (NSURL)helpBookURL;
- (NSURL)localHelpBookFileURL;
- (UIView)fullBookViewSeparator;
- (id)currentHelpTopicItemForTableOfContentViewController:(id)a3;
- (id)localHelpBookAnalyticIdentifier;
- (id)topicIDForTopicName:(id)a3 locale:(id)a4;
- (void)_setContext:(id)a3;
- (void)_setFullBookView:(BOOL)a3;
- (void)_setSupportsDarkMode:(BOOL)a3;
- (void)_showHelpTopicItem:(id)a3 anchor:(id)a4 allowErrorMessage:(BOOL)a5 animate:(BOOL)a6;
- (void)_showWithLoadInfo:(id)a3 allowErrorMessage:(BOOL)a4 animate:(BOOL)a5;
- (void)_showWithLoadInfo:(id)a3 animate:(BOOL)a4;
- (void)cleanup;
- (void)dealloc;
- (void)dismiss;
- (void)displayHelpBookWithLocale:(id)a3;
- (void)helpTopicViewController:(id)a3 failToLoadWithError:(id)a4;
- (void)helpTopicViewController:(id)a3 selectedHelpTopicItem:(id)a4 accessType:(int64_t)a5;
- (void)helpTopicViewController:(id)a3 topicLoaded:(id)a4;
- (void)helpTopicViewController:(id)a3 traitCollectionChanged:(id)a4;
- (void)helpTopicViewControllerContentViewed:(id)a3 topicID:(id)a4 topicTitle:(id)a5 source:(id)a6 interfaceStyle:(int64_t)a7 fromTopicID:(id)a8 externalURLString:(id)a9;
- (void)helpTopicViewControllerCurrentTopicIsPassionPoint:(id)a3;
- (void)helpTopicViewControllerShowHelpBookInfo:(id)a3;
- (void)helpTopicViewControllerTableOfContentButtonTapped:(id)a3;
- (void)loadBookWithTitle:(id)a3 identifier:(id)a4 topicID:(id)a5 version:(id)a6;
- (void)loadFromStaticServer;
- (void)loadHelpBook;
- (void)loadHelpTopicID:(id)a3;
- (void)loadHelpTopicItem:(id)a3;
- (void)popWelcomeTopicView;
- (void)reachabilityManagerConnectionStatusChanged:(id)a3 connected:(BOOL)a4;
- (void)registerTraitChanges;
- (void)removeDDMLoadFailVersion;
- (void)setAdditionalSupportedLanguages:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayHelpTopicsOnly:(BOOL)a3;
- (void)setFullBookViewSeparator:(id)a3;
- (void)setHelpBookBasePath:(id)a3;
- (void)setHelpBookController:(id)a3;
- (void)setHelpBookURL:(id)a3;
- (void)setHideDoneButton:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setLocalHelpBookFileURL:(id)a3;
- (void)setLocalHelpBookNameIDMap:(id)a3;
- (void)setLocaleListController:(id)a3;
- (void)setPlatformIndependent:(BOOL)a3;
- (void)setPreferredLanguagesOverride:(id)a3;
- (void)setPrefersLandingViewOnLoad:(BOOL)a3;
- (void)setReachabilityManager:(id)a3;
- (void)setSelectedHelpTopicID:(id)a3;
- (void)setSelectedHelpTopicName:(id)a3;
- (void)setShouldDisallowOffSiteRedirects:(BOOL)a3;
- (void)setShowTopicNameAsTitle:(BOOL)a3;
- (void)setShowTopicViewOnLoad:(BOOL)a3;
- (void)setSubpath:(id)a3;
- (void)setTableOfContentViewController:(id)a3;
- (void)setTopicViewController:(id)a3;
- (void)setUseModalPresentation:(BOOL)a3;
- (void)setVersion:(id)a3;
- (void)setup;
- (void)setupFullBookView;
- (void)setupTableContentViewController;
- (void)setupTopicViewController;
- (void)showHelpBookInfo:(id)a3;
- (void)showMessageForError:(id)a3;
- (void)showTopicView;
- (void)tableOfContentViewController:(id)a3 showHelpTopicItem:(id)a4;
- (void)tableOfContentViewControllerSearchUsed:(id)a3;
- (void)tableOfContentViewControllerShowHelpBookInfo:(id)a3;
- (void)tableOfContentViewControllerToCContentViewed:(id)a3 topicID:(id)a4 topicTitle:(id)a5 source:(id)a6 interfaceStyle:(int64_t)a7 fromTopicID:(id)a8 externalURLString:(id)a9;
- (void)traitCollectionChangedFrom:(id)a3;
- (void)updateCacheControllerToLanguageCode:(id)a3;
- (void)updateChildViewConstraints;
- (void)updateDarkMode;
- (void)updateDoneButton;
- (void)updateHelpBookController;
- (void)updateLastLoadVersion;
- (void)updateTOCButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HLPHelpViewController

+ (id)mainUserGuideIdentifier
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((unint64_t)(v3 - 1) > 5) {
    return @"iphone";
  }
  else {
    return off_264578E78[v3 - 1];
  }
}

+ (id)deviceFamily
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((unint64_t)(v3 - 1) > 5) {
    return @"iphone";
  }
  else {
    return off_264578EA8[v3 - 1];
  }
}

+ (id)platform
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  v4 = @"ios";
  if (v3 == 6) {
    v4 = @"visionos";
  }
  if (v3 == 1) {
    return @"ipados";
  }
  else {
    return v4;
  }
}

+ (id)platformVersion
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

+ (id)URLWithTopicID:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() URLWithBookID:0 topicID:v3];

  return v4;
}

+ (id)URLWithBookID:(id)a3 topicID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() URLWithBookID:v6 topicID:v5 version:0];

  return v7;
}

+ (id)URLWithBookID:(id)a3 topicID:(id)a4 version:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(id)objc_opt_class() URLWithBookID:v9 topicID:v8 anchorID:0 version:v7];

  return v10;
}

+ (id)URLWithBookID:(id)a3 topicID:(id)a4 anchorID:(id)a5 version:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() URLWithBookID:v10 topicID:v9 anchorID:0 version:v8 platformIndependent:1];

  return v11;
}

+ (id)URLWithBookID:(id)a3 topicID:(id)a4 anchorID:(id)a5 version:(id)a6 platformIndependent:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
  if ([v11 length])
  {
    v16 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"book" value:v11];
    [v15 addObject:v16];
  }
  if ([v12 length])
  {
    v17 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"topic" value:v12];
    [v15 addObject:v17];
  }
  if ([v13 length])
  {
    v18 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"anchor" value:v13];
    [v15 addObject:v18];
  }
  if ([v14 length])
  {
    v19 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"version" value:v14];
    [v15 addObject:v19];
  }
  if (!a7)
  {
    id v20 = objc_alloc(MEMORY[0x263F08BD0]);
    v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
    v22 = (void *)[v20 initWithName:@"platformIndependent" value:v21];

    [v15 addObject:v22];
  }
  id v23 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v23 setScheme:@"helpkit"];
  [v23 setHost:@"open"];
  [v23 setQueryItems:v15];
  v24 = [v23 URL];

  return v24;
}

+ (id)helpViewController
{
  return +[HLPHelpViewController helpViewControllerWithIdentifier:0 version:0];
}

+ (id)helpViewControllerWithURL:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F08BA0] componentsWithURL:v3 resolvingAgainstBaseURL:0];
  id v5 = [v4 scheme];
  if (([v5 isEqualToString:@"helpkit"] & 1) == 0)
  {

    goto LABEL_26;
  }
  id v6 = [v4 host];
  int v7 = [v6 isEqualToString:@"open"];

  if (!v7)
  {
LABEL_26:
    id v23 = 0;
    v24 = 0;
    id v11 = 0;
    id v12 = 0;
    uint64_t v25 = 1;
    goto LABEL_36;
  }
  v32 = v4;
  id v33 = v3;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v8 = [v4 queryItems];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v35 = 0;
    v36 = 0;
    id v11 = 0;
    id v12 = 0;
    uint64_t v13 = *(void *)v38;
    char v34 = 1;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v37 + 1) + 8 * v14);
        v16 = [v15 name];
        v17 = [v15 value];
        if (([v16 isEqualToString:@"book"] & 1) != 0
          || [v16 isEqualToString:@"bookId"])
        {
          id v18 = v17;

          id v12 = v18;
        }
        else if (([v16 isEqualToString:@"topic"] & 1) != 0 {
               || [v16 isEqualToString:@"topicId"])
        }
        {
          id v19 = v17;

          id v11 = v19;
        }
        else if (([v16 isEqualToString:@"anchor"] & 1) != 0 {
               || [v16 isEqualToString:@"anchorId"])
        }
        {
          id v20 = v17;

          v36 = v20;
        }
        else if ([v16 isEqualToString:@"version"])
        {
          v21 = v17;

          v35 = v21;
        }
        else if ([v16 isEqualToString:@"platformIndependent"])
        {
          char v34 = [v17 BOOLValue];
        }

        ++v14;
      }
      while (v10 != v14);
      uint64_t v22 = [v8 countByEnumeratingWithState:&v37 objects:v41 count:16];
      uint64_t v10 = v22;
    }
    while (v22);
  }
  else
  {
    v35 = 0;
    v36 = 0;
    id v11 = 0;
    id v12 = 0;
    char v34 = 1;
  }

  id v23 = v35;
  uint64_t v26 = [(__CFString *)v35 length];
  if ([v12 length])
  {
    v4 = v32;
    id v3 = v33;
    v24 = v36;
    if (!v26)
    {
      v27 = @"HLPHelpViewControllerVersionLatest";
LABEL_34:

      id v23 = v27;
    }
  }
  else
  {
    uint64_t v28 = [(id)objc_opt_class() mainUserGuideIdentifier];

    v4 = v32;
    id v3 = v33;
    v24 = v36;
    if (!v26)
    {
      v27 = [(id)objc_opt_class() platformVersion];
      id v12 = (void *)v28;
      goto LABEL_34;
    }
    id v12 = (void *)v28;
  }
  uint64_t v25 = v34 & 1;
LABEL_36:
  v29 = +[HLPHelpViewController helpViewControllerWithIdentifier:v12 version:v23];
  if (v11)
  {
    if (v24)
    {
      uint64_t v30 = [v11 stringByAppendingFormat:@"#%@", v24];

      id v11 = (void *)v30;
    }
    [v29 setSelectedHelpTopicID:v11];
  }
  [v29 setPlatformIndependent:v25];

  return v29;
}

+ (id)helpViewControllerWithLocalHelpBookFileURL:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(HLPHelpViewController);
  [(HLPHelpViewController *)v4 setLocalHelpBookFileURL:v3];

  return v4;
}

+ (id)helpViewControllerWithIdentifier:(id)a3 version:(id)a4
{
  return +[HLPHelpViewController helpViewControllerWithTitle:0 identifier:a3 version:a4];
}

+ (id)helpViewControllerWithTitle:(id)a3 identifier:(id)a4 version:(id)a5
{
  return +[HLPHelpViewController helpViewControllerWithTitle:a3 identifier:a4 version:a5 subpath:0];
}

+ (id)helpViewControllerWithTitle:(id)a3 identifier:(id)a4 version:(id)a5 subpath:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = objc_alloc_init(HLPHelpViewController);
  [(id)objc_opt_class() updateViewController:v13 title:v12 identifier:v11 version:v10 subpath:v9];

  return v13;
}

+ (void)updateViewController:(id)a3 title:(id)a4 identifier:(id)a5 version:(id)a6 subpath:(id)a7
{
  id v25 = a3;
  id v11 = a5;
  id v12 = (__CFString *)a6;
  id v13 = a7;
  [v25 setTitle:a4];
  if (+[HLPCommonDefines isInternalBuild])
  {
    uint64_t v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v15 = [v14 objectForKey:@"HLPHelpBookOverrideIdentifier"];
    v16 = (void *)v15;
    if (v15) {
      v17 = (void *)v15;
    }
    else {
      v17 = v11;
    }
    id v18 = v17;

    uint64_t v19 = [v14 stringForKey:@"HLPHelpBookVersionOverride"];
    id v20 = (void *)v19;
    if (v19) {
      v21 = (void *)v19;
    }
    else {
      v21 = v12;
    }
    uint64_t v22 = v21;

    id v12 = v22;
    id v11 = v18;
  }
  if (![v11 length])
  {
    uint64_t v23 = [(id)objc_opt_class() mainUserGuideIdentifier];

    id v11 = (id)v23;
  }
  if (![(__CFString *)v12 length])
  {
    uint64_t v24 = [(id)objc_opt_class() platformVersion];

    id v12 = (__CFString *)v24;
  }
  [v25 setIdentifier:v11];
  if ([(__CFString *)v12 isEqualToString:@"HLPHelpViewControllerVersionLatest"])
  {

    id v12 = @"1000";
  }
  [v25 setVersion:v12];
  [v25 setSubpath:v13];
}

+ (void)clearCacheControllers
{
  v2 = +[HLPJSONCacheController sharedInstance];
  [v2 removeAllDataCache];

  id v3 = +[HLPStringCacheController sharedInstance];
  [v3 removeAllDataCache];

  v4 = +[HLPFileCacheController sharedInstance];
  [v4 removeAllDataCache];

  id v5 = +[HLPImageCacheController sharedInstance];
  [v5 removeAllDataCache];
}

+ (id)platformIndependentIdentifiers
{
  return &unk_26D2A8580;
}

- (void)dealloc
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  id v3 = +[HLPImageCacheController sharedInstance];
  [v3 removeInMemoryCache];

  [MEMORY[0x263F086E0] removeHLPBundle];
  v4.receiver = self;
  v4.super_class = (Class)HLPHelpViewController;
  [(HLPHelpViewController *)&v4 dealloc];
}

- (HLPHelpViewController)init
{
  v13.receiver = self;
  v13.super_class = (Class)HLPHelpViewController;
  v2 = [(HLPHelpViewController *)&v13 init];
  if (v2)
  {
    id v3 = +[HLPURLSessionHandler sharedInstance];
    [v3 setExcludeCachingDataTypes:0];

    objc_super v4 = +[HLPURLSessionHandler sharedInstance];
    id v5 = +[HLPURLSessionManager defaultManager];
    [v5 setDelegate:v4];

    id v6 = +[HLPURLSessionHandler sharedInstance];
    int v7 = +[HLPURLSessionManager defaultManager];
    [v7 setDefaultSessionDelegate:v6];

    if (+[HLPCommonDefines isInternalBuild])
    {
      id v8 = +[HLPURLSessionACAuthContext defaultContext];
      [v8 setClientIdentifier:@"58f932fbcc7cea7d190041a7"];
      id v9 = [[HLPURLSessionACAuthHandler alloc] initWithAuthenticationContext:v8];
      id v10 = +[HLPURLSessionManager defaultManager];
      [v10 setAuthenticationHandler:v9];
    }
    v2->_shouldDismissWelcomeTopic = 1;
    v2->_showTopicViewOnLoad = 0;
    selectedHelpTopicID = v2->_selectedHelpTopicID;
    v2->_selectedHelpTopicID = (NSString *)&stru_26D29FC58;

    v2->_useModalPresentation = 1;
    if (+[HLPCommonDefines isVisionOS]) {
      v2->_supportsDarkMode = 1;
    }
    [(id)objc_opt_class() updateViewController:v2 title:0 identifier:0 version:0 subpath:0];
  }
  return v2;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HLPHelpViewController;
  [(HLPHelpViewController *)&v3 viewDidLoad];
  [(HLPHelpViewController *)self setup];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HLPHelpViewController;
  [(HLPHelpViewController *)&v4 viewWillAppear:a3];
  [(HLPHelpViewController *)self updateHelpBookController];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HLPHelpViewController;
  [(HLPHelpViewController *)&v4 viewDidAppear:a3];
  self->_showingHelpTopic = 0;
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)HLPHelpViewController;
  [(HLPHelpViewController *)&v4 viewDidLayoutSubviews];
  objc_super v3 = [(HLPHelpViewController *)self view];
  [v3 safeAreaInsets];
  -[NSLayoutConstraint setConstant:](self->_loadingViewTopConstraint, "setConstant:");
}

- (void)_setContext:(id)a3
{
  id v5 = (NSDictionary *)a3;
  if (self->_context != v5)
  {
    objc_storeStrong((id *)&self->_context, a3);
    +[HLPCommonDefines setAuthenticationContext:v5];
  }
}

- (HLPHelpLoadingView)loadingView
{
  loadingView = self->_loadingView;
  if (!loadingView)
  {
    objc_super v4 = [HLPHelpLoadingView alloc];
    id v5 = -[HLPHelpLoadingView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v6 = self->_loadingView;
    self->_loadingView = v5;

    [(HLPHelpLoadingView *)self->_loadingView setDelegate:self];
    topicViewController = self->_topicViewController;
    if (topicViewController) {
      uint64_t supportsDarkMode = [(HLPHelpTopicViewController *)topicViewController supportsDarkMode];
    }
    else {
      uint64_t supportsDarkMode = self->_supportsDarkMode;
    }
    [(HLPHelpLoadingView *)self->_loadingView setSupportsDarkMode:supportsDarkMode];
    [(HLPHelpLoadingView *)self->_loadingView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v9 = [(HLPHelpViewController *)self view];
    [v9 addSubview:self->_loadingView];

    id v10 = [(HLPHelpLoadingView *)self->_loadingView topAnchor];
    id v11 = [(HLPHelpViewController *)self view];
    id v12 = [v11 topAnchor];
    objc_super v13 = [v10 constraintEqualToAnchor:v12];
    loadingViewTopConstraint = self->_loadingViewTopConstraint;
    self->_loadingViewTopConstraint = v13;

    [(NSLayoutConstraint *)self->_loadingViewTopConstraint setActive:1];
    uint64_t v15 = [(HLPHelpLoadingView *)self->_loadingView bottomAnchor];
    v16 = [(HLPHelpViewController *)self view];
    v17 = [v16 bottomAnchor];
    id v18 = [v15 constraintEqualToAnchor:v17];
    [v18 setActive:1];

    uint64_t v19 = [(HLPHelpLoadingView *)self->_loadingView leadingAnchor];
    id v20 = [(HLPHelpViewController *)self view];
    v21 = [v20 leadingAnchor];
    uint64_t v22 = [v19 constraintEqualToAnchor:v21];
    [v22 setActive:1];

    uint64_t v23 = [(HLPHelpLoadingView *)self->_loadingView trailingAnchor];
    uint64_t v24 = [(HLPHelpViewController *)self view];
    id v25 = [v24 trailingAnchor];
    uint64_t v26 = [v23 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    loadingView = self->_loadingView;
  }
  return loadingView;
}

- (HLPReachabilityManager)reachabilityManager
{
  reachabilityManager = self->_reachabilityManager;
  if (!reachabilityManager)
  {
    objc_super v4 = objc_alloc_init(HLPReachabilityManager);
    id v5 = self->_reachabilityManager;
    self->_reachabilityManager = v4;

    [(HLPReachabilityManager *)self->_reachabilityManager setDelegate:self];
    reachabilityManager = self->_reachabilityManager;
  }
  return reachabilityManager;
}

- (id)localHelpBookAnalyticIdentifier
{
  v2 = [(HLPHelpViewController *)self localHelpBookFileURL];
  objc_super v3 = [v2 lastPathComponent];

  return v3;
}

- (void)setHideDoneButton:(BOOL)a3
{
  self->_hideDoneButton = a3;
  [(HLPHelpViewController *)self updateDoneButton];
}

- (void)_setSupportsDarkMode:(BOOL)a3
{
  self->_uint64_t supportsDarkMode = a3;
}

- (void)setShouldDisallowOffSiteRedirects:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[HLPURLSessionHandler sharedInstance];
  [v4 setShouldDisallowOffsiteRedirects:v3];
}

- (BOOL)shouldDisallowOffSiteRedirects
{
  v2 = +[HLPURLSessionHandler sharedInstance];
  char v3 = [v2 shouldDisallowOffsiteRedirects];

  return v3;
}

- (void)_setFullBookView:(BOOL)a3
{
  self->_fullBookView = a3;
}

- (void)cleanup
{
  [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController willMoveToParentViewController:0];
  char v3 = [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController view];
  [v3 removeFromSuperview];

  [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController removeFromParentViewController];
  tableOfContentViewController = self->_tableOfContentViewController;
  self->_tableOfContentViewController = 0;

  [(UIView *)self->_fullBookViewSeparator removeFromSuperview];
  fullBookViewSeparator = self->_fullBookViewSeparator;
  self->_fullBookViewSeparator = 0;

  id v6 = [(HLPHelpViewController *)self navigationController];
  id v7 = (id)[v6 popToRootViewControllerAnimated:0];

  [(HLPHelpTopicViewController *)self->_topicViewController willMoveToParentViewController:0];
  id v8 = [(HLPHelpTopicViewController *)self->_topicViewController view];
  [v8 removeFromSuperview];

  [(HLPHelpTopicViewController *)self->_topicViewController removeFromParentViewController];
  [(HLPHelpTopicViewController *)self->_topicViewController cleanup];
  topicViewController = self->_topicViewController;
  self->_topicViewController = 0;

  localeListController = self->_localeListController;
  self->_localeListController = 0;

  helpBookController = self->_helpBookController;
  self->_helpBookController = 0;

  id v12 = [(HLPHelpViewController *)self navigationItem];
  [v12 setLeftBarButtonItem:0];

  objc_super v13 = [(HLPHelpViewController *)self loadingView];
  [v13 showActivityIndicator:1];

  uint64_t v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v14 removeObjectForKey:kHLPHelpTopicViewControllerLastTopicHistoryItem];

  selectedHelpTopicID = self->_selectedHelpTopicID;
  self->_selectedHelpTopicID = (NSString *)&stru_26D29FC58;

  selectedHelpTopicName = self->_selectedHelpTopicName;
  self->_selectedHelpTopicName = 0;

  self->_showingHelpTopic = 0;
}

- (void)setup
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  if ([v3 BOOLForKey:@"HLPHelpBookResetToShowLandingPage"])
  {
    [v3 removeObjectForKey:kHLPHelpTopicViewControllerLastTopicHistoryItem];
    [v3 synchronize];
  }
  if ([v3 BOOLForKey:@"HLPHelpBookPlatformIndependent"])
  {
    [(HLPHelpViewController *)self setPlatformIndependent:1];
  }
  else
  {
    [(id)objc_opt_class() platformIndependentIdentifiers];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v10 = [(NSString *)self->_identifier lowercaseString];
          LODWORD(v9) = [v10 hasPrefix:v9];

          if (v9)
          {
            [(HLPHelpViewController *)self setPlatformIndependent:1];
            [(HLPHelpViewController *)self _setSupportsDarkMode:1];
            goto LABEL_15;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  if (objc_msgSend(v3, "BOOLForKey:", @"HLPHelpBookSupportsDarkMode", (void)v22)) {
    [(HLPHelpViewController *)self _setSupportsDarkMode:1];
  }
  [(HLPHelpViewController *)self updateDarkMode];
  id v11 = self->_identifier;
  if (!v11)
  {
    id v12 = [(HLPHelpViewController *)self localHelpBookFileURL];

    if (!v12
      || ([(HLPHelpViewController *)self localHelpBookAnalyticIdentifier],
          (id v11 = (NSString *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_super v13 = HLPLogForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [(HLPHelpViewController *)self localHelpBookFileURL];
        *(_DWORD *)buf = 138412290;
        v27 = v14;
        _os_log_impl(&dword_220BD8000, v13, OS_LOG_TYPE_DEFAULT, "Local help book URL %@", buf, 0xCu);
      }
      id v11 = 0;
    }
  }
  uint64_t v15 = +[HLPAnalyticsEventController sharedInstance];
  [v15 configureWithHelpBookID:v11 version:self->_version];

  v16 = [(HLPHelpViewController *)self title];
  if (v16 || [(HLPHelpViewController *)self displayHelpTopicsOnly])
  {
  }
  else if (!self->_fullBookView)
  {
    id v20 = [MEMORY[0x263F086E0] HLPBundle];
    v21 = [v20 localizedStringForKey:@"Help" value:&stru_26D29FC58 table:0];
    [(HLPHelpViewController *)self setTitle:v21];
  }
  if (self->_fullBookView && !self->_displayHelpTopicsOnly)
  {
    [(HLPHelpViewController *)self setupFullBookView];
    goto LABEL_36;
  }
  if ([(NSString *)self->_selectedHelpTopicID length]
    || [(NSString *)self->_selectedHelpTopicName length])
  {
    self->_showTopicViewOnLoad = 1;
    goto LABEL_32;
  }
  if (self->_showTopicViewOnLoad)
  {
LABEL_32:
    if (!self->_topicViewController)
    {
      [(HLPHelpViewController *)self _showHelpTopicItem:0 anchor:0 allowErrorMessage:0 animate:0];
      self->_showingHelpTopic = 0;
    }
  }
  [(HLPHelpViewController *)self setupTableContentViewController];
  [(HLPHelpViewController *)self updateDoneButton];
  [(HLPHelpViewController *)self updateTOCButton];
  [(HLPHelpViewController *)self updateChildViewConstraints];
  [(HLPHelpViewController *)self setDefinesPresentationContext:1];
LABEL_36:
  [(HLPHelpViewController *)self loadHelpBook];
  v17 = [(HLPHelpViewController *)self navigationItem];
  [v17 setPreferredSearchBarPlacement:2];

  id v18 = objc_alloc_init(MEMORY[0x263F1C7E8]);
  [v18 configureWithDefaultBackground];
  uint64_t v19 = [(HLPHelpViewController *)self navigationItem];
  [v19 setScrollEdgeAppearance:v18];

  [(HLPHelpViewController *)self registerTraitChanges];
}

- (void)updateHelpBookController
{
  if ([(HLPRemoteDataController *)self->_helpBookController hasLoaded]
    && ![(HLPRemoteDataController *)self->_helpBookController loading])
  {
    char v3 = [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController helpBookController];
    if (v3)
    {
    }
    else if (self->_helpBookController)
    {
      tableOfContentViewController = self->_tableOfContentViewController;
      -[HLPHelpTableOfContentViewController updateWithHelpBookController:](tableOfContentViewController, "updateWithHelpBookController:");
    }
  }
}

- (void)setupFullBookView
{
  [(HLPHelpViewController *)self setupTableContentViewController];
  [(HLPHelpViewController *)self setupTopicViewController];
  id v82 = [(HLPHelpTopicViewController *)self->_topicViewController view];
  char v3 = [(HLPHelpViewController *)self view];
  if (+[HLPCommonDefines isVisionOS])
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:self->_tableOfContentViewController];
    uint64_t v5 = [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController view];
    [v5 setHidden:1];

    [(HLPHelpViewController *)self addChildViewController:v4];
    uint64_t v6 = [(HLPHelpViewController *)self view];
    uint64_t v7 = [v4 view];
    [v6 addSubview:v7];

    id v8 = [v4 view];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v9 = [v8 leadingAnchor];
    id v10 = [v3 leadingAnchor];
    id v11 = [v9 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    id v12 = [v8 widthAnchor];
    objc_super v13 = [v12 constraintEqualToConstant:320.0];
    [v13 setActive:1];

    uint64_t v14 = [v8 topAnchor];
    uint64_t v15 = [v3 topAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    v17 = [v8 bottomAnchor];
    id v18 = [v3 bottomAnchor];
    uint64_t v19 = [v17 constraintEqualToAnchor:v18];
    [v19 setActive:1];

    [v4 didMoveToParentViewController:self];
    if (([v82 isDescendantOfView:v3] & 1) == 0)
    {
      id v20 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:self->_topicViewController];
      v21 = [(HLPHelpTopicViewController *)self->_topicViewController view];
      [v21 setHidden:1];

      [(HLPHelpViewController *)self addChildViewController:v20];
      long long v22 = [(HLPHelpViewController *)self view];
      long long v23 = [v20 view];
      [v22 addSubview:v23];

      long long v24 = [v20 view];
      [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
      long long v25 = [v24 leadingAnchor];
      uint64_t v26 = [v8 trailingAnchor];
      v27 = [v25 constraintEqualToAnchor:v26];
      [v27 setActive:1];

      uint64_t v28 = [v24 trailingAnchor];
      uint64_t v29 = [v3 trailingAnchor];
      uint64_t v30 = [v28 constraintEqualToAnchor:v29];
      [v30 setActive:1];

      v31 = [v24 topAnchor];
      v32 = [v3 topAnchor];
      id v33 = [v31 constraintEqualToAnchor:v32];
      [v33 setActive:1];

      char v34 = [v24 bottomAnchor];
      v35 = [v3 bottomAnchor];
      v36 = [v34 constraintEqualToAnchor:v35];
      [v36 setActive:1];

      [v20 didMoveToParentViewController:self];
    }
  }
  else
  {
    long long v37 = [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController view];
    if ([v37 isDescendantOfView:v3])
    {
      id v8 = 0;
    }
    else
    {
      [(HLPHelpViewController *)self addChildViewController:self->_tableOfContentViewController];
      long long v38 = [(HLPHelpViewController *)self view];
      [v38 addSubview:v37];

      id v8 = v37;
      [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
      long long v39 = [v8 leadingAnchor];
      long long v40 = [v3 leadingAnchor];
      v41 = [v39 constraintEqualToAnchor:v40];
      [v41 setActive:1];

      uint64_t v42 = [v8 widthAnchor];
      v43 = [v42 constraintEqualToConstant:320.0];
      [v43 setActive:1];

      v44 = [v8 topAnchor];
      v45 = [v3 topAnchor];
      v46 = [v44 constraintEqualToAnchor:v45];
      [v46 setActive:1];

      v47 = [v8 bottomAnchor];
      v48 = [v3 bottomAnchor];
      v49 = [v47 constraintEqualToAnchor:v48];
      [v49 setActive:1];

      [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController didMoveToParentViewController:self];
    }
    if (![(UIView *)self->_fullBookViewSeparator isDescendantOfView:v3])
    {
      id v50 = objc_alloc(MEMORY[0x263F1CB60]);
      v51 = (UIView *)objc_msgSend(v50, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      fullBookViewSeparator = self->_fullBookViewSeparator;
      self->_fullBookViewSeparator = v51;

      v53 = [(HLPHelpViewController *)self view];
      [v53 addSubview:self->_fullBookViewSeparator];

      [(UIView *)self->_fullBookViewSeparator setHidden:1];
      v54 = [MEMORY[0x263F1C550] systemGrayColor];
      [(UIView *)self->_fullBookViewSeparator setBackgroundColor:v54];

      [(UIView *)self->_fullBookViewSeparator setTranslatesAutoresizingMaskIntoConstraints:0];
      v55 = [(UIView *)self->_fullBookViewSeparator leadingAnchor];
      v56 = [v8 trailingAnchor];
      v57 = [v55 constraintEqualToAnchor:v56];
      [v57 setActive:1];

      v58 = [(UIView *)self->_fullBookViewSeparator topAnchor];
      v59 = [v3 topAnchor];
      v60 = [v58 constraintEqualToAnchor:v59];
      [v60 setActive:1];

      v61 = [(UIView *)self->_fullBookViewSeparator bottomAnchor];
      v62 = [v3 bottomAnchor];
      v63 = [v61 constraintEqualToAnchor:v62];
      [v63 setActive:1];

      v64 = [(UIView *)self->_fullBookViewSeparator widthAnchor];
      v65 = [MEMORY[0x263F1C920] mainScreen];
      [v65 scale];
      v67 = [v64 constraintEqualToConstant:1.0 / v66];
      [v67 setActive:1];

      v68 = self->_fullBookViewSeparator;
      id v8 = v68;
    }

    if (([v82 isDescendantOfView:v3] & 1) == 0)
    {
      [(HLPHelpViewController *)self addChildViewController:self->_topicViewController];
      v69 = [(HLPHelpViewController *)self view];
      [v69 addSubview:v82];

      [v82 setTranslatesAutoresizingMaskIntoConstraints:0];
      v70 = [v82 leadingAnchor];
      v71 = [v8 trailingAnchor];
      v72 = [v70 constraintEqualToAnchor:v71];
      [v72 setActive:1];

      v73 = [v82 trailingAnchor];
      v74 = [v3 trailingAnchor];
      v75 = [v73 constraintEqualToAnchor:v74];
      [v75 setActive:1];

      v76 = [v82 topAnchor];
      v77 = [v3 topAnchor];
      v78 = [v76 constraintEqualToAnchor:v77];
      [v78 setActive:1];

      v79 = [v82 bottomAnchor];
      v80 = [v3 bottomAnchor];
      v81 = [v79 constraintEqualToAnchor:v80];
      [v81 setActive:1];

      [(HLPHelpTopicViewController *)self->_topicViewController didMoveToParentViewController:self];
    }
  }
}

- (void)updateChildViewConstraints
{
  if (!self->_fullBookView && !self->_displayHelpTopicsOnly)
  {
    id v25 = [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController view];
    if (v25)
    {
      char v3 = [(HLPHelpViewController *)self view];
      char v4 = [v25 isDescendantOfView:v3];

      if ((v4 & 1) == 0)
      {
        [(HLPHelpViewController *)self addChildViewController:self->_tableOfContentViewController];
        uint64_t v5 = [(HLPHelpViewController *)self view];
        [v5 addSubview:v25];

        uint64_t v6 = [v25 leadingAnchor];
        uint64_t v7 = [(HLPHelpViewController *)self view];
        id v8 = [v7 leadingAnchor];
        uint64_t v9 = [v6 constraintEqualToAnchor:v8];
        [v9 setActive:1];

        id v10 = [v25 trailingAnchor];
        id v11 = [(HLPHelpViewController *)self view];
        id v12 = [v11 trailingAnchor];
        objc_super v13 = [v10 constraintEqualToAnchor:v12];
        [v13 setActive:1];

        uint64_t v14 = [v25 topAnchor];
        uint64_t v15 = [(HLPHelpViewController *)self view];
        v16 = [v15 topAnchor];
        v17 = [v14 constraintEqualToAnchor:v16];
        [v17 setActive:1];

        id v18 = [v25 bottomAnchor];
        uint64_t v19 = [(HLPHelpViewController *)self view];
        id v20 = [v19 bottomAnchor];
        v21 = [v18 constraintEqualToAnchor:v20];
        [v21 setActive:1];

        [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController didMoveToParentViewController:self];
        long long v22 = [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController searchController];
        long long v23 = [(HLPHelpViewController *)self navigationItem];
        [v23 setSearchController:v22];

        long long v24 = [(HLPHelpViewController *)self navigationItem];
        [v24 setHidesSearchBarWhenScrolling:0];
      }
    }
  }
}

- (void)updateTOCButton
{
  if (!self->_fullBookView)
  {
    id v8 = [(HLPHelpViewController *)self navigationItem];
    char v3 = [v8 leftBarButtonItem];
    if (!v3 && self->_showTopicViewOnLoad)
    {
      BOOL displayHelpTopicsOnly = self->_displayHelpTopicsOnly;

      if (displayHelpTopicsOnly) {
        return;
      }
      id v8 = [MEMORY[0x263F1C6B0] systemImageNamed:@"list.bullet"];
      char v3 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithImage:v8 style:0 target:self action:sel_showTopicView];
      [v3 setSelected:1];
      uint64_t v5 = [MEMORY[0x263F086E0] HLPBundle];
      uint64_t v6 = [v5 localizedStringForKey:@"Hide Table of Contents" value:&stru_26D29FC58 table:0];
      [v3 setAccessibilityLabel:v6];

      uint64_t v7 = [(HLPHelpViewController *)self navigationItem];
      [v7 setLeftBarButtonItem:v3];
    }
  }
}

- (void)updateDoneButton
{
  if (!self->_fullBookView)
  {
    if (self->_hideDoneButton)
    {
      char v3 = [(HLPHelpViewController *)self navigationItem];
      char v4 = [v3 rightBarButtonItem];
      doneBarButtonItem = self->_doneBarButtonItem;

      if (v4 == doneBarButtonItem)
      {
        uint64_t v6 = [(HLPHelpViewController *)self navigationItem];
        [v6 setRightBarButtonItem:0];
      }
      uint64_t v7 = self->_doneBarButtonItem;
      self->_doneBarButtonItem = 0;
    }
    else
    {
      id v8 = self->_doneBarButtonItem;
      if (!v8)
      {
        uint64_t v9 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel_dismiss];
        id v10 = self->_doneBarButtonItem;
        self->_doneBarButtonItem = v9;

        id v8 = self->_doneBarButtonItem;
      }
      id v11 = [(HLPHelpViewController *)self navigationItem];
      [(UIBarButtonItem *)v11 setRightBarButtonItem:v8];
      uint64_t v7 = v11;
    }
  }
}

- (void)showTopicView
{
  id v6 = [(NSString *)self->_selectedHelpTopicID componentsSeparatedByString:@"#"];
  char v3 = [v6 firstObject];
  if ([v6 count] == 2)
  {
    char v4 = [v6 lastObject];
  }
  else
  {
    char v4 = 0;
  }
  uint64_t v5 = [(HLPHelpBookController *)self->_helpBookController helpTopicItemForID:v3];
  [(HLPHelpViewController *)self _showHelpTopicItem:v5 anchor:v4 allowErrorMessage:1 animate:1];
}

- (void)setupTableContentViewController
{
  if (!self->_tableOfContentViewController && !self->_displayHelpTopicsOnly)
  {
    char v3 = [[HLPHelpTableOfContentViewController alloc] initWithStyle:0];
    tableOfContentViewController = self->_tableOfContentViewController;
    self->_tableOfContentViewController = v3;

    [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController setDelegate:self];
    [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController setFullBookView:self->_fullBookView];
    [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController setShowTopicViewOnLoad:self->_showTopicViewOnLoad];
    id v5 = [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController view];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
}

- (void)setupTopicViewController
{
  if (!self->_topicViewController)
  {
    char v3 = objc_alloc_init(HLPHelpTopicViewController);
    topicViewController = self->_topicViewController;
    self->_topicViewController = v3;

    [(HLPHelpTopicViewController *)self->_topicViewController setDelegate:self];
    [(HLPHelpTopicViewController *)self->_topicViewController setDisplayHelpTopicsOnly:self->_displayHelpTopicsOnly];
    [(HLPHelpTopicViewController *)self->_topicViewController setShowTopicNameAsTitle:self->_showTopicNameAsTitle];
    [(HLPHelpTopicViewController *)self->_topicViewController setFullBookView:self->_fullBookView];
    [(HLPHelpTopicViewController *)self->_topicViewController setHideDoneButton:self->_hideDoneButton];
    [(HLPHelpTopicViewController *)self->_topicViewController setSingleTopic:self->_displayHelpTopicsOnly];
    [(HLPHelpViewController *)self updateDarkMode];
  }
}

- (void)loadBookWithTitle:(id)a3 identifier:(id)a4 topicID:(id)a5 version:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(HLPHelpViewController *)self identifier];
  int v15 = [v14 isEqualToString:v11];

  if (v15)
  {
    [(HLPHelpViewController *)self loadHelpTopicID:v12];
  }
  else
  {
    [(HLPHelpViewController *)self cleanup];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__HLPHelpViewController_loadBookWithTitle_identifier_topicID_version___block_invoke;
    block[3] = &unk_264578D50;
    block[4] = self;
    id v17 = v10;
    id v18 = v11;
    id v19 = v13;
    id v20 = v12;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __70__HLPHelpViewController_loadBookWithTitle_identifier_topicID_version___block_invoke(uint64_t a1)
{
  [(id)objc_opt_class() updateViewController:*(void *)(a1 + 32) title:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48) version:*(void *)(a1 + 56) subpath:0];
  [*(id *)(a1 + 32) setup];
  [*(id *)(a1 + 32) updateHelpBookController];
  uint64_t v2 = *(void *)(a1 + 64);
  char v3 = *(void **)(a1 + 32);
  return [v3 setSelectedHelpTopicID:v2];
}

- (void)loadHelpTopicItem:(id)a3
{
  id v4 = +[HLPLoadInfo infoWithTopicItem:a3 accesstype:5 searchTerms:0 anchor:0];
  [v4 setAnalyticsLogged:1];
  [(HLPHelpViewController *)self _showWithLoadInfo:v4 animate:1];
}

- (void)loadHelpTopicID:(id)a3
{
  id v10 = a3;
  if ([(HLPRemoteDataController *)self->_helpBookController hasLoaded] && self->_topicViewController)
  {
    selectedHelpTopicID = [v10 componentsSeparatedByString:@"#"];
    id v5 = [selectedHelpTopicID firstObject];
    if ([selectedHelpTopicID count] == 2)
    {
      id v6 = [selectedHelpTopicID lastObject];
    }
    else
    {
      id v6 = 0;
    }
    id v8 = [(HLPHelpBookController *)self->_helpBookController helpTopicItemForID:v5];
    if (v8)
    {
      if (self->_fullBookView || self->_showingHelpTopic)
      {
        [(HLPHelpTopicViewController *)self->_topicViewController loadHelpTopicItem:v8 searchTerms:0 anchor:v6];
        [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController scrollToHelpItem:v8 deselectImmediately:0 reload:1 animated:1];
      }
      else
      {
        [(HLPHelpViewController *)self loadHelpTopicItem:v8];
      }
    }
  }
  else
  {
    uint64_t v7 = (NSString *)v10;
    selectedHelpTopicID = self->_selectedHelpTopicID;
    self->_selectedHelpTopicID = v7;
  }

  uint64_t v9 = [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController searchController];
  [v9 setActive:0];
}

- (void)displayHelpBookWithLocale:(id)a3
{
  tableOfContentViewController = self->_tableOfContentViewController;
  id v5 = a3;
  [(HLPHelpTableOfContentViewController *)tableOfContentViewController setLocale:v5];
  [(HLPHelpTopicViewController *)self->_topicViewController setLocale:v5];

  id v6 = [(HLPHelpViewController *)self loadingView];
  [v6 showActivityIndicator:0];

  uint64_t v7 = [(NSString *)self->_selectedHelpTopicID componentsSeparatedByString:@"#"];
  id v8 = [v7 firstObject];
  if ([v7 count] == 2)
  {
    uint64_t v9 = [v7 lastObject];
  }
  else
  {
    uint64_t v9 = 0;
  }
  if ([(NSString *)self->_selectedHelpTopicName length])
  {
    id v10 = [(NSString *)self->_selectedHelpTopicName componentsSeparatedByString:@"#"];
    helpBookController = self->_helpBookController;
    id v12 = [v10 firstObject];
    id v13 = [(HLPHelpBookController *)helpBookController helpTopicItemForName:v12];

    if ([v10 count] == 2)
    {
      uint64_t v14 = [v10 lastObject];
    }
    else
    {
      uint64_t v14 = 0;
    }

    uint64_t v9 = (void *)v14;
  }
  else
  {
    if (![(__CFString *)v8 length])
    {
      int v15 = [MEMORY[0x263EFFA40] standardUserDefaults];
      v16 = v15;
      if (self->_prefersLandingViewOnLoad)
      {
        [v15 removeObjectForKey:kHLPHelpTopicViewControllerLastTopicHistoryItem];
      }
      else
      {
        id v17 = [v15 objectForKey:kHLPHelpTopicViewControllerLastTopicHistoryItem];
        if (v17)
        {
          id v18 = (void *)MEMORY[0x263EFFA08];
          uint64_t v19 = objc_opt_class();
          long long v38 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
          id v39 = 0;
          id v20 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v38 fromData:v17 error:&v39];
          id v36 = v39;
          uint64_t v21 = [v20 identifier];
          long long v22 = (void *)v21;
          long long v23 = &stru_26D29FC58;
          if (v21) {
            long long v23 = (__CFString *)v21;
          }
          long long v37 = v23;

          id v8 = v37;
        }
        else
        {

          id v8 = &stru_26D29FC58;
        }
      }
    }
    id v13 = [(HLPHelpBookController *)self->_helpBookController helpTopicItemForID:v8];
  }
  if (v13) {
    BOOL v24 = 1;
  }
  else {
    BOOL v24 = v8 == 0;
  }
  if (!v24)
  {
    id v25 = self->_helpBookController;
    uint64_t v26 = [(HLPHelpBookController *)v25 welcomeTopicIdentifier];
    id v13 = [(HLPHelpBookController *)v25 helpTopicItemForID:v26];
  }
  if (self->_fullBookView)
  {
    [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController updateWithHelpBookController:self->_helpBookController];
    if (v13)
    {
      [(HLPHelpViewController *)self _showHelpTopicItem:v13 anchor:v9 allowErrorMessage:1 animate:1];
      v27 = self->_tableOfContentViewController;
      uint64_t v28 = v13;
      uint64_t v29 = 0;
      uint64_t v30 = 1;
LABEL_28:
      [(HLPHelpTableOfContentViewController *)v27 scrollToHelpItem:v28 deselectImmediately:v29 reload:0 animated:v30];
    }
  }
  else
  {
    if (self->_showTopicViewOnLoad && v13)
    {
      v31 = +[HLPLoadInfo infoWithTopicItem:v13 accesstype:6 searchTerms:0 anchor:v9];
      [(HLPHelpViewController *)self _showWithLoadInfo:v31 animate:1];

      goto LABEL_35;
    }
    [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController updateWithHelpBookController:self->_helpBookController];
    if (v13 && self->_showTopicViewOnLoad)
    {
      v32 = [v13 identifier];
      selectedHelpTopicID = self->_selectedHelpTopicID;
      self->_selectedHelpTopicID = v32;

      char v34 = [v13 name];
      selectedHelpTopicName = self->_selectedHelpTopicName;
      self->_selectedHelpTopicName = v34;

      v27 = self->_tableOfContentViewController;
      uint64_t v28 = v13;
      uint64_t v29 = 1;
      uint64_t v30 = 0;
      goto LABEL_28;
    }
  }
LABEL_35:
}

- (void)updateLastLoadVersion
{
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v3 setObject:self->_version forKey:@"HLPHelpBookLastLoadVersion"];
  [v3 synchronize];
}

- (void)loadHelpBook
{
  id v3 = HLPLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_220BD8000, v3, OS_LOG_TYPE_DEFAULT, "loadHelpBook", buf, 2u);
  }

  if (!self->_helpBookURL || !self->_helpBookController)
  {
    id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v5 = [MEMORY[0x263EFF960] preferredLanguages];
    id v6 = [v5 firstObject];

    uint64_t v7 = [v4 objectForKey:@"HLPHelpBookLastLoadedLocale"];
    if (+[HLPCommonDefines isInternalBuild]
      && PingPongClientLibraryCore_0())
    {
      uint64_t v102 = 0;
      v103 = &v102;
      uint64_t v104 = 0x2050000000;
      id v8 = (void *)getPPCRedirectClass_softClass;
      uint64_t v105 = getPPCRedirectClass_softClass;
      if (!getPPCRedirectClass_softClass)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        uint64_t v98 = 3221225472;
        v99 = __getPPCRedirectClass_block_invoke;
        v100 = &unk_264578BE0;
        v101 = &v102;
        __getPPCRedirectClass_block_invoke((uint64_t)buf);
        id v8 = (void *)v103[3];
      }
      id v9 = v8;
      _Block_object_dispose(&v102, 8);
      id v10 = [v9 sharedInstance];
      uint64_t v11 = [v10 hostMappings];
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v12 = [v4 objectForKey:@"HLPHelpBookHostMappings"];
    if (v7 && ![v6 isEqualToString:v7]
      || v11 | v12 && ([(id)v11 isEqual:v12] & 1) == 0)
    {
      id v13 = HLPLogForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220BD8000, v13, OS_LOG_TYPE_DEFAULT, "Clearing all cache...", buf, 2u);
      }

      +[HLPHelpViewController clearCacheControllers];
    }
    v83 = (void *)v12;
    v81 = (void *)v11;
    [v4 setObject:v11 forKey:@"HLPHelpBookHostMappings"];
    [v4 setObject:v6 forKey:@"HLPHelpBookLastLoadedLocale"];
    [v4 synchronize];
    uint64_t v14 = [(HLPHelpViewController *)self loadingView];
    [v14 showActivityIndicator:1];

    int v15 = [MEMORY[0x263F086E0] mainBundle];
    v16 = [v15 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

    id v17 = self->_version;
    id v82 = v16;
    if (![(NSString *)v17 length])
    {
      id v18 = v16;

      id v17 = v18;
    }
    uint64_t v19 = self->_localHelpBookFileURL;
    if (v19)
    {
      id v20 = v19;
      [(HLPHelpViewController *)self loadFromStaticServer];
      long long v22 = v16;
      uint64_t v21 = v83;
LABEL_69:

      return;
    }
    BOOL v23 = +[HLPCommonDefines isInternalBuild];
    if (v23)
    {
      BOOL v24 = [v4 stringForKey:@"HLPHelpBookBaseURLOverride"];
      if (![v24 length])
      {
        id v25 = [v4 stringForKey:@"HLPDynamicHelpBookHostOverride"];
        if (v25) {
          goto LABEL_29;
        }
        goto LABEL_28;
      }
    }
    else
    {
      BOOL v24 = 0;
      if (![0 length])
      {
LABEL_28:
        id v25 = @"https://cds.apple.com/";
LABEL_29:
        v73 = v7;
        v74 = v6;
        v78 = v25;
        objc_storeStrong((id *)&self->_helpBookBasePath, v25);
        uint64_t v26 = [MEMORY[0x263EFF9B0] orderedSet];
        v27 = (void *)MEMORY[0x263EFF980];
        uint64_t v28 = [MEMORY[0x263EFF960] preferredLanguages];
        uint64_t v29 = [v27 arrayWithArray:v28];

        if (v23)
        {
          uint64_t v30 = [v4 objectForKey:@"HLPHelpBookPreferredLanguageOverride"];
        }
        else
        {
          uint64_t v30 = 0;
        }
        v71 = v24;
        if ([v30 length]) {
          [v29 insertObject:v30 atIndex:0];
        }
        v72 = v30;
        v31 = [MEMORY[0x263EFF960] systemLanguages];
        v32 = [(HLPHelpViewController *)self additionalSupportedLanguages];
        uint64_t v33 = [v32 count];

        if (v33)
        {
          char v34 = [(HLPHelpViewController *)self additionalSupportedLanguages];
          uint64_t v35 = [v31 arrayByAddingObjectsFromArray:v34];

          v31 = (void *)v35;
        }
        v80 = v31;
        do
        {
          if ((unint64_t)[v26 count] > 2) {
            break;
          }
          if (![v29 count]) {
            break;
          }
          id v36 = [MEMORY[0x263F086E0] preferredLocalizationsFromArray:v31 forPreferences:v29];
          [v26 addObjectsFromArray:v36];

          v31 = v80;
          [v29 removeObjectAtIndex:0];
        }
        while (![v26 containsObject:@"en"]);
        if ([v26 count])
        {
          if ((unint64_t)[v26 count] >= 4) {
            objc_msgSend(v26, "removeObjectsInRange:", 3, objc_msgSend(v26, "count") - 3);
          }
        }
        else
        {
          [v26 addObject:@"en"];
        }
        long long v37 = [(id)objc_opt_class() platformVersion];
        long long v38 = [(id)objc_opt_class() platform];
        id v39 = self->_identifier;
        v79 = v39;
        if ([(NSString *)v39 containsString:@"watch"])
        {

          long long v38 = @"watchos";
          v76 = v17;
        }
        else
        {
          v76 = v37;
          if ([(NSString *)v39 hasPrefix:@"iphone"]
            || [(NSString *)v39 hasPrefix:@"ipad"])
          {
            goto LABEL_52;
          }
          if ([(NSString *)self->_subpath length])
          {
            uint64_t v40 = [(NSString *)v39 stringByAppendingFormat:@"-%@", self->_subpath];

            v79 = (void *)v40;
          }
          if ([(HLPHelpViewController *)self platformIndependent])
          {
LABEL_52:
            v75 = v38;
            goto LABEL_53;
          }
          long long v37 = [(id)objc_opt_class() deviceFamily];
          uint64_t v61 = [v79 stringByAppendingFormat:@"-%@", v37];

          v79 = (void *)v61;
        }
        v75 = v38;

LABEL_53:
        location = (id *)&self->_helpBookURL;
        v41 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
        if (![(HLPHelpViewController *)self platformIndependent])
        {
          uint64_t v42 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"platform" value:v75];
          [v41 addObject:v42];
          v43 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"pOSv" value:v76];
          [v41 addObject:v43];
        }
        uint64_t v44 = [objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"product" value:v79];
        obj = v17;
        uint64_t v45 = [objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"productVersion" value:v17];
        id v46 = objc_alloc(MEMORY[0x263F08BD0]);
        v47 = [v26 array];
        v48 = [v47 componentsJoinedByString:@","];
        uint64_t v49 = [v46 initWithName:@"locale" value:v48];

        v70 = (void *)v44;
        [v41 addObject:v44];
        v69 = (void *)v45;
        [v41 addObject:v45];
        id v50 = [MEMORY[0x263F08BA0] componentsWithString:v78];
        [v50 setPath:@"/content/services/book"];
        v77 = v41;
        v68 = (void *)v49;
        v51 = [v41 arrayByAddingObject:v49];
        [v50 setQueryItems:v51];

        id v20 = [v50 URL];
        if (v20)
        {
          double v66 = v50;
          id v17 = obj;
          objc_storeStrong((id *)&self->_helpBookVersion, obj);
          objc_storeStrong(location, v20);
          v52 = [(HLPRemoteDataController *)[HLPHelpBookController alloc] initWithURL:*location];
          helpBookController = self->_helpBookController;
          self->_helpBookController = v52;

          [(HLPHelpBookController *)self->_helpBookController setHelpBookURL:*location];
          [(HLPHelpBookController *)self->_helpBookController setAdditionalSupportedLanguages:self->_additionalSupportedLanguages];
          [(HLPHelpBookController *)self->_helpBookController setServerType:1];
          v54 = [v4 objectForKey:@"HLPDynamicHelpBookLastLoadedIdentifier"];
          v55 = [v4 objectForKey:@"HLPDynamicHelpBookLastLoadedVersion"];
          int v56 = [(NSString *)obj isEqualToString:v54];
          char v57 = [(NSString *)obj isEqualToString:v55];
          char v62 = v57 ^ 1;
          if (v54) {
            int v58 = v56;
          }
          else {
            int v58 = 1;
          }
          if (v55) {
            char v59 = v57;
          }
          else {
            char v59 = 1;
          }
          if (v58 != 1 || (v59 & 1) == 0) {
            +[HLPHelpViewController clearCacheControllers];
          }
          objc_initWeak((id *)buf, self);
          v63 = self->_helpBookController;
          v84[0] = MEMORY[0x263EF8330];
          v84[1] = 3221225472;
          v84[2] = __37__HLPHelpViewController_loadHelpBook__block_invoke;
          v84[3] = &unk_264578D78;
          objc_copyWeak(&v94, (id *)buf);
          locationa = v55;
          v85 = locationa;
          id v86 = v4;
          char v95 = v56 ^ 1;
          char v96 = v62;
          id v87 = v79;
          v88 = obj;
          v89 = self;
          id v90 = v77;
          id v91 = v26;
          id v92 = v66;
          long long v22 = v82;
          id v93 = v82;
          [(HLPHelpBookController *)v63 fetchDataWithDataType:1 identifier:@"book.json" completionHandler:v84];

          objc_destroyWeak(&v94);
          uint64_t v21 = v83;
          objc_destroyWeak((id *)buf);

          v60 = v79;
          v41 = v77;
          id v50 = v66;
        }
        else
        {
          [(HLPHelpViewController *)self loadFromStaticServer];
          long long v22 = v82;
          uint64_t v21 = v83;
          v60 = v79;
          id v17 = obj;
        }

        uint64_t v7 = v73;
        id v6 = v74;
        BOOL v24 = v71;
        goto LABEL_68;
      }
    }
    [(HLPHelpViewController *)self loadFromStaticServer];
    id v20 = 0;
    long long v22 = v82;
    uint64_t v21 = v83;
LABEL_68:

    goto LABEL_69;
  }
}

void __37__HLPHelpViewController_loadHelpBook__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  [WeakRetained updateLastLoadVersion];
  id v10 = [v8 URL];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x263F08BA0];
    uint64_t v12 = [v8 URL];
    id v13 = [v11 componentsWithURL:v12 resolvingAgainstBaseURL:1];

    id v14 = objc_alloc_init(MEMORY[0x263F08BA0]);
    int v15 = [v13 scheme];
    [v14 setScheme:v15];

    v16 = [v13 host];
    [v14 setHost:v16];

    id v17 = [v14 URL];
    id v18 = [v17 absoluteString];
    [WeakRetained setHelpBookBasePath:v18];
  }
  if (v7 || !a2)
  {
    long long v38 = HLPLogForCategory(0);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220BD8000, v38, OS_LOG_TYPE_DEFAULT, "CDS load failed", buf, 2u);
    }

    if ([v7 code] == 645 || objc_msgSend(v7, "code") == 615)
    {
      id v39 = HLPLogForCategory(0);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v50 = 0;
        _os_log_impl(&dword_220BD8000, v39, OS_LOG_TYPE_DEFAULT, "CDS book invalid", v50, 2u);
      }

      [*(id *)(a1 + 40) setObject:*(void *)(a1 + 96) forKey:@"HLPHelpBookDynamicServerLastFailureLoadVersion"];
      [*(id *)(a1 + 40) synchronize];
    }
    [WeakRetained loadFromStaticServer];
  }
  else
  {
    if (!*(void *)(a1 + 32)) {
      [*(id *)(a1 + 40) removeObjectForKey:kHLPHelpTopicViewControllerLastTopicHistoryItem];
    }
    [WeakRetained removeDDMLoadFailVersion];
    if (*(unsigned char *)(a1 + 112) || *(unsigned char *)(a1 + 113))
    {
      [*(id *)(a1 + 40) setObject:*(void *)(a1 + 48) forKey:@"HLPDynamicHelpBookLastLoadedIdentifier"];
      [*(id *)(a1 + 40) setObject:*(void *)(a1 + 56) forKey:@"HLPDynamicHelpBookLastLoadedVersion"];
      [*(id *)(a1 + 40) synchronize];
    }
    uint64_t v19 = objc_msgSend(WeakRetained, "loadingView", v8, 0);
    [v19 showActivityIndicator:0];

    if (WeakRetained)
    {
      if (WeakRetained[977])
      {
        id v20 = [WeakRetained tableOfContentViewController];
        uint64_t v21 = [v20 view];
        [v21 setHidden:0];

        long long v22 = [WeakRetained topicViewController];
        BOOL v23 = [v22 view];
        [v23 setHidden:0];

        BOOL v24 = [WeakRetained fullBookViewSeparator];
        [v24 setHidden:0];

        if (+[HLPCommonDefines isVisionOS])
        {
          id v25 = [*(id *)(a1 + 64) title];
          uint64_t v26 = [WeakRetained tableOfContentViewController];
          [v26 setTitle:v25];
        }
      }
    }
    v27 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"topicid" value:@"%@"];
    [*(id *)(a1 + 72) addObject:v27];
    id v28 = objc_alloc(MEMORY[0x263F08BD0]);
    uint64_t v29 = [WeakRetained helpBookController];
    uint64_t v30 = [v29 bookId];
    v31 = (void *)[v28 initWithName:@"bookid" value:v30];

    [*(id *)(a1 + 72) addObject:v31];
    v32 = [WeakRetained helpBookController];
    uint64_t v33 = [v32 locale];
    char v34 = [v33 isoCodes];
    uint64_t v35 = [v34 firstObject];
    id v36 = v35;
    if (v35)
    {
      id v37 = v35;
    }
    else
    {
      id v37 = [*(id *)(a1 + 80) firstObject];
    }
    uint64_t v40 = v37;

    v41 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"locale" value:v40];
    [WeakRetained updateCacheControllerToLanguageCode:v40];
    uint64_t v42 = [*(id *)(a1 + 72) arrayByAddingObject:v41];
    [*(id *)(a1 + 88) setQueryItems:v42];

    [*(id *)(a1 + 88) setPath:@"/content/services/lookup"];
    v43 = [*(id *)(a1 + 88) URL];
    uint64_t v44 = [v43 absoluteString];
    uint64_t v45 = [WeakRetained helpBookController];
    [v45 setTopicPathFormat:v44];

    id v46 = [WeakRetained helpBookController];
    v47 = [v46 locale];
    [WeakRetained displayHelpBookWithLocale:v47];

    id v8 = v48;
    id v7 = v49;
  }
}

- (void)loadFromStaticServer
{
  id v3 = HLPLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_220BD8000, v3, OS_LOG_TYPE_DEFAULT, "load from help.apple.com", (uint8_t *)buf, 2u);
  }

  p_helpBookVersion = &self->_helpBookVersion;
  helpBookVersion = self->_helpBookVersion;
  self->_helpBookVersion = 0;

  helpBookURL = self->_helpBookURL;
  self->_helpBookURL = 0;

  helpBookController = self->_helpBookController;
  self->_helpBookController = 0;

  id v8 = [(HLPHelpViewController *)self loadingView];
  [v8 showActivityIndicator:1];

  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v10 = self->_localHelpBookFileURL;
  if (!v10)
  {
    if (+[HLPCommonDefines isInternalBuild])
    {
      uint64_t v11 = [v9 stringForKey:@"HLPHelpBookBaseURLOverride"];
      if (![v11 length])
      {
        uint64_t v12 = [v9 stringForKey:@"HLPHelpBookHostOverride"];
        if (v12)
        {
LABEL_11:
          objc_storeStrong((id *)&self->_helpBookBasePath, v12);
          id v13 = [NSURL URLWithString:v12];
          id v14 = [(id)objc_opt_class() deviceFamily];
          objc_storeStrong((id *)&self->_helpBookVersion, self->_version);
          int v15 = [NSString stringWithFormat:@"%@/%@/%@", self->_identifier, v14, self->_version];
          if ([(NSString *)self->_subpath length])
          {
            uint64_t v16 = [v15 stringByAppendingPathComponent:self->_subpath];

            int v15 = (void *)v16;
          }
          id v17 = [v13 URLByAppendingPathComponent:v15];

          id v10 = [v17 URLByAppendingPathComponent:@"cardinal/"];

          goto LABEL_14;
        }
LABEL_10:
        uint64_t v12 = @"https://help.apple.com";
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v11 = 0;
      if (![0 length]) {
        goto LABEL_10;
      }
    }
    id v10 = [NSURL URLWithString:v11];
LABEL_14:
  }
  id v18 = [v9 stringForKey:@"HLPHelpBookLastIdentifier"];
  uint64_t v19 = [v9 stringForKey:@"HLPHelpBookLastLoadedVersion"];
  id v20 = [v9 stringForKey:@"HLPHelpBookLastLoadedSubpath"];
  if (![(NSString *)self->_identifier isEqualToString:v18]
    || ![(NSString *)*p_helpBookVersion isEqualToString:v19]
    || (subpath = self->_subpath) != 0 && ![(NSString *)subpath isEqualToString:v20])
  {
    +[HLPHelpViewController clearCacheControllers];
    [v9 setObject:self->_identifier forKey:@"HLPHelpBookLastIdentifier"];
    [v9 setObject:*p_helpBookVersion forKey:@"HLPHelpBookLastLoadedVersion"];
    [v9 setObject:self->_subpath forKey:@"HLPHelpBookLastLoadedSubpath"];
    if (![(NSString *)self->_selectedHelpTopicName length]
      && ![(NSString *)self->_selectedHelpTopicID length])
    {
      [v9 removeObjectForKey:kHLPHelpTopicViewControllerLastTopicHistoryItem];
    }
    [v9 synchronize];
  }
  long long v22 = [[HLPHelpLocaleController alloc] initWithURL:v10];
  localeListController = self->_localeListController;
  self->_localeListController = v22;

  BOOL v24 = [(HLPHelpViewController *)self preferredLanguagesOverride];
  [(HLPHelpLocaleController *)self->_localeListController setPreferredLanguagesOverride:v24];

  objc_initWeak(buf, self);
  id v25 = self->_localeListController;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __45__HLPHelpViewController_loadFromStaticServer__block_invoke;
  v27[3] = &unk_264578DC8;
  objc_copyWeak(&v29, buf);
  uint64_t v26 = v10;
  id v28 = v26;
  [(HLPRemoteDataController *)v25 fetchDataWithDataType:1 identifier:@"locale-list.json" completionHandler:v27];

  objc_destroyWeak(&v29);
  objc_destroyWeak(buf);
}

void __45__HLPHelpViewController_loadFromStaticServer__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (!v5
    && a2
    && ([WeakRetained localeListController],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 locales],
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        v8,
        v10))
  {
    uint64_t v11 = [v7 localeListController];
    uint64_t v12 = [v11 currentLocale];

    id v13 = [v12 path];
    uint64_t v14 = [v13 length];

    if (v14)
    {
      int v15 = [v12 isoCodes];
      uint64_t v16 = [v15 firstObject];
      [v7 updateCacheControllerToLanguageCode:v16];

      id v17 = *(void **)(a1 + 32);
      id v18 = [v12 path];
      uint64_t v19 = [v17 URLByAppendingPathComponent:v18];
      [v7 setHelpBookURL:v19];

      id v20 = [HLPHelpBookController alloc];
      uint64_t v21 = [v7 helpBookURL];
      long long v22 = [v21 URLByAppendingPathComponent:@"navigation.json"];
      BOOL v23 = [(HLPRemoteDataController *)v20 initWithURL:v22];
      [v7 setHelpBookController:v23];

      BOOL v24 = [v7 helpBookController];
      [v24 setServerType:0];

      id v25 = [v7 helpBookURL];
      uint64_t v26 = [v7 helpBookController];
      [v26 setHelpBookURL:v25];

      v27 = [v7 helpBookController];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __45__HLPHelpViewController_loadFromStaticServer__block_invoke_2;
      v28[3] = &unk_264578DA0;
      v28[4] = v7;
      id v29 = v12;
      [v27 fetchDataWithDataType:1 identifier:@"navigation.json" completionHandler:v28];
    }
  }
  else
  {
    [v7 showMessageForError:v5];
    [v7 removeDDMLoadFailVersion];
    [v7 updateLastLoadVersion];
  }
}

uint64_t __45__HLPHelpViewController_loadFromStaticServer__block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  if (!a3 && a2)
  {
    id v5 = [v4 version];
    if (!v5)
    {
      id v6 = [*(id *)(a1 + 32) localHelpBookFileURL];

      if (!v6)
      {
LABEL_8:
        uint64_t v11 = *(void **)(a1 + 32);
        uint64_t v12 = *(void *)(a1 + 40);
        return [v11 displayHelpBookWithLocale:v12];
      }
      id v7 = [*(id *)(a1 + 32) helpBookController];
      id v8 = [v7 contentVersion];
      [*(id *)(a1 + 32) setVersion:v8];

      id v5 = [*(id *)(a1 + 32) localHelpBookAnalyticIdentifier];
      if (v5)
      {
        id v9 = +[HLPAnalyticsEventController sharedInstance];
        uint64_t v10 = [*(id *)(a1 + 32) version];
        [v9 configureWithHelpBookID:v5 version:v10];
      }
    }

    goto LABEL_8;
  }
  objc_msgSend(v4, "showMessageForError:");
  [*(id *)(a1 + 32) removeDDMLoadFailVersion];
  uint64_t v14 = *(void **)(a1 + 32);
  return [v14 updateLastLoadVersion];
}

- (void)updateDarkMode
{
  if (!self->_supportsDarkMode)
  {
    localHelpBookFileURL = self->_localHelpBookFileURL;
    if (localHelpBookFileURL)
    {
      id v5 = [(NSURL *)localHelpBookFileURL absoluteString];
      self->_uint64_t supportsDarkMode = [v5 rangeOfString:@"FunctionHelp.bundle" options:4] != 0x7FFFFFFFFFFFFFFFLL;

      if (self->_supportsDarkMode) {
        goto LABEL_16;
      }
    }
    else
    {
      self->_uint64_t supportsDarkMode = 0;
    }
    id v6 = [(HLPHelpViewController *)self identifier];
    int v7 = [v6 containsString:@"watch"];
    char v8 = v7;
    if (v7)
    {
      uint64_t v2 = [(HLPHelpViewController *)self version];
      [v2 floatValue];
      if (v9 >= 7.0) {
        goto LABEL_10;
      }
    }
    uint64_t v10 = [(HLPHelpViewController *)self identifier];
    if (([v10 isEqualToString:@"playgrounds"] & 1) == 0)
    {
      uint64_t v11 = [(HLPHelpViewController *)self identifier];
      char v12 = [v11 hasPrefix:@"assistive-access"];

      if (v8) {
      if ((v12 & 1) == 0)
      }
      {
        if (!self->_supportsDarkMode) {
          goto LABEL_19;
        }
        goto LABEL_16;
      }
      goto LABEL_15;
    }

    if (v8) {
LABEL_10:
    }

LABEL_15:
    self->_uint64_t supportsDarkMode = 1;
  }
LABEL_16:
  [(HLPHelpTopicViewController *)self->_topicViewController setSupportsDarkMode:1];
  if (self->_supportsDarkMode)
  {
    uint64_t v13 = [MEMORY[0x263F1C550] systemBackgroundColor];
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v13 = [MEMORY[0x263F1C550] whiteColor];
LABEL_20:
  id v15 = (id)v13;
  uint64_t v14 = [(HLPHelpViewController *)self view];
  [v14 setBackgroundColor:v15];
}

- (void)registerTraitChanges
{
  v6[1] = *MEMORY[0x263EF8340];
  v6[0] = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__HLPHelpViewController_registerTraitChanges__block_invoke;
  v5[3] = &unk_264578A00;
  v5[4] = self;
  id v4 = (id)[(HLPHelpViewController *)self registerForTraitChanges:v3 withHandler:v5];
}

uint64_t __45__HLPHelpViewController_registerTraitChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "traitCollectionChangedFrom:");
}

- (void)traitCollectionChangedFrom:(id)a3
{
  id v4 = a3;
  id v5 = [(HLPHelpViewController *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6)
  {
    [(HLPHelpViewController *)self updateDarkMode];
  }
}

- (void)updateCacheControllerToLanguageCode:(id)a3
{
  id v3 = a3;
  id v4 = +[HLPJSONCacheController sharedInstance];
  [v4 setLanguageCode:v3];

  id v5 = +[HLPStringCacheController sharedInstance];
  [v5 setLanguageCode:v3];

  id v6 = +[HLPImageCacheController sharedInstance];
  [v6 setLanguageCode:v3];
}

- (void)removeDDMLoadFailVersion
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 removeObjectForKey:@"HLPHelpBookDynamicServerLastFailureLoadVersion"];
  [v2 synchronize];
}

- (void)showMessageForError:(id)a3
{
  id v15 = a3;
  id v4 = [(HLPHelpBookController *)self->_helpBookController rootSectionItem];
  id v5 = [v4 children];
  uint64_t v6 = [v5 count];

  if (self->_localHelpBookFileURL
    || ([(HLPHelpViewController *)self reachabilityManager],
        int v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isNetworkError:v15],
        v7,
        !v8))
  {
    if (!self->_fullBookView)
    {
      char v12 = [(HLPHelpTopicViewController *)self->_topicViewController loadingView];
      [v12 showDefaultErrorMessage];
    }
    uint64_t v13 = [(HLPHelpViewController *)self loadingView];
    uint64_t v14 = v13;
    if (v6) {
      [v13 showActivityIndicator:0];
    }
    else {
      [v13 showDefaultErrorMessage];
    }
  }
  else
  {
    if (!self->_fullBookView)
    {
      float v9 = [(HLPHelpTopicViewController *)self->_topicViewController loadingView];
      [v9 showNoConnectionErrorMessage];
    }
    uint64_t v10 = [(HLPHelpViewController *)self loadingView];
    uint64_t v11 = v10;
    if (v6) {
      [v10 showActivityIndicator:0];
    }
    else {
      [v10 showNoConnectionErrorMessage];
    }

    uint64_t v14 = [(HLPHelpViewController *)self reachabilityManager];
    [v14 startNotifier];
  }

  [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController loadError];
}

- (void)_showHelpTopicItem:(id)a3 anchor:(id)a4 allowErrorMessage:(BOOL)a5 animate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = +[HLPLoadInfo infoWithTopicItem:a3 accesstype:6 searchTerms:0 anchor:0];
  [(HLPHelpViewController *)self _showWithLoadInfo:v9 allowErrorMessage:v7 animate:v6];
}

- (void)_showWithLoadInfo:(id)a3 animate:(BOOL)a4
{
}

- (void)_showWithLoadInfo:(id)a3 allowErrorMessage:(BOOL)a4 animate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v41 = a3;
  int v8 = [v41 helpTopicItem];
  id v9 = [v41 anchor];
  if (self->_showingHelpTopic)
  {
    if (!self->_fullBookView) {
      goto LABEL_14;
    }
    goto LABEL_5;
  }
  if (!self->_fullBookView)
  {
    self->_showingHelpTopic = 1;
    [(HLPHelpViewController *)self setupTopicViewController];
    if (self->_displayHelpTopicsOnly)
    {
      BOOL v24 = [(HLPHelpViewController *)self childViewControllers];
      char v25 = [v24 containsObject:self->_topicViewController];

      if (v25) {
        goto LABEL_23;
      }
      uint64_t v26 = [(HLPHelpTopicViewController *)self->_topicViewController view];
      [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

      [(HLPHelpViewController *)self addChildViewController:self->_topicViewController];
      v27 = [(HLPHelpViewController *)self view];
      id v28 = [(HLPHelpTopicViewController *)self->_topicViewController view];
      [v27 addSubview:v28];

      id v29 = [(HLPHelpTopicViewController *)self->_topicViewController view];
      uint64_t v30 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
      v31 = _NSDictionaryOfVariableBindings(&cfstr_Topicview.isa, v29, 0);
      v32 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[topicView]|" options:0 metrics:0 views:v31];
      [v30 addObjectsFromArray:v32];

      uint64_t v33 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[topicView]|" options:0 metrics:0 views:v31];
      [v30 addObjectsFromArray:v33];

      char v34 = [(HLPHelpViewController *)self view];
      [v34 addConstraints:v30];

      [(HLPHelpTopicViewController *)self->_topicViewController didMoveToParentViewController:self];
    }
    else
    {
      uint64_t v35 = [(HLPHelpViewController *)self navigationController];
      id v36 = [v35 topViewController];
      topicViewController = self->_topicViewController;

      if (v36 == topicViewController)
      {
        if (v8) {
          goto LABEL_24;
        }
        goto LABEL_31;
      }
      id v29 = [(HLPHelpViewController *)self navigationController];
      [v29 pushViewController:self->_topicViewController animated:v5];
    }

LABEL_23:
    if (v8)
    {
LABEL_24:
      if (self->_displayHelpTopicsOnly && self->_showTopicNameAsTitle)
      {
        uint64_t v38 = [v8 name];
        id v39 = (void *)v38;
        if (v38) {
          uint64_t v40 = (__CFString *)v38;
        }
        else {
          uint64_t v40 = &stru_26D29FC58;
        }
        [(HLPHelpViewController *)self setTitle:v40];
      }
    }
LABEL_31:
    [(HLPHelpTopicViewController *)self->_topicViewController setHideDoneButton:self->_hideDoneButton];
  }
LABEL_5:
  [(HLPHelpTopicViewController *)self->_topicViewController setHelpBookController:self->_helpBookController];
  if ([(HLPHelpBookController *)self->_helpBookController serverType])
  {
    uint64_t v10 = [v8 identifier];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      char v12 = [(HLPHelpBookController *)self->_helpBookController topicPathFormat];
      uint64_t v13 = [v12 length];

      if (v13)
      {
        uint64_t v14 = NSString;
        id v15 = [(HLPHelpBookController *)self->_helpBookController topicPathFormat];
        uint64_t v16 = [v8 identifier];
        id v17 = objc_msgSend(v14, "stringWithFormat:", v15, v16);

        id v18 = [NSURL URLWithString:v17];
        [(HLPHelpTopicViewController *)self->_topicViewController setHelpBookURL:v18];
      }
    }
  }
  else
  {
    [(HLPHelpTopicViewController *)self->_topicViewController setHelpBookURL:self->_helpBookURL];
  }
  if ([v41 accessType] == -1)
  {
    id v20 = [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController searchTerms];
    uint64_t v21 = v8;
    uint64_t v22 = -1;
  }
  else
  {
    uint64_t v19 = [v41 accessType];
    id v20 = [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController searchTerms];
    uint64_t v21 = v8;
    uint64_t v22 = v19;
  }
  BOOL v23 = +[HLPLoadInfo infoWithTopicItem:v21 accesstype:v22 searchTerms:v20 anchor:v9];

  objc_msgSend(v23, "setAnalyticsLogged:", objc_msgSend(v41, "analyticsLogged"));
  [(HLPHelpTopicViewController *)self->_topicViewController loadWithInfo:v23 allowErrorMessage:v6];

LABEL_14:
}

- (id)topicIDForTopicName:(id)a3 locale:(id)a4
{
  v35[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HLPHelpViewController *)self localHelpBookFileURL];
  if (v8)
  {
    localHelpBookNameIDMap = self->_localHelpBookNameIDMap;

    if (!localHelpBookNameIDMap)
    {
      uint64_t v10 = (NSMutableDictionary *)[MEMORY[0x263EFFA78] mutableCopy];
      uint64_t v11 = self->_localHelpBookNameIDMap;
      self->_localHelpBookNameIDMap = v10;

      int v12 = [v7 isEqualToString:@"en-US"];
      localeListController = self->_localeListController;
      if (v12)
      {
        uint64_t v14 = [(HLPHelpLocaleController *)self->_localeListController englishLocale];
      }
      else
      {
        v35[0] = v7;
        id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
        uint64_t v14 = [(HLPHelpLocaleController *)localeListController localeWithPreferredLanguages:v15];
      }
      uint64_t v16 = [(HLPHelpBookController *)self->_helpBookController helpItemMap];
      if ([v16 count])
      {
        id v17 = [v14 path];
        int v18 = [v17 isEqualToString:@"en.lproj"];

        if (v18)
        {
          uint64_t v19 = [(HLPHelpBookController *)self->_helpBookController helpItemMap];
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __52__HLPHelpViewController_topicIDForTopicName_locale___block_invoke;
          v34[3] = &unk_264578DF0;
          v34[4] = self;
          [v19 enumerateKeysAndObjectsUsingBlock:v34];

LABEL_15:
          goto LABEL_16;
        }
      }
      else
      {
      }
      id v20 = [(HLPHelpViewController *)self localHelpBookFileURL];
      uint64_t v21 = [v20 URLByAppendingPathComponent:@"en.lproj/navigation.json"];

      if ([v21 checkResourceIsReachableAndReturnError:0])
      {
        uint64_t v30 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v21];
        uint64_t v22 = [MEMORY[0x263F08900] JSONObjectWithData:v30 options:0 error:0];
        if ([v22 count])
        {
          BOOL v23 = [v22 objectForKeyedSubscript:@"topics"];
          BOOL v24 = [v23 allKeys];
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __52__HLPHelpViewController_topicIDForTopicName_locale___block_invoke_2;
          v31[3] = &unk_264578E18;
          id v32 = v23;
          uint64_t v33 = self;
          id v25 = v23;
          [v24 enumerateObjectsUsingBlock:v31];
        }
      }

      goto LABEL_15;
    }
  }
LABEL_16:
  uint64_t v26 = self->_localHelpBookNameIDMap;
  v27 = [v6 lowercaseString];
  id v28 = [(NSMutableDictionary *)v26 objectForKeyedSubscript:v27];

  return v28;
}

void __52__HLPHelpViewController_topicIDForTopicName_locale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [*(id *)(a1 + 32) localHelpBookNameIDMap];
    id v7 = [v5 name];
    int v8 = [v7 lowercaseString];
    [v6 setObject:v9 forKeyedSubscript:v8];
  }
}

void __52__HLPHelpViewController_topicIDForTopicName_locale___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  id v4 = [v3 objectForKeyedSubscript:@"name"];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) localHelpBookNameIDMap];
    id v6 = [v4 lowercaseString];
    [v5 setObject:v7 forKeyedSubscript:v6];
  }
}

- (void)dismiss
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_popWelcomeTopicView object:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 helpViewControllerDoneButtonTapped:self];
  }
  else
  {
    [(HLPHelpViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)popWelcomeTopicView
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_popWelcomeTopicView object:0];
  selectedHelpTopicID = self->_selectedHelpTopicID;
  id v8 = [(HLPHelpBookController *)self->_helpBookController welcomeTopicIdentifier];
  if (-[NSString isEqualToString:](selectedHelpTopicID, "isEqualToString:"))
  {
    char v4 = [(HLPHelpViewController *)self navigationController];
    id v5 = [v4 topViewController];
    topicViewController = self->_topicViewController;

    if (v5 == topicViewController)
    {
      id v7 = self->_topicViewController;
      [(HLPHelpViewController *)self helpTopicViewControllerTableOfContentButtonTapped:v7];
    }
  }
  else
  {
  }
}

- (void)tableOfContentViewController:(id)a3 showHelpTopicItem:(id)a4
{
}

- (id)currentHelpTopicItemForTableOfContentViewController:(id)a3
{
  return [(HLPHelpBookController *)self->_helpBookController helpTopicItemForID:self->_selectedHelpTopicID];
}

- (void)tableOfContentViewControllerSearchUsed:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 helpViewControllerSearchUsed:self];
  }
}

- (void)tableOfContentViewControllerShowHelpBookInfo:(id)a3
{
}

- (void)tableOfContentViewControllerToCContentViewed:(id)a3 topicID:(id)a4 topicTitle:(id)a5 source:(id)a6 interfaceStyle:(int64_t)a7 fromTopicID:(id)a8 externalURLString:(id)a9
{
  id v21 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    id v20 = objc_loadWeakRetained((id *)&self->_delegate);
    [v20 helpViewControllerContentViewed:self topicID:v21 topicTitle:v14 source:v15 interfaceStyle:a7 fromTopicID:v16 externalURLString:v17];
  }
}

- (void)helpTopicViewController:(id)a3 traitCollectionChanged:(id)a4
{
}

- (void)helpTopicViewControllerCurrentTopicIsPassionPoint:(id)a3
{
  char v4 = (void *)MEMORY[0x263F8C6D0];
  id v5 = a3;
  [v4 cancelPreviousPerformRequestsWithTarget:self selector:sel_popWelcomeTopicView object:0];
  id v6 = [v5 webView];

  [v6 setUserInteractionEnabled:1];
}

- (void)helpTopicViewControllerTableOfContentButtonTapped:(id)a3
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_popWelcomeTopicView object:0];
  [(HLPHelpTableOfContentViewController *)self->_tableOfContentViewController updateWithHelpBookController:self->_helpBookController];
  char v4 = [(HLPHelpViewController *)self navigationController];
  id v5 = (id)[v4 popViewControllerAnimated:1];

  self->_shouldDismissWelcomeTopic = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 helpViewControllerTOCUsed:self];
  }
  id v9 = +[HLPAnalyticsEvent event];
  [v9 log];
}

- (void)helpTopicViewController:(id)a3 topicLoaded:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (!self->_shouldDismissWelcomeTopic) {
    goto LABEL_9;
  }
  char v7 = [(HLPHelpViewController *)self navigationController];
  if (!v7 || !self->_tableOfContentViewController)
  {
LABEL_8:

    goto LABEL_9;
  }
  id v8 = [v6 identifier];
  id v9 = [(HLPHelpBookController *)self->_helpBookController welcomeTopicIdentifier];
  if (([v8 isEqualToString:v9] & 1) == 0)
  {

    goto LABEL_8;
  }
  char v10 = [v6 isPassionPoints];

  if ((v10 & 1) == 0) {
    [(HLPHelpViewController *)self performSelector:sel_popWelcomeTopicView withObject:0 afterDelay:2.5];
  }
LABEL_9:
}

- (void)helpTopicViewControllerContentViewed:(id)a3 topicID:(id)a4 topicTitle:(id)a5 source:(id)a6 interfaceStyle:(int64_t)a7 fromTopicID:(id)a8 externalURLString:(id)a9
{
  id v21 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a8;
  id v16 = a9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    id v19 = objc_loadWeakRetained((id *)&self->_delegate);
    id v20 = [(HLPHelpViewController *)self traitCollection];
    objc_msgSend(v19, "helpViewControllerContentViewed:topicID:topicTitle:source:interfaceStyle:fromTopicID:externalURLString:", self, v21, v13, v14, objc_msgSend(v20, "userInterfaceStyle"), v15, v16);
  }
}

- (void)helpTopicViewController:(id)a3 selectedHelpTopicItem:(id)a4 accessType:(int64_t)a5
{
  id v21 = a3;
  id v8 = a4;
  id v9 = [v8 identifier];
  selectedHelpTopicID = self->_selectedHelpTopicID;
  self->_selectedHelpTopicID = v9;

  id v11 = [v8 name];
  selectedHelpTopicName = self->_selectedHelpTopicName;
  self->_selectedHelpTopicName = v11;

  if (v21)
  {
    id v13 = self->_selectedHelpTopicID;
    id v14 = [(HLPHelpBookController *)self->_helpBookController welcomeTopicIdentifier];
    LODWORD(v13) = [(NSString *)v13 isEqualToString:v14];

    if (v13)
    {
      helpBookController = self->_helpBookController;
      id v16 = [(HLPHelpBookController *)helpBookController welcomeTopicIdentifier];
      id v17 = [(HLPHelpBookController *)helpBookController helpItemForID:v16];

      uint64_t v18 = [v17 isPassionPoints];
    }
    else
    {
      uint64_t v18 = 1;
    }
    id v19 = [v21 webView];
    [v19 setUserInteractionEnabled:v18];
  }
  if (a5 != 5 && self->_fullBookView)
  {
    id v20 = [(HLPHelpViewController *)self tableOfContentViewController];
    [v20 scrollToHelpItem:v8 deselectImmediately:0 reload:1 animated:0];
  }
}

- (void)helpTopicViewController:(id)a3 failToLoadWithError:(id)a4
{
}

- (void)helpTopicViewControllerShowHelpBookInfo:(id)a3
{
}

- (void)reachabilityManagerConnectionStatusChanged:(id)a3 connected:(BOOL)a4
{
  if (a4)
  {
    id v5 = [(HLPHelpViewController *)self reachabilityManager];
    [v5 stopNotifier];

    [(HLPHelpViewController *)self loadHelpBook];
    topicViewController = self->_topicViewController;
    [(HLPHelpTopicViewController *)topicViewController reloadCurrentTopic];
  }
}

- (void)showHelpBookInfo:(id)a3
{
  char v4 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:&stru_26D29FC58];
  [v4 appendFormat:@"Host URL: %@\n", self->_helpBookBasePath];
  [v4 appendFormat:@"Identifier: %@\n", self->_identifier];
  [v4 appendFormat:@"Version: %@\n", self->_helpBookVersion];
  id v5 = [(HLPHelpBookController *)self->_helpBookController contentVersion];

  if (v5)
  {
    id v6 = [(HLPHelpBookController *)self->_helpBookController contentVersion];
    [v4 appendFormat:@"Content Version: %@\n", v6];
  }
  if ([(HLPHelpBookController *)self->_helpBookController contentFormatVersion] >= 1)
  {
    uint64_t v7 = [(HLPHelpBookController *)self->_helpBookController contentFormatVersion];
    id v8 = @"2.0.6";
    if (v7 > 4) {
      id v8 = @"5.0.11";
    }
    [v4 appendFormat:@"Content Style Version: %@\n", v8];
    objc_msgSend(v4, "appendFormat:", @"Content Format Version: %zd\n", -[HLPHelpBookController contentFormatVersion](self->_helpBookController, "contentFormatVersion"));
  }
  id v9 = [MEMORY[0x263EFF960] preferredLanguages];
  char v10 = [v9 firstObject];
  [v4 appendFormat:@"Device language: %@\n", v10];

  if ([(HLPHelpBookController *)self->_helpBookController serverType] == 1)
  {
    id v11 = [(HLPHelpBookController *)self->_helpBookController locale];
    int v12 = [v11 isoCodes];
    id v13 = [v12 firstObject];
  }
  else
  {
    id v11 = [(HLPHelpLocaleController *)self->_localeListController currentLocale];
    id v13 = [v11 path];
  }

  [v4 appendFormat:@"Content language: %@\n", v13];
  id v14 = [MEMORY[0x263F086E0] mainBundle];
  id v15 = [v14 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
  [v4 appendFormat:@"App Version: %@", v15];

  id v16 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"Help Book Info" message:v4 preferredStyle:1];
  id v17 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v18 = [MEMORY[0x263F086E0] mainBundle];
  id v19 = [v18 localizedStringForKey:@"OK" value:&stru_26D29FC58 table:0];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __42__HLPHelpViewController_showHelpBookInfo___block_invoke;
  v22[3] = &unk_264578E40;
  id v23 = v16;
  id v20 = v16;
  id v21 = [v17 actionWithTitle:v19 style:1 handler:v22];
  [v20 addAction:v21];

  [(HLPHelpViewController *)self presentViewController:v20 animated:1 completion:0];
}

uint64_t __42__HLPHelpViewController_showHelpBookInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)useModalPresentation
{
  return self->_useModalPresentation;
}

- (void)setUseModalPresentation:(BOOL)a3
{
  self->_useModalPresentation = a3;
}

- (BOOL)hideDoneButton
{
  return self->_hideDoneButton;
}

- (BOOL)displayHelpTopicsOnly
{
  return self->_displayHelpTopicsOnly;
}

- (void)setDisplayHelpTopicsOnly:(BOOL)a3
{
  self->_BOOL displayHelpTopicsOnly = a3;
}

- (BOOL)platformIndependent
{
  return self->_platformIndependent;
}

- (void)setPlatformIndependent:(BOOL)a3
{
  self->_platformIndependent = a3;
}

- (BOOL)showTopicNameAsTitle
{
  return self->_showTopicNameAsTitle;
}

- (void)setShowTopicNameAsTitle:(BOOL)a3
{
  self->_showTopicNameAsTitle = a3;
}

- (BOOL)showTopicViewOnLoad
{
  return self->_showTopicViewOnLoad;
}

- (void)setShowTopicViewOnLoad:(BOOL)a3
{
  self->_showTopicViewOnLoad = a3;
}

- (BOOL)prefersLandingViewOnLoad
{
  return self->_prefersLandingViewOnLoad;
}

- (void)setPrefersLandingViewOnLoad:(BOOL)a3
{
  self->_prefersLandingViewOnLoad = a3;
}

- (HLPHelpViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HLPHelpViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)subpath
{
  return self->_subpath;
}

- (void)setSubpath:(id)a3
{
}

- (NSURL)localHelpBookFileURL
{
  return self->_localHelpBookFileURL;
}

- (void)setLocalHelpBookFileURL:(id)a3
{
}

- (NSArray)preferredLanguagesOverride
{
  return self->_preferredLanguagesOverride;
}

- (void)setPreferredLanguagesOverride:(id)a3
{
}

- (NSArray)additionalSupportedLanguages
{
  return self->_additionalSupportedLanguages;
}

- (void)setAdditionalSupportedLanguages:(id)a3
{
}

- (NSString)selectedHelpTopicID
{
  return self->_selectedHelpTopicID;
}

- (void)setSelectedHelpTopicID:(id)a3
{
}

- (NSString)selectedHelpTopicName
{
  return self->_selectedHelpTopicName;
}

- (void)setSelectedHelpTopicName:(id)a3
{
}

- (NSMutableDictionary)localHelpBookNameIDMap
{
  return self->_localHelpBookNameIDMap;
}

- (void)setLocalHelpBookNameIDMap:(id)a3
{
}

- (NSURL)helpBookURL
{
  return self->_helpBookURL;
}

- (void)setHelpBookURL:(id)a3
{
}

- (NSString)helpBookBasePath
{
  return self->_helpBookBasePath;
}

- (void)setHelpBookBasePath:(id)a3
{
}

- (HLPHelpLocaleController)localeListController
{
  return self->_localeListController;
}

- (void)setLocaleListController:(id)a3
{
}

- (HLPHelpBookController)helpBookController
{
  return self->_helpBookController;
}

- (void)setHelpBookController:(id)a3
{
}

- (void)setReachabilityManager:(id)a3
{
}

- (void)setLoadingView:(id)a3
{
}

- (HLPHelpTableOfContentViewController)tableOfContentViewController
{
  return self->_tableOfContentViewController;
}

- (void)setTableOfContentViewController:(id)a3
{
}

- (UIView)fullBookViewSeparator
{
  return self->_fullBookViewSeparator;
}

- (void)setFullBookViewSeparator:(id)a3
{
}

- (HLPHelpTopicViewController)topicViewController
{
  return self->_topicViewController;
}

- (void)setTopicViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicViewController, 0);
  objc_storeStrong((id *)&self->_fullBookViewSeparator, 0);
  objc_storeStrong((id *)&self->_tableOfContentViewController, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_reachabilityManager, 0);
  objc_storeStrong((id *)&self->_helpBookController, 0);
  objc_storeStrong((id *)&self->_localeListController, 0);
  objc_storeStrong((id *)&self->_helpBookBasePath, 0);
  objc_storeStrong((id *)&self->_helpBookURL, 0);
  objc_storeStrong((id *)&self->_localHelpBookNameIDMap, 0);
  objc_storeStrong((id *)&self->_selectedHelpTopicName, 0);
  objc_storeStrong((id *)&self->_selectedHelpTopicID, 0);
  objc_storeStrong((id *)&self->_additionalSupportedLanguages, 0);
  objc_storeStrong((id *)&self->_preferredLanguagesOverride, 0);
  objc_storeStrong((id *)&self->_localHelpBookFileURL, 0);
  objc_storeStrong((id *)&self->_subpath, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadingViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_helpBookVersion, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end