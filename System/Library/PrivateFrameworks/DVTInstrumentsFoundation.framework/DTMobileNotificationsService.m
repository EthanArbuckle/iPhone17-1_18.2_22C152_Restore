@interface DTMobileNotificationsService
+ (void)registerCapabilities:(id)a3;
- (RBSProcessMonitor)appStateMonitor;
- (void)_memoryNotification:(unsigned int)a3 pid:(int)a4;
- (void)_setAppStateNotificationsEnabled:(BOOL)a3;
- (void)_setMemNotificationsEnabled:(BOOL)a3;
- (void)messageReceived:(id)a3;
- (void)postDarwinNotification:(id)a3;
- (void)setAppStateMonitor:(id)a3;
- (void)setApplicationStateNotificationsEnabled:(id)a3;
- (void)setMemoryNotificationsEnabled:(id)a3;
@end

@implementation DTMobileNotificationsService

+ (void)registerCapabilities:(id)a3
{
}

- (void)messageReceived:(id)a3
{
  if ([a3 errorStatus] == 2)
  {
    [(DTMobileNotificationsService *)self _setAppStateNotificationsEnabled:0];
    MEMORY[0x270F9A6D0](self, sel__setMemNotificationsEnabled_);
  }
}

- (void)setApplicationStateNotificationsEnabled:(id)a3
{
  uint64_t v4 = [a3 BOOLValue];
  [(DTMobileNotificationsService *)self _setAppStateNotificationsEnabled:v4];
}

- (void)_setAppStateNotificationsEnabled:(BOOL)a3
{
  if (self->_applicationStateNotificationsEnabled != a3)
  {
    self->_applicationStateNotificationsEnabled = a3;
    if (a3)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_2308CDBF4;
      v6[3] = &unk_264B8F3C8;
      v6[4] = self;
      uint64_t v4 = [MEMORY[0x263F645C0] monitorWithConfiguration:v6];
      [(DTMobileNotificationsService *)self setAppStateMonitor:v4];
    }
    else
    {
      [(RBSProcessMonitor *)self->_appStateMonitor invalidate];
      appStateMonitor = self->_appStateMonitor;
      self->_appStateMonitor = 0;
    }
  }
}

- (void)setMemoryNotificationsEnabled:(id)a3
{
  [a3 BOOLValue];
  MEMORY[0x270F9A6D0](self, sel__setMemNotificationsEnabled_);
}

- (void)postDarwinNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (qword_268707FA8 != -1) {
    dispatch_once(&qword_268707FA8, &unk_26E5156C8);
  }
  if ([(id)qword_268707FA0 containsObject:v3])
  {
    id v4 = v3;
    uint32_t v5 = notify_post((const char *)[v4 UTF8String]);
    if (v5)
    {
      uint32_t v6 = v5;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412546;
        id v11 = v4;
        __int16 v12 = 1024;
        uint32_t v13 = v6;
        v7 = &_os_log_internal;
        v8 = "Failed to post notification %@, status %d";
        uint32_t v9 = 18;
LABEL_9:
        _os_log_impl(&dword_23087D000, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v10, v9);
      }
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v3;
    v7 = &_os_log_internal;
    v8 = "Failed to post notification %@";
    uint32_t v9 = 12;
    goto LABEL_9;
  }
}

- (void)_setMemNotificationsEnabled:(BOOL)a3
{
  memoryNotificationSource = self->_memoryNotificationSource;
  if (a3)
  {
    if (memoryNotificationSource) {
      return;
    }
    int v5 = socket(32, 3, 1);
    if (v5 == -1)
    {
      v8 = __error();
      printf("could not open event socket, socket() failed: %d\n", *v8);
    }
    else
    {
      int v6 = v5;
      uint64_t v21 = 0x300000001;
      int v22 = 3;
      if (ioctl(v5, 0x800C6502uLL, &v21))
      {
        __error();
        printf("could not establish event filter, ioctl() failed: %d\n");
      }
      else
      {
        LODWORD(v21) = 1;
        if (ioctl(v6, 0x8004667EuLL, &v21))
        {
          uint32_t v9 = __error();
          printf("could not set non-blocking io, ioctl() failed: %d\n", *v9);
          close(v6);
          int v6 = -1;
          if (!fcntl(-1, 2, 0x1000000)) {
            goto LABEL_17;
          }
        }
        else if (!fcntl(v6, 2, 0x1000000))
        {
LABEL_18:
          int v10 = dispatch_get_global_queue(0, 0);
          dispatch_source_t v11 = dispatch_source_create(MEMORY[0x263EF83E8], v6, 0, v10);

          handler[0] = MEMORY[0x263EF8330];
          handler[1] = 3221225472;
          handler[2] = sub_2308CE418;
          handler[3] = &unk_264B8ED98;
          int v20 = v6;
          __int16 v12 = v11;
          v18 = v12;
          v19 = self;
          dispatch_source_set_event_handler(v12, handler);
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = sub_2308CE548;
          v15[3] = &unk_264B8ED20;
          int v16 = v6;
          dispatch_source_set_cancel_handler(v12, v15);
          uint32_t v13 = self->_memoryNotificationSource;
          self->_memoryNotificationSource = (OS_dispatch_source *)v12;
          uint64_t v14 = v12;

          dispatch_resume((dispatch_object_t)self->_memoryNotificationSource);
          return;
        }
        __error();
        printf("could not set close-on-exec, fcntl() failed: %d\n");
      }
      close(v6);
    }
LABEL_17:
    [MEMORY[0x263EFF940] raise:@"DTMobileNotificationServiceException" format:@"Memory monitoring disabled due to error."];
    int v6 = -1;
    goto LABEL_18;
  }
  if (memoryNotificationSource)
  {
    dispatch_source_cancel(memoryNotificationSource);
    v7 = self->_memoryNotificationSource;
    self->_memoryNotificationSource = 0;
  }
}

- (void)_memoryNotification:(unsigned int)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v14[4] = *MEMORY[0x263EF8340];
  v13[0] = @"code";
  int v6 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  v14[0] = v6;
  v13[1] = @"pid";
  v7 = [NSNumber numberWithInt:v4];
  v14[1] = v7;
  v13[2] = @"mach_absolute_time";
  v8 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  v14[2] = v8;
  v13[3] = @"timestamp";
  uint32_t v9 = [MEMORY[0x263EFF910] date];
  v14[3] = v9;
  int v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  dispatch_source_t v11 = [MEMORY[0x263F38CA0] messageWithSelector:sel_memoryLevelNotification_ objectArguments:v10, 0];
  __int16 v12 = [(DTXService *)self channel];
  [v12 sendControlAsync:v11 replyHandler:0];
}

- (RBSProcessMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (void)setAppStateMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_memoryNotificationSource, 0);
}

@end