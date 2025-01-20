@interface DiagExtALSDataMonitor
- (BOOL)fIsMonitoring;
- (BOOL)setupALSClient;
- (BOOL)setupHIDClient;
- (BOOL)startMonitoring;
- (DiagExtALSDataMonitor)initWithDelegate:(id)a3;
- (DiagExtALSDataMonitorDelegate)delegate;
- (NSMutableArray)valueQueue;
- (id)averageSampleQueue;
- (int)fALSEnclosedSampleCount;
- (int)fEnclosedStateFlag;
- (unsigned)fALSEnclosedLimit;
- (void)dealloc;
- (void)determineEnclosureState;
- (void)releaseALSClient;
- (void)setDelegate:(id)a3;
- (void)setFALSEnclosedLimit:(unsigned int)a3;
- (void)setFALSEnclosedSampleCount:(int)a3;
- (void)setFEnclosedStateFlag:(int)a3;
- (void)setFIsMonitoring:(BOOL)a3;
- (void)setValueQueue:(id)a3;
- (void)stopMonitoring;
@end

@implementation DiagExtALSDataMonitor

- (DiagExtALSDataMonitor)initWithDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DiagExtALSDataMonitor;
  id v3 = a3;
  v4 = [(DiagExtALSDataMonitor *)&v7 init];
  -[DiagExtALSDataMonitor setDelegate:](v4, "setDelegate:", v3, v7.receiver, v7.super_class);

  id v5 = objc_alloc_init((Class)NSMutableArray);
  [(DiagExtALSDataMonitor *)v4 setValueQueue:v5];

  [(DiagExtALSDataMonitor *)v4 setFALSEnclosedLimit:15];
  [(DiagExtALSDataMonitor *)v4 setFALSEnclosedSampleCount:10];
  [(DiagExtALSDataMonitor *)v4 setFEnclosedStateFlag:0];
  [(DiagExtALSDataMonitor *)v4 setFIsMonitoring:0];
  v4->fHIDSystemClient = 0;
  v4->fHIDServiceClient = 0;
  v4->fHIDEventQueue = (dispatch_queue_s *)dispatch_queue_create("DE.ALSDataMonitor.queue", 0);
  return v4;
}

- (void)dealloc
{
  id v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "ALSDataMonitor dealloc", buf, 2u);
  }
  fHIDEventQueue = self->fHIDEventQueue;
  if (fHIDEventQueue) {
    dispatch_release(fHIDEventQueue);
  }
  v5.receiver = self;
  v5.super_class = (Class)DiagExtALSDataMonitor;
  [(DiagExtALSDataMonitor *)&v5 dealloc];
}

- (BOOL)setupALSClient
{
  if ([(DiagExtALSDataMonitor *)self setupHIDClient] && self->fHIDEventQueue)
  {
    IOHIDServiceClientSetProperty(self->fHIDServiceClient, @"ReportInterval", +[NSNumber numberWithInt:10000]);
    IOHIDEventSystemClientActivate();
    LOBYTE(v3) = 1;
  }
  else
  {
    v4 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    BOOL v3 = os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_ERROR, "ALSDataMonitor: Failed to setup service client for ALS", v6, 2u);
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)releaseALSClient
{
  if (self->fHIDSystemClient)
  {
    IOHIDEventSystemClientUnregisterEventCallback();
    fHIDSystemClient = self->fHIDSystemClient;
    _IOHIDEventSystemClientCancel(fHIDSystemClient);
  }
}

- (BOOL)setupHIDClient
{
  fHIDSystemClient = self->fHIDSystemClient;
  if (fHIDSystemClient)
  {
    p_fHIDServiceClient = &self->fHIDServiceClient;
    if (self->fHIDServiceClient) {
      goto LABEL_28;
    }
  }
  else
  {
    self->fHIDSystemClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
    IOHIDEventSystemClientRegisterEventCallback();
    IOHIDEventSystemClientScheduleWithDispatchQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A6B8;
    block[3] = &unk_1000104F8;
    block[4] = self;
    dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, block);
    IOHIDEventSystemClientSetCancelHandler();
    v6 = +[NSMutableArray array];
    v22[0] = @"PrimaryUsagePage";
    v22[1] = @"PrimaryUsage";
    v23[0] = &off_100010B50;
    v23[1] = &off_100010B68;
    objc_super v7 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    [v6 addObject:v7];

    IOHIDEventSystemClientSetMatchingMultiple();
    v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self->fHIDSystemClient) {
        v9 = "Success";
      }
      else {
        v9 = "Failed";
      }
      *(_DWORD *)buf = 136315138;
      v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "ALSDataMonitor: setup system client %s", buf, 0xCu);
    }

    fHIDSystemClient = self->fHIDSystemClient;
    if (!fHIDSystemClient) {
      return (char)fHIDSystemClient;
    }
    p_fHIDServiceClient = &self->fHIDServiceClient;
    if (self->fHIDServiceClient) {
      goto LABEL_25;
    }
  }
  CFArrayRef v10 = IOHIDEventSystemClientCopyServices(fHIDSystemClient);
  if (!v10) {
    goto LABEL_20;
  }
  CFArrayRef v11 = v10;
  if (CFArrayGetCount(v10) < 1) {
    goto LABEL_19;
  }
  CFIndex v12 = 0;
  while (1)
  {
    ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v11, v12);
    v14 = (void *)IOHIDServiceClientCopyProperty(ValueAtIndex, @"PrimaryUsage");
    if (v14) {
      break;
    }
LABEL_14:
    if (CFArrayGetCount(v11) <= ++v12) {
      goto LABEL_19;
    }
  }
  v15 = v14;
  if ([v14 intValue] != 4)
  {
    CFRelease(v15);
    goto LABEL_14;
  }
  *p_fHIDServiceClient = ValueAtIndex;
  CFRetain(ValueAtIndex);
LABEL_19:
  CFRelease(v11);
LABEL_20:
  v16 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    if (*p_fHIDServiceClient) {
      v17 = "Success";
    }
    else {
      v17 = "Failed";
    }
    *(_DWORD *)buf = 136315138;
    v21 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "ALSDataMonitor: setup service client %s", buf, 0xCu);
  }
LABEL_25:
  if (self->fHIDSystemClient)
  {
    LOBYTE(fHIDSystemClient) = *p_fHIDServiceClient != 0;
    return (char)fHIDSystemClient;
  }
LABEL_28:
  LOBYTE(fHIDSystemClient) = 0;
  return (char)fHIDSystemClient;
}

- (id)averageSampleQueue
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = [(DiagExtALSDataMonitor *)self valueQueue];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) intValue];
        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }

  v9 = [(DiagExtALSDataMonitor *)self valueQueue];
  [v9 removeAllObjects];

  CFArrayRef v10 = +[NSNumber numberWithInt:(v6 / [(DiagExtALSDataMonitor *)self fALSEnclosedSampleCount])];

  return v10;
}

- (void)determineEnclosureState
{
  BOOL v3 = [(DiagExtALSDataMonitor *)self valueQueue];
  signed int v4 = [v3 count];
  signed int v5 = [(DiagExtALSDataMonitor *)self fALSEnclosedSampleCount];

  if (v5 <= v4)
  {
    int v6 = [(DiagExtALSDataMonitor *)self averageSampleQueue];
    unsigned int v7 = [v6 intValue];

    unsigned int v8 = [(DiagExtALSDataMonitor *)self fALSEnclosedLimit];
    v9 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
    {
      if (v7 <= v8) {
        long long v14 = "Closed";
      }
      else {
        long long v14 = "Opened";
      }
      int v15 = 136315650;
      v16 = v14;
      __int16 v17 = 1024;
      unsigned int v18 = v7;
      __int16 v19 = 1024;
      unsigned int v20 = [(DiagExtALSDataMonitor *)self fALSEnclosedLimit];
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEBUG, "ALSDataMonitor: Detect %s - average value= %d, ALS limit = %d", (uint8_t *)&v15, 0x18u);
      unsigned int v10 = [(DiagExtALSDataMonitor *)self fEnclosedStateFlag];
      if (v7 > v8) {
        goto LABEL_4;
      }
    }
    else
    {
      unsigned int v10 = [(DiagExtALSDataMonitor *)self fEnclosedStateFlag];
      if (v7 > v8)
      {
LABEL_4:
        if (v10 == 2) {
          return;
        }
        [(DiagExtALSDataMonitor *)self setFEnclosedStateFlag:2];
        CFArrayRef v11 = [(DiagExtALSDataMonitor *)self delegate];
        long long v12 = v11;
        uint64_t v13 = 2;
LABEL_12:
        [v11 handleALSEnclosedEvent:v13];

        return;
      }
    }
    if (v10 == 1) {
      return;
    }
    [(DiagExtALSDataMonitor *)self setFEnclosedStateFlag:1];
    CFArrayRef v11 = [(DiagExtALSDataMonitor *)self delegate];
    long long v12 = v11;
    uint64_t v13 = 1;
    goto LABEL_12;
  }
}

- (BOOL)startMonitoring
{
  unsigned int v3 = [(DiagExtALSDataMonitor *)self fIsMonitoring];
  signed int v4 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  BOOL v5 = os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "ALSDataMonitor: already running", buf, 2u);
    }
    return 1;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "ALSDataMonitor: Start monitoring", v7, 2u);
    }
    [(DiagExtALSDataMonitor *)self setFIsMonitoring:1];
    return 1;
  }
}

- (void)stopMonitoring
{
  unsigned int v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "ALSDataMonitor: Stop monitoring", v5, 2u);
  }
  [(DiagExtALSDataMonitor *)self setFIsMonitoring:0];
  signed int v4 = [(DiagExtALSDataMonitor *)self valueQueue];
  [v4 removeAllObjects];
}

- (DiagExtALSDataMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DiagExtALSDataMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)valueQueue
{
  return self->_valueQueue;
}

- (void)setValueQueue:(id)a3
{
}

- (unsigned)fALSEnclosedLimit
{
  return self->_fALSEnclosedLimit;
}

- (void)setFALSEnclosedLimit:(unsigned int)a3
{
  self->_fALSEnclosedLimit = a3;
}

- (int)fALSEnclosedSampleCount
{
  return self->_fALSEnclosedSampleCount;
}

- (void)setFALSEnclosedSampleCount:(int)a3
{
  self->_fALSEnclosedSampleCount = a3;
}

- (BOOL)fIsMonitoring
{
  return self->_fIsMonitoring;
}

- (void)setFIsMonitoring:(BOOL)a3
{
  self->_fIsMonitoring = a3;
}

- (int)fEnclosedStateFlag
{
  return self->_fEnclosedStateFlag;
}

- (void)setFEnclosedStateFlag:(int)a3
{
  self->_fEnclosedStateFlag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end