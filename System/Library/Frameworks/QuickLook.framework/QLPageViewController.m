@interface QLPageViewController
- (QLPageViewController)init;
- (QLPageViewController)initWithCoder:(id)a3;
- (QLPageViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5;
- (QLPageViewControllerDataSource)indexedDataSource;
- (UIScrollView)scrollView;
- (UIScrollViewDelegate)scrollViewDelegate;
- (UIViewController)currentPage;
- (double)parallaxIntensity;
- (id)_cachedViewControllerAtIndex:(unint64_t)a3 offset:(int64_t)a4;
- (id)_retrieveAndStoreViewControllerAtIndex:(unint64_t)a3 offset:(unint64_t)a4;
- (id)_viewControllerAtIndex:(unint64_t)a3 offset:(int64_t)a4;
- (id)delegate;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (unint64_t)_indexOfViewController:(id)a3;
- (unint64_t)currentPageIndex;
- (void)_applyParallaxEffectWithTransitionProgress:(double)a3;
- (void)_loadAndCacheViewControllersBeforeAndAfterIndex:(int64_t)a3;
- (void)_rearrangeCachedViewControllersWithNewCurrentPageIndex:(int64_t)a3;
- (void)_setCurrentPageIndex:(unint64_t)a3 direction:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_setUp;
- (void)_setViewControllers:(id)a3 direction:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_unsetParallaxEffect;
- (void)clearInternalCache;
- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6;
- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setCurrentPageIndex:(unint64_t)a3;
- (void)setCurrentPageIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIndexedDataSource:(id)a3;
- (void)setParallaxIntensity:(double)a3;
- (void)setScrollViewDelegate:(id)a3;
- (void)setViewControllers:(id)a3 direction:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation QLPageViewController

- (QLPageViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)QLPageViewController;
  v2 = [(QLPageViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(QLPageViewController *)v2 _setUp];
  }
  return v3;
}

- (QLPageViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5
{
  uint64_t v8 = *MEMORY[0x263F838E0];
  id v9 = a5;
  v10 = [v9 objectForKeyedSubscript:v8];
  [v10 floatValue];
  self->_interPageSpacing = v11;

  v14.receiver = self;
  v14.super_class = (Class)QLPageViewController;
  v12 = [(QLPageViewController *)&v14 initWithTransitionStyle:a3 navigationOrientation:a4 options:v9];

  [(QLPageViewController *)v12 _setUp];
  return v12;
}

- (void)setCurrentPageIndex:(unint64_t)a3
{
}

- (void)setCurrentPageIndex:(unint64_t)a3 animated:(BOOL)a4
{
  if (!self->_isTransitioning)
  {
    BOOL v4 = a4;
    v7 = [(QLPageViewController *)self scrollView];
    [v7 setUserInteractionEnabled:0];

    BOOL v8 = [(QLPageViewController *)self currentPageIndex] >= a3;
    unint64_t v9 = [(QLPageViewController *)self currentPageIndex];
    pages = self->_pages;
    float v11 = [NSNumber numberWithInteger:v9];
    v12 = [(NSMapTable *)pages objectForKey:v11];

    v13 = self->_pages;
    objc_super v14 = [NSNumber numberWithInteger:a3];
    v15 = [(NSMapTable *)v13 objectForKey:v14];
    v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [(QLPageViewController *)self _viewControllerAtIndex:a3 offset:0];
    }
    v18 = v17;

    if (!v12) {
      unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v9 != a3)
    {
      v19 = [(QLPageViewController *)self delegate];
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        v21 = [(QLPageViewController *)self delegate];
        [v21 pageViewController:self willTransitionFromPage:v12 withIndex:v9 toPage:v18 withIndex:a3 animated:v4];
      }
    }
    self->_isTransitioning = 1;
    objc_initWeak(&location, self);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __53__QLPageViewController_setCurrentPageIndex_animated___block_invoke;
    v24[3] = &unk_2642F6458;
    objc_copyWeak(v27, &location);
    v27[1] = (id)v9;
    v27[2] = (id)a3;
    v24[4] = self;
    id v22 = v12;
    id v25 = v22;
    id v23 = v18;
    id v26 = v23;
    BOOL v28 = v4;
    [(QLPageViewController *)self _setCurrentPageIndex:a3 direction:v8 animated:v4 completion:v24];

    objc_destroyWeak(v27);
    objc_destroyWeak(&location);
  }
}

void __53__QLPageViewController_setCurrentPageIndex_animated___block_invoke(uint64_t a1, int a2)
{
  BOOL v4 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _unsetParallaxEffect];

  id v6 = objc_loadWeakRetained(v4);
  v7 = [v6 scrollView];
  [v7 setUserInteractionEnabled:1];

  if (a2)
  {
    if (*(void *)(a1 + 64) != *(void *)(a1 + 72))
    {
      BOOL v8 = [*(id *)(a1 + 32) delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v12 = objc_loadWeakRetained(v4);
        v10 = [v12 delegate];
        id v11 = objc_loadWeakRetained(v4);
        [v10 pageViewController:v11 didTransitionFromPage:*(void *)(a1 + 40) withIndex:*(void *)(a1 + 64) toPage:*(void *)(a1 + 48) withIndex:*(void *)(a1 + 72) animated:*(unsigned __int8 *)(a1 + 80)];
      }
    }
  }
}

- (UIViewController)currentPage
{
  v2 = [(QLPageViewController *)self viewControllers];
  v3 = [v2 firstObject];

  return (UIViewController *)v3;
}

- (void)clearInternalCache
{
  self->_currentPageIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_currentPageIndexForAppliedParallaxEffect = 0x7FFFFFFFFFFFFFFFLL;
  [(NSMapTable *)self->_pages removeAllObjects];
}

- (UIScrollView)scrollView
{
  v2 = [(QLPageViewController *)self view];
  v3 = [v2 subviews];
  BOOL v4 = [v3 firstObject];

  return (UIScrollView *)v4;
}

- (void)setDelegate:(id)a3
{
  p_definedDelegate = &self->_definedDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_definedDelegate, v5);
  [(QLDelegateProxy *)self->_pageViewControllerDelegateProxy setSecondDelegate:v5];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_definedDelegate);

  return WeakRetained;
}

- (void)setScrollViewDelegate:(id)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLPageViewController;
  [(QLPageViewController *)&v4 viewWillAppear:a3];
  [(QLPageViewController *)self _unsetParallaxEffect];
}

- (void)_setUp
{
  self->_currentPageIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_currentPageIndexForAppliedParallaxEffect = 0x7FFFFFFFFFFFFFFFLL;
  v3 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  pages = self->_pages;
  self->_pages = v3;

  id v5 = [QLDelegateProxy alloc];
  scrollViewDelegateProxy = self->_scrollViewDelegateProxy;
  self->_scrollViewDelegateProxy = v5;

  [(QLDelegateProxy *)self->_scrollViewDelegateProxy setFirstDelegate:self];
  v7 = [(QLPageViewController *)self view];
  BOOL v8 = [v7 subviews];
  char v9 = [v8 firstObject];
  scrollView = self->_scrollView;
  self->_scrollView = v9;

  [(UIScrollView *)self->_scrollView setDelegate:self->_scrollViewDelegateProxy];
  [(UIScrollView *)self->_scrollView _setAutoScrollEnabled:0];
  id v11 = [QLDelegateProxy alloc];
  pageViewControllerDelegateProxy = self->_pageViewControllerDelegateProxy;
  self->_pageViewControllerDelegateProxy = v11;

  [(QLDelegateProxy *)self->_pageViewControllerDelegateProxy setFirstDelegate:self];
  v13 = self->_pageViewControllerDelegateProxy;
  v14.receiver = self;
  v14.super_class = (Class)QLPageViewController;
  [(QLPageViewController *)&v14 setDelegate:v13];
  [(QLPageViewController *)self setDataSource:self];
}

- (void)_loadAndCacheViewControllersBeforeAndAfterIndex:(int64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(QLPageViewController *)self _viewControllerAtIndex:a3 offset:-1];
  id v6 = [(QLPageViewController *)self _viewControllerAtIndex:a3 offset:1];
}

- (void)_rearrangeCachedViewControllersWithNewCurrentPageIndex:(int64_t)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = [(NSMapTable *)self->_pages keyEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v12 = [v11 longValue];
        unint64_t v13 = v12 - a3;
        if (v12 - a3 < 0) {
          unint64_t v13 = a3 - v12;
        }
        if (v13 >= 2) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[NSMapTable removeObjectForKey:](self->_pages, "removeObjectForKey:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (unint64_t)_indexOfViewController:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_pages;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_pages, "objectForKey:", v10, (void)v14);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          unint64_t v12 = [v10 unsignedIntegerValue];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v12;
}

- (id)_cachedViewControllerAtIndex:(unint64_t)a3 offset:(int64_t)a4
{
  if ((a4 & 0x8000000000000000) == 0 || (id v4 = 0, -a4 <= a3))
  {
    pages = self->_pages;
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:a4 + a3];
    id v4 = [(NSMapTable *)pages objectForKey:v6];
  }

  return v4;
}

- (id)_viewControllerAtIndex:(unint64_t)a3 offset:(int64_t)a4
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ((a4 & 0x8000000000000000) == 0 || (uint64_t v7 = 0, -a4 <= a3))
  {
    pages = self->_pages;
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a4 + a3];
    v10 = [(NSMapTable *)pages objectForKey:v9];

    if (!v10) {
      id v11 = [(QLPageViewController *)self _retrieveAndStoreViewControllerAtIndex:a3 offset:a4];
    }
    unint64_t v12 = self->_pages;
    unint64_t v13 = [NSNumber numberWithUnsignedInteger:a4 + a3];
    uint64_t v7 = [(NSMapTable *)v12 objectForKey:v13];
  }

  return v7;
}

- (id)_retrieveAndStoreViewControllerAtIndex:(unint64_t)a3 offset:(unint64_t)a4
{
  uint64_t v7 = [(QLPageViewController *)self indexedDataSource];
  unint64_t v8 = a4 + a3;
  uint64_t v9 = [v7 pageViewController:self viewControllerAtIndex:v8];

  if (v9)
  {
    pages = self->_pages;
    id v11 = [NSNumber numberWithUnsignedInteger:v8];
    [(NSMapTable *)pages setObject:v9 forKey:v11];
  }

  return v9;
}

- (void)_setCurrentPageIndex:(unint64_t)a3 direction:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  v23[1] = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = [(QLPageViewController *)self _viewControllerAtIndex:a3 offset:0];
  if (v11)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__QLPageViewController__setCurrentPageIndex_direction_animated_completion___block_invoke;
    aBlock[3] = &unk_2642F6480;
    objc_copyWeak(v21, &location);
    aBlock[4] = self;
    v21[1] = (id)a3;
    unint64_t v12 = _Block_copy(aBlock);
    unint64_t v13 = v12;
    if (!v6) {
      (*((void (**)(void *))v12 + 2))(v12);
    }
    v23[0] = v11;
    long long v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __75__QLPageViewController__setCurrentPageIndex_direction_animated_completion___block_invoke_2;
    v16[3] = &unk_2642F64A8;
    BOOL v19 = v6;
    id v15 = v13;
    id v17 = v15;
    id v18 = v10;
    [(QLPageViewController *)self _setViewControllers:v14 direction:a4 animated:v6 completion:v16];

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
}

uint64_t __75__QLPageViewController__setCurrentPageIndex_direction_animated_completion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained willChangeValueForKey:@"currentPageIndex"];

  *(void *)(*(void *)(a1 + 32) + 1360) = *(void *)(a1 + 48);
  id v4 = objc_loadWeakRetained(v2);
  [v4 didChangeValueForKey:@"currentPageIndex"];

  uint64_t result = [*(id *)(a1 + 32) _rearrangeCachedViewControllersWithNewCurrentPageIndex:*(void *)(*(void *)(a1 + 32) + 1360)];
  *(unsigned char *)(*(void *)(a1 + 32) + 1355) = 0;
  return result;
}

uint64_t __75__QLPageViewController__setCurrentPageIndex_direction_animated_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_setViewControllers:(id)a3 direction:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = (void (**)(id, void))a6;
  unint64_t v12 = [v10 firstObject];
  unint64_t v13 = [(QLPageViewController *)self currentPage];

  if (v12 == v13)
  {
    if (v11) {
      v11[2](v11, 0);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)QLPageViewController;
    [(QLPageViewController *)&v14 setViewControllers:v10 direction:a4 animated:v7 completion:v11];
  }
}

- (void)setParallaxIntensity:(double)a3
{
  self->_parallaxIntensity = a3;
}

- (void)_applyParallaxEffectWithTransitionProgress:(double)a3
{
  if (self->_parallaxIntensity != 0.0)
  {
    id v5 = [(QLPageViewController *)self view];
    [v5 frame];
    double v6 = CGRectGetWidth(v26) * self->_parallaxIntensity;

    double v7 = fmin(v6, 100.0);
    [(QLPageViewController *)self _unsetParallaxEffect];
    unint64_t currentPageIndex = self->_currentPageIndex;
    self->_currentPageIndexForAppliedParallaxEffect = currentPageIndex;
    uint64_t v9 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v10 = [v9 userInterfaceLayoutDirection];

    uint64_t v11 = 0;
    double v12 = v7 - v7 * a3;
    double v13 = -(a3 * v7);
    double v14 = -(v7 * (a3 + 1.0));
    int v15 = 2;
    do
    {
      long long v16 = [(QLPageViewController *)self _cachedViewControllerAtIndex:currentPageIndex offset:v11 - 1];
      if (v16)
      {
        id v17 = [(QLPageViewController *)self delegate];
        char v18 = objc_opt_respondsToSelector();

        if (v18)
        {
          BOOL v19 = [(QLPageViewController *)self delegate];
          long long v20 = [v19 pageViewController:self parallaxViewInPage:v16 withIndex:currentPageIndex + v11 - 1];

          long long v21 = [v16 view];
          self->_pageClipsToBounds[v11] = [v21 clipsToBounds];

          long long v22 = [v16 view];
          [v22 setClipsToBounds:1];

          [v20 bounds];
          if (v10 == 1) {
            int v24 = v15;
          }
          else {
            int v24 = v11;
          }
          if (v24 == 2)
          {
            double v25 = v12;
          }
          else
          {
            double v25 = v13;
            if (v24 != 1)
            {
              double v25 = v23;
              if (!v24) {
                double v25 = v14;
              }
            }
          }
          [v20 setBounds:v25];
        }
      }

      ++v11;
      --v15;
    }
    while (v11 != 3);
  }
}

- (void)_unsetParallaxEffect
{
  for (uint64_t i = 0; i != 3; ++i)
  {
    id v4 = [(QLPageViewController *)self _cachedViewControllerAtIndex:self->_currentPageIndexForAppliedParallaxEffect offset:i - 1];
    if (v4)
    {
      id v5 = [(QLPageViewController *)self delegate];
      double v6 = [v5 pageViewController:self parallaxViewInPage:v4 withIndex:i + self->_currentPageIndexForAppliedParallaxEffect - 1];

      [v6 bounds];
      objc_msgSend(v6, "setBounds:", 0.0, 0.0);
      BOOL v7 = self->_pageClipsToBounds[i];
      unint64_t v8 = [v4 view];
      [v8 setClipsToBounds:v7];
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  p_scrollingStartOffset = &self->_scrollingStartOffset;
  [a3 contentOffset];
  p_scrollingStartOffset->x = v5;
  p_scrollingStartOffset->y = v6;
  [(QLPageViewController *)self _loadAndCacheViewControllersBeforeAndAfterIndex:self->_currentPageIndex];
  if (!self->_isTransitioning)
  {
    self->_isTransitioning = 1;
    self->_currentPageIndexForAppliedParallaxEffect = self->_currentPageIndex;
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = [(QLPageViewController *)self view];
  [v4 frame];
  CGFloat v5 = CGRectGetWidth(v19) + self->_interPageSpacing;

  CGFloat v6 = [(QLPageViewController *)self scrollView];
  [v6 contentOffset];
  double v8 = v7 - v5;

  double v9 = v8 / v5;
  if (v8 / v5 > 1.0) {
    double v9 = 1.0;
  }
  if (self->_isTransitioning)
  {
    double v10 = fmax(v9, -1.0);
    int64_t currentPageIndexForAppliedParallaxEffect = self->_currentPageIndexForAppliedParallaxEffect;
    if (v8 >= 0.0) {
      int64_t v12 = currentPageIndexForAppliedParallaxEffect + 1;
    }
    else {
      int64_t v12 = currentPageIndexForAppliedParallaxEffect - 1;
    }
    id v17 = [(QLPageViewController *)self _cachedViewControllerAtIndex:v12 offset:0];
    id v13 = [(QLPageViewController *)self _cachedViewControllerAtIndex:[(QLPageViewController *)self currentPageIndex] offset:0];
    if (v17 != v13)
    {
      double v14 = [(QLPageViewController *)self delegate];
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        long long v16 = [(QLPageViewController *)self delegate];
        objc_msgSend(v16, "pageViewController:isTransitioningFromPage:withIndex:toPage:withIndex:withProgress:", self, v13, -[QLPageViewController currentPageIndex](self, "currentPageIndex"), v17, v12, fabs(v10));
      }
    }
    [(QLPageViewController *)self _applyParallaxEffectWithTransitionProgress:v10];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  self->_isTransitioning = 0;
  if (self->_didTryScrollingBeforeFirstPage)
  {
    self->_didTryScrollingBeforeFirstPage = 0;
    [(QLPageViewController *)self pageViewController:self didFinishAnimating:1 previousViewControllers:MEMORY[0x263EFFA68] transitionCompleted:0];
  }

  [(QLPageViewController *)self _unsetParallaxEffect];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v25 = a3;
  double x = a5->x;
  double v8 = &OBJC_IVAR___QLPageViewController__nextPageIndex;
  if (a5->x == self->_scrollingStartOffset.x) {
    double v8 = &OBJC_IVAR___QLPageViewController__currentPageIndex;
  }
  uint64_t v9 = *(uint64_t *)((char *)&self->super.super.super.super.isa + *v8);
  unint64_t currentPageIndex = self->_currentPageIndex;
  if (!currentPageIndex && !self->_nextPageIndex) {
    self->_didTryScrollingBeforeFirstPage = 1;
  }
  uint64_t v11 = [(QLPageViewController *)self delegate];
  if (v9 == currentPageIndex)
  {
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0) {
      goto LABEL_12;
    }
    id v13 = [(QLPageViewController *)self delegate];
    pages = self->_pages;
    char v15 = [NSNumber numberWithUnsignedInteger:self->_currentPageIndex];
    long long v16 = [(NSMapTable *)pages objectForKey:v15];
    unint64_t v17 = self->_currentPageIndex;
    char v18 = self->_pages;
    CGRect v19 = [NSNumber numberWithUnsignedInteger:self->_nextPageIndex];
    long long v20 = [(NSMapTable *)v18 objectForKey:v19];
    [v13 pageViewController:self willCancelTransitionFromPage:v16 withIndex:v17 toPage:v20 withIndex:self->_nextPageIndex animated:1];
  }
  else
  {
    char v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) == 0) {
      goto LABEL_12;
    }
    id v13 = [(QLPageViewController *)self delegate];
    long long v22 = self->_pages;
    char v15 = [NSNumber numberWithUnsignedInteger:self->_currentPageIndex];
    long long v16 = [(NSMapTable *)v22 objectForKey:v15];
    unint64_t v23 = self->_currentPageIndex;
    int v24 = self->_pages;
    CGRect v19 = [NSNumber numberWithUnsignedInteger:v9];
    long long v20 = [(NSMapTable *)v24 objectForKey:v19];
    [v13 pageViewController:self willTransitionFromPage:v16 withIndex:v23 toPage:v20 withIndex:v9 animated:1];
  }

LABEL_12:
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  unint64_t v5 = [(QLPageViewController *)self _indexOfViewController:a4];
  unint64_t v6 = v5;
  double v7 = 0;
  if (v5 && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v7 = [(QLPageViewController *)self _viewControllerAtIndex:v5 offset:-1];
  }
  id v8 = v7;
  if (v6 && v6 != 0x7FFFFFFFFFFFFFFFLL) {

  }
  return v8;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  unint64_t v5 = [(QLPageViewController *)self _indexOfViewController:a4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v6 = [(QLPageViewController *)self _viewControllerAtIndex:v5 offset:1];
  }

  return v6;
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  BOOL v6 = a6;
  id v27 = a3;
  id v10 = a5;
  unint64_t currentPageIndex = self->_currentPageIndex;
  if (v6)
  {
    [(QLPageViewController *)self willChangeValueForKey:@"currentPageIndex"];
    char v12 = [(QLPageViewController *)self viewControllers];
    id v13 = [v12 firstObject];
    self->_unint64_t currentPageIndex = [(QLPageViewController *)self _indexOfViewController:v13];

    [(QLPageViewController *)self didChangeValueForKey:@"currentPageIndex"];
    [(QLPageViewController *)self _rearrangeCachedViewControllersWithNewCurrentPageIndex:self->_currentPageIndex];
    if (a4)
    {
      double v14 = [(QLPageViewController *)self delegate];
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        long long v16 = [(QLPageViewController *)self delegate];
        pages = self->_pages;
        char v18 = [NSNumber numberWithInteger:currentPageIndex];
        CGRect v19 = [(NSMapTable *)pages objectForKey:v18];
        long long v20 = self->_pages;
        char v21 = [NSNumber numberWithUnsignedInteger:self->_currentPageIndex];
        long long v22 = [(NSMapTable *)v20 objectForKey:v21];
        [v16 pageViewController:self didTransitionFromPage:v19 withIndex:currentPageIndex toPage:v22 withIndex:self->_currentPageIndex animated:1];
LABEL_8:
      }
    }
  }
  else
  {
    [(QLPageViewController *)self _rearrangeCachedViewControllersWithNewCurrentPageIndex:self->_currentPageIndex];
    if (a4)
    {
      unint64_t v23 = [(QLPageViewController *)self delegate];
      char v24 = objc_opt_respondsToSelector();

      if (v24)
      {
        long long v16 = [(QLPageViewController *)self delegate];
        id v25 = self->_pages;
        char v18 = [NSNumber numberWithInteger:currentPageIndex];
        CGRect v19 = [(NSMapTable *)v25 objectForKey:v18];
        CGRect v26 = self->_pages;
        char v21 = [NSNumber numberWithUnsignedInteger:self->_nextPageIndex];
        long long v22 = [(NSMapTable *)v26 objectForKey:v21];
        [v16 pageViewController:self didCancelTransitionFromPage:v19 withIndex:currentPageIndex toPage:v22 withIndex:self->_nextPageIndex animated:1];
        goto LABEL_8;
      }
    }
  }
  self->_nextPageIndedouble x = self->_currentPageIndex;
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  objc_msgSend(a4, "firstObject", a3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  self->_nextPageIndedouble x = -[QLPageViewController _indexOfViewController:](self, "_indexOfViewController:");
  unint64_t v5 = [(QLPageViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(QLPageViewController *)self delegate];
    pages = self->_pages;
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:self->_currentPageIndex];
    id v10 = [(NSMapTable *)pages objectForKey:v9];
    [v7 pageViewController:self willBeginInteractiveTransitionFromPage:v10 withIndex:self->_currentPageIndex toPage:v11 withIndex:self->_nextPageIndex];
  }
}

- (QLPageViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLPageViewController;
  return [(QLPageViewController *)&v4 initWithCoder:a3];
}

- (void)setViewControllers:(id)a3 direction:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  char v6 = NSString;
  double v7 = NSStringFromSelector(a2);
  objc_msgSend(v6, "stringWithFormat:", @"%@ not supported on QLPageViewController. Use setCurrentPageIndex:; and provide a data source instead.",
    v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDataSource:(id)a3
{
  if (a3 == self)
  {
    uint64_t v6 = v3;
    uint64_t v7 = v4;
    v5.receiver = a3;
    v5.super_class = (Class)QLPageViewController;
    -[QLPageViewController setDataSource:](&v5, sel_setDataSource_);
  }
}

- (unint64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (QLPageViewControllerDataSource)indexedDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indexedDataSource);

  return (QLPageViewControllerDataSource *)WeakRetained;
}

- (void)setIndexedDataSource:(id)a3
{
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegate);

  return (UIScrollViewDelegate *)WeakRetained;
}

- (double)parallaxIntensity
{
  return self->_parallaxIntensity;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_destroyWeak((id *)&self->_indexedDataSource);
  objc_storeStrong((id *)&self->_pageViewControllerDelegateProxy, 0);
  objc_storeStrong((id *)&self->_scrollViewDelegateProxy, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_destroyWeak((id *)&self->_definedDelegate);

  objc_storeStrong((id *)&self->_pages, 0);
}

@end