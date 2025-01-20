@interface AXMTVelocityBasedPointMapper
- (AXMTVelocityBasedPointMapper)initWithBounds:(CGRect)a3 sensitivity:(double)a4;
- (AXMTVelocityBasedPointMapperDelegate)delegate;
- (CGPoint)_normalizedPointForLocalCoordinate:(CGPoint)a3 inBounds:(CGRect)a4;
- (CGPoint)processPoint:(CGPoint)a3;
- (CGRect)bounds;
- (NSDate)_lastReportedTimestamp;
- (NSMutableArray)_deltaTimesWindow;
- (NSValue)_lastProcessedPoint;
- (NSValue)_lastReportedPointFromProcessing;
- (NSValue)_lastVelocitySize;
- (NSValue)_nextInitialPoint;
- (NSValue)lastReportedPoint;
- (double)_computeDistanceForTimeDifference:(double)a3 currentNormalizedPoint:(double)a4 lastNormalizedPoint:(double)a5 sensitivityFactor:(double)a6;
- (double)_dampenMovementForNormalizedValue:(double)result normalizedLastValue:(double)a4 startingCutoff:(double)a5 factorNumerator:(double)a6;
- (double)sensitivity;
- (id)_movingWindowAverageForNewDelta:(double)a3;
- (void)dealloc;
- (void)reset;
- (void)resetToPoint:(CGPoint)a3;
- (void)setBounds:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setLastReportedPoint:(id)a3;
- (void)setSensitivity:(double)a3;
- (void)set_deltaTimesWindow:(id)a3;
- (void)set_lastProcessedPoint:(id)a3;
- (void)set_lastReportedPointFromProcessing:(id)a3;
- (void)set_lastReportedTimestamp:(id)a3;
- (void)set_lastVelocitySize:(id)a3;
- (void)set_nextInitialPoint:(id)a3;
@end

@implementation AXMTVelocityBasedPointMapper

- (AXMTVelocityBasedPointMapper)initWithBounds:(CGRect)a3 sensitivity:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)AXMTVelocityBasedPointMapper;
  v9 = [(AXMTVelocityBasedPointMapper *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_bounds.origin.CGFloat x = x;
    v9->_bounds.origin.CGFloat y = y;
    v9->_bounds.size.CGFloat width = width;
    v9->_bounds.size.CGFloat height = height;
    v9->_sensitivitCGFloat y = a4;
    uint64_t v11 = +[NSMutableArray array];
    deltaTimesWindow = v10->__deltaTimesWindow;
    v10->__deltaTimesWindow = (NSMutableArray *)v11;
  }
  return v10;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AXMTVelocityBasedPointMapper;
  [(AXMTVelocityBasedPointMapper *)&v2 dealloc];
}

- (void)resetToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(AXMTVelocityBasedPointMapper *)self reset];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100021A9C(x, y);
  }
  *(double *)v7 = x;
  *(double *)&v7[1] = y;
  v6 = +[NSValue valueWithBytes:v7 objCType:"{CGPoint=dd}"];
  [(AXMTVelocityBasedPointMapper *)self set_nextInitialPoint:v6];
}

- (void)reset
{
  [(AXMTVelocityBasedPointMapper *)self setLastReportedPoint:0];
  [(AXMTVelocityBasedPointMapper *)self set_lastProcessedPoint:0];
  [(AXMTVelocityBasedPointMapper *)self set_lastReportedTimestamp:0];
  [(AXMTVelocityBasedPointMapper *)self set_lastVelocitySize:0];
  [(AXMTVelocityBasedPointMapper *)self set_lastReportedPointFromProcessing:0];

  [(AXMTVelocityBasedPointMapper *)self set_nextInitialPoint:0];
}

- (CGPoint)processPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(AXMTVelocityBasedPointMapper *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  objc_super v14 = +[NSDate date];
  v15 = [(AXMTVelocityBasedPointMapper *)self _lastProcessedPoint];

  if (v15)
  {
    v16 = [(AXMTVelocityBasedPointMapper *)self _lastProcessedPoint];
    [v16 pointValue];
    double v18 = v17;
    double v20 = v19;

    -[AXMTVelocityBasedPointMapper _normalizedPointForLocalCoordinate:inBounds:](self, "_normalizedPointForLocalCoordinate:inBounds:", v18, v20, v7, v9, v11, v13);
    double v21 = v9;
    double v23 = v22;
    double v73 = v24;
    v25 = [(AXMTVelocityBasedPointMapper *)self _lastReportedTimestamp];
    v26 = [(AXMTVelocityBasedPointMapper *)self _lastReportedPointFromProcessing];
    [v26 pointValue];
    uint64_t v70 = v27;
    double v72 = v28;

    double v77 = x;
    double v78 = y;
    double v74 = v21;
    double v75 = v7;
    double v76 = v11;
    -[AXMTVelocityBasedPointMapper _normalizedPointForLocalCoordinate:inBounds:](self, "_normalizedPointForLocalCoordinate:inBounds:", x, y, v7, v21, v11, v13);
    double v30 = v29;
    double v32 = v31;
    [v14 timeIntervalSinceDate:v25];
    double v34 = v33;
    v35 = -[AXMTVelocityBasedPointMapper _movingWindowAverageForNewDelta:](self, "_movingWindowAverageForNewDelta:");
    if (!v35)
    {
      v35 = +[NSNumber numberWithDouble:v34];
    }
    objc_msgSend(v35, "doubleValue", v70);
    double v37 = v36;
    [(AXMTVelocityBasedPointMapper *)self sensitivity];
    double v39 = v13 * 2.128 + 93.62 + v38 * (v13 * 6.383 + 2080.85);
    [(AXMTVelocityBasedPointMapper *)self _dampenMovementForNormalizedValue:v30 normalizedLastValue:v23 startingCutoff:2.0 factorNumerator:4.0];
    double v41 = v40;
    [(AXMTVelocityBasedPointMapper *)self _dampenMovementForNormalizedValue:v32 normalizedLastValue:v73 startingCutoff:1.5 factorNumerator:1.0];
    double v43 = v42;
    [(AXMTVelocityBasedPointMapper *)self _computeDistanceForTimeDifference:v37 currentNormalizedPoint:v41 lastNormalizedPoint:v23 sensitivityFactor:v39 * 0.525];
    double v45 = v44;
    double v46 = v71 + v44;
    [(AXMTVelocityBasedPointMapper *)self _computeDistanceForTimeDifference:v37 currentNormalizedPoint:v43 lastNormalizedPoint:v73 sensitivityFactor:v39];
    double v48 = v72 + v47;
    double v49 = v45 / v37;
    double v50 = v47 / v37;
    v51 = [(AXMTVelocityBasedPointMapper *)self _lastVelocitySize];

    if (v51)
    {
      v52 = [(AXMTVelocityBasedPointMapper *)self _lastVelocitySize];
      [v52 sizeValue];
      double v54 = v53;
      double v56 = v55;

      double v49 = v49 + v54 * 0.0;
      double v50 = v50 + v56 * 0.0;
    }
    double y = v78;
    v57 = +[NSValue valueWithSize:](NSValue, "valueWithSize:", v49, v50);
    [(AXMTVelocityBasedPointMapper *)self set_lastVelocitySize:v57];

    double v58 = AXMTConstrainPointWithinBounds(v46, v48, v75, v74, v76);
    CGFloat v60 = v59;
    v61 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:");
    [(AXMTVelocityBasedPointMapper *)self set_lastReportedPointFromProcessing:v61];

    double x = v77;
  }
  else
  {
    v25 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v11 * 0.5, v13 * 0.5);
    v62 = [(AXMTVelocityBasedPointMapper *)self _nextInitialPoint];

    if (v62)
    {
      uint64_t v63 = [(AXMTVelocityBasedPointMapper *)self _nextInitialPoint];

      [(AXMTVelocityBasedPointMapper *)self set_nextInitialPoint:0];
      v25 = (void *)v63;
    }
    double v58 = NSZeroPoint.x;
    CGFloat v60 = NSZeroPoint.y;
    [(AXMTVelocityBasedPointMapper *)self set_lastReportedPointFromProcessing:v25];
  }

  *(double *)v79 = x;
  *(double *)&v79[1] = y;
  v64 = +[NSValue valueWithBytes:v79 objCType:"{CGPoint=dd}"];
  [(AXMTVelocityBasedPointMapper *)self set_lastProcessedPoint:v64];

  [(AXMTVelocityBasedPointMapper *)self set_lastReportedTimestamp:v14];
  v65 = [(AXMTVelocityBasedPointMapper *)self _lastReportedPointFromProcessing];
  [(AXMTVelocityBasedPointMapper *)self setLastReportedPoint:v65];

  v66 = [(AXMTVelocityBasedPointMapper *)self delegate];
  v67 = [(AXMTVelocityBasedPointMapper *)self lastReportedPoint];
  [v67 pointValue];
  objc_msgSend(v66, "velocityBasedPointMapper:updatedPoint:", self);

  double v68 = v58;
  double v69 = v60;
  result.double y = v69;
  result.double x = v68;
  return result;
}

- (id)_movingWindowAverageForNewDelta:(double)a3
{
  v5 = [(AXMTVelocityBasedPointMapper *)self _deltaTimesWindow];
  id v6 = [v5 count];

  double v7 = [(AXMTVelocityBasedPointMapper *)self _deltaTimesWindow];
  double v8 = v7;
  if (v6 == (id)30)
  {
    [v7 removeObjectAtIndex:0];

    double v9 = [(AXMTVelocityBasedPointMapper *)self _deltaTimesWindow];
    double v10 = +[NSNumber numberWithDouble:a3];
    [v9 addObject:v10];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v11 = [(AXMTVelocityBasedPointMapper *)self _deltaTimesWindow];
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      double v15 = 0.0;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * i) doubleValue];
          double v15 = v15 + v17;
        }
        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }
    else
    {
      double v15 = 0.0;
    }

    double v20 = [(AXMTVelocityBasedPointMapper *)self _deltaTimesWindow];
    double v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15 / (double)(unint64_t)[v20 count]);
  }
  else
  {
    double v18 = +[NSNumber numberWithDouble:a3];
    [v8 addObject:v18];

    double v19 = 0;
  }

  return v19;
}

- (CGPoint)_normalizedPointForLocalCoordinate:(CGPoint)a3 inBounds:(CGRect)a4
{
  double v4 = a3.x / a4.size.width;
  double v5 = a3.y / a4.size.height;
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (double)_computeDistanceForTimeDifference:(double)a3 currentNormalizedPoint:(double)a4 lastNormalizedPoint:(double)a5 sensitivityFactor:(double)a6
{
  double v6 = (a4 - a5) / (a3 * 1000.0) * a6;
  double v7 = v6 * v6;
  BOOL v8 = v6 * v6 > 0.0 && v6 < 0.0;
  double result = -(v6 * v6);
  if (!v8) {
    return v7;
  }
  return result;
}

- (double)_dampenMovementForNormalizedValue:(double)result normalizedLastValue:(double)a4 startingCutoff:(double)a5 factorNumerator:(double)a6
{
  double v6 = fabs(a4);
  if (fabs(result) > a5 && v6 > a5) {
    return a4 + a6 / (result * result) * (result - a4);
  }
  return result;
}

- (double)sensitivity
{
  return self->_sensitivity;
}

- (void)setSensitivity:(double)a3
{
  self->_sensitivitdouble y = a3;
}

- (NSValue)lastReportedPoint
{
  return self->_lastReportedPoint;
}

- (void)setLastReportedPoint:(id)a3
{
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (AXMTVelocityBasedPointMapperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXMTVelocityBasedPointMapperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSValue)_lastReportedPointFromProcessing
{
  return self->__lastReportedPointFromProcessing;
}

- (void)set_lastReportedPointFromProcessing:(id)a3
{
}

- (NSValue)_lastProcessedPoint
{
  return self->__lastProcessedPoint;
}

- (void)set_lastProcessedPoint:(id)a3
{
}

- (NSDate)_lastReportedTimestamp
{
  return self->__lastReportedTimestamp;
}

- (void)set_lastReportedTimestamp:(id)a3
{
}

- (NSValue)_lastVelocitySize
{
  return self->__lastVelocitySize;
}

- (void)set_lastVelocitySize:(id)a3
{
}

- (NSValue)_nextInitialPoint
{
  return self->__nextInitialPoint;
}

- (void)set_nextInitialPoint:(id)a3
{
}

- (NSMutableArray)_deltaTimesWindow
{
  return self->__deltaTimesWindow;
}

- (void)set_deltaTimesWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__deltaTimesWindow, 0);
  objc_storeStrong((id *)&self->__nextInitialPoint, 0);
  objc_storeStrong((id *)&self->__lastVelocitySize, 0);
  objc_storeStrong((id *)&self->__lastReportedTimestamp, 0);
  objc_storeStrong((id *)&self->__lastProcessedPoint, 0);
  objc_storeStrong((id *)&self->__lastReportedPointFromProcessing, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_lastReportedPoint, 0);
}

@end