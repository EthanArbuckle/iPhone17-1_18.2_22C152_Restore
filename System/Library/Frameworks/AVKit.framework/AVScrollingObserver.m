@interface AVScrollingObserver
- (AVScrollingObserver)initWithView:(id)a3;
- (BOOL)isScrolling;
- (BOOL)isScrollingQuickly;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)_updateScrollingStatus;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)removeDelegate:(id)a3;
- (void)setScrolling:(BOOL)a3;
- (void)setScrollingQuickly:(BOOL)a3;
- (void)update;
@end

@implementation AVScrollingObserver

- (void)addDelegate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      v7 = "-[AVScrollingObserver addDelegate:]";
      _os_log_error_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_ERROR, "*** %s must be called on main thread. ***", (uint8_t *)&v6, 0xCu);
    }
  }
  [(NSHashTable *)self->_delegates addObject:v4];
}

- (AVScrollingObserver)initWithView:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVScrollingObserver;
  v5 = [(AVScrollingObserver *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observedScrollViews = v5->_observedScrollViews;
    v5->_observedScrollViews = (NSHashTable *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v5->_delegates;
    v5->_delegates = (NSHashTable *)v8;

    objc_storeWeak((id *)&v5->_view, v4);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollingDidEndTimer, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_observedScrollViews, 0);

  objc_destroyWeak((id *)&self->_view);
}

- (void)setScrollingQuickly:(BOOL)a3
{
  self->_scrollingQuickly = a3;
}

- (BOOL)isScrollingQuickly
{
  return self->_scrollingQuickly;
}

- (void)setScrolling:(BOOL)a3
{
  self->_scrolling = a3;
}

- (BOOL)isScrolling
{
  return self->_scrolling;
}

- (void)_updateScrollingStatus
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[AVScrollingObserver _updateScrollingStatus]";
      _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "*** %s must be called on main thread. ***", buf, 0xCu);
    }
  }
  [(NSTimer *)self->_scrollingDidEndTimer invalidate];
  BOOL v4 = [(AVScrollingObserver *)self isScrolling];
  BOOL v5 = [(AVScrollingObserver *)self isScrollingQuickly];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  uint64_t v7 = objc_msgSend(WeakRetained, "avkit_isBeingScrolled");

  id v8 = objc_loadWeakRetained((id *)&self->_view);
  uint64_t v9 = objc_msgSend(v8, "avkit_isBeingScrolledQuickly");

  [(AVScrollingObserver *)self setScrolling:v7];
  [(AVScrollingObserver *)self setScrollingQuickly:v9];
  if (v4 != [(AVScrollingObserver *)self isScrolling]
    || v5 != [(AVScrollingObserver *)self isScrollingQuickly])
  {
    v10 = (void *)[(NSHashTable *)self->_delegates copy];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "scrollingObserverDidChangeScrollingState:", self, (void)v16);
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [(NSTimer *)self->_scrollingDidEndTimer invalidate];
  scrollingDidEndTimer = self->_scrollingDidEndTimer;
  self->_scrollingDidEndTimer = 0;

  if ([(AVScrollingObserver *)self isScrolling])
  {
    objc_initWeak(&location, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    if (objc_msgSend(WeakRetained, "avkit_isBeingScrollTested")) {
      double v7 = 0.1;
    }
    else {
      double v7 = 0.0333333333;
    }

    id v8 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __51__AVScrollingObserver__observeScrollViewDidScroll___block_invoke;
    uint64_t v14 = &unk_1E5FC4480;
    objc_copyWeak(&v15, &location);
    uint64_t v9 = [v8 scheduledTimerWithTimeInterval:0 repeats:&v11 block:v7];
    v10 = self->_scrollingDidEndTimer;
    self->_scrollingDidEndTimer = v9;

    -[NSTimer setTolerance:](self->_scrollingDidEndTimer, "setTolerance:", v7 * 0.5, v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    [(AVScrollingObserver *)self _updateScrollingStatus];
  }
}

void __51__AVScrollingObserver__observeScrollViewDidScroll___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateScrollingStatus];
    if ((id)v4[4] == v5)
    {
      v4[4] = 0;
    }
  }
}

- (void)removeDelegate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      double v7 = "-[AVScrollingObserver removeDelegate:]";
      _os_log_error_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_ERROR, "*** %s must be called on main thread. ***", (uint8_t *)&v6, 0xCu);
    }
  }
  [(NSHashTable *)self->_delegates removeObject:v4];
}

- (void)update
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v5 = [WeakRetained superview];

  if (v5)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        [(NSHashTable *)v3 addObject:v6];
        if (([v6 _isScrollViewScrollObserver:self] & 1) == 0) {
          [v6 _addScrollViewScrollObserver:self];
        }
      }
      uint64_t v7 = [v5 superview];

      id v5 = (void *)v7;
    }
    while (v7);
  }
  uint64_t v8 = (void *)[(NSHashTable *)self->_observedScrollViews copy];
  [v8 minusHashTable:v3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v13++), "_removeScrollViewScrollObserver:", self, (void)v17);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  observedScrollViews = self->_observedScrollViews;
  self->_observedScrollViews = v3;
  id v15 = v3;

  long long v16 = [(NSHashTable *)v15 anyObject];

  [(AVScrollingObserver *)self _observeScrollViewDidScroll:v16];
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSHashTable *)self->_observedScrollViews copy];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) _removeScrollViewScrollObserver:self];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)AVScrollingObserver;
  [(AVScrollingObserver *)&v9 dealloc];
}

@end