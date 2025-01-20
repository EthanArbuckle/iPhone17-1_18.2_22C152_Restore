@interface AKTouchOutsideViewGestureRecognizer
- (AKTouchOutsideViewGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 watchView:(id)a5;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (UIView)watchView;
- (void)addTarget:(id)a3 action:(SEL)a4;
- (void)dealloc;
- (void)removeTarget:(id)a3 action:(SEL)a4;
- (void)setWatchView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation AKTouchOutsideViewGestureRecognizer

- (AKTouchOutsideViewGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 watchView:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AKTouchOutsideViewGestureRecognizer;
  v10 = [(AKTouchOutsideViewGestureRecognizer *)&v15 initWithTarget:0 action:0];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->mWatchView, v9);
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    mTargets = v11->mTargets;
    v11->mTargets = v12;

    [(AKTouchOutsideViewGestureRecognizer *)v11 setDelegate:v11];
    [(AKTouchOutsideViewGestureRecognizer *)v11 addTarget:v8 action:a4];
  }

  return v11;
}

- (void)dealloc
{
  mTargets = self->mTargets;
  self->mTargets = 0;

  objc_storeWeak((id *)&self->mWatchView, 0);
  v4.receiver = self;
  v4.super_class = (Class)AKTouchOutsideViewGestureRecognizer;
  [(AKTouchOutsideViewGestureRecognizer *)&v4 dealloc];
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(AKTouchOutsideViewGestureRecognizerTarget);
  [(AKTouchOutsideViewGestureRecognizerTarget *)v7 setTarget:v6];

  [(AKTouchOutsideViewGestureRecognizerTarget *)v7 setAction:a4];
  [(NSMutableSet *)self->mTargets addObject:v7];
}

- (void)removeTarget:(id)a3 action:(SEL)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v19 = [MEMORY[0x263EFF9C0] set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v7 = self->mTargets;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
        if (!v6
          || ([*(id *)(*((void *)&v24 + 1) + 8 * v11) target],
              id v13 = (id)objc_claimAutoreleasedReturnValue(),
              v13,
              v13 == v6))
        {
          if (!a4 || (SEL)[v12 action] == a4) {
            [v19 addObject:v12];
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = v19;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        [(NSMutableSet *)self->mTargets removeObject:*(void *)(*((void *)&v20 + 1) + 8 * v18++)];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v16);
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AKTouchOutsideViewGestureRecognizer *)self watchView];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 bounds];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v18 = v6;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      char v21 = 0;
      uint64_t v22 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v52 != v22) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v51 + 1) + 8 * i) locationInView:v9];
          v59.x = v24;
          v59.y = v25;
          v60.origin.x = v11;
          v60.origin.y = v13;
          v60.size.width = v15;
          v60.size.height = v17;
          if (CGRectContainsPoint(v60, v59)) {
            char v21 = 1;
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v20);
      int v26 = v21 & 1;
    }
    else
    {
      int v26 = 0;
    }
  }
  else
  {
    int v26 = 0;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v27 = [v7 allTouches];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    int v30 = 0;
    uint64_t v31 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v48 != v31) {
          objc_enumerationMutation(v27);
        }
        v30 |= [v6 containsObject:*(void *)(*((void *)&v47 + 1) + 8 * j)] ^ 1;
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v29);
  }
  else
  {
    int v30 = 0;
  }

  if (((v26 | v30) & 1) == 0)
  {
    char v41 = v26;
    id v42 = v7;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v33 = self->mTargets;
    uint64_t v34 = [(NSMutableSet *)v33 countByEnumeratingWithState:&v43 objects:v55 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v44;
      do
      {
        for (uint64_t k = 0; k != v35; ++k)
        {
          if (*(void *)v44 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v43 + 1) + 8 * k);
          v39 = [v38 target];
          objc_msgSend(v39, "performSelector:withObject:", objc_msgSend(v38, "action"), self);
        }
        uint64_t v35 = [(NSMutableSet *)v33 countByEnumeratingWithState:&v43 objects:v55 count:16];
      }
      while (v35);
    }

    id v7 = v42;
    LOBYTE(v26) = v41;
  }
  if (v26 & 1 | ((v30 & 1) == 0)) {
    uint64_t v40 = 5;
  }
  else {
    uint64_t v40 = 1;
  }
  [(AKTouchOutsideViewGestureRecognizer *)self setState:v40];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (UIView)watchView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mWatchView);

  return (UIView *)WeakRetained;
}

- (void)setWatchView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mWatchView);

  objc_storeStrong((id *)&self->mTargets, 0);
}

@end