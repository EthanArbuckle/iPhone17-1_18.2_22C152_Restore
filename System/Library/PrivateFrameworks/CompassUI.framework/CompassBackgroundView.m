@interface CompassBackgroundView
- (BOOL)setCrosshairOffset:(CGSize)a3;
- (CompassBackgroundView)initWithFrame:(CGRect)a3;
- (CompassBackgroundView)initWithFrame:(CGRect)a3 forCompass:(BOOL)a4;
- (double)bearing;
- (double)ticLength;
- (double)ticRadius;
- (id)_crosshairLayerWithBounds:(CGRect)a3;
- (id)_crosshairPathInRect:(CGRect)a3;
- (id)bearingLayer;
- (id)bubbleLayer;
- (id)crosshairLayer;
- (id)currentHeadingLayer;
- (id)largeCompassTicLayers;
- (id)prototypeLargeTicLayer;
- (id)prototypeSmallTicLayer;
- (id)rotatingLayer;
- (id)smallCompassTicLayers;
- (id)staticLayer;
- (void)layoutSubviews;
- (void)setBearing:(double)a3;
- (void)setCompassHeading:(double)a3;
- (void)setTicRadius:(double)a3;
@end

@implementation CompassBackgroundView

- (CompassBackgroundView)initWithFrame:(CGRect)a3
{
  return -[CompassBackgroundView initWithFrame:forCompass:](self, "initWithFrame:forCompass:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CompassBackgroundView)initWithFrame:(CGRect)a3 forCompass:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CompassBackgroundView;
  result = -[CompassBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_shownInCompass = a4;
    result->_bearing = 1.79769313e308;
  }
  return result;
}

- (void)setTicRadius:(double)a3
{
  self->_ticRadius = a3;
  [(CompassBackgroundView *)self setNeedsLayout];
}

- (void)setBearing:(double)a3
{
  self->_bearing = a3;
  [(CompassBackgroundView *)self setNeedsLayout];
}

- (id)staticLayer
{
  staticLayer = self->_staticLayer;
  if (!staticLayer)
  {
    v4 = [MEMORY[0x263F157E8] layer];
    v5 = self->_staticLayer;
    self->_staticLayer = v4;

    objc_super v6 = self->_staticLayer;
    v7 = [(CompassBackgroundView *)self layer];
    [v7 frame];
    -[CALayer setFrame:](v6, "setFrame:");

    v8 = self->_staticLayer;
    v9 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15DC0]];
    [(CALayer *)v8 setCompositingFilter:v9];

    v10 = [(CompassBackgroundView *)self layer];
    [v10 addSublayer:self->_staticLayer];

    staticLayer = self->_staticLayer;
  }

  return staticLayer;
}

- (id)rotatingLayer
{
  rotatingLayer = self->_rotatingLayer;
  if (!rotatingLayer)
  {
    v4 = [MEMORY[0x263F157E8] layer];
    v5 = self->_rotatingLayer;
    self->_rotatingLayer = v4;

    objc_super v6 = self->_rotatingLayer;
    v7 = [(CompassBackgroundView *)self layer];
    [v7 frame];
    -[CALayer setFrame:](v6, "setFrame:");

    v8 = self->_rotatingLayer;
    v9 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15DC0]];
    [(CALayer *)v8 setCompositingFilter:v9];

    v10 = [(CompassBackgroundView *)self layer];
    [v10 addSublayer:self->_rotatingLayer];

    rotatingLayer = self->_rotatingLayer;
  }

  return rotatingLayer;
}

- (id)prototypeSmallTicLayer
{
  prototypeSmallTicLayer = self->_prototypeSmallTicLayer;
  if (!prototypeSmallTicLayer)
  {
    v4 = [MEMORY[0x263F157E8] layer];
    v5 = self->_prototypeSmallTicLayer;
    self->_prototypeSmallTicLayer = v4;

    [(CALayer *)self->_prototypeSmallTicLayer setAllowsEdgeAntialiasing:1];
    -[CALayer setFrame:](self->_prototypeSmallTicLayer, "setFrame:", 0.0, 0.0, 0.75, self->_ticLength);
    objc_super v6 = [(CompassBackgroundView *)self smallCompassTicLayers];
    [v6 addSublayer:self->_prototypeSmallTicLayer];

    prototypeSmallTicLayer = self->_prototypeSmallTicLayer;
  }

  return prototypeSmallTicLayer;
}

- (id)smallCompassTicLayers
{
  smallCompassTicLayers = self->_smallCompassTicLayers;
  if (!smallCompassTicLayers)
  {
    v4 = [MEMORY[0x263F15868] layer];
    v5 = self->_smallCompassTicLayers;
    self->_smallCompassTicLayers = v4;

    objc_super v6 = self->_smallCompassTicLayers;
    CATransform3DMakeRotation(&v9, 0.034906585, 0.0, 0.0, 1.0);
    [(CAReplicatorLayer *)v6 setInstanceTransform:&v9];
    [(CAReplicatorLayer *)self->_smallCompassTicLayers setInstanceCount:180];
    v7 = [(CompassBackgroundView *)self rotatingLayer];
    [v7 addSublayer:self->_smallCompassTicLayers];

    smallCompassTicLayers = self->_smallCompassTicLayers;
  }

  return smallCompassTicLayers;
}

- (id)prototypeLargeTicLayer
{
  prototypeLargeTicLayer = self->_prototypeLargeTicLayer;
  if (!prototypeLargeTicLayer)
  {
    v4 = [MEMORY[0x263F157E8] layer];
    v5 = self->_prototypeLargeTicLayer;
    self->_prototypeLargeTicLayer = v4;

    [(CALayer *)self->_prototypeLargeTicLayer setAllowsEdgeAntialiasing:1];
    -[CALayer setFrame:](self->_prototypeLargeTicLayer, "setFrame:", 0.0, 0.0, 2.5, self->_ticLength);
    objc_super v6 = [(CompassBackgroundView *)self largeCompassTicLayers];
    [v6 addSublayer:self->_prototypeLargeTicLayer];

    prototypeLargeTicLayer = self->_prototypeLargeTicLayer;
  }

  return prototypeLargeTicLayer;
}

- (id)largeCompassTicLayers
{
  largeCompassTicLayers = self->_largeCompassTicLayers;
  if (!largeCompassTicLayers)
  {
    v4 = [MEMORY[0x263F15868] layer];
    v5 = self->_largeCompassTicLayers;
    self->_largeCompassTicLayers = v4;

    objc_super v6 = self->_largeCompassTicLayers;
    CATransform3DMakeRotation(&v9, 0.523598776, 0.0, 0.0, 1.0);
    [(CAReplicatorLayer *)v6 setInstanceTransform:&v9];
    [(CAReplicatorLayer *)self->_largeCompassTicLayers setInstanceCount:12];
    v7 = [(CompassBackgroundView *)self rotatingLayer];
    [v7 addSublayer:self->_largeCompassTicLayers];

    largeCompassTicLayers = self->_largeCompassTicLayers;
  }

  return largeCompassTicLayers;
}

- (id)bearingLayer
{
  bearingLayer = self->_bearingLayer;
  if (!bearingLayer)
  {
    v4 = [MEMORY[0x263F157E8] layer];
    v5 = self->_bearingLayer;
    self->_bearingLayer = v4;

    [(CALayer *)self->_bearingLayer setAllowsEdgeAntialiasing:1];
    -[CALayer setFrame:](self->_bearingLayer, "setFrame:", 0.0, 0.0, 2.5, self->_bearingLength);
    objc_super v6 = [(CompassBackgroundView *)self rotatingLayer];
    [v6 addSublayer:self->_bearingLayer];

    bearingLayer = self->_bearingLayer;
  }

  return bearingLayer;
}

- (id)currentHeadingLayer
{
  currentHeadingLayer = self->_currentHeadingLayer;
  if (!currentHeadingLayer)
  {
    v4 = [MEMORY[0x263F157E8] layer];
    v5 = self->_currentHeadingLayer;
    self->_currentHeadingLayer = v4;

    [(CALayer *)self->_currentHeadingLayer setAllowsEdgeAntialiasing:1];
    -[CALayer setFrame:](self->_currentHeadingLayer, "setFrame:", 0.0, 0.0, 4.0, self->_currentHeadingLength);
    objc_super v6 = [(CompassBackgroundView *)self staticLayer];
    [v6 addSublayer:self->_currentHeadingLayer];

    currentHeadingLayer = self->_currentHeadingLayer;
  }

  return currentHeadingLayer;
}

- (id)crosshairLayer
{
  crosshairLayer = self->_crosshairLayer;
  if (!crosshairLayer)
  {
    [(CompassBackgroundView *)self bounds];
    double v5 = crosshairWidth(v4);
    [(CompassBackgroundView *)self bounds];
    -[CompassBackgroundView _crosshairLayerWithBounds:](self, "_crosshairLayerWithBounds:", 0.0, 0.0, v5, crosshairWidth(v6));
    v7 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    v8 = self->_crosshairLayer;
    self->_crosshairLayer = v7;

    CATransform3D v9 = [(CompassBackgroundView *)self staticLayer];
    [v9 addSublayer:self->_crosshairLayer];

    crosshairLayer = self->_crosshairLayer;
  }

  return crosshairLayer;
}

- (id)bubbleLayer
{
  bubbleLayer = self->_bubbleLayer;
  if (!bubbleLayer)
  {
    [(CompassBackgroundView *)self bounds];
    double v5 = bubbleDiameter(v4);
    [(CompassBackgroundView *)self bounds];
    double v7 = bubbleDiameter(v6);
    v8 = [MEMORY[0x263F157E8] layer];
    CATransform3D v9 = self->_bubbleLayer;
    self->_bubbleLayer = v8;

    -[CALayer setFrame:](self->_bubbleLayer, "setFrame:", 0.0, 0.0, v5, v7);
    v10 = [MEMORY[0x263F15880] layer];
    [v10 setAllowsEdgeAntialiasing:1];
    objc_msgSend(v10, "setFrame:", 0.0, 0.0, v5, v7);
    id v11 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.119999997];
    objc_msgSend(v10, "setFillColor:", objc_msgSend(v11, "CGColor"));

    objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", 0.0, 0.0, v5, v7);
    id v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPath:", objc_msgSend(v12, "CGPath"));

    [(CALayer *)self->_bubbleLayer addSublayer:v10];
    [(CompassBackgroundView *)self bounds];
    double v14 = bubbleDiameter(v13) * 0.5;
    [(CompassBackgroundView *)self bounds];
    double v16 = smallCrosshairWidth(v15);
    [(CompassBackgroundView *)self bounds];
    v18 = -[CompassBackgroundView _crosshairLayerWithBounds:](self, "_crosshairLayerWithBounds:", 0.0, 0.0, v16, smallCrosshairWidth(v17));
    objc_msgSend(v18, "setPosition:", v14, v14);
    [(CALayer *)self->_bubbleLayer addSublayer:v18];
    v19 = [(CompassBackgroundView *)self staticLayer];
    [v19 addSublayer:self->_bubbleLayer];

    bubbleLayer = self->_bubbleLayer;
  }

  return bubbleLayer;
}

- (id)_crosshairLayerWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [MEMORY[0x263F15880] layer];
  [v8 setAllowsEdgeAntialiasing:1];
  objc_msgSend(v8, "setBounds:", x, y, width, height);
  id v9 = [MEMORY[0x263F1C550] whiteColor];
  objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

  v10 = [MEMORY[0x263F1C920] mainScreen];
  [v10 scale];
  [v8 setLineWidth:1.0 / v11];

  -[CompassBackgroundView _crosshairPathInRect:](self, "_crosshairPathInRect:", x, y, width, height);
  id v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPath:", objc_msgSend(v12, "CGPath"));

  return v8;
}

- (id)_crosshairPathInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v7 = objc_alloc_init(MEMORY[0x263F1C478]);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  objc_msgSend(v7, "moveToPoint:", MidX, CGRectGetMinY(v15));
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v9 = CGRectGetMidX(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  objc_msgSend(v7, "addLineToPoint:", v9, CGRectGetMaxY(v17));
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  objc_msgSend(v7, "moveToPoint:", MinX, CGRectGetMidY(v19));
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  objc_msgSend(v7, "addLineToPoint:", MaxX, CGRectGetMidY(v21));

  return v7;
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)CompassBackgroundView;
  [(CompassBackgroundView *)&v35 layoutSubviews];
  p_compassCenter = &self->_compassCenter;
  [(CompassBackgroundView *)self bounds];
  CGFloat v5 = v4 * 0.5;
  [(CompassBackgroundView *)self bounds];
  self->_compassCenter.double x = v5;
  self->_compassCenter.CGFloat y = v6 * 0.5;
  [(CompassBackgroundView *)self bounds];
  self->_ticLength = compassTicLength(v7);
  [(CompassBackgroundView *)self bounds];
  self->_bearingLength = bearingLength(v8);
  [(CompassBackgroundView *)self bounds];
  self->_currentHeadingLength = currentHeadingLength(v9);
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  v10 = [(CompassBackgroundView *)self prototypeSmallTicLayer];
  id v11 = [MEMORY[0x263F1C550] whiteColor];
  objc_msgSend(v10, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

  id v12 = [(CompassBackgroundView *)self prototypeLargeTicLayer];
  id v13 = [MEMORY[0x263F1C550] whiteColor];
  objc_msgSend(v12, "setBackgroundColor:", objc_msgSend(v13, "CGColor"));

  CGRect v14 = [(CompassBackgroundView *)self currentHeadingLayer];
  id v15 = [MEMORY[0x263F1C550] whiteColor];
  objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v15, "CGColor"));

  CGRect v16 = [(CompassBackgroundView *)self bearingLayer];
  id v17 = [MEMORY[0x263F1C550] whiteColor];
  objc_msgSend(v16, "setBackgroundColor:", objc_msgSend(v17, "CGColor"));

  CGRect v18 = [(CompassBackgroundView *)self smallCompassTicLayers];
  [(CompassBackgroundView *)self bounds];
  objc_msgSend(v18, "setFrame:");

  CGRect v19 = [(CompassBackgroundView *)self prototypeSmallTicLayer];
  objc_msgSend(v19, "setPosition:", self->_compassCenter.x, self->_compassCenter.y + self->_ticRadius);

  if (self->_shownInCompass)
  {
    CGRect v20 = [(CompassBackgroundView *)self largeCompassTicLayers];
    [(CompassBackgroundView *)self bounds];
    objc_msgSend(v20, "setFrame:");

    CGRect v21 = [(CompassBackgroundView *)self prototypeLargeTicLayer];
    objc_msgSend(v21, "setPosition:", p_compassCenter->x, self->_compassCenter.y + self->_ticRadius);

    double v22 = self->_ticRadius + (self->_currentHeadingLength - self->_ticLength) * 0.5;
    v23 = [(CompassBackgroundView *)self currentHeadingLayer];
    objc_msgSend(v23, "setPosition:", p_compassCenter->x, self->_compassCenter.y - v22);

    v24 = [(CompassBackgroundView *)self bubbleLayer];
    objc_msgSend(v24, "setPosition:", p_compassCenter->x - self->_currentOffset.x, self->_compassCenter.y - self->_currentOffset.y);

    v25 = [(CompassBackgroundView *)self crosshairLayer];
    objc_msgSend(v25, "setPosition:", p_compassCenter->x, self->_compassCenter.y);
  }
  double bearing = self->_bearing;
  if (bearing == 1.79769313e308)
  {
    [(CALayer *)self->_bearingLayer setHidden:1];
  }
  else
  {
    double v27 = (bearing + 270.0) * 3.14159265 / 180.0;
    double v28 = self->_ticRadius + (self->_bearingLength - self->_ticLength) * 0.5;
    double x = p_compassCenter->x;
    __double2 v30 = __sincos_stret(v27);
    double v31 = x + v28 * v30.__cosval;
    CGFloat v32 = self->_compassCenter.y + v28 * v30.__sinval;
    v33 = [(CompassBackgroundView *)self bearingLayer];
    objc_msgSend(v33, "setPosition:", v31, v32);
    CATransform3DMakeRotation(&v34, v27 + 1.57079633, 0.0, 0.0, 1.0);
    [v33 setTransform:&v34];
    [v33 setHidden:0];
  }
  [MEMORY[0x263F158F8] commit];
}

- (BOOL)setCrosshairOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CompassBackgroundView *)self bounds];
  double v7 = bubbleDiameter(v6);
  p_currentOffset = &self->_currentOffset;
  if (vabdd_f64(p_currentOffset->x, width * v7 / 5.0) < 0.5 && vabdd_f64(p_currentOffset->y, height * v7 / 5.0) < 0.5) {
    return 0;
  }
  CGPointRoundToPixel();
  p_currentOffset->double x = v10;
  p_currentOffset->CGFloat y = v11;
  return 1;
}

- (void)setCompassHeading:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CompassBackgroundView;
  [(CompassRotatingView *)&v7 setCompassHeading:a3];
  double v4 = [(CompassBackgroundView *)self rotatingLayer];
  CGFloat v5 = NSNumber;
  [(CompassRotatingView *)self angle];
  double v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 setValue:v6 forKeyPath:@"transform.rotation.z"];
}

- (double)ticLength
{
  return self->_ticLength;
}

- (double)ticRadius
{
  return self->_ticRadius;
}

- (double)bearing
{
  return self->_bearing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bubbleLayer, 0);
  objc_storeStrong((id *)&self->_crosshairLayer, 0);
  objc_storeStrong((id *)&self->_currentHeadingLayer, 0);
  objc_storeStrong((id *)&self->_bearingLayer, 0);
  objc_storeStrong((id *)&self->_prototypeLargeTicLayer, 0);
  objc_storeStrong((id *)&self->_prototypeSmallTicLayer, 0);
  objc_storeStrong((id *)&self->_largeCompassTicLayers, 0);
  objc_storeStrong((id *)&self->_smallCompassTicLayers, 0);
  objc_storeStrong((id *)&self->_rotatingLayer, 0);

  objc_storeStrong((id *)&self->_staticLayer, 0);
}

@end