@interface SCATGestureArrowView
+ (void)getCurveArcCenter:(CGPoint *)a3 startAngle:(double *)a4 endAngle:(double *)a5 updatedFingerAngle:(double *)a6 updatedFingerCenter:(CGPoint *)a7 withFingerAngle:(double)a8 fingerCenter:(CGPoint)a9 curveRadius:(double)a10 distanceToMove:(double)a11 onLeft:(BOOL)a12;
- (BOOL)_isGrayArrow;
- (BOOL)isControlArrow;
- (BOOL)isPressed;
- (BOOL)shouldClearFingerCircle;
- (CGPath)_arrowPath;
- (CGPath)_arrowPathInBoundingBoxAtOrigin;
- (CGPath)_newCurvedArrowPathWithIntervals:(unint64_t)a3;
- (CGPath)_newCurvedGrayArrowOutlinePath;
- (CGPath)_newDefaultArrowPath;
- (CGPath)_newGrayArrowOutlinePath;
- (CGPath)_newStraightArrowPathWithIntervals:(unint64_t)a3;
- (CGPath)_newStraightGrayArrowOutlinePath;
- (CGPath)scatPath;
- (CGPoint)tailPoint;
- (CGRect)_frameNeeded;
- (CGRect)scatFrame;
- (SCATGestureArrowView)initWithFrame:(CGRect)a3;
- (SCATGestureDrawingView)gestureDrawingView;
- (double)_distanceForCurveWithRadius:(double)a3 onLeft:(BOOL)a4;
- (double)_distanceForPreview;
- (double)curvature;
- (double)distance;
- (double)tailAngle;
- (id)_fingerCircleImage;
- (unint64_t)style;
- (void)_addArrowHeadToPath:(CGPath *)a3 baseLeftPoint:(CGPoint)a4 baseRightPoint:(CGPoint)a5 tipPoint:(CGPoint)a6;
- (void)_addCircleWithRadius:(double)a3 center:(CGPoint)a4 inContext:(CGContext *)a5;
- (void)_addCircleWithRadius:(double)a3 inContext:(CGContext *)a4;
- (void)_addGrayArrowHeadLineToPath:(CGPath *)a3 bottomPoint:(CGPoint)a4 tipPoint:(CGPoint)a5 sideAngle:(double)a6 sideLength:(double)a7 outlineThickness:(double)a8 innerThickness:(double)a9;
- (void)_addGrayArrowHeadToPath:(CGPath *)a3 tipAngle:(double)a4 tipPoint:(CGPoint)a5;
- (void)_addGrayFingerIfNecessaryToPath:(CGPath *)a3;
- (void)_clearCircleWithRadius:(double)a3 center:(CGPoint)a4 inContext:(CGContext *)a5;
- (void)_clearCircleWithRadius:(double)a3 inContext:(CGContext *)a4;
- (void)_drawCurvedLineInIntervals:(unint64_t)a3 spacingBetweenIntervals:(double)a4 drawingBlock:(id)a5;
- (void)_drawFingerAtArrowHeadInContext:(CGContext *)a3;
- (void)_drawGrayArrowInContext:(CGContext *)a3;
- (void)_drawLineOfCirclesInContext:(CGContext *)a3;
- (void)_drawStraightLineInIntervals:(unint64_t)a3 spacingBetweenIntervals:(double)a4 drawingBlock:(id)a5;
- (void)_fillArrowPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)_getCurveRadius:(double *)a3 onLeft:(BOOL *)a4;
- (void)_propertyDidChange;
- (void)_uncacheArrowPaths;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setCurvature:(double)a3;
- (void)setDistance:(double)a3;
- (void)setGestureDrawingView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsControlArrow:(BOOL)a3;
- (void)setPressed:(BOOL)a3;
- (void)setShouldClearFingerCircle:(BOOL)a3;
- (void)setStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4;
- (void)setStyle:(unint64_t)a3;
- (void)setTailAngle:(double)a3;
- (void)setTailPoint:(CGPoint)a3;
@end

@implementation SCATGestureArrowView

+ (void)getCurveArcCenter:(CGPoint *)a3 startAngle:(double *)a4 endAngle:(double *)a5 updatedFingerAngle:(double *)a6 updatedFingerCenter:(CGPoint *)a7 withFingerAngle:(double)a8 fingerCenter:(CGPoint)a9 curveRadius:(double)a10 distanceToMove:(double)a11 onLeft:(BOOL)a12
{
  double y = a9.y;
  double x = a9.x;
  double v20 = a8 + -1.57079633;
  double v21 = a8 + 1.57079633;
  if (a12) {
    double v22 = a8 + -1.57079633;
  }
  else {
    double v22 = a8 + 1.57079633;
  }
  if (a12) {
    double v23 = v21;
  }
  else {
    double v23 = v20;
  }
  double v24 = a11 / a10;
  double v25 = -(a11 / a10);
  if (a12) {
    double v26 = -1.57079633;
  }
  else {
    double v26 = 1.57079633;
  }
  if (a12) {
    double v27 = v25;
  }
  else {
    double v27 = v24;
  }
  __double2 v28 = __sincos_stret(v22);
  double v29 = x + a10 * v28.__cosval;
  double v30 = y + a10 * v28.__sinval;
  double v31 = v23 + v27;
  __double2 v32 = __sincos_stret(v23 + v27);
  if (a3)
  {
    a3->double x = v29;
    a3->double y = v30;
  }
  if (a4) {
    *a4 = v23;
  }
  if (a5) {
    *a5 = v31;
  }
  if (a6) {
    *a6 = v26 + v31;
  }
  if (a7)
  {
    a7->double x = v29 + a10 * v32.__cosval;
    a7->double y = v30 + a10 * v32.__sinval;
  }
}

- (SCATGestureArrowView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCATGestureArrowView;
  v3 = -[SCATGestureArrowView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SCATGestureArrowView *)v3 setOpaque:0];
    [(SCATGestureArrowView *)v4 setContentMode:3];
    [(SCATGestureArrowView *)v4 setStyle:0];
  }
  return v4;
}

- (void)dealloc
{
  arrowPath = self->_arrowPath;
  if (arrowPath) {
    CFRelease(arrowPath);
  }
  arrowPathInBoundingBoxAtOrigin = self->_arrowPathInBoundingBoxAtOrigin;
  if (arrowPathInBoundingBoxAtOrigin) {
    CFRelease(arrowPathInBoundingBoxAtOrigin);
  }
  v5.receiver = self;
  v5.super_class = (Class)SCATGestureArrowView;
  [(SCATGestureArrowView *)&v5 dealloc];
}

- (void)setStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  -[SCATGestureArrowView setTailPoint:](self, "setTailPoint:");
  long double v9 = y - v6;
  long double v10 = x - v7;
  [(SCATGestureArrowView *)self setTailAngle:(double)atan2(v9, v10)];
  [(SCATGestureArrowView *)self setCurvature:0.0];
  double v11 = sqrt(v10 * v10 + v9 * v9);

  [(SCATGestureArrowView *)self setDistance:v11];
}

- (CGPoint)tailPoint
{
  double x = self->_tailPoint.x;
  double y = self->_tailPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTailPoint:(CGPoint)a3
{
  if (self->_tailPoint.x != a3.x || self->_tailPoint.y != a3.y)
  {
    self->_tailPoint = a3;
    [(SCATGestureArrowView *)self _propertyDidChange];
  }
}

- (void)setTailAngle:(double)a3
{
  if (self->_tailAngle != a3)
  {
    self->_tailAngle = a3;
    [(SCATGestureArrowView *)self _propertyDidChange];
  }
}

- (void)setCurvature:(double)a3
{
  if (self->_curvature != a3)
  {
    self->_curvature = a3;
    [(SCATGestureArrowView *)self _propertyDidChange];
  }
}

- (void)setDistance:(double)a3
{
  if (self->_distance != a3)
  {
    self->_distance = a3;
    [(SCATGestureArrowView *)self _propertyDidChange];
  }
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(SCATGestureArrowView *)self _propertyDidChange];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(SCATGestureArrowView *)self isHighlighted];
  v6.receiver = self;
  v6.super_class = (Class)SCATGestureArrowView;
  [(SCATGestureArrowView *)&v6 setHighlighted:v3];
  if (v5 != v3) {
    [(SCATGestureArrowView *)self setNeedsDisplay];
  }
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    [(SCATGestureArrowView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  unsigned int v5 = [(SCATGestureArrowView *)self _isGrayArrow];
  if ((v5 & 1) != 0
    || ([(SCATGestureArrowView *)self distance],
        double v7 = v6,
        +[SCATStyleProvider sharedStyleProvider],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v8 arrowHeadBaseOffset],
        double v10 = v9,
        v8,
        v7 > v10))
  {
    if (![(SCATGestureArrowView *)self style]) {
      [(SCATGestureArrowView *)self _drawLineOfCirclesInContext:CurrentContext];
    }
    if (v5)
    {
      if ((id)[(SCATGestureArrowView *)self style] == (id)6) {
        [(SCATGestureArrowView *)self _drawFingerAtArrowHeadInContext:CurrentContext];
      }
      [(SCATGestureArrowView *)self _drawGrayArrowInContext:CurrentContext];
    }
    else
    {
      double v11 = [(SCATGestureArrowView *)self _arrowPath];
      -[SCATGestureArrowView _fillArrowPath:inContext:](self, "_fillArrowPath:inContext:", v11);
    }
  }
}

- (CGRect)_frameNeeded
{
  BoundingBoCGFloat x = CGPathGetBoundingBox([(SCATGestureArrowView *)self _arrowPath]);
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  CGFloat width = BoundingBox.size.width;
  CGFloat height = BoundingBox.size.height;
  if ([(SCATGestureArrowView *)self style] && (id)[(SCATGestureArrowView *)self style] != (id)3)
  {
    if ((id)[(SCATGestureArrowView *)self style] == (id)6)
    {
      v16 = +[SCATStyleProvider sharedStyleProvider];
      [v16 grayFingerOuterRadius];
      double v18 = v17;

      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      CGRect v23 = CGRectInset(v22, v18 * -1.7, v18 * -1.7);
      CGFloat x = v23.origin.x;
      CGFloat y = v23.origin.y;
      CGFloat width = v23.size.width;
      CGFloat height = v23.size.height;
    }
  }
  else
  {
    double v7 = [(SCATGestureArrowView *)self _fingerCircleImage];
    [v7 size];
    CGFloat v9 = v8 * -0.5;
    [v7 size];
    CGFloat v11 = v10 * -0.5;
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGRect v21 = CGRectInset(v20, v9, v11);
    CGFloat x = v21.origin.x;
    CGFloat y = v21.origin.y;
    CGFloat width = v21.size.width;
    CGFloat height = v21.size.height;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)_propertyDidChange
{
  [(SCATGestureArrowView *)self _uncacheArrowPaths];
  [(SCATGestureArrowView *)self _frameNeeded];
  CGRect v5 = CGRectIntegral(v4);
  -[SCATGestureArrowView setFrame:](self, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
  [(SCATGestureArrowView *)self frame];
  -[SCATGestureArrowView setBounds:](self, "setBounds:");

  [(SCATGestureArrowView *)self setNeedsDisplay];
}

- (void)_drawStraightLineInIntervals:(unint64_t)a3 spacingBetweenIntervals:(double)a4 drawingBlock:(id)a5
{
  double v18 = (void (**)(id, BOOL, BOOL, double, double, double, double))a5;
  if (!a3) {
    _AXAssert();
  }
  [(SCATGestureArrowView *)self _distanceForPreview];
  double v9 = v8;
  [(SCATGestureArrowView *)self tailPoint];
  double v11 = v10;
  double v13 = v12;
  [(SCATGestureArrowView *)self tailAngle];
  if (a3)
  {
    double v15 = (v9 - (double)(a3 - 1) * a4) / (double)a3;
    __double2 v16 = __sincos_stret(v14);
    uint64_t v17 = 0;
    do
    {
      v18[2](v18, v17 == 0, a3 - 1 == v17, v11, v13, v11 + v15 * v16.__cosval, v13 + v15 * v16.__sinval);
      double v11 = v11 + v15 * v16.__cosval + a4 * v16.__cosval;
      double v13 = v13 + v15 * v16.__sinval + a4 * v16.__sinval;
      ++v17;
    }
    while (a3 != v17);
  }
}

- (void)_getCurveRadius:(double *)a3 onLeft:(BOOL *)a4
{
  if (a3)
  {
    [(SCATGestureArrowView *)self curvature];
    *a3 = fabs(1.0 / v7);
  }
  if (a4)
  {
    [(SCATGestureArrowView *)self curvature];
    *a4 = v8 < 0.0;
  }
}

- (double)_distanceForCurveWithRadius:(double)a3 onLeft:(BOOL)a4
{
  [(SCATGestureArrowView *)self distance];
  if (result >= a3 * 3.0 * 3.14159265 * 0.5) {
    return a3 * 3.0 * 3.14159265 * 0.5;
  }
  return result;
}

- (double)_distanceForPreview
{
  [(SCATGestureArrowView *)self curvature];
  if (v3 == 0.0)
  {
    [(SCATGestureArrowView *)self distance];
    double v5 = v4;
    if ((id)[(SCATGestureArrowView *)self style] == (id)6)
    {
      double v6 = +[SCATStyleProvider sharedStyleProvider];
      [v6 grayFingerOuterRadius];
      double v5 = v5 - round(v7 * 0.7);
    }
  }
  else
  {
    if ((id)[(SCATGestureArrowView *)self style] == (id)6) {
      _AXAssert();
    }
    double v11 = 0.0;
    unsigned __int8 v10 = 0;
    [(SCATGestureArrowView *)self _getCurveRadius:&v11 onLeft:&v10];
    [(SCATGestureArrowView *)self _distanceForCurveWithRadius:v10 onLeft:v11];
    return v8;
  }
  return v5;
}

- (void)_drawCurvedLineInIntervals:(unint64_t)a3 spacingBetweenIntervals:(double)a4 drawingBlock:(id)a5
{
  double v8 = (void (**)(id, void, BOOL, BOOL, double, double, double, double, double, double, double))a5;
  if (!a3) {
    _AXAssert();
  }
  double v23 = 0.0;
  unsigned __int8 v22 = 0;
  [(SCATGestureArrowView *)self _getCurveRadius:&v23 onLeft:&v22];
  [(SCATGestureArrowView *)self _distanceForCurveWithRadius:v22 onLeft:v23];
  [(SCATGestureArrowView *)self tailPoint];
  [(SCATGestureArrowView *)self tailAngle];
  CGPoint v21 = CGPointZero;
  double v19 = 0.0;
  double v20 = 0.0;
  +[SCATGestureArrowView getCurveArcCenter:startAngle:endAngle:updatedFingerAngle:updatedFingerCenter:withFingerAngle:fingerCenter:curveRadius:distanceToMove:onLeft:](SCATGestureArrowView, "getCurveArcCenter:startAngle:endAngle:updatedFingerAngle:updatedFingerCenter:withFingerAngle:fingerCenter:curveRadius:distanceToMove:onLeft:", &v21, &v20, &v19, 0, 0, v22);
  double v9 = v20;
  double v10 = -1.0;
  if (v19 - v20 > 0.0) {
    double v10 = 1.0;
  }
  if (a3)
  {
    uint64_t v11 = 0;
    double v18 = a4 / v23 * v10;
    double v12 = v10 * ((vabdd_f64(v19, v20) - (double)(a3 - 1) * fabs(v18)) / (double)a3);
    do
    {
      double x = v21.x;
      double v14 = v23;
      __double2 v15 = __sincos_stret(v9);
      double y = v21.y;
      CGFloat v17 = v21.y + v14 * v15.__sinval;
      __sincos_stret(v12 + v9);
      v8[2](v8, v22, v11 == 0, a3 - 1 == v11, x, y, v14, v9, v12 + v9, x + v14 * v15.__cosval, v17);
      double v9 = v18 + v12 + v9;
      ++v11;
    }
    while (a3 != v11);
  }
}

- (BOOL)_isGrayArrow
{
  return (id)[(SCATGestureArrowView *)self style] == (id)4
      || (id)[(SCATGestureArrowView *)self style] == (id)5
      || (id)[(SCATGestureArrowView *)self style] == (id)3
      || (id)[(SCATGestureArrowView *)self style] == (id)6;
}

- (void)_uncacheArrowPaths
{
  arrowPath = self->_arrowPath;
  if (arrowPath)
  {
    CFRelease(arrowPath);
    self->_arrowPath = 0;
  }
  arrowPathInBoundingBoxAtOrigin = self->_arrowPathInBoundingBoxAtOrigin;
  if (arrowPathInBoundingBoxAtOrigin)
  {
    CFRelease(arrowPathInBoundingBoxAtOrigin);
    self->_arrowPathInBoundingBoxAtOrigin = 0;
  }
}

- (CGPath)_arrowPathInBoundingBoxAtOrigin
{
  double result = self->_arrowPathInBoundingBoxAtOrigin;
  if (!result)
  {
    double v4 = [(SCATGestureArrowView *)self _arrowPath];
    [(SCATGestureArrowView *)self bounds];
    CGFloat v6 = -v5;
    [(SCATGestureArrowView *)self bounds];
    CGAffineTransformMakeTranslation(&v8, v6, -v7);
    double result = CGPathCreateCopyByTransformingPath(v4, &v8);
    self->_arrowPathInBoundingBoxAtOrigin = result;
  }
  return result;
}

- (CGPath)_arrowPath
{
  double result = self->_arrowPath;
  if (!result)
  {
    if ([(SCATGestureArrowView *)self _isGrayArrow]) {
      double result = [(SCATGestureArrowView *)self _newGrayArrowOutlinePath];
    }
    else {
      double result = [(SCATGestureArrowView *)self _newDefaultArrowPath];
    }
    self->_arrowPath = result;
  }
  return result;
}

- (void)_addGrayArrowHeadLineToPath:(CGPath *)a3 bottomPoint:(CGPoint)a4 tipPoint:(CGPoint)a5 sideAngle:(double)a6 sideLength:(double)a7 outlineThickness:(double)a8 innerThickness:(double)a9
{
  double y = a4.y;
  double v25 = a4.y;
  double x = a4.x;
  double v12 = a4.x;
  double v14 = a9 * 0.5;
  double v15 = a9 * 0.5 + a8;
  __double2 v16 = __sincos_stret(a6 + 1.57079633);
  double v17 = v16.__cosval * v15;
  double v23 = v16.__cosval * v15;
  double v18 = v16.__sinval * v15;
  __double2 v19 = __sincos_stret(a6);
  double v22 = a8;
  double v27 = v19.__sinval * a8;
  double v28 = v19.__cosval * a8;
  double v20 = v19.__cosval * v15;
  double v21 = v19.__sinval * v15;
  CGPathMoveToPoint(a3, 0, v12 - v17, y - v18);
  CGPathAddLineToPoint(a3, 0, a5.x - v17, a5.y - v18);
  CGPathAddArcToPoint(a3, 0, v20 + a5.x - v17, v21 + a5.y - v18, a5.x - v16.__cosval * v14 + v20, a5.y - v16.__sinval * v14 + v21, v22);
  CGPathAddLineToPoint(a3, 0, a5.x + v16.__cosval * v14 + v20, a5.y + v16.__sinval * v14 + v21);
  CGPathAddArcToPoint(a3, 0, v20 + a5.x + v23, v21 + a5.y + v18, a5.x + v23, a5.y + v18, v22);
  CGPathAddLineToPoint(a3, 0, x + v23, v25 + v18);
  CGPathAddArcToPoint(a3, 0, x + v23 - v28, v25 + v18 - v27, x + v16.__cosval * v14 - v28, v25 + v16.__sinval * v14 - v27, v22);
  CGPathAddLineToPoint(a3, 0, x - v16.__cosval * v14 - v28, v25 - v16.__sinval * v14 - v27);
  CGPathAddArcToPoint(a3, 0, v12 - v17 - v28, y - v18 - v27, v12 - v17, y - v18, v22);

  CGPathCloseSubpath(a3);
}

- (void)_addGrayArrowHeadToPath:(CGPath *)a3 tipAngle:(double)a4 tipPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v21 = +[SCATStyleProvider sharedStyleProvider];
  if ((id)[(SCATGestureArrowView *)self style] == (id)5) {
    [v21 controlArrowHeadSmallSideLength];
  }
  else {
    [v21 controlArrowHeadLargeSideLength];
  }
  double v11 = v10;
  double v12 = a4 + -0.785398163;
  double v20 = a4 + -0.785398163;
  double v13 = a4 + 0.785398163;
  __double2 v14 = __sincos_stret(v13);
  __double2 v15 = __sincos_stret(v12);
  [v21 controlArrowOutlineThickness];
  double v17 = v16;
  [v21 controlArrowThickness];
  double v19 = v18;
  -[SCATGestureArrowView _addGrayArrowHeadLineToPath:bottomPoint:tipPoint:sideAngle:sideLength:outlineThickness:innerThickness:](self, "_addGrayArrowHeadLineToPath:bottomPoint:tipPoint:sideAngle:sideLength:outlineThickness:innerThickness:", a3, x - v11 * v14.__cosval, y - v11 * v14.__sinval, x, y, v13, v11, v17, v18);
  -[SCATGestureArrowView _addGrayArrowHeadLineToPath:bottomPoint:tipPoint:sideAngle:sideLength:outlineThickness:innerThickness:](self, "_addGrayArrowHeadLineToPath:bottomPoint:tipPoint:sideAngle:sideLength:outlineThickness:innerThickness:", a3, x - v11 * v15.__cosval, y - v11 * v15.__sinval, x, y, v20, v11, v17, v19);
}

- (void)_addGrayFingerIfNecessaryToPath:(CGPath *)a3
{
  if ((id)[(SCATGestureArrowView *)self style] == (id)3)
  {
    id v15 = +[SCATStyleProvider sharedStyleProvider];
    [v15 grayFingerOuterRadius];
    double v6 = v5;
    [v15 controlArrowOutlineThickness];
    CGFloat v8 = v6 + v7;
    [(SCATGestureArrowView *)self tailPoint];
    CGFloat v10 = v9 + v8 * 0.5;
    [(SCATGestureArrowView *)self tailPoint];
    CGPathMoveToPoint(a3, 0, v10, v8 * 0.5 + v11);
    [(SCATGestureArrowView *)self tailPoint];
    CGFloat v13 = v12;
    [(SCATGestureArrowView *)self tailPoint];
    CGPathAddArc(a3, 0, v13, v14, v8, 0.0, 6.28318531, 0);
    CGPathCloseSubpath(a3);
  }
}

- (CGPath)_newStraightGrayArrowOutlinePath
{
  Mutable = CGPathCreateMutable();
  double v4 = +[SCATStyleProvider sharedStyleProvider];
  [v4 controlArrowOutlineThickness];
  uint64_t v6 = v5;
  [v4 controlArrowThickness];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008C634;
  v9[3] = &unk_1001AD2D0;
  v9[5] = v7;
  v9[6] = v6;
  v9[4] = self;
  v9[7] = Mutable;
  [(SCATGestureArrowView *)self _drawStraightLineInIntervals:1 spacingBetweenIntervals:v9 drawingBlock:0.0];
  [(SCATGestureArrowView *)self _addGrayFingerIfNecessaryToPath:Mutable];

  return Mutable;
}

- (CGPath)_newCurvedGrayArrowOutlinePath
{
  Mutable = CGPathCreateMutable();
  double v4 = +[SCATStyleProvider sharedStyleProvider];
  [v4 controlArrowOutlineThickness];
  uint64_t v6 = v5;
  [v4 controlArrowThickness];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008C90C;
  v9[3] = &unk_1001AD2F8;
  v9[5] = v7;
  v9[6] = v6;
  v9[7] = Mutable;
  v9[4] = self;
  [(SCATGestureArrowView *)self _drawCurvedLineInIntervals:1 spacingBetweenIntervals:v9 drawingBlock:0.0];
  [(SCATGestureArrowView *)self _addGrayFingerIfNecessaryToPath:Mutable];

  return Mutable;
}

- (CGPath)_newGrayArrowOutlinePath
{
  [(SCATGestureArrowView *)self curvature];
  if (v3 == 0.0)
  {
    return [(SCATGestureArrowView *)self _newStraightGrayArrowOutlinePath];
  }
  else
  {
    return [(SCATGestureArrowView *)self _newCurvedGrayArrowOutlinePath];
  }
}

- (void)_clearCircleWithRadius:(double)a3 inContext:(CGContext *)a4
{
  [(SCATGestureArrowView *)self tailPoint];

  -[SCATGestureArrowView _clearCircleWithRadius:center:inContext:](self, "_clearCircleWithRadius:center:inContext:", a4, a3, v7, v8);
}

- (void)_clearCircleWithRadius:(double)a3 center:(CGPoint)a4 inContext:(CGContext *)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGContextSaveGState(a5);
  CGContextSetBlendMode(a5, kCGBlendModeClear);
  CGContextAddArc(a5, x, y, a3, 0.0, 6.28318531, 0);
  CGContextFillPath(a5);

  CGContextRestoreGState(a5);
}

- (void)_addCircleWithRadius:(double)a3 inContext:(CGContext *)a4
{
  [(SCATGestureArrowView *)self tailPoint];

  -[SCATGestureArrowView _addCircleWithRadius:center:inContext:](self, "_addCircleWithRadius:center:inContext:", a4, a3, v7, v8);
}

- (void)_addCircleWithRadius:(double)a3 center:(CGPoint)a4 inContext:(CGContext *)a5
{
}

- (void)_drawGrayArrowInContext:(CGContext *)a3
{
  uint64_t v5 = +[SCATStyleProvider sharedStyleProvider];
  CGContextAddPath(a3, [(SCATGestureArrowView *)self _arrowPath]);
  id v6 = [v5 controlArrowOutlineColor];
  CGContextSetFillColorWithColor(a3, (CGColorRef)[v6 CGColor]);
  CGContextFillPath(a3);
  if ((id)[(SCATGestureArrowView *)self style] == (id)3)
  {
    [v5 grayFingerInnerRadius];
    double v8 = v7;
    [v5 controlArrowOutlineThickness];
    [(SCATGestureArrowView *)self _clearCircleWithRadius:a3 inContext:v8 - v9];
    CGContextBeginTransparencyLayer(a3, 0);
  }
  if ([(SCATGestureArrowView *)self isHighlighted]) {
    [v5 controlArrowHighlightedColor];
  }
  else {
  CGFloat v10 = [v5 controlArrowColor];
  }
  [v5 controlArrowThickness];
  uint64_t v12 = v11;
  if ((id)[(SCATGestureArrowView *)self style] == (id)5) {
    [v5 controlArrowHeadSmallSideLength];
  }
  else {
    [v5 controlArrowHeadLargeSideLength];
  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10008D1B4;
  v37[3] = &unk_1001AD318;
  v37[4] = a3;
  v37[5] = v13;
  CGFloat v14 = objc_retainBlock(v37);
  [(SCATGestureArrowView *)self curvature];
  if (v15 == 0.0)
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10008D274;
    v34[3] = &unk_1001AD340;
    v36[1] = a3;
    double v16 = (id *)v35;
    v35[0] = v10;
    v36[2] = v12;
    double v17 = (id *)v36;
    double v18 = v14;
    v35[1] = self;
    v36[0] = v18;
    [(SCATGestureArrowView *)self _drawStraightLineInIntervals:1 spacingBetweenIntervals:v34 drawingBlock:0.0];
  }
  else
  {
    double v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    double v30 = sub_10008D33C;
    double v31 = &unk_1001AD368;
    v33[1] = a3;
    double v16 = (id *)v32;
    v32[0] = v10;
    v33[2] = v12;
    double v17 = (id *)v33;
    double v19 = v14;
    v32[1] = self;
    v33[0] = v19;
    [(SCATGestureArrowView *)self _drawCurvedLineInIntervals:1 spacingBetweenIntervals:&v28 drawingBlock:0.0];
  }

  if ((id)[(SCATGestureArrowView *)self style] == (id)3)
  {
    [v5 grayFingerInnerRadius];
    -[SCATGestureArrowView _clearCircleWithRadius:inContext:](self, "_clearCircleWithRadius:inContext:", a3);
    [v5 grayFingerInnerRadius];
    double v21 = v20;
    [v5 controlArrowThickness];
    [(SCATGestureArrowView *)self _addCircleWithRadius:a3 inContext:v21 + v22 * 0.5];
    CGContextStrokePath(a3);
    [v5 grayFingerInnerRadius];
    double v24 = v23;
    [v5 controlArrowOutlineThickness];
    [(SCATGestureArrowView *)self _addCircleWithRadius:a3 inContext:v24 - v25];
    id v26 = [v5 grayFingerInnerFill];
    CGContextSetFillColorWithColor(a3, (CGColorRef)[v26 CGColor]);

    CGContextFillPath(a3);
    [v5 grayFingerInnerCircleOuterRadius];
    -[SCATGestureArrowView _clearCircleWithRadius:inContext:](self, "_clearCircleWithRadius:inContext:", a3);
    [v5 grayFingerInnerCircleOuterRadius];
    -[SCATGestureArrowView _addCircleWithRadius:inContext:](self, "_addCircleWithRadius:inContext:", a3);
    CGContextSetFillColorWithColor(a3, (CGColorRef)[v6 CGColor]);
    CGContextFillPath(a3);
    [v5 grayFingerInnerCircleInnerRadius];
    -[SCATGestureArrowView _addCircleWithRadius:inContext:](self, "_addCircleWithRadius:inContext:", a3);
    if ([(SCATGestureArrowView *)self isPressed]) {
      [v5 controlArrowHighlightedColor];
    }
    else {
    id v27 = [v5 controlArrowColor];
    }
    CGContextSetFillColorWithColor(a3, (CGColorRef)[v27 CGColor]);
    CGContextFillPath(a3);
    CGContextEndTransparencyLayer(a3);
  }
  else if ([(SCATGestureArrowView *)self shouldClearFingerCircle] {
         || (id)[(SCATGestureArrowView *)self style] == (id)6)
  }
  {
    objc_msgSend(v5, "grayFingerOuterRadius", v28, v29, v30, v31);
    -[SCATGestureArrowView _clearCircleWithRadius:inContext:](self, "_clearCircleWithRadius:inContext:", a3);
  }
}

- (void)_drawFingerAtArrowHeadInContext:(CGContext *)a3
{
  id v31 = +[SCATStyleProvider sharedStyleProvider];
  id v5 = [v31 controlArrowOutlineColor];
  id v6 = (CGColor *)[v5 CGColor];

  id v7 = [v31 controlArrowColor];
  double v8 = (CGColor *)[v7 CGColor];

  [(SCATGestureArrowView *)self tailPoint];
  double v10 = v9;
  [(SCATGestureArrowView *)self distance];
  double v12 = v11;
  [(SCATGestureArrowView *)self tailAngle];
  long double v14 = v10 + v12 * cos(v13);
  [(SCATGestureArrowView *)self tailPoint];
  double v16 = v15;
  [(SCATGestureArrowView *)self distance];
  double v18 = v17;
  [(SCATGestureArrowView *)self tailAngle];
  long double v20 = v16 + v18 * sin(v19);
  [v31 grayFingerInnerRadius];
  double v22 = v21;
  [v31 controlArrowThickness];
  -[SCATGestureArrowView _addCircleWithRadius:center:inContext:](self, "_addCircleWithRadius:center:inContext:", a3, v22 + v23 * 0.5, (double)v14, (double)v20);
  CGContextSetStrokeColorWithColor(a3, v6);
  [v31 controlArrowOutlineThickness];
  double v25 = v24;
  [v31 controlArrowThickness];
  CGContextSetLineWidth(a3, v26 + v25 * 2.0);
  CGContextStrokePath(a3);
  [v31 grayFingerInnerRadius];
  double v28 = v27;
  [v31 controlArrowThickness];
  -[SCATGestureArrowView _addCircleWithRadius:center:inContext:](self, "_addCircleWithRadius:center:inContext:", a3, v28 + v29 * 0.5, (double)v14, (double)v20);
  CGContextSetStrokeColorWithColor(a3, v8);
  [v31 controlArrowThickness];
  CGContextSetLineWidth(a3, v30);
  CGContextStrokePath(a3);
  [v31 grayFingerInnerCircleOuterRadius];
  -[SCATGestureArrowView _addCircleWithRadius:center:inContext:](self, "_addCircleWithRadius:center:inContext:", a3);
  CGContextSetFillColorWithColor(a3, v6);
  CGContextFillPath(a3);
  [v31 grayFingerInnerCircleInnerRadius];
  -[SCATGestureArrowView _addCircleWithRadius:center:inContext:](self, "_addCircleWithRadius:center:inContext:", a3);
  CGContextSetFillColorWithColor(a3, v8);
  CGContextFillPath(a3);
}

- (void)_fillArrowPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  if ([(SCATGestureArrowView *)self _isGrayArrow]) {
    _AXAssert();
  }
  id v9 = +[SCATStyleProvider sharedStyleProvider];
  CGContextAddPath(a4, a3);
  id v6 = [v9 previewColor];
  CGContextSetFillColorWithColor(a4, (CGColorRef)[v6 CGColor]);
  CGContextFillPath(a4);
  CGContextAddPath(a4, a3);
  [v9 previewOutlineThickness];
  CGContextSetLineWidth(a4, v7);
  id v8 = [v9 previewOutlineColor];
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v8 CGColor]);
  CGContextStrokePath(a4);
}

- (CGPath)_newDefaultArrowPath
{
  if ([(SCATGestureArrowView *)self style] && (id)[(SCATGestureArrowView *)self style] != (id)1)
  {
    uint64_t v5 = 1;
  }
  else
  {
    [(SCATGestureArrowView *)self _distanceForPreview];
    unint64_t v4 = vcvtmd_u64_f64((v3 + 5.0) / 20.0);
    if (v4 <= 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = v4;
    }
  }
  [(SCATGestureArrowView *)self curvature];
  if (v6 == 0.0)
  {
    return [(SCATGestureArrowView *)self _newStraightArrowPathWithIntervals:v5];
  }
  else
  {
    return [(SCATGestureArrowView *)self _newCurvedArrowPathWithIntervals:v5];
  }
}

- (void)_addArrowHeadToPath:(CGPath *)a3 baseLeftPoint:(CGPoint)a4 baseRightPoint:(CGPoint)a5 tipPoint:(CGPoint)a6
{
  double v6 = a6.y;
  double x = a6.x;
  double v8 = a5.y;
  double v9 = a5.x;
  double v10 = a4.y;
  double v11 = a4.x;
  if ([(SCATGestureArrowView *)self _isGrayArrow]) {
    _AXAssert();
  }
  id v24 = +[SCATStyleProvider sharedStyleProvider];
  [v24 arrowHeadBaseAngle];
  double v14 = v13;
  [v24 arrowHeadBaseRadius];
  double v16 = v15;
  AX_CGPointGetMidpointToPoint();
  CGFloat y = v6;
  double v19 = atan2(v6 - v17, x - v18);
  double v20 = 3.14159265 - v14;
  __double2 v21 = __sincos_stret(v19 - v20);
  CGPathAddLineToPoint(a3, 0, v11 + v16 * v21.__cosval, v10 + v16 * v21.__sinval);
  CGPathAddLineToPoint(a3, 0, x, y);
  __double2 v22 = __sincos_stret(v20 + v19);
  CGPathAddLineToPoint(a3, 0, v9 + v16 * v22.__cosval, v8 + v16 * v22.__sinval);
  CGPathAddLineToPoint(a3, 0, v9, v8);
}

- (CGPath)_newStraightArrowPathWithIntervals:(unint64_t)a3
{
  if ([(SCATGestureArrowView *)self _isGrayArrow]) {
    _AXAssert();
  }
  [(SCATGestureArrowView *)self tailAngle];
  uint64_t v6 = v5;
  CGFloat v7 = +[SCATStyleProvider sharedStyleProvider];
  [v7 previewLineThickness];
  double v9 = v8;
  [(SCATGestureArrowView *)self tailAngle];
  double v11 = v9 * 0.5;
  __double2 v12 = __sincos_stret(v10 + 1.57079633);
  Mutable = CGPathCreateMutable();
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10008DAEC;
  v16[3] = &unk_1001AD390;
  double v19 = v11 * v12.__cosval;
  double v20 = v11 * v12.__sinval;
  __double2 v21 = Mutable;
  uint64_t v22 = v6;
  id v17 = v7;
  double v18 = self;
  id v14 = v7;
  [(SCATGestureArrowView *)self _drawStraightLineInIntervals:a3 spacingBetweenIntervals:v16 drawingBlock:5.0];

  return Mutable;
}

- (CGPath)_newCurvedArrowPathWithIntervals:(unint64_t)a3
{
  if ([(SCATGestureArrowView *)self _isGrayArrow]) {
    _AXAssert();
  }
  uint64_t v5 = +[SCATStyleProvider sharedStyleProvider];
  [v5 previewLineThickness];
  uint64_t v7 = v6;
  Mutable = CGPathCreateMutable();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008DD54;
  v11[3] = &unk_1001AD3B8;
  uint64_t v14 = v7;
  double v15 = Mutable;
  id v12 = v5;
  double v13 = self;
  id v9 = v5;
  [(SCATGestureArrowView *)self _drawCurvedLineInIntervals:a3 spacingBetweenIntervals:v11 drawingBlock:5.0];

  return Mutable;
}

- (id)_fingerCircleImage
{
  if (qword_1001F0B20 != -1) {
    dispatch_once(&qword_1001F0B20, &stru_1001AD3D8);
  }
  v2 = (void *)qword_1001F0B18;

  return v2;
}

- (void)_drawLineOfCirclesInContext:(CGContext *)a3
{
  unint64_t v4 = [(SCATGestureArrowView *)self _fingerCircleImage];
  [v4 size];
  double v6 = v5;
  [(SCATGestureArrowView *)self _distanceForPreview];
  double v8 = v7;
  unint64_t v9 = vcvtmd_u64_f64(v7 / (v6 + 5.0));
  if (v9 >= 5) {
    unint64_t v10 = 5;
  }
  else {
    unint64_t v10 = v9;
  }
  if (v10)
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v22[3] = 0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10008E1E4;
    v18[3] = &unk_1001AD400;
    double v20 = v22;
    id v19 = v4;
    unint64_t v21 = v10;
    double v11 = objc_retainBlock(v18);
    [(SCATGestureArrowView *)self curvature];
    unint64_t v12 = v10 + 1;
    double v13 = v8 / (double)v10;
    if (v14 == 0.0)
    {
      double v15 = v17;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10008E294;
      v17[3] = &unk_1001AD428;
      v17[4] = v11;
      [(SCATGestureArrowView *)self _drawStraightLineInIntervals:v12 spacingBetweenIntervals:v17 drawingBlock:v13];
    }
    else
    {
      double v15 = v16;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10008E2A4;
      v16[3] = &unk_1001AD450;
      void v16[4] = v11;
      [(SCATGestureArrowView *)self _drawCurvedLineInIntervals:v12 spacingBetweenIntervals:v16 drawingBlock:v13];
    }

    _Block_object_dispose(v22, 8);
  }
}

- (CGRect)scatFrame
{
  [(SCATGestureArrowView *)self bounds];

  +[HNDScreen convertRect:fromView:](HNDScreen, "convertRect:fromView:", self);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGPath)scatPath
{
  return [(SCATGestureArrowView *)self _arrowPathInBoundingBoxAtOrigin];
}

- (double)tailAngle
{
  return self->_tailAngle;
}

- (double)curvature
{
  return self->_curvature;
}

- (double)distance
{
  return self->_distance;
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (BOOL)shouldClearFingerCircle
{
  return self->_shouldClearFingerCircle;
}

- (void)setShouldClearFingerCircle:(BOOL)a3
{
  self->_shouldClearFingerCircle = a3;
}

- (BOOL)isControlArrow
{
  return self->_isControlArrow;
}

- (void)setIsControlArrow:(BOOL)a3
{
  self->_isControlArrow = a3;
}

- (SCATGestureDrawingView)gestureDrawingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureDrawingView);

  return (SCATGestureDrawingView *)WeakRetained;
}

- (void)setGestureDrawingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end