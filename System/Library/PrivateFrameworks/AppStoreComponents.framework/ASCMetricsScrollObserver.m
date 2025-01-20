@interface ASCMetricsScrollObserver
+ (id)observerForScrollView:(id)a3;
- (ASCMetricsScrollObserver)initWithScrollView:(id)a3;
- (BOOL)hasModelAppeared:(id)a3;
- (BOOL)hasModelRendered:(id)a3;
- (BOOL)isDelegateAdded:(id)a3;
- (CGPoint)centerOfView:(id)a3;
- (CGRect)visibleRect;
- (CGSize)contentSize;
- (NSHashTable)delegates;
- (NSMutableSet)appearedModelIDs;
- (NSMutableSet)renderedModelIDs;
- (UIScrollView)scrollView;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)modelDidAppear:(id)a3;
- (void)modelDidDisappear:(id)a3;
- (void)modelDidRender:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation ASCMetricsScrollObserver

+ (id)observerForScrollView:(id)a3
{
  id v3 = a3;
  v4 = objc_getAssociatedObject(v3, "ASCMetricsScrollObserver");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v6 = [[ASCMetricsScrollObserver alloc] initWithScrollView:v3];
    objc_setAssociatedObject(v3, "ASCMetricsScrollObserver", v6, (void *)1);
  }

  return v6;
}

- (ASCMetricsScrollObserver)initWithScrollView:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASCMetricsScrollObserver;
  v5 = [(ASCMetricsScrollObserver *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scrollView, v4);
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v6->_delegates;
    v6->_delegates = (NSHashTable *)v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    appearedModelIDs = v6->_appearedModelIDs;
    v6->_appearedModelIDs = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    renderedModelIDs = v6->_renderedModelIDs;
    v6->_renderedModelIDs = v11;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_scrollView);
    [WeakRetained _addScrollViewScrollObserver:v6];
  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  [WeakRetained _removeScrollViewScrollObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASCMetricsScrollObserver;
  [(ASCMetricsScrollObserver *)&v4 dealloc];
}

- (CGSize)contentSize
{
  v2 = [(ASCMetricsScrollObserver *)self scrollView];
  [v2 contentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGRect)visibleRect
{
  v2 = [(ASCMetricsScrollObserver *)self scrollView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGPoint)centerOfView:(id)a3
{
  id v4 = a3;
  [v4 frame];
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  double v9 = floor(CGRectGetWidth(v19) * 0.5);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v10 = floor(CGRectGetHeight(v20) * 0.5);
  double v11 = [(ASCMetricsScrollObserver *)self scrollView];
  objc_msgSend(v11, "convertPoint:fromView:", v4, v9, v10);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.CGFloat y = v17;
  result.CGFloat x = v16;
  return result;
}

- (BOOL)isDelegateAdded:(id)a3
{
  id v4 = a3;
  double v5 = [(ASCMetricsScrollObserver *)self delegates];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCMetricsScrollObserver *)self delegates];
  [v5 addObject:v4];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCMetricsScrollObserver *)self delegates];
  [v5 removeObject:v4];
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(ASCMetricsScrollObserver *)self delegates];
  char v6 = (void *)[v5 copy];

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
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) scrollViewDidScroll:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)modelDidAppear:(id)a3
{
  id v4 = a3;
  id v6 = [(ASCMetricsScrollObserver *)self appearedModelIDs];
  id v5 = [v4 id];

  [v6 addObject:v5];
}

- (void)modelDidDisappear:(id)a3
{
  id v4 = a3;
  id v6 = [(ASCMetricsScrollObserver *)self appearedModelIDs];
  id v5 = [v4 id];

  [v6 removeObject:v5];
}

- (BOOL)hasModelAppeared:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCMetricsScrollObserver *)self appearedModelIDs];
  id v6 = [v4 id];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (void)modelDidRender:(id)a3
{
  id v4 = a3;
  id v6 = [(ASCMetricsScrollObserver *)self renderedModelIDs];
  id v5 = [v4 id];

  [v6 addObject:v5];
}

- (BOOL)hasModelRendered:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCMetricsScrollObserver *)self renderedModelIDs];
  id v6 = [v4 id];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4 = [(ASCMetricsScrollObserver *)self scrollView];
  [(ASCMetricsScrollObserver *)self scrollViewDidScroll:v4];
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  return (UIScrollView *)WeakRetained;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (NSMutableSet)appearedModelIDs
{
  return self->_appearedModelIDs;
}

- (NSMutableSet)renderedModelIDs
{
  return self->_renderedModelIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedModelIDs, 0);
  objc_storeStrong((id *)&self->_appearedModelIDs, 0);
  objc_storeStrong((id *)&self->_delegates, 0);

  objc_destroyWeak((id *)&self->_scrollView);
}

@end