@interface SFSpeechRecognitionDelegateTask
@end

@implementation SFSpeechRecognitionDelegateTask

void __71___SFSpeechRecognitionDelegateTask__tellDelegateDidFinishSuccessfully___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  if (objc_opt_respondsToSelector())
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71___SFSpeechRecognitionDelegateTask__tellDelegateDidFinishSuccessfully___block_invoke_2;
    v8[3] = &unk_1E6154A88;
    id v4 = WeakRetained;
    uint64_t v5 = *(void *)(a1 + 32);
    id v9 = v4;
    uint64_t v10 = v5;
    char v11 = *(unsigned char *)(a1 + 40);
    [v3 addOperationWithBlock:v8];
  }
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 88), 0);
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = 0;
}

uint64_t __71___SFSpeechRecognitionDelegateTask__tellDelegateDidFinishSuccessfully___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) speechRecognitionTask:*(void *)(a1 + 40) didFinishSuccessfully:*(unsigned __int8 *)(a1 + 48)];
}

void __67___SFSpeechRecognitionDelegateTask__handleDidProcessAudioDuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67___SFSpeechRecognitionDelegateTask__handleDidProcessAudioDuration___block_invoke_2;
  v6[3] = &unk_1E6154A60;
  id v7 = WeakRetained;
  uint64_t v8 = v3;
  uint64_t v9 = *(void *)(a1 + 40);
  id v5 = WeakRetained;
  [v4 addOperationWithBlock:v6];
}

uint64_t __67___SFSpeechRecognitionDelegateTask__handleDidProcessAudioDuration___block_invoke_2(double *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)*((void *)a1 + 4);
    uint64_t v4 = *((void *)a1 + 5);
    double v5 = a1[6];
    return [v3 speechRecognitionTask:v4 didProcessAudioDuration:v5];
  }
  return result;
}

void __86___SFSpeechRecognitionDelegateTask_localSpeechRecognitionClient_didFinishRecognition___block_invoke(uint64_t a1)
{
}

void __64___SFSpeechRecognitionDelegateTask__handleDidFinishRecognition___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (!*(unsigned char *)(v2 + 112) && !*(unsigned char *)(v2 + 113))
    {
      uint64_t v3 = *(void **)(a1 + 32);
      uint64_t v4 = [*(id *)(a1 + 48) bestTranscription];
      double v5 = [v4 formattedString];
      [v3 speechRecognitionTask:v2 didReceiveSearchResults:MEMORY[0x1E4F1CC08] recognizedText:v5 stable:1 final:1];
    }
  }
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) speechRecognitionTask:*(void *)(a1 + 40) didFinishRecognition:*(void *)(a1 + 48)];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(NSObject **)(v6 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64___SFSpeechRecognitionDelegateTask__handleDidFinishRecognition___block_invoke_2;
  block[3] = &unk_1E61557A0;
  block[4] = v6;
  dispatch_async(v7, block);
}

uint64_t __64___SFSpeechRecognitionDelegateTask__handleDidFinishRecognition___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 64) = 1;
  return result;
}

void __108___SFSpeechRecognitionDelegateTask_localSpeechRecognitionClient_didRecognizePartialResult_rawPartialResult___block_invoke(uint64_t a1)
{
}

void __69___SFSpeechRecognitionDelegateTask__handleDidRecognizePartialResult___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) speechRecognitionTask:*(void *)(a1 + 40) didHypothesizeTranscription:*(void *)(a1 + 48)];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && !*(unsigned char *)(a1 + 56) && !*(unsigned char *)(a1 + 57))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 48) formattedString];
    [v2 speechRecognitionTask:v3 didReceiveSearchResults:MEMORY[0x1E4F1CC08] recognizedText:v4 stable:1 final:0];
  }
}

void __67___SFSpeechRecognitionDelegateTask__handleSpeechRecordingDidCancel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  [WeakRetained speechRecognitionTaskWasCancelled:*(void *)(a1 + 32)];
}

void __108___SFSpeechRecognitionDelegateTask_dictationConnection_didReceiveSearchResults_recognizedText_stable_final___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  if (objc_opt_respondsToSelector())
  {
    v20 = WeakRetained;
    v21 = v2;
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v33;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v33 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [[_SFSearchResult alloc] initWithVoiceSearchResult:*(void *)(*((void *)&v32 + 1) + 8 * v9)];
          char v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[_SFSearchResult searchType](v10, "searchType"));
          [v4 setObject:v10 forKey:v11];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v7);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 113) = 1;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __108___SFSpeechRecognitionDelegateTask_dictationConnection_didReceiveSearchResults_recognizedText_stable_final___block_invoke_2;
    v26[3] = &unk_1E6154AD8;
    id WeakRetained = v20;
    id v12 = v20;
    uint64_t v13 = *(void *)(a1 + 32);
    id v27 = v12;
    uint64_t v28 = v13;
    id v29 = v4;
    id v30 = *(id *)(a1 + 48);
    __int16 v31 = *(_WORD *)(a1 + 56);
    id v14 = v4;
    id v2 = v21;
    [v21 addOperationWithBlock:v26];
  }
  if (*(unsigned char *)(a1 + 57))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 112) = 0;
    id v15 = *(id *)(*(void *)(a1 + 32) + 96);
    if (v15)
    {
      if (objc_opt_respondsToSelector())
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __108___SFSpeechRecognitionDelegateTask_dictationConnection_didReceiveSearchResults_recognizedText_stable_final___block_invoke_3;
        v22[3] = &unk_1E61551C0;
        id v16 = WeakRetained;
        uint64_t v17 = *(void *)(a1 + 32);
        id v23 = v16;
        uint64_t v24 = v17;
        id v25 = v15;
        [v2 addOperationWithBlock:v22];
      }
      uint64_t v18 = *(void *)(a1 + 32);
      v19 = *(void **)(v18 + 96);
      *(void *)(v18 + 96) = 0;
    }
    -[_SFSpeechRecognitionDelegateTask _tellDelegateDidFinishSuccessfully:](*(void *)(a1 + 32), 1);
    *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
  }
}

uint64_t __108___SFSpeechRecognitionDelegateTask_dictationConnection_didReceiveSearchResults_recognizedText_stable_final___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) speechRecognitionTask:*(void *)(a1 + 40) didReceiveSearchResults:*(void *)(a1 + 48) recognizedText:*(void *)(a1 + 56) stable:*(unsigned __int8 *)(a1 + 64) final:*(unsigned __int8 *)(a1 + 65)];
}

uint64_t __108___SFSpeechRecognitionDelegateTask_dictationConnection_didReceiveSearchResults_recognizedText_stable_final___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) speechRecognitionTask:*(void *)(a1 + 40) didFinishRecognition:*(void *)(a1 + 48)];
}

void __89___SFSpeechRecognitionDelegateTask_dictationConnection_didRecognizeTokens_languageModel___block_invoke(uint64_t a1)
{
  id v2 = +[SFUtilities transcriptionsWithTokens:*(void *)(a1 + 32)];
  -[_SFSpeechRecognitionDelegateTask _handleDidRecognizePartialResult:](*(void *)(a1 + 40), v2);
}

void __76___SFSpeechRecognitionDelegateTask_dictationConnection_didRecognizePackage___block_invoke(uint64_t a1)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v2 = +[SFUtilities recognizedResultFromPackage:*(void *)(a1 + 32)];
  if (+[SFUtilities isSpeechXPCEnabled])
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    id v4 = *(void **)(*(void *)(a1 + 40) + 40);
    if (v4) {
      id v4 = (void *)v4[7];
    }
    id v5 = v4;
    [v3 addEntriesFromDictionary:v5];

    v12[0] = @"textNotEmpty";
    uint64_t v6 = NSNumber;
    uint64_t v7 = [v2 bestTranscription];
    uint64_t v8 = [v7 formattedString];
    uint64_t v9 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v8, "length") != 0);
    v12[1] = @"isFinal";
    v13[0] = v9;
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isFinal"));
    v13[1] = v10;
    char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    [v3 addEntriesFromDictionary:v11];

    +[SFLocalSpeechRecognitionClient logCoreAnalyticsEvent:@"com.apple.speechapi.ResultPackage" withAnalytics:v3];
  }
  -[_SFSpeechRecognitionDelegateTask _handleDidFinishRecognition:](*(void *)(a1 + 40), v2);
}

uint64_t __77___SFSpeechRecognitionDelegateTask_dictationConnectionSpeechRecordingDidEnd___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) speechRecognitionTaskFinishedReadingAudio:*(void *)(a1 + 40)];
}

@end