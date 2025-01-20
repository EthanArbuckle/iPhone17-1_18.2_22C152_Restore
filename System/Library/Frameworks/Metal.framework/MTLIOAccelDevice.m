@interface MTLIOAccelDevice
- (BOOL)hasUnifiedMemory;
- (BOOL)lazyInitialize;
- (BOOL)supportLazyInitialization;
- (BOOL)supportPriorityBand;
- (BOOL)supportsVertexAmplification;
- (BOOL)supportsVertexAmplificationCount:(unint64_t)a3;
- (MTLIOAccelDevice)initWithAcceleratorPort:(unsigned int)a3;
- (MTLIOMemoryInfo)memoryInfo;
- (__IOAccelDevice)deviceRef;
- (__IOAccelShared)sharedRef;
- (id)_deviceWrapper;
- (id)akPrivateResourceListPool;
- (id)akResourceListPool;
- (id)allocBufferSubDataWithLength:(unint64_t)a3 options:(unint64_t)a4 alignment:(unint64_t)a5 heapIndex:(signed __int16 *)a6 bufferIndex:(signed __int16 *)a7 bufferOffset:(unint64_t *)a8;
- (id)hwResourcePools;
- (id)indirectArgumentBufferDecodingData;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (id)newAccelerationStructureWithSize:(unint64_t)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4;
- (id)newCommandQueueWithDescriptor:(id)a3;
- (id)newEvent;
- (id)newEventWithOptions:(int64_t)a3;
- (id)newFence;
- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4;
- (id)newIOHandleWithURL:(id)a3 compressionMethod:(int64_t)a4 error:(id *)a5;
- (id)newIOHandleWithURL:(id)a3 error:(id *)a4;
- (id)newIndirectArgumentBufferLayoutWithStructType:(id)a3;
- (id)newIndirectArgumentEncoderWithLayout:(id)a3;
- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newUncachedIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5;
- (id)newUncachedIOHandleWithURL:(id)a3 error:(id *)a4;
- (int)numCommandBuffers;
- (signed)heapIndexWithOptions:(unint64_t)a3;
- (unint64_t)currentAllocatedSize;
- (unint64_t)dedicatedMemorySize;
- (unint64_t)maxBufferLength;
- (unint64_t)recommendedMaxWorkingSetSize;
- (unint64_t)registryID;
- (unint64_t)sharedMemorySize;
- (unsigned)acceleratorPort;
- (unsigned)hwResourcePoolCount;
- (unsigned)initialKernelCommandShmemSize;
- (unsigned)initialSegmentListShmemSize;
- (void)_purgeDevice;
- (void)_setDeviceWrapper:(id)a3;
- (void)dealloc;
- (void)deallocBufferSubData:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7;
- (void)kickCleanupQueue;
- (void)releaseFenceIndex:(unsigned int)a3;
- (void)setComputePipelineStateCommandShmemSize:(unsigned int)a3;
- (void)setHwResourcePool:(id *)a3 count:(int)a4;
- (void)setSegmentListShmemSize:(unsigned int)a3;
- (void)updateResourcePoolPurgeability;
@end

@implementation MTLIOAccelDevice

- (int)numCommandBuffers
{
  return atomic_load((unsigned int *)&self->_numCommandBuffers);
}

- (void)dealloc
{
  device_pool_cleanup_queue = self->_device_pool_cleanup_queue;
  if (device_pool_cleanup_queue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__MTLIOAccelDevice_dealloc__block_invoke;
    block[3] = &unk_1E521F9E8;
    block[4] = self;
    dispatch_sync(device_pool_cleanup_queue, block);
    dispatch_release((dispatch_object_t)self->_device_pool_cleanup_queue);
  }
  commandBufferStoragePool = self->_commandBufferStoragePool;
  if (commandBufferStoragePool) {
    MTLIOAccelCommandBufferStoragePoolDealloc(commandBufferStoragePool, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  device_dispatch_queue = self->_device_dispatch_queue;
  if (device_dispatch_queue) {
    dispatch_release(device_dispatch_queue);
  }
  sharedRef = self->_sharedRef;
  if (sharedRef) {
    CFRelease(sharedRef);
  }
  deviceRef = self->_deviceRef;
  if (deviceRef) {
    CFRelease(deviceRef);
  }

  self->_storageCreateParams.kernelCommandShmemPool = 0;
  self->_storageCreateParams.segmentListShmemPool = 0;
  if (self->_storageCreateParams.var0)
  {
    unint64_t v14 = 0;
    do
    {

      self->_storageCreateParams.hwResourcePools[v14++] = 0;
    }
    while (v14 < self->_storageCreateParams.var0);
  }
  self->_storageCreateParams.var0 = 0;
  free(self->_storageCreateParams.hwResourcePools);
  self->_storageCreateParams.hwResourcePools = 0;

  IOObjectRelease(self->_acceleratorPort);
  v15.receiver = self;
  v15.super_class = (Class)MTLIOAccelDevice;
  [(_MTLDevice *)&v15 dealloc];
}

void __27__MTLIOAccelDevice_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 54120);
  if (*(unsigned char *)(v2 + 54128)) {
    dispatch_source_cancel(v3);
  }
  else {
    dispatch_resume(v3);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 54128) = 0;
  dispatch_activate(*(dispatch_object_t *)(*(void *)(a1 + 32) + 54120));
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 54120);

  dispatch_release(v4);
}

- (void)setSegmentListShmemSize:(unsigned int)a3
{
  if (self->_storageCreateParams.segmentListShmemPool->_priv.shmemSize < a3)
  {
    uint64_t v4 = [[MTLIOAccelDeviceShmemPool alloc] initWithDevice:self resourceClass:objc_opt_class() shmemSize:*(void *)&a3 options:0];

    self->_storageCreateParams.segmentListShmemPool = v4;
  }
}

- (void)setComputePipelineStateCommandShmemSize:(unsigned int)a3
{
  p_storageCreateParams = &self->_storageCreateParams;
  if (self->_storageCreateParams.kernelCommandShmemPool->_priv.shmemSize < a3)
  {
    uint64_t v4 = [[MTLIOAccelDeviceShmemPool alloc] initWithDevice:self resourceClass:objc_opt_class() shmemSize:*(void *)&a3 options:0];

    p_storageCreateParams->kernelCommandShmemPool = v4;
  }
}

- (MTLIOAccelDevice)initWithAcceleratorPort:(unsigned int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTLIOAccelDevice;
  uint64_t v4 = [(_MTLDevice *)&v7 init];
  if (v4)
  {
    uint64_t v5 = IOAccelDeviceCreateWithAPIProperty();
    v4->_deviceRef = (__IOAccelDevice *)v5;
    if (!v5)
    {
LABEL_7:

      return 0;
    }
    IORegistryEntryGetRegistryEntryID(a3, &v4->_registryID);
    v4->_acceleratorPort = a3;
    IOObjectRetain(a3);
    v4->_storageCreateParams.hwResourcePools = 0;
    v4->_storageCreateParams.var0 = 0;
    IOAccelDeviceGetConfig64();
    IOAccelDeviceGetSharedMemorySize();
    v4->_videoRam = 0;
    v4->_textureRam = 0;
    v4->super._globalTraceObjectID = IOAccelDeviceGetGlobalTraceObjectID();
    if (*(_DWORD *)*MEMORY[0x1E4F6EC08]) {
      IOAccelDeviceTraceEvent();
    }
  }
  if (![(MTLIOAccelDevice *)v4 supportLazyInitialization]
    && ![(MTLIOAccelDevice *)v4 lazyInitialize])
  {
    goto LABEL_7;
  }
  return v4;
}

- (BOOL)lazyInitialize
{
  uint64_t v3 = (__IOAccelShared *)IOAccelSharedCreate();
  self->_sharedRef = v3;
  if (v3)
  {
    self->_storageCreateParams.akResourceListPool = [[MTLResourceListPool alloc] initWithResourceListCapacity:1024];
    self->_storageCreateParams.akPrivateResourceListPool = [[MTLResourceListPool alloc] initWithResourceListCapacity:256];
    self->_storageCreateParams.kernelCommandShmemPool = [[MTLIOAccelDeviceShmemPool alloc] initWithDevice:self resourceClass:objc_opt_class() shmemSize:[(MTLIOAccelDevice *)self initialKernelCommandShmemSize] options:0];
    self->_storageCreateParams.segmentListShmemPool = [[MTLIOAccelDeviceShmemPool alloc] initWithDevice:self resourceClass:objc_opt_class() shmemSize:[(MTLIOAccelDevice *)self initialSegmentListShmemSize] options:0];
    self->_segmentByteThreshold = 0;
    self->_device_dispatch_queue = (OS_dispatch_queue *)dispatch_queue_create("com.Metal.DeviceDispatchQueue", 0);
    MTLIOAccelCommandBufferStoragePoolCreate((uint64_t)self);
    self->_commandBufferStoragePool = (MTLIOAccelCommandBufferStoragePool *)v3;
    if (v3)
    {
      uint64_t v4 = (OS_dispatch_queue *)dispatch_queue_create("com.Metal.DeviceCleaupQueue", 0);
      self->_device_pool_cleanup_queue = v4;
      self->_device_pool_cleanup_source = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v4);
      self->_device_pool_cleanup_scheduled = 0;
      v8[0] = 0;
      v8[1] = v8;
      v8[2] = 0x3052000000;
      v8[3] = __Block_byref_object_copy__5;
      v8[4] = __Block_byref_object_dispose__5;
      v8[5] = self;
      device_pool_cleanup_source = self->_device_pool_cleanup_source;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __34__MTLIOAccelDevice_lazyInitialize__block_invoke;
      handler[3] = &unk_1E5220550;
      handler[4] = v8;
      dispatch_source_set_event_handler(device_pool_cleanup_source, handler);
      _Block_object_dispose(v8, 8);
      LOBYTE(v3) = 1;
    }
  }
  return (char)v3;
}

uint64_t __34__MTLIOAccelDevice_lazyInitialize__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) updateResourcePoolPurgeability];
}

- (BOOL)supportLazyInitialization
{
  return 0;
}

- (unsigned)initialKernelCommandShmemSize
{
  return 0x4000;
}

- (unsigned)initialSegmentListShmemSize
{
  return 0x4000;
}

- (void)setHwResourcePool:(id *)a3 count:(int)a4
{
  self->_storageCreateParams.hwResourcePools = (hwResourcePoolCount **)malloc_type_malloc(8 * a4, 0x80040B8603338uLL);
  if (a4 >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      self->_storageCreateParams.hwResourcePools[v7] = (hwResourcePoolCount *)a3[v7];
      ++v7;
    }
    while (a4 != v7);
  }
  self->_storageCreateParams.var0 = a4;
}

- (void)_purgeDevice
{
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelDevice;
  [(_MTLDevice *)&v5 _purgeDevice];
  MTLIOAccelCommandBufferStoragePoolPurge((os_unfair_lock_s *)self->_commandBufferStoragePool);
  p_storageCreateParams = &self->_storageCreateParams;
  [(MTLIOAccelDeviceShmemPool *)p_storageCreateParams->kernelCommandShmemPool purge];
  [(MTLIOAccelDeviceShmemPool *)p_storageCreateParams->segmentListShmemPool purge];
  [(MTLResourceListPool *)p_storageCreateParams->akResourceListPool purge];
  [(MTLResourceListPool *)p_storageCreateParams->akPrivateResourceListPool purge];
  if (p_storageCreateParams->var0)
  {
    unint64_t v4 = 0;
    do
      [(hwResourcePoolCount *)p_storageCreateParams->hwResourcePools[v4++] purge];
    while (v4 < p_storageCreateParams->var0);
  }
}

- (id)akResourceListPool
{
  return self->_storageCreateParams.akResourceListPool;
}

- (id)akPrivateResourceListPool
{
  return self->_storageCreateParams.akPrivateResourceListPool;
}

- (__IOAccelDevice)deviceRef
{
  return self->_deviceRef;
}

- (__IOAccelShared)sharedRef
{
  return self->_sharedRef;
}

- (unint64_t)registryID
{
  return self->_registryID;
}

- (id)hwResourcePools
{
  return (id *)self->_storageCreateParams.hwResourcePools;
}

- (unsigned)hwResourcePoolCount
{
  return self->_storageCreateParams.var0;
}

- (unint64_t)sharedMemorySize
{
  return self->_sharedMemorySize;
}

- (unint64_t)dedicatedMemorySize
{
  return self->_videoRam;
}

- (unint64_t)recommendedMaxWorkingSetSize
{
  unint64_t videoRam = self->_videoRam;
  if (!videoRam) {
    return self->_sharedMemorySize;
  }
  return videoRam;
}

- (BOOL)hasUnifiedMemory
{
  return 1;
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
  BOOL result = [(MTLIOAccelDevice *)self supportsVertexAmplification];
  if (a3 != 2) {
    return 0;
  }
  return result;
}

- (signed)heapIndexWithOptions:(unint64_t)a3
{
  return (a3 >> 3) & 0x1E | a3 & 0xF | (a3 >> 5) & 8;
}

- (id)allocBufferSubDataWithLength:(unint64_t)a3 options:(unint64_t)a4 alignment:(unint64_t)a5 heapIndex:(signed __int16 *)a6 bufferIndex:(signed __int16 *)a7 bufferOffset:(unint64_t *)a8
{
  unint64_t v12 = a4;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3052000000;
  v39 = __Block_byref_object_copy__5;
  v40 = __Block_byref_object_dispose__5;
  uint64_t v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  __int16 v35 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  __int16 v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  int v15 = [(MTLIOAccelDevice *)self heapIndexWithOptions:a4];
  signed __int16 v16 = v15;
  if (v15 < 0)
  {
    v20 = 0;
  }
  else
  {
    v37[5] = 0;
    *((_WORD *)v29 + 12) = -1;
    if ((v12 & 0xF0) == 0x20) {
      v12 |= 0x20000uLL;
    }
    device_dispatch_queue = self->_device_dispatch_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__MTLIOAccelDevice_allocBufferSubDataWithLength_options_alignment_heapIndex_bufferIndex_bufferOffset___block_invoke;
    block[3] = &unk_1E5220AC0;
    signed __int16 v23 = v16;
    block[4] = self;
    void block[5] = &v32;
    block[6] = &v24;
    block[7] = &v36;
    block[8] = &v28;
    block[9] = a3;
    block[10] = a5;
    block[11] = v12;
    dispatch_sync(device_dispatch_queue, block);
    v18 = v37;
    if (v37[5])
    {
      *a6 = v16;
      *a7 = *((_WORD *)v33 + 12);
      *a8 = v25[3];
      if ((v12 & 0x90000) == 0 && (__int16)v29[3] < 0)
      {
        uint64_t v19 = [(id)v18[5] virtualAddress];
        bzero((void *)(v19 + v25[3]), a3);
        v18 = v37;
      }
    }
    v20 = (void *)v18[5];
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  return v20;
}

void __102__MTLIOAccelDevice_allocBufferSubDataWithLength_options_alignment_heapIndex_bufferIndex_bufferOffset___block_invoke(uint64_t a1)
{
  if (!*(_DWORD *)(*(void *)(a1 + 32) + 728 + 3336 * *(__int16 *)(a1 + 96) + 3328))
  {
    *(_WORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    goto LABEL_11;
  }
  *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  int v2 = *(__int16 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2 <= 63)
  {
    do
    {
      uint64_t v3 = *(void *)(a1 + 32) + 728;
      unint64_t v4 = *(void **)(v3 + 3336 * *(__int16 *)(a1 + 96) + 8 * (__int16)v2);
      if (v4)
      {
        if (MTLRangeAllocatorAllocate(v3 + 3336 * *(__int16 *)(a1 + 96) + 40 * (__int16)v2 + 512, *(void *)(a1 + 72), (uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), *(void *)(a1 + 80)))
        {
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v4;
          break;
        }
      }
      else
      {
        uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
        if (*(__int16 *)(v5 + 24) < 0) {
          *(_WORD *)(v5 + 24) = v2;
        }
      }
      int v2 = (__int16)++*(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    while (v2 < 64);
  }
LABEL_11:
  if ((*(__int16 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) & 0x80000000) == 0
    && !*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) newBufferWithLength:0x20000 options:*(void *)(a1 + 88)];
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(_WORD *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
      *(void *)(*(void *)(a1 + 32)
                + 728
                + 3336 * *(__int16 *)(a1 + 96)
                + 8 * *(__int16 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                                                  + 40);
      MTLRangeAllocatorInit(*(void *)(a1 + 32)+ 728+ 3336 * *(__int16 *)(a1 + 96)+ 40 * *(__int16 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)+ 512, 0x1FFFFLL, 0, 0x80uLL);
      int v7 = *(__int16 *)(a1 + 96);
      uint64_t v8 = *(void *)(a1 + 32) + 728 + 3336 * *(__int16 *)(a1 + 96);
      ++*(_DWORD *)(v8 + 3328);
      if ((MTLRangeAllocatorAllocate(*(void *)(a1 + 32)+ 728+ 3336 * v7+ 40 * *(__int16 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)+ 512, *(void *)(a1 + 72), (uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), *(void *)(a1 + 80)) & 1) == 0)
      {
        *(void *)(*(void *)(a1 + 32)
                  + 728
                  + 3336 * *(__int16 *)(a1 + 96)
                  + 8 * *(__int16 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) = 0;
        uint64_t v9 = *(void *)(a1 + 32) + 728 + 3336 * *(__int16 *)(a1 + 96);
        --*(_DWORD *)(v9 + 3328);

        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = 0;
      }
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v6 = *(void *)(a1 + 32)
       + 728
       + 3336 * *(__int16 *)(a1 + 96)
       + 4 * *(__int16 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    ++*(_DWORD *)(v6 + 3072);
  }
}

- (void)deallocBufferSubData:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7
{
  device_dispatch_queue = self->_device_dispatch_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__MTLIOAccelDevice_deallocBufferSubData_heapIndex_bufferIndex_bufferOffset_length___block_invoke;
  block[3] = &unk_1E5220AE8;
  block[4] = a3;
  void block[5] = self;
  signed __int16 v9 = a4;
  signed __int16 v10 = a5;
  block[6] = a6;
  block[7] = a7;
  dispatch_sync(device_dispatch_queue, block);
}

void __83__MTLIOAccelDevice_deallocBufferSubData_heapIndex_bufferIndex_bufferOffset_length___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40) + 728;
  if (*(void *)(a1 + 32) == *(void *)(v1 + 3336 * *(__int16 *)(a1 + 64) + 8 * *(__int16 *)(a1 + 66)))
  {
    uint64_t v3 = (void **)(v1 + 3336 * *(__int16 *)(a1 + 64) + 40 * *(__int16 *)(a1 + 66) + 512);
    MTLRangeAllocatorDeallocate(v3, *(void *)(a1 + 48), *(void *)(a1 + 56));
    int v4 = *(__int16 *)(a1 + 64);
    uint64_t v5 = *(__int16 *)(a1 + 66);
    uint64_t v6 = *(void *)(a1 + 40) + 728 + 3336 * *(__int16 *)(a1 + 64) + 4 * v5;
    --*(_DWORD *)(v6 + 3072);
    uint64_t v7 = *(void *)(a1 + 40) + 728;
    if (!*(_DWORD *)(v7 + 3336 * v4 + 4 * v5 + 3072))
    {
      *(void *)(v7 + 3336 * v4 + 8 * v5) = 0;
      MTLRangeAllocatorDestroy(v3);
    }
    uint64_t v8 = *(void **)(a1 + 32);
  }
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  uint64_t v4 = [a3 maxCommandBufferCount];

  return [(_MTLDevice *)self newCommandQueueWithMaxCommandBufferCount:v4];
}

- (id)newFence
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  signed __int16 v9 = __Block_byref_object_copy__5;
  signed __int16 v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  device_dispatch_queue = self->_device_dispatch_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__MTLIOAccelDevice_newFence__block_invoke;
  v5[3] = &unk_1E521FDA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(device_dispatch_queue, v5);
  uint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

MTLIOAccelFence *__28__MTLIOAccelDevice_newFence__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  unsigned int v10 = *(_DWORD *)(v9 + 54132);
  unsigned int v11 = *(_DWORD *)(v9 + 54136);
  if (v10 >= v11)
  {
    if (v11) {
      unint64_t v12 = 2 * v11;
    }
    else {
      unint64_t v12 = 256;
    }
    if (IOAccelSharedAllocateFenceMemory() != v12)
    {
      v21 = "gotFenceCount == newFenceCount";
      uint64_t v22 = 1080;
LABEL_22:
      MTLReleaseAssertionFailure((uint64_t)"-[MTLIOAccelDevice newFence]_block_invoke", v22, (uint64_t)v21, 0, a5, a6, a7, a8, v23);
    }
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(unsigned int *)(v13 + 54144);
    *(void *)(v13 + 54152) = malloc_type_realloc(*(void **)(v13 + 54152), 8 * (v12 >> 6), 0x100004000313F17uLL);
    bzero((void *)(*(void *)(*(void *)(a1 + 32) + 54152) + 8 * v14), 8 * ((v12 >> 6) - v14));
    uint64_t v15 = *(void *)(a1 + 32);
    if (!*(_DWORD *)(v15 + 54136))
    {
      **(void **)(v15 + 54152) |= 1uLL;
      *(_DWORD *)(*(void *)(a1 + 32) + 54132) = 1;
      uint64_t v15 = *(void *)(a1 + 32);
    }
    *(_DWORD *)(v15 + 54136) = v12;
    *(_DWORD *)(*(void *)(a1 + 32) + 54144) = v12 >> 6;
    uint64_t v9 = *(void *)(a1 + 32);
    unsigned int v10 = *(_DWORD *)(v9 + 54132);
    unsigned int v11 = *(_DWORD *)(v9 + 54136);
  }
  if (v10 >= v11)
  {
    v21 = "_fenceAllocatedCount < _fenceMaximumCount";
    uint64_t v22 = 1098;
    goto LABEL_22;
  }
  uint64_t v16 = *(unsigned int *)(v9 + 54140);
  uint64_t v17 = *(unsigned int *)(v9 + 54144);
  if (v16 >= v17)
  {
    uint64_t v18 = 0;
  }
  else
  {
    while (1)
    {
      uint64_t v18 = *(void *)(*(void *)(v9 + 54152) + 8 * v16);
      if (v18 != -1) {
        break;
      }
      if (v17 == ++v16)
      {
        uint64_t v18 = -1;
        LODWORD(v16) = *(_DWORD *)(v9 + 54144);
        break;
      }
    }
  }
  if (v16 >= v11)
  {
    v21 = "searchIndex < _fenceMaximumCount";
    uint64_t v22 = 1110;
    goto LABEL_22;
  }
  *(_DWORD *)(v9 + 54140) = v16;
  int v19 = __clz(__rbit64(~v18));
  BOOL result = [[MTLIOAccelFence alloc] initWithDevice:*(void *)(a1 + 32) fenceIndex:(v19 + (v16 << 6))];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 54152) + 8 * v16) = (1 << v19) | v18;
    ++*(_DWORD *)(*(void *)(a1 + 32) + 54132);
  }
  return result;
}

- (void)releaseFenceIndex:(unsigned int)a3
{
  if (!a3 || self->_fenceMaximumCount <= a3) {
    MTLReleaseAssertionFailure((uint64_t)"-[MTLIOAccelDevice releaseFenceIndex:]", 1132, (uint64_t)"fenceIndex != 0 && fenceIndex < _fenceMaximumCount", 0, v3, v4, v5, v6, v8[0]);
  }
  device_dispatch_queue = self->_device_dispatch_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = (uint64_t)__38__MTLIOAccelDevice_releaseFenceIndex___block_invoke;
  v8[3] = (uint64_t)&unk_1E5220B10;
  unsigned int v9 = a3;
  v8[4] = (uint64_t)self;
  dispatch_sync(device_dispatch_queue, v8);
}

uint64_t __38__MTLIOAccelDevice_releaseFenceIndex___block_invoke(uint64_t result)
{
  unint64_t v1 = *(unsigned int *)(result + 40);
  unint64_t v2 = v1 >> 6;
  *(void *)(*(void *)(*(void *)(result + 32) + 54152) + 8 * v2) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                                + 54152)
                                                                                    + 8 * (v1 >> 6)) & ~(1 << v1);
  --*(_DWORD *)(*(void *)(result + 32) + 54132);
  uint64_t v3 = *(void *)(result + 32);
  if (v2 < *(_DWORD *)(v3 + 54140)) {
    *(_DWORD *)(v3 + 54140) = v2;
  }
  return result;
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
  id result = (id)[(MTLIOAccelDevice *)self newIndirectCommandBufferWithDescriptor:a3 maxCount:a4 options:a5];
  if (result)
  {
    id v8 = result;
    unsigned int v9 = [[MTLIOAccelIndirectCommandBuffer alloc] initWithBuffer:result descriptor:a3 maxCommandCount:a4];

    return v9;
  }
  return result;
}

- (id)indirectArgumentBufferDecodingData
{
  return 0;
}

- (BOOL)supportPriorityBand
{
  return (LOBYTE(self->_configBits) >> 6) & 1;
}

- (unint64_t)currentAllocatedSize
{
  if (IOAccelSharedGetAllocatedSize()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (id)newEvent
{
  if ((self->_configBits & 0x4000) != 0)
  {
    uint64_t v4 = [_MTLIOAccelMTLEvent alloc];
    return [(_MTLIOAccelMTLEvent *)v4 initWithDevice:self];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MTLIOAccelDevice;
    return [(_MTLDevice *)&v5 newEvent];
  }
}

- (id)newEventWithOptions:(int64_t)a3
{
  objc_super v5 = [_MTLIOAccelMTLEvent alloc];

  return [(_MTLIOAccelMTLEvent *)v5 initWithDevice:self options:a3];
}

- (unint64_t)maxBufferLength
{
  return 0;
}

- (void)kickCleanupQueue
{
  device_pool_cleanup_queue = self->_device_pool_cleanup_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MTLIOAccelDevice_kickCleanupQueue__block_invoke;
  block[3] = &unk_1E521F9E8;
  block[4] = self;
  dispatch_async(device_pool_cleanup_queue, block);
}

void __36__MTLIOAccelDevice_kickCleanupQueue__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 54128))
  {
    *(unsigned char *)(v1 + 54128) = 1;
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 54120);
    dispatch_time_t v4 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v3, v4, 0x3B9ACA00uLL, 0x5F5E100uLL);
    objc_super v5 = *(NSObject **)(*(void *)(a1 + 32) + 54120);
    dispatch_resume(v5);
  }
}

- (void)updateResourcePoolPurgeability
{
  if (self->_device_pool_cleanup_scheduled)
  {
    p_storageCreateParams = &self->_storageCreateParams;
    if (!self->_storageCreateParams.var0) {
      goto LABEL_6;
    }
    unint64_t v4 = 0;
    int v5 = 0;
    do
      v5 |= [(hwResourcePoolCount *)p_storageCreateParams->hwResourcePools[v4++] updateResourcePurgeability];
    while (v4 < p_storageCreateParams->var0);
    if ((v5 & 1) == 0)
    {
LABEL_6:
      dispatch_suspend((dispatch_object_t)self->_device_pool_cleanup_source);
      self->_device_pool_cleanup_scheduled = 0;
    }
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

- (MTLIOMemoryInfo)memoryInfo
{
  return (MTLIOMemoryInfo *)_memoryInfo;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  if ([(_MTLDevice *)self requiresRaytracingEmulation])
  {
    uint64_t v6 = [(MTLIOAccelDevice *)self newBufferWithLength:a3 options:32];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      id v8 = [[MTLIOAccelAccelerationStructure alloc] initWithBuffer:v6 offset:0];

      return v8;
    }
  }
  else
  {
    [(MTLIOAccelDevice *)self doesNotRecognizeSelector:a2];
  }
  return 0;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4
{
  if (![(_MTLDevice *)self requiresRaytracingEmulation])
  {
    [(MTLIOAccelDevice *)self doesNotRecognizeSelector:a2];
    return 0;
  }
  uint64_t v8 = -[MTLIOAccelDevice newBufferWithLength:options:](self, "newBufferWithLength:options:", a3, 16 * ([a4 storageMode] & 0xF));
  if (!v8) {
    return 0;
  }
  unsigned int v9 = (void *)v8;
  int v10 = [a4 forceResourceIndex];
  unsigned int v11 = [MTLIOAccelAccelerationStructure alloc];
  if (v10) {
    uint64_t v12 = -[MTLIOAccelAccelerationStructure initWithBuffer:offset:resourceIndex:](v11, "initWithBuffer:offset:resourceIndex:", v9, 0, [a4 resourceIndex]);
  }
  else {
    uint64_t v12 = [(MTLIOAccelAccelerationStructure *)v11 initWithBuffer:v9 offset:0];
  }
  uint64_t v13 = (void *)v12;

  return v13;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  if ([(_MTLDevice *)self requiresRaytracingEmulation])
  {
    uint64_t v8 = [(MTLIOAccelDevice *)self newBufferWithLength:a3 options:32];
    if (v8)
    {
      unsigned int v9 = (void *)v8;
      int v10 = [[MTLIOAccelAccelerationStructure alloc] initWithBuffer:v8 offset:0 resourceIndex:a4];

      return v10;
    }
  }
  else
  {
    [(MTLIOAccelDevice *)self doesNotRecognizeSelector:a2];
  }
  return 0;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4
{
  if (![(_MTLDevice *)self requiresRaytracingEmulation])
  {
    [(MTLIOAccelDevice *)self doesNotRecognizeSelector:a2];
    return 0;
  }
  if (!a3) {
    return 0;
  }
  uint64_t v8 = [MTLIOAccelAccelerationStructure alloc];

  return [(MTLIOAccelAccelerationStructure *)v8 initWithBuffer:a3 offset:a4];
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  if (![(_MTLDevice *)self requiresRaytracingEmulation])
  {
    [(MTLIOAccelDevice *)self doesNotRecognizeSelector:a2];
    return 0;
  }
  if (!a3) {
    return 0;
  }
  int v10 = [MTLIOAccelAccelerationStructure alloc];

  return [(MTLIOAccelAccelerationStructure *)v10 initWithBuffer:a3 offset:a4 resourceIndex:a5];
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  if ([(_MTLDevice *)self requiresRaytracingEmulation])
  {
    uint64_t v6 = objc_alloc_init(MTLVisibleFunctionTableDescriptor);
    -[MTLVisibleFunctionTableDescriptor setFunctionCount:](v6, "setFunctionCount:", [a3 functionCount]);
    -[MTLVisibleFunctionTableDescriptor setResourceIndex:](v6, "setResourceIndex:", [a3 resourceIndex]);
    -[MTLVisibleFunctionTableDescriptor setForceResourceIndex:](v6, "setForceResourceIndex:", [a3 forceResourceIndex]);
    uint64_t v7 = (void *)[(MTLIOAccelDevice *)self newVisibleFunctionTableWithDescriptor:v6];

    uint64_t v8 = [[MTLIOAccelIntersectionFunctionTable alloc] initWithVisibleFunctionTable:v7];
    return v8;
  }
  else
  {
    [(MTLIOAccelDevice *)self doesNotRecognizeSelector:a2];
    return 0;
  }
}

- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v6 = [MTLIOAccelIOCommandQueue alloc];

  return [(MTLIOAccelIOCommandQueue *)v6 initWithDevice:self descriptor:a3];
}

- (id)newIOHandleWithURL:(id)a3 compressionMethod:(int64_t)a4 error:(id *)a5
{
  if (![a3 isFileURL])
  {
    if (a5)
    {
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"URL is not a file" forKey:*MEMORY[0x1E4F28568]];
      *a5 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLIOError" code:1 userInfo:v12];
    }
    return 0;
  }
  if (![a3 checkResourceIsReachableAndReturnError:a5]) {
    return 0;
  }
  unsigned int v9 = [MTLIOAccelIOHandleCompressed alloc];
  uint64_t v10 = [a3 fileSystemRepresentation];

  return [(MTLIOAccelIOHandleCompressed *)v9 initWithDevice:self path:v10 compressionType:a4 error:a5 uncached:0];
}

- (id)newIOHandleWithURL:(id)a3 error:(id *)a4
{
  if (![a3 isFileURL])
  {
    if (a4)
    {
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"URL is not a file" forKey:*MEMORY[0x1E4F28568]];
      *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLIOError" code:1 userInfo:v10];
    }
    return 0;
  }
  if (![a3 checkResourceIsReachableAndReturnError:a4]) {
    return 0;
  }
  uint64_t v7 = [MTLIOAccelIOHandleRaw alloc];
  uint64_t v8 = [a3 fileSystemRepresentation];

  return [(MTLIOAccelIOHandleRaw *)v7 initWithDevice:self path:v8 error:a4 uncached:0];
}

- (id)newUncachedIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5
{
  if (![a3 isFileURL])
  {
    if (a5)
    {
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"URL is not a file" forKey:*MEMORY[0x1E4F28568]];
      *a5 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLIOError" code:1 userInfo:v12];
    }
    return 0;
  }
  if (![a3 checkResourceIsReachableAndReturnError:a5]) {
    return 0;
  }
  unsigned int v9 = [MTLIOAccelIOHandleCompressed alloc];
  uint64_t v10 = [a3 fileSystemRepresentation];

  return [(MTLIOAccelIOHandleCompressed *)v9 initWithDevice:self path:v10 compressionType:a4 error:a5 uncached:1];
}

- (id)newUncachedIOHandleWithURL:(id)a3 error:(id *)a4
{
  if (![a3 isFileURL])
  {
    if (a4)
    {
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"URL is not a file" forKey:*MEMORY[0x1E4F28568]];
      *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLIOError" code:1 userInfo:v10];
    }
    return 0;
  }
  if (![a3 checkResourceIsReachableAndReturnError:a4]) {
    return 0;
  }
  uint64_t v7 = [MTLIOAccelIOHandleRaw alloc];
  uint64_t v8 = [a3 fileSystemRepresentation];

  return [(MTLIOAccelIOHandleRaw *)v7 initWithDevice:self path:v8 error:a4 uncached:1];
}

- (unsigned)acceleratorPort
{
  return self->_acceleratorPort;
}

- (void).cxx_destruct
{
}

@end