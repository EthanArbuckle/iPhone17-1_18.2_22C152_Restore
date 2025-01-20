@interface FIUIHeartRateStatusView
- (BOOL)animationsSuspended;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (FIUIAnimatingSpriteImageView)animatingImageView;
- (FIUIHeartRateStatusView)initWithFrame:(CGRect)a3 heartFilledImageName:(id)a4 heartSpriteImageName:(id)a5 heartSuspendedSpriteImageName:(id)a6 spriteFrameCount:(int64_t)a7 spriteColumnCount:(int64_t)a8 resourceBundle:(id)a9;
- (FIUIHeartRateStatusView)initWithFrame:(CGRect)a3 heartFilledImageName:(id)a4 heartSpriteImageName:(id)a5 spriteFrameCount:(int64_t)a6 spriteColumnCount:(int64_t)a7 resourceBundle:(id)a8;
- (UIImageView)animationSuspendedMeasuringView;
- (UIImageView)fullHeartImageView;
- (UIImageView)reloadArrowView;
- (UIImageView)reloadOutlineView;
- (id)_loadHeartMeasuringImage;
- (void)_beatFullHeartOnce;
- (void)_finishedHeartbeat;
- (void)_loadHeartMeasuringImage;
- (void)_resumeAnimations;
- (void)_startBeatingHeart;
- (void)_startMeasuringAnimationAnimated:(BOOL)a3;
- (void)_suspendAnimations;
- (void)layoutSubviews;
- (void)setAnimatingImageView:(id)a3;
- (void)setAnimationSuspendedMeasuringView:(id)a3;
- (void)setAnimationsSuspended:(BOOL)a3;
- (void)setBeatsPerMinute:(double)a3;
- (void)setFullHeartImageView:(id)a3;
- (void)setReloadArrowImage:(id)a3;
- (void)setReloadArrowView:(id)a3;
- (void)setReloadHeartOutlineImage:(id)a3;
- (void)setReloadOutlineView:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)unloadAnimationAssets;
@end

@implementation FIUIHeartRateStatusView

- (void)setFullHeartImageView:(id)a3
{
}

- (UIImageView)fullHeartImageView
{
  return self->_fullHeartImageView;
}

- (void)setAnimatingImageView:(id)a3
{
}

- (FIUIAnimatingSpriteImageView)animatingImageView
{
  return self->_animatingImageView;
}

- (void)setState:(unint64_t)a3
{
  unint64_t state = self->_state;
  if (state != a3)
  {
    self->_unint64_t state = a3;
    switch(a3)
    {
      case 1uLL:
        [(FIUIHeartRateStatusView *)self _startMeasuringAnimationAnimated:0];
        if (state == 5)
        {
          v10 = (void *)MEMORY[0x263F82E00];
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = __36__FIUIHeartRateStatusView_setState___block_invoke;
          v24[3] = &unk_2644A7B18;
          v24[4] = self;
          v23[0] = MEMORY[0x263EF8330];
          v23[1] = 3221225472;
          v23[2] = __36__FIUIHeartRateStatusView_setState___block_invoke_2;
          v23[3] = &unk_2644A8420;
          v23[4] = self;
          v23[5] = 1;
          double v11 = 0.5;
          v12 = v24;
          v13 = v23;
          uint64_t v14 = 0x10000;
          goto LABEL_9;
        }
        v16 = [(FIUIHeartRateStatusView *)self reloadArrowView];
        [v16 setAlpha:0.0];

        break;
      case 2uLL:
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __36__FIUIHeartRateStatusView_setState___block_invoke_3;
        v22[3] = &unk_2644A7B18;
        v22[4] = self;
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __36__FIUIHeartRateStatusView_setState___block_invoke_4;
        v21[3] = &unk_2644A8420;
        v21[4] = self;
        v21[5] = 2;
        [MEMORY[0x263F82E00] animateWithDuration:v22 animations:v21 completion:0.5];
        break;
      case 3uLL:
      case 6uLL:
        v5 = [(FIUIHeartRateStatusView *)self animatingImageView];
        [v5 setAlpha:0.0];

        v6 = [(FIUIHeartRateStatusView *)self animationSuspendedMeasuringView];
        [v6 setAlpha:0.0];

        v7 = [(FIUIHeartRateStatusView *)self fullHeartImageView];
        [v7 setAlpha:1.0];

        v8 = [(FIUIHeartRateStatusView *)self reloadOutlineView];
        [v8 setAlpha:0.0];

        v9 = [(FIUIHeartRateStatusView *)self reloadArrowView];
        [v9 setAlpha:0.0];

        [(FIUIHeartRateStatusView *)self _suspendAnimations];
        break;
      case 4uLL:
        [(FIUIHeartRateStatusView *)self _startMeasuringAnimationAnimated:1];
        break;
      case 5uLL:
        CGAffineTransformMakeRotation(&v20, 3.14159265);
        v15 = [(FIUIHeartRateStatusView *)self reloadArrowView];
        CGAffineTransform v19 = v20;
        [v15 setTransform:&v19];

        v10 = (void *)MEMORY[0x263F82E00];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __36__FIUIHeartRateStatusView_setState___block_invoke_5;
        v18[3] = &unk_2644A7B18;
        v18[4] = self;
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __36__FIUIHeartRateStatusView_setState___block_invoke_6;
        v17[3] = &unk_2644A8420;
        v17[4] = self;
        v17[5] = 5;
        double v11 = 0.5;
        v12 = v18;
        v13 = v17;
        uint64_t v14 = 0x20000;
LABEL_9:
        [v10 animateWithDuration:v14 delay:v12 options:v13 animations:v11 completion:0.0];
        break;
      default:
        break;
    }
    [(FIUIHeartRateStatusView *)self invalidateIntrinsicContentSize];
  }
}

- (void)_startMeasuringAnimationAnimated:(BOOL)a3
{
  if (self->_animationsSuspended)
  {
    v4 = [(FIUIHeartRateStatusView *)self animatingImageView];
    [v4 setAlpha:0.0];

    v5 = [(FIUIHeartRateStatusView *)self fullHeartImageView];
    [v5 setAlpha:0.0];

    v6 = [(FIUIHeartRateStatusView *)self reloadOutlineView];
    [v6 setAlpha:0.0];

    v7 = [(FIUIHeartRateStatusView *)self reloadArrowView];
    [v7 setAlpha:0.0];

    id v15 = [(FIUIHeartRateStatusView *)self animationSuspendedMeasuringView];
    [v15 setAlpha:1.0];
  }
  else
  {
    BOOL v8 = a3;
    v9 = [(FIUIHeartRateStatusView *)self reloadOutlineView];
    [v9 setAlpha:0.0];

    v10 = [(FIUIHeartRateStatusView *)self reloadArrowView];
    [v10 setAlpha:0.0];

    id v11 = [(FIUIHeartRateStatusView *)self _loadHeartMeasuringImage];
    v12 = [(FIUIHeartRateStatusView *)self animatingImageView];
    [v12 startAnimating];

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__FIUIHeartRateStatusView__startMeasuringAnimationAnimated___block_invoke;
    aBlock[3] = &unk_2644A7B18;
    aBlock[4] = self;
    v13 = _Block_copy(aBlock);
    uint64_t v14 = v13;
    if (v8) {
      [MEMORY[0x263F82E00] animateWithDuration:v13 animations:0.5];
    }
    else {
      (*((void (**)(void *))v13 + 2))(v13);
    }
  }
}

- (UIImageView)reloadOutlineView
{
  return self->_reloadOutlineView;
}

- (UIImageView)reloadArrowView
{
  return self->_reloadArrowView;
}

- (id)_loadHeartMeasuringImage
{
  v3 = [(FIUIAnimatingSpriteImageView *)self->_animatingImageView spriteImage];
  if (v3)
  {
  }
  else
  {
    heartSpriteImageName = self->_heartSpriteImageName;
    if (heartSpriteImageName)
    {
      v5 = FIUIImageInBundle((uint64_t)heartSpriteImageName, (uint64_t)self->_resourceBundle);
      if (v5)
      {
        [(FIUIAnimatingSpriteImageView *)self->_animatingImageView setSpriteImage:v5];
        [(FIUIAnimatingSpriteImageView *)self->_animatingImageView setSpriteColumnCount:self->_heartSpriteImageColumnCount];
        [(FIUIAnimatingSpriteImageView *)self->_animatingImageView setSpriteFrameCount:self->_heartSpriteImageFrameCount];
      }
      else
      {
        _HKInitializeLogging();
        v6 = *MEMORY[0x263F09918];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09918], OS_LOG_TYPE_ERROR)) {
          [(FIUIHeartRateStatusView *)(uint64_t *)&self->_heartSpriteImageName _loadHeartMeasuringImage];
        }
      }
    }
  }
  v7 = [(FIUIAnimatingSpriteImageView *)self->_animatingImageView spriteImage];
  return v7;
}

void __60__FIUIHeartRateStatusView__startMeasuringAnimationAnimated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fullHeartImageView];
  [v2 setAlpha:0.0];

  v3 = [*(id *)(a1 + 32) animationSuspendedMeasuringView];
  [v3 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) animatingImageView];
  [v4 setAlpha:1.0];
}

- (void)setAnimationsSuspended:(BOOL)a3
{
  if (self->_animationsSuspended != a3)
  {
    self->_animationsSuspended = a3;
    if (a3) {
      [(FIUIHeartRateStatusView *)self _suspendAnimations];
    }
    else {
      [(FIUIHeartRateStatusView *)self _resumeAnimations];
    }
  }
}

- (void)_resumeAnimations
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21E433000, log, OS_LOG_TYPE_DEBUG, "[HRStatusView] Starting animations", v1, 2u);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = [(FIUIHeartRateStatusView *)self fullHeartImageView];
  id v4 = [v3 image];
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  [(FIUIHeartRateStatusView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = [(FIUIHeartRateStatusView *)self fullHeartImageView];
  [v11 bounds];
  v61.origin.x = v12;
  v61.origin.y = v13;
  v61.size.width = v14;
  v61.size.height = v15;
  v60.origin.x = v4;
  v60.origin.y = v6;
  v60.size.width = v8;
  v60.size.height = v10;
  BOOL v16 = CGRectEqualToRect(v60, v61);

  if (!v16)
  {
    [(FIUIHeartRateStatusView *)self bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    v25 = [(FIUIHeartRateStatusView *)self animatingImageView];
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

    [(FIUIHeartRateStatusView *)self bounds];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    v34 = [(FIUIHeartRateStatusView *)self fullHeartImageView];
    objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

    [(FIUIHeartRateStatusView *)self bounds];
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    v43 = [(FIUIHeartRateStatusView *)self reloadOutlineView];
    objc_msgSend(v43, "setFrame:", v36, v38, v40, v42);

    [(FIUIHeartRateStatusView *)self bounds];
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    v52 = [(FIUIHeartRateStatusView *)self animationSuspendedMeasuringView];
    objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

    v53 = [(FIUIHeartRateStatusView *)self reloadOutlineView];
    [v53 center];
    double v55 = v54;
    double v57 = v56;
    v58 = [(FIUIHeartRateStatusView *)self reloadArrowView];
    objc_msgSend(v58, "setCenter:", v55, v57);

    [(FIUIHeartRateStatusView *)self _resumeAnimations];
  }
}

- (void)_suspendAnimations
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21E433000, log, OS_LOG_TYPE_DEBUG, "[HRStatusView] Stopping animations", v1, 2u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadArrowView, 0);
  objc_storeStrong((id *)&self->_animationSuspendedMeasuringView, 0);
  objc_storeStrong((id *)&self->_reloadOutlineView, 0);
  objc_storeStrong((id *)&self->_animatingImageView, 0);
  objc_storeStrong((id *)&self->_fullHeartImageView, 0);
  objc_storeStrong((id *)&self->_resourceBundle, 0);
  objc_storeStrong((id *)&self->_heartSpriteImageName, 0);
}

- (FIUIHeartRateStatusView)initWithFrame:(CGRect)a3 heartFilledImageName:(id)a4 heartSpriteImageName:(id)a5 spriteFrameCount:(int64_t)a6 spriteColumnCount:(int64_t)a7 resourceBundle:(id)a8
{
  return -[FIUIHeartRateStatusView initWithFrame:heartFilledImageName:heartSpriteImageName:heartSuspendedSpriteImageName:spriteFrameCount:spriteColumnCount:resourceBundle:](self, "initWithFrame:heartFilledImageName:heartSpriteImageName:heartSuspendedSpriteImageName:spriteFrameCount:spriteColumnCount:resourceBundle:", a4, a5, a4, a6, a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (FIUIHeartRateStatusView)initWithFrame:(CGRect)a3 heartFilledImageName:(id)a4 heartSpriteImageName:(id)a5 heartSuspendedSpriteImageName:(id)a6 spriteFrameCount:(int64_t)a7 spriteColumnCount:(int64_t)a8 resourceBundle:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a9;
  v41.receiver = self;
  v41.super_class = (Class)FIUIHeartRateStatusView;
  double v23 = -[FIUIHeartRateStatusView initWithFrame:](&v41, sel_initWithFrame_, x, y, width, height);
  double v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_heartSpriteImageName, a5);
    v24->_heartSpriteImageFrameCount = a7;
    v24->_heartSpriteImageColumnCount = a8;
    objc_storeStrong((id *)&v24->_resourceBundle, a9);
    v24->_beatsPerMinute = 60.0;
    v25 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", x, y, width, height);
    [(FIUIHeartRateStatusView *)v24 setFullHeartImageView:v25];

    double v26 = FIUIImageInBundle((uint64_t)v19, (uint64_t)v24->_resourceBundle);
    double v27 = [(FIUIHeartRateStatusView *)v24 fullHeartImageView];
    [v27 setImage:v26];

    double v28 = [(FIUIHeartRateStatusView *)v24 fullHeartImageView];
    [v28 setAlpha:0.0];

    double v29 = [(FIUIHeartRateStatusView *)v24 fullHeartImageView];
    [(FIUIHeartRateStatusView *)v24 addSubview:v29];

    double v30 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", x, y, width, height);
    [(FIUIHeartRateStatusView *)v24 setAnimationSuspendedMeasuringView:v30];

    double v31 = FIUIImageInBundle((uint64_t)v21, (uint64_t)v24->_resourceBundle);
    double v32 = [(FIUIHeartRateStatusView *)v24 animationSuspendedMeasuringView];
    [v32 setImage:v31];

    double v33 = [(FIUIHeartRateStatusView *)v24 animationSuspendedMeasuringView];
    [v33 setAlpha:0.0];

    v34 = [(FIUIHeartRateStatusView *)v24 animationSuspendedMeasuringView];
    [(FIUIHeartRateStatusView *)v24 addSubview:v34];

    double v35 = -[FIUIAnimatingSpriteImageView initWithFrame:]([FIUIAnimatingSpriteImageView alloc], "initWithFrame:", x, y, width, height);
    [(FIUIHeartRateStatusView *)v24 setAnimatingImageView:v35];

    double v36 = [(FIUIHeartRateStatusView *)v24 animatingImageView];
    [v36 setContentMode:1];

    double v37 = [(FIUIHeartRateStatusView *)v24 animatingImageView];
    [v37 setAlpha:0.0];

    double v38 = [(FIUIHeartRateStatusView *)v24 animatingImageView];
    [(FIUIHeartRateStatusView *)v24 addSubview:v38];

    double v39 = [MEMORY[0x263F08A00] defaultCenter];
    [v39 addObserver:v24 selector:sel__resumeAnimations name:@"FIUIResumeAnimationsNotification" object:0];
    [v39 addObserver:v24 selector:sel__suspendAnimations name:@"FIUISuspendAnimationsNotification" object:0];
  }
  return v24;
}

- (CGSize)intrinsicContentSize
{
  unint64_t state = self->_state;
  if (state <= 6)
  {
    if (((1 << state) & 0x6C) != 0)
    {
      double v5 = [(FIUIHeartRateStatusView *)self fullHeartImageView];
LABEL_9:
      CGFloat v6 = v5;
      [v5 intrinsicContentSize];
      double v2 = v7;
      double v3 = v8;

      goto LABEL_10;
    }
    if (((1 << state) & 0x12) != 0)
    {
      if (self->_animationsSuspended) {
        [(FIUIHeartRateStatusView *)self animationSuspendedMeasuringView];
      }
      else {
      double v5 = [(FIUIHeartRateStatusView *)self animatingImageView];
      }
      goto LABEL_9;
    }
  }
LABEL_10:
  double v9 = v2;
  double v10 = v3;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)setReloadHeartOutlineImage:(id)a3
{
  id v4 = a3;
  double v5 = [(FIUIHeartRateStatusView *)self reloadOutlineView];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F82828]);
    [(FIUIHeartRateStatusView *)self setReloadOutlineView:v6];

    double v7 = [(FIUIHeartRateStatusView *)self reloadOutlineView];
    [(FIUIHeartRateStatusView *)self addSubview:v7];
  }
  double v8 = [(FIUIHeartRateStatusView *)self reloadOutlineView];
  [v8 setImage:v4];

  double v9 = [(FIUIHeartRateStatusView *)self reloadOutlineView];
  [v9 setAlpha:0.0];

  double v10 = [(FIUIHeartRateStatusView *)self reloadOutlineView];
  [v10 sizeToFit];

  [(FIUIHeartRateStatusView *)self setNeedsLayout];
}

- (void)setReloadArrowImage:(id)a3
{
  id v4 = a3;
  double v5 = [(FIUIHeartRateStatusView *)self reloadArrowView];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F82828]);
    [(FIUIHeartRateStatusView *)self setReloadArrowView:v6];

    double v7 = [(FIUIHeartRateStatusView *)self reloadArrowView];
    [(FIUIHeartRateStatusView *)self addSubview:v7];
  }
  double v8 = [(FIUIHeartRateStatusView *)self reloadArrowView];
  [v8 setImage:v4];

  double v9 = [(FIUIHeartRateStatusView *)self reloadArrowView];
  [v9 setAlpha:0.0];

  double v10 = [(FIUIHeartRateStatusView *)self reloadArrowView];
  [v10 sizeToFit];

  [(FIUIHeartRateStatusView *)self setNeedsLayout];
}

void __36__FIUIHeartRateStatusView_setState___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) reloadArrowView];
  [v2 setAlpha:0.0];

  CGAffineTransformMakeRotation(&v5, 3.14159265);
  double v3 = [*(id *)(a1 + 32) reloadArrowView];
  CGAffineTransform v4 = v5;
  [v3 setTransform:&v4];
}

void __36__FIUIHeartRateStatusView_setState___block_invoke_2(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  if (v2[55] == *(void *)(a1 + 40))
  {
    double v3 = [v2 reloadArrowView];
    long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v5[0] = *MEMORY[0x263F000D0];
    v5[1] = v4;
    v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v3 setTransform:v5];
  }
}

void __36__FIUIHeartRateStatusView_setState___block_invoke_3(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) animatingImageView];
  [v2 setAlpha:0.0];

  double v3 = [*(id *)(a1 + 32) animationSuspendedMeasuringView];
  [v3 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) fullHeartImageView];
  [v4 setAlpha:1.0];
}

void *__36__FIUIHeartRateStatusView_setState___block_invoke_4(uint64_t a1)
{
  CGSize result = *(void **)(a1 + 32);
  if (result[55] == *(void *)(a1 + 40))
  {
    [result _suspendAnimations];
    double v3 = *(void **)(a1 + 32);
    return (void *)[v3 _startBeatingHeart];
  }
  return result;
}

void __36__FIUIHeartRateStatusView_setState___block_invoke_5(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) animatingImageView];
  [v2 setAlpha:0.0];

  double v3 = [*(id *)(a1 + 32) fullHeartImageView];
  [v3 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) animationSuspendedMeasuringView];
  [v4 setAlpha:0.0];

  CGAffineTransform v5 = [*(id *)(a1 + 32) reloadOutlineView];
  [v5 setAlpha:1.0];

  id v6 = [*(id *)(a1 + 32) reloadArrowView];
  [v6 setAlpha:1.0];

  CGAffineTransformMakeRotation(&v9, 6.28318531);
  double v7 = [*(id *)(a1 + 32) reloadArrowView];
  CGAffineTransform v8 = v9;
  [v7 setTransform:&v8];
}

void *__36__FIUIHeartRateStatusView_setState___block_invoke_6(uint64_t a1)
{
  CGSize result = *(void **)(a1 + 32);
  if (result[55] == *(void *)(a1 + 40))
  {
    double v3 = [result reloadArrowView];
    long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v5[0] = *MEMORY[0x263F000D0];
    v5[1] = v4;
    v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v3 setTransform:v5];

    return (void *)[*(id *)(a1 + 32) _suspendAnimations];
  }
  return result;
}

- (void)setBeatsPerMinute:(double)a3
{
  self->_beatsPerMinute = a3;
}

- (void)_startBeatingHeart
{
  if (!self->_isBeatingHeart && !self->_animationsSuspended)
  {
    self->_isBeatingHeart = 1;
    [(FIUIHeartRateStatusView *)self _beatFullHeartOnce];
  }
}

- (void)_beatFullHeartOnce
{
  double v2 = 60.0 / self->_beatsPerMinute;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__FIUIHeartRateStatusView__beatFullHeartOnce__block_invoke;
  v4[3] = &unk_2644A8448;
  v4[4] = self;
  long long v5 = xmmword_21E4D8E00;
  unint64_t v6 = 0xBFE1111111111111;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__FIUIHeartRateStatusView__beatFullHeartOnce__block_invoke_4;
  v3[3] = &unk_2644A8470;
  v3[4] = self;
  [MEMORY[0x263F82E00] animateKeyframesWithDuration:117637120 delay:v4 options:v3 animations:v2 completion:0.0];
}

uint64_t __45__FIUIHeartRateStatusView__beatFullHeartOnce__block_invoke(double *a1)
{
  double v2 = a1[5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__FIUIHeartRateStatusView__beatFullHeartOnce__block_invoke_2;
  v7[3] = &unk_2644A7B18;
  *(double *)&v7[4] = a1[4];
  [MEMORY[0x263F82E00] addKeyframeWithRelativeStartTime:v7 relativeDuration:0.0 animations:v2];
  double v3 = a1[6];
  double v4 = a1[7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__FIUIHeartRateStatusView__beatFullHeartOnce__block_invoke_3;
  v6[3] = &unk_2644A7B18;
  *(double *)&v6[4] = a1[4];
  return [MEMORY[0x263F82E00] addKeyframeWithRelativeStartTime:v6 relativeDuration:v3 animations:v4];
}

void __45__FIUIHeartRateStatusView__beatFullHeartOnce__block_invoke_2(uint64_t a1)
{
  CGAffineTransformMakeScale(&v4, 0.9, 0.9);
  double v2 = [*(id *)(a1 + 32) fullHeartImageView];
  CGAffineTransform v3 = v4;
  [v2 setTransform:&v3];
}

void __45__FIUIHeartRateStatusView__beatFullHeartOnce__block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) fullHeartImageView];
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v3[0] = *MEMORY[0x263F000D0];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v1 setTransform:v3];
}

uint64_t __45__FIUIHeartRateStatusView__beatFullHeartOnce__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedHeartbeat];
}

- (void)_finishedHeartbeat
{
  self->_isBeatingHeart = 0;
  CGAffineTransform v3 = [(FIUIHeartRateStatusView *)self window];
  if (v3)
  {
    BOOL animationsSuspended = self->_animationsSuspended;

    if (!animationsSuspended)
    {
      if (self->_state == 2)
      {
        self->_isBeatingHeart = 1;
        [(FIUIHeartRateStatusView *)self _beatFullHeartOnce];
      }
      else if (self->_delayedStartMeasuringAnimation)
      {
        self->_delayedStartMeasuringAnimation = 0;
        [(FIUIHeartRateStatusView *)self _startMeasuringAnimationAnimated:1];
      }
    }
  }
}

- (void)unloadAnimationAssets
{
  [(FIUIHeartRateStatusView *)self _suspendAnimations];
  animatingImageView = self->_animatingImageView;
  [(FIUIAnimatingSpriteImageView *)animatingImageView setSpriteImage:0];
}

- (BOOL)animationsSuspended
{
  return self->_animationsSuspended;
}

- (void)setReloadOutlineView:(id)a3
{
}

- (UIImageView)animationSuspendedMeasuringView
{
  return self->_animationSuspendedMeasuringView;
}

- (void)setAnimationSuspendedMeasuringView:(id)a3
{
}

- (void)setReloadArrowView:(id)a3
{
}

- (void)_loadHeartMeasuringImage
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_21E433000, log, OS_LOG_TYPE_ERROR, "Error reading heart image named %@ in bundle %@", (uint8_t *)&v5, 0x16u);
}

@end