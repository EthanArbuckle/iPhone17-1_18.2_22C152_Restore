@interface AFRemoteRequestWatcher
- (AFRemoteRequestWatcher)init;
- (void)_dispatchSpeechRequestOptions:(id)a3;
- (void)_setupRequestListener;
- (void)_setupSpeechRequestListener;
- (void)dealloc;
- (void)setActivationHandler:(id)a3;
- (void)setButtonEventHandler:(id)a3;
- (void)setDismissalHandler:(id)a3;
- (void)setIntentForwardingActionHandler:(id)a3;
- (void)setIntentHandler:(id)a3;
- (void)setNewRequestHandler:(id)a3;
- (void)setNewSpeechRequestHandler:(id)a3;
- (void)setPrewarmHandler:(id)a3;
- (void)setRequestHandler:(id)a3;
- (void)siriActivationListener:(id)a3 activateWithRequestInfo:(id)a4 context:(id)a5 completion:(id)a6;
- (void)siriActivationListener:(id)a3 deactivateForReason:(int64_t)a4 options:(unint64_t)a5 context:(id)a6 completion:(id)a7;
- (void)siriActivationListener:(id)a3 handleButtonEventFromContext:(id)a4 completion:(id)a5;
- (void)siriActivationListener:(id)a3 handleIntent:(id)a4 inBackgroundAppWithBundleId:(id)a5 reply:(id)a6;
- (void)siriActivationListener:(id)a3 handleIntentForwardingAction:(id)a4 inBackgroundApplicationWithBundleIdentifier:(id)a5 completionHandler:(id)a6;
- (void)siriActivationListener:(id)a3 prewarmWithRequestInfo:(id)a4 context:(id)a5 completion:(id)a6;
@end

@implementation AFRemoteRequestWatcher

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activationHandler, 0);
  objc_storeStrong(&self->_buttonEventHandler, 0);
  objc_storeStrong(&self->_speechRequestHandler, 0);
  objc_storeStrong(&self->_intentForwardingActionHandler, 0);
  objc_storeStrong(&self->_intentHandler, 0);
  objc_storeStrong(&self->_dismissalHandler, 0);
  objc_storeStrong(&self->_requestHandler, 0);
  objc_storeStrong(&self->_prewarmHandler, 0);
  objc_storeStrong((id *)&self->_siriActivationListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setNewSpeechRequestHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__AFRemoteRequestWatcher_setNewSpeechRequestHandler___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __53__AFRemoteRequestWatcher_setNewSpeechRequestHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x19F3A50D0](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;

  v5 = *(void **)(a1 + 32);
  return [v5 _setupSpeechRequestListener];
}

- (void)_dispatchSpeechRequestOptions:(id)a3
{
  id v4 = a3;
  speechRequestHandler = (void (**)(void))self->_speechRequestHandler;
  if (speechRequestHandler)
  {
    v9 = v4;
    speechRequestHandler[2]();
  }
  else
  {
    if (!self->_requestHandler) {
      goto LABEL_8;
    }
    v9 = v4;
    id v6 = [AFRequestInfo alloc];
    uint64_t v7 = [v9 activationEventMachAbsoluteTime];
    if (!v7) {
      uint64_t v7 = mach_absolute_time();
    }
    id v8 = [(AFRequestInfo *)v6 initWithTimestamp:v7];
    [(AFRequestInfo *)v8 setSpeechRequestOptions:v9];
    (*((void (**)(void))self->_requestHandler + 2))();
  }
  id v4 = v9;
LABEL_8:
}

- (void)_setupSpeechRequestListener
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_speechRequestToken == -1)
  {
    uint64_t v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[AFRemoteRequestWatcher _setupSpeechRequestListener]";
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    int out_token = -1;
    objc_initWeak(&location, self);
    queue = self->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __53__AFRemoteRequestWatcher__setupSpeechRequestListener__block_invoke;
    handler[3] = &unk_1E592A778;
    objc_copyWeak(&v8, &location);
    uint32_t v5 = notify_register_dispatch("com.apple.assistant.speech-request", &out_token, queue, handler);
    if (v5)
    {
      id v6 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[AFRemoteRequestWatcher _setupSpeechRequestListener]";
        __int16 v13 = 1024;
        uint32_t v14 = v5;
        _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s Notify register failed %u", buf, 0x12u);
      }
    }
    else
    {
      self->_speechRequestToken = out_token;
    }
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __53__AFRemoteRequestWatcher__setupSpeechRequestListener__block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v8 = 136315138;
    *(void *)&v8[4] = "-[AFRemoteRequestWatcher _setupSpeechRequestListener]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s ", v8, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *(void *)id v8 = 0;
    notify_get_state(a2, (uint64_t *)v8);
    id v6 = [[AFSpeechRequestOptions alloc] initWithActivationEvent:0];
    uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)v8];
    [(AFSpeechRequestOptions *)v6 setNotifyState:v7];

    [WeakRetained _dispatchSpeechRequestOptions:v6];
  }
}

- (void)setActivationHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__AFRemoteRequestWatcher_setActivationHandler___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __47__AFRemoteRequestWatcher_setActivationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x19F3A50D0](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 88);
  *(void *)(v3 + 88) = v2;
}

- (void)setButtonEventHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__AFRemoteRequestWatcher_setButtonEventHandler___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __48__AFRemoteRequestWatcher_setButtonEventHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x19F3A50D0](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;
}

- (void)setIntentForwardingActionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__AFRemoteRequestWatcher_setIntentForwardingActionHandler___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __59__AFRemoteRequestWatcher_setIntentForwardingActionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x19F3A50D0](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;
}

- (void)setIntentHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__AFRemoteRequestWatcher_setIntentHandler___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __43__AFRemoteRequestWatcher_setIntentHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x19F3A50D0](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;
}

- (void)setDismissalHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__AFRemoteRequestWatcher_setDismissalHandler___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __46__AFRemoteRequestWatcher_setDismissalHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x19F3A50D0](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setRequestHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__AFRemoteRequestWatcher_setRequestHandler___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __44__AFRemoteRequestWatcher_setRequestHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x19F3A50D0](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint32_t v5 = *(void **)(a1 + 32);
  return [v5 _setupRequestListener];
}

- (void)setNewRequestHandler:(id)a3
{
  id v4 = a3;
  uint32_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__AFRemoteRequestWatcher_setNewRequestHandler___block_invoke;
    v6[3] = &unk_1E5928108;
    id v7 = v4;
    [(AFRemoteRequestWatcher *)self setRequestHandler:v6];
  }
  else
  {
    [(AFRemoteRequestWatcher *)self setRequestHandler:0];
  }
}

void __47__AFRemoteRequestWatcher_setNewRequestHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    id v4 = v5;
  }
}

- (void)setPrewarmHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__AFRemoteRequestWatcher_setPrewarmHandler___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __44__AFRemoteRequestWatcher_setPrewarmHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x19F3A50D0](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

- (void)_setupRequestListener
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[AFRemoteRequestWatcher _setupRequestListener]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterAddObserver(DistributedCenter, self, (CFNotificationCallback)_StartUIRequest, @"com.apple.assistant.request", 0, CFNotificationSuspensionBehaviorDrop);
}

- (void)siriActivationListener:(id)a3 handleButtonEventFromContext:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__AFRemoteRequestWatcher_siriActivationListener_handleButtonEventFromContext_completion___block_invoke;
  block[3] = &unk_1E592C598;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

void __89__AFRemoteRequestWatcher_siriActivationListener_handleButtonEventFromContext_completion___block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 80);
  if (v2)
  {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, a1[5]);
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = +[AFError errorWithCode:2509];
  }
  uint64_t v4 = a1[6];
  if (v4)
  {
    int v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    uint64_t v3 = v5;
  }
}

- (void)siriActivationListener:(id)a3 handleIntentForwardingAction:(id)a4 inBackgroundApplicationWithBundleIdentifier:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __140__AFRemoteRequestWatcher_siriActivationListener_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E592A8F8;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(queue, v16);
}

uint64_t __140__AFRemoteRequestWatcher_siriActivationListener_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke(void *a1)
{
  uint64_t v1 = *(void *)(a1[4] + 56);
  if (v1) {
    return (*(uint64_t (**)(void, void, void, void))(v1 + 16))(*(void *)(a1[4] + 56), a1[5], a1[6], a1[7]);
  }
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)siriActivationListener:(id)a3 handleIntent:(id)a4 inBackgroundAppWithBundleId:(id)a5 reply:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__AFRemoteRequestWatcher_siriActivationListener_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke;
  v16[3] = &unk_1E592A8F8;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(queue, v16);
}

void __96__AFRemoteRequestWatcher_siriActivationListener_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke(void *a1)
{
  uint64_t v1 = *(void *)(a1[4] + 48);
  if (v1)
  {
    uint64_t v2 = a1[5];
    uint64_t v3 = a1[6];
    uint64_t v4 = a1[7];
    int v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 16);
    uint64_t v6 = *(void *)(a1[4] + 48);
    v5(v6, v2, v3, v4);
  }
  else
  {
    uint64_t v7 = a1[7];
    id v8 = +[AFError errorWithCode:2509];
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v8);
  }
}

- (void)siriActivationListener:(id)a3 deactivateForReason:(int64_t)a4 options:(unint64_t)a5 context:(id)a6 completion:(id)a7
{
  id v11 = a6;
  id v12 = a7;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__AFRemoteRequestWatcher_siriActivationListener_deactivateForReason_options_context_completion___block_invoke;
  block[3] = &unk_1E5929510;
  int64_t v19 = a4;
  unint64_t v20 = a5;
  block[4] = self;
  id v17 = v11;
  id v18 = v12;
  id v14 = v12;
  id v15 = v11;
  dispatch_async(queue, block);
}

void __96__AFRemoteRequestWatcher_siriActivationListener_deactivateForReason_options_context_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 64);
    int v5 = [*(id *)(a1 + 40) userInfo];
    uint64_t v6 = [v5 objectForKey:@"analyticsContext"];
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v4, v6);

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = +[AFError errorWithCode:2509];
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8)
  {
    id v9 = v7;
    (*(void (**)(void))(v8 + 16))();
    uint64_t v7 = v9;
  }
}

- (void)siriActivationListener:(id)a3 activateWithRequestInfo:(id)a4 context:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__AFRemoteRequestWatcher_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke;
  v16[3] = &unk_1E592A8F8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v20 = v11;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  dispatch_async(queue, v16);
}

void __92__AFRemoteRequestWatcher_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 32);
    if (v2)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __92__AFRemoteRequestWatcher_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke_2;
      v10[3] = &unk_1E592B9A0;
      id v11 = *(id *)(a1 + 56);
      (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v1, v10);
      uint64_t v3 = v11;
LABEL_7:

      return;
    }
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 88);
    if (v5)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __92__AFRemoteRequestWatcher_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke_3;
      v8[3] = &unk_1E592B9A0;
      id v9 = *(id *)(a1 + 56);
      (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v4, v8);
      uint64_t v3 = v9;
      goto LABEL_7;
    }
  }
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6)
  {
    id v7 = +[AFError errorWithCode:2509];
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

uint64_t __92__AFRemoteRequestWatcher_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __92__AFRemoteRequestWatcher_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)siriActivationListener:(id)a3 prewarmWithRequestInfo:(id)a4 context:(id)a5 completion:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__AFRemoteRequestWatcher_siriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke;
  block[3] = &unk_1E592C598;
  block[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);
}

void __91__AFRemoteRequestWatcher_siriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 24);
  if (v2)
  {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, a1[5]);
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = +[AFError errorWithCode:2509];
  }
  uint64_t v4 = a1[6];
  if (v4)
  {
    uint64_t v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    uint64_t v3 = v5;
  }
}

- (void)dealloc
{
  [(AFSiriActivationListener *)self->_siriActivationListener invalidate];
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, self, @"com.apple.assistant.request", 0);
  int speechRequestToken = self->_speechRequestToken;
  if (speechRequestToken != -1) {
    notify_cancel(speechRequestToken);
  }
  v5.receiver = self;
  v5.super_class = (Class)AFRemoteRequestWatcher;
  [(AFRemoteRequestWatcher *)&v5 dealloc];
}

- (AFRemoteRequestWatcher)init
{
  v12.receiver = self;
  v12.super_class = (Class)AFRemoteRequestWatcher;
  uint64_t v2 = [(AFRemoteRequestWatcher *)&v12 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v5 = dispatch_queue_create("AFPersistentConnection", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_int speechRequestToken = -1;
    id v7 = [AFSiriActivationListener alloc];
    if (AFIsHorseman_onceToken != -1) {
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
    }
    if (AFIsHorseman_isHorseman) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    uint64_t v9 = [(AFSiriActivationListener *)v7 initWithServicePort:v8];
    siriActivationListener = v2->_siriActivationListener;
    v2->_siriActivationListener = (AFSiriActivationListener *)v9;

    [(AFSiriActivationListener *)v2->_siriActivationListener startWithDelegate:v2];
  }
  return v2;
}

@end