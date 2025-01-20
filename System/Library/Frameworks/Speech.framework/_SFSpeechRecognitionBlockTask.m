@interface _SFSpeechRecognitionBlockTask
- (id)_initWithRequest:(id)a3 queue:(id)a4 languageCode:(id)a5 taskHint:(int64_t)a6 resultHandler:(id)a7;
- (uint64_t)_finalizeResultHandler;
- (void)_fireResultHandlerWithResult:(void *)a3 error:;
- (void)dictationConnection:(id)a3 didRecognizePackage:(id)a4;
- (void)dictationConnection:(id)a3 didRecognizeTokens:(id)a4 languageModel:(id)a5;
- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4;
- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4;
- (void)dictationConnectionSpeechRecognitionDidSucceed:(id)a3;
- (void)dictationConnectionSpeechRecordingDidCancel:(id)a3;
- (void)localSpeechRecognitionClient:(id)a3 didFinishRecognition:(id)a4;
- (void)localSpeechRecognitionClient:(id)a3 didRecognizePartialResult:(id)a4 rawPartialResult:(id)a5;
- (void)localSpeechRecognitionClient:(id)a3 speechRecognitionDidFail:(id)a4;
- (void)localSpeechRecognitionClient:(id)a3 speechRecordingDidFail:(id)a4;
- (void)localSpeechRecognitionClientSpeechRecognitionDidSucceed:(id)a3;
- (void)localSpeechRecognitionClientSpeechRecordingDidCancel:(id)a3;
@end

@implementation _SFSpeechRecognitionBlockTask

- (void).cxx_destruct
{
}

- (void)localSpeechRecognitionClientSpeechRecognitionDidSucceed:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_SFSpeechRecognitionBlockTask;
  [(SFSpeechRecognitionTask *)&v6 localSpeechRecognitionClientSpeechRecognitionDidSucceed:a3];
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89___SFSpeechRecognitionBlockTask_localSpeechRecognitionClientSpeechRecognitionDidSucceed___block_invoke;
  block[3] = &unk_1E61557A0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (uint64_t)_finalizeResultHandler
{
  if (result)
  {
    uint64_t v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 48));
    if (!*(unsigned char *)(v1 + 96))
    {
      v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4E698] code:203 userInfo:0];
      -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](v1, 0, v2);
    }
    v3 = *(void **)(v1 + 88);
    *(void *)(v1 + 88) = 0;

    [*(id *)(v1 + 8) stopSpeechWithOptions:0];
    v4 = *(void **)(v1 + 16);
    return [v4 stopSpeech];
  }
  return result;
}

- (void)_fireResultHandlerWithResult:(void *)a3 error:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    int v7 = [v5 isFinal];
    if (v6 || v7) {
      *(unsigned char *)(a1 + 96) = 1;
    }
    v8 = (void *)[*(id *)(a1 + 88) copy];
    v9 = v8;
    if (v8)
    {
      v10 = *(void **)(a1 + 24);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __68___SFSpeechRecognitionBlockTask__fireResultHandlerWithResult_error___block_invoke;
      v11[3] = &unk_1E6155048;
      id v14 = v8;
      id v12 = v5;
      id v13 = v6;
      [v10 addOperationWithBlock:v11];
    }
  }
}

- (void)localSpeechRecognitionClient:(id)a3 didFinishRecognition:(id)a4
{
  id v5 = a4;
  internalQueue = self->super._internalQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83___SFSpeechRecognitionBlockTask_localSpeechRecognitionClient_didFinishRecognition___block_invoke;
  v8[3] = &unk_1E61557F0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(internalQueue, v8);
}

- (void)localSpeechRecognitionClient:(id)a3 didRecognizePartialResult:(id)a4 rawPartialResult:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105___SFSpeechRecognitionBlockTask_localSpeechRecognitionClient_didRecognizePartialResult_rawPartialResult___block_invoke;
  block[3] = &unk_1E61551C0;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(internalQueue, block);
}

- (void)localSpeechRecognitionClient:(id)a3 speechRecognitionDidFail:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_SFSpeechRecognitionBlockTask;
  [(SFSpeechRecognitionTask *)&v7 localSpeechRecognitionClient:a3 speechRecognitionDidFail:a4];
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87___SFSpeechRecognitionBlockTask_localSpeechRecognitionClient_speechRecognitionDidFail___block_invoke;
  block[3] = &unk_1E61557A0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)localSpeechRecognitionClient:(id)a3 speechRecordingDidFail:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_SFSpeechRecognitionBlockTask;
  [(SFSpeechRecognitionTask *)&v11 localSpeechRecognitionClient:a3 speechRecordingDidFail:v6];
  internalQueue = self->super._internalQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85___SFSpeechRecognitionBlockTask_localSpeechRecognitionClient_speechRecordingDidFail___block_invoke;
  v9[3] = &unk_1E61557F0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(internalQueue, v9);
}

- (void)localSpeechRecognitionClientSpeechRecordingDidCancel:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_SFSpeechRecognitionBlockTask;
  [(SFSpeechRecognitionTask *)&v6 localSpeechRecognitionClientSpeechRecordingDidCancel:a3];
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86___SFSpeechRecognitionBlockTask_localSpeechRecognitionClientSpeechRecordingDidCancel___block_invoke;
  block[3] = &unk_1E61557A0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)dictationConnection:(id)a3 didRecognizeTokens:(id)a4 languageModel:(id)a5
{
  id v6 = a4;
  internalQueue = self->super._internalQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86___SFSpeechRecognitionBlockTask_dictationConnection_didRecognizeTokens_languageModel___block_invoke;
  v9[3] = &unk_1E61557F0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(internalQueue, v9);
}

- (void)dictationConnection:(id)a3 didRecognizePackage:(id)a4
{
  id v5 = a4;
  id v6 = +[SFUtilities recognizedResultFromPackage:v5];
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73___SFSpeechRecognitionBlockTask_dictationConnection_didRecognizePackage___block_invoke;
  block[3] = &unk_1E61551C0;
  block[4] = self;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(internalQueue, block);
}

- (void)dictationConnectionSpeechRecognitionDidSucceed:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_SFSpeechRecognitionBlockTask;
  [(SFSpeechRecognitionTask *)&v6 dictationConnectionSpeechRecognitionDidSucceed:a3];
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80___SFSpeechRecognitionBlockTask_dictationConnectionSpeechRecognitionDidSucceed___block_invoke;
  block[3] = &unk_1E61557A0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_SFSpeechRecognitionBlockTask;
  [(SFSpeechRecognitionTask *)&v7 dictationConnection:a3 speechRecognitionDidFail:a4];
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78___SFSpeechRecognitionBlockTask_dictationConnection_speechRecognitionDidFail___block_invoke;
  block[3] = &unk_1E61557A0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)dictationConnectionSpeechRecordingDidCancel:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_SFSpeechRecognitionBlockTask;
  [(SFSpeechRecognitionTask *)&v6 dictationConnectionSpeechRecordingDidCancel:a3];
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77___SFSpeechRecognitionBlockTask_dictationConnectionSpeechRecordingDidCancel___block_invoke;
  block[3] = &unk_1E61557A0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_SFSpeechRecognitionBlockTask;
  [(SFSpeechRecognitionTask *)&v11 dictationConnection:a3 speechRecordingDidFail:v6];
  internalQueue = self->super._internalQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76___SFSpeechRecognitionBlockTask_dictationConnection_speechRecordingDidFail___block_invoke;
  v9[3] = &unk_1E61557F0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(internalQueue, v9);
}

- (id)_initWithRequest:(id)a3 queue:(id)a4 languageCode:(id)a5 taskHint:(int64_t)a6 resultHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)_SFSpeechRecognitionBlockTask;
  id v16 = [(SFSpeechRecognitionTask *)&v27 _initWithRequest:v12 queue:v13 languageCode:v14 taskHint:a6];
  v17 = v16;
  if (v16)
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy_;
    v25[4] = __Block_byref_object_dispose_;
    v18 = v16;
    id v26 = v18;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __92___SFSpeechRecognitionBlockTask__initWithRequest_queue_languageCode_taskHint_resultHandler___block_invoke;
    v22[3] = &unk_1E6154A10;
    id v23 = v15;
    v24 = v25;
    uint64_t v19 = [v22 copy];
    v20 = (void *)v18[11];
    v18[11] = v19;

    _Block_object_dispose(v25, 8);
  }

  return v17;
}

@end