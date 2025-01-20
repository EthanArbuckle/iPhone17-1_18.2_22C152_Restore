@interface CAMDirectionalIndicator
+ (CGSize)_circleSize;
+ (id)_createCircleImage;
- (CAMDirectionalIndicator)initWithFrame:(CGRect)a3;
- (CAShapeLayer)_arrowLayer;
- (CGSize)intrinsicContentSize;
- (id)accessibilityIdentifier;
- (id)hudItemForAccessibilityHUDManager:(id)a3;
- (int64_t)direction;
- (void)_updateArrowColorAnimated:(BOOL)a3;
- (void)_updateArrowLineWidth;
- (void)_updateArrowShapeAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)selectedByAccessibilityHUDManager:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setDirection:(int64_t)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CAMDirectionalIndicator

+ (CGSize)_circleSize
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 scale];
  double v4 = 1.0 / v3;

  double v5 = v4 + 27.0;
  double v6 = v4 + 27.0;
  result.height = v6;
  result.width = v5;
  return result;
}

+ (id)_createCircleImage
{
  CGFloat v2 = *MEMORY[0x263F001A8];
  CGFloat v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  [a1 _circleSize];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  v8 = [MEMORY[0x263F82B60] mainScreen];
  [v8 scale];
  CGFloat v10 = v9;
  v16.width = v5;
  v16.height = v7;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v10);

  CurrentContext = UIGraphicsGetCurrentContext();
  v12 = +[CAMFullscreenViewfinder lightControlBackgroundColor];
  [v12 setFill];
  v17.origin.x = v2;
  v17.origin.y = v3;
  v17.size.width = v5;
  v17.size.height = v7;
  CGContextFillEllipseInRect(CurrentContext, v17);
  v13 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v13;
}

- (CAMDirectionalIndicator)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CAMDirectionalIndicator;
  CGFloat v3 = -[CAMDirectionalIndicator initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    [(CAShapeLayer *)v4 setFillColor:0];
    [(CAShapeLayer *)v4 setLineCap:*MEMORY[0x263F15E78]];
    [(CAShapeLayer *)v4 setLineJoin:*MEMORY[0x263F15E88]];
    arrowLayer = v3->__arrowLayer;
    v3->__arrowLayer = v4;
    double v6 = v4;

    CGFloat v7 = [(CAMDirectionalIndicator *)v3 layer];
    [v7 addSublayer:v6];

    id v8 = [(id)objc_opt_class() _createCircleImage];
    uint64_t v9 = [v8 CGImage];
    CGFloat v10 = [(CAMDirectionalIndicator *)v3 layer];
    [v10 setContents:v9];

    uint64_t v11 = *MEMORY[0x263F15E00];
    v12 = [(CAMDirectionalIndicator *)v3 layer];
    [v12 setContentsGravity:v11];

    v13 = [(CAMDirectionalIndicator *)v3 traitCollection];
    [v13 displayScale];
    double v15 = v14;
    CGSize v16 = [(CAMDirectionalIndicator *)v3 layer];
    [v16 setContentsScale:v15];

    [(CAMDirectionalIndicator *)v3 _updateArrowColorAnimated:0];
    [(CAMDirectionalIndicator *)v3 _updateArrowLineWidth];
  }
  return v3;
}

- (void)layoutSubviews
{
}

- (CGSize)intrinsicContentSize
{
  CGFloat v2 = objc_opt_class();
  [v2 _circleSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setDirection:(int64_t)a3
{
}

- (void)setDirection:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_direction != a3)
  {
    self->_direction = a3;
    [(CAMDirectionalIndicator *)self _updateArrowShapeAnimated:a4];
  }
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  int v7 = [(CAMDirectionalIndicator *)self isSelected];
  v8.receiver = self;
  v8.super_class = (Class)CAMDirectionalIndicator;
  [(CAMDirectionalIndicator *)&v8 setSelected:v5];
  if (v7 != v5) {
    [(CAMDirectionalIndicator *)self _updateArrowColorAnimated:v4];
  }
}

- (void)_updateArrowShapeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(CAMDirectionalIndicator *)self bounds];
  UIRectGetCenter();
  CAMPixelWidthForView(self);
  CAMPixelWidthForView(self);
  [(CAMDirectionalIndicator *)self direction];
  CAMPixelWidthForView(self);
  CAMPixelWidthForView(self);
  UIRectCenteredAboutPointScale();
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  CGFloat MinY = CGRectGetMinY(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v28);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v29);
  Mutable = CGPathCreateMutable();
  int64_t v15 = [(CAMDirectionalIndicator *)self direction];
  if (v15)
  {
    if (v15 != 1) {
      goto LABEL_6;
    }
    CGFloat v16 = MinY;
  }
  else
  {
    CGFloat v16 = MaxY;
    CGFloat MaxY = MinY;
  }
  CGPathMoveToPoint(Mutable, 0, MinX, v16);
  CGPathAddLineToPoint(Mutable, 0, MidX, MaxY);
  CGPathAddLineToPoint(Mutable, 0, MaxX, v16);
LABEL_6:
  id v23 = [(CAMDirectionalIndicator *)self _arrowLayer];
  if (v3)
  {
    CGRect v17 = [MEMORY[0x263F15760] animationWithKeyPath:@"path"];
    [v17 setAdditive:1];
    objc_msgSend(v17, "setFromValue:", objc_msgSend(v23, "path"));
    [v17 setToValue:Mutable];
    LODWORD(v18) = 1045220557;
    LODWORD(v19) = 1041865114;
    LODWORD(v20) = 1.0;
    LODWORD(v21) = 1045220557;
    v22 = [MEMORY[0x263F15808] functionWithControlPoints:v18 :v21 :v19 :v20];
    [v17 setTimingFunction:v22];

    [v17 setDuration:0.5];
    [v23 addAnimation:v17 forKey:@"invertDirection"];
  }
  [v23 setPath:Mutable];
  CGPathRelease(Mutable);
}

- (void)_updateArrowLineWidth
{
  double v3 = 2.0;
  double v4 = 2.0 - CAMPixelWidthForView(self);
  BOOL v5 = [(CAMDirectionalIndicator *)self traitCollection];
  uint64_t v6 = [v5 legibilityWeight];

  if (v6 != 1) {
    double v3 = v4;
  }
  id v7 = [(CAMDirectionalIndicator *)self _arrowLayer];
  [v7 setLineWidth:v3];
}

- (void)_updateArrowColorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CAMDirectionalIndicator *)self isSelected]) {
    CAMYellowColor();
  }
  else {
  id v5 = [MEMORY[0x263F825C8] whiteColor];
  }
  uint64_t v6 = [v5 CGColor];

  id v16 = [(CAMDirectionalIndicator *)self _arrowLayer];
  id v7 = [v16 presentationLayer];
  if (v7) {
    objc_super v8 = v7;
  }
  else {
    objc_super v8 = v16;
  }
  id v9 = v8;

  if (v3)
  {
    CGFloat v10 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeColor"];
    objc_msgSend(v10, "setFromValue:", objc_msgSend(v9, "strokeColor"));
    [v10 setToValue:v6];
    LODWORD(v11) = 1045220557;
    LODWORD(v12) = 1041865114;
    LODWORD(v13) = 1.0;
    LODWORD(v14) = 1045220557;
    int64_t v15 = [MEMORY[0x263F15808] functionWithControlPoints:v11 :v14 :v12 :v13];
    [v10 setTimingFunction:v15];

    [v10 setDuration:0.5];
    [v16 addAnimation:v10 forKey:@"selectionColor"];
  }
  [v16 setStrokeColor:v6];
}

- (id)accessibilityIdentifier
{
  return @"StatusBarCameraControlsButton";
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  int64_t v4 = [(CAMDirectionalIndicator *)self direction];
  id v5 = @"chevron.down";
  if (v4 != 1) {
    id v5 = 0;
  }
  if (v4) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = @"chevron.up";
  }
  id v7 = (void *)MEMORY[0x263F827E8];
  objc_super v8 = [(CAMDirectionalIndicator *)self traitCollection];
  id v9 = [v7 systemImageNamed:v6 compatibleWithTraitCollection:v8];

  id v10 = objc_alloc(MEMORY[0x263F823C0]);
  double v11 = objc_msgSend(v10, "initWithTitle:image:imageInsets:scaleImage:", 0, v9, 1, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));

  return v11;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
}

- (int64_t)direction
{
  return self->_direction;
}

- (CAShapeLayer)_arrowLayer
{
  return self->__arrowLayer;
}

- (void).cxx_destruct
{
}

@end