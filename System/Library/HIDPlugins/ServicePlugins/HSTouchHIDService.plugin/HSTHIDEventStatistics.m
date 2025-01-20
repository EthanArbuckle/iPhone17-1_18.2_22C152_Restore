@interface HSTHIDEventStatistics
- (HSTHIDEventStatistics)init;
- (id)stats;
- (void)_doUpdateStat:(id)a3;
- (void)_drainCurrentWindow;
- (void)handleHIDEvents:(id)a3;
@end

@implementation HSTHIDEventStatistics

- (HSTHIDEventStatistics)init
{
  v7.receiver = self;
  v7.super_class = (Class)HSTHIDEventStatistics;
  v2 = [(HSTHIDEventStatistics *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    *((void *)v2 + 25) = 0;
    *(_OWORD *)(v2 + 184) = 0u;
    *(_OWORD *)(v2 + 168) = 0u;
    *(_OWORD *)(v2 + 152) = 0u;
    *(_OWORD *)(v2 + 136) = 0u;
    *(_OWORD *)(v2 + 120) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    v5 = v2;
  }

  return (HSTHIDEventStatistics *)v2;
}

- (void)_drainCurrentWindow
{
  if (self->_currentStatsWindow)
  {
    uint64_t v3 = 0;
    eventCount = self->_eventCount;
    do
    {
      if (eventCount[v3] >= 1)
      {
        v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
        currentStatsWindow = self->_currentStatsWindow;
        objc_super v7 = +[NSString stringWithUTF8String:IOHIDEventGetTypeString()];
        [(NSMutableDictionary *)currentStatsWindow setObject:v5 forKeyedSubscript:v7];
      }
      ++v3;
    }
    while (v3 != 43);
    v8 = +[NSNumber numberWithInt:self->_totalCount];
    [(NSMutableDictionary *)self->_currentStatsWindow setObject:v8 forKeyedSubscript:@"totalCount"];

    if ((unint64_t)[(NSMutableArray *)self->_eventStats count] >= 0x32)
    {
      do
        [(NSMutableArray *)self->_eventStats removeObjectAtIndex:0];
      while ((unint64_t)[(NSMutableArray *)self->_eventStats count] > 0x31);
    }
    [(NSMutableArray *)self->_eventStats addObject:self->_currentStatsWindow];
    v9 = self->_currentStatsWindow;
    self->_currentStatsWindow = 0;

    *((_OWORD *)eventCount + 9) = 0u;
    *((_OWORD *)eventCount + 10) = 0u;
    *((_OWORD *)eventCount + 7) = 0u;
    *((_OWORD *)eventCount + 8) = 0u;
    *((_OWORD *)eventCount + 5) = 0u;
    *((_OWORD *)eventCount + 6) = 0u;
    *((_OWORD *)eventCount + 3) = 0u;
    *((_OWORD *)eventCount + 4) = 0u;
    *((_OWORD *)eventCount + 1) = 0u;
    *((_OWORD *)eventCount + 2) = 0u;
    *(_OWORD *)eventCount = 0u;
  }
}

- (void)handleHIDEvents:(id)a3
{
  v16 = a3;
  v5 = (id *)v16[1];
  for (i = (id *)v16[2]; v5 != i; ++v5)
  {
    id v6 = *v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      unint64_t v8 = HSUtil::NanosecondsFromMachTime((HSUtil *)objc_msgSend(v7, "timestamp", v16));
      int64_t v9 = v8;
      int64_t currentWindowStartTime = self->_currentWindowStartTime;
      if (currentWindowStartTime && v8 > currentWindowStartTime + 10000000000) {
        [(HSTHIDEventStatistics *)self _drainCurrentWindow];
      }
      if (!self->_currentStatsWindow)
      {
        v11 = (NSMutableDictionary *)objc_opt_new();
        currentStatsWindow = self->_currentStatsWindow;
        self->_currentStatsWindow = v11;

        *(_OWORD *)v18 = 0u;
        long long v19 = 0u;
        time_t v17 = 0xAAAAAAAAAAAAAAAALL;
        time_t v17 = time(0);
        v13 = +[NSNumber numberWithLong:v17];
        [(NSMutableDictionary *)self->_currentStatsWindow setObject:v13 forKeyedSubscript:@"startTimeSinceEpoch"];

        v14 = localtime(&v17);
        if (v14) {
          strftime(v18, 0x20uLL, "%Y-%m-%d %H:%M:%S %z", v14);
        }
        v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v18, v14);
        [(NSMutableDictionary *)self->_currentStatsWindow setObject:v15 forKeyedSubscript:@"startTime"];

        self->_int64_t currentWindowStartTime = v9;
      }
      ++self->_totalCount;
      [(HSTHIDEventStatistics *)self _doUpdateStat:v7];
    }
  }
}

- (void)_doUpdateStat:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 type];
  ++self->_eventCount[v5];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = objc_msgSend(v4, "children", 0);
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      int64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [(HSTHIDEventStatistics *)self _doUpdateStat:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
        int64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)stats
{
  [(HSTHIDEventStatistics *)self _drainCurrentWindow];
  self->_int64_t currentWindowStartTime = 0;
  eventStats = self->_eventStats;

  return eventStats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStatsWindow, 0);

  objc_storeStrong((id *)&self->_eventStats, 0);
}

@end