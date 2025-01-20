@interface CMContinuityCaptureDeviceBase
+ (BOOL)defaultStateExitGuard:(id)a3 dstState:(id)a4 onEvent:(id)a5;
+ (BOOL)keepRemoteClientAliveForEvent:(id)a3;
+ (void)defaultStateEntryTransitionActionForState:(id)a3 onEvent:(id)a4;
+ (void)defaultStateExitTransitionActionForState:(id)a3 onEvent:(id)a4;
- (AVCMediaStreamNegotiator)avcStreamNegotiator;
- (BOOL)activeConnection;
- (BOOL)hasStreamIntent;
- (BOOL)invalidated;
- (BOOL)postActionGuardOfType:(unint64_t)a3 forEventName:(id)a4 option:(unint64_t)a5;
- (BOOL)startAVConferenceStack:(unint64_t)a3;
- (BOOL)startCameraCaptureStack:(unint64_t)a3;
- (BOOL)stopCameraCaptureStack:(unint64_t)a3;
- (BOOL)streaming;
- (CMContinuityCaptureCompositeDeviceDelegate)compositeDelegate;
- (CMContinuityCaptureConfiguration)activeConfiguration;
- (CMContinuityCaptureDeviceBase)initWithCapabilities:(id)a3 compositeDelegate:(id)a4 transportDevice:(id)a5 queue:(id)a6;
- (CMContinuityCaptureDeviceCapabilities)capabilities;
- (CMContinuityCaptureState)stateMachineCurrentState;
- (CMContinuityCaptureStateMachine)streamActionStateMachine;
- (ContinuityCaptureTransportDevice)transportDevice;
- (ContinuityCaptureTransportDeviceStream)transportStream;
- (NSArray)controls;
- (NSString)description;
- (NSUUID)deviceID;
- (OS_dispatch_queue)queue;
- (id)_aggregateEventDuplicatesInAnyState:(id)a3 eventName:(id)a4;
- (id)_aggregateEventPairInAnyState:(id)a3 entryEventName:(id)a4 exitEventName:(id)a5;
- (id)_aggregateStreamEventsInInitState:(id)a3;
- (id)_aggregateStreamEventsInStreamState:(id)a3;
- (id)aggregateEvents:(id)a3;
- (id)debugInfo;
- (int64_t)entity;
- (unint64_t)avCaptureStackStartTime;
- (unint64_t)cameraCaptureStackStartTime;
- (unint64_t)currentSessionID;
- (void)_handleAVCNegotiation:(int64_t)a3 data:(id)a4;
- (void)_startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)_stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)dealloc;
- (void)dispatchFrame:(opaqueCMSampleBuffer *)a3 entity:(int64_t)a4 completion:(id)a5;
- (void)handleAVCNegotiation:(int64_t)a3 data:(id)a4;
- (void)invalidate;
- (void)logStreamSessionSummary;
- (void)postActionCompletionForEventName:(id)a3 eventData:(id)a4 error:(id)a5;
- (void)postActionOfType:(unint64_t)a3 forEvent:(id)a4 option:(unint64_t)a5;
- (void)postDeferredEvent:(id)a3 data:(id)a4;
- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5;
- (void)printFrameBufferLog:(int64_t)a3;
- (void)resetTransportDevice:(id)a3;
- (void)restartSendingInvalidFramesIfApplicable;
- (void)scheduleSendingInvalidFramesAfterTimeout:(BOOL)a3;
- (void)setStreamIntent:(BOOL)a3;
- (void)setStreamStateTimeout:(BOOL)a3 forTime:(unsigned int)a4;
- (void)setupStateMachine;
- (void)setupStreamActionStateMachine;
- (void)startSendingInvalidFrames;
- (void)startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)startStreamCompletedWithError:(id)a3;
- (void)stateMachineClearDeferredEvents;
- (void)stateMachineNotifyComplete:(id)a3;
- (void)stateMachineReStartStreamOnEvent:(id)a3 option:(unint64_t)a4;
- (void)stateMachineStartStreamOnEvent:(id)a3 option:(unint64_t)a4;
- (void)stateMachineStopStreamOnEvent:(id)a3 option:(unint64_t)a4;
- (void)stateMachineStreamSubstateSendData:(id)a3;
- (void)stopCaptureStack:(unint64_t)a3 completion:(id)a4;
- (void)stopSendingInvalidFrames;
- (void)stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)streamStateMachineNotifyComplete:(id)a3;
- (void)terminateComplete:(id)a3;
- (void)unconditionalTransitionForState:(id)a3 andDeferringEvent:(id)a4;
@end

@implementation CMContinuityCaptureDeviceBase

- (CMContinuityCaptureDeviceBase)initWithCapabilities:(id)a3 compositeDelegate:(id)a4 transportDevice:(id)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id location = 0;
  v15 = CMContinuityCaptureMediaIdentifierFromEntityType([v11 entityType]);
  id v31 = [NSString stringWithFormat:@"com.apple.continuitycapture.%@", v15];
  v34.receiver = self;
  v34.super_class = (Class)CMContinuityCaptureDeviceBase;
  v16 = [(CMContinuityCaptureDeviceBase *)&v34 init];
  if (v16
    && (objc_storeWeak(&location, v16),
        *((void *)v16 + 2) = [v11 entityType],
        objc_storeWeak((id *)v16 + 4, v12),
        objc_storeStrong((id *)v16 + 3, a3),
        *((void *)v16 + 3)))
  {
    if (v14)
    {
      id v17 = v14;
    }
    else
    {
      [v31 UTF8String];
      id v17 = (id)FigDispatchQueueCreateWithPriority();
    }
    v18 = (void *)*((void *)v16 + 1);
    *((void *)v16 + 1) = v17;

    id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
    v20 = (void *)*((void *)v16 + 5);
    *((void *)v16 + 5) = v19;

    v21 = objc_alloc_init(CMContinuityCaptureConfiguration);
    v22 = (void *)*((void *)v16 + 9);
    *((void *)v16 + 9) = v21;

    objc_msgSend(*((id *)v16 + 9), "setEntity:", objc_msgSend(*((id *)v16 + 3), "entityType"));
    id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
    v24 = (void *)*((void *)v16 + 16);
    *((void *)v16 + 16) = v23;

    [v16 setupStreamActionStateMachine];
    [v16 setupStateMachine];
    objc_storeStrong((id *)v16 + 17, a5);
    [*((id *)v16 + 17) addObserver:v16 forKeyPath:@"active" options:3 context:0];
    v25 = (void *)*((void *)v16 + 7);
    id WeakRetained = objc_loadWeakRetained((id *)v16 + 4);
    id v27 = objc_loadWeakRetained(&location);
    [v25 addObserver:WeakRetained forKeyPath:@"currentState" options:3 context:v27];

    [*((id *)v16 + 7) addObserver:v16 forKeyPath:@"currentState" options:3 context:0];
    atomic_store(1u, (unsigned __int8 *)v16 + 184);
    v28 = *((void *)v16 + 1);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __94__CMContinuityCaptureDeviceBase_initWithCapabilities_compositeDelegate_transportDevice_queue___block_invoke;
    block[3] = &unk_264C990F8;
    objc_copyWeak(&v33, &location);
    dispatch_async(v28, block);
    objc_destroyWeak(&v33);
    objc_storeWeak((id *)v16 + 20, v13);
    if ([v13 remote])
    {
      *(void *)(v16 + 212) = 0x500000004;
      v16[220] = FigGetCFPreferenceBooleanWithDefault() != 0;
    }
    v29 = v16;
  }
  else
  {
    v29 = 0;
  }

  objc_destroyWeak(&location);
  return v29;
}

void __94__CMContinuityCaptureDeviceBase_initWithCapabilities_compositeDelegate_transportDevice_queue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    uint64_t v2 = [WeakRetained transportStream];
    v3 = (void *)v4[18];
    v4[18] = v2;

    id WeakRetained = v4;
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235FC2000, a2, OS_LOG_TYPE_ERROR, "%@ ContinuityCapture error : dealloc unterminated device", (uint8_t *)&v2, 0xCu);
}

- (BOOL)invalidated
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_invalidated);
  return v2 & 1;
}

- (void)invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_compositeDelegate);
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_invalidated);
    queue = self->_queue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __43__CMContinuityCaptureDeviceBase_invalidate__block_invoke;
    v6[3] = &unk_264C99080;
    v6[4] = self;
    id v7 = WeakRetained;
    dispatch_async(queue, v6);
  }
}

uint64_t __43__CMContinuityCaptureDeviceBase_invalidate__block_invoke(uint64_t result)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(result + 32) + 184));
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t v3 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(v2 + 32);
      uint64_t v5 = *(void *)(v2 + 40);
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ remove SM update KVO with composite delegate %@", (uint8_t *)&v6, 0x16u);
    }

    objc_msgSend(*(id *)(*(void *)(v2 + 32) + 56), "removeObserver:forKeyPath:context:", *(void *)(v2 + 40), @"currentState");
    result = [*(id *)(*(void *)(v2 + 32) + 56) removeObserver:*(void *)(v2 + 32) forKeyPath:@"currentState" context:0];
    atomic_store(0, (unsigned __int8 *)(*(void *)(v2 + 32) + 184));
  }
  return result;
}

- (unint64_t)cameraCaptureStackStartTime
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t cameraCaptureStackStartTime = v2->_cameraCaptureStackStartTime;
  objc_sync_exit(v2);

  return cameraCaptureStackStartTime;
}

- (unint64_t)avCaptureStackStartTime
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t avCaptureStackStartTime = v2->_avCaptureStackStartTime;
  objc_sync_exit(v2);

  return avCaptureStackStartTime;
}

- (void)resetTransportDevice:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v6 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    __int16 v8 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
    uint64_t v9 = [v8 queue];
    dispatch_assert_queue_not_V2(v9);

    uint64_t v10 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
    id v11 = [v10 queue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54__CMContinuityCaptureDeviceBase_resetTransportDevice___block_invoke;
    v13[3] = &unk_264C99080;
    v13[4] = self;
    id v14 = v5;
    dispatch_async_and_wait(v11, v13);

    id v12 = self;
    objc_sync_enter(v12);
    objc_storeStrong((id *)&v12->_transportDevice, a3);
    objc_sync_exit(v12);
  }
}

id __54__CMContinuityCaptureDeviceBase_resetTransportDevice___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
    [v3 removeObserver:*(void *)(a1 + 32) forKeyPath:@"active" context:0];
  }
  [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32) forKeyPath:@"active" options:3 context:0];
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = (id *)(*(void *)(a1 + 32) + 160);
  return objc_storeWeak(v5, v4);
}

- (void)terminateComplete:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  id v5 = v4;
  if (self->_terminated)
  {
    v4[2](v4);
  }
  else
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_compositeDelegate);
    if (WeakRetained)
    {
      char v7 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
      __int16 v8 = [v7 queue];
      dispatch_assert_queue_not_V2(v8);

      uint64_t v9 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
      uint64_t v10 = [v9 queue];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __51__CMContinuityCaptureDeviceBase_terminateComplete___block_invoke;
      v14[3] = &unk_264C99148;
      v14[4] = self;
      dispatch_async_and_wait(v10, v14);

      unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->_observingStateMachineState);
      if (v11)
      {
        stateMachine = self->_stateMachine;
        id v13 = objc_loadWeakRetained(&location);
        [(CMContinuityCaptureStateMachine *)stateMachine removeObserver:WeakRetained forKeyPath:@"currentState" context:v13];

        atomic_store(0, (unsigned __int8 *)&self->_observingStateMachineState);
      }
      self->_terminated = 1;
      v5[2](v5);
    }

    objc_destroyWeak(&location);
  }
}

id __51__CMContinuityCaptureDeviceBase_terminateComplete___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) transportDevice];
  [v2 removeObserver:*(void *)(a1 + 32) forKeyPath:@"active" context:0];

  id v3 = (id *)(*(void *)(a1 + 32) + 160);
  return objc_storeWeak(v3, 0);
}

- (ContinuityCaptureTransportDevice)transportDevice
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_transportDevice;
  objc_sync_exit(v2);

  return v3;
}

- (void)startSendingInvalidFrames
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543618;
    int v6 = self;
    __int16 v7 = 2080;
    __int16 v8 = "-[CMContinuityCaptureDeviceBase startSendingInvalidFrames]";
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v5, 0x16u);
  }

  self->_dispatchingInvalidFrames = 1;
}

- (void)stopSendingInvalidFrames
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v3);

  if (self->_dispatchingInvalidFrames)
  {
    uint64_t v4 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543618;
      int v6 = self;
      __int16 v7 = 2080;
      __int16 v8 = "-[CMContinuityCaptureDeviceBase stopSendingInvalidFrames]";
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v5, 0x16u);
    }

    self->_dispatchingInvalidFrames = 0;
  }
}

- (void)restartSendingInvalidFramesIfApplicable
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->_dispatchingInvalidFrames)
  {
    id v3 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543618;
      int v5 = self;
      __int16 v6 = 2080;
      __int16 v7 = "-[CMContinuityCaptureDeviceBase restartSendingInvalidFramesIfApplicable]";
      _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v4, 0x16u);
    }

    [(CMContinuityCaptureDeviceBase *)self stopSendingInvalidFrames];
    [(CMContinuityCaptureDeviceBase *)self startSendingInvalidFrames];
  }
}

- (void)scheduleSendingInvalidFramesAfterTimeout:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  int v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  if (!self->_ignoreSendingInvalidFrames)
  {
    if (v3)
    {
      __int16 v6 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v26 = self;
        __int16 v27 = 2080;
        v28 = "-[CMContinuityCaptureDeviceBase scheduleSendingInvalidFramesAfterTimeout:]";
        _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %s schedule", buf, 0x16u);
      }

      id invalidFrameBlock = self->_invalidFrameBlock;
      if (invalidFrameBlock)
      {
        dispatch_block_cancel(invalidFrameBlock);
        id v8 = self->_invalidFrameBlock;
        self->_id invalidFrameBlock = 0;
      }
      id invalidFrameTimeoutBlock = self->_invalidFrameTimeoutBlock;
      if (invalidFrameTimeoutBlock)
      {
        dispatch_block_cancel(invalidFrameTimeoutBlock);
        id v10 = self->_invalidFrameTimeoutBlock;
        self->_id invalidFrameTimeoutBlock = 0;
      }
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      v21 = __74__CMContinuityCaptureDeviceBase_scheduleSendingInvalidFramesAfterTimeout___block_invoke;
      v22 = &unk_264C990F8;
      objc_copyWeak(&v23, &location);
      dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &v19);
      id v12 = self->_invalidFrameBlock;
      self->_id invalidFrameBlock = v11;

      dispatch_time_t v13 = dispatch_time(0, 1000000000 * self->_timeToWaitBeforeSendingInvalidFramesWhenConnectingInSec);
      id v14 = [(CMContinuityCaptureDeviceBase *)self queue];
      dispatch_after(v13, v14, self->_invalidFrameBlock);

      objc_destroyWeak(&v23);
    }
    else
    {
      id v15 = self->_invalidFrameBlock;
      if (v15)
      {
        dispatch_block_cancel(v15);
        id v16 = self->_invalidFrameBlock;
        self->_id invalidFrameBlock = 0;
      }
      id v17 = self->_invalidFrameTimeoutBlock;
      if (v17)
      {
        dispatch_block_cancel(v17);
        id v18 = self->_invalidFrameTimeoutBlock;
        self->_id invalidFrameTimeoutBlock = 0;
      }
      [(CMContinuityCaptureDeviceBase *)self stopSendingInvalidFrames];
      if (self->_invalidFrameNotificationScheduled)
      {
        self->_invalidFrameNotificationScheduled = 0;
        [(CMContinuityCaptureDeviceBase *)self scheduleInvalidFramesNotification:0];
      }
    }
  }
  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureDeviceBase_scheduleSendingInvalidFramesAfterTimeout___block_invoke(uint64_t a1)
{
  unsigned __int8 v1 = (id *)(a1 + 32);
  id WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained startSendingInvalidFrames];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__CMContinuityCaptureDeviceBase_scheduleSendingInvalidFramesAfterTimeout___block_invoke_2;
    block[3] = &unk_264C990F8;
    objc_copyWeak(&v9, v1);
    dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
    int v5 = (void *)*((void *)v3 + 25);
    *((void *)v3 + 25) = v4;

    dispatch_time_t v6 = dispatch_time(0, 1000000000 * v3[54]);
    __int16 v7 = [v3 queue];
    dispatch_after(v6, v7, *((dispatch_block_t *)v3 + 25));

    objc_destroyWeak(&v9);
  }
}

void __74__CMContinuityCaptureDeviceBase_scheduleSendingInvalidFramesAfterTimeout___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unsigned __int8 v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = WeakRetained;
  if (WeakRetained && WeakRetained[208])
  {
    dispatch_block_t v4 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_loadWeakRetained(v1);
      int v6 = 138543618;
      id v7 = v5;
      __int16 v8 = 2080;
      id v9 = "-[CMContinuityCaptureDeviceBase scheduleSendingInvalidFramesAfterTimeout:]_block_invoke_2";
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s no frames after timeout", (uint8_t *)&v6, 0x16u);
    }
    [v3 scheduleSendingInvalidFramesAfterTimeout:0];
    v3[209] = 1;
    [v3 scheduleInvalidFramesNotification:1];
  }
}

- (void)dispatchFrame:(opaqueCMSampleBuffer *)a3 entity:(int64_t)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a5;
  if (!self->_lastStreamNoOfFramesDispatched)
  {
    __int16 v8 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = [(CMContinuityCaptureDeviceBase *)self currentSessionID];
      uint64_t v10 = CMContinuityCaptureGetTimeStringFromDate(self->_lastStreamStartTime);
      int v13 = 138412802;
      id v14 = self;
      __int16 v15 = 2048;
      unint64_t v16 = v9;
      __int16 v17 = 2114;
      id v18 = v10;
      _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ [sessionID:%llx] Dispatch first frame for stream started at %{public}@", (uint8_t *)&v13, 0x20u);
    }
    dispatch_block_t v11 = [MEMORY[0x263EFF910] date];
    lastStreamFirstFrameDispatchTime = self->_lastStreamFirstFrameDispatchTime;
    self->_lastStreamFirstFrameDispatchTime = v11;
  }
  if (CMGetAttachment(a3, @"HighLatencyFrame", 0)) {
    ++self->_lastStreamNoOfHighLatencyFrames;
  }
  ++self->_lastStreamNoOfFramesDispatched;
  -[CMContinuityCaptureDeviceBase printFrameBufferLog:](self, "printFrameBufferLog:");
}

- (ContinuityCaptureTransportDeviceStream)transportStream
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
  dispatch_block_t v4 = [v3 activeStreams];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "entity", (void)v14);
        if (v11 == [(CMContinuityCaptureDeviceBase *)self entity])
        {
          id v12 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return (ContinuityCaptureTransportDeviceStream *)v12;
}

- (CMContinuityCaptureStateMachine)streamActionStateMachine
{
  return self->_streamActionStateMachine;
}

- (CMContinuityCaptureState)stateMachineCurrentState
{
  BOOL v3 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v3);

  stateMachine = self->_stateMachine;
  return [(CMContinuityCaptureStateMachine *)stateMachine currentState];
}

- (CMContinuityCaptureConfiguration)activeConfiguration
{
  return self->_activeConfiguration;
}

- (void)stateMachineStreamSubstateSendData:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyConfiguration"];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [(CMContinuityCaptureDeviceBase *)self transportDevice],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 remote],
        v7,
        v6,
        v8))
  {
    if (self->_avcStreamNegotiator)
    {
      [(CMContinuityCaptureStateMachine *)self->_streamActionStateMachine enqueueEventWithNameToPostOnCurrentQueue:@"kCMContinuityCaptureStreamActionEventReceivedData" data:0];
      if (self->_avcStackStarted) {
        [(CMContinuityCaptureStateMachine *)self->_streamActionStateMachine enqueueEventWithNameToPost:@"kCMContinuityCaptureStreamActionEventCaptureStarted" data:0];
      }
    }
    unint64_t v9 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
    uint64_t v10 = [v4 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyConfiguration"];
    uint64_t v11 = [v4 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyOption"];
    objc_msgSend(v9, "startStream:option:completion:", v10, objc_msgSend(v11, "integerValue"), &__block_literal_global_4);
  }
  else
  {
    uint64_t v12 = [v4 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyAVCData"];
    if (v12)
    {
      int v13 = (void *)v12;
      long long v14 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
      char v15 = [v14 remote];

      if ((v15 & 1) == 0)
      {
        long long v16 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 138543618;
          v21 = self;
          __int16 v22 = 2048;
          unint64_t v23 = [(CMContinuityCaptureDeviceBase *)self currentSessionID];
          _os_log_impl(&dword_235FC2000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Negotiation data sent", (uint8_t *)&v20, 0x16u);
        }

        long long v17 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
        int64_t entity = self->_entity;
        uint64_t v19 = [v4 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyAVCData"];
        [v17 handleAVCNegotiation:entity data:v19];
      }
    }
  }
}

- (void)postActionOfType:(unint64_t)a3 forEvent:(id)a4 option:(unint64_t)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  switch(a3)
  {
    case 1uLL:
      [(CMContinuityCaptureDeviceBase *)self stateMachineStartStreamOnEvent:v8 option:a5];
      break;
    case 2uLL:
      [(CMContinuityCaptureDeviceBase *)self stateMachineStopStreamOnEvent:v8 option:a5];
      break;
    case 3uLL:
      [(CMContinuityCaptureDeviceBase *)self stateMachineReStartStreamOnEvent:v8 option:a5];
      break;
    case 0xAuLL:
      unint64_t v9 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        long long v16 = self;
        _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ terminate", buf, 0xCu);
      }

      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __66__CMContinuityCaptureDeviceBase_postActionOfType_forEvent_option___block_invoke;
      v12[3] = &unk_264C990F8;
      objc_copyWeak(&v13, &location);
      [(CMContinuityCaptureDeviceBase *)self terminateComplete:v12];
      objc_destroyWeak(&v13);
      break;
    case 0xCuLL:
      stateMachine = self->_stateMachine;
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:3 userInfo:0];
      [(CMContinuityCaptureStateMachine *)stateMachine notifyCompletion:v11];

      break;
    case 0xDuLL:
      [(CMContinuityCaptureStateMachine *)self->_stateMachine notifyCompletion:0];
      break;
    default:
      break;
  }
  objc_destroyWeak(&location);
}

void __66__CMContinuityCaptureDeviceBase_postActionOfType_forEvent_option___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 4);
    if (v2)
    {
      [v3 stopCameraCaptureStack:512];
      [v2 terminateCompleteForDevice:v3];
      [v3 stateMachineNotifyComplete:0];
    }

    id WeakRetained = v3;
  }
}

- (BOOL)postActionGuardOfType:(unint64_t)a3 forEventName:(id)a4 option:(unint64_t)a5
{
  return 1;
}

- (void)postActionCompletionForEventName:(id)a3 eventData:(id)a4 error:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(CMContinuityCaptureStateMachine *)self->_stateMachine currentState];
    int v15 = 138544130;
    long long v16 = self;
    __int16 v17 = 2114;
    id v18 = v8;
    __int16 v19 = 2114;
    int v20 = v12;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ postCompletion for %{public}@ with currentState:%{public}@ eventStatus:%@", (uint8_t *)&v15, 0x2Au);
  }
  if (v9)
  {
    id v13 = [v9 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataCompletionBlock"];

    if (v13)
    {
      long long v14 = [v9 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataCompletionBlock"];
      ((void (**)(void, id))v14)[2](v14, v10);
    }
  }
}

- (void)stopCaptureStack:(unint64_t)a3 completion:(id)a4
{
  queue = self->_queue;
  uint64_t v7 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2(queue);
  avcStreamNegotiator = self->_avcStreamNegotiator;
  self->_avcStreamNegotiator = 0;

  self->_avcStackStarted = 0;
  v7[2](v7, 0);
}

- (BOOL)startAVConferenceStack:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2080;
    id v10 = "-[CMContinuityCaptureDeviceBase startAVConferenceStack:]";
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v7, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(CMContinuityCaptureStateMachine *)self->_streamActionStateMachine enqueueEventWithNameToPost:@"kCMContinuityCaptureStreamActionEventCaptureStarted" data:0];
  self->_avcStackStarted = 1;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  v5->_unint64_t avCaptureStackStartTime = mach_continuous_time();
  objc_sync_exit(v5);

  return 1;
}

- (BOOL)startCameraCaptureStack:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2080;
    id v10 = "-[CMContinuityCaptureDeviceBase startCameraCaptureStack:]";
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v7, 0x16u);
  }

  [(CMContinuityCaptureStateMachine *)self->_streamActionStateMachine enqueueEventWithNameToPost:@"kCMContinuityCaptureStreamActionEventCaptureStarting" data:0];
  uint64_t v5 = self;
  objc_sync_enter(v5);
  v5->_unint64_t cameraCaptureStackStartTime = mach_continuous_time();
  objc_sync_exit(v5);

  return 1;
}

- (void)handleAVCNegotiation:(int64_t)a3 data:(id)a4
{
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  int v7 = [(CMContinuityCaptureDeviceBase *)self queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__CMContinuityCaptureDeviceBase_handleAVCNegotiation_data___block_invoke;
  v9[3] = &unk_264C997E8;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __59__CMContinuityCaptureDeviceBase_handleAVCNegotiation_data___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _handleAVCNegotiation:*(void *)(a1 + 48) data:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_handleAVCNegotiation:(int64_t)a3 data:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = [(CMContinuityCaptureDeviceBase *)self currentSessionID];
    *(_DWORD *)buf = 138543618;
    v30 = self;
    __int16 v31 = 2048;
    unint64_t v32 = v7;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Negotiation data received", buf, 0x16u);
  }

  id v8 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
  int v9 = [v8 remote];

  if (v9)
  {
    id v10 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__CMContinuityCaptureDeviceBase__handleAVCNegotiation_data___block_invoke;
    block[3] = &unk_264C99B18;
    objc_copyWeak(&v21, &location);
    id v19 = v5;
    int v20 = &v22;
    dispatch_async(v10, block);

    objc_destroyWeak(&v21);
  }
  else
  {
    avcStreamNegotiator = self->_avcStreamNegotiator;
    uint64_t v12 = (id *)(v23 + 5);
    id obj = (id)v23[5];
    int v13 = [(AVCMediaStreamNegotiator *)avcStreamNegotiator setAnswer:v5 withError:&obj];
    objc_storeStrong(v12, obj);
    if (v13)
    {
      [(CMContinuityCaptureDeviceBase *)self startAVConferenceStack:0];
    }
    else
    {
      long long v14 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = (CMContinuityCaptureDeviceBase *)objc_loadWeakRetained(&location);
        unint64_t v16 = v23[5];
        *(_DWORD *)buf = 138543618;
        v30 = v15;
        __int16 v31 = 2114;
        unint64_t v32 = v16;
        _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream Failed to get set answer AVCNegotiator error %{public}@", buf, 0x16u);
      }
    }
  }
  [(CMContinuityCaptureStateMachine *)self->_streamActionStateMachine enqueueEventWithNameToPostOnCurrentQueue:@"kCMContinuityCaptureStreamActionEventReceivedData" data:0];
  _Block_object_dispose(&v22, 8);

  objc_destroyWeak(&location);
}

void __60__CMContinuityCaptureDeviceBase__handleAVCNegotiation_data___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = objc_alloc(MEMORY[0x263F20F98]);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v6 + 40);
    unint64_t v7 = (void *)[v4 initWithOffer:v5 error:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    if (v7)
    {
      id v8 = WeakRetained[1];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __60__CMContinuityCaptureDeviceBase__handleAVCNegotiation_data___block_invoke_29;
      v12[3] = &unk_264C99AF0;
      void v12[4] = WeakRetained;
      id v13 = v7;
      objc_copyWeak(&v14, v2);
      dispatch_async(v8, v12);
      objc_destroyWeak(&v14);
    }
    else
    {
      int v9 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = objc_loadWeakRetained(v2);
        uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        id v17 = v10;
        __int16 v18 = 2114;
        uint64_t v19 = v11;
        _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream Failed to get AVCNegotiator error %{public}@", buf, 0x16u);
      }
    }
  }
}

uint64_t __60__CMContinuityCaptureDeviceBase__handleAVCNegotiation_data___block_invoke_29(id *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)a1[4] + 15, a1[5]);
  id v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    uint64_t v4 = [a1[4] currentSessionID];
    int v9 = 138543618;
    id v10 = WeakRetained;
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Negotiation data sent", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v5 = [a1[4] transportDevice];
  uint64_t v6 = [a1[4] entity];
  unint64_t v7 = [*((id *)a1[4] + 15) answer];
  [v5 handleAVCNegotiation:v6 data:v7];

  return [a1[4] startAVConferenceStack:0];
}

- (void)startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v10 = [(CMContinuityCaptureDeviceBase *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__CMContinuityCaptureDeviceBase_startStream_option_completion___block_invoke;
  block[3] = &unk_264C99300;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __63__CMContinuityCaptureDeviceBase_startStream_option_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _startStream:*(void *)(a1 + 32) option:*(void *)(a1 + 56) completion:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = (void (**)(id, void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(CMContinuityCaptureDeviceBase *)self streaming])
  {
    id v11 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v44 = self;
      _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Stream Session In Progress", buf, 0xCu);
    }

    v10[2](v10, 0);
  }
  else
  {
    id v12 = [MEMORY[0x263EFF910] date];
    lastStreamStartTime = self->_lastStreamStartTime;
    self->_lastStreamStartTime = v12;

    id v14 = [v9 sessionID];

    if (v14)
    {
      [(CMContinuityCaptureDeviceBase *)self willChangeValueForKey:@"activeConfiguration"];
      objc_storeStrong((id *)&self->_activeConfiguration, a3);
      [(CMContinuityCaptureDeviceBase *)self didChangeValueForKey:@"activeConfiguration"];
      [(CMContinuityCaptureDeviceBase *)self willChangeValueForKey:@"streaming"];
      atomic_store(1u, (unsigned __int8 *)&self->_streaming);
      [(CMContinuityCaptureDeviceBase *)self didChangeValueForKey:@"streaming"];
      id v15 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v44 = self;
        __int16 v45 = 2114;
        id v46 = v9;
        __int16 v47 = 1024;
        int v48 = a4;
        _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream config:%{public}@ option:%d", buf, 0x1Cu);
      }

      if ((a4 & 0x800) != 0)
      {
        uint64_t v22 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:2 userInfo:0];
        ((void (**)(id, void *))v10)[2](v10, v22);
      }
      else
      {
        if ([(NSMutableArray *)self->_pendingCompletionBlocks count]) {
          [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"%@ ContinuityCapture error : Invalid completion block array", self format];
        }
        pendingCompletionBlocks = self->_pendingCompletionBlocks;
        uint64_t v17 = MEMORY[0x237DFB780](v10);
        [(NSMutableArray *)pendingCompletionBlocks addObject:v17];

        __int16 v18 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
        LOBYTE(v17) = [v18 remote];

        if (v17)
        {
          streamActionStateMachine = self->_streamActionStateMachine;
          v39[0] = @"CMContinuityCaptureStateMachineEventDataKeyOption";
          uint64_t v20 = [NSNumber numberWithUnsignedInteger:a4];
          v39[1] = @"CMContinuityCaptureStateMachineEventDataKeyConfiguration";
          v40[0] = v20;
          v40[1] = v9;
          id v21 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
          [(CMContinuityCaptureStateMachine *)streamActionStateMachine enqueueEventWithNameToPostOnCurrentQueue:@"kCMContinuityCaptureStreamActionEventSendData" data:v21];
        }
        else
        {
          if ([(CMContinuityCaptureDeviceBase *)self entity] == 3)
          {
            uint64_t v23 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
            int v24 = [v23 audioDeviceMode];

            if (v24 == 1667329132) {
              v25 = &unk_26E96A818;
            }
            else {
              v25 = 0;
            }
            v38 = 0;
            v26 = (AVCMediaStreamNegotiator *)[objc_alloc(MEMORY[0x263F20F98]) initWithMode:4 options:v25 error:&v38];
            id v27 = v38;
          }
          else
          {
            v37 = 0;
            v26 = (AVCMediaStreamNegotiator *)[objc_alloc(MEMORY[0x263F20F98]) initWithMode:3 error:&v37];
            id v27 = v37;
          }
          id v28 = v27;
          avcStreamNegotiator = self->_avcStreamNegotiator;
          self->_avcStreamNegotiator = v26;

          v30 = self->_avcStreamNegotiator;
          if (v30
            && ([(AVCMediaStreamNegotiator *)v30 offer],
                __int16 v31 = objc_claimAutoreleasedReturnValue(),
                v31,
                v31))
          {
            unint64_t v32 = self->_streamActionStateMachine;
            v41[0] = @"CMContinuityCaptureStateMachineEventDataKeyAVCData";
            uint64_t v33 = [(AVCMediaStreamNegotiator *)self->_avcStreamNegotiator offer];
            v42[0] = v33;
            v41[1] = @"CMContinuityCaptureStateMachineEventDataKeyOption";
            objc_super v34 = [NSNumber numberWithUnsignedInteger:a4];
            v42[1] = v34;
            v35 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
            [(CMContinuityCaptureStateMachine *)v32 enqueueEventWithNameToPostOnCurrentQueue:@"kCMContinuityCaptureStreamActionEventSendData" data:v35];
          }
          else
          {
            v36 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v44 = self;
              __int16 v45 = 2114;
              id v46 = v28;
              _os_log_impl(&dword_235FC2000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream Failed to get AVCNegotiator error %{public}@", buf, 0x16u);
            }
          }
        }
      }
    }
    else
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"%@ ContinuityCapture error : Invalid sessionID", self format];
    }
  }
}

- (void)stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v9 = [(CMContinuityCaptureDeviceBase *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__CMContinuityCaptureDeviceBase_stopStream_option_completion___block_invoke;
  block[3] = &unk_264C993F0;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  v13[2] = (id)a4;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __62__CMContinuityCaptureDeviceBase_stopStream_option_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _stopStream:*(void *)(a1 + 48) option:*(void *)(a1 + 56) completion:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (BOOL)stopCameraCaptureStack:(unint64_t)a3
{
  return 1;
}

- (void)_stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v9);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if ([(CMContinuityCaptureDeviceBase *)self streaming])
  {
    id v10 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      activeConfiguration = self->_activeConfiguration;
      *(_DWORD *)buf = 138543874;
      id v21 = self;
      __int16 v22 = 2114;
      uint64_t v23 = activeConfiguration;
      __int16 v24 = 1024;
      int v25 = a4;
      _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ StopStream config:%{public}@ option:%d", buf, 0x1Cu);
    }

    [(CMContinuityCaptureDeviceBase *)self willChangeValueForKey:@"streaming"];
    atomic_store(0, (unsigned __int8 *)&self->_streaming);
    [(CMContinuityCaptureDeviceBase *)self didChangeValueForKey:@"streaming"];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    id v16[2] = __63__CMContinuityCaptureDeviceBase__stopStream_option_completion___block_invoke;
    v16[3] = &unk_264C99468;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a4;
    v18[2] = (id)a3;
    id v17 = v8;
    [(CMContinuityCaptureDeviceBase *)self stopCaptureStack:a4 completion:v16];
    [(CMContinuityCaptureDeviceBase *)self logStreamSessionSummary];
    self->_lastStreamNoOfFramesDispatched = 0;
    self->_lastStreamNoOfHighLatencyFrames = 0;
    lastStreamStartTime = self->_lastStreamStartTime;
    self->_lastStreamStartTime = 0;

    lastStreamFirstFrameDispatchTime = self->_lastStreamFirstFrameDispatchTime;
    self->_lastStreamFirstFrameDispatchTime = 0;

    objc_destroyWeak(v18);
  }
  else
  {
    id v14 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = self;
      _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Stream Session not In Progress", buf, 0xCu);
    }

    id v15 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:3 userInfo:0];
    (*((void (**)(id, void *))v8 + 2))(v8, v15);
  }
  objc_destroyWeak(&location);
}

void __63__CMContinuityCaptureDeviceBase__stopStream_option_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v13 = 138543618;
    id v14 = WeakRetained;
    __int16 v15 = 2114;
    uint64_t v16 = a2;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ stopCaptureStack %{public}@", (uint8_t *)&v13, 0x16u);
  }
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 transportDevice];
    if (![v8 remote] || (uint64_t v9 = *(void *)(a1 + 48), (v9 & 0x10) != 0))
    {
    }
    else
    {

      if ((v9 & 0x80) == 0)
      {
        id v10 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138543362;
          id v14 = v7;
          _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ sending stop to remote", (uint8_t *)&v13, 0xCu);
        }

        id v11 = [v7 transportDevice];
        [v11 stopStream:*(void *)(a1 + 56) option:*(void *)(a1 + 48) completion:&__block_literal_global_46];
LABEL_13:

        uint64_t v12 = *(void *)(a1 + 32);
        if (v12) {
          (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, a2);
        }
        goto LABEL_15;
      }
    }
    id v11 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v7;
      _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ skip sending stop", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_13;
  }
LABEL_15:
}

- (BOOL)hasStreamIntent
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_hasStreamIntent);
  return v2 & 1;
}

- (void)setStreamIntent:(BOOL)a3
{
}

- (void)printFrameBufferLog:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ((unint64_t)a3 <= 0x1E && ((1 << a3) & 0x40000022) != 0
    || __ROR8__(0x4FA4FA4FA4FA4FA5 * a3 + 0x2D82D82D82D82D8, 1) <= 0x2D82D82D82D82D8uLL)
  {
    uint64_t v5 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543874;
      unint64_t v7 = self;
      __int16 v8 = 2048;
      unint64_t v9 = [(CMContinuityCaptureDeviceBase *)self currentSessionID];
      __int16 v10 = 2048;
      int64_t v11 = a3;
      _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Received FrameCounter %lu", (uint8_t *)&v6, 0x20u);
    }
  }
}

- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = self;
    __int16 v20 = 2080;
    id v21 = "-[CMContinuityCaptureDeviceBase postEvent:entity:data:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2048;
    int64_t v25 = a4;
    _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@ %ld", buf, 0x2Au);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__CMContinuityCaptureDeviceBase_postEvent_entity_data___block_invoke;
  v14[3] = &unk_264C990A8;
  objc_copyWeak(&v18, (id *)buf);
  id v15 = v9;
  uint64_t v16 = self;
  id v17 = v8;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(queue, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

uint64_t __55__CMContinuityCaptureDeviceBase_postEvent_entity_data___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    id v8 = WeakRetained;
    if (v3)
    {
      uint64_t v4 = [v3 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyConfiguration"];

      id WeakRetained = v8;
      if (v4)
      {
        [*(id *)(a1 + 40) willChangeValueForKey:@"activeConfiguration"];
        uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyConfiguration"];
        id v6 = v8[9];
        v8[9] = (id)v5;

        [*(id *)(a1 + 40) didChangeValueForKey:@"activeConfiguration"];
        id WeakRetained = v8;
      }
    }
    [WeakRetained[7] enqueueEventWithNameToPostOnCurrentQueue:*(void *)(a1 + 48) data:*(void *)(a1 + 32)];
  }
  return MEMORY[0x270F9A758]();
}

+ (BOOL)keepRemoteClientAliveForEvent:(id)a3
{
  uint64_t v3 = keepRemoteClientAliveForEvent__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&keepRemoteClientAliveForEvent__onceToken, &__block_literal_global_48);
  }
  char v5 = [(id)keepRemoteClientAliveForEvent__keepAliveEventNames containsObject:v4];

  return v5;
}

uint64_t __63__CMContinuityCaptureDeviceBase_keepRemoteClientAliveForEvent___block_invoke()
{
  keepRemoteClientAliveForEvent__keepAliveEventNames = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"kCMContinuityCaptureEventUserPause", @"kCMContinuityCaptureEventUserResume", @"kCMContinuityCaptureEventActiveCallStart", @"kCMContinuityCaptureEventActiveCallEnd", @"kCMContinuityCaptureEventCaptureSessionStarted", @"kCMContinuityCaptureEventCaptureSessionEnded", @"kCMContinuityCaptureEventStreamDisableForDeviceInUse", @"kCMContinuityCaptureEventStreamDisableForDeviceInUseExit", 0);
  return MEMORY[0x270F9A758]();
}

- (unint64_t)currentSessionID
{
  unsigned __int8 v2 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
  unint64_t v3 = [v2 currentSessionID];

  return v3;
}

- (void)stateMachineReStartStreamOnEvent:(id)a3 option:(unint64_t)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  unint64_t v7 = [v6 name];
  int v8 = [v7 isEqualToString:@"kCMContinuityCaptureEventStreamInterrupted"];

  if (v8)
  {
    id v9 = [v6 data];
    __int16 v10 = [v9 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyAttemptStreamRestart"];
    a4 |= 4uLL;
    if (v10)
    {
      int64_t v11 = [v6 data];
      id v12 = [v11 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyAttemptStreamRestart"];
      char v13 = [v12 BOOLValue];

      if ((v13 & 1) == 0)
      {
        [(CMContinuityCaptureDeviceBase *)self stopCaptureStack:a4 completion:&__block_literal_global_51];
        stateMachine = self->_stateMachine;
        id v15 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:2 userInfo:0];
        [(CMContinuityCaptureStateMachine *)stateMachine notifyCompletion:v15];

        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  uint64_t v16 = [v6 data];
  if (v16)
  {
    id v17 = [v6 data];
    id v18 = [v17 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyOption"];
    BOOL v19 = v18 == 0;

    if (!v19)
    {
      __int16 v20 = [v6 data];
      id v21 = [v20 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyOption"];
      uint64_t v22 = [v21 integerValue];

      a4 |= v22;
    }
  }
  id v23 = CMContinuityCaptureLog(2);
  __int16 v24 = (void *)(a4 | 1);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v30 = self;
    __int16 v31 = 2082;
    unint64_t v32 = "-[CMContinuityCaptureDeviceBase stateMachineReStartStreamOnEvent:option:]";
    __int16 v33 = 2114;
    id v34 = v6;
    __int16 v35 = 1024;
    int v36 = (int)v24;
    _os_log_impl(&dword_235FC2000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s %{public}@ option %d", buf, 0x26u);
  }

  int64_t entity = self->_entity;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __73__CMContinuityCaptureDeviceBase_stateMachineReStartStreamOnEvent_option___block_invoke_52;
  v26[3] = &unk_264C99288;
  objc_copyWeak(v27, &location);
  v27[1] = v24;
  [(CMContinuityCaptureDeviceBase *)self stopStream:entity option:v24 completion:v26];
  objc_destroyWeak(v27);
LABEL_12:
  objc_destroyWeak(&location);
}

void __73__CMContinuityCaptureDeviceBase_stateMachineReStartStreamOnEvent_option___block_invoke_52(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = CMContinuityCaptureLog(2);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v7)
      {
        id v8 = objc_loadWeakRetained(v4);
        *(_DWORD *)buf = 138412546;
        id v15 = v8;
        __int16 v16 = 2114;
        uint64_t v17 = a2;
        _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ Stream Stop failed with error %{public}@", buf, 0x16u);
      }
      [WeakRetained[7] notifyCompletion:a2];
    }
    else
    {
      if (v7)
      {
        id v9 = objc_loadWeakRetained(v4);
        *(_DWORD *)buf = 138412290;
        id v15 = v9;
        _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ Stream Stop complete, restart new session", buf, 0xCu);
      }
      __int16 v10 = [WeakRetained activeConfiguration];
      uint64_t v11 = *(void *)(a1 + 40);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __73__CMContinuityCaptureDeviceBase_stateMachineReStartStreamOnEvent_option___block_invoke_53;
      v12[3] = &unk_264C99260;
      objc_copyWeak(&v13, v4);
      [WeakRetained startStream:v10 option:v11 completion:v12];

      objc_destroyWeak(&v13);
    }
  }
}

void __73__CMContinuityCaptureDeviceBase_stateMachineReStartStreamOnEvent_option___block_invoke_53(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[7] notifyCompletion:a2];
    if (a2)
    {
      id v6 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = objc_loadWeakRetained(v3);
        int v8 = 138412546;
        id v9 = v7;
        __int16 v10 = 2112;
        uint64_t v11 = a2;
        _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ start stream failed error %@", (uint8_t *)&v8, 0x16u);
      }
    }
  }
}

- (void)stateMachineStartStreamOnEvent:(id)a3 option:(unint64_t)a4
{
  id v6 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_compositeDelegate);
  if (!WeakRetained) {
    goto LABEL_16;
  }
  int v8 = [v6 data];
  if (v8)
  {
    id v9 = [v6 data];
    __int16 v10 = [v9 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyOption"];

    if (v10)
    {
      uint64_t v11 = [v6 data];
      uint64_t v12 = [v11 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyOption"];
      a4 |= [v12 integerValue];
    }
  }
  id v13 = [v6 name];
  int v14 = [v13 isEqualToString:@"kCMContinuityCaptureEventRemoteClientReconnect"];

  if (v14) {
    unint64_t v15 = a4 | 0x20;
  }
  else {
    unint64_t v15 = a4;
  }
  __int16 v16 = [v6 name];
  if ([v16 isEqualToString:@"kCMContinuityCaptureEventCaptureSessionEnded"])
  {

LABEL_11:
    v15 |= 0x100uLL;
    goto LABEL_12;
  }
  uint64_t v17 = [v6 name];
  int v18 = [v17 isEqualToString:@"kCMContinuityCaptureEventStreamDisableForDeviceInUseExit"];

  if (v18) {
    goto LABEL_11;
  }
LABEL_12:
  BOOL v19 = [v6 name];
  BOOL v20 = +[CMContinuityCaptureDeviceBase keepRemoteClientAliveForEvent:v19];

  id v21 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
  char v22 = [v21 remote];
  id v23 = (void *)(v15 | v20);

  [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  if (v22) {
    __int16 v24 = {;
  }
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    id v27[2] = __71__CMContinuityCaptureDeviceBase_stateMachineStartStreamOnEvent_option___block_invoke_55;
    v27[3] = &unk_264C99B40;
    int64_t v25 = v29;
    objc_copyWeak(v29, &location);
    id v28 = v6;
    v29[1] = v23;
    [WeakRetained startStream:v24 option:v23 completion:v27];

    uint64_t v26 = v28;
  }
  else {
    uint64_t v26 = {;
  }
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __71__CMContinuityCaptureDeviceBase_stateMachineStartStreamOnEvent_option___block_invoke;
    v30[3] = &unk_264C99260;
    int64_t v25 = &v31;
    objc_copyWeak(&v31, &location);
    [(CMContinuityCaptureDeviceBase *)self startStream:v26 option:v23 completion:v30];
  }

  objc_destroyWeak(v25);
LABEL_16:

  objc_destroyWeak(&location);
}

void __71__CMContinuityCaptureDeviceBase_stateMachineStartStreamOnEvent_option___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[7] notifyCompletion:a2];
    if (a2)
    {
      id v6 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = objc_loadWeakRetained(v3);
        int v8 = 138412546;
        id v9 = v7;
        __int16 v10 = 2112;
        uint64_t v11 = a2;
        _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ start stream failed error %@", (uint8_t *)&v8, 0x16u);
      }
    }
  }
}

void __71__CMContinuityCaptureDeviceBase_stateMachineStartStreamOnEvent_option___block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_loadWeakRetained((id *)(a1 + 40));
      uint64_t v8 = [WeakRetained currentSessionID];
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = [WeakRetained activeConfiguration];
      int v14 = 138544642;
      id v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = v8;
      __int16 v18 = 2082;
      BOOL v19 = "-[CMContinuityCaptureDeviceBase stateMachineStartStreamOnEvent:option:]_block_invoke";
      __int16 v20 = 2114;
      uint64_t v21 = v9;
      __int16 v22 = 1024;
      int v23 = v10;
      __int16 v24 = 2114;
      int64_t v25 = v11;
      _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] %{public}s %{public}@ option %d configuration %{public}@", (uint8_t *)&v14, 0x3Au);
    }
    [WeakRetained[7] notifyCompletion:v3];
    if (v3)
    {
      uint64_t v12 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = objc_loadWeakRetained(v4);
        int v14 = 138412546;
        id v15 = v13;
        __int16 v16 = 2112;
        uint64_t v17 = (uint64_t)v3;
        _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "%@ start stream failed error %@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
}

- (void)stateMachineStopStreamOnEvent:(id)a3 option:(unint64_t)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_compositeDelegate);
  if (!WeakRetained) {
    goto LABEL_25;
  }
  uint64_t v8 = [v6 data];
  if (v8)
  {
    uint64_t v9 = [v6 data];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyOption"];
    BOOL v11 = v10 == 0;

    if (!v11)
    {
      uint64_t v12 = [v6 data];
      id v13 = [v12 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyOption"];
      uint64_t v14 = [v13 integerValue];

      a4 |= v14;
    }
  }
  id v15 = [v6 name];
  BOOL v16 = +[CMContinuityCaptureDeviceBase keepRemoteClientAliveForEvent:v15];

  uint64_t v17 = [v6 name];
  unint64_t v18 = a4 | v16;
  if ((objc_msgSend(v17, "isEqualToString:") & 1) == 0)
  {

    goto LABEL_14;
  }
  BOOL v19 = [v6 data];
  if (!v19) {
    goto LABEL_12;
  }
  __int16 v20 = [v6 data];
  uint64_t v21 = [v20 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyAttemptStreamRestart"];
  if (!v21)
  {

LABEL_12:
    goto LABEL_13;
  }
  __int16 v22 = [v6 data];
  int v23 = [v22 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyAttemptStreamRestart"];
  char v35 = [v23 BOOLValue];

  if ((v35 & 1) == 0) {
LABEL_13:
  }
    v18 |= 0x10uLL;
LABEL_14:
  __int16 v24 = [v6 name];
  if ([v24 isEqualToString:@"kCMContinuityCaptureEventTerminate"])
  {

LABEL_17:
    v18 |= 0x200uLL;
    goto LABEL_18;
  }
  int64_t v25 = [v6 name];
  int v26 = [v25 isEqualToString:@"kCMContinuityCaptureEventUserDisconnect"];

  if (v26) {
    goto LABEL_17;
  }
LABEL_18:
  id v27 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    __int16 v45 = self;
    __int16 v46 = 2082;
    __int16 v47 = "-[CMContinuityCaptureDeviceBase stateMachineStopStreamOnEvent:option:]";
    __int16 v48 = 2114;
    id v49 = v6;
    __int16 v50 = 1024;
    int v51 = v18;
    _os_log_impl(&dword_235FC2000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s %{public}@ option %d", buf, 0x26u);
  }

  id v28 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
  char v29 = [v28 remote];

  if (v29)
  {
    v43[0] = @"kCMContinuityCaptureEventUserPause";
    v43[1] = @"kCMContinuityCaptureEventActiveCallStart";
    v43[2] = @"kCMContinuityCaptureEventUserDisconnect";
    v43[3] = @"kCMContinuityCaptureEventRemoteClientDisconnect";
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:4];
    id v31 = [v6 name];
    int v32 = [v30 containsObject:v31];

    if (v32) {
      v18 |= 0x80uLL;
    }
    int64_t entity = self->_entity;
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_3;
    v36[3] = &unk_264C996D8;
    objc_copyWeak(&v38, &location);
    id v37 = v6;
    [WeakRetained stopStream:entity option:v18 completion:v36];

    objc_destroyWeak(&v38);
  }
  else
  {
    int64_t v34 = [(CMContinuityCaptureDeviceBase *)self entity];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    void v39[2] = __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke;
    v39[3] = &unk_264C996D8;
    objc_copyWeak(&v41, &location);
    id v40 = v6;
    [(CMContinuityCaptureDeviceBase *)self stopStream:v34 option:v18 completion:v39];

    objc_destroyWeak(&v41);
  }
LABEL_25:

  objc_destroyWeak(&location);
}

void __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = [*(id *)(a1 + 32) name];
    int v7 = [v6 isEqualToString:@"kCMContinuityCaptureEventTerminate"];

    if (v7)
    {
      uint64_t v8 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = objc_loadWeakRetained(v4);
        *(_DWORD *)buf = 138543362;
        id v15 = v9;
        _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ terminate", buf, 0xCu);
      }
      uint64_t v10 = *((void *)WeakRetained + 1);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      id v11[2] = __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_56;
      v11[3] = &unk_264C99120;
      objc_copyWeak(&v13, v4);
      id v12 = v3;
      dispatch_async(v10, v11);

      objc_destroyWeak(&v13);
    }
    else
    {
      [*((id *)WeakRetained + 7) notifyCompletion:v3];
    }
  }
}

void __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_56(uint64_t a1)
{
  unsigned __int8 v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_2;
    v4[3] = &unk_264C99120;
    objc_copyWeak(&v6, v2);
    id v5 = *(id *)(a1 + 32);
    [WeakRetained terminateComplete:v4];

    objc_destroyWeak(&v6);
  }
}

void __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 4);
    id v4 = v3;
    if (v3)
    {
      [v3 terminateCompleteForDevice:v5];
      [v5[7] notifyCompletion:*(void *)(a1 + 32)];
    }

    id WeakRetained = v5;
  }
}

void __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = [*(id *)(a1 + 32) name];
    int v7 = [v6 isEqualToString:@"kCMContinuityCaptureEventTerminate"];

    if (v7)
    {
      uint64_t v8 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = objc_loadWeakRetained(v4);
        *(_DWORD *)buf = 138543362;
        id v15 = v9;
        _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ terminate", buf, 0xCu);
      }
      uint64_t v10 = *((void *)WeakRetained + 1);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_58;
      block[3] = &unk_264C99198;
      objc_copyWeak(&v13, v4);
      void block[4] = WeakRetained;
      id v12 = v3;
      dispatch_async(v10, block);

      objc_destroyWeak(&v13);
    }
    else
    {
      [*((id *)WeakRetained + 7) notifyCompletion:v3];
    }
  }
}

void __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_58(uint64_t a1)
{
  unsigned __int8 v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_2_59;
    v5[3] = &unk_264C99120;
    objc_copyWeak(&v7, v2);
    id v6 = *(id *)(a1 + 40);
    [v4 terminateComplete:v5];

    objc_destroyWeak(&v7);
  }
}

void __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_2_59(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 4);
    id v4 = v3;
    if (v3)
    {
      [v3 terminateCompleteForDevice:v5];
      [v5[7] notifyCompletion:*(void *)(a1 + 32)];
    }

    id WeakRetained = v5;
  }
}

+ (void)defaultStateEntryTransitionActionForState:(id)a3 onEvent:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  id v6 = [v5 name];
  id v7 = [v11 name];
  int valid = CMContinuityCaptureSMIsValidEntryEventForState(v6, v7);

  if (valid)
  {
    id v9 = [v11 pendingEvents];
    uint64_t v10 = [v5 name];
    [v9 addObject:v10];
  }
}

+ (void)defaultStateExitTransitionActionForState:(id)a3 onEvent:(id)a4
{
  id v11 = a3;
  id v5 = [a4 name];
  id v6 = [v11 name];
  id v7 = CMContinuityCaptureSMGetMatchingStateEntryEventForExitEvent(v5, v6);

  if (v7)
  {
    uint64_t v8 = [v11 pendingEvents];
    int v9 = [v8 containsObject:v7];

    if (v9)
    {
      uint64_t v10 = [v11 pendingEvents];
      [v10 removeObject:v7];
    }
  }
}

+ (BOOL)defaultStateExitGuard:(id)a3 dstState:(id)a4 onEvent:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  uint64_t v8 = [v7 name];
  int v9 = [v6 name];
  int valid = CMContinuityCaptureSMIsValidExitEventForState(v8, v9);

  id v11 = [v7 name];

  id v12 = [v6 name];
  id v13 = CMContinuityCaptureSMGetMatchingStateEntryEventForExitEvent(v11, v12);

  char v14 = 0;
  if (valid && v13)
  {
    id v15 = [v6 pendingEvents];
    if ([v15 count] == 1)
    {
      uint64_t v16 = [v6 pendingEvents];
      char v14 = [v16 containsObject:v13];
    }
    else
    {
      char v14 = 0;
    }
  }
  return v14;
}

- (void)unconditionalTransitionForState:(id)a3 andDeferringEvent:(id)a4
{
  id v6 = a4;
  id v7 = [a3 pendingEvents];
  [v7 removeAllObjects];

  id v8 = [(CMContinuityCaptureStateMachine *)self->_stateMachine deferredEvents];
  [v8 addObject:v6];
}

- (void)stateMachineNotifyComplete:(id)a3
{
}

- (void)streamStateMachineNotifyComplete:(id)a3
{
}

- (void)stateMachineClearDeferredEvents
{
  id v2 = [(CMContinuityCaptureStateMachine *)self->_stateMachine deferredEvents];
  [v2 removeAllObjects];
}

- (void)startStreamCompletedWithError:(id)a3
{
  pendingCompletionBlocks = self->_pendingCompletionBlocks;
  id v5 = a3;
  if (![(NSMutableArray *)pendingCompletionBlocks count]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"%@ ContinuityCapture error : Invalid completion block array", self format];
  }
  id v6 = [(NSMutableArray *)self->_pendingCompletionBlocks firstObject];
  ((void (**)(void, id))v6)[2](v6, v5);

  id v7 = self->_pendingCompletionBlocks;
  [(NSMutableArray *)v7 removeObjectAtIndex:0];
}

- (BOOL)activeConnection
{
  id v2 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
  id v3 = [v2 activeStreams];

  LOBYTE(v2) = [v3 count] != 0;
  return (char)v2;
}

- (void)setStreamStateTimeout:(BOOL)a3 forTime:(unsigned int)a4
{
  BOOL v5 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (v5)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __63__CMContinuityCaptureDeviceBase_setStreamStateTimeout_forTime___block_invoke;
    v12[3] = &unk_264C990F8;
    objc_copyWeak(&v13, &location);
    dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v12);
    id streamTimeoutBlock = self->_streamTimeoutBlock;
    self->_id streamTimeoutBlock = v7;

    dispatch_time_t v9 = dispatch_time(0, 1000000000 * a4);
    dispatch_after(v9, (dispatch_queue_t)self->_queue, self->_streamTimeoutBlock);
    objc_destroyWeak(&v13);
  }
  else
  {
    id v10 = self->_streamTimeoutBlock;
    if (v10)
    {
      dispatch_block_cancel(v10);
      id v11 = self->_streamTimeoutBlock;
      self->_id streamTimeoutBlock = 0;
    }
  }
  objc_destroyWeak(&location);
}

void __63__CMContinuityCaptureDeviceBase_setStreamStateTimeout_forTime___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[8] enqueueEventWithNameToPostOnCurrentQueue:@"kCMContinuityCaptureStreamActionEventTimeout" data:0];
    id WeakRetained = v2;
  }
}

- (void)logStreamSessionSummary
{
  v64[7] = *MEMORY[0x263EF8340];
  if ((unint64_t)[(NSMutableArray *)self->_streamSessionLogs count] >= 0xB) {
    [(NSMutableArray *)self->_streamSessionLogs removeObjectAtIndex:0];
  }
  v63[0] = @"StreamSessionStartTime";
  lastStreamStartTime = self->_lastStreamStartTime;
  id v40 = lastStreamStartTime;
  if (lastStreamStartTime)
  {
    CMContinuityCaptureGetTimeStringFromDate(lastStreamStartTime);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = &stru_26E95AB60;
  }
  id v35 = v4;
  v64[0] = v4;
  v63[1] = @"StreamSessionTransport";
  BOOL v5 = (void *)0x263F08000;
  id v6 = NSNumber;
  id v38 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
  int v36 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v38, "wired"));
  v64[1] = v36;
  v63[2] = @"StreamSessionStopTime";
  dispatch_block_t v7 = CMContinuityCaptureGetCurrentTimeString();
  v64[2] = v7;
  v63[3] = @"GID";
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[CMContinuityCaptureConfiguration generationID](self->_activeConfiguration, "generationID"));
  v64[3] = v8;
  v63[4] = @"StreamSessionFirstFrameDispatchTime";
  lastStreamFirstFrameDispatchTime = self->_lastStreamFirstFrameDispatchTime;
  if (lastStreamFirstFrameDispatchTime)
  {
    CMContinuityCaptureGetTimeStringFromDate(self->_lastStreamFirstFrameDispatchTime);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = &stru_26E95AB60;
  }
  v64[4] = v10;
  v63[5] = @"StreamSessionTotalFrameDispatched";
  id v11 = [NSNumber numberWithUnsignedLongLong:self->_lastStreamNoOfFramesDispatched];
  v64[5] = v11;
  v63[6] = @"StreamSessionID";
  id v12 = [(CMContinuityCaptureConfiguration *)self->_activeConfiguration sessionID];
  id v13 = [v12 UUIDString];
  if (v13)
  {
    BOOL v5 = [(CMContinuityCaptureConfiguration *)self->_activeConfiguration sessionID];
    char v14 = [v5 UUIDString];
  }
  else
  {
    char v14 = @"NA";
  }
  v64[6] = v14;
  v42 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:7];
  if (v13)
  {
  }
  if (lastStreamFirstFrameDispatchTime) {

  }
  id v15 = v42;
  if (v40) {

  }
  [(NSMutableArray *)self->_streamSessionLogs addObject:v42];
  uint64_t v16 = [MEMORY[0x263EFF910] date];
  [v16 timeIntervalSinceDate:self->_lastStreamFirstFrameDispatchTime];
  double v18 = v17;

  BOOL v19 = self->_lastStreamFirstFrameDispatchTime;
  double v20 = 0.0;
  if (v19 && self->_lastStreamStartTime)
  {
    -[NSDate timeIntervalSinceDate:](v19, "timeIntervalSinceDate:");
    double v20 = fmax(v21, 0.0);
  }
  unint64_t lastStreamNoOfFramesDispatched = self->_lastStreamNoOfFramesDispatched;
  int v23 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    double v24 = 1.0;
    if (v18 >= 1.0) {
      double v24 = v18;
    }
    float v25 = (double)lastStreamNoOfFramesDispatched / v24;
    id v41 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
    uint64_t v37 = [v41 lastSessionID];
    v39 = [v42 objectForKeyedSubscript:@"StreamSessionStartTime"];
    int v26 = [v42 objectForKeyedSubscript:@"StreamSessionStopTime"];
    unint64_t v27 = self->_lastStreamNoOfFramesDispatched;
    id v28 = [v42 objectForKeyedSubscript:@"StreamSessionFirstFrameDispatchTime"];
    double v29 = v25;
    unint64_t lastStreamNoOfHighLatencyFrames = self->_lastStreamNoOfHighLatencyFrames;
    p_compositeDelegate = &self->_compositeDelegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_compositeDelegate);
    __int16 v33 = [WeakRetained currentSessionActivationStartTime];
    if (v33)
    {
      id v35 = objc_loadWeakRetained((id *)&self->_compositeDelegate);
      p_compositeDelegate = [v35 currentSessionActivationStartTime];
      CMContinuityCaptureGetTimeStringFromDate(p_compositeDelegate);
      int64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int64_t v34 = &stru_26E95AB60;
    }
    *(_DWORD *)buf = 138545666;
    v44 = self;
    __int16 v45 = 2048;
    uint64_t v46 = v37;
    __int16 v47 = 2114;
    __int16 v48 = v39;
    __int16 v49 = 2114;
    __int16 v50 = v26;
    __int16 v51 = 2048;
    unint64_t v52 = v27;
    __int16 v53 = 2114;
    v54 = v28;
    __int16 v55 = 2048;
    double v56 = v29;
    __int16 v57 = 2048;
    unint64_t v58 = lastStreamNoOfHighLatencyFrames;
    __int16 v59 = 2048;
    double v60 = v20;
    __int16 v61 = 2114;
    v62 = v34;
    _os_log_impl(&dword_235FC2000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Stream stop requested, summary : StartTime %{public}@ StopTime %{public}@ #ofFramesDispatched %llu FirstFrameDispatchTime %{public}@ FrameRate %.3f fps #ofHighLatencyFrames %lld timeToFirstFrame %.3f currentSessionActivationStartTime %{public}@", buf, 0x66u);
    if (v33)
    {
    }
    id v15 = v42;
  }
}

- (void)setupStreamActionStateMachine
{
  v72[5] = *MEMORY[0x263EF8340];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = [[CMContinuityCaptureStateMachine alloc] initWithActionDelegate:self queue:self->_queue];
  streamActionStateMachine = self->_streamActionStateMachine;
  self->_streamActionStateMachine = v3;

  BOOL v5 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureStreamActionEventSendData" isEntry:1 eventAction:0];
  id v6 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureStreamActionEventReceivedData" isEntry:0 eventAction:0];
  dispatch_block_t v7 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureStreamActionEventCaptureStarting" isEntry:1 eventAction:0];
  id v8 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureStreamActionEventCaptureStarted" isEntry:0 eventAction:0];
  dispatch_time_t v9 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureStreamActionEventTimeout" isEntry:0 eventAction:0];
  id v10 = self->_streamActionStateMachine;
  v72[0] = v5;
  v72[1] = v6;
  v72[2] = v9;
  v72[3] = v8;
  v72[4] = v7;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:5];
  [(CMContinuityCaptureStateMachine *)v10 addEvents:v11];
  id v38 = v9;

  id v41 = [[CMContinuityCaptureState alloc] initWithAttributes:@"kCMContinuityCaptureStreamStateReady" entryAction:&__block_literal_global_92 exitAction:&__block_literal_global_94_0];
  id v12 = [CMContinuityCaptureState alloc];
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_3;
  v68[3] = &unk_264C99B88;
  objc_copyWeak(&v69, &location);
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_4;
  v66[3] = &unk_264C99B88;
  objc_copyWeak(&v67, &location);
  id v13 = [(CMContinuityCaptureState *)v12 initWithAttributes:@"kCMContinuityCaptureStreamStateWait" entryAction:v68 exitAction:v66];
  char v14 = [CMContinuityCaptureStateTransition alloc];
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_5;
  v62[3] = &unk_264C99BB0;
  id v15 = v13;
  v63 = v15;
  v39 = v5;
  v64 = v39;
  objc_copyWeak(&v65, &location);
  id v35 = [(CMContinuityCaptureStateTransition *)v14 initWithAttributes:v41 dstState:v15 event:v39 guard:0 action:v62];
  uint64_t v16 = [CMContinuityCaptureStateTransition alloc];
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_7;
  v58[3] = &unk_264C99BB0;
  double v17 = v15;
  __int16 v59 = v17;
  double v18 = v6;
  double v60 = v18;
  objc_copyWeak(&v61, &location);
  int v36 = [(CMContinuityCaptureStateTransition *)v16 initWithAttributes:v17 dstState:v17 event:v18 guard:&__block_literal_global_98 action:v58];
  BOOL v19 = [CMContinuityCaptureStateTransition alloc];
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_8;
  v54[3] = &unk_264C99BB0;
  double v20 = v17;
  __int16 v55 = v20;
  int64_t v34 = v7;
  double v56 = v34;
  objc_copyWeak(&v57, &location);
  uint64_t v37 = [(CMContinuityCaptureStateTransition *)v19 initWithAttributes:v20 dstState:v20 event:v34 guard:0 action:v54];
  double v21 = [CMContinuityCaptureStateTransition alloc];
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_10;
  v50[3] = &unk_264C99BB0;
  __int16 v22 = v20;
  __int16 v51 = v22;
  id v40 = v8;
  unint64_t v52 = v40;
  objc_copyWeak(&v53, &location);
  int v23 = [(CMContinuityCaptureStateTransition *)v21 initWithAttributes:v22 dstState:v22 event:v40 guard:&__block_literal_global_100 action:v50];
  double v24 = [CMContinuityCaptureStateTransition alloc];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_12;
  v48[3] = &unk_264C99B88;
  objc_copyWeak(&v49, &location);
  float v25 = [(CMContinuityCaptureStateTransition *)v24 initWithAttributes:v22 dstState:v41 event:v40 guard:&__block_literal_global_102 action:v48];
  int v26 = [CMContinuityCaptureStateTransition alloc];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_14;
  v44[3] = &unk_264C99BB0;
  unint64_t v27 = v22;
  __int16 v45 = v27;
  __int16 v33 = v18;
  uint64_t v46 = v33;
  objc_copyWeak(&v47, &location);
  id v28 = [(CMContinuityCaptureStateTransition *)v26 initWithAttributes:v27 dstState:v41 event:v33 guard:&__block_literal_global_104 action:v44];
  double v29 = [CMContinuityCaptureStateTransition alloc];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  void v42[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_15;
  v42[3] = &unk_264C99B88;
  objc_copyWeak(&v43, &location);
  v30 = [(CMContinuityCaptureStateTransition *)v29 initWithAttributes:v27 dstState:v41 event:v9 guard:0 action:v42];
  id v31 = self->_streamActionStateMachine;
  v71[0] = v35;
  v71[1] = v36;
  v71[2] = v28;
  v71[3] = v23;
  v71[4] = v25;
  v71[5] = v30;
  v71[6] = v37;
  v71[7] = v23;
  int v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:8];
  [(CMContinuityCaptureStateMachine *)v31 addStateTransitions:v32];

  [(CMContinuityCaptureStateMachine *)self->_streamActionStateMachine setCurrentState:v41];
  objc_destroyWeak(&v43);

  objc_destroyWeak(&v47);
  objc_destroyWeak(&v49);

  objc_destroyWeak(&v53);
  objc_destroyWeak(&v57);

  objc_destroyWeak(&v61);
  objc_destroyWeak(&v65);

  objc_destroyWeak(&v67);
  objc_destroyWeak(&v69);

  objc_destroyWeak(&location);
}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setStreamStateTimeout:1 forTime:10];
}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setStreamStateTimeout:0 forTime:0];
}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_5(uint64_t a1, void *a2)
{
  id v12 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:*(void *)(a1 + 32) onEvent:*(void *)(a1 + 40)];
  id v3 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained(v3);
  BOOL v5 = [v12 data];
  [WeakRetained stateMachineStreamSubstateSendData:v5];

  id v6 = objc_loadWeakRetained(v3);
  dispatch_block_t v7 = [v12 data];
  id v8 = [v7 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyOption"];
  if (v8)
  {
    dispatch_time_t v9 = [v12 data];
    id v10 = [v9 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyOption"];
    objc_msgSend(v6, "startCameraCaptureStack:", objc_msgSend(v10, "integerValue"));
  }
  else
  {
    [v6 startCameraCaptureStack:0];
  }

  id v11 = objc_loadWeakRetained(v3);
  [v11 streamStateMachineNotifyComplete:0];
}

uint64_t __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:a2 dstState:a3 onEvent:a4] ^ 1;
}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = (id *)a1;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:v3 onEvent:v4];
  v2 += 6;
  id WeakRetained = objc_loadWeakRetained(v2);
  dispatch_block_t v7 = [v5 data];

  [WeakRetained stateMachineStreamSubstateReceiveData:v7];
  id v8 = objc_loadWeakRetained(v2);
  [v8 streamStateMachineNotifyComplete:0];
}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_8(uint64_t a1)
{
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:*(void *)(a1 + 32) onEvent:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained streamStateMachineNotifyComplete:0];
}

uint64_t __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:a2 dstState:a3 onEvent:a4] ^ 1;
}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_10(uint64_t a1)
{
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:*(void *)(a1 + 32) onEvent:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained streamStateMachineNotifyComplete:0];
}

BOOL __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:a2 dstState:a3 onEvent:a4];
}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_12(uint64_t a1)
{
  unsigned __int8 v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained startStreamCompletedWithError:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 streamStateMachineNotifyComplete:0];
}

BOOL __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:a2 dstState:a3 onEvent:a4];
}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = (id *)a1;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:v3 onEvent:v4];
  v2 += 6;
  id WeakRetained = objc_loadWeakRetained(v2);
  dispatch_block_t v7 = [v5 data];

  [WeakRetained stateMachineStreamSubstateReceiveData:v7];
  id v8 = objc_loadWeakRetained(v2);
  [v8 startStreamCompletedWithError:0];

  id v9 = objc_loadWeakRetained(v2);
  [v9 streamStateMachineNotifyComplete:0];
}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_15(uint64_t a1)
{
  unsigned __int8 v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-536870186 userInfo:0];
  [WeakRetained startStreamCompletedWithError:v3];

  id v4 = objc_loadWeakRetained(v1);
  [v4 streamStateMachineNotifyComplete:0];
}

- (void)setupStateMachine
{
  v327[28] = *MEMORY[0x263EF8340];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v3 = [[CMContinuityCaptureStateMachine alloc] initWithActionDelegate:self queue:self->_queue];
  stateMachine = self->_stateMachine;
  self->_stateMachine = v3;

  id v5 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventStartStream" isEntry:1 eventAction:0];
  v147 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventStopStream" isEntry:0 eventAction:0];
  v145 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventUserDisconnect" isEntry:0 eventAction:0];
  id v6 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventForceRestartStream" isEntry:1 eventAction:0];
  dispatch_block_t v7 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventStreamInterrupted" isEntry:1 eventAction:0];
  v157 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventCaptureSessionStarted" isEntry:1 eventAction:0];
  v150 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventCaptureSessionEnded" isEntry:0 eventAction:0];
  v164 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventSystemSleep" isEntry:1 eventAction:0];
  v173 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventSystemWake" isEntry:0 eventAction:0];
  id v8 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventAssociatedDevicePause" isEntry:1 eventAction:0];
  v160 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventAssociatedDeviceResume" isEntry:0 eventAction:0];
  v159 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventTerminate" isEntry:1 eventAction:0];
  id v9 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventUserPause" isEntry:1 eventAction:0];
  v152 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventUserResume" isEntry:0 eventAction:0];
  v165 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventStreamDisableForMultipleStream" isEntry:1 eventAction:0];
  v174 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventStreamEnableForMultipleStreamExit" isEntry:0 eventAction:0];
  id v10 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventImageCapture" isEntry:0 eventAction:0];
  id v11 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventEnqueueReactionEffect" isEntry:0 eventAction:0];
  id v12 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventStreamDisableForDeviceInUse" isEntry:1 eventAction:0];
  v143 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventStreamDisableForDeviceInUseExit" isEntry:0 eventAction:0];
  v154 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventActiveCallStart" isEntry:1 eventAction:0];
  v141 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventActiveCallEnd" isEntry:0 eventAction:0];
  v163 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventStreamDisableForWifiContention" isEntry:1 eventAction:0];
  v168 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventStreamEnableForWifiContentionExit" isEntry:0 eventAction:0];
  v162 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventScreenLocked" isEntry:1 eventAction:0];
  v172 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventScreenUnlocked" isEntry:0 eventAction:0];
  v170 = v5;
  v161 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventRemoteClientDisconnect" isEntry:1 eventAction:0];
  v166 = [[CMContinuityCaptureStateMachineEvent alloc] initWithName:@"kCMContinuityCaptureEventRemoteClientReconnect" isEntry:0 eventAction:0];
  id v13 = self->_stateMachine;
  v327[0] = v5;
  v327[1] = v147;
  v327[2] = v157;
  v327[3] = v7;
  v327[4] = v150;
  v327[5] = v164;
  v327[6] = v173;
  v327[7] = v159;
  v327[8] = v6;
  v327[9] = v9;
  v327[10] = v152;
  v327[11] = v163;
  v327[12] = v168;
  v327[13] = v8;
  v327[14] = v12;
  v327[15] = v143;
  v327[16] = v160;
  v327[17] = v165;
  v327[18] = v174;
  v327[19] = v10;
  v327[20] = v11;
  v327[21] = v145;
  v327[22] = v154;
  v327[23] = v141;
  v327[24] = v162;
  v327[25] = v172;
  v327[26] = v161;
  v327[27] = v166;
  char v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v327 count:28];
  [(CMContinuityCaptureStateMachine *)v13 addEvents:v14];
  v138 = v11;
  v139 = v10;
  v133 = v8;
  v135 = v7;
  v137 = v6;

  id v15 = [[CMContinuityCaptureState alloc] initWithAttributes:@"kCMContinuityCaptureStateInit" entryAction:0 exitAction:0];
  uint64_t v16 = [CMContinuityCaptureState alloc];
  v299[0] = MEMORY[0x263EF8330];
  v299[1] = 3221225472;
  v299[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke;
  v299[3] = &unk_264C99B88;
  objc_copyWeak(&v300, &location);
  v297[0] = MEMORY[0x263EF8330];
  v297[1] = 3221225472;
  v297[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_2;
  v297[3] = &unk_264C99B88;
  objc_copyWeak(&v298, &location);
  double v17 = [(CMContinuityCaptureState *)v16 initWithAttributes:@"kCMContinuityCaptureStateStreaming" entryAction:v299 exitAction:v297];
  v113 = [[CMContinuityCaptureState alloc] initWithAttributes:@"kCMContinuityCaptureStateDisabled" entryAction:0 exitAction:0];
  double v18 = [CMContinuityCaptureState alloc];
  v295[0] = MEMORY[0x263EF8330];
  v295[1] = 3221225472;
  v295[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_3;
  v295[3] = &unk_264C99B88;
  objc_copyWeak(&v296, &location);
  v293[0] = MEMORY[0x263EF8330];
  v293[1] = 3221225472;
  v293[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_4;
  v293[3] = &unk_264C99B88;
  objc_copyWeak(&v294, &location);
  BOOL v19 = [(CMContinuityCaptureState *)v18 initWithAttributes:@"kCMContinuityCaptureStatePaused" entryAction:v295 exitAction:v293];
  v149 = [[CMContinuityCaptureState alloc] initWithAttributes:@"kCMContinuityCaptureStateTerminated" entryAction:0 exitAction:0];
  double v20 = [CMContinuityCaptureStateTransition alloc];
  v290[1] = (id)MEMORY[0x263EF8330];
  v290[2] = (id)3221225472;
  v290[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_5;
  v290[4] = &unk_264C99BF8;
  double v21 = v19;
  v291 = v21;
  v292 = v9;
  v156 = v292;
  v124 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v20, "initWithAttributes:dstState:event:guard:action:", v17, v21);
  __int16 v22 = [CMContinuityCaptureStateTransition alloc];
  v289[1] = (id)MEMORY[0x263EF8330];
  v289[2] = (id)3221225472;
  v289[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_6;
  v289[4] = &unk_264C99C20;
  objc_copyWeak(v290, &location);
  v286[1] = (id)MEMORY[0x263EF8330];
  v286[2] = (id)3221225472;
  v286[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_7;
  v286[4] = &unk_264C99C48;
  objc_copyWeak(v289, &location);
  int v23 = v21;
  v287 = v23;
  v288 = v157;
  v136 = v288;
  v127 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v22, "initWithAttributes:dstState:event:guard:action:", v17, v23);
  double v24 = [CMContinuityCaptureStateTransition alloc];
  v285[1] = (id)MEMORY[0x263EF8330];
  v285[2] = (id)3221225472;
  v285[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_8;
  v285[4] = &unk_264C99C20;
  objc_copyWeak(v286, &location);
  uint64_t v279 = MEMORY[0x263EF8330];
  uint64_t v280 = 3221225472;
  v281 = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_9;
  v282 = &unk_264C99C48;
  objc_copyWeak(v285, &location);
  float v25 = v23;
  v283 = v25;
  v284 = v12;
  v140 = v284;
  v129 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v24, "initWithAttributes:dstState:event:guard:action:", v17, v25);
  int v26 = [CMContinuityCaptureStateTransition alloc];
  uint64_t v273 = MEMORY[0x263EF8330];
  uint64_t v274 = 3221225472;
  v275 = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_10;
  v276 = &unk_264C99BF8;
  unint64_t v27 = v25;
  v277 = v27;
  v278 = v154;
  v155 = v278;
  v131 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v26, "initWithAttributes:dstState:event:guard:action:", v17, v27);
  id v28 = [CMContinuityCaptureStateTransition alloc];
  v270[1] = (id)MEMORY[0x263EF8330];
  v270[2] = (id)3221225472;
  v270[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_12;
  v270[4] = &unk_264C99BF8;
  double v29 = v27;
  v271 = v29;
  v272 = v152;
  v153 = v272;
  v126 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v28, "initWithAttributes:dstState:event:guard:action:", v29, v17);
  v30 = [CMContinuityCaptureStateTransition alloc];
  v267[1] = (id)MEMORY[0x263EF8330];
  v267[2] = (id)3221225472;
  v267[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_14;
  v267[4] = &unk_264C99C48;
  objc_copyWeak(v270, &location);
  id v31 = v29;
  v268 = v31;
  v269 = v150;
  v134 = v269;
  v128 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v30, "initWithAttributes:dstState:event:guard:action:", v31, v17);
  int v32 = [CMContinuityCaptureStateTransition alloc];
  uint64_t v261 = MEMORY[0x263EF8330];
  uint64_t v262 = 3221225472;
  v263 = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_16;
  v264 = &unk_264C99C48;
  objc_copyWeak(v267, &location);
  __int16 v33 = v31;
  v265 = v33;
  v266 = v143;
  v144 = v266;
  v130 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v32, "initWithAttributes:dstState:event:guard:action:", v33, v17);
  int64_t v34 = [CMContinuityCaptureStateTransition alloc];
  v258[1] = (id)MEMORY[0x263EF8330];
  v258[2] = (id)3221225472;
  v258[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_18;
  v258[4] = &unk_264C99BF8;
  id v35 = v33;
  id v259 = v35;
  v260 = v141;
  v151 = v260;
  v132 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v34, "initWithAttributes:dstState:event:guard:action:", v35, v17);
  int v36 = [CMContinuityCaptureStateTransition alloc];
  v255[1] = (id)MEMORY[0x263EF8330];
  v255[2] = (id)3221225472;
  v255[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_19;
  v255[4] = &unk_264C99C48;
  objc_copyWeak(v258, &location);
  id v37 = v35;
  id v256 = v37;
  v257 = v147;
  v158 = v257;
  v142 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v36, "initWithAttributes:dstState:event:guard:action:", v37, v17);
  id v38 = [CMContinuityCaptureStateTransition alloc];
  v254[0] = MEMORY[0x263EF8330];
  v254[1] = 3221225472;
  v254[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_20;
  v254[3] = &unk_264C99B88;
  objc_copyWeak(v255, &location);
  v125 = [(CMContinuityCaptureStateTransition *)v38 initWithAttributes:v37 dstState:v37 event:v170 guard:0 action:v254];
  v39 = [CMContinuityCaptureStateTransition alloc];
  v250[1] = (id)MEMORY[0x263EF8330];
  v250[2] = (id)3221225472;
  v250[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_21;
  v250[4] = &unk_264C99C48;
  objc_copyWeak(&v253, &location);
  id v40 = v37;
  id v251 = v40;
  v252 = v145;
  v148 = v252;
  v146 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v39, "initWithAttributes:dstState:event:guard:action:", v40, v17);
  v326[0] = v156;
  v326[1] = v155;
  v326[2] = v136;
  v326[3] = v140;
  id v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v326 count:4];
  v248[0] = MEMORY[0x263EF8330];
  v248[1] = 3221225472;
  v248[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_22;
  v248[3] = &unk_264C99C70;
  id v42 = v40;
  id v249 = v42;
  objc_copyWeak(v250, &location);
  v123 = CMContinuityCaptureSMCreateTransitionsFromStateToDestinationOnEvents(v42, v42, v41, v248, 0);

  v325[0] = v153;
  v325[1] = v151;
  v325[2] = v134;
  v325[3] = v144;
  id v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v325 count:4];
  v245[0] = MEMORY[0x263EF8330];
  v245[1] = 3221225472;
  v245[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_23;
  v245[3] = &unk_264C99C70;
  id v246 = v42;
  objc_copyWeak(&v247, &location);
  v243[0] = MEMORY[0x263EF8330];
  v243[1] = 3221225472;
  v243[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_24;
  v243[3] = &unk_264C99C98;
  id v44 = v246;
  id v244 = v44;
  v122 = CMContinuityCaptureSMCreateTransitionsFromStateToDestinationOnEvents(v44, v44, v43, v245, v243);

  __int16 v45 = [CMContinuityCaptureStateTransition alloc];
  v241[0] = MEMORY[0x263EF8330];
  v241[1] = 3221225472;
  v241[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_25;
  v241[3] = &unk_264C99C20;
  objc_copyWeak(&v242, &location);
  v121 = [(CMContinuityCaptureStateTransition *)v45 initWithAttributes:v15 dstState:v17 event:v170 guard:v241 action:0];
  v120 = [[CMContinuityCaptureStateTransition alloc] initWithAttributes:v17 dstState:v15 event:v158 guard:0 action:0];
  v119 = [[CMContinuityCaptureStateTransition alloc] initWithAttributes:v17 dstState:v15 event:v148 guard:0 action:0];
  uint64_t v46 = [CMContinuityCaptureStateTransition alloc];
  v239[0] = MEMORY[0x263EF8330];
  v239[1] = 3221225472;
  v239[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_26;
  v239[3] = &unk_264C99B88;
  objc_copyWeak(&v240, &location);
  v118 = [(CMContinuityCaptureStateTransition *)v46 initWithAttributes:v17 dstState:v17 event:v137 guard:0 action:v239];
  id v47 = [CMContinuityCaptureStateTransition alloc];
  v237[0] = MEMORY[0x263EF8330];
  v237[1] = 3221225472;
  v237[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_27;
  v237[3] = &unk_264C99B88;
  objc_copyWeak(&v238, &location);
  v117 = [(CMContinuityCaptureStateTransition *)v47 initWithAttributes:v17 dstState:v17 event:v7 guard:0 action:v237];
  __int16 v48 = [CMContinuityCaptureStateTransition alloc];
  v235[0] = MEMORY[0x263EF8330];
  v235[1] = 3221225472;
  v235[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_28;
  v235[3] = &unk_264C99B88;
  objc_copyWeak(&v236, &location);
  v116 = [(CMContinuityCaptureStateTransition *)v48 initWithAttributes:v17 dstState:v17 event:v139 guard:0 action:v235];
  id v49 = [CMContinuityCaptureStateTransition alloc];
  v233[0] = MEMORY[0x263EF8330];
  v233[1] = 3221225472;
  v233[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_29;
  v233[3] = &unk_264C99B88;
  objc_copyWeak(&v234, &location);
  v115 = [(CMContinuityCaptureStateTransition *)v49 initWithAttributes:v17 dstState:v17 event:v138 guard:0 action:v233];
  v324[0] = v173;
  v324[1] = v174;
  v324[2] = v168;
  v324[3] = v172;
  v324[4] = v166;
  __int16 v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v324 count:5];
  v230[0] = MEMORY[0x263EF8330];
  v230[1] = 3221225472;
  v230[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_30;
  v230[3] = &unk_264C99C70;
  __int16 v51 = v113;
  v231 = v51;
  objc_copyWeak(&v232, &location);
  v228[0] = MEMORY[0x263EF8330];
  v228[1] = 3221225472;
  v228[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_31;
  v228[3] = &unk_264C99C20;
  objc_copyWeak(&v229, &location);
  v114 = CMContinuityCaptureSMCreateTransitionsFromStateToDestinationOnEvents(v51, v17, v50, v230, v228);

  v323[0] = v164;
  v323[1] = v165;
  v323[2] = v163;
  v323[3] = v162;
  v323[4] = v161;
  unint64_t v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v323 count:5];
  v225[0] = MEMORY[0x263EF8330];
  v225[1] = 3221225472;
  v225[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_32;
  v225[3] = &unk_264C99C70;
  id v53 = v51;
  v226 = v53;
  objc_copyWeak(&v227, &location);
  v112 = CMContinuityCaptureSMCreateTransitionsFromStateToDestinationOnEvents(v17, v53, v52, v225, 0);

  v322[0] = v15;
  v322[1] = v53;
  v322[2] = v44;
  v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v322 count:3];
  v222[0] = MEMORY[0x263EF8330];
  v222[1] = 3221225472;
  v222[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_33;
  v222[3] = &unk_264C99C70;
  __int16 v55 = v53;
  v223 = v55;
  objc_copyWeak(&v224, &location);
  v111 = CMContinuityCaptureSMCreateTransitionsFromStatesToDestination(v54, v55, v165, v222, 0);

  v321[0] = v15;
  v321[1] = v55;
  v321[2] = v44;
  double v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:v321 count:3];
  v219[0] = MEMORY[0x263EF8330];
  v219[1] = 3221225472;
  v219[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_34;
  v219[3] = &unk_264C99C70;
  id v57 = v55;
  v220 = v57;
  objc_copyWeak(&v221, &location);
  v110 = CMContinuityCaptureSMCreateTransitionsFromStatesToDestination(v56, v57, v163, v219, 0);

  v320[0] = v15;
  v320[1] = v57;
  v320[2] = v44;
  unint64_t v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v320 count:3];
  v216[0] = MEMORY[0x263EF8330];
  v216[1] = 3221225472;
  v216[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_35;
  v216[3] = &unk_264C99C70;
  __int16 v59 = v57;
  v217 = v59;
  objc_copyWeak(&v218, &location);
  v109 = CMContinuityCaptureSMCreateTransitionsFromStatesToDestination(v58, v59, v162, v216, 0);

  v319[0] = v15;
  v319[1] = v59;
  v319[2] = v44;
  double v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v319 count:3];
  v213[0] = MEMORY[0x263EF8330];
  v213[1] = 3221225472;
  v213[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_36;
  v213[3] = &unk_264C99C70;
  id v61 = v59;
  v214 = v61;
  objc_copyWeak(&v215, &location);
  v107 = CMContinuityCaptureSMCreateTransitionsFromStatesToDestination(v60, v61, v164, v213, 0);

  v318 = v61;
  v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v318 count:1];
  v210[0] = MEMORY[0x263EF8330];
  v210[1] = 3221225472;
  v210[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_37;
  v210[3] = &unk_264C99C70;
  v63 = v61;
  v211 = v63;
  objc_copyWeak(&v212, &location);
  v106 = CMContinuityCaptureSMCreateTransitionsFromStateToDestinations(v15, v62, v133, v210, 0);

  v317[0] = v15;
  v317[1] = v63;
  v317[2] = v44;
  v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:v317 count:3];
  v207[0] = MEMORY[0x263EF8330];
  v207[1] = 3221225472;
  v207[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_38;
  v207[3] = &unk_264C99C70;
  id v65 = v63;
  v208 = v65;
  objc_copyWeak(&v209, &location);
  v108 = CMContinuityCaptureSMCreateTransitionsFromStatesToDestination(v64, v65, v161, v207, 0);

  v316[0] = v15;
  v316[1] = v44;
  v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:v316 count:2];
  v204[0] = MEMORY[0x263EF8330];
  v204[1] = 3221225472;
  v204[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_39;
  v204[3] = &unk_264C99C70;
  id v67 = v65;
  id v205 = v67;
  objc_copyWeak(&v206, &location);
  v105 = CMContinuityCaptureSMCreateTransitionsFromStateToDestinations(v67, v66, v174, v204, &__block_literal_global_114);

  v315[0] = v15;
  v315[1] = v44;
  v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:v315 count:2];
  v201[0] = MEMORY[0x263EF8330];
  v201[1] = 3221225472;
  v201[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_41;
  v201[3] = &unk_264C99C70;
  id v69 = v67;
  id v202 = v69;
  objc_copyWeak(&v203, &location);
  v104 = CMContinuityCaptureSMCreateTransitionsFromStateToDestinations(v69, v68, v168, v201, &__block_literal_global_116);

  v314[0] = v15;
  v314[1] = v44;
  v70 = [MEMORY[0x263EFF8C0] arrayWithObjects:v314 count:2];
  v198[0] = MEMORY[0x263EF8330];
  v198[1] = 3221225472;
  v198[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_43;
  v198[3] = &unk_264C99C70;
  id v71 = v69;
  id v199 = v71;
  objc_copyWeak(&v200, &location);
  v103 = CMContinuityCaptureSMCreateTransitionsFromStateToDestinations(v71, v70, v172, v198, &__block_literal_global_118);

  v313[0] = v15;
  v313[1] = v44;
  v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:v313 count:2];
  v195[0] = MEMORY[0x263EF8330];
  v195[1] = 3221225472;
  v195[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_45;
  v195[3] = &unk_264C99C70;
  id v73 = v71;
  id v196 = v73;
  objc_copyWeak(&v197, &location);
  v102 = CMContinuityCaptureSMCreateTransitionsFromStateToDestinations(v73, v72, v173, v195, &__block_literal_global_120);

  v312[0] = v15;
  v312[1] = v44;
  v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:v312 count:2];
  v192[0] = MEMORY[0x263EF8330];
  v192[1] = 3221225472;
  v192[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_47;
  v192[3] = &unk_264C99C70;
  id v75 = v73;
  id v193 = v75;
  objc_copyWeak(&v194, &location);
  v101 = CMContinuityCaptureSMCreateTransitionsFromStateToDestinations(v75, v74, v166, v192, &__block_literal_global_122);

  v311 = v15;
  v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v311 count:1];
  v189[0] = MEMORY[0x263EF8330];
  v189[1] = 3221225472;
  v189[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_49;
  v189[3] = &unk_264C99C70;
  id v77 = v75;
  id v190 = v77;
  objc_copyWeak(&v191, &location);
  v100 = CMContinuityCaptureSMCreateTransitionsFromStateToDestinations(v77, v76, v160, v189, &__block_literal_global_124);

  v310[0] = v173;
  v310[1] = v174;
  v310[2] = v168;
  v310[3] = v172;
  v310[4] = v166;
  v310[5] = v160;
  v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:v310 count:6];
  v184[0] = MEMORY[0x263EF8330];
  v184[1] = 3221225472;
  v184[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_51;
  v184[3] = &unk_264C99CC0;
  id v185 = v77;
  v98 = v166;
  v186 = v98;
  v97 = v168;
  v187 = v97;
  objc_copyWeak(&v188, &location);
  v182[0] = MEMORY[0x263EF8330];
  v182[1] = 3221225472;
  v182[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_52;
  v182[3] = &unk_264C99C98;
  id v79 = v185;
  id v183 = v79;
  v169 = CMContinuityCaptureSMCreateTransitionsFromStateToDestinationOnEvents(v79, v79, v78, v184, v182);

  v309[0] = v15;
  v309[1] = v79;
  v309[2] = v44;
  v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:v309 count:3];
  v180[0] = MEMORY[0x263EF8330];
  v180[1] = 3221225472;
  v180[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_53;
  v180[3] = &unk_264C99B88;
  objc_copyWeak(&v181, &location);
  v167 = CMContinuityCaptureSMCreateTransitionsFromStatesToDestination(v80, v149, v159, v180, 0);

  v308 = v17;
  v81 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v308 count:1];
  v82 = CMContinuityCaptureSMCreateTransitionsFromStatesToDestination(v81, v149, v159, 0, 0);

  v307[0] = v158;
  v307[1] = v170;
  v307[2] = v156;
  v307[3] = v153;
  v307[4] = v155;
  v307[5] = v151;
  v83 = [MEMORY[0x263EFF8C0] arrayWithObjects:v307 count:6];
  v84 = self->_stateMachine;
  v175[0] = MEMORY[0x263EF8330];
  v175[1] = 3221225472;
  v175[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_54;
  v175[3] = &unk_264C99CE8;
  id v99 = v79;
  id v176 = v99;
  v85 = v170;
  v177 = v85;
  objc_copyWeak(&v179, &location);
  v171 = v158;
  v178 = v171;
  v86 = CMContinuityCaptureSMDeferEventsInState(v83, v99, v84, v175);

  v87 = self->_stateMachine;
  v306[0] = v124;
  v306[1] = v131;
  v306[2] = v127;
  v306[3] = v129;
  v88 = [MEMORY[0x263EFF8C0] arrayWithObjects:v306 count:4];
  [(CMContinuityCaptureStateMachine *)v87 addStateTransitions:v88];

  v89 = self->_stateMachine;
  v305[0] = v126;
  v305[1] = v132;
  v305[2] = v142;
  v305[3] = v128;
  v305[4] = v130;
  v90 = [MEMORY[0x263EFF8C0] arrayWithObjects:v305 count:5];
  [(CMContinuityCaptureStateMachine *)v89 addStateTransitions:v90];

  v91 = self->_stateMachine;
  v304[0] = v125;
  v304[1] = v146;
  v92 = [MEMORY[0x263EFF8C0] arrayWithObjects:v304 count:2];
  [(CMContinuityCaptureStateMachine *)v91 addStateTransitions:v92];

  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v123];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v122];
  v93 = self->_stateMachine;
  v303[0] = v121;
  v303[1] = v120;
  v303[2] = v119;
  v303[3] = v118;
  v94 = [MEMORY[0x263EFF8C0] arrayWithObjects:v303 count:4];
  [(CMContinuityCaptureStateMachine *)v93 addStateTransitions:v94];

  v95 = self->_stateMachine;
  v302[0] = v117;
  v302[1] = v116;
  v302[2] = v115;
  v96 = [MEMORY[0x263EFF8C0] arrayWithObjects:v302 count:3];
  [(CMContinuityCaptureStateMachine *)v95 addStateTransitions:v96];

  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v114];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v112];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v108];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v111];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v110];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v109];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v107];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v106];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v105];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v104];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v103];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v102];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v101];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v100];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v169];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v167];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v82];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine addStateTransitions:v86];
  [(CMContinuityCaptureStateMachine *)self->_stateMachine setCurrentState:v15];

  objc_destroyWeak(&v179);
  objc_destroyWeak(&v181);

  objc_destroyWeak(&v188);
  objc_destroyWeak(&v191);

  objc_destroyWeak(&v194);
  objc_destroyWeak(&v197);

  objc_destroyWeak(&v200);
  objc_destroyWeak(&v203);

  objc_destroyWeak(&v206);
  objc_destroyWeak(&v209);

  objc_destroyWeak(&v212);
  objc_destroyWeak(&v215);

  objc_destroyWeak(&v218);
  objc_destroyWeak(&v221);

  objc_destroyWeak(&v224);
  objc_destroyWeak(&v227);

  objc_destroyWeak(&v229);
  objc_destroyWeak(&v232);

  objc_destroyWeak(&v234);
  objc_destroyWeak(&v236);

  objc_destroyWeak(&v238);
  objc_destroyWeak(&v240);

  objc_destroyWeak(&v242);
  objc_destroyWeak(&v247);

  objc_destroyWeak(v250);
  objc_destroyWeak(&v253);

  objc_destroyWeak(v255);
  objc_destroyWeak(v258);

  objc_destroyWeak(v267);
  objc_destroyWeak(v270);

  objc_destroyWeak(v285);
  objc_destroyWeak(v286);

  objc_destroyWeak(v289);
  objc_destroyWeak(v290);

  objc_destroyWeak(&v294);
  objc_destroyWeak(&v296);

  objc_destroyWeak(&v298);
  objc_destroyWeak(&v300);

  objc_destroyWeak(&location);
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:1 forEvent:v3 option:0];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:2 forEvent:v3 option:0];

  id v5 = objc_loadWeakRetained(v2);
  [v5 setStreamStateTimeout:1 forTime:0];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:8 forEvent:v3 option:0];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:9 forEvent:v3 option:0];
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_5(uint64_t a1)
{
  return +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:*(void *)(a1 + 32) onEvent:*(void *)(a1 + 40)];
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained activeConnection] ^ 1;

  return v2;
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained scheduleDeviceBusyNotification:1];

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:v3 onEvent:v4];
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained activeConnection] ^ 1;

  return v2;
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained scheduleDeviceBusyNotification:1];

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:v3 onEvent:v4];
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_10(uint64_t a1)
{
  return +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:*(void *)(a1 + 32) onEvent:*(void *)(a1 + 40)];
}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:a2 dstState:a3 onEvent:a4];
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_12(uint64_t a1)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:*(void *)(a1 + 32) onEvent:*(void *)(a1 + 40)];
}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:a2 dstState:a3 onEvent:a4];
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained scheduleDeviceBusyNotification:0];

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:v3 onEvent:v4];
}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:a2 dstState:a3 onEvent:a4];
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_16(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained scheduleDeviceBusyNotification:0];

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:v3 onEvent:v4];
}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:a2 dstState:a3 onEvent:a4];
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_18(uint64_t a1)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:*(void *)(a1 + 32) onEvent:*(void *)(a1 + 40)];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_19(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained scheduleDeviceBusyNotification:0];

  id v4 = objc_loadWeakRetained(v2);
  [v4 unconditionalTransitionForState:*(void *)(a1 + 32) andDeferringEvent:*(void *)(a1 + 40)];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_20(uint64_t a1)
{
  unsigned __int8 v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stateMachineClearDeferredEvents];

  id v3 = objc_loadWeakRetained(v1);
  [v3 stateMachineNotifyComplete:0];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_21(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained scheduleDeviceBusyNotification:0];

  id v4 = objc_loadWeakRetained(v2);
  [v4 unconditionalTransitionForState:*(void *)(a1 + 32) andDeferringEvent:*(void *)(a1 + 40)];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_22(uint64_t a1, void *a2)
{
  id v8 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:*(void *)(a1 + 32) onEvent:v8];
  id v3 = [v8 name];
  if ([v3 isEqualToString:@"kCMContinuityCaptureEventCaptureSessionStarted"])
  {
  }
  else
  {
    id v4 = [v8 name];
    int v5 = [v4 isEqualToString:@"kCMContinuityCaptureEventStreamDisableForDeviceInUse"];

    if (!v5) {
      goto LABEL_5;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained scheduleDeviceBusyNotification:1];

LABEL_5:
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  [v7 stateMachineNotifyComplete:0];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_23(uint64_t a1, void *a2)
{
  id v8 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:*(void *)(a1 + 32) onEvent:v8];
  id v3 = [v8 name];
  if ([v3 isEqualToString:@"kCMContinuityCaptureEventCaptureSessionStarted"])
  {
  }
  else
  {
    id v4 = [v8 name];
    int v5 = [v4 isEqualToString:@"kCMContinuityCaptureEventStreamDisableForDeviceInUse"];

    if (!v5) {
      goto LABEL_5;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained scheduleDeviceBusyNotification:0];

LABEL_5:
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  [v7 stateMachineNotifyComplete:0];
}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_24(uint64_t a1)
{
  unsigned __int8 v1 = [*(id *)(a1 + 32) pendingEvents];
  BOOL v2 = (unint64_t)[v1 count] > 1;

  return v2;
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = [v5 name];

  uint64_t v8 = [WeakRetained postActionGuardOfType:1 forEventName:v7 option:0];
  return v8;
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_26(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:3 forEvent:v3 option:0];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_27(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:3 forEvent:v3 option:0];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_28(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:4 forEvent:v3 option:0];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_29(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:5 forEvent:v3 option:0];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:v3 onEvent:v4];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained postActionOfType:7 forEvent:v4 option:64];
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_31(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (+[CMContinuityCaptureDeviceBase defaultStateExitGuard:a2 dstState:a3 onEvent:v7])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v9 = [v7 name];
    uint64_t v10 = [WeakRetained postActionGuardOfType:1 forEventName:v9 option:64];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:v3 onEvent:v4];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained postActionOfType:6 forEvent:v4 option:2];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_33(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)a1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:v3 onEvent:v4];
  v2 += 5;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:6 forEvent:v4 option:0];

  id v6 = objc_loadWeakRetained(v2);
  [v6 stateMachineNotifyComplete:0];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_34(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)a1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:v3 onEvent:v4];
  v2 += 5;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:6 forEvent:v4 option:0];

  id v6 = objc_loadWeakRetained(v2);
  [v6 stateMachineNotifyComplete:0];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_35(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)a1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:v3 onEvent:v4];
  v2 += 5;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:6 forEvent:v4 option:0];

  id v6 = objc_loadWeakRetained(v2);
  [v6 stateMachineNotifyComplete:0];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_36(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)a1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:v3 onEvent:v4];
  v2 += 5;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:6 forEvent:v4 option:0];

  id v6 = objc_loadWeakRetained(v2);
  [v6 stateMachineNotifyComplete:0];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_37(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)a1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:v3 onEvent:v4];
  v2 += 5;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:6 forEvent:v4 option:0];

  id v6 = objc_loadWeakRetained(v2);
  [v6 stateMachineNotifyComplete:0];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_38(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)a1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:v3 onEvent:v4];
  v2 += 5;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:6 forEvent:v4 option:0];

  id v6 = objc_loadWeakRetained(v2);
  [v6 stateMachineNotifyComplete:0];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_39(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)a1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:v3 onEvent:v4];
  v2 += 5;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:7 forEvent:v4 option:0];

  id v6 = objc_loadWeakRetained(v2);
  [v6 stateMachineNotifyComplete:0];
}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:a2 dstState:a3 onEvent:a4];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_41(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)a1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:v3 onEvent:v4];
  v2 += 5;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:7 forEvent:v4 option:0];

  id v6 = objc_loadWeakRetained(v2);
  [v6 stateMachineNotifyComplete:0];
}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_42(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:a2 dstState:a3 onEvent:a4];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_43(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)a1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:v3 onEvent:v4];
  v2 += 5;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:7 forEvent:v4 option:0];

  id v6 = objc_loadWeakRetained(v2);
  [v6 stateMachineNotifyComplete:0];
}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:a2 dstState:a3 onEvent:a4];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_45(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)a1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:v3 onEvent:v4];
  v2 += 5;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:7 forEvent:v4 option:0];

  id v6 = objc_loadWeakRetained(v2);
  [v6 stateMachineNotifyComplete:0];
}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_46(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:a2 dstState:a3 onEvent:a4];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_47(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)a1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:v3 onEvent:v4];
  v2 += 5;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:7 forEvent:v4 option:0];

  id v6 = objc_loadWeakRetained(v2);
  [v6 stateMachineNotifyComplete:0];
}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:a2 dstState:a3 onEvent:a4];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_49(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)a1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:v3 onEvent:v4];
  v2 += 5;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:7 forEvent:v4 option:0];

  id v6 = objc_loadWeakRetained(v2);
  [v6 stateMachineNotifyComplete:0];
}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:a2 dstState:a3 onEvent:a4];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_51(uint64_t a1, void *a2)
{
  id v5 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:*(void *)(a1 + 32) onEvent:v5];
  if (*(id *)(a1 + 40) == v5 || *(id *)(a1 + 48) == v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 7);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 56));
  [v4 stateMachineNotifyComplete:0];
}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_52(uint64_t a1)
{
  unsigned __int8 v1 = [*(id *)(a1 + 32) pendingEvents];
  BOOL v2 = (unint64_t)[v1 count] > 1;

  return v2;
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_53(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained postActionOfType:10 forEvent:v3 option:0];
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_54(id *a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (a1[4] == v11)
  {
    if (a1[5] == v5)
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 7);
      id v7 = WeakRetained;
      uint64_t v8 = 6;
      id v9 = v5;
      uint64_t v10 = 2;
    }
    else
    {
      if (a1[6] != v5) {
        goto LABEL_7;
      }
      id WeakRetained = objc_loadWeakRetained(a1 + 7);
      id v7 = WeakRetained;
      uint64_t v8 = 7;
      id v9 = v5;
      uint64_t v10 = 64;
    }
    [WeakRetained postActionOfType:v8 forEvent:v9 option:v10];
  }
LABEL_7:
}

- (id)_aggregateStreamEventsInStreamState:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v6)
  {

    uint64_t v8 = 0;
    goto LABEL_27;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  char v9 = 0;
  uint64_t v10 = *(void *)v37;
  id v11 = @"kCMContinuityCaptureEventData";
  id v33 = v5;
  uint64_t v32 = *(void *)v37;
  do
  {
    uint64_t v12 = 0;
    uint64_t v34 = v7;
    do
    {
      if (*(void *)v37 != v10) {
        objc_enumerationMutation(v5);
      }
      id v13 = *(void **)(*((void *)&v36 + 1) + 8 * v12);
      if (v9)
      {
        [v35 addObject:*(void *)(*((void *)&v36 + 1) + 8 * v12)];
LABEL_8:
        char v9 = 1;
        goto LABEL_18;
      }
      char v14 = v11;
      id v15 = [*(id *)(*((void *)&v36 + 1) + 8 * v12) objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
      int v16 = [v15 isEqualToString:@"kCMContinuityCaptureEventStartStream"];

      if (v16)
      {
        id v11 = v14;
        if (v8)
        {
          double v17 = [v8 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
          double v18 = [v8 objectForKeyedSubscript:v14];
          BOOL v19 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:2 userInfo:0];
          [(CMContinuityCaptureDeviceBase *)self postActionCompletionForEventName:v17 eventData:v18 error:v19];

          id v11 = v14;
        }

        double v20 = [v13 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
        double v21 = [v13 objectForKeyedSubscript:v11];
        __int16 v22 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:2 userInfo:0];
        [(CMContinuityCaptureDeviceBase *)self postActionCompletionForEventName:v20 eventData:v21 error:v22];

        uint64_t v8 = 0;
        char v9 = 0;
      }
      else
      {
        int v23 = [v13 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
        int v24 = [v23 isEqualToString:@"kCMContinuityCaptureEventStopStream"];

        id v11 = v14;
        if (!v24)
        {
          id v5 = v33;
          uint64_t v7 = v34;
          uint64_t v10 = v32;
          if (v8) {
            [v35 addObject:v8];
          }

          [v35 addObject:v13];
          uint64_t v8 = 0;
          goto LABEL_8;
        }
        if (v8)
        {
          float v25 = [v8 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
          int v26 = [v8 objectForKeyedSubscript:v14];
          unint64_t v27 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:2 userInfo:0];
          [(CMContinuityCaptureDeviceBase *)self postActionCompletionForEventName:v25 eventData:v26 error:v27];

          id v11 = v14;
        }
        id v28 = v13;

        char v9 = 0;
        uint64_t v8 = v28;
      }
      id v5 = v33;
      uint64_t v7 = v34;
      uint64_t v10 = v32;
LABEL_18:
      ++v12;
    }
    while (v7 != v12);
    uint64_t v29 = [v5 countByEnumeratingWithState:&v36 objects:v40 count:16];
    uint64_t v7 = v29;
  }
  while (v29);

  if (v8)
  {
    v30 = v35;
    [v35 addObject:v8];
    goto LABEL_28;
  }
LABEL_27:
  v30 = v35;
LABEL_28:

  return v30;
}

- (id)_aggregateStreamEventsInInitState:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v7)
  {

    char v9 = 0;
    goto LABEL_32;
  }
  uint64_t v8 = v7;
  long long v37 = self;
  char v9 = 0;
  char v10 = 0;
  uint64_t v11 = *(void *)v42;
  id v38 = v6;
  long long v39 = v5;
  uint64_t v36 = *(void *)v42;
  do
  {
    uint64_t v12 = 0;
    uint64_t v40 = v8;
    do
    {
      if (*(void *)v42 != v11) {
        objc_enumerationMutation(v6);
      }
      id v13 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
      if (v10)
      {
        [v5 addObject:*(void *)(*((void *)&v41 + 1) + 8 * v12)];
        char v10 = 1;
        goto LABEL_23;
      }
      char v14 = [*(id *)(*((void *)&v41 + 1) + 8 * v12) objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
      int v15 = [v14 isEqualToString:@"kCMContinuityCaptureEventStartStream"];

      if (v15)
      {
        if (v9)
        {
          int v16 = [v9 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
          double v17 = [v9 objectForKeyedSubscript:@"kCMContinuityCaptureEventData"];
          double v18 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:2 userInfo:0];
          [(CMContinuityCaptureDeviceBase *)v37 postActionCompletionForEventName:v16 eventData:v17 error:v18];
        }
        id v19 = v13;

        char v10 = 0;
        char v9 = v19;
      }
      else
      {
        double v20 = [v13 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
        int v21 = [v20 isEqualToString:@"kCMContinuityCaptureEventStopStream"];

        if (v21)
        {
          if (v9)
          {
            __int16 v22 = [v9 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
            int v23 = [v9 objectForKeyedSubscript:@"kCMContinuityCaptureEventData"];
            int v24 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:2 userInfo:0];
            [(CMContinuityCaptureDeviceBase *)v37 postActionCompletionForEventName:v22 eventData:v23 error:v24];
          }
          float v25 = [v13 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
          int v26 = [v13 objectForKeyedSubscript:@"kCMContinuityCaptureEventData"];
          unint64_t v27 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:2 userInfo:0];
          [(CMContinuityCaptureDeviceBase *)v37 postActionCompletionForEventName:v25 eventData:v26 error:v27];

          char v9 = 0;
          char v10 = 0;
          id v5 = v39;
          id v6 = v38;
          uint64_t v11 = v36;
          goto LABEL_22;
        }
        id v28 = [v13 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
        if ([v28 isEqualToString:@"kCMContinuityCaptureEventForceRestartStream"])
        {
        }
        else
        {
          uint64_t v29 = [v13 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
          int v30 = [v29 isEqualToString:@"kCMContinuityCaptureEventStreamInterrupted"];

          if (!v30)
          {
            id v5 = v39;
            if (v9) {
              [v39 addObject:v9];
            }

            [v39 addObject:v13];
            char v9 = 0;
            char v10 = 1;
            goto LABEL_21;
          }
        }
        id v31 = [v13 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
        uint64_t v32 = [v13 objectForKeyedSubscript:@"kCMContinuityCaptureEventData"];
        id v33 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:2 userInfo:0];
        [(CMContinuityCaptureDeviceBase *)v37 postActionCompletionForEventName:v31 eventData:v32 error:v33];

        char v10 = 0;
      }
      id v5 = v39;
LABEL_21:
      id v6 = v38;
LABEL_22:
      uint64_t v8 = v40;
LABEL_23:
      ++v12;
    }
    while (v8 != v12);
    uint64_t v34 = [v6 countByEnumeratingWithState:&v41 objects:v45 count:16];
    uint64_t v8 = v34;
  }
  while (v34);

  if (v9) {
    [v5 addObject:v9];
  }
LABEL_32:

  return v5;
}

- (id)_aggregateEventPairInAnyState:(id)a3 entryEventName:(id)a4 exitEventName:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v29 = a4;
  id v28 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v27 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v11)
  {

    id v13 = 0;
    goto LABEL_22;
  }
  uint64_t v12 = v11;
  id v13 = 0;
  char v14 = 0;
  uint64_t v15 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v31 != v15) {
        objc_enumerationMutation(v10);
      }
      double v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      if (v14)
      {
        [v9 addObject:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        char v14 = 1;
        continue;
      }
      id v18 = v10;
      id v19 = [*(id *)(*((void *)&v30 + 1) + 8 * i) objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
      if ([v19 isEqualToString:v29])
      {

LABEL_11:
        if (v13)
        {
          __int16 v22 = [v13 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
          int v23 = [v13 objectForKeyedSubscript:@"kCMContinuityCaptureEventData"];
          int v24 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:2 userInfo:0];
          [(CMContinuityCaptureDeviceBase *)v27 postActionCompletionForEventName:v22 eventData:v23 error:v24];
        }
        id v25 = v17;

        char v14 = 0;
        id v13 = v25;
        id v10 = v18;
        continue;
      }
      double v20 = [v17 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
      int v21 = [v20 isEqualToString:v28];

      if (v21) {
        goto LABEL_11;
      }
      id v10 = v18;
      if (v13) {
        [v9 addObject:v13];
      }

      [v9 addObject:v17];
      id v13 = 0;
      char v14 = 1;
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
  }
  while (v12);

  if (v13) {
    [v9 addObject:v13];
  }
LABEL_22:

  return v9;
}

- (id)_aggregateEventDuplicatesInAnyState:(id)a3 eventName:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v24 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v23 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v9)
  {

    uint64_t v11 = 0;
    goto LABEL_21;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  char v12 = 0;
  uint64_t v13 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v26 != v13) {
        objc_enumerationMutation(v8);
      }
      uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      if (v12)
      {
        [v7 addObject:*(void *)(*((void *)&v25 + 1) + 8 * i)];
LABEL_15:
        char v12 = 1;
        continue;
      }
      int v16 = [*(id *)(*((void *)&v25 + 1) + 8 * i) objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
      int v17 = [v16 isEqualToString:v24];

      if (!v17)
      {
        if (v11) {
          [v7 addObject:v11];
        }

        [v7 addObject:v15];
        uint64_t v11 = 0;
        goto LABEL_15;
      }
      if (v11)
      {
        id v18 = [v11 objectForKeyedSubscript:@"kCMContinuityCaptureEventName"];
        id v19 = [v11 objectForKeyedSubscript:@"kCMContinuityCaptureEventData"];
        double v20 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:2 userInfo:0];
        [(CMContinuityCaptureDeviceBase *)v23 postActionCompletionForEventName:v18 eventData:v19 error:v20];
      }
      id v21 = v15;

      char v12 = 0;
      uint64_t v11 = v21;
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v10);

  if (v11) {
    [v7 addObject:v11];
  }
LABEL_21:

  return v7;
}

- (id)aggregateEvents:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v4 count])
  {
    id v5 = [(CMContinuityCaptureStateMachine *)self->_stateMachine currentState];
    id v6 = [v5 name];
    int v7 = [v6 isEqualToString:@"kCMContinuityCaptureStateInit"];

    if (v7)
    {
      uint64_t v8 = [(CMContinuityCaptureDeviceBase *)self _aggregateStreamEventsInInitState:v4];
    }
    else
    {
      uint64_t v10 = [(CMContinuityCaptureStateMachine *)self->_stateMachine currentState];
      uint64_t v11 = [v10 name];
      int v12 = [v11 isEqualToString:@"kCMContinuityCaptureStateStreaming"];

      if (v12)
      {
        uint64_t v8 = [(CMContinuityCaptureDeviceBase *)self _aggregateStreamEventsInStreamState:v4];
      }
      else
      {
        uint64_t v8 = [objc_alloc(MEMORY[0x263EFF980]) initWithArray:v4];
      }
    }
    uint64_t v13 = (void *)v8;
    char v14 = [(CMContinuityCaptureDeviceBase *)self _aggregateEventPairInAnyState:v8 entryEventName:@"kCMContinuityCaptureEventUserPause" exitEventName:@"kCMContinuityCaptureEventUserResume"];

    uint64_t v15 = [(CMContinuityCaptureDeviceBase *)self _aggregateEventPairInAnyState:v14 entryEventName:@"kCMContinuityCaptureEventActiveCallStart" exitEventName:@"kCMContinuityCaptureEventActiveCallEnd"];

    int v16 = [(CMContinuityCaptureDeviceBase *)self _aggregateEventDuplicatesInAnyState:v15 eventName:@"kCMContinuityCaptureEventStreamInterrupted"];

    id v9 = [(CMContinuityCaptureDeviceBase *)self _aggregateEventDuplicatesInAnyState:v16 eventName:@"kCMContinuityCaptureEventForceRestartStream"];
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

- (void)postDeferredEvent:(id)a3 data:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_compositeDelegate);
  if (WeakRetained)
  {
    id v9 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543874;
      uint64_t v11 = self;
      __int16 v12 = 2080;
      uint64_t v13 = "-[CMContinuityCaptureDeviceBase postDeferredEvent:data:]";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %s name:%{pubic}@", (uint8_t *)&v10, 0x20u);
    }

    objc_msgSend(WeakRetained, "postEvent:entity:data:", v6, -[CMContinuityCaptureDeviceBase entity](self, "entity"), v7);
  }
}

- (NSUUID)deviceID
{
  return 0;
}

- (int64_t)entity
{
  return [(CMContinuityCaptureDeviceCapabilities *)self->_capabilities entityType];
}

- (CMContinuityCaptureDeviceCapabilities)capabilities
{
  return self->_capabilities;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSArray)controls
{
  return 0;
}

- (BOOL)streaming
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_streaming);
  return v2 & 1;
}

- (id)debugInfo
{
  return 0;
}

- (CMContinuityCaptureCompositeDeviceDelegate)compositeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_compositeDelegate);
  return (CMContinuityCaptureCompositeDeviceDelegate *)WeakRetained;
}

- (AVCMediaStreamNegotiator)avcStreamNegotiator
{
  return self->_avcStreamNegotiator;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
  id v7 = [v6 deviceIdentifier];
  uint64_t v8 = [v3 stringWithFormat:@"%@: %@ entity:%u [%p]", v5, v7, self->_entity, self];

  return (NSString *)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidFrameTimeoutBlock, 0);
  objc_storeStrong(&self->_invalidFrameBlock, 0);
  objc_destroyWeak((id *)&self->_deviceStatusObserverDevice);
  objc_storeStrong((id *)&self->_transportStream, 0);
  objc_storeStrong((id *)&self->_transportDevice, 0);
  objc_storeStrong((id *)&self->_pendingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_avcStreamNegotiator, 0);
  objc_storeStrong((id *)&self->_lastStreamFirstFrameDispatchTime, 0);
  objc_storeStrong((id *)&self->_lastStreamStartTime, 0);
  objc_storeStrong(&self->_streamTimeoutBlock, 0);
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
  objc_storeStrong((id *)&self->_streamActionStateMachine, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_streamSessionLogs, 0);
  objc_destroyWeak((id *)&self->_compositeDelegate);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end