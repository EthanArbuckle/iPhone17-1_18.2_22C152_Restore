@interface IOGPUMetalCommandBuffer
- (IOGPUMetalCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4;
- (IOGPUMetalCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4 synchronousDebugMode:(BOOL)a5;
- (IOGPUMetalCommandBufferResourceInfo)commandBufferResourceInfo;
- (IOGPUMetalCommandBufferStorage)commandBufferStorage;
- (IOGPUResourceList)ioGPUResourceList;
- (IOGPUSegmentListHeader)getSegmentListHeader;
- (MTLDevice)device;
- (id)akPrivateResourceList;
- (id)akResourceList;
- (unint64_t)gpuFaultAddress;
- (unint64_t)protectionOptions;
- (void)_debugBytes:(const char *)a3 length:(unint64_t)a4 output_type:(unsigned int)a5;
- (void)_encodePurgedResources;
- (void)_reserveKernelCommandBufferSpace:(unint64_t)a3;
- (void)addPurgedHeap:(id)a3;
- (void)addPurgedResource:(id)a3;
- (void)allocCommandBufferResourceAtIndex:(unsigned int)a3;
- (void)allocDebugBuffer;
- (void)allocateSidebandBuffer:(unsigned int)a3;
- (void)beginSegment:(void *)a3;
- (void)commit;
- (void)commitAndReset;
- (void)dealloc;
- (void)didCompleteWithStartTime:(unint64_t)a3 endTime:(unint64_t)a4 error:(id)a5;
- (void)encodeConditionalAbortEvent:(id)a3;
- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4;
- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4 agentMask:(unint64_t)a5;
- (void)encodeSignalEventScheduled:(id)a3 value:(unint64_t)a4;
- (void)encodeSubmitSleepMS:(unsigned int)a3;
- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4;
- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4 timeout:(unsigned int)a5;
- (void)endCurrentSegment;
- (void)fillCommandBufferArgs:(IOGPUCommandQueueCommandBufferArgs *)a3 commandQueue:(id)a4;
- (void)getCurrentKernelCommandBufferPointer:(void *)a3 end:(void *)a4;
- (void)getCurrentKernelCommandBufferStart:(void *)a3 current:(void *)a4 end:(void *)a5;
- (void)getDebugBufferPointerStart:(void *)a3 end:(void *)a4;
- (void)getSegmentListPointerStart:(void *)a3 current:(void *)a4 end:(void *)a5;
- (void)growDebugBuffer:(unsigned int)a3;
- (void)growKernelCommandBuffer:(unint64_t)a3;
- (void)growSegmentList;
- (void)growSidebandBuffer:(unsigned int)a3;
- (void)kernelCommandCollectTimeStamp;
- (void)kprintfBytes:(const char *)a3 length:(unint64_t)a4;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)setCurrentCommandEncoder:(id)a3;
- (void)setCurrentKernelCommandBufferPointer:(void *)a3;
- (void)setCurrentSegmentListPointer:(void *)a3;
- (void)setLabel:(id)a3;
- (void)setProtectionOptions:(unint64_t)a3;
- (void)setResponsibleTaskIDs:(const unsigned int *)a3 count:(unsigned int)a4;
- (void)useInternalResidencySet:(id)a3;
- (void)useInternalResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)validate;
@end

@implementation IOGPUMetalCommandBuffer

- (IOGPUMetalCommandBufferStorage)commandBufferStorage
{
  return self->_storage;
}

- (unint64_t)protectionOptions
{
  return self->_protectionOptions;
}

- (IOGPUMetalCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4
{
  return [(IOGPUMetalCommandBuffer *)self initWithQueue:a3 retainedReferences:a4 synchronousDebugMode:0];
}

- (void)setLabel:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalCommandBuffer;
  -[_MTLObjectWithLabel setLabel:](&v9, sel_setLabel_);
  if (*(_DWORD *)__globalGPUCommPage)
  {
    uint64_t v5 = [(MTLDevice *)self->_device deviceRef];
    uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B30]);
    uint64_t v7 = (int)*MEMORY[0x263F12B38];
    uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
    [a3 cStringUsingEncoding:1];
    *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)IOGPUDeviceTraceObjectLabel(v5, 8, 0, v6, v8);
  }
}

- (void)setCurrentCommandEncoder:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B60]) >= (Class)2)
  {
    MTLReleaseAssertionFailure();
    IOGPUDeviceTraceEvent();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)IOGPUMetalCommandBuffer;
    -[_MTLCommandBuffer setCurrentCommandEncoder:](&v6, sel_setCurrentCommandEncoder_);
    if (*(_DWORD *)__globalGPUCommPage)
    {
      [a3 globalTraceObjectID];
      getpid();
      IOGPUDeviceTraceEvent();
    }
    storage = self->_storage;
    if (storage) {
      storage->var26 = (IOGPUSegmentKernelCommmandListHeader *)a3;
    }
  }
}

- (void)commit
{
  if (*((unsigned char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B50]))
  {
    v4.receiver = self;
    v4.super_class = (Class)IOGPUMetalCommandBuffer;
    [(_MTLCommandBuffer *)&v4 bindLogState];
  }
  if ([(_MTLCommandBuffer *)self isProfilingEnabled]) {
    [(IOGPUMetalCommandBuffer *)self kernelCommandCollectTimeStamp];
  }
  if (self->_purgedResources) {
    [(IOGPUMetalCommandBuffer *)self _encodePurgedResources];
  }
  IOGPUMetalCommandBufferStorageFinalizeShmemHeader((uint64_t)self->_storage);
  if (*(_DWORD *)__globalGPUCommPage) {
    IOGPUDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalCommandBuffer;
  [(_MTLCommandBuffer *)&v3 commit];
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)validate
{
  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B60]) >= (Class)2) {
    MTLReportFailure();
  }
  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B20]))
  {
    MTLReportFailure();
  }
}

- (void)setResponsibleTaskIDs:(const unsigned int *)a3 count:(unsigned int)a4
{
  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  [(IOGPUMetalCommandBuffer *)self commitEncoder];
  if (a3) {
    uint64_t v7 = a4;
  }
  else {
    uint64_t v7 = 0;
  }
  int v8 = (4 * v7 + 15) & 0xFFFFFFFC;
  objc_super v9 = [(IOGPUMetalCommandBuffer *)self _reserveKernelCommandBufferSpace:(4 * v7 + 15) & 0x7FFFFFFFCLL];
  int v10 = (int)v9;
  *objc_super v9 = 14;
  v9[1] = v8;
  v9[2] = v7;
  if (v7)
  {
    v11 = v9 + 3;
    do
    {
      int v12 = *a3++;
      *v11++ = v12;
      --v7;
    }
    while (v7);
  }
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v9);
  storage = self->_storage;
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)storage, v10 + v8);
}

- (void)dealloc
{
  iogpumetal_atomic_add((atomic_uint *)self->_device + 181, 0xFFFFFFFF);
  storage = self->_storage;
  if (storage)
  {
    uint64_t var0 = (uint64_t)storage->var0;
    IOGPUMetalCommandBufferStorageDealloc(storage);
    if (!(*(unsigned char **)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B48]))[400]) {
      -[IOGPUMetalDevice kickCleanupQueue](var0);
    }
  }
  commitAndResetSem = self->_commitAndResetSem;
  if (commitAndResetSem) {
    dispatch_release(commitAndResetSem);
  }

  self->_device = 0;
  self->_purgedResources = 0;
  v6.receiver = self;
  v6.super_class = (Class)IOGPUMetalCommandBuffer;
  [(_MTLCommandBuffer *)&v6 dealloc];
}

- (IOGPUMetalCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4 synchronousDebugMode:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[IOGPUMetalCommandBuffer initWithQueue:retainedReferences:synchronousDebugMode:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)IOGPUMetalCommandBuffer;
  objc_super v9 = [(_MTLCommandBuffer *)&v14 initWithQueue:a3 retainedReferences:v6 synchronousDebugMode:v5];
  if (v9)
  {
    int v10 = (atomic_uint *)*((id *)a3 + 49);
    v9->_device = (MTLDevice *)v10;
    iogpumetal_atomic_add(v10 + 181, 1u);
    uint64_t NextGlobalTraceID = IOGPUDeviceGetNextGlobalTraceID([(MTLDevice *)v9->_device deviceRef]);
    *(Class *)((char *)&v9->super.super.super.isa + (int)*MEMORY[0x263F12B30]) = (Class)NextGlobalTraceID;
    Storage = (IOGPUMetalCommandBufferStorage *)IOGPUMetalCommandBufferStoragePoolCreateStorage(*((void *)v9->_device + 85), NextGlobalTraceID, v6);
    v9->_storage = Storage;
    if (Storage)
    {
      if (v5) {
        v9->_commitAndResetSem = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
      }
      if (*(_DWORD *)__globalGPUCommPage) {
        IOGPUDeviceTraceEvent();
      }
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (void)_reserveKernelCommandBufferSpace:(unint64_t)a3
{
  storage = self->_storage;
  result = storage->var5;
  var6 = storage->var6;
  int v8 = result;
  if (var6 - (unsigned char *)result < a3)
  {
    [(IOGPUMetalCommandBuffer *)self growKernelCommandBuffer:a3];
    [(IOGPUMetalCommandBuffer *)self getCurrentKernelCommandBufferPointer:&v8 end:&var6];
    result = v8;
    if (var6 - (unsigned char *)v8 < a3) {
      -[IOGPUMetalCommandBuffer _reserveKernelCommandBufferSpace:]();
    }
    storage = self->_storage;
  }
  storage->var5 = (char *)result + a3;
  return result;
}

void __62__IOGPUMetalCommandBuffer_fillCommandBufferArgs_commandQueue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (*(_DWORD *)__globalGPUCommPage)
  {
    [*(id *)(a1 + 32) globalTraceObjectID];
    IOGPUDeviceTraceEvent();
  }
  if (a4)
  {
    id v9 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithIOGPUError:a4];
    [*(id *)(a1 + 32) didScheduleWithStartTime:a2 endTime:a3 error:v9];
  }
  else
  {
    int v8 = *(void **)(a1 + 32);
    [v8 didScheduleWithStartTime:a2 endTime:a3 error:0];
  }
}

void __62__IOGPUMetalCommandBuffer_fillCommandBufferArgs_commandQueue___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  if (*(_DWORD *)__globalGPUCommPage)
  {
    [*(id *)(a1 + 32) globalTraceObjectID];
    IOGPUDeviceTraceEvent();
  }
  if (a4)
  {
    id v12 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithIOGPUError:a4];
    *(void *)(*(void *)(a1 + 32) + 640) = a5;
    [*(id *)(a1 + 40) commandBufferDidComplete:*(void *)(a1 + 32) startTime:a2 completionTime:a3 error:v12];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v10 = *(void **)(a1 + 40);
    [v10 commandBufferDidComplete:v11 startTime:a2 completionTime:a3 error:0];
  }
}

- (void)didCompleteWithStartTime:(unint64_t)a3 endTime:(unint64_t)a4 error:(id)a5
{
  if (*((unsigned char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B18]))
  {
    MTLReleaseAssertionFailure();
    goto LABEL_9;
  }
  if (*((unsigned char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B40])) {
    *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B68]) = (Class)(*self->_submitToHardwareTimeStampPointer
  }
                                                                                         * *(unsigned int *)algn_26AA49254
                                                                                         / _iogpuTimebaseInfo);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
LABEL_9:
  }
    -[IOGPUMetalCommandBuffer didCompleteWithStartTime:endTime:error:]();
  v11.receiver = self;
  v11.super_class = (Class)IOGPUMetalCommandBuffer;
  [(_MTLCommandBuffer *)&v11 didCompleteWithStartTime:a3 endTime:a4 error:a5];
  storage = self->_storage;
  uint64_t var0 = (uint64_t)storage->var0;
  IOGPUMetalCommandBufferStorageDealloc(storage);
  if (!(*(unsigned char **)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B48]))[400]) {
    -[IOGPUMetalDevice kickCleanupQueue](var0);
  }
  self->_storage = 0;
}

- (void)setProtectionOptions:(unint64_t)a3
{
  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  if (self->_protectionOptions != a3)
  {
    [(IOGPUMetalCommandBuffer *)self commitEncoder];
    self->_protectionOptions = a3;
    BOOL v5 = [(IOGPUMetalCommandBuffer *)self _reserveKernelCommandBufferSpace:16];
    int v6 = (int)v5;
    *BOOL v5 = 0x1000000009;
    v5[1] = a3;
    IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v5);
    storage = self->_storage;
    IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)storage, v6 + 16);
  }
}

- (void)fillCommandBufferArgs:(IOGPUCommandQueueCommandBufferArgs *)a3 commandQueue:(id)a4
{
  storage = self->_storage;
  a3->uint64_t var0 = *((_DWORD *)storage->var3 + 32);
  a3->var1 = *((_DWORD *)storage->var8 + 32);
  uint64_t var0 = storage->var7.var0;
  if (var0) {
    LODWORD(var0) = var0[32];
  }
  a3->var2 = var0;
  id v9 = storage->var38[1];
  if (v9) {
    LODWORD(v9) = v9[32];
  }
  a3->var5 = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__IOGPUMetalCommandBuffer_fillCommandBufferArgs_commandQueue___block_invoke;
  aBlock[3] = &unk_26441A490;
  aBlock[4] = self;
  int v10 = _Block_copy(aBlock);
  a3->var3.var1 = (unint64_t)v10;
  self->_scheduledCallbackBlockPtr = v10;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__IOGPUMetalCommandBuffer_fillCommandBufferArgs_commandQueue___block_invoke_2;
  v12[3] = &unk_26441A4B8;
  v12[4] = self;
  v12[5] = a4;
  objc_super v11 = _Block_copy(v12);
  a3->var4.var1 = (unint64_t)v11;
  self->_completedCallbackBlockPtr = v11;
}

- (void)popDebugGroup
{
  if (*(_DWORD *)__globalGPUCommPage)
  {
    [(MTLDevice *)self->_device deviceRef];
    [(_MTLCommandBuffer *)self globalTraceObjectID];
    IOGPUDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalCommandBuffer;
  [(_MTLCommandBuffer *)&v3 popDebugGroup];
}

- (void)pushDebugGroup:(id)a3
{
  if (*(_DWORD *)__globalGPUCommPage)
  {
    uint64_t v5 = [(MTLDevice *)self->_device deviceRef];
    uint64_t v6 = [(_MTLCommandBuffer *)self globalTraceObjectID];
    [a3 cStringUsingEncoding:1];
    IOGPUDeviceTraceObjectLabel(v5, 48, 5, v6, 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)IOGPUMetalCommandBuffer;
  [(_MTLCommandBuffer *)&v7 pushDebugGroup:a3];
}

- (void)getCurrentKernelCommandBufferStart:(void *)a3 current:(void *)a4 end:(void *)a5
{
  storage = self->_storage;
  if (a3) {
    *a3 = storage->var4;
  }
  if (a4) {
    *a4 = storage->var5;
  }
  if (a5) {
    *a5 = storage->var6;
  }
}

- (void)getCurrentKernelCommandBufferPointer:(void *)a3 end:(void *)a4
{
  storage = self->_storage;
  if (a3) {
    *a3 = storage->var5;
  }
  if (a4) {
    *a4 = storage->var6;
  }
}

- (void)setCurrentKernelCommandBufferPointer:(void *)a3
{
  self->_storage->var5 = (char *)a3;
}

- (void)growKernelCommandBuffer:(unint64_t)a3
{
}

- (void)allocCommandBufferResourceAtIndex:(unsigned int)a3
{
}

- (IOGPUResourceList)ioGPUResourceList
{
  return &self->_storage->var14;
}

- (IOGPUSegmentListHeader)getSegmentListHeader
{
  return self->_storage->var11;
}

- (void)getSegmentListPointerStart:(void *)a3 current:(void *)a4 end:(void *)a5
{
}

- (IOGPUMetalCommandBufferResourceInfo)commandBufferResourceInfo
{
  return (IOGPUMetalCommandBufferResourceInfo *)self->_storage->var25;
}

- (void)setCurrentSegmentListPointer:(void *)a3
{
  storage = self->_storage;
  storage->var12 = (IOGPUSegmentResourceListHeader *)a3;
  storage->var13 = (IOGPUSegmentResourceDescriptorGroup *)((char *)a3 + 32);
}

- (void)growSegmentList
{
}

- (void)beginSegment:(void *)a3
{
}

- (void)endCurrentSegment
{
}

- (void)commitAndReset
{
}

- (id)akResourceList
{
  return self->_storage->var20;
}

- (id)akPrivateResourceList
{
  return self->_storage->var21;
}

- (void)kernelCommandCollectTimeStamp
{
  storage = self->_storage;
  var5 = storage->var5;
  if ((char *)(storage->var6 - var5) <= (char *)0xF)
  {
    IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer(storage, 16);
    storage = self->_storage;
    var5 = storage->var5;
  }
  IOGPUMetalCommandBufferStorageBeginSegment((uint64_t)storage, (int)var5);
  *(void *)var5 = 0x1000000001;
  self->_submitToHardwareTimeStampPointer = (unint64_t *)(var5 + 8);
  self->_storage->var5 = var5 + 16;
  uint64_t v5 = self->_storage;
  IOGPUMetalCommandBufferStorageEndSegment((uint64_t)v5);
}

- (void)_debugBytes:(const char *)a3 length:(unint64_t)a4 output_type:(unsigned int)a5
{
  int v9 = (a4 + 19) & 0xFFFFFFFC;
  int v10 = [(IOGPUMetalCommandBuffer *)self _reserveKernelCommandBufferSpace:(a4 + 19) & 0xFFFFFFFFFFFFFFFCLL];
  int v11 = (int)v10;
  *int v10 = 0;
  v10[1] = v9;
  v10[2] = a5;
  v10[3] = a4;
  memcpy(v10 + 4, a3, a4);
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, v11);
  storage = self->_storage;
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)storage, v11 + v9);
}

- (void)kprintfBytes:(const char *)a3 length:(unint64_t)a4
{
  [(IOGPUMetalCommandBuffer *)self commitEncoder];
  [(IOGPUMetalCommandBuffer *)self _debugBytes:a3 length:a4 output_type:0];
}

- (void)encodeSubmitSleepMS:(unsigned int)a3
{
  [(IOGPUMetalCommandBuffer *)self commitEncoder];
  uint64_t v5 = [(IOGPUMetalCommandBuffer *)self _reserveKernelCommandBufferSpace:16];
  int v6 = (int)v5;
  *(void *)uint64_t v5 = 0x1000000002;
  v5[2] = a3;
  v5[3] = 0;
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v5);
  storage = self->_storage;
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)storage, v6 + 16);
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4
{
  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  [(IOGPUMetalCommandBuffer *)self commitEncoder];
  objc_super v7 = [(IOGPUMetalCommandBuffer *)self _reserveKernelCommandBufferSpace:24];
  *objc_super v7 = [a3 _encodeIOGPUKernelSignalEventCommandArgs:v7 + 2 value:a4];
  v7[1] = 24;
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v7);
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v7 + 24);
  if (*((unsigned char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B58]))
  {
    [(_MTLCommandBuffer *)self _addRetainedObject:a3];
  }
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4 agentMask:(unint64_t)a5
{
  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  [(IOGPUMetalCommandBuffer *)self commitEncoder];
  int v9 = [(IOGPUMetalCommandBuffer *)self _reserveKernelCommandBufferSpace:32];
  *int v9 = [a3 _encodeIOGPUKernelSignalEventAgentCommandArgs:v9 + 2 value:a4 agentMask:a5];
  v9[1] = 32;
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v9);
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v9 + 32);
  if (*((unsigned char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B58]))
  {
    [(_MTLCommandBuffer *)self _addRetainedObject:a3];
  }
}

- (void)encodeSignalEventScheduled:(id)a3 value:(unint64_t)a4
{
  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  [(IOGPUMetalCommandBuffer *)self commitEncoder];
  objc_super v7 = [(IOGPUMetalCommandBuffer *)self _reserveKernelCommandBufferSpace:24];
  *objc_super v7 = [a3 _encodeIOGPUKernelSignalEventScheduledCommandArgs:v7 + 2 value:a4];
  v7[1] = 24;
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v7);
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v7 + 24);
  if (*((unsigned char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B58]))
  {
    [(_MTLCommandBuffer *)self _addRetainedObject:a3];
  }
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
{
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4 timeout:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  [(IOGPUMetalCommandBuffer *)self commitEncoder];
  int v9 = [(IOGPUMetalCommandBuffer *)self _reserveKernelCommandBufferSpace:24];
  *int v9 = [a3 _encodeIOGPUKernelWaitEventCommandArgs:v9 + 2 value:a4 timeout:v5];
  v9[1] = 24;
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v9);
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v9 + 24);
  if (*((unsigned char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B58]))
  {
    [(_MTLCommandBuffer *)self _addRetainedObject:a3];
  }
}

- (void)encodeConditionalAbortEvent:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B20])) {
    MTLReportFailure();
  }
  [(IOGPUMetalCommandBuffer *)self commitEncoder];
  uint64_t v5 = [(IOGPUMetalCommandBuffer *)self _reserveKernelCommandBufferSpace:24];
  *((void *)v5 + 2) = 0;
  *((void *)v5 + 1) = 0;
  *uint64_t v5 = [a3 _encodeIOGPUKernelConditionalEventAbortCommandArgs:v5 + 2];
  v5[1] = 24;
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v5);
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v5 + 24);
  if (*((unsigned char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12B58]))
  {
    [(_MTLCommandBuffer *)self _addRetainedObject:a3];
  }
}

- (void)addPurgedResource:(id)a3
{
  purgedResources = self->_purgedResources;
  if (!purgedResources)
  {
    purgedResources = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    self->_purgedResources = purgedResources;
  }
  [(NSMutableSet *)purgedResources addObject:a3];
}

- (void)addPurgedHeap:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    purgedResources = self->_purgedResources;
    if (!purgedResources)
    {
      purgedResources = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      self->_purgedResources = purgedResources;
    }
    uint64_t v6 = *((void *)a3 + 7);
    [(NSMutableSet *)purgedResources addObject:v6];
  }
}

- (void)_encodePurgedResources
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = 4 * [(NSMutableSet *)self->_purgedResources count] + 12;
  objc_super v4 = [(IOGPUMetalCommandBuffer *)self _reserveKernelCommandBufferSpace:v3];
  *objc_super v4 = 8;
  v4[1] = v3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  purgedResources = self->_purgedResources;
  uint64_t v6 = [(NSMutableSet *)purgedResources countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v13 = v3;
    int v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      int v11 = v8;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(purgedResources);
        }
        v4[(v11 + v10) + 3] = *(_DWORD *)(*(void *)(*((void *)&v14 + 1) + 8 * v10) + 80);
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSMutableSet *)purgedResources countByEnumeratingWithState:&v14 objects:v18 count:16];
      int v8 = v11 + v10;
    }
    while (v7);
    int v12 = v11 + v10;
    LODWORD(v3) = v13;
  }
  else
  {
    int v12 = 0;
  }
  v4[2] = v12;
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v4);
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v4 + v3);

  self->_purgedResources = 0;
}

- (void)allocDebugBuffer
{
}

- (void)growDebugBuffer:(unsigned int)a3
{
}

- (void)getDebugBufferPointerStart:(void *)a3 end:(void *)a4
{
}

- (void)allocateSidebandBuffer:(unsigned int)a3
{
}

- (void)growSidebandBuffer:(unsigned int)a3
{
}

- (void)useResidencySet:(id)a3
{
  id v3 = a3;
  IOGPUMetalCommandBufferStorageAddResidencySets((uint64_t)self->_storage, (uint64_t *)&v3, 1, 0);
  if (*(_DWORD *)__globalGPUCommPage) {
    IOGPUDeviceTraceEvent();
  }
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  IOGPUMetalCommandBufferStorageAddResidencySets((uint64_t)self->_storage, (uint64_t *)a3, a4, 0);
  uint64_t v6 = (_DWORD *)__globalGPUCommPage;
  if (*(_DWORD *)__globalGPUCommPage) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    do
    {
      if (*v6)
      {
        IOGPUDeviceTraceEvent();
        uint64_t v6 = (_DWORD *)__globalGPUCommPage;
      }
      ++v5;
      --v4;
    }
    while (v4);
  }
}

- (void)useInternalResidencySet:(id)a3
{
  id v3 = a3;
  IOGPUMetalCommandBufferStorageAddResidencySets((uint64_t)self->_storage, (uint64_t *)&v3, 1, 1u);
  if (*(_DWORD *)__globalGPUCommPage) {
    IOGPUDeviceTraceEvent();
  }
}

- (void)useInternalResidencySets:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  IOGPUMetalCommandBufferStorageAddResidencySets((uint64_t)self->_storage, (uint64_t *)a3, a4, 1u);
  uint64_t v6 = (_DWORD *)__globalGPUCommPage;
  if (*(_DWORD *)__globalGPUCommPage) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    do
    {
      if (*v6)
      {
        IOGPUDeviceTraceEvent();
        uint64_t v6 = (_DWORD *)__globalGPUCommPage;
      }
      ++v5;
      --v4;
    }
    while (v4);
  }
}

- (unint64_t)gpuFaultAddress
{
  return self->_gpuFaultAddress;
}

- (void)initWithQueue:retainedReferences:synchronousDebugMode:.cold.1()
{
}

- (void)didCompleteWithStartTime:endTime:error:.cold.1()
{
}

- (void)_reserveKernelCommandBufferSpace:.cold.1()
{
  __assert_rtn("-[IOGPUMetalCommandBuffer _reserveKernelCommandBufferSpace:]", "IOGPUMetalCommandBuffer.m", 367, "((uintptr_t)_kernelCommandBufferEnd - (uintptr_t)_kernelCommandBufferCurrent) >= commandSize");
}

@end