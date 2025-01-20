@interface HKMCAdjacentFlowAnalyzer
- ($0AC6E346AE4835514AAA8AC86D8F4844)flowDayIndexRange;
- (BOOL)isUnsuitableForRange;
- (HKMCAdjacentFlowAnalyzer)initWithFlowDayIndex:(int64_t)a3;
- (int64_t)flowDayIndex;
- (void)addNextAscendingDay:(id)a3 shouldStop:(BOOL *)a4;
- (void)addNextDescendingDay:(id)a3 shouldStop:(BOOL *)a4;
@end

@implementation HKMCAdjacentFlowAnalyzer

- (HKMCAdjacentFlowAnalyzer)initWithFlowDayIndex:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMCAdjacentFlowAnalyzer;
  result = [(HKMCAdjacentFlowAnalyzer *)&v5 init];
  if (result)
  {
    result->_flowDayIndex = a3;
    result->_futureFlowDay = a3;
    result->_pastFlowDay = a3;
  }
  return result;
}

- (void)addNextAscendingDay:(id)a3 shouldStop:(BOOL *)a4
{
  id v8 = a3;
  if ([v8 dayIndex] <= self->_futureFlowDay)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HKMCAdjacentFlowAnalyzer.m", 28, @"Invalid parameter not satisfying: %@", @"[adjacentDay dayIndex] > _futureFlowDay" object file lineNumber description];
  }
  if (self->_unsuitableForRange) {
    goto LABEL_4;
  }
  if (([v8 isFetched] & 1) == 0) {
    goto LABEL_9;
  }
  if ([v8 hasFlow])
  {
    self->_futureFlowDay = [v8 dayIndex];
LABEL_4:
    *a4 = 1;
    goto LABEL_10;
  }
  if (![v8 hasConfirmedNoFlow])
  {
    *a4 = 0;
  }
  else
  {
LABEL_9:
    *a4 = 1;
    self->_unsuitableForRange = 1;
  }
LABEL_10:
}

- (void)addNextDescendingDay:(id)a3 shouldStop:(BOOL *)a4
{
  id v8 = a3;
  if ([v8 dayIndex] >= self->_pastFlowDay)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HKMCAdjacentFlowAnalyzer.m", 50, @"Invalid parameter not satisfying: %@", @"[adjacentDay dayIndex] < _pastFlowDay" object file lineNumber description];
  }
  if (self->_unsuitableForRange) {
    goto LABEL_4;
  }
  if (([v8 isFetched] & 1) == 0) {
    goto LABEL_9;
  }
  if ([v8 hasFlow])
  {
    self->_pastFlowDay = [v8 dayIndex];
LABEL_4:
    *a4 = 1;
    goto LABEL_10;
  }
  if (![v8 hasConfirmedNoFlow])
  {
    *a4 = 0;
  }
  else
  {
LABEL_9:
    *a4 = 1;
    self->_unsuitableForRange = 1;
  }
LABEL_10:
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)flowDayIndexRange
{
  if (self->_unsuitableForRange)
  {
    int64_t flowDayIndex = self->_flowDayIndex;
    int64_t v3 = 1;
  }
  else
  {
    int64_t v4 = self->_flowDayIndex;
    int64_t futureFlowDay = self->_futureFlowDay;
    int64_t pastFlowDay = self->_pastFlowDay;
    uint64_t v7 = futureFlowDay - v4;
    if (futureFlowDay <= v4) {
      uint64_t v7 = 1;
    }
    uint64_t v8 = 1;
    BOOL v9 = futureFlowDay <= v4;
    if (futureFlowDay <= v4) {
      int64_t v10 = pastFlowDay + 1;
    }
    else {
      int64_t v10 = self->_flowDayIndex;
    }
    if (v9) {
      uint64_t v8 = v4 - pastFlowDay;
    }
    if (v4 > pastFlowDay) {
      int64_t flowDayIndex = v10;
    }
    else {
      int64_t flowDayIndex = self->_flowDayIndex;
    }
    if (v4 > pastFlowDay) {
      int64_t v3 = v8;
    }
    else {
      int64_t v3 = v7;
    }
  }
  result.var1 = v3;
  result.var0 = flowDayIndex;
  return result;
}

- (int64_t)flowDayIndex
{
  return self->_flowDayIndex;
}

- (BOOL)isUnsuitableForRange
{
  return self->_unsuitableForRange;
}

@end