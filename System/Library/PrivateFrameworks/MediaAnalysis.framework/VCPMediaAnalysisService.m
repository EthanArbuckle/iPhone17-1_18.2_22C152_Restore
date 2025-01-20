@interface VCPMediaAnalysisService
+ (id)analysisService;
+ (id)defaultDeferredProcessingTypes;
+ (id)errorWithDescription:(id)a3;
+ (id)sharedAnalysisService;
+ (int)queryCachedFaceAnalysisProgress:(id *)a3 forPhotoLibrary:(id)a4;
+ (int)queryCachedFaceAnalysisProgress:(id *)a3 forPhotoLibrary:(id)a4 withExtendTimeoutBlock:(id)a5;
+ (int)queryProgress:(float *)a3 forPhotoLibrary:(id)a4 andTaskID:(unint64_t)a5;
+ (int)queryProgress:(float *)a3 forPhotoLibrary:(id)a4 andTaskID:(unint64_t)a5 withExtendTimeoutBlock:(id)a6;
+ (int)queryProgressDetail:(id *)a3 forPhotoLibrary:(id)a4 andTaskID:(unint64_t)a5;
+ (int)queryProgressDetail:(id *)a3 forPhotoLibrary:(id)a4 andTaskID:(unint64_t)a5 withExtendTimeoutBlock:(id)a6;
+ (int)queryProgressDetail:(id *)a3 forPhotoLibraryURL:(id)a4 andTaskID:(unint64_t)a5;
+ (int)queryProgressDetail:(id *)a3 forPhotoLibraryURL:(id)a4 andTaskID:(unint64_t)a5 withExtendTimeoutBlock:(id)a6;
- (BOOL)requestDeferredProcessingTypes:(id)a3 assets:(id)a4 error:(id *)a5;
- (VCPMediaAnalysisService)init;
- (id)assetsPendingDeferredProcessingWithPhotoLibraryURL:(id)a3 error:(id *)a4;
- (id)connection;
- (int)downloadVideoEncoderWithCompletionHandler:(id)a3;
- (int)queryAutoCounterOptInStatusForPhotoLibraryURL:(id)a3 withPersonLocalIdentifiers:(id)a4 completionHandler:(id)a5;
- (int)requestAnalysisTypes:(unint64_t)a3 forAssetWithResourceURLs:(id)a4 withOptions:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7;
- (int)requestAnalysisTypes:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7;
- (int)requestAutoCounterAccuracyCalculationForPhotoLibraryURL:(id)a3 clusterStateURL:(id)a4 groundTruthURL:(id)a5 completionHandler:(id)a6;
- (int)requestAutoCounterAccuracyCalculationForPhotoLibraryURL:(id)a3 completionHandler:(id)a4;
- (int)requestAutoCounterSIMLValidationForPhotoLibraryURL:(id)a3 simlGroundTruthURL:(id)a4 completionHandler:(id)a5;
- (int)requestBackgroundAnalysisForAssets:(id)a3 fromPhotoLibraryWithURL:(id)a4 realTime:(BOOL)a5 progessHandler:(id)a6 completionHandler:(id)a7;
- (int)requestBackgroundAnalysisForAssets:(id)a3 realTime:(BOOL)a4 progessHandler:(id)a5 completionHandler:(id)a6;
- (int)requestBackgroundProcessingWithTaskID:(unint64_t)a3 forPhotoLibrary:(id)a4 progessHandler:(id)a5 completionHandler:(id)a6;
- (int)requestClusterCacheValidationWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (int)requestDatabaseRestoreFastPassProcessingWithCompletionHandler:(id)a3;
- (int)requestDumpAutoCounterForPhotoLibraryURL:(id)a3 completionHandler:(id)a4;
- (int)requestFRCForAssetURL:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (int)requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers:(id)a3 photoLibraryURL:(id)a4 progessHandler:(id)a5 completionHandler:(id)a6;
- (int)requestFaceProcessingForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (int)requestFaceProcessingForPhotoLibrary:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (int)requestForceDeferredProcessingWithProgessHandler:(id)a3 andCompletionHandler:(id)a4;
- (int)requestFullProcessingForPhotoLibrary:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (int)requestIdentificationOfFaces:(id)a3 withCompletionHandler:(id)a4;
- (int)requestLivePhotoEffectsForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (int)requestMediaAnalysisDatabaseBackupForPhotoLibraryURL:(id)a3 withCompletionHandler:(id)a4 forceBackup:(BOOL)a5;
- (int)requestMultiWorkerProcessingForPhotoLibrary:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (int)requestOTAMaintenanceWithOptions:(id)a3 progessHandler:(id)a4 completionHandler:(id)a5;
- (int)requestOptInAutoCounterForPhotoLibraryURL:(id)a3 withPersons:(id)a4 completionHandler:(id)a5;
- (int)requestPersonPreferenceForPhotoLibraryURL:(id)a3 completionHandler:(id)a4;
- (int)requestPersonProcessingForPhotoLibraryURL:(id)a3 options:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (int)requestPersonPromoterStatusWithAdvancedFlag:(BOOL)a3 photoLibraryURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (int)requestPhotosFaceFastPassProcessingForPhotoLibraryURL:(id)a3 withCompletionHandler:(id)a4;
- (int)requestPhotosSceneFastPassProcessingForPhotoLibraryURL:(id)a3 withCompletionHandler:(id)a4;
- (int)requestProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (int)requestProcessingWithTaskID:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7;
- (int)requestProcessingWithTaskID:(unint64_t)a3 forPhotoLibrary:(id)a4 withOptions:(id)a5 progessHandler:(id)a6 andCompletionHandler:(id)a7;
- (int)requestQuickFaceIdentificationForPhotoLibraryURL:(id)a3 withOptions:(id)a4 andCompletionHandler:(id)a5;
- (int)requestRebuildPersonsWithLocalIdentifiers:(id)a3 photoLibraryURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (int)requestRecentsProcessing:(unint64_t)a3 photoLibrary:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (int)requestReclusterFacesWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (int)requestResetFaceClassificationModelForPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (int)requestResetFaceClusteringStateWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (int)requestResetPersons:(id)a3 forPhotoLibraryURL:(id)a4 completionHandler:(id)a5;
- (int)requestResetPetClassificationModelForPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (int)requestSceneProcessingForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (int)requestSceneProcessingForPhotoLibrary:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (int)requestSceneprintProcessingForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (int)requestStaticStickerScoringForLibrary:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (int)requestSuggestedMePersonIdentifierWithContext:(id)a3 photoLibraryURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (int)requestSuggestedPersonsForPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 photoLibraryURL:(id)a6 progessHandler:(id)a7 completionHandler:(id)a8;
- (int)requestUpdateKeyFacesOfPersonsWithLocalIdentifiers:(id)a3 forceUpdate:(BOOL)a4 photoLibraryURL:(id)a5 progessHandler:(id)a6 completionHandler:(id)a7;
- (int)requestVIPModelFilepathForPhotoLibraryURL:(id)a3 forModelType:(unint64_t)a4 completionHandler:(id)a5;
- (int)requestVideoCaptionForFrames:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (int)requestVideoStabilizationForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (int)requestWallpaperUpgradeAtURL:(id)a3 toDestinationURL:(id)a4 withOptions:(id)a5 andCompletionHandler:(id)a6;
- (void)cancelAllRequests;
- (void)cancelBackgroundActivity;
- (void)cancelRequest:(int)a3;
- (void)invalidate;
- (void)notifyLibraryAvailableAtURL:(id)a3;
- (void)reportProgress:(double)a3 forRequest:(int)a4;
@end

@implementation VCPMediaAnalysisService

- (VCPMediaAnalysisService)init
{
  v13.receiver = self;
  v13.super_class = (Class)VCPMediaAnalysisService;
  v2 = [(VCPMediaAnalysisService *)&v13 init];
  v3 = v2;
  if (v2)
  {
    connection = v2->_connection;
    v2->_connection = 0;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mediaanalysis.service.management", 0);
    managementQueue = v3->_managementQueue;
    v3->_managementQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediaanalysis.service.handler", 0);
    handlerQueue = v3->_handlerQueue;
    v3->_handlerQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    progressBlocks = v3->_progressBlocks;
    v3->_progressBlocks = (NSMutableDictionary *)v9;

    v3->_nextRequestID = 1;
    v11 = v3;
  }

  return v3;
}

+ (id)sharedAnalysisService
{
  if (+[VCPMediaAnalysisService sharedAnalysisService]::once != -1) {
    dispatch_once(&+[VCPMediaAnalysisService sharedAnalysisService]::once, &__block_literal_global_10);
  }
  v2 = (void *)+[VCPMediaAnalysisService sharedAnalysisService]::instance;
  return v2;
}

void __48__VCPMediaAnalysisService_sharedAnalysisService__block_invoke()
{
  v0 = objc_alloc_init(VCPMediaAnalysisService);
  v1 = (void *)+[VCPMediaAnalysisService sharedAnalysisService]::instance;
  +[VCPMediaAnalysisService sharedAnalysisService]::instance = (uint64_t)v0;
}

+ (id)analysisService
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

+ (id)errorWithDescription:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = v3;
  dispatch_queue_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v4 errorWithDomain:@"MediaAnalysisService" code:1 userInfo:v5];

  return v6;
}

- (id)connection
{
  v23[7] = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  if (!connection)
  {
    v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F16407D8];
    dispatch_queue_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v23[3] = objc_opt_class();
    v23[4] = objc_opt_class();
    v23[5] = objc_opt_class();
    v23[6] = objc_opt_class();
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:7];
    dispatch_queue_t v7 = [v5 setWithArray:v6];
    [v4 setClasses:v7 forSelector:sel_requestAssetProcessing_withTaskID_forLocalIdentifiers_fromPhotoLibraryWithURL_withOptions_andReply_ argumentIndex:0 ofReply:1];

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    v22[3] = objc_opt_class();
    v22[4] = objc_opt_class();
    v22[5] = objc_opt_class();
    v22[6] = objc_opt_class();
    v22[7] = objc_opt_class();
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:8];
    v10 = [v8 setWithArray:v9];
    [v4 setClasses:v10 forSelector:sel_requestURLAssetAnalysis_forAssetWithResourcePaths_withOptions_analysisTypes_sandboxTokens_withReply_ argumentIndex:0 ofReply:1];

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    objc_super v13 = [v11 setWithArray:v12];
    [v4 setClasses:v13 forSelector:sel_queryAssetsPendingDeferredProcessingWithPhotoLibraryURL_andReply_ argumentIndex:0 ofReply:1];

    v14 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mediaanalysisd.analysis" options:0];
    v15 = self->_connection;
    self->_connection = v14;

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v4];
    v16 = self->_connection;
    v17 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F15F4648];
    [(NSXPCConnection *)v16 setExportedInterface:v17];

    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_432];
    v18 = self->_connection;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __37__VCPMediaAnalysisService_connection__block_invoke_433;
    v20[3] = &unk_1E6296FF8;
    v20[4] = self;
    [(NSXPCConnection *)v18 setInvalidationHandler:v20];
    [(NSXPCConnection *)self->_connection resume];

    connection = self->_connection;
  }
  return connection;
}

void __37__VCPMediaAnalysisService_connection__block_invoke()
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v0 = VCPLogInstance();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1BBEDA000, v0, OS_LOG_TYPE_DEBUG, "Media analysis client XPC connection interrupted", v1, 2u);
    }
  }
}

void __37__VCPMediaAnalysisService_connection__block_invoke_433(uint64_t a1)
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v5 = 0;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEFAULT, "Media analysis client XPC connection invalidated", v5, 2u);
    }
  }
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0;
}

- (int)requestAnalysisTypes:(unint64_t)a3 forAssetWithResourceURLs:(id)a4 withOptions:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v41 = a6;
  id v13 = a7;
  v43 = v11;
  v40 = v12;
  if (v11 && ([v11 count] == 1 || objc_msgSend(v11, "count") == 2))
  {
    v14 = [v12 objectForKeyedSubscript:@"InProcess"];
    v38 = (void (**)(void, void, void))v13;
    int v15 = [v14 BOOLValue];

    if (v15)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v61 = 0x2020000000;
      int v62 = 0;
      managementQueue = self->_managementQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke;
      block[3] = &unk_1E6297458;
      block[4] = self;
      block[5] = &buf;
      dispatch_sync(managementQueue, block);
      v17 = +[VCPFullAnalysisURLProcessingTask taskForURLAsset:v11 withOptions:v12 analysisTypes:a3 progressHandler:0 completionHandler:v13];
      [v17 run];
      int v18 = *(_DWORD *)(*((void *)&buf + 1) + 24);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      unint64_t v37 = a3;
      v20 = [MEMORY[0x1E4F1CA48] array];
      v21 = [MEMORY[0x1E4F1CA48] array];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id obj = v11;
      uint64_t v22 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v53;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v53 != v23) {
              objc_enumerationMutation(obj);
            }
            v25 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            id v26 = [v25 path];
            [v26 UTF8String];
            v27 = (void *)sandbox_extension_issue_file();

            if (!v27)
            {
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                v31 = VCPLogInstance();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  v32 = [v25 path];
                  LODWORD(buf) = 138412290;
                  *(void *)((char *)&buf + 4) = v32;
                  _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEFAULT, "Failed to issue sandbox extension on %@", (uint8_t *)&buf, 0xCu);
                }
              }
              v33 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v57 = *MEMORY[0x1E4F28568];
              v58 = @"Error issuing sandbox extension";
              v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
              v35 = [v33 errorWithDomain:*MEMORY[0x1E4F28760] code:1 userInfo:v34];

              ((void (**)(void, void, void *))v38)[2](v38, 0, v35);
              int v18 = 0;
              goto LABEL_25;
            }
            v28 = [NSString stringWithUTF8String:v27];
            [v20 addObject:v28];

            v29 = [v25 path];
            [v21 addObject:v29];

            free(v27);
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v61 = 0x2020000000;
      int v62 = 0;
      v30 = self->_managementQueue;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_439;
      v44[3] = &unk_1E6297970;
      p_long long buf = &buf;
      v44[4] = self;
      id v48 = v41;
      v49 = v38;
      id v45 = v21;
      id v46 = v40;
      unint64_t v51 = v37;
      id v47 = v20;
      dispatch_sync(v30, v44);
      int v18 = *(_DWORD *)(*((void *)&buf + 1) + 24);

      _Block_object_dispose(&buf, 8);
LABEL_25:
    }
    id v13 = v38;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer requestAnalysisTypes] call with invalid resourceURLs", (uint8_t *)&buf, 2u);
      }
    }
    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
    int v18 = 0;
  }

  return v18;
}

uint64_t __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(v1 + 40);
  *(_DWORD *)(v1 + 40) = v2 + 1;
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

void __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_439(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v3;
  v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 64)) {
    dispatch_queue_t v5 = *(const void **)(a1 + 64);
  }
  else {
    dispatch_queue_t v5 = &__block_literal_global_442;
  }
  v6 = _Block_copy(v5);
  dispatch_queue_t v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  uint64_t v8 = [*(id *)(a1 + 32) connection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_3;
  v22[3] = &unk_1E62978D0;
  v22[4] = *(void *)(a1 + 32);
  long long v18 = *(_OWORD *)(a1 + 72);
  id v9 = (id)v18;
  long long v23 = v18;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v22];
  uint64_t v11 = *(void *)(a1 + 80);
  uint64_t v12 = *(void *)(a1 + 88);
  uint64_t v13 = *(unsigned int *)(*(void *)(v11 + 8) + 24);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 56);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_3_449;
  v19[3] = &unk_1E6297948;
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v21 = v11;
  v19[4] = v17;
  id v20 = *(id *)(a1 + 72);
  [v10 requestURLAssetAnalysis:v13 forAssetWithResourcePaths:v14 withOptions:v15 analysisTypes:v12 sandboxTokens:v16 withReply:v19];
}

void __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to background analysis service", buf, 2u);
    }
  }
  NSLog(&cfstr_MediaanalysisE.isa);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_446;
  block[3] = &unk_1E62978A8;
  block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_446(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_2_447;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_2_447(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_3_449(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_450;
  block[3] = &unk_1E6297920;
  block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_450(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_2_451;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_2_451(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestAnalysisTypes:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v36 = a4;
  id v12 = a5;
  id v13 = a6;
  v34 = v13;
  v35 = (void (**)(id, void, void *))a7;
  long long v14 = [v12 objectForKeyedSubscript:@"InProcess"];
  if ([v14 BOOLValue])
  {

LABEL_16:
    uint64_t v50 = 0;
    unint64_t v51 = &v50;
    uint64_t v52 = 0x2020000000;
    int v53 = 0;
    managementQueue = self->_managementQueue;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke;
    v49[3] = &unk_1E6297458;
    v49[4] = self;
    v49[5] = &v50;
    dispatch_sync(managementQueue, v49);
    v29 = +[VCPFullAnalysisAssetProcessingTask taskWithAsset:v36 andAnalysisTypes:a3 andOptions:v12 andProgressHandler:v13 andCompletionHandler:v35];
    [v29 run];
    int v31 = *((_DWORD *)v51 + 6);

    _Block_object_dispose(&v50, 8);
    goto LABEL_18;
  }
  uint64_t v15 = [v12 objectForKeyedSubscript:@"AllowOnDemand"];
  char v16 = [v15 BOOLValue];

  if ((v16 & 1) == 0) {
    goto LABEL_16;
  }
  id v17 = [MEMORY[0x1E4F1CA80] set];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v18 = v36;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v54 count:16];
  unint64_t v33 = a3;
  id v20 = 0;
  if (v19)
  {
    uint64_t v21 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v46 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (v20)
        {
          id v24 = [*(id *)(*((void *)&v45 + 1) + 8 * i) photoLibrary];
          BOOL v25 = v24 == v20;

          if (!v25)
          {
            v30 = [(id)objc_opt_class() errorWithDescription:@"Assets from multiple libraries not supported"];
            v35[2](v35, 0, v30);

            int v31 = 0;
            goto LABEL_17;
          }
        }
        else
        {
          id v20 = [*(id *)(*((void *)&v45 + 1) + 8 * i) photoLibrary];
        }
        id v26 = objc_msgSend(v23, "localIdentifier", v33);
        [v17 addObject:v26];
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v19);
  }

  uint64_t v50 = 0;
  unint64_t v51 = &v50;
  uint64_t v52 = 0x2020000000;
  int v53 = 0;
  v27 = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2;
  block[3] = &unk_1E6297970;
  v43 = &v50;
  void block[4] = self;
  id v41 = v34;
  v42 = v35;
  id v38 = v17;
  id v20 = v20;
  id v39 = v20;
  id v40 = v12;
  unint64_t v44 = v33;
  dispatch_sync(v27, block);
  int v31 = *((_DWORD *)v51 + 6);

  _Block_object_dispose(&v50, 8);
LABEL_17:

LABEL_18:
  return v31;
}

uint64_t __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(v1 + 40);
  *(_DWORD *)(v1 + 40) = v2 + 1;
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

void __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v3;
  v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 64)) {
    id v5 = *(const void **)(a1 + 64);
  }
  else {
    id v5 = &__block_literal_global_459;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  id v8 = [*(id *)(a1 + 32) connection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_4;
  void v21[3] = &unk_1E62978D0;
  v21[4] = *(void *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 72);
  id v9 = (id)v17;
  long long v22 = v17;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v21];
  uint64_t v11 = *(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  id v12 = [*(id *)(a1 + 40) allObjects];
  id v13 = [*(id *)(a1 + 48) photoLibraryURL];
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 88);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_3_462;
  v19[3] = &unk_1E6297948;
  v19[4] = *(void *)(a1 + 32);
  long long v18 = *(_OWORD *)(a1 + 72);
  id v16 = (id)v18;
  long long v20 = v18;
  [v10 requestAssetAnalysis:v11 forLocalIdentifiers:v12 fromPhotoLibraryWithURL:v13 withOptions:v14 analysisTypes:v15 withReply:v19];
}

void __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to background analysis service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_460;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_460(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2_461;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2_461(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_3_462(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_463;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_463(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2_464;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2_464(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestBackgroundAnalysisForAssets:(id)a3 fromPhotoLibraryWithURL:(id)a4 realTime:(BOOL)a5 progessHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v12 && [v12 count])
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    int v29 = 0;
    managementQueue = self->_managementQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke;
    block[3] = &unk_1E6297998;
    id v24 = &v26;
    void block[4] = self;
    id v22 = v14;
    id v23 = v15;
    id v20 = v13;
    id v21 = v12;
    BOOL v25 = a5;
    dispatch_sync(managementQueue, block);
    int v17 = *((_DWORD *)v27 + 6);

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    (*((void (**)(id, void, void))v15 + 2))(v15, 0, 0);
    int v17 = 0;
  }

  return v17;
}

void __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v3;
  v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 56)) {
    id v5 = *(const void **)(a1 + 56);
  }
  else {
    id v5 = &__block_literal_global_466;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  id v8 = [*(id *)(a1 + 32) connection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_3;
  void v21[3] = &unk_1E62978D0;
  v21[4] = *(void *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 64);
  id v9 = (id)v17;
  long long v22 = v17;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v21];
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v12 = *(unsigned int *)(*(void *)(v11 + 8) + 24);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(unsigned __int8 *)(a1 + 80);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_3_469;
  v18[3] = &unk_1E6297948;
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v20 = v11;
  v18[4] = v16;
  id v19 = *(id *)(a1 + 64);
  [v10 requestAssetAnalysis:v12 forPhotoLibraryURL:v13 withLocalIdentifiers:v14 realTime:v15 withReply:v18];
}

void __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to background analysis service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_467;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_467(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_2_468;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_2_468(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_3_469(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_470;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_470(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_2_471;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_2_471(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestBackgroundAnalysisForAssets:(id)a3 realTime:(BOOL)a4 progessHandler:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_msgSend(MEMORY[0x1E4F39220], "vcp_defaultURL");
  LODWORD(v8) = [(VCPMediaAnalysisService *)self requestBackgroundAnalysisForAssets:v10 fromPhotoLibraryWithURL:v13 realTime:v8 progessHandler:v11 completionHandler:v12];

  return v8;
}

- (int)requestProcessingWithTaskID:(unint64_t)a3 forPhotoLibrary:(id)a4 withOptions:(id)a5 progessHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke;
  block[3] = &unk_1E62979E8;
  id v26 = v15;
  v27 = &v29;
  unint64_t v28 = a3;
  void block[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v15;
  id v20 = v14;
  dispatch_sync(managementQueue, block);
  LODWORD(a3) = *((_DWORD *)v30 + 6);

  _Block_object_dispose(&v29, 8);
  return a3;
}

void __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v3;
  v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 56)) {
    id v5 = *(const void **)(a1 + 56);
  }
  else {
    id v5 = &__block_literal_global_474;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  uint64_t v8 = [*(id *)(a1 + 32) connection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_3;
  v20[3] = &unk_1E62978D0;
  v20[4] = *(void *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 64);
  id v9 = (id)v16;
  long long v21 = v16;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v20];
  uint64_t v11 = *(void *)(a1 + 80);
  uint64_t v12 = *(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  id v13 = [*(id *)(a1 + 40) photoLibraryURL];
  uint64_t v14 = *(void *)(a1 + 48);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_3_477;
  v18[3] = &unk_1E62979C0;
  v18[4] = *(void *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 64);
  id v15 = (id)v17;
  long long v19 = v17;
  [v10 requestLibraryProcessing:v12 withTaskID:v11 forPhotoLibraryURL:v13 withOptions:v14 andReply:v18];
}

void __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Photos background analysis service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_475;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_475(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_2_476;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_2_476(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_3_477(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v15 = v5;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request %d has completed", buf, 8u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_478;
  block[3] = &unk_1E62978A8;
  void block[4] = v6;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v10;
  long long v13 = v10;
  id v12 = v3;
  id v9 = v3;
  dispatch_async(v7, block);
}

void __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_478(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_2_479;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_2_479(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (int)requestBackgroundProcessingWithTaskID:(unint64_t)a3 forPhotoLibrary:(id)a4 progessHandler:(id)a5 completionHandler:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (a3 <= 7 && ((1 << a3) & 0x8E) != 0)
  {
    int v13 = [(VCPMediaAnalysisService *)self requestProcessingWithTaskID:a3 forPhotoLibrary:v10 withOptions:0 progessHandler:v11 andCompletionHandler:v12];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      int v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v16 = 134217984;
        unint64_t v17 = a3;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_INFO, "[MediaAnalysis] Unsupported task %lu", (uint8_t *)&v16, 0xCu);
      }
    }
    int v13 = -1;
  }

  return v13;
}

- (int)requestSceneProcessingForPhotoLibrary:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  return [(VCPMediaAnalysisService *)self requestProcessingWithTaskID:2 forPhotoLibrary:a3 withOptions:a4 progessHandler:a5 andCompletionHandler:a6];
}

- (int)requestFaceProcessingForPhotoLibrary:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  return [(VCPMediaAnalysisService *)self requestProcessingWithTaskID:3 forPhotoLibrary:a3 withOptions:a4 progessHandler:a5 andCompletionHandler:a6];
}

- (int)requestMultiWorkerProcessingForPhotoLibrary:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  return [(VCPMediaAnalysisService *)self requestProcessingWithTaskID:7 forPhotoLibrary:a3 withOptions:a4 progessHandler:a5 andCompletionHandler:a6];
}

- (int)requestFullProcessingForPhotoLibrary:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  return [(VCPMediaAnalysisService *)self requestProcessingWithTaskID:1 forPhotoLibrary:a3 withOptions:a4 progessHandler:a5 andCompletionHandler:a6];
}

- (int)requestVideoCaptionForFrames:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  managementQueue = self->_managementQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke;
  v20[3] = &unk_1E6297A10;
  id v24 = v13;
  id v25 = &v26;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  id v18 = v12;
  dispatch_sync(managementQueue, v20);
  LODWORD(v10) = *((_DWORD *)v27 + 6);

  _Block_object_dispose(&v26, 8);
  return (int)v10;
}

void __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v3;
  v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 56)) {
    int v5 = *(const void **)(a1 + 56);
  }
  else {
    int v5 = &__block_literal_global_481;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  id v8 = [*(id *)(a1 + 32) connection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_3;
  v20[3] = &unk_1E62978D0;
  v20[4] = *(void *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 64);
  id v9 = (id)v16;
  long long v21 = v16;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v20];
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v12 = *(unsigned int *)(*(void *)(v11 + 8) + 24);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_3_484;
  v17[3] = &unk_1E6297948;
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v19 = v11;
  v17[4] = v15;
  id v18 = *(id *)(a1 + 64);
  [v10 requestVideoFramesProcessing:v12 withTaskID:15 frames:v13 options:v14 andReply:v17];
}

void __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Photos background analysis service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_482;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_482(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_2_483;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_2_483(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_3_484(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Asset processing request %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_485;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_485(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_2_486;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_2_486(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestRecentsProcessing:(unint64_t)a3 photoLibrary:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  managementQueue = self->_managementQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke;
  v18[3] = &unk_1E6297A38;
  id v20 = v11;
  id v21 = v12;
  id v22 = &v24;
  unint64_t v23 = a3;
  v18[4] = self;
  id v19 = v10;
  id v14 = v10;
  id v15 = v12;
  id v16 = v11;
  dispatch_sync(managementQueue, v18);
  LODWORD(self) = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v24, 8);
  return (int)self;
}

void __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 48)) {
    id v5 = *(const void **)(a1 + 48);
  }
  else {
    id v5 = &__block_literal_global_488;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  id v8 = [*(id *)(a1 + 32) connection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_3;
  v19[3] = &unk_1E62978D0;
  v19[4] = *(void *)(a1 + 32);
  long long v15 = *(_OWORD *)(a1 + 56);
  id v9 = (id)v15;
  long long v20 = v15;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v19];
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v12 = *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  id v13 = [*(id *)(a1 + 40) photoLibraryURL];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_3_491;
  v17[3] = &unk_1E62979C0;
  v17[4] = *(void *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 56);
  id v14 = (id)v16;
  long long v18 = v16;
  [v10 requestRecentsProcessing:v12 withTaskID:v11 photoLibraryWithURL:v13 reply:v17];
}

void __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Photos background analysis service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_489;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_489(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_2_490;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_2_490(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_3_491(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v15 = v5;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "[MediaAnalysis] Asset processing request %d has completed", buf, 8u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_492;
  block[3] = &unk_1E62978A8;
  void block[4] = v6;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v10;
  long long v13 = v10;
  id v12 = v3;
  id v9 = v3;
  dispatch_async(v7, block);
}

void __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_492(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_2_493;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_2_493(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (int)requestProcessingWithTaskID:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v29 = a5;
  id v30 = a6;
  long long v13 = (void (**)(id, void, void *))a7;
  id v14 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", v12);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v47 count:16];
  unint64_t v28 = a3;
  id v17 = 0;
  if (v16)
  {
    uint64_t v18 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v44 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if (v17)
        {
          id v21 = [*(id *)(*((void *)&v43 + 1) + 8 * i) photoLibrary];
          BOOL v22 = v21 == v17;

          if (!v22)
          {
            id v25 = [(id)objc_opt_class() errorWithDescription:@"Assets from multiple libraries not supported"];
            v13[2](v13, 0, v25);

            int v26 = 0;
            goto LABEL_13;
          }
        }
        else
        {
          id v17 = [*(id *)(*((void *)&v43 + 1) + 8 * i) photoLibrary];
        }
        unint64_t v23 = [v20 localIdentifier];
        [v14 addObject:v23];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v16);
  }

  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  int v42 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke;
  block[3] = &unk_1E6297970;
  unint64_t v37 = &v39;
  void block[4] = self;
  id v35 = v30;
  id v36 = v13;
  unint64_t v38 = v28;
  id v32 = v14;
  id v17 = v17;
  id v33 = v17;
  id v34 = v29;
  dispatch_sync(managementQueue, block);
  int v26 = *((_DWORD *)v40 + 6);

  _Block_object_dispose(&v39, 8);
LABEL_13:

  return v26;
}

void __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v3;
  v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 64)) {
    int v5 = *(const void **)(a1 + 64);
  }
  else {
    int v5 = &__block_literal_global_495;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  id v8 = [*(id *)(a1 + 32) connection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_3;
  void v21[3] = &unk_1E62978D0;
  v21[4] = *(void *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 72);
  id v9 = (id)v17;
  long long v22 = v17;
  long long v10 = [v8 remoteObjectProxyWithErrorHandler:v21];
  uint64_t v11 = *(void *)(a1 + 88);
  uint64_t v12 = *(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  long long v13 = [*(id *)(a1 + 40) allObjects];
  id v14 = [*(id *)(a1 + 48) photoLibraryURL];
  uint64_t v15 = *(void *)(a1 + 56);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_3_498;
  v19[3] = &unk_1E6297948;
  v19[4] = *(void *)(a1 + 32);
  long long v18 = *(_OWORD *)(a1 + 72);
  id v16 = (id)v18;
  long long v20 = v18;
  [v10 requestAssetProcessing:v12 withTaskID:v11 forLocalIdentifiers:v13 fromPhotoLibraryWithURL:v14 withOptions:v15 andReply:v19];
}

void __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Photos background analysis service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_496;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_496(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2_497;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2_497(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_3_498(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Asset processing request %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_499;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_499(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2_500;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2_500(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestLivePhotoEffectsForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __109__VCPMediaAnalysisService_requestLivePhotoEffectsForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke;
  v13[3] = &unk_1E6297A60;
  id v14 = v10;
  id v11 = v10;
  LODWORD(a5) = [(VCPMediaAnalysisService *)self requestProcessingWithTaskID:4 forAssets:a3 withOptions:a4 progressHandler:a5 andCompletionHandler:v13];

  return (int)a5;
}

uint64_t __109__VCPMediaAnalysisService_requestLivePhotoEffectsForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requestSceneProcessingForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __108__VCPMediaAnalysisService_requestSceneProcessingForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke;
  v13[3] = &unk_1E6297A60;
  id v14 = v10;
  id v11 = v10;
  LODWORD(a5) = [(VCPMediaAnalysisService *)self requestProcessingWithTaskID:2 forAssets:a3 withOptions:a4 progressHandler:a5 andCompletionHandler:v13];

  return (int)a5;
}

uint64_t __108__VCPMediaAnalysisService_requestSceneProcessingForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requestFaceProcessingForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __107__VCPMediaAnalysisService_requestFaceProcessingForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke;
  v13[3] = &unk_1E6297A60;
  id v14 = v10;
  id v11 = v10;
  LODWORD(a5) = [(VCPMediaAnalysisService *)self requestProcessingWithTaskID:3 forAssets:a3 withOptions:a4 progressHandler:a5 andCompletionHandler:v13];

  return (int)a5;
}

uint64_t __107__VCPMediaAnalysisService_requestFaceProcessingForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requestQuickFaceIdentificationForPhotoLibraryURL:(id)a3 withOptions:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 objectForKeyedSubscript:@"InProcess"];
  int v12 = [v11 BOOLValue];

  if (v12 && (int)MediaAnalysisLogLevel() >= 4)
  {
    id v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEFAULT, "In-Process quick face identification not supported", buf, 2u);
    }
  }
  *(void *)long long buf = 0;
  int v26 = buf;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke;
  block[3] = &unk_1E6297A88;
  id v23 = v10;
  uint64_t v24 = buf;
  void block[4] = self;
  id v21 = v8;
  id v22 = v9;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  dispatch_sync(managementQueue, block);
  int v18 = *((_DWORD *)v26 + 6);

  _Block_object_dispose(buf, 8);
  return v18;
}

void __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v5 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v4 setObject:&__block_literal_global_502 forKey:v5];

  id v6 = [*(id *)(a1 + 32) connection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_3;
  v18[3] = &unk_1E62978D0;
  v18[4] = *(void *)(a1 + 32);
  long long v14 = *(_OWORD *)(a1 + 56);
  id v7 = (id)v14;
  long long v19 = v14;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v18];
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(unsigned int *)(*(void *)(v9 + 8) + 24);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_3_505;
  v15[3] = &unk_1E62979C0;
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v17 = v9;
  v15[4] = v13;
  id v16 = *(id *)(a1 + 56);
  [v8 requestLibraryProcessing:v10 withTaskID:8 forPhotoLibraryURL:v11 withOptions:v12 andReply:v15];
}

void __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Photos Quick Face Identification service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_503;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_503(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_2_504;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_2_504(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_3_505(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v15 = v5;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "[MediaAnalysis] Asset processing request %d has completed", buf, 8u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_506;
  block[3] = &unk_1E62978A8;
  void block[4] = v6;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v10;
  long long v13 = v10;
  id v12 = v3;
  id v9 = v3;
  dispatch_async(v7, block);
}

void __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_506(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_2_507;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_2_507(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (int)requestSceneprintProcessingForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [v11 objectForKeyedSubscript:@"InProcess"];
  int v15 = [v14 BOOLValue];

  if (v15)
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    int v24 = 0;
    managementQueue = self->_managementQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __113__VCPMediaAnalysisService_requestSceneprintProcessingForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke;
    v20[3] = &unk_1E6297458;
    v20[4] = self;
    void v20[5] = &v21;
    dispatch_sync(managementQueue, v20);
    uint64_t v17 = +[VCPPhotosSceneprintAssetProcessingTask taskWithAssets:v10 options:v11 andCompletionHandler:v13];
    [v17 run];
    int v18 = *((_DWORD *)v22 + 6);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    int v18 = [(VCPMediaAnalysisService *)self requestProcessingWithTaskID:5 forAssets:v10 withOptions:v11 progressHandler:v12 andCompletionHandler:v13];
  }

  return v18;
}

uint64_t __113__VCPMediaAnalysisService_requestSceneprintProcessingForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(v1 + 40);
  *(_DWORD *)(v1 + 40) = v2 + 1;
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (int)requestVideoStabilizationForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [v11 objectForKeyedSubscript:@"InProcess"];
  int v15 = [v14 BOOLValue];

  if (v15)
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    int v24 = 0;
    managementQueue = self->_managementQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __111__VCPMediaAnalysisService_requestVideoStabilizationForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke;
    v20[3] = &unk_1E6297458;
    v20[4] = self;
    void v20[5] = &v21;
    dispatch_sync(managementQueue, v20);
    uint64_t v17 = +[VCPVideoStabilizationAssetProcessingTask taskWithAssets:v10 andOptions:v11 andCompletionHandler:v13];
    [v17 run];
    int v18 = *((_DWORD *)v22 + 6);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    int v18 = [(VCPMediaAnalysisService *)self requestProcessingWithTaskID:6 forAssets:v10 withOptions:v11 progressHandler:v12 andCompletionHandler:v13];
  }

  return v18;
}

uint64_t __111__VCPMediaAnalysisService_requestVideoStabilizationForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(v1 + 40);
  *(_DWORD *)(v1 + 40) = v2 + 1;
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (int)requestFRCForAssetURL:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  if (!v10)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "[MediaAnalysis] requestFRCForAssetURL call with invalid assetURL", (uint8_t *)&buf, 2u);
      }
    }
    id v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v67 = *MEMORY[0x1E4F28568];
    uint64_t v23 = [NSString stringWithFormat:@"[MediaAnalysis] requestFRCForAssetURL call with invalid assetURL"];
    v68[0] = v23;
    int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
    id v25 = [v22 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v24];

    v13[2](v13, 0, v25);
    goto LABEL_17;
  }
  long long v14 = [v11 objectForKeyedSubscript:@"InProcess"];
  int v15 = [v14 BOOLValue];

  if (!v15)
  {
    id v26 = [v10 path];
    [v26 UTF8String];
    uint64_t v27 = (void *)sandbox_extension_issue_file();

    if (v27)
    {
      int v28 = [NSString stringWithUTF8String:v27];
      id v29 = [v10 path];
      free(v27);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v63 = 0x2020000000;
      LODWORD(v64) = 0;
      managementQueue = self->_managementQueue;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_517;
      v40[3] = &unk_1E6297B00;
      p_long long buf = &buf;
      v40[4] = self;
      id v44 = v12;
      long long v45 = v13;
      id v41 = v29;
      id v42 = v11;
      id v43 = v28;
      id v31 = v28;
      id v32 = v29;
      dispatch_sync(managementQueue, v40);
      int v19 = *(_DWORD *)(*((void *)&buf + 1) + 24);

      int v20 = (uint64_t *)&buf;
      goto LABEL_11;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v33 = VCPLogInstance();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = [v10 path];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v34;
        _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_DEFAULT, "Failed to issue sandbox extension on %@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v59 = *MEMORY[0x1E4F28568];
    id v36 = [NSString stringWithFormat:@"[MediaAnalysis] Error issuing sandbox extension"];
    v60 = v36;
    unint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    unint64_t v38 = [v35 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v37];

    v13[2](v13, 0, v38);
LABEL_17:
    int v19 = 0;
    goto LABEL_18;
  }
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  int v58 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__5;
  v65 = __Block_byref_object_dispose__5;
  id v66 = 0;
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = __Block_byref_object_copy__5;
  int v53 = __Block_byref_object_dispose__5;
  id v54 = 0;
  uint64_t v16 = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke;
  block[3] = &unk_1E6297458;
  void block[4] = self;
  void block[5] = &v55;
  dispatch_sync(v16, block);
  id v61 = v10;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_2;
  v47[3] = &unk_1E6297AB0;
  v47[4] = &v49;
  v47[5] = &buf;
  int v18 = +[VCPFullAnalysisURLProcessingTask taskForURLAsset:v17 withOptions:v11 analysisTypes:0x20000000 progressHandler:0 completionHandler:v47];

  [v18 run];
  v13[2](v13, v50[5], *(void **)(*((void *)&buf + 1) + 40));
  int v19 = *((_DWORD *)v56 + 6);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&buf, 8);

  int v20 = &v55;
LABEL_11:
  _Block_object_dispose(v20, 8);
LABEL_18:

  return v19;
}

uint64_t __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(v1 + 40);
  *(_DWORD *)(v1 + 40) = v2 + 1;
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

void __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id v6 = objc_msgSend(v16, "vcp_results");
  id v7 = [v6 objectForKeyedSubscript:@"InterpolationResults"];

  if ([v7 count])
  {
    id v8 = [v7 objectAtIndexedSubscript:0];
    id v9 = [v8 objectForKeyedSubscript:@"attributes"];
    id v10 = [v9 objectForKeyedSubscript:@"interpolationURL"];

    uint64_t v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  int v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v5;
}

void __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_517(uint64_t a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v3;
  v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 64)) {
    id v5 = *(const void **)(a1 + 64);
  }
  else {
    id v5 = &__block_literal_global_520;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  id v8 = [*(id *)(a1 + 32) connection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_3;
  v20[3] = &unk_1E62978D0;
  v20[4] = *(void *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 72);
  id v9 = (id)v16;
  long long v21 = v16;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v20];
  uint64_t v11 = *(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  v23[0] = *(void *)(a1 + 40);
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v22 = *(void *)(a1 + 56);
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_3_523;
  v18[3] = &unk_1E6297AD8;
  v18[4] = *(void *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 72);
  id v15 = (id)v17;
  long long v19 = v17;
  [v10 requestURLAssetAnalysis:v11 forAssetWithResourcePaths:v12 withOptions:v13 analysisTypes:0x20000000 sandboxTokens:v14 withReply:v18];
}

void __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to FRC analysis service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_521;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_521(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_2_522;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_2_522(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_3_523(uint64_t a1, void *a2, void *a3)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(v5, "vcp_results");
  id v8 = [v7 objectForKeyedSubscript:@"InterpolationResults"];

  if ([v8 count])
  {
    long long v9 = [v8 objectAtIndexedSubscript:0];
    id v10 = [v9 objectForKeyedSubscript:@"attributes"];
    id v11 = [v10 objectForKeyedSubscript:@"interpolationURL"];

    long long v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
  }
  else if (v6)
  {
    long long v12 = 0;
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    uint64_t v14 = [NSString stringWithFormat:@"FRC gating not passed"];
    v28[0] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    uint64_t v16 = [v13 errorWithDomain:*MEMORY[0x1E4F28760] code:0 userInfo:v15];

    long long v12 = 0;
    id v6 = (id)v16;
  }
  uint64_t v17 = *(void *)(a1 + 32);
  int v18 = *(NSObject **)(v17 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_4;
  block[3] = &unk_1E6297920;
  void block[4] = v17;
  long long v22 = *(_OWORD *)(a1 + 40);
  id v19 = (id)v22;
  long long v26 = v22;
  id v24 = v12;
  id v25 = v6;
  id v20 = v6;
  id v21 = v12;
  dispatch_async(v18, block);
}

void __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_5;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestWallpaperUpgradeAtURL:(id)a3 toDestinationURL:(id)a4 withOptions:(id)a5 andCompletionHandler:(id)a6
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, id))a6;
  if (!v10 || !v11)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "[MediaAnalysis] requestWallpaperUpgradeAtURL call with invalid URL", (uint8_t *)&buf, 2u);
      }
    }
    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F28568];
    id v25 = [NSString stringWithFormat:@"[MediaAnalysis] requestWallpaperUpgradeAtURL call with invalid URL"];
    v55[0] = v25;
    long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
    id v14 = [v24 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v26];

    v13[2](v13, 0, v14);
    goto LABEL_21;
  }
  id v14 = [MEMORY[0x1E4F1CA48] array];
  id v15 = [v10 path];
  [v15 UTF8String];
  uint64_t v16 = (void *)sandbox_extension_issue_file();

  if (!v16)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      uint64_t v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = [v10 path];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v28;
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_DEFAULT, "Failed to issue sandbox extension on %@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v52 = *MEMORY[0x1E4F28568];
    id v30 = [NSString stringWithFormat:@"[MediaAnalysis] Error issuing sandbox extension"];
    int v53 = v30;
    id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    id v32 = [v29 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v31];

    v13[2](v13, 0, v32);
    goto LABEL_21;
  }
  uint64_t v17 = [NSString stringWithUTF8String:v16];
  [v14 addObject:v17];

  free(v16);
  id v18 = [v11 path];
  [v18 UTF8String];
  id v19 = (void *)sandbox_extension_issue_file();

  if (!v19)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v33 = VCPLogInstance();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = [v11 path];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v34;
        _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_DEFAULT, "Failed to issue sandbox extension on %@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    id v36 = [NSString stringWithFormat:@"[MediaAnalysis] Error issuing sandbox extension"];
    uint64_t v51 = v36;
    unint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    unint64_t v38 = [v35 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v37];

    v13[2](v13, 0, v38);
LABEL_21:
    int v22 = 0;
    goto LABEL_22;
  }
  id v20 = [NSString stringWithUTF8String:v19];
  [v14 addObject:v20];

  free(v19);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v48 = 0x2020000000;
  int v49 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke;
  block[3] = &unk_1E6297B28;
  p_long long buf = &buf;
  void block[4] = self;
  long long v45 = v13;
  id v41 = v10;
  id v42 = v11;
  id v43 = v12;
  id v14 = v14;
  id v44 = v14;
  dispatch_sync(managementQueue, block);
  int v22 = *(_DWORD *)(*((void *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
LABEL_22:

  return v22;
}

void __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v3;
  v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v5 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
  [v4 setObject:&__block_literal_global_531 forKey:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  aBlock[4] = *(void *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 72);
  id v6 = (id)v17;
  long long v22 = v17;
  id v7 = _Block_copy(aBlock);
  id v8 = [*(id *)(a1 + 32) connection];
  long long v9 = [v8 remoteObjectProxyWithErrorHandler:v7];

  uint64_t v10 = *(void *)(a1 + 80);
  uint64_t v11 = *(unsigned int *)(*(void *)(v10 + 8) + 24);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 64);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_3_534;
  v18[3] = &unk_1E6297948;
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v20 = v10;
  v18[4] = v16;
  id v19 = *(id *)(a1 + 72);
  [v9 requestWallpaperUpgrade:v11 atSourceURL:v12 toDestinationURL:v13 withOptions:v14 sandboxTokens:v15 andReply:v18];
}

void __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to wallpaper upgrade service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_532;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_532(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_2_533;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_2_533(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_3_534(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Wallpaper upgrade %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_535;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_535(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_2_536;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_2_536(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)reportProgress:(double)a3 forRequest:(int)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 67109376;
      int v12 = a4;
      __int16 v13 = 2048;
      double v14 = a3;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "[MediaAnalysis] Request %d is %.2f%% complete", buf, 0x12u);
    }
  }
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__VCPMediaAnalysisService_reportProgress_forRequest___block_invoke;
  block[3] = &unk_1E6297B78;
  void block[4] = self;
  int v10 = a4;
  *(double *)&void block[5] = a3;
  dispatch_async(managementQueue, block);
}

void __53__VCPMediaAnalysisService_reportProgress_forRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v4 = [v2 objectForKey:v3];

  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__VCPMediaAnalysisService_reportProgress_forRequest___block_invoke_2;
    v6[3] = &unk_1E6297B50;
    id v7 = v4;
    uint64_t v8 = *(void *)(a1 + 40);
    dispatch_async(v5, v6);
  }
}

uint64_t __53__VCPMediaAnalysisService_reportProgress_forRequest___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)cancelRequest:(int)a3
{
  managementQueue = self->_managementQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__VCPMediaAnalysisService_cancelRequest___block_invoke;
  v4[3] = &unk_1E6297BC0;
  v4[4] = self;
  int v5 = a3;
  dispatch_sync(managementQueue, v4);
}

void __41__VCPMediaAnalysisService_cancelRequest___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  id v3 = objc_msgSend(v2, "objectForKey:");

  if (v3)
  {
    id v8 = [*(id *)(a1 + 32) connection];
    v4 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_538];
    [v4 cancelRequest:*(unsigned int *)(a1 + 40)];
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    int v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)long long buf = 67109120;
      int v10 = v6;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Unknown analysis request %d; dropping cancellation request",
        buf,
        8u);
    }
  }
}

void __41__VCPMediaAnalysisService_cancelRequest___block_invoke_2()
{
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v0 = VCPLogInstance();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v1 = 0;
      _os_log_impl(&dword_1BBEDA000, v0, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to background analysis service", v1, 2u);
    }
  }
}

- (void)cancelAllRequests
{
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__VCPMediaAnalysisService_cancelAllRequests__block_invoke;
  block[3] = &unk_1E6296FF8;
  void block[4] = self;
  dispatch_sync(managementQueue, block);
}

void __44__VCPMediaAnalysisService_cancelAllRequests__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    id v4 = [*(id *)(a1 + 32) connection];
    uint64_t v2 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_540];
    [v2 cancelAllRequests];
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] No active analysis requests; dropping cancellation request",
        buf,
        2u);
    }
  }
}

void __44__VCPMediaAnalysisService_cancelAllRequests__block_invoke_2()
{
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v0 = VCPLogInstance();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v1 = 0;
      _os_log_impl(&dword_1BBEDA000, v0, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to background analysis service", v1, 2u);
    }
  }
}

- (void)cancelBackgroundActivity
{
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VCPMediaAnalysisService_cancelBackgroundActivity__block_invoke;
  block[3] = &unk_1E6296FF8;
  void block[4] = self;
  dispatch_sync(managementQueue, block);
}

void __51__VCPMediaAnalysisService_cancelBackgroundActivity__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__VCPMediaAnalysisService_cancelBackgroundActivity__block_invoke_2;
  aBlock[3] = &unk_1E6297BE8;
  id v3 = v2;
  double v14 = v3;
  id v4 = _Block_copy(aBlock);
  int v5 = [*(id *)(a1 + 32) connection];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  int v10 = __51__VCPMediaAnalysisService_cancelBackgroundActivity__block_invoke_541;
  uint64_t v11 = &unk_1E6297C10;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&v8];
  objc_msgSend(v7, "cancelBackgroundActivityWithReply:", v6, v8, v9, v10, v11);

  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
}

void __51__VCPMediaAnalysisService_cancelBackgroundActivity__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        id v9 = v3;
        int v5 = "[MediaAnalysis] Failed to cancel background analysis: %@";
        id v6 = v4;
        uint32_t v7 = 12;
LABEL_8:
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      int v5 = "[MediaAnalysis] Background analysis canceled";
      id v6 = v4;
      uint32_t v7 = 2;
      goto LABEL_8;
    }
LABEL_9:
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __51__VCPMediaAnalysisService_cancelBackgroundActivity__block_invoke_541(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__VCPMediaAnalysisService_invalidate__block_invoke;
  block[3] = &unk_1E6296FF8;
  void block[4] = self;
  dispatch_sync(managementQueue, block);
}

uint64_t __37__VCPMediaAnalysisService_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
}

- (void)notifyLibraryAvailableAtURL:(id)a3
{
  id v6 = a3;
  id v4 = [(VCPMediaAnalysisService *)self connection];
  int v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_543];
  [v5 notifyLibraryAvailableAtURL:v6];
}

void __55__VCPMediaAnalysisService_notifyLibraryAvailableAtURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 description];
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to background analysis service: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

+ (int)queryProgress:(float *)a3 forPhotoLibrary:(id)a4 andTaskID:(unint64_t)a5
{
  return +[VCPAnalysisProgressQuery queryAnalysisProgress:a3 photoLibrary:a4 taskID:a5 cancelOrExtendTimeoutBlock:0];
}

+ (int)queryProgress:(float *)a3 forPhotoLibrary:(id)a4 andTaskID:(unint64_t)a5 withExtendTimeoutBlock:(id)a6
{
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__VCPMediaAnalysisService_queryProgress_forPhotoLibrary_andTaskID_withExtendTimeoutBlock___block_invoke;
  v12[3] = &unk_1E6297C38;
  id v13 = v9;
  id v10 = v9;
  LODWORD(a5) = +[VCPAnalysisProgressQuery queryAnalysisProgress:a3 photoLibrary:a4 taskID:a5 cancelOrExtendTimeoutBlock:v12];

  return a5;
}

uint64_t __90__VCPMediaAnalysisService_queryProgress_forPhotoLibrary_andTaskID_withExtendTimeoutBlock___block_invoke(uint64_t a1)
{
  return 0;
}

+ (int)queryCachedFaceAnalysisProgress:(id *)a3 forPhotoLibrary:(id)a4
{
  return +[VCPAnalysisProgressQuery queryCachedFaceAnalysisProgress:a3 photoLibrary:a4];
}

+ (int)queryCachedFaceAnalysisProgress:(id *)a3 forPhotoLibrary:(id)a4 withExtendTimeoutBlock:(id)a5
{
  return +[VCPAnalysisProgressQuery queryCachedFaceAnalysisProgress:photoLibrary:](VCPAnalysisProgressQuery, "queryCachedFaceAnalysisProgress:photoLibrary:", a3, a4, a5);
}

+ (int)queryProgressDetail:(id *)a3 forPhotoLibrary:(id)a4 andTaskID:(unint64_t)a5
{
  return +[VCPAnalysisProgressQuery queryProgressDetail:a3 photoLibrary:a4 taskID:a5 cancelOrExtendTimeoutBlock:0];
}

+ (int)queryProgressDetail:(id *)a3 forPhotoLibrary:(id)a4 andTaskID:(unint64_t)a5 withExtendTimeoutBlock:(id)a6
{
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__VCPMediaAnalysisService_queryProgressDetail_forPhotoLibrary_andTaskID_withExtendTimeoutBlock___block_invoke;
  v12[3] = &unk_1E6297C38;
  id v13 = v9;
  id v10 = v9;
  LODWORD(a5) = +[VCPAnalysisProgressQuery queryProgressDetail:a3 photoLibrary:a4 taskID:a5 cancelOrExtendTimeoutBlock:v12];

  return a5;
}

uint64_t __96__VCPMediaAnalysisService_queryProgressDetail_forPhotoLibrary_andTaskID_withExtendTimeoutBlock___block_invoke(uint64_t a1)
{
  return 0;
}

+ (int)queryProgressDetail:(id *)a3 forPhotoLibraryURL:(id)a4 andTaskID:(unint64_t)a5
{
  id v7 = a4;
  if ([MEMORY[0x1E4F39220] isMultiLibraryModeEnabled])
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F39220]) initWithPhotoLibraryURL:v7];
  }
  else
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F39220], "vcp_defaultPhotoLibrary");
  }
  id v9 = (void *)v8;
  int v10 = +[VCPAnalysisProgressQuery queryProgressDetail:a3 photoLibrary:v8 taskID:a5 cancelOrExtendTimeoutBlock:0];

  return v10;
}

+ (int)queryProgressDetail:(id *)a3 forPhotoLibraryURL:(id)a4 andTaskID:(unint64_t)a5 withExtendTimeoutBlock:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  if ([MEMORY[0x1E4F39220] isMultiLibraryModeEnabled])
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F39220]) initWithPhotoLibraryURL:v9];
  }
  else
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F39220], "vcp_defaultPhotoLibrary");
  }
  id v12 = (void *)v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __99__VCPMediaAnalysisService_queryProgressDetail_forPhotoLibraryURL_andTaskID_withExtendTimeoutBlock___block_invoke;
  v16[3] = &unk_1E6297C38;
  id v13 = v10;
  id v17 = v13;
  int v14 = +[VCPAnalysisProgressQuery queryProgressDetail:a3 photoLibrary:v12 taskID:a5 cancelOrExtendTimeoutBlock:v16];

  return v14;
}

uint64_t __99__VCPMediaAnalysisService_queryProgressDetail_forPhotoLibraryURL_andTaskID_withExtendTimeoutBlock___block_invoke(uint64_t a1)
{
  return 0;
}

- (int)requestPersonPreferenceForPhotoLibraryURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  managementQueue = self->_managementQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke;
  v12[3] = &unk_1E6297C60;
  id v14 = v7;
  uint64_t v15 = &v16;
  void v12[4] = self;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(managementQueue, v12);
  LODWORD(v6) = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return (int)v6;
}

void __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  int v5 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v4 setObject:&__block_literal_global_547 forKey:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v12;
  long long v17 = v12;
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = [*(id *)(a1 + 32) connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v7];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_3_550;
  v14[3] = &unk_1E6297948;
  uint64_t v10 = *(void *)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 48);
  id v11 = (id)v13;
  long long v15 = v13;
  [v9 requestPersonPreferenceForPhotoLibraryURL:v10 andReply:v14];
}

void __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request PersonPromoterStatus service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_548;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_548(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_2_549;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_2_549(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_3_550(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request Person Preference %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_551;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_551(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_2_552;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_2_552(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestVIPModelFilepathForPhotoLibraryURL:(id)a3 forModelType:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke;
  block[3] = &unk_1E6297CB0;
  id v16 = v9;
  id v17 = &v19;
  void block[4] = self;
  id v15 = v8;
  unint64_t v18 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(managementQueue, block);
  LODWORD(self) = *((_DWORD *)v20 + 6);

  _Block_object_dispose(&v19, 8);
  return (int)self;
}

void __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v5 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v4 setObject:&__block_literal_global_554 forKey:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v13;
  long long v18 = v13;
  id v7 = _Block_copy(aBlock);
  id v8 = [*(id *)(a1 + 32) connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v7];

  uint64_t v10 = *(void *)(a1 + 64);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_3_557;
  v15[3] = &unk_1E6297C88;
  uint64_t v11 = *(void *)(a1 + 40);
  v15[4] = *(void *)(a1 + 32);
  long long v14 = *(_OWORD *)(a1 + 48);
  id v12 = (id)v14;
  long long v16 = v14;
  [v9 requestVIPModelStorageFilepathForPhotoLibraryURL:v11 forModelType:v10 andReply:v15];
}

void __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request PersonPromoterStatus service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_555;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_555(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_2_556;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_2_556(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_3_557(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request VIP model filepath Preference %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_558;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_558(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_2_559;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_2_559(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestMediaAnalysisDatabaseBackupForPhotoLibraryURL:(id)a3 withCompletionHandler:(id)a4 forceBackup:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler_forceBackup___block_invoke;
  block[3] = &unk_1E6297CD8;
  id v16 = v9;
  id v17 = &v19;
  void block[4] = self;
  id v15 = v8;
  BOOL v18 = a5;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(managementQueue, block);
  LODWORD(self) = *((_DWORD *)v20 + 6);

  _Block_object_dispose(&v19, 8);
  return (int)self;
}

void __114__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler_forceBackup___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v5 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v4 setObject:&__block_literal_global_562 forKey:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __114__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler_forceBackup___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v15 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v15;
  long long v20 = v15;
  id v7 = _Block_copy(aBlock);
  id v8 = [*(id *)(a1 + 32) connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v7];

  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(unsigned int *)(*(void *)(v10 + 8) + 24);
  uint64_t v12 = *(unsigned __int8 *)(a1 + 64);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __114__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler_forceBackup___block_invoke_3_565;
  v16[3] = &unk_1E62979C0;
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v18 = v10;
  void v16[4] = v13;
  id v17 = *(id *)(a1 + 48);
  [v9 requestMediaAnalysisDatabaseBackup:v11 withPhotoLibraryURL:v14 forceBackup:v12 andReply:v16];
}

void __114__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler_forceBackup___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request MediaAnalysis Database Backup service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler_forceBackup___block_invoke_563;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __114__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler_forceBackup___block_invoke_563(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __114__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler_forceBackup___block_invoke_2_564;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __114__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler_forceBackup___block_invoke_2_564(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __114__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler_forceBackup___block_invoke_3_565(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v15 = v5;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request MediaAnalysis Database Backup %d has completed", buf, 8u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler_forceBackup___block_invoke_566;
  block[3] = &unk_1E62978A8;
  void block[4] = v6;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v10;
  long long v13 = v10;
  id v12 = v3;
  id v9 = v3;
  dispatch_async(v7, block);
}

void __114__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler_forceBackup___block_invoke_566(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __114__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler_forceBackup___block_invoke_2_567;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __114__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler_forceBackup___block_invoke_2_567(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (int)requestPhotosSceneFastPassProcessingForPhotoLibraryURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  managementQueue = self->_managementQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E6297C60;
  id v14 = v7;
  int v15 = &v16;
  void v12[4] = self;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(managementQueue, v12);
  LODWORD(v6) = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return (int)v6;
}

void __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  int v5 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v4 setObject:&__block_literal_global_569 forKey:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v14 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v14;
  long long v19 = v14;
  id v7 = _Block_copy(aBlock);
  id v8 = [*(id *)(a1 + 32) connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v7];

  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(unsigned int *)(*(void *)(v10 + 8) + 24);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_3_572;
  v15[3] = &unk_1E62979C0;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v17 = v10;
  v15[4] = v12;
  id v16 = *(id *)(a1 + 48);
  [v9 requestPhotosSceneFastPassProcessing:v11 withPhotoLibraryURL:v13 andReply:v15];
}

void __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request FastPass Scene Processing service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_570;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_570(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_2_571;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_2_571(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_3_572(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v15 = v5;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request FastPass Scene Processing %d has completed", buf, 8u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_573;
  block[3] = &unk_1E62978A8;
  void block[4] = v6;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v10;
  long long v13 = v10;
  id v12 = v3;
  id v9 = v3;
  dispatch_async(v7, block);
}

void __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_573(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_2_574;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_2_574(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (int)requestPhotosFaceFastPassProcessingForPhotoLibraryURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  managementQueue = self->_managementQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E6297C60;
  id v14 = v7;
  int v15 = &v16;
  void v12[4] = self;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(managementQueue, v12);
  LODWORD(v6) = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return (int)v6;
}

void __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  int v5 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v4 setObject:&__block_literal_global_576 forKey:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v14 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v14;
  long long v19 = v14;
  id v7 = _Block_copy(aBlock);
  id v8 = [*(id *)(a1 + 32) connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v7];

  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(unsigned int *)(*(void *)(v10 + 8) + 24);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_3_579;
  v15[3] = &unk_1E62979C0;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v17 = v10;
  v15[4] = v12;
  id v16 = *(id *)(a1 + 48);
  [v9 requestPhotosFaceFastPassProcessing:v11 withPhotoLibraryURL:v13 andReply:v15];
}

void __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request FastPass Face Processing service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_577;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_577(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_2_578;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_2_578(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_3_579(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v15 = v5;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request FastPass Face Processing %d has completed", buf, 8u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_580;
  block[3] = &unk_1E62978A8;
  void block[4] = v6;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v10;
  long long v13 = v10;
  id v12 = v3;
  id v9 = v3;
  dispatch_async(v7, block);
}

void __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_580(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_2_581;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_2_581(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (int)requestDatabaseRestoreFastPassProcessingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6297D00;
  id v9 = v4;
  long long v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(managementQueue, block);
  LODWORD(managementQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)managementQueue;
}

void __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  int v5 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [v4 setObject:&__block_literal_global_583 forKey:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v14 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v14;
  long long v19 = v14;
  id v7 = _Block_copy(aBlock);
  id v8 = [*(id *)(a1 + 32) connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v7];

  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v12 = *(unsigned int *)(*(void *)(v10 + 8) + 24);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_3_586;
  v15[3] = &unk_1E62979C0;
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v17 = v10;
  v15[4] = v13;
  id v16 = v11;
  [v9 requestDatabaseRestoreFastPassProcessing:v12 reply:v15];
}

void __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request database restore FastPass service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_584;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_584(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_2_585;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_2_585(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_3_586(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v15 = v5;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request database restore FastPass service %d has completed", buf, 8u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_587;
  block[3] = &unk_1E62978A8;
  void block[4] = v6;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v10;
  long long v13 = v10;
  id v12 = v3;
  id v9 = v3;
  dispatch_async(v7, block);
}

void __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_587(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_2_588;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_2_588(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBlocks, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (int)requestSuggestedPersonsForPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 photoLibraryURL:(id)a6 progessHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v36 = 0;
  unint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  int v39 = 0;
  managementQueue = self->_managementQueue;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  void v28[2] = __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke;
  v28[3] = &unk_1E6297DF8;
  id v34 = v19;
  id v35 = &v36;
  v28[4] = self;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  id v25 = v19;
  id v26 = v18;
  dispatch_sync(managementQueue, v28);
  LODWORD(v18) = *((_DWORD *)v37 + 6);

  _Block_object_dispose(&v36, 8);
  return (int)v18;
}

void __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 72)) {
    int v5 = *(const void **)(a1 + 72);
  }
  else {
    int v5 = &__block_literal_global_726;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v19 = *(_OWORD *)(a1 + 80);
  id v8 = (id)v19;
  long long v24 = v19;
  id v9 = _Block_copy(aBlock);
  long long v10 = [*(id *)(a1 + 32) connection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];

  uint64_t v12 = *(void *)(a1 + 88);
  uint64_t v13 = *(unsigned int *)(*(void *)(v12 + 8) + 24);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v17 = *(void *)(a1 + 64);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_3_729;
  v20[3] = &unk_1E6297DD0;
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v22 = v12;
  v20[4] = v18;
  id v21 = *(id *)(a1 + 80);
  [v11 requestSuggestedPersons:v13 withPersonWithLocalIdentifier:v14 toBeConfirmedPersonSuggestions:v15 toBeRejectedPersonSuggestions:v16 andPhotoLibraryURL:v17 andReply:v20];
}

void __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request SuggestedPersons service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_727;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_727(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_728;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_728(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_3_729(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request SuggestedPersons %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_730;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_730(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_731;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_731(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestUpdateKeyFacesOfPersonsWithLocalIdentifiers:(id)a3 forceUpdate:(BOOL)a4 photoLibraryURL:(id)a5 progessHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000;
  int v33 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke;
  block[3] = &unk_1E6297998;
  id v27 = v15;
  int v28 = &v30;
  void block[4] = self;
  id v24 = v12;
  BOOL v29 = a4;
  id v25 = v13;
  id v26 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v15;
  id v20 = v14;
  dispatch_sync(managementQueue, block);
  int v21 = *((_DWORD *)v31 + 6);

  _Block_object_dispose(&v30, 8);
  return v21;
}

void __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 56)) {
    id v5 = *(const void **)(a1 + 56);
  }
  else {
    id v5 = &__block_literal_global_734;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v18 = *(_OWORD *)(a1 + 64);
  id v8 = (id)v18;
  long long v23 = v18;
  uint64_t v9 = _Block_copy(aBlock);
  long long v10 = [*(id *)(a1 + 32) connection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];

  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v13 = *(unsigned int *)(*(void *)(v12 + 8) + 24);
  uint64_t v14 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_3_737;
  v19[3] = &unk_1E6297E70;
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v21 = v12;
  v19[4] = v17;
  id v20 = *(id *)(a1 + 64);
  [v11 requestUpdateKeyFacesOfPersons:v13 withLocalIdentifiers:v15 andForceUpdate:v14 andPhotoLibraryURL:v16 andReply:v19];
}

void __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request UpdateKeyFacesOfPersons service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_735;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_735(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_736;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_736(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_3_737(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v18 = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request UpdateKeyFacesOfPersons %d has completed", buf, 8u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  long long v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_738;
  block[3] = &unk_1E6297E48;
  void block[4] = v8;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v12;
  long long v15 = v12;
  char v16 = a2;
  id v14 = v5;
  id v11 = v5;
  dispatch_async(v9, block);
}

void __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_738(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_739;
  block[3] = &unk_1E6297E20;
  id v7 = *(id *)(a1 + 48);
  char v8 = *(unsigned char *)(a1 + 64);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

uint64_t __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_739(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (int)requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers:(id)a3 photoLibraryURL:(id)a4 progessHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  managementQueue = self->_managementQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke;
  v20[3] = &unk_1E6297A10;
  id v24 = v13;
  id v25 = &v26;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  id v18 = v12;
  dispatch_sync(managementQueue, v20);
  LODWORD(v10) = *((_DWORD *)v27 + 6);

  _Block_object_dispose(&v26, 8);
  return (int)v10;
}

void __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 56)) {
    id v5 = *(const void **)(a1 + 56);
  }
  else {
    id v5 = &__block_literal_global_742;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 64);
  id v8 = (id)v17;
  long long v22 = v17;
  long long v9 = _Block_copy(aBlock);
  id v10 = [*(id *)(a1 + 32) connection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];

  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v13 = *(unsigned int *)(*(void *)(v12 + 8) + 24);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_3_745;
  v18[3] = &unk_1E6297DD0;
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v20 = v12;
  v18[4] = v16;
  id v19 = *(id *)(a1 + 64);
  [v11 requestFaceCandidatesforKeyFace:v13 withPersonsWithLocalIdentifiers:v14 andPhotoLibraryURL:v15 andReply:v18];
}

void __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request FaceCandidatesforKeyFace service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_743;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_743(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_744;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_744(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_3_745(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request FaceCandidatesforKeyFace %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_746;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_746(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_747;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_747(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestResetFaceClassificationModelForPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  block[3] = &unk_1E6297E98;
  id v19 = v10;
  int v20 = &v21;
  id v17 = v8;
  id v18 = v9;
  void block[4] = self;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 48)) {
    id v5 = *(const void **)(a1 + 48);
  }
  else {
    id v5 = &__block_literal_global_755;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 56);
  id v8 = (id)v16;
  long long v21 = v16;
  id v9 = _Block_copy(aBlock);
  id v10 = [*(id *)(a1 + 32) connection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];

  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(unsigned int *)(*(void *)(v12 + 8) + 24);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_758;
  v17[3] = &unk_1E6297E70;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v19 = v12;
  v17[4] = v14;
  id v18 = *(id *)(a1 + 56);
  [v11 requestResetFaceClassificationModel:v13 withPhotoLibraryURL:v15 andReply:v17];
}

void __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request ResetFaceClassificationModel service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_756;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_756(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_757;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_757(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_758(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v18 = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request ResetFaceClassificationModel %d has completed", buf, 8u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  long long v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_759;
  block[3] = &unk_1E6297E48;
  void block[4] = v8;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v12;
  long long v15 = v12;
  char v16 = a2;
  id v14 = v5;
  id v11 = v5;
  dispatch_async(v9, block);
}

void __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_759(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_760;
  block[3] = &unk_1E6297E20;
  id v7 = *(id *)(a1 + 48);
  char v8 = *(unsigned char *)(a1 + 64);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

uint64_t __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_760(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (int)requestResetPetClassificationModelForPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  block[3] = &unk_1E6297E98;
  id v19 = v10;
  int v20 = &v21;
  id v17 = v8;
  id v18 = v9;
  void block[4] = self;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 48)) {
    id v5 = *(const void **)(a1 + 48);
  }
  else {
    id v5 = &__block_literal_global_762;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 56);
  id v8 = (id)v16;
  long long v21 = v16;
  id v9 = _Block_copy(aBlock);
  id v10 = [*(id *)(a1 + 32) connection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];

  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(unsigned int *)(*(void *)(v12 + 8) + 24);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_765;
  v17[3] = &unk_1E6297E70;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v19 = v12;
  v17[4] = v14;
  id v18 = *(id *)(a1 + 56);
  [v11 requestResetPetClassificationModel:v13 withPhotoLibraryURL:v15 andReply:v17];
}

void __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request ResetPetClassificationModel service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_763;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_763(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_764;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_764(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_765(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v18 = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request ResetPetClassificationModel %d has completed", buf, 8u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  long long v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_766;
  block[3] = &unk_1E6297E48;
  void block[4] = v8;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v12;
  long long v15 = v12;
  char v16 = a2;
  id v14 = v5;
  id v11 = v5;
  dispatch_async(v9, block);
}

void __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_766(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_767;
  block[3] = &unk_1E6297E20;
  id v7 = *(id *)(a1 + 48);
  char v8 = *(unsigned char *)(a1 + 64);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

uint64_t __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_767(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (int)requestSuggestedMePersonIdentifierWithContext:(id)a3 photoLibraryURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  managementQueue = self->_managementQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke;
  v20[3] = &unk_1E6297A10;
  id v24 = v13;
  id v25 = &v26;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  id v18 = v12;
  dispatch_sync(managementQueue, v20);
  LODWORD(v10) = *((_DWORD *)v27 + 6);

  _Block_object_dispose(&v26, 8);
  return (int)v10;
}

void __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 56)) {
    id v5 = *(const void **)(a1 + 56);
  }
  else {
    id v5 = &__block_literal_global_769;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 64);
  id v8 = (id)v17;
  long long v22 = v17;
  long long v9 = _Block_copy(aBlock);
  id v10 = [*(id *)(a1 + 32) connection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];

  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v13 = *(unsigned int *)(*(void *)(v12 + 8) + 24);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_3_772;
  v18[3] = &unk_1E6297C88;
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v20 = v12;
  v18[4] = v16;
  id v19 = *(id *)(a1 + 64);
  [v11 requestSuggestedMePersonIdentifier:v13 withContext:v14 andPhotoLibraryURL:v15 andReply:v18];
}

void __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request SuggestedMePersonIdentifier service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_770;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_770(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_771;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_771(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_3_772(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request SuggestedMePersonIdentifier %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_773;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_773(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_774;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_774(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestPersonPromoterStatusWithAdvancedFlag:(BOOL)a3 photoLibraryURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  managementQueue = self->_managementQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke;
  v18[3] = &unk_1E6297EC0;
  id v21 = v12;
  long long v22 = &v24;
  id v19 = v10;
  id v20 = v11;
  BOOL v23 = a3;
  v18[4] = self;
  id v14 = v10;
  id v15 = v12;
  id v16 = v11;
  dispatch_sync(managementQueue, v18);
  LODWORD(self) = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v24, 8);
  return (int)self;
}

void __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 48)) {
    id v5 = *(const void **)(a1 + 48);
  }
  else {
    id v5 = &__block_literal_global_776;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 56);
  id v8 = (id)v17;
  long long v22 = v17;
  uint64_t v9 = _Block_copy(aBlock);
  id v10 = [*(id *)(a1 + 32) connection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];

  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(unsigned int *)(*(void *)(v12 + 8) + 24);
  uint64_t v14 = *(unsigned __int8 *)(a1 + 72);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_3_779;
  v18[3] = &unk_1E6297948;
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v20 = v12;
  v18[4] = v15;
  id v19 = *(id *)(a1 + 56);
  [v11 requestPersonPromoterStatus:v13 withAdvancedFlag:v14 andPhotoLibraryURL:v16 andReply:v18];
}

void __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request PersonPromoterStatus service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_777;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_777(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_778;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_778(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_3_779(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request PersonPromoterStatus %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_780;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_780(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_781;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_781(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestPersonProcessingForPhotoLibraryURL:(id)a3 options:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  managementQueue = self->_managementQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke;
  v20[3] = &unk_1E6297A10;
  id v24 = v13;
  id v25 = &v26;
  v20[4] = self;
  id v21 = v11;
  id v22 = v10;
  id v23 = v12;
  id v15 = v10;
  id v16 = v11;
  id v17 = v13;
  id v18 = v12;
  dispatch_sync(managementQueue, v20);
  LODWORD(v10) = *((_DWORD *)v27 + 6);

  _Block_object_dispose(&v26, 8);
  return (int)v10;
}

void __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 56)) {
    id v5 = *(const void **)(a1 + 56);
  }
  else {
    id v5 = &__block_literal_global_783;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 64);
  id v8 = (id)v17;
  long long v22 = v17;
  uint64_t v9 = _Block_copy(aBlock);
  id v10 = [*(id *)(a1 + 32) connection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];

  id v12 = (void *)[*(id *)(a1 + 40) mutableCopy];
  [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ModifyPersonRequest"];
  uint64_t v13 = *(void *)(a1 + 72);
  uint64_t v14 = *(unsigned int *)(*(void *)(v13 + 8) + 24);
  uint64_t v15 = *(void *)(a1 + 48);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_3_786;
  v18[3] = &unk_1E62979C0;
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v20 = v13;
  v18[4] = v16;
  id v19 = *(id *)(a1 + 64);
  [v11 requestLibraryProcessing:v14 withTaskID:3 forPhotoLibraryURL:v15 withOptions:v12 andReply:v18];
}

void __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request Face and Person workflow", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_784;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_784(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_2_785;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_2_785(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_3_786(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v15 = v5;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request Face and Person workflow %d has completed", buf, 8u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_787;
  block[3] = &unk_1E62978A8;
  void block[4] = v6;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v10;
  long long v13 = v10;
  id v12 = v3;
  id v9 = v3;
  dispatch_async(v7, block);
}

void __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_787(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_2_788;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_2_788(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (int)requestResetPersons:(id)a3 forPhotoLibraryURL:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  managementQueue = self->_managementQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke;
  v13[3] = &unk_1E6297C60;
  id v15 = v8;
  uint64_t v16 = &v17;
  void v13[4] = self;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_sync(managementQueue, v13);
  LODWORD(v7) = *((_DWORD *)v18 + 6);

  _Block_object_dispose(&v17, 8);
  return (int)v7;
}

void __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v12;
  long long v17 = v12;
  int v5 = _Block_copy(aBlock);
  id v6 = [*(id *)(a1 + 32) connection];
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v5];

  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(unsigned int *)(*(void *)(v8 + 8) + 24);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_3;
  v13[3] = &unk_1E6297E70;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v15 = v8;
  void v13[4] = v10;
  id v14 = *(id *)(a1 + 48);
  [v7 requestResetPersons:v9 withPhotoLibraryURL:v11 andReply:v13];
}

void __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request reset persons workflow", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_789;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_789(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_2_790;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_2_790(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v18 = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request reset persons workflow %d has completed", buf, 8u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  long long v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_791;
  block[3] = &unk_1E6297E48;
  void block[4] = v8;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v12;
  long long v15 = v12;
  char v16 = a2;
  id v14 = v5;
  id v11 = v5;
  dispatch_async(v9, block);
}

void __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_791(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_2_792;
  block[3] = &unk_1E6297E20;
  id v7 = *(id *)(a1 + 48);
  char v8 = *(unsigned char *)(a1 + 64);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

uint64_t __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_2_792(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (int)requestClusterCacheValidationWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  block[3] = &unk_1E6297E98;
  id v19 = v10;
  int v20 = &v21;
  id v17 = v8;
  id v18 = v9;
  void block[4] = self;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 48)) {
    id v5 = *(const void **)(a1 + 48);
  }
  else {
    id v5 = &__block_literal_global_803;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 56);
  id v8 = (id)v16;
  long long v21 = v16;
  id v9 = _Block_copy(aBlock);
  id v10 = [*(id *)(a1 + 32) connection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];

  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(unsigned int *)(*(void *)(v12 + 8) + 24);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_806;
  v17[3] = &unk_1E6297948;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v19 = v12;
  v17[4] = v14;
  id v18 = *(id *)(a1 + 56);
  [v11 requestClusterCacheValidation:v13 withPhotoLibraryURL:v15 andReply:v17];
}

void __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request ClusterCacheValidation service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_804;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_804(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_805;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_805(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_806(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request ClusterCacheValidation %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_807;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_807(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_808;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_808(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestResetFaceClusteringStateWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  block[3] = &unk_1E6297E98;
  id v19 = v10;
  int v20 = &v21;
  id v17 = v8;
  id v18 = v9;
  void block[4] = self;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 48)) {
    id v5 = *(const void **)(a1 + 48);
  }
  else {
    id v5 = &__block_literal_global_810;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 56);
  id v8 = (id)v16;
  long long v21 = v16;
  id v9 = _Block_copy(aBlock);
  id v10 = [*(id *)(a1 + 32) connection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];

  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(unsigned int *)(*(void *)(v12 + 8) + 24);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_813;
  v17[3] = &unk_1E6297E70;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v19 = v12;
  v17[4] = v14;
  id v18 = *(id *)(a1 + 56);
  [v11 requestResetFaceClusteringState:v13 withPhotoLibraryURL:v15 andReply:v17];
}

void __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request ResetFaceClusteringState service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_811;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_811(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_812;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_812(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_813(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v18 = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request ResetFaceClusteringState %d has completed", buf, 8u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  long long v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_814;
  block[3] = &unk_1E6297E48;
  void block[4] = v8;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v12;
  long long v15 = v12;
  char v16 = a2;
  id v14 = v5;
  id v11 = v5;
  dispatch_async(v9, block);
}

void __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_814(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_815;
  block[3] = &unk_1E6297E20;
  id v7 = *(id *)(a1 + 48);
  char v8 = *(unsigned char *)(a1 + 64);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

uint64_t __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_815(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (int)requestReclusterFacesWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  block[3] = &unk_1E6297E98;
  id v19 = v10;
  int v20 = &v21;
  id v17 = v8;
  id v18 = v9;
  void block[4] = self;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 48)) {
    id v5 = *(const void **)(a1 + 48);
  }
  else {
    id v5 = &__block_literal_global_817;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 56);
  id v8 = (id)v16;
  long long v21 = v16;
  id v9 = _Block_copy(aBlock);
  id v10 = [*(id *)(a1 + 32) connection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];

  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(unsigned int *)(*(void *)(v12 + 8) + 24);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_820;
  v17[3] = &unk_1E6297E70;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v19 = v12;
  v17[4] = v14;
  id v18 = *(id *)(a1 + 56);
  [v11 requestReclusterFaces:v13 withPhotoLibraryURL:v15 andReply:v17];
}

void __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request ReclusterFaces service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_818;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_818(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_819;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_819(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_820(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v18 = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request ReclusterFaces %d has completed", buf, 8u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  long long v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_821;
  block[3] = &unk_1E6297E48;
  void block[4] = v8;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v12;
  long long v15 = v12;
  char v16 = a2;
  id v14 = v5;
  id v11 = v5;
  dispatch_async(v9, block);
}

void __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_821(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_822;
  block[3] = &unk_1E6297E20;
  id v7 = *(id *)(a1 + 48);
  char v8 = *(unsigned char *)(a1 + 64);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

uint64_t __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_822(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (int)requestRebuildPersonsWithLocalIdentifiers:(id)a3 photoLibraryURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  managementQueue = self->_managementQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke;
  v20[3] = &unk_1E6297A10;
  id v24 = v13;
  id v25 = &v26;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  id v18 = v12;
  dispatch_sync(managementQueue, v20);
  LODWORD(v10) = *((_DWORD *)v27 + 6);

  _Block_object_dispose(&v26, 8);
  return (int)v10;
}

void __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 56)) {
    id v5 = *(const void **)(a1 + 56);
  }
  else {
    id v5 = &__block_literal_global_824;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 64);
  id v8 = (id)v17;
  long long v22 = v17;
  long long v9 = _Block_copy(aBlock);
  id v10 = [*(id *)(a1 + 32) connection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];

  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v13 = *(unsigned int *)(*(void *)(v12 + 8) + 24);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_3_827;
  v18[3] = &unk_1E6297E70;
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v20 = v12;
  v18[4] = v16;
  id v19 = *(id *)(a1 + 64);
  [v11 requestRebuildPersons:v13 withLocalIdentifiers:v14 andPhotoLibraryURL:v15 andReply:v18];
}

void __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request RebuildPersons service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_825;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_825(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_826;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_826(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_3_827(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v18 = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request RebuildPersons %d has completed", buf, 8u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  long long v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_828;
  block[3] = &unk_1E6297E48;
  void block[4] = v8;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v12;
  long long v15 = v12;
  char v16 = a2;
  id v14 = v5;
  id v11 = v5;
  dispatch_async(v9, block);
}

void __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_828(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_829;
  block[3] = &unk_1E6297E20;
  id v7 = *(id *)(a1 + 48);
  char v8 = *(unsigned char *)(a1 + 64);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

uint64_t __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_829(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (int)queryAutoCounterOptInStatusForPhotoLibraryURL:(id)a3 withPersonLocalIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E6297A88;
  id v19 = v10;
  uint64_t v20 = &v21;
  void block[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v5 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v4 setObject:&__block_literal_global_831 forKey:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v15 = *(_OWORD *)(a1 + 56);
  id v6 = (id)v15;
  long long v20 = v15;
  id v7 = _Block_copy(aBlock);
  id v8 = [*(id *)(a1 + 32) connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v7];

  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(unsigned int *)(*(void *)(v10 + 8) + 24);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_3_834;
  v16[3] = &unk_1E6297948;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v18 = v10;
  void v16[4] = v14;
  id v17 = *(id *)(a1 + 56);
  [v9 queryAutoCounterOptInStatus:v11 withPhotoLibraryURL:v12 personLocalIdentifiers:v13 andReply:v16];
}

void __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to query AutoCounter Opt-In status service", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_832;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_832(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_2_833;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_2_833(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_3_834(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Query AutoCounter Opt-In status %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_835;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_835(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_2_836;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_2_836(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestOptInAutoCounterForPhotoLibraryURL:(id)a3 withPersons:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke;
  block[3] = &unk_1E6297A88;
  id v19 = v10;
  int v20 = &v21;
  void block[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v5 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v4 setObject:&__block_literal_global_838 forKey:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v15 = *(_OWORD *)(a1 + 56);
  id v6 = (id)v15;
  long long v20 = v15;
  id v7 = _Block_copy(aBlock);
  id v8 = [*(id *)(a1 + 32) connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v7];

  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(unsigned int *)(*(void *)(v10 + 8) + 24);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_3_841;
  v16[3] = &unk_1E6297948;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v18 = v10;
  void v16[4] = v14;
  id v17 = *(id *)(a1 + 56);
  [v9 requestOptInAutoCounter:v11 withPhotoLibraryURL:v12 persons:v13 andReply:v16];
}

void __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request Opt-In AutoCounter", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_839;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_839(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_2_840;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_2_840(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_3_841(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request Opt-In AutoCounter %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_842;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_842(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_2_843;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_2_843(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestDumpAutoCounterForPhotoLibraryURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  managementQueue = self->_managementQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke;
  v12[3] = &unk_1E6297C60;
  id v14 = v7;
  long long v15 = &v16;
  void v12[4] = self;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(managementQueue, v12);
  LODWORD(v6) = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return (int)v6;
}

void __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v5 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v4 setObject:&__block_literal_global_845 forKey:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v14 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v14;
  long long v19 = v14;
  id v7 = _Block_copy(aBlock);
  id v8 = [*(id *)(a1 + 32) connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v7];

  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(unsigned int *)(*(void *)(v10 + 8) + 24);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_3_848;
  v15[3] = &unk_1E6297948;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v17 = v10;
  v15[4] = v12;
  id v16 = *(id *)(a1 + 48);
  [v9 requestDumpAutoCounter:v11 withPhotoLibraryURL:v13 andReply:v15];
}

void __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request AutoCounter dump", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_846;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_846(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_2_847;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_2_847(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_3_848(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request AutoCounter dump %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_849;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_849(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_2_850;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_2_850(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestAutoCounterAccuracyCalculationForPhotoLibraryURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  managementQueue = self->_managementQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke;
  v12[3] = &unk_1E6297C60;
  id v14 = v7;
  long long v15 = &v16;
  void v12[4] = self;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(managementQueue, v12);
  LODWORD(v6) = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return (int)v6;
}

void __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v5 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v4 setObject:&__block_literal_global_852 forKey:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v14 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v14;
  long long v19 = v14;
  id v7 = _Block_copy(aBlock);
  id v8 = [*(id *)(a1 + 32) connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v7];

  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(unsigned int *)(*(void *)(v10 + 8) + 24);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_3_855;
  v15[3] = &unk_1E6297948;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v17 = v10;
  v15[4] = v12;
  id v16 = *(id *)(a1 + 48);
  [v9 requestAutoCounterAccuracyCalculation:v11 withPhotoLibraryURL:v13 andReply:v15];
}

void __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request AutoCounter calculation", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_853;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_853(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_2_854;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_2_854(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_3_855(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request AutoCounter calculation %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_856;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_856(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_2_857;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_2_857(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestAutoCounterAccuracyCalculationForPhotoLibraryURL:(id)a3 clusterStateURL:(id)a4 groundTruthURL:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  managementQueue = self->_managementQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke;
  v20[3] = &unk_1E6297EE8;
  id v24 = v13;
  id v25 = &v26;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  dispatch_sync(managementQueue, v20);
  LODWORD(self) = *((_DWORD *)v27 + 6);

  _Block_object_dispose(&v26, 8);
  return (int)self;
}

void __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v5 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  [v4 setObject:&__block_literal_global_859 forKey:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 64);
  id v6 = (id)v16;
  long long v21 = v16;
  id v7 = _Block_copy(aBlock);
  id v8 = [*(id *)(a1 + 32) connection];
  uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:v7];

  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v11 = *(unsigned int *)(*(void *)(v10 + 8) + 24);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_3_862;
  v17[3] = &unk_1E6297948;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v19 = v10;
  v17[4] = v14;
  uint64_t v15 = *(void *)(a1 + 56);
  id v18 = *(id *)(a1 + 64);
  [v9 requestAutoCounterAccuracyCalculation:v11 withPhotoLibraryURL:v12 clusterStateURL:v13 groundTruthURL:v15 andReply:v17];
}

void __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request AutoCounter calculation", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_860;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_860(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_2_861;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_2_861(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_3_862(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request AutoCounter calculation %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_863;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_863(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_2_864;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_2_864(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestAutoCounterSIMLValidationForPhotoLibraryURL:(id)a3 simlGroundTruthURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke;
  block[3] = &unk_1E6297A88;
  id v19 = v10;
  int v20 = &v21;
  void block[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v5 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v4 setObject:&__block_literal_global_866 forKey:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E62978D0;
  void aBlock[4] = *(void *)(a1 + 32);
  long long v15 = *(_OWORD *)(a1 + 56);
  id v6 = (id)v15;
  long long v20 = v15;
  id v7 = _Block_copy(aBlock);
  id v8 = [*(id *)(a1 + 32) connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v7];

  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(unsigned int *)(*(void *)(v10 + 8) + 24);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_3_869;
  v16[3] = &unk_1E6297948;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v18 = v10;
  void v16[4] = v14;
  id v17 = *(id *)(a1 + 56);
  [v9 requestAutoCounterSIMLValidation:v11 withPhotoLibraryURL:v12 simlGroundTruthURL:v13 andReply:v16];
}

void __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request AutoCounter calculation", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_867;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_867(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_2_868;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_2_868(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_3_869(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request AutoCounter SIML validation %d has completed", buf, 8u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_870;
  block[3] = &unk_1E6297920;
  void block[4] = v9;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v14;
  long long v18 = v14;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

void __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_870(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_2_871;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_2_871(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestIdentificationOfFaces:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v7 && v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
    int v24 = self;
    id v12 = 0;
    if (v11)
    {
      uint64_t v13 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (v12)
          {
            id v16 = [*(id *)(*((void *)&v34 + 1) + 8 * i) photoLibrary];
            BOOL v17 = v12 == v16;

            if (!v17)
            {
              int v21 = MediaAnalysisLogLevel();
              if (v21 >= 4)
              {
                id v22 = VCPLogInstance();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Faces must all be from the same Photo Library", buf, 2u);
                }
              }
              int v20 = 0;
              goto LABEL_24;
            }
          }
          else
          {
            id v12 = [*(id *)(*((void *)&v34 + 1) + 8 * i) photoLibrary];
          }
          long long v18 = objc_msgSend(v15, "localIdentifier", v24);
          [v9 addObject:v18];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    *(void *)long long buf = 0;
    id v31 = buf;
    uint64_t v32 = 0x2020000000;
    int v33 = 0;
    managementQueue = v24->_managementQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke;
    block[3] = &unk_1E6297A88;
    int v29 = buf;
    void block[4] = v24;
    id v28 = v7;
    id v26 = v9;
    id v12 = v12;
    int v27 = v12;
    dispatch_sync(managementQueue, block);
    int v20 = *((_DWORD *)v31 + 6);

    _Block_object_dispose(buf, 8);
LABEL_24:
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 4)
    {
      int v20 = 0;
      goto LABEL_27;
    }
    id v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Faces must be non-empty and completion block must be non-nil", buf, 2u);
    }
    int v20 = 0;
  }

LABEL_27:
  return v20;
}

void __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v5 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v4 setObject:&__block_literal_global_884 forKey:v5];

  id v6 = [*(id *)(a1 + 32) connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_3;
  v17[3] = &unk_1E62978D0;
  v17[4] = *(void *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 56);
  id v7 = (id)v13;
  long long v18 = v13;
  uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v17];
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 48) photoLibraryURL];
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = *(unsigned int *)(*(void *)(v11 + 8) + 24);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_3_887;
  v14[3] = &unk_1E6297AD8;
  v14[4] = *(void *)(a1 + 32);
  uint64_t v16 = v11;
  id v15 = *(id *)(a1 + 56);
  [v8 requestIdentificationOfFacesWithLocalIdentifiers:v9 fromPhotoLibraryWithURL:v10 withRequestID:v12 andReply:v14];
}

void __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Media Analysis", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_885;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_885(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_2_886;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_2_886(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_3_887(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_4;
  block[3] = &unk_1E6297920;
  void block[4] = v7;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v12;
  long long v16 = v12;
  id v14 = v5;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

void __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_5;
  block[3] = &unk_1E62978F8;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (a3 && (uint64_t v16 = [v12 count], v15) && v13 && v16)
  {
    *(void *)long long buf = 0;
    int v29 = buf;
    uint64_t v30 = 0x2020000000;
    int v31 = 0;
    managementQueue = self->_managementQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke;
    block[3] = &unk_1E62979E8;
    id v26 = buf;
    void block[4] = self;
    id v24 = v14;
    id v25 = v15;
    unint64_t v27 = a3;
    id v22 = v12;
    id v23 = v13;
    dispatch_sync(managementQueue, block);
    int v18 = *((_DWORD *)v29 + 6);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] nil specified for non-nullable parameter", buf, 2u);
      }
    }
    int v18 = 0;
  }

  return v18;
}

void __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v3;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 56)) {
    id v5 = *(const void **)(a1 + 56);
  }
  else {
    id v5 = &__block_literal_global_889;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  id v8 = [*(id *)(a1 + 32) connection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_3;
  v20[3] = &unk_1E62978D0;
  v20[4] = *(void *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 64);
  id v9 = (id)v16;
  long long v21 = v16;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v20];
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 72);
  uint64_t v14 = *(void *)(a1 + 80);
  uint64_t v15 = *(unsigned int *)(*(void *)(v13 + 8) + 24);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_3_892;
  v17[3] = &unk_1E62978D0;
  v17[4] = *(void *)(a1 + 32);
  uint64_t v19 = v13;
  id v18 = *(id *)(a1 + 64);
  [v10 requestProcessingTypes:v14 forAssetsWithLocalIdentifiers:v11 fromPhotoLibraryWithURL:v12 withRequestID:v15 andReply:v17];
}

void __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Media Analysis", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_890;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_890(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_2_891;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_2_891(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_3_892(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_4;
  block[3] = &unk_1E62978A8;
  void block[4] = v4;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v8;
  long long v11 = v8;
  id v10 = v3;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_5;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (int)downloadVideoEncoderWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6297D00;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(managementQueue, block);
  LODWORD(managementQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)managementQueue;
}

void __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  id v4 = [*(id *)(a1 + 32) connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E62978D0;
  void v12[4] = *(void *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v8;
  long long v13 = v8;
  id v6 = [v4 remoteObjectProxyWithErrorHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E62978D0;
  v10[4] = *(void *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v11 = v9;
  [v6 downloadVideoEncoderIfNeededWithReply:v10];
}

void __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Media Analysis", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_896;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_896(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_2_897;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_2_897(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_4;
  block[3] = &unk_1E62978A8;
  void block[4] = v4;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v8;
  long long v11 = v8;
  id v10 = v3;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_5;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)defaultDeferredProcessingTypes
{
  uint64_t v2 = [MEMORY[0x1E4F28E60] indexSet];
  [v2 addIndex:2];
  [v2 addIndex:8];
  return v2;
}

- (BOOL)requestDeferredProcessingTypes:(id)a3 assets:(id)a4 error:(id *)a5
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v35 = a4;
  if ([v34 count] && objc_msgSend(v35, "count"))
  {
    *(void *)long long buf = 0;
    uint64_t v51 = buf;
    uint64_t v52 = 0x3032000000;
    int v53 = __Block_byref_object_copy__5;
    uint64_t v54 = __Block_byref_object_dispose__5;
    id v55 = 0;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __80__VCPMediaAnalysisService_Moments__requestDeferredProcessingTypes_assets_error___block_invoke;
    v49[3] = &unk_1E6297F10;
    v49[4] = buf;
    [v34 enumerateIndexesUsingBlock:v49];
    id v6 = (void *)*((void *)v51 + 5);
    if (v6)
    {
      BOOL v7 = 0;
      *a5 = (id)[v6 copy];
    }
    else
    {
      long long v12 = [v35 firstObject];
      long long v13 = [v12 photoLibrary];
      long long v36 = [v13 photoLibraryURL];

      uint64_t v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v35, "count"));
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = v35;
      uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v46;
        uint64_t v16 = *MEMORY[0x1E4F28760];
        uint64_t v17 = *MEMORY[0x1E4F28568];
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v46 != v15) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            int v20 = (void *)MEMORY[0x1C186D320]();
            long long v21 = [v19 photoLibrary];
            id v22 = [v21 photoLibraryURL];
            int v23 = [v22 isEqual:v36];

            if (v23)
            {
              id v24 = [v19 localIdentifier];
              [v32 addObject:v24];
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                id v25 = VCPLogInstance();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)uint64_t v39 = 0;
                  _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_ERROR, "[MediaAnalysis] All requested assets must come from the same photo library", v39, 2u);
                }
              }
              id v26 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v56 = v17;
              id v24 = [NSString stringWithFormat:@"[MediaAnalysis] All requested assets must come from the same photo library"];
              uint64_t v57 = v24;
              unint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
              *a5 = [v26 errorWithDomain:v16 code:-50 userInfo:v27];
            }
            if (!v23)
            {

              BOOL v7 = 0;
              goto LABEL_27;
            }
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      *(void *)uint64_t v39 = 0;
      id v40 = v39;
      uint64_t v41 = 0x3032000000;
      id v42 = __Block_byref_object_copy__5;
      id v43 = __Block_byref_object_dispose__5;
      id v44 = 0;
      id v28 = [(VCPMediaAnalysisService *)self connection];
      int v29 = [v28 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_913];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __80__VCPMediaAnalysisService_Moments__requestDeferredProcessingTypes_assets_error___block_invoke_914;
      v38[3] = &unk_1E6297F38;
      v38[4] = v39;
      [v29 requestDeferredProcessingTypes:v34 forAssetsWithLocalIdentifiers:v32 withPhotoLibraryURL:v36 andReply:v38];

      *a5 = (id)[*((id *)v40 + 5) copy];
      BOOL v7 = *((void *)v40 + 5) == 0;
      _Block_object_dispose(v39, 8);

LABEL_27:
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      long long v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "[MediaAnalysis] nil specified for non-nullable parameter", buf, 2u);
      }
    }
    long long v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v59 = *MEMORY[0x1E4F28568];
    id v10 = [NSString stringWithFormat:@"[MediaAnalysis] nil specified for non-nullable parameter"];
    v60[0] = v10;
    long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
    *a5 = [v9 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v11];

    BOOL v7 = 0;
  }

  return v7;
}

void __80__VCPMediaAnalysisService_Moments__requestDeferredProcessingTypes_assets_error___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a2 != 2 && a2 != 8)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        int v16 = a2;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "[MediaAnalysis] Invalid deferred processing type %u specified", buf, 8u);
      }
    }
    BOOL v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    long long v8 = objc_msgSend(NSString, "stringWithFormat:", @"[MediaAnalysis] Invalid deferred processing type %u specified", a2);
    uint64_t v14 = v8;
    long long v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    uint64_t v10 = [v7 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a3 = 1;
  }
}

void __80__VCPMediaAnalysisService_Moments__requestDeferredProcessingTypes_assets_error___block_invoke_911(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Media Analysis: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __80__VCPMediaAnalysisService_Moments__requestDeferredProcessingTypes_assets_error___block_invoke_914(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)assetsPendingDeferredProcessingWithPhotoLibraryURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__5;
  id v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__5;
  int v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  BOOL v7 = [(VCPMediaAnalysisService *)self connection];
  long long v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_916];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__VCPMediaAnalysisService_Moments__assetsPendingDeferredProcessingWithPhotoLibraryURL_error___block_invoke_917;
  v11[3] = &unk_1E6297AB0;
  v11[4] = &v18;
  v11[5] = &v12;
  [v8 queryAssetsPendingDeferredProcessingWithPhotoLibraryURL:v6 andReply:v11];

  *a4 = (id)[(id)v13[5] copy];
  id v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __93__VCPMediaAnalysisService_Moments__assetsPendingDeferredProcessingWithPhotoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Media Analysis: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __93__VCPMediaAnalysisService_Moments__assetsPendingDeferredProcessingWithPhotoLibraryURL_error___block_invoke_917(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = [v12 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [v5 copy];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (int)requestForceDeferredProcessingWithProgessHandler:(id)a3 andCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  managementQueue = self->_managementQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke;
  v12[3] = &unk_1E6297F60;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  uint64_t v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(managementQueue, v12);
  LODWORD(managementQueue) = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return (int)managementQueue;
}

void __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3;
  int v4 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 40)) {
    id v5 = *(const void **)(a1 + 40);
  }
  else {
    id v5 = &__block_literal_global_919;
  }
  id v6 = _Block_copy(v5);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v4 setObject:v6 forKey:v7];

  long long v8 = [*(id *)(a1 + 32) connection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_3;
  v18[3] = &unk_1E62978D0;
  v18[4] = *(void *)(a1 + 32);
  long long v14 = *(_OWORD *)(a1 + 48);
  id v9 = (id)v14;
  long long v19 = v14;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v18];
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(unsigned int *)(*(void *)(v11 + 8) + 24);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_3_922;
  v15[3] = &unk_1E62979C0;
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v17 = v11;
  v15[4] = v13;
  id v16 = *(id *)(a1 + 48);
  [v10 requestForceDeferredProcessing:v12 andReply:v15];
}

void __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    int v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v14 = v3;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Media Analysis: %@", buf, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_920;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_920(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_2_921;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_2_921(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_3_922(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v15 = v5;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "[MediaAnalysis] Request %d has completed", buf, 8u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_923;
  block[3] = &unk_1E62978A8;
  void block[4] = v6;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v10;
  long long v13 = v10;
  id v12 = v3;
  id v9 = v3;
  dispatch_async(v7, block);
}

void __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_923(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_2_924;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_2_924(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (int)requestStaticStickerScoringForLibrary:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke;
  block[3] = &unk_1E6297A88;
  id v19 = v10;
  uint64_t v20 = &v21;
  void block[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  int v4 = *(void **)(*(void *)(a1 + 32) + 32);
  int v5 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v4 setObject:&__block_literal_global_937 forKey:v5];

  id v6 = [*(id *)(a1 + 32) connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_3;
  v17[3] = &unk_1E62978D0;
  v17[4] = *(void *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 56);
  id v7 = (id)v13;
  long long v18 = v13;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v17];
  uint64_t v9 = *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  id v10 = [*(id *)(a1 + 40) photoLibraryURL];
  uint64_t v11 = *(void *)(a1 + 48);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_3_940;
  v15[3] = &unk_1E62979C0;
  v15[4] = *(void *)(a1 + 32);
  long long v14 = *(_OWORD *)(a1 + 56);
  id v12 = (id)v14;
  long long v16 = v14;
  [v8 requestStaticStickerScoring:v9 photoLibraryURL:v10 options:v11 reply:v15];
}

void __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    int v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v14 = v3;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Media Analysis: %@", buf, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_938;
  block[3] = &unk_1E62978A8;
  void block[4] = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v6, block);
}

void __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_938(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_2_939;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_2_939(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_3_940(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        id v6 = [v3 description];
        *(_DWORD *)long long buf = 67109378;
        int v17 = v5;
        __int16 v18 = 2112;
        id v19 = v6;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[MediaAnalysis] Sticker score request %d failed (%@)", buf, 0x12u);
      }
LABEL_8:
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      int v17 = v7;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "[MediaAnalysis] Sticker score request %d completed", buf, 8u);
    }
    goto LABEL_8;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  long long v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_941;
  block[3] = &unk_1E62978A8;
  void block[4] = v8;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v12;
  long long v15 = v12;
  id v14 = v3;
  id v11 = v3;
  dispatch_async(v9, block);
}

void __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_941(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_2_942;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_2_942(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (int)requestOTAMaintenanceWithOptions:(id)a3 progessHandler:(id)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"[RequestOTAMaintenance]";
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEFAULT, "%@ Queuing request ...", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  managementQueue = self->_managementQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke;
  v18[3] = &unk_1E6297FE0;
  v18[4] = self;
  id v19 = @"[RequestOTAMaintenance]";
  id v22 = v10;
  p_long long buf = &buf;
  id v20 = v8;
  id v21 = v9;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  dispatch_sync(managementQueue, v18);
  int v16 = *(_DWORD *)(*((void *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
  return v16;
}

void __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v3;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    int v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v32 = v5;
      __int16 v33 = 1024;
      int v34 = v6;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "%@ Starting Request %d", buf, 0x12u);
    }
  }
  id v7 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 56)) {
    id v8 = *(const void **)(a1 + 56);
  }
  else {
    id v8 = &__block_literal_global_950;
  }
  id v9 = _Block_copy(v8);
  id v10 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  [v7 setObject:v9 forKey:v10];

  id v11 = [*(id *)(a1 + 32) connection];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_2;
  v27[3] = &unk_1E6297F90;
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v28 = v12;
  uint64_t v29 = v13;
  long long v21 = *(_OWORD *)(a1 + 64);
  id v14 = (id)v21;
  long long v30 = v21;
  id v15 = [v11 remoteObjectProxyWithErrorHandler:v27];
  uint64_t v16 = *(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_3;
  v23[3] = &unk_1E6297FB8;
  uint64_t v17 = *(void *)(a1 + 48);
  id v18 = *(id *)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 32);
  id v24 = v18;
  uint64_t v25 = v19;
  long long v22 = *(_OWORD *)(a1 + 64);
  id v20 = (id)v22;
  long long v26 = v22;
  [v15 requestOTAMaintenance:v16 options:v17 reply:v23];
}

void __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    int v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v15 = v5;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "%@ Error connecting to MAD: %@", buf, 0x16u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_951;
  block[3] = &unk_1E62978A8;
  void block[4] = v6;
  long long v10 = *(_OWORD *)(a1 + 48);
  id v8 = (id)v10;
  long long v13 = v10;
  id v12 = v3;
  id v9 = v3;
  dispatch_async(v7, block);
}

void __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_951(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_2_952;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_2_952(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    int v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v16 = v5;
      __int16 v17 = 1024;
      int v18 = v6;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "%@ Request %d has completed", buf, 0x12u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_953;
  block[3] = &unk_1E62978A8;
  void block[4] = v7;
  long long v11 = *(_OWORD *)(a1 + 48);
  id v9 = (id)v11;
  long long v14 = v11;
  id v13 = v3;
  id v10 = v3;
  dispatch_async(v8, block);
}

void __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_953(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v2 removeObjectForKey:v3];

  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_2_954;
  v5[3] = &unk_1E6297880;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

uint64_t __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_2_954(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end