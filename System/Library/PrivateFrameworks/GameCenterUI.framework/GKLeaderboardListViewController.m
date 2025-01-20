@interface GKLeaderboardListViewController
- (BOOL)_gkShouldRefreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
- (BOOL)canSegueToScores;
- (BOOL)hasData;
- (BOOL)isDeeplinked;
- (BOOL)isLoading;
- (BOOL)showingLeaderboardSets;
- (GKGameLayerCollectionDataSource)dataSource;
- (GKLeaderboardListViewController)initWithGameRecord:(id)a3 leaderboardSet:(id)a4;
- (GKNoContentView)noContentView;
- (NSDictionary)leaderboardAssetNames;
- (NSDictionary)leaderboardSetAssetNames;
- (UICollectionView)collectionView;
- (id)title;
- (int64_t)preferredLargeTitleDisplayMode;
- (void)clearSelection;
- (void)configureCloseButton;
- (void)dataUpdated:(BOOL)a3 withError:(id)a4;
- (void)dealloc;
- (void)didEnterLoadingState;
- (void)donePressed:(id)a3;
- (void)hideNoContentPlaceholder;
- (void)loadData;
- (void)setCanSegueToScores:(BOOL)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setHorizontalLayout:(BOOL)a3;
- (void)setIsDeeplinked:(BOOL)a3;
- (void)setLeaderboardAssetNames:(id)a3;
- (void)setLeaderboardSetAssetNames:(id)a3;
- (void)setNeedsRefresh;
- (void)setNoContentView:(id)a3;
- (void)setPreferredLargeTitleDisplayMode:(int64_t)a3;
- (void)setShowingLeaderboardSets:(BOOL)a3;
- (void)setupNoContentView:(id)a3 withError:(id)a4;
- (void)setupVisualEffect;
- (void)showNoContentPlaceholderForError:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateLargeTitleInsets;
- (void)updateLayout;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation GKLeaderboardListViewController

- (GKLeaderboardListViewController)initWithGameRecord:(id)a3 leaderboardSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() _gkPlatformNibName];
  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v16.receiver = self;
  v16.super_class = (Class)GKLeaderboardListViewController;
  v10 = [(GKLoadingViewController *)&v16 initWithNibName:v8 bundle:v9];

  if (v10)
  {
    if (v7 || ![v6 supportsLeaderboardSets])
    {
      [(GKLeaderboardListViewController *)v10 setShowingLeaderboardSets:0];
      v11 = [[GKLeaderboardListDataSource alloc] initWithGameRecord:v6 leaderboardSet:v7];
    }
    else
    {
      [(GKLeaderboardListViewController *)v10 setShowingLeaderboardSets:1];
      v11 = [(GKGameLayerCollectionDataSource *)[GKLeaderboardSetDataSource alloc] initWithGameRecord:v6];
    }
    v12 = v11;
    [(GKLeaderboardListViewController *)v10 setDataSource:v11];

    v13 = [(GKLeaderboardListViewController *)v10 title];
    v14 = [(GKLeaderboardListViewController *)v10 navigationItem];
    [v14 setTitle:v13];
  }
  return v10;
}

- (id)title
{
  [(GKLeaderboardListViewController *)self showingLeaderboardSets];
  v2 = GKGameCenterUIFrameworkBundle();
  v3 = GKGetLocalizedStringFromTableInBundle();

  return v3;
}

- (void)setLeaderboardAssetNames:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_leaderboardAssetNames, a3);
  v5 = [(GKLeaderboardListViewController *)self dataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v7 = [(GKLeaderboardListViewController *)self dataSource];
  v8 = v7;
  if (isKindOfClass)
  {
    [v7 setLeaderboardAssetNames:v10];
  }
  else
  {
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) == 0) {
      goto LABEL_6;
    }
    v8 = [(GKLeaderboardListViewController *)self dataSource];
    [v8 setAssetNames:v10];
  }

LABEL_6:
}

- (void)setLeaderboardSetAssetNames:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_leaderboardSetAssetNames, a3);
  v5 = [(GKLeaderboardListViewController *)self dataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(GKLeaderboardListViewController *)self dataSource];
    [v7 setLeaderboardSetAssetNames:v8];
  }
}

- (void)donePressed:(id)a3
{
  id v3 = [(UIViewController *)self _gkExtensionViewController];
  [v3 finish];
}

- (void)viewDidLoad
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)GKLeaderboardListViewController;
  [(GKLeaderboardListViewController *)&v19 viewDidLoad];
  id v3 = [MEMORY[0x1E4FB1618] clearColor];
  v4 = [(GKLeaderboardListViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  [(GKLeaderboardListViewController *)self setupVisualEffect];
  v5 = objc_alloc_init(GKLeaderboardCollectionViewFlowLayout);
  id v6 = [(GKLeaderboardListViewController *)self collectionView];
  [v6 setCollectionViewLayout:v5];

  [(GKLeaderboardListViewController *)self updateLayout];
  id v7 = [(GKLeaderboardListViewController *)self collectionView];

  if (v7)
  {
    id v8 = [(GKLeaderboardListViewController *)self collectionView];
    v20[0] = v8;
    char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [(GKLoadingViewController *)self setViewsToHideWhileLoading:v9];
  }
  id v10 = [(GKLeaderboardListViewController *)self dataSource];
  v11 = [(GKLeaderboardListViewController *)self collectionView];
  [v10 setupCollectionView:v11];

  v12 = [(GKLeaderboardListViewController *)self dataSource];
  [v12 setPresentationViewController:self];

  v13 = [(GKLeaderboardListViewController *)self navigationItem];
  [v13 _setAutoScrollEdgeTransitionDistance:40.0];

  v14 = [(GKLeaderboardListViewController *)self navigationItem];
  [v14 _setManualScrollEdgeAppearanceEnabled:1];

  int64_t v15 = [(GKLeaderboardListViewController *)self preferredLargeTitleDisplayMode];
  objc_super v16 = [(GKLeaderboardListViewController *)self navigationItem];
  [v16 setLargeTitleDisplayMode:v15];

  [(GKLeaderboardListViewController *)self configureCloseButton];
  v17 = [(GKLeaderboardListViewController *)self collectionView];
  v18 = [v17 layer];
  [v18 setOpacity:0.0];
}

- (void)dealloc
{
  id v3 = [(GKLeaderboardListViewController *)self collectionView];
  [v3 setDataSource:0];

  v4 = [(GKLeaderboardListViewController *)self collectionView];
  [v4 setDelegate:0];

  v5.receiver = self;
  v5.super_class = (Class)GKLeaderboardListViewController;
  [(GKLeaderboardListViewController *)&v5 dealloc];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKLeaderboardListViewController;
  [(GKLeaderboardListViewController *)&v4 viewIsAppearing:a3];
  [(GKLeaderboardListViewController *)self updateLargeTitleInsets];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKLeaderboardListViewController;
  [(GKLeaderboardListViewController *)&v5 viewWillAppear:a3];
  objc_super v4 = [(GKLoadingViewController *)self loadingState];
  if (v4 == @"Initial") {
    [(GKLoadingViewController *)self setLoadingState:@"LoadingState"];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GKLeaderboardListViewController;
  [(GKLeaderboardListViewController *)&v3 viewWillDisappear:a3];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)GKLeaderboardListViewController;
  [(GKLeaderboardListViewController *)&v3 viewDidLayoutSubviews];
  [(GKLeaderboardListViewController *)self updateLargeTitleInsets];
}

- (void)setupVisualEffect
{
  id v7 = (id)objc_opt_new();
  objc_super v3 = [MEMORY[0x1E4FB1EF8] _gkGameLayerBackgroundVisualEffect];
  [v7 setBackgroundEffects:v3];

  [v7 _setGroupName:@"gameLayerGroup"];
  objc_super v4 = [(GKLeaderboardListViewController *)self view];
  [v4 insertSubview:v7 atIndex:0];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v5 = (void *)MEMORY[0x1E4F28DC8];
  id v6 = [(GKLeaderboardListViewController *)self view];
  [v5 _gkInstallEdgeConstraintsForView:v7 containedWithinParentView:v6];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKLeaderboardListViewController;
  [(GKLeaderboardListViewController *)&v7 viewDidAppear:a3];
  [(GKLeaderboardListViewController *)self clearSelection];
  [(GKLeaderboardListViewController *)self setNeedsFocusUpdate];
  BOOL v4 = [(GKLeaderboardListViewController *)self showingLeaderboardSets];
  objc_super v5 = @"leaderboardGroups";
  if (v4) {
    objc_super v5 = @"leaderboardCollection";
  }
  id v6 = v5;
  +[GKMetricsBridge recordLeaderboardPageEventWithPageId:v6 withReferrerData:[(GKLeaderboardListViewController *)self isDeeplinked]];
}

- (void)updateLayout
{
  objc_super v3 = [(GKLeaderboardListViewController *)self traitCollection];
  category = [v3 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory(category))
  {
    BOOL v4 = 0;
  }
  else
  {
    objc_super v5 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
    if ([v5 verticalSizeClass] == 1)
    {
      id v6 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v7 = [v6 userInterfaceIdiom];

      BOOL v4 = v7 != 1;
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  [(GKLeaderboardListViewController *)self setHorizontalLayout:v4];
}

- (int64_t)preferredLargeTitleDisplayMode
{
  if (self->_preferredLargeTitleDisplayMode) {
    return self->_preferredLargeTitleDisplayMode;
  }
  else {
    return 2;
  }
}

- (void)updateLargeTitleInsets
{
  objc_super v3 = [(GKLeaderboardListViewController *)self navigationController];
  id v19 = [v3 navigationBar];

  BOOL v4 = [(GKLeaderboardListViewController *)self navigationItem];
  uint64_t v5 = [v4 largeTitleDisplayMode];

  if (v5 != 2 && v19)
  {
    id v6 = [GameLayerPageGrid alloc];
    uint64_t v7 = [(GKLeaderboardListViewController *)self view];
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;
    v12 = [(GKLeaderboardListViewController *)self traitCollection];
    v13 = -[GameLayerPageGrid initWithSize:traitCollection:](v6, "initWithSize:traitCollection:", v12, v9, v11);

    [(GameLayerPageGrid *)v13 centeringInsets];
    double v15 = v14;
    [(GameLayerPageGrid *)v13 centeringInsets];
    double v17 = v16;
    v18 = [(GKLeaderboardListViewController *)self navigationItem];
    objc_msgSend(v18, "setLargeTitleInsets:", 0.0, v15, 0.0, v17);

    [v19 setNeedsLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GKLeaderboardListViewController;
  id v4 = a3;
  [(GKLeaderboardListViewController *)&v9 traitCollectionDidChange:v4];
  uint64_t v5 = [(GKLeaderboardListViewController *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];

  uint64_t v7 = [v4 preferredContentSizeCategory];

  if (v7 != v6)
  {
    [(GKLeaderboardListViewController *)self updateLayout];
    double v8 = [(GKLeaderboardListViewController *)self collectionView];
    [v8 reloadData];
  }
}

- (BOOL)isLoading
{
  v2 = [(GKLoadingViewController *)self loadingState];
  BOOL v3 = 1;
  if (v2)
  {
    if (v2 != @"Initial" && v2 != @"LoadingState") {
      BOOL v3 = v2 == @"RefreshingState";
    }
  }

  return v3;
}

- (void)didEnterLoadingState
{
  v3.receiver = self;
  v3.super_class = (Class)GKLeaderboardListViewController;
  [(GKLoadingViewController *)&v3 didEnterLoadingState];
  [(GKLeaderboardListViewController *)self loadData];
}

- (void)loadData
{
  objc_super v3 = [(GKLeaderboardListViewController *)self dataSource];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__GKLeaderboardListViewController_loadData__block_invoke;
  v4[3] = &unk_1E5F645B0;
  v4[4] = self;
  [v3 loadDataWithCompletionHandler:v4];
}

void __43__GKLeaderboardListViewController_loadData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) dataUpdated:a2 withError:a3];
  [MEMORY[0x1E4F39CF8] begin];
  id v4 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v4 setRemovedOnCompletion:0];
  [v4 setFromValue:&unk_1F0812180];
  [v4 setToValue:&unk_1F0812198];
  [v4 setDuration:0.33];
  [v4 setRepeatCount:0.0];
  [v4 setAutoreverses:0];
  [v4 setFillMode:*MEMORY[0x1E4F39FA0]];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__GKLeaderboardListViewController_loadData__block_invoke_66;
  v7[3] = &unk_1E5F62EB0;
  v7[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v7];
  uint64_t v5 = [*(id *)(a1 + 32) collectionView];
  id v6 = [v5 layer];
  [v6 addAnimation:v4 forKey:@"opacity"];

  [MEMORY[0x1E4F39CF8] commit];
}

void __43__GKLeaderboardListViewController_loadData__block_invoke_66(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) collectionView];
  v1 = [v3 layer];
  LODWORD(v2) = 1.0;
  [v1 setOpacity:v2];
}

- (BOOL)hasData
{
  double v2 = [(GKLeaderboardListViewController *)self dataSource];
  BOOL v3 = [v2 itemCount] > 0;

  return v3;
}

- (void)dataUpdated:(BOOL)a3 withError:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  if (![(GKLeaderboardListViewController *)self hasData])
  {
    [(GKLoadingViewController *)self setLoadingState:@"NoContentState"];
    [(GKLeaderboardListViewController *)self showNoContentPlaceholderForError:v9];
    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [(GKLoadingViewController *)self setLoadingState:@"LoadedState"];
  [(GKLeaderboardListViewController *)self hideNoContentPlaceholder];
  if (v4)
  {
LABEL_5:
    id v6 = [(GKLeaderboardListViewController *)self collectionView];
    uint64_t v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    [v6 reloadSections:v7];

    [(GKLeaderboardListViewController *)self setNeedsFocusUpdate];
    double v8 = [(GKLeaderboardListViewController *)self navigationController];
    [v8 setNeedsFocusUpdate];
  }
LABEL_6:
}

- (void)showNoContentPlaceholderForError:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_collectionView)
  {
    uint64_t v5 = [(GKLeaderboardListViewController *)self collectionView];
    [v5 setHidden:1];

    id v6 = [(GKLeaderboardListViewController *)self noContentView];

    if (!v6)
    {
      uint64_t v7 = [GKNoContentView alloc];
      [(UICollectionView *)self->_collectionView bounds];
      double v8 = -[GKNoContentView initWithFrame:](v7, "initWithFrame:");
      [(GKLeaderboardListViewController *)self setNoContentView:v8];

      id v9 = [(GKLeaderboardListViewController *)self noContentView];
      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

      double v10 = [(GKLeaderboardListViewController *)self collectionView];
      double v11 = [v10 superview];

      v12 = [(GKLeaderboardListViewController *)self noContentView];
      v13 = [(GKLeaderboardListViewController *)self collectionView];
      [v11 insertSubview:v12 aboveSubview:v13];

      double v14 = (void *)MEMORY[0x1E4F28DC8];
      double v15 = [(GKLeaderboardListViewController *)self noContentView];
      double v16 = [(GKLeaderboardListViewController *)self collectionView];
      double v17 = objc_msgSend(v14, "_gkConstraintsForView:withinView:insets:", v15, v16, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
      [v11 addConstraints:v17];

      v18 = [(GKLeaderboardListViewController *)self collectionView];
      v22[0] = v18;
      id v19 = [(GKLeaderboardListViewController *)self noContentView];
      v22[1] = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
      [(GKLoadingViewController *)self setViewsToHideWhileLoading:v20];
    }
    [(GKLeaderboardListViewController *)self setupNoContentView:self->_noContentView withError:v4];
    v21 = [(GKLeaderboardListViewController *)self noContentView];
    [v21 setHidden:0];
  }
}

- (void)hideNoContentPlaceholder
{
  BOOL v3 = [(GKLeaderboardListViewController *)self noContentView];
  [v3 setHidden:1];

  id v4 = [(GKLeaderboardListViewController *)self collectionView];
  [v4 setHidden:0];
}

- (void)setupNoContentView:(id)a3 withError:(id)a4
{
  id v9 = a3;
  uint64_t v5 = GKGameCenterUIFrameworkBundle();
  id v6 = GKGetLocalizedStringFromTableInBundle();
  [v9 setTitle:v6];

  if (a4)
  {
    uint64_t v7 = GKGameCenterUIFrameworkBundle();
    double v8 = GKGetLocalizedStringFromTableInBundle();
    [v9 setMessage:v8];
  }
  else
  {
    [v9 setMessage:0];
  }
}

- (void)setNeedsRefresh
{
  if (![(GKLeaderboardListViewController *)self isLoading])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__GKLeaderboardListViewController_setNeedsRefresh__block_invoke;
    block[3] = &unk_1E5F62EB0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __50__GKLeaderboardListViewController_setNeedsRefresh__block_invoke()
{
  gk_dispatch_debounce();
  dispatch_time_t v0 = dispatch_time(0, 1000000000);
  dispatch_after(v0, MEMORY[0x1E4F14428], &__block_literal_global_37);
}

uint64_t __50__GKLeaderboardListViewController_setNeedsRefresh__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isLoading];
  if ((result & 1) == 0)
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 setLoadingState:@"RefreshingState"];
  }
  return result;
}

uint64_t __50__GKLeaderboardListViewController_setNeedsRefresh__block_invoke_3()
{
  return GKAtomicCompareAndSwap32();
}

- (BOOL)_gkShouldRefreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  return (a3 & 0xFFFFFFFD) == 9;
}

- (void)configureCloseButton
{
  id v5 = [MEMORY[0x1E4FB14D0] _gkXmarkedCloseButtonWithTarget:self action:sel_donePressed_];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v5];
  id v4 = [(GKLeaderboardListViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];
}

- (void)setHorizontalLayout:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(GKLeaderboardListViewController *)self collectionView];
  id v10 = [v5 collectionViewLayout];

  [v10 setScrollDirection:v3];
  id v6 = [(GKLeaderboardListViewController *)self collectionView];
  [v6 setAlwaysBounceVertical:v3 ^ 1];

  uint64_t v7 = [(GKLeaderboardListViewController *)self collectionView];
  [v7 setAlwaysBounceHorizontal:v3];

  double v8 = [(GKLeaderboardListViewController *)self collectionView];
  [v8 setShowsVerticalScrollIndicator:v3 ^ 1];

  id v9 = [(GKLeaderboardListViewController *)self collectionView];
  [v9 setShowsHorizontalScrollIndicator:v3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)GKLeaderboardListViewController;
  id v7 = a4;
  -[GKLeaderboardListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__GKLeaderboardListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5F63B68;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:&__block_literal_global_85];
}

void __86__GKLeaderboardListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateLayout];
  id v3 = [*(id *)(a1 + 32) collectionView];
  double v2 = [v3 collectionViewLayout];
  [v2 invalidateLayout];
}

- (void)clearSelection
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(GKLeaderboardListViewController *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        double v11 = [(GKLeaderboardListViewController *)self collectionView];
        [v11 deselectItemAtIndexPath:v10 animated:1];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (GKGameLayerCollectionDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSDictionary)leaderboardSetAssetNames
{
  return self->_leaderboardSetAssetNames;
}

- (NSDictionary)leaderboardAssetNames
{
  return self->_leaderboardAssetNames;
}

- (BOOL)isDeeplinked
{
  return self->_isDeeplinked;
}

- (void)setIsDeeplinked:(BOOL)a3
{
  self->_isDeeplinked = a3;
}

- (void)setPreferredLargeTitleDisplayMode:(int64_t)a3
{
  self->_preferredLargeTitleDisplayMode = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (BOOL)showingLeaderboardSets
{
  return self->_showingLeaderboardSets;
}

- (void)setShowingLeaderboardSets:(BOOL)a3
{
  self->_showingLeaderboardSets = a3;
}

- (GKNoContentView)noContentView
{
  return self->_noContentView;
}

- (void)setNoContentView:(id)a3
{
}

- (BOOL)canSegueToScores
{
  return self->_canSegueToScores;
}

- (void)setCanSegueToScores:(BOOL)a3
{
  self->_canSegueToScores = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_leaderboardAssetNames, 0);
  objc_storeStrong((id *)&self->_leaderboardSetAssetNames, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end