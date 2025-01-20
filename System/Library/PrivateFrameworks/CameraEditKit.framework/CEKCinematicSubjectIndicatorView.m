@interface CEKCinematicSubjectIndicatorView
+ (CGRect)minimumSuggestedBounds;
+ (id)_cornerImageWithResizableCapInsetsNamed:(id)a3;
- (BOOL)_crosshairsVisible;
- (CEKCinematicSubjectIndicatorView)initWithFrame:(CGRect)a3;
- (UIImageView)_bottomCrosshairView;
- (UIImageView)_bottomLeftCornerView;
- (UIImageView)_bottomRightCornerView;
- (UIImageView)_leftCrosshairView;
- (UIImageView)_rightCrosshairView;
- (UIImageView)_topCrosshairView;
- (UIImageView)_topLeftCornerView;
- (UIImageView)_topRightCornerView;
- (UIView)_containerView;
- (int)_activeAnimationToActiveRoundedRectCount;
- (int64_t)shape;
- (void)_performAnimationToActiveCorners;
- (void)_performAnimationToActiveRoundedRect;
- (void)_updateCornerImageViewsForThickness:(int64_t)a3 duration:(double)a4 delay:(double)a5;
- (void)_updateCornerViews;
- (void)_updateCrossHairViewsWithHeight:(double)a3;
- (void)_updateVisibility;
- (void)layoutSubviews;
- (void)setShape:(int64_t)a3;
- (void)setShape:(int64_t)a3 animated:(BOOL)a4;
- (void)setShape:(int64_t)a3 shouldUseCrosshairForAnimation:(BOOL)a4 animated:(BOOL)a5;
- (void)set_activeAnimationToActiveRoundedRectCount:(int)a3;
- (void)set_crosshairsVisible:(BOOL)a3;
@end

@implementation CEKCinematicSubjectIndicatorView

- (CEKCinematicSubjectIndicatorView)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)CEKCinematicSubjectIndicatorView;
  v3 = -[CEKCinematicSubjectIndicatorView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    containerView = v3->__containerView;
    v3->__containerView = v4;

    [(CEKCinematicSubjectIndicatorView *)v3 addSubview:v3->__containerView];
    v6 = (void *)MEMORY[0x1E4FB1818];
    v7 = CEKFrameworkBundle();
    v8 = [v6 imageNamed:@"CEKSubjectIndicatorCrossHair" inBundle:v7];

    v9 = objc_msgSend(v8, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, 0.0, 4.0, 0.0);

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v9];
    topCrosshairView = v3->__topCrosshairView;
    v3->__topCrosshairView = (UIImageView *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v9];
    leftCrosshairView = v3->__leftCrosshairView;
    v3->__leftCrosshairView = (UIImageView *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v9];
    bottomCrosshairView = v3->__bottomCrosshairView;
    v3->__bottomCrosshairView = (UIImageView *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v9];
    rightCrosshairView = v3->__rightCrosshairView;
    v3->__rightCrosshairView = (UIImageView *)v16;

    [(UIView *)v3->__containerView addSubview:v3->__topCrosshairView];
    [(UIView *)v3->__containerView addSubview:v3->__leftCrosshairView];
    [(UIView *)v3->__containerView addSubview:v3->__bottomCrosshairView];
    [(UIView *)v3->__containerView addSubview:v3->__rightCrosshairView];
    v18 = [(id)objc_opt_class() _cornerImageWithResizableCapInsetsNamed:@"CEKCinematicSubjectIndicatorCornerInactiveThin"];
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v18];
    topLeftCornerView = v3->__topLeftCornerView;
    v3->__topLeftCornerView = (UIImageView *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v18];
    topRightCornerView = v3->__topRightCornerView;
    v3->__topRightCornerView = (UIImageView *)v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v18];
    bottomLeftCornerView = v3->__bottomLeftCornerView;
    v3->__bottomLeftCornerView = (UIImageView *)v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v18];
    bottomRightCornerView = v3->__bottomRightCornerView;
    v3->__bottomRightCornerView = (UIImageView *)v25;

    [(UIView *)v3->__containerView addSubview:v3->__topLeftCornerView];
    [(UIView *)v3->__containerView addSubview:v3->__topRightCornerView];
    [(UIView *)v3->__containerView addSubview:v3->__bottomLeftCornerView];
    [(UIView *)v3->__containerView addSubview:v3->__bottomRightCornerView];
    v3->_shape = 0;
    v3->__crosshairsVisible = 0;
    v3->__activeAnimationToActiveRoundedRectCount = 0;
    v27 = v3;
  }
  return v3;
}

+ (id)_cornerImageWithResizableCapInsetsNamed:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1818];
  id v4 = a3;
  v5 = CEKFrameworkBundle();
  v6 = [v3 imageNamed:v4 inBundle:v5];

  [v6 size];
  v8 = objc_msgSend(v6, "resizableImageWithCapInsets:resizingMode:", 1, v7 + -1.0, v7 + -1.0, 0.0, 0.0);

  return v8;
}

- (void)setShape:(int64_t)a3
{
}

- (void)setShape:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)setShape:(int64_t)a3 shouldUseCrosshairForAnimation:(BOOL)a4 animated:(BOOL)a5
{
  if (self->_shape == a3) {
    return;
  }
  BOOL v5 = a5;
  BOOL v6 = a4;
  v9 = [(CEKCinematicSubjectIndicatorView *)self _topCrosshairView];
  uint64_t v10 = [v9 layer];
  [v10 removeAllAnimations];

  v11 = [(CEKCinematicSubjectIndicatorView *)self _leftCrosshairView];
  uint64_t v12 = [v11 layer];
  [v12 removeAllAnimations];

  v13 = [(CEKCinematicSubjectIndicatorView *)self _bottomCrosshairView];
  uint64_t v14 = [v13 layer];
  [v14 removeAllAnimations];

  v15 = [(CEKCinematicSubjectIndicatorView *)self _rightCrosshairView];
  uint64_t v16 = [v15 layer];
  [v16 removeAllAnimations];

  v17 = [(CEKCinematicSubjectIndicatorView *)self _topLeftCornerView];
  v18 = [v17 layer];
  [v18 removeAllAnimations];

  uint64_t v19 = [(CEKCinematicSubjectIndicatorView *)self _topRightCornerView];
  v20 = [v19 layer];
  [v20 removeAllAnimations];

  uint64_t v21 = [(CEKCinematicSubjectIndicatorView *)self _bottomRightCornerView];
  v22 = [v21 layer];
  [v22 removeAllAnimations];

  uint64_t v23 = [(CEKCinematicSubjectIndicatorView *)self _bottomLeftCornerView];
  v24 = [v23 layer];
  [v24 removeAllAnimations];

  if (v5) {
    [(CEKCinematicSubjectIndicatorView *)self layoutIfNeeded];
  }
  self->_shape = a3;
  if (a3 == 2)
  {
    [(CEKCinematicSubjectIndicatorView *)self set_crosshairsVisible:0];
    if (v5)
    {
      [(CEKCinematicSubjectIndicatorView *)self _performAnimationToActiveCorners];
      return;
    }
    v27 = self;
    uint64_t v28 = 0;
LABEL_21:
    [(CEKCinematicSubjectIndicatorView *)v27 _updateCornerImageViewsForThickness:v28 duration:0.0 delay:0.0];
    [(CEKCinematicSubjectIndicatorView *)self setNeedsLayout];
    return;
  }
  if (a3 != 1)
  {
    if (a3) {
      return;
    }
    [(CEKCinematicSubjectIndicatorView *)self set_crosshairsVisible:0];
    [(CEKCinematicSubjectIndicatorView *)self _updateCornerImageViewsForThickness:1 duration:0.0 delay:0.0];
    [(CEKCinematicSubjectIndicatorView *)self setNeedsLayout];
    if (!v5) {
      return;
    }
    uint64_t v25 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = __85__CEKCinematicSubjectIndicatorView_setShape_shouldUseCrosshairForAnimation_animated___block_invoke;
    v37 = &unk_1E63CD380;
    v38 = self;
    v26 = &v34;
LABEL_25:
    objc_msgSend(v25, "animateWithDuration:delay:options:animations:completion:", 2, v26, 0, 0.2, 0.0, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38);
    return;
  }
  if (!v5)
  {
    v27 = self;
    uint64_t v28 = 1;
    goto LABEL_21;
  }
  if (!v6)
  {
    [(CEKCinematicSubjectIndicatorView *)self _updateCornerImageViewsForThickness:1 duration:0.0 delay:0.0];
    [(CEKCinematicSubjectIndicatorView *)self setNeedsLayout];
    uint64_t v25 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __85__CEKCinematicSubjectIndicatorView_setShape_shouldUseCrosshairForAnimation_animated___block_invoke_2;
    v32 = &unk_1E63CD380;
    v33 = self;
    v26 = &v29;
    goto LABEL_25;
  }
  [(CEKCinematicSubjectIndicatorView *)self _performAnimationToActiveRoundedRect];
}

uint64_t __85__CEKCinematicSubjectIndicatorView_setShape_shouldUseCrosshairForAnimation_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __85__CEKCinematicSubjectIndicatorView_setShape_shouldUseCrosshairForAnimation_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_updateCornerImageViewsForThickness:(int64_t)a3 duration:(double)a4 delay:(double)a5
{
  int64_t v9 = [(CEKCinematicSubjectIndicatorView *)self shape];
  if (a3 == 2)
  {
    uint64_t v10 = @"CEKSubjectIndicatorCornerActiveThick";
    v11 = @"CEKCinematicSubjectIndicatorCornerInactiveThick";
  }
  else if (a3 == 1)
  {
    uint64_t v10 = @"CEKSubjectIndicatorCornerActiveThin";
    v11 = @"CEKCinematicSubjectIndicatorCornerInactiveThin";
  }
  else
  {
    if (a3)
    {
      uint64_t v12 = &stru_1F1A048B0;
      goto LABEL_11;
    }
    uint64_t v10 = @"CEKSubjectIndicatorCornerActive";
    v11 = @"CEKCinematicSubjectIndicatorCornerInactive";
  }
  if (!v9) {
    uint64_t v10 = v11;
  }
  uint64_t v12 = v10;
LABEL_11:
  uint64_t v30 = v12;
  v13 = [(id)objc_opt_class() _cornerImageWithResizableCapInsetsNamed:v12];
  uint64_t v14 = [(CEKCinematicSubjectIndicatorView *)self _topLeftCornerView];
  v15 = [v14 image];

  if (a4 != 0.0)
  {
    uint64_t v16 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"contents"];
    v17 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    [v16 setTimingFunction:v17];

    [v16 setDuration:a4];
    [v16 setBeginTime:CACurrentMediaTime() + a5];
    objc_msgSend(v16, "setFromValue:", objc_msgSend(v15, "CGImage"));
    objc_msgSend(v16, "setToValue:", objc_msgSend(v13, "CGImage"));
    [v16 setDelegate:self];
    [v16 setFillMode:*MEMORY[0x1E4F39F98]];
    v18 = [(CEKCinematicSubjectIndicatorView *)self _topLeftCornerView];
    uint64_t v19 = [v18 layer];
    [v19 addAnimation:v16 forKey:@"animateContents"];

    v20 = [(CEKCinematicSubjectIndicatorView *)self _topRightCornerView];
    uint64_t v21 = [v20 layer];
    [v21 addAnimation:v16 forKey:@"animateContents"];

    v22 = [(CEKCinematicSubjectIndicatorView *)self _bottomLeftCornerView];
    uint64_t v23 = [v22 layer];
    [v23 addAnimation:v16 forKey:@"animateContents"];

    v24 = [(CEKCinematicSubjectIndicatorView *)self _bottomRightCornerView];
    uint64_t v25 = [v24 layer];
    [v25 addAnimation:v16 forKey:@"animateContents"];
  }
  v26 = [(CEKCinematicSubjectIndicatorView *)self _topLeftCornerView];
  [v26 setImage:v13];

  v27 = [(CEKCinematicSubjectIndicatorView *)self _topRightCornerView];
  [v27 setImage:v13];

  uint64_t v28 = [(CEKCinematicSubjectIndicatorView *)self _bottomLeftCornerView];
  [v28 setImage:v13];

  uint64_t v29 = [(CEKCinematicSubjectIndicatorView *)self _bottomRightCornerView];
  [v29 setImage:v13];
}

- (void)_performAnimationToActiveCorners
{
  v3 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationTimingFunction:v3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__CEKCinematicSubjectIndicatorView__performAnimationToActiveCorners__block_invoke;
  v5[3] = &unk_1E63CD380;
  v5[4] = self;
  [MEMORY[0x1E4FB1EB0] animateKeyframesWithDuration:2 delay:v5 options:0 animations:0.45 completion:0.0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__CEKCinematicSubjectIndicatorView__performAnimationToActiveCorners__block_invoke_4;
  v4[3] = &unk_1E63CD380;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v4 options:0 animations:0.2 completion:0.0];
  [(CEKCinematicSubjectIndicatorView *)self _updateCornerImageViewsForThickness:1 duration:0.2 delay:0.0];
  [(CEKCinematicSubjectIndicatorView *)self _updateCornerImageViewsForThickness:0 duration:0.25 delay:0.15];
  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __68__CEKCinematicSubjectIndicatorView__performAnimationToActiveCorners__block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__CEKCinematicSubjectIndicatorView__performAnimationToActiveCorners__block_invoke_2;
  v4[3] = &unk_1E63CD380;
  v4[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v4 relativeDuration:0.0 animations:0.45];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__CEKCinematicSubjectIndicatorView__performAnimationToActiveCorners__block_invoke_3;
  v3[3] = &unk_1E63CD380;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v3 relativeDuration:0.45 animations:0.55];
}

void __68__CEKCinematicSubjectIndicatorView__performAnimationToActiveCorners__block_invoke_2(uint64_t a1)
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v5.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v5.c = v2;
  *(_OWORD *)&v5.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformScale(&v6, &v5, 1.1, 1.1);
  v3 = [*(id *)(a1 + 32) _containerView];
  CGAffineTransform v4 = v6;
  [v3 setTransform:&v4];
}

void __68__CEKCinematicSubjectIndicatorView__performAnimationToActiveCorners__block_invoke_3(uint64_t a1)
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v5.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v5.c = v2;
  *(_OWORD *)&v5.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformScale(&v6, &v5, 1.0, 1.0);
  v3 = [*(id *)(a1 + 32) _containerView];
  CGAffineTransform v4 = v6;
  [v3 setTransform:&v4];
}

uint64_t __68__CEKCinematicSubjectIndicatorView__performAnimationToActiveCorners__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCornerViews];
  long long v2 = *(void **)(a1 + 32);
  return [v2 _updateVisibility];
}

- (void)_performAnimationToActiveRoundedRect
{
  [(CEKCinematicSubjectIndicatorView *)self set_activeAnimationToActiveRoundedRectCount:[(CEKCinematicSubjectIndicatorView *)self _activeAnimationToActiveRoundedRectCount]+ 1];
  [(CEKCinematicSubjectIndicatorView *)self set_crosshairsVisible:1];
  [(CEKCinematicSubjectIndicatorView *)self _updateCrossHairViewsWithHeight:0.0];
  v3 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationTimingFunction:v3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke;
  v8[3] = &unk_1E63CD380;
  v8[4] = self;
  [MEMORY[0x1E4FB1EB0] animateKeyframesWithDuration:2 delay:v8 options:0 animations:0.45 completion:0.0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_4;
  v7[3] = &unk_1E63CD380;
  v7[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:6 delay:v7 options:0 animations:0.2 completion:0.0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_5;
  v6[3] = &unk_1E63CD380;
  v6[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:6 delay:v6 options:0 animations:0.15 completion:0.05];
  v4[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_6;
  v5[3] = &unk_1E63CD380;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_7;
  v4[3] = &unk_1E63CD3F0;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:6 delay:v5 options:v4 animations:0.3 completion:1.3];
  [(CEKCinematicSubjectIndicatorView *)self _updateCornerImageViewsForThickness:0 duration:0.15 delay:0.15];
  [(CEKCinematicSubjectIndicatorView *)self _updateCornerImageViewsForThickness:1 duration:0.3 delay:1.3];
  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_2;
  v4[3] = &unk_1E63CD380;
  v4[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v4 relativeDuration:0.0 animations:0.45];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_3;
  v3[3] = &unk_1E63CD380;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v3 relativeDuration:0.45 animations:0.55];
}

void __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_2(uint64_t a1)
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v5.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v5.c = v2;
  *(_OWORD *)&v5.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformScale(&v6, &v5, 1.1, 1.1);
  v3 = [*(id *)(a1 + 32) _containerView];
  CGAffineTransform v4 = v6;
  [v3 setTransform:&v4];
}

void __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_3(uint64_t a1)
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v5.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v5.c = v2;
  *(_OWORD *)&v5.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformScale(&v6, &v5, 1.0, 1.0);
  v3 = [*(id *)(a1 + 32) _containerView];
  CGAffineTransform v4 = v6;
  [v3 setTransform:&v4];
}

uint64_t __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCornerViews];
}

uint64_t __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCrossHairViewsWithHeight:14.0];
}

uint64_t __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCrossHairViewsWithHeight:0.0];
}

uint64_t __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_activeAnimationToActiveRoundedRectCount:", objc_msgSend(*(id *)(a1 + 32), "_activeAnimationToActiveRoundedRectCount") - 1);
  uint64_t result = [*(id *)(a1 + 32) _activeAnimationToActiveRoundedRectCount];
  if (!result)
  {
    objc_msgSend(*(id *)(a1 + 32), "set_crosshairsVisible:", 0);
    v3 = *(void **)(a1 + 32);
    return [v3 setNeedsLayout];
  }
  return result;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)CEKCinematicSubjectIndicatorView;
  [(CEKCinematicSubjectIndicatorView *)&v15 layoutSubviews];
  [(CEKCinematicSubjectIndicatorView *)self bounds];
  double x = v16.origin.x;
  double y = v16.origin.y;
  double width = v16.size.width;
  double height = v16.size.height;
  CGRectGetMidX(v16);
  UIRoundToViewScale();
  double v8 = v7;
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  CGRectGetMidY(v17);
  UIRoundToViewScale();
  double v10 = v9;
  v11 = [(CEKCinematicSubjectIndicatorView *)self _containerView];
  objc_msgSend(v11, "setBounds:", x + -3.0, y + -3.0, width + 6.0, height + 6.0);
  objc_msgSend(v11, "setCenter:", v8, v10);
  [(CEKCinematicSubjectIndicatorView *)self _updateCornerViews];
  uint64_t v12 = [(CEKCinematicSubjectIndicatorView *)self _topCrosshairView];
  v13 = [v12 image];
  [v13 size];
  [(CEKCinematicSubjectIndicatorView *)self _updateCrossHairViewsWithHeight:v14];

  [(CEKCinematicSubjectIndicatorView *)self _updateVisibility];
}

- (void)_updateCornerViews
{
  [(CEKCinematicSubjectIndicatorView *)self bounds];
  double v4 = v3 + 6.0;
  double v6 = v5 + 6.0;
  double v7 = [(CEKCinematicSubjectIndicatorView *)self _topLeftCornerView];
  double v8 = [v7 image];
  [v8 size];
  double v10 = v9;
  double v12 = v11;

  unint64_t v13 = [(CEKCinematicSubjectIndicatorView *)self shape];
  if (v13 < 2)
  {
    UIRoundToViewScale();
    double v15 = v14;
    UIRoundToViewScale();
    double v17 = v16;
    double v18 = 0.0;
    double v19 = v16;
    double v20 = v15;
LABEL_15:
    double v23 = 0.0;
    goto LABEL_16;
  }
  if (v13 == 2)
  {
    if (v4 >= v6) {
      double v21 = v6;
    }
    else {
      double v21 = v4;
    }
    double v22 = v21 * 0.5;
    if (v12 >= v22) {
      double v19 = v22;
    }
    else {
      double v19 = v12;
    }
    if (v10 >= v22) {
      double v20 = v22;
    }
    else {
      double v20 = v10;
    }
    double v15 = v4 - v20;
    double v17 = v6 - v19;
    double v18 = 0.0;
    goto LABEL_15;
  }
  double v15 = *MEMORY[0x1E4F1DB28];
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v18 = v17;
  double v23 = *MEMORY[0x1E4F1DB28];
LABEL_16:
  v24 = [(CEKCinematicSubjectIndicatorView *)self _topLeftCornerView];
  objc_msgSend(v24, "setFrame:", v23, v18, v20, v19);

  uint64_t v25 = [(CEKCinematicSubjectIndicatorView *)self _topRightCornerView];
  objc_msgSend(v25, "setFrame:", v15, v18, v20, v19);

  v26 = [(CEKCinematicSubjectIndicatorView *)self _bottomLeftCornerView];
  objc_msgSend(v26, "setFrame:", v23, v17, v20, v19);

  v27 = [(CEKCinematicSubjectIndicatorView *)self _bottomRightCornerView];
  objc_msgSend(v27, "setFrame:", v15, v17, v20, v19);

  CGAffineTransformMakeScale(&v36, -1.0, 1.0);
  uint64_t v28 = [(CEKCinematicSubjectIndicatorView *)self _topRightCornerView];
  CGAffineTransform v35 = v36;
  [v28 setTransform:&v35];

  CGAffineTransformMakeScale(&v34, 1.0, -1.0);
  uint64_t v29 = [(CEKCinematicSubjectIndicatorView *)self _bottomLeftCornerView];
  CGAffineTransform v33 = v34;
  [v29 setTransform:&v33];

  CGAffineTransformMakeScale(&v32, -1.0, -1.0);
  uint64_t v30 = [(CEKCinematicSubjectIndicatorView *)self _bottomRightCornerView];
  CGAffineTransform v31 = v32;
  [v30 setTransform:&v31];
}

- (void)_updateCrossHairViewsWithHeight:(double)a3
{
  [(CEKCinematicSubjectIndicatorView *)self bounds];
  double v5 = [(CEKCinematicSubjectIndicatorView *)self _topCrosshairView];
  double v6 = [v5 image];
  [v6 size];
  double v8 = v7;

  UIRoundToViewScale();
  UIRoundToViewScale();
  UIRoundToViewScale();
  UIRoundToViewScale();
  double v9 = [(CEKCinematicSubjectIndicatorView *)self _topCrosshairView];
  objc_msgSend(v9, "setBounds:", 0.0, 0.0, v8, a3);

  double v10 = [(CEKCinematicSubjectIndicatorView *)self _bottomCrosshairView];
  objc_msgSend(v10, "setBounds:", 0.0, 0.0, v8, a3);

  double v11 = [(CEKCinematicSubjectIndicatorView *)self _leftCrosshairView];
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v8, a3);

  double v12 = [(CEKCinematicSubjectIndicatorView *)self _rightCrosshairView];
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v8, a3);

  UIRectGetCenter();
  double v14 = v13;
  double v16 = v15;
  double v17 = [(CEKCinematicSubjectIndicatorView *)self _topCrosshairView];
  objc_msgSend(v17, "setCenter:", v14, v16);

  UIRectGetCenter();
  double v19 = v18;
  double v21 = v20;
  double v22 = [(CEKCinematicSubjectIndicatorView *)self _bottomCrosshairView];
  objc_msgSend(v22, "setCenter:", v19, v21);

  UIRectGetCenter();
  double v24 = v23;
  double v26 = v25;
  v27 = [(CEKCinematicSubjectIndicatorView *)self _leftCrosshairView];
  objc_msgSend(v27, "setCenter:", v24, v26);

  UIRectGetCenter();
  double v29 = v28;
  double v31 = v30;
  CGAffineTransform v32 = [(CEKCinematicSubjectIndicatorView *)self _rightCrosshairView];
  objc_msgSend(v32, "setCenter:", v29, v31);

  CGAffineTransformMakeRotation(&v41, 3.14159265);
  CGAffineTransform v33 = [(CEKCinematicSubjectIndicatorView *)self _bottomCrosshairView];
  CGAffineTransform v40 = v41;
  [v33 setTransform:&v40];

  CGAffineTransformMakeRotation(&v39, 4.71238898);
  CGAffineTransform v34 = [(CEKCinematicSubjectIndicatorView *)self _leftCrosshairView];
  CGAffineTransform v38 = v39;
  [v34 setTransform:&v38];

  CGAffineTransformMakeRotation(&v37, 1.57079633);
  CGAffineTransform v35 = [(CEKCinematicSubjectIndicatorView *)self _rightCrosshairView];
  CGAffineTransform v36 = v37;
  [v35 setTransform:&v36];
}

- (void)_updateVisibility
{
  uint64_t v3 = [(CEKCinematicSubjectIndicatorView *)self _crosshairsVisible] ^ 1;
  double v4 = [(CEKCinematicSubjectIndicatorView *)self _topCrosshairView];
  [v4 setHidden:v3];

  double v5 = [(CEKCinematicSubjectIndicatorView *)self _bottomCrosshairView];
  [v5 setHidden:v3];

  double v6 = [(CEKCinematicSubjectIndicatorView *)self _leftCrosshairView];
  [v6 setHidden:v3];

  id v7 = [(CEKCinematicSubjectIndicatorView *)self _rightCrosshairView];
  [v7 setHidden:v3];
}

+ (CGRect)minimumSuggestedBounds
{
  double v2 = 50.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 50.0;
  result.size.double height = v5;
  result.size.double width = v2;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (int64_t)shape
{
  return self->_shape;
}

- (UIImageView)_topLeftCornerView
{
  return self->__topLeftCornerView;
}

- (UIImageView)_topRightCornerView
{
  return self->__topRightCornerView;
}

- (UIImageView)_bottomLeftCornerView
{
  return self->__bottomLeftCornerView;
}

- (UIImageView)_bottomRightCornerView
{
  return self->__bottomRightCornerView;
}

- (UIImageView)_topCrosshairView
{
  return self->__topCrosshairView;
}

- (UIImageView)_leftCrosshairView
{
  return self->__leftCrosshairView;
}

- (UIImageView)_bottomCrosshairView
{
  return self->__bottomCrosshairView;
}

- (UIImageView)_rightCrosshairView
{
  return self->__rightCrosshairView;
}

- (UIView)_containerView
{
  return self->__containerView;
}

- (BOOL)_crosshairsVisible
{
  return self->__crosshairsVisible;
}

- (void)set_crosshairsVisible:(BOOL)a3
{
  self->__crosshairsVisible = a3;
}

- (int)_activeAnimationToActiveRoundedRectCount
{
  return self->__activeAnimationToActiveRoundedRectCount;
}

- (void)set_activeAnimationToActiveRoundedRectCount:(int)a3
{
  self->__activeAnimationToActiveRoundedRectCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__containerView, 0);
  objc_storeStrong((id *)&self->__rightCrosshairView, 0);
  objc_storeStrong((id *)&self->__bottomCrosshairView, 0);
  objc_storeStrong((id *)&self->__leftCrosshairView, 0);
  objc_storeStrong((id *)&self->__topCrosshairView, 0);
  objc_storeStrong((id *)&self->__bottomRightCornerView, 0);
  objc_storeStrong((id *)&self->__bottomLeftCornerView, 0);
  objc_storeStrong((id *)&self->__topRightCornerView, 0);
  objc_storeStrong((id *)&self->__topLeftCornerView, 0);
}

@end