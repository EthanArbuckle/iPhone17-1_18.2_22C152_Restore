@interface _MTLIOCommandBuffer
- (BOOL)isCommitted;
- (MTLIOCommandList)getCommandList;
- (NSError)error;
- (_MTLIOCommandBuffer)initWithQueue:(id)a3;
- (_MTLIOCommandBuffer)initWithQueue:(id)a3 resourceList:(id)a4 retained:(BOOL)a5;
- (id).cxx_construct;
- (id)getReusableScratchBuffer:(unint64_t)a3;
- (int64_t)status;
- (void)addBarrier;
- (void)addCompletedHandler:(id)a3;
- (void)clearScratchBufferLists;
- (void)commit;
- (void)copyStatusToBuffer:(id)a3 offset:(unint64_t)a4;
- (void)createCommandListWithResourcePool:(id)a3;
- (void)dealloc;
- (void)didCompleteWithStatus:(int64_t)a3;
- (void)enqueue;
- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7;
- (void)loadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6;
- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8 dstOrigin:(id *)a9 handle:(id)a10 handleOffset:(unint64_t)a11;
- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11;
- (void)pushDebugGroup:(id)a3;
- (void)reuseActiveScratchBuffers;
- (void)signalEvent:(id)a3 value:(unint64_t)a4;
- (void)tryCancel;
- (void)waitForEvent:(id)a3 value:(unint64_t)a4;
- (void)waitUntilCompleted;
@end

@implementation _MTLIOCommandBuffer

- (_MTLIOCommandBuffer)initWithQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_MTLIOCommandBuffer;
  v4 = [(_MTLObjectWithLabel *)&v7 init];
  if (v4)
  {
    v5 = (dispatch_semaphore_t *)a3;
    v4->_queue = (_MTLIOCommandQueue *)v5;
    dispatch_semaphore_wait(v5[8], 0xFFFFFFFFFFFFFFFFLL);
    v4->_status = 0;
    v4->_currentStagingBuffer = 0;
    v4->_currentStagingBufferRemainingBytes = 0;
    v4->_currentStagingBufferOffset = 0;
    v4->commandList = 0;
  }
  return v4;
}

- (_MTLIOCommandBuffer)initWithQueue:(id)a3 resourceList:(id)a4 retained:(BOOL)a5
{
  v11.receiver = self;
  v11.super_class = (Class)_MTLIOCommandBuffer;
  v8 = [(_MTLObjectWithLabel *)&v11 init];
  if (v8)
  {
    v9 = (dispatch_semaphore_t *)a3;
    v8->_queue = (_MTLIOCommandQueue *)v9;
    dispatch_semaphore_wait(v9[8], 0xFFFFFFFFFFFFFFFFLL);
    v8->_status = 0;
    v8->_completedCallbacksDone = 0;
    v8->_mutex.__sig = 850045863;
    *(void *)&v8->_mutex.__opaque[48] = 0;
    *(_OWORD *)&v8->_mutex.__opaque[32] = 0u;
    *(_OWORD *)&v8->_mutex.__opaque[16] = 0u;
    *(_OWORD *)v8->_mutex.__opaque = 0u;
    v8->_cond.__sig = 1018212795;
    *(_OWORD *)v8->_cond.__opaque = 0u;
    *(_OWORD *)&v8->_cond.__opaque[16] = 0u;
    *(void *)&v8->_cond.__opaque[32] = 0;
    v8->_pendingCommands = 0;
    v8->_currentStagingBuffer = 0;
    v8->_currentStagingBufferRemainingBytes = 0;
    v8->_currentStagingBufferOffset = 0;
    [(_MTLIOCommandBuffer *)v8 createCommandListWithResourcePool:a4];
    v8->_resourceList = MTLResourceListPoolCreateResourceList((MTLResourceListPool *)a4);
    v8->_retained = a5;
    v8->_enqueued = 0;
    v8->_activeScratchBuffers.var0 = v8->_activeScratchBuffers.__begin_;
    v8->_poolScratchBuffers.var0 = v8->_poolScratchBuffers.__begin_;
    if (MTLTraceEnabled())
    {
      [(_MTLIOCommandBuffer *)v8 globalTraceObjectID];
      [a3 globalTraceObjectID];
      objc_msgSend((id)objc_msgSend(a3, "device"), "registryID");
      kdebug_trace();
    }
  }
  return v8;
}

- (void)createCommandListWithResourcePool:(id)a3
{
}

- (BOOL)isCommitted
{
  commandList = self->commandList;
  return commandList && commandList->var7;
}

- (void)addCompletedHandler:(id)a3
{
  if (a3)
  {
    p_completedDispatchListTail = &self->_completedDispatchListTail;
    v6 = (objc_class *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
    objc_super v7 = _Block_copy(a3);
    *(void *)v6 = 0;
    *((void *)v6 + 1) = v7;
    v8 = *p_completedDispatchListTail;
    if (*p_completedDispatchListTail)
    {
      uint64_t v9 = 104;
    }
    else
    {
      v8 = (MTLIODispatch *)p_completedDispatchListTail;
      uint64_t v9 = 96;
    }
    v8->var0 = (MTLIODispatch *)v6;
    *(Class *)((char *)&self->super.super.isa + v9) = v6;
  }
}

- (void)waitForEvent:(id)a3 value:(unint64_t)a4
{
  if (a3)
  {
    int v12 = 2;
    char v13 = 0;
    *(void *)&double v7 = MTLIOCommandList::addCommand(self->commandList, (MTLIOCommand *)&v12).n128_u64[0];
    uint64_t v9 = v8;
    v10 = [(_MTLIOCommandQueue *)self->_queue eventSignalListener];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42___MTLIOCommandBuffer_waitForEvent_value___block_invoke;
    v11[3] = &unk_1E521F878;
    v11[4] = self;
    v11[5] = v9;
    [a3 notifyListener:v10 atValue:a4 block:v11];
    if (self->_retained) {
      MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)a3);
    }
    if (MTLTraceEnabled())
    {
      [(_MTLIOCommandBuffer *)self globalTraceObjectID];
      kdebug_trace();
    }
  }
}

- (void)signalEvent:(id)a3 value:(unint64_t)a4
{
  int v6 = 3;
  id v7 = a3;
  unint64_t v8 = a4;
  MTLIOCommandList::addCommand(self->commandList, (MTLIOCommand *)&v6);
  if (self->_retained) {
    MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)a3);
  }
  if (MTLTraceEnabled())
  {
    [(_MTLIOCommandBuffer *)self globalTraceObjectID];
    kdebug_trace();
  }
}

- (void)loadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6
{
  unint64_t v11 = objc_msgSend(a5, "stagingBufferSize:offset:", a4, a6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
          0,
          0,
          0,
          0);
  unint64_t v12 = v11;
  if (self->_currentStagingBufferRemainingBytes >= v11)
  {
    if (!v11)
    {
      v21 = 0;
      goto LABEL_13;
    }
    currentStagingBuffer = self->_currentStagingBuffer;
LABEL_6:
    unint64_t currentStagingBufferOffset = self->_currentStagingBufferOffset;
    v21 = currentStagingBuffer;
    unint64_t v22 = currentStagingBufferOffset;
    unint64_t v23 = objc_msgSend((id)-[MTLIOScratchBuffer buffer](currentStagingBuffer, "buffer"), "contents")
        + currentStagingBufferOffset;
LABEL_13:
    self->_currentStagingBufferOffset += v12;
    self->_currentStagingBufferRemainingBytes -= v12;
    int v17 = 0;
    id v18 = a5;
    unint64_t v19 = a6;
    unint64_t v24 = v12;
    long long v25 = (unint64_t)a3;
    unint64_t v20 = a4;
    *(void *)&long long v26 = 0;
    MTLIOCommandList::addCommand(self->commandList, (MTLIOCommand *)&v17);
    if (self->_retained) {
      MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)a5);
    }
    if (MTLTraceEnabled())
    {
      [(_MTLIOCommandBuffer *)self globalTraceObjectID];
      [a5 globalTraceObjectID];
      kdebug_trace();
    }
    return;
  }
  currentStagingBuffer = [(_MTLIOCommandBuffer *)self getReusableScratchBuffer:v11];
  if (currentStagingBuffer)
  {
LABEL_3:
    self->_currentStagingBufferRemainingBytes = objc_msgSend((id)-[MTLIOScratchBuffer buffer](currentStagingBuffer, "buffer"), "allocatedSize");
    self->_unint64_t currentStagingBufferOffset = 0;
    self->_currentStagingBuffer = currentStagingBuffer;
    goto LABEL_6;
  }
  v15 = (MTLIOScratchBuffer *)[(MTLIOScratchBufferAllocator *)[(_MTLIOCommandQueue *)self->_queue scratchBufferAllocator] newScratchBufferWithMinimumSize:v12];
  currentStagingBuffer = v15;
  if (v15 && objc_msgSend((id)-[MTLIOScratchBuffer buffer](v15, "buffer"), "allocatedSize") >= v12)
  {
    MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)currentStagingBuffer);

    goto LABEL_3;
  }

  commandList = self->commandList;
  os_unfair_lock_lock(&commandList->var5);
  commandList->var6 = 1;

  os_unfair_lock_unlock(&commandList->var5);
}

- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7
{
  uint64_t v35 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  uint64_t v13 = [a3 storageMode];
  id v25 = a6;
  uint64_t v14 = [a6 stagingBufferSize:a5 offset:a7];
  BOOL v15 = v13 == 2;
  if (v13 == 2) {
    unint64_t v16 = a5;
  }
  else {
    unint64_t v16 = 0;
  }
  unint64_t v17 = v16 + v14;
  if (self->_currentStagingBufferRemainingBytes >= v16 + v14)
  {
    unint64_t v19 = a7;
    if (!v17)
    {
      *(void *)&long long v28 = 0;
      goto LABEL_16;
    }
    unint64_t v23 = a4;
    currentStagingBuffer = self->_currentStagingBuffer;
LABEL_9:
    unint64_t currentStagingBufferOffset = self->_currentStagingBufferOffset;
    *(void *)&long long v28 = currentStagingBuffer;
    *((void *)&v28 + 1) = currentStagingBufferOffset;
    *(void *)&long long v29 = objc_msgSend((id)-[MTLIOScratchBuffer buffer](currentStagingBuffer, "buffer", v23), "contents")
                    + currentStagingBufferOffset;
    a4 = v24;
LABEL_16:
    self->_currentStagingBufferOffset += v17;
    self->_currentStagingBufferRemainingBytes -= v17;
    LODWORD(v26) = 0;
    *((void *)&v26 + 1) = v25;
    *(void *)&long long v27 = v19;
    *((void *)&v29 + 1) = v17;
    *((void *)&v27 + 1) = a5;
    *(void *)&long long v30 = [a3 contents] + a4;
    *((void *)&v30 + 1) = a3;
    *(void *)&long long v31 = a4;
    BYTE9(v31) = v15;
    MTLIOCommandList::addCommand(self->commandList, (MTLIOCommand *)&v26);
    if (self->_retained)
    {
      MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)a3);
      MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)v25);
    }
    if (MTLTraceEnabled())
    {
      [(_MTLIOCommandBuffer *)self globalTraceObjectID];
      [v25 globalTraceObjectID];
      kdebug_trace();
    }
    return;
  }
  unint64_t v23 = a4;
  currentStagingBuffer = [(_MTLIOCommandBuffer *)self getReusableScratchBuffer:v17];
  if (currentStagingBuffer)
  {
LABEL_6:
    unint64_t v19 = a7;
    self->_currentStagingBufferRemainingBytes = objc_msgSend((id)-[MTLIOScratchBuffer buffer](currentStagingBuffer, "buffer"), "allocatedSize");
    self->_unint64_t currentStagingBufferOffset = 0;
    self->_currentStagingBuffer = currentStagingBuffer;
    goto LABEL_9;
  }
  v21 = (MTLIOScratchBuffer *)[(MTLIOScratchBufferAllocator *)[(_MTLIOCommandQueue *)self->_queue scratchBufferAllocator] newScratchBufferWithMinimumSize:v17];
  currentStagingBuffer = v21;
  if (v21 && objc_msgSend((id)-[MTLIOScratchBuffer buffer](v21, "buffer"), "allocatedSize") >= v17)
  {
    MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)currentStagingBuffer);

    goto LABEL_6;
  }

  commandList = self->commandList;
  os_unfair_lock_lock(&commandList->var5);
  commandList->var6 = 1;

  os_unfair_lock_unlock(&commandList->var5);
}

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8 dstOrigin:(id *)a9 handle:(id)a10 handleOffset:(unint64_t)a11
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = *a9;
  [(_MTLIOCommandBuffer *)self loadTexture:a3 slice:a4 level:a5 size:&v12 sourceBytesPerRow:a7 sourceBytesPerImage:a8 destinationOrigin:&v11 sourceHandle:a10 sourceHandleOffset:a11];
}

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11
{
  id v13 = a10;
  unint64_t v43 = 0;
  unint64_t v44 = 0;
  long long v41 = *(_OWORD *)&a9->var0;
  uint64_t v42 = 0;
  long long v39 = *(_OWORD *)&a6->var0;
  uint64_t v40 = 1;
  *(void *)&long long v27 = a5;
  *((void *)&v27 + 1) = a7;
  MTLCalculateSourceBufferSizeAndAlignment(a3, &v41, (unint64_t *)&v39, a5, a7, &v44, (uint64_t *)&v43);
  if (a6->var2)
  {
    unint64_t v14 = 0;
    id v25 = a10;
    do
    {
      unint64_t v38 = 0;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v35 = 0u;
      long long v33 = 0u;
      memset(v34, 0, sizeof(v34));
      long long v31 = 0u;
      long long v32 = 0u;
      long long v30 = 0u;
      uint64_t v16 = objc_msgSend(v13, "stagingBufferSize:offset:", v44, a11, v25);
      uint64_t v17 = v44 + v16;
      unint64_t v18 = v44 + v16 + v43;
      if (self->_currentStagingBufferRemainingBytes >= v18)
      {
        currentStagingBuffer = self->_currentStagingBuffer;
        if (v17) {
          goto LABEL_11;
        }
      }
      else
      {
        currentStagingBuffer = [(_MTLIOCommandBuffer *)self getReusableScratchBuffer:v17 + v43];
        if (!currentStagingBuffer)
        {
          unint64_t v20 = (MTLIOScratchBuffer *)[(MTLIOScratchBufferAllocator *)[(_MTLIOCommandQueue *)self->_queue scratchBufferAllocator] newScratchBufferWithMinimumSize:v18];
          currentStagingBuffer = v20;
          if (!v20 || objc_msgSend((id)-[MTLIOScratchBuffer buffer](v20, "buffer"), "allocatedSize") < v18)
          {

            commandList = self->commandList;
            os_unfair_lock_lock(&commandList->var5);
            commandList->var6 = 1;
            os_unfair_lock_unlock(&commandList->var5);
            return;
          }
          MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)currentStagingBuffer);
        }
        self->_currentStagingBufferRemainingBytes = objc_msgSend((id)-[MTLIOScratchBuffer buffer](currentStagingBuffer, "buffer"), "allocatedSize");
        self->_unint64_t currentStagingBufferOffset = 0;
        self->_currentStagingBuffer = currentStagingBuffer;
        if (v17)
        {
LABEL_11:
          unint64_t v21 = (self->_currentStagingBufferOffset + v43 - 1) / v43 * v43;
          *(void *)&long long v32 = currentStagingBuffer;
          *((void *)&v32 + 1) = v21;
          uint64_t v22 = objc_msgSend((id)-[MTLIOScratchBuffer buffer](currentStagingBuffer, "buffer"), "contents");
          *(void *)&long long v33 = v22 + *((void *)&v32 + 1);
          goto LABEL_12;
        }
      }
      *(void *)&long long v32 = 0;
LABEL_12:
      self->_currentStagingBufferOffset += v18;
      self->_currentStagingBufferRemainingBytes -= v18;
      LODWORD(v30) = 1;
      id v13 = v25;
      *((void *)&v30 + 1) = v25;
      *(void *)&long long v31 = a11;
      *((void *)&v31 + 1) = v44;
      *((void *)&v33 + 1) = v17;
      *(void *)&v34[0] = a3;
      uint64_t v23 = v14 + a9->var2;
      *(_OWORD *)((char *)v34 + 8) = *(_OWORD *)&a9->var0;
      *((void *)&v34[1] + 1) = v23;
      long long v37 = v27;
      unint64_t v38 = a8;
      long long v35 = *(_OWORD *)&a6->var0;
      *(void *)&long long v36 = 1;
      *((void *)&v36 + 1) = a4;
      MTLIOCommandList::addCommand(self->commandList, (MTLIOCommand *)&v30);
      a11 += a8;
      ++v14;
    }
    while (v14 < a6->var2);
  }
  if (self->_retained)
  {
    MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)a3);
    MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)v13);
  }
  if (MTLTraceEnabled())
  {
    [(_MTLIOCommandBuffer *)self globalTraceObjectID];
    [v13 globalTraceObjectID];
    kdebug_trace();
  }
}

- (void)copyStatusToBuffer:(id)a3 offset:(unint64_t)a4
{
  uint64_t v7 = [a3 contents];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49___MTLIOCommandBuffer_copyStatusToBuffer_offset___block_invoke;
  v12[3] = &unk_1E521F8A0;
  v12[4] = self;
  v12[5] = v7 + a4;
  unint64_t v8 = (MTLIODispatch *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
  uint64_t v9 = _Block_copy(v12);
  v8->var0 = 0;
  v8->var1 = v9;
  completedDispatchListTail = self->_completedDispatchListTail;
  if (completedDispatchListTail)
  {
    uint64_t v11 = 104;
  }
  else
  {
    completedDispatchListTail = (MTLIODispatch *)&self->_completedDispatchListTail;
    uint64_t v11 = 96;
  }
  completedDispatchListTail->var0 = v8;
  *(Class *)((char *)&self->super.super.isa + v11) = (Class)v8;
  if (self->_retained) {
    MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)a3);
  }
}

- (void)commit
{
  [(_MTLIOCommandBuffer *)self clearScratchBufferLists];
  if (self->_enqueued) {
    p_cmdCvar = &self->_queue->cmdCvar;
  }
  else {
    p_cmdCvar = 0;
  }
  MTLIOCommandList::commit(self->commandList, p_cmdCvar);
  if (!self->_enqueued) {
    [(_MTLIOCommandQueue *)self->_queue commit:self];
  }
  if (MTLTraceEnabled())
  {
    [(_MTLIOCommandBuffer *)self globalTraceObjectID];
    kdebug_trace();
  }
}

- (void)enqueue
{
  if (!self->_enqueued)
  {
    self->_enqueued = 1;
    [(_MTLIOCommandQueue *)self->_queue commit:self];
  }
}

- (void)waitUntilCompleted
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  while (!self->_completedCallbacksDone)
    pthread_cond_wait(&self->_cond, p_mutex);

  pthread_mutex_unlock(p_mutex);
}

- (MTLIOCommandList)getCommandList
{
  return self->commandList;
}

- (void)didCompleteWithStatus:(int64_t)a3
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_queue->_commandBufferSemaphore);
  self->_status = a3;
  completedDispatchList = self->_completedDispatchList;
  if (completedDispatchList)
  {
    do
    {
      var0 = completedDispatchList->var0;
      (*((void (**)(void))completedDispatchList->var1 + 2))();
      _Block_release(completedDispatchList->var1);
      free(completedDispatchList);
      completedDispatchList = var0;
    }
    while (var0);
  }
  self->_completedDispatchList = 0;
  self->_completedDispatchListTail = 0;
  pthread_mutex_lock(&self->_mutex);
  self->_completedCallbacksDone = 1;
  pthread_cond_broadcast(&self->_cond);
  pthread_mutex_unlock(&self->_mutex);
  commandList = self->commandList;
  if (commandList)
  {
    MTLIOCommandList::~MTLIOCommandList(commandList);
    MEMORY[0x18530C140]();
  }
  self->commandList = 0;
  resourceList = self->_resourceList;
  if (resourceList)
  {
    [(MTLResourceList *)resourceList releaseAllObjectsAndReset];
    MTLResourceListRelease(&self->_resourceList->super.isa);
    self->_resourceList = 0;
  }
  [(_MTLIOCommandQueue *)self->_queue kickAllocatorCleanupQueue];
  if (MTLTraceEnabled())
  {
    [(_MTLIOCommandBuffer *)self globalTraceObjectID];
    kdebug_trace();
  }
}

- (void)tryCancel
{
  commandList = self->commandList;
  os_unfair_lock_lock(&commandList->var5);
  commandList->var6 = 1;

  os_unfair_lock_unlock(&commandList->var5);
}

- (void)addBarrier
{
  v3[0] = 4;
  [(_MTLIOCommandBuffer *)self reuseActiveScratchBuffers];
  if (MTLTraceEnabled())
  {
    [(_MTLIOCommandBuffer *)self globalTraceObjectID];
    kdebug_trace();
  }
}

- (void)pushDebugGroup:(id)a3
{
  if (!a3)
  {
    unint64_t v8 = @"string must not be nil.";
    unint64_t v9 = 0;
    uint64_t v10 = 973;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v8 = @"string is not a NSString.";
    unint64_t v9 = 1;
    uint64_t v10 = 976;
LABEL_6:
    MTLReportFailure(v9, "-[_MTLIOCommandBuffer pushDebugGroup:]", v10, (uint64_t)v8, v3, v4, v5, v6, v12);
  }
}

- (void)dealloc
{
  commandList = self->commandList;
  if (commandList)
  {
    MTLIOCommandList::~MTLIOCommandList(commandList);
    MEMORY[0x18530C140]();
  }
  pthread_cond_destroy(&self->_cond);
  pthread_mutex_destroy(&self->_mutex);

  [(_MTLIOCommandBuffer *)self clearScratchBufferLists];
  resourceList = self->_resourceList;
  if (resourceList)
  {
    [(MTLResourceList *)resourceList releaseAllObjectsAndReset];
    MTLResourceListRelease(&self->_resourceList->super.isa);
    self->_resourceList = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_MTLIOCommandBuffer;
  [(_MTLObjectWithLabel *)&v5 dealloc];
}

- (id)getReusableScratchBuffer:(unint64_t)a3
{
  currentStagingBuffer = self->_currentStagingBuffer;
  if (currentStagingBuffer)
  {
    p_activeScratchBuffers = &self->_activeScratchBuffers;
    var0 = self->_activeScratchBuffers.var0;
    p_var1 = &self->_activeScratchBuffers.var1;
    value = self->_activeScratchBuffers.var1.__value_;
    if (var0 >= (__end_cap_ **)value)
    {
      uint64_t v11 = var0 - p_activeScratchBuffers->__begin_;
      if ((unint64_t)(v11 + 1) >> 61) {
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v12 = (char *)value - (char *)p_activeScratchBuffers->__begin_;
      uint64_t v13 = v12 >> 2;
      if (v12 >> 2 <= (unint64_t)(v11 + 1)) {
        uint64_t v13 = v11 + 1;
      }
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      if (v14)
      {
        BOOL v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)p_var1, v14);
        currentStagingBuffer = self->_currentStagingBuffer;
      }
      else
      {
        BOOL v15 = 0;
      }
      uint64_t v16 = (MTLIOScratchBuffer **)&v15[8 * v11];
      uint64_t v17 = (id *)&v15[8 * v14];
      *uint64_t v16 = currentStagingBuffer;
      uint64_t v10 = v16 + 1;
      begin = p_activeScratchBuffers->__begin_;
      unint64_t v18 = self->_activeScratchBuffers.var0;
      if (v18 != p_activeScratchBuffers->__begin_)
      {
        do
        {
          unint64_t v20 = *--v18;
          *--uint64_t v16 = v20;
        }
        while (v18 != begin);
        unint64_t v18 = p_activeScratchBuffers->__begin_;
      }
      p_activeScratchBuffers->__begin_ = v16;
      self->_activeScratchBuffers.var0 = v10;
      self->_activeScratchBuffers.var1.__value_ = v17;
      if (v18) {
        operator delete(v18);
      }
    }
    else
    {
      MTLIODispatch *var0 = currentStagingBuffer;
      uint64_t v10 = var0 + 1;
    }
    self->_activeScratchBuffers.var0 = v10;
  }
  p_poolScratchBuffers = &self->_poolScratchBuffers;
  int64_t v22 = (char *)self->_poolScratchBuffers.var0 - (char *)self->_poolScratchBuffers.__begin_;
  if (!v22) {
    return 0;
  }
  uint64_t v23 = 0;
  unint64_t v24 = v22 >> 3;
  if (v24 <= 1) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = v24;
  }
  while (objc_msgSend((id)-[__end_ buffer](p_poolScratchBuffers->__begin_[v23], "buffer"), "allocatedSize") < a3)
  {
    ++v23;
    if (!--v25) {
      return 0;
    }
  }
  long long v27 = (void **)p_poolScratchBuffers->var0;
  long long v28 = (void **)&p_poolScratchBuffers->__begin_[v23];
  long long v26 = *v28;
  unint64_t v29 = (char *)v27 - (char *)p_poolScratchBuffers->__begin_ - v23 * 8;
  unint64_t v30 = v29 - 8;
  if (v28 + 1 != v27) {
    memmove(v28, v28 + 1, v29 - 8);
  }
  p_poolScratchBuffers->var0 = (__end_cap_ **)((char *)v28 + (v30 & 0xFFFFFFFFFFFFFFF8));
  return v26;
}

- (void)reuseActiveScratchBuffers
{
  v2 = self;
  self->_currentStagingBufferRemainingBytes = objc_msgSend((id)-[MTLIOScratchBuffer buffer](self->_currentStagingBuffer, "buffer"), "allocatedSize");
  v2->_unint64_t currentStagingBufferOffset = 0;
  uint64_t p_poolScratchBuffers = (uint64_t)&v2->_poolScratchBuffers;
  uint64_t var0 = (uint64_t)v2->_poolScratchBuffers.var0;
  v2 = (_MTLIOCommandBuffer *)((char *)v2 + 240);
  std::vector<objc_object  {objcproto18MTLIOScratchBuffer}*>::__insert_with_size[abi:ne180100]<std::__wrap_iter<objc_object  {objcproto18MTLIOScratchBuffer}*>,objc_object  {objcproto18MTLIOScratchBuffer}*>(p_poolScratchBuffers, var0, (char *)v2->super.super.isa, (char *)v2->super._label, ((char *)v2->super._label - (char *)v2->super.super.isa) >> 3);
  v2->super._label = (NSString *)v2->super.super.isa;
}

- (void)clearScratchBufferLists
{
  self->_activeScratchBuffers.uint64_t var0 = self->_activeScratchBuffers.__begin_;
  self->_poolScratchBuffers.uint64_t var0 = self->_poolScratchBuffers.__begin_;
}

- (int64_t)status
{
  return self->_status;
}

- (NSError)error
{
  return self->error;
}

- (void).cxx_destruct
{
  uint64_t p_poolScratchBuffers = &self->_poolScratchBuffers;
  begin = self->_poolScratchBuffers.__begin_;
  if (begin)
  {
    p_poolScratchBuffers->uint64_t var0 = begin;
    operator delete(begin);
  }
  objc_super v5 = self->_activeScratchBuffers.__begin_;
  if (v5)
  {
    self->_activeScratchBuffers.uint64_t var0 = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 31) = 0;
  *((void *)self + 32) = 0;
  *((void *)self + 30) = 0;
  *((void *)self + 34) = 0;
  *((void *)self + 35) = 0;
  *((void *)self + 33) = 0;
  return self;
}

@end