@interface SCATAssistiveTouchServerInstance
+ (id)serverInstance;
- (AXEventProcessor)eventProcessor;
- (BSInvalidatable)virtualMouseClient;
- (SCATAssistiveTouchServerInstance)init;
- (id)_initServer;
- (id)closeMenu:(id)a3;
- (id)currentBubbleElement:(id)a3;
- (id)getMenuItemPosition:(id)a3;
- (id)getNubbitPosition:(id)a3;
- (id)getPointerPosition:(id)a3;
- (id)home:(id)a3;
- (id)isMenuOpen:(id)a3;
- (id)menuAction:(id)a3;
- (id)menuItems:(id)a3;
- (id)openMenu:(id)a3;
- (id)pointerClick:(id)a3;
- (id)setNubbitPosition:(id)a3;
- (id)setPointerPosition:(id)a3;
- (id)tapMenuItem:(id)a3;
- (id)virtualPointer:(id)a3;
- (void)dealloc;
- (void)setEventProcessor:(id)a3;
- (void)setVirtualMouseClient:(id)a3;
@end

@implementation SCATAssistiveTouchServerInstance

- (SCATAssistiveTouchServerInstance)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCATAssistiveTouchServerInstance;
  v2 = [(SCATAssistiveTouchServerInstance *)&v5 init];
  virtualMouse = v2->_virtualMouse;
  v2->_virtualMouse = 0;

  return v2;
}

+ (id)serverInstance
{
  if (qword_1001F0B00 != -1) {
    dispatch_once(&qword_1001F0B00, &stru_1001AD1D8);
  }
  v2 = (void *)qword_1001F0AF8;

  return v2;
}

- (id)_initServer
{
  v13.receiver = self;
  v13.super_class = (Class)SCATAssistiveTouchServerInstance;
  v2 = [(SCATAssistiveTouchServerInstance *)&v13 init];
  if (v2)
  {
    id v3 = +[SCATAssistiveTouchWorkspace sharedWorkspace];
    id v4 = objc_alloc((Class)AXIPCServer);
    objc_super v5 = (AXIPCServer *)[v4 initWithServiceName:AXAssistiveTouchServerServiceName perPidService:0];
    server = v2->_server;
    v2->_server = v5;

    v7 = v2->_server;
    id v12 = 0;
    [(AXIPCServer *)v7 startServerWithError:&v12];
    id v8 = v12;
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "home:", 6002, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "getNubbitPosition:", 6023, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "setNubbitPosition:", 6024, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "openMenu:", 6020, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "closeMenu:", 6021, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "isMenuOpen:", 6022, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "menuItems:", 6025, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "tapMenuItem:", 6026, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "menuAction:", 6027, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "getMenuItemPosition:", 6033, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "virtualPointer:", 6028, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "getPointerPosition:", 6029, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "setPointerPosition:", 6030, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "pointerClick:", 6032, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "currentBubbleElement:", 6031, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    if (v8)
    {
      v9 = ASTLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100113A88((uint64_t)v8, v9);
      }
    }
    v10 = v2;
  }
  return v2;
}

- (void)dealloc
{
  [(AXIPCServer *)self->_server removeAllHandlersForTarget:self];
  v3.receiver = self;
  v3.super_class = (Class)SCATAssistiveTouchServerInstance;
  [(SCATAssistiveTouchServerInstance *)&v3 dealloc];
}

- (id)home:(id)a3
{
  objc_super v3 = +[AXPISystemActionHelper sharedInstance];
  [v3 activateHomeButton];

  id v4 = [objc_alloc((Class)AXIPCMessage) initWithKey:6002 payload:&off_1001BC210];

  return v4;
}

- (id)getNubbitPosition:(id)a3
{
  objc_super v3 = +[HNDHandManager sharedManager];
  id v4 = [v3 mainDisplayManager];

  objc_super v5 = [v4 rocker];
  [v5 center];
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  id v10 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v16 = @"result";
  v15[0] = v7;
  v15[1] = v9;
  v11 = +[NSValue valueWithBytes:v15 objCType:"{CGPoint=dd}"];
  v17 = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  id v13 = [v10 initWithKey:6023 payload:v12];

  return v13;
}

- (id)setNubbitPosition:(id)a3
{
  objc_super v3 = [a3 payload];
  id v4 = [v3 objectForKey:@"action"];
  [v4 CGPointValue];
  double v6 = v5;
  double v8 = v7;

  uint64_t v9 = +[HNDHandManager sharedManager];
  id v10 = [v9 mainDisplayManager];

  objc_msgSend(v10, "moveNubbitToPoint:", v6, v8);
  id v11 = [objc_alloc((Class)AXIPCMessage) initWithKey:6024 payload:&off_1001BC238];

  return v11;
}

- (id)openMenu:(id)a3
{
  objc_super v3 = +[HNDHandManager sharedManager];
  id v4 = [v3 mainDisplayManager];

  [v4 showMenu:1];
  id v5 = [objc_alloc((Class)AXIPCMessage) initWithKey:6020 payload:&__NSDictionary0__struct];

  return v5;
}

- (id)closeMenu:(id)a3
{
  objc_super v3 = +[HNDHandManager sharedManager];
  id v4 = [v3 mainDisplayManager];

  [v4 showMenu:0];
  id v5 = [objc_alloc((Class)AXIPCMessage) initWithKey:6021 payload:&__NSDictionary0__struct];

  return v5;
}

- (id)isMenuOpen:(id)a3
{
  objc_super v3 = +[HNDHandManager sharedManager];
  id v4 = [v3 mainDisplayManager];

  id v5 = [v4 isMenuVisible];
  id v6 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v11 = @"result";
  double v7 = +[NSNumber numberWithBool:v5];
  id v12 = v7;
  double v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  id v9 = [v6 initWithKey:6022 payload:v8];

  return v9;
}

- (id)menuItems:(id)a3
{
  objc_super v3 = +[HNDHandManager sharedManager];
  id v4 = [v3 mainDisplayManager];

  v21 = v4;
  id v5 = [v4 rocker];
  id v6 = [v5 currentlyVisibleRockerItems];

  id v7 = objc_alloc_init((Class)NSMutableString);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v13 = [v12 title];
        v14 = [v12 type];
        v15 = +[NSString stringWithFormat:@"%@#%@", v13, v14];

        if ([v7 length]) {
          [v7 appendString:@"|"];
        }
        [v7 appendString:v15];
      }
      id v9 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v9);
  }

  id v16 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v27 = @"result";
  id v17 = [v7 copy];
  id v28 = v17;
  v18 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  id v19 = [v16 initWithKey:6025 payload:v18];

  return v19;
}

- (id)tapMenuItem:(id)a3
{
  objc_super v3 = [a3 payload];
  id v4 = [v3 objectForKey:@"action"];

  id v5 = +[HNDHandManager sharedManager];
  id v6 = [v5 mainDisplayManager];

  id v7 = [v6 rocker];
  id v8 = [v7 currentlyVisibleRockerItems];

  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  id v19 = sub_100083620;
  v20 = &unk_1001AD200;
  id v21 = v4;
  id v9 = v4;
  id v10 = [v8 indexOfObjectPassingTest:&v17];
  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    CFStringRef v11 = objc_msgSend(v8, "objectAtIndex:", v10, v17, v18, v19, v20, v21);
    [v11 performPress:1];
    [v11 performPress:0];
  }
  id v12 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v22 = @"result";
  id v13 = +[NSNumber numberWithBool:v10 != (id)0x7FFFFFFFFFFFFFFFLL];
  long long v23 = v13;
  v14 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  id v15 = [v12 initWithKey:6026 payload:v14];

  return v15;
}

- (id)menuAction:(id)a3
{
  objc_super v3 = [a3 payload];
  id v4 = [v3 objectForKey:@"action"];

  id v5 = +[HNDHandManager sharedManager];
  id v6 = [v5 mainDisplayManager];

  [v6 activateAssistiveTouchAction:v4 fromButtonPress:0];
  id v7 = [objc_alloc((Class)AXIPCMessage) initWithKey:6027 payload:&off_1001BC260];

  return v7;
}

- (id)getMenuItemPosition:(id)a3
{
  objc_super v3 = [a3 payload];
  id v4 = [v3 objectForKey:@"action"];
  id v5 = [v4 stringValue];

  id v6 = +[HNDHandManager sharedManager];
  id v7 = [v6 mainDisplayManager];

  id v8 = [v7 rocker];
  id v9 = [v8 currentlyVisibleRockerItems];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000839DC;
  v29[3] = &unk_1001AD200;
  id v30 = v5;
  id v10 = v5;
  id v11 = [v9 indexOfObjectPassingTest:v29];
  double v12 = -1.0;
  double v13 = -1.0;
  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = [v9 objectAtIndex:v11];
    [v14 center];
    double v16 = v15;
    double v18 = v17;
    id v19 = [v7 rocker];
    v20 = [v7 window];
    objc_msgSend(v19, "convertPoint:toView:", v20, v16, v18);
    double v12 = v21;
    double v13 = v22;
  }
  id v23 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v31 = @"result";
  *(double *)id v28 = v12;
  *(double *)&v28[1] = v13;
  long long v24 = +[NSValue valueWithBytes:v28 objCType:"{CGPoint=dd}"];
  v32 = v24;
  long long v25 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  id v26 = [v23 initWithKey:6033 payload:v25];

  return v26;
}

- (id)virtualPointer:(id)a3
{
  id v4 = [a3 payload];
  id v5 = [v4 objectForKey:@"action"];
  unsigned int v6 = [v5 BOOLValue];

  id v7 = +[HNDDeviceManager sharedManager];
  id v8 = +[SCATAssistiveTouchWorkspace sharedWorkspace];
  if (v6)
  {
    id v9 = (HNDMouseDevice *)objc_opt_new();
    virtualMouse = self->_virtualMouse;
    self->_virtualMouse = v9;

    [v7 addDevice:self->_virtualMouse];
    [(HNDDevice *)self->_virtualMouse setDelegate:v8];
    id v11 = +[HNDHandManager sharedManager];
    double v12 = [v11 systemPointerController];
    [v12 addPointerStreamObserver:v8];

    double v13 = +[NSString stringWithFormat:@"AXAutomation"];
    v14 = +[HNDVirtualHIDMouse addActiveClientWithReason:v13];
    [(SCATAssistiveTouchServerInstance *)self setVirtualMouseClient:v14];
  }
  else
  {
    double v15 = +[HNDHandManager sharedManager];
    double v16 = [v15 systemPointerController];
    [v16 removePointerStreamObserver:v8];

    [v7 removeDevice:self->_virtualMouse];
    double v13 = [(SCATAssistiveTouchServerInstance *)self virtualMouseClient];
    [v13 invalidate];
  }

  id v17 = [objc_alloc((Class)AXIPCMessage) initWithKey:6028 payload:&off_1001BC288];

  return v17;
}

- (id)getPointerPosition:(id)a3
{
  objc_super v3 = +[HNDHandManager sharedManager];
  id v4 = [v3 systemPointerController];
  [v4 currentSystemPointerPoint];
  uint64_t v6 = v5;
  uint64_t v8 = v7;

  id v9 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v15 = @"result";
  v14[0] = v6;
  v14[1] = v8;
  id v10 = +[NSValue valueWithBytes:v14 objCType:"{CGPoint=dd}"];
  double v16 = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  id v12 = [v9 initWithKey:6029 payload:v11];

  return v12;
}

- (id)setPointerPosition:(id)a3
{
  objc_super v3 = [a3 payload];
  id v4 = [v3 objectForKey:@"action"];
  [v4 axCGPointValue];
  double v6 = v5;
  double v8 = v7;

  id v9 = +[HNDHandManager sharedManager];
  id v10 = [v9 systemPointerController];
  [v10 currentSystemPointerPoint];
  double v12 = v11;
  double v14 = v13;

  BOOL v15 = +[HNDVirtualHIDMouse handleMovementWithDelta:](HNDVirtualHIDMouse, "handleMovementWithDelta:", v6 - v12, v8 - v14);
  [v9 _startDwellTimer];
  id v16 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v21 = @"result";
  id v17 = +[NSNumber numberWithBool:v15];
  double v22 = v17;
  double v18 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v19 = [v16 initWithKey:6030 payload:v18];

  return v19;
}

- (id)pointerClick:(id)a3
{
  objc_super v3 = +[HNDHandManager sharedManager];
  id v4 = [v3 systemPointerController];
  [v4 currentSystemPointerPoint];
  double v6 = v5;
  double v8 = v7;

  id v9 = objc_alloc_init(HNDEvent);
  [(HNDEvent *)v9 setType:1];
  [(HNDEvent *)v9 setActionOverride:AXAssistiveTouchIconTypeMousePrimaryClick];
  -[HNDEvent setLocation:](v9, "setLocation:", v6, v8);
  [v3 handleButtonEvent:v9];
  [(HNDEvent *)v9 setType:2];
  [v3 handleButtonEvent:v9];
  id v10 = [objc_alloc((Class)AXIPCMessage) initWithKey:6032 payload:&off_1001BC2B0];

  return v10;
}

- (id)currentBubbleElement:(id)a3
{
  objc_super v3 = +[HNDHandManager sharedManager];
  id v4 = [v3 currentBubbleModeFocusedElement];
  double v5 = v4;
  if (v4)
  {
    double v6 = [v4 uiElement];
    id v7 = [v6 axElement];

    if (v7)
    {
      Data = (void *)_AXUIElementCreateData();
      id v9 = objc_alloc((Class)AXIPCMessage);
      CFStringRef v15 = @"result";
      id v16 = Data;
      id v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      id v11 = [v9 initWithKey:6031 payload:v10];

      goto LABEL_7;
    }
    id v12 = objc_alloc((Class)AXIPCMessage);
    uint64_t v13 = 6501;
  }
  else
  {
    id v12 = objc_alloc((Class)AXIPCMessage);
    uint64_t v13 = 6031;
  }
  id v11 = [v12 initWithKey:v13 payload:0];
LABEL_7:

  return v11;
}

- (AXEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setEventProcessor:(id)a3
{
}

- (BSInvalidatable)virtualMouseClient
{
  return self->_virtualMouseClient;
}

- (void)setVirtualMouseClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualMouseClient, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);
  objc_storeStrong((id *)&self->_virtualMouse, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

@end