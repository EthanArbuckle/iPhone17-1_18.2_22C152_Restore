@interface BSMIGServer
- (BSMIGServer)init;
- (BSMIGServer)initWithPortName:(id)a3 subsystem:(mig_subsystem *)a4 separateThread:(BOOL)a5;
- (NSString)threadName;
- (int)threadPriority;
- (uint64_t)_start;
- (void)setThreadPriority:(int)a3;
@end

@implementation BSMIGServer

- (BSMIGServer)initWithPortName:(id)a3 subsystem:(mig_subsystem *)a4 separateThread:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BSMIGServer;
  v9 = [(BSMIGServer *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    portName = v9->_portName;
    v9->_portName = (NSString *)v10;

    v9->_subsystem = a4;
    if (v5)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __57__BSMIGServer_initWithPortName_subsystem_separateThread___block_invoke;
      v13[3] = &unk_1E5446588;
      v14 = v9;
      BSPthreadCreate(v13);
    }
    else
    {
      v9->_thread = pthread_self();
      -[BSMIGServer _start]((uint64_t)v9);
    }
  }

  return v9;
}

void __57__BSMIGServer_initWithPortName_subsystem_separateThread___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    *(void *)(*(void *)(a1 + 32) + 24) = a2;
    uint64_t v2 = *(void *)(a1 + 32);
    -[BSMIGServer _start](v2);
  }
  else
  {
    v3 = BSLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      BOOL v5 = "-[BSMIGServer initWithPortName:subsystem:separateThread:]_block_invoke";
      _os_log_error_impl(&dword_18AAA8000, v3, OS_LOG_TYPE_ERROR, "%s ERROR: unable to create new pthread", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (uint64_t)_start
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    id v2 = *(id *)(result + 8);
    BSPthreadSetName(*(void *)(v1 + 24), v2);

    id v3 = *(id *)(v1 + 8);
    mach_port_name_t name = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
    memset(context, 0, sizeof(context));
    [v3 getCString:context maxLength:128 encoding:1];
    int v4 = bootstrap_check_in2();
    BOOL v5 = (ipc_space_t *)MEMORY[0x1E4F14960];
    if (v4)
    {
      mach_error_t inserted = mach_port_allocate(*MEMORY[0x1E4F14960], 1u, &name);
      if (inserted
        || (mach_error_t inserted = mach_port_insert_right(*v5, name, name, 0x14u)) != 0
        || (mach_error_t inserted = bootstrap_register2(), mach_port_deallocate(*v5, name), inserted))
      {
        mach_port_mod_refs(*v5, name, 1u, -1);
        v17 = 0;
        v11 = mach_error_string(inserted);
        asprintf(&v17, "Couldn't register %s with the bootstrap server. Error: %s (%d).\nThis generally means that another instance of this process was already running or is hung in the debugger.", context, v11, inserted);
        v12 = BSLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[BSMIGServer _createPortNamed:]";
          __int16 v21 = 2082;
          v22 = v17;
          _os_log_error_impl(&dword_18AAA8000, v12, OS_LOG_TYPE_ERROR, "%s %{public}s", buf, 0x16u);
        }

        abort();
      }
    }
    uint64_t v7 = name;

    *(_DWORD *)(v1 + 16) = v7;
    *(_DWORD *)buf = 16;
    MEMORY[0x18C1251A0](*v5, v7, 1, buf, 1);
    id v8 = BSCreateMIGServerSourceWithContext(*(void *)(v1 + 32), *(_DWORD *)(v1 + 16), 0, 0);
    Current = CFRunLoopGetCurrent();
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D410];
    CFRunLoopAddSource(Current, v8, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(v8);
    result = pthread_main_np();
    if (!result)
    {
      if (!_CFRunLoopSetPerCalloutAutoreleasepoolEnabled())
      {
        v13 = CFRunLoopGetCurrent();
        v14 = *(__CFRunLoopObserver **)(v1 + 40);
        if (!v14)
        {
          CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, 0);
          *(void *)context = 0;
          *(void *)&context[8] = Mutable;
          *(void *)&context[16] = MEMORY[0x1E4F1C280];
          *(void *)&context[24] = MEMORY[0x1E4F1C278];
          *(void *)&context[32] = MEMORY[0x1E4F1C220];
          *(void *)(v1 + 40) = CFRunLoopObserverCreate(0, 1uLL, 1u, -2147483647, (CFRunLoopObserverCallBack)_wrapRunLoopWithAutoreleasePoolHandler, (CFRunLoopObserverContext *)context);
          *(void *)(v1 + 48) = CFRunLoopObserverCreate(0, 0xA0uLL, 1u, 0x7FFFFFFFLL, (CFRunLoopObserverCallBack)_wrapRunLoopWithAutoreleasePoolHandler, (CFRunLoopObserverContext *)context);
          CFRunLoopAddObserver(v13, *(CFRunLoopObserverRef *)(v1 + 40), v10);
          CFRunLoopAddObserver(v13, *(CFRunLoopObserverRef *)(v1 + 48), v10);
          CFRelease(Mutable);
          v14 = *(__CFRunLoopObserver **)(v1 + 40);
        }
        CFStringRef v16 = (const __CFString *)*MEMORY[0x1E4F1D418];
        if (!CFRunLoopContainsObserver(v13, v14, (CFRunLoopMode)*MEMORY[0x1E4F1D418]))
        {
          CFRunLoopAddObserver(v13, *(CFRunLoopObserverRef *)(v1 + 40), v16);
          CFRunLoopAddObserver(v13, *(CFRunLoopObserverRef *)(v1 + 48), v16);
        }
      }
      while (1)
        CFRunLoopRun();
    }
  }
  return result;
}

- (BSMIGServer)init
{
  int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BSMIGServer.m" lineNumber:83 description:@"wrong initializer"];

  return 0;
}

- (int)threadPriority
{
  thread = self->_thread;
  sched_param v5 = 0;
  int v4 = 0;
  pthread_getschedparam(thread, &v4, &v5);
  return v5.sched_priority;
}

- (void)setThreadPriority:(int)a3
{
  if (!pthread_main_np())
  {
    thread = self->_thread;
    BSPthreadSetFixedPriority(thread, a3);
  }
}

- (NSString)threadName
{
  id v2 = BSPthreadGetName(self->_thread);
  id v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (void).cxx_destruct
{
}

@end