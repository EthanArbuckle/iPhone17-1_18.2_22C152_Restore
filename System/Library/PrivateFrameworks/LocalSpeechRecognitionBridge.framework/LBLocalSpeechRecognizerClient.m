@interface LBLocalSpeechRecognizerClient
+ (BOOL)isInstalledFromStatusString:(id)a3;
- (BOOL)_shouldSetSpeechEventForRecordType:(int64_t)a3;
- (LBLocalSpeechRecognizerClient)initWithDelegate:(id)a3;
- (LBLocalSpeechRecognizerClient)initWithDelegate:(id)a3 xpcListenerEndpoint:(id)a4 audioCapture:(id)a5;
- (LBLocalSpeechRecognizerClientDelegate)delegate;
- (NSString)requestId;
- (NSString)uuidString;
- (NSString)xpcConnectionUUIDString;
- (id)_connection;
- (id)_newConnection;
- (id)_service;
- (void)_invalidate;
- (void)_stopSpeechRecognitionTaskWithReason:(unint64_t)a3 requestId:(id)a4 shouldInvalidateAfterStop:(BOOL)a5 completion:(id)a6;
- (void)connectToServiceIfNeeded;
- (void)dealloc;
- (void)disableLocalSpeechRecognitionForRequestId:(id)a3;
- (void)invalidate;
- (void)localSpeechServiceDidCompletionRecognitionWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6;
- (void)localSpeechServiceDidDetectedFinalEndpointAtTime:(double)a3;
- (void)localSpeechServiceDidReceiveContinuityEndDetected:(id)a3;
- (void)localSpeechServiceDidReceiveMultiUserTRPCandidatePackage:(id)a3;
- (void)localSpeechServiceDidReceiveTCUStateUpdate:(id)a3;
- (void)localSpeechServiceDidReceiveTRPCandidatePackage:(id)a3;
- (void)localSpeechServiceDidReceiveTRPDetected:(id)a3;
- (void)localSpeechServiceDidReceivedEagerRecognitionCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 speechPackage:(id)a5 duration:(double)a6;
- (void)localSpeechServiceDidReceivedEagerRecognitionCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 speechPackage:(id)a5 duration:(double)a6 metadata:(id)a7;
- (void)localSpeechServiceDidReceivedEagerResultWithRequestId:(id)a3 rcId:(unint64_t)a4 shouldAccept:(BOOL)a5 mitigationSignal:(BOOL)a6 featuresToLog:(id)a7;
- (void)localSpeechServiceDidReceivedFinalResultCandidateWithRequestId:(id)a3 speechPackage:(id)a4;
- (void)localSpeechServiceDidReceivedFinalResultWithRequestId:(id)a3 speechPackage:(id)a4;
- (void)localSpeechServiceDidReceivedFinalResultWithRequestId:(id)a3 speechPackage:(id)a4 metadata:(id)a5;
- (void)localSpeechServiceDidReceivedPartialResultWithRequestId:(id)a3 language:(id)a4 speechPackage:(id)a5 metadata:(id)a6;
- (void)localSpeechServiceDidReceivedPartialResultWithRequestId:(id)a3 language:(id)a4 tokens:(id)a5;
- (void)localSpeechServiceDidReceivedPartialResultWithRequestId:(id)a3 language:(id)a4 tokens:(id)a5 metadata:(id)a6;
- (void)localSpeechServiceDidReceivedVoiceCommandCandidateWithRequestId:(id)a3 speechPackage:(id)a4 metadata:(id)a5;
- (void)localSpeechServiceDidReceivedVoiceIdScoreCard:(id)a3;
- (void)localSpeechServiceRequestAttentionAssetDownload;
- (void)pauseLocalSpeechRecognitionForRequestId:(id)a3;
- (void)preheatLocalSpeechRecognitionWithLanguage:(id)a3 source:(unint64_t)a4;
- (void)resetCacheAndCompileAllAssets;
- (void)resumeLocalRecognitionWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6;
- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLocalSpeechRecognizerClientDelegate:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setUuidString:(id)a3;
- (void)setXpcConnectionUUIDString:(id)a3;
- (void)startSpeechRecognitionResultsWithSettings:(id)a3;
- (void)stopLocalSpeechRecognitionTaskWithReason:(unint64_t)a3;
- (void)stopSpeechRecognitionTaskAndInvalidateWithReason:(unint64_t)a3 requestId:(id)a4 completion:(id)a5;
- (void)stopSpeechRecognitionTaskWithReason:(unint64_t)a3 requestId:(id)a4;
- (void)stopSpeechRecognitionTaskWithReason:(unint64_t)a3 requestId:(id)a4 completion:(id)a5;
- (void)trpCandidateReadyForExecutionForRequestId:(id)a3 withTrpId:(id)a4;
- (void)updateTCUState:(id)a3;
- (void)updateVoiceCommandContextWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6 disambiguationActive:(id)a7 cursorInVisibleText:(id)a8 favorCommandSuppression:(id)a9 abortCommandSuppression:(id)a10 undoEvent:(id)a11;
@end

@implementation LBLocalSpeechRecognizerClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_xpcConnectionUUIDString, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioCapture, 0);
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setRequestId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setXpcConnectionUUIDString:(id)a3
{
}

- (NSString)xpcConnectionUUIDString
{
  return self->_xpcConnectionUUIDString;
}

- (void)setUuidString:(id)a3
{
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setDelegate:(id)a3
{
}

- (LBLocalSpeechRecognizerClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LBLocalSpeechRecognizerClientDelegate *)WeakRetained;
}

- (BOOL)_shouldSetSpeechEventForRecordType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x1C) & (0xED00000u >> a3);
}

- (id)_service
{
  v2 = [(LBLocalSpeechRecognizerClient *)self _connection];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)_connection
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v4 = [MEMORY[0x263F08C38] UUID];
    v5 = [v4 UUIDString];
    xpcConnectionUUIDString = self->_xpcConnectionUUIDString;
    self->_xpcConnectionUUIDString = v5;

    v7 = (void *)LBLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = [(LBLocalSpeechRecognizerClient *)self uuidString];
      v10 = [(LBLocalSpeechRecognizerClient *)self xpcConnectionUUIDString];
      *(_DWORD *)buf = 136315650;
      v29 = "-[LBLocalSpeechRecognizerClient _connection]";
      __int16 v30 = 2112;
      v31 = v9;
      __int16 v32 = 2112;
      v33 = v10;
      _os_log_impl(&dword_21F71B000, v8, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Creating new xpc connection...", buf, 0x20u);
    }
    v11 = [(LBLocalSpeechRecognizerClient *)self _newConnection];
    v12 = self->_xpcConnection;
    self->_xpcConnection = v11;

    objc_initWeak((id *)buf, self);
    v13 = self->_xpcConnectionUUIDString;
    v14 = self->_xpcConnection;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __44__LBLocalSpeechRecognizerClient__connection__block_invoke;
    v25[3] = &unk_264522090;
    objc_copyWeak(&v27, (id *)buf);
    v15 = v13;
    v26 = v15;
    [(NSXPCConnection *)v14 setInterruptionHandler:v25];
    v16 = self->_xpcConnection;
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __44__LBLocalSpeechRecognizerClient__connection__block_invoke_316;
    v22 = &unk_264522090;
    objc_copyWeak(&v24, (id *)buf);
    v17 = v15;
    v23 = v17;
    [(NSXPCConnection *)v16 setInvalidationHandler:&v19];
    [(NSXPCConnection *)self->_xpcConnection resume];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v27);

    objc_destroyWeak((id *)buf);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

void __44__LBLocalSpeechRecognizerClient__connection__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    v15 = "-[LBLocalSpeechRecognizerClient _connection]_block_invoke";
    __int16 v16 = 2112;
    v17 = @"com.apple.siri.localspeechrecognitionbridge.xpc";
    _os_log_impl(&dword_21F71B000, v2, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@ Interrupted", (uint8_t *)&v14, 0x16u);
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    v6 = [WeakRetained xpcConnectionUUIDString];
    LOBYTE(v5) = [v5 isEqualToString:v6];

    if (v5)
    {
      [v4[2] invalidate];
      id v7 = v4[2];
      v4[2] = 0;

      id v8 = objc_loadWeakRetained(v4 + 6);
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        v10 = objc_loadWeakRetained(v4 + 6);
        v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.localsrbridge" code:102 userInfo:0];
        [v10 localSpeechRecognizerClient:v4 didCompletionRecognitionWithStatistics:0 requestId:0 endpointMode:0 error:v11];
LABEL_9:
      }
    }
    else
    {
      v12 = (void *)LBLogContextFacilityLocalSRBridge;
      if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_INFO))
      {
        v13 = *(__CFString **)(a1 + 32);
        v10 = v12;
        v11 = [v4 xpcConnectionUUIDString];
        int v14 = 136315650;
        v15 = "-[LBLocalSpeechRecognizerClient _connection]_block_invoke";
        __int16 v16 = 2112;
        v17 = v13;
        __int16 v18 = 2112;
        uint64_t v19 = v11;
        _os_log_impl(&dword_21F71B000, v10, OS_LOG_TYPE_INFO, "%s Ignore since the UUID of xpc connection not match : %@ vs. %@", (uint8_t *)&v14, 0x20u);
        goto LABEL_9;
      }
    }
  }
}

void __44__LBLocalSpeechRecognizerClient__connection__block_invoke_316(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    v15 = "-[LBLocalSpeechRecognizerClient _connection]_block_invoke";
    __int16 v16 = 2112;
    v17 = @"com.apple.siri.localspeechrecognitionbridge.xpc";
    _os_log_impl(&dword_21F71B000, v2, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@ Invalidated", (uint8_t *)&v14, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    v6 = [WeakRetained xpcConnectionUUIDString];
    LOBYTE(v5) = [v5 isEqualToString:v6];

    if (v5)
    {
      id v7 = (void *)*((void *)v4 + 2);
      *((void *)v4 + 2) = 0;

      id v8 = objc_loadWeakRetained((id *)v4 + 6);
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        v10 = objc_loadWeakRetained((id *)v4 + 6);
        v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.localsrbridge" code:102 userInfo:0];
        [v10 localSpeechRecognizerClient:v4 didCompletionRecognitionWithStatistics:0 requestId:0 endpointMode:0 error:v11];
LABEL_9:
      }
    }
    else
    {
      v12 = (void *)LBLogContextFacilityLocalSRBridge;
      if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_INFO))
      {
        v13 = *(__CFString **)(a1 + 32);
        v10 = v12;
        v11 = [v4 xpcConnectionUUIDString];
        int v14 = 136315650;
        v15 = "-[LBLocalSpeechRecognizerClient _connection]_block_invoke";
        __int16 v16 = 2112;
        v17 = v13;
        __int16 v18 = 2112;
        uint64_t v19 = v11;
        _os_log_impl(&dword_21F71B000, v10, OS_LOG_TYPE_INFO, "%s Ignore since the UUID of xpc connection not match : %@ vs. %@", (uint8_t *)&v14, 0x20u);
        goto LABEL_9;
      }
    }
  }
}

- (id)_newConnection
{
  xpcListenerEndpoint = self->_xpcListenerEndpoint;
  id v4 = objc_alloc(MEMORY[0x263F08D68]);
  if (xpcListenerEndpoint) {
    uint64_t v5 = [v4 initWithListenerEndpoint:self->_xpcListenerEndpoint];
  }
  else {
    uint64_t v5 = [v4 initWithMachServiceName:@"com.apple.siri.localspeechrecognitionbridge.xpc" options:0];
  }
  v6 = (void *)v5;
  id v7 = LBLocalSpeechServiceGetXPCInterface();
  [v6 setRemoteObjectInterface:v7];

  id v8 = LBLocalSpeechServiceDelegateGetXPCInterface();
  [v6 setExportedInterface:v8];

  [v6 setExportedObject:self];
  [v6 _setQueue:self->_queue];
  return v6;
}

- (void)localSpeechServiceRequestAttentionAssetDownload
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    uint64_t v5 = [(LBLocalSpeechRecognizerClient *)self uuidString];
    v6 = [(LBLocalSpeechRecognizerClient *)self xpcConnectionUUIDString];
    int v10 = 136315650;
    v11 = "-[LBLocalSpeechRecognizerClient localSpeechServiceRequestAttentionAssetDownload]";
    __int16 v12 = 2112;
    v13 = v5;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_21F71B000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:", (uint8_t *)&v10, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 localSpeechRecognizerClient:self requestAttentionAssetDownload:1];
  }
}

- (void)localSpeechServiceDidDetectedFinalEndpointAtTime:(double)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    id v7 = [(LBLocalSpeechRecognizerClient *)self uuidString];
    char v8 = [(LBLocalSpeechRecognizerClient *)self xpcConnectionUUIDString];
    *(_DWORD *)buf = 136315906;
    uint64_t v16 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidDetectedFinalEndpointAtTime:]";
    __int16 v17 = 2112;
    __int16 v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2048;
    double v22 = a3;
    _os_log_impl(&dword_21F71B000, v6, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:time = %f", buf, 0x2Au);
  }
  if (self->_shouldEnableAudioCapture)
  {
    audioCapture = self->_audioCapture;
    requestId = self->_requestId;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __82__LBLocalSpeechRecognizerClient_localSpeechServiceDidDetectedFinalEndpointAtTime___block_invoke;
    v14[3] = &unk_264522038;
    v14[4] = self;
    [(LBAudioCapture *)audioCapture stopAudioCaptureWithReason:0 requestId:requestId completion:v14];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    [v13 localSpeechRecognizerClient:self receivedFinalEndpointDetectedAtTime:a3];
  }
}

void __82__LBLocalSpeechRecognizerClient_localSpeechServiceDidDetectedFinalEndpointAtTime___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = (void *)LBLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_ERROR))
    {
      id v9 = v6;
      int v10 = [v5 localizedDescription];
      int v11 = 136315394;
      char v12 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidDetectedFinalEndpointAtTime:]_block_invoke";
      __int16 v13 = 2112;
      __int16 v14 = v10;
      _os_log_error_impl(&dword_21F71B000, v9, OS_LOG_TYPE_ERROR, "%s Failed to stop audio capture, error : %@", (uint8_t *)&v11, 0x16u);
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  char v8 = *(void **)(v7 + 72);
  *(void *)(v7 + 72) = 0;
}

- (void)localSpeechServiceDidReceiveMultiUserTRPCandidatePackage:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    uint64_t v7 = [(LBLocalSpeechRecognizerClient *)self uuidString];
    char v8 = [(LBLocalSpeechRecognizerClient *)self xpcConnectionUUIDString];
    int v12 = 136315906;
    __int16 v13 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidReceiveMultiUserTRPCandidatePackage:]";
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    __int16 v17 = v8;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_21F71B000, v6, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Received MultiUserTRP candidate: %@", (uint8_t *)&v12, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 localSpeechRecognizerClient:self receivedMultiUserTRPCandidatePackage:v4];
  }
}

- (void)localSpeechServiceDidReceiveTRPDetected:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    uint64_t v7 = [(LBLocalSpeechRecognizerClient *)self uuidString];
    char v8 = [(LBLocalSpeechRecognizerClient *)self xpcConnectionUUIDString];
    int v12 = 136315906;
    __int16 v13 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidReceiveTRPDetected:]";
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    __int16 v17 = v8;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_21F71B000, v6, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Received TRP Detected: %@", (uint8_t *)&v12, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 localSpeechRecognizerClient:self receivedTRPDetected:v4];
  }
}

- (void)localSpeechServiceDidReceiveTCUStateUpdate:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    uint64_t v7 = [(LBLocalSpeechRecognizerClient *)self uuidString];
    char v8 = [(LBLocalSpeechRecognizerClient *)self xpcConnectionUUIDString];
    int v12 = 136315906;
    __int16 v13 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidReceiveTCUStateUpdate:]";
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    __int16 v17 = v8;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_21F71B000, v6, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Received TCU state update: %@", (uint8_t *)&v12, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 localSpeechRecognizerClient:self receivedTCUStateUpdate:v4];
  }
}

- (void)localSpeechServiceDidReceiveContinuityEndDetected:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    uint64_t v7 = [(LBLocalSpeechRecognizerClient *)self uuidString];
    char v8 = [(LBLocalSpeechRecognizerClient *)self xpcConnectionUUIDString];
    int v16 = 136315906;
    __int16 v17 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidReceiveContinuityEndDetected:]";
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    __int16 v21 = v8;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_21F71B000, v6, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Received Continuity End Detected: %@", (uint8_t *)&v16, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = (void *)LBLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = v11;
      __int16 v13 = [(LBLocalSpeechRecognizerClient *)self uuidString];
      __int16 v14 = [(LBLocalSpeechRecognizerClient *)self xpcConnectionUUIDString];
      int v16 = 136315906;
      __int16 v17 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidReceiveContinuityEndDetected:]";
      __int16 v18 = 2112;
      id v19 = v13;
      __int16 v20 = 2112;
      __int16 v21 = v14;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_21F71B000, v12, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Delegate - Received Continuity End Detected: %@", (uint8_t *)&v16, 0x2Au);
    }
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 localSpeechRecognizerClient:self receivedContinuityEndDetected:v4];
  }
}

- (void)localSpeechServiceDidReceiveTRPCandidatePackage:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    uint64_t v7 = [(LBLocalSpeechRecognizerClient *)self uuidString];
    char v8 = [(LBLocalSpeechRecognizerClient *)self xpcConnectionUUIDString];
    int v12 = 136315650;
    __int16 v13 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidReceiveTRPCandidatePackage:]";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    __int16 v17 = v8;
    _os_log_impl(&dword_21F71B000, v6, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Received TRP Candidate Package", (uint8_t *)&v12, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 localSpeechRecognizerClient:self receivedTRPCandidatePackage:v4];
  }
}

- (void)localSpeechServiceDidReceivedVoiceIdScoreCard:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    uint64_t v7 = [(LBLocalSpeechRecognizerClient *)self uuidString];
    char v8 = [(LBLocalSpeechRecognizerClient *)self xpcConnectionUUIDString];
    id v9 = [v4 spIdKnownUserScores];
    int v13 = 136315906;
    __int16 v14 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidReceivedVoiceIdScoreCard:]";
    __int16 v15 = 2112;
    __int16 v16 = v7;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    __int16 v20 = v9;
    _os_log_impl(&dword_21F71B000, v6, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Client received voiceId scores: %@", (uint8_t *)&v13, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 localSpeechRecognizerClient:self receivedVoiceIdScoreCard:v4];
  }
}

- (void)localSpeechServiceDidCompletionRecognitionWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v13 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = v13;
    __int16 v15 = [(LBLocalSpeechRecognizerClient *)self uuidString];
    __int16 v16 = [(LBLocalSpeechRecognizerClient *)self xpcConnectionUUIDString];
    __int16 v17 = [v12 localizedDescription];
    int v23 = 136316418;
    uint64_t v24 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidCompletionRecognitionWithStatistics:requestId:endpointMode:error:]";
    __int16 v25 = 2112;
    v26 = v15;
    __int16 v27 = 2112;
    v28 = v16;
    __int16 v29 = 2112;
    id v30 = v11;
    __int16 v31 = 2050;
    int64_t v32 = a5;
    __int16 v33 = 2114;
    uint64_t v34 = v17;
    _os_log_impl(&dword_21F71B000, v14, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Notify task %@ completed with endpointMode %{public}ld, error : %{public}@", (uint8_t *)&v23, 0x3Eu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v19 = objc_opt_respondsToSelector();

  id v20 = objc_loadWeakRetained((id *)&self->_delegate);
  id v21 = v20;
  if (v19)
  {
    [v20 localSpeechRecognizerClient:self didCompletionRecognitionWithStatistics:v10 requestId:v11 endpointMode:a5 error:v12];
LABEL_7:

    goto LABEL_8;
  }
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    id v21 = objc_loadWeakRetained((id *)&self->_delegate);
    [v21 localSpeechRecognizerClient:self didCompletionRecognitionWithStatistics:v10 requestId:v11 error:v12];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)localSpeechServiceDidReceivedEagerResultWithRequestId:(id)a3 rcId:(unint64_t)a4 shouldAccept:(BOOL)a5 mitigationSignal:(BOOL)a6 featuresToLog:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __int16 v14 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = v14;
    __int16 v16 = [(LBLocalSpeechRecognizerClient *)self uuidString];
    __int16 v17 = [(LBLocalSpeechRecognizerClient *)self xpcConnectionUUIDString];
    int v19 = 136315906;
    id v20 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidReceivedEagerResultWithRequestId:rcId:shouldAccept:mitiga"
          "tionSignal:featuresToLog:]";
    __int16 v21 = 2112;
    char v22 = v16;
    __int16 v23 = 2112;
    uint64_t v24 = v17;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_impl(&dword_21F71B000, v15, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Sending EagerResult for request:%@", (uint8_t *)&v19, 0x2Au);
  }
  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained localSpeechRecognizerClient:self didAcceptedEagerResultWithRequestId:v12 rcId:a4 mitigationSignal:v8 featuresToLog:v13];
  }
}

- (void)localSpeechServiceDidReceivedEagerRecognitionCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 speechPackage:(id)a5 duration:(double)a6 metadata:(id)a7
{
  id v17 = a3;
  id v12 = a5;
  id v13 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    [v16 localSpeechRecognizerClient:self receivedEagerRecognitionCandidateWithRequestId:v17 rcId:a4 speechPackage:v12 duration:v13 metadata:a6];
  }
}

- (void)localSpeechServiceDidReceivedEagerRecognitionCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 speechPackage:(id)a5 duration:(double)a6
{
  id v14 = a3;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    [v13 localSpeechRecognizerClient:self receivedEagerRecognitionCandidateWithRequestId:v14 rcId:a4 speechPackage:v10 duration:a6];
  }
}

- (void)localSpeechServiceDidReceivedFinalResultWithRequestId:(id)a3 speechPackage:(id)a4 metadata:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 localSpeechRecognizerClient:self receivedFinalResultWithRequestId:v13 speechPackage:v8 metadata:v9];
  }
}

- (void)localSpeechServiceDidReceivedFinalResultWithRequestId:(id)a3 speechPackage:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained localSpeechRecognizerClient:self receivedFinalResultWithRequestId:v8 speechPackage:v7];
}

- (void)localSpeechServiceDidReceivedVoiceCommandCandidateWithRequestId:(id)a3 speechPackage:(id)a4 metadata:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 localSpeechRecognizerClient:self receivedVoiceCommandCandidateWithRequestId:v13 speechPackage:v8 metadata:v9];
  }
}

- (void)localSpeechServiceDidReceivedFinalResultCandidateWithRequestId:(id)a3 speechPackage:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 localSpeechRecognizerClient:self receivedFinalResultCandidateWithRequestId:v10 speechPackage:v6];
  }
}

- (void)localSpeechServiceDidReceivedPartialResultWithRequestId:(id)a3 language:(id)a4 speechPackage:(id)a5 metadata:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 localSpeechRecognizerClient:self receivedPartialResultWithRequestId:v16 language:v10 speechPackage:v11 metadata:v12];
  }
}

- (void)localSpeechServiceDidReceivedPartialResultWithRequestId:(id)a3 language:(id)a4 tokens:(id)a5 metadata:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 localSpeechRecognizerClient:self receivedPartialResultWithRequestId:v16 language:v10 tokens:v11 metadata:v12];
  }
}

- (void)localSpeechServiceDidReceivedPartialResultWithRequestId:(id)a3 language:(id)a4 tokens:(id)a5
{
  queue = self->_queue;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  dispatch_assert_queue_V2(queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained localSpeechRecognizerClient:self receivedPartialResultWithRequestId:v11 language:v10 tokens:v9];
}

- (void)_invalidate
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    id v4 = LBLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      char v8 = "-[LBLocalSpeechRecognizerClient _invalidate]";
      _os_log_impl(&dword_21F71B000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
      xpcConnection = self->_xpcConnection;
    }
    [(NSXPCConnection *)xpcConnection setInvalidationHandler:0];
    [(NSXPCConnection *)self->_xpcConnection invalidate];
    id v5 = self->_xpcConnection;
    self->_xpcConnection = 0;

    xpcConnectionUUIDString = self->_xpcConnectionUUIDString;
    self->_xpcConnectionUUIDString = 0;
  }
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v7 = "-[LBLocalSpeechRecognizerClient invalidate]";
    _os_log_impl(&dword_21F71B000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__LBLocalSpeechRecognizerClient_invalidate__block_invoke;
  block[3] = &unk_264522130;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __43__LBLocalSpeechRecognizerClient_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)trpCandidateReadyForExecutionForRequestId:(id)a3 withTrpId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__LBLocalSpeechRecognizerClient_trpCandidateReadyForExecutionForRequestId_withTrpId___block_invoke;
  block[3] = &unk_264522010;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __85__LBLocalSpeechRecognizerClient_trpCandidateReadyForExecutionForRequestId_withTrpId___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 uuidString];
    id v6 = [*(id *)(a1 + 32) xpcConnectionUUIDString];
    int v8 = 136315650;
    id v9 = "-[LBLocalSpeechRecognizerClient trpCandidateReadyForExecutionForRequestId:withTrpId:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_21F71B000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:", (uint8_t *)&v8, 0x20u);
  }
  id v7 = [*(id *)(a1 + 32) _service];
  [v7 trpCandidateReadyForExecutionForRequestId:*(void *)(a1 + 40) withTrpId:*(void *)(a1 + 48)];
}

- (void)updateTCUState:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__LBLocalSpeechRecognizerClient_updateTCUState___block_invoke;
  v7[3] = &unk_264522060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __48__LBLocalSpeechRecognizerClient_updateTCUState___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 uuidString];
    id v6 = [*(id *)(a1 + 32) xpcConnectionUUIDString];
    int v8 = 136315650;
    id v9 = "-[LBLocalSpeechRecognizerClient updateTCUState:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_21F71B000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:", (uint8_t *)&v8, 0x20u);
  }
  id v7 = [*(id *)(a1 + 32) _service];
  [v7 updateTCUState:*(void *)(a1 + 40)];
}

- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__LBLocalSpeechRecognizerClient_sendSpeechCorrectionInfo_interactionIdentifier___block_invoke;
  block[3] = &unk_264522010;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __80__LBLocalSpeechRecognizerClient_sendSpeechCorrectionInfo_interactionIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 uuidString];
    id v6 = [*(id *)(a1 + 32) xpcConnectionUUIDString];
    int v8 = 136315650;
    id v9 = "-[LBLocalSpeechRecognizerClient sendSpeechCorrectionInfo:interactionIdentifier:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_21F71B000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:", (uint8_t *)&v8, 0x20u);
  }
  id v7 = [*(id *)(a1 + 32) _service];
  [v7 sendSpeechCorrectionInfo:*(void *)(a1 + 40) interactionIdentifier:*(void *)(a1 + 48)];
}

- (void)resetCacheAndCompileAllAssets
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315138;
    id v4 = "-[LBLocalSpeechRecognizerClient resetCacheAndCompileAllAssets]";
    _os_log_debug_impl(&dword_21F71B000, v2, OS_LOG_TYPE_DEBUG, "%s No longer supported.", (uint8_t *)&v3, 0xCu);
  }
}

- (void)updateVoiceCommandContextWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6 disambiguationActive:(id)a7 cursorInVisibleText:(id)a8 favorCommandSuppression:(id)a9 abortCommandSuppression:(id)a10 undoEvent:(id)a11
{
  id v35 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __207__LBLocalSpeechRecognizerClient_updateVoiceCommandContextWithRequestId_prefixText_postfixText_selectedText_disambiguationActive_cursorInVisibleText_favorCommandSuppression_abortCommandSuppression_undoEvent___block_invoke;
  block[3] = &unk_264521FE8;
  block[4] = self;
  id v37 = v35;
  id v38 = v17;
  id v39 = v18;
  id v40 = v19;
  id v41 = v20;
  id v42 = v21;
  id v43 = v22;
  id v44 = v23;
  id v45 = v24;
  id v26 = v24;
  id v27 = v23;
  id v28 = v22;
  id v29 = v21;
  id v30 = v20;
  id v31 = v19;
  id v32 = v18;
  id v33 = v17;
  id v34 = v35;
  dispatch_async(queue, block);
}

void __207__LBLocalSpeechRecognizerClient_updateVoiceCommandContextWithRequestId_prefixText_postfixText_selectedText_disambiguationActive_cursorInVisibleText_favorCommandSuppression_abortCommandSuppression_undoEvent___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 uuidString];
    id v6 = [*(id *)(a1 + 32) xpcConnectionUUIDString];
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "-[LBLocalSpeechRecognizerClient updateVoiceCommandContextWithRequestId:prefixText:postfixText:selectedText:dis"
          "ambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:]_block_invoke";
    __int16 v11 = 2112;
    __int16 v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_21F71B000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:requestId : %@", buf, 0x2Au);
  }
  int v8 = [*(id *)(a1 + 32) _service];
  [v8 updateVoiceCommandContextWithRequestId:*(void *)(a1 + 40) prefixText:*(void *)(a1 + 48) postfixText:*(void *)(a1 + 56) selectedText:*(void *)(a1 + 64) disambiguationActive:*(void *)(a1 + 72) cursorInVisibleText:*(void *)(a1 + 80) favorCommandSuppression:*(void *)(a1 + 88) abortCommandSuppression:*(void *)(a1 + 96) undoEvent:*(void *)(a1 + 104)];
}

- (void)resumeLocalRecognitionWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __105__LBLocalSpeechRecognizerClient_resumeLocalRecognitionWithRequestId_prefixText_postfixText_selectedText___block_invoke;
  block[3] = &unk_264521FC0;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(queue, block);
}

void __105__LBLocalSpeechRecognizerClient_resumeLocalRecognitionWithRequestId_prefixText_postfixText_selectedText___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 uuidString];
    id v6 = [*(id *)(a1 + 32) xpcConnectionUUIDString];
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 136315906;
    id v10 = "-[LBLocalSpeechRecognizerClient resumeLocalRecognitionWithRequestId:prefixText:postfixText:selectedText:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_21F71B000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:requestId : %@", (uint8_t *)&v9, 0x2Au);
  }
  int v8 = [*(id *)(a1 + 32) _service];
  [v8 resumeLocalRecognitionWithRequestId:*(void *)(a1 + 40) prefixText:*(void *)(a1 + 48) postfixText:*(void *)(a1 + 56) selectedText:*(void *)(a1 + 64)];
}

- (void)pauseLocalSpeechRecognitionForRequestId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__LBLocalSpeechRecognizerClient_pauseLocalSpeechRecognitionForRequestId___block_invoke;
  v7[3] = &unk_264522060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __73__LBLocalSpeechRecognizerClient_pauseLocalSpeechRecognitionForRequestId___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 uuidString];
    id v6 = [*(id *)(a1 + 32) xpcConnectionUUIDString];
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 136315906;
    id v10 = "-[LBLocalSpeechRecognizerClient pauseLocalSpeechRecognitionForRequestId:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_21F71B000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:requestId : %@", (uint8_t *)&v9, 0x2Au);
  }
  id v8 = [*(id *)(a1 + 32) _service];
  [v8 pauseLocalSpeechRecognitionForRequestId:*(void *)(a1 + 40)];
}

- (void)disableLocalSpeechRecognitionForRequestId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__LBLocalSpeechRecognizerClient_disableLocalSpeechRecognitionForRequestId___block_invoke;
  v7[3] = &unk_264522060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __75__LBLocalSpeechRecognizerClient_disableLocalSpeechRecognitionForRequestId___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 uuidString];
    id v6 = [*(id *)(a1 + 32) xpcConnectionUUIDString];
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 136315906;
    id v10 = "-[LBLocalSpeechRecognizerClient disableLocalSpeechRecognitionForRequestId:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_21F71B000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:requestId : %@", (uint8_t *)&v9, 0x2Au);
  }
  id v8 = [*(id *)(a1 + 32) _service];
  [v8 disableLocalSpeechRecognitionForRequestId:*(void *)(a1 + 40)];
}

- (void)_stopSpeechRecognitionTaskWithReason:(unint64_t)a3 requestId:(id)a4 shouldInvalidateAfterStop:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  id v12 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = v12;
    uint64_t v14 = [(LBLocalSpeechRecognizerClient *)self uuidString];
    __int16 v15 = [(LBLocalSpeechRecognizerClient *)self xpcConnectionUUIDString];
    *(_DWORD *)buf = 136316418;
    id v24 = "-[LBLocalSpeechRecognizerClient _stopSpeechRecognitionTaskWithReason:requestId:shouldInvalidateAfterStop:completion:]";
    __int16 v25 = 2112;
    id v26 = v14;
    __int16 v27 = 2112;
    id v28 = v15;
    __int16 v29 = 2050;
    unint64_t v30 = a3;
    __int16 v31 = 2112;
    id v32 = v10;
    __int16 v33 = 1024;
    BOOL v34 = v7;
    _os_log_impl(&dword_21F71B000, v13, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:reason : %{public}lu, requestId %@, shouldInvalidate %d", buf, 0x3Au);
  }
  if (self->_shouldEnableAudioCapture && (audioCapture = self->_audioCapture) != 0)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __117__LBLocalSpeechRecognizerClient__stopSpeechRecognitionTaskWithReason_requestId_shouldInvalidateAfterStop_completion___block_invoke;
    v18[3] = &unk_264521F98;
    v18[4] = self;
    unint64_t v21 = a3;
    id v19 = v10;
    BOOL v22 = v7;
    id v20 = v11;
    [(LBAudioCapture *)audioCapture stopAudioCaptureWithReason:a3 requestId:v19 completion:v18];
  }
  else
  {
    uint64_t v17 = [(LBLocalSpeechRecognizerClient *)self _service];
    [v17 stopSpeechRecognitionWithReason:a3 requestId:v10];

    if (v7) {
      [(LBLocalSpeechRecognizerClient *)self _invalidate];
    }
    if (v11) {
      (*((void (**)(id, uint64_t, void))v11 + 2))(v11, 1, 0);
    }
  }
}

uint64_t __117__LBLocalSpeechRecognizerClient__stopSpeechRecognitionTaskWithReason_requestId_shouldInvalidateAfterStop_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) _service];
  [v5 stopSpeechRecognitionWithReason:*(void *)(a1 + 56) requestId:*(void *)(a1 + 40)];

  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 32) _invalidate];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
  }
  return MEMORY[0x270F9A790]();
}

- (void)stopSpeechRecognitionTaskAndInvalidateWithReason:(unint64_t)a3 requestId:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __103__LBLocalSpeechRecognizerClient_stopSpeechRecognitionTaskAndInvalidateWithReason_requestId_completion___block_invoke;
  v13[3] = &unk_264521F70;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

uint64_t __103__LBLocalSpeechRecognizerClient_stopSpeechRecognitionTaskAndInvalidateWithReason_requestId_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopSpeechRecognitionTaskWithReason:*(void *)(a1 + 56) requestId:*(void *)(a1 + 40) shouldInvalidateAfterStop:1 completion:*(void *)(a1 + 48)];
}

- (void)stopSpeechRecognitionTaskWithReason:(unint64_t)a3 requestId:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __90__LBLocalSpeechRecognizerClient_stopSpeechRecognitionTaskWithReason_requestId_completion___block_invoke;
  v13[3] = &unk_264521F70;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

uint64_t __90__LBLocalSpeechRecognizerClient_stopSpeechRecognitionTaskWithReason_requestId_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopSpeechRecognitionTaskWithReason:*(void *)(a1 + 56) requestId:*(void *)(a1 + 40) shouldInvalidateAfterStop:0 completion:*(void *)(a1 + 48)];
}

- (void)stopSpeechRecognitionTaskWithReason:(unint64_t)a3 requestId:(id)a4
{
}

- (void)stopLocalSpeechRecognitionTaskWithReason:(unint64_t)a3
{
}

- (void)startSpeechRecognitionResultsWithSettings:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__LBLocalSpeechRecognizerClient_startSpeechRecognitionResultsWithSettings___block_invoke;
  v7[3] = &unk_264522060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __75__LBLocalSpeechRecognizerClient_startSpeechRecognitionResultsWithSettings___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 uuidString];
    id v6 = [*(id *)(a1 + 32) xpcConnectionUUIDString];
    BOOL v7 = [*(id *)(a1 + 40) description];
    *(_DWORD *)buf = 136315906;
    __int16 v29 = "-[LBLocalSpeechRecognizerClient startSpeechRecognitionResultsWithSettings:]_block_invoke";
    __int16 v30 = 2112;
    __int16 v31 = v5;
    __int16 v32 = 2112;
    __int16 v33 = v6;
    __int16 v34 = 2114;
    uint64_t v35 = v7;
    _os_log_impl(&dword_21F71B000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:settings : %{public}@", buf, 0x2Au);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = [*(id *)(a1 + 40) shouldStartAudioCapture];
  uint64_t v8 = [*(id *)(a1 + 40) requestId];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 72);
  *(void *)(v9 + 72) = v8;

  id v11 = *(unsigned char **)(a1 + 32);
  if (v11[40])
  {
    id v12 = objc_alloc(MEMORY[0x263F37FE8]);
    uint64_t v13 = [*(id *)(a1 + 40) audioRecordType];
    id v14 = [*(id *)(a1 + 40) audioRecordDeviceId];
    id v15 = (void *)[v12 initWithRecordType:v13 deviceId:v14];

    uint64_t v16 = [*(id *)(a1 + 40) audioCaptureStartHostTime];
    uint64_t v17 = (void *)LBLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = *(void **)(a1 + 32);
      id v19 = v17;
      id v20 = [v18 uuidString];
      unint64_t v21 = [*(id *)(a1 + 32) xpcConnectionUUIDString];
      BOOL v22 = [v15 description];
      *(_DWORD *)buf = 136316162;
      __int16 v29 = "-[LBLocalSpeechRecognizerClient startSpeechRecognitionResultsWithSettings:]_block_invoke";
      __int16 v30 = 2112;
      __int16 v31 = v20;
      __int16 v32 = 2112;
      __int16 v33 = v21;
      __int16 v34 = 2114;
      uint64_t v35 = v22;
      __int16 v36 = 2048;
      uint64_t v37 = v16;
      _os_log_impl(&dword_21F71B000, v19, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:start audio capture in parallel with record context : %{public}@, startTime : %llu", buf, 0x34u);
    }
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldSetSpeechEventForRecordType:", objc_msgSend(*(id *)(a1 + 40), "audioRecordType")))objc_msgSend(v15, "setSpeechEvent:", +[CSRecordTypeSpeechEventConverter getSpeechEventForRecordType:](CSRecordTypeSpeechEventConverter, "getSpeechEventForRecordType:", objc_msgSend(*(id *)(a1 + 40), "audioRecordType"))); {
    id v23 = *(void **)(*(void *)(a1 + 32) + 32);
    }
    id v24 = [*(id *)(a1 + 40) requestId];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __75__LBLocalSpeechRecognizerClient_startSpeechRecognitionResultsWithSettings___block_invoke_275;
    v26[3] = &unk_264521F48;
    __int16 v25 = *(void **)(a1 + 40);
    v26[4] = *(void *)(a1 + 32);
    id v27 = v25;
    [v23 startAudioCaptureWithRecordContext:v15 startHostTime:v16 siriSessionUUID:v24 completion:v26];
  }
  else
  {
    id v15 = [v11 _service];
    [v15 startSpeechRecognitionResultsWithSettings:*(void *)(a1 + 40)];
  }
}

void __75__LBLocalSpeechRecognizerClient_startSpeechRecognitionResultsWithSettings___block_invoke_275(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  BOOL v7 = *(NSObject **)(v6 + 8);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__LBLocalSpeechRecognizerClient_startSpeechRecognitionResultsWithSettings___block_invoke_2;
  v9[3] = &unk_264521F20;
  char v12 = a2;
  v9[4] = v6;
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

void __75__LBLocalSpeechRecognizerClient_startSpeechRecognitionResultsWithSettings___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 56))
  {
    id v8 = [*(id *)(a1 + 32) _service];
    [v8 startSpeechRecognitionResultsWithSettings:*(void *)(a1 + 40)];
  }
  else
  {
    v2 = (void *)LBLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_ERROR))
    {
      id v5 = *(void **)(a1 + 48);
      uint64_t v6 = v2;
      BOOL v7 = [v5 localizedDescription];
      *(_DWORD *)buf = 136315394;
      id v10 = "-[LBLocalSpeechRecognizerClient startSpeechRecognitionResultsWithSettings:]_block_invoke_2";
      __int16 v11 = 2112;
      char v12 = v7;
      _os_log_error_impl(&dword_21F71B000, v6, OS_LOG_TYPE_ERROR, "%s Failed to start audio capture with error : %@", buf, 0x16u);
    }
    int v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) requestId];
    [v3 localSpeechServiceDidCompletionRecognitionWithStatistics:0 requestId:v4 endpointMode:0 error:*(void *)(a1 + 48)];
  }
}

- (void)preheatLocalSpeechRecognitionWithLanguage:(id)a3 source:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__LBLocalSpeechRecognizerClient_preheatLocalSpeechRecognitionWithLanguage_source___block_invoke;
  block[3] = &unk_264521EF8;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __82__LBLocalSpeechRecognizerClient_preheatLocalSpeechRecognitionWithLanguage_source___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 uuidString];
    id v6 = [*(id *)(a1 + 32) xpcConnectionUUIDString];
    int v8 = 136315650;
    uint64_t v9 = "-[LBLocalSpeechRecognizerClient preheatLocalSpeechRecognitionWithLanguage:source:]_block_invoke";
    __int16 v10 = 2112;
    unint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_21F71B000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Preheating local ASR", (uint8_t *)&v8, 0x20u);
  }
  BOOL v7 = [*(id *)(a1 + 32) _service];
  [v7 preheatLocalSpeechRecognitionWithLanguage:*(void *)(a1 + 40) source:*(void *)(a1 + 48)];
}

- (void)connectToServiceIfNeeded
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__LBLocalSpeechRecognizerClient_connectToServiceIfNeeded__block_invoke;
  block[3] = &unk_264522130;
  block[4] = self;
  dispatch_async(queue, block);
}

void __57__LBLocalSpeechRecognizerClient_connectToServiceIfNeeded__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _service];
  [v1 connectToServiceIfNeeded];
}

- (void)setLocalSpeechRecognizerClientDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__LBLocalSpeechRecognizerClient_setLocalSpeechRecognizerClientDelegate___block_invoke;
  v7[3] = &unk_264522060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

id __72__LBLocalSpeechRecognizerClient_setLocalSpeechRecognizerClientDelegate___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 uuidString];
    id v6 = [*(id *)(a1 + 32) xpcConnectionUUIDString];
    int v8 = 136315650;
    uint64_t v9 = "-[LBLocalSpeechRecognizerClient setLocalSpeechRecognizerClientDelegate:]_block_invoke";
    __int16 v10 = 2112;
    unint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_21F71B000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:", (uint8_t *)&v8, 0x20u);
  }
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[LBLocalSpeechRecognizerClient dealloc]";
    _os_log_impl(&dword_21F71B000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  [(LBLocalSpeechRecognizerClient *)self _invalidate];
  v4.receiver = self;
  v4.super_class = (Class)LBLocalSpeechRecognizerClient;
  [(LBLocalSpeechRecognizerClient *)&v4 dealloc];
}

- (LBLocalSpeechRecognizerClient)initWithDelegate:(id)a3
{
  return [(LBLocalSpeechRecognizerClient *)self initWithDelegate:a3 xpcListenerEndpoint:0 audioCapture:0];
}

- (LBLocalSpeechRecognizerClient)initWithDelegate:(id)a3 xpcListenerEndpoint:(id)a4 audioCapture:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)LBLocalSpeechRecognizerClient;
  unint64_t v11 = [(LBLocalSpeechRecognizerClient *)&v23 init];
  if (v11)
  {
    if (LBLogInitIfNeeded_once != -1) {
      dispatch_once(&LBLogInitIfNeeded_once, &__block_literal_global);
    }
    __int16 v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v13 = dispatch_queue_create("LBLocalSpeechRecognizerClient Queue", v12);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v11->_xpcListenerEndpoint, a4);
    if (v10) {
      id v15 = (LBAudioCapture *)v10;
    }
    else {
      id v15 = [[LBAudioCapture alloc] initWithQueue:v11->_queue];
    }
    audioCapture = v11->_audioCapture;
    v11->_audioCapture = v15;

    uint64_t v17 = [MEMORY[0x263F08C38] UUID];
    uint64_t v18 = [v17 UUIDString];
    uuidString = v11->_uuidString;
    v11->_uuidString = (NSString *)v18;

    id v20 = LBLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v21 = v11->_uuidString;
      *(_DWORD *)buf = 136315394;
      __int16 v25 = "-[LBLocalSpeechRecognizerClient initWithDelegate:xpcListenerEndpoint:audioCapture:]";
      __int16 v26 = 2112;
      id v27 = v21;
      _os_log_impl(&dword_21F71B000, v20, OS_LOG_TYPE_DEFAULT, "%s Created LBLocalSpeechRecognizerClient with uuid [%@]", buf, 0x16u);
    }
  }
  return v11;
}

+ (BOOL)isInstalledFromStatusString:(id)a3
{
  return [a3 hasPrefix:@"Version:"];
}

@end