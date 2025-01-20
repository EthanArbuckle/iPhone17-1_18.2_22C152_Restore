@interface SCATGestureDrawingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isPerformingMove;
- (BOOL)allowsDwellSelection;
- (BOOL)areFingersPressed;
- (BOOL)isCurving;
- (BOOL)isRotating;
- (BOOL)liftsOnMoveEnd;
- (BOOL)pressesOnMoveStart;
- (CGPoint)_fingerCenter;
- (NSArray)fingerPositions;
- (NSTimer)generalTimer;
- (NSTimer)moveTimer;
- (SCATGestureDrawingViewController)init;
- (SCATGestureDrawingViewController)initWithElementManager:(id)a3 startingFingerPositions:(id)a4 menu:(id)a5;
- (SCATGestureDrawingViewDelegate)delegate;
- (double)_previewDistance;
- (double)angle;
- (double)curvature;
- (double)velocity;
- (id)_currentElementProvider;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)lastElementWithOptions:(int *)a3;
- (void)_adjustCurvatureWithDirection:(double)a3;
- (void)_cancelMoveTimerAndEndMove:(BOOL)a3;
- (void)_cleanUp;
- (void)_curveOnLeft:(BOOL)a3 withCurveRadius:(double)a4;
- (void)_decreaseCurvature;
- (void)_endGeneralTimer;
- (void)_endMovementAndForceLift:(BOOL)a3;
- (void)_increaseCurvature;
- (void)_installStopButtonForActionName:(id)a3;
- (void)_move;
- (void)_moveStraight;
- (void)_pushFreehandSheetOfClass:(Class)a3;
- (void)_rotateClockwise;
- (void)_rotateCounterclockwise;
- (void)_startGeneralTimerWithSelector:(SEL)a3 actionName:(id)a4;
- (void)_uninstallStopButton;
- (void)_updateMainViewToolbarFrame;
- (void)autoLiftToggledForFreehandSheet:(id)a3;
- (void)autoPressToggledForFreehandSheet:(id)a3;
- (void)bendForFreehandSheet:(id)a3;
- (void)bendLeftForFreehandSheet:(id)a3;
- (void)bendRightForFreehandSheet:(id)a3;
- (void)dealloc;
- (void)decreaseVelocityForFreehandSheet:(id)a3;
- (void)didPopFreehandSheet:(id)a3;
- (void)freehandSheet:(id)a3 didHighlightBend:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightBendLeft:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightBendRight:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightMove:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightRotate:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightRotateCCW90:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightRotateCCW:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightRotateCW90:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightRotateCW:(BOOL)a4;
- (void)freehandSheet:(id)a3 didHighlightStraighten:(BOOL)a4;
- (void)increaseVelocityForFreehandSheet:(id)a3;
- (void)loadView;
- (void)menuDidFinishTransition:(id)a3;
- (void)menuWillDisappear:(id)a3;
- (void)moveForFreehandSheet:(id)a3;
- (void)moveToolbarForFreehandSheet:(id)a3;
- (void)orientationDidChange:(id)a3;
- (void)rotate90ClockwiseForFreehandSheet:(id)a3;
- (void)rotate90CounterclockwiseForFreehandSheet:(id)a3;
- (void)rotateClockwiseForFreehandSheet:(id)a3;
- (void)rotateCounterclockwiseForFreehandSheet:(id)a3;
- (void)rotateForFreehandSheet:(id)a3;
- (void)scannerWillMakeManagerActive:(id)a3;
- (void)scannerWillMakeManagerActive:(id)a3 forDisplayID:(unsigned int)a4;
- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4;
- (void)setAngle:(double)a3;
- (void)setAreFingersPressed:(BOOL)a3;
- (void)setCurvature:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFingerPositions:(id)a3;
- (void)setGeneralTimer:(id)a3;
- (void)setIsCurving:(BOOL)a3;
- (void)setIsRotating:(BOOL)a3;
- (void)setLiftsOnMoveEnd:(BOOL)a3;
- (void)setMoveTimer:(id)a3;
- (void)setPressesOnMoveStart:(BOOL)a3;
- (void)setVelocity:(double)a3;
- (void)stopForFreehandSheet:(id)a3;
- (void)straightenForFreehandSheet:(id)a3;
- (void)toggleTouchForFreehandSheet:(id)a3;
- (void)viewDidLoad;
@end

@implementation SCATGestureDrawingViewController

- (SCATGestureDrawingViewController)init
{
  return 0;
}

- (SCATGestureDrawingViewController)initWithElementManager:(id)a3 startingFingerPositions:(id)a4 menu:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SCATGestureDrawingViewController;
  v10 = [(SCATElementManagerViewController *)&v24 initWithElementManager:a3];
  v11 = v10;
  if (v10)
  {
    [(SCATGestureDrawingViewController *)v10 setFingerPositions:v8];
    v12 = +[HNDDefaults sharedDefaults];
    v13 = [v12 preferenceForKey:@"DrawingAngle"];
    v14 = [v12 preferenceForKey:@"DrawingVelocity"];
    v15 = [v12 preferenceForKey:@"DrawingCurvature"];
    v16 = [v12 preferenceForKey:@"DrawingPressOnMove"];
    v17 = [v12 preferenceForKey:@"DrawingLiftOnMove"];
    if (v13) {
      [v13 doubleValue];
    }
    else {
      double v18 = -0.785398163;
    }
    [(SCATGestureDrawingViewController *)v11 setAngle:v18];
    if (v14) {
      [v14 doubleValue];
    }
    else {
      double v19 = 1.0;
    }
    [(SCATGestureDrawingViewController *)v11 setVelocity:v19];
    if (v15) {
      [v15 doubleValue];
    }
    else {
      double v20 = 0.0;
    }
    [(SCATGestureDrawingViewController *)v11 setCurvature:v20];
    if (v16) {
      uint64_t v21 = (uint64_t)[v16 BOOLValue];
    }
    else {
      uint64_t v21 = 1;
    }
    [(SCATGestureDrawingViewController *)v11 setPressesOnMoveStart:v21];
    if (v17) {
      uint64_t v22 = (uint64_t)[v17 BOOLValue];
    }
    else {
      uint64_t v22 = 1;
    }
    [(SCATGestureDrawingViewController *)v11 setLiftsOnMoveEnd:v22];
    objc_storeStrong((id *)&v11->_menu, a5);
    [(SCATMenu *)v11->_menu registerMenuObserver:v11];
  }
  return v11;
}

- (void)dealloc
{
  [(SCATMenu *)self->_menu unregisterMenuObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SCATGestureDrawingViewController;
  [(SCATGestureDrawingViewController *)&v3 dealloc];
}

- (void)_updateMainViewToolbarFrame
{
  id v12 = [(SCATMenu *)self->_menu menuVisualProvider];
  [v12 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SCATGestureDrawingViewController *)self mainView];
  objc_msgSend(v11, "setFrameForToolbar:", v4, v6, v8, v10);
}

- (void)orientationDidChange:(id)a3
{
}

- (void)loadView
{
  double v3 = objc_alloc_init(SCATGestureDrawingView);
  [(SCATGestureDrawingViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SCATGestureDrawingViewController;
  [(SCATElementManagerViewController *)&v5 viewDidLoad];
  double v3 = [(SCATGestureDrawingViewController *)self mainView];
  double v4 = [(SCATGestureDrawingViewController *)self fingerPositions];
  [v3 setFingerPositions:v4];

  [(SCATGestureDrawingViewController *)self angle];
  objc_msgSend(v3, "setAngle:");
  [(SCATGestureDrawingViewController *)self curvature];
  objc_msgSend(v3, "setCurvature:");
  [(SCATGestureDrawingViewController *)self _previewDistance];
  objc_msgSend(v3, "setPreviewDistance:");
}

- (void)_pushFreehandSheetOfClass:(Class)a3
{
  id v4 = [[a3 alloc] initWithMenu:self->_menu];
  [v4 setDelegate:self];
  [(SCATMenu *)self->_menu pushSheet:v4];
}

- (double)_previewDistance
{
  -[HNDHandManager screenFrame:]_0();
  double v4 = v3;
  -[HNDHandManager screenFrame:]_0();
  if (v4 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  double v7 = v6 * 0.5;
  double v8 = +[SCATStyleProvider sharedStyleProvider];
  [v8 arrowHeadTipOffset];
  double v10 = v7 - v9 + -5.0;

  [(SCATGestureDrawingViewController *)self velocity];
  return (log(v11) + 2.30258509) / 4.60517019 * (v10 + -50.0) + 50.0;
}

- (void)setVelocity:(double)a3
{
  if (self->_velocity != a3)
  {
    self->_velocity = a3;
    if ([(SCATGestureDrawingViewController *)self isViewLoaded])
    {
      [(SCATGestureDrawingViewController *)self _previewDistance];
      double v6 = v5;
      double v7 = [(SCATGestureDrawingViewController *)self mainView];
      [v7 setPreviewDistance:v6];
    }
    id v9 = +[HNDDefaults sharedDefaults];
    double v8 = +[NSNumber numberWithDouble:a3];
    [v9 setPreference:v8 forKey:@"DrawingVelocity"];
  }
}

- (void)setFingerPositions:(id)a3
{
  double v5 = (NSArray *)a3;
  if (self->_fingerPositions != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_fingerPositions, a3);
    if ([(SCATGestureDrawingViewController *)self isViewLoaded])
    {
      double v6 = [(SCATGestureDrawingViewController *)self mainView];
      [v6 setFingerPositions:v7];
    }
  }

  _objc_release_x2();
}

- (void)setAngle:(double)a3
{
  if (self->_angle != a3)
  {
    self->_angle = a3;
    if ([(SCATGestureDrawingViewController *)self isViewLoaded])
    {
      double v5 = [(SCATGestureDrawingViewController *)self mainView];
      [v5 setAngle:a3];
    }
    id v7 = +[HNDDefaults sharedDefaults];
    double v6 = +[NSNumber numberWithDouble:a3];
    [v7 setPreference:v6 forKey:@"DrawingAngle"];
  }
}

- (void)setCurvature:(double)a3
{
  if (self->_curvature != a3)
  {
    self->_curvature = a3;
    if ([(SCATGestureDrawingViewController *)self isViewLoaded])
    {
      double v5 = [(SCATGestureDrawingViewController *)self mainView];
      [v5 setCurvature:a3];
    }
    id v7 = +[HNDDefaults sharedDefaults];
    double v6 = +[NSNumber numberWithDouble:a3];
    [v7 setPreference:v6 forKey:@"DrawingCurvature"];
  }
}

- (void)setPressesOnMoveStart:(BOOL)a3
{
  if (self->_pressesOnMoveStart != a3)
  {
    BOOL v3 = a3;
    self->_pressesOnMoveStart = a3;
    id v5 = +[HNDDefaults sharedDefaults];
    double v4 = +[NSNumber numberWithBool:v3];
    [v5 setPreference:v4 forKey:@"DrawingPressOnMove"];
  }
}

- (void)setLiftsOnMoveEnd:(BOOL)a3
{
  if (self->_liftsOnMoveEnd != a3)
  {
    BOOL v3 = a3;
    self->_liftsOnMoveEnd = a3;
    id v5 = +[HNDDefaults sharedDefaults];
    double v4 = +[NSNumber numberWithBool:v3];
    [v5 setPreference:v4 forKey:@"DrawingLiftOnMove"];
  }
}

- (void)_installStopButtonForActionName:(id)a3
{
  id v4 = a3;
  double v8 = [(SCATModernMenuSheet *)[SCATModernMenuGestureFreehandStopSheet alloc] initWithMenu:self->_menu];
  [(SCATModernMenuGestureFreehandSheetBase *)v8 setDelegate:self];
  [(SCATModernMenuGestureFreehandStopSheet *)v8 setActionToStop:v4];

  [(SCATMenu *)self->_menu pushSheet:v8];
  id v5 = [(SCATGestureDrawingViewController *)self mainView];
  [v5 setShowsRotationControls:0];

  double v6 = [(SCATGestureDrawingViewController *)self mainView];
  [v6 setShowsRotation90Controls:0];

  id v7 = [(SCATGestureDrawingViewController *)self mainView];
  [v7 setShowsCurvatureControls:0];
}

- (void)_uninstallStopButton
{
  BOOL v3 = [(SCATGestureDrawingViewController *)self isRotating];
  id v4 = [(SCATGestureDrawingViewController *)self mainView];
  [v4 setShowsRotationControls:v3];

  BOOL v5 = [(SCATGestureDrawingViewController *)self isRotating];
  double v6 = [(SCATGestureDrawingViewController *)self mainView];
  [v6 setShowsRotation90Controls:v5];

  BOOL v7 = [(SCATGestureDrawingViewController *)self isCurving];
  id v8 = [(SCATGestureDrawingViewController *)self mainView];
  [v8 setShowsCurvatureControls:v7];
}

- (void)_startGeneralTimerWithSelector:(SEL)a3 actionName:(id)a4
{
  id v9 = a4;
  double v6 = +[AXSettings sharedInstance];
  double v7 = dbl_100197910[[v6 switchControlScanningStyle] == 0];

  id v8 = +[NSTimer scheduledTimerWithTimeInterval:self target:a3 selector:0 userInfo:1 repeats:v7];
  [(SCATGestureDrawingViewController *)self setGeneralTimer:v8];

  [(SCATGestureDrawingViewController *)self _installStopButtonForActionName:v9];
}

- (void)_endGeneralTimer
{
  BOOL v3 = [(SCATGestureDrawingViewController *)self generalTimer];
  [v3 invalidate];

  [(SCATGestureDrawingViewController *)self setGeneralTimer:0];

  [(SCATGestureDrawingViewController *)self _uninstallStopButton];
}

- (void)setAreFingersPressed:(BOOL)a3
{
  if (self->_areFingersPressed != a3)
  {
    BOOL v3 = a3;
    self->_areFingersPressed = a3;
    BOOL v5 = [(SCATGestureDrawingViewController *)self mainView];
    [v5 setFingersPressed:v3];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v7 = WeakRetained;
    if (v3) {
      [WeakRetained touchDownForDrawingViewController:self];
    }
    else {
      [WeakRetained touchUpForDrawingViewController:self];
    }
  }
}

- (void)_rotateClockwise
{
  [(SCATGestureDrawingViewController *)self angle];
  double v4 = v3 + 0.00436332313;

  [(SCATGestureDrawingViewController *)self setAngle:v4];
}

- (void)_rotateCounterclockwise
{
  [(SCATGestureDrawingViewController *)self angle];
  double v4 = v3 + -0.00436332313;

  [(SCATGestureDrawingViewController *)self setAngle:v4];
}

- (void)_adjustCurvatureWithDirection:(double)a3
{
  [(SCATGestureDrawingViewController *)self curvature];
  double v6 = fabs(v5) * 0.01;
  if (v6 < 0.0001) {
    double v6 = 0.0001;
  }
  double v7 = v6 * a3;
  [(SCATGestureDrawingViewController *)self curvature];
  [(SCATGestureDrawingViewController *)self setCurvature:v8 + v7];
  [(SCATGestureDrawingViewController *)self curvature];
  if (v9 <= 0.0) {
    double v10 = -1.0;
  }
  else {
    double v10 = 1.0;
  }
  [(SCATGestureDrawingViewController *)self curvature];
  if (v11 * v10 > 0.2)
  {
    [(SCATGestureDrawingViewController *)self setCurvature:v10 * 0.2];
  }
}

- (void)_increaseCurvature
{
}

- (void)_decreaseCurvature
{
}

- (BOOL)_isPerformingMove
{
  v2 = [(SCATGestureDrawingViewController *)self moveTimer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_cancelMoveTimerAndEndMove:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(SCATGestureDrawingViewController *)self moveTimer];
  [v5 invalidate];

  if (v3)
  {
    [(SCATGestureDrawingViewController *)self setMoveTimer:0];
    id v6 = [(SCATGestureDrawingViewController *)self mainView];
    [v6 setFingersHighlighted:0];
  }
}

- (void)_endMovementAndForceLift:(BOOL)a3
{
  BOOL v3 = a3;
  [(SCATGestureDrawingViewController *)self _cancelMoveTimerAndEndMove:1];
  if (([(SCATGestureDrawingViewController *)self liftsOnMoveEnd] || v3)
    && [(SCATGestureDrawingViewController *)self areFingersPressed])
  {
    [(SCATGestureDrawingViewController *)self setAreFingersPressed:0];
  }

  [(SCATGestureDrawingViewController *)self _uninstallStopButton];
}

- (CGPoint)_fingerCenter
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(SCATGestureDrawingViewController *)self fingerPositions];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    CGFloat v10 = CGSizeZero.height;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        CGPoint v12 = CGPointFromString((NSString *)*(void *)(*((void *)&v15 + 1) + 8 * (void)v11));
        v23.origin.CGFloat x = v12.x;
        v23.origin.CGFloat y = v12.y;
        v21.origin.CGFloat x = x;
        v21.origin.CGFloat y = y;
        v21.size.CGFloat width = width;
        v21.size.CGFloat height = height;
        v23.size.CGFloat width = CGSizeZero.width;
        v23.size.CGFloat height = v10;
        CGRect v22 = CGRectUnion(v21, v23);
        CGFloat x = v22.origin.x;
        CGFloat y = v22.origin.y;
        CGFloat width = v22.size.width;
        CGFloat height = v22.size.height;
        double v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  AX_CGRectGetCenter();
  result.CGFloat y = v14;
  result.CGFloat x = v13;
  return result;
}

- (void)_moveStraight
{
  BOOL v3 = [(SCATGestureDrawingViewController *)self fingerPositions];
  double v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  [(SCATGestureDrawingViewController *)self velocity];
  double v6 = v5;
  [(SCATGestureDrawingViewController *)self angle];
  double v8 = cos(v7);
  [(SCATGestureDrawingViewController *)self velocity];
  double v10 = v9;
  [(SCATGestureDrawingViewController *)self angle];
  double v12 = sin(v11);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v13 = [(SCATGestureDrawingViewController *)self fingerPositions];
  id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    double v16 = v6 * v8;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v13);
        }
        CGPoint v19 = CGPointFromString((NSString *)*(void *)(*((void *)&v23 + 1) + 8 * i));
        v28.CGFloat x = v16 + v19.x;
        v28.CGFloat y = v10 * v12 + v19.y;
        double v20 = NSStringFromCGPoint(v28);
        [v4 addObject:v20];
      }
      id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v22 = [WeakRetained drawingViewController:self moveFingersToPoints:v4];

  if (v22) {
    [(SCATGestureDrawingViewController *)self setFingerPositions:v4];
  }
  else {
    [(SCATGestureDrawingViewController *)self _cancelMoveTimerAndEndMove:0];
  }
}

- (void)_curveOnLeft:(BOOL)a3 withCurveRadius:(double)a4
{
  BOOL v5 = a3;
  long double v7 = [(SCATGestureDrawingViewController *)self fingerPositions];
  double v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);

  [(SCATGestureDrawingViewController *)self _fingerCenter];
  double v10 = v9;
  double v12 = v11;
  double v33 = 0.0;
  CGPoint v32 = CGPointZero;
  [(SCATGestureDrawingViewController *)self angle];
  double v14 = v13;
  [(SCATGestureDrawingViewController *)self velocity];
  +[SCATGestureArrowView getCurveArcCenter:startAngle:endAngle:updatedFingerAngle:updatedFingerCenter:withFingerAngle:fingerCenter:curveRadius:distanceToMove:onLeft:](SCATGestureArrowView, "getCurveArcCenter:startAngle:endAngle:updatedFingerAngle:updatedFingerCenter:withFingerAngle:fingerCenter:curveRadius:distanceToMove:onLeft:", 0, 0, 0, &v33, &v32, v5, v14, v10, v12, a4, v15);
  CGPoint v16 = v32;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v17 = [(SCATGestureDrawingViewController *)self fingerPositions];
  id v18 = [v17 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v18)
  {
    id v19 = v18;
    double v20 = v16.x - v10;
    double v21 = v16.y - v12;
    uint64_t v22 = *(void *)v29;
    do
    {
      long long v23 = 0;
      do
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v17);
        }
        CGPoint v24 = CGPointFromString((NSString *)*(void *)(*((void *)&v28 + 1) + 8 * (void)v23));
        v35.CGFloat x = v20 + v24.x;
        v35.CGFloat y = v21 + v24.y;
        long long v25 = NSStringFromCGPoint(v35);
        [v8 addObject:v25];

        long long v23 = (char *)v23 + 1;
      }
      while (v19 != v23);
      id v19 = [v17 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v19);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v27 = [WeakRetained drawingViewController:self moveFingersToPoints:v8];

  if (v27)
  {
    [(SCATGestureDrawingViewController *)self setFingerPositions:v8];
    [(SCATGestureDrawingViewController *)self setAngle:v33];
  }
  else
  {
    [(SCATGestureDrawingViewController *)self _cancelMoveTimerAndEndMove:0];
  }
}

- (void)_move
{
  [(SCATGestureDrawingViewController *)self curvature];
  if (v4 == 0.0)
  {
    [(SCATGestureDrawingViewController *)self _moveStraight];
  }
  else
  {
    [(SCATGestureDrawingViewController *)self curvature];
    BOOL v6 = v5 < 0.0;
    [(SCATGestureDrawingViewController *)self curvature];
    double v8 = fabs(1.0 / v7);
    [(SCATGestureDrawingViewController *)self _curveOnLeft:v6 withCurveRadius:v8];
  }
}

- (void)_cleanUp
{
  if ([(SCATGestureDrawingViewController *)self _isPerformingMove])
  {
    [(SCATGestureDrawingViewController *)self _endMovementAndForceLift:1];
  }
  else
  {
    [(SCATGestureDrawingViewController *)self _endGeneralTimer];
    if ([(SCATGestureDrawingViewController *)self areFingersPressed])
    {
      [(SCATGestureDrawingViewController *)self setAreFingersPressed:0];
    }
  }
}

- (void)didPopFreehandSheet:(id)a3
{
  if ([(SCATGestureDrawingViewController *)self isRotating])
  {
    [(SCATGestureDrawingViewController *)self setIsRotating:0];
    double v4 = [(SCATGestureDrawingViewController *)self mainView];
    [v4 setShowsRotationControls:0];

    id v5 = [(SCATGestureDrawingViewController *)self mainView];
    [v5 setShowsRotation90Controls:0];
  }
  else
  {
    if (![(SCATGestureDrawingViewController *)self isCurving]) {
      return;
    }
    [(SCATGestureDrawingViewController *)self setIsCurving:0];
    id v5 = [(SCATGestureDrawingViewController *)self mainView];
    [v5 setShowsCurvatureControls:0];
  }
}

- (void)freehandSheet:(id)a3 didHighlightMove:(BOOL)a4
{
  BOOL v5 = a4 || [(SCATGestureDrawingViewController *)self _isPerformingMove];
  id v6 = [(SCATGestureDrawingViewController *)self mainView];
  [v6 setFingersHighlighted:v5];
}

- (void)freehandSheet:(id)a3 didHighlightRotate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = a4 || [(SCATGestureDrawingViewController *)self isRotating];
  double v7 = [(SCATGestureDrawingViewController *)self mainView];
  [v7 setShowsRotationControls:v6];

  double v8 = [(SCATGestureDrawingViewController *)self mainView];
  double v9 = [v8 rotateClockwiseControl];
  [v9 setHighlighted:v4];

  id v11 = [(SCATGestureDrawingViewController *)self mainView];
  double v10 = [v11 rotateCounterclockwiseControl];
  [v10 setHighlighted:v4];
}

- (void)freehandSheet:(id)a3 didHighlightBend:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = a4 || [(SCATGestureDrawingViewController *)self isCurving];
  double v7 = [(SCATGestureDrawingViewController *)self mainView];
  [v7 setShowsCurvatureControls:v6];

  double v8 = [(SCATGestureDrawingViewController *)self mainView];
  double v9 = [v8 decreaseCurveControl];
  [v9 setHighlighted:v4];

  double v10 = [(SCATGestureDrawingViewController *)self mainView];
  id v11 = [v10 increaseCurveControl];
  [v11 setHighlighted:v4];

  id v13 = [(SCATGestureDrawingViewController *)self mainView];
  double v12 = [v13 straightenCurveControl];
  [v12 setHighlighted:v4];
}

- (void)freehandSheet:(id)a3 didHighlightRotateCCW:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SCATGestureDrawingViewController *)self mainView];
  BOOL v5 = [v6 rotateCounterclockwiseControl];
  [v5 setHighlighted:v4];
}

- (void)freehandSheet:(id)a3 didHighlightRotateCW:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SCATGestureDrawingViewController *)self mainView];
  BOOL v5 = [v6 rotateClockwiseControl];
  [v5 setHighlighted:v4];
}

- (void)freehandSheet:(id)a3 didHighlightRotateCCW90:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SCATGestureDrawingViewController *)self mainView];
  double v7 = [v6 rotateCounterclockwiseControl];
  [v7 setHighlighted:v4];

  id v9 = [(SCATGestureDrawingViewController *)self mainView];
  double v8 = [v9 rotate90CounterclockwiseButton];
  [v8 setHighlighted:v4];
}

- (void)freehandSheet:(id)a3 didHighlightRotateCW90:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SCATGestureDrawingViewController *)self mainView];
  double v7 = [v6 rotateClockwiseControl];
  [v7 setHighlighted:v4];

  id v9 = [(SCATGestureDrawingViewController *)self mainView];
  double v8 = [v9 rotate90ClockwiseButton];
  [v8 setHighlighted:v4];
}

- (void)freehandSheet:(id)a3 didHighlightBendRight:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SCATGestureDrawingViewController *)self mainView];
  BOOL v5 = [v6 increaseCurveControl];
  [v5 setHighlighted:v4];
}

- (void)freehandSheet:(id)a3 didHighlightBendLeft:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SCATGestureDrawingViewController *)self mainView];
  BOOL v5 = [v6 decreaseCurveControl];
  [v5 setHighlighted:v4];
}

- (void)freehandSheet:(id)a3 didHighlightStraighten:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SCATGestureDrawingViewController *)self mainView];
  BOOL v5 = [v6 straightenCurveControl];
  [v5 setHighlighted:v4];
}

- (void)moveToolbarForFreehandSheet:(id)a3
{
  [(SCATMenu *)self->_menu slideDockToPosition:[(SCATMenu *)self->_menu dockPosition] == 0];

  [(SCATGestureDrawingViewController *)self _updateMainViewToolbarFrame];
}

- (void)moveForFreehandSheet:(id)a3
{
  if ([(SCATGestureDrawingViewController *)self pressesOnMoveStart]
    && ![(SCATGestureDrawingViewController *)self areFingersPressed])
  {
    [(SCATGestureDrawingViewController *)self setAreFingersPressed:1];
  }
  BOOL v4 = +[AXSettings sharedInstance];
  double v5 = dbl_100197910[[v4 switchControlScanningStyle] == 0];

  id v6 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_move" selector:0 userInfo:1 repeats:v5];
  [(SCATGestureDrawingViewController *)self setMoveTimer:v6];

  double v7 = [(SCATGestureDrawingViewController *)self mainView];
  [v7 setFingersHighlighted:1];

  sub_100040EC8(@"FREEHAND_MOVING");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(SCATGestureDrawingViewController *)self _installStopButtonForActionName:v8];
}

- (void)autoPressToggledForFreehandSheet:(id)a3
{
  uint64_t v4 = [(SCATGestureDrawingViewController *)self pressesOnMoveStart] ^ 1;

  [(SCATGestureDrawingViewController *)self setPressesOnMoveStart:v4];
}

- (void)autoLiftToggledForFreehandSheet:(id)a3
{
  uint64_t v4 = [(SCATGestureDrawingViewController *)self liftsOnMoveEnd] ^ 1;

  [(SCATGestureDrawingViewController *)self setLiftsOnMoveEnd:v4];
}

- (void)stopForFreehandSheet:(id)a3
{
  if ([(SCATGestureDrawingViewController *)self _isPerformingMove]) {
    [(SCATGestureDrawingViewController *)self _endMovementAndForceLift:0];
  }
  else {
    [(SCATGestureDrawingViewController *)self _endGeneralTimer];
  }
  menu = self->_menu;

  [(SCATMenu *)menu popSheet];
}

- (void)rotateForFreehandSheet:(id)a3
{
  [(SCATGestureDrawingViewController *)self setIsRotating:1];
  uint64_t v4 = [(SCATGestureDrawingViewController *)self mainView];
  [v4 setShowsRotationControls:1];

  double v5 = [(SCATGestureDrawingViewController *)self mainView];
  [v5 setShowsRotation90Controls:1];

  uint64_t v6 = objc_opt_class();

  [(SCATGestureDrawingViewController *)self _pushFreehandSheetOfClass:v6];
}

- (void)bendForFreehandSheet:(id)a3
{
  [(SCATGestureDrawingViewController *)self setIsCurving:1];
  uint64_t v4 = [(SCATGestureDrawingViewController *)self mainView];
  [v4 setShowsCurvatureControls:1];

  uint64_t v5 = objc_opt_class();

  [(SCATGestureDrawingViewController *)self _pushFreehandSheetOfClass:v5];
}

- (void)rotateCounterclockwiseForFreehandSheet:(id)a3
{
  sub_100040EC8(@"FREEHAND_ROTATING");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(SCATGestureDrawingViewController *)self _startGeneralTimerWithSelector:"_rotateCounterclockwise" actionName:v4];
}

- (void)rotateClockwiseForFreehandSheet:(id)a3
{
  sub_100040EC8(@"FREEHAND_ROTATING");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(SCATGestureDrawingViewController *)self _startGeneralTimerWithSelector:"_rotateClockwise" actionName:v4];
}

- (void)rotate90CounterclockwiseForFreehandSheet:(id)a3
{
  [(SCATGestureDrawingViewController *)self angle];
  double v5 = v4 + -1.57079633;

  [(SCATGestureDrawingViewController *)self setAngle:v5];
}

- (void)rotate90ClockwiseForFreehandSheet:(id)a3
{
  [(SCATGestureDrawingViewController *)self angle];
  double v5 = v4 + 1.57079633;

  [(SCATGestureDrawingViewController *)self setAngle:v5];
}

- (void)straightenForFreehandSheet:(id)a3
{
}

- (void)bendRightForFreehandSheet:(id)a3
{
  sub_100040EC8(@"FREEHAND_BENDING");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(SCATGestureDrawingViewController *)self _startGeneralTimerWithSelector:"_increaseCurvature" actionName:v4];
}

- (void)bendLeftForFreehandSheet:(id)a3
{
  sub_100040EC8(@"FREEHAND_BENDING");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(SCATGestureDrawingViewController *)self _startGeneralTimerWithSelector:"_decreaseCurvature" actionName:v4];
}

- (void)increaseVelocityForFreehandSheet:(id)a3
{
  [(SCATGestureDrawingViewController *)self velocity];
  double v5 = v4 * 1.1;
  if (v5 > 10.0) {
    double v5 = 10.0;
  }

  [(SCATGestureDrawingViewController *)self setVelocity:v5];
}

- (void)decreaseVelocityForFreehandSheet:(id)a3
{
  [(SCATGestureDrawingViewController *)self velocity];
  double v5 = v4 / 1.1;
  if (v5 < 0.1) {
    double v5 = 0.1;
  }

  [(SCATGestureDrawingViewController *)self setVelocity:v5];
}

- (void)toggleTouchForFreehandSheet:(id)a3
{
  uint64_t v4 = [(SCATGestureDrawingViewController *)self areFingersPressed] ^ 1;

  [(SCATGestureDrawingViewController *)self setAreFingersPressed:v4];
}

- (void)menuWillDisappear:(id)a3
{
  id v4 = [(SCATGestureDrawingViewController *)self delegate];
  [v4 exitDrawingViewController:self];
}

- (void)menuDidFinishTransition:(id)a3
{
}

- (id)_currentElementProvider
{
  v2 = [(SCATMenu *)self->_menu currentSheet];
  uint64_t v3 = [v2 elementProvider];

  return v3;
}

- (id)firstElementWithOptions:(int *)a3
{
  id v4 = [(SCATGestureDrawingViewController *)self _currentElementProvider];
  double v5 = [v4 firstElementWithOptions:a3];

  return v5;
}

- (id)lastElementWithOptions:(int *)a3
{
  id v4 = [(SCATGestureDrawingViewController *)self _currentElementProvider];
  double v5 = [v4 lastElementWithOptions:a3];

  return v5;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v8 = a3;
  id v9 = [(SCATGestureDrawingViewController *)self _currentElementProvider];
  double v10 = [v9 elementAfter:v8 didWrap:a4 options:a5];

  return v10;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v8 = a3;
  id v9 = [(SCATGestureDrawingViewController *)self _currentElementProvider];
  double v10 = [v9 elementBefore:v8 didWrap:a4 options:a5];

  return v10;
}

- (void)scannerWillMakeManagerActive:(id)a3
{
  id v14 = [a3 scatUIContext];
  [v14 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(SCATGestureDrawingViewController *)self view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  id v13 = [(SCATGestureDrawingViewController *)self view];
  [v14 insertSubview:v13 atIndex:0];

  [(SCATGestureDrawingViewController *)self _pushFreehandSheetOfClass:objc_opt_class()];
}

- (void)scannerWillMakeManagerActive:(id)a3 forDisplayID:(unsigned int)a4
{
  id v15 = [a3 scatUIContextForDisplayID:*(void *)&a4];
  [v15 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(SCATGestureDrawingViewController *)self view];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  id v14 = [(SCATGestureDrawingViewController *)self view];
  [v15 insertSubview:v14 atIndex:0];

  [(SCATGestureDrawingViewController *)self _pushFreehandSheetOfClass:objc_opt_class()];
}

- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4
{
  double v5 = [(SCATGestureDrawingViewController *)self view];
  [v5 removeFromSuperview];

  [(SCATGestureDrawingViewController *)self _cleanUp];
}

- (BOOL)allowsDwellSelection
{
  v2 = [(SCATMenu *)self->_menu currentSheet];
  unsigned __int8 v3 = [v2 shouldAllowDwellSelection];

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SCATGestureDrawingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATGestureDrawingViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)pressesOnMoveStart
{
  return self->_pressesOnMoveStart;
}

- (BOOL)liftsOnMoveEnd
{
  return self->_liftsOnMoveEnd;
}

- (BOOL)areFingersPressed
{
  return self->_areFingersPressed;
}

- (double)angle
{
  return self->_angle;
}

- (double)velocity
{
  return self->_velocity;
}

- (double)curvature
{
  return self->_curvature;
}

- (NSArray)fingerPositions
{
  return self->_fingerPositions;
}

- (NSTimer)moveTimer
{
  return self->_moveTimer;
}

- (void)setMoveTimer:(id)a3
{
}

- (NSTimer)generalTimer
{
  return self->_generalTimer;
}

- (void)setGeneralTimer:(id)a3
{
}

- (BOOL)isRotating
{
  return self->_isRotating;
}

- (void)setIsRotating:(BOOL)a3
{
  self->_isRotating = a3;
}

- (BOOL)isCurving
{
  return self->_isCurving;
}

- (void)setIsCurving:(BOOL)a3
{
  self->_isCurving = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generalTimer, 0);
  objc_storeStrong((id *)&self->_moveTimer, 0);
  objc_storeStrong((id *)&self->_fingerPositions, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_menu, 0);
}

@end