@interface CSEndpointerXPCClient
- (CSEndpointerMetrics)cachedMetrics;
- (CSEndpointerXPCClient)init;
- (NSString)requestId;
- (NSXPCConnection)endpointerConnection;
- (OS_dispatch_queue)xpcClientQueue;
- (OS_dispatch_queue)xpcConnectionQueue;
- (OS_dispatch_queue)xpcDelegateQueue;
- (double)postVoiceTriggerSilence;
- (id)_getRemoteServiceProxyObject;
- (id)_getSerialQueueWithName:(id)a3 targetQueue:(id)a4;
- (id)activeEndpointer;
- (id)cachedEndpointerMetrics;
- (id)endpointerDelegate;
- (id)endpointerImplDelegate;
- (id)endpointerModelVersion;
- (id)remoteObjectProxy;
- (unint64_t)endPointAnalyzerType;
- (void)_createClientConnection;
- (void)_deliverHardEndpointDetectedAtTime:(double)a3 withMetrics:(id)a4;
- (void)dealloc;
- (void)didDetectHardEndpointAtTime:(double)a3 withMetrics:(id)a4;
- (void)didDetectStartpointAtTime:(double)a3;
- (void)didDetectTwoShotAtTime:(double)a3;
- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4;
- (void)recordingStoppedForReason:(int64_t)a3;
- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 recordOption:(id)a5 voiceTriggerInfo:(id)a6;
- (void)resetForVoiceTriggerTwoShotWithSampleRate:(unint64_t)a3;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setActiveEndpointer:(id)a3;
- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3;
- (void)setCachedMetrics:(id)a3;
- (void)setEndWaitTime:(double)a3;
- (void)setEndpointerConnection:(id)a3;
- (void)setEndpointerDelegate:(id)a3;
- (void)setEndpointerImplDelegate:(id)a3;
- (void)setEndpointerOperationMode:(int64_t)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setStartWaitTime:(double)a3;
- (void)setXpcClientQueue:(id)a3;
- (void)setXpcConnectionQueue:(id)a3;
- (void)setXpcDelegateQueue:(id)a3;
- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4;
- (void)updateEndpointerDelayedTrigger:(BOOL)a3;
- (void)updateEndpointerThreshold:(float)a3;
@end

@implementation CSEndpointerXPCClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_cachedMetrics, 0);
  objc_storeStrong(&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_xpcDelegateQueue, 0);
  objc_storeStrong((id *)&self->_xpcClientQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_endpointerConnection, 0);
  objc_destroyWeak((id *)&self->_activeEndpointer);
  objc_destroyWeak((id *)&self->_endpointerImplDelegate);
  objc_destroyWeak((id *)&self->_endpointerDelegate);
}

- (void)setRequestId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setCachedMetrics:(id)a3
{
}

- (CSEndpointerMetrics)cachedMetrics
{
  return self->_cachedMetrics;
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (id)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)setXpcDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)xpcDelegateQueue
{
  return self->_xpcDelegateQueue;
}

- (void)setXpcClientQueue:(id)a3
{
}

- (OS_dispatch_queue)xpcClientQueue
{
  return self->_xpcClientQueue;
}

- (void)setXpcConnectionQueue:(id)a3
{
}

- (OS_dispatch_queue)xpcConnectionQueue
{
  return self->_xpcConnectionQueue;
}

- (void)setEndpointerConnection:(id)a3
{
}

- (NSXPCConnection)endpointerConnection
{
  return self->_endpointerConnection;
}

- (void)setActiveEndpointer:(id)a3
{
}

- (id)activeEndpointer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeEndpointer);
  return WeakRetained;
}

- (void)setEndpointerImplDelegate:(id)a3
{
}

- (id)endpointerImplDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerImplDelegate);
  return WeakRetained;
}

- (void)setEndpointerDelegate:(id)a3
{
}

- (id)endpointerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
  return WeakRetained;
}

- (void)didDetectTwoShotAtTime:(double)a3
{
  xpcDelegateQueue = self->_xpcDelegateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__CSEndpointerXPCClient_didDetectTwoShotAtTime___block_invoke;
  v4[3] = &unk_1E658D3C8;
  *(double *)&v4[5] = a3;
  v4[4] = self;
  dispatch_async(xpcDelegateQueue, v4);
}

void __48__CSEndpointerXPCClient_didDetectTwoShotAtTime___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D160];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D160], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v10 = 136315394;
    v11 = "-[CSEndpointerXPCClient didDetectTwoShotAtTime:]_block_invoke";
    __int16 v12 = 2048;
    uint64_t v13 = v3;
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Endpointer didDetectTwoShotAtTime %f", (uint8_t *)&v10, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
      id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
      [v8 endpointer:v9 detectedTwoShotAtTime:*(double *)(a1 + 40)];
    }
  }
}

- (void)_deliverHardEndpointDetectedAtTime:(double)a3 withMetrics:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  char v7 = *MEMORY[0x1E4F5D160];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D160], OS_LOG_TYPE_DEFAULT))
  {
    requestId = self->_requestId;
    int v14 = 136315906;
    v15 = "-[CSEndpointerXPCClient _deliverHardEndpointDetectedAtTime:withMetrics:]";
    __int16 v16 = 2048;
    double v17 = a3;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    v21 = requestId;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s Endpointer didDetectHardEndpointAtTime %f withMetrics %@, current requestId %@", (uint8_t *)&v14, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
  if (WeakRetained)
  {
    int v10 = WeakRetained;
    id v11 = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
      [v13 endpointer:self didDetectHardEndpointAtTime:v6 withMetrics:a3];
    }
  }
}

- (void)didDetectHardEndpointAtTime:(double)a3 withMetrics:(id)a4
{
  id v6 = a4;
  xpcDelegateQueue = self->_xpcDelegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CSEndpointerXPCClient_didDetectHardEndpointAtTime_withMetrics___block_invoke;
  block[3] = &unk_1E658CEC8;
  block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_async(xpcDelegateQueue, block);
}

void __65__CSEndpointerXPCClient_didDetectHardEndpointAtTime_withMetrics___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 136);
  uint64_t v3 = [*(id *)(a1 + 40) requestId];
  LODWORD(v2) = [v2 isEqualToString:v3];

  if (v2)
  {
    [*(id *)(a1 + 32) _deliverHardEndpointDetectedAtTime:*(void *)(a1 + 40) withMetrics:*(double *)(a1 + 48)];
  }
  else
  {
    v4 = (void *)*MEMORY[0x1E4F5D160];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D160], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 40);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 136);
      char v7 = v4;
      id v8 = [v5 requestId];
      int v9 = 136315650;
      id v10 = "-[CSEndpointerXPCClient didDetectHardEndpointAtTime:withMetrics:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      int v14 = v8;
      _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s Do not deliver hardEndpoint right away since current requestId (%@) is not matching the event to fire (%@)", (uint8_t *)&v9, 0x20u);
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), *(id *)(a1 + 40));
}

- (void)didDetectStartpointAtTime:(double)a3
{
  xpcDelegateQueue = self->_xpcDelegateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__CSEndpointerXPCClient_didDetectStartpointAtTime___block_invoke;
  v4[3] = &unk_1E658D3C8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(xpcDelegateQueue, v4);
}

void __51__CSEndpointerXPCClient_didDetectStartpointAtTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
      [v6 endpointer:*(void *)(a1 + 32) didDetectStartpointAtTime:*(double *)(a1 + 40)];
    }
  }
}

- (void)_createClientConnection
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.corespeech.corespeechd.endpointer.service" options:0];
  endpointerConnection = self->_endpointerConnection;
  self->_endpointerConnection = v3;

  char v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2405AF8];
  [(NSXPCConnection *)self->_endpointerConnection setRemoteObjectInterface:v5];

  id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F23D9ED8];
  char v7 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  int v9 = [v7 setWithArray:v8];
  [v6 setClasses:v9 forSelector:sel_didDetectHardEndpointAtTime_withMetrics_ argumentIndex:1 ofReply:0];

  [(NSXPCConnection *)self->_endpointerConnection setExportedInterface:v6];
  [(NSXPCConnection *)self->_endpointerConnection setExportedObject:self];
  [(NSXPCConnection *)self->_endpointerConnection _setQueue:self->_xpcConnectionQueue];
  objc_initWeak(&location, self);
  id v10 = self->_endpointerConnection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__CSEndpointerXPCClient__createClientConnection__block_invoke;
  v14[3] = &unk_1E658C420;
  objc_copyWeak(&v15, &location);
  [(NSXPCConnection *)v10 setInterruptionHandler:v14];
  __int16 v11 = self->_endpointerConnection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__CSEndpointerXPCClient__createClientConnection__block_invoke_2;
  v12[3] = &unk_1E658C420;
  objc_copyWeak(&v13, &location);
  [(NSXPCConnection *)v11 setInvalidationHandler:v12];
  [(NSXPCConnection *)self->_endpointerConnection resume];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __48__CSEndpointerXPCClient__createClientConnection__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E4F5D160];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D160], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    id v4 = [WeakRetained endpointerConnection];
    char v5 = [WeakRetained endpointerConnection];
    *(_DWORD *)buf = 136315650;
    id v10 = "-[CSEndpointerXPCClient _createClientConnection]_block_invoke";
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    __int16 v13 = 1026;
    int v14 = [v5 processIdentifier];
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Interruption Handler: %{public}@, client PID: %{public}d)", buf, 0x1Cu);
  }
  if (WeakRetained)
  {
    id v6 = [WeakRetained endpointerConnection];

    if (v6)
    {
      char v7 = [WeakRetained xpcConnectionQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__CSEndpointerXPCClient__createClientConnection__block_invoke_58;
      block[3] = &unk_1E658D4D8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);
    }
  }
}

void __48__CSEndpointerXPCClient__createClientConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E4F5D160];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D160], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    id v4 = [WeakRetained endpointerConnection];
    char v5 = [WeakRetained endpointerConnection];
    *(_DWORD *)buf = 136315650;
    id v10 = "-[CSEndpointerXPCClient _createClientConnection]_block_invoke_2";
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    __int16 v13 = 1026;
    int v14 = [v5 processIdentifier];
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Invalidation Handler: %{public}@, client PID: %{public}d exited", buf, 0x1Cu);
  }
  if (WeakRetained)
  {
    id v6 = [WeakRetained endpointerConnection];

    if (v6)
    {
      char v7 = [WeakRetained xpcConnectionQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__CSEndpointerXPCClient__createClientConnection__block_invoke_59;
      block[3] = &unk_1E658D4D8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);
    }
  }
}

uint64_t __48__CSEndpointerXPCClient__createClientConnection__block_invoke_59(uint64_t a1)
{
  [*(id *)(a1 + 32) setEndpointerConnection:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setRemoteObjectProxy:0];
}

uint64_t __48__CSEndpointerXPCClient__createClientConnection__block_invoke_58(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) endpointerConnection];
  [v2 invalidate];

  [*(id *)(a1 + 32) setEndpointerConnection:0];
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setRemoteObjectProxy:0];
}

- (id)_getRemoteServiceProxyObject
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id remoteObjectProxy = self->_remoteObjectProxy;
  if (!remoteObjectProxy || !self->_endpointerConnection)
  {
    id v4 = (os_log_t *)MEMORY[0x1E4F5D160];
    char v5 = *MEMORY[0x1E4F5D160];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D160], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v14 = "-[CSEndpointerXPCClient _getRemoteServiceProxyObject]";
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Creating RemoteServiceProxy", buf, 0xCu);
    }
    endpointerConnection = self->_endpointerConnection;
    if (endpointerConnection
      || ([(CSEndpointerXPCClient *)self _createClientConnection],
          (endpointerConnection = self->_endpointerConnection) != 0))
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __53__CSEndpointerXPCClient__getRemoteServiceProxyObject__block_invoke;
      v12[3] = &unk_1E658C9D8;
      void v12[4] = self;
      char v7 = [(NSXPCConnection *)endpointerConnection synchronousRemoteObjectProxyWithErrorHandler:v12];
      id v8 = self->_remoteObjectProxy;
      self->_id remoteObjectProxy = v7;
    }
    else
    {
      __int16 v11 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        int v14 = "-[CSEndpointerXPCClient _getRemoteServiceProxyObject]";
        _os_log_error_impl(&dword_1C9338000, v11, OS_LOG_TYPE_ERROR, "%s ERR: Endpointer endpointerConnection is nil", buf, 0xCu);
      }
      id v8 = self->_remoteObjectProxy;
      self->_id remoteObjectProxy = 0;
    }

    id remoteObjectProxy = self->_remoteObjectProxy;
  }
  id v9 = remoteObjectProxy;
  return v9;
}

void __53__CSEndpointerXPCClient__getRemoteServiceProxyObject__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)*MEMORY[0x1E4F5D160];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D160], OS_LOG_TYPE_ERROR))
    {
      char v7 = v4;
      uint64_t v8 = [v3 code];
      id v9 = [v3 localizedDescription];
      int v10 = 136315650;
      __int16 v11 = "-[CSEndpointerXPCClient _getRemoteServiceProxyObject]_block_invoke";
      __int16 v12 = 2050;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_error_impl(&dword_1C9338000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Endpointer Remote Object Proxy returned error : %{public}ld (%{public}@)", (uint8_t *)&v10, 0x20u);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = 0;
  }
}

- (void)recordingStoppedForReason:(int64_t)a3
{
  xpcDelegateQueue = self->_xpcDelegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CSEndpointerXPCClient_recordingStoppedForReason___block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(xpcDelegateQueue, block);
}

void __51__CSEndpointerXPCClient_recordingStoppedForReason___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 128);
  *(void *)(v1 + 128) = 0;
}

- (id)cachedEndpointerMetrics
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__7345;
  int v10 = __Block_byref_object_dispose__7346;
  id v11 = 0;
  xpcDelegateQueue = self->_xpcDelegateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__CSEndpointerXPCClient_cachedEndpointerMetrics__block_invoke;
  v5[3] = &unk_1E658D438;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(xpcDelegateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__CSEndpointerXPCClient_cachedEndpointerMetrics__block_invoke(uint64_t a1)
{
}

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 recordOption:(id)a5 voiceTriggerInfo:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  xpcDelegateQueue = self->_xpcDelegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__CSEndpointerXPCClient_resetForNewRequestWithSampleRate_recordContext_recordOption_voiceTriggerInfo___block_invoke;
  block[3] = &unk_1E658D3F0;
  block[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(xpcDelegateQueue, block);
  xpcClientQueue = self->_xpcClientQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__CSEndpointerXPCClient_resetForNewRequestWithSampleRate_recordContext_recordOption_voiceTriggerInfo___block_invoke_14;
  v14[3] = &unk_1E658D4D8;
  void v14[4] = self;
  dispatch_async(xpcClientQueue, v14);
}

void __102__CSEndpointerXPCClient_resetForNewRequestWithSampleRate_recordContext_recordOption_voiceTriggerInfo___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 40) siriSessionUUID];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 136);
  *(void *)(v3 + 136) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 128);
  if (v6)
  {
    char v7 = *(void **)(v5 + 136);
    id v13 = [v6 requestId];
    if (objc_msgSend(v7, "isEqualToString:"))
    {
      int v8 = [*(id *)(a1 + 48) isContinuousConversation];

      if (v8)
      {
        id v9 = *MEMORY[0x1E4F5D160];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D160], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 136);
          *(_DWORD *)buf = 136315394;
          uint64_t v15 = "-[CSEndpointerXPCClient resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:]_block_invoke";
          __int16 v16 = 2112;
          uint64_t v17 = v10;
          _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_DEFAULT, "%s Deliver cached endpointer event for requestId %@", buf, 0x16u);
        }
        id v11 = *(id **)(a1 + 32);
        [v11[16] totalAudioRecorded];
        [v11 _deliverHardEndpointDetectedAtTime:*(void *)(*(void *)(a1 + 32) + 128) withMetrics:v12 / 1000.0];
      }
    }
    else
    {
    }
  }
}

void __102__CSEndpointerXPCClient_resetForNewRequestWithSampleRate_recordContext_recordOption_voiceTriggerInfo___block_invoke_14(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  [v1 setupConnection];
}

- (void)setEndpointerOperationMode:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F5D160];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D160], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[CSEndpointerXPCClient setEndpointerOperationMode:]";
    _os_log_debug_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  xpcClientQueue = self->_xpcClientQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CSEndpointerXPCClient_setEndpointerOperationMode___block_invoke;
  v7[3] = &unk_1E658D3C8;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(xpcClientQueue, v7);
}

void __52__CSEndpointerXPCClient_setEndpointerOperationMode___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)*MEMORY[0x1E4F5D160];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D160], OS_LOG_TYPE_DEBUG))
  {
    id v4 = v2;
    uint64_t v5 = AFSpeechEndpointerOperationModeGetName();
    int v6 = 136315394;
    char v7 = "-[CSEndpointerXPCClient setEndpointerOperationMode:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_debug_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEBUG, "%s endpointerOperationMode = %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v3 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  [v3 setEndpointerOperationMode:*(void *)(a1 + 40)];
}

- (void)resetForVoiceTriggerTwoShotWithSampleRate:(unint64_t)a3
{
  xpcClientQueue = self->_xpcClientQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__CSEndpointerXPCClient_resetForVoiceTriggerTwoShotWithSampleRate___block_invoke;
  v4[3] = &unk_1E658D3C8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(xpcClientQueue, v4);
}

void __67__CSEndpointerXPCClient_resetForVoiceTriggerTwoShotWithSampleRate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  [v2 resetForVoiceTriggerTwoShotWithSampleRate:*(void *)(a1 + 40)];
}

- (unint64_t)endPointAnalyzerType
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x3032000000;
  __int16 v14 = __Block_byref_object_copy__7345;
  xpcClientQueue = self->_xpcClientQueue;
  uint64_t v15 = __Block_byref_object_dispose__7346;
  id v16 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CSEndpointerXPCClient_endPointAnalyzerType__block_invoke;
  block[3] = &unk_1E658C148;
  block[4] = self;
  void block[5] = &v17;
  block[6] = &v11;
  dispatch_async_and_wait(xpcClientQueue, block);
  uint64_t v5 = v12;
  if (v12[5])
  {
    int v6 = (id)*MEMORY[0x1E4F5D160];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      [(id)v5[5] timeIntervalSinceDate:v3];
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "-[CSEndpointerXPCClient endPointAnalyzerType]";
      __int16 v23 = 2050;
      uint64_t v24 = v7;
      _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s elapsed time = %{public}lf", buf, 0x16u);
    }
  }
  unint64_t v8 = v18[3];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __45__CSEndpointerXPCClient_endPointAnalyzerType__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__CSEndpointerXPCClient_endPointAnalyzerType__block_invoke_2;
  v3[3] = &unk_1E658A158;
  long long v4 = *(_OWORD *)(a1 + 40);
  [v2 getEndPointAnalyzerTypeWithReply:v3];
}

void __45__CSEndpointerXPCClient_endPointAnalyzerType__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    int v6 = *MEMORY[0x1E4F5D160];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D160], OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[CSEndpointerXPCClient endPointAnalyzerType]_block_invoke_2";
      _os_log_error_impl(&dword_1C9338000, v6, OS_LOG_TYPE_ERROR, "%s Endpointer Failed to get endPointAnalyzerType", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (double)postVoiceTriggerSilence
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  uint64_t v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  __int16 v14 = __Block_byref_object_copy__7345;
  xpcClientQueue = self->_xpcClientQueue;
  uint64_t v15 = __Block_byref_object_dispose__7346;
  id v16 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CSEndpointerXPCClient_postVoiceTriggerSilence__block_invoke;
  block[3] = &unk_1E658C148;
  block[4] = self;
  void block[5] = &v17;
  block[6] = &v11;
  dispatch_async_and_wait(xpcClientQueue, block);
  id v5 = v12;
  if (v12[5])
  {
    int v6 = (id)*MEMORY[0x1E4F5D160];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      [(id)v5[5] timeIntervalSinceDate:v3];
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "-[CSEndpointerXPCClient postVoiceTriggerSilence]";
      __int16 v23 = 2050;
      uint64_t v24 = v7;
      _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s elapsed time = %{public}lf", buf, 0x16u);
    }
  }
  double v8 = v18[3];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __48__CSEndpointerXPCClient_postVoiceTriggerSilence__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__CSEndpointerXPCClient_postVoiceTriggerSilence__block_invoke_2;
  v3[3] = &unk_1E658A130;
  long long v4 = *(_OWORD *)(a1 + 40);
  [v2 getPostVoiceTriggerSilenceWithReply:v3];
}

void __48__CSEndpointerXPCClient_postVoiceTriggerSilence__block_invoke_2(uint64_t a1, void *a2, double a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    int v6 = *MEMORY[0x1E4F5D160];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D160], OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[CSEndpointerXPCClient postVoiceTriggerSilence]_block_invoke_2";
      _os_log_error_impl(&dword_1C9338000, v6, OS_LOG_TYPE_ERROR, "%s Endpointer Failed to get postVoiceTriggerSilence", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4
{
  id v6 = a4;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__CSEndpointerXPCClient_shouldAcceptEagerResultForDuration_resultsCompletionHandler___block_invoke;
  block[3] = &unk_1E658BD88;
  double v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(xpcClientQueue, block);
}

void __85__CSEndpointerXPCClient_shouldAcceptEagerResultForDuration_resultsCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  [v2 shouldAcceptEagerResultForDuration:*(void *)(a1 + 40) resultsCompletionHandler:*(double *)(a1 + 48)];
}

- (void)updateEndpointerDelayedTrigger:(BOOL)a3
{
  xpcClientQueue = self->_xpcClientQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__CSEndpointerXPCClient_updateEndpointerDelayedTrigger___block_invoke;
  v4[3] = &unk_1E658C870;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(xpcClientQueue, v4);
}

void __56__CSEndpointerXPCClient_updateEndpointerDelayedTrigger___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  [v2 updateEndpointerDelayedTrigger:*(unsigned __int8 *)(a1 + 40)];
}

- (void)updateEndpointerThreshold:(float)a3
{
  xpcClientQueue = self->_xpcClientQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__CSEndpointerXPCClient_updateEndpointerThreshold___block_invoke;
  v4[3] = &unk_1E658BDD8;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(xpcClientQueue, v4);
}

void __51__CSEndpointerXPCClient_updateEndpointerThreshold___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 updateEndpointerThreshold:v2];
}

- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4
{
  id v6 = a3;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CSEndpointerXPCClient_processASRFeatures_fromServer___block_invoke;
  block[3] = &unk_1E658CC58;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(xpcClientQueue, block);
}

void __55__CSEndpointerXPCClient_processASRFeatures_fromServer___block_invoke(uint64_t a1)
{
  id v12 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  uint64_t v2 = [*(id *)(a1 + 40) wordCount];
  uint64_t v3 = [*(id *)(a1 + 40) trailingSilenceDuration];
  [*(id *)(a1 + 40) eosLikelihood];
  double v5 = v4;
  id v6 = [*(id *)(a1 + 40) pauseCounts];
  [*(id *)(a1 + 40) silencePosterior];
  double v8 = v7;
  id v9 = [*(id *)(a1 + 40) taskName];
  uint64_t v10 = [*(id *)(a1 + 40) processedAudioDurationInMilliseconds];
  [*(id *)(a1 + 40) acousticEndpointerScore];
  [v12 processASRFeaturesWithWordCount:v2 trailingSilenceDuration:v3 eosLikelihood:v6 pauseCounts:v9 silencePosterior:v10 taskName:*(unsigned __int8 *)(a1 + 48) processedAudioDurationInMilliseconds:v5 acousticEndpointerScore:v8 fromServer:v11];
}

- (id)endpointerModelVersion
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__7345;
  v21 = __Block_byref_object_dispose__7346;
  id v22 = 0;
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  __int16 v14 = __Block_byref_object_copy__7345;
  xpcClientQueue = self->_xpcClientQueue;
  uint64_t v15 = __Block_byref_object_dispose__7346;
  id v16 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CSEndpointerXPCClient_endpointerModelVersion__block_invoke;
  block[3] = &unk_1E658C148;
  block[4] = self;
  void block[5] = &v17;
  block[6] = &v11;
  dispatch_async_and_wait(xpcClientQueue, block);
  double v5 = v12;
  if (v12[5])
  {
    id v6 = (id)*MEMORY[0x1E4F5D160];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      [(id)v5[5] timeIntervalSinceDate:v3];
      *(_DWORD *)buf = 136315394;
      uint64_t v24 = "-[CSEndpointerXPCClient endpointerModelVersion]";
      __int16 v25 = 2050;
      uint64_t v26 = v7;
      _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s elapsed time = %{public}lf", buf, 0x16u);
    }
  }
  id v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __47__CSEndpointerXPCClient_endpointerModelVersion__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__CSEndpointerXPCClient_endpointerModelVersion__block_invoke_2;
  v3[3] = &unk_1E658A108;
  long long v4 = *(_OWORD *)(a1 + 40);
  [v2 getEndpointerModelVersionWithReply:v3];
}

void __47__CSEndpointerXPCClient_endpointerModelVersion__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *MEMORY[0x1E4F5D160];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D160], OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      id v12 = "-[CSEndpointerXPCClient endpointerModelVersion]_block_invoke_2";
      _os_log_error_impl(&dword_1C9338000, v7, OS_LOG_TYPE_ERROR, "%s Endpointer Failed to get epVersion", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3
{
  xpcClientQueue = self->_xpcClientQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__CSEndpointerXPCClient_setAutomaticEndpointingSuspensionEndTime___block_invoke;
  v4[3] = &unk_1E658D3C8;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(xpcClientQueue, v4);
}

void __66__CSEndpointerXPCClient_setAutomaticEndpointingSuspensionEndTime___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  [v2 setAutomaticEndpointingSuspensionEndTime:*(double *)(a1 + 40)];
}

- (void)setEndWaitTime:(double)a3
{
  xpcClientQueue = self->_xpcClientQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__CSEndpointerXPCClient_setEndWaitTime___block_invoke;
  v4[3] = &unk_1E658D3C8;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(xpcClientQueue, v4);
}

void __40__CSEndpointerXPCClient_setEndWaitTime___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  [v2 setEndWaitTime:*(double *)(a1 + 40)];
}

- (void)setStartWaitTime:(double)a3
{
  xpcClientQueue = self->_xpcClientQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__CSEndpointerXPCClient_setStartWaitTime___block_invoke;
  v4[3] = &unk_1E658D3C8;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(xpcClientQueue, v4);
}

void __42__CSEndpointerXPCClient_setStartWaitTime___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  [v2 setStartWaitTime:*(double *)(a1 + 40)];
}

- (void)setActiveChannel:(unint64_t)a3
{
  xpcClientQueue = self->_xpcClientQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__CSEndpointerXPCClient_setActiveChannel___block_invoke;
  v4[3] = &unk_1E658D3C8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(xpcClientQueue, v4);
}

void __42__CSEndpointerXPCClient_setActiveChannel___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  [v2 setActiveChannel:*(void *)(a1 + 40)];
}

- (id)_getSerialQueueWithName:(id)a3 targetQueue:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    uint64_t v6 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)[a3 UTF8String], 0, v5);
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F5D450] getSerialQueueWithQOS:33 name:a3 fixedPriority:*MEMORY[0x1E4F5D4E8]];
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_endpointerConnection invalidate];
  endpointerConnection = self->_endpointerConnection;
  self->_endpointerConnection = 0;

  v4.receiver = self;
  v4.super_class = (Class)CSEndpointerXPCClient;
  [(CSEndpointerXPCClient *)&v4 dealloc];
}

- (CSEndpointerXPCClient)init
{
  v11.receiver = self;
  v11.super_class = (Class)CSEndpointerXPCClient;
  id v2 = [(CSEndpointerProxy *)&v11 init];
  if (v2)
  {
    CSLogInitIfNeeded();
    if ([MEMORY[0x1E4F5D450] supportsDispatchWorkloop])
    {
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = [MEMORY[0x1E4F5D450] rootQueueWithFixedPriority:*MEMORY[0x1E4F5D4E8]];
    }
    uint64_t v4 = [(CSEndpointerXPCClient *)v2 _getSerialQueueWithName:@"com.apple.corespeech.endpointer.xpc.client" targetQueue:v3];
    xpcClientQueue = v2->_xpcClientQueue;
    v2->_xpcClientQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [(CSEndpointerXPCClient *)v2 _getSerialQueueWithName:@"com.apple.corespeech.endpointer.xpc.connection" targetQueue:v3];
    xpcConnectionQueue = v2->_xpcConnectionQueue;
    v2->_xpcConnectionQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [(CSEndpointerXPCClient *)v2 _getSerialQueueWithName:@"com.apple.corespeech.endpointer.xpc.delegate" targetQueue:v3];
    xpcDelegateQueue = v2->_xpcDelegateQueue;
    v2->_xpcDelegateQueue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

@end