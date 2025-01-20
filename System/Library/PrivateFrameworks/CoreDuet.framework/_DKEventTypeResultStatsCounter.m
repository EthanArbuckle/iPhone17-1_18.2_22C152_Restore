@interface _DKEventTypeResultStatsCounter
+ (id)counterInCollection:(void *)a3 withEventName:(void *)a4 eventType:(void *)a5 eventTypePossibleValues:;
- (_DKEventStatsCounterInternal)internal;
- (id)eventName;
- (id)eventType;
- (id)typeValues;
- (void)incrementCountWithTypeValue:(unsigned int)a3 success:;
- (void)setInternal:(id)a3;
@end

@implementation _DKEventTypeResultStatsCounter

+ (id)counterInCollection:(void *)a3 withEventName:(void *)a4 eventType:(void *)a5 eventTypePossibleValues:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  uint64_t v12 = self;
  v13 = +[_DKEventStatsCollection counterWithClass:collectionName:eventName:eventType:eventTypePossibleValues:hasResult:scalar:]((uint64_t)_DKEventStatsCollection, v12, v11, v10, v9, v8, 1, 1);

  return v13;
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

- (id)eventType
{
  internal = self->_internal;
  if (internal) {
    return internal->_eventType;
  }
  else {
    return 0;
  }
}

- (id)typeValues
{
  internal = self->_internal;
  if (internal) {
    return internal->_typeValues;
  }
  else {
    return 0;
  }
}

- (void)incrementCountWithTypeValue:(unsigned int)a3 success:
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    -[_DKEventStatsCounterInternal incrementCountByNumber:typeValue:success:](*(void *)(a1 + 8), 1, v5, a3);
    if ((_DKEventStatsLogExternally & 1) == 0)
    {
      id Property = *(id *)(a1 + 8);
      if (Property) {
        id Property = objc_getProperty(Property, v6, 64, 1);
      }
      id v8 = @"false";
      if (a3) {
        id v8 = @"true";
      }
      v12[0] = v5;
      v12[1] = v8;
      id v9 = (void *)MEMORY[0x1E4F1C978];
      id v10 = Property;
      id v11 = [v9 arrayWithObjects:v12 count:2];
      [v10 trackEventWithPropertyValues:v11 value:1];
    }
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