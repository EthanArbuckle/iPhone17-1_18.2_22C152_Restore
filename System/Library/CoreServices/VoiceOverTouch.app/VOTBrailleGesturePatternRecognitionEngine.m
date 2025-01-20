@interface VOTBrailleGesturePatternRecognitionEngine
- (BOOL)_bothObjectsAreNilOrBothAreNonNil:(id)a3 object:(id)a4;
- (BOOL)_halfPattern:(id)a3 hasSameDotsAsHalfPattern:(id)a4;
- (BOOL)areDotNumberPositionsCalibrated;
- (BOOL)shouldReverseDots;
- (BOOL)shouldUseEightDotBraille;
- (CGPoint)_averageOfOldPoint:(CGPoint)a3 newPoint:(CGPoint)a4 dataCount:(unint64_t)a5;
- (VOTBrailleGesturePatternRecognitionEngine)init;
- (VOTBrailleGesturePatternRecognitionEngineDelegate)delegate;
- (double)_averageOfOldFloat:(double)a3 newFloat:(double)a4 dataCount:(unint64_t)a5;
- (double)_distanceBetweenPoint:(CGPoint)a3 andPoint:(CGPoint)a4;
- (double)_totalDistanceBetweenCorrespondingPointsInTouches:(id)a3 andTouches:(id)a4;
- (id)_averagePointValueWithDataCount:(unint64_t)a3 currentPointValue:(id)a4 newPointValue:(id)a5;
- (id)_closestHalfPatternForOrderedTouches:(id)a3 possibleMatches:(id)a4 side:(unint64_t)a5;
- (id)_halfPatternFromOrderedTouches:(id)a3 correspondingHalfPattern:(id)a4;
- (id)_halfPatternFromTouches:(id)a3 side:(unint64_t)a4;
- (id)_orderedTouchesFromHalfPattern:(id)a3;
- (id)_sortTouches:(id)a3 fromTopToBottomForSide:(unint64_t)a4;
- (id)dotNumberPositions;
- (id)printBrailleForTouchPoints:(id)a3 shouldLearn:(BOOL)a4 error:(id *)a5;
- (unsigned)printBrailleCharacterFromBraillePattern:(id)a3;
- (void)_populateLeftTouchPoints:(id)a3 rightTouchPoints:(id)a4 fromTouchPoints:(id)a5;
- (void)calibrateWithTouchPoints:(id)a3;
- (void)resetLastGestures;
- (void)savePersistentGestureData;
- (void)setDelegate:(id)a3;
- (void)setTypingMode:(int64_t)a3 keyboardSize:(CGSize)a4 shouldUseEightDotBraille:(BOOL)a5 shouldReverseDots:(BOOL)a6;
- (void)unlearnLastGesture;
@end

@implementation VOTBrailleGesturePatternRecognitionEngine

- (VOTBrailleGesturePatternRecognitionEngine)init
{
  v12.receiver = self;
  v12.super_class = (Class)VOTBrailleGesturePatternRecognitionEngine;
  v2 = [(VOTBrailleGesturePatternRecognitionEngine *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_typingMode = 1;
    *(_WORD *)&v2->_shouldUseEightDotBraille = 0;
    v4 = [VOTBrailleGestureDataRepository alloc];
    v5 = [(VOTBrailleGestureDataRepository *)v4 initWithTypingMode:v3->_typingMode keyboardSize:0 shouldUseEightDotBraille:xmmword_1001EBE30];
    repository = v3->_repository;
    v3->_repository = v5;

    v7 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = NSStringFromCGSize((CGSize)xmmword_1001EBE30);
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "initializing gesture repo with: %@", buf, 0xCu);
    }
    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    lastBrailleGestures = v3->_lastBrailleGestures;
    v3->_lastBrailleGestures = v9;
  }
  return v3;
}

- (id)printBrailleForTouchPoints:(id)a3 shouldLearn:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = +[NSMutableArray array];
  v10 = +[NSMutableArray array];
  [(VOTBrailleGesturePatternRecognitionEngine *)self _populateLeftTouchPoints:v9 rightTouchPoints:v10 fromTouchPoints:v8];

  if (self->_shouldUseEightDotBraille) {
    unint64_t v11 = 4;
  }
  else {
    unint64_t v11 = 3;
  }
  if ((unint64_t)[v9 count] <= v11 && (unint64_t)objc_msgSend(v10, "count") <= v11)
  {
    v13 = [(VOTBrailleGesturePatternRecognitionEngine *)self _halfPatternFromTouches:v9 side:0];
    v14 = [(VOTBrailleGesturePatternRecognitionEngine *)self _halfPatternFromTouches:v10 side:1];
    v15 = [[VOTBrailleGesturePattern alloc] initWithLeftDots:v13 rightDots:v14];
    if (v6)
    {
      [(VOTBrailleGestureDataRepository *)self->_repository updateDriftWithPattern:v15];
      [(NSMutableArray *)self->_lastBrailleGestures addObject:v15];
    }
    objc_super v12 = +[NSString stringWithFormat:@"%C", [(VOTBrailleGesturePatternRecognitionEngine *)self printBrailleCharacterFromBraillePattern:v15]];
  }
  else if (a5)
  {
    +[NSError errorWithDomain:@"VOTBrailleGestureErrorDomain" code:1 userInfo:0];
    objc_super v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v12 = 0;
  }

  return v12;
}

- (void)unlearnLastGesture
{
  if ([(NSMutableArray *)self->_lastBrailleGestures count])
  {
    repository = self->_repository;
    v4 = [(NSMutableArray *)self->_lastBrailleGestures lastObject];
    [(VOTBrailleGestureDataRepository *)repository removeDriftAddedByPattern:v4];

    lastBrailleGestures = self->_lastBrailleGestures;
    [(NSMutableArray *)lastBrailleGestures removeLastObject];
  }
}

- (void)resetLastGestures
{
}

- (void)savePersistentGestureData
{
}

- (void)setTypingMode:(int64_t)a3 keyboardSize:(CGSize)a4 shouldUseEightDotBraille:(BOOL)a5 shouldReverseDots:(BOOL)a6
{
  BOOL v7 = a5;
  double height = a4.height;
  double width = a4.width;
  if (self->_typingMode != a3
    || (self->_keyboardSize.width == a4.width ? (BOOL v12 = self->_keyboardSize.height == a4.height) : (BOOL v12 = 0),
        !v12 || self->_shouldUseEightDotBraille != a5 || self->_shouldReverseDots != a6))
  {
    [(VOTBrailleGesturePatternRecognitionEngine *)self resetLastGestures];
    [(VOTBrailleGestureDataRepository *)self->_repository saveDrift];
    self->_typingMode = a3;
    self->_keyboardSize.double width = width;
    self->_keyboardSize.double height = height;
    self->_shouldUseEightDotBraille = v7;
    self->_shouldReverseDots = a6;
    v13 = -[VOTBrailleGestureDataRepository initWithTypingMode:keyboardSize:shouldUseEightDotBraille:]([VOTBrailleGestureDataRepository alloc], "initWithTypingMode:keyboardSize:shouldUseEightDotBraille:", self->_typingMode, v7, width, height);
    repository = self->_repository;
    self->_repository = v13;
    _objc_release_x1(v13, repository);
  }
}

- (id)dotNumberPositions
{
  return [(VOTBrailleGestureDataRepository *)self->_repository dotNumberPositions];
}

- (void)calibrateWithTouchPoints:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  BOOL v6 = +[NSMutableArray array];
  [(VOTBrailleGesturePatternRecognitionEngine *)self _populateLeftTouchPoints:v5 rightTouchPoints:v6 fromTouchPoints:v4];

  BOOL v7 = [(VOTBrailleGesturePatternRecognitionEngine *)self _sortTouches:v5 fromTopToBottomForSide:0];
  id v8 = [(VOTBrailleGesturePatternRecognitionEngine *)self _sortTouches:v6 fromTopToBottomForSide:1];
  BOOL shouldUseEightDotBraille = self->_shouldUseEightDotBraille;
  id v10 = [v7 count];
  if (!shouldUseEightDotBraille)
  {
    if (v10 == (id)3 && [v8 count] == (id)3)
    {
      v25 = [v7 objectAtIndexedSubscript:0];
      v26[0] = v25;
      v24 = [v7 objectAtIndexedSubscript:1];
      v26[1] = v24;
      v16 = [v7 objectAtIndexedSubscript:2];
      v26[2] = v16;
      v17 = [v8 objectAtIndexedSubscript:0];
      v26[3] = v17;
      v18 = [v8 objectAtIndexedSubscript:1];
      v26[4] = v18;
      v19 = [v8 objectAtIndexedSubscript:2];
      v26[5] = v19;
      v15 = +[NSArray arrayWithObjects:v26 count:6];

      goto LABEL_9;
    }
    v20 = v7;
    v21 = v8;
LABEL_11:
    _AXAssert();
    v15 = 0;
    goto LABEL_12;
  }
  if (v10 != (id)4 || [v8 count] != (id)4)
  {
    v20 = v7;
    v21 = v8;
    goto LABEL_11;
  }
  v25 = [v7 objectAtIndexedSubscript:0];
  v27[0] = v25;
  v24 = [v7 objectAtIndexedSubscript:1];
  v27[1] = v24;
  v23 = [v7 objectAtIndexedSubscript:2];
  v27[2] = v23;
  v22 = [v8 objectAtIndexedSubscript:0];
  v27[3] = v22;
  unint64_t v11 = [v8 objectAtIndexedSubscript:1];
  v27[4] = v11;
  BOOL v12 = [v8 objectAtIndexedSubscript:2];
  v27[5] = v12;
  v13 = [v7 objectAtIndexedSubscript:3];
  v27[6] = v13;
  v14 = [v8 objectAtIndexedSubscript:3];
  v27[7] = v14;
  v15 = +[NSArray arrayWithObjects:v27 count:8];

LABEL_9:
LABEL_12:
  -[VOTBrailleGestureDataRepository calibrateWithDotNumberPositions:](self->_repository, "calibrateWithDotNumberPositions:", v15, v20, v21);
}

- (BOOL)shouldUseEightDotBraille
{
  return self->_shouldUseEightDotBraille;
}

- (BOOL)shouldReverseDots
{
  return self->_shouldReverseDots;
}

- (BOOL)areDotNumberPositionsCalibrated
{
  return [(VOTBrailleGestureDataRepository *)self->_repository areDotNumberPositionsCalibrated];
}

- (void)_populateLeftTouchPoints:(id)a3 rightTouchPoints:(id)a4 fromTouchPoints:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double width = self->_keyboardSize.width;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    double v14 = width * 0.5;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v10);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_msgSend(v17, "ax_CGPointValue");
        int64_t typingMode = self->_typingMode;
        BOOL v20 = typingMode == 1;
        if (typingMode == 1) {
          id v21 = v8;
        }
        else {
          id v21 = v9;
        }
        if (v20) {
          id v22 = v9;
        }
        else {
          id v22 = v8;
        }
        if (v18 >= v14) {
          v23 = v22;
        }
        else {
          v23 = v21;
        }
        [v23 addObject:v17];
      }
      id v13 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }
}

- (unsigned)printBrailleCharacterFromBraillePattern:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(VOTBrailleGesturePatternRecognitionEngine *)self shouldUseEightDotBraille];
  unsigned int v6 = [(VOTBrailleGesturePatternRecognitionEngine *)self shouldReverseDots];
  BOOL v7 = [v4 leftDots];
  id v8 = [v7 topDot];

  id v9 = [v4 leftDots];
  id v10 = [v9 middleDot];

  if (v5)
  {
    if (v6) {
      __int16 v11 = 10304;
    }
    else {
      __int16 v11 = 10241;
    }
    if (v6) {
      __int16 v12 = 4;
    }
    else {
      __int16 v12 = 2;
    }
    if (v6) {
      __int16 v13 = 2;
    }
    else {
      __int16 v13 = 4;
    }
    if (v6) {
      __int16 v14 = 1;
    }
    else {
      __int16 v14 = 64;
    }
    if (v6) {
      __int16 v15 = 128;
    }
    else {
      __int16 v15 = 8;
    }
    if (v6) {
      __int16 v16 = 32;
    }
    else {
      __int16 v16 = 16;
    }
    if (v6) {
      __int16 v17 = 16;
    }
    else {
      __int16 v17 = 32;
    }
    if (!v8) {
      __int16 v11 = 10240;
    }
    if (v10) {
      __int16 v18 = v12;
    }
    else {
      __int16 v18 = 0;
    }
    __int16 v19 = v18 | v11;
    BOOL v20 = [v4 leftDots];
    id v21 = [v20 bottomDot];

    if (!v21) {
      __int16 v13 = 0;
    }
    id v22 = [v4 leftDots];
    v23 = [v22 fourthDot];

    if (v23) {
      __int16 v24 = v14;
    }
    else {
      __int16 v24 = 0;
    }
    __int16 v25 = v19 + v13 + v24;
    long long v26 = [v4 rightDots];
    long long v27 = [v26 topDot];

    if (v27) {
      __int16 v28 = v15;
    }
    else {
      __int16 v28 = 0;
    }
    v29 = [v4 rightDots];
    v30 = [v29 middleDot];

    if (v30) {
      __int16 v31 = v16;
    }
    else {
      __int16 v31 = 0;
    }
    __int16 v32 = v28 + v31;
    v33 = [v4 rightDots];
    v34 = [v33 bottomDot];

    if (v34) {
      __int16 v35 = v17;
    }
    else {
      __int16 v35 = 0;
    }
    unsigned __int16 v36 = v25 + v32 + v35;
    v37 = [v4 rightDots];

    v38 = [v37 fourthDot];

    if (v38)
    {
      if (v6) {
        __int16 v39 = 8;
      }
      else {
        __int16 v39 = 128;
      }
      v36 += v39;
    }
  }
  else
  {
    if (v6) {
      __int16 v40 = 10244;
    }
    else {
      __int16 v40 = 10241;
    }
    if (v6) {
      __int16 v41 = 1;
    }
    else {
      __int16 v41 = 4;
    }
    if (v6) {
      __int16 v42 = 32;
    }
    else {
      __int16 v42 = 8;
    }
    if (!v8) {
      __int16 v40 = 10240;
    }
    if (v10) {
      __int16 v43 = v40 | 2;
    }
    else {
      __int16 v43 = v40;
    }
    v44 = [v4 leftDots];
    v45 = [v44 bottomDot];

    if (!v45) {
      __int16 v41 = 0;
    }
    v46 = [v4 rightDots];
    v47 = [v46 topDot];

    if (v47) {
      __int16 v48 = v42;
    }
    else {
      __int16 v48 = 0;
    }
    unsigned __int16 v49 = v41 + v48 + v43;
    v50 = [v4 rightDots];
    v51 = [v50 middleDot];

    if (v51) {
      unsigned __int16 v36 = v49 + 16;
    }
    else {
      unsigned __int16 v36 = v49;
    }
    v52 = [v4 rightDots];

    v53 = [v52 bottomDot];

    if (v6) {
      __int16 v54 = 8;
    }
    else {
      __int16 v54 = 32;
    }
    unsigned __int16 v55 = v36 + v54;
    if (v53) {
      return v55;
    }
  }
  return v36;
}

- (id)_halfPatternFromTouches:(id)a3 side:(unint64_t)a4
{
  unsigned int v6 = -[VOTBrailleGesturePatternRecognitionEngine _sortTouches:fromTopToBottomForSide:](self, "_sortTouches:fromTopToBottomForSide:", a3);
  BOOL v7 = -[VOTBrailleGestureDataRepository halfPatternsForNumberOfDots:side:](self->_repository, "halfPatternsForNumberOfDots:side:", [v6 count], a4);
  if ([v7 count] == (id)1) {
    [v7 firstObject];
  }
  else {
  id v8 = [(VOTBrailleGesturePatternRecognitionEngine *)self _closestHalfPatternForOrderedTouches:v6 possibleMatches:v7 side:a4];
  }
  id v9 = [(VOTBrailleGesturePatternRecognitionEngine *)self _halfPatternFromOrderedTouches:v6 correspondingHalfPattern:v8];

  return v9;
}

- (id)_closestHalfPatternForOrderedTouches:(id)a3 possibleMatches:(id)a4 side:(unint64_t)a5
{
  id v7 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = a4;
  id v8 = [obj countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v8)
  {
    id v10 = v8;
    __int16 v11 = 0;
    uint64_t v12 = *(void *)v26;
    double v13 = 1.79769313e308;
    *(void *)&long long v9 = 138544130;
    long long v23 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        __int16 v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        __int16 v16 = -[VOTBrailleGesturePatternRecognitionEngine _orderedTouchesFromHalfPattern:](self, "_orderedTouchesFromHalfPattern:", v15, v23);
        [(VOTBrailleGesturePatternRecognitionEngine *)self _totalDistanceBetweenCorrespondingPointsInTouches:v7 andTouches:v16];
        double v18 = v17;

        __int16 v19 = VOTLogBrailleGestures();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          BOOL v20 = [(VOTBrailleGesturePatternRecognitionEngine *)self _orderedTouchesFromHalfPattern:v15];
          *(_DWORD *)buf = v23;
          id v30 = v7;
          __int16 v31 = 2114;
          __int16 v32 = v15;
          __int16 v33 = 2114;
          v34 = v20;
          __int16 v35 = 2048;
          double v36 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Distance between %{public}@ and %{public}@ (with ordered touches %{public}@) was %f.", buf, 0x2Au);
        }
        if (v18 < v13)
        {
          id v21 = v15;

          double v13 = v18;
          __int16 v11 = v21;
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v10);
  }
  else
  {
    __int16 v11 = 0;
  }

  return v11;
}

- (id)_halfPatternFromOrderedTouches:(id)a3 correspondingHalfPattern:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(VOTBrailleGestureHalfPattern);
  uint64_t v8 = [v6 topDot];

  if (v8)
  {
    long long v9 = [v5 objectAtIndexedSubscript:0];
    [(VOTBrailleGestureHalfPattern *)v7 setTopDot:v9];

    uint64_t v8 = 1;
  }
  id v10 = [v6 middleDot];

  if (v10)
  {
    uint64_t v11 = v8 + 1;
    uint64_t v12 = [v5 objectAtIndexedSubscript:v8];
    [(VOTBrailleGestureHalfPattern *)v7 setMiddleDot:v12];

    uint64_t v8 = v11;
  }
  double v13 = [v6 bottomDot];

  if (v13)
  {
    uint64_t v14 = v8 + 1;
    __int16 v15 = [v5 objectAtIndexedSubscript:v8];
    [(VOTBrailleGestureHalfPattern *)v7 setBottomDot:v15];

    uint64_t v8 = v14;
  }
  __int16 v16 = [v6 fourthDot];

  if (v16)
  {
    double v17 = [v5 objectAtIndexedSubscript:v8];
    [(VOTBrailleGestureHalfPattern *)v7 setFourthDot:v17];
  }

  return v7;
}

- (double)_totalDistanceBetweenCorrespondingPointsInTouches:(id)a3 andTouches:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    unint64_t v8 = 0;
    double v9 = 0.0;
    do
    {
      id v10 = [v6 objectAtIndexedSubscript:v8];
      [v10 CGPointValue];
      double v12 = v11;
      double v14 = v13;
      __int16 v15 = [v7 objectAtIndexedSubscript:v8];
      [v15 CGPointValue];
      -[VOTBrailleGesturePatternRecognitionEngine _distanceBetweenPoint:andPoint:](self, "_distanceBetweenPoint:andPoint:", v12, v14, v16, v17);
      double v9 = v9 + v18;

      ++v8;
    }
    while ((unint64_t)[v6 count] > v8);
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (id)_orderedTouchesFromHalfPattern:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:3];
  id v5 = [v3 topDot];

  if (v5)
  {
    id v6 = [v3 topDot];
    [v4 addObject:v6];
  }
  id v7 = [v3 middleDot];

  if (v7)
  {
    unint64_t v8 = [v3 middleDot];
    [v4 addObject:v8];
  }
  double v9 = [v3 bottomDot];

  if (v9)
  {
    id v10 = [v3 bottomDot];
    [v4 addObject:v10];
  }
  double v11 = [v3 fourthDot];

  if (v11)
  {
    double v12 = [v3 fourthDot];
    [v4 addObject:v12];
  }

  return v4;
}

- (double)_distanceBetweenPoint:(CGPoint)a3 andPoint:(CGPoint)a4
{
  return sqrt((a3.x - a4.x) * (a3.x - a4.x) + (a3.y - a4.y) * (a3.y - a4.y));
}

- (id)_sortTouches:(id)a3 fromTopToBottomForSide:(unint64_t)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000EC4C0;
  v6[3] = &unk_1001B6968;
  v6[4] = self;
  v6[5] = a4;
  id v4 = [a3 sortedArrayUsingComparator:v6];

  return v4;
}

- (BOOL)_halfPattern:(id)a3 hasSameDotsAsHalfPattern:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 topDot];
  double v9 = [v7 topDot];
  if ([(VOTBrailleGesturePatternRecognitionEngine *)self _bothObjectsAreNilOrBothAreNonNil:v8 object:v9])
  {
    id v10 = [v6 middleDot];
    double v11 = [v7 middleDot];
    if ([(VOTBrailleGesturePatternRecognitionEngine *)self _bothObjectsAreNilOrBothAreNonNil:v10 object:v11])
    {
      double v12 = [v6 bottomDot];
      double v13 = [v7 bottomDot];
      BOOL v14 = [(VOTBrailleGesturePatternRecognitionEngine *)self _bothObjectsAreNilOrBothAreNonNil:v12 object:v13];
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_bothObjectsAreNilOrBothAreNonNil:(id)a3 object:(id)a4
{
  if (a3) {
    BOOL v4 = a4 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  BOOL v5 = !v4;
  return !((unint64_t)a3 | (unint64_t)a4) || v5;
}

- (id)_averagePointValueWithDataCount:(unint64_t)a3 currentPointValue:(id)a4 newPointValue:(id)a5
{
  id v8 = a5;
  double v9 = v8;
  if (a4)
  {
    objc_msgSend(a4, "ax_CGPointValue");
    double v11 = v10;
    double v13 = v12;
    objc_msgSend(v9, "ax_CGPointValue");
    -[VOTBrailleGesturePatternRecognitionEngine _averageOfOldPoint:newPoint:dataCount:](self, "_averageOfOldPoint:newPoint:dataCount:", a3, v11, v13, v14, v15);
    +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = v8;
  }
  double v17 = v16;

  return v17;
}

- (CGPoint)_averageOfOldPoint:(CGPoint)a3 newPoint:(CGPoint)a4 dataCount:(unint64_t)a5
{
  double y = a4.y;
  double v7 = a3.y;
  -[VOTBrailleGesturePatternRecognitionEngine _averageOfOldFloat:newFloat:dataCount:](self, "_averageOfOldFloat:newFloat:dataCount:", a3.x, a4.x);
  double v10 = v9;
  [(VOTBrailleGesturePatternRecognitionEngine *)self _averageOfOldFloat:a5 newFloat:v7 dataCount:y];
  double v12 = v11;
  double v13 = v10;
  result.double y = v12;
  result.x = v13;
  return result;
}

- (double)_averageOfOldFloat:(double)a3 newFloat:(double)a4 dataCount:(unint64_t)a5
{
  return (float)(1.0 / (float)((float)a5 + 1.0)) * a4 + a3 * (float)((float)a5 / (float)((float)a5 + 1.0));
}

- (VOTBrailleGesturePatternRecognitionEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VOTBrailleGesturePatternRecognitionEngineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastBrailleGestures, 0);

  objc_storeStrong((id *)&self->_repository, 0);
}

@end