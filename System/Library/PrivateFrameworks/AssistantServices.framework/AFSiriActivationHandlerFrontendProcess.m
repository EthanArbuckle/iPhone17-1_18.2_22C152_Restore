@interface AFSiriActivationHandlerFrontendProcess
- (AFSiriActivationHandlerFrontendProcess)init;
- (AFSiriActivationHandlerFrontendProcess)initWithConnection:(id)a3;
- (BOOL)handleContext:(id)a3 completion:(id)a4;
- (void)_waitUntilListeningForContext:(id)a3 timeoutInterval:(double)a4 completion:(id)a5;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
@end

@implementation AFSiriActivationHandlerFrontendProcess

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientStateTransitionHandlersByTimestamp, 0);
  objc_storeStrong((id *)&self->_clientStateObserver, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_waitUntilListeningForContext:(id)a3 timeoutInterval:(double)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[AFSiriActivationHandlerFrontendProcess _waitUntilListeningForContext:timeoutInterval:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2048;
      double v27 = a4;
      _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s context = %@, timeoutInterval = %f", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    double v27 = COERCE_DOUBLE(__Block_byref_object_copy__22876);
    v28 = __Block_byref_object_dispose__22877;
    id v29 = 0;
    v11 = [AFSafetyBlock alloc];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __99__AFSiriActivationHandlerFrontendProcess__waitUntilListeningForContext_timeoutInterval_completion___block_invoke;
    v22[3] = &unk_1E5928730;
    id v24 = v9;
    v22[4] = self;
    id v12 = v8;
    id v23 = v12;
    v25 = buf;
    v13 = [(AFSafetyBlock *)v11 initWithBlock:v22];
    clientStateTransitionHandlersByTimestamp = self->_clientStateTransitionHandlersByTimestamp;
    v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v12, "timestamp"));
    [(NSMutableDictionary *)clientStateTransitionHandlersByTimestamp setObject:v13 forKey:v15];

    if (a4 > 0.0)
    {
      v16 = [AFWatchdogTimer alloc];
      queue = self->_queue;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __99__AFSiriActivationHandlerFrontendProcess__waitUntilListeningForContext_timeoutInterval_completion___block_invoke_2;
      v20[3] = &unk_1E592C678;
      v21 = v13;
      uint64_t v18 = [(AFWatchdogTimer *)v16 initWithTimeoutInterval:queue onQueue:v20 timeoutHandler:a4];
      v19 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v18;

      [*(id *)(*(void *)&buf[8] + 40) start];
    }

    _Block_object_dispose(buf, 8);
  }
}

void __99__AFSiriActivationHandlerFrontendProcess__waitUntilListeningForContext_timeoutInterval_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[AFSiriActivationHandlerFrontendProcess _waitUntilListeningForContext:timeoutInterval:completion:]_block_invoke";
    __int16 v14 = 2048;
    uint64_t v15 = a2;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s signal = %ld", buf, 0x16u);
    v4 = AFSiriLogContextConnection;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[AFSiriActivationHandlerFrontendProcess _waitUntilListeningForContext:timeoutInterval:completion:]_block_invoke";
    __int16 v14 = 1024;
    LODWORD(v15) = a2 == 0;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s isListening = %d", buf, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__AFSiriActivationHandlerFrontendProcess__waitUntilListeningForContext_timeoutInterval_completion___block_invoke_17;
  block[3] = &unk_1E5928708;
  block[4] = v5;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  id v10 = v7;
  uint64_t v11 = v8;
  dispatch_async(v6, block);
}

uint64_t __99__AFSiriActivationHandlerFrontendProcess__waitUntilListeningForContext_timeoutInterval_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeWithSignal:-2];
}

void __99__AFSiriActivationHandlerFrontendProcess__waitUntilListeningForContext_timeoutInterval_completion___block_invoke_17(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "timestamp"));
  [v2 removeObjectForKey:v3];

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) cancel];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (AFNotifyObserver *)a3;
  if (self->_clientStateObserver == v8)
  {
    id v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315650;
      uint64_t v11 = "-[AFSiriActivationHandlerFrontendProcess notifyObserver:didChangeStateFrom:to:]";
      __int16 v12 = 2048;
      unint64_t v13 = a4;
      __int16 v14 = 2048;
      unint64_t v15 = a5;
      _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s state: %llu -> %llu", (uint8_t *)&v10, 0x20u);
    }
    if ((a5 & ~a4 & 4) != 0) {
      [(NSMutableDictionary *)self->_clientStateTransitionHandlersByTimestamp enumerateKeysAndObjectsUsingBlock:&__block_literal_global_15_22886];
    }
  }
}

uint64_t __79__AFSiriActivationHandlerFrontendProcess_notifyObserver_didChangeStateFrom_to___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invokeWithSignal:0];
}

- (BOOL)handleContext:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[AFSiriActivationHandlerFrontendProcess handleContext:completion:]";
    __int16 v18 = 2048;
    id v19 = v6;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s context = %p", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke;
  block[3] = &unk_1E592C598;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);

  return 1;
}

void __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__22876;
  v33 = __Block_byref_object_dispose__22877;
  id v34 = *(id *)(*(void *)(a1 + 32) + 16);
  if (!v34)
  {
    v2 = [AFSiriActivationConnection alloc];
    if (AFIsHorseman_onceToken != -1) {
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
    }
    if (AFIsHorseman_isHorseman) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 1;
    }
    uint64_t v4 = [(AFSiriActivationConnection *)v2 initWithServicePort:v3];
    uint64_t v5 = (void *)v30[5];
    v30[5] = v4;
  }
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  id v6 = AFSiriActivationCreateRequestInfoFromContext(*(void **)(a1 + 40));
  int v7 = [v6 isSpeechRequest];

  if ([*(id *)(a1 + 40) options]) {
    int v8 = 0;
  }
  else {
    int v8 = v7;
  }
  if (v8 == 1)
  {
    id v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    id v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[AFSiriActivationHandlerFrontendProcess handleContext:completion:]_block_invoke";
      _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s Begin waiting for listening...", buf, 0xCu);
    }
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke_5;
    v24[3] = &unk_1E5928670;
    v26 = v27;
    unint64_t v13 = v9;
    v25 = v13;
    [v11 _waitUntilListeningForContext:v12 timeoutInterval:v24 completion:5.0];
  }
  else
  {
    unint64_t v13 = 0;
  }
  id v14 = (void *)v30[5];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke_7;
  v18[3] = &unk_1E59286C0;
  uint64_t v15 = *(void *)(a1 + 40);
  id v21 = *(id *)(a1 + 48);
  uint64_t v16 = v13;
  uint64_t v17 = *(void *)(a1 + 32);
  id v19 = v16;
  uint64_t v20 = v17;
  v22 = v27;
  id v23 = &v29;
  [v14 handleContext:v15 completion:v18];

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);
}

void __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke_5(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[AFSiriActivationHandlerFrontendProcess handleContext:completion:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = a2;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s End waiting for listening (isListening = %d).", (uint8_t *)&v5, 0x12u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "-[AFSiriActivationHandlerFrontendProcess handleContext:completion:]_block_invoke";
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s result = %@", buf, 0x16u);
  }
  if (*(void *)(a1 + 48))
  {
    if ([v3 actionType] == 1
      && ([v3 error], int v5 = objc_claimAutoreleasedReturnValue(), v5, !v5)
      && (uint64_t v9 = *(NSObject **)(a1 + 32)) != 0)
    {
      id v10 = *(NSObject **)(*(void *)(a1 + 40) + 8);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke_8;
      block[3] = &unk_1E5928698;
      long long v12 = *(_OWORD *)(a1 + 48);
      id v11 = (id)v12;
      long long v15 = v12;
      id v14 = v3;
      dispatch_group_notify(v9, v10, block);
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 48);
      if (v6) {
        (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
      }
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
}

void __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke_8(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) mutatedCopyWithMutator:&__block_literal_global_22894];
    uint64_t v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 136315394;
      uint64_t v7 = "-[AFSiriActivationHandlerFrontendProcess handleContext:completion:]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s overrideResult = %@", (uint8_t *)&v6, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[AFError errorWithCode:2511];
  [v2 setError:v3];
}

- (AFSiriActivationHandlerFrontendProcess)initWithConnection:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AFSiriActivationHandlerFrontendProcess;
  int v6 = [(AFSiriActivationHandlerFrontendProcess *)&v18 init];
  if (v6)
  {
    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    __int16 v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.siri.activation.frontend-process-handler", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_connection, a3);
    id v11 = [AFNotifyObserver alloc];
    long long v12 = (void *)[[NSString alloc] initWithUTF8String:"com.apple.siri.client-state-changed"];
    uint64_t v13 = [(AFNotifyObserver *)v11 initWithName:v12 options:1 queue:v6->_queue delegate:v6];
    clientStateObserver = v6->_clientStateObserver;
    v6->_clientStateObserver = (AFNotifyObserver *)v13;

    long long v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    clientStateTransitionHandlersByTimestamp = v6->_clientStateTransitionHandlersByTimestamp;
    v6->_clientStateTransitionHandlersByTimestamp = v15;
  }
  return v6;
}

- (AFSiriActivationHandlerFrontendProcess)init
{
  return [(AFSiriActivationHandlerFrontendProcess *)self initWithConnection:0];
}

@end