@interface ASDTIOServiceMatcher
+ (id)forIOServiceWithClassName:(id)a3 withDelegate:(id)a4;
- (ASDTIOServiceMatchDelegate)delegate;
- (NSString)ioServiceClassName;
- (OS_dispatch_queue)matcherQueue;
- (const)ioServiceClassNameCStr;
- (id)initForIOServiceWithClassName:(id)a3 withDelegate:(id)a4;
- (unsigned)addMatchingNotificationForType:(char)a3[128] callback:(void *)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setIoServiceClassName:(id)a3;
- (void)setIoServiceClassNameCStr:(const char *)a3;
- (void)setMatcherQueue:(id)a3;
@end

@implementation ASDTIOServiceMatcher

+ (id)forIOServiceWithClassName:(id)a3 withDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc((Class)a1) initForIOServiceWithClassName:v6 withDelegate:v7];

  return v8;
}

- (id)initForIOServiceWithClassName:(id)a3 withDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    char v9 = [v7 isEqualToString:&stru_26FCA6768];
    char v10 = v8 ? v9 : 1;
    if ((v10 & 1) == 0)
    {
      v27.receiver = self;
      v27.super_class = (Class)ASDTIOServiceMatcher;
      v13 = [(ASDTIOServiceMatcher *)&v27 init];
      v12 = v13;
      if (v13)
      {
        objc_storeStrong((id *)&v13->_ioServiceClassName, a3);
        uint64_t v14 = [v7 cStringUsingEncoding:1];
        v12->_ioServiceClassNameCStr = (const char *)v14;
        objc_msgSend(NSString, "stringWithFormat:", @"com.apple.AudioServerDriverTransports.ASDTIOServiceMatcher.%s", v14);
        id v15 = objc_claimAutoreleasedReturnValue();
        v16 = (const char *)[v15 cStringUsingEncoding:1];
        v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_USER_INTERACTIVE, 0);

        dispatch_queue_t v19 = dispatch_queue_create(v16, v18);
        matcherQueue = v12->_matcherQueue;
        v12->_matcherQueue = (OS_dispatch_queue *)v19;

        objc_storeWeak((id *)&v12->_delegate, v8);
        mach_port_t mainPort = 0;
        if (MEMORY[0x24C5871F0](*MEMORY[0x263EF87F0], &mainPort))
        {
          v21 = ASDTBaseLogType();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[ASDTIOServiceMatcher initForIOServiceWithClassName:withDelegate:]();
          }
LABEL_11:

LABEL_12:
LABEL_13:
          v11 = 0;
          goto LABEL_19;
        }
        v22 = IONotificationPortCreate(mainPort);
        v12->_notificationPort = v22;
        if (!v22)
        {
          v21 = ASDTBaseLogType();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[ASDTIOServiceMatcher initForIOServiceWithClassName:withDelegate:]();
          }
          goto LABEL_11;
        }
        IONotificationPortSetDispatchQueue(v22, (dispatch_queue_t)v12->_matcherQueue);
        if (objc_opt_respondsToSelector())
        {
          unsigned int v23 = [(ASDTIOServiceMatcher *)v12 addMatchingNotificationForType:"IOServiceWillTerminate" callback:ASDTIOSerivceWillTerminateHandler];
          v12->_willTerminateNotification = v23;
          if (!v23) {
            goto LABEL_12;
          }
        }
        unsigned int v24 = [(ASDTIOServiceMatcher *)v12 addMatchingNotificationForType:"IOServiceFirstPublish" callback:ASDTIOServiceMatchingHandler];
        v12->_matchingNotification = v24;

        if (!v24) {
          goto LABEL_13;
        }
      }
      v12 = v12;
      v11 = v12;
      goto LABEL_19;
    }
  }
  v11 = 0;
  v12 = self;
LABEL_19:

  return v11;
}

- (void)dealloc
{
  io_object_t matchingNotification = self->_matchingNotification;
  if (matchingNotification) {
    IOObjectRelease(matchingNotification);
  }
  io_object_t willTerminateNotification = self->_willTerminateNotification;
  if (willTerminateNotification) {
    IOObjectRelease(willTerminateNotification);
  }
  notificationPort = self->_notificationPort;
  if (notificationPort) {
    IONotificationPortDestroy(notificationPort);
  }
  v6.receiver = self;
  v6.super_class = (Class)ASDTIOServiceMatcher;
  [(ASDTIOServiceMatcher *)&v6 dealloc];
}

- (unsigned)addMatchingNotificationForType:(char)a3[128] callback:(void *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CFDictionaryRef v7 = IOServiceMatching([(ASDTIOServiceMatcher *)self ioServiceClassNameCStr]);
  io_iterator_t notification = 0;
  if (IOServiceAddMatchingNotification(self->_notificationPort, a3, v7, (IOServiceMatchingCallback)a4, self, &notification))
  {
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = notification == 0;
  }
  if (v8)
  {
    char v9 = ASDTBaseLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      char v10 = [(ASDTIOServiceMatcher *)self ioServiceClassName];
      [(ASDTIOServiceMatcher *)v10 addMatchingNotificationForType:buf callback:v9];
    }

    IONotificationPortDestroy(self->_notificationPort);
    unsigned int result = 0;
    self->_notificationPort = 0;
  }
  else
  {
    v11 = [(ASDTIOServiceMatcher *)self matcherQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__ASDTIOServiceMatcher_addMatchingNotificationForType_callback___block_invoke;
    block[3] = &unk_265243FB8;
    block[4] = self;
    block[5] = a4;
    io_iterator_t v14 = notification;
    dispatch_sync(v11, block);

    return notification;
  }
  return result;
}

uint64_t __64__ASDTIOServiceMatcher_addMatchingNotificationForType_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(a1 + 40))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 48));
}

- (ASDTIOServiceMatchDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASDTIOServiceMatchDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)ioServiceClassName
{
  return self->_ioServiceClassName;
}

- (void)setIoServiceClassName:(id)a3
{
}

- (const)ioServiceClassNameCStr
{
  return self->_ioServiceClassNameCStr;
}

- (void)setIoServiceClassNameCStr:(const char *)a3
{
  self->_ioServiceClassNameCStr = a3;
}

- (OS_dispatch_queue)matcherQueue
{
  return self->_matcherQueue;
}

- (void)setMatcherQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcherQueue, 0);
  objc_storeStrong((id *)&self->_ioServiceClassName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initForIOServiceWithClassName:withDelegate:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_11();
  _os_log_error_impl(&dword_2489BC000, v0, OS_LOG_TYPE_ERROR, "%s.%@: IONotificationPortCreate failed.", (uint8_t *)v1, 0x16u);
}

- (void)initForIOServiceWithClassName:withDelegate:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_11();
  _os_log_error_impl(&dword_2489BC000, v0, OS_LOG_TYPE_ERROR, "%s.%@: IOMainPort failed.", (uint8_t *)v1, 0x16u);
}

- (void)addMatchingNotificationForType:(uint8_t *)buf callback:(os_log_t)log .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = "ASDTIOServiceMatcher";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2080;
  *((void *)buf + 3) = a2;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "%s.%@: IOServiceAddMatchingNotification(%s) failed.", buf, 0x20u);
}

@end