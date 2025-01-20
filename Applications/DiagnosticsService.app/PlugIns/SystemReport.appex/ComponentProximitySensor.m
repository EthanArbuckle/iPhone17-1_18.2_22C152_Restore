@interface ComponentProximitySensor
- (BOOL)isPresent;
- (id)supplyCurrent;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentProximitySensor

- (BOOL)isPresent
{
  if (findDeviceWithName("prox")) {
    return 1;
  }
  v3 = +[DAProximityManager sharedInstance];
  v4 = [v3 sensorRegion];
  v5 = [v4 allKeys];
  BOOL v2 = [v5 count] != 0;

  return v2;
}

- (void)populateAttributes:(id)a3
{
  id v5 = a3;
  v4 = [(ComponentProximitySensor *)self supplyCurrent];
  if (v4) {
    [v5 setObject:v4 forKeyedSubscript:@"supplyCurrentReading"];
  }
}

- (id)supplyCurrent
{
  uint64_t v2 = IOHIDEventSystemClientCreateWithType();
  if (v2)
  {
    v3 = (__IOHIDEventSystemClient *)v2;
    CFRunLoopGetCurrent();
    IOHIDEventSystemClientScheduleWithRunLoop();
    int v20 = 8;
    int valuePtr = 65280;
    CFNumberRef v4 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
    CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v20);
    *(_OWORD *)keys = *(_OWORD *)off_100084C18;
    values[0] = v4;
    values[1] = v5;
    CFDictionaryRef v6 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, v6);
    IOHIDEventSystemClientSetMatchingMultiple();
    CFArrayRef v8 = IOHIDEventSystemClientCopyServices(v3);
    CFArrayRef v9 = v8;
    if (v8 && CFArrayGetCount(v8) >= 1)
    {
      ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v9, 0);
      v11 = (void *)IOHIDServiceClientCopyProperty(ValueAtIndex, @"SupplyCurrentReading");
      v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }
      else
      {
        v17 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v19 = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Couldn't retrieve property from HID service...", v19, 2u);
        }
      }
      CFRelease(v3);
    }
    else
    {
      v14 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Couldn't find prox service\n", v19, 2u);
      }

      CFRelease(v3);
      v12 = 0;
      v15 = 0;
      if (!v9) {
        goto LABEL_18;
      }
    }
    CFRelease(v9);
    v15 = v12;
LABEL_18:
    CFRelease(Mutable);
    CFRelease(v6);
    CFRelease(v5);
    CFRelease(v4);
    goto LABEL_19;
  }
  v16 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    LOWORD(keys[0]) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Couldn't open hid system", (uint8_t *)keys, 2u);
  }

  v15 = 0;
LABEL_19:

  return v15;
}

@end