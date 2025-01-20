@interface AVTimeRangeCollection
- (AVTimeRangeCollection)init;
- (AVTimeRangeCollection)initWithInterstitialTimeRanges:(id)a3;
- (AVTimeRangeCollection)initWithTimeRanges:(id)a3;
- (AVTimeRangeCollection)initWithTimedMetadataGroups:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTimeRangeCollection:(id)a3;
- (NSArray)timeRanges;
- (double)combinedDuration;
- (double)displayTimeFromTime:(double)a3;
- (double)timeFromDisplayTime:(double)a3;
- (id)arrayOfBoundaryTimes;
- (id)arrayOfDisplayTimes;
- (id)arrayOfDisplayTimesMatching:(id)a3;
- (id)description;
- (id)displayTimeRangeTrimmedToTimeRange:(id)a3;
- (id)timeRangeAfterTime:(double)a3;
- (id)timeRangeBeforeTime:(double)a3;
- (id)timeRangeClosestToTime:(double)a3;
- (id)timeRangeContainingTime:(double)a3;
- (id)timeRangesBetweenDisplayTime:(double)a3 and:(double)a4;
- (unint64_t)count;
- (void)setMapDate:(id)a3 toTime:(double)a4;
@end

@implementation AVTimeRangeCollection

- (AVTimeRangeCollection)initWithInterstitialTimeRanges:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (v11)
        {
          [*(id *)(*((void *)&v16 + 1) + 8 * i) timeRange];
          if ((v15 & 0x1D) == 1)
          {
            v12 = +[AVTimeRange timeRangeWithInterstice:v11];
            [v5 addObject:v12];
          }
        }
        else
        {
          char v15 = 0;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v13 = [(AVTimeRangeCollection *)self initWithTimeRanges:v5];
  return v13;
}

- (void).cxx_destruct
{
}

- (double)combinedDuration
{
  return self->_combinedDuration;
}

- (NSArray)timeRanges
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = self->_timeRanges;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v19 + 1) + 8 * i) description];
        v10 = (void *)v9;
        if (v9) {
          uint64_t v11 = (__CFString *)v9;
        }
        else {
          uint64_t v11 = @"??";
        }
        [v3 addObject:v11];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  v12 = NSString;
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  NSUInteger v15 = [(NSArray *)self->_timeRanges count];
  long long v16 = [v3 componentsJoinedByString:@", "];
  long long v17 = [v12 stringWithFormat:@"<%@ %p>: %d ranges [%@]", v14, self, v15, v16, (void)v19];

  return v17;
}

- (id)displayTimeRangeTrimmedToTimeRange:(id)a3
{
  id v4 = a3;
  [v4 startTime];
  uint64_t v5 = -[AVTimeRangeCollection timeRangeContainingTime:](self, "timeRangeContainingTime:");
  if (v5)
  {
    id v6 = [v4 timeRangeExcludingTimeRange:v5];
  }
  else
  {
    id v6 = v4;
  }
  uint64_t v7 = v6;
  [v6 duration];
  if (v8 == 0.0)
  {
    uint64_t v9 = +[AVTimeRange timeRangeZero];
  }
  else
  {
    [v7 startTime];
    -[AVTimeRangeCollection displayTimeFromTime:](self, "displayTimeFromTime:");
    double v11 = v10;
    [v7 endTime];
    -[AVTimeRangeCollection displayTimeFromTime:](self, "displayTimeFromTime:");
    uint64_t v9 = [[AVTimeRange alloc] initWithStartTime:v11 endTime:v12];
  }
  v13 = v9;

  return v13;
}

- (double)timeFromDisplayTime:(double)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(AVTimeRangeCollection *)self timeRanges];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
      [v9 startTime];
      if (a3 <= v10) {
        break;
      }
      if ([v9 isCollapsedInTimeLine])
      {
        [v9 duration];
        a3 = a3 + v11;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return a3;
}

- (double)displayTimeFromTime:(double)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(AVTimeRangeCollection *)self timeRanges];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    double v8 = 0.0;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v10 containsTime:a3])
        {
          if ([v10 isCollapsedInTimeLine])
          {
            [v10 startTime];
            double v14 = v15 - v8;
          }
          else
          {
LABEL_18:
            double v14 = a3 - v8;
          }
LABEL_20:

          return v14;
        }
        [v10 startTime];
        if (v11 > a3) {
          goto LABEL_18;
        }
        if ([v10 isCollapsedInTimeLine])
        {
          [v10 duration];
          double v8 = v8 + v12;
        }
        [v10 endTime];
        if (v13 == a3)
        {
          double v14 = a3 - v8 + 0.00000011920929;
          goto LABEL_20;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v8 = 0.0;
  }

  return a3 - v8;
}

- (id)timeRangesBetweenDisplayTime:(double)a3 and:(double)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(AVTimeRangeCollection *)self timeFromDisplayTime:a3];
  double v7 = v6;
  [(AVTimeRangeCollection *)self timeFromDisplayTime:a4];
  double v9 = v8;
  if (v7 >= v8) {
    double v10 = v8;
  }
  else {
    double v10 = v7;
  }
  double v11 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v12 = [(AVTimeRangeCollection *)self timeRanges];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    double v15 = v7 + v9 - v10;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v12);
        }
        long long v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v18 startTime];
        if (v19 < v15)
        {
          [v18 endTime];
          if (v20 > v10) {
            [v11 addObject:v18];
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  if ([v11 count]) {
    long long v21 = (void *)[v11 copy];
  }
  else {
    long long v21 = 0;
  }

  return v21;
}

- (id)arrayOfDisplayTimes
{
  return [(AVTimeRangeCollection *)self arrayOfDisplayTimesMatching:&__block_literal_global_95_23137];
}

uint64_t __44__AVTimeRangeCollection_arrayOfDisplayTimes__block_invoke()
{
  return 1;
}

- (id)arrayOfDisplayTimesMatching:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  double v6 = [(AVTimeRangeCollection *)self timeRanges];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__AVTimeRangeCollection_arrayOfDisplayTimesMatching___block_invoke;
  v11[3] = &unk_1E5FC4388;
  uint64_t v13 = self;
  id v14 = v4;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 enumerateObjectsWithOptions:0 usingBlock:v11];

  double v9 = (void *)[v7 copy];

  return v9;
}

void __53__AVTimeRangeCollection_arrayOfDisplayTimesMatching___block_invoke(void *a1, void *a2)
{
  id v7 = a2;
  if ((*(unsigned int (**)(void))(a1[6] + 16))())
  {
    id v3 = NSNumber;
    uint64_t v5 = (void *)a1[4];
    id v4 = (void *)a1[5];
    [v7 startTime];
    objc_msgSend(v4, "displayTimeFromTime:");
    double v6 = objc_msgSend(v3, "numberWithDouble:");
    [v5 addObject:v6];
  }
}

- (id)arrayOfBoundaryTimes
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(AVTimeRangeCollection *)self timeRanges];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        double v10 = (void *)MEMORY[0x1E4F29238];
        if (v9) {
          [*(id *)(*((void *)&v19 + 1) + 8 * i) startCMTime];
        }
        else {
          memset(v18, 0, sizeof(v18));
        }
        double v11 = [v10 valueWithCMTime:v18];
        [v3 addObject:v11];

        [v9 duration];
        if (v12 > 0.0)
        {
          uint64_t v13 = (void *)MEMORY[0x1E4F29238];
          if (v9) {
            [v9 endCMTime];
          }
          else {
            memset(v17, 0, sizeof(v17));
          }
          id v14 = [v13 valueWithCMTime:v17];
          [v3 addObject:v14];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  double v15 = (void *)[v3 copy];

  return v15;
}

- (id)timeRangeAfterTime:(double)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(AVTimeRangeCollection *)self timeRanges];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v10 startTime];
        if (v11 > a3)
        {
          if (!v7 || ([v10 startTime], double v13 = v12, objc_msgSend(v7, "startTime"), v13 < v14))
          {
            id v15 = v10;

            uint64_t v7 = v15;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)timeRangeBeforeTime:(double)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(AVTimeRangeCollection *)self timeRanges];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v10 endTime];
        if (v11 < a3)
        {
          if (!v7 || ([v10 endTime], double v13 = v12, objc_msgSend(v7, "endTime"), v13 > v14))
          {
            id v15 = v10;

            uint64_t v7 = v15;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)timeRangeClosestToTime:(double)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AVTimeRangeCollection *)self timeRanges];
  id v6 = [v5 firstObject];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [(AVTimeRangeCollection *)self timeRanges];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v12 containsTime:a3])
        {
          id v17 = v12;

          goto LABEL_13;
        }
        [v6 deltaTimeFromOutsideTime:a3];
        double v14 = fabs(v13);
        [v12 deltaTimeFromOutsideTime:a3];
        if (v14 > fabs(v15))
        {
          id v16 = v12;

          id v6 = v16;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v6 = v6;
  id v17 = v6;
LABEL_13:

  return v17;
}

- (id)timeRangeContainingTime:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(AVTimeRangeCollection *)self timeRanges];
  id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 containsTime:a3])
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (unint64_t)count
{
  v2 = [(AVTimeRangeCollection *)self timeRanges];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AVTimeRangeCollection *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(AVTimeRangeCollection *)self isEqualToTimeRangeCollection:v4];
  }

  return v5;
}

- (BOOL)isEqualToTimeRangeCollection:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AVTimeRangeCollection *)self timeRanges];
  uint64_t v6 = [v4 timeRanges];
  uint64_t v7 = [v5 count];
  if (v7 == [v6 count])
  {
    if ([v5 count])
    {
      unint64_t v8 = 0;
      do
      {
        uint64_t v9 = [v5 objectAtIndexedSubscript:v8];
        long long v10 = [v9 interstice];

        long long v11 = [v6 objectAtIndexedSubscript:v8];
        long long v12 = [v11 interstice];

        char v13 = [v10 isEqual:v12];
        if ((v13 & 1) == 0) {
          break;
        }
        ++v8;
      }
      while (v8 < [v5 count]);
    }
    else
    {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)setMapDate:(id)a3 toTime:(double)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(AVTimeRangeCollection *)self timeRanges];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setMapDate:v6 toTime:a4];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (AVTimeRangeCollection)initWithTimedMetadataGroups:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
        long long v12 = [AVTimeRange alloc];
        long long v13 = -[AVTimeRange initWithAVTimedMetadataGroup:](v12, "initWithAVTimedMetadataGroup:", v11, (void)v16);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  long long v14 = [(AVTimeRangeCollection *)self initWithTimeRanges:v5];
  return v14;
}

- (AVTimeRangeCollection)init
{
  return [(AVTimeRangeCollection *)self initWithTimeRanges:MEMORY[0x1E4F1CBF0]];
}

- (AVTimeRangeCollection)initWithTimeRanges:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AVTimeRangeCollection;
  BOOL v5 = [(AVTimeRangeCollection *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 sortedArrayUsingSelector:sel_compare_];
    timeRanges = v5->_timeRanges;
    v5->_timeRanges = (NSArray *)v6;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = v5->_timeRanges;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      double v12 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_msgSend(v14, "duration", (void)v17);
          double v12 = v12 + v15;
          [v14 endTime];
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }
    else
    {
      double v12 = 0.0;
    }

    v5->_combinedDuration = v12;
  }

  return v5;
}

@end