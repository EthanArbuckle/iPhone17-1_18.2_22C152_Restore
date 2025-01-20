@interface DSThermalLogLine
- (BOOL)isTrapEntry;
- (BOOL)isTrapEvent;
- (DSThermalLogLine)initWithLogLine:(id)a3;
- (NSString)eventType;
- (NSString)reason;
- (float)maxTemp;
- (void)setEventType:(id)a3;
- (void)setMaxTemp:(float)a3;
@end

@implementation DSThermalLogLine

- (DSThermalLogLine)initWithLogLine:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)DSThermalLogLine;
  v3 = [(DSLogLine *)&v13 initWithLogLine:a3];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(DSLogLine *)v3 type];
    eventType = v4->_eventType;
    v4->_eventType = (NSString *)v5;

    [(DSLogLine *)v4 setType:@"Thermal"];
    v7 = [(DSLogLine *)v4 fields];
    uint64_t v8 = [v7 count] - 1;

    if ([(DSThermalLogLine *)v4 isTrapEvent])
    {
      v9 = [(DSLogLine *)v4 fields];
      id v10 = [v9 count];

      if ((unint64_t)v10 >= 4) {
        v4->_reason = (NSString *)[(DSLogLine *)v4 stringFromFieldAtIndex:2];
      }
    }
    float v11 = (double)[(DSLogLine *)v4 integerFromFieldAtIndex:v8] / 100.0;
    v4->_maxTemp = v11;
  }
  return v4;
}

- (BOOL)isTrapEvent
{
  v3 = [(DSThermalLogLine *)self eventType];
  if ([v3 isEqualToString:@"ThermalUIAlertEnter"])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    uint64_t v5 = [(DSThermalLogLine *)self eventType];
    unsigned __int8 v4 = [v5 isEqualToString:@"ThermalUIAlertExit"];
  }
  return v4;
}

- (BOOL)isTrapEntry
{
  v2 = [(DSThermalLogLine *)self eventType];
  unsigned __int8 v3 = [v2 isEqualToString:@"ThermalUIAlertEnter"];

  return v3;
}

- (float)maxTemp
{
  return self->_maxTemp;
}

- (void)setMaxTemp:(float)a3
{
  self->_maxTemp = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end