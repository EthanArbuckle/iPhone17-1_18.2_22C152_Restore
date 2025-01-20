@interface MultiTouchHelper
- (BOOL)isBatteryCharging;
- (BOOL)isPowerConnected;
- (id)celsiusTemperatureFromService:(__IOHIDServiceClient *)a3;
- (id)parseHIDLocationID:(int)a3;
- (id)temperatureData;
@end

@implementation MultiTouchHelper

- (id)temperatureData
{
  v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = IOHIDEventSystemClientCreate();
  if (v4)
  {
    v5 = (__IOHIDEventSystemClient *)v4;
    v18[0] = @"PrimaryUsagePage";
    v18[1] = @"PrimaryUsage";
    v19[0] = &off_100008668;
    v19[1] = &off_100008680;
    v6 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    IOHIDEventSystemClientSetMatching();
    CFArrayRef v7 = IOHIDEventSystemClientCopyServices(v5);
    if (v7)
    {
      CFArrayRef v8 = v7;
      if (CFArrayGetCount(v7) >= 1)
      {
        CFIndex v9 = 0;
        do
        {
          ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v8, v9);
          CFNumberRef v11 = (const __CFNumber *)IOHIDServiceClientCopyProperty(ValueAtIndex, @"LocationID");
          if (v11)
          {
            CFNumberRef v12 = v11;
            int valuePtr = 0;
            int Value = CFNumberGetValue(v11, kCFNumberSInt32Type, &valuePtr);
            CFRelease(v12);
            if (Value)
            {
              if (valuePtr != -1)
              {
                v14 = -[MultiTouchHelper parseHIDLocationID:](self, "parseHIDLocationID:");
                v15 = [(MultiTouchHelper *)self celsiusTemperatureFromService:ValueAtIndex];
                [v3 setObject:v15 forKeyedSubscript:v14];
              }
            }
          }
          ++v9;
        }
        while (CFArrayGetCount(v8) > v9);
      }
      CFRelease(v8);
    }
    CFRelease(v5);
  }

  return v3;
}

- (id)parseHIDLocationID:(int)a3
{
  if (a3 < 0 || (_DefaultRuneLocale.__runetype[HIBYTE(a3)] & 0x200) != 0) {
    +[NSString stringWithFormat:@"%3ld ", a3, v5, v6, v7];
  }
  else {
  v3 = +[NSString stringWithFormat:@"%c%c%c%c", HIBYTE(a3), BYTE2(a3), BYTE1(a3), a3];
  }

  return v3;
}

- (id)celsiusTemperatureFromService:(__IOHIDServiceClient *)a3
{
  uint64_t v3 = IOHIDServiceClientCopyEvent();
  if (v3)
  {
    uint64_t v4 = (const void *)v3;
    IOHIDEventGetFloatValue();
    double v6 = v5;
    CFRelease(v4);
    +[NSNumber numberWithDouble:v6];
  }
  else
  {
    +[NSNull null];
  uint64_t v7 = };

  return v7;
}

- (BOOL)isBatteryCharging
{
  return _MGGetBoolAnswer(@"BatteryIsCharging", a2);
}

- (BOOL)isPowerConnected
{
  return _MGGetBoolAnswer(@"ExternalPowerSourceConnected", a2);
}

@end