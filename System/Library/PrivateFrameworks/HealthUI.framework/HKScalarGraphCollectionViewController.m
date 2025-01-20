@interface HKScalarGraphCollectionViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)preferredContentSize;
- (HKScalarGraphCollectionViewCell)currentCell;
- (HKScalarGraphCollectionViewController)initWithMinimumHeight:(double)a3 unitController:(id)a4;
- (HKScalarGraphCollectionViewDelegate)delegate;
- (HKUnitPreferenceController)unitController;
- (NSArray)audiograms;
- (UICollectionView)collectionView;
- (double)collectionViewHeight;
- (double)minimumHeight;
- (id)_buildCollectionViewLayout;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)currentIndex;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_pinView:(id)a3 toParentGuide:(id)a4;
- (void)_resetScrollPositionForIndex:(int64_t)a3;
- (void)_setupChartCollectionView;
- (void)redrawCurrentCell;
- (void)reload;
- (void)resetToIndex:(int64_t)a3;
- (void)resetToMostRecent;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAudiograms:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewHeight:(double)a3;
- (void)setCurrentCell:(id)a3;
- (void)setCurrentIndex:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setMinimumHeight:(double)a3;
- (void)setUnitController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation HKScalarGraphCollectionViewController

- (HKScalarGraphCollectionViewController)initWithMinimumHeight:(double)a3 unitController:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HKScalarGraphCollectionViewController;
  v7 = [(HKScalarGraphCollectionViewController *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(HKScalarGraphCollectionViewController *)v7 setMinimumHeight:a3];
    [(HKScalarGraphCollectionViewController *)v8 setUnitController:v6];
  }

  return v8;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)HKScalarGraphCollectionViewController;
  [(HKScalarGraphCollectionViewController *)&v9 viewDidLoad];
  v3 = [(HKScalarGraphCollectionViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(HKScalarGraphCollectionViewController *)self _setupChartCollectionView];
  v4 = [(HKScalarGraphCollectionViewController *)self view];
  v5 = [(HKScalarGraphCollectionViewController *)self collectionView];
  [v4 addSubview:v5];

  collectionView = self->_collectionView;
  v7 = [(HKScalarGraphCollectionViewController *)self view];
  v8 = [v7 safeAreaLayoutGuide];
  [(HKScalarGraphCollectionViewController *)self _pinView:collectionView toParentGuide:v8];

  [(HKScalarGraphCollectionViewController *)self reload];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)HKScalarGraphCollectionViewController;
  [(HKScalarGraphCollectionViewController *)&v4 viewWillLayoutSubviews];
  v3 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  [v3 invalidateLayout];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)HKScalarGraphCollectionViewController;
  [(HKScalarGraphCollectionViewController *)&v5 viewDidLayoutSubviews];
  v3 = [(HKScalarGraphCollectionViewController *)self collectionView];
  [v3 bounds];
  [(HKScalarGraphCollectionViewController *)self setCollectionViewHeight:v4];

  [(HKScalarGraphCollectionViewController *)self _resetScrollPositionForIndex:self->_currentIndex];
}

- (void)reload
{
  [(UICollectionView *)self->_collectionView reloadData];
  collectionView = self->_collectionView;
  [(UICollectionView *)collectionView layoutIfNeeded];
}

- (void)redrawCurrentCell
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v4 = [WeakRetained graphSeriesForIndex:v2->_currentIndex];
  v2 = (HKScalarGraphCollectionViewController *)((char *)v2 + 1000);
  id v5 = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  [v5 setGraphSeries:v4];

  id v6 = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  v7 = [v6 graphViewController];
  v8 = [v7 graphView];
  [v8 setNeedsReloadSeries];

  id v11 = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  objc_super v9 = [v11 graphViewController];
  objc_super v10 = [v9 graphView];
  [v10 autoscaleYAxesAnimated:0 specificRange:0 onlyIfNeeded:0 completion:0];
}

- (void)_resetScrollPositionForIndex:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v6 = [WeakRetained numberOfItemsInCollection];

  if (v6 > a3)
  {
    id v7 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
    [(UICollectionView *)self->_collectionView scrollToItemAtIndexPath:v7 atScrollPosition:8 animated:0];
    [(UICollectionView *)self->_collectionView layoutIfNeeded];
  }
}

- (void)resetToIndex:(int64_t)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v7 = [WeakRetained numberOfItemsInCollection];

  if (v7)
  {
    self->_currentIndex = a3;
    [(HKScalarGraphCollectionViewController *)self _resetScrollPositionForIndex:a3];
    id v10 = [MEMORY[0x1E4F28D58] indexPathForRow:self->_currentIndex inSection:0];
    v8 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v10];
    objc_storeWeak((id *)&self->_currentCell, v8);

    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 graphCollectionView:self didChangeVisibleIndex:self->_currentIndex];
  }
}

- (void)resetToMostRecent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v4 = [WeakRetained numberOfItemsInCollection];

  if (v4)
  {
    [(HKScalarGraphCollectionViewController *)self resetToIndex:v4 - 1];
  }
}

- (CGSize)preferredContentSize
{
  v3 = [(HKScalarGraphCollectionViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double collectionViewHeight = self->_collectionViewHeight;

  double v7 = v5;
  double v8 = collectionViewHeight;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_setupChartCollectionView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1568]);
  double v4 = [(HKScalarGraphCollectionViewController *)self _buildCollectionViewLayout];
  double v5 = objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(HKScalarGraphCollectionViewController *)self setCollectionView:v5];

  int64_t v6 = [(HKScalarGraphCollectionViewController *)self collectionView];
  uint64_t v7 = objc_opt_class();
  double v8 = +[HKScalarGraphCollectionViewCell reuseIdentifier];
  [v6 registerClass:v7 forCellWithReuseIdentifier:v8];

  id v9 = [(HKScalarGraphCollectionViewController *)self collectionView];
  id v10 = [v9 heightAnchor];
  [(HKScalarGraphCollectionViewController *)self minimumHeight];
  id v11 = objc_msgSend(v10, "constraintGreaterThanOrEqualToConstant:");
  [v11 setActive:1];

  v12 = [(HKScalarGraphCollectionViewController *)self collectionView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v13 = [MEMORY[0x1E4FB1618] clearColor];
  v14 = [(HKScalarGraphCollectionViewController *)self collectionView];
  [v14 setBackgroundColor:v13];

  v15 = [(HKScalarGraphCollectionViewController *)self collectionView];
  [v15 setDelegate:self];

  v16 = [(HKScalarGraphCollectionViewController *)self collectionView];
  [v16 setDataSource:self];

  v17 = [(HKScalarGraphCollectionViewController *)self collectionView];
  [v17 setAllowsSelection:0];

  v18 = [(HKScalarGraphCollectionViewController *)self collectionView];
  [v18 setAllowsMultipleSelection:0];

  v19 = [(HKScalarGraphCollectionViewController *)self collectionView];
  [v19 setPagingEnabled:1];

  id v20 = [(HKScalarGraphCollectionViewController *)self collectionView];
  [v20 setShowsHorizontalScrollIndicator:0];
}

- (void)setCollectionViewHeight:(double)a3
{
  double collectionViewHeight = self->_collectionViewHeight;
  self->_double collectionViewHeight = a3;
  if (collectionViewHeight != a3)
  {
    double v5 = [(UICollectionView *)self->_collectionView collectionViewLayout];
    [v5 invalidateLayout];

    int64_t v6 = [(UICollectionView *)self->_collectionView collectionViewLayout];
    [v6 prepareLayout];

    [(HKScalarGraphCollectionViewController *)self reload];
    int64_t currentIndex = self->_currentIndex;
    [(HKScalarGraphCollectionViewController *)self resetToIndex:currentIndex];
  }
}

- (void)_pinView:(id)a3 toParentGuide:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v7 = [v6 leadingAnchor];
  double v8 = [v5 leadingAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  id v10 = [v6 trailingAnchor];
  id v11 = [v5 trailingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  v13 = [v6 topAnchor];
  v14 = [v5 topAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  id v18 = [v6 bottomAnchor];

  v16 = [v5 bottomAnchor];

  v17 = [v18 constraintEqualToAnchor:v16];
  [v17 setActive:1];
}

- (id)_buildCollectionViewLayout
{
  v2 = objc_opt_new();
  [v2 setScrollDirection:1];
  objc_msgSend(v2, "setSectionInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v2 setMinimumLineSpacing:0.0];
  return v2;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = [(HKScalarGraphCollectionViewController *)self collectionView];
  [v6 visibleSize];
  double v8 = v7;
  double collectionViewHeight = self->_collectionViewHeight;

  double v10 = v8;
  double v11 = collectionViewHeight;
  result.height = v11;
  result.width = v10;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v5 = [WeakRetained numberOfItemsInCollection];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = +[HKScalarGraphCollectionViewCell reuseIdentifier];
  id v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  double v10 = [v9 graphViewController];

  if (v10)
  {
    double v11 = [v9 graphViewController];
    [v11 willMoveToParentViewController:0];

    v12 = [v9 graphViewController];
    v13 = [v12 view];
    [v13 removeFromSuperview];

    v14 = [v9 graphViewController];
    [v14 removeFromParentViewController];
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = objc_msgSend(WeakRetained, "graphViewControllerForIndex:", objc_msgSend(v6, "row"));

  [(HKScalarGraphCollectionViewController *)self addChildViewController:v17];
  [v9 bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = [v17 view];
  objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

  v27 = [v17 view];
  [v9 addSubview:v27];

  [v17 didMoveToParentViewController:self];
  [v9 setGraphViewController:v17];
  id v28 = objc_loadWeakRetained((id *)&self->_delegate);
  v29 = objc_msgSend(v28, "graphSeriesForIndex:", objc_msgSend(v6, "row"));
  [v9 setGraphSeries:v29];

  id v30 = objc_loadWeakRetained((id *)p_delegate);
  v31 = [v30 lollipopControllerForGraphCollectionView];
  [v9 setLollipopController:v31];

  id v32 = objc_loadWeakRetained((id *)p_delegate);
  v33 = [v32 headerViewForLollipop];
  [v9 setHeader:v33];

  v34 = [v17 graphView];
  [v34 setDelegate:v9];

  v35 = [v17 graphView];
  [v35 setNeedsReloadSeries];

  return v9;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(UICollectionView *)self->_collectionView contentOffset];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  [(UICollectionView *)self->_collectionView bounds];
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  v22.origin.x = v5;
  v22.origin.y = v7;
  double MidX = CGRectGetMidX(v22);
  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  uint64_t v11 = -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v23));
  uint64_t v12 = v11;
  if (v11)
  {
    double v20 = (void *)v11;
    v13 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v11];
    objc_storeWeak((id *)&self->_currentCell, v13);

    self->_int64_t currentIndex = [v20 row];
    v14 = [(HKScalarGraphCollectionViewController *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      v16 = [(HKScalarGraphCollectionViewController *)self delegate];
      [v16 graphCollectionView:self didChangeVisibleIndex:self->_currentIndex];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentCell);
    double v18 = [WeakRetained graphViewController];
    double v19 = [v18 graphView];
    [v19 setNeedsReloadSeries];

    uint64_t v12 = (uint64_t)v20;
  }
  MEMORY[0x1F41817F8](v11, v12);
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentCell);
  id v3 = [WeakRetained lollipopController];
  [v3 setInvisibleAnimated:0];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (NSArray)audiograms
{
  return self->_audiograms;
}

- (void)setAudiograms:(id)a3
{
}

- (HKScalarGraphCollectionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKScalarGraphCollectionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (HKScalarGraphCollectionViewCell)currentCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentCell);
  return (HKScalarGraphCollectionViewCell *)WeakRetained;
}

- (void)setCurrentCell:(id)a3
{
}

- (int64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(int64_t)a3
{
  self->_int64_t currentIndex = a3;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void)setUnitController:(id)a3
{
}

- (double)collectionViewHeight
{
  return self->_collectionViewHeight;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_destroyWeak((id *)&self->_currentCell);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audiograms, 0);
}

@end