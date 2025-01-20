@interface DATouchButtonTargetEvent
- (BOOL)performHapticOnEvent;
- (DAStateRange)range;
- (DATouchButtonTargetEvent)initWithDictionary:(id)a3;
- (NSNumber)value;
- (int64_t)eventType;
- (void)setEventType:(int64_t)a3;
- (void)setPerformHapticOnEvent:(BOOL)a3;
- (void)setRange:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation DATouchButtonTargetEvent

- (DATouchButtonTargetEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  char v13 = 0;
  v12.receiver = self;
  v12.super_class = (Class)DATouchButtonTargetEvent;
  v5 = [(DASpecification *)&v12 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 dk_numberFromRequiredKey:@"eventType" lowerBound:&off_100011118 upperBound:&off_100011148 failed:&v13];
    v5->_eventType = (int64_t)[v6 integerValue];

    uint64_t v7 = [v4 dk_numberFromRequiredKey:@"value" lowerBound:&off_100011160 upperBound:&off_100011178 failed:&v13];
    value = v5->_value;
    v5->_value = (NSNumber *)v7;

    v5->_performHapticOnEvent = [v4 dk_BOOLFromKey:@"performHapticOnEvent" defaultValue:0 failed:&v13];
    v9 = [[DAStateRange alloc] initWithDictionary:v4];
    range = v5->_range;
    v5->_range = v9;

    if (v13)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (BOOL)performHapticOnEvent
{
  return self->_performHapticOnEvent;
}

- (void)setPerformHapticOnEvent:(BOOL)a3
{
  self->_performHapticOnEvent = a3;
}

- (DAStateRange)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_range, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end