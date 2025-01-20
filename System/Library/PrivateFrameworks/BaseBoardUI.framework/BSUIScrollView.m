@interface BSUIScrollView
- ($57C6A38B097B1DD8ADCFE6DE7C16ED39)currentScrollContext;
- (BOOL)isScrolling;
- (BOOL)setContentOffset:(CGPoint)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)setContentOffset:(CGPoint)a3 withAnimationSettings:(id)a4 completion:(id)a5;
- (BSUIScrollView)initWithFrame:(CGRect)a3;
- (BSUIScrollViewDelegate)delegate;
- (uint64_t)_setContentOffset:(void *)a3 animated:(void *)a4 withAnimation:(double)a5 completion:(double)a6;
- (uint64_t)_setCurrentContentOffsetImmediatelyIfScrollInterruptionAnimated:(uint64_t)result;
- (void)_callScrollCompletionIfNecessary;
- (void)_didDidEndDeceleratingNotification:(id)a3;
- (void)_didEndDraggingNotification:(id)a3;
- (void)_didEndScrollAnimationNotification:(id)a3;
- (void)_notifyDidScroll;
- (void)_setContentOffset:(CGPoint)a3 animation:(id)a4;
- (void)_setContentOffset:(unsigned char *)a1 withBlock:(void *)a2;
- (void)_setScrolling:(uint64_t)a1;
- (void)_updateScrolling;
- (void)_willBeginDraggingNotification:(id)a3;
- (void)dealloc;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
@end

@implementation BSUIScrollView

- (BSUIScrollView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BSUIScrollView;
  v3 = -[BSUIScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__willBeginDraggingNotification_ name:*MEMORY[0x1E4F44168] object:v3];
    [v4 addObserver:v3 selector:sel__didEndDraggingNotification_ name:*MEMORY[0x1E4F44158] object:v3];
    [v4 addObserver:v3 selector:sel__didDidEndDeceleratingNotification_ name:*MEMORY[0x1E4F44150] object:v3];
    [v4 addObserver:v3 selector:sel__didEndScrollAnimationNotification_ name:@"_UIScrollViewAnimationEndedNotification" object:v3];
  }
  return v3;
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__BSUIScrollView_setContentOffset_animated___block_invoke;
  v8[3] = &unk_1E5ABD748;
  objc_copyWeak(v9, &location);
  BOOL v10 = a4;
  v9[1] = *(id *)&x;
  v9[2] = *(id *)&y;
  v8[4] = self;
  -[BSUIScrollView _setContentOffset:withBlock:](self, v8);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)_notifyDidScroll
{
  self->_didScroll = 1;
  -[BSUIScrollView _setScrolling:]((uint64_t)self, 1);
  v10.receiver = self;
  v10.super_class = (Class)BSUIScrollView;
  [(BSUIScrollView *)&v10 _notifyDidScroll];
  uint64_t v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  [(BSUIScrollView *)self currentScrollContext];
  long long v4 = v7;
  long long v5 = v8;
  uint64_t v6 = v9;
  [(BSUIScrollView *)self _bs_didScrollWithContext:&v4];
  v3 = [(BSUIScrollView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    long long v4 = v7;
    long long v5 = v8;
    uint64_t v6 = v9;
    [v3 scrollViewDidScroll:self withContext:&v4];
  }
  -[BSUIScrollView _updateScrolling](self);
}

- ($57C6A38B097B1DD8ADCFE6DE7C16ED39)currentScrollContext
{
  v3 = (CGPoint *)self;
  retstr->var2.CGFloat y = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1.CGFloat y = 0u;
  if (self
    && (self = ($57C6A38B097B1DD8ADCFE6DE7C16ED39 *)[($57C6A38B097B1DD8ADCFE6DE7C16ED39 *)self isScrolling], self))
  {
    self = ($57C6A38B097B1DD8ADCFE6DE7C16ED39 *)[(CGPoint *)v3 isDragging];
    if ((self & 1) != 0
      || (self = ($57C6A38B097B1DD8ADCFE6DE7C16ED39 *)[(CGPoint *)v3 isTracking],
          (self & 1) != 0))
    {
      int64_t v5 = 3;
    }
    else
    {
      self = ($57C6A38B097B1DD8ADCFE6DE7C16ED39 *)[(CGPoint *)v3 isScrollAnimating];
      if (self)
      {
        int64_t v5 = 2;
      }
      else
      {
        self = ($57C6A38B097B1DD8ADCFE6DE7C16ED39 *)[(CGPoint *)v3 isDecelerating];
        int64_t v5 = 1;
        if (self) {
          int64_t v5 = 2;
        }
      }
    }
  }
  else
  {
    int64_t v5 = 0;
  }
  retstr->var0 = v5;
  retstr->var1 = v3[130];
  retstr->var2 = v3[131];
  return self;
}

- (void)setContentOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  p_previousContentOffset = &self->_previousContentOffset;
  [(BSUIScrollView *)self contentOffset];
  p_previousContentOffset->CGFloat x = v7;
  p_previousContentOffset->CGFloat y = v8;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__BSUIScrollView_setContentOffset___block_invoke;
  id v9[3] = &unk_1E5ABD720;
  *(CGFloat *)&v9[5] = x;
  *(CGFloat *)&v9[6] = y;
  v9[4] = self;
  -[BSUIScrollView _setContentOffset:withBlock:](self, v9);
}

- (void)_setContentOffset:(unsigned char *)a1 withBlock:(void *)a2
{
  uint64_t v6 = a2;
  if (a1)
  {
    if (!v6)
    {
      int64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel__setContentOffset_withBlock_, a1, @"BSUIScrollView.m", 173, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
    }
    [a1 contentOffset];
    int v3 = BSPointEqualToPoint();
    int v4 = [a1 isScrolling] | v3;
    if ((v4 & 1) == 0) {
      -[BSUIScrollView _setScrolling:]((uint64_t)a1, 1);
    }
    v6[2]();
    if (!v4) {
      goto LABEL_10;
    }
    if (!v3) {
      goto LABEL_11;
    }
    if (a1[2067]) {
      -[BSUIScrollView _callScrollCompletionIfNecessary](a1);
    }
    else {
LABEL_10:
    }
      -[BSUIScrollView _updateScrolling](a1);
  }
LABEL_11:
}

- (BOOL)isScrolling
{
  return self->_scrolling;
}

- (void)_updateScrolling
{
  if (a1)
  {
    if ([a1 isDragging] & 1) != 0 || (objc_msgSend(a1, "isDecelerating")) {
      int v2 = 1;
    }
    else {
      int v2 = [a1 isScrollAnimating];
    }
    -[BSUIScrollView _setScrolling:]((uint64_t)a1, v2);
    -[BSUIScrollView _callScrollCompletionIfNecessary](a1);
  }
}

- (void)_setScrolling:(uint64_t)a1
{
  if (a1)
  {
    char v2 = a2;
    if (*(unsigned __int8 *)(a1 + 2112) != a2)
    {
      if (a2)
      {
        objc_msgSend((id)a1, "_bs_willBeginScrolling");
        id v8 = [(id)a1 delegate];
        if (objc_opt_respondsToSelector()) {
          [v8 scrollViewWillBeginScrolling:a1];
        }
      }
      else if (*(unsigned char *)(a1 + 2065))
      {
        return;
      }
      *(unsigned char *)(a1 + 2112) = v2;
      [(id)a1 contentOffset];
      *(void *)(a1 + 2096) = v4;
      *(void *)(a1 + 2104) = v5;
      if ((v2 & 1) == 0)
      {
        uint64_t v9 = (void (**)(id, uint64_t))MEMORY[0x1A623AF30](*(void *)(a1 + 2072));
        uint64_t v6 = *(void **)(a1 + 2072);
        *(void *)(a1 + 2072) = 0;

        objc_msgSend((id)a1, "_bs_didEndScrolling");
        CGFloat v7 = [(id)a1 delegate];
        if (objc_opt_respondsToSelector()) {
          [v7 scrollViewDidEndScrolling:a1];
        }
        if (v9) {
          v9[2](v9, 1);
        }
      }
    }
  }
}

- (BSUIScrollViewDelegate)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)BSUIScrollView;
  char v2 = [(BSUIScrollView *)&v4 delegate];

  return (BSUIScrollViewDelegate *)v2;
}

- (void)_callScrollCompletionIfNecessary
{
  if (([a1 isScrolling] & 1) == 0 && a1[259])
  {
    int v3 = (void (**)(id, void))MEMORY[0x1A623AF30]();
    char v2 = (void *)a1[259];
    a1[259] = 0;

    v3[2](v3, 0);
  }
}

id __35__BSUIScrollView_setContentOffset___block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)BSUIScrollView;
  return objc_msgSendSuper2(&v2, sel_setContentOffset_, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

id __44__BSUIScrollView_setContentOffset_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[BSUIScrollView _setCurrentContentOffsetImmediatelyIfScrollInterruptionAnimated:]((uint64_t)WeakRetained, *(unsigned char *)(a1 + 64));

  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)BSUIScrollView;
  return objc_msgSendSuper2(&v5, sel_setContentOffset_animated_, v3, *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (uint64_t)_setCurrentContentOffsetImmediatelyIfScrollInterruptionAnimated:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = (unsigned char *)result;
    result = [(id)result isScrolling];
    v3[2065] = result & a2;
    if (v3[2065])
    {
      [v3 contentOffset];
      v4.receiver = v3;
      v4.super_class = (Class)BSUIScrollView;
      result = (uint64_t)objc_msgSendSuper2(&v4, sel_setContentOffset_animated_, 0);
      v3[2065] = 0;
    }
  }
  return result;
}

- (void)setDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BSUIScrollView;
  [(BSUIScrollView *)&v3 setDelegate:a3];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BSUIScrollView;
  [(BSUIScrollView *)&v4 dealloc];
}

- (BOOL)setContentOffset:(CGPoint)a3 animated:(BOOL)a4 completion:(id)a5
{
  return [(BSUIScrollView *)(uint64_t)self _setContentOffset:0 animated:a5 withAnimation:a3.x completion:a3.y];
}

- (uint64_t)_setContentOffset:(void *)a3 animated:(void *)a4 withAnimation:(double)a5 completion:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = v12;
  if (a1)
  {
    unint64_t v14 = (unint64_t)v12;
    uint64_t v15 = MEMORY[0x1A623AF30](*(void *)(a1 + 2072));
    v16 = (void *)v15;
    if (v14 | v15)
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __39__BSUIScrollView__setScrollCompletion___block_invoke;
      v23 = &unk_1E5ABD798;
      id v24 = (id)v15;
      id v25 = (id)v14;
      uint64_t v17 = [&v20 copy];
      v18 = *(void **)(a1 + 2072);
      *(void *)(a1 + 2072) = v17;
    }
    *(unsigned char *)(a1 + 2066) = 0;
    if (v11 && a2) {
      objc_msgSend((id)a1, "_setContentOffset:animation:", v11, a5, a6);
    }
    else {
      objc_msgSend((id)a1, "setContentOffset:animated:", a2, a5, a6, v20, v21, v22, v23);
    }
    if (*(unsigned char *)(a1 + 2066)) {
      a1 = 1;
    }
    else {
      a1 = [(id)a1 isScrolling];
    }
  }

  return a1;
}

- (BOOL)setContentOffset:(CGPoint)a3 withAnimationSettings:(id)a4 completion:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = v9;
    id v12 = v11;
    if (self)
    {
      if ([v11 isSpringAnimation])
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F39C90]);
        [v12 mass];
        objc_msgSend(v13, "setMass:");
        [v12 stiffness];
        objc_msgSend(v13, "setStiffness:");
        [v12 damping];
        objc_msgSend(v13, "setDamping:");
        [v12 epsilon];
        objc_msgSend(v13, "durationForEpsilon:");
        objc_msgSend(v13, "setDuration:");
      }
      else
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F39B48]);
        [v12 duration];
        objc_msgSend(v13, "setDuration:");
        [v12 speed];
        objc_msgSend(v13, "setSpeed:");
      }
      unint64_t v14 = [v12 timingFunction];
      [v13 setTimingFunction:v14];
    }
    else
    {
      id v13 = 0;
    }

    char v15 = [(BSUIScrollView *)(uint64_t)self _setContentOffset:v13 animated:v10 withAnimation:x completion:y];
  }
  else
  {
    char v15 = [(BSUIScrollView *)(uint64_t)self _setContentOffset:0 animated:v10 withAnimation:x completion:y];
  }

  return v15;
}

- (void)_setContentOffset:(CGPoint)a3 animation:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__BSUIScrollView__setContentOffset_animation___block_invoke;
  id v9[3] = &unk_1E5ABD770;
  objc_copyWeak(v12, &location);
  v12[1] = *(id *)&x;
  v12[2] = *(id *)&y;
  id v10 = v7;
  id v11 = self;
  id v8 = v7;
  -[BSUIScrollView _setContentOffset:withBlock:](self, v9);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

id __46__BSUIScrollView__setContentOffset_animation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  -[BSUIScrollView _setCurrentContentOffsetImmediatelyIfScrollInterruptionAnimated:]((uint64_t)WeakRetained, 1);

  uint64_t v3 = *(void *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)BSUIScrollView;
  return objc_msgSendSuper2(&v5, sel__setContentOffset_animation_, v3, *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __39__BSUIScrollView__setScrollCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    objc_super v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)_willBeginDraggingNotification:(id)a3
{
}

- (void)_didEndDraggingNotification:(id)a3
{
  id v7 = a3;
  objc_super v4 = [v7 userInfo];
  objc_super v5 = [v4 objectForKey:*MEMORY[0x1E4F44160]];
  char v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0) {
    -[BSUIScrollView _setScrolling:]((uint64_t)self, 0);
  }
}

- (void)_didDidEndDeceleratingNotification:(id)a3
{
}

- (void)_didEndScrollAnimationNotification:(id)a3
{
  self->_isHandlingAnimationEnded = 1;
  -[BSUIScrollView _setScrolling:]((uint64_t)self, 0);
  self->_isHandlingAnimationEnded = 0;
}

- (void).cxx_destruct
{
}

@end