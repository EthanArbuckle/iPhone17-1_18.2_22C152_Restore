@interface CSRemoteRecordClient
- (BOOL)didPlayEndpointBeep;
- (BOOL)hasPendingTwoShotBeep;
- (BOOL)isConnected;
- (BOOL)isRecording;
- (BOOL)isRemoteDeviceDarwin;
- (BOOL)isRemoteDeviceGibraltar;
- (BOOL)startRecordingWithOptions:(id)a3 error:(id *)a4;
- (BOOL)stopRecording:(id *)a3;
- (BOOL)waitingForConnection:(double)a3 error:(id *)a4;
- (CSRemoteRecordClient)init;
- (CSRemoteRecordClient)initWithDeviceId:(id)a3 audioStreamHandleId:(unint64_t)a4;
- (CSRemoteRecordClient)initWithQueue:(id)a3 IsRemoteRecording:(BOOL)a4;
- (CSRemoteRecordClientDelegate)delegate;
- (NSString)deviceId;
- (OS_remote_device)device;
- (id)voiceTriggerEventInfo;
- (unint64_t)audioStreamHandleId;
- (void)_handleDidStartRecordingMessage:(id)a3;
- (void)_handleServerError:(id)a3;
- (void)_handleServerEvent:(id)a3;
- (void)_handleServerMessage:(id)a3;
- (void)_handleTwoShotDetectedMessage:(id)a3;
- (void)dealloc;
- (void)didDeviceConnect:(id)a3;
- (void)didDeviceDisconnect:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
@end

@implementation CSRemoteRecordClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deviceWaitingGroup, 0);
  objc_storeStrong((id *)&self->_deviceBrowser, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDevice:(id)a3
{
}

- (OS_remote_device)device
{
  return self->_device;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (unint64_t)audioStreamHandleId
{
  return self->_audioStreamHandleId;
}

- (void)setDelegate:(id)a3
{
}

- (CSRemoteRecordClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSRemoteRecordClientDelegate *)WeakRetained;
}

- (BOOL)hasPendingTwoShotBeep
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v22 = @"COMMAND";
  v23[0] = @"hasPendingTwoShotBeep";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__CSRemoteRecordClient_hasPendingTwoShotBeep__block_invoke;
  v12[3] = &unk_1E6200F18;
  v12[4] = self;
  id v6 = v3;
  id v13 = v6;
  v15 = &v16;
  v7 = v4;
  v14 = v7;
  dispatch_async(queue, v12);
  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSRemoteRecordClient hasPendingTwoShotBeep]";
      _os_log_error_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_ERROR, "%s Getting reply timed out!!", buf, 0xCu);
    }
  }
  char v10 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __45__CSRemoteRecordClient_hasPendingTwoShotBeep__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    long long v5 = *(_OWORD *)(a1 + 48);
    id v3 = (id)v5;
    xpc_remote_connection_send_message_with_reply();
  }
  else
  {
    dispatch_semaphore_t v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSRemoteRecordClient hasPendingTwoShotBeep]_block_invoke";
      _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Cannot ask hasPendingTwoShotBeep while connection does not exist", buf, 0xCu);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

void __45__CSRemoteRecordClient_hasPendingTwoShotBeep__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (MEMORY[0x1BA9E7EA0]() == MEMORY[0x1E4F14590])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    dispatch_semaphore_t v4 = objc_msgSend(v3, "_cs_initWithXPCObject:", v7);

    if (v4)
    {
      long long v5 = [v4 objectForKeyedSubscript:@"replyHasPendingTwoShotBeep"];

      if (v5)
      {
        id v6 = [v4 objectForKeyedSubscript:@"replyHasPendingTwoShotBeep"];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 BOOLValue];
      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (id)voiceTriggerEventInfo
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v28 = @"COMMAND";
  v29[0] = @"voiceTriggerEventInfo";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v18 = 0;
  char v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__12122;
  v22 = __Block_byref_object_dispose__12123;
  id v23 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__CSRemoteRecordClient_voiceTriggerEventInfo__block_invoke;
  v14[3] = &unk_1E6200F18;
  v14[4] = self;
  id v6 = v3;
  id v15 = v6;
  v17 = &v18;
  id v7 = v4;
  uint64_t v16 = v7;
  dispatch_async(queue, v14);
  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  intptr_t v9 = dispatch_semaphore_wait(v7, v8);
  char v10 = CSLogContextFacilityCoreSpeech;
  if (v9 && os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[CSRemoteRecordClient voiceTriggerEventInfo]";
    _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s Getting reply timed out!!", buf, 0xCu);
    char v10 = CSLogContextFacilityCoreSpeech;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v19[5];
    *(_DWORD *)buf = 136315394;
    v25 = "-[CSRemoteRecordClient voiceTriggerEventInfo]";
    __int16 v26 = 2114;
    uint64_t v27 = v11;
    _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Raw VoiceTriggerEventInfo from remote = %{public}@", buf, 0x16u);
  }
  id v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __45__CSRemoteRecordClient_voiceTriggerEventInfo__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    long long v5 = *(_OWORD *)(a1 + 48);
    id v3 = (id)v5;
    xpc_remote_connection_send_message_with_reply();
  }
  else
  {
    dispatch_semaphore_t v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v7 = "-[CSRemoteRecordClient voiceTriggerEventInfo]_block_invoke";
      _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Cannot ask VoiceTriggerEventInfo while connection does not exist", buf, 0xCu);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

void __45__CSRemoteRecordClient_voiceTriggerEventInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (MEMORY[0x1BA9E7EA0]() == MEMORY[0x1E4F14590])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    dispatch_semaphore_t v4 = objc_msgSend(v3, "_cs_initWithXPCObject:", v9);

    if (v4)
    {
      long long v5 = [v4 objectForKeyedSubscript:@"replyVoiceTriggerEventInfo"];

      if (v5)
      {
        uint64_t v6 = [v4 objectForKeyedSubscript:@"replyVoiceTriggerEventInfo"];
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = v6;
      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (BOOL)isRecording
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__CSRemoteRecordClient_isRecording__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__CSRemoteRecordClient_isRecording__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 40);
  return result;
}

- (BOOL)didPlayEndpointBeep
{
  v23[1] = *MEMORY[0x1E4F143B8];
  char v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSRemoteRecordClient didPlayEndpointBeep]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  v22 = @"COMMAND";
  v23[0] = @"didPlayEndpointBeep";
  dispatch_semaphore_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__CSRemoteRecordClient_didPlayEndpointBeep__block_invoke;
  v13[3] = &unk_1E6200F18;
  v13[4] = self;
  id v7 = v4;
  id v14 = v7;
  p_long long buf = &buf;
  uint64_t v8 = v5;
  id v15 = v8;
  dispatch_async(queue, v13);
  dispatch_time_t v9 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    char v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v17 = 136315138;
      uint64_t v18 = "-[CSRemoteRecordClient didPlayEndpointBeep]";
      _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s Getting reply timed out!!", v17, 0xCu);
    }
  }
  char v11 = *(unsigned char *)(*((void *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
  return v11;
}

void __43__CSRemoteRecordClient_didPlayEndpointBeep__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    long long v5 = *(_OWORD *)(a1 + 48);
    id v3 = (id)v5;
    xpc_remote_connection_send_message_with_reply();
  }
  else
  {
    dispatch_semaphore_t v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v7 = "-[CSRemoteRecordClient didPlayEndpointBeep]_block_invoke";
      _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Cannot ask didPlayEndpointBeep while connection does not exist", buf, 0xCu);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

void __43__CSRemoteRecordClient_didPlayEndpointBeep__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (MEMORY[0x1BA9E7EA0]() == MEMORY[0x1E4F14590])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    dispatch_semaphore_t v4 = objc_msgSend(v3, "_cs_initWithXPCObject:", v7);

    if (v4)
    {
      long long v5 = [v4 objectForKeyedSubscript:@"replyDidPlayEndpointBeep"];

      if (v5)
      {
        uint64_t v6 = [v4 objectForKeyedSubscript:@"replyDidPlayEndpointBeep"];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 BOOLValue];
      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (BOOL)stopRecording:(id *)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v24 = @"COMMAND";
  v25[0] = @"stopRecording";
  long long v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__12122;
  uint64_t v18 = __Block_byref_object_dispose__12123;
  id v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CSRemoteRecordClient_stopRecording___block_invoke;
  block[3] = &unk_1E6200EC8;
  block[4] = self;
  id v7 = v5;
  id v11 = v7;
  id v12 = &v20;
  id v13 = &v14;
  dispatch_sync(queue, block);
  if (a3) {
    *a3 = (id) v15[5];
  }
  char v8 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __38__CSRemoteRecordClient_stopRecording___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    xpc_remote_connection_send_message();

    char v3 = 1;
  }
  else
  {
    dispatch_semaphore_t v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      dispatch_time_t v9 = "-[CSRemoteRecordClient stopRecording:]_block_invoke";
      _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Cannot stop recording while connection does not exist", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:302 userInfo:0];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    char v3 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  }
}

- (BOOL)startRecordingWithOptions:(id)a3 error:(id *)a4
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v26[0] = @"COMMAND";
  v26[1] = @"startRecordingOptions";
  v27[0] = @"startRecording";
  v27[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  uint64_t v22 = 0;
  char v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__12122;
  uint64_t v20 = __Block_byref_object_dispose__12123;
  id v21 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CSRemoteRecordClient_startRecordingWithOptions_error___block_invoke;
  block[3] = &unk_1E6200EC8;
  block[4] = self;
  id v9 = v7;
  id v13 = v9;
  uint64_t v14 = &v22;
  id v15 = &v16;
  dispatch_sync(queue, block);
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v10 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __56__CSRemoteRecordClient_startRecordingWithOptions_error___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    xpc_remote_connection_send_message();

    char v3 = 1;
  }
  else
  {
    dispatch_semaphore_t v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[CSRemoteRecordClient startRecordingWithOptions:error:]_block_invoke";
      _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Cannot start recording while connection does not exist", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:302 userInfo:0];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    char v3 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  }
}

- (void)_handleTwoShotDetectedMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v4 = (objc_class *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = objc_msgSend(v6, "_cs_initWithXPCObject:", v5);

  if (!v7
    || ([v7 objectForKeyedSubscript:@"time"],
        int v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    uint64_t v16 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    int v18 = 136315138;
    id v19 = "-[CSRemoteRecordClient _handleTwoShotDetectedMessage:]";
    v17 = "%s Cannot handle TwoShotDetected message since it failed to decode xpcObject to NSDictionary";
LABEL_9:
    _os_log_error_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v18, 0xCu);
    goto LABEL_10;
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0)
  {
    uint64_t v16 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    int v18 = 136315138;
    id v19 = "-[CSRemoteRecordClient _handleTwoShotDetectedMessage:]";
    v17 = "%s Cannot report two shot since delegate doesn't have protocol implemented";
    goto LABEL_9;
  }
  id v12 = [v7 objectForKeyedSubscript:@"time"];
  [v12 doubleValue];
  double v14 = v13;

  id v15 = objc_loadWeakRetained((id *)p_delegate);
  [v15 remoteRecordTwoShotDetectedAtTime:v14];

LABEL_10:
}

- (void)_handleDidStartRecordingMessage:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v4 = (objc_class *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = objc_msgSend(v6, "_cs_initWithXPCObject:", v5);

  int v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    char v23 = "-[CSRemoteRecordClient _handleDidStartRecordingMessage:]";
    __int16 v24 = 2114;
    char v25 = v7;
    _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  id v9 = [v7 objectForKey:@"didStartRecordingError"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    if (v9)
    {
      id v12 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        char v23 = "-[CSRemoteRecordClient _handleDidStartRecordingMessage:]";
        __int16 v24 = 2114;
        char v25 = v9;
        _os_log_error_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_ERROR, "%s DidStartRecording error : %{public}@", buf, 0x16u);
      }
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      unint64_t audioStreamHandleId = self->_audioStreamHandleId;
      id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:303 userInfo:0];
      [v13 remoteRecordDidStartRecordingWithStreamHandleId:audioStreamHandleId error:v15];

      if (self->_device) {
        uint64_t type = remote_device_get_type();
      }
      else {
        uint64_t type = 0;
      }
      v17 = +[CSDiagnosticReporter sharedInstance];
      int v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", type, @"Device Type");
      v20[1] = @"error";
      v21[0] = v18;
      v21[1] = v9;
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
      [v17 submitRemoteCoreSpeechIssueReport:@"remoteCoreSpeechSubtypeStartAudioRecordingFailed" context:v19];
    }
    else
    {
      v17 = objc_loadWeakRetained((id *)&self->_delegate);
      [v17 remoteRecordDidStartRecordingWithStreamHandleId:self->_audioStreamHandleId error:0];
    }
  }
}

- (void)_handleServerMessage:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", xpc_dictionary_get_string(v4, "COMMAND"));
  id v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    int v18 = "-[CSRemoteRecordClient _handleServerMessage:]";
    __int16 v19 = 2114;
    uint64_t v20 = v5;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  if ([v5 isEqualToString:@"didStartRecording"])
  {
    [(CSRemoteRecordClient *)self _handleDidStartRecordingMessage:v4];
  }
  else if ([v5 isEqualToString:@"didStopRecording"])
  {
    self->_isRemoteRecording = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 remoteRecordDidStopRecordingWithWithStreamHandleId:self->_audioStreamHandleId error:0];
    }
  }
  else if ([v5 isEqualToString:@"LPCMBufferAvailable"])
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v13 = objc_msgSend(v12, "_cs_initWithXPCObject:", v4);

      if (v13)
      {
        double v14 = [v13 objectForKeyedSubscript:@"buffer"];

        if (v14)
        {
          id v15 = [v13 objectForKeyedSubscript:@"buffer"];
          id v16 = objc_loadWeakRetained((id *)&self->_delegate);
          [v16 remoteRecordLPCMBufferAvailable:v15 streamHandleId:self->_audioStreamHandleId];
        }
      }
    }
  }
  else if ([v5 isEqualToString:@"twoShotDetected"])
  {
    [(CSRemoteRecordClient *)self _handleTwoShotDetectedMessage:v4];
  }
}

- (void)_handleServerError:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    if (v4 == (id)MEMORY[0x1E4F14528] || v4 == (id)MEMORY[0x1E4F14520])
    {
      id v6 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        char v11 = "-[CSRemoteRecordClient _handleServerError:]";
        _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s connection disconnected", (uint8_t *)&v10, 0xCu);
      }
      if (self->_device) {
        remote_device_cancel();
      }
    }
    else
    {
      string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14530]);
      char v8 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315394;
        char v11 = "-[CSRemoteRecordClient _handleServerError:]";
        __int16 v12 = 2082;
        id v13 = string;
        _os_log_error_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_ERROR, "%s connection error: %{public}s", (uint8_t *)&v10, 0x16u);
      }
    }
  }
}

- (void)_handleServerEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    uint64_t v5 = MEMORY[0x1BA9E7EA0](v4);
    if (MEMORY[0x1BA9E7EA0](v4) == MEMORY[0x1E4F145A8])
    {
      char v8 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315138;
        int v10 = "-[CSRemoteRecordClient _handleServerEvent:]";
        _os_log_error_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_ERROR, "%s remoteXPC connection get failed", (uint8_t *)&v9, 0xCu);
      }
      [(CSRemoteRecordClient *)self _handleServerError:v4];
    }
    else
    {
      if (v5 == MEMORY[0x1E4F14590])
      {
        [(CSRemoteRecordClient *)self _handleServerMessage:v4];
        goto LABEL_13;
      }
      id v6 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315138;
        int v10 = "-[CSRemoteRecordClient _handleServerEvent:]";
        id v7 = "%s Ignore unknown type message";
LABEL_8:
        _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    id v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      int v10 = "-[CSRemoteRecordClient _handleServerEvent:]";
      id v7 = "%s cannot handle server event since event is nil";
      goto LABEL_8;
    }
  }
LABEL_13:
}

- (BOOL)isConnected
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__CSRemoteRecordClient_isConnected__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__CSRemoteRecordClient_isConnected__block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 16)) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)waitingForConnection:(double)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int64_t v6 = [(CSDispatchGroup *)self->_deviceWaitingGroup waitWithTimeout:dispatch_time(0, (uint64_t)(a3 * 1000000000.0))];
  if (!v6)
  {
    if ([(CSRemoteRecordClient *)self isConnected])
    {
      BOOL v9 = 1;
      return !v6 && v9;
    }
    int v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[CSRemoteRecordClient waitingForConnection:error:]";
      _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s Device is connected but RemoteXPC service is not connected", (uint8_t *)&v13, 0xCu);
      if (!a4) {
        goto LABEL_14;
      }
    }
    else if (!a4)
    {
      goto LABEL_14;
    }
    uint64_t v8 = 302;
    goto LABEL_10;
  }
  id v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315138;
    uint64_t v14 = "-[CSRemoteRecordClient waitingForConnection:error:]";
    _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, "%s Device connection waiting timed out", (uint8_t *)&v13, 0xCu);
    if (a4) {
      goto LABEL_4;
    }
  }
  else if (a4)
  {
LABEL_4:
    uint64_t v8 = 301;
LABEL_10:
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:v8 userInfo:0];
    BOOL v9 = 0;
    *a4 = v11;
    return !v6 && v9;
  }
LABEL_14:
  BOOL v9 = 0;
  return !v6 && v9;
}

- (void)didDeviceDisconnect:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v8 = "-[CSRemoteRecordClient didDeviceDisconnect:]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CSRemoteRecordClient_didDeviceDisconnect___block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async(queue, block);
}

void __44__CSRemoteRecordClient_didDeviceDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    [v6 remoteRecordConnectionDisconnected:*(void *)(a1 + 32)];
  }
}

- (void)didDeviceConnect:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v12 = "-[CSRemoteRecordClient didDeviceConnect:]";
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__CSRemoteRecordClient_didDeviceConnect___block_invoke;
  v8[3] = &unk_1E6201030;
  id v9 = v4;
  int v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __41__CSRemoteRecordClient_didDeviceConnect___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  remote_device_get_type();
  uint64_t v2 = (void *)remote_device_copy_service();
  if (v2)
  {
    char v3 = (void *)xpc_remote_connection_create_with_remote_service();
    objc_initWeak((id *)location, *(id *)(a1 + 40));
    objc_copyWeak(&v5, (id *)location);
    xpc_remote_connection_set_event_handler();
    xpc_remote_connection_activate();
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), v3);
    [*(id *)(*(void *)(a1 + 40) + 32) leave];
    objc_destroyWeak(&v5);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[CSRemoteRecordClient didDeviceConnect:]_block_invoke";
      __int16 v7 = 2082;
      uint64_t v8 = "com.apple.corespeech.xpc.remote.record";
      _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Service: %{public}s not found", location, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 40) + 32) leave];
  }
}

void __41__CSRemoteRecordClient_didDeviceConnect___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleServerEvent:v3];
}

- (BOOL)isRemoteDeviceDarwin
{
  return remote_device_get_type() == 11;
}

- (BOOL)isRemoteDeviceGibraltar
{
  return remote_device_get_type() == 3;
}

- (CSRemoteRecordClient)initWithQueue:(id)a3 IsRemoteRecording:(BOOL)a4
{
  id v7 = a3;
  if (v7)
  {
    v12.receiver = self;
    v12.super_class = (Class)CSRemoteRecordClient;
    uint64_t v8 = [(CSRemoteRecordClient *)&v12 init];
    uint64_t v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_queue, a3);
      v9->_isRemoteRecording = a4;
    }
    self = v9;
    int v10 = self;
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v6 = "-[CSRemoteRecordClient dealloc]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (self->_connection) {
    xpc_remote_connection_cancel();
  }
  if (self->_device) {
    remote_device_cancel();
  }
  v4.receiver = self;
  v4.super_class = (Class)CSRemoteRecordClient;
  [(CSRemoteRecordClient *)&v4 dealloc];
}

- (CSRemoteRecordClient)init
{
  id v3 = [[CSRemoteRecordClient alloc] initWithDeviceId:0 audioStreamHandleId:1];

  return v3;
}

- (CSRemoteRecordClient)initWithDeviceId:(id)a3 audioStreamHandleId:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!+[CSUtils isDarwinOS])
  {
    v24.receiver = self;
    v24.super_class = (Class)CSRemoteRecordClient;
    self = [(CSRemoteRecordClient *)&v24 init];
    if (self)
    {
      uint64_t v9 = (OS_dispatch_queue *)dispatch_queue_create("CSRemoteRecordClient Queue", 0);
      queue = self->_queue;
      self->_queue = v9;

      id v11 = objc_alloc_init(CSDispatchGroup);
      deviceWaitingGroup = self->_deviceWaitingGroup;
      self->_deviceWaitingGroup = v11;

      objc_initWeak(&location, self);
      uint64_t v13 = self->_queue;
      if (+[CSUtils hasRemoteBuiltInMic]
        && (!v7 || [v7 isEqualToString:@"BuiltInMicrophoneDevice"]))
      {
        uint64_t v14 = (OS_remote_device *)remote_device_copy_unique_of_type();
        device = self->_device;
        self->_device = v14;
      }
      else
      {
        *(_OWORD *)long long buf = 0uLL;
        id v16 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
        [v16 getUUIDBytes:buf];
        v17 = (OS_remote_device *)remote_device_copy_device_with_uuid();
        int v18 = self->_device;
        self->_device = v17;
      }
      if (!self->_device)
      {
        uint64_t v20 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[CSRemoteRecordClient initWithDeviceId:audioStreamHandleId:]";
          _os_log_error_impl(&dword_1BA1A5000, v20, OS_LOG_TYPE_ERROR, "%s There is no remote device", buf, 0xCu);
        }

        objc_destroyWeak(&location);
        goto LABEL_2;
      }
      [(CSDispatchGroup *)self->_deviceWaitingGroup enter];
      v21[1] = (id)MEMORY[0x1E4F143A8];
      void v21[2] = (id)3221225472;
      v21[3] = __61__CSRemoteRecordClient_initWithDeviceId_audioStreamHandleId___block_invoke;
      v21[4] = &unk_1E6200E98;
      objc_copyWeak(&v22, &location);
      remote_device_set_connected_callback();
      objc_copyWeak(v21, &location);
      remote_device_set_disconnected_callback();
      self->_unint64_t audioStreamHandleId = a4;
      objc_storeStrong((id *)&self->_deviceId, a3);
      objc_destroyWeak(v21);
      objc_destroyWeak(&v22);

      objc_destroyWeak(&location);
    }
    self = self;
    uint64_t v8 = self;
    goto LABEL_12;
  }
LABEL_2:
  uint64_t v8 = 0;
LABEL_12:

  return v8;
}

void __61__CSRemoteRecordClient_initWithDeviceId_audioStreamHandleId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didDeviceConnect:v3];
}

void __61__CSRemoteRecordClient_initWithDeviceId_audioStreamHandleId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didDeviceDisconnect:v3];
}

@end