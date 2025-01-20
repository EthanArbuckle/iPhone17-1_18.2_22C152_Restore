@interface GCDeviceBattery
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GCDeviceBattery)initWithCoder:(id)a3;
- (GCDeviceBattery)initWithLevel:(float)a3 batteryState:(int64_t)a4;
- (GCDeviceBattery)initWithLevel:(unsigned __int8)a3 isCharging:(BOOL)a4;
- (GCDeviceBatteryState)batteryState;
- (float)batteryLevel;
- (id)description;
- (unint64_t)hash;
- (void)_setBatteryLevel:(float)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBatteryLevel:(float)a3;
- (void)setBatteryState:(int64_t)a3;
@end

@implementation GCDeviceBattery

- (GCDeviceBattery)initWithLevel:(float)a3 batteryState:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)GCDeviceBattery;
  v6 = [(GCDeviceBattery *)&v10 init];
  v8 = v6;
  if (v6)
  {
    *(float *)&double v7 = a3;
    [(GCDeviceBattery *)v6 _setBatteryLevel:v7];
    [(GCDeviceBattery *)v8 _setBatteryState:a4];
  }
  return v8;
}

- (GCDeviceBattery)initWithLevel:(unsigned __int8)a3 isCharging:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GCDeviceBattery;
  v6 = [(GCDeviceBattery *)&v13 init];
  v8 = v6;
  if (v6)
  {
    *(float *)&double v7 = (float)v5 / 100.0;
    [(GCDeviceBattery *)v6 _setBatteryLevel:v7];
    float batteryLevel = v8->_batteryLevel;
    if (batteryLevel >= 1.0 && !v4)
    {
      uint64_t v11 = 2;
    }
    else if (batteryLevel <= 0.0)
    {
      uint64_t v11 = -1;
    }
    else
    {
      uint64_t v11 = v4;
    }
    [(GCDeviceBattery *)v8 _setBatteryState:v11];
  }
  return v8;
}

- (void)_setBatteryLevel:(float)a3
{
  double v3 = fmin(fmax(a3, 0.0), 1.0);
  *(float *)&double v3 = v3;
  [(GCDeviceBattery *)self setBatteryLevel:v3];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ - battery=%2.1f, state=%d>", objc_opt_class(), self->_batteryLevel, self->_batteryState];
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (GCDeviceBattery *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)GCDeviceBattery;
    if ([(GCDeviceBattery *)&v11 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      unsigned int v5 = v4;
      int64_t batteryState = self->_batteryState;
      if (batteryState == [(GCDeviceBattery *)v5 batteryState])
      {
        float batteryLevel = self->_batteryLevel;
        [(GCDeviceBattery *)v5 batteryLevel];
        BOOL v9 = batteryLevel == v8;
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)GCDeviceBattery;
  return [(GCDeviceBattery *)&v3 hash];
}

- (float)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(float)a3
{
  self->_float batteryLevel = a3;
}

- (GCDeviceBatteryState)batteryState
{
  return self->_batteryState;
}

- (void)setBatteryState:(int64_t)a3
{
  self->_int64_t batteryState = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDeviceBattery)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GCDeviceBattery;
  unsigned int v5 = [(GCDeviceBattery *)&v8 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"batteryLevel"];
    v5->_float batteryLevel = v6;
    v5->_int64_t batteryState = (int)[v4 decodeIntForKey:@"batteryState"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  float batteryLevel = self->_batteryLevel;
  id v6 = a3;
  *(float *)&double v5 = batteryLevel;
  [v6 encodeFloat:@"batteryLevel" forKey:v5];
  [v6 encodeInt:LODWORD(self->_batteryState) forKey:@"batteryState"];
}

@end