@interface _DKEventStatsTimerCounter
+ (id)counterInCollection:(void *)a3 withEventName:;
- (_DKEventStatsCounterInternal)internal;
- (id)eventName;
- (uint64_t)addTimingWithStartDate:(void *)a3 endDate:;
- (uint64_t)addTimingWithTimeInterval:(uint64_t)result;
- (void)setInternal:(id)a3;
@end

@implementation _DKEventStatsTimerCounter

+ (id)counterInCollection:(void *)a3 withEventName:
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = self;
  v7 = +[_DKEventStatsCollection counterWithClass:collectionName:eventName:eventType:eventTypePossibleValues:hasResult:scalar:]((uint64_t)_DKEventStatsCollection, v6, v5, v4, 0, 0, 0, 0);

  return v7;
}

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

- (uint64_t)addTimingWithTimeInterval:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    result = -[_DKEventStatsCounterInternal incrementCountByNumber:typeValue:success:](*(void *)(result + 8), 1, 0, 0);
    if ((_DKEventStatsLogExternally & 1) == 0)
    {
      id Property = *(id *)(v3 + 8);
      if (Property) {
        id Property = objc_getProperty(Property, v4, 64, 1);
      }
      uint64_t v6 = MEMORY[0x1E4F1CBF0];
      return [Property trackEventWithPropertyValues:v6 value:a2];
    }
  }
  return result;
}

- (uint64_t)addTimingWithStartDate:(void *)a3 endDate:
{
  if (result)
  {
    uint64_t v3 = result;
    [a3 timeIntervalSinceDate:a2];
    return -[_DKEventStatsTimerCounter addTimingWithTimeInterval:](v3, v4);
  }
  return result;
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