@interface GKDashboardCollectionViewController
- (BOOL)autoWidthUsesTwoColumnsWhenSpace;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)hasData;
- (BOOL)isLoading;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (GKCollectionDataSource)dataSource;
- (GKDashboardCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (GKNoContentView)noContentView;
- (NSLayoutConstraint)keyboardConstraint;
- (NSMutableIndexSet)sectionsToReload;
- (UICollectionView)collectionView;
- (UIEdgeInsets)contentInsetsBeforeKeyboard;
- (UIEdgeInsets)scrollInsetsBeforeKeyboard;
- (UIView)collectionContainerView;
- (UIView)keyboardAdjustedView;
- (double)keyboardConstraintDefaultConstant;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)dismissHandler;
- (id)horizontalCollectionViewLayout;
- (id)preferredFocusEnvironments;
- (id)verticalCollectionViewLayout;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)clearSelection;
- (void)clearSelectionForCollectionView:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didFocusItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnfocusItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)contentSizeCategoryDidChangeNotification:(id)a3;
- (void)createCollectionViewInsideView:(id)a3;
- (void)dataUpdated:(BOOL)a3 withError:(id)a4;
- (void)dealloc;
- (void)didEnterLoadingState;
- (void)hideNoContentPlaceholder;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)loadData;
- (void)loadView;
- (void)popoverDidClose:(id)a3;
- (void)prepareForAutomaticTwoColumnLayout;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setAutoWidthColumns:(int64_t)a3;
- (void)setAutoWidthUsesTwoColumnsWhenSpace:(BOOL)a3;
- (void)setCollectionContainerView:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContentInsetsBeforeKeyboard:(UIEdgeInsets)a3;
- (void)setDataSource:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setKeyboardAdjustedView:(id)a3;
- (void)setKeyboardConstraint:(id)a3;
- (void)setKeyboardConstraintDefaultConstant:(double)a3;
- (void)setNeedsRefresh;
- (void)setNoContentView:(id)a3;
- (void)setScrollInsetsBeforeKeyboard:(UIEdgeInsets)a3;
- (void)setSectionsToReload:(id)a3;
- (void)setToHorizontalLayout:(BOOL)a3;
- (void)setupDataSource;
- (void)setupNoContentView:(id)a3 withError:(id)a4;
- (void)setupVisualEffect;
- (void)showNoContentPlaceholderForError:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)windowDidEndSheet:(id)a3;
@end

@implementation GKDashboardCollectionViewController

- (GKDashboardCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)GKDashboardCollectionViewController;
  v4 = [(GKLoadingViewController *)&v9 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel_contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v4 selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v4 selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(UICollectionView *)self->_collectionView setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)GKDashboardCollectionViewController;
  [(GKDashboardCollectionViewController *)&v4 dealloc];
}

- (void)setToHorizontalLayout:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)[(GKDashboardCollectionViewController *)self view];
  if (v3) {
    [(GKDashboardCollectionViewController *)self horizontalCollectionViewLayout];
  }
  else {
  v6 = [(GKDashboardCollectionViewController *)self verticalCollectionViewLayout];
  }
  [(UICollectionView *)self->_collectionView setCollectionViewLayout:v6];

  [(UICollectionView *)self->_collectionView setAlwaysBounceVertical:v3 ^ 1];
  [(UICollectionView *)self->_collectionView setAlwaysBounceHorizontal:v3];
  if (self->_dataSource)
  {
    [(GKDashboardCollectionViewController *)self setupDataSource];
  }
}

- (id)horizontalCollectionViewLayout
{
  v2 = objc_alloc_init(GKCollectionHorizontalLayout);
  [(UICollectionViewFlowLayout *)v2 setMinimumLineSpacing:0.0];

  return v2;
}

- (id)verticalCollectionViewLayout
{
  v2 = objc_alloc_init(GKCollectionGridLayout);

  return v2;
}

- (void)loadView
{
  BOOL v3 = [(GKDashboardCollectionViewController *)self nibName];

  if (v3)
  {
    v10.receiver = self;
    v10.super_class = (Class)GKDashboardCollectionViewController;
    [(GKDashboardCollectionViewController *)&v10 loadView];
    collectionView = self->_collectionView;
    if (collectionView) {
      goto LABEL_6;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionContainerView);

    if (WeakRetained)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_collectionContainerView);
      [(GKDashboardCollectionViewController *)self createCollectionViewInsideView:v6];
    }
    collectionView = self->_collectionView;
    if (collectionView)
    {
LABEL_6:
      v7 = [(UICollectionView *)collectionView collectionViewLayout];

      if (!v7) {
        [(GKDashboardCollectionViewController *)self setToHorizontalLayout:0];
      }
    }
    [(UICollectionView *)self->_collectionView setContentInsetAdjustmentBehavior:0];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    id v9 = (id)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v9 setBackgroundColor:0];
    [v9 setOpaque:0];
    [v9 setAutoresizingMask:18];
    [(GKDashboardCollectionViewController *)self setView:v9];
    [(GKDashboardCollectionViewController *)self createCollectionViewInsideView:v9];
  }
}

- (void)createCollectionViewInsideView:(id)a3
{
  id v4 = a3;
  id v9 = objc_alloc_init(GKCollectionGridLayout);
  id v5 = objc_alloc(MEMORY[0x1E4FB1568]);
  id v6 = objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v9, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(GKDashboardCollectionViewController *)self setCollectionView:v6];

  v7 = [MEMORY[0x1E4FB1618] clearColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v7];

  [(UICollectionView *)self->_collectionView setOpaque:0];
  [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UICollectionView *)self->_collectionView setAlwaysBounceVertical:1];
  [v4 addSubview:self->_collectionView];
  id v8 = objc_msgSend(MEMORY[0x1E4F28DC8], "_gkConstraintsForView:withinView:insets:", self->_collectionView, v4, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v4 addConstraints:v8];
}

- (void)viewDidLoad
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)GKDashboardCollectionViewController;
  [(GKDashboardCollectionViewController *)&v7 viewDidLoad];
  if (self->_collectionView)
  {
    v8[0] = self->_collectionView;
    BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [(GKLoadingViewController *)self setViewsToHideWhileLoading:v3];
  }
  [(GKDashboardCollectionViewController *)self setupDataSource];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardConstraint);
  [WeakRetained constant];
  -[GKDashboardCollectionViewController setKeyboardConstraintDefaultConstant:](self, "setKeyboardConstraintDefaultConstant:");

  id v5 = objc_loadWeakRetained((id *)&self->_keyboardAdjustedView);
  if (!v5) {
    [(GKDashboardCollectionViewController *)self setKeyboardAdjustedView:self->_collectionView];
  }
  id v6 = [(GKDashboardCollectionViewController *)self collectionView];
  [(GKDashboardCollectionViewController *)self setContentScrollView:v6 forEdge:15];

  [(GKDashboardCollectionViewController *)self prepareForAutomaticTwoColumnLayout];
  [(GKDashboardCollectionViewController *)self setupVisualEffect];
}

- (void)setupVisualEffect
{
  id v7 = (id)objc_opt_new();
  BOOL v3 = [MEMORY[0x1E4FB1EF8] _gkGameLayerBackgroundVisualEffect];
  [v7 setBackgroundEffects:v3];

  [v7 _setGroupName:@"gameLayerGroup"];
  id v4 = [(GKDashboardCollectionViewController *)self view];
  [v4 insertSubview:v7 atIndex:0];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = (void *)MEMORY[0x1E4F28DC8];
  id v6 = [(GKDashboardCollectionViewController *)self view];
  [v5 _gkInstallEdgeConstraintsForView:v7 containedWithinParentView:v6];
}

- (void)prepareForAutomaticTwoColumnLayout
{
  if (self->_autoWidthUsesTwoColumnsWhenSpace)
  {
    BOOL v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 == 1)
    {
      uint64_t v5 = 1;
    }
    else
    {
      id v6 = [(GKDashboardCollectionViewController *)self traitCollection];
      if ([v6 verticalSizeClass] == 1) {
        uint64_t v5 = 2;
      }
      else {
        uint64_t v5 = 1;
      }
    }
    [(GKDashboardCollectionViewController *)self setAutoWidthColumns:v5];
  }
}

- (id)preferredFocusEnvironments
{
  v6[1] = *MEMORY[0x1E4F143B8];
  collectionView = self->_collectionView;
  if (collectionView)
  {
    BOOL v3 = collectionView;
LABEL_4:
    v6[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

    goto LABEL_5;
  }
  BOOL v3 = [(GKDashboardCollectionViewController *)self view];
  if (v3) {
    goto LABEL_4;
  }
  uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_5:

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKDashboardCollectionViewController;
  [(GKDashboardCollectionViewController *)&v4 traitCollectionDidChange:a3];
  [(GKDashboardCollectionViewController *)self prepareForAutomaticTwoColumnLayout];
}

- (void)setDataSource:(id)a3
{
  uint64_t v5 = (GKCollectionDataSource *)a3;
  dataSource = self->_dataSource;
  if (dataSource != v5)
  {
    id v7 = v5;
    [(GKCollectionDataSource *)dataSource setPresentationViewController:0];
    objc_storeStrong((id *)&self->_dataSource, a3);
    dataSource = (GKCollectionDataSource *)[(GKDashboardCollectionViewController *)self setupDataSource];
    uint64_t v5 = v7;
  }

  MEMORY[0x1F41817F8](dataSource, v5);
}

- (void)setupDataSource
{
  dataSource = self->_dataSource;
  if (dataSource)
  {
    [(GKCollectionDataSource *)dataSource setupCollectionView:self->_collectionView];
    objc_super v4 = self->_dataSource;
    [(GKCollectionDataSource *)v4 setPresentationViewController:self];
  }
  else
  {
    [(UICollectionView *)self->_collectionView setDataSource:self];
    collectionView = self->_collectionView;
    [(UICollectionView *)collectionView setDelegate:self];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKDashboardCollectionViewController;
  [(GKDashboardCollectionViewController *)&v5 viewWillAppear:a3];
  objc_super v4 = [(GKLoadingViewController *)self loadingState];
  if (v4 == @"Initial") {
    [(GKLoadingViewController *)self setLoadingState:@"LoadingState"];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKDashboardCollectionViewController;
  [(GKDashboardCollectionViewController *)&v5 viewDidAppear:a3];
  objc_super v4 = [(GKLoadingViewController *)self loadingState];
  if (v4 == @"Initial") {
    [(GKLoadingViewController *)self setLoadingState:@"LoadingState"];
  }
  [(GKDashboardCollectionViewController *)self clearSelection];
  [(GKDashboardCollectionViewController *)self setNeedsFocusUpdate];
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  if (![(GKDashboardCollectionViewController *)self isLoading])
  {
    objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, -[UICollectionView numberOfSections](self->_collectionView, "numberOfSections"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(UICollectionView *)self->_collectionView reloadSections:v4];
  }
}

- (void)setAutoWidthUsesTwoColumnsWhenSpace:(BOOL)a3
{
  self->_autoWidthUsesTwoColumnsWhenSpace = a3;
}

- (void)setAutoWidthColumns:(int64_t)a3
{
  id v5 = (id)[(GKDashboardCollectionViewController *)self view];
  id v6 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setAutoWidthColumns:a3];
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
  v3.super_class = (Class)GKDashboardCollectionViewController;
  [(GKLoadingViewController *)&v3 didEnterLoadingState];
  [(GKDashboardCollectionViewController *)self loadData];
}

- (void)setNeedsRefresh
{
  if (![(GKDashboardCollectionViewController *)self isLoading])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__GKDashboardCollectionViewController_setNeedsRefresh__block_invoke;
    block[3] = &unk_1E5F62EB0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __54__GKDashboardCollectionViewController_setNeedsRefresh__block_invoke()
{
  gk_dispatch_debounce();
  dispatch_time_t v0 = dispatch_time(0, 1000000000);
  dispatch_after(v0, MEMORY[0x1E4F14428], &__block_literal_global_17);
}

uint64_t __54__GKDashboardCollectionViewController_setNeedsRefresh__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isLoading];
  if ((result & 1) == 0)
  {
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 setLoadingState:@"RefreshingState"];
  }
  return result;
}

uint64_t __54__GKDashboardCollectionViewController_setNeedsRefresh__block_invoke_3()
{
  return GKAtomicCompareAndSwap32();
}

- (void)loadData
{
  dataSource = self->_dataSource;
  if (dataSource)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __47__GKDashboardCollectionViewController_loadData__block_invoke;
    v3[3] = &unk_1E5F645B0;
    v3[4] = self;
    [(GKCollectionDataSource *)dataSource loadDataWithCompletionHandler:v3];
  }
  else
  {
    [(GKDashboardCollectionViewController *)self dataUpdated:1 withError:0];
  }
}

uint64_t __47__GKDashboardCollectionViewController_loadData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) dataUpdated:a2 withError:a3];
}

- (BOOL)hasData
{
  return [(GKCollectionDataSource *)self->_dataSource itemCount] > 0;
}

- (void)dataUpdated:(BOOL)a3 withError:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  if ([(GKDashboardCollectionViewController *)self hasData])
  {
    [(GKLoadingViewController *)self setLoadingState:@"LoadedState"];
    [(GKDashboardCollectionViewController *)self hideNoContentPlaceholder];
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    [(GKLoadingViewController *)self setLoadingState:@"NoContentState"];
    [(GKDashboardCollectionViewController *)self showNoContentPlaceholderForError:v8];
    if (!v4) {
      goto LABEL_10;
    }
  }
  sectionsToReload = self->_sectionsToReload;
  if (sectionsToReload && [(NSMutableIndexSet *)sectionsToReload count])
  {
    [(UICollectionView *)self->_collectionView reloadSections:self->_sectionsToReload];
    [(NSMutableIndexSet *)self->_sectionsToReload removeAllIndexes];
  }
  else
  {
    [(UICollectionView *)self->_collectionView reloadData];
  }
  [(GKDashboardCollectionViewController *)self setNeedsFocusUpdate];
  id v7 = [(GKDashboardCollectionViewController *)self navigationController];
  [v7 setNeedsFocusUpdate];

LABEL_10:
}

- (void)showNoContentPlaceholderForError:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  collectionView = self->_collectionView;
  if (collectionView)
  {
    [(UICollectionView *)collectionView setHidden:1];
    noContentView = self->_noContentView;
    if (!noContentView)
    {
      id v7 = [GKNoContentView alloc];
      [(UICollectionView *)self->_collectionView bounds];
      id v8 = -[GKNoContentView initWithFrame:](v7, "initWithFrame:");
      [(GKDashboardCollectionViewController *)self setNoContentView:v8];

      [(GKNoContentView *)self->_noContentView setTranslatesAutoresizingMaskIntoConstraints:0];
      id v9 = [(UICollectionView *)self->_collectionView superview];
      [v9 insertSubview:self->_noContentView aboveSubview:self->_collectionView];
      objc_super v10 = objc_msgSend(MEMORY[0x1E4F28DC8], "_gkConstraintsForView:withinView:insets:", self->_noContentView, self->_collectionView, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
      [v9 addConstraints:v10];

      v11 = self->_noContentView;
      v13[0] = self->_collectionView;
      v13[1] = v11;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
      [(GKLoadingViewController *)self setViewsToHideWhileLoading:v12];

      noContentView = self->_noContentView;
    }
    [(GKDashboardCollectionViewController *)self setupNoContentView:noContentView withError:v4];
    [(GKNoContentView *)self->_noContentView setHidden:0];
  }
}

- (void)hideNoContentPlaceholder
{
  [(GKNoContentView *)self->_noContentView setHidden:1];
  collectionView = self->_collectionView;

  [(UICollectionView *)collectionView setHidden:0];
}

- (void)setupNoContentView:(id)a3 withError:(id)a4
{
  id v9 = a3;
  id v5 = GKGameCenterUIFrameworkBundle();
  id v6 = GKGetLocalizedStringFromTableInBundle();
  [v9 setTitle:v6];

  if (a4)
  {
    id v7 = GKGameCenterUIFrameworkBundle();
    id v8 = GKGetLocalizedStringFromTableInBundle();
    [v9 setMessage:v8];
  }
  else
  {
    [v9 setMessage:0];
  }
}

- (void)clearSelection
{
}

- (void)clearSelectionForCollectionView:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 indexPathsForSelectedItems];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 deselectItemAtIndexPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) animated:1];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)popoverDidClose:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  uint64_t v6 = [v4 defaultCenter];
  uint64_t v7 = [v5 name];

  [v6 removeObserver:self name:v7 object:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__GKDashboardCollectionViewController_popoverDidClose___block_invoke;
  block[3] = &unk_1E5F62EB0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __55__GKDashboardCollectionViewController_popoverDidClose___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearSelection];
}

- (void)windowDidEndSheet:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  uint64_t v6 = [v4 defaultCenter];
  uint64_t v7 = [v5 name];

  [v6 removeObserver:self name:v7 object:0];

  [(GKDashboardCollectionViewController *)self clearSelection];
}

- (void)keyboardWillShow:(id)a3
{
  id v4 = a3;
  id v5 = [(GKDashboardCollectionViewController *)self view];
  uint64_t v6 = [v5 window];
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardConstraint);
    if (WeakRetained)
    {
      uint64_t v8 = WeakRetained;
      long long v9 = [(GKDashboardCollectionViewController *)self popoverPresentationController];
      if (v9)
      {
      }
      else
      {
        long long v10 = [(GKDashboardCollectionViewController *)self navigationController];
        long long v11 = [v10 popoverPresentationController];

        if (v11) {
          goto LABEL_7;
        }
        uint64_t v8 = [v4 userInfo];
        long long v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
        [v12 CGRectValue];
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;

        objc_msgSend(v6, "convertRect:fromWindow:", 0, v14, v16, v18, v20);
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        if (*MEMORY[0x1E4F63830])
        {
          v29 = [MEMORY[0x1E4FB16C8] currentDevice];
          uint64_t v30 = [v29 userInterfaceIdiom];

          if (v30 == 1 && v24 == v16)
          {
            v31 = [v6 screen];
            [v31 bounds];
            double v33 = v32;
            [v31 bounds];
            if (v33 <= v34)
            {
              [v31 bounds];
              double v40 = v39;
              [v6 bounds];
              double v38 = (v40 + v41) * 0.5;
            }
            else
            {
              [v6 bounds];
              double v36 = v35;
              v37 = [MEMORY[0x1E4FB1438] sharedApplication];
              if ([v37 isStatusBarHidden])
              {
                double v38 = v36 + 0.0;
              }
              else
              {
                v42 = [MEMORY[0x1E4FB1438] sharedApplication];
                [v42 statusBarHeight];
                double v38 = v36 + v43;
              }
            }
            [v6 bounds];
            double v24 = v44 - (v38 - v16);
          }
        }
        objc_msgSend(v5, "convertRect:fromView:", 0, v22, v24, v26, v28);
        CGFloat v46 = v45;
        CGFloat v48 = v47;
        CGFloat v50 = v49;
        CGFloat v52 = v51;
        id v53 = objc_loadWeakRetained((id *)&self->_keyboardAdjustedView);
        v54 = v53;
        if (v53) {
          v55 = v53;
        }
        else {
          v55 = v5;
        }
        id v56 = v55;

        [v56 frame];
        double MaxY = CGRectGetMaxY(v67);
        v68.origin.x = v46;
        v68.origin.y = v48;
        v68.size.width = v50;
        v68.size.height = v52;
        double v58 = MaxY - CGRectGetMinY(v68);
        if (v58 >= 0.0) {
          double v59 = v58;
        }
        else {
          double v59 = 0.0;
        }
        v60 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB2BA8]];
        [v60 doubleValue];
        double v62 = v61;

        v63 = (void *)MEMORY[0x1E4FB1EB0];
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __56__GKDashboardCollectionViewController_keyboardWillShow___block_invoke;
        v64[3] = &unk_1E5F63CA8;
        v64[4] = self;
        double v66 = v59;
        id v65 = v5;
        [v63 animateWithDuration:0x10000 delay:v64 options:0 animations:v62 completion:0.0];
      }
    }
  }
LABEL_7:
}

uint64_t __56__GKDashboardCollectionViewController_keyboardWillShow___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) keyboardConstraintDefaultConstant];
  double v3 = v2 + *(double *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) keyboardConstraint];
  [v4 setConstant:v3];

  id v5 = *(void **)(a1 + 40);

  return [v5 layoutIfNeeded];
}

- (void)keyboardWillHide:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardConstraint);
  [WeakRetained constant];
  double v6 = v5;
  double keyboardConstraintDefaultConstant = self->_keyboardConstraintDefaultConstant;

  if (v6 != keyboardConstraintDefaultConstant)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __56__GKDashboardCollectionViewController_keyboardWillHide___block_invoke;
    v8[3] = &unk_1E5F62EB0;
    v8[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v8];
  }
}

void __56__GKDashboardCollectionViewController_keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = *(double *)(v1 + 1064);
  id WeakRetained = objc_loadWeakRetained((id *)(v1 + 1056));
  [WeakRetained setConstant:v2];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  dataSource = self->_dataSource;
  if (dataSource) {
    return [(GKCollectionDataSource *)dataSource numberOfSectionsInCollectionView:a3];
  }
  else {
    return 1;
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  int64_t result = (int64_t)self->_dataSource;
  if (result) {
    return [(id)result collectionView:a3 numberOfItemsInSection:a4];
  }
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  dataSource = self->_dataSource;
  if (dataSource)
  {
    double v5 = [(GKCollectionDataSource *)dataSource collectionView:a3 cellForItemAtIndexPath:a4];
  }
  else
  {
    double v6 = NSString;
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"No datasource. Subclass needs to override collectionView:cellForItemAtIndexPath:", a4);
    uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardCollectionViewController.m"];
    id v9 = [v8 lastPathComponent];
    long long v10 = [v6 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v7, "-[GKDashboardCollectionViewController collectionView:cellForItemAtIndexPath:]", objc_msgSend(v9, "UTF8String"), 547];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v10 format];
    double v5 = 0;
  }

  return v5;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  dataSource = self->_dataSource;
  if (dataSource)
  {
    double v6 = [(GKCollectionDataSource *)dataSource collectionView:a3 viewForSupplementaryElementOfKind:a4 atIndexPath:a5];
  }
  else
  {
    uint64_t v7 = NSString;
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"No datasource. Subclass needs to override collectionView:viewForSupplementaryElementOfKind:atIndexPath:", a4, a5);
    id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardCollectionViewController.m"];
    id v10 = [v9 lastPathComponent];
    long long v11 = [v7 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v8, "-[GKDashboardCollectionViewController collectionView:viewForSupplementaryElementOfKind:atIndexPath:]", objc_msgSend(v10, "UTF8String"), 559];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v11 format];
    double v6 = 0;
  }

  return v6;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_opt_respondsToSelector())
  {
    [(GKCollectionDataSource *)self->_dataSource collectionView:v8 layout:v9 sizeForItemAtIndexPath:v10];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v13 = *MEMORY[0x1E4F1DB30];
      double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      goto LABEL_7;
    }
    [v9 itemSize];
  }
  double v13 = v11;
  double v14 = v12;
LABEL_7:

  double v15 = v13;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (objc_opt_respondsToSelector())
  {
    [(GKCollectionDataSource *)self->_dataSource collectionView:v8 layout:v9 referenceSizeForHeaderInSection:a5];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v12 = *MEMORY[0x1E4F1DB30];
      double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      goto LABEL_7;
    }
    [v9 headerReferenceSize];
  }
  double v12 = v10;
  double v13 = v11;
LABEL_7:

  double v14 = v12;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (objc_opt_respondsToSelector())
  {
    [(GKCollectionDataSource *)self->_dataSource collectionView:v8 layout:v9 referenceSizeForFooterInSection:a5];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v12 = *MEMORY[0x1E4F1DB30];
      double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      goto LABEL_7;
    }
    [v9 footerReferenceSize];
  }
  double v12 = v10;
  double v13 = v11;
LABEL_7:

  double v14 = v12;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector()) {
    char v8 = [(GKCollectionDataSource *)self->_dataSource collectionView:v6 shouldSelectItemAtIndexPath:v7];
  }
  else {
    char v8 = 1;
  }

  return v8;
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector()) {
    char v8 = [(GKCollectionDataSource *)self->_dataSource collectionView:v6 shouldDeselectItemAtIndexPath:v7];
  }
  else {
    char v8 = 1;
  }

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (objc_opt_respondsToSelector()) {
    [(GKCollectionDataSource *)self->_dataSource collectionView:v10 willDisplayCell:v8 forItemAtIndexPath:v9];
  }
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  dataSource = self->_dataSource;
  return !dataSource
      || [(GKCollectionDataSource *)dataSource collectionView:a3 canFocusItemAtIndexPath:a4];
}

- (void)collectionView:(id)a3 didUnfocusItemAtIndexPath:(id)a4
{
  id v6 = a4;
  dataSource = self->_dataSource;
  id v12 = v6;
  if (dataSource)
  {
    [(GKCollectionDataSource *)dataSource collectionView:a3 didUnfocusItemAtIndexPath:v6];
  }
  else
  {
    id v8 = [a3 _gkFocusingLayout];
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 focusedIndexPath];
      int v11 = [v10 isEqual:v12];

      if (v11) {
        [v9 setFocusedIndexPath:0];
      }
    }
  }
}

- (void)collectionView:(id)a3 didFocusItemAtIndexPath:(id)a4
{
  id v6 = a4;
  dataSource = self->_dataSource;
  id v12 = v6;
  if (dataSource)
  {
    [(GKCollectionDataSource *)dataSource collectionView:a3 didFocusItemAtIndexPath:v6];
  }
  else
  {
    id v8 = [a3 _gkFocusingLayout];
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 focusedIndexPath];
      char v11 = [v10 isEqual:v12];

      if ((v11 & 1) == 0) {
        [v9 setFocusedIndexPath:v12];
      }
    }
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (GKCollectionDataSource)dataSource
{
  return self->_dataSource;
}

- (BOOL)autoWidthUsesTwoColumnsWhenSpace
{
  return self->_autoWidthUsesTwoColumnsWhenSpace;
}

- (NSMutableIndexSet)sectionsToReload
{
  return self->_sectionsToReload;
}

- (void)setSectionsToReload:(id)a3
{
}

- (GKNoContentView)noContentView
{
  return self->_noContentView;
}

- (void)setNoContentView:(id)a3
{
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (UIEdgeInsets)contentInsetsBeforeKeyboard
{
  double top = self->_contentInsetsBeforeKeyboard.top;
  double left = self->_contentInsetsBeforeKeyboard.left;
  double bottom = self->_contentInsetsBeforeKeyboard.bottom;
  double right = self->_contentInsetsBeforeKeyboard.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsetsBeforeKeyboard:(UIEdgeInsets)a3
{
  self->_contentInsetsBeforeKeyboard = a3;
}

- (UIEdgeInsets)scrollInsetsBeforeKeyboard
{
  double top = self->_scrollInsetsBeforeKeyboard.top;
  double left = self->_scrollInsetsBeforeKeyboard.left;
  double bottom = self->_scrollInsetsBeforeKeyboard.bottom;
  double right = self->_scrollInsetsBeforeKeyboard.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setScrollInsetsBeforeKeyboard:(UIEdgeInsets)a3
{
  self->_scrollInsetsBeforeKeyboard = a3;
}

- (NSLayoutConstraint)keyboardConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setKeyboardConstraint:(id)a3
{
}

- (double)keyboardConstraintDefaultConstant
{
  return self->_keyboardConstraintDefaultConstant;
}

- (void)setKeyboardConstraintDefaultConstant:(double)a3
{
  self->_double keyboardConstraintDefaultConstant = a3;
}

- (UIView)keyboardAdjustedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardAdjustedView);

  return (UIView *)WeakRetained;
}

- (void)setKeyboardAdjustedView:(id)a3
{
}

- (UIView)collectionContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionContainerView);

  return (UIView *)WeakRetained;
}

- (void)setCollectionContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionContainerView);
  objc_destroyWeak((id *)&self->_keyboardAdjustedView);
  objc_destroyWeak((id *)&self->_keyboardConstraint);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_sectionsToReload, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end