@interface MPCReportingPlaybackActivityEvent
- (BOOL)isValidReportingEvent;
- (BOOL)shouldReportToStore;
- (ICPlayActivityEvent)playActivityEvent;
- (NSString)description;
- (unint64_t)reportingEventType;
- (void)setPlayActivityEvent:(id)a3;
- (void)setShouldReportToStore:(BOOL)a3;
@end

@implementation MPCReportingPlaybackActivityEvent

- (void).cxx_destruct
{
}

- (void)setShouldReportToStore:(BOOL)a3
{
  self->_shouldReportToStore = a3;
}

- (BOOL)shouldReportToStore
{
  return self->_shouldReportToStore;
}

- (void)setPlayActivityEvent:(id)a3
{
}

- (ICPlayActivityEvent)playActivityEvent
{
  return self->_playActivityEvent;
}

- (unint64_t)reportingEventType
{
  return 2;
}

- (BOOL)isValidReportingEvent
{
  return self->_playActivityEvent != 0;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  v7 = @"YES";
  if (!self->_shouldReportToStore) {
    v7 = @"NO";
  }
  v8 = [v3 stringWithFormat:@"<%@ %p shouldReportToStore:%@ playActivityEvent:%@>", v5, self, v7, self->_playActivityEvent];

  return (NSString *)v8;
}

@end