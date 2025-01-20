@interface ForceTouchViewController
- (BOOL)noInputTimerFired;
- (BOOL)prefersStatusBarHidden;
- (BOOL)pressureReachedAfterTimeout;
- (BOOL)pressureTargetMissed;
- (BOOL)shouldIgnoreForceEvents;
- (BOOL)timeoutTimerFireDelayed;
- (BOOL)timerInvalidated;
- (BOOL)touchEventRecognized;
- (CAShapeLayer)check;
- (ForceTouchInputs)inputs;
- (ForceTouchRingView)forceTouchRingView;
- (NSArray)gridIndexes;
- (NSMutableArray)allResults;
- (NSMutableArray)detectedPressurePoints;
- (NSMutableArray)gridStatus;
- (NSMutableArray)testCoordinates;
- (NSMutableArray)testCoordinatesColor;
- (NSMutableArray)undetectedPressurePoints;
- (NSNumber)forceTouchEnded;
- (NSNumber)forceTouchStarted;
- (NSTimer)timeoutTimer;
- (UILabel)statusLabel;
- (__MTDevice)builtInDevice;
- (double)pressureRatio;
- (float)maximumPressure;
- (int)testCoordinatesIndex;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)pressureIndex;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)testCoordinatesCount;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)checkForNextTargetWithTestCoordinateGridIndex:(id)a3;
- (void)cleanUp;
- (void)continueButtonAction;
- (void)dealloc;
- (void)endTestWithStatusCode:(id)a3;
- (void)finishTest;
- (void)noInputTimedOut;
- (void)partialInputTimedOut;
- (void)playCheckAnimationAtPoint:(CGPoint)a3;
- (void)presentRingWithTestCoordinateGridIndex:(unsigned int)a3;
- (void)retryButtonAction;
- (void)setAllResults:(id)a3;
- (void)setBuiltInDevice:(__MTDevice *)a3;
- (void)setCheck:(id)a3;
- (void)setDetectedPressurePoints:(id)a3;
- (void)setForceTouchEnded:(id)a3;
- (void)setForceTouchRingView:(id)a3;
- (void)setForceTouchStarted:(id)a3;
- (void)setGridIndexes:(id)a3;
- (void)setGridStatus:(id)a3;
- (void)setInputs:(id)a3;
- (void)setMaximumPressure:(float)a3;
- (void)setNoInputTimerFired:(BOOL)a3;
- (void)setPressureIndex:(unint64_t)a3;
- (void)setPressureRatio:(double)a3;
- (void)setPressureReachedAfterTimeout:(BOOL)a3;
- (void)setPressureTargetMissed:(BOOL)a3;
- (void)setShouldIgnoreForceEvents:(BOOL)a3;
- (void)setStatusLabel:(id)a3;
- (void)setTestCoordinates:(id)a3;
- (void)setTestCoordinatesColor:(id)a3;
- (void)setTestCoordinatesCount:(unint64_t)a3;
- (void)setTestCoordinatesIndex:(int)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setTimeoutTimerFireDelayed:(BOOL)a3;
- (void)setTimerInvalidated:(BOOL)a3;
- (void)setTouchEventRecognized:(BOOL)a3;
- (void)setUndetectedPressurePoints:(id)a3;
- (void)setupHIDForceTouchRecognizer;
- (void)setupView;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)shuffleCoordinates;
- (void)start;
- (void)updateViewConstraints;
@end

@implementation ForceTouchViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v104 = a4;
  [(ForceTouchViewController *)self setInputs:v6];
  self->_shouldIgnoreForceEvents = 0;
  v7 = [(ForceTouchViewController *)self inputs];
  [v7 startingCircleRatio];
  float v9 = v8;

  v10 = [(ForceTouchViewController *)self inputs];
  *(float *)&double v11 = fminf(v9, 1.0);
  [v10 setStartingCircleRatio:v11];

  v12 = [(ForceTouchViewController *)self inputs];
  [v12 endingCircleRatio];
  float v14 = v13;

  v15 = [(ForceTouchViewController *)self inputs];
  *(float *)&double v16 = fminf(v14, 1.0);
  [v15 setEndingCircleRatio:v16];

  v17 = [(ForceTouchViewController *)self inputs];
  if ((int)[v17 gridColumns] <= 0)
  {

    goto LABEL_15;
  }
  v18 = [(ForceTouchViewController *)self inputs];
  int v19 = [v18 gridRows];

  if (v19 <= 0)
  {
LABEL_15:
    [(ForceTouchViewController *)self endTestWithStatusCode:&off_10000C958];
    goto LABEL_16;
  }
  v20 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  testCoordinates = self->_testCoordinates;
  self->_testCoordinates = v20;

  v22 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  testCoordinatesColor = self->_testCoordinatesColor;
  self->_testCoordinatesColor = v22;

  v24 = +[UIScreen mainScreen];
  [v24 bounds];
  double v26 = v25;
  double v28 = v27;

  v29 = [(ForceTouchViewController *)self inputs];
  int v30 = [v29 gridColumns];

  v31 = [(ForceTouchViewController *)self inputs];
  int v32 = [v31 gridRows];

  v33 = [(ForceTouchViewController *)self inputs];
  int v34 = [v33 gridRows];

  if (v34 >= 1)
  {
    int v35 = 0;
    double v36 = v26 / (double)v30;
    double v37 = v28 / (double)v32;
    double v38 = 0.5;
    do
    {
      v39 = [(ForceTouchViewController *)self inputs];
      int v40 = [v39 gridColumns];

      if (v40 >= 1)
      {
        int v41 = 0;
        do
        {
          v42 = self->_testCoordinates;
          v43 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v36 * 0.5 + (double)v41 * v36, v37 * 0.5 + (double)v35 * v37);
          [(NSMutableArray *)v42 addObject:v43];

          v44 = self->_testCoordinatesColor;
          v45 = objc_opt_new();
          [(NSMutableArray *)v44 addObject:v45];

          v46 = [(ForceTouchViewController *)self inputs];
          ++v41;
          LODWORD(v45) = [v46 gridColumns];
        }
        while (v41 < (int)v45);
      }
      v47 = [(ForceTouchViewController *)self inputs];
      ++v35;
      signed int v48 = [v47 gridRows];
    }
    while (v35 < v48);
  }
  v49 = [(ForceTouchViewController *)self inputs];
  uint64_t v50 = [v49 testCoordinateColorsParameter];

  if (!v50)
  {
    self->_testCoordinatesCount = (unint64_t)[(NSMutableArray *)self->_testCoordinates count];
    id v58 = objc_alloc_init((Class)NSMutableArray);
    while (1)
    {
      v59 = [(ForceTouchViewController *)self inputs];
      unsigned int v60 = [v59 gridRows];
      v61 = [(ForceTouchViewController *)self inputs];
      signed int v62 = [v61 gridColumns] * v60;

      if ((int)v50 >= v62) {
        break;
      }
      v63 = +[NSNumber numberWithInt:v50];
      [v58 addObject:v63];

      uint64_t v50 = (v50 + 1);
    }
    v64 = (NSArray *)[v58 copy];
    gridIndexes = self->_gridIndexes;
    self->_gridIndexes = v64;

LABEL_21:
    v66 = [(ForceTouchViewController *)self inputs];
    unsigned int v67 = [v66 randomizeCoordinates];

    if (v67) {
      [(ForceTouchViewController *)self shuffleCoordinates];
    }
    v68 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    gridStatus = self->_gridStatus;
    self->_gridStatus = v68;

    for (int i = 0; ; ++i)
    {
      v71 = [(ForceTouchViewController *)self inputs];
      unsigned int v72 = [v71 gridRows];
      v73 = [(ForceTouchViewController *)self inputs];
      LOBYTE(v72) = i < (int)([v73 gridColumns] * v72);

      if ((v72 & 1) == 0) {
        break;
      }
      [(NSMutableArray *)self->_gridStatus addObject:&off_10000C9B8];
    }
    self->_pressureIndex = 0;
    self->_pressureRatio = 0.0;
    self->_testCoordinatesIndex = 0;
    self->_pressureTargetMissed = 0;
    self->_touchEventRecognized = 0;
    self->_timerInvalidated = 0;
    self->_pressureReachedAfterTimeout = 0;
    self->_noInputTimerFired = 0;
    self->_timeoutTimerFireDelayed = 0;
    v74 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    allResults = self->_allResults;
    self->_allResults = v74;

    v76 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    undetectedPressurePoints = self->_undetectedPressurePoints;
    self->_undetectedPressurePoints = v76;

    v78 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    detectedPressurePoints = self->_detectedPressurePoints;
    self->_detectedPressurePoints = v78;

    [(ForceTouchViewController *)self setupHIDForceTouchRecognizer];
    v80 = +[DSTestAutomation sharedInstance];
    unsigned __int8 v81 = [v80 testAutomationEnabled];

    if (v81)
    {
      v120[0] = @"startingCircleRatio";
      v103 = [(ForceTouchViewController *)self inputs];
      [v103 startingCircleRatio];
      v102 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      v121[0] = v102;
      v120[1] = @"endingCircleRatio";
      v101 = [(ForceTouchViewController *)self inputs];
      [v101 endingCircleRatio];
      v100 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      v121[1] = v100;
      v120[2] = @"gridRows";
      v99 = [(ForceTouchViewController *)self inputs];
      v98 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v99 gridRows]);
      v121[2] = v98;
      v120[3] = @"gridColumns";
      v97 = [(ForceTouchViewController *)self inputs];
      v96 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v97 gridColumns]);
      v121[3] = v96;
      v120[4] = @"pressurePoints";
      v95 = [(ForceTouchViewController *)self inputs];
      v94 = [v95 pressurePoints];
      v121[4] = v94;
      v120[5] = @"forceTouchSensitivityText";
      v93 = [(ForceTouchViewController *)self inputs];
      v92 = [v93 forceTouchSensitivityText];
      v121[5] = v92;
      v120[6] = @"randomizeCoordinates";
      v91 = [(ForceTouchViewController *)self inputs];
      v82 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v91 randomizeCoordinates]);
      v121[6] = v82;
      v120[7] = @"hapticFeedback";
      v83 = [(ForceTouchViewController *)self inputs];
      v84 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v83 hapticFeedback]);
      v121[7] = v84;
      v120[8] = @"gridIndexes";
      v85 = [(ForceTouchViewController *)self gridIndexes];
      v121[8] = v85;
      v120[9] = @"noInputTimeout";
      v86 = [(ForceTouchViewController *)self inputs];
      [v86 noInputTimeout];
      v87 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      v121[9] = v87;
      v120[10] = @"partialInputTimeout";
      v88 = [(ForceTouchViewController *)self inputs];
      [v88 partialInputTimeout];
      v89 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      v121[10] = v89;
      v90 = +[NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:11];
      +[DSTestAutomation postConfiguration:v90];
    }
    goto LABEL_16;
  }
  v51 = [(ForceTouchViewController *)self inputs];
  v52 = [v51 testCoordinateColorsParameter];
  self->_testCoordinatesCount = (unint64_t)[v52 count];

  uint64_t v116 = 0;
  v117 = &v116;
  uint64_t v118 = 0x2020000000;
  char v119 = 1;
  v114[0] = 0;
  v114[1] = v114;
  v114[2] = 0x2020000000;
  int v115 = 0;
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x3032000000;
  v111 = sub_10000370C;
  v112 = sub_10000371C;
  id v113 = objc_alloc_init((Class)NSMutableArray);
  objc_initWeak(&location, self);
  v53 = [(ForceTouchViewController *)self inputs];
  v54 = [v53 testCoordinateColorsParameter];
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = sub_100003724;
  v105[3] = &unk_10000C3A0;
  objc_copyWeak(&v106, &location);
  v105[4] = v114;
  v105[5] = &v116;
  v105[6] = &v108;
  [v54 enumerateObjectsUsingBlock:v105];

  int v55 = *((unsigned __int8 *)v117 + 24);
  if (*((unsigned char *)v117 + 24))
  {
    v56 = (NSArray *)[(id)v109[5] copy];
    v57 = self->_gridIndexes;
    self->_gridIndexes = v56;
  }
  objc_destroyWeak(&v106);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v108, 8);

  _Block_object_dispose(v114, 8);
  _Block_object_dispose(&v116, 8);
  if (v55) {
    goto LABEL_21;
  }
LABEL_16:
}

- (void)noInputTimedOut
{
  [(ForceTouchViewController *)self setNoInputTimerFired:1];
  v3 = [(ForceTouchViewController *)self gridIndexes];
  v4 = [v3 objectAtIndexedSubscript:[self testCoordinatesIndex]];
  unsigned int v5 = [v4 intValue];

  id v6 = [(ForceTouchViewController *)self forceTouchRingView];
  [v6 setTimedOut:1];

  v7 = [(ForceTouchViewController *)self forceTouchRingView];
  [(ForceTouchViewController *)self pressureRatio];
  [v7 updateCircleWithPressureRatio:];

  id v9 = [(ForceTouchViewController *)self testCoordinates];
  float v8 = [v9 objectAtIndexedSubscript:v5];
  [v8 CGPointValue];
  -[ForceTouchViewController playCheckAnimationAtPoint:](self, "playCheckAnimationAtPoint:");
}

- (void)partialInputTimedOut
{
  if ([(ForceTouchViewController *)self touchEventRecognized])
  {
    [(ForceTouchViewController *)self setTimeoutTimerFireDelayed:1];
  }
  else
  {
    v3 = [(ForceTouchViewController *)self gridIndexes];
    v4 = [v3 objectAtIndexedSubscript:[self testCoordinatesIndex]];
    unsigned int v5 = [v4 intValue];

    if (![(ForceTouchViewController *)self pressureReachedAfterTimeout])
    {
      [(ForceTouchViewController *)self setPressureReachedAfterTimeout:0];
      id v6 = [(ForceTouchViewController *)self forceTouchRingView];
      [v6 setTimedOut:1];

      v7 = [(ForceTouchViewController *)self forceTouchRingView];
      [(ForceTouchViewController *)self pressureRatio];
      [v7 updateCircleWithPressureRatio:];
    }
    float v8 = [(ForceTouchViewController *)self forceTouchStarted];
    if (v8)
    {
      id v9 = +[NSDate date];
      [v9 timeIntervalSince1970];
      double v11 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)(v10 * 1000.0)];
      [(ForceTouchViewController *)self setForceTouchEnded:v11];
    }
    else
    {
      [(ForceTouchViewController *)self setForceTouchEnded:0];
    }

    v12 = [(ForceTouchViewController *)self undetectedPressurePoints];
    float v13 = [(ForceTouchViewController *)self inputs];
    float v14 = [v13 pressurePoints];
    v15 = [v14 objectAtIndexedSubscript:-[ForceTouchViewController pressureIndex]];
    [v12 addObject:v15];

    id v17 = [(ForceTouchViewController *)self testCoordinates];
    double v16 = [v17 objectAtIndexedSubscript:v5];
    [v16 CGPointValue];
    -[ForceTouchViewController playCheckAnimationAtPoint:](self, "playCheckAnimationAtPoint:");
  }
}

- (void)checkForNextTargetWithTestCoordinateGridIndex:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(ForceTouchViewController *)self check];
  [v5 removeFromSuperlayer];

  unsigned int v6 = [v4 unsignedIntValue];
  unint64_t v7 = [(ForceTouchViewController *)self pressureIndex];
  float v8 = [(ForceTouchViewController *)self inputs];
  id v9 = [v8 pressurePoints];
  double v10 = (char *)[v9 count] - 1;

  if (v7 < (unint64_t)v10)
  {
    double v11 = [(ForceTouchViewController *)self testCoordinatesColor];
    uint64_t v12 = v6;
    float v13 = [v11 objectAtIndexedSubscript:v6];

    float v14 = [(ForceTouchViewController *)self forceTouchRingView];
    [v14 setTimedOut:0];

    v15 = [v13 starting];
    double v16 = [(ForceTouchViewController *)self forceTouchRingView];
    [v16 setRingStartingColor:v15];

    id v17 = [v13 success];
    v18 = [(ForceTouchViewController *)self forceTouchRingView];
    [v18 setRingSuccessColor:v17];

    int v19 = [v13 failed];
    v20 = [(ForceTouchViewController *)self forceTouchRingView];
    [v20 setRingFailedColor:v19];

    v21 = [(ForceTouchViewController *)self inputs];
    v22 = [v21 forceTouchSensitivityText];
    v23 = [(ForceTouchViewController *)self statusLabel];
    [v23 setText:v22];

    [(ForceTouchViewController *)self setNoInputTimerFired:0];
    [(ForceTouchViewController *)self setTimerInvalidated:0];
    [(ForceTouchViewController *)self setPressureRatio:0.0];
    [(ForceTouchViewController *)self setPressureIndex:(char *)[(ForceTouchViewController *)self pressureIndex] + 1];
    v24 = [(ForceTouchViewController *)self gridStatus];
    [v24 setObject:&off_10000C9B8 atIndexedSubscript:v12];

    double v25 = +[DSTestAutomation sharedInstance];
    LODWORD(v24) = [v25 testAutomationEnabled];

    if (v24)
    {
      v104[0] = @"x";
      v98 = [(ForceTouchViewController *)self forceTouchRingView];
      [v98 ringCenter];
      v96 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      v105[0] = v96;
      v104[1] = @"y";
      v94 = [(ForceTouchViewController *)self forceTouchRingView];
      [v94 ringCenter];
      double v27 = +[NSNumber numberWithDouble:v26];
      v105[1] = v27;
      v104[2] = @"radius";
      double v28 = [(ForceTouchViewController *)self view];
      [v28 frame];
      double v30 = v29 * 0.5;
      v31 = [(ForceTouchViewController *)self inputs];
      double v32 = v30 / (double)(int)[v31 gridColumns];
      v33 = [(ForceTouchViewController *)self inputs];
      [v33 startingCircleRatio];
      float v35 = v34;

      double v36 = [(ForceTouchViewController *)self inputs];
      [v36 endingCircleRatio];
      float v38 = v37;

      if (v35 >= v38) {
        float v39 = v38;
      }
      else {
        float v39 = v35;
      }
      int v40 = +[NSNumber numberWithDouble:v32 * v39];
      v105[2] = v40;
      v104[3] = @"pressure";
      int v41 = [(ForceTouchViewController *)self inputs];
      v42 = [v41 pressurePoints];
      v43 = [v42 objectAtIndexedSubscript:[self pressureIndex]];
      v105[3] = v43;
      v44 = v105;
      v45 = v104;
LABEL_21:
      v88 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v45 count:4];
      +[DSTestAutomation postInteractiveTestEvent:@"ForceTouchTargetAppeared" info:v88];

      goto LABEL_22;
    }
    goto LABEL_22;
  }
  v46 = [(ForceTouchViewController *)self undetectedPressurePoints];
  id v47 = [v46 count];

  if (v47)
  {
    [(ForceTouchViewController *)self setPressureTargetMissed:1];
    signed int v48 = [(ForceTouchViewController *)self inputs];
    uint64_t v49 = v6 % [v48 gridColumns];

    uint64_t v50 = [(ForceTouchViewController *)self inputs];
    uint64_t v51 = v6 / [v50 gridColumns];

    v99 = [(ForceTouchViewController *)self allResults];
    v102[0] = @"x";
    v97 = +[NSNumber numberWithUnsignedInt:v49];
    v103[0] = v97;
    v102[1] = @"y";
    v95 = +[NSNumber numberWithUnsignedInt:v51];
    v103[1] = v95;
    v102[2] = @"maximumPressure";
    [(ForceTouchViewController *)self maximumPressure];
    v52 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v103[2] = v52;
    v102[3] = @"forceTouchStarted";
    v53 = [(ForceTouchViewController *)self forceTouchStarted];
    if (v53) {
      [(ForceTouchViewController *)self forceTouchStarted];
    }
    else {
    v54 = +[NSNull null];
    }
    v103[3] = v54;
    v102[4] = @"forceTouchEnded";
    int v55 = [(ForceTouchViewController *)self forceTouchEnded];
    if (v55) {
      [(ForceTouchViewController *)self forceTouchEnded];
    }
    else {
    v56 = +[NSNull null];
    }
    v103[4] = v56;
    v102[5] = @"undetectedPressurePoints";
    v57 = [(ForceTouchViewController *)self undetectedPressurePoints];
    v103[5] = v57;
    v102[6] = @"detectedPressurePoints";
    id v58 = [(ForceTouchViewController *)self detectedPressurePoints];
    v103[6] = v58;
    v59 = +[NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:7];
    [v99 addObject:v59];
  }
  signed int v60 = [(ForceTouchViewController *)self testCoordinatesIndex];
  if ((char *)[(ForceTouchViewController *)self testCoordinatesCount] - 1 > (char *)v60)
  {
    v61 = [(ForceTouchViewController *)self forceTouchRingView];
    [v61 setTimedOut:0];

    signed int v62 = [(ForceTouchViewController *)self inputs];
    v63 = [v62 forceTouchSensitivityText];
    v64 = [(ForceTouchViewController *)self statusLabel];
    [v64 setText:v63];

    v65 = [(ForceTouchViewController *)self undetectedPressurePoints];
    [v65 removeAllObjects];

    v66 = [(ForceTouchViewController *)self detectedPressurePoints];
    [v66 removeAllObjects];

    [(ForceTouchViewController *)self setForceTouchStarted:0];
    [(ForceTouchViewController *)self setForceTouchEnded:0];
    [(ForceTouchViewController *)self setNoInputTimerFired:0];
    [(ForceTouchViewController *)self setTimerInvalidated:0];
    [(ForceTouchViewController *)self setPressureRatio:0.0];
    [(ForceTouchViewController *)self setPressureIndex:0];
    [(ForceTouchViewController *)self setTestCoordinatesIndex:[(ForceTouchViewController *)self testCoordinatesIndex] + 1];
    unsigned int v67 = [(ForceTouchViewController *)self testCoordinatesColor];
    v68 = [(ForceTouchViewController *)self gridIndexes];
    v69 = [v68 objectAtIndexedSubscript:[self testCoordinatesIndex]];
    float v13 = objc_msgSend(v67, "objectAtIndexedSubscript:", (int)objc_msgSend(v69, "intValue"));

    v70 = [v13 starting];
    v71 = [(ForceTouchViewController *)self forceTouchRingView];
    [v71 setRingStartingColor:v70];

    unsigned int v72 = [v13 success];
    v73 = [(ForceTouchViewController *)self forceTouchRingView];
    [v73 setRingSuccessColor:v72];

    v74 = [v13 failed];
    v75 = [(ForceTouchViewController *)self forceTouchRingView];
    [v75 setRingFailedColor:v74];

    v76 = +[DSTestAutomation sharedInstance];
    LODWORD(v75) = [v76 testAutomationEnabled];

    if (v75)
    {
      v100[0] = @"x";
      v98 = [(ForceTouchViewController *)self forceTouchRingView];
      [v98 ringCenter];
      v96 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      v101[0] = v96;
      v100[1] = @"y";
      v94 = [(ForceTouchViewController *)self forceTouchRingView];
      [v94 ringCenter];
      double v27 = +[NSNumber numberWithDouble:v77];
      v101[1] = v27;
      v100[2] = @"radius";
      double v28 = [(ForceTouchViewController *)self view];
      [v28 frame];
      double v79 = v78 * 0.5;
      v31 = [(ForceTouchViewController *)self inputs];
      double v80 = v79 / (double)(int)[v31 gridColumns];
      unsigned __int8 v81 = [(ForceTouchViewController *)self inputs];
      [v81 startingCircleRatio];
      float v83 = v82;

      v84 = [(ForceTouchViewController *)self inputs];
      [v84 endingCircleRatio];
      float v86 = v85;

      if (v83 >= v86) {
        float v87 = v86;
      }
      else {
        float v87 = v83;
      }
      int v40 = +[NSNumber numberWithDouble:v80 * v87];
      v101[2] = v40;
      v100[3] = @"pressure";
      int v41 = [(ForceTouchViewController *)self inputs];
      v42 = [v41 pressurePoints];
      v43 = [v42 objectAtIndexedSubscript:[self pressureIndex]];
      v101[3] = v43;
      v44 = v101;
      v45 = v100;
      goto LABEL_21;
    }
LABEL_22:
    v89 = [(ForceTouchViewController *)self inputs];
    [v89 noInputTimeout];
    v90 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "noInputTimedOut", 0, 0);
    [(ForceTouchViewController *)self setTimeoutTimer:v90];

    v91 = [(ForceTouchViewController *)self gridIndexes];
    v92 = [v91 objectAtIndexedSubscript:[self testCoordinatesIndex]];
    -[ForceTouchViewController presentRingWithTestCoordinateGridIndex:](self, "presentRingWithTestCoordinateGridIndex:", [v92 intValue]);

    return;
  }
  if ([(ForceTouchViewController *)self pressureTargetMissed]) {
    v93 = &off_10000C9D0;
  }
  else {
    v93 = &off_10000C9E8;
  }
  [(ForceTouchViewController *)self endTestWithStatusCode:v93];
}

- (void)playCheckAnimationAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unsigned int v6 = [(ForceTouchViewController *)self inputs];
  [v6 startingCircleRatio];
  int v8 = (int)(float)(1.0 / v7);

  id v9 = [(ForceTouchViewController *)self view];
  id v42 = [v9 layer];

  double v10 = +[UIBezierPath bezierPath];
  [v10 moveToPoint:x + -21.0 / (double)v8, y + (double)(4 / v8)];
  [v10 addLineToPoint:x + -8.0 / (double)v8, y + (double)(16 / v8)];
  [v10 addLineToPoint:x + 24.5 / (double)v8, y - (double)(15 / v8)];
  id v11 = objc_alloc_init((Class)CAShapeLayer);
  [(ForceTouchViewController *)self setCheck:v11];

  uint64_t v12 = [(ForceTouchViewController *)self view];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(ForceTouchViewController *)self check];
  [v21 setFrame:v14, v16, v18, v20];

  id v22 = v10;
  id v23 = [v22 CGPath];
  v24 = [(ForceTouchViewController *)self check];
  [v24 setPath:v23];

  id v25 = +[UIColor whiteColor];
  id v26 = [v25 CGColor];
  double v27 = [(ForceTouchViewController *)self check];
  [v27 setStrokeColor:v26];

  id v28 = +[UIColor clearColor];
  id v29 = [v28 CGColor];
  double v30 = [(ForceTouchViewController *)self check];
  [v30 setFillColor:v29];

  v31 = [(ForceTouchViewController *)self check];
  [v31 setLineWidth:5.0];

  double v32 = [(ForceTouchViewController *)self check];
  [v32 setStrokeStart:0.0];

  v33 = [(ForceTouchViewController *)self check];
  [v33 setStrokeEnd:0.0];

  float v34 = [(ForceTouchViewController *)self check];
  [v34 setLineCap:kCALineCapRound];

  float v35 = [(ForceTouchViewController *)self check];
  [v35 setLineJoin:kCALineJoinRound];

  double v36 = [(ForceTouchViewController *)self check];
  [v42 addSublayer:v36];

  float v37 = [(ForceTouchViewController *)self check];
  [v37 setStrokeEnd:1.0];

  float v38 = +[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
  [v38 setDuration:0.375];
  [v38 setFillMode:kCAFillModeBoth];
  [v38 setBeginTime:CACurrentMediaTime() + 0.150000006];
  [v38 setFromValue:&off_10000C908];
  [v38 setToValue:&off_10000C918];
  [v38 setDelegate:self];
  float v39 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v38 setTimingFunction:v39];

  LODWORD(v40) = 1.0;
  [v38 setRepeatCount:v40];
  int v41 = [(ForceTouchViewController *)self check];
  [v41 addAnimation:v38 forKey:@"strokeEndAnimation"];
}

- (void)retryButtonAction
{
  v3 = [(ForceTouchViewController *)self inputs];
  [v3 noInputTimeout];
  id v4 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "noInputTimedOut", 0, 0);
  [(ForceTouchViewController *)self setTimeoutTimer:v4];

  unsigned int v5 = [(ForceTouchViewController *)self forceTouchRingView];
  [v5 setTimedOut:0];

  id v7 = [(ForceTouchViewController *)self gridIndexes];
  unsigned int v6 = [v7 objectAtIndexedSubscript:[self testCoordinatesIndex]];
  -[ForceTouchViewController presentRingWithTestCoordinateGridIndex:](self, "presentRingWithTestCoordinateGridIndex:", [v6 intValue]);
}

- (void)continueButtonAction
{
  v3 = [(ForceTouchViewController *)self forceTouchStarted];
  if (v3)
  {
    id v4 = +[NSDate date];
    [v4 timeIntervalSince1970];
    unsigned int v6 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)(v5 * 1000.0)];
    [(ForceTouchViewController *)self setForceTouchEnded:v6];
  }
  else
  {
    [(ForceTouchViewController *)self setForceTouchEnded:0];
  }

  for (unint64_t i = [(ForceTouchViewController *)self pressureIndex]; ; ++i)
  {
    int v8 = [(ForceTouchViewController *)self inputs];
    id v9 = [v8 pressurePoints];
    id v10 = [v9 count];

    if (i >= (unint64_t)v10) {
      break;
    }
    id v11 = [(ForceTouchViewController *)self undetectedPressurePoints];
    uint64_t v12 = [(ForceTouchViewController *)self inputs];
    double v13 = [v12 pressurePoints];
    double v14 = [v13 objectAtIndexedSubscript:i];
    [v11 addObject:v14];
  }
  double v15 = [(ForceTouchViewController *)self inputs];
  double v16 = [v15 pressurePoints];
  -[ForceTouchViewController setPressureIndex:](self, "setPressureIndex:", [v16 count]);

  id v18 = [(ForceTouchViewController *)self gridIndexes];
  double v17 = [v18 objectAtIndexedSubscript:[self testCoordinatesIndex]];
  [(ForceTouchViewController *)self checkForNextTargetWithTestCoordinateGridIndex:v17];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
  {
    if ([(ForceTouchViewController *)self noInputTimerFired])
    {
      [(ForceTouchViewController *)self setNoInputTimerFired:0];
      double v5 = [(ForceTouchViewController *)self check];
      [v5 removeFromSuperlayer];

      unsigned int v6 = +[NSBundle mainBundle];
      id v7 = [v6 localizedStringForKey:@"NO_INPUT_DETECTED" value:&stru_10000C830 table:0];
      int v8 = +[UIAlertController alertControllerWithTitle:0 message:v7 preferredStyle:1];

      id v9 = +[NSBundle mainBundle];
      id v10 = [v9 localizedStringForKey:@"RETRY" value:&stru_10000C830 table:0];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100005254;
      v18[3] = &unk_10000C3C8;
      v18[4] = self;
      id v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v18];
      [v8 addAction:v11];

      uint64_t v12 = +[NSBundle mainBundle];
      double v13 = [v12 localizedStringForKey:@"CONTINUE" value:&stru_10000C830 table:0];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000525C;
      v17[3] = &unk_10000C3C8;
      v17[4] = self;
      double v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v17];
      [v8 addAction:v14];

      [(ForceTouchViewController *)self presentViewController:v8 animated:1 completion:0];
    }
    else
    {
      id v16 = [(ForceTouchViewController *)self gridIndexes];
      double v15 = [v16 objectAtIndexedSubscript:[self testCoordinatesIndex]];
      [(ForceTouchViewController *)self performSelector:"checkForNextTargetWithTestCoordinateGridIndex:" withObject:v15 afterDelay:0.5];
    }
  }
}

- (void)start
{
  [(ForceTouchViewController *)self setupView];
  v3 = +[DSTestAutomation sharedInstance];
  unsigned int v4 = [v3 testAutomationEnabled];

  if (v4)
  {
    v29[0] = @"x";
    id v28 = [(ForceTouchViewController *)self forceTouchRingView];
    [v28 ringCenter];
    double v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v30[0] = v27;
    v29[1] = @"y";
    double v5 = [(ForceTouchViewController *)self forceTouchRingView];
    [v5 ringCenter];
    id v7 = +[NSNumber numberWithDouble:v6];
    v30[1] = v7;
    v29[2] = @"radius";
    int v8 = [(ForceTouchViewController *)self view];
    [v8 frame];
    double v10 = v9 * 0.5;
    id v11 = [(ForceTouchViewController *)self inputs];
    double v12 = v10 / (double)(int)[v11 gridColumns];
    double v13 = [(ForceTouchViewController *)self inputs];
    [v13 startingCircleRatio];
    float v15 = v14;

    id v16 = [(ForceTouchViewController *)self inputs];
    [v16 endingCircleRatio];
    float v18 = v17;

    if (v15 >= v18) {
      float v19 = v18;
    }
    else {
      float v19 = v15;
    }
    double v20 = +[NSNumber numberWithDouble:v12 * v19];
    v30[2] = v20;
    v29[3] = @"pressure";
    v21 = [(ForceTouchViewController *)self inputs];
    id v22 = [v21 pressurePoints];
    id v23 = [v22 objectAtIndexedSubscript:[self pressureIndex]];
    v30[3] = v23;
    v24 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:4];
    +[DSTestAutomation postInteractiveTestEvent:@"ForceTouchTargetAppeared" info:v24];
  }
  id v25 = [(ForceTouchViewController *)self inputs];
  [v25 noInputTimeout];
  id v26 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "noInputTimedOut", 0, 0);
  [(ForceTouchViewController *)self setTimeoutTimer:v26];
}

- (void)dealloc
{
  if (self->_builtInDevice)
  {
    MTUnregisterPathCallbackWithRefcon();
    if (MTDeviceIsRunning()) {
      MTDeviceStop();
    }
    CFRelease(self->_builtInDevice);
  }
  v3.receiver = self;
  v3.super_class = (Class)ForceTouchViewController;
  [(ForceTouchViewController *)&v3 dealloc];
}

- (void)shuffleCoordinates
{
  objc_super v3 = [(ForceTouchViewController *)self gridIndexes];
  unsigned int v4 = (char *)[v3 count];

  double v5 = [(ForceTouchViewController *)self gridIndexes];
  id v8 = [v5 mutableCopy];

  if (v4)
  {
    uint64_t v6 = 0;
    do
    {
      [v8 exchangeObjectAtIndex:v6 withObjectAtIndex:v6 + arc4random_uniform((uint32_t)v4)];
      ++v6;
      --v4;
    }
    while (v4);
  }
  id v7 = [v8 copy];
  [(ForceTouchViewController *)self setGridIndexes:v7];
}

- (void)setupHIDForceTouchRecognizer
{
  List = (void *)MTDeviceCreateList();
  if ([List count])
  {
    uint64_t v4 = 0;
    while (1)
    {
      double v5 = (__MTDevice *)[List objectAtIndex:v4];
      unsigned int ParserType = MTDeviceGetParserType();
      int IsBuiltIn = MTDeviceIsBuiltIn();
      MTDeviceGetDeviceID();
      MTDeviceGetSensorSurfaceDimensions();
      MTDeviceGetTransportMethod();
      if (ParserType <= 0x3E7)
      {
        if (IsBuiltIn)
        {
          MTRegisterPathCallbackWithRefcon();
          if (!MTDeviceStart())
          {
            uint64_t MultitouchRunLoopSource = MTDeviceCreateMultitouchRunLoopSource();
            if (MultitouchRunLoopSource) {
              break;
            }
          }
        }
      }
      if ((unint64_t)[List count] <= ++v4) {
        goto LABEL_8;
      }
    }
    double v9 = (__CFRunLoopSource *)MultitouchRunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v9, kCFRunLoopCommonModes);
    CFRelease(v9);
    self->_builtInDevice = v5;
    CFRetain(v5);
  }
LABEL_8:
}

- (void)setupView
{
  objc_super v3 = +[UIColor whiteColor];
  uint64_t v4 = [(ForceTouchViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc((Class)UILabel);
  uint64_t v6 = [(ForceTouchViewController *)self view];
  [v6 frame];
  id v7 = [v5 initWithFrame:];
  [(ForceTouchViewController *)self setStatusLabel:v7];

  id v8 = [(ForceTouchViewController *)self statusLabel];
  [v8 setOpaque:0];

  double v9 = [(ForceTouchViewController *)self statusLabel];
  [v9 setContentMode:7];

  double v10 = [(ForceTouchViewController *)self statusLabel];
  LODWORD(v11) = 1132134400;
  [v10 setContentHuggingPriority:0 forAxis:v11];

  double v12 = [(ForceTouchViewController *)self statusLabel];
  LODWORD(v13) = 1132134400;
  [v12 setContentHuggingPriority:1 forAxis:v13];

  float v14 = [(ForceTouchViewController *)self statusLabel];
  [v14 setTextAlignment:1];

  float v15 = [(ForceTouchViewController *)self statusLabel];
  [v15 setLineBreakMode:4];

  id v16 = [(ForceTouchViewController *)self statusLabel];
  [v16 setNumberOfLines:1];

  float v17 = +[UIFont systemFontOfSize:20.0];
  float v18 = [(ForceTouchViewController *)self statusLabel];
  [v18 setFont:v17];

  float v19 = +[UIColor blackColor];
  double v20 = [(ForceTouchViewController *)self statusLabel];
  [v20 setTextColor:v19];

  v21 = [(ForceTouchViewController *)self inputs];
  id v22 = [v21 forceTouchSensitivityText];
  id v23 = [(ForceTouchViewController *)self statusLabel];
  [v23 setText:v22];

  v24 = [(ForceTouchViewController *)self statusLabel];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v25 = [(ForceTouchViewController *)self view];
  [v25 setNeedsUpdateConstraints];

  id v26 = [(ForceTouchViewController *)self view];
  double v27 = [(ForceTouchViewController *)self statusLabel];
  [v26 addSubview:v27];

  id v28 = [(ForceTouchViewController *)self gridIndexes];
  id v29 = [v28 objectAtIndexedSubscript:[self testCoordinatesIndex]];
  LODWORD(v23) = [v29 intValue];

  double v30 = [(ForceTouchViewController *)self testCoordinatesColor];
  id v67 = [v30 objectAtIndexedSubscript:v23];

  v31 = [ForceTouchRingView alloc];
  v66 = +[UIScreen mainScreen];
  [v66 bounds];
  double v64 = v32;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  v65 = [(ForceTouchViewController *)self testCoordinates];
  float v39 = [v65 objectAtIndexedSubscript:v23];
  [v39 CGPointValue];
  double v41 = v40;
  double v43 = v42;
  v44 = [(ForceTouchViewController *)self view];
  [v44 frame];
  double v46 = v45 * 0.5;
  id v47 = [(ForceTouchViewController *)self inputs];
  float v48 = v46 / (double)(int)[v47 gridColumns];
  uint64_t v49 = [(ForceTouchViewController *)self inputs];
  [v49 startingCircleRatio];
  int v51 = v50;
  v52 = [(ForceTouchViewController *)self inputs];
  [v52 endingCircleRatio];
  LODWORD(v46) = v53;
  v54 = [v67 starting];
  int v55 = [v67 success];
  v56 = [v67 failed];
  LODWORD(v63) = LODWORD(v46);
  *(float *)&double v57 = v48;
  LODWORD(v58) = v51;
  v59 = -[ForceTouchRingView initWithFrame:ringCenter:startingCircleRadius:startingCircleRatio:endingCircleRatio:ringStartingColor:ringSuccessColor:ringFailedColor:](v31, "initWithFrame:ringCenter:startingCircleRadius:startingCircleRatio:endingCircleRatio:ringStartingColor:ringSuccessColor:ringFailedColor:", v54, v55, v56, v64, v34, v36, v38, v41, v43, v57, v58, v63);
  [(ForceTouchViewController *)self setForceTouchRingView:v59];

  signed int v60 = [(ForceTouchViewController *)self forceTouchRingView];
  [v60 setTimedOut:0];

  v61 = [(ForceTouchViewController *)self view];
  signed int v62 = [(ForceTouchViewController *)self forceTouchRingView];
  [v61 addSubview:v62];
}

- (void)updateViewConstraints
{
  v14.receiver = self;
  v14.super_class = (Class)ForceTouchViewController;
  [(ForceTouchViewController *)&v14 updateViewConstraints];
  objc_super v3 = [(ForceTouchViewController *)self view];
  uint64_t v4 = [(ForceTouchViewController *)self view];
  id v5 = [(ForceTouchViewController *)self statusLabel];
  uint64_t v6 = +[NSLayoutConstraint constraintWithItem:v4 attribute:9 relatedBy:0 toItem:v5 attribute:9 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v6];

  id v7 = [(ForceTouchViewController *)self view];
  id v8 = [(ForceTouchViewController *)self statusLabel];
  double v9 = [(ForceTouchViewController *)self view];
  double v10 = [v9 safeAreaLayoutGuide];
  double v11 = [(ForceTouchViewController *)self view];
  [v11 frame];
  double v13 = +[NSLayoutConstraint constraintWithItem:v8 attribute:4 relatedBy:0 toItem:v10 attribute:4 multiplier:1.0 constant:floor(v12 * 0.34)];
  [v7 addConstraint:v13];
}

- (void)presentRingWithTestCoordinateGridIndex:(unsigned int)a3
{
  id v5 = [(ForceTouchViewController *)self testCoordinates];
  uint64_t v6 = [v5 objectAtIndexedSubscript:a3];
  [v6 CGPointValue];
  double v8 = v7;
  double v10 = v9;
  double v11 = [(ForceTouchViewController *)self forceTouchRingView];
  [v11 setRingCenter:v8, v10];

  id v12 = [(ForceTouchViewController *)self forceTouchRingView];
  [(ForceTouchViewController *)self pressureRatio];
  [v12 updateCircleWithPressureRatio:];
}

- (void)cleanUp
{
  objc_super v3 = [(ForceTouchViewController *)self timeoutTimer];

  if (v3)
  {
    uint64_t v4 = [(ForceTouchViewController *)self timeoutTimer];
    [v4 invalidate];

    [(ForceTouchViewController *)self setTimeoutTimer:0];
  }
}

- (void)endTestWithStatusCode:(id)a3
{
  id v4 = a3;
  [(ForceTouchViewController *)self cleanUp];
  id v5 = [(ForceTouchViewController *)self result];
  [v5 setStatusCode:v4];

  uint64_t v6 = [(ForceTouchViewController *)self result];
  double v7 = [v6 statusCode];
  if ([v7 isEqualToNumber:&off_10000CA60])
  {

LABEL_4:
    double v11 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100006EFC(v11);
    }

    id v12 = [(ForceTouchViewController *)self result];
    [v12 setData:&__NSDictionary0__struct];

    [(ForceTouchViewController *)self setFinished:1];
    return;
  }
  double v8 = [(ForceTouchViewController *)self result];
  double v9 = [v8 statusCode];
  unsigned int v10 = [v9 isEqualToNumber:&off_10000CA78];

  if (v10) {
    goto LABEL_4;
  }
  double v13 = [(ForceTouchViewController *)self allResults];

  if (v13)
  {
    CFStringRef v17 = @"failedPresses";
    objc_super v14 = [(ForceTouchViewController *)self allResults];
    float v18 = v14;
    float v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v16 = [(ForceTouchViewController *)self result];
    [v16 setData:v15];
  }
  else
  {
    objc_super v14 = [(ForceTouchViewController *)self result];
    [v14 setData:&__NSDictionary0__struct];
  }

  [(ForceTouchViewController *)self performSelector:"finishTest" withObject:0 afterDelay:1.0];
}

- (void)finishTest
{
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (ForceTouchRingView)forceTouchRingView
{
  return self->_forceTouchRingView;
}

- (void)setForceTouchRingView:(id)a3
{
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
}

- (unint64_t)pressureIndex
{
  return self->_pressureIndex;
}

- (void)setPressureIndex:(unint64_t)a3
{
  self->_pressureIndedouble x = a3;
}

- (unint64_t)testCoordinatesCount
{
  return self->_testCoordinatesCount;
}

- (void)setTestCoordinatesCount:(unint64_t)a3
{
  self->_testCoordinatesCount = a3;
}

- (int)testCoordinatesIndex
{
  return self->_testCoordinatesIndex;
}

- (void)setTestCoordinatesIndex:(int)a3
{
  self->_testCoordinatesIndedouble x = a3;
}

- (BOOL)pressureTargetMissed
{
  return self->_pressureTargetMissed;
}

- (void)setPressureTargetMissed:(BOOL)a3
{
  self->_pressureTargetMissed = a3;
}

- (BOOL)noInputTimerFired
{
  return self->_noInputTimerFired;
}

- (void)setNoInputTimerFired:(BOOL)a3
{
  self->_noInputTimerFired = a3;
}

- (BOOL)timeoutTimerFireDelayed
{
  return self->_timeoutTimerFireDelayed;
}

- (void)setTimeoutTimerFireDelayed:(BOOL)a3
{
  self->_timeoutTimerFireDelayed = a3;
}

- (BOOL)touchEventRecognized
{
  return self->_touchEventRecognized;
}

- (void)setTouchEventRecognized:(BOOL)a3
{
  self->_touchEventRecognized = a3;
}

- (BOOL)timerInvalidated
{
  return self->_timerInvalidated;
}

- (void)setTimerInvalidated:(BOOL)a3
{
  self->_timerInvalidated = a3;
}

- (BOOL)pressureReachedAfterTimeout
{
  return self->_pressureReachedAfterTimeout;
}

- (void)setPressureReachedAfterTimeout:(BOOL)a3
{
  self->_pressureReachedAfterTimeout = a3;
}

- (double)pressureRatio
{
  return self->_pressureRatio;
}

- (void)setPressureRatio:(double)a3
{
  self->_pressureRatio = a3;
}

- (float)maximumPressure
{
  return self->_maximumPressure;
}

- (void)setMaximumPressure:(float)a3
{
  self->_maximumPressure = a3;
}

- (NSNumber)forceTouchStarted
{
  return self->_forceTouchStarted;
}

- (void)setForceTouchStarted:(id)a3
{
}

- (NSNumber)forceTouchEnded
{
  return self->_forceTouchEnded;
}

- (void)setForceTouchEnded:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (BOOL)shouldIgnoreForceEvents
{
  return self->_shouldIgnoreForceEvents;
}

- (void)setShouldIgnoreForceEvents:(BOOL)a3
{
  self->_shouldIgnoreForceEvents = a3;
}

- (NSArray)gridIndexes
{
  return self->_gridIndexes;
}

- (void)setGridIndexes:(id)a3
{
}

- (NSMutableArray)testCoordinatesColor
{
  return self->_testCoordinatesColor;
}

- (void)setTestCoordinatesColor:(id)a3
{
}

- (NSMutableArray)gridStatus
{
  return self->_gridStatus;
}

- (void)setGridStatus:(id)a3
{
}

- (NSMutableArray)allResults
{
  return self->_allResults;
}

- (void)setAllResults:(id)a3
{
}

- (NSMutableArray)undetectedPressurePoints
{
  return self->_undetectedPressurePoints;
}

- (void)setUndetectedPressurePoints:(id)a3
{
}

- (NSMutableArray)detectedPressurePoints
{
  return self->_detectedPressurePoints;
}

- (void)setDetectedPressurePoints:(id)a3
{
}

- (NSMutableArray)testCoordinates
{
  return self->_testCoordinates;
}

- (void)setTestCoordinates:(id)a3
{
}

- (CAShapeLayer)check
{
  return self->_check;
}

- (void)setCheck:(id)a3
{
}

- (__MTDevice)builtInDevice
{
  return self->_builtInDevice;
}

- (void)setBuiltInDevice:(__MTDevice *)a3
{
  self->_builtInDevice = a3;
}

- (ForceTouchInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_check, 0);
  objc_storeStrong((id *)&self->_testCoordinates, 0);
  objc_storeStrong((id *)&self->_detectedPressurePoints, 0);
  objc_storeStrong((id *)&self->_undetectedPressurePoints, 0);
  objc_storeStrong((id *)&self->_allResults, 0);
  objc_storeStrong((id *)&self->_gridStatus, 0);
  objc_storeStrong((id *)&self->_testCoordinatesColor, 0);
  objc_storeStrong((id *)&self->_gridIndexes, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_forceTouchEnded, 0);
  objc_storeStrong((id *)&self->_forceTouchStarted, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);

  objc_storeStrong((id *)&self->_forceTouchRingView, 0);
}

@end