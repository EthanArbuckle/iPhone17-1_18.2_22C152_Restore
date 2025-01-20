@interface VCPMediaAnalyzer
+ (BOOL)includeTorsoOnlyForOneUP;
+ (Class)_getDistanceDescriptorClass;
+ (id)classifyFaceObservation:(id)a3 withPersonsModel:(id)a4 error:(id *)a5;
+ (id)loadPersonModelAtPath:(id)a3 error:(id *)a4;
+ (id)personModelFilepathForPhotoLibrary:(id)a3;
+ (id)sharedMediaAnalyzer;
+ (unint64_t)faceprintRevisionForPersonModel:(id)a3;
+ (unint64_t)getUnifiedEmbeddingVersion;
+ (void)getEmbeddingFormatForVersion:(unint64_t)a3 dimension:(int *)a4 type:(unint64_t *)a5 error:(id *)a6;
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)postProcessMovieHighlightDuration:(SEL)a3 withOptions:(id)a4;
- (BOOL)cancelAnalysisWithRequestID:(int)a3;
- (VCPMediaAnalyzer)init;
- (id)_addCaptionToHighlightResults:(id)a3;
- (id)_addClassificationResults:(id)a3 analysis:(id)a4;
- (id)_analyzeOndemand:(id)a3 forAnalysisTypes:(unint64_t)a4 withExistingAnalysis:(id)a5 andOptions:(id)a6 storeAnalysis:(BOOL)a7 cancelBlock:(id)a8;
- (id)_databaseForPhotoLibrary:(id)a3;
- (id)_getCaptionFor:(id *)a3 withCaptions:(id)a4 hasSegment:(BOOL)a5;
- (id)_postProcessMovieHighlights:(id)a3 analysis:(id)a4 withOptions:(id)a5;
- (id)_queryDistanceDescriptor:(Class)a3 ofAsset:(id)a4 withExistingAnalysis:(id)a5 andDatabase:(id)a6 timeRange:(id *)a7 lastFeature:(BOOL)a8 isDegraded:(BOOL *)a9;
- (id)_requestAnalysis:(unint64_t)a3 forAsset:(id)a4 withExistingAnalysis:(id)a5 andDatabase:(id)a6 andOptions:(id)a7 cancelBlock:(id)a8;
- (id)analyzeOndemand:(id)a3 pairedURL:(id)a4 forAnalysisTypes:(unint64_t)a5 error:(id *)a6;
- (id)connection;
- (id)curateMovieAssetsForCollection:(id)a3 withAlreadyCuratedAssets:(id)a4 andDesiredCount:(unint64_t)a5 allowOnDemand:(BOOL)a6;
- (id)findTimeRangesFor:(id)a3 inAsset:(id)a4 withOptions:(id)a5 results:(id)a6 andError:(id *)a7;
- (id)getAnalysisResultsForURLAsset:(id)a3;
- (id)getTimeRangesForActionIDs:(id)a3 withResults:(id)a4;
- (id)getTimeRangesForSceneIdentifiers:(id)a3 withResults:(id)a4;
- (id)getTimeRangesForSoundIdentifiers:(id)a3 withResults:(id)a4;
- (id)getTimeRangesInAsset:(id)a3 forFaces:(id)a4 withAnalysis:(id)a5;
- (id)getTimeRangesInAsset:(id)a3 forPersonLocalIdentifiers:(id)a4 withAnalysis:(id)a5;
- (id)getTimeRangesWithSearchResults:(id)a3;
- (id)loadAssetsFromPhotoLibrary:(id)a3 withAssetIdentifiers:(id)a4;
- (id)loadEmbeddingSearchResultWithContext:(id)a3 forPhotoLibraryURL:(id)a4 fromAssets:(id)a5 withOptions:(id)a6;
- (id)loadVideoAssetsFromPhotoLibraryURL:(id)a3 withAssetIdentifiers:(id)a4;
- (id)mergeTimeRanges:(id)a3 mergeGap:(id)a4;
- (id)postProcessTimeRanges:(id)a3 options:(id)a4;
- (id)prepareContextsQueryEmbedding:(id)a3;
- (id)rankAssetsWithContext:(id)a3 forAssetIdentifiers:(id)a4 forPhotoLibraryURL:(id)a5 withOptions:(id)a6 error:(id *)a7;
- (id)requestAnalysis:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andError:(id *)a7;
- (id)requestAnalysisTypes:(unint64_t)a3 forAssetWithResourceURLs:(id)a4 withOptions:(id)a5 error:(id *)a6;
- (id)requestAnalysisTypes:(unint64_t)a3 forAssets:(id)a4 allowOndemand:(BOOL)a5 progressHandler:(id)a6 error:(id *)a7;
- (id)requestLivePhotoEffectsForAssets:(id)a3 allowOnDemand:(BOOL)a4 flags:(unint64_t)a5;
- (id)requestMovieHighlightsForAssets:(id)a3 withOptions:(id)a4;
- (id)requestSearchResultsForAssets:(id)a3 forPhotoLibraryURL:(id)a4 withQueryEmbeddings:(id)a5 matchingScoreOnly:(BOOL)a6 options:(id)a7;
- (id)requestSearchResultsForAssets:(id)a3 forPhotoLibraryURL:(id)a4 withQueryEmbeddings:(id)a5 options:(id)a6;
- (id)searchForQuery:(id)a3 forAssets:(id)a4 withOptions:(id)a5 matchingScoreOnly:(BOOL)a6 isURLAsset:(BOOL)a7 analyses:(id)a8;
- (int)findTimeRangesFor:(id)a3 inAsset:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7;
- (int)findTimeRangesFor:(id)a3 inURLAsset:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7;
- (int)findTimeRangesWithContext:(id)a3 inAsset:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7;
- (int)findTimeRangesWithContext:(id)a3 inURLAsset:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7;
- (int)requestAnalysesForAssets:(id)a3 analysisTypes:(unint64_t)a4 allowOndemand:(BOOL)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (int)requestAnalysis:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7;
- (int)requestAnalysisForAsset:(id)a3 analysisTypes:(unint64_t)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (int)requestAnalysisTypes:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 cancelBlock:(id)a7 analyses:(id)a8;
- (int64_t)_getDatabaseSandboxExtensionForPhotoLibraryURL:(id)a3;
- (int64_t)_getSandboxExtensionForMediaAnalysisDatabaseWithPhotoLibraryURL:(id)a3;
- (unint64_t)_metaAnalysisTypesForAsset:(id)a3;
- (unint64_t)_typesToRemove:(unint64_t)a3 requested:(unint64_t)a4;
- (void)_checkDuplicate:(id)a3 withAsset:(id)a4 duplicate:(int64_t *)a5;
- (void)_getSceneDescriptors:(id)a3 asDescriptorClass:(Class)a4 withSceneRange:(id *)a5 andAnalysisResults:(id)a6;
- (void)_setupMediaAnalysisServiceConnection;
- (void)addVideoRankingSignalsToDictionary:(id)a3 fromPhotoLibraryURL:(id)a4 amongAssets:(id)a5;
- (void)assetsAnalyzedSinceDate:(id)a3 completionHandler:(id)a4;
- (void)assetsFromPhotoLibrary:(id)a3 analyzedSinceDate:(id)a4 completionHandler:(id)a5;
- (void)completeStorage;
- (void)dealloc;
- (void)distanceFromAsset:(id)a3 timeRange:(id *)a4 toAsset:(id)a5 timeRange:(id *)a6 duplicate:(int64_t *)a7 distance:(float *)a8;
- (void)distanceFromAsset:(id)a3 toAsset:(id)a4 duplicate:(int64_t *)a5 distance:(float *)a6;
@end

@implementation VCPMediaAnalyzer

- (VCPMediaAnalyzer)init
{
  v29.receiver = self;
  v29.super_class = (Class)VCPMediaAnalyzer;
  v2 = [(VCPMediaAnalyzer *)&v29 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mediaanalysis.ondemand", 0);
    analysisQueue = v2->_analysisQueue;
    v2->_analysisQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mediaanalysis.storage", 0);
    storageQueue = v2->_storageQueue;
    v2->_storageQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediaanalysis.search", 0);
    searchQueue = v2->_searchQueue;
    v2->_searchQueue = (OS_dispatch_queue *)v7;

    dispatch_group_t v9 = dispatch_group_create();
    storageGroup = v2->_storageGroup;
    v2->_storageGroup = (OS_dispatch_group *)v9;

    standalone = v2->_standalone;
    v2->_standalone = 0;

    noResultStrip = v2->_noResultStrip;
    v2->_noResultStrip = 0;

    connection = v2->_connection;
    v2->_connection = 0;

    mediaAnalysisServiceConnection = v2->_mediaAnalysisServiceConnection;
    v2->_mediaAnalysisServiceConnection = 0;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.mediaanalysis.VCPMediaAnalyzer.sandboxQueue", 0);
    sandboxQueue = v2->_sandboxQueue;
    v2->_sandboxQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    sandboxHandles = v2->_sandboxHandles;
    v2->_sandboxHandles = (NSMutableDictionary *)v17;

    atomic_store(0, (unsigned int *)&v2->_nextRequestID);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.mediaanalysis.VCPMediaAnalyzer.cancelQueue", 0);
    cancelQueue = v2->_cancelQueue;
    v2->_cancelQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    cancelTokens = v2->_cancelTokens;
    v2->_cancelTokens = (NSMutableDictionary *)v21;

    if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
    {
      v23 = objc_alloc_init(VCPTextEncoder);
      textEncoder = v2->_textEncoder;
      v2->_textEncoder = v23;

      v25 = objc_alloc_init(VCPFreeFormSearch);
      freeFormSearch = v2->_freeFormSearch;
      v2->_freeFormSearch = v25;
    }
    v27 = v2;
  }

  return v2;
}

+ (id)sharedMediaAnalyzer
{
  if (+[VCPMediaAnalyzer sharedMediaAnalyzer]::once != -1) {
    dispatch_once(&+[VCPMediaAnalyzer sharedMediaAnalyzer]::once, &__block_literal_global_64);
  }
  v2 = (void *)+[VCPMediaAnalyzer sharedMediaAnalyzer]::instance;
  return v2;
}

void __39__VCPMediaAnalyzer_sharedMediaAnalyzer__block_invoke()
{
  v0 = objc_alloc_init(VCPMediaAnalyzer);
  v1 = (void *)+[VCPMediaAnalyzer sharedMediaAnalyzer]::instance;
  +[VCPMediaAnalyzer sharedMediaAnalyzer]::instance = (uint64_t)v0;
}

+ (unint64_t)getUnifiedEmbeddingVersion
{
  return +[VCPVideoTransformerBackbone embeddingVersion];
}

+ (void)getEmbeddingFormatForVersion:(unint64_t)a3 dimension:(int *)a4 type:(unint64_t *)a5 error:(id *)a6
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3 - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    if (a4) {
      *a4 = 512;
    }
    if (a5) {
      *a5 = 1;
    }
  }
  else if (a6)
  {
    dispatch_queue_t v7 = (void *)MEMORY[0x1E4F28C58];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"version %d is not supported", a4, a5, a3, *MEMORY[0x1E4F28568]);
    v11[0] = v8;
    dispatch_group_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    *a6 = [v7 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v9];
  }
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  dispatch_queue_t v3 = [(NSMutableDictionary *)self->_sandboxHandles allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6) longLongValue];
        sandbox_extension_release();
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  [(NSXPCConnection *)self->_connection invalidate];
  [(NSXPCConnection *)self->_mediaAnalysisServiceConnection invalidate];
  v7.receiver = self;
  v7.super_class = (Class)VCPMediaAnalyzer;
  [(VCPMediaAnalyzer *)&v7 dealloc];
}

- (void)_setupMediaAnalysisServiceConnection
{
  if (!self->_mediaAnalysisServiceConnection)
  {
    dispatch_queue_t v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mediaanalysisd.analysis" options:0];
    mediaAnalysisServiceConnection = self->_mediaAnalysisServiceConnection;
    self->_mediaAnalysisServiceConnection = v3;

    uint64_t v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F16407D8];
    [(NSXPCConnection *)self->_mediaAnalysisServiceConnection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)self->_mediaAnalysisServiceConnection setInterruptionHandler:&__block_literal_global_740];
    objc_initWeak(&location, self);
    uint64_t v6 = self->_mediaAnalysisServiceConnection;
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    long long v9 = __56__VCPMediaAnalyzer__setupMediaAnalysisServiceConnection__block_invoke_741;
    long long v10 = &unk_1E62981D8;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)v6 setInvalidationHandler:&v7];
    [(NSXPCConnection *)self->_mediaAnalysisServiceConnection resume];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __56__VCPMediaAnalyzer__setupMediaAnalysisServiceConnection__block_invoke()
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v0 = VCPLogInstance();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1BBEDA000, v0, OS_LOG_TYPE_DEBUG, "[VCPMediaAnalyzer] Client XPC connection interrupted", v1, 2u);
    }
  }
}

void __56__VCPMediaAnalyzer__setupMediaAnalysisServiceConnection__block_invoke_741(uint64_t a1)
{
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEFAULT, "[VCPMediaAnalyzer] Client XPC connection invalidated", buf, 2u);
    }
  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained[10];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__VCPMediaAnalyzer__setupMediaAnalysisServiceConnection__block_invoke_742;
    block[3] = &unk_1E6296FF8;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

void __56__VCPMediaAnalyzer__setupMediaAnalysisServiceConnection__block_invoke_742(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 72);
  *(void *)(v1 + 72) = 0;
}

- (int64_t)_getSandboxExtensionForMediaAnalysisDatabaseWithPhotoLibraryURL:(id)a3
{
  id v4 = a3;
  [(VCPMediaAnalyzer *)self _setupMediaAnalysisServiceConnection];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "[VCPMediaAnalyzer] Acquiring media analysis directory sandbox extension...", buf, 2u);
    }
  }
  *(void *)buf = 0;
  dispatch_queue_t v19 = buf;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = -1;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  mediaAnalysisServiceConnection = self->_mediaAnalysisServiceConnection;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__VCPMediaAnalyzer__getSandboxExtensionForMediaAnalysisDatabaseWithPhotoLibraryURL___block_invoke;
  v16[3] = &unk_1E6297BE8;
  uint64_t v8 = v6;
  uint64_t v17 = v8;
  long long v9 = [(NSXPCConnection *)mediaAnalysisServiceConnection remoteObjectProxyWithErrorHandler:v16];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__VCPMediaAnalyzer__getSandboxExtensionForMediaAnalysisDatabaseWithPhotoLibraryURL___block_invoke_744;
  v13[3] = &unk_1E629BB18;
  dispatch_queue_t v15 = buf;
  long long v10 = v8;
  v14 = v10;
  [v9 requestMediaAnalysisDatabaseAccessSandboxExtensionWithPhotoLibraryURL:v4 andReply:v13];

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  int64_t v11 = *((void *)v19 + 3);

  _Block_object_dispose(buf, 8);
  return v11;
}

void __84__VCPMediaAnalyzer__getSandboxExtensionForMediaAnalysisDatabaseWithPhotoLibraryURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [v3 description];
      int v6 = 138412546;
      uint64_t v7 = @"com.apple.mediaanalysisd.analysis";
      __int16 v8 = 2112;
      long long v9 = v5;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[VCPMediaAnalyzer] Failed to establish connection or connection lost to service %@; %@",
        (uint8_t *)&v6,
        0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __84__VCPMediaAnalyzer__getSandboxExtensionForMediaAnalysisDatabaseWithPhotoLibraryURL___block_invoke_744(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    [v3 UTF8String];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sandbox_extension_consume();
    if ((*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) & 0x8000000000000000) != 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        uint64_t v5 = VCPLogInstance();
        os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v7 = "[VCPMediaAnalyzer] Failed to consume media analysis directory sandbox extension";
          __int16 v8 = buf;
          goto LABEL_9;
        }
LABEL_10:
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v5 = VCPLogInstance();
      os_log_type_t v6 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        __int16 v9 = 0;
        uint64_t v7 = "[VCPMediaAnalyzer] Consumed media analysis directory sandbox extension";
        __int16 v8 = (uint8_t *)&v9;
LABEL_9:
        _os_log_impl(&dword_1BBEDA000, v5, v6, v7, v8, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)connection
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mediaanalysisd.photos" options:0];
    uint64_t v5 = self->_connection;
    self->_connection = v4;

    os_log_type_t v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1640958];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_connection resume];
    connection = self->_connection;
  }
  return connection;
}

- (int64_t)_getDatabaseSandboxExtensionForPhotoLibraryURL:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = -1;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  os_log_type_t v6 = [(VCPMediaAnalyzer *)self connection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__VCPMediaAnalyzer__getDatabaseSandboxExtensionForPhotoLibraryURL___block_invoke;
  v15[3] = &unk_1E6297BE8;
  uint64_t v7 = v5;
  v16 = v7;
  __int16 v8 = [v6 remoteObjectProxyWithErrorHandler:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__VCPMediaAnalyzer__getDatabaseSandboxExtensionForPhotoLibraryURL___block_invoke_755;
  v12[3] = &unk_1E629BB18;
  v14 = &v17;
  __int16 v9 = v7;
  uint64_t v13 = v9;
  [v8 registerClient:@"VCPMediaAnalyzer" forPhotoLibraryURL:v4 withReply:v12];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  int64_t v10 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v10;
}

intptr_t __67__VCPMediaAnalyzer__getDatabaseSandboxExtensionForPhotoLibraryURL___block_invoke(uint64_t a1)
{
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] failed to get database sandbox extension", v4, 2u);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __67__VCPMediaAnalyzer__getDatabaseSandboxExtensionForPhotoLibraryURL___block_invoke_755(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    [v3 UTF8String];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sandbox_extension_consume();
    if ((*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) & 0x8000000000000000) != 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        dispatch_semaphore_t v5 = VCPLogInstance();
        os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v7 = "[MediaAnalysis] failed to consume sandbox extension";
          __int16 v8 = buf;
          goto LABEL_9;
        }
LABEL_10:
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 7)
    {
      dispatch_semaphore_t v5 = VCPLogInstance();
      os_log_type_t v6 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        __int16 v9 = 0;
        uint64_t v7 = "[MediaAnalysis] Consumed sandbox extension";
        __int16 v8 = (uint8_t *)&v9;
LABEL_9:
        _os_log_impl(&dword_1BBEDA000, v5, v6, v7, v8, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_databaseForPhotoLibrary:(id)a3
{
  id v4 = a3;
  sandboxQueue = self->_sandboxQueue;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  int64_t v11 = __45__VCPMediaAnalyzer__databaseForPhotoLibrary___block_invoke;
  v12 = &unk_1E62982E8;
  id v6 = v4;
  id v13 = v6;
  v14 = self;
  dispatch_sync(sandboxQueue, &v9);
  uint64_t v7 = +[VCPClientDatabaseManager sharedDatabaseForPhotoLibrary:](VCPClientDatabaseManager, "sharedDatabaseForPhotoLibrary:", v6, v9, v10, v11, v12);

  return v7;
}

void __45__VCPMediaAnalyzer__databaseForPhotoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 photoLibraryURL];
  }
  else {
  id v3 = objc_msgSend(MEMORY[0x1E4F39220], "vcp_defaultURL");
  }
  id v4 = [*(id *)(*(void *)(a1 + 40) + 88) objectForKeyedSubscript:v3];

  if (!v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) _getSandboxExtensionForMediaAnalysisDatabaseWithPhotoLibraryURL:v3];
    if (v5 < 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        uint64_t v7 = VCPLogInstance();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v8 = [v3 path];
          int v9 = 138412290;
          uint64_t v10 = v8;
          _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Failed to obtain analysis sandbox extension for Photo Library (%@); client may not be able t"
            "o open analysis database",
            (uint8_t *)&v9,
            0xCu);
        }
      }
    }
    else
    {
      id v6 = [NSNumber numberWithLongLong:v5];
      [*(id *)(*(void *)(a1 + 40) + 88) setObject:v6 forKeyedSubscript:v3];
    }
  }
}

- (id)_addClassificationResults:(id)a3 analysis:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v26 = a4;
  if (v5
    && (objc_msgSend(v5, "vcp_modificationDate"), id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    __int16 v8 = [v5 sceneClassifications];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          [v12 confidence];
          if (v13 != 0.0 && [v12 extendedSceneIdentifier])
          {
            v14 = NSNumber;
            [v12 confidence];
            dispatch_queue_t v15 = objc_msgSend(v14, "numberWithDouble:");
            v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "extendedSceneIdentifier"));
            uint64_t v17 = [v16 stringValue];
            [v7 setObject:v15 forKey:v17];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v34 count:16];
      }
      while (v9);
    }

    if (v7 && [v7 count])
    {
      if (v26)
      {
        id v18 = (id)[v26 mutableCopy];
      }
      else
      {
        uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
        objc_msgSend(v20, "vcp_setVersion:", 70);
        uint64_t v21 = objc_msgSend(v5, "vcp_modificationDate");
        objc_msgSend(v20, "vcp_setDateModified:", v21);

        v22 = [MEMORY[0x1E4F1C9C8] date];
        objc_msgSend(v20, "vcp_setDateAnalyzed:", v22);

        id v18 = v20;
        objc_msgSend(v20, "vcp_setFlags:", 0);
      }
      v31 = @"attributes";
      v32 = v7;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      v33 = v23;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
      objc_msgSend(v18, "vcp_setResult:forKey:", v24, @"ClassificationResults");

      objc_msgSend(v18, "vcp_addTypes:", 0x4000);
    }
    else
    {
      id v18 = v26;
    }

    uint64_t v19 = v26;
  }
  else
  {
    uint64_t v19 = v26;
    id v18 = v26;
  }

  return v18;
}

- (unint64_t)_metaAnalysisTypesForAsset:(id)a3
{
  return 4 * ([a3 mediaType] == 1);
}

- (unint64_t)_typesToRemove:(unint64_t)a3 requested:(unint64_t)a4
{
  unint64_t v4 = a3 & ~a4 & 0xFFFFFFFFFFFFFF33;
  if ((a3 & 0xC) == 4) {
    unint64_t v5 = v4 | 4;
  }
  else {
    unint64_t v5 = a3 & ~a4 & 0xFFFFFFFFFFFFFF33;
  }
  if ((a4 & 0xC) == 0) {
    v4 |= 0xCuLL;
  }
  if ((a4 & 0xC) == 8) {
    unint64_t v4 = v5;
  }
  if ((a3 & 0xC0) == 0x40) {
    unint64_t v6 = v4 | 0x40;
  }
  else {
    unint64_t v6 = v4;
  }
  if ((a4 & 0xC0) == 0) {
    v4 |= 0xC0uLL;
  }
  if ((a4 & 0xC0) == 0x80) {
    return v6;
  }
  else {
    return v4;
  }
}

- (id)_postProcessMovieHighlights:(id)a3 analysis:(id)a4 withOptions:(id)a5
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v80 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  v81 = v8;
  if (!v8)
  {
    id v13 = 0;
    goto LABEL_97;
  }
  uint64_t v11 = [v9 objectForKeyedSubscript:@"MaxHighlightDuration"];
  v79 = [v10 objectForKeyedSubscript:@"HighlightBestTrim"];
  v82 = [v10 objectForKeyedSubscript:@"HighlightContexts"];
  CFDictionaryRef v12 = [v10 objectForKeyedSubscript:@"HighlightPreferredRange"];
  memset(&v101, 0, sizeof(v101));
  CFDictionaryRef v76 = v12;
  if (v12)
  {
    CMTimeRangeMakeFromDictionary(&v101, v12);
  }
  else
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
    *(_OWORD *)&v101.start.value = *MEMORY[0x1E4F1FA30];
    *(_OWORD *)&v101.start.epoch = v14;
    *(_OWORD *)&v101.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
  }
  v78 = [v10 objectForKeyedSubscript:@"HighlightTargetDuration"];
  v77 = [v10 objectForKeyedSubscript:@"HighlightTolerance"];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    dispatch_queue_t v15 = VCPLogInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.start.value) = 0;
      _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_INFO, "[MediaAnalysis] Movie Highlights post processing with input options", (uint8_t *)&buf, 2u);
    }
  }
  if (v11)
  {
    [v11 floatValue];
    if (v16 > 10.0)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        id v18 = VCPLogInstance();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.start.value) = 134218240;
          *(double *)((char *)&buf.start.value + 4) = 10.0;
          LOWORD(buf.start.flags) = 2048;
          *(double *)((char *)&buf.start.flags + 2) = 10.0;
          _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Requested max highlight duration longer than %.2fs, fall back to %.2fs", (uint8_t *)&buf, 0x16u);
        }
      }
      LODWORD(v17) = 1092616192;
      uint64_t v19 = [NSNumber numberWithFloat:v17];

      uint64_t v11 = (void *)v19;
    }
  }
  uint64_t v20 = objc_msgSend(v8, "vcp_results");
  uint64_t v21 = [v20 objectForKeyedSubscript:@"MovieHighlightResults"];
  if (v21 || v82 && [v82 count])
  {

LABEL_19:
    goto LABEL_20;
  }
  if ((v101.start.flags & 1) == 0 || (v101.duration.flags & 1) == 0 || v101.duration.epoch || v101.duration.value < 0) {
    goto LABEL_19;
  }
  CMTime duration = v101.duration;
  CMTime v99 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  BOOL v40 = CMTimeCompare(&duration, &v99) == 0;

  if (!v40)
  {
LABEL_20:
    if ((objc_msgSend(v80, "vcp_isVideoSlowmo") & 1) != 0
      || v82 && [v82 count]
      || (v101.start.flags & 1) == 0
      || (v101.duration.flags & 1) == 0
      || v101.duration.epoch
      || v101.duration.value < 0)
    {
      double v22 = 10.0;
    }
    else
    {
      CMTime time1 = v101.duration;
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      double v22 = 10.0;
      if (!CMTimeCompare(&time1, &time2) && !v78)
      {
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        v23 = objc_msgSend(v81, "vcp_results");
        v24 = [v23 objectForKeyedSubscript:@"MovieHighlightResults"];

        uint64_t v25 = [v24 countByEnumeratingWithState:&v93 objects:v112 count:16];
        if (v25)
        {
          uint64_t v26 = *(void *)v94;
          double v22 = 0.0;
          while (2)
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v94 != v26) {
                objc_enumerationMutation(v24);
              }
              CFDictionaryRef v28 = *(const __CFDictionary **)(*((void *)&v93 + 1) + 8 * i);
              memset(&buf, 0, sizeof(buf));
              CMTimeRangeMakeFromDictionary(&buf, v28);
              if (v11)
              {
                CMTime time = buf.duration;
                double Seconds = CMTimeGetSeconds(&time);
                [v11 floatValue];
                if (Seconds > v30)
                {

                  goto LABEL_42;
                }
              }
              CMTime v91 = buf.duration;
              double v31 = CMTimeGetSeconds(&v91);
              if (v22 < v31) {
                double v22 = v31;
              }
            }
            uint64_t v25 = [v24 countByEnumeratingWithState:&v93 objects:v112 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }
        else
        {
          double v22 = 0.0;
        }

        if (!v79 || ![v79 BOOLValue])
        {
          v66 = [MEMORY[0x1E4F1CA48] array];
          long long v86 = 0u;
          long long v87 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          v67 = objc_msgSend(v81, "vcp_results");
          v68 = [v67 objectForKeyedSubscript:@"MovieHighlightResults"];

          uint64_t v69 = [v68 countByEnumeratingWithState:&v84 objects:v102 count:16];
          if (v69)
          {
            uint64_t v70 = *(void *)v85;
            do
            {
              for (uint64_t j = 0; j != v69; ++j)
              {
                if (*(void *)v85 != v70) {
                  objc_enumerationMutation(v68);
                }
                CFDictionaryRef v72 = *(const __CFDictionary **)(*((void *)&v84 + 1) + 8 * j);
                memset(&buf, 0, sizeof(buf));
                CMTimeRangeMakeFromDictionary(&buf, v72);
                CMTime v83 = buf.duration;
                double v73 = CMTimeGetSeconds(&v83);
                [(NSNumber *)self->_minHighlightDuration floatValue];
                if (v73 >= v74) {
                  [v66 addObject:v72];
                }
              }
              uint64_t v69 = [v68 countByEnumeratingWithState:&v84 objects:v102 count:16];
            }
            while (v69);
          }

          v75 = (void *)[v81 mutableCopy];
          objc_msgSend(v75, "vcp_setResult:forKey:", v66, @"MovieHighlightResults");
          id v13 = v81;

          goto LABEL_96;
        }
      }
    }
LABEL_42:
    if (v82 && [v82 count])
    {
      v32 = [v82 objectForKeyedSubscript:@"SearchQueryString"];
      BOOL v33 = v32 == 0;

      if (v33)
      {
        CFDictionaryRef v36 = 0;
      }
      else
      {
        v34 = (void *)[v10 mutableCopy];
        uint64_t v35 = [v82 objectForKeyedSubscript:@"SearchQueryString"];
        [v34 setObject:v35 forKeyedSubscript:@"SearchQueryString"];

        CFDictionaryRef v36 = (CFDictionaryRef)v34;
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v41 = VCPLogInstance();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = [v80 localIdentifier];
          LODWORD(buf.start.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v42;
          _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_INFO, "[MediaAnalysis][%@] find time ranges matching highlight contexts", (uint8_t *)&buf, 0xCu);
        }
      }
      v43 = VCPSignPostLog();
      os_signpost_id_t v44 = os_signpost_id_generate(v43);

      v45 = VCPSignPostLog();
      v46 = v45;
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
      {
        LOWORD(buf.start.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v46, OS_SIGNPOST_INTERVAL_BEGIN, v44, "VCPMovieHighlightContexts", "", (uint8_t *)&buf, 2u);
      }

      v110 = v81;
      v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v110 count:1];
      if (v36) {
        CFDictionaryRef v48 = v36;
      }
      else {
        CFDictionaryRef v48 = (CFDictionaryRef)v10;
      }
      id v90 = 0;
      v39 = [(VCPMediaAnalyzer *)self findTimeRangesFor:v82 inAsset:v80 withOptions:v48 results:v47 andError:&v90];
      CFDictionaryRef v37 = (CFDictionaryRef)v90;

      v49 = VCPSignPostLog();
      v50 = v49;
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
      {
        LOWORD(buf.start.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v50, OS_SIGNPOST_INTERVAL_END, v44, "VCPMovieHighlightContexts", "", (uint8_t *)&buf, 2u);
      }

      if (v11)
      {
        v38 = v79;
        v79 = (void *)MEMORY[0x1E4F1CC38];
      }
      else
      {
        LODWORD(v51) = 1092616192;
        uint64_t v52 = [NSNumber numberWithFloat:v51];
        v38 = v79;
        v79 = (void *)MEMORY[0x1E4F1CC38];
        uint64_t v11 = (void *)v52;
      }
    }
    else
    {
      if ((v101.start.flags & 1) != 0
        && (v101.duration.flags & 1) != 0
        && !v101.duration.epoch
        && (v101.duration.value & 0x8000000000000000) == 0)
      {
        CMTime v89 = v101.duration;
        CMTime v88 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        if (!CMTimeCompare(&v89, &v88))
        {
          v39 = 0;
          goto LABEL_78;
        }
      }
      v107[0] = @"start";
      *(_OWORD *)&buf.start.value = *(_OWORD *)&v101.start.value;
      buf.start.epoch = v101.start.epoch;
      CFDictionaryRef v37 = CMTimeCopyAsDictionary(&buf.start, 0);
      v108[0] = v37;
      v107[1] = @"duration";
      buf.start = v101.duration;
      CFDictionaryRef v36 = CMTimeCopyAsDictionary(&buf.start, 0);
      v107[2] = @"quality";
      v108[1] = v36;
      v108[2] = &unk_1F15EB1D8;
      v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:3];
      v109 = v38;
      v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v109 count:1];
    }

LABEL_78:
    v105[0] = @"HighlightMaxDuration";
    v53 = v11;
    if (!v11)
    {
      v53 = [NSNumber numberWithDouble:v22];
    }
    v54 = (void *)MEMORY[0x1E4F1CC28];
    if (v79) {
      v54 = v79;
    }
    v106[0] = v53;
    v106[1] = v54;
    v105[1] = @"HighlightBestTrim";
    v105[2] = @"HighlightFullResult";
    v105[3] = @"HighlightContexts";
    if (v39) {
      v55 = v39;
    }
    else {
      v55 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v106[2] = MEMORY[0x1E4F1CC38];
    v106[3] = v55;
    v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:4];
    if (!v11) {

    }
    if (v78)
    {
      v57 = (void *)[v56 mutableCopy];
      [v57 removeObjectForKey:@"HighlightMaxDuration"];
      [v57 removeObjectForKey:@"HighlightBestTrim"];
      v103[0] = @"HighlightTargetDuration";
      v103[1] = @"HighlightTolerance";
      v58 = &unk_1F15EAD58;
      if (v77) {
        v58 = v77;
      }
      v104[0] = v78;
      v104[1] = v58;
      v103[2] = @"HighlightIndex";
      v104[2] = &unk_1F15ED698;
      v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:3];
      [v57 addEntriesFromDictionary:v59];
    }
    else
    {
      v57 = v56;
    }
    v60 = [v10 objectForKeyedSubscript:@"AllowOnDemand"];
    int v61 = [v60 BOOLValue];

    unint64_t v62 = [v80 pixelWidth];
    unint64_t v63 = [v80 pixelHeight];
    if (v61) {
      v64 = v80;
    }
    else {
      v64 = 0;
    }
    MediaAnalysisPostProcessMovieHighlights(v81, v57, v64, (double)v62, (double)v63);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_96;
  }
  id v13 = v81;
LABEL_96:

LABEL_97:
  return v13;
}

- (id)_addCaptionToHighlightResults:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v3 = objc_msgSend(v32, "vcp_results");
  unint64_t v4 = objc_msgSend(v3, "objectForKeyedSubscript:");
  if ([v4 count])
  {
    unint64_t v5 = objc_msgSend(v32, "vcp_results");
    unint64_t v6 = [v5 objectForKeyedSubscript:@"MiCaVideoCaptionResults"];
    if ([v6 count])
    {
LABEL_5:

LABEL_6:
      id v9 = objc_msgSend(v32, "vcp_results");
      uint64_t v10 = [v9 objectForKeyedSubscript:@"VideoSegmentCaptionResults"];

      uint64_t v35 = v10;
      uint64_t v11 = [v10 count];
      if (!v11)
      {
        CFDictionaryRef v12 = objc_msgSend(v32, "vcp_results");
        id v13 = [v12 objectForKeyedSubscript:@"MiCaVideoCaptionResults"];

        if ([v13 count])
        {
          uint64_t v35 = v13;
        }
        else
        {
          double v17 = objc_msgSend(v32, "vcp_results");
          uint64_t v35 = [v17 objectForKeyedSubscript:@"VideoCaptionResults"];
        }
      }
      id v18 = [MEMORY[0x1E4F1CA48] array];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v19 = objc_msgSend(v32, "vcp_results");
      uint64_t v20 = [v19 objectForKeyedSubscript:@"MovieHighlightResults"];

      obuint64_t j = v20;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v40 != v22) {
              objc_enumerationMutation(obj);
            }
            v24 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            uint64_t v25 = (void *)[v24 mutableCopy];
            memset(&buf, 0, sizeof(buf));
            CMTimeRangeMakeFromDictionary(&buf, (CFDictionaryRef)v24);
            CMTimeRange v37 = buf;
            uint64_t v26 = [(VCPMediaAnalyzer *)self _getCaptionFor:&v37 withCaptions:v35 hasSegment:v11 != 0];
            long long v27 = v26;
            if (v26)
            {
              CFDictionaryRef v28 = (void *)[v26 mutableCopy];
              long long v29 = [v24 objectForKeyedSubscript:@"attributes"];
              [v28 addEntriesFromDictionary:v29];

              [v25 setObject:v28 forKeyedSubscript:@"attributes"];
            }
            [v18 addObject:v25];
          }
          uint64_t v21 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v21);
      }

      float v30 = (void *)[v32 mutableCopy];
      objc_msgSend(v30, "vcp_setResult:forKey:", v18, @"MovieHighlightResults");

      goto LABEL_26;
    }
    uint64_t v7 = objc_msgSend(v32, "vcp_results");
    id v8 = [v7 objectForKeyedSubscript:@"VideoSegmentCaptionResults"];
    if ([v8 count])
    {

      goto LABEL_5;
    }
    dispatch_queue_t v15 = objc_msgSend(v32, "vcp_results");
    float v16 = [v15 objectForKeyedSubscript:@"VideoCaptionResults"];
    uint64_t v36 = [v16 count];

    if (v36) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  if ((int)MediaAnalysisLogLevel() < 4) {
    goto LABEL_27;
  }
  long long v14 = VCPLogInstance();
  uint64_t v35 = v14;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.start.value) = 0;
    _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_DEFAULT, "[MediaAnalyzer]Caption add to Highlight - no highlight or caption", (uint8_t *)&buf, 2u);
  }
LABEL_26:

LABEL_27:
  return v32;
}

- (id)_getCaptionFor:(id *)a3 withCaptions:(id)a4 hasSegment:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (v5)
  {
    memset(&v24, 0, sizeof(v24));
    *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var1.var0;
    time.start.epoch = a3->var1.var3;
    CMTimeMultiplyByRatio(&v23, &time.start, 1, 2);
    *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0.var0;
    time.start.epoch = a3->var0.var3;
    CMTime rhs = v23;
    CMTimeAdd(&v24, &time.start, &rhs);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v8);
          }
          CFDictionaryRef v12 = *(const __CFDictionary **)(*((void *)&v19 + 1) + 8 * i);
          memset(&time, 0, sizeof(time));
          CMTimeRangeMakeFromDictionary(&time, v12);
          CMTimeRange range = time;
          CMTime v16 = v24;
          if (CMTimeRangeContainsTime(&range, &v16))
          {
            long long v14 = [(__CFDictionary *)v12 objectForKeyedSubscript:@"attributes"];

            goto LABEL_15;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v26 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  if ([v7 count])
  {
    id v13 = [v7 objectAtIndexedSubscript:0];
    long long v14 = [v13 objectForKeyedSubscript:@"attributes"];
  }
  else
  {
    long long v14 = 0;
  }
LABEL_15:

  return v14;
}

- (id)_analyzeOndemand:(id)a3 forAnalysisTypes:(unint64_t)a4 withExistingAnalysis:(id)a5 andOptions:(id)a6 storeAnalysis:(BOOL)a7 cancelBlock:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  CFDictionaryRef v48 = __Block_byref_object_copy__42;
  v49 = __Block_byref_object_dispose__42;
  id v50 = 0;
  analysisQueue = self->_analysisQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__VCPMediaAnalyzer__analyzeOndemand_forAnalysisTypes_withExistingAnalysis_andOptions_storeAnalysis_cancelBlock___block_invoke;
  block[3] = &unk_1E629BB40;
  id v19 = v14;
  id v39 = v19;
  id v20 = v16;
  id v40 = v20;
  unint64_t v44 = a4;
  id v21 = v15;
  id v41 = v21;
  v43 = &v45;
  id v22 = v17;
  id v42 = v22;
  dispatch_sync(analysisQueue, block);
  if (v9)
  {
    CMTime v23 = (void *)v46[5];
    if (v23)
    {
      if (objc_msgSend(v23, "vcp_types") && !-[NSNumber BOOLValue](self->_standalone, "BOOLValue"))
      {
        dispatch_group_enter((dispatch_group_t)self->_storageGroup);
        storageQueue = self->_storageQueue;
        uint64_t v31 = MEMORY[0x1E4F143A8];
        uint64_t v32 = 3221225472;
        BOOL v33 = __112__VCPMediaAnalyzer__analyzeOndemand_forAnalysisTypes_withExistingAnalysis_andOptions_storeAnalysis_cancelBlock___block_invoke_2;
        v34 = &unk_1E62982C0;
        CMTimeRange v37 = &v45;
        id v35 = v19;
        uint64_t v36 = self;
        dispatch_async(storageQueue, &v31);
      }
    }
  }
  uint64_t v25 = objc_msgSend(v20, "objectForKeyedSubscript:", @"ScaledSlomoTime", v31, v32, v33, v34);
  [v25 floatValue];
  if (v26 != 0.0)
  {
    int v27 = objc_msgSend(v19, "vcp_isVideoSlowmo");

    if (!v27) {
      goto LABEL_10;
    }
    uint64_t v28 = MediaAnalysisPostProcessAnalysis(v19, (void *)v46[5], 0);
    uint64_t v25 = (void *)v46[5];
    v46[5] = v28;
  }

LABEL_10:
  id v29 = (id)v46[5];

  _Block_object_dispose(&v45, 8);
  return v29;
}

void __112__VCPMediaAnalyzer__analyzeOndemand_forAnalysisTypes_withExistingAnalysis_andOptions_storeAnalysis_cancelBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C186D320]();
  id v3 = objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allAcceptableResourcesForAsset:", *(void *)(a1 + 32));
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "vcp_fullAnalysisTypesForResources:", v3);
  BOOL v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"AllowStreaming"];
  if ([v5 BOOLValue])
  {
    unint64_t v6 = +[VCPInternetReachability sharedInstance];
    if ([v6 hasWifiOrEthernetConnection] && (*(void *)(a1 + 72) & ~v4) != 0)
    {
      id v8 = [*(id *)(a1 + 32) photoLibrary];
      if (objc_msgSend(v8, "vcp_eligibleForStreaming:", 0)) {
        uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "vcp_eligibleForVideoDownload:", v3);
      }
      else {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  if (![*(id *)(a1 + 32) isVideo])
  {
    if (![*(id *)(a1 + 32) isPhoto]) {
      goto LABEL_18;
    }
    BOOL v9 = [[VCPPhotoAnalyzer alloc] initWithPHAsset:*(void *)(a1 + 32) withExistingAnalysis:*(void *)(a1 + 48) forAnalysisTypes:*(void *)(a1 + 72)];
    [(VCPPhotoAnalyzer *)v9 setAllowStreaming:v7];
    [(VCPPhotoAnalyzer *)v9 setOnDemand:1];
    uint64_t v13 = [(VCPPhotoAnalyzer *)v9 analyzeAsset:*(void *)(a1 + 56) withOptions:0];
    goto LABEL_17;
  }
  if ((v7 & 1) != 0
    || +[VCPMovieAnalyzer canAnalyzeUndegraded:*(void *)(a1 + 32) withResources:v3])
  {
    BOOL v9 = [[VCPMovieAnalyzer alloc] initWithPHAsset:*(void *)(a1 + 32) withExistingAnalysis:*(void *)(a1 + 48) forAnalysisTypes:*(void *)(a1 + 72)];
    [(VCPPhotoAnalyzer *)v9 setAllowStreaming:v7];
    [(VCPPhotoAnalyzer *)v9 setOnDemand:1];
    uint64_t v10 = [(VCPPhotoAnalyzer *)v9 analyzeAsset:*(void *)(a1 + 56) streamed:0];
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    CFDictionaryRef v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v13 = MediaAnalysisStripKeyframeResourceResultsFromAnalysis(*(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
LABEL_17:
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    goto LABEL_18;
  }
  if ((*(unsigned char *)(a1 + 73) & 8) != 0
    && objc_msgSend(v3, "vcp_hasLocalPhoto:", objc_msgSend(*(id *)(a1 + 32), "hasAdjustments")))
  {
    BOOL v9 = [[VCPPhotoAnalyzer alloc] initWithPHAsset:*(void *)(a1 + 32) withExistingAnalysis:*(void *)(a1 + 48) forAnalysisTypes:2048];
    uint64_t v13 = [(VCPPhotoAnalyzer *)v9 analyzeAsset:*(void *)(a1 + 56) withOptions:0];
    goto LABEL_17;
  }
LABEL_18:
}

void __112__VCPMediaAnalyzer__analyzeOndemand_forAnalysisTypes_withExistingAnalysis_andOptions_storeAnalysis_cancelBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v2];
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
    BOOL v5 = objc_msgSend(v3, "vcp_results");
    unint64_t v6 = [v4 dictionaryWithDictionary:v5];

    uint64_t v7 = objc_msgSend(v3, "vcp_types");
    [v6 removeObjectForKey:@"FaceQualityResults"];
    [v6 removeObjectForKey:@"ParallaxResults"];
    [v6 removeObjectForKey:@"WallpaperExportResults"];
    [v6 removeObjectForKey:@"WatchFaceResults"];
    [v6 removeObjectForKey:@"PetsResults"];
    [v6 removeObjectForKey:@"PetsFaceResults"];
    [v3 removeObjectForKey:@"metadataRanges"];
    if ([v6 count]) {
      objc_msgSend(v3, "vcp_setResults:", v6);
    }
    objc_msgSend(v3, "vcp_setTypes:", v7 & 0xFFFFFF67FFFDFFFFLL);
  }
  else
  {
    id v3 = 0;
  }

  if (objc_msgSend(v3, "vcp_types"))
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        BOOL v9 = [*(id *)(a1 + 32) localIdentifier];
        *(_DWORD *)CMTimeRange buf = 138412290;
        uint64_t v25 = v9;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_INFO, "[MediaAnalysis][%@] Storing on-demand analysis", buf, 0xCu);
      }
    }
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mediaanalysisd.photos" options:0];
    uint64_t v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1640958];
    [v10 setRemoteObjectInterface:v11];

    [v10 resume];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __112__VCPMediaAnalyzer__analyzeOndemand_forAnalysisTypes_withExistingAnalysis_andOptions_storeAnalysis_cancelBlock___block_invoke_768;
    v21[3] = &unk_1E629BB68;
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    id v22 = v12;
    uint64_t v23 = v13;
    uint64_t v14 = [v10 remoteObjectProxyWithErrorHandler:v21];
    id v15 = [*(id *)(a1 + 32) localIdentifier];
    id v16 = [*(id *)(a1 + 32) photoLibrary];
    id v17 = [v16 photoLibraryURL];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __112__VCPMediaAnalyzer__analyzeOndemand_forAnalysisTypes_withExistingAnalysis_andOptions_storeAnalysis_cancelBlock___block_invoke_769;
    v20[3] = &unk_1E6296FF8;
    v20[4] = *(void *)(a1 + 40);
    [v14 storeAnalysis:v3 forAsset:v15 fromPhotoLibraryURL:v17 withReply:v20];

    dispatch_group_wait(*(dispatch_group_t *)(*(void *)(a1 + 40) + 32), 0xFFFFFFFFFFFFFFFFLL);
    [v10 invalidate];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = [*(id *)(a1 + 32) localIdentifier];
        *(_DWORD *)CMTimeRange buf = 138412290;
        uint64_t v25 = v19;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_INFO, "[MediaAnalysis][%@] No valid on-demand analysis; skipping",
          buf,
          0xCu);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 32));
  }
}

void __112__VCPMediaAnalyzer__analyzeOndemand_forAnalysisTypes_withExistingAnalysis_andOptions_storeAnalysis_cancelBlock___block_invoke_768(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = [*(id *)(a1 + 32) localIdentifier];
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis][%@] Failed to store on-demand analysis - %@", (uint8_t *)&v6, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 32));
}

void __112__VCPMediaAnalyzer__analyzeOndemand_forAnalysisTypes_withExistingAnalysis_andOptions_storeAnalysis_cancelBlock___block_invoke_769(uint64_t a1)
{
}

- (id)requestAnalysisTypes:(unint64_t)a3 forAssetWithResourceURLs:(id)a4 withOptions:(id)a5 error:(id *)a6
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__42;
  uint64_t v14 = __Block_byref_object_dispose__42;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__VCPMediaAnalyzer_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_error___block_invoke;
  v9[3] = &unk_1E629BB90;
  v9[4] = &v10;
  v9[5] = a6;
  int v6 = +[VCPFullAnalysisURLProcessingTask taskForURLAsset:a4 withOptions:a5 analysisTypes:a3 progressHandler:0 completionHandler:v9];
  [v6 run];
  id v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __84__VCPMediaAnalyzer_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  id v7 = a3;
  **(void **)(a1 + 40) = v7;
}

- (id)analyzeOndemand:(id)a3 pairedURL:(id)a4 forAnalysisTypes:(unint64_t)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v26 = 0;
  uint64_t v11 = *MEMORY[0x1E4F1C538];
  [v9 getResourceValue:&v26 forKey:*MEMORY[0x1E4F1C538] error:0];
  id v12 = v26;
  uint64_t v13 = *MEMORY[0x1E4F44448];
  if (([v12 conformsToType:*MEMORY[0x1E4F44448]] & 1) != 0
    || (uint64_t v14 = *MEMORY[0x1E4F44520], [v12 conformsToType:*MEMORY[0x1E4F44520]]))
  {
    id v15 = +[VCPURLAsset movieAssetWithURL:v9];
    if (v15)
    {
      id v16 = +[VCPMovieAnalyzer analyzerWithVCPAsset:v15 withExistingAnalysis:0 forAnalysisTypes:a5 withOptions:0];
      id v17 = [v16 analyzeAsset:&__block_literal_global_775 streamed:0];
      if ([v16 status] == 2) {
        int v18 = 0;
      }
      else {
        int v18 = -18;
      }
LABEL_11:

LABEL_36:
LABEL_37:
      id v22 = v17;
      if (!v18) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTimeRange buf = 138412290;
        id v28 = v9;
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "[MediaAnalysis][%@]Unable to open movie", buf, 0xCu);
      }
      id v17 = 0;
      int v18 = -50;
      goto LABEL_11;
    }
LABEL_35:
    id v17 = 0;
    int v18 = -50;
    goto LABEL_36;
  }
  if ([v12 conformsToType:*MEMORY[0x1E4F44400]])
  {
    if (v10)
    {
      id v25 = 0;
      [v10 getResourceValue:&v25 forKey:v11 error:0];
      id v15 = v25;
      if (([v15 conformsToType:v13] & 1) == 0
        && ![v15 conformsToType:v14])
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v23 = VCPLogInstance();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)CMTimeRange buf = 0;
            _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer requestAnalysisTypes] call with invalid resourceURLs", buf, 2u);
          }
        }
        goto LABEL_35;
      }
      uint64_t v19 = +[VCPURLAsset livePhotoAssetWithImageURL:v9 andMovieURL:v10];

      id v15 = v19;
      if (v19)
      {
LABEL_17:
        id v20 = +[VCPPhotoAnalyzer analyzerWithVCPAsset:v15 forAnalysisTypes:a5];
        id v17 = [v20 analyzeAsset:&__block_literal_global_778 withOptions:0];
        if ([v20 status] == 2) {
          int v18 = 0;
        }
        else {
          int v18 = -18;
        }

        goto LABEL_36;
      }
    }
    else
    {
      id v15 = +[VCPURLAsset imageAssetWithURL:v9];
      if (v15) {
        goto LABEL_17;
      }
    }
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      id v17 = 0;
      int v18 = -50;
      goto LABEL_37;
    }
    id v15 = VCPLogInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTimeRange buf = 138412290;
      id v28 = v9;
      _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "[MediaAnalysis][%@]Failed to create asset", buf, 0xCu);
    }
    goto LABEL_35;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v21 = VCPLogInstance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer requestAnalysisTypes] call with invalid resourceURLs", buf, 2u);
    }
  }
  id v22 = 0;
  int v18 = -50;
LABEL_38:
  *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v18 userInfo:0];

  id v17 = 0;
LABEL_39:

  return v17;
}

uint64_t __69__VCPMediaAnalyzer_analyzeOndemand_pairedURL_forAnalysisTypes_error___block_invoke()
{
  return 0;
}

uint64_t __69__VCPMediaAnalyzer_analyzeOndemand_pairedURL_forAnalysisTypes_error___block_invoke_776()
{
  return 0;
}

- (id)_requestAnalysis:(unint64_t)a3 forAsset:(id)a4 withExistingAnalysis:(id)a5 andDatabase:(id)a6 andOptions:(id)a7 cancelBlock:(id)a8
{
  v94[5] = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v84 = a6;
  id v16 = a7;
  id v83 = a8;
  long long v85 = [v14 localIdentifier];
  id v17 = [v16 objectForKeyedSubscript:@"AllowOnDemand"];
  uint64_t v18 = [v17 BOOLValue];

  uint64_t v19 = [v16 objectForKeyedSubscript:@"SkipMetaDataOnDemand"];
  unsigned __int8 v82 = [v19 BOOLValue];

  id v20 = [v16 objectForKeyedSubscript:@"ScaledSlomoTime"];
  int v21 = [v20 BOOLValue];

  [v14 fetchPropertySetsIfNeeded];
  if (a3 && (int)MediaAnalysisLogLevel() >= 7)
  {
    id v22 = VCPLogInstance();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = MediaAnalysisTypeDescription(a3);
      *(_DWORD *)CMTimeRange buf = 138412546;
      CMTime v88 = v85;
      __int16 v89 = 2112;
      uint64_t v90 = (uint64_t)v23;
      _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Received analysis request: %@", buf, 0x16u);
    }
  }
  if (![(NSNumber *)self->_standalone BOOLValue])
  {
    id v86 = 0;
    int v34 = [v84 isAssetBlacklisted:v85 blacklistDate:&v86];
    id v24 = v86;
    if (v34)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        id v35 = VCPLogInstance();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CMTimeRange buf = 138412290;
          CMTime v88 = v85;
          _os_log_impl(&dword_1BBEDA000, v35, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis][%@] Analysis requested for blacklisted asset", buf, 0xCu);
        }
      }
      v93[0] = @"version";
      uint64_t v36 = [NSNumber numberWithInt:70];
      v94[0] = v36;
      v93[1] = @"dateModified";
      CMTimeRange v37 = objc_msgSend(v14, "vcp_modificationDate");
      v94[1] = v37;
      v94[2] = v24;
      v93[2] = @"dateAnalyzed";
      v93[3] = @"performedAnalysisTypes";
      v93[4] = @"flags";
      v94[3] = &unk_1F15ED6B0;
      v94[4] = &unk_1F15ED6C8;
      id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:5];

      goto LABEL_32;
    }
    if ((int)objc_msgSend(v15, "vcp_version") < 7)
    {

      id v15 = 0;
    }
    id v39 = MediaAnalysisPostProcessAnalysis(v14, v15, v21 ^ 1);

    if ((a3 & 0x40000) == 0 || (objc_msgSend(v39, "vcp_types") & 0x40000) == 0)
    {
      id v15 = v39;
      goto LABEL_58;
    }
    id v40 = VCPSignPostLog();
    os_signpost_id_t spid = os_signpost_id_generate(v40);

    id v41 = VCPSignPostLog();
    id v42 = v41;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v42, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPPostProcessMovieHighlights", "", buf, 2u);
    }

    v43 = [v16 objectForKeyedSubscript:@"CaptionWithHighlight"];
    if ([v43 BOOLValue])
    {
      type = objc_msgSend(v39, "vcp_results");
      unint64_t v44 = [type objectForKeyedSubscript:@"MiCaVideoCaptionResults"];
      if (![v44 count])
      {
        v77 = objc_msgSend(v39, "vcp_results");
        v75 = [v77 objectForKeyedSubscript:@"VideoSegmentCaptionResults"];
        if (![v75 count])
        {
          objc_msgSend(v39, "vcp_results");
          double v73 = v74 = v44;
          uint64_t v70 = [v73 objectForKeyedSubscript:@"VideoCaptionResults"];
          BOOL v72 = [v70 count] == 0;

          if (v72)
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v71 = VCPLogInstance();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)CMTimeRange buf = 0;
                _os_log_impl(&dword_1BBEDA000, v71, OS_LOG_TYPE_DEFAULT, "[MediaAnalyzer]Early termination - no caption available, set results to nil", buf, 2u);
              }
            }
            id v15 = 0;
            goto LABEL_53;
          }
LABEL_51:
          id v15 = [(VCPMediaAnalyzer *)self _postProcessMovieHighlights:v14 analysis:v39 withOptions:v16];

          uint64_t v45 = [v16 objectForKeyedSubscript:@"CaptionWithHighlight"];
          int v46 = [v45 BOOLValue];

          if (!v46) {
            goto LABEL_54;
          }
          [(VCPMediaAnalyzer *)self _addCaptionToHighlightResults:v15];
          id v39 = v15;
          id v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:

LABEL_54:
          uint64_t v47 = VCPSignPostLog();
          CFDictionaryRef v48 = v47;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
          {
            *(_WORD *)CMTimeRange buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v48, OS_SIGNPOST_INTERVAL_END, spid, "VCPPostProcessMovieHighlights", "", buf, 2u);
          }

LABEL_58:
          if ((a3 & 0x4000) != 0 && [v14 isPhoto])
          {
            uint64_t v49 = [(VCPMediaAnalyzer *)self _addClassificationResults:v14 analysis:v15];

            id v15 = (id)v49;
          }
          if (!v15) {
            goto LABEL_9;
          }
          id v50 = objc_msgSend(v15, "vcp_dateModified");
          double v51 = objc_msgSend(v14, "vcp_modificationDate");
          char v52 = [v50 isEqualToDate:v51];

          if (v52)
          {
            if (!a3)
            {
LABEL_80:
              id v15 = v15;
              id v33 = v15;
LABEL_32:

              goto LABEL_34;
            }
            int v53 = objc_msgSend(v15, "vcp_degraded");
            if (v18)
            {
              v54 = objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allAcceptableResourcesForAsset:", v14);
              uint64_t v55 = [v14 mediaType];
              v56 = off_1E62960F0;
              if (v55 != 1) {
                v56 = off_1E62960E8;
              }
              int v57 = [(__objc2_class *)*v56 canAnalyzeUndegraded:v14 withResources:v54];
              uint64_t v58 = MediaAnalysisStripOutdatedAnalysis(v14, v15);

              int v59 = v57 ^ 1;
              id v15 = (id)v58;
            }
            else
            {
              int v59 = v53;
            }
            if ((objc_msgSend(v15, "vcp_degraded") ^ 1 | v59))
            {
              if ((a3 & ~objc_msgSend(v15, "vcp_types")) == 0)
              {
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  v64 = VCPLogInstance();
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                  {
                    v65 = MediaAnalysisTypeDescription(objc_msgSend(v15, "vcp_types"));
                    *(_DWORD *)CMTimeRange buf = 138412546;
                    CMTime v88 = v85;
                    __int16 v89 = 2112;
                    uint64_t v90 = (uint64_t)v65;
                    _os_log_impl(&dword_1BBEDA000, v64, OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Existing analysis satisfies request (%@)", buf, 0x16u);
                  }
                }
                goto LABEL_80;
              }
              if ((objc_msgSend(v15, "vcp_degraded") | v59 ^ 1))
              {
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  v67 = VCPLogInstance();
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                  {
                    v68 = MediaAnalysisTypeDescription(objc_msgSend(v15, "vcp_types"));
                    *(_DWORD *)CMTimeRange buf = 138412546;
                    CMTime v88 = v85;
                    __int16 v89 = 2112;
                    uint64_t v90 = (uint64_t)v68;
                    _os_log_impl(&dword_1BBEDA000, v67, OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Existing analysis doesn't satisfy request (%@)", buf, 0x16u);
                  }
                }
                a3 &= ~objc_msgSend(v15, "vcp_types");
                goto LABEL_9;
              }
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                uint64_t v69 = VCPLogInstance();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)CMTimeRange buf = 138412290;
                  CMTime v88 = v85;
                  _os_log_impl(&dword_1BBEDA000, v69, OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Existing analysis doesn't match asset state", buf, 0xCu);
                }
              }
            }
            else if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v66 = VCPLogInstance();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)CMTimeRange buf = 138412290;
                CMTime v88 = v85;
                _os_log_impl(&dword_1BBEDA000, v66, OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Existing analysis based on degraded asset", buf, 0xCu);
              }
            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v60 = VCPLogInstance();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            {
              v78 = objc_msgSend(v15, "vcp_dateModified");
              id spida = [v78 description];
              uint64_t v76 = [spida UTF8String];
              int v61 = objc_msgSend(v14, "vcp_modificationDate");
              id v62 = [v61 description];
              uint64_t v63 = [v62 UTF8String];
              *(_DWORD *)CMTimeRange buf = 138412802;
              CMTime v88 = v85;
              __int16 v89 = 2080;
              uint64_t v90 = v76;
              __int16 v91 = 2080;
              uint64_t v92 = v63;
              _os_log_impl(&dword_1BBEDA000, v60, OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Existing analysis based on old modification - (%s vs %s)", buf, 0x20u);
            }
          }

          goto LABEL_8;
        }
      }
    }

    goto LABEL_51;
  }
  id v24 = v15;
LABEL_8:
  id v15 = 0;
LABEL_9:

  if (v18) {
    unint64_t v25 = a3;
  }
  else {
    unint64_t v25 = 0;
  }
  if (((v18 | v82) & 1) == 0) {
    unint64_t v25 = [(VCPMediaAnalyzer *)self _metaAnalysisTypesForAsset:v14] & a3;
  }
  if (v25)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      id v26 = VCPLogInstance();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = MediaAnalysisTypeDescription(v25);
        *(_DWORD *)CMTimeRange buf = 138412546;
        CMTime v88 = v85;
        __int16 v89 = 2112;
        uint64_t v90 = (uint64_t)v27;
        _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis][%@] Generating analysis on-demand: %@", buf, 0x16u);
      }
    }
    id v28 = [(VCPMediaAnalyzer *)self _analyzeOndemand:v14 forAnalysisTypes:v25 withExistingAnalysis:v15 andOptions:v16 storeAnalysis:v18 cancelBlock:v83];
    if ((v25 & 0x40000) != 0)
    {
      uint64_t v29 = [(VCPMediaAnalyzer *)self _postProcessMovieHighlights:v14 analysis:v28 withOptions:v16];

      id v28 = (void *)v29;
    }
    float v30 = MediaAnalysisMergeAnalysis(v15, v28, v18);
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v31 = VCPLogInstance();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = MediaAnalysisTypeDescription(objc_msgSend(v30, "vcp_types"));
        *(_DWORD *)CMTimeRange buf = 138412546;
        CMTime v88 = v85;
        __int16 v89 = 2112;
        uint64_t v90 = (uint64_t)v32;
        _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Analysis served: (%@)", buf, 0x16u);
      }
    }
    id v33 = v30;
  }
  else
  {
    id v15 = v15;
    id v33 = v15;
  }
LABEL_34:

  return v33;
}

- (int)requestAnalysisForAsset:(id)a3 analysisTypes:(unint64_t)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = [(id)objc_opt_class() sharedMediaAnalyzer];

  if (v11 == self)
  {
    uint64_t v13 = [v9 photoLibrary];
    id v14 = [(VCPMediaAnalyzer *)self _databaseForPhotoLibrary:v13];

    if (v14)
    {
      id v15 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __92__VCPMediaAnalyzer_requestAnalysisForAsset_analysisTypes_progressHandler_completionHandler___block_invoke;
      block[3] = &unk_1E629BBB8;
      id v20 = v14;
      id v21 = v9;
      id v22 = self;
      unint64_t v24 = a4;
      id v23 = v10;
      dispatch_async(v15, block);
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = [v9 localIdentifier];
          *(_DWORD *)CMTimeRange buf = 138412290;
          id v26 = v17;
          _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to obtain database for Photo Library %@", buf, 0xCu);
        }
      }
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer requestAnalysisForAsset] call from invalid instance", buf, 2u);
      }
    }
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }

  return -1;
}

void __92__VCPMediaAnalyzer_requestAnalysisForAsset_analysisTypes_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) localIdentifier];
  uint64_t v4 = [v2 queryAnalysisForAsset:v3];

  uint64_t v6 = *(void *)(a1 + 40);
  BOOL v5 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 32);
  id v14 = @"AllowOnDemand";
  v15[0] = MEMORY[0x1E4F1CC38];
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v10 = [v5 _requestAnalysis:v7 forAsset:v6 withExistingAnalysis:v4 andDatabase:v8 andOptions:v9 cancelBlock:&__block_literal_global_786];

  uint64_t v11 = *(void *)(a1 + 56);
  char v12 = [*(id *)(*(void *)(a1 + 48) + 56) BOOLValue];
  uint64_t v13 = v10;
  if ((v12 & 1) == 0)
  {
    uint64_t v13 = MediaAnalysisStripInternalResultsFromAnalysis(v10);
  }
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);
  if ((v12 & 1) == 0) {
}
  }

uint64_t __92__VCPMediaAnalyzer_requestAnalysisForAsset_analysisTypes_progressHandler_completionHandler___block_invoke_2()
{
  return 0;
}

- (BOOL)cancelAnalysisWithRequestID:(int)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  cancelQueue = self->_cancelQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__VCPMediaAnalyzer_cancelAnalysisWithRequestID___block_invoke;
  block[3] = &unk_1E629BBE0;
  int v7 = a3;
  void block[4] = self;
  void block[5] = &v8;
  dispatch_sync(cancelQueue, block);
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __48__VCPMediaAnalyzer_cancelAnalysisWithRequestID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 112);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  char v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    [v4 cancel];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      BOOL v5 = VCPLogInstance();
      os_log_type_t v6 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int v7 = *(_DWORD *)(a1 + 48);
        int v10 = 67109120;
        int v11 = v7;
        uint64_t v8 = "[MediaAnalysis] Cancelling request %d";
LABEL_8:
        _os_log_impl(&dword_1BBEDA000, v5, v6, v8, (uint8_t *)&v10, 8u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    BOOL v5 = VCPLogInstance();
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *(_DWORD *)(a1 + 48);
      int v10 = 67109120;
      int v11 = v9;
      uint64_t v8 = "[MediaAnalysis] Failed to find request %d; cannot cancel";
      goto LABEL_8;
    }
LABEL_9:
  }
}

- (void)assetsFromPhotoLibrary:(id)a3 analyzedSinceDate:(id)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void *))a5;
  int v11 = [(id)objc_opt_class() sharedMediaAnalyzer];

  if (v11 == self)
  {
    if (![(NSNumber *)self->_standalone BOOLValue])
    {
      uint64_t v13 = [(VCPMediaAnalyzer *)self _databaseForPhotoLibrary:v8];
      id v14 = v13;
      if (v13)
      {
        id v15 = [v13 queryAssetsAnalyzedSince:v9];
        if (v15)
        {
          id v16 = objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_fetchOptionsForLibrary:forTaskID:", v8, 1);
          id v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
          unint64_t v24 = v17;
          uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
          [v16 setSortDescriptors:v18];

          uint64_t v19 = [MEMORY[0x1E4F38EC0] fetchAssetsWithLocalIdentifiers:v15 options:v16];
          id v20 = [v19 fetchedObjects];
          v10[2](v10, v20);

          goto LABEL_8;
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v21 = VCPLogInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v22 = [v8 photoLibraryURL];
          id v23 = [v22 path];
          *(_DWORD *)CMTimeRange buf = 138412290;
          id v26 = v23;
          _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to obtain database for Photo Library (%@)", buf, 0xCu);
        }
      }
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer assetsAnalyzedSinceDate] call from invalid instance", buf, 2u);
    }
  }
  v10[2](v10, 0);
LABEL_8:
}

- (void)assetsAnalyzedSinceDate:(id)a3 completionHandler:(id)a4
{
}

- (void)_checkDuplicate:(id)a3 withAsset:(id)a4 duplicate:(int64_t *)a5
{
  id v13 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  id v9 = objc_msgSend(v13, "vcp_fingerprint:", v8);
  uint64_t v10 = objc_msgSend(v7, "vcp_fingerprint:", v8);
  int v11 = (void *)v10;
  int64_t v12 = -1;
  if (v9 && v10) {
    int64_t v12 = [v9 isEqualToFingerprint:v10];
  }
  *a5 = v12;
}

- (void)_getSceneDescriptors:(id)a3 asDescriptorClass:(Class)a4 withSceneRange:(id *)a5 andAnalysisResults:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v9 = a6;
  CMTime v47 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  uint64_t v10 = (objc_class *)objc_opt_class();
  int v11 = MediaAnalysisResultSceneprintAttributeKey;
  Class v29 = a4;
  if (v10 != a4) {
    int v11 = MediaAnalysisResultFeatureVectorAttributeKey;
  }
  uint64_t v31 = *v11;
  unint64_t v12 = 0;
  *(void *)&long long v13 = 138413058;
  long long v28 = v13;
  while (objc_msgSend(v9, "count", v28) > v12)
  {
    if (v12 == [v9 count] - 1)
    {
      long long v14 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
      *(_OWORD *)&range.start.epoch = v14;
      *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
      CMTimeRangeGetEnd(&v41.start, &range);
      CMTime v46 = v41.start;
    }
    else
    {
      id v15 = [v9 objectAtIndexedSubscript:v12 + 1];
      CFDictionaryRef v16 = [v15 objectForKeyedSubscript:@"start"];
      CMTimeMakeFromDictionary(&v41.start, v16);
      CMTime v46 = v41.start;
    }
    CMTime time1 = v47;
    long long v17 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&v42.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&v42.start.epoch = v17;
    *(_OWORD *)&v42.duration.timescale = *(_OWORD *)&a5->var1.var1;
    CMTimeRangeGetEnd(&time2, &v42);
    if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0) {
      break;
    }
    memset(&v41, 0, sizeof(v41));
    CMTime start = v47;
    CMTime lhs = v46;
    CMTime rhs = v47;
    CMTimeSubtract(&duration, &lhs, &rhs);
    CMTimeRangeMake(&v41, &start, &duration);
    CMTimeRange v35 = v41;
    memset(&v36, 0, sizeof(v36));
    long long v18 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&otherRange.start.epoch = v18;
    *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a5->var1.var1;
    CMTimeRangeGetIntersection(&v36, &v35, &otherRange);
    if ((v36.start.flags & 1) != 0
      && (v36.duration.flags & 1) != 0
      && !v36.duration.epoch
      && (v36.duration.value & 0x8000000000000000) == 0)
    {
      CMTime v33 = v36.duration;
      CMTime v32 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      if (CMTimeCompare(&v33, &v32))
      {
        uint64_t v19 = [v9 objectAtIndexedSubscript:v12];
        id v20 = [v19 objectForKeyedSubscript:@"attributes"];
        id v21 = [v20 objectForKeyedSubscript:v31];

        if (v21)
        {
          id v22 = [(objc_class *)v29 descriptorWithData:v21];
          if (!v22 && (int)MediaAnalysisLogLevel() >= 3)
          {
            id v23 = VCPLogInstance();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              uint64_t v24 = [v21 length];
              unint64_t v25 = [v21 description];
              LODWORD(buf.value) = v28;
              *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v29;
              LOWORD(buf.flags) = 2112;
              *(void *)((char *)&buf.flags + 2) = v31;
              HIWORD(buf.epoch) = 2048;
              uint64_t v51 = v24;
              __int16 v52 = 2112;
              int v53 = v25;
              _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "Cannot load %@ for %@, NSData length: %lu, content: %@", (uint8_t *)&buf, 0x2Au);
            }
          }
          v48[0] = @"duration";
          CMTime buf = v36.duration;
          CFDictionaryRef v26 = CMTimeCopyAsDictionary(&buf, 0);
          v48[1] = @"attributes";
          v49[0] = v26;
          v49[1] = v22;
          uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
          [v30 addObject:v27];
        }
      }
    }
    CMTime v47 = v46;
    ++v12;
  }
}

- (id)_queryDistanceDescriptor:(Class)a3 ofAsset:(id)a4 withExistingAnalysis:(id)a5 andDatabase:(id)a6 timeRange:(id *)a7 lastFeature:(BOOL)a8 isDegraded:(BOOL *)a9
{
  BOOL v9 = a8;
  v70[2] = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v60 = a6;
  if (!v14)
  {
    id v59 = 0;
    goto LABEL_66;
  }
  id v59 = [MEMORY[0x1E4F1CA48] array];
  if ((Class)objc_opt_class() == a3
    && [(objc_class *)a3 usePHAssetData]
    && [v14 mediaType] == 1)
  {
    [v14 fetchPropertySetsIfNeeded];
    if ((Class)objc_opt_class() == a3)
    {
      long long v17 = [v14 sceneprintProperties];
      id v16 = [v17 sceneprint];

      if (!v16)
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      id v16 = [v14 distanceIdentity];
      if (!v16) {
        goto LABEL_18;
      }
    }
    long long v18 = [(objc_class *)a3 descriptorWithData:v16];
    if (v18)
    {
      v69[0] = @"duration";
      CMTimeMake(&v65, 1, 1);
      time.CMTime start = v65;
      CFDictionaryRef v19 = CMTimeCopyAsDictionary(&time.start, 0);
      v69[1] = @"attributes";
      v70[0] = v19;
      v70[1] = v18;
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:2];
      [v59 addObject:v20];

      if (a9) {
        *a9 = 0;
      }

      goto LABEL_65;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = [v16 length];
        [v16 description];
        LODWORD(time.start.value) = 138412802;
        *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)a3;
        LOWORD(time.start.flags) = 2048;
        *(void *)((char *)&time.start.flags + 2) = v22;
        time.duration.value = HIWORD(time.start.epoch) = 2112;
        value = (void *)time.duration.value;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "Cannot load %@ from PHAsset, NSData length: %lu, content: %@", (uint8_t *)&time, 0x20u);
      }
    }
    goto LABEL_18;
  }
LABEL_19:
  id v16 = v15;
  if (!v16)
  {
    if ([(NSNumber *)self->_standalone BOOLValue])
    {
      id v16 = 0;
      goto LABEL_60;
    }
    if ((Class)objc_opt_class() == a3) {
      uint64_t v32 = 46;
    }
    else {
      uint64_t v32 = 12;
    }
    CMTime v33 = (void *)MEMORY[0x1E4F1CA80];
    int v34 = [NSNumber numberWithUnsignedInteger:v32];
    CMTimeRange v35 = [v33 setWithObject:v34];

    if ([v14 mediaType] == 2) {
      [v35 addObject:&unk_1F15ED6E0];
    }
    CMTimeRange v36 = [v14 localIdentifier];
    id v16 = [v60 queryAnalysisForAsset:v36 withTypes:v35];

    if (!v16) {
      goto LABEL_60;
    }
  }
  if ((int)objc_msgSend(v16, "vcp_version") >= 7)
  {
    uint64_t v24 = objc_msgSend(v14, "vcp_modificationDate");
    unint64_t v25 = objc_msgSend(v16, "vcp_dateModified");
    int v26 = [v24 isEqualToDate:v25];

    if (v26)
    {
      uint64_t v27 = (objc_class *)objc_opt_class();
      long long v28 = MediaAnalysisSceneprintResultsKey;
      if (v27 != a3) {
        long long v28 = MediaAnalysisFeatureVectorResultsKey;
      }
      uint64_t v55 = *v28;
      Class v29 = [v16 objectForKeyedSubscript:@"metadataRanges"];
      id v30 = [v29 objectForKeyedSubscript:v55];

      if ([v14 mediaType] == 2)
      {
        uint64_t v31 = [v16 objectForKeyedSubscript:@"metadataRanges"];
        type = [v31 objectForKeyedSubscript:@"SceneResults"];

        if (!v30) {
          goto LABEL_59;
        }
      }
      else
      {
        type = 0;
        if (!v30) {
          goto LABEL_59;
        }
      }
      if ([v30 count])
      {
        if (type)
        {
          if (v9) {
            [type lastObject];
          }
          else {
          CFDictionaryRef v37 = [type firstObject];
          }
          memset(&time, 0, sizeof(time));
          v38 = a7;
          if ((a7->var0.var2 & 1) == 0
            || (a7->var1.var2 & 1) == 0
            || a7->var1.var3
            || a7->var1.var0 < 0
            || (CMTime time1 = (CMTime)a7->var1,
                CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
                int32_t v51 = CMTimeCompare(&time1, &time2),
                v38 = a7,
                v51))
          {
            long long v39 = *(_OWORD *)&v38->var0.var3;
            *(_OWORD *)&time.start.value = *(_OWORD *)&v38->var0.var0;
            *(_OWORD *)&time.start.epoch = v39;
            *(_OWORD *)&time.duration.timescale = *(_OWORD *)&v38->var1.var1;
          }
          else
          {
            CMTimeRangeMakeFromDictionary(&time, v37);
          }
          CMTimeRange v62 = time;
          [(VCPMediaAnalyzer *)self _getSceneDescriptors:v59 asDescriptorClass:a3 withSceneRange:&v62 andAnalysisResults:v30];
          goto LABEL_58;
        }
        if (v9) {
          [v30 lastObject];
        }
        else {
        CFDictionaryRef v37 = [v30 firstObject];
        }
        id v40 = (objc_class *)objc_opt_class();
        CMTimeRange v41 = MediaAnalysisResultSceneprintAttributeKey;
        if (v40 != a3) {
          CMTimeRange v41 = MediaAnalysisResultFeatureVectorAttributeKey;
        }
        uint64_t v58 = *v41;
        CMTimeRange v42 = [(__CFDictionary *)v37 objectForKeyedSubscript:@"attributes"];
        v43 = [v42 objectForKeyedSubscript:v58];

        if (!v43)
        {
LABEL_57:

          type = 0;
LABEL_58:

          goto LABEL_59;
        }
        uint64_t v54 = [(objc_class *)a3 descriptorWithData:v43];
        if (v54)
        {
          v66[0] = @"duration";
          CMTimeMake(&v61, 1, 1);
          uint64_t v44 = CMTimeToNSDictionary(&v61);
          v66[1] = @"attributes";
          uint64_t v45 = v44;
          v67[0] = v44;
          v67[1] = v54;
          CMTime v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];
          [v59 addObject:v46];

          CMTime v47 = v45;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_56;
          }
          CMTime v47 = VCPLogInstance();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            int v53 = v47;
            CMTimeValue v52 = [v43 length];
            id v50 = [v43 description];
            LODWORD(time.start.value) = 138413058;
            *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)a3;
            LOWORD(time.start.flags) = 2112;
            *(void *)((char *)&time.start.flags + 2) = v55;
            HIWORD(time.start.epoch) = 2048;
            time.duration.value = v52;
            LOWORD(time.duration.timescale) = 2112;
            *(void *)((char *)&time.duration.timescale + 2) = v50;
            _os_log_impl(&dword_1BBEDA000, v53, OS_LOG_TYPE_ERROR, "Cannot load %@ for %@, NSData length: %lu, content: %@", (uint8_t *)&time, 0x2Au);

            CMTime v47 = v53;
          }
        }

LABEL_56:
        goto LABEL_57;
      }
LABEL_59:
    }
  }
LABEL_60:
  if (a9)
  {
    if ([v14 isVideo]) {
      BOOL v48 = (~(unsigned __int16)objc_msgSend(v16, "vcp_types") & 0x880) != 0;
    }
    else {
      BOOL v48 = 0;
    }
    *a9 = v48;
  }
LABEL_65:

LABEL_66:
  return v59;
}

+ (Class)_getDistanceDescriptorClass
{
  {
    +[VCPMediaAnalyzer _getDistanceDescriptorClass]::descriptorClass = objc_opt_class();
  }
  id v2 = (void *)+[VCPMediaAnalyzer _getDistanceDescriptorClass]::descriptorClass;
  return (Class)v2;
}

+ (BOOL)includeTorsoOnlyForOneUP
{
  return 1;
}

- (void)distanceFromAsset:(id)a3 toAsset:(id)a4 duplicate:(int64_t *)a5 distance:(float *)a6
{
  id v10 = a3;
  id v11 = a4;
  {
    -[VCPMediaAnalyzer distanceFromAsset:toAsset:duplicate:distance:]::kDescriptorClass = +[VCPMediaAnalyzer _getDistanceDescriptorClass](VCPMediaAnalyzer, "_getDistanceDescriptorClass");
  }
  unint64_t v12 = [(id)objc_opt_class() sharedMediaAnalyzer];

  if (v12 == self)
  {
    id v14 = [v10 photoLibrary];
    long long v13 = [(VCPMediaAnalyzer *)self _databaseForPhotoLibrary:v14];

    if ([(NSNumber *)self->_standalone BOOLValue]) {
      goto LABEL_7;
    }
    id v15 = [v10 localIdentifier];
    if ([v13 isAssetBlacklisted:v15 blacklistDate:0])
    {
    }
    else
    {
      uint64_t v22 = [v11 localIdentifier];
      int v23 = [v13 isAssetBlacklisted:v22 blacklistDate:0];

      if (!v23)
      {
LABEL_7:
        [(VCPMediaAnalyzer *)self _checkDuplicate:v10 withAsset:v11 duplicate:a5];
        if (*a5 == 1)
        {
          *a6 = 0.0;
LABEL_22:

          goto LABEL_23;
        }
        id v16 = objc_alloc_init(VCPInterAssetAnalyzer);
        if (v16)
        {
          long long v17 = (_OWORD *)MEMORY[0x1E4F1FA30];
          long long v18 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
          v25[0] = *MEMORY[0x1E4F1FA30];
          v25[1] = v18;
          v25[2] = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
          CFDictionaryRef v19 = -[VCPMediaAnalyzer _queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:](self, "_queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:", -[VCPMediaAnalyzer distanceFromAsset:toAsset:duplicate:distance:]::kDescriptorClass, v10, 0, v13, v25, 1, 0);
          long long v20 = v17[1];
          v24[0] = *v17;
          v24[1] = v20;
          v24[2] = v17[2];
          id v21 = -[VCPMediaAnalyzer _queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:](self, "_queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:", -[VCPMediaAnalyzer distanceFromAsset:toAsset:duplicate:distance:]::kDescriptorClass, v11, 0, v13, v24, 0, 0);
          if ([v19 count] && objc_msgSend(v21, "count"))
          {
            [(VCPInterAssetAnalyzer *)v16 computeDistance:a6 fromArray:v19 toArray:v21];
LABEL_21:

            goto LABEL_22;
          }
          if (!-[VCPInterAssetAnalyzer computeDistance:withDescriptorClass:fromAsset:toAsset:](v16, "computeDistance:withDescriptorClass:fromAsset:toAsset:", a6, -[VCPMediaAnalyzer distanceFromAsset:toAsset:duplicate:distance:]::kDescriptorClass, v10, v11))goto LABEL_21; {
        }
          }
        else
        {
          CFDictionaryRef v19 = 0;
          id v21 = 0;
        }
        *a6 = -1.0;
        goto LABEL_21;
      }
    }
    *a5 = -1;
    *a6 = -1.0;
    goto LABEL_22;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    long long v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CMTime buf = 0;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer distanceFromAsset] call from invalid instance", buf, 2u);
    }
    goto LABEL_22;
  }
LABEL_23:
}

- (void)distanceFromAsset:(id)a3 timeRange:(id *)a4 toAsset:(id)a5 timeRange:(id *)a6 duplicate:(int64_t *)a7 distance:(float *)a8
{
  id v13 = a3;
  id v14 = a5;
  {
    -[VCPMediaAnalyzer distanceFromAsset:timeRange:toAsset:timeRange:duplicate:distance:]::kDescriptorClass = +[VCPMediaAnalyzer _getDistanceDescriptorClass](VCPMediaAnalyzer, "_getDistanceDescriptorClass");
  }
  id v15 = [(id)objc_opt_class() sharedMediaAnalyzer];

  if (v15 == self)
  {
    long long v17 = [v13 photoLibrary];
    id v16 = [(VCPMediaAnalyzer *)self _databaseForPhotoLibrary:v17];

    if ([(NSNumber *)self->_standalone BOOLValue]) {
      goto LABEL_7;
    }
    id v21 = [v13 localIdentifier];
    if ([v16 isAssetBlacklisted:v21 blacklistDate:0])
    {
    }
    else
    {
      uint64_t v22 = [v14 localIdentifier];
      int v23 = [v16 isAssetBlacklisted:v22 blacklistDate:0];

      if (!v23)
      {
LABEL_7:
        [(VCPMediaAnalyzer *)self _checkDuplicate:v13 withAsset:v14 duplicate:a7];
        if (*a7)
        {
          if ([v13 mediaType] == 2)
          {
            long long v18 = *(_OWORD *)&a4->var0.var3;
            *(_OWORD *)&range1.start.value = *(_OWORD *)&a4->var0.var0;
            *(_OWORD *)&range1.start.epoch = v18;
            *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a4->var1.var1;
            long long v19 = *(_OWORD *)&a6->var0.var3;
            *(_OWORD *)&range2.start.value = *(_OWORD *)&a6->var0.var0;
            *(_OWORD *)&range2.start.epoch = v19;
            *(_OWORD *)&range2.duration.timescale = *(_OWORD *)&a6->var1.var1;
            int v20 = CMTimeRangeEqual(&range1, &range2);
            *a7 = v20 != 0;
            if (v20)
            {
LABEL_10:
              *a8 = 0.0;
LABEL_25:

              goto LABEL_26;
            }
          }
          else if (*a7 == 1)
          {
            goto LABEL_10;
          }
        }
        uint64_t v24 = objc_alloc_init(VCPInterAssetAnalyzer);
        if (v24)
        {
          long long v25 = *(_OWORD *)&a4->var0.var3;
          v31[0] = *(_OWORD *)&a4->var0.var0;
          v31[1] = v25;
          v31[2] = *(_OWORD *)&a4->var1.var1;
          int v26 = -[VCPMediaAnalyzer _queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:](self, "_queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:", -[VCPMediaAnalyzer distanceFromAsset:timeRange:toAsset:timeRange:duplicate:distance:]::kDescriptorClass, v13, 0, v16, v31, 1, 0);
          long long v27 = *(_OWORD *)&a6->var0.var3;
          v30[0] = *(_OWORD *)&a6->var0.var0;
          v30[1] = v27;
          v30[2] = *(_OWORD *)&a6->var1.var1;
          long long v28 = -[VCPMediaAnalyzer _queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:](self, "_queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:", -[VCPMediaAnalyzer distanceFromAsset:timeRange:toAsset:timeRange:duplicate:distance:]::kDescriptorClass, v14, 0, v16, v30, 0, 0);
          if ([v26 count] && objc_msgSend(v28, "count"))
          {
            [(VCPInterAssetAnalyzer *)v24 computeDistance:a8 fromArray:v26 toArray:v28];
LABEL_24:

            goto LABEL_25;
          }
          if (!-[VCPInterAssetAnalyzer computeDistance:withDescriptorClass:fromAsset:toAsset:](v24, "computeDistance:withDescriptorClass:fromAsset:toAsset:", a8, -[VCPMediaAnalyzer distanceFromAsset:timeRange:toAsset:timeRange:duplicate:distance:]::kDescriptorClass, v13, v14))goto LABEL_24; {
        }
          }
        else
        {
          int v26 = 0;
          long long v28 = 0;
        }
        *a8 = -1.0;
        goto LABEL_24;
      }
    }
    *a7 = -1;
    *a8 = -1.0;
    goto LABEL_25;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CMTime buf = 0;
      _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer distanceFromAsset] call from invalid instance", buf, 2u);
    }
    goto LABEL_25;
  }
LABEL_26:
}

- (int)requestAnalysisTypes:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 cancelBlock:(id)a7 analyses:(id)a8
{
  uint64_t v184 = *MEMORY[0x1E4F143B8];
  id v143 = a4;
  id v12 = a5;
  v138 = (void (**)(id, unint64_t, double))a6;
  v133 = (uint64_t (**)(void))a7;
  id v132 = a8;
  v134 = v12;
  id v13 = [v12 objectForKeyedSubscript:@"AllowOnDemand"];
  int v127 = [v13 BOOLValue];

  v136 = [v12 objectForKeyedSubscript:@"HighlightContexts"];
  v128 = [v12 objectForKeyedSubscript:@"HighlightPreferredRange"];
  if (v136 && [v136 count])
  {
    unint64_t v14 = a3 & 0xFFFFFFFBFEBDF363 | 0x40142089CLL;
    goto LABEL_6;
  }
  id v15 = [v12 objectForKeyedSubscript:@"HighlightPreferredRange"];

  if (v15)
  {
    unint64_t v14 = a3 & 0xFFFFFFFBFEBDF363 | 0x40142089CLL;
    if (v136)
    {
LABEL_6:
      if ([v136 count]) {
        unint64_t v14 = a3 & 0xFFFEF7FBFEBDF363 | 0x108040142089CLL;
      }
    }
  }
  else
  {
    unint64_t v14 = a3 & 0xFFFFFFFFFFFFFBFFLL;
  }
  id v16 = [v12 objectForKeyedSubscript:@"CaptionWithHighlight"];
  int v17 = [v16 BOOLValue];

  if (v17)
  {
    if (+[VCPVideoCaptionAnalyzer mode] == 1)
    {
      v14 |= 0x2200000000000uLL;
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      long long v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CMTime buf = 0;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_DEFAULT, "Caption disabled, NO caption will be returned with Highlight!", buf, 2u);
      }
    }
  }
  long long v19 = [v136 allKeys];
  int v20 = [v19 containsObject:@"SearchQueryString"];

  if (v20)
  {
    uint64_t v21 = [(VCPMediaAnalyzer *)self prepareContextsQueryEmbedding:v136];

    uint64_t v22 = (void *)[v12 mutableCopy];
    [v22 setObject:v21 forKeyedSubscript:@"HighlightContexts"];
    id v23 = v22;

    v136 = (void *)v21;
    v134 = v23;
  }
  if ((a3 & 0x400) != 0)
  {
    uint64_t v24 = objc_alloc_init(VCPInterAssetAnalyzer);
    if (v14) {
      v14 |= 0x800uLL;
    }
    else {
      unint64_t v14 = 0;
    }
    v125 = v24;
    if (!v24)
    {
      v149 = 0;
      v150 = 0;
      v140 = 0;
      v141 = 0;
      id v151 = 0;
      id v32 = 0;
      v142 = 0;
      int v122 = -18;
      goto LABEL_190;
    }
  }
  else
  {
    v125 = 0;
  }
  v129 = 0;
  if (v14 && v14 != 0x7FFFFFFFFFBFFLL)
  {
    v129 = MediaAnalysisResultsTypesForAnalysisTypes(v14);
  }
  if (v127 && !+[VCPDeviceInformation canRenderVariation]) {
    v14 &= ~0x100000uLL;
  }
  long long v25 = [v143 objectAtIndexedSubscript:0];
  int v26 = [v25 photoLibrary];
  unint64_t v126 = v14;
  v130 = [(VCPMediaAnalyzer *)self _databaseForPhotoLibrary:v26];

  if (!v130 && (int)MediaAnalysisLogLevel() >= 4)
  {
    long long v27 = VCPLogInstance();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CMTime buf = 0;
      _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Failed to obtain database for assets", buf, 2u);
    }
  }
  v144 = +[VCPDatabaseBatchIterator iteratorForAssets:v143 withDatabaseReader:v130 resultTypes:v129 batchSize:100];
  if (!v144)
  {
    v149 = 0;
    v150 = 0;
    v140 = 0;
    v141 = 0;
    id v151 = 0;
    id v32 = 0;
    v142 = 0;
    goto LABEL_188;
  }
  if (v138) {
    v138[2](v138, a3, 0.0);
  }
  unint64_t v28 = 0;
  BOOL v29 = 0;
  id v30 = 0;
  v140 = 0;
  v141 = 0;
  uint64_t v31 = 0;
  id v151 = 0;
  id v32 = 0;
  v142 = 0;
  char v33 = v127;
  if (!v136) {
    char v33 = 1;
  }
  char v124 = v33;
  while (1)
  {
    v149 = v30;
    v150 = v31;
    if (![v144 next] || objc_msgSend(v143, "count") <= v28) {
      break;
    }
    context = (void *)MEMORY[0x1C186D320]();
    v146 = [v144 asset];
    v148 = [MEMORY[0x1E4F1CA60] dictionary];
    unsigned __int8 v169 = 0;

    unint64_t v145 = v28 + 1;
    if (!v148)
    {
      v38 = 0;
      id v147 = 0;
      id v39 = 0;
      id v151 = 0;
      id v32 = 0;
      goto LABEL_112;
    }
    if (([v146 isMemberOfClass:objc_opt_class()] & 1) == 0) {
      goto LABEL_86;
    }
    int v34 = objc_msgSend(v146, "vcp_modificationDate");
    BOOL v35 = v34 == 0;

    if (v35) {
      goto LABEL_86;
    }
    if (v133 && (v133[2]() & 1) != 0)
    {
      char v36 = 0;
      CFDictionaryRef v37 = 0;
    }
    else
    {
      unint64_t v40 = v126;
      if (v126)
      {
        CMTimeRange v41 = (void *)[v134 mutableCopy];
        [v41 removeObjectForKey:@"HighlightPreferredRange"];
        if ([v128 count] > v28)
        {
          CMTimeRange v42 = [v128 objectAtIndexedSubscript:v28];
          [v41 setObject:v42 forKeyedSubscript:@"HighlightPreferredRange"];

          unint64_t v40 = v126;
        }
        if ((v124 & 1) == 0 && [v136 count]) {
          [v41 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"SkipMetaDataOnDemand"];
        }
        v43 = [v144 analysis];
        uint64_t v44 = [(VCPMediaAnalyzer *)self _requestAnalysis:v40 forAsset:v146 withExistingAnalysis:v43 andDatabase:v130 andOptions:v41 cancelBlock:v133];

        if (v44)
        {
          [v148 addEntriesFromDictionary:v44];
          if ((objc_msgSend(v148, "vcp_flags") & 0x80000000) != 0)
          {

            goto LABEL_86;
          }
          CFDictionaryRef v37 = [v148 objectForKeyedSubscript:@"metadataRanges"];
        }
        else
        {
          CFDictionaryRef v37 = 0;
        }
      }
      else
      {
        CFDictionaryRef v37 = 0;
      }
      if (!v133 || (v133[2]() & 1) == 0)
      {
        if ((a3 & 0x400) == 0)
        {
          int v45 = 0;
          id v147 = 0;
          id v39 = 0;
          id v151 = 0;
          id v32 = 0;
          goto LABEL_89;
        }
        if (!v37)
        {
          uint64_t v46 = [MEMORY[0x1E4F1CA60] dictionary];
          if (v46)
          {
            CFDictionaryRef v37 = (void *)v46;
            objc_msgSend(v148, "setObject:forKey:");
            goto LABEL_72;
          }
LABEL_86:
          CFDictionaryRef v37 = 0;
          id v147 = 0;
LABEL_87:
          id v39 = 0;
          id v151 = 0;
          id v32 = 0;
LABEL_88:
          int v45 = -18;
LABEL_89:
          int v57 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v148];
          v38 = v37;
          if (a3 == 0x10000)
          {
            id v58 = 0;
          }
          else
          {
            id v58 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v37];
          }
          [v57 removeObjectForKey:@"metadataRanges"];
          id v59 = [v57 objectForKey:@"quality"];
          BOOL v60 = v59 == 0;

          if (!v60) {
            objc_msgSend(v57, "vcp_addTypes:", 0x10000);
          }
          if (v58)
          {
            if ([v58 count])
            {
              unint64_t v61 = -[VCPMediaAnalyzer _typesToRemove:requested:](self, "_typesToRemove:requested:", objc_msgSend(v57, "vcp_types"), a3);
              long long v154 = 0u;
              long long v155 = 0u;
              long long v152 = 0u;
              long long v153 = 0u;
              CMTimeRange v62 = MediaAnalysisResultsKeysForAnalysisTypes(v61 & 0xFFFFFFFFFFFFF3FFLL);
              int v63 = v45;
              uint64_t v64 = [v62 countByEnumeratingWithState:&v152 objects:v170 count:16];
              if (v64)
              {
                uint64_t v65 = *(void *)v153;
                do
                {
                  for (uint64_t i = 0; i != v64; ++i)
                  {
                    if (*(void *)v153 != v65) {
                      objc_enumerationMutation(v62);
                    }
                    [v58 removeObjectForKey:*(void *)(*((void *)&v152 + 1) + 8 * i)];
                  }
                  uint64_t v64 = [v62 countByEnumeratingWithState:&v152 objects:v170 count:16];
                }
                while (v64);
              }

              int v45 = v63;
              if ((a3 & 0x400) == 0) {
                [v58 removeObjectForKey:@"DistanceResults"];
              }
            }
            if ([v58 count]) {
              [v57 setObject:v58 forKey:@"metadataRanges"];
            }
          }
          BOOL v67 = [(NSNumber *)self->_noResultStrip BOOLValue];
          v68 = v57;
          if (!v67)
          {
            v131 = MediaAnalysisStripInternalResultsFromAnalysis(v57);
            v68 = v131;
          }
          [v132 addObject:v68];
          if (!v67) {

          }
          if (v45)
          {
LABEL_112:

            int v69 = 0;
            v149 = 0;
            v150 = 0;
            v140 = 0;
            v141 = 0;
            v142 = 0;
          }
          else
          {
            id v32 = v32;

            id v151 = v151;
            id v70 = v146;

            id v71 = v148;
            id v39 = v39;

            v149 = v39;
            v150 = v70;
            int v69 = v169;
            v140 = v71;
            v141 = v151;
            v142 = v32;
          }
          if (v138) {
            v138[2](v138, a3, (double)(int)v145 * 100.0 / (double)(unint64_t)[v143 count]);
          }
          BOOL v29 = v69 != 0;

          char v36 = 1;
          CFDictionaryRef v37 = v38;
          goto LABEL_117;
        }
LABEL_72:
        CMTime v47 = v37;
        if (v150 && [v150 mediaType] == 2)
        {
          BOOL v48 = v140;
          if (!v126) {
            BOOL v48 = 0;
          }
          id v147 = v48;
          uint64_t v49 = objc_opt_class();
          long long v50 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
          v168[0] = *MEMORY[0x1E4F1FA30];
          v168[1] = v50;
          v168[2] = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
          uint64_t v51 = [(VCPMediaAnalyzer *)self _queryDistanceDescriptor:v49 ofAsset:v150 withExistingAnalysis:v147 andDatabase:v130 timeRange:v168 lastFeature:1 isDegraded:0];

          v141 = (void *)v51;
          uint64_t v52 = objc_opt_class();
          long long v53 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
          v167[0] = *MEMORY[0x1E4F1FA30];
          v167[1] = v53;
          v167[2] = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
          uint64_t v54 = [(VCPMediaAnalyzer *)self _queryDistanceDescriptor:v52 ofAsset:v150 withExistingAnalysis:v147 andDatabase:v130 timeRange:v167 lastFeature:1 isDegraded:0];

          v142 = v54;
          if (!v127 || [v54 count] && objc_msgSend(v141, "count")) {
            goto LABEL_84;
          }
          uint64_t v55 = (uint64_t)v149;
          if (!v149)
          {
            uint64_t v55 = objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allAcceptableResourcesForAsset:", v146);
          }
          v149 = (void *)v55;
          if (!+[VCPInterAssetAnalyzer canUseLastFrameOfAsset:withResources:](VCPInterAssetAnalyzer, "canUseLastFrameOfAsset:withResources:", v150))goto LABEL_84; {
          if ([v141 count])
          }
            goto LABEL_83;
          id v166 = 0;
          int v97 = [(VCPInterAssetAnalyzer *)v125 generateDistanceDescriptor:&v166 withDescriptorClass:objc_opt_class() forAsset:v150 withResources:v149 lastFrame:1];
          id v98 = v166;
          CMTime v99 = v98;
          if (v97)
          {
LABEL_154:

            goto LABEL_155;
          }
          if (v98)
          {
            v108 = (void *)MEMORY[0x1E4F1C978];
            v180[0] = @"duration";
            CMTimeMake(&v165, 1, 1);
            v109 = CMTimeToNSDictionary(&v165);
            v180[1] = @"attributes";
            v181[0] = v109;
            v181[1] = v99;
            v110 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v181 forKeys:v180 count:2];
            uint64_t v111 = [v108 arrayWithObject:v110];

            v141 = (void *)v111;
LABEL_83:
            if ([v142 count])
            {
LABEL_84:
              v56 = v147;
              goto LABEL_120;
            }
            id v164 = 0;
            int v104 = [(VCPInterAssetAnalyzer *)v125 generateDistanceDescriptor:&v164 withDescriptorClass:objc_opt_class() forAsset:v150 withResources:v149 lastFrame:1];
            id v98 = v164;
            v105 = v98;
            if (v104) {
              goto LABEL_154;
            }
            if (v98)
            {
              uint64_t v113 = (void *)MEMORY[0x1E4F1C978];
              v178[0] = @"duration";
              CMTimeMake(&v163, 1, 1);
              v114 = CMTimeToNSDictionary(&v163);
              v178[1] = @"attributes";
              v179[0] = v114;
              v179[1] = v105;
              v115 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v179 forKeys:v178 count:2];
              uint64_t v116 = [v113 arrayWithObject:v115];

              v142 = (void *)v116;
              goto LABEL_84;
            }
            CFDictionaryRef v37 = v47;
            if ((int)MediaAnalysisLogLevel() < 3) {
              goto LABEL_87;
            }
            v117 = VCPLogInstance();
            if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
            {
              v119 = [v146 localIdentifier];
              *(_DWORD *)CMTime buf = 138412290;
              v183 = v119;
              _os_log_impl(&dword_1BBEDA000, v117, OS_LOG_TYPE_ERROR, "[%@] Failed to generate asset descriptor", buf, 0xCu);
            }
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() < 3) {
              goto LABEL_87;
            }
            v117 = VCPLogInstance();
            if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
            {
              v118 = [v146 localIdentifier];
              *(_DWORD *)CMTime buf = 138412290;
              v183 = v118;
              _os_log_impl(&dword_1BBEDA000, v117, OS_LOG_TYPE_ERROR, "[%@] Failed to generate asset descriptor", buf, 0xCu);
            }
          }

LABEL_155:
          id v39 = 0;
          id v151 = 0;
          id v32 = 0;
LABEL_156:
          int v45 = -18;
LABEL_157:
          CFDictionaryRef v37 = v47;
          goto LABEL_89;
        }
        v56 = 0;
LABEL_120:
        BOOL v72 = v148;
        if (!v126) {
          BOOL v72 = 0;
        }
        id v147 = v72;

        CFDictionaryRef v37 = v47;
        uint64_t v73 = objc_opt_class();
        long long v74 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
        v162[0] = *MEMORY[0x1E4F1FA30];
        v162[1] = v74;
        v162[2] = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
        id v151 = [(VCPMediaAnalyzer *)self _queryDistanceDescriptor:v73 ofAsset:v146 withExistingAnalysis:v147 andDatabase:v130 timeRange:v162 lastFeature:0 isDegraded:0];
        uint64_t v75 = objc_opt_class();
        long long v76 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
        v161[0] = *MEMORY[0x1E4F1FA30];
        v161[1] = v76;
        v161[2] = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
        v77 = [(VCPMediaAnalyzer *)self _queryDistanceDescriptor:v75 ofAsset:v146 withExistingAnalysis:v147 andDatabase:v130 timeRange:v161 lastFeature:0 isDegraded:&v169];
        id v32 = v77;
        if (!v127 || [v77 count] && objc_msgSend(v151, "count"))
        {
          id v39 = 0;
LABEL_126:
          int v45 = 0;
          if (!v142 || !v32) {
            goto LABEL_89;
          }
          if (![v142 count]) {
            goto LABEL_145;
          }
          int v45 = 0;
          if (![v32 count] || !v141 || !v151) {
            goto LABEL_89;
          }
          if (![v141 count] || !objc_msgSend(v151, "count"))
          {
LABEL_145:
            int v45 = 0;
            goto LABEL_89;
          }
          *(_DWORD *)CMTime buf = 0;
          int v156 = 0;
          int v45 = [(VCPInterAssetAnalyzer *)v125 computeDistance:buf fromArray:v142 toArray:v32];
          if (v45) {
            goto LABEL_89;
          }
          int v45 = [(VCPInterAssetAnalyzer *)v125 computeDistance:&v156 fromArray:v141 toArray:v151];
          if (v45) {
            goto LABEL_89;
          }
          v78 = [MEMORY[0x1E4F1CA60] dictionary];
          id v80 = v78;
          if (v78)
          {
            if (v29 || v169 != 0) {
              [v78 setObject:&unk_1F15ED6F8 forKey:@"flags"];
            }
            v172[0] = @"distance";
            LODWORD(v79) = *(_DWORD *)buf;
            v81 = [NSNumber numberWithFloat:v79];
            v173[0] = v81;
            v172[1] = @"sceneprintDistance";
            LODWORD(v82) = v156;
            id v83 = [NSNumber numberWithFloat:v82];
            v173[1] = v83;
            v172[2] = @"neighbor";
            id v84 = [v150 localIdentifier];
            v173[2] = v84;
            v172[3] = @"neighborDateModified";
            long long v85 = objc_msgSend(v150, "vcp_modificationDate");
            v173[3] = v85;
            id v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v173 forKeys:v172 count:4];
            [v80 setObject:v86 forKey:@"attributes"];

            v171 = v80;
            long long v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v171 count:1];
            [v47 setObject:v87 forKey:@"DistanceResults"];

            objc_msgSend(v148, "vcp_addTypes:", 1024);
            int v45 = 0;
          }
          else
          {
            int v45 = -108;
          }

          goto LABEL_157;
        }
        objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allAcceptableResourcesForAsset:", v146);
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v39, "vcp_hasLocalPhoto:", objc_msgSend(v146, "hasAdjustments"))) {
          goto LABEL_126;
        }
        if ([v151 count])
        {
LABEL_142:
          if ([v32 count]) {
            goto LABEL_126;
          }
          id v158 = 0;
          int v88 = [(VCPInterAssetAnalyzer *)v125 generateDistanceDescriptor:&v158 withDescriptorClass:objc_opt_class() forAsset:v146 withResources:v39 lastFrame:0];
          id v89 = v158;
          uint64_t v90 = v89;
          if (v88)
          {
LABEL_144:

            goto LABEL_156;
          }
          if (v89)
          {
            v100 = (void *)MEMORY[0x1E4F1C978];
            v174[0] = @"duration";
            CMTimeMake(&v157, 1, 1);
            CMTimeRange v101 = CMTimeToNSDictionary(&v157);
            v174[1] = @"attributes";
            v175[0] = v101;
            v175[1] = v90;
            v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v175 forKeys:v174 count:2];
            uint64_t v103 = [v100 arrayWithObject:v102];

            id v32 = (id)v103;
            CFDictionaryRef v37 = v47;
            goto LABEL_126;
          }
          CFDictionaryRef v37 = v47;
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_88;
          }
          v106 = VCPLogInstance();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
          {
            v112 = [v146 localIdentifier];
            *(_DWORD *)CMTime buf = 138412290;
            v183 = v112;
            _os_log_impl(&dword_1BBEDA000, v106, OS_LOG_TYPE_ERROR, "[%@] Failed to generate asset descriptor", buf, 0xCu);
          }
        }
        else
        {
          id v160 = 0;
          int v91 = [(VCPInterAssetAnalyzer *)v125 generateDistanceDescriptor:&v160 withDescriptorClass:objc_opt_class() forAsset:v146 withResources:v39 lastFrame:0];
          id v89 = v160;
          uint64_t v92 = v89;
          if (v91) {
            goto LABEL_144;
          }
          if (v89)
          {
            long long v93 = (void *)MEMORY[0x1E4F1C978];
            v176[0] = @"duration";
            CMTimeMake(&v159, 1, 1);
            long long v94 = CMTimeToNSDictionary(&v159);
            v176[1] = @"attributes";
            v177[0] = v94;
            v177[1] = v92;
            long long v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v177 forKeys:v176 count:2];
            uint64_t v96 = [v93 arrayWithObject:v95];

            id v151 = (id)v96;
            CFDictionaryRef v37 = v47;
            goto LABEL_142;
          }
          CFDictionaryRef v37 = v47;
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_88;
          }
          v106 = VCPLogInstance();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
          {
            v107 = [v146 localIdentifier];
            *(_DWORD *)CMTime buf = 138412290;
            v183 = v107;
            _os_log_impl(&dword_1BBEDA000, v106, OS_LOG_TYPE_ERROR, "[%@] Failed to generate asset descriptor", buf, 0xCu);
          }
        }

        goto LABEL_156;
      }
      char v36 = 0;
    }
    id v151 = 0;
    id v32 = 0;
LABEL_117:

    id v30 = v149;
    uint64_t v31 = v150;
    unint64_t v28 = v145;
    if ((v36 & 1) == 0)
    {
      int v122 = -128;
      goto LABEL_189;
    }
  }
  uint64_t v120 = [v143 count];
  if (v120 == [v132 count])
  {
    int v122 = 0;
    goto LABEL_189;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v121 = VCPLogInstance();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CMTime buf = 0;
      _os_log_impl(&dword_1BBEDA000, v121, OS_LOG_TYPE_ERROR, "[MediaAnalysis] failed to request analyses", buf, 2u);
    }
  }
LABEL_188:
  int v122 = -18;
LABEL_189:

LABEL_190:
  return v122;
}

- (int)requestAnalysesForAssets:(id)a3 analysisTypes:(unint64_t)a4 allowOndemand:(BOOL)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  long long v18 = @"AllowOnDemand";
  id v15 = [NSNumber numberWithBool:v9];
  v19[0] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  LODWORD(a4) = [(VCPMediaAnalyzer *)self requestAnalysis:a4 forAssets:v12 withOptions:v16 andProgressHandler:v13 andCompletionHandler:v14];

  return a4;
}

- (int)requestAnalysis:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void))a7;
  id v16 = [(id)objc_opt_class() sharedMediaAnalyzer];

  if (v16 != self)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CMTime buf = 0;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "[MediaAnalysis] [requestAnalysesForAssets] call from invalid instance", buf, 2u);
      }
    }
    goto LABEL_16;
  }
  if (!v12 || ![v12 count])
  {
LABEL_16:
    v15[2](v15, 0);
    int add = -1;
    goto LABEL_17;
  }
  long long v18 = [v13 objectForKeyedSubscript:@"AllowOnDemand"];
  int v19 = [v18 BOOLValue];

  if (!self->_standalone
    || ([v13 objectForKeyedSubscript:@"Standalone"],
        int v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v20))
  {
    uint64_t v21 = [v13 objectForKeyedSubscript:@"Standalone"];
    standalone = self->_standalone;
    self->_standalone = v21;
  }
  if (!self->_noResultStrip
    || ([v13 objectForKeyedSubscript:@"KeepPrivateResults"],
        id v23 = objc_claimAutoreleasedReturnValue(),
        v23,
        v23))
  {
    uint64_t v24 = [v13 objectForKeyedSubscript:@"KeepPrivateResults"];
    noResultStrip = self->_noResultStrip;
    self->_noResultStrip = v24;
  }
  if (((![(NSNumber *)self->_standalone BOOLValue] | v19) & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      BOOL v35 = VCPLogInstance();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CMTime buf = 0;
        _os_log_impl(&dword_1BBEDA000, v35, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] [requestAnalysesForAssets] in standalone mode but on-demand not allowed", buf, 2u);
      }
    }
    goto LABEL_16;
  }
  int add = atomic_fetch_add(&self->_nextRequestID.__a_.__a_value, 1u);
  long long v27 = objc_alloc_init(VCPCancelToken);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E6297060;
  unint64_t v28 = v27;
  BOOL v48 = v28;
  BOOL v29 = _Block_copy(aBlock);
  cancelQueue = self->_cancelQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andCompletionHandler___block_invoke_2;
  block[3] = &unk_1E629BC08;
  int v46 = add;
  void block[4] = self;
  int v45 = v28;
  uint64_t v31 = v28;
  dispatch_sync(cancelQueue, block);
  id v32 = dispatch_get_global_queue(0, 0);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __98__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andCompletionHandler___block_invoke_3;
  v36[3] = &unk_1E629BC30;
  v36[4] = self;
  unint64_t v42 = a3;
  id v37 = v12;
  id v38 = v13;
  id v39 = v14;
  id v40 = v29;
  CMTimeRange v41 = v15;
  int v43 = add;
  id v33 = v29;
  dispatch_async(v32, v36);

LABEL_17:
  return add;
}

uint64_t __98__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isCanceled];
}

void __98__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(void **)(*(void *)(a1 + 32) + 112);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1);
}

void __98__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA48] array];
  if ([*(id *)(a1 + 32) requestAnalysisTypes:*(void *)(a1 + 80) forAssets:*(void *)(a1 + 40) withOptions:*(void *)(a1 + 48) andProgressHandler:*(void *)(a1 + 56) cancelBlock:*(void *)(a1 + 64) analyses:v2])
  {

    id v2 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(NSObject **)(v3 + 104);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __98__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andCompletionHandler___block_invoke_4;
  v5[3] = &unk_1E6297BC0;
  v5[4] = v3;
  int v6 = *(_DWORD *)(a1 + 88);
  dispatch_sync(v4, v5);
}

void __98__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 112);
  id v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  objc_msgSend(v1, "removeObjectForKey:");
}

- (id)requestAnalysisTypes:(unint64_t)a3 forAssets:(id)a4 allowOndemand:(BOOL)a5 progressHandler:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  long long v18 = @"AllowOnDemand";
  id v14 = [NSNumber numberWithBool:v9];
  v19[0] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  id v16 = [(VCPMediaAnalyzer *)self requestAnalysis:a3 forAssets:v12 withOptions:v15 andProgressHandler:v13 andError:a7];

  return v16;
}

- (id)requestAnalysis:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andError:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [v13 objectForKeyedSubscript:@"AllowOnDemand"];
  int v16 = [v15 BOOLValue];

  if (!self->_standalone
    || ([v13 objectForKeyedSubscript:@"Standalone"],
        int v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v17))
  {
    long long v18 = [v13 objectForKeyedSubscript:@"Standalone"];
    standalone = self->_standalone;
    self->_standalone = v18;
  }
  if (!self->_noResultStrip
    || ([v13 objectForKeyedSubscript:@"KeepPrivateResults"],
        int v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v20))
  {
    uint64_t v21 = [v13 objectForKeyedSubscript:@"KeepPrivateResults"];
    noResultStrip = self->_noResultStrip;
    self->_noResultStrip = v21;
  }
  id v23 = [(id)objc_opt_class() sharedMediaAnalyzer];

  if (v23 != self)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v24 = VCPLogInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CMTime buf = 0;
        _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_ERROR, "[MediaAnalysis] call from invalid instance", buf, 2u);
      }
      int v25 = -18;
      goto LABEL_12;
    }
    int v26 = 0;
    int v25 = -18;
    goto LABEL_19;
  }
  if (![v12 count])
  {
LABEL_22:
    int v26 = 0;
    goto LABEL_23;
  }
  if (((![(NSNumber *)self->_standalone BOOLValue] | v16) & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v24 = VCPLogInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unint64_t v28 = 0;
        _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_ERROR, "[MediaAnalysis] on-demand analysis requested in standalone mode", v28, 2u);
      }
      int v25 = -50;
LABEL_12:

      int v26 = 0;
      if (!a7) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
    int v26 = 0;
    int v25 = -50;
    if (!a7) {
      goto LABEL_21;
    }
LABEL_20:
    *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v25 userInfo:0];
    goto LABEL_21;
  }
  int v26 = [MEMORY[0x1E4F1CA48] array];
  int v25 = [(VCPMediaAnalyzer *)self requestAnalysisTypes:a3 forAssets:v12 withOptions:v13 andProgressHandler:v14 cancelBlock:&__block_literal_global_802 analyses:v26];
  if (v25)
  {
LABEL_19:
    if (!a7)
    {
LABEL_21:

      goto LABEL_22;
    }
    goto LABEL_20;
  }
LABEL_23:

  return v26;
}

uint64_t __86__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andError___block_invoke()
{
  return 0;
}

- (id)curateMovieAssetsForCollection:(id)a3 withAlreadyCuratedAssets:(id)a4 andDesiredCount:(unint64_t)a5 allowOnDemand:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v75 = a4;
  uint64_t v64 = v9;
  {
    -[VCPMediaAnalyzer curateMovieAssetsForCollection:withAlreadyCuratedAssets:andDesiredCount:allowOnDemand:]::kDescriptorClass = +[VCPMediaAnalyzer _getDistanceDescriptorClass](VCPMediaAnalyzer, "_getDistanceDescriptorClass");
  }
  uint64_t v10 = 0;
  if (v9 && a5)
  {
    if (v6 && (int)MediaAnalysisLogLevel() >= 4)
    {
      id v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CMTime buf = 0;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEFAULT, "Warning: On demand analysis is not supported.", buf, 2u);
      }
    }
    int v63 = [v9 photoLibrary];
    id v12 = [(VCPMediaAnalyzer *)self _databaseForPhotoLibrary:v63];
    v77 = v12;
    if (v12)
    {
      os_log_t log = [MEMORY[0x1E4F1CA48] array];
      BOOL v60 = objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_fetchOptionsForLibrary:forTaskID:", v63, 1);
      unint64_t v61 = objc_msgSend(MEMORY[0x1E4F38EC0], "fetchAssetsInAssetCollection:options:", v9);
      v68 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      obuint64_t j = v61;
      uint64_t v13 = [obj countByEnumeratingWithState:&v96 objects:v104 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v97;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v97 != v14) {
              objc_enumerationMutation(obj);
            }
            int v16 = *(void **)(*((void *)&v96 + 1) + 8 * i);
            int v17 = (void *)MEMORY[0x1C186D320]();
            if ([v16 isVideo] && (objc_msgSend(v75, "containsObject:", v16) & 1) == 0)
            {
              [v16 fetchPropertySetsIfNeeded];
              long long v18 = [v16 localIdentifier];
              int v19 = [v77 queryAnalysisForAsset:v18];
              int v20 = MediaAnalysisPostProcessCurationScore(v16, v19);

              if (v20)
              {
                if ((objc_msgSend(v20, "vcp_types") & 0x80) != 0 && (objc_msgSend(v20, "vcp_flags") & 0x80000000) == 0)
                {
                  objc_msgSend(v20, "vcp_quality");
                  *(float *)&double v21 = v21;
                  if (*(float *)&v21 > 0.4)
                  {
                    uint64_t v22 = objc_msgSend(NSNumber, "numberWithFloat:");
                    id v23 = [v68 objectForKey:v22];
                    if (!v23)
                    {
                      id v23 = [MEMORY[0x1E4F1CA80] set];
                      [v68 setObject:v23 forKey:v22];
                    }
                    [v23 addObject:v16];
                  }
                }
              }
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v96 objects:v104 count:16];
        }
        while (v13);
      }

      uint64_t v24 = [v68 allKeys];
      CMTimeRange v62 = [v24 sortedArrayUsingSelector:sel_compare_];

      int v25 = [MEMORY[0x1E4F1CA48] array];
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v26 = v75;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v92 objects:v103 count:16];
      unint64_t v28 = (_OWORD *)MEMORY[0x1E4F1FA30];
      if (v27)
      {
        uint64_t v29 = *(void *)v93;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v93 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v92 + 1) + 8 * j);
            id v32 = (void *)MEMORY[0x1C186D320]();
            long long v33 = v28[1];
            v91[0] = *v28;
            v91[1] = v33;
            v91[2] = v28[2];
            int v34 = -[VCPMediaAnalyzer _queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:](self, "_queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:", -[VCPMediaAnalyzer curateMovieAssetsForCollection:withAlreadyCuratedAssets:andDesiredCount:allowOnDemand:]::kDescriptorClass, v31, 0, v77, v91, 0, 0);
            if ([v34 count])
            {
              if ((unint64_t)[v34 count] >= 0xB)
              {
                uint64_t v35 = objc_msgSend(v34, "subarrayWithRange:", 0, 10);

                int v34 = (void *)v35;
              }
              [v25 addObject:v34];
            }
          }
          uint64_t v27 = [v26 countByEnumeratingWithState:&v92 objects:v103 count:16];
        }
        while (v27);
      }

      long long v74 = objc_alloc_init(VCPInterAssetAnalyzer);
      if (!v74) {
        goto LABEL_94;
      }
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      uint64_t v65 = v25;
      id v58 = [v62 reverseObjectEnumerator];
      uint64_t v36 = [v58 countByEnumeratingWithState:&v87 objects:v102 count:16];
      if (v36)
      {
        int v37 = 0;
        uint64_t v56 = v36;
        uint64_t v57 = *(void *)v88;
        while (1)
        {
          for (uint64_t k = 0; k != v56; ++k)
          {
            if (*(void *)v88 != v57) {
              objc_enumerationMutation(v58);
            }
            uint64_t v38 = *(void *)(*((void *)&v87 + 1) + 8 * k);
            long long v83 = 0u;
            long long v84 = 0u;
            long long v85 = 0u;
            long long v86 = 0u;
            uint64_t v10 = [v68 objectForKey:v38];
            id v66 = (id)v10;
            uint64_t v39 = [(id)v10 countByEnumeratingWithState:&v83 objects:v101 count:16];
            if (v39)
            {
              uint64_t v70 = *(void *)v84;
LABEL_46:
              uint64_t v40 = 0;
              uint64_t v71 = v39;
              while (1)
              {
                if (*(void *)v84 != v70) {
                  objc_enumerationMutation(v66);
                }
                uint64_t v73 = *(void *)(*((void *)&v83 + 1) + 8 * v40);
                context = (void *)MEMORY[0x1C186D320]();
                long long v41 = v28[1];
                v82[0] = *v28;
                v82[1] = v41;
                v82[2] = v28[2];
                unint64_t v42 = -[VCPMediaAnalyzer _queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:](self, "_queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:", -[VCPMediaAnalyzer curateMovieAssetsForCollection:withAlreadyCuratedAssets:andDesiredCount:allowOnDemand:]::kDescriptorClass, v73, 0, v77, v82, 0, 0);
                if (![v42 count])
                {
                  int v52 = 16;
                  goto LABEL_78;
                }
                if ((unint64_t)[v42 count] >= 0xB)
                {
                  uint64_t v43 = objc_msgSend(v42, "subarrayWithRange:", 0, 10);

                  unint64_t v42 = (void *)v43;
                }
                long long v80 = 0u;
                long long v81 = 0u;
                long long v78 = 0u;
                long long v79 = 0u;
                id v44 = v25;
                uint64_t v45 = [v44 countByEnumeratingWithState:&v78 objects:v100 count:16];
                if (v45)
                {
                  uint64_t v10 = *(void *)v79;
                  int v46 = 1;
                  while (2)
                  {
                    for (uint64_t m = 0; m != v45; ++m)
                    {
                      if (*(void *)v79 != v10) {
                        objc_enumerationMutation(v44);
                      }
                      uint64_t v48 = *(void *)(*((void *)&v78 + 1) + 8 * m);
                      *(float *)CMTime buf = 0.0;
                      int v49 = [(VCPInterAssetAnalyzer *)v74 computeDistance:buf fromArray:v42 toArray:v48];
                      if (v49) {
                        int v37 = v49;
                      }
                      else {
                        int v46 = (*(float *)buf >= 0.1) & v46;
                      }
                      if (v49 || *(float *)buf < 0.1)
                      {
                        uint64_t v10 = *(float *)buf >= 0.1;
                        BOOL v50 = v49 == 0;

                        int v25 = v65;
                        char v51 = !v50 | v10;
                        if (v50) {
                          int v52 = 0;
                        }
                        else {
                          int v52 = 12;
                        }
                        if ((v51 & 1) == 0 && ((v46 ^ 1) & 1) == 0) {
                          goto LABEL_74;
                        }
                        goto LABEL_78;
                      }
                    }
                    uint64_t v45 = [v44 countByEnumeratingWithState:&v78 objects:v100 count:16];
                    if (v45) {
                      continue;
                    }
                    break;
                  }

                  int v25 = v65;
                  if (v46) {
                    goto LABEL_74;
                  }
                }
                else
                {

LABEL_74:
                  [log addObject:v73];
                  if ([log count] == a5)
                  {
                    int v37 = 0;
                    int v52 = 12;
                    goto LABEL_78;
                  }
                  [v44 addObject:v42];
                }
                int v52 = 0;
LABEL_78:

                if ((v52 | 0x10) != 0x10)
                {

                  if (v52 == 12) {
                    goto LABEL_93;
                  }
LABEL_99:

LABEL_100:
                  id v12 = v77;
                  goto LABEL_101;
                }
                if (++v40 == v71)
                {
                  uint64_t v10 = (uint64_t)v66;
                  uint64_t v39 = [v66 countByEnumeratingWithState:&v83 objects:v101 count:16];
                  if (v39) {
                    goto LABEL_46;
                  }
                  break;
                }
              }
            }
          }
          uint64_t v56 = [v58 countByEnumeratingWithState:&v87 objects:v102 count:16];
          if (!v56) {
            goto LABEL_92;
          }
        }
      }
      int v37 = 0;
LABEL_92:

LABEL_93:
      if (!v37)
      {
        if ([log count]) {
          os_log_t v54 = log;
        }
        else {
          os_log_t v54 = 0;
        }
      }
      else
      {
LABEL_94:
        os_log_t v54 = 0;
      }
      uint64_t v10 = v54;
      goto LABEL_99;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      VCPLogInstance();
      os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        long long v53 = [v9 localIdentifier];
        *(float *)CMTime buf = 5.7779e-34;
        v106 = v53;
        _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Failed to obtain database for collection %@", buf, 0xCu);
      }
      uint64_t v10 = 0;
      goto LABEL_100;
    }
    uint64_t v10 = 0;
LABEL_101:
  }
  return (id)v10;
}

- (id)requestMovieHighlightsForAssets:(id)a3 withOptions:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v59 = v5;
  id v7 = [v5 objectAtIndexedSubscript:0];
  dispatch_semaphore_t v8 = [v7 photoLibrary];
  uint64_t v9 = [(VCPMediaAnalyzer *)self _databaseForPhotoLibrary:v8];

  int v52 = (void *)v9;
  if (v9)
  {
    uint64_t v10 = [v6 objectForKeyedSubscript:@"AllowOnDemand"];
    int v53 = [v10 BOOLValue];

    id v11 = [v6 objectForKeyedSubscript:@"ScaledSlomoTime"];
    int v12 = [v11 BOOLValue];

    uint64_t v13 = [v6 objectForKeyedSubscript:@"HighlightContexts"];
    uint64_t v14 = [v13 allKeys];
    int v15 = [v14 containsObject:@"SearchQueryString"];

    if (v15)
    {
      BOOL v50 = [(VCPMediaAnalyzer *)self prepareContextsQueryEmbedding:v13];

      int v16 = (void *)[v6 mutableCopy];
      [v16 setObject:v50 forKeyedSubscript:@"HighlightContexts"];
    }
    else
    {
      BOOL v50 = v13;
      int v16 = v6;
    }
    id v55 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v60 = 0;
    int v51 = v12 ^ 1;
    for (uint64_t i = v16; ; v16 = i)
    {
      if ([v59 count] <= v60)
      {
        id v6 = v16;
        goto LABEL_39;
      }
      unint64_t v61 = objc_msgSend(v59, "objectAtIndexedSubscript:");
      context = (void *)MEMORY[0x1C186D320]();
      [v61 fetchPropertySetsIfNeeded];
      long long v18 = [[VCPMovieCurationResults alloc] initWithPHAsset:v61];
      if ([v61 isVideo])
      {
        if ((objc_msgSend(v61, "vcp_isShortMovie") & 1) == 0) {
          break;
        }
      }
LABEL_37:
      [v55 addObject:v18];

      ++v60;
    }
    if ([(NSNumber *)self->_standalone BOOLValue])
    {
      uint64_t v56 = 0;
    }
    else
    {
      int v19 = [v61 localIdentifier];
      uint64_t v56 = [v52 queryAnalysisForAsset:v19];

      if ((objc_msgSend(v56, "vcp_types") & 0x80000040000) != 0)
      {
        uint64_t v20 = MediaAnalysisPostProcessAnalysis(v61, v56, v51);

        double v21 = VCPSignPostLog();
        os_signpost_id_t v22 = os_signpost_id_generate(v21);

        id v23 = VCPSignPostLog();
        uint64_t v24 = v23;
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
        {
          LOWORD(buf.start.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "VCPPostProcessMovieHighlights", "", (uint8_t *)&buf, 2u);
        }

        int v25 = [(VCPMediaAnalyzer *)self _postProcessMovieHighlights:v61 analysis:v20 withOptions:i];
        id v26 = VCPSignPostLog();
        uint64_t v27 = v26;
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
        {
          LOWORD(buf.start.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v27, OS_SIGNPOST_INTERVAL_END, v22, "VCPPostProcessMovieHighlights", "", (uint8_t *)&buf, 2u);
        }

        uint64_t v56 = (void *)v20;
        goto LABEL_24;
      }
    }
    int v25 = 0;
LABEL_24:
    if (v25) {
      int v28 = 0;
    }
    else {
      int v28 = v53;
    }
    if (v28 == 1)
    {
      uint64_t v29 = [(VCPMediaAnalyzer *)self _analyzeOndemand:v61 forAnalysisTypes:0x80000040000 withExistingAnalysis:v56 andOptions:i storeAnalysis:1 cancelBlock:&__block_literal_global_807];
      int v25 = [(VCPMediaAnalyzer *)self _postProcessMovieHighlights:v61 analysis:v29 withOptions:i];
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v30 = objc_msgSend(v25, "vcp_results");
    obuint64_t j = [v30 objectForKeyedSubscript:@"MovieHighlightResults"];

    uint64_t v31 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v68 != v32) {
            objc_enumerationMutation(obj);
          }
          CFDictionaryRef v34 = *(const __CFDictionary **)(*((void *)&v67 + 1) + 8 * j);
          memset(&buf, 0, sizeof(buf));
          CMTimeRangeMakeFromDictionary(&buf, v34);
          uint64_t v35 = [(__CFDictionary *)v34 objectForKeyedSubscript:@"quality"];
          [v35 floatValue];
          unsigned int v37 = v36;

          uint64_t v38 = [(__CFDictionary *)v34 objectForKeyedSubscript:@"attributes"];
          memset(&v65, 0, sizeof(v65));
          CFDictionaryRef v39 = [v38 objectForKeyedSubscript:@"keyFrameTime"];
          CMTimeMakeFromDictionary(&v65, v39);

          uint64_t v40 = [v38 objectForKeyedSubscript:@"keyFrameScore"];
          [v40 floatValue];
          unsigned int v42 = v41;

          uint64_t v43 = [VCPVideoKeyFrameResult alloc];
          CMTime v64 = v65;
          id v44 = [(VCPVideoKeyFrameResult *)v43 initWithTime:&v64 andScore:COERCE_DOUBLE(__PAIR64__(HIDWORD(v65.value), v42))];
          uint64_t v45 = [(VCPMovieCurationResults *)v18 highlights];
          int v46 = [VCPMovieHighlightResult alloc];
          CMTimeRange v63 = buf;
          CMTime v47 = [(VCPMovieHighlightResult *)v46 initWithTimeRange:&v63 score:v44 andKeyFrame:COERCE_DOUBLE(__PAIR64__(buf.duration.flags, v37))];
          [v45 addObject:v47];

          uint64_t v48 = (void *)[v25 mutableCopy];
          [(VCPMovieCurationResults *)v18 setResults:v48];
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
      }
      while (v31);
    }

    goto LABEL_37;
  }
  if ((int)MediaAnalysisLogLevel() < 4)
  {
    id v55 = 0;
  }
  else
  {
    int v17 = VCPLogInstance();
    BOOL v50 = v17;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.start.value) = 0;
      _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Failed to obtain database for assets", (uint8_t *)&buf, 2u);
    }
    id v55 = 0;
LABEL_39:
  }
  return v55;
}

uint64_t __64__VCPMediaAnalyzer_requestMovieHighlightsForAssets_withOptions___block_invoke()
{
  return 0;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)postProcessMovieHighlightDuration:(SEL)a3 withOptions:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v53 = a4;
  id v7 = a5;
  BOOL v50 = [v7 objectForKeyedSubscript:@"HighlightTargetDuration"];
  uint64_t v48 = [v7 objectForKeyedSubscript:@"HighlightTolerance"];
  int v51 = [v7 objectForKeyedSubscript:@"HighlightIndex"];
  *(void *)&long long v52 = [v7 objectForKeyedSubscript:@"MaxHighlightDuration"];
  *((void *)&v52 + 1) = [v7 objectForKeyedSubscript:@"HighlightBestTrim"];
  if (v53)
  {
    dispatch_semaphore_t v8 = objc_msgSend(v53, "vcp_results");
    uint64_t v9 = [v8 objectForKeyedSubscript:@"MovieHighlightResults"];
  }
  else
  {
    uint64_t v9 = 0;
  }
  int v49 = [v7 objectForKeyedSubscript:@"HighlightStartRange"];
  if (!v9 || ![v9 count]) {
    goto LABEL_30;
  }
  uint64_t v10 = (void *)v52;
  if (v52 != 0)
  {
    if ((void)v52)
    {
      v69[0] = @"HighlightMaxDuration";
    }
    else
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      uint64_t v14 = objc_msgSend(v53, "vcp_results");
      int v15 = [v14 objectForKeyedSubscript:@"MovieHighlightResults"];

      uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v71 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v61;
        double v18 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v61 != v17) {
              objc_enumerationMutation(v15);
            }
            CFDictionaryRef v20 = *(const __CFDictionary **)(*((void *)&v60 + 1) + 8 * i);
            memset(&v59, 0, sizeof(v59));
            CMTimeRangeMakeFromDictionary(&v59, v20);
            CMTime time = v59.duration;
            double Seconds = CMTimeGetSeconds(&time);
            if (v18 < Seconds) {
              double v18 = Seconds;
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v71 count:16];
        }
        while (v16);
      }
      else
      {
        double v18 = 0.0;
      }

      v69[0] = @"HighlightMaxDuration";
      uint64_t v10 = [NSNumber numberWithDouble:v18];
    }
    uint64_t v39 = *((void *)&v52 + 1);
    if (!*((void *)&v52 + 1)) {
      uint64_t v39 = MEMORY[0x1E4F1CC28];
    }
    v70[0] = v10;
    v70[1] = v39;
    v69[1] = @"HighlightBestTrim";
    void v69[2] = @"HighlightIndex";
    v69[3] = @"HighlightFullResult";
    uint64_t v40 = &unk_1F15ED698;
    if (v51) {
      uint64_t v40 = v51;
    }
    v70[2] = v40;
    v70[3] = MEMORY[0x1E4F1CC28];
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:4];
    if (!(void)v52) {

    }
LABEL_55:
    unsigned int v41 = MediaAnalysisPostProcessMovieHighlights(v53, v26, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    unsigned int v42 = v41;
    if (v41
      && ([v41 objectForKeyedSubscript:@"MovieHighlightResults"],
          uint64_t v43 = objc_claimAutoreleasedReturnValue(),
          [v43 objectAtIndexedSubscript:0],
          CFDictionaryRef v44 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(),
          v43,
          v44))
    {
      CMTimeRangeMakeFromDictionary((CMTimeRange *)retstr, v44);
    }
    else
    {
      CFDictionaryRef v44 = 0;
      uint64_t v45 = MEMORY[0x1E4F1FA30];
      long long v46 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
      *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA30];
      *(_OWORD *)&retstr->var0.var3 = v46;
      *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v45 + 32);
    }

    goto LABEL_60;
  }
  if (v50)
  {
    id v11 = &unk_1F15EAD58;
    int v12 = &unk_1F15ED698;
    if (v49)
    {
      v66[0] = @"HighlightStartRange";
      v66[1] = @"HighlightTargetDuration";
      v67[0] = v49;
      v67[1] = v50;
      if (v48) {
        id v11 = v48;
      }
      void v66[2] = @"HighlightTolerance";
      v66[3] = @"HighlightIndex";
      if (v51) {
        int v12 = v51;
      }
      void v67[2] = v11;
      v67[3] = v12;
      v66[4] = @"HighlightFullResult";
      v67[4] = MEMORY[0x1E4F1CC28];
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:5];
    }
    else
    {
      v64[0] = @"HighlightTargetDuration";
      v64[1] = @"HighlightTolerance";
      if (v48) {
        id v11 = v48;
      }
      v65[0] = v50;
      v65[1] = v11;
      if (v51) {
        int v12 = v51;
      }
      v64[2] = @"HighlightIndex";
      v64[3] = @"HighlightFullResult";
      v65[2] = v12;
      v65[3] = MEMORY[0x1E4F1CC28];
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:4];
    }
    id v26 = (void *)v13;
    goto LABEL_55;
  }
  if (v51)
  {
    if (([v51 intValue] & 0x80000000) == 0)
    {
      int v22 = [v51 intValue];
      if ([v9 count] > (unint64_t)v22)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", (int)objc_msgSend(v51, "intValue"));
        CFDictionaryRef v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeRangeMakeFromDictionary((CMTimeRange *)retstr, v23);

        goto LABEL_60;
      }
    }
LABEL_30:
    uint64_t v24 = MEMORY[0x1E4F1FA20];
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)&retstr->var0.var3 = v25;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v24 + 32);
    goto LABEL_60;
  }
  uint64_t v27 = MEMORY[0x1E4F1FA20];
  long long v28 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&retstr->var0.var3 = v28;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v27 + 32);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v29 = v9;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v54 objects:v68 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v55;
    float v32 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v55 != v31) {
          objc_enumerationMutation(v29);
        }
        CFDictionaryRef v34 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        uint64_t v35 = [v34 objectForKeyedSubscript:@"quality"];
        [v35 floatValue];
        float v37 = v36;

        if (v32 < v37)
        {
          CMTimeRangeMakeFromDictionary(&v59, (CFDictionaryRef)v34);
          long long v38 = *(_OWORD *)&v59.start.epoch;
          *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v59.start.value;
          *(_OWORD *)&retstr->var0.var3 = v38;
          *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v59.duration.timescale;
          float v32 = v37;
        }
      }
      uint64_t v30 = [v29 countByEnumeratingWithState:&v54 objects:v68 count:16];
    }
    while (v30);
  }

LABEL_60:
  return result;
}

- (id)requestLivePhotoEffectsForAssets:(id)a3 allowOnDemand:(BOOL)a4 flags:(unint64_t)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  dispatch_semaphore_t v8 = [(id)objc_opt_class() sharedMediaAnalyzer];

  if (v8 == self)
  {
    if (v7 && [v7 count])
    {
      if (![(NSNumber *)self->_standalone BOOLValue] || v5)
      {
        id v69 = v7;
        uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v71 = v9;
        uint64_t v64 = MediaAnalysisResultsTypesForAnalysisTypes(0x100000);
        uint64_t v14 = [v7 objectAtIndexedSubscript:0];
        int v15 = [v14 photoLibrary];

        uint64_t v72 = v15;
        [(VCPMediaAnalyzer *)self _databaseForPhotoLibrary:v15];
        uint64_t v63 = v67 = v5;
        uint64_t v16 = +[VCPDatabaseBatchIterator iteratorForAssets:withDatabaseReader:resultTypes:batchSize:](VCPDatabaseBatchIterator, "iteratorForAssets:withDatabaseReader:resultTypes:batchSize:", v7);
        int v66 = 0;
        uint64_t v17 = -1;
        long long v68 = v16;
        while ([v16 next])
        {
          if ([v7 count] <= (unint64_t)++v17) {
            break;
          }
          double v18 = (void *)MEMORY[0x1C186D320]();
          int v19 = [v16 asset];
          long long v74 = v19;
          [v19 fetchPropertySetsIfNeeded];
          CFDictionaryRef v20 = [v16 analysis];
          double v21 = objc_msgSend(v20, "vcp_results");
          int v22 = [v21 objectForKeyedSubscript:@"LivePhotoEffectsResults"];

          uint64_t v73 = v22;
          char v23 = objc_msgSend(v20, "vcp_types");
          uint64_t v24 = [v22 count];
          BOOL v25 = v24 != 0;
          if (v24)
          {
            id v26 = [v22 objectAtIndexedSubscript:0];
            uint64_t v27 = [v26 objectForKeyedSubscript:@"attributes"];

            long long v28 = [v27 objectForKeyedSubscript:@"loopSuggestionState"];
            int v29 = [v28 intValue];

            uint64_t v30 = [v27 objectForKeyedSubscript:@"longExposureSuggestionState"];
            int v31 = [v30 intValue];

            float v32 = [v27 objectForKeyedSubscript:@"livePhotoEffectsRecipe"];
            uint64_t v70 = v29;
            uint64_t v33 = v31;

            int v19 = v74;
          }
          else
          {
            uint64_t v70 = 0;
            uint64_t v33 = 0;
            float v32 = 0;
          }
          if (!v67 || v32) {
            goto LABEL_43;
          }
          CFDictionaryRef v34 = [v72 librarySpecificFetchOptions];
          [v34 setIncludedDetectionTypes:&unk_1F15EE580];
          uint64_t v35 = [MEMORY[0x1E4F39048] fetchFacesInAsset:v19 options:v34];
          uint64_t v36 = [v35 count];
          BOOL v37 = v36 != 0;
          if (!v36 && (v23 & 0xC) != 0)
          {
            long long v38 = objc_msgSend(v20, "vcp_results");
            uint64_t v39 = [v38 objectForKeyedSubscript:@"FaceResults"];
            BOOL v37 = v39 != 0;
          }
          uint64_t v40 = [[VCPEffectsAnalyzer alloc] initWithFlagHasFaceOrPet:v37];
          if (v40)
          {
            *(void *)CMTimeRange buf = 0;
            CMTime v65 = v35;
            unsigned int v41 = +[VCPPhotosAsset assetWithPHAsset:v19];
            id v75 = 0;
            int v42 = [(VCPEffectsAnalyzer *)v40 analyzeAsset:v41 onDemand:1 cancel:&__block_literal_global_821 statsFlags:buf results:&v75];
            id v43 = v75;

            int v44 = v42 ? v42 : v66;
            int v66 = v44;
            if (v42)
            {
              float v32 = 0;
              int v45 = 10;
            }
            else
            {
              long long v46 = [v43 objectForKeyedSubscript:@"LivePhotoEffectsResults"];
              if ([v46 count])
              {
                long long v62 = v46;
                CMTime v47 = [v46 objectAtIndexedSubscript:0];
                uint64_t v48 = [v47 objectForKeyedSubscript:@"attributes"];

                int v49 = [v48 objectForKeyedSubscript:@"loopSuggestionState"];
                int v50 = [v49 intValue];

                int v51 = [v48 objectForKeyedSubscript:@"longExposureSuggestionState"];
                int v52 = [v51 intValue];

                float v32 = [v48 objectForKeyedSubscript:@"livePhotoEffectsRecipe"];
                uint64_t v70 = v50;
                uint64_t v33 = v52;

                BOOL v25 = 1;
                long long v46 = v62;
              }
              else
              {
                float v32 = 0;
              }

              int v45 = 0;
            }

            uint64_t v35 = v65;
          }
          else
          {
            float v32 = 0;
            int v45 = 10;
            int v66 = -108;
          }

          if (!v45)
          {
LABEL_43:
            if (v25)
            {
              id v53 = [MEMORY[0x1E4F1CA60] dictionary];
              long long v54 = [NSNumber numberWithUnsignedLongLong:v70];
              [v53 setObject:v54 forKey:@"loopSuggestionState"];

              long long v55 = [NSNumber numberWithUnsignedLongLong:v33];
              [v53 setObject:v55 forKey:@"longExposureSuggestionState"];

              if (v32)
              {
                long long v56 = [[VCPProtoLivePhotoEffectsRecipe alloc] initWithData:v32];
                long long v57 = [(VCPProtoLivePhotoEffectsRecipe *)v56 exportToLegacyDictionary];
                [v53 setObject:v57 forKey:@"livePhotoEffectsRecipe"];
              }
              id v58 = [v74 localIdentifier];
              [v71 setObject:v53 forKey:v58];
            }
            int v45 = 0;
          }

          uint64_t v16 = v68;
          id v7 = v69;
          uint64_t v9 = v71;
          int v15 = v72;
          if (v45)
          {
            long long v60 = (void *)v63;
            CMTimeRange v59 = (void *)v64;
            goto LABEL_51;
          }
        }
        long long v60 = (void *)v63;
        CMTimeRange v59 = (void *)v64;
LABEL_51:
        if (v66) {
          long long v61 = 0;
        }
        else {
          long long v61 = v9;
        }
        int v12 = v61;

        goto LABEL_7;
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        uint64_t v9 = VCPLogInstance();
        os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_6;
        }
        *(_WORD *)CMTimeRange buf = 0;
        id v11 = "[MediaAnalysis] [requestLivePhotoEffectsForAssets] in standalone mode but on-demand not allowed";
        goto LABEL_5;
      }
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v9 = VCPLogInstance();
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_6:
      int v12 = 0;
LABEL_7:

      goto LABEL_16;
    }
    *(_WORD *)CMTimeRange buf = 0;
    id v11 = "[MediaAnalysis] [requestLivePhotoEffectsForAssets] call from invalid instance";
LABEL_5:
    _os_log_impl(&dword_1BBEDA000, v9, v10, v11, buf, 2u);
    goto LABEL_6;
  }
  int v12 = 0;
LABEL_16:

  return v12;
}

uint64_t __73__VCPMediaAnalyzer_requestLivePhotoEffectsForAssets_allowOnDemand_flags___block_invoke()
{
  return 0;
}

- (void)completeStorage
{
}

+ (id)personModelFilepathForPhotoLibrary:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "vcp_vipModelFilepathForVIPType:", 0);
  return v3;
}

+ (id)loadPersonModelAtPath:(id)a3 error:(id *)a4
{
  char v4 = +[VCPFaceIDModel loadVIPModelAtPath:a3 withVIPType:0 error:a4];
  return v4;
}

+ (unint64_t)faceprintRevisionForPersonModel:(id)a3
{
  uint64_t v3 = [a3 configuration];
  unint64_t v4 = [v3 faceprintRequestRevision];

  return v4;
}

+ (id)classifyFaceObservation:(id)a3 withPersonsModel:(id)a4 error:(id *)a5
{
  BOOL v5 = +[VCPFaceIDModel classifyFaceObservation:a3 withModel:a4 error:a5];
  return v5;
}

- (id)getTimeRangesForSceneIdentifiers:(id)a3 withResults:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v36 = a4;
  long long v38 = v5;
  if (![v5 count])
  {
    id v35 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_42;
  }
  id v6 = [v5 objectAtIndexedSubscript:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v42 = [MEMORY[0x1E4F1CA60] dictionary];
    id v35 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v33 = [MEMORY[0x1E4F1CAD0] setWithArray:v38];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    obuint64_t j = [v36 objectForKeyedSubscript:@"ClassificationResults"];
    uint64_t v31 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v56;
      *(void *)&long long v8 = 134218240;
      long long v29 = v8;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v56 != v32) {
            objc_enumerationMutation(obj);
          }
          CFDictionaryRef v9 = *(const __CFDictionary **)(*((void *)&v55 + 1) + 8 * i);
          id v43 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", v29);
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          CFDictionaryRef dictionaryRepresentation = v9;
          id v39 = [(__CFDictionary *)v9 objectForKeyedSubscript:@"attributes"];
          uint64_t v10 = [v39 countByEnumeratingWithState:&v51 objects:v60 count:16];
          if (v10)
          {
            uint64_t v40 = *(void *)v52;
            do
            {
              uint64_t v41 = v10;
              for (uint64_t j = 0; j != v41; ++j)
              {
                if (*(void *)v52 != v40) {
                  objc_enumerationMutation(v39);
                }
                int v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * j), "intValue"));
                [v43 addObject:v12];
                uint64_t v13 = [v42 objectForKeyedSubscript:v12];
                BOOL v14 = v13 == 0;

                if (v14)
                {
                  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F8CD58], "vcp_sharedTaxonomy");
                  uint64_t v17 = objc_msgSend(v16, "mad_allAncestorsForSceneId:", objc_msgSend(v12, "unsignedIntValue"));

                  if (v17)
                  {
                    double v18 = [MEMORY[0x1E4F1CA80] set];
                    long long v49 = 0u;
                    long long v50 = 0u;
                    long long v47 = 0u;
                    long long v48 = 0u;
                    id v15 = v17;
                    uint64_t v19 = [v15 countByEnumeratingWithState:&v47 objects:v59 count:16];
                    if (v19)
                    {
                      uint64_t v20 = *(void *)v48;
                      do
                      {
                        for (uint64_t k = 0; k != v19; ++k)
                        {
                          if (*(void *)v48 != v20) {
                            objc_enumerationMutation(v15);
                          }
                          int v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * k), "sceneClassId"));
                          [v18 addObject:v22];
                        }
                        uint64_t v19 = [v15 countByEnumeratingWithState:&v47 objects:v59 count:16];
                      }
                      while (v19);
                    }

                    [v42 setObject:v18 forKeyedSubscript:v12];
                    [v43 unionSet:v18];
                  }
                  else
                  {
                    id v15 = 0;
                  }
                }
                else
                {
                  id v15 = [v42 objectForKeyedSubscript:v12];
                  [v43 unionSet:v15];
                }
              }
              uint64_t v10 = [v39 countByEnumeratingWithState:&v51 objects:v60 count:16];
            }
            while (v10);
          }

          if ([v33 intersectsSet:v43])
          {
            memset(&v46, 0, sizeof(v46));
            CMTimeRangeMakeFromDictionary(&v46, dictionaryRepresentation);
            CMTimeRange range = v46;
            CFDictionaryRef v23 = CMTimeRangeCopyAsDictionary(&range, 0);
            [v35 addObject:v23];

            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              uint64_t v24 = VCPLogInstance();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                CMTime time = v46.start;
                Float64 Seconds = CMTimeGetSeconds(&time);
                CMTime duration = v46.duration;
                Float64 v26 = CMTimeGetSeconds(&duration);
                LODWORD(range.start.value) = v29;
                *(Float64 *)((char *)&range.start.value + 4) = Seconds;
                LOWORD(range.start.flags) = 2048;
                *(Float64 *)((char *)&range.start.flags + 2) = v26;
                _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_DEBUG, "[MediaAnalysis] metadata 1-up timeranges add scene range : [%f,  %f]", (uint8_t *)&range, 0x16u);
              }
            }
          }
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
      }
      while (v31);
    }

    uint64_t v27 = v42;
LABEL_40:

    goto LABEL_42;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v27 = VCPLogInstance();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      LOWORD(range.start.value) = 0;
      _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "sceneIdentifer type expected to be NSNumber", (uint8_t *)&range, 2u);
    }
    id v35 = 0;
    goto LABEL_40;
  }
  id v35 = 0;
LABEL_42:

  return v35;
}

- (id)getTimeRangesForActionIDs:(id)a3 withResults:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v34 = a4;
  long long v38 = v5;
  if (![v5 count])
  {
    id v40 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_33;
  }
  id v6 = [v5 objectAtIndexedSubscript:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v40 = [MEMORY[0x1E4F1CA48] array];
    [v34 objectForKeyedSubscript:@"HumanActionClassificationResults"];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v37)
    {
      uint64_t v36 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v50 != v36) {
            objc_enumerationMutation(obj);
          }
          long long v8 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v41 = v38;
          uint64_t v9 = [v41 countByEnumeratingWithState:&v45 objects:v53 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v46;
            do
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v46 != v10) {
                  objc_enumerationMutation(v41);
                }
                int v12 = *(void **)(*((void *)&v45 + 1) + 8 * j);
                uint64_t v13 = [v8 objectForKeyedSubscript:@"attributes"];
                BOOL v14 = [v13 objectForKeyedSubscript:@"humanActions"];

                id v15 = [v12 stringValue];
                uint64_t v16 = [v14 objectForKeyedSubscript:v15];
                BOOL v17 = v16 == 0;

                if (!v17)
                {
                  double v18 = [v12 stringValue];
                  uint64_t v19 = [v14 objectForKeyedSubscript:v18];
                  [v19 floatValue];
                  float v21 = v20;

                  int v22 = [v12 stringValue];
                  CFDictionaryRef v23 = VCPHumanActionOperatingPointFromActionID(v22);
                  if (v23)
                  {
                    uint64_t v24 = [v12 stringValue];
                    BOOL v25 = VCPHumanActionOperatingPointFromActionID(v24);
                    [v25 floatValue];
                    BOOL v27 = v21 > v26;

                    if (v27)
                    {
                      memset(&v44, 0, sizeof(v44));
                      CMTimeRangeMakeFromDictionary(&v44, (CFDictionaryRef)v8);
                      CMTimeRange range = v44;
                      CFDictionaryRef v28 = CMTimeRangeCopyAsDictionary(&range, 0);
                      [v40 addObject:v28];

                      if ((int)MediaAnalysisLogLevel() >= 7)
                      {
                        long long v29 = VCPLogInstance();
                        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                        {
                          CMTime time = v44.start;
                          Float64 Seconds = CMTimeGetSeconds(&time);
                          CMTime duration = v44.duration;
                          Float64 v31 = CMTimeGetSeconds(&duration);
                          LODWORD(range.start.value) = 134218240;
                          *(Float64 *)((char *)&range.start.value + 4) = Seconds;
                          LOWORD(range.start.flags) = 2048;
                          *(Float64 *)((char *)&range.start.flags + 2) = v31;
                          _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_DEBUG, "[MediaAnalysis] metadata 1-up timeranges add action range : [%f,  %f]", (uint8_t *)&range, 0x16u);
                        }
                      }
                    }
                  }
                  else
                  {
                  }
                }
              }
              uint64_t v9 = [v41 countByEnumeratingWithState:&v45 objects:v53 count:16];
            }
            while (v9);
          }
        }
        uint64_t v37 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v37);
    }

LABEL_31:
    goto LABEL_33;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v32 = VCPLogInstance();
    obuint64_t j = v32;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      LOWORD(range.start.value) = 0;
      _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_ERROR, "actionID type expected to be NSNumber", (uint8_t *)&range, 2u);
    }
    id v40 = 0;
    goto LABEL_31;
  }
  id v40 = 0;
LABEL_33:

  return v40;
}

- (id)getTimeRangesForSoundIdentifiers:(id)a3 withResults:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v28 = a4;
  if (![v5 count])
  {
    long long v8 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_40;
  }
  id v6 = [v5 objectAtIndexedSubscript:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v33 = objc_msgSend((id)objc_opt_class(), "mad_audioTaxonomy:useResultsKey:", 0, 1);
    long long v8 = [MEMORY[0x1E4F1CA48] array];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    obuint64_t j = v28;
    uint64_t v26 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v49 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(v33, "allValues", v26);
          uint64_t v35 = v9;
          char v11 = [v10 containsObject:v9];

          if (v11)
          {
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v31 = v5;
            uint64_t v34 = [v31 countByEnumeratingWithState:&v44 objects:v53 count:16];
            if (v34)
            {
              uint64_t v32 = *(void *)v45;
              do
              {
                for (uint64_t j = 0; j != v34; ++j)
                {
                  if (*(void *)v45 != v32) {
                    objc_enumerationMutation(v31);
                  }
                  int v12 = [v33 objectForKeyedSubscript:*(void *)(*((void *)&v44 + 1) + 8 * j)];
                  int v13 = [v12 isEqualToString:v9];

                  if (v13)
                  {
                    BOOL v14 = [obj objectForKeyedSubscript:v35];
                    long long v42 = 0u;
                    long long v43 = 0u;
                    long long v40 = 0u;
                    long long v41 = 0u;
                    id v15 = v14;
                    uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v52 count:16];
                    if (v16)
                    {
                      uint64_t v17 = *(void *)v41;
                      do
                      {
                        for (uint64_t k = 0; k != v16; ++k)
                        {
                          if (*(void *)v41 != v17) {
                            objc_enumerationMutation(v15);
                          }
                          CFDictionaryRef v19 = *(const __CFDictionary **)(*((void *)&v40 + 1) + 8 * k);
                          memset(&v39, 0, sizeof(v39));
                          CMTimeRangeMakeFromDictionary(&v39, v19);
                          CMTimeRange range = v39;
                          CFDictionaryRef v20 = CMTimeRangeCopyAsDictionary(&range, 0);
                          [v8 addObject:v20];

                          if ((int)MediaAnalysisLogLevel() >= 7)
                          {
                            float v21 = VCPLogInstance();
                            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                            {
                              CMTime time = v39.start;
                              Float64 Seconds = CMTimeGetSeconds(&time);
                              CMTime duration = v39.duration;
                              Float64 v23 = CMTimeGetSeconds(&duration);
                              LODWORD(range.start.value) = 134218240;
                              *(Float64 *)((char *)&range.start.value + 4) = Seconds;
                              LOWORD(range.start.flags) = 2048;
                              *(Float64 *)((char *)&range.start.flags + 2) = v23;
                              _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEBUG, "[MediaAnalysis] metadata 1-up timeranges add sound range : [%f,  %f]", (uint8_t *)&range, 0x16u);
                            }
                          }
                        }
                        uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v52 count:16];
                      }
                      while (v16);
                    }
                  }
                  uint64_t v9 = v35;
                }
                uint64_t v34 = [v31 countByEnumeratingWithState:&v44 objects:v53 count:16];
              }
              while (v34);
            }
          }
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v26);
    }

LABEL_38:
    goto LABEL_40;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v24 = VCPLogInstance();
    uint64_t v33 = v24;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(range.start.value) = 0;
      _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_ERROR, "soundIdentifier type expected to be NSNumber", (uint8_t *)&range, 2u);
    }
    long long v8 = 0;
    goto LABEL_38;
  }
  long long v8 = 0;
LABEL_40:

  return v8;
}

- (id)getTimeRangesInAsset:(id)a3 forPersonLocalIdentifiers:(id)a4 withAnalysis:(id)a5
{
  uint64_t v27 = self;
  v42[1] = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v7 = a4;
  id v29 = a5;
  if ([v7 count])
  {
    id v31 = [MEMORY[0x1E4F1CA48] array];
    long long v8 = [v30 photoLibrary];
    uint64_t v9 = [v8 librarySpecificFetchOptions];

    id v28 = v9;
    [v9 setIncludeTorsoOnlyDetectionData:1];
    v42[0] = *MEMORY[0x1E4F39610];
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    [v9 setFetchPropertySets:v10];

    [v9 setIncludeMediaAnalysisProcessingRangeTypes:3];
    [MEMORY[0x1E4F39048] fetchFacesInAsset:v30 options:v9];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(obj);
          }
          BOOL v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v15 = objc_msgSend(v14, "personLocalIdentifier", v27);
          BOOL v16 = v15 == 0;

          if (!v16)
          {
            uint64_t v17 = [v14 personLocalIdentifier];
            double v18 = [v14 personLocalIdentifier];
            CFDictionaryRef v19 = [v18 componentsSeparatedByString:@"/"];

            if ([v19 count])
            {
              uint64_t v20 = [v19 firstObject];

              uint64_t v17 = (void *)v20;
            }
            float v21 = [v14 personLocalIdentifier];
            if ([v7 containsObject:v21])
            {

              goto LABEL_13;
            }
            char v22 = [v7 containsObject:v17];

            if (v22) {
LABEL_13:
            }
              [v31 addObject:v14];

            continue;
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v11);
    }

    if (![v31 count] && (int)MediaAnalysisLogLevel() >= 6)
    {
      Float64 v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = [v30 localIdentifier];
        *(_DWORD *)CMTimeRange buf = 138412546;
        id v38 = v7;
        __int16 v39 = 2112;
        long long v40 = v24;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_INFO, "MediaAnalyzer : no PHFaces found for persons %@ in asset %@", buf, 0x16u);
      }
    }
    BOOL v25 = -[VCPMediaAnalyzer getTimeRangesInAsset:forFaces:withAnalysis:](v27, "getTimeRangesInAsset:forFaces:withAnalysis:", v30, v31, v29, v27);
  }
  else
  {
    BOOL v25 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v25;
}

- (id)getTimeRangesInAsset:(id)a3 forFaces:(id)a4 withAnalysis:(id)a5
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v72 = a3;
  id v74 = a4;
  id v75 = a5;
  uint64_t v7 = [v74 count];
  id v8 = (id)MEMORY[0x1E4F1CBF0];
  if (v75 && v7)
  {
    uint64_t v73 = [MEMORY[0x1E4F1CA48] array];
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    obuint64_t j = v74;
    uint64_t v69 = [obj countByEnumeratingWithState:&v103 objects:v110 count:16];
    if (v69)
    {
      int v76 = 0;
      uint64_t v70 = *(void *)v104;
LABEL_5:
      uint64_t v77 = 0;
LABEL_6:
      if (*(void *)v104 != v70) {
        objc_enumerationMutation(obj);
      }
      double v82 = *(void **)(*((void *)&v103 + 1) + 8 * v77);
      if ([v82 detectionType] != 1) {
        goto LABEL_68;
      }
      [v82 fetchPropertySetsIfNeeded];
      uint64_t v9 = [v75 objectForKeyedSubscript:@"metadataRanges"];
      uint64_t v10 = [v9 objectForKeyedSubscript:@"FacePrintResults"];

      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id v79 = v10;
      uint64_t v11 = [v79 countByEnumeratingWithState:&v99 objects:v109 count:16];
      if (!v11)
      {
        long long v52 = v79;
        goto LABEL_66;
      }
      uint64_t v81 = *(void *)v100;
      int v78 = -1;
      float v12 = 1.0;
LABEL_11:
      uint64_t v80 = v11;
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v100 != v81) {
          objc_enumerationMutation(v79);
        }
        BOOL v14 = *(void **)(*((void *)&v99 + 1) + 8 * v13);
        id v15 = [v14 objectForKeyedSubscript:@"attributes"];
        long long v83 = [v15 objectForKeyedSubscript:@"facePrint"];

        BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v83 error:0];
        uint64_t v17 = [v16 decodeObjectOfClass:objc_opt_class() forKey:@"facePrint"];
        double v18 = [v82 faceClusteringProperties];
        CFDictionaryRef v19 = [v18 faceprint];
        uint64_t v20 = [v19 faceprintData];

        if (v20) {
          break;
        }
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          id v31 = VCPLogInstance();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v32 = [v82 localIdentifier];
            LODWORD(buf.start.value) = 138412290;
            *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v32;
            _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEFAULT, "MediaAnalyzer : Failed to get faceClusteringProperties.faceprint.faceprintData for face %@", (uint8_t *)&buf, 0xCu);
          }
        }

LABEL_31:
        if (v80 == ++v13)
        {
          uint64_t v11 = [v79 countByEnumeratingWithState:&v99 objects:v109 count:16];
          if (v11) {
            goto LABEL_11;
          }

          if (v12 >= 0.1) {
            goto LABEL_67;
          }
          long long v95 = 0u;
          long long v96 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          long long v34 = [v75 objectForKeyedSubscript:@"metadataRanges"];
          long long v35 = [v34 objectForKeyedSubscript:@"FaceResults"];

          uint64_t v36 = [v35 countByEnumeratingWithState:&v93 objects:v108 count:16];
          if (!v36) {
            goto LABEL_51;
          }
          uint64_t v37 = *(void *)v94;
          while (1)
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v94 != v37) {
                objc_enumerationMutation(v35);
              }
              __int16 v39 = *(void **)(*((void *)&v93 + 1) + 8 * i);
              long long v40 = [v39 objectForKeyedSubscript:@"attributes"];
              long long v41 = [v40 objectForKeyedSubscript:@"faceId"];
              BOOL v42 = v41 == 0;

              if (v42)
              {
                if ((int)MediaAnalysisLogLevel() < 5) {
                  continue;
                }
                long long v47 = VCPLogInstance();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  long long v50 = [v72 localIdentifier];
                  LODWORD(buf.start.value) = 138412290;
                  *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v50;
                  _os_log_impl(&dword_1BBEDA000, v47, OS_LOG_TYPE_DEFAULT, "MediaAnalyzer getTimeRangesInAsset : video faceID not available for asset %@", (uint8_t *)&buf, 0xCu);
                }
                goto LABEL_48;
              }
              long long v43 = [v39 objectForKeyedSubscript:@"attributes"];
              long long v44 = [v43 objectForKeyedSubscript:@"faceId"];
              int v45 = [v44 intValue];

              if (v45 == v78)
              {
                memset(&v92, 0, sizeof(v92));
                CMTimeRangeMakeFromDictionary(&v92, (CFDictionaryRef)v39);
                CMTimeRange buf = v92;
                CFDictionaryRef v46 = CMTimeRangeCopyAsDictionary(&buf, 0);
                [v73 addObject:v46];

                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  long long v47 = VCPLogInstance();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                  {
                    CMTime time = v92.start;
                    Float64 Seconds = CMTimeGetSeconds(&time);
                    CMTime duration = v92.duration;
                    Float64 v49 = CMTimeGetSeconds(&duration);
                    LODWORD(buf.start.value) = 134218240;
                    *(Float64 *)((char *)&buf.start.value + 4) = Seconds;
                    LOWORD(buf.start.flags) = 2048;
                    *(Float64 *)((char *)&buf.start.flags + 2) = v49;
                    _os_log_impl(&dword_1BBEDA000, v47, OS_LOG_TYPE_DEBUG, "[MediaAnalysis] metadata 1-up timeranges add person range : [%f,  %f]", (uint8_t *)&buf, 0x16u);
                  }
LABEL_48:

                  continue;
                }
              }
            }
            uint64_t v36 = [v35 countByEnumeratingWithState:&v93 objects:v108 count:16];
            if (!v36)
            {
LABEL_51:

              if ([(id)objc_opt_class() includeTorsoOnlyForOneUP])
              {
                long long v88 = 0u;
                long long v89 = 0u;
                long long v86 = 0u;
                long long v87 = 0u;
                long long v51 = [v75 objectForKeyedSubscript:@"metadataRanges"];
                long long v52 = [v51 objectForKeyedSubscript:@"TorsoResults"];

                uint64_t v53 = [v52 countByEnumeratingWithState:&v86 objects:v107 count:16];
                if (v53)
                {
                  uint64_t v54 = *(void *)v87;
                  do
                  {
                    for (uint64_t j = 0; j != v53; ++j)
                    {
                      if (*(void *)v87 != v54) {
                        objc_enumerationMutation(v52);
                      }
                      uint64_t v56 = *(void **)(*((void *)&v86 + 1) + 8 * j);
                      long long v57 = [v56 objectForKeyedSubscript:@"attributes"];
                      long long v58 = [v57 objectForKeyedSubscript:@"faceId"];
                      int v59 = [v58 intValue];

                      if (v59 == v78)
                      {
                        memset(&v92, 0, sizeof(v92));
                        CMTimeRangeMakeFromDictionary(&v92, (CFDictionaryRef)v56);
                        CMTimeRange buf = v92;
                        CFDictionaryRef v60 = CMTimeRangeCopyAsDictionary(&buf, 0);
                        [v73 addObject:v60];

                        if ((int)MediaAnalysisLogLevel() >= 7)
                        {
                          long long v61 = VCPLogInstance();
                          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
                          {
                            CMTime start = v92.start;
                            Float64 v62 = CMTimeGetSeconds(&start);
                            CMTime v84 = v92.duration;
                            Float64 v63 = CMTimeGetSeconds(&v84);
                            LODWORD(buf.start.value) = 134218240;
                            *(Float64 *)((char *)&buf.start.value + 4) = v62;
                            LOWORD(buf.start.flags) = 2048;
                            *(Float64 *)((char *)&buf.start.flags + 2) = v63;
                            _os_log_impl(&dword_1BBEDA000, v61, OS_LOG_TYPE_DEBUG, "[MediaAnalysis] metadata 1-up timeranges add torso range : [%f,  %f]", (uint8_t *)&buf, 0x16u);
                          }
                        }
                      }
                    }
                    uint64_t v53 = [v52 countByEnumeratingWithState:&v86 objects:v107 count:16];
                  }
                  while (v53);
                }
LABEL_66:
              }
LABEL_67:

LABEL_68:
              if (++v77 != v69) {
                goto LABEL_6;
              }
              uint64_t v69 = [obj countByEnumeratingWithState:&v103 objects:v110 count:16];
              if (!v69) {
                goto LABEL_78;
              }
              goto LABEL_5;
            }
          }
        }
      }
      id v21 = objc_alloc(MEMORY[0x1E4F45800]);
      id v98 = 0;
      char v22 = (void *)[v21 initWithState:v20 error:&v98];
      id v23 = v98;
      if (!v22)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v64 = VCPLogInstance();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            CMTime v65 = [v82 localIdentifier];
            LODWORD(buf.start.value) = 138412546;
            *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v65;
            LOWORD(buf.start.flags) = 2112;
            *(void *)((char *)&buf.start.flags + 2) = v23;
            _os_log_impl(&dword_1BBEDA000, v64, OS_LOG_TYPE_ERROR, "MediaAnalyzer : failed to initalize faceprint data for face: %@. Error: %@", (uint8_t *)&buf, 0x16u);
          }
        }

        int v66 = 0;
        BOOL v67 = v73;
        goto LABEL_81;
      }
      uint64_t v24 = [v22 faceprint];
      id v97 = v23;
      BOOL v25 = [v24 computeDistance:v17 withDistanceFunction:0 error:&v97];
      id v26 = v97;

      if (v25)
      {
        [v25 floatValue];
        float v28 = v27;
        if (v27 >= v12) {
          goto LABEL_30;
        }
        id v29 = [v14 objectForKeyedSubscript:@"attributes"];
        id v30 = [v29 objectForKeyedSubscript:@"faceId"];
        int v78 = [v30 intValue];

        float v12 = v28;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          int v76 = -18;
LABEL_30:

          if (!v25)
          {

            goto LABEL_78;
          }
          goto LABEL_31;
        }
        id v29 = VCPLogInstance();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          long long v33 = [v82 localIdentifier];
          LODWORD(buf.start.value) = 138412546;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v33;
          LOWORD(buf.start.flags) = 2112;
          *(void *)((char *)&buf.start.flags + 2) = v26;
          _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_ERROR, "MediaAnalyzer : failed to compute distance for face: %@. Error: %@", (uint8_t *)&buf, 0x16u);
        }
        int v76 = -18;
      }

      goto LABEL_30;
    }
    int v76 = 0;
LABEL_78:

    BOOL v67 = v73;
    if (v76) {
      int v66 = 0;
    }
    else {
      int v66 = v73;
    }
LABEL_81:
    id v8 = v66;
  }
  return v8;
}

- (id)getTimeRangesWithSearchResults:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  +[VCPFreeFormSearch getMinSimilarity];
  float v4 = v3;
  +[VCPFreeFormSearch getMinSimilarityHighRecall];
  float v6 = v5;
  +[VCPFreeFormSearch getMaxSimilarityDiffFor1UP];
  float v8 = v7;
  +[VCPFreeFormSearch getHighSimilarityThreshold];
  float v10 = v9;
  id v36 = [MEMORY[0x1E4F1CA48] array];
  memset(&v47, 0, sizeof(v47));
  if ([v35 count])
  {
    CFDictionaryRef v11 = [v35 lastObject];
    CMTimeRangeMakeFromDictionary(&range, v11);
    CMTimeRangeGetEnd(&v47, &range);
  }
  else
  {
    CMTime v47 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v12 = v35;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v43;
    float v15 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * i), "vcp_quality");
        *(float *)&double v17 = v17;
        float v15 = fmaxf(*(float *)&v17, v15);
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v13);
  }
  else
  {
    float v15 = 0.0;
  }

  if (v15 >= v4) {
    *(float *)&long long v18 = v4;
  }
  else {
    *(float *)&long long v18 = v6;
  }
  if (v15 >= *(float *)&v18)
  {
    unint64_t v20 = 0;
    float v21 = fmaxf(*(float *)&v18, v15 - v8);
    *(void *)&long long v18 = 134218496;
    long long v34 = v18;
    while (1)
    {
      if (objc_msgSend(v12, "count", v34) <= v20) {
        goto LABEL_17;
      }
      CFDictionaryRef v22 = [v12 objectAtIndexedSubscript:v20];
      memset(&v41, 0, sizeof(v41));
      CMTimeRangeMakeFromDictionary(&v41, v22);
      [(__CFDictionary *)v22 vcp_quality];
      float v24 = v23;
      if (v21 <= v24 || v10 < v24) {
        break;
      }
LABEL_35:

      ++v20;
    }
    memset(&v40, 0, sizeof(v40));
    CMTime lhs = v41.start;
    CMTime rhs = v41.duration;
    CMTimeAdd(&v40, &lhs, &rhs);
    if ([v12 count] - 1 > v20
      && (CMTimeMake(&v39, 1, 1),
          CMTime lhs = v47,
          CMTime rhs = v39,
          CMTimeSubtract(&v48, &lhs, &rhs),
          CMTime lhs = v40,
          CMTime rhs = v48,
          CMTimeCompare(&lhs, &rhs) < 0))
    {
      CMTimeMake(&v39, 1, 1);
      CMTime rhs = v40;
      CMTime v48 = v39;
      CMTimeAdd(&lhs, &rhs, &v48);
      CMTime v40 = lhs;
      if (!v20)
      {
LABEL_31:
        CMTime lhs = v40;
        CMTime rhs = v41.start;
        CMTimeSubtract(&v48, &lhs, &rhs);
        v41.CMTime duration = v48;
        v52[0] = @"start";
        CMTime lhs = v41.start;
        CFDictionaryRef v26 = CMTimeCopyAsDictionary(&lhs, 0);
        v53[0] = v26;
        v52[1] = @"duration";
        CMTime lhs = v41.duration;
        CFDictionaryRef v27 = CMTimeCopyAsDictionary(&lhs, 0);
        v53[1] = v27;
        v52[2] = @"quality";
        *(float *)&double v28 = v24;
        id v29 = [NSNumber numberWithFloat:v28];
        v53[2] = v29;
        id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
        [v36 addObject:v30];

        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          id v31 = VCPLogInstance();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            CMTime time = v41.start;
            Float64 Seconds = CMTimeGetSeconds(&time);
            CMTime duration = v41.duration;
            Float64 v33 = CMTimeGetSeconds(&duration);
            LODWORD(lhs.value) = v34;
            *(Float64 *)((char *)&lhs.value + 4) = Seconds;
            LOWORD(lhs.flags) = 2048;
            *(Float64 *)((char *)&lhs.flags + 2) = v33;
            HIWORD(lhs.epoch) = 2048;
            double v51 = v24;
            _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEBUG, "[MediaAnalysis] embedding 1-up timeranges, add [%f, %f], score %f", (uint8_t *)&lhs, 0x20u);
          }
        }
        goto LABEL_35;
      }
    }
    else if (!v20)
    {
      goto LABEL_31;
    }
    CMTimeMake(&v39, 1, 1);
    CMTime rhs = v41.start;
    CMTime v48 = v39;
    CMTimeSubtract(&lhs, &rhs, &v48);
    v41.CMTime start = lhs;
    goto LABEL_31;
  }
LABEL_17:

  return v36;
}

- (id)getAnalysisResultsForURLAsset:(id)a3
{
  float v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  return v3;
}

- (id)searchForQuery:(id)a3 forAssets:(id)a4 withOptions:(id)a5 matchingScoreOnly:(BOOL)a6 isURLAsset:(BOOL)a7 analyses:(id)a8
{
  BOOL v9 = a7;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v60 = a4;
  id v57 = a5;
  id v13 = a8;
  id v58 = v12;
  uint64_t v14 = [v13 count];
  if (v14 != [v60 count])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      os_log_t log = VCPLogInstance();
      if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
LABEL_9:
        id v20 = 0;
        uint64_t v55 = v58;
        goto LABEL_40;
      }
      *(_DWORD *)CMTimeRange buf = 134218240;
      *(void *)&uint8_t buf[4] = [v13 count];
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v60 count];
      BOOL v16 = "Analyses vs assets acount mismatch: %lu vs %lu";
      double v17 = log;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      uint32_t v19 = 22;
LABEL_8:
      _os_log_impl(&dword_1BBEDA000, v17, v18, v16, buf, v19);
      goto LABEL_9;
    }
LABEL_49:
    id v20 = 0;
    Float64 v49 = v58;
    goto LABEL_50;
  }
  if (v58 && [v58 length])
  {
    +[VCPTextEncoder convertFloat16ToFloat32:v58];
    v55 = float v15 = v58;
    goto LABEL_14;
  }
  float v21 = [v57 objectForKeyedSubscript:@"SearchQueryString"];

  if (!v21) {
    goto LABEL_49;
  }
  textEncoder = self->_textEncoder;
  if (!textEncoder)
  {
    double v23 = objc_alloc_init(VCPTextEncoder);
    float v24 = self->_textEncoder;
    self->_textEncoder = v23;

    textEncoder = self->_textEncoder;
    if (!textEncoder)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        double v51 = VCPLogInstance();
        os_log_t log = v51;
        if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_9;
        }
        *(_WORD *)CMTimeRange buf = 0;
        BOOL v16 = "Failed to create text encoder";
        double v17 = v51;
        os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
        uint32_t v19 = 2;
        goto LABEL_8;
      }
      goto LABEL_49;
    }
  }
  float v15 = [v57 objectForKeyedSubscript:@"SearchQueryString"];
  uint64_t v55 = [(VCPTextEncoder *)textEncoder textEmbeddingForQuery:v15 useFP16:0];

LABEL_14:
  if (self->_freeFormSearch
    || (BOOL v25 = objc_alloc_init(VCPFreeFormSearch),
        freeFormSearch = self->_freeFormSearch,
        self->_freeFormSearch = v25,
        freeFormSearch,
        self->_freeFormSearch))
  {
    os_log_t log = [MEMORY[0x1E4F1CA60] dictionary];
    unint64_t v27 = 0;
    *(void *)&long long v28 = 138412290;
    long long v53 = v28;
    while (1)
    {
      if (objc_msgSend(v13, "count", v53) <= v27)
      {
        long long v43 = [v57 objectForKeyedSubscript:@"MaxSearchResults"];
        if (v43)
        {
          long long v44 = [v57 objectForKeyedSubscript:@"MaxSearchResults"];
          int v45 = [v44 intValue];
        }
        else
        {
          int v45 = -1;
        }

        *(void *)CMTimeRange buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        long long v68 = __Block_byref_object_copy__42;
        uint64_t v69 = __Block_byref_object_dispose__42;
        id v70 = 0;
        CFDictionaryRef v46 = [log allKeys];
        BOOL v47 = [v46 count] == 0;

        if (!v47)
        {
          searchQueue = self->_searchQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __95__VCPMediaAnalyzer_searchForQuery_forAssets_withOptions_matchingScoreOnly_isURLAsset_analyses___block_invoke;
          block[3] = &unk_1E629BC58;
          void block[4] = self;
          Float64 v62 = log;
          uint64_t v64 = buf;
          id v63 = v55;
          BOOL v66 = a6;
          int v65 = v45;
          dispatch_sync(searchQueue, block);
        }
        id v20 = *(id *)(*(void *)&buf[8] + 40);
        _Block_object_dispose(buf, 8);

        goto LABEL_40;
      }
      if (v9)
      {
        id v29 = [v13 objectAtIndexedSubscript:v27];
      }
      else
      {
        uint64_t v30 = [v13 objectAtIndexedSubscript:v27];
        id v29 = objc_msgSend((id)v30, "vcp_results");

        id v31 = [v13 objectAtIndexedSubscript:v27];
        LOBYTE(v30) = (int)objc_msgSend(v31, "vcp_version") < 64;

        if (v30) {
          goto LABEL_30;
        }
      }
      if (+[VCPMovieAnalyzer enableAudioVideoFusion])
      {
        if (+[MADEmbeddingStore includeAudioFusedVideoEmbeddings])
        {
          uint64_t v32 = [v29 objectForKeyedSubscript:@"AudioFusedVideoEmbeddingResults"];
          BOOL v33 = v32 == 0;

          if (!v33) {
            break;
          }
        }
      }
      id v36 = [v29 objectForKeyedSubscript:@"VideoEmbeddingResults"];
      BOOL v37 = v36 == 0;

      if (!v37)
      {
        long long v34 = [v29 objectForKeyedSubscript:@"VideoEmbeddingResults"];
        id v38 = [v60 objectAtIndexedSubscript:v27];
        [log setObject:v34 forKeyedSubscript:v38];

        goto LABEL_29;
      }
      CMTime v39 = [v29 objectForKeyedSubscript:@"ImageEmbeddingResults"];
      BOOL v40 = v39 == 0;

      if (!v40)
      {
        long long v34 = [v29 objectForKeyedSubscript:@"ImageEmbeddingResults"];
        CMTimeRange v41 = [v60 objectAtIndexedSubscript:v27];
        [log setObject:v34 forKeyedSubscript:v41];

        goto LABEL_29;
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        long long v34 = VCPLogInstance();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          long long v42 = [v60 objectAtIndexedSubscript:v27];
          *(_DWORD *)CMTimeRange buf = v53;
          *(void *)&uint8_t buf[4] = v42;
          _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_DEFAULT, "searchForQuery : missing embedding results for asset %@", buf, 0xCu);
        }
        goto LABEL_29;
      }
LABEL_30:

      ++v27;
    }
    long long v34 = [v29 objectForKeyedSubscript:@"AudioFusedVideoEmbeddingResults"];
    id v35 = [v60 objectAtIndexedSubscript:v27];
    [log setObject:v34 forKeyedSubscript:v35];

LABEL_29:
    goto LABEL_30;
  }
  if ((int)MediaAnalysisLogLevel() < 4)
  {
    id v20 = 0;
  }
  else
  {
    long long v50 = VCPLogInstance();
    os_log_t log = v50;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_DEFAULT, "Failed to initialize search", buf, 2u);
    }
    id v20 = 0;
LABEL_40:
  }
  Float64 v49 = v55;
LABEL_50:

  return v20;
}

void __95__VCPMediaAnalyzer_searchForQuery_forAssets_withOptions_matchingScoreOnly_isURLAsset_analyses___block_invoke(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 128) loadEmbeddings:*(void *)(a1 + 40)])
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 128) searchForQuery:*(void *)(a1 + 48) matchingScoreOnly:*(unsigned __int8 *)(a1 + 68) topK:*(unsigned int *)(a1 + 64)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    float v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (id)loadAssetsFromPhotoLibrary:(id)a3 withAssetIdentifiers:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  float v7 = a4;
  id v8 = v6;
  BOOL v9 = v8;
  if (!v8)
  {
    BOOL v9 = objc_msgSend(MEMORY[0x1E4F39220], "vcp_defaultPhotoLibrary");
  }
  float v10 = v7;
  double v23 = v9;
  if (v7)
  {
LABEL_6:
    id v13 = objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_fetchOptionsForLibrary:forTaskID:", v9, 1);
    uint64_t v14 = [MEMORY[0x1E4F38EC0] fetchAssetsWithLocalIdentifiers:v10 options:v13];
    if ([v14 count])
    {
      float v15 = [MEMORY[0x1E4F1CA48] array];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      BOOL v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v25 != v18) {
              objc_enumerationMutation(v16);
            }
            [v15 addObject:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v17);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        float v15 = 0;
        goto LABEL_20;
      }
      BOOL v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "[MediaAnalysis] No available assets for search", buf, 2u);
      }
      float v15 = 0;
    }

LABEL_20:
LABEL_21:

    goto LABEL_22;
  }
  CFDictionaryRef v11 = [(VCPMediaAnalyzer *)self _databaseForPhotoLibrary:v9];
  id v12 = v11;
  if (v11)
  {
    float v10 = [v11 queryAssetsAnalyzedSince:0];

    goto LABEL_6;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    float v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      float v21 = [v9 photoLibraryURL];
      CFDictionaryRef v22 = [v21 path];
      *(_DWORD *)CMTimeRange buf = 138412290;
      uint64_t v30 = v22;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to obtain database for Photo Library (%@)", buf, 0xCu);
    }
    float v15 = 0;
    goto LABEL_21;
  }
  float v15 = 0;
LABEL_22:

  return v15;
}

- (id)requestSearchResultsForAssets:(id)a3 forPhotoLibraryURL:(id)a4 withQueryEmbeddings:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = -[VCPMediaAnalyzer requestSearchResultsForAssets:forPhotoLibraryURL:withQueryEmbeddings:matchingScoreOnly:options:](self, "requestSearchResultsForAssets:forPhotoLibraryURL:withQueryEmbeddings:matchingScoreOnly:options:", v10, v11, v12, [v10 count] == 1, v13);

  return v14;
}

- (id)requestSearchResultsForAssets:(id)a3 forPhotoLibraryURL:(id)a4 withQueryEmbeddings:(id)a5 matchingScoreOnly:(BOOL)a6 options:(id)a7
{
  BOOL v8 = a6;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v43 = a7;
  CMTime v39 = v12;
  BOOL v40 = v13;
  CMTimeRange v41 = v14;
  long long v42 = [MEMORY[0x1E4F1C9E8] dictionary];
  if ([v14 count]
    || ([v43 objectForKeyedSubscript:@"SearchQueryString"],
        float v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v15))
  {
    if ([v12 count])
    {
      uint64_t v36 = [v12 mutableCopy];
      objc_msgSend(MEMORY[0x1E4F1CA48], "array", v36);
    }
    else
    {
      if (v13)
      {
        uint64_t v16 = [objc_alloc(MEMORY[0x1E4F39220]) initWithPhotoLibraryURL:v13];
      }
      else
      {
        uint64_t v16 = objc_msgSend(MEMORY[0x1E4F39220], "vcp_defaultPhotoLibrary");
      }
      uint32_t v19 = (void *)v16;
      id v20 = [(VCPMediaAnalyzer *)self loadAssetsFromPhotoLibrary:v16 withAssetIdentifiers:0];
      uint64_t v38 = [v20 mutableCopy];

      objc_msgSend(MEMORY[0x1E4F1CA48], "array", v38);
    float v21 = };
    BOOL v22 = v8;
    double v23 = [MEMORY[0x1E4F1CA48] array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v17 = v37;
    uint64_t v24 = [v17 countByEnumeratingWithState:&v44 objects:v51 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v45 != v25) {
            objc_enumerationMutation(v17);
          }
          long long v27 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          long long v28 = [v27 localIdentifier];
          BOOL v29 = v28 == 0;

          if (!v29)
          {
            uint64_t v30 = [v27 localIdentifier];
            [v23 addObject:v30];
          }
        }
        uint64_t v24 = [v17 countByEnumeratingWithState:&v44 objects:v51 count:16];
      }
      while (v24);
    }

    Float64 v49 = @"AllowOnDemand";
    uint64_t v50 = MEMORY[0x1E4F1CC28];
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    int v32 = [(VCPMediaAnalyzer *)self requestAnalysisTypes:0x1080000000000 forAssets:v17 withOptions:v31 andProgressHandler:0 cancelBlock:&__block_literal_global_834 analyses:v21];

    if (v32)
    {
      BOOL v33 = 0;
    }
    else
    {
      long long v34 = [v41 firstObject];
      BOOL v33 = [(VCPMediaAnalyzer *)self searchForQuery:v34 forAssets:v23 withOptions:v43 matchingScoreOnly:v22 isURLAsset:0 analyses:v21];

      long long v42 = v33;
    }
    id v18 = v33;

LABEL_26:
    goto LABEL_27;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v17 = VCPLogInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEFAULT, "[FreeFromSearch] No query input for search", buf, 2u);
    }
    id v18 = 0;
    goto LABEL_26;
  }
  id v18 = 0;
LABEL_27:

  return v18;
}

uint64_t __115__VCPMediaAnalyzer_requestSearchResultsForAssets_forPhotoLibraryURL_withQueryEmbeddings_matchingScoreOnly_options___block_invoke()
{
  return 0;
}

- (id)findTimeRangesFor:(id)a3 inAsset:(id)a4 withOptions:(id)a5 results:(id)a6 andError:(id *)a7
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v98 = a5;
  id v99 = a6;
  long long v86 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  obuint64_t j = v11;
  uint64_t v13 = 0;
  uint64_t v14 = [obj countByEnumeratingWithState:&v112 objects:v131 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v113;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v113 != v15) {
          objc_enumerationMutation(obj);
        }
        int v17 = [*(id *)(*((void *)&v112 + 1) + 8 * i) intValue];
        uint64_t v18 = v17;
        switch(v17)
        {
          case 1:
            v13 |= 8uLL;
            break;
          case 2:
            v13 |= 0x4000uLL;
            break;
          case 3:
            v13 |= 0x40000000uLL;
            break;
          case 4:
            v13 |= 0x200010uLL;
            break;
          case 5:
            v13 |= 0x1080000000000uLL;
            break;
          default:
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              uint32_t v19 = VCPLogInstance();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)CMTimeRange buf = 134217984;
                uint64_t v120 = v18;
                _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEFAULT, "Unknown query type %ld", buf, 0xCu);
              }
            }
            break;
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v112 objects:v131 count:16];
    }
    while (v14);
  }

  id v20 = [v98 objectForKeyedSubscript:@"SearchQueryString"];
  BOOL v21 = v20 == 0;

  if (v21) {
    uint64_t v22 = v13;
  }
  else {
    uint64_t v22 = v13 | 0x1080000000000;
  }
  if (!v22) {
    goto LABEL_79;
  }
  if (![v99 count])
  {
    id v79 = +[VCPMediaAnalyzer sharedMediaAnalyzer];
    id v130 = v12;
    uint64_t v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:1];
    uint64_t v81 = [v79 requestAnalysis:v22 forAssets:v80 withOptions:0 andProgressHandler:0 andError:a7];

    id v99 = v81;
    if (*a7 || ![v81 count])
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        double v82 = VCPLogInstance();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
        {
          long long v83 = [v12 localIdentifier];
          *(_DWORD *)CMTimeRange buf = 138412290;
          uint64_t v120 = (uint64_t)v83;
          _os_log_impl(&dword_1BBEDA000, v82, OS_LOG_TYPE_ERROR, "MediaAnalyzer failed to get results for asset %@", buf, 0xCu);
        }
      }
LABEL_79:
      int v78 = 0;
      goto LABEL_80;
    }
  }
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v89 = obj;
  uint64_t v88 = [v89 countByEnumeratingWithState:&v108 objects:v129 count:16];
  if (v88)
  {
    uint64_t v87 = *(void *)v109;
    *(void *)&long long v23 = 134218754;
    long long v85 = v23;
    do
    {
      for (uint64_t j = 0; j != v88; ++j)
      {
        if (*(void *)v109 != v87) {
          objc_enumerationMutation(v89);
        }
        uint64_t v24 = *(void **)(*((void *)&v108 + 1) + 8 * j);
        int v25 = objc_msgSend(v24, "intValue", v85);
        uint64_t v26 = v25;
        switch(v25)
        {
          case 1:
            long long v27 = [v89 objectForKeyedSubscript:v24];
            long long v28 = [v99 firstObject];
            id v97 = [(VCPMediaAnalyzer *)self getTimeRangesInAsset:v12 forPersonLocalIdentifiers:v27 withAnalysis:v28];

            if (v97)
            {
              BOOL v29 = [NSNumber numberWithInteger:1];
              uint64_t v30 = [v29 stringValue];
              [v86 setObject:v97 forKeyedSubscript:v30];
            }
            goto LABEL_66;
          case 2:
            uint64_t v55 = [v89 objectForKeyedSubscript:v24];
            uint64_t v56 = [v99 firstObject];
            id v57 = [v56 objectForKeyedSubscript:@"metadataRanges"];
            id v97 = [(VCPMediaAnalyzer *)self getTimeRangesForSceneIdentifiers:v55 withResults:v57];

            if (v97)
            {
              id v58 = [NSNumber numberWithInteger:2];
              int v59 = [v58 stringValue];
              [v86 setObject:v97 forKeyedSubscript:v59];
            }
            goto LABEL_66;
          case 3:
            uint64_t v31 = [v89 objectForKeyedSubscript:v24];
            int v32 = [v99 firstObject];
            BOOL v33 = [v32 objectForKeyedSubscript:@"metadataRanges"];
            id v97 = [(VCPMediaAnalyzer *)self getTimeRangesForActionIDs:v31 withResults:v33];

            if (v97)
            {
              long long v34 = [NSNumber numberWithInteger:3];
              id v35 = [v34 stringValue];
              [v86 setObject:v97 forKeyedSubscript:v35];
            }
            goto LABEL_66;
          case 4:
            uint64_t v36 = [v89 objectForKeyedSubscript:v24];
            BOOL v37 = [v99 firstObject];
            uint64_t v38 = [v37 objectForKeyedSubscript:@"metadataRanges"];
            id v97 = [(VCPMediaAnalyzer *)self getTimeRangesForSoundIdentifiers:v36 withResults:v38];

            if (v97)
            {
              CMTime v39 = [NSNumber numberWithInteger:4];
              BOOL v40 = [v39 stringValue];
              [v86 setObject:v97 forKeyedSubscript:v40];
            }
            goto LABEL_66;
          case 5:
            id v97 = [MEMORY[0x1E4F1CA48] array];
            long long v106 = 0u;
            long long v107 = 0u;
            long long v104 = 0u;
            long long v105 = 0u;
            id v90 = [v89 objectForKeyedSubscript:v24];
            uint64_t v93 = [v90 countByEnumeratingWithState:&v104 objects:v128 count:16];
            if (!v93) {
              goto LABEL_65;
            }
            uint64_t v92 = *(void *)v105;
            break;
          default:
            if ((int)MediaAnalysisLogLevel() < 4) {
              continue;
            }
            uint64_t v54 = VCPLogInstance();
            id v97 = v54;
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CMTimeRange buf = 134217984;
              uint64_t v120 = v26;
              _os_log_impl(&dword_1BBEDA000, v54, OS_LOG_TYPE_DEFAULT, "Unknown query type %ld", buf, 0xCu);
            }
            goto LABEL_66;
        }
        while (2)
        {
          for (uint64_t k = 0; k != v93; ++k)
          {
            if (*(void *)v105 != v92) {
              objc_enumerationMutation(v90);
            }
            CMTimeRange v41 = *(void **)(*((void *)&v104 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v42 = [v41 vectors];
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if ((int)MediaAnalysisLogLevel() >= 4)
                {
                  id v60 = VCPLogInstance();
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                  {
                    long long v61 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v61);
                    id v62 = (id)objc_claimAutoreleasedReturnValue();
                    id v63 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v63);
                    id v64 = (id)objc_claimAutoreleasedReturnValue();
                    int v65 = (objc_class *)objc_opt_class();
                    BOOL v66 = NSStringFromClass(v65);
                    *(_DWORD *)CMTimeRange buf = v85;
                    uint64_t v120 = 5;
                    __int16 v121 = 2112;
                    id v122 = v62;
                    __int16 v123 = 2112;
                    id v124 = v64;
                    __int16 v125 = 2112;
                    unint64_t v126 = v66;
                    _os_log_impl(&dword_1BBEDA000, v60, OS_LOG_TYPE_DEFAULT, "Mismatch data type for query %ld, skip. Expect %@ or %@. Got %@", buf, 0x2Au);
                  }
                }
                goto LABEL_65;
              }
              int v127 = v41;
              long long v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v127 count:1];
            }
            long long v102 = 0u;
            long long v103 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            id v43 = v42;
            uint64_t v44 = [v43 countByEnumeratingWithState:&v100 objects:v118 count:16];
            if (v44)
            {
              uint64_t v45 = *(void *)v101;
              do
              {
                for (uint64_t m = 0; m != v44; ++m)
                {
                  if (*(void *)v101 != v45) {
                    objc_enumerationMutation(v43);
                  }
                  uint64_t v47 = *(void *)(*((void *)&v100 + 1) + 8 * m);
                  CMTime v48 = [v12 localIdentifier];
                  v117 = v48;
                  Float64 v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1];
                  uint64_t v50 = [(VCPMediaAnalyzer *)self searchForQuery:v47 forAssets:v49 withOptions:v98 matchingScoreOnly:1 isURLAsset:0 analyses:v99];

                  double v51 = [v12 localIdentifier];
                  uint64_t v52 = [v50 objectForKeyedSubscript:v51];
                  long long v53 = [(VCPMediaAnalyzer *)self getTimeRangesWithSearchResults:v52];

                  if (v53) {
                    [v97 addObjectsFromArray:v53];
                  }
                }
                uint64_t v44 = [v43 countByEnumeratingWithState:&v100 objects:v118 count:16];
              }
              while (v44);
            }
          }
          uint64_t v93 = [v90 countByEnumeratingWithState:&v104 objects:v128 count:16];
          if (v93) {
            continue;
          }
          break;
        }
LABEL_65:

        BOOL v67 = [NSNumber numberWithInteger:5];
        long long v68 = [v67 stringValue];
        [v86 setObject:v97 forKeyedSubscript:v68];

LABEL_66:
      }
      uint64_t v88 = [v89 countByEnumeratingWithState:&v108 objects:v129 count:16];
    }
    while (v88);
  }

  uint64_t v69 = [v98 objectForKeyedSubscript:@"SearchQueryString"];
  BOOL v70 = v69 == 0;

  if (!v70)
  {
    uint64_t v71 = [v12 localIdentifier];
    uint64_t v116 = v71;
    id v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
    uint64_t v73 = [(VCPMediaAnalyzer *)self searchForQuery:0 forAssets:v72 withOptions:v98 matchingScoreOnly:1 isURLAsset:0 analyses:v99];

    id v74 = [v12 localIdentifier];
    id v75 = [v73 objectForKeyedSubscript:v74];
    int v76 = [(VCPMediaAnalyzer *)self getTimeRangesWithSearchResults:v75];

    if (v76)
    {
      uint64_t v77 = [&unk_1F15ED758 stringValue];
      [v86 setObject:v76 forKeyedSubscript:v77];
    }
  }
  int v78 = [(VCPMediaAnalyzer *)self postProcessTimeRanges:v86 options:v98];
LABEL_80:

  return v78;
}

- (int)findTimeRangesFor:(id)a3 inAsset:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = (void (**)(void, double))a6;
  id v16 = a7;
  if (v12 && v13 && ([v13 isVideo] & 1) != 0)
  {
    int add = atomic_fetch_add(&self->_nextRequestID.__a_.__a_value, 1u);
    if (v15) {
      v15[2](v15, 0.0);
    }
    uint64_t v18 = dispatch_get_global_queue(0, 0);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __98__VCPMediaAnalyzer_findTimeRangesFor_inAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke;
    v20[3] = &unk_1E629BC80;
    v20[4] = self;
    id v21 = v12;
    id v22 = v13;
    id v23 = v14;
    uint64_t v24 = v15;
    id v25 = v16;
    dispatch_async(v18, v20);
  }
  else
  {
    (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
    int add = -1;
  }

  return add;
}

void __98__VCPMediaAnalyzer_findTimeRangesFor_inAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke(void *a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  BOOL v29 = a1;
  uint64_t v5 = a1[7];
  id v44 = 0;
  uint64_t v30 = [v2 findTimeRangesFor:v3 inAsset:v4 withOptions:v5 results:0 andError:&v44];
  id v31 = v44;
  if (![v30 count] && (int)MediaAnalysisLogLevel() >= 6)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      float v7 = [(id)v29[6] localIdentifier];
      *(_DWORD *)CMTimeRange buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "No matching timeranges found for asset %@", buf, 0xCu);
    }
  }
  uint64_t v8 = v29[8];
  if (v8) {
    (*(void (**)(double))(v8 + 16))(100.0);
  }
  if (v31 || ![v30 count])
  {
    (*(void (**)(void))(v29[9] + 16))();
  }
  else
  {
    BOOL v9 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v10 = v30;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v53 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = (void *)MEMORY[0x1E4F29238];
          CMTimeRangeMakeFromDictionary(&v39, *(CFDictionaryRef *)(*((void *)&v40 + 1) + 8 * i));
          uint64_t v15 = [v14 valueWithCMTimeRange:&v39];
          [v9 addObject:v15];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v53 count:16];
      }
      while (v11);
    }

    id v16 = (void *)v29[4];
    int v17 = [(id)v29[7] objectForKeyedSubscript:@"MinTimeRangeGap"];
    long long v28 = [v16 mergeTimeRanges:v9 mergeGap:v17];

    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint32_t v19 = objc_msgSend((id)v29[6], "localIdentifier", v28);
        *(_DWORD *)CMTimeRange buf = 138412290;
        *(void *)&uint8_t buf[4] = v19;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_INFO, "MediaAnalysis findTimeRanges for asset %@", buf, 0xCu);
      }
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v20 = v28;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v52 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            id v25 = VCPLogInstance();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              if (v24)
              {
                [v24 CMTimeRangeValue];
              }
              else
              {
                long long v46 = 0u;
                long long v47 = 0u;
                *(_OWORD *)CMTimeRange buf = 0u;
              }
              *(_OWORD *)&time.value = *(_OWORD *)buf;
              time.epoch = v46;
              Float64 Seconds = CMTimeGetSeconds(&time);
              if (v24) {
                [v24 CMTimeRangeValue];
              }
              else {
                memset(v32, 0, sizeof(v32));
              }
              CMTime v33 = *(CMTime *)&v32[1];
              Float64 v27 = CMTimeGetSeconds(&v33);
              *(_DWORD *)CMTime v48 = 134218240;
              Float64 v49 = Seconds;
              __int16 v50 = 2048;
              Float64 v51 = v27;
              _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_INFO, "[%f, %f]", v48, 0x16u);
            }
          }
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v52 count:16];
      }
      while (v21);
    }

    (*(void (**)(void))(v29[9] + 16))();
  }
}

- (int)findTimeRangesFor:(id)a3 inURLAsset:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v41 = a5;
  long long v43 = (void (**)(double))a6;
  id v14 = a7;
  long long v42 = v12;
  long long v40 = v13;
  if (v12 && v13)
  {
    long long v38 = self;
    CMTimeRange v39 = v14;
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CMTimeRange buf = 138412546;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_INFO, "[MediaAnalysis] Received timeRange request for asset: %@ with query: %@", buf, 0x16u);
      }
    }
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v16 = v12;
    uint64_t v17 = 0;
    uint64_t v18 = [v16 countByEnumeratingWithState:&v68 objects:v76 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v69 != v19) {
            objc_enumerationMutation(v16);
          }
          int v21 = objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * i), "intValue", v38);
          uint64_t v22 = v21;
          switch(v21)
          {
            case 1:
              v17 |= 8uLL;
              break;
            case 2:
              v17 |= 0x4000uLL;
              break;
            case 3:
              v17 |= 0x40000000uLL;
              break;
            case 4:
              v17 |= 0x200010uLL;
              break;
            case 5:
              v17 |= 0x1080000000000uLL;
              break;
            default:
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                id v23 = VCPLogInstance();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)CMTimeRange buf = 134217984;
                  *(void *)&uint8_t buf[4] = v22;
                  _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEFAULT, "Unknown query type %ld", buf, 0xCu);
                }
              }
              break;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v68 objects:v76 count:16];
      }
      while (v18);
    }

    if (v43) {
      v43[2](0.0);
    }
    *(void *)CMTimeRange buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v73 = __Block_byref_object_copy__42;
    id v74 = __Block_byref_object_dispose__42;
    id v75 = 0;
    v66[0] = 0;
    v66[1] = v66;
    void v66[2] = 0x3032000000;
    v66[3] = __Block_byref_object_copy__42;
    v66[4] = __Block_byref_object_dispose__42;
    id v67 = 0;
    dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E629BCA8;
    int v65 = buf;
    id v25 = v24;
    id v64 = v25;
    uint64_t v26 = _Block_copy(aBlock);
    int add = atomic_fetch_add(&v38->_nextRequestID.__a_.__a_value, 1u);
    long long v28 = objc_alloc_init(VCPCancelToken);
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke_2;
    v61[3] = &unk_1E6297060;
    BOOL v29 = v28;
    id v62 = v29;
    uint64_t v30 = _Block_copy(v61);
    cancelQueue = v38->_cancelQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke_3;
    block[3] = &unk_1E629BC08;
    int v60 = add;
    void block[4] = v38;
    int v59 = v29;
    id v44 = v29;
    dispatch_sync(cancelQueue, block);
    int v32 = dispatch_get_global_queue(0, 0);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke_4;
    v45[3] = &unk_1E629BCD0;
    uint64_t v54 = buf;
    v45[4] = v38;
    id v46 = v40;
    id v50 = v26;
    id v51 = v30;
    id v47 = v41;
    CMTime v48 = v25;
    uint64_t v55 = v66;
    uint64_t v56 = v17;
    id v49 = v16;
    uint64_t v52 = v43;
    id v53 = v39;
    int v57 = add;
    CMTime v33 = v25;
    id v34 = v30;
    id v35 = v26;
    dispatch_async(v32, v45);

    _Block_object_dispose(v66, 8);
    _Block_object_dispose(buf, 8);

    id v14 = v39;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      long long v36 = VCPLogInstance();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer findTimeRangesFor:inURLAsset] call with nil queries or resourceURL", buf, 2u);
      }
    }
    (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
    int add = -1;
  }

  return add;
}

void __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    float v7 = (FILE *)*MEMORY[0x1E4F143C8];
    id v8 = [v5 description];
    fprintf(v7, "[ERROR] Analyze file failed (%s)\n", (const char *)[v8 UTF8String]);
  }
  uint64_t v9 = [v12 objectForKeyedSubscript:@"metadataRanges"];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) isCanceled];
}

void __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 112);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1);
}

void __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke_4(uint64_t a1)
{
  v128[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) getAnalysisResultsForURLAsset:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 104) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
  if (!v5 || ![v5 count])
  {
    id v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"AllowOnDemand"];
    if (v6)
    {
      float v7 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"AllowOnDemand"];
      int v8 = [v7 BOOLValue];

      if (v8)
      {
        v128[0] = *(void *)(a1 + 40);
        uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:1];
        uint64_t v10 = +[VCPFullAnalysisURLProcessingTask taskForURLAsset:v9 withOptions:*(void *)(a1 + 48) analysisTypes:*(void *)(a1 + 120) progressHandler:0 completionHandler:*(void *)(a1 + 72)];

        [v10 runWithCancelBlock:*(void *)(a1 + 80)];
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);
      }
    }
  }
  int v76 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)
    || ![*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) count])
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_61;
    }
    uint64_t v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer searchFor:inURLAsset] analysis failed", buf, 2u);
    }
  }
  else
  {
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    obuint64_t j = *(id *)(a1 + 64);
    uint64_t v78 = [obj countByEnumeratingWithState:&v110 objects:v127 count:16];
    if (v78)
    {
      uint64_t v77 = *(void *)v111;
      do
      {
        for (uint64_t i = 0; i != v78; ++i)
        {
          if (*(void *)v111 != v77) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v110 + 1) + 8 * i);
          int v13 = [v12 intValue];
          uint64_t v14 = v13;
          switch(v13)
          {
            case 1:
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                uint64_t v15 = VCPLogInstance();
                long long v86 = v15;
                if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_56;
                }
                *(_DWORD *)CMTimeRange buf = 134217984;
                *(void *)&uint8_t buf[4] = 1;
                id v16 = v15;
                uint64_t v17 = "Query type not supported as of now (%ld)";
                goto LABEL_23;
              }
              continue;
            case 2:
              uint64_t v19 = *(void **)(a1 + 32);
              id v20 = [*(id *)(a1 + 64) objectForKeyedSubscript:v12];
              long long v86 = [v19 getTimeRangesForSceneIdentifiers:v20 withResults:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];

              if (v86)
              {
                int v21 = [NSNumber numberWithInteger:2];
                uint64_t v22 = [v21 stringValue];
                [v76 setObject:v86 forKeyedSubscript:v22];
              }
              goto LABEL_56;
            case 3:
              id v23 = *(void **)(a1 + 32);
              dispatch_semaphore_t v24 = [*(id *)(a1 + 64) objectForKeyedSubscript:v12];
              long long v86 = [v23 getTimeRangesForActionIDs:v24 withResults:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];

              if (v86)
              {
                id v25 = [NSNumber numberWithInteger:3];
                uint64_t v26 = [v25 stringValue];
                [v76 setObject:v86 forKeyedSubscript:v26];
              }
              goto LABEL_56;
            case 4:
              Float64 v27 = *(void **)(a1 + 32);
              long long v28 = [*(id *)(a1 + 64) objectForKeyedSubscript:v12];
              long long v86 = [v27 getTimeRangesForSoundIdentifiers:v28 withResults:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];

              if (v86)
              {
                BOOL v29 = [NSNumber numberWithInteger:4];
                uint64_t v30 = [v29 stringValue];
                [v76 setObject:v86 forKeyedSubscript:v30];
              }
              goto LABEL_56;
            case 5:
              long long v86 = [MEMORY[0x1E4F1CA48] array];
              long long v108 = 0u;
              long long v109 = 0u;
              long long v106 = 0u;
              long long v107 = 0u;
              id v79 = [*(id *)(a1 + 64) objectForKeyedSubscript:v12];
              uint64_t v82 = [v79 countByEnumeratingWithState:&v106 objects:v126 count:16];
              if (!v82) {
                goto LABEL_55;
              }
              uint64_t v81 = *(void *)v107;
              break;
            default:
              if ((int)MediaAnalysisLogLevel() < 4) {
                continue;
              }
              uint64_t v18 = VCPLogInstance();
              long long v86 = v18;
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)CMTimeRange buf = 134217984;
                *(void *)&uint8_t buf[4] = v14;
                id v16 = v18;
                uint64_t v17 = "Unknown query type %ld";
LABEL_23:
                _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
              }
              goto LABEL_56;
          }
          while (2)
          {
            for (uint64_t j = 0; j != v82; ++j)
            {
              if (*(void *)v107 != v81) {
                objc_enumerationMutation(v79);
              }
              id v31 = *(void **)(*((void *)&v106 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v32 = [v31 vectors];
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if ((int)MediaAnalysisLogLevel() >= 4)
                  {
                    id v46 = VCPLogInstance();
                    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                    {
                      id v47 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v47);
                      id v48 = (id)objc_claimAutoreleasedReturnValue();
                      id v49 = (objc_class *)objc_opt_class();
                      id v50 = NSStringFromClass(v49);
                      *(_DWORD *)CMTimeRange buf = 134218498;
                      *(void *)&uint8_t buf[4] = 5;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v48;
                      *(_WORD *)&buf[22] = 2112;
                      *(void *)&unsigned char buf[24] = v50;
                      _os_log_impl(&dword_1BBEDA000, v46, OS_LOG_TYPE_DEFAULT, "Mismatch data type for query %ld, skip. Expect %@ or %@", buf, 0x20u);
                    }
                  }
                  goto LABEL_55;
                }
                __int16 v125 = v31;
                int v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v125 count:1];
              }
              long long v104 = 0u;
              long long v105 = 0u;
              long long v102 = 0u;
              long long v103 = 0u;
              id v84 = v32;
              uint64_t v33 = [v84 countByEnumeratingWithState:&v102 objects:v124 count:16];
              if (v33)
              {
                uint64_t v34 = *(void *)v103;
                do
                {
                  for (uint64_t k = 0; k != v33; ++k)
                  {
                    if (*(void *)v103 != v34) {
                      objc_enumerationMutation(v84);
                    }
                    uint64_t v36 = *(void *)(*((void *)&v102 + 1) + 8 * k);
                    long long v37 = [NSString stringWithFormat:@"%@", *(void *)(a1 + 40)];
                    long long v38 = *(void **)(a1 + 32);
                    __int16 v123 = v37;
                    CMTimeRange v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v123 count:1];
                    uint64_t v40 = *(void *)(a1 + 48);
                    uint64_t v122 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
                    id v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v122 count:1];
                    long long v42 = [v38 searchForQuery:v36 forAssets:v39 withOptions:v40 matchingScoreOnly:1 isURLAsset:1 analyses:v41];

                    long long v43 = *(void **)(a1 + 32);
                    id v44 = [v42 objectForKeyedSubscript:v37];
                    uint64_t v45 = [v43 getTimeRangesWithSearchResults:v44];

                    if (v45) {
                      [v86 addObjectsFromArray:v45];
                    }
                  }
                  uint64_t v33 = [v84 countByEnumeratingWithState:&v102 objects:v124 count:16];
                }
                while (v33);
              }
            }
            uint64_t v82 = [v79 countByEnumeratingWithState:&v106 objects:v126 count:16];
            if (v82) {
              continue;
            }
            break;
          }
LABEL_55:

          id v51 = [NSNumber numberWithInteger:5];
          uint64_t v52 = [v51 stringValue];
          [v76 setObject:v86 forKeyedSubscript:v52];

LABEL_56:
        }
        uint64_t v78 = [obj countByEnumeratingWithState:&v110 objects:v127 count:16];
      }
      while (v78);
    }
    uint64_t v11 = obj;
  }

LABEL_61:
  uint64_t v53 = *(void *)(a1 + 88);
  if (v53) {
    (*(void (**)(double))(v53 + 16))(100.0);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40))
  {
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  }
  else
  {
    uint64_t v54 = [MEMORY[0x1E4F1CA48] array];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    uint64_t v55 = [*(id *)(a1 + 32) postProcessTimeRanges:v76 options:*(void *)(a1 + 48)];
    uint64_t v56 = [v55 countByEnumeratingWithState:&v98 objects:v121 count:16];
    if (v56)
    {
      uint64_t v57 = *(void *)v99;
      do
      {
        for (uint64_t m = 0; m != v56; ++m)
        {
          if (*(void *)v99 != v57) {
            objc_enumerationMutation(v55);
          }
          int v59 = (void *)MEMORY[0x1E4F29238];
          CMTimeRangeMakeFromDictionary(&v97, *(CFDictionaryRef *)(*((void *)&v98 + 1) + 8 * m));
          int v60 = [v59 valueWithCMTimeRange:&v97];
          [v54 addObject:v60];
        }
        uint64_t v56 = [v55 countByEnumeratingWithState:&v98 objects:v121 count:16];
      }
      while (v56);
    }

    long long v61 = *(void **)(a1 + 32);
    id v62 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"MinTimeRangeGap"];
    id v85 = [v61 mergeTimeRanges:v54 mergeGap:v62];

    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v63 = VCPLogInstance();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        uint64_t v64 = *(void *)(a1 + 40);
        *(_DWORD *)CMTimeRange buf = 138412290;
        *(void *)&uint8_t buf[4] = v64;
        _os_log_impl(&dword_1BBEDA000, v63, OS_LOG_TYPE_INFO, "MediaAnalysis findTimeRanges for url %@", buf, 0xCu);
      }
    }
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v65 = v85;
    uint64_t v66 = [v65 countByEnumeratingWithState:&v93 objects:v120 count:16];
    if (v66)
    {
      uint64_t v67 = *(void *)v94;
      do
      {
        for (uint64_t n = 0; n != v66; ++n)
        {
          if (*(void *)v94 != v67) {
            objc_enumerationMutation(v65);
          }
          long long v69 = *(void **)(*((void *)&v93 + 1) + 8 * n);
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            long long v70 = VCPLogInstance();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
            {
              if (v69)
              {
                [v69 CMTimeRangeValue];
              }
              else
              {
                long long v115 = 0u;
                memset(buf, 0, sizeof(buf));
              }
              CMTime time = *(CMTime *)buf;
              Float64 Seconds = CMTimeGetSeconds(&time);
              if (v69)
              {
                [v69 CMTimeRangeValue];
              }
              else
              {
                memset(v90, 0, sizeof(v90));
                long long v89 = 0u;
              }
              CMTime v91 = *(CMTime *)((char *)v90 + 8);
              Float64 v72 = CMTimeGetSeconds(&v91);
              *(_DWORD *)uint64_t v116 = 134218240;
              Float64 v117 = Seconds;
              __int16 v118 = 2048;
              Float64 v119 = v72;
              _os_log_impl(&dword_1BBEDA000, v70, OS_LOG_TYPE_INFO, "[%f, %f]", v116, 0x16u);
            }
          }
        }
        uint64_t v66 = [v65 countByEnumeratingWithState:&v93 objects:v120 count:16];
      }
      while (v66);
    }

    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  }
  uint64_t v73 = *(void *)(a1 + 32);
  id v74 = *(NSObject **)(v73 + 104);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke_845;
  block[3] = &unk_1E6297BC0;
  void block[4] = v73;
  int v88 = *(_DWORD *)(a1 + 128);
  dispatch_sync(v74, block);
}

void __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke_845(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 112);
  id v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  objc_msgSend(v1, "removeObjectForKey:");
}

- (int)findTimeRangesWithContext:(id)a3 inAsset:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [a3 entities];
  LODWORD(self) = [(VCPMediaAnalyzer *)self findTimeRangesFor:v16 inAsset:v12 withOptions:v13 andProgressHandler:v14 andCompletionHandler:v15];

  return (int)self;
}

- (int)findTimeRangesWithContext:(id)a3 inURLAsset:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [a3 entities];
  LODWORD(self) = [(VCPMediaAnalyzer *)self findTimeRangesFor:v16 inURLAsset:v12 withOptions:v13 andProgressHandler:v14 andCompletionHandler:v15];

  return (int)self;
}

- (id)postProcessTimeRanges:(id)a3 options:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = [v4 allKeys];
  uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v11 = [&unk_1F15ED758 stringValue];
        int v12 = [v10 isEqual:v11];

        if (v12)
        {
          long long v30 = 0uLL;
          long long v31 = 0uLL;
          long long v28 = 0uLL;
          long long v29 = 0uLL;
          id v13 = [v4 objectForKeyedSubscript:v10];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v29 != v15) {
                  objc_enumerationMutation(v13);
                }
                [v6 addObject:*(void *)(*((void *)&v28 + 1) + 8 * j)];
              }
              uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
            }
            while (v14);
          }
        }
        else
        {
          long long v26 = 0uLL;
          long long v27 = 0uLL;
          long long v24 = 0uLL;
          long long v25 = 0uLL;
          id v13 = [v4 objectForKeyedSubscript:v10];
          uint64_t v17 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v25;
            do
            {
              for (uint64_t k = 0; k != v17; ++k)
              {
                if (*(void *)v25 != v18) {
                  objc_enumerationMutation(v13);
                }
                [v5 addObject:*(void *)(*((void *)&v24 + 1) + 8 * k)];
              }
              uint64_t v17 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
            }
            while (v17);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v7);
  }

  if ([v6 count]) {
    id v20 = v6;
  }
  else {
    id v20 = v5;
  }
  id v21 = v20;

  return v21;
}

- (id)mergeTimeRanges:(id)a3 mergeGap:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  obuint64_t j = a3;
  id v5 = a4;
  {
    CMTimeMakeWithSeconds((CMTime *)-[VCPMediaAnalyzer mergeTimeRanges:mergeGap:]::kMergeGap, 1.0, 600);
  }
  CMTime start = *(CMTime *)-[VCPMediaAnalyzer mergeTimeRanges:mergeGap:]::kMergeGap;
  if (v5)
  {
    [v5 floatValue];
    CMTimeMakeWithSeconds(&v49.start, fmaxf(v6, 0.0), 600);
    CMTime start = v49.start;
  }
  if ((unint64_t)objc_msgSend(obj, "count", v5) <= 1)
  {
    id v7 = obj;
    id obja = v7;
    goto LABEL_25;
  }
  uint64_t v8 = [obj sortedArrayUsingComparator:&__block_literal_global_848];

  id v7 = [MEMORY[0x1E4F1CA48] array];
  CMTimeValue value = *MEMORY[0x1E4F1FA30];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA30] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA30] + 8);
  CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA30] + 16);
  CMTimeValue v11 = *(void *)(MEMORY[0x1E4F1FA30] + 24);
  CMTimeScale v13 = *(_DWORD *)(MEMORY[0x1E4F1FA30] + 32);
  CMTimeFlags v12 = *(_DWORD *)(MEMORY[0x1E4F1FA30] + 36);
  CMTimeEpoch v14 = *(void *)(MEMORY[0x1E4F1FA30] + 40);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obja = v8;
  uint64_t v15 = [obja countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (!v15) {
    goto LABEL_24;
  }
  uint64_t v16 = *(void *)v51;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v51 != v16) {
        objc_enumerationMutation(obja);
      }
      uint64_t v18 = *(void **)(*((void *)&v50 + 1) + 8 * i);
      memset(&v49, 0, sizeof(v49));
      if (v18) {
        [v18 CMTimeRangeValue];
      }
      if ((flags & 1) != 0 && (v12 & 1) != 0 && !v14 && (v11 & 0x8000000000000000) == 0)
      {
        time1.CMTimeValue value = v11;
        time1.CMTimeScale timescale = v13;
        time1.CMTimeFlags flags = v12;
        time1.CMTimeEpoch epoch = 0;
        CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        if (!CMTimeCompare(&time1, &time2)) {
          goto LABEL_20;
        }
      }
      range.start.CMTimeValue value = value;
      range.start.CMTimeScale timescale = timescale;
      range.start.CMTimeFlags flags = flags;
      range.start.CMTimeEpoch epoch = epoch;
      range.duration.CMTimeValue value = v11;
      range.duration.CMTimeScale timescale = v13;
      range.duration.CMTimeFlags flags = v12;
      range.duration.CMTimeEpoch epoch = v14;
      CMTimeRangeGetEnd(&v45, &range);
      *(_OWORD *)&lhs.start.CMTimeValue value = *(_OWORD *)&v49.start.value;
      lhs.start.CMTimeEpoch epoch = v49.start.epoch;
      CMTime rhs = v45;
      CMTimeSubtract(&v46, &lhs.start, &rhs);
      lhs.CMTime start = v46;
      CMTime rhs = start;
      if ((CMTimeCompare(&lhs.start, &rhs) & 0x80000000) == 0)
      {
        CMTimeValue v33 = value;
        CMTimeScale v34 = timescale;
        CMTimeFlags v35 = flags;
        CMTimeEpoch v36 = epoch;
        CMTimeValue v37 = v11;
        CMTimeScale v38 = v13;
        CMTimeFlags v39 = v12;
        CMTimeEpoch v40 = v14;
        uint64_t v19 = [MEMORY[0x1E4F29238] valueWithCMTimeRange:&v33];
        [v7 addObject:v19];

LABEL_20:
        CMTimeValue value = v49.start.value;
        CMTimeFlags flags = v49.start.flags;
        CMTimeScale timescale = v49.start.timescale;
        CMTimeValue v11 = v49.duration.value;
        CMTimeEpoch epoch = v49.start.epoch;
        CMTimeScale v13 = v49.duration.timescale;
        CMTimeFlags v12 = v49.duration.flags;
        CMTimeEpoch v14 = v49.duration.epoch;
        continue;
      }
      v42.start.CMTimeValue value = value;
      v42.start.CMTimeScale timescale = timescale;
      v42.start.CMTimeFlags flags = flags;
      v42.start.CMTimeEpoch epoch = epoch;
      v42.duration.CMTimeValue value = v11;
      v42.duration.CMTimeScale timescale = v13;
      v42.duration.CMTimeFlags flags = v12;
      v42.duration.CMTimeEpoch epoch = v14;
      CMTimeRange otherRange = v49;
      CMTimeRangeGetUnion(&lhs, &v42, &otherRange);
      CMTimeValue value = lhs.start.value;
      CMTimeFlags flags = lhs.start.flags;
      CMTimeScale timescale = lhs.start.timescale;
      CMTimeEpoch epoch = lhs.start.epoch;
      CMTimeValue v11 = lhs.duration.value;
      CMTimeScale v13 = lhs.duration.timescale;
      CMTimeFlags v12 = lhs.duration.flags;
      CMTimeEpoch v14 = lhs.duration.epoch;
    }
    uint64_t v15 = [obja countByEnumeratingWithState:&v50 objects:v56 count:16];
  }
  while (v15);
LABEL_24:

  CMTimeValue v25 = value;
  CMTimeScale v26 = timescale;
  CMTimeFlags v27 = flags;
  CMTimeEpoch v28 = epoch;
  CMTimeValue v29 = v11;
  CMTimeScale v30 = v13;
  CMTimeFlags v31 = v12;
  CMTimeEpoch v32 = v14;
  id v20 = [MEMORY[0x1E4F29238] valueWithCMTimeRange:&v25];
  [v7 addObject:v20];

LABEL_25:
  return v7;
}

uint64_t __45__VCPMediaAnalyzer_mergeTimeRanges_mergeGap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4)
  {
    [v4 CMTimeRangeValue];
  }
  else
  {
    long long v11 = 0u;
    memset(time1, 0, sizeof(time1));
  }
  long long v12 = *(_OWORD *)time1;
  uint64_t v13 = *(void *)&time1[16];
  if (v5)
  {
    [v5 CMTimeRangeValue];
  }
  else
  {
    long long v11 = 0u;
    memset(time1, 0, sizeof(time1));
  }
  *(_OWORD *)&v9.CMTimeValue value = *(_OWORD *)time1;
  CMTimeEpoch v6 = *(void *)&time1[16];
  v9.CMTimeEpoch epoch = *(void *)&time1[16];
  *(_OWORD *)CMTime time1 = v12;
  *(void *)&time1[16] = v13;
  *(_OWORD *)&time2.CMTimeValue value = *(_OWORD *)&v9.value;
  time2.CMTimeEpoch epoch = v6;
  if (CMTimeCompare((CMTime *)time1, &time2))
  {
    *(_OWORD *)CMTime time1 = v12;
    *(void *)&time1[16] = v13;
    CMTime time2 = v9;
    if (CMTimeCompare((CMTime *)time1, &time2) < 0) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)loadVideoAssetsFromPhotoLibraryURL:(id)a3 withAssetIdentifiers:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v24 = v6;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F39220]) initWithPhotoLibraryURL:v6];
  CMTime v9 = v7;
  uint64_t v10 = v9;
  if (v9)
  {
LABEL_4:
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_fetchOptionsForLibrary:forTaskID:", v8, 1);
    CMTimeEpoch v14 = objc_msgSend(MEMORY[0x1E4F28F60], "vcp_moviesPredicate:", 0);
    [v13 setPredicate:v14];

    uint64_t v15 = [MEMORY[0x1E4F38EC0] fetchAssetsWithLocalIdentifiers:v10 options:v13];
    if ([v15 count])
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v17 = v15;
      uint64_t v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16, v7, v6);
      if (v18)
      {
        uint64_t v19 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v26 != v19) {
              objc_enumerationMutation(v17);
            }
            [v16 addObject:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v18);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        uint64_t v16 = 0;
        goto LABEL_18;
      }
      uint64_t v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "[MediaAnalysis] No available assets for search", buf, 2u);
      }
      uint64_t v16 = 0;
    }

LABEL_18:
LABEL_19:

    goto LABEL_20;
  }
  long long v11 = [(VCPMediaAnalyzer *)self _databaseForPhotoLibrary:v8];
  long long v12 = v11;
  if (v11)
  {
    uint64_t v10 = [v11 queryAssetsAnalyzedSince:0];

    goto LABEL_4;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = [v8 photoLibraryURL];
      id v23 = [v22 path];
      *(_DWORD *)CMTimeRange buf = 138412290;
      CMTimeFlags v31 = v23;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to obtain database for Photo Library (%@)", buf, 0xCu);
    }
    uint64_t v16 = 0;
    goto LABEL_19;
  }
  uint64_t v16 = 0;
LABEL_20:

  return v16;
}

- (id)loadEmbeddingSearchResultWithContext:(id)a3 forPhotoLibraryURL:(id)a4 fromAssets:(id)a5 withOptions:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v31 = a4;
  id v32 = a5;
  id v33 = a6;
  CMTimeScale v34 = v10;
  if (v10)
  {
    long long v11 = [v10 entities];

    if (v11)
    {
      [v10 entities];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
      uint64_t v13 = 0;
      if (!v12) {
        goto LABEL_31;
      }
      uint64_t v35 = *(void *)v43;
      while (1)
      {
        uint64_t v36 = v12;
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          int v16 = [v15 intValue];
          if (v16 == 5)
          {
            long long v40 = 0u;
            long long v41 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            uint64_t v17 = [obj objectForKeyedSubscript:v15];
            uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v53 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v39;
              id v20 = v13;
              while (2)
              {
                uint64_t v21 = 0;
                uint64_t v13 = v20;
                do
                {
                  if (*(void *)v39 != v19) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v22 = *(void **)(*((void *)&v38 + 1) + 8 * v21);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v23 = [v22 vectors];
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if ((int)MediaAnalysisLogLevel() >= 4)
                      {
                        long long v24 = VCPLogInstance();
                        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                        {
                          long long v25 = (objc_class *)objc_opt_class();
                          NSStringFromClass(v25);
                          id v26 = (id)objc_claimAutoreleasedReturnValue();
                          long long v27 = (objc_class *)objc_opt_class();
                          long long v28 = NSStringFromClass(v27);
                          *(_DWORD *)CMTimeRange buf = 134218498;
                          uint64_t v47 = 5;
                          __int16 v48 = 2112;
                          id v49 = v26;
                          __int16 v50 = 2112;
                          long long v51 = v28;
                          _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_DEFAULT, "Mismatch data type for query %ld, skip. Expect %@ or %@", buf, 0x20u);
                        }
                      }
                      goto LABEL_28;
                    }
                    long long v52 = v22;
                    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
                  }
                  id v20 = (void *)v23;

                  ++v21;
                  uint64_t v13 = v20;
                }
                while (v18 != v21);
                uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v53 count:16];
                if (v18) {
                  continue;
                }
                break;
              }
              uint64_t v13 = v20;
            }
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() < 4) {
              continue;
            }
            uint64_t v17 = VCPLogInstance();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CMTimeRange buf = 134217984;
              uint64_t v47 = v16;
              _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEFAULT, "Unsupport query type %ld in search context for ranking", buf, 0xCu);
            }
          }
LABEL_28:
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
        if (!v12)
        {
LABEL_31:

          CMTimeValue v29 = [(VCPMediaAnalyzer *)self requestSearchResultsForAssets:v32 forPhotoLibraryURL:v31 withQueryEmbeddings:v13 matchingScoreOnly:1 options:v33];

          goto LABEL_33;
        }
      }
    }
  }
  CMTimeValue v29 = [(VCPMediaAnalyzer *)self requestSearchResultsForAssets:v32 forPhotoLibraryURL:v31 withQueryEmbeddings:MEMORY[0x1E4F1CBF0] matchingScoreOnly:1 options:v33];
LABEL_33:

  return v29;
}

- (void)addVideoRankingSignalsToDictionary:(id)a3 fromPhotoLibraryURL:(id)a4 amongAssets:(id)a5
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v61 = a5;
  uint64_t v64 = +[VCPClientDatabaseManager sharedDatabaseForPhotoLibraryURL:a4];
  id v65 = MediaAnalysisResultsTypesForAnalysisTypes(128);
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = v61;
  uint64_t v8 = [obj countByEnumeratingWithState:&v75 objects:v87 count:16];
  if (v8)
  {
    uint64_t v63 = *(void *)v76;
    do
    {
      uint64_t v66 = v8;
      for (uint64_t i = 0; i != v66; ++i)
      {
        if (*(void *)v76 != v63) {
          objc_enumerationMutation(obj);
        }
        id v10 = [*(id *)(*((void *)&v75 + 1) + 8 * i) localIdentifier];
        long long v11 = [v64 queryAnalysisForAsset:v10 withTypes:v65];
        uint64_t v12 = v11;
        if (!v11)
        {
          if ((int)MediaAnalysisLogLevel() < 4) {
            goto LABEL_53;
          }
          id v26 = VCPLogInstance();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_52;
          }
          *(_DWORD *)CMTimeRange buf = 138412290;
          long long v86 = v10;
          long long v27 = v26;
          long long v28 = "[VideoRankingSignals][%@] No analysis results from MAD database, skip fetching";
          goto LABEL_43;
        }
        uint64_t v13 = objc_msgSend(v11, "vcp_results");
        CMTimeEpoch v14 = [v13 objectForKeyedSubscript:@"InterestingnessResults"];
        BOOL v15 = v14 == 0;

        if (v15)
        {
          if ((int)MediaAnalysisLogLevel() < 4) {
            goto LABEL_31;
          }
          uint64_t v18 = VCPLogInstance();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)CMTimeRange buf = 138412290;
            long long v86 = v10;
            _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_DEFAULT, "[VideoRankingSignals][%@] Missing video signal interestingness from full analysis results", buf, 0xCu);
          }
        }
        else
        {
          int v16 = objc_msgSend(v12, "vcp_results");
          uint64_t v17 = [v16 objectForKeyedSubscript:@"InterestingnessResults"];

          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          uint64_t v18 = v17;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v71 objects:v84 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v72;
            float v21 = 0.0;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v72 != v20) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = [*(id *)(*((void *)&v71 + 1) + 8 * j) objectForKeyedSubscript:@"quality"];
                [v23 floatValue];
                float v25 = v24;

                float v21 = v21 + v25;
              }
              uint64_t v19 = [v18 countByEnumeratingWithState:&v71 objects:v84 count:16];
            }
            while (v19);
          }
          else
          {
            float v21 = 0.0;
          }

          unint64_t v29 = [v18 count];
          if (v29 <= 1) {
            unint64_t v30 = 1;
          }
          else {
            unint64_t v30 = v29;
          }
          id v31 = [v7 objectForKeyedSubscript:v10];
          BOOL v32 = v31 == 0;

          if (v32)
          {
            uint64_t v82 = @"InterestingnessScore";
            *(float *)&double v33 = v21 / (float)v30;
            uint64_t v35 = [NSNumber numberWithFloat:v33];
            long long v83 = v35;
            long long v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
            [v7 setObject:v38 forKey:v10];
          }
          else
          {
            CMTimeScale v34 = [v7 objectForKeyedSubscript:v10];
            uint64_t v35 = (void *)[v34 mutableCopy];

            *(float *)&double v36 = v21 / (float)v30;
            CMTimeValue v37 = [NSNumber numberWithFloat:v36];
            [v35 setObject:v37 forKeyedSubscript:@"InterestingnessScore"];

            [v7 setObject:v35 forKeyedSubscript:v10];
          }
        }
LABEL_31:
        long long v39 = objc_msgSend(v12, "vcp_results");
        long long v40 = [v39 objectForKeyedSubscript:@"QualityResults"];
        BOOL v41 = v40 == 0;

        if (!v41)
        {
          long long v42 = objc_msgSend(v12, "vcp_results");
          long long v43 = [v42 objectForKeyedSubscript:@"QualityResults"];

          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          id v26 = v43;
          uint64_t v44 = [v26 countByEnumeratingWithState:&v67 objects:v81 count:16];
          if (v44)
          {
            uint64_t v45 = *(void *)v68;
            float v46 = 0.0;
            do
            {
              for (uint64_t k = 0; k != v44; ++k)
              {
                if (*(void *)v68 != v45) {
                  objc_enumerationMutation(v26);
                }
                __int16 v48 = [*(id *)(*((void *)&v67 + 1) + 8 * k) objectForKeyedSubscript:@"quality"];
                [v48 floatValue];
                float v50 = v49;

                float v46 = v46 + v50;
              }
              uint64_t v44 = [v26 countByEnumeratingWithState:&v67 objects:v81 count:16];
            }
            while (v44);
          }
          else
          {
            float v46 = 0.0;
          }

          unint64_t v51 = [v26 count];
          if (v51 <= 1) {
            unint64_t v52 = 1;
          }
          else {
            unint64_t v52 = v51;
          }
          long long v53 = [v7 objectForKeyedSubscript:v10];
          BOOL v54 = v53 == 0;

          if (v54)
          {
            id v79 = @"QualityScore";
            *(float *)&double v55 = v46 / (float)v52;
            uint64_t v57 = [NSNumber numberWithFloat:v55];
            uint64_t v80 = v57;
            int v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
            [v7 setObject:v60 forKey:v10];
          }
          else
          {
            uint64_t v56 = [v7 objectForKeyedSubscript:v10];
            uint64_t v57 = (void *)[v56 mutableCopy];

            *(float *)&double v58 = v46 / (float)v52;
            uint64_t v59 = [NSNumber numberWithFloat:v58];
            [v57 setObject:v59 forKeyedSubscript:@"QualityScore"];

            [v7 setObject:v57 forKeyedSubscript:v10];
          }

          goto LABEL_52;
        }
        if ((int)MediaAnalysisLogLevel() < 4) {
          goto LABEL_53;
        }
        id v26 = VCPLogInstance();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CMTimeRange buf = 138412290;
          long long v86 = v10;
          long long v27 = v26;
          long long v28 = "[VideoRankingSignals][%@] Missing video signal quality from full analysis results";
LABEL_43:
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
        }
LABEL_52:

LABEL_53:
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v75 objects:v87 count:16];
    }
    while (v8);
  }
}

- (id)rankAssetsWithContext:(id)a3 forAssetIdentifiers:(id)a4 forPhotoLibraryURL:(id)a5 withOptions:(id)a6 error:(id *)a7
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  double v36 = v13;
  id v37 = a6;
  if (v12)
  {
    BOOL v15 = [v12 entities];
    if (v15)
    {

LABEL_5:
      if (v14)
      {
        id v17 = v14;
      }
      else
      {
        id v17 = [MEMORY[0x1E4F39220] systemPhotoLibraryURL];
      }
      uint64_t v18 = v17;
      uint64_t v19 = [(VCPMediaAnalyzer *)self loadVideoAssetsFromPhotoLibraryURL:v17 withAssetIdentifiers:v13];
      uint64_t v20 = v19;
      if (v19 && [v19 count])
      {
        float v21 = [(VCPMediaAnalyzer *)self loadEmbeddingSearchResultWithContext:v12 forPhotoLibraryURL:v18 fromAssets:v20 withOptions:v37];
        id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v23 = [[VideoRanker alloc] initWithCorpus:v21];
        float v24 = v23;
        if (v23)
        {
          float v25 = [(VideoRanker *)v23 rankingScores];
          uint64_t v26 = [v25 mutableCopy];

          id v22 = (id)v26;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            id v31 = VCPLogInstance();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)CMTimeRange buf = 0;
              _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEFAULT, "Failed to initialize BM25 video ranker, allow to skip adding BM25 ranking scores.", buf, 2u);
            }
          }
          if (a7)
          {
            type = (void *)MEMORY[0x1E4F28C58];
            uint64_t v39 = *MEMORY[0x1E4F28568];
            CMTimeScale v34 = [NSString stringWithFormat:@"Failed to initialize BM25 video ranker."];
            long long v40 = v34;
            BOOL v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
            *a7 = [type errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v32];
          }
        }
        [(VCPMediaAnalyzer *)self addVideoRankingSignalsToDictionary:v22 fromPhotoLibraryURL:v18 amongAssets:v20];
        goto LABEL_32;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        long long v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)CMTimeRange buf = 0;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "Empty search in assets fetched for videos.", buf, 2u);
        }
      }
      if (a7)
      {
        long long v28 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v41 = *MEMORY[0x1E4F28568];
        float v21 = [NSString stringWithFormat:@"Empty search in assets fetched for videos."];
        long long v42 = v21;
        float v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        [v28 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v24];
        id v22 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

        goto LABEL_33;
      }
      id v22 = 0;
LABEL_33:

      goto LABEL_34;
    }
  }
  int v16 = [v37 objectForKeyedSubscript:@"SearchQueryString"];

  if (v16) {
    goto LABEL_5;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    unint64_t v29 = VCPLogInstance();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_ERROR, "Empty search context and no query string for search ranking.", buf, 2u);
    }
  }
  if (a7)
  {
    unint64_t v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F28568];
    uint64_t v18 = [NSString stringWithFormat:@"Empty search context and no query string for search ranking."];
    v44[0] = v18;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
    [v30 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v20];
    id v22 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  id v22 = 0;
LABEL_34:

  return v22;
}

- (id)prepareContextsQueryEmbedding:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_textEncoder
    || (id v5 = objc_alloc_init(VCPTextEncoder),
        textEncoder = self->_textEncoder,
        self->_textEncoder = v5,
        textEncoder,
        self->_textEncoder))
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = objc_msgSend(v4, "objectForKeyedSubscript:", @"SearchQueryString", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = [(VCPTextEncoder *)self->_textEncoder textEmbeddingForQuery:*(void *)(*((void *)&v15 + 1) + 8 * i) useFP16:1];
          [v7 addObject:v12];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    id v13 = (void *)[v4 mutableCopy];
    if ([v7 count]) {
      [v13 setObject:v7 forKey:&unk_1F15ED758];
    }
    [v13 removeObjectForKey:@"SearchQueryString"];
LABEL_13:

    goto LABEL_14;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEFAULT, "Failed to create text encoder", buf, 2u);
    }
    id v13 = 0;
    goto LABEL_13;
  }
  id v13 = 0;
LABEL_14:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freeFormSearch, 0);
  objc_storeStrong((id *)&self->_textEncoder, 0);
  objc_storeStrong((id *)&self->_cancelTokens, 0);
  objc_storeStrong((id *)&self->_cancelQueue, 0);
  objc_storeStrong((id *)&self->_sandboxHandles, 0);
  objc_storeStrong((id *)&self->_sandboxQueue, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisServiceConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_noResultStrip, 0);
  objc_storeStrong((id *)&self->_minHighlightDuration, 0);
  objc_storeStrong((id *)&self->_standalone, 0);
  objc_storeStrong((id *)&self->_storageGroup, 0);
  objc_storeStrong((id *)&self->_storageQueue, 0);
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_analysisQueue, 0);
}

@end