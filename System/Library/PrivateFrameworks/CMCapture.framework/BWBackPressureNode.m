@interface BWBackPressureNode
+ (void)initialize;
- (BWBackPressureNode)init;
- (BWBackPressureNode)initWithNumberOfInputsAndOutputs:(unsigned int)a3 initialSemaphoreValue:(int64_t)a4;
- (BWNodeBackPressureSource)backPressureSourceNode;
- (OS_dispatch_queue)semaphoreSignalQueue;
- (OS_dispatch_semaphore)semaphore;
- (id)nodeSubType;
- (id)nodeType;
- (void)_handleUpdatedPresentationTimestamp:(id *)a3 forIndex:(unint64_t)a4;
- (void)_setSemaphore:(id)a3;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setBackPressureSourceNode:(id)a3;
- (void)setInitialSemaphoreValue:(int)a3;
- (void)setSemaphoreSignalQueue:(id)a3;
@end

@implementation BWBackPressureNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  id v5 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs", a3), "objectAtIndexedSubscript:", [a4 index]);
  uint64_t v6 = [a4 format];
  [v5 setFormat:v6];
}

- (BWBackPressureNode)initWithNumberOfInputsAndOutputs:(unsigned int)a3 initialSemaphoreValue:(int64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)BWBackPressureNode;
  uint64_t v6 = [(BWNode *)&v12 init];
  if (v6)
  {
    if (a4) {
      v6->_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(a4);
    }
    v6->_initialSemaphoreValue = a4;
    v6->_numberOfInputs = a3;
    v6->_presentationTimestampLock._os_unfair_lock_opaque = 0;
    v6->_receivedPresentationTimestampByInput = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6->_numberOfInputs];
    if (a3)
    {
      uint64_t v7 = 0;
      uint64_t v8 = a3;
      do
      {
        v9 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v6 index:v7];
        [(BWNodeInput *)v9 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
        [(BWNodeInput *)v9 setPassthroughMode:1];
        [(BWNode *)v6 addInput:v9];

        v10 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v6];
        [(BWNodeOutput *)v10 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
        [(BWNodeOutput *)v10 setPassthroughMode:1];
        [(BWNodeOutput *)v10 setIndexOfInputWhichDrivesThisOutput:v7];
        [(BWNode *)v6 addOutput:v10];

        -[NSMutableArray setObject:atIndexedSubscript:](v6->_receivedPresentationTimestampByInput, "setObject:atIndexedSubscript:", [MEMORY[0x1E4F1CA48] array], v7++);
      }
      while (v8 != v7);
    }
    v6->_limitedGMErrorLogger = [[BWLimitedGMErrorLogger alloc] initWithName:@"Back Pressure" maxLoggingCount:10];
    v6->_stateLock._os_unfair_lock_opaque = 0;
    [(BWNode *)v6 setSupportsConcurrentLiveInputCallbacks:1];
  }
  return v6;
}

- (id)nodeType
{
  return @"Synchronizer";
}

- (void)setInitialSemaphoreValue:(int)a3
{
  if (!a3)
  {
    id v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3B8];
    uint64_t v7 = @"Initial semaphore value must be non-zero";
    goto LABEL_6;
  }
  if (self->_semaphore)
  {
    id v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3B8];
    uint64_t v7 = @"Initial semaphore value can only be set once";
LABEL_6:
    objc_exception_throw((id)[v5 exceptionWithName:v6 reason:v7 userInfo:0]);
  }
  int64_t v4 = a3;
  self->_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(a3);
  self->_initialSemaphoreValue = v4;
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphoreSignalQueue:(id)a3
{
}

- (void)setBackPressureSourceNode:(id)a3
{
  self->_backPressureSourceNode = (BWNodeBackPressureSource *)a3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWBackPressureNode)init
{
  return 0;
}

- (void)dealloc
{
  os_unfair_lock_lock(&self->_presentationTimestampLock);
  os_unfair_lock_unlock(&self->_presentationTimestampLock);

  v3.receiver = self;
  v3.super_class = (Class)BWBackPressureNode;
  [(BWNode *)&v3 dealloc];
}

- (void)_setSemaphore:(id)a3
{
  semaphore = self->_semaphore;
  if (semaphore != a3)
  {

    self->_semaphore = (OS_dispatch_semaphore *)a3;
  }
}

- (id)nodeSubType
{
  return @"BackPressure";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  if (!self->_semaphore) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Initial semaphore value must be set before format resolution" userInfo:0]);
  }
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  self->_numEODMessagesReceived = 0;
  os_unfair_lock_unlock(p_stateLock);
  v4.receiver = self;
  v4.super_class = (Class)BWBackPressureNode;
  [(BWNode *)&v4 prepareForCurrentConfigurationToBecomeLive];
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  id v5 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs", a3, a4), "objectAtIndexedSubscript:", [a5 index]);
  [v5 makeConfiguredFormatLive];
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  uint64_t numEODMessagesReceived = self->_numEODMessagesReceived;
  self->_uint64_t numEODMessagesReceived = numEODMessagesReceived + 1;
  if ([(NSArray *)[(BWNode *)self inputs] count] == numEODMessagesReceived + 1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = [(BWNode *)self outputs];
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) markEndOfLiveOutput];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
  os_unfair_lock_unlock(p_stateLock);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v6 = [a4 index];
  id v7 = [(NSArray *)[(BWNode *)self outputs] objectAtIndexedSubscript:v6];
  memset(&v12, 0, sizeof(v12));
  CMSampleBufferGetPresentationTimeStamp(&v12, a3);
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger resetCurrentLoggingCounter];
    CFTypeRef v8 = CMGetAttachment(a3, @"FileWriterAction", 0);
    if (v8)
    {
      uint64_t v9 = v8;
      CFTypeID v10 = CFGetTypeID(v8);
      if (v10 == CFStringGetTypeID()
        && (CFEqual(v9, @"Stop")
         || CFEqual(v9, @"Pause")
         || CFEqual(v9, @"Flush")
         || CFEqual(v9, @"Terminate")))
      {
        self->_receivedFirstFrame = 0;
        [(BWNodeBackPressureSource *)self->_backPressureSourceNode setFirstFrameProcessed:0];
      }
    }
  }
  else
  {
    CMTime v11 = v12;
    [(BWBackPressureNode *)self _handleUpdatedPresentationTimestamp:&v11 forIndex:v6];
  }
  [v7 emitSampleBuffer:a3];
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  uint64_t v6 = [a4 index];
  id v7 = [(NSArray *)[(BWNode *)self outputs] objectAtIndexedSubscript:v6];
  if ((objc_msgSend((id)objc_msgSend(a3, "backPressureSemaphoresToIgnore"), "containsObject:", self->_semaphore) & 1) == 0)
  {
    long long v10 = 0uLL;
    uint64_t v11 = 0;
    if (a3) {
      [a3 pts];
    }
    long long v8 = v10;
    uint64_t v9 = v11;
    [(BWBackPressureNode *)self _handleUpdatedPresentationTimestamp:&v8 forIndex:v6];
  }
  [v7 emitDroppedSample:a3];
}

- (void)_handleUpdatedPresentationTimestamp:(id *)a3 forIndex:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  CMTime time = *(CMTime *)a3;
  double Seconds = CMTimeGetSeconds(&time);
  if ((a3->var2 & 1) == 0) {
    [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger logErrorNumber:0 errorString:@"Backpressure received unexpected invalid PTS"];
  }
  p_presentationTimestampLock = &self->_presentationTimestampLock;
  os_unfair_lock_lock(&self->_presentationTimestampLock);
  MEMORY[0x1F4188790](v9, v10, v11, v12);
  long long v14 = (char *)v26 - v13;
  unsigned int numberOfInputs = self->_numberOfInputs;
  if (!numberOfInputs) {
    goto LABEL_15;
  }
  v26[1] = v26;
  v27 = &self->_presentationTimestampLock;
  unint64_t v16 = 0;
  uint64_t v17 = 0;
  do
  {
    *(_DWORD *)&v14[4 * v16] = -1;
    if (v16 != a4)
    {
      v18 = (void *)[(NSMutableArray *)self->_receivedPresentationTimestampByInput objectAtIndexedSubscript:v16];
      if ([v18 count])
      {
        uint64_t v19 = 0;
        int v20 = 0;
        while (1)
        {
          objc_msgSend((id)objc_msgSend(v18, "objectAtIndexedSubscript:", v19), "doubleValue");
          if (vabdd_f64(v21, Seconds) < 0.00001) {
            break;
          }
          uint64_t v19 = ++v20;
          if ([v18 count] <= (unint64_t)v20) {
            goto LABEL_10;
          }
        }
        *(_DWORD *)&v14[4 * v16] = v20;
      }
      else
      {
LABEL_10:
        int v20 = -1;
      }
      v17 += v20 >= 0;
      unsigned int numberOfInputs = self->_numberOfInputs;
    }
    ++v16;
  }
  while (v16 < numberOfInputs);
  p_presentationTimestampLock = v27;
  if (v17 >= numberOfInputs - 1)
  {
    if (numberOfInputs)
    {
      for (unint64_t i = 0; i < numberOfInputs; ++i)
      {
        uint64_t v24 = *(unsigned int *)&v14[4 * i];
        if ((v24 & 0x80000000) == 0)
        {
          objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_receivedPresentationTimestampByInput, "objectAtIndexedSubscript:", i), "removeObjectAtIndex:", v24);
          unsigned int numberOfInputs = self->_numberOfInputs;
        }
      }
    }
    os_unfair_lock_unlock(p_presentationTimestampLock);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__BWBackPressureNode__handleUpdatedPresentationTimestamp_forIndex___block_invoke;
    block[3] = &unk_1E5C24430;
    block[4] = self;
    semaphoreSignalQueue = self->_semaphoreSignalQueue;
    if (semaphoreSignalQueue) {
      dispatch_async(semaphoreSignalQueue, block);
    }
    else {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
    }
    if (!self->_receivedFirstFrame)
    {
      self->_receivedFirstFrame = 1;
      [(BWNodeBackPressureSource *)self->_backPressureSourceNode setFirstFrameProcessed:1];
    }
  }
  else
  {
LABEL_15:
    v22 = (void *)[(NSMutableArray *)self->_receivedPresentationTimestampByInput objectAtIndexedSubscript:a4];
    objc_msgSend(v22, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", Seconds));
    objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_receivedPresentationTimestampByInput, "objectAtIndexedSubscript:", a4), "count");
    os_unfair_lock_unlock(p_presentationTimestampLock);
  }
}

intptr_t __67__BWBackPressureNode__handleUpdatedPresentationTimestamp_forIndex___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 96));
}

- (OS_dispatch_queue)semaphoreSignalQueue
{
  return self->_semaphoreSignalQueue;
}

- (BWNodeBackPressureSource)backPressureSourceNode
{
  return self->_backPressureSourceNode;
}

@end