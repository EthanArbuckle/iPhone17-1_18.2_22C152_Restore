@interface AXMTRelativePointerMovementMapper
- (AXMTAccelerationCurve)_accelerationCurve;
- (AXMTRelativePointerMovementMapper)initWithScreenBounds:(CGRect)a3;
- (double)_lastTrackingPointTimestamp;
- (double)_trueMovementThresholdX;
- (double)_trueMovementThresholdY;
- (double)accelerationFactor;
- (double)normalizedMovementThreshold;
- (id)_processPointInNormalizedTrackingSpace:(CGPoint)a3 withTimestamp:(double)a4;
- (id)processPointInNormalizedTrackingSpace:(CGPoint)a3;
- (void)_updateAccelerationCurve;
- (void)reset;
- (void)setAccelerationFactor:(double)a3;
- (void)setNormalizedMovementThreshold:(double)a3;
- (void)setScreenBounds:(CGRect)a3;
- (void)set_accelerationCurve:(id)a3;
- (void)set_lastTrackingPointTimestamp:(double)a3;
- (void)set_trueMovementThresholdX:(double)a3;
- (void)set_trueMovementThresholdY:(double)a3;
@end

@implementation AXMTRelativePointerMovementMapper

- (AXMTRelativePointerMovementMapper)initWithScreenBounds:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXMTRelativePointerMovementMapper;
  v3 = -[AXMTPointerMovementMapper initWithScreenBounds:](&v6, "initWithScreenBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(AXMTRelativePointerMovementMapper *)v3 _updateAccelerationCurve];
  }
  return v4;
}

- (void)setAccelerationFactor:(double)a3
{
  id v4 = [(AXMTRelativePointerMovementMapper *)self _accelerationCurve];
  [v4 setAccelerationFactor:a3];
}

- (double)accelerationFactor
{
  v2 = [(AXMTRelativePointerMovementMapper *)self _accelerationCurve];
  [v2 accelerationFactor];
  double v4 = v3;

  return v4;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)AXMTRelativePointerMovementMapper;
  [(AXMTPointerMovementMapper *)&v3 reset];
  [(AXMTRelativePointerMovementMapper *)self set_lastTrackingPointTimestamp:-1.0];
}

- (id)processPointInNormalizedTrackingSpace:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double Current = CFAbsoluteTimeGetCurrent();

  return -[AXMTRelativePointerMovementMapper _processPointInNormalizedTrackingSpace:withTimestamp:](self, "_processPointInNormalizedTrackingSpace:withTimestamp:", x, y, Current);
}

- (void)setNormalizedMovementThreshold:(double)a3
{
  self->_normalizedMovementThreshold = a3;
  [(AXMTRelativePointerMovementMapper *)self set_trueMovementThresholdX:a3 * 0.4 + 0.05];

  [(AXMTRelativePointerMovementMapper *)self set_trueMovementThresholdY:a3 * 0.26 + 0.01];
}

- (void)setScreenBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXMTRelativePointerMovementMapper;
  -[AXMTPointerMovementMapper setScreenBounds:](&v4, "setScreenBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AXMTRelativePointerMovementMapper *)self _updateAccelerationCurve];
}

- (void)_updateAccelerationCurve
{
  [(AXMTPointerMovementMapper *)self screenBounds];
  double v4 = v3;
  [(AXMTPointerMovementMapper *)self screenBounds];
  double v6 = v5;
  [(AXMTPointerMovementMapper *)self screenBounds];
  double v8 = v7;
  [(AXMTPointerMovementMapper *)self screenBounds];
  double v10 = sqrt(v8 * v9 + v4 * v6) * 0.5 * 0.02;
  v11 = [(AXMTRelativePointerMovementMapper *)self _accelerationCurve];

  if (v11)
  {
    v12 = [(AXMTRelativePointerMovementMapper *)self _accelerationCurve];
    [(AXMTAccelerationCurve *)v12 setInflectionPoint:v10];
  }
  else
  {
    v12 = [[AXMTAccelerationCurve alloc] initWithAccelerationFactor:1.5 inflectionPoint:v10];
    -[AXMTRelativePointerMovementMapper set_accelerationCurve:](self, "set_accelerationCurve:");
  }
}

- (id)_processPointInNormalizedTrackingSpace:(CGPoint)a3 withTimestamp:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  [(AXMTRelativePointerMovementMapper *)self _lastTrackingPointTimestamp];
  if (v8 >= 0.0)
  {
    [(AXMTRelativePointerMovementMapper *)self _trueMovementThresholdX];
    double v13 = fmax(fabs(x * 1.5) - v12, 0.0);
    [(AXMTRelativePointerMovementMapper *)self _trueMovementThresholdX];
    double v15 = v13 / (1.0 - v14);
    if (x >= 0.0) {
      double v16 = v15;
    }
    else {
      double v16 = -v15;
    }
    [(AXMTRelativePointerMovementMapper *)self _trueMovementThresholdY];
    double v18 = v17;
    [(AXMTRelativePointerMovementMapper *)self _trueMovementThresholdY];
    double v20 = 4.7;
    if (y < 0.0) {
      double v20 = 2.5;
    }
    double v21 = fmax(fabs(y * v20) - v18, 0.0) / (1.0 - v19);
    if (y >= 0.0) {
      double v22 = v21;
    }
    else {
      double v22 = -v21;
    }
    [(AXMTPointerMovementMapper *)self screenBounds];
    double v24 = v16 * v23;
    [(AXMTPointerMovementMapper *)self screenBounds];
    double v26 = v22 * v25;
    v27 = [(AXMTRelativePointerMovementMapper *)self _accelerationCurve];
    objc_msgSend(v27, "mapVector:", v24, v26);
    double v29 = v28;
    double v31 = v30;

    [(AXMTRelativePointerMovementMapper *)self _lastTrackingPointTimestamp];
    double v33 = a4 - v32;
    [(AXMTRelativePointerMovementMapper *)self set_lastTrackingPointTimestamp:a4];
    double v9 = [AXMTPointerMovement alloc];
    double v10 = -(v29 * v33);
    double v11 = v31 * v33;
  }
  else
  {
    [(AXMTRelativePointerMovementMapper *)self set_lastTrackingPointTimestamp:a4];
    double v9 = [AXMTPointerMovement alloc];
    double v10 = NSZeroPoint.x;
    double v11 = NSZeroPoint.y;
  }
  v34 = -[AXMTPointerMovement initWithMovementDelta:](v9, "initWithMovementDelta:", v10, v11);

  return v34;
}

- (double)normalizedMovementThreshold
{
  return self->_normalizedMovementThreshold;
}

- (double)_lastTrackingPointTimestamp
{
  return self->__lastTrackingPointTimestamp;
}

- (void)set_lastTrackingPointTimestamp:(double)a3
{
  self->__lastTrackingPointTimestamp = a3;
}

- (AXMTAccelerationCurve)_accelerationCurve
{
  return self->__accelerationCurve;
}

- (void)set_accelerationCurve:(id)a3
{
}

- (double)_trueMovementThresholdX
{
  return self->__trueMovementThresholdX;
}

- (void)set_trueMovementThresholdX:(double)a3
{
  self->__trueMovementThresholdX = a3;
}

- (double)_trueMovementThresholdY
{
  return self->__trueMovementThresholdY;
}

- (void)set_trueMovementThresholdY:(double)a3
{
  self->__trueMovementThresholdY = a3;
}

- (void).cxx_destruct
{
}

@end