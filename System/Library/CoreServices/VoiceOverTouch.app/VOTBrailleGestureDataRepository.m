@interface VOTBrailleGestureDataRepository
- (BOOL)_allDotsAreOnScreen:(id)a3 withDrift:(CGPoint)a4;
- (BOOL)areDotNumberPositionsCalibrated;
- (BOOL)saveDrift;
- (CGPoint)_averageLeftDrift;
- (CGPoint)_averageRecentDriftFromDrifts:(id)a3;
- (CGPoint)_averageRightDrift;
- (CGPoint)_driftByAddingDisplacementOfPointValue:(id)a3 fromPointValue:(id)a4 toDrift:(CGPoint)a5;
- (CGPoint)_driftOfHalfPattern:(id)a3 relativeToDotPositions:(id)a4;
- (NSMutableArray)leftDrifts;
- (NSMutableArray)rightDrifts;
- (VOTBrailleGestureDataRepository)initWithTypingMode:(int64_t)a3 keyboardSize:(CGSize)a4 shouldUseEightDotBraille:(BOOL)a5;
- (VOTBrailleGestureHalfPattern)leftDotPositions;
- (VOTBrailleGestureHalfPattern)rightDotPositions;
- (id)_adjustPointValue:(id)a3 withDrift:(CGPoint)a4;
- (id)_arrayOfDictionariesFromPointValues:(id)a3;
- (id)_calibratedDotPositionsFilePath;
- (id)_filenameSuffix;
- (id)_gestureDataDirectory;
- (id)_loadDataFromFile:(id)a3;
- (id)_mutableArrayOfPointValuesFromDictionaries:(id)a3;
- (id)_mutableArrayOfZeroPointValues:(unint64_t)a3;
- (id)_recordedDriftsFilePath;
- (id)dotNumberPositions;
- (id)halfPatternsForNumberOfDots:(unint64_t)a3 side:(unint64_t)a4;
- (unint64_t)_totalNumberOfDots;
- (void)_addInstanceOfDrift:(CGPoint)a3 toArray:(id)a4 forPattern:(id)a5;
- (void)_appendDots:(id)a3 toPositionsArray:(id)a4 withDrift:(CGPoint)a5;
- (void)_deleteCalibratedData;
- (void)_generateInitialData;
- (void)_generateScreenAwayInitialData;
- (void)_generateTableTopInitialData;
- (void)_getEightDotTableTopMiddleLeftDot:(CGPoint *)a3 middleRightDot:(CGPoint *)a4 bottomLeftDot:(CGPoint *)a5 bottomRightDot:(CGPoint *)a6 angleFromXAxisToLineOfHand:(double)a7 topLeftDot:(CGPoint)a8;
- (void)_getMiddleDotsForSixDotTableTopInitialDataForLeft:(CGPoint *)a3 right:(CGPoint *)a4 angleFromXAxisToLineOfHand:(double)a5 topLeftDot:(CGPoint)a6;
- (void)_loadAllDataFromFiles;
- (void)_orderedLeftDots:(id *)a3 rightDots:(id *)a4;
- (void)_removeInstanceOfDriftFromArray:(id)a3;
- (void)_repairFileProtectionClassOnPathIfNecessary:(id)a3;
- (void)_resetLearnedData;
- (void)calibrateWithDotNumberPositions:(id)a3;
- (void)removeDriftAddedByPattern:(id)a3;
- (void)setLeftDotPositions:(id)a3;
- (void)setLeftDrifts:(id)a3;
- (void)setRightDotPositions:(id)a3;
- (void)setRightDrifts:(id)a3;
- (void)updateDriftWithPattern:(id)a3;
@end

@implementation VOTBrailleGestureDataRepository

- (VOTBrailleGestureDataRepository)initWithTypingMode:(int64_t)a3 keyboardSize:(CGSize)a4 shouldUseEightDotBraille:(BOOL)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v12.receiver = self;
  v12.super_class = (Class)VOTBrailleGestureDataRepository;
  v9 = [(VOTBrailleGestureDataRepository *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_typingMode = a3;
    v9->_keyboardSize.CGFloat width = width;
    v9->_keyboardSize.CGFloat height = height;
    v9->_shouldUseEightDotBraille = a5;
    [(VOTBrailleGestureDataRepository *)v9 _loadAllDataFromFiles];
  }
  return v10;
}

- (id)halfPatternsForNumberOfDots:(unint64_t)a3 side:(unint64_t)a4
{
  id v29 = +[NSMutableArray array];
  double v7 = exp2((double)([(VOTBrailleGestureDataRepository *)self _totalNumberOfDots] >> 1));
  if (v7 > 0.0)
  {
    double v8 = v7;
    uint64_t v9 = 0;
    v30 = self;
    unint64_t v22 = a3;
    while ((v9 & 1)
          + ((unint64_t)(v9 & 2) >> 1)
          + ((unint64_t)(v9 & 4) >> 2)
          + ((unint64_t)(v9 & 8) >> 3) != a3)
    {
LABEL_23:
      if (v8 <= (double)(unint64_t)++v9) {
        goto LABEL_24;
      }
    }
    if (a4)
    {
      v31 = [(VOTBrailleGestureDataRepository *)self rightDotPositions];
      [(VOTBrailleGestureDataRepository *)self _averageRightDrift];
    }
    else
    {
      v31 = [(VOTBrailleGestureDataRepository *)self leftDotPositions];
      [(VOTBrailleGestureDataRepository *)self _averageLeftDrift];
    }
    double v12 = v10;
    double v13 = v11;
    if (v9)
    {
      v26 = [v31 topDot];
      uint64_t v14 = [(VOTBrailleGestureDataRepository *)self _adjustPointValue:v12 withDrift:v13];
      v23 = (void *)v14;
      if ((v9 & 2) != 0)
      {
LABEL_9:
        v27 = [v31 middleDot];
        uint64_t v15 = [(VOTBrailleGestureDataRepository *)self _adjustPointValue:v12 withDrift:v13];
        v24 = (void *)v15;
        if ((v9 & 4) != 0) {
          goto LABEL_10;
        }
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v14 = 0;
      if ((v9 & 2) != 0) {
        goto LABEL_9;
      }
    }
    uint64_t v15 = 0;
    if ((v9 & 4) != 0)
    {
LABEL_10:
      v28 = [v31 bottomDot];
      uint64_t v16 = [(VOTBrailleGestureDataRepository *)self _adjustPointValue:v12 withDrift:v13];
      v25 = (void *)v16;
      if ((v9 & 8) != 0) {
        goto LABEL_11;
      }
      goto LABEL_16;
    }
LABEL_15:
    uint64_t v16 = 0;
    if ((v9 & 8) != 0)
    {
LABEL_11:
      [v31 fourthDot];
      v18 = unint64_t v17 = a4;
      v19 = -[VOTBrailleGestureDataRepository _adjustPointValue:withDrift:](v30, "_adjustPointValue:withDrift:", v18, v12, v13);
      v20 = +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:v14 middleDot:v15 bottomDot:v16 fourthDot:v19];

      a4 = v17;
      a3 = v22;
      if ((v9 & 4) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
LABEL_16:
    v20 = +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:v14 middleDot:v15 bottomDot:v16 fourthDot:0];
    if ((v9 & 4) == 0)
    {
LABEL_18:
      self = v30;
      if ((v9 & 2) != 0)
      {
      }
      if (v9)
      {
      }
      [v29 addObject:v20];

      goto LABEL_23;
    }
LABEL_17:

    goto LABEL_18;
  }
LABEL_24:

  return v29;
}

- (void)updateDriftWithPattern:(id)a3
{
  id v4 = a3;
  v5 = [v4 leftDots];
  id v6 = [v5 count];

  if (v6)
  {
    double v7 = [v4 leftDots];
    double v8 = [(VOTBrailleGestureDataRepository *)self leftDotPositions];
    [(VOTBrailleGestureDataRepository *)self _driftOfHalfPattern:v7 relativeToDotPositions:v8];
    double v10 = v9;
    double v12 = v11;

    double v13 = [(VOTBrailleGestureDataRepository *)self leftDrifts];
    uint64_t v14 = [v4 leftDots];
    -[VOTBrailleGestureDataRepository _addInstanceOfDrift:toArray:forPattern:](self, "_addInstanceOfDrift:toArray:forPattern:", v13, v14, v10, v12);

    uint64_t v15 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v35.x = v10;
      v35.y = v12;
      uint64_t v16 = NSStringFromPoint(v35);
      unint64_t v17 = [(VOTBrailleGestureDataRepository *)self leftDrifts];
      int v31 = 138543618;
      v32 = v16;
      __int16 v33 = 2114;
      v34 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Added left drift %{public}@.  Recorded drifts are now %{public}@", (uint8_t *)&v31, 0x16u);
    }
  }
  v18 = [v4 rightDots];
  id v19 = [v18 count];

  if (v19)
  {
    v20 = [v4 rightDots];
    v21 = [(VOTBrailleGestureDataRepository *)self rightDotPositions];
    [(VOTBrailleGestureDataRepository *)self _driftOfHalfPattern:v20 relativeToDotPositions:v21];
    double v23 = v22;
    double v25 = v24;

    v26 = [(VOTBrailleGestureDataRepository *)self rightDrifts];
    v27 = [v4 rightDots];
    -[VOTBrailleGestureDataRepository _addInstanceOfDrift:toArray:forPattern:](self, "_addInstanceOfDrift:toArray:forPattern:", v26, v27, v23, v25);

    v28 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v36.x = v23;
      v36.y = v25;
      id v29 = NSStringFromPoint(v36);
      v30 = [(VOTBrailleGestureDataRepository *)self rightDrifts];
      int v31 = 138543618;
      v32 = v29;
      __int16 v33 = 2114;
      v34 = v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Added right drift %{public}@.  Recorded drifts are now %{public}@", (uint8_t *)&v31, 0x16u);
    }
  }
}

- (void)removeDriftAddedByPattern:(id)a3
{
  id v4 = a3;
  v5 = [v4 leftDots];
  id v6 = [v5 count];

  if (v6)
  {
    double v7 = [(VOTBrailleGestureDataRepository *)self leftDrifts];
    [(VOTBrailleGestureDataRepository *)self _removeInstanceOfDriftFromArray:v7];

    double v8 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = [(VOTBrailleGestureDataRepository *)self leftDrifts];
      int v15 = 138543362;
      uint64_t v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removed left drift.  Recorded drifts are now %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  double v10 = [v4 rightDots];
  id v11 = [v10 count];

  if (v11)
  {
    double v12 = [(VOTBrailleGestureDataRepository *)self rightDrifts];
    [(VOTBrailleGestureDataRepository *)self _removeInstanceOfDriftFromArray:v12];

    double v13 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(VOTBrailleGestureDataRepository *)self rightDrifts];
      int v15 = 138543362;
      uint64_t v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Removed right drift.  Recorded drifts are now %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (BOOL)saveDrift
{
  v3 = [(VOTBrailleGestureDataRepository *)self leftDrifts];
  id v4 = [v3 count];

  if ((unint64_t)v4 >= 6)
  {
    v5 = [(VOTBrailleGestureDataRepository *)self leftDrifts];
    id v6 = [(VOTBrailleGestureDataRepository *)self leftDrifts];
    objc_msgSend(v5, "removeObjectsInRange:", 0, (char *)objc_msgSend(v6, "count") - 5);
  }
  double v7 = [(VOTBrailleGestureDataRepository *)self rightDrifts];
  id v8 = [v7 count];

  if ((unint64_t)v8 >= 6)
  {
    double v9 = [(VOTBrailleGestureDataRepository *)self rightDrifts];
    double v10 = [(VOTBrailleGestureDataRepository *)self rightDrifts];
    objc_msgSend(v9, "removeObjectsInRange:", 0, (char *)objc_msgSend(v10, "count") - 5);
  }
  v20[0] = @"Left";
  id v11 = [(VOTBrailleGestureDataRepository *)self leftDrifts];
  double v12 = [(VOTBrailleGestureDataRepository *)self _arrayOfDictionariesFromPointValues:v11];
  v20[1] = @"Right";
  v21[0] = v12;
  double v13 = [(VOTBrailleGestureDataRepository *)self rightDrifts];
  uint64_t v14 = [(VOTBrailleGestureDataRepository *)self _arrayOfDictionariesFromPointValues:v13];
  v21[1] = v14;
  int v15 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

  uint64_t v16 = [(VOTBrailleGestureDataRepository *)self _recordedDriftsFilePath];
  unsigned int v17 = [v15 writeToFile:v16 atomically:1];
  if (v17)
  {
    [(VOTBrailleGestureDataRepository *)self _repairFileProtectionClassOnPathIfNecessary:v16];
  }
  else
  {
    v18 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100121FB8();
    }
  }
  return v17;
}

- (id)dotNumberPositions
{
  v3 = +[NSMutableArray array];
  id v7 = 0;
  id v8 = 0;
  [(VOTBrailleGestureDataRepository *)self _orderedLeftDots:&v8 rightDots:&v7];
  id v4 = v8;
  id v5 = v7;
  [(VOTBrailleGestureDataRepository *)self _averageLeftDrift];
  -[VOTBrailleGestureDataRepository _appendDots:toPositionsArray:withDrift:](self, "_appendDots:toPositionsArray:withDrift:", v4, v3);
  [(VOTBrailleGestureDataRepository *)self _averageRightDrift];
  -[VOTBrailleGestureDataRepository _appendDots:toPositionsArray:withDrift:](self, "_appendDots:toPositionsArray:withDrift:", v5, v3);

  return v3;
}

- (void)_orderedLeftDots:(id *)a3 rightDots:(id *)a4
{
  id v7 = +[AXSettings sharedInstance];
  id v8 = [v7 voiceOverTouchBrailleShouldReverseDots];

  if (a3)
  {
    double v9 = [(VOTBrailleGestureDataRepository *)self leftDotPositions];
    *a3 = [v9 dotArrayReversed:v8];
  }
  if (a4)
  {
    id v10 = [(VOTBrailleGestureDataRepository *)self rightDotPositions];
    *a4 = [v10 dotArrayReversed:v8];
  }
}

- (void)_appendDots:(id)a3 toPositionsArray:(id)a4 withDrift:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v9);
        }
        int v15 = -[VOTBrailleGestureDataRepository _adjustPointValue:withDrift:](self, "_adjustPointValue:withDrift:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v14), x, y);
        [v10 addObject:v15];

        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (BOOL)_allDotsAreOnScreen:(id)a3 withDrift:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  long long v8 = xmmword_1001EBE30;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = -[VOTBrailleGestureDataRepository _adjustPointValue:withDrift:](self, "_adjustPointValue:withDrift:", *(void *)(*((void *)&v23 + 1) + 8 * i), x, y, (void)v23);
        objc_msgSend(v14, "ax_CGPointValue");
        v34.double x = v15;
        v34.double y = v16;
        v35.origin.double x = 0.0;
        v35.origin.double y = 0.0;
        v35.size.CGFloat width = *((CGFloat *)&v8 + 1);
        *(void *)&v35.size.CGFloat height = v8;
        BOOL v17 = CGRectContainsPoint(v35, v34);

        if (!v17)
        {
          BOOL v18 = 0;
          goto LABEL_11;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v33 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 1;
LABEL_11:

  long long v19 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v36.origin.double x = 0.0;
    v36.origin.double y = 0.0;
    v36.size.CGFloat width = *((CGFloat *)&v8 + 1);
    *(void *)&v36.size.CGFloat height = v8;
    v20 = NSStringFromRect(v36);
    v21 = "NO";
    *(_DWORD *)buf = 138412802;
    v28 = v20;
    if (v18) {
      v21 = "YES";
    }
    __int16 v29 = 2080;
    v30 = v21;
    __int16 v31 = 2112;
    id v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "all dots within screen rect %@ -> %s %@", buf, 0x20u);
  }
  return v18;
}

- (void)calibrateWithDotNumberPositions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if (v5 != (id)[(VOTBrailleGestureDataRepository *)self _totalNumberOfDots]) {
    _AXAssert();
  }
  if (self->_shouldUseEightDotBraille)
  {
    id v6 = [v4 objectAtIndexedSubscript:6];
  }
  else
  {
    id v6 = 0;
  }
  if (self->_shouldUseEightDotBraille)
  {
    id v7 = [v4 objectAtIndexedSubscript:7];
  }
  else
  {
    id v7 = 0;
  }
  long long v8 = [v4 objectAtIndexedSubscript:0];
  id v9 = [v4 objectAtIndexedSubscript:1];
  id v10 = [v4 objectAtIndexedSubscript:2];
  id v11 = +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:v8 middleDot:v9 bottomDot:v10 fourthDot:v6];
  [(VOTBrailleGestureDataRepository *)self setLeftDotPositions:v11];

  uint64_t v12 = [v4 objectAtIndexedSubscript:3];
  uint64_t v13 = [v4 objectAtIndexedSubscript:4];
  uint64_t v14 = [v4 objectAtIndexedSubscript:5];
  CGFloat v15 = +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:v12 middleDot:v13 bottomDot:v14 fourthDot:v7];
  [(VOTBrailleGestureDataRepository *)self setRightDotPositions:v15];

  CGFloat v16 = [(VOTBrailleGestureDataRepository *)self leftDotPositions];
  BOOL v17 = [v16 dictionaryRepresentation];

  BOOL v18 = [(VOTBrailleGestureDataRepository *)self rightDotPositions];
  long long v19 = [v18 dictionaryRepresentation];

  v23[0] = @"Left";
  v23[1] = @"Right";
  v24[0] = v17;
  v24[1] = v19;
  v20 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  v21 = [(VOTBrailleGestureDataRepository *)self _calibratedDotPositionsFilePath];
  if ([v20 writeToFile:v21 atomically:1])
  {
    [(VOTBrailleGestureDataRepository *)self _repairFileProtectionClassOnPathIfNecessary:v21];
    [(VOTBrailleGestureDataRepository *)self _resetLearnedData];
  }
  else
  {
    double v22 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100121FEC();
    }
  }
}

- (BOOL)areDotNumberPositionsCalibrated
{
  return self->_areDotNumberPositionsCalibrated;
}

- (CGPoint)_driftByAddingDisplacementOfPointValue:(id)a3 fromPointValue:(id)a4 toDrift:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a3;
  id v9 = a4;
  if (!v9) {
    _AXAssert();
  }
  objc_msgSend(v9, "ax_CGPointValue");
  if (v8)
  {
    double v12 = v10;
    double v13 = v11;
    objc_msgSend(v8, "ax_CGPointValue");
    double x = x + v14 - v12;
    double y = y + v15 - v13;
  }

  double v16 = x;
  double v17 = y;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)_driftOfHalfPattern:(id)a3 relativeToDotPositions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double y = CGPointZero.y;
  id v9 = [v6 topDot];
  double v10 = [v7 topDot];
  -[VOTBrailleGestureDataRepository _driftByAddingDisplacementOfPointValue:fromPointValue:toDrift:](self, "_driftByAddingDisplacementOfPointValue:fromPointValue:toDrift:", v9, v10, CGPointZero.x, y);
  double v12 = v11;
  double v14 = v13;

  double v15 = [v6 middleDot];
  double v16 = [v7 middleDot];
  -[VOTBrailleGestureDataRepository _driftByAddingDisplacementOfPointValue:fromPointValue:toDrift:](self, "_driftByAddingDisplacementOfPointValue:fromPointValue:toDrift:", v15, v16, v12, v14);
  double v18 = v17;
  double v20 = v19;

  v21 = [v6 bottomDot];
  double v22 = [v7 bottomDot];
  -[VOTBrailleGestureDataRepository _driftByAddingDisplacementOfPointValue:fromPointValue:toDrift:](self, "_driftByAddingDisplacementOfPointValue:fromPointValue:toDrift:", v21, v22, v18, v20);
  double v24 = v23;
  double v26 = v25;

  if (self->_shouldUseEightDotBraille)
  {
    v27 = [v6 fourthDot];
    v28 = [v7 fourthDot];
    -[VOTBrailleGestureDataRepository _driftByAddingDisplacementOfPointValue:fromPointValue:toDrift:](self, "_driftByAddingDisplacementOfPointValue:fromPointValue:toDrift:", v27, v28, v24, v26);
    double v24 = v29;
    double v26 = v30;
  }
  id v31 = [v6 count];
  if (v31)
  {
    double v24 = v24 / (double)(unint64_t)v31;
    double v26 = v26 / (double)(unint64_t)v31;
  }
  else if (v24 != CGPointZero.x || v26 != y)
  {
    _AXAssert();
  }

  double v33 = v24;
  double v34 = v26;
  result.double y = v34;
  result.double x = v33;
  return result;
}

- (void)_addInstanceOfDrift:(CGPoint)a3 toArray:(id)a4 forPattern:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  if (!v9) {
    _AXAssert();
  }
  double v11 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", x, y);
  [v9 addObject:v11];

  [(VOTBrailleGestureDataRepository *)self _averageRecentDriftFromDrifts:v9];
  double v13 = v12;
  double v15 = v14;
  double v16 = +[AXSettings sharedInstance];
  id v17 = [v16 voiceOverTouchBrailleShouldReverseDots];

  double v18 = [v10 dotArrayReversed:v17];
  if (!-[VOTBrailleGestureDataRepository _allDotsAreOnScreen:withDrift:](self, "_allDotsAreOnScreen:withDrift:", v18, v13, v15))
  {
    double v19 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100122020(v19, x, y);
    }

    [v9 removeLastObject];
  }
}

- (void)_removeInstanceOfDriftFromArray:(id)a3
{
  id v3 = a3;
  if (!v3) {
    _AXAssert();
  }
  if ((unint64_t)[v3 count] < 6)
  {
    id v4 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Could not remove last instance of drift.  This is expected if we backspaced further than the text we had entered in this run.", v5, 2u);
    }
  }
  else
  {
    [v3 removeLastObject];
  }
}

- (CGPoint)_averageRecentDriftFromDrifts:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 count];
  if ((unint64_t)v4 <= 4)
  {
    CGFloat x = CGPointZero.x;
    CGFloat y = CGPointZero.y;
    _AXAssert();
  }
  else
  {
    id v5 = objc_msgSend(v3, "subarrayWithRange:", v4 - 5, 5);
    CGFloat x = sub_10003DDE8(v5);
    CGFloat y = v7;
  }
  double v9 = x;
  double v10 = y;
  result.CGFloat y = v10;
  result.CGFloat x = v9;
  return result;
}

- (CGPoint)_averageLeftDrift
{
  id v3 = [(VOTBrailleGestureDataRepository *)self leftDrifts];
  [(VOTBrailleGestureDataRepository *)self _averageRecentDriftFromDrifts:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.CGFloat y = v9;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)_averageRightDrift
{
  id v3 = [(VOTBrailleGestureDataRepository *)self rightDrifts];
  [(VOTBrailleGestureDataRepository *)self _averageRecentDriftFromDrifts:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.CGFloat y = v9;
  result.CGFloat x = v8;
  return result;
}

- (id)_adjustPointValue:(id)a3 withDrift:(CGPoint)a4
{
  if (a3)
  {
    double y = a4.y;
    double x = a4.x;
    objc_msgSend(a3, "ax_CGPointValue");
    double v9 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", x + v7, y + v8);
  }
  else
  {
    double v9 = 0;
  }
  return v9;
}

- (unint64_t)_totalNumberOfDots
{
  if (self->_shouldUseEightDotBraille) {
    return 8;
  }
  else {
    return 6;
  }
}

- (void)_resetLearnedData
{
  id v3 = +[NSFileManager defaultManager];
  uint64_t v4 = [(VOTBrailleGestureDataRepository *)self _recordedDriftsFilePath];
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    double v6 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deleting recorded drifts", buf, 2u);
    }

    double v7 = [(VOTBrailleGestureDataRepository *)self _recordedDriftsFilePath];
    id v11 = 0;
    unsigned __int8 v8 = [v3 removeItemAtPath:v7 error:&v11];
    id v9 = v11;

    if ((v8 & 1) == 0)
    {
      double v10 = VOTLogBrailleGestures();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001220B4();
      }
    }
  }
  [(VOTBrailleGestureDataRepository *)self _loadAllDataFromFiles];
}

- (void)_deleteCalibratedData
{
  id v3 = +[NSFileManager defaultManager];
  uint64_t v4 = [(VOTBrailleGestureDataRepository *)self _calibratedDotPositionsFilePath];
  if ([v3 fileExistsAtPath:v4])
  {
    unsigned int v5 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleting calibrated dot positions", buf, 2u);
    }

    id v9 = 0;
    unsigned __int8 v6 = [v3 removeItemAtPath:v4 error:&v9];
    id v7 = v9;
    if ((v6 & 1) == 0)
    {
      unsigned __int8 v8 = VOTLogBrailleGestures();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10012211C();
      }
    }
  }
}

- (id)_filenameSuffix
{
  CFStringRef v2 = @"tableTop";
  if (!self->_typingMode) {
    CFStringRef v2 = @"screenAway";
  }
  if (self->_shouldUseEightDotBraille) {
    CFStringRef v3 = @"8dot";
  }
  else {
    CFStringRef v3 = @"6dot";
  }
  return +[NSString stringWithFormat:@"%@_%dx%d_%@.plist", v2, (int)self->_keyboardSize.width, (int)self->_keyboardSize.height, v3];
}

- (id)_gestureDataDirectory
{
  CFStringRef v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  uint64_t v4 = [v3 lastObject];

  NSFileAttributeKey v14 = NSFileProtectionKey;
  NSFileProtectionType v15 = NSFileProtectionNone;
  unsigned int v5 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  unsigned __int8 v6 = [v4 stringByAppendingPathComponent:@"Accessibility"];
  id v7 = [v6 stringByAppendingPathComponent:@"BrailleGestures"];
  unsigned __int8 v8 = +[NSFileManager defaultManager];
  id v13 = 0;
  unsigned __int8 v9 = [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:v5 error:&v13];
  id v10 = v13;
  if ((v9 & 1) == 0)
  {
    id v11 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100122184();
    }
  }
  [(VOTBrailleGestureDataRepository *)self _repairFileProtectionClassOnPathIfNecessary:v6];
  [(VOTBrailleGestureDataRepository *)self _repairFileProtectionClassOnPathIfNecessary:v7];

  return v7;
}

- (id)_calibratedDotPositionsFilePath
{
  calibratedDotPositionsFilePath = self->_calibratedDotPositionsFilePath;
  if (!calibratedDotPositionsFilePath)
  {
    uint64_t v4 = [(VOTBrailleGestureDataRepository *)self _gestureDataDirectory];
    unsigned int v5 = [(VOTBrailleGestureDataRepository *)self _filenameSuffix];
    unsigned __int8 v6 = +[NSString stringWithFormat:@"CalibratedDotPositions.%@", v5];
    id v7 = [v4 stringByAppendingPathComponent:v6];
    unsigned __int8 v8 = self->_calibratedDotPositionsFilePath;
    self->_calibratedDotPositionsFilePath = v7;

    calibratedDotPositionsFilePath = self->_calibratedDotPositionsFilePath;
  }

  return calibratedDotPositionsFilePath;
}

- (id)_recordedDriftsFilePath
{
  recordedDriftsFilePath = self->_recordedDriftsFilePath;
  if (!recordedDriftsFilePath)
  {
    uint64_t v4 = [(VOTBrailleGestureDataRepository *)self _gestureDataDirectory];
    unsigned int v5 = [(VOTBrailleGestureDataRepository *)self _filenameSuffix];
    unsigned __int8 v6 = +[NSString stringWithFormat:@"RecordedDrifts.%@", v5];
    id v7 = [v4 stringByAppendingPathComponent:v6];
    unsigned __int8 v8 = self->_recordedDriftsFilePath;
    self->_recordedDriftsFilePath = v7;

    recordedDriftsFilePath = self->_recordedDriftsFilePath;
  }

  return recordedDriftsFilePath;
}

- (void)_generateTableTopInitialData
{
  BOOL shouldUseEightDotBraille = self->_shouldUseEightDotBraille;
  long double v4 = dbl_10016EA20[!self->_shouldUseEightDotBraille];
  double v5 = dbl_10016EA30[!self->_shouldUseEightDotBraille];
  double width = self->_keyboardSize.width;
  double v7 = (width + -100.0 + -120.0) * 0.5;
  double v8 = cos(v4);
  if (v5 * v8 <= v7)
  {
    double v9 = fmin(width + -100.0 + v5 * v8 * -2.0, 300.0);
  }
  else
  {
    long double v4 = acos(v7 / v5);
    double v8 = cos(v4);
    double v9 = 120.0;
  }
  long double v10 = v5 * sin(v4);
  double v11 = v10 + (self->_keyboardSize.height - v10) * 0.5;
  double v12 = (width - v9) * 0.5;
  double v13 = width - v12;
  double v14 = v12 - v5 * v8;
  double v15 = v11 - v10;
  double v16 = width - v14;
  double v41 = 0.0;
  double v42 = 0.0;
  double v39 = 0.0;
  double v40 = 0.0;
  if (shouldUseEightDotBraille)
  {
    double v37 = 0.0;
    double v38 = 0.0;
    double v35 = 0.0;
    double v36 = 0.0;
    -[VOTBrailleGestureDataRepository _getEightDotTableTopMiddleLeftDot:middleRightDot:bottomLeftDot:bottomRightDot:angleFromXAxisToLineOfHand:topLeftDot:](self, "_getEightDotTableTopMiddleLeftDot:middleRightDot:bottomLeftDot:bottomRightDot:angleFromXAxisToLineOfHand:topLeftDot:", &v41, &v39, &v37, &v35, (double)v4, v12, v11);
    id v17 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v12, v11);
    double v18 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v41, v42);
    double v19 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v37, v38);
    double v20 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v14, v15);
    v21 = +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:v17 middleDot:v18 bottomDot:v19 fourthDot:v20];
    [(VOTBrailleGestureDataRepository *)self setLeftDotPositions:v21];

    double v22 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v13, v11);
    double v23 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v39, v40);
    double v24 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v35, v36);
    double v25 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v16, v15);
    double v26 = +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:v22 middleDot:v23 bottomDot:v24 fourthDot:v25];
    [(VOTBrailleGestureDataRepository *)self setRightDotPositions:v26];
  }
  else
  {
    -[VOTBrailleGestureDataRepository _getMiddleDotsForSixDotTableTopInitialDataForLeft:right:angleFromXAxisToLineOfHand:topLeftDot:](self, "_getMiddleDotsForSixDotTableTopInitialDataForLeft:right:angleFromXAxisToLineOfHand:topLeftDot:", &v41, &v39, (double)v4, v12, v11);
    v27 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v12, v11);
    v28 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v41, v42);
    double v29 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v14, v15);
    double v30 = +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:v27 middleDot:v28 bottomDot:v29];
    [(VOTBrailleGestureDataRepository *)self setLeftDotPositions:v30];

    id v31 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v13, v11);
    id v32 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v39, v40);
    double v33 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v16, v15);
    double v34 = +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:v31 middleDot:v32 bottomDot:v33];
    [(VOTBrailleGestureDataRepository *)self setRightDotPositions:v34];
  }
}

- (void)_getEightDotTableTopMiddleLeftDot:(CGPoint *)a3 middleRightDot:(CGPoint *)a4 bottomLeftDot:(CGPoint *)a5 bottomRightDot:(CGPoint *)a6 angleFromXAxisToLineOfHand:(double)a7 topLeftDot:(CGPoint)a8
{
  double y = a8.y;
  double x = a8.x;
  __double2 v16 = __sincos_stret(a7 + 0.289686994);
  double v17 = x + v16.__cosval * -120.0;
  double v18 = y + v16.__sinval * -120.0;
  double width = self->_keyboardSize.width;
  __double2 v20 = __sincos_stret(a7);
  if (a3)
  {
    a3->double x = v17;
    a3->double y = v18;
  }
  if (a4)
  {
    a4->double x = width - v17;
    a4->double y = v18;
  }
  double v21 = v17 + v20.__cosval * -120.0;
  double v22 = v18 + v20.__sinval * -120.0;
  if (a5)
  {
    a5->double x = v21;
    a5->double y = v22;
  }
  if (a6)
  {
    a6->double x = width - v21;
    a6->double y = v22;
  }
}

- (void)_getMiddleDotsForSixDotTableTopInitialDataForLeft:(CGPoint *)a3 right:(CGPoint *)a4 angleFromXAxisToLineOfHand:(double)a5 topLeftDot:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  __double2 v11 = __sincos_stret(a5 + 0.289686994);
  double v12 = x + v11.__cosval * -120.0;
  double v13 = y + v11.__sinval * -120.0;
  double width = self->_keyboardSize.width;
  if (a3)
  {
    a3->double x = v12;
    a3->double y = v13;
  }
  if (a4)
  {
    a4->double x = width - v12;
    a4->double y = v13;
  }
}

- (void)_generateScreenAwayInitialData
{
  double height = self->_keyboardSize.height;
  double v4 = 3.0;
  if (!self->_shouldUseEightDotBraille) {
    double v4 = 2.0;
  }
  double v5 = dbl_10016EA30[!self->_shouldUseEightDotBraille];
  if (height + -100.0 <= v5) {
    double v5 = height + -100.0;
  }
  double v6 = v5 / v4;
  double v7 = (height - v5) * 0.5;
  double v8 = self->_keyboardSize.width + -50.0;
  double v9 = v5 / v4 + v7;
  double v10 = v6 + v6 + v7;
  if (self->_shouldUseEightDotBraille)
  {
    double v11 = v6 + v10;
    +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", 50.0, v6 + v10);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    double v12 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v8, v11);
  }
  else
  {
    id v21 = 0;
    double v12 = 0;
  }
  double v13 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v8, v7);
  double v14 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v8, v9);
  double v15 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", v8, v10);
  __double2 v16 = +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:v13 middleDot:v14 bottomDot:v15 fourthDot:v12];
  [(VOTBrailleGestureDataRepository *)self setLeftDotPositions:v16];

  double v17 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", 50.0, v7);
  double v18 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", 50.0, v9);
  double v19 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", 50.0, v10);
  __double2 v20 = +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:v17 middleDot:v18 bottomDot:v19 fourthDot:v21];
  [(VOTBrailleGestureDataRepository *)self setRightDotPositions:v20];
}

- (void)_generateInitialData
{
  if (self->_typingMode == 1) {
    [(VOTBrailleGestureDataRepository *)self _generateTableTopInitialData];
  }
  else {
    [(VOTBrailleGestureDataRepository *)self _generateScreenAwayInitialData];
  }
}

- (id)_mutableArrayOfZeroPointValues:(unint64_t)a3
{
  double v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
  if (a3)
  {
    double y = CGPointZero.y;
    do
    {
      double v6 = +[NSValue ax_valueWithCGPoint:](NSValue, "ax_valueWithCGPoint:", CGPointZero.x, y);
      [v4 addObject:v6];

      --a3;
    }
    while (a3);
  }

  return v4;
}

- (id)_mutableArrayOfPointValuesFromDictionaries:(id)a3
{
  id v3 = a3;
  double v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = sub_10003DC10(*(void **)(*((void *)&v12 + 1) + 8 * i));
        objc_msgSend(v4, "addObject:", v10, (void)v12);
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_arrayOfDictionariesFromPointValues:(id)a3
{
  id v3 = a3;
  double v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = sub_10003DCCC(*(void **)(*((void *)&v12 + 1) + 8 * i));
        objc_msgSend(v4, "addObject:", v10, (void)v12);
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_repairFileProtectionClassOnPathIfNecessary:(id)a3
{
  id v3 = a3;
  double v4 = +[NSFileManager defaultManager];
  id v15 = 0;
  id v5 = [v4 attributesOfItemAtPath:v3 error:&v15];
  id v6 = v15;
  if (!v5)
  {
    long long v13 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1001221EC();
    }
    id v12 = v6;
    goto LABEL_11;
  }
  id v7 = [v5 objectForKeyedSubscript:NSFileProtectionKey];
  unsigned __int8 v8 = [v7 isEqualToString:NSFileProtectionNone];

  if ((v8 & 1) == 0)
  {
    double v9 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001222BC();
    }

    NSFileAttributeKey v16 = NSFileProtectionKey;
    NSFileProtectionType v17 = NSFileProtectionNone;
    double v10 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v14 = v6;
    unsigned __int8 v11 = [v4 setAttributes:v10 ofItemAtPath:v3 error:&v14];
    id v12 = v14;

    if (v11) {
      goto LABEL_12;
    }
    long long v13 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100122254();
    }
LABEL_11:

LABEL_12:
    id v6 = v12;
  }
}

- (id)_loadDataFromFile:(id)a3
{
  id v3 = a3;
  double v4 = +[NSFileManager defaultManager];
  if ([v4 fileExistsAtPath:v3])
  {
    id v5 = +[NSDictionary dictionaryWithContentsOfFile:v3];
    if (v5) {
      goto LABEL_7;
    }
    id v6 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100122324();
    }
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (void)_loadAllDataFromFiles
{
  id v3 = [(VOTBrailleGestureDataRepository *)self _calibratedDotPositionsFilePath];
  double v4 = [(VOTBrailleGestureDataRepository *)self _loadDataFromFile:v3];

  if (!v4) {
    goto LABEL_22;
  }
  id v5 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100122490();
  }

  id v6 = [v4 objectForKeyedSubscript:@"Left"];
  id v7 = +[VOTBrailleGestureHalfPattern halfPatternWithDictionaryRepresentation:v6];
  [(VOTBrailleGestureDataRepository *)self setLeftDotPositions:v7];

  unsigned __int8 v8 = [v4 objectForKeyedSubscript:@"Right"];
  double v9 = +[VOTBrailleGestureHalfPattern halfPatternWithDictionaryRepresentation:v8];
  [(VOTBrailleGestureDataRepository *)self setRightDotPositions:v9];

  double v10 = [(VOTBrailleGestureDataRepository *)self leftDotPositions];
  uint64_t v11 = [v10 topDot];
  if (v11)
  {
    id v12 = (void *)v11;
    long long v13 = [(VOTBrailleGestureDataRepository *)self leftDotPositions];
    uint64_t v14 = [v13 middleDot];
    if (v14)
    {
      id v15 = (void *)v14;
      NSFileAttributeKey v16 = [(VOTBrailleGestureDataRepository *)self leftDotPositions];
      uint64_t v17 = [v16 bottomDot];
      if (v17)
      {
        double v18 = (void *)v17;
        double v19 = [(VOTBrailleGestureDataRepository *)self rightDotPositions];
        uint64_t v20 = [v19 topDot];
        if (v20)
        {
          v50 = (void *)v20;
          id v21 = [(VOTBrailleGestureDataRepository *)self rightDotPositions];
          uint64_t v22 = [v21 middleDot];
          if (v22)
          {
            v48 = v21;
            v49 = (void *)v22;
            v47 = [(VOTBrailleGestureDataRepository *)self rightDotPositions];
            double v23 = [v47 bottomDot];
            if (v23)
            {
              if (self->_shouldUseEightDotBraille)
              {
                id v46 = v23;
                v45 = [(VOTBrailleGestureDataRepository *)self leftDotPositions];
                double v24 = [v45 fourthDot];
                if (v24)
                {
                  if (self->_shouldUseEightDotBraille)
                  {
                    v44 = v24;
                    v43 = [(VOTBrailleGestureDataRepository *)self rightDotPositions];
                    double v25 = [v43 fourthDot];
                    BOOL v26 = v25 == 0;

                    double v24 = v44;
                  }
                  else
                  {
                    BOOL v26 = 0;
                  }
                }
                else
                {
                  BOOL v26 = 1;
                }

                double v23 = v46;
              }
              else
              {
                BOOL v26 = 0;
              }
            }
            else
            {
              BOOL v26 = 1;
            }

            if (!v26)
            {
              self->_areDotNumberPositionsCalibrated = 1;
              goto LABEL_22;
            }
            goto LABEL_19;
          }
        }
      }
    }
  }

LABEL_19:
  v27 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    sub_1001223CC(self, v27);
  }

  [(VOTBrailleGestureDataRepository *)self _deleteCalibratedData];
LABEL_22:
  if (!self->_areDotNumberPositionsCalibrated)
  {
    v28 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_10012238C();
    }

    [(VOTBrailleGestureDataRepository *)self _generateInitialData];
    uint64_t v29 = [(VOTBrailleGestureDataRepository *)self leftDotPositions];
    if (!v29
      || (double v30 = (void *)v29,
          [(VOTBrailleGestureDataRepository *)self rightDotPositions],
          id v31 = objc_claimAutoreleasedReturnValue(),
          v31,
          v30,
          !v31))
    {
      _AXAssert();
    }
  }
  id v32 = [(VOTBrailleGestureDataRepository *)self _recordedDriftsFilePath];
  double v33 = [(VOTBrailleGestureDataRepository *)self _loadDataFromFile:v32];

  if (v33)
  {
    double v34 = [v33 objectForKeyedSubscript:@"Left"];
    double v35 = [(VOTBrailleGestureDataRepository *)self _mutableArrayOfPointValuesFromDictionaries:v34];
    [(VOTBrailleGestureDataRepository *)self setLeftDrifts:v35];

    double v36 = [v33 objectForKeyedSubscript:@"Right"];
    double v37 = [(VOTBrailleGestureDataRepository *)self _mutableArrayOfPointValuesFromDictionaries:v36];
    [(VOTBrailleGestureDataRepository *)self setRightDrifts:v37];

    double v38 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      double v39 = [(VOTBrailleGestureDataRepository *)self leftDrifts];
      double v40 = [(VOTBrailleGestureDataRepository *)self rightDrifts];
      *(_DWORD *)buf = 138543618;
      v52 = v39;
      __int16 v53 = 2114;
      v54 = v40;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Had recorded left drifts: %{public}@\nright drifts: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    double v41 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Had no stored drifts", buf, 2u);
    }

    double v42 = [(VOTBrailleGestureDataRepository *)self _mutableArrayOfZeroPointValues:5];
    [(VOTBrailleGestureDataRepository *)self setLeftDrifts:v42];

    double v38 = [(VOTBrailleGestureDataRepository *)self _mutableArrayOfZeroPointValues:5];
    [(VOTBrailleGestureDataRepository *)self setRightDrifts:v38];
  }
}

- (VOTBrailleGestureHalfPattern)leftDotPositions
{
  return self->_leftDotPositions;
}

- (void)setLeftDotPositions:(id)a3
{
}

- (VOTBrailleGestureHalfPattern)rightDotPositions
{
  return self->_rightDotPositions;
}

- (void)setRightDotPositions:(id)a3
{
}

- (NSMutableArray)leftDrifts
{
  return self->_leftDrifts;
}

- (void)setLeftDrifts:(id)a3
{
}

- (NSMutableArray)rightDrifts
{
  return self->_rightDrifts;
}

- (void)setRightDrifts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightDrifts, 0);
  objc_storeStrong((id *)&self->_leftDrifts, 0);
  objc_storeStrong((id *)&self->_rightDotPositions, 0);
  objc_storeStrong((id *)&self->_leftDotPositions, 0);
  objc_storeStrong((id *)&self->_calibratedDotPositionsFilePath, 0);

  objc_storeStrong((id *)&self->_recordedDriftsFilePath, 0);
}

@end