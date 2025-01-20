@interface PTChannelManager
+ (void)channelManagerWithDelegate:(id)delegate restorationDelegate:(id)restorationDelegate completionHandler:(void *)completionHandler;
- (BOOL)attemptingChannelRestoration;
- (BOOL)isWaitingForPushResult;
- (BOOL)stopTransmitRequestedWhileWaitingForPushResult;
- (CXCallController)callController;
- (CXChannelProvider)underlyingProvider;
- (NSMutableArray)pendingPushes;
- (NSUUID)activeChannelUUID;
- (NSUUID)suppressRejoinForRecentlyDisconnectedChannelUUID;
- (NSUUID)waitingForPushResultChannelUUID;
- (OS_dispatch_queue)callbackQueue;
- (PTChannelManagerDelegate)channelEventDelegate;
- (PTChannelRestorationDelegate)channelRestorationDelegate;
- (id)_initWithEventDelegate:(id)a3 restorationDelegate:(id)a4 instantiationCompletion:(id)a5;
- (id)instantiationCompletionBlock;
- (void)_appendPendingPushForUUID:(id)a3 payload:(id)a4 reply:(id)a5 isServiceUpdateMessage:(BOOL)a6 isHighPriority:(BOOL)a7 remainingHighPriorityBudget:(int64_t)a8;
- (void)_deliverChannelManagerInstanceToClientIfNeeded;
- (void)_deliverPendingPushes;
- (void)_ensureDelegateIsReadyToReceiveActions:(id)a3 joinReason:(int64_t)a4;
- (void)_handleLeaveCheckinResult:(id)a3;
- (void)_handlePushResult:(id)a3 pendingPush:(id)a4;
- (void)_performChannelRestorationAndUpdateChannelDescriptor:(id)a3 pushPayload:(id)a4;
- (void)_requestJoinChannelWithUUID:(id)a3 channelDescriptor:(id)a4 originator:(int64_t)a5 completion:(id)a6;
- (void)_setActiveRemoteParticipant:(id)a3 forChannelUUID:(id)a4 shouldReplaceOutgoingTransmission:(BOOL)a5 completionHandler:(id)a6;
- (void)leaveChannelWithUUID:(NSUUID *)channelUUID;
- (void)provider:(id)a3 didActivateAudioSession:(id)a4;
- (void)provider:(id)a3 didDeactivateAudioSession:(id)a4;
- (void)provider:(id)a3 didReceiveChannelPushToken:(id)a4;
- (void)provider:(id)a3 didReceiveCheckInResult:(int64_t)a4 channelUUID:(id)a5;
- (void)provider:(id)a3 didReceivePushPayload:(id)a4 channelUUID:(id)a5 reply:(id)a6 isServiceUpdateMessage:(BOOL)a7 isHighPriority:(BOOL)a8 remainingHighPriorityBudget:(int64_t)a9;
- (void)provider:(id)a3 performChannelJoinAction:(id)a4;
- (void)provider:(id)a3 performChannelLeaveAction:(id)a4;
- (void)provider:(id)a3 performChannelTransmitStartAction:(id)a4;
- (void)provider:(id)a3 performChannelTransmitStopAction:(id)a4;
- (void)providerDidBegin:(id)a3;
- (void)providerDidReset:(id)a3;
- (void)requestBeginTransmittingWithChannelUUID:(NSUUID *)channelUUID;
- (void)requestJoinChannelWithUUID:(NSUUID *)channelUUID descriptor:(PTChannelDescriptor *)descriptor;
- (void)setAccessoryButtonEventsEnabled:(BOOL)enabled forChannelUUID:(NSUUID *)channelUUID completionHandler:(void *)completionHandler;
- (void)setActiveRemoteParticipant:(PTParticipant *)participant forChannelUUID:(NSUUID *)channelUUID completionHandler:(void *)completionHandler;
- (void)setAttemptingChannelRestoration:(BOOL)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setChannelDescriptor:(PTChannelDescriptor *)channelDescriptor forChannelUUID:(NSUUID *)channelUUID completionHandler:(void *)completionHandler;
- (void)setChannelEventDelegate:(id)a3;
- (void)setChannelRestorationDelegate:(id)a3;
- (void)setInstantiationCompletionBlock:(id)a3;
- (void)setIsWaitingForPushResult:(BOOL)a3;
- (void)setPendingPushes:(id)a3;
- (void)setServiceStatus:(PTServiceStatus)status forChannelUUID:(NSUUID *)channelUUID completionHandler:(void *)completionHandler;
- (void)setStopTransmitRequestedWhileWaitingForPushResult:(BOOL)a3;
- (void)setSuppressRejoinForRecentlyDisconnectedChannelUUID:(id)a3;
- (void)setTransmissionMode:(PTTransmissionMode)transmissionMode forChannelUUID:(NSUUID *)channelUUID completionHandler:(void *)completionHandler;
- (void)setWaitingForPushResultChannelUUID:(id)a3;
- (void)stopTransmittingWithChannelUUID:(NSUUID *)channelUUID;
- (void)unregisterChannelPushToken;
@end

@implementation PTChannelManager

- (id)_initWithEventDelegate:(id)a3 restorationDelegate:(id)a4 instantiationCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PTChannelManager;
  v11 = [(PTChannelManager *)&v25 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263EFF980] array];
    v13 = (void *)*((void *)v11 + 9);
    *((void *)v11 + 9) = v12;

    uint64_t v14 = MEMORY[0x23ECA6F50](v10);
    v15 = (void *)*((void *)v11 + 8);
    *((void *)v11 + 8) = v14;

    id v16 = objc_alloc_init(MEMORY[0x263EFC8D8]);
    v17 = (void *)*((void *)v11 + 4);
    *((void *)v11 + 4) = v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.PTChannelManager.callbackqueue", v18);
    v20 = (void *)*((void *)v11 + 7);
    *((void *)v11 + 7) = v19;

    id v21 = objc_alloc_init(MEMORY[0x263EFC910]);
    uint64_t v22 = [objc_alloc(MEMORY[0x263EFC908]) initWithConfiguration:v21];
    v23 = (void *)*((void *)v11 + 3);
    *((void *)v11 + 3) = v22;

    objc_storeWeak((id *)v11 + 6, v8);
    objc_storeWeak((id *)v11 + 5, v9);
    [*((id *)v11 + 3) setDelegate:v11 queue:*((void *)v11 + 7)];
    *(_WORD *)(v11 + 9) = 0;
  }
  return v11;
}

+ (void)channelManagerWithDelegate:(id)delegate restorationDelegate:(id)restorationDelegate completionHandler:(void *)completionHandler
{
  id v7 = delegate;
  id v8 = restorationDelegate;
  id v9 = completionHandler;
  id v10 = _pttCheckIfErrorPreventingInstantiationExists();
  if (v10)
  {
    v9[2](v9, 0, v10);
  }
  else
  {
    v11 = PTDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239821000, v11, OS_LOG_TYPE_DEFAULT, "PTT requested channel manager instance", buf, 2u);
    }

    *(void *)buf = 0;
    v24 = buf;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __85__PTChannelManager_channelManagerWithDelegate_restorationDelegate_completionHandler___block_invoke;
    v18 = &unk_264DA96F8;
    id v19 = v7;
    id v20 = v8;
    uint64_t v12 = v9;
    id v21 = v12;
    uint64_t v22 = buf;
    if (channelManagerWithDelegate_restorationDelegate_completionHandler__onceToken != -1) {
      dispatch_once(&channelManagerWithDelegate_restorationDelegate_completionHandler__onceToken, &v15);
    }
    v13 = objc_msgSend((id)channelManagerWithDelegate_restorationDelegate_completionHandler__sharedInstance, "instantiationCompletionBlock", v15, v16, v17, v18);

    if (v13)
    {
      if (!v24[24])
      {
        uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.pushtotalk.instantiation" code:5 userInfo:0];
        v12[2](v12, 0, v14);
      }
    }
    else
    {
      v12[2](v12, channelManagerWithDelegate_restorationDelegate_completionHandler__sharedInstance, 0);
    }

    _Block_object_dispose(buf, 8);
  }
}

void __85__PTChannelManager_channelManagerWithDelegate_restorationDelegate_completionHandler___block_invoke(void *a1)
{
  id v2 = [[PTChannelManager alloc] _initWithEventDelegate:a1[4] restorationDelegate:a1[5] instantiationCompletion:a1[6]];
  v3 = (void *)channelManagerWithDelegate_restorationDelegate_completionHandler__sharedInstance;
  channelManagerWithDelegate_restorationDelegate_completionHandler__sharedInstance = (uint64_t)v2;

  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
}

- (void)requestBeginTransmittingWithChannelUUID:(NSUUID *)channelUUID
{
  v4 = channelUUID;
  v5 = (void *)[objc_alloc(MEMORY[0x263EFC918]) initWithChannelUUID:v4];
  [v5 setOriginator:2];
  callController = self->_callController;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__PTChannelManager_requestBeginTransmittingWithChannelUUID___block_invoke;
  v8[3] = &unk_264DA9748;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(CXCallController *)callController requestTransactionWithAction:v5 completion:v8];
}

void __60__PTChannelManager_requestBeginTransmittingWithChannelUUID___block_invoke(uint64_t a1, void *a2)
{
  v3 = _pttAttemptTranslateErrorFromCXError(a2);
  v4 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__PTChannelManager_requestBeginTransmittingWithChannelUUID___block_invoke_2;
  block[3] = &unk_264DA9720;
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __60__PTChannelManager_requestBeginTransmittingWithChannelUUID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = PTDefaultLog();
  uint64_t v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_239821000, v5, OS_LOG_TYPE_DEFAULT, "PTT transmission start request completed successfully, will be fulfilled soon", v14, 2u);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__PTChannelManager_requestBeginTransmittingWithChannelUUID___block_invoke_2_cold_1(v2, v5, v6, v7, v8, v9, v10, v11);
  }

  uint64_t v12 = [*(id *)(a1 + 40) channelEventDelegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    uint64_t v5 = [*(id *)(a1 + 40) channelEventDelegate];
    [v5 channelManager:*(void *)(a1 + 40) failedToBeginTransmittingInChannelWithUUID:*(void *)(a1 + 48) error:*(void *)(a1 + 32)];
LABEL_8:
  }
}

- (void)stopTransmittingWithChannelUUID:(NSUUID *)channelUUID
{
  v4 = channelUUID;
  if (self->_isWaitingForPushResult
    && (waitingForPushResultChannelUUID = self->_waitingForPushResultChannelUUID) != 0
    && [(NSUUID *)waitingForPushResultChannelUUID isEqual:v4])
  {
    uint64_t v6 = PTDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239821000, v6, OS_LOG_TYPE_DEFAULT, "Stop Transmit requested while waiting for a PTPushResult. The Stop Transmit action will be fulfilled after the PTPushResult is processed.", buf, 2u);
    }

    self->_stopTransmitRequestedWhileWaitingForPushResult = 1;
  }
  else
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFC920]) initWithChannelUUID:v4];
    [v7 setOriginator:2];
    callController = self->_callController;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__PTChannelManager_stopTransmittingWithChannelUUID___block_invoke;
    v9[3] = &unk_264DA9748;
    v9[4] = self;
    uint64_t v10 = v4;
    [(CXCallController *)callController requestTransactionWithAction:v7 completion:v9];
  }
}

void __52__PTChannelManager_stopTransmittingWithChannelUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = _pttAttemptTranslateErrorFromCXError(a2);
  v4 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__PTChannelManager_stopTransmittingWithChannelUUID___block_invoke_2;
  block[3] = &unk_264DA9720;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __52__PTChannelManager_stopTransmittingWithChannelUUID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = PTDefaultLog();
  uint64_t v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_239821000, v5, OS_LOG_TYPE_DEFAULT, "PTT transmission stop request completed successfully, will be fulfilled soon", v14, 2u);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52__PTChannelManager_stopTransmittingWithChannelUUID___block_invoke_2_cold_1(v2, v5, v6, v7, v8, v9, v10, v11);
  }

  uint64_t v12 = [*(id *)(a1 + 40) channelEventDelegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    uint64_t v5 = [*(id *)(a1 + 40) channelEventDelegate];
    [v5 channelManager:*(void *)(a1 + 40) failedToStopTransmittingInChannelWithUUID:*(void *)(a1 + 48) error:*(void *)(a1 + 32)];
LABEL_8:
  }
}

- (void)requestJoinChannelWithUUID:(NSUUID *)channelUUID descriptor:(PTChannelDescriptor *)descriptor
{
  uint64_t v6 = channelUUID;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__PTChannelManager_requestJoinChannelWithUUID_descriptor___block_invoke;
  v8[3] = &unk_264DA9748;
  v8[4] = self;
  uint64_t v9 = v6;
  uint64_t v7 = v6;
  [(PTChannelManager *)self _requestJoinChannelWithUUID:v7 channelDescriptor:descriptor originator:2 completion:v8];
}

void __58__PTChannelManager_requestJoinChannelWithUUID_descriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v7 = v3;
    v4 = [*(id *)(a1 + 32) channelEventDelegate];
    char v5 = objc_opt_respondsToSelector();

    id v3 = v7;
    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) channelEventDelegate];
      [v6 channelManager:*(void *)(a1 + 32) failedToJoinChannelWithUUID:*(void *)(a1 + 40) error:v7];

      id v3 = v7;
    }
  }
}

- (void)_requestJoinChannelWithUUID:(id)a3 channelDescriptor:(id)a4 originator:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  char v13 = [(PTChannelManager *)self underlyingProvider];
  [v13 requestChannelPushToken];

  id v14 = objc_alloc(MEMORY[0x263EFC8F8]);
  uint64_t v15 = [v11 name];
  uint64_t v16 = (void *)[v14 initWithChannelUUID:v10 name:v15];

  v17 = [v11 imageFileURL];
  [v16 setImageURL:v17];

  [v16 setOriginator:a5];
  objc_initWeak(&location, self);
  callController = self->_callController;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __88__PTChannelManager__requestJoinChannelWithUUID_channelDescriptor_originator_completion___block_invoke;
  v20[3] = &unk_264DA9798;
  objc_copyWeak(&v22, &location);
  v20[4] = self;
  id v19 = v12;
  id v21 = v19;
  [(CXCallController *)callController requestTransactionWithAction:v16 completion:v20];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __88__PTChannelManager__requestJoinChannelWithUUID_channelDescriptor_originator_completion___block_invoke(id *a1, void *a2)
{
  id v3 = _pttAttemptTranslateErrorFromCXError(a2);
  if (v3)
  {
    v4 = PTDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __88__PTChannelManager__requestJoinChannelWithUUID_channelDescriptor_originator_completion___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    [WeakRetained setSuppressRejoinForRecentlyDisconnectedChannelUUID:0];

    v4 = PTDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239821000, v4, OS_LOG_TYPE_DEFAULT, "PTT join request completed successfully, should be fulfilled soon", buf, 2u);
    }
  }

  id v12 = [a1[4] callbackQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __88__PTChannelManager__requestJoinChannelWithUUID_channelDescriptor_originator_completion___block_invoke_62;
  v15[3] = &unk_264DA9770;
  id v13 = a1[5];
  id v16 = v3;
  id v17 = v13;
  id v14 = v3;
  dispatch_async(v12, v15);
}

uint64_t __88__PTChannelManager__requestJoinChannelWithUUID_channelDescriptor_originator_completion___block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)leaveChannelWithUUID:(NSUUID *)channelUUID
{
  v4 = channelUUID;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFC900]) initWithChannelUUID:v4];
  [v5 setOriginator:2];
  callController = self->_callController;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__PTChannelManager_leaveChannelWithUUID___block_invoke;
  v8[3] = &unk_264DA9748;
  v8[4] = self;
  uint64_t v9 = v4;
  uint64_t v7 = v4;
  [(CXCallController *)callController requestTransactionWithAction:v5 completion:v8];
}

void __41__PTChannelManager_leaveChannelWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = _pttAttemptTranslateErrorFromCXError(a2);
  v4 = PTDefaultLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __41__PTChannelManager_leaveChannelWithUUID___block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }

    id v12 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__PTChannelManager_leaveChannelWithUUID___block_invoke_64;
    block[3] = &unk_264DA9720;
    id v13 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v15 = v13;
    id v16 = v3;
    dispatch_async(v12, block);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239821000, v5, OS_LOG_TYPE_DEFAULT, "PTT leave request completed successfully, should be fulfilled soon", buf, 2u);
    }
  }
}

void __41__PTChannelManager_leaveChannelWithUUID___block_invoke_64(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) channelEventDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) channelEventDelegate];
    [v4 channelManager:*(void *)(a1 + 32) failedToLeaveChannelWithUUID:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  }
}

- (void)setActiveRemoteParticipant:(PTParticipant *)participant forChannelUUID:(NSUUID *)channelUUID completionHandler:(void *)completionHandler
{
}

- (void)_setActiveRemoteParticipant:(id)a3 forChannelUUID:(id)a4 shouldReplaceOutgoingTransmission:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  uint64_t v11 = (objc_class *)MEMORY[0x263EFC928];
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v11);
  id v15 = [v13 underlyingParticipant];

  [v14 setActiveRemoteParticipant:v15];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __115__PTChannelManager__setActiveRemoteParticipant_forChannelUUID_shouldReplaceOutgoingTransmission_completionHandler___block_invoke;
  v20[3] = &unk_264DA97C0;
  id v21 = v10;
  id v16 = v10;
  id v17 = (void *)MEMORY[0x23ECA6F50](v20);
  v18 = [(PTChannelManager *)self underlyingProvider];
  id v19 = v18;
  if (v13) {
    [v18 reportIncomingTransmissionStartedForChannelWithUUID:v12 update:v14 shouldReplaceOutgoingTransmission:v6 completionHandler:v17];
  }
  else {
    [v18 reportIncomingTransmissionEndedForChannelWithUUID:v12 reason:0 completionHandler:v17];
  }
}

uint64_t __115__PTChannelManager__setActiveRemoteParticipant_forChannelUUID_shouldReplaceOutgoingTransmission_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _pttAttemptTranslateErrorFromCXError(a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }

  return MEMORY[0x270F9A758]();
}

- (void)setChannelDescriptor:(PTChannelDescriptor *)channelDescriptor forChannelUUID:(NSUUID *)channelUUID completionHandler:(void *)completionHandler
{
  uint64_t v8 = completionHandler;
  uint64_t v9 = (objc_class *)MEMORY[0x263EFC928];
  id v10 = channelUUID;
  uint64_t v11 = channelDescriptor;
  id v12 = objc_alloc_init(v9);
  id v13 = [(PTChannelDescriptor *)v11 name];
  [v12 setName:v13];

  id v14 = [(PTChannelDescriptor *)v11 imageFileURL];

  [v12 setImageURL:v14];
  id v15 = [(PTChannelManager *)self underlyingProvider];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __74__PTChannelManager_setChannelDescriptor_forChannelUUID_completionHandler___block_invoke;
  v17[3] = &unk_264DA97C0;
  id v18 = v8;
  id v16 = v8;
  [v15 reportChannelWithUUID:v10 updated:v12 completionHandler:v17];
}

uint64_t __74__PTChannelManager_setChannelDescriptor_forChannelUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _pttAttemptTranslateErrorFromCXError(a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }

  return MEMORY[0x270F9A758]();
}

- (void)setServiceStatus:(PTServiceStatus)status forChannelUUID:(NSUUID *)channelUUID completionHandler:(void *)completionHandler
{
  uint64_t v8 = completionHandler;
  uint64_t v9 = (objc_class *)MEMORY[0x263EFC928];
  id v10 = channelUUID;
  id v11 = objc_alloc_init(v9);
  [v11 setServiceStatus:status];
  id v12 = [(PTChannelManager *)self underlyingProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__PTChannelManager_setServiceStatus_forChannelUUID_completionHandler___block_invoke;
  v14[3] = &unk_264DA97C0;
  id v15 = v8;
  id v13 = v8;
  [v12 reportChannelWithUUID:v10 updated:v11 completionHandler:v14];
}

uint64_t __70__PTChannelManager_setServiceStatus_forChannelUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _pttAttemptTranslateErrorFromCXError(a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }

  return MEMORY[0x270F9A758]();
}

- (void)setTransmissionMode:(PTTransmissionMode)transmissionMode forChannelUUID:(NSUUID *)channelUUID completionHandler:(void *)completionHandler
{
  uint64_t v8 = completionHandler;
  uint64_t v9 = (objc_class *)MEMORY[0x263EFC928];
  id v10 = channelUUID;
  id v11 = objc_alloc_init(v9);
  [v11 setTransmissionMode:transmissionMode];
  id v12 = [(PTChannelManager *)self underlyingProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__PTChannelManager_setTransmissionMode_forChannelUUID_completionHandler___block_invoke;
  v14[3] = &unk_264DA97C0;
  id v15 = v8;
  id v13 = v8;
  [v12 reportChannelWithUUID:v10 updated:v11 completionHandler:v14];
}

uint64_t __73__PTChannelManager_setTransmissionMode_forChannelUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _pttAttemptTranslateErrorFromCXError(a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }

  return MEMORY[0x270F9A758]();
}

- (void)setAccessoryButtonEventsEnabled:(BOOL)enabled forChannelUUID:(NSUUID *)channelUUID completionHandler:(void *)completionHandler
{
  BOOL v6 = enabled;
  uint64_t v8 = completionHandler;
  uint64_t v9 = (objc_class *)MEMORY[0x263EFC928];
  id v10 = channelUUID;
  id v11 = objc_alloc_init(v9);
  [v11 setAccessoryButtonEventsEnabled:v6];
  id v12 = [(PTChannelManager *)self underlyingProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85__PTChannelManager_setAccessoryButtonEventsEnabled_forChannelUUID_completionHandler___block_invoke;
  v14[3] = &unk_264DA97C0;
  id v15 = v8;
  id v13 = v8;
  [v12 reportChannelWithUUID:v10 updated:v11 completionHandler:v14];
}

uint64_t __85__PTChannelManager_setAccessoryButtonEventsEnabled_forChannelUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _pttAttemptTranslateErrorFromCXError(a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }

  return MEMORY[0x270F9A758]();
}

- (void)unregisterChannelPushToken
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_239821000, log, OS_LOG_TYPE_ERROR, "PTT app requested push token invalidation", v1, 2u);
}

- (void)providerDidBegin:(id)a3
{
  uint64_t v3 = PTDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_239821000, v3, OS_LOG_TYPE_DEFAULT, "PTT channel manager's provider did begin", v4, 2u);
  }
}

- (void)providerDidReset:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  id v4 = [(PTChannelManager *)self underlyingProvider];
  [v4 setDelegate:0 queue:0];

  uint64_t v5 = [(PTChannelManager *)self underlyingProvider];
  [v5 invalidate];

  BOOL v6 = PTDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[PTChannelManager providerDidReset:](v6);
  }

  activeChannelUUID = self->_activeChannelUUID;
  self->_activeChannelUUID = 0;

  id v8 = objc_alloc_init(MEMORY[0x263EFC910]);
  uint64_t v9 = (CXChannelProvider *)[objc_alloc(MEMORY[0x263EFC908]) initWithConfiguration:v8];
  underlyingProvider = self->_underlyingProvider;
  self->_underlyingProvider = v9;

  id v11 = (CXCallController *)objc_alloc_init(MEMORY[0x263EFC8D8]);
  callController = self->_callController;
  self->_callController = v11;

  [(CXChannelProvider *)self->_underlyingProvider setDelegate:self queue:self->_callbackQueue];
}

- (void)_appendPendingPushForUUID:(id)a3 payload:(id)a4 reply:(id)a5 isServiceUpdateMessage:(BOOL)a6 isHighPriority:(BOOL)a7 remainingHighPriorityBudget:(int64_t)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v18 = objc_alloc_init(PTPendingPush);
  [(PTPendingPush *)v18 setUuid:v16];

  [(PTPendingPush *)v18 setPayload:v15];
  [(PTPendingPush *)v18 setReply:v14];

  [(PTPendingPush *)v18 setIsServiceUpdateMessage:v10];
  [(PTPendingPush *)v18 setIsHighPriority:v9];
  [(PTPendingPush *)v18 setRemainingHighPriorityBudget:a8];
  id v17 = [(PTChannelManager *)self pendingPushes];
  [v17 addObject:v18];
}

- (void)provider:(id)a3 didReceivePushPayload:(id)a4 channelUUID:(id)a5 reply:(id)a6 isServiceUpdateMessage:(BOOL)a7 isHighPriority:(BOOL)a8 remainingHighPriorityBudget:(int64_t)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v17 = a4;
  id v14 = a5;
  callbackQueue = self->_callbackQueue;
  id v16 = a6;
  dispatch_assert_queue_V2(callbackQueue);
  [(PTChannelManager *)self _appendPendingPushForUUID:v14 payload:v17 reply:v16 isServiceUpdateMessage:v10 isHighPriority:v9 remainingHighPriorityBudget:a9];

  if (self->_activeChannelUUID) {
    [(PTChannelManager *)self _deliverPendingPushes];
  }
  else {
    [(PTChannelManager *)self _performChannelRestorationAndUpdateChannelDescriptor:v14 pushPayload:v17];
  }
}

- (void)_performChannelRestorationAndUpdateChannelDescriptor:(id)a3 pushPayload:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if (!self->_attemptingChannelRestoration)
  {
    if ([(NSUUID *)self->_suppressRejoinForRecentlyDisconnectedChannelUUID isEqual:v6])
    {
      id v8 = PTDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v6;
        _os_log_impl(&dword_239821000, v8, OS_LOG_TYPE_DEFAULT, "PTChannelManager skipping channel restoration for channel that was just torn down %@", buf, 0xCu);
      }
    }
    else
    {
      self->_attemptingChannelRestoration = 1;
      BOOL v9 = [(PTChannelManager *)self underlyingProvider];
      [v9 requestChannelPushToken];

      BOOL v10 = PTDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v6;
        _os_log_impl(&dword_239821000, v10, OS_LOG_TYPE_DEFAULT, "PTChannelManager asking channel restoration delegate for descriptor for %{public}@", buf, 0xCu);
      }

      id v11 = [(PTChannelManager *)self channelRestorationDelegate];
      id v8 = [v11 channelDescriptorForRestoredChannelUUID:v6];

      if (!v8) {
        -[PTChannelManager _performChannelRestorationAndUpdateChannelDescriptor:pushPayload:]();
      }
      objc_initWeak((id *)buf, self);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __85__PTChannelManager__performChannelRestorationAndUpdateChannelDescriptor_pushPayload___block_invoke;
      v12[3] = &unk_264DA97E8;
      objc_copyWeak(&v14, (id *)buf);
      id v13 = v6;
      [(PTChannelManager *)self setChannelDescriptor:v8 forChannelUUID:v13 completionHandler:v12];

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __85__PTChannelManager__performChannelRestorationAndUpdateChannelDescriptor_pushPayload___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (v3)
  {
    id v6 = PTDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __85__PTChannelManager__performChannelRestorationAndUpdateChannelDescriptor_pushPayload___block_invoke_cold_1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
    }

    [v5 _deliverChannelManagerInstanceToClientIfNeeded];
  }
  else
  {
    [WeakRetained _ensureDelegateIsReadyToReceiveActions:*(void *)(a1 + 32) joinReason:1];
    id v13 = PTDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_239821000, v13, OS_LOG_TYPE_DEFAULT, "PTChannelManager rejoin channel descriptor flush succeeded", v14, 2u);
    }
  }
  [v5 setAttemptingChannelRestoration:0];
}

- (void)_handleLeaveCheckinResult:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  uint64_t v5 = PTDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v4;
    _os_log_impl(&dword_239821000, v5, OS_LOG_TYPE_DEFAULT, "PTChannelManager leaving channel with UUID %{public}@", buf, 0xCu);
  }

  id v6 = [(PTChannelManager *)self underlyingProvider];
  uint64_t v7 = [MEMORY[0x263EFF910] date];
  [v6 reportChannelWithUUID:v4 disconnectedAtDate:v7 disconnectedReason:0];

  uint64_t v8 = [(PTChannelManager *)self channelEventDelegate];
  [v8 channelManager:self didLeaveChannelWithUUID:v4 reason:1];

  [(PTChannelManager *)self _deliverChannelManagerInstanceToClientIfNeeded];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [(PTChannelManager *)self pendingPushes];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v16 + 1) + 8 * v13) reply];
        v14[2](v14, 1, 0);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  id v15 = [(PTChannelManager *)self pendingPushes];
  [v15 removeAllObjects];
}

- (void)provider:(id)a3 didReceiveCheckInResult:(int64_t)a4 channelUUID:(id)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  uint64_t v8 = PTDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    int64_t v10 = a4;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl(&dword_239821000, v8, OS_LOG_TYPE_DEFAULT, "PTChannelManager checked in with result %ld uuid:%{public}@", (uint8_t *)&v9, 0x16u);
  }

  switch(a4)
  {
    case 0:
    case 4:
      [(PTChannelManager *)self _deliverChannelManagerInstanceToClientIfNeeded];
      break;
    case 2:
      [(PTChannelManager *)self _handleLeaveCheckinResult:v7];
      break;
    case 3:
      [(PTChannelManager *)self _performChannelRestorationAndUpdateChannelDescriptor:v7 pushPayload:0];
      break;
    default:
      break;
  }
}

- (void)_deliverChannelManagerInstanceToClientIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  id v3 = PTDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_239821000, v3, OS_LOG_TYPE_DEFAULT, "PTChannelManager instantiation completed", buf, 2u);
  }

  id v4 = [(PTChannelManager *)self instantiationCompletionBlock];
  uint64_t v5 = v4;
  if (v4)
  {
    callbackQueue = self->_callbackQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66__PTChannelManager__deliverChannelManagerInstanceToClientIfNeeded__block_invoke;
    v8[3] = &unk_264DA9770;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(callbackQueue, v8);
  }
  id instantiationCompletionBlock = self->_instantiationCompletionBlock;
  self->_id instantiationCompletionBlock = 0;
}

uint64_t __66__PTChannelManager__deliverChannelManagerInstanceToClientIfNeeded__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_deliverPendingPushes
{
  SEL v22 = a2;
  uint64_t v33 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  activeChannelUUID = self->_activeChannelUUID;
  v24 = activeChannelUUID;
  objc_storeStrong((id *)&self->_waitingForPushResultChannelUUID, activeChannelUUID);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = [(PTChannelManager *)self pendingPushes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    BOOL v7 = 0;
    uint64_t v8 = *(void *)v29;
    uint64_t v23 = v27;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v4);
        }
        int64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
        if (v7)
        {
          __int16 v11 = [*(id *)(*((void *)&v28 + 1) + 8 * v9) reply];
          BOOL v7 = 1;
          v11[2](v11, 1, 0);
        }
        else if ([*(id *)(*((void *)&v28 + 1) + 8 * v9) isServiceUpdateMessage])
        {
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v27[0] = __41__PTChannelManager__deliverPendingPushes__block_invoke;
          v27[1] = &unk_264DA9810;
          v27[2] = self;
          v27[3] = v10;
          id v12 = (void *)MEMORY[0x23ECA6F50](v26);
          uint64_t v13 = [(PTChannelManager *)self channelEventDelegate];
          char v14 = objc_opt_respondsToSelector();

          if (v14)
          {
            id v15 = [(PTChannelManager *)self channelEventDelegate];
            long long v16 = [v10 payload];
            -[NSObject incomingServiceUpdatePushForChannelManager:channelUUID:pushPayload:isHighPriority:remainingHighPriorityBudget:withCompletionHandler:](v15, "incomingServiceUpdatePushForChannelManager:channelUUID:pushPayload:isHighPriority:remainingHighPriorityBudget:withCompletionHandler:", self, v24, v16, [v10 isHighPriority], objc_msgSend(v10, "remainingHighPriorityBudget"), v12);
          }
          else
          {
            id v15 = PTDefaultLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_239821000, v15, OS_LOG_TYPE_DEFAULT, "PTChannelManager received a Service Update push message but the PTChannelManagerDelegate has not implemented the delegate protocol required to receive Service Update messages.", buf, 2u);
            }
          }

          BOOL v7 = 0;
        }
        else
        {
          self->_isWaitingForPushResult = 1;
          long long v17 = [(PTChannelManager *)self channelEventDelegate];
          long long v18 = [v10 payload];
          long long v19 = [v17 incomingPushResultForChannelManager:self channelUUID:v24 pushPayload:v18];

          self->_isWaitingForPushResult = 0;
          if (([v19 isMemberOfClass:objc_opt_class()] & 1) == 0
            && ([v19 isMemberOfClass:objc_opt_class()] & 1) == 0)
          {
            id v20 = [MEMORY[0x263F08690] currentHandler];
            [v20 handleFailureInMethod:v22 object:self file:@"PTChannelManager.m" lineNumber:501 description:@"You must return a valid object of type PTPushDecision"];
          }
          BOOL v7 = objc_msgSend(v19, "type", v22, v23) != 2;
          [(PTChannelManager *)self _handlePushResult:v19 pendingPush:v10];
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }

  waitingForPushResultChannelUUID = self->_waitingForPushResultChannelUUID;
  self->_waitingForPushResultChannelUUID = 0;

  [(NSMutableArray *)self->_pendingPushes removeAllObjects];
}

void __41__PTChannelManager__deliverPendingPushes__block_invoke(uint64_t a1)
{
  id v2 = +[PTPushResult serviceUpdatePushResult];
  [*(id *)(a1 + 32) _handlePushResult:v2 pendingPush:*(void *)(a1 + 40)];
}

- (void)_handlePushResult:(id)a3 pendingPush:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  switch([v14 type])
  {
    case 0:
    case 1:
    case 3:
    case 4:
      id v12 = [v6 reply];
      v12[2]();

      break;
    case 2:
      BOOL v7 = [v14 participant];
      uint64_t v8 = [v6 uuid];
      [(PTChannelManager *)self _setActiveRemoteParticipant:v7 forChannelUUID:v8 shouldReplaceOutgoingTransmission:self->_stopTransmitRequestedWhileWaitingForPushResult completionHandler:&__block_literal_global_0];

      uint64_t v9 = [v6 reply];
      int64_t v10 = [v14 participant];
      __int16 v11 = [v10 underlyingParticipant];
      ((void (**)(void, uint64_t, void *))v9)[2](v9, 2, v11);

      self->_stopTransmitRequestedWhileWaitingForPushResult = 0;
      break;
    default:
      break;
  }
  if (self->_stopTransmitRequestedWhileWaitingForPushResult)
  {
    uint64_t v13 = [v6 uuid];
    [(PTChannelManager *)self stopTransmittingWithChannelUUID:v13];

    self->_stopTransmitRequestedWhileWaitingForPushResult = 0;
  }
}

void __50__PTChannelManager__handlePushResult_pendingPush___block_invoke()
{
  v0 = PTDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_239821000, v0, OS_LOG_TYPE_DEFAULT, "PTChannelManager setting a remote participant in response to a push ", v1, 2u);
  }
}

- (void)provider:(id)a3 didReceiveChannelPushToken:(id)a4
{
  callbackQueue = self->_callbackQueue;
  id v6 = a4;
  dispatch_assert_queue_V2(callbackQueue);
  BOOL v7 = PTDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_239821000, v7, OS_LOG_TYPE_DEFAULT, "PTChannelManager did receive channel push token", v9, 2u);
  }

  uint64_t v8 = [(PTChannelManager *)self channelEventDelegate];
  [v8 channelManager:self receivedEphemeralPushToken:v6];
}

- (void)provider:(id)a3 performChannelJoinAction:(id)a4
{
  callbackQueue = self->_callbackQueue;
  id v6 = a4;
  dispatch_assert_queue_V2(callbackQueue);
  BOOL v7 = PTDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v10 = 0;
    _os_log_impl(&dword_239821000, v7, OS_LOG_TYPE_DEFAULT, "PTChannelManager did join", v10, 2u);
  }

  [v6 fulfill];
  BOOL v8 = PTChannelJoinReasonForCXActionOriginator([v6 originator]);
  uint64_t v9 = [v6 channelUUID];

  [(PTChannelManager *)self _ensureDelegateIsReadyToReceiveActions:v9 joinReason:v8];
}

- (void)provider:(id)a3 performChannelLeaveAction:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  [v5 fulfill];
  id v6 = [v5 channelUUID];
  suppressRejoinForRecentlyDisconnectedChannelUUID = self->_suppressRejoinForRecentlyDisconnectedChannelUUID;
  self->_suppressRejoinForRecentlyDisconnectedChannelUUID = v6;

  activeChannelUUID = self->_activeChannelUUID;
  self->_activeChannelUUID = 0;

  uint64_t v9 = PTDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_239821000, v9, OS_LOG_TYPE_DEFAULT, "PTChannelManager did leave", v13, 2u);
  }

  uint64_t v10 = PTChannelLeaveReasonForCXActionOriginator([v5 originator]);
  __int16 v11 = [(PTChannelManager *)self channelEventDelegate];
  id v12 = [v5 channelUUID];
  [v11 channelManager:self didLeaveChannelWithUUID:v12 reason:v10];

  [(PTChannelManager *)self _deliverChannelManagerInstanceToClientIfNeeded];
  [(NSMutableArray *)self->_pendingPushes removeAllObjects];
}

- (void)provider:(id)a3 performChannelTransmitStartAction:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  id v6 = [v5 channelUUID];
  [(PTChannelManager *)self _ensureDelegateIsReadyToReceiveActions:v6 joinReason:1];

  [v5 fulfill];
  BOOL v7 = PTDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v11 = 0;
    _os_log_impl(&dword_239821000, v7, OS_LOG_TYPE_DEFAULT, "PTChannelManager did start transmitting", v11, 2u);
  }

  uint64_t v8 = PTChannelTransmitRequestSourceForCXActionOriginator([v5 originator]);
  uint64_t v9 = [(PTChannelManager *)self channelEventDelegate];
  uint64_t v10 = [v5 channelUUID];
  [v9 channelManager:self channelUUID:v10 didBeginTransmittingFromSource:v8];
}

- (void)provider:(id)a3 performChannelTransmitStopAction:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  id v6 = [v5 channelUUID];
  [(PTChannelManager *)self _ensureDelegateIsReadyToReceiveActions:v6 joinReason:1];

  [v5 fulfill];
  BOOL v7 = PTDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v11 = 0;
    _os_log_impl(&dword_239821000, v7, OS_LOG_TYPE_DEFAULT, "PTChannelManager did stop transmitting", v11, 2u);
  }

  uint64_t v8 = PTChannelTransmitRequestSourceForCXActionOriginator([v5 originator]);
  uint64_t v9 = [(PTChannelManager *)self channelEventDelegate];
  uint64_t v10 = [v5 channelUUID];
  [v9 channelManager:self channelUUID:v10 didEndTransmittingFromSource:v8];
}

- (void)_ensureDelegateIsReadyToReceiveActions:(id)a3 joinReason:(int64_t)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if ([(NSUUID *)self->_suppressRejoinForRecentlyDisconnectedChannelUUID isEqual:v7])
  {
    uint64_t v8 = PTDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_239821000, v8, OS_LOG_TYPE_DEFAULT, "Not delivering the didJoin event because this channel recently saw a leave action %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (!self->_activeChannelUUID)
  {
    objc_storeStrong((id *)&self->_activeChannelUUID, a3);
    uint64_t v9 = [(PTChannelManager *)self channelEventDelegate];
    uint64_t v10 = [(PTChannelManager *)self activeChannelUUID];
    [v9 channelManager:self didJoinChannelWithUUID:v10 reason:a4];

    [(PTChannelManager *)self _deliverChannelManagerInstanceToClientIfNeeded];
    [(PTChannelManager *)self _deliverPendingPushes];
  }
}

- (void)provider:(id)a3 didActivateAudioSession:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  id v6 = PTDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    id v9 = v5;
    _os_log_impl(&dword_239821000, v6, OS_LOG_TYPE_DEFAULT, "PTChannelManager did activate audio session %p", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(PTChannelManager *)self channelEventDelegate];
  [v7 channelManager:self didActivateAudioSession:v5];
}

- (void)provider:(id)a3 didDeactivateAudioSession:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  id v6 = PTDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    id v9 = v5;
    _os_log_impl(&dword_239821000, v6, OS_LOG_TYPE_DEFAULT, "PTChannelManager did deactivate audio session %p", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(PTChannelManager *)self channelEventDelegate];
  [v7 channelManager:self didDeactivateAudioSession:v5];
}

- (NSUUID)activeChannelUUID
{
  return self->_activeChannelUUID;
}

- (CXChannelProvider)underlyingProvider
{
  return self->_underlyingProvider;
}

- (CXCallController)callController
{
  return self->_callController;
}

- (PTChannelRestorationDelegate)channelRestorationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_channelRestorationDelegate);

  return (PTChannelRestorationDelegate *)WeakRetained;
}

- (void)setChannelRestorationDelegate:(id)a3
{
}

- (PTChannelManagerDelegate)channelEventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_channelEventDelegate);

  return (PTChannelManagerDelegate *)WeakRetained;
}

- (void)setChannelEventDelegate:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (id)instantiationCompletionBlock
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setInstantiationCompletionBlock:(id)a3
{
}

- (NSMutableArray)pendingPushes
{
  return self->_pendingPushes;
}

- (void)setPendingPushes:(id)a3
{
}

- (BOOL)attemptingChannelRestoration
{
  return self->_attemptingChannelRestoration;
}

- (void)setAttemptingChannelRestoration:(BOOL)a3
{
  self->_attemptingChannelRestoration = a3;
}

- (NSUUID)suppressRejoinForRecentlyDisconnectedChannelUUID
{
  return self->_suppressRejoinForRecentlyDisconnectedChannelUUID;
}

- (void)setSuppressRejoinForRecentlyDisconnectedChannelUUID:(id)a3
{
}

- (BOOL)isWaitingForPushResult
{
  return self->_isWaitingForPushResult;
}

- (void)setIsWaitingForPushResult:(BOOL)a3
{
  self->_isWaitingForPushResult = a3;
}

- (NSUUID)waitingForPushResultChannelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setWaitingForPushResultChannelUUID:(id)a3
{
}

- (BOOL)stopTransmitRequestedWhileWaitingForPushResult
{
  return self->_stopTransmitRequestedWhileWaitingForPushResult;
}

- (void)setStopTransmitRequestedWhileWaitingForPushResult:(BOOL)a3
{
  self->_stopTransmitRequestedWhileWaitingForPushResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingForPushResultChannelUUID, 0);
  objc_storeStrong((id *)&self->_suppressRejoinForRecentlyDisconnectedChannelUUID, 0);
  objc_storeStrong((id *)&self->_pendingPushes, 0);
  objc_storeStrong(&self->_instantiationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_destroyWeak((id *)&self->_channelEventDelegate);
  objc_destroyWeak((id *)&self->_channelRestorationDelegate);
  objc_storeStrong((id *)&self->_callController, 0);
  objc_storeStrong((id *)&self->_underlyingProvider, 0);

  objc_storeStrong((id *)&self->_activeChannelUUID, 0);
}

void __60__PTChannelManager_requestBeginTransmittingWithChannelUUID___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __52__PTChannelManager_stopTransmittingWithChannelUUID___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __88__PTChannelManager__requestJoinChannelWithUUID_channelDescriptor_originator_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__PTChannelManager_leaveChannelWithUUID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)providerDidReset:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_239821000, log, OS_LOG_TYPE_ERROR, "PTChannelManager's underlying provider did reset", v1, 2u);
}

- (void)_performChannelRestorationAndUpdateChannelDescriptor:pushPayload:.cold.1()
{
}

void __85__PTChannelManager__performChannelRestorationAndUpdateChannelDescriptor_pushPayload___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end