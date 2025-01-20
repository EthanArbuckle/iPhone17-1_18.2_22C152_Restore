@interface DYGuestAppClient
+ (id)timebaseDictionary;
- (BOOL)_canTriggerCaptureOnNextGraphicsCommand;
- (BOOL)armCaptureWithDescriptor:(id)a3;
- (BOOL)boundaryLessCaptureMode;
- (BOOL)liveDebugging;
- (BOOL)startCaptureWithDescriptor:(id)a3;
- (BOOL)triggerArmedCapture;
- (DYCaptureArchive)localActiveArchive;
- (DYCaptureDescriptor)activeCaptureDescriptor;
- (DYCaptureState)activeCaptureState;
- (DYGuestAppClient)init;
- (DYGuestAppClient)initWithTransport:(id)a3;
- (NSMutableDictionary)liveDebuggingCaptureData;
- (NSMutableDictionary)ptrUrlInfoDict;
- (NSMutableDictionary)saveptrPtrInfoDict;
- (OS_dispatch_queue)globalSyncQueue;
- (OS_dispatch_queue)graphicsLockWaitQueue;
- (OS_dispatch_queue)saveptrQueue;
- (OS_dispatch_semaphore)graphicsSemaphore;
- (Stream)defaultFbufStream;
- (Stream)startup0Stream;
- (Stream)startup1Stream;
- (double)xcodeOverrideScaleTessFactor;
- (id)_buildLibraryLinkTimeVersionsDictionary;
- (id)_buildQueueThreadLabelsDictionary;
- (int)previousTraceMode;
- (int)traceMode;
- (int)waitOnGraphicsSemaphoreAssertions;
- (unint64_t)state;
- (unint64_t)xcodeOverrideFlags;
- (unsigned)globalFrameCounter;
- (unsigned)incrementGlobalFrameCounter;
- (unsigned)overrideFlags;
- (void)_appendLinkTimeLibrariesToVersionsDictionary:(id)a3;
- (void)_appendLinkTimeLibrary:(const char *)a3 toVersionsDictionary:(id)a4;
- (void)_appendToAllCaptureDataSentMessagePayload:(id)a3;
- (void)_armCapture;
- (void)_armCaptureWithTransportMessage:(id)a3;
- (void)_handleActivateCaptureMessage:(id)a3;
- (void)_handleCaptureStreamCreated;
- (void)_handleFrameEnd:(unint64_t)a3;
- (void)_handleTurnOffCapture;
- (void)_handleTurnOnCapture;
- (void)_populateQueueAndThreadLabelMaps;
- (void)_resetBufferUsageCounters;
- (void)_sendBufferUsageCounters;
- (void)_startCapture;
- (void)_turnOffCapturing;
- (void)_turnOnCapturing;
- (void)_waitForGraphicsThreads;
- (void)atexit;
- (void)dealloc;
- (void)handleCaptureModeTransition:(BOOL)a3;
- (void)handleFrameBoundaryCommon;
- (void)incrementCapturedFramesCounter;
- (void)invalidateCapture;
- (void)invalidateSavePointerMap:(id)a3;
- (void)lockGraphicsAndWaitForThreads:(BOOL)a3;
- (void)notifyAllCaptureDataSent;
- (void)notifyAllCaptureMetadataSent;
- (void)notifyUsedDataSentWithDictionary:(id)a3;
- (void)processMessage:(id)a3;
- (void)resetPointerToUrlAssociation:(const void *)a3;
- (void)sendCaptureData:(id)a3 name:(id)a4 inReplyTo:(id)a5;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 inReplyTo:(id)a4;
- (void)sendTimebaseUpdate;
- (void)setBoundaryLessCaptureMode:(BOOL)a3;
- (void)setLiveDebugging:(BOOL)a3;
- (void)setOverrideFlags:(unsigned int)a3;
- (void)setPreviousTraceMode:(int)a3;
- (void)setTraceMode:(int)a3;
- (void)setXcodeOverrideFlags:(unint64_t)a3;
- (void)setXcodeOverrideScaleTessFactor:(double)a3;
- (void)stopCapture;
- (void)unlockGraphics;
@end

@implementation DYGuestAppClient

+ (id)timebaseDictionary
{
  uint64_t v2 = mach_absolute_time();
  gettimeofday(&v10, 0);
  uint64_t v3 = mach_absolute_time();
  mach_timebase_info((mach_timebase_info_t)&g_DYTimebaseInfo);
  uint64_t v4 = v2 + ((v3 - v2) >> 1);
  v5 = NSDictionary;
  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:1000000000 * v10.tv_sec + 1000 * v10.tv_usec];
  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:v4];
  uint64_t v8 = [NSNumber numberWithUnsignedInt:g_DYTimebaseInfo];
  return (id)objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, @"nanoseconds since epoch timestamp", v7, @"mach absolute timestamp", v8, @"mach timebase numerator", objc_msgSend(NSNumber, "numberWithUnsignedInt:", dword_269A2916C), @"mach timebase denominator", 0);
}

- (void)_handleTurnOnCapture
{
}

- (void)_handleTurnOffCapture
{
}

- (void)_handleCaptureStreamCreated
{
}

- (void)_handleFrameEnd:(unint64_t)a3
{
}

- (DYGuestAppClient)init
{
  return 0;
}

- (unsigned)incrementGlobalFrameCounter
{
  return atomic_fetch_add_explicit((atomic_uint *volatile)&self->_globalFrameCounter, 1u, memory_order_relaxed) + 1;
}

- (void)setTraceMode:(int)a3
{
  int traceMode = self->_traceMode;
  if (traceMode != a3)
  {
    self->_int traceMode = a3;
    self->_previousTraceMode = traceMode;
  }
  v5 = +[DYTransportMessage messageWithKind:objectPayload:](DYTransportMessage, "messageWithKind:objectPayload:", 1796, objc_msgSend(NSNumber, "numberWithInt:"));

  [(DYGuestAppClient *)self sendMessage:v5];
}

- (DYGuestAppClient)initWithTransport:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DYGuestAppClient;
  id v3 = [(DYGuestAppClient *)&v10 init];
  if (v3)
  {
    if (-[DYGuestAppClient initWithTransport:]::onceToken != -1) {
      dispatch_once(&-[DYGuestAppClient initWithTransport:]::onceToken, &__block_literal_global_11);
    }
    [(id)_gWeakAppClients addPointer:v3];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__DYGuestAppClient_initWithTransport___block_invoke_2;
    v9[3] = &unk_265336FC0;
    v9[4] = v3;
    uint64_t v4 = (void *)[v9 copy];
    memptr = 0;
    malloc_type_posix_memalign(&memptr, 8uLL, 0x40uLL, 0x9FC05F6DuLL);
    v5 = memptr;
    GPUTools::FB::Stream::Stream((uint64_t)memptr, v4, 0);
    *((void *)v3 + 8) = v5;
    memptr = 0;
    malloc_type_posix_memalign(&memptr, 8uLL, 0x40uLL, 0x9FC05F6DuLL);
    uint64_t v6 = memptr;
    GPUTools::FB::Stream::Stream((uint64_t)memptr, v4, 0);
    *((void *)v3 + 9) = v6;
    memptr = 0;
    malloc_type_posix_memalign(&memptr, 8uLL, 0x40uLL, 0x9FC05F6DuLL);
    uint64_t v7 = memptr;
    GPUTools::FB::Stream::Stream((uint64_t)memptr, v4, 0);
    *((void *)v3 + 10) = v7;

    GPUTools::FB::Stream::Open(*((GPUTools::FB::Stream **)v3 + 8), @"live");
  }
  return 0;
}

id __38__DYGuestAppClient_initWithTransport___block_invoke()
{
  id result = (id)[MEMORY[0x263F08A88] weakObjectsPointerArray];
  _gWeakAppClients = (uint64_t)result;
  return result;
}

void __38__DYGuestAppClient_initWithTransport___block_invoke_2(uint64_t a1, DYGuestAppClient *a2, Stream *a3)
{
}

uint64_t __38__DYGuestAppClient_initWithTransport___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processMessage:a2];
}

void __38__DYGuestAppClient_initWithTransport___block_invoke_4()
{
}

void __38__DYGuestAppClient_initWithTransport___block_invoke_5()
{
}

intptr_t __38__DYGuestAppClient_initWithTransport___block_invoke_6(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 48));
  uint64_t v2 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v2);
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_globalSyncQueue);
  v3.receiver = self;
  v3.super_class = (Class)DYGuestAppClient;
  [(DYGuestAppClient *)&v3 dealloc];
}

- (void)atexit
{
  if (self->_state == 3) {
    [(DYGuestAppClient *)self handleCaptureModeTransition:0];
  }
  if ([(DYCaptureState *)self->_activeCaptureState capturedFrames]
    && ![(DYCaptureState *)self->_activeCaptureState allDataReceivedAck])
  {
    do
    {
      if ([(DYTransport *)self->_transport invalid]) {
        break;
      }
      sleep(1u);
    }
    while (![(DYCaptureState *)self->_activeCaptureState allDataReceivedAck]);
  }
}

- (void)handleFrameBoundaryCommon
{
  if (self->_state)
  {
    unint64_t v3 = [(DYCaptureDescriptor *)self->_activeCaptureDescriptor framesToCapture];
    unint64_t state = self->_state;
    if (state == 1)
    {
      unint64_t globalFrameCounter = self->_globalFrameCounter;
      if ([(DYCaptureDescriptor *)self->_activeCaptureDescriptor triggerFrame] <= globalFrameCounter
        && ![(DYCaptureState *)self->_activeCaptureState capturedFrames]
        && [(DYGuestAppClient *)self _canTriggerCaptureOnNextGraphicsCommand])
      {
        [(DYGuestAppClient *)self triggerArmedCapture];
      }
    }
    else
    {
      BOOL v5 = state != 3 || v3 == 0;
      if (!v5 && [(DYCaptureState *)self->_activeCaptureState capturedFrames] >= v3)
      {
        [(DYGuestAppClient *)self stopCapture];
      }
    }
  }
}

- (void)handleCaptureModeTransition:(BOOL)a3
{
  globalSyncQueue = self->_globalSyncQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__DYGuestAppClient_handleCaptureModeTransition___block_invoke;
  v4[3] = &unk_2653364C0;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_sync(globalSyncQueue, v4);
}

void __48__DYGuestAppClient_handleCaptureModeTransition___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    *(void *)(*(void *)(a1 + 32) + 152) = 4;
    uint64_t v2 = g_signpostLog;
    if (os_signpost_enabled((os_log_t)g_signpostLog))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_24F657000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "StopActiveCapture", "", v5, 2u);
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 160) sessionId])
  {
    unint64_t v3 = (void *)MEMORY[0x253361500]();
    uint64_t v4 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 40)) {
      [v4 _turnOnCapturing];
    }
    else {
      [v4 _turnOffCapturing];
    }
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 152) = 0;

    *(void *)(*(void *)(a1 + 32) + 160) = 0;
    *(void *)(*(void *)(a1 + 32) + 168) = 0;
  }
}

- (void)processMessage:(id)a3
{
  int v5 = [a3 kind];
  if (!v7 & v6)
  {
    switch(v5)
    {
      case 1537:
        uint64_t v8 = GPUTools::Interpose::gInterposeSemaphore;
        dispatch_semaphore_signal(v8);
        break;
      case 1538:
      case 1541:
      case 1542:
      case 1543:
      case 1544:
        return;
      case 1539:
        v12 = +[DYTransportMessage messageWithKind:attributes:](DYTransportMessage, "messageWithKind:attributes:", 1539, [(id)objc_opt_class() timebaseDictionary]);
        [(DYGuestAppClient *)self sendMessage:v12 inReplyTo:a3];
        break;
      case 1540:
        [(DYGuestAppClient *)self invalidateSavePointerMap:a3];
        break;
      case 1545:
        [(DYGuestAppClient *)self lockGraphicsAndWaitForThreads:0];
        break;
      case 1546:
        [(DYGuestAppClient *)self unlockGraphics];
        break;
      default:
        if (v5 == 1795)
        {
          defaultFbufStream = self->_defaultFbufStream;
          GPUTools::FB::Stream::Flush((GPUTools::FB::Stream *)defaultFbufStream);
        }
        break;
    }
  }
  else
  {
    switch(v5)
    {
      case 256:
        [(DYCaptureDescriptor *)self->_activeCaptureDescriptor setTriggerFrame:self->_globalFrameCounter];
        goto LABEL_17;
      case 257:
      case 258:
      case 259:
      case 261:
      case 262:
        return;
      case 260:
        if ((self->_state | 2) == 3)
        {
          [(DYGuestAppClient *)self lockGraphicsAndWaitForThreads:1];
          stopCaptureQueue = self->_stopCaptureQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __35__DYGuestAppClient_processMessage___block_invoke;
          block[3] = &unk_265335F98;
          block[4] = self;
          dispatch_async(stopCaptureQueue, block);
        }
        goto LABEL_17;
      case 263:
        [(DYCaptureState *)self->_activeCaptureState setAllDataReceivedAck:1];
        goto LABEL_17;
      case 264:
        [(DYGuestAppClient *)self _handleActivateCaptureMessage:a3];
LABEL_17:
        int v11 = objc_msgSend((id)objc_msgSend(a3, "attributeForKey:", @"capture serial"), "unsignedIntValue");
        if ([(DYCaptureDescriptor *)self->_activeCaptureDescriptor sessionId] == v11) {
          return;
        }
        goto LABEL_35;
      case 265:
        int v11 = objc_msgSend((id)objc_msgSend(a3, "attributeForKey:", @"capture serial"), "unsignedIntValue");
        if ([(DYCaptureDescriptor *)self->_activeCaptureDescriptor sessionId] != v11) {
LABEL_35:
        }
          dy_abort("received capture session message with invalid session serial: serial=%u expected=%u message=%s", v11, -[DYCaptureDescriptor sessionId](self->_activeCaptureDescriptor, "sessionId"), (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String"));
        [(DYGuestAppClient *)self invalidateCapture];
        break;
      default:
        JUMPOUT(0);
    }
  }
}

uint64_t __35__DYGuestAppClient_processMessage___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[19] == 3) {
    [v2 stopCapture];
  }
  else {
    [v2 invalidateCapture];
  }
  unint64_t v3 = *(void **)(a1 + 32);

  return [v3 unlockGraphics];
}

- (void)sendMessage:(id)a3 inReplyTo:(id)a4
{
}

- (void)sendMessage:(id)a3
{
}

- (void)sendCaptureData:(id)a3 name:(id)a4 inReplyTo:(id)a5
{
  id v9 = objc_alloc(NSDictionary);
  objc_super v10 = objc_msgSend(v9, "initWithObjectsAndKeys:", a4, @"buffer name", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DYCaptureDescriptor sessionId](self->_activeCaptureDescriptor, "sessionId")), @"capture serial", 0);
  int v11 = [[DYTransportMessage alloc] initWithKind:258 attributes:v10 payload:a3];
  [(DYGuestAppClient *)self sendMessage:v11 inReplyTo:a5];
}

- (void)sendTimebaseUpdate
{
  unint64_t v3 = +[DYTransportMessage messageWithKind:attributes:](DYTransportMessage, "messageWithKind:attributes:", 1539, [(id)objc_opt_class() timebaseDictionary]);

  [(DYGuestAppClient *)self sendMessage:v3 inReplyTo:0];
}

- (void)resetPointerToUrlAssociation:(const void *)a3
{
  ptrUrlInfoDict = self->_ptrUrlInfoDict;
  uint64_t v4 = [NSNumber numberWithUnsignedLong:a3];

  [(NSMutableDictionary *)ptrUrlInfoDict removeObjectForKey:v4];
}

- (void)invalidateSavePointerMap:(id)a3
{
  id v5 = a3;
  saveptrQueue = self->_saveptrQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__DYGuestAppClient_invalidateSavePointerMap___block_invoke;
  block[3] = &unk_265335F98;
  block[4] = self;
  dispatch_sync(saveptrQueue, block);
  if (a3)
  {
    char v7 = [[DYTransportMessage alloc] initWithKind:1540 attributes:0 payload:0];
    [(DYGuestAppClient *)self sendMessage:v7 inReplyTo:a3];
  }
}

uint64_t __45__DYGuestAppClient_invalidateSavePointerMap___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);

  return [v2 removeAllObjects];
}

- (void)notifyAllCaptureDataSent
{
  v12[1] = *MEMORY[0x263EF8340];
  activeCaptureDescriptor = self->_activeCaptureDescriptor;
  if (activeCaptureDescriptor && ![(DYCaptureDescriptor *)activeCaptureDescriptor localFilePathURL])
  {
    if (self->_state != 4) {
      __assert_rtn("-[DYGuestAppClient notifyAllCaptureDataSent]", ", 0, "_state == DYCaptureManagerStateFinishingCapture"");
    }
    uint64_t v4 = g_signpostLog;
    if (os_signpost_enabled((os_log_t)g_signpostLog))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24F657000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CaptureSentAllData", "", buf, 2u);
    }
    id v5 = [(DYGuestAppClient *)self _buildLibraryLinkTimeVersionsDictionary];
    id v6 = [(DYGuestAppClient *)self _buildQueueThreadLabelsDictionary];
    char v7 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[DYCaptureState capturedFrames](self->_activeCaptureState, "capturedFrames"));
    uint64_t v9 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"captured frames counter", v5, @"library link-time versions", v6, @"queue/thread labels", objc_msgSend(NSNumber, "numberWithBool:", _CFExecutableLinkedOnOrAfter() != 0), @"LinkedOnApexOrLater", 0);
    [(DYGuestAppClient *)self _appendToAllCaptureDataSentMessagePayload:v9];
    int v11 = @"capture serial";
    v12[0] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DYCaptureDescriptor sessionId](self->_activeCaptureDescriptor, "sessionId"));
    -[DYGuestAppClient sendMessage:](self, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:objectPayload:](DYTransportMessage, "messageWithKind:attributes:objectPayload:", 263, [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1], v9));
  }
}

- (void)notifyUsedDataSentWithDictionary:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  if (self->_state != 4) {
    __assert_rtn("-[DYGuestAppClient notifyUsedDataSentWithDictionary:]", ", 0, "_state == DYCaptureManagerStateFinishingCapture"");
  }
  id v5 = g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24F657000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CaptureSentUsedData", "", buf, 2u);
  }
  id v6 = [(DYGuestAppClient *)self _buildLibraryLinkTimeVersionsDictionary];
  id v7 = [(DYGuestAppClient *)self _buildQueueThreadLabelsDictionary];
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[DYCaptureState capturedFrames](self->_activeCaptureState, "capturedFrames")), @"captured frames counter", v6, @"library link-time versions", v7, @"queue/thread labels", 0);
  [v8 addEntriesFromDictionary:a3];
  [(DYGuestAppClient *)self _appendToAllCaptureDataSentMessagePayload:v8];
  objc_super v10 = @"capture serial";
  v11[0] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DYCaptureDescriptor sessionId](self->_activeCaptureDescriptor, "sessionId"));
  -[DYGuestAppClient sendMessage:](self, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:objectPayload:](DYTransportMessage, "messageWithKind:attributes:objectPayload:", 266, [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1], v8));
}

- (void)notifyAllCaptureMetadataSent
{
  if (self->_state != 4) {
    __assert_rtn("-[DYGuestAppClient notifyAllCaptureMetadataSent]", ", 0, "_state == DYCaptureManagerStateFinishingCapture"");
  }
  unint64_t v3 = g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_24F657000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CaptureSentAllMetadata", "", v4, 2u);
  }
  [(DYGuestAppClient *)self sendMessage:+[DYTransportMessage messageWithKind:267]];
}

- (void)lockGraphicsAndWaitForThreads:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_suspend((dispatch_object_t)self->_graphicsLockWaitQueue);
  atomic_fetch_add(&self->_waitOnGraphicsSemaphoreAssertions, 1u);
  if (v3)
  {
    [(DYGuestAppClient *)self _waitForGraphicsThreads];
  }
}

- (void)unlockGraphics
{
  if (self->_waitOnGraphicsSemaphoreAssertions)
  {
    atomic_fetch_add(&self->_waitOnGraphicsSemaphoreAssertions, 0xFFFFFFFF);
    dispatch_resume((dispatch_object_t)self->_graphicsLockWaitQueue);
  }
}

- (void)incrementCapturedFramesCounter
{
  activeCaptureState = self->_activeCaptureState;
  objc_sync_enter(activeCaptureState);
  [(DYCaptureState *)self->_activeCaptureState setCapturedFrames:[(DYCaptureState *)self->_activeCaptureState capturedFrames] + 1];
  [(DYGuestAppClient *)self _handleFrameEnd:[(DYCaptureState *)self->_activeCaptureState capturedFrames]];

  objc_sync_exit(activeCaptureState);
}

- (id)_buildQueueThreadLabelsDictionary
{
  [(DYGuestAppClient *)self _populateQueueAndThreadLabelMaps];
  BOOL v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  [v3 setObject:v4 forKey:@"queues"];

  for (i = self->_activeCaptureState->_dispatchQueueLabelMap.__table_.__p1_.__value_.__next_; i; i = (void *)*i)
  {
    id v6 = (void *)[objc_alloc(NSNumber) initWithUnsignedLong:i[2]];
    id v7 = [NSString alloc];
    uint64_t v8 = i + 3;
    if (*((char *)i + 47) < 0) {
      uint64_t v8 = (void *)*v8;
    }
    uint64_t v9 = (void *)[v7 initWithUTF8String:v8];
    [v4 setObject:v9 forKey:v6];
  }
  objc_super v10 = objc_opt_new();
  [v3 setObject:v10 forKey:@"threads"];

  for (j = self->_activeCaptureState->_threadLabelMap.__table_.__p1_.__value_.__next_; j; j = (void *)*j)
  {
    v12 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:j[2]];
    id v13 = [NSString alloc];
    v14 = j + 3;
    if (*((char *)j + 47) < 0) {
      v14 = (void *)*v14;
    }
    v15 = (void *)[v13 initWithUTF8String:v14];
    [v10 setObject:v15 forKey:v12];
  }

  return v3;
}

- (id)_buildLibraryLinkTimeVersionsDictionary
{
  BOOL v3 = objc_opt_new();
  for (uint64_t i = 0; i != 5; ++i)
    -[DYGuestAppClient _appendLinkTimeLibrary:toVersionsDictionary:](self, "_appendLinkTimeLibrary:toVersionsDictionary:", -[DYGuestAppClient _buildLibraryLinkTimeVersionsDictionary]::commonLibraries[i], v3);
  [(DYGuestAppClient *)self _appendLinkTimeLibrariesToVersionsDictionary:v3];

  return v3;
}

- (void)_sendBufferUsageCounters
{
  v7[1] = *MEMORY[0x263EF8340];
  if (![(DYCaptureDescriptor *)self->_activeCaptureDescriptor localFilePathURL])
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    saveptrQueue = self->_saveptrQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__DYGuestAppClient__sendBufferUsageCounters__block_invoke;
    block[3] = &unk_265335F20;
    block[4] = self;
    void block[5] = v3;
    dispatch_sync(saveptrQueue, block);
    id v6 = @"capture serial";
    v7[0] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DYCaptureDescriptor sessionId](self->_activeCaptureDescriptor, "sessionId"));
    -[DYGuestAppClient sendMessage:](self, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:plistPayload:](DYTransportMessage, "messageWithKind:attributes:plistPayload:", 262, [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1], v3));
  }
}

uint64_t __44__DYGuestAppClient__sendBufferUsageCounters__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__DYGuestAppClient__sendBufferUsageCounters__block_invoke_2;
  v3[3] = &unk_265337038;
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

void __44__DYGuestAppClient__sendBufferUsageCounters__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedLong:", objc_msgSend(a3, "usage"));
  [v4 setObject:v5 forKey:a2];
}

- (void)_resetBufferUsageCounters
{
  saveptrQueue = self->_saveptrQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__DYGuestAppClient__resetBufferUsageCounters__block_invoke;
  block[3] = &unk_265335F98;
  block[4] = self;
  dispatch_sync(saveptrQueue, block);
}

uint64_t __45__DYGuestAppClient__resetBufferUsageCounters__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) enumerateKeysAndObjectsWithOptions:1 usingBlock:&__block_literal_global_152];
}

uint64_t __45__DYGuestAppClient__resetBufferUsageCounters__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 resetUsage];
}

- (void)_appendLinkTimeLibrary:(const char *)a3 toVersionsDictionary:(id)a4
{
  uint64_t v6 = NSVersionOfLinkTimeLibrary(a3);
  id v7 = (void *)[[NSString alloc] initWithBytesNoCopy:a3 length:strlen(a3) encoding:1 freeWhenDone:0];
  id v8 = (id)[objc_alloc(NSNumber) initWithInt:v6];
  [a4 setObject:v8 forKey:v7];
}

- (void)_startCapture
{
  if (!self->_state)
  {
    activeCaptureDescriptor = self->_activeCaptureDescriptor;
    if (activeCaptureDescriptor)
    {
      if (self->_activeCaptureState)
      {
        ++self->_lastSessionSerial;
        -[DYCaptureDescriptor setSessionId:](activeCaptureDescriptor, "setSessionId:");
        if ([(DYCaptureDescriptor *)self->_activeCaptureDescriptor triggerFrame] == 0xFFFFFFFF) {
          [(DYCaptureDescriptor *)self->_activeCaptureDescriptor setTriggerFrame:self->_globalFrameCounter];
        }
        self->_unint64_t state = 2;
        if ([(DYCaptureDescriptor *)self->_activeCaptureDescriptor localFilePathURL])
        {
          [(DYCaptureDescriptor *)self->_activeCaptureDescriptor setSuspendAfterCapture:0];
          [(DYCaptureDescriptor *)self->_activeCaptureDescriptor setLockGraphicsAfterCapture:0];
          if ([(DYCaptureDescriptor *)self->_activeCaptureDescriptor armPreparedCapture])
          {
            self->_unint64_t state = 1;
          }
          else
          {
            [(DYGuestAppClient *)self _turnOnCapturing];
          }
        }
        else
        {
          uint64_t v4 = (void *)[MEMORY[0x263EFF9A0] dictionary];
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", self->_lastSessionSerial), @"Serial");
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 0), @"TriggerFrame");
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 0), @"FrameLimit");
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"TriggerOnNextGLCommand");
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"LockOpenGLAfterCompletion");
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"SuspendAfterCompletion");
          -[DYGuestAppClient sendMessage:](self, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:plistPayload:](DYTransportMessage, "messageWithKind:attributes:plistPayload:", 264, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", self->_lastSessionSerial), @"capture serial"), v4));
          [(DYGuestAppClient *)self lockGraphicsAndWaitForThreads:1];
        }
      }
    }
  }
}

- (void)_armCapture
{
  if (!self->_state)
  {
    activeCaptureDescriptor = self->_activeCaptureDescriptor;
    if (activeCaptureDescriptor)
    {
      if ([(DYCaptureDescriptor *)activeCaptureDescriptor sessionId])
      {
        [(DYGuestAppClient *)self lockGraphicsAndWaitForThreads:1];
        if (![(DYCaptureDescriptor *)self->_activeCaptureDescriptor triggerFrame]) {
          [(DYGuestAppClient *)self _turnOnCapturing];
        }
        self->_unint64_t state = 1;
        [(DYGuestAppClient *)self unlockGraphics];
      }
    }
  }
}

- (void)_turnOnCapturing
{
  id v3 = g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24F657000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "StartCapture", "", buf, 2u);
  }
  [(DYGuestAppClient *)self lockGraphicsAndWaitForThreads:1];
  if (!self->_localActiveArchive)
  {
    uint64_t v4 = DYGetInterposeVersion();
    uint64_t v6 = v5;
    id v7 = NSDictionary;
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DYCaptureDescriptor sessionId](self->_activeCaptureDescriptor, "sessionId"));
    uint64_t v9 = [NSNumber numberWithInt:18];
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[DYCaptureDescriptor isBoundaryLess](self->_activeCaptureDescriptor, "isBoundaryLess"));
    uint64_t v11 = [NSNumber numberWithUnsignedInt:v4];
    -[DYGuestAppClient sendMessage:](self, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:](DYTransportMessage, "messageWithKind:attributes:", 257, objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"capture serial", v9, @"version", &unk_2700EF550, @"nativePointerSize", v10, @"BoundaryLess", v11, @"interpose-feature-version",
          [NSString stringWithUTF8String:v6],
          @"interpose-patch-version",
          0)));
  }
  [(DYGuestAppClient *)self _handleTurnOnCapture];
  [(DYGuestAppClient *)self _resetBufferUsageCounters];
  GPUTools::FB::Stream::Flush((GPUTools::FB::Stream *)self->_defaultFbufStream);
  GPUTools::FB::Stream::Flush((GPUTools::FB::Stream *)self->_startup0Stream);
  GPUTools::FB::Stream::Open((GPUTools::FB::Stream *)self->_startup1Stream, (const __CFString *)[NSString stringWithFormat:@"%@-1-%@", @"startup", @"platform"]);
}

- (void)_handleActivateCaptureMessage:(id)a3
{
  unint64_t state = self->_state;
  if (state)
  {
    if (state == 2)
    {
      uint64_t v5 = (void *)[a3 plistPayload];
      int v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", @"Serial"), "unsignedIntValue");
      if ([(DYCaptureDescriptor *)self->_activeCaptureDescriptor sessionId] != v6) {
        __assert_rtn("-[DYGuestAppClient _handleActivateCaptureMessage:]", ", 0, "_activeCaptureDescriptor.sessionId == serial"");
      }
      -[DYCaptureDescriptor setSuspendAfterCapture:](self->_activeCaptureDescriptor, "setSuspendAfterCapture:", objc_msgSend((id)objc_msgSend(v5, "objectForKey:", @"SuspendAfterCompletion"), "BOOLValue"));
      -[DYCaptureDescriptor setLockGraphicsAfterCapture:](self->_activeCaptureDescriptor, "setLockGraphicsAfterCapture:", objc_msgSend((id)objc_msgSend(v5, "objectForKey:", @"LockOpenGLAfterCompletion"), "BOOLValue"));
      if ([(DYCaptureDescriptor *)self->_activeCaptureDescriptor armPreparedCapture]) {
        self->_unint64_t state = 1;
      }
      else {
        [(DYGuestAppClient *)self _turnOnCapturing];
      }
      if ([(DYCaptureDescriptor *)self->_activeCaptureDescriptor unlockGraphicThreadsOnActivateCapture])
      {
        [(DYGuestAppClient *)self unlockGraphics];
      }
    }
  }
  else
  {
    [(DYGuestAppClient *)self _armCaptureWithTransportMessage:a3];
  }
}

- (void)_turnOffCapturing
{
  [(DYGuestAppClient *)self lockGraphicsAndWaitForThreads:1];
  if ([(DYCaptureDescriptor *)self->_activeCaptureDescriptor sessionId])
  {
    GPUTools::FB::Stream::Flush((GPUTools::FB::Stream *)self->_defaultFbufStream);
    [(DYGuestAppClient *)self _sendBufferUsageCounters];
    [(DYGuestAppClient *)self _handleTurnOffCapture];
    [(DYGuestAppClient *)self notifyAllCaptureDataSent];
    BOOL v3 = [(DYCaptureDescriptor *)self->_activeCaptureDescriptor suspendAfterCapture]
      || [(DYCaptureDescriptor *)self->_activeCaptureDescriptor lockGraphicsAfterCapture];
  }
  else
  {
    BOOL v3 = 0;
  }
  if ([(DYGuestAppClient *)self traceMode] == 5)
  {
    [(DYGuestAppClient *)self invalidateSavePointerMap:0];
    [(DYGuestAppClient *)self setTraceMode:self->_previousTraceMode];
    GPUTools::FB::Stream::Close((GPUTools::FB::Stream *)self->_defaultFbufStream);
    GPUTools::FB::Stream::Open((GPUTools::FB::Stream *)self->_defaultFbufStream, @"live");
  }
  if (!v3) {
    [(DYGuestAppClient *)self unlockGraphics];
  }
  self->_unint64_t state = 5;
}

- (void)invalidateCapture
{
  if (self->_state == 3) {
    [(DYGuestAppClient *)self stopCapture];
  }
  if ([(DYCaptureState *)self->_activeCaptureState allDataReceivedAck])
  {
    if ([(DYCaptureDescriptor *)self->_activeCaptureDescriptor suspendAfterCapture])
    {
      task_suspend(*MEMORY[0x263EF8960]);
      if (![(DYCaptureDescriptor *)self->_activeCaptureDescriptor lockGraphicsAfterCapture]) {
        [(DYGuestAppClient *)self unlockGraphics];
      }
    }
  }

  self->_activeCaptureDescriptor = 0;
  self->_activeCaptureState = 0;
  self->_unint64_t state = 0;
}

- (void)_armCaptureWithTransportMessage:(id)a3
{
}

- (BOOL)armCaptureWithDescriptor:(id)a3
{
}

- (BOOL)triggerArmedCapture
{
  unint64_t state = self->_state;
  if (state == 1) {
    [(DYGuestAppClient *)self handleCaptureModeTransition:1];
  }
  return state == 1;
}

- (BOOL)startCaptureWithDescriptor:(id)a3
{
}

- (void)stopCapture
{
  if (self->_state == 3) {
    [(DYGuestAppClient *)self handleCaptureModeTransition:0];
  }
}

- (void)_populateQueueAndThreadLabelMaps
{
}

- (void)_appendToAllCaptureDataSentMessagePayload:(id)a3
{
}

- (void)_appendLinkTimeLibrariesToVersionsDictionary:(id)a3
{
}

- (BOOL)_canTriggerCaptureOnNextGraphicsCommand
{
  return 0;
}

- (void)_waitForGraphicsThreads
{
}

- (void)setLiveDebugging:(BOOL)a3
{
  self->_liveDebugging = a3;
  self->_liveDebuggingCaptureData = (NSMutableDictionary *)objc_opt_new();
}

- (Stream)defaultFbufStream
{
  return self->_defaultFbufStream;
}

- (Stream)startup0Stream
{
  return self->_startup0Stream;
}

- (int)traceMode
{
  return self->_traceMode;
}

- (int)previousTraceMode
{
  return self->_previousTraceMode;
}

- (void)setPreviousTraceMode:(int)a3
{
  self->_previousTraceMode = a3;
}

- (unsigned)globalFrameCounter
{
  return self->_globalFrameCounter;
}

- (BOOL)boundaryLessCaptureMode
{
  return self->_boundaryLessCaptureMode;
}

- (void)setBoundaryLessCaptureMode:(BOOL)a3
{
  self->_boundaryLessCaptureMode = a3;
}

- (unsigned)overrideFlags
{
  return self->_overrideFlags;
}

- (void)setOverrideFlags:(unsigned int)a3
{
  self->_overrideFlags = a3;
}

- (unint64_t)xcodeOverrideFlags
{
  return self->_xcodeOverrideFlags;
}

- (void)setXcodeOverrideFlags:(unint64_t)a3
{
  self->_xcodeOverrideFlags = a3;
}

- (double)xcodeOverrideScaleTessFactor
{
  return self->_xcodeOverrideScaleTessFactor;
}

- (void)setXcodeOverrideScaleTessFactor:(double)a3
{
  self->_xcodeOverrideScaleTessFactor = a3;
}

- (NSMutableDictionary)saveptrPtrInfoDict
{
  return self->_saveptrPtrInfoDict;
}

- (NSMutableDictionary)ptrUrlInfoDict
{
  return self->_ptrUrlInfoDict;
}

- (OS_dispatch_queue)globalSyncQueue
{
  return self->_globalSyncQueue;
}

- (OS_dispatch_queue)saveptrQueue
{
  return self->_saveptrQueue;
}

- (int)waitOnGraphicsSemaphoreAssertions
{
  return self->_waitOnGraphicsSemaphoreAssertions;
}

- (OS_dispatch_semaphore)graphicsSemaphore
{
  return self->_graphicsSemaphore;
}

- (OS_dispatch_queue)graphicsLockWaitQueue
{
  return self->_graphicsLockWaitQueue;
}

- (unint64_t)state
{
  return self->_state;
}

- (DYCaptureDescriptor)activeCaptureDescriptor
{
  return self->_activeCaptureDescriptor;
}

- (DYCaptureState)activeCaptureState
{
  return self->_activeCaptureState;
}

- (BOOL)liveDebugging
{
  return self->_liveDebugging;
}

- (NSMutableDictionary)liveDebuggingCaptureData
{
  return self->_liveDebuggingCaptureData;
}

- (Stream)startup1Stream
{
  return self->_startup1Stream;
}

- (DYCaptureArchive)localActiveArchive
{
  return self->_localActiveArchive;
}

@end