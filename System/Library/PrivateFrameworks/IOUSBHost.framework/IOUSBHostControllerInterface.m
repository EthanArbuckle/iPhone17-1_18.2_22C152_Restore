@interface IOUSBHostControllerInterface
- (BOOL)commandAsyncCallbackWithResult:(int)a3 error:(id *)a4;
- (BOOL)deliverInterrupts;
- (BOOL)destroyed;
- (BOOL)doorbellAsyncCallbacKWithResult:(int)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)enqueueInterrupt:(const IOUSBHostCIMessage *)interrupt error:(NSError *)error;
- (BOOL)enqueueInterrupt:(const IOUSBHostCIMessage *)interrupt expedite:(BOOL)expedite error:(NSError *)error;
- (BOOL)enqueueInterrupts:(const IOUSBHostCIMessage *)interrupts count:(NSUInteger)count error:(NSError *)error;
- (BOOL)enqueueInterrupts:(const IOUSBHostCIMessage *)interrupts count:(NSUInteger)count expedite:(BOOL)expedite error:(NSError *)error;
- (BOOL)interruptDeliveryPending;
- (IONotificationPort)notificationPortRef;
- (IOUSBHostCIControllerStateMachine)controllerStateMachine;
- (IOUSBHostCIMessage)command;
- (IOUSBHostCIPortStateMachine)getPortStateMachineForCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error;
- (IOUSBHostCIPortStateMachine)getPortStateMachineForPort:(NSUInteger)port error:(NSError *)error;
- (IOUSBHostControllerInterface)initWithCapabilities:(NSData *)capabilities queue:(dispatch_queue_t)queue interruptRateHz:(NSUInteger)interruptRateHz error:(NSError *)error commandHandler:(IOUSBHostControllerInterfaceCommandHandler)commandHandler doorbellHandler:(IOUSBHostControllerInterfaceDoorbellHandler)doorbellHandler interestHandler:(IOServiceInterestCallback)interestHandler;
- (IOUSBHostInterestNotifier)interestNotifier;
- (NSMutableData)doorbells;
- (NSMutableData)interrupts;
- (NSRecursiveLock)interruptLock;
- (NSString)descriptionForMessage:(const IOUSBHostCIMessage *)message;
- (NSUInteger)interruptRateHz;
- (NSUUID)uuid;
- (OS_dispatch_queue)interruptQueue;
- (OS_os_log)log;
- (const)capabilities;
- (const)capabilitiesForPort:(NSUInteger)port;
- (dispatch_queue_t)queue;
- (id)commandHandler;
- (id)doorbellHandler;
- (unint64_t)interruptConsumerIndex;
- (unint64_t)interruptProducerIndex;
- (unint64_t)nextInterruptTime;
- (unsigned)ioConnect;
- (void)dealloc;
- (void)destroy;
- (void)interestHandler;
- (void)setCapabilities:(const IOUSBHostCIMessage *)a3;
- (void)setCommand:(IOUSBHostCIMessage)a3;
- (void)setCommandHandler:(id)a3;
- (void)setControllerStateMachine:(id)a3;
- (void)setDestroyed:(BOOL)a3;
- (void)setDoorbellHandler:(id)a3;
- (void)setDoorbells:(id)a3;
- (void)setInterestHandler:(void *)a3;
- (void)setInterestNotifier:(id)a3;
- (void)setInterruptConsumerIndex:(unint64_t)a3;
- (void)setInterruptDeliveryPending:(BOOL)a3;
- (void)setInterruptLock:(id)a3;
- (void)setInterruptProducerIndex:(unint64_t)a3;
- (void)setInterruptQueue:(id)a3;
- (void)setInterruptRateHz:(NSUInteger)interruptRateHz;
- (void)setInterrupts:(id)a3;
- (void)setIoConnect:(unsigned int)a3;
- (void)setLog:(id)a3;
- (void)setNextInterruptTime:(unint64_t)a3;
- (void)setNotificationPortRef:(IONotificationPort *)a3;
- (void)setQueue:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation IOUSBHostControllerInterface

- (IOUSBHostControllerInterface)initWithCapabilities:(NSData *)capabilities queue:(dispatch_queue_t)queue interruptRateHz:(NSUInteger)interruptRateHz error:(NSError *)error commandHandler:(IOUSBHostControllerInterfaceCommandHandler)commandHandler doorbellHandler:(IOUSBHostControllerInterfaceDoorbellHandler)doorbellHandler interestHandler:(IOServiceInterestCallback)interestHandler
{
  uint64_t v161 = *MEMORY[0x263EF8340];
  v15 = capabilities;
  v16 = queue;
  IOUSBHostControllerInterfaceCommandHandler v17 = commandHandler;
  IOUSBHostControllerInterfaceDoorbellHandler v18 = doorbellHandler;
  v153.receiver = self;
  v153.super_class = (Class)IOUSBHostControllerInterface;
  v19 = [(IOUSBHostControllerInterface *)&v153 init];
  v152 = v18;
  if (!v19)
  {
    if (error)
    {
      v149 = v15;
      IOUSBHostControllerInterfaceCommandHandler v151 = v17;
      v25 = v16;
      uint64_t v156 = *MEMORY[0x263F08320];
      v33 = [MEMORY[0x263F086E0] mainBundle];
      v34 = [v33 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_26DBD82D0 table:0];
      *(void *)&long long connect = v34;
      uint64_t v157 = *MEMORY[0x263F08338];
      v35 = [MEMORY[0x263F086E0] mainBundle];
      v36 = [v35 localizedStringForKey:@"Unable to allocate memory." value:&stru_26DBD82D0 table:0];
      *((void *)&connect + 1) = v36;
      uint64_t v158 = *MEMORY[0x263F08348];
      v37 = [MEMORY[0x263F086E0] mainBundle];
      v38 = [v37 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v160 = v38;
      v32 = [NSDictionary dictionaryWithObjects:&connect forKeys:&v156 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v32];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:]();
      }
      goto LABEL_13;
    }
LABEL_15:
    [(IOUSBHostControllerInterface *)v19 destroy];
    v39 = 0;
    goto LABEL_16;
  }
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  id v21 = objc_claimAutoreleasedReturnValue();
  os_log_t v22 = os_log_create("com.apple.iokit.usb.framework.IOUSBHost", (const char *)[v21 cStringUsingEncoding:4]);
  [(IOUSBHostControllerInterface *)v19 setLog:v22];

  [(IOUSBHostControllerInterface *)v19 setInterruptRateHz:interruptRateHz];
  [(IOUSBHostControllerInterface *)v19 setCommandHandler:v17];
  [(IOUSBHostControllerInterface *)v19 setDoorbellHandler:v18];
  [(IOUSBHostControllerInterface *)v19 setInterestHandler:interestHandler];
  if ([(NSData *)v15 length] >= 0x10 && ([(NSData *)v15 length] & 0xF) == 0)
  {
    uint64_t v23 = [MEMORY[0x263EFF8F8] dataWithData:v15];
    capabilitiesData = v19->_capabilitiesData;
    v19->_capabilitiesData = (NSData *)v23;

    [(IOUSBHostControllerInterface *)v19 setCapabilities:[(NSData *)v19->_capabilitiesData bytes]];
  }
  if (![(IOUSBHostControllerInterface *)v19 capabilities]
    || (*(unsigned char *)[(IOUSBHostControllerInterface *)v19 capabilities] & 0x3F) != 0)
  {
    if (error)
    {
      v149 = v15;
      IOUSBHostControllerInterfaceCommandHandler v151 = v17;
      v25 = v16;
      uint64_t v156 = *MEMORY[0x263F08320];
      v26 = [MEMORY[0x263F086E0] mainBundle];
      v27 = [v26 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_26DBD82D0 table:0];
      *(void *)&long long connect = v27;
      uint64_t v157 = *MEMORY[0x263F08338];
      v28 = [MEMORY[0x263F086E0] mainBundle];
      v29 = [v28 localizedStringForKey:@"Capabilities are not valid." value:&stru_26DBD82D0 table:0];
      *((void *)&connect + 1) = v29;
      uint64_t v158 = *MEMORY[0x263F08348];
      v30 = [MEMORY[0x263F086E0] mainBundle];
      v31 = [v30 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v160 = v31;
      v32 = [NSDictionary dictionaryWithObjects:&connect forKeys:&v156 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v32];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:]();
      }
LABEL_13:

      v16 = v25;
      v15 = v149;
LABEL_14:
      IOUSBHostControllerInterfaceCommandHandler v17 = v151;
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  v41 = [[IOUSBHostCIControllerStateMachine alloc] initWithInterface:v19 error:error];
  [(IOUSBHostControllerInterface *)v19 setControllerStateMachine:v41];

  v42 = [(IOUSBHostControllerInterface *)v19 controllerStateMachine];

  if (!v42) {
    goto LABEL_15;
  }
  v150 = v16;
  IOUSBHostControllerInterfaceCommandHandler v151 = v17;
  v43 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:0x10000];
  [(IOUSBHostControllerInterface *)v19 setInterrupts:v43];

  v44 = NSString;
  v45 = (objc_class *)objc_opt_class();
  v46 = NSStringFromClass(v45);
  id v47 = [v44 stringWithFormat:@"%@.%@", @"com.apple.iokit.usb.framework.IOUSBHost", v46];
  dispatch_queue_t v48 = dispatch_queue_create((const char *)[v47 UTF8String], 0);
  [(IOUSBHostControllerInterface *)v19 setInterruptQueue:v48];

  id v49 = objc_alloc_init(MEMORY[0x263F08AE0]);
  [(IOUSBHostControllerInterface *)v19 setInterruptLock:v49];

  v50 = [(IOUSBHostControllerInterface *)v19 interrupts];

  if (!v50)
  {
    if (error)
    {
      uint64_t v156 = *MEMORY[0x263F08320];
      v56 = [MEMORY[0x263F086E0] mainBundle];
      v57 = [v56 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_26DBD82D0 table:0];
      *(void *)&long long connect = v57;
      uint64_t v157 = *MEMORY[0x263F08338];
      v58 = [MEMORY[0x263F086E0] mainBundle];
      v59 = [v58 localizedStringForKey:@"Failed to allocate interruptData." value:&stru_26DBD82D0 table:0];
      *((void *)&connect + 1) = v59;
      uint64_t v158 = *MEMORY[0x263F08348];
      v60 = [MEMORY[0x263F086E0] mainBundle];
      v61 = [v60 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v160 = v61;
      v62 = [NSDictionary dictionaryWithObjects:&connect forKeys:&v156 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v62];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:]();
      }
      goto LABEL_56;
    }
LABEL_57:
    v16 = v150;
    goto LABEL_14;
  }
  v51 = [(IOUSBHostControllerInterface *)v19 interruptQueue];

  if (!v51)
  {
    v16 = v150;
    IOUSBHostControllerInterfaceCommandHandler v17 = v151;
    if (!error) {
      goto LABEL_15;
    }
    uint64_t v156 = *MEMORY[0x263F08320];
    v63 = [MEMORY[0x263F086E0] mainBundle];
    v64 = [v63 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_26DBD82D0 table:0];
    *(void *)&long long connect = v64;
    uint64_t v157 = *MEMORY[0x263F08338];
    v65 = [MEMORY[0x263F086E0] mainBundle];
    v66 = [v65 localizedStringForKey:@"Failed to allocate interruptQueue." value:&stru_26DBD82D0 table:0];
    *((void *)&connect + 1) = v66;
    uint64_t v158 = *MEMORY[0x263F08348];
    v67 = [MEMORY[0x263F086E0] mainBundle];
    v68 = [v67 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v160 = v68;
    v62 = [NSDictionary dictionaryWithObjects:&connect forKeys:&v156 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v62];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.4();
    }
    goto LABEL_56;
  }
  v52 = [(IOUSBHostControllerInterface *)v19 interruptLock];

  v16 = v150;
  IOUSBHostControllerInterfaceCommandHandler v17 = v151;
  if (!v52)
  {
    if (!error) {
      goto LABEL_15;
    }
    uint64_t v156 = *MEMORY[0x263F08320];
    v69 = [MEMORY[0x263F086E0] mainBundle];
    v70 = [v69 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_26DBD82D0 table:0];
    *(void *)&long long connect = v70;
    uint64_t v157 = *MEMORY[0x263F08338];
    v71 = [MEMORY[0x263F086E0] mainBundle];
    v72 = [v71 localizedStringForKey:@"Failed to allocate interruptLock." value:&stru_26DBD82D0 table:0];
    *((void *)&connect + 1) = v72;
    uint64_t v158 = *MEMORY[0x263F08348];
    v73 = [MEMORY[0x263F086E0] mainBundle];
    v74 = [v73 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v160 = v74;
    v62 = [NSDictionary dictionaryWithObjects:&connect forKeys:&v156 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v62];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.5();
    }
    goto LABEL_56;
  }
  v53 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:4096];
  [(IOUSBHostControllerInterface *)v19 setDoorbells:v53];

  v54 = [(IOUSBHostControllerInterface *)v19 doorbells];

  if (!v54)
  {
    if (error)
    {
      uint64_t v156 = *MEMORY[0x263F08320];
      v147 = [MEMORY[0x263F086E0] mainBundle];
      v75 = [v147 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_26DBD82D0 table:0];
      *(void *)&long long connect = v75;
      uint64_t v157 = *MEMORY[0x263F08338];
      v76 = [MEMORY[0x263F086E0] mainBundle];
      v77 = [v76 localizedStringForKey:@"Unable to allocate memory for doorbells." value:&stru_26DBD82D0 table:0];
      *((void *)&connect + 1) = v77;
      uint64_t v158 = *MEMORY[0x263F08348];
      v78 = [MEMORY[0x263F086E0] mainBundle];
      v79 = [v78 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v160 = v79;
      v80 = [NSDictionary dictionaryWithObjects:&connect forKeys:&v156 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v80];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:]2();
      }

      v16 = v150;
      IOUSBHostControllerInterfaceCommandHandler v17 = v151;
    }
    v81 = [(IOUSBHostControllerInterface *)v19 doorbells];
    [v81 setLength:4096];

    goto LABEL_15;
  }
  v55 = [(IOUSBHostControllerInterface *)v19 doorbells];
  [v55 setLength:4096];

  CFDictionaryRef v82 = IOServiceMatching("AppleUSBUserHCIResources");
  if (v82)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v82);
    if (MatchingService)
    {
      io_object_t v84 = MatchingService;
      LODWORD(connect) = 0;
      IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, (io_connect_t *)&connect);
      [(IOUSBHostControllerInterface *)v19 setIoConnect:connect];
      IOObjectRelease(v84);
    }
  }
  if (![(IOUSBHostControllerInterface *)v19 ioConnect])
  {
    if (!error) {
      goto LABEL_15;
    }
    uint64_t v156 = *MEMORY[0x263F08320];
    v95 = [MEMORY[0x263F086E0] mainBundle];
    v96 = [v95 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_26DBD82D0 table:0];
    *(void *)&long long connect = v96;
    uint64_t v157 = *MEMORY[0x263F08338];
    v97 = [MEMORY[0x263F086E0] mainBundle];
    v98 = [v97 localizedStringForKey:@"Unable to connect to the kernel." value:&stru_26DBD82D0 table:0];
    *((void *)&connect + 1) = v98;
    uint64_t v158 = *MEMORY[0x263F08348];
    v99 = [MEMORY[0x263F086E0] mainBundle];
    v100 = [v99 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v160 = v100;
    v62 = [NSDictionary dictionaryWithObjects:&connect forKeys:&v156 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870195 userInfo:v62];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.6();
    }
    goto LABEL_56;
  }
  id v85 = objc_alloc_init(MEMORY[0x263F08C38]);
  [(IOUSBHostControllerInterface *)v19 setUuid:v85];

  v86 = [(IOUSBHostControllerInterface *)v19 uuid];

  if (!v86)
  {
    if (!error) {
      goto LABEL_15;
    }
    uint64_t v156 = *MEMORY[0x263F08320];
    v101 = [MEMORY[0x263F086E0] mainBundle];
    v102 = [v101 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_26DBD82D0 table:0];
    *(void *)&long long connect = v102;
    uint64_t v157 = *MEMORY[0x263F08338];
    v103 = [MEMORY[0x263F086E0] mainBundle];
    v104 = [v103 localizedStringForKey:@"Failed to create UUID." value:&stru_26DBD82D0 table:0];
    *((void *)&connect + 1) = v104;
    uint64_t v158 = *MEMORY[0x263F08348];
    v105 = [MEMORY[0x263F086E0] mainBundle];
    v106 = [v105 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v160 = v106;
    v62 = [NSDictionary dictionaryWithObjects:&connect forKeys:&v156 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v62];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.7();
    }
    goto LABEL_56;
  }
  v87 = [(IOUSBHostControllerInterface *)v19 uuid];
  v88 = [v87 UUIDString];

  LODWORD(v87) = IOConnectSetCFProperty([(IOUSBHostControllerInterface *)v19 ioConnect], @"IOUSBHostControllerInterfaceUUID", v88);
  CFRelease(v88);
  if (v87)
  {
    if (!error) {
      goto LABEL_14;
    }
    uint64_t v156 = *MEMORY[0x263F08320];
    v89 = [MEMORY[0x263F086E0] mainBundle];
    v90 = [v89 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_26DBD82D0 table:0];
    *(void *)&long long connect = v90;
    uint64_t v157 = *MEMORY[0x263F08338];
    v91 = [MEMORY[0x263F086E0] mainBundle];
    v92 = [v91 localizedStringForKey:@"Unable to set UUID property." value:&stru_26DBD82D0 table:0];
    *((void *)&connect + 1) = v92;
    uint64_t v158 = *MEMORY[0x263F08348];
    v93 = [MEMORY[0x263F086E0] mainBundle];
    v94 = [v93 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v160 = v94;
    v62 = [NSDictionary dictionaryWithObjects:&connect forKeys:&v156 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v62];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:]1();
    }
    goto LABEL_56;
  }
  mach_port_t v107 = [(IOUSBHostControllerInterface *)v19 ioConnect];
  v108 = v15;
  if (IOConnectCallStructMethod(v107, 2u, [(NSData *)v108 bytes], [(NSData *)v108 length], 0, 0))
  {
    if (error)
    {
      uint64_t v156 = *MEMORY[0x263F08320];
      v109 = [MEMORY[0x263F086E0] mainBundle];
      v110 = [v109 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_26DBD82D0 table:0];
      *(void *)&long long connect = v110;
      uint64_t v157 = *MEMORY[0x263F08338];
      v111 = [MEMORY[0x263F086E0] mainBundle];
      v112 = [v111 localizedStringForKey:@"Capabilities structure was rejected." value:&stru_26DBD82D0 table:0];
      *((void *)&connect + 1) = v112;
      uint64_t v158 = *MEMORY[0x263F08348];
      v113 = [MEMORY[0x263F086E0] mainBundle];
      v114 = [v113 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v160 = v114;
      v62 = [NSDictionary dictionaryWithObjects:&connect forKeys:&v156 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v62];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:]0();
      }
LABEL_56:

      goto LABEL_57;
    }
    goto LABEL_57;
  }
  CFMutableDictionaryRef v115 = IOServiceMatching("IOUserClient");
  v154 = @"IOUSBHostControllerInterfaceUUID";
  v116 = [(IOUSBHostControllerInterface *)v19 uuid];
  v117 = [v116 UUIDString];
  v155 = v117;
  v118 = [NSDictionary dictionaryWithObjects:&v155 forKeys:&v154 count:1];
  [(__CFDictionary *)v115 setObject:v118 forKeyedSubscript:@"IOPropertyMatch"];

  v119 = [[IOUSBHostInterestNotifier alloc] initWithOwner:v19 matchingDictionary:v115 callback:_internalInterestCallback];
  [(IOUSBHostControllerInterface *)v19 setInterestNotifier:v119];

  v120 = [(IOUSBHostControllerInterface *)v19 interestNotifier];

  if (!v120)
  {
    IOUSBHostControllerInterfaceCommandHandler v17 = v151;
    if (error)
    {
      uint64_t v156 = *MEMORY[0x263F08320];
      v148 = [MEMORY[0x263F086E0] mainBundle];
      v121 = [v148 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_26DBD82D0 table:0];
      *(void *)&long long connect = v121;
      uint64_t v157 = *MEMORY[0x263F08338];
      v122 = [MEMORY[0x263F086E0] mainBundle];
      v123 = [v122 localizedStringForKey:@"Unable to create interest notifier." value:&stru_26DBD82D0 table:0];
      *((void *)&connect + 1) = v123;
      uint64_t v158 = *MEMORY[0x263F08348];
      v124 = [MEMORY[0x263F086E0] mainBundle];
      v125 = [v124 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v160 = v125;
      v126 = [NSDictionary dictionaryWithObjects:&connect forKeys:&v156 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870212 userInfo:v126];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.8();
      }

      IOUSBHostControllerInterfaceCommandHandler v17 = v151;
    }

    v16 = v150;
    goto LABEL_15;
  }

  v16 = v150;
  IOUSBHostControllerInterfaceCommandHandler v17 = v151;
  if (v150)
  {
    [(IOUSBHostControllerInterface *)v19 setQueue:v150];
  }
  else
  {
    v127 = NSString;
    v128 = (objc_class *)objc_opt_class();
    v129 = NSStringFromClass(v128);
    id v130 = [v127 stringWithFormat:@"%@.%@", @"com.apple.iokit.usb.framework.IOUSBHost", v129];
    dispatch_queue_t v131 = dispatch_queue_create((const char *)[v130 UTF8String], 0);
    [(IOUSBHostControllerInterface *)v19 setQueue:v131];

    v16 = 0;
    IOUSBHostControllerInterfaceCommandHandler v17 = v151;
  }
  v132 = [(IOUSBHostControllerInterface *)v19 queue];

  if (v132)
  {
    [(IOUSBHostControllerInterface *)v19 setNotificationPortRef:IONotificationPortCreate(*MEMORY[0x263F0EC88])];
    if ([(IOUSBHostControllerInterface *)v19 notificationPortRef])
    {
      v133 = [(IOUSBHostControllerInterface *)v19 notificationPortRef];
      v134 = [(IOUSBHostControllerInterface *)v19 queue];
      IONotificationPortSetDispatchQueue(v133, v134);

      IOUSBHostControllerInterfaceCommandHandler v17 = v151;
    }
  }
  uint64_t v135 = [(IOUSBHostControllerInterface *)v19 queue];
  if (!v135
    || (v136 = (void *)v135,
        uint64_t v137 = [(IOUSBHostControllerInterface *)v19 notificationPortRef],
        v136,
        !v137))
  {
    if (!error) {
      goto LABEL_15;
    }
    uint64_t v156 = *MEMORY[0x263F08320];
    v141 = [MEMORY[0x263F086E0] mainBundle];
    v142 = [v141 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_26DBD82D0 table:0];
    *(void *)&long long connect = v142;
    uint64_t v157 = *MEMORY[0x263F08338];
    v143 = [MEMORY[0x263F086E0] mainBundle];
    v144 = [v143 localizedStringForKey:@"Unable to create notification port." value:&stru_26DBD82D0 table:0];
    *((void *)&connect + 1) = v144;
    uint64_t v158 = *MEMORY[0x263F08348];
    v145 = [MEMORY[0x263F086E0] mainBundle];
    v146 = [v145 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v160 = v146;
    v62 = [NSDictionary dictionaryWithObjects:&connect forKeys:&v156 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v62];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.9();
    }
    goto LABEL_56;
  }
  if (![(IOUSBHostControllerInterface *)v19 commandAsyncCallbackWithResult:3758096385 error:error]|| ![(IOUSBHostControllerInterface *)v19 doorbellAsyncCallbacKWithResult:3758096385 length:0 error:error])
  {
    goto LABEL_15;
  }
  v138 = [(IOUSBHostControllerInterface *)v19 log];
  if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
  {
    v139 = [(IOUSBHostControllerInterface *)v19 uuid];
    v140 = [v139 UUIDString];
    LODWORD(connect) = 138412290;
    *(void *)((char *)&connect + 4) = v140;
    _os_log_impl(&dword_227999000, v138, OS_LOG_TYPE_INFO, "created IOUSBHostControllerInterface with UUID %@", (uint8_t *)&connect, 0xCu);
  }
  v39 = v19;
  IOUSBHostControllerInterfaceCommandHandler v17 = v151;
LABEL_16:

  return v39;
}

- (void)dealloc
{
  [(IOUSBHostControllerInterface *)self destroy];
  v3.receiver = self;
  v3.super_class = (Class)IOUSBHostControllerInterface;
  [(IOUSBHostControllerInterface *)&v3 dealloc];
}

- (void)destroy
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (![(IOUSBHostControllerInterface *)self destroyed])
  {
    objc_super v3 = [(IOUSBHostControllerInterface *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(IOUSBHostControllerInterface *)self uuid];
      v5 = [v4 UUIDString];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_227999000, v3, OS_LOG_TYPE_INFO, "destroying IOUSBHostControllerInterface with UUID %@", (uint8_t *)&buf, 0xCu);
    }
    [(IOUSBHostControllerInterface *)self setDestroyed:1];
    v6 = [(IOUSBHostControllerInterface *)self interestNotifier];
    BOOL v7 = v6 == 0;

    if (!v7)
    {
      v8 = [(IOUSBHostControllerInterface *)self interestNotifier];
      [v8 destroy];

      [(IOUSBHostControllerInterface *)self setInterestNotifier:0];
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    v25 = (IOUSBHostControllerInterface *)0xAAAAAAAAAAAAAAAALL;
    v9 = self;
    v25 = v9;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__IOUSBHostControllerInterface_destroy__block_invoke;
    block[3] = &unk_264822400;
    block[4] = &buf;
    v10 = (void (**)(void))dispatch_block_create((dispatch_block_flags_t)0, block);
    v11 = [(IOUSBHostControllerInterface *)v9 interruptQueue];
    BOOL v12 = v11 == 0;

    if (v12)
    {
      v15 = [(IOUSBHostControllerInterface *)v9 queue];
      BOOL v16 = v15 == 0;

      if (v16)
      {
        v10[2](v10);
        goto LABEL_11;
      }
      v14 = [*(id *)(*((void *)&buf + 1) + 40) queue];
      dispatch_async(v14, v10);
    }
    else
    {
      v13 = [*(id *)(*((void *)&buf + 1) + 40) interruptQueue];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __39__IOUSBHostControllerInterface_destroy__block_invoke_62;
      v17[3] = &unk_264822428;
      p_long long buf = &buf;
      IOUSBHostControllerInterfaceDoorbellHandler v18 = v10;
      dispatch_async(v13, v17);

      v14 = v18;
    }

LABEL_11:
    _Block_object_dispose(&buf, 8);
  }
}

void __39__IOUSBHostControllerInterface_destroy__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setControllerStateMachine:0];
  for (uint64_t i = 16; i != 144; i += 8)
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v4 = *(void **)(v3 + i);
    *(void *)(v3 + i) = 0;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) notificationPortRef])
  {
    IONotificationPortDestroy((IONotificationPortRef)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) notificationPortRef]);
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setNotificationPortRef:0];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) ioConnect])
  {
    IOServiceClose([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) ioConnect]);
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setIoConnect:0];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setInterruptQueue:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setQueue:0];
  v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) uuid];
    BOOL v7 = [v6 UUIDString];
    int v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_227999000, v5, OS_LOG_TYPE_INFO, "destroyed IOUSBHostControllerInterface with UUID %@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

void __39__IOUSBHostControllerInterface_destroy__block_invoke_62(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) queue];

  if (v2)
  {
    v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) queue];
    dispatch_async(v4, *(dispatch_block_t *)(a1 + 32));
  }
  else
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

- (BOOL)enqueueInterrupt:(const IOUSBHostCIMessage *)interrupt error:(NSError *)error
{
  return [(IOUSBHostControllerInterface *)self enqueueInterrupts:interrupt count:1 expedite:0 error:error];
}

- (BOOL)enqueueInterrupt:(const IOUSBHostCIMessage *)interrupt expedite:(BOOL)expedite error:(NSError *)error
{
  return [(IOUSBHostControllerInterface *)self enqueueInterrupts:interrupt count:1 expedite:expedite error:error];
}

- (BOOL)enqueueInterrupts:(const IOUSBHostCIMessage *)interrupts count:(NSUInteger)count error:(NSError *)error
{
  return [(IOUSBHostControllerInterface *)self enqueueInterrupts:interrupts count:count expedite:0 error:error];
}

- (BOOL)enqueueInterrupts:(const IOUSBHostCIMessage *)interrupts count:(NSUInteger)count expedite:(BOOL)expedite error:(NSError *)error
{
  BOOL v7 = expedite;
  uint64_t v62 = *MEMORY[0x263EF8340];
  if ([(IOUSBHostControllerInterface *)self interruptRateHz]) {
    int v10 = v7;
  }
  else {
    int v10 = 1;
  }
  v11 = [(IOUSBHostControllerInterface *)self interruptLock];
  [v11 lock];

  unint64_t v12 = [(IOUSBHostControllerInterface *)self interruptConsumerIndex];
  unint64_t v13 = [(IOUSBHostControllerInterface *)self interruptProducerIndex];
  if (v12 <= [(IOUSBHostControllerInterface *)self interruptProducerIndex]) {
    uint64_t v14 = v12 - v13 + 4096;
  }
  else {
    uint64_t v14 = v12 - [(IOUSBHostControllerInterface *)self interruptProducerIndex];
  }
  BOOL v15 = v14 != 0;
  NSUInteger v16 = v14 - 1;
  if (v15) {
    NSUInteger v17 = v16;
  }
  else {
    NSUInteger v17 = 0;
  }
  if (v17 < count)
  {
    if (error)
    {
      NSUInteger v53 = v17;
      v59[0] = *MEMORY[0x263F08320];
      v38 = [MEMORY[0x263F086E0] mainBundle];
      v39 = [v38 localizedStringForKey:@"Failed to send interrupts." value:&stru_26DBD82D0 table:0];
      *(void *)&long long buf = v39;
      v59[1] = *MEMORY[0x263F08338];
      v40 = [MEMORY[0x263F086E0] mainBundle];
      v41 = [v40 localizedStringForKey:@"Not enough space for interrupts." value:&stru_26DBD82D0 table:0];
      *((void *)&buf + 1) = v41;
      v59[2] = *MEMORY[0x263F08348];
      v42 = [MEMORY[0x263F086E0] mainBundle];
      v43 = [v42 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v61 = v43;
      v44 = [NSDictionary dictionaryWithObjects:&buf forKeys:v59 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870181 userInfo:v44];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostControllerInterface enqueueInterrupts:count:expedite:error:]();
      }

      NSUInteger v17 = v53;
    }
  }
  else
  {
    int v52 = v10;
    if (count)
    {
      NSUInteger v18 = 0;
      NSUInteger v54 = count;
      do
      {
        unint64_t v19 = [(IOUSBHostControllerInterface *)self interruptProducerIndex];
        unint64_t v56 = v19;
        if (v19 + count - v18 <= 0x1000) {
          unint64_t v20 = count - v18;
        }
        else {
          unint64_t v20 = 4096 - v19;
        }
        id v21 = &interrupts[v18];
        uint64_t v22 = [(IOUSBHostControllerInterface *)self log];
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);

        if (v23 && v20)
        {
          uint64_t v24 = 0;
          unsigned int v25 = 1;
          do
          {
            uint64_t v26 = &v21[v24];
            int v27 = v26->control & 0x3F;
            if ((v27 - 16) >= 0x28 && v27 != 61 || (v26->control & 0xF00) == 256) {
              os_log_type_t v30 = OS_LOG_TYPE_DEBUG;
            }
            else {
              os_log_type_t v30 = OS_LOG_TYPE_ERROR;
            }
            v31 = [(IOUSBHostControllerInterface *)self log];
            if (os_log_type_enabled(v31, v30))
            {
              id v32 = [(IOUSBHostControllerInterface *)self descriptionForMessage:v26];
              uint64_t v33 = [v32 cStringUsingEncoding:4];
              LODWORD(buf) = 136315138;
              *(void *)((char *)&buf + 4) = v33;
              _os_log_impl(&dword_227999000, v31, v30, "interrupt %s", (uint8_t *)&buf, 0xCu);
            }
            uint64_t v24 = v25;
          }
          while (v20 > v25++);
        }
        v35 = [(IOUSBHostControllerInterface *)self interrupts];
        objc_msgSend(v35, "replaceBytesInRange:withBytes:", 16 * v56, 16 * v20, v21);

        [(IOUSBHostControllerInterface *)self setInterruptProducerIndex:((_WORD)v20 + (_WORD)v56) & 0xFFF];
        v18 += v20;
        count = v54;
      }
      while (v18 < v54);
    }
    BOOL v36 = [(IOUSBHostControllerInterface *)self interruptDeliveryPending];
    BOOL v37 = v36;
    if (v52)
    {
      [(IOUSBHostControllerInterface *)self deliverInterrupts];
      [(IOUSBHostControllerInterface *)self setInterruptDeliveryPending:v37];
    }
    else if (!v36)
    {
      dispatch_time_t v45 = dispatch_time(0, 1000000);
      unint64_t v46 = [(IOUSBHostControllerInterface *)self nextInterruptTime];
      [(IOUSBHostControllerInterface *)self setInterruptDeliveryPending:1];
      if (v45 >= v46)
      {
        id v49 = [(IOUSBHostControllerInterface *)self interruptQueue];
        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __71__IOUSBHostControllerInterface_enqueueInterrupts_count_expedite_error___block_invoke;
        v58[3] = &unk_264822450;
        v58[4] = self;
        dispatch_async(v49, v58);
      }
      else
      {
        dispatch_time_t v47 = [(IOUSBHostControllerInterface *)self nextInterruptTime];
        dispatch_queue_t v48 = [(IOUSBHostControllerInterface *)self interruptQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __71__IOUSBHostControllerInterface_enqueueInterrupts_count_expedite_error___block_invoke_2;
        block[3] = &unk_264822450;
        block[4] = self;
        dispatch_after(v47, v48, block);
      }
    }
  }
  v50 = [(IOUSBHostControllerInterface *)self interruptLock];
  [v50 unlock];

  return v17 >= count;
}

uint64_t __71__IOUSBHostControllerInterface_enqueueInterrupts_count_expedite_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deliverInterrupts];
}

uint64_t __71__IOUSBHostControllerInterface_enqueueInterrupts_count_expedite_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) deliverInterrupts];
}

- (BOOL)deliverInterrupts
{
  if ([(IOUSBHostControllerInterface *)self destroyed]) {
    return 1;
  }
  v4 = [(IOUSBHostControllerInterface *)self interruptLock];
  [v4 lock];

  if ([(IOUSBHostControllerInterface *)self interruptRateHz]) {
    [(IOUSBHostControllerInterface *)self setNextInterruptTime:dispatch_time(0, 0x3B9ACA00 / [(IOUSBHostControllerInterface *)self interruptRateHz])];
  }
  [(IOUSBHostControllerInterface *)self setInterruptDeliveryPending:0];
  unint64_t v5 = [(IOUSBHostControllerInterface *)self interruptProducerIndex];
  if (v5 == [(IOUSBHostControllerInterface *)self interruptConsumerIndex])
  {
LABEL_11:
    BOOL v3 = 1;
  }
  else
  {
    while (1)
    {
      unint64_t v6 = [(IOUSBHostControllerInterface *)self interruptConsumerIndex];
      unint64_t v7 = v5 >= v6 ? v5 : 4096;
      id v8 = [(IOUSBHostControllerInterface *)self interrupts];
      uint64_t v9 = [v8 mutableBytes];

      if (IOConnectCallStructMethod([(IOUSBHostControllerInterface *)self ioConnect], 2u, (const void *)(v9 + 16 * v6), 16 * (v7 - v6), 0, 0))
      {
        break;
      }
      [(IOUSBHostControllerInterface *)self setInterruptConsumerIndex:v7 & 0xFFF];
      if (v5 == [(IOUSBHostControllerInterface *)self interruptConsumerIndex]) {
        goto LABEL_11;
      }
    }
    NSLog(&cfstr_FailedToSendIn_0.isa);
    BOOL v3 = 0;
  }
  int v10 = [(IOUSBHostControllerInterface *)self interruptLock];
  [v10 unlock];

  return v3;
}

- (void)setInterruptRateHz:(NSUInteger)interruptRateHz
{
  self->_interruptRateHz = interruptRateHz;
  v4 = [(IOUSBHostControllerInterface *)self interruptQueue];

  if (v4)
  {
    unint64_t v5 = [(IOUSBHostControllerInterface *)self interruptQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__IOUSBHostControllerInterface_setInterruptRateHz___block_invoke;
    block[3] = &unk_264822450;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

uint64_t __51__IOUSBHostControllerInterface_setInterruptRateHz___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deliverInterrupts];
}

- (BOOL)commandAsyncCallbackWithResult:(int)a3 error:(id *)a4
{
  kern_return_t v17;
  kern_return_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint32_t outputCnt;
  uint64_t input;
  uint64_t reference[2];
  IOUSBHostControllerInterface *v30;
  unint64_t v31;
  long long v32;
  long long v33;
  void v34[3];
  void v35[5];

  v35[3] = *MEMORY[0x263EF8340];
  if ([(IOUSBHostControllerInterface *)self destroyed]) {
    return 1;
  }
  if (!a3 && ([(IOUSBHostControllerInterface *)self command] & 0x8000) != 0)
  {
    id v8 = [(IOUSBHostControllerInterface *)self log];
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      int v10 = [(IOUSBHostControllerInterface *)self log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[IOUSBHostControllerInterface commandAsyncCallbackWithResult:error:]((char *)self, v10);
      }
    }
    commandHandler = (void (**)(id, IOUSBHostControllerInterface *, uint64_t, void))self->_commandHandler;
    uint64_t v12 = [(IOUSBHostControllerInterface *)self command];
    commandHandler[2](commandHandler, self, v12, v13);
  }
  -[IOUSBHostControllerInterface setCommand:](self, "setCommand:", 0, 0);
  *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  id v32 = v14;
  uint64_t v33 = v14;
  v31 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  reference[1] = (uint64_t)_commandAsyncCallback;
  os_log_type_t v30 = self;
  input = (uint64_t)&v30->_command;
  outputCnt = 0;
  mach_port_t v15 = [(IOUSBHostControllerInterface *)v30 ioConnect];
  mach_port_t MachPort = IONotificationPortGetMachPort([(IOUSBHostControllerInterface *)v30 notificationPortRef]);
  NSUInteger v17 = IOConnectCallAsyncScalarMethod(v15, 0, MachPort, reference, 3u, &input, 1u, 0, &outputCnt);
  BOOL v7 = v17 == 0;
  if (v17)
  {
    NSUInteger v18 = v17;

    if (a4)
    {
      v34[0] = *MEMORY[0x263F08320];
      unint64_t v19 = [MEMORY[0x263F086E0] mainBundle];
      unint64_t v20 = [v19 localizedStringForKey:@"Failed to read command from kernel." value:&stru_26DBD82D0 table:0];
      v35[0] = v20;
      v34[1] = *MEMORY[0x263F08338];
      id v21 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v22 = [v21 localizedStringForKey:@"Unable to enqueue asynchronous operation." value:&stru_26DBD82D0 table:0];
      v35[1] = v22;
      v34[2] = *MEMORY[0x263F08348];
      BOOL v23 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v24 = [v23 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v35[2] = v24;
      unsigned int v25 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];

      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v18 userInfo:v25];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostControllerInterface commandAsyncCallbackWithResult:error:]();
      }
    }
  }
  return v7;
}

- (BOOL)doorbellAsyncCallbacKWithResult:(int)a3 length:(unint64_t)a4 error:(id *)a5
{
  kern_return_t v32;
  kern_return_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint32_t outputCnt;
  uint64_t input[2];
  uint8_t buf[16];
  long long v45;
  long long v46;
  long long v47;
  void v48[3];
  void v49[6];

  v49[3] = *MEMORY[0x263EF8340];
  if ([(IOUSBHostControllerInterface *)self destroyed]) {
    return 1;
  }
  if (!a3 && a4)
  {
    int v10 = [(IOUSBHostControllerInterface *)self doorbells];
    [v10 setLength:a4];

    v11 = [(IOUSBHostControllerInterface *)self log];
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

    if (v12)
    {
      uint64_t v13 = [(IOUSBHostControllerInterface *)self doorbells];
      uint64_t v14 = [v13 length] & 0x3FFFFFFFCLL;

      if (v14)
      {
        unint64_t v15 = 0;
        do
        {
          id v16 = [(IOUSBHostControllerInterface *)self doorbells];
          int v17 = *(_DWORD *)([v16 mutableBytes] + 4 * v15);

          NSUInteger v18 = [(IOUSBHostControllerInterface *)self log];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 67109376;
            *(_DWORD *)&buf[4] = v17;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = BYTE1(v17);
            _os_log_debug_impl(&dword_227999000, v18, OS_LOG_TYPE_DEBUG, "doorbell Device %d Endpoint 0x%02x\n", buf, 0xEu);
          }

          ++v15;
          unint64_t v19 = [(IOUSBHostControllerInterface *)self doorbells];
          unint64_t v20 = (unint64_t)[v19 length] >> 2;
        }
        while (v15 < v20);
      }
    }
    doorbellHandler = (void (**)(id, IOUSBHostControllerInterface *, uint64_t, unint64_t))self->_doorbellHandler;
    id v22 = [(IOUSBHostControllerInterface *)self doorbells];
    uint64_t v23 = [v22 mutableBytes];
    uint64_t v24 = [(IOUSBHostControllerInterface *)self doorbells];
    doorbellHandler[2](doorbellHandler, self, v23, (unint64_t)[v24 length] >> 2);

    unsigned int v25 = [(IOUSBHostControllerInterface *)self doorbells];
    [v25 setLength:4096];

    uint64_t v26 = [(IOUSBHostControllerInterface *)self doorbells];
    objc_msgSend(v26, "resetBytesInRange:", 0, a4);
  }
  *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v46 = v27;
  dispatch_time_t v47 = v27;
  *(void *)long long buf = 0xAAAAAAAAAAAAAAAALL;
  dispatch_time_t v45 = v27;
  *(void *)&buf[8] = _doorbellAsyncCallback;
  v28 = self;
  *(void *)&dispatch_time_t v45 = v28;
  id v29 = [(IOUSBHostControllerInterface *)v28 doorbells];
  input[0] = [v29 mutableBytes];

  os_log_type_t v30 = [(IOUSBHostControllerInterface *)v28 doorbells];
  input[1] = [v30 length];

  outputCnt = 0;
  LODWORD(v30) = [(IOUSBHostControllerInterface *)v28 ioConnect];
  mach_port_t MachPort = IONotificationPortGetMachPort([(IOUSBHostControllerInterface *)v28 notificationPortRef]);
  id v32 = IOConnectCallAsyncScalarMethod((mach_port_t)v30, 1u, MachPort, (uint64_t *)buf, 3u, input, 2u, 0, &outputCnt);
  BOOL v9 = v32 == 0;
  if (v32)
  {
    uint64_t v33 = v32;

    if (a5)
    {
      v48[0] = *MEMORY[0x263F08320];
      v34 = [MEMORY[0x263F086E0] mainBundle];
      v35 = [v34 localizedStringForKey:@"Failed to read doorbells from kernel." value:&stru_26DBD82D0 table:0];
      v49[0] = v35;
      v48[1] = *MEMORY[0x263F08338];
      BOOL v36 = [MEMORY[0x263F086E0] mainBundle];
      BOOL v37 = [v36 localizedStringForKey:@"Unable to enqueue asynchronous operation." value:&stru_26DBD82D0 table:0];
      v49[1] = v37;
      v48[2] = *MEMORY[0x263F08348];
      v38 = [MEMORY[0x263F086E0] mainBundle];
      v39 = [v38 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v49[2] = v39;
      v40 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:3];

      *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v33 userInfo:v40];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostControllerInterface doorbellAsyncCallbacKWithResult:length:error:]();
      }
    }
  }
  return v9;
}

- (IOUSBHostCIPortStateMachine)getPortStateMachineForCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  if ((command->control & 0x3F) - 24 > 6)
  {
    v4 = 0;
  }
  else
  {
    v4 = [(IOUSBHostControllerInterface *)self getPortStateMachineForPort:command->data0 & 0xFLL error:error];
  }
  return (IOUSBHostCIPortStateMachine *)v4;
}

- (IOUSBHostCIPortStateMachine)getPortStateMachineForPort:(NSUInteger)port error:(NSError *)error
{
  v21[3] = *MEMORY[0x263EF8340];
  if (port && ((_WORD)[(IOUSBHostControllerInterface *)self capabilities][2] & 0xFu) >= port)
  {
    portStateMachine = self->_portStateMachine;
    id v16 = self->_portStateMachine[port];
    if (!v16)
    {
      int v17 = [[IOUSBHostCIPortStateMachine alloc] initWithInterface:self portNumber:port error:error];
      NSUInteger v18 = portStateMachine[port];
      portStateMachine[port] = v17;

      id v16 = portStateMachine[port];
    }
    uint64_t v14 = v16;
  }
  else
  {
    if (error)
    {
      v20[0] = *MEMORY[0x263F08320];
      BOOL v7 = [MEMORY[0x263F086E0] mainBundle];
      id v8 = [v7 localizedStringForKey:@"Failed to retrieve port state machine." value:&stru_26DBD82D0 table:0];
      v21[0] = v8;
      v20[1] = *MEMORY[0x263F08338];
      BOOL v9 = [MEMORY[0x263F086E0] mainBundle];
      int v10 = [v9 localizedStringForKey:@"Port number is out of range." value:&stru_26DBD82D0 table:0];
      v21[1] = v10;
      v20[2] = *MEMORY[0x263F08348];
      v11 = [MEMORY[0x263F086E0] mainBundle];
      BOOL v12 = [v11 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v21[2] = v12;
      uint64_t v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v13];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostControllerInterface getPortStateMachineForPort:error:]();
      }
    }
    uint64_t v14 = 0;
  }
  return v14;
}

- (const)capabilitiesForPort:(NSUInteger)port
{
  NSUInteger v5 = [(NSData *)self->_capabilitiesData length];
  if (v5 < 0x20) {
    return 0;
  }
  unint64_t v6 = v5 >> 4;
  unsigned int v7 = 2;
  uint64_t v8 = 1;
  while (1)
  {
    BOOL v9 = [(IOUSBHostControllerInterface *)self capabilities];
    if ((v9[v8].control & 0x3F) == 1 && (((unint64_t)v9[v8].control >> 16) & 0xF) == port) {
      break;
    }
    uint64_t v8 = v7;
    if (v6 <= v7++) {
      return 0;
    }
  }
  return &v9[v8];
}

- (NSString)descriptionForMessage:(const IOUSBHostCIMessage *)message
{
  NSUInteger v5 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithFormat:", @"0x%08x %08x %016llx", message->control, message->data0, message->data1);
  if ((message->control & 0x8000) == 0)
  {
    unint64_t v6 = @": Invalid";
LABEL_3:
    [v5 appendString:v6];
    goto LABEL_37;
  }
  objc_msgSend(v5, "appendFormat:", @": %s", IOUSBHostCIMessageTypeToString((IOUSBHostCIMessageType)(message->control & 0x3F)));
  unsigned int v7 = IOUSBHostCIMessageStatusToString((IOUSBHostCIMessageStatus)((message->control >> 8) & 0xF));
  unint64_t control = message->control;
  BOOL v9 = v7;
  switch(control & 0x3F)
  {
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
      objc_msgSend(v5, "appendFormat:", @" Root Port %u", message->data0 & 0xF);
      if ((message->control & 0x4000) != 0)
      {
        objc_msgSend(v5, "appendFormat:", @" Status %s", v9);
        objc_msgSend(v5, "appendString:", @" (");
        data1 = message->data1;
        if (data1)
        {
          [v5 appendString:@" Powered"];
          data1 = message->data1;
          if ((data1 & 2) == 0)
          {
LABEL_42:
            if ((data1 & 4) == 0) {
              goto LABEL_44;
            }
            goto LABEL_43;
          }
        }
        else if ((data1 & 2) == 0)
        {
          goto LABEL_42;
        }
        [v5 appendString:@" Overcurrent"];
        data1 = message->data1;
        if ((data1 & 4) == 0)
        {
LABEL_44:
          objc_msgSend(v5, "appendFormat:", @" Link State %s", IOUSBHostCILinkStateToString((IOUSBHostCILinkState)(data1 >> 4)));
          if (IOUSBHostCILinkStateEnabled((const IOUSBHostCILinkState)(LODWORD(message->data1) >> 4))) {
            objc_msgSend(v5, "appendFormat:", @" Device Speed %s", IOUSBHostCIDeviceSpeedToString((IOUSBHostCIDeviceSpeed)((LODWORD(message->data1) >> 8) & 7)));
          }
          uint64_t v20 = message->data1;
          if ((v20 & 0x20000) != 0)
          {
            [v5 appendString:@" Overcurrent Change"];
            uint64_t v20 = message->data1;
            if ((v20 & 0x40000) == 0)
            {
LABEL_48:
              if ((v20 & 0x100000) == 0)
              {
LABEL_50:
                unint64_t v6 = @"");
                goto LABEL_3;
              }
LABEL_49:
              [v5 appendString:@" Link Change"];
              goto LABEL_50;
            }
          }
          else if ((v20 & 0x40000) == 0)
          {
            goto LABEL_48;
          }
          [v5 appendString:@" Connect Change"];
          if ((message->data1 & 0x100000) == 0) {
            goto LABEL_50;
          }
          goto LABEL_49;
        }
LABEL_43:
        [v5 appendString:@" Connected"];
        data1 = message->data1;
        goto LABEL_44;
      }
      if ((message->control & 0x3F) != 0x1E || (message->data1 & 0x160000) == 0) {
        goto LABEL_37;
      }
      [v5 appendString:@" Clear Change Bits:"];
      uint64_t v10 = message->data1;
      if ((v10 & 0x20000) != 0)
      {
        [v5 appendString:@" Overcurrent"];
        uint64_t v10 = message->data1;
        if ((v10 & 0x40000) == 0)
        {
LABEL_10:
          if ((v10 & 0x100000) != 0) {
            goto LABEL_71;
          }
          goto LABEL_37;
        }
      }
      else if ((v10 & 0x40000) == 0)
      {
        goto LABEL_10;
      }
      [v5 appendString:@" Connect"];
      if ((message->data1 & 0x100000) != 0)
      {
LABEL_71:
        unint64_t v6 = @" Link";
        goto LABEL_3;
      }
LABEL_37:
      return (NSString *)v5;
    case 0x20uLL:
      objc_msgSend(v5, "appendFormat:", @" Port Route 0x%08x", message->data0 & 0xFFFFFF);
      if ((message->control & 0x4000) != 0) {
        objc_msgSend(v5, "appendFormat:", @" Device Address %llu Status %s", LOBYTE(message->data1), v9, v24, v25, v26);
      }
      goto LABEL_37;
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
      objc_msgSend(v5, "appendFormat:", @" Device Address %u", LOBYTE(message->data0));
      if ((message->control & 0x4000) != 0) {
        goto LABEL_36;
      }
      if ((message->control & 0x3F) != 0x24) {
        goto LABEL_37;
      }
      objc_msgSend(v5, "appendFormat:", @" Descriptor 0x%016llx", message->data1);
      unint64_t v15 = (unsigned char *)message->data1;
      if (!v15) {
        goto LABEL_37;
      }
      objc_msgSend(v5, "appendString:", @" (");
      if (!*v15) {
        goto LABEL_35;
      }
      unint64_t v16 = 0;
      do
      {
        if (v16) {
          int v17 = " ";
        }
        else {
          int v17 = "0x";
        }
        objc_msgSend(v5, "appendFormat:", @"%s%02x", v17, v15[v16]);
        unint64_t v14 = *v15;
        if (v16 > 6) {
          break;
        }
        ++v16;
      }
      while (v16 < v14);
      goto LABEL_33;
    case 0x28uLL:
    case 0x29uLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
      objc_msgSend(v5, "appendFormat:", @" Device %d Endpoint 0x%02x", message->data0, BYTE1(message->data0));
      if ((message->control & 0x4000) != 0)
      {
LABEL_36:
        objc_msgSend(v5, "appendFormat:", @" Status %s", v9, v23, v24, v25, v26);
        goto LABEL_37;
      }
      switch(message->control & 0x3F)
      {
        case '(':
        case ',':
          objc_msgSend(v5, "appendFormat:", @" Descriptor 0x%016llx", message->data1);
          v11 = (unsigned char *)message->data1;
          if (!v11) {
            goto LABEL_37;
          }
          objc_msgSend(v5, "appendString:", @" (");
          if (!*v11) {
            goto LABEL_35;
          }
          unint64_t v12 = 0;
          do
          {
            if (v12) {
              uint64_t v13 = " ";
            }
            else {
              uint64_t v13 = "0x";
            }
            objc_msgSend(v5, "appendFormat:", @"%s%02x", v13, v11[v12]);
            unint64_t v14 = *v11;
            if (v12 > 6) {
              break;
            }
            ++v12;
          }
          while (v12 < v14);
          break;
        case '-':
          if (message->data1) {
            id v21 = "YES";
          }
          else {
            id v21 = "NO";
          }
          objc_msgSend(v5, "appendFormat:", @" Clear State %s", v21, v23, v24, v25, v26);
          goto LABEL_37;
        case '.':
          objc_msgSend(v5, "appendFormat:", @" Transfer Structure 0x%016llx", message->data1, v23, v24, v25, v26);
          goto LABEL_67;
        default:
          goto LABEL_37;
      }
LABEL_33:
      if (v14 > 7) {
        [v5 appendString:@"..."];
      }
LABEL_35:
      unint64_t v6 = @"");
      goto LABEL_3;
    case 0x38uLL:
      objc_msgSend(v5, "appendFormat:", @" Request 0x%02x %02x %04x %04x %04x", LOBYTE(message->data1), BYTE1(message->data1), WORD1(message->data1), WORD2(message->data1), HIWORD(message->data1));
      goto LABEL_37;
    case 0x39uLL:
      objc_msgSend(v5, "appendFormat:", @" Length 0x%x Buffer 0x%016llx\n", message->data0 & 0xFFFFFFF, message->data1, v24, v25, v26);
      goto LABEL_37;
    case 0x3DuLL:
      objc_msgSend(v5, "appendFormat:", @" Device %u Endpoint 0x%02lx Length %u Status %s Transfer Structure 0x%016llx", BYTE2(control), control >> 24, message->data0 & 0xFFFFFFF, v7, message->data1);
LABEL_67:
      if (message->data1)
      {
        [v5 appendString:@": "];
        id v22 = [(IOUSBHostControllerInterface *)self descriptionForMessage:message->data1];
        [v5 appendString:v22];
      }
      goto LABEL_37;
    default:
      goto LABEL_37;
  }
}

- (dispatch_queue_t)queue
{
  return (dispatch_queue_t)self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSUInteger)interruptRateHz
{
  return self->_interruptRateHz;
}

- (IOUSBHostCIControllerStateMachine)controllerStateMachine
{
  return self->_controllerStateMachine;
}

- (void)setControllerStateMachine:(id)a3
{
}

- (const)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(const IOUSBHostCIMessage *)a3
{
  self->_capabilities = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (unsigned)ioConnect
{
  return self->_ioConnect;
}

- (void)setIoConnect:(unsigned int)a3
{
  self->_ioConnect = a3;
}

- (IONotificationPort)notificationPortRef
{
  return self->_notificationPortRef;
}

- (void)setNotificationPortRef:(IONotificationPort *)a3
{
  self->_notificationPortRef = a3;
}

- (id)commandHandler
{
  return self->_commandHandler;
}

- (void)setCommandHandler:(id)a3
{
}

- (id)doorbellHandler
{
  return self->_doorbellHandler;
}

- (void)setDoorbellHandler:(id)a3
{
}

- (void)interestHandler
{
  return self->_interestHandler;
}

- (void)setInterestHandler:(void *)a3
{
  self->_interestHandler = a3;
}

- (IOUSBHostInterestNotifier)interestNotifier
{
  return self->_interestNotifier;
}

- (void)setInterestNotifier:(id)a3
{
}

- (IOUSBHostCIMessage)command
{
  objc_copyStruct(v4, &self->_command, 16, 1, 0);
  uint64_t v2 = v4[0];
  uint64_t v3 = v4[1];
  result.data1 = v3;
  result.unint64_t control = v2;
  result.data0 = HIDWORD(v2);
  return result;
}

- (void)setCommand:(IOUSBHostCIMessage)a3
{
  IOUSBHostCIMessage v3 = a3;
  objc_copyStruct(&self->_command, &v3, 16, 1, 0);
}

- (NSMutableData)doorbells
{
  return self->_doorbells;
}

- (void)setDoorbells:(id)a3
{
}

- (NSMutableData)interrupts
{
  return self->_interrupts;
}

- (void)setInterrupts:(id)a3
{
}

- (NSRecursiveLock)interruptLock
{
  return self->_interruptLock;
}

- (void)setInterruptLock:(id)a3
{
}

- (unint64_t)interruptProducerIndex
{
  return self->_interruptProducerIndex;
}

- (void)setInterruptProducerIndex:(unint64_t)a3
{
  self->_interruptProducerIndex = a3;
}

- (unint64_t)interruptConsumerIndex
{
  return self->_interruptConsumerIndex;
}

- (void)setInterruptConsumerIndex:(unint64_t)a3
{
  self->_interruptConsumerIndex = a3;
}

- (BOOL)interruptDeliveryPending
{
  return self->_interruptDeliveryPending;
}

- (void)setInterruptDeliveryPending:(BOOL)a3
{
  self->_interruptDeliveryPending = a3;
}

- (OS_dispatch_queue)interruptQueue
{
  return self->_interruptQueue;
}

- (void)setInterruptQueue:(id)a3
{
}

- (unint64_t)nextInterruptTime
{
  return self->_nextInterruptTime;
}

- (void)setNextInterruptTime:(unint64_t)a3
{
  self->_nextInterruptTime = a3;
}

- (BOOL)destroyed
{
  return self->_destroyed;
}

- (void)setDestroyed:(BOOL)a3
{
  self->_destroyed = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_interruptQueue, 0);
  objc_storeStrong((id *)&self->_interruptLock, 0);
  objc_storeStrong((id *)&self->_interrupts, 0);
  objc_storeStrong((id *)&self->_doorbells, 0);
  objc_storeStrong((id *)&self->_interestNotifier, 0);
  objc_storeStrong(&self->_doorbellHandler, 0);
  objc_storeStrong(&self->_commandHandler, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_controllerStateMachine, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  for (uint64_t i = 136; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_capabilitiesData, 0);
}

- (void)initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.1()
{
  [@"Failed to create IOUSBHostControllerInterface." cStringUsingEncoding:4];
  [@"Unable to allocate memory." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.2()
{
  [@"Failed to create IOUSBHostControllerInterface." cStringUsingEncoding:4];
  [@"Capabilities are not valid." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.3()
{
  [@"Failed to create IOUSBHostControllerInterface." cStringUsingEncoding:4];
  [@"Failed to allocate interruptData." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.4()
{
  [@"Failed to create IOUSBHostControllerInterface." cStringUsingEncoding:4];
  [@"Failed to allocate interruptQueue." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.5()
{
  [@"Failed to create IOUSBHostControllerInterface." cStringUsingEncoding:4];
  [@"Failed to allocate interruptLock." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.6()
{
  [@"Failed to create IOUSBHostControllerInterface." cStringUsingEncoding:4];
  [@"Unable to connect to the kernel." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.7()
{
  [@"Failed to create IOUSBHostControllerInterface." cStringUsingEncoding:4];
  [@"Failed to create UUID." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.8()
{
  [@"Failed to create IOUSBHostControllerInterface." cStringUsingEncoding:4];
  [@"Unable to create interest notifier." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.9()
{
  [@"Failed to create IOUSBHostControllerInterface." cStringUsingEncoding:4];
  [@"Unable to create notification port." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.10()
{
  [@"Failed to create IOUSBHostControllerInterface." cStringUsingEncoding:4];
  [@"Capabilities structure was rejected." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.11()
{
  [@"Failed to create IOUSBHostControllerInterface." cStringUsingEncoding:4];
  [@"Unable to set UUID property." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.12()
{
  [@"Failed to create IOUSBHostControllerInterface." cStringUsingEncoding:4];
  [@"Unable to allocate memory for doorbells." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)enqueueInterrupts:count:expedite:error:.cold.1()
{
  [@"Failed to send interrupts." cStringUsingEncoding:4];
  [@"Not enough space for interrupts." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)commandAsyncCallbackWithResult:error:.cold.1()
{
  [@"Failed to read command from kernel." cStringUsingEncoding:4];
  [@"Unable to enqueue asynchronous operation." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)commandAsyncCallbackWithResult:(char *)a1 error:(NSObject *)a2 .cold.2(char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 descriptionForMessage:a1 + 296];
  int v4 = 136315138;
  uint64_t v5 = [v3 cStringUsingEncoding:4];
  _os_log_debug_impl(&dword_227999000, a2, OS_LOG_TYPE_DEBUG, "command %s", (uint8_t *)&v4, 0xCu);
}

- (void)doorbellAsyncCallbacKWithResult:length:error:.cold.1()
{
  [@"Failed to read doorbells from kernel." cStringUsingEncoding:4];
  [@"Unable to enqueue asynchronous operation." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)getPortStateMachineForPort:error:.cold.1()
{
  [@"Failed to retrieve port state machine." cStringUsingEncoding:4];
  [@"Port number is out of range." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

@end