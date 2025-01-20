@interface DAChamberSensorEvent
- (BOOL)isEqual:(id)a3;
- (DAChamberSensorEvent)initWithSensorType:(int)a3 eventType:(int)a4;
- (id)description;
- (int)eventType;
- (int)sensorType;
- (unint64_t)hash;
- (void)setEventType:(int)a3;
- (void)setSensorType:(int)a3;
@end

@implementation DAChamberSensorEvent

- (DAChamberSensorEvent)initWithSensorType:(int)a3 eventType:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DAChamberSensorEvent;
  result = [(DAChamberSensorEvent *)&v7 init];
  if (result)
  {
    result->_sensorType = a3;
    result->_eventType = a4;
  }
  return result;
}

- (unint64_t)hash
{
  unsigned int v3 = [(DAChamberSensorEvent *)self sensorType];
  if (v3)
  {
    if (v3 == 1)
    {
      v4 = @"kDAChamberWifiSensor";
    }
    else
    {
      +[NSException raise:NSGenericException format:@"Unexpected DAChamberSensorType."];
      v4 = 0;
    }
  }
  else
  {
    v4 = @"kDAChamberALSSensor";
  }
  unint64_t v5 = (unint64_t)[(__CFString *)v4 hash];
  v6 = sensorEventTypeToString([(DAChamberSensorEvent *)self eventType]);
  unint64_t v7 = (unint64_t)[v6 hash] ^ v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DAChamberSensorEvent *)a3;
  unint64_t v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  if (self == v4)
  {
    BOOL v8 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (unsigned int v6 = [(DAChamberSensorEvent *)self sensorType],
        v6 == [(DAChamberSensorEvent *)v5 sensorType]))
  {
    unsigned int v7 = [(DAChamberSensorEvent *)self eventType];
    BOOL v8 = v7 == [(DAChamberSensorEvent *)v5 eventType];
  }
  else
  {
LABEL_6:
    BOOL v8 = 0;
  }
LABEL_8:

  return v8;
}

- (id)description
{
  unsigned int v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  unsigned int v5 = [(DAChamberSensorEvent *)self sensorType];
  if (v5)
  {
    if (v5 == 1)
    {
      CFStringRef v6 = @"kDAChamberWifiSensor";
    }
    else
    {
      +[NSException raise:NSGenericException format:@"Unexpected DAChamberSensorType."];
      CFStringRef v6 = 0;
    }
  }
  else
  {
    CFStringRef v6 = @"kDAChamberALSSensor";
  }
  unsigned int v7 = sensorEventTypeToString([(DAChamberSensorEvent *)self eventType]);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@; %p:\n{ sensorType: %@\neventType: %@ }>",
    v4,
    self,
    v6,
  BOOL v8 = v7);

  return v8;
}

- (int)sensorType
{
  return self->_sensorType;
}

- (void)setSensorType:(int)a3
{
  self->_sensorType = a3;
}

- (int)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int)a3
{
  self->_eventType = a3;
}

@end