@interface GKDashboardLeaderboardScoreViewController
+ (int64_t)initialTimeScope;
+ (void)setInitialTimeScope:(int64_t)a3;
- (BOOL)shouldUseTwoColumnLayoutForSize:(CGSize)a3;
- (GKDashboardLeaderboardScoreDataSource)friendDataSource;
- (GKDashboardLeaderboardScoreDataSource)globalDataSource;
- (GKDashboardLeaderboardScoreHeaderView)headerView;
- (GKDashboardLeaderboardScoreViewController)initWithGameRecord:(id)a3 leaderboard:(id)a4;
- (GKLeaderboard)leaderboard;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)timeScope;
- (void)dataUpdated:(BOOL)a3 withError:(id)a4;
- (void)donePressed:(id)a3;
- (void)setFriendDataSource:(id)a3;
- (void)setGlobalDataSource:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setLeaderboard:(id)a3;
- (void)setTimeScope:(int64_t)a3;
- (void)setupNoContentView:(id)a3 withError:(id)a4;
- (void)timeScopePressed:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateColumnLayoutForSize:(CGSize)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation GKDashboardLeaderboardScoreViewController

- (GKDashboardLeaderboardScoreViewController)initWithGameRecord:(id)a3 leaderboard:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() _gkPlatformNibName];
  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v25.receiver = self;
  v25.super_class = (Class)GKDashboardLeaderboardScoreViewController;
  v10 = [(GKDashboardCollectionViewController *)&v25 initWithNibName:v8 bundle:v9];

  if (v10)
  {
    [(GKDashboardLeaderboardScoreViewController *)v10 setLeaderboard:v7];
    v11 = [v7 title];
    [(GKDashboardLeaderboardScoreViewController *)v10 setTitle:v11];

    v10->_timeScope = sInitialTimeScope_0;
    id v12 = objc_alloc(MEMORY[0x1E4F63738]);
    v13 = [v7 internal];
    v14 = (void *)[v12 initWithInternalRepresentation:v13];

    [v14 setPlayerScope:1];
    [v14 setTimeScope:v10->_timeScope];
    v15 = [[GKDashboardLeaderboardScoreDataSource alloc] initWithGameRecord:v6 leaderboard:v14];
    friendDataSource = v10->_friendDataSource;
    v10->_friendDataSource = v15;

    [(GKDashboardLeaderboardScoreDataSource *)v10->_friendDataSource setTimeScopeTarget:v10];
    [(GKDashboardLeaderboardScoreDataSource *)v10->_friendDataSource setTimeScopeAction:sel_timeScopePressed_];
    id v17 = objc_alloc(MEMORY[0x1E4F63738]);
    v18 = [v7 internal];
    v19 = (void *)[v17 initWithInternalRepresentation:v18];

    [v19 setPlayerScope:0];
    [v19 setTimeScope:v10->_timeScope];
    v20 = [[GKDashboardLeaderboardScoreDataSource alloc] initWithGameRecord:v6 leaderboard:v19];
    globalDataSource = v10->_globalDataSource;
    v10->_globalDataSource = v20;

    [(GKDashboardLeaderboardScoreDataSource *)v10->_globalDataSource setTimeScopeTarget:v10];
    [(GKDashboardLeaderboardScoreDataSource *)v10->_globalDataSource setTimeScopeAction:sel_timeScopePressed_];
    v22 = objc_alloc_init(GKCollectionMultiDataSource);
    v26[0] = v10->_friendDataSource;
    v26[1] = v10->_globalDataSource;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    [(GKCollectionMultiDataSource *)v22 setDataSources:v23];

    [(GKDashboardCollectionViewController *)v10 setDataSource:v22];
    [(GKLoadingViewController *)v10 setLoadingIndicatorDelay:0.0];
  }
  return v10;
}

+ (int64_t)initialTimeScope
{
  return sInitialTimeScope_0;
}

+ (void)setInitialTimeScope:(int64_t)a3
{
  sInitialTimeScope_0 = a3;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)GKDashboardLeaderboardScoreViewController;
  [(GKDashboardCollectionViewController *)&v15 viewDidLoad];
  v3 = [(UIViewController *)self _gkExtensionViewController];
  v4 = [(GKDashboardLeaderboardScoreViewController *)self leaderboard];
  v5 = [v4 identifier];
  [v3 dashboardDidChangeToLeaderboardIdentifier:v5];

  id v6 = [(GKDashboardCollectionViewController *)self collectionView];
  id v7 = [(GKDashboardLeaderboardScoreViewController *)self view];
  [v7 bounds];
  LODWORD(v5) = -[GKDashboardLeaderboardScoreViewController shouldUseTwoColumnLayoutForSize:](self, "shouldUseTwoColumnLayoutForSize:", v8, v9);

  v10 = off_1E5F61E38;
  if (!v5) {
    v10 = off_1E5F61E48;
  }
  id v11 = objc_alloc_init(*v10);
  [v11 setTopHeaderHeight:0.0];
  [v6 setCollectionViewLayout:v11];
  id v12 = [(GKDashboardCollectionViewController *)self dataSource];
  [v12 setupCollectionView:v6];

  [v11 topHeaderHeight];
  if (v13 > 0.0)
  {
    v14 = +[NSObject _gkNib];
    [v6 registerNib:v14 forSupplementaryViewOfKind:@"GKCollectionLayoutTopHeaderKind" withReuseIdentifier:@"topHeader"];
    [v6 setDataSource:self];
  }
}

- (void)dataUpdated:(BOOL)a3 withError:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)GKDashboardLeaderboardScoreViewController;
  [(GKDashboardCollectionViewController *)&v14 dataUpdated:a3 withError:a4];
  int64_t v5 = [(GKDashboardLeaderboardScoreDataSource *)self->_friendDataSource itemCount];
  id v6 = [MEMORY[0x1E4F637F8] reporter];
  uint64_t v7 = *MEMORY[0x1E4F634E0];
  [v6 reportEvent:*MEMORY[0x1E4F634E0] type:*MEMORY[0x1E4F63120]];

  double v8 = [MEMORY[0x1E4F637F8] reporter];
  uint64_t v9 = *MEMORY[0x1E4F630E0];
  v10 = [NSNumber numberWithInteger:v5];
  [v8 reportEvent:v7 type:v9 friendsPlayedThisGame:v10];

  id v11 = [(GKDashboardLeaderboardScoreViewController *)self title];

  if (!v11)
  {
    id v12 = [(GKDashboardLeaderboardScoreDataSource *)self->_globalDataSource leaderboard];
    double v13 = [v12 title];
    [(GKDashboardLeaderboardScoreViewController *)self setTitle:v13];
  }
}

- (void)setupNoContentView:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __74__GKDashboardLeaderboardScoreViewController_setupNoContentView_withError___block_invoke;
  v19 = &unk_1E5F664F0;
  objc_copyWeak(&v20, &location);
  [v6 setButtonAction:&v16];
  unint64_t timeScope = self->_timeScope;
  if (timeScope < 2)
  {
    id v11 = GKGameCenterUIFrameworkBundle();
    id v12 = GKGetLocalizedStringFromTableInBundle();
    objc_msgSend(v6, "setTitle:", v12, v16, v17, v18, v19);

    double v13 = GKGameCenterUIFrameworkBundle();
    objc_super v14 = GKGetLocalizedStringFromTableInBundle();
    [v6 setMessage:v14];

    objc_super v15 = [MEMORY[0x1E4F63738] localizedStringForTimeScope:self->_timeScope];
    [v6 setButtonTitle:v15];
  }
  else if (timeScope == 2)
  {
    uint64_t v9 = GKGameCenterUIFrameworkBundle();
    v10 = GKGetLocalizedStringFromTableInBundle();
    objc_msgSend(v6, "setTitle:", v10, v16, v17, v18, v19);

    [v6 setMessage:0];
    [v6 setButtonTitle:0];
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __74__GKDashboardLeaderboardScoreViewController_setupNoContentView_withError___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained timeScopePressed:v5];
  }
}

- (BOOL)shouldUseTwoColumnLayoutForSize:(CGSize)a3
{
  double width = a3.width;
  id v5 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", a3.width, a3.height);
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 1 && width > 400.0) {
    return 1;
  }
  double v8 = [(GKDashboardLeaderboardScoreViewController *)self traitCollection];
  BOOL v9 = [v8 verticalSizeClass] == 1;

  return v9;
}

- (void)updateColumnLayoutForSize:(CGSize)a3
{
  -[GKDashboardLeaderboardScoreViewController shouldUseTwoColumnLayoutForSize:](self, "shouldUseTwoColumnLayoutForSize:", a3.width, a3.height);
  v4 = (objc_class *)objc_opt_class();
  id v5 = [(GKDashboardCollectionViewController *)self collectionView];
  uint64_t v6 = [v5 collectionViewLayout];
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v9 = objc_alloc_init(v4);
    [v9 setTopHeaderHeight:0.0];
    double v8 = [(GKDashboardCollectionViewController *)self collectionView];
    [v8 setCollectionViewLayout:v9];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)GKDashboardLeaderboardScoreViewController;
  id v7 = a4;
  -[GKDashboardLeaderboardScoreViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = [(GKDashboardLeaderboardScoreViewController *)self traitCollection];
  uint64_t v9 = [v8 horizontalSizeClass];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__GKDashboardLeaderboardScoreViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E5F66D08;
  v10[4] = self;
  v10[5] = v9;
  *(double *)&v10[6] = width;
  *(double *)&v10[7] = height;
  [v7 animateAlongsideTransition:v10 completion:0];
}

void __96__GKDashboardLeaderboardScoreViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) traitCollection];
  uint64_t v4 = [v3 horizontalSizeClass];

  if (v2 == v4)
  {
    id v5 = *(void **)(a1 + 32);
    double v6 = *(double *)(a1 + 48);
    double v7 = *(double *)(a1 + 56);
    objc_msgSend(v5, "updateColumnLayoutForSize:", v6, v7);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [(GKDashboardLeaderboardScoreViewController *)self view];
  [v6 frame];
  -[GKDashboardLeaderboardScoreViewController updateColumnLayoutForSize:](self, "updateColumnLayoutForSize:", v4, v5);
}

- (void)timeScopePressed:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v6 = (void *)MEMORY[0x1E4FB1410];
  double v7 = GKGameCenterUIFrameworkBundle();
  double v8 = GKGetLocalizedStringFromTableInBundle();
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __62__GKDashboardLeaderboardScoreViewController_timeScopePressed___block_invoke;
  v38[3] = &unk_1E5F66D30;
  v38[4] = self;
  uint64_t v9 = [v6 _actionWithTitle:v8 image:0 style:0 handler:0 shouldDismissHandler:v38];
  [v5 addAction:v9];

  v10 = (void *)MEMORY[0x1E4FB1410];
  objc_super v11 = GKGameCenterUIFrameworkBundle();
  id v12 = GKGetLocalizedStringFromTableInBundle();
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __62__GKDashboardLeaderboardScoreViewController_timeScopePressed___block_invoke_2;
  v37[3] = &unk_1E5F66D30;
  v37[4] = self;
  double v13 = [v10 _actionWithTitle:v12 image:0 style:0 handler:0 shouldDismissHandler:v37];
  [v5 addAction:v13];

  objc_super v14 = (void *)MEMORY[0x1E4FB1410];
  objc_super v15 = GKGameCenterUIFrameworkBundle();
  uint64_t v16 = GKGetLocalizedStringFromTableInBundle();
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __62__GKDashboardLeaderboardScoreViewController_timeScopePressed___block_invoke_3;
  v36[3] = &unk_1E5F66D30;
  v36[4] = self;
  uint64_t v17 = [v14 _actionWithTitle:v16 image:0 style:0 handler:0 shouldDismissHandler:v36];
  [v5 addAction:v17];

  v18 = [v5 actions];
  v19 = [v18 objectAtIndexedSubscript:self->_timeScope];
  [v5 setPreferredAction:v19];

  id v20 = [v5 preferredAction];
  [v20 _setChecked:1];

  v21 = [v4 superview];
  v22 = [v5 popoverPresentationController];
  [v22 setSourceView:v21];

  v23 = [(GKDashboardCollectionViewController *)self dataSource];
  uint64_t v24 = [v23 itemCount];

  [v4 frame];
  double x = v25;
  double v28 = v27;
  double width = v29;
  double v32 = v31;
  if (v24 <= 0)
  {
    [v4 frame];
    CGFloat v34 = v33 * 0.25;
    v39.origin.double x = x;
    v39.origin.y = v28;
    v39.size.double width = width;
    v39.size.double height = v32;
    CGRect v40 = CGRectInset(v39, v34, 0.0);
    double x = v40.origin.x;
    double width = v40.size.width;
    double v32 = v40.size.height * 0.5;
    double v28 = v40.origin.y + 70.0;
  }
  v35 = [v5 popoverPresentationController];
  objc_msgSend(v35, "setSourceRect:", x, v28, width, v32);

  [(GKDashboardLeaderboardScoreViewController *)self presentViewController:v5 animated:1 completion:0];
}

uint64_t __62__GKDashboardLeaderboardScoreViewController_timeScopePressed___block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __62__GKDashboardLeaderboardScoreViewController_timeScopePressed___block_invoke_2(uint64_t a1)
{
  return 1;
}

uint64_t __62__GKDashboardLeaderboardScoreViewController_timeScopePressed___block_invoke_3(uint64_t a1)
{
  return 1;
}

- (void)setTimeScope:(int64_t)a3
{
  if (self->_timeScope != a3)
  {
    self->_unint64_t timeScope = a3;
    -[GKDashboardLeaderboardScoreHeaderView setTimeScope:](self->_headerView, "setTimeScope:");
    [(GKDashboardLeaderboardScoreDataSource *)self->_friendDataSource setTimeScope:a3];
    [(GKDashboardLeaderboardScoreDataSource *)self->_globalDataSource setTimeScope:a3];
    [(id)objc_opt_class() setInitialTimeScope:a3];
    double v5 = [(UIViewController *)self _gkExtensionViewController];
    [v5 dashboardDidChangeToLeaderboardTimeScope:a3];

    [(GKDashboardCollectionViewController *)self setNeedsRefresh];
  }
}

- (void)donePressed:(id)a3
{
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if ([v9 isEqualToString:@"GKCollectionLayoutTopHeaderKind"])
  {
    objc_super v11 = [v10 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"topHeader" forIndexPath:v8];

    [v11 setTimeScope:self->_timeScope];
    id v12 = [(GKLeaderboard *)self->_leaderboard title];
    [v11 setTitle:v12];

    [v11 setTimeScopeTarget:self];
    [v11 setTimeScopeAction:sel_timeScopePressed_];
    [(GKDashboardLeaderboardScoreViewController *)self setHeaderView:v11];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)GKDashboardLeaderboardScoreViewController;
    objc_super v11 = [(GKDashboardCollectionViewController *)&v14 collectionView:v10 viewForSupplementaryElementOfKind:v9 atIndexPath:v8];
  }

  return v11;
}

- (GKDashboardLeaderboardScoreHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (GKLeaderboard)leaderboard
{
  return self->_leaderboard;
}

- (void)setLeaderboard:(id)a3
{
}

- (GKDashboardLeaderboardScoreDataSource)friendDataSource
{
  return self->_friendDataSource;
}

- (void)setFriendDataSource:(id)a3
{
}

- (GKDashboardLeaderboardScoreDataSource)globalDataSource
{
  return self->_globalDataSource;
}

- (void)setGlobalDataSource:(id)a3
{
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalDataSource, 0);
  objc_storeStrong((id *)&self->_friendDataSource, 0);
  objc_storeStrong((id *)&self->_leaderboard, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end