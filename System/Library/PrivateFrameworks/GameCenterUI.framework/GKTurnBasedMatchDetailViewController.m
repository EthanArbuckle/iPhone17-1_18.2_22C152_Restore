@interface GKTurnBasedMatchDetailViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)isInGame;
- (BOOL)shouldShowPlay;
- (BOOL)shouldShowQuit;
- (GKGame)game;
- (GKTurnBasedMatch)match;
- (GKTurnBasedMatchDetailHeaderView)headerView;
- (GKTurnBasedMatchDetailViewController)init;
- (GKTurnBasedMatchDetailViewControllerDelegate)delegate;
- (GKTurnBasedParticipantsDataSource)participantsDataSource;
- (double)initialSectionHeaderHeight;
- (id)preferredFocusEnvironments;
- (void)acceptInvitation:(id)a3;
- (void)addBackgroundVisualEffect;
- (void)buyButtonPressed:(id)a3;
- (void)chooseMatch:(id)a3;
- (void)configureDataSource;
- (void)configureHeader:(id)a3 indexPath:(id)a4;
- (void)configureMatchDetailHeader:(id)a3;
- (void)configureViewFactories;
- (void)dealloc;
- (void)declineInvitation:(id)a3;
- (void)didUpdateModel;
- (void)doneButtonPressed:(id)a3;
- (void)handleTurnBasedEvent:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)quitMatch:(id)a3;
- (void)removeMatch:(id)a3;
- (void)setActionButtonEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setGame:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setInitialSectionHeaderHeight:(double)a3;
- (void)setIsInGame:(BOOL)a3;
- (void)setMatch:(id)a3;
- (void)setParticipantsDataSource:(id)a3;
- (void)setShouldShowPlay:(BOOL)a3;
- (void)setShouldShowQuit:(BOOL)a3;
- (void)setupActionButton;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateUIBasedOnTraitCollection;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation GKTurnBasedMatchDetailViewController

- (GKTurnBasedMatchDetailViewController)init
{
  v3 = objc_alloc_init(GKGridLayout);
  v6.receiver = self;
  v6.super_class = (Class)GKTurnBasedMatchDetailViewController;
  v4 = [(GKCollectionViewController *)&v6 initWithCollectionViewLayout:v3];

  if (v4)
  {
    [(GKTurnBasedMatchDetailViewController *)v4 setRestorationClass:objc_opt_class()];
    [(GKTurnBasedMatchDetailViewController *)v4 setRestorationIdentifier:@"TurnBasedMatchDetail"];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKTurnBasedMatchDetailViewController;
  [(GKCollectionViewController *)&v4 dealloc];
}

- (void)setMatch:(id)a3
{
  v5 = (GKTurnBasedMatch *)a3;
  p_match = &self->_match;
  if (self->_match != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_match, a3);
    p_match = (GKTurnBasedMatch **)[(GKTurnBasedMatchDetailViewController *)self didUpdateModel];
    v5 = v7;
  }

  MEMORY[0x1F41817F8](p_match, v5);
}

- (void)configureDataSource
{
  v3 = [(GKCollectionViewController *)self dataSource];

  if (!v3)
  {
    objc_super v4 = objc_alloc_init(GKTurnBasedParticipantsDataSource);
    participantsDataSource = self->_participantsDataSource;
    self->_participantsDataSource = v4;

    objc_super v6 = [MEMORY[0x1E4FB16C8] currentDevice];
    v7 = +[GKSectionMetrics metricsForIdiom:](GKSectionMetrics, "metricsForIdiom:", [v6 userInterfaceIdiom]);

    [v7 sectionHeaderHeight];
    self->_initialSectionHeaderHeight = v8;
    [(GKCollectionViewDataSource *)self->_participantsDataSource setDefaultSectionMetrics:v7];
    v9 = +[GKSupplementaryViewMetrics supplementaryMetrics];
    [v9 setKind:@"GKTurnBasedMatchDetailHeaderKind"];
    [v9 setShouldPin:0];
    v10 = [(GKCollectionViewDataSource *)self->_participantsDataSource dataSourceMetrics];
    [v10 insertSupplementaryMetrics:v9 forKey:@"detailHeader" atLocation:0];

    v11 = [(GKTurnBasedMatchDetailViewController *)self participantsDataSource];
    [v11 addObserver:self forKeyPath:@"match" options:1 context:0];

    v12 = [(GKTurnBasedMatchDetailViewController *)self match];
    [(GKTurnBasedParticipantsDataSource *)self->_participantsDataSource setMatch:v12];

    [(GKBasicCollectionViewController *)self setDataSource:self->_participantsDataSource];
    v13.receiver = self;
    v13.super_class = (Class)GKTurnBasedMatchDetailViewController;
    [(GKBasicCollectionViewController *)&v13 configureDataSource];
  }
}

- (void)configureViewFactories
{
  v5.receiver = self;
  v5.super_class = (Class)GKTurnBasedMatchDetailViewController;
  [(GKCollectionViewController *)&v5 configureViewFactories];
  v3 = [(GKCollectionViewController *)self collectionView];
  [v3 _gkRegisterClass:objc_opt_class() forSupplementaryViewOfKind:@"GKTurnBasedMatchDetailHeaderKind"];

  [(GKCollectionViewDataSource *)self->_participantsDataSource registerSupplementaryViewOfKind:@"GKTurnBasedMatchDetailHeaderKind" withClass:objc_opt_class() target:self configurator:sel_configureMatchDetailHeader_];
  objc_super v4 = [(GKCollectionViewController *)self collectionView];
  [v4 _gkRegisterClass:objc_opt_class() forSupplementaryViewOfKind:@"SectionHeader"];

  [(GKCollectionViewDataSource *)self->_participantsDataSource registerSupplementaryViewOfKind:@"SectionHeader" withClass:objc_opt_class() target:self configurator:sel_configureHeader_indexPath_];
}

- (void)configureMatchDetailHeader:(id)a3
{
  id v4 = a3;
  [(GKTurnBasedMatchDetailViewController *)self setHeaderView:v4];
  [v4 setActionTarget:self];

  [(GKTurnBasedMatchDetailViewController *)self updateUIBasedOnTraitCollection];

  [(GKTurnBasedMatchDetailViewController *)self didUpdateModel];
}

- (void)configureHeader:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  objc_super v6 = [(GKTurnBasedMatchDetailViewController *)self participantsDataSource];
  v7 = [v6 sectionTitle];
  double v8 = [v7 localizedUppercaseString];
  [v5 setLeftText:v8];

  v9 = [MEMORY[0x1E4FB08E0] _gkPreferredFontForTextStyle:*MEMORY[0x1E4FB28F0] symbolicTraits:2];
  v10 = [v5 leftLabel];
  [v10 setFont:v9];

  v11 = [v5 leftLabel];
  v12 = [v11 textColor];
  objc_super v13 = [v12 colorWithAlphaComponent:0.600000024];
  v14 = [v5 leftLabel];
  [v14 setTextColor:v13];

  uint64_t v15 = *MEMORY[0x1E4F3A2E8];
  v16 = [v5 leftLabel];
  v17 = [v16 layer];
  [v17 setCompositingFilter:v15];

  id v18 = [v5 underlineView];

  [v18 setHidden:1];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqual:", @"match", a4, a5, a6))
  {
    id v8 = [(GKTurnBasedMatchDetailViewController *)self participantsDataSource];
    v7 = [v8 match];
    [(GKTurnBasedMatchDetailViewController *)self setMatch:v7];
  }
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)GKTurnBasedMatchDetailViewController;
  [(GKCollectionViewController *)&v13 viewDidLoad];
  v3 = [(GKTurnBasedMatchDetailViewController *)self navigationController];
  [v3 makeNavigationBarBackgroundTranslucent];

  id v4 = [(GKCollectionViewController *)self collectionView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v5 = [(GKCollectionViewController *)self collectionView];
  [v5 setShowsVerticalScrollIndicator:0];

  objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonPressed_];
  v7 = [(GKTurnBasedMatchDetailViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  id v8 = [(GKTurnBasedMatchDetailViewController *)self match];
  v9 = [v8 matchTitle];
  v10 = [(GKTurnBasedMatchDetailViewController *)self navigationItem];
  [v10 setTitle:v9];

  v11 = [(GKTurnBasedMatchDetailViewController *)self match];
  v12 = [v11 matchTitle];
  [(GKTurnBasedMatchDetailViewController *)self setTitle:v12];

  [(GKTurnBasedMatchDetailViewController *)self addBackgroundVisualEffect];
}

- (void)addBackgroundVisualEffect
{
  id v22 = objc_alloc_init(MEMORY[0x1E4FB1F00]);
  v3 = [MEMORY[0x1E4FB1EF8] _gkGameLayerBackgroundVisualEffect];
  [v22 setBackgroundEffects:v3];

  id v4 = [(GKTurnBasedMatchDetailViewController *)self view];
  [v4 bounds];
  objc_msgSend(v22, "setFrame:");

  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [(GKTurnBasedMatchDetailViewController *)self view];
  [v5 insertSubview:v22 atIndex:0];

  objc_super v6 = [v22 topAnchor];
  v7 = [(GKTurnBasedMatchDetailViewController *)self view];
  id v8 = [v7 topAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  v10 = [v22 bottomAnchor];
  v11 = [(GKTurnBasedMatchDetailViewController *)self view];
  v12 = [v11 bottomAnchor];
  objc_super v13 = [v10 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  v14 = [v22 leadingAnchor];
  uint64_t v15 = [(GKTurnBasedMatchDetailViewController *)self view];
  v16 = [v15 leadingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  id v18 = [v22 trailingAnchor];
  v19 = [(GKTurnBasedMatchDetailViewController *)self view];
  v20 = [v19 trailingAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKTurnBasedMatchDetailViewController;
  [(GKCollectionViewController *)&v4 viewWillAppear:a3];
  [(GKTurnBasedMatchDetailViewController *)self didUpdateModel];
  [(GKTurnBasedMatchDetailViewController *)self setActionButtonEnabled:1];
  [(GKTurnBasedMatchDetailHeaderView *)self->_headerView setLabelAlpha:1.0];
  [(GKTurnBasedMatchDetailViewController *)self updateUIBasedOnTraitCollection];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(GKTurnBasedMatchDetailViewController *)self navigationController];
  objc_super v6 = [v5 navigationBar];
  [(GKTurnBasedMatchDetailViewController *)self _gkConfigureFocusGuidesForNavigationBar:v6];

  v7 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v7 addObserver:self selector:sel_handleTurnBasedEvent_ name:*MEMORY[0x1E4F63228] object:0];

  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedMatchDetailViewController;
  [(GKCollectionViewController *)&v8 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)GKTurnBasedMatchDetailViewController;
  [(GKCollectionViewController *)&v6 viewWillDisappear:v3];
}

- (void)updateUIBasedOnTraitCollection
{
  BOOL v3 = [(GKTurnBasedMatchDetailViewController *)self traitCollection];
  uint64_t v4 = [v3 verticalSizeClass];

  id v5 = [(GKCollectionViewController *)self collectionView];
  [v5 _gkRemoveAllConstraints];

  objc_super v6 = [(GKCollectionViewController *)self collectionView];
  v7 = v6;
  if (v4 == 1)
  {
    objc_super v8 = [v6 widthAnchor];
    v9 = [v8 constraintEqualToConstant:500.0];
    [v9 setActive:1];
  }
  else
  {
    v10 = [v6 leftAnchor];
    v11 = [(GKTurnBasedMatchDetailViewController *)self view];
    v12 = [v11 leftAnchor];
    objc_super v13 = [v10 constraintEqualToAnchor:v12 constant:16.0];
    [v13 setActive:1];

    v7 = [(GKCollectionViewController *)self collectionView];
    objc_super v8 = [v7 rightAnchor];
    v9 = [(GKTurnBasedMatchDetailViewController *)self view];
    v14 = [v9 rightAnchor];
    uint64_t v15 = [v8 constraintEqualToAnchor:v14 constant:-16.0];
    [v15 setActive:1];
  }
  v16 = [(GKCollectionViewController *)self collectionView];
  v17 = [v16 centerXAnchor];
  id v18 = [(GKTurnBasedMatchDetailViewController *)self view];
  v19 = [v18 centerXAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  [v20 setActive:1];

  v21 = [(GKCollectionViewController *)self collectionView];
  id v22 = [v21 topAnchor];
  v23 = [(GKTurnBasedMatchDetailViewController *)self view];
  v24 = [v23 topAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  [v25 setActive:1];

  v26 = [(GKCollectionViewController *)self collectionView];
  v27 = [v26 bottomAnchor];
  v28 = [(GKTurnBasedMatchDetailViewController *)self view];
  v29 = [v28 bottomAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  [v30 setActive:1];

  v31 = [(GKCollectionViewController *)self collectionView];
  [v31 setNeedsLayout];

  id v42 = [(GKCollectionViewDataSource *)self->_participantsDataSource defaultSectionMetrics];
  +[GKTurnParticipantCell defaultRowHeight];
  double v33 = v32;
  v34 = [(GKTurnBasedMatchDetailViewController *)self traitCollection];
  v35 = [v34 preferredContentSizeCategory];
  LODWORD(v28) = UIContentSizeCategoryIsAccessibilityCategory(v35);

  if (v28)
  {
    double v33 = v33 * 1.7;
    [v42 setSectionHeadersShouldPin:0];
  }
  v36 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  [v36 scaledValueForValue:v33];
  objc_msgSend(v42, "setDesiredItemHeight:");

  [v42 setItemHeightList:0];
  v37 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  [v37 scaledValueForValue:self->_initialSectionHeaderHeight];
  objc_msgSend(v42, "setSectionHeaderHeight:");

  v38 = [(GKCollectionViewDataSource *)self->_participantsDataSource dataSourceMetrics];
  v39 = [v38 supplementaryMetricsForKey:@"detailHeader"];

  v40 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  [v40 scaledValueForValue:255.0];
  objc_msgSend(v39, "setDesiredHeight:");

  v41 = [(GKCollectionViewDataSource *)self->_participantsDataSource dataSourceMetrics];
  [v41 replaceSupplementaryMetrics:v39 forKey:@"detailHeader"];

  [(GKCollectionViewController *)self _gkSetContentsNeedUpdateWithHandler:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKTurnBasedMatchDetailViewController;
  [(GKCollectionViewController *)&v4 traitCollectionDidChange:a3];
  [(GKTurnBasedMatchDetailViewController *)self updateUIBasedOnTraitCollection];
}

- (void)didUpdateModel
{
  [(GKTurnBasedMatchDetailHeaderView *)self->_headerView setMatch:self->_match];
  [(GKTurnBasedMatchDetailHeaderView *)self->_headerView setActionSelector:0];
  [(GKTurnBasedMatchDetailHeaderView *)self->_headerView setInfoText:0];
  if ([(GKGame *)self->_game isInstalled])
  {
    switch([(GKTurnBasedMatch *)self->_match state])
    {
      case 1u:
        v16 = GKGameCenterUIFrameworkBundle();
        v17 = GKGetLocalizedStringFromTableInBundle();
        [(GKTurnBasedMatchDetailHeaderView *)self->_headerView setActionText:v17];

        objc_super v13 = sel_acceptInvitation_;
        goto LABEL_9;
      case 2u:
      case 3u:
      case 4u:
      case 5u:
        v14 = GKGameCenterUIFrameworkBundle();
        uint64_t v15 = GKGetLocalizedStringFromTableInBundle();
        [(GKTurnBasedMatchDetailHeaderView *)self->_headerView setActionText:v15];

        objc_super v13 = sel_chooseMatch_;
        goto LABEL_9;
      default:
        [(GKTurnBasedMatchDetailHeaderView *)self->_headerView setActionText:&stru_1F07B2408];
        break;
    }
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F637E8] shared];
    int v4 = [v3 isAppInstallationRestricted];

    if (v4)
    {
      id v5 = NSString;
      objc_super v6 = GKGameCenterUIFrameworkBundle();
      v7 = GKGetLocalizedStringFromTableInBundle();
      objc_super v8 = [(GKTurnBasedMatchDetailViewController *)self game];
      v9 = [v8 name];
      v10 = objc_msgSend(v5, "stringWithFormat:", v7, v9);
      [(GKTurnBasedMatchDetailHeaderView *)self->_headerView setInfoText:v10];
    }
    else
    {
      v11 = GKGameCenterUIFrameworkBundle();
      v12 = GKGetLocalizedStringFromTableInBundle();
      [(GKTurnBasedMatchDetailHeaderView *)self->_headerView setActionText:v12];

      objc_super v13 = sel_buyButtonPressed_;
LABEL_9:
      [(GKTurnBasedMatchDetailHeaderView *)self->_headerView setActionSelector:v13];
    }
  }
  [(GKTurnBasedMatchDetailViewController *)self setupActionButton];
  if (!self->_shouldShowPlay)
  {
    id v18 = [(GKTurnBasedMatchDetailHeaderView *)self->_headerView actionButton];
    [v18 setHidden:1];
  }
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)setupActionButton
{
  switch([(GKTurnBasedMatch *)self->_match state])
  {
    case 1u:
      objc_super v6 = GKGameCenterUIFrameworkBundle();
      GKGetLocalizedStringFromTableInBundle();
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      int v4 = sel_declineInvitation_;
      goto LABEL_12;
    case 2u:
    case 3u:
      BOOL v3 = GKGameCenterUIFrameworkBundle();
      GKGetLocalizedStringFromTableInBundle();
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      if (!self->_isInGame) {
        goto LABEL_11;
      }
      int v4 = sel_quitMatch_;
LABEL_7:
      if (self->_shouldShowQuit || ([(GKTurnBasedMatch *)self->_match isMyTurn] & 1) == 0) {
        goto LABEL_12;
      }
      objc_super v8 = [(GKTurnBasedMatchDetailViewController *)self navigationItem];
      [v8 setRightBarButtonItem:0];
      goto LABEL_14;
    case 4u:
      v7 = GKGameCenterUIFrameworkBundle();
      GKGetLocalizedStringFromTableInBundle();
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      int v4 = sel_quitMatch_;
      if (self->_isInGame) {
        goto LABEL_7;
      }
      goto LABEL_12;
    case 5u:
      v9 = GKGameCenterUIFrameworkBundle();
      GKGetLocalizedStringFromTableInBundle();
      id v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
      int v4 = sel_removeMatch_;
      goto LABEL_12;
    default:
      id v5 = GKGameCenterUIFrameworkBundle();
      GKGetLocalizedStringFromTableInBundle();
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      int v4 = 0;
LABEL_12:
      v10 = [(GKTurnBasedMatchDetailViewController *)self navigationItem];
      v11 = [v10 rightBarButtonItem];
      v12 = [v11 title];
      char v13 = [v12 isEqualToString:v15];

      if (v13) {
        goto LABEL_15;
      }
      objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v15 style:0 target:self action:v4];
      v14 = [(GKTurnBasedMatchDetailViewController *)self navigationItem];
      [v14 setRightBarButtonItem:v8];

LABEL_14:
LABEL_15:

      return;
  }
}

- (void)setActionButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(GKTurnBasedMatchDetailViewController *)self navigationItem];
  int v4 = [v5 rightBarButtonItem];
  [v4 setEnabled:v3];
}

- (void)acceptInvitation:(id)a3
{
  [(GKTurnBasedMatchDetailViewController *)self setActionButtonEnabled:0];
  id v4 = [(GKTurnBasedMatchDetailViewController *)self delegate];
  [v4 turnBasedMatchDetailViewControllerDidAcceptInvitation:self];
}

- (void)declineInvitation:(id)a3
{
  [(GKTurnBasedMatchDetailViewController *)self setActionButtonEnabled:0];
  id v4 = [(GKTurnBasedMatchDetailViewController *)self delegate];
  [v4 turnBasedMatchDetailViewControllerDidDeclineInvitation:self];
}

- (void)chooseMatch:(id)a3
{
  [(GKTurnBasedMatchDetailViewController *)self setActionButtonEnabled:0];
  id v4 = [(GKTurnBasedMatchDetailViewController *)self delegate];
  [v4 turnBasedMatchDetailViewControllerDidChooseMatch:self];
}

- (void)quitMatch:(id)a3
{
  [(GKTurnBasedMatchDetailViewController *)self setActionButtonEnabled:0];
  id v4 = [(GKTurnBasedMatchDetailViewController *)self delegate];
  [v4 turnBasedMatchDetailViewControllerDidQuitMatch:self];
}

- (void)removeMatch:(id)a3
{
  [(GKTurnBasedMatchDetailViewController *)self setActionButtonEnabled:0];
  id v4 = [(GKTurnBasedMatchDetailViewController *)self delegate];
  [v4 turnBasedMatchDetailViewControllerDidRemoveMatch:self];
}

- (void)handleTurnBasedEvent:(id)a3
{
  id v6 = [a3 object];
  id v4 = [(GKTurnBasedMatch *)self->_match matchID];
  int v5 = [v6 isEqual:v4];

  if (v5) {
    [(GKCollectionViewController *)self setNeedsReload];
  }
}

- (void)buyButtonPressed:(id)a3
{
  id v4 = [(GKTurnBasedMatchDetailViewController *)self delegate];
  [v4 turnBasedMatchDetailViewControllerDidShowStore:self];
}

- (void)doneButtonPressed:(id)a3
{
}

- (id)preferredFocusEnvironments
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(GKTurnBasedMatchDetailViewController *)self headerView];
  v5[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (GKTurnBasedMatchDetailViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateWeak);

  return (GKTurnBasedMatchDetailViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GKTurnBasedMatch)match
{
  return self->_match;
}

- (GKGame)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
}

- (BOOL)isInGame
{
  return self->_isInGame;
}

- (void)setIsInGame:(BOOL)a3
{
  self->_isInGame = a3;
}

- (BOOL)shouldShowPlay
{
  return self->_shouldShowPlay;
}

- (void)setShouldShowPlay:(BOOL)a3
{
  self->_shouldShowPlay = a3;
}

- (BOOL)shouldShowQuit
{
  return self->_shouldShowQuit;
}

- (void)setShouldShowQuit:(BOOL)a3
{
  self->_shouldShowQuit = a3;
}

- (GKTurnBasedParticipantsDataSource)participantsDataSource
{
  return self->_participantsDataSource;
}

- (void)setParticipantsDataSource:(id)a3
{
}

- (GKTurnBasedMatchDetailHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_participantsDataSource, 0);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_match, 0);

  objc_destroyWeak((id *)&self->_delegateWeak);
}

@end