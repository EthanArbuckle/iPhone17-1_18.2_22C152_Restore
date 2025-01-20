@interface ADStreamSync
- (ADStreamSync)initWithStreamCount:(unint64_t)a3 allowedMatchTimeInterval:(double)a4;
- (BOOL)areOldestMatchingObjectsInAllowedInterval:(unint64_t)a3;
- (BOOL)checkOnceForMatch:(id *)a3;
- (BOOL)dropOldFramesFromStream:(unint64_t)a3 belowTimestampThreshold:(double)a4;
- (BOOL)streamContainsMinimalFrameCount:(unint64_t)a3;
- (double)allowedMatchTimeInterval;
- (double)oldestAverageTimestampForStream:(unint64_t)a3;
- (id)checkForMatch;
- (id)createAndPopulateMatch;
- (id)pushData:(__n128)a3 streamIndex:(__n128)a4 timestamp:(__n128)a5 pose:(__n128)a6 calibration:(uint64_t)a7 meta:(void *)a8;
- (id)pushData:(void *)a1 streamIndex:(uint64_t)a2 timestamp:(uint64_t)a3 pose:(uint64_t)a4;
- (id)pushData:(void *)a1 streamIndex:(uint64_t)a2 timestamp:(uint64_t)a3 pose:(uint64_t)a4 calibration:(uint64_t)a5;
- (id)pushData:(void *)a1 streamIndex:(uint64_t)a2 timestamp:(uint64_t)a3 pose:(uint64_t)a4 meta:(uint64_t)a5;
- (int64_t)reset;
- (int64_t)setStream:(unint64_t)a3 queueSize:(unint64_t)a4;
- (int64_t)setStream:(unint64_t)a3 queueSize:(unint64_t)a4 aggregationCount:(unint64_t)a5 allowedAggregationInterval:(double)a6;
- (void)dealloc;
- (void)setAllowedMatchTimeInterval:(double)a3;
@end

@implementation ADStreamSync

- (ADStreamSync)initWithStreamCount:(unint64_t)a3 allowedMatchTimeInterval:(double)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  self->_allowedMatchTimeInterval = a4;
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:");
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  streamsHistory = self->_streamsHistory;
  self->_streamsHistory = v6;

  if (a3)
  {
    uint64_t v8 = 0;
    do
    {
      v9 = objc_opt_new();
      [(NSMutableArray *)self->_streamsHistory setObject:v9 atIndexedSubscript:v8];

      ++v8;
    }
    while (a3 != v8);
  }
  operator new[]();
}

- (BOOL)areOldestMatchingObjectsInAllowedInterval:(unint64_t)a3
{
  v5 = -[NSMutableArray objectAtIndexedSubscript:](self->_streamsHistory, "objectAtIndexedSubscript:");
  v6 = [v5 objectAtIndexedSubscript:self->_aggregationCounts[a3] - 1];
  v7 = [v5 objectAtIndexedSubscript:0];
  [v6 midExposureTimestamp];
  double v9 = v8;
  [v7 midExposureTimestamp];
  LOBYTE(a3) = v9 - v10 <= self->_allowedAggregationIntervals[a3];

  return a3;
}

- (double)oldestAverageTimestampForStream:(unint64_t)a3
{
  v5 = -[NSMutableArray objectAtIndexedSubscript:](self->_streamsHistory, "objectAtIndexedSubscript:");
  unint64_t v6 = self->_aggregationCounts[a3];
  unint64_t v7 = [v5 count];
  if (v6 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v8)
  {
    uint64_t v9 = 0;
    double v10 = 0.0;
    unsigned int v11 = 1;
    do
    {
      v12 = [v5 objectAtIndex:v9];
      [v12 midExposureTimestamp];
      double v10 = v10 + v13;

      uint64_t v9 = v11;
    }
    while (v8 > v11++);
  }
  else
  {
    double v10 = 0.0;
  }

  return v10 / (double)v8;
}

- (id)pushData:(void *)a1 streamIndex:(uint64_t)a2 timestamp:(uint64_t)a3 pose:(uint64_t)a4 meta:(uint64_t)a5
{
  v5 = objc_msgSend(a1, "pushData:streamIndex:timestamp:pose:calibration:meta:", a3, a4, 0, a5);

  return v5;
}

- (id)pushData:(__n128)a3 streamIndex:(__n128)a4 timestamp:(__n128)a5 pose:(__n128)a6 calibration:(uint64_t)a7 meta:(void *)a8
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v16 = a8;
  id v17 = a10;
  id v18 = a11;
  v19 = a1;
  objc_sync_enter(v19);
  v20 = objc_opt_new();
  [v20 setData:v16];
  [v20 setTimestamp:a2];
  objc_msgSend(v20, "setPose:", a3.n128_f64[0], a4.n128_f64[0], a5.n128_f64[0], a6.n128_f64[0]);
  [v20 setMidExposureTimestamp:a2];
  [v20 setCalibration:v17];
  [v20 setMetadata:v18];
  if ([v19[1] count] <= a9 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = [v19[1] count];
    *(_DWORD *)buf = 134218240;
    unint64_t v31 = a9;
    __int16 v32 = 2048;
    uint64_t v33 = v25;
    _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ADStreamSync error: cannot push to index %lu when number of synced streams is %lu", buf, 0x16u);
  }
  v21 = objc_msgSend(v19[1], "objectAtIndexedSubscript:", a9, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6);
  unint64_t v22 = *((void *)v19[2] + a9);
  if ([v21 count] >= v22) {
    [v21 removeObjectAtIndex:0];
  }
  [v21 addObject:v20];
  v23 = [v19 checkForMatch];

  objc_sync_exit(v19);

  return v23;
}

- (id)checkForMatch
{
  v3 = 0;
  do
  {
    id v7 = v3;
    BOOL v4 = [(ADStreamSync *)self checkOnceForMatch:&v7];
    id v5 = v7;

    v3 = v5;
  }
  while (v4);

  return v5;
}

- (BOOL)checkOnceForMatch:(id *)a3
{
  if ([(NSMutableArray *)self->_streamsHistory count])
  {
    uint64_t v5 = 0;
    while ([(ADStreamSync *)self streamContainsMinimalFrameCount:v5])
    {
      if (++v5 >= (unint64_t)[(NSMutableArray *)self->_streamsHistory count]) {
        goto LABEL_5;
      }
    }
    return 0;
  }
  else
  {
LABEL_5:
    if ([(NSMutableArray *)self->_streamsHistory count])
    {
      unint64_t v6 = 0;
      while ([(ADStreamSync *)self areOldestMatchingObjectsInAllowedInterval:v6])
      {
        [(ADStreamSync *)self oldestAverageTimestampForStream:v6];
        self->_matchedTimestampsArray[v6++] = v7;
        if (v6 >= [(NSMutableArray *)self->_streamsHistory count]) {
          goto LABEL_9;
        }
      }
      v21 = [(NSMutableArray *)self->_streamsHistory objectAtIndexedSubscript:v6];
      [v21 removeObjectAtIndex:0];

      return 1;
    }
    else
    {
LABEL_9:
      matchedTimestampsArray = self->_matchedTimestampsArray;
      unint64_t v9 = [(NSMutableArray *)self->_streamsHistory count];
      if (v9 >= 2)
      {
        unsigned int v11 = matchedTimestampsArray + 1;
        double v13 = matchedTimestampsArray[1];
        if (v13 >= *matchedTimestampsArray) {
          double v10 = matchedTimestampsArray;
        }
        else {
          double v10 = matchedTimestampsArray + 1;
        }
        if (v13 < *matchedTimestampsArray) {
          unsigned int v11 = matchedTimestampsArray;
        }
        if (v9 != 2)
        {
          v14 = matchedTimestampsArray + 2;
          if (v13 >= *matchedTimestampsArray) {
            double v13 = *matchedTimestampsArray;
          }
          v15 = matchedTimestampsArray + 3;
          uint64_t v16 = 8 * v9 - 24;
          while (1)
          {
            id v17 = v14;
            id v18 = v15 - 1;
            if (!v16) {
              break;
            }
            double v20 = *(v15 - 1);
            double v19 = *v15;
            if (*v15 >= v20)
            {
              if (v20 < v13)
              {
                double v13 = *(v15 - 1);
                double v10 = v15 - 1;
              }
              if (v19 >= *v11) {
                unsigned int v11 = matchedTimestampsArray + 3;
              }
            }
            else
            {
              double v13 = *v10;
              if (v19 < *v10)
              {
                double v13 = *v15;
                double v10 = v15;
              }
              if (v20 >= *v11) {
                unsigned int v11 = v15 - 1;
              }
            }
            v14 = v17 + 2;
            v15 += 2;
            v16 -= 16;
            matchedTimestampsArray = v17;
            if (v16 == -8) {
              goto LABEL_39;
            }
          }
          if (*v18 >= *v10)
          {
            if (*v18 >= *v11) {
              unsigned int v11 = v15 - 1;
            }
          }
          else
          {
            double v10 = v15 - 1;
          }
        }
      }
      else
      {
        double v10 = matchedTimestampsArray;
        unsigned int v11 = matchedTimestampsArray;
      }
LABEL_39:
      double allowedMatchTimeInterval = self->_allowedMatchTimeInterval;
      if (*v11 - *v10 >= allowedMatchTimeInterval)
      {
        double v24 = *v11 - allowedMatchTimeInterval;
        uint64_t v25 = ((unint64_t)((char *)v10 - (char *)self->_matchedTimestampsArray) >> 3);
        return [(ADStreamSync *)self dropOldFramesFromStream:v25 belowTimestampThreshold:v24];
      }
      else
      {
        id v23 = [(ADStreamSync *)self createAndPopulateMatch];
        BOOL result = 0;
        *a3 = v23;
      }
    }
  }
  return result;
}

- (BOOL)streamContainsMinimalFrameCount:(unint64_t)a3
{
  uint64_t v5 = -[NSMutableArray objectAtIndexedSubscript:](self->_streamsHistory, "objectAtIndexedSubscript:");
  LOBYTE(a3) = [v5 count] >= self->_aggregationCounts[a3];

  return a3;
}

- (id)createAndPopulateMatch
{
  v3 = objc_opt_new();
  BOOL v4 = objc_opt_new();
  [v3 setMatchedStreams:v4];

  for (unint64_t i = 0; i < [(NSMutableArray *)self->_streamsHistory count]; ++i)
  {
    unint64_t v6 = [(NSMutableArray *)self->_streamsHistory objectAtIndexedSubscript:i];
    unint64_t v7 = self->_aggregationCounts[i];
    unint64_t v8 = [MEMORY[0x263EFF980] arrayWithCapacity:v7];
    if (v7)
    {
      unsigned int v9 = 1;
      do
      {
        double v10 = [v6 objectAtIndexedSubscript:0];
        [v8 addObject:v10];

        [v6 removeObjectAtIndex:0];
      }
      while (v7 > v9++);
    }
    v12 = [v3 matchedStreams];
    [v12 addObject:v8];
  }

  return v3;
}

- (int64_t)setStream:(unint64_t)a3 queueSize:(unint64_t)a4
{
  return [(ADStreamSync *)self setStream:a3 queueSize:a4 aggregationCount:1 allowedAggregationInterval:0.0];
}

- (int64_t)setStream:(unint64_t)a3 queueSize:(unint64_t)a4 aggregationCount:(unint64_t)a5 allowedAggregationInterval:(double)a6
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_streamsHistory count] <= a3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [(NSMutableArray *)self->_streamsHistory count];
      int v13 = 134218240;
      unint64_t v14 = a3;
      __int16 v15 = 2048;
      uint64_t v16 = v12;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ADStreamSync cannot set stream %lu. only %lu streams supported", (uint8_t *)&v13, 0x16u);
    }
    return -22953;
  }
  else
  {
    int64_t result = 0;
    self->_allowedAggregationIntervals[a3] = a6;
    self->_historySizes[a3] = a4;
    self->_aggregationCounts[a3] = a5;
  }
  return result;
}

- (int64_t)reset
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_streamsHistory;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5++), "removeAllObjects", (void)v7);
      }
      while (v3 != v5);
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }

  return 0;
}

- (void).cxx_destruct
{
}

- (void)setAllowedMatchTimeInterval:(double)a3
{
  self->_double allowedMatchTimeInterval = a3;
}

- (double)allowedMatchTimeInterval
{
  return self->_allowedMatchTimeInterval;
}

- (BOOL)dropOldFramesFromStream:(unint64_t)a3 belowTimestampThreshold:(double)a4
{
  for (BOOL i = 0; ; BOOL i = 1)
  {
    long long v8 = [(NSMutableArray *)self->_streamsHistory objectAtIndexedSubscript:a3];
    if (![v8 count]) {
      break;
    }
    [(ADStreamSync *)self oldestAverageTimestampForStream:a3];
    double v10 = v9;

    if (v10 > a4) {
      return i;
    }
    unsigned int v11 = [(NSMutableArray *)self->_streamsHistory objectAtIndexedSubscript:a3];
    [v11 removeObjectAtIndex:0];
  }
  return i;
}

- (id)pushData:(void *)a1 streamIndex:(uint64_t)a2 timestamp:(uint64_t)a3 pose:(uint64_t)a4
{
  uint64_t v4 = objc_msgSend(a1, "pushData:streamIndex:timestamp:pose:calibration:meta:", a3, a4, 0, 0);

  return v4;
}

- (id)pushData:(void *)a1 streamIndex:(uint64_t)a2 timestamp:(uint64_t)a3 pose:(uint64_t)a4 calibration:(uint64_t)a5
{
  uint64_t v5 = objc_msgSend(a1, "pushData:streamIndex:timestamp:pose:calibration:meta:", a3, a4, a5, 0);

  return v5;
}

- (void)dealloc
{
  matchedTimestampsArray = self->_matchedTimestampsArray;
  if (matchedTimestampsArray) {
    MEMORY[0x24C570720](matchedTimestampsArray, 0x1000C8000313F17);
  }
  allowedAggregationIntervals = self->_allowedAggregationIntervals;
  if (allowedAggregationIntervals) {
    MEMORY[0x24C570720](allowedAggregationIntervals, 0x1000C8000313F17);
  }
  historySizes = self->_historySizes;
  if (historySizes) {
    MEMORY[0x24C570720](historySizes, 0x1000C8000313F17);
  }
  aggregationCounts = self->_aggregationCounts;
  if (aggregationCounts) {
    MEMORY[0x24C570720](aggregationCounts, 0x1000C8000313F17);
  }
  v7.receiver = self;
  v7.super_class = (Class)ADStreamSync;
  [(ADStreamSync *)&v7 dealloc];
}

@end