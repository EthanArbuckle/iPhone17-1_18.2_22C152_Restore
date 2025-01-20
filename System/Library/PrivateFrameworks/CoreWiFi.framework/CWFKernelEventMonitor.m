@interface CWFKernelEventMonitor
+ (id)descriptionForKernelEventCode:(unint64_t)a3;
- (BOOL)isMonitoringEvents;
- (CWFKernelEventMonitor)init;
- (id)eventHandler;
- (unint64_t)interfaceFlagsWithInterfaceName:(id)a3;
- (void)dealloc;
- (void)setEventHandler:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation CWFKernelEventMonitor

+ (id)descriptionForKernelEventCode:(unint64_t)a3
{
  if (a3 - 1 >= 0x1E)
  {
    v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"? (%lu)", v3, v4, a3);
  }
  else
  {
    v5 = *(&off_1E60BBAF8 + a3 - 1);
  }
  return v5;
}

- (CWFKernelEventMonitor)init
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)CWFKernelEventMonitor;
  id v2 = [(CWFKernelEventMonitor *)&v38 init];
  if (!v2) {
    goto LABEL_29;
  }
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.corewifi.kevent-mutex", v3);
  v5 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v4;

  if (!*((void *)v2 + 1)) {
    goto LABEL_29;
  }
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.corewifi.kevent-event", v6);
  v8 = (void *)*((void *)v2 + 2);
  *((void *)v2 + 2) = v7;

  if (!*((void *)v2 + 2)) {
    goto LABEL_29;
  }
  int v9 = socket(32, 3, 1);
  unsigned int v10 = v9;
  if (v9 < 0)
  {
    v17 = CWFGetOSLog();
    if (v17)
    {
      v18 = CWFGetOSLog();
    }
    else
    {
      v18 = MEMORY[0x1E4F14500];
      id v22 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v23 = *__error();
      v24 = __error();
      v25 = strerror(*v24);
      int v39 = 136447234;
      v40 = "-[CWFKernelEventMonitor init]";
      __int16 v41 = 2082;
      v42 = "CWFKernelEventMonitor.m";
      __int16 v43 = 1024;
      int v44 = 185;
      __int16 v45 = 1024;
      int v46 = v23;
      __int16 v47 = 2082;
      v48 = v25;
      _os_log_send_and_compose_impl();
    }

    if (v10 == -1) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  int v37 = 2;
  uint64_t v36 = 0x100000001;
  if (ioctl(v9, 0x800C6502uLL, &v36))
  {
    v19 = CWFGetOSLog();
    if (v19)
    {
      v20 = CWFGetOSLog();
    }
    else
    {
      v20 = MEMORY[0x1E4F14500];
      id v26 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    int v27 = *__error();
    v28 = __error();
    v29 = strerror(*v28);
    int v39 = 136447234;
    v40 = "-[CWFKernelEventMonitor init]";
    __int16 v41 = 2082;
    v42 = "CWFKernelEventMonitor.m";
    __int16 v43 = 1024;
    int v44 = 188;
    __int16 v45 = 1024;
    int v46 = v27;
    __int16 v47 = 2082;
    v48 = v29;
    goto LABEL_26;
  }
  dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1E4F14478], v10, 0, *((dispatch_queue_t *)v2 + 2));
  v12 = (void *)*((void *)v2 + 3);
  *((void *)v2 + 3) = v11;

  v13 = *((void *)v2 + 3);
  if (!v13)
  {
    v21 = CWFGetOSLog();
    if (v21)
    {
      v20 = CWFGetOSLog();
    }
    else
    {
      v20 = MEMORY[0x1E4F14500];
      id v30 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    int v39 = 136446722;
    v40 = "-[CWFKernelEventMonitor init]";
    __int16 v41 = 2082;
    v42 = "CWFKernelEventMonitor.m";
    __int16 v43 = 1024;
    int v44 = 191;
LABEL_26:
    _os_log_send_and_compose_impl();
LABEL_27:

LABEL_28:
    close(v10);
LABEL_29:

    return 0;
  }
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_1B4F70624;
  handler[3] = &unk_1E60BBAB0;
  unsigned int v35 = v10;
  dispatch_source_set_cancel_handler(v13, handler);
  v14 = *((void *)v2 + 3);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1B4F7062C;
  v31[3] = &unk_1E60BBAD8;
  unsigned int v33 = v10;
  v15 = (CWFKernelEventMonitor *)v2;
  v32 = v15;
  dispatch_source_set_event_handler(v14, v31);

  dispatch_activate(*((dispatch_object_t *)v2 + 3));
  return v15;
}

- (void)dealloc
{
  keventSource = self->_keventSource;
  if (keventSource) {
    dispatch_source_cancel(keventSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)CWFKernelEventMonitor;
  [(CWFKernelEventMonitor *)&v4 dealloc];
}

- (void)startEventMonitoring
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F70D2C;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)stopEventMonitoring
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F70DE8;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (BOOL)isMonitoringEvents
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4F70ED8;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)interfaceFlagsWithInterfaceName:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v8 = v3;
  long long v18 = 0u;
  long long v19 = 0u;
  if (v3
    && objc_msgSend_length(v3, v4, v5, v6, v7)
    && (unint64_t)objc_msgSend_length(v8, v9, v10, v11, v12) <= 0x10
    && (int v13 = socket(30, 2, 0), v13 != -1))
  {
    int v15 = v13;
    if (objc_msgSend_getCString_maxLength_encoding_(v8, v14, (uint64_t)&v18, 16, 4)) {
      ioctl(v15, 0xC0206911uLL, &v18);
    }
    close(v15);
    unint64_t v16 = (__int16)v19;
  }
  else
  {
    unint64_t v16 = 0;
  }

  return v16;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_keventSource, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end