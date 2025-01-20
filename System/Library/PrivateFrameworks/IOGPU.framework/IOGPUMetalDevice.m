@interface IOGPUMetalDevice
+ (void)registerDevices;
+ (void)registerService:(unsigned int)a3;
- (BOOL)hasUnifiedMemory;
- (BOOL)supportPriorityBand;
- (BOOL)supportsResourceDetachBacking;
- (BOOL)supportsVertexAmplification;
- (BOOL)supportsVertexAmplificationCount:(unint64_t)a3;
- (IOGPUMemoryInfo)memoryInfo;
- (IOGPUMetalDevice)initWithAcceleratorPort:(unsigned int)a3;
- (IOGPUMetalDevice)initWithAcceleratorPort:(unsigned int)a3 options:(unint64_t)a4;
- (__IOGPUDevice)deviceRef;
- (id)_deviceWrapper;
- (id)akPrivateResourceListPool;
- (id)akResourceListPool;
- (id)allocBufferSubDataWithLength:(unint64_t)a3 options:(unint64_t)a4 alignment:(unint64_t)a5 heapIndex:(signed __int16 *)a6 bufferIndex:(signed __int16 *)a7 bufferOffset:(unint64_t *)a8;
- (id)allocBufferSubDataWithLength:(unint64_t)a3 options:(unint64_t)a4 alignment:(unint64_t)a5 heapIndex:(signed __int16 *)a6 bufferIndex:(signed __int16 *)a7 bufferOffset:(unint64_t *)a8 parentAddress:(unint64_t)a9 parentLength:(unint64_t)a10;
- (id)hwResourcePools;
- (id)indirectArgumentBufferDecodingData;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (id)newAccelerationStructureWithSize:(unint64_t)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newCommandQueueWithDescriptor:(id)a3;
- (id)newEvent;
- (id)newEventWithOptions:(int64_t)a3;
- (id)newFence;
- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4;
- (id)newIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5;
- (id)newIOHandleWithURL:(id)a3 error:(id *)a4;
- (id)newIndirectArgumentBufferLayoutWithStructType:(id)a3;
- (id)newIndirectArgumentEncoderWithLayout:(id)a3;
- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newLateEvalEvent;
- (id)newUncachedIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5;
- (id)newUncachedIOHandleWithURL:(id)a3 error:(id *)a4;
- (int)numCommandBuffers;
- (uint64_t)updateResourcePoolPurgeability;
- (unint64_t)currentAllocatedSize;
- (unint64_t)dedicatedMemorySize;
- (unint64_t)maxBufferLength;
- (unint64_t)recommendedMaxWorkingSetSize;
- (unint64_t)registryID;
- (unint64_t)sharedMemorySize;
- (unsigned)acceleratorPort;
- (unsigned)cmdBufArgsSize;
- (unsigned)hwResourcePoolCount;
- (unsigned)initialDebugBufferShmemSize;
- (unsigned)initialIOKernelCommandListShmemSize;
- (unsigned)initialKernelCommandShmemSize;
- (unsigned)initialSegmentListShmemSize;
- (unsigned)initialSidebandShmemSize;
- (void)_purgeDevice;
- (void)_setDeviceWrapper:(id)a3;
- (void)cancelPeriodicUpdateResourcePoolPurgeability;
- (void)dealloc;
- (void)deallocBufferSubData:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7;
- (void)kickCleanupQueue;
- (void)periodicUpdateResourcePoolPurgeability;
- (void)setComputePipelineStateCommandShmemSize:(unsigned int)a3;
- (void)setHwResourcePool:(id *)a3 count:(int)a4;
- (void)setSegmentListShmemSize:(unsigned int)a3;
@end

@implementation IOGPUMetalDevice

- (unint64_t)registryID
{
  return self->_registryID;
}

- (unint64_t)currentAllocatedSize
{
  uint64_t output = 0;
  if (IOGPUDeviceGetAllocatedSize((uint64_t)self->_deviceRef, &output)) {
    return 0;
  }
  else {
    return output;
  }
}

- (void)deallocBufferSubData:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7
{
  v8[1] = a6;
  int v11 = 0;
  signed __int16 v10 = a4;
  signed __int16 v9 = a5;
  v8[0] = a7;
  buffer_suballocator = self->_buffer_suballocator;
  if (!buffer_suballocator) {
    -[IOGPUMetalDevice deallocBufferSubData:heapIndex:bufferIndex:bufferOffset:length:]();
  }
  IOGPUMetalSuballocatorFree((uint64_t)buffer_suballocator, (uint64_t)v8);
}

- (id)allocBufferSubDataWithLength:(unint64_t)a3 options:(unint64_t)a4 alignment:(unint64_t)a5 heapIndex:(signed __int16 *)a6 bufferIndex:(signed __int16 *)a7 bufferOffset:(unint64_t *)a8
{
  return [(IOGPUMetalDevice *)self allocBufferSubDataWithLength:a3 options:a4 alignment:a5 heapIndex:a6 bufferIndex:a7 bufferOffset:a8 parentAddress:0 parentLength:0];
}

- (id)allocBufferSubDataWithLength:(unint64_t)a3 options:(unint64_t)a4 alignment:(unint64_t)a5 heapIndex:(signed __int16 *)a6 bufferIndex:(signed __int16 *)a7 bufferOffset:(unint64_t *)a8 parentAddress:(unint64_t)a9 parentLength:(unint64_t)a10
{
  uint64_t v22 = 0;
  unint64_t v23 = a4;
  unint64_t v20 = a3;
  unint64_t v21 = 0;
  if (a9) {
    BOOL v14 = a10 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14) {
    unint64_t v21 = *a8;
  }
  buffer_suballocator = self->_buffer_suballocator;
  if (!buffer_suballocator) {
    return 0;
  }
  id v16 = IOGPUMetalSuballocatorAllocate((uint64_t)buffer_suballocator, (uint64_t *)&v20, a5, &v23, a9, a10);
  v17 = v16;
  if (v16)
  {
    *a6 = WORD1(v22);
    *a7 = v22;
    *a8 = v21;
    if ((v23 & 0x90000) == 0)
    {
      uint64_t v18 = objc_msgSend(v16, "virtualAddress", v20);
      bzero((void *)(v18 + v21), a3);
    }
  }
  return v17;
}

- (__IOGPUDevice)deviceRef
{
  return self->_deviceRef;
}

- (void)_purgeDevice
{
  v4.receiver = self;
  v4.super_class = (Class)IOGPUMetalDevice;
  [(_MTLDevice *)&v4 _purgeDevice];
  IOGPUMetalCommandBufferStoragePoolPurge((uint64_t)self->_commandBufferStoragePool);
  [(IOGPUMetalDeviceShmemPool *)self->_storageCreateParams.kernelCommandShmemPool purge];
  [(IOGPUMetalDeviceShmemPool *)self->_storageCreateParams.segmentListShmemPool purge];
  [(IOGPUMetalDeviceShmemPool *)self->_storageCreateParams.sidebandPool purge];
  [(IOGPUMetalDeviceShmemPool *)self->_storageCreateParams.debugBufferShmemPool purge];
  [(MTLResourceListPool *)self->_storageCreateParams.akResourceListPool purge];
  [(MTLResourceListPool *)self->_storageCreateParams.akPrivateResourceListPool purge];
  if (self->_storageCreateParams.var0)
  {
    unint64_t v3 = 0;
    do
      [(hwResourcePoolCount *)self->_storageCreateParams.hwResourcePools[v3++] purge];
    while (v3 < self->_storageCreateParams.var0);
  }
  [(IOGPUMetalDeviceShmemPool *)self->_ioKernelCommandListShmemPool purge];
  -[IOGPUMetalDevice kickCleanupQueue]((uint64_t)self);
}

- (void)kickCleanupQueue
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 784));
    *(unsigned char *)(a1 + 789) = 1;
    if (!*(unsigned char *)(a1 + 788))
    {
      *(unsigned char *)(a1 + 788) = 1;
      v2 = *(NSObject **)(a1 + 776);
      dispatch_time_t v3 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v2, v3, 0x3B9ACA00uLL, 0x5F5E100uLL);
      dispatch_resume(*(dispatch_object_t *)(a1 + 776));
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 784));
  }
}

- (void)periodicUpdateResourcePoolPurgeability
{
  if (!a1) {
    return;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 784));
  *(unsigned char *)(a1 + 789) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 784));
  if (!*(_DWORD *)(a1 + 648))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 784));
    goto LABEL_8;
  }
  unint64_t v2 = 0;
  int v3 = 0;
  do
    v3 |= [*(id *)(*(void *)(a1 + 640) + 8 * v2++) updateResourcePurgeability];
  while (v2 < *(unsigned int *)(a1 + 648));
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 784));
  if ((v3 & 1) == 0)
  {
LABEL_8:
    if (!*(unsigned char *)(a1 + 789))
    {
      dispatch_suspend(*(dispatch_object_t *)(a1 + 776));
      *(unsigned char *)(a1 + 788) = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 784));
}

void __52__IOGPUMetalDevice_initWithAcceleratorPort_options___block_invoke(uint64_t a1)
{
}

- (BOOL)supportsResourceDetachBacking
{
  return 1;
}

- (IOGPUMetalDevice)initWithAcceleratorPort:(unsigned int)a3 options:(unint64_t)a4
{
  +[IOGPUMemoryInfo initialize];
  v19.receiver = self;
  v19.super_class = (Class)IOGPUMetalDevice;
  v7 = [(_MTLDevice *)&v19 init];
  if (v7)
  {
    v7[744] = MTLGetEnvDefault() != 0;
    *((_DWORD *)v7 + 196) = 0;
    if (([v7 conformsToProtocol:&unk_26CD319D8] & 1) == 0) {
      -[IOGPUMetalDevice initWithAcceleratorPort:options:].cold.6();
    }
    if (a4 >= 0x10000) {
      -[IOGPUMetalDevice initWithAcceleratorPort:options:]();
    }
    uint64_t v8 = IOGPUDeviceCreateWithAPIProperty(a3, "Metal", a4);
    *((void *)v7 + 75) = v8;
    if (!v8) {
      goto LABEL_15;
    }
    IORegistryEntryGetRegistryEntryID(a3, (uint64_t *)v7 + 99);
    *((_DWORD *)v7 + 152) = a3;
    IOObjectRetain(a3);
    *((void *)v7 + 80) = 0;
    *((_DWORD *)v7 + 162) = 0;
    *((void *)v7 + 82) = [objc_alloc(MEMORY[0x263F129E0]) initWithResourceListCapacity:1024];
    *((void *)v7 + 83) = [objc_alloc(MEMORY[0x263F129E0]) initWithResourceListCapacity:256];
    IOGPUDeviceGetConfig64(*((void *)v7 + 75), (_DWORD *)v7 + 172, (_DWORD *)v7 + 173, (void *)v7 + 87, (void *)v7 + 88, (_DWORD *)v7 + 180);
    IOGPUDeviceGetSharedMemorySize(*((void **)v7 + 75), (void *)v7 + 89);
    *((void *)v7 + 88) = 0;
    *((void *)v7 + 87) = 0;
    signed __int16 v9 = -[IOGPUMetalDeviceShmemPool initWithDevice:resourceClass:shmemSize:shmemType:options:]([IOGPUMetalDeviceShmemPool alloc], "initWithDevice:resourceClass:shmemSize:shmemType:options:", v7, objc_opt_class(), [v7 initialKernelCommandShmemSize], 1, 0);
    *((void *)v7 + 78) = v9;
    if (!v9) {
      -[IOGPUMetalDevice initWithAcceleratorPort:options:]();
    }
    signed __int16 v10 = -[IOGPUMetalDeviceShmemPool initWithDevice:resourceClass:shmemSize:shmemType:options:]([IOGPUMetalDeviceShmemPool alloc], "initWithDevice:resourceClass:shmemSize:shmemType:options:", v7, objc_opt_class(), [v7 initialSegmentListShmemSize], 0, 0);
    *((void *)v7 + 77) = v10;
    if (!v10) {
      -[IOGPUMetalDevice initWithAcceleratorPort:options:]();
    }
    int v11 = -[IOGPUMetalDeviceShmemPool initWithDevice:resourceClass:shmemSize:shmemType:options:]([IOGPUMetalDeviceShmemPool alloc], "initWithDevice:resourceClass:shmemSize:shmemType:options:", v7, objc_opt_class(), [v7 initialSidebandShmemSize], 3, 0);
    *((void *)v7 + 79) = v11;
    if (!v11) {
      -[IOGPUMetalDevice initWithAcceleratorPort:options:].cold.4();
    }
    v12 = -[IOGPUMetalDeviceShmemPool initWithDevice:resourceClass:shmemSize:shmemType:options:]([IOGPUMetalDeviceShmemPool alloc], "initWithDevice:resourceClass:shmemSize:shmemType:options:", v7, objc_opt_class(), [v7 initialDebugBufferShmemSize], 2, 0);
    *((void *)v7 + 84) = v12;
    if (!v12) {
      -[IOGPUMetalDevice initWithAcceleratorPort:options:].cold.5();
    }
    if (!v7[744]) {
      *((void *)v7 + 92) = -[IOGPUMetalDeviceShmemPool initWithDevice:resourceClass:shmemSize:shmemType:options:]([IOGPUMetalDeviceShmemPool alloc], "initWithDevice:resourceClass:shmemSize:shmemType:options:", v7, objc_opt_class(), [v7 initialIOKernelCommandListShmemSize], 1, 0);
    }
    *((void *)v7 + 91) = 0;
    *((void *)v7 + 95) = dispatch_queue_create("com.Metal.DeviceDispatchQueue", 0);
    IOGPUMetalSuballocatorCreate((IOGPUMetalDevice *)v7);
    *((void *)v7 + 94) = v13;
    IOGPUMetalCommandBufferStoragePoolCreate((uint64_t)v7);
    *((void *)v7 + 85) = v14;
    if (v14)
    {
      *(void *)&v7[*MEMORY[0x263F12BC0]] = IOGPUDeviceGetGlobalTraceObjectID(*((void *)v7 + 75));
      if (*(_DWORD *)__globalGPUCommPage)
      {
        IOGPUDeviceGetGlobalTraceObjectID(*((void *)v7 + 75));
        IOGPUDeviceTraceEvent();
      }
      *((void *)v7 + 96) = dispatch_queue_create("com.Metal.DeviceCleaupQueue", 0);
      *((void *)v7 + 97) = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *((dispatch_queue_t *)v7 + 95));
      v7[788] = 0;
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x3052000000;
      v18[3] = __Block_byref_object_copy__0;
      v18[4] = __Block_byref_object_dispose__0;
      v18[5] = v7;
      v15 = *((void *)v7 + 97);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __52__IOGPUMetalDevice_initWithAcceleratorPort_options___block_invoke;
      handler[3] = &unk_26441A578;
      handler[4] = v18;
      dispatch_source_set_event_handler(v15, handler);
      _Block_object_dispose(v18, 8);
    }
    else
    {
LABEL_15:

      return 0;
    }
  }
  return (IOGPUMetalDevice *)v7;
}

- (unsigned)initialSidebandShmemSize
{
  return 0x4000;
}

- (unsigned)initialSegmentListShmemSize
{
  return 0x4000;
}

- (unsigned)initialKernelCommandShmemSize
{
  return 0x4000;
}

- (unsigned)initialIOKernelCommandListShmemSize
{
  return *MEMORY[0x263EF8AE0];
}

- (unsigned)initialDebugBufferShmemSize
{
  return *MEMORY[0x263EF8AF8];
}

- (unint64_t)maxBufferLength
{
  unint64_t v3 = 0;
  IOGPUDeviceGetMaxResourceSize(&self->_deviceRef->var0.var0, &v3);
  return v3;
}

- (BOOL)hasUnifiedMemory
{
  return 1;
}

- (void)setHwResourcePool:(id *)a3 count:(int)a4
{
  p_storageCreateParams = &self->_storageCreateParams;
  if (self->_storageCreateParams.hwResourcePools) {
    -[IOGPUMetalDevice setHwResourcePool:count:]();
  }
  if (self->_storageCreateParams.var0) {
    -[IOGPUMetalDevice setHwResourcePool:count:]();
  }
  self->_storageCreateParams.hwResourcePools = (hwResourcePoolCount **)malloc_type_malloc(8 * a4, 0x80040B8603338uLL);
  if (a4 >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      p_storageCreateParams->hwResourcePools[v7] = (hwResourcePoolCount *)a3[v7];
      ++v7;
    }
    while (a4 != v7);
  }
  p_storageCreateParams->var0 = a4;
}

- (id)newFence
{
  unint64_t v3 = [IOGPUMetalFence alloc];
  return [(IOGPUMetalFence *)v3 initWithDevice:self];
}

- (unint64_t)sharedMemorySize
{
  return self->_sharedMemorySize;
}

- (unint64_t)dedicatedMemorySize
{
  return self->_videoRam;
}

+ (void)registerService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a3, @"MetalPluginName", 0, 0);
  if (!CFProperty) {
    return;
  }
  v5 = CFProperty;
  CFTypeID v6 = CFGetTypeID(CFProperty);
  if (v6 == CFStringGetTypeID())
  {
    uint64_t v7 = [MEMORY[0x263F086E0] bundleWithPath:objc_msgSend((id)objc_msgSend(@"/System/Library/Extensions", "stringByAppendingPathComponent:", v5), "stringByAppendingString:", @".bundle"];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      CFTypeRef v9 = IORegistryEntryCreateCFProperty(v3, @"MetalPluginClassName", 0, 0);
      if (v9)
      {
        signed __int16 v10 = v9;
        CFTypeID v11 = CFGetTypeID(v9);
        if (v11 == CFStringGetTypeID())
        {
          v12 = (objc_class *)[v8 classNamed:v10];
          CFRelease(v10);
          if (v12) {
            goto LABEL_11;
          }
        }
        else
        {
          CFRelease(v10);
        }
      }
      v12 = (objc_class *)[v8 principalClass];
LABEL_11:
      if ([(objc_class *)v12 isSubclassOfClass:objc_opt_class()])
      {
        uint64_t v13 = (void *)[[v12 alloc] initWithAcceleratorPort:v3];
        if (v13) {
          MTLAddDevice();
        }
      }
    }
  }
  CFRelease(v5);
}

- (void)dealloc
{
  device_pool_cleanup_queue = self->_device_pool_cleanup_queue;
  if (device_pool_cleanup_queue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27__IOGPUMetalDevice_dealloc__block_invoke;
    block[3] = &unk_26441A5F0;
    block[4] = self;
    dispatch_sync(device_pool_cleanup_queue, block);
    dispatch_release((dispatch_object_t)self->_device_pool_cleanup_queue);
  }
  commandBufferStoragePool = self->_commandBufferStoragePool;
  if (commandBufferStoragePool) {
    IOGPUMetalCommandBufferStoragePoolDealloc(commandBufferStoragePool);
  }
  buffer_suballocator = self->_buffer_suballocator;
  if (buffer_suballocator) {
    IOGPUMetalSuballocatorDestroy(buffer_suballocator);
  }
  device_dispatch_queue = self->_device_dispatch_queue;
  if (device_dispatch_queue) {
    dispatch_release(device_dispatch_queue);
  }
  deviceRef = self->_deviceRef;
  if (deviceRef) {
    CFRelease(deviceRef);
  }

  self->_ioKernelCommandListShmemPool = 0;
  self->_storageCreateParams.kernelCommandShmemPool = 0;

  self->_storageCreateParams.segmentListShmemPool = 0;
  self->_storageCreateParams.sidebandPool = 0;

  self->_storageCreateParams.debugBufferShmemPool = 0;
  if (self->_storageCreateParams.var0)
  {
    unint64_t v8 = 0;
    do
    {

      self->_storageCreateParams.hwResourcePools[v8++] = 0;
    }
    while (v8 < self->_storageCreateParams.var0);
  }
  self->_storageCreateParams.var0 = 0;
  free(self->_storageCreateParams.hwResourcePools);
  self->_storageCreateParams.hwResourcePools = 0;

  IOObjectRelease(self->_acceleratorPort);
  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalDevice;
  [(_MTLDevice *)&v9 dealloc];
}

void __27__IOGPUMetalDevice_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 776);
  if (*(unsigned char *)(v2 + 788)) {
    dispatch_source_cancel(v3);
  }
  else {
    dispatch_resume(v3);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 788) = 0;
  dispatch_activate(*(dispatch_object_t *)(*(void *)(a1 + 32) + 776));
  objc_super v4 = *(NSObject **)(*(void *)(a1 + 32) + 776);
  dispatch_release(v4);
}

- (void)setSegmentListShmemSize:(unsigned int)a3
{
  if (self->_storageCreateParams.segmentListShmemPool->_priv.shmemSize < a3)
  {
    objc_super v4 = [[IOGPUMetalDeviceShmemPool alloc] initWithDevice:self resourceClass:objc_opt_class() shmemSize:*(void *)&a3 shmemType:0 options:0];

    self->_storageCreateParams.segmentListShmemPool = v4;
  }
}

- (void)setComputePipelineStateCommandShmemSize:(unsigned int)a3
{
  p_storageCreateParams = &self->_storageCreateParams;
  if (self->_storageCreateParams.kernelCommandShmemPool->_priv.shmemSize < a3)
  {
    objc_super v4 = [[IOGPUMetalDeviceShmemPool alloc] initWithDevice:self resourceClass:objc_opt_class() shmemSize:*(void *)&a3 shmemType:1 options:0];

    p_storageCreateParams->kernelCommandShmemPool = v4;
  }
}

- (IOGPUMetalDevice)initWithAcceleratorPort:(unsigned int)a3
{
  return [(IOGPUMetalDevice *)self initWithAcceleratorPort:*(void *)&a3 options:0];
}

- (unsigned)cmdBufArgsSize
{
  return 40;
}

- (id)akResourceListPool
{
  return self->_storageCreateParams.akResourceListPool;
}

- (id)akPrivateResourceListPool
{
  return self->_storageCreateParams.akPrivateResourceListPool;
}

- (id)hwResourcePools
{
  return (id *)self->_storageCreateParams.hwResourcePools;
}

- (unsigned)hwResourcePoolCount
{
  return self->_storageCreateParams.var0;
}

- (unint64_t)recommendedMaxWorkingSetSize
{
  unint64_t videoRam = self->_videoRam;
  if (!videoRam) {
    return self->_sharedMemorySize;
  }
  return videoRam;
}

- (BOOL)supportsVertexAmplification
{
  return 0;
}

- (BOOL)supportsVertexAmplificationCount:(unint64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  BOOL result = [(IOGPUMetalDevice *)self supportsVertexAmplification];
  if (a3 != 2) {
    return 0;
  }
  return result;
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  uint64_t v4 = [a3 maxCommandBufferCount];
  return [(_MTLDevice *)self newCommandQueueWithMaxCommandBufferCount:v4];
}

- (id)newIndirectArgumentBufferLayoutWithStructType:(id)a3
{
  return 0;
}

- (id)newIndirectArgumentEncoderWithLayout:(id)a3
{
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5
{
  uint64_t v7 = (void *)[(IOGPUMetalDevice *)self newIndirectCommandBufferWithDescriptor:a3 maxCount:a4 options:a5];
  unint64_t v8 = [[IOGPUMetalIndirectCommandBuffer alloc] initWithBuffer:v7 descriptor:a3 maxCommandCount:a4];

  return v8;
}

- (id)indirectArgumentBufferDecodingData
{
  return 0;
}

- (BOOL)supportPriorityBand
{
  return (LOBYTE(self->_configBits) >> 6) & 1;
}

- (id)newEvent
{
  if ((self->_configBits & 0x4000) != 0)
  {
    uint64_t v4 = [_IOGPUMetalMTLEvent alloc];
    return [(_IOGPUMetalMTLEvent *)v4 initWithDevice:self];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)IOGPUMetalDevice;
    return [(_MTLDevice *)&v5 newEvent];
  }
}

- (id)newEventWithOptions:(int64_t)a3
{
  objc_super v5 = [_IOGPUMetalMTLEvent alloc];
  return [(_IOGPUMetalMTLEvent *)v5 initWithDevice:self options:a3];
}

- (id)newLateEvalEvent
{
  uint64_t v3 = [_IOGPUMetalMTLLateEvalEvent alloc];
  return [(_IOGPUMetalMTLLateEvalEvent *)v3 initWithDevice:self];
}

- (uint64_t)updateResourcePoolPurgeability
{
  if (a1 && *(_DWORD *)(a1 + 648))
  {
    unint64_t v1 = 0;
    int v2 = 0;
    uint64_t v3 = a1 + 24;
    uint64_t v4 = a1 + 32;
    do
      v2 |= [*(id *)(*(void *)(v3 + 616) + 8 * v1++) updateResourcePurgeability];
    while (v1 < *(unsigned int *)(v4 + 616));
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2 & 1;
}

- (void)cancelPeriodicUpdateResourcePoolPurgeability
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 784));
    if (!*(unsigned char *)(a1 + 789))
    {
      dispatch_suspend(*(dispatch_object_t *)(a1 + 776));
      *(unsigned char *)(a1 + 788) = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 784));
  }
}

- (void)_setDeviceWrapper:(id)a3
{
}

- (id)_deviceWrapper
{
  p_deviceWrapper = &self->_deviceWrapper;
  if (!objc_loadWeak((id *)&self->_deviceWrapper)) {
    return self;
  }
  id Weak = objc_loadWeak((id *)p_deviceWrapper);
  return (id)[Weak _deviceWrapper];
}

- (IOGPUMemoryInfo)memoryInfo
{
  return (IOGPUMemoryInfo *)_ioGPUMemoryInfo;
}

+ (void)registerDevices
{
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  if ([(_MTLDevice *)self requiresRaytracingEmulation])
  {
    uint64_t v6 = [(IOGPUMetalDevice *)self newBufferWithLength:a3 options:32];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      unint64_t v8 = [[IOGPUMetalAccelerationStructure alloc] initWithBuffer:v6 offset:0];

      return v8;
    }
  }
  else
  {
    [(IOGPUMetalDevice *)self doesNotRecognizeSelector:a2];
  }
  return 0;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  if ([(_MTLDevice *)self requiresRaytracingEmulation])
  {
    uint64_t v8 = [(IOGPUMetalDevice *)self newBufferWithLength:a3 options:32];
    if (v8)
    {
      objc_super v9 = (void *)v8;
      signed __int16 v10 = [[IOGPUMetalAccelerationStructure alloc] initWithBuffer:v8 offset:0 resourceIndex:a4];

      return v10;
    }
  }
  else
  {
    [(IOGPUMetalDevice *)self doesNotRecognizeSelector:a2];
  }
  return 0;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4
{
  if ([(_MTLDevice *)self requiresRaytracingEmulation])
  {
    if (!a3) {
      -[IOGPUMetalDevice newAccelerationStructureWithBuffer:offset:]();
    }
    uint64_t v8 = [IOGPUMetalAccelerationStructure alloc];
    return [(IOGPUMetalAccelerationStructure *)v8 initWithBuffer:a3 offset:a4];
  }
  else
  {
    [(IOGPUMetalDevice *)self doesNotRecognizeSelector:a2];
    return 0;
  }
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  if ([(_MTLDevice *)self requiresRaytracingEmulation])
  {
    if (!a3) {
      -[IOGPUMetalDevice newAccelerationStructureWithBuffer:offset:resourceIndex:]();
    }
    signed __int16 v10 = [IOGPUMetalAccelerationStructure alloc];
    return [(IOGPUMetalAccelerationStructure *)v10 initWithBuffer:a3 offset:a4 resourceIndex:a5];
  }
  else
  {
    [(IOGPUMetalDevice *)self doesNotRecognizeSelector:a2];
    return 0;
  }
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  if ([(_MTLDevice *)self requiresRaytracingEmulation])
  {
    id v6 = objc_alloc_init(MEMORY[0x263F12A88]);
    objc_msgSend(v6, "setFunctionCount:", objc_msgSend(a3, "functionCount"));
    objc_msgSend(v6, "setResourceIndex:", objc_msgSend(a3, "resourceIndex"));
    objc_msgSend(v6, "setForceResourceIndex:", objc_msgSend(a3, "forceResourceIndex"));
    uint64_t v7 = (void *)[(IOGPUMetalDevice *)self newVisibleFunctionTableWithDescriptor:v6];

    uint64_t v8 = [[IOGPUMetalIntersectionFunctionTable alloc] initWithVisibleFunctionTable:v7];
    return v8;
  }
  else
  {
    [(IOGPUMetalDevice *)self doesNotRecognizeSelector:a2];
    return 0;
  }
}

- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4
{
  if (self->_disableGPUIO)
  {
    v8.receiver = self;
    v8.super_class = (Class)IOGPUMetalDevice;
    return [(_MTLDevice *)&v8 newIOCommandQueueWithDescriptor:a3 error:a4];
  }
  else
  {
    uint64_t v7 = [IOGPUMetalIOCommandQueue alloc];
    return [(IOGPUMetalIOCommandQueue *)v7 initWithDevice:self descriptor:a3];
  }
}

- (id)newIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5
{
  if (self->_disableGPUIO)
  {
    v15.receiver = self;
    v15.super_class = (Class)IOGPUMetalDevice;
    return [(_MTLDevice *)&v15 newIOFileHandleWithURL:a3 compressionMethod:a4 error:a5];
  }
  if (![a3 isFileURL])
  {
    if (a5)
    {
      uint64_t v12 = [NSDictionary dictionaryWithObject:@"URL is not a file" forKey:*MEMORY[0x263F08320]];
      id v13 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v14 = (void *)[v13 initWithDomain:*MEMORY[0x263F126A0] code:1 userInfo:v12];
      id result = 0;
      *a5 = v14;
      return result;
    }
    return 0;
  }
  if (![a3 checkResourceIsReachableAndReturnError:a5]) {
    return 0;
  }
  signed __int16 v10 = [IOGPUMetalIOHandleCompressed alloc];
  uint64_t v11 = [a3 fileSystemRepresentation];
  return [(IOGPUMetalIOHandleCompressed *)v10 initWithDevice:self path:v11 compressionType:a4 error:a5 uncached:0];
}

- (id)newIOHandleWithURL:(id)a3 error:(id *)a4
{
  if (self->_disableGPUIO)
  {
    v13.receiver = self;
    v13.super_class = (Class)IOGPUMetalDevice;
    return [(_MTLDevice *)&v13 newIOFileHandleWithURL:a3 error:a4];
  }
  if (![a3 isFileURL])
  {
    if (a4)
    {
      uint64_t v10 = [NSDictionary dictionaryWithObject:@"URL is not a file" forKey:*MEMORY[0x263F08320]];
      id v11 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v12 = (void *)[v11 initWithDomain:*MEMORY[0x263F126A0] code:1 userInfo:v10];
      id result = 0;
      *a4 = v12;
      return result;
    }
    return 0;
  }
  if (![a3 checkResourceIsReachableAndReturnError:a4]) {
    return 0;
  }
  objc_super v8 = [IOGPUMetalIOHandleRaw alloc];
  uint64_t v9 = [a3 fileSystemRepresentation];
  return [(IOGPUMetalIOHandleRaw *)v8 initWithDevice:self path:v9 error:a4 uncached:0];
}

- (id)newUncachedIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5
{
  if (self->_disableGPUIO)
  {
    v15.receiver = self;
    v15.super_class = (Class)IOGPUMetalDevice;
    return [(_MTLDevice *)&v15 newUncachedIOFileHandleWithURL:a3 compressionMethod:a4 error:a5];
  }
  if (![a3 isFileURL])
  {
    if (a5)
    {
      uint64_t v12 = [NSDictionary dictionaryWithObject:@"URL is not a file" forKey:*MEMORY[0x263F08320]];
      id v13 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v14 = (void *)[v13 initWithDomain:*MEMORY[0x263F126A0] code:1 userInfo:v12];
      id result = 0;
      *a5 = v14;
      return result;
    }
    return 0;
  }
  if (![a3 checkResourceIsReachableAndReturnError:a5]) {
    return 0;
  }
  uint64_t v10 = [IOGPUMetalIOHandleCompressed alloc];
  uint64_t v11 = [a3 fileSystemRepresentation];
  return [(IOGPUMetalIOHandleCompressed *)v10 initWithDevice:self path:v11 compressionType:a4 error:a5 uncached:1];
}

- (id)newUncachedIOHandleWithURL:(id)a3 error:(id *)a4
{
  if (self->_disableGPUIO)
  {
    v13.receiver = self;
    v13.super_class = (Class)IOGPUMetalDevice;
    return [(_MTLDevice *)&v13 newUncachedIOFileHandleWithURL:a3 error:a4];
  }
  if (![a3 isFileURL])
  {
    if (a4)
    {
      uint64_t v10 = [NSDictionary dictionaryWithObject:@"URL is not a file" forKey:*MEMORY[0x263F08320]];
      id v11 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v12 = (void *)[v11 initWithDomain:*MEMORY[0x263F126A0] code:1 userInfo:v10];
      id result = 0;
      *a4 = v12;
      return result;
    }
    return 0;
  }
  if (![a3 checkResourceIsReachableAndReturnError:a4]) {
    return 0;
  }
  objc_super v8 = [IOGPUMetalIOHandleRaw alloc];
  uint64_t v9 = [a3 fileSystemRepresentation];
  return [(IOGPUMetalIOHandleRaw *)v8 initWithDevice:self path:v9 error:a4 uncached:1];
}

- (int)numCommandBuffers
{
  return self->_numCommandBuffers;
}

- (unsigned)acceleratorPort
{
  return self->_acceleratorPort;
}

- (void).cxx_destruct
{
}

- (void)initWithAcceleratorPort:options:.cold.1()
{
  __assert_rtn("-[IOGPUMetalDevice initWithAcceleratorPort:options:]", "IOGPUMetalDevice.m", 325, "(options & 0xffffULL) == options");
}

- (void)initWithAcceleratorPort:options:.cold.2()
{
  __assert_rtn("-[IOGPUMetalDevice initWithAcceleratorPort:options:]", "IOGPUMetalDevice.m", 395, "nil != _storageCreateParams.kernelCommandShmemPool");
}

- (void)initWithAcceleratorPort:options:.cold.3()
{
  __assert_rtn("-[IOGPUMetalDevice initWithAcceleratorPort:options:]", "IOGPUMetalDevice.m", 398, "nil != _storageCreateParams.segmentListShmemPool");
}

- (void)initWithAcceleratorPort:options:.cold.4()
{
  __assert_rtn("-[IOGPUMetalDevice initWithAcceleratorPort:options:]", "IOGPUMetalDevice.m", 401, "nil != _storageCreateParams.sidebandPool");
}

- (void)initWithAcceleratorPort:options:.cold.5()
{
  __assert_rtn("-[IOGPUMetalDevice initWithAcceleratorPort:options:]", "IOGPUMetalDevice.m", 404, "nil != _storageCreateParams.debugBufferShmemPool");
}

- (void)initWithAcceleratorPort:options:.cold.6()
{
}

- (void)setHwResourcePool:count:.cold.1()
{
}

- (void)setHwResourcePool:count:.cold.2()
{
}

- (void)deallocBufferSubData:heapIndex:bufferIndex:bufferOffset:length:.cold.1()
{
}

- (void)newAccelerationStructureWithBuffer:offset:.cold.1()
{
}

- (void)newAccelerationStructureWithBuffer:offset:resourceIndex:.cold.1()
{
}

@end