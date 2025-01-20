@interface MediaControlsCollectionViewController
+ (id)alphaAnimatorWithAnimations:(id)a3;
+ (id)frameAnimator;
- (BOOL)_canPerformBatchUpdates;
- (BOOL)_isScrollViewAnimatingScroll;
- (BOOL)_wantsTapGestureRecognizer;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (CGRect)_frameForViewAtIndex:(int64_t)a3;
- (CGRect)_frameForViewAtIndex:(int64_t)a3 displayMode:(int64_t)a4 size:(CGSize)a5;
- (CGRect)_frameForViewAtIndex:(int64_t)a3 size:(CGSize)a4;
- (MediaControlsCollectionViewController)init;
- (MediaControlsCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MediaControlsCollectionViewDataSource)dataSource;
- (MediaControlsCollectionViewDelegate)delegate;
- (NSArray)visibleBottomViewControllers;
- (NSArray)visibleTopViewControllers;
- (NSArray)visibleViewControllers;
- (NSIndexSet)visibleIndexes;
- (UIEdgeInsets)scrollViewInsets;
- (UIScrollView)scrollView;
- (_MediaControlsTapHoldGestureRecognizer)tapGestureRecognizer;
- (_NSRange)_rangeOfItemsInRect:(CGRect)a3;
- (double)_backgroundCornerRadius;
- (double)_preferredSelectedItemHeight;
- (double)_regularItemHeight;
- (double)_selectedItemHeightInSize:(CGSize)a3;
- (double)_selectedItemHeightInSize:(CGSize)a3 shouldIgnoreInsets:(BOOL)a4;
- (double)_totalHeight;
- (double)_verticalSpacing;
- (double)preferredItemHeight;
- (id)_indexesOfItemsInRect:(CGRect)a3;
- (id)_insertViewControllerForIndex:(int64_t)a3;
- (id)_visibleBottomViewControllers;
- (id)_visibleTopViewControllers;
- (id)dequeueReusableViewControllerForItemAtIndex:(int64_t)a3;
- (id)dismissalBlock;
- (id)viewControllerForItemAtIndex:(int64_t)a3;
- (id)viewControllerForItemAtPoint:(CGPoint)a3;
- (id)viewControllerForSelectedItem;
- (int64_t)_closestItemAtPoint:(CGPoint)a3;
- (int64_t)displayMode;
- (int64_t)itemAtPoint:(CGPoint)a3;
- (int64_t)selectedItemIndex;
- (void)_adjustForEnvironmentChangeIfNeededWithSize:(CGSize)a3 transitionCoordinator:(id)a4;
- (void)_adjustForEnvironmentChangeWithSize:(CGSize)a3 transitionCoordinator:(id)a4;
- (void)_beginAppearanceTransitionForChildViewControllers:(BOOL)a3 animated:(BOOL)a4;
- (void)_beginAppearanceTransitionIfNeeded:(BOOL)a3 forChildViewController:(id)a4 animated:(BOOL)a5;
- (void)_commonInit;
- (void)_dequeueAndPerformBatchUpdatesIfNeeded;
- (void)_endAppearanceTransitionForChildViewControllerIfNeeded:(id)a3;
- (void)_endAppearanceTransitionForChildViewControllers;
- (void)_enumerateActiveViewControllers:(id)a3;
- (void)_handleScrollViewTap:(id)a3;
- (void)_populateViewsInFrame:(CGRect)a3;
- (void)_reapActiveViews;
- (void)_reapViewAtIndex:(int64_t)a3;
- (void)_reloadDataIfNeeded;
- (void)_removeInactiveViewControllersFromHierarchy;
- (void)_removeViewController:(id)a3;
- (void)_scrollToSelectedItemAnimated:(BOOL)a3;
- (void)_setFrame:(CGRect)a3 forVisibleViewAtIndex:(int64_t)a4;
- (void)_setHighlighted:(BOOL)a3 forViewController:(id)a4;
- (void)_setHighlighted:(BOOL)a3 forViewControllerAtIndex:(int64_t)a4;
- (void)_setSelectedItemIndex:(int64_t)a3 animated:(BOOL)a4 shouldScroll:(BOOL)a5 shouldNotifyDelegate:(BOOL)a6 withReason:(int64_t)a7;
- (void)_tileViews;
- (void)_transitionToDisplayMode:(int64_t)a3 usingTransitionCoordinator:(id)a4 assumingSize:(CGSize)a5;
- (void)_transitionToVisible:(BOOL)a3;
- (void)_transitionTopAndBottomViewControllersToVisible:(BOOL)a3 completion:(id)a4;
- (void)_updateContentSize;
- (void)_updateFrameForViewController:(id)a3 atIndex:(int64_t)a4 withCoordinator:(id)a5 assumingSize:(CGSize)a6;
- (void)_updateFramesForActiveViewControllersWithCoordinator:(id)a3 assumingSize:(CGSize)a4;
- (void)deleteItemAtIndex:(int64_t)a3;
- (void)deleteItemsAtIndexes:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)insertItemAtIndex:(int64_t)a3;
- (void)insertItemsAtIndexes:(id)a3;
- (void)moveItemAtIndex:(int64_t)a3 toIndex:(int64_t)a4;
- (void)performBatchUpdates:(id)a3;
- (void)reloadData;
- (void)reloadItemAtIndex:(int64_t)a3;
- (void)reloadItemsAtIndexes:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissalBlock:(id)a3;
- (void)setDisplayMode:(int64_t)a3;
- (void)setPreferredItemHeight:(double)a3;
- (void)setScrollView:(id)a3;
- (void)setScrollViewInsets:(UIEdgeInsets)a3;
- (void)setSelectedItemIndex:(int64_t)a3;
- (void)setSelectedItemIndex:(int64_t)a3 animated:(BOOL)a4 shouldScroll:(BOOL)a5;
- (void)setTapGestureRecognizer:(id)a3;
- (void)updateContentInsets;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3;
@end

@implementation MediaControlsCollectionViewController

- (MediaControlsCollectionViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsCollectionViewController;
  v2 = [(MediaControlsCollectionViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MediaControlsCollectionViewController *)v2 _commonInit];
  }
  return v3;
}

- (MediaControlsCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MediaControlsCollectionViewController;
  v4 = [(MediaControlsCollectionViewController *)&v7 initWithNibName:a3 bundle:a4];
  objc_super v5 = v4;
  if (v4) {
    [(MediaControlsCollectionViewController *)v4 _commonInit];
  }
  return v5;
}

- (void)_commonInit
{
  self->_displayMode = 0;
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  activeViewControllers = self->_activeViewControllers;
  self->_activeViewControllers = v3;

  objc_super v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  inactiveViewControllers = self->_inactiveViewControllers;
  self->_inactiveViewControllers = v5;

  objc_super v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  pendingUpdates = self->_pendingUpdates;
  self->_pendingUpdates = v7;

  self->_selectedItemIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_highlightedItemIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_lastKnownEnvironmentSize = (CGSize)*MEMORY[0x1E4F1DB30];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  dismissalBlock = self->_dismissalBlock;
  if (dismissalBlock)
  {
    objc_super v5 = (void (*)(id, id))dismissalBlock[2];
    id v6 = self->_dismissalBlock;
    v5(v6, a4);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MediaControlsCollectionViewController;
    [(MediaControlsCollectionViewController *)&v7 dismissViewControllerAnimated:a3 completion:a4];
  }
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)MediaControlsCollectionViewController;
  [(MediaControlsCollectionViewController *)&v18 viewDidLoad];
  CCUIExpandedModuleEdgeInsets();
  self->_controlCenterEdgeInsets.top = v3;
  self->_controlCenterEdgeInsets.left = v4;
  self->_controlCenterEdgeInsets.bottom = v5;
  self->_controlCenterEdgeInsets.right = v6;
  id v7 = objc_alloc(MEMORY[0x1E4FB1BE0]);
  v8 = [(MediaControlsCollectionViewController *)self view];
  [v8 bounds];
  v9 = (UIScrollView *)objc_msgSend(v7, "initWithFrame:");
  scrollView = self->_scrollView;
  self->_scrollView = v9;

  [(UIScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)self->_scrollView setAutoresizingMask:18];
  [(UIScrollView *)self->_scrollView setAutoresizesSubviews:0];
  [(UIScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  v11 = [(UIScrollView *)self->_scrollView layer];
  [v11 setHitTestsAsOpaque:1];

  v12 = [(UIScrollView *)self->_scrollView panGestureRecognizer];
  v13 = [(UIScrollView *)self->_scrollView panGestureRecognizer];
  [v13 _hysteresis];
  [v12 _setHysteresis:v14 + v14];

  [(UIScrollView *)self->_scrollView setDelegate:self];
  v15 = [[_MediaControlsTapHoldGestureRecognizer alloc] initWithTarget:self action:sel__handleScrollViewTap_];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v15;

  [(_MediaControlsTapHoldGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
  [(_MediaControlsTapHoldGestureRecognizer *)self->_tapGestureRecognizer setEnabled:[(MediaControlsCollectionViewController *)self _wantsTapGestureRecognizer]];
  [(UIScrollView *)self->_scrollView addGestureRecognizer:self->_tapGestureRecognizer];
  v17 = [(MediaControlsCollectionViewController *)self view];
  [v17 addSubview:self->_scrollView];

  [(MediaControlsCollectionViewController *)self updateContentInsets];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsCollectionViewController;
  -[MediaControlsCollectionViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  self->_appeared = 1;
  [(MediaControlsCollectionViewController *)self _beginAppearanceTransitionForChildViewControllers:1 animated:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MediaControlsCollectionViewController;
  [(MediaControlsCollectionViewController *)&v4 viewDidAppear:a3];
  [(MediaControlsCollectionViewController *)self _endAppearanceTransitionForChildViewControllers];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsCollectionViewController;
  -[MediaControlsCollectionViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  [(MediaControlsCollectionViewController *)self _beginAppearanceTransitionForChildViewControllers:0 animated:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MediaControlsCollectionViewController;
  [(MediaControlsCollectionViewController *)&v4 viewDidDisappear:a3];
  [(MediaControlsCollectionViewController *)self _endAppearanceTransitionForChildViewControllers];
  self->_appeared = 0;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)MediaControlsCollectionViewController;
  [(MediaControlsCollectionViewController *)&v6 viewDidLayoutSubviews];
  BOOL v3 = [(MediaControlsCollectionViewController *)self view];
  [v3 bounds];
  -[MediaControlsCollectionViewController _adjustForEnvironmentChangeIfNeededWithSize:transitionCoordinator:](self, "_adjustForEnvironmentChangeIfNeededWithSize:transitionCoordinator:", 0, v4, v5);
}

- (void)viewWillTransitionToSize:(CGSize)a3
{
}

- (id)dequeueReusableViewControllerForItemAtIndex:(int64_t)a3
{
  if (self->_selectedItemIndex == a3 && (double v4 = self->_inactiveSelectedViewController) != 0)
  {
    double v5 = v4;
    inactiveSelectedViewController = self->_inactiveSelectedViewController;
    self->_inactiveSelectedViewController = 0;
  }
  else
  {
    double v5 = [(NSMutableSet *)self->_inactiveViewControllers anyObject];
    if (v5) {
      [(NSMutableSet *)self->_inactiveViewControllers removeObject:v5];
    }
  }
  if ([(MediaControlsCollectionItemViewController *)v5 isViewLoaded])
  {
    id v7 = [(MediaControlsCollectionItemViewController *)v5 view];
    [v7 setHidden:0];

    v8 = [(MediaControlsCollectionItemViewController *)v5 view];
    [v8 setAlpha:1.0];

    v9 = [(MediaControlsCollectionItemViewController *)v5 view];
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v12[0] = *MEMORY[0x1E4F1DAB8];
    v12[1] = v10;
    v12[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v9 setTransform:v12];
  }

  return v5;
}

- (id)viewControllerForItemAtPoint:(CGPoint)a3
{
  int64_t v4 = -[MediaControlsCollectionViewController itemAtPoint:](self, "itemAtPoint:", a3.x, a3.y);

  return [(MediaControlsCollectionViewController *)self viewControllerForItemAtIndex:v4];
}

- (id)viewControllerForItemAtIndex:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v3 = 0;
  }
  else
  {
    activeViewControllers = self->_activeViewControllers;
    double v5 = objc_msgSend(NSNumber, "numberWithInteger:");
    BOOL v3 = [(NSMutableDictionary *)activeViewControllers objectForKey:v5];
  }

  return v3;
}

- (id)viewControllerForSelectedItem
{
  inactiveSelectedViewController = [(MediaControlsCollectionViewController *)self viewControllerForItemAtIndex:self->_selectedItemIndex];
  int64_t v4 = inactiveSelectedViewController;
  if (!inactiveSelectedViewController) {
    inactiveSelectedViewController = self->_inactiveSelectedViewController;
  }
  id v5 = inactiveSelectedViewController;

  return v5;
}

- (NSArray)visibleViewControllers
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  int64_t v4 = [(MediaControlsCollectionViewController *)self visibleIndexes];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  long long v10 = __63__MediaControlsCollectionViewController_visibleViewControllers__block_invoke;
  v11 = &unk_1E5F0F050;
  v12 = self;
  id v13 = v3;
  id v5 = v3;
  [v4 enumerateIndexesUsingBlock:&v8];

  objc_super v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

void __63__MediaControlsCollectionViewController_visibleViewControllers__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = [*(id *)(a1 + 32) viewControllerForItemAtIndex:a2];
  if (v3)
  {
    int64_t v4 = v3;
    [*(id *)(a1 + 40) addObject:v3];
    BOOL v3 = v4;
  }
}

- (NSArray)visibleTopViewControllers
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  int64_t v4 = [(MediaControlsCollectionViewController *)self visibleIndexes];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  long long v10 = __66__MediaControlsCollectionViewController_visibleTopViewControllers__block_invoke;
  v11 = &unk_1E5F0F050;
  v12 = self;
  id v13 = v3;
  id v5 = v3;
  [v4 enumerateIndexesUsingBlock:&v8];

  objc_super v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

void __66__MediaControlsCollectionViewController_visibleTopViewControllers__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  int64_t v4 = *(void **)(a1 + 32);
  if (v4[142] == a2)
  {
    *a3 = 1;
  }
  else
  {
    id v5 = [v4 viewControllerForItemAtIndex:a2];
    if (v5)
    {
      objc_super v6 = v5;
      [*(id *)(a1 + 40) addObject:v5];
      id v5 = v6;
    }
  }
}

- (NSArray)visibleBottomViewControllers
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  int64_t v4 = [(MediaControlsCollectionViewController *)self visibleIndexes];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  long long v10 = __69__MediaControlsCollectionViewController_visibleBottomViewControllers__block_invoke;
  v11 = &unk_1E5F0F050;
  v12 = self;
  id v13 = v3;
  id v5 = v3;
  [v4 enumerateIndexesUsingBlock:&v8];

  objc_super v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

void __69__MediaControlsCollectionViewController_visibleBottomViewControllers__block_invoke(uint64_t a1, unint64_t a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  if (v3[142] < a2)
  {
    int64_t v4 = [v3 viewControllerForItemAtIndex:a2];
    if (v4)
    {
      id v5 = v4;
      [*(id *)(a1 + 40) addObject:v4];
      int64_t v4 = v5;
    }
  }
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setDisplayMode:(int64_t)a3
{
  if (self->_displayMode != a3) {
    self->_displayMode = a3;
  }
}

- (void)setSelectedItemIndex:(int64_t)a3
{
}

- (void)setSelectedItemIndex:(int64_t)a3 animated:(BOOL)a4 shouldScroll:(BOOL)a5
{
}

- (void)setScrollViewInsets:(UIEdgeInsets)a3
{
  if (self->_scrollViewInsets.left != a3.left
    || self->_scrollViewInsets.top != a3.top
    || self->_scrollViewInsets.right != a3.right
    || self->_scrollViewInsets.bottom != a3.bottom)
  {
    self->_scrollViewInsets = a3;
    [(MediaControlsCollectionViewController *)self _tileViews];
    long long v10 = objc_alloc_init(MediaControlsStyleCoordinator);
    id v7 = [(MediaControlsCollectionViewController *)self view];
    [v7 bounds];
    -[MediaControlsCollectionViewController _updateFramesForActiveViewControllersWithCoordinator:assumingSize:](self, "_updateFramesForActiveViewControllersWithCoordinator:assumingSize:", v10, v8, v9);

    [(MediaControlsStyleCoordinator *)v10 performAnimations];
    [(MediaControlsStyleCoordinator *)v10 performCompletions];
  }
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(MediaControlsCollectionViewController *)self _reloadDataIfNeeded];
    id v5 = obj;
  }
}

- (void)insertItemAtIndex:(int64_t)a3
{
}

- (void)insertItemsAtIndexes:(id)a3
{
}

- (void)deleteItemAtIndex:(int64_t)a3
{
}

- (void)deleteItemsAtIndexes:(id)a3
{
}

- (void)moveItemAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
}

- (void)reloadItemAtIndex:(int64_t)a3
{
}

- (void)reloadItemsAtIndexes:(id)a3
{
}

- (void)performBatchUpdates:(id)a3
{
  int64_t v4 = (void (**)(void))a3;
  if ([(MediaControlsCollectionViewController *)self _canPerformBatchUpdates])
  {
    self->_isPerformingBatchUpdates = 1;
    self->_shouldIgnoreScrollNotifications = 1;
    v4[2](v4);
    if ([(MediaControlsCollectionViewCountData *)self->_countData hasPendingChanges])
    {
      id v5 = [(MediaControlsCollectionViewController *)self dataSource];
      if (-[MediaControlsCollectionViewCountData validateCountForNumberOfItems:](self->_countData, "validateCountForNumberOfItems:", [v5 numberOfItemsInCollectionViewController:self])&& self->_displayMode == 1)
      {
        [(MediaControlsCollectionViewController *)self _setHighlighted:0 forViewControllerAtIndex:self->_highlightedItemIndex];
        [(UIScrollView *)self->_scrollView contentOffset];
        uint64_t v131 = 0;
        v132 = (double *)&v131;
        uint64_t v133 = 0x3010000000;
        v134 = &unk_1AE9816B7;
        uint64_t v135 = v6;
        uint64_t v136 = v7;
        int64_t selectedItemIndex = self->_selectedItemIndex;
        v130[0] = 0;
        v130[1] = v130;
        v130[2] = 0x2020000000;
        v130[3] = selectedItemIndex;
        double v9 = [(MediaControlsCollectionViewController *)self visibleIndexes];
        v61 = [(MediaControlsCollectionViewCountData *)self->_countData insertedIndexes];
        v59 = [(MediaControlsCollectionViewCountData *)self->_countData deletedIndexes];
        v53 = [(MediaControlsCollectionViewCountData *)self->_countData updatedIndexes];
        v58 = v5;
        long long v10 = [MEMORY[0x1E4F1CA80] set];
        v11 = [MEMORY[0x1E4F1CA80] set];
        memset(&v129, 0, sizeof(v129));
        CGAffineTransformMakeScale(&v129, 0.32, 0.32);
        memset(&v128, 0, sizeof(v128));
        CGAffineTransformMakeScale(&v128, 0.32, 0.32);
        v127[0] = 0;
        v127[1] = v127;
        v127[2] = 0x2020000000;
        v127[3] = 0;
        v116[0] = MEMORY[0x1E4F143A8];
        v116[1] = 3221225472;
        v116[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke;
        v116[3] = &unk_1E5F0F078;
        v120 = v127;
        id v49 = v9;
        id v117 = v49;
        v118 = self;
        id v12 = v10;
        long long v55 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        long long v123 = *MEMORY[0x1E4F1DAB8];
        long long v56 = v123;
        long long v124 = v55;
        long long v125 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        long long v54 = v125;
        int64_t v126 = selectedItemIndex;
        id v119 = v12;
        v121 = v130;
        v122 = &v131;
        [v59 enumerateIndexesUsingBlock:v116];
        [(MediaControlsCollectionViewCountData *)self->_countData applyChanges];
        [(MediaControlsCollectionViewController *)self _updateContentSize];
        -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v132[4], v132[5]);
        self->_int64_t selectedItemIndex = [v58 defaultSelectedItemIndexForCollectionViewController:self];
        [(UIScrollView *)self->_scrollView bounds];
        id v13 = -[MediaControlsCollectionViewController _indexesOfItemsInRect:](self, "_indexesOfItemsInRect:");
        v115[0] = 0;
        v115[1] = v115;
        v115[2] = 0x2020000000;
        v115[3] = 0;
        v110[0] = MEMORY[0x1E4F143A8];
        v110[1] = 3221225472;
        v110[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_2;
        v110[3] = &unk_1E5F0F0A0;
        id v14 = v13;
        v113 = v115;
        v114 = &v131;
        id v111 = v14;
        v112 = self;
        [v61 enumerateIndexesUsingBlock:v110];
        -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v132[4], v132[5]);
        [(UIScrollView *)self->_scrollView bounds];
        v15 = -[MediaControlsCollectionViewController _indexesOfItemsInRect:](self, "_indexesOfItemsInRect:");

        v104[0] = MEMORY[0x1E4F143A8];
        v104[1] = 3221225472;
        v104[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_3;
        v104[3] = &unk_1E5F0F0C8;
        v104[4] = self;
        id v16 = v15;
        id v105 = v16;
        CGAffineTransform v108 = v129;
        id v17 = v11;
        int64_t v109 = selectedItemIndex;
        id v106 = v17;
        v107 = v130;
        [v61 enumerateIndexesUsingBlock:v104];
        v103[0] = MEMORY[0x1E4F143A8];
        v103[1] = 3221225472;
        v103[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_4;
        v103[3] = &unk_1E5F0F0F0;
        v103[4] = self;
        uint64_t v18 = [v16 indexPassingTest:v103];
        v102[0] = MEMORY[0x1E4F143A8];
        v102[1] = 3221225472;
        v102[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_5;
        v102[3] = &unk_1E5F0F0F0;
        v102[4] = self;
        uint64_t v19 = [v16 indexWithOptions:2 passingTest:v102];
        uint64_t v20 = [v16 firstIndex];
        uint64_t v21 = [v16 lastIndex];
        v101[0] = MEMORY[0x1E4F143A8];
        v101[1] = 3221225472;
        v101[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_6;
        v101[3] = &unk_1E5F0F118;
        v101[6] = v18 - v20;
        v101[7] = v19;
        v101[8] = v21 - v19;
        v101[5] = v18;
        v101[4] = self;
        [v16 enumerateIndexesUsingBlock:v101];
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_7;
        v92[3] = &unk_1E5F0F140;
        id v22 = v16;
        id v93 = v22;
        v94 = self;
        long long v97 = v56;
        long long v98 = v55;
        long long v99 = v54;
        id v23 = v12;
        id v95 = v23;
        CGAffineTransform v100 = v129;
        id v24 = v17;
        id v96 = v24;
        [v53 enumerateIndexesUsingBlock:v92];
        int64_t v48 = self->_selectedItemIndex;
        v25 = objc_alloc_init(MediaControlsStyleCoordinator);
        v47 = [(id)objc_opt_class() frameAnimator];
        v60 = [(id)objc_opt_class() frameAnimator];
        v63 = [(id)objc_opt_class() frameAnimator];
        v26 = objc_opt_class();
        v90[0] = MEMORY[0x1E4F143A8];
        v90[1] = 3221225472;
        v90[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_8;
        v90[3] = &unk_1E5F0D7F8;
        id v27 = v23;
        id v91 = v27;
        v51 = [v26 alphaAnimatorWithAnimations:v90];
        v46 = v22;
        v28 = objc_opt_class();
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_9;
        v88[3] = &unk_1E5F0D7F8;
        id v29 = v24;
        id v89 = v29;
        v52 = [v28 alphaAnimatorWithAnimations:v88];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_10;
        aBlock[3] = &unk_1E5F0F168;
        id v30 = v27;
        id v86 = v30;
        CGAffineTransform v87 = v128;
        v31 = _Block_copy(aBlock);
        v79[0] = MEMORY[0x1E4F143A8];
        v79[1] = 3221225472;
        v79[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_11;
        v79[3] = &unk_1E5F0F1B8;
        v79[4] = self;
        id v32 = v29;
        id v80 = v32;
        v83 = v130;
        int64_t v84 = v48;
        v33 = v25;
        v81 = v33;
        id v45 = v61;
        id v82 = v45;
        v62 = _Block_copy(v79);
        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_13;
        v74[3] = &unk_1E5F0F168;
        id v50 = v32;
        id v75 = v50;
        long long v76 = v56;
        long long v77 = v55;
        long long v78 = v54;
        v34 = _Block_copy(v74);
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_14;
        v69[3] = &unk_1E5F0F1E0;
        v69[4] = self;
        v72 = v130;
        int64_t v73 = v48;
        id v57 = v46;
        id v70 = v57;
        v35 = v33;
        v71 = v35;
        v36 = _Block_copy(v69);
        [v47 addAnimations:v31];
        [v60 addAnimations:v62];
        [v63 addAnimations:v34];
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_15;
        v66[3] = &unk_1E5F0F208;
        id v37 = v30;
        id v67 = v37;
        v68 = self;
        [v47 addCompletion:v66];
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_16;
        v64[3] = &unk_1E5F0DDB0;
        id v38 = v36;
        id v65 = v38;
        [v63 addCompletion:v64];
        if ([v37 count])
        {
          [v47 startAnimation];
          double v39 = 0.1;
          [v51 startAnimationAfterDelay:0.1];
        }
        else
        {
          double v39 = 0.0;
        }
        if ([v37 count] || objc_msgSend(v50, "count"))
        {
          [v60 startAnimationAfterDelay:v39];
          double v39 = v39 + 0.1;
        }
        else
        {
          v42 = [(MediaControlsCollectionViewController *)self view];
          [v42 bounds];
          -[MediaControlsCollectionViewController _updateFramesForActiveViewControllersWithCoordinator:assumingSize:](self, "_updateFramesForActiveViewControllersWithCoordinator:assumingSize:", v35, v43, v44);

          [(MediaControlsStyleCoordinator *)v35 performAnimations];
        }
        [v63 startAnimationAfterDelay:v39];
        [v52 startAnimationAfterDelay:v39 + 0.1];
        self->_shouldIgnoreScrollNotifications = 0;

        _Block_object_dispose(v115, 8);
        _Block_object_dispose(v127, 8);

        _Block_object_dispose(v130, 8);
        _Block_object_dispose(&v131, 8);
        id v5 = v58;
      }
      else
      {
        self->_isPerformingBatchUpdates = 0;
        self->_shouldIgnoreScrollNotifications = 0;
        [(MediaControlsCollectionViewController *)self reloadData];
      }
    }
    else
    {
      self->_isPerformingBatchUpdates = 0;
      self->_shouldIgnoreScrollNotifications = 0;
      [(MediaControlsCollectionViewController *)self _dequeueAndPerformBatchUpdatesIfNeeded];
    }
  }
  else
  {
    pendingUpdates = self->_pendingUpdates;
    v41 = _Block_copy(v4);
    [(NSMutableArray *)pendingUpdates addObject:v41];
  }
}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a2 - *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v5 = 976;
  if ([*(id *)(a1 + 32) containsIndex:a2])
  {
    uint64_t v6 = *(void **)(*(void *)(v3 + 40) + 976);
    uint64_t v7 = [NSNumber numberWithInteger:v4];
    double v8 = [v6 objectForKey:v7];

    if (v8)
    {
      [*(id *)(v3 + 48) addObject:v8];
      double v9 = *(void **)(*(void *)(v3 + 40) + 976);
      long long v10 = [NSNumber numberWithInteger:v4];
      [v9 removeObjectForKey:v10];

      v11 = [v8 view];
      [v11 setAlpha:1.0];

      id v12 = [v8 view];
      long long v13 = *(_OWORD *)(v3 + 96);
      v43[0] = *(_OWORD *)(v3 + 80);
      v43[1] = v13;
      v43[2] = *(_OWORD *)(v3 + 112);
      [v12 setTransform:v43];
    }
    unint64_t v14 = *(void *)(v3 + 128);
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_10;
    }
    if (v14 <= a2)
    {
      if (v14 != a2)
      {
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v16 = *(void *)(*(void *)(v3 + 64) + 8);
    }
    else
    {
      uint64_t v16 = *(void *)(*(void *)(v3 + 64) + 8);
      uint64_t v15 = *(void *)(v16 + 24) - 1;
    }
    *(void *)(v16 + 24) = v15;
    goto LABEL_10;
  }
LABEL_11:
  id v17 = (void *)[*(id *)(*(void *)(v3 + 40) + 976) copy];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v37 = v17;
  uint64_t v18 = [v17 allKeys];
  uint64_t v19 = [v18 sortedArrayUsingSelector:sel_compare_];

  id obj = v19;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(obj);
        }
        id v24 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v25 = [v24 integerValue];
        if (v25 > v4)
        {
          uint64_t v26 = v25;
          uint64_t v27 = v4;
          uint64_t v28 = v3;
          id v29 = *(void **)(*(void *)(v3 + 40) + v5);
          [v37 objectForKey:v24];
          v31 = uint64_t v30 = v5;
          id v32 = [NSNumber numberWithInteger:v26 - 1];
          v33 = v29;
          uint64_t v3 = v28;
          uint64_t v4 = v27;
          [v33 setObject:v31 forKey:v32];

          uint64_t v5 = v30;
          [*(id *)(*(void *)(v3 + 40) + v30) removeObjectForKey:v24];
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v21);
  }

  if ([*(id *)(v3 + 32) firstIndex] > a2)
  {
    objc_msgSend(*(id *)(v3 + 40), "_frameForViewAtIndex:");
    double Height = CGRectGetHeight(v46);
    [*(id *)(v3 + 40) _verticalSpacing];
    *(double *)(*(void *)(*(void *)(v3 + 72) + 8) + 40) = *(double *)(*(void *)(*(void *)(v3 + 72) + 8)
                                                                            + 40)
                                                                - (Height
                                                                 + v35);
  }
  ++*(void *)(*(void *)(*(void *)(v3 + 56) + 8) + 24);
}

uint64_t __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_2(uint64_t result, unint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    result = [*(id *)(result + 32) firstIndex];
    if (result)
    {
      result = [*(id *)(v3 + 32) firstIndex];
      if (*(void *)(*(void *)(*(void *)(v3 + 48) + 8) + 24) + result >= a2)
      {
        [*(id *)(v3 + 40) _frameForViewAtIndex:a2];
        double Height = CGRectGetHeight(v6);
        result = [*(id *)(v3 + 40) _verticalSpacing];
        *(double *)(*(void *)(*(void *)(v3 + 56) + 8) + 40) = Height
                                                                    + v5
                                                                    + *(double *)(*(void *)(*(void *)(v3 + 56) + 8)
                                                                                + 40);
        ++*(void *)(*(void *)(*(void *)(v3 + 48) + 8) + 24);
      }
    }
  }
  return result;
}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_3(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 976) copy];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v25 = v4;
  double v5 = [v4 allKeys];
  CGRect v6 = [v5 sortedArrayUsingSelector:sel_compare_];
  uint64_t v7 = [v6 reverseObjectEnumerator];

  id obj = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        unint64_t v13 = [v12 integerValue];
        if (v13 >= a2)
        {
          unint64_t v14 = v13;
          uint64_t v15 = v3;
          uint64_t v16 = *(void **)(*(void *)(v3 + 32) + 976);
          id v17 = [v25 objectForKey:v12];
          uint64_t v18 = [NSNumber numberWithInteger:v14 + 1];
          uint64_t v19 = v16;
          uint64_t v3 = v15;
          [v19 setObject:v17 forKey:v18];

          [*(id *)(*(void *)(v15 + 32) + 976) removeObjectForKey:v12];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v9);
  }

  if ([*(id *)(v3 + 40) containsIndex:a2])
  {
    uint64_t v20 = [*(id *)(v3 + 32) _insertViewControllerForIndex:a2];
    uint64_t v21 = [v20 view];
    [v21 setAlpha:0.0];

    uint64_t v22 = [v20 view];
    long long v23 = *(_OWORD *)(v3 + 80);
    v27[0] = *(_OWORD *)(v3 + 64);
    v27[1] = v23;
    v27[2] = *(_OWORD *)(v3 + 96);
    [v22 setTransform:v27];

    [*(id *)(v3 + 48) addObject:v20];
  }
  unint64_t v24 = *(void *)(v3 + 112);
  if (v24 != 0x7FFFFFFFFFFFFFFFLL && v24 >= a2) {
    ++*(void *)(*(void *)(*(void *)(v3 + 56) + 8) + 24);
  }
}

BOOL __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_4(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 976);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v4 = [v2 objectForKey:v3];
  BOOL v5 = v4 != 0;

  return v5;
}

BOOL __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_5(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 976);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v4 = [v2 objectForKey:v3];
  BOOL v5 = v4 != 0;

  return v5;
}

uint64_t __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_6(uint64_t result, unint64_t a2)
{
  uint64_t v3 = result;
  if (*(void *)(result + 40) <= a2)
  {
    if (*(void *)(result + 56) >= a2) {
      return result;
    }
    uint64_t v4 = *(void *)(result + 64) + a2;
  }
  else
  {
    uint64_t v4 = a2 - *(void *)(result + 48);
  }
  [*(id *)(result + 32) _frameForViewAtIndex:v4];
  double v6 = v5;
  double v8 = v7;
  [*(id *)(v3 + 32) _frameForViewAtIndex:a2];
  double v10 = v9;
  double v12 = v11;
  id v13 = (id)[*(id *)(v3 + 32) _insertViewControllerForIndex:a2];
  unint64_t v14 = *(void **)(v3 + 32);

  return objc_msgSend(v14, "_setFrame:forVisibleViewAtIndex:", a2, v6, v8, v10, v12);
}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_7(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) containsIndex:a2])
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 976);
    double v5 = [NSNumber numberWithUnsignedInteger:a2];
    double v6 = [v4 objectForKey:v5];

    if (v6)
    {
      double v7 = [v6 view];
      [v7 setAlpha:1.0];

      double v8 = [v6 view];
      long long v9 = *(_OWORD *)(a1 + 80);
      long long v14 = *(_OWORD *)(a1 + 64);
      long long v15 = v9;
      long long v16 = *(_OWORD *)(a1 + 96);
      [v8 setTransform:&v14];

      [*(id *)(a1 + 48) addObject:v6];
    }
    double v10 = [*(id *)(a1 + 40) _insertViewControllerForIndex:a2];
    double v11 = [v10 view];
    [v11 setAlpha:0.0];

    double v12 = [v10 view];
    long long v13 = *(_OWORD *)(a1 + 128);
    long long v14 = *(_OWORD *)(a1 + 112);
    long long v15 = v13;
    long long v16 = *(_OWORD *)(a1 + 144);
    [v12 setTransform:&v14];

    [*(id *)(a1 + 56) addObject:v10];
  }
}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_8(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        double v6 = objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5), "view", (void)v7);
        [v6 setAlpha:0.0];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_9(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        double v6 = objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5), "view", (void)v7);
        [v6 setAlpha:1.0];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_10(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    double v6 = (_OWORD *)(a1 + 40);
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) view];
        long long v9 = v6[1];
        v10[0] = *v6;
        v10[1] = v9;
        v10[2] = v6[2];
        [v8 setTransform:v10];

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_11(uint64_t a1)
{
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_12;
  long long v23 = &unk_1E5F0F190;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v24 = v3;
  uint64_t v25 = v4;
  [v2 _enumerateActiveViewControllers:&v20];
  if (*(void *)(a1 + 72) != *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "viewControllerForItemAtIndex:", v20, v21, v22, v23);
    double v6 = [*(id *)(a1 + 32) viewControllerForItemAtIndex:*(void *)(a1 + 72)];
    [v5 setSelected:0];
    [v6 setSelected:1];
    if (v5)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      uint64_t v9 = *(void *)(a1 + 48);
      long long v10 = [v7 view];
      [v10 bounds];
      objc_msgSend(v7, "_updateFrameForViewController:atIndex:withCoordinator:assumingSize:", v5, v8, v9, v11, v12);
    }
    long long v13 = [*(id *)(a1 + 32) delegate];
    [v13 mediaControlsCollectionViewController:*(void *)(a1 + 32) willSelectItemAtIndex:*(void *)(a1 + 72) withReason:1];

    if (v6 && ([*(id *)(a1 + 56) containsIndex:*(void *)(a1 + 72)] & 1) == 0)
    {
      long long v14 = *(void **)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 72);
      uint64_t v16 = *(void *)(a1 + 48);
      id v17 = [v14 view];
      [v17 bounds];
      objc_msgSend(v14, "_updateFrameForViewController:atIndex:withCoordinator:assumingSize:", v6, v15, v16, v18, v19);
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "performAnimations", v20, v21, v22, v23);
}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v23 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    [*(id *)(a1 + 40) _frameForViewAtIndex:a2];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    long long v13 = [v23 view];
    [v13 position];
    double v15 = v14;
    double v17 = v16;

    v25.origin.x = v6;
    v25.origin.y = v8;
    v25.size.width = v10;
    v25.size.height = v12;
    double MidX = CGRectGetMidX(v25);
    v26.origin.x = v6;
    v26.origin.y = v8;
    v26.size.width = v10;
    v26.size.height = v12;
    double MidY = CGRectGetMidY(v26);
    if (v15 != MidX || v17 != MidY)
    {
      double v21 = MidY;
      uint64_t v22 = [v23 view];
      objc_msgSend(v22, "setPosition:", MidX, v21);
    }
  }
}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_13(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    CGFloat v6 = (_OWORD *)(a1 + 40);
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        CGFloat v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) view];
        long long v9 = v6[1];
        v10[0] = *v6;
        v10[1] = v9;
        v10[2] = v6[2];
        [v8 setTransform:v10];

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

uint64_t __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_14(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "containsIndex:", objc_msgSend(v7, "integerValue")) & 1) == 0) {
          objc_msgSend(*(id *)(a1 + 32), "_reapViewAtIndex:", objc_msgSend(v7, "integerValue"));
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 1075) = 0;
  CGFloat v8 = *(id **)(a1 + 32);
  [v8[140] bounds];
  objc_msgSend(v8, "_populateViewsInFrame:");
  [*(id *)(a1 + 32) _dequeueAndPerformBatchUpdatesIfNeeded];
  [*(id *)(*(void *)(a1 + 32) + 1120) contentOffset];
  double v10 = v9;
  double v12 = v11;
  [*(id *)(*(void *)(a1 + 32) + 1120) contentSize];
  double v14 = v13;
  [*(id *)(*(void *)(a1 + 32) + 1120) bounds];
  double v16 = v14 - v15;
  [*(id *)(*(void *)(a1 + 32) + 1120) contentInset];
  if (v16 + v17 > 0.0 && v12 > v16 + v17) {
    [*(id *)(*(void *)(a1 + 32) + 1120) setContentOffset:1 animated:v10];
  }
  if (*(void *)(a1 + 64) != *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    double v19 = [*(id *)(a1 + 32) delegate];
    [v19 mediaControlsCollectionViewController:*(void *)(a1 + 32) didSelectItemAtIndex:*(void *)(a1 + 64) withReason:1];
  }
  return [*(id *)(a1 + 48) performCompletions];
}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_15(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_removeViewController:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

uint64_t __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reloadData
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MediaControlsCollectionViewController *)self dataSource];
  if (v3)
  {
    [(MediaControlsCollectionViewController *)self _setHighlighted:0 forViewControllerAtIndex:self->_highlightedItemIndex];
    [(MediaControlsCollectionViewController *)self _reapActiveViews];
    uint64_t v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activeViewControllers = self->_activeViewControllers;
    self->_activeViewControllers = v4;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = self->_pendingUpdates;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          self->_isPerformingBatchUpdates = 1;
          (*(void (**)(uint64_t))(v11 + 16))(v11);
          self->_isPerformingBatchUpdates = 0;
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingUpdates = self->_pendingUpdates;
    self->_pendingUpdates = v12;

    double v14 = [MediaControlsCollectionViewCountData alloc];
    double v15 = -[MediaControlsCollectionViewCountData initWithNumberOfItems:](v14, "initWithNumberOfItems:", objc_msgSend(v3, "numberOfItemsInCollectionViewController:", self, (void)v17));
    countData = self->_countData;
    self->_countData = v15;

    self->_int64_t selectedItemIndex = [v3 defaultSelectedItemIndexForCollectionViewController:self];
    [(MediaControlsCollectionViewController *)self _tileViews];
    self->_needsReloadData = 0;
    [(MediaControlsCollectionViewController *)self _removeInactiveViewControllersFromHierarchy];
  }
  else
  {
    self->_needsReloadData = 1;
  }
}

- (int64_t)itemAtPoint:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  int64_t selectedItemIndex = self->_selectedItemIndex;
  [(MediaControlsCollectionViewController *)self _preferredSelectedItemHeight];
  double v8 = v7;
  if (self->_displayMode) {
    [(MediaControlsCollectionViewController *)self _regularItemHeight];
  }
  double v9 = v7;
  [(MediaControlsCollectionViewController *)self _verticalSpacing];
  double v11 = v9 + v10;
  double v12 = y / (v9 + v10);
  if (v12 < 0.0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v13 = (uint64_t)v12;
  if (selectedItemIndex <= (uint64_t)v12)
  {
    int64_t v13 = selectedItemIndex;
    if (selectedItemIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = *MEMORY[0x1E4F1DB28];
      uint64_t v15 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
      uint64_t v16 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
      uint64_t v17 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      [(MediaControlsCollectionViewController *)self _frameForViewAtIndex:selectedItemIndex];
    }
    v19.CGFloat x = x;
    v19.double y = y;
    if (!CGRectContainsPoint(*(CGRect *)&v14, v19))
    {
      int64_t v13 = (uint64_t)((y - (v8 - v9)) / v11);
      if ([(MediaControlsCollectionViewCountData *)self->_countData numberOfItems] < v13) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      [(MediaControlsCollectionViewController *)self _frameForViewAtIndex:v13];
      v20.CGFloat x = x;
      v20.double y = y;
      if (!CGRectContainsPoint(v21, v20)) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  return v13;
}

- (NSIndexSet)visibleIndexes
{
  [(UIScrollView *)self->_scrollView bounds];

  return (NSIndexSet *)-[MediaControlsCollectionViewController _indexesOfItemsInRect:](self, "_indexesOfItemsInRect:");
}

- (BOOL)_canPerformBatchUpdates
{
  return !self->_isPerformingBatchUpdates
      && ![(MediaControlsCollectionViewController *)self _isScrollViewAnimatingScroll]
      && !self->_appearanceTransitionCount
      && !self->_isAnimatingSelection;
}

- (void)_dequeueAndPerformBatchUpdatesIfNeeded
{
  if ([(NSMutableArray *)self->_pendingUpdates count]
    && [(MediaControlsCollectionViewController *)self _canPerformBatchUpdates])
  {
    id v3 = [(NSMutableArray *)self->_pendingUpdates firstObject];
    [(NSMutableArray *)self->_pendingUpdates removeObjectAtIndex:0];
    [(MediaControlsCollectionViewController *)self performBatchUpdates:v3];
  }
}

- (int64_t)_closestItemAtPoint:(CGPoint)a3
{
  double y = a3.y;
  int64_t selectedItemIndex = self->_selectedItemIndex;
  [(MediaControlsCollectionViewController *)self _preferredSelectedItemHeight];
  double v7 = v6;
  if (self->_displayMode) {
    [(MediaControlsCollectionViewController *)self _regularItemHeight];
  }
  double v8 = v6;
  [(MediaControlsCollectionViewController *)self _verticalSpacing];
  double v10 = v8 + v9;
  double v11 = y / (v8 + v9);
  if (v11 < 0.0) {
    return 0;
  }
  int64_t v12 = (uint64_t)v11;
  if (selectedItemIndex <= (uint64_t)v11)
  {
    int64_t v12 = selectedItemIndex;
    if (selectedItemIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = *MEMORY[0x1E4F1DB28];
      uint64_t v14 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
      uint64_t v15 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
      uint64_t v16 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      [(MediaControlsCollectionViewController *)self _frameForViewAtIndex:selectedItemIndex];
    }
    if (y > CGRectGetMaxY(*(CGRect *)&v13)) {
      return (uint64_t)((y - (v7 - v8)) / v10);
    }
  }
  return v12;
}

- (double)_regularItemHeight
{
  return 108.0;
}

- (double)_preferredSelectedItemHeight
{
  -[MediaControlsCollectionViewController _selectedItemHeightInSize:](self, "_selectedItemHeightInSize:", self->_lastKnownEnvironmentSize.width, self->_lastKnownEnvironmentSize.height);
  return result;
}

- (double)_selectedItemHeightInSize:(CGSize)a3
{
  -[MediaControlsCollectionViewController _selectedItemHeightInSize:shouldIgnoreInsets:](self, "_selectedItemHeightInSize:shouldIgnoreInsets:", self->_displayMode == 0, a3.width, a3.height);
  return result;
}

- (double)_selectedItemHeightInSize:(CGSize)a3 shouldIgnoreInsets:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  -[MediaControlsCollectionViewController preferredItemHeightGivenWidth:](self, "preferredItemHeightGivenWidth:");
  double v9 = v8;
  if (v4)
  {
    double v9 = v8 + self->_controlCenterEdgeInsets.top + self->_controlCenterEdgeInsets.bottom;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    UIRectInset();
    CGFloat width = v12;
    CGFloat height = v13;
  }
  CGFloat v14 = width;
  CGFloat v15 = height;
  double result = CGRectGetHeight(*(CGRect *)&v11);
  if (v9 < result) {
    return v9;
  }
  return result;
}

- (id)_indexesOfItemsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = objc_alloc(MEMORY[0x1E4F28D60]);
  uint64_t v9 = -[MediaControlsCollectionViewController _rangeOfItemsInRect:](self, "_rangeOfItemsInRect:", x, y, width, height);
  uint64_t v11 = objc_msgSend(v8, "initWithIndexesInRange:", v9, v10);

  return v11;
}

- (_NSRange)_rangeOfItemsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v8 = [(MediaControlsCollectionViewCountData *)self->_countData numberOfItems];
  v20.origin.CGFloat x = x;
  v20.origin.double y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  uint64_t v9 = -[MediaControlsCollectionViewController _closestItemAtPoint:](self, "_closestItemAtPoint:", CGRectGetMidX(v20), y);
  uint64_t v10 = v9 & ~(v9 >> 63);
  v21.origin.CGFloat x = x;
  v21.origin.double y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v21);
  v22.origin.CGFloat x = x;
  v22.origin.double y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  int64_t v12 = -[MediaControlsCollectionViewController _closestItemAtPoint:](self, "_closestItemAtPoint:", MidX, CGRectGetMaxY(v22));
  int64_t v13 = v8 - 1;
  if (v12 < v8 - 1) {
    int64_t v13 = v12;
  }
  if (v8 > 0 && v10 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v15 = 0;
  }
  else {
    NSUInteger v15 = v10;
  }
  NSUInteger v16 = v13 - v15;
  if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v17 = 0;
  }
  else {
    NSUInteger v17 = v15;
  }
  if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v18 = 0;
  }
  else {
    NSUInteger v18 = v16 + 1;
  }
  result.length = v18;
  result.location = v17;
  return result;
}

- (CGRect)_frameForViewAtIndex:(int64_t)a3
{
  uint64_t v5 = [(MediaControlsCollectionViewController *)self view];
  [v5 bounds];
  -[MediaControlsCollectionViewController _frameForViewAtIndex:size:](self, "_frameForViewAtIndex:size:", a3, v6, v7);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.double y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)_frameForViewAtIndex:(int64_t)a3 size:(CGSize)a4
{
  -[MediaControlsCollectionViewController _frameForViewAtIndex:displayMode:size:](self, "_frameForViewAtIndex:displayMode:size:", a3, self->_displayMode, a4.width, a4.height);
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.double y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)_frameForViewAtIndex:(int64_t)a3 displayMode:(int64_t)a4 size:(CGSize)a5
{
  double width = a5.width;
  int64_t selectedItemIndex = self->_selectedItemIndex;
  -[MediaControlsCollectionViewController _selectedItemHeightInSize:shouldIgnoreInsets:](self, "_selectedItemHeightInSize:shouldIgnoreInsets:", a4 == 0, a5.width, a5.height);
  double v11 = v10;
  if (a4)
  {
    [(MediaControlsCollectionViewController *)self _regularItemHeight];
    double v13 = v12;
    [(MediaControlsCollectionViewController *)self _verticalSpacing];
    double v15 = v14;
    double left = self->_scrollViewInsets.left;
    double width = width - (left + self->_scrollViewInsets.right);
  }
  else
  {
    [(MediaControlsCollectionViewController *)self _verticalSpacing];
    double v15 = v17;
    double left = 0.0;
    double v13 = v11;
  }
  double v18 = (v13 + v15) * (double)a3;
  double v19 = v11 - v13;
  if (selectedItemIndex >= a3) {
    double v19 = -0.0;
  }
  double v20 = v19 + v18;
  if (selectedItemIndex == a3) {
    double v21 = v11;
  }
  else {
    double v21 = v13;
  }
  double v22 = width;
  result.size.CGFloat height = v21;
  result.size.double width = v22;
  result.origin.double y = v20;
  result.origin.CGFloat x = left;
  return result;
}

- (void)_populateViewsInFrame:(CGRect)a3
{
  double v4 = -[MediaControlsCollectionViewController _indexesOfItemsInRect:](self, "_indexesOfItemsInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = (void *)[v4 mutableCopy];

  if (!self->_shouldDisableAutoReaping)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__MediaControlsCollectionViewController__populateViewsInFrame___block_invoke;
    v7[3] = &unk_1E5F0F190;
    id v8 = v5;
    double v9 = self;
    [(MediaControlsCollectionViewController *)self _enumerateActiveViewControllers:v7];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__MediaControlsCollectionViewController__populateViewsInFrame___block_invoke_2;
  v6[3] = &unk_1E5F0F230;
  v6[4] = self;
  [v5 enumerateIndexesUsingBlock:v6];
}

uint64_t __63__MediaControlsCollectionViewController__populateViewsInFrame___block_invoke(uint64_t a1, unint64_t a2)
{
  if ([*(id *)(a1 + 32) firstIndex] <= a2 && objc_msgSend(*(id *)(a1 + 32), "lastIndex") >= a2)
  {
    double v6 = *(void **)(a1 + 32);
    return [v6 removeIndex:a2];
  }
  else
  {
    double v4 = *(void **)(a1 + 40);
    return [v4 _reapViewAtIndex:a2];
  }
}

void __63__MediaControlsCollectionViewController__populateViewsInFrame___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v4 = *(void **)(*(void *)(a1 + 32) + 976);
  double v5 = [NSNumber numberWithUnsignedInteger:a2];
  double v6 = [v4 objectForKey:v5];

  if (!v6) {
    id v7 = (id)[*(id *)(a1 + 32) _insertViewControllerForIndex:a2];
  }
}

- (void)_reloadDataIfNeeded
{
  if (self->_needsReloadData)
  {
    self->_needsReloadData = 0;
    [(MediaControlsCollectionViewController *)self reloadData];
  }
}

- (void)_scrollToSelectedItemAnimated:(BOOL)a3
{
  if (self->_selectedItemIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v3 = a3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke;
    aBlock[3] = &unk_1E5F0EE58;
    void aBlock[4] = self;
    double v5 = _Block_copy(aBlock);
    double v6 = v5;
    if (v3 && !self->_displayMode)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke_2;
      v13[3] = &unk_1E5F0F280;
      v13[4] = self;
      id v7 = _Block_copy(v13);
      id v8 = [(MediaControlsCollectionViewController *)self visibleViewControllers];
      double v9 = [v8 firstObject];
      id v12 = v6;
      double v10 = (void (*)(void))v7[2];
      double v11 = v7;
      v10();
    }
    else
    {
      (*((void (**)(void *, BOOL))v5 + 2))(v5, v3);
    }
  }
}

uint64_t __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  double v4 = (void *)v3[140];
  [v3 _frameForViewAtIndex:v3[142]];

  return objc_msgSend(v4, "scrollRectToVisible:animated:", a2);
}

void __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke_2(uint64_t a1, void *a2, int a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (a3) {
      double v9 = 0.0;
    }
    else {
      double v9 = 1.0;
    }
    double v10 = [v6 contentView];
    [v10 setAlpha:v9];

    double v11 = objc_opt_class();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke_3;
    v20[3] = &unk_1E5F0DBF8;
    id v12 = v6;
    id v21 = v12;
    double v22 = 1.0 - v9;
    double v13 = [v11 alphaAnimatorWithAnimations:v20];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    double v16 = __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke_4;
    double v17 = &unk_1E5F0F258;
    id v19 = v8;
    id v18 = v12;
    [v13 addCompletion:&v14];
    objc_msgSend(v13, "startAnimation", v14, v15, v16, v17);
  }
  else if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
  }
}

void __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contentView];
  [v2 setAlpha:*(double *)(a1 + 40)];
}

void __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = [*(id *)(a1 + 32) contentView];
  [v3 setAlpha:1.0];
}

void __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) viewControllerForSelectedItem];
  (*(void (**)(uint64_t, id, uint64_t, void))(v2 + 16))(v2, v3, 1, 0);
}

- (void)_setFrame:(CGRect)a3 forVisibleViewAtIndex:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  activeViewControllers = self->_activeViewControllers;
  double v10 = [NSNumber numberWithInteger:a4];
  id v13 = [(NSMutableDictionary *)activeViewControllers objectForKey:v10];

  double v11 = [v13 backgroundView];
  [(MediaControlsCollectionViewController *)self _backgroundCornerRadius];
  objc_msgSend(v11, "_setContinuousCornerRadius:");

  id v12 = [v13 view];
  objc_msgSend(v12, "setMediaControls_untransformedFrame:", x, y, width, height);
  [v12 layoutIfNeeded];
}

- (void)_tileViews
{
  BOOL shouldIgnoreScrollNotifications = self->_shouldIgnoreScrollNotifications;
  self->_BOOL shouldIgnoreScrollNotifications = 1;
  [(MediaControlsCollectionViewController *)self updateContentInsets];
  double v4 = [(MediaControlsCollectionViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v6, v8, v10, v12);
  [(MediaControlsCollectionViewController *)self _updateContentSize];
  if (!self->_displayMode) {
    [(MediaControlsCollectionViewController *)self _scrollToSelectedItemAnimated:0];
  }
  [(UIScrollView *)self->_scrollView bounds];
  -[MediaControlsCollectionViewController _populateViewsInFrame:](self, "_populateViewsInFrame:");
  self->_BOOL shouldIgnoreScrollNotifications = shouldIgnoreScrollNotifications;
}

- (double)_totalHeight
{
  [(MediaControlsCollectionViewController *)self _preferredSelectedItemHeight];
  double v4 = v3;
  if (self->_displayMode) {
    [(MediaControlsCollectionViewController *)self _regularItemHeight];
  }
  double v5 = v3;
  [(MediaControlsCollectionViewController *)self _verticalSpacing];
  return v4
       + (double)([(MediaControlsCollectionViewCountData *)self->_countData numberOfItems] - 1)
       * (v5 + v6);
}

- (void)updateContentInsets
{
  if (self->_displayMode == 1)
  {
    double v3 = [(MediaControlsCollectionViewController *)self view];
    [v3 bounds];
    double Height = CGRectGetHeight(v13);
    [(MediaControlsCollectionViewController *)self _preferredSelectedItemHeight];
    double v6 = (Height - v5) * 0.5;

    scrollView = self->_scrollView;
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = v6;
    double v11 = v6;
  }
  else
  {
    scrollView = self->_scrollView;
    double v10 = *MEMORY[0x1E4FB2848];
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }

  -[UIScrollView setContentInset:](scrollView, "setContentInset:", v10, v8, v11, v9);
}

- (void)_updateContentSize
{
  [(UIScrollView *)self->_scrollView frame];
  double Width = CGRectGetWidth(v9);
  [(MediaControlsCollectionViewController *)self _totalHeight];
  double v5 = v4;
  double v6 = Width - (self->_scrollViewInsets.left + self->_scrollViewInsets.right);
  scrollView = self->_scrollView;

  -[UIScrollView setContentSize:](scrollView, "setContentSize:", v6, v5);
}

- (void)_updateFramesForActiveViewControllersWithCoordinator:(id)a3 assumingSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __107__MediaControlsCollectionViewController__updateFramesForActiveViewControllersWithCoordinator_assumingSize___block_invoke;
  v9[3] = &unk_1E5F0F2D0;
  v9[4] = self;
  id v10 = v7;
  CGFloat v11 = width;
  CGFloat v12 = height;
  id v8 = v7;
  [(MediaControlsCollectionViewController *)self _enumerateActiveViewControllers:v9];
}

uint64_t __107__MediaControlsCollectionViewController__updateFramesForActiveViewControllersWithCoordinator_assumingSize___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFrameForViewController:atIndex:withCoordinator:assumingSize:", a3, a2, *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)_updateFrameForViewController:(id)a3 atIndex:(int64_t)a4 withCoordinator:(id)a5 assumingSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v11 = a5;
  id v12 = a3;
  -[MediaControlsCollectionViewController _frameForViewAtIndex:size:](self, "_frameForViewAtIndex:size:", a4, width, height);
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  double v18 = v17;
  double v20 = v19;
  objc_msgSend(v12, "willTransitionToSize:withCoordinator:", v11, v17, v19);

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __108__MediaControlsCollectionViewController__updateFrameForViewController_atIndex_withCoordinator_assumingSize___block_invoke;
  v21[3] = &unk_1E5F0F2F8;
  v21[4] = self;
  v21[5] = v14;
  v21[6] = v16;
  *(double *)&v21[7] = v18;
  *(double *)&v21[8] = v20;
  v21[9] = a4;
  [v11 animateAlongsideTransition:v21 completion:0];
}

uint64_t __108__MediaControlsCollectionViewController__updateFrameForViewController_atIndex_withCoordinator_assumingSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setFrame:forVisibleViewAtIndex:", *(void *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (double)_verticalSpacing
{
  return 14.0;
}

- (void)_adjustForEnvironmentChangeIfNeededWithSize:(CGSize)a3 transitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  if (self->_lastKnownEnvironmentSize.width != a3.width || self->_lastKnownEnvironmentSize.height != a3.height)
  {
    p_controlCenterEdgeInsets = &self->_controlCenterEdgeInsets;
    id v13 = a4;
    CCUIExpandedModuleEdgeInsets();
    p_controlCenterEdgeInsets->top = v9;
    p_controlCenterEdgeInsets->double left = v10;
    p_controlCenterEdgeInsets->bottom = v11;
    p_controlCenterEdgeInsets->right = v12;
    -[MediaControlsCollectionViewController _adjustForEnvironmentChangeWithSize:transitionCoordinator:](self, "_adjustForEnvironmentChangeWithSize:transitionCoordinator:", v13, width, height);
  }
}

- (void)_adjustForEnvironmentChangeWithSize:(CGSize)a3 transitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  double v8 = self->_lastKnownEnvironmentSize.width;
  double v9 = self->_lastKnownEnvironmentSize.height;
  self->_lastKnownEnvironmentSize.double width = width;
  self->_lastKnownEnvironmentSize.double height = height;
  int64_t displayMode = self->_displayMode;
  if (displayMode) {
    BOOL v11 = width > 200.0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    int64_t v12 = self->_displayMode;
  }
  else {
    int64_t v12 = 0;
  }
  if (width > 200.0 && displayMode != 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v12;
  }
  if (v13 == displayMode)
  {
    if (v8 != width || v9 != height)
    {
      uint64_t v15 = objc_alloc_init(MediaControlsStyleCoordinator);
      -[MediaControlsCollectionViewController _updateFramesForActiveViewControllersWithCoordinator:assumingSize:](self, "_updateFramesForActiveViewControllersWithCoordinator:assumingSize:", v15, width, height);
      if (v7)
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __99__MediaControlsCollectionViewController__adjustForEnvironmentChangeWithSize_transitionCoordinator___block_invoke;
        v19[3] = &unk_1E5F0F320;
        v19[4] = self;
        double v20 = v15;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __99__MediaControlsCollectionViewController__adjustForEnvironmentChangeWithSize_transitionCoordinator___block_invoke_2;
        v17[3] = &unk_1E5F0E4A8;
        double v18 = v20;
        [v7 animateAlongsideTransition:v19 completion:v17];
      }
      else
      {
        [(MediaControlsCollectionViewController *)self _tileViews];
        [(MediaControlsStyleCoordinator *)v15 performAnimations];
        [(MediaControlsStyleCoordinator *)v15 performCompletions];
      }
    }
  }
  else
  {
    -[MediaControlsCollectionViewController _transitionToDisplayMode:usingTransitionCoordinator:assumingSize:](self, "_transitionToDisplayMode:usingTransitionCoordinator:assumingSize:", v13, v7, width, height);
  }
  uint64_t v16 = [(MediaControlsCollectionViewController *)self scrollView];
  [v16 setScrollEnabled:self->_displayMode == 1];
}

uint64_t __99__MediaControlsCollectionViewController__adjustForEnvironmentChangeWithSize_transitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _tileViews];
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 performAnimations];
}

uint64_t __99__MediaControlsCollectionViewController__adjustForEnvironmentChangeWithSize_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performCompletions];
}

- (void)_transitionToDisplayMode:(int64_t)a3 usingTransitionCoordinator:(id)a4 assumingSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a4;
  CGFloat v10 = [(MediaControlsCollectionViewController *)self viewControllerForSelectedItem];
  [(MediaControlsCollectionViewController *)self setDisplayMode:a3];
  self->_shouldDisableAutoReaping = a3 == 0;
  BOOL v11 = objc_alloc_init(MediaControlsStyleCoordinator);
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t selectedItemIndex = self->_selectedItemIndex;
    id v13 = v9;
    -[MediaControlsCollectionViewController _updateFrameForViewController:atIndex:withCoordinator:assumingSize:](self, "_updateFrameForViewController:atIndex:withCoordinator:assumingSize:", v10, selectedItemIndex, v13, width, height);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke;
    v19[3] = &unk_1E5F0DBF8;
    v19[4] = self;
    void v19[5] = a3;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke_3;
    v18[3] = &unk_1E5F0DBF8;
    v18[4] = self;
    v18[5] = a3;
    [(MediaControlsStyleCoordinator *)v11 animateAlongsideTransition:v19 completion:v18];
    -[MediaControlsCollectionViewController _updateFramesForActiveViewControllersWithCoordinator:assumingSize:](self, "_updateFramesForActiveViewControllersWithCoordinator:assumingSize:", v11, width, height);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke_4;
    v16[3] = &unk_1E5F0E4A8;
    double v17 = v11;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke_5;
    v14[3] = &unk_1E5F0E4A8;
    uint64_t v15 = v17;
    [v13 animateAlongsideTransition:v16 completion:v14];
  }
  else
  {
    self->_shouldDisableAutoReaping = 0;
    [(MediaControlsCollectionViewController *)self _tileViews];
    [(MediaControlsCollectionViewController *)self _scrollToSelectedItemAnimated:0];
    [(_MediaControlsTapHoldGestureRecognizer *)self->_tapGestureRecognizer setEnabled:[(MediaControlsCollectionViewController *)self _wantsTapGestureRecognizer]];
    -[MediaControlsCollectionViewController _updateFramesForActiveViewControllersWithCoordinator:assumingSize:](self, "_updateFramesForActiveViewControllersWithCoordinator:assumingSize:", v11, width, height);
    [(MediaControlsStyleCoordinator *)v11 performAnimations];
    [(MediaControlsStyleCoordinator *)v11 performCompletions];
  }
}

uint64_t __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _tileViews];
  [*(id *)(a1 + 32) _scrollToSelectedItemAnimated:0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke_2;
  v4[3] = &unk_1E5F0F348;
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = v2;
  return [v5 _enumerateActiveViewControllers:v4];
}

void __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (*(void *)(*(void *)(a1 + 32) + 1136) != a2)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (!v7)
    {
      CGFloat v10 = v5;
      id v9 = [v5 view];
      [v9 setAlpha:0.0];
      goto LABEL_7;
    }
    if (v7 == 1)
    {
      CGFloat v10 = v5;
      BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
      uint64_t v6 = v10;
      if (!IsReduceMotionEnabled)
      {
        id v9 = [v10 view];
        [v9 setHidden:1];
LABEL_7:

        uint64_t v6 = v10;
      }
    }
  }
}

uint64_t __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1072) = 0;
  [*(id *)(a1 + 32) _tileViews];
  [*(id *)(a1 + 32) _scrollToSelectedItemAnimated:0];
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1144), "setEnabled:", objc_msgSend(*(id *)(a1 + 32), "_wantsTapGestureRecognizer"));
  if (*(void *)(a1 + 40) == 1)
  {
    uint64_t result = UIAccessibilityIsReduceMotionEnabled();
    if ((result & 1) == 0)
    {
      double v3 = *(void **)(a1 + 32);
      return [v3 _transitionTopAndBottomViewControllersToVisible:1 completion:0];
    }
  }
  return result;
}

uint64_t __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAnimations];
}

uint64_t __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) performCompletions];
}

- (void)_transitionToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    [(MediaControlsCollectionViewController *)self _scrollToSelectedItemAnimated:0];
    double v5 = 0.0;
    double v6 = 1.0;
  }
  else
  {
    double v5 = 1.0;
    double v6 = 0.0;
  }
  uint64_t v7 = [(MediaControlsCollectionViewController *)self viewControllerForSelectedItem];
  memset(&v38, 0, sizeof(v38));
  if (v3)
  {
    CGAffineTransformMakeScale(&v38, 1.92, 1.92);
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v37.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v37.c = v8;
    *(_OWORD *)&v37.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    long long v9 = *MEMORY[0x1E4F1DAB8];
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v38.c = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v38.tdouble x = v10;
    *(_OWORD *)&v38.a = v9;
    memset(&v37, 0, sizeof(v37));
    CGAffineTransformMakeScale(&v37, 1.92, 1.92);
  }
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke;
    v36[3] = &__block_descriptor_40_e76_v32__0q8__UIViewController_MediaControlsCollectionItemViewController__16_B24l;
    *(double *)&v36[4] = v5;
    [(MediaControlsCollectionViewController *)self _enumerateActiveViewControllers:v36];
    BOOL v11 = objc_opt_class();
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_2;
    v35[3] = &unk_1E5F0DBF8;
    v35[4] = self;
    *(double *)&v35[5] = v6;
    int64_t v12 = [v11 alphaAnimatorWithAnimations:v35];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_4;
    v34[3] = &unk_1E5F0E388;
    v34[4] = self;
    [v12 addCompletion:v34];
    [v12 startAnimation];
  }
  else
  {
    ++self->_appearanceTransitionCount;
    id v13 = [v7 view];
    [v13 setHidden:0];

    uint64_t v14 = [v7 view];
    [v14 setAlpha:v5];

    if (!UIAccessibilityIsReduceMotionEnabled())
    {
      uint64_t v15 = [v7 view];
      CGAffineTransform v33 = v38;
      [v15 setTransform:&v33];
    }
    double v16 = 0.1;
    if (v3)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_6;
      v32[3] = &unk_1E5F0F3B0;
      v32[4] = self;
      [(MediaControlsCollectionViewController *)self _enumerateActiveViewControllers:v32];
      double v16 = 0.0;
    }
    double v17 = [(id)objc_opt_class() frameAnimator];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_7;
    v29[3] = &unk_1E5F0F168;
    id v18 = v7;
    id v30 = v18;
    CGAffineTransform v31 = v37;
    [v17 addAnimations:v29];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_8;
    v25[3] = &unk_1E5F0F3D8;
    id v19 = v18;
    BOOL v28 = v3;
    id v26 = v19;
    uint64_t v27 = self;
    [v17 addCompletion:v25];
    double v20 = objc_opt_class();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_11;
    v22[3] = &unk_1E5F0DBF8;
    id v23 = v19;
    double v24 = v6;
    id v21 = [v20 alphaAnimatorWithAnimations:v22];
    [v17 startAnimationAfterDelay:v16];
    [v21 startAnimationAfterDelay:v16 + 0.1];
    if (!v3) {
      [(MediaControlsCollectionViewController *)self _transitionTopAndBottomViewControllersToVisible:0 completion:0];
    }
  }
}

void __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 view];
  [v4 setAlpha:*(double *)(a1 + 32)];
}

uint64_t __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_3;
  v3[3] = &__block_descriptor_40_e76_v32__0q8__UIViewController_MediaControlsCollectionItemViewController__16_B24l;
  v3[4] = *(void *)(a1 + 40);
  return [v1 _enumerateActiveViewControllers:v3];
}

void __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 view];
  [v4 setAlpha:*(double *)(a1 + 32)];
}

uint64_t __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateActiveViewControllers:&__block_literal_global_29];
}

void __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 view];
  [v3 setAlpha:1.0];
}

void __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void *)(*(void *)(a1 + 32) + 1136) != a2)
  {
    id v3 = [a3 view];
    [v3 setHidden:1];
  }
}

void __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  long long v3 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v3;
  v4[2] = *(_OWORD *)(a1 + 72);
  [v2 setTransform:v4];
}

uint64_t __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v7[0] = *MEMORY[0x1E4F1DAB8];
  v7[1] = v3;
  v7[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v7];

  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_9;
    v6[3] = &unk_1E5F0D7F8;
    v6[4] = v4;
    [v4 _transitionTopAndBottomViewControllersToVisible:1 completion:v6];
  }
  --*(void *)(*(void *)(a1 + 40) + 1064);
  return [*(id *)(a1 + 40) _dequeueAndPerformBatchUpdatesIfNeeded];
}

uint64_t __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_9(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_10;
  v3[3] = &unk_1E5F0F3B0;
  v3[4] = v1;
  return [v1 _enumerateActiveViewControllers:v3];
}

void __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void *)(*(void *)(a1 + 32) + 1136) != a2)
  {
    id v3 = [a3 view];
    [v3 setHidden:0];
  }
}

void __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_11(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:*(double *)(a1 + 40)];
}

- (void)_transitionTopAndBottomViewControllersToVisible:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  ++self->_appearanceTransitionCount;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke;
  aBlock[3] = &unk_1E5F0E428;
  void aBlock[4] = self;
  id v7 = v6;
  id v129 = v7;
  id v75 = (void (**)(void))_Block_copy(aBlock);
  long long v8 = [(MediaControlsCollectionViewController *)self viewControllerForSelectedItem];
  if (v8 && !UIAccessibilityIsReduceMotionEnabled())
  {
    id v20 = [MEMORY[0x1E4F1CA48] array];
    id v23 = [MEMORY[0x1E4F1CA48] array];
    double v24 = [(MediaControlsCollectionViewController *)self _visibleTopViewControllers];
    CGRect v25 = [(MediaControlsCollectionViewController *)self _visibleBottomViewControllers];
    id v26 = [v8 view];
    uint64_t v27 = v26;
    v74 = v25;
    if (v4)
    {
      v79 = v23;
      id v80 = v20;
      id v73 = v7;
      [v26 setHidden:0];

      v72 = v8;
      BOOL v28 = [v8 view];
      [v28 setAlpha:1.0];

      long long v29 = [v24 allKeys];
      v124[0] = MEMORY[0x1E4F143A8];
      v124[1] = 3221225472;
      v124[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_2;
      v124[3] = &unk_1E5F0F400;
      id v30 = v24;
      id v125 = v30;
      int64_t v126 = self;
      uint64_t v127 = 0x4056000000000000;
      [v29 enumerateObjectsUsingBlock:v124];

      CGAffineTransform v31 = [v25 allKeys];
      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_3;
      v120[3] = &unk_1E5F0F400;
      id v78 = v25;
      id v121 = v78;
      v122 = self;
      uint64_t v123 = 0x4056000000000000;
      [v31 enumerateObjectsUsingBlock:v120];

      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      id v32 = [v30 allKeys];
      CGAffineTransform v33 = objc_msgSend(v32, "sortedArrayUsingSelector:");
      v34 = [v33 reverseObjectEnumerator];

      id obj = v34;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v116 objects:v132 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v117;
        double v38 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v117 != v37) {
              objc_enumerationMutation(obj);
            }
            uint64_t v40 = *(void *)(*((void *)&v116 + 1) + 8 * i);
            long long v41 = [v30 objectForKey:v40];
            long long v42 = [(id)objc_opt_class() frameAnimator];
            v112[0] = MEMORY[0x1E4F143A8];
            v112[1] = 3221225472;
            v112[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_4;
            v112[3] = &unk_1E5F0DC48;
            id v43 = v41;
            id v113 = v43;
            v114 = self;
            uint64_t v115 = v40;
            [v42 addAnimations:v112];
            double v44 = objc_opt_class();
            v110[0] = MEMORY[0x1E4F143A8];
            v110[1] = 3221225472;
            v110[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_5;
            v110[3] = &unk_1E5F0D7F8;
            id v111 = v43;
            id v45 = v43;
            CGRect v46 = [v44 alphaAnimatorWithAnimations:v110];
            [v42 startAnimationAfterDelay:v38];
            double v38 = v38 + 0.1;
            [v46 startAnimationAfterDelay:v38];
            [v80 addObject:v42];
            [v23 addObject:v46];
          }
          uint64_t v36 = [obj countByEnumeratingWithState:&v116 objects:v132 count:16];
        }
        while (v36);
      }

      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      v47 = [v78 allKeys];
      int64_t v48 = [v47 sortedArrayUsingSelector:sel_compare_];

      id obja = v48;
      uint64_t v49 = [v48 countByEnumeratingWithState:&v106 objects:v131 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v107;
        double v52 = 0.0;
        do
        {
          for (uint64_t j = 0; j != v50; ++j)
          {
            if (*(void *)v107 != v51) {
              objc_enumerationMutation(obja);
            }
            uint64_t v54 = *(void *)(*((void *)&v106 + 1) + 8 * j);
            long long v55 = [v78 objectForKey:v54];
            long long v56 = [(id)objc_opt_class() frameAnimator];
            v102[0] = MEMORY[0x1E4F143A8];
            v102[1] = 3221225472;
            v102[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_6;
            v102[3] = &unk_1E5F0DC48;
            id v57 = v55;
            id v103 = v57;
            v104 = self;
            uint64_t v105 = v54;
            [v56 addAnimations:v102];
            v58 = objc_opt_class();
            v100[0] = MEMORY[0x1E4F143A8];
            v100[1] = 3221225472;
            v100[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_7;
            v100[3] = &unk_1E5F0D7F8;
            id v101 = v57;
            id v59 = v57;
            v60 = [v58 alphaAnimatorWithAnimations:v100];
            [v56 startAnimationAfterDelay:v52];
            double v52 = v52 + 0.1;
            [v60 startAnimationAfterDelay:v52];
            [v80 addObject:v56];
            [v79 addObject:v60];
          }
          uint64_t v50 = [obja countByEnumeratingWithState:&v106 objects:v131 count:16];
        }
        while (v50);
      }

      v61 = v125;
      long long v8 = v72;
      id v7 = v73;
      double v22 = v75;
      id v23 = v79;
      id v20 = v80;
    }
    else
    {
      [v26 frame];
      double MinY = CGRectGetMinY(v134);
      [(UIScrollView *)self->_scrollView bounds];
      double v63 = MinY - CGRectGetMinY(v135);

      [(UIScrollView *)self->_scrollView bounds];
      double MaxY = CGRectGetMaxY(v136);
      id v65 = [v8 view];
      [v65 frame];
      double v66 = MaxY - CGRectGetMaxY(v137);

      v61 = [(id)objc_opt_class() frameAnimator];
      v95[0] = MEMORY[0x1E4F143A8];
      v95[1] = 3221225472;
      v95[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_8;
      v95[3] = &unk_1E5F0F450;
      id v67 = v24;
      id v96 = v67;
      double v98 = v63;
      id v68 = v25;
      id v97 = v68;
      double v99 = v66;
      [v61 addAnimations:v95];
      v69 = objc_opt_class();
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_11;
      v92[3] = &unk_1E5F0D8E8;
      id v93 = v67;
      id v94 = v68;
      id v70 = [v69 alphaAnimatorWithAnimations:v92];
      [v61 startAnimationAfterDelay:0.0];
      [v70 startAnimationAfterDelay:0.1];

      double v22 = v75;
    }

    if ([v23 count])
    {
      v71 = [v23 lastObject];
      v90[0] = MEMORY[0x1E4F143A8];
      v90[1] = 3221225472;
      v90[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_14;
      v90[3] = &unk_1E5F0DDB0;
      id v91 = v22;
      [v71 addCompletion:v90];
    }
    else
    {
      v22[2](v22);
    }
  }
  else
  {
    long long v9 = v8;
    long long v10 = [(MediaControlsCollectionViewController *)self visibleViewControllers];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v86 objects:v130 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v87;
      if (v4) {
        double v14 = 0.0;
      }
      else {
        double v14 = 1.0;
      }
      do
      {
        for (uint64_t k = 0; k != v12; ++k)
        {
          if (*(void *)v87 != v13) {
            objc_enumerationMutation(v10);
          }
          double v16 = *(void **)(*((void *)&v86 + 1) + 8 * k);
          double v17 = [v16 view];
          [v17 setHidden:0];

          id v18 = [v16 view];
          [v18 setAlpha:v14];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v86 objects:v130 count:16];
      }
      while (v12);
    }
    id v19 = objc_opt_class();
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_15;
    v83[3] = &unk_1E5F0D8C0;
    int64_t v84 = v10;
    BOOL v85 = v4;
    id v20 = v10;
    id v21 = [v19 alphaAnimatorWithAnimations:v83];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_16;
    v81[3] = &unk_1E5F0DDB0;
    double v22 = v75;
    id v82 = v75;
    [v21 addCompletion:v81];
    [v21 startAnimation];

    id v23 = v84;
    long long v8 = v9;
  }
}

uint64_t __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 1064);
  [*(id *)(a1 + 32) _removeInactiveViewControllersFromHierarchy];
  [*(id *)(a1 + 32) _dequeueAndPerformBatchUpdatesIfNeeded];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id v20 = [*(id *)(a1 + 32) objectForKey:a2];
  double v5 = [v20 view];
  [v5 frame];
  double v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  double v13 = v12;

  [*(id *)(*(void *)(a1 + 40) + 1120) bounds];
  double MinY = CGRectGetMinY(v22);
  v23.origin.double x = v7;
  v23.origin.double y = v9;
  v23.size.double width = v11;
  v23.size.double height = v13;
  double v15 = MinY - CGRectGetHeight(v23);
  v24.origin.double x = v7;
  v24.origin.double y = v9;
  v24.size.double width = v11;
  v24.size.double height = v13;
  double v16 = v15 - (double)a3 * (CGRectGetHeight(v24) - *(double *)(a1 + 48));
  double v17 = [v20 view];
  objc_msgSend(v17, "setMediaControls_untransformedFrame:", v7, v16, v11, v13);

  id v18 = [v20 view];
  [v18 setAlpha:0.0];

  id v19 = [v20 view];
  [v19 setHidden:0];
}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id v19 = [*(id *)(a1 + 32) objectForKey:a2];
  double v5 = [v19 view];
  [v5 frame];
  double v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  double v13 = v12;

  [*(id *)(*(void *)(a1 + 40) + 1120) bounds];
  double MaxY = CGRectGetMaxY(v21);
  v22.origin.double x = v7;
  v22.origin.double y = v9;
  v22.size.double width = v11;
  v22.size.double height = v13;
  double v15 = MaxY + (double)a3 * (CGRectGetHeight(v22) - *(double *)(a1 + 48));
  double v16 = [v19 view];
  objc_msgSend(v16, "setMediaControls_untransformedFrame:", v7, v15, v11, v13);

  double v17 = [v19 view];
  [v17 setAlpha:0.0];

  id v18 = [v19 view];
  [v18 setHidden:0];
}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_4(id *a1)
{
  id v2 = [a1[4] view];
  objc_msgSend(a1[5], "_frameForViewAtIndex:", objc_msgSend(a1[6], "integerValue"));
  objc_msgSend(v2, "setMediaControls_untransformedFrame:");
}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_6(id *a1)
{
  id v2 = [a1[4] view];
  objc_msgSend(a1[5], "_frameForViewAtIndex:", objc_msgSend(a1[6], "integerValue"));
  objc_msgSend(v2, "setMediaControls_untransformedFrame:");
}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_7(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) allKeys];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_9;
  _OWORD v7[3] = &unk_1E5F0F428;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  [v2 enumerateObjectsUsingBlock:v7];

  id v3 = [*(id *)(a1 + 40) allKeys];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_10;
  _OWORD v4[3] = &unk_1E5F0F428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  [v3 enumerateObjectsUsingBlock:v4];
}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_9(uint64_t a1, uint64_t a2)
{
  id v10 = [*(id *)(a1 + 32) objectForKey:a2];
  id v3 = [v10 view];
  [v3 center];
  double v5 = v4;
  double v7 = v6;

  double v8 = v7 - *(double *)(a1 + 40);
  uint64_t v9 = [v10 view];
  objc_msgSend(v9, "setCenter:", v5, v8);
}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_10(uint64_t a1, uint64_t a2)
{
  id v10 = [*(id *)(a1 + 32) objectForKey:a2];
  id v3 = [v10 view];
  [v3 center];
  double v5 = v4;
  double v7 = v6;

  double v8 = v7 + *(double *)(a1 + 40);
  uint64_t v9 = [v10 view];
  objc_msgSend(v9, "setCenter:", v5, v8);
}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_11(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) allValues];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_39_0];

  id v3 = [*(id *)(a1 + 40) allValues];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_41];
}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = [a2 view];
  [v2 setAlpha:0.0];
}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = [a2 view];
  [v2 setAlpha:0.0];
}

uint64_t __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_15(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "view", (void)v10);
        double v8 = v7;
        if (*(unsigned char *)(a1 + 40)) {
          double v9 = 1.0;
        }
        else {
          double v9 = 0.0;
        }
        [v7 setAlpha:v9];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

uint64_t __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_insertViewControllerForIndex:(int64_t)a3
{
  uint64_t v5 = [(MediaControlsCollectionViewController *)self dataSource];
  double v6 = [v5 mediaControlsCollectionViewController:self viewControllerForItemAtIndex:a3];

  [v6 setSelected:self->_selectedItemIndex == a3];
  activeViewControllers = self->_activeViewControllers;
  double v8 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)activeViewControllers setObject:v6 forKey:v8];

  double v9 = [v6 backgroundView];

  if (!v9)
  {
    long long v10 = [MediaControlsMaterialView alloc];
    long long v11 = -[MediaControlsMaterialView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v6 setBackgroundView:v11];
  }
  [(MediaControlsCollectionViewController *)self _frameForViewAtIndex:a3];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  double v17 = v16;
  double v19 = v18;
  id v20 = objc_alloc_init(MediaControlsStyleCoordinator);
  objc_msgSend(v6, "willTransitionToSize:withCoordinator:", v20, v17, v19);
  CGRect v21 = [v6 view];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __71__MediaControlsCollectionViewController__insertViewControllerForIndex___block_invoke;
  _OWORD v27[3] = &unk_1E5F0F2F8;
  v27[4] = self;
  v27[5] = v13;
  v27[6] = v15;
  *(double *)&v27[7] = v17;
  *(double *)&v27[8] = v19;
  v27[9] = a3;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v27];
  [(MediaControlsStyleCoordinator *)v20 performAnimations];
  [(MediaControlsStyleCoordinator *)v20 performCompletions];
  CGRect v22 = [(MediaControlsCollectionViewController *)self delegate];
  [v22 mediaControlsCollectionViewController:self willDisplayViewController:v6 forItemAtIndex:a3];
  CGRect v23 = [v6 parentViewController];

  if (v23 == self)
  {
    [(MediaControlsCollectionViewController *)self _beginAppearanceTransitionIfNeeded:1 forChildViewController:v6 animated:0];
    [(MediaControlsCollectionViewController *)self _endAppearanceTransitionForChildViewControllerIfNeeded:v6];
  }
  else
  {
    [(MediaControlsCollectionViewController *)self addChildViewController:v6];
    [(MediaControlsCollectionViewController *)self _beginAppearanceTransitionIfNeeded:1 forChildViewController:v6 animated:0];
    CGRect v24 = [v21 superview];
    scrollView = self->_scrollView;

    if (v24 != scrollView) {
      [(UIScrollView *)self->_scrollView addSubview:v21];
    }
    [(MediaControlsCollectionViewController *)self _endAppearanceTransitionForChildViewControllerIfNeeded:v6];
    [v6 didMoveToParentViewController:self];
  }
  [v21 setHidden:0];
  [v21 setAlpha:1.0];
  [v22 mediaControlsCollectionViewController:self didDisplayViewController:v6 forItemAtIndex:a3];

  return v6;
}

uint64_t __71__MediaControlsCollectionViewController__insertViewControllerForIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setFrame:forVisibleViewAtIndex:", *(void *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_reapViewAtIndex:(int64_t)a3
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = -[NSMutableDictionary objectForKey:](self->_activeViewControllers, "objectForKey:");
  if (v5)
  {
    [(MediaControlsCollectionViewController *)self _beginAppearanceTransitionIfNeeded:0 forChildViewController:v5 animated:0];
    double v6 = [v5 view];
    [v6 setHidden:1];

    [(MediaControlsCollectionViewController *)self _endAppearanceTransitionForChildViewControllerIfNeeded:v5];
    [(NSMutableDictionary *)self->_activeViewControllers removeObjectForKey:v8];
    if (self->_selectedItemIndex == a3) {
      objc_storeStrong((id *)&self->_inactiveSelectedViewController, v5);
    }
    else {
      [(NSMutableSet *)self->_inactiveViewControllers addObject:v5];
    }
    double v7 = [(MediaControlsCollectionViewController *)self delegate];
    [v7 mediaControlsCollectionViewController:self didEndDisplayingViewController:v5 forItemAtIndex:a3];
  }
}

- (void)_reapActiveViews
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__MediaControlsCollectionViewController__reapActiveViews__block_invoke;
  v2[3] = &unk_1E5F0F3B0;
  v2[4] = self;
  [(MediaControlsCollectionViewController *)self _enumerateActiveViewControllers:v2];
}

uint64_t __57__MediaControlsCollectionViewController__reapActiveViews__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _reapViewAtIndex:a2];
}

- (void)_removeInactiveViewControllersFromHierarchy
{
  inactiveViewControllers = self->_inactiveViewControllers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__MediaControlsCollectionViewController__removeInactiveViewControllersFromHierarchy__block_invoke;
  _OWORD v4[3] = &unk_1E5F0F498;
  void v4[4] = self;
  [(NSMutableSet *)inactiveViewControllers enumerateObjectsUsingBlock:v4];
  if (self->_inactiveSelectedViewController) {
    -[MediaControlsCollectionViewController _removeViewController:](self, "_removeViewController:");
  }
}

uint64_t __84__MediaControlsCollectionViewController__removeInactiveViewControllersFromHierarchy__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _removeViewController:a2];
}

- (void)_removeViewController:(id)a3
{
  id v5 = a3;
  [v5 willMoveToParentViewController:0];
  if ([v5 isViewLoaded])
  {
    [(MediaControlsCollectionViewController *)self _beginAppearanceTransitionIfNeeded:0 forChildViewController:v5 animated:0];
    uint64_t v4 = [v5 view];
    [v4 removeFromSuperview];

    [(MediaControlsCollectionViewController *)self _endAppearanceTransitionForChildViewControllerIfNeeded:v5];
  }
  [v5 removeFromParentViewController];
}

- (void)_setHighlighted:(BOOL)a3 forViewControllerAtIndex:(int64_t)a4
{
  BOOL v5 = a3;
  if (self->_highlightedItemIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v7 = -[MediaControlsCollectionViewController viewControllerForItemAtIndex:](self, "viewControllerForItemAtIndex:");
    [(MediaControlsCollectionViewController *)self _setHighlighted:0 forViewController:v7];
  }
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(MediaControlsCollectionViewController *)self viewControllerForItemAtIndex:a4];
    [(MediaControlsCollectionViewController *)self _setHighlighted:v5 forViewController:v8];
  }
  int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5) {
    int64_t v9 = a4;
  }
  self->_highlightedItemIndedouble x = v9;
}

- (void)_setHighlighted:(BOOL)a3 forViewController:(id)a4
{
  BOOL v4 = a3;
  id v5 = [a4 backgroundView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setHighlighted:v4];
  }
}

- (void)_beginAppearanceTransitionIfNeeded:(BOOL)a3 forChildViewController:(id)a4 animated:(BOOL)a5
{
  if (self->_appeared) {
    [a4 beginAppearanceTransition:a3 animated:a5];
  }
}

- (void)_endAppearanceTransitionForChildViewControllerIfNeeded:(id)a3
{
  if (self->_appeared) {
    [a3 endAppearanceTransition];
  }
}

- (void)_beginAppearanceTransitionForChildViewControllers:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v6 = [(MediaControlsCollectionViewController *)self visibleViewControllers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) beginAppearanceTransition:v5 animated:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_endAppearanceTransitionForChildViewControllers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(MediaControlsCollectionViewController *)self visibleViewControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) endAppearanceTransition];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  if (!self->_shouldIgnoreScrollNotifications)
  {
    [(UIScrollView *)self->_scrollView bounds];
    -[MediaControlsCollectionViewController _populateViewsInFrame:](self, "_populateViewsInFrame:");
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_tapGestureRecognizer != a3) {
    return 1;
  }
  [a4 locationInView:self->_scrollView];
  int64_t v6 = -[MediaControlsCollectionViewController itemAtPoint:](self, "itemAtPoint:");
  return v6 == 0x7FFFFFFFFFFFFFFFLL || v6 != self->_selectedItemIndex;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  if (self->_tapGestureRecognizer != a3) {
    return 0;
  }
  scrollView = self->_scrollView;
  id v6 = a4;
  long long v7 = [(UIScrollView *)scrollView gestureRecognizers];
  char v8 = [v7 containsObject:v6];

  return v8;
}

- (void)_handleScrollViewTap:(id)a3
{
  id v13 = a3;
  [v13 locationInView:self->_scrollView];
  double v5 = v4;
  int64_t v6 = -[MediaControlsCollectionViewController itemAtPoint:](self, "itemAtPoint:");
  [(UIScrollView *)self->_scrollView bounds];
  double v8 = v7;
  BOOL v9 = v6 < 0 || v6 >= [(MediaControlsCollectionViewCountData *)self->_countData numberOfItems];
  if (v5 < self->_scrollViewInsets.left) {
    goto LABEL_8;
  }
  if (v5 > v8 - self->_scrollViewInsets.right) {
    BOOL v9 = 1;
  }
  if (v9) {
LABEL_8:
  }
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  BOOL v10 = [v13 state] == 1 || objc_msgSend(v13, "state") == 2;
  [(MediaControlsCollectionViewController *)self _setHighlighted:v10 forViewControllerAtIndex:v6];
  if ([v13 state] == 3)
  {
    [(MediaControlsCollectionViewController *)self _setHighlighted:0 forViewControllerAtIndex:v6];
    long long v11 = [(MediaControlsCollectionViewController *)self delegate];
    if ([v11 mediaControlsCollectionViewController:self canSelectItemAtIndex:v6])
    {
      int64_t appearanceTransitionCount = self->_appearanceTransitionCount;

      if (!appearanceTransitionCount) {
        [(MediaControlsCollectionViewController *)self _setSelectedItemIndex:v6 animated:1 shouldScroll:1 shouldNotifyDelegate:1 withReason:0];
      }
    }
    else
    {
    }
  }
}

- (void)_setSelectedItemIndex:(int64_t)a3 animated:(BOOL)a4 shouldScroll:(BOOL)a5 shouldNotifyDelegate:(BOOL)a6 withReason:(int64_t)a7
{
  if (!self->_isPerformingBatchUpdates && self->_selectedItemIndex != a3)
  {
    BOOL v10 = a6;
    BOOL v12 = a4;
    id v13 = [(MediaControlsCollectionViewController *)self visibleIndexes];
    double v52 = [(MediaControlsCollectionViewController *)self viewControllerForItemAtIndex:self->_selectedItemIndex];
    if (([v13 containsIndex:a3] & 1) != 0
      || ([v13 containsIndex:self->_selectedItemIndex] & 1) != 0)
    {
      int64_t displayMode = self->_displayMode;
      BOOL v15 = displayMode == 1;
    }
    else
    {
      BOOL v15 = 0;
      int64_t displayMode = self->_displayMode;
    }
    BOOL v51 = displayMode == 0;
    [v52 setSelected:0];
    self->_int64_t selectedItemIndex = a3;
    uint64_t v16 = [(MediaControlsCollectionViewController *)self delegate];
    double v17 = v16;
    if (v10) {
      [v16 mediaControlsCollectionViewController:self willSelectItemAtIndex:a3 withReason:a7];
    }
    if (!v15)
    {
      if (a5 || !displayMode) {
        [(MediaControlsCollectionViewController *)self _scrollToSelectedItemAnimated:1];
      }
      if (v10) {
        [v17 mediaControlsCollectionViewController:self didSelectItemAtIndex:a3 withReason:a7];
      }
      goto LABEL_25;
    }
    uint64_t v49 = v17;
    uint64_t v50 = v13;
    double v18 = [(MediaControlsCollectionViewController *)self viewControllerForSelectedItem];
    int v19 = [v18 isSelected];
    int64_t v48 = v18;
    [v18 setSelected:1];
    [(UIScrollView *)self->_scrollView bounds];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    [(MediaControlsCollectionViewController *)self _preferredSelectedItemHeight];
    CGFloat v29 = -v28;
    v76.origin.double x = v21;
    v76.origin.double y = v23;
    v76.size.double width = v25;
    v76.size.double height = v27;
    CGRect v77 = CGRectInset(v76, 0.0, v29);
    -[MediaControlsCollectionViewController _populateViewsInFrame:](self, "_populateViewsInFrame:", v77.origin.x, v77.origin.y, v77.size.width, v77.size.height);
    id v30 = [(MediaControlsCollectionViewController *)self view];
    [v30 bounds];
    double v32 = v31;
    double v34 = v33;

    if (v19)
    {
      double v17 = v49;
      if (a5 || !displayMode) {
        [(MediaControlsCollectionViewController *)self _scrollToSelectedItemAnimated:1];
      }
      uint64_t v35 = objc_alloc_init(MediaControlsStyleCoordinator);
      -[MediaControlsCollectionViewController _updateFramesForActiveViewControllersWithCoordinator:assumingSize:](self, "_updateFramesForActiveViewControllersWithCoordinator:assumingSize:", v35, v32, v34);
      [(MediaControlsStyleCoordinator *)v35 performAnimations];
      [(MediaControlsStyleCoordinator *)v35 performCompletions];
      if (!v10) {
        goto LABEL_16;
      }
    }
    else
    {
      if (v12)
      {
        uint64_t v36 = objc_alloc_init(MediaControlsStyleCoordinator);
        uint64_t v37 = objc_alloc_init(MediaControlsStyleCoordinator);
        double v38 = [(id)objc_opt_class() frameAnimator];
        long long v39 = [(id)objc_opt_class() frameAnimator];
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke;
        v68[3] = &unk_1E5F0F4C0;
        double v73 = v32;
        double v74 = v34;
        int64_t v75 = a3;
        v68[4] = self;
        id v69 = v39;
        uint64_t v40 = v37;
        id v70 = v40;
        id v71 = v38;
        long long v41 = v36;
        v72 = v41;
        id v42 = v38;
        id v43 = v39;
        [(MediaControlsCollectionViewController *)self _enumerateActiveViewControllers:v68];
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_3;
        v66[3] = &unk_1E5F0D7F8;
        double v44 = v41;
        id v67 = v44;
        [v42 addAnimations:v66];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_4;
        v61[3] = &unk_1E5F0F4E8;
        id v45 = v40;
        BOOL v64 = a5;
        BOOL v65 = v51;
        v62 = v45;
        double v63 = self;
        [v43 addAnimations:v61];
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_5;
        v59[3] = &unk_1E5F0E388;
        v60 = v44;
        CGRect v46 = v44;
        [v42 addCompletion:v59];
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_6;
        v53[3] = &unk_1E5F0F510;
        v53[4] = self;
        BOOL v58 = v10;
        double v17 = v49;
        int64_t v56 = a3;
        int64_t v57 = a7;
        id v54 = v49;
        long long v55 = v45;
        v47 = v45;
        [v43 addCompletion:v53];
        ++self->_animatedSelectionCount;
        self->_isAnimatingSelection = 1;
        self->_shouldDisableAutoReaping = 1;
        [v42 startAnimation];
        [v43 startAnimationAfterDelay:0.1];

        goto LABEL_24;
      }
      if (a5 || !displayMode) {
        [(MediaControlsCollectionViewController *)self _scrollToSelectedItemAnimated:0];
      }
      uint64_t v35 = objc_alloc_init(MediaControlsStyleCoordinator);
      -[MediaControlsCollectionViewController _updateFramesForActiveViewControllersWithCoordinator:assumingSize:](self, "_updateFramesForActiveViewControllersWithCoordinator:assumingSize:", v35, v32, v34);
      [(MediaControlsStyleCoordinator *)v35 performAnimations];
      [(MediaControlsStyleCoordinator *)v35 performCompletions];
      [(UIScrollView *)self->_scrollView bounds];
      -[MediaControlsCollectionViewController _populateViewsInFrame:](self, "_populateViewsInFrame:");
      double v17 = v49;
      if (!v10)
      {
LABEL_16:

LABEL_24:
        id v13 = v50;

LABEL_25:
        return;
      }
    }
    [v17 mediaControlsCollectionViewController:self didSelectItemAtIndex:a3 withReason:a7];
    goto LABEL_16;
  }
}

void __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v5 = *(void **)(a1 + 32);
  double v6 = *(double *)(a1 + 72);
  double v7 = *(double *)(a1 + 80);
  id v8 = a3;
  objc_msgSend(v5, "_frameForViewAtIndex:size:", a2, v6, v7);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if (*(void *)(a1 + 88) == a2)
  {
    id v17 = *(id *)(a1 + 40);
    double v18 = (id *)(a1 + 48);
  }
  else
  {
    id v17 = *(id *)(a1 + 56);
    double v18 = (id *)(a1 + 64);
  }
  id v19 = *v18;
  objc_msgSend(v8, "willTransitionToSize:withCoordinator:", v19, v14, v16);

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_2;
  v20[3] = &unk_1E5F0F2F8;
  void v20[4] = *(void *)(a1 + 32);
  v20[5] = v10;
  v20[6] = v12;
  *(double *)&v20[7] = v14;
  *(double *)&v20[8] = v16;
  v20[9] = a2;
  [v17 addAnimations:v20];
}

uint64_t __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setFrame:forVisibleViewAtIndex:", *(void *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAnimations];
}

uint64_t __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) performAnimations];
  if (*(unsigned char *)(a1 + 48) || *(unsigned char *)(a1 + 49))
  {
    uint64_t v3 = *(void **)(a1 + 40);
    return [v3 _scrollToSelectedItemAnimated:0];
  }
  return result;
}

uint64_t __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) performCompletions];
}

uint64_t __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_6(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 1056);
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 1056))
  {
    *(unsigned char *)(v2 + 1074) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 1072) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 1120) bounds];
  objc_msgSend((id)v2, "_populateViewsInFrame:");
  if (*(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 40) mediaControlsCollectionViewController:*(void *)(a1 + 32) didSelectItemAtIndex:*(void *)(a1 + 56) withReason:*(void *)(a1 + 64)];
  }
  [*(id *)(a1 + 48) performCompletions];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 _dequeueAndPerformBatchUpdatesIfNeeded];
}

- (BOOL)_wantsTapGestureRecognizer
{
  return self->_displayMode == 1;
}

- (void)_enumerateActiveViewControllers:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[(NSMutableDictionary *)self->_activeViewControllers copy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__MediaControlsCollectionViewController__enumerateActiveViewControllers___block_invoke;
  _OWORD v7[3] = &unk_1E5F0F538;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __73__MediaControlsCollectionViewController__enumerateActiveViewControllers___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v6 + 16))(v6, [a2 integerValue], v7, a4);
}

- (id)_visibleTopViewControllers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_activeViewControllers mutableCopy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_activeViewControllers;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "integerValue", (void)v11) >= self->_selectedItemIndex) {
          [v3 removeObjectForKey:v9];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_visibleBottomViewControllers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_activeViewControllers mutableCopy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_activeViewControllers;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "integerValue", (void)v11) <= self->_selectedItemIndex) {
          [v3 removeObjectForKey:v9];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)_isScrollViewAnimatingScroll
{
  if ([(UIScrollView *)self->_scrollView isDecelerating]) {
    return 1;
  }
  scrollView = self->_scrollView;

  return [(UIScrollView *)scrollView isDragging];
}

- (double)_backgroundCornerRadius
{
  CCUIExpandedModuleContinuousCornerRadius();
  if (!self->_displayMode) {
    return 20.0;
  }
  return result;
}

+ (id)frameAnimator
{
  if (frameAnimator_onceToken != -1) {
    dispatch_once(&frameAnimator_onceToken, &__block_literal_global_47);
  }
  id v2 = objc_alloc(MEMORY[0x1E4F318A0]);
  uint64_t v3 = (void *)[v2 initWithDuration:frameAnimator_timing timingParameters:1.0];

  return v3;
}

void __54__MediaControlsCollectionViewController_frameAnimator__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F318A8]), "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 38.0, 0.0, 0.0);
  id v1 = (void *)frameAnimator_timing;
  frameAnimator_timing = v0;

  id v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1698]), "initWithControlPoint1:controlPoint2:", 0.187800005, 0.00230000005, 0.539900005, 0.962899983);
  [(id)frameAnimator_timing setSpringCubicTimingParameters:v2];
}

+ (id)alphaAnimatorWithAnimations:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4FB1ED8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend([v3 alloc], "initWithDuration:controlPoint1:controlPoint2:animations:", v4, 0.4, 0.25, 0.1, 0.25, 1.0);

  return v5;
}

- (MediaControlsCollectionViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (MediaControlsCollectionViewDataSource *)WeakRetained;
}

- (MediaControlsCollectionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MediaControlsCollectionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIEdgeInsets)scrollViewInsets
{
  double top = self->_scrollViewInsets.top;
  double left = self->_scrollViewInsets.left;
  double bottom = self->_scrollViewInsets.bottom;
  double right = self->_scrollViewInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setScrollView:(id)a3
{
}

- (id)dismissalBlock
{
  return self->_dismissalBlock;
}

- (void)setDismissalBlock:(id)a3
{
}

- (int64_t)selectedItemIndex
{
  return self->_selectedItemIndex;
}

- (_MediaControlsTapHoldGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (double)preferredItemHeight
{
  return self->_preferredItemHeight;
}

- (void)setPreferredItemHeight:(double)a3
{
  self->_preferredItemdouble Height = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong(&self->_dismissalBlock, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_countData, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_inactiveViewControllers, 0);
  objc_storeStrong((id *)&self->_inactiveSelectedViewController, 0);

  objc_storeStrong((id *)&self->_activeViewControllers, 0);
}

@end