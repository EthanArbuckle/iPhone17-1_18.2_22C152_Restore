@interface VOTMapsExplorationGestureManager
- (BOOL)explorationIsActive;
- (BOOL)explorationIsPending;
- (BOOL)handleSelection;
- (BOOL)handleTracking:(CGPoint)a3;
- (BOOL)handleVerbosityChangeIncreasing:(BOOL)a3;
- (BOOL)isBackspaceEvent:(id)a3;
- (BOOL)isNextBrailleTableEvent:(id)a3;
- (BOOL)isNextKeyboardLanguageEvent:(id)a3;
- (BOOL)isNextSuggestionEvent:(id)a3;
- (BOOL)isPreviousSuggestionEvent:(id)a3;
- (BOOL)isReturnKeyEvent:(id)a3;
- (BOOL)isRotorDownEvent:(id)a3;
- (BOOL)isRotorLeftEvent:(id)a3;
- (BOOL)isRotorRightEvent:(id)a3;
- (BOOL)isRotorUpEvent:(id)a3;
- (BOOL)isSelectItemEvent:(id)a3;
- (BOOL)isSpaceEvent:(id)a3;
- (BOOL)isTextSelectionBackwardEvent:(id)a3;
- (BOOL)isTextSelectionForwardEvent:(id)a3;
- (BOOL)isWordBackspaceEvent:(id)a3;
- (BOOL)processEvent:(id)a3;
- (BOOL)processTapWithFingerCount:(unint64_t)a3;
- (BOOL)processTouchLocations:(id)a3 isFirstTouch:(BOOL)a4;
- (VOTMapsExplorationGestureManager)init;
- (VOTMapsExplorationGestureManagerDelegate)mapsExplorationGestureManagerDelegate;
- (id)currentIntersectionInformation;
- (id)currentMap;
- (id)explorationSegmentsForRoadsWithAngles:(id)a3;
- (int64_t)indexForPoint:(CGPoint)a3;
- (void)_playSound:(id)a3;
- (void)_speakText:(id)a3 doesNotInterrupt:(BOOL)a4 cannotBeInterrupted:(BOOL)a5;
- (void)beginExploration;
- (void)endExploration;
- (void)processTouch:(CGPoint)a3;
- (void)setActive:(BOOL)a3;
- (void)setMapsExplorationGestureManagerDelegate:(id)a3;
- (void)updateCurrentLocation;
- (void)updateExplorationSegments;
@end

@implementation VOTMapsExplorationGestureManager

- (VOTMapsExplorationGestureManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)VOTMapsExplorationGestureManager;
  v2 = [(VOTGesturedTextInputManager *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(VOTMapsExplorationGestureManager *)v2 updateExplorationSegments];
    v3->_currentIndex = -1;
    v3->_selectionIndex = -1;
    v3->_movedAngle = 0.0;
    v3->_lastAngle = -1.0;
    v3->_recentlyMoved = 0;
    v3->_currentLocation = CGPointZero;
    v4 = +[UIScreen mainScreen];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;

    v3->_currentCenter.x = v6 * 0.5;
    v3->_currentCenter.y = v8 * 0.5;
  }
  return v3;
}

- (id)currentMap
{
  v2 = +[VOTWorkspace sharedWorkspace];
  v3 = [v2 currentElement];

  uint64_t v4 = kAXMapTrait;
  if (([v3 doesHaveTraits:kAXMapTrait] & 1) != 0
    || ([v3 touchContainer],
        double v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 doesHaveTraits:v4],
        v5,
        v6))
  {
    double v7 = +[VOTWorkspace sharedWorkspace];
    double v8 = [v7 currentElement];
    v9 = [v8 touchContainer];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updateExplorationSegments
{
  uint64_t v3 = +[VOTWorkspace sharedWorkspace];
  if (!v3) {
    goto LABEL_4;
  }
  uint64_t v4 = (void *)v3;
  double v5 = +[VOTWorkspace sharedWorkspace];
  unsigned int v6 = [v5 currentElement];

  if (v6)
  {
    double v7 = [(VOTMapsExplorationGestureManager *)self currentMap];
    uint64_t v10 = [v7 mapsExplorationCurrentRoadsWithAngles];

    double v8 = [(VOTMapsExplorationGestureManager *)self explorationSegmentsForRoadsWithAngles:v10];
    explorationSegments = self->_explorationSegments;
    self->_explorationSegments = v8;
  }
  else
  {
LABEL_4:
    self->_explorationSegments = (NSArray *)objc_opt_new();
  }

  _objc_release_x1();
}

- (void)updateCurrentLocation
{
  p_currentLocation = &self->_currentLocation;
  id v5 = [(VOTMapsExplorationGestureManager *)self currentMap];
  [v5 mapsExplorationCurrentLocation];
  p_currentLocation->x = v3;
  p_currentLocation->y = v4;
}

- (id)currentIntersectionInformation
{
  v2 = [(VOTMapsExplorationGestureManager *)self currentMap];
  CGFloat v3 = [v2 mapsExplorationCurrentIntersectionDescription];

  return v3;
}

- (BOOL)explorationIsActive
{
  v2 = [(VOTMapsExplorationGestureManager *)self currentMap];
  unsigned __int8 v3 = [v2 mapsExplorationIsActive];

  return v3;
}

- (BOOL)explorationIsPending
{
  v2 = [(VOTMapsExplorationGestureManager *)self currentMap];
  unsigned __int8 v3 = [v2 mapsExplorationIsPending];

  return v3;
}

- (void)beginExploration
{
  v2 = +[VOTWorkspace sharedWorkspace];
  id v3 = [v2 currentElement];

  objc_msgSend(v3, "mapsExplorationBeginFromCurrentElement:", objc_msgSend(v3, "mapFeatureType") == (id)1);
}

- (void)endExploration
{
  id v2 = [(VOTMapsExplorationGestureManager *)self currentMap];
  [v2 mapsExplorationEnd];
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(VOTGesturedTextInputManager *)self isActive];
  v9.receiver = self;
  v9.super_class = (Class)VOTMapsExplorationGestureManager;
  [(VOTGesturedTextInputManager *)&v9 setActive:v3];
  if (!v3 || (v5 & 1) != 0)
  {
    if (!v3 && ((v5 ^ 1) & 1) == 0)
    {
      double v8 = +[VOTDisplayManager displayManager];
      [v8 hideMapsExplorationUI];

      if ([(VOTMapsExplorationGestureManager *)self explorationIsActive]) {
        [(VOTMapsExplorationGestureManager *)self endExploration];
      }
    }
  }
  else
  {
    if (![(VOTMapsExplorationGestureManager *)self explorationIsActive]) {
      [(VOTMapsExplorationGestureManager *)self beginExploration];
    }
    [(VOTMapsExplorationGestureManager *)self updateExplorationSegments];
    unsigned int v6 = +[VOTDisplayManager displayManager];
    objc_msgSend(v6, "showMapsExplorationUIWithCenter:andData:", self->_explorationSegments, self->_currentCenter.x, self->_currentCenter.y);

    [(VOTMapsExplorationGestureManager *)self updateCurrentLocation];
    double v7 = +[VOTDisplayManager displayManager];
    objc_msgSend(v7, "updateMapsExplorationUIWithCurrentLocation:", self->_currentLocation.x, self->_currentLocation.y);
  }
}

- (BOOL)handleTracking:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[VOTMapsExplorationGestureManager processTouch:](self, "processTouch:");
  int64_t v6 = -[VOTMapsExplorationGestureManager indexForPoint:](self, "indexForPoint:", x, y);
  if (v6 != self->_currentIndex)
  {
    self->_currentIndedouble x = v6;
    if (v6 != -1)
    {
      self->_selectionIndedouble x = v6;
      double v7 = sub_100051804(off_1001EA9E8, @"one.of.many", 0);
      double v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, self->_selectionIndex + 1, [(NSArray *)self->_explorationSegments count]);

      objc_super v9 = [(NSArray *)self->_explorationSegments objectAtIndex:self->_selectionIndex];
      uint64_t v10 = [v9 objectAtIndex:2];

      v11 = __AXStringForVariables();
      [(VOTMapsExplorationGestureManager *)self _speakText:v11, 0, 0, v8, @"__AXStringForVariablesSentinel" doesNotInterrupt cannotBeInterrupted];

      v12 = +[VOTDisplayManager displayManager];
      [v12 highlightMapsExplorationSegmentWithIndex:self->_currentIndex];
    }
  }
  return 1;
}

- (BOOL)handleSelection
{
  if ((self->_selectionIndex & 0x8000000000000000) == 0)
  {
    BOOL v3 = +[VOTOutputManager outputManager];
    CGFloat v4 = +[VOSOutputEvent DidActivateElement];
    [v3 sendEvent:v4];

    unsigned int v5 = [(VOTMapsExplorationGestureManager *)self currentMap];
    [v5 mapsExplorationContinueWithVertexIndex:self->_selectionIndex];

    if ([(VOTMapsExplorationGestureManager *)self explorationIsPending])
    {
      do
        +[NSThread sleepForTimeInterval:1.0];
      while ([(VOTMapsExplorationGestureManager *)self explorationIsPending]);
    }
    [(VOTMapsExplorationGestureManager *)self updateExplorationSegments];
    int64_t v6 = +[VOTDisplayManager displayManager];
    objc_msgSend(v6, "showMapsExplorationUIWithCenter:andData:", self->_explorationSegments, self->_currentCenter.x, self->_currentCenter.y);

    [(VOTMapsExplorationGestureManager *)self updateCurrentLocation];
    double v7 = +[VOTDisplayManager displayManager];
    objc_msgSend(v7, "updateMapsExplorationUIWithCurrentLocation:", self->_currentLocation.x, self->_currentLocation.y);

    double v8 = [(VOTMapsExplorationGestureManager *)self currentIntersectionInformation];
    [(VOTMapsExplorationGestureManager *)self _speakText:v8 doesNotInterrupt:0 cannotBeInterrupted:0];

    self->_recentlyMoved = 1;
    self->_movedAngle = self->_lastAngle;
    self->_lastAngle = -1.0;
    self->_currentIndedouble x = -1;
    self->_selectionIndedouble x = -1;
  }
  return 1;
}

- (BOOL)handleVerbosityChangeIncreasing:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(VOTMapsExplorationGestureManager *)self currentMap];
  int64_t v6 = [v5 mapsExplorationChangeVerbosity:v3];

  [(VOTMapsExplorationGestureManager *)self _speakText:v6 doesNotInterrupt:0 cannotBeInterrupted:0];
  return 1;
}

- (BOOL)processEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 command];
  unsigned int v6 = [v5 isEqualToString:kVOTEventCommandTracking];

  if (v6)
  {
    [v4 touchPoint];
    unsigned __int8 v7 = -[VOTMapsExplorationGestureManager handleTracking:](self, "handleTracking:");
    goto LABEL_13;
  }
  double v8 = [v4 command];
  if ([v8 isEqualToString:kVOTEventCommandSplitTapTap])
  {

LABEL_6:
    unsigned __int8 v7 = [(VOTMapsExplorationGestureManager *)self handleSelection];
    goto LABEL_13;
  }
  objc_super v9 = [v4 command];
  unsigned int v10 = [v9 isEqualToString:kVOTEventCommandSimpleTap];

  if (v10) {
    goto LABEL_6;
  }
  v11 = [v4 command];
  unsigned int v12 = [v11 isEqualToString:kVOTEventCommandSearchRotorUp];

  if (v12)
  {
    v13 = self;
    uint64_t v14 = 1;
  }
  else
  {
    v15 = [v4 command];
    unsigned int v16 = [v15 isEqualToString:kVOTEventCommandSearchRotorDown];

    if (!v16)
    {
      v19.receiver = self;
      v19.super_class = (Class)VOTMapsExplorationGestureManager;
      unsigned __int8 v7 = [(VOTGesturedTextInputManager *)&v19 processEvent:v4];
      goto LABEL_13;
    }
    v13 = self;
    uint64_t v14 = 0;
  }
  unsigned __int8 v7 = [(VOTMapsExplorationGestureManager *)v13 handleVerbosityChangeIncreasing:v14];
LABEL_13:
  BOOL v17 = v7;

  return v17;
}

- (id)explorationSegmentsForRoadsWithAngles:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v11 = objc_opt_new();
        unsigned int v12 = objc_msgSend(v10, "objectAtIndex:", 1, (void)v25);
        [v11 addObject:v12];

        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  uint64_t v13 = (uint64_t)[v5 count];
  if (v13 >= 1)
  {
    uint64_t v14 = v13;
    for (uint64_t j = 0; j != v14; ++j)
    {
      unsigned int v16 = objc_msgSend(v5, "objectAtIndex:", j, (void)v25);
      BOOL v17 = [v16 firstObject];
      [v17 floatValue];
      double v19 = v18;

      v20 = [v4 objectAtIndex:j];
      v21 = +[NSNumber numberWithDouble:v19 + 0.400000006];
      [v20 insertObject:v21 atIndex:0];

      v22 = [v4 objectAtIndex:j];
      v23 = +[NSNumber numberWithDouble:v19 + -0.400000006];
      [v22 insertObject:v23 atIndex:0];
    }
  }

  return v4;
}

- (void)processTouch:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_currentCenter = &self->_currentCenter;
  SCRCMathGetDistanceBetweenPoints();
  if (v6 > 200.0)
  {
    double v7 = (x - p_currentCenter->x) / v6;
    double v8 = v6 + -200.0;
    double v9 = (y - p_currentCenter->y) / v6;
    unsigned int v10 = +[UIScreen mainScreen];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;

    double v15 = v12 + -200.0;
    if (v12 + -200.0 >= p_currentCenter->x + v7 * (v8 + 5.0)) {
      double v15 = p_currentCenter->x + v7 * (v8 + 5.0);
    }
    double v16 = fmax(v15, 200.0);
    double v17 = p_currentCenter->y + v9 * (v8 + 5.0);
    if (v14 + -200.0 < v17) {
      double v17 = v14 + -200.0;
    }
    p_currentCenter->double x = v16;
    p_currentCenter->double y = fmax(v17, 200.0);
    id v18 = +[VOTDisplayManager displayManager];
    objc_msgSend(v18, "updateMapsExplorationUIWithCurrentCenter:", p_currentCenter->x, p_currentCenter->y);
  }
}

- (int64_t)indexForPoint:(CGPoint)a3
{
  CGFloat v4 = a3.x - self->_currentCenter.x;
  float v5 = a3.y - self->_currentCenter.y;
  float v6 = v4;
  float v7 = atan2f(v5, v6);
  if (v7 <= 0.0) {
    double v8 = v7 + 6.28318531;
  }
  else {
    double v8 = v7;
  }
  if (self->_recentlyMoved)
  {
    if (vabdd_f64(v8, self->_movedAngle) < 0.200000003) {
      return -1;
    }
    self->_recentlyMoved = 0;
  }
  uint64_t v9 = [(NSArray *)self->_explorationSegments count];
  if (v9 < 1)
  {
LABEL_19:
    self->_double lastAngle = -1.0;
    return -1;
  }
  uint64_t v10 = v9;
  int64_t v11 = 0;
  float64x2_t v29 = (float64x2_t)vdupq_n_s64(0xC01921FB54442D18);
  float64x2_t v30 = (float64x2_t)vdupq_n_s64(0x401921FB54442D18uLL);
  while (1)
  {
    double v12 = -[NSArray objectAtIndex:](self->_explorationSegments, "objectAtIndex:", v11, *(_OWORD *)&v29, *(_OWORD *)&v30);
    double v13 = [v12 firstObject];
    [v13 floatValue];
    unsigned int v32 = v14;

    double v15 = [v12 objectAtIndex:1];
    [v15 floatValue];
    unsigned int v31 = v16;

    float64x2_t v17 = vcvtq_f64_f32((float32x2_t)__PAIR64__(v31, v32));
    int32x2_t v18 = vcltz_f32((float32x2_t)__PAIR64__(v31, v32));
    v19.i64[0] = v18.i32[0];
    v19.i64[1] = v18.i32[1];
    float64x2_t v20 = (float64x2_t)vbslq_s8(v19, (int8x16_t)vaddq_f64(v17, v30), (int8x16_t)v17);
    int8x16_t v21 = vbslq_s8((int8x16_t)vcgtq_f64(v20, v30), (int8x16_t)vaddq_f64(v20, v29), (int8x16_t)v20);
    if (*(double *)v21.i64 > *(double *)&v21.i64[1] && (v8 > *(double *)v21.i64 || v8 < *(double *)&v21.i64[1])) {
      break;
    }
    if (v8 > *(double *)v21.i64 && v8 < *(double *)&v21.i64[1]) {
      break;
    }

    if (v10 == ++v11) {
      goto LABEL_19;
    }
  }
  double v24 = (*(double *)v21.i64 + *(double *)&v21.i64[1]) * 0.5;
  if (v24 < 0.0) {
    double v24 = v24 + 6.28318531;
  }
  double lastAngle = self->_lastAngle;
  if (lastAngle != -1.0)
  {
    BOOL v26 = lastAngle <= v24 || v8 > v24;
    if (!v26 || (lastAngle < v24 ? (BOOL v27 = v8 < v24) : (BOOL v27 = 1), !v27)) {
      [(VOTMapsExplorationGestureManager *)self _playSound:@"Sounds/Edge.aiff"];
    }
  }
  self->_double lastAngle = v8;

  return v11;
}

- (void)_speakText:(id)a3 doesNotInterrupt:(BOOL)a4 cannotBeInterrupted:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  if (v9)
  {
    float v7 = objc_opt_new();
    [v7 setDoesNotInterrupt:v6];
    [v7 setCannotBeInterrupted:v5];
    id v8 = [v7 addString:v9];
    [v7 send];
  }
}

- (void)_playSound:(id)a3
{
  id v3 = a3;
  id v4 = +[VOTOutputManager outputManager];
  [v4 playSoundFast:v3];
}

- (BOOL)processTapWithFingerCount:(unint64_t)a3
{
  return 0;
}

- (BOOL)processTouchLocations:(id)a3 isFirstTouch:(BOOL)a4
{
  return 1;
}

- (BOOL)isBackspaceEvent:(id)a3
{
  return 0;
}

- (BOOL)isSelectItemEvent:(id)a3
{
  return 0;
}

- (BOOL)isNextKeyboardLanguageEvent:(id)a3
{
  return 0;
}

- (BOOL)isNextBrailleTableEvent:(id)a3
{
  return 0;
}

- (BOOL)isNextSuggestionEvent:(id)a3
{
  return 0;
}

- (BOOL)isPreviousSuggestionEvent:(id)a3
{
  return 0;
}

- (BOOL)isReturnKeyEvent:(id)a3
{
  return 0;
}

- (BOOL)isSpaceEvent:(id)a3
{
  return 0;
}

- (BOOL)isWordBackspaceEvent:(id)a3
{
  return 0;
}

- (BOOL)isRotorDownEvent:(id)a3
{
  return 0;
}

- (BOOL)isRotorLeftEvent:(id)a3
{
  return 0;
}

- (BOOL)isRotorRightEvent:(id)a3
{
  return 0;
}

- (BOOL)isRotorUpEvent:(id)a3
{
  return 0;
}

- (BOOL)isTextSelectionBackwardEvent:(id)a3
{
  return 0;
}

- (BOOL)isTextSelectionForwardEvent:(id)a3
{
  return 0;
}

- (VOTMapsExplorationGestureManagerDelegate)mapsExplorationGestureManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapsExplorationGestureManagerDelegate);

  return (VOTMapsExplorationGestureManagerDelegate *)WeakRetained;
}

- (void)setMapsExplorationGestureManagerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapsExplorationGestureManagerDelegate);

  objc_storeStrong((id *)&self->_explorationSegments, 0);
}

@end