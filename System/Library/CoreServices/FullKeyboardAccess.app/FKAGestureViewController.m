@interface FKAGestureViewController
- (AXPIFingerController)fingerController;
- (BOOL)_canShowWhileLocked;
- (BOOL)isPerformingGesture;
- (CGPoint)_convertedPointToGestureView:(CGPoint)a3;
- (FKAGestureViewController)initWithDisplayUUID:(id)a3;
- (FKAIncrementalGestureState)incrementalGestureState;
- (id)_fingerModelsForFingerControllerPoint:(CGPoint)a3 numberOfFingers:(unint64_t)a4;
- (void)_beginPinchOrRotateFromPoint:(CGPoint)a3 type:(int64_t)a4 pinchGestureSpeed:(double)a5 angleUpdateMultiplier:(double)a6;
- (void)_cancelGestureIfNecessary;
- (void)_cleanUpExistingIncrementalGesture;
- (void)begin3DTouchAtPoint:(CGPoint)a3;
- (void)beginPinchInFromPoint:(CGPoint)a3;
- (void)beginPinchOutFromPoint:(CGPoint)a3;
- (void)beginRotateLeftFromPoint:(CGPoint)a3;
- (void)beginRotateRightFromPoint:(CGPoint)a3;
- (void)beginSwipeFromPoint:(CGPoint)a3 inDirection:(int64_t)a4 numberOfFingers:(unint64_t)a5;
- (void)endIncrementalGesture;
- (void)lift;
- (void)loadView;
- (void)pressAtPoint:(CGPoint)a3 numberOfFingers:(unint64_t)a4;
- (void)setFingerController:(id)a3;
- (void)setIncrementalGestureState:(id)a3;
- (void)tapAtPoint:(CGPoint)a3;
@end

@implementation FKAGestureViewController

- (FKAGestureViewController)initWithDisplayUUID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FKAGestureViewController;
  v5 = [(FKAGestureViewController *)&v9 init];
  if (v5)
  {
    v6 = (AXPIFingerController *)[objc_alloc((Class)AXPIFingerController) initWithDisplayUUID:v4];
    fingerController = v5->_fingerController;
    v5->_fingerController = v6;
  }
  return v5;
}

- (void)loadView
{
  v3 = [(FKAGestureViewController *)self fingerController];
  id v4 = [v3 fingerContainerView];
  [(FKAGestureViewController *)self setView:v4];

  id v5 = [(FKAGestureViewController *)self view];
  [v5 setAlpha:0.0];
}

- (BOOL)isPerformingGesture
{
  v3 = [(FKAGestureViewController *)self fingerController];
  id v4 = [v3 fingerModels];
  if ([v4 count])
  {
    id v5 = [(FKAGestureViewController *)self fingerController];
    v6 = [v5 fingerModels];
    v7 = [v6 firstObject];
    unsigned __int8 v8 = [v7 isPressed];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)_fingerModelsForFingerControllerPoint:(CGPoint)a3 numberOfFingers:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  v7 = [(FKAGestureViewController *)self view];
  [v7 bounds];
  v12 = +[AXPIFingerUtilities defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:](AXPIFingerUtilities, "defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:", a4, x, y, v8, v9, v10, v11);
  v13 = +[AXPIFingerUtilities fingerModelsForPointStrings:v12];

  return v13;
}

- (void)_cancelGestureIfNecessary
{
  v3 = [(FKAGestureViewController *)self fingerController];
  unsigned int v4 = [v3 isPerformingGesture];

  if (v4)
  {
    id v5 = FKALogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Cancel current gesture", v7, 2u);
    }

    v6 = [(FKAGestureViewController *)self fingerController];
    [v6 cancelGesture];
  }
  [(FKAGestureViewController *)self _cleanUpExistingIncrementalGesture];
}

- (void)pressAtPoint:(CGPoint)a3 numberOfFingers:(unint64_t)a4
{
  double y = CGPointZero.y;
  if (a3.x != CGPointZero.x || a3.y != y)
  {
    double v7 = a3.y;
    double x = a3.x;
    [(FKAGestureViewController *)self _cancelGestureIfNecessary];
    double v10 = FKALogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v24.double x = x;
      v24.double y = v7;
      double v11 = NSStringFromCGPoint(v24);
      int v20 = 138412546;
      v21 = v11;
      __int16 v22 = 2048;
      unint64_t v23 = a4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Press at %@ with %lu finger(s)", (uint8_t *)&v20, 0x16u);
    }
    v12 = [(FKAGestureViewController *)self view];
    [v12 setAlpha:1.0];

    -[FKAGestureViewController _convertedPointToGestureView:](self, "_convertedPointToGestureView:", x, v7);
    double v14 = v13;
    double v16 = v15;
    v17 = [(FKAGestureViewController *)self fingerController];
    v18 = -[FKAGestureViewController _fingerModelsForFingerControllerPoint:numberOfFingers:](self, "_fingerModelsForFingerControllerPoint:numberOfFingers:", a4, v14, v16);
    objc_msgSend(v17, "showFingerModels:animated:startPointForAnimation:", v18, 0, CGPointZero.x, y);

    v19 = [(FKAGestureViewController *)self fingerController];
    [v19 pressFingersDownAnimated:0];
  }
}

- (void)lift
{
  v3 = FKALogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Lift fingers", v6, 2u);
  }

  unsigned int v4 = [(FKAGestureViewController *)self fingerController];
  [v4 liftFingersUpAnimated:0];

  id v5 = [(FKAGestureViewController *)self fingerController];
  objc_msgSend(v5, "clearAllFingersAnimated:endPointForAnimation:", 1, CGPointZero.x, CGPointZero.y);
}

- (void)tapAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != CGPointZero.x || a3.y != CGPointZero.y)
  {
    [(FKAGestureViewController *)self _cancelGestureIfNecessary];
    double v7 = FKALogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v18.double x = x;
      v18.double y = y;
      double v8 = NSStringFromCGPoint(v18);
      int v16 = 138412290;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Tap at %@", (uint8_t *)&v16, 0xCu);
    }
    double v9 = [(FKAGestureViewController *)self view];
    [v9 setAlpha:0.0];

    -[FKAGestureViewController _convertedPointToGestureView:](self, "_convertedPointToGestureView:", x, y);
    double v11 = v10;
    double v13 = v12;
    double v14 = [(FKAGestureViewController *)self fingerController];
    double v15 = +[AXNamedReplayableGesture tapGestureAtPoint:](AXNamedReplayableGesture, "tapGestureAtPoint:", v11, v13);
    [v14 performGesture:v15];
  }
}

- (void)_cleanUpExistingIncrementalGesture
{
  v3 = [(FKAGestureViewController *)self incrementalGestureState];
  if (v3)
  {
    unsigned int v4 = FKALogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clean up existing incremental gesture", v13, 2u);
    }

    id v5 = [(FKAGestureViewController *)self fingerController];
    [v5 liftFingersUpAnimated:0];

    v6 = [(FKAGestureViewController *)self fingerController];
    objc_msgSend(v6, "clearAllFingersAnimated:endPointForAnimation:", 1, CGPointZero.x, CGPointZero.y);

    double v7 = [v3 startGestureTimer];
    unsigned int v8 = [v7 isValid];

    if (v8)
    {
      double v9 = [v3 startGestureTimer];
      [v9 invalidate];
    }
    double v10 = [v3 gestureUpdateTimer];
    unsigned int v11 = [v10 isValid];

    if (v11)
    {
      double v12 = [v3 gestureUpdateTimer];
      [v12 invalidate];
    }
    [(FKAGestureViewController *)self setIncrementalGestureState:0];
  }
}

- (void)beginSwipeFromPoint:(CGPoint)a3 inDirection:(int64_t)a4 numberOfFingers:(unint64_t)a5
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != CGPointZero.x || a3.y != CGPointZero.y)
  {
    [(FKAGestureViewController *)self _cancelGestureIfNecessary];
    unsigned int v11 = FKALogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v39.double x = x;
      v39.double y = y;
      uint64_t v12 = NSStringFromCGPoint(v39);
      double v13 = (void *)v12;
      if ((unint64_t)(a4 - 1) > 2) {
        CFStringRef v14 = @"left";
      }
      else {
        CFStringRef v14 = off_100024730[a4 - 1];
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v34 = v12;
      __int16 v35 = 2112;
      CFStringRef v36 = v14;
      __int16 v37 = 2048;
      unint64_t v38 = a5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Begin swipe from %@ %@ with %lu finger(s)", buf, 0x20u);
    }
    double v15 = [(FKAGestureViewController *)self view];
    [v15 setAlpha:1.0];

    int v16 = objc_opt_new();
    -[FKAGestureViewController _convertedPointToGestureView:](self, "_convertedPointToGestureView:", x, y);
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    objc_msgSend(v16, "setStartFingerControllerPoint:");
    [v16 setDirection:a4];
    [v16 setNumberOfFingers:a5];
    unint64_t v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_100002888;
    v26 = &unk_1000246A0;
    id v27 = v16;
    v28 = self;
    uint64_t v29 = v18;
    uint64_t v30 = v20;
    unint64_t v31 = a5;
    int64_t v32 = a4;
    id v21 = v16;
    __int16 v22 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v23 block:0.3];
    objc_msgSend(v21, "setStartGestureTimer:", v22, v23, v24, v25, v26);

    [(FKAGestureViewController *)self setIncrementalGestureState:v21];
  }
}

- (void)beginPinchOutFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = FKALogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10.double x = x;
    v10.double y = y;
    double v7 = NSStringFromCGPoint(v10);
    int v8 = 138412290;
    double v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Begin pinch out from %@", (uint8_t *)&v8, 0xCu);
  }
  -[FKAGestureViewController _beginPinchOrRotateFromPoint:type:pinchGestureSpeed:angleUpdateMultiplier:](self, "_beginPinchOrRotateFromPoint:type:pinchGestureSpeed:angleUpdateMultiplier:", 0, x, y, 30.0, 0.0);
}

- (void)beginPinchInFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = FKALogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10.double x = x;
    v10.double y = y;
    double v7 = NSStringFromCGPoint(v10);
    int v8 = 138412290;
    double v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Begin pinch in from %@", (uint8_t *)&v8, 0xCu);
  }
  -[FKAGestureViewController _beginPinchOrRotateFromPoint:type:pinchGestureSpeed:angleUpdateMultiplier:](self, "_beginPinchOrRotateFromPoint:type:pinchGestureSpeed:angleUpdateMultiplier:", 1, x, y, -20.0, 0.0);
}

- (void)beginRotateLeftFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = FKALogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10.double x = x;
    v10.double y = y;
    double v7 = NSStringFromCGPoint(v10);
    int v8 = 138412290;
    double v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Begin rotate left from %@", (uint8_t *)&v8, 0xCu);
  }
  -[FKAGestureViewController _beginPinchOrRotateFromPoint:type:pinchGestureSpeed:angleUpdateMultiplier:](self, "_beginPinchOrRotateFromPoint:type:pinchGestureSpeed:angleUpdateMultiplier:", 2, x, y, 0.0, -1.0);
}

- (void)beginRotateRightFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = FKALogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10.double x = x;
    v10.double y = y;
    double v7 = NSStringFromCGPoint(v10);
    int v8 = 138412290;
    double v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Begin rotate right from %@", (uint8_t *)&v8, 0xCu);
  }
  -[FKAGestureViewController _beginPinchOrRotateFromPoint:type:pinchGestureSpeed:angleUpdateMultiplier:](self, "_beginPinchOrRotateFromPoint:type:pinchGestureSpeed:angleUpdateMultiplier:", 3, x, y, 0.0, 1.0);
}

- (void)_beginPinchOrRotateFromPoint:(CGPoint)a3 type:(int64_t)a4 pinchGestureSpeed:(double)a5 angleUpdateMultiplier:(double)a6
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != CGPointZero.x || a3.y != CGPointZero.y)
  {
    [(FKAGestureViewController *)self _cancelGestureIfNecessary];
    double v13 = FKALogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Begin pinch/rotate", buf, 2u);
    }

    CFStringRef v14 = [(FKAGestureViewController *)self view];
    [v14 setAlpha:1.0];

    double v15 = objc_opt_new();
    -[FKAGestureViewController _convertedPointToGestureView:](self, "_convertedPointToGestureView:", x, y);
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    objc_msgSend(v15, "setStartFingerControllerPoint:");
    [v15 setType:a4];
    __int16 v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    uint64_t v24 = sub_10000328C;
    v25 = &unk_1000246A0;
    uint64_t v28 = v17;
    uint64_t v29 = v19;
    id v26 = v15;
    id v27 = self;
    double v30 = a5;
    double v31 = a6;
    id v20 = v15;
    id v21 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v22 block:0.3];
    objc_msgSend(v20, "setStartGestureTimer:", v21, v22, v23, v24, v25);

    [(FKAGestureViewController *)self setIncrementalGestureState:v20];
  }
}

- (void)begin3DTouchAtPoint:(CGPoint)a3
{
  double y = CGPointZero.y;
  if (a3.x != CGPointZero.x || a3.y != y)
  {
    double v5 = a3.y;
    double x = a3.x;
    [(FKAGestureViewController *)self _cancelGestureIfNecessary];
    int v8 = FKALogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v30.double x = x;
      v30.double y = v5;
      double v9 = NSStringFromCGPoint(v30);
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Begin 3D Touch from %@", buf, 0xCu);
    }
    CGPoint v10 = [(FKAGestureViewController *)self view];
    [v10 setAlpha:1.0];

    unsigned int v11 = objc_opt_new();
    -[FKAGestureViewController _convertedPointToGestureView:](self, "_convertedPointToGestureView:", x, v5);
    double v13 = v12;
    double v15 = v14;
    objc_msgSend(v11, "setStartFingerControllerPoint:");
    uint64_t v16 = +[NSDate date];
    [v11 setGestureStartTime:v16];

    uint64_t v17 = [(FKAGestureViewController *)self fingerController];
    uint64_t v18 = -[FKAGestureViewController _fingerModelsForFingerControllerPoint:numberOfFingers:](self, "_fingerModelsForFingerControllerPoint:numberOfFingers:", 1, v13, v15);
    objc_msgSend(v17, "showFingerModels:animated:startPointForAnimation:", v18, 0, CGPointZero.x, y);

    uint64_t v19 = [(FKAGestureViewController *)self fingerController];
    [v19 pressFingersDownAnimated:0];

    AXForceTouchThreshold();
    double v20 = AXForceTouchUpdateInterval;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000038D4;
    v24[3] = &unk_100024710;
    id v25 = v11;
    id v26 = self;
    uint64_t v27 = v21;
    id v22 = v11;
    uint64_t v23 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v24 block:v20];
    [v22 setGestureUpdateTimer:v23];

    [(FKAGestureViewController *)self setIncrementalGestureState:v22];
  }
}

- (void)endIncrementalGesture
{
  v3 = [(FKAGestureViewController *)self incrementalGestureState];
  unsigned int v4 = FKALogCommon();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "End incremental gesture", (uint8_t *)&v24, 2u);
    }

    v6 = [v3 gestureStartTime];
    if (v6)
    {

      [(FKAGestureViewController *)self _cleanUpExistingIncrementalGesture];
    }
    else
    {
      if ([v3 isSwipe])
      {
        [(FKAGestureViewController *)self _cleanUpExistingIncrementalGesture];
      }
      else
      {
        unsigned __int8 v7 = [v3 isPinchOrRotate];
        [(FKAGestureViewController *)self _cleanUpExistingIncrementalGesture];
        if ((v7 & 1) == 0) {
          goto LABEL_29;
        }
      }
      int v8 = FKALogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        unsigned int v9 = [v3 isSwipe];
        CFStringRef v10 = @"pinch/rotate";
        if (v9) {
          CFStringRef v10 = @"swipe";
        }
        int v24 = 138412290;
        CFStringRef v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Performing a fast %@ because the incremental version never started.", (uint8_t *)&v24, 0xCu);
      }

      if ([v3 isSwipe])
      {
        id v11 = v3;
        [v11 startFingerControllerPoint];
        double v13 = v12;
        double v15 = v14;
        unint64_t v16 = (unint64_t)[v11 direction] - 1;
        if (v16 > 2) {
          double v17 = -3.14159265;
        }
        else {
          double v17 = dbl_100022310[v16];
        }
        id v21 = [v11 numberOfFingers];

        id v22 = +[AXNamedReplayableGesture flickGestureAtPoint:angle:numberOfFingers:](AXNamedReplayableGesture, "flickGestureAtPoint:angle:numberOfFingers:", v21, v13, v15, v17);
      }
      else
      {
        id v18 = v3;
        uint64_t v19 = [(FKAGestureViewController *)self view];
        [v19 bounds];

        switch((unint64_t)[v18 type])
        {
          case 0uLL:
            [v18 startFingerControllerPoint];
            uint64_t v20 = +[AXNamedReplayableGesture pinchOutGestureWithPoint:bounds:](AXNamedReplayableGesture, "pinchOutGestureWithPoint:bounds:");
            goto LABEL_26;
          case 1uLL:
            [v18 startFingerControllerPoint];
            uint64_t v20 = +[AXNamedReplayableGesture pinchInGestureWithPoint:bounds:](AXNamedReplayableGesture, "pinchInGestureWithPoint:bounds:");
            goto LABEL_26;
          case 2uLL:
            [v18 startFingerControllerPoint];
            uint64_t v20 = +[AXNamedReplayableGesture rotateLeftGestureWithPoint:bounds:](AXNamedReplayableGesture, "rotateLeftGestureWithPoint:bounds:");
            goto LABEL_26;
          case 3uLL:
            [v18 startFingerControllerPoint];
            uint64_t v20 = +[AXNamedReplayableGesture rotateRightGestureWithPoint:bounds:](AXNamedReplayableGesture, "rotateRightGestureWithPoint:bounds:");
LABEL_26:
            id v22 = (void *)v20;
            break;
          default:
            id v22 = 0;
            break;
        }
      }
      uint64_t v23 = [(FKAGestureViewController *)self fingerController];
      [v23 performGesture:v22];
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Attempted to end incremental gesture, but none in progress", (uint8_t *)&v24, 2u);
    }
  }
LABEL_29:
}

- (CGPoint)_convertedPointToGestureView:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(FKAGestureViewController *)self view];
  unsigned __int8 v7 = [v6 window];
  int v8 = [v7 screen];
  unsigned int v9 = [v8 fixedCoordinateSpace];
  CFStringRef v10 = [(FKAGestureViewController *)self view];
  objc_msgSend(v9, "convertPoint:toCoordinateSpace:", v10, x, y);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (AXPIFingerController)fingerController
{
  return self->_fingerController;
}

- (void)setFingerController:(id)a3
{
}

- (FKAIncrementalGestureState)incrementalGestureState
{
  return self->_incrementalGestureState;
}

- (void)setIncrementalGestureState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incrementalGestureState, 0);

  objc_storeStrong((id *)&self->_fingerController, 0);
}

@end