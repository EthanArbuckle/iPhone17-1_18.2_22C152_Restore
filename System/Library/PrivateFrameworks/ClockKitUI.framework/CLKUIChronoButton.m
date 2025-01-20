@interface CLKUIChronoButton
+ (id)_fillImageWithRadius:(double)a3 lineThickness:(double)a4;
+ (id)_ringImageWithRadius:(double)a3 lineThickness:(double)a4;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CLKUIChronoButton)initWithDiameter:(double)a3;
- (CLKUIChronoButton)initWithDiameter:(double)a3 lineThickness:(double)a4;
- (CLKUIChronoButton)initWithFrame:(CGRect)a3;
- (UIColor)color;
- (UIColor)highlightColor;
- (UIColor)ringColor;
- (UIColor)ringSwapColor;
- (UIColor)swapColor;
- (UIEdgeInsets)touchEdgeInsets;
- (void)_performTouchAnimationThroughColor:(id)a3 toColor:(id)a4 toRingColor:(id)a5;
- (void)_setupImagesWithDiameter:(double)a3 lineThickness:(double)a4;
- (void)_updateColors;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlightColor:(id)a3;
- (void)setRingColor:(id)a3;
- (void)setRingSwapColor:(id)a3;
- (void)setSwapColor:(id)a3;
- (void)setTouchEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation CLKUIChronoButton

- (CLKUIChronoButton)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CLKUIChronoButton;
  v3 = -[CLKUIChronoButton initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F19A30] currentDevice];
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_1);
    id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_1);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      id v7 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_1);
      if (v7 == v4)
      {
        uint64_t v8 = [v4 version];
        uint64_t v9 = _LayoutConstants___previousCLKDeviceVersion_1;

        if (v8 == v9)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_1);
          double v12 = *(double *)&_LayoutConstants_constants_0;
          double v13 = *(double *)&_LayoutConstants_constants_1;

          [(CLKUIChronoButton *)v3 _setupImagesWithDiameter:v12 lineThickness:v13];
          return v3;
        }
      }
      else
      {
      }
    }
    id v10 = objc_storeWeak(&_LayoutConstants___cachedDevice_1, v4);
    _LayoutConstants___previousCLKDeviceVersion_1 = [v4 version];

    ___LayoutConstants_block_invoke_1(v11, (uint64_t)v4);
    goto LABEL_7;
  }
  return v3;
}

- (CLKUIChronoButton)initWithDiameter:(double)a3
{
  v5 = [MEMORY[0x1E4F19A30] currentDevice];
  CLKRoundForDevice();
  double v7 = v6;

  return [(CLKUIChronoButton *)self initWithDiameter:a3 lineThickness:v7];
}

- (CLKUIChronoButton)initWithDiameter:(double)a3 lineThickness:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CLKUIChronoButton;
  double v6 = -[CLKUIChronoButton initWithFrame:](&v9, sel_initWithFrame_, 0.0, 0.0, a3, a3);
  double v7 = v6;
  if (v6) {
    [(CLKUIChronoButton *)v6 _setupImagesWithDiameter:a3 lineThickness:a4];
  }
  return v7;
}

- (void)_setupImagesWithDiameter:(double)a3 lineThickness:(double)a4
{
  double v6 = a3 * 0.5;
  id v18 = +[CLKUIChronoButton _ringImageWithRadius:a3 * 0.5 lineThickness:a4];
  id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
  uint64_t v8 = [v18 imageWithRenderingMode:2];
  objc_super v9 = (UIImageView *)[v7 initWithImage:v8];
  ringView = self->_ringView;
  self->_ringView = v9;

  [(UIImageView *)self->_ringView setUserInteractionEnabled:0];
  [(CLKUIChronoButton *)self addSubview:self->_ringView];
  uint64_t v11 = +[CLKUIChronoButton _fillImageWithRadius:v6 lineThickness:a4];
  id v12 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v13 = [v11 imageWithRenderingMode:2];
  v14 = (UIImageView *)[v12 initWithImage:v13];
  fillView = self->_fillView;
  self->_fillView = v14;

  [(UIImageView *)self->_fillView setUserInteractionEnabled:0];
  [(CLKUIChronoButton *)self addSubview:self->_fillView];
  v16 = [MEMORY[0x1E4FB1618] whiteColor];
  [(CLKUIChronoButton *)self setColor:v16];

  v17 = [MEMORY[0x1E4FB1618] blackColor];
  [(CLKUIChronoButton *)self setBackgroundColor:v17];
}

- (void)setColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_color, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    [(CLKUIChronoButton *)self _updateColors];
  }
}

- (void)setRingColor:(id)a3
{
  objc_storeStrong((id *)&self->_ringColor, a3);
  [(CLKUIChronoButton *)self _updateColors];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CLKUIChronoButton *)self isEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CLKUIChronoButton;
    [(CLKUIChronoButton *)&v5 setEnabled:v3];
    [(CLKUIChronoButton *)self _updateColors];
  }
}

- (void)layoutSubviews
{
  double v3 = MEMORY[0x1D94315A0]([(CLKUIChronoButton *)self bounds]);
  double v5 = v4;
  -[UIImageView setCenter:](self->_ringView, "setCenter:");
  fillView = self->_fillView;
  -[UIImageView setCenter:](fillView, "setCenter:", v3, v5);
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)CLKUIChronoButton;
  BOOL v5 = [(CLKUIChronoButton *)&v16 beginTrackingWithTouch:a3 withEvent:a4];
  if (v5)
  {
    swapColor = self->_swapColor;
    if (!swapColor) {
      swapColor = self->_color;
    }
    id v7 = swapColor;
    ringSwapColor = self->_ringSwapColor;
    if (!ringSwapColor) {
      ringSwapColor = self->_ringColor;
    }
    objc_super v9 = ringSwapColor;
    id v10 = v9;
    if (v9) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = v7;
    }
    [(CLKUIChronoButton *)self _performTouchAnimationThroughColor:self->_highlightColor toColor:v7 toRingColor:v11];
    objc_storeStrong((id *)&self->_swapColor, self->_color);
    color = self->_color;
    self->_color = v7;
    double v13 = v7;

    objc_storeStrong((id *)&self->_ringSwapColor, self->_ringColor);
    ringColor = self->_ringColor;
    self->_ringColor = v10;
  }
  return v5;
}

- (void)_performTouchAnimationThroughColor:(id)a3 toColor:(id)a4 toRingColor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1E4FB1EB0];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __76__CLKUIChronoButton__performTouchAnimationThroughColor_toColor_toRingColor___block_invoke;
  v25[3] = &unk_1E697BD68;
  v25[4] = self;
  id v26 = v8;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __76__CLKUIChronoButton__performTouchAnimationThroughColor_toColor_toRingColor___block_invoke_2;
  v22[3] = &unk_1E697BE30;
  v22[4] = self;
  id v12 = v26;
  id v23 = v12;
  id v13 = v9;
  id v24 = v13;
  [v11 animateWithDuration:0x10000 delay:v25 options:v22 animations:0.2 completion:0.0];
  v14 = (void *)MEMORY[0x1E4FB1EB0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__CLKUIChronoButton__performTouchAnimationThroughColor_toColor_toRingColor___block_invoke_4;
  v18[3] = &unk_1E697BE58;
  v18[4] = self;
  id v19 = v10;
  id v20 = v12;
  id v21 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  [v14 animateWithDuration:0 delay:v18 options:0 animations:0.4 completion:0.0];
}

uint64_t __76__CLKUIChronoButton__performTouchAnimationThroughColor_toColor_toRingColor___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 464);
  CGAffineTransformMakeScale(&v4, 1.0, 1.0);
  uint64_t result = [v2 setTransform:&v4];
  if (*(void *)(a1 + 40)) {
    return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464), "setTintColor:");
  }
  return result;
}

void __76__CLKUIChronoButton__performTouchAnimationThroughColor_toColor_toRingColor___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__CLKUIChronoButton__performTouchAnimationThroughColor_toColor_toRingColor___block_invoke_3;
  v4[3] = &unk_1E697BE08;
  double v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  [v2 animateWithDuration:0x20000 delay:v4 options:0 animations:0.2 completion:0.0];
}

uint64_t __76__CLKUIChronoButton__performTouchAnimationThroughColor_toColor_toRingColor___block_invoke_3(void *a1)
{
  v2 = *(void **)(a1[4] + 464);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  uint64_t result = [v2 setTransform:v5];
  if (a1[5]) {
    return [*(id *)(a1[4] + 464) setTintColor:a1[6]];
  }
  return result;
}

uint64_t __76__CLKUIChronoButton__performTouchAnimationThroughColor_toColor_toRingColor___block_invoke_4(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 456) setTintColor:a1[5]];
  if (!a1[6])
  {
    long long v3 = *(void **)(a1[4] + 464);
    uint64_t v4 = a1[7];
    return [v3 setTintColor:v4];
  }
  return result;
}

- (void)_updateColors
{
  int v3 = [(CLKUIChronoButton *)self isEnabled];
  color = self->_color;
  if (v3)
  {
    id v5 = color;
  }
  else
  {
    id v5 = [(UIColor *)color colorWithAlphaComponent:0.2];
  }
  uint64_t v11 = v5;
  int v6 = [(CLKUIChronoButton *)self isEnabled];
  ringColor = self->_ringColor;
  if (v6)
  {
    id v8 = ringColor;
  }
  else
  {
    id v8 = [(UIColor *)ringColor colorWithAlphaComponent:0.2];
  }
  id v9 = v8;
  [(UIImageView *)self->_fillView setTintColor:v11];
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = v11;
  }
  [(UIImageView *)self->_ringView setTintColor:v10];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CLKUIChronoButton *)self bounds];
  double top = self->_touchEdgeInsets.top;
  double left = self->_touchEdgeInsets.left;
  double v10 = v9 + left;
  double v12 = v11 + top;
  double v14 = v13 - (left + self->_touchEdgeInsets.right);
  double v16 = v15 - (top + self->_touchEdgeInsets.bottom);
  CGFloat v17 = x;
  CGFloat v18 = y;
  return CGRectContainsPoint(*(CGRect *)&v10, *(CGPoint *)&v17);
}

+ (id)_fillImageWithRadius:(double)a3 lineThickness:(double)a4
{
  uint64_t v4 = (void *)_fillImageWithRadius_lineThickness__image;
  if (_fillImageWithRadius_lineThickness__image) {
    BOOL v5 = *(double *)&_fillImageWithRadius_lineThickness__cachedRadius == a3;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5 || *(double *)&_fillImageWithRadius_lineThickness__cachedThickness != a4)
  {
    _fillImageWithRadius_lineThickness__cachedRadius = *(void *)&a3;
    _fillImageWithRadius_lineThickness__cachedThickness = *(void *)&a4;
    double v7 = a4 + a4;
    double v8 = a3 - (a4 + a4);
    double v9 = [MEMORY[0x1E4F39C88] layer];
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v7, v7, v8 + v8, v8 + v8);
    id v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPath:", objc_msgSend(v10, "CGPath"));

    id v11 = [MEMORY[0x1E4FB1618] blackColor];
    objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

    double v12 = [MEMORY[0x1E4F19A30] currentDevice];
    [v12 screenScale];
    CGFloat v14 = v13;
    v19.width = v7 + v8 + v7 + v8;
    v19.height = v19.width;
    UIGraphicsBeginImageContextWithOptions(v19, 0, v14);

    [v9 renderInContext:UIGraphicsGetCurrentContext()];
    uint64_t v15 = UIGraphicsGetImageFromCurrentImageContext();
    double v16 = (void *)_fillImageWithRadius_lineThickness__image;
    _fillImageWithRadius_lineThickness__image = v15;

    UIGraphicsEndImageContext();
    uint64_t v4 = (void *)_fillImageWithRadius_lineThickness__image;
  }
  return v4;
}

+ (id)_ringImageWithRadius:(double)a3 lineThickness:(double)a4
{
  int v6 = (void *)_ringImageWithRadius_lineThickness__image;
  if (_ringImageWithRadius_lineThickness__image) {
    BOOL v7 = *(double *)&_ringImageWithRadius_lineThickness__cachedRadius == a3;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7 || *(double *)&_ringImageWithRadius_lineThickness__cachedThickness != a4)
  {
    _ringImageWithRadius_lineThickness__cachedRadius = *(void *)&a3;
    _ringImageWithRadius_lineThickness__cachedThickness = *(void *)&a4;
    double v9 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, a3, a3, a3 + a4 * -0.5, 0.0, 6.28318531);
    id v10 = [MEMORY[0x1E4F39C88] layer];
    objc_msgSend(v10, "setBounds:", 0.0, 0.0, a3, a3);
    id v11 = v9;
    objc_msgSend(v10, "setPath:", objc_msgSend(v11, "CGPath"));
    id v12 = [MEMORY[0x1E4FB1618] blackColor];
    objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v12, "CGColor"));

    id v13 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v10, "setFillColor:", objc_msgSend(v13, "CGColor"));

    [v10 setLineWidth:a4];
    CGFloat v14 = [MEMORY[0x1E4F19A30] currentDevice];
    [v14 screenScale];
    CGFloat v16 = v15;
    v21.width = a3 + a3;
    v21.height = a3 + a3;
    UIGraphicsBeginImageContextWithOptions(v21, 0, v16);

    [v10 renderInContext:UIGraphicsGetCurrentContext()];
    uint64_t v17 = UIGraphicsGetImageFromCurrentImageContext();
    CGFloat v18 = (void *)_ringImageWithRadius_lineThickness__image;
    _ringImageWithRadius_lineThickness__image = v17;

    UIGraphicsEndImageContext();
    int v6 = (void *)_ringImageWithRadius_lineThickness__image;
  }
  return v6;
}

- (UIColor)color
{
  return self->_color;
}

- (UIColor)swapColor
{
  return self->_swapColor;
}

- (void)setSwapColor:(id)a3
{
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (UIColor)ringColor
{
  return self->_ringColor;
}

- (UIColor)ringSwapColor
{
  return self->_ringSwapColor;
}

- (void)setRingSwapColor:(id)a3
{
}

- (UIEdgeInsets)touchEdgeInsets
{
  double top = self->_touchEdgeInsets.top;
  double left = self->_touchEdgeInsets.left;
  double bottom = self->_touchEdgeInsets.bottom;
  double right = self->_touchEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchEdgeInsets:(UIEdgeInsets)a3
{
  self->_touchEdgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringSwapColor, 0);
  objc_storeStrong((id *)&self->_ringColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_swapColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_fillView, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
}

@end