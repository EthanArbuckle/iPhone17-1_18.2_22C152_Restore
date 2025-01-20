@interface AGXG17FamilyCommandQueue
- (AGXG17FamilyCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4;
- (BOOL)setGPUPriority:(unint64_t)a3;
- (BOOL)setGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4;
- (id)availableCounters;
- (id)commandBuffer;
- (id)commandBufferWithDescriptor:(id)a3;
- (id)commandBufferWithUnretainedReferences;
- (id)counterInfo;
- (id)getRequestedCounters;
- (id)subdivideCounterList:(id)a3;
- (int)requestCounters:(id)a3;
- (unint64_t)resolveAndUpdateQueuePriority:(unint64_t)a3;
- (void)dealloc;
- (void)setCommandQueueConfig:(unsigned int)a3 crossQueueHazardTracking:(BOOL)a4 disableIOFencing:(BOOL)a5 enableLowLatencySignalSharedEvent:(BOOL)a6 enableLowLatencyWaitSharedEvent:(BOOL)a7 lockParameterBufferSizeToMax:(BOOL)a8;
- (void)setLabel:(id)a3;
@end

@implementation AGXG17FamilyCommandQueue

- (id)subdivideCounterList:(id)a3
{
  return 0;
}

- (id)counterInfo
{
  return 0;
}

- (id)getRequestedCounters
{
  return 0;
}

- (int)requestCounters:(id)a3
{
  return -1;
}

- (id)availableCounters
{
  return 0;
}

- (void)dealloc
{
  if (*(unsigned char *)(*(void *)([(IOGPUMetalCommandQueue *)self device] + 808) + 7813))
  {
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2427AD000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CommandQueueLifetime", "CommandQueue is deallocated!", buf, 2u);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)AGXG17FamilyCommandQueue;
  [(IOGPUMetalCommandQueue *)&v4 dealloc];
}

- (AGXG17FamilyCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AGXG17FamilyCommandQueue;
  id v5 = -[IOGPUMetalCommandQueue initWithDevice:descriptor:](&v11, sel_initWithDevice_descriptor_, a3);
  if (v5)
  {
    uint64_t v6 = [a4 devicePartition];
    if (v6 == 2) {
      unsigned int v7 = 1;
    }
    else {
      unsigned int v7 = -1;
    }
    if (v6 == 1) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v7;
    }
    objc_msgSend(v5, "setCommandQueueConfig:crossQueueHazardTracking:disableIOFencing:enableLowLatencySignalSharedEvent:enableLowLatencyWaitSharedEvent:lockParameterBufferSizeToMax:", v8, objc_msgSend(a4, "disableCrossQueueHazardTracking") ^ 1, objc_msgSend(a4, "disableIOFencing"), objc_msgSend(a4, "enableLowLatencySignalSharedEvent"), objc_msgSend(a4, "enableLowLatencyWaitSharedEvent"), objc_msgSend(a4, "lockParameterBufferSizeToMax"));
    {
      -[AGXG17FamilyCommandQueue initWithDevice:descriptor:]::isInternalInstall = *(unsigned char *)(*(void *)([v5 device] + 808)
                                                                                           + 7761);
    }
    if (-[AGXG17FamilyCommandQueue initWithDevice:descriptor:]::isInternalInstall) {
      [v5 setGPUPriority:1];
    }
    [v5 device];
    if (AGXATelemetry::shouldCaptureTelemetryData(void)::onceToken != -1) {
      dispatch_once(&AGXATelemetry::shouldCaptureTelemetryData(void)::onceToken, &__block_literal_global_6595);
    }
    if (AGXATelemetry::shouldCaptureTelemetryData(void)::shouldCapture)
    {
      unsigned int v9 = atomic_load((unsigned __int16 *)AGXATelemetry::backtracesCaptured);
      if (v9 <= 9)
      {
        *((_DWORD *)v5 + 112) = backtrace((void **)v5 + 57, 64);
        *((unsigned char *)v5 + 968) = 0;
      }
    }
  }
  return (AGXG17FamilyCommandQueue *)v5;
}

- (BOOL)setGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AGXG17FamilyCommandQueue;
  return [(IOGPUMetalCommandQueue *)&v5 setGPUPriority:[(AGXG17FamilyCommandQueue *)self resolveAndUpdateQueuePriority:a3] offset:a4];
}

- (BOOL)setGPUPriority:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AGXG17FamilyCommandQueue;
  return [(IOGPUMetalCommandQueue *)&v4 setGPUPriority:[(AGXG17FamilyCommandQueue *)self resolveAndUpdateQueuePriority:a3]];
}

- (unint64_t)resolveAndUpdateQueuePriority:(unint64_t)a3
{
  {
    v13 = self;
    self = v13;
    if (v6)
    {
      -[AGXG17FamilyCommandQueue resolveAndUpdateQueuePriority:]::isInternalInstall = *(unsigned char *)(*(void *)([(IOGPUMetalCommandQueue *)v13 device] + 808)
                                                                                               + 7761);
      self = v13;
    }
  }
  if (-[AGXG17FamilyCommandQueue resolveAndUpdateQueuePriority:]::isInternalInstall)
  {
    {
      unsigned int v7 = self;
      int v9 = v8;
      self = v7;
      if (v9)
      {
        -[AGXG17FamilyCommandQueue resolveAndUpdateQueuePriority:]::forceGPUPriorityHigh = 0;
        self = v7;
      }
    }
    uint64_t v15 = 0;
    {
      v14 = self;
      v10 = v4;
      objc_super v4 = v10;
      int v12 = v11;
      self = v14;
      if (v12)
      {
        -[AGXG17FamilyCommandQueue resolveAndUpdateQueuePriority:]::forceGPUPriorityEVIsSet = findEnvVarNum<unsigned long long>("AGX_FORCE_GPU_PRIORITY", &v15);
        objc_super v4 = v10;
        self = v14;
      }
    }
    if (*((unsigned char *)v4 + 1552)) {
      a3 = 0;
    }
  }
  HIDWORD(self->_commandQueueBTInfo.callstack[63]) = a3;
  return a3;
}

- (void)setCommandQueueConfig:(unsigned int)a3 crossQueueHazardTracking:(BOOL)a4 disableIOFencing:(BOOL)a5 enableLowLatencySignalSharedEvent:(BOOL)a6 enableLowLatencyWaitSharedEvent:(BOOL)a7 lockParameterBufferSizeToMax:(BOOL)a8
{
  input[2] = *MEMORY[0x263EF8340];
  uint64_t v8 = a3;
  if (a4) {
    uint64_t v8 = a3 | 0x100000000;
  }
  uint64_t v9 = 0x200000000;
  if (!a5) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = 0x400000000;
  if (!a6) {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v9 | v10;
  uint64_t v12 = 0x800000000;
  if (!a7) {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v8 | v11 | v12;
  uint64_t v14 = 0x1000000000;
  if (!a8) {
    uint64_t v14 = 0;
  }
  uint64_t v15 = v13 | v14;
  input[0] = IOGPUCommandQueueGetID();
  input[1] = v15;
  mach_port_t Connect = IOGPUCommandQueueGetConnect();
  IOConnectCallScalarMethod(Connect, 0x108u, input, 2u, 0, 0);
}

- (void)setLabel:(id)a3
{
  uint64_t v5 = objc_msgSend(*(id *)(-[IOGPUMetalCommandQueue device](self, "device") + 856), "indexOfObject:", a3);
  int v6 = 1 << v5;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    int v6 = 0;
  }
  *((_DWORD *)&self->super._resourceGroupsLock + 1) |= v6;
  v7.receiver = self;
  v7.super_class = (Class)AGXG17FamilyCommandQueue;
  [(IOGPUMetalCommandQueue *)&v7 setLabel:a3];
}

- (id)commandBufferWithDescriptor:(id)a3
{
  objc_super v4 = -[AGXG17FamilyCommandBuffer initWithQueue:retainedReferences:]([AGXG17FamilyCommandBuffer alloc], "initWithQueue:retainedReferences:", self, [a3 retainedReferences]);
  -[_MTLCommandBuffer setErrorOptions:](v4, "setErrorOptions:", [a3 errorOptions]);
  uint64_t v5 = (_DWORD *)[a3 deadlineProfile];
  if (v5)
  {
    int v6 = v5[8];
    objc_super v7 = v5;
    *(Class *)((char *)&v4->super.super.super.super.isa + (int)*MEMORY[0x263F12B28]) = v7;
    *((_DWORD *)v4->_impl + 134) = v6;
  }
  v4->_captureProgramAddressTable = [a3 captureProgramAddressTable];
  v4->_cloneIntersectionFunctionTablesPerDispatch = [a3 cloneIntersectionFunctionTablesPerDispatch];
  impl = v4->_impl;
  impl[568] = [a3 disableFineGrainedComputePreemption];
  [(_MTLCommandBuffer *)v4 configWithCommandBufferDescriptor:a3];
  return v4;
}

- (id)commandBufferWithUnretainedReferences
{
  v2 = [[AGXG17FamilyCommandBuffer alloc] initWithQueue:self retainedReferences:0];

  return v2;
}

- (id)commandBuffer
{
  v2 = [[AGXG17FamilyCommandBuffer alloc] initWithQueue:self retainedReferences:1];

  return v2;
}

@end