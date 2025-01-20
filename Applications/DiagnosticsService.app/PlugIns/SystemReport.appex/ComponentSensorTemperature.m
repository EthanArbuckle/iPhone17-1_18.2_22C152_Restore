@interface ComponentSensorTemperature
- (BOOL)isPresent;
- (BOOL)systemClientSetup;
- (__IOHIDEventSystemClient)HIDEventSystem;
- (id)celsiusTemperatureFromService:(__IOHIDServiceClient *)a3;
- (id)parseHIDLocationID:(int)a3;
- (id)temperatureData;
- (void)populateAttributes:(id)a3;
- (void)setHIDEventSystem:(__IOHIDEventSystemClient *)a3;
- (void)systemClientRelease;
@end

@implementation ComponentSensorTemperature

- (BOOL)isPresent
{
  if (![(ComponentSensorTemperature *)self systemClientSetup]) {
    return 0;
  }
  CFArrayRef v3 = IOHIDEventSystemClientCopyServices([(ComponentSensorTemperature *)self HIDEventSystem]);
  BOOL v4 = v3 != 0;
  if (v3) {
    CFRelease(v3);
  }
  [(ComponentSensorTemperature *)self systemClientRelease];
  return v4;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(ComponentSensorTemperature *)self temperatureData];
  [v4 addEntriesFromDictionary:v5];
}

- (__IOHIDEventSystemClient)HIDEventSystem
{
  result = self->_HIDEventSystem;
  if (!result)
  {
    result = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    self->_HIDEventSystem = result;
    if (!result)
    {
      id v4 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v5 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[ERROR] - Could not create HID event system.", v5, 2u);
      }

      return self->_HIDEventSystem;
    }
  }
  return result;
}

- (BOOL)systemClientSetup
{
  CFArrayRef v3 = [(ComponentSensorTemperature *)self HIDEventSystem];
  if (v3)
  {
    v6[0] = @"PrimaryUsagePage";
    v6[1] = @"PrimaryUsage";
    v7[0] = &off_1000B7438;
    v7[1] = &off_1000B7450;
    id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
    [(ComponentSensorTemperature *)self HIDEventSystem];
    IOHIDEventSystemClientSetMatching();
  }
  return v3 != 0;
}

- (void)systemClientRelease
{
  if ([(ComponentSensorTemperature *)self HIDEventSystem])
  {
    CFRelease([(ComponentSensorTemperature *)self HIDEventSystem]);
    [(ComponentSensorTemperature *)self setHIDEventSystem:0];
  }
}

- (id)parseHIDLocationID:(int)a3
{
  if (a3 < 0 || (_DefaultRuneLocale.__runetype[HIBYTE(a3)] & 0x200) != 0) {
    +[NSString stringWithFormat:@"%3ld ", a3, v5, v6, v7];
  }
  else {
  CFArrayRef v3 = +[NSString stringWithFormat:@"%c%c%c%c", HIBYTE(a3), BYTE2(a3), BYTE1(a3), a3];
  }

  return v3;
}

- (id)celsiusTemperatureFromService:(__IOHIDServiceClient *)a3
{
  CFArrayRef v3 = (void *)IOHIDServiceClientCopyEvent();
  if (v3)
  {
    id v4 = v3;
    IOHIDEventGetFloatValue();
    double v6 = v5;
    CFRelease(v4);
    CFArrayRef v3 = +[NSNumber numberWithDouble:v6];
  }

  return v3;
}

- (id)temperatureData
{
  CFArrayRef v3 = +[NSMutableDictionary dictionary];
  if ([(ComponentSensorTemperature *)self systemClientSetup])
  {
    CFArrayRef v4 = IOHIDEventSystemClientCopyServices([(ComponentSensorTemperature *)self HIDEventSystem]);
    if (v4)
    {
      CFArrayRef v5 = v4;
      if (CFArrayGetCount(v4) >= 1)
      {
        CFIndex v6 = 0;
        do
        {
          ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v5, v6);
          CFNumberRef v8 = (const __CFNumber *)IOHIDServiceClientCopyProperty(ValueAtIndex, @"LocationID");
          if (v8)
          {
            CFNumberRef v9 = v8;
            int valuePtr = 0;
            int Value = CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
            CFRelease(v9);
            if (Value)
            {
              if (valuePtr != -1)
              {
                v11 = -[ComponentSensorTemperature parseHIDLocationID:](self, "parseHIDLocationID:");
                v12 = [(ComponentSensorTemperature *)self celsiusTemperatureFromService:ValueAtIndex];
                if (v12) {
                  [v3 setObject:v12 forKeyedSubscript:v11];
                }
              }
            }
          }
          ++v6;
        }
        while (CFArrayGetCount(v5) > v6);
      }
      CFRelease(v5);
    }
    [(ComponentSensorTemperature *)self systemClientRelease];
  }

  return v3;
}

- (void)setHIDEventSystem:(__IOHIDEventSystemClient *)a3
{
  self->_HIDEventSystem = a3;
}

@end