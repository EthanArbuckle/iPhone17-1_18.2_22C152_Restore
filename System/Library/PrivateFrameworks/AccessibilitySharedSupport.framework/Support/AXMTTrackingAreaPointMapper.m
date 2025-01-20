@interface AXMTTrackingAreaPointMapper
+ (CGRect)trackingAreaForFaceBounds:(CGRect)a3 noseCenter:(CGPoint)a4;
- (AXMTTrackingAreaPointMapper)initWithTrackingAreaBounds:(CGRect)a3 lockTrackingAreaPosition:(BOOL)a4;
- (AXMTTrackingAreaPointMapper)initWithTrackingAreaBounds:(CGRect)a3 lockTrackingAreaPosition:(BOOL)a4 center:(CGPoint)a5;
- (BOOL)_trackingAreaPositionLocked;
- (BOOL)_useCustomCenter;
- (BOOL)updateTrackedPoint:(CGPoint)a3;
- (BOOL)useAccelerationCurve;
- (CGPoint)normalizedTrackedPoint;
- (CGPoint)trackingAreaCenter;
- (CGRect)trackingAreaBounds;
- (double)_horizontalNormalizationFactor;
- (double)_verticalNormalizationFactor;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resetTrackingAreaBounds:(CGRect)a3 lockTrackingAreaPosition:(BOOL)a4;
- (void)setNormalizedTrackedPoint:(CGPoint)a3;
- (void)setTrackingAreaBounds:(CGRect)a3;
- (void)setTrackingAreaCenter:(CGPoint)a3;
- (void)setUseAccelerationCurve:(BOOL)a3;
- (void)set_horizontalNormalizationFactor:(double)a3;
- (void)set_trackingAreaPositionLocked:(BOOL)a3;
- (void)set_useCustomCenter:(BOOL)a3;
- (void)set_verticalNormalizationFactor:(double)a3;
@end

@implementation AXMTTrackingAreaPointMapper

- (AXMTTrackingAreaPointMapper)initWithTrackingAreaBounds:(CGRect)a3 lockTrackingAreaPosition:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)AXMTTrackingAreaPointMapper;
  v9 = [(AXMTTrackingAreaPointMapper *)&v12 init];
  if (v9)
  {
    v10 = NSStringFromSelector("trackingAreaBounds");
    [(AXMTTrackingAreaPointMapper *)v9 addObserver:v9 forKeyPath:v10 options:1 context:off_1000549A8];

    -[AXMTTrackingAreaPointMapper resetTrackingAreaBounds:lockTrackingAreaPosition:](v9, "resetTrackingAreaBounds:lockTrackingAreaPosition:", v4, x, y, width, height);
    v9->__useCustomCenter = 0;
  }
  return v9;
}

- (AXMTTrackingAreaPointMapper)initWithTrackingAreaBounds:(CGRect)a3 lockTrackingAreaPosition:(BOOL)a4 center:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  result = -[AXMTTrackingAreaPointMapper initWithTrackingAreaBounds:lockTrackingAreaPosition:](self, "initWithTrackingAreaBounds:lockTrackingAreaPosition:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_trackingAreaCenter.CGFloat x = x;
    result->_trackingAreaCenter.CGFloat y = y;
    result->__useCustomCenter = 1;
  }
  return result;
}

- (void)dealloc
{
  v3 = NSStringFromSelector("trackingAreaBounds");
  [(AXMTTrackingAreaPointMapper *)self removeObserver:self forKeyPath:v3 context:off_1000549A8];

  v4.receiver = self;
  v4.super_class = (Class)AXMTTrackingAreaPointMapper;
  [(AXMTTrackingAreaPointMapper *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1000549A8 == a6)
  {
    v7 = objc_msgSend(a5, "objectForKeyedSubscript:", NSKeyValueChangeNewKey, a4);
    [v7 rectValue];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    [(AXMTTrackingAreaPointMapper *)self set_horizontalNormalizationFactor:2.0 / v13];
    [(AXMTTrackingAreaPointMapper *)self set_verticalNormalizationFactor:2.0 / v15];
    if (![(AXMTTrackingAreaPointMapper *)self _useCustomCenter])
    {
      -[AXMTTrackingAreaPointMapper setTrackingAreaCenter:](self, "setTrackingAreaCenter:", v9 + v13 * 0.5, v11 + v15 * 0.5);
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)AXMTTrackingAreaPointMapper;
    -[AXMTTrackingAreaPointMapper observeValueForKeyPath:ofObject:change:context:](&v16, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)resetTrackingAreaBounds:(CGRect)a3 lockTrackingAreaPosition:(BOOL)a4
{
  BOOL v4 = a4;
  -[AXMTTrackingAreaPointMapper setTrackingAreaBounds:](self, "setTrackingAreaBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  [(AXMTTrackingAreaPointMapper *)self set_trackingAreaPositionLocked:v4];
}

- (BOOL)updateTrackedPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(AXMTTrackingAreaPointMapper *)self trackingAreaCenter];
  double v7 = x - v6;
  [(AXMTTrackingAreaPointMapper *)self _horizontalNormalizationFactor];
  double v9 = v8 * v7;
  [(AXMTTrackingAreaPointMapper *)self trackingAreaCenter];
  double v11 = y - v10;
  [(AXMTTrackingAreaPointMapper *)self _verticalNormalizationFactor];
  double v13 = v12 * v11;
  if ([(AXMTTrackingAreaPointMapper *)self useAccelerationCurve])
  {
    double v9 = v9 * fmin(exp2(fabs(v9)) * 0.5, 1.0);
    double v13 = v13 * fmin(pow(7.0, fabs(v13)) * 0.75, 1.0);
  }
  -[AXMTTrackingAreaPointMapper setNormalizedTrackedPoint:](self, "setNormalizedTrackedPoint:", v9, v13);
  return 0;
}

+ (CGRect)trackingAreaForFaceBounds:(CGRect)a3 noseCenter:(CGPoint)a4
{
  double v4 = a3.origin.x + a3.size.width * 0.2;
  double v5 = a3.size.width * 0.6;
  double v6 = a3.size.height * 0.5;
  double v7 = a4.y + v6 * -0.5;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v7;
  result.origin.double x = v4;
  return result;
}

- (CGRect)trackingAreaBounds
{
  double x = self->_trackingAreaBounds.origin.x;
  double y = self->_trackingAreaBounds.origin.y;
  double width = self->_trackingAreaBounds.size.width;
  double height = self->_trackingAreaBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTrackingAreaBounds:(CGRect)a3
{
  self->_trackingAreaBounds = a3;
}

- (CGPoint)normalizedTrackedPoint
{
  objc_copyStruct(v4, &self->_normalizedTrackedPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setNormalizedTrackedPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_normalizedTrackedPoint, &v3, 16, 1, 0);
}

- (CGPoint)trackingAreaCenter
{
  double x = self->_trackingAreaCenter.x;
  double y = self->_trackingAreaCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTrackingAreaCenter:(CGPoint)a3
{
  self->_trackingAreaCenter = a3;
}

- (BOOL)useAccelerationCurve
{
  return self->_useAccelerationCurve;
}

- (void)setUseAccelerationCurve:(BOOL)a3
{
  self->_useAccelerationCurve = a3;
}

- (double)_horizontalNormalizationFactor
{
  return self->__horizontalNormalizationFactor;
}

- (void)set_horizontalNormalizationFactor:(double)a3
{
  self->__horizontalNormalizationFactor = a3;
}

- (double)_verticalNormalizationFactor
{
  return self->__verticalNormalizationFactor;
}

- (void)set_verticalNormalizationFactor:(double)a3
{
  self->__verticalNormalizationFactor = a3;
}

- (BOOL)_trackingAreaPositionLocked
{
  return self->__trackingAreaPositionLocked;
}

- (void)set_trackingAreaPositionLocked:(BOOL)a3
{
  self->__trackingAreaPositionLocked = a3;
}

- (BOOL)_useCustomCenter
{
  return self->__useCustomCenter;
}

- (void)set_useCustomCenter:(BOOL)a3
{
  self->__useCustomCenter = a3;
}

@end