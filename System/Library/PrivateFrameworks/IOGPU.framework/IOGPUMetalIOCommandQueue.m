@interface IOGPUMetalIOCommandQueue
- (IOGPUMetalIOCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4;
- (id)commandBuffer;
- (id)commandBufferWithUnretainedReferences;
- (id)getDecompressionQueue;
- (int64_t)getPriority;
- (unint64_t)globalTraceObjectID;
- (void)_submitAvailableCommands:(void *)a3;
- (void)commandBufferComplete;
- (void)commitCommandBuffer:(id)a3;
- (void)dealloc;
- (void)didComplete:(id)a3 withStatus:(int64_t)a4;
- (void)enqueueBarrier;
- (void)enqueueCommandBuffer:(id)a3;
- (void)launchIOGPUIOThreads;
- (void)setLabel:(id)a3;
- (void)submitAvailableCommands;
@end

@implementation IOGPUMetalIOCommandQueue

- (IOGPUMetalIOCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)IOGPUMetalIOCommandQueue;
  v6 = -[_MTLIOCommandQueue initWithDevice:descriptor:](&v20, sel_initWithDevice_descriptor_);
  if (v6)
  {
    *((void *)v6 + 49) = a3;
    v7 = (mach_port_t *)[a3 deviceRef];
    uint64_t v8 = [a4 maxCommandBufferCount];
    v9 = IOGPUIOCommandQueueCreate(v7, v8, *(_DWORD *)&v6[*MEMORY[0x263F12C28]], *(_DWORD *)&v6[*MEMORY[0x263F12C18]]);
    *((void *)v6 + 50) = v9;
    if (v9
      && (v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0),
          dispatch_queue_t v11 = dispatch_queue_create("com.Metal.IOSubmissionQueueDispatch", v10),
          (*((void *)v6 + 70) = v11) != 0)
      && (dispatch_queue_t v12 = dispatch_queue_create("com.Metal.IOCompletionQueueDispatch", v10), (*((void *)v6 + 71) = v12) != 0))
    {
      dispatch_release(v10);
      IOGPUIOCommandQueueSetDispatchQueue(*((dispatch_queue_t **)v6 + 50), *((NSObject **)v6 + 71));
      *((void *)v6 + 52) = objc_alloc_init(MEMORY[0x263EFF980]);
      *((void *)v6 + 53) = objc_alloc_init(MEMORY[0x263EFF980]);
      pthread_mutex_init((pthread_mutex_t *)(v6 + 432), 0);
      pthread_mutex_init((pthread_mutex_t *)(v6 + 496), 0);
      v13 = dispatch_source_create(MEMORY[0x263EF83B0], 0, 0, *((dispatch_queue_t *)v6 + 70));
      *((void *)v6 + 72) = v13;
      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x3052000000;
      v19[3] = __Block_byref_object_copy_;
      v19[4] = __Block_byref_object_dispose_;
      v19[5] = v6;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __54__IOGPUMetalIOCommandQueue_initWithDevice_descriptor___block_invoke;
      handler[3] = &unk_26441A578;
      handler[4] = v19;
      dispatch_source_set_event_handler(v13, handler);
      dispatch_resume(*((dispatch_object_t *)v6 + 72));
      dispatch_qos_class_t v14 = MTLIOQosClassForPriority();
      v15 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], v14, 0);
      *((void *)v6 + 73) = dispatch_queue_create("com.Metal.IOThreads", v15);
      dispatch_release(v15);
      if (*((void *)v6 + 73))
      {
        v16 = dispatch_queue_attr_make_with_qos_class(0, v14, 0);
        *((void *)v6 + 74) = dispatch_queue_create("com.Metal.IODecompressionQueueDispatch", v16);
        dispatch_release(v16);
        if (*((void *)v6 + 74))
        {
          [v6 launchIOGPUIOThreads];
          *((void *)v6 + 75) = IOGPUIOCommandQueueGetGlobalTraceObjectID(*((void **)v6 + 50));
          _Block_object_dispose(v19, 8);
          return (IOGPUMetalIOCommandQueue *)v6;
        }
      }

      _Block_object_dispose(v19, 8);
    }
    else
    {
    }
    return 0;
  }
  return (IOGPUMetalIOCommandQueue *)v6;
}

uint64_t __54__IOGPUMetalIOCommandQueue_initWithDevice_descriptor___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) submitAvailableCommands];
}

- (void)dealloc
{
  ioThreadDispatch = self->_ioThreadDispatch;
  if (ioThreadDispatch)
  {
    dispatch_release(ioThreadDispatch);
    self->_ioThreadDispatch = 0;
  }
  decompressionQueue = self->_decompressionQueue;
  if (decompressionQueue)
  {
    dispatch_release(decompressionQueue);
    self->_decompressionQueue = 0;
  }

  self->_pendingQueue = 0;
  self->_submittedQueue = 0;
  commandQueueEventSource = self->_commandQueueEventSource;
  if (commandQueueEventSource)
  {
    dispatch_source_cancel(commandQueueEventSource);
    dispatch_release((dispatch_object_t)self->_commandQueueEventSource);
    self->_commandQueueEventSource = 0;
  }
  completionQueueDispatch = self->_completionQueueDispatch;
  if (completionQueueDispatch)
  {
    dispatch_release(completionQueueDispatch);
    self->_completionQueueDispatch = 0;
  }
  submissionQueueDispatch = self->_submissionQueueDispatch;
  if (submissionQueueDispatch)
  {
    dispatch_release(submissionQueueDispatch);
    self->_submissionQueueDispatch = 0;
  }
  IOGPUIOCommandQueueRelease(self->_ioCommandQueueRef);

  self->_gpuQueue = 0;
  self->_device = 0;
  v8.receiver = self;
  v8.super_class = (Class)IOGPUMetalIOCommandQueue;
  [(_MTLIOCommandQueue *)&v8 dealloc];
}

- (int64_t)getPriority
{
  return *(int64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12C18]);
}

- (id)commandBuffer
{
  v3 = [IOGPUMetalIOCommandBuffer alloc];
  v4 = [(IOGPUMetalIOCommandBuffer *)v3 initWithQueue:self resourceList:*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12C20]) retained:1];
  return v4;
}

- (id)commandBufferWithUnretainedReferences
{
  v3 = [IOGPUMetalIOCommandBuffer alloc];
  v4 = [(IOGPUMetalIOCommandBuffer *)v3 initWithQueue:self resourceList:*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12C20]) retained:0];
  return v4;
}

- (void)enqueueCommandBuffer:(id)a3
{
  p_pendingQueueLock = &self->_pendingQueueLock;
  pthread_mutex_lock(&self->_pendingQueueLock);
  [(NSMutableArray *)self->_pendingQueue addObject:a3];
  pthread_mutex_unlock(p_pendingQueueLock);
  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F12C28]) == (Class)1)
  {
    [(IOGPUMetalIOCommandQueue *)self enqueueBarrier];
  }
}

- (void)commitCommandBuffer:(id)a3
{
}

- (void)enqueueBarrier
{
  p_pendingQueueLock = &self->_pendingQueueLock;
  pthread_mutex_lock(&self->_pendingQueueLock);
  [(NSMutableArray *)self->_pendingQueue lastObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [(NSMutableArray *)self->_pendingQueue addObject:@"Barrier"];
  }
  pthread_mutex_unlock(p_pendingQueueLock);
  [(_MTLIOCommandQueue *)self returnActiveScratchBuffersToPool];
}

- (void)didComplete:(id)a3 withStatus:(int64_t)a4
{
  [a3 didCompleteWithStatus:a4];
  pthread_mutex_lock(&self->_submittedQueueLock);
  [(NSMutableArray *)self->_submittedQueue removeObject:a3];
  pthread_mutex_unlock(&self->_submittedQueueLock);
}

- (void)_submitAvailableCommands:(void *)a3
{
  v23[4] = *MEMORY[0x263EF8340];
  uint64_t v5 = (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3;
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](self, 24 * v5 + 8);
  objc_super v8 = (_DWORD *)((char *)v20 - v7);
  bzero((char *)v20 - v7, v9);
  *objc_super v8 = v5;
  v20[0] = v8;
  if (v5)
  {
    v10 = v8;
    uint64_t v11 = 0;
    unsigned int v12 = 0;
    v20[1] = v23;
    v13 = v10 + 3;
    do
    {
      uint64_t v14 = *(void *)(*(void *)a3 + v11);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(void *)(v13 + 1) = 0;
        *(void *)(v13 - 1) = 0;
      }
      else
      {
        if (([(id)v14 isCommitted] & 1) == 0) {
          -[IOGPUMetalIOCommandQueue _submitAvailableCommands:]();
        }
        *(v13 - 1) = *(_DWORD *)(v14 + 392);
        _DWORD *v13 = *(_DWORD *)(*(void *)(v14 + 312) + 128);
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        v23[0] = __53__IOGPUMetalIOCommandQueue__submitAvailableCommands___block_invoke;
        v23[1] = &unk_26441A5A0;
        v23[2] = self;
        v23[3] = v14;
        *(void *)(v13 + 1) = _Block_copy(aBlock);
        *((unsigned char *)v13 + 12) = [(id)v14 hasFollowOnWork];
        unsigned int v15 = atomic_load((unsigned int *)(v14 + 384));
        pthread_mutex_lock(&self->_submittedQueueLock);
        [(NSMutableArray *)self->_submittedQueue addObject:v14];
        pthread_mutex_unlock(&self->_submittedQueueLock);
        [(id)v14 globalTraceObjectID];
        v12 += v15 + 1;
        if (*(_DWORD *)__globalGPUCommPage)
        {
          [(MTLDevice *)self->_device globalTraceObjectID];
          IOGPUDeviceTraceEvent();
        }
      }

      v13 += 6;
      v11 += 8;
    }
    while (8 * v6 != v11);
  }
  else
  {
    unsigned int v12 = 0;
  }
  if (IOGPUIOCommandQueueSubmitIOCommands((uint64_t)self->_ioCommandQueueRef, v20[0], v12)) {
    BOOL v16 = v6 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    v17 = (uint64_t *)(v20[0] + 4);
    do
    {
      uint64_t v18 = *v17;
      if (*v17)
      {
        completionQueueDispatch = self->_completionQueueDispatch;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __53__IOGPUMetalIOCommandQueue__submitAvailableCommands___block_invoke_2;
        block[3] = &unk_26441A5C8;
        block[4] = v18;
        dispatch_async(completionQueueDispatch, block);
      }
      v17 += 3;
      --v6;
    }
    while (v6);
  }
  *((void *)a3 + 1) = *(void *)a3;
}

uint64_t __53__IOGPUMetalIOCommandQueue__submitAvailableCommands___block_invoke(uint64_t a1, unsigned int a2)
{
  return [*(id *)(a1 + 32) didComplete:*(void *)(a1 + 40) withStatus:a2];
}

void __53__IOGPUMetalIOCommandQueue__submitAvailableCommands___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 32);
  _Block_release(v2);
}

- (void)submitAvailableCommands
{
  __p = 0;
  v35 = 0;
  v36 = 0;
  p_pendingQueueLock = &self->_pendingQueueLock;
  v32 = self;
  v33 = p_pendingQueueLock;
  do
  {
    pthread_mutex_lock(p_pendingQueueLock);
    unsigned int v4 = [(NSMutableArray *)self->_pendingQueue count];
    uint64_t v5 = 0;
    if (v4)
    {
      int v6 = 0;
      BOOL v7 = 1;
      do
      {
        objc_super v8 = (unsigned int *)-[NSMutableArray objectAtIndex:](self->_pendingQueue, "objectAtIndex:", v5, v32);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          size_t v9 = v8;
          v10 = v35;
          if (v35 >= v36)
          {
            uint64_t v16 = (v35 - (unsigned char *)__p) >> 3;
            if ((unint64_t)(v16 + 1) >> 61) {
              std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v17 = (v36 - (unsigned char *)__p) >> 2;
            if (v17 <= v16 + 1) {
              unint64_t v17 = v16 + 1;
            }
            if ((unint64_t)(v36 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v18 = v17;
            }
            if (v18) {
              v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSObject *>>((uint64_t)&v36, v18);
            }
            else {
              v19 = 0;
            }
            v24 = (unsigned int **)&v19[8 * v16];
            *v24 = v8;
            uint64_t v11 = (char *)(v24 + 1);
            v26 = (char *)__p;
            v25 = v35;
            if (v35 != __p)
            {
              do
              {
                v27 = (unsigned int *)*((void *)v25 - 1);
                v25 -= 8;
                *--v24 = v27;
              }
              while (v25 != v26);
              v25 = (char *)__p;
            }
            __p = v24;
            v35 = v11;
            v36 = &v19[8 * v18];
            if (v25) {
              operator delete(v25);
            }
          }
          else
          {
            *(void *)v35 = v8;
            uint64_t v11 = v10 + 8;
          }
          v35 = v11;
        }
        else
        {
          if (![v8 isCommitted]) {
            goto LABEL_45;
          }
          unsigned int v12 = atomic_load(v8 + 96);
          if ([v8 validateNotificationCount])
          {
            if ((v12 + v6) >> 13) {
              goto LABEL_45;
            }
            v13 = v8;
            uint64_t v14 = v35;
            if (v35 >= v36)
            {
              uint64_t v20 = (v35 - (unsigned char *)__p) >> 3;
              if ((unint64_t)(v20 + 1) >> 61) {
                std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v21 = (v36 - (unsigned char *)__p) >> 2;
              if (v21 <= v20 + 1) {
                unint64_t v21 = v20 + 1;
              }
              if ((unint64_t)(v36 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v22 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v22 = v21;
              }
              if (v22) {
                v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSObject *>>((uint64_t)&v36, v22);
              }
              else {
                v23 = 0;
              }
              v28 = (unsigned int **)&v23[8 * v20];
              *v28 = v8;
              unsigned int v15 = (char *)(v28 + 1);
              v30 = (char *)__p;
              v29 = v35;
              if (v35 != __p)
              {
                do
                {
                  v31 = (unsigned int *)*((void *)v29 - 1);
                  v29 -= 8;
                  *--v28 = v31;
                }
                while (v29 != v30);
                v29 = (char *)__p;
              }
              __p = v28;
              v35 = v15;
              v36 = &v23[8 * v22];
              if (v29) {
                operator delete(v29);
              }
            }
            else
            {
              *(void *)v35 = v8;
              unsigned int v15 = v14 + 8;
            }
            v35 = v15;
            v6 += v12 + 1;
          }
        }
        BOOL v7 = ++v5 < (unint64_t)v4;
      }
      while (v5 != v4);
      LODWORD(v5) = v4;
    }
    else
    {
      BOOL v7 = 0;
    }
LABEL_45:
    -[NSMutableArray removeObjectsInRange:](self->_pendingQueue, "removeObjectsInRange:", 0, v5, v32);
    p_pendingQueueLock = v33;
    pthread_mutex_unlock(v33);
    if (__p == v35) {
      break;
    }
    [(IOGPUMetalIOCommandQueue *)self _submitAvailableCommands:&__p];
    if (__p != v35) {
      __assert_rtn("-[IOGPUMetalIOCommandQueue submitAvailableCommands]", "IOGPUMetalIOCommandQueue.mm", 550, "submitCommands.empty()");
    }
  }
  while (v7);

  if (__p)
  {
    v35 = (char *)__p;
    operator delete(__p);
  }
}

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

- (void)setLabel:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalIOCommandQueue;
  -[_MTLObjectWithLabel setLabel:](&v9, sel_setLabel_);
  if (*(_DWORD *)__globalGPUCommPage)
  {
    uint64_t v5 = [(MTLDevice *)self->_device deviceRef];
    unint64_t globalTraceObjectID = self->_globalTraceObjectID;
    uint64_t v7 = (int)*MEMORY[0x263F12C08];
    uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
    [a3 cStringUsingEncoding:1];
    *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)IOGPUDeviceTraceObjectLabel(v5, 8, 0, globalTraceObjectID, v8);
  }
}

- (void)launchIOGPUIOThreads
{
  uint64_t v2 = (int)*MEMORY[0x263F12C10];
  if (*(Class *)((char *)&self->super.super.super.isa + v2))
  {
    unsigned int v4 = 0;
    uint64_t v5 = MEMORY[0x263EF8330];
    do
    {
      ioThreadDispatch = self->_ioThreadDispatch;
      block[0] = v5;
      block[1] = 3221225472;
      block[2] = __48__IOGPUMetalIOCommandQueue_launchIOGPUIOThreads__block_invoke;
      block[3] = &unk_26441A5F0;
      block[4] = self;
      dispatch_async(ioThreadDispatch, block);
      unsigned int v4 = (objc_class *)((char *)v4 + 1);
    }
    while (v4 < *(Class *)((char *)&self->super.super.super.isa + v2));
  }
}

uint64_t __48__IOGPUMetalIOCommandQueue_launchIOGPUIOThreads__block_invoke(uint64_t a1)
{
  do
    uint64_t result = IOGPUIOCommandQueuePerformIO(*(void *)(*(void *)(a1 + 32) + 400));
  while (result != -536870165);
  return result;
}

- (id)getDecompressionQueue
{
  return self->_decompressionQueue;
}

- (void)commandBufferComplete
{
}

- (void)_submitAvailableCommands:.cold.1()
{
}

@end