@interface SCATGestureProvider
- (BOOL)_isPerformingContinuousGesture;
- (BOOL)allowsDwellScanningToAbortAfterTimeout;
- (BOOL)allowsDwellSelection;
- (BOOL)canBeActiveElementManager;
- (BOOL)drawingViewController:(id)a3 moveFingersToPoints:(id)a4;
- (BOOL)handleInputAction:(id)a3 withElement:(id)a4;
- (BOOL)isHidden;
- (BOOL)isPinching;
- (BOOL)pointPicker:(id)a3 pauseForNumberOfCycles:(unint64_t)a4;
- (BOOL)shouldAllowFingersForContinuousGesture;
- (BOOL)shouldKeepScannerAwake;
- (CGPoint)_startingPointForGestures;
- (CGPoint)currentHoldPoint;
- (CGPoint)endPointForLineGesture;
- (CGPoint)pinchFulcrum;
- (CGPoint)startingScreenPointForGestures;
- (CGRect)_rectForFingers:(id)a3;
- (CGRect)_rectToClearForPinchGesture;
- (CGRect)rectToClearForFingersWithGestureSheet:(BOOL)a3;
- (CGRect)rectToClearForStop:(id)a3;
- (NSArray)panFingerPositions;
- (NSArray)pinchFingerOriginalPositions;
- (SCATElement)elementForFingers;
- (SCATElementManager)currentSwitchController;
- (SCATGestureArrowView)arrowView;
- (SCATGestureProvider)initWithMenu:(id)a3;
- (SCATGestureProviderDelegate)delegate;
- (double)_pinchAngleAdjustedByDelta:(double)a3;
- (double)_pinchRadiusAdjustedByDelta:(double)a3;
- (double)alphaForFingers;
- (double)pinchAngle;
- (double)pinchRadius;
- (id)_fingerController;
- (id)_panPositionsAdjustedByDelta:(CGSize)a3;
- (id)_pinchPositionsWithRadius:(double)a3 angle:(double)a4;
- (id)_promptForLineGesture:(unint64_t)a3;
- (id)_repositionedGestureFromOriginalGesture:(id)a3;
- (id)_startingPointsAsStrings;
- (id)contextForCustomGestureItemsViewController:(id)a3;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)gesturesSheet;
- (id)identifier;
- (id)lastElementWithOptions:(int *)a3;
- (id)nameForConfirmationButton:(id)a3;
- (unint64_t)_numberOfFingers;
- (unint64_t)_numberOfFingersWithGestureSheet:(BOOL)a3;
- (unint64_t)lineGestureState;
- (unint64_t)lineGestureType;
- (unint64_t)numberOfFingers;
- (unsigned)startingDisplayIDForGestures;
- (void)_addPointsToContinuousGestureData:(id)a3;
- (void)_clearArrowView;
- (void)_clearLineGestureState;
- (void)_clearTellMeWhenTimer;
- (void)_didChooseFlickWithAngle:(double)a3 name:(id)a4;
- (void)_didChoosePanWithName:(id)a3 selector:(SEL)a4;
- (void)_didChoosePinchItemWithName:(id)a3 selector:(SEL)a4;
- (void)_endPinchMode;
- (void)_finishLineGesture;
- (void)_handleCompletedContinuousGesture;
- (void)_initializeContinuousGestureDataWithName:(id)a3 points:(id)a4;
- (void)_panByDelta:(CGSize)a3;
- (void)_panDown;
- (void)_panLeft;
- (void)_panRight;
- (void)_panUp;
- (void)_performFlickGestureWithAngle:(double)a3 name:(id)a4;
- (void)_performForceTouchGesture;
- (void)_performGesture:(id)a3;
- (void)_performTapGestureForDoubleTap:(BOOL)a3;
- (void)_pinchIn;
- (void)_pinchOut;
- (void)_prepareToBeginContinuousGesture;
- (void)_requestSwitchControllerPrivileges;
- (void)_resetContinuousGestureData;
- (void)_resignSwitchControllerPrivileges;
- (void)_rotateClockwise;
- (void)_rotateCounterclockwise;
- (void)_saveRecentGesture:(id)a3;
- (void)_setNumberOfFingersForGestures:(unint64_t)a3;
- (void)_setShowsFingers:(BOOL)a3;
- (void)_startConfirmingLineGestureWithEndpoint:(CGPoint)a3;
- (void)_startPickingEndPointForLineGesture:(unint64_t)a3;
- (void)_startPinchMode;
- (void)_startTellMeWhenTimerWithSelector:(SEL)a3;
- (void)_startTellMeWhenTimerWithSelector:(SEL)a3 interval:(double)a4;
- (void)_updatePinchPositionsWithAttemptedRadiusDelta:(double)a3 angleDelta:(double)a4;
- (void)_updateShowsFingers;
- (void)_updateStartingPointForGesturesWithScreenPoint:(id)a3;
- (void)_updateStartingPointForGesturesWithScreenPoint:(id)a3 forDisplayID:(unsigned int)a4;
- (void)_updateVisibleFingers;
- (void)customGestureItemsViewController:(id)a3 didChooseGesture:(id)a4;
- (void)dealloc;
- (void)didActivateFingersElement:(id)a3;
- (void)didChooseActiveHoldAndDragGesture:(id)a3;
- (void)didChooseAddRecentInCustomGestureItemsViewController:(id)a3;
- (void)didChooseArbitraryFlick:(id)a3;
- (void)didChooseCreateInCustomGestureItemsViewController:(id)a3;
- (void)didChooseDoubleTapGesture:(id)a3;
- (void)didChooseDragGesture:(id)a3;
- (void)didChooseDrawingGesture:(id)a3;
- (void)didChooseFavorites:(id)a3;
- (void)didChooseFingers:(id)a3;
- (void)didChooseFlickDown:(id)a3;
- (void)didChooseFlickGesture:(id)a3;
- (void)didChooseFlickLeft:(id)a3;
- (void)didChooseFlickRight:(id)a3;
- (void)didChooseFlickUp:(id)a3;
- (void)didChooseForceTouchGesture:(id)a3;
- (void)didChooseHoldAndDragGesture:(id)a3;
- (void)didChoosePanDown:(id)a3;
- (void)didChoosePanGesture:(id)a3;
- (void)didChoosePanLeft:(id)a3;
- (void)didChoosePanRight:(id)a3;
- (void)didChoosePanUp:(id)a3;
- (void)didChoosePinchGesture:(id)a3;
- (void)didChoosePinchIn:(id)a3;
- (void)didChoosePinchOut:(id)a3;
- (void)didChooseRotateClockwise:(id)a3;
- (void)didChooseRotateCounterclockwise:(id)a3;
- (void)didChooseStop:(id)a3;
- (void)didConfirmGesture:(id)a3;
- (void)didPushPinchItemsViewController:(id)a3;
- (void)didRequestRedoGesture:(id)a3;
- (void)drawingViewController:(id)a3 shouldResetScanningFromElement:(id)a4;
- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5;
- (void)driver:(id)a3 willFocusOnContext:(id)a4;
- (void)driver:(id)a3 willUnfocusFromContext:(id)a4;
- (void)exitDrawingViewController:(id)a3;
- (void)fingerItemsViewController:(id)a3 didChooseNumberOfFingers:(unint64_t)a4;
- (void)fingersElement:(id)a3 didBecomeFocused:(BOOL)a4;
- (void)menuDidAppear:(id)a3;
- (void)menuDidDisappear:(id)a3;
- (void)menuDidFinishTransition:(id)a3;
- (void)menuWillAppear:(id)a3;
- (void)menuWillDisappear:(id)a3;
- (void)orientationDidChange:(id)a3;
- (void)performHoldAtPoint:(CGPoint)a3 isDown:(BOOL)a4;
- (void)performTap;
- (void)performTapAndHold;
- (void)pointPicker:(id)a3 didPickPoint:(CGPoint)a4;
- (void)replayGesture:(id)a3;
- (void)scannerWillMakeManagerActive:(id)a3;
- (void)scannerWillMakeManagerActive:(id)a3 forDisplayID:(unsigned int)a4;
- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4;
- (void)setAlphaForFingers:(double)a3;
- (void)setArrowView:(id)a3;
- (void)setCurrentHoldPoint:(CGPoint)a3;
- (void)setCurrentSwitchController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndPointForLineGesture:(CGPoint)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsPinching:(BOOL)a3;
- (void)setLineGestureState:(unint64_t)a3;
- (void)setLineGestureType:(unint64_t)a3;
- (void)setPanFingerPositions:(id)a3;
- (void)setPinchAngle:(double)a3;
- (void)setPinchFingerOriginalPositions:(id)a3;
- (void)setPinchFulcrum:(CGPoint)a3;
- (void)setPinchRadius:(double)a3;
- (void)setShouldAllowFingersForContinuousGesture:(BOOL)a3;
- (void)setStartingDisplayIDForGestures:(unsigned int)a3;
- (void)setStartingScreenPointForGestures:(CGPoint)a3;
- (void)systemApertureLayoutDidChange:(id)a3;
- (void)toggleActiveHoldAndDragGestureAtScreenPoint:(CGPoint)a3 withDisplayID:(unsigned int)a4;
- (void)touchDownForDrawingViewController:(id)a3;
- (void)touchUpForDrawingViewController:(id)a3;
@end

@implementation SCATGestureProvider

- (SCATGestureProvider)initWithMenu:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCATGestureProvider;
  v6 = [(SCATGestureProvider *)&v15 init];
  if (v6)
  {
    if (!v5) {
      _AXAssert();
    }
    objc_storeStrong((id *)v6 + 5, a3);
    v7 = +[HNDDefaults sharedDefaults];
    v8 = [v7 preferenceForKey:@"ScannerNumberOfFingers"];

    if (v8) {
      uint64_t v9 = (uint64_t)[v8 integerValue];
    }
    else {
      uint64_t v9 = 1;
    }
    *((void *)v6 + 13) = v9;
    [v5 registerMenuObserver:v6];
    *((_OWORD *)v6 + 21) = AXSwitchRecipeHoldPointNone;
    *((void *)v6 + 35) = 0x3FF0000000000000;
    v10 = +[HNDHandManager sharedManager];
    v11 = [v10 mainDisplayManager];
    *((_DWORD *)v6 + 51) = [v11 displayID];

    id v12 = objc_alloc_init((Class)SBSSystemApertureLayoutMonitor);
    v13 = (void *)*((void *)v6 + 20);
    *((void *)v6 + 20) = v12;

    [*((id *)v6 + 20) addObserver:v6];
    *(_OWORD *)(v6 + 168) = 0u;
    *(_OWORD *)(v6 + 184) = 0u;
  }
  return (SCATGestureProvider *)v6;
}

- (void)dealloc
{
  [(SCATMenu *)self->_menu unregisterMenuObserver:self];
  [(SCATGestureProvider *)self _clearTellMeWhenTimer];
  [(SCATGestureProvider *)self _clearArrowView];
  v3.receiver = self;
  v3.super_class = (Class)SCATGestureProvider;
  [(SCATGestureProvider *)&v3 dealloc];
}

- (void)orientationDidChange:(id)a3
{
  menu = self->_menu;
  id v5 = a3;
  id v13 = [(SCATMenu *)menu element];
  if (v13)
  {
    [v13 scatFrame];
    CGFloat x = v15.origin.x;
    CGFloat y = v15.origin.y;
    CGFloat width = v15.size.width;
    CGFloat height = v15.size.height;
    double MidX = CGRectGetMidX(v15);
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    v11 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", MidX, CGRectGetMidY(v16));
    [(SCATGestureProvider *)self _updateStartingPointForGesturesWithScreenPoint:v11];
  }
  [(SCATGestureProvider *)self _updateVisibleFingers];
  id v12 = [(SCATGestureDrawingElementManager *)self->_drawingElementManager drawingViewController];
  [v12 orientationDidChange:v5];
}

- (void)setHidden:(BOOL)a3
{
  if (self->_hidden != a3)
  {
    BOOL v3 = a3;
    self->_hidden = a3;
    [(SCATGestureProvider *)self _updateShowsFingers];
    id v5 = [(SCATGestureProvider *)self arrowView];
    [v5 setHidden:v3];
  }
}

- (void)setAlphaForFingers:(double)a3
{
  if (self->_alphaForFingers != a3)
  {
    self->_alphaForFingers = a3;
    [(SCATGestureProvider *)self _updateVisibleFingers];
  }
}

- (SCATElement)elementForFingers
{
  elementForFingers = self->_elementForFingers;
  if (!elementForFingers)
  {
    v4 = objc_alloc_init(SCATGestureFingersElement);
    id v5 = self->_elementForFingers;
    self->_elementForFingers = v4;

    [(SCATGestureFingersElement *)self->_elementForFingers setDelegate:self];
    elementForFingers = self->_elementForFingers;
  }

  return (SCATElement *)elementForFingers;
}

- (id)identifier
{
  return off_1001EF8A8[0];
}

- (void)setStartingDisplayIDForGestures:(unsigned int)a3
{
  if (a3) {
    self->_startingDisplayIDForGestures = a3;
  }
}

- (id)_fingerController
{
  BOOL v3 = +[HNDHandManager sharedManager];
  v4 = objc_msgSend(v3, "displayManagerForDisplayId:", -[SCATGestureProvider startingDisplayIDForGestures](self, "startingDisplayIDForGestures"));
  id v5 = [v4 fingerController];

  return v5;
}

- (void)_updateStartingPointForGesturesWithScreenPoint:(id)a3
{
}

- (void)_updateStartingPointForGesturesWithScreenPoint:(id)a3 forDisplayID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v15 = v6;
  if (v6)
  {
    [v6 pointValue];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    v11 = [(SCATMenu *)self->_menu element];

    if (!v11) {
      goto LABEL_6;
    }
    id v12 = [(SCATMenu *)self->_menu element];
    [v12 scatFrame];
    AX_CGRectGetCenter();
    double v8 = v13;
    double v10 = v14;
  }
  -[SCATGestureProvider setStartingScreenPointForGestures:](self, "setStartingScreenPointForGestures:", v8, v10);
  [(SCATGestureProvider *)self setStartingDisplayIDForGestures:v4];
LABEL_6:
}

- (CGPoint)_startingPointForGestures
{
  [(SCATGestureProvider *)self currentHoldPoint];
  if (v4 == AXSwitchRecipeHoldPointNone[0] && v3 == AXSwitchRecipeHoldPointNone[1])
  {
    [(SCATGestureProvider *)self startingScreenPointForGestures];
    double v9 = v8;
    double v11 = v10;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v13 = [WeakRetained contentViewForGestureProvider:self];
    +[HNDScreen convertPoint:toView:](HNDScreen, "convertPoint:toView:", v13, v9, v11);
    double v15 = v14;
    double v17 = v16;

    double v6 = v15;
    double v7 = v17;
  }
  else
  {
    [(SCATGestureProvider *)self currentHoldPoint];
  }
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (id)_startingPointsAsStrings
{
  [(SCATGestureProvider *)self _startingPointForGestures];
  double v4 = v3;
  double v6 = v5;
  if (self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 17.0 + 5.0 > v5
    && AXDeviceHasJindo())
  {
    double v6 = self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 17.0 + 5.0;
  }
  unint64_t v7 = [(SCATGestureProvider *)self _numberOfFingers];
  double v8 = [(SCATGestureProvider *)self _fingerController];
  double v9 = [v8 fingerContainerView];
  [v9 bounds];
  double v14 = +[AXPIFingerUtilities defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:](AXPIFingerUtilities, "defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:", v7, v4, v6, v10, v11, v12, v13);

  return v14;
}

- (BOOL)_isPerformingContinuousGesture
{
  return self->_continuousGestureName != 0;
}

- (void)_resetContinuousGestureData
{
  continuousGestureName = self->_continuousGestureName;
  self->_continuousGestureName = 0;

  continuousGesturePoints = self->_continuousGesturePoints;
  self->_continuousGesturePoints = 0;

  continuousGestureTimes = self->_continuousGestureTimes;
  self->_continuousGestureTimes = 0;
}

- (void)_prepareToBeginContinuousGesture
{
  double v2 = 0.0;
  if (!self->_drawingElementManager) {
    double v2 = 1.0;
  }
  [(SCATGestureProvider *)self setAlphaForFingers:v2];
}

- (void)_initializeContinuousGestureDataWithName:(id)a3 points:(id)a4
{
  id v22 = a3;
  id v7 = a4;
  [(SCATGestureProvider *)self _resetContinuousGestureData];
  objc_storeStrong((id *)&self->_continuousGestureName, a3);
  id v8 = [v7 count];
  double v9 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v8];
  continuousGesturePoints = self->_continuousGesturePoints;
  self->_continuousGesturePoints = v9;

  double v11 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v8];
  continuousGestureTimes = self->_continuousGestureTimes;
  self->_continuousGestureTimes = v11;

  double v13 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v7;
  id v14 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      double v17 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = self->_continuousGesturePoints;
        v19 = +[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", *(void *)(*((void *)&v24 + 1) + 8 * (void)v17), v22);
        [(NSMutableArray *)v18 addObject:v19];

        v20 = self->_continuousGestureTimes;
        v21 = +[NSMutableArray arrayWithObject:v13];
        [(NSMutableArray *)v20 addObject:v21];

        double v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }
}

- (void)_addPointsToContinuousGestureData:(id)a3
{
  id v12 = a3;
  double v4 = (char *)[v12 count];
  double v5 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  if ([(NSMutableArray *)self->_continuousGesturePoints count] != v4)
  {
    double v10 = v4;
    id v11 = [(NSMutableArray *)self->_continuousGesturePoints count];
    _AXAssert();
  }
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      id v7 = -[NSMutableArray objectAtIndex:](self->_continuousGesturePoints, "objectAtIndex:", i, v10, v11);
      id v8 = [(NSMutableArray *)self->_continuousGestureTimes objectAtIndex:i];
      double v9 = [v12 objectAtIndex:i];
      [v7 addObject:v9];

      [v8 addObject:v5];
    }
  }
}

- (void)_handleCompletedContinuousGesture
{
  double v3 = [(SCATGestureProvider *)self _fingerController];
  id v5 = [v3 legacyLiftFingersUp];

  [(SCATGestureProvider *)self _addPointsToContinuousGestureData:v5];
  double v4 = +[AXNamedReplayableGesture gestureWithPoints:self->_continuousGesturePoints times:self->_continuousGestureTimes forces:0];
  [v4 setName:self->_continuousGestureName];
  [v4 setShouldPerformAtOriginalLocation:1];
  [v4 setHasLocalizableName:1];
  [(SCATGestureProvider *)self _saveRecentGesture:v4];
  [(SCATGestureProvider *)self _resetContinuousGestureData];
  self->_isReversingContinuousGesture = 0;
  [(SCATGestureProvider *)self setPanFingerPositions:0];
  [(SCATGestureProvider *)self setShouldAllowFingersForContinuousGesture:0];
  [(SCATGestureProvider *)self _updateVisibleFingers];
}

- (void)_saveRecentGesture:(id)a3
{
  id v3 = a3;
  double v4 = +[AXSettings sharedInstance];
  id v5 = [v4 assistiveTouchRecentGestures];
  id v8 = [v5 mutableCopy];

  if (v8)
  {
    [v8 removeObject:v3];
  }
  else
  {
    id v8 = +[NSMutableArray arrayWithCapacity:1];
  }
  [v8 insertObject:v3 atIndex:0];

  double v6 = (char *)[v8 count];
  if ((unint64_t)v6 >= 4) {
    objc_msgSend(v8, "removeObjectsInRange:", 3, v6 - 3);
  }
  id v7 = +[AXSettings sharedInstance];
  [v7 setAssistiveTouchRecentGestures:v8];
}

- (void)_performGesture:(id)a3
{
  id v4 = a3;
  id v5 = +[SCATScannerManager sharedManager];
  [v5 addReasonToDisableScanning:@"PerformingGesture"];
  [(SCATGestureProvider *)self replayGesture:v4];
  [(SCATGestureProvider *)self _saveRecentGesture:v4];

  +[HNDDisplayManager fadeDuration];
  id v6 = v5;
  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)_performTapGestureForDoubleTap:(BOOL)a3
{
  BOOL v3 = a3;
  [(SCATGestureProvider *)self _startingPointForGestures];
  id v7 = +[AXNamedReplayableGesture tapGestureAtPoint:isDoubleTap:numberOfFingers:](AXNamedReplayableGesture, "tapGestureAtPoint:isDoubleTap:numberOfFingers:", v3, [(SCATGestureProvider *)self _numberOfFingers], v5, v6);
  id v9 = v7;
  id v8 = &off_1001ADF68;
  if (!v3) {
    id v8 = &off_1001ADED8;
  }
  [v7 setName:*v8];
  [v9 setHasLocalizableName:1];
  [v9 setShouldPerformAtOriginalLocation:1];
  [(SCATGestureProvider *)self _performGesture:v9];
}

- (void)_performFlickGestureWithAngle:(double)a3 name:(id)a4
{
  id v6 = a4;
  [(SCATGestureProvider *)self _startingPointForGestures];
  +[AXNamedReplayableGesture flickGestureAtPoint:angle:numberOfFingers:](AXNamedReplayableGesture, "flickGestureAtPoint:angle:numberOfFingers:", [(SCATGestureProvider *)self _numberOfFingers], v7, v8, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 setName:v6];

  [v9 setHasLocalizableName:1];
  [v9 setShouldPerformAtOriginalLocation:1];
  [(SCATGestureProvider *)self _performGesture:v9];
}

- (void)_performForceTouchGesture
{
  [(SCATGestureProvider *)self _startingPointForGestures];
  +[AXNamedReplayableGesture forceTouchGestureAtPoint:](AXNamedReplayableGesture, "forceTouchGestureAtPoint:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setName:@"FORCE_TOUCH"];
  [v3 setHasLocalizableName:1];
  [v3 setShouldPerformAtOriginalLocation:1];
  [(SCATGestureProvider *)self _performGesture:v3];
}

- (id)_pinchPositionsWithRadius:(double)a3 angle:(double)a4
{
  [(SCATGestureProvider *)self pinchFulcrum];
  double v8 = v7;
  __double2 v9 = __sincos_stret(a4);
  [(SCATGestureProvider *)self pinchFulcrum];
  CGFloat v11 = v10 + a3 * v9.__sinval;
  [(SCATGestureProvider *)self pinchFulcrum];
  double v13 = v12;
  __double2 v14 = __sincos_stret(a4 + 3.14159265);
  [(SCATGestureProvider *)self pinchFulcrum];
  CGFloat v16 = v15 + a3 * v14.__sinval;
  v22.CGFloat x = v8 + a3 * v9.__cosval;
  v22.CGFloat y = v11;
  double v17 = NSStringFromCGPoint(v22);
  v23.CGFloat x = v13 + a3 * v14.__cosval;
  v23.CGFloat y = v16;
  v18 = NSStringFromCGPoint(v23);
  v19 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v17, v18, 0);

  return v19;
}

- (double)_pinchRadiusAdjustedByDelta:(double)a3
{
  if (self->_isReversingContinuousGesture) {
    double v4 = -1.0;
  }
  else {
    double v4 = 1.0;
  }
  [(SCATGestureProvider *)self pinchRadius];
  return v5 + a3 * v4;
}

- (double)_pinchAngleAdjustedByDelta:(double)a3
{
  if (self->_isReversingContinuousGesture) {
    double v4 = -1.0;
  }
  else {
    double v4 = 1.0;
  }
  [(SCATGestureProvider *)self pinchAngle];
  return v5 + a3 * v4;
}

- (void)_updatePinchPositionsWithAttemptedRadiusDelta:(double)a3 angleDelta:(double)a4
{
  -[SCATGestureProvider _pinchRadiusAdjustedByDelta:](self, "_pinchRadiusAdjustedByDelta:");
  double v8 = v7;
  [(SCATGestureProvider *)self _pinchAngleAdjustedByDelta:a4];
  double v10 = v9;
  id v29 = [(SCATGestureProvider *)self pinchFingerOriginalPositions];
  if (v8 < 20.0 || v8 > 200.0)
  {
    double v12 = 0;
    goto LABEL_8;
  }
  double v12 = [(SCATGestureProvider *)self _pinchPositionsWithRadius:v8 angle:v10];
  double v13 = [(SCATGestureProvider *)self _fingerController];
  unsigned __int8 v14 = [v13 moveFingersToPoints:v12];

  if ((v14 & 1) == 0)
  {
LABEL_8:
    if (self->_isReversingContinuousGesture)
    {
      BOOL v15 = 0;
    }
    else
    {
      [(SCATGestureProvider *)self pinchRadius];
      double v17 = v16;
      [(SCATGestureProvider *)self pinchAngle];
      v19 = [(SCATGestureProvider *)self _pinchPositionsWithRadius:v17 angle:v18];
      unsigned __int8 v20 = [v19 isEqualToArray:v29];

      if (v20) {
        goto LABEL_20;
      }
      BOOL v15 = !self->_isReversingContinuousGesture;
    }
    self->_BOOL isReversingContinuousGesture = v15;
    [(SCATGestureProvider *)self _pinchRadiusAdjustedByDelta:a3];
    double v8 = v21;
    [(SCATGestureProvider *)self _pinchAngleAdjustedByDelta:a4];
    double v10 = v22;
    if (v8 >= 20.0 && v8 <= 200.0)
    {
      uint64_t v23 = [(SCATGestureProvider *)self _pinchPositionsWithRadius:v8 angle:v22];

      long long v24 = [(SCATGestureProvider *)self _fingerController];
      unsigned __int8 v25 = [v24 moveFingersToPoints:v23];

      double v12 = (void *)v23;
      if (v25) {
        goto LABEL_15;
      }
    }
    long long v27 = v12;
    BOOL isReversingContinuousGesture = self->_isReversingContinuousGesture;
    id v26 = v29;
    _AXAssert();
LABEL_20:
    [(SCATGestureProvider *)self _clearTellMeWhenTimer];
    goto LABEL_21;
  }
LABEL_15:
  [(SCATGestureProvider *)self setPinchRadius:v8];
  [(SCATGestureProvider *)self setPinchAngle:v10];
  [(SCATGestureProvider *)self _addPointsToContinuousGestureData:v12];
  if ([v12 isEqualToArray:v29])
  {
    if (!self->_isReversingContinuousGesture) {
      _AXAssert();
    }
    self->_BOOL isReversingContinuousGesture = 0;
  }
LABEL_21:
}

- (void)_pinchOut
{
}

- (void)_pinchIn
{
}

- (void)_rotateClockwise
{
}

- (void)_rotateCounterclockwise
{
}

- (id)_panPositionsAdjustedByDelta:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(SCATGestureProvider *)self panFingerPositions];
  double v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);

  if (self->_isReversingContinuousGesture) {
    double v8 = -1.0;
  }
  else {
    double v8 = 1.0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v9 = [(SCATGestureProvider *)self panFingerPositions];
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        CGPoint v14 = CGPointFromString((NSString *)*(void *)(*((void *)&v17 + 1) + 8 * i));
        v23.CGFloat x = v14.x + width * v8;
        v23.CGFloat y = v14.y + height * v8;
        BOOL v15 = NSStringFromCGPoint(v23);
        [v7 addObject:v15];
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v7;
}

- (void)_panByDelta:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = -[SCATGestureProvider _panPositionsAdjustedByDelta:](self, "_panPositionsAdjustedByDelta:");
  double v7 = [(SCATGestureProvider *)self _startingPointsAsStrings];
  if ([v6 isEqualToArray:v7])
  {
    if (!self->_isReversingContinuousGesture) {
      _AXAssert();
    }
    self->_BOOL isReversingContinuousGesture = 0;
  }
  double v8 = [(SCATGestureProvider *)self _fingerController];
  unsigned __int8 v9 = [v8 moveFingersToPoints:v6];

  if (v9)
  {
    id v18 = v6;
LABEL_7:
    [(SCATGestureProvider *)self setPanFingerPositions:v6];
    [(SCATGestureProvider *)self _addPointsToContinuousGestureData:v6];
    goto LABEL_12;
  }
  if (self->_isReversingContinuousGesture
    || ([(SCATGestureProvider *)self panFingerPositions],
        id v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = [v10 isEqualToArray:v7],
        v10,
        (v11 & 1) != 0))
  {
    id v18 = v6;
    [(SCATGestureProvider *)self _clearTellMeWhenTimer];
  }
  else
  {
    self->_BOOL isReversingContinuousGesture = 1;
    -[SCATGestureProvider _panPositionsAdjustedByDelta:](self, "_panPositionsAdjustedByDelta:", width, height);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v12 = [(SCATGestureProvider *)self _fingerController];
    unsigned __int8 v13 = [v12 moveFingersToPoints:v18];

    if (v13)
    {
      id v6 = v18;
      goto LABEL_7;
    }
    BOOL isReversingContinuousGesture = self->_isReversingContinuousGesture;
    _AXAssert();
    [(SCATGestureProvider *)self _clearTellMeWhenTimer];
  }
LABEL_12:
}

- (void)_panLeft
{
}

- (void)_panRight
{
}

- (void)_panUp
{
}

- (void)_panDown
{
}

- (void)_finishLineGesture
{
  [(SCATGestureProvider *)self _startingPointForGestures];
  double v4 = v3;
  double v6 = v5;
  [(SCATGestureProvider *)self endPointForLineGesture];
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = [(SCATGestureProvider *)self lineGestureType];
  switch(v11)
  {
    case 2uLL:
      AX_CGPointGetDistanceToPoint();
      double v19 = v18 / 80.0;
      v27.CGFloat x = v4;
      v27.CGFloat y = v6;
      long long v20 = NSStringFromCGPoint(v27);
      v28.CGFloat x = v8;
      v28.CGFloat y = v10;
      double v21 = NSStringFromCGPoint(v28);
      double v22 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v20, v21, 0);
      id v23 = +[AXNamedReplayableGesture lineGestureBetweenPoints:v22 duration:[(SCATGestureProvider *)self _numberOfFingers] numberOfFingers:v19 initialHoldDuration:0.5];

      long long v17 = &off_1001ADF10;
      goto LABEL_7;
    case 1uLL:
      +[AXNamedReplayableGesture flickGestureStartingAtPoint:endingAtPoint:numberOfFingers:](AXNamedReplayableGesture, "flickGestureStartingAtPoint:endingAtPoint:numberOfFingers:", [(SCATGestureProvider *)self _numberOfFingers], v4, v6, v8, v10);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      long long v17 = &off_1001ADF00;
      goto LABEL_7;
    case 0uLL:
      AX_CGPointGetDistanceToPoint();
      double v13 = v12 / 80.0;
      v25.CGFloat x = v4;
      v25.CGFloat y = v6;
      uint64_t v14 = NSStringFromCGPoint(v25);
      v26.CGFloat x = v8;
      v26.CGFloat y = v10;
      uint64_t v15 = NSStringFromCGPoint(v26);
      uint64_t v16 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v14, v15, 0);
      id v23 = +[AXNamedReplayableGesture lineGestureBetweenPoints:v16 duration:[(SCATGestureProvider *)self _numberOfFingers] numberOfFingers:v13];

      long long v17 = &off_1001ADF08;
LABEL_7:
      [v23 setName:*v17];
      goto LABEL_9;
  }
  id v23 = 0;
LABEL_9:
  [v23 setHasLocalizableName:1];
  [v23 setShouldPerformAtOriginalLocation:1];
  [(SCATGestureProvider *)self _performGesture:v23];
}

- (void)_startPinchMode
{
  [(SCATGestureProvider *)self setIsPinching:1];
  [(SCATGestureProvider *)self alphaForFingers];
  double v4 = v3;
  double v5 = [(SCATGestureProvider *)self _fingerController];
  double v6 = [v5 fingerContainerView];
  [v6 setAlpha:v4];

  id v7 = [(SCATGestureProvider *)self _fingerController];
  [(SCATGestureProvider *)self _startingPointForGestures];
  objc_msgSend(v7, "showPinchFingersAnimated:midpoint:", 1);
}

- (void)_endPinchMode
{
  [(SCATGestureProvider *)self setIsPinching:0];
  double v3 = [(SCATGestureProvider *)self _fingerController];
  [(SCATGestureProvider *)self _startingPointForGestures];
  objc_msgSend(v3, "clearAllFingersAnimated:endPointForAnimation:", 1);

  [(SCATGestureProvider *)self _updateVisibleFingers];
}

- (void)_updateVisibleFingers
{
  double v3 = [(SCATGestureProvider *)self _fingerController];
  if ([v3 isPerformingGesture])
  {
    double v4 = ASTLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not updating visible fingers because a gesture is in progress", v21, 2u);
    }
    goto LABEL_17;
  }
  id v5 = [v3 numberOfFingers];
  if (self->_showsFingers)
  {
    id v6 = v5;
    [(SCATGestureProvider *)self alphaForFingers];
    double v8 = v7;
    double v9 = [v3 fingerContainerView];
    [v9 setAlpha:v8];

    drawingElementManager = self->_drawingElementManager;
    if (!drawingElementManager)
    {
      [(SCATGestureProvider *)self currentHoldPoint];
      if (v16 == AXSwitchRecipeHoldPointNone[0] && v15 == AXSwitchRecipeHoldPointNone[1])
      {
        BOOL v18 = v6 == 0;
        if ([(SCATGestureProvider *)self isPinching])
        {
          [(SCATGestureProvider *)self _startingPointForGestures];
          objc_msgSend(v3, "showPinchFingersAnimated:midpoint:", v18);
          goto LABEL_18;
        }
        double v4 = [(SCATGestureProvider *)self _startingPointsAsStrings];
        uint64_t v19 = +[AXPIFingerUtilities fingerModelsForPointStrings:v4];
      }
      else
      {
        BOOL v18 = v6 == 0;
        [(SCATGestureProvider *)self currentHoldPoint];
        double v4 = +[AXPIFingerModel fingerModelForLocation:](AXPIFingerModel, "fingerModelForLocation:");
        double v22 = v4;
        uint64_t v19 = +[NSArray arrayWithObjects:&v22 count:1];
      }
      long long v20 = (void *)v19;
      objc_msgSend(v3, "showFingerModels:animated:startPointForAnimation:", v19, v18, CGPointZero.x, CGPointZero.y);

LABEL_17:
      goto LABEL_18;
    }
    BOOL v11 = v6 == 0;
    double v12 = [(SCATGestureDrawingElementManager *)drawingElementManager drawingViewController];
    double v13 = [v12 fingerPositions];
    uint64_t v14 = +[AXPIFingerUtilities fingerModelsForPointStrings:v13];
    objc_msgSend(v3, "showFingerModels:animated:startPointForAnimation:", v14, v11, CGPointZero.x, CGPointZero.y);
  }
  else
  {
    [(SCATGestureProvider *)self _startingPointForGestures];
    objc_msgSend(v3, "clearAllFingersAnimated:endPointForAnimation:", 1);
  }
LABEL_18:
}

- (void)_clearTellMeWhenTimer
{
  [(NSTimer *)self->_tellMeWhenGestureTimer invalidate];
  tellMeWhenGestureTimer = self->_tellMeWhenGestureTimer;
  self->_tellMeWhenGestureTimer = 0;
}

- (void)_startTellMeWhenTimerWithSelector:(SEL)a3
{
}

- (void)_startTellMeWhenTimerWithSelector:(SEL)a3 interval:(double)a4
{
  if (self->_tellMeWhenGestureTimer) {
    _AXAssert();
  }
  if (a4 == 0.0)
  {
    double v7 = +[AXSettings sharedInstance];
    a4 = dbl_100197910[[v7 switchControlScanningStyle] == 0];
  }
  double v8 = +[NSTimer scheduledTimerWithTimeInterval:self target:a3 selector:0 userInfo:1 repeats:a4];
  tellMeWhenGestureTimer = self->_tellMeWhenGestureTimer;
  self->_tellMeWhenGestureTimer = v8;

  _objc_release_x1(v8, tellMeWhenGestureTimer);
}

- (void)_clearArrowView
{
  double v3 = [(SCATGestureProvider *)self arrowView];
  [v3 removeFromSuperview];

  [(SCATGestureProvider *)self setArrowView:0];
}

- (void)_setNumberOfFingersForGestures:(unint64_t)a3
{
  if (self->_numberOfFingersForGestures != a3)
  {
    self->_numberOfFingersForGestures = a3;
    [(SCATGestureProvider *)self _updateVisibleFingers];
    id v5 = +[HNDDefaults sharedDefaults];
    double v4 = +[NSNumber numberWithInteger:a3];
    [v5 setPreference:v4 forKey:@"ScannerNumberOfFingers"];
  }
}

- (unint64_t)_numberOfFingersWithGestureSheet:(BOOL)a3
{
  if (a3) {
    return self->_numberOfFingersForGestures;
  }
  if ([(SCATGestureProvider *)self lineGestureState]) {
    return self->_numberOfFingersForGestures;
  }
  double v4 = [(SCATGestureProvider *)self currentSwitchController];

  if (v4) {
    return self->_numberOfFingersForGestures;
  }
  else {
    return 1;
  }
}

- (unint64_t)_numberOfFingers
{
  BOOL v3 = [(SCATMenu *)self->_menu containsGestureSheet];

  return [(SCATGestureProvider *)self _numberOfFingersWithGestureSheet:v3];
}

- (void)_setShowsFingers:(BOOL)a3
{
  if (self->_showsFingers != a3)
  {
    BOOL v3 = a3;
    self->_showsFingers = a3;
    [(SCATGestureProvider *)self _updateVisibleFingers];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained gestureProvider:self didShowFingers:v3];
  }
}

- (void)_updateShowsFingers
{
  unsigned int v3 = [(SCATGestureProvider *)self isHidden];
  if ((v3 & 1) != 0
    || (id)[(SCATMenu *)self->_menu tipObject] == (id)1
    || [(SCATGestureProvider *)self lineGestureState])
  {
    [(SCATGestureProvider *)self _setShowsFingers:v3 ^ 1];
  }
  else
  {
    id v5 = [(SCATGestureProvider *)self currentSwitchController];
    if (v5) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = [(SCATGestureProvider *)self shouldAllowFingersForContinuousGesture];
    }
    [(SCATGestureProvider *)self _setShowsFingers:v4];
  }
}

- (CGRect)_rectForFingers:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATGestureProvider *)self _fingerController];
  [v5 rectForFingersAtPoints:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)_rectToClearForPinchGesture
{
  [(SCATGestureProvider *)self _startingPointForGestures];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(SCATGestureProvider *)self _fingerController];
  double v8 = [v7 fingerContainerView];
  [v8 bounds];
  double v13 = +[AXPIFingerUtilities defaultPinchLocationsAroundPoint:withinBounds:](AXPIFingerUtilities, "defaultPinchLocationsAroundPoint:withinBounds:", v4, v6, v9, v10, v11, v12);
  [(SCATGestureProvider *)self _rectForFingers:v13];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)rectToClearForFingersWithGestureSheet:(BOOL)a3
{
  BOOL v3 = a3;
  [(SCATGestureProvider *)self _startingPointForGestures];
  double v6 = v5;
  double v8 = v7;
  unint64_t v9 = [(SCATGestureProvider *)self _numberOfFingersWithGestureSheet:v3];
  double v10 = [(SCATGestureProvider *)self _fingerController];
  double v11 = [v10 fingerContainerView];
  [v11 bounds];
  double v16 = +[AXPIFingerUtilities defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:](AXPIFingerUtilities, "defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:", v9, v6, v8, v12, v13, v14, v15);

  [(SCATGestureProvider *)self _rectForFingers:v16];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  double v28 = v24;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (void)_clearLineGestureState
{
  if ([(SCATGestureProvider *)self lineGestureState])
  {
    [(SCATGestureProvider *)self setLineGestureState:0];
    BOOL v3 = [(SCATGestureProvider *)self currentSwitchController];
    lineGesturePointPicker = self->_lineGesturePointPicker;

    if (v3 == lineGesturePointPicker)
    {
      [(SCATGestureProvider *)self setCurrentSwitchController:0];
      double v5 = self->_lineGesturePointPicker;
      self->_lineGesturePointPicker = 0;
    }
    else
    {
      [(SCATGestureProvider *)self _updateShowsFingers];
    }
    [(SCATGestureProvider *)self _clearArrowView];
  }
}

- (id)_promptForLineGesture:(unint64_t)a3
{
  if (a3 > 3)
  {
    double v4 = 0;
  }
  else
  {
    double v4 = sub_100040EC8(off_1001AD220[a3]);
  }
  return v4;
}

- (void)_startPickingEndPointForLineGesture:(unint64_t)a3
{
  if ([(SCATGestureProvider *)self lineGestureState]
    && (id)[(SCATGestureProvider *)self lineGestureState] != (id)2)
  {
    unint64_t v20 = [(SCATGestureProvider *)self lineGestureState];
    _AXAssert();
  }
  -[SCATGestureProvider setLineGestureState:](self, "setLineGestureState:", 1, v20);
  [(SCATGestureProvider *)self setLineGestureType:a3];
  lineGesturePointPicker = self->_lineGesturePointPicker;
  if (!lineGesturePointPicker)
  {
    double v6 = +[AXSettings sharedInstance];
    id v7 = [v6 assistiveTouchScanningMode];

    if (v7) {
      +[SCATPointPicker mostSuitablePointPickerWithMenu:self->_menu];
    }
    else {
    double v8 = +[SCATPointPicker pointPickerWithMode:1 menu:self->_menu];
    }
    [(SCATPointPicker *)v8 setShouldKeepScannerAwake:1];
    [(SCATPointPicker *)v8 setDelegate:self];
    unint64_t v9 = self->_lineGesturePointPicker;
    self->_lineGesturePointPicker = v8;

    lineGesturePointPicker = self->_lineGesturePointPicker;
  }
  double v10 = [(SCATElementManager *)lineGesturePointPicker visualProvider];
  double v11 = [(SCATGestureProvider *)self _promptForLineGesture:a3];
  [v10 setPrompt:v11];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SCATElementManager *)self->_lineGesturePointPicker redisplayIfNeeded:0];
    if (a3 == 3)
    {
      [(SCATGestureProvider *)self _startingPointForGestures];
      double v13 = v12;
      double v15 = v14;
      -[SCATPointPicker moveToPoint:](self->_lineGesturePointPicker, "moveToPoint:");
      [(SCATPointPicker *)self->_lineGesturePointPicker pressFingersDown:1];
      double v16 = +[SCATScannerManager sharedManager];
      objc_msgSend(v16, "overrideMotionTrackerLookAtPoint:", v13, v15);

      double v17 = +[SCATScannerManager sharedManager];
      [v17 addPointerPointPickerForMovementNotifications:self->_lineGesturePointPicker];

      [(SCATGestureProvider *)self _setShowsFingers:0];
    }
    else
    {
      double v18 = +[SCATScannerManager sharedManager];
      [v18 addPointerPointPickerForMovementNotifications:self->_lineGesturePointPicker];
    }
  }
  [(SCATGestureProvider *)self _clearArrowView];
  double v19 = self->_lineGesturePointPicker;

  [(SCATGestureProvider *)self setCurrentSwitchController:v19];
}

- (void)_startConfirmingLineGestureWithEndpoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ((id)[(SCATGestureProvider *)self lineGestureState] != (id)1)
  {
    unint64_t v15 = [(SCATGestureProvider *)self lineGestureState];
    _AXAssert();
  }
  -[SCATGestureProvider setLineGestureState:](self, "setLineGestureState:", 2, v15);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (+[SCATScannerManager sharedManager],
        double v6 = objc_claimAutoreleasedReturnValue(),
        [v6 removePointerPointPickerForMovementNotifications:self->_lineGesturePointPicker],
        v6,
        self->_lineGestureType == 3))
  {
    [(SCATPointPicker *)self->_lineGesturePointPicker pressFingersDown:0];
    [(SCATGestureProvider *)self _clearLineGestureState];
  }
  else
  {
    lineGesturePointPicker = self->_lineGesturePointPicker;
    self->_lineGesturePointPicker = 0;

    [(SCATGestureProvider *)self setCurrentSwitchController:0];
    -[SCATGestureProvider setEndPointForLineGesture:](self, "setEndPointForLineGesture:", x, y);
    double v16 = [(SCATModernMenuSheet *)[SCATModernMenuConfirmGestureSheet alloc] initWithMenu:self->_menu];
    [(SCATModernMenuConfirmGestureSheet *)v16 setDelegate:self];
    [(SCATMenu *)self->_menu presentWithRootLevelSheet:v16 useCurrentElementAndPoint:1];
    [(SCATGestureProvider *)self _startingPointForGestures];
    double v9 = v8;
    double v11 = v10;
    double v12 = objc_alloc_init(SCATGestureArrowView);
    [(SCATGestureArrowView *)v12 setStyle:6];
    -[SCATGestureArrowView setStartPoint:endPoint:](v12, "setStartPoint:endPoint:", v9, v11, x, y);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v14 = [WeakRetained contentViewForGestureProvider:self];

    [v14 insertSubview:v12 atIndex:0];
    [(SCATGestureProvider *)self setArrowView:v12];
  }
}

- (void)didChooseFavorites:(id)a3
{
  double v4 = [[SCATModernMenuCustomGesturesSheet alloc] initWithType:0 menu:self->_menu];
  [(SCATModernMenuCustomGesturesSheet *)v4 setDelegate:self];
  [(SCATMenu *)self->_menu pushSheet:v4];
}

- (void)didChooseFlickGesture:(id)a3
{
  double v4 = [(SCATModernMenuSheet *)[SCATModernMenuGestureFlickSheet alloc] initWithMenu:self->_menu];
  [(SCATModernMenuGestureFlickSheet *)v4 setDelegate:self];
  [(SCATMenu *)self->_menu pushSheet:v4];
}

- (void)didChoosePanGesture:(id)a3
{
  double v4 = [(SCATModernMenuSheet *)[SCATModernMenuGesturePanSheet alloc] initWithMenu:self->_menu];
  [(SCATModernMenuGesturePanSheet *)v4 setDelegate:self];
  [(SCATMenu *)self->_menu pushSheet:v4];
}

- (void)didChoosePinchGesture:(id)a3
{
  double v4 = [(SCATModernMenuSheet *)[SCATModernMenuGesturePinchSheet alloc] initWithMenu:self->_menu];
  [(SCATModernMenuGesturePinchSheet *)v4 setDelegate:self];
  [(SCATMenu *)self->_menu pushSheet:v4];
}

- (void)didChooseDragGesture:(id)a3
{
}

- (void)didChooseHoldAndDragGesture:(id)a3
{
}

- (void)toggleActiveHoldAndDragGestureAtScreenPoint:(CGPoint)a3 withDisplayID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  double y = a3.y;
  double x = a3.x;
  if ((id)[(SCATGestureProvider *)self lineGestureState] == (id)1)
  {
    double v8 = CGPointZero.y;
    -[SCATGestureProvider _startConfirmingLineGestureWithEndpoint:](self, "_startConfirmingLineGestureWithEndpoint:", CGPointZero.x, v8);
  }
  else
  {
    +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", x, y);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [(SCATGestureProvider *)self _updateStartingPointForGesturesWithScreenPoint:v9 forDisplayID:v4];
    [(SCATGestureProvider *)self _startPickingEndPointForLineGesture:3];
  }
}

- (void)didChooseActiveHoldAndDragGesture:(id)a3
{
  uint64_t v4 = [a3 menu];
  -[SCATGestureProvider setStartingDisplayIDForGestures:](self, "setStartingDisplayIDForGestures:", [v4 currentDisplayID]);

  [(SCATGestureProvider *)self _startPickingEndPointForLineGesture:3];
}

- (void)didChooseDoubleTapGesture:(id)a3
{
  uint64_t v4 = [a3 menu];
  -[SCATGestureProvider setStartingDisplayIDForGestures:](self, "setStartingDisplayIDForGestures:", [v4 currentDisplayID]);

  [(SCATGestureProvider *)self _performTapGestureForDoubleTap:1];

  [(SCATGestureProvider *)self _updateVisibleFingers];
}

- (void)didChooseFingers:(id)a3
{
  uint64_t v4 = [a3 menu];
  -[SCATGestureProvider setStartingDisplayIDForGestures:](self, "setStartingDisplayIDForGestures:", [v4 currentDisplayID]);

  double v5 = [(SCATModernMenuSheet *)[SCATModernMenuGestureFingersSheet alloc] initWithMenu:self->_menu];
  [(SCATModernMenuGestureFingersSheet *)v5 setDelegate:self];
  [(SCATMenu *)self->_menu pushSheet:v5];
}

- (void)didChooseDrawingGesture:(id)a3
{
  uint64_t v4 = [a3 menu];
  -[SCATGestureProvider setStartingDisplayIDForGestures:](self, "setStartingDisplayIDForGestures:", [v4 currentDisplayID]);

  double v5 = [SCATGestureDrawingElementManager alloc];
  double v6 = [(SCATGestureProvider *)self _startingPointsAsStrings];
  id v7 = [(SCATGestureDrawingElementManager *)v5 initWithStartingFingerPositions:v6 menu:self->_menu];

  double v8 = [(SCATGestureDrawingElementManager *)v7 drawingViewController];
  [v8 setDelegate:self];

  [(SCATGestureProvider *)self setCurrentSwitchController:v7];
  drawingElementManager = self->_drawingElementManager;
  self->_drawingElementManager = v7;

  [(SCATGestureProvider *)self setAlphaForFingers:0.0];
}

- (unint64_t)numberOfFingers
{
  return self->_numberOfFingersForGestures;
}

- (void)_didChooseFlickWithAngle:(double)a3 name:(id)a4
{
  [(SCATGestureProvider *)self _performFlickGestureWithAngle:a4 name:a3];

  [(SCATGestureProvider *)self _updateVisibleFingers];
}

- (void)didChooseFlickDown:(id)a3
{
}

- (void)didChooseFlickUp:(id)a3
{
}

- (void)didChooseFlickLeft:(id)a3
{
}

- (void)didChooseFlickRight:(id)a3
{
}

- (void)didChooseArbitraryFlick:(id)a3
{
}

- (void)didChooseForceTouchGesture:(id)a3
{
  [(SCATGestureProvider *)self _performForceTouchGesture];

  [(SCATGestureProvider *)self _updateVisibleFingers];
}

- (void)_didChoosePanWithName:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  double v10 = [(SCATModernMenuSheet *)[SCATModernMenuStopContinuousGestureSheet alloc] initWithMenu:self->_menu];
  [(SCATModernMenuStopContinuousGestureSheet *)v10 setDelegate:self];
  [(SCATMenu *)self->_menu pushSheet:v10];
  [(SCATGestureProvider *)self _prepareToBeginContinuousGesture];
  id v7 = [(SCATGestureProvider *)self _fingerController];
  double v8 = [v7 legacyPressFingersDown];

  [(SCATGestureProvider *)self _startTellMeWhenTimerWithSelector:a4];
  [(SCATGestureProvider *)self _initializeContinuousGestureDataWithName:v6 points:v8];

  id v9 = [(SCATGestureProvider *)self _startingPointsAsStrings];
  [(SCATGestureProvider *)self setPanFingerPositions:v9];
}

- (void)didChoosePanLeft:(id)a3
{
}

- (void)didChoosePanRight:(id)a3
{
}

- (void)didChoosePanUp:(id)a3
{
}

- (void)didChoosePanDown:(id)a3
{
}

- (void)_didChoosePinchItemWithName:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  unint64_t v15 = [(SCATModernMenuSheet *)[SCATModernMenuStopContinuousGestureSheet alloc] initWithMenu:self->_menu];
  [(SCATModernMenuStopContinuousGestureSheet *)v15 setDelegate:self];
  [(SCATMenu *)self->_menu pushSheet:v15];
  [(SCATGestureProvider *)self _prepareToBeginContinuousGesture];
  id v7 = [(SCATGestureProvider *)self _fingerController];
  double v8 = [v7 legacyPressFingersDown];

  [(SCATGestureProvider *)self _startTellMeWhenTimerWithSelector:a4];
  [(SCATGestureProvider *)self _initializeContinuousGestureDataWithName:v6 points:v8];

  if ([v8 count] != (id)2) {
    _AXAssert();
  }
  id v9 = [v8 objectAtIndex:0];
  CGPoint v10 = CGPointFromString(v9);

  double v11 = [v8 objectAtIndex:1];
  CGPointFromString(v11);

  AX_CGPointGetMidpointToPoint();
  -[SCATGestureProvider setPinchFulcrum:](self, "setPinchFulcrum:");
  [(SCATGestureProvider *)self pinchFulcrum];
  long double v13 = v10.y - v12;
  [(SCATGestureProvider *)self pinchFulcrum];
  [(SCATGestureProvider *)self setPinchAngle:(double)atan2(v13, v10.x - v14)];
  [(SCATGestureProvider *)self pinchFulcrum];
  AX_CGPointGetDistanceToPoint();
  -[SCATGestureProvider setPinchRadius:](self, "setPinchRadius:");
  [(SCATGestureProvider *)self setPinchFingerOriginalPositions:v8];
}

- (void)didChoosePinchIn:(id)a3
{
}

- (void)didChoosePinchOut:(id)a3
{
}

- (void)didChooseRotateClockwise:(id)a3
{
}

- (void)didChooseRotateCounterclockwise:(id)a3
{
}

- (void)didPushPinchItemsViewController:(id)a3
{
}

- (void)didChooseStop:(id)a3
{
  [(SCATGestureProvider *)self _clearTellMeWhenTimer];

  [(SCATGestureProvider *)self _handleCompletedContinuousGesture];
}

- (CGRect)rectToClearForStop:(id)a3
{
  if ([(SCATGestureProvider *)self isPinching])
  {
    [(SCATGestureProvider *)self _rectToClearForPinchGesture];
  }
  else
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)nameForConfirmationButton:(id)a3
{
  unint64_t v3 = [(SCATGestureProvider *)self lineGestureType];
  if (v3 > 2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = sub_100040EC8(off_1001AD240[v3]);
  }

  return v4;
}

- (void)didConfirmGesture:(id)a3
{
  [(SCATGestureProvider *)self _finishLineGesture];

  [(SCATGestureProvider *)self _clearLineGestureState];
}

- (void)didRequestRedoGesture:(id)a3
{
  unint64_t v4 = [(SCATGestureProvider *)self lineGestureType];

  [(SCATGestureProvider *)self _startPickingEndPointForLineGesture:v4];
}

- (void)fingerItemsViewController:(id)a3 didChooseNumberOfFingers:(unint64_t)a4
{
  [(SCATGestureProvider *)self _setNumberOfFingersForGestures:a4];
  menu = self->_menu;

  [(SCATMenu *)menu popSheet];
}

- (id)contextForCustomGestureItemsViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v5 = [WeakRetained contentViewForGestureProvider:self];

  return v5;
}

- (id)_repositionedGestureFromOriginalGesture:(id)a3
{
  id v4 = a3;
  double v5 = [(SCATGestureProvider *)self _fingerController];
  [v5 midpointOfStartingFingersForGesture:v4];
  double v7 = v6;
  double v9 = v8;

  [(SCATGestureProvider *)self _startingPointForGestures];
  double v12 = objc_msgSend(v4, "gestureShiftedByOffset:", v10 - v7, v11 - v9);

  [v12 setShouldPerformAtOriginalLocation:1];

  return v12;
}

- (void)customGestureItemsViewController:(id)a3 didChooseGesture:(id)a4
{
  id v11 = a4;
  if ([a3 type] == 1)
  {
    double v6 = +[AXSettings sharedInstance];
    double v7 = [v6 assistiveTouchSavedGestures];
    id v8 = [v7 mutableCopy];

    if (!v8) {
      id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
    }
    [v8 addObject:v11];
    [v6 setAssistiveTouchSavedGestures:v8];
    [(SCATMenu *)self->_menu popSheet];
  }
  else
  {
    if ([v11 shouldPerformAtOriginalLocation])
    {
      id v9 = v11;
    }
    else
    {
      uint64_t v10 = [(SCATGestureProvider *)self _repositionedGestureFromOriginalGesture:v11];

      id v9 = (id)v10;
    }
    id v11 = v9;
    [(SCATGestureProvider *)self _performGesture:v9];
    [(SCATGestureProvider *)self _updateVisibleFingers];
  }
}

- (void)didChooseAddRecentInCustomGestureItemsViewController:(id)a3
{
  id v4 = [[SCATModernMenuCustomGesturesSheet alloc] initWithType:1 menu:self->_menu];
  [(SCATModernMenuCustomGesturesSheet *)v4 setDelegate:self];
  [(SCATMenu *)self->_menu pushSheet:v4];
}

- (void)didChooseCreateInCustomGestureItemsViewController:(id)a3
{
  id v4 = [(SCATGestureProvider *)self delegate];
  [v4 didChooseCreateCustomGestureFromGestureProvider:self];
}

- (void)setShouldAllowFingersForContinuousGesture:(BOOL)a3
{
  if (self->_shouldAllowFingersForContinuousGesture != a3)
  {
    self->_shouldAllowFingersForContinuousGesture = a3;
    [(SCATGestureProvider *)self _updateShowsFingers];
  }
}

- (void)performTapAndHold
{
  double v5 = [(SCATModernMenuSheet *)[SCATModernMenuStopContinuousGestureSheet alloc] initWithMenu:self->_menu];
  [(SCATModernMenuStopContinuousGestureSheet *)v5 setDelegate:self];
  [(SCATMenu *)self->_menu pushSheet:v5];
  [(SCATGestureProvider *)self setShouldAllowFingersForContinuousGesture:1];
  [(SCATGestureProvider *)self _prepareToBeginContinuousGesture];
  unint64_t v3 = [(SCATGestureProvider *)self _fingerController];
  id v4 = [v3 legacyPressFingersDown];

  [(SCATGestureProvider *)self _initializeContinuousGestureDataWithName:@"TAP_AND_HOLD" points:v4];
}

- (void)performTap
{
  [(SCATGestureProvider *)self _performTapGestureForDoubleTap:0];

  [(SCATGestureProvider *)self _updateVisibleFingers];
}

- (id)gesturesSheet
{
  unint64_t v3 = [SCATModernMenuGesturesSheet alloc];
  menu = self->_menu;
  double v5 = +[AXSettings sharedInstance];
  double v6 = [v5 switchControlGesturesMenuItems];
  double v7 = [(SCATModernMenuSimpleSheet *)v3 initWithMenu:menu menuItemDictionaryArray:v6];

  return v7;
}

- (void)replayGesture:(id)a3
{
  id v4 = a3;
  [(SCATGestureProvider *)self _fingerController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100087C28;
  v6[3] = &unk_1001AACE0;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v7;
  [v5 performGesture:v4 completion:v6];
}

- (void)performHoldAtPoint:(CGPoint)a3 isDown:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  id v8 = SWCHLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100115080(v4, v8, x, y);
  }

  double v10 = AXSwitchRecipeHoldPointNone[0];
  double v9 = AXSwitchRecipeHoldPointNone[1];
  if (x == AXSwitchRecipeHoldPointNone[0] && y == v9) {
    _AXAssert();
  }
  [(SCATGestureProvider *)self currentHoldPoint];
  if (v4)
  {
    if (v12 != v10 || v13 != v9)
    {
      unint64_t v15 = SWCHLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_100114FA0(self, v15);
      }

      double v16 = [(SCATGestureProvider *)self _fingerController];
      [v16 liftFingersUpAnimated:1];
    }
    -[SCATGestureProvider setCurrentHoldPoint:](self, "setCurrentHoldPoint:", x, y);
    [(SCATGestureProvider *)self _setShowsFingers:1];
    [(SCATGestureProvider *)self _updateVisibleFingers];
    double v17 = [(SCATGestureProvider *)self _fingerController];
    [v17 pressFingersDownAnimated:1];
  }
  else
  {
    if (v12 == x && v13 == y)
    {
      double v18 = [(SCATGestureProvider *)self _fingerController];
      [v18 liftFingersUpAnimated:1];

      [(SCATGestureProvider *)self _setShowsFingers:0];
      [(SCATGestureProvider *)self _updateVisibleFingers];
      -[SCATGestureProvider setCurrentHoldPoint:](self, "setCurrentHoldPoint:", v10, v9);
      return;
    }
    double v17 = SWCHLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10011503C(v17);
    }
  }
}

- (void)menuWillAppear:(id)a3
{
  id v5 = a3;
  if ((id)[(SCATGestureProvider *)self lineGestureState] != (id)2)
  {
    BOOL v4 = [v5 screenPoint];
    -[SCATGestureProvider _updateStartingPointForGesturesWithScreenPoint:forDisplayID:](self, "_updateStartingPointForGesturesWithScreenPoint:forDisplayID:", v4, [v5 currentDisplayID]);
  }
  [(SCATGestureProvider *)self _updateShowsFingers];
}

- (void)menuDidAppear:(id)a3
{
  BOOL v4 = [a3 currentSheet];
  unsigned int v5 = [v4 allowsExitAction];

  double v6 = 1.0;
  if (v5) {
    double v6 = 0.5;
  }

  [(SCATGestureProvider *)self setAlphaForFingers:v6];
}

- (void)menuWillDisappear:(id)a3
{
}

- (void)menuDidDisappear:(id)a3
{
  if ((id)[(SCATGestureProvider *)self lineGestureState] == (id)2) {
    [(SCATGestureProvider *)self _clearLineGestureState];
  }
  if ([(SCATGestureProvider *)self _isPerformingContinuousGesture])
  {
    [(SCATGestureProvider *)self _clearTellMeWhenTimer];
    [(SCATGestureProvider *)self _handleCompletedContinuousGesture];
  }
  else
  {
    [(SCATGestureProvider *)self _updateVisibleFingers];
  }
  if ([(SCATGestureProvider *)self isPinching]) {
    [(SCATGestureProvider *)self _endPinchMode];
  }

  [(SCATGestureProvider *)self _updateShowsFingers];
}

- (void)menuDidFinishTransition:(id)a3
{
  if (![(SCATGestureProvider *)self _isPerformingContinuousGesture])
  {
    [(SCATGestureProvider *)self _updateVisibleFingers];
  }
}

- (void)pointPicker:(id)a3 didPickPoint:(CGPoint)a4
{
}

- (BOOL)pointPicker:(id)a3 pauseForNumberOfCycles:(unint64_t)a4
{
  return 0;
}

- (void)touchDownForDrawingViewController:(id)a3
{
  BOOL v4 = [(SCATGestureProvider *)self _fingerController];
  id v5 = [v4 legacyPressFingersDown];

  [(SCATGestureProvider *)self _initializeContinuousGestureDataWithName:@"DRAWING" points:v5];
}

- (void)touchUpForDrawingViewController:(id)a3
{
  if ([(SCATGestureProvider *)self _isPerformingContinuousGesture])
  {
    [(SCATGestureProvider *)self _handleCompletedContinuousGesture];
  }
}

- (BOOL)drawingViewController:(id)a3 moveFingersToPoints:(id)a4
{
  id v5 = a4;
  double v6 = [(SCATGestureProvider *)self _fingerController];
  unsigned int v7 = [v6 moveFingersToPoints:v5];

  if (v7 && [(SCATGestureProvider *)self _isPerformingContinuousGesture]) {
    [(SCATGestureProvider *)self _addPointsToContinuousGestureData:v5];
  }

  return v7;
}

- (void)exitDrawingViewController:(id)a3
{
  drawingElementManager = self->_drawingElementManager;
  if (drawingElementManager)
  {
    self->_drawingElementManager = 0;

    [(SCATGestureProvider *)self setCurrentSwitchController:0];
  }
}

- (void)drawingViewController:(id)a3 shouldResetScanningFromElement:(id)a4
{
  id v9 = a4;
  double v6 = [a3 drawingElementManager];
  unsigned int v7 = [(SCATGestureProvider *)self currentSwitchController];

  if (v6 == v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained gestureProvider:self shouldResetScanningFromElement:v9];
  }
}

- (void)setCurrentSwitchController:(id)a3
{
  id v5 = (SCATElementManager *)a3;
  p_currentSwitchController = &self->_currentSwitchController;
  if (self->_currentSwitchController != v5)
  {
    id v8 = v5;
    if (v5)
    {
      objc_storeStrong((id *)&self->_currentSwitchController, a3);
      [(SCATGestureProvider *)self _requestSwitchControllerPrivileges];
    }
    else
    {
      [(SCATGestureProvider *)self _resignSwitchControllerPrivileges];
      unsigned int v7 = *p_currentSwitchController;
      *p_currentSwitchController = 0;
    }
    [(SCATGestureProvider *)self _updateShowsFingers];
    id v5 = v8;
  }
}

- (void)_requestSwitchControllerPrivileges
{
  self->_needsScanning = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shouldStartScanningGestureProvider:self];
}

- (void)_resignSwitchControllerPrivileges
{
  self->_needsScanning = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shouldEndScanningGestureProvider:self];
}

- (BOOL)canBeActiveElementManager
{
  return self->_needsScanning;
}

- (id)firstElementWithOptions:(int *)a3
{
  BOOL v4 = [(SCATGestureProvider *)self currentSwitchController];
  id v5 = [v4 firstElementWithOptions:a3];

  return v5;
}

- (id)lastElementWithOptions:(int *)a3
{
  BOOL v4 = [(SCATGestureProvider *)self currentSwitchController];
  id v5 = [v4 lastElementWithOptions:a3];

  return v5;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v8 = a3;
  id v9 = [(SCATGestureProvider *)self currentSwitchController];
  double v10 = [v9 elementAfter:v8 didWrap:a4 options:a5];

  return v10;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v8 = a3;
  id v9 = [(SCATGestureProvider *)self currentSwitchController];
  double v10 = [v9 elementBefore:v8 didWrap:a4 options:a5];

  return v10;
}

- (void)scannerWillMakeManagerActive:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATGestureProvider *)self currentSwitchController];
  [v5 scannerWillMakeManagerActive:v4];
}

- (void)scannerWillMakeManagerActive:(id)a3 forDisplayID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(SCATGestureProvider *)self currentSwitchController];
  [v7 scannerWillMakeManagerActive:v6 forDisplayID:v4];
}

- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SCATGestureProvider *)self currentSwitchController];
  [v8 scannerWillMakeManagerInactive:v7 activeElementManager:v6];
}

- (BOOL)shouldKeepScannerAwake
{
  double v2 = [(SCATGestureProvider *)self currentSwitchController];
  unsigned __int8 v3 = [v2 shouldKeepScannerAwake];

  return v3;
}

- (BOOL)allowsDwellSelection
{
  double v2 = [(SCATGestureProvider *)self currentSwitchController];
  unsigned __int8 v3 = [v2 allowsDwellSelection];

  return v3;
}

- (BOOL)allowsDwellScanningToAbortAfterTimeout
{
  double v2 = [(SCATGestureProvider *)self currentSwitchController];
  unsigned __int8 v3 = [v2 allowsDwellScanningToAbortAfterTimeout];

  return v3;
}

- (BOOL)handleInputAction:(id)a3 withElement:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SCATGestureProvider *)self currentSwitchController];
  unsigned __int8 v9 = [v8 handleInputAction:v7 withElement:v6];

  return v9;
}

- (void)driver:(id)a3 willFocusOnContext:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SCATGestureProvider;
  id v6 = a4;
  id v7 = a3;
  [(SCATElementManager *)&v9 driver:v7 willFocusOnContext:v6];
  id v8 = [(SCATGestureProvider *)self currentSwitchController];
  [v8 driver:v7 willFocusOnContext:v6];
}

- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)SCATGestureProvider;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(SCATElementManager *)&v12 driver:v10 didFocusOnContext:v9 oldContext:v8];
  id v11 = [(SCATGestureProvider *)self currentSwitchController];
  [v11 driver:v10 didFocusOnContext:v9 oldContext:v8];
}

- (void)driver:(id)a3 willUnfocusFromContext:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SCATGestureProvider;
  id v6 = a4;
  id v7 = a3;
  [(SCATElementManager *)&v9 driver:v7 willUnfocusFromContext:v6];
  id v8 = [(SCATGestureProvider *)self currentSwitchController];
  [v8 driver:v7 willUnfocusFromContext:v6];
}

- (void)fingersElement:(id)a3 didBecomeFocused:(BOOL)a4
{
  if (a4) {
    -[SCATGestureProvider setAlphaForFingers:](self, "setAlphaForFingers:", a3, 1.0);
  }
  else {
    -[SCATGestureProvider setAlphaForFingers:](self, "setAlphaForFingers:", a3, 0.5);
  }
}

- (void)didActivateFingersElement:(id)a3
{
}

- (void)systemApertureLayoutDidChange:(id)a3
{
  id v24 = a3;
  if ([v24 count] == (id)1)
  {
    p_foreheadRect = &self->_foreheadRect;
    id v5 = [v24 objectAtIndexedSubscript:0];
    [v5 CGRectValue];
    p_foreheadRect->origin.double x = v6;
    p_foreheadRect->origin.double y = v7;
    p_foreheadRect->size.double width = v8;
    p_foreheadRect->size.double height = v9;
  }
  else
  {
    if ([v24 count] != (id)2) {
      goto LABEL_6;
    }
    id v10 = &self->_foreheadRect;
    id v5 = [v24 objectAtIndexedSubscript:0];
    [v5 CGRectValue];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    double v19 = [v24 objectAtIndexedSubscript:1];
    [v19 CGRectValue];
    v27.origin.double x = v20;
    v27.origin.double y = v21;
    v27.size.double width = v22;
    v27.size.double height = v23;
    v26.origin.double x = v12;
    v26.origin.double y = v14;
    v26.size.double width = v16;
    v26.size.double height = v18;
    CGRect *v10 = CGRectUnion(v26, v27);
  }
LABEL_6:
}

- (SCATGestureProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATGestureProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (CGPoint)startingScreenPointForGestures
{
  double x = self->_startingScreenPointForGestures.x;
  double y = self->_startingScreenPointForGestures.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartingScreenPointForGestures:(CGPoint)a3
{
  self->_startingScreenPointForGestures = a3;
}

- (SCATElementManager)currentSwitchController
{
  return self->_currentSwitchController;
}

- (SCATGestureArrowView)arrowView
{
  return self->_arrowView;
}

- (void)setArrowView:(id)a3
{
}

- (unsigned)startingDisplayIDForGestures
{
  return self->_startingDisplayIDForGestures;
}

- (NSArray)panFingerPositions
{
  return self->_panFingerPositions;
}

- (void)setPanFingerPositions:(id)a3
{
}

- (BOOL)isPinching
{
  return self->_isPinching;
}

- (void)setIsPinching:(BOOL)a3
{
  self->_isPinching = a3;
}

- (NSArray)pinchFingerOriginalPositions
{
  return self->_pinchFingerOriginalPositions;
}

- (void)setPinchFingerOriginalPositions:(id)a3
{
}

- (CGPoint)pinchFulcrum
{
  double x = self->_pinchFulcrum.x;
  double y = self->_pinchFulcrum.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPinchFulcrum:(CGPoint)a3
{
  self->_pinchFulcrum = a3;
}

- (double)pinchRadius
{
  return self->_pinchRadius;
}

- (void)setPinchRadius:(double)a3
{
  self->_pinchRadius = a3;
}

- (double)pinchAngle
{
  return self->_pinchAngle;
}

- (void)setPinchAngle:(double)a3
{
  self->_pinchAngle = a3;
}

- (unint64_t)lineGestureState
{
  return self->_lineGestureState;
}

- (void)setLineGestureState:(unint64_t)a3
{
  self->_lineGestureState = a3;
}

- (unint64_t)lineGestureType
{
  return self->_lineGestureType;
}

- (void)setLineGestureType:(unint64_t)a3
{
  self->_lineGestureType = a3;
}

- (CGPoint)endPointForLineGesture
{
  double x = self->_endPointForLineGesture.x;
  double y = self->_endPointForLineGesture.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setEndPointForLineGesture:(CGPoint)a3
{
  self->_endPointForLineGesture = a3;
}

- (BOOL)shouldAllowFingersForContinuousGesture
{
  return self->_shouldAllowFingersForContinuousGesture;
}

- (double)alphaForFingers
{
  return self->_alphaForFingers;
}

- (CGPoint)currentHoldPoint
{
  double x = self->_currentHoldPoint.x;
  double y = self->_currentHoldPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentHoldPoint:(CGPoint)a3
{
  self->_currentHoldPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinchFingerOriginalPositions, 0);
  objc_storeStrong((id *)&self->_panFingerPositions, 0);
  objc_storeStrong((id *)&self->_arrowView, 0);
  objc_storeStrong((id *)&self->_currentSwitchController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_elementForFingers, 0);
  objc_storeStrong((id *)&self->_continuousGestureName, 0);
  objc_storeStrong((id *)&self->_continuousGestureTimes, 0);
  objc_storeStrong((id *)&self->_continuousGesturePoints, 0);
  objc_storeStrong((id *)&self->_drawingElementManager, 0);
  objc_storeStrong((id *)&self->_lineGesturePointPicker, 0);
  objc_storeStrong((id *)&self->_tellMeWhenGestureTimer, 0);

  objc_storeStrong((id *)&self->_menu, 0);
}

@end