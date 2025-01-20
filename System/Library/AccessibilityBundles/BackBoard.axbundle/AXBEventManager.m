@interface AXBEventManager
+ (id)sharedManager;
- (AXBEventManager)init;
- (BOOL)homeIsDown;
- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5;
- (id)lastRecordPostedThroughHID;
- (id)windowServer;
- (int)systemAppPid;
- (unsigned)clientPortForContextId:(unsigned int)a3;
- (unsigned)contextIdForPosition:(CGPoint)a3 displayId:(unsigned int)a4;
- (unsigned)contextIdHosterForContextId:(unsigned int)a3;
- (unsigned)machPortForPoint:(CGPoint)a3;
- (unsigned)systemEventPort;
- (void)_normalizeEventForContext:(id)a3;
- (void)_processHIDEvent:(__IOHIDEvent *)a3;
- (void)clearLastRecordPostedThrougHID;
- (void)dispatchEventRepresentationToClient:(id)a3;
- (void)postEvent:(id)a3 systemEvent:(BOOL)a4 afterNamedTap:(id)a5 namedTaps:(id)a6;
- (void)registerEventListener:(BOOL)a3;
- (void)setDisableSystemGestureRecognitionInEvents:(BOOL)a3;
- (void)setHomeIsDown:(BOOL)a3;
@end

@implementation AXBEventManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_4);
  }
  v2 = (void *)sharedManager_SharedManager_0;

  return v2;
}

uint64_t __32__AXBEventManager_sharedManager__block_invoke()
{
  sharedManager_SharedManager_0 = objc_alloc_init(AXBEventManager);

  return MEMORY[0x270F9A758]();
}

- (AXBEventManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)AXBEventManager;
  v2 = [(AXBEventManager *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F15920] serverIfRunning];
    v4 = [v3 displays];

    uint64_t v5 = [v4 count];
    if (v5)
    {
      uint64_t v5 = [v4 objectAtIndex:0];
    }
    v6 = (void *)_WindowDisplay;
    _WindowDisplay = v5;

    _AXSystemEventPort = GSGetPurpleSystemEventPort();
    v7 = v2;
  }
  return v2;
}

- (void)registerEventListener:(BOOL)a3
{
  self->_eventListenerEnabled = a3;
}

- (int)systemAppPid
{
  v2 = [MEMORY[0x263F229A0] server];
  int v3 = [v2 pid];

  return v3;
}

- (id)windowServer
{
  return (id)_WindowDisplay;
}

- (unsigned)systemEventPort
{
  unsigned int result = _AXSystemEventPort;
  if (!_AXSystemEventPort)
  {
    unsigned int result = GSGetPurpleSystemEventPort();
    _AXSystemEventPort = result;
  }
  return result;
}

- (void)_processHIDEvent:(__IOHIDEvent *)a3
{
}

- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = (id)_WindowDisplay;
  if (v5)
  {
    v10 = [MEMORY[0x263F15920] server];
    uint64_t v11 = [v10 displayWithDisplayId:v5];

    id v9 = (id)v11;
  }
  if (v6)
  {
    [v9 convertPoint:v6 toContextId:AXRotateToScreen()];
    CGFloat x = v12;
    CGFloat y = v13;
  }

  double v14 = x;
  double v15 = y;
  result.CGFloat y = v15;
  result.CGFloat x = v14;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  double y = a3.y;
  double x = a3.x;
  id v9 = (id)_WindowDisplay;
  if (v5)
  {
    v10 = [MEMORY[0x263F15920] server];
    uint64_t v11 = [v10 displayWithDisplayId:v5];

    id v9 = (id)v11;
  }
  if (v6)
  {
    objc_msgSend(v9, "convertPoint:fromContextId:", v6, x, y);
    double x = v12;
    double y = v13;
  }

  double v14 = x;
  double v15 = y;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (void)_normalizeEventForContext:(id)a3
{
  id v15 = a3;
  BOOL v4 = [v15 type] == 3001;
  uint64_t v5 = v15;
  if (!v4)
  {
    [v15 windowLocation];
    double v6 = AXRotateToScreen();
    uint64_t v8 = objc_msgSend((id)_WindowDisplay, "contextIdAtPosition:", fmax(v6, 0.0), fmax(v7, 0.0));
    id v9 = [v15 handInfo];
    [v15 windowLocation];
    -[AXBEventManager convertPoint:toContextId:displayId:](self, "convertPoint:toContextId:displayId:", v8, 0);
    objc_msgSend(v15, "setWindowLocation:");
    v10 = [v9 paths];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        double v13 = [v9 paths];
        double v14 = [v13 objectAtIndexedSubscript:i];

        [v14 pathLocation];
        -[AXBEventManager convertPoint:toContextId:displayId:](self, "convertPoint:toContextId:displayId:", v8, 0);
        objc_msgSend(v14, "setPathLocation:");
        [v14 setPathWindowContextID:v8];
      }
    }

    uint64_t v5 = v15;
  }
}

- (void)setDisableSystemGestureRecognitionInEvents:(BOOL)a3
{
  self->_overrideGestureRecognitionState = a3;
}

- (void)dispatchEventRepresentationToClient:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[AXBackBoardGlue hidClientConnectionManager];
  double v6 = [v4 fakeTouchScaleEventRepresentation:0];

  uint64_t v7 = [v6 newHIDEventRef];
  if (v7)
  {
    uint64_t v8 = (const void *)v7;
    if ([v6 type] == 3001)
    {
      if (BKSHIDDigitizerEventIsFirstTouchDown())
      {
        IOHIDEventGetTimeStamp();
        if (dispatchEventRepresentationToClient__onceToken != -1) {
          dispatch_once(&dispatchEventRepresentationToClient__onceToken, &__block_literal_global_270);
        }
      }
      id v9 = [v6 handInfo];
      v10 = [v9 paths];
      uint64_t v11 = [v10 firstObject];

      if (v11)
      {
        v57 = 0;
        unsigned int v12 = [v11 pathIndex];
        unsigned int v13 = [MEMORY[0x263F228A8] touchCounter];
        [v11 pathLocation];
        float v15 = v14;
        [v11 pathLocation];
        *(float *)&unsigned int v17 = v16;
        [v11 pathLocation];
        *(float *)&unsigned int v19 = v18;
        [v11 pathLocation];
        float v21 = v20;
        unint64_t v56 = __PAIR64__(v13, v12);
        LODWORD(v58) = 0;
        *((float *)&v58 + 1) = v15;
        unint64_t v59 = __PAIR64__(v19, v17);
        float v60 = v21;
        [v6 contextId];
        BKSHIDEventSetDigitizerInfoWithSubEventInfos();
      }
      else
      {
        [v6 contextId];
        BKSHIDEventSetDigitizerInfo();
      }

      goto LABEL_17;
    }
    [v6 type];
    if (AXEventTypeIsKeyboardKey())
    {
      v23 = [MEMORY[0x263F15920] server];
      v24 = objc_msgSend(v23, "displayWithDisplayId:", objc_msgSend(v6, "displayId"));

      v25 = [v24 uniqueId];
      [v6 contextId];
      BKSHIDEventSetSimpleInfo();

      goto LABEL_17;
    }
    [v6 type];
    if (!AXEventTypeShouldLetBackboardProcess())
    {
LABEL_17:
      unint64_t v56 = 0;
      v57 = &v56;
      uint64_t v58 = 0x2020000000;
      unint64_t v59 = 0;
      if (![v6 contextId])
      {
        v26 = [v6 clientId];
        if (!v26)
        {
          if ([v6 taskPort]) {
            goto LABEL_21;
          }
          v40 = [NSClassFromString(&cfstr_Bksystemshells.isa) safeValueForKey:@"sharedInstance"];
          v26 = [v40 safeValueForKey:@"primarySystemShell"];

          if (!v26)
          {
            v41 = [MEMORY[0x263F213C0] sharedInstance];
            char v42 = [v41 ignoreLogging];

            if ((v42 & 1) == 0)
            {
              v43 = [MEMORY[0x263F213C0] identifier];
              v44 = AXLoggerForFacility();

              os_log_type_t v45 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v44, v45))
              {
                v46 = AXColorizeFormatLog();
                v47 = _AXStringForArgs();
                if (os_log_type_enabled(v44, v45))
                {
                  LODWORD(buf) = 138543362;
                  *(void *)((char *)&buf + 4) = v47;
                  _os_log_impl(&dword_241F5C000, v44, v45, "%{public}@", (uint8_t *)&buf, 0xCu);
                }
              }
            }
          }
          v48 = [v26 safeValueForKey:@"bundleIdentifier"];
          [v6 setClientId:v48];
        }
      }
LABEL_21:
      v27 = [v6 clientId];
      BOOL v28 = v27 == 0;

      if (!v28)
      {
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v54 = 0x2020000000;
        int v55 = 0;
        id v29 = v5;
        id v52 = v6;
        AXPerformSafeBlock();
        int v30 = *(_DWORD *)(*((void *)&buf + 1) + 24);

        _Block_object_dispose(&buf, 8);
        if (v30 >= 1)
        {
          id v51 = v29;
          AXPerformSafeBlock();
        }
      }
      if (v57[3]) {
        goto LABEL_29;
      }
      if (![v6 taskPort] && objc_msgSend(v6, "contextId"))
      {
        v31 = [MEMORY[0x263F15920] serverIfRunning];
        objc_msgSend(v6, "setTaskPort:", objc_msgSend(v31, "taskNamePortOfContextId:", objc_msgSend(v6, "contextId")));
      }
      id v50 = v5;
      id v32 = v6;
      AXPerformSafeBlock();

      if (v57[3])
      {
LABEL_29:
        CFAbsoluteTimeGetCurrent();
        v49 = v6;
        AXPerformSafeBlock();
        IOHIDEventSystemConnectionDispatchEvent();
        CFRelease((CFTypeRef)v57[3]);
        v33 = v49;
      }
      else
      {
        v34 = [MEMORY[0x263F213C0] sharedInstance];
        char v35 = [v34 ignoreLogging];

        if (v35) {
          goto LABEL_31;
        }
        v36 = [MEMORY[0x263F213C0] identifier];
        v33 = AXLoggerForFacility();

        os_log_type_t v37 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v33, v37))
        {
          v38 = AXColorizeFormatLog();
          v39 = _AXStringForArgs();
          if (os_log_type_enabled(v33, v37))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v39;
            _os_log_impl(&dword_241F5C000, v33, v37, "%{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
      }

LABEL_31:
      CFRelease(v8);
      _Block_object_dispose(&v56, 8);
      goto LABEL_32;
    }
    [(AXBEventManager *)self _processHIDEvent:v8];
    CFRelease(v8);
  }
  else
  {
    v22 = AXLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[AXBEventManager dispatchEventRepresentationToClient:]((uint64_t)v6, v22);
    }
  }
LABEL_32:
}

double __55__AXBEventManager_dispatchEventRepresentationToClient___block_invoke()
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    double result = (double)*(unint64_t *)&result / (double)v1 * 0.000000001;
    dispatchEventRepresentationToClient__timeScale = *(void *)&result;
  }
  return result;
}

void __55__AXBEventManager_dispatchEventRepresentationToClient___block_invoke_288(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) clientId];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 pidForBundleID:v3];
}

void __55__AXBEventManager_dispatchEventRepresentationToClient___block_invoke_2(uint64_t a1)
{
  Class v2 = NSClassFromString(&cfstr_Bkshideventdef.isa);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__AXBEventManager_dispatchEventRepresentationToClient___block_invoke_3;
  v4[3] = &__block_descriptor_36_e8_v16__0_8l;
  int v5 = *(_DWORD *)(a1 + 48);
  id v3 = [(objc_class *)v2 build:v4];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) copyClientForDestination:v3];
}

uint64_t __55__AXBEventManager_dispatchEventRepresentationToClient___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setPid:*(unsigned int *)(a1 + 32)];
}

uint64_t __55__AXBEventManager_dispatchEventRepresentationToClient___block_invoke_4(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "copyClientForTaskPort:", objc_msgSend(*(id *)(a1 + 40), "taskPort"));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __55__AXBEventManager_dispatchEventRepresentationToClient___block_invoke_5(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) type] == 3001)
  {
    Class v2 = BKSHIDEventGetDigitizerAttributes();
    id v3 = [v2 pathAttributes];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          [v8 preciseLocationX];
          double v10 = v9;
          [v8 preciseLocationY];
          objc_msgSend(*(id *)(a1 + 40), "convertPoint:fromContextId:displayId:", objc_msgSend(*(id *)(a1 + 32), "contextId"), objc_msgSend(*(id *)(a1 + 32), "displayId"), v10, v11);
          +[AXBackBoardGlue _applyExtendedHitTestInformationForCAScreenCoordinates:displayUUID:toPathAttributes:secureName:excludeContextIDs:](AXBackBoardGlue, "_applyExtendedHitTestInformationForCAScreenCoordinates:displayUUID:toPathAttributes:secureName:excludeContextIDs:", 0, v8, [*(id *)(a1 + 32) secureName], 0, v12, v13);
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);
    }
    BKSHIDEventSetAttributes();
  }
}

- (unsigned)contextIdHosterForContextId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [MEMORY[0x263F15920] serverIfRunning];
  LODWORD(v3) = [v4 contextIdHostingContextId:v3];

  return v3;
}

- (void)postEvent:(id)a3 systemEvent:(BOOL)a4 afterNamedTap:(id)a5 namedTaps:(id)a6
{
  BOOL v8 = a4;
  id v28 = a3;
  double v10 = (NSString *)a5;
  id v11 = a6;
  if ([v28 type] == 3001)
  {
    double v12 = [v28 handInfo];
    if ([v12 eventType] == 2
      || [v12 eventType] == 6
      || [v12 eventType] == 8)
    {
      BOOL v13 = 0;
      int v14 = 0;
    }
    else
    {
      BOOL v13 = [v12 eventType] == 1;
      int v14 = 1;
    }
  }
  else
  {
    BOOL v13 = 0;
    int v14 = 1;
  }
  int v15 = [v28 type];
  long long v16 = 0;
  if (v15 <= 3000)
  {
    long long v17 = v28;
    if (((v15 - 1000) > 0x33 || ((1 << (v15 + 24)) & 0xFFC007E603FC3) == 0)
      && (v15 - 10) >= 3)
    {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  long long v17 = v28;
  if ((v15 - 4000) < 2 || v15 == 3001)
  {
LABEL_11:
    uint64_t v18 = [v17 newHIDEventRef];
    long long v17 = v28;
    long long v16 = (const void *)v18;
  }
LABEL_12:
  if ([v17 type] == 50)
  {
    uint64_t v19 = [(AXBEventManager *)self systemEventPort];
    uint64_t v20 = 1;
  }
  else
  {
    if (v16) {
      int v21 = 0;
    }
    else {
      int v21 = v14;
    }
    if (v21 == 1)
    {
      if (v8)
      {
        uint64_t v22 = [(AXBEventManager *)self systemEventPort];
      }
      else
      {
        [v28 windowLocation];
        uint64_t v22 = -[AXBEventManager machPortForPoint:](self, "machPortForPoint:");
      }
      uint64_t v19 = v22;
      if (v13)
      {
        uint64_t v20 = 0;
        postEvent_systemEvent_afterNamedTap_namedTaps__DownPort = v22;
      }
      else
      {
        uint64_t v20 = 0;
      }
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v19 = postEvent_systemEvent_afterNamedTap_namedTaps__DownPort;
    }
  }
  +[AXBackBoardGlue sendUserEventOccurred];
  -[AXBEventManager setHomeIsDown:](self, "setHomeIsDown:", [v28 type] == 1000);
  if (!v11 && v16)
  {
    v23 = (AXEventRepresentation *)[v28 copy];
    lastHIDRecord = self->_lastHIDRecord;
    self->_lastHIDRecord = v23;

    if (!IOHIDEventGetSenderID())
    {
      IOHIDEventSetSenderID();
      NSLog(&cfstr_NoIohidsenderi.isa, v28);
    }
    [(AXBEventManager *)self _processHIDEvent:v16];
LABEL_35:
    CFRelease(v16);
    goto LABEL_36;
  }
  if (!v8) {
    [(AXBEventManager *)self _normalizeEventForContext:v28];
  }
  [v28 setTaskPort:v19];
  v25 = [MEMORY[0x263F228B0] sharedManager];
  v26 = v25;
  eventTapIdentifier = v10;
  if (!v10) {
    eventTapIdentifier = self->_eventTapIdentifier;
  }
  [v25 sendEvent:v28 afterTap:eventTapIdentifier useGSEvent:v16 == 0 namedTaps:v11 options:v20];

  if (v16) {
    goto LABEL_35;
  }
LABEL_36:
}

- (id)lastRecordPostedThroughHID
{
  return self->_lastHIDRecord;
}

- (void)clearLastRecordPostedThrougHID
{
  self->_lastHIDRecord = 0;
  MEMORY[0x270F9A758]();
}

- (unsigned)clientPortForContextId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [MEMORY[0x263F15920] serverIfRunning];
  LODWORD(v3) = [v4 clientPortOfContextId:v3];

  return v3;
}

- (unsigned)contextIdForPosition:(CGPoint)a3 displayId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  double v5 = AXRotateToScreen();
  double v7 = v6;
  id v8 = (id)_WindowDisplay;
  if (v4)
  {
    double v9 = [MEMORY[0x263F15920] server];
    uint64_t v10 = [v9 displayWithDisplayId:v4];

    id v8 = (id)v10;
  }
  unsigned int v11 = objc_msgSend(v8, "contextIdAtPosition:", v5, v7);

  return v11;
}

- (unsigned)machPortForPoint:(CGPoint)a3
{
  unsigned int result = [(id)_WindowDisplay clientPortAtPosition:AXRotateToScreen()];
  if (!result)
  {
    return [(AXBEventManager *)self systemEventPort];
  }
  return result;
}

- (BOOL)homeIsDown
{
  return self->_homeIsDown;
}

- (void)setHomeIsDown:(BOOL)a3
{
  self->_homeIsDown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastHIDRecord, 0);

  objc_storeStrong((id *)&self->_eventTapIdentifier, 0);
}

- (void)dispatchEventRepresentationToClient:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_241F5C000, a2, OS_LOG_TYPE_ERROR, "Could not create an event ref from: %@", (uint8_t *)&v2, 0xCu);
}

@end