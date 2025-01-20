@interface IOUSBHostObject
- (BOOL)abortDeviceRequestsWithError:(NSError *)error;
- (BOOL)abortDeviceRequestsWithOption:(IOUSBHostAbortOption)option error:(NSError *)error;
- (BOOL)enqueueDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler;
- (BOOL)enqueueDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler;
- (BOOL)enqueueDeviceRequest:(IOUSBDeviceRequest)request error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler;
- (BOOL)openWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)sendDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error;
- (BOOL)sendDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred error:(NSError *)error;
- (BOOL)sendDeviceRequest:(IOUSBDeviceRequest)request error:(NSError *)error;
- (IONotificationPort)ioNotificationPortRef;
- (IOUSBHostInterestNotifier)interestNotifier;
- (IOUSBHostObject)initWithIOService:(io_service_t)ioService options:(IOUSBHostObjectInitOptions)options queue:(dispatch_queue_t)queue error:(NSError *)error interestHandler:(IOUSBHostInterestHandler)interestHandler;
- (IOUSBHostObject)initWithIOService:(io_service_t)ioService queue:(dispatch_queue_t)queue error:(NSError *)error interestHandler:(IOUSBHostInterestHandler)interestHandler;
- (NSArray)supportedStringLanguages;
- (NSMutableData)ioDataWithCapacity:(NSUInteger)capacity error:(NSError *)error;
- (NSMutableDictionary)descriptorCache;
- (NSMutableSet)invalidDescriptorCache;
- (NSUInteger)deviceAddress;
- (const)capabilityDescriptors;
- (const)configurationDescriptorWithConfigurationValue:(NSUInteger)configurationValue error:(NSError *)error;
- (const)configurationDescriptorWithIndex:(NSUInteger)index error:(NSError *)error;
- (const)descriptorWithType:(tIOUSBDescriptorType)type length:(NSUInteger *)length error:(NSError *)error;
- (const)descriptorWithType:(tIOUSBDescriptorType)type length:(NSUInteger *)length index:(NSUInteger)index languageID:(NSUInteger)languageID error:(NSError *)error;
- (const)descriptorWithType:(tIOUSBDescriptorType)type length:(NSUInteger *)length index:(NSUInteger)index languageID:(NSUInteger)languageID requestType:(tIOUSBDeviceRequestTypeValue)requestType requestRecipient:(tIOUSBDeviceRequestRecipientValue)requestRecipient error:(NSError *)error;
- (const)deviceDescriptor;
- (const)stringWithIndex:(NSUInteger)index error:(NSError *)error;
- (const)stringWithIndex:(NSUInteger)index languageID:(NSUInteger)languageID error:(NSError *)error;
- (dispatch_queue_t)queue;
- (id)interestHandler;
- (io_service_t)ioService;
- (uint64_t)frameNumberWithTime:(IOUSBHostTime *)time;
- (unint64_t)debugLoggingMask;
- (unsigned)ioConnection;
- (void)closeWithOptions:(unsigned int)a3;
- (void)dealloc;
- (void)destroy;
- (void)destroyWithOptions:(unint64_t)a3;
- (void)setDebugLoggingMask:(unint64_t)a3;
- (void)setDescriptorCache:(id)a3;
- (void)setDeviceDescriptor:(const IOUSBDeviceDescriptor *)a3;
- (void)setInterestHandler:(id)a3;
- (void)setInterestNotifier:(id)a3;
- (void)setInvalidDescriptorCache:(id)a3;
- (void)setIoConnection:(unsigned int)a3;
- (void)setIoNotificationPortRef:(IONotificationPort *)a3;
- (void)setIoService:(unsigned int)a3;
- (void)setQueue:(id)a3;
- (void)setSupportedStringLanguages:(id)a3;
@end

@implementation IOUSBHostObject

- (IOUSBHostObject)initWithIOService:(io_service_t)ioService queue:(dispatch_queue_t)queue error:(NSError *)error interestHandler:(IOUSBHostInterestHandler)interestHandler
{
  return [(IOUSBHostObject *)self initWithIOService:*(void *)&ioService options:0 queue:queue error:error interestHandler:interestHandler];
}

- (IOUSBHostObject)initWithIOService:(io_service_t)ioService options:(IOUSBHostObjectInitOptions)options queue:(dispatch_queue_t)queue error:(NSError *)error interestHandler:(IOUSBHostInterestHandler)interestHandler
{
  uint64_t v10 = *(void *)&ioService;
  uint64_t v115 = *MEMORY[0x263EF8340];
  v12 = queue;
  IOUSBHostInterestHandler v13 = interestHandler;
  v108.receiver = self;
  v108.super_class = (Class)IOUSBHostObject;
  v14 = [(IOUSBHostObject *)&v108 init];
  v15 = v14;
  if (!v14)
  {
    if (error)
    {
      v103 = v12;
      IOUSBHostInterestHandler v20 = v13;
      uint64_t v109 = *MEMORY[0x263F08320];
      v21 = [MEMORY[0x263F086E0] mainBundle];
      v22 = [v21 localizedStringForKey:@"Failed to create IOUSBHostObject." value:&stru_26DBD82D0 table:0];
      v112 = v22;
      uint64_t v110 = *MEMORY[0x263F08338];
      v23 = [MEMORY[0x263F086E0] mainBundle];
      v24 = [v23 localizedStringForKey:@"Failed [super init]" value:&stru_26DBD82D0 table:0];
      v113 = v24;
      uint64_t v111 = *MEMORY[0x263F08348];
      v25 = [MEMORY[0x263F086E0] mainBundle];
      v26 = [v25 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v114 = v26;
      v27 = [NSDictionary dictionaryWithObjects:&v112 forKeys:&v109 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870199 userInfo:v27];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:]();
      }

      IOUSBHostInterestHandler v13 = v20;
      v12 = v103;
    }
    goto LABEL_10;
  }
  [(IOUSBHostObject *)v14 setDebugLoggingMask:1];
  [(IOUSBHostObject *)v15 setIoService:v10];
  IOObjectRetain([(IOUSBHostObject *)v15 ioService]);
  [(IOUSBHostObject *)v15 setIoConnection:0];
  [(IOUSBHostObject *)v15 setIoNotificationPortRef:0];
  [(IOUSBHostObject *)v15 setInvalidDescriptorCache:0];
  [(IOUSBHostObject *)v15 setDescriptorCache:0];
  [(IOUSBHostObject *)v15 setInterestHandler:0];
  v16 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:1];
  [(IOUSBHostObject *)v15 setInvalidDescriptorCache:v16];

  v17 = [(IOUSBHostObject *)v15 invalidDescriptorCache];

  if (!v17)
  {
    if (error)
    {
      v104 = v12;
      IOUSBHostInterestHandler v29 = v13;
      uint64_t v109 = *MEMORY[0x263F08320];
      v30 = [MEMORY[0x263F086E0] mainBundle];
      v31 = [v30 localizedStringForKey:@"Failed to create IOUSBHostObject." value:&stru_26DBD82D0 table:0];
      v112 = v31;
      uint64_t v110 = *MEMORY[0x263F08338];
      v32 = [MEMORY[0x263F086E0] mainBundle];
      v33 = [v32 localizedStringForKey:@"Unable to allocateNSMutableSet." value:&stru_26DBD82D0 table:0];
      v113 = v33;
      uint64_t v111 = *MEMORY[0x263F08348];
      v34 = [MEMORY[0x263F086E0] mainBundle];
      v35 = [v34 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v114 = v35;
      v36 = [NSDictionary dictionaryWithObjects:&v112 forKeys:&v109 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v36];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:]();
      }
      goto LABEL_33;
    }
    goto LABEL_40;
  }
  v18 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
  [(IOUSBHostObject *)v15 setDescriptorCache:v18];

  v19 = [(IOUSBHostObject *)v15 descriptorCache];

  if (!v19)
  {
    if (error)
    {
      v104 = v12;
      IOUSBHostInterestHandler v29 = v13;
      uint64_t v109 = *MEMORY[0x263F08320];
      v37 = [MEMORY[0x263F086E0] mainBundle];
      v38 = [v37 localizedStringForKey:@"Failed to create IOUSBHostObject." value:&stru_26DBD82D0 table:0];
      v112 = v38;
      uint64_t v110 = *MEMORY[0x263F08338];
      v39 = [MEMORY[0x263F086E0] mainBundle];
      v40 = [v39 localizedStringForKey:@"Unable to allocate NSMutableDictionary." value:&stru_26DBD82D0 table:0];
      v113 = v40;
      uint64_t v111 = *MEMORY[0x263F08348];
      v41 = [MEMORY[0x263F086E0] mainBundle];
      v42 = [v41 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v114 = v42;
      v36 = [NSDictionary dictionaryWithObjects:&v112 forKeys:&v109 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v36];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:]();
      }
      goto LABEL_33;
    }
    goto LABEL_40;
  }
  if (v12)
  {
    [(IOUSBHostObject *)v15 setQueue:v12];
  }
  else
  {
    dispatch_queue_t v43 = dispatch_queue_create("IOUSBHostDispatchQueue", 0);
    [(IOUSBHostObject *)v15 setQueue:v43];
  }
  v44 = [(IOUSBHostObject *)v15 queue];

  if (!v44)
  {
    if (error)
    {
      v104 = v12;
      IOUSBHostInterestHandler v29 = v13;
      uint64_t v109 = *MEMORY[0x263F08320];
      v57 = [MEMORY[0x263F086E0] mainBundle];
      v58 = [v57 localizedStringForKey:@"Failed to create IOUSBHostObject." value:&stru_26DBD82D0 table:0];
      v112 = v58;
      uint64_t v110 = *MEMORY[0x263F08338];
      v59 = [MEMORY[0x263F086E0] mainBundle];
      v60 = [v59 localizedStringForKey:@"Unable to allocate dispatch queue." value:&stru_26DBD82D0 table:0];
      v113 = v60;
      uint64_t v111 = *MEMORY[0x263F08348];
      v61 = [MEMORY[0x263F086E0] mainBundle];
      v62 = [v61 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v114 = v62;
      v36 = [NSDictionary dictionaryWithObjects:&v112 forKeys:&v109 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v36];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.4();
      }
      goto LABEL_33;
    }
LABEL_40:
    v28 = 0;
    goto LABEL_41;
  }
  [(IOUSBHostObject *)v15 setIoNotificationPortRef:IONotificationPortCreate(*MEMORY[0x263F0EC88])];
  if (![(IOUSBHostObject *)v15 ioNotificationPortRef])
  {
    if (error)
    {
      v104 = v12;
      IOUSBHostInterestHandler v29 = v13;
      uint64_t v109 = *MEMORY[0x263F08320];
      v63 = [MEMORY[0x263F086E0] mainBundle];
      v64 = [v63 localizedStringForKey:@"Failed to create IOUSBHostObject." value:&stru_26DBD82D0 table:0];
      v112 = v64;
      uint64_t v110 = *MEMORY[0x263F08338];
      v65 = [MEMORY[0x263F086E0] mainBundle];
      v66 = [v65 localizedStringForKey:@"Unable to create IONotificationPort port." value:&stru_26DBD82D0 table:0];
      v113 = v66;
      uint64_t v111 = *MEMORY[0x263F08348];
      v67 = [MEMORY[0x263F086E0] mainBundle];
      v68 = [v67 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v114 = v68;
      v36 = [NSDictionary dictionaryWithObjects:&v112 forKeys:&v109 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v36];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.5();
      }
LABEL_33:

      IOUSBHostInterestHandler v13 = v29;
      v12 = v104;
      goto LABEL_40;
    }
    goto LABEL_40;
  }
  v45 = [(IOUSBHostObject *)v15 ioNotificationPortRef];
  v46 = [(IOUSBHostObject *)v15 queue];
  IONotificationPortSetDispatchQueue(v45, v46);

  id v107 = 0;
  LOBYTE(v45) = [(IOUSBHostObject *)v15 openWithOptions:options error:&v107];
  id v47 = v107;
  v48 = v47;
  if ((v45 & 1) == 0)
  {
    int v96 = [v47 code];
    v69 = [v48 userInfo];
    uint64_t v70 = *MEMORY[0x263F08338];
    v71 = [v69 objectForKeyedSubscript:*MEMORY[0x263F08338]];
    v72 = [v48 userInfo];
    uint64_t v73 = *MEMORY[0x263F08348];
    v97 = v72;
    v74 = [v72 objectForKeyedSubscript:*MEMORY[0x263F08348]];
    id v75 = v71;
    if (error)
    {
      v94 = error;
      v95 = v69;
      v101 = v48;
      v105 = v12;
      IOUSBHostInterestHandler v99 = v13;
      uint64_t v109 = *MEMORY[0x263F08320];
      [MEMORY[0x263F086E0] mainBundle];
      v77 = v76 = v75;
      v78 = [v77 localizedStringForKey:@"Failed to create IOUSBHostObject." value:&stru_26DBD82D0 table:0];
      v112 = v78;
      uint64_t v110 = v70;
      v79 = [MEMORY[0x263F086E0] mainBundle];
      v80 = [v79 localizedStringForKey:v75 value:&stru_26DBD82D0 table:0];
      v113 = v80;
      uint64_t v111 = v73;
      v81 = [MEMORY[0x263F086E0] mainBundle];
      v82 = [v81 localizedStringForKey:v74 value:&stru_26DBD82D0 table:0];
      v114 = v82;
      v83 = [NSDictionary dictionaryWithObjects:&v112 forKeys:&v109 count:3];

      id v75 = v76;
      *v94 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v96 userInfo:v83];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.8(v76);
      }

      IOUSBHostInterestHandler v13 = v99;
      v48 = v101;
      v12 = v105;
      v69 = v95;
    }

    goto LABEL_39;
  }
  unint64_t v106 = 0;
  [(IOUSBHostObject *)v15 setDeviceDescriptor:[(IOUSBHostObject *)v15 descriptorWithType:1 length:&v106 error:error]];
  if (![(IOUSBHostObject *)v15 deviceDescriptor]
    || (unint64_t v49 = v106, v49 < *(unsigned __int8 *)[(IOUSBHostObject *)v15 deviceDescriptor]))
  {
    if (error)
    {
      IOUSBHostInterestHandler v98 = v13;
      v100 = v48;
      uint64_t v109 = *MEMORY[0x263F08320];
      v50 = [MEMORY[0x263F086E0] mainBundle];
      v51 = [v50 localizedStringForKey:@"Failed to create IOUSBHostObject." value:&stru_26DBD82D0 table:0];
      v112 = v51;
      uint64_t v110 = *MEMORY[0x263F08338];
      v52 = [MEMORY[0x263F086E0] mainBundle];
      v53 = [v52 localizedStringForKey:@"Unable to obtain device descriptor." value:&stru_26DBD82D0 table:0];
      v113 = v53;
      uint64_t v111 = *MEMORY[0x263F08348];
      v54 = [MEMORY[0x263F086E0] mainBundle];
      v55 = [v54 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v114 = v55;
      v56 = [NSDictionary dictionaryWithObjects:&v112 forKeys:&v109 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870212 userInfo:v56];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.6();
      }

      IOUSBHostInterestHandler v13 = v98;
      v48 = v100;
    }
LABEL_39:

    goto LABEL_40;
  }
  if (v13)
  {
    [(IOUSBHostObject *)v15 setInterestHandler:v13];

    v85 = [[IOUSBHostInterestNotifier alloc] initWithOwner:v15 service:v10 callback:_interestNotificationCallback];
    [(IOUSBHostObject *)v15 setInterestNotifier:v85];

    v86 = [(IOUSBHostObject *)v15 interestNotifier];

    if (!v86)
    {
      if (error)
      {
        v102 = v48;
        uint64_t v109 = *MEMORY[0x263F08320];
        v87 = [MEMORY[0x263F086E0] mainBundle];
        v88 = [v87 localizedStringForKey:@"Failed to create IOUSBHostObject." value:&stru_26DBD82D0 table:0];
        v112 = v88;
        uint64_t v110 = *MEMORY[0x263F08338];
        v89 = [MEMORY[0x263F086E0] mainBundle];
        v90 = [v89 localizedStringForKey:@"Unable to create IOUSBHostInterestNotifier" value:&stru_26DBD82D0 table:0];
        v113 = v90;
        uint64_t v111 = *MEMORY[0x263F08348];
        v91 = [MEMORY[0x263F086E0] mainBundle];
        v92 = [v91 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
        v114 = v92;
        v93 = [NSDictionary dictionaryWithObjects:&v112 forKeys:&v109 count:3];

        *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870212 userInfo:v93];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.7();
        }

        v48 = v102;
      }
      IOUSBHostInterestHandler v13 = 0;
      goto LABEL_39;
    }
  }

  IOUSBHostInterestHandler v13 = 0;
LABEL_10:
  v28 = v15;
LABEL_41:

  return v28;
}

- (void)destroy
{
}

- (void)destroyWithOptions:(unint64_t)a3
{
  char v3 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->destroyed, (unsigned __int8 *)&v3, 1u);
  if (!v3)
  {
    char v4 = a3;
    v6 = [(IOUSBHostObject *)self interestNotifier];

    if (v6)
    {
      v7 = [(IOUSBHostObject *)self interestNotifier];
      [v7 destroy];

      [(IOUSBHostObject *)self setInterestNotifier:0];
    }
    if ([(IOUSBHostObject *)self ioNotificationPortRef])
    {
      IONotificationPortDestroy([(IOUSBHostObject *)self ioNotificationPortRef]);
      [(IOUSBHostObject *)self setIoNotificationPortRef:0];
    }
    if ([(IOUSBHostObject *)self ioConnection]) {
      [(IOUSBHostObject *)self closeWithOptions:(v4 & 1) << 16];
    }
    if ([(IOUSBHostObject *)self ioService])
    {
      IOObjectRelease([(IOUSBHostObject *)self ioService]);
      [(IOUSBHostObject *)self setIoService:0];
    }
  }
}

- (void)dealloc
{
  [(IOUSBHostObject *)self destroy];
  v3.receiver = self;
  v3.super_class = (Class)IOUSBHostObject;
  [(IOUSBHostObject *)&v3 dealloc];
}

- (BOOL)openWithOptions:(unint64_t)a3 error:(id *)a4
{
  kern_return_t v10;
  kern_return_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t MachPort;
  kern_return_t v22;
  kern_return_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  io_connect_t connect;
  uint64_t input;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x263EF8340];
  unsigned int v7 = [(IOUSBHostObject *)self ioConnection];
  if (a3 || !v7)
  {
    connect = 0;
    io_service_t v9 = [(IOUSBHostObject *)self ioService];
    uint64_t v10 = IOServiceOpen(v9, *MEMORY[0x263EF8960], 0, &connect);
    if (v10)
    {
      if (a4)
      {
        v11 = v10;
        v33 = *MEMORY[0x263F08320];
        v12 = [MEMORY[0x263F086E0] mainBundle];
        IOUSBHostInterestHandler v13 = [v12 localizedStringForKey:@"Unable to open io_service_t object and create user client." value:&stru_26DBD82D0 table:0];
        v36 = v13;
        v34 = *MEMORY[0x263F08338];
        v14 = [MEMORY[0x263F086E0] mainBundle];
        v15 = [v14 localizedStringForKey:@"IOServiceOpen failed." value:&stru_26DBD82D0 table:0];
        v37 = v15;
        v35 = *MEMORY[0x263F08348];
        v16 = [MEMORY[0x263F086E0] mainBundle];
        v17 = [v16 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
        v38 = v17;
        v18 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v33 count:3];

        *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v11 userInfo:v18];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[IOUSBHostObject openWithOptions:error:]();
        }
      }
      return 0;
    }
    else
    {
      [(IOUSBHostObject *)self setIoConnection:connect];
      IOUSBHostInterestHandler v20 = [(IOUSBHostObject *)self ioConnection];
      MachPort = IONotificationPortGetMachPort([(IOUSBHostObject *)self ioNotificationPortRef]);
      MEMORY[0x22A680DF0](v20, 0, MachPort, 0);
      input = a3 & 1 | (((a3 >> 1) & 1) << 16);
      v22 = IOConnectCallScalarMethod([(IOUSBHostObject *)self ioConnection], 0, &input, 1u, 0, 0);
      BOOL v8 = v22 == 0;
      if (v22 && a4)
      {
        v23 = v22;
        v33 = *MEMORY[0x263F08320];
        v24 = [MEMORY[0x263F086E0] mainBundle];
        v25 = [v24 localizedStringForKey:@"Unable to open io_service_t object and create user client." value:&stru_26DBD82D0 table:0];
        v36 = v25;
        v34 = *MEMORY[0x263F08338];
        v26 = [MEMORY[0x263F086E0] mainBundle];
        v27 = [v26 localizedStringForKey:@"Exclusive open of usb object failed." value:&stru_26DBD82D0 table:0];
        v37 = v27;
        v35 = *MEMORY[0x263F08348];
        v28 = [MEMORY[0x263F086E0] mainBundle];
        IOUSBHostInterestHandler v29 = [v28 localizedStringForKey:@"Another client likely has exclusive access." value:&stru_26DBD82D0 table:0];
        v38 = v29;
        v30 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v33 count:3];

        *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v23 userInfo:v30];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[IOUSBHostObject openWithOptions:error:]();
        }
      }
    }
  }
  else
  {
    if (([(IOUSBHostObject *)self debugLoggingMask] & 0x80) != 0) {
      NSLog(&cfstr_LineDOfSSservi.isa, 240, "/Library/Caches/com.apple.xbs/Sources/IOUSBHostFamily/IOUSBHostFramework/IOUSBHostObject.m", "-[IOUSBHostObject openWithOptions:error:]");
    }
    return 1;
  }
  return v8;
}

- (void)closeWithOptions:(unsigned int)a3
{
  input[1] = *MEMORY[0x263EF8340];
  if ([(IOUSBHostObject *)self ioConnection])
  {
    input[0] = a3;
    IOConnectCallScalarMethod([(IOUSBHostObject *)self ioConnection], 1u, input, 1u, 0, 0);
    IOServiceClose([(IOUSBHostObject *)self ioConnection]);
    [(IOUSBHostObject *)self setIoConnection:0];
  }
  else if ([(IOUSBHostObject *)self debugLoggingMask])
  {
    NSLog(&cfstr_LineDOfSSservi_0.isa, 302, "/Library/Caches/com.apple.xbs/Sources/IOUSBHostFamily/IOUSBHostFramework/IOUSBHostObject.m", "-[IOUSBHostObject closeWithOptions:]");
  }
}

- (BOOL)sendDeviceRequest:(IOUSBDeviceRequest)request error:(NSError *)error
{
  return [(IOUSBHostObject *)self sendDeviceRequest:request data:0 bytesTransferred:0 completionTimeout:error error:5.0];
}

- (BOOL)sendDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred error:(NSError *)error
{
  return [(IOUSBHostObject *)self sendDeviceRequest:request data:data bytesTransferred:bytesTransferred completionTimeout:error error:5.0];
}

- (BOOL)sendDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error
{
  kern_return_t v25;
  kern_return_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSError **v43;
  void *v44;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t input;
  unint64_t bRequest;
  unint64_t wValue;
  uint64_t wIndex;
  unint64_t v51;
  char *__ptr32 *v52;
  NSMutableData *v53;
  void v54[3];
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x263EF8340];
  unint64_t wLength = request.wLength;
  IOUSBHostInterestHandler v13 = data;
  v14 = v13;
  if (v13)
  {
    if ([(NSMutableData *)v13 length] < wLength)
    {
      if (error)
      {
        v15 = error;
        v55 = (void *)*MEMORY[0x263F08320];
        v16 = [MEMORY[0x263F086E0] mainBundle];
        v17 = [v16 localizedStringForKey:@"Unable to send device request." value:&stru_26DBD82D0 table:0];
        input = (uint64_t)v17;
        v56 = (void *)*MEMORY[0x263F08338];
        v18 = [MEMORY[0x263F086E0] mainBundle];
        v19 = [v18 localizedStringForKey:@"Data buffer is smaller than request wLength." value:&stru_26DBD82D0 table:0];
        bRequest = (unint64_t)v19;
        v57 = (void *)*MEMORY[0x263F08348];
        IOUSBHostInterestHandler v20 = [MEMORY[0x263F086E0] mainBundle];
        v21 = [v20 localizedStringForKey:@"The wLength field of the request must be less than or equal to the data's length" value:&stru_26DBD82D0 table:0];
        wValue = (unint64_t)v21;
        v22 = [NSDictionary dictionaryWithObjects:&input forKeys:&v55 count:3];

        IOUSBHostObject *v15 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v22];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[IOUSBHostObject sendDeviceRequest:data:bytesTransferred:completionTimeout:error:]();
        }
      }
      BOOL v23 = 0;
      goto LABEL_21;
    }
    dispatch_queue_t v43 = error;
    IOUSBHostInterestHandler v13 = [(NSMutableData *)v14 mutableBytes];
  }
  else
  {
    dispatch_queue_t v43 = error;
  }
  input = request.bmRequestType;
  bRequest = request.bRequest;
  wValue = request.wValue;
  wIndex = request.wIndex;
  v24 = &off_2279B3000;
  LODWORD(v24) = vcvtad_u64_f64(completionTimeout * 1000.0);
  v51 = wLength;
  v52 = v24;
  v53 = v13;
  outputCnt = 1;
  output = 0;
  v25 = IOConnectCallScalarMethod([(IOUSBHostObject *)self ioConnection], 2u, &input, 7u, &output, &outputCnt);
  v26 = v25;
  if (bytesTransferred) {
    *bytesTransferred = output;
  }
  BOOL v23 = v25 == 0;
  if (v25)
  {
    if (v44)
    {
      v54[0] = *MEMORY[0x263F08320];
      v27 = [MEMORY[0x263F086E0] mainBundle];
      v28 = [v27 localizedStringForKey:@"Unable to send device request." value:&stru_26DBD82D0 table:0];
      v55 = v28;
      v54[1] = *MEMORY[0x263F08338];
      IOUSBHostInterestHandler v29 = [MEMORY[0x263F086E0] mainBundle];
      v30 = [v29 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v56 = v30;
      v54[2] = *MEMORY[0x263F08348];
      v31 = [MEMORY[0x263F086E0] mainBundle];
      v32 = [v31 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v57 = v32;
      v33 = [NSDictionary dictionaryWithObjects:&v55 forKeys:v54 count:3];

      void *v44 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v26 userInfo:v33];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostObject sendDeviceRequest:data:bytesTransferred:completionTimeout:error:]();
      }
    }
  }
  else if (*(unsigned __int16 *)&request.bmRequestType == 1792)
  {
    v34 = [(IOUSBHostObject *)self descriptorCache];
    objc_sync_enter(v34);
    v35 = [(IOUSBHostObject *)self descriptorCache];
    v36 = HIBYTE(request.wValue) | ((unint64_t)LOBYTE(request.wValue) << 8) | (*(_DWORD *)&request.wIndex << 16);
    v37 = [NSNumber numberWithUnsignedInteger:v36];
    v38 = [v35 objectForKey:v37];

    if (v38)
    {
      v39 = [(IOUSBHostObject *)self descriptorCache];
      v40 = [NSNumber numberWithUnsignedInteger:v36];
      [v39 removeObjectForKey:v40];

      v41 = [(IOUSBHostObject *)self invalidDescriptorCache];
      [v41 addObject:v38];
    }
    objc_sync_exit(v34);
  }
LABEL_21:

  return v23;
}

- (BOOL)enqueueDeviceRequest:(IOUSBDeviceRequest)request error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  return [(IOUSBHostObject *)self enqueueDeviceRequest:request data:0 completionTimeout:error error:completionHandler completionHandler:5.0];
}

- (BOOL)enqueueDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  return [(IOUSBHostObject *)self enqueueDeviceRequest:request data:data completionTimeout:error error:completionHandler completionHandler:5.0];
}

- (BOOL)enqueueDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  kern_return_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSMutableData *v46;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t reference[2];
  long long v50;
  long long v51;
  long long v52;
  uint64_t input;
  uint64_t bRequest;
  uint64_t wValue;
  uint64_t wIndex;
  unint64_t v57;
  char *__ptr32 *v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x263EF8340];
  unint64_t wLength = request.wLength;
  IOUSBHostInterestHandler v13 = data;
  IOUSBHostCompletionHandler v14 = completionHandler;
  v46 = v13;
  if (v13)
  {
    if ([(NSMutableData *)v13 length] < wLength)
    {
      if (error)
      {
        input = *MEMORY[0x263F08320];
        v15 = [MEMORY[0x263F086E0] mainBundle];
        v16 = [v15 localizedStringForKey:@"Unable to enqueue device request." value:&stru_26DBD82D0 table:0];
        reference[0] = (uint64_t)v16;
        bRequest = *MEMORY[0x263F08338];
        v17 = [MEMORY[0x263F086E0] mainBundle];
        v18 = [v17 localizedStringForKey:@"Data buffer is smaller than request wLength." value:&stru_26DBD82D0 table:0];
        reference[1] = (uint64_t)v18;
        wValue = *MEMORY[0x263F08348];
        v19 = [MEMORY[0x263F086E0] mainBundle];
        IOUSBHostInterestHandler v20 = [v19 localizedStringForKey:@"The wLength field of the request must be less than or equal to the data's length." value:&stru_26DBD82D0 table:0];
        *(void *)&v50 = v20;
        v21 = [NSDictionary dictionaryWithObjects:reference forKeys:&input count:3];

        *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v21];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[IOUSBHostObject enqueueDeviceRequest:data:completionTimeout:error:completionHandler:]();
        }
      }
      int v22 = -536870174;
      if (!error) {
        goto LABEL_20;
      }
      goto LABEL_17;
    }
    uint64_t v23 = [(NSMutableData *)v13 mutableBytes];
  }
  else
  {
    uint64_t v23 = 0;
  }
  input = request.bmRequestType;
  bRequest = request.bRequest;
  wValue = request.wValue;
  wIndex = request.wIndex;
  v24 = &off_2279B3000;
  LODWORD(v24) = vcvtad_u64_f64(completionTimeout * 1000.0);
  v57 = wLength;
  v58 = v24;
  v59 = v23;
  outputCnt = 1;
  output = 0;
  *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v51 = v25;
  v52 = v25;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  v50 = v25;
  reference[1] = (uint64_t)_ioCompletionCallback_1;
  if (v14)
  {
    uint64_t v26 = MEMORY[0x22A681190](v14);
  }
  else
  {
    uint64_t v26 = 0;
  }
  *(void *)&v50 = v26;
  mach_port_t v27 = [(IOUSBHostObject *)self ioConnection];
  mach_port_t MachPort = IONotificationPortGetMachPort([(IOUSBHostObject *)self ioNotificationPortRef]);
  IOUSBHostInterestHandler v29 = IOConnectCallAsyncScalarMethod(v27, 2u, MachPort, reference, 3u, &input, 7u, &output, &outputCnt);
  int v22 = v29;
  if (v29)
  {
    IOUSBHostCompletionHandler v14 = (IOUSBHostCompletionHandler)v50;
    if ((void)v50)
    {
      if (error)
      {
LABEL_17:
        input = *MEMORY[0x263F08320];
        v30 = [MEMORY[0x263F086E0] mainBundle];
        v31 = [v30 localizedStringForKey:@"Unable to enqueue device request." value:&stru_26DBD82D0 table:0];
        reference[0] = (uint64_t)v31;
        bRequest = *MEMORY[0x263F08338];
        v32 = [MEMORY[0x263F086E0] mainBundle];
        v33 = [v32 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
        reference[1] = (uint64_t)v33;
        wValue = *MEMORY[0x263F08348];
        v34 = [MEMORY[0x263F086E0] mainBundle];
        v35 = [v34 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
        *(void *)&v50 = v35;
        v36 = [NSDictionary dictionaryWithObjects:reference forKeys:&input count:3];

        *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v22 userInfo:v36];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[IOUSBHostObject enqueueDeviceRequest:data:completionTimeout:error:completionHandler:]();
        }
      }
LABEL_20:
      v37 = 0;
      goto LABEL_21;
    }
  }
  if (v29)
  {
    IOUSBHostCompletionHandler v14 = 0;
    if (error) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }
  if (*(unsigned __int16 *)&request.bmRequestType != 1792)
  {
    v37 = 1;
    goto LABEL_22;
  }
  v39 = [(IOUSBHostObject *)self descriptorCache];
  objc_sync_enter(v39);
  v40 = [(IOUSBHostObject *)self descriptorCache];
  v41 = HIBYTE(request.wValue) | ((unint64_t)LOBYTE(request.wValue) << 8) | (*(_DWORD *)&request.wIndex << 16);
  v42 = [NSNumber numberWithUnsignedInteger:v41];
  IOUSBHostCompletionHandler v14 = [v40 objectForKey:v42];

  if (v14)
  {
    dispatch_queue_t v43 = [(IOUSBHostObject *)self descriptorCache];
    v44 = [NSNumber numberWithUnsignedInteger:v41];
    [v43 removeObjectForKey:v44];

    v45 = [(IOUSBHostObject *)self invalidDescriptorCache];
    [v45 addObject:v14];
  }
  objc_sync_exit(v39);

  v37 = 1;
LABEL_21:

LABEL_22:
  return v37;
}

- (BOOL)abortDeviceRequestsWithError:(NSError *)error
{
  return [(IOUSBHostObject *)self abortDeviceRequestsWithOption:0 error:error];
}

- (BOOL)abortDeviceRequestsWithOption:(IOUSBHostAbortOption)option error:(NSError *)error
{
  kern_return_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void v15[3];
  void v16[4];

  v16[3] = *MEMORY[0x263EF8340];
  v5 = IOConnectCallScalarMethod([(IOUSBHostObject *)self ioConnection], 3u, &v14, 1u, 0, 0);
  if (v5 && error)
  {
    v15[0] = *MEMORY[0x263F08320];
    v6 = [MEMORY[0x263F086E0] mainBundle];
    unsigned int v7 = [v6 localizedStringForKey:@"Failed to abort device requests." value:&stru_26DBD82D0 table:0];
    v16[0] = v7;
    v15[1] = *MEMORY[0x263F08338];
    BOOL v8 = [MEMORY[0x263F086E0] mainBundle];
    io_service_t v9 = [v8 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v16[1] = v9;
    v15[2] = *MEMORY[0x263F08348];
    uint64_t v10 = [MEMORY[0x263F086E0] mainBundle];
    v11 = [v10 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v16[2] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v5 userInfo:v12];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostObject abortDeviceRequestsWithOption:error:]();
    }
  }
  return v5 == 0;
}

- (const)descriptorWithType:(tIOUSBDescriptorType)type length:(NSUInteger *)length error:(NSError *)error
{
  return [(IOUSBHostObject *)self descriptorWithType:*(void *)&type length:length index:0 languageID:0 requestType:0 requestRecipient:0 error:error];
}

- (const)descriptorWithType:(tIOUSBDescriptorType)type length:(NSUInteger *)length index:(NSUInteger)index languageID:(NSUInteger)languageID error:(NSError *)error
{
  return [(IOUSBHostObject *)self descriptorWithType:*(void *)&type length:length index:index languageID:languageID requestType:0 requestRecipient:0 error:error];
}

- (const)descriptorWithType:(tIOUSBDescriptorType)type length:(NSUInteger *)length index:(NSUInteger)index languageID:(NSUInteger)languageID requestType:(tIOUSBDeviceRequestTypeValue)requestType requestRecipient:(tIOUSBDeviceRequestRecipientValue)requestRecipient error:(NSError *)error
{
  kern_return_t v22;
  kern_return_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint32_t outputCnt;
  size_t v39;
  uint64_t outputStruct;
  uint64_t output;
  uint64_t input[5];
  void v43[3];
  void v44[5];

  v44[3] = *MEMORY[0x263EF8340];
  *length = 0;
  v39 = -3;
  outputStruct = 0;
  IOUSBHostCompletionHandler v14 = [(IOUSBHostObject *)self descriptorCache];
  objc_sync_enter(v14);
  v15 = [(IOUSBHostObject *)self descriptorCache];
  uint64_t v16 = type;
  unint64_t v17 = type | ((unint64_t)index << 8) | (languageID << 16);
  v18 = [NSNumber numberWithUnsignedInteger:v17];
  v19 = [v15 objectForKey:v18];

  objc_sync_exit(v14);
  if (v19)
  {
    id v20 = v19;
    v21 = (const IOUSBDescriptor *)[v20 bytes];
    *length = [v20 length];
  }
  else
  {
    input[0] = v16;
    input[1] = index;
    uint64_t input[2] = languageID;
    input[3] = requestType;
    input[4] = requestRecipient;
    output = 0;
    outputCnt = 1;
    int v22 = IOConnectCallMethod([(IOUSBHostObject *)self ioConnection], 4u, input, 5u, 0, 0, &output, &outputCnt, &outputStruct, &v39);
    uint64_t v23 = v22;
    if (!outputStruct) {
      goto LABEL_11;
    }
    if (v22)
    {
      v21 = 0;
    }
    else
    {
      v24 = [(IOUSBHostObject *)self descriptorCache];
      objc_sync_enter(v24);
      long long v25 = [MEMORY[0x263EFF8F8] dataWithBytes:outputStruct length:v39];
      if (v25)
      {
        uint64_t v26 = [(IOUSBHostObject *)self descriptorCache];
        mach_port_t v27 = [NSNumber numberWithUnsignedInteger:v17];
        [v26 setObject:v25 forKey:v27];

        v21 = (const IOUSBDescriptor *)[v25 bytes];
        *length = (unsigned __int16)output;
      }
      else
      {
        v21 = 0;
      }

      objc_sync_exit(v24);
    }
    MEMORY[0x22A681330](*MEMORY[0x263EF8960]);
    if (!v21)
    {
LABEL_11:
      if (error)
      {
        v43[0] = *MEMORY[0x263F08320];
        v28 = [MEMORY[0x263F086E0] mainBundle];
        IOUSBHostInterestHandler v29 = [v28 localizedStringForKey:@"Failed to get descriptor." value:&stru_26DBD82D0 table:0];
        v44[0] = v29;
        v43[1] = *MEMORY[0x263F08338];
        v30 = [MEMORY[0x263F086E0] mainBundle];
        v31 = [v30 localizedStringForKey:@"Requested descriptor likely does not exist." value:&stru_26DBD82D0 table:0];
        v44[1] = v31;
        v43[2] = *MEMORY[0x263F08348];
        v32 = [MEMORY[0x263F086E0] mainBundle];
        v33 = [v32 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
        v44[2] = v33;
        v34 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3];

        *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v23 userInfo:v34];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[IOUSBHostObject descriptorWithType:length:index:languageID:requestType:requestRecipient:error:]();
        }
      }
      v21 = 0;
    }
  }

  return v21;
}

- (const)capabilityDescriptors
{
  unint64_t v3 = 0;
  result = [(IOUSBHostObject *)self descriptorWithType:15 length:&v3 error:0];
  if (result)
  {
    if (v3 < result->bLength) {
      return 0;
    }
  }
  return result;
}

- (const)configurationDescriptorWithIndex:(NSUInteger)index error:(NSError *)error
{
  v15[3] = *MEMORY[0x263EF8340];
  unint64_t v13 = 0;
  result = [(IOUSBHostObject *)self descriptorWithType:2 length:&v13 index:index languageID:0 error:error];
  if (result && v13 < result->wTotalLength)
  {
    if (error)
    {
      v14[0] = *MEMORY[0x263F08320];
      v6 = [MEMORY[0x263F086E0] mainBundle];
      unsigned int v7 = [v6 localizedStringForKey:@"Unable to get configuration descriptor." value:&stru_26DBD82D0 table:0];
      v15[0] = v7;
      v14[1] = *MEMORY[0x263F08338];
      BOOL v8 = [MEMORY[0x263F086E0] mainBundle];
      io_service_t v9 = [v8 localizedStringForKey:@"The length is less than descriptor's wTotalLength." value:&stru_26DBD82D0 table:0];
      v15[1] = v9;
      v14[2] = *MEMORY[0x263F08348];
      uint64_t v10 = [MEMORY[0x263F086E0] mainBundle];
      v11 = [v10 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v15[2] = v11;
      v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870911 userInfo:v12];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostObject configurationDescriptorWithIndex:error:]();
      }
    }
    return 0;
  }
  return result;
}

- (const)configurationDescriptorWithConfigurationValue:(NSUInteger)configurationValue error:(NSError *)error
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (!configurationValue)
  {
    if (error)
    {
      uint64_t v22 = *MEMORY[0x263F08320];
      uint64_t v16 = [MEMORY[0x263F086E0] mainBundle];
      unint64_t v17 = [v16 localizedStringForKey:@"Failed to get configuration descriptor." value:&stru_26DBD82D0 table:0];
      long long v25 = v17;
      uint64_t v23 = *MEMORY[0x263F08338];
      v18 = [MEMORY[0x263F086E0] mainBundle];
      v19 = [v18 localizedStringForKey:@"ConfigurationValue of 0 is invalid" value:&stru_26DBD82D0 table:0];
      uint64_t v26 = v19;
      uint64_t v24 = *MEMORY[0x263F08348];
      id v20 = [MEMORY[0x263F086E0] mainBundle];
      v21 = [v20 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      mach_port_t v27 = v21;
      v15 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v22 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870911 userInfo:v15];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostObject configurationDescriptorWithConfigurationValue:error:]();
      }
      goto LABEL_13;
    }
    return 0;
  }
  if (!(_BYTE)[(IOUSBHostObject *)self deviceDescriptor][17])
  {
LABEL_7:
    if (error)
    {
      uint64_t v22 = *MEMORY[0x263F08320];
      io_service_t v9 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v10 = [v9 localizedStringForKey:@"Failed to get configuration descriptor." value:&stru_26DBD82D0 table:0];
      long long v25 = v10;
      uint64_t v23 = *MEMORY[0x263F08338];
      v11 = [MEMORY[0x263F086E0] mainBundle];
      v12 = [v11 localizedStringForKey:@"Unable to find configuration descriptor with specified value" value:&stru_26DBD82D0 table:0];
      uint64_t v26 = v12;
      uint64_t v24 = *MEMORY[0x263F08348];
      unint64_t v13 = [MEMORY[0x263F086E0] mainBundle];
      IOUSBHostCompletionHandler v14 = [v13 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      mach_port_t v27 = v14;
      v15 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v22 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870160 userInfo:v15];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostObject configurationDescriptorWithConfigurationValue:error:]();
      }
LABEL_13:

      return 0;
    }
    return 0;
  }
  uint64_t v7 = 0;
  while (1)
  {
    result = [(IOUSBHostObject *)self configurationDescriptorWithIndex:v7 error:error];
    if (result)
    {
      if (result->bConfigurationValue == configurationValue) {
        return result;
      }
    }
    if (++v7 >= (unint64_t)[(IOUSBHostObject *)self deviceDescriptor][17]) {
      goto LABEL_7;
    }
  }
}

- (const)stringWithIndex:(NSUInteger)index error:(NSError *)error
{
  return [(IOUSBHostObject *)self stringWithIndex:index languageID:1033 error:error];
}

- (const)stringWithIndex:(NSUInteger)index languageID:(NSUInteger)languageID error:(NSError *)error
{
  unint64_t v9 = 0;
  v5 = [(IOUSBHostObject *)self descriptorWithType:3 length:&v9 index:index languageID:languageID error:error];
  v6 = 0;
  if (v5 && v9 >= 3)
  {
    unint64_t bLength = v5->bLength;
    if (v9 >= bLength)
    {
      v6 = [NSString stringWithCharacters:&v5[1] length:(bLength - 2) >> 1];
    }
    else
    {
      v6 = 0;
    }
  }
  return (const NSString *)v6;
}

- (uint64_t)frameNumberWithTime:(IOUSBHostTime *)time
{
  kern_return_t v4;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  IOUSBHostTime v8;
  uint64_t v9;

  unint64_t v9 = *MEMORY[0x263EF8340];
  output = 0xAAAAAAAAAAAAAAAALL;
  BOOL v8 = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 2;
  char v4 = IOConnectCallScalarMethod([(IOUSBHostObject *)self ioConnection], 7u, 0, 0, &output, &outputCnt);
  result = 0;
  if (!v4)
  {
    result = output;
    if (time) {
      *time = v8;
    }
  }
  return result;
}

- (NSMutableData)ioDataWithCapacity:(NSUInteger)capacity error:(NSError *)error
{
  kern_return_t v7;
  uint64_t v8;
  kern_return_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  IOBufferMutableData *v17;
  IOBufferMutableData *v19;
  void v20[5];
  uint32_t outputCnt;
  uint64_t v22;
  uint64_t input;
  uint64_t output;
  void v25[3];
  void v26[4];
  uint64_t vars8;

  v26[3] = *MEMORY[0x263EF8340];
  input = capacity;
  output = 0;
  outputCnt = 1;
  uint64_t v7 = IOConnectCallScalarMethod([(IOUSBHostObject *)self ioConnection], 8u, &input, 1u, &output, &outputCnt);
  if (v7)
  {
LABEL_4:
    if (error)
    {
LABEL_5:
      v25[0] = *MEMORY[0x263F08320];
      uint64_t v10 = [MEMORY[0x263F086E0] mainBundle];
      v11 = [v10 localizedStringForKey:@"Unable to allocate IOData Buffer." value:&stru_26DBD82D0 table:0];
      v26[0] = v11;
      v25[1] = *MEMORY[0x263F08338];
      v12 = [MEMORY[0x263F086E0] mainBundle];
      unint64_t v13 = [v12 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v26[1] = v13;
      v25[2] = *MEMORY[0x263F08348];
      IOUSBHostCompletionHandler v14 = [MEMORY[0x263F086E0] mainBundle];
      v15 = [v14 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v26[2] = v15;
      uint64_t v16 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v7 userInfo:v16];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostObject ioDataWithCapacity:error:]();
      }
    }
LABEL_8:
    unint64_t v17 = 0;
    goto LABEL_9;
  }
  v26[0] = 0xAAAAAAAAAAAAAAAALL;
  v25[0] = 0xAAAAAAAAAAAAAAAALL;
  BOOL v8 = [(IOUSBHostObject *)self ioConnection];
  unint64_t v9 = MEMORY[0x22A680DD0](v8, output, *MEMORY[0x263EF8960], v26, v25, 1);
  if (v9)
  {
    uint64_t v7 = v9;
    uint64_t v22 = output;
    IOConnectCallScalarMethod([(IOUSBHostObject *)self ioConnection], 9u, &v22, 1u, 0, 0);
    goto LABEL_4;
  }
  v19 = [IOBufferMutableData alloc];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __44__IOUSBHostObject_ioDataWithCapacity_error___block_invoke;
  v20[3] = &unk_2648224C8;
  v20[4] = self;
  unint64_t v17 = [(IOBufferMutableData *)v19 initWithBytesNoCopy:v26[0] length:capacity bufferID:output deallocator:v20];
  if (!v17)
  {
    uint64_t v7 = 0;
    if (error) {
      goto LABEL_5;
    }
    goto LABEL_8;
  }
LABEL_9:
  return (NSMutableData *)v17;
}

uint64_t __44__IOUSBHostObject_ioDataWithCapacity_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 ioConnection];
  uint64_t v6 = [v4 bufferID];
  uint64_t v7 = *MEMORY[0x263EF8960];
  id v8 = v4;
  MEMORY[0x22A680E00](v5, v6, v7, [v8 bytes]);
  LODWORD(v5) = [v8 bufferID];

  return IOConnectCallScalarMethod(objc_msgSend(*(id *)(a1 + 32), "ioConnection", v5, v11), 9u, &v10, 1u, 0, 0);
}

- (NSUInteger)deviceAddress
{
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t v3 = IOConnectCallScalarMethod([(IOUSBHostObject *)self ioConnection], 5u, 0, 0, &output, &outputCnt);
  if (!v3) {
    return (unsigned __int16)output;
  }
  uint64_t v4 = v3;
  if ([(IOUSBHostObject *)self debugLoggingMask]) {
    NSLog(&cfstr_LineDOfSSconne.isa, 931, "/Library/Caches/com.apple.xbs/Sources/IOUSBHostFamily/IOUSBHostFramework/IOUSBHostObject.m", "-[IOUSBHostObject deviceAddress]", v4);
  }
  return 0;
}

- (io_service_t)ioService
{
  return self->_ioService;
}

- (void)setIoService:(unsigned int)a3
{
  self->_ioService = a3;
}

- (dispatch_queue_t)queue
{
  return (dispatch_queue_t)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
}

- (const)deviceDescriptor
{
  return self->_deviceDescriptor;
}

- (void)setDeviceDescriptor:(const IOUSBDeviceDescriptor *)a3
{
  self->_deviceDescriptor = a3;
}

- (unint64_t)debugLoggingMask
{
  return self->_debugLoggingMask;
}

- (void)setDebugLoggingMask:(unint64_t)a3
{
  self->_debugLoggingMask = a3;
}

- (unsigned)ioConnection
{
  return self->_ioConnection;
}

- (void)setIoConnection:(unsigned int)a3
{
  self->_ioConnection = a3;
}

- (IONotificationPort)ioNotificationPortRef
{
  return self->_ioNotificationPortRef;
}

- (void)setIoNotificationPortRef:(IONotificationPort *)a3
{
  self->_ioNotificationPortRef = a3;
}

- (IOUSBHostInterestNotifier)interestNotifier
{
  return self->_interestNotifier;
}

- (void)setInterestNotifier:(id)a3
{
}

- (id)interestHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setInterestHandler:(id)a3
{
}

- (NSMutableSet)invalidDescriptorCache
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInvalidDescriptorCache:(id)a3
{
}

- (NSMutableDictionary)descriptorCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDescriptorCache:(id)a3
{
}

- (NSArray)supportedStringLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSupportedStringLanguages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedStringLanguages, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
  objc_storeStrong((id *)&self->_invalidDescriptorCache, 0);
  objc_storeStrong(&self->_interestHandler, 0);
  objc_storeStrong((id *)&self->_interestNotifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithIOService:options:queue:error:interestHandler:.cold.1()
{
  [@"Failed to create IOUSBHostObject." cStringUsingEncoding:4];
  [@"Failed [super init]" cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithIOService:options:queue:error:interestHandler:.cold.2()
{
  [@"Failed to create IOUSBHostObject." cStringUsingEncoding:4];
  [@"Unable to allocateNSMutableSet." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithIOService:options:queue:error:interestHandler:.cold.3()
{
  [@"Failed to create IOUSBHostObject." cStringUsingEncoding:4];
  [@"Unable to allocate NSMutableDictionary." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithIOService:options:queue:error:interestHandler:.cold.4()
{
  [@"Failed to create IOUSBHostObject." cStringUsingEncoding:4];
  [@"Unable to allocate dispatch queue." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithIOService:options:queue:error:interestHandler:.cold.5()
{
  [@"Failed to create IOUSBHostObject." cStringUsingEncoding:4];
  [@"Unable to create IONotificationPort port." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithIOService:options:queue:error:interestHandler:.cold.6()
{
  [@"Failed to create IOUSBHostObject." cStringUsingEncoding:4];
  [@"Unable to obtain device descriptor." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithIOService:options:queue:error:interestHandler:.cold.7()
{
  [@"Failed to create IOUSBHostObject." cStringUsingEncoding:4];
  [@"Unable to create IOUSBHostInterestNotifier" cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithIOService:(void *)a1 options:queue:error:interestHandler:.cold.8(void *a1)
{
  [@"Failed to create IOUSBHostObject." cStringUsingEncoding:4];
  [a1 cStringUsingEncoding:4];
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v2, "Error:%s with reason: %s", v3, v4, v5, v6, 2u);
}

- (void)openWithOptions:error:.cold.1()
{
  [@"Unable to open io_service_t object and create user client." cStringUsingEncoding:4];
  [@"Exclusive open of usb object failed." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)openWithOptions:error:.cold.2()
{
  [@"Unable to open io_service_t object and create user client." cStringUsingEncoding:4];
  [@"IOServiceOpen failed." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)sendDeviceRequest:data:bytesTransferred:completionTimeout:error:.cold.1()
{
  [@"Unable to send device request." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)sendDeviceRequest:data:bytesTransferred:completionTimeout:error:.cold.2()
{
  [@"Unable to send device request." cStringUsingEncoding:4];
  [@"Data buffer is smaller than request wLength." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)enqueueDeviceRequest:data:completionTimeout:error:completionHandler:.cold.1()
{
  [@"Unable to enqueue device request." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)enqueueDeviceRequest:data:completionTimeout:error:completionHandler:.cold.2()
{
  [@"Unable to enqueue device request." cStringUsingEncoding:4];
  [@"Data buffer is smaller than request wLength." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)abortDeviceRequestsWithOption:error:.cold.1()
{
  [@"Failed to abort device requests." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)descriptorWithType:length:index:languageID:requestType:requestRecipient:error:.cold.1()
{
  [@"Failed to get descriptor." cStringUsingEncoding:4];
  [@"Requested descriptor likely does not exist." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)configurationDescriptorWithIndex:error:.cold.1()
{
  [@"Unable to get configuration descriptor." cStringUsingEncoding:4];
  [@"The length is less than descriptor's wTotalLength." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)configurationDescriptorWithConfigurationValue:error:.cold.1()
{
  [@"Failed to get configuration descriptor." cStringUsingEncoding:4];
  [@"ConfigurationValue of 0 is invalid" cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)configurationDescriptorWithConfigurationValue:error:.cold.2()
{
  [@"Failed to get configuration descriptor." cStringUsingEncoding:4];
  [@"Unable to find configuration descriptor with specified value" cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)ioDataWithCapacity:error:.cold.1()
{
  [@"Unable to allocate IOData Buffer." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

@end