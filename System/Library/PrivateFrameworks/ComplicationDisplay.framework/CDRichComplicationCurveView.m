@interface CDRichComplicationCurveView
- (BOOL)_shouldReverseGradient;
- (BOOL)clockwise;
- (CDRichComplicationCurveView)initWithCurveWidth:(double)a3 padding:(double)a4 beginAngle:(double)a5 endAngle:(double)a6 forDevice:(id)a7 withFilterStyle:(int64_t)a8;
- (CGPath)_generatePath;
- (CGPoint)_centerPoint;
- (CGPoint)_pointAtProgress:(float)a3;
- (double)_angleAtProgress:(float)a3;
- (double)_outerRadius;
- (double)_shapeLineWidth;
- (double)_totalDrawableAngle;
- (double)beginAngle;
- (double)endAngle;
- (id)_normalizeGradientLocations:(id)a3;
- (void)_setupGradientLayer:(id)a3;
- (void)_updatePath;
- (void)layoutSubviews;
- (void)setBeginAngle:(double)a3;
- (void)setClockwise:(BOOL)a3;
- (void)setEndAngle:(double)a3;
@end

@implementation CDRichComplicationCurveView

- (CDRichComplicationCurveView)initWithCurveWidth:(double)a3 padding:(double)a4 beginAngle:(double)a5 endAngle:(double)a6 forDevice:(id)a7 withFilterStyle:(int64_t)a8
{
  v13.receiver = self;
  v13.super_class = (Class)CDRichComplicationCurveView;
  result = [(CDRichComplicationShapeView *)&v13 initForDevice:a7 withFilterStyle:a8];
  if (result)
  {
    result->_curveWidth = a3;
    result->_padding = a4;
    result->_beginAngle = a5;
    result->_drawingBeginAngle = a5 + 1.57079633;
    result->_endAngle = a6;
    result->_drawingEndAngle = a6 + 1.57079633;
    result->_clockwise = 1;
  }
  return result;
}

- (void)setBeginAngle:(double)a3
{
  if (self->_beginAngle != a3)
  {
    self->_beginAngle = a3;
    self->_drawingBeginAngle = a3 + 1.57079633;
    [(CDRichComplicationShapeView *)self _updateGradient];
    [(CDRichComplicationCurveView *)self _updatePath];
  }
}

- (void)setEndAngle:(double)a3
{
  if (self->_endAngle != a3)
  {
    self->_endAngle = a3;
    self->_drawingEndAngle = a3 + 1.57079633;
    [(CDRichComplicationShapeView *)self _updateGradient];
    [(CDRichComplicationCurveView *)self _updatePath];
  }
}

- (void)setClockwise:(BOOL)a3
{
  if (self->_clockwise != a3)
  {
    self->_clockwise = a3;
    [(CDRichComplicationShapeView *)self _updateGradient];
    [(CDRichComplicationCurveView *)self _updatePath];
  }
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)CDRichComplicationCurveView;
  [(CDRichComplicationShapeView *)&v11 layoutSubviews];
  double curveWidth = self->_curveWidth;
  v4 = [(CDRichComplicationShapeView *)self shapeLayer];
  PathBoundingBodouble x = CGPathGetPathBoundingBox((CGPathRef)[v4 path]);
  CGRect v13 = CGRectInset(PathBoundingBox, curveWidth * -0.5, curveWidth * -0.5);
  double x = v13.origin.x;
  double y = v13.origin.y;
  double width = v13.size.width;
  double height = v13.size.height;

  if (width < height) {
    double width = height;
  }
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  v9 = [(CDRichComplicationShapeView *)self gradientLayer];
  objc_msgSend(v9, "setFrame:", x, y, width, width);

  v10 = [(CDRichComplicationShapeView *)self gradientLayer];
  [(CDRichComplicationCurveView *)self _setupGradientLayer:v10];

  [MEMORY[0x263F158F8] commit];
}

- (void)_setupGradientLayer:(id)a3
{
  id v18 = a3;
  double v4 = MEMORY[0x223C26720]([(CDRichComplicationCurveView *)self bounds]);
  double v6 = v5;
  v7 = [(CDRichComplicationShapeView *)self gradientLayer];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;

  v12 = [(CDRichComplicationShapeView *)self gradientLayer];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;

  double v17 = (v4 - v9) / v14;
  [v18 setType:*MEMORY[0x263F15DD8]];
  objc_msgSend(v18, "setStartPoint:", v17, (v6 - v11) / v16);
  objc_msgSend(v18, "setEndPoint:", v17, 100.0);
}

- (double)_shapeLineWidth
{
  return self->_curveWidth;
}

- (double)_angleAtProgress:(float)a3
{
  return self->_drawingBeginAngle + (self->_drawingEndAngle - self->_drawingBeginAngle) * a3;
}

- (double)_totalDrawableAngle
{
  return self->_drawingEndAngle - self->_drawingBeginAngle;
}

- (double)_outerRadius
{
  [(CDRichComplicationCurveView *)self bounds];
  return CGRectGetWidth(v4) * 0.5 - self->_padding;
}

- (CGPoint)_centerPoint
{
  [(CDRichComplicationCurveView *)self bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat v6 = CGRectGetWidth(v10) * 0.5;
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double v7 = CGRectGetHeight(v11) * 0.5;
  double v8 = v6;
  result.CGFloat y = v7;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)_pointAtProgress:(float)a3
{
  [(CDRichComplicationCurveView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(CDRichComplicationCurveView *)self _centerPoint];
  double v14 = v13;
  double v16 = v15;
  v24.origin.CGFloat x = v6;
  v24.origin.CGFloat y = v8;
  v24.size.CGFloat width = v10;
  v24.size.CGFloat height = v12;
  CGFloat v17 = CGRectGetWidth(v24) * 0.5 - self->_curveWidth * 0.5;
  CGFloat v18 = v17 - self->_padding;
  *(float *)&CGFloat v17 = a3;
  [(CDRichComplicationCurveView *)self _angleAtProgress:v17];
  *(float *)&double v19 = v19;
  __float2 v20 = __sincosf_stret(*(float *)&v19);
  double v21 = v16 + v20.__sinval * v18;
  double v22 = v14 + v20.__cosval * v18;
  result.CGFloat y = v21;
  result.CGFloat x = v22;
  return result;
}

- (id)_normalizeGradientLocations:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [MEMORY[0x263EFF980] array];
  double v6 = self->_drawingBeginAngle + -1.57079633;
  double v7 = self->_drawingEndAngle + -1.57079633;
  if (v6 >= 0.0) {
    double v8 = self->_drawingBeginAngle + -1.57079633;
  }
  else {
    double v8 = v6 + 6.28318531;
  }
  if (v7 >= 0.0) {
    double v9 = self->_drawingEndAngle + -1.57079633;
  }
  else {
    double v9 = v7 + 6.28318531;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    double v13 = v8 / 6.28318531;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "doubleValue", (void)v19);
        CGFloat v17 = [NSNumber numberWithDouble:v13 + (v9 / 6.28318531 - v13) * v16];
        [v5 addObject:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  return v5;
}

- (CGPath)_generatePath
{
  [(CDRichComplicationCurveView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CDRichComplicationCurveView *)self _centerPoint];
  double v12 = v11;
  double v14 = v13;
  v18.origin.CGFloat x = v4;
  v18.origin.CGFloat y = v6;
  v18.size.CGFloat width = v8;
  v18.size.CGFloat height = v10;
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", self->_clockwise, v12, v14, CGRectGetWidth(v18) * 0.5 - self->_curveWidth * 0.5 - self->_padding, self->_drawingBeginAngle, self->_drawingEndAngle);
  id v15 = objc_claimAutoreleasedReturnValue();
  double v16 = (CGPath *)[v15 CGPath];

  return v16;
}

- (void)_updatePath
{
  v3.receiver = self;
  v3.super_class = (Class)CDRichComplicationCurveView;
  [(CDRichComplicationShapeView *)&v3 _updatePath];
  [(CDRichComplicationCurveView *)self setNeedsLayout];
}

- (BOOL)_shouldReverseGradient
{
  return !self->_clockwise;
}

- (double)beginAngle
{
  return self->_beginAngle;
}

- (double)endAngle
{
  return self->_endAngle;
}

- (BOOL)clockwise
{
  return self->_clockwise;
}

@end