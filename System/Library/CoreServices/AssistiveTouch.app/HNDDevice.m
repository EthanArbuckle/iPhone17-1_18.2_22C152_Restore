@interface HNDDevice
+ (id)createNewDevice:(__IOHIDDevice *)a3;
- (BOOL)containsHIDDevice:(__IOHIDDevice *)a3;
- (BOOL)isLoaded;
- (BOOL)load;
- (BOOL)secondaryButton;
- (BOOL)tertiaryButton;
- (BOOL)wheel;
- (HNDDeviceDelegate)delegate;
- (id)_initWithHIDDevice:(__IOHIDDevice *)a3;
- (id)actionOverrideForUsagePage:(unsigned int)a3 usage:(unsigned int)a4;
- (id)description;
- (void)dealloc;
- (void)handleUsagePage:(unsigned int)a3 usage:(unsigned int)a4 value:(int64_t)a5;
- (void)handleValueCallback:(__IOHIDValue *)a3;
- (void)setDelegate:(id)a3;
- (void)unload;
@end

@implementation HNDDevice

- (id)_initWithHIDDevice:(__IOHIDDevice *)a3
{
  v4 = [(HNDDevice *)self init];
  v5 = v4;
  if (a3 && v4)
  {
    v4->_hidDevice = a3;
    CFRetain(a3);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    uint64_t v8 = +[HNDVirtualHIDMouse addActiveClientWithReason:v7];
    activeHIDVirtualMouseClientAssertion = v5->_activeHIDVirtualMouseClientAssertion;
    v5->_activeHIDVirtualMouseClientAssertion = (BSInvalidatable *)v8;
  }
  return v5;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)HNDDevice;
  v3 = [(HNDDevice *)&v6 description];
  v4 = +[NSString stringWithFormat:@"%@: %@", v3, self->_hidDevice];

  return v4;
}

+ (id)createNewDevice:(__IOHIDDevice *)a3
{
  BOOL IsSwitchControlRunning = UIAccessibilityIsSwitchControlRunning();
  v5 = ASTLogMouse();
  objc_super v6 = v5;
  if (IsSwitchControlRunning)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Switch Control is running. Ignoring device: %@", buf, 0xCu);
    }
    goto LABEL_44;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v50 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Attempting to create new HNDDevice from %@", buf, 0xCu);
  }

  IOHIDDeviceGetProperty(a3, @"DeviceUsagePairs");
  v7 = (__IOHIDDevice *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = ASTLogMouse();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "device usagePairs: %@", buf, 0xCu);
  }
  IOHIDDeviceRef device = a3;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  objc_super v6 = v7;
  id v9 = [v6 countByEnumeratingWithState:&v45 objects:v59 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v44 = 0;
    int v11 = 0;
    char v12 = 0;
    uint64_t v13 = *(void *)v46;
    do
    {
      v14 = v6;
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(v14);
        }
        v16 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "DeviceUsage", device);
        v18 = [v16 objectForKeyedSubscript:v17];

        v19 = +[NSString stringWithUTF8String:"DeviceUsagePage"];
        v20 = [v16 objectForKeyedSubscript:v19];

        if ([v20 intValue] == 1)
        {
          BOOL v21 = [v18 intValue] == 2;
          BOOL v22 = [v18 intValue] == 6 || objc_msgSend(v18, "intValue") == 7;
          v12 |= v21;
          v11 |= v22;
          BYTE4(v44) |= [v18 intValue] == 4;
          LOBYTE(v44) = v44 | ([v18 intValue] == 5);
        }
      }
      objc_super v6 = v14;
      id v10 = [v14 countByEnumeratingWithState:&v45 objects:v59 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v44 = 0;
    int v11 = 0;
    char v12 = 0;
  }

  v23 = device;
  unsigned int v24 = objc_msgSend((id)IOHIDDeviceGetProperty(device, @"IAPHIDAccessoryCategory"), "intValue");
  v25 = ASTLogMouse();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    NSStringFromBOOL();
    v26 = (__IOHIDDevice *)objc_claimAutoreleasedReturnValue();
    v27 = NSStringFromBOOL();
    v28 = NSStringFromBOOL();
    NSStringFromBOOL();
    v30 = unsigned int v29 = v24;
    v31 = NSStringFromBOOL();
    *(_DWORD *)buf = 138413314;
    v50 = v26;
    __int16 v51 = 2112;
    v52 = v27;
    __int16 v53 = 2112;
    v54 = v28;
    __int16 v55 = 2112;
    v56 = v30;
    __int16 v57 = 2112;
    v58 = v31;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "\n                \t - hasMouseCapabilities: %@\n                \t - hasMouseKeysCapabilities: %@\n                \t - hasJoystickCapabilities: %@\n                \t - hasGamePadCapabilities: %@\n                \t - isIAPDevice: %@", buf, 0x34u);

    unsigned int v24 = v29;
    v23 = device;
  }
  if (v12)
  {
    if (sub_100041014() && v24 != 2)
    {
      v32 = ASTLogMouse();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v23;
        v33 = "let the system handle mouse devices. skipping %@";
LABEL_42:
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, v33, buf, 0xCu);
        goto LABEL_43;
      }
      goto LABEL_43;
    }
  }
  else
  {
    v34 = +[AXSettings sharedInstance];
    if (([v34 assistiveTouchMouseKeysEnabled] & v11) == 1
      && _AXSAssistiveTouchEnabled())
    {
      BOOL v35 = UIAccessibilityIsSwitchControlRunning();

      if (BYTE4(v44) & 1 | !v35) {
        goto LABEL_36;
      }
    }
    else
    {

      if ((v44 & 0x100000000) != 0) {
        goto LABEL_36;
      }
    }
    if ((v44 & 1) == 0
      || (+[AXSettings sharedInstance],
          v36 = objc_claimAutoreleasedReturnValue(),
          unsigned int v37 = [v36 assistiveTouchGameControllerEnabled],
          v36,
          !v37))
    {
LABEL_40:
      v32 = ASTLogMouse();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v23;
        v33 = "Unsupported device: %@";
        goto LABEL_42;
      }
LABEL_43:

LABEL_44:
      id v41 = 0;
      goto LABEL_45;
    }
  }
LABEL_36:
  uint64_t v38 = objc_opt_class();
  if (!v38) {
    goto LABEL_40;
  }
  v39 = (objc_class *)v38;
  v40 = ASTLogMouse();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v39;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "making device: %@", buf, 0xCu);
  }

  id v41 = [objc_allocWithZone(v39) _initWithHIDDevice:v23];
LABEL_45:

  return v41;
}

- (void)dealloc
{
  [(HNDDevice *)self unload];
  hidDevice = self->_hidDevice;
  if (hidDevice)
  {
    CFRelease(hidDevice);
    self->_hidDevice = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)HNDDevice;
  [(HNDDevice *)&v4 dealloc];
}

- (id)actionOverrideForUsagePage:(unsigned int)a3 usage:(unsigned int)a4
{
  return (id)AXAssistiveTouchDefaultIconTypeForMouseButton();
}

- (BOOL)containsHIDDevice:(__IOHIDDevice *)a3
{
  return self->_hidDevice == a3;
}

- (void)handleValueCallback:(__IOHIDValue *)a3
{
  v5 = ASTLogMouse();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    char v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[device: %@] handleValueCallback: %@", (uint8_t *)&v9, 0x16u);
  }

  Element = IOHIDValueGetElement(a3);
  uint64_t UsagePage = IOHIDElementGetUsagePage(Element);
  uint64_t Usage = IOHIDElementGetUsage(Element);
  [(HNDDevice *)self handleUsagePage:UsagePage usage:Usage value:IOHIDValueGetIntegerValue(a3)];
}

- (void)handleUsagePage:(unsigned int)a3 usage:(unsigned int)a4 value:(int64_t)a5
{
  int64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  if (a3 == 1)
  {
    double v11 = 0.0;
    switch(a4)
    {
      case '0':
        uint64_t v10 = 3;
        break;
      case '8':
        if (!a5) {
          return;
        }
        int64_t v5 = 0;
        uint64_t v10 = 4;
        break;
      case '1':
        double v11 = (double)a5;
        uint64_t v10 = 3;
        uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_7;
      default:
        return;
    }
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_16;
  }
  if (a3 != 9) {
    return;
  }
  uint64_t v9 = a4;
  if (a5 > 0) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  double v11 = 0.0;
LABEL_7:
  int64_t v5 = 0;
LABEL_16:
  id v14 = [objc_allocWithZone((Class)HNDEvent) init];
  [v14 setType:v10];
  [v14 setDeltaX:(double)v5];
  [v14 setDeltaY:v11];
  [v14 setButtonNumber:v9];
  char v12 = [(HNDDevice *)self actionOverrideForUsagePage:v7 usage:v6];
  [v14 setActionOverride:v12];

  uint64_t v13 = [(HNDDevice *)self delegate];
  [v13 device:self didPostEvent:v14];
}

- (BOOL)load
{
  if ([(HNDDevice *)self isLoaded]) {
    return 1;
  }
  p_hidDevice = &self->_hidDevice;
  hidDevice = self->_hidDevice;
  if (!hidDevice) {
    return 0;
  }
  IOReturn v6 = IOHIDDeviceOpen(hidDevice, 0);
  if (v6)
  {
    int v7 = v6;
    uint64_t v8 = ASTLogMouse();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10011405C((uint64_t *)&self->_hidDevice, v7, v8);
    }
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v8 = +[NSMutableDictionary dictionary];
    uint64_t v9 = +[NSNumber numberWithInt:1];
    [v8 setObject:v9 forKey:@"UsagePage"];

    uint64_t v10 = +[NSNumber numberWithInt:48];
    [v8 setObject:v10 forKey:@"Usage"];

    CFArrayRef v11 = IOHIDDeviceCopyMatchingElements(*p_hidDevice, (CFDictionaryRef)v8, 0);
    if (![(__CFArray *)v11 count]) {
      goto LABEL_43;
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    CFArrayRef v12 = v11;
    id v13 = [(__CFArray *)v12 countByEnumeratingWithState:&v54 objects:v63 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v55;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v55 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(__IOHIDElement **)(*((void *)&v54 + 1) + 8 * i);
          if (self->_maxX == 0.0) {
            self->_maxX = (double)IOHIDElementGetLogicalMax(*(IOHIDElementRef *)(*((void *)&v54 + 1) + 8 * i));
          }
          if (self->_minX == 0.0) {
            self->_minX = (double)IOHIDElementGetLogicalMin(v17);
          }
        }
        id v14 = [(__CFArray *)v12 countByEnumeratingWithState:&v54 objects:v63 count:16];
      }
      while (v14);
    }

    v18 = +[NSNumber numberWithInt:1];
    [v8 setObject:v18 forKey:@"UsagePage"];

    v19 = +[NSNumber numberWithInt:49];
    [v8 setObject:v19 forKey:@"Usage"];

    CFArrayRef v11 = IOHIDDeviceCopyMatchingElements(*p_hidDevice, (CFDictionaryRef)v8, 0);
    if (![(__CFArray *)v11 count]) {
      goto LABEL_43;
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    CFArrayRef v20 = v11;
    id v21 = [(__CFArray *)v20 countByEnumeratingWithState:&v50 objects:v62 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v51;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v51 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(__IOHIDElement **)(*((void *)&v50 + 1) + 8 * (void)j);
          if (self->_maxY == 0.0) {
            self->_maxY = (double)IOHIDElementGetLogicalMax(*(IOHIDElementRef *)(*((void *)&v50 + 1) + 8 * (void)j));
          }
          if (self->_minY == 0.0) {
            self->_minY = (double)IOHIDElementGetLogicalMin(v25);
          }
        }
        id v22 = [(__CFArray *)v20 countByEnumeratingWithState:&v50 objects:v62 count:16];
      }
      while (v22);
    }

    v26 = +[NSNumber numberWithInt:1];
    [v8 setObject:v26 forKey:@"UsagePage"];

    v27 = +[NSNumber numberWithInt:56];
    [v8 setObject:v27 forKey:@"Usage"];

    CFArrayRef v28 = IOHIDDeviceCopyMatchingElements(*p_hidDevice, (CFDictionaryRef)v8, 0);
    id v29 = [(__CFArray *)v28 count];
    BOOL v30 = v29 != 0;
    if (v29)
    {
      v31 = [(__CFArray *)v28 objectAtIndex:0];
      CFIndex LogicalMin = IOHIDElementGetLogicalMin(v31);

      v33 = [(__CFArray *)v28 objectAtIndex:0];
      CFIndex LogicalMax = IOHIDElementGetLogicalMax(v33);

      BOOL v35 = ASTLogMouse();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v59 = (HNDDevice *)LogicalMin;
        __int16 v60 = 2048;
        CFIndex v61 = LogicalMax;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Min wheel: %ld Max wheel: %ld", buf, 0x16u);
      }
    }
    v36 = +[NSNumber numberWithInt:9];
    [v8 setObject:v36 forKey:@"UsagePage"];

    unsigned int v37 = +[NSNumber numberWithInt:1];
    [v8 setObject:v37 forKey:@"Usage"];

    CFArrayRef v11 = IOHIDDeviceCopyMatchingElements(*p_hidDevice, (CFDictionaryRef)v8, 0);
    if ([(__CFArray *)v11 count])
    {
      uint64_t v38 = +[NSNumber numberWithInt:9];
      [v8 setObject:v38 forKey:@"UsagePage"];

      v39 = +[NSNumber numberWithInt:2];
      [v8 setObject:v39 forKey:@"Usage"];

      CFArrayRef v40 = IOHIDDeviceCopyMatchingElements(self->_hidDevice, (CFDictionaryRef)v8, 0);
      BOOL v41 = [(__CFArray *)v40 count] != 0;
      v42 = +[NSNumber numberWithInt:9];
      [v8 setObject:v42 forKey:@"UsagePage"];

      v43 = +[NSNumber numberWithInt:3];
      [v8 setObject:v43 forKey:@"Usage"];

      CFArrayRef v11 = IOHIDDeviceCopyMatchingElements(self->_hidDevice, (CFDictionaryRef)v8, 0);
      id v44 = [(__CFArray *)v11 count];
      self->_wheel = v30;
      self->_secondaryButton = v41;
      self->_tertiaryButton = v44 != 0;
      AXSetThreadPriority();
      IOHIDDeviceRegisterRemovalCallback(self->_hidDevice, (IOHIDCallback)j__objc_msgSend_unload, self);
      IOHIDDeviceRegisterInputValueCallback(self->_hidDevice, (IOHIDValueCallback)sub_10003A278, self);
      CFNumberRef Property = (const __CFNumber *)IOHIDDeviceGetProperty(self->_hidDevice, @"MaxInputReportSize");
      int valuePtr = 0;
      if (Property)
      {
        CFNumberGetValue(Property, kCFNumberIntType, &valuePtr);
        long long v46 = (char *)malloc_type_malloc(valuePtr, 0xE61CCD48uLL);
        self->_hidReportBuffer = v46;
        IOHIDDeviceRegisterInputReportCallback(self->_hidDevice, (uint8_t *)v46, valuePtr, (IOHIDReportCallback)sub_10003A280, self);
      }
      self->_isLoaded = 1;
      long long v47 = ASTLogMouse();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v59 = self;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "loaded: %@", buf, 0xCu);
      }

      BOOL v3 = 1;
    }
    else
    {
LABEL_43:
      BOOL v3 = 0;
    }
  }
  return v3;
}

- (void)unload
{
  BOOL v3 = ASTLogMouse();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    CFArrayRef v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Unload device: %@", (uint8_t *)&v10, 0xCu);
  }

  if (self->_isLoaded)
  {
    hidDevice = self->_hidDevice;
    Current = CFRunLoopGetCurrent();
    IOHIDDeviceUnscheduleFromRunLoop(hidDevice, Current, kCFRunLoopDefaultMode);
    IOHIDDeviceClose(self->_hidDevice, 0);
    *(_DWORD *)&self->_isLoaded = 0;
    hidReportBuffer = self->_hidReportBuffer;
    if (hidReportBuffer)
    {
      free(hidReportBuffer);
      self->_hidReportBuffer = 0;
    }
    int v7 = self;
    id WeakRetained = objc_loadWeakRetained((id *)&v7->_delegate);
    [WeakRetained device:v7 didUnload:1];

    uint64_t v9 = self->_hidDevice;
    if (v9)
    {
      CFRelease(v9);
      self->_hidDevice = 0;
    }
    [(BSInvalidatable *)v7->_activeHIDVirtualMouseClientAssertion invalidate];
  }
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (HNDDeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HNDDeviceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)secondaryButton
{
  return self->_secondaryButton;
}

- (BOOL)tertiaryButton
{
  return self->_tertiaryButton;
}

- (BOOL)wheel
{
  return self->_wheel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeHIDVirtualMouseClientAssertion, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end