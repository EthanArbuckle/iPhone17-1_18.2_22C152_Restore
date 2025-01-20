@interface _MTLCommandBuffer
+ (void)initialize;
- (BOOL)commitAndWaitUntilSubmitted;
- (BOOL)commitAndWaitUntilSubmittedWithDeadline:(unint64_t)a3;
- (BOOL)isCommitted;
- (BOOL)isProfilingEnabled;
- (BOOL)isStatEnabled;
- (BOOL)ownedByParallelEncoder;
- (BOOL)retainedReferences;
- (BOOL)skipRender;
- (BOOL)synchronousDebugMode;
- (MTLBuffer)privateData;
- (MTLBuffer)privateLoggingBuffer;
- (MTLCommandQueue)commandQueue;
- (MTLDeadlineProfile)deadlineProfile;
- (NSArray)logs;
- (NSDictionary)profilingResults;
- (NSError)error;
- (NSMutableDictionary)userDictionary;
- (_MTLCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4;
- (_MTLCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4 synchronousDebugMode:(BOOL)a5;
- (double)GPUEndTime;
- (double)GPUStartTime;
- (double)kernelEndTime;
- (double)kernelStartTime;
- (id)accelerationStructureCommandEncoder;
- (id)accelerationStructureCommandEncoderWithDescriptor:(id)a3;
- (id)computeCommandEncoderWithDescriptor:(id)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)progressTrackingBlitCommandEncoder;
- (id)progressTrackingComputeCommandEncoder;
- (id)progressTrackingRenderCommandEncoder;
- (unint64_t)errorOptions;
- (unint64_t)getAndIncrementNumEncoders;
- (unint64_t)getListIndex;
- (unint64_t)globalTraceObjectID;
- (unint64_t)numEncoders;
- (unint64_t)numThisCommandBuffer;
- (unint64_t)privateDataOffset;
- (unint64_t)status;
- (void)_addRetainedObject:(id)a3;
- (void)addCompletedHandler:(id)a3;
- (void)addScheduledHandler:(id)a3;
- (void)addSynchronizationNotification:(id)a3;
- (void)bindLogState;
- (void)commit;
- (void)commitAndHold;
- (void)commitAndReset;
- (void)commitWithDeadline:(unint64_t)a3;
- (void)configWithCommandBufferDescriptor:(id)a3;
- (void)dealloc;
- (void)debugBufferContentsWithLength:(unint64_t *)a3;
- (void)didCompleteWithStartTime:(unint64_t)a3 endTime:(unint64_t)a4 error:(id)a5;
- (void)didScheduleWithStartTime:(unint64_t)a3 endTime:(unint64_t)a4 error:(id)a5;
- (void)encodeConditionalAbortEvent:(id)a3;
- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 value:(unint64_t)a5 forIndex:(unint64_t)a6;
- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 values:(const unint64_t *)a5 indices:(const unint64_t *)a6 count:(unint64_t)a7;
- (void)encodeDashboardTagForResourceGroup:(id)a3;
- (void)enqueue;
- (void)executeSynchronizationNotifications:(int)a3;
- (void)executeSynchronizationNotifications:(int)a3 scope:(unint64_t)a4 resources:(const void *)a5 count:(unint64_t)a6;
- (void)initProgressTracking;
- (void)kernelSubmitTime;
- (void)presentDrawable:(id)a3;
- (void)presentDrawable:(id)a3 afterMinimumDuration:(double)a4;
- (void)presentDrawable:(id)a3 atTime:(double)a4;
- (void)presentDrawable:(id)a3 options:(id)a4;
- (void)processEncoderInfos;
- (void)pushDebugGroup:(id)a3;
- (void)setCommitted:(BOOL)a3;
- (void)setCurrentCommandEncoder:(id)a3;
- (void)setErrorOptions:(unint64_t)a3;
- (void)setLogs:(id)a3;
- (void)setNumEncoders:(unint64_t)a3;
- (void)setNumThisCommandBuffer:(unint64_t)a3;
- (void)setOwnedByParallelEncoder:(BOOL)a3;
- (void)setPrivateData:(id)a3;
- (void)setPrivateDataOffset:(unint64_t)a3;
- (void)setPrivateLoggingBuffer:(id)a3;
- (void)setProfilingEnabled:(BOOL)a3;
- (void)setResponsibleTaskIDs:(const unsigned int *)a3 count:(unsigned int)a4;
- (void)setStatEnabled:(BOOL)a3;
- (void)signalCommandBufferAvailable;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)waitUntilCompleted;
- (void)waitUntilScheduled;
@end

@implementation _MTLCommandBuffer

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

- (void)setCurrentCommandEncoder:(id)a3
{
  self->_currentCommandEncoder = (MTLCommandEncoder *)a3;
}

- (BOOL)ownedByParallelEncoder
{
  return self->_ownedByParallelEncoder;
}

- (BOOL)skipRender
{
  return self->_skipRender;
}

- (MTLBuffer)privateData
{
  return self->_privateData;
}

- (unint64_t)privateDataOffset
{
  return self->_privateDataOffset;
}

- (MTLCommandQueue)commandQueue
{
  return self->_queue;
}

- (BOOL)isProfilingEnabled
{
  return self->_profilingEnabled;
}

- (BOOL)commitAndWaitUntilSubmitted
{
  self->_wakeOnCommit = 0;
  [(_MTLCommandBuffer *)self commit];
  queue = self->_queue;

  return [(MTLCommandQueue *)queue submitCommandBuffer:self];
}

- (void)configWithCommandBufferDescriptor:(id)a3
{
  if ([a3 logState])
  {
    logState = self->_logState;
    if (!logState)
    {
      [(MTLCommandQueue *)self->_queue getPrivateDataAndOffset:&self->_privateData privateDataOffset:&self->_privateDataOffset];
      logState = self->_logState;
    }

    v6 = (MTLLogState *)(id)[a3 logState];
    self->_logState = v6;
    self->_requiresBindingLogState = v6 != 0;
  }
}

- (void)setCommitted:(BOOL)a3
{
  self->_status = 2;
}

- (void)commit
{
  if (self->_status >= 2) {
    MTLReportFailure(0, "-[_MTLCommandBuffer commit]", 682, @"commit an already committed command buffer", v2, v3, v4, v5, v9);
  }
  if (self->_currentCommandEncoder) {
    MTLReportFailure(0, "-[_MTLCommandBuffer commit]", 683, @"commit command buffer with uncommitted encoder", v2, v3, v4, v5, v9);
  }
  [(MTLCommandQueue *)self->_queue setPrivateData:self->_privateData privateDataOffset:self->_privateDataOffset logState:self->_logState];
  [(_MTLCommandBuffer *)self executeSynchronizationNotifications:2];
  if (!self->_status)
  {
    [(MTLCommandQueue *)self->_queue enqueueCommandBuffer:self];
    self->_status = 1;
  }
  if (self->_profilingEnabled) {
    self->_commitTime = mach_absolute_time();
  }
  if (MEMORY[0x1E4F62300]) {
    FPCommandBufferCommitted();
  }
  queue = self->_queue;
  BOOL wakeOnCommit = self->_wakeOnCommit;

  [(MTLCommandQueue *)queue commitCommandBuffer:self wake:wakeOnCommit];
}

- (_MTLCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4 synchronousDebugMode:(BOOL)a5
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[_MTLCommandBuffer initWithQueue:retainedReferences:synchronousDebugMode:]", 326, @"queue is not a MTLCommandQueue.", v12, v13, v14, v15, (uint64_t)v22.receiver);
    }
    v22.receiver = self;
    v22.super_class = (Class)_MTLCommandBuffer;
    v16 = [(_MTLObjectWithLabel *)&v22 init];
    v17 = v16;
    if (v16)
    {
      v16->_error = 0;
      v16->_queue = (MTLCommandQueue *)a3;
      v17->_needsCommandBufferSemaphoreSignal = 1;
      dispatch_semaphore_wait(*((dispatch_semaphore_t *)v17->_queue + 26), 0xFFFFFFFFFFFFFFFFLL);
      *(_OWORD *)&v17->_mutex.__sig = _mutex_init;
      *(_OWORD *)&v17->_mutex.__opaque[8] = *(_OWORD *)algn_1828F2C70;
      *(_OWORD *)&v17->_mutex.__opaque[24] = xmmword_1828F2C80;
      *(_OWORD *)&v17->_mutex.__opaque[40] = unk_1828F2C90;
      *(_OWORD *)&v17->_completedCond.__sig = _cond_init;
      *(_OWORD *)&v17->_completedCond.__opaque[8] = *(_OWORD *)algn_1828F2CB0;
      *(_OWORD *)&v17->_completedCond.__opaque[24] = xmmword_1828F2CC0;
      *(_OWORD *)&v17->_scheduledCond.__sig = _cond_init;
      *(_OWORD *)&v17->_scheduledCond.__opaque[8] = *(_OWORD *)algn_1828F2CB0;
      *(_OWORD *)&v17->_scheduledCond.__opaque[24] = xmmword_1828F2CC0;
      v17->_retainedReferences = a4;
      v17->_synchronousDebugMode = a5;
      v17->_logs = 0;
      v17->_privateData = 0;
      v17->_privateDataOffset = 0;
      v17->_privateLoggingBuffer = 0;
      v18 = (MTLLogState *)*((id *)v17->_queue + 31);
      v17->_logState = v18;
      if (v18)
      {
        [(MTLCommandQueue *)v17->_queue getPrivateDataAndOffset:&v17->_privateData privateDataOffset:&v17->_privateDataOffset];
        v17->_requiresBindingLogState = 1;
      }
      if (*((unsigned char *)v17->_queue + 240)) {
        v17->_profilingEnabled = 1;
      }
      uint64_t v19 = mach_absolute_time();
      if (v17->_profilingEnabled) {
        v17->_creationTime = v19;
      }
      v17->_skipRender = *((unsigned char *)v17->_queue + 346);
      v17->_BOOL wakeOnCommit = 1;
      v17->_hasPresent = 0;
      v17->_numThisCommandBuffer = [(MTLCommandQueue *)v17->_queue getAndIncrementNumCommandBuffers];
      int v20 = *((unsigned __int8 *)v17->_queue + 256);
      v17->_StatEnabled = v20;
      if (v20)
      {
        v17->_perfSampleHandlerBlock = _Block_copy(*((const void **)v17->_queue + 36));
        v17->_numEncoders = 0;
        v17->_listIndex = [(MTLCommandQueue *)v17->_queue getListIndex];
      }
      v17->_errorOptions = objc_msgSend((id)-[MTLCommandQueue device](v17->_queue, "device"), "commandBufferErrorOptions");
      v17->_progressBuffer = 0;
      v17->_progressOffset = 0;
      v17->_creatingProgressEncoder = 0;
      v17->_needsFrameworkAssistedErrorTracking = objc_msgSend((id)-[MTLCommandQueue device](v17->_queue, "device"), "getSupportedCommandBufferErrorOptions") == 0;
      v17->_deadlineProfile = 0;
      if (MEMORY[0x1E4F62310]) {
        FPCommandBufferCreated();
      }
    }
  }
  else
  {
    MTLReportFailure(0, "-[_MTLCommandBuffer initWithQueue:retainedReferences:synchronousDebugMode:]", 323, @"queue must not be nil.", a5, v5, v6, v7, (uint64_t)v22.receiver);

    return 0;
  }
  return v17;
}

- (unint64_t)errorOptions
{
  return self->_errorOptions;
}

- (void)executeSynchronizationNotifications:(int)a3
{
  memset(v3, 0, sizeof(v3));
  LODWORD(v3[0]) = a3;
  if (self->_syncDispatchList) {
    _doMTLSyncDispatch((uint64_t)self, (void **)&self->_syncDispatchList, &self->_syncDispatchListTail, v3);
  }
}

- (BOOL)isStatEnabled
{
  return self->_StatEnabled;
}

- (void)enqueue
{
  if (!self->_status
    || (MTLReportFailure(0, "-[_MTLCommandBuffer enqueue]", 669, @"enqueue an already enqueued command buffer", v2, v3, v4, v5, v7), !self->_status))
  {
    if (self->_profilingEnabled) {
      self->_enqueueTime = mach_absolute_time();
    }
    [(MTLCommandQueue *)self->_queue enqueueCommandBuffer:self];
    self->_status = 1;
  }
}

- (BOOL)isCommitted
{
  return self->_status > 1;
}

- (void)presentDrawable:(id)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  if (_MTLShouldRemapPresent())
  {
    v14[0] = @"enableFIFO";
    v14[1] = @"presentationMode";
    v15[0] = MEMORY[0x1E4F1CC38];
    v15[1] = &unk_1ECB15138;
    v14[2] = @"presentTimeInterval";
    v15[2] = &unk_1ECB15198;
    -[_MTLCommandBuffer presentDrawable:options:](self, "presentDrawable:options:", a3, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3]);
    return;
  }
  if (a3)
  {
    if (!MTLFailureTypeGetEnabled(1uLL) || ([a3 conformsToProtocol:&unk_1ECB40050] & 1) != 0) {
      goto LABEL_5;
    }
    uint64_t v9 = @"drawable is not a MTLDrawable.";
    unint64_t v10 = 1;
    uint64_t v11 = 879;
  }
  else
  {
    uint64_t v9 = @"drawable must not be nil.";
    unint64_t v10 = 0;
    uint64_t v11 = 876;
  }
  MTLReportFailure(v10, "-[_MTLCommandBuffer presentDrawable:]", v11, (uint64_t)v9, v5, v6, v7, v8, v12[0]);
LABEL_5:
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __37___MTLCommandBuffer_presentDrawable___block_invoke;
  v13[3] = &unk_1E5220BA0;
  v13[4] = a3;
  v13[5] = self;
  [(_MTLCommandBuffer *)self addScheduledHandler:v13];
  self->_hasPresent = 1;
  ++self->_numPresentWaits;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = (uint64_t)__37___MTLCommandBuffer_presentDrawable___block_invoke_2;
  v12[3] = (uint64_t)&unk_1E5222148;
  v12[4] = (uint64_t)self;
  [a3 addPresentScheduledHandler:v12];
}

- (void)presentDrawable:(id)a3 options:(id)a4
{
  if (!a3)
  {
    uint64_t v14 = @"drawable must not be nil.";
    uint64_t v15 = 826;
    goto LABEL_15;
  }
  if (MTLFailureTypeGetEnabled(1uLL) && ([a3 conformsToProtocol:&unk_1ECB41B18] & 1) == 0) {
    MTLReportFailure(1uLL, "-[_MTLCommandBuffer presentDrawable:options:]", 829, @"drawable is not a MTLDrawableSPI.", v16, v17, v18, v19, v20);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v14 = @"drawable does not implement presentWithOptions:, is it a CAMetalDrawable?";
    uint64_t v15 = 830;
LABEL_15:
    MTLReportFailure(0, "-[_MTLCommandBuffer presentDrawable:options:]", v15, (uint64_t)v14, v4, v5, v6, v7, v20);
    if (a4) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
  if (a4) {
    goto LABEL_5;
  }
LABEL_16:
  MTLReportFailure(0, "-[_MTLCommandBuffer presentDrawable:options:]", 833, @"options must not be nil.", v4, v5, v6, v7, v20);
LABEL_5:
  uint64_t v11 = (void *)[a4 copy];
  uint64_t v12 = (void *)[v11 objectForKeyedSubscript:@"enableFIFO"];
  if (objc_opt_respondsToSelector()) {
    char v13 = [v12 BOOLValue];
  }
  else {
    char v13 = 0;
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __45___MTLCommandBuffer_presentDrawable_options___block_invoke;
  v22[3] = &unk_1E5222120;
  v22[4] = a3;
  v22[5] = v11;
  char v23 = v13;
  v22[6] = self;
  [(_MTLCommandBuffer *)self addScheduledHandler:v22];
  self->_hasPresent = 1;
  if ((v13 & 1) == 0)
  {
    ++self->_numPresentWaits;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __45___MTLCommandBuffer_presentDrawable_options___block_invoke_2;
    v21[3] = &unk_1E5222148;
    v21[4] = self;
    [a3 addPresentScheduledHandler:v21];
  }
}

- (void)addScheduledHandler:(id)a3
{
  if (self->_status >= 2) {
    MTLReportFailure(0, "-[_MTLCommandBuffer addScheduledHandler:]", 787, @"Scheduled handler provided after commit call", v3, v4, v5, v6, v9);
  }

  MTLDispatchListAppendBlock(&self->_scheduledDispatchList, (void **)&self->_scheduledDispatchListTail, a3);
}

- (void)addCompletedHandler:(id)a3
{
  if (self->_status >= 2) {
    MTLReportFailure(0, "-[_MTLCommandBuffer addCompletedHandler:]", 976, @"Completed handler provided after commit call", v3, v4, v5, v6, v9);
  }

  MTLDispatchListAppendBlock(&self->_completedDispatchList, (void **)&self->_completedDispatchListTail, a3);
}

- (void)dealloc
{
  if (MEMORY[0x1E4F62308] && !self->_didComplete) {
    FPCommandBufferCompleted();
  }
  error = self->_error;
  if (error)
  {

    self->_error = 0;
  }
  pthread_cond_destroy(&self->_completedCond);
  pthread_cond_destroy(&self->_scheduledCond);
  pthread_mutex_destroy(&self->_mutex);
  scheduledDispatchList = self->_scheduledDispatchList;
  if (scheduledDispatchList)
  {
    MTLDispatchListApply(scheduledDispatchList);
    self->_scheduledDispatchList = 0;
    self->_scheduledDispatchListTail = 0;
  }
  completedDispatchList = self->_completedDispatchList;
  if (completedDispatchList)
  {
    MTLDispatchListApply(completedDispatchList);
    self->_completedDispatchList = 0;
    self->_completedDispatchListTail = 0;
  }
  [(_MTLCommandBuffer *)self executeSynchronizationNotifications:3];
  if (!self->_status) {
    [(_MTLCommandBuffer *)self signalCommandBufferAvailable];
  }
  if (self->_progressBuffer)
  {
    uint64_t v6 = *(void **)([(MTLCommandQueue *)self->_queue device] + 320);
    objc_sync_enter(v6);
    objc_msgSend(*(id *)(-[MTLCommandQueue device](self->_queue, "device") + 320), "addObject:", self->_progressBuffer);
    objc_sync_exit(v6);

    self->_progressBuffer = 0;
  }

  self->_encoderInfos = 0;
  if (self->_privateData) {
    -[MTLCommandQueue releasePrivateData:privateDataOffset:](self->_queue, "releasePrivateData:privateDataOffset:");
  }

  id perfSampleHandlerBlock = self->_perfSampleHandlerBlock;
  if (perfSampleHandlerBlock) {
    _Block_release(perfSampleHandlerBlock);
  }

  self->_retainedObjects = 0;
  v8.receiver = self;
  v8.super_class = (Class)_MTLCommandBuffer;
  [(_MTLObjectWithLabel *)&v8 dealloc];
}

- (void)didScheduleWithStartTime:(unint64_t)a3 endTime:(unint64_t)a4 error:(id)a5
{
  [(_MTLCommandBuffer *)self didSchedule:a3 error:a5];
  self->_kernelStartTime = a3;
  self->_kernelEndTime = a4;
  if (a5)
  {
    self->_error = (NSError *)a5;
    __dmb(0xBu);
    self->_status = 5;
    uint64_t v9 = [(NSError *)self->_error localizedDescription];
    MTLReportFailure(4uLL, "-[_MTLCommandBuffer didScheduleWithStartTime:endTime:error:]", 1020, @"Execution of the command buffer was aborted due to an error during execution. %@", v10, v11, v12, v13, (uint64_t)v9);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_MTLCommandBuffer didScheduleWithStartTime:endTime:error:]((id *)&self->_error);
    }
  }
  else
  {
    self->_status = 3;
  }
  if (MEMORY[0x1E4F62318]) {
    FPCommandBufferScheduled();
  }
  if (self->_scheduledDispatchList)
  {
    if (MTLTraceEnabled()) {
      kdebug_trace();
    }
    MTLDispatchListApply(self->_scheduledDispatchList);
    if (MTLTraceEnabled()) {
      kdebug_trace();
    }
    self->_scheduledDispatchList = 0;
    self->_scheduledDispatchListTail = 0;
  }
  pthread_mutex_lock(&self->_mutex);
  self->_scheduledCallbacksDone = 1;
  pthread_cond_broadcast(&self->_scheduledCond);
  pthread_mutex_unlock(&self->_mutex);
}

- (void)didCompleteWithStartTime:(unint64_t)a3 endTime:(unint64_t)a4 error:(id)a5
{
  if (self->_profilingEnabled) {
    self->_completionHandlerExecutionTime = mach_absolute_time();
  }
  self->_gpuStartTime = a3;
  self->_gpuEndTime = a4;
  p_error = (id *)&self->_error;
  if (!self->_error)
  {
    if (a5)
    {
      if (self->_errorOptions)
      {
        [(_MTLCommandBuffer *)self processEncoderInfos];
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(a5, "userInfo"));
        [v10 setObject:self->_encoderInfos forKeyedSubscript:@"MTLCommandBufferEncoderInfoErrorKey"];
        id v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithDomain:code:userInfo:", objc_msgSend(a5, "domain"), objc_msgSend(a5, "code"), v10);
      }
      else
      {
        id v11 = a5;
      }
      id *p_error = v11;
      __dmb(0xBu);
      self->_status = 5;
      uint64_t v12 = [*p_error localizedDescription];
      MTLReportFailure(4uLL, "-[_MTLCommandBuffer didCompleteWithStartTime:endTime:error:]", 1156, @"Execution of the command buffer was aborted due to an error during execution. %@", v13, v14, v15, v16, v12);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_MTLCommandBuffer didScheduleWithStartTime:endTime:error:]((id *)&self->_error);
      }
    }
    else
    {
      self->_status = 4;
    }
  }
  if (self->_StatEnabled) {
    [(_MTLCommandBuffer *)self runPerfCounterCallbackWithBlock:self->_perfSampleHandlerBlock];
  }
  logState = self->_logState;
  if (logState) {
    [(MTLLogState *)logState decodeLog];
  }
  if (self->_privateData) {
    -[MTLCommandQueue releasePrivateData:privateDataOffset:](self->_queue, "releasePrivateData:privateDataOffset:");
  }
  if (MEMORY[0x1E4F62308])
  {
    FPCommandBufferCompleted();
    self->_didComplete = 1;
  }
  if (self->_completedDispatchList)
  {
    if (MTLTraceEnabled()) {
      kdebug_trace();
    }
    MTLDispatchListApply(self->_completedDispatchList);
    if (MTLTraceEnabled()) {
      kdebug_trace();
    }
    self->_completedDispatchList = 0;
    self->_completedDispatchListTail = 0;
  }
  retainedObjects = self->_retainedObjects;
  if (retainedObjects)
  {

    self->_retainedObjects = 0;
  }
  [(_MTLCommandBuffer *)self signalCommandBufferAvailable];
  pthread_mutex_lock(&self->_mutex);
  self->_completedCallbacksDone = 1;
  pthread_cond_broadcast(&self->_completedCond);
  pthread_mutex_unlock(&self->_mutex);
}

- (void)signalCommandBufferAvailable
{
  if (self->_needsCommandBufferSemaphoreSignal)
  {
    self->_needsCommandBufferSemaphoreSignal = 0;
    dispatch_semaphore_signal(*((dispatch_semaphore_t *)self->_queue + 26));
  }
}

- (NSError)error
{
  uint64_t v2 = self->_error;

  return v2;
}

- (unint64_t)status
{
  return self->_status;
}

- (NSMutableDictionary)userDictionary
{
  result = self->_userDictionary;
  if (!result)
  {
    result = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_userDictionary = result;
  }
  return result;
}

- (void)setErrorOptions:(unint64_t)a3
{
  self->_errorOptions = a3;
}

- (BOOL)retainedReferences
{
  return self->_retainedReferences;
}

- (double)GPUStartTime
{
  return *(double *)&time_scale * (double)self->_gpuStartTime;
}

- (double)GPUEndTime
{
  return *(double *)&time_scale * (double)self->_gpuEndTime;
}

- (void)waitUntilScheduled
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  while (!self->_scheduledCallbacksDone)
    pthread_cond_wait(&self->_scheduledCond, p_mutex);

  pthread_mutex_unlock(p_mutex);
}

- (void)waitUntilCompleted
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  while (!self->_completedCallbacksDone)
    pthread_cond_wait(&self->_completedCond, p_mutex);

  pthread_mutex_unlock(p_mutex);
}

+ (void)initialize
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(v2) = info.numer;
    LODWORD(v3) = info.denom;
    *(double *)&time_scale = (double)v2 / (double)v3 * 0.000000001;
  }
}

- (void)pushDebugGroup:(id)a3
{
  if (!a3)
  {
    objc_super v8 = @"string must not be nil.";
    unint64_t v9 = 0;
    uint64_t v10 = 1370;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v8 = @"string is not a NSString.";
    unint64_t v9 = 1;
    uint64_t v10 = 1373;
LABEL_6:
    MTLReportFailure(v9, "-[_MTLCommandBuffer pushDebugGroup:]", v10, (uint64_t)v8, v3, v4, v5, v6, v12);
  }
}

- (void)initProgressTracking
{
  if (!self->_encoderInfos) {
    self->_encoderInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  if (!self->_progressBuffer && self->_needsFrameworkAssistedErrorTracking)
  {
    objc_msgSend((id)-[MTLCommandQueue device](self->_queue, "device"), "initProgressTracking");
    uint64_t v3 = *(void **)([(MTLCommandQueue *)self->_queue device] + 320);
    objc_sync_enter(v3);
    uint64_t v4 = (MTLBuffer *)(id)objc_msgSend(*(id *)(-[MTLCommandQueue device](self->_queue, "device") + 320), "lastObject");
    self->_progressBuffer = v4;
    if (v4) {
      objc_msgSend(*(id *)(-[MTLCommandQueue device](self->_queue, "device") + 320), "removeLastObject");
    }
    objc_sync_exit(v3);
    if (!self->_progressBuffer) {
      self->_progressBuffer = (MTLBuffer *)objc_msgSend((id)-[MTLCommandQueue device](self->_queue, "device"), "newBufferWithLength:options:", 0x10000, 256);
    }
  }
}

- (id)progressTrackingBlitCommandEncoder
{
  self->_creatingProgressEncoder = 1;
  id result = (id)[(_MTLCommandBuffer *)self blitCommandEncoder];
  self->_creatingProgressEncoder = 0;
  return result;
}

- (id)progressTrackingRenderCommandEncoder
{
  self->_creatingProgressEncoder = 1;
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = (void *)[(_MTLCommandBuffer *)self renderCommandEncoderWithDescriptor:v3];

  self->_creatingProgressEncoder = 0;
  return v4;
}

- (id)progressTrackingComputeCommandEncoder
{
  self->_creatingProgressEncoder = 1;
  id result = (id)[(_MTLCommandBuffer *)self computeCommandEncoder];
  self->_creatingProgressEncoder = 0;
  return result;
}

- (void)processEncoderInfos
{
  if (self->_encoderInfos)
  {
    if (self->_needsFrameworkAssistedErrorTracking)
    {
      if (self->_progressOffset)
      {
        unsigned int v3 = 0;
        do
        {
          uint64_t v4 = (void *)[(NSMutableArray *)self->_encoderInfos objectAtIndexedSubscript:v3 >> 1];
          [v4 setErrorState:3];
          int v5 = *(_DWORD *)([(MTLBuffer *)self->_progressBuffer contents] + 4 * v3);
          uint64_t v6 = [(MTLBuffer *)self->_progressBuffer contents];
          if (v5 == -1)
          {
            int v7 = *(_DWORD *)(v6 + 4 * (v3 + 1));
            [v4 setErrorState:2];
            if (v7 == -1) {
              [v4 setErrorState:1];
            }
          }
          v3 += 2;
        }
        while (v3 < self->_progressOffset);
      }
    }
    else
    {
      -[_MTLCommandBuffer getDriverEncoderInfoData:](self, "getDriverEncoderInfoData:");
    }
  }
}

- (_MTLCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4
{
  return [(_MTLCommandBuffer *)self initWithQueue:a3 retainedReferences:a4 synchronousDebugMode:0];
}

- (void)encodeDashboardTagForResourceGroup:(id)a3
{
  MTLReportFailure(0, "-[_MTLCommandBuffer encodeDashboardTagForResourceGroup:]", 538, @"%s not supported on this device", v3, v4, v5, v6, (uint64_t)"-[_MTLCommandBuffer encodeDashboardTagForResourceGroup:]");
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 value:(unint64_t)a5 forIndex:(unint64_t)a6
{
  MTLReportFailure(0, "-[_MTLCommandBuffer encodeDashboardFinalizeForResourceGroup:dashboard:value:forIndex:]", 546, @"%s not supported on this device", a5, a6, v6, v7, (uint64_t)"-[_MTLCommandBuffer encodeDashboardFinalizeForResourceGroup:dashboard:value:forIndex:]");
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 values:(const unint64_t *)a5 indices:(const unint64_t *)a6 count:(unint64_t)a7
{
  MTLReportFailure(0, "-[_MTLCommandBuffer encodeDashboardFinalizeForResourceGroup:dashboard:values:indices:count:]", 557, @"%s not supported on this device", (uint64_t)a5, (uint64_t)a6, a7, v7, (uint64_t)"-[_MTLCommandBuffer encodeDashboardFinalizeForResourceGroup:dashboard:values:indices:count:]");
}

- (id)formattedDescription:(unint64_t)a3
{
  v15[12] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v6 = [(_MTLObjectWithLabel *)self retainedLabel];
  uint64_t v7 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)_MTLCommandBuffer;
  id v8 = [(_MTLCommandBuffer *)&v14 description];
  v15[0] = v5;
  v15[1] = @"label =";
  unint64_t v9 = @"<none>";
  if (v6) {
    unint64_t v9 = v6;
  }
  v15[2] = v9;
  v15[3] = v5;
  void v15[4] = @"device =";
  uint64_t v10 = (__CFString *)objc_msgSend((id)-[_MTLCommandBuffer device](self, "device"), "formattedDescription:", v4);
  id v11 = @"<null>";
  if (!v10) {
    uint64_t v10 = @"<null>";
  }
  v15[5] = v10;
  v15[6] = v5;
  v15[7] = @"commandQueue =";
  if (self->_queue) {
    id v11 = (__CFString *)[(MTLCommandQueue *)self->_queue formattedDescription:v4];
  }
  v15[8] = v11;
  v15[9] = v5;
  v15[10] = @"retainedReferences =";
  v15[11] = [NSNumber numberWithBool:self->_retainedReferences];
  uint64_t v12 = (void *)[v7 stringWithFormat:@"%@%@", v8, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 12), "componentsJoinedByString:", @" "];

  return v12;
}

- (id)description
{
  return [(_MTLCommandBuffer *)self formattedDescription:0];
}

- (void)commitAndHold
{
  self->_BOOL wakeOnCommit = 0;
  [(_MTLCommandBuffer *)self commit];
}

- (void)commitAndReset
{
  currentCommandEncoder = self->_currentCommandEncoder;
  self->_currentCommandEncoder = 0;
  scheduledDispatchList = self->_scheduledDispatchList;
  self->_scheduledDispatchList = 0;
  self->_scheduledDispatchListTail = 0;
  completedDispatchList = self->_completedDispatchList;
  self->_completedDispatchList = 0;
  self->_completedDispatchListTail = 0;
  [(_MTLCommandBuffer *)self commit];
  [(_MTLCommandBuffer *)self waitUntilCompleted];
  unint64_t status = self->_status;
  self->_unint64_t status = 0;
  self->_error = 0;
  self->_scheduledCallbacksDone = 0;
  self->_completedCallbacksDone = 0;
  uint64_t v5 = mach_absolute_time();
  if (self->_profilingEnabled) {
    self->_creationTime = v5;
  }
  if (MEMORY[0x1E4F62308] && !self->_didComplete) {
    FPCommandBufferCompleted();
  }
  self->_didComplete = 0;
  if (MEMORY[0x1E4F62310]) {
    FPCommandBufferCreated();
  }
  self->_currentCommandEncoder = currentCommandEncoder;
  self->_scheduledDispatchList = scheduledDispatchList;
  self->_scheduledDispatchListTail = scheduledDispatchList;
  self->_completedDispatchList = completedDispatchList;
  self->_completedDispatchListTail = completedDispatchList;
  if (status != 4)
  {
    MTLReportFailure(0, "-[_MTLCommandBuffer commitAndReset]", 778, @"Command buffer failed", v6, v7, v8, v9, v13);
  }
}

- (void)presentDrawable:(id)a3 atTime:(double)a4
{
  v18[3] = *MEMORY[0x1E4F143B8];
  if (_MTLShouldRemapPresent())
  {
    v17[0] = @"enableFIFO";
    v17[1] = @"presentationMode";
    v18[0] = MEMORY[0x1E4F1CC38];
    v18[1] = &unk_1ECB15150;
    v17[2] = @"presentTimeInterval";
    v18[2] = [NSNumber numberWithDouble:a4];
    -[_MTLCommandBuffer presentDrawable:options:](self, "presentDrawable:options:", a3, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3]);
    return;
  }
  if (a3)
  {
    if (!MTLFailureTypeGetEnabled(1uLL) || ([a3 conformsToProtocol:&unk_1ECB40050] & 1) != 0) {
      goto LABEL_5;
    }
    id v11 = @"drawable is not a MTLDrawable.";
    unint64_t v12 = 1;
    uint64_t v13 = 912;
  }
  else
  {
    id v11 = @"drawable must not be nil.";
    unint64_t v12 = 0;
    uint64_t v13 = 909;
  }
  MTLReportFailure(v12, "-[_MTLCommandBuffer presentDrawable:atTime:]", v13, (uint64_t)v11, v7, v8, v9, v10, v14);
LABEL_5:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44___MTLCommandBuffer_presentDrawable_atTime___block_invoke;
  v16[3] = &unk_1E5222170;
  *(double *)&v16[6] = a4;
  v16[4] = a3;
  v16[5] = self;
  [(_MTLCommandBuffer *)self addScheduledHandler:v16];
  self->_hasPresent = 1;
  ++self->_numPresentWaits;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44___MTLCommandBuffer_presentDrawable_atTime___block_invoke_2;
  v15[3] = &unk_1E5222148;
  void v15[4] = self;
  [a3 addPresentScheduledHandler:v15];
}

- (void)presentDrawable:(id)a3 afterMinimumDuration:(double)a4
{
  v18[3] = *MEMORY[0x1E4F143B8];
  if (_MTLShouldRemapPresent())
  {
    v17[0] = @"enableFIFO";
    v17[1] = @"presentationMode";
    v18[0] = MEMORY[0x1E4F1CC38];
    v18[1] = &unk_1ECB15168;
    v17[2] = @"presentTimeInterval";
    v18[2] = [NSNumber numberWithDouble:a4];
    -[_MTLCommandBuffer presentDrawable:options:](self, "presentDrawable:options:", a3, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3]);
    return;
  }
  if (a3)
  {
    if (!MTLFailureTypeGetEnabled(1uLL) || ([a3 conformsToProtocol:&unk_1ECB40050] & 1) != 0) {
      goto LABEL_5;
    }
    id v11 = @"drawable is not a MTLDrawable.";
    unint64_t v12 = 1;
    uint64_t v13 = 948;
  }
  else
  {
    id v11 = @"drawable must not be nil.";
    unint64_t v12 = 0;
    uint64_t v13 = 945;
  }
  MTLReportFailure(v12, "-[_MTLCommandBuffer presentDrawable:afterMinimumDuration:]", v13, (uint64_t)v11, v7, v8, v9, v10, v14);
LABEL_5:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58___MTLCommandBuffer_presentDrawable_afterMinimumDuration___block_invoke;
  v16[3] = &unk_1E5222170;
  *(double *)&v16[6] = a4;
  v16[4] = a3;
  v16[5] = self;
  [(_MTLCommandBuffer *)self addScheduledHandler:v16];
  self->_hasPresent = 1;
  ++self->_numPresentWaits;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58___MTLCommandBuffer_presentDrawable_afterMinimumDuration___block_invoke_2;
  v15[3] = &unk_1E5222148;
  void v15[4] = self;
  [a3 addPresentScheduledHandler:v15];
}

- (void)_addRetainedObject:(id)a3
{
  retainedObjects = self->_retainedObjects;
  if (!retainedObjects)
  {
    retainedObjects = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_retainedObjects = retainedObjects;
  }

  [(NSMutableArray *)retainedObjects addObject:a3];
}

- (void)kernelSubmitTime
{
  self->_submitToKernelTime = mach_absolute_time();
}

- (void)setProfilingEnabled:(BOOL)a3
{
  self->_profilingEnabled = a3;
}

- (NSDictionary)profilingResults
{
  v6[10] = *MEMORY[0x1E4F143B8];
  if (!self->_profilingEnabled) {
    return 0;
  }
  v5[0] = @"MTLCommandBufferCreationTime";
  v6[0] = [NSNumber numberWithUnsignedLongLong:self->_creationTime];
  v5[1] = @"MTLCommandBufferEnqueueTime";
  v6[1] = [NSNumber numberWithUnsignedLongLong:self->_enqueueTime];
  v5[2] = @"MTLCommandBufferCommitTime";
  v6[2] = [NSNumber numberWithUnsignedLongLong:self->_commitTime];
  v5[3] = @"MTLCommandBufferSubmitToKernelTime";
  v6[3] = [NSNumber numberWithUnsignedLongLong:self->_submitToKernelTime];
  v5[4] = @"MTLCommandBufferKernelScheduledTime";
  v6[4] = [NSNumber numberWithUnsignedLongLong:self->_kernelEndTime];
  v5[5] = @"MTLCommandBufferSubmitToHWTime";
  v6[5] = [NSNumber numberWithUnsignedLongLong:self->_submitToHardwareTime];
  v5[6] = @"MTLCommandBufferCompletionInterruptTime";
  v6[6] = [NSNumber numberWithUnsignedLongLong:self->_completionInterruptTime];
  v5[7] = @"MTLCommandBufferKernelCompleteTime";
  v6[7] = [NSNumber numberWithUnsignedLongLong:self->_gpuEndTime];
  v5[8] = @"MTLCommandBufferCompletionHandlerEnqueueTime";
  v6[8] = [NSNumber numberWithUnsignedLongLong:self->_completionHandlerEnqueueTime];
  v5[9] = @"MTLCommandBufferCompletionHandlerExecutionTime";
  v6[9] = [NSNumber numberWithUnsignedLongLong:self->_completionHandlerExecutionTime];
  uint64_t v3 = (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:10];
  self->_profilingResults = v3;
  return v3;
}

- (unint64_t)getAndIncrementNumEncoders
{
  unint64_t numEncoders = self->_numEncoders;
  self->_unint64_t numEncoders = numEncoders + 1;
  return numEncoders;
}

- (double)kernelStartTime
{
  return *(double *)&time_scale * (double)self->_kernelStartTime;
}

- (double)kernelEndTime
{
  return *(double *)&time_scale * (double)self->_kernelEndTime;
}

- (void)addSynchronizationNotification:(id)a3
{
  uint64_t v5 = (MTLSyncDispatch *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
  uint64_t v6 = _Block_copy(a3);
  v5->var0 = 0;
  v5->var1 = v6;
  p_syncDispatchListTail = &self->_syncDispatchListTail;
  syncDispatchListTail = self->_syncDispatchListTail;
  if (syncDispatchListTail)
  {
    syncDispatchListTail->var0 = v5;
  }
  else
  {
    *p_syncDispatchListTail = v5;
    p_syncDispatchListTail = &self->_syncDispatchList;
  }
  *p_syncDispatchListTail = v5;
}

- (void)executeSynchronizationNotifications:(int)a3 scope:(unint64_t)a4 resources:(const void *)a5 count:(unint64_t)a6
{
  v6[1] = a4;
  v6[0] = a3;
  v6[2] = a5;
  v6[3] = a6;
  if (self->_syncDispatchList) {
    _doMTLSyncDispatch((uint64_t)self, (void **)&self->_syncDispatchList, &self->_syncDispatchListTail, v6);
  }
}

- (id)computeCommandEncoderWithDescriptor:(id)a3
{
  uint64_t v4 = [a3 dispatchType];

  return [(_MTLCommandBuffer *)self computeCommandEncoderWithDispatchType:v4];
}

- (void)debugBufferContentsWithLength:(unint64_t *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return 0;
}

- (id)accelerationStructureCommandEncoder
{
  if (objc_msgSend((id)-[_MTLCommandBuffer device](self, "device"), "requiresRaytracingEmulation"))
  {
    uint64_t v4 = [[_MTLSWRaytracingAccelerationStructureCommandEncoder alloc] initWithCommandBuffer:self];
    return v4;
  }
  else
  {
    [(_MTLCommandBuffer *)self doesNotRecognizeSelector:a2];
    return 0;
  }
}

- (id)accelerationStructureCommandEncoderWithDescriptor:(id)a3
{
  if (objc_msgSend((id)-[_MTLCommandBuffer device](self, "device"), "requiresRaytracingEmulation"))
  {
    uint64_t v6 = [[_MTLSWRaytracingAccelerationStructureCommandEncoder alloc] initWithCommandBuffer:self descriptor:a3];
    return v6;
  }
  else
  {
    [(_MTLCommandBuffer *)self doesNotRecognizeSelector:a2];
    return 0;
  }
}

- (void)commitWithDeadline:(unint64_t)a3
{
}

- (BOOL)commitAndWaitUntilSubmittedWithDeadline:(unint64_t)a3
{
  self->_BOOL wakeOnCommit = 0;
  [(_MTLCommandBuffer *)self commitWithDeadline:a3];
  queue = self->_queue;

  return [(MTLCommandQueue *)queue submitCommandBuffer:self];
}

- (NSArray)logs
{
  if (self->_logs) {
    return self->_logs;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (void)setLogs:(id)a3
{
  id v5 = a3;

  self->_logs = (NSArray *)a3;
}

- (void)encodeConditionalAbortEvent:(id)a3
{
}

- (void)setResponsibleTaskIDs:(const unsigned int *)a3 count:(unsigned int)a4
{
}

- (void)useResidencySet:(id)a3
{
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
}

- (void)bindLogState
{
}

- (BOOL)synchronousDebugMode
{
  return self->_synchronousDebugMode;
}

- (void)setPrivateData:(id)a3
{
  self->_privateData = (MTLBuffer *)a3;
}

- (void)setPrivateDataOffset:(unint64_t)a3
{
  self->_privateDataOffset = a3;
}

- (MTLBuffer)privateLoggingBuffer
{
  return self->_privateLoggingBuffer;
}

- (void)setPrivateLoggingBuffer:(id)a3
{
  self->_privateLoggingBuffer = (MTLBuffer *)a3;
}

- (void)setStatEnabled:(BOOL)a3
{
  self->_StatEnabled = a3;
}

- (unint64_t)getListIndex
{
  return self->_listIndex;
}

- (unint64_t)numThisCommandBuffer
{
  return self->_numThisCommandBuffer;
}

- (void)setNumThisCommandBuffer:(unint64_t)a3
{
  self->_numThisCommandBuffer = a3;
}

- (unint64_t)numEncoders
{
  return self->_numEncoders;
}

- (void)setNumEncoders:(unint64_t)a3
{
  self->_unint64_t numEncoders = a3;
}

- (void)setOwnedByParallelEncoder:(BOOL)a3
{
  self->_ownedByParallelEncoder = a3;
}

- (MTLDeadlineProfile)deadlineProfile
{
  return (MTLDeadlineProfile *)objc_getProperty(self, a2, 536, 1);
}

- (void)didScheduleWithStartTime:(id *)a1 endTime:error:.cold.1(id *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend((id)objc_msgSend(*a1, "localizedDescription"), "UTF8String");
  int v2 = 136446210;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Execution of the command buffer was aborted due to an error during execution. %{public}s", (uint8_t *)&v2, 0xCu);
}

@end