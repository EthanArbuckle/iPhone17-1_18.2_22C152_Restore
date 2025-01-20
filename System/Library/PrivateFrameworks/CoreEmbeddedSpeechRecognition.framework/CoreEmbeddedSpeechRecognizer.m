@interface CoreEmbeddedSpeechRecognizer
+ (BOOL)purgeInstalledAssetsExceptLanguages:(id)a3 assetType:(unint64_t)a4 error:(id *)a5;
+ (id)dictionaryWithContentsProfilePathForLanguage:(id)a3 errorOut:(id *)a4;
+ (id)offlineDictationStatusIgnoringCache:(BOOL)a3 error:(id *)a4;
+ (id)profilePathForLanguage:(id)a3 errorOut:(id *)a4;
+ (id)purgeInstalledAssetsExceptLanguages:(id)a3 error:(id *)a4;
+ (id)speechProfileDataLastModifiedDataForLanguage:(id)a3;
+ (void)cleanupUnusedSubscriptions;
+ (void)compileAllAssetsWithType:(unint64_t)a3 completion:(id)a4;
+ (void)compilePrimaryAssistantAssetWithCompletion:(id)a3;
+ (void)forceCooldownIfIdle;
+ (void)handlePostUpgradeSubscriptions;
- (CoreEmbeddedSpeechRecognizer)init;
- (CoreEmbeddedSpeechRecognizer)initWithDelegate:(id)a3 instanceUUID:(unsigned __int8)a4[16];
- (CoreEmbeddedSpeechRecognizerDelegate)delegate;
- (id)_connection;
- (id)_newConnection;
- (id)_service;
- (id)_serviceWithFunctionName:(id)a3 errorHandler:(id)a4;
- (id)_synchronousServiceWithErrorHandler:(id)a3;
- (id)modelPropertiesForAssetConfig:(id)a3 error:(id *)a4;
- (unsigned)instanceUUID;
- (void)addAudioPacket:(id)a3;
- (void)addAudioPacket:(id)a3 packetRecordedTime:(id)a4 packetReadyUpstreamTime:(id)a5;
- (void)createSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 JSONData:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)deleteAllDESRecordsForDictationPersonalization;
- (void)fetchUserDataForLanguage:(id)a3 completion:(id)a4;
- (void)finishAudio;
- (void)getOfflineAssetStatusIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withCompletion:(id)a5;
- (void)getOfflineAssetStatusIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withDetailedStatus:(BOOL)a5 withCompletion:(id)a6;
- (void)getOfflineDictationStatusIgnoringCache:(BOOL)a3 withCompletion:(id)a4;
- (void)getOfflineDictationStatusWithCompletion:(id)a3;
- (void)invalidate;
- (void)invalidatePersonalizedLM;
- (void)invalidateUaapLM;
- (void)pauseRecognition;
- (void)preheatSpeechRecognitionWithAssetConfig:(id)a3 preheatSource:(id)a4 modelOverrideURL:(id)a5;
- (void)preheatSpeechRecognitionWithLanguage:(id)a3 modelOverrideURL:(id)a4;
- (void)readProfileAndUserDataWithLanguage:(id)a3 allowOverride:(BOOL)a4 completion:(id)a5;
- (void)redecodeWithAudioDatas:(id)a3 language:(id)a4 task:(id)a5 samplingRate:(unint64_t)a6 completion:(id)a7;
- (void)removePersonalizedLMForFidesOnly:(BOOL)a3;
- (void)requestEagerResult;
- (void)resetDESWithCompletion:(id)a3;
- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5;
- (void)runCorrectedTextEvaluationWithAudioDatas:(id)a3 recordDatas:(id)a4 language:(id)a5 samplingRate:(unint64_t)a6 caseSensitive:(BOOL)a7 skipLME:(BOOL)a8 wordSenseAccessListSet:(id)a9 completion:(id)a10;
- (void)runEvaluationWithDESRecordDatas:(id)a3 language:(id)a4 recipe:(id)a5 attachments:(id)a6 fidesPersonalizedLMPath:(id)a7 fidesPersonalizedLMTrainingAsset:(id)a8 scrubResult:(BOOL)a9 completion:(id)a10;
- (void)runEvaluationWithDESRecordDatas:(id)a3 language:(id)a4 recipe:(id)a5 fidesPersonalizedLMPath:(id)a6 fidesPersonalizedLMTrainingAsset:(id)a7 scrubResult:(BOOL)a8 completion:(id)a9;
- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4;
- (void)speechServiceDidFinishRecognitionWithStatistics:(id)a3 error:(id)a4;
- (void)speechServiceDidProcessAudioDuration:(double)a3;
- (void)speechServiceDidProduceEndpointFeaturesWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 processedAudioDurationInMilliseconds:(int64_t)a8 acousticEndpointerScore:(double)a9;
- (void)speechServiceDidProduceLoggablePackage:(id)a3;
- (void)speechServiceDidRecognizeFinalResultCandidatePackage:(id)a3;
- (void)speechServiceDidRecognizePackage:(id)a3;
- (void)speechServiceDidRecognizePackage:(id)a3 withMetadata:(id)a4;
- (void)speechServiceDidRecognizePartialPackage:(id)a3 withMetadata:(id)a4;
- (void)speechServiceDidRecognizeRawEagerRecognitionCandidate:(id)a3;
- (void)speechServiceDidRecognizeTokens:(id)a3;
- (void)speechServiceDidRecognizeTokens:(id)a3 withMetadata:(id)a4;
- (void)speechServiceDidRecognizeVoiceCommandCandidatePackage:(id)a3 withMetadata:(id)a4;
- (void)speechServiceDidSelectRecognitionModelWithModelProperties:(id)a3;
- (void)startMissingAssetDownload;
- (void)startSpeechRecognitionWithParameters:(id)a3 didStartHandler:(id)a4;
- (void)startSpeechRecognitionWithParameters:(id)a3 didStartHandlerWithInfo:(id)a4;
- (void)stopAudioDecoding;
- (void)updateSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 completion:(id)a5;
- (void)writeUaapOovsForLanguage:(id)a3 bundleId:(id)a4 customProns:(id)a5 newOovs:(id)a6 completion:(id)a7;
@end

@implementation CoreEmbeddedSpeechRecognizer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preheatedProfile, 0);
  objc_storeStrong((id *)&self->_preheatedProfileAssetPath, 0);
  objc_storeStrong((id *)&self->_recognitionError, 0);
  objc_storeStrong((id *)&self->_currentLanguage, 0);
  objc_storeStrong((id *)&self->_esConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (CoreEmbeddedSpeechRecognizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CoreEmbeddedSpeechRecognizerDelegate *)WeakRetained;
}

- (void)invalidateUaapLM
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CoreEmbeddedSpeechRecognizer_invalidateUaapLM__block_invoke;
  block[3] = &unk_1E61C38C0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __48__CoreEmbeddedSpeechRecognizer_invalidateUaapLM__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithUTF8String:"-[CoreEmbeddedSpeechRecognizer invalidateUaapLM]_block_invoke"];
  v2 = [v1 _serviceWithFunctionName:v3 errorHandler:&__block_literal_global_418];
  [v2 invalidateUaapLm];
}

void __48__CoreEmbeddedSpeechRecognizer_invalidateUaapLM__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[CoreEmbeddedSpeechRecognizer invalidateUaapLM]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_ERROR, "%s UaaP: Invalidation error %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)removePersonalizedLMForFidesOnly:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__CoreEmbeddedSpeechRecognizer_removePersonalizedLMForFidesOnly___block_invoke;
  v4[3] = &unk_1E61C3D38;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

void __65__CoreEmbeddedSpeechRecognizer_removePersonalizedLMForFidesOnly___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _synchronousServiceWithErrorHandler:&__block_literal_global_413];
  [v2 removePersonalizedLMForFidesOnly:*(unsigned __int8 *)(a1 + 40) completion:&__block_literal_global_416];
}

void __65__CoreEmbeddedSpeechRecognizer_removePersonalizedLMForFidesOnly___block_invoke_414()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    id v2 = "-[CoreEmbeddedSpeechRecognizer removePersonalizedLMForFidesOnly:]_block_invoke";
    _os_log_impl(&dword_1B8CCB000, v0, OS_LOG_TYPE_INFO, "%s PLM: Removed", (uint8_t *)&v1, 0xCu);
  }
}

void __65__CoreEmbeddedSpeechRecognizer_removePersonalizedLMForFidesOnly___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    BOOL v5 = "-[CoreEmbeddedSpeechRecognizer removePersonalizedLMForFidesOnly:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_ERROR, "%s PLM: Removal error %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)invalidatePersonalizedLM
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CoreEmbeddedSpeechRecognizer_invalidatePersonalizedLM__block_invoke;
  block[3] = &unk_1E61C38C0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __56__CoreEmbeddedSpeechRecognizer_invalidatePersonalizedLM__block_invoke(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithUTF8String:"-[CoreEmbeddedSpeechRecognizer invalidatePersonalizedLM]_block_invoke"];
  id v2 = [v1 _serviceWithFunctionName:v3 errorHandler:&__block_literal_global_411];
  [v2 invalidatePersonalizedLM];
}

void __56__CoreEmbeddedSpeechRecognizer_invalidatePersonalizedLM__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    BOOL v5 = "-[CoreEmbeddedSpeechRecognizer invalidatePersonalizedLM]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_ERROR, "%s PLM: Invalidation error %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)writeUaapOovsForLanguage:(id)a3 bundleId:(id)a4 customProns:(id)a5 newOovs:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  queue = self->_queue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __97__CoreEmbeddedSpeechRecognizer_writeUaapOovsForLanguage_bundleId_customProns_newOovs_completion___block_invoke;
  v23[3] = &unk_1E61C3D10;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v16;
  dispatch_async(queue, v23);
}

void __97__CoreEmbeddedSpeechRecognizer_writeUaapOovsForLanguage_bundleId_customProns_newOovs_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithUTF8String:"-[CoreEmbeddedSpeechRecognizer writeUaapOovsForLanguage:bundleId:customProns:newOovs:completion:]_block_invoke"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__CoreEmbeddedSpeechRecognizer_writeUaapOovsForLanguage_bundleId_customProns_newOovs_completion___block_invoke_2;
  v5[3] = &unk_1E61C3958;
  id v6 = *(id *)(a1 + 72);
  int v4 = [v2 _serviceWithFunctionName:v3 errorHandler:v5];
  [v4 writeUaapOovsForLanguage:*(void *)(a1 + 40) bundleId:*(void *)(a1 + 48) customProns:*(void *)(a1 + 56) newOovs:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
}

uint64_t __97__CoreEmbeddedSpeechRecognizer_writeUaapOovsForLanguage_bundleId_customProns_newOovs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startMissingAssetDownload
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CoreEmbeddedSpeechRecognizer_startMissingAssetDownload__block_invoke;
  block[3] = &unk_1E61C38C0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __57__CoreEmbeddedSpeechRecognizer_startMissingAssetDownload__block_invoke(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithUTF8String:"-[CoreEmbeddedSpeechRecognizer startMissingAssetDownload]_block_invoke"];
  id v2 = [v1 _serviceWithFunctionName:v3 errorHandler:0];
  [v2 startMissingAssetDownload];
}

- (void)fetchUserDataForLanguage:(id)a3 completion:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    int v4 = (objc_class *)MEMORY[0x1E4F28C58];
    BOOL v5 = (void (**)(id, void *, void))a4;
    id v6 = [v4 alloc];
    uint64_t v7 = *MEMORY[0x1E4F4E698];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"No API is available to fetch user data.";
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v9 = (void *)[v6 initWithDomain:v7 code:500 userInfo:v8];

    v5[2](v5, v9, 0);
  }
}

- (void)speechServiceDidProduceLoggablePackage:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 localSpeechRecognizer:self didProduceLoggablePackage:v7];
  }
}

- (void)speechServiceDidProduceEndpointFeaturesWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 processedAudioDurationInMilliseconds:(int64_t)a8 acousticEndpointerScore:(double)a9
{
  id v19 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    [v18 localSpeechRecognizer:self didProduceEndpointFeaturesWithWordCount:a3 trailingSilenceDuration:a4 eosLikelihood:v19 pauseCounts:a8 silencePosterior:a5 processedAudioDurationInMilliseconds:a7 acousticEndpointerScore:a9];
  }
}

- (void)speechServiceDidFinishRecognitionWithStatistics:(id)a3 error:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (NSError *)a4;
  if (!v7)
  {
    if (self->_hasRecognizedAnything)
    {
      id v7 = 0;
    }
    else
    {
      uint64_t v8 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        int v11 = 136315138;
        id v12 = "-[CoreEmbeddedSpeechRecognizer speechServiceDidFinishRecognitionWithStatistics:error:]";
        _os_log_impl(&dword_1B8CCB000, v8, OS_LOG_TYPE_INFO, "%s No speech recognized, synthesizing local speech error", (uint8_t *)&v11, 0xCu);
      }
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4E698] code:1110 userInfo:0];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained localSpeechRecognizer:self didCompletionRecognitionWithStatistics:v6 error:v7];

  self->_recognitionActive = 0;
  recognitionError = self->_recognitionError;
  self->_recognitionError = v7;
}

- (void)speechServiceDidRecognizePackage:(id)a3 withMetadata:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = objc_msgSend(v6, "recognition", 0);
  v9 = [v8 utterances];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v19 + 1) + 8 * i) interpretationIndices];
        uint64_t v15 = [v14 count];

        if (v15)
        {
          self->_hasRecognizedAnything = 1;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    [v18 localSpeechRecognizer:self didRecognizePackage:v6 withMetadata:v7];
  }
}

- (void)speechServiceDidRecognizePackage:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v5 = objc_msgSend(v4, "recognition", 0);
  id v6 = [v5 utterances];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) interpretationIndices];
        uint64_t v12 = [v11 count];

        if (v12)
        {
          self->_hasRecognizedAnything = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained localSpeechRecognizer:self didRecognizePackage:v4];
}

- (void)speechServiceDidRecognizeVoiceCommandCandidatePackage:(id)a3 withMetadata:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 localSpeechRecognizer:self didRecognizeVoiceCommandCandidatePackage:v10 withMetadata:v6];
  }
}

- (void)speechServiceDidRecognizeFinalResultCandidatePackage:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 localSpeechRecognizer:self didRecognizeFinalResultCandidatePackage:v7];
  }
}

- (void)speechServiceDidRecognizeRawEagerRecognitionCandidate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained localSpeechRecognizer:self didRecognizeRawEagerRecognitionCandidate:v5];
}

- (void)speechServiceDidProcessAudioDuration:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained localSpeechRecognizer:self didProcessAudioDuration:a3];
}

- (void)speechServiceDidRecognizePartialPackage:(id)a3 withMetadata:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 localSpeechRecognizer:self didRecognizePartialPackage:v10 withMetadata:v6];
  }
}

- (void)speechServiceDidRecognizeTokens:(id)a3 withMetadata:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 localSpeechRecognizer:self didRecognizeTokens:v10 withMetadata:v6];
  }
}

- (void)speechServiceDidRecognizeTokens:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained localSpeechRecognizer:self didRecognizeTokens:v5];
}

- (void)speechServiceDidSelectRecognitionModelWithModelProperties:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 localSpeechRecognizer:self didSelectRecognitionModelWithModelProperties:v7];
  }
}

- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__CoreEmbeddedSpeechRecognizer_resumeRecognitionWithPrefixText_postfixText_selectedText___block_invoke;
  v15[3] = &unk_1E61C37D0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __89__CoreEmbeddedSpeechRecognizer_resumeRecognitionWithPrefixText_postfixText_selectedText___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  [v2 resumeRecognitionWithPrefixText:*(void *)(a1 + 40) postfixText:*(void *)(a1 + 48) selectedText:*(void *)(a1 + 56)];
}

- (void)pauseRecognition
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CoreEmbeddedSpeechRecognizer_pauseRecognition__block_invoke;
  block[3] = &unk_1E61C38C0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __48__CoreEmbeddedSpeechRecognizer_pauseRecognition__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _service];
  [v1 pauseRecognition];
}

- (unsigned)instanceUUID
{
  return (unsigned __int8 (*)[16])self->_instanceUUID;
}

- (void)deleteAllDESRecordsForDictationPersonalization
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__CoreEmbeddedSpeechRecognizer_deleteAllDESRecordsForDictationPersonalization__block_invoke;
  block[3] = &unk_1E61C38C0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __78__CoreEmbeddedSpeechRecognizer_deleteAllDESRecordsForDictationPersonalization__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithUTF8String:"-[CoreEmbeddedSpeechRecognizer deleteAllDESRecordsForDictationPersonalization]_block_invoke"];
  id v2 = [v1 _serviceWithFunctionName:v3 errorHandler:&__block_literal_global_387];
  [v2 deleteAllDESRecordsForDictationPersonalizationWithCompletion:&__block_literal_global_390];
}

void __78__CoreEmbeddedSpeechRecognizer_deleteAllDESRecordsForDictationPersonalization__block_invoke_388(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v4 = 136315394;
      char v5 = "-[CoreEmbeddedSpeechRecognizer deleteAllDESRecordsForDictationPersonalization]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, "%s Failed to delete DES Records for Dictation Personalization with error=%@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void __78__CoreEmbeddedSpeechRecognizer_deleteAllDESRecordsForDictationPersonalization__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    char v5 = "-[CoreEmbeddedSpeechRecognizer deleteAllDESRecordsForDictationPersonalization]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, "%s Failed to delete DES Records for Dictation Personalization with error=%@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CoreEmbeddedSpeechRecognizer_invalidate__block_invoke;
  block[3] = &unk_1E61C38C0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __42__CoreEmbeddedSpeechRecognizer_invalidate__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    [v2 invalidate];
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = 0;
  }
}

- (void)requestEagerResult
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CoreEmbeddedSpeechRecognizer_requestEagerResult__block_invoke;
  block[3] = &unk_1E61C38C0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __50__CoreEmbeddedSpeechRecognizer_requestEagerResult__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _service];
  [v1 requestEagerResult];
}

- (void)stopAudioDecoding
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CoreEmbeddedSpeechRecognizer_stopAudioDecoding__block_invoke;
  block[3] = &unk_1E61C38C0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__CoreEmbeddedSpeechRecognizer_stopAudioDecoding__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _service];
  [v1 stopAudioDecoding];
}

- (void)finishAudio
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CoreEmbeddedSpeechRecognizer_finishAudio__block_invoke;
  block[3] = &unk_1E61C38C0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __43__CoreEmbeddedSpeechRecognizer_finishAudio__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _service];
  [v1 finishAudio];
}

- (void)addAudioPacket:(id)a3 packetRecordedTime:(id)a4 packetReadyUpstreamTime:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__CoreEmbeddedSpeechRecognizer_addAudioPacket_packetRecordedTime_packetReadyUpstreamTime___block_invoke;
  v15[3] = &unk_1E61C37D0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __90__CoreEmbeddedSpeechRecognizer_addAudioPacket_packetRecordedTime_packetReadyUpstreamTime___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  [v2 addAudioPacket:*(void *)(a1 + 40) packetRecordedTime:*(void *)(a1 + 48) packetReadyUpstreamTime:*(void *)(a1 + 56)];
}

- (void)addAudioPacket:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CoreEmbeddedSpeechRecognizer_addAudioPacket___block_invoke;
  v7[3] = &unk_1E61C3C70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __47__CoreEmbeddedSpeechRecognizer_addAudioPacket___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  [v2 addAudioPacket:*(void *)(a1 + 40)];
}

- (id)modelPropertiesForAssetConfig:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 language];

  if (!v7)
  {
    id v10 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CoreEmbeddedSpeechRecognizer modelPropertiesForAssetConfig:error:]";
      _os_log_error_impl(&dword_1B8CCB000, v10, OS_LOG_TYPE_ERROR, "%s Not fetching assets for nil language", (uint8_t *)&buf, 0xCu);
      if (a4) {
        goto LABEL_7;
      }
    }
    else if (a4)
    {
LABEL_7:
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4E698] code:401 userInfo:0];
      id v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    id v9 = 0;
    goto LABEL_10;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__4239;
  id v25 = __Block_byref_object_dispose__4240;
  id v26 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__4239;
  long long v20 = __Block_byref_object_dispose__4240;
  id v21 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__CoreEmbeddedSpeechRecognizer_modelPropertiesForAssetConfig_error___block_invoke;
  v12[3] = &unk_1E61C3C48;
  v12[4] = self;
  id v14 = &v16;
  id v13 = v6;
  p_long long buf = &buf;
  dispatch_sync(queue, v12);
  if (a4) {
    *a4 = (id) v17[5];
  }
  id v9 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

LABEL_10:

  return v9;
}

void __68__CoreEmbeddedSpeechRecognizer_modelPropertiesForAssetConfig_error___block_invoke(int8x16_t *a1)
{
  id v2 = (void *)a1[2].i64[0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__CoreEmbeddedSpeechRecognizer_modelPropertiesForAssetConfig_error___block_invoke_2;
  v7[3] = &unk_1E61C3B30;
  v7[4] = a1[3].i64[0];
  uint64_t v3 = [v2 _synchronousServiceWithErrorHandler:v7];
  uint64_t v4 = a1[2].i64[1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__CoreEmbeddedSpeechRecognizer_modelPropertiesForAssetConfig_error___block_invoke_3;
  v5[3] = &unk_1E61C3C20;
  int8x16_t v6 = vextq_s8(a1[3], a1[3], 8uLL);
  [v3 fetchModelPropertiesForAssetConfig:v4 completion:v5];
}

void __68__CoreEmbeddedSpeechRecognizer_modelPropertiesForAssetConfig_error___block_invoke_2(uint64_t a1, void *a2)
{
}

void __68__CoreEmbeddedSpeechRecognizer_modelPropertiesForAssetConfig_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)resetDESWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CoreEmbeddedSpeechRecognizer_resetDESWithCompletion___block_invoke;
  block[3] = &unk_1E61C3BA8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

void __55__CoreEmbeddedSpeechRecognizer_resetDESWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = dispatch_group_create();
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__4239;
  id v14 = __Block_byref_object_dispose__4240;
  id v15 = 0;
  dispatch_group_enter(v2);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F5F4F8]) initWithBundleIdentifier:@"com.apple.fides.asr"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__CoreEmbeddedSpeechRecognizer_resetDESWithCompletion___block_invoke_2;
  v7[3] = &unk_1E61C3BF8;
  uint64_t v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 deleteAllSavedRecordsWithCompletion:v7];

  dispatch_time_t v5 = dispatch_time(0, 300000000000);
  dispatch_group_wait(v4, v5);
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v11[5]);
  }

  _Block_object_dispose(&v10, 8);
}

void __55__CoreEmbeddedSpeechRecognizer_resetDESWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = *MEMORY[0x1E4F4E370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[CoreEmbeddedSpeechRecognizer resetDESWithCompletion:]_block_invoke_2";
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_error_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_ERROR, "%s Error deleting all DES records (SPI v2): %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)readProfileAndUserDataWithLanguage:(id)a3 allowOverride:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = v9;
  if (v8)
  {
    id v11 = [v8 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__CoreEmbeddedSpeechRecognizer_readProfileAndUserDataWithLanguage_allowOverride_completion___block_invoke_2;
    block[3] = &unk_1E61C3BD0;
    void block[4] = self;
    id v16 = v11;
    id v17 = v10;
    BOOL v18 = a4;
    id v13 = v11;
    dispatch_async(queue, block);
  }
  else
  {
    id v14 = self->_queue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __92__CoreEmbeddedSpeechRecognizer_readProfileAndUserDataWithLanguage_allowOverride_completion___block_invoke;
    v19[3] = &unk_1E61C3BA8;
    id v20 = v9;
    dispatch_async(v14, v19);
    id v13 = v20;
  }
}

uint64_t __92__CoreEmbeddedSpeechRecognizer_readProfileAndUserDataWithLanguage_allowOverride_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__CoreEmbeddedSpeechRecognizer_readProfileAndUserDataWithLanguage_allowOverride_completion___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithUTF8String:"-[CoreEmbeddedSpeechRecognizer readProfileAndUserDataWithLanguage:allowOverride:completion:]_block_invoke_2"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__CoreEmbeddedSpeechRecognizer_readProfileAndUserDataWithLanguage_allowOverride_completion___block_invoke_3;
  v5[3] = &unk_1E61C3958;
  id v6 = *(id *)(a1 + 48);
  id v4 = [v2 _serviceWithFunctionName:v3 errorHandler:v5];
  [v4 readProfileAndUserDataWithLanguage:*(void *)(a1 + 40) allowOverride:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

void __92__CoreEmbeddedSpeechRecognizer_readProfileAndUserDataWithLanguage_allowOverride_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[CoreEmbeddedSpeechRecognizer readProfileAndUserDataWithLanguage:allowOverride:completion:]_block_invoke_3";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)redecodeWithAudioDatas:(id)a3 language:(id)a4 task:(id)a5 samplingRate:(unint64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, void))a7;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__4239;
  v31 = __Block_byref_object_dispose__4240;
  id v32 = 0;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__4239;
  id v25 = __Block_byref_object_dispose__4240;
  id v26 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__CoreEmbeddedSpeechRecognizer_redecodeWithAudioDatas_language_task_samplingRate_completion___block_invoke;
  block[3] = &unk_1E61C3B58;
  void block[4] = self;
  void block[5] = &v21;
  block[6] = &v27;
  dispatch_sync(queue, block);
  if (v28[5])
  {
    v15[2](v15, 0);
  }
  else
  {
    id v17 = (void *)v22[5];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __93__CoreEmbeddedSpeechRecognizer_redecodeWithAudioDatas_language_task_samplingRate_completion___block_invoke_3;
    v18[3] = &unk_1E61C3B80;
    uint64_t v19 = v15;
    [v17 redecodeWithAudioDatas:v12 language:v13 task:v14 samplingRate:a6 completion:v18];
  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

void __93__CoreEmbeddedSpeechRecognizer_redecodeWithAudioDatas_language_task_samplingRate_completion___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__CoreEmbeddedSpeechRecognizer_redecodeWithAudioDatas_language_task_samplingRate_completion___block_invoke_2;
  v6[3] = &unk_1E61C3B30;
  v6[4] = a1[6];
  uint64_t v3 = [v2 _synchronousServiceWithErrorHandler:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __93__CoreEmbeddedSpeechRecognizer_redecodeWithAudioDatas_language_task_samplingRate_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    __int16 v7 = *MEMORY[0x1E4F4E370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[CoreEmbeddedSpeechRecognizer redecodeWithAudioDatas:language:task:samplingRate:completion:]_block_invoke_3";
      _os_log_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_INFO, "%s User edit ASR redecoding was successful", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__CoreEmbeddedSpeechRecognizer_redecodeWithAudioDatas_language_task_samplingRate_completion___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)runEvaluationWithDESRecordDatas:(id)a3 language:(id)a4 recipe:(id)a5 fidesPersonalizedLMPath:(id)a6 fidesPersonalizedLMTrainingAsset:(id)a7 scrubResult:(BOOL)a8 completion:(id)a9
{
  LOBYTE(v9) = a8;
  [(CoreEmbeddedSpeechRecognizer *)self runEvaluationWithDESRecordDatas:a3 language:a4 recipe:a5 attachments:0 fidesPersonalizedLMPath:a6 fidesPersonalizedLMTrainingAsset:a7 scrubResult:v9 completion:a9];
}

- (void)runEvaluationWithDESRecordDatas:(id)a3 language:(id)a4 recipe:(id)a5 attachments:(id)a6 fidesPersonalizedLMPath:(id)a7 fidesPersonalizedLMTrainingAsset:(id)a8 scrubResult:(BOOL)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  long long v22 = (void (**)(id, void))a10;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__4239;
  v39 = __Block_byref_object_dispose__4240;
  id v40 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__4239;
  v33 = __Block_byref_object_dispose__4240;
  id v34 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __172__CoreEmbeddedSpeechRecognizer_runEvaluationWithDESRecordDatas_language_recipe_attachments_fidesPersonalizedLMPath_fidesPersonalizedLMTrainingAsset_scrubResult_completion___block_invoke;
  block[3] = &unk_1E61C3B58;
  void block[4] = self;
  void block[5] = &v29;
  block[6] = &v35;
  dispatch_sync(queue, block);
  if (v36[5])
  {
    v22[2](v22, 0);
  }
  else
  {
    uint64_t v24 = (void *)v30[5];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __172__CoreEmbeddedSpeechRecognizer_runEvaluationWithDESRecordDatas_language_recipe_attachments_fidesPersonalizedLMPath_fidesPersonalizedLMTrainingAsset_scrubResult_completion___block_invoke_3;
    v26[3] = &unk_1E61C3B80;
    uint64_t v27 = v22;
    LOBYTE(v25) = a9;
    [v24 runEvaluationWithDESRecordDatas:v16 language:v17 recipe:v18 attachments:v19 fidesPersonalizedLMPath:v20 fidesPersonalizedLMTrainingAsset:v21 scrubResult:v25 completion:v26];
  }
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
}

void __172__CoreEmbeddedSpeechRecognizer_runEvaluationWithDESRecordDatas_language_recipe_attachments_fidesPersonalizedLMPath_fidesPersonalizedLMTrainingAsset_scrubResult_completion___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __172__CoreEmbeddedSpeechRecognizer_runEvaluationWithDESRecordDatas_language_recipe_attachments_fidesPersonalizedLMPath_fidesPersonalizedLMTrainingAsset_scrubResult_completion___block_invoke_2;
  v6[3] = &unk_1E61C3B30;
  v6[4] = a1[6];
  uint64_t v3 = [v2 _synchronousServiceWithErrorHandler:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __172__CoreEmbeddedSpeechRecognizer_runEvaluationWithDESRecordDatas_language_recipe_attachments_fidesPersonalizedLMPath_fidesPersonalizedLMTrainingAsset_scrubResult_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    __int16 v7 = *MEMORY[0x1E4F4E370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[CoreEmbeddedSpeechRecognizer runEvaluationWithDESRecordDatas:language:recipe:attachments:fidesPersonalizedL"
           "MPath:fidesPersonalizedLMTrainingAsset:scrubResult:completion:]_block_invoke_3";
      _os_log_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_INFO, "%s DES recipe evaluation was successful", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __172__CoreEmbeddedSpeechRecognizer_runEvaluationWithDESRecordDatas_language_recipe_attachments_fidesPersonalizedLMPath_fidesPersonalizedLMTrainingAsset_scrubResult_completion___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)runCorrectedTextEvaluationWithAudioDatas:(id)a3 recordDatas:(id)a4 language:(id)a5 samplingRate:(unint64_t)a6 caseSensitive:(BOOL)a7 skipLME:(BOOL)a8 wordSenseAccessListSet:(id)a9 completion:(id)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a9;
  id v20 = (void (**)(id, void))a10;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__4239;
  v36 = __Block_byref_object_dispose__4240;
  id v37 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__4239;
  v30 = __Block_byref_object_dispose__4240;
  id v31 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __163__CoreEmbeddedSpeechRecognizer_runCorrectedTextEvaluationWithAudioDatas_recordDatas_language_samplingRate_caseSensitive_skipLME_wordSenseAccessListSet_completion___block_invoke;
  block[3] = &unk_1E61C3B58;
  void block[4] = self;
  void block[5] = &v26;
  block[6] = &v32;
  dispatch_sync(queue, block);
  if (v33[5])
  {
    v20[2](v20, 0);
  }
  else
  {
    long long v22 = (void *)v27[5];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __163__CoreEmbeddedSpeechRecognizer_runCorrectedTextEvaluationWithAudioDatas_recordDatas_language_samplingRate_caseSensitive_skipLME_wordSenseAccessListSet_completion___block_invoke_3;
    v23[3] = &unk_1E61C3B80;
    uint64_t v24 = v20;
    [v22 runCorrectedTextEvaluationWithAudioDatas:v16 recordDatas:v17 language:v18 samplingRate:a6 caseSensitive:v11 skipLME:v10 wordSenseAccessListSet:v19 completion:v23];
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
}

void __163__CoreEmbeddedSpeechRecognizer_runCorrectedTextEvaluationWithAudioDatas_recordDatas_language_samplingRate_caseSensitive_skipLME_wordSenseAccessListSet_completion___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __163__CoreEmbeddedSpeechRecognizer_runCorrectedTextEvaluationWithAudioDatas_recordDatas_language_samplingRate_caseSensitive_skipLME_wordSenseAccessListSet_completion___block_invoke_2;
  v6[3] = &unk_1E61C3B30;
  v6[4] = a1[6];
  uint64_t v3 = [v2 _synchronousServiceWithErrorHandler:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __163__CoreEmbeddedSpeechRecognizer_runCorrectedTextEvaluationWithAudioDatas_recordDatas_language_samplingRate_caseSensitive_skipLME_wordSenseAccessListSet_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    __int16 v7 = *MEMORY[0x1E4F4E370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[CoreEmbeddedSpeechRecognizer runCorrectedTextEvaluationWithAudioDatas:recordDatas:language:samplingRate:cas"
           "eSensitive:skipLME:wordSenseAccessListSet:completion:]_block_invoke_3";
      _os_log_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_INFO, "%s DES recipe evaluation was successful", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __163__CoreEmbeddedSpeechRecognizer_runCorrectedTextEvaluationWithAudioDatas_recordDatas_language_samplingRate_caseSensitive_skipLME_wordSenseAccessListSet_completion___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)getOfflineDictationStatusWithCompletion:(id)a3
{
}

- (void)getOfflineDictationStatusIgnoringCache:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__CoreEmbeddedSpeechRecognizer_getOfflineDictationStatusIgnoringCache_withCompletion___block_invoke;
  block[3] = &unk_1E61C3B08;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __86__CoreEmbeddedSpeechRecognizer_getOfflineDictationStatusIgnoringCache_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [NSString stringWithUTF8String:"-[CoreEmbeddedSpeechRecognizer getOfflineDictationStatusIgnoringCache:withCompletion:]_block_invoke"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__CoreEmbeddedSpeechRecognizer_getOfflineDictationStatusIgnoringCache_withCompletion___block_invoke_2;
  v5[3] = &unk_1E61C3958;
  id v6 = *(id *)(a1 + 40);
  uint64_t v4 = [v2 _serviceWithFunctionName:v3 errorHandler:v5];
  [v4 getOfflineDictationStatusIgnoringCache:*(unsigned __int8 *)(a1 + 48) withCompletion:*(void *)(a1 + 40)];
}

uint64_t __86__CoreEmbeddedSpeechRecognizer_getOfflineDictationStatusIgnoringCache_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getOfflineAssetStatusIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withDetailedStatus:(BOOL)a5 withCompletion:(id)a6
{
  id v10 = a6;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __111__CoreEmbeddedSpeechRecognizer_getOfflineAssetStatusIgnoringCache_assetType_withDetailedStatus_withCompletion___block_invoke;
  v13[3] = &unk_1E61C3AE0;
  v13[4] = self;
  id v14 = v10;
  BOOL v16 = a3;
  unint64_t v15 = a4;
  BOOL v17 = a5;
  id v12 = v10;
  dispatch_async(queue, v13);
}

void __111__CoreEmbeddedSpeechRecognizer_getOfflineAssetStatusIgnoringCache_assetType_withDetailedStatus_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [NSString stringWithUTF8String:"-[CoreEmbeddedSpeechRecognizer getOfflineAssetStatusIgnoringCache:assetType:withDetailedStatus:withCompletion:]_block_invoke"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __111__CoreEmbeddedSpeechRecognizer_getOfflineAssetStatusIgnoringCache_assetType_withDetailedStatus_withCompletion___block_invoke_2;
  v5[3] = &unk_1E61C3958;
  id v6 = *(id *)(a1 + 40);
  uint64_t v4 = [v2 _serviceWithFunctionName:v3 errorHandler:v5];
  [v4 getOfflineAssetStatusIgnoringCache:*(unsigned __int8 *)(a1 + 56) assetType:*(void *)(a1 + 48) withDetailedStatus:*(unsigned __int8 *)(a1 + 57) withCompletion:*(void *)(a1 + 40)];
}

uint64_t __111__CoreEmbeddedSpeechRecognizer_getOfflineAssetStatusIgnoringCache_assetType_withDetailedStatus_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getOfflineAssetStatusIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withCompletion:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __92__CoreEmbeddedSpeechRecognizer_getOfflineAssetStatusIgnoringCache_assetType_withCompletion___block_invoke;
  v11[3] = &unk_1E61C3AB8;
  v11[4] = self;
  id v12 = v8;
  BOOL v14 = a3;
  unint64_t v13 = a4;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __92__CoreEmbeddedSpeechRecognizer_getOfflineAssetStatusIgnoringCache_assetType_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [NSString stringWithUTF8String:"-[CoreEmbeddedSpeechRecognizer getOfflineAssetStatusIgnoringCache:assetType:withCompletion:]_block_invoke"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__CoreEmbeddedSpeechRecognizer_getOfflineAssetStatusIgnoringCache_assetType_withCompletion___block_invoke_2;
  v5[3] = &unk_1E61C3958;
  id v6 = *(id *)(a1 + 40);
  uint64_t v4 = [v2 _serviceWithFunctionName:v3 errorHandler:v5];
  [v4 getOfflineAssetStatusIgnoringCache:*(unsigned __int8 *)(a1 + 56) assetType:*(void *)(a1 + 48) withCompletion:*(void *)(a1 + 40)];
}

uint64_t __92__CoreEmbeddedSpeechRecognizer_getOfflineAssetStatusIgnoringCache_assetType_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__CoreEmbeddedSpeechRecognizer_updateSpeechProfileWithLanguage_modelOverridePath_completion___block_invoke;
  v15[3] = &unk_1E61C3A90;
  id v16 = v8;
  BOOL v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __93__CoreEmbeddedSpeechRecognizer_updateSpeechProfileWithLanguage_modelOverridePath_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  uint64_t v3 = MEMORY[0x1BA9CBEC0]();
  uint64_t v4 = (void *)v3;
  if (v3) {
    id v5 = (void *)v3;
  }
  else {
    id v5 = v2;
  }
  id v6 = v5;

  __int16 v7 = [v6 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

  id v8 = *(void **)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93__CoreEmbeddedSpeechRecognizer_updateSpeechProfileWithLanguage_modelOverridePath_completion___block_invoke_2;
  v10[3] = &unk_1E61C3A68;
  v10[4] = v8;
  id v13 = *(id *)(a1 + 56);
  id v11 = v7;
  id v12 = *(id *)(a1 + 48);
  id v9 = v7;
  [v8 readProfileAndUserDataWithLanguage:v9 allowOverride:0 completion:v10];
}

void __93__CoreEmbeddedSpeechRecognizer_updateSpeechProfileWithLanguage_modelOverridePath_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = NSString;
  id v7 = a3;
  id v8 = a2;
  id v9 = [v6 stringWithUTF8String:"-[CoreEmbeddedSpeechRecognizer updateSpeechProfileWithLanguage:modelOverridePath:completion:]_block_invoke_2"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__CoreEmbeddedSpeechRecognizer_updateSpeechProfileWithLanguage_modelOverridePath_completion___block_invoke_3;
  v16[3] = &unk_1E61C3958;
  id v17 = *(id *)(a1 + 56);
  id v10 = [v5 _serviceWithFunctionName:v9 errorHandler:v16];
  id v11 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__CoreEmbeddedSpeechRecognizer_updateSpeechProfileWithLanguage_modelOverridePath_completion___block_invoke_4;
  v13[3] = &unk_1E61C3A40;
  id v14 = v11;
  id v15 = *(id *)(a1 + 56);
  [v10 updateSpeechProfileWithLanguage:v14 modelOverridePath:v12 existingProfile:v8 existingAssetPath:v7 completion:v13];
}

uint64_t __93__CoreEmbeddedSpeechRecognizer_updateSpeechProfileWithLanguage_modelOverridePath_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__CoreEmbeddedSpeechRecognizer_updateSpeechProfileWithLanguage_modelOverridePath_completion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v7)
  {
    uint64_t v25 = [v9 domain];
    if ([v25 isEqualToString:*MEMORY[0x1E4F4E698]])
    {
      uint64_t v26 = [v10 code];

      if (v26 == 1114)
      {
        uint64_t v27 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
        {
          uint64_t v28 = *(void *)(a1 + 32);
          *(_DWORD *)v42 = 136315394;
          *(void *)&v42[4] = "-[CoreEmbeddedSpeechRecognizer updateSpeechProfileWithLanguage:modelOverridePath:completi"
                               "on:]_block_invoke_4";
          *(_WORD *)&v42[12] = 2112;
          *(void *)&v42[14] = v28;
          _os_log_impl(&dword_1B8CCB000, v27, OS_LOG_TYPE_INFO, "%s Update skipped for %@, not propagating an error", v42, 0x16u);
        }
        uint64_t v29 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
        goto LABEL_18;
      }
    }
    else
    {
    }
    uint64_t v29 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_18:
    v29();
    goto LABEL_27;
  }
  id v11 = *(void **)(a1 + 40);
  id v12 = *(id *)(a1 + 32);
  id v13 = v11;
  id v34 = 0;
  id v14 = +[CoreEmbeddedSpeechRecognizer profilePathForLanguage:v12 errorOut:&v34];
  id v15 = v34;
  if (v14)
  {
    id v16 = [v12 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

    v41[0] = @"data";
    v41[1] = @"version";
    *(void *)v42 = v7;
    *(void *)&v42[8] = @"2.0";
    v41[2] = @"language";
    v41[3] = @"assetPath";
    *(void *)&v42[16] = v16;
    id v43 = v8;
    id v31 = v8;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:4];
    id v33 = 0;
    id v18 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v17 format:200 options:0 error:&v33];
    id v19 = v33;

    id v20 = (NSObject **)MEMORY[0x1E4F4E380];
    id v21 = *MEMORY[0x1E4F4E380];
    if (v18)
    {
      v30 = v17;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        v36 = "WriteSpeechProfileData";
        __int16 v37 = 2112;
        v38 = v16;
        _os_log_impl(&dword_1B8CCB000, v21, OS_LOG_TYPE_INFO, "%s Serialization of %@ speech profile done.", buf, 0x16u);
      }
      id v32 = v19;
      char v22 = [v18 writeToFile:v14 options:0x40000000 error:&v32];
      id v15 = v32;

      uint64_t v23 = *v20;
      uint64_t v24 = *v20;
      if (v22)
      {
        id v17 = v30;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315650;
          v36 = "WriteSpeechProfileData";
          __int16 v37 = 2112;
          v38 = v16;
          __int16 v39 = 2112;
          id v40 = v14;
          _os_log_impl(&dword_1B8CCB000, v23, OS_LOG_TYPE_INFO, "%s Persisted %@ speech profile to path=%@", buf, 0x20u);
        }
        id v19 = 0;
      }
      else
      {
        id v17 = v30;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315650;
          v36 = "WriteSpeechProfileData";
          __int16 v37 = 2112;
          v38 = v16;
          __int16 v39 = 2114;
          id v40 = v15;
          _os_log_error_impl(&dword_1B8CCB000, v23, OS_LOG_TYPE_ERROR, "%s Persisting %@ speech profile to disk failed with error=%{public}@", buf, 0x20u);
        }
        id v19 = v15;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315650;
        v36 = "WriteSpeechProfileData";
        __int16 v37 = 2112;
        v38 = v16;
        __int16 v39 = 2114;
        id v40 = v19;
        _os_log_error_impl(&dword_1B8CCB000, v21, OS_LOG_TYPE_ERROR, "%s Serialization of  %@ speech profile failed with error=%{public}@", buf, 0x20u);
      }
      id v15 = v19;
    }
    v13[2](v13, v19);

    id v8 = v31;
  }
  else
  {
    v13[2](v13, v15);
    id v16 = v12;
  }

LABEL_27:
}

- (void)createSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 JSONData:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__CoreEmbeddedSpeechRecognizer_createSpeechProfileWithLanguage_modelOverridePath_JSONData_completion___block_invoke;
  block[3] = &unk_1E61C3A18;
  id v22 = v12;
  id v23 = v13;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(queue, block);
}

void __102__CoreEmbeddedSpeechRecognizer_createSpeechProfileWithLanguage_modelOverridePath_JSONData_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [NSString stringWithUTF8String:"-[CoreEmbeddedSpeechRecognizer createSpeechProfileWithLanguage:modelOverridePath:JSONData:completion:]_block_invoke"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __102__CoreEmbeddedSpeechRecognizer_createSpeechProfileWithLanguage_modelOverridePath_JSONData_completion___block_invoke_2;
  v5[3] = &unk_1E61C3958;
  id v6 = *(id *)(a1 + 64);
  uint64_t v4 = [v2 _serviceWithFunctionName:v3 errorHandler:v5];
  [v4 createSpeechProfileWithLanguage:*(void *)(a1 + 40) modelOverridePath:*(void *)(a1 + 48) JSONData:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

uint64_t __102__CoreEmbeddedSpeechRecognizer_createSpeechProfileWithLanguage_modelOverridePath_JSONData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__CoreEmbeddedSpeechRecognizer_sendSpeechCorrectionInfo_interactionIdentifier___block_invoke;
  block[3] = &unk_1E61C37A8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __79__CoreEmbeddedSpeechRecognizer_sendSpeechCorrectionInfo_interactionIdentifier___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  id v4 = [NSString stringWithUTF8String:"-[CoreEmbeddedSpeechRecognizer sendSpeechCorrectionInfo:interactionIdentifier:]_block_invoke"];
  uint64_t v3 = [v2 _serviceWithFunctionName:v4 errorHandler:&__block_literal_global_372];
  [v3 sendSpeechCorrectionInfo:a1[5] interactionIdentifier:a1[6]];
}

void __79__CoreEmbeddedSpeechRecognizer_sendSpeechCorrectionInfo_interactionIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = (void *)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      id v4 = v3;
      id v5 = [v2 localizedDescription];
      int v6 = 136315394;
      id v7 = "-[CoreEmbeddedSpeechRecognizer sendSpeechCorrectionInfo:interactionIdentifier:]_block_invoke_2";
      __int16 v8 = 2112;
      id v9 = v5;
      _os_log_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_INFO, "%s Failed to send speech correction info: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)startSpeechRecognitionWithParameters:(id)a3 didStartHandlerWithInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke;
  block[3] = &unk_1E61C39D0;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke(id *a1)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)a1[4] + 8))
  {
    id v2 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v32 = "-[CoreEmbeddedSpeechRecognizer startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
      _os_log_error_impl(&dword_1B8CCB000, v2, OS_LOG_TYPE_ERROR, "%s Local speech recognizer restarted while already recognizing", buf, 0xCu);
    }
    uint64_t v3 = (void (**)(id, void, void *))a1[6];
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4E698] code:1100 userInfo:0];
    v3[2](v3, 0, v4);
  }
  else
  {
    id v4 = [a1[5] language];
    if (v4)
    {
      id v5 = [a1[4] _service];
      [v5 startRequestActivityWithCompletion:&__block_literal_global_4280];

      objc_storeStrong((id *)a1[4] + 7, v4);
      *((unsigned char *)a1[4] + 8) = 1;
      *((unsigned char *)a1[4] + 32) = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_363;
      aBlock[3] = &unk_1E61C39A8;
      id v6 = a1[5];
      id v7 = a1[4];
      id v28 = v6;
      id v29 = v7;
      id v30 = a1[6];
      __int16 v8 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
      id v9 = a1[4];
      uint64_t v10 = v9[10];
      if (v10 || v9[9])
      {
        id v11 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315138;
          id v32 = "-[CoreEmbeddedSpeechRecognizer startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
          _os_log_impl(&dword_1B8CCB000, v11, OS_LOG_TYPE_INFO, "%s Using preheat-loaded speech profile", buf, 0xCu);
          id v9 = a1[4];
          uint64_t v10 = v9[10];
        }
        v8[2](v8, v10, v9[9]);
        id v12 = a1[4];
        id v13 = (void *)v12[9];
        v12[9] = 0;

        id v14 = a1[4];
        id v15 = (id)v14[10];
        v14[10] = 0;
      }
      else
      {
        id v22 = [v4 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
        uint64_t v23 = MEMORY[0x1BA9CBEC0]();
        uint64_t v24 = (void *)v23;
        if (v23) {
          uint64_t v25 = (void *)v23;
        }
        else {
          uint64_t v25 = v22;
        }
        id v15 = v25;

        uint64_t v26 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          id v32 = "-[CoreEmbeddedSpeechRecognizer startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
          __int16 v33 = 2112;
          id v34 = v15;
          _os_log_impl(&dword_1B8CCB000, v26, OS_LOG_TYPE_INFO, "%s Loading speech profile for language %@", buf, 0x16u);
        }
        [a1[4] readProfileAndUserDataWithLanguage:v15 allowOverride:1 completion:v8];
      }

      id v16 = v28;
    }
    else
    {
      id v17 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        id v32 = "-[CoreEmbeddedSpeechRecognizer startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
        _os_log_error_impl(&dword_1B8CCB000, v17, OS_LOG_TYPE_ERROR, "%s Invalid nil language", buf, 0xCu);
      }
      id v18 = (void (**)(id, void, void *))a1[6];
      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F4E698];
      uint64_t v35 = *MEMORY[0x1E4F28588];
      v36[0] = @"Language is nil";
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
      id v21 = [v19 errorWithDomain:v20 code:1107 userInfo:v16];
      v18[2](v18, 0, v21);
    }
  }
}

void __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_363(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_2;
  v15[3] = &unk_1E61C3930;
  id v16 = v3;
  id v5 = v3;
  id v6 = [v4 mutatedCopyWithMutator:v15];
  id v7 = *(void **)(a1 + 40);
  __int16 v8 = [NSString stringWithUTF8String:"-[CoreEmbeddedSpeechRecognizer startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_3;
  v13[3] = &unk_1E61C3958;
  id v14 = *(id *)(a1 + 48);
  id v9 = [v7 _serviceWithFunctionName:v8 errorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_4;
  v11[3] = &unk_1E61C3980;
  uint64_t v10 = *(void **)(a1 + 48);
  v11[4] = *(void *)(a1 + 40);
  id v12 = v10;
  [v9 startSpeechRecognitionWithParameters:v6 didStartHandlerWithInfo:v11];
}

uint64_t __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setProfile:*(void *)(a1 + 32)];
}

uint64_t __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      __int16 v8 = v7;
      id v9 = [v6 localizedDescription];
      int v10 = 136315394;
      id v11 = "-[CoreEmbeddedSpeechRecognizer startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke_4";
      __int16 v12 = 2112;
      id v13 = v9;
      _os_log_impl(&dword_1B8CCB000, v8, OS_LOG_TYPE_INFO, "%s Failed to start local recognition: %@", (uint8_t *)&v10, 0x16u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __93__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandlerWithInfo___block_invoke_362()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    id v2 = "-[CoreEmbeddedSpeechRecognizer startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
    _os_log_impl(&dword_1B8CCB000, v0, OS_LOG_TYPE_INFO, "%s Local speech recognition completed", (uint8_t *)&v1, 0xCu);
  }
}

- (void)startSpeechRecognitionWithParameters:(id)a3 didStartHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandler___block_invoke;
  v8[3] = &unk_1E61C38E8;
  id v9 = v6;
  id v7 = v6;
  [(CoreEmbeddedSpeechRecognizer *)self startSpeechRecognitionWithParameters:a3 didStartHandlerWithInfo:v8];
}

void __85__CoreEmbeddedSpeechRecognizer_startSpeechRecognitionWithParameters_didStartHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = [v6 modelVersion];
  id v7 = [v6 modelType];

  (*(void (**)(uint64_t, id, void *, id))(v4 + 16))(v4, v8, v7, v5);
}

- (void)preheatSpeechRecognitionWithAssetConfig:(id)a3 preheatSource:(id)a4 modelOverrideURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __103__CoreEmbeddedSpeechRecognizer_preheatSpeechRecognitionWithAssetConfig_preheatSource_modelOverrideURL___block_invoke;
  v15[3] = &unk_1E61C37D0;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __103__CoreEmbeddedSpeechRecognizer_preheatSpeechRecognitionWithAssetConfig_preheatSource_modelOverrideURL___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) language];
  uint64_t v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v8 = "-[CoreEmbeddedSpeechRecognizer preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v2;
    _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, "%s Preheat loading profile with language %@", buf, 0x16u);
  }
  uint64_t v4 = *(void **)(a1 + 40);
  if (!v4[9] && !v4[10])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __103__CoreEmbeddedSpeechRecognizer_preheatSpeechRecognitionWithAssetConfig_preheatSource_modelOverrideURL___block_invoke_336;
    v6[3] = &unk_1E61C3780;
    v6[4] = v4;
    [v4 readProfileAndUserDataWithLanguage:v2 allowOverride:1 completion:v6];
    uint64_t v4 = *(void **)(a1 + 40);
  }
  id v5 = [v4 _service];
  [v5 preheatSpeechRecognitionWithAssetConfig:*(void *)(a1 + 32) preheatSource:*(void *)(a1 + 48) modelOverrideURL:*(void *)(a1 + 56)];
}

void __103__CoreEmbeddedSpeechRecognizer_preheatSpeechRecognitionWithAssetConfig_preheatSource_modelOverrideURL___block_invoke_336(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  id v7 = *MEMORY[0x1E4F4E380];
  BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      int v15 = 136315138;
      id v16 = "-[CoreEmbeddedSpeechRecognizer preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]_block_invoke";
      _os_log_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_INFO, "%s Loaded preheat-loaded speech profile", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v9 = [v5 copy];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 80);
    *(void *)(v10 + 80) = v9;

    uint64_t v12 = [v6 copy];
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 72);
    *(void *)(v13 + 72) = v12;
  }
  else if (v8)
  {
    int v15 = 136315138;
    id v16 = "-[CoreEmbeddedSpeechRecognizer preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]_block_invoke";
    _os_log_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_INFO, "%s Failed to load speech profile during preheat", (uint8_t *)&v15, 0xCu);
  }
}

- (void)preheatSpeechRecognitionWithLanguage:(id)a3 modelOverrideURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__CoreEmbeddedSpeechRecognizer_preheatSpeechRecognitionWithLanguage_modelOverrideURL___block_invoke;
  block[3] = &unk_1E61C37A8;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __86__CoreEmbeddedSpeechRecognizer_preheatSpeechRecognitionWithLanguage_modelOverrideURL___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    *(_DWORD *)long long buf = 136315394;
    id v9 = "-[CoreEmbeddedSpeechRecognizer preheatSpeechRecognitionWithLanguage:modelOverrideURL:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1B8CCB000, v2, OS_LOG_TYPE_INFO, "%s Preheat loading profile with language %@", buf, 0x16u);
  }
  uint64_t v4 = (void *)a1[5];
  if (!v4[9] && !v4[10])
  {
    uint64_t v5 = a1[4];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __86__CoreEmbeddedSpeechRecognizer_preheatSpeechRecognitionWithLanguage_modelOverrideURL___block_invoke_334;
    v7[3] = &unk_1E61C3780;
    void v7[4] = v4;
    [v4 readProfileAndUserDataWithLanguage:v5 allowOverride:1 completion:v7];
    uint64_t v4 = (void *)a1[5];
  }
  id v6 = [v4 _service];
  [v6 preheatSpeechRecognitionWithLanguage:a1[4] modelOverrideURL:a1[6]];
}

void __86__CoreEmbeddedSpeechRecognizer_preheatSpeechRecognitionWithLanguage_modelOverrideURL___block_invoke_334(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  id v7 = *MEMORY[0x1E4F4E380];
  BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      int v15 = 136315138;
      id v16 = "-[CoreEmbeddedSpeechRecognizer preheatSpeechRecognitionWithLanguage:modelOverrideURL:]_block_invoke";
      _os_log_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_INFO, "%s Loaded preheat-loaded speech profile", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v9 = [v5 copy];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 80);
    *(void *)(v10 + 80) = v9;

    uint64_t v12 = [v6 copy];
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 72);
    *(void *)(v13 + 72) = v12;
  }
  else if (v8)
  {
    int v15 = 136315138;
    id v16 = "-[CoreEmbeddedSpeechRecognizer preheatSpeechRecognitionWithLanguage:modelOverrideURL:]_block_invoke";
    _os_log_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_INFO, "%s Failed to load speech profile during preheat", (uint8_t *)&v15, 0xCu);
  }
}

- (id)_synchronousServiceWithErrorHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  id v5 = [(CoreEmbeddedSpeechRecognizer *)self _connection];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    BOOL v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4E698] code:601 userInfo:0];
    v4[2](v4, v8);

    id v7 = 0;
  }

  return v7;
}

- (id)_serviceWithFunctionName:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CoreEmbeddedSpeechRecognizer *)self _connection];
  if (v8)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__CoreEmbeddedSpeechRecognizer__serviceWithFunctionName_errorHandler___block_invoke;
    v12[3] = &unk_1E61C3758;
    id v13 = v6;
    id v14 = v7;
    uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:v12];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4E698] code:601 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);

    uint64_t v9 = 0;
  }

  return v9;
}

void __70__CoreEmbeddedSpeechRecognizer__serviceWithFunctionName_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[CoreEmbeddedSpeechRecognizer _serviceWithFunctionName:errorHandler:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_INFO, "%s %@: Local speech recognition not reachable: %@", (uint8_t *)&v6, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_service
{
  id v2 = [(CoreEmbeddedSpeechRecognizer *)self _connection];
  id v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)_connection
{
  if ((AFOfflineDictationCapable() & 1) != 0 || AFDeviceSupportsSiriUOD())
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    esConnection = self->_esConnection;
    if (!esConnection)
    {
      uint64_t v4 = [(CoreEmbeddedSpeechRecognizer *)self _newConnection];
      uint64_t v5 = self->_esConnection;
      self->_esConnection = v4;

      objc_initWeak(&location, self);
      int v6 = self->_esConnection;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __43__CoreEmbeddedSpeechRecognizer__connection__block_invoke;
      v12[3] = &unk_1E61C3730;
      objc_copyWeak(&v13, &location);
      [(NSXPCConnection *)v6 setInterruptionHandler:v12];
      id v7 = self->_esConnection;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __43__CoreEmbeddedSpeechRecognizer__connection__block_invoke_332;
      v10[3] = &unk_1E61C3730;
      objc_copyWeak(&v11, &location);
      [(NSXPCConnection *)v7 setInvalidationHandler:v10];
      [(NSXPCConnection *)self->_esConnection resume];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
      esConnection = self->_esConnection;
    }
    __int16 v8 = esConnection;
  }
  else
  {
    __int16 v8 = 0;
  }

  return v8;
}

void __43__CoreEmbeddedSpeechRecognizer__connection__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[CoreEmbeddedSpeechRecognizer _connection]_block_invoke";
    __int16 v10 = 2112;
    id v11 = @"com.apple.siri.embeddedspeech";
    _os_log_impl(&dword_1B8CCB000, v2, OS_LOG_TYPE_INFO, "%s %@ Interrupted", (uint8_t *)&v8, 0x16u);
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] invalidate];
    id v5 = v4[3];
    v4[3] = 0;

    if (*((unsigned char *)v4 + 8))
    {
      id v6 = objc_loadWeakRetained(v4 + 11);
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4E698] code:1107 userInfo:0];
      [v6 localSpeechRecognizer:v4 didCompletionRecognitionWithStatistics:0 error:v7];
    }
  }
}

void __43__CoreEmbeddedSpeechRecognizer__connection__block_invoke_332(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[CoreEmbeddedSpeechRecognizer _connection]_block_invoke";
    __int16 v10 = 2112;
    id v11 = @"com.apple.siri.embeddedspeech";
    _os_log_impl(&dword_1B8CCB000, v2, OS_LOG_TYPE_INFO, "%s %@ Invalidated", (uint8_t *)&v8, 0x16u);
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[3];
    WeakRetained[3] = 0;

    if (*((unsigned char *)v4 + 8))
    {
      id v6 = objc_loadWeakRetained(v4 + 11);
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4E698] code:1101 userInfo:0];
      [v6 localSpeechRecognizer:v4 didCompletionRecognitionWithStatistics:0 error:v7];
    }
  }
}

- (id)_newConnection
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.siri.embeddedspeech"];
  uint64_t v4 = CESRSpeechServiceGetXPCInterface();
  [v3 setRemoteObjectInterface:v4];

  id v5 = CESRSpeechServiceDelegateGetXPCInterface();
  [v3 setExportedInterface:v5];

  [v3 setExportedObject:self];
  [v3 _setQueue:self->_queue];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:self->_instanceUUID];
  [v3 _setUUID:v6];

  return v3;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v6 = "-[CoreEmbeddedSpeechRecognizer dealloc]";
    _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, "%s CoreEmbeddedSpeechRecognizer Dealloc", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CoreEmbeddedSpeechRecognizer;
  [(CoreEmbeddedSpeechRecognizer *)&v4 dealloc];
}

- (CoreEmbeddedSpeechRecognizer)init
{
  return 0;
}

- (CoreEmbeddedSpeechRecognizer)initWithDelegate:(id)a3 instanceUUID:(unsigned __int8)a4[16]
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CoreEmbeddedSpeechRecognizer;
  uint64_t v7 = [(CoreEmbeddedSpeechRecognizer *)&v21 init];
  int v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    if ((AFDeviceSupportsSiriUOD() & 1) != 0 || AFOfflineDictationCapable())
    {
      uint64_t v9 = [MEMORY[0x1E4F4E538] sharedPreferences];
      int v10 = [v9 infersQoSFromInstanceUUIDForEAR];

      if (v10)
      {
        dispatch_qos_class_t QoSClassFromInstanceUUID = CoreEmbeddedSpeechRecognizerGetQoSClassFromInstanceUUID((uint64_t)a4);
        if (QoSClassFromInstanceUUID)
        {
          dispatch_qos_class_t v12 = QoSClassFromInstanceUUID;
          id v13 = *MEMORY[0x1E4F4E380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 136315394;
            uint64_t v23 = "-[CoreEmbeddedSpeechRecognizer initWithDelegate:instanceUUID:]";
            __int16 v24 = 1024;
            dispatch_qos_class_t v25 = v12;
            _os_log_impl(&dword_1B8CCB000, v13, OS_LOG_TYPE_INFO, "%s ASR: Using QoS class %#02X.", buf, 0x12u);
          }
          id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          int v15 = dispatch_queue_attr_make_with_qos_class(v14, v12, 0);

          dispatch_queue_t v16 = dispatch_queue_create("CoreEmbeddedSpeechRecognizer", v15);
          queue = v8->_queue;
          v8->_queue = (OS_dispatch_queue *)v16;
        }
      }
    }
    if (!v8->_queue)
    {
      dispatch_queue_t v18 = dispatch_queue_create("CoreEmbeddedSpeechRecognizer", 0);
      id v19 = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v18;
    }
    uuid_copy(v8->_instanceUUID, a4);
  }

  return v8;
}

+ (id)offlineDictationStatusIgnoringCache:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__4239;
  __int16 v33 = __Block_byref_object_dispose__4240;
  id v34 = 0;
  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__4239;
  uint64_t v27 = __Block_byref_object_dispose__4240;
  id v28 = 0;
  id v6 = [[CoreEmbeddedSpeechRecognizer alloc] initWithDelegate:0 instanceUUID:CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive];
  uint64_t v17 = 0;
  dispatch_queue_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__4239;
  objc_super v21 = __Block_byref_object_dispose__4240;
  id v22 = 0;
  queue = v6->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__CoreEmbeddedSpeechRecognizer_offlineDictationStatusIgnoringCache_error___block_invoke;
  block[3] = &unk_1E61C3B58;
  int v15 = &v17;
  int v8 = v6;
  id v14 = v8;
  dispatch_queue_t v16 = &v29;
  dispatch_sync(queue, block);
  uint64_t v9 = (void *)v18[5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__CoreEmbeddedSpeechRecognizer_offlineDictationStatusIgnoringCache_error___block_invoke_3;
  v12[3] = &unk_1E61C3CE8;
  void v12[4] = &v29;
  void v12[5] = &v23;
  [v9 getOfflineDictationStatusIgnoringCache:v5 withCompletion:v12];
  [(CoreEmbeddedSpeechRecognizer *)v8 invalidate];
  if (a4) {
    *a4 = (id) v30[5];
  }
  id v10 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);

  return v10;
}

void __74__CoreEmbeddedSpeechRecognizer_offlineDictationStatusIgnoringCache_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__CoreEmbeddedSpeechRecognizer_offlineDictationStatusIgnoringCache_error___block_invoke_2;
  v6[3] = &unk_1E61C3B30;
  v6[4] = a1[6];
  uint64_t v3 = [v2 _synchronousServiceWithErrorHandler:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __74__CoreEmbeddedSpeechRecognizer_offlineDictationStatusIgnoringCache_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __74__CoreEmbeddedSpeechRecognizer_offlineDictationStatusIgnoringCache_error___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (BOOL)purgeInstalledAssetsExceptLanguages:(id)a3 assetType:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__4239;
  uint64_t v29 = __Block_byref_object_dispose__4240;
  id v30 = 0;
  id v8 = [[CoreEmbeddedSpeechRecognizer alloc] initWithDelegate:0 instanceUUID:CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__4239;
  uint64_t v23 = __Block_byref_object_dispose__4240;
  id v24 = 0;
  queue = v8->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_assetType_error___block_invoke;
  block[3] = &unk_1E61C3B58;
  uint64_t v17 = &v19;
  id v10 = v8;
  dispatch_queue_t v16 = v10;
  dispatch_queue_t v18 = &v25;
  dispatch_sync(queue, block);
  id v11 = (void *)v20[5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_assetType_error___block_invoke_3;
  v14[3] = &unk_1E61C3CC0;
  v14[4] = &v25;
  v14[5] = &v31;
  [v11 purgeInstalledAssetsExceptLanguages:v7 assetType:a4 completion:v14];
  [(CoreEmbeddedSpeechRecognizer *)v10 invalidate];
  if (a5) {
    *a5 = (id) v26[5];
  }
  char v12 = *((unsigned char *)v32 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v12;
}

void __84__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_assetType_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_assetType_error___block_invoke_2;
  v6[3] = &unk_1E61C3B30;
  v6[4] = a1[6];
  uint64_t v3 = [v2 _synchronousServiceWithErrorHandler:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __84__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_assetType_error___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

void __84__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_assetType_error___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (id)purgeInstalledAssetsExceptLanguages:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__4239;
  uint64_t v33 = __Block_byref_object_dispose__4240;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__4239;
  uint64_t v27 = __Block_byref_object_dispose__4240;
  id v28 = 0;
  id v6 = [[CoreEmbeddedSpeechRecognizer alloc] initWithDelegate:0 instanceUUID:CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive];
  uint64_t v17 = 0;
  dispatch_queue_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__4239;
  uint64_t v21 = __Block_byref_object_dispose__4240;
  id v22 = 0;
  queue = v6->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_error___block_invoke;
  block[3] = &unk_1E61C3B58;
  int v15 = &v17;
  id v8 = v6;
  id v14 = v8;
  dispatch_queue_t v16 = &v23;
  dispatch_sync(queue, block);
  uint64_t v9 = (void *)v18[5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_error___block_invoke_3;
  v12[3] = &unk_1E61C3C98;
  void v12[4] = &v23;
  void v12[5] = &v29;
  [v9 purgeInstalledAssetsExceptLanguages:v5 completion:v12];
  [(CoreEmbeddedSpeechRecognizer *)v8 invalidate];
  if (a4) {
    *a4 = (id) v24[5];
  }
  id v10 = (id)v30[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);

  return v10;
}

void __74__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_error___block_invoke_2;
  v6[3] = &unk_1E61C3B30;
  v6[4] = a1[6];
  uint64_t v3 = [v2 _synchronousServiceWithErrorHandler:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __74__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __74__CoreEmbeddedSpeechRecognizer_purgeInstalledAssetsExceptLanguages_error___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (id)dictionaryWithContentsProfilePathForLanguage:(id)a3 errorOut:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a1, "profilePathForLanguage:errorOut:", a3);
  if (v5)
  {
    uint64_t v6 = *MEMORY[0x1E4F4E370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E370], OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      char v12 = "+[CoreEmbeddedSpeechRecognizer dictionaryWithContentsProfilePathForLanguage:errorOut:]";
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_INFO, "%s Using user profile from %@", (uint8_t *)&v11, 0x16u);
    }
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v5 options:0 error:a4];
    if (v7)
    {
      id v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:a4];
      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)profilePathForLanguage:(id)a3 errorOut:(id *)a4
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  size_t v5 = sysconf(71);
  if (v5 == -1)
  {
    id v7 = 0;
  }
  else
  {
    memset(&v18, 0, sizeof(v18));
    uint64_t v17 = 0;
    if (getpwnam_r("mobile", &v18, (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v5, &v17)) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v17 == 0;
    }
    if (v6)
    {
      id v7 = 0;
    }
    else
    {
      id v8 = NSString;
      id v9 = [NSString stringWithUTF8String:v18.pw_dir];
      v19[0] = v9;
      v19[1] = @"Library";
      v19[2] = @"/Assistant";
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
      int v11 = [v8 pathWithComponents:v10];

      if (v11)
      {
        uint64_t v12 = [v4 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

        __int16 v13 = [v11 stringByAppendingPathComponent:@"SpeechProfile"];
        id v14 = [v13 stringByAppendingString:@"_"];
        id v7 = [v14 stringByAppendingString:v12];

        id v4 = (id)v12;
      }
      else
      {
        id v7 = 0;
      }
    }
  }

  return v7;
}

+ (id)speechProfileDataLastModifiedDataForLanguage:(id)a3
{
  uint64_t v3 = [a1 profilePathForLanguage:a3 errorOut:0];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    size_t v5 = [v4 attributesOfItemAtPath:v3 error:0];
    BOOL v6 = [v5 objectForKey:*MEMORY[0x1E4F28310]];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (void)forceCooldownIfIdle
{
  id v2 = [[CoreEmbeddedSpeechRecognizer alloc] initWithDelegate:0 instanceUUID:CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive];
  queue = v2->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CoreEmbeddedSpeechRecognizer_forceCooldownIfIdle__block_invoke;
  block[3] = &unk_1E61C38C0;
  BOOL v6 = v2;
  id v4 = v2;
  dispatch_async(queue, block);
}

void __51__CoreEmbeddedSpeechRecognizer_forceCooldownIfIdle__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v7 = "+[CoreEmbeddedSpeechRecognizer forceCooldownIfIdle]_block_invoke";
    _os_log_impl(&dword_1B8CCB000, v2, OS_LOG_TYPE_INFO, "%s Starting to cooldown", buf, 0xCu);
  }
  uint64_t v3 = [*(id *)(a1 + 32) _service];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__CoreEmbeddedSpeechRecognizer_forceCooldownIfIdle__block_invoke_349;
  v4[3] = &unk_1E61C3898;
  id v5 = *(id *)(a1 + 32);
  [v3 forceCooldownIfIdleWithCompletion:v4];
}

uint64_t __51__CoreEmbeddedSpeechRecognizer_forceCooldownIfIdle__block_invoke_349(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    id v5 = @"NOT";
    if (a2) {
      id v5 = &stru_1F1291150;
    }
    int v7 = 136315394;
    uint64_t v8 = "+[CoreEmbeddedSpeechRecognizer forceCooldownIfIdle]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_INFO, "%s Forced cooldown and was %@successful", (uint8_t *)&v7, 0x16u);
  }
  return [*(id *)(a1 + 32) invalidate];
}

+ (void)compilePrimaryAssistantAssetWithCompletion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (AFDeviceHighestLanguageModelCapabilityIdentifier() > 9)
  {
    id v5 = [[CoreEmbeddedSpeechRecognizer alloc] initWithDelegate:0 instanceUUID:CoreEmbeddedSpeechRecognizerInstanceUUIDBackground];
    BOOL v6 = SFEntitledAssetTypeToString();
    int v7 = NSString;
    uint64_t v8 = [v6 lowercaseString];
    __int16 v9 = [v7 stringWithFormat:@"com.apple.siri.embeddedspeech.compilation.%@.primary", v8];

    id v10 = v9;
    [v10 UTF8String];
    uint64_t v11 = (void *)os_transaction_create();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__CoreEmbeddedSpeechRecognizer_compilePrimaryAssistantAssetWithCompletion___block_invoke;
    aBlock[3] = &unk_1E61C3848;
    id v23 = v6;
    uint64_t v12 = v5;
    id v24 = v12;
    id v25 = v11;
    id v26 = v3;
    id v13 = v11;
    id v14 = v6;
    uint64_t v15 = _Block_copy(aBlock);
    queue = v12->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__CoreEmbeddedSpeechRecognizer_compilePrimaryAssistantAssetWithCompletion___block_invoke_348;
    block[3] = &unk_1E61C3820;
    uint64_t v20 = v12;
    id v21 = v15;
    id v17 = v15;
    passwd v18 = v12;
    dispatch_async(queue, block);
  }
  else
  {
    id v4 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v28 = "+[CoreEmbeddedSpeechRecognizer compilePrimaryAssistantAssetWithCompletion:]";
      _os_log_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_INFO, "%s Skipping model compilation as this device does not support ANE.", buf, 0xCu);
    }
    if (v3) {
      (*((void (**)(id, uint64_t, void))v3 + 2))(v3, 1, 0);
    }
  }
}

void __75__CoreEmbeddedSpeechRecognizer_compilePrimaryAssistantAssetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315650;
      uint64_t v8 = "+[CoreEmbeddedSpeechRecognizer compilePrimaryAssistantAssetWithCompletion:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_ERROR, "%s Error requesting model compilation for the primary %@ asset: %@", (uint8_t *)&v7, 0x20u);
    }
  }
  [*(id *)(a1 + 40) invalidate];
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, v3 == 0, v3);
  }
}

void __75__CoreEmbeddedSpeechRecognizer_compilePrimaryAssistantAssetWithCompletion___block_invoke_348(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [NSString stringWithUTF8String:"+[CoreEmbeddedSpeechRecognizer compilePrimaryAssistantAssetWithCompletion:]_block_invoke"];
  id v3 = [v2 _serviceWithFunctionName:v4 errorHandler:*(void *)(a1 + 40)];
  [v3 compilePrimaryAssistantAssetWithCompletion:*(void *)(a1 + 40)];
}

+ (void)compileAllAssetsWithType:(unint64_t)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (AFDeviceHighestLanguageModelCapabilityIdentifier() > 9)
  {
    int v7 = [[CoreEmbeddedSpeechRecognizer alloc] initWithDelegate:0 instanceUUID:CoreEmbeddedSpeechRecognizerInstanceUUIDBackground];
    uint64_t v8 = SFEntitledAssetTypeToString();
    __int16 v9 = NSString;
    uint64_t v10 = [v8 lowercaseString];
    __int16 v11 = [v9 stringWithFormat:@"com.apple.siri.embeddedspeech.compilation.%@", v10];

    id v12 = v11;
    [v12 UTF8String];
    uint64_t v13 = (void *)os_transaction_create();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__CoreEmbeddedSpeechRecognizer_compileAllAssetsWithType_completion___block_invoke;
    aBlock[3] = &unk_1E61C3848;
    id v26 = v8;
    id v14 = v7;
    uint64_t v27 = v14;
    id v28 = v13;
    id v29 = v5;
    id v15 = v13;
    id v16 = v8;
    id v17 = _Block_copy(aBlock);
    queue = v14->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__CoreEmbeddedSpeechRecognizer_compileAllAssetsWithType_completion___block_invoke_344;
    block[3] = &unk_1E61C3870;
    id v22 = v14;
    id v23 = v17;
    unint64_t v24 = a3;
    id v19 = v17;
    uint64_t v20 = v14;
    dispatch_async(queue, block);
  }
  else
  {
    uint64_t v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v31 = "+[CoreEmbeddedSpeechRecognizer compileAllAssetsWithType:completion:]";
      _os_log_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_INFO, "%s Skipping model compilation as this device does not support ANE.", buf, 0xCu);
    }
    if (v5) {
      (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
    }
  }
}

void __68__CoreEmbeddedSpeechRecognizer_compileAllAssetsWithType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315650;
      uint64_t v8 = "+[CoreEmbeddedSpeechRecognizer compileAllAssetsWithType:completion:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_ERROR, "%s Error requesting model compilation for %@ assets: %@", (uint8_t *)&v7, 0x20u);
    }
  }
  [*(id *)(a1 + 40) invalidate];
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, v3 == 0, v3);
  }
}

void __68__CoreEmbeddedSpeechRecognizer_compileAllAssetsWithType_completion___block_invoke_344(void *a1)
{
  id v2 = (void *)a1[4];
  id v4 = [NSString stringWithUTF8String:"+[CoreEmbeddedSpeechRecognizer compileAllAssetsWithType:completion:]_block_invoke"];
  id v3 = [v2 _serviceWithFunctionName:v4 errorHandler:a1[5]];
  [v3 compileAllAssetsWithType:a1[6] completion:a1[5]];
}

+ (void)cleanupUnusedSubscriptions
{
  id v2 = [[CoreEmbeddedSpeechRecognizer alloc] initWithDelegate:0 instanceUUID:CoreEmbeddedSpeechRecognizerInstanceUUIDBackground];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__CoreEmbeddedSpeechRecognizer_cleanupUnusedSubscriptions__block_invoke;
  aBlock[3] = &unk_1E61C37F8;
  id v3 = v2;
  id v12 = v3;
  id v4 = _Block_copy(aBlock);
  queue = v3->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CoreEmbeddedSpeechRecognizer_cleanupUnusedSubscriptions__block_invoke_340;
  block[3] = &unk_1E61C3820;
  __int16 v9 = v3;
  id v10 = v4;
  id v6 = v4;
  int v7 = v3;
  dispatch_async(queue, block);
}

void __58__CoreEmbeddedSpeechRecognizer_cleanupUnusedSubscriptions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = v4;
      id v6 = [v3 localizedDescription];
      int v7 = 136315394;
      uint64_t v8 = "+[CoreEmbeddedSpeechRecognizer cleanupUnusedSubscriptions]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v6;
      _os_log_error_impl(&dword_1B8CCB000, v5, OS_LOG_TYPE_ERROR, "%s Error requesting daily subscriptions cleanup: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  [*(id *)(a1 + 32) invalidate];
}

void __58__CoreEmbeddedSpeechRecognizer_cleanupUnusedSubscriptions__block_invoke_340(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [NSString stringWithUTF8String:"+[CoreEmbeddedSpeechRecognizer cleanupUnusedSubscriptions]_block_invoke"];
  id v3 = [v2 _serviceWithFunctionName:v4 errorHandler:*(void *)(a1 + 40)];
  [v3 cleanupUnusedSubscriptions];
}

+ (void)handlePostUpgradeSubscriptions
{
  id v2 = [[CoreEmbeddedSpeechRecognizer alloc] initWithDelegate:0 instanceUUID:CoreEmbeddedSpeechRecognizerInstanceUUIDBackground];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__CoreEmbeddedSpeechRecognizer_handlePostUpgradeSubscriptions__block_invoke;
  aBlock[3] = &unk_1E61C37F8;
  id v3 = v2;
  id v12 = v3;
  id v4 = _Block_copy(aBlock);
  queue = v3->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CoreEmbeddedSpeechRecognizer_handlePostUpgradeSubscriptions__block_invoke_338;
  block[3] = &unk_1E61C3820;
  __int16 v9 = v3;
  id v10 = v4;
  id v6 = v4;
  int v7 = v3;
  dispatch_async(queue, block);
}

void __62__CoreEmbeddedSpeechRecognizer_handlePostUpgradeSubscriptions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = v4;
      id v6 = [v3 localizedDescription];
      int v7 = 136315394;
      uint64_t v8 = "+[CoreEmbeddedSpeechRecognizer handlePostUpgradeSubscriptions]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v6;
      _os_log_error_impl(&dword_1B8CCB000, v5, OS_LOG_TYPE_ERROR, "%s Error requesting post-upgrade subscriptions: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  [*(id *)(a1 + 32) invalidate];
}

void __62__CoreEmbeddedSpeechRecognizer_handlePostUpgradeSubscriptions__block_invoke_338(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [NSString stringWithUTF8String:"+[CoreEmbeddedSpeechRecognizer handlePostUpgradeSubscriptions]_block_invoke"];
  id v3 = [v2 _serviceWithFunctionName:v4 errorHandler:*(void *)(a1 + 40)];
  [v3 handlePostUpgradeSubscriptions];
}

@end