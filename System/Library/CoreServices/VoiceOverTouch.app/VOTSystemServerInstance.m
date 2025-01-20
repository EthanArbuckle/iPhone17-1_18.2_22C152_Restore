@interface VOTSystemServerInstance
+ (id)serverInstance;
- (id)_initServer;
- (id)currentCursorFrame:(id)a3;
- (id)currentRotorName:(id)a3;
- (id)isBluetoothBrailleDisplayConnected:(id)a3;
- (id)isBrailleInputUIShowing:(id)a3;
- (id)isBrailleScreenInputInScreenAwayMode:(id)a3;
- (id)isHandwritingInputUIShowing:(id)a3;
- (id)isScreenCurtainEnabled:(id)a3;
- (id)lastScreenChange:(id)a3;
- (id)lastSoundsPlayed:(id)a3;
- (id)lastSpokenContents:(id)a3;
- (id)lastSpokenPhrases:(id)a3;
- (id)tutorialRecognizedGesture:(id)a3;
- (id)voiceOverCommandTriggered:(id)a3;
- (id)voiceOverCurrentFocusedElement:(id)a3;
- (id)voiceOverEventCommandTriggered:(id)a3;
- (id)voiceOverGestureTriggered:(id)a3;
- (void)_modifyRotorItems:(id)a3 shouldEnable:(BOOL)a4;
- (void)_updateRotorsForElementWithErrorMessage:(id *)a3;
- (void)dealloc;
- (void)handleAutomationTestingCommand:(id)a3 completion:(id)a4;
- (void)voiceOverTutorialEventCommandTriggered:(id)a3;
@end

@implementation VOTSystemServerInstance

+ (id)serverInstance
{
  if (qword_1001EBD10 != -1) {
    dispatch_once(&qword_1001EBD10, &stru_1001B7048);
  }
  v2 = (void *)qword_1001EBD08;

  return v2;
}

- (id)_initServer
{
  v11.receiver = self;
  v11.super_class = (Class)VOTSystemServerInstance;
  v2 = [(VOTSystemServerInstance *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)AXIPCServer);
    v4 = (AXIPCServer *)[v3 initWithServiceName:AXVoiceOverServerServiceName perPidService:0];
    server = v2->_server;
    v2->_server = v4;

    v6 = v2->_server;
    id v10 = 0;
    [(AXIPCServer *)v6 startServerWithError:&v10];
    id v7 = v10;
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "voiceOverCommandTriggered:", 7000, @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.api", @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "voiceOverGestureTriggered:", 7010, @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.api", @"com.apple.accessibility.AccessibilityUIServer", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "voiceOverEventCommandTriggered:", 7013, @"com.apple.accessibility.BackBoard", @"com.apple.accessibility.api", @"com.apple.accessibility.AccessibilityUIServer", @"com.apple.AXUIViewService", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "voiceOverCurrentFocusedElement:", 7001, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "lastSpokenPhrases:", 7002, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "lastSpokenContents:", 7008, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "lastSoundsPlayed:", 7005, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "currentRotorName:", 7003, @"com.apple.accessibility.api", @"com.apple.AXUIViewService", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "lastScreenChange:", 7004, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "isBrailleInputUIShowing:", 7006, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "isHandwritingInputUIShowing:", 7009, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "isScreenCurtainEnabled:", 7012, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "isBluetoothBrailleDisplayConnected:", 7011, @"com.apple.accessibility.SpringBoard", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "handleAutomationTestingCommand:completion:", 1, 7007, @"com.apple.accessibility.api", 0 selector async forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "tutorialRecognizedGesture:", 7014, @"com.apple.accessibility.api", @"com.apple.AXUIViewService", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "isBrailleScreenInputInScreenAwayMode:", 7015, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    [(AXIPCServer *)v2->_server setHandlerWithTarget:v2, "currentCursorFrame:", 7016, @"com.apple.accessibility.api", 0 selector forKey possibleRequiredEntitlements];
    if (v7) {
      NSLog(@"error: %@", v7);
    }
    v8 = v2;
  }
  return v2;
}

- (void)dealloc
{
  [(AXIPCServer *)self->_server removeAllHandlersForTarget:self];
  v3.receiver = self;
  v3.super_class = (Class)VOTSystemServerInstance;
  [(VOTSystemServerInstance *)&v3 dealloc];
}

- (id)lastScreenChange:(id)a3
{
  id v3 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v8 = @"result";
  v4 = [(id)VOTSharedWorkspace lastScreenChangeTime];
  v9 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v6 = [v3 initWithKey:7004 payload:v5];

  return v6;
}

- (id)lastSoundsPlayed:(id)a3
{
  id v3 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v8 = @"result";
  v4 = +[VOTOutputManager previousSoundsPlayed];
  v9 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v6 = [v3 initWithKey:7005 payload:v5];

  return v6;
}

- (id)lastSpokenPhrases:(id)a3
{
  v21 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = +[VOTOutputRequest previousRequests];
  id v3 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v7 = +[NSMutableString string];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        CFStringRef v8 = [v6 outputActions];
        id v9 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v23;
          do
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
              v14 = [v13 string];
              if ([v14 length] && !objc_msgSend(v13, "component"))
              {
                if ([v7 length]) {
                  [v7 appendString:@" "];
                }
                [v7 appendString:v14];
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
          }
          while (v10);
        }

        [v21 axSafelyAddObject:v7];
      }
      id v4 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v4);
  }

  id v15 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v30 = @"result";
  v31 = v21;
  v16 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  id v17 = [v15 initWithKey:7002 payload:v16];

  return v17;
}

- (id)lastSpokenContents:(id)a3
{
  id v3 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = +[VOTOutputRequest previousRequests];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  id v10 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v18 = @"result";
  v19 = v3;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  id v12 = [v10 initWithKey:7008 payload:v11];

  return v12;
}

- (id)currentRotorName:(id)a3
{
  id v4 = objc_msgSend((id)VOTSharedWorkspace, "currentElement", a3);
  id v5 = [(id)VOTSharedWorkspace elementManager];
  id v6 = [v5 elementRotor];
  uint64_t v7 = [v6 currentRotorElement];
  unsigned __int8 v8 = [v4 isEqual:v7];

  if ((v8 & 1) == 0) {
    [(VOTSystemServerInstance *)self _updateRotorsForElementWithErrorMessage:0];
  }
  id v9 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v14 = @"result";
  id v10 = [(id)VOTSharedWorkspace currentElementRotorString];
  long long v15 = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v12 = [v9 initWithKey:7001 payload:v11];

  return v12;
}

- (id)voiceOverCurrentFocusedElement:(id)a3
{
  id v3 = objc_msgSend((id)VOTSharedWorkspace, "currentElement", a3);
  id v4 = [v3 uiElement];
  id v5 = [v4 axElement];

  if (v5)
  {
    Data = (void *)_AXUIElementCreateData();
    id v7 = objc_alloc((Class)AXIPCMessage);
    CFStringRef v11 = @"result";
    id v12 = Data;
    unsigned __int8 v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v9 = [v7 initWithKey:7001 payload:v8];
  }
  else
  {
    id v9 = [objc_alloc((Class)AXIPCMessage) initWithKey:7001 payload:0];
  }

  return v9;
}

- (id)voiceOverGestureTriggered:(id)a3
{
  id v3 = [a3 payload];
  id v4 = [v3 objectForKey:@"gesture"];

  id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0];
  if (v5)
  {
    id v6 = +[VOTWorkspace sharedWorkspace];
    id v7 = [v6 userCommandManager];

    unsigned __int8 v8 = +[VOSCommandResolver resolverForCurrentHost];
    id v9 = [v7 eventForTouchGesture:v5 resolver:v8];

    [(id)VOTSharedWorkspace dispatchCommand:v9];
  }
  id v10 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v15 = @"result";
  CFStringRef v11 = +[NSNumber numberWithBool:v5 != 0];
  long long v16 = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  id v13 = [v10 initWithKey:7010 payload:v12];

  return v13;
}

- (void)voiceOverTutorialEventCommandTriggered:(id)a3
{
  id v24 = a3;
  if ([v24 isEqualToString:@"VO.Tutorial.Activate"])
  {
    id v3 = +[VOTWorkspace sharedWorkspace];
    id v4 = [v3 elementManager];
    id v5 = v4;
    uint64_t v6 = 1;
LABEL_5:
    [v4 setTutorialListeningForGestureNotifications:v6];
    goto LABEL_6;
  }
  if ([v24 isEqualToString:@"VO.Tutorial.Deactivate"])
  {
    id v3 = +[VOTWorkspace sharedWorkspace];
    id v4 = [v3 elementManager];
    id v5 = v4;
    uint64_t v6 = 0;
    goto LABEL_5;
  }
  unsigned int v7 = [v24 isEqualToString:@"VO.Tutorial.Reset"];
  unsigned __int8 v8 = +[VOTWorkspace sharedWorkspace];
  id v9 = [v8 elementManager];
  id v10 = v9;
  if (v7)
  {
    [v9 setTutorialActiveRestrictionType:0];

    id v3 = +[VOTWorkspace sharedWorkspace];
    id v5 = [v3 elementManager];
    [v5 setTutorialRestrictedCommands:0];
    goto LABEL_6;
  }
  CFStringRef v11 = [v9 tutorialRestrictedCommands];

  if (!v11)
  {
    id v12 = +[VOTWorkspace sharedWorkspace];
    id v13 = [v12 elementManager];
    id v14 = objc_alloc_init((Class)NSMutableArray);
    [v13 setTutorialRestrictedCommands:v14];
  }
  if ([v24 containsString:@"VO.Tutorial.Deny"])
  {
    id v3 = [v24 substringFromIndex:objc_msgSend(@"VO.Tutorial.Deny", "length")];
    CFStringRef v15 = +[VOTWorkspace sharedWorkspace];
    long long v16 = [v15 elementManager];
    long long v17 = [v16 tutorialRestrictedCommands];
    [v17 addObject:v3];

    id v5 = +[VOTWorkspace sharedWorkspace];
    CFStringRef v18 = [v5 elementManager];
    v19 = v18;
    uint64_t v20 = 1;
LABEL_17:
    [v18 setTutorialActiveRestrictionType:v20];

    goto LABEL_6;
  }
  if ([v24 containsString:@"VO.Tutorial.Allow"])
  {
    id v3 = [v24 substringFromIndex:objc_msgSend(@"VO.Tutorial.Allow", "length")];
    v21 = +[VOTWorkspace sharedWorkspace];
    long long v22 = [v21 elementManager];
    long long v23 = [v22 tutorialRestrictedCommands];
    [v23 addObject:v3];

    id v5 = +[VOTWorkspace sharedWorkspace];
    CFStringRef v18 = [v5 elementManager];
    v19 = v18;
    uint64_t v20 = 2;
    goto LABEL_17;
  }
  id v3 = +[VOTWorkspace sharedWorkspace];
  id v5 = [v3 elementManager];
  [v5 setTutorialPage:v24];
LABEL_6:
}

- (id)voiceOverEventCommandTriggered:(id)a3
{
  id v4 = [a3 payload];
  id v5 = [v4 objectForKey:@"eventCommand"];

  if ([v5 containsString:@"VO.Tutorial"])
  {
    [(VOTSystemServerInstance *)self voiceOverTutorialEventCommandTriggered:v5];
    id v6 = [objc_alloc((Class)AXIPCMessage) initWithKey:7013 payload:&off_1001C70F0];
  }
  else
  {
    id v7 = [v5 length];
    if (v7)
    {
      unsigned __int8 v8 = +[VOTEvent systemServerEventWithCommand:v5 info:0];
      [(id)VOTSharedWorkspace dispatchCommand:v8];
    }
    id v9 = objc_alloc((Class)AXIPCMessage);
    CFStringRef v13 = @"result";
    id v10 = +[NSNumber numberWithBool:v7 != 0];
    id v14 = v10;
    CFStringRef v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v6 = [v9 initWithKey:7013 payload:v11];
  }

  return v6;
}

- (id)voiceOverCommandTriggered:(id)a3
{
  id v3 = a3;
  id v4 = [v3 payload];
  id v5 = [v4 objectForKey:@"command"];
  uint64_t v6 = (int)[v5 intValue];

  id v7 = [objc_allocWithZone((Class)AXIndexMap) init];
  LOBYTE(v50) = 1;
  _AXLogWithFacility();
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  switch(v6)
  {
    case 1:
    case 48:
      id v10 = (id *)&kVOTEventCommandToggleMute;
      goto LABEL_71;
    case 2:
      id v10 = (id *)&kVOTEventCommandToggleScreenCurtain;
      goto LABEL_71;
    case 3:
      id v10 = (id *)&kVOTEventCommandScrollUpPage;
      goto LABEL_71;
    case 4:
      id v10 = (id *)&kVOTEventCommandScrollDownPage;
      goto LABEL_71;
    case 5:
      id v10 = (id *)&kVOTEventCommandScrollLeftPage;
      goto LABEL_71;
    case 6:
      id v10 = (id *)&kVOTEventCommandScrollRightPage;
      goto LABEL_71;
    case 7:
      id v10 = (id *)&kVOTEventCommandOutputElementSummary;
      goto LABEL_71;
    case 8:
      id v10 = (id *)&kVOTEventCommandPreviousElement;
      goto LABEL_71;
    case 9:
      id v10 = (id *)&kVOTEventCommandNextElement;
      goto LABEL_71;
    case 10:
      id v10 = (id *)&kVOTEventCommandFirstElement;
      goto LABEL_71;
    case 11:
      id v10 = (id *)&kVOTEventCommandLastElement;
      goto LABEL_71;
    case 12:
      id v10 = (id *)&kVOTEventCommandMoveToStatusBar;
      goto LABEL_71;
    case 13:
      id v10 = (id *)&kVOTEventCommandEscape;
      goto LABEL_71;
    case 14:
      id v10 = (id *)&kVOTEventCommandSearchRotorRight;
      goto LABEL_71;
    case 15:
      id v10 = (id *)&kVOTEventCommandSearchRotorLeft;
      goto LABEL_71;
    case 16:
      id v10 = (id *)&kVOTEventCommandSearchRotorUp;
      goto LABEL_71;
    case 17:
      id v10 = (id *)&kVOTEventCommandSearchRotorDown;
      goto LABEL_71;
    case 18:
      id v10 = (id *)&kVOTEventCommandItemChooser;
      goto LABEL_71;
    case 19:
      id v10 = (id *)&kVOTEventCommandSimpleTap;
      goto LABEL_71;
    case 20:
      id v10 = (id *)&kVOTEventCommandPauseSpeaking;
      goto LABEL_71;
    case 21:
      id v10 = (id *)&kVOTEventCommandToggleCrownNaviation;
      goto LABEL_71;
    case 22:
      CFStringRef v11 = +[VOTKeyboardManager keyboardManager];
      unsigned int v12 = [v11 isQuickNavOn];

      if (!v12) {
        goto LABEL_51;
      }
      goto LABEL_26;
    case 23:
      CFStringRef v13 = +[VOTKeyboardManager keyboardManager];
      unsigned __int8 v14 = [v13 isQuickNavOn];

      if (v14) {
        goto LABEL_51;
      }
LABEL_26:
      id v10 = (id *)&kVOTEventCommandToggleQuickNav;
      goto LABEL_71;
    case 24:
      CFStringRef v15 = objc_msgSend(v3, "payload", v50, @"Got command %d", v6);
      long long v16 = [v15 objectForKey:@"argument"];

      if ([v16 count] != (id)2) {
        goto LABEL_34;
      }
      long long v17 = [v16 objectAtIndexedSubscript:0];
      [v17 pointValue];
      double x = v18;
      double y = v19;

      uint64_t v20 = [v16 objectAtIndexedSubscript:1];
      v21 = (id *)&kVOTEventCommandTouchDown;
      goto LABEL_33;
    case 25:
      long long v22 = objc_msgSend(v3, "payload", v50, @"Got command %d", v6);
      long long v16 = [v22 objectForKey:@"argument"];

      if ([v16 count] != (id)2) {
        goto LABEL_34;
      }
      long long v23 = [v16 objectAtIndexedSubscript:0];
      [v23 pointValue];
      double x = v24;
      double y = v25;

      uint64_t v20 = [v16 objectAtIndexedSubscript:1];
      v21 = (id *)&kVOTEventCommandTouchMove;
      goto LABEL_33;
    case 26:
      long long v26 = objc_msgSend(v3, "payload", v50, @"Got command %d", v6);
      long long v16 = [v26 objectForKey:@"argument"];

      if ([v16 count] == (id)1)
      {
        uint64_t v20 = [v16 objectAtIndexedSubscript:0];
        v21 = (id *)&kVOTEventCommandTouchUp;
LABEL_33:
        id v27 = *v21;

LABEL_38:
        id v29 = [objc_allocWithZone((Class)AXIndexMap) init];
        [v29 setObject:v20 forIndex:114];
        CFStringRef v30 = +[VOTEvent systemServerEventWithCommand:v27 info:v29];
        objc_msgSend(v30, "setTouchPoint:", x, y);
        [(id)VOTSharedWorkspace dispatchCommand:v30];

        goto LABEL_73;
      }
LABEL_34:

LABEL_51:
      uint64_t v20 = 0;
      id v27 = 0;
      goto LABEL_77;
    case 27:
      long long v28 = (id *)&kVOTEventCommandTouchCancel;
      goto LABEL_37;
    case 28:
      long long v28 = (id *)&kVOTEventCommandStartStopToggle;
LABEL_37:
      id v27 = *v28;
      uint64_t v20 = 0;
      goto LABEL_38;
    case 29:
      id v10 = (id *)&kVOTEventCommandCopySpeechToClipboard;
      goto LABEL_71;
    case 30:
      v31 = objc_msgSend(v3, "payload", v50, @"Got command %d", v6);
      v32 = [v31 objectForKey:@"argument"];

      if ([v32 length])
      {
        id v27 = kVOTEventCommandAnnouncement;
        [v7 setObject:v32 forIndex:116];
      }
      else
      {
        id v27 = 0;
      }
      goto LABEL_75;
    case 31:
      v33 = objc_msgSend(v3, "payload", v50, @"Got command %d", v6);
      v34 = [v33 objectForKey:@"argument"];
      id v35 = [v34 BOOLValue];

      [(id)VOTSharedWorkspace setInPerformanceTestMode:v35];
      goto LABEL_53;
    case 32:
      objc_msgSend((id)VOTSharedWorkspace, "setInPerformanceTestMode:", 1, v50, @"Got command %d", v6);
      id v27 = kVOTEventCommandAnnouncement;
      [v7 setObject:@"A reasonably long piece of text to announce!" forIndex:116];
      if (!v27) {
        goto LABEL_76;
      }
      goto LABEL_72;
    case 33:
      v36 = objc_msgSend(v3, "payload", v50, @"Got command %d", v6);
      v32 = [v36 objectForKey:@"argument"];

      id v37 = [(id)VOTSharedWorkspace systemVisualizationState];
      id v38 = [v32 integerValue];
      [(id)VOTSharedWorkspace setSystemVisualizationState:v38];
      id v27 = 0;
      if (v38 == (id)3 && v37 != (id)3)
      {
        id v27 = kVOTEventCommandAnnouncement;
        v39 = sub_100051804(off_1001EA9E8, @"apple.care.starting.diagnostics", 0);
        [v7 setObject:v39 forIndex:116];
      }
LABEL_75:

      if (!v27) {
        goto LABEL_76;
      }
      goto LABEL_72;
    case 34:
      v40 = objc_msgSend(v3, "payload", v50, @"Got command %d", v6);
      v41 = [v40 objectForKey:@"argument"];

      if (v41)
      {
        id v42 = [v41 BOOLValue];
        [(id)VOTSharedWorkspace setSystemVolumeControlsAvailablity:v42];
      }

      goto LABEL_51;
    case 35:
      objc_msgSend((id)VOTSharedWorkspace, "_testFetchWebElementRects", v50, @"Got command %d", v6);
LABEL_53:
      uint64_t v20 = 0;
      id v27 = 0;
      goto LABEL_73;
    case 36:
      id v10 = (id *)&kVOTEventCommandNextElementCommunity;
      goto LABEL_71;
    case 37:
      id v10 = (id *)&kVOTEventCommandPreviousElementCommunity;
      goto LABEL_71;
    case 38:
      id v10 = (id *)&kVOTEventCommandReadAll;
      goto LABEL_71;
    case 39:
      id v10 = (id *)&kVOTEventCommandShowEditingHUD;
      goto LABEL_71;
    case 40:
      id v10 = (id *)&kVOTEventCommandCopy;
      goto LABEL_71;
    case 41:
      id v10 = (id *)&kVOTEventCommandPaste;
      goto LABEL_71;
    case 42:
      id v10 = (id *)&kVOTEventCommandUndo;
      goto LABEL_71;
    case 43:
      id v10 = (id *)&kVOTEventCommandRedo;
      goto LABEL_71;
    case 44:
      id v10 = (id *)&kVOTEventCommandSystemSwitchToNextApp;
      goto LABEL_71;
    case 45:
      id v10 = (id *)&kVOTEventCommandSystemSwitchToPreviousApp;
      goto LABEL_71;
    case 46:
      id v10 = (id *)&kVOTEventCommandToggleSettingsHUD;
      goto LABEL_71;
    case 47:
      id v10 = (id *)&kVOTEventCommandStartHelp;
      goto LABEL_71;
    case 49:
      id v10 = (id *)&kVOTEventCommandDescribeCameraScene;
      goto LABEL_71;
    case 50:
      id v10 = (id *)&kVOTEventCommandShowDetectionUIWithMagnifierService;
      goto LABEL_71;
    case 51:
      id v10 = (id *)&kVOTEventCommandHideDetectionUIWithMagnifierService;
      goto LABEL_71;
    case 52:
      id v10 = (id *)&kVOTEventCommandActivateBrailleScreenInput;
      goto LABEL_71;
    case 53:
      id v10 = (id *)&kVOTEventCommandBSIExit;
LABEL_71:
      id v27 = *v10;
      if (v27)
      {
LABEL_72:
        v43 = +[VOTEvent systemServerEventWithCommand:info:](VOTEvent, "systemServerEventWithCommand:info:", v27, v7, v50);
        [(id)VOTSharedWorkspace dispatchCommand:v43];

        uint64_t v20 = 0;
LABEL_73:
        uint64_t v44 = 1;
      }
      else
      {
LABEL_76:
        uint64_t v20 = 0;
LABEL_77:
        uint64_t v44 = 0;
      }
      id v45 = objc_alloc((Class)AXIPCMessage);
      CFStringRef v51 = @"result";
      v46 = +[NSNumber numberWithBool:v44];
      v52 = v46;
      v47 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      id v48 = [v45 initWithKey:7000 payload:v47];

      return v48;
    default:
      goto LABEL_51;
  }
}

- (void)_updateRotorsForElementWithErrorMessage:(id *)a3
{
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v6 = +[VOTWorkspace sharedWorkspace];
  id v7 = [v6 elementManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100108E30;
  v10[3] = &unk_1001B33B8;
  dispatch_semaphore_t v11 = v5;
  unsigned __int8 v8 = v5;
  [v7 updateRotorForCurrentElement:1 completion:v10];

  intptr_t v9 = dispatch_semaphore_wait(v8, v4);
  if (a3 && v9) {
    *a3 = @"ElementManager timeout occurred";
  }
}

- (void)handleAutomationTestingCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  char v50 = 0;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1001091C4;
  v46[3] = &unk_1001B7070;
  id v48 = v49;
  id v7 = a4;
  id v47 = v7;
  unsigned __int8 v8 = objc_retainBlock(v46);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100109274;
  v43[3] = &unk_1001B7098;
  id v45 = v49;
  id v9 = v7;
  id v44 = v9;
  id v10 = objc_retainBlock(v43);
  dispatch_semaphore_t v11 = [v6 payload];
  unsigned int v12 = [v11 objectForKeyedSubscript:@"timeout"];
  [v12 doubleValue];
  double v14 = v13;

  CFStringRef v15 = [v6 payload];
  long long v16 = [v15 objectForKeyedSubscript:@"command"];
  id v17 = [v16 integerValue];
  CFStringRef v30 = v9;
  double v18 = v8;

  double v19 = [v6 payload];
  uint64_t v20 = [v19 objectForKeyedSubscript:@"userInfo"];

  dispatch_time_t v21 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
  dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_100109360;
  v41 = sub_100109370;
  id v42 = 0;
  long long v23 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100109378;
  block[3] = &unk_1001B70C0;
  id v36 = v17;
  id v24 = v20;
  id v35 = &v37;
  id v32 = v24;
  v33 = self;
  double v25 = v22;
  v34 = v25;
  dispatch_async(v23, block);

  if (dispatch_semaphore_wait(v25, v21))
  {
    CFStringRef v26 = @"Timeout occurred";
    id v27 = v10;
    long long v28 = v10;
  }
  else
  {
    uint64_t v29 = v38[5];
    id v27 = v10;
    if (v29) {
      long long v28 = v10;
    }
    else {
      long long v28 = v18;
    }
    if (v29) {
      CFStringRef v26 = (const __CFString *)v38[5];
    }
    else {
      CFStringRef v26 = (const __CFString *)&__NSDictionary0__struct;
    }
  }
  ((void (*)(void *, const __CFString *))v28[2])(v28, v26);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(v49, 8);
}

- (id)isBrailleInputUIShowing:(id)a3
{
  id v3 = +[VOTWorkspace sharedWorkspace];
  id v4 = [v3 brailleInputActive];

  id v5 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v10 = @"result";
  id v6 = +[NSNumber numberWithBool:v4];
  dispatch_semaphore_t v11 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v8 = [v5 initWithKey:7006 payload:v7];

  return v8;
}

- (id)isHandwritingInputUIShowing:(id)a3
{
  id v3 = +[VOTWorkspace sharedWorkspace];
  id v4 = [v3 handwritingInputActive];

  id v5 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v10 = @"result";
  id v6 = +[NSNumber numberWithBool:v4];
  dispatch_semaphore_t v11 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v8 = [v5 initWithKey:7009 payload:v7];

  return v8;
}

- (id)isScreenCurtainEnabled:(id)a3
{
  id v3 = +[VOTWorkspace sharedWorkspace];
  id v4 = [v3 screenCurtainEnabled];

  id v5 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v10 = @"result";
  id v6 = +[NSNumber numberWithBool:v4];
  dispatch_semaphore_t v11 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v8 = [v5 initWithKey:7012 payload:v7];

  return v8;
}

- (id)isBluetoothBrailleDisplayConnected:(id)a3
{
  id v3 = +[VOTBrailleManager manager];
  id v4 = [v3 bluetoothBrailleDisplayConnected];

  id v5 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v10 = @"result";
  id v6 = +[NSNumber numberWithBool:v4];
  dispatch_semaphore_t v11 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v8 = [v5 initWithKey:7011 payload:v7];

  return v8;
}

- (id)tutorialRecognizedGesture:(id)a3
{
  id v3 = +[VOTWorkspace sharedWorkspace];
  id v4 = [v3 elementManager];
  id v5 = [v4 tutorialRecognizedGesture];

  CFStringRef v10 = v5;
  CFStringRef v11 = @"result";
  id v6 = +[NSArray arrayWithObjects:&v10 count:1];
  unsigned int v12 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  id v8 = [objc_alloc((Class)AXIPCMessage) initWithKey:7014 payload:v7];

  return v8;
}

- (id)isBrailleScreenInputInScreenAwayMode:(id)a3
{
  id v3 = +[VOTWorkspace sharedWorkspace];
  BOOL v4 = [v3 brailleInputTypingMode] == 0;

  id v5 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v10 = @"result";
  id v6 = +[NSNumber numberWithBool:v4];
  CFStringRef v11 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v8 = [v5 initWithKey:7015 payload:v7];

  return v8;
}

- (id)currentCursorFrame:(id)a3
{
  id v3 = +[VOTDisplayManager displayManager];
  [v3 currentCursorFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  id v12 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v17 = @"result";
  v20.origin.double x = v5;
  v20.origin.double y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  double v13 = NSStringFromCGRect(v20);
  double v18 = v13;
  double v14 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  id v15 = [v12 initWithKey:7016 payload:v14];

  return v15;
}

- (void).cxx_destruct
{
}

- (void)_modifyRotorItems:(id)a3 shouldEnable:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  CGFloat v7 = +[AXSettings sharedInstance];
  double v8 = [v7 voiceOverRotorItems];

  id obj = v8;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v14 = [v13 mutableCopy];
        id v15 = [v13 objectForKeyedSubscript:@"RotorItem"];
        if (([v5 containsObject:v15] & 1) != 0
          || [v5 containsObject:@"all"])
        {
          long long v16 = +[NSNumber numberWithBool:v4];
          [v14 setObject:v16 forKeyedSubscript:@"Enabled"];
        }
        [v6 addObject:v14];
      }
      id v10 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  CFStringRef v17 = +[AXSettings sharedInstance];
  [v17 setVoiceOverRotorItems:v6];
}

@end