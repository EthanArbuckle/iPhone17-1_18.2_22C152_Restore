@interface DAHIDEventMonitor
+ (id)sharedInstance;
- (BOOL)currentlyMonitoring;
- (BOOL)findServiceClientForHIDEvent:(id)a3;
- (BOOL)serviceClientSetPropertyValue:(void *)a3 forKey:(__CFString *)a4 forHIDEvent:(unint64_t)a5;
- (BOOL)startMonitoringWithHIDEvents:(id)a3;
- (BOOL)systemClientSetupWithHIDEvents:(id)a3;
- (DAHIDEventMonitor)init;
- (DAHIDEventMonitorDelegate)delegate;
- (NSMutableArray)HIDEvents;
- (OS_dispatch_queue)mHIDEventQueue;
- (__IOHIDEventSystemClient)HIDSystemClient;
- (void)cleanUpSystemClient;
- (void)setCurrentlyMonitoring:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHIDEvents:(id)a3;
- (void)setHIDSystemClient:(__IOHIDEventSystemClient *)a3;
- (void)setMHIDEventQueue:(id)a3;
- (void)stopMonitoring;
@end

@implementation DAHIDEventMonitor

- (DAHIDEventMonitor)init
{
  v22.receiver = self;
  v22.super_class = (Class)DAHIDEventMonitor;
  v2 = [(DAHIDEventMonitor *)&v22 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray arrayWithCapacity:8];
    HIDEvents = v2->_HIDEvents;
    v2->_HIDEvents = (NSMutableArray *)v3;

    v37[0] = @"usagePage";
    v37[1] = @"usage";
    v38[0] = &off_1000043C8;
    v38[1] = &off_1000043E0;
    v37[2] = @"needServiceClient";
    v38[2] = &__kCFBooleanTrue;
    v5 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
    id v6 = [v5 mutableCopy];
    [(NSMutableArray *)v2->_HIDEvents setObject:v6 atIndexedSubscript:0];

    v35[0] = @"usagePage";
    v35[1] = @"usage";
    v36[0] = &off_1000043C8;
    v36[1] = &off_1000043F8;
    v35[2] = @"needServiceClient";
    v36[2] = &__kCFBooleanTrue;
    v7 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];
    id v8 = [v7 mutableCopy];
    [(NSMutableArray *)v2->_HIDEvents setObject:v8 atIndexedSubscript:1];

    v33[0] = @"usagePage";
    v33[1] = @"usage";
    v34[0] = &off_100004410;
    v34[1] = &off_100004428;
    v33[2] = @"needServiceClient";
    v34[2] = &__kCFBooleanFalse;
    v9 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
    id v10 = [v9 mutableCopy];
    [(NSMutableArray *)v2->_HIDEvents setObject:v10 atIndexedSubscript:2];

    v31[0] = @"usagePage";
    v31[1] = @"usage";
    v32[0] = &off_100004440;
    v32[1] = &off_100004458;
    v31[2] = @"needServiceClient";
    v32[2] = &__kCFBooleanFalse;
    v11 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
    id v12 = [v11 mutableCopy];
    [(NSMutableArray *)v2->_HIDEvents setObject:v12 atIndexedSubscript:3];

    v29[0] = @"usagePage";
    v29[1] = @"usage";
    v30[0] = &off_1000043C8;
    v30[1] = &off_100004470;
    v29[2] = @"needServiceClient";
    v30[2] = &__kCFBooleanTrue;
    v13 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
    id v14 = [v13 mutableCopy];
    [(NSMutableArray *)v2->_HIDEvents setObject:v14 atIndexedSubscript:4];

    v27[0] = @"usagePage";
    v27[1] = @"usage";
    v28[0] = &off_100004488;
    v28[1] = &off_1000044A0;
    v27[2] = @"needServiceClient";
    v28[2] = &__kCFBooleanTrue;
    v15 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
    id v16 = [v15 mutableCopy];
    [(NSMutableArray *)v2->_HIDEvents setObject:v16 atIndexedSubscript:5];

    v25[0] = @"usagePage";
    v25[1] = @"usage";
    v26[0] = &off_1000043C8;
    v26[1] = &off_100004428;
    v25[2] = @"needServiceClient";
    v26[2] = &__kCFBooleanTrue;
    v17 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
    id v18 = [v17 mutableCopy];
    [(NSMutableArray *)v2->_HIDEvents setObject:v18 atIndexedSubscript:6];

    v23[0] = @"usagePage";
    v23[1] = @"usage";
    v24[0] = &off_1000043C8;
    v24[1] = &off_1000044B8;
    v23[2] = @"needServiceClient";
    v24[2] = &__kCFBooleanFalse;
    v19 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
    id v20 = [v19 mutableCopy];
    [(NSMutableArray *)v2->_HIDEvents setObject:v20 atIndexedSubscript:7];

    v2->_currentlyMonitoring = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_100008918 != -1) {
    dispatch_once(&qword_100008918, &stru_100004248);
  }
  v2 = (void *)qword_100008910;

  return v2;
}

- (BOOL)systemClientSetupWithHIDEvents:(id)a3
{
  id v4 = a3;
  if ([(DAHIDEventMonitor *)self HIDSystemClient])
  {
    v5 = +[NSMutableArray array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v7)
    {
      id v8 = v7;
      id v23 = v4;
      uint64_t v9 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v12 = [v11 unsignedIntegerValue];
          v13 = [(DAHIDEventMonitor *)self HIDEvents];
          id v14 = [v13 count];

          if (v12 >= v14)
          {
            v21 = DiagnosticLogHandleForCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1000027D8();
            }

            id v4 = v23;
            goto LABEL_14;
          }
          v15 = [(DAHIDEventMonitor *)self HIDEvents];
          id v16 = [v15 objectAtIndexedSubscript:[v11 unsignedIntegerValue]];

          v28[0] = @"PrimaryUsagePage";
          v17 = [v16 objectForKeyedSubscript:@"usagePage"];
          v28[1] = @"PrimaryUsage";
          v29[0] = v17;
          id v18 = [v16 objectForKeyedSubscript:@"usage"];
          v29[1] = v18;
          v19 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
          [v5 addObject:v19];
        }
        id v8 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
        if (v8) {
          continue;
        }
        break;
      }

      [(DAHIDEventMonitor *)self HIDSystemClient];
      IOHIDEventSystemClientSetMatchingMultiple();
      BOOL v20 = 1;
      id v4 = v23;
    }
    else
    {
LABEL_14:

      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)findServiceClientForHIDEvent:(id)a3
{
  id v4 = a3;
  CFArrayRef v5 = IOHIDEventSystemClientCopyServices([(DAHIDEventMonitor *)self HIDSystemClient]);
  if (v5)
  {
    CFArrayRef v6 = v5;
    if (CFArrayGetCount(v5) < 1)
    {
      CFRelease(v6);
    }
    else
    {
      CFIndex v7 = 0;
      char v18 = 0;
      do
      {
        ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v6, v7);
        uint64_t v9 = (void *)IOHIDServiceClientCopyProperty(ValueAtIndex, @"PrimaryUsage");
        id v10 = [(DAHIDEventMonitor *)self HIDEvents];
        v11 = [v10 objectAtIndexedSubscript:[v4 unsignedIntegerValue]];

        id v12 = [v11 objectForKeyedSubscript:@"usage"];
        id v13 = [v12 unsignedIntegerValue];

        if (v9 && [v9 unsignedIntegerValue] == v13)
        {
          id v14 = +[NSValue valueWithPointer:ValueAtIndex];
          [v11 setObject:v14 forKeyedSubscript:@"HIDServiceClient"];

          char v18 = 1;
        }

        ++v7;
      }
      while (CFArrayGetCount(v6) > v7);
      CFRelease(v6);
      if (v18)
      {
        BOOL v15 = 1;
        goto LABEL_14;
      }
    }
  }
  id v16 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10000280C();
  }

  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (BOOL)serviceClientSetPropertyValue:(void *)a3 forKey:(__CFString *)a4 forHIDEvent:(unint64_t)a5
{
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v9 = [(DAHIDEventMonitor *)self mHIDEventQueue];

  if (v9)
  {
    id v10 = [(DAHIDEventMonitor *)self mHIDEventQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100001A74;
    block[3] = &unk_100004270;
    block[4] = self;
    block[5] = &v14;
    block[6] = a5;
    block[7] = a4;
    block[8] = a3;
    dispatch_sync(v10, block);
  }
  char v11 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (BOOL)startMonitoringWithHIDEvents:(id)a3
{
  id v4 = a3;
  [(DAHIDEventMonitor *)self setHIDSystemClient:IOHIDEventSystemClientCreateWithType()];
  if (![(DAHIDEventMonitor *)self HIDSystemClient])
  {
    char v17 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100002874();
    }

    CFRelease([(DAHIDEventMonitor *)self HIDSystemClient]);
    goto LABEL_25;
  }
  CFArrayRef v5 = self;
  objc_sync_enter(v5);
  unsigned __int8 v6 = [(DAHIDEventMonitor *)v5 currentlyMonitoring];
  objc_sync_exit(v5);

  if (v6)
  {
LABEL_25:
    BOOL v18 = 0;
    goto LABEL_35;
  }
  id v25 = v4;
  if (![(DAHIDEventMonitor *)v5 systemClientSetupWithHIDEvents:v4])
  {
    v19 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100002928();
    }

    goto LABEL_29;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v8)
  {

    goto LABEL_33;
  }
  uint64_t v9 = *(void *)v30;
  char v26 = 1;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(v7);
      }
      char v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      id v12 = [(DAHIDEventMonitor *)v5 HIDEvents];
      id v13 = [v12 objectAtIndexedSubscript:[v11 unsignedIntegerValue]];

      uint64_t v14 = [v13 objectForKeyedSubscript:@"needServiceClient"];
      if ([v14 BOOLValue])
      {
        BOOL v15 = [v13 objectForKeyedSubscript:@"HIDServiceClient"];
        BOOL v16 = v15 == 0;

        if (!v16) {
          goto LABEL_18;
        }
        if ((v26 & 1) != 0
          && [(DAHIDEventMonitor *)v5 findServiceClientForHIDEvent:v11])
        {
          char v26 = 1;
          goto LABEL_18;
        }
        uint64_t v14 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1000028E8(&buf, v28, v14);
        }
        char v26 = 0;
      }

LABEL_18:
    }
    id v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  }
  while (v8);

  if (v26)
  {
LABEL_33:
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.Diagnostics.hideventmonitor", 0);
    [(DAHIDEventMonitor *)v5 setMHIDEventQueue:v21];

    [(DAHIDEventMonitor *)v5 HIDSystemClient];
    objc_super v22 = [(DAHIDEventMonitor *)v5 mHIDEventQueue];
    IOHIDEventSystemClientScheduleWithDispatchQueue();

    [(DAHIDEventMonitor *)v5 HIDSystemClient];
    IOHIDEventSystemClientRegisterEventFilterCallback();
    id v23 = v5;
    objc_sync_enter(v23);
    [(DAHIDEventMonitor *)v23 setCurrentlyMonitoring:1];
    objc_sync_exit(v23);

    BOOL v18 = 1;
    goto LABEL_34;
  }
LABEL_29:
  BOOL v20 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_1000028A8();
  }

  [(DAHIDEventMonitor *)v5 cleanUpSystemClient];
  BOOL v18 = 0;
LABEL_34:
  id v4 = v25;
LABEL_35:

  return v18;
}

- (void)stopMonitoring
{
  v2 = self;
  objc_sync_enter(v2);
  [(DAHIDEventMonitor *)v2 setCurrentlyMonitoring:0];
  objc_sync_exit(v2);

  uint64_t v3 = [(DAHIDEventMonitor *)v2 mHIDEventQueue];

  if (v3)
  {
    id v4 = [(DAHIDEventMonitor *)v2 mHIDEventQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000210C;
    block[3] = &unk_100004298;
    block[4] = v2;
    dispatch_sync(v4, block);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  CFArrayRef v5 = [(DAHIDEventMonitor *)v2 HIDEvents];
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) removeObjectForKey:@"HIDServiceClient"];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)cleanUpSystemClient
{
  uint64_t v3 = [(DAHIDEventMonitor *)self HIDSystemClient];
  if (v3)
  {
    id v4 = v3;
    CFArrayRef v5 = [(DAHIDEventMonitor *)self mHIDEventQueue];

    if (v5)
    {
      id v6 = [(DAHIDEventMonitor *)self mHIDEventQueue];
      IOHIDEventSystemClientUnscheduleFromDispatchQueue();
    }
    IOHIDEventSystemClientUnregisterEventFilterCallback();
    CFRelease(v4);
    [(DAHIDEventMonitor *)self setHIDSystemClient:0];
  }
}

- (DAHIDEventMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DAHIDEventMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)currentlyMonitoring
{
  return self->_currentlyMonitoring;
}

- (void)setCurrentlyMonitoring:(BOOL)a3
{
  self->_currentlyMonitoring = a3;
}

- (OS_dispatch_queue)mHIDEventQueue
{
  return self->_mHIDEventQueue;
}

- (void)setMHIDEventQueue:(id)a3
{
}

- (NSMutableArray)HIDEvents
{
  return self->_HIDEvents;
}

- (void)setHIDEvents:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_HIDEvents, 0);
  objc_storeStrong((id *)&self->_mHIDEventQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end