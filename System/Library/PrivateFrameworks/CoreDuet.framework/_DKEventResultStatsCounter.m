@interface _DKEventResultStatsCounter
- (_DKEventStatsCounterInternal)internal;
- (id)eventName;
- (void)setInternal:(id)a3;
@end

@implementation _DKEventResultStatsCounter

- (id)eventName
{
  internal = self->_internal;
  if (internal) {
    return internal->_eventName;
  }
  else {
    return 0;
  }
}

- (_DKEventStatsCounterInternal)internal
{
  return (_DKEventStatsCounterInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternal:(id)a3
{
}

- (void).cxx_destruct
{
}

@end