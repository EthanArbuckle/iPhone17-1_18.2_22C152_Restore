@interface CLDeviceMotionProperties
- (CLDeviceMotionProperties)initWithMode:(int)a3;
- (id)description;
- (int)mode;
- (void)setMode:(int)a3;
@end

@implementation CLDeviceMotionProperties

- (int)mode
{
  return self->_mode;
}

- (id)description
{
  v2 = 0;
  int mode = self->_mode;
  if (mode > 14)
  {
    v5 = @"3AxisDynamicGyro";
    v6 = @"6AxisThrottledGyro";
    if (mode != 67) {
      v6 = 0;
    }
    if (mode != 34) {
      v5 = v6;
    }
    if (mode == 19) {
      v2 = @"BuildGYTT";
    }
    if (mode == 15) {
      v2 = @"9AxisWithNorthReference";
    }
    if (mode > 33) {
      v2 = v5;
    }
    return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"CLDeviceMotionProperties<DeviceMotion=%@>", v2);
  }
  else
  {
    switch(mode)
    {
      case 0:
        id result = (id)objc_msgSend_stringWithFormat_(NSString, a2, @"CLDeviceMotionProperties<DeviceMotion=%@>", @"Unknown");
        break;
      case 2:
        id result = (id)objc_msgSend_stringWithFormat_(NSString, a2, @"CLDeviceMotionProperties<DeviceMotion=%@>", @"GyroOnly");
        break;
      case 3:
        id result = (id)objc_msgSend_stringWithFormat_(NSString, a2, @"CLDeviceMotionProperties<DeviceMotion=%@>", @"6Axis");
        break;
      case 7:
        id result = (id)objc_msgSend_stringWithFormat_(NSString, a2, @"CLDeviceMotionProperties<DeviceMotion=%@>", @"9Axis");
        break;
      default:
        return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"CLDeviceMotionProperties<DeviceMotion=%@>", v2);
    }
  }
  return result;
}

- (CLDeviceMotionProperties)initWithMode:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLDeviceMotionProperties;
  id result = [(CLDeviceMotionProperties *)&v5 init];
  if (result) {
    result->_int mode = a3;
  }
  return result;
}

- (void)setMode:(int)a3
{
  self->_int mode = a3;
}

@end