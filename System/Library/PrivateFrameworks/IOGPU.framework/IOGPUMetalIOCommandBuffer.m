@interface IOGPUMetalIOCommandBuffer
- (BOOL)hasFollowOnWork;
- (BOOL)isCommitted;
- (BOOL)validateNotificationCount;
- (IOGPUMetalIOCommandBuffer)initWithQueue:(id)a3;
- (IOGPUMetalIOCommandBuffer)initWithQueue:(id)a3 resourceList:(id)a4 retained:(BOOL)a5;
- (id).cxx_construct;
- (unint64_t)globalTraceObjectID;
- (void)addBarrier;
- (void)barrierComplete:(int64_t)a3;
- (void)commit;
- (void)completeCommandCallbackBlocks;
- (void)dealloc;
- (void)didCompleteWithStatus:(int64_t)a3;
- (void)enqueue;
- (void)getCommandBufferBytes:(unsigned int)a3;
- (void)growKernelCommandBuffer:(unsigned int)a3;
- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7;
- (void)loadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6;
- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8 dstOrigin:(id *)a9 handle:(id)a10 handleOffset:(unint64_t)a11;
- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11;
- (void)setLabel:(id)a3;
- (void)signalEvent:(id)a3 value:(unint64_t)a4;
- (void)tryCancel;
- (void)validateNotificationCount;
- (void)waitForEvent:(id)a3 value:(unint64_t)a4;
@end

@implementation IOGPUMetalIOCommandBuffer

- (IOGPUMetalIOCommandBuffer)initWithQueue:(id)a3 resourceList:(id)a4 retained:(BOOL)a5
{
  BOOL v5 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[IOGPUMetalIOCommandBuffer initWithQueue:resourceList:retained:]();
  }
  v17.receiver = self;
  v17.super_class = (Class)IOGPUMetalIOCommandBuffer;
  v9 = [(_MTLIOCommandBuffer *)&v17 initWithQueue:a3 resourceList:a4 retained:v5];
  if (v9)
  {
    v9->_device = (MTLDevice *)(id)[a3 device];
    v10 = (IOGPUMetalIOCommandQueue *)a3;
    v9->_queue = v10;
    IOGPUIOCommandQueueCreateIOCommandBuffer((uint64_t)v10->_ioCommandQueueRef, &v9->_commandBufferID, &v9->_globalTraceObjectID);
    if (!v9->_commandBufferID) {
      goto LABEL_9;
    }
    Shmem = (IOGPUMetalDeviceShmem *)IOGPUMetalDeviceShmemPoolCreateShmem(*((void *)v9->_device + 92));
    v9->_ioKernelCommandShmem = Shmem;
    if (!Shmem) {
      goto LABEL_9;
    }
    v9->_ioKernelCommandShmemStart = (char *)Shmem->_virtualAddress;
    v9->_ioKernelCommandShmemEnd = (char *)v9->_ioKernelCommandShmem->_virtualAddress
                                 + v9->_ioKernelCommandShmem->_shmemSize;
    v9->_ioKernelCommandShmemCurrent = (char *)v9->_ioKernelCommandShmem->_virtualAddress;
    v9->_commandListHeader = (IOGPUIOKernelCommandListHeader *)v9->_ioKernelCommandShmemStart;
    uint64_t v12 = (uint64_t)(v9->_ioKernelCommandShmemCurrent + 8);
    v9->_ioKernelCommandShmemCurrent = (char *)v12;
    LODWORD(v12) = v12 - LODWORD(v9->_ioKernelCommandShmemStart);
    commandListHeader = v9->_commandListHeader;
    commandListHeader->var0 = v12;
    commandListHeader->var1 = v12;
    dispatch_group_t v14 = dispatch_group_create();
    v9->_ioCompletionGroup = (OS_dispatch_group *)v14;
    if (!v14) {
      goto LABEL_9;
    }
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v9->_stagingBuffers = v15;
    if (v15)
    {
      if (*(_DWORD *)__globalGPUCommPage) {
        IOGPUDeviceTraceEvent();
      }
    }
    else
    {
LABEL_9:

      return 0;
    }
  }
  return v9;
}

- (IOGPUMetalIOCommandBuffer)initWithQueue:(id)a3
{
  return [(IOGPUMetalIOCommandBuffer *)self initWithQueue:a3 resourceList:0 retained:0];
}

- (void)dealloc
{
  ioCompletionGroup = self->_ioCompletionGroup;
  if (ioCompletionGroup)
  {
    dispatch_release(ioCompletionGroup);
    self->_ioCompletionGroup = 0;
  }

  self->_stagingBuffers = 0;
  gpuBlitEncoder = self->_gpuBlitEncoder;
  if (gpuBlitEncoder)
  {
    [(MTLBlitCommandEncoder *)gpuBlitEncoder endEncoding];

    self->_gpuBlitEncoder = 0;
  }
  gpuCommandBuffer = self->_gpuCommandBuffer;
  if (gpuCommandBuffer)
  {

    self->_gpuCommandBuffer = 0;
  }
  ioKernelCommandShmem = (os_unfair_lock_s *)self->_ioKernelCommandShmem;
  if (ioKernelCommandShmem)
  {
    IOGPUMetalDeviceShmemRelease(ioKernelCommandShmem);
    self->_ioKernelCommandShmem = 0;
  }
  IOGPUIOCommandQueueDestroyIOCommandBuffer(self->_queue->_ioCommandQueueRef, self->_commandBufferID);
  self->_commandBufferID = 0;

  self->_queue = 0;
  self->_device = 0;
  v7.receiver = self;
  v7.super_class = (Class)IOGPUMetalIOCommandBuffer;
  [(_MTLIOCommandBuffer *)&v7 dealloc];
}

- (void)loadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6
{
  v11 = (objc_class *)[a5 stagingBufferSize:a4 offset:a6];
  uint64_t v12 = (int)*MEMORY[0x263F12BC8];
  uint64_t v13 = (int)*MEMORY[0x263F12BD8];
  if (*(Class *)((char *)&self->super.super.super.isa + v13) >= v11)
  {
    id v14 = *(Class *)((char *)&self->super.super.super.isa + v12);
  }
  else
  {
    id v14 = [(_MTLIOCommandBuffer *)self getReusableScratchBuffer:v11];
    if (!v14)
    {
      v31 = (void *)[(MTLIOScratchBufferAllocator *)[(_MTLIOCommandQueue *)self->_queue scratchBufferAllocator] newScratchBufferWithMinimumSize:v11];
      id v14 = v31;
      if (!v31 || objc_msgSend((id)objc_msgSend(v31, "buffer"), "allocatedSize") < (unint64_t)v11)
      {

        *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12C00]) = (Class)1;
        return;
      }
      MTLResourceListAddResource();
    }
    v15 = (objc_class *)objc_msgSend((id)objc_msgSend(v14, "buffer"), "allocatedSize");
    *(Class *)((char *)&self->super.super.super.isa + v13) = v15;
    if (v15 < v11) {
      -[IOGPUMetalIOCommandBuffer loadBytes:size:sourceHandle:sourceHandleOffset:]();
    }
    *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12BD0]) = 0;
    *(Class *)((char *)&self->super.super.super.isa + v12) = (Class)v14;
  }
  v16 = [(IOGPUMetalIOCommandBuffer *)self getCommandBufferBytes:56];
  void *v16 = 0x3800000000;
  bzero(v16 + 1, 0x30uLL);
  *((_DWORD *)v16 + 2) = [a5 vnioID];
  if (v11)
  {
    v16[2] = [a5 getHandleOffset:a4 offset:a6];
    v16[3] = v11;
    uint64_t v17 = objc_msgSend((id)objc_msgSend(v14, "buffer"), "contents");
    uint64_t v18 = (int)*MEMORY[0x263F12BD0];
    v19 = *(char **)((char *)&self->super.super.super.isa + v18) + v17;
    unint64_t v20 = [(IOGPUMetalIOCommandQueue *)self->_queue globalTraceObjectID];
    v16[4] = v19;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __76__IOGPUMetalIOCommandBuffer_loadBytes_size_sourceHandle_sourceHandleOffset___block_invoke;
    v37[3] = &unk_26441A980;
    v37[4] = self;
    v37[5] = a5;
    v37[6] = v20;
    v37[7] = a3;
    v37[8] = a4;
    v37[9] = a6;
    v37[10] = v19;
    v37[11] = v11;
    v21 = _Block_copy(v37);
    v16[6] = v21;
    p_commandCallbackBlocks = &self->_commandCallbackBlocks;
    Class isa = self[1].super.super.super.isa;
    label = self[1].super.super._label;
    if (isa >= (Class)label)
    {
      uint64_t v26 = (isa - p_commandCallbackBlocks->__begin_) >> 3;
      if ((unint64_t)(v26 + 1) >> 61) {
        std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v27 = (char *)label - (char *)p_commandCallbackBlocks->__begin_;
      uint64_t v28 = v27 >> 2;
      if (v27 >> 2 <= (unint64_t)(v26 + 1)) {
        uint64_t v28 = v26 + 1;
      }
      if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v29 = v28;
      }
      if (v29)
      {
        v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSObject *>>((uint64_t)&self[1].super.super._label, v29);
        v21 = (void *)v16[6];
      }
      else
      {
        v30 = 0;
      }
      v32 = &v30[8 * v26];
      v33 = (NSString *)&v30[8 * v29];
      *(void *)v32 = v21;
      v25 = (objc_class *)(v32 + 8);
      begin = p_commandCallbackBlocks->__begin_;
      Class v34 = self[1].super.super.super.isa;
      if (v34 != p_commandCallbackBlocks->__begin_)
      {
        do
        {
          uint64_t v36 = *((void *)v34 - 1);
          Class v34 = (Class)((char *)v34 - 8);
          *((void *)v32 - 1) = v36;
          v32 -= 8;
        }
        while (v34 != begin);
        Class v34 = p_commandCallbackBlocks->__begin_;
      }
      p_commandCallbackBlocks->__begin_ = (?)"__end_"^(?)"__end_cap_"{__compressed_pair<IOGPUIOCommandQueueCommandBufferCallbackBlock *, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *)v32;
      self[1].super.super.super.Class isa = v25;
      self[1].super.super._label = v33;
      if (v34) {
        operator delete(v34);
      }
    }
    else
    {
      *(void *)Class isa = v21;
      v25 = (Class)((char *)isa + 8);
    }
    *(Class *)((char *)&self->super.super.super.isa + v18) = (Class)(*(char **)((char *)&self->super.super.super.isa
                                                                              + v18)
                                                                   + (unint64_t)v11);
    *(Class *)((char *)&self->super.super.super.isa + v13) = (Class)(*(char **)((char *)&self->super.super.super.isa
                                                                              + v13)
                                                                   - (unint64_t)v11);
    self[1].super.super.super.Class isa = v25;
    atomic_fetch_add((atomic_uint *volatile)&self->_notificationCount, 1u);
  }
  else
  {
    v16[2] = a6;
    v16[3] = a4;
    v16[4] = a3;
  }
  if (*((unsigned char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12BF8])) {
    MTLResourceListAddResource();
  }
}

void __76__IOGPUMetalIOCommandBuffer_loadBytes_size_sourceHandle_sourceHandleOffset___block_invoke(uint64_t a1, int a2)
{
  if (a2 == 3)
  {
    uint64_t v17 = v2;
    uint64_t v18 = v3;
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 410))
    {
      *(void *)(v5 + (int)*MEMORY[0x263F12C00]) = 1;
    }
    else
    {
      v6 = *(NSObject **)(v5 + 376);
      objc_super v7 = [*(id *)(v5 + 304) getDecompressionQueue];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __76__IOGPUMetalIOCommandBuffer_loadBytes_size_sourceHandle_sourceHandleOffset___block_invoke_2;
      v10[3] = &unk_26441A958;
      long long v11 = *(_OWORD *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = v8;
      long long v14 = *(_OWORD *)(a1 + 64);
      uint64_t v9 = *(void *)(a1 + 88);
      uint64_t v15 = *(void *)(a1 + 80);
      uint64_t v16 = v9;
      dispatch_group_async(v6, v7, v10);
    }
  }
}

unint64_t __76__IOGPUMetalIOCommandBuffer_loadBytes_size_sourceHandle_sourceHandleOffset___block_invoke_2(uint64_t a1)
{
  if (*(_DWORD *)__globalGPUCommPage) {
    IOGPUDeviceTraceEventStart();
  }
  unint64_t result = [*(id *)(a1 + 40) decompress:*(void *)(a1 + 56) size:*(void *)(a1 + 64) offset:*(void *)(a1 + 72) stagingBuffer:*(void *)(a1 + 80) stagingBufferSize:*(void *)(a1 + 88)];
  if (result == -1 || result < *(void *)(a1 + 64)) {
    *(void *)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F12C00]) = 2;
  }
  if (*(_DWORD *)__globalGPUCommPage)
  {
    return IOGPUDeviceTraceEventEnd();
  }
  return result;
}

- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7
{
  id v11 = a3;
  uint64_t v66 = [a3 storageMode];
  if (v66 == 2) {
    unint64_t v13 = a5;
  }
  else {
    unint64_t v13 = 0;
  }
  uint64_t v14 = [a6 stagingBufferSize:a5 offset:a7];
  unint64_t v15 = v13 + v14;
  uint64_t v16 = (int)*MEMORY[0x263F12BC8];
  unint64_t v64 = a4;
  uint64_t v65 = (int)*MEMORY[0x263F12BD8];
  if (*(Class *)((char *)&self->super.super.super.isa + v65) >= (Class)(v13 + v14))
  {
    v63 = *(Class *)((char *)&self->super.super.super.isa + v16);
  }
  else
  {
    uint64_t v17 = [(_MTLIOCommandBuffer *)self getReusableScratchBuffer:v15];
    if (!v17)
    {
      id v42 = v11;
      v43 = (void *)[(MTLIOScratchBufferAllocator *)[(_MTLIOCommandQueue *)self->_queue scratchBufferAllocator] newScratchBufferWithMinimumSize:v15];
      v44 = v43;
      if (!v43
        || (v45 = v43, unint64_t v46 = objc_msgSend((id)objc_msgSend(v43, "buffer"), "allocatedSize"), v44 = v45, v46 < v15))
      {

        *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12C00]) = (Class)1;
        return;
      }
      MTLResourceListAddResource();

      uint64_t v17 = (objc_class *)v45;
      id v11 = v42;
    }
    uint64_t v18 = v17;
    v19 = (objc_class *)objc_msgSend((id)-[objc_class buffer](v17, "buffer"), "allocatedSize");
    *(Class *)((char *)&self->super.super.super.isa + v65) = v19;
    if ((unint64_t)v19 < v15) {
      -[IOGPUMetalIOCommandBuffer loadBuffer:offset:size:sourceHandle:sourceHandleOffset:]();
    }
    *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12BD0]) = 0;
    v63 = v18;
    *(Class *)((char *)&self->super.super.super.isa + v16) = v18;
    a4 = v64;
  }
  unint64_t v20 = [(IOGPUMetalIOCommandBuffer *)self getCommandBufferBytes:56];
  *unint64_t v20 = 0x3800000000;
  bzero(v20 + 1, 0x30uLL);
  *((_DWORD *)v20 + 2) = [a6 vnioID];
  if (v14)
  {
    unint64_t v61 = v13 + v14;
    id v21 = a6;
    unint64_t v62 = a5;
    v20[2] = [a6 getHandleOffset:a5 offset:a7];
    v20[3] = v14;
    uint64_t v22 = objc_msgSend((id)-[objc_class buffer](v63, "buffer"), "contents");
    uint64_t v23 = (int)*MEMORY[0x263F12BD0];
    v24 = *(char **)((char *)&self->super.super.super.isa + v23) + v13 + v22;
    if (v66 == 2)
    {
      uint64_t v25 = objc_msgSend((id)-[objc_class buffer](v63, "buffer"), "contents");
      unint64_t v26 = *(unint64_t *)((char *)&self->super.super.super.isa + v23);
    }
    else
    {
      uint64_t v25 = [v11 contents];
      unint64_t v26 = v64;
    }
    unint64_t v29 = v25 + v26;
    unint64_t v30 = [(IOGPUMetalIOCommandQueue *)self->_queue globalTraceObjectID];
    uint64_t v31 = [v21 globalTraceObjectID];
    v20[4] = v24;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __84__IOGPUMetalIOCommandBuffer_loadBuffer_offset_size_sourceHandle_sourceHandleOffset___block_invoke;
    aBlock[3] = &unk_26441A9D0;
    aBlock[6] = v30;
    aBlock[7] = v31;
    aBlock[4] = self;
    aBlock[5] = v21;
    aBlock[8] = v29;
    a5 = v62;
    aBlock[9] = v62;
    aBlock[10] = a7;
    aBlock[11] = v24;
    aBlock[12] = v14;
    v32 = _Block_copy(aBlock);
    v20[6] = v32;
    p_commandCallbackBlocks = &self->_commandCallbackBlocks;
    Class isa = self[1].super.super.super.isa;
    label = self[1].super.super._label;
    if (isa >= (Class)label)
    {
      uint64_t v37 = (isa - p_commandCallbackBlocks->__begin_) >> 3;
      a4 = v64;
      if ((unint64_t)(v37 + 1) >> 61) {
        std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v38 = (char *)label - (char *)p_commandCallbackBlocks->__begin_;
      uint64_t v39 = v38 >> 2;
      if (v38 >> 2 <= (unint64_t)(v37 + 1)) {
        uint64_t v39 = v37 + 1;
      }
      if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v40 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v40 = v39;
      }
      if (v40)
      {
        v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSObject *>>((uint64_t)&self[1].super.super._label, v40);
        v32 = (void *)v20[6];
      }
      else
      {
        v41 = 0;
      }
      unint64_t v15 = v61;
      v47 = &v41[8 * v37];
      v48 = (NSString *)&v41[8 * v40];
      *(void *)v47 = v32;
      uint64_t v36 = (objc_class *)(v47 + 8);
      begin = p_commandCallbackBlocks->__begin_;
      Class v49 = self[1].super.super.super.isa;
      if (v49 != p_commandCallbackBlocks->__begin_)
      {
        do
        {
          uint64_t v51 = *((void *)v49 - 1);
          Class v49 = (Class)((char *)v49 - 8);
          *((void *)v47 - 1) = v51;
          v47 -= 8;
        }
        while (v49 != begin);
        Class v49 = p_commandCallbackBlocks->__begin_;
      }
      p_commandCallbackBlocks->__begin_ = (?)"__end_"^(?)"__end_cap_"{__compressed_pair<IOGPUIOCommandQueueCommandBufferCallbackBlock *, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *)v47;
      self[1].super.super.super.Class isa = v36;
      self[1].super.super._label = v48;
      if (v49) {
        operator delete(v49);
      }
    }
    else
    {
      *(void *)Class isa = v32;
      uint64_t v36 = (Class)((char *)isa + 8);
      unint64_t v15 = v61;
      a4 = v64;
    }
    self[1].super.super.super.Class isa = v36;
    atomic_fetch_add((atomic_uint *volatile)&self->_notificationCount, 1u);
  }
  else
  {
    v20[2] = a7;
    v20[3] = a5;
    if (v66 == 2)
    {
      uint64_t v27 = objc_msgSend((id)-[objc_class buffer](v63, "buffer"), "contents");
      uint64_t v28 = *(char **)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12BD0]) + v27;
    }
    else
    {
      uint64_t v28 = (char *)([v11 contents] + a4);
    }
    v20[4] = v28;
  }
  if (v66 == 2)
  {
    unint64_t v52 = v15;
    if (self->_hasFollowOnGPUWork)
    {
      unint64_t v53 = a5;
    }
    else
    {
      unint64_t v53 = a5;
      v55 = (MTLCommandBuffer *)(id)[(MTLCommandQueue *)[(_MTLIOCommandQueue *)self->_queue gpuQueue] commandBuffer];
      self->_gpuCommandBuffer = v55;
      if (!v55) {
        -[IOGPUMetalIOCommandBuffer loadBuffer:offset:size:sourceHandle:sourceHandleOffset:]();
      }
      v56 = (MTLBlitCommandEncoder *)(id)[(MTLCommandBuffer *)v55 blitCommandEncoder];
      self->_gpuBlitEncoder = v56;
      if (!v56) {
        -[IOGPUMetalIOCommandBuffer loadBuffer:offset:size:sourceHandle:sourceHandleOffset:]();
      }
      self->_hasFollowOnGPUWork = 1;
    }
    gpuBlitEncoder = self->_gpuBlitEncoder;
    v58 = v63;
    if (!gpuBlitEncoder)
    {
      v59 = (MTLBlitCommandEncoder *)(id)[(MTLCommandBuffer *)self->_gpuCommandBuffer blitCommandEncoder];
      v58 = v63;
      gpuBlitEncoder = v59;
      self->_gpuBlitEncoder = v59;
      if (!v59) {
        -[IOGPUMetalIOCommandBuffer loadBuffer:offset:size:sourceHandle:sourceHandleOffset:].cold.4();
      }
    }
    uint64_t v60 = [(objc_class *)v58 buffer];
    uint64_t v54 = (int)*MEMORY[0x263F12BD0];
    [(MTLBlitCommandEncoder *)gpuBlitEncoder copyFromBuffer:v60 sourceOffset:*(Class *)((char *)&self->super.super.super.isa + v54) toBuffer:v11 destinationOffset:a4 size:v53];
    unint64_t v15 = v52;
  }
  else
  {
    uint64_t v54 = (int)*MEMORY[0x263F12BD0];
  }
  *(Class *)((char *)&self->super.super.super.isa + v54) = (Class)(*(char **)((char *)&self->super.super.super.isa + v54)
                                                                 + v15);
  *(Class *)((char *)&self->super.super.super.isa + v65) = (Class)(*(char **)((char *)&self->super.super.super.isa + v65)
                                                                 - v15);
  if (*((unsigned char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12BF8]))
  {
    MTLResourceListAddResource();
    MTLResourceListAddResource();
  }
}

void __84__IOGPUMetalIOCommandBuffer_loadBuffer_offset_size_sourceHandle_sourceHandleOffset___block_invoke(uint64_t a1, int a2)
{
  if (a2 == 3)
  {
    uint64_t v17 = v2;
    uint64_t v18 = v3;
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 410))
    {
      *(void *)(v5 + (int)*MEMORY[0x263F12C00]) = 1;
    }
    else
    {
      v6 = *(NSObject **)(v5 + 376);
      objc_super v7 = [*(id *)(v5 + 304) getDecompressionQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __84__IOGPUMetalIOCommandBuffer_loadBuffer_offset_size_sourceHandle_sourceHandleOffset___block_invoke_2;
      block[3] = &unk_26441A9A8;
      long long v8 = *(_OWORD *)(a1 + 32);
      long long v12 = *(_OWORD *)(a1 + 48);
      long long v11 = v8;
      uint64_t v13 = *(void *)(a1 + 64);
      long long v14 = *(_OWORD *)(a1 + 72);
      uint64_t v9 = *(void *)(a1 + 96);
      uint64_t v15 = *(void *)(a1 + 88);
      uint64_t v16 = v9;
      dispatch_group_async(v6, v7, block);
    }
  }
}

unint64_t __84__IOGPUMetalIOCommandBuffer_loadBuffer_offset_size_sourceHandle_sourceHandleOffset___block_invoke_2(uint64_t a1)
{
  if (*(_DWORD *)__globalGPUCommPage) {
    IOGPUDeviceTraceEventStart();
  }
  unint64_t result = [*(id *)(a1 + 40) decompress:*(void *)(a1 + 64) size:*(void *)(a1 + 72) offset:*(void *)(a1 + 80) stagingBuffer:*(void *)(a1 + 88) stagingBufferSize:*(void *)(a1 + 96)];
  if (result == -1 || result < *(void *)(a1 + 72)) {
    *(void *)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F12C00]) = 2;
  }
  if (*(_DWORD *)__globalGPUCommPage)
  {
    return IOGPUDeviceTraceEventEnd();
  }
  return result;
}

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11
{
  unint64_t v109 = 0;
  uint64_t v110 = 0;
  long long v107 = *(_OWORD *)&a9->var0;
  uint64_t v108 = 0;
  long long v105 = *(_OWORD *)&a6->var0;
  uint64_t v106 = 1;
  MTLCalculateSourceBufferSizeAndAlignment();
  v102 = 0;
  v103 = 0;
  unint64_t v104 = 0;
  unint64_t v83 = [(IOGPUMetalIOCommandQueue *)self->_queue globalTraceObjectID];
  uint64_t v82 = [a10 globalTraceObjectID];
  if (a6->var2)
  {
    for (unint64_t i = 0; i < a6->var2; ++i)
    {
      uint64_t v14 = [a10 stagingBufferSize:v110 offset:a11];
      unint64_t v15 = v109;
      uint64_t v16 = (objc_class *)(v110 + v109 + v14);
      uint64_t v17 = (int)*MEMORY[0x263F12BC8];
      uint64_t v18 = (int)*MEMORY[0x263F12BD8];
      v91 = v16;
      uint64_t v89 = v18;
      if (*(Class *)((char *)&self->super.super.super.isa + v18) >= v16)
      {
        id v19 = *(Class *)((char *)&self->super.super.super.isa + v17);
        uint64_t v22 = (int)*MEMORY[0x263F12BD0];
      }
      else
      {
        id v19 = [(_MTLIOCommandBuffer *)self getReusableScratchBuffer:v16];
        if (!v19)
        {
          unint64_t v20 = (void *)[(MTLIOScratchBufferAllocator *)[(_MTLIOCommandQueue *)self->_queue scratchBufferAllocator] newScratchBufferWithMinimumSize:v16];
          id v19 = v20;
          if (!v20 || objc_msgSend((id)objc_msgSend(v20, "buffer"), "allocatedSize") < (unint64_t)v16)
          {

            *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12C00]) = (Class)1;
            goto LABEL_79;
          }
          MTLResourceListAddResource();
        }
        id v21 = (objc_class *)objc_msgSend((id)objc_msgSend(v19, "buffer"), "allocatedSize");
        *(Class *)((char *)&self->super.super.super.isa + v18) = v21;
        if (v21 < v16) {
          __assert_rtn("-[IOGPUMetalIOCommandBuffer loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:]", "IOGPUMetalIOCommandBuffer.mm", 534, "_currentStagingBufferRemainingBytes >= paddedStagingBufferSize");
        }
        uint64_t v22 = (int)*MEMORY[0x263F12BD0];
        *(Class *)((char *)&self->super.super.super.isa + v22) = 0;
        *(Class *)((char *)&self->super.super.super.isa + v17) = (Class)v19;
        unint64_t v15 = v109;
      }
      uint64_t v23 = *(uint64_t *)((char *)&self->super.super.super.isa + v22);
      v24 = [(IOGPUMetalIOCommandBuffer *)self getCommandBufferBytes:56];
      void *v24 = 0x3800000000;
      bzero(v24 + 1, 0x30uLL);
      unint64_t v25 = (v23 + v15 - 1) / v15 * v15;
      *((_DWORD *)v24 + 2) = [a10 vnioID];
      if (v14)
      {
        v24[2] = [a10 getHandleOffset:v110 offset:a11];
        v24[3] = v14;
        uint64_t v26 = objc_msgSend((id)objc_msgSend(v19, "buffer"), "contents");
        uint64_t v27 = v110;
        uint64_t v28 = objc_msgSend((id)objc_msgSend(v19, "buffer"), "contents");
        unint64_t v29 = v26 + v25 + v27;
        unint64_t v30 = v28 + v25;
        v24[4] = v29;
        if (a6->var2 < 2)
        {
          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 3221225472;
          aBlock[2] = __146__IOGPUMetalIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset___block_invoke;
          aBlock[3] = &unk_26441A9D0;
          aBlock[6] = v83;
          aBlock[7] = v82;
          aBlock[4] = self;
          aBlock[5] = a10;
          aBlock[8] = v28 + v25;
          aBlock[9] = v110;
          aBlock[10] = a11;
          aBlock[11] = v29;
          aBlock[12] = v14;
          Class v34 = _Block_copy(aBlock);
          v24[6] = v34;
          p_commandCallbackBlocks = &self->_commandCallbackBlocks;
          Class isa = self[1].super.super.super.isa;
          label = self[1].super.super._label;
          if (isa >= (Class)label)
          {
            uint64_t v43 = (isa - p_commandCallbackBlocks->__begin_) >> 3;
            if ((unint64_t)(v43 + 1) >> 61) {
              std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v44 = (char *)label - (char *)p_commandCallbackBlocks->__begin_;
            uint64_t v45 = v44 >> 2;
            if (v44 >> 2 <= (unint64_t)(v43 + 1)) {
              uint64_t v45 = v43 + 1;
            }
            if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v46 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v46 = v45;
            }
            if (v46)
            {
              v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSObject *>>((uint64_t)&self[1].super.super._label, v46);
              Class v34 = (void *)v24[6];
            }
            else
            {
              v47 = 0;
            }
            uint64_t v54 = &v47[8 * v43];
            *(void *)uint64_t v54 = v34;
            uint64_t v38 = (objc_class *)(v54 + 8);
            begin = p_commandCallbackBlocks->__begin_;
            Class v55 = self[1].super.super.super.isa;
            if (v55 != p_commandCallbackBlocks->__begin_)
            {
              do
              {
                uint64_t v57 = *((void *)v55 - 1);
                Class v55 = (Class)((char *)v55 - 8);
                *((void *)v54 - 1) = v57;
                v54 -= 8;
              }
              while (v55 != begin);
              Class v55 = p_commandCallbackBlocks->__begin_;
            }
            p_commandCallbackBlocks->__begin_ = (?)"__end_"^(?)"__end_cap_"{__compressed_pair<IOGPUIOCommandQueueCommandBufferCallbackBlock *, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *)v54;
            self[1].super.super.super.Class isa = v38;
            self[1].super.super._label = (NSString *)&v47[8 * v46];
            if (v55) {
              operator delete(v55);
            }
          }
          else
          {
            *(void *)Class isa = v34;
            uint64_t v38 = (Class)((char *)isa + 8);
          }
          self[1].super.super.super.Class isa = v38;
          atomic_fetch_add((atomic_uint *volatile)&self->_notificationCount, 1u);
        }
        else
        {
          unint64_t v84 = v25;
          unint64_t v31 = v110;
          v32 = v103;
          if ((unint64_t)v103 >= v104)
          {
            unint64_t v39 = 0xCCCCCCCCCCCCCCCDLL * (v103 - v102);
            unint64_t v40 = v39 + 1;
            if (v39 + 1 > 0x666666666666666) {
              std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
            }
            if (0x999999999999999ALL * ((uint64_t)(v104 - (void)v102) >> 3) > v40) {
              unint64_t v40 = 0x999999999999999ALL * ((uint64_t)(v104 - (void)v102) >> 3);
            }
            if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v104 - (void)v102) >> 3) >= 0x333333333333333) {
              unint64_t v41 = 0x666666666666666;
            }
            else {
              unint64_t v41 = v40;
            }
            if (v41) {
              id v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<IOGPUIODecompressionArgs>>((uint64_t)&v104, v41);
            }
            else {
              id v42 = 0;
            }
            v48 = (unint64_t *)&v42[40 * v39];
            unint64_t *v48 = v30;
            v48[1] = v31;
            v48[2] = a11;
            v48[3] = v29;
            v48[4] = v14;
            v50 = v102;
            Class v49 = v103;
            uint64_t v51 = (char *)v48;
            if (v103 == v102)
            {
              unint64_t v25 = v84;
            }
            else
            {
              unint64_t v25 = v84;
              do
              {
                long long v52 = *(_OWORD *)(v49 - 5);
                long long v53 = *(_OWORD *)(v49 - 3);
                *((void *)v51 - 1) = *(v49 - 1);
                *(_OWORD *)(v51 - 24) = v53;
                *(_OWORD *)(v51 - 40) = v52;
                v51 -= 40;
                v49 -= 5;
              }
              while (v49 != v50);
              Class v49 = v50;
            }
            v33 = v48 + 5;
            v102 = (unint64_t *)v51;
            v103 = v48 + 5;
            unint64_t v104 = (unint64_t)&v42[40 * v41];
            if (v49) {
              operator delete(v49);
            }
          }
          else
          {
            unint64_t *v103 = v30;
            v32[1] = v31;
            v32[2] = a11;
            v32[3] = v29;
            v33 = v32 + 5;
            v32[4] = v14;
            unint64_t v25 = v84;
          }
          v103 = v33;
        }
      }
      else
      {
        v24[2] = a11;
        v24[3] = v91;
        v24[4] = *(char **)((char *)&self->super.super.super.isa + v22)
               + objc_msgSend((id)objc_msgSend(v19, "buffer"), "contents");
      }
      if (!self->_hasFollowOnGPUWork)
      {
        v58 = (MTLCommandBuffer *)(id)[(MTLCommandQueue *)[(_MTLIOCommandQueue *)self->_queue gpuQueue] commandBuffer];
        self->_gpuCommandBuffer = v58;
        if (!v58)
        {
          int v80 = 627;
          v81 = "_gpuCommandBuffer";
          goto LABEL_87;
        }
        v59 = (MTLBlitCommandEncoder *)(id)[(MTLCommandBuffer *)v58 blitCommandEncoder];
        self->_gpuBlitEncoder = v59;
        if (!v59)
        {
          int v80 = 629;
LABEL_86:
          v81 = "_gpuBlitEncoder";
LABEL_87:
          __assert_rtn("-[IOGPUMetalIOCommandBuffer loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:]", "IOGPUMetalIOCommandBuffer.mm", v80, v81);
        }
        self->_hasFollowOnGPUWork = 1;
      }
      gpuBlitEncoder = self->_gpuBlitEncoder;
      if (!gpuBlitEncoder)
      {
        gpuBlitEncoder = (MTLBlitCommandEncoder *)(id)[(MTLCommandBuffer *)self->_gpuCommandBuffer blitCommandEncoder];
        self->_gpuBlitEncoder = gpuBlitEncoder;
        if (!gpuBlitEncoder)
        {
          int v80 = 637;
          goto LABEL_86;
        }
      }
      uint64_t v61 = [v19 buffer];
      long long v99 = *(_OWORD *)&a6->var0;
      uint64_t v100 = 1;
      unint64_t v62 = a9->var2 + i;
      long long v97 = *(_OWORD *)&a9->var0;
      unint64_t v98 = v62;
      [(MTLBlitCommandEncoder *)gpuBlitEncoder copyFromBuffer:v61 sourceOffset:v25 sourceBytesPerRow:a7 sourceBytesPerImage:a8 sourceSize:&v99 toTexture:a3 destinationSlice:a4 destinationLevel:a5 destinationOrigin:&v97];
      *(Class *)((char *)&self->super.super.super.isa + v22) = (Class)(*(char **)((char *)&self->super.super.super.isa
                                                                                + v22)
                                                                     + (unint64_t)v91);
      *(Class *)((char *)&self->super.super.super.isa + v89) = (Class)(*(char **)((char *)&self->super.super.super.isa
                                                                                + v89)
                                                                     - (unint64_t)v91);
      a11 += a8;
    }
  }
  if (v103 != v102)
  {
    v63 = [(IOGPUMetalIOCommandBuffer *)self getCommandBufferBytes:24];
    objc_class *v63 = (void *)0x1800000001;
    unint64_t v64 = v63 + 1;
    bzero(v63 + 1, 0x10uLL);
    v93[0] = MEMORY[0x263EF8330];
    v93[1] = 3321888768;
    v93[2] = __146__IOGPUMetalIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset___block_invoke_3;
    v93[3] = &unk_26CCFD038;
    v93[4] = self;
    v93[6] = v83;
    v93[7] = v82;
    __p = 0;
    v95 = 0;
    uint64_t v96 = 0;
    std::vector<IOGPUIODecompressionArgs>::__init_with_size[abi:ne180100]<IOGPUIODecompressionArgs*,IOGPUIODecompressionArgs*>(&__p, v102, (uint64_t)v103, 0xCCCCCCCCCCCCCCCDLL * (v103 - v102));
    v93[5] = a10;
    uint64_t v65 = _Block_copy(v93);
    *unint64_t v64 = v65;
    uint64_t v66 = &self->_commandCallbackBlocks;
    Class v67 = self[1].super.super.super.isa;
    v68 = self[1].super.super._label;
    if (v67 >= (Class)v68)
    {
      uint64_t v70 = (v67 - v66->__begin_) >> 3;
      if ((unint64_t)(v70 + 1) >> 61) {
        std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v71 = (char *)v68 - (char *)v66->__begin_;
      uint64_t v72 = v71 >> 2;
      if (v71 >> 2 <= (unint64_t)(v70 + 1)) {
        uint64_t v72 = v70 + 1;
      }
      if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v73 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v73 = v72;
      }
      if (v73)
      {
        v74 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSObject *>>((uint64_t)&self[1].super.super._label, v73);
        uint64_t v65 = *v64;
      }
      else
      {
        v74 = 0;
      }
      v75 = &v74[8 * v70];
      v76 = (NSString *)&v74[8 * v73];
      *(void *)v75 = v65;
      v69 = (objc_class *)(v75 + 8);
      v78 = v66->__begin_;
      Class v77 = self[1].super.super.super.isa;
      if (v77 != v66->__begin_)
      {
        do
        {
          uint64_t v79 = *((void *)v77 - 1);
          Class v77 = (Class)((char *)v77 - 8);
          *((void *)v75 - 1) = v79;
          v75 -= 8;
        }
        while (v77 != v78);
        Class v77 = v66->__begin_;
      }
      v66->__begin_ = (?)"__end_"^(?)"__end_cap_"{__compressed_pair<IOGPUIOCommandQueueCommandBufferCallbackBlock *, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *)v75;
      self[1].super.super.super.Class isa = v69;
      self[1].super.super._label = v76;
      if (v77) {
        operator delete(v77);
      }
    }
    else
    {
      *(void *)Class v67 = v65;
      v69 = (Class)((char *)v67 + 8);
    }
    self[1].super.super.super.Class isa = v69;
    atomic_fetch_add((atomic_uint *volatile)&self->_notificationCount, 1u);
    if (__p)
    {
      v95 = __p;
      operator delete(__p);
    }
  }
  if (*((unsigned char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12BF8]))
  {
    MTLResourceListAddResource();
    MTLResourceListAddResource();
  }
LABEL_79:
  if (v102)
  {
    v103 = v102;
    operator delete(v102);
  }
}

void __146__IOGPUMetalIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset___block_invoke(uint64_t a1, int a2)
{
  if (a2 == 3)
  {
    uint64_t v17 = v2;
    uint64_t v18 = v3;
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 410))
    {
      *(void *)(v5 + (int)*MEMORY[0x263F12C00]) = 1;
    }
    else
    {
      v6 = *(NSObject **)(v5 + 376);
      objc_super v7 = [*(id *)(v5 + 304) getDecompressionQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __146__IOGPUMetalIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset___block_invoke_2;
      block[3] = &unk_26441A9A8;
      long long v8 = *(_OWORD *)(a1 + 32);
      long long v12 = *(_OWORD *)(a1 + 48);
      long long v11 = v8;
      uint64_t v13 = *(void *)(a1 + 64);
      long long v14 = *(_OWORD *)(a1 + 72);
      uint64_t v9 = *(void *)(a1 + 96);
      uint64_t v15 = *(void *)(a1 + 88);
      uint64_t v16 = v9;
      dispatch_group_async(v6, v7, block);
    }
  }
}

unint64_t __146__IOGPUMetalIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset___block_invoke_2(uint64_t a1)
{
  if (*(_DWORD *)__globalGPUCommPage) {
    IOGPUDeviceTraceEventStart();
  }
  unint64_t result = [*(id *)(a1 + 40) decompress:*(void *)(a1 + 64) size:*(void *)(a1 + 72) offset:*(void *)(a1 + 80) stagingBuffer:*(void *)(a1 + 88) stagingBufferSize:*(void *)(a1 + 96)];
  if (result == -1 || result < *(void *)(a1 + 72)) {
    *(void *)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F12C00]) = 2;
  }
  if (*(_DWORD *)__globalGPUCommPage)
  {
    return IOGPUDeviceTraceEventEnd();
  }
  return result;
}

void __146__IOGPUMetalIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset___block_invoke_3(uint64_t a1, int a2)
{
  if (a2 == 3)
  {
    uint64_t v13 = v2;
    uint64_t v14 = v3;
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 410))
    {
      *(void *)(v5 + (int)*MEMORY[0x263F12C00]) = 1;
    }
    else
    {
      v6 = *(NSObject **)(v5 + 376);
      objc_super v7 = [*(id *)(v5 + 304) getDecompressionQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3321888768;
      block[2] = __146__IOGPUMetalIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset___block_invoke_4;
      block[3] = &unk_26CCFD000;
      void block[4] = *(void *)(a1 + 32);
      long long v9 = *(_OWORD *)(a1 + 48);
      long long v11 = 0;
      uint64_t v12 = 0;
      __p = 0;
      std::vector<IOGPUIODecompressionArgs>::__init_with_size[abi:ne180100]<IOGPUIODecompressionArgs*,IOGPUIODecompressionArgs*>(&__p, *(const void **)(a1 + 64), *(void *)(a1 + 72), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 3));
      block[5] = *(void *)(a1 + 40);
      dispatch_group_async(v6, v7, block);
      if (__p)
      {
        long long v11 = __p;
        operator delete(__p);
      }
    }
  }
}

unint64_t __146__IOGPUMetalIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset___block_invoke_4(unint64_t result)
{
  unint64_t v1 = result;
  if (*(_DWORD *)__globalGPUCommPage) {
    unint64_t result = IOGPUDeviceTraceEventStart();
  }
  uint64_t v2 = -858993459 * ((*(void *)(v1 + 72) - *(void *)(v1 + 64)) >> 3);
  if (v2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 40 * v2;
    while (1)
    {
      uint64_t v5 = (void *)(*(void *)(v1 + 64) + v3);
      unint64_t v6 = v5[1];
      unint64_t result = [*(id *)(v1 + 40) decompress:*v5 size:v6 offset:v5[2] stagingBuffer:v5[3] stagingBufferSize:v5[4]];
      if (result == -1 || result < v6) {
        break;
      }
      v3 += 40;
      if (v4 == v3) {
        goto LABEL_11;
      }
    }
    *(void *)(*(void *)(v1 + 32) + (int)*MEMORY[0x263F12C00]) = 2;
  }
LABEL_11:
  if (*(_DWORD *)__globalGPUCommPage)
  {
    return IOGPUDeviceTraceEventEnd();
  }
  return result;
}

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8 dstOrigin:(id *)a9 handle:(id)a10 handleOffset:(unint64_t)a11
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = *a9;
  [(IOGPUMetalIOCommandBuffer *)self loadTexture:a3 slice:a4 level:a5 size:&v12 sourceBytesPerRow:a7 sourceBytesPerImage:a8 destinationOrigin:&v11 sourceHandle:a10 sourceHandleOffset:a11];
}

- (void)barrierComplete:(int64_t)a3
{
}

- (void)addBarrier
{
  uint64_t v3 = [(IOGPUMetalIOCommandBuffer *)self getCommandBufferBytes:24];
  *(void *)uint64_t v3 = 0x1800000001;
  uint64_t v4 = v3 + 8;
  bzero(v3 + 8, 0x10uLL);
  if (self->_hasFollowOnGPUWork)
  {
    unint64_t v5 = [(IOGPUMetalIOCommandQueue *)self->_queue globalTraceObjectID];
    uint64_t v6 = [(MTLCommandBuffer *)self->_gpuCommandBuffer globalTraceObjectID];
    gpuBlitEncoder = self->_gpuBlitEncoder;
    if (gpuBlitEncoder)
    {
      [(MTLBlitCommandEncoder *)gpuBlitEncoder endEncoding];

      self->_gpuBlitEncoder = 0;
    }
    gpuCommandBuffer = self->_gpuCommandBuffer;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke;
    v30[3] = &unk_26441A9F8;
    v30[4] = self;
    [(MTLCommandBuffer *)gpuCommandBuffer addCompletedHandler:v30];
    long long v9 = self->_gpuCommandBuffer;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke_2;
    aBlock[3] = &unk_26441AA48;
    aBlock[4] = self;
    aBlock[5] = v9;
    aBlock[6] = v5;
    aBlock[7] = v6;
    *((void *)v3 + 1) = _Block_copy(aBlock);
    v3[16] = 1;
    atomic_fetch_add((atomic_uint *volatile)&self->_notificationCount, 1u);

    self->_gpuCommandBuffer = 0;
    self->_hasFollowOnGPUWork = 0;
  }
  else
  {
    unsigned int lastBarrierNotificationCount = self->_lastBarrierNotificationCount;
    p_notificationCount = &self->_notificationCount;
    unsigned int v12 = atomic_load(&self->_notificationCount);
    if (lastBarrierNotificationCount != v12)
    {
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke_4;
      v28[3] = &unk_26441AA70;
      v28[4] = self;
      *((void *)v3 + 1) = _Block_copy(v28);
      v3[16] = 1;
      atomic_fetch_add((atomic_uint *volatile)p_notificationCount, 1u);
      unsigned int v13 = atomic_load(p_notificationCount);
      self->_unsigned int lastBarrierNotificationCount = v13;
    }
  }
  p_commandCallbackBlocks = &self->_commandCallbackBlocks;
  Class isa = self[1].super.super.super.isa;
  label = self[1].super.super._label;
  if (isa >= (Class)label)
  {
    uint64_t v18 = (isa - p_commandCallbackBlocks->__begin_) >> 3;
    if ((unint64_t)(v18 + 1) >> 61) {
      std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v19 = (char *)label - (char *)p_commandCallbackBlocks->__begin_;
    uint64_t v20 = v19 >> 2;
    if (v19 >> 2 <= (unint64_t)(v18 + 1)) {
      uint64_t v20 = v18 + 1;
    }
    if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v21 = v20;
    }
    if (v21) {
      uint64_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSObject *>>((uint64_t)&self[1].super.super._label, v21);
    }
    else {
      uint64_t v22 = 0;
    }
    uint64_t v23 = &v22[8 * v18];
    v24 = (NSString *)&v22[8 * v21];
    *(void *)uint64_t v23 = *v4;
    uint64_t v17 = (objc_class *)(v23 + 8);
    begin = p_commandCallbackBlocks->__begin_;
    Class v25 = self[1].super.super.super.isa;
    if (v25 != p_commandCallbackBlocks->__begin_)
    {
      do
      {
        uint64_t v27 = *((void *)v25 - 1);
        Class v25 = (Class)((char *)v25 - 8);
        *((void *)v23 - 1) = v27;
        v23 -= 8;
      }
      while (v25 != begin);
      Class v25 = p_commandCallbackBlocks->__begin_;
    }
    p_commandCallbackBlocks->__begin_ = (?)"__end_"^(?)"__end_cap_"{__compressed_pair<IOGPUIOCommandQueueCommandBufferCallbackBlock *, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *)v23;
    self[1].super.super.super.Class isa = v17;
    self[1].super.super._label = v24;
    if (v25) {
      operator delete(v25);
    }
  }
  else
  {
    *(void *)Class isa = *v4;
    uint64_t v17 = (Class)((char *)isa + 8);
  }
  self[1].super.super.super.Class isa = v17;
  [(_MTLIOCommandBuffer *)self reuseActiveScratchBuffers];
}

uint64_t __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if ([a2 status] == 4) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 2;
  }
  return [v2 barrierComplete:v3];
}

void __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke_2(uint64_t a1, int a2)
{
  if (a2 != 3)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v3 + 410))
    {
      uint64_t v7 = (int)*MEMORY[0x263F12C00];
      *(void *)(v3 + v7) = 1;
      [*(id *)(a1 + 32) barrierComplete:*(void *)(*(void *)(a1 + 32) + v7)];
      if (*(_DWORD *)__globalGPUCommPage)
      {
        IOGPUDeviceTraceEvent();
      }
    }
    else
    {
      uint64_t v4 = *(NSObject **)(v3 + 376);
      unint64_t v5 = [*(id *)(v3 + 304) getDecompressionQueue];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke_3;
      v8[3] = &unk_26441AA20;
      long long v6 = *(_OWORD *)(a1 + 48);
      int8x16_t v9 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
      long long v10 = v6;
      dispatch_group_async(v4, v5, v8);
    }
  }
}

uint64_t __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) commit];
  if (*(_DWORD *)__globalGPUCommPage) {
    IOGPUDeviceTraceEvent();
  }
  uint64_t result = [*(id *)(a1 + 32) waitUntilCompleted];
  if (*(_DWORD *)__globalGPUCommPage)
  {
    return IOGPUDeviceTraceEvent();
  }
  return result;
}

void __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke_4(uint64_t a1, int a2)
{
  if (a2 != 3)
  {
    block[7] = v2;
    block[8] = v3;
    uint64_t v5 = *(void *)(a1 + 32);
    long long v6 = *(NSObject **)(v5 + 376);
    uint64_t v7 = [*(id *)(v5 + 304) getDecompressionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke_5;
    block[3] = &unk_26441A5F0;
    void block[4] = *(void *)(a1 + 32);
    dispatch_group_async(v6, v7, block);
  }
}

uint64_t __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke_5(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) barrierComplete:3];
  if (*(_DWORD *)__globalGPUCommPage)
  {
    return IOGPUDeviceTraceEvent();
  }
  return result;
}

- (void)waitForEvent:(id)a3 value:(unint64_t)a4
{
  uint64_t v7 = [(IOGPUMetalIOCommandBuffer *)self getCommandBufferBytes:24];
  bzero(v7 + 1, 0x10uLL);
  *((_DWORD *)v7 + 2) = [a3 eventPort];
  v7[2] = a4;
  *uint64_t v7 = 0x1800000003;
  if (*((unsigned char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12BF8]))
  {
    MTLResourceListAddResource();
  }
}

- (void)signalEvent:(id)a3 value:(unint64_t)a4
{
  [(IOGPUMetalIOCommandBuffer *)self addBarrier];
  uint64_t v7 = [(IOGPUMetalIOCommandBuffer *)self getCommandBufferBytes:24];
  bzero(v7 + 1, 0x10uLL);
  *((_DWORD *)v7 + 2) = [a3 eventPort];
  v7[2] = a4;
  *uint64_t v7 = 0x1800000002;
  if (*((unsigned char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12BF8]))
  {
    MTLResourceListAddResource();
  }
}

- (void)enqueue
{
  uint64_t v2 = (int)*MEMORY[0x263F12BE0];
  if (!*((unsigned char *)&self->super.super.super.isa + v2))
  {
    *((unsigned char *)&self->super.super.super.isa + v2) = 1;
    [(IOGPUMetalIOCommandQueue *)self->_queue enqueueCommandBuffer:self];
  }
}

- (void)commit
{
  if (self->_committed) {
    MTLReportFailure();
  }
  if (*(_DWORD *)__globalGPUCommPage) {
    IOGPUDeviceTraceEvent();
  }
  [(_MTLIOCommandBuffer *)self clearScratchBufferLists];
  [(IOGPUMetalIOCommandBuffer *)self enqueue];
  self->_committed = 1;
  queue = self->_queue;
  [(IOGPUMetalIOCommandQueue *)queue commitCommandBuffer:self];
}

- (BOOL)isCommitted
{
  return self->_committed;
}

- (void)didCompleteWithStatus:(int64_t)a3
{
  unint64_t v5 = [(IOGPUMetalIOCommandQueue *)self->_queue globalTraceObjectID];
  uint64_t v6 = [(MTLCommandBuffer *)self->_gpuCommandBuffer globalTraceObjectID];
  dispatch_group_wait((dispatch_group_t)self->_ioCompletionGroup, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v7 = (int)*MEMORY[0x263F12C00];
  if (!*(Class *)((char *)&self->super.super.super.isa + v7)) {
    *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)a3;
  }
  if (self->_hasFollowOnGPUWork)
  {
    if (self->_tryCancel) {
      *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)1;
    }
    if (![(IOGPUMetalIOCommandBuffer *)self hasFollowOnWork]) {
      -[IOGPUMetalIOCommandBuffer didCompleteWithStatus:]();
    }
    if (*(Class *)((char *)&self->super.super.super.isa + v7) == (Class)3)
    {
      gpuBlitEncoder = self->_gpuBlitEncoder;
      if (gpuBlitEncoder)
      {
        [(MTLBlitCommandEncoder *)gpuBlitEncoder endEncoding];

        self->_gpuBlitEncoder = 0;
      }
      gpuCommandBuffer = self->_gpuCommandBuffer;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __51__IOGPUMetalIOCommandBuffer_didCompleteWithStatus___block_invoke;
      v15[3] = &unk_26441AA98;
      v15[4] = self;
      v15[5] = v5;
      v15[6] = v6;
      [(MTLCommandBuffer *)gpuCommandBuffer addCompletedHandler:v15];
      [(MTLCommandBuffer *)self->_gpuCommandBuffer commit];
      if (*(_DWORD *)__globalGPUCommPage) {
        goto LABEL_18;
      }
    }
    else
    {
      [(IOGPUMetalIOCommandQueue *)self->_queue commandBufferComplete];
      uint64_t v12 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
      v14.receiver = self;
      v14.super_class = (Class)IOGPUMetalIOCommandBuffer;
      [(_MTLIOCommandBuffer *)&v14 didCompleteWithStatus:v12];
      if (*(_DWORD *)__globalGPUCommPage) {
LABEL_18:
      }
        IOGPUDeviceTraceEvent();
    }
  }
  else
  {
    if (atomic_load(&self->_notificationCount))
    {
      if (![(IOGPUMetalIOCommandBuffer *)self hasFollowOnWork]) {
        -[IOGPUMetalIOCommandBuffer didCompleteWithStatus:]();
      }
      [(IOGPUMetalIOCommandQueue *)self->_queue commandBufferComplete];
    }
    uint64_t v11 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
    v13.receiver = self;
    v13.super_class = (Class)IOGPUMetalIOCommandBuffer;
    [(_MTLIOCommandBuffer *)&v13 didCompleteWithStatus:v11];
    if (*(_DWORD *)__globalGPUCommPage) {
      goto LABEL_18;
    }
  }

  self->_stagingBuffers = 0;
}

id __51__IOGPUMetalIOCommandBuffer_didCompleteWithStatus___block_invoke(uint64_t a1, void *a2)
{
  [*(id *)(*(void *)(a1 + 32) + 304) commandBufferComplete];
  if ([a2 status] == 4) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 2;
  }
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)IOGPUMetalIOCommandBuffer;
  id result = objc_msgSendSuper2(&v6, sel_didCompleteWithStatus_, v4);
  if (*(_DWORD *)__globalGPUCommPage) {
    return (id)IOGPUDeviceTraceEvent();
  }
  return result;
}

- (void)tryCancel
{
  if (!self->_tryCancel)
  {
    self->_tryCancel = 1;
    IOGPUIOCommandQueueTryCancelIOCommandBuffer(self->_queue->_ioCommandQueueRef, self->_commandBufferID);
  }
}

- (void)growKernelCommandBuffer:(unsigned int)a3
{
  ioKernelCommandShmem = self->_ioKernelCommandShmem;
  if (!ioKernelCommandShmem) {
    -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:]();
  }
  ioKernelCommandShmemStart = self->_ioKernelCommandShmemStart;
  if (!ioKernelCommandShmemStart
    || (ioKernelCommandShmemCurrent = self->_ioKernelCommandShmemCurrent) == 0
    || (ioKernelCommandShmemEnd = self->_ioKernelCommandShmemEnd) == 0)
  {
    -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:]();
  }
  if (ioKernelCommandShmemEnd < ioKernelCommandShmemStart) {
    -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:]();
  }
  unsigned int v8 = ioKernelCommandShmemCurrent - ioKernelCommandShmemStart;
  if (ioKernelCommandShmemCurrent < ioKernelCommandShmemStart) {
    -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:].cold.4();
  }
  unsigned int v9 = a3 + ioKernelCommandShmemEnd - ioKernelCommandShmemStart + 8;
  uint64_t pool = (uint64_t)ioKernelCommandShmem->_priv.pool;
  unsigned int v11 = *(_DWORD *)(pool + 48);
  while (v11 < v9)
  {
    if (v11 >= 0x200000) {
      v11 += 0x100000;
    }
    else {
      v11 *= 2;
    }
  }
  -[IOGPUMetalDeviceShmemPool setShmemSize:](ioKernelCommandShmem->_priv.pool, "setShmemSize:");
  Shmem = (IOGPUMetalDeviceShmem *)IOGPUMetalDeviceShmemPoolCreateShmem(pool);
  self->_ioKernelCommandShmem = Shmem;
  if (!Shmem)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:].cold.5((uint64_t)self);
    }
    abort();
  }
  uint64_t shmemSize = Shmem->_shmemSize;
  virtualAddress = (char *)Shmem->_virtualAddress;
  self->_ioKernelCommandShmemStart = virtualAddress;
  if (shmemSize < v9) {
    -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:].cold.6();
  }
  self->_ioKernelCommandShmemEnd = &virtualAddress[shmemSize];
  uint64_t v15 = ioKernelCommandShmem->_virtualAddress;
  if (!v15) {
    -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:].cold.7();
  }
  if (shmemSize <= v8) {
    -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:].cold.8();
  }
  memcpy(self->_ioKernelCommandShmemStart, v15, v8);
  IOGPUMetalDeviceShmemRelease((os_unfair_lock_s *)ioKernelCommandShmem);
  self->_ioKernelCommandShmemCurrent = &self->_ioKernelCommandShmemStart[v8];
  self->_commandListHeader = (IOGPUIOKernelCommandListHeader *)self->_ioKernelCommandShmemStart;
}

- (void)getCommandBufferBytes:(unsigned int)a3
{
  if (a3 <= 7) {
    -[IOGPUMetalIOCommandBuffer getCommandBufferBytes:]();
  }
  if (!self->_ioKernelCommandShmem) {
    -[IOGPUMetalIOCommandBuffer getCommandBufferBytes:]();
  }
  ioKernelCommandShmemStart = self->_ioKernelCommandShmemStart;
  if (!ioKernelCommandShmemStart
    || (id result = self->_ioKernelCommandShmemCurrent) == 0
    || (ioKernelCommandShmemEnd = self->_ioKernelCommandShmemEnd) == 0)
  {
    -[IOGPUMetalIOCommandBuffer getCommandBufferBytes:]();
  }
  if (ioKernelCommandShmemEnd < ioKernelCommandShmemStart) {
    -[IOGPUMetalIOCommandBuffer getCommandBufferBytes:].cold.4();
  }
  if (result < ioKernelCommandShmemStart) {
    -[IOGPUMetalIOCommandBuffer getCommandBufferBytes:].cold.5();
  }
  uint64_t v7 = a3;
  if (ioKernelCommandShmemEnd - (unsigned char *)result < a3)
  {
    -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:](self, "growKernelCommandBuffer:");
    id result = self->_ioKernelCommandShmemCurrent;
  }
  self->_ioKernelCommandShmemCurrent = (char *)result + v7;
  self->_commandListHeader->var1 = result + v7 - LODWORD(self->_ioKernelCommandShmemStart);
  return result;
}

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

- (void)setLabel:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalIOCommandBuffer;
  -[_MTLObjectWithLabel setLabel:](&v9, sel_setLabel_);
  if (*(_DWORD *)__globalGPUCommPage)
  {
    uint64_t v5 = [(MTLDevice *)self->_device deviceRef];
    unint64_t globalTraceObjectID = self->_globalTraceObjectID;
    uint64_t v7 = (int)*MEMORY[0x263F12BE8];
    uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
    [a3 cStringUsingEncoding:1];
    *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)IOGPUDeviceTraceObjectLabel(v5, 8, 0, globalTraceObjectID, v8);
  }
}

- (BOOL)hasFollowOnWork
{
  if (self->_hasFollowOnGPUWork) {
    return 1;
  }
  unsigned int v3 = atomic_load(&self->_notificationCount);
  return v3 != 0;
}

- (BOOL)validateNotificationCount
{
  p_notificationCount = &self->_notificationCount;
  unsigned int v3 = atomic_load(&self->_notificationCount);
  if (v3 >= 0x2000)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOGPUMetalIOCommandBuffer validateNotificationCount](p_notificationCount);
    }
    completionQueueDispatch = self->_queue->_completionQueueDispatch;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__IOGPUMetalIOCommandBuffer_validateNotificationCount__block_invoke;
    block[3] = &unk_26441A5F0;
    void block[4] = self;
    dispatch_async(completionQueueDispatch, block);
  }
  return v3 < 0x2000;
}

id __54__IOGPUMetalIOCommandBuffer_validateNotificationCount__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) completeCommandCallbackBlocks];
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)IOGPUMetalIOCommandBuffer;
  return objc_msgSendSuper2(&v3, sel_didCompleteWithStatus_, 2);
}

- (void)completeCommandCallbackBlocks
{
  p_commandCallbackBlocks = &self->_commandCallbackBlocks;
  unint64_t v3 = self[1].super.super.super.isa - self->_commandCallbackBlocks.__begin_;
  if ((v3 & 0x7FFFFFFF8) != 0)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (v3 >> 3);
    do
    {
      objc_super v6 = (void (**)(void, void))*((void *)p_commandCallbackBlocks->__begin_ + v4);
      v6[2](v6, 3);
      _Block_release(v6);
      ++v4;
    }
    while (v5 != v4);
  }
}

- (void).cxx_destruct
{
  p_commandCallbackBlocks = &self->_commandCallbackBlocks;
  begin = self->_commandCallbackBlocks.__begin_;
  if (begin)
  {
    p_commandCallbackBlocks[1].__begin_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 53) = 0;
  *((void *)self + 54) = 0;
  *((void *)self + 52) = 0;
  return self;
}

- (void)initWithQueue:resourceList:retained:.cold.1()
{
}

- (void)loadBytes:size:sourceHandle:sourceHandleOffset:.cold.1()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer loadBytes:size:sourceHandle:sourceHandleOffset:]", "IOGPUMetalIOCommandBuffer.mm", 193, "_currentStagingBufferRemainingBytes >= staging_buffer_size");
}

- (void)loadBuffer:offset:size:sourceHandle:sourceHandleOffset:.cold.1()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer loadBuffer:offset:size:sourceHandle:sourceHandleOffset:]", "IOGPUMetalIOCommandBuffer.mm", 326, "_currentStagingBufferRemainingBytes >= staging_buffer_size");
}

- (void)loadBuffer:offset:size:sourceHandle:sourceHandleOffset:.cold.2()
{
}

- (void)loadBuffer:offset:size:sourceHandle:sourceHandleOffset:.cold.3()
{
}

- (void)loadBuffer:offset:size:sourceHandle:sourceHandleOffset:.cold.4()
{
}

- (void)didCompleteWithStatus:.cold.1()
{
}

- (void)didCompleteWithStatus:.cold.2()
{
}

- (void)growKernelCommandBuffer:.cold.1()
{
}

- (void)growKernelCommandBuffer:.cold.2()
{
}

- (void)growKernelCommandBuffer:.cold.3()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:]", "IOGPUMetalIOCommandBuffer.mm", 1255, "_ioKernelCommandShmemEnd >= _ioKernelCommandShmemStart");
}

- (void)growKernelCommandBuffer:.cold.4()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:]", "IOGPUMetalIOCommandBuffer.mm", 1256, "_ioKernelCommandShmemCurrent >= _ioKernelCommandShmemStart");
}

- (void)growKernelCommandBuffer:(uint64_t)a1 .cold.5(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v1 = *(_DWORD *)(a1 + 392);
  int v2 = 136315394;
  unint64_t v3 = "-[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:]";
  __int16 v4 = 1024;
  int v5 = v1;
  _os_log_fault_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%s: Failed to Allocate Shmem to grow IOCommandBuffer [commandBufferID: %u]", (uint8_t *)&v2, 0x12u);
}

- (void)growKernelCommandBuffer:.cold.6()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:]", "IOGPUMetalIOCommandBuffer.mm", 1294, "bytesAllocated >= newSpaceRequired");
}

- (void)growKernelCommandBuffer:.cold.7()
{
}

- (void)growKernelCommandBuffer:.cold.8()
{
}

- (void)getCommandBufferBytes:.cold.1()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer getCommandBufferBytes:]", "IOGPUMetalIOCommandBuffer.mm", 1314, "byteCount >= sizeof(sIOGPUIOKernelCommand)");
}

- (void)getCommandBufferBytes:.cold.2()
{
}

- (void)getCommandBufferBytes:.cold.3()
{
}

- (void)getCommandBufferBytes:.cold.4()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer getCommandBufferBytes:]", "IOGPUMetalIOCommandBuffer.mm", 1318, "_ioKernelCommandShmemEnd >= _ioKernelCommandShmemStart");
}

- (void)getCommandBufferBytes:.cold.5()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer getCommandBufferBytes:]", "IOGPUMetalIOCommandBuffer.mm", 1319, "_ioKernelCommandShmemCurrent >= _ioKernelCommandShmemStart");
}

- (void)validateNotificationCount
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  unsigned int v1 = atomic_load(a1);
  v2[0] = 67109376;
  v2[1] = v1;
  __int16 v3 = 1024;
  int v4 = 0x2000;
  _os_log_error_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "IOCommandBuffer NotificationCount(%u) >= IOQueue MaxNotificationDepth(%d)", (uint8_t *)v2, 0xEu);
}

@end