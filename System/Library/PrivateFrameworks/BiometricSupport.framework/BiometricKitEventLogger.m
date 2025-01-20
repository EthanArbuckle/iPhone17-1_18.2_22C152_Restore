@interface BiometricKitEventLogger
+ (id)logger;
- (BiometricKitEventLogger)init;
- (void)appendEvent:(id)a3;
- (void)appendEventValue:(unsigned int)a3 isMetadata:(BOOL)a4;
- (void)flushEvents;
- (void)logDeviceMetadata;
- (void)logEventOrCode:(unint64_t)a3;
- (void)logSmartKeyboardStatus;
@end

@implementation BiometricKitEventLogger

+ (id)logger
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__BiometricKitEventLogger_logger__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (logger_once != -1) {
    dispatch_once(&logger_once, block);
  }
  v2 = (void *)logger_sharedInstance;
  return v2;
}

void __33__BiometricKitEventLogger_logger__block_invoke(uint64_t a1)
{
  os_log_t v2 = os_log_create("com.apple.BiometricKit", "BKEventLogging");
  v3 = (void *)OSLogHandle;
  OSLogHandle = (uint64_t)v2;

  v4 = (void *)OSLogHandle;
  if (!OSLogHandle)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __33__BiometricKitEventLogger_logger__block_invoke_cold_1();
    }
    v4 = (void *)OSLogHandle;
  }
  objc_storeStrong(&OSLogTraceHandle, v4);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___BiometricKitEventLogger;
  uint64_t v5 = objc_msgSend(objc_msgSendSuper2(&v7, sel_allocWithZone_, 0), "init");
  v6 = (void *)logger_sharedInstance;
  logger_sharedInstance = v5;
}

- (BiometricKitEventLogger)init
{
  v11.receiver = self;
  v11.super_class = (Class)BiometricKitEventLogger;
  id v2 = [(BiometricKitEventLogger *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.BiometricKitEventLogger.dispatch", 0);
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *((dispatch_queue_t *)v2 + 1));
    v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    objc_super v7 = *((void *)v2 + 2);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __31__BiometricKitEventLogger_init__block_invoke;
    handler[3] = &unk_26454E2E0;
    id v10 = v2;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 2));
  }
  return (BiometricKitEventLogger *)v2;
}

uint64_t __31__BiometricKitEventLogger_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) flushEvents];
}

- (void)appendEventValue:(unsigned int)a3 isMetadata:(BOOL)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int eventListLength = self->_eventListLength;
  if (eventListLength)
  {
    if (eventListLength != 200) {
      goto LABEL_6;
    }
    eventList = self->_eventList;
    unsigned int v9 = self->_eventList[199];
    self->_eventList[199] = 1;
    [(BiometricKitEventLogger *)self flushEvents];
    uint64_t v10 = self->_eventListLength;
    self->_int eventListLength = v10 + 1;
    eventList[v10] = 1;
    uint64_t v11 = self->_eventListLength;
    self->_int eventListLength = v11 + 1;
    eventList[v11] = v9;
  }
  if (!a4) {
    [(BiometricKitEventLogger *)self logDeviceMetadata];
  }
LABEL_6:
  uint64_t v12 = self->_eventListLength;
  self->_int eventListLength = v12 + 1;
  self->_eventList[v12] = a3;
}

- (void)appendEvent:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = 0;
  [v4 encodeEventValue:(char *)&v6 + 4 secondValue:&v6];
  -[BiometricKitEventLogger appendEventValue:isMetadata:](self, "appendEventValue:isMetadata:", HIDWORD(v6), [v4 isMetadata]);
  if (v6) {
    -[BiometricKitEventLogger appendEventValue:isMetadata:](self, "appendEventValue:isMetadata:", v6, [v4 isMetadata]);
  }
  if (OSLogHandle) {
    dispatch_source_t v5 = OSLogHandle;
  }
  else {
    dispatch_source_t v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_DEBUG, "BKLogEvent: %@\n", buf, 0xCu);
  }
}

- (void)logEventOrCode:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__BiometricKitEventLogger_logEventOrCode___block_invoke;
  v4[3] = &unk_26454E430;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __42__BiometricKitEventLogger_logEventOrCode___block_invoke(uint64_t a1)
{
  obj = [[BKEvent alloc] initWithEventOrCode:*(void *)(a1 + 40)];
  if ([(BKEvent *)obj isStart]) {
    *(unsigned char *)(*(void *)(a1 + 32) + 829) = 1;
  }
  if ([(BKEvent *)obj isSmartKeyboard]) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 832), obj);
  }
  [*(id *)(a1 + 32) appendEvent:obj];
  BOOL v2 = [(BKEvent *)obj isTerminal];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    id v4 = *(NSObject **)(v3 + 16);
    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
    *(unsigned char *)(*(void *)(a1 + 32) + 828) = 1;
  }
  else if (!*(unsigned char *)(v3 + 828))
  {
    uint64_t v6 = *(NSObject **)(v3 + 16);
    dispatch_time_t v7 = dispatch_time(0, 90000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

- (void)logDeviceMetadata
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  mach_port_t v3 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v4 = IOServiceMatching("ApplePearlSEPDriver");
  io_service_t MatchingService = IOServiceGetMatchingService(v3, v4);
  if (MatchingService)
  {
    io_registry_entry_t v6 = MatchingService;
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    id CFProperty = (id)IORegistryEntryCreateCFProperty(MatchingService, @"CombinedSequenceEnabled", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    id v8 = (void *)IORegistryEntryCreateCFProperty(v6, @"CombinedSequenceAutoSet", v7, 0);
    if (CFProperty) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      int v10 = [v8 BOOLValue];
      int v11 = [CFProperty BOOLValue];
      if (v11) {
        uint64_t v12 = 524290;
      }
      else {
        uint64_t v12 = 524291;
      }
      uint64_t v13 = 0x80000;
      if (!v11) {
        uint64_t v13 = 524289;
      }
      if (v10) {
        uint64_t v14 = v12;
      }
      else {
        uint64_t v14 = v13;
      }
      v15 = [[BKEvent alloc] initWithEventOrCode:v14];
      [(BiometricKitEventLogger *)self appendEvent:v15];

      [(BiometricKitEventLogger *)self logSmartKeyboardStatus];
    }
    IOObjectRelease(v6);
  }
}

- (void)logSmartKeyboardStatus
{
  if (self->_lastSmartKeyboardEvent) {
    -[BiometricKitEventLogger appendEvent:](self, "appendEvent:");
  }
}

- (void)flushEvents
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_eventListLength)
  {
LABEL_23:
    id v7 = 0;
    goto LABEL_24;
  }
  BOOL startEventFound = self->_startEventFound;
  CFDictionaryRef v4 = &_os_log_internal;
  if (OSLogHandle) {
    dispatch_time_t v5 = OSLogHandle;
  }
  else {
    dispatch_time_t v5 = &_os_log_internal;
  }
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (!startEventFound)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_DEBUG, "BKLogEvent: not flushing events since no operation was created\n", buf, 2u);
    }
    goto LABEL_23;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_DEBUG, "BKLogEvent: flushing events\n", buf, 2u);
  }
  id v7 = objc_alloc_init(NSClassFromString(&cfstr_Awdbiometricki.isa));
  if (self->_eventListLength >= 1)
  {
    uint64_t v9 = 0;
    eventList = self->_eventList;
    *(void *)&long long v8 = 67109378;
    long long v17 = v8;
    do
    {
      if (OSLogHandle) {
        int v11 = OSLogHandle;
      }
      else {
        int v11 = v4;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = v11;
        uint64_t v13 = [[BKEvent alloc] initWithEncodedEventOrCode:eventList[v9]];
        *(_DWORD *)buf = v17;
        int v19 = v9;
        __int16 v20 = 2112;
        v21 = v13;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_DEBUG, "BKLogEvent flush %3d: %@\n\n", buf, 0x12u);
      }
      objc_msgSend(v7, "addEvent:", eventList[v9++], v17);
    }
    while (v9 < self->_eventListLength);
  }
  if (MEMORY[0x263F864A8]) {
    BOOL v14 = v7 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    AWDPostMetric();
    v15 = (void *)MEMORY[0x263F2AA88];
    v16 = [v7 dictionaryRepresentation];
    [v15 analyticsOSLogNSDictionary:v16 forEvent:@"biometricKitLogEvent"];
  }
LABEL_24:
  self->_int eventListLength = 0;
  *(_WORD *)&self->_terminalFlushPending = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSmartKeyboardEvent, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __33__BiometricKitEventLogger_logger__block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21FFF3000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.BKEventLogging'!\n", v0, 2u);
}

@end