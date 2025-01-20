@interface CSCommandControlListener
- (CSAudioStream)audioStream;
- (CSAudioStreamProviding)audioStreamProvider;
- (CSCommandControlListener)init;
- (CSCommandControlListenerDelegate)delegate;
- (CSXPCClient)xpcClient;
- (OS_dispatch_queue)queue;
- (void)CSXPCClient:(id)a3 didDisconnect:(BOOL)a4;
- (void)_startRequestWithCompletion:(id)a3;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)setAudioStream:(id)a3;
- (void)setAudioStreamProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setXpcClient:(id)a3;
- (void)startListenWithOption:(id)a3 completion:(id)a4;
- (void)stopListenWithCompletion:(id)a3;
@end

@implementation CSCommandControlListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_audioStreamProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setXpcClient:(id)a3
{
}

- (CSXPCClient)xpcClient
{
  return self->_xpcClient;
}

- (void)setAudioStream:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStreamProvider:(id)a3
{
}

- (CSAudioStreamProviding)audioStreamProvider
{
  return self->_audioStreamProvider;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
}

- (CSCommandControlListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSCommandControlListenerDelegate *)WeakRetained;
}

- (void)CSXPCClient:(id)a3 didDisconnect:(BOOL)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CSCommandControlListener_CSXPCClient_didDisconnect___block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __54__CSCommandControlListener_CSXPCClient_didDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (os_log_t *)MEMORY[0x1E4F5D180];
  v3 = (void *)*MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    v6 = [v4 audioStream];
    int v13 = 136315394;
    v14 = "-[CSCommandControlListener CSXPCClient:didDisconnect:]_block_invoke";
    __int16 v15 = 1026;
    int v16 = [v6 isStreaming];
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Received xpc disconnection, audioStream is streaming = %{public}d", (uint8_t *)&v13, 0x12u);
  }
  v7 = [*(id *)(a1 + 32) audioStream];
  int v8 = [v7 isStreaming];

  if (v8)
  {
    v9 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      v14 = "-[CSCommandControlListener CSXPCClient:didDisconnect:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_DEFAULT, "%s Calling didStopUnexpectedly", (uint8_t *)&v13, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      [v12 commandControlListener:*(void *)(a1 + 32) didStopUnexpectedly:1];
    }
  }
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__CSCommandControlListener_audioStreamProvider_audioBufferAvailable___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __69__CSCommandControlListener_audioStreamProvider_audioBufferAvailable___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  char v3 = objc_opt_respondsToSelector();

  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) dataForChannel:0];
    objc_msgSend(v8, "commandControlListener:hasLPCMBufferAvailable:hostTime:", v4, v5, objc_msgSend(*(id *)(a1 + 40), "hostTime"));
  }
  else
  {
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      return;
    }
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    uint64_t v7 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) dataForChannel:0];
    [v8 commandControlListener:v7 hasLPCMBufferAvailable:v5];
  }
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__CSCommandControlListener_audioStreamProvider_didStopStreamUnexpectedly___block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __74__CSCommandControlListener_audioStreamProvider_didStopStreamUnexpectedly___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[CSCommandControlListener audioStreamProvider:didStopStreamUnexpectedly:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Calling didStopUnexpectedly", (uint8_t *)&v6, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v5 commandControlListener:*(void *)(a1 + 32) didStopUnexpectedly:1];
  }
}

- (void)stopListenWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v15 = "-[CSCommandControlListener stopListenWithCompletion:]";
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Stopping stopListenWithCompletion", buf, 0xCu);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__CSCommandControlListener_stopListenWithCompletion___block_invoke;
  v12[3] = &unk_1E658D328;
  id v13 = v4;
  id v6 = v4;
  uint64_t v7 = (void *)MEMORY[0x1CB785210](v12);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CSCommandControlListener_stopListenWithCompletion___block_invoke_8;
  block[3] = &unk_1E658D3A0;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, block);
}

void __53__CSCommandControlListener_stopListenWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[CSCommandControlListener stopListenWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s Calling didStop of CSCommandControlListener", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

void __53__CSCommandControlListener_stopListenWithCompletion___block_invoke_8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) audioStream];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) audioStream];
    [v4 stopAudioStreamWithOption:0 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1151 userInfo:0];
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

- (void)_startRequestWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __56__CSCommandControlListener__startRequestWithCompletion___block_invoke;
  v22[3] = &unk_1E658D328;
  id v5 = v4;
  id v23 = v5;
  id v6 = (void (**)(void, void, void))MEMORY[0x1CB785210](v22);
  audioStreamProvider = self->_audioStreamProvider;
  if (audioStreamProvider)
  {
    int v8 = (void *)MEMORY[0x1E4F5D240];
    id v9 = [MEMORY[0x1E4F5D1E8] contextForBuiltInVoiceTrigger];
    uint64_t v10 = [v8 defaultRequestWithContext:v9];
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v21 = 0;
    id v13 = [(CSAudioStreamProviding *)audioStreamProvider audioStreamWithRequest:v10 streamName:v12 error:&v21];
    id v14 = v21;

    if (v13)
    {
      [(CSCommandControlListener *)self setAudioStream:v13];
      [v13 setDelegate:self];
      __int16 v15 = [MEMORY[0x1E4F5D218] noAlertOption];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __56__CSCommandControlListener__startRequestWithCompletion___block_invoke_7;
      v19[3] = &unk_1E658D328;
      v20 = v6;
      [v13 startAudioStreamWithOption:v15 completion:v19];
    }
    else
    {
      uint64_t v16 = (void *)*MEMORY[0x1E4F5D180];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = v16;
        v18 = [v14 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v25 = "-[CSCommandControlListener _startRequestWithCompletion:]";
        __int16 v26 = 2114;
        v27 = v18;
        _os_log_error_impl(&dword_1C9338000, v17, OS_LOG_TYPE_ERROR, "%s AudioStreamRequest has failed : %{public}@", buf, 0x16u);
      }
      ((void (**)(void, void, id))v6)[2](v6, 0, v14);
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1004 userInfo:0];
    ((void (**)(void, void, id))v6)[2](v6, 0, v14);
  }
}

void __56__CSCommandControlListener__startRequestWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[CSCommandControlListener _startRequestWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s Calling didStart of CSCommandControlListener", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

uint64_t __56__CSCommandControlListener__startRequestWithCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startListenWithOption:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "-[CSCommandControlListener startListenWithOption:completion:]";
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s Start Listening for Command Control", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__CSCommandControlListener_startListenWithOption_completion___block_invoke;
  v13[3] = &unk_1E658D328;
  id v14 = v5;
  id v7 = v5;
  int v8 = (void *)MEMORY[0x1CB785210](v13);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CSCommandControlListener_startListenWithOption_completion___block_invoke_2;
  block[3] = &unk_1E658D3A0;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, block);
}

uint64_t __61__CSCommandControlListener_startListenWithOption_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __61__CSCommandControlListener_startListenWithOption_completion___block_invoke_2(uint64_t a1)
{
  v2 = [[CSXPCClient alloc] initWithType:1];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 40) connect];
  id v5 = *(void **)(*(void *)(a1 + 32) + 40);
  id v6 = [MEMORY[0x1E4F5D1E8] contextForBuiltInVoiceTrigger];
  id v12 = 0;
  char v7 = [v5 prepareAudioProviderWithContext:v6 clientType:3 error:&v12];
  id v8 = v12;

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(*(void *)(a1 + 32) + 40));
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    if (v9[3])
    {
      [v9 _startRequestWithCompletion:v10];
    }
    else
    {
      id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1004 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (CSCommandControlListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSCommandControlListener;
  v2 = [(CSCommandControlListener *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSCommandControlListener", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end