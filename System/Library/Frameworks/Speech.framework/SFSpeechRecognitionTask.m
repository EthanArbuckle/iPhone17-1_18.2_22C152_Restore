@interface SFSpeechRecognitionTask
+ (void)initialize;
- (BOOL)isCancelled;
- (BOOL)isFinishing;
- (NSError)error;
- (NSString)requestIdentifier;
- (SFSpeechRecognitionTaskState)state;
- (float)averagePower;
- (float)peakPower;
- (id)_initWithRequest:(id)a3 queue:(id)a4 languageCode:(id)a5 taskHint:(int64_t)a6;
- (int64_t)_taskHint;
- (void)addRecordedSpeechSampleData:(id)a3;
- (void)cancel;
- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4;
- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4;
- (void)dictationConnectionSpeechRecognitionDidSucceed:(id)a3;
- (void)dictationConnectionSpeechRecordingDidBegin:(id)a3;
- (void)dictationConnectionSpeechRecordingDidCancel:(id)a3;
- (void)dictationConnectionSpeechRecordingDidEnd:(id)a3;
- (void)finish;
- (void)handleSpeechRecognitionDidFailWithError:(uint64_t)a1;
- (void)localSpeechRecognitionClient:(id)a3 speechRecognitionDidFail:(id)a4;
- (void)localSpeechRecognitionClient:(id)a3 speechRecordingDidFail:(id)a4;
- (void)localSpeechRecognitionClientSpeechRecognitionDidSucceed:(id)a3;
- (void)localSpeechRecognitionClientSpeechRecordingDidCancel:(id)a3;
- (void)stopSpeech;
@end

@implementation SFSpeechRecognitionTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_externalQueue, 0);
  objc_storeStrong((id *)&self->_sflsrClient, 0);

  objc_storeStrong((id *)&self->_dictationConnection, 0);
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (BOOL)isFinishing
{
  return self->_finishing;
}

- (int64_t)_taskHint
{
  return self->_taskHint;
}

- (void)stopSpeech
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SFSpeechRecognitionTask_stopSpeech__block_invoke;
  block[3] = &unk_1E61557A0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __37__SFSpeechRecognitionTask_stopSpeech__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) stopSpeechWithOptions:0];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v2 stopSpeech];
}

- (void)addRecordedSpeechSampleData:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SFSpeechRecognitionTask_addRecordedSpeechSampleData___block_invoke;
  v7[3] = &unk_1E61557F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __55__SFSpeechRecognitionTask_addRecordedSpeechSampleData___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) addRecordedSpeechSampleData:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v3 addAudioPacket:v2];
}

- (void)localSpeechRecognitionClientSpeechRecognitionDidSucceed:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__SFSpeechRecognitionTask_localSpeechRecognitionClientSpeechRecognitionDidSucceed___block_invoke;
  block[3] = &unk_1E61557A0;
  block[4] = self;
  dispatch_async(internalQueue, block);
  [(SFLocalSpeechRecognitionClient *)self->_sflsrClient invalidate];
}

uint64_t __83__SFSpeechRecognitionTask_localSpeechRecognitionClientSpeechRecognitionDidSucceed___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 64) = 1;
  return result;
}

- (void)localSpeechRecognitionClient:(id)a3 speechRecognitionDidFail:(id)a4
{
  -[SFSpeechRecognitionTask handleSpeechRecognitionDidFailWithError:]((uint64_t)self, a4);
  sflsrClient = self->_sflsrClient;

  [(SFLocalSpeechRecognitionClient *)sflsrClient invalidate];
}

- (void)handleSpeechRecognitionDidFailWithError:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 48);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__SFSpeechRecognitionTask_handleSpeechRecognitionDidFailWithError___block_invoke;
    v6[3] = &unk_1E61557F0;
    id v7 = v3;
    uint64_t v8 = a1;
    dispatch_async(v5, v6);
  }
}

void __67__SFSpeechRecognitionTask_handleSpeechRecognitionDidFailWithError___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) code];
  id v4 = (uint64_t *)MEMORY[0x1E4F4E698];
  v5 = (uint64_t *)MEMORY[0x1E4F28568];
  if (v3 == 1700)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F4E698];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"User denied access to speech recognition";
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    uint64_t v9 = [v6 errorWithDomain:v7 code:1700 userInfo:v8];

    id v2 = (id)v9;
  }
  if ([*(id *)(a1 + 32) code] == 603)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *v4;
    uint64_t v22 = *v5;
    v23 = @"On device models required for speech recognition on this platform. Set SFSpeechRecognitionRequest.requiresOnDeviceRecognition = true";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    uint64_t v13 = [v10 errorWithDomain:v11 code:603 userInfo:v12];

    id v2 = (id)v13;
  }
  if (*(void *)(*(void *)(a1 + 40) + 56))
  {
    v14 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315394;
      v19 = "-[SFSpeechRecognitionTask handleSpeechRecognitionDidFailWithError:]_block_invoke";
      __int16 v20 = 2112;
      id v21 = v2;
      _os_log_error_impl(&dword_1B709D000, v14, OS_LOG_TYPE_ERROR, "%s Ignoring subsequent recognition error: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    uint64_t v15 = [v2 copy];
    uint64_t v16 = *(void *)(a1 + 40);
    v17 = *(void **)(v16 + 56);
    *(void *)(v16 + 56) = v15;
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 64) = 1;
}

- (void)localSpeechRecognitionClient:(id)a3 speechRecordingDidFail:(id)a4
{
  id v5 = a4;
  internalQueue = self->_internalQueue;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __79__SFSpeechRecognitionTask_localSpeechRecognitionClient_speechRecordingDidFail___block_invoke;
  uint64_t v11 = &unk_1E61557F0;
  v12 = self;
  id v13 = v5;
  id v7 = v5;
  dispatch_async(internalQueue, &v8);
  [(SFLocalSpeechRecognitionClient *)self->_sflsrClient invalidate];
}

void __79__SFSpeechRecognitionTask_localSpeechRecognitionClient_speechRecordingDidFail___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 56))
  {
    id v2 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v7 = 136315394;
      uint64_t v8 = "-[SFSpeechRecognitionTask localSpeechRecognitionClient:speechRecordingDidFail:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v3;
      _os_log_error_impl(&dword_1B709D000, v2, OS_LOG_TYPE_ERROR, "%s Ignoring subsequent local speech recording error: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v4;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
}

- (void)localSpeechRecognitionClientSpeechRecordingDidCancel:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__SFSpeechRecognitionTask_localSpeechRecognitionClientSpeechRecordingDidCancel___block_invoke;
  block[3] = &unk_1E61557A0;
  block[4] = self;
  dispatch_async(internalQueue, block);
  [(SFLocalSpeechRecognitionClient *)self->_sflsrClient invalidate];
}

uint64_t __80__SFSpeechRecognitionTask_localSpeechRecognitionClientSpeechRecordingDidCancel___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 67) = 1;
  return result;
}

- (void)dictationConnectionSpeechRecognitionDidSucceed:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SFSpeechRecognitionTask_dictationConnectionSpeechRecognitionDidSucceed___block_invoke;
  block[3] = &unk_1E61557A0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __74__SFSpeechRecognitionTask_dictationConnectionSpeechRecognitionDidSucceed___block_invoke(uint64_t a1)
{
  if (+[SFUtilities isSpeechXPCEnabled])
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 40);
    if (v2) {
      id v2 = (void *)v2[7];
    }
    uint64_t v3 = v2;
    +[SFLocalSpeechRecognitionClient logCoreAnalyticsEvent:@"com.apple.speechapi.RequestCompleted" withAnalytics:v3];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
}

- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4
{
  id v7 = a4;
  if (+[SFUtilities isSpeechXPCEnabled])
  {
    request = self->_request;
    if (request) {
      request = (SFSpeechRecognitionRequest *)request->_afDictationRequestParams;
    }
    id v6 = request;
    +[SFLocalSpeechRecognitionClient logCoreAnalyticsEvent:@"com.apple.speechapi.RequestFailed" withAnalytics:v6];
  }
  -[SFSpeechRecognitionTask handleSpeechRecognitionDidFailWithError:]((uint64_t)self, v7);
}

- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4
{
  id v5 = a4;
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__SFSpeechRecognitionTask_dictationConnection_speechRecordingDidFail___block_invoke;
  v8[3] = &unk_1E61557F0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(internalQueue, v8);
}

void __70__SFSpeechRecognitionTask_dictationConnection_speechRecordingDidFail___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 56))
  {
    id v2 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v7 = 136315394;
      uint64_t v8 = "-[SFSpeechRecognitionTask dictationConnection:speechRecordingDidFail:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v3;
      _os_log_error_impl(&dword_1B709D000, v2, OS_LOG_TYPE_ERROR, "%s Ignoring subsequent recording error: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v4;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
}

- (void)dictationConnectionSpeechRecordingDidCancel:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SFSpeechRecognitionTask_dictationConnectionSpeechRecordingDidCancel___block_invoke;
  block[3] = &unk_1E61557A0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __71__SFSpeechRecognitionTask_dictationConnectionSpeechRecordingDidCancel___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 67) = 1;
  return result;
}

- (void)dictationConnectionSpeechRecordingDidEnd:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SFSpeechRecognitionTask_dictationConnectionSpeechRecordingDidEnd___block_invoke;
  block[3] = &unk_1E61557A0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __68__SFSpeechRecognitionTask_dictationConnectionSpeechRecordingDidEnd___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 66) = 1;
  return result;
}

- (void)dictationConnectionSpeechRecordingDidBegin:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SFSpeechRecognitionTask_dictationConnectionSpeechRecordingDidBegin___block_invoke;
  block[3] = &unk_1E61557A0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __70__SFSpeechRecognitionTask_dictationConnectionSpeechRecordingDidBegin___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 65) = 1;
  return result;
}

- (float)averagePower
{
  [(AFDictationConnection *)self->_dictationConnection averagePower];
  return result;
}

- (float)peakPower
{
  [(AFDictationConnection *)self->_dictationConnection peakPower];
  return result;
}

- (NSError)error
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  __int16 v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__SFSpeechRecognitionTask_error__block_invoke;
  v5[3] = &unk_1E61549E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

uint64_t __32__SFSpeechRecognitionTask_error__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 56) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)cancel
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SFSpeechRecognitionTask_cancel__block_invoke;
  block[3] = &unk_1E61557A0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __33__SFSpeechRecognitionTask_cancel__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 67) = 1;
  [*(id *)(*(void *)(a1 + 32) + 8) cancelSpeech];
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v2 cancelSpeech];
}

- (void)finish
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SFSpeechRecognitionTask_finish__block_invoke;
  block[3] = &unk_1E61557A0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __33__SFSpeechRecognitionTask_finish__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 66) = 1;
  [*(id *)(*(void *)(a1 + 32) + 8) stopSpeechWithOptions:0];
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v2 stopSpeech];
}

- (SFSpeechRecognitionTaskState)state
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__SFSpeechRecognitionTask_state__block_invoke;
  v5[3] = &unk_1E61549E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  SFSpeechRecognitionTaskState v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__SFSpeechRecognitionTask_state__block_invoke(uint64_t result)
{
  v1 = *(unsigned char **)(result + 32);
  if (v1[64])
  {
    uint64_t v2 = 4;
  }
  else if (v1[67])
  {
    uint64_t v2 = 3;
  }
  else if (v1[66])
  {
    uint64_t v2 = 2;
  }
  else
  {
    if (!v1[65]) {
      return result;
    }
    uint64_t v2 = 1;
  }
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (id)_initWithRequest:(id)a3 queue:(id)a4 languageCode:(id)a5 taskHint:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v30.receiver = self;
  v30.super_class = (Class)SFSpeechRecognitionTask;
  v14 = [(SFSpeechRecognitionTask *)&v30 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_request, a3);
    objc_storeStrong((id *)&v15->_externalQueue, a4);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.Speech.Task.Internal", 0);
    internalQueue = v15->_internalQueue;
    v15->_internalQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = [v13 copy];
    languageCode = v15->_languageCode;
    v15->_languageCode = (NSString *)v18;

    __int16 v20 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v21 = [v20 UUIDString];
    requestIdentifier = v15->_requestIdentifier;
    v15->_requestIdentifier = (NSString *)v21;

    uint64_t v23 = [v11 taskHint];
    if (v23) {
      int64_t v24 = v23;
    }
    else {
      int64_t v24 = a6;
    }
    v15->_taskHint = v24;
    v25 = v15->_internalQueue;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __72__SFSpeechRecognitionTask__initWithRequest_queue_languageCode_taskHint___block_invoke;
    v27[3] = &unk_1E61557F0;
    v28 = v15;
    id v29 = v13;
    dispatch_async(v25, v27);
  }
  return v15;
}

void __72__SFSpeechRecognitionTask__initWithRequest_queue_languageCode_taskHint___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 72);
  id v16 = v2;
  if ([v2 requiresOnDeviceRecognition]
    && +[SFUtilities isSpeechXPCEnabled])
  {
    int v4 = [v16 _forceUseSiriProcess] ^ 1;
  }
  else
  {
    int v4 = 0;
  }
  if (([v16 requiresOnDeviceRecognition] & 1) != 0
    || !+[SFUtilities isSpeechXPCEnabled]
    || !AFOfflineDictationCapable()
    || !MGGetBoolAnswer()
    || v3 == 1001
    || [v16 _forceUseSiriProcess])
  {
LABEL_15:
    if ((v4 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_16;
  }
  uint64_t v5 = [v16 _searchRequest];

  if (!v5)
  {
    uint64_t v9 = +[SFSpeechAssetManager installedLanguagesForTaskHint:0];
    LOBYTE(v4) = [v9 containsObject:*(void *)(a1 + 40)] | v4;

    goto LABEL_15;
  }
  if (!v4)
  {
LABEL_13:
    uint64_t v6 = [v16 _startedConnectionWithLanguageCode:*(void *)(*(void *)(a1 + 32) + 32) delegate:*(void *)(a1 + 32) taskHint:v3 requestIdentifier:*(void *)(*(void *)(a1 + 32) + 80)];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = v6;
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(v10 + 32);
  uint64_t v12 = *(void *)(v10 + 80);
  uint64_t v8 = [v16 taskIdentifier];
  uint64_t v13 = [v16 _startedLocalConnectionWithLanguageCode:v11 delegate:v10 taskHint:v3 requestIdentifier:v12 taskIdentifier:v8];
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(v14 + 16);
  *(void *)(v14 + 16) = v13;

LABEL_17:
}

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1 && SFLogInitIfNeeded_once != -1)
  {
    dispatch_once(&SFLogInitIfNeeded_once, &__block_literal_global_2716);
  }
}

@end