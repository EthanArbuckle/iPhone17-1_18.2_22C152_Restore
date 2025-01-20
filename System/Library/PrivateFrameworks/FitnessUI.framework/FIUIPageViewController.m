@interface FIUIPageViewController
- (BOOL)shouldNotifyDelegateWhenScrollViewSettles;
- (BOOL)showsPagingIndicator;
- (BOOL)userDidTapPageControl;
- (FIUIPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (FIUIPageViewControllerDataSource)dataSource;
- (FIUIPageViewControllerDelegate)delegate;
- (NSCache)viewControllerForIndexPath;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)collectionViewLayout;
- (UIPageControl)pageControl;
- (UIViewController)currentlyDisplayedViewController;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)currentlyDisplayedIndex;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)scrollDirection;
- (void)_addViewController:(id)a3 toCell:(id)a4;
- (void)_pageSelectedWithControl:(id)a3;
- (void)_scrollViewDidStop;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)loadView;
- (void)reloadData;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setCurrentlyDisplayedIndex:(int64_t)a3;
- (void)setCurrentlyDisplayedIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPageControl:(id)a3;
- (void)setScrollDirection:(int64_t)a3;
- (void)setShouldNotifyDelegateWhenScrollViewSettles:(BOOL)a3;
- (void)setShowsPagingIndicator:(BOOL)a3;
- (void)setUserDidTapPageControl:(BOOL)a3;
- (void)setViewControllerForIndexPath:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation FIUIPageViewController

- (FIUIPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)FIUIPageViewController;
  v4 = [(FIUIPageViewController *)&v9 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_currentlyDisplayedIndex = 0;
    v6 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    viewControllerForIndexPath = v5->_viewControllerForIndexPath;
    v5->_viewControllerForIndexPath = v6;

    [(NSCache *)v5->_viewControllerForIndexPath setCountLimit:5];
    v5->_scrollDirection = 1;
    v5->_shouldNotifyDelegateWhenScrollViewSettles = 0;
  }
  return v5;
}

- (void)loadView
{
  v47.receiver = self;
  v47.super_class = (Class)FIUIPageViewController;
  [(FIUIPageViewController *)&v47 loadView];
  id v3 = objc_alloc_init(MEMORY[0x263F82570]);
  [(FIUIPageViewController *)self setCollectionViewLayout:v3];

  v4 = [(FIUIPageViewController *)self collectionViewLayout];
  [v4 setMinimumLineSpacing:0.0];

  v5 = [(FIUIPageViewController *)self collectionViewLayout];
  [v5 setMinimumInteritemSpacing:0.0];

  double v6 = *MEMORY[0x263F834E8];
  double v7 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v8 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v9 = *(double *)(MEMORY[0x263F834E8] + 24);
  v10 = [(FIUIPageViewController *)self collectionViewLayout];
  objc_msgSend(v10, "setSectionInset:", v6, v7, v8, v9);

  int64_t v11 = [(FIUIPageViewController *)self scrollDirection];
  v12 = [(FIUIPageViewController *)self collectionViewLayout];
  [v12 setScrollDirection:v11];

  id v13 = objc_alloc(MEMORY[0x263F82528]);
  v14 = [(FIUIPageViewController *)self collectionViewLayout];
  double v15 = *MEMORY[0x263F001A8];
  double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v17 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v18 = *(double *)(MEMORY[0x263F001A8] + 24);
  v19 = objc_msgSend(v13, "initWithFrame:collectionViewLayout:", v14, *MEMORY[0x263F001A8], v16, v17, v18);
  [(FIUIPageViewController *)self setCollectionView:v19];

  v20 = [(FIUIPageViewController *)self collectionView];
  [v20 setPrefetchingEnabled:1];

  v21 = [(FIUIPageViewController *)self collectionView];
  [v21 setPrefetchDataSource:self];

  v22 = [(FIUIPageViewController *)self collectionView];
  [v22 setDataSource:self];

  v23 = [(FIUIPageViewController *)self collectionView];
  [v23 setDelegate:self];

  v24 = [(FIUIPageViewController *)self collectionView];
  [v24 setShowsHorizontalScrollIndicator:0];

  v25 = [(FIUIPageViewController *)self collectionView];
  [v25 setShowsVerticalScrollIndicator:0];

  v26 = [(FIUIPageViewController *)self collectionView];
  [v26 setPagingEnabled:1];

  v27 = [(FIUIPageViewController *)self collectionView];
  [v27 setContentInsetAdjustmentBehavior:2];

  v28 = [(FIUIPageViewController *)self view];
  v29 = [(FIUIPageViewController *)self collectionView];
  [v28 addSubview:v29];

  v30 = [(FIUIPageViewController *)self collectionView];
  [v30 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"com.apple.FitnessUI.FIUIPageViewController.ReuseIdentifier"];

  v31 = objc_msgSend(objc_alloc(MEMORY[0x263F829F0]), "initWithFrame:", v15, v16, v17, v18);
  [(FIUIPageViewController *)self setPageControl:v31];

  v32 = [(FIUIPageViewController *)self pageControl];
  [v32 setHidesForSinglePage:1];

  v33 = [(FIUIPageViewController *)self pageControl];
  [v33 addTarget:self action:sel__pageSelectedWithControl_ forControlEvents:4096];

  v34 = [(FIUIPageViewController *)self pageControl];
  [v34 setTranslatesAutoresizingMaskIntoConstraints:0];

  v35 = [(FIUIPageViewController *)self view];
  v36 = [(FIUIPageViewController *)self pageControl];
  [v35 addSubview:v36];

  v37 = [(FIUIPageViewController *)self pageControl];
  v38 = [v37 centerXAnchor];
  v39 = [(FIUIPageViewController *)self view];
  v40 = [v39 centerXAnchor];
  v41 = [v38 constraintEqualToAnchor:v40];
  [v41 setActive:1];

  v42 = [(FIUIPageViewController *)self pageControl];
  v43 = [v42 bottomAnchor];
  v44 = [(FIUIPageViewController *)self view];
  v45 = [v44 bottomAnchor];
  v46 = [v43 constraintEqualToAnchor:v45];
  [v46 setActive:1];
}

- (void)viewWillLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)FIUIPageViewController;
  [(FIUIPageViewController *)&v19 viewWillLayoutSubviews];
  id v3 = [(FIUIPageViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(FIUIPageViewController *)self collectionView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  id v13 = [(FIUIPageViewController *)self view];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  double v18 = [(FIUIPageViewController *)self collectionViewLayout];
  objc_msgSend(v18, "setItemSize:", v15, v17);

  if ([(FIUIPageViewController *)self currentlyDisplayedIndex] >= 1) {
    [(FIUIPageViewController *)self setCurrentlyDisplayedIndex:[(FIUIPageViewController *)self currentlyDisplayedIndex]];
  }
}

- (void)setCurrentlyDisplayedIndex:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v16[1] = *MEMORY[0x263EF8340];
  int64_t currentlyDisplayedIndex = self->_currentlyDisplayedIndex;
  double v8 = [(FIUIPageViewController *)self dataSource];
  int64_t v9 = [v8 numberOfViewControllersForPageViewController:self];

  if (v9 <= a3)
  {
    double v11 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Requested setting currently displayed index out of range" userInfo:0];
    [v11 raise];
  }
  else
  {
    self->_int64_t currentlyDisplayedIndex = a3;
    BOOL v10 = currentlyDisplayedIndex != a3 && v4;
    [(FIUIPageViewController *)self setShouldNotifyDelegateWhenScrollViewSettles:v10 | [(FIUIPageViewController *)self shouldNotifyDelegateWhenScrollViewSettles]];
    double v11 = [MEMORY[0x263F088C8] indexPathForItem:self->_currentlyDisplayedIndex inSection:0];
    v12 = [(FIUIPageViewController *)self collectionView];
    v16[0] = v11;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [(FIUIPageViewController *)self collectionView:v12 prefetchItemsAtIndexPaths:v13];

    double v14 = [(FIUIPageViewController *)self collectionView];
    [v14 scrollToItemAtIndexPath:v11 atScrollPosition:16 animated:v4];
  }
  if (currentlyDisplayedIndex != a3 && !v4)
  {
    double v15 = [(FIUIPageViewController *)self delegate];
    [v15 pageViewController:self didUpdateCurrentlyDisplayedIndex:self->_currentlyDisplayedIndex];
  }
}

- (void)setCurrentlyDisplayedIndex:(int64_t)a3
{
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
  BOOL v4 = [(FIUIPageViewController *)self collectionView];
  [v4 reloadData];

  double v5 = [(FIUIPageViewController *)self dataSource];
  uint64_t v6 = [v5 numberOfViewControllersForPageViewController:self];

  if ([(FIUIPageViewController *)self showsPagingIndicator])
  {
    double v7 = [(FIUIPageViewController *)self pageControl];
    [v7 setNumberOfPages:v6];
  }
  if ([(FIUIPageViewController *)self isViewLoaded])
  {
    id v8 = [(FIUIPageViewController *)self view];
    [v8 setNeedsLayout];
  }
}

- (void)setScrollDirection:(int64_t)a3
{
  id v4 = [(FIUIPageViewController *)self collectionViewLayout];
  [v4 setScrollDirection:a3];
}

- (void)setShowsPagingIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showsPagingIndicator = a3;
  if (a3)
  {
    double v5 = [(FIUIPageViewController *)self dataSource];
    uint64_t v6 = [v5 numberOfViewControllersForPageViewController:self];

    double v7 = [(FIUIPageViewController *)self pageControl];
    [v7 setNumberOfPages:v6];
  }
  id v8 = [(FIUIPageViewController *)self pageControl];
  [v8 setHidden:!v3];
}

- (UIViewController)currentlyDisplayedViewController
{
  BOOL v3 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", -[FIUIPageViewController currentlyDisplayedIndex](self, "currentlyDisplayedIndex"), 0);
  id v4 = [(FIUIPageViewController *)self viewControllerForIndexPath];
  double v5 = [v4 objectForKey:v3];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    double v7 = [(FIUIPageViewController *)self collectionView];
    id v8 = [v7 cellForItemAtIndexPath:v3];

    id v6 = [v8 viewController];
    if (v6)
    {
      int64_t v9 = [(FIUIPageViewController *)self viewControllerForIndexPath];
      [v9 setObject:v6 forKey:v3];
    }
  }

  return (UIViewController *)v6;
}

- (void)reloadData
{
  BOOL v3 = [(FIUIPageViewController *)self viewControllerForIndexPath];
  [v3 removeAllObjects];

  id v4 = [(FIUIPageViewController *)self collectionView];
  [v4 reloadData];

  [(FIUIPageViewController *)self setShowsPagingIndicator:self->_showsPagingIndicator];
  double v5 = [(FIUIPageViewController *)self dataSource];
  int64_t v6 = [v5 numberOfViewControllersForPageViewController:self];

  if (self->_currentlyDisplayedIndex >= v6)
  {
    id v7 = [(FIUIPageViewController *)self dataSource];
    -[FIUIPageViewController setCurrentlyDisplayedIndex:](self, "setCurrentlyDisplayedIndex:", [v7 numberOfViewControllersForPageViewController:self] - 1);
  }
  else
  {
    -[FIUIPageViewController setCurrentlyDisplayedIndex:](self, "setCurrentlyDisplayedIndex:");
  }
}

- (void)_pageSelectedWithControl:(id)a3
{
  uint64_t v4 = [a3 currentPage];
  [(FIUIPageViewController *)self setUserDidTapPageControl:1];
  [(FIUIPageViewController *)self setCurrentlyDisplayedIndex:v4 animated:1];
  dispatch_time_t v5 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__FIUIPageViewController__pageSelectedWithControl___block_invoke;
  block[3] = &unk_2644A7B18;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x263EF83A0], block);
}

uint64_t __51__FIUIPageViewController__pageSelectedWithControl___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUserDidTapPageControl:0];
}

- (void)_addViewController:(id)a3 toCell:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  [v6 setViewController:v9];
  [(FIUIPageViewController *)self addChildViewController:v9];
  id v7 = [v6 contentView];

  id v8 = [v9 view];
  [v7 addSubview:v8];

  [v9 didMoveToParentViewController:self];
}

- (void)_scrollViewDidStop
{
  BOOL v3 = [(FIUIPageViewController *)self collectionView];
  uint64_t v4 = [(FIUIPageViewController *)self collectionView:v3 numberOfItemsInSection:0];

  dispatch_time_t v5 = [(FIUIPageViewController *)self collectionView];
  [v5 contentOffset];
  double v7 = v6;
  id v8 = [(FIUIPageViewController *)self collectionView];
  [v8 contentSize];
  double v10 = v7 / v9;

  BOOL IsRightToLeft = FIUILocaleIsRightToLeft();
  double v12 = (double)v4;
  double v13 = -v10;
  if (!IsRightToLeft)
  {
    double v13 = (double)v4;
    double v12 = v10;
  }
  uint64_t v14 = (uint64_t)(v12 * v13);
  BOOL v15 = FIUILocaleIsRightToLeft();
  uint64_t v16 = v4 - 1;
  if (!v15) {
    uint64_t v16 = 0;
  }
  [(FIUIPageViewController *)self setCurrentlyDisplayedIndex:v16 + v14];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  if ([(FIUIPageViewController *)self shouldNotifyDelegateWhenScrollViewSettles])
  {
    objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", -[FIUIPageViewController currentlyDisplayedIndex](self, "currentlyDisplayedIndex"), 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [(FIUIPageViewController *)self collectionView];
    dispatch_time_t v5 = [v4 cellForItemAtIndexPath:v7];

    if (v5)
    {
      [(FIUIPageViewController *)self setShouldNotifyDelegateWhenScrollViewSettles:0];
      double v6 = [(FIUIPageViewController *)self delegate];
      objc_msgSend(v6, "pageViewController:didUpdateCurrentlyDisplayedIndex:", self, -[FIUIPageViewController currentlyDisplayedIndex](self, "currentlyDisplayedIndex"));
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  if (![(FIUIPageViewController *)self userDidTapPageControl])
  {
    uint64_t v4 = [(FIUIPageViewController *)self collectionView];
    [v4 contentOffset];
    double v6 = v5;
    id v7 = [(FIUIPageViewController *)self collectionView];
    [v7 contentSize];
    double v9 = v6 / v8;

    double v10 = [(FIUIPageViewController *)self pageControl];
    double v11 = (double)[v10 numberOfPages];

    id v12 = [(FIUIPageViewController *)self pageControl];
    [v12 setCurrentPage:llround(v9 * v11)];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(FIUIPageViewController *)self _scrollViewDidStop];
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  double v5 = [(FIUIPageViewController *)self dataSource];
  int64_t v6 = [v5 numberOfViewControllersForPageViewController:self];

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(FIUIPageViewController *)self collectionView];
  id v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"com.apple.FitnessUI.FIUIPageViewController.ReuseIdentifier" forIndexPath:v5];

  return v7;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
        double v11 = [(FIUIPageViewController *)self viewControllerForIndexPath];
        id v12 = [v11 objectForKey:v10];

        if (!v12)
        {
          uint64_t v13 = [v10 item];
          uint64_t v14 = [(FIUIPageViewController *)self dataSource];
          BOOL v15 = [v14 pageViewController:self viewControllerAtIndex:v13];

          if (v15)
          {
            uint64_t v16 = [(FIUIPageViewController *)self viewControllerForIndexPath];
            [v16 setObject:v15 forKey:v10];
          }
          [v15 view];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  uint64_t v8 = [(FIUIPageViewController *)self viewControllerForIndexPath];
  uint64_t v9 = [v8 objectForKey:v7];

  if (!v9)
  {
    uint64_t v10 = [v7 item];
    double v11 = [(FIUIPageViewController *)self dataSource];
    uint64_t v9 = [v11 pageViewController:self viewControllerAtIndex:v10];

    id v12 = [(FIUIPageViewController *)self viewControllerForIndexPath];
    [v12 setObject:v9 forKey:v7];
  }
  [(FIUIPageViewController *)self _addViewController:v9 toCell:v13];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (FIUIPageViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (FIUIPageViewControllerDataSource *)WeakRetained;
}

- (FIUIPageViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FIUIPageViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)scrollDirection
{
  return self->_scrollDirection;
}

- (int64_t)currentlyDisplayedIndex
{
  return self->_currentlyDisplayedIndex;
}

- (BOOL)showsPagingIndicator
{
  return self->_showsPagingIndicator;
}

- (UICollectionViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
}

- (BOOL)userDidTapPageControl
{
  return self->_userDidTapPageControl;
}

- (void)setUserDidTapPageControl:(BOOL)a3
{
  self->_userDidTapPageControl = a3;
}

- (NSCache)viewControllerForIndexPath
{
  return self->_viewControllerForIndexPath;
}

- (void)setViewControllerForIndexPath:(id)a3
{
}

- (BOOL)shouldNotifyDelegateWhenScrollViewSettles
{
  return self->_shouldNotifyDelegateWhenScrollViewSettles;
}

- (void)setShouldNotifyDelegateWhenScrollViewSettles:(BOOL)a3
{
  self->_shouldNotifyDelegateWhenScrollViewSettles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerForIndexPath, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end