@interface AXGestureRecorderFingerPathCollection
- (AXGestureRecorderFingerPathCollection)init;
- (AXGestureRecorderFingerPathCollection)initWithMaximumFingerPathsCount:(unint64_t)a3;
- (AXGestureRecorderFingerPathCollectionDelegate)delegate;
- (AXMutableReplayableGesture)replayableGesture;
- (BOOL)shouldRecordRealTimeGesture;
- (CGPoint)_interfaceOrientedScreenPointForPoint:(CGPoint)a3 view:(id)a4;
- (NSMutableArray)fingerPaths;
- (NSMutableArray)forcesArrays;
- (NSMutableArray)pointsArrays;
- (NSMutableArray)referenceTimesArray;
- (NSMutableArray)timesArrays;
- (NSMutableDictionary)touchPathIndicesToFingerPathIndices;
- (double)maximumFingerLineWidth;
- (double)minimumFingerLineWidth;
- (double)timestampAtIndex:(unint64_t)a3;
- (id)_bezierPathToAppendForTouchLocation:(CGPoint)a3 unnamedValue:(double)a4 optionalPreviousTouchLocation:(id)a5 optionalPreviousForce:(id)a6;
- (id)_nonRealTimeFingerPathToAppendForIndex:(unint64_t)a3 upToPositionForTimestampAtIndex:(unint64_t)a4;
- (id)_realTimeFingerPathToAppendForIndex:(unint64_t)a3 upToPositionForTimestampAtIndex:(unint64_t)a4;
- (id)fingerPathAtIndex:(unint64_t)a3;
- (id)fingerPathToAppendForIndex:(unint64_t)a3 forTimestampAtIndex:(unint64_t)a4;
- (id)propertyListRepresentationWithName:(id)a3;
- (unint64_t)fingerPathsCount;
- (unint64_t)maximumFingerPathsCount;
- (unint64_t)referenceTimesArrayIndex;
- (unint64_t)timestampsCount;
- (void)_addPointsToReplayableGesture:(id)a3 forces:(id)a4 time:(double)a5;
- (void)_didInsertFingerPathAtIndex:(unint64_t)a3;
- (void)_didUpdateFingerPathAtIndex:(unint64_t)a3;
- (void)_referenceTimesArrayIndexNeedsRefresh;
- (void)appendFingerPathsFromFingerPathCollection:(id)a3;
- (void)appendPointsForTouches:(id)a3 referenceView:(id)a4 time:(double)a5;
- (void)dealloc;
- (void)handleLiftForTouches:(id)a3 referenceView:(id)a4 time:(double)a5;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setFingerPaths:(id)a3;
- (void)setForcesArrays:(id)a3;
- (void)setMaximumFingerLineWidth:(double)a3;
- (void)setMaximumFingerPathsCount:(unint64_t)a3;
- (void)setMinimumFingerLineWidth:(double)a3;
- (void)setPointsArrays:(id)a3;
- (void)setReferenceTimesArrayIndex:(unint64_t)a3;
- (void)setReplayableGesture:(id)a3;
- (void)setShouldRecordRealTimeGesture:(BOOL)a3;
- (void)setTimesArrays:(id)a3;
- (void)setTouchPathIndicesToFingerPathIndices:(id)a3;
@end

@implementation AXGestureRecorderFingerPathCollection

- (AXGestureRecorderFingerPathCollection)init
{
  v4.receiver = self;
  v4.super_class = (Class)AXGestureRecorderFingerPathCollection;
  v2 = [(AXGestureRecorderFingerPathCollection *)&v4 init];
  if (v2) {

  }
  return 0;
}

- (AXGestureRecorderFingerPathCollection)initWithMaximumFingerPathsCount:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AXGestureRecorderFingerPathCollection;
  objc_super v4 = [(AXGestureRecorderFingerPathCollection *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(AXGestureRecorderFingerPathCollection *)v4 setMaximumFingerPathsCount:a3];
    [(AXGestureRecorderFingerPathCollection *)v5 _referenceTimesArrayIndexNeedsRefresh];
  }
  return v5;
}

- (void)dealloc
{
  [(AXGestureRecorderFingerPathCollection *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)AXGestureRecorderFingerPathCollection;
  [(AXGestureRecorderFingerPathCollection *)&v3 dealloc];
}

- (unint64_t)fingerPathsCount
{
  v2 = [(AXGestureRecorderFingerPathCollection *)self fingerPaths];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)timestampsCount
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(AXGestureRecorderFingerPathCollection *)self shouldRecordRealTimeGesture])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unint64_t v3 = [(AXGestureRecorderFingerPathCollection *)self timesArrays];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      unint64_t v6 = 0;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v3);
          }
          v6 += [*(id *)(*((void *)&v12 + 1) + 8 * i) count];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
    else
    {
      unint64_t v6 = 0;
    }

    return v6;
  }
  else
  {
    v9 = [(AXGestureRecorderFingerPathCollection *)self referenceTimesArray];
    unint64_t v10 = [v9 count];

    return v10;
  }
}

- (NSMutableArray)referenceTimesArray
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(AXGestureRecorderFingerPathCollection *)self shouldRecordRealTimeGesture]) {
    _AXAssert();
  }
  unint64_t v3 = [(AXGestureRecorderFingerPathCollection *)self referenceTimesArrayIndex];
  uint64_t v4 = [(AXGestureRecorderFingerPathCollection *)self timesArrays];
  unint64_t v5 = [v4 count];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v18 = v5;
    v19 = v4;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v21;
      unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v6);
          }
          unint64_t v13 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "count", v18, v19, (void)v20);
          if (v11 == 0x7FFFFFFFFFFFFFFFLL || v13 > v11)
          {
            unint64_t v11 = v13;
            unint64_t v3 = v9 + i;
          }
        }
        v9 += v8;
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }
    else
    {
      unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
    }

    [(AXGestureRecorderFingerPathCollection *)self setReferenceTimesArrayIndex:v3];
    unint64_t v5 = v18;
    uint64_t v4 = v19;
  }
  v16 = 0;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL && v3 < v5)
  {
    v16 = [v4 objectAtIndex:v3];
  }

  return (NSMutableArray *)v16;
}

- (id)fingerPathAtIndex:(unint64_t)a3
{
  uint64_t v4 = [(AXGestureRecorderFingerPathCollection *)self fingerPaths];
  unint64_t v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (id)fingerPathToAppendForIndex:(unint64_t)a3 forTimestampAtIndex:(unint64_t)a4
{
  if ([(AXGestureRecorderFingerPathCollection *)self shouldRecordRealTimeGesture]) {
    [(AXGestureRecorderFingerPathCollection *)self _realTimeFingerPathToAppendForIndex:a3 upToPositionForTimestampAtIndex:a4];
  }
  else {
  uint64_t v7 = [(AXGestureRecorderFingerPathCollection *)self _nonRealTimeFingerPathToAppendForIndex:a3 upToPositionForTimestampAtIndex:a4];
  }
  return v7;
}

- (id)_nonRealTimeFingerPathToAppendForIndex:(unint64_t)a3 upToPositionForTimestampAtIndex:(unint64_t)a4
{
  uint64_t v4 = (char *)a4;
  if ([(AXGestureRecorderFingerPathCollection *)self timestampsCount] <= a4)
  {
    unint64_t v11 = 0;
  }
  else
  {
    uint64_t v7 = [(AXGestureRecorderFingerPathCollection *)self pointsArrays];
    uint64_t v8 = [v7 objectAtIndex:a3];

    uint64_t v9 = [(AXGestureRecorderFingerPathCollection *)self forcesArrays];
    uint64_t v10 = [v9 objectAtIndex:a3];

    if ([v8 count] <= (unint64_t)v4)
    {
      unint64_t v11 = 0;
    }
    else
    {
      unint64_t v11 = [MEMORY[0x1E4FB14C0] bezierPath];
      if ([v8 count] > (unint64_t)v4)
      {
        long long v12 = [v8 objectAtIndexedSubscript:v4];
        [v12 CGPointValue];
        double v14 = v13;
        double v16 = v15;

        uint64_t v17 = [v10 objectAtIndexedSubscript:v4];
        [v17 doubleValue];
        double v19 = v18;

        if (v4)
        {
          long long v20 = v4 - 1;
          uint64_t v4 = [v8 objectAtIndexedSubscript:v4 - 1];
          long long v21 = [v10 objectAtIndexedSubscript:v20];
        }
        else
        {
          long long v21 = 0;
        }
        long long v22 = -[AXGestureRecorderFingerPathCollection _bezierPathToAppendForTouchLocation:unnamedValue:optionalPreviousTouchLocation:optionalPreviousForce:](self, "_bezierPathToAppendForTouchLocation:unnamedValue:optionalPreviousTouchLocation:optionalPreviousForce:", v4, v21, v14, v16, v19);
        [v11 appendBezierPath:v22];
      }
    }
  }
  return v11;
}

- (id)_realTimeFingerPathToAppendForIndex:(unint64_t)a3 upToPositionForTimestampAtIndex:(unint64_t)a4
{
  uint64_t v4 = (char *)a4;
  if ([(AXGestureRecorderFingerPathCollection *)self timestampsCount] <= a4)
  {
    uint64_t v10 = 0;
    goto LABEL_26;
  }
  [(AXGestureRecorderFingerPathCollection *)self timestampAtIndex:v4];
  double v8 = v7;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__0;
  v51 = __Block_byref_object_dispose__0;
  id v52 = 0;
  uint64_t v9 = [(AXGestureRecorderFingerPathCollection *)self touchPathIndicesToFingerPathIndices];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __109__AXGestureRecorderFingerPathCollection__realTimeFingerPathToAppendForIndex_upToPositionForTimestampAtIndex___block_invoke;
  v46[3] = &unk_1E649C690;
  v46[4] = &v47;
  v46[5] = a3;
  [v9 enumerateKeysAndObjectsUsingBlock:v46];

  uint64_t v10 = [MEMORY[0x1E4FB14C0] bezierPath];
  unint64_t v11 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
  unint64_t v12 = [v11 numberOfEvents];

  if (v12 > (unint64_t)v4)
  {
    while (1)
    {
      double v13 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
      [v13 timeAtEventIndex:v4];
      double v15 = v14;

      if (v15 >= v8 || (unint64_t)v4 >= v12) {
        break;
      }
      ++v4;
    }
    if ((unint64_t)v4 >= v12)
    {
      double v44 = v8;
      _AXAssert();
    }
    uint64_t v17 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
    [v17 timeAtEventIndex:v4];
    double v19 = v18;

    if (v19 != v8)
    {
      double v45 = v8;
      _AXAssert();
    }
    if ((unint64_t)v4 >= v12) {
      goto LABEL_25;
    }
    long long v20 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
    [v20 timeAtEventIndex:v4];
    double v22 = v21;

    if (v22 != v8 || v4 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_25;
    }
    long long v23 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
    v24 = [v23 fingerIdentifiersAtEventIndex:v4];

    if (![v24 containsObject:v48[5]]) {
      goto LABEL_24;
    }
    uint64_t v25 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
    [v25 pointForFingerIdentifier:v48[5] atEventIndex:v4];
    double v27 = v26;
    double v29 = v28;

    v30 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
    [v30 forceForFingerIdentifier:v48[5] atEventIndex:v4];
    double v32 = v31;

    if (v4)
    {
      v33 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
      v34 = v4 - 1;
      v35 = [v33 fingerIdentifiersAtEventIndex:v4 - 1];
      int v36 = [v35 containsObject:v48[5]];

      if (v36)
      {
        v37 = (void *)MEMORY[0x1E4F29238];
        v38 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
        [v38 pointForFingerIdentifier:v48[5] atEventIndex:v34];
        objc_msgSend(v37, "valueWithCGPoint:");
        uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();

        v39 = NSNumber;
        v40 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
        [v40 forceForFingerIdentifier:v48[5] atEventIndex:v34];
        v41 = objc_msgSend(v39, "numberWithDouble:");

LABEL_23:
        v42 = -[AXGestureRecorderFingerPathCollection _bezierPathToAppendForTouchLocation:unnamedValue:optionalPreviousTouchLocation:optionalPreviousForce:](self, "_bezierPathToAppendForTouchLocation:unnamedValue:optionalPreviousTouchLocation:optionalPreviousForce:", v4, v41, v27, v29, v32, *(void *)&v45);
        [v10 appendBezierPath:v42];

LABEL_24:
        goto LABEL_25;
      }
      uint64_t v4 = 0;
    }
    v41 = 0;
    goto LABEL_23;
  }
  _AXAssert();
LABEL_25:
  _Block_object_dispose(&v47, 8);

LABEL_26:
  return v10;
}

void __109__AXGestureRecorderFingerPathCollection__realTimeFingerPathToAppendForIndex_upToPositionForTimestampAtIndex___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 unsignedIntegerValue] == *(void *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (double)timestampAtIndex:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(AXGestureRecorderFingerPathCollection *)self shouldRecordRealTimeGesture])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    unint64_t v5 = [(AXGestureRecorderFingerPathCollection *)self timesArrays];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    double v7 = 0.0;
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v5);
          }
          unint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (a3 < [v11 count])
          {
            unint64_t v12 = v11;
            goto LABEL_13;
          }
          a3 -= [v11 count];
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    unint64_t v12 = [(AXGestureRecorderFingerPathCollection *)self referenceTimesArray];
    unint64_t v5 = v12;
LABEL_13:
    double v13 = [v12 objectAtIndexedSubscript:a3];
    [v13 doubleValue];
    double v7 = v14;
  }
  return v7;
}

- (id)propertyListRepresentationWithName:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  uint64_t v4 = objc_opt_new();
  v34 = self;
  [(AXGestureRecorderFingerPathCollection *)self pointsArrays];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v10 = objc_opt_new();
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v11 = v9;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v38;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v38 != v14) {
                objc_enumerationMutation(v11);
              }
              [*(id *)(*((void *)&v37 + 1) + 8 * j) CGPointValue];
              long long v16 = NSStringFromCGPoint(v49);
              [v10 addObject:v16];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v13);
        }

        [v4 addObject:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v6);
  }
  uint64_t v17 = [v4 count];
  if (!v17) {
    goto LABEL_28;
  }
  unint64_t v18 = v17;
  id v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  do
  {
    double v22 = [v4 objectAtIndex:v21];
    long long v23 = [v22 objectAtIndex:0];
    CGPointFromString(v23);

    uint64_t v24 = v21 + 1;
    if (v21 + 1 < v18)
    {
      uint64_t v25 = v21 + 1;
      do
      {
        double v26 = [v4 objectAtIndex:v25];
        double v27 = [v26 objectAtIndex:0];
        CGPointFromString(v27);

        AX_CGPointGetDistanceToPoint();
        if (v28 < 15.0
          && (unint64_t)[v22 count] <= 2
          && (unint64_t)[v26 count] >= 9)
        {
          if (!v19) {
            id v19 = (id)[v4 mutableCopy];
          }
          [v19 removeObjectAtIndex:v21 - v20++];
        }

        ++v25;
      }
      while (v18 != v25);
    }

    ++v21;
  }
  while (v24 != v18);
  if (!v19) {
LABEL_28:
  }
    id v19 = v4;
  double v29 = (void *)MEMORY[0x1E4F1C9E8];
  v30 = [(AXGestureRecorderFingerPathCollection *)v34 forcesArrays];
  double v31 = [(AXGestureRecorderFingerPathCollection *)v34 timesArrays];
  double v32 = objc_msgSend(v29, "dictionaryWithObjectsAndKeys:", v35, @"Name", v19, @"Points", v30, @"Forces", v31, @"Times", 0);

  return v32;
}

- (CGPoint)_interfaceOrientedScreenPointForPoint:(CGPoint)a3 view:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  uint64_t v7 = [v6 window];
  objc_msgSend(v6, "convertPoint:toView:", 0, x, y);
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(v7, "convertPoint:toWindow:", 0, v9, v11);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (id)_bezierPathToAppendForTouchLocation:(CGPoint)a3 unnamedValue:(double)a4 optionalPreviousTouchLocation:(id)a5 optionalPreviousForce:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  id v11 = a5;
  id v12 = a6;
  double v13 = [MEMORY[0x1E4FB14C0] bezierPath];
  [(AXGestureRecorderFingerPathCollection *)self minimumFingerLineWidth];
  double v15 = v14;
  double v16 = a4 / 2000.0;
  [(AXGestureRecorderFingerPathCollection *)self maximumFingerLineWidth];
  double v18 = v17;
  [(AXGestureRecorderFingerPathCollection *)self minimumFingerLineWidth];
  double v20 = (v15 + v16 * (v18 - v19)) * 0.5;
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, x, y, v20, 0.0, 6.28318531);
  [v13 appendPath:v21];
  if (v11)
  {
    [v11 CGPointValue];
    double v24 = v23;
    if (v23 != x || v22 != y)
    {
      double v39 = v22;
      [v12 doubleValue];
      double v26 = v25;
      [(AXGestureRecorderFingerPathCollection *)self minimumFingerLineWidth];
      double v28 = v27;
      double v29 = v26 / 2000.0;
      [(AXGestureRecorderFingerPathCollection *)self maximumFingerLineWidth];
      double v31 = v30;
      [(AXGestureRecorderFingerPathCollection *)self minimumFingerLineWidth];
      double v33 = (v28 + v29 * (v31 - v32)) * 0.5;
      v34 = [MEMORY[0x1E4FB14C0] bezierPath];
      double v38 = atan2(y - v39, x - v24);
      __double2 v35 = __sincos_stret(v38 + -1.57079633);
      objc_msgSend(v34, "moveToPoint:", v24 + v33 * v35.__cosval, v39 + v33 * v35.__sinval);
      objc_msgSend(v34, "addLineToPoint:", x + v20 * v35.__cosval, y + v20 * v35.__sinval);
      __double2 v36 = __sincos_stret(v38 + 1.57079633);
      objc_msgSend(v34, "addLineToPoint:", x + v20 * v36.__cosval, y + v20 * v36.__sinval);
      objc_msgSend(v34, "addLineToPoint:", v24 + v33 * v36.__cosval, v39 + v33 * v36.__sinval);
      [v34 closePath];
      [v13 appendPath:v34];
    }
  }

  return v13;
}

- (void)appendPointsForTouches:(id)a3 referenceView:(id)a4 time:(double)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v62 = a4;
  v71 = [(AXGestureRecorderFingerPathCollection *)self fingerPaths];
  unint64_t v9 = [v71 count];
  v72 = self;
  if (v9 > [(AXGestureRecorderFingerPathCollection *)self maximumFingerPathsCount]) {
    goto LABEL_28;
  }
  context = (void *)MEMORY[0x1C8779100]();
  double v10 = [(AXGestureRecorderFingerPathCollection *)self timesArrays];
  uint64_t v11 = [v10 count];
  uint64_t v12 = v11;
  if (!v10)
  {
    double v10 = objc_opt_new();
    [(AXGestureRecorderFingerPathCollection *)v72 setTimesArrays:v10];
    if (v12) {
      goto LABEL_4;
    }
LABEL_6:
    double v13 = objc_opt_new();
    [v10 addObject:v13];
    goto LABEL_7;
  }
  if (!v11) {
    goto LABEL_6;
  }
LABEL_4:
  double v13 = [v10 lastObject];
LABEL_7:
  v51 = (void *)[objc_alloc(NSNumber) initWithDouble:a5];
  objc_msgSend(v13, "addObject:");
  v67 = [(AXGestureRecorderFingerPathCollection *)v72 pointsArrays];
  uint64_t v14 = [(AXGestureRecorderFingerPathCollection *)v72 forcesArrays];
  double v15 = [(AXGestureRecorderFingerPathCollection *)v72 touchPathIndicesToFingerPathIndices];
  v53 = v10;
  if (v9) {
    v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, v9);
  }
  else {
    v57 = 0;
  }
  v66 = (void *)v14;
  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v60 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  obuint64_t j = v8;
  uint64_t v63 = [obj countByEnumeratingWithState:&v76 objects:v80 count:16];
  id v55 = v8;
  id v52 = v13;
  if (v63)
  {
    unint64_t v58 = v9;
    uint64_t v59 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v63; ++i)
      {
        if (*(void *)v77 != v59) {
          objc_enumerationMutation(obj);
        }
        double v17 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        uint64_t v18 = [v17 _pathIndex];
        uint64_t v70 = [NSNumber numberWithUnsignedInt:v18];
        double v19 = objc_msgSend(v15, "objectForKey:");
        [v17 locationInView:v62];
        double v21 = v20;
        double v23 = v22;
        uint64_t v68 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:");
        [v17 _pressure];
        double v25 = v24;
        id v26 = objc_alloc(NSNumber);
        *(float *)&double v27 = v25;
        double v28 = (void *)[v26 initWithFloat:v27];
        double v29 = [NSNumber numberWithUnsignedInt:v18];
        [v61 setObject:v28 forKeyedSubscript:v29];

        double v30 = (void *)MEMORY[0x1E4F29238];
        -[AXGestureRecorderFingerPathCollection _interfaceOrientedScreenPointForPoint:view:](v72, "_interfaceOrientedScreenPointForPoint:view:", v62, v21, v23);
        double v31 = objc_msgSend(v30, "valueWithCGPoint:");
        double v32 = [NSNumber numberWithUnsignedInt:v18];
        [v60 setObject:v31 forKeyedSubscript:v32];

        if (v19)
        {
          v69 = v19;
          uint64_t v33 = [v19 unsignedIntegerValue];
          v34 = [v67 objectAtIndex:v33];
          __double2 v35 = [v66 objectAtIndex:v33];
          __double2 v36 = [v35 lastObject];
          [v34 lastObject];
          long long v37 = v64 = v15;
          double v38 = [v71 objectAtIndex:v33];
          double v39 = -[AXGestureRecorderFingerPathCollection _bezierPathToAppendForTouchLocation:unnamedValue:optionalPreviousTouchLocation:optionalPreviousForce:](v72, "_bezierPathToAppendForTouchLocation:unnamedValue:optionalPreviousTouchLocation:optionalPreviousForce:", v37, v36, v21, v23, v25);
          [v38 appendBezierPath:v39];
          [v34 addObject:v68];
          [v35 addObject:v28];
          [v57 removeIndex:v33];
          [(AXGestureRecorderFingerPathCollection *)v72 _didUpdateFingerPathAtIndex:v33];

          long long v40 = (void *)v70;
          long long v41 = (void *)v68;
          double v15 = v64;
        }
        else
        {
          long long v42 = v28;
          long long v41 = (void *)v68;
          if (!v71)
          {
            v71 = objc_opt_new();
            -[AXGestureRecorderFingerPathCollection setFingerPaths:](v72, "setFingerPaths:");
          }
          uint64_t v43 = -[AXGestureRecorderFingerPathCollection _bezierPathToAppendForTouchLocation:unnamedValue:optionalPreviousTouchLocation:optionalPreviousForce:](v72, "_bezierPathToAppendForTouchLocation:unnamedValue:optionalPreviousTouchLocation:optionalPreviousForce:", 0, 0, v21, v23, v25);
          [v71 addObject:v43];
          long long v44 = v67;
          v65 = (void *)v43;
          if (v67)
          {
            uint64_t v45 = v68;
            v46 = v66;
          }
          else
          {
            uint64_t v47 = objc_opt_new();
            [(AXGestureRecorderFingerPathCollection *)v72 setPointsArrays:v47];
            uint64_t v48 = objc_opt_new();

            [(AXGestureRecorderFingerPathCollection *)v72 setForcesArrays:v48];
            v46 = (void *)v48;
            long long v44 = (void *)v47;
            uint64_t v45 = v68;
          }
          __double2 v35 = objc_opt_new();
          [v35 addObject:v45];
          v67 = v44;
          [v44 addObject:v35];
          __double2 v36 = objc_opt_new();
          [v36 addObject:v42];
          v66 = v46;
          [v46 addObject:v36];
          if (!v15)
          {
            double v15 = objc_opt_new();
            [(AXGestureRecorderFingerPathCollection *)v72 setTouchPathIndicesToFingerPathIndices:v15];
          }
          v69 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v58];
          long long v40 = (void *)v70;
          objc_msgSend(v15, "setObject:forKey:");
          [(AXGestureRecorderFingerPathCollection *)v72 _didInsertFingerPathAtIndex:v58++];
          double v28 = v42;
          v34 = v65;
        }
      }
      uint64_t v63 = [obj countByEnumeratingWithState:&v76 objects:v80 count:16];
    }
    while (v63);
  }

  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __83__AXGestureRecorderFingerPathCollection_appendPointsForTouches_referenceView_time___block_invoke;
  v73[3] = &unk_1E649C6B8;
  id v74 = v67;
  id v75 = v66;
  id v49 = v66;
  id v50 = v67;
  [v57 enumerateIndexesUsingBlock:v73];
  [(AXGestureRecorderFingerPathCollection *)v72 _addPointsToReplayableGesture:v60 forces:v61 time:a5];
  [(AXGestureRecorderFingerPathCollection *)v72 _referenceTimesArrayIndexNeedsRefresh];

  id v8 = v55;
LABEL_28:
}

void __83__AXGestureRecorderFingerPathCollection_appendPointsForTouches_referenceView_time___block_invoke(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v4 = [v7 lastObject];
  [v7 addObject:v4];
  uint64_t v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  id v6 = [v5 lastObject];
  [v5 addObject:v6];
}

- (void)handleLiftForTouches:(id)a3 referenceView:(id)a4 time:(double)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
  uint64_t v9 = [v8 numberOfEvents];

  if (v9)
  {
    long long v41 = self;
    double v10 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
    uint64_t v40 = [v10 numberOfEvents] - 1;

    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v7, "count"));
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v7, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v37 = v7;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v48 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          double v19 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v18, "_pathIndex", v37));
          [v11 addObject:v19];

          [v18 _pressure];
          *(float *)&double v20 = v20;
          double v21 = [NSNumber numberWithFloat:v20];
          [v12 addObject:v21];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v15);
    }

    double v22 = [(AXGestureRecorderFingerPathCollection *)v41 replayableGesture];
    double v23 = [v22 fingerIdentifiersAtEventIndex:v40];

    double v39 = [MEMORY[0x1E4F1CA60] dictionary];
    double v38 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obuint64_t j = v23;
    uint64_t v24 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v44 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v43 + 1) + 8 * j);
          if ((objc_msgSend(v11, "containsObject:", v28, v37) & 1) == 0)
          {
            double v29 = (void *)MEMORY[0x1E4F29238];
            double v30 = [(AXGestureRecorderFingerPathCollection *)v41 replayableGesture];
            [v30 pointForFingerIdentifier:v28 atEventIndex:v40];
            double v31 = objc_msgSend(v29, "valueWithCGPoint:");
            [v39 setObject:v31 forKeyedSubscript:v28];

            double v32 = NSNumber;
            uint64_t v33 = [(AXGestureRecorderFingerPathCollection *)v41 replayableGesture];
            [v33 forceForFingerIdentifier:v28 atEventIndex:v40];
            *(float *)&double v34 = v34;
            __double2 v35 = [v32 numberWithFloat:v34];
            [v38 setObject:v35 forKeyedSubscript:v28];
          }
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v25);
    }

    __double2 v36 = [(AXGestureRecorderFingerPathCollection *)v41 replayableGesture];
    [v36 addPointsByFingerIdentifier:v39 forces:v38 atTime:a5];

    id v7 = v37;
  }
}

- (void)appendFingerPathsFromFingerPathCollection:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(AXGestureRecorderFingerPathCollection *)self fingerPaths];
    uint64_t v43 = [v5 count];

    id v6 = [v4 fingerPaths];
    if (v6)
    {
      id v7 = [(AXGestureRecorderFingerPathCollection *)self fingerPaths];
      id v8 = v7;
      if (v7)
      {
        [v7 addObjectsFromArray:v6];
      }
      else
      {
        uint64_t v9 = (void *)[v6 mutableCopy];
        [(AXGestureRecorderFingerPathCollection *)self setFingerPaths:v9];
      }
    }
    double v10 = [v4 pointsArrays];
    if (v10)
    {
      uint64_t v11 = [(AXGestureRecorderFingerPathCollection *)self pointsArrays];
      uint64_t v12 = v11;
      if (v11)
      {
        [v11 addObjectsFromArray:v10];
      }
      else
      {
        id v13 = (void *)[v10 mutableCopy];
        [(AXGestureRecorderFingerPathCollection *)self setPointsArrays:v13];
      }
    }
    uint64_t v14 = [v4 forcesArrays];
    if (v14)
    {
      uint64_t v15 = [(AXGestureRecorderFingerPathCollection *)self forcesArrays];
      uint64_t v16 = v15;
      if (v15)
      {
        [v15 addObjectsFromArray:v14];
      }
      else
      {
        double v17 = (void *)[v14 mutableCopy];
        [(AXGestureRecorderFingerPathCollection *)self setForcesArrays:v17];
      }
    }
    uint64_t v18 = [v4 timesArrays];
    if (v18)
    {
      double v19 = [(AXGestureRecorderFingerPathCollection *)self timesArrays];
      double v20 = v19;
      if (v19)
      {
        [v19 addObjectsFromArray:v18];
      }
      else
      {
        double v21 = (void *)[v18 mutableCopy];
        [(AXGestureRecorderFingerPathCollection *)self setTimesArrays:v21];
      }
    }
    double v22 = [(AXGestureRecorderFingerPathCollection *)self touchPathIndicesToFingerPathIndices];

    if (v22)
    {
      double v38 = v18;
      double v39 = v14;
      uint64_t v40 = v10;
      long long v41 = v6;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      double v23 = v4;
      obuint64_t j = [v4 touchPathIndicesToFingerPathIndices];
      uint64_t v24 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v45 != v26) {
              objc_enumerationMutation(obj);
            }
            uint64_t v28 = *(void *)(*((void *)&v44 + 1) + 8 * i);
            double v29 = NSNumber;
            double v30 = [v23 touchPathIndicesToFingerPathIndices];
            double v31 = [v30 objectForKeyedSubscript:v28];
            double v32 = objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v31, "unsignedIntegerValue") + v43);
            uint64_t v33 = [(AXGestureRecorderFingerPathCollection *)self touchPathIndicesToFingerPathIndices];
            [v33 setObject:v32 forKeyedSubscript:v28];
          }
          uint64_t v25 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v25);
      }

      id v4 = v23;
      double v10 = v40;
      id v6 = v41;
      uint64_t v18 = v38;
      uint64_t v14 = v39;
    }
    else
    {
      double v34 = [v4 touchPathIndicesToFingerPathIndices];
      [(AXGestureRecorderFingerPathCollection *)self setTouchPathIndicesToFingerPathIndices:v34];
    }
    __double2 v35 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];

    if (v35)
    {
      __double2 v36 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
      id v37 = [v4 replayableGesture];
      [v36 addPointsFromReplayableGesture:v37];
    }
    else
    {
      __double2 v36 = [v4 replayableGesture];
      [(AXGestureRecorderFingerPathCollection *)self setReplayableGesture:v36];
    }

    [(AXGestureRecorderFingerPathCollection *)self _referenceTimesArrayIndexNeedsRefresh];
  }
}

- (void)reset
{
  [(AXGestureRecorderFingerPathCollection *)self setFingerPaths:0];
  [(AXGestureRecorderFingerPathCollection *)self setPointsArrays:0];
  [(AXGestureRecorderFingerPathCollection *)self setTouchPathIndicesToFingerPathIndices:0];
  [(AXGestureRecorderFingerPathCollection *)self setForcesArrays:0];
  [(AXGestureRecorderFingerPathCollection *)self setTimesArrays:0];
  [(AXGestureRecorderFingerPathCollection *)self setReplayableGesture:0];
  [(AXGestureRecorderFingerPathCollection *)self _referenceTimesArrayIndexNeedsRefresh];
}

- (void)_referenceTimesArrayIndexNeedsRefresh
{
}

- (void)_addPointsToReplayableGesture:(id)a3 forces:(id)a4 time:(double)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v31 = a4;
  uint64_t v9 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];

  if (!v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F49448]);
    [(AXGestureRecorderFingerPathCollection *)self setReplayableGesture:v10];
  }
  uint64_t v11 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
  uint64_t v12 = [v11 numberOfEvents];

  if (v12)
  {
    id v13 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
    uint64_t v14 = [v13 numberOfEvents] - 1;

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v15 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
    uint64_t v16 = [v15 fingerIdentifiersAtEventIndex:v14];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          double v22 = [v8 objectForKeyedSubscript:v21];

          if (!v22)
          {
            double v23 = (void *)MEMORY[0x1E4F29238];
            uint64_t v24 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
            [v24 pointForFingerIdentifier:v21 atEventIndex:v14];
            uint64_t v25 = objc_msgSend(v23, "valueWithCGPoint:");
            [v8 setObject:v25 forKeyedSubscript:v21];

            uint64_t v26 = NSNumber;
            double v27 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
            [v27 forceForFingerIdentifier:v21 atEventIndex:v14];
            *(float *)&double v28 = v28;
            double v29 = [v26 numberWithFloat:v28];
            [v31 setObject:v29 forKeyedSubscript:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v18);
    }
  }
  double v30 = [(AXGestureRecorderFingerPathCollection *)self replayableGesture];
  [v30 addPointsByFingerIdentifier:v8 forces:v31 atTime:a5];
}

- (void)_didInsertFingerPathAtIndex:(unint64_t)a3
{
  id v5 = [(AXGestureRecorderFingerPathCollection *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 gestureRecorderFingerPathCollection:self didInsertFingerPathAtIndex:a3];
  }
}

- (void)_didUpdateFingerPathAtIndex:(unint64_t)a3
{
  id v5 = [(AXGestureRecorderFingerPathCollection *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 gestureRecorderFingerPathCollection:self didUpdateFingerPathAtIndex:a3];
  }
}

- (AXGestureRecorderFingerPathCollectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXGestureRecorderFingerPathCollectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)maximumFingerPathsCount
{
  return self->_maximumFingerPathsCount;
}

- (void)setMaximumFingerPathsCount:(unint64_t)a3
{
  self->_maximumFingerPathsCount = a3;
}

- (unint64_t)referenceTimesArrayIndex
{
  return self->_referenceTimesArrayIndex;
}

- (void)setReferenceTimesArrayIndex:(unint64_t)a3
{
  self->_referenceTimesArrayIndedouble x = a3;
}

- (NSMutableArray)fingerPaths
{
  return self->_fingerPaths;
}

- (void)setFingerPaths:(id)a3
{
}

- (NSMutableArray)pointsArrays
{
  return self->_pointsArrays;
}

- (void)setPointsArrays:(id)a3
{
}

- (NSMutableArray)forcesArrays
{
  return self->_forcesArrays;
}

- (void)setForcesArrays:(id)a3
{
}

- (NSMutableDictionary)touchPathIndicesToFingerPathIndices
{
  return self->_touchPathIndicesToFingerPathIndices;
}

- (void)setTouchPathIndicesToFingerPathIndices:(id)a3
{
}

- (NSMutableArray)timesArrays
{
  return self->_timesArrays;
}

- (void)setTimesArrays:(id)a3
{
}

- (BOOL)shouldRecordRealTimeGesture
{
  return self->_shouldRecordRealTimeGesture;
}

- (void)setShouldRecordRealTimeGesture:(BOOL)a3
{
  self->_shouldRecordRealTimeGesture = a3;
}

- (double)minimumFingerLineWidth
{
  return self->_minimumFingerLineWidth;
}

- (void)setMinimumFingerLineWidth:(double)a3
{
  self->_minimumFingerLineWidth = a3;
}

- (double)maximumFingerLineWidth
{
  return self->_maximumFingerLineWidth;
}

- (void)setMaximumFingerLineWidth:(double)a3
{
  self->_maximumFingerLineWidth = a3;
}

- (AXMutableReplayableGesture)replayableGesture
{
  return self->_replayableGesture;
}

- (void)setReplayableGesture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replayableGesture, 0);
  objc_storeStrong((id *)&self->_timesArrays, 0);
  objc_storeStrong((id *)&self->_touchPathIndicesToFingerPathIndices, 0);
  objc_storeStrong((id *)&self->_forcesArrays, 0);
  objc_storeStrong((id *)&self->_pointsArrays, 0);
  objc_storeStrong((id *)&self->_fingerPaths, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end