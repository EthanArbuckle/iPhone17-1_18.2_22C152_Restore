@interface HNDVirtualHIDMouse
+ (BOOL)handleButtonNumber:(int64_t)a3 isDown:(BOOL)a4;
+ (BOOL)handleEvent:(id)a3;
+ (BOOL)handleEyeTrackingMovementWithDelta:(CGPoint)a3;
+ (BOOL)handleMovementWithDelta:(CGPoint)a3;
+ (BOOL)handleScrollWithDelta:(CGPoint)a3;
+ (id)_createHNDMovementEventWithDelta:(CGPoint)a3;
+ (id)addActiveClientWithReason:(id)a3;
+ (unint64_t)eventServiceID;
+ (void)reevaluateDeviceCleanupTimer;
+ (void)setupSharedVirtualDeviceIfNecessary;
- (BOOL)_handleButtonNumber:(int64_t)a3 isDown:(BOOL)a4;
- (BOOL)_handleEyeTrackingMovementWithDelta:(CGPoint)a3;
- (BOOL)_handleMovementWithDelta:(CGPoint)a3;
- (BOOL)_handleScrollWithDelta:(CGPoint)a3;
- (BOOL)setOutputEvent:(id)a3 forService:(id)a4;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5;
- (HIDVirtualEventService)eventService;
- (NSDictionary)properties;
- (NSMutableDictionary)dynamicMetaProperties;
- (NSUUID)uuid;
- (OS_dispatch_group)waitForOpenGroup;
- (id)_init;
- (id)copyEventMatching:(id)a3 forService:(id)a4;
- (id)propertyForKey:(id)a3 forService:(id)a4;
- (void)_disableUserInterfaceClient;
- (void)_showBannerWithText:(id)a3;
- (void)dealloc;
- (void)notification:(int64_t)a3 withProperty:(id)a4 forService:(id)a5;
- (void)setWaitForOpenGroup:(id)a3;
- (void)unload;
@end

@implementation HNDVirtualHIDMouse

+ (void)setupSharedVirtualDeviceIfNecessary
{
  if (sub_100041014())
  {
    [a1 reevaluateDeviceCleanupTimer];
    if (!qword_1001F0B30)
    {
      v3 = ASTLogMouse();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Creating new shared virtual mouse device", buf, 2u);
      }

      id v4 = [[HNDVirtualHIDMouse alloc] _init];
      v5 = (void *)qword_1001F0B30;
      qword_1001F0B30 = (uint64_t)v4;
    }
    if (!qword_1001F0B38)
    {
      v6 = ASTLogMouse();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Creating new active client helper", v9, 2u);
      }

      v7 = objc_alloc_init(HNDActiveClientHelper);
      v8 = (void *)qword_1001F0B38;
      qword_1001F0B38 = (uint64_t)v7;
    }
  }
}

+ (void)reevaluateDeviceCleanupTimer
{
  unsigned int v2 = [(id)qword_1001F0B38 hasActiveClients];
  v3 = (void *)qword_1001F0B40;
  if (v2)
  {
    if (qword_1001F0B40)
    {
      id v4 = ASTLogMouse();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Active clients! Cancel virtual device cleanup timer", buf, 2u);
      }

      [(id)qword_1001F0B40 cancel];
      v5 = (void *)qword_1001F0B40;
      qword_1001F0B40 = 0;
    }
  }
  else
  {
    if (!qword_1001F0B40)
    {
      v6 = ASTLogMouse();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "No active clients! Setting up virtual device cleanup timer", v11, 2u);
      }

      id v7 = objc_alloc((Class)AXDispatchTimer);
      v8 = sub_1000A07CC();
      id v9 = [v7 initWithTargetSerialQueue:v8];
      v10 = (void *)qword_1001F0B40;
      qword_1001F0B40 = (uint64_t)v9;

      [(id)qword_1001F0B40 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
      v3 = (void *)qword_1001F0B40;
    }
    [v3 afterDelay:&stru_1001ADAE8 processBlock:5.0];
  }
}

+ (id)addActiveClientWithReason:(id)a3
{
  id v4 = a3;
  [a1 setupSharedVirtualDeviceIfNecessary];
  v5 = [(id)qword_1001F0B38 addActiveClientWithReason:v4];

  return v5;
}

- (id)_init
{
  v30.receiver = self;
  v30.super_class = (Class)HNDVirtualHIDMouse;
  id v2 = [(HNDVirtualHIDMouse *)&v30 init];
  if (v2)
  {
    uint64_t v3 = +[NSUUID UUID];
    id v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    v5 = [v2 uuid];
    v6 = [v5 UUIDString];
    v26 = +[NSString stringWithFormat:@"ASTVirtualHIDMouse.%@", v6];

    v35[0] = @"Virtual-AssistiveTouch";
    v34[0] = @"Transport";
    v34[1] = @"PhysicalDeviceUniqueID";
    id v7 = [v2 uuid];
    v8 = [v7 UUIDString];
    v35[1] = v8;
    v34[2] = @"PrimaryUsagePage";
    id v9 = +[NSNumber numberWithUnsignedShort:1];
    v35[2] = v9;
    v34[3] = @"PrimaryUsage";
    v10 = +[NSNumber numberWithUnsignedShort:2];
    v35[3] = v10;
    v35[4] = v26;
    v34[4] = @"LocationID";
    v34[5] = @"VendorID";
    v35[5] = &off_1001BC000;
    v35[6] = &off_1001BC000;
    v34[6] = @"ProductID";
    v34[7] = @"Authenticated";
    v35[7] = &__kCFBooleanTrue;
    v35[8] = &off_1001BC018;
    v34[8] = @"ReportInterval";
    v34[9] = @"DeviceUsagePairs";
    v31[0] = @"DeviceUsagePage";
    v11 = +[NSNumber numberWithUnsignedShort:1];
    v31[1] = @"DeviceUsage";
    v32[0] = v11;
    v12 = +[NSNumber numberWithUnsignedShort:2];
    v32[1] = v12;
    v13 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
    v33 = v13;
    v14 = +[NSArray arrayWithObjects:&v33 count:1];
    v35[9] = v14;
    v35[10] = &__kCFBooleanFalse;
    v34[10] = @"HIDSupportsPointerAcceleration";
    v34[11] = @"HIDSupportsScrollAcceleration";
    v35[11] = &__kCFBooleanFalse;
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:12];
    v16 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v15;

    uint64_t v17 = objc_opt_new();
    v18 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v17;

    dispatch_group_t v19 = dispatch_group_create();
    v20 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v19;

    dispatch_group_enter(*((dispatch_group_t *)v2 + 5));
    uint64_t v21 = objc_opt_new();
    v22 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v21;

    v23 = sub_1000A07CC();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A0CA0;
    block[3] = &unk_1001AAC78;
    id v28 = v2;
    id v29 = v23;
    v24 = v23;
    dispatch_sync(v24, block);
  }
  return v2;
}

- (void)unload
{
  [(HIDVirtualEventService *)self->_eventService cancel];
  eventService = self->_eventService;
  self->_eventService = 0;
}

- (void)dealloc
{
  [(HNDVirtualHIDMouse *)self unload];
  v3.receiver = self;
  v3.super_class = (Class)HNDVirtualHIDMouse;
  [(HNDVirtualHIDMouse *)&v3 dealloc];
}

+ (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  [a1 setupSharedVirtualDeviceIfNecessary];
  v5 = [(id)qword_1001F0B30 waitForOpenGroup];
  dispatch_time_t v6 = dispatch_time(0, 2000000000);
  dispatch_group_wait(v5, v6);

  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v7 = sub_1000A07CC();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A0F10;
  v10[3] = &unk_1001ADB30;
  id v11 = v4;
  v12 = &v13;
  id v8 = v4;
  dispatch_sync(v7, v10);

  LOBYTE(v7) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return (char)v7;
}

+ (unint64_t)eventServiceID
{
  id v2 = [(id)qword_1001F0B30 eventService];
  id v3 = [v2 serviceID];

  return (unint64_t)v3;
}

- (BOOL)_handleMovementWithDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  mach_absolute_time();
  dispatch_time_t v6 = +[HNDHandManager sharedManager];
  id v7 = [v6 systemPointerController];
  id v8 = [(HNDVirtualHIDMouse *)self eventService];
  objc_msgSend(v7, "buttonMaskForSenderID:", objc_msgSend(v8, "serviceID"));

  MouseEvent = (const void *)IOHIDEventCreateMouseEvent();
  v10 = [(HNDVirtualHIDMouse *)self eventService];
  unsigned __int8 v11 = [v10 dispatchEvent:MouseEvent];

  v12 = ASTLogMouse();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10011545C(x, y);
  }

  if (MouseEvent) {
    CFRelease(MouseEvent);
  }
  return v11;
}

- (void)_disableUserInterfaceClient
{
  id v3 = +[HNDHandManager sharedManager];
  id v2 = [v3 mainDisplayManager];
  [v2 removeUserInterfaceClientEnabler:@"AssistiveTouchVirtualHIDMouse"];
}

- (void)_showBannerWithText:(id)a3
{
  id v4 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_disableUserInterfaceClient" object:0];
  v5 = +[HNDHandManager sharedManager];
  id v7 = [v5 mainDisplayManager];

  [v7 addUserInterfaceClientEnabler:@"AssistiveTouchVirtualHIDMouse"];
  dispatch_time_t v6 = sub_100040EC8(@"ASSISTIVE_TOUCH");
  [v7 showSimpleBannerWithTitle:v6 text:v4];

  [(HNDVirtualHIDMouse *)self performSelector:"_disableUserInterfaceClient" withObject:0 afterDelay:15.0];
}

- (BOOL)_handleEyeTrackingMovementWithDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  mach_absolute_time();
  dispatch_time_t v6 = +[HNDHandManager sharedManager];
  id v7 = [v6 systemPointerController];
  id v8 = [(HNDVirtualHIDMouse *)self eventService];
  objc_msgSend(v7, "buttonMaskForSenderID:", objc_msgSend(v8, "serviceID"));

  MouseEvent = (const void *)IOHIDEventCreateMouseEvent();
  v10 = +[AXEventRepresentation representationWithHIDEvent:MouseEvent hidStreamIdentifier:@"AST-IOHIDFilter"];
  unsigned __int8 v11 = +[AXEventData dataWithSender:5 page:0 usage:4 modifierFlags:0 eventValue1:0.0 eventValue2:0.0];
  [v10 setAccessibilityData:v11];
  [v10 applyAccessibilityDataToCreatorHIDEvent];
  v12 = [(HNDVirtualHIDMouse *)self eventService];
  unsigned __int8 v13 = [v12 dispatchEvent:MouseEvent];

  v14 = ASTLogMouse();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100115500(x, y);
  }

  if (MouseEvent) {
    CFRelease(MouseEvent);
  }

  return v13;
}

- (BOOL)_handleScrollWithDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  mach_absolute_time();
  ScrollEvent = (const void *)IOHIDEventCreateScrollEvent();
  id v7 = [(HNDVirtualHIDMouse *)self eventService];
  unsigned __int8 v8 = [v7 dispatchEvent:ScrollEvent];

  id v9 = ASTLogMouse();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1001155A4(x, y);
  }

  if (ScrollEvent) {
    CFRelease(ScrollEvent);
  }
  return v8;
}

- (BOOL)_handleButtonNumber:(int64_t)a3 isDown:(BOOL)a4
{
  mach_absolute_time();
  dispatch_time_t v6 = +[HNDHandManager sharedManager];
  id v7 = [v6 systemPointerController];
  unsigned __int8 v8 = [(HNDVirtualHIDMouse *)self eventService];
  objc_msgSend(v7, "buttonMaskForSenderID:", objc_msgSend(v8, "serviceID"));

  RelativePointerEvent = (const void *)IOHIDEventCreateRelativePointerEvent();
  v10 = [(HNDVirtualHIDMouse *)self eventService];
  unsigned __int8 v11 = [v10 dispatchEvent:RelativePointerEvent];

  v12 = ASTLogMouse();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = NSStringFromBOOL();
    uint64_t v15 = NSStringFromBOOL();
    int v16 = 134218498;
    int64_t v17 = a3;
    __int16 v18 = 2112;
    dispatch_group_t v19 = v14;
    __int16 v20 = 2112;
    uint64_t v21 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "handleButtonNumber: %li (isDown=%@), success: %@", (uint8_t *)&v16, 0x20u);
  }
  if (RelativePointerEvent) {
    CFRelease(RelativePointerEvent);
  }
  return v11;
}

- (id)propertyForKey:(id)a3 forService:(id)a4
{
  id v5 = a3;
  if (sub_1000A17B4(v5)) {
    [(HNDVirtualHIDMouse *)self dynamicMetaProperties];
  }
  else {
  dispatch_time_t v6 = [(HNDVirtualHIDMouse *)self properties];
  }
  id v7 = [v6 objectForKeyedSubscript:v5];

  return v7;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = ASTLogMouse();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "setProperty: %@, forKey: %@", (uint8_t *)&v14, 0x16u);
  }

  if (sub_1000A17B4(v8))
  {
    v10 = [(HNDVirtualHIDMouse *)self dynamicMetaProperties];
    [v10 setObject:v7 forKeyedSubscript:v8];
  }
  unsigned int v11 = [v8 isEqualToString:@"DeviceOpenedByEventSystem"];
  if (v11)
  {
    v12 = ASTLogMouse();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "device opened by event system!", (uint8_t *)&v14, 2u);
    }

    dispatch_group_leave((dispatch_group_t)self->_waitForOpenGroup);
  }

  return v11;
}

- (id)copyEventMatching:(id)a3 forService:(id)a4
{
  id v4 = a3;
  id v5 = ASTLogMouse();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "copyEventMatching: %@", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (BOOL)setOutputEvent:(id)a3 forService:(id)a4
{
  id v4 = a3;
  id v5 = ASTLogMouse();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "setOutputEvent: %@", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (void)notification:(int64_t)a3 withProperty:(id)a4 forService:(id)a5
{
  id v6 = a4;
  int v7 = ASTLogMouse();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = @"HIDVirtualServiceNotificationTypeTerminated";
    if (a3 == 10) {
      id v8 = @"HIDVirtualServiceNotificationTypeEnumerated";
    }
    id v9 = v8;
    int v10 = 138412546;
    unsigned int v11 = v9;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "notification: %@, property: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (NSMutableDictionary)dynamicMetaProperties
{
  return self->_dynamicMetaProperties;
}

- (HIDVirtualEventService)eventService
{
  return self->_eventService;
}

- (OS_dispatch_group)waitForOpenGroup
{
  return self->_waitForOpenGroup;
}

- (void)setWaitForOpenGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitForOpenGroup, 0);
  objc_storeStrong((id *)&self->_eventService, 0);
  objc_storeStrong((id *)&self->_dynamicMetaProperties, 0);
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)handleMovementWithDelta:(CGPoint)a3
{
  id v3 = a1;
  id v4 = objc_msgSend(a1, "_createHNDMovementEventWithDelta:", a3.x, a3.y);
  LOBYTE(v3) = [v3 handleEvent:v4];

  return (char)v3;
}

+ (BOOL)handleEyeTrackingMovementWithDelta:(CGPoint)a3
{
  id v3 = a1;
  id v4 = objc_msgSend(a1, "_createHNDMovementEventWithDelta:", a3.x, a3.y);
  [v4 setIsEyeTrackingEvent:1];
  LOBYTE(v3) = [v3 handleEvent:v4];

  return (char)v3;
}

+ (BOOL)handleScrollWithDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = objc_alloc_init(HNDEvent);
  [(HNDEvent *)v6 setType:4];
  [(HNDEvent *)v6 setDeltaX:x];
  [(HNDEvent *)v6 setDeltaY:y];
  LOBYTE(a1) = [a1 handleEvent:v6];

  return (char)a1;
}

+ (BOOL)handleButtonNumber:(int64_t)a3 isDown:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 1 && a4)
  {
    int v7 = +[AXOutputManager sharedOutputManager];
    [v7 playMouseClickSound];
  }
  id v8 = objc_alloc_init(HNDEvent);
  id v9 = v8;
  if (v4) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  [(HNDEvent *)v8 setType:v10];
  [(HNDEvent *)v9 setButtonNumber:a3];
  unsigned __int8 v11 = [a1 handleEvent:v9];

  return v11;
}

+ (id)_createHNDMovementEventWithDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = objc_alloc_init(HNDEvent);
  [(HNDEvent *)v5 setType:3];
  [(HNDEvent *)v5 setDeltaX:x];
  [(HNDEvent *)v5 setDeltaY:y];

  return v5;
}

@end