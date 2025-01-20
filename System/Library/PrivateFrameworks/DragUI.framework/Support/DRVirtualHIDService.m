@interface DRVirtualHIDService
- (BOOL)_isNormalizedPointOutOfBounds:(CAPoint3D)a3;
- (BOOL)isOpen;
- (BOOL)sentUp;
- (BOOL)setOutputEvent:(id)a3 forService:(id)a4;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5;
- (CAPoint3D)_normalizedLocationFromReferenceLocation:(CAPoint3D)a3;
- (CAPoint3D)currentLocation;
- (DRVirtualHIDService)initWithScreen:(id)a3;
- (HIDVirtualEventService)eventService;
- (NSDictionary)properties;
- (OS_dispatch_group)waitForOpenGroup;
- (OS_dispatch_queue)queue;
- (UIScreen)screen;
- (__IOHIDEvent)HIDEventBase;
- (__IOHIDEvent)exitedEvent;
- (id)copyEventMatching:(id)a3 forService:(id)a4;
- (id)propertyForKey:(id)a3 forService:(id)a4;
- (unsigned)currentPathIndex;
- (void)_configureHIDServiceIfNeeded;
- (void)_initializeHIDEventBaseWithLocation:(CAPoint3D)a3;
- (void)_moveToLocation:(CAPoint3D)a3;
- (void)_sendHIDEvent:(__IOHIDEvent *)a3;
- (void)_updateHIDEventBaseWithLocation:(CAPoint3D)a3 touching:(BOOL)a4;
- (void)beginAtPoint:(CAPoint3D)a3;
- (void)dealloc;
- (void)lift;
- (void)liftAtLocation:(CAPoint3D)a3;
- (void)moveToLocation:(CAPoint3D)a3;
- (void)notification:(int64_t)a3 withProperty:(id)a4 forService:(id)a5;
- (void)setCurrentLocation:(CAPoint3D)a3;
- (void)setCurrentPathIndex:(unsigned int)a3;
- (void)setEventService:(id)a3;
- (void)setExitedEvent:(__IOHIDEvent *)a3;
- (void)setHIDEventBase:(__IOHIDEvent *)a3;
- (void)setIsOpen:(BOOL)a3;
- (void)setProperties:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSentUp:(BOOL)a3;
- (void)setWaitForOpenGroup:(id)a3;
@end

@implementation DRVirtualHIDService

- (DRVirtualHIDService)initWithScreen:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DRVirtualHIDService;
  v6 = [(DRVirtualHIDService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_screen, a3);
  }

  return v7;
}

- (void)beginAtPoint:(CAPoint3D)a3
{
  double z = a3.z;
  double y = a3.y;
  double x = a3.x;
  [(DRVirtualHIDService *)self _configureHIDServiceIfNeeded];
  self->_sentUp = 0;
  -[DRVirtualHIDService _initializeHIDEventBaseWithLocation:](self, "_initializeHIDEventBaseWithLocation:", x, y, z);
  HIDEventBase = self->_HIDEventBase;
  [(DRVirtualHIDService *)self _sendHIDEvent:HIDEventBase];
}

- (void)moveToLocation:(CAPoint3D)a3
{
}

- (void)_moveToLocation:(CAPoint3D)a3
{
  if (self->_HIDEventBase)
  {
    -[DRVirtualHIDService _updateHIDEventBaseWithLocation:touching:](self, "_updateHIDEventBaseWithLocation:touching:", 1, a3.x, a3.y, a3.z);
    HIDEventBase = self->_HIDEventBase;
    [(DRVirtualHIDService *)self _sendHIDEvent:HIDEventBase];
  }
  else
  {
    id v5 = DRLogTarget();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Ignoring move to location. _HIDEventBase is nil.", v6, 2u);
    }
  }
}

- (void)liftAtLocation:(CAPoint3D)a3
{
  if (self->_HIDEventBase)
  {
    double z = a3.z;
    double y = a3.y;
    double x = a3.x;
    -[DRVirtualHIDService moveToLocation:](self, "moveToLocation:");
    -[DRVirtualHIDService _updateHIDEventBaseWithLocation:touching:](self, "_updateHIDEventBaseWithLocation:touching:", 0, x, y, z);
    [(DRVirtualHIDService *)self _sendHIDEvent:self->_HIDEventBase];
    self->_sentUp = 1;
    CFRelease(self->_HIDEventBase);
    self->_HIDEventBase = 0;
    exitedEvent = self->_exitedEvent;
    if (exitedEvent)
    {
      CFRelease(exitedEvent);
      self->_exitedEvent = 0;
    }
  }
  else
  {
    v8 = DRLogTarget();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Ignoring lift at location. _HIDEventBase is nil.", v9, 2u);
    }
  }
}

- (void)lift
{
  [(DRVirtualHIDService *)self currentLocation];
  -[DRVirtualHIDService liftAtLocation:](self, "liftAtLocation:");
}

- (void)dealloc
{
  if (!self->_sentUp)
  {
    self->_sentUp = 1;
    [(DRVirtualHIDService *)self lift];
  }
  HIDEventBase = self->_HIDEventBase;
  if (HIDEventBase)
  {
    CFRelease(HIDEventBase);
    self->_HIDEventBase = 0;
  }
  exitedEvent = self->_exitedEvent;
  if (exitedEvent)
  {
    CFRelease(exitedEvent);
    self->_exitedEvent = 0;
  }
  id v5 = self->_eventService;
  if (v5)
  {
    v6 = [(DRVirtualHIDService *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100019578;
    block[3] = &unk_100054B58;
    objc_super v9 = v5;
    dispatch_async(v6, block);
  }
  v7.receiver = self;
  v7.super_class = (Class)DRVirtualHIDService;
  [(DRVirtualHIDService *)&v7 dealloc];
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5
{
  id v7 = a3;
  unsigned int v8 = [a4 isEqual:@"DeviceOpenedByEventSystem"];
  if (v8)
  {
    self->_isOpen = [v7 BOOLValue];
    dispatch_group_leave((dispatch_group_t)self->_waitForOpenGroup);
  }

  return v8;
}

- (id)propertyForKey:(id)a3 forService:(id)a4
{
  return -[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", a3, a4);
}

- (id)copyEventMatching:(id)a3 forService:(id)a4
{
  return 0;
}

- (BOOL)setOutputEvent:(id)a3 forService:(id)a4
{
  return 0;
}

- (void)notification:(int64_t)a3 withProperty:(id)a4 forService:(id)a5
{
  id v7 = a4;
  unsigned int v8 = @"terminated";
  if (a3 == 10) {
    unsigned int v8 = @"enumerated";
  }
  objc_super v9 = v8;
  v10 = DRLogTarget();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    int v13 = 138413058;
    v14 = v12;
    __int16 v15 = 2048;
    v16 = self;
    __int16 v17 = 2112;
    v18 = v9;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "<%@:%p> notification: %@ withProperty: %@", (uint8_t *)&v13, 0x2Au);
  }
}

- (void)_configureHIDServiceIfNeeded
{
  p_eventService = &self->_eventService;
  if (!self->_eventService)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.DragUI.druid.virtual-digitizer", v4);
    queue = self->_queue;
    self->_queue = v5;

    id v7 = (OS_dispatch_group *)dispatch_group_create();
    waitForOpenGroup = self->_waitForOpenGroup;
    self->_waitForOpenGroup = v7;

    dispatch_group_enter((dispatch_group_t)self->_waitForOpenGroup);
    v32[0] = @"druid";
    v31[0] = @"Transport";
    v31[1] = @"PrimaryUsagePage";
    objc_super v9 = +[NSNumber numberWithUnsignedShort:13];
    v32[1] = v9;
    v31[2] = @"PrimaryUsage";
    v10 = +[NSNumber numberWithUnsignedShort:4];
    v32[2] = v10;
    v32[3] = &__kCFBooleanTrue;
    v31[3] = @"Authenticated";
    v31[4] = @"Built-In";
    v32[4] = &__kCFBooleanTrue;
    v32[5] = &__kCFBooleanTrue;
    v31[5] = @"DisplayIntegrated";
    v31[6] = @"VendorID";
    v32[6] = &off_100057970;
    v32[7] = &off_100057970;
    v31[7] = @"ProductID";
    v31[8] = @"DeviceUsagePairs";
    v28[0] = @"DeviceUsagePage";
    v11 = +[NSNumber numberWithUnsignedShort:13];
    v28[1] = @"DeviceUsage";
    v29[0] = v11;
    v12 = +[NSNumber numberWithUnsignedShort:4];
    v29[1] = v12;
    int v13 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    v30 = v13;
    v14 = +[NSArray arrayWithObjects:&v30 count:1];
    v32[8] = v14;
    __int16 v15 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:9];

    v16 = [(DRVirtualHIDService *)self screen];
    __int16 v17 = [v16 displayConfiguration];
    v18 = [v17 hardwareIdentifier];

    if (v18)
    {
      __int16 v19 = (NSDictionary *)[(NSDictionary *)v15 mutableCopy];
      [(NSDictionary *)v19 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Built-In"];
      [(NSDictionary *)v19 setObject:v18 forKeyedSubscript:@"displayUUID"];

      __int16 v15 = v19;
    }
    properties = self->_properties;
    self->_properties = v15;
    v21 = v15;

    v22 = objc_opt_new();
    objc_storeStrong((id *)p_eventService, v22);
    v23 = [(DRVirtualHIDService *)self queue];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100019A80;
    v25[3] = &unk_100054C58;
    id v26 = v22;
    v27 = self;
    id v24 = v22;
    dispatch_sync(v23, v25);
  }
}

- (void)_sendHIDEvent:(__IOHIDEvent *)a3
{
  waitForOpenGroup = self->_waitForOpenGroup;
  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  dispatch_group_wait(waitForOpenGroup, v5);
  Copdouble y = (const void *)IOHIDEventCreateCopy();
  mach_absolute_time();
  IOHIDEventSetTimeStamp();
  id v7 = [(DRVirtualHIDService *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100019C40;
  v8[3] = &unk_100055620;
  v8[4] = self;
  v8[5] = Copy;
  dispatch_sync(v7, v8);

  CFRelease(Copy);
}

- (CAPoint3D)_normalizedLocationFromReferenceLocation:(CAPoint3D)a3
{
  double y = a3.y;
  double x = a3.x;
  dispatch_time_t v5 = [(DRVirtualHIDService *)self screen];
  v6 = [v5 fixedCoordinateSpace];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v22.origin.double x = v8;
  v22.origin.double y = v10;
  v22.size.width = v12;
  v22.size.height = v14;
  double v15 = x - CGRectGetMinX(v22);
  v23.origin.double x = v8;
  v23.origin.double y = v10;
  v23.size.width = v12;
  v23.size.height = v14;
  double v16 = v15 / CGRectGetWidth(v23);
  v24.origin.double x = v8;
  v24.origin.double y = v10;
  v24.size.width = v12;
  v24.size.height = v14;
  double v17 = y - CGRectGetMinY(v24);
  v25.origin.double x = v8;
  v25.origin.double y = v10;
  v25.size.width = v12;
  v25.size.height = v14;
  double v18 = v17 / CGRectGetHeight(v25);
  double v19 = 0.0;
  double v20 = v16;
  result.double z = v19;
  result.double y = v18;
  result.double x = v20;
  return result;
}

- (void)_initializeHIDEventBaseWithLocation:(CAPoint3D)a3
{
  self->_currentLocation = a3;
  -[DRVirtualHIDService _normalizedLocationFromReferenceLocation:](self, "_normalizedLocationFromReferenceLocation:");
  mach_absolute_time();
  DigitizerEvent = (__IOHIDEvent *)IOHIDEventCreateDigitizerEvent();
  dispatch_time_t v5 = [(DRVirtualHIDService *)self properties];
  v6 = [v5 valueForKey:@"DisplayIntegrated"];
  [v6 BOOLValue];

  IOHIDEventSetIntegerValue();
  double v7 = [(DRVirtualHIDService *)self properties];
  CGFloat v8 = [v7 valueForKey:@"Built-In"];
  [v8 BOOLValue];

  IOHIDEventSetIntegerValue();
  char v9 = dword_100064760++;
  uint64_t v10 = (v9 & 7) + 21;
  self->_currentPathIndedouble x = v10;
  DigitizerFingerEvent = (const void *)IOHIDEventCreateDigitizerFingerEvent();
  IOHIDEventAppendEvent();
  CFRelease(DigitizerFingerEvent);
  CGFloat v12 = DRLogTarget();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Touch synthesizer started with path %lu", buf, 0xCu);
  }

  uint64_t VendorDefinedEvent = IOHIDEventCreateVendorDefinedEvent();
  if (VendorDefinedEvent)
  {
    CGFloat v14 = (const void *)VendorDefinedEvent;
    IOHIDEventAppendEvent();
    CFRelease(v14);
  }
  self->_HIDEventBase = DigitizerEvent;
}

- (void)_updateHIDEventBaseWithLocation:(CAPoint3D)a3 touching:(BOOL)a4
{
  double z = a3.z;
  double y = a3.y;
  double x = a3.x;
  -[DRVirtualHIDService _normalizedLocationFromReferenceLocation:](self, "_normalizedLocationFromReferenceLocation:");
  double v9 = v8;
  double v11 = v10;
  CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
  CFArrayGetValueAtIndex(Children, 0);
  IOHIDEventSetIntegerValue();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetFloatValue();
  IOHIDEventSetFloatValue();
  IOHIDEventSetFloatValue();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetFloatValue();
  IOHIDEventSetFloatValue();
  IOHIDEventSetFloatValue();
  unsigned int v13 = -[DRVirtualHIDService _isNormalizedPointOutOfBounds:](self, "_isNormalizedPointOutOfBounds:", v9, v11, 0.0);
  exitedEvent = self->_exitedEvent;
  if (v13)
  {
    if (!exitedEvent)
    {
      IOHIDEventGetTimeStamp();
      uint64_t VendorDefinedEvent = IOHIDEventCreateVendorDefinedEvent();
      if (VendorDefinedEvent)
      {
        uint64_t v16 = (__IOHIDEvent *)VendorDefinedEvent;
        IOHIDEventAppendEvent();
LABEL_7:
        self->_exitedEvent = v16;
      }
    }
  }
  else if (exitedEvent)
  {
    IOHIDEventRemoveEvent();
    CFRelease(self->_exitedEvent);
    uint64_t v16 = 0;
    goto LABEL_7;
  }
  mach_absolute_time();
  IOHIDEventSetTimeStamp();
  self->_currentLocation.double x = x;
  self->_currentLocation.double y = y;
  self->_currentLocation.double z = z;
}

- (BOOL)_isNormalizedPointOutOfBounds:(CAPoint3D)a3
{
  BOOL v3 = a3.x < 0.0;
  if (a3.x > 1.0) {
    BOOL v3 = 1;
  }
  if (a3.y < 0.0) {
    BOOL v3 = 1;
  }
  return a3.y > 1.0 || v3;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (HIDVirtualEventService)eventService
{
  return self->_eventService;
}

- (void)setEventService:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (__IOHIDEvent)HIDEventBase
{
  return self->_HIDEventBase;
}

- (void)setHIDEventBase:(__IOHIDEvent *)a3
{
  self->_HIDEventBase = a3;
}

- (BOOL)sentUp
{
  return self->_sentUp;
}

- (void)setSentUp:(BOOL)a3
{
  self->_sentUp = a3;
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (void)setIsOpen:(BOOL)a3
{
  self->_isOpen = a3;
}

- (OS_dispatch_group)waitForOpenGroup
{
  return self->_waitForOpenGroup;
}

- (void)setWaitForOpenGroup:(id)a3
{
}

- (CAPoint3D)currentLocation
{
  double x = self->_currentLocation.x;
  double y = self->_currentLocation.y;
  double z = self->_currentLocation.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentLocation:(CAPoint3D)a3
{
  self->_currentLocation = a3;
}

- (__IOHIDEvent)exitedEvent
{
  return self->_exitedEvent;
}

- (void)setExitedEvent:(__IOHIDEvent *)a3
{
  self->_exitedEvent = a3;
}

- (unsigned)currentPathIndex
{
  return self->_currentPathIndex;
}

- (void)setCurrentPathIndex:(unsigned int)a3
{
  self->_currentPathIndedouble x = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitForOpenGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventService, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_screen, 0);
}

@end