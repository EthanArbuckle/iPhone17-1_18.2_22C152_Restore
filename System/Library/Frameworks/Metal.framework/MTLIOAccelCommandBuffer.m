@interface MTLIOAccelCommandBuffer
- (IOAccelResourceList)ioAccelResourceList;
- (IOAccelSegmentListHeader)getSegmentListHeader;
- (MTLDevice)device;
- (MTLIOAccelCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4;
- (MTLIOAccelCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4 synchronousDebugMode:(BOOL)a5;
- (MTLIOAccelCommandBufferResourceInfo)commandBufferResourceInfo;
- (MTLIOAccelCommandBufferStorage)commandBufferStorage;
- (id)akPrivateResourceList;
- (id)akResourceList;
- (unint64_t)protectionOptions;
- (void)_debugBytes:(const char *)a3 length:(unint64_t)a4 output_type:(unsigned int)a5;
- (void)_encodePurgedResources;
- (void)_reserveKernelCommandBufferSpace:(unint64_t)a3;
- (void)addPurgedHeap:(id)a3;
- (void)addPurgedResource:(id)a3;
- (void)allocCommandBufferResourceAtIndex:(unsigned int)a3;
- (void)beginSegment:(void *)a3;
- (void)commit;
- (void)commitAndReset;
- (void)dealloc;
- (void)didCompleteWithStartTime:(unint64_t)a3 endTime:(unint64_t)a4 error:(id)a5;
- (void)encodeConditionalAbortEvent:(id)a3;
- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4;
- (void)encodeSubmitSleepMS:(unsigned int)a3;
- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4;
- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4 timeout:(unsigned int)a5;
- (void)endCurrentSegment;
- (void)getCurrentKernelCommandBufferPointer:(void *)a3 end:(void *)a4;
- (void)getCurrentKernelCommandBufferStart:(void *)a3 current:(void *)a4 end:(void *)a5;
- (void)getSegmentListPointerStart:(void *)a3 current:(void *)a4 end:(void *)a5;
- (void)growKernelCommandBuffer:(unint64_t)a3;
- (void)growSegmentList;
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
- (void)validate;
@end

@implementation MTLIOAccelCommandBuffer

- (MTLIOAccelCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4 synchronousDebugMode:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MTLIOAccelCommandBuffer;
  v8 = -[_MTLCommandBuffer initWithQueue:retainedReferences:synchronousDebugMode:](&v13, sel_initWithQueue_retainedReferences_synchronousDebugMode_);
  if (v8)
  {
    v9 = (atomic_uint *)*((id *)a3 + 49);
    v8->_device = (MTLDevice *)v9;
    MTLAtomicIncrement(v9 + 179);
    Storage = (MTLIOAccelCommandBufferStorage *)MTLIOAccelCommandBufferStoragePoolCreateStorage(*((void *)v8->_device + 84), v6);
    v8->_storage = Storage;
    if (Storage)
    {
      if (v5) {
        v8->_commitAndResetSem = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
      }
      [(MTLDevice *)v8->_device deviceRef];
      uint64_t NextGlobalTraceID = IOAccelDeviceGetNextGlobalTraceID();
      v8->super._globalTraceObjectID = NextGlobalTraceID;
      v8->_storage->var23 = NextGlobalTraceID;
      if (*(_DWORD *)*MEMORY[0x1E4F6EC08]) {
        IOAccelDeviceTraceEvent();
      }
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (MTLIOAccelCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4
{
  return [(MTLIOAccelCommandBuffer *)self initWithQueue:a3 retainedReferences:a4 synchronousDebugMode:0];
}

- (void)setLabel:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelCommandBuffer;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [(MTLDevice *)self->_device deviceRef];
    [a3 cStringUsingEncoding:1];
    self->super._labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
}

- (void)dealloc
{
  MTLAtomicDecrement((atomic_uint *)self->_device + 179);
  storage = self->_storage;
  if (storage) {
    MTLIOAccelCommandBufferStorageDealloc(storage);
  }
  commitAndResetSem = self->_commitAndResetSem;
  if (commitAndResetSem) {
    dispatch_release(commitAndResetSem);
  }

  self->_device = 0;
  self->_purgedResources = 0;
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelCommandBuffer;
  [(_MTLCommandBuffer *)&v5 dealloc];
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

- (void)didCompleteWithStartTime:(unint64_t)a3 endTime:(unint64_t)a4 error:(id)a5
{
  if (self->super._profilingEnabled) {
    self->super._submitToHardwareTime = *self->_submitToHardwareTimeStampPointer;
  }
  v6.receiver = self;
  v6.super_class = (Class)MTLIOAccelCommandBuffer;
  [(_MTLCommandBuffer *)&v6 didCompleteWithStartTime:a3 endTime:a4 error:a5];
  MTLIOAccelCommandBufferStorageDealloc(&self->_storage->var0);
  self->_storage = 0;
}

- (IOAccelResourceList)ioAccelResourceList
{
  return &self->_storage->var13;
}

- (IOAccelSegmentListHeader)getSegmentListHeader
{
  return self->_storage->var10;
}

- (void)getSegmentListPointerStart:(void *)a3 current:(void *)a4 end:(void *)a5
{
  MTLIOAccelCommandBufferStorageGetSegmentListPointers((uint64_t)self->_storage, a3, a4, a5, (uint64_t)a5, v5, v6, v7);
}

- (MTLIOAccelCommandBufferResourceInfo)commandBufferResourceInfo
{
  return self->_storage->var19;
}

- (void)setCurrentSegmentListPointer:(void *)a3
{
  storage = self->_storage;
  storage->var11 = (IOAccelSegmentResourceListHeader *)a3;
  storage->var12 = (IOAccelSegmentResourceDescriptorGroup *)((char *)a3 + 24);
}

- (void)growSegmentList
{
}

- (void)beginSegment:(void *)a3
{
  MTLIOAccelCommandBufferStorageBeginSegment((uint64_t)self->_storage, (uint64_t)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (void)endCurrentSegment
{
}

- (void)validate
{
  if (self->super._status >= 2) {
    MTLReportFailure(0, "-[MTLIOAccelCommandBuffer validate]", 207, @"commit an already committed command buffer", v2, v3, v4, v5, v7);
  }
  if (self->super._currentCommandEncoder)
  {
    MTLReportFailure(0, "-[MTLIOAccelCommandBuffer validate]", 208, @"commit command buffer with uncommitted encoder", v2, v3, v4, v5, v9);
  }
}

- (void)commit
{
  if ([(_MTLCommandBuffer *)self isProfilingEnabled]) {
    [(MTLIOAccelCommandBuffer *)self kernelCommandCollectTimeStamp];
  }
  if (self->_purgedResources) {
    [(MTLIOAccelCommandBuffer *)self _encodePurgedResources];
  }
  MTLIOAccelCommandBufferStorageFinalizeShmemHeader((uint64_t)self->_storage, v3, v4, v5, v6, v7, v8, v9);
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08]) {
    IOAccelDeviceTraceEvent();
  }
  v10.receiver = self;
  v10.super_class = (Class)MTLIOAccelCommandBuffer;
  [(_MTLCommandBuffer *)&v10 commit];
}

- (void)commitAndReset
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_commitAndResetSem, 0xFFFFFFFFFFFFFFFFLL);
  if ([(_MTLCommandBuffer *)self isProfilingEnabled]) {
    [(MTLIOAccelCommandBuffer *)self kernelCommandCollectTimeStamp];
  }
  if (self->_purgedResources) {
    [(MTLIOAccelCommandBuffer *)self _encodePurgedResources];
  }
  MTLIOAccelCommandBufferStorageFinalizeShmemHeader((uint64_t)self->_storage, v3, v4, v5, v6, v7, v8, v9);
  v13.receiver = self;
  v13.super_class = (Class)MTLIOAccelCommandBuffer;
  [(_MTLCommandBuffer *)&v13 commitAndReset];
  uint64_t v10 = *((void *)self->_device + 84);
  v12.receiver = self;
  v12.super_class = (Class)MTLIOAccelCommandBuffer;
  int v11 = [(_MTLCommandBuffer *)&v12 retainedReferences];
  self->_storage = (MTLIOAccelCommandBufferStorage *)MTLIOAccelCommandBufferStoragePoolCreateStorage(v10, v11);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_commitAndResetSem);
}

- (id)akResourceList
{
  return self->_storage->var14;
}

- (id)akPrivateResourceList
{
  return self->_storage->var15;
}

- (void)kernelCommandCollectTimeStamp
{
  storage = self->_storage;
  uint64_t var5 = (uint64_t)storage->var5;
  if ((unint64_t)&storage->var6[-var5] <= 0xF)
  {
    MTLIOAccelCommandBufferStorageGrowKernelCommandBuffer((uint64_t)storage, 16);
    storage = self->_storage;
    uint64_t var5 = (uint64_t)storage->var5;
  }
  MTLIOAccelCommandBufferStorageBeginSegment((uint64_t)storage, var5, v2, v3, v4, v5, v6, v7);
  *(void *)uint64_t var5 = 0x1000000002;
  self->_submitToHardwareTimeStampPointer = (unint64_t *)(var5 + 8);
  self->_storage->uint64_t var5 = (char *)(var5 + 16);
  int v11 = self->_storage;

  MTLIOAccelCommandBufferStorageEndSegment((uint64_t)v11);
}

- (void)setCurrentCommandEncoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTLIOAccelCommandBuffer;
  -[_MTLCommandBuffer setCurrentCommandEncoder:](&v6, sel_setCurrentCommandEncoder_);
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [a3 globalTraceObjectID];
    getpid();
    IOAccelDeviceTraceEvent();
  }
  storage = self->_storage;
  if (storage) {
    storage->var20 = a3;
  }
}

- (void)pushDebugGroup:(id)a3
{
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [(MTLDevice *)self->_device deviceRef];
    [(_MTLCommandBuffer *)self globalTraceObjectID];
    [a3 cStringUsingEncoding:1];
    IOAccelDeviceTraceObjectLabel();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelCommandBuffer;
  [(_MTLCommandBuffer *)&v5 pushDebugGroup:a3];
}

- (void)popDebugGroup
{
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [(MTLDevice *)self->_device deviceRef];
    [(_MTLCommandBuffer *)self globalTraceObjectID];
    IOAccelDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelCommandBuffer;
  [(_MTLCommandBuffer *)&v3 popDebugGroup];
}

- (void)_reserveKernelCommandBufferSpace:(unint64_t)a3
{
  storage = self->_storage;
  result = storage->var5;
  var6 = storage->var6;
  uint64_t v8 = result;
  if (var6 - (unsigned char *)result < a3)
  {
    [(MTLIOAccelCommandBuffer *)self growKernelCommandBuffer:a3];
    [(MTLIOAccelCommandBuffer *)self getCurrentKernelCommandBufferPointer:&v8 end:&var6];
    result = v8;
    storage = self->_storage;
  }
  storage->uint64_t var5 = (char *)result + a3;
  return result;
}

- (void)_debugBytes:(const char *)a3 length:(unint64_t)a4 output_type:(unsigned int)a5
{
  int v9 = (a4 + 19) & 0xFFFFFFFC;
  uint64_t v10 = [(MTLIOAccelCommandBuffer *)self _reserveKernelCommandBufferSpace:(a4 + 19) & 0xFFFFFFFFFFFFFFFCLL];
  int v11 = (int)v10;
  *uint64_t v10 = 0;
  v10[1] = v9;
  v10[2] = a5;
  v10[3] = a4;
  memcpy(v10 + 4, a3, a4);
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, v11, v12, v13, v14, v15, v16, v17);
  storage = self->_storage;

  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)storage, v11 + v9);
}

- (void)kprintfBytes:(const char *)a3 length:(unint64_t)a4
{
  [(MTLIOAccelCommandBuffer *)self commitEncoder];

  [(MTLIOAccelCommandBuffer *)self _debugBytes:a3 length:a4 output_type:0];
}

- (void)encodeSubmitSleepMS:(unsigned int)a3
{
  [(MTLIOAccelCommandBuffer *)self commitEncoder];
  objc_super v5 = [(MTLIOAccelCommandBuffer *)self _reserveKernelCommandBufferSpace:16];
  int v6 = (int)v5;
  *(void *)objc_super v5 = 0x1000000003;
  v5[2] = a3;
  v5[3] = 0;
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v5, v7, v8, v9, v10, v11, v12);
  storage = self->_storage;

  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)storage, v6 + 16);
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4
{
  if (self->super._currentCommandEncoder) {
    MTLReportFailure(0, "-[MTLIOAccelCommandBuffer encodeSignalEvent:value:]", 414, @"encodeSignalEvent:value: with uncommitted encoder", v4, v5, v6, v7, v18);
  }
  [(MTLIOAccelCommandBuffer *)self commitEncoder];
  uint64_t v11 = [(MTLIOAccelCommandBuffer *)self _reserveKernelCommandBufferSpace:24];
  *((void *)v11 + 2) = 0;
  *((void *)v11 + 1) = 0;
  *uint64_t v11 = [a3 encodeKernelSignalEventCommandArgs:v11 + 2 value:a4];
  v11[1] = 24;
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v11, v12, v13, v14, v15, v16, v17);
  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v11 + 24);
  if (self->super._retainedReferences)
  {
    [(_MTLCommandBuffer *)self _addRetainedObject:a3];
  }
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
{
  if (self->super._currentCommandEncoder) {
    MTLReportFailure(0, "-[MTLIOAccelCommandBuffer encodeWaitForEvent:value:]", 437, @"encodeWaitForEvent:value: with uncommitted encoder", v4, v5, v6, v7, v18);
  }
  [(MTLIOAccelCommandBuffer *)self commitEncoder];
  uint64_t v11 = [(MTLIOAccelCommandBuffer *)self _reserveKernelCommandBufferSpace:24];
  *((void *)v11 + 2) = 0;
  *((void *)v11 + 1) = 0;
  *uint64_t v11 = [a3 encodeKernelWaitEventCommandArgs:v11 + 2 value:a4];
  v11[1] = 24;
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v11, v12, v13, v14, v15, v16, v17);
  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v11 + 24);
  if (self->super._retainedReferences)
  {
    [(_MTLCommandBuffer *)self _addRetainedObject:a3];
  }
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4 timeout:(unsigned int)a5
{
  uint64_t v8 = *(void *)&a5;
  if (self->super._currentCommandEncoder) {
    MTLReportFailure(0, "-[MTLIOAccelCommandBuffer encodeWaitForEvent:value:timeout:]", 459, @"encodeWaitForEvent:value:timeout: with uncommitted encoder", *(uint64_t *)&a5, v5, v6, v7, v19);
  }
  [(MTLIOAccelCommandBuffer *)self commitEncoder];
  uint64_t v12 = [(MTLIOAccelCommandBuffer *)self _reserveKernelCommandBufferSpace:24];
  *((void *)v12 + 2) = 0;
  *((void *)v12 + 1) = 0;
  *uint64_t v12 = [a3 encodeKernelWaitEventCommandArgs:v12 + 2 value:a4 timeout:v8];
  v12[1] = 24;
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v12, v13, v14, v15, v16, v17, v18);
  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v12 + 24);
  if (self->super._retainedReferences)
  {
    [(_MTLCommandBuffer *)self _addRetainedObject:a3];
  }
}

- (void)encodeConditionalAbortEvent:(id)a3
{
  if (self->super._currentCommandEncoder) {
    MTLReportFailure(0, "-[MTLIOAccelCommandBuffer encodeConditionalAbortEvent:]", 486, @"encodeConditionalAbortEvent:value: with uncommitted encoder", v3, v4, v5, v6, v16);
  }
  [(MTLIOAccelCommandBuffer *)self commitEncoder];
  uint64_t v9 = [(MTLIOAccelCommandBuffer *)self _reserveKernelCommandBufferSpace:24];
  *((void *)v9 + 2) = 0;
  *((void *)v9 + 1) = 0;
  _DWORD *v9 = [a3 encodeConditionalEventAbortCommandArgs:v9 + 2];
  v9[1] = 24;
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v9, v10, v11, v12, v13, v14, v15);
  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v9 + 24);
  if (self->super._retainedReferences)
  {
    [(_MTLCommandBuffer *)self _addRetainedObject:a3];
  }
}

- (unint64_t)protectionOptions
{
  return self->_protectionOptions;
}

- (void)setProtectionOptions:(unint64_t)a3
{
  if (self->super._currentCommandEncoder) {
    MTLReportFailure(0, "-[MTLIOAccelCommandBuffer setProtectionOptions:]", 543, @"setProtectionOptions: with uncommitted encoder", v3, v4, v5, v6, v18);
  }
  [(MTLIOAccelCommandBuffer *)self commitEncoder];
  self->_protectionOptions = a3;
  uint64_t v9 = [(MTLIOAccelCommandBuffer *)self _reserveKernelCommandBufferSpace:16];
  int v10 = (int)v9;
  void *v9 = 0x100000000ALL;
  v9[1] = a3;
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v9, v11, v12, v13, v14, v15, v16);
  storage = self->_storage;

  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)storage, v10 + 16);
}

- (void)addPurgedResource:(id)a3
{
  purgedResources = self->_purgedResources;
  if (!purgedResources)
  {
    purgedResources = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
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
      purgedResources = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      self->_purgedResources = purgedResources;
    }
    uint64_t v6 = *((void *)a3 + 7);
    [(NSMutableSet *)purgedResources addObject:v6];
  }
}

- (void)_encodePurgedResources
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 4 * [(NSMutableSet *)self->_purgedResources count] + 12;
  uint64_t v4 = [(MTLIOAccelCommandBuffer *)self _reserveKernelCommandBufferSpace:v3];
  *uint64_t v4 = 9;
  v4[1] = v3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  purgedResources = self->_purgedResources;
  uint64_t v6 = [(NSMutableSet *)purgedResources countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v13 = v6;
    int v19 = v3;
    int v14 = 0;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      int v17 = v14;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(purgedResources);
        }
        v4[(v17 + v16) + 3] = *(_DWORD *)(*(void *)(*((void *)&v20 + 1) + 8 * v16) + 80);
        ++v16;
      }
      while (v13 != v16);
      uint64_t v13 = [(NSMutableSet *)purgedResources countByEnumeratingWithState:&v20 objects:v24 count:16];
      int v14 = v17 + v16;
    }
    while (v13);
    int v18 = v17 + v16;
    LODWORD(v3) = v19;
  }
  else
  {
    int v18 = 0;
  }
  v4[2] = v18;
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v4, v7, v8, v9, v10, v11, v12);
  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v4 + v3);

  self->_purgedResources = 0;
}

- (void)setResponsibleTaskIDs:(const unsigned int *)a3 count:(unsigned int)a4
{
  if (self->super._currentCommandEncoder) {
    MTLReportFailure(0, "-[MTLIOAccelCommandBuffer setResponsibleTaskIDs:count:]", 656, @"setResponsibleTaskIDs: with uncommitted encoder", v4, v5, v6, v7, v24);
  }
  [(MTLIOAccelCommandBuffer *)self commitEncoder];
  if (a3) {
    uint64_t v11 = a4;
  }
  else {
    uint64_t v11 = 0;
  }
  int v12 = (4 * v11 + 15) & 0xFFFFFFFC;
  uint64_t v13 = [(MTLIOAccelCommandBuffer *)self _reserveKernelCommandBufferSpace:(4 * v11 + 15) & 0x7FFFFFFFCLL];
  int v20 = (int)v13;
  *uint64_t v13 = 14;
  v13[1] = v12;
  v13[2] = v11;
  if (v11)
  {
    long long v21 = v13 + 3;
    do
    {
      int v22 = *a3++;
      *v21++ = v22;
      --v11;
    }
    while (v11);
  }
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v13, v14, v15, v16, v17, v18, v19);
  storage = self->_storage;

  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)storage, v20 + v12);
}

- (MTLIOAccelCommandBufferStorage)commandBufferStorage
{
  return self->_storage;
}

- (MTLDevice)device
{
  return self->_device;
}

@end