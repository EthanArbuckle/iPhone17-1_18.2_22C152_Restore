@interface HMDRemoteEventRouterClientRetryIntervals
+ (id)retryIntervalsForResidentClient;
- (HMDRemoteEventRouterClientRetryIntervals)init;
- (HMDRemoteEventRouterClientRetryIntervals)initWithIntervals:(id)a3;
- (NSArray)intervals;
- (double)nextInterval;
- (int64_t)currentIndex;
- (void)reset;
- (void)setCurrentIndex:(int64_t)a3;
@end

@implementation HMDRemoteEventRouterClientRetryIntervals

- (void).cxx_destruct
{
}

- (void)setCurrentIndex:(int64_t)a3
{
  self->_currentIndex = a3;
}

- (int64_t)currentIndex
{
  return self->_currentIndex;
}

- (NSArray)intervals
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)reset
{
}

- (double)nextInterval
{
  v3 = [(HMDRemoteEventRouterClientRetryIntervals *)self intervals];
  v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", -[HMDRemoteEventRouterClientRetryIntervals currentIndex](self, "currentIndex"));
  [v4 doubleValue];
  double v6 = v5;

  unint64_t v7 = [(HMDRemoteEventRouterClientRetryIntervals *)self currentIndex];
  v8 = [(HMDRemoteEventRouterClientRetryIntervals *)self intervals];
  unint64_t v9 = [v8 count] - 1;

  if (v7 < v9) {
    [(HMDRemoteEventRouterClientRetryIntervals *)self setCurrentIndex:[(HMDRemoteEventRouterClientRetryIntervals *)self currentIndex] + 1];
  }
  return v6;
}

- (HMDRemoteEventRouterClientRetryIntervals)initWithIntervals:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDRemoteEventRouterClientRetryIntervals;
  double v5 = [(HMDRemoteEventRouterClientRetryIntervals *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    intervals = v5->_intervals;
    v5->_intervals = (NSArray *)v6;
  }
  return v5;
}

- (HMDRemoteEventRouterClientRetryIntervals)init
{
  return [(HMDRemoteEventRouterClientRetryIntervals *)self initWithIntervals:&unk_26E473D68];
}

+ (id)retryIntervalsForResidentClient
{
  v2 = [[HMDRemoteEventRouterClientRetryIntervals alloc] initWithIntervals:&unk_26E473D80];
  return v2;
}

@end