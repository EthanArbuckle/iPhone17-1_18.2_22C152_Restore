@interface FBAMailboxesViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)canLaunchFeedbackDraft;
- (BOOL)canLaunchSurveyDraft;
- (BOOL)canShowBatchUIWithAction:(id)a3;
- (BOOL)canShowItems;
- (BOOL)hasContentItemsToShow;
- (BOOL)hasFinishedFirstLoad;
- (BOOL)hasLoadedFormItems;
- (BOOL)hideAllInboxes;
- (BOOL)isApplyingSnapshot;
- (BOOL)isBatchUIEnabled;
- (BOOL)showsEnhancedLoggingSection;
- (BOOL)showsFormsCount;
- (BOOL)userIsEnrolledInAnySeedingProgram;
- (FBAMailboxesViewController)initWithCoder:(id)a3;
- (FBAMailboxesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (FBAResponseSummaryViewController)detailViewController;
- (FBKContentItem)pendingItemToShow;
- (FBKData)data;
- (FBKFeedbackFollowup)pendingFollowupToShow;
- (FBKLaunchAction)delayedUrlAction;
- (FBKLaunchAction)pendingLaunchAction;
- (NSArray)inboxes;
- (NSArray)smartMailboxes;
- (NSArray)sortedTeams;
- (NSArray)teamSortDescriptors;
- (NSMutableArray)fbaDataObservers;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (UIRefreshControl)refreshControl;
- (_TtC18Feedback_Assistant23FBAEnhancedLoggingInbox)enhancedLoggingInbox;
- (id)batchEvaluationViewControllerWithUseNavigationStack:(BOOL)a3 showsCloseButton:(BOOL)a4 onDismiss:(id)a5;
- (id)batchUICellWithCollectionView:(id)a3 indexPath:(id)a4 reuseIdentifier:(id)a5;
- (id)composeCellRegistration;
- (id)footerRegistration;
- (id)headerRegistration;
- (id)listCellRegistration;
- (id)makeCompositionalLayout;
- (id)makeSnapshot;
- (id)teamForIndexPath:(id)a3;
- (id)teamForSection:(int64_t)a3;
- (int64_t)sectionForTeam:(id)a3;
- (unint64_t)newFeedbackButtonState;
- (void)_beginBugForTeam:(id)a3 sender:(id)a4;
- (void)applySnapshot;
- (void)applySnapshotAnimated:(BOOL)a3;
- (void)awakeFromNib;
- (void)beginBugForTeam:(id)a3 sender:(id)a4;
- (void)beginFeedbackForSurvey:(id)a3 forTeam:(id)a4;
- (void)beginFeedbackWithDraftItem:(id)a3;
- (void)beginPullToRefresh;
- (void)bugFormPicker:(id)a3 didSelectBugFormStub:(id)a4;
- (void)bugFormPickerDidCancel:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)commonInit;
- (void)configureCollectionView;
- (void)controller:(id)a3 didFailToLoadDraftWithError:(id)a4;
- (void)controller:(id)a3 didFinishSubmissionWithError:(id)a4;
- (void)controller:(id)a3 didRequestDismissalWithSavedDraft:(BOOL)a4;
- (void)controllerWillFinishSubmission:(id)a3;
- (void)controllerWillResignFirstActive:(id)a3;
- (void)createNewFeedback:(id)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)didReloadApp;
- (void)hideLoadingView;
- (void)launchFeedbackDraftWithUrlAction:(id)a3;
- (void)launchInboxWithLaunchAction:(id)a3;
- (void)launchNewDraftViewControllerWithBugFormStub:(id)a3 draftItem:(id)a4 surveyBugForm:(id)a5 launchAction:(id)a6 team:(id)a7 completion:(id)a8;
- (void)launchSurveyWithUrlAction:(id)a3;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)presentNonParticipantView;
- (void)reallyLaunchSurveyWithUrlAction:(id)a3 team:(id)a4 surveyItem:(id)a5;
- (void)reloadApp;
- (void)respondToUrlAction:(id)a3;
- (void)runDelayedUrlActionIfNeeded;
- (void)setData:(id)a3;
- (void)setDelayedUrlAction:(id)a3;
- (void)setDetailViewController:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setEnhancedLoggingInbox:(id)a3;
- (void)setFBAPreferencesEnabled:(BOOL)a3;
- (void)setFbaDataObservers:(id)a3;
- (void)setHasFinishedFirstLoad:(BOOL)a3;
- (void)setHasLoadedFormItems:(BOOL)a3;
- (void)setHideAllInboxes:(BOOL)a3;
- (void)setInboxes:(id)a3;
- (void)setIsApplyingSnapshot:(BOOL)a3;
- (void)setIsBatchUIEnabled:(BOOL)a3;
- (void)setPendingFollowupToShow:(id)a3;
- (void)setPendingItemToShow:(id)a3;
- (void)setPendingLaunchAction:(id)a3;
- (void)setRefreshControl:(id)a3;
- (void)setShowsFormsCount:(BOOL)a3;
- (void)setSmartMailboxes:(id)a3;
- (void)setSortedTeams:(id)a3;
- (void)setTeamSortDescriptors:(id)a3;
- (void)shouldShowBatchUIWithCompletion:(id)a3;
- (void)showBatchUIWithAction:(id)a3;
- (void)showItemWithUrlAction:(id)a3;
- (void)showLoadingView;
- (void)showSettings;
- (void)showTargetedFeedbackLoadErrorAlert;
- (void)showTargetedSurveyLoadErrorAlert;
- (void)tryLaunchingDraft:(id)a3 orStub:(id)a4 forTeam:(id)a5 withSender:(id)a6;
- (void)tryLaunchingDraft:(id)a3 orStub:(id)a4 orBugForm:(id)a5 forTeam:(id)a6 withSender:(id)a7;
- (void)updateUI;
- (void)updateUIAnimated:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FBAMailboxesViewController

- (FBAMailboxesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FBAMailboxesViewController;
  v4 = [(FBAMailboxesViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(FBAMailboxesViewController *)v4 commonInit];
  }
  return v5;
}

- (FBAMailboxesViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FBAMailboxesViewController;
  v3 = [(FBAMailboxesViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(FBAMailboxesViewController *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  v3 = +[NSProcessInfo processInfo];
  v4 = [v3 environment];
  v5 = [v4 objectForKeyedSubscript:@"FBK_UNIT_TEST"];

  if (!v5)
  {
    objc_super v6 = +[FBKData sharedInstance];
    objc_storeWeak((id *)&self->_data, v6);

    self->_isApplyingSnapshot = 0;
    self->_hasLoadedFormItems = 0;
    self->_hasFinishedFirstLoad = 0;
    self->_hideAllInboxes = 1;
    delayedUrlAction = self->_delayedUrlAction;
    self->_delayedUrlAction = 0;

    pendingLaunchAction = self->_pendingLaunchAction;
    self->_pendingLaunchAction = 0;

    v9 = +[FBKTeam sortDescriptors];
    teamSortDescriptors = self->_teamSortDescriptors;
    self->_teamSortDescriptors = v9;

    sortedTeams = self->_sortedTeams;
    self->_sortedTeams = (NSArray *)&__NSArray0__struct;

    self->_isBatchUIEnabled = 0;
    v12 = objc_alloc_init(FBACombinedInbox);
    v26[0] = v12;
    v13 = objc_alloc_init(FBADraftsInbox);
    v26[1] = v13;
    v14 = objc_alloc_init(FBASubmittedInbox);
    v26[2] = v14;
    v15 = +[NSArray arrayWithObjects:v26 count:3];
    inboxes = self->_inboxes;
    self->_inboxes = v15;

    v17 = objc_opt_new();
    v25[0] = v17;
    v18 = objc_opt_new();
    v25[1] = v18;
    v19 = objc_opt_new();
    v25[2] = v19;
    v20 = objc_opt_new();
    v25[3] = v20;
    v21 = +[NSArray arrayWithObjects:v25 count:4];
    smartMailboxes = self->_smartMailboxes;
    self->_smartMailboxes = v21;

    v23 = (_TtC18Feedback_Assistant23FBAEnhancedLoggingInbox *)objc_opt_new();
    enhancedLoggingInbox = self->_enhancedLoggingInbox;
    self->_enhancedLoggingInbox = v23;
  }
}

- (void)awakeFromNib
{
  v5.receiver = self;
  v5.super_class = (Class)FBAMailboxesViewController;
  [(FBAMailboxesViewController *)&v5 awakeFromNib];
  [(FBAMailboxesViewController *)self setClearsSelectionOnViewWillAppear:1];
  v3 = +[UIColor systemGroupedBackgroundColor];
  v4 = [(FBAMailboxesViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)viewDidLoad
{
  v85.receiver = self;
  v85.super_class = (Class)FBAMailboxesViewController;
  [(FBAMailboxesViewController *)&v85 viewDidLoad];
  v3 = +[NSProcessInfo processInfo];
  v4 = [v3 environment];
  objc_super v5 = [v4 objectForKeyedSubscript:@"FBK_UNIT_TEST"];

  if (!v5)
  {
    objc_initWeak(&location, self);
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_10002ACE0;
    v82[3] = &unk_1000F33C8;
    objc_copyWeak(&v83, &location);
    [(FBAMailboxesViewController *)self shouldShowBatchUIWithCompletion:v82];
    objc_super v6 = +[UIImageSymbolConfiguration configurationWithPointSize:32.0];
    objc_super v7 = +[UIImage systemImageNamed:FBKSystemImageNameSettings withConfiguration:v6];
    v8 = +[UIButton systemButtonWithImage:v7 target:self action:"showSettings"];

    [v8 setEnabled:0];
    v9 = [(FBAMailboxesViewController *)self navigationItem];
    [v9 _setLargeTitleAccessoryView:v8 alignToBaseline:0];

    v10 = [(FBAMailboxesViewController *)self splitViewController];
    v11 = [v10 viewControllers];
    v12 = [v11 lastObject];
    v13 = [v12 topViewController];
    [(FBAMailboxesViewController *)self setDetailViewController:v13];

    [(FBAMailboxesViewController *)self showLoadingView];
    v14 = objc_opt_new();
    [(FBAMailboxesViewController *)self setFbaDataObservers:v14];

    v15 = +[NSNotificationCenter defaultCenter];
    v16 = +[NSOperationQueue mainQueue];
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_10002AD54;
    v81[3] = &unk_1000F33F0;
    v81[4] = self;
    id v17 = [v15 addObserverForName:FBKUserDidLogInNotification object:0 queue:v16 usingBlock:v81];

    v18 = +[NSNotificationCenter defaultCenter];
    v19 = +[NSOperationQueue mainQueue];
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_10002AEC0;
    v80[3] = &unk_1000F33F0;
    v80[4] = self;
    id v20 = [v18 addObserverForName:@"FBADidDismissLegalAgreementNotification" object:0 queue:v19 usingBlock:v80];

    v21 = [(FBAMailboxesViewController *)self fbaDataObservers];
    v22 = [(FBAMailboxesViewController *)self data];
    v23 = [v22 notificationCenter];
    v24 = +[NSOperationQueue mainQueue];
    v65 = v8;
    uint64_t v25 = FBKDidRefreshContentItemsNotification;
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_10002AEC8;
    v78[3] = &unk_1000F2660;
    objc_copyWeak(&v79, &location);
    v26 = [v23 addObserverForName:v25 object:0 queue:v24 usingBlock:v78];
    [v21 addObject:v26];

    v27 = [(FBAMailboxesViewController *)self fbaDataObservers];
    v28 = [(FBAMailboxesViewController *)self data];
    v29 = [v28 notificationCenter];
    v30 = +[NSOperationQueue mainQueue];
    uint64_t v31 = FBKDidRefreshFormStubsNotification;
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_10002AF28;
    v76[3] = &unk_1000F2660;
    objc_copyWeak(&v77, &location);
    v32 = [v29 addObserverForName:v31 object:0 queue:v30 usingBlock:v76];
    [v27 addObject:v32];

    v33 = +[NSNotificationCenter defaultCenter];
    v34 = +[NSOperationQueue mainQueue];
    uint64_t v35 = FBKUserDidLogOutNotification;
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_10002B010;
    v74[3] = &unk_1000F3418;
    v74[4] = self;
    objc_copyWeak(&v75, &location);
    id v36 = [v33 addObserverForName:v35 object:0 queue:v34 usingBlock:v74];

    v37 = [(FBAMailboxesViewController *)self fbaDataObservers];
    v38 = [(FBAMailboxesViewController *)self data];
    v39 = [v38 notificationCenter];
    v40 = +[NSOperationQueue mainQueue];
    uint64_t v41 = FBKLocalDataDidChangeNotification;
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_10002B084;
    v72[3] = &unk_1000F2660;
    objc_copyWeak(&v73, &location);
    v42 = [v39 addObserverForName:v41 object:0 queue:v40 usingBlock:v72];
    [v37 addObject:v42];

    v43 = [(FBAMailboxesViewController *)self fbaDataObservers];
    v44 = [(FBAMailboxesViewController *)self data];
    v45 = [v44 notificationCenter];
    v46 = +[NSOperationQueue mainQueue];
    uint64_t v47 = FBKFormUploadStatusChangeNotification;
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_10002B0C4;
    v70[3] = &unk_1000F2660;
    objc_copyWeak(&v71, &location);
    v48 = [v45 addObserverForName:v47 object:0 queue:v46 usingBlock:v70];
    [v43 addObject:v48];

    v49 = +[NSNotificationCenter defaultCenter];
    v50 = +[NSOperationQueue mainQueue];
    uint64_t v51 = FBKUserIsLoggingOutNotification;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_10002B104;
    v68[3] = &unk_1000F2660;
    objc_copyWeak(&v69, &location);
    id v52 = [v49 addObserverForName:v51 object:0 queue:v50 usingBlock:v68];

    v53 = [(FBAMailboxesViewController *)self fbaDataObservers];
    v54 = [(FBAMailboxesViewController *)self data];
    v55 = [v54 notificationCenter];
    v56 = +[NSOperationQueue mainQueue];
    uint64_t v57 = FBKUserNoProgramsNotification;
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_10002B1E8;
    v66[3] = &unk_1000F2660;
    objc_copyWeak(&v67, &location);
    v58 = [v55 addObserverForName:v57 object:0 queue:v56 usingBlock:v66];
    [v53 addObject:v58];

    v59 = objc_opt_new();
    [v59 addTarget:self action:"beginPullToRefresh" forControlEvents:4096];
    objc_storeStrong((id *)&self->_refreshControl, v59);
    v60 = [(FBAMailboxesViewController *)self collectionView];
    [v60 setRefreshControl:v59];

    v61 = [(FBAMailboxesViewController *)self collectionView];
    [v61 setAlwaysBounceVertical:1];

    v62 = +[UIKeyCommand keyCommandWithInput:@"R" modifierFlags:1572864 action:"reloadApp"];
    v63 = +[NSBundle mainBundle];
    v64 = [v63 localizedStringForKey:@"REFRESH" value:&stru_1000F6658 table:FBKCommonStrings];
    [v62 setDiscoverabilityTitle:v64];

    [(FBAMailboxesViewController *)self addKeyCommand:v62];
    [(FBAMailboxesViewController *)self configureCollectionView];

    objc_destroyWeak(&v67);
    objc_destroyWeak(&v69);
    objc_destroyWeak(&v71);
    objc_destroyWeak(&v73);
    objc_destroyWeak(&v75);
    objc_destroyWeak(&v77);
    objc_destroyWeak(&v79);

    objc_destroyWeak(&v83);
    objc_destroyWeak(&location);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)FBAMailboxesViewController;
  [(FBAMailboxesViewController *)&v11 viewWillAppear:a3];
  v4 = [(FBAMailboxesViewController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(FBAMailboxesViewController *)self dismissViewControllerAnimated:0 completion:0];
  }
  objc_super v6 = [(FBAMailboxesViewController *)self collectionView];
  objc_super v7 = [(FBAMailboxesViewController *)self collectionView];
  v8 = [v7 indexPathsForSelectedItems];
  v9 = [v8 firstObject];
  [v6 deselectItemAtIndexPath:v9 animated:0];

  [(FBAMailboxesViewController *)self applySnapshot];
  v10 = [(FBAMailboxesViewController *)self collectionView];
  [v10 reloadData];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FBAMailboxesViewController;
  [(FBAMailboxesViewController *)&v8 viewDidAppear:a3];
  v4 = [(FBAMailboxesViewController *)self data];
  unsigned int v5 = [v4 isReloadingContentAndFormItems];

  if (v5)
  {
    objc_super v6 = +[NSBundle mainBundle];
    objc_super v7 = [v6 localizedStringForKey:@"LOADING_ELLIPSES" value:&stru_1000F6658 table:0];
    [(FBAMailboxesViewController *)self resumeSpinnerWithStatus:v7 userInteractionEnabled:1];
  }
  else
  {
    [(FBAMailboxesViewController *)self hideSpinner];
  }
  [(FBAMailboxesViewController *)self runDelayedUrlActionIfNeeded];
}

- (void)didReceiveMemoryWarning
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(FBAMailboxesViewController *)self sortedTeams];
  id v4 = [v3 copy];

  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      objc_super v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
        v10 = [(FBAMailboxesViewController *)self data];
        [v10 reduceToFault:v9];

        objc_super v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v11.receiver = self;
  v11.super_class = (Class)FBAMailboxesViewController;
  [(FBAMailboxesViewController *)&v11 didReceiveMemoryWarning];
}

- (void)dealloc
{
  v3 = [(FBAMailboxesViewController *)self data];
  id v4 = [v3 notificationCenter];

  id v5 = [(FBAMailboxesViewController *)self fbaDataObservers];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002B680;
  v10[3] = &unk_1000F3000;
  id v11 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v10];

  uint64_t v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self];

  fbaDataObservers = self->_fbaDataObservers;
  self->_fbaDataObservers = 0;

  v9.receiver = self;
  v9.super_class = (Class)FBAMailboxesViewController;
  [(FBAMailboxesViewController *)&v9 dealloc];
}

- (void)configureCollectionView
{
  v3 = +[UIColor systemGroupedBackgroundColor];
  id v4 = [(FBAMailboxesViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  id v5 = [(FBAMailboxesViewController *)self collectionView];
  [v5 setDelegate:self];

  objc_initWeak(&location, self);
  id v6 = [(FBAMailboxesViewController *)self makeCompositionalLayout];
  uint64_t v7 = [(FBAMailboxesViewController *)self collectionView];
  [v7 setCollectionViewLayout:v6];

  objc_super v8 = [(FBAMailboxesViewController *)self collectionView];
  [v8 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"batch-ui-row"];

  objc_super v9 = [(FBAMailboxesViewController *)self headerRegistration];
  v10 = [(FBAMailboxesViewController *)self footerRegistration];
  id v11 = [(FBAMailboxesViewController *)self listCellRegistration];
  long long v12 = [(FBAMailboxesViewController *)self composeCellRegistration];
  id v13 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  long long v14 = [(FBAMailboxesViewController *)self collectionView];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002B978;
  v24[3] = &unk_1000F3440;
  v24[4] = self;
  objc_copyWeak(&v27, &location);
  id v15 = v11;
  id v25 = v15;
  id v16 = v12;
  id v26 = v16;
  id v17 = [v13 initWithCollectionView:v14 cellProvider:v24];
  [(FBAMailboxesViewController *)self setDiffableDataSource:v17];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002BC00;
  v21[3] = &unk_1000F3468;
  id v18 = v9;
  id v22 = v18;
  id v19 = v10;
  id v23 = v19;
  id v20 = [(FBAMailboxesViewController *)self diffableDataSource];
  [v20 setSupplementaryViewProvider:v21];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (id)makeCompositionalLayout
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002BD98;
  v6[3] = &unk_1000F3490;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  id v4 = [v3 initWithSectionProvider:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

- (id)headerRegistration
{
  objc_initWeak(&location, self);
  uint64_t v3 = objc_opt_class();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002C3E0;
  v6[3] = &unk_1000F34B8;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  id v4 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:v3 elementKind:UICollectionElementKindSectionHeader configurationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

- (id)footerRegistration
{
  objc_initWeak(&location, self);
  uint64_t v3 = objc_opt_class();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002C5C0;
  v6[3] = &unk_1000F34E0;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  id v4 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:v3 elementKind:UICollectionElementKindSectionFooter configurationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

- (id)listCellRegistration
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002C7B0;
  v4[3] = &unk_1000F3508;
  v4[4] = self;
  v2 = +[UICollectionViewCellRegistration registrationWithCellClass:objc_opt_class() configurationHandler:v4];

  return v2;
}

- (id)composeCellRegistration
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002CA8C;
  v4[3] = &unk_1000F3508;
  v4[4] = self;
  v2 = +[UICollectionViewCellRegistration registrationWithCellClass:objc_opt_class() configurationHandler:v4];

  return v2;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  [v17 deselectItemAtIndexPath:v6 animated:1];
  id v7 = [(FBAMailboxesViewController *)self diffableDataSource];
  [v7 sectionIdentifierForIndex:[v6 section]];

  if ([v8 isEqualToString:@"smart-mailbox"])
  {
    objc_super v9 = [(FBAMailboxesViewController *)self smartMailboxes];
    v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

    id v11 = self;
  }
  else
  {
    if (![v8 isEqualToString:@"enhanced-logging-section"])
    {
      if ([v8 isEqualToString:@"batch-ui-section"])
      {
        [(FBAMailboxesViewController *)self showBatchUIWithAction:0];
      }
      else
      {
        long long v12 = [(FBAMailboxesViewController *)self teamForIndexPath:v6];
        id v13 = [v6 row];
        long long v14 = [(FBAMailboxesViewController *)self inboxes];
        id v15 = [v14 count];

        if (v13 >= v15)
        {
          id v16 = [v17 cellForItemAtIndexPath:v6];
          [(FBAMailboxesViewController *)self beginBugForTeam:v12 sender:v16];
        }
        else
        {
          [(FBAMailboxesViewController *)self performSegueWithIdentifier:@"FBAInboxItemsPresentation" sender:v6];
        }
      }
      goto LABEL_6;
    }
    v10 = [(FBAMailboxesViewController *)self enhancedLoggingInbox];
    id v11 = self;
  }
  [(FBAMailboxesViewController *)v11 performSegueWithIdentifier:@"FBAInboxItemsPresentation" sender:v10];

LABEL_6:
}

- (id)makeSnapshot
{
  uint64_t v3 = objc_opt_new();
  if (![(FBAMailboxesViewController *)self hideAllInboxes])
  {
    CFStringRef v60 = @"smart-mailbox";
    id v4 = +[NSArray arrayWithObjects:&v60 count:1];
    [v3 appendSectionsWithIdentifiers:v4];

    id v5 = [(FBAMailboxesViewController *)self smartMailboxes];
    id v6 = [v5 valueForKey:@"diffableIdentifier"];
    [v3 appendItemsWithIdentifiers:v6 intoSectionWithIdentifier:@"smart-mailbox"];

    if ([(FBAMailboxesViewController *)self isBatchUIEnabled])
    {
      CFStringRef v59 = @"batch-ui-section";
      id v7 = +[NSArray arrayWithObjects:&v59 count:1];
      [v3 appendSectionsWithIdentifiers:v7];

      CFStringRef v58 = @"batch-ui-row";
      objc_super v8 = +[NSArray arrayWithObjects:&v58 count:1];
      [v3 appendItemsWithIdentifiers:v8];
    }
    if ([(FBAMailboxesViewController *)self showsEnhancedLoggingSection])
    {
      CFStringRef v57 = @"enhanced-logging-section";
      objc_super v9 = +[NSArray arrayWithObjects:&v57 count:1];
      [v3 appendSectionsWithIdentifiers:v9];

      CFStringRef v56 = @"enhanced-logging-row";
      v10 = +[NSArray arrayWithObjects:&v56 count:1];
      [v3 appendItemsWithIdentifiers:v10];
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = [(FBAMailboxesViewController *)self sortedTeams];
    id v37 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
    if (v37)
    {
      uint64_t v35 = *(void *)v44;
      id v36 = self;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v44 != v35) {
            objc_enumerationMutation(obj);
          }
          long long v12 = *(__CFString **)(*((void *)&v43 + 1) + 8 * v11);
          id v13 = [(__CFString *)v12 ID];
          long long v14 = [v13 stringValue];

          if (!v14)
          {
            id v15 = +[NSUUID UUID];
            long long v14 = [v15 UUIDString];

            id v16 = +[FBALog appHandle];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              CFStringRef v17 = @"(null)";
              if (v12) {
                CFStringRef v17 = v12;
              }
              CFStringRef v52 = v17;
              __int16 v53 = 2114;
              v54 = v14;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Team [%{public}@] is missing ID, using a placeholder ID [%{public}@].", buf, 0x16u);
            }
          }
          uint64_t v38 = v11;
          v50 = v14;
          id v18 = +[NSArray arrayWithObjects:&v50 count:1];
          [v3 appendSectionsWithIdentifiers:v18];

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v19 = [(FBAMailboxesViewController *)self inboxes];
          id v20 = [v19 countByEnumeratingWithState:&v39 objects:v49 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v40;
            do
            {
              for (i = 0; i != v21; i = (char *)i + 1)
              {
                if (*(void *)v40 != v22) {
                  objc_enumerationMutation(v19);
                }
                v24 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                if (v12) {
                  id v25 = [*(id *)(*((void *)&v39 + 1) + 8 * i) unreadCountForTeam:v12];
                }
                else {
                  id v25 = 0;
                }
                id v26 = [v24 diffableIdentifier];
                id v27 = +[NSString stringWithFormat:@"Team%@-%@-%lu", v14, v26, v25];

                v48 = v27;
                v28 = +[NSArray arrayWithObjects:&v48 count:1];
                [v3 appendItemsWithIdentifiers:v28 intoSectionWithIdentifier:v14];
              }
              id v21 = [v19 countByEnumeratingWithState:&v39 objects:v49 count:16];
            }
            while (v21);
          }

          unsigned int v29 = [(__CFString *)v12 canStartNewFeedback];
          CFStringRef v30 = @"disabled";
          if (v29) {
            CFStringRef v30 = @"enabled";
          }
          uint64_t v31 = +[NSString stringWithFormat:@"Team%@-Compose-%@", v14, v30];
          uint64_t v47 = v31;
          v32 = +[NSArray arrayWithObjects:&v47 count:1];
          [v3 appendItemsWithIdentifiers:v32 intoSectionWithIdentifier:v14];

          uint64_t v11 = v38 + 1;
          self = v36;
        }
        while ((id)(v38 + 1) != v37);
        id v37 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
      }
      while (v37);
    }
  }

  return v3;
}

- (void)applySnapshotAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSProcessInfo processInfo];
  id v6 = [v5 environment];
  id v7 = [v6 objectForKeyedSubscript:@"FBK_UNIT_TEST"];

  if (!v7)
  {
    if ([(FBAMailboxesViewController *)self isApplyingSnapshot])
    {
      objc_super v8 = +[FBALog appHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Already updating UI in mailboxes. Will defer to next run loop", (uint8_t *)buf, 2u);
      }

      objc_super v9 = +[NSOperationQueue mainQueue];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10002D66C;
      v15[3] = &unk_1000F29E0;
      v15[4] = self;
      BOOL v16 = v3;
      [v9 addOperationWithBlock:v15];
    }
    else
    {
      objc_super v9 = [(FBAMailboxesViewController *)self makeSnapshot];
      id v10 = objc_initWeak(buf, self);
      [(FBAMailboxesViewController *)self setIsApplyingSnapshot:1];

      uint64_t v11 = [(FBAMailboxesViewController *)self diffableDataSource];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10002D67C;
      v12[3] = &unk_1000F2688;
      objc_copyWeak(&v13, buf);
      [v11 applySnapshot:v9 animatingDifferences:v3 completion:v12];

      objc_destroyWeak(&v13);
      objc_destroyWeak(buf);
    }
  }
}

- (void)applySnapshot
{
}

- (BOOL)hasContentItemsToShow
{
  v2 = +[FBKData sharedInstance];
  BOOL v3 = [v2 currentUser];
  id v4 = [v3 contentItems];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (void)updateUI
{
}

- (void)updateUIAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = +[FBALog appHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v22 = "-[FBAMailboxesViewController updateUIAnimated:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}s", buf, 0xCu);
  }

  id v6 = +[FBKData sharedInstance];
  id v7 = [v6 currentUser];

  if (v7)
  {
    objc_super v8 = [v7 teamsContainingContent];
    objc_super v9 = +[FBKData sharedInstance];
    uint64_t v10 = [v9 pendingConsents];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      long long v12 = +[FBKData sharedInstance];
      id v13 = [v12 pendingConsents];
      id v14 = [v13 count];

      if (v14)
      {
        [(FBAMailboxesViewController *)self showLoadingView];
        [(FBAMailboxesViewController *)self setHasFinishedFirstLoad:0];
        id v15 = [(FBAMailboxesViewController *)self splitViewController];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_10002DA00;
        v20[3] = &unk_1000F2518;
        v20[4] = self;
        [v15 drainAndPresentConsentsWithCompletion:v20];

        goto LABEL_14;
      }
    }
    else
    {
    }
    if ([v8 count])
    {
      [(FBAMailboxesViewController *)self hideLoadingView];
      BOOL v16 = [(FBAMailboxesViewController *)self teamSortDescriptors];
      CFStringRef v17 = [v8 sortedArrayUsingDescriptors:v16];
      [(FBAMailboxesViewController *)self setSortedTeams:v17];

      if ([(FBAMailboxesViewController *)self isViewLoaded])
      {
        id v18 = [(FBAMailboxesViewController *)self view];
        id v19 = [v18 window];

        if (v19) {
          [(FBAMailboxesViewController *)self applySnapshotAnimated:v3];
        }
      }
    }
  }
  else
  {
    objc_super v8 = +[FBALog appHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "user is nil, no teams", buf, 2u);
    }
  }
LABEL_14:
}

- (unint64_t)newFeedbackButtonState
{
  v2 = +[NSProcessInfo processInfo];
  BOOL v3 = [v2 environment];
  id v4 = [v3 objectForKeyedSubscript:@"FBK_UNIT_TEST"];

  if (v4) {
    return 1;
  }
  id v6 = +[FBKData sharedInstance];
  id v7 = [v6 currentUser];

  if (v7 && [v7 didFetchFormStubs])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v8 = [v7 teams];
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      unint64_t v5 = 1;
LABEL_7:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        if (![*(id *)(*((void *)&v14 + 1) + 8 * v12) didFetchFormItems]) {
          break;
        }
        if (v10 == (id)++v12)
        {
          id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v10) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:
      unint64_t v5 = 2;
    }
  }
  else
  {
    unint64_t v5 = 1;
  }

  return v5;
}

- (void)createNewFeedback:(id)a3
{
  id v8 = a3;
  id v4 = [(FBAMailboxesViewController *)self sortedTeams];
  id v5 = [v4 count];

  if (v5 == (id)1)
  {
    id v6 = [(FBAMailboxesViewController *)self sortedTeams];
    id v7 = [v6 firstObject];
    [(FBAMailboxesViewController *)self beginBugForTeam:v7 sender:v8];
  }
  else
  {
    [(FBAMailboxesViewController *)self beginBugForTeam:0 sender:v8];
  }
}

- (void)_beginBugForTeam:(id)a3 sender:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  id v7 = +[FBKData sharedInstance];
  id v8 = [v7 currentUser];
  id v9 = [v8 bugFormStubs];
  id v10 = [v9 count];

  if (!v10) {
    [(FBAMailboxesViewController *)self presentNonParticipantView];
  }
  uint64_t v11 = DEDDevicePlatformiOS;
  uint64_t v12 = +[FBKGroupedDevice currentGroupedDevice];
  id v13 = [v12 build];
  long long v14 = [v24 forms];
  long long v15 = +[FBKBugFormStub bugFormStubsMatchingBuild:v13 forPlatform:v11 withStubs:v14];

  if ([v15 count] == (id)1)
  {
    long long v16 = [v15 anyObject];
    long long v17 = [v16 preferredTeamForStubPreferringTeam:v24];
    [(FBAMailboxesViewController *)self tryLaunchingDraft:0 orStub:v16 forTeam:v17 withSender:v6];
  }
  else
  {
    if (v24) {
      +[FBKBugFormStub predicateForTeam:v24];
    }
    else {
    long long v16 = +[FBKBugFormStub predicateForAllStubs];
    }
    long long v17 = [[_TtC18Feedback_Assistant26FBABugFormPickerController alloc] initWithStubsPredicate:v16];
    [(FBABugFormPickerController *)v17 setPickerDelegate:self];
    [(FBABugFormPickerController *)v17 setTeam:v24];
    id v18 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v17];
    [v18 setModalPresentationStyle:7];
    id v19 = [(FBAMailboxesViewController *)self pendingLaunchAction];
    if (v19)
    {
      id v20 = [(FBAMailboxesViewController *)self pendingLaunchAction];
      [v18 setModalInPresentation:[v20 isCaptive]];
    }
    else
    {
      [v18 setModalInPresentation:0];
    }

    id v21 = [v18 popoverPresentationController];
    [v21 setPermittedArrowDirections:2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v21 setBarButtonItem:v6];
    }
    else
    {
      [v21 setSourceView:v6];
      [v6 bounds];
      [v21 setSourceRect:];
    }
    uint64_t v22 = +[iFBAConstants tintColor];
    id v23 = [(FBABugFormPickerController *)v17 view];
    [v23 setTintColor:v22];

    [(FBAMailboxesViewController *)self presentViewController:v18 animated:1 completion:0];
  }
}

- (void)beginBugForTeam:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBAMailboxesViewController *)self data];
  id v9 = [v8 currentUser];
  unsigned __int8 v10 = [v9 hasForms];

  if ((v10 & 1) == 0) {
    [(FBAMailboxesViewController *)self presentNonParticipantView];
  }
  if (v6
    && ([v6 forms],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        id v12 = [v11 count],
        v11,
        v12 == (id)1))
  {
    id v13 = +[FBALog appHandle];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      long long v14 = [v6 name];
      int v18 = 138412290;
      id v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Launching new draft for 1 team [%@] with one form", (uint8_t *)&v18, 0xCu);
    }
    long long v15 = [v6 forms];
    long long v16 = [v15 anyObject];
    [(FBAMailboxesViewController *)self tryLaunchingDraft:0 orStub:v16 forTeam:v6 withSender:v7];
  }
  else
  {
    long long v17 = +[FBALog appHandle];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Launching new draft. Will show form picker ", (uint8_t *)&v18, 2u);
    }

    [(FBAMailboxesViewController *)self _beginBugForTeam:v6 sender:v7];
  }
}

- (void)tryLaunchingDraft:(id)a3 orStub:(id)a4 forTeam:(id)a5 withSender:(id)a6
{
}

- (void)tryLaunchingDraft:(id)a3 orStub:(id)a4 orBugForm:(id)a5 forTeam:(id)a6 withSender:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_10002E3BC;
  v34[4] = sub_10002E3CC;
  long long v17 = self;
  uint64_t v35 = v17;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10002E3D4;
  v28[3] = &unk_1000F3558;
  v28[4] = v17;
  unint64_t v18 = (unint64_t)v13;
  id v29 = (id)v18;
  id v19 = v12;
  id v30 = v19;
  unint64_t v20 = (unint64_t)v14;
  id v31 = (id)v20;
  id v21 = v15;
  id v32 = v21;
  v33 = v34;
  uint64_t v22 = objc_retainBlock(v28);
  id v23 = v22;
  if (v19)
  {
    id v24 = [(FBAMailboxesViewController *)v17 data];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10002E550;
    void v26[3] = &unk_1000F3580;
    id v27 = v23;
    [v24 bugFormFromForDraftItem:v19 withCompletion:v26];

    id v25 = v27;
  }
  else
  {
    if (v18 | v20)
    {
      ((void (*)(void *))v22[2])(v22);
      goto LABEL_7;
    }
    id v25 = +[FBALog appHandle];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1000A5A08();
    }
  }

LABEL_7:
  _Block_object_dispose(v34, 8);
}

- (void)beginPullToRefresh
{
  dispatch_time_t v3 = dispatch_time(0, 250000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E5F8;
  block[3] = &unk_1000F2518;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  [(FBAMailboxesViewController *)self reloadApp];
}

- (void)reloadApp
{
  dispatch_time_t v3 = +[FBALog appHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reloading", buf, 2u);
  }

  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"LOADING_ELLIPSES" value:&stru_1000F6658 table:0];
  [(FBAMailboxesViewController *)self showSpinnerWithStatus:v5 userInteractionEnabled:1];

  id v6 = [(FBAMailboxesViewController *)self data];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002E768;
  v7[3] = &unk_1000F35A8;
  v7[4] = self;
  [v6 reloadAllContentWithCompletion:v7];
}

- (void)didReloadApp
{
  dispatch_time_t v3 = +[FBALog appHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Did reload", buf, 2u);
  }

  [(FBAMailboxesViewController *)self updateUI];
  [(FBAMailboxesViewController *)self hideSpinner];
  [(FBAMailboxesViewController *)self runDelayedUrlActionIfNeeded];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E96C;
  block[3] = &unk_1000F2518;
  block[4] = self;
  if (qword_100124110 != -1) {
    dispatch_once(&qword_100124110, block);
  }
}

- (BOOL)showsEnhancedLoggingSection
{
  v2 = +[FBKEnhancedLoggingPersistence sharedInstance];
  unsigned __int8 v3 = [v2 hasLoggingSessions];

  return v3;
}

- (id)teamForSection:(int64_t)a3
{
  unsigned int v5 = [(FBAMailboxesViewController *)self showsEnhancedLoggingSection];
  uint64_t v6 = -2;
  if (!v5) {
    uint64_t v6 = -1;
  }
  int64_t v7 = v6 + a3 - [(FBAMailboxesViewController *)self isBatchUIEnabled];
  if (v7 < 0
    || ([(FBAMailboxesViewController *)self sortedTeams],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 count],
        v8,
        v7 >= (unint64_t)v9))
  {
    uint64_t v11 = 0;
  }
  else
  {
    unsigned __int8 v10 = [(FBAMailboxesViewController *)self sortedTeams];
    uint64_t v11 = [v10 objectAtIndexedSubscript:v7];
  }

  return v11;
}

- (int64_t)sectionForTeam:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(FBAMailboxesViewController *)self sortedTeams];
  id v6 = [v5 indexOfObject:v4];

  int64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v8 = [(FBAMailboxesViewController *)self showsEnhancedLoggingSection];
    return (int64_t)v6 + v8 + [(FBAMailboxesViewController *)self isBatchUIEnabled] + 1;
  }
  return result;
}

- (id)teamForIndexPath:(id)a3
{
  id v4 = [a3 section];

  return [(FBAMailboxesViewController *)self teamForSection:v4];
}

- (void)beginFeedbackForSurvey:(id)a3 forTeam:(id)a4
{
}

- (void)beginFeedbackWithDraftItem:(id)a3
{
  id v4 = a3;
  id v6 = [v4 singleTeam];
  unsigned int v5 = [(FBAMailboxesViewController *)self composeFeedbackToolbarItem];
  [(FBAMailboxesViewController *)self tryLaunchingDraft:v4 orStub:0 forTeam:v6 withSender:v5];
}

- (void)respondToUrlAction:(id)a3
{
  id v4 = a3;
  if ([v4 launchesFeedback])
  {
    [(FBAMailboxesViewController *)self launchFeedbackDraftWithUrlAction:v4];
  }
  else if ([v4 launchesSurvey])
  {
    [(FBAMailboxesViewController *)self launchSurveyWithUrlAction:v4];
  }
  else if ([v4 launchesInbox])
  {
    [(FBAMailboxesViewController *)self launchInboxWithLaunchAction:v4];
  }
  else if ([v4 launchesBatchUI])
  {
    [(FBAMailboxesViewController *)self showBatchUIWithAction:v4];
  }
  else
  {
    [(FBAMailboxesViewController *)self showItemWithUrlAction:v4];
  }
}

- (void)runDelayedUrlActionIfNeeded
{
  unsigned __int8 v3 = +[FBALog appHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000A5AC0(self, v3);
  }

  id v4 = [(FBAMailboxesViewController *)self delayedUrlAction];

  if (v4)
  {
    unsigned int v5 = [(FBAMailboxesViewController *)self delayedUrlAction];
    unsigned int v6 = [v5 showsItem];

    int64_t v7 = [(FBAMailboxesViewController *)self delayedUrlAction];
    unsigned int v8 = v7;
    if (v6)
    {
      [(FBAMailboxesViewController *)self showItemWithUrlAction:v7];
LABEL_18:

      return;
    }
    if ([v7 launchesFeedback])
    {
      unint64_t v9 = [(FBAMailboxesViewController *)self newFeedbackButtonState];

      if (v9 == 2)
      {
        unsigned int v8 = [(FBAMailboxesViewController *)self delayedUrlAction];
        [(FBAMailboxesViewController *)self launchFeedbackDraftWithUrlAction:v8];
        goto LABEL_18;
      }
    }
    else
    {
    }
    unsigned __int8 v10 = [(FBAMailboxesViewController *)self delayedUrlAction];
    unsigned int v11 = [v10 launchesSurvey];

    id v12 = [(FBAMailboxesViewController *)self delayedUrlAction];
    unsigned int v8 = v12;
    if (v11)
    {
      [(FBAMailboxesViewController *)self launchSurveyWithUrlAction:v12];
    }
    else
    {
      unsigned int v13 = [v12 launchesInbox];

      id v14 = [(FBAMailboxesViewController *)self delayedUrlAction];
      unsigned int v8 = v14;
      if (v13)
      {
        [(FBAMailboxesViewController *)self launchInboxWithLaunchAction:v14];
      }
      else
      {
        unsigned int v15 = [v14 launchesBatchUI];

        if (v15)
        {
          unsigned int v8 = [(FBAMailboxesViewController *)self delayedUrlAction];
          [(FBAMailboxesViewController *)self showBatchUIWithAction:v8];
        }
        else
        {
          unsigned int v8 = +[FBALog appHandle];
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
            sub_1000A5A3C(v8);
          }
        }
      }
    }
    goto LABEL_18;
  }
}

- (BOOL)canLaunchFeedbackDraft
{
  unsigned __int8 v3 = [(FBAMailboxesViewController *)self splitViewController];
  id v4 = [v3 topMostController];

  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  if ([(FBAMailboxesViewController *)self isViewLoaded])
  {
    unsigned int v6 = [(FBAMailboxesViewController *)self view];
    int64_t v7 = [v6 window];
    if (v7)
    {
      unsigned int v8 = [(FBAMailboxesViewController *)self data];
      if ([v8 isRefreshingForms]) {
        LOBYTE(v9) = 0;
      }
      else {
        unsigned int v9 = [(FBAMailboxesViewController *)self hasLoadedFormItems] & (isKindOfClass ^ 1);
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)canLaunchSurveyDraft
{
  if (![(FBAMailboxesViewController *)self isViewLoaded]) {
    return 0;
  }
  unsigned __int8 v3 = [(FBAMailboxesViewController *)self view];
  id v4 = [v3 window];
  if (v4 && [(FBAMailboxesViewController *)self hasFinishedFirstLoad])
  {
    unsigned int v5 = [(FBAMailboxesViewController *)self data];
    unsigned int v6 = [v5 currentUser];
    int64_t v7 = [v6 contentItems];
    BOOL v8 = [v7 count] != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)canShowItems
{
  if (![(FBAMailboxesViewController *)self isViewLoaded]) {
    return 0;
  }
  unsigned __int8 v3 = [(FBAMailboxesViewController *)self view];
  id v4 = [v3 window];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)canShowBatchUIWithAction:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(FBAMailboxesViewController *)self isViewLoaded];
  if (v4)
  {
    if (v5)
    {
      unsigned int v6 = [(FBAMailboxesViewController *)self view];
      int64_t v7 = [v6 window];
      if (v7) {
        unsigned __int8 v8 = [(FBAMailboxesViewController *)self hasFinishedFirstLoad];
      }
      else {
        unsigned __int8 v8 = 0;
      }
      goto LABEL_9;
    }
  }
  else if (v5)
  {
    unsigned int v6 = [(FBAMailboxesViewController *)self view];
    int64_t v7 = [v6 window];
    unsigned __int8 v8 = v7 != 0;
LABEL_9:

    goto LABEL_10;
  }
  unsigned __int8 v8 = 0;
LABEL_10:

  return v8;
}

- (void)showItemWithUrlAction:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(FBAMailboxesViewController *)self canShowItems];
  unsigned int v6 = +[FBALog appHandle];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543362;
      id v32 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Executing show url action [%{public}@]", buf, 0xCu);
    }

    [(FBAMailboxesViewController *)self setDelayedUrlAction:0];
    if (([v4 isFFUAction] & 1) != 0
      || ([v4 isShowContentItemAction] & 1) != 0)
    {
      unsigned __int8 v8 = [(FBAMailboxesViewController *)self data];
      unsigned int v9 = [v8 currentUser];
      unsigned __int8 v10 = [v9 contentItems];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10002F5B4;
      v29[3] = &unk_1000F3170;
      id v11 = v4;
      id v30 = v11;
      id v12 = [v10 ded_findWithBlock:v29];

      if (v12)
      {
        if ([v11 isShowContentItemAction])
        {
          [(FBAMailboxesViewController *)self setPendingItemToShow:v12];
          [(FBAMailboxesViewController *)self setPendingLaunchAction:v11];
          unsigned int v13 = [(FBAMailboxesViewController *)self inboxes];
          id v14 = [v13 indexOfObjectPassingTest:&stru_1000F35E8];

          if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v19 = [v12 singleTeam];
            int64_t v20 = [(FBAMailboxesViewController *)self sectionForTeam:v19];

            id v21 = +[NSIndexPath indexPathForRow:v14 inSection:v20];
            uint64_t v22 = [(FBAMailboxesViewController *)self splitViewController];
            LOBYTE(v20) = [v22 isCollapsed];

            if ((v20 & 1) == 0) {
              [(FBAMailboxesViewController *)self performSegueWithIdentifier:@"FBAInboxItemsPresentation" sender:v21];
            }
            [(FBAMailboxesViewController *)self performSegueWithIdentifier:@"FBAFollowupDetailPresentation" sender:self];

            goto LABEL_21;
          }
          unsigned int v15 = +[FBALog appHandle];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_1000A5BB0();
          }
        }
        else
        {
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_10002F674;
          v28[3] = &unk_1000F2518;
          v28[4] = self;
          long long v17 = objc_retainBlock(v28);
          unint64_t v18 = [(FBAMailboxesViewController *)self data];
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_10002F804;
          v23[3] = &unk_1000F3680;
          id v24 = v11;
          id v27 = v17;
          id v25 = v12;
          id v26 = self;
          unsigned int v15 = v17;
          [v18 getFeedbackForContentItem:v25 completion:v23];
        }
      }
      else
      {
        unsigned int v15 = +[FBALog appHandle];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_1000A5B48();
        }
      }

LABEL_21:
      goto LABEL_22;
    }
    id v16 = +[FBALog appHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000A5BE4();
    }
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543362;
      id v32 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Delaying show url action [%{public}@]", buf, 0xCu);
    }

    [(FBAMailboxesViewController *)self setDelayedUrlAction:v4];
  }
LABEL_22:
}

- (void)launchInboxWithLaunchAction:(id)a3
{
  id v4 = a3;
  if ([(FBAMailboxesViewController *)self canShowItems])
  {
    unsigned __int8 v5 = [(FBAMailboxesViewController *)self sortedTeams];
    unsigned int v6 = [v5 firstObject];

    if (!v6)
    {
      id v14 = +[FBALog appHandle];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000A5DD0();
      }
      goto LABEL_14;
    }
    if (![(FBAMailboxesViewController *)self userIsEnrolledInAnySeedingProgram])
    {
      BOOL v7 = [(FBAMailboxesViewController *)self sortedTeams];
      unsigned __int8 v8 = [v7 firstObject];
      int64_t v9 = [(FBAMailboxesViewController *)self sectionForTeam:v8];

      unsigned __int8 v10 = [(FBAMailboxesViewController *)self inboxes];
      id v11 = [v10 indexOfObjectPassingTest:&stru_1000F36A0];

      if (v11 != (id)0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(FBAMailboxesViewController *)self setPendingLaunchAction:v4];
        id v12 = +[NSIndexPath indexPathForRow:v11 inSection:v9];
        [(FBAMailboxesViewController *)self performSegueWithIdentifier:@"FBAInboxItemsPresentation" sender:v12];

        goto LABEL_15;
      }
      id v14 = +[FBALog appHandle];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000A5E04();
      }
LABEL_14:
    }
  }
  else
  {
    unsigned int v13 = +[FBALog appHandle];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v15 = 138543362;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Delaying inbox action [%{public}@]", (uint8_t *)&v15, 0xCu);
    }

    [(FBAMailboxesViewController *)self setDelayedUrlAction:v4];
  }
LABEL_15:
}

- (void)launchSurveyWithUrlAction:(id)a3
{
  id v4 = a3;
  if ([(FBAMailboxesViewController *)self canLaunchSurveyDraft])
  {
    [(FBAMailboxesViewController *)self setDelayedUrlAction:0];
    unsigned __int8 v5 = +[FBALog appHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Executing launch url action [%{public}@]", buf, 0xCu);
    }

    if ([v4 launchesSurvey])
    {
      [(FBAMailboxesViewController *)self setPendingLaunchAction:v4];
      unsigned int v6 = [(FBAMailboxesViewController *)self data];
      BOOL v7 = [v6 currentUser];
      unsigned __int8 v8 = [v7 contentItems];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100030108;
      v21[3] = &unk_1000F3170;
      id v9 = v4;
      id v22 = v9;
      unsigned __int8 v10 = [v8 ded_findWithBlock:v21];

      id v11 = +[FBKData sharedInstance];
      id v12 = [v11 defaultTeam];

      unsigned int v13 = +[FBALog appHandle];
      id v14 = v13;
      if (v10)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Found survey content item without reload", buf, 2u);
        }

        [(FBAMailboxesViewController *)self reallyLaunchSurveyWithUrlAction:v9 team:v12 surveyItem:v10];
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Targeted survey not found. Will load content items", buf, 2u);
        }

        long long v17 = +[FBKData sharedInstance];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000301A4;
        v18[3] = &unk_1000F36C8;
        v18[4] = self;
        id v19 = v9;
        id v20 = v12;
        [v17 reloadItems:v20 completion:v18];
      }
    }
    else
    {
      id v16 = +[FBALog appHandle];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        sub_1000A5E88(v16);
      }
    }
  }
  else
  {
    int v15 = +[FBALog appHandle];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Delaying survey launch url action [%{public}@]", buf, 0xCu);
    }

    [(FBAMailboxesViewController *)self setDelayedUrlAction:v4];
  }
}

- (void)reallyLaunchSurveyWithUrlAction:(id)a3 team:(id)a4 surveyItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[FBKData sharedInstance];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000304BC;
  v15[3] = &unk_1000F36F0;
  id v16 = v8;
  long long v17 = self;
  id v18 = v10;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  [v11 refreshSurveyFromContentItem:v13 forTeam:v12 completion:v15];
}

- (void)showTargetedSurveyLoadErrorAlert
{
  unsigned __int8 v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"SURVEY_LOAD_ERROR_TITLE" value:&stru_1000F6658 table:0];
  unsigned __int8 v5 = +[NSBundle mainBundle];
  unsigned int v6 = [v5 localizedStringForKey:@"SURVEY_LOAD_ERROR_MESSAGE" value:&stru_1000F6658 table:0];
  id v10 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  BOOL v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"OK" value:&stru_1000F6658 table:0];
  id v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:&stru_1000F3710];
  [v10 addAction:v9];

  [(FBAMailboxesViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)showTargetedFeedbackLoadErrorAlert
{
  unsigned __int8 v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"GENERIC_DRAFT_LOAD_ERROR_TITLE" value:&stru_1000F6658 table:0];
  unsigned __int8 v5 = +[NSBundle mainBundle];
  unsigned int v6 = [v5 localizedStringForKey:@"GENERIC_DRAFT_LOAD_ERROR_MESSAGE" value:&stru_1000F6658 table:0];
  id v10 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  BOOL v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"OK" value:&stru_1000F6658 table:0];
  id v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:&stru_1000F3730];
  [v10 addAction:v9];

  [(FBAMailboxesViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)launchFeedbackDraftWithUrlAction:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(FBAMailboxesViewController *)self canLaunchFeedbackDraft];
  unsigned int v6 = +[FBALog appHandle];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543362;
      id v48 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Executing launch url action [%{public}@]", buf, 0xCu);
    }

    [(FBAMailboxesViewController *)self setDelayedUrlAction:0];
    id v8 = +[FBKData sharedInstance];
    id v9 = [v8 defaultTeam];

    if (![v4 launchesFeedback]) {
      goto LABEL_33;
    }
    [(FBAMailboxesViewController *)self setPendingLaunchAction:v4];
    id v10 = [v4 formIdentifier];

    if (v10)
    {
      id v11 = +[FBKData sharedInstance];
      id v12 = [v11 currentUser];
      id v13 = [v12 bugFormStubs];
      [v4 findExactMatchFormStubAndTeamWithFormStubs:v13];

      id v14 = [v4 exactMatchFormStub];

      if (v14)
      {
        int v15 = +[FBALog appHandle];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = [v4 formIdentifier];
          long long v17 = [v4 exactMatchFormStub];
          id v18 = [v17 ID];
          unsigned int v19 = [v18 intValue];
          *(_DWORD *)buf = 138543618;
          id v48 = v16;
          __int16 v49 = 1024;
          LODWORD(v50) = v19;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "URL Action with formIdentifier [%{public}@] matched formStub [%i]", buf, 0x12u);
        }
        id v20 = [v4 exactMatchFormStub];
        id v21 = [v4 teamForExactMatchFormStub];
        id v22 = [(FBAMailboxesViewController *)self composeFeedbackToolbarItem];
        [(FBAMailboxesViewController *)self tryLaunchingDraft:0 orStub:v20 forTeam:v21 withSender:v22];

        goto LABEL_32;
      }
      unsigned int v34 = [v4 comesFromFeedbackd];
      uint64_t v35 = +[FBALog appHandle];
      BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      if (v34)
      {
        if (v36)
        {
          id v37 = [v4 formIdentifier];
          *(_DWORD *)buf = 138543362;
          id v48 = v37;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Form with identifier [%{public}@] not found. Will fetch by tat", buf, 0xCu);
        }
        uint64_t v38 = +[FBKData sharedInstance];
        long long v39 = [v4 formIdentifier];
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_100030ED8;
        v44[3] = &unk_1000F2968;
        id v45 = v4;
        long long v46 = self;
        [v38 fetchFormItemByTat:v39 completion:v44];

        id v20 = v45;
        goto LABEL_32;
      }
      if (!v36)
      {
LABEL_27:

        id v20 = [(FBAMailboxesViewController *)self composeFeedbackToolbarItem];
        [(FBAMailboxesViewController *)self _beginBugForTeam:v9 sender:v20];
LABEL_32:

LABEL_33:
        goto LABEL_34;
      }
      *(_DWORD *)buf = 138543362;
      id v48 = v4;
      long long v40 = "Could not find form with identifier from Launch Action [%{public}@]. Will show picker";
    }
    else
    {
      id v23 = [v4 bugFormID];

      if (v23)
      {
        id v24 = [(FBAMailboxesViewController *)self data];
        id v25 = [v24 currentUser];
        id v20 = [v25 uniqueFormStubsWithPreferredTeam:v9];

        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_10003102C;
        v42[3] = &unk_1000F3758;
        id v26 = v4;
        id v43 = v26;
        id v27 = [v20 ded_findWithBlock:v42];
        v28 = +[FBALog appHandle];
        BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
        if (v27)
        {
          if (v29)
          {
            id v30 = [v27 ID];
            unsigned int v31 = [v30 intValue];
            *(_DWORD *)buf = 67109120;
            LODWORD(v48) = v31;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "URL Action matched one form item [%i]", buf, 8u);
          }
          [v26 setExactMatchFormStub:v27];
          id v32 = [v26 exactMatchFormStub];
          v33 = [(FBAMailboxesViewController *)self composeFeedbackToolbarItem];
          [(FBAMailboxesViewController *)self tryLaunchingDraft:0 orStub:v32 forTeam:v9 withSender:v33];
        }
        else
        {
          if (v29)
          {
            long long v41 = [v26 bugFormID];
            *(_DWORD *)buf = 138543618;
            id v48 = v41;
            __int16 v49 = 2114;
            id v50 = v26;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Could not find form with formID [%{public}@] from Launch Action [%{public}@]. Will show picker", buf, 0x16u);
          }
          id v32 = [(FBAMailboxesViewController *)self composeFeedbackToolbarItem];
          [(FBAMailboxesViewController *)self _beginBugForTeam:v9 sender:v32];
        }

        goto LABEL_32;
      }
      uint64_t v35 = +[FBALog appHandle];
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      *(_DWORD *)buf = 138543362;
      id v48 = v4;
      long long v40 = "Launch Action [%{public}@] will show picker";
    }
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v40, buf, 0xCu);
    goto LABEL_27;
  }
  if (v7)
  {
    *(_DWORD *)buf = 138543362;
    id v48 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Delaying launch url action [%{public}@]", buf, 0xCu);
  }

  [(FBAMailboxesViewController *)self setDelayedUrlAction:v4];
LABEL_34:
}

- (void)showBatchUIWithAction:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[FBALog appHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v27 = "-[FBAMailboxesViewController showBatchUIWithAction:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}s", buf, 0xCu);
  }

  if ([(FBAMailboxesViewController *)self canShowBatchUIWithAction:v4])
  {
    [(FBAMailboxesViewController *)self setDelayedUrlAction:0];
    unsigned int v6 = +[UIApplication sharedApplication];
    BOOL v7 = [v6 delegate];

    id v8 = [(FBAMailboxesViewController *)self traitCollection];
    id v9 = [v8 userInterfaceIdiom];

    if (!v9) {
      [v7 blockLandscapeOrientations:1];
    }
    id v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    id v22 = sub_100031314;
    id v23 = &unk_1000F26D8;
    id v24 = self;
    id v25 = v7;
    id v10 = v7;
    id v11 = [(FBAMailboxesViewController *)self batchEvaluationViewControllerWithUseNavigationStack:1 showsCloseButton:1 onDismiss:&v20];
    id v12 = [(FBAMailboxesViewController *)self splitViewController];
    id v13 = [v12 view];
    [v13 frame];
    double v15 = v14;
    double v17 = v16;

    [v11 setPreferredContentSize:v15 * 0.95, v17 * 0.95];
    id v18 = [(FBAMailboxesViewController *)self splitViewController];
    [v18 presentViewController:v11 animated:1 completion:0];
  }
  else
  {
    unsigned int v19 = +[FBALog appHandle];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Delaying batch UI url action", buf, 2u);
    }

    [(FBAMailboxesViewController *)self setDelayedUrlAction:v4];
  }
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v36 = a3;
  id v6 = a4;
  BOOL v7 = [v36 identifier];
  if ([v7 isEqualToString:@"FBAInboxItemsPresentation"])
  {
    id v8 = [v36 destinationViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v6;
      id v10 = [(FBAMailboxesViewController *)self data];
      id v11 = [v10 currentUser];
      id v12 = [(FBAMailboxesViewController *)self data];
      id v13 = [v12 mainQueueContext];
      double v14 = +[FBKTeam personalTeamForUser:v11 inContext:v13];

      [v8 setShowingSyntheticInbox:1];
LABEL_15:
      [v8 setInbox:v9];
      [v8 setTeam:v14];
      v33 = [(FBAMailboxesViewController *)self splitViewController];
      unsigned __int8 v34 = [v33 isCollapsed];

      if ((v34 & 1) == 0)
      {
        uint64_t v35 = [(FBAMailboxesViewController *)self splitViewController];
        [v35 dismissSecondaryOrShowEmptyViewControllerAnimated:1];
      }
      [(FBAMailboxesViewController *)self setPendingLaunchAction:0];

      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v14 = 0;
      id v9 = 0;
      goto LABEL_15;
    }
    id v17 = v6;
    id v18 = [(FBAMailboxesViewController *)self inboxes];
    [v18 objectAtIndexedSubscript:[v17 row]];
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    double v14 = [(FBAMailboxesViewController *)self teamForIndexPath:v17];
    unsigned int v19 = [(FBAMailboxesViewController *)self pendingLaunchAction];
    if ([v19 launchesInbox])
    {
    }
    else
    {
      BOOL v29 = [(FBAMailboxesViewController *)self pendingLaunchAction];
      unsigned int v30 = [v29 isShowContentItemAction];

      if (!v30)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    uint64_t v31 = [v14 canStartNewFeedback] ^ 1;
    id v32 = [v8 navigationItem];
    [v32 setHidesBackButton:v31];

    goto LABEL_14;
  }
  if ([v7 isEqualToString:@"FBAFollowupResponsePresentation"])
  {
    id v8 = [v36 destinationViewController];
    id v9 = [v8 topViewController];
    double v15 = [(FBAMailboxesViewController *)self pendingFollowupToShow];
    [v9 setFollowup:v15];

    double v16 = [(FBAMailboxesViewController *)self pendingItemToShow];
    [v9 setContentItem:v16];

    [(FBAMailboxesViewController *)self setPendingFollowupToShow:0];
    [(FBAMailboxesViewController *)self setPendingItemToShow:0];
    [(FBAMailboxesViewController *)self setPendingLaunchAction:0];
LABEL_18:

    goto LABEL_19;
  }
  if (![v7 isEqualToString:@"FBAFollowupDetailPresentation"]) {
    goto LABEL_20;
  }
  id v20 = [v36 destinationViewController];
  uint64_t v21 = [v20 viewControllers];
  id v22 = [v21 objectAtIndexedSubscript:0];

  id v8 = v22;
  id v23 = [(FBAMailboxesViewController *)self pendingItemToShow];
  [v8 setContentItem:v23];

  id v24 = [(FBAMailboxesViewController *)self data];
  id v25 = [v24 currentUser];
  id v26 = [v25 bugFormStubs];
  BOOL v27 = [v26 count] == 0;
  v28 = [v8 navigationItem];

  [v28 setHidesBackButton:v27];
  [(FBAMailboxesViewController *)self setPendingItemToShow:0];
  [(FBAMailboxesViewController *)self setPendingLaunchAction:0];
LABEL_19:

LABEL_20:
}

- (void)showSettings
{
}

- (void)showLoadingView
{
  unsigned __int8 v3 = +[FBALog appHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Showing main loading view", v5, 2u);
  }

  [(FBAMailboxesViewController *)self setHideAllInboxes:1];
  id v4 = +[UIContentUnavailableConfiguration loadingConfiguration];
  [(FBAMailboxesViewController *)self setContentUnavailableConfiguration:v4];
}

- (void)hideLoadingView
{
  unsigned __int8 v3 = +[FBADraftManager sharedInstance];
  unsigned int v4 = [v3 inboxLiteMode];

  if (v4)
  {
    unsigned __int8 v5 = +[FBALog appHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Will not show content items in main view", v6, 2u);
    }
  }
  else
  {
    [(FBAMailboxesViewController *)self setHideAllInboxes:0];
    [(FBAMailboxesViewController *)self setContentUnavailableConfiguration:0];
  }
}

- (void)setFBAPreferencesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = +[FBALog appHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 136446466;
    id v9 = "-[FBAMailboxesViewController setFBAPreferencesEnabled:]";
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}s: %i", (uint8_t *)&v8, 0x12u);
  }

  id v6 = [(FBAMailboxesViewController *)self navigationItem];
  BOOL v7 = [v6 _largeTitleAccessoryView];
  [v7 setEnabled:v3];
}

- (BOOL)userIsEnrolledInAnySeedingProgram
{
  v2 = [(FBAMailboxesViewController *)self sortedTeams];
  BOOL v3 = [v2 firstObject];
  unsigned __int8 v4 = [v3 canStartNewFeedback];

  return v4;
}

- (void)bugFormPicker:(id)a3 didSelectBugFormStub:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(FBAMailboxesViewController *)self dismissViewControllerAnimated:1 completion:0];
  int v8 = [v7 team];

  id v9 = [v6 preferredTeamForStubPreferringTeam:v8];

  __int16 v10 = +[FBALog appHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = [v6 debugDescription];
    id v12 = [v9 shortDescription];
    int v13 = 138543618;
    double v14 = v11;
    __int16 v15 = 2114;
    double v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Did pick Form [%{public}@], preferred team [%{public}@] ", (uint8_t *)&v13, 0x16u);
  }
  [(FBAMailboxesViewController *)self tryLaunchingDraft:0 orStub:v6 forTeam:v9 withSender:0];
}

- (void)bugFormPickerDidCancel:(id)a3
{
  uint64_t v4 = [(FBAMailboxesViewController *)self pendingLaunchAction];
  if (v4)
  {
    unsigned __int8 v5 = (void *)v4;
    id v6 = [(FBAMailboxesViewController *)self pendingLaunchAction];
    unsigned int v7 = [v6 isCaptive];

    if (v7)
    {
      int v8 = +[FBALog appHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Bug form picker cancelled, exiting restricted mode.", v10, 2u);
      }

      id v9 = [(FBAMailboxesViewController *)self pendingLaunchAction];
      +[iFBKUtils exitCaptiveModeRemovingFromHomeScreen:](iFBKUtils, "exitCaptiveModeRemovingFromHomeScreen:", [v9 shouldMakeFBAVisible]);
    }
  }
}

- (FBAResponseSummaryViewController)detailViewController
{
  return self->_detailViewController;
}

- (void)setDetailViewController:(id)a3
{
}

- (BOOL)isApplyingSnapshot
{
  return self->_isApplyingSnapshot;
}

- (void)setIsApplyingSnapshot:(BOOL)a3
{
  self->_isApplyingSnapshot = a3;
}

- (BOOL)isBatchUIEnabled
{
  return self->_isBatchUIEnabled;
}

- (void)setIsBatchUIEnabled:(BOOL)a3
{
  self->_isBatchUIEnabled = a3;
}

- (NSArray)inboxes
{
  return self->_inboxes;
}

- (void)setInboxes:(id)a3
{
}

- (NSArray)smartMailboxes
{
  return self->_smartMailboxes;
}

- (void)setSmartMailboxes:(id)a3
{
}

- (_TtC18Feedback_Assistant23FBAEnhancedLoggingInbox)enhancedLoggingInbox
{
  return self->_enhancedLoggingInbox;
}

- (void)setEnhancedLoggingInbox:(id)a3
{
}

- (NSArray)sortedTeams
{
  return self->_sortedTeams;
}

- (void)setSortedTeams:(id)a3
{
}

- (NSArray)teamSortDescriptors
{
  return self->_teamSortDescriptors;
}

- (void)setTeamSortDescriptors:(id)a3
{
}

- (BOOL)showsFormsCount
{
  return self->_showsFormsCount;
}

- (void)setShowsFormsCount:(BOOL)a3
{
  self->_showsFormsCount = a3;
}

- (NSMutableArray)fbaDataObservers
{
  return self->_fbaDataObservers;
}

- (void)setFbaDataObservers:(id)a3
{
}

- (FBKLaunchAction)delayedUrlAction
{
  return self->_delayedUrlAction;
}

- (void)setDelayedUrlAction:(id)a3
{
}

- (FBKContentItem)pendingItemToShow
{
  return self->_pendingItemToShow;
}

- (void)setPendingItemToShow:(id)a3
{
}

- (FBKFeedbackFollowup)pendingFollowupToShow
{
  return self->_pendingFollowupToShow;
}

- (void)setPendingFollowupToShow:(id)a3
{
}

- (BOOL)hideAllInboxes
{
  return self->_hideAllInboxes;
}

- (void)setHideAllInboxes:(BOOL)a3
{
  self->_hideAllInboxes = a3;
}

- (BOOL)hasLoadedFormItems
{
  return self->_hasLoadedFormItems;
}

- (void)setHasLoadedFormItems:(BOOL)a3
{
  self->_hasLoadedFormItems = a3;
}

- (BOOL)hasFinishedFirstLoad
{
  return self->_hasFinishedFirstLoad;
}

- (void)setHasFinishedFirstLoad:(BOOL)a3
{
  self->_hasFinishedFirstLoad = a3;
}

- (FBKLaunchAction)pendingLaunchAction
{
  return self->_pendingLaunchAction;
}

- (void)setPendingLaunchAction:(id)a3
{
}

- (FBKData)data
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_data);

  return (FBKData *)WeakRetained;
}

- (void)setData:(id)a3
{
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (void)setRefreshControl:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_destroyWeak((id *)&self->_data);
  objc_storeStrong((id *)&self->_pendingLaunchAction, 0);
  objc_storeStrong((id *)&self->_pendingFollowupToShow, 0);
  objc_storeStrong((id *)&self->_pendingItemToShow, 0);
  objc_storeStrong((id *)&self->_delayedUrlAction, 0);
  objc_storeStrong((id *)&self->_fbaDataObservers, 0);
  objc_storeStrong((id *)&self->_teamSortDescriptors, 0);
  objc_storeStrong((id *)&self->_sortedTeams, 0);
  objc_storeStrong((id *)&self->_enhancedLoggingInbox, 0);
  objc_storeStrong((id *)&self->_smartMailboxes, 0);
  objc_storeStrong((id *)&self->_inboxes, 0);

  objc_storeStrong((id *)&self->_detailViewController, 0);
}

- (id)batchUICellWithCollectionView:(id)a3 indexPath:(id)a4 reuseIdentifier:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  __int16 v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = self;
  id v13 = sub_100056DAC(v11, (uint64_t)v10);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (void)presentNonParticipantView
{
  v2 = self;
  sub_1000572EC();
}

- (void)launchNewDraftViewControllerWithBugFormStub:(id)a3 draftItem:(id)a4 surveyBugForm:(id)a5 launchAction:(id)a6 team:(id)a7 completion:(id)a8
{
  id v13 = (uint64_t (*)())_Block_copy(a8);
  if (v13)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    id v13 = sub_10005954C;
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v19 = a3;
  id v18 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v21 = self;
  sub_100057510(a3, a4, a5, a6, (uint64_t)a7, (uint64_t)v13, v14);
  sub_100059188((uint64_t)v13);
}

- (void)controllerWillFinishSubmission:(id)a3
{
}

- (void)controllerWillResignFirstActive:(id)a3
{
}

- (void)controller:(id)a3 didFinishSubmissionWithError:(id)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = a4;
  _sSo26FBAMailboxesViewControllerC18Feedback_AssistantE10controller_28didFinishSubmissionWithErrorySo015FBKBugFormTablebC0C_s0K0_pSgtF_0(v6);
}

- (void)controller:(id)a3 didFailToLoadDraftWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  uint64_t v7 = self;
  _sSo26FBAMailboxesViewControllerC18Feedback_AssistantE10controller_27didFailToLoadDraftWithErrorySo015FBKBugFormTablebC0C_s0M0_ptF_0();
}

- (void)controller:(id)a3 didRequestDismissalWithSavedDraft:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  _sSo26FBAMailboxesViewControllerC18Feedback_AssistantE10controller_33didRequestDismissalWithSavedDraftySo015FBKBugFormTablebC0C_SbtF_0(v5);
}

- (id)batchEvaluationViewControllerWithUseNavigationStack:(BOOL)a3 showsCloseButton:(BOOL)a4 onDismiss:(id)a5
{
  id v6 = _Block_copy(a5);
  *(void *)(swift_allocObject() + 16) = v6;
  type metadata accessor for ScoreController();
  swift_allocObject();
  uint64_t v7 = self;
  swift_retain();
  ScoreController.init()();
  id v8 = objc_allocWithZone((Class)type metadata accessor for BatchEvaluationViewController());
  uint64_t v9 = (void *)BatchEvaluationViewController.init(scoreController:useNavigationStack:showsCloseButton:onDismiss:)();

  swift_release();

  return v9;
}

- (void)shouldShowBatchUIWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  type metadata accessor for BatchEvaluationViewController();
  id v5 = self;
  static BatchEvaluationViewController.shouldShowBatchUI(completion:)();

  swift_release();
}

@end