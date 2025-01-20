@interface SCATPointerPointPicker
- (AXDispatchTimer)dwellTimer;
- (BOOL)_isWithinLastDwellBounds:(CGPoint)a3;
- (BOOL)allowsSelectionRefinement;
- (BOOL)dwellSwitchAssigned;
- (BOOL)handleInputAction:(id)a3 withElement:(id)a4;
- (BOOL)providesElements;
- (BOOL)shouldKeepScannerAwake;
- (CGPoint)delayedPickedPoint;
- (CGPoint)lastDwellStartPoint;
- (CGPoint)pickedPoint;
- (NSMutableArray)historyOfPoints;
- (NSMutableArray)historyOfTimestamps;
- (double)cachedToleranceRadius;
- (id)_initWithMenu:(id)a3;
- (int64_t)pickerType;
- (void)_startDwellTimer;
- (void)cancelDwellTimer;
- (void)dealloc;
- (void)moveToPoint:(CGPoint)a3;
- (void)pressFingersDown:(BOOL)a3;
- (void)scannerWillMakeManagerActive:(id)a3;
- (void)scannerWillMakeManagerActive:(id)a3 forDisplayID:(unsigned int)a4;
- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4;
- (void)setCachedToleranceRadius:(double)a3;
- (void)setDelayedPickedPoint:(CGPoint)a3;
- (void)setDwellSwitchAssigned:(BOOL)a3;
- (void)setDwellTimer:(id)a3;
- (void)setHistoryOfPoints:(id)a3;
- (void)setHistoryOfTimestamps:(id)a3;
- (void)setLastDwellStartPoint:(CGPoint)a3;
@end

@implementation SCATPointerPointPicker

- (id)_initWithMenu:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SCATPointerPointPicker;
  id v5 = [(SCATPointPicker *)&v19 _initWithMenu:v4];
  if (v5)
  {
    v6 = [(SCATPointPickerViewController *)[SCATPointerPointPickerViewController alloc] initWithElementManager:v5 menu:v4];
    [v5 setVisualProvider:v6];
    uint64_t v7 = +[NSMutableArray array];
    v8 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v7;

    uint64_t v9 = +[NSMutableArray array];
    v10 = (void *)*((void *)v5 + 15);
    *((void *)v5 + 15) = v9;

    *((_OWORD *)v5 + 10) = HNDPointNull;
    v11 = +[AXSettings sharedInstance];
    [v11 switchControlCameraPointPickerDwellMovementToleranceRadius];
    *((void *)v5 + 17) = v12;

    objc_initWeak(&location, v5);
    v13 = +[AXSettings sharedInstance];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000B62F8;
    v16[3] = &unk_1001AAA68;
    objc_copyWeak(&v17, &location);
    id v14 = objc_loadWeakRetained(&location);
    [v13 registerUpdateBlock:v16 forRetrieveSelector:"switchControlCameraPointPickerDwellMovementToleranceRadius" withListener:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)dealloc
{
  [(SCATPointerPointPicker *)self cancelDwellTimer];
  v3.receiver = self;
  v3.super_class = (Class)SCATPointerPointPicker;
  [(SCATPointerPointPicker *)&v3 dealloc];
}

- (int64_t)pickerType
{
  return 2;
}

- (BOOL)shouldKeepScannerAwake
{
  return 1;
}

- (BOOL)allowsSelectionRefinement
{
  return 0;
}

- (CGPoint)pickedPoint
{
  [(SCATPointerPointPicker *)self delayedPickedPoint];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)pressFingersDown:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SCATPointerPointPicker *)self controlViewController];
  [v4 pressFingersDown:v3];
}

- (BOOL)providesElements
{
  return 0;
}

- (void)scannerWillMakeManagerActive:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCATPointerPointPicker;
  [(SCATElementManager *)&v5 scannerWillMakeManagerActive:a3];
  id v4 = [(SCATPointerPointPicker *)self controlViewController];
  [v4 setShouldUpdateZoomLocation:1];
}

- (void)scannerWillMakeManagerActive:(id)a3 forDisplayID:(unsigned int)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SCATPointerPointPicker;
  [(SCATElementManager *)&v6 scannerWillMakeManagerActive:a3 forDisplayID:*(void *)&a4];
  objc_super v5 = [(SCATPointerPointPicker *)self controlViewController];
  [v5 setShouldUpdateZoomLocation:1];
}

- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SCATPointerPointPicker;
  [(SCATElementManager *)&v6 scannerWillMakeManagerInactive:a3 activeElementManager:a4];
  objc_super v5 = [(SCATPointerPointPicker *)self controlViewController];
  [v5 setShouldUpdateZoomLocation:0];
}

- (BOOL)handleInputAction:(id)a3 withElement:(id)a4
{
  objc_super v5 = (char *)[a3 action];
  if ((unint64_t)(v5 - 100) > 9 || ((1 << (v5 - 100)) & 0x25F) == 0)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v7 = [(SCATPointerPointPicker *)self controlViewController];
    [v7 pickPoint];

    BOOL v8 = 1;
  }
  [(SCATPointerPointPicker *)self cancelDwellTimer];
  uint64_t v9 = +[SCATScannerManager sharedManager];
  v10 = [v9 selectActionHandler];
  unsigned __int8 v11 = [v10 isPending];

  if ((v11 & 1) == 0) {
    [v9 beginScanningWithFocusContext:0];
  }

  return v8;
}

- (void)moveToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v24.receiver = self;
  v24.super_class = (Class)SCATPointerPointPicker;
  -[SCATPointPicker moveToPoint:](&v24, "moveToPoint:");
  objc_super v6 = [(SCATPointerPointPicker *)self controlViewController];
  objc_msgSend(v6, "moveToPoint:", x, y);

  uint64_t v7 = [(SCATPointerPointPicker *)self historyOfPoints];
  BOOL v8 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", x, y);
  [v7 addObject:v8];

  uint64_t v9 = [(SCATPointerPointPicker *)self historyOfTimestamps];
  v10 = +[NSDate date];
  [v9 addObject:v10];

  unsigned __int8 v11 = [(SCATPointerPointPicker *)self historyOfPoints];
  id v12 = [v11 count];

  if (v12)
  {
    do
    {
      v13 = +[NSDate date];
      id v14 = [(SCATPointerPointPicker *)self historyOfTimestamps];
      v15 = [v14 firstObject];
      [v13 timeIntervalSinceDate:v15];
      double v17 = v16;

      if (v17 <= 0.1) {
        break;
      }
      v18 = [(SCATPointerPointPicker *)self historyOfPoints];
      objc_super v19 = [v18 firstObject];

      v20 = [(SCATPointerPointPicker *)self historyOfPoints];
      [v20 removeObjectAtIndex:0];

      v21 = [(SCATPointerPointPicker *)self historyOfTimestamps];
      [v21 removeObjectAtIndex:0];

      [v19 pointValue];
      -[SCATPointerPointPicker setDelayedPickedPoint:](self, "setDelayedPickedPoint:");

      v22 = [(SCATPointerPointPicker *)self historyOfPoints];
      id v23 = [v22 count];
    }
    while (v23);
  }
  if ([(SCATPointerPointPicker *)self dwellSwitchAssigned]) {
    [(SCATPointerPointPicker *)self _startDwellTimer];
  }
}

- (void)setDwellSwitchAssigned:(BOOL)a3
{
  if (self->_dwellSwitchAssigned && !a3) {
    [(SCATPointerPointPicker *)self cancelDwellTimer];
  }
  self->_dwellSwitchAssigned = a3;
}

- (BOOL)_isWithinLastDwellBounds:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(SCATPointerPointPicker *)self lastDwellStartPoint];
  BOOL v8 = v7 == -1.0 && v6 == -1.0;
  BOOL result = 0;
  if (!v8)
  {
    [(SCATPointerPointPicker *)self cachedToleranceRadius];
    double v10 = v9;
    [(SCATPointerPointPicker *)self lastDwellStartPoint];
    if (vabdd_f64(x, v11) < v10)
    {
      [(SCATPointerPointPicker *)self lastDwellStartPoint];
      if (vabdd_f64(y, v12) < v10) {
        return 1;
      }
    }
  }
  return result;
}

- (void)_startDwellTimer
{
  if ([(SCATPointerPointPicker *)self dwellSwitchAssigned])
  {
    BOOL v3 = [(SCATPointerPointPicker *)self controlViewController];
    [v3 currentPoint];
    double v5 = v4;
    double v7 = v6;

    if (!-[SCATPointerPointPicker _isWithinLastDwellBounds:](self, "_isWithinLastDwellBounds:", v5, v7))
    {
      [(SCATPointerPointPicker *)self cancelDwellTimer];
      -[SCATPointerPointPicker setLastDwellStartPoint:](self, "setLastDwellStartPoint:", v5, v7);
      id v8 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
      [(SCATPointerPointPicker *)self setDwellTimer:v8];

      double v9 = [(SCATPointerPointPicker *)self dwellTimer];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000B6A3C;
      v11[3] = &unk_1001AAA90;
      v11[4] = self;
      [v9 afterDelay:v11 processBlock:0 cancelBlock:0.25];
    }
  }
  else
  {
    double v10 = ASTLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10011568C(v10);
    }
  }
}

- (void)cancelDwellTimer
{
  -[SCATPointerPointPicker setLastDwellStartPoint:](self, "setLastDwellStartPoint:", -1.0, -1.0);
  BOOL v3 = [(SCATPointerPointPicker *)self dwellTimer];
  [v3 cancel];

  AXPerformBlockOnMainThread();
}

- (BOOL)dwellSwitchAssigned
{
  return self->_dwellSwitchAssigned;
}

- (CGPoint)delayedPickedPoint
{
  double x = self->_delayedPickedPoint.x;
  double y = self->_delayedPickedPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDelayedPickedPoint:(CGPoint)a3
{
  self->_delayedPickedPoint = a3;
}

- (CGPoint)lastDwellStartPoint
{
  double x = self->_lastDwellStartPoint.x;
  double y = self->_lastDwellStartPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastDwellStartPoint:(CGPoint)a3
{
  self->_lastDwellStartPoint = a3;
}

- (NSMutableArray)historyOfPoints
{
  return self->_historyOfPoints;
}

- (void)setHistoryOfPoints:(id)a3
{
}

- (NSMutableArray)historyOfTimestamps
{
  return self->_historyOfTimestamps;
}

- (void)setHistoryOfTimestamps:(id)a3
{
}

- (AXDispatchTimer)dwellTimer
{
  return self->_dwellTimer;
}

- (void)setDwellTimer:(id)a3
{
}

- (double)cachedToleranceRadius
{
  return self->_cachedToleranceRadius;
}

- (void)setCachedToleranceRadius:(double)a3
{
  self->_cachedToleranceRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dwellTimer, 0);
  objc_storeStrong((id *)&self->_historyOfTimestamps, 0);

  objc_storeStrong((id *)&self->_historyOfPoints, 0);
}

@end