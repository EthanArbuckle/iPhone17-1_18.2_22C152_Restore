@interface CSThresholdedTrigger
- (BOOL)incrementAndCheckPerformActionForKey:(id)a3;
- (CSThresholdedTrigger)initWithCountThreshold:(int64_t)a3 timeInterval:(double)a4;
- (NSMutableDictionary)actionCounts;
- (NSMutableDictionary)lastActionDates;
- (double)timeInterval;
- (int64_t)countThreshold;
- (void)setActionCounts:(id)a3;
- (void)setCountThreshold:(int64_t)a3;
- (void)setLastActionDates:(id)a3;
- (void)setTimeInterval:(double)a3;
@end

@implementation CSThresholdedTrigger

- (BOOL)incrementAndCheckPerformActionForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_actionCounts objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5) {
    v7 = (char *)[v5 unsignedIntegerValue];
  }
  else {
    v7 = 0;
  }
  v8 = [(NSMutableDictionary *)self->_lastActionDates objectForKeyedSubscript:v4];
  v9 = +[NSDate date];
  v10 = [(NSMutableDictionary *)self->_lastActionDates objectForKeyedSubscript:v4];

  if (!v10) {
    [(NSMutableDictionary *)self->_lastActionDates setObject:v9 forKeyedSubscript:v4];
  }
  if ((unint64_t)v7 >= self->_countThreshold
    || v8
    && ([v9 timeIntervalSinceDate:v8],
        double v12 = v11,
        [(CSThresholdedTrigger *)self timeInterval],
        v12 >= v13))
  {
    [(NSMutableDictionary *)self->_actionCounts setObject:0 forKeyedSubscript:v4];
    [(NSMutableDictionary *)self->_lastActionDates setObject:v9 forKeyedSubscript:v4];
    BOOL v15 = 1;
  }
  else
  {
    v14 = +[NSNumber numberWithUnsignedInteger:v7 + 1];
    [(NSMutableDictionary *)self->_actionCounts setObject:v14 forKeyedSubscript:v4];

    BOOL v15 = 0;
  }

  return v15;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (CSThresholdedTrigger)initWithCountThreshold:(int64_t)a3 timeInterval:(double)a4
{
  v13.receiver = self;
  v13.super_class = (Class)CSThresholdedTrigger;
  v6 = [(CSThresholdedTrigger *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_countThreshold = a3;
    v6->_timeInterval = a4;
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    actionCounts = v7->_actionCounts;
    v7->_actionCounts = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    lastActionDates = v7->_lastActionDates;
    v7->_lastActionDates = v10;
  }
  return v7;
}

- (int64_t)countThreshold
{
  return self->_countThreshold;
}

- (void)setCountThreshold:(int64_t)a3
{
  self->_countThreshold = a3;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

- (NSMutableDictionary)actionCounts
{
  return self->_actionCounts;
}

- (void)setActionCounts:(id)a3
{
}

- (NSMutableDictionary)lastActionDates
{
  return self->_lastActionDates;
}

- (void)setLastActionDates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActionDates, 0);

  objc_storeStrong((id *)&self->_actionCounts, 0);
}

@end