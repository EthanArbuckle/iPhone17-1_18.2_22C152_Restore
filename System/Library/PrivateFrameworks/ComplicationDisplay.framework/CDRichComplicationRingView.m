@interface CDRichComplicationRingView
+ (id)_disabledLayerActions;
- (BOOL)_shouldReverseGradient;
- (BOOL)clockwise;
- (CDRichComplicationRingView)initWithCurveWidth:(double)a3 padding:(double)a4 forDevice:(id)a5 withFilterStyle:(int64_t)a6;
- (CGPath)_generatePath;
- (CGPoint)_pointAtProgress:(float)a3;
- (double)_shapeLineWidth;
- (id)_createHeadTailViewWithStartAngle:(double)a3 endAngle:(double)a4 clockwise:(BOOL)a5 additionalWidth:(double)a6;
- (id)_normalizeGradientLocations:(id)a3;
- (void)_layoutHeadTailView:(id)a3 forProgress:(double)a4;
- (void)_setupGradientLayer:(id)a3;
- (void)_updateGradient;
- (void)layoutSubviews;
- (void)setClockwise:(BOOL)a3;
- (void)setProgress:(double)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation CDRichComplicationRingView

- (CDRichComplicationRingView)initWithCurveWidth:(double)a3 padding:(double)a4 forDevice:(id)a5 withFilterStyle:(int64_t)a6
{
  v20.receiver = self;
  v20.super_class = (Class)CDRichComplicationRingView;
  v8 = [(CDRichComplicationShapeView *)&v20 initForDevice:a5 withFilterStyle:a6];
  v9 = v8;
  if (v8)
  {
    v8->_curveWidth = a3;
    v8->_padding = a4;
    v8->_clockwise = 1;
    v10 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    foregroundView = v9->_foregroundView;
    v9->_foregroundView = v10;

    [(CDRichComplicationRingView *)v9 addSubview:v9->_foregroundView];
    uint64_t v12 = [(CDRichComplicationRingView *)v9 _createHeadTailViewWithStartAngle:0 endAngle:-1.57079633 clockwise:1.57079633 additionalWidth:0.0];
    headLayer = v9->_headLayer;
    v9->_headLayer = (CAShapeLayer *)v12;

    uint64_t v14 = [(CDRichComplicationRingView *)v9 _createHeadTailViewWithStartAngle:1 endAngle:-1.57079633 clockwise:1.57079633 additionalWidth:2.0];
    tailStrokeLayer = v9->_tailStrokeLayer;
    v9->_tailStrokeLayer = (CAShapeLayer *)v14;

    id v16 = [MEMORY[0x263F825C8] clearColor];
    -[CAShapeLayer setFillColor:](v9->_tailStrokeLayer, "setFillColor:", [v16 CGColor]);

    uint64_t v17 = [(CDRichComplicationRingView *)v9 _createHeadTailViewWithStartAngle:1 endAngle:0.0 clockwise:6.28318531 additionalWidth:0.0];
    tailLayer = v9->_tailLayer;
    v9->_tailLayer = (CAShapeLayer *)v17;
  }
  return v9;
}

- (void)setClockwise:(BOOL)a3
{
  self->_clockwise = a3;
  [(CDRichComplicationRingView *)self _updateGradient];
  [(CDRichComplicationShapeView *)self _updatePath];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CDRichComplicationRingView;
  [(CDRichComplicationShapeView *)&v5 layoutSubviews];
  [(CDRichComplicationRingView *)self bounds];
  -[UIView setFrame:](self->_foregroundView, "setFrame:");
  [(CDRichComplicationRingView *)self bringSubviewToFront:self->_foregroundView];
  [(CDRichComplicationRingView *)self _layoutHeadTailView:self->_headLayer forProgress:0.0];
  tailStrokeLayer = self->_tailStrokeLayer;
  [(CDRichComplicationShapeView *)self progress];
  -[CDRichComplicationRingView _layoutHeadTailView:forProgress:](self, "_layoutHeadTailView:forProgress:", tailStrokeLayer);
  tailLayer = self->_tailLayer;
  [(CDRichComplicationShapeView *)self progress];
  -[CDRichComplicationRingView _layoutHeadTailView:forProgress:](self, "_layoutHeadTailView:forProgress:", tailLayer);
}

- (void)setProgress:(double)a3
{
  if (a3 == 0.0) {
    double v4 = 0.001;
  }
  else {
    double v4 = a3;
  }
  v5.receiver = self;
  v5.super_class = (Class)CDRichComplicationRingView;
  [(CDRichComplicationShapeView *)&v5 setProgress:v4];
  [(CAShapeLayer *)self->_headLayer setHidden:v4 >= 1.0];
  [(CAShapeLayer *)self->_tailLayer setHidden:v4 < 0.95];
  [(CAShapeLayer *)self->_tailStrokeLayer setHidden:[(CAShapeLayer *)self->_tailLayer isHidden]];
  [(CDRichComplicationRingView *)self setNeedsLayout];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CDRichComplicationRingView;
  -[CDRichComplicationShapeView transitionToMonochromeWithFraction:](&v7, sel_transitionToMonochromeWithFraction_);
  objc_super v5 = [(CDRichComplicationShapeView *)self filterProvider];
  v6 = objc_msgSend(v5, "filtersForView:style:fraction:", self, -[CDRichComplicationShapeView filterStyle](self, "filterStyle"), a3);

  if (v6)
  {
    [(CAShapeLayer *)self->_headLayer setFilters:v6];
    [(CAShapeLayer *)self->_tailLayer setFilters:v6];
  }
}

- (void)updateMonochromeColor
{
  v5.receiver = self;
  v5.super_class = (Class)CDRichComplicationRingView;
  [(CDRichComplicationShapeView *)&v5 updateMonochromeColor];
  v3 = [(CDRichComplicationShapeView *)self filterProvider];
  double v4 = objc_msgSend(v3, "filtersForView:style:", self, -[CDRichComplicationShapeView filterStyle](self, "filterStyle"));

  if (v4)
  {
    [(CAShapeLayer *)self->_headLayer setFilters:v4];
    [(CAShapeLayer *)self->_tailLayer setFilters:v4];
  }
}

- (void)_setupGradientLayer:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F15DD8];
  id v4 = a3;
  [v4 setType:v3];
  objc_msgSend(v4, "setStartPoint:", 0.5, 0.5);
  objc_msgSend(v4, "setEndPoint:", 0.5, 1.0);
  CGAffineTransformMakeRotation(&v6, 3.14159265);
  CGAffineTransform v5 = v6;
  [v4 setAffineTransform:&v5];
}

- (double)_shapeLineWidth
{
  return self->_curveWidth;
}

- (CGPoint)_pointAtProgress:(float)a3
{
  [(CDRichComplicationRingView *)self bounds];
  CGFloat x = v17.origin.x;
  CGFloat y = v17.origin.y;
  CGFloat width = v17.size.width;
  CGFloat height = v17.size.height;
  CGFloat v9 = CGRectGetWidth(v17) * 0.5;
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat v10 = CGRectGetHeight(v18) * 0.5;
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat v11 = CGRectGetWidth(v19) * 0.5 - self->_curveWidth * 0.5 - self->_padding;
  float v12 = a3 * 6.28318531;
  __float2 v13 = __sincosf_stret(v12);
  double v14 = v10 + v13.__sinval * v11;
  double v15 = v9 + v13.__cosval * v11;
  result.CGFloat y = v14;
  result.CGFloat x = v15;
  return result;
}

- (id)_normalizeGradientLocations:(id)a3
{
  id v3 = a3;
  return v3;
}

- (CGPath)_generatePath
{
  [(CDRichComplicationRingView *)self bounds];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  CGFloat v7 = CGRectGetWidth(v12) * 0.5;
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGFloat v8 = CGRectGetHeight(v13) * 0.5;
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", self->_clockwise, v7, v8, CGRectGetWidth(v14) * 0.5 - self->_curveWidth * 0.5 - self->_padding, -1.57079633, 4.71238898);
  id v9 = objc_claimAutoreleasedReturnValue();
  CGFloat v10 = (CGPath *)[v9 CGPath];

  return v10;
}

- (BOOL)_shouldReverseGradient
{
  return !self->_clockwise;
}

- (void)_updateGradient
{
  v9.receiver = self;
  v9.super_class = (Class)CDRichComplicationRingView;
  [(CDRichComplicationShapeView *)&v9 _updateGradient];
  headLayer = self->_headLayer;
  id v4 = [(CDRichComplicationShapeView *)self gradientColors];
  id v5 = [v4 firstObject];
  -[CAShapeLayer setFillColor:](headLayer, "setFillColor:", [v5 CGColor]);

  tailLayer = self->_tailLayer;
  CGFloat v7 = [(CDRichComplicationShapeView *)self gradientColors];
  id v8 = [v7 lastObject];
  -[CAShapeLayer setFillColor:](tailLayer, "setFillColor:", [v8 CGColor]);
}

- (id)_createHeadTailViewWithStartAngle:(double)a3 endAngle:(double)a4 clockwise:(BOOL)a5 additionalWidth:(double)a6
{
  double v7 = self->_curveWidth + a6;
  id v8 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", a5, v7 * 0.5, v7 * 0.5, v7 * 0.5, a3, a4);
  objc_super v9 = [(id)objc_opt_class() _disabledLayerActions];
  id v10 = objc_alloc_init(MEMORY[0x263F15880]);
  id v11 = v8;
  objc_msgSend(v10, "setPath:", objc_msgSend(v11, "CGPath"));
  objc_msgSend(v10, "setBounds:", 0.0, 0.0, v7, v7);
  [v10 setActions:v9];
  CGRect v12 = [(UIView *)self->_foregroundView layer];
  [v12 addSublayer:v10];

  return v10;
}

- (void)_layoutHeadTailView:(id)a3 forProgress:(double)a4
{
  long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v18.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v18.c = v14;
  *(_OWORD *)&v18.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  id v6 = a3;
  [(CDRichComplicationRingView *)self bounds];
  CGFloat v8 = v7 * 0.5;
  [(CDRichComplicationRingView *)self bounds];
  double v10 = v9;
  CGFloat v11 = v9 * 0.5;
  *(_OWORD *)&v17.a = *(_OWORD *)&v18.a;
  *(_OWORD *)&v17.c = v14;
  *(_OWORD *)&v17.tCGFloat x = *(_OWORD *)&v18.tx;
  CGAffineTransformTranslate(&v18, &v17, v8, 0.0);
  CGAffineTransform v16 = v18;
  CGAffineTransformTranslate(&v17, &v16, 0.0, v11);
  CGAffineTransform v18 = v17;
  CGAffineTransform v16 = v17;
  CGAffineTransformRotate(&v17, &v16, a4 * 3.14159265 + a4 * 3.14159265);
  CGAffineTransform v18 = v17;
  CGFloat v12 = -(v10 * 0.5) - self->_padding;
  CGAffineTransform v16 = v17;
  CGAffineTransformTranslate(&v17, &v16, 0.0, v12);
  CGAffineTransform v18 = v17;
  CGFloat v13 = self->_curveWidth * 0.5;
  CGAffineTransform v16 = v17;
  CGAffineTransformTranslate(&v17, &v16, 0.0, v13);
  CGAffineTransform v18 = v17;
  CGAffineTransform v15 = v17;
  [v6 setAffineTransform:&v15];
}

+ (id)_disabledLayerActions
{
  if (_disabledLayerActions_onceToken != -1) {
    dispatch_once(&_disabledLayerActions_onceToken, &__block_literal_global);
  }
  v2 = (void *)_disabledLayerActions__dictionary;
  return v2;
}

void __51__CDRichComplicationRingView__disabledLayerActions__block_invoke()
{
  v4[9] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263EFF9D0] null];
  v3[0] = @"instanceTransform";
  v3[1] = @"contentsMultiplyColor";
  v4[0] = v0;
  v4[1] = v0;
  v3[2] = @"transform";
  v3[3] = @"hidden";
  v4[2] = v0;
  v4[3] = v0;
  v3[4] = @"position";
  v3[5] = @"opacity";
  v4[4] = v0;
  v4[5] = v0;
  v3[6] = @"instanceCount";
  v3[7] = @"instanceDelay";
  v4[6] = v0;
  v4[7] = v0;
  v3[8] = @"backgroundColor";
  v4[8] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:9];
  v2 = (void *)_disabledLayerActions__dictionary;
  _disabledLayerActions__dictionarCGFloat y = v1;
}

- (BOOL)clockwise
{
  return self->_clockwise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tailStrokeLayer, 0);
  objc_storeStrong((id *)&self->_tailLayer, 0);
  objc_storeStrong((id *)&self->_headLayer, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
}

@end