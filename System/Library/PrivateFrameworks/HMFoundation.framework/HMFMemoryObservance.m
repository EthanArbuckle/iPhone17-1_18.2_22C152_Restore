@interface HMFMemoryObservance
- (HMFMemoryObservance)initWithDebounceInterval:(double)a3 events:(id)a4;
- (NSDate)lastUpdateDate;
- (NSSet)events;
- (double)debounceInterval;
- (void)setLastUpdateDate:(id)a3;
@end

@implementation HMFMemoryObservance

- (HMFMemoryObservance)initWithDebounceInterval:(double)a3 events:(id)a4
{
  id v6 = a4;
  if (!v6) {
    _HMFPreconditionFailure(@"events");
  }
  v7 = v6;
  v15.receiver = self;
  v15.super_class = (Class)HMFMemoryObservance;
  v8 = [(HMFMemoryObservance *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_debounceInterval = a3;
    uint64_t v10 = [v7 copy];
    events = v9->_events;
    v9->_events = (NSSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1C9C8] distantPast];
    lastUpdateDate = v9->_lastUpdateDate;
    v9->_lastUpdateDate = (NSDate *)v12;
  }
  return v9;
}

- (double)debounceInterval
{
  return self->_debounceInterval;
}

- (NSSet)events
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)lastUpdateDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastUpdateDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end