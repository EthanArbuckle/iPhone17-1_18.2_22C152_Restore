@interface SKScrollDetector
- (NSMutableArray)subscribedScrollers;
- (SKScreenTrackingDelegate)screenTrakingDelegate;
- (SKScrollDetector)init;
- (SKScrollDetector)initWithDelegate:(id)a3;
- (void)dealloc;
- (void)findAndListenForScrollingOfView:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setScreenTrakingDelegate:(id)a3;
- (void)setSubscribedScrollers:(id)a3;
- (void)stopListeningForScrollingOfView:(id)a3;
@end

@implementation SKScrollDetector

- (SKScrollDetector)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKScrollDetector;
  v5 = [(SKScrollDetector *)&v9 init];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    subscribedScrollers = v5->_subscribedScrollers;
    v5->_subscribedScrollers = v6;

    objc_storeWeak((id *)&v5->_screenTrakingDelegate, v4);
  }

  return v5;
}

- (SKScrollDetector)init
{
  return [(SKScrollDetector *)self initWithDelegate:0];
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(SKScrollDetector *)self subscribedScrollers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) scrollingView];
        [v8 removeObserver:self forKeyPath:@"contentOffset" context:&scrollingKVOContext];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  objc_super v9 = [(SKScrollDetector *)self subscribedScrollers];
  [v9 removeAllObjects];

  v10.receiver = self;
  v10.super_class = (Class)SKScrollDetector;
  [(SKScrollDetector *)&v10 dealloc];
}

- (void)findAndListenForScrollingOfView:(id)a3
{
  id v19 = a3;
  if (v19)
  {
    uint64_t v4 = v19;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = v4;
        [v5 addObserver:self forKeyPath:@"contentOffset" options:1 context:&scrollingKVOContext];
        uint64_t v6 = objc_alloc_init(SKWeakContainer);
        [(SKWeakContainer *)v6 setScrollingView:v5];
        [(SKWeakContainer *)v6 setTrackingView:v19];
        uint64_t v7 = objc_msgSend(v19, "_sk_isAtLeast50PercentOnScreen");

        [(SKWeakContainer *)v6 setWasOnScreen:v7];
        v8 = [(SKScrollDetector *)self subscribedScrollers];
        [v8 addObject:v6];
      }
      [v4 frame];
      [v4 frame];
      [v4 bounds];
      [v4 bounds];
      objc_super v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v9 bounds];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;

      [v4 bounds];
      CGRectGetHeight(v21);
      v22.origin.x = v11;
      v22.origin.y = v13;
      v22.size.width = v15;
      v22.size.height = v17;
      objc_msgSend(v4, "bounds", CGRectGetHeight(v22));
      CGRectGetWidth(v23);
      v24.origin.x = v11;
      v24.origin.y = v13;
      v24.size.width = v15;
      v24.size.height = v17;
      uint64_t v18 = objc_msgSend(v4, "superview", CGRectGetWidth(v24));

      uint64_t v4 = (void *)v18;
    }
    while (v18);
  }
}

- (void)stopListeningForScrollingOfView:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [(SKScrollDetector *)self subscribedScrollers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
        CGFloat v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [v11 trackingView];
        if ((id)v12 == v4)
        {
        }
        else
        {
          CGFloat v13 = (void *)v12;
          double v14 = [v11 trackingView];

          if (v14) {
            continue;
          }
        }
        CGFloat v15 = [v11 scrollingView];
        [v15 removeObserver:self forKeyPath:@"contentOffset" context:&scrollingKVOContext];

        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  double v16 = [(SKScrollDetector *)self subscribedScrollers];
  [v16 removeObjectsInArray:v5];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  if (a6 == &scrollingKVOContext)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_24;
    }
    id v32 = v10;
    id v11 = v10;
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    CGFloat v13 = [(SKScrollDetector *)self subscribedScrollers];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (!v14) {
      goto LABEL_23;
    }
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
LABEL_6:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v35 != v16) {
        objc_enumerationMutation(v13);
      }
      long long v18 = *(void **)(*((void *)&v34 + 1) + 8 * v17);
      long long v19 = [v18 trackingView];

      if (v19)
      {
        id v20 = [v18 scrollingView];

        if (v20 == v11)
        {
          CGRect v21 = [v18 trackingView];
          if (objc_msgSend(v21, "_sk_isAtLeast50PercentOnScreen"))
          {
            char v22 = [v18 wasOnScreen];

            if ((v22 & 1) == 0)
            {
              CGRect v23 = [(SKScrollDetector *)self screenTrakingDelegate];
              CGRect v24 = [v18 trackingView];
              objc_msgSend(v23, "sk_didBecomeOnScreen:", v24);

              v25 = v18;
              uint64_t v26 = 1;
LABEL_20:
              [v25 setWasOnScreen:v26];
              goto LABEL_21;
            }
          }
          else
          {
          }
          v27 = [v18 trackingView];
          if (objc_msgSend(v27, "_sk_isAtLeast50PercentOnScreen"))
          {
          }
          else
          {
            int v28 = [v18 wasOnScreen];

            if (v28)
            {
              v29 = [(SKScrollDetector *)self screenTrakingDelegate];
              v30 = [v18 trackingView];
              objc_msgSend(v29, "sk_didBecomeOffScreen:", v30);

              v25 = v18;
              uint64_t v26 = 0;
              goto LABEL_20;
            }
          }
        }
      }
      else
      {
        [v12 addObject:v18];
      }
LABEL_21:
      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (!v15)
        {
LABEL_23:

          v31 = [(SKScrollDetector *)self subscribedScrollers];
          [v31 removeObjectsInArray:v12];

          id v10 = v32;
          goto LABEL_24;
        }
        goto LABEL_6;
      }
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)SKScrollDetector;
  [(SKScrollDetector *)&v33 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
LABEL_24:
}

- (SKScreenTrackingDelegate)screenTrakingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screenTrakingDelegate);

  return (SKScreenTrackingDelegate *)WeakRetained;
}

- (void)setScreenTrakingDelegate:(id)a3
{
}

- (NSMutableArray)subscribedScrollers
{
  return self->_subscribedScrollers;
}

- (void)setSubscribedScrollers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedScrollers, 0);

  objc_destroyWeak((id *)&self->_screenTrakingDelegate);
}

@end