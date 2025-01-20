@interface MTLIOAccelCommandQueue
- (BOOL)_setGPUPriority:(unint64_t)a3 backgroundPriority:(unint64_t)a4;
- (BOOL)setBackgroundGPUPriority:(unint64_t)a3;
- (BOOL)setBackgroundGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4;
- (BOOL)setGPUPriority:(unint64_t)a3;
- (BOOL)setGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4;
- (MTLDevice)device;
- (MTLIOAccelCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4;
- (unint64_t)getBackgroundGPUPriority;
- (unint64_t)getGPUPriority;
- (void)dealloc;
- (void)setCompletionQueue:(id)a3;
- (void)setLabel:(id)a3;
- (void)submitCommandBuffers:(const void *)a3 count:(unint64_t)a4;
@end

@implementation MTLIOAccelCommandQueue

- (MTLIOAccelCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelCommandQueue;
  v5 = [(_MTLCommandQueue *)&v8 initWithDevice:a3 descriptor:a4];
  if (v5)
  {
    v5->_device = (MTLDevice *)a3;
    [a3 sharedRef];
    uint64_t v6 = IOAccelCommandQueueCreateWithQoS();
    v5->_commandQueue = (__IOAccelCommandQueue *)v6;
    if (v6)
    {
      IOAccelCommandQueueSetDispatchQueue();
      v5->_priority = 1;
      v5->_backgroundPriority = 3;
      v5->super._globalTraceObjectID = IOAccelCommandQueueGetGlobalTraceObjectID();
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)setLabel:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelCommandQueue;
  -[_MTLCommandQueue setLabel:](&v5, sel_setLabel_);
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [(MTLDevice *)self->_device deviceRef];
    [a3 cStringUsingEncoding:1];
    self->super._labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
}

- (void)dealloc
{
  IOAccelCommandQueueRelease();

  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelCommandQueue;
  [(_MTLCommandQueue *)&v3 dealloc];
}

- (void)setCompletionQueue:(id)a3
{
  completionQueueDispatch = self->super._completionQueueDispatch;
  if (completionQueueDispatch) {
    dispatch_release(completionQueueDispatch);
  }
  self->super._completionQueueDispatch = (OS_dispatch_queue *)a3;
  dispatch_retain((dispatch_object_t)a3);

  IOAccelCommandQueueSetDispatchQueue();
}

- (BOOL)_setGPUPriority:(unint64_t)a3 backgroundPriority:(unint64_t)a4
{
  int v7 = IOAccelCommandQueueSetPriorityAndBackground();
  if (!v7)
  {
    self->_priority = a3;
    self->_backgroundPriority = a4;
  }
  return v7 == 0;
}

- (unint64_t)getGPUPriority
{
  return self->_priority;
}

- (BOOL)setGPUPriority:(unint64_t)a3
{
  validateGPUPriority(a3, 0, a3, v3, v4, v5, v6, v7);
  unint64_t backgroundPriority = self->_backgroundPriority;

  return [(MTLIOAccelCommandQueue *)self _setGPUPriority:a3 backgroundPriority:backgroundPriority];
}

- (BOOL)setGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  validateGPUPriority(a3, 0, a3, a4, v4, v5, v6, v7);
  unint64_t backgroundPriority = self->_backgroundPriority;

  return [(MTLIOAccelCommandQueue *)self _setGPUPriority:a3 backgroundPriority:backgroundPriority];
}

- (unint64_t)getBackgroundGPUPriority
{
  return self->_backgroundPriority;
}

- (BOOL)setBackgroundGPUPriority:(unint64_t)a3
{
  if (a3 >= 6) {
    MTLReportFailure(0, "validateGPUPriority", 121, @"priority (%d) is not a valid MTLGPUPriority", v3, v4, v5, v6, a3);
  }
  unint64_t priority = self->_priority;

  return [(MTLIOAccelCommandQueue *)self _setGPUPriority:priority backgroundPriority:a3];
}

- (BOOL)setBackgroundGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  if (a3 >= 6) {
    MTLReportFailure(0, "validateGPUPriority", 121, @"priority (%d) is not a valid MTLGPUPriority", v4, v5, v6, v7, a3);
  }
  unint64_t priority = self->_priority;

  return [(MTLIOAccelCommandQueue *)self _setGPUPriority:priority backgroundPriority:a3];
}

- (void)submitCommandBuffers:(const void *)a3 count:(unint64_t)a4
{
  aBlock[5] = *MEMORY[0x1E4F143B8];
  MEMORY[0x1F4188790](self);
  objc_super v8 = (_DWORD *)((char *)&v23 - ((v7 + 23) & 0xFFFFFFFFFFFFFFF0));
  bzero(v8, v9);
  v24 = v8;
  v8[1] = a4;
  if (a4)
  {
    uint64_t v26 = MEMORY[0x1E4F143A8];
    v25 = __53__MTLIOAccelCommandQueue_submitCommandBuffers_count___block_invoke;
    v10 = v24 + 3;
    unint64_t v11 = a4;
    do
    {
      v12 = *a3;
      uint64_t v13 = *((void *)*a3 + 73);
      *(v10 - 1) = *(_DWORD *)(*(void *)(v13 + 32) + 48);
      _DWORD *v10 = *(_DWORD *)(*(void *)(v13 + 64) + 48);
      aBlock[0] = v26;
      aBlock[1] = 3221225472;
      aBlock[2] = v25;
      aBlock[3] = &unk_1E5220C80;
      aBlock[4] = v12;
      v14 = _Block_copy(aBlock);
      *(void *)(v10 + 1) = v14;
      v12[76] = v14;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __53__MTLIOAccelCommandQueue_submitCommandBuffers_count___block_invoke_2;
      v30[3] = &unk_1E5220CA8;
      v30[4] = v12;
      v30[5] = self;
      v15 = _Block_copy(v30);
      *(void *)(v10 + 3) = v15;
      v12[77] = v15;
      if ([v12 isProfilingEnabled]) {
        [v12 kernelSubmitTime];
      }
      if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
      {
        objc_msgSend((id)objc_msgSend(v12, "commandQueue"), "backgroundTrackingPID");
        objc_msgSend((id)objc_msgSend(v12, "device"), "globalTraceObjectID");
        objc_msgSend((id)objc_msgSend(v12, "commandQueue"), "globalTraceObjectID");
        [v12 globalTraceObjectID];
        IOAccelDeviceTraceEvent();
      }
      ++a3;
      v10 += 6;
      --v11;
    }
    while (v11);
  }
  int v16 = IOAccelCommandQueueSubmitCommandBuffers();
  if (v16)
  {
    if (v16 == 268435459) {
      int v17 = 15;
    }
    else {
      int v17 = 1;
    }
    if (v16 == -536870174) {
      int v18 = 7;
    }
    else {
      int v18 = v17;
    }
    if (a4)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      v20 = (long long *)(v24 + 4);
      do
      {
        commandQueueDispatch = self->super._commandQueueDispatch;
        block[0] = v19;
        block[1] = 3221225472;
        block[2] = __53__MTLIOAccelCommandQueue_submitCommandBuffers_count___block_invoke_3;
        block[3] = &unk_1E5220CD0;
        long long v22 = *v20;
        v20 = (long long *)((char *)v20 + 24);
        long long v28 = v22;
        int v29 = v18;
        dispatch_async(commandQueueDispatch, block);
        --a4;
      }
      while (a4);
    }
  }
}

void __53__MTLIOAccelCommandQueue_submitCommandBuffers_count___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [*(id *)(a1 + 32) globalTraceObjectID];
    IOAccelDeviceTraceEvent();
  }
  if (a4)
  {
    id v9 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithIOAccelError:a4];
    [*(id *)(a1 + 32) didScheduleWithStartTime:a2 endTime:a3 error:v9];
  }
  else
  {
    objc_super v8 = *(void **)(a1 + 32);
    [v8 didScheduleWithStartTime:a2 endTime:a3 error:0];
  }
}

void __53__MTLIOAccelCommandQueue_submitCommandBuffers_count___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [*(id *)(a1 + 32) globalTraceObjectID];
    IOAccelDeviceTraceEvent();
  }
  if (a4)
  {
    id v10 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithIOAccelError:a4];
    [*(id *)(a1 + 40) commandBufferDidComplete:*(void *)(a1 + 32) startTime:a2 completionTime:a3 error:v10];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    objc_super v8 = *(void **)(a1 + 40);
    [v8 commandBufferDidComplete:v9 startTime:a2 completionTime:a3 error:0];
  }
}

void __53__MTLIOAccelCommandQueue_submitCommandBuffers_count___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  v2 = *(const void **)(a1 + 40);

  _Block_release(v2);
}

- (MTLDevice)device
{
  return self->_device;
}

@end