@interface _MTLCommandQueue
- (BOOL)_submitAvailableCommandBuffers;
- (BOOL)commitSynchronously;
- (BOOL)commitsWithQoS;
- (BOOL)disableCrossQueueHazardTracking;
- (BOOL)executionEnabled;
- (BOOL)getPrivateDataAndOffset:(id *)a3 privateDataOffset:(unint64_t *)a4;
- (BOOL)isOpenGLQueue;
- (BOOL)isProfilingEnabled;
- (BOOL)isStatEnabled;
- (BOOL)skipRender;
- (BOOL)submitCommandBuffer:(id)a3;
- (OS_dispatch_queue)commitQueue;
- (OS_dispatch_queue)completionQueue;
- (_MTLCommandQueue)initWithDevice:(id)a3;
- (_MTLCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4;
- (_MTLCommandQueue)initWithDevice:(id)a3 maxCommandBufferCount:(unint64_t)a4;
- (id)availableCounters;
- (id)commandBufferWithDescriptor:(id)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (int)backgroundTrackingPID;
- (int)requestCounters:(id)a3;
- (int)requestCounters:(id)a3 withIndex:(unint64_t)a4;
- (unint64_t)getAndIncrementNumCommandBuffers;
- (unint64_t)getListIndex;
- (unint64_t)getStatLocations;
- (unint64_t)getStatOptions;
- (unint64_t)globalTraceObjectID;
- (unint64_t)maxCommandBufferCount;
- (unint64_t)numCommandBuffers;
- (unint64_t)qosLevel;
- (void)addPerfSampleHandler:(id)a3;
- (void)addResidencySet:(id)a3;
- (void)addResidencySets:(id *)a3 count:(unint64_t)a4;
- (void)commandBufferDidComplete:(id)a3 startTime:(unint64_t)a4 completionTime:(unint64_t)a5 error:(id)a6;
- (void)commitCommandBuffer:(id)a3 wake:(BOOL)a4;
- (void)completeCommandBuffers:(id *)a3 count:(unint64_t)a4;
- (void)dealloc;
- (void)enqueueCommandBuffer:(id)a3;
- (void)finish;
- (void)releasePrivateData:(id *)a3 privateDataOffset:(unint64_t)a4;
- (void)removeResidencySet:(id)a3;
- (void)removeResidencySets:(id *)a3 count:(unint64_t)a4;
- (void)setBackgroundTrackingPID:(int)a3;
- (void)setExecutionEnabled:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setListIndex:(unint64_t)a3;
- (void)setPrivateData:(id)a3 privateDataOffset:(unint64_t)a4 logState:(id)a5;
- (void)setProfilingEnabled:(BOOL)a3;
- (void)setSkipRender:(BOOL)a3;
- (void)setStatEnabled:(BOOL)a3;
- (void)setStatLocations:(unint64_t)a3;
- (void)setStatOptions:(unint64_t)a3;
- (void)setSubmissionQueue:(id)a3;
@end

@implementation _MTLCommandQueue

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

- (int)backgroundTrackingPID
{
  return self->_backgroundTrackingPID;
}

- (_MTLCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4
{
  uint64_t v55 = 0;
  memset(v54, 0, sizeof(v54));
  _MTLMessageContextBegin_((uint64_t)v54, (uint64_t)"-[_MTLCommandQueue initWithDevice:descriptor:]", 141, (uint64_t)a3, 13, (uint64_t)"Command Queue Creation Validation");
  if (!a3)
  {
    v36 = @"device must not be nil.";
    uint64_t v37 = 4;
LABEL_43:
    _MTLMessageContextPush_((uint64_t)v54, v37, (uint64_t)v36, v7, v8, v9, v10, v11, v50);
    goto LABEL_3;
  }
  if (MTLFailureTypeGetEnabled(1uLL) && ([a3 conformsToProtocol:&unk_1ECB3F6B8] & 1) == 0)
  {
    v36 = @"device is not a MTLDevice.";
    uint64_t v37 = 8;
    goto LABEL_43;
  }
LABEL_3:
  if (![a4 maxCommandBufferCount])
  {
    uint64_t v38 = [a4 maxCommandBufferCount];
    _MTLMessageContextPush_((uint64_t)v54, 4, @"invalid descriptor.maxCommandBufferCount value %u", v39, v40, v41, v42, v43, v38);
  }
  if ([a4 qosLevel]
    && [a4 qosLevel] != 1
    && [a4 qosLevel] != 2
    && [a4 qosLevel] != 3
    && [a4 qosLevel] != 4)
  {
    uint64_t v44 = [a4 qosLevel];
    _MTLMessageContextPush_((uint64_t)v54, 4, @"invalid descriptor.qosLevel value %u", v45, v46, v47, v48, v49, v44);
  }
  if ([a3 _rateLimitQueueCreation]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[_MTLCommandQueue initWithDevice:descriptor:]();
  }
  v53.receiver = self;
  v53.super_class = (Class)_MTLCommandQueue;
  v12 = [(_MTLObjectWithLabel *)&v53 init];
  if (v12)
  {
    *((_DWORD *)v12 + 54) = getpid();
    *((void *)v12 + 4) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v12 + 5) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pthread_mutex_init((pthread_mutex_t *)(v12 + 48), 0);
    pthread_mutex_init((pthread_mutex_t *)(v12 + 112), 0);
    *((void *)v12 + 22) = dispatch_group_create();
    v12[345] = 1;
    dispatch_semaphore_t v13 = dispatch_semaphore_create([a4 maxCommandBufferCount]);
    *((void *)v12 + 26) = v13;
    if (!v13) {
      _MTLMessageContextPush_((uint64_t)v54, 4, @"cannot create command-buffer counting semaphore", v14, v15, v16, v17, v18, v50);
    }
    *((void *)v12 + 38) = [a4 maxCommandBufferCount];
    *((void *)v12 + 39) = [a4 qosLevel];
    *((void *)v12 + 40) = [a4 commitQueue];
    v12[328] = [a4 commitSynchronously];
    *((void *)v12 + 42) = [a4 completionQueue];
    v12[344] = [a4 disableCrossQueueHazardTracking];
    v12[347] = [a4 isOpenGLQueue];
    if ([a4 commitQueue])
    {
      v19 = [a4 commitQueue];
      *((void *)v12 + 23) = v19;
      dispatch_retain(v19);
    }
    if ([a4 completionQueue])
    {
      v20 = [a4 completionQueue];
      *((void *)v12 + 24) = v20;
      dispatch_retain(v20);
    }
    v12[376] = [a4 commitsWithQoS];
    v21 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    if (!*((void *)v12 + 23)) {
      *((void *)v12 + 23) = dispatch_queue_create("com.Metal.CommandQueueDispatch", v21);
    }
    if (!*((void *)v12 + 24)) {
      *((void *)v12 + 24) = dispatch_queue_create("com.Metal.CompletionQueueDispatch", v21);
    }
    dispatch_release(v21);
    v22 = dispatch_source_create(MEMORY[0x1E4F14438], 0, 0, *((dispatch_queue_t *)v12 + 23));
    *((void *)v12 + 25) = v22;
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x3052000000;
    v52[3] = __Block_byref_object_copy__13;
    v52[4] = __Block_byref_object_dispose__13;
    v52[5] = v12;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __46___MTLCommandQueue_initWithDevice_descriptor___block_invoke;
    handler[3] = &unk_1E5220550;
    handler[4] = v52;
    dispatch_source_set_event_handler(v22, handler);
    dispatch_resume(*((dispatch_object_t *)v12 + 25));
    id v23 = a3;
    *((void *)v12 + 3) = v23;
    [v23 _incrementCommandQueueCount];
    v12[256] = 0;
    *((void *)v12 + 33) = 0;
    *((void *)v12 + 34) = 0;
    *((void *)v12 + 36) = 0;
    atomic_store(0, (unsigned int *)v12 + 70);
    if ([a4 logState])
    {
      v24 = (void *)[a4 logState];
    }
    else
    {
      v25 = (void *)*((void *)v12 + 3);
      if (!v25[45])
      {
        id v26 = 0;
        goto LABEL_32;
      }
      if (![v25 defaultLogState]) {
        [*((id *)v12 + 3) initDefaultLogState];
      }
      v24 = (void *)[*((id *)v12 + 3) defaultLogState];
    }
    id v26 = v24;
LABEL_32:
    *((void *)v12 + 31) = v26;
    *((void *)v12 + 37) = 0;
    dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
    *((void *)v12 + 44) = v27;
    if (!v27) {
      _MTLMessageContextPush_((uint64_t)v54, 4, @"cannot create presentation semaphore", v28, v29, v30, v31, v32, v50);
    }
    if (initWithDevice_descriptor__onceToken != -1) {
      dispatch_once(&initWithDevice_descriptor__onceToken, &__block_literal_global_22);
    }
    char v33 = [a4 commitSynchronously];
    if (initWithDevice_descriptor__force_immediate_submission_on_commit_thread) {
      char v34 = 1;
    }
    else {
      char v34 = v33;
    }
    v12[360] = v34;
    *((void *)v12 + 46) = objc_alloc_init(MTLPrivateDataTable);
    _Block_object_dispose(v52, 8);
  }
  _MTLMessageContextEnd((uint64_t)v54);
  return (_MTLCommandQueue *)v12;
}

- (void)commandBufferDidComplete:(id)a3 startTime:(unint64_t)a4 completionTime:(unint64_t)a5 error:(id)a6
{
  if (!a3)
  {
    uint64_t v15 = @"commandBuffer must not be nil.";
    unint64_t v16 = 0;
    uint64_t v17 = 673;
LABEL_11:
    MTLReportFailure(v16, "-[_MTLCommandQueue commandBufferDidComplete:startTime:completionTime:error:]", v17, (uint64_t)v15, a5, (uint64_t)a6, v6, v7, v22);
    goto LABEL_4;
  }
  if (MTLFailureTypeGetEnabled(1uLL) && ([a3 conformsToProtocol:&unk_1ECB41B78] & 1) == 0) {
    MTLReportFailure(1uLL, "-[_MTLCommandQueue commandBufferDidComplete:startTime:completionTime:error:]", 676, @"commandBuffer is not a MTLCommandBuffer.", v18, v19, v20, v21, v22);
  }
  uint64_t v13 = [(_MTLCommandQueue *)self device];
  if (v13 != [a3 device])
  {
    uint64_t v15 = @"commandBuffer is associated with a different device";
    unint64_t v16 = 1;
    uint64_t v17 = 677;
    goto LABEL_11;
  }
LABEL_4:
  [a3 didCompleteWithStartTime:a4 endTime:a5 error:a6];
  pthread_mutex_lock(&self->_submittedQueueLock);
  [(NSMutableArray *)self->_submittedQueue removeObject:a3];
  pthread_mutex_unlock(&self->_submittedQueueLock);
  submittedGroup = self->_submittedGroup;

  dispatch_group_leave(submittedGroup);
}

- (void)commitCommandBuffer:(id)a3 wake:(BOOL)a4
{
  BOOL v8 = a4;
  if (!a3)
  {
    uint64_t v17 = @"commandBuffer must not be nil.";
    unint64_t v18 = 0;
    uint64_t v19 = 630;
LABEL_21:
    MTLReportFailure(v18, "-[_MTLCommandQueue commitCommandBuffer:wake:]", v19, (uint64_t)v17, v4, v5, v6, v7, v24);
    goto LABEL_4;
  }
  if (MTLFailureTypeGetEnabled(1uLL) && ([a3 conformsToProtocol:&unk_1ECB41B78] & 1) == 0) {
    MTLReportFailure(1uLL, "-[_MTLCommandQueue commitCommandBuffer:wake:]", 633, @"commandBuffer is not a MTLCommandBuffer.", v20, v21, v22, v23, v24);
  }
  uint64_t v11 = [(_MTLCommandQueue *)self device];
  if (v11 != [a3 device])
  {
    uint64_t v17 = @"commandBuffer is associated with a different device";
    unint64_t v18 = 1;
    uint64_t v19 = 634;
    goto LABEL_21;
  }
LABEL_4:
  dispatch_group_enter((dispatch_group_t)self->_submittedGroup);
  [a3 setCommitted:1];
  if (v8)
  {
    if (self->_forceImmediateSubmissionOnCommitThread)
    {
      v12 = self;
      commandQueueDispatch = self->_commandQueueDispatch;
      dispatch_sync_f(commandQueueDispatch, self, (dispatch_function_t)_submitAvailableCommandBuffers);
    }
    else if (self->_commitsWithQoS)
    {
      uint64_t v14 = self;
      uint64_t v15 = self->_commandQueueDispatch;
      dispatch_async_f(v15, self, (dispatch_function_t)_submitAvailableCommandBuffers);
    }
    else
    {
      commandQueueEventSource = self->_commandQueueEventSource;
      dispatch_source_merge_data(commandQueueEventSource, 1uLL);
    }
  }
}

- (void)setPrivateData:(id)a3 privateDataOffset:(unint64_t)a4 logState:(id)a5
{
}

- (void)enqueueCommandBuffer:(id)a3
{
  if (a3)
  {
    if (MTLFailureTypeGetEnabled(1uLL) && ([a3 conformsToProtocol:&unk_1ECB41B78] & 1) == 0) {
      MTLReportFailure(1uLL, "-[_MTLCommandQueue enqueueCommandBuffer:]", 470, @"commandBuffer is not a MTLCommandBuffer.", v15, v16, v17, v18, v19);
    }
    uint64_t v10 = [(_MTLCommandQueue *)self device];
    if (v10 != [a3 device]) {
      MTLReportFailure(1uLL, "-[_MTLCommandQueue enqueueCommandBuffer:]", 471, @"commandBuffer is associated with a different device", v11, v12, v13, v14, v19);
    }
    pthread_mutex_lock(&self->_pendingQueueLock);
    [(NSMutableArray *)self->_pendingQueue addObject:a3];
    pthread_mutex_unlock(&self->_pendingQueueLock);
  }
  else
  {
    MTLReportFailure(0, "-[_MTLCommandQueue enqueueCommandBuffer:]", 467, @"commandBuffer must not be nil.", v3, v4, v5, v6, v21);
  }
}

- (unint64_t)getAndIncrementNumCommandBuffers
{
  return (int)MTLAtomicIncrement(&self->_numCommandBuffers);
}

- (BOOL)_submitAvailableCommandBuffers
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_pendingQueueLock = &self->_pendingQueueLock;
  pthread_mutex_lock(&self->_pendingQueueLock);
  uint64_t v4 = [(NSMutableArray *)self->_pendingQueue count];
  if (!v4)
  {
    pthread_mutex_unlock(p_pendingQueueLock);
LABEL_30:
    uint64_t v15 = 0;
    unint64_t v14 = 0;
    goto LABEL_31;
  }
  unint64_t v5 = 0;
  while (objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_pendingQueue, "objectAtIndex:", v5), "isCommitted"))
  {
    if (v4 == ++v5)
    {
      unint64_t v5 = v4;
      break;
    }
  }
  pthread_mutex_unlock(p_pendingQueueLock);
  if (!v5) {
    goto LABEL_30;
  }
  uint64_t v20 = v4;
  uint64_t v18 = self;
  unint64_t v19 = v5;
  uint64_t v21 = p_pendingQueueLock;
  do
  {
    pthread_mutex_lock(p_pendingQueueLock);
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = [(NSMutableArray *)self->_pendingQueue objectAtIndex:v6];
      if (*(unsigned char *)(v7 + 504)) {
        break;
      }
      if (v5 == ++v6)
      {
        uint64_t v8 = 0;
        unint64_t v9 = v5;
        goto LABEL_13;
      }
    }
    uint64_t v8 = *(void *)(v7 + 552);
    unint64_t v9 = v6 + 1;
LABEL_13:
    pthread_mutex_lock(&self->_submittedQueueLock);
    uint64_t v22 = [(NSMutableArray *)self->_submittedQueue count];
    if (v9 >= 0x81) {
      uint64_t v10 = malloc_type_malloc(8 * v9, 0x80040B8603338uLL);
    }
    else {
      uint64_t v10 = v23;
    }
    -[NSMutableArray getObjects:range:](self->_pendingQueue, "getObjects:range:", v10, 0, v9);
    uint64_t v11 = 0;
    do
      id v12 = *(id *)&v10[8 * v11++];
    while (v9 != v11);
    -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:](self->_submittedQueue, "replaceObjectsInRange:withObjectsFromArray:range:", v22, 0, self->_pendingQueue, 0, v9);
    -[NSMutableArray removeObjectsInRange:](self->_pendingQueue, "removeObjectsInRange:", 0, v9);
    pthread_mutex_unlock(&self->_submittedQueueLock);
    p_pendingQueueLock = v21;
    pthread_mutex_unlock(v21);
    if (self->_executionEnabled) {
      [(_MTLCommandQueue *)self submitCommandBuffers:v10 count:v9];
    }
    else {
      [(_MTLCommandQueue *)self completeCommandBuffers:v10 count:v9];
    }
    uint64_t v13 = 0;
    do

    while (v9 != v13);
    if (v10 != v23) {
      free(v10);
    }
    for (; v8; --v8)
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_presentScheduledSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v5 -= v9;
  }
  while (v5);
  unint64_t v14 = v19;
  uint64_t v4 = v20;
  uint64_t v15 = v18;
LABEL_31:
  BOOL v16 = v14 == v4;

  return v16;
}

- (BOOL)submitCommandBuffer:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  commandQueueDispatch = self->_commandQueueDispatch;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40___MTLCommandQueue_submitCommandBuffer___block_invoke;
  v6[3] = &unk_1E52203E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(commandQueueDispatch, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (_MTLCommandQueue)initWithDevice:(id)a3
{
  return [(_MTLCommandQueue *)self initWithDevice:a3 maxCommandBufferCount:64];
}

- (_MTLCommandQueue)initWithDevice:(id)a3 maxCommandBufferCount:(unint64_t)a4
{
  uint64_t v7 = objc_alloc_init(MTLCommandQueueDescriptor);
  [(MTLCommandQueueDescriptor *)v7 setMaxCommandBufferCount:a4];

  return [(_MTLCommandQueue *)self initWithDevice:a3 descriptor:v7];
}

- (void)dealloc
{
  commandQueueEventSource = self->_commandQueueEventSource;
  if (commandQueueEventSource)
  {
    dispatch_source_cancel(commandQueueEventSource);
    dispatch_release((dispatch_object_t)self->_commandQueueEventSource);
  }
  commandQueueDispatch = self->_commandQueueDispatch;
  if (commandQueueDispatch) {
    dispatch_release(commandQueueDispatch);
  }
  self->_commandQueueDispatch = 0;
  completionQueueDispatch = self->_completionQueueDispatch;
  if (completionQueueDispatch) {
    dispatch_release(completionQueueDispatch);
  }
  self->_completionQueueDispatch = 0;

  self->_pendingQueue = 0;
  self->_submittedQueue = 0;
  dispatch_release((dispatch_object_t)self->_submittedGroup);
  dispatch_release((dispatch_object_t)self->_commandBufferSemaphore);
  pthread_mutex_destroy(&self->_submittedQueueLock);
  pthread_mutex_destroy(&self->_pendingQueueLock);
  [(_MTLDevice *)self->_dev _decrementCommandQueueCount];

  self->_dev = 0;
  id perfSampleHandlerBlock = self->_perfSampleHandlerBlock;
  if (perfSampleHandlerBlock) {
    _Block_release(perfSampleHandlerBlock);
  }
  presentScheduledSemaphore = self->_presentScheduledSemaphore;
  if (presentScheduledSemaphore)
  {
    dispatch_release(presentScheduledSemaphore);
    self->_presentScheduledSemaphore = 0;
  }
  privateDataTable = self->_privateDataTable;
  if (privateDataTable)
  {

    self->_privateDataTable = 0;
  }

  v9.receiver = self;
  v9.super_class = (Class)_MTLCommandQueue;
  [(_MTLObjectWithLabel *)&v9 dealloc];
}

- (void)setLabel:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_MTLCommandQueue;
  [(_MTLObjectWithLabel *)&v3 setLabel:a3];
}

- (void)setSubmissionQueue:(id)a3
{
  commandQueueEventSource = self->_commandQueueEventSource;
  if (commandQueueEventSource)
  {
    dispatch_source_cancel(commandQueueEventSource);
    dispatch_release((dispatch_object_t)self->_commandQueueEventSource);
  }
  commandQueueDispatch = self->_commandQueueDispatch;
  if (commandQueueDispatch) {
    dispatch_release(commandQueueDispatch);
  }
  dispatch_retain((dispatch_object_t)a3);
  self->_commandQueueDispatch = (OS_dispatch_queue *)a3;
  uint64_t v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14438], 0, 0, (dispatch_queue_t)a3);
  self->_commandQueueEventSource = v7;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3052000000;
  v9[3] = __Block_byref_object_copy__13;
  v9[4] = __Block_byref_object_dispose__13;
  v9[5] = self;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __39___MTLCommandQueue_setSubmissionQueue___block_invoke;
  handler[3] = &unk_1E5220550;
  handler[4] = v9;
  dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
  dispatch_resume((dispatch_object_t)self->_commandQueueEventSource);
  _Block_object_dispose(v9, 8);
}

- (unint64_t)numCommandBuffers
{
  return (int)atomic_load((unsigned int *)&self->_numCommandBuffers);
}

- (id)formattedDescription:(unint64_t)a3
{
  v15[6] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v6 = [(_MTLObjectWithLabel *)self retainedLabel];
  uint64_t v7 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)_MTLCommandQueue;
  id v8 = [(_MTLCommandQueue *)&v14 description];
  v15[0] = v5;
  v15[1] = @"label =";
  objc_super v9 = @"<none>";
  if (v6) {
    objc_super v9 = v6;
  }
  v15[2] = v9;
  v15[3] = v5;
  v15[4] = @"device =";
  uint64_t v10 = objc_msgSend((id)-[_MTLCommandQueue device](self, "device"), "formattedDescription:", v4);
  uint64_t v11 = @"<null>";
  if (v10) {
    uint64_t v11 = (__CFString *)v10;
  }
  v15[5] = v11;
  id v12 = (void *)[v7 stringWithFormat:@"%@%@", v8, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 6), "componentsJoinedByString:", @" "];

  return v12;
}

- (id)description
{
  return [(_MTLCommandQueue *)self formattedDescription:0];
}

- (id)commandBufferWithDescriptor:(id)a3
{
  if ([a3 retainedReferences]) {
    uint64_t v5 = (void *)[(_MTLCommandQueue *)self commandBuffer];
  }
  else {
    uint64_t v5 = (void *)[(_MTLCommandQueue *)self commandBufferWithUnretainedReferences];
  }
  uint64_t v6 = v5;
  objc_msgSend(v5, "setErrorOptions:", objc_msgSend(a3, "errorOptions"));
  return v6;
}

- (BOOL)getPrivateDataAndOffset:(id *)a3 privateDataOffset:(unint64_t *)a4
{
  privateDataTable = self->_privateDataTable;
  uint64_t v7 = [(_MTLCommandQueue *)self device];

  return [(MTLPrivateDataTable *)privateDataTable getPrivateDataAndOffset:v7 privateData:a3 privateDataOffset:a4];
}

- (void)releasePrivateData:(id *)a3 privateDataOffset:(unint64_t)a4
{
}

- (void)completeCommandBuffers:(id *)a3 count:(unint64_t)a4
{
  uint64_t v7 = mach_absolute_time();
  if (a4)
  {
    uint64_t v12 = v7;
    do
    {
      id v13 = *a3;
      if (*a3)
      {
        if (MTLFailureTypeGetEnabled(1uLL) && ([v13 conformsToProtocol:&unk_1ECB41B78] & 1) == 0) {
          MTLReportFailure(1uLL, "-[_MTLCommandQueue completeCommandBuffers:count:]", 601, @"commandBuffer is not a MTLCommandBuffer.", v20, v21, v22, v23, v24);
        }
        uint64_t v14 = [(_MTLCommandQueue *)self device];
        if (v14 == [v13 device]) {
          goto LABEL_6;
        }
        unint64_t v17 = 1;
        uint64_t v18 = 602;
        unint64_t v19 = @"commandBuffer is associated with a different device";
      }
      else
      {
        unint64_t v17 = 0;
        uint64_t v18 = 598;
        unint64_t v19 = @"commandBuffer must not be nil.";
      }
      MTLReportFailure(v17, "-[_MTLCommandQueue completeCommandBuffers:count:]", v18, (uint64_t)v19, v8, v9, v10, v11, v24);
LABEL_6:
      commandQueueDispatch = self->_commandQueueDispatch;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49___MTLCommandQueue_completeCommandBuffers_count___block_invoke;
      block[3] = &unk_1E5220270;
      block[4] = v13;
      block[5] = v12;
      dispatch_async(commandQueueDispatch, block);
      BOOL v16 = self->_commandQueueDispatch;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __49___MTLCommandQueue_completeCommandBuffers_count___block_invoke_2;
      v25[3] = &unk_1E521FDD0;
      v25[4] = self;
      v25[5] = v13;
      v25[6] = v12;
      dispatch_async(v16, v25);
      ++a3;
      --a4;
    }
    while (a4);
  }
}

- (void)finish
{
}

- (id)availableCounters
{
  MTLReleaseAssertionFailure((uint64_t)"-[_MTLCommandQueue availableCounters]", 725, (uint64_t)"false", (uint64_t)"Metal Vendor Statistics not implemented", v2, v3, v4, v5, vars0);
}

- (int)requestCounters:(id)a3
{
  MTLReleaseAssertionFailure((uint64_t)"-[_MTLCommandQueue requestCounters:]", 731, (uint64_t)"false", (uint64_t)"Metal Vendor Statistics not implemented", v3, v4, v5, v6, vars0);
}

- (void)addPerfSampleHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_release(self->_perfSampleHandlerBlock);
  self->_id perfSampleHandlerBlock = v4;
}

- (int)requestCounters:(id)a3 withIndex:(unint64_t)a4
{
  self->_listIndex = a4;
  return [(_MTLCommandQueue *)self requestCounters:a3];
}

- (void)addResidencySet:(id)a3
{
}

- (void)addResidencySets:(id *)a3 count:(unint64_t)a4
{
}

- (void)removeResidencySet:(id)a3
{
}

- (void)removeResidencySets:(id *)a3 count:(unint64_t)a4
{
}

- (BOOL)skipRender
{
  return self->_skipRender;
}

- (void)setSkipRender:(BOOL)a3
{
  self->_skipRender = a3;
}

- (BOOL)isProfilingEnabled
{
  return self->_profilingEnabled;
}

- (void)setProfilingEnabled:(BOOL)a3
{
  self->_profilingEnabled = a3;
}

- (BOOL)isStatEnabled
{
  return self->_StatEnabled;
}

- (void)setStatEnabled:(BOOL)a3
{
  self->_StatEnabled = a3;
}

- (unint64_t)getStatOptions
{
  return self->_StatOptions;
}

- (void)setStatOptions:(unint64_t)a3
{
  self->_StatOptions = a3;
}

- (unint64_t)getStatLocations
{
  return self->_StatLocations;
}

- (void)setStatLocations:(unint64_t)a3
{
  self->_StatLocations = a3;
}

- (unint64_t)getListIndex
{
  return self->_listIndex;
}

- (void)setListIndex:(unint64_t)a3
{
  self->_listIndex = a3;
}

- (unint64_t)maxCommandBufferCount
{
  return self->_maxCommandBufferCount;
}

- (unint64_t)qosLevel
{
  return self->_qosLevel;
}

- (OS_dispatch_queue)commitQueue
{
  return self->_commitQueue;
}

- (BOOL)commitSynchronously
{
  return self->_commitSynchronously;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (BOOL)disableCrossQueueHazardTracking
{
  return self->_disableCrossQueueHazardTracking;
}

- (BOOL)executionEnabled
{
  return self->_executionEnabled;
}

- (void)setExecutionEnabled:(BOOL)a3
{
  self->_executionEnabled = a3;
}

- (void)setBackgroundTrackingPID:(int)a3
{
  self->_backgroundTrackingPID = a3;
}

- (BOOL)isOpenGLQueue
{
  return self->_openGLQueue;
}

- (BOOL)commitsWithQoS
{
  return self->_commitsWithQoS;
}

- (void)initWithDevice:descriptor:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Command queue creation delayed, queues are being created too quickly.", v0, 2u);
}

@end