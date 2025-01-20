@interface RCWaveform
+ (BOOL)supportsSecureCoding;
+ (RCWaveform)waveformWithContentsOfURL:(id)a3 minimumRequiredVersion:(unint64_t)a4;
+ (_NSRange)rangeOfSegmentsIntersectingTimeRange:(id)a3 withSegments:(id)a4;
+ (id)_mutableSegmentsByClippingToTimeRange:(id)a3 withSegments:(id)a4;
+ (id)_mutableSegmentsIntersectingTimeRange:(id)a3 intersectionRange:(_NSRange *)a4 withSegments:(id)a5;
+ (id)waveformURLForAVURL:(id)a3;
+ (void)_mergeBoundarySegmentsInArray:(id)a3;
+ (void)initialize;
- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRange;
- (BOOL)_isWaveformDataEqualToDataInWaveform:(id)a3 useAlmostEqual:(BOOL)a4;
- (BOOL)hasUniformPowerLevel:(float)a3;
- (BOOL)isWaveformDataAlmostEqualToDataInWaveform:(id)a3;
- (BOOL)isWaveformDataEqualToDataInWaveform:(id)a3;
- (BOOL)saveContentsToURL:(id)a3;
- (NSArray)segments;
- (NSArray)segmentsCopy;
- (RCWaveform)init;
- (RCWaveform)initWithCoder:(id)a3;
- (RCWaveform)initWithSegments:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)segmentsByClippingToTimeRange:(id)a3;
- (id)segmentsIntersectingTimeRange:(id)a3;
- (unint64_t)averagePowerLevelsRate;
- (unint64_t)segmentCount;
- (void)encodeWithCoder:(id)a3;
- (void)setSegments:(id)a3;
@end

@implementation RCWaveform

- (RCWaveform)init
{
  v6.receiver = self;
  v6.super_class = (Class)RCWaveform;
  v2 = [(RCWaveform *)&v6 init];
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    segments = v2->_segments;
    v2->_segments = v3;
  }
  return v2;
}

- (RCWaveform)initWithSegments:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RCWaveform;
  v5 = [(RCWaveform *)&v9 init];
  if (v5)
  {
    objc_super v6 = (NSArray *)[v4 mutableCopy];
    segments = v5->_segments;
    v5->_segments = v6;
  }
  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[RCWaveform setVersion:2];
  }
}

- (BOOL)hasUniformPowerLevel:(float)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(RCWaveform *)v4 segments];
  id v6 = [v5 count];

  if (v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v7 = [(RCWaveform *)v4 segments];
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          *(float *)&double v9 = a3;
          if (([*(id *)(*((void *)&v13 + 1) + 8 * i) hasUniformPowerLevel:v9] & 1) == 0)
          {
            LODWORD(v8) = 1;
            goto LABEL_12;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LODWORD(v8) = 1;
  }
  objc_sync_exit(v4);

  return v8 == 0;
}

- (BOOL)isWaveformDataEqualToDataInWaveform:(id)a3
{
  return [(RCWaveform *)self _isWaveformDataEqualToDataInWaveform:a3 useAlmostEqual:0];
}

- (BOOL)isWaveformDataAlmostEqualToDataInWaveform:(id)a3
{
  return [(RCWaveform *)self _isWaveformDataEqualToDataInWaveform:a3 useAlmostEqual:1];
}

- (BOOL)_isWaveformDataEqualToDataInWaveform:(id)a3 useAlmostEqual:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (RCWaveform *)a3;
  if (v6 == self)
  {
    char v15 = 1;
  }
  else
  {
    v7 = self;
    objc_sync_enter(v7);
    id v8 = [(RCWaveform *)v6 segments];
    id v9 = [v8 count];
    uint64_t v10 = [(RCWaveform *)v7 segments];
    id v11 = [v10 count];

    if (v9 == v11)
    {
      for (unint64_t i = 0; ; ++i)
      {
        long long v13 = [(RCWaveform *)v7 segments];
        id v14 = [v13 count];

        char v15 = i >= (unint64_t)v14;
        if (i >= (unint64_t)v14) {
          break;
        }
        if (v4)
        {
          long long v16 = [(RCWaveform *)v6 segments];
          v17 = [v16 objectAtIndexedSubscript:i];
          v18 = [(RCWaveform *)v7 segments];
          v19 = [v18 objectAtIndexedSubscript:i];
          unsigned __int8 v20 = [v17 isWaveformDataAlmostEqualToDataInSegment:v19];

          if ((v20 & 1) == 0) {
            break;
          }
        }
        else
        {
          v21 = [(RCWaveform *)v6 segments];
          v22 = [v21 objectAtIndexedSubscript:i];
          v23 = [(RCWaveform *)v7 segments];
          v24 = [v23 objectAtIndexedSubscript:i];
          unsigned int v25 = [v22 isWaveformDataEqualToDataInSegment:v24];

          if (!v25) {
            break;
          }
        }
      }
    }
    else
    {
      char v15 = 0;
    }
    objc_sync_exit(v7);
  }
  return v15;
}

- (NSArray)segmentsCopy
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(RCWaveform *)v2 segments];
  id v4 = [v3 copy];

  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (unint64_t)segmentCount
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(RCWaveform *)v2 segments];
  id v4 = [v3 count];

  objc_sync_exit(v2);
  return (unint64_t)v4;
}

- (unint64_t)averagePowerLevelsRate
{
  v2 = self;
  objc_sync_enter(v2);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = [(RCWaveform *)v2 segments];
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v16;
    double v7 = 0.0;
    do
    {
      for (unint64_t i = 0; i != v4; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [v9 averagePowerLevelsCount];
        [v9 timeRange];
        v5 += (unint64_t)v10;
        double v7 = v7 + RCTimeRangeDeltaWithExactPrecision(v11, v12);
      }
      id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
    double v13 = (double)v5;
  }
  else
  {
    double v7 = 0.0;
    double v13 = 0.0;
  }

  objc_sync_exit(v2);
  if (v7 >= 0.00000011920929) {
    return (unint64_t)fmax(v13 / v7, 1.0);
  }
  else {
    return 1;
  }
}

+ (id)waveformURLForAVURL:(id)a3
{
  v3 = objc_msgSend(a3, "rc_URLByReplacingPathExtensionWithExtension:", @"waveform");

  return v3;
}

+ (RCWaveform)waveformWithContentsOfURL:(id)a3 minimumRequiredVersion:(unint64_t)a4
{
  unint64_t v5 = +[NSData dataWithContentsOfURL:a3];
  id v13 = 0;
  uint64_t v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v13];
  id v7 = v13;
  if (v6)
  {
    if (v6[1] >= a4)
    {
      uint64_t v9 = objc_opt_class();
      if (v9 == objc_opt_class()) {
        goto LABEL_7;
      }
      id v10 = objc_alloc((Class)objc_opt_class());
      uint64_t v11 = [v6 segments];
      id v8 = [v10 initWithSegments:v11];

      uint64_t v6 = (void *)v11;
    }
    else
    {
      id v8 = 0;
    }

    uint64_t v6 = v8;
  }
LABEL_7:

  return (RCWaveform *)v6;
}

- (BOOL)saveContentsToURL:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[NSFileManager defaultManager];
  uint64_t v6 = [v4 URLByDeletingLastPathComponent];
  [v5 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:0];

  id v12 = 0;
  id v7 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v12];
  id v8 = v12;
  if (v7)
  {
    unsigned __int8 v9 = [v7 writeToURL:v4 atomically:1];
  }
  else
  {
    id v10 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_463D4((uint64_t)v8, v10);
    }

    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)segmentsByClippingToTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  unint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = objc_opt_class();
  id v7 = [(RCWaveform *)v5 segments];
  id v8 = objc_msgSend(v6, "_mutableSegmentsByClippingToTimeRange:withSegments:", v7, var0, var1);

  objc_sync_exit(v5);

  return v8;
}

- (id)segmentsIntersectingTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  unint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = objc_opt_class();
  id v7 = [(RCWaveform *)v5 segments];
  id v8 = objc_msgSend(v6, "_mutableSegmentsIntersectingTimeRange:intersectionRange:withSegments:", 0, v7, var0, var1);

  objc_sync_exit(v5);

  return v8;
}

+ (_NSRange)rangeOfSegmentsIntersectingTimeRange:(id)a3 withSegments:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v6 = a4;
  if ([v6 count])
  {
    id v7 = [RCWaveformSegment alloc];
    id v8 = +[NSData data];
    unsigned __int8 v9 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelData:](v7, "initWithTimeRange:averagePowerLevelData:", v8, var0, var1);

    uint64_t v10 = (uint64_t)objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, objc_msgSend(v6, "count"), 256, &stru_6D788);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = 0;
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else if ((unsigned char *)v10 == (char *)[v6 count] - 1)
    {
      uint64_t v11 = 1;
    }
    else
    {
      id v12 = (char *)objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v9, v10, (char *)objc_msgSend(v6, "count") - v10, 512, &stru_6D788);
      if (v12 == (char *)0x7FFFFFFFFFFFFFFFLL) {
        id v12 = (char *)[v6 count] - 1;
      }
      uint64_t v11 = (uint64_t)&v12[-v10 + 1];
    }
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v13 = v10;
  NSUInteger v14 = v11;
  result.length = v14;
  result.location = v13;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRange
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(RCWaveform *)v2 segments];
  id v4 = [v3 firstObject];
  [v4 timeRange];
  double v6 = v5;
  id v7 = [(RCWaveform *)v2 segments];
  id v8 = [v7 lastObject];
  [v8 timeRange];
  double v10 = RCTimeRangeMake(v6, v9);
  double v12 = v11;

  objc_sync_exit(v2);
  double v13 = v10;
  double v14 = v12;
  result.double var1 = v14;
  result.double var0 = v13;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RCWaveform)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
  id v7 = [v4 decodeObjectOfClasses:v6 forKey:@"RCSegments"];
  id v8 = (NSArray *)[v7 mutableCopy];
  segments = self->_segments;
  self->_segments = v8;

  self->_decodedVersion = (unint64_t)[v4 decodeIntegerForKey:@"RCWaveformEncodingVersion"];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = +[RCWaveformSegment segmentsByReparingDiscontinuitiesInSegments:self->_segments];
  [v5 encodeObject:v4 forKey:@"RCSegments"];
  objc_msgSend(v5, "encodeInteger:forKey:", +[RCWaveform version](RCWaveform, "version"), @"RCWaveformEncodingVersion");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v3 = self;
  objc_sync_enter(v3);
  id v4 = [RCMutableWaveform alloc];
  id v5 = [(RCWaveform *)v3 segments];
  double v6 = [(RCWaveform *)v4 initWithSegments:v5];

  objc_sync_exit(v3);
  return v6;
}

+ (id)_mutableSegmentsByClippingToTimeRange:(id)a3 withSegments:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v7 = a4;
  id v8 = objc_msgSend(a1, "_mutableSegmentsIntersectingTimeRange:intersectionRange:withSegments:", 0, v7, var0, var1);
  if ([v8 count])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_215E0;
    v13[3] = &unk_6D7B0;
    id v9 = v8;
    id v14 = v9;
    double v15 = var0;
    double v16 = var1;
    double v10 = objc_retainBlock(v13);
    if ([v9 count]) {
      ((void (*)(void *, void))v10[2])(v10, 0);
    }
    if ([v9 count]) {
      ((void (*)(void *, char *))v10[2])(v10, (char *)[v9 count] - 1);
    }
    [a1 _mergeBoundarySegmentsInArray:v9];
    id v11 = v9;
  }
  else
  {
    id v11 = [&__NSArray0__struct mutableCopy];
  }

  return v11;
}

+ (id)_mutableSegmentsIntersectingTimeRange:(id)a3 intersectionRange:(_NSRange *)a4 withSegments:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v9 = a5;
  id v10 = objc_msgSend(a1, "rangeOfSegmentsIntersectingTimeRange:withSegments:", v9, var0, var1);
  unint64_t v12 = (unint64_t)v10;
  NSUInteger v13 = v11;
  if (a4)
  {
    a4->location = (NSUInteger)v10;
    a4->length = v11;
  }
  if (v11 && [v9 count])
  {
    id v14 = (char *)[v9 count];
    if (v12 >= (unint64_t)(v14 - 1)) {
      unint64_t v12 = (unint64_t)(v14 - 1);
    }
    id v15 = [v9 count];
    unint64_t v16 = (unint64_t)[v9 count] - v12;
    if (v13 < v16) {
      unint64_t v16 = v13;
    }
    if (v16 <= (v15 != 0)) {
      BOOL v17 = v15 != 0;
    }
    else {
      BOOL v17 = v16;
    }
    long long v18 = objc_msgSend(v9, "subarrayWithRange:", v12, v17);
    id v19 = [v18 mutableCopy];
  }
  else
  {
    id v19 = +[NSMutableArray array];
  }

  return v19;
}

+ (void)_mergeBoundarySegmentsInArray:(id)a3
{
  id v9 = a3;
  if ((unint64_t)[v9 count] >= 2)
  {
    v3 = [v9 objectAtIndex:0];
    id v4 = [v9 objectAtIndex:1];
    id v5 = [v3 segmentsByJoiningIfSmallSegment:v4];
    objc_msgSend(v9, "replaceObjectsInRange:withObjectsFromArray:", 0, 2, v5);
    if ((unint64_t)[v9 count] < 2)
    {
      id v7 = v4;
      double v6 = v3;
    }
    else
    {
      double v6 = objc_msgSend(v9, "objectAtIndex:", (char *)objc_msgSend(v9, "count") - 2);

      id v7 = objc_msgSend(v9, "objectAtIndex:", (char *)objc_msgSend(v9, "count") - 1);

      id v8 = [v6 segmentsByJoiningIfSmallSegment:v7];
      objc_msgSend(v9, "replaceObjectsInRange:withObjectsFromArray:", (char *)objc_msgSend(v9, "count") - 2, 2, v8);
    }
  }
}

- (NSArray)segments
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSegments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end