@interface SCATSwitchControlServerInstance
+ (id)serverInstance;
- (AXEventProcessor)eventProcessor;
- (BOOL)_handleRemoteSCATAction:(int64_t)a3;
- (id)_automationSwitches;
- (id)_initServer;
- (id)clearSpokenPhrases:(id)a3;
- (id)currentFocusedElement:(id)a3;
- (id)headTrackingPoint:(id)a3;
- (id)isAutoScanEnabled:(id)a3;
- (id)isDwellEnabled:(id)a3;
- (id)isManualScanEnabled:(id)a3;
- (id)isScannerActive:(id)a3;
- (id)isScannerPaused:(id)a3;
- (id)lastSpokenPhrases:(id)a3;
- (id)switchControlActionTriggered:(id)a3;
- (id)switchControlAutomationCommandTriggered:(id)a3;
- (void)_removeAutomationSwitches;
- (void)_setupAutomationSwitches;
- (void)dealloc;
- (void)setEventProcessor:(id)a3;
@end

@implementation SCATSwitchControlServerInstance

+ (id)serverInstance
{
  if (qword_1001F0958 != -1) {
    dispatch_once(&qword_1001F0958, &stru_1001AACB8);
  }
  v2 = (void *)qword_1001F0950;

  return v2;
}

- (id)_initServer
{
  v14.receiver = self;
  v14.super_class = (Class)SCATSwitchControlServerInstance;
  v2 = [(SCATSwitchControlServerInstance *)&v14 init];
  p_isa = (id *)&v2->super.isa;
  if (v2)
  {
    v2->_switchesLoadedForAutomation = 0;
    id v4 = +[SCATSwitchControlWorkspace sharedWorkspace];
    id v5 = objc_alloc((Class)AXIPCServer);
    id v6 = [v5 initWithServiceName:AXSwitchControlServerServiceName perPidService:0];
    id v7 = p_isa[1];
    p_isa[1] = v6;

    id v8 = p_isa[1];
    id v13 = 0;
    [v8 startServerWithError:&v13];
    id v9 = v13;
    objc_msgSend(p_isa[1], "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", p_isa, "switchControlActionTriggered:", 6500, @"com.apple.accessibility.api", 0);
    objc_msgSend(p_isa[1], "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", p_isa, "switchControlAutomationCommandTriggered:", 6509, @"com.apple.accessibility.api", 0);
    objc_msgSend(p_isa[1], "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", p_isa, "currentFocusedElement:", 6501, @"com.apple.accessibility.api", 0);
    objc_msgSend(p_isa[1], "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", p_isa, "isScannerActive:", 6507, @"com.apple.accessibility.api", 0);
    objc_msgSend(p_isa[1], "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", p_isa, "isScannerPaused:", 6508, @"com.apple.accessibility.api", 0);
    objc_msgSend(p_isa[1], "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", p_isa, "isAutoScanEnabled:", 6504, @"com.apple.accessibility.api", 0);
    objc_msgSend(p_isa[1], "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", p_isa, "isManualScanEnabled:", 6505, @"com.apple.accessibility.api", 0);
    objc_msgSend(p_isa[1], "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", p_isa, "isDwellEnabled:", 6506, @"com.apple.accessibility.api", 0);
    objc_msgSend(p_isa[1], "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", p_isa, "headTrackingPoint:", 6510, @"com.apple.accessibility.api", 0);
    objc_msgSend(p_isa[1], "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", p_isa, "lastSpokenPhrases:", 6503, @"com.apple.accessibility.api", 0);
    objc_msgSend(p_isa[1], "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", p_isa, "clearSpokenPhrases:", 6511, @"com.apple.accessibility.api", 0);
    if (v9)
    {
      v10 = ASTLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100113A88((uint64_t)v9, v10);
      }
    }
    v11 = p_isa;
  }
  return p_isa;
}

- (void)dealloc
{
  if (self->_switchesLoadedForAutomation) {
    [(SCATSwitchControlServerInstance *)self _removeAutomationSwitches];
  }
  [(AXIPCServer *)self->_server removeAllHandlersForTarget:self];
  v3.receiver = self;
  v3.super_class = (Class)SCATSwitchControlServerInstance;
  [(SCATSwitchControlServerInstance *)&v3 dealloc];
}

- (id)_automationSwitches
{
  uint64_t v2 = SCATSwitchSourceAutomation;
  uint64_t v3 = SCATSwitchTypeOptional;
  v24 = +[AXSwitch switchWithAction:100 name:@"AX Activate" source:SCATSwitchSourceAutomation type:SCATSwitchTypeOptional];
  v25[0] = v24;
  v23 = +[AXSwitch switchWithAction:101 name:@"AX Menu" source:v2 type:v3];
  v25[1] = v23;
  v22 = +[AXSwitch switchWithAction:102 name:@"AX Run" source:v2 type:v3];
  v25[2] = v22;
  v21 = +[AXSwitch switchWithAction:103 name:@"AX Select" source:v2 type:v3];
  v25[3] = v21;
  v20 = +[AXSwitch switchWithAction:104 name:@"AX Step Next" source:v2 type:v3];
  v25[4] = v20;
  v19 = +[AXSwitch switchWithAction:105 name:@"AX Step Previous" source:v2 type:v3];
  v25[5] = v19;
  v18 = +[AXSwitch switchWithAction:106 name:@"AX Stop" source:v2 type:v3];
  v25[6] = v18;
  v17 = +[AXSwitch switchWithAction:107 name:@"AX Siri Shortcuts" source:v2 type:v3];
  v25[7] = v17;
  v16 = +[AXSwitch switchWithAction:200 name:@"AX App Switcher" source:v2 type:v3];
  v25[8] = v16;
  v15 = +[AXSwitch switchWithAction:201 name:@"AX Home" source:v2 type:v3];
  v25[9] = v15;
  objc_super v14 = +[AXSwitch switchWithAction:202 name:@"AX Notification Center" source:v2 type:v3];
  v25[10] = v14;
  id v4 = +[AXSwitch switchWithAction:203 name:@"AX Siri" source:v2 type:v3];
  v25[11] = v4;
  id v5 = +[AXSwitch switchWithAction:204 name:@"AX Volume Down" source:v2 type:v3];
  v25[12] = v5;
  id v6 = +[AXSwitch switchWithAction:205 name:@"AX Volume Up" source:v2 type:v3];
  v25[13] = v6;
  id v7 = +[AXSwitch switchWithAction:206 name:@"AX Force Touch" source:v2 type:v3];
  v25[14] = v7;
  id v8 = +[AXSwitch switchWithAction:207 name:@"AX Dictation" source:v2 type:v3];
  v25[15] = v8;
  id v9 = +[AXSwitch switchWithAction:208 name:@"AX Triple Click" source:v2 type:v3];
  v25[16] = v9;
  v10 = +[AXSwitch switchWithAction:209 name:@"AX Control Center" source:v2 type:v3];
  v25[17] = v10;
  v11 = +[AXSwitch switchWithAction:210 name:@"AX Escape" source:v2 type:v3];
  v25[18] = v11;
  v12 = +[NSArray arrayWithObjects:v25 count:19];

  return v12;
}

- (void)_setupAutomationSwitches
{
  if (!self->_switchesLoadedForAutomation)
  {
    uint64_t v3 = [(SCATSwitchControlServerInstance *)self _automationSwitches];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          [v8 setAccessibilityEventUsagePage:5];
          objc_msgSend(v8, "setAccessibilityEventUsage:", objc_msgSend(v8, "action"));
          SCATAddOrUpdateSwitchToSettings();
        }
        id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
    self->_switchesLoadedForAutomation = 1;
  }
}

- (void)_removeAutomationSwitches
{
  if (self->_switchesLoadedForAutomation)
  {
    uint64_t v3 = [(SCATSwitchControlServerInstance *)self _automationSwitches];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = (char *)[v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          SCATRemoveSwitchFromSettings();
        }
        id v5 = (char *)[v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
    self->_switchesLoadedForAutomation = 0;
  }
}

- (BOOL)_handleRemoteSCATAction:(int64_t)a3
{
  if (self->_switchesLoadedForAutomation)
  {
    if (!_AXSAutomationEnabled())
    {
      long long v8 = ASTLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100113B38(v8, v16, v17, v18, v19, v20, v21, v22);
      }
      goto LABEL_10;
    }
    uint64_t v4 = 5;
    if (a3)
    {
LABEL_4:
      id v5 = +[AXEventRepresentation accessibilityEventRepresentationWithSender:2 usagePage:v4 usage:a3];
      uint64_t v6 = +[AXEventTapManager sharedManager];
      [v6 sendHIDSystemEvent:v5 senderID:0x8000000817319375];

      return 1;
    }
  }
  else
  {
    uint64_t v4 = 6;
    if (a3) {
      goto LABEL_4;
    }
  }
  long long v8 = ASTLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100113B00(v8, v9, v10, v11, v12, v13, v14, v15);
  }
LABEL_10:

  return 0;
}

- (id)switchControlActionTriggered:(id)a3
{
  uint64_t v4 = [a3 payload];
  id v5 = [v4 objectForKey:@"action"];
  signed int v6 = [v5 intValue];

  if (v6) {
    BOOL v7 = [(SCATSwitchControlServerInstance *)self _handleRemoteSCATAction:v6];
  }
  else {
    BOOL v7 = 0;
  }
  id v8 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v13 = @"result";
  uint64_t v9 = +[NSNumber numberWithBool:v7];
  uint64_t v14 = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v11 = [v8 initWithKey:6500 payload:v10];

  return v11;
}

- (id)switchControlAutomationCommandTriggered:(id)a3
{
  uint64_t v4 = [a3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"command"];
  id v6 = [v5 integerValue];

  if (v6 == (id)1)
  {
    [(SCATSwitchControlServerInstance *)self _removeAutomationSwitches];
    goto LABEL_5;
  }
  if (!v6)
  {
    [(SCATSwitchControlServerInstance *)self _setupAutomationSwitches];
LABEL_5:
    uint64_t v7 = 1;
    goto LABEL_9;
  }
  id v8 = ASTLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100113B70(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  uint64_t v7 = 0;
LABEL_9:
  id v16 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v21 = @"result";
  uint64_t v17 = +[NSNumber numberWithBool:v7];
  uint64_t v22 = v17;
  uint64_t v18 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v19 = [v16 initWithKey:6509 payload:v18];

  return v19;
}

- (id)currentFocusedElement:(id)a3
{
  uint64_t v3 = +[SCATSwitchControlWorkspace sharedWorkspace];
  uint64_t v4 = [v3 currentElement];

  if (v4
    && ([v4 scatIsAXElement] & 1) != 0
    && ([v4 uiElement],
        id v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 axElement],
        v5,
        v6))
  {
    Data = (void *)_AXUIElementCreateData();
    id v8 = objc_alloc((Class)AXIPCMessage);
    CFStringRef v12 = @"result";
    uint64_t v13 = Data;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v10 = [v8 initWithKey:6501 payload:v9];
  }
  else
  {
    id v10 = [objc_alloc((Class)AXIPCMessage) initWithKey:6501 payload:0];
  }

  return v10;
}

- (id)isScannerActive:(id)a3
{
  uint64_t v3 = +[SCATSwitchControlWorkspace sharedWorkspace];
  id v4 = [v3 isScannerActive];

  id v5 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v10 = @"result";
  id v6 = +[NSNumber numberWithBool:v4];
  uint64_t v11 = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v8 = [v5 initWithKey:6507 payload:v7];

  return v8;
}

- (id)isScannerPaused:(id)a3
{
  uint64_t v3 = +[SCATSwitchControlWorkspace sharedWorkspace];
  id v4 = [v3 isScannerPaused];

  id v5 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v10 = @"result";
  id v6 = +[NSNumber numberWithBool:v4];
  uint64_t v11 = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v8 = [v5 initWithKey:6508 payload:v7];

  return v8;
}

- (id)isAutoScanEnabled:(id)a3
{
  uint64_t v3 = +[SCATSwitchControlWorkspace sharedWorkspace];
  BOOL v4 = [v3 scannerType] == 0;

  id v5 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v10 = @"result";
  id v6 = +[NSNumber numberWithBool:v4];
  uint64_t v11 = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v8 = [v5 initWithKey:6504 payload:v7];

  return v8;
}

- (id)isManualScanEnabled:(id)a3
{
  uint64_t v3 = +[SCATSwitchControlWorkspace sharedWorkspace];
  BOOL v4 = [v3 scannerType] == 1;

  id v5 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v10 = @"result";
  id v6 = +[NSNumber numberWithBool:v4];
  uint64_t v11 = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v8 = [v5 initWithKey:6505 payload:v7];

  return v8;
}

- (id)isDwellEnabled:(id)a3
{
  uint64_t v3 = +[SCATSwitchControlWorkspace sharedWorkspace];
  BOOL v4 = [v3 scannerType] == 2;

  id v5 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v10 = @"result";
  id v6 = +[NSNumber numberWithBool:v4];
  uint64_t v11 = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v8 = [v5 initWithKey:6506 payload:v7];

  return v8;
}

- (id)headTrackingPoint:(id)a3
{
  uint64_t v3 = +[SCATSwitchControlWorkspace sharedWorkspace];
  [v3 headTrackingPoint];
  BOOL v4 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:");

  id v5 = objc_alloc((Class)AXIPCMessage);
  CFStringRef v9 = @"result";
  CFStringRef v10 = v4;
  id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v7 = [v5 initWithKey:6510 payload:v6];

  return v7;
}

- (id)lastSpokenPhrases:(id)a3
{
  uint64_t v3 = +[SCATScannerManager sharedManager];
  BOOL v4 = [v3 recentSpeechOutputStrings];

  id v5 = objc_alloc((Class)AXIPCMessage);
  id v6 = v5;
  if (v4)
  {
    CFStringRef v12 = @"result";
    id v7 = [v3 recentSpeechOutputStrings];
    id v8 = [v7 copy];
    id v13 = v8;
    CFStringRef v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v10 = [v6 initWithKey:6503 payload:v9];
  }
  else
  {
    id v10 = [v5 initWithKey:6503 payload:0];
  }

  return v10;
}

- (id)clearSpokenPhrases:(id)a3
{
  uint64_t v3 = +[SCATScannerManager sharedManager];
  [v3 clearRecentSpeech];
  id v4 = [objc_alloc((Class)AXIPCMessage) initWithKey:6503 payload:0];

  return v4;
}

- (AXEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setEventProcessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventProcessor, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

@end