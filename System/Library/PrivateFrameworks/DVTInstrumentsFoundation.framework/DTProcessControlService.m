@interface DTProcessControlService
+ (void)registerCapabilities:(id)a3;
- (DTProcessControlService)initWithChannel:(id)a3;
- (id)insertViewDebuggingLibrariesForPid:(int)a3;
- (id)launchSuspendedProcessWithDevicePath:(id)a3 bundleIdentifier:(id)a4 environment:(id)a5 arguments:(id)a6;
- (id)launchSuspendedProcessWithDevicePath:(id)a3 bundleIdentifier:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7;
- (id)requestDisableMemoryLimitsForPid:(int)a3;
- (int)cleanupPid:(int)a3;
- (int)maybeRedirectFromFileDescriptor:(int)a3 fromPid:(int)a4 withScratchBuffer:(char *)a5 ofByteLength:(unint64_t)a6;
- (void)_performMemoryWarningForPid:(int)a3;
- (void)handleRedirectionIterationForFileDescriptor:(int)a3 forPid:(int)a4 withDispatchSource:(id)a5;
- (void)killPid:(id)a3;
- (void)resumePid:(id)a3;
- (void)sendProcessControlEvent:(id)a3 toPid:(id)a4;
- (void)sendSignal:(id)a3 toPid:(id)a4;
- (void)startObservingPid:(id)a3;
- (void)stopObservingPid:(id)a3;
- (void)suspendPid:(id)a3;
- (void)watchOutputFileDescriptor:(int)a3 forPid:(int)a4;
- (void)watchOutputFileName:(id)a3 directory:(id)a4 forPid:(int)a5;
@end

@implementation DTProcessControlService

+ (void)registerCapabilities:(id)a3
{
  id v4 = a3;
  [v4 publishCapability:@"com.apple.instruments.server.services.processcontrol.capability.signal" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.processcontrol.capability.memorylimits" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.processcontrol.capability.viewdebuggingutils" withVersion:1 forClass:a1];
}

- (DTProcessControlService)initWithChannel:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DTProcessControlService;
  v5 = [(DTXService *)&v19 initWithChannel:v4];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("process death queue", 0);
    deathNoteQueue = v5->_deathNoteQueue;
    v5->_deathNoteQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("I/O redirection queue", MEMORY[0x263EF83A8]);
    synchronousRedirectionQueue = v5->_synchronousRedirectionQueue;
    v5->_synchronousRedirectionQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pids = v5->_pids;
    v5->_pids = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    sources = v5->_sources;
    v5->_sources = v12;

    uint64_t v14 = objc_opt_new();
    activeIODispatchSources = v5->_activeIODispatchSources;
    v5->_activeIODispatchSources = (NSMutableDictionary *)v14;

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_2308C668C;
    v17[3] = &unk_264B8D590;
    v18 = v5;
    [v4 registerDisconnectHandler:v17];
  }
  return v5;
}

- (void)startObservingPid:(id)a3
{
  id v4 = a3;
  int v5 = [v4 intValue];
  deathNoteQueue = self->_deathNoteQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308C6874;
  block[3] = &unk_264B8ED98;
  block[4] = self;
  id v9 = v4;
  int v10 = v5;
  id v7 = v4;
  dispatch_sync(deathNoteQueue, block);
}

- (void)stopObservingPid:(id)a3
{
  id v8 = a3;
  uint64_t v4 = -[NSMutableArray indexOfObject:](self->_pids, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v5 = [(NSMutableArray *)self->_sources objectAtIndex:v4];
    dispatch_source_cancel(v5);
  }
  dispatch_queue_t v6 = [(NSMutableDictionary *)self->_activeIODispatchSources objectForKeyedSubscript:v8];
  id v7 = v6;
  if (v6) {
    dispatch_source_cancel(v6);
  }
}

- (void)resumePid:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a3 intValue];
  if (!v3) {
    return;
  }
  uint64_t v4 = v3;
  if (v3 == getpid()) {
    return;
  }
  if (!DTProcessIsSigStopped(v4)) {
    goto LABEL_7;
  }
  if (kill(v4, 19))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v5 = __error();
      dispatch_queue_t v6 = strerror(*v5);
      int v8 = 67109378;
      int v9 = v4;
      __int16 v10 = 2080;
      v11 = v6;
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to resume pid %d with SIGCONT (%s), will attempt task_resume() if authorized", (uint8_t *)&v8, 0x12u);
    }
LABEL_7:
    task_read_t v7 = +[DTInstrumentServer taskForPid:v4];
    if (v7 - 1 >= 0xFFFFFFFE
      && sub_2308C6778()
      && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v8 = 67109120;
      int v9 = v4;
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_INFO, "no task port available to resume pid %d with task_resume()", (uint8_t *)&v8, 8u);
    }
    task_resume(v7);
    mach_port_deallocate(*MEMORY[0x263EF8960], v7);
    return;
  }
  if (sub_2308C6778() && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v8 = 67109120;
    int v9 = v4;
    _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_INFO, "sent SIGCONT to pid %d", (uint8_t *)&v8, 8u);
  }
}

- (void)suspendPid:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a3 intValue];
  if (v3)
  {
    uint64_t v4 = v3;
    if (v3 != getpid())
    {
      task_read_t v5 = +[DTInstrumentServer taskForPid:v4];
      if (v5 - 1 >= 0xFFFFFFFE)
      {
        if (sub_2308C6778() && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          int v10 = 67109120;
          int v11 = v4;
          _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_INFO, "attempting suspend via SIGSTOP for pid %d", (uint8_t *)&v10, 8u);
        }
        if (kill(v4, 17) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          int v8 = __error();
          int v9 = strerror(*v8);
          int v10 = 67109378;
          int v11 = v4;
          __int16 v12 = 2080;
          v13 = v9;
          _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to suspend pid %d with SIGSTOP: %s", (uint8_t *)&v10, 0x12u);
        }
      }
      else
      {
        mach_port_name_t v6 = v5;
        task_suspend(v5);
        ipc_space_t v7 = *MEMORY[0x263EF8960];
        mach_port_deallocate(v7, v6);
      }
    }
  }
}

- (id)launchSuspendedProcessWithDevicePath:(id)a3 bundleIdentifier:(id)a4 environment:(id)a5 arguments:(id)a6
{
  return (id)MEMORY[0x270F9A6D0](self, sel_launchSuspendedProcessWithDevicePath_bundleIdentifier_environment_arguments_options_);
}

- (id)launchSuspendedProcessWithDevicePath:(id)a3 bundleIdentifier:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7
{
  ipc_space_t v7 = (void *)MEMORY[0x263EFF940];
  int v8 = (objc_class *)objc_opt_class();
  int v9 = NSStringFromClass(v8);
  [v7 raise:@"DTProcessControlConcreteImplementationRequiredException" format:@"launchSuspendedProcessWithDevicePath:bundleIdentifier:environment:arguments: not implemented in %@; subclass and override.",
    v9);

  return 0;
}

- (void)killPid:(id)a3
{
}

- (void)sendSignal:(id)a3 toPid:(id)a4
{
  id v14 = a3;
  uint64_t v6 = [a4 intValue];
  if (v6)
  {
    uint64_t v7 = v6;
    if (v6 != getpid())
    {
      uint64_t v8 = [v14 intValue];
      HIDWORD(v10) = v8 - 9;
      LODWORD(v10) = v8 - 9;
      unsigned int v9 = v10 >> 1;
      BOOL v11 = v9 > 5;
      int v12 = (1 << v9) & 0x39;
      if (v11 || v12 == 0) {
        [MEMORY[0x263EFF940] raise:@"DTProcessControlServiceSendSignalException" format:@"Unsupported signal %i", v8];
      }
      if (kill(v7, v8) == -1)
      {
        if (v8 != 15 && v8 != 9 || *__error() != 3) {
          [MEMORY[0x263EFF940] raise:@"DTProcessControlServiceSendSignalException" format:@"Failed to send signal %i to process %i: %i", v8, v7, *__error()];
        }
      }
      else if (v8 == 15 || v8 == 9)
      {
        [(DTProcessControlService *)self cleanupPid:v7];
      }
    }
  }
}

- (void)_performMemoryWarningForPid:(int)a3
{
  unsigned int v3 = a3;
  if (a3 >= 1)
  {
    if (sysctlbyname("kern.memorystatus_vm_pressure_send", 0, 0, &v3, 4uLL)) {
      [MEMORY[0x263EFF940] raise:@"DTSpringBoardProcessControlServiceException" format:@"failed to send memory warning to %d", v3];
    }
  }
}

- (void)sendProcessControlEvent:(id)a3 toPid:(id)a4
{
  id v6 = a4;
  uint64_t v7 = DTProcessControlEventUnarchive(a3);
  uint64_t v8 = [v6 intValue];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(DTProcessControlService *)self _performMemoryWarningForPid:v8];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v7;
      unint64_t v10 = [v9 objectForKey:@"PCEventType"];
      if ([v10 isEqualToString:@"MemoryEvent"])
      {
        [(DTProcessControlService *)self _performMemoryWarningForPid:v8];
      }
      else if ([v10 isEqualToString:@"MetricPayloadsExample"])
      {
        BOOL v11 = [v9 objectForKey:@"BundleIdentifier"];
        int v12 = v11;
        if (v11 && [v11 length] && NSClassFromString(&cfstr_Mxsourcemanage.isa))
        {
          v13 = [MEMORY[0x263F55770] sharedManager];
          [v13 simulatePayloadDeliveryForClient:v12];
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v14 = 0;
          _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BundleID is nil or empty. Couldn't deliver dummy payload", v14, 2u);
        }
      }
    }
  }
}

- (int)cleanupPid:(int)a3
{
  return 0x80000000;
}

- (id)requestDisableMemoryLimitsForPid:(int)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v4 = memorystatus_control();
  if (v4)
  {
    int v5 = v4;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      int v8 = a3;
      __int16 v9 = 1024;
      int v10 = v5;
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to disable active and inactive memory limits for pid %d (result = %d)", buf, 0xEu);
    }
    return (id)MEMORY[0x263EFFA80];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      int v8 = a3;
      __int16 v9 = 1024;
      int v10 = 0;
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_INFO, "Disabled active and inactive memory limits for pid %d (result = %d)", buf, 0xEu);
    }
    return (id)MEMORY[0x263EFFA88];
  }
}

- (id)insertViewDebuggingLibrariesForPid:(int)a3
{
  kern_return_t v12;
  kern_return_t v13;
  void *v14;
  RemoteBundleLoader *v15;
  void *v16;
  id v17;
  RemoteBundleLoader *v18;
  id v19;
  id v20;
  void *v22;
  void *v23;
  id v24;
  void v25[4];
  id v26;
  mach_port_name_t v27;
  mach_port_name_t v28;
  uint8_t buf[4];
  int v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void v34[2];
  uint64_t vars8;

  uint64_t v3 = *(void *)&a3;
  v34[1] = *MEMORY[0x263EF8340];
  int v4 = objc_opt_new();
  int v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = @"/usr/lib/libViewDebuggerSupport.dylib";
  char v7 = [v5 fileExistsAtPath:@"/usr/lib/libViewDebuggerSupport.dylib"];

  if (v7) {
    goto LABEL_4;
  }
  int v8 = [MEMORY[0x263F08850] defaultManager];
  id v6 = @"/System/Developer/usr/lib/libViewDebuggerSupport.dylib";
  char v9 = [v8 fileExistsAtPath:@"/System/Developer/usr/lib/libViewDebuggerSupport.dylib"];

  if ((v9 & 1) != 0
    || ([MEMORY[0x263F08850] defaultManager],
        int v10 = objc_claimAutoreleasedReturnValue(),
        id v6 = @"/Developer/Library/PrivateFrameworks/DTDDISupport.framework/libViewDebuggerSupport.dylib",
        char v11 = [v10 fileExistsAtPath:@"/Developer/Library/PrivateFrameworks/DTDDISupport.framework/libViewDebuggerSupport.dylib"], v10, (v11 & 1) != 0))
  {
LABEL_4:
    v28 = 0;
    int v12 = task_for_pid(*MEMORY[0x263EF8960], v3, &v28);
    if (v12)
    {
      v13 = v12;
      v31 = *MEMORY[0x263F08320];
      id v14 = [NSString stringWithFormat:@"Failed to get task for pid %d", v3];
      v32 = v14;
      v15 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];

      v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08350] code:v13 userInfo:v15];
      [v4 invokeCompletionWithReturnValue:0 error:v16];
      v17 = v4;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        v30 = v3;
        _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Got task for pid %d", buf, 8u);
      }
      v18 = [RemoteBundleLoader alloc];
      v15 = [(RemoteBundleLoader *)v18 initWithTask:v28];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = sub_2308C7C30;
      v25[3] = &unk_264B8F178;
      v27 = v28;
      objc_super v19 = v4;
      v26 = v19;
      [(RemoteBundleLoader *)v15 scheduleLibraryLoad:v6 calling:@"_DBGViewHierarchyInitialize" arguments:MEMORY[0x263EFFA68] callback:v25];
      v20 = v19;
      v16 = v26;
    }
  }
  else
  {
    v33 = *MEMORY[0x263F08320];
    v34[0] = @"Couldn't locate view debugging support libraries";
    v22 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    v23 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.dt.instruments" code:-1 userInfo:v22];
    [v4 invokeCompletionWithReturnValue:0 error:v23];
    v24 = v4;
  }
  return v4;
}

- (int)maybeRedirectFromFileDescriptor:(int)a3 fromPid:(int)a4 withScratchBuffer:(char *)a5 ofByteLength:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a4;
  ssize_t v9 = read(a3, a5, a6 - 1);
  if (v9 < 0)
  {
    int v14 = *__error();
    if (v14 == 35) {
      int v15 = 1;
    }
    else {
      int v15 = 4;
    }
    if (v14 == 4) {
      return 2;
    }
    else {
      return v15;
    }
  }
  else if (v9)
  {
    a5[v9] = 0;
    int v10 = [NSString stringWithUTF8String:a5];
    char v11 = [MEMORY[0x263F38CA0] messageWithSelector:sel_outputReceived_fromProcess_atTime_ typesAndArguments:11, v10, 3, v7, 6, mach_absolute_time(), 0];
    int v12 = [(DTXService *)self channel];
    [v12 sendMessageAsync:v11 replyHandler:0];

    return 0;
  }
  else
  {
    return 3;
  }
}

- (void)handleRedirectionIterationForFileDescriptor:(int)a3 forPid:(int)a4 withDispatchSource:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  source = a5;
  int v8 = (void *)MEMORY[0x263EF8AF8];
  ssize_t v9 = malloc_type_malloc(*MEMORY[0x263EF8AF8], 0x48FD2A4uLL);
  do
    int v10 = [(DTProcessControlService *)self maybeRedirectFromFileDescriptor:v6 fromPid:v5 withScratchBuffer:v9 ofByteLength:*v8];
  while ((v10 & 0xFFFFFFFD) == 0);
  int v11 = v10;
  free(v9);
  if ((v11 - 3) <= 1) {
    dispatch_source_cancel(source);
  }
}

- (void)watchOutputFileDescriptor:(int)a3 forPid:(int)a4
{
  if ((a3 & 0x80000000) == 0)
  {
    int v6 = dup(a3);
    int v7 = fcntl(v6, 3);
    if (v7 != -1)
    {
      if ((v7 & 4) == 0) {
        fcntl(v6, 4, v7 | 4u);
      }
      int v8 = dispatch_source_create(MEMORY[0x263EF83E8], v6, 0, (dispatch_queue_t)self->_deathNoteQueue);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = sub_2308C8124;
      handler[3] = &unk_264B8D8E8;
      handler[4] = self;
      int v25 = v6;
      int v26 = a4;
      dispatch_source_set_cancel_handler(v8, handler);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = sub_2308C81EC;
      v20[3] = &unk_264B8EF50;
      v20[4] = self;
      int v22 = v6;
      int v23 = a4;
      ssize_t v9 = v8;
      v21 = v9;
      dispatch_source_set_registration_handler(v9, v20);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = sub_2308C81FC;
      v16[3] = &unk_264B8EF50;
      v16[4] = self;
      int v18 = v6;
      int v19 = a4;
      int v10 = v9;
      v17 = v10;
      dispatch_source_set_event_handler(v10, v16);
      deathNoteQueue = self->_deathNoteQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_2308C820C;
      block[3] = &unk_264B8ED98;
      int v15 = a4;
      block[4] = self;
      int v14 = v10;
      int v12 = v10;
      dispatch_sync(deathNoteQueue, block);
    }
  }
}

- (void)watchOutputFileName:(id)a3 directory:(id)a4 forPid:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    synchronousRedirectionQueue = self->_synchronousRedirectionQueue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_2308C8360;
    v11[3] = &unk_264B8EDC0;
    id v12 = v8;
    v13 = self;
    int v15 = a5;
    id v14 = v9;
    dispatch_async(synchronousRedirectionQueue, v11);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronousRedirectionQueue, 0);
  objc_storeStrong((id *)&self->_deathNoteQueue, 0);
  objc_storeStrong((id *)&self->_activeIODispatchSources, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_pids, 0);
}

@end