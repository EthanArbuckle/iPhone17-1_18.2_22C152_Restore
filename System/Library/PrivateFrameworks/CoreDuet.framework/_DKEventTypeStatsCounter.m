@interface _DKEventTypeStatsCounter
+ (id)counterInCollection:(void *)a3 withEventName:(void *)a4 eventType:(void *)a5 eventTypePossibleValues:;
- (_DKEventStatsCounterInternal)internal;
- (id)eventName;
- (id)eventType;
- (id)typeValues;
- (void)incrementCountByNumber:(void *)a3 typeValue:;
- (void)incrementCountWithTypeValue:(uint64_t)a1;
- (void)setInternal:(id)a3;
@end

@implementation _DKEventTypeStatsCounter

+ (id)counterInCollection:(void *)a3 withEventName:(void *)a4 eventType:(void *)a5 eventTypePossibleValues:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  uint64_t v12 = self;
  v13 = +[_DKEventStatsCollection counterWithClass:collectionName:eventName:eventType:eventTypePossibleValues:hasResult:scalar:]((uint64_t)_DKEventStatsCollection, v12, v11, v10, v9, v8, 0, 1);

  return v13;
}

- (void)incrementCountWithTypeValue:(uint64_t)a1
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    -[_DKEventStatsCounterInternal incrementCountByNumber:typeValue:success:](*(void *)(a1 + 8), 1, v3, 0);
    if ((_DKEventStatsLogExternally & 1) == 0)
    {
      id Property = *(id *)(a1 + 8);
      if (Property) {
        id Property = objc_getProperty(Property, v4, 64, 1);
      }
      id v9 = v3;
      v6 = (void *)MEMORY[0x1E4F1C978];
      id v7 = Property;
      id v8 = [v6 arrayWithObjects:&v9 count:1];
      objc_msgSend(v7, "trackEventWithPropertyValues:value:", v8, 1, v9, v10);
    }
  }
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

- (void)incrementCountByNumber:(void *)a3 typeValue:
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    -[_DKEventStatsCounterInternal incrementCountByNumber:typeValue:success:](*(void *)(a1 + 8), a2, v5, 0);
    if ((_DKEventStatsLogExternally & 1) == 0)
    {
      id Property = *(id *)(a1 + 8);
      if (Property) {
        id Property = objc_getProperty(Property, v6, 64, 1);
      }
      id v11 = v5;
      id v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = Property;
      uint64_t v10 = [v8 arrayWithObjects:&v11 count:1];
      objc_msgSend(v9, "trackEventWithPropertyValues:value:", v10, a2, v11, v12);
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