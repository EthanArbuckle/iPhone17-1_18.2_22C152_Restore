@interface ETColorPickerView
- (BOOL)_isCenterCircle:(unint64_t)a3;
- (BOOL)isExpanded;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (ETColorPickerView)initWithFrame:(CGRect)a3 collapsedFrame:(CGRect)a4;
- (ETColorPickerViewDelegate)presentationDelegate;
- (id)paletteCircleAnimationPairs;
- (void)_addRotationAnimationFromAngle:(double)a3 toAngle:(double)a4;
- (void)_dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)animateOffscreen;
- (void)animateOnscreen;
- (void)animateToGray;
- (void)animateToSelectedColor;
- (void)colorWheel:(id)a3 didPickColor:(id)a4;
- (void)colorWheel:(id)a3 willPickColor:(id)a4;
- (void)dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)fadeinPaletteCircle:(id)a3 delay:(double)a4;
- (void)fadeinPaletterCirclesInPairs;
- (void)fadeoutPaletteCircle:(id)a3 delay:(double)a4;
- (void)fadeoutPaletterCirclesInPairs;
- (void)layoutPaletteCircles;
- (void)movePalettCircleToOriginalLayoutPosition:(id)a3;
- (void)movePaletteCircleTowardsViewCenter:(id)a3 distance:(double)a4;
- (void)paletteCircleTapped:(id)a3;
- (void)presentAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentTapReceived:(id)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)showColorWheel;
- (void)transformPickerCircleToSelectionMarkerWithCompletion:(id)a3;
- (void)transformSelectionMarkerToPickerCircleWithCompletion:(id)a3;
@end

@implementation ETColorPickerView

- (ETColorPickerView)initWithFrame:(CGRect)a3 collapsedFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  v27.receiver = self;
  v27.super_class = (Class)ETColorPickerView;
  v12 = -[DTSColorPicker initWithFrame:](&v27, sel_initWithFrame_);
  if (v12)
  {
    if (SetupSpecValuesIfNeeded_onceToken != -1) {
      dispatch_once(&SetupSpecValuesIfNeeded_onceToken, &__block_literal_global);
    }
    v12->_expandedFrame.origin.CGFloat x = v11;
    v12->_expandedFrame.origin.CGFloat y = v10;
    v12->_expandedFrame.size.CGFloat width = v9;
    v12->_expandedFrame.size.CGFloat height = v8;
    v12->_collapsedFrame.origin.CGFloat x = x;
    v12->_collapsedFrame.origin.CGFloat y = y;
    v12->_collapsedFrame.size.CGFloat width = width;
    v12->_collapsedFrame.size.CGFloat height = height;
    id v13 = objc_alloc(MEMORY[0x263F1CB60]);
    [(ETColorPickerView *)v12 bounds];
    uint64_t v14 = objc_msgSend(v13, "initWithFrame:");
    contentView = v12->_contentView;
    v12->_contentView = (UIView *)v14;

    [(ETColorPickerView *)v12 addSubview:v12->_contentView];
    uint64_t v16 = [objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v12 action:sel_presentTapReceived_];
    presentTapGestureRecognizer = v12->_presentTapGestureRecognizer;
    v12->_presentTapGestureRecognizer = (UITapGestureRecognizer *)v16;

    [(ETColorPickerView *)v12 addGestureRecognizer:v12->_presentTapGestureRecognizer];
    [(DTSColorPicker *)v12 createPaletteCirclesWithParentView:v12->_contentView];
    [(ETColorPickerView *)v12 layoutPaletteCircles];
    [(UIView *)v12->_contentView bounds];
    CGFloat v18 = v28.origin.x;
    CGFloat v19 = v28.origin.y;
    CGFloat v20 = v28.size.width;
    CGFloat v21 = v28.size.height;
    double v22 = CGRectGetWidth(v28);
    v23 = -[ETColorWheelView initWithFrame:]([ETColorWheelView alloc], "initWithFrame:", 0.0, 0.0, v22, v22);
    colorWheelView = v12->_colorWheelView;
    v12->_colorWheelView = v23;

    [(DTSColorWheel *)v12->_colorWheelView setDelegate:v12];
    v29.origin.CGFloat x = v18;
    v29.origin.CGFloat y = v19;
    v29.size.CGFloat width = v20;
    v29.size.CGFloat height = v21;
    double MidX = CGRectGetMidX(v29);
    v30.origin.CGFloat x = v18;
    v30.origin.CGFloat y = v19;
    v30.size.CGFloat width = v20;
    v30.size.CGFloat height = v21;
    -[ETColorWheelView setCenter:](v12->_colorWheelView, "setCenter:", MidX, CGRectGetMidY(v30));
    [(UIView *)v12->_contentView addSubview:v12->_colorWheelView];
    [(ETColorPickerView *)v12 _dismissAnimated:0 completion:0];
  }
  return v12;
}

- (void)layoutPaletteCircles
{
  [(UIView *)self->_contentView bounds];
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  double MidX = CGRectGetMidX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v26);
  CGFloat v9 = +[ETColorStore defaultStore];
  CGFloat v10 = [v9 colors];
  uint64_t v11 = [v10 count];

  uint64_t v12 = v11 - 1;
  id v23 = [(DTSColorPicker *)self paletteCircles];
  if (v11 != 1)
  {
    unint64_t v13 = 0;
    do
    {
      +[ETPaletteCircleView paletteCircleDiameter];
      uint64_t v14 = +[ETColorStore defaultStore];
      v15 = [v14 colors];
      uint64_t v16 = [v15 count];

      __sincos_stret((double)v13 * (6.28318531 / (double)(unint64_t)(v16 - 1)) + -1.57079633);
      UIRoundToViewScale();
      double v18 = v17;
      UIRoundToViewScale();
      double v20 = v19;
      CGFloat v21 = [v23 objectAtIndexedSubscript:v13];
      objc_msgSend(v21, "setCenter:", v18, v20);

      ++v13;
    }
    while (v12 != v13);
  }
  double v22 = [v23 lastObject];
  objc_msgSend(v22, "setCenter:", MidX, MidY);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(ETColorPickerView *)self bounds];
  CGRect v11 = CGRectInset(v10, -12.0, -12.0);
  CGFloat v6 = x;
  CGFloat v7 = y;

  return CGRectContainsPoint(v11, *(CGPoint *)&v6);
}

- (void)presentTapReceived:(id)a3
{
  v4 = [(ETColorPickerView *)self presentationDelegate];
  [v4 colorPickerViewWillPresent:self duration:0.3];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__ETColorPickerView_presentTapReceived___block_invoke;
  v5[3] = &unk_264DEC6D0;
  v5[4] = self;
  [(ETColorPickerView *)self presentAnimated:1 completion:v5];
}

void __40__ETColorPickerView_presentTapReceived___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentationDelegate];
  [v2 colorPickerViewDidPresent:*(void *)(a1 + 32)];
}

- (void)presentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(UITapGestureRecognizer *)self->_presentTapGestureRecognizer setEnabled:0];
  [(ETColorPickerView *)self setIsExpanded:1];
  if (v4) {
    double v7 = 0.3;
  }
  else {
    double v7 = 0.0;
  }
  CGFloat v8 = (void *)MEMORY[0x263F1CB60];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__ETColorPickerView_presentAnimated_completion___block_invoke;
  v12[3] = &unk_264DEC6D0;
  v12[4] = self;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__ETColorPickerView_presentAnimated_completion___block_invoke_2;
  v10[3] = &unk_264DEC6A8;
  id v11 = v6;
  id v9 = v6;
  [v8 animateWithDuration:4 delay:v12 options:v10 animations:v7 completion:0.0];
}

void __48__ETColorPickerView_presentAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 464) removeFromSuperview];
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 456)];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(void *)(a1 + 32) + 480), *(double *)(*(void *)(a1 + 32) + 488), *(double *)(*(void *)(a1 + 32) + 496), *(double *)(*(void *)(a1 + 32) + 504));
  id v2 = [*(id *)(a1 + 32) paletteCircles];
  v3 = [*(id *)(a1 + 32) selectedCircle];
  if ((objc_msgSend(*(id *)(a1 + 32), "_isCenterCircle:", objc_msgSend(v2, "indexOfObject:", v3)) & 1) == 0) {
    [*(id *)(a1 + 32) _addRotationAnimationFromAngle:*(double *)(*(void *)(a1 + 32) + 560) toAngle:0.0];
  }
  BOOL v4 = *(void **)(*(void *)(a1 + 32) + 456);
  long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v18[0] = *MEMORY[0x263F000D0];
  v18[1] = v5;
  v18[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v4 setTransform:v18];
  [*(id *)(*(void *)(a1 + 32) + 456) frame];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 456), "setCenter:", v6 * 0.5, v7 * 0.5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v2;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (v13 != v3) {
          objc_msgSend(v13, "setAlpha:", 1.0, (void)v14);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }
}

uint64_t __48__ETColorPickerView_presentAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(ETColorPickerView *)self isExpanded])
  {
    double v7 = [(ETColorPickerView *)self presentationDelegate];
    [v7 colorPickerView:self willDismissAnimated:v4 duration:0.3];

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__ETColorPickerView_dismissAnimated_completion___block_invoke;
    v8[3] = &unk_264DEC738;
    v8[4] = self;
    id v9 = v6;
    [(ETColorPickerView *)self _dismissAnimated:v4 completion:v8];
  }
}

uint64_t __48__ETColorPickerView_dismissAnimated_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentationDelegate];
  [v2 colorPickerViewDidDismiss:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    uint64_t result = (*(uint64_t (**)(void))(result + 16))();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 552) = 0;
  return result;
}

- (void)_addRotationAnimationFromAngle:(double)a3 toAngle:(double)a4
{
  double v7 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.z"];
  [v7 setDuration:0.3];
  [v7 setAdditive:1];
  [v7 setRemovedOnCompletion:0];
  [v7 setFillMode:*MEMORY[0x263F15AB0]];
  *(float *)&double v8 = a3;
  id v9 = [NSNumber numberWithFloat:v8];
  [v7 setFromValue:v9];

  *(float *)&double v10 = a4;
  uint64_t v11 = [NSNumber numberWithFloat:v10];
  [v7 setToValue:v11];

  uint64_t v12 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v7 setTimingFunction:v12];

  [MEMORY[0x263F158F8] begin];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__ETColorPickerView__addRotationAnimationFromAngle_toAngle___block_invoke;
  v14[3] = &unk_264DEC6D0;
  v14[4] = self;
  [MEMORY[0x263F158F8] setCompletionBlock:v14];
  unint64_t v13 = [(UIView *)self->_contentView layer];
  [v13 addAnimation:v7 forKey:@"ColorPickerRotationAnimationKey"];

  [MEMORY[0x263F158F8] commit];
}

void __60__ETColorPickerView__addRotationAnimationFromAngle_toAngle___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 456) layer];
  [v1 removeAnimationForKey:@"ColorPickerRotationAnimationKey"];
}

- (void)_dismissAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (([(ETColorWheelView *)self->_colorWheelView isHidden] & 1) == 0)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __49__ETColorPickerView__dismissAnimated_completion___block_invoke;
    v20[3] = &unk_264DEC6D0;
    v20[4] = self;
    [MEMORY[0x263F1CB60] performWithoutAnimation:v20];
  }
  if (v4) {
    double v7 = 0.3;
  }
  else {
    double v7 = 0.0;
  }
  double v8 = [(DTSColorPicker *)self paletteCircles];
  id v9 = [(DTSColorPicker *)self selectedCircle];
  double v10 = (void *)MEMORY[0x263F1CB60];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __49__ETColorPickerView__dismissAnimated_completion___block_invoke_2;
  v17[3] = &unk_264DEC760;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__ETColorPickerView__dismissAnimated_completion___block_invoke_3;
  v14[3] = &unk_264DEC788;
  v14[4] = self;
  id v15 = v19;
  id v16 = v6;
  id v11 = v6;
  id v12 = v19;
  id v13 = v8;
  [v10 animateWithDuration:4 delay:v17 options:v14 animations:v7 completion:0.0];
}

uint64_t __49__ETColorPickerView__dismissAnimated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 544) hideColorWheelPickingColor:0];
}

void __49__ETColorPickerView__dismissAnimated_completion___block_invoke_2(id *a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  objc_msgSend(a1[4], "setFrame:", *((double *)a1[4] + 64), *((double *)a1[4] + 65), *((double *)a1[4] + 66), *((double *)a1[4] + 67));
  unint64_t v2 = [a1[5] indexOfObject:a1[6]];
  if (([a1[4] _isCenterCircle:v2] & 1) == 0)
  {
    double v3 = (double)v2;
    BOOL v4 = +[ETColorStore defaultStore];
    long long v5 = [v4 colors];
    uint64_t v6 = [v5 count];

    *((double *)a1[4] + 70) = -(v3 * (6.28318531 / (double)(unint64_t)(v6 - 1)) + -1.57079633 + 1.57079633);
    [a1[4] _addRotationAnimationFromAngle:0.0 toAngle:*((double *)a1[4] + 70)];
  }
  [*((id *)a1[4] + 57) frame];
  CGFloat v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if ([a1[4] _shouldReverseLayoutDirection])
  {
    v53.origin.CGFloat x = v8;
    v53.origin.CGFloat y = v10;
    v53.size.CGFloat width = v12;
    v53.size.CGFloat height = v14;
    CGFloat v15 = CGRectGetWidth(v53) * -0.5;
    double v16 = CGRectGetMinX(*((CGRect *)a1[4] + 16)) + v15;
  }
  else
  {
    double v16 = CGRectGetMidX(*((CGRect *)a1[4] + 16)) * -0.5;
  }
  objc_msgSend(*((id *)a1[4] + 57), "setFrame:", v16, v10, v12, v14);
  [a1[6] frame];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  double Width = CGRectGetWidth(*((CGRect *)a1[4] + 16));
  v54.origin.CGFloat x = v18;
  v54.origin.CGFloat y = v20;
  v54.size.CGFloat width = v22;
  v54.size.CGFloat height = v24;
  CGFloat v26 = Width / CGRectGetWidth(v54);
  double Height = CGRectGetHeight(*((CGRect *)a1[4] + 16));
  v55.origin.CGFloat x = v18;
  v55.origin.CGFloat y = v20;
  v55.size.CGFloat width = v22;
  v55.size.CGFloat height = v24;
  memset(&v50, 0, sizeof(v50));
  double v28 = Height / CGRectGetHeight(v55);
  CGAffineTransformMakeScale(&v50, v26, v28);
  CGRect v29 = (void *)*((void *)a1[4] + 57);
  CGAffineTransform v49 = v50;
  [v29 setTransform:&v49];
  [*((id *)a1[4] + 57) frame];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  id v36 = a1[6];
  id v37 = [a1[5] lastObject];

  double v38 = -13.0;
  if (v36 == v37)
  {
    v56.origin.CGFloat x = v18;
    v56.origin.CGFloat y = v20;
    v56.size.CGFloat width = v22;
    v56.size.CGFloat height = v24;
    double v38 = -CGRectGetMinY(v56);
  }
  objc_msgSend(*((id *)a1[4] + 57), "setFrame:", v31, v28 * v38, v33, v35);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v39 = a1[5];
  uint64_t v40 = [v39 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v46;
    do
    {
      uint64_t v43 = 0;
      do
      {
        if (*(void *)v46 != v42) {
          objc_enumerationMutation(v39);
        }
        id v44 = *(id *)(*((void *)&v45 + 1) + 8 * v43);
        if (v44 != a1[6]) {
          objc_msgSend(v44, "setAlpha:", 0.0, (void)v45);
        }
        ++v43;
      }
      while (v41 != v43);
      uint64_t v41 = [v39 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v41);
  }
}

uint64_t __49__ETColorPickerView__dismissAnimated_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 456) removeFromSuperview];
  unint64_t v2 = [ETPaletteCircleView alloc];
  double Width = CGRectGetWidth(*(CGRect *)(*(void *)(a1 + 32) + 512));
  uint64_t v4 = -[ETPaletteCircleView initWithFrame:](v2, "initWithFrame:", 0.0, 0.0, Width, CGRectGetHeight(*(CGRect *)(*(void *)(a1 + 32) + 512)));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 464);
  *(void *)(v5 + 464) = v4;

  double v7 = *(void **)(*(void *)(a1 + 32) + 464);
  CGFloat v8 = [*(id *)(a1 + 40) backgroundColor];
  [v7 setBackgroundColor:v8];

  [*(id *)(*(void *)(a1 + 32) + 464) setSelected:1];
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 464)];
  [*(id *)(a1 + 32) setIsExpanded:0];
  [*(id *)(*(void *)(a1 + 32) + 472) setEnabled:1];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    double v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

- (BOOL)_isCenterCircle:(unint64_t)a3
{
  uint64_t v4 = [(DTSColorPicker *)self paletteCircles];
  LOBYTE(a3) = [v4 count] - 1 == a3;

  return a3;
}

- (void)setDimmed:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(DTSColorPicker *)self isDimmed] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)ETColorPickerView;
    [(DTSColorPicker *)&v5 setDimmed:v3];
    if (v3) {
      [(ETColorPickerView *)self animateToGray];
    }
    else {
      [(ETColorPickerView *)self animateToSelectedColor];
    }
    [(ETColorPickerView *)self setUserInteractionEnabled:v3 ^ 1];
  }
}

- (void)animateToGray
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __34__ETColorPickerView_animateToGray__block_invoke;
  v2[3] = &unk_264DEC6D0;
  v2[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:0x20000 delay:v2 options:0 animations:0.4 completion:0.0];
}

void __34__ETColorPickerView_animateToGray__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F1C550] colorWithWhite:0.121568627 alpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 464) setBackgroundColor:v2];
}

- (void)animateToSelectedColor
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __43__ETColorPickerView_animateToSelectedColor__block_invoke;
  v2[3] = &unk_264DEC6D0;
  v2[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:0x20000 delay:v2 options:0 animations:0.4 completion:0.0];
}

void __43__ETColorPickerView_animateToSelectedColor__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) selectedCircle];
  id v2 = [v3 backgroundColor];
  [*(id *)(*(void *)(a1 + 32) + 464) setBackgroundColor:v2];
}

- (void)animateOffscreen
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__ETColorPickerView_animateOffscreen__block_invoke;
  v4[3] = &unk_264DEC6D0;
  v4[4] = self;
  id v3 = (void (**)(void))MEMORY[0x23ECC8210](v4, a2);
  if ([(ETColorPickerView *)self isExpanded]) {
    [(ETColorPickerView *)self dismissAnimated:1 completion:v3];
  }
  else {
    v3[2](v3);
  }
}

uint64_t __37__ETColorPickerView_animateOffscreen__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __37__ETColorPickerView_animateOffscreen__block_invoke_2;
  v2[3] = &unk_264DEC6D0;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F1CB60] animateWithDuration:v2 animations:0.4];
}

uint64_t __37__ETColorPickerView_animateOffscreen__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(void *)(a1 + 32) + 512), -*(double *)(*(void *)(a1 + 32) + 536), *(double *)(*(void *)(a1 + 32) + 528));
}

- (void)animateOnscreen
{
  if (![(ETColorPickerView *)self isExpanded])
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __36__ETColorPickerView_animateOnscreen__block_invoke;
    v3[3] = &unk_264DEC6D0;
    v3[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v3 animations:0 completion:0.4];
  }
}

uint64_t __36__ETColorPickerView_animateOnscreen__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(void *)(a1 + 32) + 512), *(double *)(*(void *)(a1 + 32) + 520), *(double *)(*(void *)(a1 + 32) + 528), *(double *)(*(void *)(a1 + 32) + 536));
}

- (void)paletteCircleTapped:(id)a3
{
  if (!self->_dismissingColorPicker)
  {
    self->_dismissingColorPicker = 1;
    uint64_t v4 = [a3 view];
    objc_super v5 = [(DTSColorPicker *)self selectedCircle];

    if (v5 == v4)
    {
      [(ETColorPickerView *)self dismissAnimated:1 completion:0];
    }
    else
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __41__ETColorPickerView_paletteCircleTapped___block_invoke;
      v7[3] = &unk_264DEC6D0;
      v7[4] = self;
      [(DTSColorPicker *)self selectCircle:v4 completion:v7];
    }
    uint64_t v6 = [(DTSColorPicker *)self delegate];
    [v6 colorPickerSelectedColorDidChange:self];
  }
}

uint64_t __41__ETColorPickerView_paletteCircleTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissAnimated:1 completion:0];
}

- (void)showColorWheel
{
  id v3 = [(DTSColorPicker *)self longPressRecognizer];
  [v3 setEnabled:0];

  uint64_t v4 = [(DTSColorPicker *)self selectedCircle];
  objc_super v5 = [(DTSColorPicker *)self paletteCircles];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__ETColorPickerView_showColorWheel__block_invoke;
  v8[3] = &unk_264DEC760;
  id v9 = v5;
  id v10 = v4;
  double v11 = self;
  id v6 = v4;
  id v7 = v5;
  [(ETColorPickerView *)self transformSelectionMarkerToPickerCircleWithCompletion:v8];
}

uint64_t __35__ETColorPickerView_showColorWheel__block_invoke(uint64_t a1)
{
  double v2 = (double)(unint64_t)[*(id *)(a1 + 32) indexOfObject:*(void *)(a1 + 40)];
  id v3 = +[ETColorStore defaultStore];
  uint64_t v4 = [v3 colors];
  uint64_t v5 = [v4 count];

  [*(id *)(*(void *)(a1 + 48) + 544) showColorWheelFromPaletteCircle:*(void *)(a1 + 40) rotation:v2 * (6.28318531 / (double)(unint64_t)(v5 - 1)) + -1.57079633];
  id v6 = *(void **)(a1 + 48);

  return [v6 fadeoutPaletterCirclesInPairs];
}

- (void)transformSelectionMarkerToPickerCircleWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DTSColorPicker *)self selectedCircle];
  id v6 = (void *)MEMORY[0x263F1CB60];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__ETColorPickerView_transformSelectionMarkerToPickerCircleWithCompletion___block_invoke;
  v12[3] = &unk_264DEC7B0;
  id v13 = v5;
  double v14 = self;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__ETColorPickerView_transformSelectionMarkerToPickerCircleWithCompletion___block_invoke_2;
  v9[3] = &unk_264DEC7D8;
  id v10 = v13;
  id v11 = v4;
  id v7 = v4;
  id v8 = v13;
  [v6 animateWithDuration:v12 animations:v9 completion:0.15];
}

void __74__ETColorPickerView_transformSelectionMarkerToPickerCircleWithCompletion___block_invoke(uint64_t a1)
{
  +[ETColorWheelView colorWheelWidth];
  double v3 = v2;
  [*(id *)(a1 + 32) frame];
  CGFloat v4 = v3 / CGRectGetWidth(v25);
  CGAffineTransformMakeScale(&v24, v4, v4);
  uint64_t v5 = *(void **)(a1 + 32);
  CGAffineTransform v23 = v24;
  [v5 setTransform:&v23];
  +[ETPaletteCircleView paletteCircleDiameter];
  double v7 = v6 + 2.0;
  [*(id *)(*(void *)(a1 + 40) + 456) bounds];
  double Width = CGRectGetWidth(v26);
  +[ETColorWheelView colorWheelWidth];
  [*(id *)(a1 + 40) movePaletteCircleTowardsViewCenter:*(void *)(a1 + 32) distance:v7 + (Width - v9) * -0.5 + 1.0];
  id v10 = [*(id *)(a1 + 32) selectionMarker];
  +[ETColorWheelView pickerDiameter];
  double v12 = v11;
  +[ETPaletteCircleView selectionMarkerDiameter];
  CGFloat v14 = v12 / v13 / v4;
  CGAffineTransformMakeScale(&v22, v14, v14);
  CGAffineTransform v21 = v22;
  [v10 setTransform:&v21];
  CGFloat v15 = [*(id *)(a1 + 32) backgroundColor];
  [v10 setBackgroundColor:v15];

  +[ETColorWheelView pickerWidth];
  double v17 = v16 / v14;
  CGFloat v18 = [v10 layer];
  [v18 setBorderWidth:v17];

  double v19 = +[ETColorWheelView pickerBorderColor];
  CGFloat v20 = [v10 layer];
  [v20 setBorderColor:v19];
}

uint64_t __74__ETColorPickerView_transformSelectionMarkerToPickerCircleWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)transformPickerCircleToSelectionMarkerWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DTSColorPicker *)self selectedCircle];
  double v6 = [v5 selectionMarker];
  long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v18[0] = *MEMORY[0x263F000D0];
  v18[1] = v7;
  v18[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v6 setTransform:v18];
  id v8 = +[ETPaletteCircleView selectionMarkerColor];
  [v6 setBackgroundColor:v8];

  double v9 = [v6 layer];
  [v9 setBorderWidth:0.0];

  [(UIView *)self->_contentView addSubview:v5];
  [(UIView *)self->_contentView sendSubviewToBack:v5];
  id v10 = (void *)MEMORY[0x263F1CB60];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__ETColorPickerView_transformPickerCircleToSelectionMarkerWithCompletion___block_invoke;
  v15[3] = &unk_264DEC7B0;
  id v16 = v5;
  double v17 = self;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __74__ETColorPickerView_transformPickerCircleToSelectionMarkerWithCompletion___block_invoke_2;
  v13[3] = &unk_264DEC6A8;
  id v14 = v4;
  id v11 = v4;
  id v12 = v5;
  [v10 animateWithDuration:0x20000 delay:v15 options:v13 animations:0.15 completion:0.0];
}

uint64_t __74__ETColorPickerView_transformPickerCircleToSelectionMarkerWithCompletion___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v5[0] = *MEMORY[0x263F000D0];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v2 setTransform:v5];
  return [*(id *)(a1 + 40) movePalettCircleToOriginalLayoutPosition:*(void *)(a1 + 32)];
}

uint64_t __74__ETColorPickerView_transformPickerCircleToSelectionMarkerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fadeoutPaletterCirclesInPairs
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v3 = [(ETColorPickerView *)self paletteCircleAnimationPairs];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v3);
        }
        double v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v10 = [v9 objectAtIndexedSubscript:0];
        [(ETColorPickerView *)self fadeoutPaletteCircle:v10 delay:(double)(unint64_t)(v6 + i) * 0.0875];
        id v11 = [v9 objectAtIndexedSubscript:1];
        if (v11 != v10) {
          [(ETColorPickerView *)self fadeoutPaletteCircle:v11 delay:(double)(unint64_t)(v6 + i) * 0.0875];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
      v6 += i;
    }
    while (v5);
  }
  id v12 = [(DTSColorPicker *)self paletteCircles];
  double v13 = [v12 lastObject];

  id v14 = (void *)MEMORY[0x263F1CB60];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __50__ETColorPickerView_fadeoutPaletterCirclesInPairs__block_invoke;
  v22[3] = &unk_264DEC6D0;
  id v15 = v13;
  id v23 = v15;
  [v14 animateWithDuration:0 delay:v22 options:0 animations:0.15 completion:0.0];
  id v16 = (void *)MEMORY[0x263F1CB60];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __50__ETColorPickerView_fadeoutPaletterCirclesInPairs__block_invoke_2;
  v20[3] = &unk_264DEC6D0;
  id v21 = v15;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __50__ETColorPickerView_fadeoutPaletterCirclesInPairs__block_invoke_3;
  _OWORD v18[3] = &unk_264DEC800;
  id v19 = v21;
  id v17 = v21;
  [v16 animateWithDuration:0 delay:v20 options:v18 animations:0.25 completion:0.0];
}

uint64_t __50__ETColorPickerView_fadeoutPaletterCirclesInPairs__block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 0.7, 0.7);
  double v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __50__ETColorPickerView_fadeoutPaletterCirclesInPairs__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __50__ETColorPickerView_fadeoutPaletterCirclesInPairs__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)fadeinPaletterCirclesInPairs
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v3 = [(ETColorPickerView *)self paletteCircleAnimationPairs];
  unint64_t v4 = [v3 count];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        --v4;
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v11 = [v10 objectAtIndexedSubscript:0];
        [(ETColorPickerView *)self fadeinPaletteCircle:v11 delay:(double)v4 * 0.0875];
        id v12 = [v10 objectAtIndexedSubscript:1];
        if (v12 != v11) {
          [(ETColorPickerView *)self fadeinPaletteCircle:v12 delay:(double)v4 * 0.0875];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  double v13 = [(DTSColorPicker *)self paletteCircles];
  id v14 = [v13 lastObject];

  [(UIView *)self->_contentView addSubview:v14];
  id v15 = (void *)MEMORY[0x263F1CB60];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __49__ETColorPickerView_fadeinPaletterCirclesInPairs__block_invoke;
  v21[3] = &unk_264DEC6D0;
  id v16 = v14;
  id v22 = v16;
  [v15 animateWithDuration:0 delay:v21 options:0 animations:0.25 completion:0.0];
  id v17 = (void *)MEMORY[0x263F1CB60];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __49__ETColorPickerView_fadeinPaletterCirclesInPairs__block_invoke_2;
  v19[3] = &unk_264DEC6D0;
  id v20 = v16;
  id v18 = v16;
  [v17 animateWithDuration:0 delay:v19 options:0 animations:0.15 completion:0.0];
}

uint64_t __49__ETColorPickerView_fadeinPaletterCirclesInPairs__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return [v1 setTransform:v4];
}

uint64_t __49__ETColorPickerView_fadeinPaletterCirclesInPairs__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)fadeoutPaletteCircle:(id)a3 delay:(double)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x263F1CB60];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__ETColorPickerView_fadeoutPaletteCircle_delay___block_invoke;
  v11[3] = &unk_264DEC7B0;
  id v12 = v6;
  double v13 = self;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__ETColorPickerView_fadeoutPaletteCircle_delay___block_invoke_2;
  v9[3] = &unk_264DEC800;
  id v10 = v12;
  id v8 = v12;
  [v7 animateWithDuration:0 delay:v11 options:v9 animations:0.25 completion:a4];
}

uint64_t __48__ETColorPickerView_fadeoutPaletteCircle_delay___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  CGAffineTransformMakeScale(&v5, 0.7, 0.7);
  long long v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 40) movePaletteCircleTowardsViewCenter:*(void *)(a1 + 32) distance:10.0];
}

uint64_t __48__ETColorPickerView_fadeoutPaletteCircle_delay___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)fadeinPaletteCircle:(id)a3 delay:(double)a4
{
  id v6 = a3;
  [(UIView *)self->_contentView addSubview:v6];
  [(UIView *)self->_contentView sendSubviewToBack:v6];
  uint64_t v7 = (void *)MEMORY[0x263F1CB60];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__ETColorPickerView_fadeinPaletteCircle_delay___block_invoke;
  v9[3] = &unk_264DEC7B0;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  [v7 animateWithDuration:0 delay:v9 options:0 animations:0.25 completion:a4];
}

uint64_t __47__ETColorPickerView_fadeinPaletteCircle_delay___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  long long v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v5[0] = *MEMORY[0x263F000D0];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v2 setTransform:v5];
  return [*(id *)(a1 + 40) movePalettCircleToOriginalLayoutPosition:*(void *)(a1 + 32)];
}

- (void)movePaletteCircleTowardsViewCenter:(id)a3 distance:(double)a4
{
  contentView = self->_contentView;
  id v19 = a3;
  [(UIView *)contentView bounds];
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  double MidX = CGRectGetMidX(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v22);
  [v19 center];
  double v13 = v12;
  double v15 = v14;
  double v16 = MidX - v12;
  double v17 = MidY - v14;
  +[ETPaletteCircleView paletteCircleDiameter];
  objc_msgSend(v19, "setCenter:", v13 + v16 / (v18 + 2.0) * a4, v15 + v17 / (v18 + 2.0) * a4);
}

- (void)movePalettCircleToOriginalLayoutPosition:(id)a3
{
  contentView = self->_contentView;
  id v18 = a3;
  [(UIView *)contentView bounds];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  CGRectGetMidX(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRectGetMidY(v21);
  double v9 = [(DTSColorPicker *)self paletteCircles];
  unint64_t v10 = [v9 indexOfObject:v18];

  +[ETPaletteCircleView paletteCircleDiameter];
  double v11 = (double)v10;
  double v12 = +[ETColorStore defaultStore];
  double v13 = [v12 colors];
  uint64_t v14 = [v13 count];

  __sincos_stret(v11 * (6.28318531 / (double)(unint64_t)(v14 - 1)) + -1.57079633);
  UIRoundToViewScale();
  double v16 = v15;
  UIRoundToViewScale();
  objc_msgSend(v18, "setCenter:", v16, v17);
}

- (id)paletteCircleAnimationPairs
{
  v17[2] = *MEMORY[0x263EF8340];
  long long v3 = [(DTSColorPicker *)self paletteCircles];
  CGAffineTransform v4 = [(DTSColorPicker *)self selectedCircle];
  uint64_t v5 = [v3 indexOfObject:v4];

  id v6 = +[ETColorStore defaultStore];
  uint64_t v7 = [v6 colors];
  uint64_t v8 = [v7 count];

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v10 = v8 - 2;
  if (v8 != 2)
  {
    unint64_t v11 = v8 - 1;
    unint64_t v12 = 1;
    do
    {
      double v13 = [v3 objectAtIndexedSubscript:(v5 + v10) % v11];
      v17[0] = v13;
      uint64_t v14 = [v3 objectAtIndexedSubscript:(v5 + v12) % v11];
      v17[1] = v14;
      double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
      [v9 addObject:v15];

      ++v12;
      --v10;
    }
    while (v12 <= v10);
  }

  return v9;
}

- (void)colorWheel:(id)a3 willPickColor:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = [(DTSColorPicker *)self selectedCircle];
    [v6 setBackgroundColor:v5];
  }

  [(ETColorPickerView *)self fadeinPaletterCirclesInPairs];
}

- (void)colorWheel:(id)a3 didPickColor:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__ETColorPickerView_colorWheel_didPickColor___block_invoke;
  v7[3] = &unk_264DEC7B0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(ETColorPickerView *)self transformPickerCircleToSelectionMarkerWithCompletion:v7];
}

void __45__ETColorPickerView_colorWheel_didPickColor___block_invoke(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) longPressRecognizer];
  [v2 setEnabled:1];

  if (*(void *)(a1 + 40))
  {
    id v6 = +[ETColorStore defaultStore];
    uint64_t v3 = *(void *)(a1 + 40);
    CGAffineTransform v4 = [*(id *)(a1 + 32) paletteCircles];
    id v5 = [*(id *)(a1 + 32) selectedCircle];
    objc_msgSend(v6, "saveColor:forIndex:", v3, objc_msgSend(v4, "indexOfObject:", v5));
  }
}

- (ETColorPickerViewDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (ETColorPickerViewDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_colorWheelView, 0);
  objc_storeStrong((id *)&self->_presentTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_collapsedSelectedCircle, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end