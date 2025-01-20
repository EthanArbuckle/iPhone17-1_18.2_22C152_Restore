@interface SFLocalSpeechRecognitionClient
+ (void)cleanupCacheWithCompletion:(id)a3;
+ (void)initialize;
+ (void)logCoreAnalyticsEvent:(id)a3 withAnalytics:(id)a4;
- (SFLocalSpeechRecognitionClient)init;
- (SFLocalSpeechRecognitionClient)initWithDelegate:(id)a3;
- (SFLocalSpeechRecognitionDelegate)delegate;
- (id)_asynchronousServiceProxyWithErrorHandler:(uint64_t)a1;
- (void)_serviceProxyWithErrorHandler:(void *)a1;
- (void)addAudioPacket:(id)a3;
- (void)addProns:(id)a3 forWord:(id)a4 completion:(id)a5;
- (void)addSentenceToNgramCounts:(id)a3;
- (void)addSentenceToNgramCounts:(id)a3 completion:(id)a4;
- (void)appLmNeedsRebuild:(id)a3 language:(id)a4 sandboxExtensions:(id)a5 completion:(id)a6;
- (void)cancelSpeech;
- (void)configParametersForVoicemailWithLanguage:(id)a3 clientID:(id)a4 completion:(id)a5;
- (void)createNgramCountsArtifactFromPhraseCountArtifact:(id)a3 writeToDirectory:(id)a4 sandboxExtensions:(id)a5 completion:(id)a6;
- (void)createPhraseCountsArtifactWithIdentifier:(id)a3 rawPhraseCountsPath:(id)a4 customPronunciationsPath:(id)a5 writeToDirectory:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8;
- (void)dealloc;
- (void)deserializeNgramCountsData:(id)a3 completion:(id)a4;
- (void)downloadAssetsForConfig:(id)a3 clientID:(id)a4 detailedProgress:(id)a5 completionHandler:(id)a6;
- (void)downloadAssetsForConfig:(id)a3 clientID:(id)a4 progress:(id)a5 completionHandler:(id)a6;
- (void)fetchAssetsForLanguage:(id)a3 clientID:(id)a4 completion:(id)a5;
- (void)generateNgramCountsSerializeDataWithCompletion:(id)a3;
- (void)initializeLmWithAssetPath:(id)a3 completion:(id)a4;
- (void)initializeLmWithLocale:(id)a3 clientID:(id)a4 completion:(id)a5;
- (void)initializeWithSandboxExtensions:(id)a3;
- (void)installedLanguagesForAssetType:(unint64_t)a3 synchronous:(BOOL)a4 completion:(id)a5;
- (void)invalidate;
- (void)lmeThresholdWithCompletion:(id)a3;
- (void)localSpeechRecognitionDidDownloadAssetsWithProgress:(unint64_t)a3 isStalled:(BOOL)a4;
- (void)localSpeechRecognitionDidFail:(id)a3;
- (void)localSpeechRecognitionDidFinishDownloadingAssets:(id)a3 error:(id)a4;
- (void)localSpeechRecognitionDidFinishRecognition:(id)a3;
- (void)localSpeechRecognitionDidProcessAudioDuration:(double)a3;
- (void)localSpeechRecognitionDidRecognizePartialResult:(id)a3 rawPartialResult:(id)a4;
- (void)localSpeechRecognitionDidSucceed;
- (void)metricsWithCompletion:(id)a3;
- (void)oovWordsAndFrequenciesWithCompletion:(id)a3;
- (void)pathToAssetWithConfig:(id)a3 clientID:(id)a4 completion:(id)a5;
- (void)preloadRecognizerForLanguage:(id)a3 task:(id)a4 clientID:(id)a5 recognitionOverrides:(id)a6 modelOverrideURL:(id)a7 completion:(id)a8;
- (void)setPurgeabilityForAssetWithConfig:(id)a3 purgeable:(BOOL)a4 clientID:(id)a5 completion:(id)a6;
- (void)startRecordedAudioDictationWithParameters:(id)a3;
- (void)stopSpeech;
- (void)subscriptionsForClientId:(id)a3 completion:(id)a4;
- (void)supportedLanguagesForAssetType:(unint64_t)a3 completion:(id)a4;
- (void)synchronousComputeEuclidEmbeddingsForSources:(id)a3 completion:(id)a4;
- (void)synchronousCreateEuclidInstanceForLanguageStr:(id)a3 clientID:(id)a4 inputFormat:(int64_t)a5 loadingOption:(int64_t)a6 completion:(id)a7;
- (void)trainAppLmFromNgramCountsArtifact:(id)a3 forApp:(id)a4 language:(id)a5 writeToDirectory:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8;
- (void)trainAppLmFromNgramsSerializedData:(id)a3 customPronsData:(id)a4 language:(id)a5 writeToDirectory:(id)a6 sandboxExtension:(id)a7 completion:(id)a8;
- (void)trainFromPlainTextAndWriteToDirectory:(id)a3 sandboxExtension:(id)a4 completion:(id)a5;
- (void)unsubscribeFromAssetWithConfig:(id)a3 clientID:(id)a4 completion:(id)a5;
- (void)wakeUpWithCompletion:(id)a3;
@end

@implementation SFLocalSpeechRecognitionClient

void __96__SFLocalSpeechRecognitionClient_localSpeechRecognitionDidDownloadAssetsWithProgress_isStalled___block_invoke(uint64_t a1)
{
  v2 = (void (**)(void, void, void))[*(id *)(*(void *)(a1 + 32) + 32) copy];
  if (v2)
  {
    id v3 = v2;
    v2[2](v2, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
    v2 = (void (**)(void, void, void))v3;
  }
}

- (void)localSpeechRecognitionDidDownloadAssetsWithProgress:(unint64_t)a3 isStalled:(BOOL)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__SFLocalSpeechRecognitionClient_localSpeechRecognitionDidDownloadAssetsWithProgress_isStalled___block_invoke;
  block[3] = &unk_1E61550C0;
  block[4] = self;
  block[5] = a3;
  BOOL v6 = a4;
  dispatch_async(queue, block);
}

void __89__SFLocalSpeechRecognitionClient_localSpeechRecognitionDidFinishDownloadingAssets_error___block_invoke(uint64_t a1)
{
  id v7 = (id)[*(id *)(*(void *)(a1 + 32) + 40) copy];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  BOOL v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    BOOL v6 = v7;
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SFLocalSpeechRecognitionClient_invalidate__block_invoke;
  block[3] = &unk_1E61557A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)localSpeechRecognitionDidFinishDownloadingAssets:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__SFLocalSpeechRecognitionClient_localSpeechRecognitionDidFinishDownloadingAssets_error___block_invoke;
  block[3] = &unk_1E61551C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __38__SFLocalSpeechRecognitionClient_init__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = @"com.apple.speech.localspeechrecognition";
    _os_log_impl(&dword_1B709D000, v2, OS_LOG_TYPE_INFO, "%@ Invalidated", buf, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__SFLocalSpeechRecognitionClient_init__block_invoke_44;
    block[3] = &unk_1E61557A0;
    id v7 = WeakRetained;
    dispatch_async(v5, block);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_downloadCompletion, 0);
  objc_storeStrong(&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_connectionUnavailableError, 0);
  objc_storeStrong((id *)&self->_lsrConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void *__44__SFLocalSpeechRecognitionClient_invalidate__block_invoke(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 16);
  if (result) {
    return (void *)[result invalidate];
  }
  return result;
}

- (void)downloadAssetsForConfig:(id)a3 clientID:(id)a4 detailedProgress:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_detailedProgress_completionHandler___block_invoke;
  block[3] = &unk_1E6155070;
  id v22 = v12;
  id v23 = v13;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(queue, block);
}

void __102__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_detailedProgress_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 56) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = [*(id *)(a1 + 64) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __102__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_detailedProgress_completionHandler___block_invoke_2;
  id v13 = &unk_1E6155A18;
  uint64_t v14 = v8;
  id v15 = *(id *)(a1 + 64);
  id v9 = -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v8, &v10);
  objc_msgSend(v9, "downloadAssetsForConfig:clientID:detailedProgress:", *(void *)(a1 + 40), *(void *)(a1 + 48), 1, v10, v11, v12, v13, v14);
}

void __88__SFLocalSpeechRecognitionClient_installedLanguagesForAssetType_synchronous_completion___block_invoke_51(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__SFLocalSpeechRecognitionClient_installedLanguagesForAssetType_synchronous_completion___block_invoke_2;
  v4[3] = &unk_1E6154F60;
  uint64_t v2 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v2, v4);
  [v3 installedLanguagesForAssetType:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

void __76__SFLocalSpeechRecognitionClient_supportedLanguagesForAssetType_completion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__SFLocalSpeechRecognitionClient_supportedLanguagesForAssetType_completion___block_invoke_2;
  v4[3] = &unk_1E6154F60;
  uint64_t v2 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v2, v4);
  [v3 supportedLanguagesForAssetType:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (id)_asynchronousServiceProxyWithErrorHandler:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    uint64_t v4 = *(void **)(a1 + 16);
    if (v4)
    {
      a1 = [v4 remoteObjectProxyWithErrorHandler:v3];
    }
    else
    {
      v3[2](v3, *(void *)(a1 + 24));
      a1 = 0;
    }
  }

  return (id)a1;
}

- (void)supportedLanguagesForAssetType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__SFLocalSpeechRecognitionClient_supportedLanguagesForAssetType_completion___block_invoke;
  block[3] = &unk_1E6154FB0;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (SFLocalSpeechRecognitionClient)init
{
  v20.receiver = self;
  v20.super_class = (Class)SFLocalSpeechRecognitionClient;
  uint64_t v2 = [(SFLocalSpeechRecognitionClient *)&v20 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("SFLocalSpeechRecognitionClient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.speech.localspeechrecognition"];
    lsrConnection = v2->_lsrConnection;
    v2->_lsrConnection = (NSXPCConnection *)v5;

    id v7 = v2->_lsrConnection;
    id v8 = SFLSRGetInterface();
    [(NSXPCConnection *)v7 setRemoteObjectInterface:v8];

    id v9 = v2->_lsrConnection;
    id v10 = SFLSRDelegateGetInterface();
    [(NSXPCConnection *)v9 setExportedInterface:v10];

    [(NSXPCConnection *)v2->_lsrConnection setExportedObject:v2];
    connectionUnavailableError = v2->_connectionUnavailableError;
    v2->_connectionUnavailableError = 0;

    objc_initWeak(&location, v2);
    id v12 = v2->_lsrConnection;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __38__SFLocalSpeechRecognitionClient_init__block_invoke;
    v17[3] = &unk_1E6155300;
    objc_copyWeak(&v18, &location);
    [(NSXPCConnection *)v12 setInterruptionHandler:v17];
    id v13 = v2->_lsrConnection;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __38__SFLocalSpeechRecognitionClient_init__block_invoke_2;
    v15[3] = &unk_1E6155300;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v13 setInvalidationHandler:v15];
    [(NSXPCConnection *)v2->_lsrConnection resume];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)installedLanguagesForAssetType:(unint64_t)a3 synchronous:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = v8;
  if (v5)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __88__SFLocalSpeechRecognitionClient_installedLanguagesForAssetType_synchronous_completion___block_invoke;
    v17[3] = &unk_1E6154F60;
    id v10 = v8;
    id v18 = v10;
    unint64_t v11 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v17);
    [v11 installedLanguagesForAssetType:a3 completion:v10];

    id v12 = v18;
  }
  else
  {
    queue = self->_queue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__SFLocalSpeechRecognitionClient_installedLanguagesForAssetType_synchronous_completion___block_invoke_51;
    v14[3] = &unk_1E6154FB0;
    v14[4] = self;
    id v15 = v8;
    unint64_t v16 = a3;
    dispatch_async(queue, v14);
    id v12 = v15;
  }
}

uint64_t __38__SFLocalSpeechRecognitionClient_init__block_invoke_44(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4E698] code:1101 userInfo:0];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v4;

  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v7 + 56));
    [WeakRetained localSpeechRecognitionClient:0 speechRecognitionDidFail:*(void *)(*(void *)(a1 + 32) + 24)];

    uint64_t v7 = *(void *)(a1 + 32);
  }
  uint64_t v9 = *(void *)(v7 + 24);

  return [(id)v7 localSpeechRecognitionDidFinishDownloadingAssets:0 error:v9];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[SFLocalSpeechRecognitionClient dealloc]";
    _os_log_debug_impl(&dword_1B709D000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)SFLocalSpeechRecognitionClient;
  [(SFLocalSpeechRecognitionClient *)&v4 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog = (uint64_t)os_log_create("com.apple.speech.localspeechrecognition", "SFLocalSpeechRecognitionClient");
    MEMORY[0x1F41817F8]();
  }
}

- (SFLocalSpeechRecognitionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFLocalSpeechRecognitionDelegate *)WeakRetained;
}

- (void)localSpeechRecognitionDidSucceed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained localSpeechRecognitionClientSpeechRecognitionDidSucceed:self];

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SFLocalSpeechRecognitionClient_localSpeechRecognitionDidSucceed__block_invoke;
  block[3] = &unk_1E61557A0;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __66__SFLocalSpeechRecognitionClient_localSpeechRecognitionDidSucceed__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 48) = 0;
  return result;
}

- (void)localSpeechRecognitionDidRecognizePartialResult:(id)a3 rawPartialResult:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained localSpeechRecognitionClient:self didRecognizePartialResult:v8 rawPartialResult:v7];
}

- (void)localSpeechRecognitionDidProcessAudioDuration:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained localSpeechRecognitionClient:self didProcessAudioDuration:a3];
}

- (void)localSpeechRecognitionDidFinishRecognition:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained localSpeechRecognitionClient:self didFinishRecognition:v5];
}

- (void)localSpeechRecognitionDidFail:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained localSpeechRecognitionClient:self speechRecognitionDidFail:v5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SFLocalSpeechRecognitionClient_localSpeechRecognitionDidFail___block_invoke;
  block[3] = &unk_1E61557A0;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __64__SFLocalSpeechRecognitionClient_localSpeechRecognitionDidFail___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 48) = 0;
  return result;
}

- (void)synchronousComputeEuclidEmbeddingsForSources:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__SFLocalSpeechRecognitionClient_synchronousComputeEuclidEmbeddingsForSources_completion___block_invoke;
  v10[3] = &unk_1E6154F60;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v10);
  [v9 synchronousComputeEuclidEmbeddingsForSources:v8 completion:v7];
}

void __90__SFLocalSpeechRecognitionClient_synchronousComputeEuclidEmbeddingsForSources_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)_serviceProxyWithErrorHandler:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__1498;
    id v18 = __Block_byref_object_dispose__1499;
    id v19 = 0;
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x3032000000;
    id v11 = __Block_byref_object_copy__1498;
    id v12 = __Block_byref_object_dispose__1499;
    id v13 = 0;
    objc_super v4 = a1[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__SFLocalSpeechRecognitionClient__serviceProxyWithErrorHandler___block_invoke;
    block[3] = &unk_1E6154F10;
    void block[4] = a1;
    void block[5] = &v14;
    void block[6] = &v8;
    dispatch_sync(v4, block);
    uint64_t v5 = (void *)v15[5];
    if (v5)
    {
      a1 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v3];
    }
    else
    {
      v3[2](v3, v9[5]);
      a1 = 0;
    }
    _Block_object_dispose(&v8, 8);

    _Block_object_dispose(&v14, 8);
  }

  return a1;
}

void __64__SFLocalSpeechRecognitionClient__serviceProxyWithErrorHandler___block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 16));
  uint64_t v2 = *(void **)(a1[4] + 24);
  id v3 = (id *)(*(void *)(a1[6] + 8) + 40);

  objc_storeStrong(v3, v2);
}

- (void)synchronousCreateEuclidInstanceForLanguageStr:(id)a3 clientID:(id)a4 inputFormat:(int64_t)a5 loadingOption:(int64_t)a6 completion:(id)a7
{
  id v12 = a7;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __126__SFLocalSpeechRecognitionClient_synchronousCreateEuclidInstanceForLanguageStr_clientID_inputFormat_loadingOption_completion___block_invoke;
  v17[3] = &unk_1E6154F60;
  id v18 = v12;
  id v13 = v12;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v17);
  [v16 synchronousCreateEuclidInstanceForLanguageStr:v15 clientID:v14 inputFormat:a5 loadingOption:a6 completion:v13];
}

void __126__SFLocalSpeechRecognitionClient_synchronousCreateEuclidInstanceForLanguageStr_clientID_inputFormat_loadingOption_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)appLmNeedsRebuild:(id)a3 language:(id)a4 sandboxExtensions:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__SFLocalSpeechRecognitionClient_appLmNeedsRebuild_language_sandboxExtensions_completion___block_invoke;
  v16[3] = &unk_1E6154F60;
  id v17 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v16);
  [v15 appLmNeedsRebuild:v14 language:v13 sandboxExtensions:v12 completion:v11];
}

void __90__SFLocalSpeechRecognitionClient_appLmNeedsRebuild_language_sandboxExtensions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)trainAppLmFromNgramCountsArtifact:(id)a3 forApp:(id)a4 language:(id)a5 writeToDirectory:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8
{
  id v14 = a8;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __130__SFLocalSpeechRecognitionClient_trainAppLmFromNgramCountsArtifact_forApp_language_writeToDirectory_sandboxExtensions_completion___block_invoke;
  v22[3] = &unk_1E6154F60;
  id v23 = v14;
  id v15 = v14;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v22);
  [v21 trainAppLmFromNgramCountsArtifact:v20 forApp:v19 language:v18 writeToDirectory:v17 sandboxExtensions:v16 completion:v15];
}

void __130__SFLocalSpeechRecognitionClient_trainAppLmFromNgramCountsArtifact_forApp_language_writeToDirectory_sandboxExtensions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, 0);
  }
}

- (void)createNgramCountsArtifactFromPhraseCountArtifact:(id)a3 writeToDirectory:(id)a4 sandboxExtensions:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __129__SFLocalSpeechRecognitionClient_createNgramCountsArtifactFromPhraseCountArtifact_writeToDirectory_sandboxExtensions_completion___block_invoke;
  v16[3] = &unk_1E6154F60;
  id v17 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v16);
  [v15 createNgramCountsArtifactFromPhraseCountArtifact:v14 writeToDirectory:v13 sandboxExtensions:v12 completion:v11];
}

void __129__SFLocalSpeechRecognitionClient_createNgramCountsArtifactFromPhraseCountArtifact_writeToDirectory_sandboxExtensions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)createPhraseCountsArtifactWithIdentifier:(id)a3 rawPhraseCountsPath:(id)a4 customPronunciationsPath:(id)a5 writeToDirectory:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8
{
  id v14 = a8;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __166__SFLocalSpeechRecognitionClient_createPhraseCountsArtifactWithIdentifier_rawPhraseCountsPath_customPronunciationsPath_writeToDirectory_sandboxExtensions_completion___block_invoke;
  v22[3] = &unk_1E6154F60;
  id v23 = v14;
  id v15 = v14;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v22);
  [v21 createPhraseCountsArtifactWithIdentifier:v20 rawPhraseCountsPath:v19 customPronunciationsPath:v18 writeToDirectory:v17 sandboxExtensions:v16 completion:v15];
}

void __166__SFLocalSpeechRecognitionClient_createPhraseCountsArtifactWithIdentifier_rawPhraseCountsPath_customPronunciationsPath_writeToDirectory_sandboxExtensions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)trainAppLmFromNgramsSerializedData:(id)a3 customPronsData:(id)a4 language:(id)a5 writeToDirectory:(id)a6 sandboxExtension:(id)a7 completion:(id)a8
{
  id v14 = a8;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __139__SFLocalSpeechRecognitionClient_trainAppLmFromNgramsSerializedData_customPronsData_language_writeToDirectory_sandboxExtension_completion___block_invoke;
  v22[3] = &unk_1E6154F60;
  id v23 = v14;
  id v15 = v14;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v22);
  [v21 trainAppLmFromNgramsSerializedData:v20 customPronsData:v19 language:v18 writeToDirectory:v17 sandboxExtension:v16 completion:v15];
}

void __139__SFLocalSpeechRecognitionClient_trainAppLmFromNgramsSerializedData_customPronsData_language_writeToDirectory_sandboxExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, 0);
  }
}

- (void)wakeUpWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SFLocalSpeechRecognitionClient_wakeUpWithCompletion___block_invoke;
  v7[3] = &unk_1E6154F60;
  id v8 = v4;
  id v5 = v4;
  int v6 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v7);
  [v6 wakeUpWithCompletion:v5];
}

void __55__SFLocalSpeechRecognitionClient_wakeUpWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)metricsWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SFLocalSpeechRecognitionClient_metricsWithCompletion___block_invoke;
  v7[3] = &unk_1E6154F60;
  id v8 = v4;
  id v5 = v4;
  int v6 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v7);
  [v6 metricsWithCompletion:v5];
}

void __56__SFLocalSpeechRecognitionClient_metricsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)lmeThresholdWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SFLocalSpeechRecognitionClient_lmeThresholdWithCompletion___block_invoke;
  v7[3] = &unk_1E6154F60;
  id v8 = v4;
  id v5 = v4;
  int v6 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v7);
  [v6 lmeThresholdWithCompletion:v5];
}

void __61__SFLocalSpeechRecognitionClient_lmeThresholdWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, -1);
  }
}

- (void)deserializeNgramCountsData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__SFLocalSpeechRecognitionClient_deserializeNgramCountsData_completion___block_invoke;
  v10[3] = &unk_1E6154F60;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v10);
  [v9 deserializeNgramCountsData:v8 completion:v7];
}

void __72__SFLocalSpeechRecognitionClient_deserializeNgramCountsData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)generateNgramCountsSerializeDataWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__SFLocalSpeechRecognitionClient_generateNgramCountsSerializeDataWithCompletion___block_invoke;
  v7[3] = &unk_1E6154F60;
  id v8 = v4;
  id v5 = v4;
  int v6 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v7);
  [v6 generateNgramCountsSerializeDataWithCompletion:v5];
}

void __81__SFLocalSpeechRecognitionClient_generateNgramCountsSerializeDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)trainFromPlainTextAndWriteToDirectory:(id)a3 sandboxExtension:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__SFLocalSpeechRecognitionClient_trainFromPlainTextAndWriteToDirectory_sandboxExtension_completion___block_invoke;
  v13[3] = &unk_1E6154F60;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v13);
  [v12 trainFromPlainTextAndWriteToDirectory:v11 sandboxExtension:v10 completion:v9];
}

void __100__SFLocalSpeechRecognitionClient_trainFromPlainTextAndWriteToDirectory_sandboxExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, 0);
  }
}

- (void)oovWordsAndFrequenciesWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SFLocalSpeechRecognitionClient_oovWordsAndFrequenciesWithCompletion___block_invoke;
  v7[3] = &unk_1E6154F60;
  id v8 = v4;
  id v5 = v4;
  int v6 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v7);
  [v6 oovWordsAndFrequenciesWithCompletion:v5];
}

void __71__SFLocalSpeechRecognitionClient_oovWordsAndFrequenciesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)addProns:(id)a3 forWord:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__SFLocalSpeechRecognitionClient_addProns_forWord_completion___block_invoke;
  v13[3] = &unk_1E6154F60;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v13);
  [v12 addProns:v11 forWord:v10 completion:v9];
}

void __62__SFLocalSpeechRecognitionClient_addProns_forWord_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)addSentenceToNgramCounts:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__SFLocalSpeechRecognitionClient_addSentenceToNgramCounts_completion___block_invoke;
  v10[3] = &unk_1E6154F60;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v10);
  [v9 addSentenceToNgramCounts:v8 completion:v7];
}

void __70__SFLocalSpeechRecognitionClient_addSentenceToNgramCounts_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)addSentenceToNgramCounts:(id)a3
{
  id v4 = a3;
  -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, &__block_literal_global_58);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 addSentenceToNgramCounts:v4];
}

void __59__SFLocalSpeechRecognitionClient_addSentenceToNgramCounts___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412546;
    id v5 = @"com.apple.speech.localspeechrecognition";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1B709D000, v3, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)initializeLmWithAssetPath:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__SFLocalSpeechRecognitionClient_initializeLmWithAssetPath_completion___block_invoke;
  v10[3] = &unk_1E6154F60;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v10);
  [v9 initializeLmWithAssetPath:v8 completion:v7];
}

void __71__SFLocalSpeechRecognitionClient_initializeLmWithAssetPath_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)initializeLmWithLocale:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__SFLocalSpeechRecognitionClient_initializeLmWithLocale_clientID_completion___block_invoke;
  v13[3] = &unk_1E6154F60;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v13);
  [v12 initializeLmWithLocale:v11 clientID:v10 completion:v9];
}

void __77__SFLocalSpeechRecognitionClient_initializeLmWithLocale_clientID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B709D000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)setPurgeabilityForAssetWithConfig:(id)a3 purgeable:(BOOL)a4 clientID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__SFLocalSpeechRecognitionClient_setPurgeabilityForAssetWithConfig_purgeable_clientID_completion___block_invoke;
  block[3] = &unk_1E6155098;
  void block[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v19 = v11;
  id v20 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(queue, block);
}

void __98__SFLocalSpeechRecognitionClient_setPurgeabilityForAssetWithConfig_purgeable_clientID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __98__SFLocalSpeechRecognitionClient_setPurgeabilityForAssetWithConfig_purgeable_clientID_completion___block_invoke_2;
  v4[3] = &unk_1E6154F60;
  id v5 = *(id *)(a1 + 56);
  id v3 = -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v2, v4);
  [v3 setPurgeabilityForAssetWithConfig:*(void *)(a1 + 40) purgeable:*(unsigned __int8 *)(a1 + 64) clientID:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void __98__SFLocalSpeechRecognitionClient_setPurgeabilityForAssetWithConfig_purgeable_clientID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)subscriptionsForClientId:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__SFLocalSpeechRecognitionClient_subscriptionsForClientId_completion___block_invoke;
  v10[3] = &unk_1E6154F60;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v10);
  [v9 subscriptionsForClientId:v8 completion:v7];
}

void __70__SFLocalSpeechRecognitionClient_subscriptionsForClientId_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, MEMORY[0x1E4F1CBF0]);
  }
}

- (void)unsubscribeFromAssetWithConfig:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__SFLocalSpeechRecognitionClient_unsubscribeFromAssetWithConfig_clientID_completion___block_invoke;
  v13[3] = &unk_1E6154F60;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v13);
  [v12 unsubscribeFromAssetWithConfig:v11 clientID:v10 completion:v9];
}

void __85__SFLocalSpeechRecognitionClient_unsubscribeFromAssetWithConfig_clientID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)configParametersForVoicemailWithLanguage:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__SFLocalSpeechRecognitionClient_configParametersForVoicemailWithLanguage_clientID_completion___block_invoke;
  v13[3] = &unk_1E6154F60;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v13);
  [v12 configParametersForVoicemailWithLanguage:v11 clientID:v10 completion:v9];
}

void __95__SFLocalSpeechRecognitionClient_configParametersForVoicemailWithLanguage_clientID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)fetchAssetsForLanguage:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__SFLocalSpeechRecognitionClient_fetchAssetsForLanguage_clientID_completion___block_invoke;
  v13[3] = &unk_1E6154F60;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v13);
  [v12 fetchAssetsForLanguage:v11 clientID:v10 completion:v9];
}

void __77__SFLocalSpeechRecognitionClient_fetchAssetsForLanguage_clientID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __102__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_detailedProgress_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = @"com.apple.speech.localspeechrecognition";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(NSObject **)(v5 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_detailedProgress_completionHandler___block_invoke_56;
  block[3] = &unk_1E6155048;
  void block[4] = v5;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, block);
}

uint64_t __102__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_detailedProgress_completionHandler___block_invoke_56(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)downloadAssetsForConfig:(id)a3 clientID:(id)a4 progress:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_progress_completionHandler___block_invoke;
  block[3] = &unk_1E6155070;
  id v22 = v12;
  id v23 = v13;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(queue, block);
}

void __94__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_progress_completionHandler___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_progress_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E6155020;
  id v13 = *(id *)(a1 + 56);
  uint64_t v2 = _Block_copy(aBlock);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = [*(id *)(a1 + 64) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_progress_completionHandler___block_invoke_3;
  v10[3] = &unk_1E6155A18;
  void v10[4] = v8;
  id v11 = *(id *)(a1 + 64);
  id v9 = -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v8, v10);
  [v9 downloadAssetsForConfig:*(void *)(a1 + 40) clientID:*(void *)(a1 + 48) detailedProgress:0];
}

uint64_t __94__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_progress_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __94__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_progress_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = @"com.apple.speech.localspeechrecognition";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(v5 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_progress_completionHandler___block_invoke_55;
  block[3] = &unk_1E6155048;
  void block[4] = v5;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, block);
}

uint64_t __94__SFLocalSpeechRecognitionClient_downloadAssetsForConfig_clientID_progress_completionHandler___block_invoke_55(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)initializeWithSandboxExtensions:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__SFLocalSpeechRecognitionClient_initializeWithSandboxExtensions___block_invoke;
  v7[3] = &unk_1E61557F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __66__SFLocalSpeechRecognitionClient_initializeWithSandboxExtensions___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__SFLocalSpeechRecognitionClient_initializeWithSandboxExtensions___block_invoke_2;
  v4[3] = &unk_1E6154F38;
  void v4[4] = v2;
  id v3 = -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v2, v4);
  [v3 initializeWithSandboxExtensions:*(void *)(a1 + 40)];
}

void __66__SFLocalSpeechRecognitionClient_initializeWithSandboxExtensions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    id v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained localSpeechRecognitionClient:*(void *)(a1 + 32) speechRecognitionDidFail:v3];
}

void __88__SFLocalSpeechRecognitionClient_installedLanguagesForAssetType_synchronous_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412546;
    __int16 v8 = @"com.apple.speech.localspeechrecognition";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    int v6 = [MEMORY[0x1E4F1CAD0] set];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

void __88__SFLocalSpeechRecognitionClient_installedLanguagesForAssetType_synchronous_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412546;
    __int16 v8 = @"com.apple.speech.localspeechrecognition";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    int v6 = [MEMORY[0x1E4F1CAD0] set];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

void __76__SFLocalSpeechRecognitionClient_supportedLanguagesForAssetType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412546;
    __int16 v8 = @"com.apple.speech.localspeechrecognition";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    int v6 = [MEMORY[0x1E4F1C978] array];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

- (void)pathToAssetWithConfig:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__SFLocalSpeechRecognitionClient_pathToAssetWithConfig_clientID_completion___block_invoke;
  v13[3] = &unk_1E6154F60;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = -[SFLocalSpeechRecognitionClient _serviceProxyWithErrorHandler:](self, v13);
  [v12 pathToAssetWithConfig:v11 clientID:v10 completion:v9];
}

void __76__SFLocalSpeechRecognitionClient_pathToAssetWithConfig_clientID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    int v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)preloadRecognizerForLanguage:(id)a3 task:(id)a4 clientID:(id)a5 recognitionOverrides:(id)a6 modelOverrideURL:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __126__SFLocalSpeechRecognitionClient_preloadRecognizerForLanguage_task_clientID_recognitionOverrides_modelOverrideURL_completion___block_invoke;
  block[3] = &unk_1E6154F88;
  id v32 = v18;
  id v33 = v19;
  void block[4] = self;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  id v26 = v19;
  dispatch_async(queue, block);
}

void __126__SFLocalSpeechRecognitionClient_preloadRecognizerForLanguage_task_clientID_recognitionOverrides_modelOverrideURL_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __126__SFLocalSpeechRecognitionClient_preloadRecognizerForLanguage_task_clientID_recognitionOverrides_modelOverrideURL_completion___block_invoke_2;
  v4[3] = &unk_1E6154F60;
  id v5 = *(id *)(a1 + 80);
  id v3 = -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v2, v4);
  [v3 preloadRecognizerForLanguage:*(void *)(a1 + 40) task:*(void *)(a1 + 48) clientID:*(void *)(a1 + 56) recognitionOverrides:*(void *)(a1 + 64) modelOverrideURL:*(void *)(a1 + 72) completion:*(void *)(a1 + 80)];
}

void __126__SFLocalSpeechRecognitionClient_preloadRecognizerForLanguage_task_clientID_recognitionOverrides_modelOverrideURL_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    int v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)cancelSpeech
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SFLocalSpeechRecognitionClient_cancelSpeech__block_invoke;
  block[3] = &unk_1E61557A0;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __46__SFLocalSpeechRecognitionClient_cancelSpeech__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__SFLocalSpeechRecognitionClient_cancelSpeech__block_invoke_2;
  v3[3] = &unk_1E6154F38;
  v3[4] = v1;
  uint64_t v2 = -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v1, v3);
  [v2 cancelSpeech];
}

void __46__SFLocalSpeechRecognitionClient_cancelSpeech__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    int v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained localSpeechRecognitionClient:*(void *)(a1 + 32) speechRecognitionDidFail:v3];
}

- (void)stopSpeech
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SFLocalSpeechRecognitionClient_stopSpeech__block_invoke;
  block[3] = &unk_1E61557A0;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __44__SFLocalSpeechRecognitionClient_stopSpeech__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__SFLocalSpeechRecognitionClient_stopSpeech__block_invoke_2;
  v3[3] = &unk_1E6154F38;
  v3[4] = v1;
  uint64_t v2 = -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v1, v3);
  [v2 stopSpeech];
}

void __44__SFLocalSpeechRecognitionClient_stopSpeech__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    int v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained localSpeechRecognitionClient:*(void *)(a1 + 32) speechRecordingDidFail:v3];
}

- (void)addAudioPacket:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SFLocalSpeechRecognitionClient_addAudioPacket___block_invoke;
  v7[3] = &unk_1E61557F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __49__SFLocalSpeechRecognitionClient_addAudioPacket___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SFLocalSpeechRecognitionClient_addAudioPacket___block_invoke_2;
  v4[3] = &unk_1E6154F38;
  void v4[4] = v2;
  id v3 = -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v2, v4);
  [v3 addAudioPacket:*(void *)(a1 + 40)];
}

void __49__SFLocalSpeechRecognitionClient_addAudioPacket___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    int v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained localSpeechRecognitionClient:*(void *)(a1 + 32) speechRecordingDidFail:v3];
}

- (void)startRecordedAudioDictationWithParameters:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__SFLocalSpeechRecognitionClient_startRecordedAudioDictationWithParameters___block_invoke;
  v7[3] = &unk_1E61557F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __76__SFLocalSpeechRecognitionClient_startRecordedAudioDictationWithParameters___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 48))
  {
    id v3 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B709D000, v3, OS_LOG_TYPE_ERROR, "Local speech recognizer restarted while already recognizing", buf, 2u);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 56));
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4E698] code:1100 userInfo:0];
    [WeakRetained localSpeechRecognitionClient:v5 speechRecognitionDidFail:v6];
  }
  else
  {
    *(unsigned char *)(v2 + 48) = 1;
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__SFLocalSpeechRecognitionClient_startRecordedAudioDictationWithParameters___block_invoke_47;
    v8[3] = &unk_1E6154F38;
    v8[4] = v7;
    id WeakRetained = -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](v7, v8);
    [WeakRetained startRecordedAudioDictationWithParameters:*(void *)(a1 + 40)];
  }
}

void __76__SFLocalSpeechRecognitionClient_startRecordedAudioDictationWithParameters___block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    uint64_t v7 = @"com.apple.speech.localspeechrecognition";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1B709D000, v4, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v6, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained localSpeechRecognitionClient:*(void *)(a1 + 32) speechRecognitionDidFail:v3];
}

void __38__SFLocalSpeechRecognitionClient_init__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = @"com.apple.speech.localspeechrecognition";
    _os_log_impl(&dword_1B709D000, v2, OS_LOG_TYPE_INFO, "%@ Interrupted", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__SFLocalSpeechRecognitionClient_init__block_invoke_41;
    block[3] = &unk_1E61557A0;
    uint64_t v7 = WeakRetained;
    dispatch_async(v5, block);
  }
}

uint64_t __38__SFLocalSpeechRecognitionClient_init__block_invoke_41(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4E698] code:1107 userInfo:0];
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v4;

  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v7 + 56));
    [WeakRetained localSpeechRecognitionClient:0 speechRecognitionDidFail:*(void *)(*(void *)(a1 + 32) + 24)];

    uint64_t v7 = *(void *)(a1 + 32);
  }
  uint64_t v9 = *(void *)(v7 + 24);

  return [(id)v7 localSpeechRecognitionDidFinishDownloadingAssets:0 error:v9];
}

- (SFLocalSpeechRecognitionClient)initWithDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFLocalSpeechRecognitionClient *)self init];
  objc_storeWeak((id *)&v5->_delegate, v4);

  return v5;
}

+ (void)cleanupCacheWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  queue = v4->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__SFLocalSpeechRecognitionClient_cleanupCacheWithCompletion___block_invoke;
  v8[3] = &unk_1E6154FF8;
  uint64_t v9 = v4;
  id v10 = v3;
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_async(queue, v8);
}

void __61__SFLocalSpeechRecognitionClient_cleanupCacheWithCompletion___block_invoke(uint64_t a1)
{
  -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](*(void *)(a1 + 32), &__block_literal_global_53);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 cleanupCacheWithCompletion:*(void *)(a1 + 40)];
}

void __61__SFLocalSpeechRecognitionClient_cleanupCacheWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412546;
    uint64_t v5 = @"com.apple.speech.localspeechrecognition";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_1B709D000, v3, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v4, 0x16u);
  }
}

+ (void)logCoreAnalyticsEvent:(id)a3 withAnalytics:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(SFLocalSpeechRecognitionClient);
  queue = v7->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SFLocalSpeechRecognitionClient_logCoreAnalyticsEvent_withAnalytics___block_invoke;
  block[3] = &unk_1E61551C0;
  id v13 = v7;
  id v14 = v5;
  id v15 = v6;
  id v9 = v6;
  id v10 = v5;
  id v11 = v7;
  dispatch_async(queue, block);
}

void __70__SFLocalSpeechRecognitionClient_logCoreAnalyticsEvent_withAnalytics___block_invoke(uint64_t *a1)
{
  -[SFLocalSpeechRecognitionClient _asynchronousServiceProxyWithErrorHandler:](a1[4], &__block_literal_global_1512);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 logCoreAnalyticsEvent:a1[5] withAnalytics:a1[6]];
}

void __70__SFLocalSpeechRecognitionClient_logCoreAnalyticsEvent_withAnalytics___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412546;
    id v5 = @"com.apple.speech.localspeechrecognition";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_1B709D000, v3, OS_LOG_TYPE_ERROR, "Received an error while accessing %@ service: %@", (uint8_t *)&v4, 0x16u);
  }
}

@end