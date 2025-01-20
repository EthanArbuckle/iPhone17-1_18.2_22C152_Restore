@interface XADAuditServer
+ (Class)deviceSettingsManagerClass;
- (AXUpdateElementVisualsCoalescer)_frontmostAppUpdateCoalescer;
- (BOOL)_handlingScreenChanged;
- (BOOL)updateRunningApplications;
- (NSMutableDictionary)runningApplications;
- (XADAuditServer)initWithTransport:(id)a3;
- (id)_currentMedusaApplications;
- (id)_deviceCaptureScreenshot;
- (id)deviceCaptureScreenshot;
- (id)deviceElement:(id)a3 performAction:(id)a4 withValue:(id)a5;
- (id)deviceElement:(id)a3 valueForAttribute:(id)a4;
- (id)deviceElement:(id)a3 valueForParameterizedAttribute:(id)a4 withObject:(id)a5;
- (id)deviceFetchElementAtNormalizedDeviceCoordinate:(id)a3;
- (id)deviceFetchResolvesElementsOnSimulator;
- (id)deviceFetchSpecialElement:(id)a3;
- (id)deviceInspectorCanNavWhileMonitoringEvents;
- (id)deviceInspectorSupportedEventTypes;
- (id)deviceRunningApplications;
- (int64_t)_screenChangeHandleAttempts;
- (void)_appStateChanged:(id)a3;
- (void)_checkFrontmostAppPidChanged;
- (void)_handleLayoutChangedNotification;
- (void)_handleScreenChangedNotification;
- (void)connectionInterrupted;
- (void)deviceDidGetTargeted;
- (void)deviceInspectorFocusOnElement:(id)a3;
- (void)deviceInspectorLockOnCurrentElement;
- (void)deviceInspectorMoveWithOptions:(id)a3;
- (void)deviceInspectorPreviewOnElement:(id)a3;
- (void)deviceInspectorSetMonitoredEventType:(id)a3;
- (void)deviceInspectorShowVisuals:(id)a3;
- (void)deviceSetAuditTargetPid:(id)a3;
- (void)didReceiveAccessibilityNotification:(int)a3;
- (void)eventManager:(id)a3 eventToHighlightElement:(id)a4;
- (void)eventManager:(id)a3 eventToHighlightPoint:(CGPoint)a4;
- (void)eventManager:(id)a3 notificationReceived:(int)a4 notification:(id)a5 traits:(id)a6 label:(id)a7 value:(id)a8 hint:(id)a9 identifier:(id)a10;
- (void)eventManager:(id)a3 stoppedSnarfingEvents:(BOOL)a4;
- (void)eventManager:(id)a3 systemFocusDidMoveToElement:(id)a4;
- (void)frontmostApplicationsDidChange;
- (void)highlightElement:(id)a3;
- (void)highlightElements:(id)a3;
- (void)inspectorManager:(id)a3 inspectorElementPropertiesChanged:(id)a4;
- (void)inspectorManager:(id)a3 inspectorFocusDidChange:(id)a4;
- (void)inspectorManager:(id)a3 inspectorMonitoredEventTypeChanged:(unint64_t)a4;
- (void)setApplicationStateNotificationsEnabled:(BOOL)a3;
- (void)setRunningApplications:(id)a3;
- (void)set_frontmostAppUpdateCoalescer:(id)a3;
- (void)set_handlingScreenChanged:(BOOL)a3;
- (void)set_screenChangeHandleAttempts:(int64_t)a3;
@end

@implementation XADAuditServer

+ (Class)deviceSettingsManagerClass
{
  return (Class)objc_opt_class();
}

- (XADAuditServer)initWithTransport:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)XADAuditServer;
  v5 = [(XADAuditServer *)&v16 initWithTransport:v4];
  if (v5)
  {
    v6 = +[XADEventManager sharedManager];
    [v6 setDelegate:v5];

    uint64_t v7 = +[NSMutableDictionary dictionary];
    runningApplications = v5->_runningApplications;
    v5->_runningApplications = (NSMutableDictionary *)v7;

    v9 = (AXUpdateElementVisualsCoalescer *)objc_alloc_init((Class)AXUpdateElementVisualsCoalescer);
    frontmostAppUpdateCoalescer = v5->__frontmostAppUpdateCoalescer;
    v5->__frontmostAppUpdateCoalescer = v9;

    [(AXUpdateElementVisualsCoalescer *)v5->__frontmostAppUpdateCoalescer setThreshold:0.2];
    objc_initWeak(&location, v5);
    v11 = v5->__frontmostAppUpdateCoalescer;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000BA84;
    v13[3] = &unk_1000189C0;
    objc_copyWeak(&v14, &location);
    [(AXUpdateElementVisualsCoalescer *)v11 setUpdateVisualsSequenceDidFinishHandler:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)_appStateChanged:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:SBApplicationStateDisplayIDKey];
  v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  else {
    uint64_t v7 = @"Unknown";
  }
  v8 = v7;

  v9 = v8;
  v43 = v8;
  uint64_t v10 = SBSCopyLocalizedApplicationNameForDisplayIdentifier();
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = @"Unknown";
  }
  v13 = v12;

  uint64_t v14 = SBApplicationStateProcessIDKey;
  v15 = [v4 objectForKeyedSubscript:SBApplicationStateProcessIDKey];
  [v15 intValue];
  uint64_t v16 = SBSCopyBundleInfoValueForKeyAndProcessID();
  v17 = (void *)v16;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  else {
    v18 = @"Unknown";
  }
  v44 = v18;

  v47[0] = @"name";
  uint64_t v19 = [v3 name];

  v45 = (void *)v19;
  if (v19) {
    CFStringRef v20 = (const __CFString *)v19;
  }
  else {
    CFStringRef v20 = @"Unknown";
  }
  v48[0] = v20;
  v47[1] = @"pid";
  uint64_t v21 = [v4 objectForKeyedSubscript:v14];
  v22 = (void *)v21;
  if (v21) {
    CFStringRef v23 = (const __CFString *)v21;
  }
  else {
    CFStringRef v23 = @"Unknown";
  }
  v48[1] = v23;
  v47[2] = @"state";
  uint64_t v24 = SBApplicationStateKey;
  uint64_t v25 = [v4 objectForKeyedSubscript:SBApplicationStateKey];
  v26 = (void *)v25;
  if (v25) {
    CFStringRef v27 = (const __CFString *)v25;
  }
  else {
    CFStringRef v27 = @"Unknown";
  }
  v48[2] = v27;
  v47[3] = @"state_description";
  v42 = [v4 objectForKeyedSubscript:v24];
  [v42 intValue];
  uint64_t Description = SBApplicationStateGetDescription();
  if (Description) {
    CFStringRef v29 = (const __CFString *)Description;
  }
  else {
    CFStringRef v29 = @"Unknown";
  }
  v48[3] = v29;
  v47[4] = @"elevated_state";
  uint64_t v30 = SBApplicationMostElevatedStateForProcessIDKey;
  uint64_t v31 = [v4 objectForKeyedSubscript:SBApplicationMostElevatedStateForProcessIDKey];
  v32 = (void *)v31;
  if (v31) {
    CFStringRef v33 = (const __CFString *)v31;
  }
  else {
    CFStringRef v33 = @"Unknown";
  }
  v48[4] = v33;
  v47[5] = @"elevated_state_description";
  v34 = [v4 objectForKeyedSubscript:v30];
  [v34 intValue];
  uint64_t v35 = SBApplicationStateGetDescription();
  if (v35) {
    CFStringRef v36 = (const __CFString *)v35;
  }
  else {
    CFStringRef v36 = @"Unknown";
  }
  v48[5] = v36;
  v48[6] = v9;
  v47[6] = @"displayID";
  v47[7] = @"mach_absolute_time";
  v37 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  v48[7] = v37;
  v47[8] = @"timestamp";
  v38 = +[NSDate date];
  v48[8] = v38;
  v48[9] = v13;
  v47[9] = @"appName";
  v47[10] = @"execName";
  v48[10] = v44;
  v39 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:11];

  v40 = +[DTXMessage messageWithSelector:objectArguments:](DTXMessage, "messageWithSelector:objectArguments:", "hostAppStateChanged:", v39, 0);

  v41 = [(XADAuditServer *)self connection];
  [v41 sendControlAsync:v40 replyHandler:0];
}

- (void)setApplicationStateNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)XADAuditServer;
  if ([(XADAuditServer *)&v8 applicationStateNotificationsEnabled] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)XADAuditServer;
    [(XADAuditServer *)&v7 setApplicationStateNotificationsEnabled:v3];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000BF20;
    v5[3] = &unk_100018AE0;
    BOOL v6 = v3;
    v5[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

- (id)deviceCaptureScreenshot
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C0A0;
  v6[3] = &unk_100018B08;
  id v3 = (id)objc_opt_new();
  id v7 = v3;
  objc_super v8 = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  id v4 = v3;

  return v4;
}

- (void)connectionInterrupted
{
  id v3 = +[XADEventManager sharedManager];
  [v3 connectionInterrupted];

  id v4 = +[XADInspectorManager sharedManager];
  [v4 connectionInterrupted];

  v5.receiver = self;
  v5.super_class = (Class)XADAuditServer;
  [(XADAuditServer *)&v5 connectionInterrupted];
}

- (id)_deviceCaptureScreenshot
{
  v2 = +[XADInspectorManager sharedManager];
  [v2 hideVisualsSynchronously];

  id v3 = +[AXAuditPluginManager sharedManager];
  id v4 = [v3 platformPlugin];
  objc_super v5 = objc_msgSend(v4, "screenshotInfoForTransportWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  return v5;
}

- (void)highlightElement:(id)a3
{
  id v4 = [a3 axElement];
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v3 = +[XADDisplayManager sharedManager];
    [v3 setCursorStyle:4];
    [v3 setCursorFrameForElement:v4];
  }
}

- (void)highlightElements:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "axElement", (void)v10);
        if (v8)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_12;
          }
        }
        v9 = +[XADDisplayManager sharedManager];
        [v9 setCursorStyle:4];
        [v9 setCursorFrameForElement:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)deviceInspectorFocusOnElement:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)XADAuditServer;
  [(XADAuditServer *)&v9 deviceInspectorFocusOnElement:v4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C4C0;
  v6[3] = &unk_100018B08;
  id v7 = v4;
  objc_super v8 = self;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)deviceInspectorMoveWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = +[AXAuditObjectTransportManager sharedManager];
  id v5 = [v4 objectForTransportDictionary:v3 expectedClass:objc_opt_class()];

  uint64_t v6 = [v5 objectForKey:kAXAuditInspectorMoveDirectionKey];
  id v7 = [v6 integerValue];

  objc_super v8 = [v5 objectForKey:kAXAuditInspectorMoveIncludeContainersKey];
  unsigned __int8 v9 = [v8 BOOLValue];

  long long v10 = [v5 objectForKey:kAXAuditInspectorMoveAllowNonAXKey];
  unsigned __int8 v11 = [v10 BOOLValue];

  long long v12 = +[XADInspectorManager sharedManager];
  long long v13 = [v12 dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C708;
  block[3] = &unk_100018B30;
  id v16 = v12;
  id v17 = v7;
  unsigned __int8 v18 = v9;
  unsigned __int8 v19 = v11;
  id v14 = v12;
  dispatch_async(v13, block);
}

- (void)deviceInspectorPreviewOnElement:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)XADAuditServer;
  [(XADAuditServer *)&v9 deviceInspectorPreviewOnElement:v4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C7D8;
  v6[3] = &unk_100018B08;
  id v7 = v4;
  objc_super v8 = self;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)deviceInspectorSetMonitoredEventType:(id)a3
{
  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)XADAuditServer;
    -[XADAuditServer deviceInspectorSetMonitoredEventType:](&v5, "deviceInspectorSetMonitoredEventType:");
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000C934;
    v4[3] = &unk_100018B58;
    v4[4] = self;
    v4[5] = [(XADAuditServer *)self monitoredEventType];
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

- (void)deviceInspectorShowVisuals:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)XADAuditServer;
  [(XADAuditServer *)&v13 deviceInspectorShowVisuals:v4];
  objc_super v5 = +[XADInspectorManager sharedManager];
  uint64_t v6 = [v5 dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CA94;
  block[3] = &unk_100018B80;
  id v10 = v5;
  unsigned __int8 v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

- (void)deviceInspectorLockOnCurrentElement
{
  v4.receiver = self;
  v4.super_class = (Class)XADAuditServer;
  [(XADAuditServer *)&v4 deviceInspectorLockOnCurrentElement];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CB78;
  block[3] = &unk_100018898;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)deviceInspectorSupportedEventTypes
{
  return &off_100019978;
}

- (id)deviceInspectorCanNavWhileMonitoringEvents
{
  return &__kCFBooleanFalse;
}

- (void)inspectorManager:(id)a3 inspectorMonitoredEventTypeChanged:(unint64_t)a4
{
  objc_super v5 = +[NSNumber numberWithUnsignedLongLong:a4];
  +[DTXMessage messageWithSelector:objectArguments:](DTXMessage, "messageWithSelector:objectArguments:", "hostInspectorMonitoredEventTypeChanged:", v5, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [(XADAuditServer *)self connection];
  [v6 sendControlAsync:v7 replyHandler:0];
}

- (void)inspectorManager:(id)a3 inspectorElementPropertiesChanged:(id)a4
{
  id v5 = a4;
  id v10 = +[AXAuditObjectTransportManager sharedManager];
  uint64_t v6 = [v10 transportDictionaryForObject:v5];

  if (v6)
  {
    id v7 = +[DTXMessage messageWithSelector:objectArguments:](DTXMessage, "messageWithSelector:objectArguments:", "hostInspectorCurrentElementPropertiesChanged:", v6, 0);
  }
  else
  {
    id v8 = +[NSNull null];
    id v7 = +[DTXMessage messageWithSelector:objectArguments:](DTXMessage, "messageWithSelector:objectArguments:", "hostInspectorCurrentElementPropertiesChanged:", v8, 0);
  }
  objc_super v9 = [(XADAuditServer *)self connection];
  [v9 sendControlAsync:v7 replyHandler:0];
}

- (void)inspectorManager:(id)a3 inspectorFocusDidChange:(id)a4
{
  id v5 = a4;
  id v10 = +[AXAuditObjectTransportManager sharedManager];
  uint64_t v6 = [v10 transportDictionaryForObject:v5];

  if (v6)
  {
    id v7 = +[DTXMessage messageWithSelector:objectArguments:](DTXMessage, "messageWithSelector:objectArguments:", "hostInspectorCurrentElementChanged:", v6, 0);
  }
  else
  {
    id v8 = +[NSNull null];
    id v7 = +[DTXMessage messageWithSelector:objectArguments:](DTXMessage, "messageWithSelector:objectArguments:", "hostInspectorCurrentElementChanged:", v8, 0);
  }
  objc_super v9 = [(XADAuditServer *)self connection];
  [v9 sendControlAsync:v7 replyHandler:0];
}

- (id)deviceElement:(id)a3 performAction:(id)a4 withValue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    objc_super v9 = objc_opt_new();
    id v10 = +[XADInspectorManager sharedManager];
    [v10 setDelegate:self];
    unsigned __int8 v11 = [v10 dispatchQueue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000D014;
    v17[3] = &unk_100018BA8;
    id v18 = v7;
    id v19 = v8;
    id v20 = v10;
    id v12 = v9;
    id v21 = v12;
    id v13 = v10;
    dispatch_async(v11, v17);

    id v14 = v21;
    id v15 = v12;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)deviceElement:(id)a3 valueForAttribute:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_opt_new();
    objc_super v9 = +[XADInspectorManager sharedManager];
    [v9 setDelegate:self];
    id v10 = [v9 dispatchQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000D294;
    v16[3] = &unk_100018BA8;
    id v17 = v6;
    id v18 = v7;
    id v19 = v9;
    id v11 = v8;
    id v20 = v11;
    id v12 = v9;
    dispatch_async(v10, v16);

    id v13 = v20;
    id v14 = v11;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)deviceElement:(id)a3 valueForParameterizedAttribute:(id)a4 withObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = objc_opt_new();
    id v12 = +[XADInspectorManager sharedManager];
    [v12 setDelegate:self];
    id v13 = [v12 dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D5B4;
    block[3] = &unk_100018BF8;
    id v20 = v8;
    id v21 = v9;
    id v22 = v12;
    id v23 = v10;
    id v14 = v11;
    id v24 = v14;
    id v15 = v12;
    dispatch_async(v13, block);

    id v16 = v24;
    id v17 = v14;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)eventManager:(id)a3 systemFocusDidMoveToElement:(id)a4
{
  id v5 = a4;
  id v6 = +[XADInspectorManager sharedManager];
  id v7 = [v6 dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_100018B80;
  id v11 = v6;
  id v12 = self;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

- (id)deviceFetchSpecialElement:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = +[XADInspectorManager sharedManager];
  id v7 = [v4 integerValue];

  [v6 setDelegate:self];
  id v8 = [v6 dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D9AC;
  block[3] = &unk_100018C20;
  id v15 = v6;
  id v17 = v7;
  id v9 = v5;
  id v16 = v9;
  id v10 = v6;
  dispatch_async(v8, block);

  id v11 = v16;
  id v12 = v9;

  return v12;
}

- (id)deviceFetchResolvesElementsOnSimulator
{
  id v3 = +[XADInspectorManager sharedManager];
  [v3 setDelegate:self];
  id v4 = objc_opt_new();
  id v5 = [v3 dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DB2C;
  block[3] = &unk_100018898;
  id v6 = v4;
  id v9 = v6;
  dispatch_async(v5, block);

  return v6;
}

- (id)deviceFetchElementAtNormalizedDeviceCoordinate:(id)a3
{
  id v4 = a3;
  id v5 = +[XADInspectorManager sharedManager];
  [v5 setDelegate:self];
  id v6 = objc_opt_new();
  [v4 CGPointValue];
  uint64_t v8 = v7;
  uint64_t v10 = v9;

  id v11 = [v5 dispatchQueue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000DCC4;
  v17[3] = &unk_100018C48;
  id v18 = v5;
  uint64_t v20 = v8;
  uint64_t v21 = v10;
  id v12 = v6;
  id v19 = v12;
  id v13 = v5;
  dispatch_async(v11, v17);

  id v14 = v19;
  id v15 = v12;

  return v15;
}

- (void)deviceDidGetTargeted
{
  v13.receiver = self;
  v13.super_class = (Class)XADAuditServer;
  [(XADAuditServer *)&v13 deviceDidGetTargeted];
  [(XADAuditServer *)self _checkFrontmostAppPidChanged];
  id v3 = +[XADInspectorManager sharedManager];
  id v4 = [v3 dispatchQueue];
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  uint64_t v9 = sub_10000DE54;
  uint64_t v10 = &unk_100018B08;
  id v11 = v3;
  id v12 = self;
  id v5 = v3;
  dispatch_async(v4, &v7);

  id v6 = +[XADEventManager sharedManager];
  [v6 deviceDidGetTargeted];
}

- (void)eventManager:(id)a3 stoppedSnarfingEvents:(BOOL)a4
{
  id v5 = +[XADInspectorManager sharedManager];
  id v6 = [v5 dispatchQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000DF4C;
  v8[3] = &unk_100018B08;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)eventManager:(id)a3 eventToHighlightElement:(id)a4
{
  id v5 = a4;
  id v6 = +[XADInspectorManager sharedManager];
  id v7 = [v6 dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E06C;
  block[3] = &unk_100018B80;
  id v11 = v6;
  id v12 = self;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

- (void)eventManager:(id)a3 eventToHighlightPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v7 = +[XADInspectorManager sharedManager];
  id v8 = [v7 dispatchQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000E1AC;
  v10[3] = &unk_100018C48;
  id v11 = v7;
  id v12 = self;
  CGFloat v13 = x;
  CGFloat v14 = y;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (void)frontmostApplicationsDidChange
{
  id v4 = +[DTXMessage messageWithSelector:"hostDeviceRunningApplicationsDidChange" objectArguments:0];
  id v3 = [(XADAuditServer *)self connection];
  [v3 sendControlAsync:v4 replyHandler:0];
}

- (BOOL)updateRunningApplications
{
  id v3 = AXAuditCurrentApplications();
  id v4 = +[NSMutableDictionary dictionary];
  v34 = [(XADAuditServer *)self runningApplications];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v46;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v46 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        id v11 = +[NSNumber numberWithInt:AXAuditPidForElement()];
        [v4 setObject:v10 forKey:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v7);
  }

  id v12 = [v4 count];
  if (v12 == [v34 count])
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v4;
    id v32 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v42;
      uint64_t v30 = v4;
      uint64_t v31 = self;
      id v29 = v5;
      while (1)
      {
        uint64_t v13 = 0;
LABEL_12:
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = v13;
        CGFloat v14 = *(void **)(*((void *)&v41 + 1) + 8 * v13);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v15 = v34;
        id v16 = [v15 countByEnumeratingWithState:&v37 objects:v49 count:16];
        if (!v16) {
          break;
        }
        id v17 = v16;
        uint64_t v18 = *(void *)v38;
LABEL_16:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v37 + 1) + 8 * v19);
          unsigned int v21 = objc_msgSend(v14, "intValue", v29, v30, v31);
          unsigned int v22 = [v20 intValue];
          id v23 = [obj objectForKeyedSubscript:v14];
          id v24 = [v23 label];

          uint64_t v25 = [v15 objectForKeyedSubscript:v20];
          v26 = [v25 label];

          if (v21 == v22)
          {
            if ([v24 isEqualToString:v26]) {
              break;
            }
          }

          if (v17 == (id)++v19)
          {
            id v17 = [v15 countByEnumeratingWithState:&v37 objects:v49 count:16];
            if (v17) {
              goto LABEL_16;
            }
            goto LABEL_28;
          }
        }

        uint64_t v13 = v35 + 1;
        if ((id)(v35 + 1) != v32) {
          goto LABEL_12;
        }
        BOOL v27 = 0;
        id v4 = v30;
        self = v31;
        id v5 = v29;
        id v32 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (!v32) {
          goto LABEL_30;
        }
      }
LABEL_28:

      BOOL v27 = 1;
      id v4 = v30;
      self = v31;
      id v5 = v29;
    }
    else
    {
      BOOL v27 = 0;
    }
LABEL_30:
  }
  else
  {
    BOOL v27 = 1;
  }
  -[XADAuditServer setRunningApplications:](self, "setRunningApplications:", v4, v29, v30, v31);

  return v27;
}

- (id)deviceRunningApplications
{
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_10000E980;
  uint64_t v31 = sub_10000E990;
  id v32 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = [(XADAuditServer *)self _currentMedusaApplications];
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v24;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v8 = [v7 bundleId];
        unsigned __int8 v9 = [v8 isEqualToString:@"com.apple.springboard"];

        if ((v9 & 1) == 0)
        {
          uint64_t v10 = AXAuditPidForElement();
          id v11 = objc_opt_new();
          [v11 setPid:v10];
          [v11 setPsnObj:0];
          uint64_t v12 = [v7 bundleId];
          [v11 setBundleIdentifier:v12];

          uint64_t v13 = [v7 label];
          [v11 setDisplayName:v13];

          CGFloat v14 = [v11 bundleIdentifier];
          LOBYTE(v12) = [v14 length] == 0;

          if ((v12 & 1) == 0)
          {
            id v15 = [v11 bundleIdentifier];
            id v16 = +[UIImage _applicationIconImageForBundleIdentifier:v15 format:0];

            if (v16)
            {
              v35.width = 14.0;
              v35.height = 14.0;
              UIGraphicsBeginImageContextWithOptions(v35, 0, 0.0);
              objc_msgSend(v16, "drawInRect:", 0.0, 0.0, 14.0, 14.0);
              id v17 = UIGraphicsGetImageFromCurrentImageContext();
              UIGraphicsEndImageContext();
              [v11 setIcon:v17];
            }
          }
          [(id)v28[5] addObject:v11];
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v4);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000E998;
  v20[3] = &unk_100018C70;
  unsigned int v22 = &v27;
  id v18 = (id)objc_opt_new();
  id v21 = v18;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v20);

  _Block_object_dispose(&v27, 8);

  return v18;
}

- (id)_currentMedusaApplications
{
  v2 = [(XADAuditServer *)self runningApplications];
  id v3 = [v2 allValues];
  id v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &stru_100018CB0);

  return v4;
}

- (void)deviceSetAuditTargetPid:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)XADAuditServer;
  id v3 = a3;
  [(XADAuditServer *)&v10 deviceSetAuditTargetPid:v3];
  id v4 = +[XADInspectorManager sharedManager];
  id v5 = [v3 integerValue];

  [v4 setTargetPid:v5];
  id v6 = [v4 frontmostAppForTargetPid];
  id v7 = sub_10000EC6C(v6);
  if (v7)
  {
    uint64_t v8 = +[XADEventManager sharedManager];
    unsigned __int8 v9 = [v8 snarfingEvents];

    if ((v9 & 1) == 0)
    {
      if ([v4 showVisuals]) {
        [v4 focusOnAXElement:v7];
      }
    }
  }
}

- (void)_checkFrontmostAppPidChanged
{
  if ([(XADAuditServer *)self updateRunningApplications]
    && (uint64_t)[(XADAuditServer *)self hostAPIVersion] >= 4)
  {
    [(XADAuditServer *)self frontmostApplicationsDidChange];
  }
  id v3 = [(XADAuditServer *)self _currentMedusaApplications];
  id v4 = [v3 count];

  if (v4 == (id)1)
  {
    id v5 = [(XADAuditServer *)self _currentMedusaApplications];
    id v6 = [v5 firstObject];

    unsigned __int8 v9 = +[NSNumber numberWithInt:AXAuditPidForElement()];
  }
  else
  {
    unsigned __int8 v9 = &off_100019990;
  }
  id v7 = +[DTXMessage messageWithSelector:objectArguments:](DTXMessage, "messageWithSelector:objectArguments:", "hostDeviceFrontmostAppPidDidChange:", v9, 0);
  uint64_t v8 = [(XADAuditServer *)self connection];
  [v8 sendControlAsync:v7 replyHandler:0];
}

- (void)_handleLayoutChangedNotification
{
  v2 = [(XADAuditServer *)self _frontmostAppUpdateCoalescer];
  [v2 notifyUpdateElementVisualsEventDidOccur];

  id v3 = +[XADInspectorManager sharedManager];
  id v4 = [v3 dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EEC4;
  block[3] = &unk_100018898;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)_handleScreenChangedNotification
{
  id v3 = [(XADAuditServer *)self _frontmostAppUpdateCoalescer];
  [v3 notifyUpdateElementVisualsEventDidOccur];

  if ([(XADAuditServer *)self _screenChangeHandleAttempts] <= 9)
  {
    id v4 = +[XADInspectorManager sharedManager];
    id v5 = [v4 frontmostAppForTargetPid];
    id v6 = sub_10000EC6C(v5);
    if (v6)
    {
      id v7 = +[XADEventManager sharedManager];
      unsigned __int8 v8 = [v7 snarfingEvents];

      if ((v8 & 1) == 0)
      {
        if ([v4 showVisuals]) {
          [v4 focusOnAXElement:v6];
        }
      }
      [(XADAuditServer *)self set_handlingScreenChanged:0];
    }
    else
    {
      dispatch_time_t v9 = dispatch_time(0, 100000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000F014;
      block[3] = &unk_100018898;
      void block[4] = self;
      dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)didReceiveAccessibilityNotification:(int)a3
{
  if (a3 == 1001)
  {
    [(XADAuditServer *)self _handleLayoutChangedNotification];
  }
  else if (a3 == 1000 && ![(XADAuditServer *)self _handlingScreenChanged])
  {
    id v4 = +[XADEventManager sharedManager];
    unsigned __int8 v5 = [v4 snarfingEvents];

    if ((v5 & 1) == 0)
    {
      [(XADAuditServer *)self set_handlingScreenChanged:1];
      [(XADAuditServer *)self set_screenChangeHandleAttempts:0];
      dispatch_time_t v6 = dispatch_time(0, 100000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000F178;
      block[3] = &unk_100018898;
      void block[4] = self;
      dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)eventManager:(id)a3 notificationReceived:(int)a4 notification:(id)a5 traits:(id)a6 label:(id)a7 value:(id)a8 hint:(id)a9 identifier:(id)a10
{
  uint64_t v13 = *(void *)&a4;
  id v35 = a5;
  id v15 = (__CFString *)a6;
  id v16 = (__CFString *)a7;
  id v17 = (__CFString *)a8;
  id v18 = (__CFString *)a9;
  uint64_t v19 = (__CFString *)a10;
  [(XADAuditServer *)self didReceiveAccessibilityNotification:v13];
  if ([v35 length])
  {
    uint64_t v20 = +[AXAuditObjectTransportManager sharedManager];
    if ((uint64_t)[(XADAuditServer *)self hostAPIVersion] < 6)
    {
      uint64_t v27 = [v20 transportDictionaryForObject:v35];
    }
    else
    {
      CFStringRef v21 = &stru_100019338;
      if (v15) {
        CFStringRef v22 = v15;
      }
      else {
        CFStringRef v22 = &stru_100019338;
      }
      if (v16) {
        CFStringRef v23 = v16;
      }
      else {
        CFStringRef v23 = &stru_100019338;
      }
      if (v17) {
        CFStringRef v24 = v17;
      }
      else {
        CFStringRef v24 = &stru_100019338;
      }
      if (v18) {
        CFStringRef v25 = v18;
      }
      else {
        CFStringRef v25 = &stru_100019338;
      }
      if (v19) {
        CFStringRef v21 = v19;
      }
      long long v26 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v35, kAXAuditNotificationDictKeyNotification, v22, kAXAuditNotificationDictKeyTraits, v23, kAXAuditNotificationDictKeyLabel, v24, kAXAuditNotificationDictKeyValue, v25, kAXAuditNotificationDictKeyHint, v21, kAXAuditNotificationDictKeyIdentifier, 0);
      uint64_t v27 = [v20 transportDictionaryForObject:v26];
    }
    if (v27)
    {
      v28 = +[DTXMessage messageWithSelector:objectArguments:](DTXMessage, "messageWithSelector:objectArguments:", "hostInspectorNotificationReceived:", v27, 0);
    }
    else
    {
      +[NSNull null];
      v34 = v17;
      uint64_t v29 = v16;
      uint64_t v30 = v15;
      v32 = uint64_t v31 = v20;
      v28 = +[DTXMessage messageWithSelector:objectArguments:](DTXMessage, "messageWithSelector:objectArguments:", "hostInspectorNotificationReceived:", v32, 0);

      uint64_t v20 = v31;
      id v15 = v30;
      id v16 = v29;
      id v17 = v34;
    }
    uint64_t v33 = [(XADAuditServer *)self connection];
    [v33 sendControlAsync:v28 replyHandler:0];
  }
}

- (BOOL)_handlingScreenChanged
{
  return self->__handlingScreenChanged;
}

- (void)set_handlingScreenChanged:(BOOL)a3
{
  self->__handlingScreenChanged = a3;
}

- (int64_t)_screenChangeHandleAttempts
{
  return self->__screenChangeHandleAttempts;
}

- (void)set_screenChangeHandleAttempts:(int64_t)a3
{
  self->__screenChangeHandleAttempts = a3;
}

- (NSMutableDictionary)runningApplications
{
  return self->_runningApplications;
}

- (void)setRunningApplications:(id)a3
{
}

- (AXUpdateElementVisualsCoalescer)_frontmostAppUpdateCoalescer
{
  return self->__frontmostAppUpdateCoalescer;
}

- (void)set_frontmostAppUpdateCoalescer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__frontmostAppUpdateCoalescer, 0);

  objc_storeStrong((id *)&self->_runningApplications, 0);
}

@end