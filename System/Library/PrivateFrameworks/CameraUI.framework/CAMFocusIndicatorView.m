@interface CAMFocusIndicatorView
- (BOOL)isInactive;
- (BOOL)isPulsing;
- (BOOL)showExposureBias;
- (CAMExposureBiasSlider)_exposureBiasSlider;
- (CAMFocusIndicatorRectView)_rectView;
- (CAMFocusIndicatorView)initWithStyle:(int64_t)a3;
- (CAMFocusIndicatorViewDelegate)delegate;
- (CGRect)boundsIncludingExposureBiasSlider;
- (CGSize)intrinsicContentSize;
- (float)exposureBiasMaximum;
- (float)exposureBiasMinimum;
- (float)exposureBiasValue;
- (int)_exposureBiasSide;
- (int64_t)style;
- (void)_commonCAMFocusIndicatorViewInitialization;
- (void)_createExposureBiasSlider;
- (void)_createRectViewAndUpdateBounds;
- (void)_layoutExposureBiasSlider;
- (void)_layoutRectView:(id)a3;
- (void)_updateTintColor;
- (void)layoutSubviews;
- (void)setCenter:(CGPoint)a3;
- (void)setDelegate:(id)a3;
- (void)setExposureBiasMaximum:(float)a3;
- (void)setExposureBiasMinimum:(float)a3;
- (void)setExposureBiasSide:(int)a3 animated:(BOOL)a4;
- (void)setExposureBiasValue:(float)a3;
- (void)setInactive:(BOOL)a3;
- (void)setPulsing:(BOOL)a3;
- (void)setShowExposureBias:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setStyle:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)set_exposureBiasSide:(int)a3;
- (void)startScalingWithExpansionWidth:(double)a3 duration:(double)a4 repeatCount:(unint64_t)a5;
@end

@implementation CAMFocusIndicatorView

- (CAMFocusIndicatorView)initWithStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMFocusIndicatorView;
  v4 = -[CAMFocusIndicatorView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    [(CAMFocusIndicatorView *)v4 _commonCAMFocusIndicatorViewInitialization];
    v6 = v5;
  }

  return v5;
}

- (void)_commonCAMFocusIndicatorViewInitialization
{
  [(CAMFocusIndicatorView *)self _createRectViewAndUpdateBounds];
  [(CAMFocusIndicatorView *)self _updateTintColor];
}

- (void)_createRectViewAndUpdateBounds
{
  BOOL v3 = [(CAMFocusIndicatorView *)self isInactive];
  v4 = [[CAMFocusIndicatorRectView alloc] initWithStyle:self->_style];
  rectView = self->__rectView;
  self->__rectView = v4;

  [(CAMFocusIndicatorRectView *)self->__rectView setInactive:v3];
  [(CAMFocusIndicatorView *)self addSubview:self->__rectView];
  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  [(CAMFocusIndicatorRectView *)self->__rectView intrinsicContentSize];
  -[CAMFocusIndicatorView setBounds:](self, "setBounds:", v6, v7, v8, v9);
}

- (BOOL)isInactive
{
  return self->_inactive;
}

- (void)_updateTintColor
{
  if ([(CAMFocusIndicatorView *)self isInactive]) {
    [MEMORY[0x263F825C8] whiteColor];
  }
  else {
  id v3 = [MEMORY[0x263F825C8] systemYellowColor];
  }
  [(CAMFocusIndicatorView *)self setTintColor:v3];
}

- (void)setDelegate:(id)a3
{
}

- (void)startScalingWithExpansionWidth:(double)a3 duration:(double)a4 repeatCount:(unint64_t)a5
{
  v22[2] = *MEMORY[0x263EF8340];
  double v9 = [(CAMFocusIndicatorView *)self layer];
  v10 = [v9 animationForKey:@"scaleAnimation"];

  if (!v10)
  {
    [(CAMFocusIndicatorView *)self bounds];
    double v12 = 1.0;
    if (v11 > 0.0) {
      double v12 = (v11 + a3 * 2.0) / v11;
    }
    v13 = [NSNumber numberWithDouble:v12];
    v22[0] = v13;
    v22[1] = &unk_26BDDF458;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];

    v15 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB0]];
    v21[0] = v15;
    v16 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
    v21[1] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];

    v18 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.scale.xy"];
    [v18 setValues:v14];
    [v18 setTimingFunctions:v17];
    [v18 setKeyTimes:&unk_26BDDFF98];
    [v18 setCalculationMode:*MEMORY[0x263F15970]];
    *(float *)&double v19 = (float)a5;
    [v18 setRepeatCount:v19];
    UIAnimationDragCoefficient();
    [v18 setDuration:v20 * a4];
    [v9 addAnimation:v18 forKey:@"scaleAnimation"];
  }
}

- (void)setPulsing:(BOOL)a3
{
}

- (CGSize)intrinsicContentSize
{
  [(CAMFocusIndicatorRectView *)self->__rectView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CAMFocusIndicatorView;
  [(CAMFocusIndicatorView *)&v4 layoutSubviews];
  [(CAMFocusIndicatorView *)self _layoutRectView:self->__rectView];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39__CAMFocusIndicatorView_layoutSubviews__block_invoke;
  v3[3] = &unk_263FA0208;
  v3[4] = self;
  [MEMORY[0x263F82E00] performWithoutAnimation:v3];
}

- (void)_layoutRectView:(id)a3
{
  id v14 = a3;
  [(CAMFocusIndicatorView *)self bounds];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  double MidX = CGRectGetMidX(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v17);
  double v10 = *MEMORY[0x263F001A8];
  double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
  [v14 intrinsicContentSize];
  objc_msgSend(v14, "setBounds:", v10, v11, v12, v13);
  objc_msgSend(v14, "setCenter:", MidX, MidY);
}

uint64_t __39__CAMFocusIndicatorView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutExposureBiasSlider];
}

- (void)_layoutExposureBiasSlider
{
  if (!self->__exposureBiasSlider) {
    return;
  }
  CGFloat v4 = *MEMORY[0x263F001A8];
  CGFloat v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  [(CAMFocusIndicatorView *)self intrinsicContentSize];
  CGFloat v6 = v5;
  double v8 = v7;
  -[CAMExposureBiasSlider sizeThatFits:](self->__exposureBiasSlider, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double rect = v9;
  double v11 = v10;
  v65.origin.CGFloat x = v4;
  v65.origin.CGFloat y = v3;
  v65.size.CGFloat width = v6;
  v65.size.CGFloat height = v8;
  double v12 = CGRectGetMaxX(v65) + 17.0;
  double v13 = round((v8 - v11) * 0.5);
  long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v64.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v64.c = v14;
  *(_OWORD *)&v64.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  int exposureBiasSide = self->__exposureBiasSide;
  long long v57 = v14;
  long long v58 = *(_OWORD *)&v64.a;
  long long v56 = *(_OWORD *)&v64.tx;
  switch(exposureBiasSide)
  {
    case 1:
      CGFloat v16 = 3.14159265;
      goto LABEL_8;
    case 2:
      CGFloat v16 = -1.57079633;
      goto LABEL_8;
    case 3:
      CGFloat v16 = 1.57079633;
LABEL_8:
      CGAffineTransformMakeRotation(&v64, v16);
      CGAffineTransform v62 = v64;
      UIIntegralTransform();
      CGAffineTransform v64 = v63;
      break;
  }
  v66.origin.CGFloat x = v4;
  v66.origin.CGFloat y = v3;
  v66.size.CGFloat width = v6;
  v66.size.CGFloat height = v8;
  double MidX = CGRectGetMidX(v66);
  v67.origin.CGFloat x = v4;
  v67.origin.CGFloat y = v3;
  v67.size.CGFloat width = v6;
  v67.size.CGFloat height = v8;
  CGFloat v53 = v6;
  CGFloat v54 = v3;
  double MidY = CGRectGetMidY(v67);
  v68.origin.CGFloat x = v12;
  v68.origin.CGFloat y = v13;
  v68.size.CGFloat width = rect;
  v68.size.CGFloat height = v11;
  CGFloat v52 = v8;
  double v19 = CGRectGetMidX(v68);
  CGFloat v55 = v4;
  double v20 = v12;
  v69.origin.CGFloat x = v12;
  v69.origin.CGFloat y = v13;
  v69.size.CGFloat width = rect;
  v69.size.CGFloat height = v11;
  double v21 = MidX - v19;
  double v22 = MidY - CGRectGetMidY(v69);
  memset(&v63, 0, sizeof(v63));
  CGAffineTransformMakeTranslation(&v63, v21, v22);
  CGAffineTransform t1 = v64;
  CGAffineTransform t2 = v63;
  CGAffineTransformConcat(&v62, &t1, &t2);
  CGAffineTransform v63 = v62;
  CGAffineTransform t1 = v62;
  CGAffineTransformTranslate(&v62, &t1, -v21, -v22);
  CGAffineTransform v63 = v62;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v24 = objc_opt_respondsToSelector();

  if (v24)
  {
    tCGFloat x = -v21;
    CGFloat v51 = v21;
    id v25 = objc_loadWeakRetained((id *)&self->_delegate);
    v26 = [v25 focusIndicatorViewBoundingViewForClippingFocusIndicatorView:self];

    double v27 = v13;
    if (v26)
    {
      -[CAMFocusIndicatorView convertRect:toView:](self, "convertRect:toView:", v26);
      v48.origin.CGFloat x = v28;
      v48.origin.CGFloat y = v29;
      v48.size.CGFloat width = v30;
      v48.size.CGFloat height = v31;
      [v26 bounds];
      v49.origin.CGFloat x = v32;
      v49.origin.CGFloat y = v33;
      v49.size.CGFloat width = v34;
      v49.size.CGFloat height = v35;
      v70.origin.CGFloat x = v12;
      v70.origin.CGFloat y = v13;
      v70.size.CGFloat width = rect;
      v70.size.CGFloat height = v11;
      double MaxX = CGRectGetMaxX(v70);
      v71.origin.CGFloat x = v55;
      v71.origin.CGFloat y = v54;
      v71.size.CGFloat width = v53;
      v71.size.CGFloat height = v52;
      double MaxY = CGRectGetMaxY(v71);
      [(CAMExposureBiasSlider *)self->__exposureBiasSlider thumbMaxExtension];
      double v38 = MaxX - MaxY + v37;
      switch(self->__exposureBiasSide)
      {
        case 0:
          double v39 = v38 + CGRectGetMaxX(v48);
          double v40 = CGRectGetMaxX(v49);
          goto LABEL_20;
        case 1:
          double v41 = CGRectGetMinX(v48) - v38;
          double MinX = CGRectGetMinX(v49);
          goto LABEL_17;
        case 2:
          double v41 = CGRectGetMinY(v48) - v38;
          double MinX = CGRectGetMinY(v49);
LABEL_17:
          double v43 = MinX;

          if (v41 >= v43) {
            break;
          }
          goto LABEL_21;
        case 3:
          double v39 = v38 + CGRectGetMaxY(v48);
          double v40 = CGRectGetMaxY(v49);
LABEL_20:
          double v44 = v40;

          if (v39 > v44)
          {
LABEL_21:
            v72.origin.CGFloat x = v55;
            v72.size.CGFloat width = v53;
            v72.origin.CGFloat y = v54;
            v72.size.CGFloat height = v52;
            double v20 = CGRectGetMinX(v72) + -17.0 - rect;
            CGAffineTransformMakeTranslation(&v62, tx, v22);
            CGAffineTransform v63 = v62;
            CGAffineTransform t1 = v64;
            CGAffineTransform t2 = v62;
            CGAffineTransformConcat(&v62, &t1, &t2);
            CGAffineTransform v63 = v62;
            CGAffineTransform t1 = v62;
            CGAffineTransformTranslate(&v62, &t1, v51, -v22);
            CGAffineTransform v63 = v62;
          }
          break;
        default:
          goto LABEL_14;
      }
    }
    else
    {
LABEL_14:
    }
  }
  else
  {
    double v27 = v13;
  }
  exposureBiasSlider = self->__exposureBiasSlider;
  *(_OWORD *)&v62.a = v58;
  *(_OWORD *)&v62.c = v57;
  *(_OWORD *)&v62.tCGFloat x = v56;
  -[CAMExposureBiasSlider setTransform:](exposureBiasSlider, "setTransform:", &v62, *(void *)&MaxX);
  -[CAMExposureBiasSlider setFrame:](self->__exposureBiasSlider, "setFrame:", v20, v27, rect, v11);
  v46 = self->__exposureBiasSlider;
  CGAffineTransform v62 = v63;
  [(CAMExposureBiasSlider *)v46 setTransform:&v62];
}

- (void)setStyle:(int64_t)a3
{
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  double v8 = (void (**)(void))a5;
  int64_t style = self->_style;
  if (style != a3)
  {
    BOOL v10 = style == 3;
    BOOL v11 = style == 4;
    if (a3 != 3) {
      BOOL v11 = 0;
    }
    if (a3 == 4) {
      BOOL v12 = v10;
    }
    else {
      BOOL v12 = v11;
    }
    self->_int64_t style = a3;
    double v13 = self->__rectView;
    [(CAMFocusIndicatorRectView *)v13 setPulsing:0];
    long long v14 = (void *)MEMORY[0x263F82E00];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke;
    v40[3] = &unk_263FA4118;
    v40[4] = self;
    BOOL v42 = a4;
    v15 = v13;
    double v41 = v15;
    [v14 performWithoutAnimation:v40];
    if (a4)
    {
      if (v12)
      {
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_9;
        v30[3] = &unk_263FA0208;
        v30[4] = self;
        [MEMORY[0x263F82E00] performWithoutAnimation:v30];
        CGFloat v16 = (void *)MEMORY[0x263F82E00];
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_10;
        v28[3] = &unk_263FA0408;
        v28[4] = self;
        CGFloat v29 = v15;
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_11;
        v24[3] = &unk_263FA4140;
        v26 = v8;
        v24[4] = self;
        id v25 = v29;
        uint64_t v27 = 0x3FF0000000000000;
        [v16 animateWithDuration:6 delay:v28 options:v24 animations:0.25 completion:0.0];

        CGRect v17 = v29;
      }
      else
      {
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_2;
        v39[3] = &unk_263FA0208;
        v39[4] = self;
        [MEMORY[0x263F82E00] performWithoutAnimation:v39];
        [(CAMFocusIndicatorRectView *)v15 intrinsicContentSize];
        double v19 = v18;
        [(CAMFocusIndicatorRectView *)self->__rectView intrinsicContentSize];
        double v21 = v20 / v19;
        memset(&v38.c, 0, 32);
        if (v19 <= 0.0) {
          double v21 = 1.0;
        }
        *(_OWORD *)&v38.a = 0uLL;
        CGAffineTransformMakeScale(&v38, v21, v21);
        double v22 = (void *)MEMORY[0x263F82E00];
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_3;
        v35[3] = &unk_263FA2270;
        v23 = v15;
        CGAffineTransform v37 = v38;
        v36 = v23;
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_4;
        v31[3] = &unk_263FA4140;
        v31[4] = self;
        CGFloat v33 = v8;
        uint64_t v34 = 0x3FF0000000000000;
        CGFloat v32 = v23;
        [v22 animateWithDuration:6 delay:v35 options:v31 animations:0.25 completion:0.0];

        CGRect v17 = v36;
      }
    }
    else
    {
      [(CAMFocusIndicatorRectView *)v15 removeFromSuperview];
      if (v8) {
        v8[2](v8);
      }
    }
  }
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createRectViewAndUpdateBounds];
  [*(id *)(a1 + 32) setNeedsLayout];
  uint64_t result = [*(id *)(a1 + 32) layoutIfNeeded];
  if (*(unsigned char *)(a1 + 48))
  {
    CGFloat v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 _layoutRectView:v4];
  }
  return result;
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:0.0];
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

void __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_5;
  v11[3] = &unk_263FA0208;
  v11[4] = *(void *)(a1 + 32);
  [MEMORY[0x263F82E00] performWithoutAnimation:v11];
  double v3 = *(double *)(a1 + 56) * 0.1;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_6;
  v10[3] = &unk_263FA0208;
  v10[4] = *(void *)(a1 + 32);
  [MEMORY[0x263F82E00] animateWithDuration:6 delay:v10 options:0 animations:v3 completion:0.0];
  uint64_t v4 = (void *)MEMORY[0x263F82E00];
  double v5 = *(double *)(a1 + 56) * 0.3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_7;
  v8[3] = &unk_263FA0208;
  id v9 = *(id *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_8;
  v6[3] = &unk_263FA0430;
  id v7 = *(id *)(a1 + 40);
  [v4 animateWithDuration:6 delay:v8 options:v6 animations:v5 completion:0.0];
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:0.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 456);
  return [v2 setAlpha:0.0];
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_6(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:1.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 456);
  return [v2 setAlpha:1.0];
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_9(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:0.0];
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_10(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 448) bounds];
  objc_msgSend(*(id *)(a1 + 40), "setBounds:");
  [*(id *)(a1 + 40) setNeedsLayout];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 layoutIfNeeded];
}

void __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_11(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  double v3 = (void *)MEMORY[0x263F82E00];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_12;
  v7[3] = &unk_263FA0408;
  uint64_t v4 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  [v3 performWithoutAnimation:v7];
  double v5 = *(double *)(a1 + 56) * 0.1;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_13;
  v6[3] = &unk_263FA0208;
  void v6[4] = *(void *)(a1 + 32);
  [MEMORY[0x263F82E00] animateWithDuration:6 delay:v6 options:0 animations:v5 completion:0.0];
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_12(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:1.0];
  [*(id *)(a1 + 40) removeFromSuperview];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 456);
  return [v2 setAlpha:0.0];
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_13(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:1.0];
}

- (CGRect)boundsIncludingExposureBiasSlider
{
  [(CAMFocusIndicatorView *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  BOOL v11 = [(CAMFocusIndicatorView *)self _exposureBiasSlider];
  [v11 frame];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;

  uint64_t v20 = v4;
  uint64_t v21 = v6;
  uint64_t v22 = v8;
  uint64_t v23 = v10;
  uint64_t v24 = v13;
  uint64_t v25 = v15;
  uint64_t v26 = v17;
  uint64_t v27 = v19;
  return CGRectUnion(*(CGRect *)&v20, *(CGRect *)&v24);
}

- (void)setCenter:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CAMFocusIndicatorView;
  -[CAMFocusIndicatorView setCenter:](&v4, sel_setCenter_, a3.x, a3.y);
  if (self->__exposureBiasSlider) {
    [(CAMFocusIndicatorView *)self _layoutExposureBiasSlider];
  }
}

- (void)setInactive:(BOOL)a3
{
  if (self->_inactive != a3)
  {
    BOOL v3 = a3;
    self->_inactive = a3;
    id v5 = [(CAMFocusIndicatorView *)self _rectView];
    [v5 setInactive:v3];
    [(CAMFocusIndicatorView *)self _updateTintColor];
  }
}

- (BOOL)isPulsing
{
  return [(CAMFocusIndicatorRectView *)self->__rectView isPulsing];
}

- (void)setShowExposureBias:(BOOL)a3
{
  if (self->_showExposureBias != a3)
  {
    self->_showExposureBias = a3;
    if (a3)
    {
      [(CAMFocusIndicatorView *)self _createExposureBiasSlider];
    }
    else
    {
      [(CAMExposureBiasSlider *)self->__exposureBiasSlider removeFromSuperview];
      exposureBiasSlider = self->__exposureBiasSlider;
      self->__exposureBiasSlider = 0;
    }
  }
}

- (void)_createExposureBiasSlider
{
  BOOL v3 = [CAMExposureBiasSlider alloc];
  objc_super v4 = -[CAMExposureBiasSlider initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  exposureBiasSlider = self->__exposureBiasSlider;
  self->__exposureBiasSlider = v4;

  *(float *)&double v6 = self->_exposureBiasMinimum;
  [(CAMExposureBiasSlider *)self->__exposureBiasSlider setExposureBiasMin:v6];
  *(float *)&double v7 = self->_exposureBiasMaximum;
  [(CAMExposureBiasSlider *)self->__exposureBiasSlider setExposureBiasMax:v7];
  *(float *)&double v8 = self->_exposureBiasValue;
  [(CAMExposureBiasSlider *)self->__exposureBiasSlider setExposureBiasValue:v8];
  [(CAMExposureBiasSlider *)self->__exposureBiasSlider forceTrackDimmed];
  [(CAMFocusIndicatorView *)self addSubview:self->__exposureBiasSlider];
  [(CAMFocusIndicatorView *)self _layoutExposureBiasSlider];
}

- (void)setExposureBiasMaximum:(float)a3
{
  if (self->_exposureBiasMaximum != a3)
  {
    self->_exposureBiasMaximum = a3;
    -[CAMExposureBiasSlider setExposureBiasMax:](self->__exposureBiasSlider, "setExposureBiasMax:");
  }
}

- (void)setExposureBiasMinimum:(float)a3
{
  if (self->_exposureBiasMinimum != a3)
  {
    self->_exposureBiasMinimum = a3;
    -[CAMExposureBiasSlider setExposureBiasMin:](self->__exposureBiasSlider, "setExposureBiasMin:");
  }
}

- (void)setExposureBiasValue:(float)a3
{
  if (self->_exposureBiasValue != a3)
  {
    self->_exposureBiasValue = a3;
    -[CAMExposureBiasSlider setExposureBiasValue:](self->__exposureBiasSlider, "setExposureBiasValue:");
  }
}

- (void)setExposureBiasSide:(int)a3 animated:(BOOL)a4
{
  int exposureBiasSide = self->__exposureBiasSide;
  self->__int exposureBiasSide = a3;
  [(CAMExposureBiasSlider *)self->__exposureBiasSlider alpha];
  BOOL v10 = v8 > 0.0 && exposureBiasSide != a3;
  exposureBiasSlider = self->__exposureBiasSlider;
  if (exposureBiasSlider)
  {
    if (a4)
    {
      uint64_t v12 = exposureBiasSlider;
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setDisableActions:1];
      [(CAMFocusIndicatorView *)self _createExposureBiasSlider];
      [(CAMExposureBiasSlider *)self->__exposureBiasSlider setAlpha:0.0];
      uint64_t v13 = self->__exposureBiasSlider;
      [(CAMExposureBiasSlider *)v12 alpha];
      -[CAMExposureBiasSlider setAlpha:](v13, "setAlpha:");
      [MEMORY[0x263F158F8] commit];
      uint64_t v14 = (void *)MEMORY[0x263F82E00];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      void v21[2] = __54__CAMFocusIndicatorView_setExposureBiasSide_animated___block_invoke;
      v21[3] = &unk_263FA0208;
      uint64_t v22 = v12;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __54__CAMFocusIndicatorView_setExposureBiasSide_animated___block_invoke_2;
      v19[3] = &unk_263FA0430;
      uint64_t v15 = v22;
      uint64_t v20 = v15;
      [v14 animateWithDuration:2 delay:v21 options:v19 animations:0.2 completion:0.0];
      if (v10)
      {
        [(CAMExposureBiasSlider *)self->__exposureBiasSlider setAlpha:0.0];
        v17[4] = self;
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __54__CAMFocusIndicatorView_setExposureBiasSide_animated___block_invoke_3;
        v18[3] = &unk_263FA0208;
        v18[4] = self;
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __54__CAMFocusIndicatorView_setExposureBiasSide_animated___block_invoke_4;
        v17[3] = &unk_263FA0430;
        [MEMORY[0x263F82E00] animateWithDuration:2 delay:v18 options:v17 animations:0.5 completion:0.0];
      }
    }
    else
    {
      [(CAMFocusIndicatorView *)self _layoutExposureBiasSlider];
      if (v10)
      {
        uint64_t v16 = self->__exposureBiasSlider;
        [(CAMExposureBiasSlider *)v16 updateLastInteractionTime];
      }
    }
  }
}

uint64_t __54__CAMFocusIndicatorView_setExposureBiasSide_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __54__CAMFocusIndicatorView_setExposureBiasSide_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __54__CAMFocusIndicatorView_setExposureBiasSide_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 456) updateLastInteractionTime];
  [*(id *)(*(void *)(a1 + 32) + 456) setSuspendTrackFadeOut:1];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 456);
  return [v2 setAlpha:1.0];
}

uint64_t __54__CAMFocusIndicatorView_setExposureBiasSide_animated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setSuspendTrackFadeOut:0];
}

- (int64_t)style
{
  return self->_style;
}

- (CAMFocusIndicatorViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMFocusIndicatorViewDelegate *)WeakRetained;
}

- (BOOL)showExposureBias
{
  return self->_showExposureBias;
}

- (float)exposureBiasMaximum
{
  return self->_exposureBiasMaximum;
}

- (float)exposureBiasMinimum
{
  return self->_exposureBiasMinimum;
}

- (float)exposureBiasValue
{
  return self->_exposureBiasValue;
}

- (CAMFocusIndicatorRectView)_rectView
{
  return self->__rectView;
}

- (CAMExposureBiasSlider)_exposureBiasSlider
{
  return self->__exposureBiasSlider;
}

- (int)_exposureBiasSide
{
  return self->__exposureBiasSide;
}

- (void)set_exposureBiasSide:(int)a3
{
  self->__int exposureBiasSide = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__exposureBiasSlider, 0);
  objc_storeStrong((id *)&self->__rectView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end