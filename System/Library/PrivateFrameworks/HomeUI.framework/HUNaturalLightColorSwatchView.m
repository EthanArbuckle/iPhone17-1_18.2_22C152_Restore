@interface HUNaturalLightColorSwatchView
+ (id)_createGradientLayer;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CAGradientLayer)circleGradientLayer;
- (CAGradientLayer)selectedCircleGradientLayer;
- (CAShapeLayer)circleMaskLayer;
- (CAShapeLayer)circleOuterLayer;
- (CAShapeLayer)selectedCircleInnerLayer;
- (CAShapeLayer)selectedCircleMaskLayer;
- (HUNaturalLightColorSwatchView)initWithFrame:(CGRect)a3;
- (UIImage)truetoneIcon;
- (id)_buildMaskFromImage:(id)a3;
- (unint64_t)selectionState;
- (void)_updateLayout;
- (void)layoutSubviews;
- (void)setCircleGradientLayer:(id)a3;
- (void)setCircleMaskLayer:(id)a3;
- (void)setCircleOuterLayer:(id)a3;
- (void)setSelectedCircleGradientLayer:(id)a3;
- (void)setSelectedCircleInnerLayer:(id)a3;
- (void)setSelectedCircleMaskLayer:(id)a3;
- (void)setSelectionState:(unint64_t)a3;
- (void)setTruetoneIcon:(id)a3;
@end

@implementation HUNaturalLightColorSwatchView

- (HUNaturalLightColorSwatchView)initWithFrame:(CGRect)a3
{
  v33.receiver = self;
  v33.super_class = (Class)HUNaturalLightColorSwatchView;
  v3 = -[HUNaturalLightColorSwatchView initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    circleMaskLayer = v3->_circleMaskLayer;
    v3->_circleMaskLayer = v4;

    [(CAShapeLayer *)v3->_circleMaskLayer setFillRule:*MEMORY[0x1E4F39FB8]];
    [(CAShapeLayer *)v3->_circleMaskLayer setLineWidth:0.5];
    v6 = [(HUNaturalLightColorSwatchView *)v3 layer];
    [v6 addSublayer:v3->_circleMaskLayer];

    uint64_t v7 = [(id)objc_opt_class() _createGradientLayer];
    circleGradientLayer = v3->_circleGradientLayer;
    v3->_circleGradientLayer = (CAGradientLayer *)v7;

    [(CAGradientLayer *)v3->_circleGradientLayer setMask:v3->_circleMaskLayer];
    v9 = [(HUNaturalLightColorSwatchView *)v3 layer];
    [v9 addSublayer:v3->_circleGradientLayer];

    v10 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    selectedCircleMaskLayer = v3->_selectedCircleMaskLayer;
    v3->_selectedCircleMaskLayer = v10;

    id v12 = [MEMORY[0x1E4F428B8] clearColor];
    -[CAShapeLayer setFillColor:](v3->_selectedCircleMaskLayer, "setFillColor:", [v12 CGColor]);

    id v13 = [MEMORY[0x1E4F428B8] blackColor];
    -[CAShapeLayer setStrokeColor:](v3->_selectedCircleMaskLayer, "setStrokeColor:", [v13 CGColor]);

    [(CAShapeLayer *)v3->_selectedCircleMaskLayer setLineWidth:3.0];
    uint64_t v14 = [(id)objc_opt_class() _createGradientLayer];
    selectedCircleGradientLayer = v3->_selectedCircleGradientLayer;
    v3->_selectedCircleGradientLayer = (CAGradientLayer *)v14;

    [(CAGradientLayer *)v3->_selectedCircleGradientLayer setMask:v3->_selectedCircleMaskLayer];
    v16 = [(HUNaturalLightColorSwatchView *)v3 layer];
    [v16 addSublayer:v3->_selectedCircleGradientLayer];

    v17 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    selectedCircleInnerLayer = v3->_selectedCircleInnerLayer;
    v3->_selectedCircleInnerLayer = v17;

    [(CAShapeLayer *)v3->_selectedCircleInnerLayer setLineWidth:0.3];
    v19 = [MEMORY[0x1E4F428B8] systemBlackColor];
    id v20 = [v19 colorWithAlphaComponent:0.1];
    -[CAShapeLayer setStrokeColor:](v3->_selectedCircleInnerLayer, "setStrokeColor:", [v20 CGColor]);

    id v21 = [MEMORY[0x1E4F428B8] clearColor];
    -[CAShapeLayer setFillColor:](v3->_selectedCircleInnerLayer, "setFillColor:", [v21 CGColor]);

    v22 = [(HUNaturalLightColorSwatchView *)v3 layer];
    [v22 addSublayer:v3->_selectedCircleInnerLayer];

    v23 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    circleOuterLayer = v3->_circleOuterLayer;
    v3->_circleOuterLayer = v23;

    [(CAShapeLayer *)v3->_circleOuterLayer setLineWidth:0.300000012];
    v25 = [MEMORY[0x1E4F428B8] systemBlackColor];
    id v26 = [v25 colorWithAlphaComponent:0.1];
    -[CAShapeLayer setStrokeColor:](v3->_circleOuterLayer, "setStrokeColor:", [v26 CGColor]);

    id v27 = [MEMORY[0x1E4F428B8] clearColor];
    -[CAShapeLayer setFillColor:](v3->_circleOuterLayer, "setFillColor:", [v27 CGColor]);

    v28 = [(HUNaturalLightColorSwatchView *)v3 layer];
    [v28 addSublayer:v3->_circleOuterLayer];

    v29 = [MEMORY[0x1E4F42A98] configurationWithPointSize:6 weight:21.0];
    uint64_t v30 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"truetone" withConfiguration:v29];
    truetoneIcon = v3->_truetoneIcon;
    v3->_truetoneIcon = (UIImage *)v30;

    [(HUNaturalLightColorSwatchView *)v3 setClipsToBounds:0];
  }
  return v3;
}

- (void)setSelectionState:(unint64_t)a3
{
  if (self->_selectionState != a3)
  {
    self->_selectionState = a3;
    [(HUNaturalLightColorSwatchView *)self _updateLayout];
  }
}

- (void)_updateLayout
{
  v3 = [(HUNaturalLightColorSwatchView *)self truetoneIcon];
  id v53 = [(HUNaturalLightColorSwatchView *)self _buildMaskFromImage:v3];

  if (v53)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v53];
    [(HUNaturalLightColorSwatchView *)self setMaskView:v4];
  }
  [(HUNaturalLightColorSwatchView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(HUNaturalLightColorSwatchView *)self circleGradientLayer];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  [(HUNaturalLightColorSwatchView *)self bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [(HUNaturalLightColorSwatchView *)self selectedCircleGradientLayer];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  [(HUNaturalLightColorSwatchView *)self bounds];
  double v24 = v23;
  [(HUNaturalLightColorSwatchView *)self bounds];
  if (v24 >= v25) {
    double v26 = v25;
  }
  else {
    double v26 = v24;
  }
  double v27 = v26 + -0.600000024;
  [(HUNaturalLightColorSwatchView *)self bounds];
  double v29 = v28;
  [(HUNaturalLightColorSwatchView *)self bounds];
  double v31 = v30;
  if (([(HUNaturalLightColorSwatchView *)self selectionState] & 2) != 0
    || ([(HUNaturalLightColorSwatchView *)self selectionState] & 1) != 0)
  {
    v37 = [(HUNaturalLightColorSwatchView *)self selectedCircleGradientLayer];
    [v37 setHidden:0];

    v38 = [(HUNaturalLightColorSwatchView *)self selectedCircleInnerLayer];
    [v38 setHidden:0];

    double v34 = v27 * 0.5;
    double v35 = v34 + -3.0;
    double v36 = v34 + -3.0 + -3.0;
  }
  else
  {
    v32 = [(HUNaturalLightColorSwatchView *)self selectedCircleGradientLayer];
    [v32 setHidden:1];

    objc_super v33 = [(HUNaturalLightColorSwatchView *)self selectedCircleInnerLayer];
    [v33 setHidden:1];

    double v34 = v27 * 0.5;
    double v35 = v34 + -3.0;
    double v36 = v34;
  }
  double v39 = v31 * 0.5;
  double v40 = v29 * 0.5;
  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v40, v39, v36, 0.0, 6.28318531);
  id v41 = objc_claimAutoreleasedReturnValue();
  uint64_t v42 = [v41 CGPath];
  v43 = [(HUNaturalLightColorSwatchView *)self circleMaskLayer];
  [v43 setPath:v42];

  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v40, v39, v34 + -1.5, 0.0, 6.28318531);
  id v44 = objc_claimAutoreleasedReturnValue();
  uint64_t v45 = [v44 CGPath];
  v46 = [(HUNaturalLightColorSwatchView *)self selectedCircleMaskLayer];
  [v46 setPath:v45];

  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v40, v39, v35, 0.0, 6.28318531);
  id v47 = objc_claimAutoreleasedReturnValue();
  uint64_t v48 = [v47 CGPath];
  v49 = [(HUNaturalLightColorSwatchView *)self selectedCircleInnerLayer];
  [v49 setPath:v48];

  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v40, v39, v34, 0.0, 6.28318531);
  id v50 = objc_claimAutoreleasedReturnValue();
  uint64_t v51 = [v50 CGPath];
  v52 = [(HUNaturalLightColorSwatchView *)self circleOuterLayer];
  [v52 setPath:v51];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUNaturalLightColorSwatchView;
  [(HUNaturalLightColorSwatchView *)&v3 layoutSubviews];
  [(HUNaturalLightColorSwatchView *)self _updateLayout];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if (([v4 hasPrefix:@"path"] & 1) != 0
    || ([v4 hasPrefix:@"fillColor"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUNaturalLightColorSwatchView;
    BOOL v5 = [(HUNaturalLightColorSwatchView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

+ (id)_createGradientLayer
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F428B8] colorWithRed:0.859 green:0.824 blue:1.0 alpha:1.0];
  objc_super v3 = [MEMORY[0x1E4F428B8] colorWithRed:0.918 green:0.918 blue:0.918 alpha:1.0];
  id v4 = [MEMORY[0x1E4F428B8] colorWithRed:1.0 green:0.878 blue:0.663 alpha:1.0];
  BOOL v5 = [MEMORY[0x1E4F428B8] colorWithRed:1.0 green:0.651 blue:0.651 alpha:1.0];
  id v6 = v2;
  v13[0] = [v6 CGColor];
  id v7 = v3;
  v13[1] = [v7 CGColor];
  id v8 = v4;
  v13[2] = [v8 CGColor];
  id v9 = v5;
  v13[3] = [v9 CGColor];
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
  id v11 = objc_alloc_init(MEMORY[0x1E4F39BD0]);
  [v11 setColors:v10];
  [v11 setLocations:&unk_1F19B5648];
  objc_msgSend(v11, "setStartPoint:", 0.0, 0.0);
  objc_msgSend(v11, "setEndPoint:", 1.0, 1.0);

  return v11;
}

- (id)_buildMaskFromImage:(id)a3
{
  id v4 = a3;
  [(HUNaturalLightColorSwatchView *)self bounds];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  double width = v14.size.width;
  double height = v14.size.height;
  if (CGRectIsEmpty(v14))
  {
    id v9 = 0;
  }
  else
  {
    v13.double width = width;
    v13.double height = height;
    UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
    objc_msgSend(v4, "drawInRect:", 14.0, 14.0, width + -28.0, height + -28.0);
    double v10 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:1.0];
    [v10 setFill];

    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.double width = width;
    v15.size.double height = height;
    UIRectFillUsingBlendMode(v15, kCGBlendModeSourceOut);
    id v9 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }

  return v9;
}

- (unint64_t)selectionState
{
  return self->_selectionState;
}

- (CAShapeLayer)circleMaskLayer
{
  return self->_circleMaskLayer;
}

- (void)setCircleMaskLayer:(id)a3
{
}

- (CAGradientLayer)circleGradientLayer
{
  return self->_circleGradientLayer;
}

- (void)setCircleGradientLayer:(id)a3
{
}

- (CAShapeLayer)selectedCircleMaskLayer
{
  return self->_selectedCircleMaskLayer;
}

- (void)setSelectedCircleMaskLayer:(id)a3
{
}

- (CAGradientLayer)selectedCircleGradientLayer
{
  return self->_selectedCircleGradientLayer;
}

- (void)setSelectedCircleGradientLayer:(id)a3
{
}

- (CAShapeLayer)selectedCircleInnerLayer
{
  return self->_selectedCircleInnerLayer;
}

- (void)setSelectedCircleInnerLayer:(id)a3
{
}

- (CAShapeLayer)circleOuterLayer
{
  return self->_circleOuterLayer;
}

- (void)setCircleOuterLayer:(id)a3
{
}

- (UIImage)truetoneIcon
{
  return self->_truetoneIcon;
}

- (void)setTruetoneIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truetoneIcon, 0);
  objc_storeStrong((id *)&self->_circleOuterLayer, 0);
  objc_storeStrong((id *)&self->_selectedCircleInnerLayer, 0);
  objc_storeStrong((id *)&self->_selectedCircleGradientLayer, 0);
  objc_storeStrong((id *)&self->_selectedCircleMaskLayer, 0);
  objc_storeStrong((id *)&self->_circleGradientLayer, 0);

  objc_storeStrong((id *)&self->_circleMaskLayer, 0);
}

@end