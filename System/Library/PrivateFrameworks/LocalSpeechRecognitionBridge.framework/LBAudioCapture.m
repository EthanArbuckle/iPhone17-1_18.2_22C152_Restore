@interface LBAudioCapture
- (CSAudioStream)audioStream;
- (CSXPCClient)xpcClient;
- (LBAudioCapture)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (id)_stopStreamOptionWithReason:(unint64_t)a3 forRequestId:(id)a4;
- (void)CSXPCClient:(id)a3 didDisconnect:(BOOL)a4;
- (void)_startRequestWithAudioContext:(id)a3 streamOption:(id)a4 streamProvider:(id)a5 completion:(id)a6;
- (void)setAudioStream:(id)a3;
- (void)setQueue:(id)a3;
- (void)setXpcClient:(id)a3;
- (void)startAudioCaptureWithRecordContext:(id)a3 startHostTime:(unint64_t)a4 siriSessionUUID:(id)a5 completion:(id)a6;
- (void)stopAudioCaptureWithReason:(unint64_t)a3 requestId:(id)a4 completion:(id)a5;
@end

@implementation LBAudioCapture

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_queue, 0);
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

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)CSXPCClient:(id)a3 didDisconnect:(BOOL)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__LBAudioCapture_CSXPCClient_didDisconnect___block_invoke;
  block[3] = &unk_264522130;
  block[4] = self;
  dispatch_async(queue, block);
}

void __44__LBAudioCapture_CSXPCClient_didDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[LBAudioCapture CSXPCClient:didDisconnect:]_block_invoke";
    _os_log_impl(&dword_21F71B000, v2, OS_LOG_TYPE_DEFAULT, "%s Received xpc disconnection", (uint8_t *)&v6, 0xCu);
  }
  v3 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v3)
  {
    [v3 disconnect];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = 0;
  }
}

- (id)_stopStreamOptionWithReason:(unint64_t)a3 forRequestId:(id)a4
{
  if (a3 == 1) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = (objc_class *)MEMORY[0x263F38000];
  id v6 = a4;
  v7 = (void *)[[v5 alloc] initWithStopRecordingReason:v4 expectedStopHostTime:0 trailingSilenceDurationAtEndpoint:0 holdRequest:1 supportsMagus:v6 requestId:0.0];

  return v7;
}

- (void)stopAudioCaptureWithReason:(unint64_t)a3 requestId:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[LBAudioCapture stopAudioCaptureWithReason:requestId:completion:]";
    _os_log_impl(&dword_21F71B000, v10, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __66__LBAudioCapture_stopAudioCaptureWithReason_requestId_completion___block_invoke;
  v18[3] = &unk_2645220B8;
  id v11 = v9;
  id v19 = v11;
  v12 = (void (**)(void, void, void))MEMORY[0x223C52CC0](v18);
  v13 = [(LBAudioCapture *)self audioStream];

  if (v13)
  {
    v14 = [(LBAudioCapture *)self _stopStreamOptionWithReason:a3 forRequestId:v8];
    v15 = [(LBAudioCapture *)self audioStream];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __66__LBAudioCapture_stopAudioCaptureWithReason_requestId_completion___block_invoke_5;
    v16[3] = &unk_264522108;
    v16[4] = self;
    v17 = v12;
    [v15 stopAudioStreamWithOption:v14 completion:v16];
  }
  else
  {
    v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.localsrbridge" code:202 userInfo:0];
    ((void (**)(void, void, void *))v12)[2](v12, 0, v14);
  }
}

void __66__LBAudioCapture_stopAudioCaptureWithReason_requestId_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    id v8 = [v5 localizedDescription];
    int v10 = 136315650;
    id v11 = "-[LBAudioCapture stopAudioCaptureWithReason:requestId:completion:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_21F71B000, v7, OS_LOG_TYPE_DEFAULT, "%s Calling didStop with result : %d, error : %{public}@", (uint8_t *)&v10, 0x1Cu);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
}

void __66__LBAudioCapture_stopAudioCaptureWithReason_requestId_completion___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__LBAudioCapture_stopAudioCaptureWithReason_requestId_completion___block_invoke_2;
  block[3] = &unk_2645220E0;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __66__LBAudioCapture_stopAudioCaptureWithReason_requestId_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_startRequestWithAudioContext:(id)a3 streamOption:(id)a4 streamProvider:(id)a5 completion:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __87__LBAudioCapture__startRequestWithAudioContext_streamOption_streamProvider_completion___block_invoke;
  v28[3] = &unk_2645220B8;
  id v14 = v13;
  id v29 = v14;
  v15 = (void (**)(void, void, void))MEMORY[0x223C52CC0](v28);
  if (v12)
  {
    id v24 = v11;
    uint64_t v16 = [MEMORY[0x263F38008] defaultRequestWithContext:v10];
    [v16 setClientIdentity:4];
    [v16 setRequestListeningMicIndicatorLock:1];
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    id v27 = 0;
    id v19 = [v12 audioStreamWithRequest:v16 streamName:v18 error:&v27];
    id v20 = v27;

    if (v19)
    {
      [(LBAudioCapture *)self setAudioStream:v19];
      [v19 setDelegate:0];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __87__LBAudioCapture__startRequestWithAudioContext_streamOption_streamProvider_completion___block_invoke_4;
      v25[3] = &unk_2645220B8;
      v26 = v15;
      id v11 = v24;
      [v19 startAudioStreamWithOption:v24 completion:v25];
    }
    else
    {
      v21 = (void *)LBLogContextFacilityLocalSRBridge;
      id v11 = v24;
      if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = v21;
        v23 = [v20 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v31 = "-[LBAudioCapture _startRequestWithAudioContext:streamOption:streamProvider:completion:]";
        __int16 v32 = 2114;
        v33 = v23;
        _os_log_error_impl(&dword_21F71B000, v22, OS_LOG_TYPE_ERROR, "%s AudioStreamRequest has failed : %{public}@", buf, 0x16u);

        id v11 = v24;
      }
      ((void (**)(void, void, id))v15)[2](v15, 0, v20);
    }
  }
  else
  {
    id v20 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.localsrbridge" code:202 userInfo:0];
    ((void (**)(void, void, id))v15)[2](v15, 0, v20);
  }
}

void __87__LBAudioCapture__startRequestWithAudioContext_streamOption_streamProvider_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [v5 localizedDescription];
    int v10 = 136315650;
    id v11 = "-[LBAudioCapture _startRequestWithAudioContext:streamOption:streamProvider:completion:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_21F71B000, v7, OS_LOG_TYPE_DEFAULT, "%s Calling didStart with result : %d, error : %{public}@", (uint8_t *)&v10, 0x1Cu);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
}

uint64_t __87__LBAudioCapture__startRequestWithAudioContext_streamOption_streamProvider_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startAudioCaptureWithRecordContext:(id)a3 startHostTime:(unint64_t)a4 siriSessionUUID:(id)a5 completion:(id)a6
{
  v39[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v13 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = v13;
    v15 = [v10 description];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[LBAudioCapture startAudioCaptureWithRecordContext:startHostTime:siriSessionUUID:completion:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2048;
    v38 = (void *)a4;
    LOWORD(v39[0]) = 2112;
    *(void *)((char *)v39 + 2) = v11;
    _os_log_impl(&dword_21F71B000, v14, OS_LOG_TYPE_DEFAULT, "%s start audio capture with recordContext : %{public}@, hostTime : %llu siriSessionUUID:%@", buf, 0x2Au);
  }
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __94__LBAudioCapture_startAudioCaptureWithRecordContext_startHostTime_siriSessionUUID_completion___block_invoke;
  v31[3] = &unk_2645220B8;
  id v16 = v12;
  id v32 = v16;
  v17 = (void (**)(void, void, void))MEMORY[0x223C52CC0](v31);
  xpcClient = self->_xpcClient;
  if (!xpcClient)
  {
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x2050000000;
    id v19 = (void *)getCSXPCClientClass_softClass;
    uint64_t v36 = getCSXPCClientClass_softClass;
    if (!getCSXPCClientClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getCSXPCClientClass_block_invoke;
      v38 = &unk_2645221D8;
      v39[0] = &v33;
      __getCSXPCClientClass_block_invoke((uint64_t)buf);
      id v19 = (void *)v34[3];
    }
    id v20 = v19;
    _Block_object_dispose(&v33, 8);
    v21 = (CSXPCClient *)[[v20 alloc] initWithType:1];
    uint64_t v22 = self->_xpcClient;
    self->_xpcClient = v21;

    [(CSXPCClient *)self->_xpcClient setDelegate:self];
    [(CSXPCClient *)self->_xpcClient connect];
    xpcClient = self->_xpcClient;
  }
  id v30 = 0;
  char v23 = [(CSXPCClient *)xpcClient prepareAudioProviderWithContext:v10 clientType:4 error:&v30];
  id v24 = v30;
  if (v23)
  {
    v25 = self->_xpcClient;
    if (v25)
    {
      v26 = [MEMORY[0x263F37FF8] noAlertOption];
      [v26 setRequestHistoricalAudioDataWithHostTime:1];
      [v26 setStartRecordingHostTime:a4];
      [v26 setSiriSessionUUID:v11];
      [v26 setDisableRCSelection:1];
      id v27 = [MEMORY[0x263F08C38] UUID];
      v28 = [v27 UUIDString];

      [v26 setRequestMHUUID:v28];
      id v29 = LBLogContextFacilityLocalSRBridge;
      if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[LBAudioCapture startAudioCaptureWithRecordContext:startHostTime:siriSessionUUID:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v28;
        *(_WORD *)&buf[22] = 2112;
        v38 = v11;
        _os_log_impl(&dword_21F71B000, v29, OS_LOG_TYPE_DEFAULT, "%s Minting MHId %@ for requestId %@", buf, 0x20u);
      }
      [(LBAudioCapture *)self _startRequestWithAudioContext:v10 streamOption:v26 streamProvider:v25 completion:v17];
    }
    else
    {
      v26 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.localsrbridge" code:202 userInfo:0];
      ((void (**)(void, void, void *))v17)[2](v17, 0, v26);
    }
  }
  else
  {
    ((void (**)(void, void, id))v17)[2](v17, 0, v24);
  }
}

void __94__LBAudioCapture_startAudioCaptureWithRecordContext_startHostTime_siriSessionUUID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [v5 localizedDescription];
    int v10 = 136315650;
    id v11 = "-[LBAudioCapture startAudioCaptureWithRecordContext:startHostTime:siriSessionUUID:completion:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_21F71B000, v7, OS_LOG_TYPE_DEFAULT, "%s audio capture start with result : %d, error : %{public}@", (uint8_t *)&v10, 0x1Cu);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
}

- (LBAudioCapture)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LBAudioCapture;
  id v6 = [(LBAudioCapture *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

@end