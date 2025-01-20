@interface CAMShutterButtonRingView
- (BOOL)showContrastBorder;
- (CAMShutterButtonRingView)initWithCoder:(id)a3;
- (CAMShutterButtonRingView)initWithFrame:(CGRect)a3;
- (CAMShutterButtonRingView)initWithSpec:(CAMShutterButtonSpec *)a3;
- (CAMShutterButtonSpec)spec;
- (UIColor)color;
- (UIEdgeInsets)alignmentRectInsets;
- (void)drawRect:(CGRect)a3;
- (void)setColor:(id)a3;
- (void)setShowContrastBorder:(BOOL)a3;
- (void)setSpec:(CAMShutterButtonSpec *)a3;
@end

@implementation CAMShutterButtonRingView

- (CAMShutterButtonRingView)initWithSpec:(CAMShutterButtonSpec *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CAMShutterButtonRingView;
  v4 = -[CAMShutterButtonRingView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = (CAMShutterButtonRingView *)v4;
  if (v4)
  {
    double interRingSpacing = a3->interRingSpacing;
    long long v7 = *(_OWORD *)&a3->stopSquareSideLength;
    *(_OWORD *)(v4 + 424) = *(_OWORD *)&a3->outerRingDiameter;
    *(_OWORD *)(v4 + 440) = v7;
    *((double *)v4 + 57) = interRingSpacing;
    uint64_t v8 = [MEMORY[0x263F825C8] whiteColor];
    color = v5->_color;
    v5->_color = (UIColor *)v8;

    v10 = [MEMORY[0x263F825C8] clearColor];
    [(CAMShutterButtonRingView *)v5 setBackgroundColor:v10];

    [(CAMShutterButtonRingView *)v5 setUserInteractionEnabled:0];
    [(CAMShutterButtonRingView *)v5 setContentMode:3];
    v11 = v5;
  }

  return v5;
}

- (void)setShowContrastBorder:(BOOL)a3
{
  if (self->_showContrastBorder != a3)
  {
    self->_showContrastBorder = a3;
    [(CAMShutterButtonRingView *)self setNeedsDisplay];
  }
}

- (void)setColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_color] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    [(CAMShutterButtonRingView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  BOOL v4 = [(CAMShutterButtonRingView *)self showContrastBorder];
  double outerRingStrokeWidth = self->_spec.outerRingStrokeWidth;
  double v6 = self->_spec.outerRingDiameter * 0.5;
  [(CAMShutterButtonRingView *)self bounds];
  -[CAMShutterButtonRingView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  double MidX = CGRectGetMidX(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v20);
  CurrentContext = UIGraphicsGetCurrentContext();
  v14 = [(CAMShutterButtonRingView *)self color];
  [v14 set];

  CGContextSetLineWidth(CurrentContext, outerRingStrokeWidth);
  CGContextBeginPath(CurrentContext);
  CGContextMoveToPoint(CurrentContext, v6 - outerRingStrokeWidth * 0.5 + MidX, MidY);
  CGContextAddArc(CurrentContext, MidX, MidY, v6 - outerRingStrokeWidth * 0.5, 6.28318531, 0.0, 1);
  CGContextClosePath(CurrentContext);
  CGContextStrokePath(CurrentContext);
  if (v4)
  {
    v15 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.15];
    [v15 set];

    CGContextSetLineWidth(CurrentContext, 1.0);
    double v16 = CAMPixelWidthForView(self);
    CGFloat v17 = v6 - outerRingStrokeWidth - v16 * 0.5;
    CGContextBeginPath(CurrentContext);
    CGContextMoveToPoint(CurrentContext, v6 + 0.5 + MidX, MidY);
    CGContextAddArc(CurrentContext, MidX, MidY, v6 + 0.5, 6.28318531, 0.0, 1);
    CGContextClosePath(CurrentContext);
    CGContextStrokePath(CurrentContext);
    CGContextSetLineWidth(CurrentContext, v16);
    CGContextBeginPath(CurrentContext);
    CGContextMoveToPoint(CurrentContext, MidX + v17, MidY);
    CGContextAddArc(CurrentContext, MidX, MidY, v17, 6.28318531, 0.0, 1);
    CGContextClosePath(CurrentContext);
    CGContextStrokePath(CurrentContext);
  }
}

- (BOOL)showContrastBorder
{
  return self->_showContrastBorder;
}

- (UIColor)color
{
  return self->_color;
}

- (CAMShutterButtonRingView)initWithFrame:(CGRect)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  uint64_t v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  CAMShutterButtonSpecForLayoutStyle(v5, (uint64_t)&v9);
  v7[0] = v9;
  v7[1] = v10;
  uint64_t v8 = v11;
  return [(CAMShutterButtonRingView *)self initWithSpec:v7];
}

- (CAMShutterButtonRingView)initWithCoder:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  uint64_t v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  CAMShutterButtonSpecForLayoutStyle(v5, (uint64_t)&v9);
  v7[0] = v9;
  v7[1] = v10;
  uint64_t v8 = v11;
  return [(CAMShutterButtonRingView *)self initWithSpec:v7];
}

- (UIEdgeInsets)alignmentRectInsets
{
  BOOL v2 = [(CAMShutterButtonRingView *)self showContrastBorder];
  double v3 = 0.0;
  if (v2) {
    double v3 = 1.0;
  }
  double v4 = v3;
  double v5 = v3;
  double v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setSpec:(CAMShutterButtonSpec *)a3
{
  double interRingSpacing = a3->interRingSpacing;
  long long v4 = *(_OWORD *)&a3->stopSquareSideLength;
  *(_OWORD *)&self->_spec.outerRingDiameter = *(_OWORD *)&a3->outerRingDiameter;
  *(_OWORD *)&self->_spec.stopSquareSideLength = v4;
  self->_spec.double interRingSpacing = interRingSpacing;
  [(CAMShutterButtonRingView *)self setNeedsDisplay];
}

- (CAMShutterButtonSpec)spec
{
  long long v3 = *(_OWORD *)&self[11].outerRingDiameter;
  *(_OWORD *)&retstr->outerRingDiameter = *(_OWORD *)&self[10].stopSquareCornerRadius;
  *(_OWORD *)&retstr->stopSquareSideLength = v3;
  retstr->double interRingSpacing = self[11].stopSquareSideLength;
  return self;
}

- (void).cxx_destruct
{
}

@end