@interface SFSpeechRecognitionBlockTask
@end

@implementation SFSpeechRecognitionBlockTask

uint64_t __89___SFSpeechRecognitionBlockTask_localSpeechRecognitionClientSpeechRecognitionDidSucceed___block_invoke(uint64_t a1)
{
  return -[_SFSpeechRecognitionBlockTask _finalizeResultHandler](*(void *)(a1 + 32));
}

uint64_t __68___SFSpeechRecognitionBlockTask__fireResultHandlerWithResult_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __83___SFSpeechRecognitionBlockTask_localSpeechRecognitionClient_didFinishRecognition___block_invoke(uint64_t a1)
{
}

void __105___SFSpeechRecognitionBlockTask_localSpeechRecognitionClient_didRecognizePartialResult_rawPartialResult___block_invoke(uint64_t *a1)
{
  if ([*(id *)(a1[4] + 40) shouldReportPartialResults])
  {
    v2 = [SFSpeechRecognitionResult alloc];
    if (v2) {
      id v3 = [(SFSpeechRecognitionResult *)v2 _initWithBestTranscription:a1[5] rawTranscription:a1[6] final:0 speechRecognitionMetadata:0];
    }
    else {
      id v3 = 0;
    }
    id v4 = v3;
    -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](a1[4], v3, 0);
  }
}

uint64_t __87___SFSpeechRecognitionBlockTask_localSpeechRecognitionClient_speechRecognitionDidFail___block_invoke(uint64_t a1)
{
  -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](*(void *)(a1 + 32), 0, *(void **)(*(void *)(a1 + 32) + 56));
  uint64_t v2 = *(void *)(a1 + 32);

  return -[_SFSpeechRecognitionBlockTask _finalizeResultHandler](v2);
}

uint64_t __85___SFSpeechRecognitionBlockTask_localSpeechRecognitionClient_speechRecordingDidFail___block_invoke(uint64_t a1)
{
  -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](*(void *)(a1 + 32), 0, *(void **)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);

  return -[_SFSpeechRecognitionBlockTask _finalizeResultHandler](v2);
}

uint64_t __86___SFSpeechRecognitionBlockTask_localSpeechRecognitionClientSpeechRecordingDidCancel___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4E698] code:216 userInfo:0];
  -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](v2, 0, v3);

  uint64_t v4 = *(void *)(a1 + 32);

  return -[_SFSpeechRecognitionBlockTask _finalizeResultHandler](v4);
}

void __86___SFSpeechRecognitionBlockTask_dictationConnection_didRecognizeTokens_languageModel___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 40) shouldReportPartialResults])
  {
    id v5 = +[SFUtilities transcriptionsWithTokens:*(void *)(a1 + 40)];
    uint64_t v2 = (void *)[v5 copy];
    id v3 = [SFSpeechRecognitionResult alloc];
    if (v3) {
      id v4 = [(SFSpeechRecognitionResult *)v3 _initWithBestTranscription:v5 rawTranscription:v2 final:0 speechRecognitionMetadata:0];
    }
    else {
      id v4 = 0;
    }
    -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](*(void *)(a1 + 32), v4, 0);
  }
}

void __73___SFSpeechRecognitionBlockTask_dictationConnection_didRecognizePackage___block_invoke(uint64_t a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (+[SFUtilities isSpeechXPCEnabled])
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
    id v3 = *(void **)(*(void *)(a1 + 32) + 40);
    if (v3) {
      id v3 = (void *)v3[7];
    }
    id v4 = v3;
    [v2 addEntriesFromDictionary:v4];

    v11[0] = @"textNotEmpty";
    id v5 = NSNumber;
    v6 = [*(id *)(a1 + 40) bestTranscription];
    v7 = [v6 formattedString];
    v8 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v7, "length") != 0);
    v11[1] = @"isFinal";
    v12[0] = v8;
    v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "isFinal"));
    v12[1] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    [v2 addEntriesFromDictionary:v10];

    +[SFLocalSpeechRecognitionClient logCoreAnalyticsEvent:@"com.apple.speechapi.ResultPackage" withAnalytics:v2];
  }
  -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](*(void *)(a1 + 32), *(void **)(a1 + 40), 0);
}

uint64_t __80___SFSpeechRecognitionBlockTask_dictationConnectionSpeechRecognitionDidSucceed___block_invoke(uint64_t a1)
{
  return -[_SFSpeechRecognitionBlockTask _finalizeResultHandler](*(void *)(a1 + 32));
}

uint64_t __78___SFSpeechRecognitionBlockTask_dictationConnection_speechRecognitionDidFail___block_invoke(uint64_t a1)
{
  -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](*(void *)(a1 + 32), 0, *(void **)(*(void *)(a1 + 32) + 56));
  uint64_t v2 = *(void *)(a1 + 32);

  return -[_SFSpeechRecognitionBlockTask _finalizeResultHandler](v2);
}

uint64_t __77___SFSpeechRecognitionBlockTask_dictationConnectionSpeechRecordingDidCancel___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4E698] code:216 userInfo:0];
  -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](v2, 0, v3);

  uint64_t v4 = *(void *)(a1 + 32);

  return -[_SFSpeechRecognitionBlockTask _finalizeResultHandler](v4);
}

uint64_t __76___SFSpeechRecognitionBlockTask_dictationConnection_speechRecordingDidFail___block_invoke(uint64_t a1)
{
  -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](*(void *)(a1 + 32), 0, *(void **)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);

  return -[_SFSpeechRecognitionBlockTask _finalizeResultHandler](v2);
}

void __92___SFSpeechRecognitionBlockTask__initWithRequest_queue_languageCode_taskHint_resultHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (a3 || [v7 isFinal])
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

@end