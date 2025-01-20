@interface SCATHardwareInputSource
- (BOOL)_useOverrideDeviceCount;
- (BOOL)handledEvent:(id)a3;
- (BOOL)isATVRemoteInputSource;
- (BOOL)isAirPodsInputSource;
- (BOOL)isAvailable;
- (BOOL)isGamepadInputSource;
- (BOOL)isKeyboardInputSource;
- (BOOL)isMFIInputSource;
- (BOOL)isMIDIInputSource;
- (NSDictionary)persistentSwitchIdentifiers;
- (NSDictionary)switchDisplayNames;
- (NSString)switchSource;
- (__IOHIDManager)hidManager;
- (id)_matchingCriteria;
- (id)actionForButtonNumber:(int64_t)a3 withType:(id)a4;
- (id)persistentSwitchIdentifierForButtonNumber:(int64_t)a3;
- (id)switchDisplayNameForButtonNumber:(int64_t)a3;
- (int64_t)switchKeyForSwitch:(id)a3;
- (unint64_t)_overrideDeviceCount;
- (unint64_t)availabilityDetail;
- (unint64_t)numberOfDevicesConnected;
- (unint64_t)priority;
- (void)_addFakeKeyboardDevice;
- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5;
- (void)_didUpdateAvailability:(BOOL)a3 withDetail:(unint64_t)a4;
- (void)_removeFakeKeyboardDevice;
- (void)_startDetectingDevices;
- (void)_startHandlingEvents;
- (void)_stopDetectingDevices;
- (void)_stopHandlingEvents;
- (void)dealloc;
- (void)setAvailabilityDetail:(unint64_t)a3;
- (void)setAvailable:(BOOL)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setHidManager:(__IOHIDManager *)a3;
- (void)setPersistentSwitchIdentifiers:(id)a3;
- (void)setSwitchDisplayNames:(id)a3;
- (void)set_overrideDeviceCount:(unint64_t)a3;
- (void)set_useOverrideDeviceCount:(BOOL)a3;
- (void)startRunning;
- (void)stopRunning;
- (void)updateWithSwitches:(id)a3 recipe:(id)a4;
@end

@implementation SCATHardwareInputSource

- (BOOL)isMFIInputSource
{
  return 0;
}

- (BOOL)isMIDIInputSource
{
  return 0;
}

- (BOOL)isKeyboardInputSource
{
  return 0;
}

- (BOOL)isATVRemoteInputSource
{
  return 0;
}

- (BOOL)isGamepadInputSource
{
  return 0;
}

- (BOOL)isAirPodsInputSource
{
  return 0;
}

- (NSString)switchSource
{
  return (NSString *)&stru_1001B1E10;
}

- (int64_t)switchKeyForSwitch:(id)a3
{
  return -1;
}

- (id)actionForButtonNumber:(int64_t)a3 withType:(id)a4
{
  return 0;
}

- (id)persistentSwitchIdentifierForButtonNumber:(int64_t)a3
{
  return 0;
}

- (id)switchDisplayNameForButtonNumber:(int64_t)a3
{
  return 0;
}

- (unint64_t)numberOfDevicesConnected
{
  if ([(SCATHardwareInputSource *)self _useOverrideDeviceCount])
  {
    return [(SCATHardwareInputSource *)self _overrideDeviceCount];
  }
  else
  {
    v4 = [(SCATHardwareInputSource *)self hidManager];
    if (v4 && (CFSetRef v5 = IOHIDManagerCopyDevices(v4)) != 0)
    {
      CFSetRef v6 = v5;
      CFIndex Count = CFSetGetCount(v5);
      CFRelease(v6);
      return Count;
    }
    else
    {
      return 0;
    }
  }
}

- (BOOL)handledEvent:(id)a3
{
  return 0;
}

- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5
{
  id v8 = a3;
  v9 = [(SCATInputSource *)self delegate];
  v10 = [(SCATInputSource *)self queue];
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10007DF6C;
    v11[3] = &unk_1001ACF28;
    id v12 = v9;
    v13 = self;
    id v14 = v8;
    BOOL v15 = a4;
    BOOL v16 = a5;
    [v10 performAsynchronousWritingBlock:v11];
  }
}

- (void)_didUpdateAvailability:(BOOL)a3 withDetail:(unint64_t)a4
{
  BOOL v5 = a3;
  unsigned int v7 = [(SCATHardwareInputSource *)self isAvailable];
  unint64_t v8 = [(SCATHardwareInputSource *)self availabilityDetail];
  if (v7 != v5 || v8 != a4)
  {
    v9 = [(SCATInputSource *)self delegate];
    v10 = [(SCATInputSource *)self queue];
    if (v10)
    {
      if (objc_opt_respondsToSelector())
      {
        v11 = _NSConcreteStackBlock;
        uint64_t v12 = 3221225472;
        v13 = sub_10007E0A4;
        id v14 = &unk_1001ACCD0;
        id v15 = v9;
        BOOL v16 = self;
        BOOL v18 = v5;
        unint64_t v17 = a4;
        [v10 performAsynchronousWritingBlock:&v11];
      }
    }
    -[SCATHardwareInputSource setAvailable:](self, "setAvailable:", v5, v11, v12, v13, v14);
    [(SCATHardwareInputSource *)self setAvailabilityDetail:a4];
  }
}

- (id)_matchingCriteria
{
  v3 = +[NSMutableArray array];
  if ([(SCATHardwareInputSource *)self isMFIInputSource])
  {
    [v3 addObject:&off_1001BC170];
    [v3 addObject:&off_1001BC198];
  }
  if ([(SCATHardwareInputSource *)self isKeyboardInputSource]) {
    [v3 addObject:&off_1001BC1C0];
  }
  if ([(SCATHardwareInputSource *)self isATVRemoteInputSource])
  {
    v4 = SCATATVRemoteDeviceMatchingDictionary();
    [v3 addObject:v4];
  }
  if ([(SCATHardwareInputSource *)self isGamepadInputSource]) {
    [v3 addObject:&off_1001BC1E8];
  }

  return v3;
}

- (void)_startDetectingDevices
{
  if ([(SCATHardwareInputSource *)self isMIDIInputSource]) {
    _AXAssert();
  }
  if (![(SCATHardwareInputSource *)self isMIDIInputSource]
    && ![(SCATHardwareInputSource *)self hidManager])
  {
    v3 = IOHIDManagerCreate(kCFAllocatorDefault, 0);
    CFArrayRef v4 = [(SCATHardwareInputSource *)self _matchingCriteria];
    IOHIDManagerSetDeviceMatchingMultiple(v3, v4);

    IOHIDManagerRegisterDeviceMatchingCallback(v3, (IOHIDDeviceCallback)sub_10007E434, self);
    IOHIDManagerRegisterDeviceRemovalCallback(v3, (IOHIDDeviceCallback)sub_10007E440, self);
    Current = CFRunLoopGetCurrent();
    IOHIDManagerScheduleWithRunLoop(v3, Current, kCFRunLoopDefaultMode);
    if (IOHIDManagerOpen(v3, 0))
    {
      _AXLogWithFacility();
    }
    else
    {
      [(SCATHardwareInputSource *)self setHidManager:v3];
      if (v3
        && (CFSetRef v6 = IOHIDManagerCopyDevices(v3)) != 0
        && (v7 = v6, CFIndex Count = CFSetGetCount(v6), CFRelease(v7), Count > 0))
      {
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        CFSetRef v9 = IOHIDManagerCopyDevices(v3);
        id v10 = [(__CFSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v15;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v15 != v12) {
                objc_enumerationMutation(v9);
              }
              sub_10007E4F4(*(__IOHIDDevice **)(*((void *)&v14 + 1) + 8 * i), self);
            }
            id v11 = [(__CFSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }
          while (v11);
        }
      }
      else
      {
        [(SCATHardwareInputSource *)self _didUpdateAvailability:0 withDetail:1];
      }
    }
  }
}

- (void)_stopDetectingDevices
{
  if ([(SCATHardwareInputSource *)self isMIDIInputSource]) {
    _AXAssert();
  }
  if (![(SCATHardwareInputSource *)self isMIDIInputSource])
  {
    v3 = [(SCATHardwareInputSource *)self hidManager];
    if (v3)
    {
      CFRelease(v3);
      [(SCATHardwareInputSource *)self setHidManager:0];
    }
  }
}

- (unint64_t)priority
{
  return 2000;
}

- (void)_startHandlingEvents
{
  if ([(SCATHardwareInputSource *)self isMIDIInputSource]) {
    _AXAssert();
  }
  if (![(SCATHardwareInputSource *)self isMIDIInputSource])
  {
    id v3 = +[HNDHandManager sharedManager];
    [v3 addEventHandler:self];
  }
}

- (void)_stopHandlingEvents
{
  if ([(SCATHardwareInputSource *)self isMIDIInputSource]) {
    _AXAssert();
  }
  if (![(SCATHardwareInputSource *)self isMIDIInputSource])
  {
    id v3 = +[HNDHandManager sharedManager];
    [v3 removeEventHandler:self];
  }
}

- (void)dealloc
{
  [(SCATHardwareInputSource *)self stopRunning];
  v3.receiver = self;
  v3.super_class = (Class)SCATHardwareInputSource;
  [(SCATHardwareInputSource *)&v3 dealloc];
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SCATHardwareInputSource;
  [(SCATInputSource *)&v4 setDelegate:a3 queue:a4];
}

- (void)startRunning
{
  if (![(SCATInputSource *)self isRunning])
  {
    [(SCATHardwareInputSource *)self setAvailable:0];
    [(SCATHardwareInputSource *)self setAvailabilityDetail:0];
    if (![(SCATHardwareInputSource *)self isMIDIInputSource])
    {
      [(SCATHardwareInputSource *)self _startHandlingEvents];
      [(SCATHardwareInputSource *)self _startDetectingDevices];
    }
    [(SCATInputSource *)self setRunning:1];
  }
}

- (void)stopRunning
{
  if ([(SCATInputSource *)self isRunning])
  {
    if (![(SCATHardwareInputSource *)self isMIDIInputSource])
    {
      [(SCATHardwareInputSource *)self _stopHandlingEvents];
      [(SCATHardwareInputSource *)self _stopDetectingDevices];
    }
    [(SCATInputSource *)self setRunning:0];
  }
}

- (void)updateWithSwitches:(id)a3 recipe:(id)a4
{
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SCATHardwareInputSource;
  id v7 = a3;
  [(SCATInputSource *)&v19 updateWithSwitches:v7 recipe:v6];
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  CFSetRef v9 = +[NSMutableDictionary dictionary];
  +[NSMutableDictionary dictionary];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007F018;
  v14[3] = &unk_1001AD138;
  v14[4] = self;
  id v15 = v8;
  id v16 = v6;
  id v17 = v9;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v18;
  id v11 = v9;
  id v12 = v6;
  id v13 = v8;
  [v7 enumerateObjectsUsingBlock:v14];

  [(SCATInputSource *)self setActions:v13];
  [(SCATHardwareInputSource *)self setPersistentSwitchIdentifiers:v11];
  [(SCATHardwareInputSource *)self setSwitchDisplayNames:v10];
}

- (void)_addFakeKeyboardDevice
{
  objc_super v3 = (char *)[(SCATHardwareInputSource *)self _overrideDeviceCount] + 1;

  [(SCATHardwareInputSource *)self set_overrideDeviceCount:v3];
}

- (void)_removeFakeKeyboardDevice
{
  unint64_t v3 = (unint64_t)fmax((double)([(SCATHardwareInputSource *)self _overrideDeviceCount] - 1), 0.0);

  [(SCATHardwareInputSource *)self set_overrideDeviceCount:v3];
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (BOOL)_useOverrideDeviceCount
{
  return self->__useOverrideDeviceCount;
}

- (void)set_useOverrideDeviceCount:(BOOL)a3
{
  self->__useOverrideDeviceCFIndex Count = a3;
}

- (unint64_t)_overrideDeviceCount
{
  return self->__overrideDeviceCount;
}

- (void)set_overrideDeviceCount:(unint64_t)a3
{
  self->__overrideDeviceCFIndex Count = a3;
}

- (__IOHIDManager)hidManager
{
  return self->_hidManager;
}

- (void)setHidManager:(__IOHIDManager *)a3
{
  self->_hidManager = a3;
}

- (unint64_t)availabilityDetail
{
  return self->_availabilityDetail;
}

- (void)setAvailabilityDetail:(unint64_t)a3
{
  self->_availabilityDetail = a3;
}

- (NSDictionary)persistentSwitchIdentifiers
{
  return self->_persistentSwitchIdentifiers;
}

- (void)setPersistentSwitchIdentifiers:(id)a3
{
}

- (NSDictionary)switchDisplayNames
{
  return self->_switchDisplayNames;
}

- (void)setSwitchDisplayNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchDisplayNames, 0);

  objc_storeStrong((id *)&self->_persistentSwitchIdentifiers, 0);
}

@end