@interface IOGPUMetalCommandQueue
- (BOOL)_setGPUPriority:(unint64_t)a3 backgroundPriority:(unint64_t)a4;
- (BOOL)setBackgroundGPUPriority:(unint64_t)a3;
- (BOOL)setBackgroundGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4;
- (BOOL)setGPUPriority:(unint64_t)a3;
- (BOOL)setGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4;
- (IOGPUMetalCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4;
- (MTLDevice)device;
- (unint64_t)getBackgroundGPUPriority;
- (unint64_t)getGPUPriority;
- (void)_submitCommandBuffers:(id *)a3 count:(unint64_t)a4;
- (void)addInternalResidencySet:(id)a3;
- (void)addInternalResidencySets:(id *)a3 count:(unint64_t)a4;
- (void)addResidencySet:(id)a3;
- (void)addResidencySets:(id *)a3 count:(unint64_t)a4;
- (void)dealloc;
- (void)dispatchAvailableCompletionNotifications;
- (void)removeInternalResidencySet:(id)a3;
- (void)removeInternalResidencySets:(id *)a3 count:(unint64_t)a4;
- (void)removeResidencySet:(id)a3;
- (void)removeResidencySets:(id *)a3 count:(unint64_t)a4;
- (void)setCompletionQueue:(id)a3;
- (void)setLabel:(id)a3;
- (void)submitCommandBuffers:(id *)a3 count:(unint64_t)a4;
@end

@implementation IOGPUMetalCommandQueue

- (MTLDevice)device
{
  return self->_device;
}

- (void)submitCommandBuffers:(id *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v7 = 0;
    unint64_t v8 = a4;
    do
    {
      unint64_t v9 = v8 - 32;
      if (v8 >= 0x20) {
        uint64_t v10 = 32;
      }
      else {
        uint64_t v10 = v8;
      }
      [(IOGPUMetalCommandQueue *)self _submitCommandBuffers:a3 count:v10];
      v7 += 32;
      a3 += 32;
      unint64_t v8 = v9;
    }
    while (v7 < a4);
  }
}

- (void)_submitCommandBuffers:(id *)a3 count:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(MTLDevice *)self->_device cmdBufArgsSize];
  if (HIDWORD(a4)) {
    -[IOGPUMetalCommandQueue _submitCommandBuffers:count:]();
  }
  uintptr_t v8 = v7;
  MEMORY[0x270FA5388](v7, v7 * a4);
  v22 = (char *)&v21 - v9;
  bzero((char *)&v21 - v9, v10);
  if (a4)
  {
    v11 = v22;
    unint64_t v12 = a4;
    do
    {
      id v13 = *a3;
      [*a3 fillCommandBufferArgs:v11 commandQueue:self];
      if ([v13 isProfilingEnabled]) {
        [v13 kernelSubmitTime];
      }
      if (*(_DWORD *)__globalGPUCommPage)
      {
        objc_msgSend((id)objc_msgSend(v13, "commandQueue"), "backgroundTrackingPID");
        objc_msgSend((id)objc_msgSend(v13, "device"), "globalTraceObjectID");
        objc_msgSend((id)objc_msgSend(v13, "commandQueue"), "globalTraceObjectID");
        [v13 globalTraceObjectID];
        IOGPUDeviceTraceEvent();
      }
      v11 += v8;
      ++a3;
      --v12;
    }
    while (v12);
  }
  int v14 = IOGPUCommandQueueSubmitCommandBuffers((uint64_t)self->_commandQueue, 0, a4, v22, v8);
  if (v14)
  {
    if (v14 == 268435459) {
      int v15 = 15;
    }
    else {
      int v15 = 1;
    }
    if (v14 == -536870174) {
      int v16 = 7;
    }
    else {
      int v16 = v15;
    }
    if (a4)
    {
      uint64_t v17 = (int)*MEMORY[0x263F12B90];
      uint64_t v18 = MEMORY[0x263EF8330];
      v19 = (long long *)(v22 + 16);
      do
      {
        v20 = *(NSObject **)((char *)&self->super.super.super.isa + v17);
        block[0] = v18;
        block[1] = 3221225472;
        block[2] = __54__IOGPUMetalCommandQueue__submitCommandBuffers_count___block_invoke;
        block[3] = &unk_26441A528;
        long long v24 = *v19;
        int v25 = v16;
        dispatch_async(v20, block);
        v19 = (long long *)((char *)v19 + v8);
        --a4;
      }
      while (a4);
    }
  }
}

- (BOOL)setGPUPriority:(unint64_t)a3
{
  validateGPUPriority(a3, 0);
  unint64_t backgroundPriority = self->_backgroundPriority;
  return [(IOGPUMetalCommandQueue *)self _setGPUPriority:a3 backgroundPriority:backgroundPriority];
}

- (BOOL)_setGPUPriority:(unint64_t)a3 backgroundPriority:(unint64_t)a4
{
  inputStruct[0] = a3;
  inputStruct[1] = a4;
  inputStruct[2] = 0;
  unsigned int v8 = 3;
  int v6 = IOGPUCommandQueueSetPriorityAndBackground((uint64_t)self->_commandQueue, inputStruct, &v8);
  if (!v6)
  {
    self->_priority = v8;
    self->_unint64_t backgroundPriority = a4;
  }
  return v6 == 0;
}

- (IOGPUMetalCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4
{
  v27[2] = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)IOGPUMetalCommandQueue;
  int v6 = -[_MTLCommandQueue initWithDevice:descriptor:](&v23, sel_initWithDevice_descriptor_);
  if (v6)
  {
    *((void *)v6 + 49) = a3;
    uint64_t v7 = (mach_port_t *)[a3 deviceRef];
    unsigned int v8 = IOGPUCommandQueueCreateWithQoS(v7, *(_DWORD *)&v6[*MEMORY[0x263F12BB8]], v6[*MEMORY[0x263F12BB0]]);
    *((void *)v6 + 48) = v8;
    if (v8)
    {
      *((_DWORD *)v6 + 110) = 0;
      char v9 = [a4 disableAsyncCompletionDispatch];
      v6[400] = v9;
      if ((v9 & 1) == 0)
      {
        size_t v10 = *(NSObject **)&v6[*MEMORY[0x263F12B98]];
        if (!v10) {
          -[IOGPUMetalCommandQueue initWithDevice:descriptor:]();
        }
        IOGPUCommandQueueSetDispatchQueue(*((void *)v6 + 48), v10);
      }
      *((void *)v6 + 51) = 1;
      *((void *)v6 + 52) = 3;
      *(void *)&v6[*MEMORY[0x263F12BA0]] = IOGPUCommandQueueGetGlobalTraceObjectID(*((void *)v6 + 48));
    }
    else
    {
      v11 = (void *)MEMORY[0x21D4AEE90]();
      id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
      io_iterator_t iterator = 0;
      if (!MEMORY[0x21D4AE640]([a3 acceleratorPort], "IOService", 0, &iterator))
      {
        uint64_t v21 = v11;
        io_object_t v13 = IOIteratorNext(iterator);
        if (v13)
        {
          io_registry_entry_t v14 = v13;
          do
          {
            int v15 = (void *)MEMORY[0x21D4AEE90]();
            CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v14, @"CommandQueueCount", 0, 0);
            if (CFProperty)
            {
              uint64_t v17 = (void *)CFProperty;
              CFTypeRef v18 = IORegistryEntryCreateCFProperty(v14, @"IOUserClientCreator", 0, 0);
              if (v18)
              {
                v19 = (void *)v18;
                v26[0] = @"Count";
                v26[1] = @"Process";
                v27[0] = v17;
                v27[1] = v18;
                objc_msgSend(v12, "addObject:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));
              }
            }
            IOObjectRelease(v14);
            io_registry_entry_t v14 = IOIteratorNext(iterator);
          }
          while (v14);
        }
        IOObjectRelease(iterator);
      }
      objc_msgSend(v12, "sortUsingComparator:", &__block_literal_global, v21);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v12;
        _os_log_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Command queue creation failed.  Worst processes %@", buf, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        -[IOGPUMetalCommandQueue initWithDevice:descriptor:]((uint64_t)v12);
      }

      return 0;
    }
  }
  return (IOGPUMetalCommandQueue *)v6;
}

- (void)dealloc
{
  resourceGroups = self->_resourceGroups;

  IOGPUCommandQueueRelease(self->_commandQueue);
  v4.receiver = self;
  v4.super_class = (Class)IOGPUMetalCommandQueue;
  [(_MTLCommandQueue *)&v4 dealloc];
}

- (void)setCompletionQueue:(id)a3
{
  if (!a3) {
    -[IOGPUMetalCommandQueue setCompletionQueue:]();
  }
  uint64_t v5 = (int)*MEMORY[0x263F12B98];
  int v6 = *(NSObject **)((char *)&self->super.super.super.isa + v5);
  if (v6) {
    dispatch_release(v6);
  }
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)a3;
  dispatch_retain((dispatch_object_t)a3);
  commandQueue = self->_commandQueue;
  unsigned int v8 = *(NSObject **)((char *)&self->super.super.super.isa + v5);
  IOGPUCommandQueueSetDispatchQueue((uint64_t)commandQueue, v8);
}

- (unint64_t)getGPUPriority
{
  return self->_priority;
}

- (unint64_t)getBackgroundGPUPriority
{
  return self->_backgroundPriority;
}

- (BOOL)setBackgroundGPUPriority:(unint64_t)a3
{
  if (a3 >= 6) {
    MTLReportFailure();
  }
  unint64_t priority = self->_priority;
  return [(IOGPUMetalCommandQueue *)self _setGPUPriority:priority backgroundPriority:a3];
}

- (void)setLabel:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalCommandQueue;
  -[_MTLCommandQueue setLabel:](&v9, sel_setLabel_);
  if (*(_DWORD *)__globalGPUCommPage)
  {
    uint64_t v5 = [(MTLDevice *)self->_device deviceRef];
    uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12BA0]);
    uint64_t v7 = (int)*MEMORY[0x263F12BA8];
    uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
    [a3 cStringUsingEncoding:1];
    *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)IOGPUDeviceTraceObjectLabel(v5, 8, 0, v6, v8);
  }
}

uint64_t __52__IOGPUMetalCommandQueue_initWithDevice_descriptor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"Count"), "intValue");
  return (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"Count"), "intValue") - (uint64_t)v4;
}

- (BOOL)setGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  validateGPUPriority(a3, 0);
  unint64_t backgroundPriority = self->_backgroundPriority;
  return [(IOGPUMetalCommandQueue *)self _setGPUPriority:a3 backgroundPriority:backgroundPriority];
}

- (BOOL)setBackgroundGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  if (a3 >= 6) {
    MTLReportFailure();
  }
  unint64_t priority = self->_priority;
  return [(IOGPUMetalCommandQueue *)self _setGPUPriority:priority backgroundPriority:a3];
}

void __54__IOGPUMetalCommandQueue__submitCommandBuffers_count___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  v2 = *(const void **)(a1 + 40);
  _Block_release(v2);
}

- (void)dispatchAvailableCompletionNotifications
{
  IOGPUCommandQueueDispatchAvailableCompletionNotifications((uint64_t)self->_commandQueue);
  -[IOGPUMetalDevice cancelPeriodicUpdateResourcePoolPurgeability]((uint64_t)self->_device);
  device = self->_device;
  -[IOGPUMetalDevice updateResourcePoolPurgeability]((uint64_t)device);
}

- (void)addResidencySet:(id)a3
{
  id v3 = a3;
  _addResidencySets((os_unfair_lock_s *)self, &v3, 1, 0);
}

- (void)addResidencySets:(id *)a3 count:(unint64_t)a4
{
}

- (void)addInternalResidencySet:(id)a3
{
  id v3 = a3;
  _addResidencySets((os_unfair_lock_s *)self, &v3, 1, 1);
}

- (void)addInternalResidencySets:(id *)a3 count:(unint64_t)a4
{
}

- (void)removeResidencySet:(id)a3
{
  id v3 = a3;
  _removeResidencySets((os_unfair_lock_s *)self, &v3, 1, 0);
}

- (void)removeResidencySets:(id *)a3 count:(unint64_t)a4
{
}

- (void)removeInternalResidencySet:(id)a3
{
  id v3 = a3;
  _removeResidencySets((os_unfair_lock_s *)self, &v3, 1, 1);
}

- (void)removeInternalResidencySets:(id *)a3 count:(unint64_t)a4
{
}

- (void)initWithDevice:(uint64_t)a1 descriptor:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Command queue creation failed.  Worst processes %@", (uint8_t *)&v1, 0xCu);
}

- (void)initWithDevice:descriptor:.cold.2()
{
}

- (void)setCompletionQueue:.cold.1()
{
}

- (void)_submitCommandBuffers:count:.cold.1()
{
  __assert_rtn("-[IOGPUMetalCommandQueue _submitCommandBuffers:count:]", "IOGPUMetalCommandQueue.m", 266, "count <= UINT_MAX");
}

@end