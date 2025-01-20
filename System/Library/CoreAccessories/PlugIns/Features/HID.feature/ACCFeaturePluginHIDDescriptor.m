@interface ACCFeaturePluginHIDDescriptor
- (ACCFeaturePluginHIDDescriptor)initWithDecriptorInfo:(id)a3 sendOutReport:(id)a4 sendGetReport:(id)a5 sendComponentUpdate:(id)a6;
- (BOOL)handleGetReport:(int)a3 reportID:(unsigned __int8)a4 report:(id)a5;
- (BOOL)handleGetReportResponse:(unsigned __int8)a3 reportID:(unsigned __int8)a4 report:(id)a5;
- (BOOL)handleHIDComponentUpdate:(BOOL)a3;
- (BOOL)handleInReport:(id)a3;
- (BOOL)handleOutReport:(id)a3;
- (BOOL)isReady;
- (BOOL)isShuttingDown;
- (NSMutableArray)initialReportCache;
- (NSMutableData)getReportBuffer;
- (NSString)hidDeviceUUIDStr;
- (OS_dispatch_queue)hidCallbackQueue;
- (OS_dispatch_semaphore)getReportSemaphore;
- (OS_dispatch_source)registerDeviceMatchingTimerSource;
- (__IOHIDEventSystemClient)hidEventSystemClientRef;
- (__IOHIDUserDevice)deviceRef;
- (id)sendComponentUpdate;
- (id)sendGetReport;
- (id)sendOutReport;
- (int)getReportResult;
- (int)getReportType;
- (unsigned)getReportID;
- (void)dealloc;
- (void)removeDescriptor;
- (void)setDeviceRef:(__IOHIDUserDevice *)a3;
- (void)setGetReportBuffer:(id)a3;
- (void)setGetReportID:(unsigned __int8)a3;
- (void)setGetReportResult:(int)a3;
- (void)setGetReportSemaphore:(id)a3;
- (void)setGetReportType:(int)a3;
- (void)setHidCallbackQueue:(id)a3;
- (void)setHidEventSystemClientRef:(__IOHIDEventSystemClient *)a3;
- (void)setInitialReportCache:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setIsShuttingDown:(BOOL)a3;
- (void)setRegisterDeviceMatchingTimerSource:(id)a3;
- (void)setSendComponentUpdate:(id)a3;
- (void)setSendGetReport:(id)a3;
- (void)setSendOutReport:(id)a3;
- (void)startHIDEventSystemListener:(id)a3;
@end

@implementation ACCFeaturePluginHIDDescriptor

- (ACCFeaturePluginHIDDescriptor)initWithDecriptorInfo:(id)a3 sendOutReport:(id)a4 sendGetReport:(id)a5 sendComponentUpdate:(id)a6
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 1;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:]();
    }
    v16 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  else
  {
    v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v97 = "-[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:]";
    __int16 v98 = 2112;
    id v99 = v10;
    _os_log_impl(&dword_226BAF000, v16, OS_LOG_TYPE_DEFAULT, "%s: descriptorInfo %@ ", buf, 0x16u);
  }

  v95.receiver = self;
  v95.super_class = (Class)ACCFeaturePluginHIDDescriptor;
  v17 = [(ACCFeaturePluginHIDDescriptor *)&v95 init];
  if (v17)
  {
    uint64_t v18 = (uint64_t)v17;
    v17->_isShuttingDown = 0;
    id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
    v20 = *(void **)(v18 + 104);
    *(void *)(v18 + 104) = v19;

    *(unsigned char *)(v18 + 10) = 0;
    v21 = [MEMORY[0x263F08C38] UUID];
    uint64_t v22 = [v21 UUIDString];
    v23 = *(void **)(v18 + 24);
    *(void *)(v18 + 24) = v22;

    id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (v24)
    {
      v25 = [NSNumber numberWithInt:0];
      v26 = [v10 objectForKey:v25];

      if (v26)
      {
        v27 = [NSNumber numberWithInt:0];
        v28 = [v10 objectForKey:v27];
        [v24 setObject:v28 forKey:@"Transport"];
      }
      v29 = [NSNumber numberWithInt:1];
      v30 = [v10 objectForKey:v29];

      if (v30)
      {
        v31 = [NSNumber numberWithInt:1];
        v32 = [v10 objectForKey:v31];
        [v24 setObject:v32 forKey:@"VendorID"];
      }
      v33 = [NSNumber numberWithInt:2];
      v34 = [v10 objectForKey:v33];

      if (v34)
      {
        v35 = [NSNumber numberWithInt:2];
        v36 = [v10 objectForKey:v35];
        [v24 setObject:v36 forKey:@"ProductID"];
      }
      v37 = [NSNumber numberWithInt:3];
      v38 = [v10 objectForKey:v37];

      if (v38)
      {
        v39 = [NSNumber numberWithInt:3];
        v40 = [v10 objectForKey:v39];
        [v24 setObject:v40 forKey:@"VersionNumber"];
      }
      v41 = [NSNumber numberWithInt:4];
      v42 = [v10 objectForKey:v41];

      if (v42)
      {
        v43 = [NSNumber numberWithInt:4];
        v44 = [v10 objectForKey:v43];
        [v24 setObject:v44 forKey:@"Manufacturer"];
      }
      v45 = [NSNumber numberWithInt:12];
      v46 = [v10 objectForKey:v45];

      if (v46)
      {
        v47 = [NSNumber numberWithInt:12];
        v48 = [v10 objectForKey:v47];
        [v24 setObject:v48 forKey:@"Product"];
      }
      v49 = [NSNumber numberWithInt:6];
      v50 = [v10 objectForKey:v49];

      if (v50)
      {
        v51 = [NSNumber numberWithInt:6];
        v52 = [v10 objectForKey:v51];
        [v24 setObject:v52 forKey:@"SerialNumber"];
      }
      v53 = [NSNumber numberWithInt:7];
      v54 = [v10 objectForKey:v53];

      if (v54)
      {
        v55 = [NSNumber numberWithInt:7];
        v56 = [v10 objectForKey:v55];
        [v24 setObject:v56 forKey:@"CountryCode"];
      }
      v57 = [NSNumber numberWithInt:9];
      v58 = [v10 objectForKey:v57];

      if (v58)
      {
        v59 = [NSNumber numberWithInt:9];
        v60 = [v10 objectForKey:v59];
        [v24 setObject:v60 forKey:@"ReportDescriptor"];
      }
      v61 = [NSNumber numberWithInt:10];
      v62 = [v10 objectForKey:v61];

      if (v62)
      {
        v63 = [NSNumber numberWithInt:10];
        v64 = [v10 objectForKey:v63];
        [v24 setObject:v64 forKey:@"IAPHIDAccessoryCategory"];
      }
      v65 = [NSNumber numberWithInt:11];
      v66 = [v10 objectForKey:v65];

      if (v66)
      {
        v67 = [NSNumber numberWithInt:11];
        v68 = [v10 objectForKey:v67];
        [v24 setObject:v68 forKey:@"Authenticated"];
      }
      [v24 setObject:*(void *)(v18 + 24) forKey:@"PhysicalDeviceUniqueID"];
      v69 = [NSNumber numberWithInt:12];
      uint64_t v70 = [v10 objectForKey:v69];

      if (v70) {
        v71 = (__CFString *)v70;
      }
      else {
        v71 = &stru_26DABA008;
      }
      v72 = [MEMORY[0x263F089D8] stringWithString:v71];
      [v72 appendFormat:@"HIDDeviceQueue%@", *(void *)(v18 + 24)];
      v73 = v72;
      dispatch_queue_t v74 = dispatch_queue_create((const char *)[v73 UTF8String], 0);
      v75 = *(void **)(v18 + 48);
      *(void *)(v18 + 48) = v74;

      dispatch_source_t v76 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(v18 + 48));
      v77 = *(void **)(v18 + 64);
      *(void *)(v18 + 64) = v76;

      v78 = *(NSObject **)(v18 + 64);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __103__ACCFeaturePluginHIDDescriptor_initWithDecriptorInfo_sendOutReport_sendGetReport_sendComponentUpdate___block_invoke;
      handler[3] = &unk_2647CFF50;
      v79 = (ACCFeaturePluginHIDDescriptor *)(id)v18;
      v94 = v79;
      dispatch_source_set_event_handler(v78, handler);
      dispatch_source_set_timer(*(dispatch_source_t *)(v18 + 64), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_resume(*(dispatch_object_t *)(v18 + 64));
      [(ACCFeaturePluginHIDDescriptor *)v79 startHIDEventSystemListener:*(void *)(v18 + 24)];
      uint64_t v80 = IOHIDUserDeviceCreate();
      v79->_deviceRef = (__IOHIDUserDevice *)v80;
      if (v80)
      {
        IOHIDUserDeviceScheduleWithDispatchQueue();
        IOHIDUserDeviceRegisterGetReportCallback();
        IOHIDUserDeviceRegisterSetReportCallback();
        dispatch_semaphore_t v81 = dispatch_semaphore_create(0);
        getReportSemaphore = v79->_getReportSemaphore;
        v79->_getReportSemaphore = (OS_dispatch_semaphore *)v81;

        uint64_t v83 = MEMORY[0x22A662E70](v11);
        id sendOutReport = v79->_sendOutReport;
        v79->_id sendOutReport = (id)v83;

        uint64_t v85 = MEMORY[0x22A662E70](v12);
        id sendGetReport = v79->_sendGetReport;
        v79->_id sendGetReport = (id)v85;

        uint64_t v87 = MEMORY[0x22A662E70](v13);
        sendComponentUpdate = v79->_sendComponentUpdate;
        v79->_sendComponentUpdate = (id)v87;
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v89 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:]();
          }
          v89 = MEMORY[0x263EF8438];
          id v91 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
          -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:]();
        }

        sendComponentUpdate = v79;
        v79 = 0;
      }

      uint64_t v18 = v70;
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v73 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:]();
        }
        v73 = MEMORY[0x263EF8438];
        id v90 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
        -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:]();
      }
      v79 = 0;
    }
  }
  else
  {
    v79 = 0;
  }

  return v79;
}

unsigned char *__103__ACCFeaturePluginHIDDescriptor_initWithDecriptorInfo_sendOutReport_sendGetReport_sendComponentUpdate___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:]();
    }
    v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 24);
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_226BAF000, v4, OS_LOG_TYPE_DEFAULT, "registerDeviceMatchingTimer fired! %@ call handleHIDComponentUpdate true", (uint8_t *)&v7, 0xCu);
  }

  result = *(unsigned char **)(a1 + 32);
  if (!result[8]) {
    return (unsigned char *)[result handleHIDComponentUpdate:1];
  }
  return result;
}

- (void)removeDescriptor
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_226BAF000, v0, v1, "ERROR: _hidEventSystemClientRef not NULL after CFReleaseSafe", v2, v3, v4, v5, v6);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ACCFeaturePluginHIDDescriptor;
  [(ACCFeaturePluginHIDDescriptor *)&v2 dealloc];
}

- (void)startHIDEventSystemListener:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_hidEventSystemClientRef)
  {
    BOOL v14 = @"PhysicalDeviceUniqueID";
    v15[0] = v4;
    uint8_t v6 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    self->_hidEventSystemClientRef = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    IOHIDEventSystemClientScheduleWithDispatchQueue();
    IOHIDEventSystemClientSetMatching();
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:]();
      }
      int v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      hidDeviceUUIDStr = self->_hidDeviceUUIDStr;
      int v12 = 138412290;
      id v13 = hidDeviceUUIDStr;
      _os_log_impl(&dword_226BAF000, v7, OS_LOG_TYPE_DEFAULT, "start registerDeviceMatchingTimer, %@", (uint8_t *)&v12, 0xCu);
    }

    registerDeviceMatchingTimerSource = self->_registerDeviceMatchingTimerSource;
    dispatch_time_t v11 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(registerDeviceMatchingTimerSource, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    IOHIDEventSystemClientRegisterDeviceMatchingCallback();
  }
}

- (BOOL)handleInReport:(id)a3
{
  id v4 = a3;
  if (!self->_isReady)
  {
    initialReportCache = self->_initialReportCache;
    if (initialReportCache)
    {
      [(NSMutableArray *)initialReportCache addObject:v4];
    }
    else
    {
      if (gLogObjects) {
        BOOL v12 = gNumLogObjects < 1;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:]();
        }
        BOOL v14 = MEMORY[0x263EF8438];
        id v13 = MEMORY[0x263EF8438];
      }
      else
      {
        BOOL v14 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[ACCFeaturePluginHIDDescriptor handleInReport:]();
      }
    }
    goto LABEL_26;
  }
  [(ACCFeaturePluginHIDDescriptor *)self deviceRef];
  id v5 = v4;
  [v5 bytes];
  [v5 length];
  int v6 = IOHIDUserDeviceHandleReport();
  if (v6)
  {
    int v7 = v6;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:]();
      }
      id v8 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ACCFeaturePluginHIDDescriptor handleInReport:](v7, v8);
    }

LABEL_26:
    BOOL v10 = 0;
    goto LABEL_27;
  }
  BOOL v10 = 1;
LABEL_27:

  return v10;
}

- (BOOL)handleOutReport:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    int v6 = [(ACCFeaturePluginHIDDescriptor *)self sendOutReport];
    int v7 = [(ACCFeaturePluginHIDDescriptor *)self hidDeviceUUIDStr];
    ((void (**)(void, void *, id))v6)[2](v6, v7, v5);
  }
  return a3 != 0;
}

- (BOOL)handleGetReport:(int)a3 reportID:(unsigned __int8)a4 report:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  [(ACCFeaturePluginHIDDescriptor *)self setGetReportResult:3758097084];
  [(ACCFeaturePluginHIDDescriptor *)self setGetReportType:v6];
  [(ACCFeaturePluginHIDDescriptor *)self setGetReportID:v5];
  [(ACCFeaturePluginHIDDescriptor *)self setGetReportBuffer:v8];
  uint64_t v9 = [(ACCFeaturePluginHIDDescriptor *)self sendGetReport];
  BOOL v10 = [(ACCFeaturePluginHIDDescriptor *)self hidDeviceUUIDStr];
  id v11 = [NSNumber numberWithUnsignedChar:v6];
  BOOL v12 = [NSNumber numberWithUnsignedChar:v5];
  ((void (**)(void, void *, void *, void *))v9)[2](v9, v10, v11, v12);

  dispatch_time_t v13 = dispatch_time(0, 1000000000);
  BOOL v14 = [(ACCFeaturePluginHIDDescriptor *)self getReportSemaphore];
  intptr_t v15 = dispatch_semaphore_wait(v14, v13);

  BOOL v16 = 0;
  if (![(ACCFeaturePluginHIDDescriptor *)self isShuttingDown] && !v15)
  {
    if ([(ACCFeaturePluginHIDDescriptor *)self getReportResult])
    {
      BOOL v16 = 0;
    }
    else
    {
      v17 = [(ACCFeaturePluginHIDDescriptor *)self getReportBuffer];
      id v18 = v8;
      objc_msgSend(v17, "getBytes:length:", objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"));

      BOOL v16 = 1;
    }
  }
  [(ACCFeaturePluginHIDDescriptor *)self setGetReportType:3];
  [(ACCFeaturePluginHIDDescriptor *)self setGetReportID:0];
  [(ACCFeaturePluginHIDDescriptor *)self setGetReportBuffer:0];

  return v16;
}

- (BOOL)handleGetReportResponse:(unsigned __int8)a3 reportID:(unsigned __int8)a4 report:(id)a5
{
  int v5 = a4;
  int v6 = a3;
  id v8 = a5;
  if ([(ACCFeaturePluginHIDDescriptor *)self getReportType] == v6
    && [(ACCFeaturePluginHIDDescriptor *)self getReportID] == v5
    && ([(ACCFeaturePluginHIDDescriptor *)self getReportBuffer],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    [(ACCFeaturePluginHIDDescriptor *)self setGetReportResult:0];
    BOOL v10 = [(ACCFeaturePluginHIDDescriptor *)self getReportBuffer];
    unint64_t v11 = [v10 length];

    unint64_t v12 = [v8 length];
    if (v11 >= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    id v14 = [(ACCFeaturePluginHIDDescriptor *)self getReportBuffer];
    memcpy((void *)[v14 mutableBytes], (const void *)objc_msgSend(v8, "bytes"), v13);

    intptr_t v15 = [(ACCFeaturePluginHIDDescriptor *)self getReportBuffer];
    [v15 setLength:v13];

    BOOL v16 = [(ACCFeaturePluginHIDDescriptor *)self getReportSemaphore];
    dispatch_semaphore_signal(v16);

    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)handleHIDComponentUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:]();
    }
    int v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    int v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    hidDeviceUUIDStr = self->_hidDeviceUUIDStr;
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = (uint64_t)hidDeviceUUIDStr;
    _os_log_impl(&dword_226BAF000, v7, OS_LOG_TYPE_DEFAULT, "stop registerDeviceMatchingTimer, %@", buf, 0xCu);
  }

  dispatch_source_set_timer((dispatch_source_t)self->_registerDeviceMatchingTimerSource, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  uint64_t v9 = [(ACCFeaturePluginHIDDescriptor *)self sendComponentUpdate];
  BOOL v10 = [(ACCFeaturePluginHIDDescriptor *)self hidDeviceUUIDStr];
  ((void (**)(void, void *, BOOL))v9)[2](v9, v10, v3);

  self->_isReady = v3;
  if (!v3)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      intptr_t v15 = (NSMutableArray *)*(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:]();
      }
      intptr_t v15 = (NSMutableArray *)MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(&v15->super.super, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(NSMutableArray *)self->_initialReportCache count];
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = v17;
      _os_log_impl(&dword_226BAF000, &v15->super.super, OS_LOG_TYPE_DEFAULT, "handleHIDComponentUpdate: not ready, remove %lu cached reports.", buf, 0xCu);
    }
    goto LABEL_43;
  }
  uint64_t v11 = [(NSMutableArray *)self->_initialReportCache count];
  if (gLogObjects) {
    BOOL v12 = gNumLogObjects <= 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = !v12;
  if (v11)
  {
    if (v13)
    {
      id v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:]();
      }
      id v14 = MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [(NSMutableArray *)self->_initialReportCache count];
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = v20;
      _os_log_impl(&dword_226BAF000, v14, OS_LOG_TYPE_DEFAULT, "handleHIDComponentUpdate: ready, handle %lu cached reports.", buf, 0xCu);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    intptr_t v15 = self->_initialReportCache;
    uint64_t v21 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(v15);
          }
          -[ACCFeaturePluginHIDDescriptor handleInReport:](self, "handleInReport:", *(void *)(*((void *)&v27 + 1) + 8 * i), (void)v27);
        }
        uint64_t v22 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v22);
    }
LABEL_43:

    [(NSMutableArray *)self->_initialReportCache removeAllObjects];
    return 1;
  }
  if (v13)
  {
    id v18 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:]();
    }
    id v18 = MEMORY[0x263EF8438];
    id v26 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226BAF000, v18, OS_LOG_TYPE_DEFAULT, "handleHIDComponentUpdate: ready, no cached reports.", buf, 2u);
  }

  return 1;
}

- (BOOL)isShuttingDown
{
  return self->_isShuttingDown;
}

- (void)setIsShuttingDown:(BOOL)a3
{
  self->_isShuttingDown = a3;
}

- (NSString)hidDeviceUUIDStr
{
  return self->_hidDeviceUUIDStr;
}

- (unsigned)getReportID
{
  return self->_getReportID;
}

- (void)setGetReportID:(unsigned __int8)a3
{
  self->_getReportID = a3;
}

- (int)getReportType
{
  return self->_getReportType;
}

- (void)setGetReportType:(int)a3
{
  self->_getReportType = a3;
}

- (NSMutableData)getReportBuffer
{
  return self->_getReportBuffer;
}

- (void)setGetReportBuffer:(id)a3
{
}

- (int)getReportResult
{
  return self->_getReportResult;
}

- (void)setGetReportResult:(int)a3
{
  self->_getReportResult = a3;
}

- (__IOHIDUserDevice)deviceRef
{
  return self->_deviceRef;
}

- (void)setDeviceRef:(__IOHIDUserDevice *)a3
{
  self->_deviceRef = a3;
}

- (OS_dispatch_queue)hidCallbackQueue
{
  return self->_hidCallbackQueue;
}

- (void)setHidCallbackQueue:(id)a3
{
}

- (OS_dispatch_semaphore)getReportSemaphore
{
  return self->_getReportSemaphore;
}

- (void)setGetReportSemaphore:(id)a3
{
}

- (OS_dispatch_source)registerDeviceMatchingTimerSource
{
  return self->_registerDeviceMatchingTimerSource;
}

- (void)setRegisterDeviceMatchingTimerSource:(id)a3
{
}

- (id)sendOutReport
{
  return self->_sendOutReport;
}

- (void)setSendOutReport:(id)a3
{
}

- (id)sendGetReport
{
  return self->_sendGetReport;
}

- (void)setSendGetReport:(id)a3
{
}

- (id)sendComponentUpdate
{
  return self->_sendComponentUpdate;
}

- (void)setSendComponentUpdate:(id)a3
{
}

- (__IOHIDEventSystemClient)hidEventSystemClientRef
{
  return self->_hidEventSystemClientRef;
}

- (void)setHidEventSystemClientRef:(__IOHIDEventSystemClient *)a3
{
  self->_hidEventSystemClientRef = a3;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (NSMutableArray)initialReportCache
{
  return self->_initialReportCache;
}

- (void)setInitialReportCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialReportCache, 0);
  objc_storeStrong(&self->_sendComponentUpdate, 0);
  objc_storeStrong(&self->_sendGetReport, 0);
  objc_storeStrong(&self->_sendOutReport, 0);
  objc_storeStrong((id *)&self->_registerDeviceMatchingTimerSource, 0);
  objc_storeStrong((id *)&self->_getReportSemaphore, 0);
  objc_storeStrong((id *)&self->_hidCallbackQueue, 0);
  objc_storeStrong((id *)&self->_getReportBuffer, 0);
  objc_storeStrong((id *)&self->_hidDeviceUUIDStr, 0);
}

- (void)initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_226BAF000, v0, v1, "IOHIDUserDeviceCreate failed to create hidProperties dictionary", v2, v3, v4, v5, v6);
}

- (void)initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_226BAF000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

- (void)initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_226BAF000, v0, v1, "IOHIDUserDeviceCreate failed", v2, v3, v4, v5, v6);
}

- (void)handleInReport:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_226BAF000, v0, v1, "handling HID report failed, not ready and no cache.", v2, v3, v4, v5, v6);
}

- (void)handleInReport:(int)a1 .cold.3(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_226BAF000, a2, OS_LOG_TYPE_ERROR, "handling HID report failed 0x%x.", (uint8_t *)v2, 8u);
}

@end