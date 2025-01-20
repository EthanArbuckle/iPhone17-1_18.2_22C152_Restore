@interface GKTurnBasedMatchesViewController
- (BOOL)_gkShouldRefreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
- (BOOL)isInGame;
- (BOOL)isLoadingOrRemovingPreloadedMatch;
- (BOOL)showExistingMatches;
- (BOOL)showPlay;
- (BOOL)showQuit;
- (GKCollectionViewController)masterViewController;
- (GKGame)game;
- (GKMatchRequest)matchRequest;
- (GKTurnBasedInviteViewController)inviteController;
- (GKTurnBasedMatchesDataSource)matchesDataSource;
- (GKTurnBasedMatchesViewController)init;
- (GKTurnBasedMatchesViewController)initWithMatchRequest:(id)a3;
- (GKTurnBasedMatchesViewControllerDelegate)delegate;
- (NSString)matchIDWaitingForTurnEvent;
- (UIFocusGuide)detailButtonFocusGuide;
- (double)initialSectionHeaderHeight;
- (int64_t)maxMatchesSeen;
- (void)_gkRestorePopoverWithViewControllers:(id)a3 completion:(id)a4;
- (void)acceptInviteForMatch:(id)a3;
- (void)addPressed;
- (void)applicationDidEnterBackground;
- (void)cancelButtonPressed;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)configureCollectionViewFocusGuide;
- (void)configureDataSource;
- (void)configureDetailButtonFocusGuide;
- (void)configureHeader:(id)a3 indexPath:(id)a4;
- (void)configureNavigationBarFocusGuide;
- (void)configureViewFactories;
- (void)dealloc;
- (void)didEnterNoContentState;
- (void)dismissDetailViewControllerAnimated:(BOOL)a3;
- (void)dismissDetailViewControllerInPopover:(BOOL)a3 completion:(id)a4;
- (void)handleTurnBasedEvent:(id)a3;
- (void)launchGameAndShowMatch:(id)a3;
- (void)loadDataWithCompletionHandlerAndError:(id)a3;
- (void)notifyGameWithMatch:(id)a3 orError:(id)a4;
- (void)presentNavigationControllerInPopover:(id)a3 fromCell:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setDetailButtonFocusGuide:(id)a3;
- (void)setGame:(id)a3;
- (void)setInitialSectionHeaderHeight:(double)a3;
- (void)setInviteController:(id)a3;
- (void)setMasterViewController:(id)a3;
- (void)setMatchIDWaitingForTurnEvent:(id)a3;
- (void)setMatchRequest:(id)a3;
- (void)setMatchesDataSource:(id)a3;
- (void)setMaxMatchesSeen:(int64_t)a3;
- (void)setShowExistingMatches:(BOOL)a3;
- (void)setShowPlay:(BOOL)a3;
- (void)setShowQuit:(BOOL)a3;
- (void)showDetailForMatch:(id)a3;
- (void)showInviteControllerAnimated:(BOOL)a3;
- (void)showMatch:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)turnBasedInviteViewController:(id)a3 didCreateMatchID:(id)a4;
- (void)turnBasedInviteViewController:(id)a3 didFailWithError:(id)a4;
- (void)turnBasedInviteViewControllerWasCancelled:(id)a3;
- (void)turnBasedMatchDetailViewControllerDidAcceptInvitation:(id)a3;
- (void)turnBasedMatchDetailViewControllerDidChooseMatch:(id)a3;
- (void)turnBasedMatchDetailViewControllerDidDeclineInvitation:(id)a3;
- (void)turnBasedMatchDetailViewControllerDidQuitMatch:(id)a3;
- (void)turnBasedMatchDetailViewControllerDidRemoveMatch:(id)a3;
- (void)turnBasedMatchDetailViewControllerDidShowStore:(id)a3;
- (void)turnBasedMatchesDataSource:(id)a3 didQuitMatch:(id)a4;
- (void)updateUIBasedOnTraitCollection;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation GKTurnBasedMatchesViewController

- (GKTurnBasedMatchesViewController)init
{
  v3 = objc_alloc_init(GKGridLayout);
  v7.receiver = self;
  v7.super_class = (Class)GKTurnBasedMatchesViewController;
  v4 = [(GKCollectionViewController *)&v7 initWithCollectionViewLayout:v3];

  if (v4)
  {
    [(GKTurnBasedMatchesViewController *)v4 setRestorationClass:objc_opt_class()];
    [(GKTurnBasedMatchesViewController *)v4 setRestorationIdentifier:@"TurnBasedMatches"];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel_applicationDidEnterBackground name:*MEMORY[0x1E4FB2640] object:0];

    v4->_showPlay = 1;
    v4->_showQuit = 1;
  }
  return v4;
}

- (GKTurnBasedMatchesViewController)initWithMatchRequest:(id)a3
{
  id v5 = a3;
  v6 = [(GKTurnBasedMatchesViewController *)self init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_matchRequest, a3);
  }

  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)GKTurnBasedMatchesViewController;
  [(GKCollectionViewController *)&v5 dealloc];
}

- (void)setGame:(id)a3
{
  objc_super v7 = (GKGame *)a3;
  if (self->_game != v7)
  {
    objc_storeStrong((id *)&self->_game, a3);
    objc_super v5 = [(GKGame *)v7 name];
    v6 = [(GKTurnBasedMatchesViewController *)self navigationItem];
    [v6 setTitle:v5];
  }
}

- (BOOL)isInGame
{
  v2 = [(GKTurnBasedMatchesViewController *)self delegate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)configureDataSource
{
  BOOL v3 = objc_alloc_init(GKTurnBasedMatchesDataSource);
  [(GKTurnBasedMatchesViewController *)self setMatchesDataSource:v3];

  [(GKTurnBasedMatchesDataSource *)self->_matchesDataSource configureDataSource];
  [(GKTurnBasedMatchesDataSource *)self->_matchesDataSource setGame:self->_game];
  v4 = +[GKGridLayoutMetrics metrics];
  [v4 padding];
  [v4 setPadding:0.0];
  [v4 sectionHeaderHeight];
  self->_initialSectionHeaderHeight = v5;
  [(GKCollectionViewDataSource *)self->_matchesDataSource setDefaultSectionMetrics:v4];
  [(GKCollectionViewController *)self setDataSource:self->_matchesDataSource];
  v6.receiver = self;
  v6.super_class = (Class)GKTurnBasedMatchesViewController;
  [(GKCollectionViewController *)&v6 configureDataSource];
}

- (void)configureViewFactories
{
  BOOL v3 = [(GKCollectionViewController *)self collectionView];
  [v3 _gkRegisterClass:objc_opt_class() forSupplementaryViewOfKind:@"SectionHeader"];

  matchesDataSource = self->_matchesDataSource;
  uint64_t v5 = objc_opt_class();

  [(GKCollectionViewDataSource *)matchesDataSource registerSupplementaryViewOfKind:@"SectionHeader" withClass:v5 target:self configurator:sel_configureHeader_indexPath_];
}

- (void)configureHeader:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(GKTurnBasedMatchesViewController *)self matchesDataSource];
  uint64_t v9 = [v6 section];

  v10 = [v8 titleForSection:v9];
  v11 = [v10 localizedUppercaseString];
  [v7 setLeftText:v11];

  v12 = [MEMORY[0x1E4FB08E0] _gkPreferredFontForTextStyle:*MEMORY[0x1E4FB28F0] symbolicTraits:2];
  v13 = [v7 leftLabel];
  [v13 setFont:v12];

  v14 = [v7 leftLabel];
  v15 = [v14 textColor];
  v16 = [v15 colorWithAlphaComponent:0.600000024];
  v17 = [v7 leftLabel];
  [v17 setTextColor:v16];

  uint64_t v18 = *MEMORY[0x1E4F3A2E8];
  v19 = [v7 leftLabel];
  v20 = [v19 layer];
  [v20 setCompositingFilter:v18];

  v21 = [v7 underlineView];
  [v21 setHidden:1];

  id v22 = [v7 backgroundView];

  [v22 setHidden:0];
}

- (void)viewDidLoad
{
  if ([(GKTurnBasedMatchesViewController *)self isInGame])
  {
    BOOL v3 = [(GKTurnBasedMatchesViewController *)self navigationController];
    [v3 makeNavigationBarBackgroundTranslucent];

    v4 = [MEMORY[0x1E4FB1618] labelColor];
    uint64_t v5 = [(GKTurnBasedMatchesViewController *)self navigationController];
    id v6 = [v5 navigationBar];
    [v6 setTintColor:v4];

    id v7 = objc_opt_new();
    v8 = [(GKTurnBasedMatchesViewController *)self navigationController];
    uint64_t v9 = [v8 navigationBar];
    [v9 setShadowImage:v7];
  }
  v12.receiver = self;
  v12.super_class = (Class)GKTurnBasedMatchesViewController;
  [(GKCollectionViewController *)&v12 viewDidLoad];
  [(GKTurnBasedMatchesViewController *)self configureNavigationBarFocusGuide];
  [(GKTurnBasedMatchesViewController *)self configureCollectionViewFocusGuide];
  v10 = [(GKCollectionViewController *)self collectionView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(GKTurnBasedMatchesViewController *)self updateUIBasedOnTraitCollection];
  v11 = [(GKCollectionViewController *)self collectionView];
  [v11 setShowsVerticalScrollIndicator:0];
}

- (void)configureNavigationBarFocusGuide
{
  v33[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(GKTurnBasedMatchesViewController *)self navigationController];
  v4 = [v3 navigationBar];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1780]);
    id v6 = [(GKTurnBasedMatchesViewController *)self navigationController];
    id v7 = [v6 navigationBar];
    v33[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    [v5 setPreferredFocusEnvironments:v8];

    uint64_t v9 = [(GKTurnBasedMatchesViewController *)self view];
    [v9 addLayoutGuide:v5];

    v10 = [(GKTurnBasedMatchesViewController *)self navigationController];
    v11 = [v10 navigationBar];
    [v11 frame];
    double v13 = v12;

    v24 = (void *)MEMORY[0x1E4F28DC8];
    v30 = [v5 topAnchor];
    v31 = [(GKTurnBasedMatchesViewController *)self view];
    v29 = [v31 topAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v32[0] = v28;
    v26 = [v5 bottomAnchor];
    v27 = [(GKTurnBasedMatchesViewController *)self view];
    v25 = [v27 topAnchor];
    v23 = [v26 constraintEqualToAnchor:v25 constant:v13];
    v32[1] = v23;
    v14 = [v5 leadingAnchor];
    v15 = [(GKTurnBasedMatchesViewController *)self view];
    v16 = [v15 leadingAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    v32[2] = v17;
    uint64_t v18 = [v5 trailingAnchor];
    v19 = [(GKTurnBasedMatchesViewController *)self view];
    v20 = [v19 trailingAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    v32[3] = v21;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
    [v24 activateConstraints:v22];
  }
}

- (void)configureCollectionViewFocusGuide
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v31 = [(GKTurnBasedMatchesViewController *)self navigationController];
  uint64_t v3 = [v31 navigationBar];
  if (v3)
  {
    v4 = (void *)v3;
    id v5 = [(GKCollectionViewController *)self collectionView];

    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4FB1780]);
      id v7 = [(GKCollectionViewController *)self collectionView];
      v34[0] = v7;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
      [v6 setPreferredFocusEnvironments:v8];

      uint64_t v9 = [(GKTurnBasedMatchesViewController *)self view];
      [v9 addLayoutGuide:v6];

      v10 = [(GKTurnBasedMatchesViewController *)self navigationController];
      v11 = [v10 navigationBar];
      [v11 frame];
      double v13 = v12;

      v24 = (void *)MEMORY[0x1E4F28DC8];
      v30 = [v6 topAnchor];
      id v32 = [(GKTurnBasedMatchesViewController *)self view];
      v29 = [v32 topAnchor];
      v28 = [v30 constraintEqualToAnchor:v29 constant:v13];
      v33[0] = v28;
      v26 = [v6 bottomAnchor];
      v27 = [(GKTurnBasedMatchesViewController *)self view];
      v25 = [v27 bottomAnchor];
      v23 = [v26 constraintEqualToAnchor:v25];
      v33[1] = v23;
      v14 = [v6 leadingAnchor];
      v15 = [(GKTurnBasedMatchesViewController *)self view];
      v16 = [v15 leadingAnchor];
      v17 = [v14 constraintEqualToAnchor:v16];
      void v33[2] = v17;
      uint64_t v18 = [v6 trailingAnchor];
      v19 = [(GKTurnBasedMatchesViewController *)self view];
      v20 = [v19 trailingAnchor];
      v21 = [v18 constraintEqualToAnchor:v20];
      v33[3] = v21;
      id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
      [v24 activateConstraints:v22];
    }
  }
  else
  {
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(GKTurnBasedMatchesViewController *)self isInGame])
  {
    id v5 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v5 addObserver:self selector:sel_handleTurnBasedEvent_ name:*MEMORY[0x1E4F63228] object:0];

    id v6 = [(GKTurnBasedMatchesViewController *)self navigationItem];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_cancelButtonPressed];
    [v6 setLeftBarButtonItem:v7];
    v8 = [MEMORY[0x1E4F637E8] shared];
    uint64_t v9 = [v8 multiplayerAllowedPlayerType];

    if (v9)
    {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:4 target:self action:sel_addPressed];
      [v6 setRightBarButtonItem:v10];
    }
    [(GKTurnBasedMatchesDataSource *)self->_matchesDataSource setDetailPressedAction:sel_detailPressedForMatch_];
    if (![(GKTurnBasedMatchesViewController *)self showExistingMatches]) {
      [(GKTurnBasedMatchesViewController *)self showInviteControllerAnimated:0];
    }
    v11 = [(GKTurnBasedMatchesViewController *)self navigationController];
    [v11 setNavigationBarHidden:0 animated:0];
  }
  v12.receiver = self;
  v12.super_class = (Class)GKTurnBasedMatchesViewController;
  [(GKCollectionViewController *)&v12 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)GKTurnBasedMatchesViewController;
  [(GKCollectionViewController *)&v12 viewDidAppear:a3];
  v4 = [(GKTurnBasedMatchesViewController *)self delegate];
  id v5 = [(GKMatchRequest *)self->_matchRequest validateForTurnBased];
  if (v5)
  {
    [v4 turnBasedViewController:self didFailWithError:v5];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F637E8] shared];
    uint64_t v7 = [v6 multiplayerAllowedPlayerType];

    if (!v7)
    {
      v8 = [MEMORY[0x1E4F28C58] userErrorForCode:10 underlyingError:0];
      [v4 turnBasedViewController:self didFailWithError:v8];
    }
  }
  uint64_t v9 = [(GKTurnBasedMatchesViewController *)self view];
  v10 = [v9 window];
  v11 = [v10 _rootSheetPresentationController];
  [v11 _setShouldScaleDownBehindDescendantSheets:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)GKTurnBasedMatchesViewController;
  [(GKCollectionViewController *)&v6 viewWillDisappear:v3];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKTurnBasedMatchesViewController;
  [(GKCollectionViewController *)&v4 traitCollectionDidChange:a3];
  [(GKTurnBasedMatchesViewController *)self updateUIBasedOnTraitCollection];
}

- (void)updateUIBasedOnTraitCollection
{
  BOOL v3 = [(GKCollectionViewController *)self collectionView];
  [v3 _gkRemoveAllConstraints];

  objc_super v4 = [GameLayerPageGrid alloc];
  id v5 = [(GKCollectionViewController *)self collectionView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  v10 = [(GKTurnBasedMatchesViewController *)self view];
  v11 = [v10 traitCollection];
  v63 = -[GameLayerPageGrid initWithSize:traitCollection:](v4, "initWithSize:traitCollection:", v11, v7, v9);

  objc_super v12 = [(GKTurnBasedMatchesViewController *)self view];
  double v13 = [v12 traitCollection];
  uint64_t v14 = [v13 userInterfaceIdiom];
  [(GameLayerPageGrid *)v63 columnWidth];
  double v16 = v15;
  [(GameLayerPageGrid *)v63 interColumnSpacing];
  double v18 = v17 + v17 + v16 * 3.0;
  double v19 = v17 * 3.0 + v16 * 4.0;
  if (v14) {
    double v20 = v19;
  }
  else {
    double v20 = v18;
  }

  v21 = [(GKCollectionViewController *)self collectionView];
  [v21 bounds];
  double v23 = v22;
  [(GameLayerPageGrid *)v63 minimumInsets];
  double v25 = v23 - v24;
  [(GameLayerPageGrid *)v63 minimumInsets];
  double v27 = v25 - v26;

  v28 = [(GKCollectionViewController *)self collectionView];
  v29 = v28;
  if (v20 <= v27)
  {
    v35 = [v28 widthAnchor];
    v36 = [v35 constraintEqualToConstant:v20];
    [v36 setActive:1];
  }
  else
  {
    v30 = [v28 leftAnchor];
    id v31 = [(GKTurnBasedMatchesViewController *)self view];
    id v32 = [v31 leftAnchor];
    [(GameLayerPageGrid *)v63 minimumInsets];
    v34 = [v30 constraintEqualToAnchor:v32 constant:v33];
    [v34 setActive:1];

    v29 = [(GKCollectionViewController *)self collectionView];
    v35 = [v29 rightAnchor];
    v36 = [(GKTurnBasedMatchesViewController *)self view];
    v37 = [v36 rightAnchor];
    [(GameLayerPageGrid *)v63 minimumInsets];
    v39 = [v35 constraintEqualToAnchor:v37 constant:-v38];
    [v39 setActive:1];
  }
  v40 = [(GKCollectionViewController *)self collectionView];
  v41 = [v40 centerXAnchor];
  v42 = [(GKTurnBasedMatchesViewController *)self view];
  v43 = [v42 centerXAnchor];
  v44 = [v41 constraintEqualToAnchor:v43];
  [v44 setActive:1];

  v45 = [(GKCollectionViewController *)self collectionView];
  v46 = [v45 topAnchor];
  v47 = [(GKTurnBasedMatchesViewController *)self view];
  v48 = [v47 topAnchor];
  v49 = [v46 constraintEqualToAnchor:v48];
  [v49 setActive:1];

  v50 = [(GKCollectionViewController *)self collectionView];
  v51 = [v50 bottomAnchor];
  v52 = [(GKTurnBasedMatchesViewController *)self view];
  v53 = [v52 bottomAnchor];
  v54 = [v51 constraintEqualToAnchor:v53];
  [v54 setActive:1];

  v55 = [(GKCollectionViewController *)self collectionView];
  [v55 setNeedsLayout];

  [(GKTurnBasedMatchesViewController *)self configureDetailButtonFocusGuide];
  v56 = [(GKCollectionViewDataSource *)self->_matchesDataSource defaultSectionMetrics];
  +[GKTurnParticipantCell defaultRowHeight];
  double v58 = v57;
  v59 = [(GKTurnBasedMatchesViewController *)self traitCollection];
  v60 = [v59 preferredContentSizeCategory];
  LODWORD(v53) = UIContentSizeCategoryIsAccessibilityCategory(v60);

  if (v53)
  {
    double v58 = v58 * 1.7;
    [v56 setSectionHeadersShouldPin:0];
  }
  v61 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  [v61 scaledValueForValue:v58];
  objc_msgSend(v56, "setDesiredItemHeight:");

  [v56 setItemHeightList:0];
  v62 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  [v62 scaledValueForValue:self->_initialSectionHeaderHeight];
  objc_msgSend(v56, "setSectionHeaderHeight:");

  [(GKCollectionViewDataSource *)self->_matchesDataSource setDefaultSectionMetrics:v56];
  [(GKCollectionViewController *)self _gkSetContentsNeedUpdateWithHandler:0];
}

- (void)configureDetailButtonFocusGuide
{
  v37[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(GKTurnBasedMatchesViewController *)self detailButtonFocusGuide];

  if (v3)
  {
    objc_super v4 = [(GKTurnBasedMatchesViewController *)self view];
    id v5 = [(GKTurnBasedMatchesViewController *)self detailButtonFocusGuide];
    [v4 removeLayoutGuide:v5];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1780]);
  [(GKTurnBasedMatchesViewController *)self setDetailButtonFocusGuide:v6];

  double v7 = [(GKTurnBasedMatchesViewController *)self view];
  double v8 = [(GKTurnBasedMatchesViewController *)self detailButtonFocusGuide];
  [v7 addLayoutGuide:v8];

  double v9 = [(GKTurnBasedMatchesViewController *)self navigationController];
  v10 = [v9 navigationBar];

  if (v10)
  {
    v11 = [(GKTurnBasedMatchesViewController *)self navigationController];
    objc_super v12 = [v11 navigationBar];
    [v12 frame];
    double v14 = v13;

    double v27 = (void *)MEMORY[0x1E4F28DC8];
    v36 = [(GKTurnBasedMatchesViewController *)self detailButtonFocusGuide];
    v34 = [v36 topAnchor];
    v35 = [(GKTurnBasedMatchesViewController *)self view];
    double v33 = [v35 topAnchor];
    id v32 = [v34 constraintEqualToAnchor:v33 constant:v14];
    v37[0] = v32;
    id v31 = [(GKTurnBasedMatchesViewController *)self detailButtonFocusGuide];
    v29 = [v31 bottomAnchor];
    v30 = [(GKTurnBasedMatchesViewController *)self view];
    v28 = [v30 bottomAnchor];
    double v26 = [v29 constraintEqualToAnchor:v28];
    v37[1] = v26;
    double v25 = [(GKTurnBasedMatchesViewController *)self detailButtonFocusGuide];
    double v15 = [v25 leadingAnchor];
    double v16 = [(GKCollectionViewController *)self collectionView];
    double v17 = [v16 trailingAnchor];
    double v18 = [v15 constraintEqualToAnchor:v17];
    v37[2] = v18;
    double v19 = [(GKTurnBasedMatchesViewController *)self detailButtonFocusGuide];
    double v20 = [v19 trailingAnchor];
    v21 = [(GKCollectionViewController *)self collectionView];
    double v22 = [v21 trailingAnchor];
    double v23 = [v20 constraintEqualToAnchor:v22 constant:1.0];
    v37[3] = v23;
    double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
    [v27 activateConstraints:v24];
  }
}

- (BOOL)isLoadingOrRemovingPreloadedMatch
{
  v2 = [(GKTurnBasedMatchesViewController *)self inviteController];
  char v3 = [v2 isLoadingOrRemovingPreloadedMatch];

  return v3;
}

- (void)loadDataWithCompletionHandlerAndError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F636D8];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatchesViewController_iOS.m", 322, "-[GKTurnBasedMatchesViewController loadDataWithCompletionHandlerAndError:]");
  double v7 = [v5 dispatchGroupWithName:v6];

  if (![(GKTurnBasedMatchesViewController *)self isLoadingOrRemovingPreloadedMatch])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__GKTurnBasedMatchesViewController_loadDataWithCompletionHandlerAndError___block_invoke;
    v13[3] = &unk_1E5F62F28;
    id v14 = v7;
    double v15 = self;
    [v14 perform:v13];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__GKTurnBasedMatchesViewController_loadDataWithCompletionHandlerAndError___block_invoke_3;
  v10[3] = &unk_1E5F63988;
  id v11 = v7;
  id v12 = v4;
  id v8 = v7;
  id v9 = v4;
  [v8 notifyOnMainQueueWithBlock:v10];
}

void __74__GKTurnBasedMatchesViewController_loadDataWithCompletionHandlerAndError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__GKTurnBasedMatchesViewController_loadDataWithCompletionHandlerAndError___block_invoke_2;
  v9[3] = &unk_1E5F65FD0;
  id v4 = *(void **)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v3;
  v8.receiver = v4;
  v8.super_class = (Class)GKTurnBasedMatchesViewController;
  id v7 = v3;
  objc_msgSendSuper2(&v8, sel_loadDataWithCompletionHandlerAndError_, v9);
}

uint64_t __74__GKTurnBasedMatchesViewController_loadDataWithCompletionHandlerAndError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  int v4 = [*(id *)(a1 + 40) isInGame];
  if (!a2 && v4)
  {
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = v5[150];
    id v7 = [v5 matchesDataSource];
    uint64_t v8 = [v7 numberOfMatches];

    uint64_t v9 = v6 <= v8 ? v8 : v6;
    *(void *)(*(void *)(a1 + 40) + 1200) = v9;
    id v10 = *(void **)(a1 + 40);
    if (!v10[150]) {
      [v10 showInviteControllerAnimated:0];
    }
  }
  uint64_t v11 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v11();
}

void __74__GKTurnBasedMatchesViewController_loadDataWithCompletionHandlerAndError___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (BOOL)_gkShouldRefreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (v4 == 14
    && [(GKTurnBasedMatchesViewController *)self isLoadingOrRemovingPreloadedMatch])
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GKTurnBasedMatchesViewController;
    BOOL v7 = [(GKCollectionViewController *)&v9 _gkShouldRefreshContentsForDataType:v4 userInfo:v6];
  }

  return v7;
}

- (void)didEnterNoContentState
{
  if ([(GKTurnBasedMatchesViewController *)self isInGame])
  {
    [(GKTurnBasedMatchesViewController *)self showInviteControllerAnimated:0];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = [(GKSplittingDataSource *)self->_matchesDataSource itemAtIndexPath:a4];
  if ([(GKTurnBasedMatchesViewController *)self isInGame])
  {
    if ([v6 state] == 1)
    {
      [(GKTurnBasedMatchesViewController *)self acceptInviteForMatch:v6];
    }
    else
    {
      id v5 = [v6 internal];
      [(GKTurnBasedMatchesViewController *)self showMatch:v5];
    }
  }
  else
  {
    [(GKTurnBasedMatchesViewController *)self showDetailForMatch:v6];
  }
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = [v6 nextFocusedItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_super v9 = [v6 nextFocusedItem];
    id v10 = [v9 detailButton];
    v13[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v12 = [(GKTurnBasedMatchesViewController *)self detailButtonFocusGuide];
    [v12 setPreferredFocusEnvironments:v11];
  }
}

- (void)applicationDidEnterBackground
{
}

- (void)showInviteControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F637E8] shared];
  uint64_t v6 = [v5 multiplayerAllowedPlayerType];

  if (v6)
  {
    BOOL v7 = [(GKTurnBasedMatchesViewController *)self navigationController];
    uint64_t v8 = [v7 topViewController];

    if (v8 == self)
    {
      objc_super v9 = [GKTurnBasedInviteViewController alloc];
      id v10 = [(GKTurnBasedMatchesViewController *)self matchRequest];
      double v15 = [(GKMultiplayerViewController *)v9 initWithMatchRequest:v10];

      [(GKMultiplayerViewController *)v15 setGame:self->_game];
      [(GKTurnBasedInviteViewController *)v15 setDelegate:self];
      if ([(GKTurnBasedMatchesViewController *)self showExistingMatches]
        && [(GKTurnBasedMatchesDataSource *)self->_matchesDataSource numberOfMatches])
      {
        [(GKMultiplayerViewController *)v15 setShowCancelButton:0];
        uint64_t v11 = GKGameCenterUIFrameworkBundle();
        id v12 = GKGetLocalizedStringFromTableInBundle();
        double v13 = [(GKTurnBasedMatchesViewController *)self navigationItem];
        [v13 setBackButtonTitle:v12];
      }
      else
      {
        [(GKMultiplayerViewController *)v15 setShowCancelButton:1];
      }
      id v14 = [(GKTurnBasedMatchesViewController *)self navigationController];
      [v14 pushViewController:v15 animated:v3];

      [(GKTurnBasedMatchesViewController *)self setInviteController:v15];
    }
  }
}

- (void)turnBasedInviteViewControllerWasCancelled:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__GKTurnBasedMatchesViewController_turnBasedInviteViewControllerWasCancelled___block_invoke;
  v4[3] = &unk_1E5F63240;
  v4[4] = self;
  v3.receiver = self;
  v3.super_class = (Class)GKTurnBasedMatchesViewController;
  [(GKCollectionViewController *)&v3 loadDataWithCompletionHandlerAndError:v4];
}

void __78__GKTurnBasedMatchesViewController_turnBasedInviteViewControllerWasCancelled___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) showExistingMatches]
    && ([*(id *)(a1 + 32) matchesDataSource],
        id v2 = objc_claimAutoreleasedReturnValue(),
        uint64_t v3 = [v2 numberOfMatches],
        v2,
        v3))
  {
    id v5 = [*(id *)(a1 + 32) navigationController];
    id v4 = (id)[v5 popToViewController:*(void *)(a1 + 32) animated:1];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 turnBasedViewControllerWasCancelled:*(void *)(a1 + 32)];
  }
}

- (void)turnBasedInviteViewController:(id)a3 didCreateMatchID:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__GKTurnBasedMatchesViewController_turnBasedInviteViewController_didCreateMatchID___block_invoke;
  v4[3] = &unk_1E5F64588;
  v4[4] = self;
  [MEMORY[0x1E4F63818] loadMatchWithID:a4 withCompletionHandler:v4];
}

void __83__GKTurnBasedMatchesViewController_turnBasedInviteViewController_didCreateMatchID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 internal];
  [v2 showMatch:v3];
}

- (void)turnBasedInviteViewController:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(GKTurnBasedMatchesViewController *)self delegate];
  [v6 turnBasedViewController:self didFailWithError:v5];
}

- (void)cancelButtonPressed
{
  id v3 = [(GKTurnBasedMatchesViewController *)self delegate];
  [v3 turnBasedViewControllerWasCancelled:self];
}

- (void)addPressed
{
}

- (void)launchGameAndShowMatch:(id)a3
{
  id v6 = a3;
  if ([(GKGame *)self->_game isInstalled])
  {
    id v4 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
    id v5 = [v4 turnBasedServicePrivate];
    [v5 showMatch:v6];
  }
}

- (void)notifyGameWithMatch:(id)a3 orError:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  uint64_t v7 = (uint64_t)a4;
  if (![(GKTurnBasedMatchesViewController *)self isInGame])
  {
    objc_super v9 = [(id)v6 internal];
    [(GKTurnBasedMatchesViewController *)self launchGameAndShowMatch:v9];
    goto LABEL_12;
  }
  if (v6 | v7)
  {
    uint64_t v8 = [(GKTurnBasedMatchesViewController *)self delegate];
    objc_super v9 = v8;
    if (v6)
    {
      [v8 turnBasedViewController:self didFindMatch:v6];
      goto LABEL_12;
    }
  }
  else
  {
    id v10 = NSString;
    uint64_t v11 = [NSString stringWithFormat:@"Assertion failed"];
    id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTurnBasedMatchesViewController_iOS.m"];
    id v13 = [v12 lastPathComponent];
    id v14 = [v10 stringWithFormat:@"%@ (match != ((void *)0) || error != ((void *)0))\n[%s (%s:%d)]", v11, "-[GKTurnBasedMatchesViewController notifyGameWithMatch:orError:]", objc_msgSend(v13, "UTF8String"), 477];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v14 format];
    objc_super v9 = [(GKTurnBasedMatchesViewController *)self delegate];
  }
  double v15 = (NSObject **)MEMORY[0x1E4F63860];
  double v16 = *MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860])
  {
    id v17 = (id)GKOSLoggers();
    double v16 = *v15;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[GKTurnBasedMatchesViewController notifyGameWithMatch:orError:](v7, v16);
  }
  [v9 turnBasedViewController:self didFailWithError:v7];
LABEL_12:
}

- (void)acceptInviteForMatch:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = NSString;
    unint64_t v6 = [NSString stringWithFormat:@"Assertion failed"];
    uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTurnBasedMatchesViewController_iOS.m"];
    id v8 = [v7 lastPathComponent];
    objc_super v9 = [v5 stringWithFormat:@"%@ (match)\n[%s (%s:%d)]", v6, "-[GKTurnBasedMatchesViewController acceptInviteForMatch:]", objc_msgSend(v8, "UTF8String"), 494];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__GKTurnBasedMatchesViewController_acceptInviteForMatch___block_invoke;
  v10[3] = &unk_1E5F64588;
  void v10[4] = self;
  [v4 acceptInviteWithCompletionHandler:v10];
}

uint64_t __57__GKTurnBasedMatchesViewController_acceptInviteForMatch___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) notifyGameWithMatch:a2 orError:a3];
}

- (void)showMatch:(id)a3
{
  id v6 = a3;
  if ([(GKTurnBasedMatchesViewController *)self isInGame])
  {
    id v4 = (void *)MEMORY[0x1E4F63818];
    id v5 = [v6 matchID];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__GKTurnBasedMatchesViewController_showMatch___block_invoke;
    v7[3] = &unk_1E5F64588;
    v7[4] = self;
    [v4 loadTurnBasedMatchWithDetailsForMatchID:v5 withCompletionHandler:v7];
  }
  else
  {
    [(GKTurnBasedMatchesViewController *)self launchGameAndShowMatch:v6];
  }
}

uint64_t __46__GKTurnBasedMatchesViewController_showMatch___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) notifyGameWithMatch:a2 orError:a3];
}

- (void)showDetailForMatch:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc_init(GKTurnBasedMatchDetailViewController);
    [(GKTurnBasedMatchDetailViewController *)v5 setShouldShowPlay:[(GKTurnBasedMatchesViewController *)self showPlay]];
    [(GKTurnBasedMatchDetailViewController *)v5 setShouldShowQuit:[(GKTurnBasedMatchesViewController *)self showQuit]];
    [(GKTurnBasedMatchDetailViewController *)v5 setMatch:v4];
    id v6 = [v4 game];

    [(GKTurnBasedMatchDetailViewController *)v5 setGame:v6];
    [(GKTurnBasedMatchDetailViewController *)v5 setDelegate:self];
    [(GKTurnBasedMatchDetailViewController *)v5 setIsInGame:[(GKTurnBasedMatchesViewController *)self isInGame]];
    uint64_t v7 = objc_alloc_init(GKNavigationController);
    v11[0] = v5;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [(GKNavigationController *)v7 setViewControllers:v8];

    [(GKNavigationController *)v7 setModalPresentationStyle:1];
    objc_super v9 = [MEMORY[0x1E4FB1618] whiteColor];
    id v10 = [(GKNavigationController *)v7 view];
    [v10 setTintColor:v9];

    [(GKTurnBasedMatchesViewController *)self presentViewController:v7 animated:1 completion:0];
  }
}

- (void)presentNavigationControllerInPopover:(id)a3 fromCell:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v10 setModalPresentationStyle:7];
  uint64_t v11 = [v10 navigationBar];
  [v11 _setHidesShadow:1];

  id v13 = [v10 popoverPresentationController];
  [v13 setPermittedArrowDirections:15];
  [v13 setSourceView:v9];
  id v12 = [v9 popoverSourceView];

  [v12 frame];
  objc_msgSend(v13, "setSourceRect:");

  [v13 setDelegate:self];
  [(GKTurnBasedMatchesViewController *)self presentViewController:v10 animated:1 completion:v8];
}

- (void)dismissDetailViewControllerInPopover:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__GKTurnBasedMatchesViewController_dismissDetailViewControllerInPopover_completion___block_invoke;
  v8[3] = &unk_1E5F639B0;
  id v9 = v6;
  id v7 = v6;
  [(GKTurnBasedMatchesViewController *)self dismissViewControllerAnimated:v4 completion:v8];
}

uint64_t __84__GKTurnBasedMatchesViewController_dismissDetailViewControllerInPopover_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dismissDetailViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 != 1 || (*MEMORY[0x1E4F63830] ? (BOOL v7 = *MEMORY[0x1E4F63A38] == 0) : (BOOL v7 = 0), v7))
  {
    id v8 = [(GKTurnBasedMatchesViewController *)self presentedViewController];
    [v8 dismissViewControllerAnimated:v3 completion:0];

    [(GKCollectionViewController *)self clearSelectionHighlight];
  }
  else
  {
    [(GKTurnBasedMatchesViewController *)self dismissDetailViewControllerInPopover:v3 completion:0];
  }
}

- (void)_gkRestorePopoverWithViewControllers:(id)a3 completion:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  BOOL v7 = [v24 firstObject];
  id v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (v9 == 1)
  {
    id v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;

    BOOL v15 = v12 > 1024.0;
    if (v14 > 1024.0) {
      BOOL v15 = 1;
    }
    double v16 = 320.0;
    if (v15) {
      double v16 = 375.0;
    }
  }
  else
  {
    double v16 = 320.0;
  }
  objc_msgSend(v7, "setPreferredContentSize:", v16, 440.0);
  id v17 = [(GKCollectionViewController *)self gkDataSource];
  double v18 = [v7 _gkRepresentedObject];
  double v19 = [v17 indexPathsForItem:v18];
  double v20 = [v19 firstObject];

  v21 = [(GKCollectionViewController *)self collectionView];
  double v22 = [v21 cellForItemAtIndexPath:v20];

  if (v22)
  {
    double v23 = objc_alloc_init(GKNavigationController);
    [(GKNavigationController *)v23 setViewControllers:v24];
    [(GKTurnBasedMatchesViewController *)self presentNavigationControllerInPopover:v23 fromCell:v22 completion:v6];
  }
}

- (void)turnBasedMatchDetailViewControllerDidAcceptInvitation:(id)a3
{
  id v4 = [a3 match];
  [(GKTurnBasedMatchesViewController *)self acceptInviteForMatch:v4];
}

- (void)turnBasedMatchDetailViewControllerDidDeclineInvitation:(id)a3
{
  id v4 = a3;
  [(GKTurnBasedMatchesViewController *)self dismissDetailViewControllerAnimated:1];
  id v5 = [v4 match];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidDeclineInvitation___block_invoke;
  v6[3] = &unk_1E5F63240;
  v6[4] = self;
  [v5 declineInviteWithCompletionHandler:v6];
}

uint64_t __91__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidDeclineInvitation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsReload];
}

- (void)turnBasedMatchDetailViewControllerDidChooseMatch:(id)a3
{
  id v5 = [a3 match];
  id v4 = [v5 internal];
  [(GKTurnBasedMatchesViewController *)self showMatch:v4];
}

- (void)turnBasedMatchDetailViewControllerDidQuitMatch:(id)a3
{
  id v4 = a3;
  id v5 = [v4 match];
  id v6 = [v5 localPlayerParticipant];
  BOOL v7 = [(GKTurnBasedMatchesViewController *)self delegate];
  id v8 = [v4 match];
  int v9 = [v8 isMyTurn];

  if (v9)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidQuitMatch___block_invoke;
    v14[3] = &unk_1E5F65FF8;
    id v15 = v4;
    id v16 = v5;
    id v17 = self;
    id v18 = v7;
    [v16 loadMatchDataWithCompletionHandler:v14];
  }
  else
  {
    [(GKTurnBasedMatchesViewController *)self dismissDetailViewControllerAnimated:1];
    if ([v6 status] == 4)
    {
      id v10 = (NSObject **)MEMORY[0x1E4F63860];
      double v11 = *MEMORY[0x1E4F63860];
      if (!*MEMORY[0x1E4F63860])
      {
        id v12 = (id)GKOSLoggers();
        double v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[GKTurnBasedMatchesViewController turnBasedMatchDetailViewControllerDidQuitMatch:]();
      }
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __83__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidQuitMatch___block_invoke_129;
    v13[3] = &unk_1E5F63240;
    void v13[4] = self;
    [v5 participantQuitOutOfTurnWithOutcome:1 withCompletionHandler:v13];
  }
}

void __83__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidQuitMatch___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    [a1[7] turnBasedViewController:a1[6] didFailWithError:a3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidQuitMatch___block_invoke_2;
    block[3] = &unk_1E5F62EB0;
    block[4] = a1[6];
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    [a1[4] setMatch:a1[5]];
    [a1[4] setNeedsReload];
    id v4 = [a1[5] matchID];
    [a1[6] setMatchIDWaitingForTurnEvent:v4];

    id v5 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v5 addObserver:a1[6] selector:sel_handleTurnBasedEvent_ name:*MEMORY[0x1E4F63228] object:0];

    id v7 = a1[6];
    id v6 = a1[7];
    id v8 = a1[5];
    [v6 turnBasedViewController:v7 playerQuitForMatch:v8];
  }
}

uint64_t __83__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidQuitMatch___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissDetailViewControllerAnimated:1];
}

uint64_t __83__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidQuitMatch___block_invoke_129(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsReload];
}

- (void)turnBasedMatchesDataSource:(id)a3 didQuitMatch:(id)a4
{
  id v5 = a4;
  id v6 = [v5 localPlayerParticipant];
  id v7 = [(GKTurnBasedMatchesViewController *)self delegate];
  if ([v5 isMyTurn])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__GKTurnBasedMatchesViewController_turnBasedMatchesDataSource_didQuitMatch___block_invoke;
    v12[3] = &unk_1E5F66020;
    v12[4] = self;
    id v13 = v5;
    id v14 = v7;
    [v13 loadMatchDataWithCompletionHandler:v12];
  }
  else
  {
    if ([v6 status] == 4)
    {
      id v8 = (NSObject **)MEMORY[0x1E4F63860];
      int v9 = *MEMORY[0x1E4F63860];
      if (!*MEMORY[0x1E4F63860])
      {
        id v10 = (id)GKOSLoggers();
        int v9 = *v8;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[GKTurnBasedMatchesViewController turnBasedMatchDetailViewControllerDidQuitMatch:]();
      }
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __76__GKTurnBasedMatchesViewController_turnBasedMatchesDataSource_didQuitMatch___block_invoke_130;
    v11[3] = &unk_1E5F63240;
    v11[4] = self;
    [v5 participantQuitOutOfTurnWithOutcome:1 withCompletionHandler:v11];
  }
}

uint64_t __76__GKTurnBasedMatchesViewController_turnBasedMatchesDataSource_didQuitMatch___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v5 = *(void **)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    return [v5 turnBasedViewController:v6 didFailWithError:a3];
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) matchID];
    [*(id *)(a1 + 32) setMatchIDWaitingForTurnEvent:v8];

    int v9 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v9 addObserver:*(void *)(a1 + 32) selector:sel_handleTurnBasedEvent_ name:*MEMORY[0x1E4F63228] object:0];

    uint64_t v11 = *(void *)(a1 + 40);
    id v10 = *(void **)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    return [v10 turnBasedViewController:v12 playerQuitForMatch:v11];
  }
}

uint64_t __76__GKTurnBasedMatchesViewController_turnBasedMatchesDataSource_didQuitMatch___block_invoke_130(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsReload];
}

- (void)turnBasedMatchDetailViewControllerDidRemoveMatch:(id)a3
{
  id v4 = a3;
  [(GKTurnBasedMatchesViewController *)self dismissDetailViewControllerAnimated:1];
  id v5 = [v4 match];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidRemoveMatch___block_invoke;
  v6[3] = &unk_1E5F63240;
  v6[4] = self;
  [v5 removeWithCompletionHandler:v6];
}

uint64_t __85__GKTurnBasedMatchesViewController_turnBasedMatchDetailViewControllerDidRemoveMatch___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsReload];
}

- (void)turnBasedMatchDetailViewControllerDidShowStore:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", a3);
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1 && (!*MEMORY[0x1E4F63830] || *MEMORY[0x1E4F63A38] != 0))
  {
    [(GKTurnBasedMatchesViewController *)self dismissDetailViewControllerAnimated:1];
    id v7 = [(GKTurnBasedMatchesViewController *)self game];
    [v7 openAppStorePage];
  }
}

- (void)handleTurnBasedEvent:(id)a3
{
  id v4 = [a3 object];
  if ([(GKTurnBasedMatchesViewController *)self isInGame]
    && [v4 isEqualToString:self->_matchIDWaitingForTurnEvent])
  {
    [(GKTurnBasedMatchesViewController *)self setMatchIDWaitingForTurnEvent:0];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__GKTurnBasedMatchesViewController_handleTurnBasedEvent___block_invoke;
    block[3] = &unk_1E5F62EB0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __57__GKTurnBasedMatchesViewController_handleTurnBasedEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (GKCollectionViewController)masterViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_masterViewController);

  return (GKCollectionViewController *)WeakRetained;
}

- (void)setMasterViewController:(id)a3
{
}

- (GKGame)game
{
  return self->_game;
}

- (GKMatchRequest)matchRequest
{
  return self->_matchRequest;
}

- (void)setMatchRequest:(id)a3
{
}

- (GKTurnBasedMatchesViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKTurnBasedMatchesViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showExistingMatches
{
  return self->_showExistingMatches;
}

- (void)setShowExistingMatches:(BOOL)a3
{
  self->_showExistingMatches = a3;
}

- (BOOL)showPlay
{
  return self->_showPlay;
}

- (void)setShowPlay:(BOOL)a3
{
  self->_showPlay = a3;
}

- (BOOL)showQuit
{
  return self->_showQuit;
}

- (void)setShowQuit:(BOOL)a3
{
  self->_showQuit = a3;
}

- (GKTurnBasedMatchesDataSource)matchesDataSource
{
  return self->_matchesDataSource;
}

- (void)setMatchesDataSource:(id)a3
{
}

- (int64_t)maxMatchesSeen
{
  return self->_maxMatchesSeen;
}

- (void)setMaxMatchesSeen:(int64_t)a3
{
  self->_maxMatchesSeen = a3;
}

- (NSString)matchIDWaitingForTurnEvent
{
  return self->_matchIDWaitingForTurnEvent;
}

- (void)setMatchIDWaitingForTurnEvent:(id)a3
{
}

- (GKTurnBasedInviteViewController)inviteController
{
  return self->_inviteController;
}

- (void)setInviteController:(id)a3
{
}

- (double)initialSectionHeaderHeight
{
  return self->_initialSectionHeaderHeight;
}

- (void)setInitialSectionHeaderHeight:(double)a3
{
  self->_initialSectionHeaderHeight = a3;
}

- (UIFocusGuide)detailButtonFocusGuide
{
  return self->_detailButtonFocusGuide;
}

- (void)setDetailButtonFocusGuide:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailButtonFocusGuide, 0);
  objc_storeStrong((id *)&self->_inviteController, 0);
  objc_storeStrong((id *)&self->_matchIDWaitingForTurnEvent, 0);
  objc_storeStrong((id *)&self->_matchesDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_matchRequest, 0);
  objc_storeStrong((id *)&self->_game, 0);

  objc_destroyWeak((id *)&self->_masterViewController);
}

- (void)notifyGameWithMatch:(uint64_t)a1 orError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AF250000, a2, OS_LOG_TYPE_DEBUG, "no match for notifyGameWithMatch: ->error loading TBG match details: %@", (uint8_t *)&v2, 0xCu);
}

- (void)turnBasedMatchDetailViewControllerDidQuitMatch:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_2(&dword_1AF250000, v0, v1, "localParticipant: %@ has unexpected status for being active in match: %@");
}

@end