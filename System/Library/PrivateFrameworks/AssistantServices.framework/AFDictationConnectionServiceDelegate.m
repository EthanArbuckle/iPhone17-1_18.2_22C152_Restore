@interface AFDictationConnectionServiceDelegate
- (AFDictationConnectionServiceDelegate)initWithDictationConnection:(id)a3;
- (void)languageDetectorFailedWithError:(id)a3;
- (void)speechDidBeginLocalRecognitionWithModelInfo:(id)a3;
- (void)speechDidDetectLanguage:(id)a3 confidenceScores:(id)a4 isConfident:(BOOL)a5;
- (void)speechDidFinishWritingAudioFile:(id)a3 error:(id)a4;
- (void)speechDidPauseRecognition;
- (void)speechDidProcessAudioDuration:(double)a3;
- (void)speechDidReceiveSearchResults:(id)a3 recognitionText:(id)a4 stable:(BOOL)a5 final:(BOOL)a6;
- (void)speechDidRecognizeFinalResultCandidatePackage:(id)a3;
- (void)speechDidRecognizeMultilingualSpeech:(id)a3;
- (void)speechDidRecognizePackage:(id)a3;
- (void)speechDidRecognizePartialPackage:(id)a3 nluResult:(id)a4 usingSpeechModel:(id)a5;
- (void)speechDidRecognizePartialResult:(id)a3;
- (void)speechDidRecognizePhrases:(id)a3 rawPhrases:(id)a4 utterances:(id)a5 rawUtterances:(id)a6 nluResult:(id)a7 usingSpeechModel:(id)a8 correctionContext:(id)a9 audioAnalytics:(id)a10;
- (void)speechDidRecognizeTokens:(id)a3 nluResult:(id)a4 usingSpeechModel:(id)a5;
- (void)speechDidRecognizeTranscriptionObjects:(id)a3 usingSpeechModel:(id)a4;
- (void)speechDidRecognizeVoiceCommandCandidatePackage:(id)a3 nluResult:(id)a4;
- (void)speechRecognitionDidFinishWithError:(id)a3;
- (void)speechRecordingDidBeginWithOptions:(id)a3 sessionUUID:(id)a4 sessionRequestUUID:(id)a5;
- (void)speechRecordingDidCancel;
- (void)speechRecordingDidEnd;
- (void)speechRecordingDidFail:(id)a3;
- (void)speechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3;
@end

@implementation AFDictationConnectionServiceDelegate

- (void).cxx_destruct
{
}

- (void)speechDidPauseRecognition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__AFDictationConnectionServiceDelegate_speechDidPauseRecognition__block_invoke;
  v4[3] = &unk_1E592C678;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  [v3 _dispatchAsync:v4];
}

uint64_t __65__AFDictationConnectionServiceDelegate_speechDidPauseRecognition__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tellSpeechDelegateDidPauseRecognition];
}

- (void)speechDidBeginLocalRecognitionWithModelInfo:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__AFDictationConnectionServiceDelegate_speechDidBeginLocalRecognitionWithModelInfo___block_invoke;
  v8[3] = &unk_1E592C710;
  id v9 = WeakRetained;
  id v10 = v4;
  id v6 = v4;
  id v7 = WeakRetained;
  [v7 _dispatchAsync:v8];
}

uint64_t __84__AFDictationConnectionServiceDelegate_speechDidBeginLocalRecognitionWithModelInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tellSpeechDelegateDidBeginLocalRecognitionWithModelInfo:*(void *)(a1 + 40)];
}

- (void)languageDetectorFailedWithError:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__AFDictationConnectionServiceDelegate_languageDetectorFailedWithError___block_invoke;
  v8[3] = &unk_1E592C710;
  id v9 = WeakRetained;
  id v10 = v4;
  id v6 = v4;
  id v7 = WeakRetained;
  [v7 _dispatchAsync:v8];
}

uint64_t __72__AFDictationConnectionServiceDelegate_languageDetectorFailedWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tellSpeechDelegateLanguageDetectorDidFail:*(void *)(a1 + 40)];
}

- (void)speechDidRecognizeMultilingualSpeech:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__AFDictationConnectionServiceDelegate_speechDidRecognizeMultilingualSpeech___block_invoke;
  v8[3] = &unk_1E592C710;
  id v9 = WeakRetained;
  id v10 = v4;
  id v6 = v4;
  id v7 = WeakRetained;
  [v7 _dispatchAsync:v8];
}

uint64_t __77__AFDictationConnectionServiceDelegate_speechDidRecognizeMultilingualSpeech___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tellSpeechDelegateMultilingualSpeechRecognized:*(void *)(a1 + 40)];
}

- (void)speechDidDetectLanguage:(id)a3 confidenceScores:(id)a4 isConfident:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__AFDictationConnectionServiceDelegate_speechDidDetectLanguage_confidenceScores_isConfident___block_invoke;
  v14[3] = &unk_1E5927388;
  id v15 = WeakRetained;
  id v16 = v8;
  id v17 = v9;
  BOOL v18 = a5;
  id v11 = v9;
  id v12 = v8;
  id v13 = WeakRetained;
  [v13 _dispatchAsync:v14];
}

uint64_t __93__AFDictationConnectionServiceDelegate_speechDidDetectLanguage_confidenceScores_isConfident___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tellSpeechDelegateLanguageDetected:*(void *)(a1 + 40) confidenceScores:*(void *)(a1 + 48) isConfident:*(unsigned __int8 *)(a1 + 56)];
}

- (void)speechDidReceiveSearchResults:(id)a3 recognitionText:(id)a4 stable:(BOOL)a5 final:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __99__AFDictationConnectionServiceDelegate_speechDidReceiveSearchResults_recognitionText_stable_final___block_invoke;
  v16[3] = &unk_1E5927248;
  id v17 = WeakRetained;
  id v18 = v10;
  id v19 = v11;
  BOOL v20 = a5;
  BOOL v21 = a6;
  id v13 = v11;
  id v14 = v10;
  id v15 = WeakRetained;
  [v15 _dispatchAsync:v16];
}

uint64_t __99__AFDictationConnectionServiceDelegate_speechDidReceiveSearchResults_recognitionText_stable_final___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tellSpeechDelegateSearchResultsReceived:*(void *)(a1 + 40) recognitionText:*(void *)(a1 + 48) stable:*(unsigned __int8 *)(a1 + 56) final:*(unsigned __int8 *)(a1 + 57)];
}

- (void)speechDidFinishWritingAudioFile:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__AFDictationConnectionServiceDelegate_speechDidFinishWritingAudioFile_error___block_invoke;
  v12[3] = &unk_1E592C338;
  id v13 = WeakRetained;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = WeakRetained;
  [v11 _dispatchAsync:v12];
}

uint64_t __78__AFDictationConnectionServiceDelegate_speechDidFinishWritingAudioFile_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tellSpeechDelegateAudioFileFinished:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)speechRecognitionDidFinishWithError:(id)a3
{
  id v4 = a3;
  id v5 = +[AFAnalytics sharedAnalytics];
  id v6 = v5;
  if (v4)
  {
    id v7 = AFAnalyticsContextCreateWithError(v4);
    [v6 logEventWithType:2217 context:v7];
  }
  else
  {
    [v5 logEventWithType:2216 context:0];
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__AFDictationConnectionServiceDelegate_speechRecognitionDidFinishWithError___block_invoke;
  v11[3] = &unk_1E592C710;
  id v12 = WeakRetained;
  id v13 = v4;
  id v9 = v4;
  id v10 = WeakRetained;
  [v10 _dispatchAsync:v11];
}

uint64_t __76__AFDictationConnectionServiceDelegate_speechRecognitionDidFinishWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelRequestTimeout];
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v3 = [v2 domain];
    if ([v3 isEqualToString:@"kAFAssistantErrorDomain"])
    {
      if ([*(id *)(a1 + 40) code] == 34)
      {

LABEL_10:
        [*(id *)(a1 + 32) _checkAndSetIsCapturingSpeech:0];
        goto LABEL_11;
      }
      uint64_t v6 = [*(id *)(a1 + 40) code];

      if (v6 == 1700) {
        goto LABEL_10;
      }
    }
    else
    {
    }
LABEL_11:
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    return [v7 _tellSpeechDelegateRecognitionDidFail:v8];
  }
  id v4 = *(void **)(a1 + 32);
  return [v4 _tellSpeechDelegateSpeechRecognitionDidSucceed];
}

- (void)speechDidRecognizeTranscriptionObjects:(id)a3 usingSpeechModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[AFAnalytics sharedAnalytics];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __96__AFDictationConnectionServiceDelegate_speechDidRecognizeTranscriptionObjects_usingSpeechModel___block_invoke;
  v19[3] = &unk_1E5927360;
  id v9 = v6;
  id v20 = v9;
  id v10 = v7;
  id v21 = v10;
  [v8 logEventWithType:2215 contextProvider:v19];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __96__AFDictationConnectionServiceDelegate_speechDidRecognizeTranscriptionObjects_usingSpeechModel___block_invoke_2;
  v15[3] = &unk_1E592C338;
  id v16 = WeakRetained;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = WeakRetained;
  [v14 _dispatchAsync:v15];
}

id __96__AFDictationConnectionServiceDelegate_speechDidRecognizeTranscriptionObjects_usingSpeechModel___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  [v2 setObject:v3 forKey:@"transcribedObjectsCount"];

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    [v2 setObject:v4 forKey:@"languageModel"];
  }
  return v2;
}

uint64_t __96__AFDictationConnectionServiceDelegate_speechDidRecognizeTranscriptionObjects_usingSpeechModel___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelRequestTimeout];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 _tellSpeechDelegateDidRecognizeTranscriptionObjects:v3 languageModel:v4];
}

- (void)speechDidProcessAudioDuration:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__AFDictationConnectionServiceDelegate_speechDidProcessAudioDuration___block_invoke;
  v6[3] = &unk_1E592B398;
  id v7 = WeakRetained;
  double v8 = a3;
  id v5 = WeakRetained;
  [v5 _dispatchAsync:v6];
}

uint64_t __70__AFDictationConnectionServiceDelegate_speechDidProcessAudioDuration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _extendRequestTimeout];
  id v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  return [v2 _tellSpeechDelegateDidProcessAudioDuration:v3];
}

- (void)speechDidRecognizePartialResult:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__AFDictationConnectionServiceDelegate_speechDidRecognizePartialResult___block_invoke;
  v8[3] = &unk_1E592C710;
  id v9 = WeakRetained;
  id v10 = v4;
  id v6 = v4;
  id v7 = WeakRetained;
  [v7 _dispatchAsync:v8];
}

uint64_t __72__AFDictationConnectionServiceDelegate_speechDidRecognizePartialResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _extendRequestTimeout];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _tellSpeechDelegateDidRecognizePartialResult:v3];
}

- (void)speechDidRecognizePartialPackage:(id)a3 nluResult:(id)a4 usingSpeechModel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[AFAnalytics sharedAnalytics];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __100__AFDictationConnectionServiceDelegate_speechDidRecognizePartialPackage_nluResult_usingSpeechModel___block_invoke;
  v24[3] = &unk_1E5927360;
  id v12 = v8;
  id v25 = v12;
  id v13 = v10;
  id v26 = v13;
  [v11 logEventWithType:2214 contextProvider:v24];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__AFDictationConnectionServiceDelegate_speechDidRecognizePartialPackage_nluResult_usingSpeechModel___block_invoke_2;
  v19[3] = &unk_1E592C220;
  id v20 = WeakRetained;
  id v21 = v12;
  id v22 = v9;
  id v23 = v13;
  id v15 = v13;
  id v16 = v9;
  id v17 = v12;
  id v18 = WeakRetained;
  [v18 _dispatchAsync:v19];
}

id __100__AFDictationConnectionServiceDelegate_speechDidRecognizePartialPackage_nluResult_usingSpeechModel___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = [*(id *)(a1 + 32) recognition];
  id v4 = [v3 oneBestTokenList];

  id v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  [v2 setObject:v5 forKey:@"tokensCount"];

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    [v2 setObject:v6 forKey:@"languageModel"];
  }

  return v2;
}

uint64_t __100__AFDictationConnectionServiceDelegate_speechDidRecognizePartialPackage_nluResult_usingSpeechModel___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _extendRequestTimeout];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  return [v2 _tellSpeechDelegateDidRecognizePartialSpeechPackage:v3 nluResult:v4 languageModel:v5];
}

- (void)speechDidRecognizeTokens:(id)a3 nluResult:(id)a4 usingSpeechModel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[AFAnalytics sharedAnalytics];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __92__AFDictationConnectionServiceDelegate_speechDidRecognizeTokens_nluResult_usingSpeechModel___block_invoke;
  v24[3] = &unk_1E5927360;
  id v12 = v8;
  id v25 = v12;
  id v13 = v10;
  id v26 = v13;
  [v11 logEventWithType:2214 contextProvider:v24];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__AFDictationConnectionServiceDelegate_speechDidRecognizeTokens_nluResult_usingSpeechModel___block_invoke_2;
  v19[3] = &unk_1E592C220;
  id v20 = WeakRetained;
  id v21 = v12;
  id v22 = v9;
  id v23 = v13;
  id v15 = v13;
  id v16 = v9;
  id v17 = v12;
  id v18 = WeakRetained;
  [v18 _dispatchAsync:v19];
}

id __92__AFDictationConnectionServiceDelegate_speechDidRecognizeTokens_nluResult_usingSpeechModel___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  [v2 setObject:v3 forKey:@"tokensCount"];

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    [v2 setObject:v4 forKey:@"languageModel"];
  }
  return v2;
}

uint64_t __92__AFDictationConnectionServiceDelegate_speechDidRecognizeTokens_nluResult_usingSpeechModel___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _extendRequestTimeout];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  return [v2 _tellSpeechDelegateDidRecognizeSpeechTokens:v3 nluResult:v4 languageModel:v5];
}

- (void)speechDidRecognizePhrases:(id)a3 rawPhrases:(id)a4 utterances:(id)a5 rawUtterances:(id)a6 nluResult:(id)a7 usingSpeechModel:(id)a8 correctionContext:(id)a9 audioAnalytics:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = +[AFAnalytics sharedAnalytics];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __162__AFDictationConnectionServiceDelegate_speechDidRecognizePhrases_rawPhrases_utterances_rawUtterances_nluResult_usingSpeechModel_correctionContext_audioAnalytics___block_invoke;
  v48[3] = &unk_1E5927338;
  id v24 = v15;
  id v49 = v24;
  id v25 = v20;
  id v50 = v25;
  id v26 = v21;
  id v51 = v26;
  [v23 logEventWithType:2213 contextProvider:v48];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __162__AFDictationConnectionServiceDelegate_speechDidRecognizePhrases_rawPhrases_utterances_rawUtterances_nluResult_usingSpeechModel_correctionContext_audioAnalytics___block_invoke_2;
  v38[3] = &unk_1E59272E8;
  id v39 = WeakRetained;
  id v40 = v24;
  id v41 = v16;
  id v42 = v17;
  id v43 = v18;
  id v44 = v19;
  id v45 = v25;
  id v46 = v26;
  id v47 = v22;
  id v28 = v22;
  id v29 = v26;
  id v30 = v25;
  id v31 = v19;
  id v32 = v18;
  id v33 = v17;
  id v34 = v16;
  id v35 = v24;
  id v36 = WeakRetained;
  [v36 _dispatchAsync:v38];
}

id __162__AFDictationConnectionServiceDelegate_speechDidRecognizePhrases_rawPhrases_utterances_rawUtterances_nluResult_usingSpeechModel_correctionContext_audioAnalytics___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  [v2 setObject:v3 forKey:@"phrasesCount"];

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    [v2 setObject:v4 forKey:@"languageModel"];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    [v2 setObject:v5 forKey:@"correctionContext"];
  }
  return v2;
}

uint64_t __162__AFDictationConnectionServiceDelegate_speechDidRecognizePhrases_rawPhrases_utterances_rawUtterances_nluResult_usingSpeechModel_correctionContext_audioAnalytics___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tellSpeechDelegateDidRecognizeSpeechPhrases:*(void *)(a1 + 40) rawPhrases:*(void *)(a1 + 48) utterances:*(void *)(a1 + 56) rawUtterances:*(void *)(a1 + 64) nluResult:*(void *)(a1 + 72) languageModel:*(void *)(a1 + 80) correctionIdentifier:*(void *)(a1 + 88) audioAnalytics:*(void *)(a1 + 96)];
}

- (void)speechDidRecognizeVoiceCommandCandidatePackage:(id)a3 nluResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__AFDictationConnectionServiceDelegate_speechDidRecognizeVoiceCommandCandidatePackage_nluResult___block_invoke;
  v12[3] = &unk_1E592C338;
  id v13 = WeakRetained;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = WeakRetained;
  [v11 _dispatchAsync:v12];
}

uint64_t __97__AFDictationConnectionServiceDelegate_speechDidRecognizeVoiceCommandCandidatePackage_nluResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelRequestTimeout];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 _tellSpeechDelegateDidRecognizeVoiceCommandCandidatePackage:v3 nluResult:v4];
}

- (void)speechDidRecognizeFinalResultCandidatePackage:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__AFDictationConnectionServiceDelegate_speechDidRecognizeFinalResultCandidatePackage___block_invoke;
  v8[3] = &unk_1E592C710;
  id v9 = WeakRetained;
  id v10 = v4;
  id v6 = v4;
  id v7 = WeakRetained;
  [v7 _dispatchAsync:v8];
}

uint64_t __86__AFDictationConnectionServiceDelegate_speechDidRecognizeFinalResultCandidatePackage___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelRequestTimeout];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _tellSpeechDelegateDidRecognizeFinalResultCandidatePackage:v3];
}

- (void)speechDidRecognizePackage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 recognition];
  id v6 = [v5 phrases];

  id v7 = +[AFAnalytics sharedAnalytics];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__AFDictationConnectionServiceDelegate_speechDidRecognizePackage___block_invoke;
  v15[3] = &unk_1E5927338;
  id v16 = v6;
  id v17 = &stru_1EEE35D28;
  id v18 = 0;
  id v8 = v6;
  [v7 logEventWithType:2213 contextProvider:v15];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__AFDictationConnectionServiceDelegate_speechDidRecognizePackage___block_invoke_2;
  v12[3] = &unk_1E592C710;
  id v13 = WeakRetained;
  id v14 = v4;
  id v10 = v4;
  id v11 = WeakRetained;
  [v11 _dispatchAsync:v12];
}

id __66__AFDictationConnectionServiceDelegate_speechDidRecognizePackage___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  [v2 setObject:v3 forKey:@"phrasesCount"];

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    [v2 setObject:v4 forKey:@"languageModel"];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    [v2 setObject:v5 forKey:@"correctionContext"];
  }
  return v2;
}

uint64_t __66__AFDictationConnectionServiceDelegate_speechDidRecognizePackage___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelRequestTimeout];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _tellSpeechDelegateDidRecognizePackage:v3];
}

- (void)speechRecordingDidFail:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[AFAnalytics sharedAnalytics];
  id v6 = AFAnalyticsContextCreateWithError(v4);
  [v5 logEventWithType:2212 context:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__AFDictationConnectionServiceDelegate_speechRecordingDidFail___block_invoke;
  v10[3] = &unk_1E592C710;
  id v11 = WeakRetained;
  id v12 = v4;
  id v8 = v4;
  id v9 = WeakRetained;
  [v9 _dispatchAsync:v10];
}

uint64_t __63__AFDictationConnectionServiceDelegate_speechRecordingDidFail___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _checkAndSetIsCapturingSpeech:0];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _tellSpeechDelegateRecordingDidFail:v3];
}

- (void)speechRecordingDidCancel
{
  uint64_t v3 = +[AFAnalytics sharedAnalytics];
  [v3 logEventWithType:2210 context:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__AFDictationConnectionServiceDelegate_speechRecordingDidCancel__block_invoke;
  v6[3] = &unk_1E592C678;
  id v7 = WeakRetained;
  id v5 = WeakRetained;
  [v5 _dispatchAsync:v6];
}

uint64_t __64__AFDictationConnectionServiceDelegate_speechRecordingDidCancel__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _checkAndSetIsCapturingSpeech:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 _tellSpeechDelegateRecordingDidCancel];
}

- (void)speechRecordingDidEnd
{
  uint64_t v3 = +[AFAnalytics sharedAnalytics];
  [v3 logEventWithType:2211 context:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__AFDictationConnectionServiceDelegate_speechRecordingDidEnd__block_invoke;
  v6[3] = &unk_1E592C678;
  id v7 = WeakRetained;
  id v5 = WeakRetained;
  [v5 _dispatchAsync:v6];
}

uint64_t __61__AFDictationConnectionServiceDelegate_speechRecordingDidEnd__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _scheduleRequestTimeout];
  [*(id *)(a1 + 32) _checkAndSetIsCapturingSpeech:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 _tellSpeechDelegateRecordingDidEnd];
}

- (void)speechRecordingDidBeginWithOptions:(id)a3 sessionUUID:(id)a4 sessionRequestUUID:(id)a5
{
  v28[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v10 = (__CFString *)a5;
  kdebug_trace();
  id v11 = +[AFAnalytics sharedAnalytics];
  v27[0] = @"dictationUIInteractionIdentifier";
  uint64_t v12 = [v8 interactionIdentifier];
  id v13 = (void *)v12;
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  else {
    id v14 = &stru_1EEE35D28;
  }
  v28[0] = v14;
  v27[1] = @"speechRecognitionSource";
  id v15 = @"server";
  if ([v8 forceOfflineRecognition] && objc_msgSend(v8, "secureOfflineOnly")) {
    id v15 = @"local";
  }
  if (v9) {
    id v16 = v9;
  }
  else {
    id v16 = &stru_1EEE35D28;
  }
  v28[1] = v15;
  v28[2] = v16;
  v27[2] = @"sessionID";
  v27[3] = @"sessionRequestUUID";
  if (v10) {
    id v17 = v10;
  }
  else {
    id v17 = &stru_1EEE35D28;
  }
  v28[3] = v17;
  v27[4] = @"dictationOptInStatus";
  id v18 = +[AFPreferences sharedPreferences];
  unint64_t v19 = [v18 siriDataSharingOptInStatus];
  if (v19 > 3) {
    id v20 = @"(unknown)";
  }
  else {
    id v20 = off_1E592B870[v19];
  }
  id v21 = v20;
  v28[4] = v21;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  [v11 logEventWithType:2209 context:v22];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __106__AFDictationConnectionServiceDelegate_speechRecordingDidBeginWithOptions_sessionUUID_sessionRequestUUID___block_invoke;
  v25[3] = &unk_1E592C710;
  v25[4] = self;
  id v26 = v8;
  id v24 = v8;
  [WeakRetained _dispatchAsync:v25];
}

void __106__AFDictationConnectionServiceDelegate_speechRecordingDidBeginWithOptions_sessionUUID_sessionRequestUUID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _tellSpeechDelegateRecordingDidBeginWithOptions:*(void *)(a1 + 40)];
}

- (void)speechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__AFDictationConnectionServiceDelegate_speechRecordingWillBeginWithInputAudioPowerXPCWrapper___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained _dispatchAsync:v7];
}

void __94__AFDictationConnectionServiceDelegate_speechRecordingWillBeginWithInputAudioPowerXPCWrapper___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _startInputAudioPowerUpdatesWithXPCWrapper:*(void *)(a1 + 40)];

  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [v3 _tellSpeechDelegateRecordingWillBegin];
}

- (AFDictationConnectionServiceDelegate)initWithDictationConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AFDictationConnectionServiceDelegate;
  id v5 = [(AFDictationConnectionServiceDelegate *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_connection, v4);
  }

  return v6;
}

@end