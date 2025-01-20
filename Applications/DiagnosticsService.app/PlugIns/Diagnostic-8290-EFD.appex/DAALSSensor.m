@interface DAALSSensor
- (BOOL)setupALSClient;
- (BOOL)setupHIDSystemClient;
- (BOOL)started;
- (DAALSSensor)initWithDelegate:(id)a3 threshold:(unsigned int)a4;
- (DAChamberSensorDelegate)delegate;
- (DAChamberSensorEvent)mostRecentEvent;
- (NSMutableArray)ALSSamples;
- (OS_dispatch_queue)HIDEventQueue;
- (__IOHIDEventSystemClient)HIDSystemClient;
- (__IOHIDServiceClient)HIDServiceClient;
- (id)averageSampleValue;
- (int)minimalALSSampleCount;
- (unsigned)threshold;
- (void)dealloc;
- (void)determineEnclosureState;
- (void)handleHIDEvent:(__IOHIDEvent *)a3;
- (void)releaseALSClient;
- (void)setALSSamples:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHIDEventQueue:(id)a3;
- (void)setHIDServiceClient:(__IOHIDServiceClient *)a3;
- (void)setHIDSystemClient:(__IOHIDEventSystemClient *)a3;
- (void)setMinimalALSSampleCount:(int)a3;
- (void)setMostRecentEvent:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setThreshold:(unsigned int)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation DAALSSensor

- (DAALSSensor)initWithDelegate:(id)a3 threshold:(unsigned int)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAALSSensor;
  v7 = [(DAALSSensor *)&v15 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    ALSSamples = v8->_ALSSamples;
    v8->_ALSSamples = v9;

    v8->_threshold = a4;
    v8->_minimalALSSampleCount = 10;
    v8->_HIDSystemClient = 0;
    v8->_HIDServiceClient = 0;
    dispatch_queue_t v11 = dispatch_queue_create("DAALSSensorQueue", 0);
    HIDEventQueue = v8->_HIDEventQueue;
    v8->_HIDEventQueue = (OS_dispatch_queue *)v11;

    mostRecentEvent = v8->_mostRecentEvent;
    v8->_mostRecentEvent = 0;

    v8->_started = 0;
  }

  return v8;
}

- (void)startMonitoring
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DAALSSensor: Start monitoring", buf, 2u);
  }

  [(DAALSSensor *)self setStarted:[(DAALSSensor *)self setupALSClient]];
  if (![(DAALSSensor *)self started])
  {
    v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DAALSSensor: ALS Client failed to set up.", v5, 2u);
    }
  }
}

- (void)stopMonitoring
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DAALSSensor: Stop monitoring", v5, 2u);
  }

  [(DAALSSensor *)self setStarted:0];
  [(DAALSSensor *)self releaseALSClient];
  v4 = [(DAALSSensor *)self ALSSamples];
  [v4 removeAllObjects];

  [(DAALSSensor *)self setMostRecentEvent:0];
}

- (BOOL)setupALSClient
{
  if ([(DAALSSensor *)self setupHIDSystemClient]
    && ([(DAALSSensor *)self HIDEventQueue],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    IOHIDServiceClientSetProperty([(DAALSSensor *)self HIDServiceClient], @"ReportInterval", +[NSNumber numberWithInt:10000]);
    [(DAALSSensor *)self HIDSystemClient];
    IOHIDEventSystemClientActivate();
    return 1;
  }
  else
  {
    v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100010868(v5);
    }

    return 0;
  }
}

- (BOOL)setupHIDSystemClient
{
  if ([(DAALSSensor *)self HIDSystemClient]
    && [(DAALSSensor *)self HIDServiceClient])
  {
    v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000108AC(v3);
    }

    LOBYTE(v4) = 0;
  }
  else
  {
    if (![(DAALSSensor *)self HIDSystemClient])
    {
      [(DAALSSensor *)self setHIDSystemClient:IOHIDEventSystemClientCreateWithType()];
      [(DAALSSensor *)self HIDSystemClient];
      IOHIDEventSystemClientRegisterEventCallback();
      [(DAALSSensor *)self HIDSystemClient];
      v5 = [(DAALSSensor *)self HIDEventQueue];
      IOHIDEventSystemClientScheduleWithDispatchQueue();

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000D6AC;
      block[3] = &unk_10001C590;
      block[4] = self;
      dispatch_block_t v6 = dispatch_block_create((dispatch_block_flags_t)0, block);
      [(DAALSSensor *)self HIDSystemClient];
      IOHIDEventSystemClientSetCancelHandler();
      [(DAALSSensor *)self HIDSystemClient];
      v24[0] = @"PrimaryUsagePage";
      v24[1] = @"PrimaryUsage";
      v25[0] = &off_10001D7A8;
      v25[1] = &off_10001D7C0;
      v7 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
      v26 = v7;
      +[NSArray arrayWithObjects:&v26 count:1];
      IOHIDEventSystemClientSetMatchingMultiple();

      v8 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [(DAALSSensor *)self HIDSystemClient];
        v10 = "success";
        if (!v9) {
          v10 = "failure";
        }
        *(_DWORD *)buf = 136315138;
        v23 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DAALSSensor: Setup system client: %s", buf, 0xCu);
      }
    }
    if ([(DAALSSensor *)self HIDSystemClient]
      && ![(DAALSSensor *)self HIDServiceClient])
    {
      CFArrayRef v11 = IOHIDEventSystemClientCopyServices([(DAALSSensor *)self HIDSystemClient]);
      if (v11)
      {
        CFArrayRef v12 = v11;
        if (CFArrayGetCount(v11) >= 1)
        {
          CFIndex v13 = 0;
          while (1)
          {
            ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v12, v13);
            objc_super v15 = (void *)IOHIDServiceClientCopyProperty(ValueAtIndex, @"PrimaryUsage");
            v16 = v15;
            if (v15)
            {
              if ([v15 intValue] == 4) {
                break;
              }
            }

            if (CFArrayGetCount(v12) <= ++v13) {
              goto LABEL_22;
            }
          }
          [(DAALSSensor *)self setHIDServiceClient:ValueAtIndex];
          CFRetain(ValueAtIndex);
        }
LABEL_22:
        CFRelease(v12);
      }
      v17 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [(DAALSSensor *)self HIDServiceClient];
        v19 = "success";
        if (!v18) {
          v19 = "failure";
        }
        *(_DWORD *)buf = 136315138;
        v23 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "DAALSSensor: Setup service client: %s", buf, 0xCu);
      }
    }
    v4 = [(DAALSSensor *)self HIDSystemClient];
    if (v4) {
      LOBYTE(v4) = [(DAALSSensor *)self HIDServiceClient] != 0;
    }
  }
  return (char)v4;
}

- (void)handleHIDEvent:(__IOHIDEvent *)a3
{
  if (IOHIDEventGetType() == 12 && [(DAALSSensor *)self started])
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    v5 = [(DAALSSensor *)self ALSSamples];
    dispatch_block_t v6 = +[NSNumber numberWithLong:IntegerValue];
    [v5 addObject:v6];

    [(DAALSSensor *)self determineEnclosureState];
  }
}

- (id)averageSampleValue
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(DAALSSensor *)self ALSSamples];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += (uint64_t)[*(id *)(*((void *)&v12 + 1) + 8 * i) longValue];
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  v9 = [(DAALSSensor *)self ALSSamples];
  [v9 removeAllObjects];

  v10 = +[NSNumber numberWithLong:v6 / [(DAALSSensor *)self minimalALSSampleCount]];

  return v10;
}

- (void)determineEnclosureState
{
  v3 = [(DAALSSensor *)self ALSSamples];
  id v4 = [v3 count];
  signed int v5 = [(DAALSSensor *)self minimalALSSampleCount];

  if ((unint64_t)v4 >= v5)
  {
    uint64_t v6 = [(DAALSSensor *)self averageSampleValue];
    unsigned int v7 = [v6 intValue];

    unsigned int v8 = [(DAALSSensor *)self threshold];
    v9 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v7 <= v8) {
        v10 = "Closed";
      }
      else {
        v10 = "Opened";
      }
      int v16 = 136315650;
      v17 = v10;
      __int16 v18 = 1024;
      unsigned int v19 = v7;
      __int16 v20 = 1024;
      unsigned int v21 = [(DAALSSensor *)self threshold];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "DAALSSensor: Detect %s - average value= %d, ALS limit = %d", (uint8_t *)&v16, 0x18u);
    }

    if (v7 > v8) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2;
    }
    long long v12 = [[DAChamberSensorEvent alloc] initWithSensorType:0 eventType:v11];
    long long v13 = [(DAALSSensor *)self mostRecentEvent];
    unsigned __int8 v14 = [(DAChamberSensorEvent *)v12 isEqual:v13];

    if ((v14 & 1) == 0)
    {
      long long v15 = [(DAALSSensor *)self delegate];
      [v15 handleSensorEvent:v12];

      [(DAALSSensor *)self setMostRecentEvent:v12];
    }
  }
}

- (void)releaseALSClient
{
  if ([(DAALSSensor *)self HIDSystemClient])
  {
    [(DAALSSensor *)self HIDSystemClient];
    IOHIDEventSystemClientUnregisterEventCallback();
    v3 = [(DAALSSensor *)self HIDSystemClient];
    _IOHIDEventSystemClientCancel(v3);
  }
}

- (void)dealloc
{
  [(DAALSSensor *)self stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)DAALSSensor;
  [(DAALSSensor *)&v3 dealloc];
}

- (DAChamberSensorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DAChamberSensorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DAChamberSensorEvent)mostRecentEvent
{
  return self->_mostRecentEvent;
}

- (void)setMostRecentEvent:(id)a3
{
}

- (__IOHIDEventSystemClient)HIDSystemClient
{
  return self->_HIDSystemClient;
}

- (void)setHIDSystemClient:(__IOHIDEventSystemClient *)a3
{
  self->_HIDSystemClient = a3;
}

- (__IOHIDServiceClient)HIDServiceClient
{
  return self->_HIDServiceClient;
}

- (void)setHIDServiceClient:(__IOHIDServiceClient *)a3
{
  self->_HIDServiceClient = a3;
}

- (OS_dispatch_queue)HIDEventQueue
{
  return self->_HIDEventQueue;
}

- (void)setHIDEventQueue:(id)a3
{
}

- (NSMutableArray)ALSSamples
{
  return self->_ALSSamples;
}

- (void)setALSSamples:(id)a3
{
}

- (unsigned)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(unsigned int)a3
{
  self->_threshold = a3;
}

- (int)minimalALSSampleCount
{
  return self->_minimalALSSampleCount;
}

- (void)setMinimalALSSampleCount:(int)a3
{
  self->_minimalALSSampleCount = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ALSSamples, 0);
  objc_storeStrong((id *)&self->_HIDEventQueue, 0);
  objc_storeStrong((id *)&self->_mostRecentEvent, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end