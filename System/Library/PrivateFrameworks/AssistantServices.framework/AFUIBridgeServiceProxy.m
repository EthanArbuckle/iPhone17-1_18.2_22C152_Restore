@interface AFUIBridgeServiceProxy
- (AFUIBridgeClient)client;
- (AFUIBridgeServiceProxy)initWithClient:(id)a3;
- (void)setClient:(id)a3;
- (void)uiBridgeServiceDetectedSiriDirectedSpeech;
- (void)uiBridgeServiceDetectedSpeechStart;
- (void)uiBridgeServiceDetectedSpeechStart:(BOOL)a3;
- (void)uiBridgeServiceDidStart;
- (void)uiBridgeServiceDidStartAttending;
- (void)uiBridgeServiceDidStartAttendingWithRootRequestId:(id)a3;
- (void)uiBridgeServiceDidStopAttendingUnexpectedlyWithReason:(unint64_t)a3;
- (void)uiBridgeServiceReceivedShowAssetsDownloadPrompt;
- (void)uiBridgeServiceReceivedSpeechMitigationResult:(unint64_t)a3;
- (void)uiBridgeServiceWillStartAttending;
@end

@implementation AFUIBridgeServiceProxy

- (void).cxx_destruct
{
}

- (void)setClient:(id)a3
{
}

- (AFUIBridgeClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  return (AFUIBridgeClient *)WeakRetained;
}

- (void)uiBridgeServiceReceivedShowAssetsDownloadPrompt
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_client = &self->_client;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_client);
    v6 = [v5 delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__AFUIBridgeServiceProxy_uiBridgeServiceReceivedShowAssetsDownloadPrompt__block_invoke;
    block[3] = &unk_1E592C678;
    block[4] = self;
    dispatch_async(v6, block);
  }
  else
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFUIBridgeServiceProxy uiBridgeServiceReceivedShowAssetsDownloadPrompt]";
      _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

void __73__AFUIBridgeServiceProxy_uiBridgeServiceReceivedShowAssetsDownloadPrompt__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v1 = [WeakRetained delegate];
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    v3 = [WeakRetained delegate];
    [v3 uiBridgeClientReceivedShowAssetsDownloadPrompt:WeakRetained];
  }
}

- (void)uiBridgeServiceReceivedSpeechMitigationResult:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_client = &self->_client;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_client);
    v8 = [v7 delegateQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__AFUIBridgeServiceProxy_uiBridgeServiceReceivedSpeechMitigationResult___block_invoke;
    v10[3] = &unk_1E592B398;
    v10[4] = self;
    v10[5] = a3;
    dispatch_async(v8, v10);
  }
  else
  {
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[AFUIBridgeServiceProxy uiBridgeServiceReceivedSpeechMitigationResult:]";
      _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

void __72__AFUIBridgeServiceProxy_uiBridgeServiceReceivedSpeechMitigationResult___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  char v2 = [WeakRetained delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    v4 = [WeakRetained delegate];
    [v4 uiBridgeClient:WeakRetained receivedSpeechMitigationResult:*(void *)(a1 + 40)];
  }
}

- (void)uiBridgeServiceDetectedSpeechStart:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_client = &self->_client;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_client);
    v8 = [v7 delegateQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__AFUIBridgeServiceProxy_uiBridgeServiceDetectedSpeechStart___block_invoke;
    v10[3] = &unk_1E592AEA0;
    v10[4] = self;
    BOOL v11 = a3;
    dispatch_async(v8, v10);
  }
  else
  {
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[AFUIBridgeServiceProxy uiBridgeServiceDetectedSpeechStart:]";
      _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

void __61__AFUIBridgeServiceProxy_uiBridgeServiceDetectedSpeechStart___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  char v2 = [WeakRetained delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    v4 = [WeakRetained delegate];
    [v4 uiBridgeClient:WeakRetained detectedSpeechStartWithShouldDuckTTS:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)uiBridgeServiceDetectedSpeechStart
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_client = &self->_client;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_client);
    v6 = [v5 delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__AFUIBridgeServiceProxy_uiBridgeServiceDetectedSpeechStart__block_invoke;
    block[3] = &unk_1E592C678;
    block[4] = self;
    dispatch_async(v6, block);
  }
  else
  {
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFUIBridgeServiceProxy uiBridgeServiceDetectedSpeechStart]";
      _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

void __60__AFUIBridgeServiceProxy_uiBridgeServiceDetectedSpeechStart__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v1 = [WeakRetained delegate];
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    char v3 = [WeakRetained delegate];
    [v3 uiBridgeClientDetectedSpeechStart:WeakRetained];
  }
}

- (void)uiBridgeServiceDetectedSiriDirectedSpeech
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_client = &self->_client;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_client);
    v6 = [v5 delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__AFUIBridgeServiceProxy_uiBridgeServiceDetectedSiriDirectedSpeech__block_invoke;
    block[3] = &unk_1E592C678;
    block[4] = self;
    dispatch_async(v6, block);
  }
  else
  {
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFUIBridgeServiceProxy uiBridgeServiceDetectedSiriDirectedSpeech]";
      _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

void __67__AFUIBridgeServiceProxy_uiBridgeServiceDetectedSiriDirectedSpeech__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v1 = [WeakRetained delegate];
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    char v3 = [WeakRetained delegate];
    [v3 uiBridgeClientDetectedSiriDirectedSpeech:WeakRetained];
  }
}

- (void)uiBridgeServiceDidStopAttendingUnexpectedlyWithReason:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_client = &self->_client;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_client);
    v8 = [v7 delegateQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __80__AFUIBridgeServiceProxy_uiBridgeServiceDidStopAttendingUnexpectedlyWithReason___block_invoke;
    v10[3] = &unk_1E592B398;
    v10[4] = self;
    void v10[5] = a3;
    dispatch_async(v8, v10);
  }
  else
  {
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[AFUIBridgeServiceProxy uiBridgeServiceDidStopAttendingUnexpectedlyWithReason:]";
      _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

void __80__AFUIBridgeServiceProxy_uiBridgeServiceDidStopAttendingUnexpectedlyWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  char v2 = [WeakRetained delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    v4 = [WeakRetained delegate];
    [v4 uiBridgeClient:WeakRetained didStopAttendingUnexpectedlyWithReason:*(void *)(a1 + 40)];
  }
}

- (void)uiBridgeServiceDidStartAttendingWithRootRequestId:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_client);
    id v7 = [v6 delegateQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__AFUIBridgeServiceProxy_uiBridgeServiceDidStartAttendingWithRootRequestId___block_invoke;
    v9[3] = &unk_1E592C710;
    v9[4] = self;
    id v10 = v4;
    dispatch_async(v7, v9);
  }
  else
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[AFUIBridgeServiceProxy uiBridgeServiceDidStartAttendingWithRootRequestId:]";
      _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

void __76__AFUIBridgeServiceProxy_uiBridgeServiceDidStartAttendingWithRootRequestId___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  char v2 = [WeakRetained delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [WeakRetained delegate];
    [v4 uiBridgeClientDidStartAttending:WeakRetained withRootRequestId:*(void *)(a1 + 40)];
  }
}

- (void)uiBridgeServiceDidStartAttending
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_client = &self->_client;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_client);
    id v6 = [v5 delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__AFUIBridgeServiceProxy_uiBridgeServiceDidStartAttending__block_invoke;
    block[3] = &unk_1E592C678;
    block[4] = self;
    dispatch_async(v6, block);
  }
  else
  {
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[AFUIBridgeServiceProxy uiBridgeServiceDidStartAttending]";
      _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

void __58__AFUIBridgeServiceProxy_uiBridgeServiceDidStartAttending__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v1 = [WeakRetained delegate];
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    char v3 = [WeakRetained delegate];
    [v3 uiBridgeClientDidStartAttending:WeakRetained];
  }
}

- (void)uiBridgeServiceDidStart
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_client = &self->_client;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_client);
    id v6 = [v5 delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__AFUIBridgeServiceProxy_uiBridgeServiceDidStart__block_invoke;
    block[3] = &unk_1E592C678;
    block[4] = self;
    dispatch_async(v6, block);
  }
  else
  {
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[AFUIBridgeServiceProxy uiBridgeServiceDidStart]";
      _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

void __49__AFUIBridgeServiceProxy_uiBridgeServiceDidStart__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v1 = [WeakRetained delegate];
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    char v3 = [WeakRetained delegate];
    [v3 uiBridgeClientDidStartAttending:WeakRetained];
  }
}

- (void)uiBridgeServiceWillStartAttending
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_client = &self->_client;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_client);
    id v6 = [v5 delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__AFUIBridgeServiceProxy_uiBridgeServiceWillStartAttending__block_invoke;
    block[3] = &unk_1E592C678;
    block[4] = self;
    dispatch_async(v6, block);
  }
  else
  {
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[AFUIBridgeServiceProxy uiBridgeServiceWillStartAttending]";
      _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

void __59__AFUIBridgeServiceProxy_uiBridgeServiceWillStartAttending__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  char v2 = [WeakRetained delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [WeakRetained delegate];
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v4 uiBridgeClientWillStartAttending:v5];
  }
}

- (AFUIBridgeServiceProxy)initWithClient:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AFUIBridgeServiceProxy;
  id v5 = [(AFUIBridgeServiceProxy *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_client, v4);
  }

  return v6;
}

@end