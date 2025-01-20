@interface RCWaveformSegment
+ (BOOL)supportsSecureCoding;
+ (id)_discontinuityRepairedSegmentsByGrowingToFillGapsInSegments:(id)a3;
+ (id)_mergedSegmentByFastMergingWithMergeableSegments:(id)a3 mergedLevelsDuration:(double)a4;
+ (id)_mergedSegmentByResamplingWithMergeableSegments:(id)a3 mergedLevelsDuration:(double)a4;
+ (id)_segmentByMergingMergableSegments:(id)a3;
+ (id)_segmentsByJoiningSegment:(id)a3 toSegmentIfNecessaryWithGreaterSegment:(id)a4 averagePowerLevelJoinLimit:(unint64_t)a5;
+ (id)emptySegmentWithTimeRange:(id)a3;
+ (id)segmentsByMergingSegments:(id)a3 preferredSegmentDuration:(double)a4;
+ (id)segmentsByMergingSegments:(id)a3 preferredSegmentDuration:(double)a4 beforeTime:(double)a5 andThenUsePreferredSegmentDuration:(double)a6;
+ (id)segmentsByReparingDiscontinuitiesInSegments:(id)a3;
+ (id)segmentsByShiftingSegments:(id)a3 byTimeOffset:(double)a4;
+ (void)initialize;
- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRange;
- (BOOL)hasUniformPowerLevel:(float)a3;
- (BOOL)isRendered;
- (BOOL)isWaveformDataAlmostEqualToDataInSegment:(id)a3;
- (BOOL)isWaveformDataEqualToDataInSegment:(id)a3;
- (RCWaveformSegment)initWithCoder:(id)a3;
- (RCWaveformSegment)initWithTimeRange:(id)a3 averagePowerLevelVector:(void *)a4;
- (const)averagePowerLevels;
- (id)_initWithTimeRange:(id)a3 averagePowerLevelData:(id)a4;
- (id)_segmentWithValuesInContainedTimeRange:(id)a3;
- (id)_segmentsByJoiningIfNecessaryGreaterSegment:(id)a3 averagePowerLevelJoinLimit:(unint64_t)a4;
- (id)copyWithAdjustedTimeRange:(id)a3;
- (id)copyWithTimeRangeOffsetByTimeOffset:(double)a3;
- (id)segmentByClippingToTimeRange:(id)a3;
- (id)segmentsByJoiningIfSmallSegment:(id)a3;
- (id)segmentsByJoiningIfSmallSegment:(id)a3 averagePowerLevelJoinLimit:(unint64_t)a4;
- (id)simpleDescription;
- (id)verboseDescription;
- (int64_t)averagePowerLevelsCount;
- (void)encodeWithCoder:(id)a3;
- (void)setIsRendered:(BOOL)a3;
@end

@implementation RCWaveformSegment

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[RCWaveformSegment setVersion:1];
  }
}

+ (id)emptySegmentWithTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v5 = objc_alloc((Class)a1);
  v6 = +[NSData data];
  id v7 = objc_msgSend(v5, "_initWithTimeRange:averagePowerLevelData:", v6, var0, var1);

  return v7;
}

- (id)_initWithTimeRange:(id)a3 averagePowerLevelData:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RCWaveformSegment;
  v9 = [(RCWaveformSegment *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_timeRange.beginTime = var0;
    v9->_timeRange.endTime = var1;
    objc_storeStrong((id *)&v9->_averagePowerLevelData, a4);
    v10->_isRendered = 0;
  }

  return v10;
}

- (RCWaveformSegment)initWithTimeRange:(id)a3 averagePowerLevelVector:(void *)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if (*((void *)a4 + 1) == *(void *)a4)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [objc_alloc((Class)NSMutableData) initWithBytes:*(void *)a4 length:*((void *)a4 + 1) - *(void *)a4];
    memcpy([v8 mutableBytes], *(const void **)a4, *((void *)a4 + 1) - *(void *)a4);
  }
  v9 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelData:](self, "initWithTimeRange:averagePowerLevelData:", v8, var0, var1);
  v10 = v9;
  if (v9)
  {
    v9->_timeRange.beginTime = var0;
    v9->_timeRange.endTime = var1;
  }

  return v10;
}

- (id)verboseDescription
{
  v3 = [(RCWaveformSegment *)self simpleDescription];
  double v4 = RCTimeRangeDeltaWithExactPrecision(self->_timeRange.beginTime, self->_timeRange.endTime);
  uint64_t v5 = [(RCWaveformSegment *)self averagePowerLevelsCount];
  v6 = +[NSMutableArray array];
  unint64_t v7 = 0;
  double v8 = v4 / (double)v5;
  while (v7 < [(RCWaveformSegment *)self averagePowerLevelsCount])
  {
    v9 = +[NSString stringWithFormat:@"[%.3fs] %.2f", v8 * (double)v7, *((float *)[(RCWaveformSegment *)self averagePowerLevels] + v7)];
    [v6 addObject:v9];

    ++v7;
  }
  v10 = [v6 componentsJoinedByString:@", "];
  v11 = +[NSString stringWithFormat:@"%@ %@", v3, v10];

  return v11;
}

- (id)simpleDescription
{
  v7.receiver = self;
  v7.super_class = (Class)RCWaveformSegment;
  v3 = [(RCWaveformSegment *)&v7 description];
  double v4 = NSStringFromRCTimeRange(self->_timeRange.beginTime, self->_timeRange.endTime);
  uint64_t v5 = +[NSString stringWithFormat:@"%@: timeRange=%@, levelCount=%d", v3, v4, [(RCWaveformSegment *)self averagePowerLevelsCount]];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RCWaveformSegment)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_timeRange.beginTime = RCTimeRangeDecodeWithKey(v4, @"RCTimeRange");
  self->_timeRange.endTime = v5;
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RCAveragePowerLevelVectorData"];
  averagePowerLevelData = self->_averagePowerLevelData;
  self->_averagePowerLevelData = v6;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  RCTimeRangeEncodeWithKey(v4, @"RCTimeRange", self->_timeRange.beginTime, self->_timeRange.endTime);
  [v4 encodeObject:self->_averagePowerLevelData forKey:@"RCAveragePowerLevelVectorData"];
}

- (const)averagePowerLevels
{
  return (const float *)[(NSData *)self->_averagePowerLevelData bytes];
}

- (int64_t)averagePowerLevelsCount
{
  return [(NSData *)self->_averagePowerLevelData length] >> 2;
}

- (BOOL)hasUniformPowerLevel:(float)a3
{
  if (![(RCWaveformSegment *)self averagePowerLevelsCount]) {
    return 0;
  }
  if (![(RCWaveformSegment *)self averagePowerLevelsCount]) {
    return 1;
  }
  unint64_t v5 = 0;
  do
  {
    float v6 = *((float *)[(RCWaveformSegment *)self averagePowerLevels] + v5);
    BOOL v7 = v6 == a3;
    if (v6 != a3) {
      break;
    }
    ++v5;
  }
  while (v5 < [(RCWaveformSegment *)self averagePowerLevelsCount]);
  return v7;
}

- (BOOL)isWaveformDataEqualToDataInSegment:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  else {
    return [(NSData *)self->_averagePowerLevelData isEqual:*((void *)a3 + 1)];
  }
}

- (BOOL)isWaveformDataAlmostEqualToDataInSegment:(id)a3
{
  id v4 = (RCWaveformSegment *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    goto LABEL_10;
  }
  id v6 = [(RCWaveformSegment *)v4 averagePowerLevelsCount];
  if (v6 != (id)[(RCWaveformSegment *)self averagePowerLevelsCount])
  {
    BOOL v11 = 0;
    goto LABEL_12;
  }
  int64_t v7 = [(RCWaveformSegment *)self averagePowerLevelsCount];
  if (!v7)
  {
LABEL_10:
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    int64_t v9 = v7 - 1;
    do
    {
      BOOL v10 = RCEqualFloatsWithTolerance(*((float *)[(RCWaveformSegment *)self averagePowerLevels] + v8), *((float *)[(RCWaveformSegment *)v5 averagePowerLevels] + v8), 0.1);
      BOOL v11 = v10;
    }
    while (v9 != v8++ && v10);
  }
LABEL_12:

  return v11;
}

- (id)copyWithTimeRangeOffsetByTimeOffset:(double)a3
{
  double v4 = self->_timeRange.beginTime + a3;
  double v5 = self->_timeRange.endTime + a3;
  id v6 = objc_alloc((Class)objc_opt_class());
  averagePowerLevelData = self->_averagePowerLevelData;

  return objc_msgSend(v6, "initWithTimeRange:averagePowerLevelData:", averagePowerLevelData, v4, v5);
}

- (id)copyWithAdjustedTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v6 = objc_alloc((Class)objc_opt_class());
  averagePowerLevelData = self->_averagePowerLevelData;

  return objc_msgSend(v6, "initWithTimeRange:averagePowerLevelData:", averagePowerLevelData, var0, var1);
}

+ (id)segmentsByReparingDiscontinuitiesInSegments:(id)a3
{
  v3 = [a1 _discontinuityRepairedSegmentsByGrowingToFillGapsInSegments:a3];

  return v3;
}

+ (id)segmentsByShiftingSegments:(id)a3 byTimeOffset:(double)a4
{
  id v5 = a3;
  if ([v5 count])
  {
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "copyWithTimeRangeOffsetByTimeOffset:", a4, (void)v13);
          [v6 addObject:v11];
        }
        id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v6 = [v5 mutableCopy];
  }

  return v6;
}

+ (id)segmentsByMergingSegments:(id)a3 preferredSegmentDuration:(double)a4 beforeTime:(double)a5 andThenUsePreferredSegmentDuration:(double)a6
{
  id v10 = a3;
  if ((unint64_t)[v10 count] <= 1)
  {
    id v11 = v10;
    goto LABEL_42;
  }
  id v43 = v10;
  id v44 = [v10 mutableCopy];
  if (v44)
  {
    objc_super v12 = +[NSMutableArray array];
    long long v13 = +[NSMutableArray arrayWithObject:v12];

    id v11 = +[NSMutableArray array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v14 = v44;
    id v15 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v50;
      double v17 = 0.0;
      double v18 = a4;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v50 != v16) {
            objc_enumerationMutation(v14);
          }
          v20 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          [v20 timeRange];
          double v22 = v21;
          double v24 = v23;
          if (v21 >= a5 && v18 == a4)
          {
            v26 = +[NSMutableArray array];
            [v13 addObject:v26];

            double v18 = a6;
          }
          v27 = [v13 lastObject];
          if (![v27 count]) {
            double v17 = v22;
          }
          [v27 addObject:v20];
          if (v24 - v17 >= v18)
          {
            v28 = +[NSMutableArray array];
            [v13 addObject:v28];
          }
        }
        id v15 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v15);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v29 = v13;
    id v30 = [v29 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v46;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v46 != v31) {
            objc_enumerationMutation(v29);
          }
          v33 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
          if ([v33 count] == (char *)&def_3AC7C + 1)
          {
            v34 = [v33 objectAtIndexedSubscript:0];
            [v11 addObject:v34];
          }
          else
          {
            if ((unint64_t)[v33 count] < 2) {
              continue;
            }
            v34 = [v33 firstObject];
            v35 = [v33 lastObject];
            [v34 timeRange];
            double v37 = v36;
            [v35 timeRange];
            double v39 = v38 - v37;
            if (v37 >= a5) {
              double v40 = a6;
            }
            else {
              double v40 = a4;
            }
            if (v39 >= v40)
            {
              v41 = [a1 _segmentByMergingMergableSegments:v33];
              [v11 addObject:v41];
            }
            else
            {
              [v11 addObjectsFromArray:v33];
            }
          }
        }
        id v30 = [v29 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v30);
    }
  }
  else
  {
    id v11 = v10;
  }

  id v10 = v43;
LABEL_42:

  return v11;
}

+ (id)segmentsByMergingSegments:(id)a3 preferredSegmentDuration:(double)a4
{
  double v4 = [a1 segmentsByMergingSegments:a3 preferredSegmentDuration:a4 beforeTime:1.79769313e308 andThenUsePreferredSegmentDuration:1.0];

  return v4;
}

- (id)segmentsByJoiningIfSmallSegment:(id)a3
{
  v3 = [(RCWaveformSegment *)self _segmentsByJoiningIfNecessaryGreaterSegment:a3 averagePowerLevelJoinLimit:8];

  return v3;
}

- (id)segmentsByJoiningIfSmallSegment:(id)a3 averagePowerLevelJoinLimit:(unint64_t)a4
{
  id v6 = a3;
  if (!v6)
  {
    v20 = self;
    id v11 = &v20;
    uint64_t v12 = 1;
LABEL_5:
    uint64_t v10 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, v12, v18, v19, v20);
    goto LABEL_8;
  }
  [(RCWaveformSegment *)self timeRange];
  double v8 = v7;
  [v6 timeRange];
  if (v8 == v9)
  {
    uint64_t v10 = [(RCWaveformSegment *)self _segmentsByJoiningIfNecessaryGreaterSegment:v6 averagePowerLevelJoinLimit:a4];
    goto LABEL_8;
  }
  [v6 timeRange];
  double v14 = v13;
  [(RCWaveformSegment *)self timeRange];
  if (v14 != v15)
  {
    double v18 = self;
    id v19 = v6;
    id v11 = &v18;
    uint64_t v12 = 2;
    goto LABEL_5;
  }
  uint64_t v10 = [v6 _segmentsByJoiningIfNecessaryGreaterSegment:self averagePowerLevelJoinLimit:a4];
LABEL_8:
  uint64_t v16 = (void *)v10;

  return v16;
}

- (id)segmentByClippingToTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  [(RCWaveformSegment *)self timeRange];
  if (RCTimeRangeEqualToTimeRange(var0, var1, v6, v7)
    || ([(RCWaveformSegment *)self timeRange], RCTimeRangeContainsRange(var0, var1, v8, v9))
    || ([(RCWaveformSegment *)self timeRange], RCTimeRangeContainsRange(var0, var1, v10, v11)))
  {
    uint64_t v12 = self;
  }
  else
  {
    [(RCWaveformSegment *)self timeRange];
    if (v14 > var1)
    {
      [(RCWaveformSegment *)self timeRange];
      if (v15 <= var1) {
        goto LABEL_16;
      }
    }
    [(RCWaveformSegment *)self timeRange];
    if (var0 < v16) {
      double var0 = v16;
    }
    [(RCWaveformSegment *)self timeRange];
    if (var1 < v17) {
      double v17 = var1;
    }
    if (var0 >= v17)
    {
LABEL_16:
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = [(RCWaveformSegment *)self _segmentWithValuesInContainedTimeRange:RCTimeRangeMake(var0, v17)];
    }
  }

  return v12;
}

+ (id)_discontinuityRepairedSegmentsByGrowingToFillGapsInSegments:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] > 1)
  {
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    for (unint64_t i = 1; i < (unint64_t)[v3 count]; unint64_t i = v8 + 1)
    {
      unint64_t v6 = i - 1;
      double v7 = [v3 objectAtIndexedSubscript:i - 1];
      unint64_t v8 = v6 + 1;
      double v9 = [v3 objectAtIndexedSubscript:v6 + 1];
      [v9 timeRange];
      double v11 = v10;
      [v7 timeRange];
      if (vabdd_f64(v11, v12) > 0.01)
      {
        [v7 timeRange];
        id v13 = objc_msgSend(v7, "copyWithAdjustedTimeRange:");

        double v7 = v13;
      }
      [v4 addObject:v7];
    }
    double v14 = [v3 lastObject];
    [v4 addObject:v14];
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

- (id)_segmentWithValuesInContainedTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  int64_t v6 = [(RCWaveformSegment *)self averagePowerLevelsCount];
  if (v6)
  {
    int64_t v7 = v6;
    double v8 = RCTimeRangeDeltaWithExactPrecision(self->_timeRange.beginTime, self->_timeRange.endTime);
    float v9 = v8 / (float)[(RCWaveformSegment *)self averagePowerLevelsCount];
    [(RCWaveformSegment *)self timeRange];
    double v11 = (var0 - v10) / v9;
    if (v7 - 1 >= (unint64_t)v11) {
      unint64_t v12 = (unint64_t)v11;
    }
    else {
      unint64_t v12 = v7 - 1;
    }
    [(RCWaveformSegment *)self timeRange];
    double v14 = v13 + (float)(v9 * (float)v12);
    unint64_t v15 = vcvtpd_u64_f64(RCTimeRangeDeltaWithExactPrecision(v14, var1) / v9);
    if (v15 <= 1) {
      unint64_t v15 = 1;
    }
    if (v7 - v12 >= v15) {
      unint64_t v16 = v15;
    }
    else {
      unint64_t v16 = v7 - v12;
    }
    if (v16)
    {
      double v17 = +[NSMutableData dataWithLength:4 * v16];
      double v18 = [(RCWaveformSegment *)self averagePowerLevels];
      id v19 = v17;
      memmove([v19 mutableBytes], &v18[v12], 4 * v16);
      v20 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelData:]([RCWaveformSegment alloc], "initWithTimeRange:averagePowerLevelData:", v19, v14, v14 + (float)(v9 * (float)v16));
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "emptySegmentWithTimeRange:", var0, var1);
    v20 = (RCWaveformSegment *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)_segmentsByJoiningIfNecessaryGreaterSegment:(id)a3 averagePowerLevelJoinLimit:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    int64_t v7 = objc_opt_class();
    v14[0] = self;
    v14[1] = v6;
    double v8 = +[NSArray arrayWithObjects:v14 count:2];
    float v9 = [v7 _discontinuityRepairedSegmentsByGrowingToFillGapsInSegments:v8];

    double v10 = [v9 objectAtIndexedSubscript:0];
    double v11 = [v9 objectAtIndexedSubscript:1];
    unint64_t v12 = +[RCWaveformSegment _segmentsByJoiningSegment:v10 toSegmentIfNecessaryWithGreaterSegment:v11 averagePowerLevelJoinLimit:a4];
  }
  else
  {
    unint64_t v15 = self;
    unint64_t v12 = +[NSArray arrayWithObjects:&v15 count:1];
  }

  return v12;
}

+ (id)_segmentsByJoiningSegment:(id)a3 toSegmentIfNecessaryWithGreaterSegment:(id)a4 averagePowerLevelJoinLimit:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  [v7 timeRange];
  double v11 = RCTimeRangeDeltaWithExactPrecision(v9, v10);
  [v8 timeRange];
  double v14 = RCTimeRangeDeltaWithExactPrecision(v12, v13);
  if ((uint64_t)[v7 averagePowerLevelsCount] <= 1)
  {
    [v7 timeRange];
    double v16 = v15;
    [v8 timeRange];
    id v18 = objc_msgSend(v8, "copyWithAdjustedTimeRange:", RCTimeRangeMake(v16, v17));
    id v59 = v18;
    uint64_t v19 = +[NSArray arrayWithObjects:&v59 count:1];
LABEL_5:
    double v23 = (void *)v19;
LABEL_6:

    goto LABEL_7;
  }
  if ((uint64_t)[v8 averagePowerLevelsCount] <= 1)
  {
    [v7 timeRange];
    double v21 = v20;
    [v8 timeRange];
    id v18 = objc_msgSend(v7, "copyWithAdjustedTimeRange:", RCTimeRangeMake(v21, v22));
    id v58 = v18;
    uint64_t v19 = +[NSArray arrayWithObjects:&v58 count:1];
    goto LABEL_5;
  }
  v25 = (char *)[v7 averagePowerLevelsCount];
  if (&v25[(void)[v8 averagePowerLevelsCount]] < (char *)a5)
  {
    float v26 = v11;
    float v27 = v14;
    if ((float)(v26 + v27) > 0.0)
    {
      [v7 timeRange];
      double v29 = v28;
      [v8 timeRange];
      double v31 = RCTimeRangeMake(v29, v30);
      double v33 = v32;
      [v7 timeRange];
      double v36 = RCTimeRangeDeltaWithExactPrecision(v34, v35);
      id v37 = [v7 averagePowerLevelsCount];
      [v8 timeRange];
      double v40 = RCTimeRangeDeltaWithExactPrecision(v38, v39);
      id v41 = [v8 averagePowerLevelsCount];
      float v42 = v36;
      float v43 = v42 / (float)(uint64_t)v37;
      float v44 = v40;
      float v45 = v44 / (float)(uint64_t)v41;
      if (v43 > 0.0)
      {
        if (v45 <= 0.0)
        {
          float v45 = v42 / (float)(uint64_t)v37;
        }
        else if (v43 < v45)
        {
          float v45 = v42 / (float)(uint64_t)v37;
        }
      }
      uint64_t v46 = (uint64_t)(RCTimeRangeDeltaWithExactPrecision(v31, v33) / v45);
      id v18 = +[NSMutableData dataWithLength:4 * v46];
      long long v47 = [v18 mutableBytes];
      if (v46)
      {
        long long v48 = v47;
        for (unint64_t i = 0; i != v46; ++i)
        {
          [v7 timeRange];
          float v50 = v45 * (float)i;
          if (v51 <= v50)
          {
            long long v52 = [v8 averagePowerLevels];
            uint64_t v53 = (uint64_t)(v50 - v42);
            float v54 = v44;
          }
          else
          {
            long long v52 = [v7 averagePowerLevels];
            uint64_t v53 = (uint64_t)v50;
            float v54 = v42;
          }
          v48[i] = v52[(uint64_t)(float)((float)v53 / v54)];
        }
      }
      v55 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelData:]([RCWaveformSegment alloc], "initWithTimeRange:averagePowerLevelData:", v18, v31, v33);
      v57 = v55;
      double v23 = +[NSArray arrayWithObjects:&v57 count:1];

      goto LABEL_6;
    }
  }
  v56[0] = v7;
  v56[1] = v8;
  double v23 = +[NSArray arrayWithObjects:v56 count:2];
LABEL_7:

  return v23;
}

+ (id)_segmentByMergingMergableSegments:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    uint64_t v6 = [0 objectAtIndexedSubscript:0];
    goto LABEL_16;
  }
  if ([v4 count] == (char *)&def_3AC7C + 1)
  {
    uint64_t v6 = [v5 objectAtIndexedSubscript:0];
LABEL_16:
    double v17 = (void *)v6;
    goto LABEL_17;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    double v10 = 0.0;
    do
    {
      for (unint64_t i = 0; i != v8; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "timeRange", (void)v19);
        double v15 = RCTimeRangeDeltaWithExactPrecision(v13, v14);
        double v10 = v10 + v15 / (double)(uint64_t)[v12 averagePowerLevelsCount];
      }
      id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  double v16 = v10 / (double)(unint64_t)[v7 count];
  double v17 = [a1 _mergedSegmentByFastMergingWithMergeableSegments:v7 mergedLevelsDuration:v16];
  if (!v17)
  {
    uint64_t v6 = [a1 _mergedSegmentByResamplingWithMergeableSegments:v7 mergedLevelsDuration:v16];
    goto LABEL_16;
  }
LABEL_17:

  return v17;
}

+ (id)_mergedSegmentByFastMergingWithMergeableSegments:(id)a3 mergedLevelsDuration:(double)a4
{
  return 0;
}

+ (id)_mergedSegmentByResamplingWithMergeableSegments:(id)a3 mergedLevelsDuration:(double)a4
{
  id v5 = a3;
  float v43 = [v5 firstObject];
  id v41 = [v5 lastObject];
  [v43 timeRange];
  double v7 = v6;
  [v41 timeRange];
  double v9 = RCTimeRangeMake(v7, v8);
  double v11 = v10;
  unint64_t v12 = (unint64_t)(RCTimeRangeDeltaWithExactPrecision(v9, v10) / a4);
  id v13 = +[NSMutableData dataWithLength:4 * v12];
  float v42 = (float *)[v13 mutableBytes];
  if (v12)
  {
    double v14 = 0;
    for (unint64_t i = 0; i != v12; ++i)
    {
      [v43 timeRange];
      double v17 = v16 + (double)i * a4;
      unint64_t v18 = (unint64_t)v14;
      do
      {
        double v14 = (char *)v18;
        if (v18 >= (unint64_t)[v5 count]) {
          break;
        }
        long long v19 = [v5 objectAtIndexedSubscript:v18];
        [v19 timeRange];
        BOOL v22 = RCTimeRangeContainsTime(v20, v21, v17);
        ++v18;
      }
      while (!v22);
      if ([v5 count] == v14) {
        break;
      }
      double v23 = [v5 objectAtIndexedSubscript:v14];
      [v23 timeRange];
      double v26 = RCTimeRangeDeltaWithExactPrecision(v24, v25);
      id v27 = [v23 averagePowerLevelsCount];
      [v23 timeRange];
      double v29 = v28;
      id v30 = [v23 averagePowerLevelsCount];
      double v31 = (v17 - v29) / (v26 / (double)(uint64_t)v27);
      if ((uint64_t)v30 - 1 >= (uint64_t)v31) {
        uint64_t v32 = (uint64_t)v31;
      }
      else {
        uint64_t v32 = (uint64_t)v30 - 1;
      }
      double v33 = [v5 objectAtIndexedSubscript:v14];
      id v34 = v13;
      uint64_t v35 = v32 + 1;
      if ((char *)(v32 + 1) >= (char *)[v23 averagePowerLevelsCount] - 1)
      {
        if (v14 + 1 >= [v5 count])
        {
          uint64_t v35 = v32;
        }
        else
        {
          uint64_t v36 = objc_msgSend(v5, "objectAtIndexedSubscript:");

          uint64_t v35 = 0;
          double v33 = (void *)v36;
        }
      }
      float v37 = *((float *)[v23 averagePowerLevels] + v32);
      float v38 = *((float *)[v33 averagePowerLevels] + v35);
      if (v37 >= v38) {
        float v38 = v37;
      }
      v42[i] = v38;

      id v13 = v34;
    }
  }
  double v39 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelData:]([RCWaveformSegment alloc], "initWithTimeRange:averagePowerLevelData:", v13, v9, v11);

  return v39;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRange
{
  double beginTime = self->_timeRange.beginTime;
  double endTime = self->_timeRange.endTime;
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- (BOOL)isRendered
{
  return self->_isRendered;
}

- (void)setIsRendered:(BOOL)a3
{
  self->_isRendered = a3;
}

- (void).cxx_destruct
{
}

@end