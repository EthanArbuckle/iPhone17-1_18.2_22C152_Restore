@interface VCPEffectsAssetProcessingTask
+ (id)taskWithAssets:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (BOOL)autoCancellable;
- (VCPEffectsAssetProcessingTask)initWithAssets:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (float)resourceRequirement;
- (int)main;
- (int)persistResults:(id)a3 forAsset:(id)a4;
- (int)processAsset:(id)a3;
- (int)run;
- (void)cancel;
- (void)dealloc;
@end

@implementation VCPEffectsAssetProcessingTask

- (VCPEffectsAssetProcessingTask)initWithAssets:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (Block_layout *)a5;
  if ([v9 count])
  {
    v26.receiver = self;
    v26.super_class = (Class)VCPEffectsAssetProcessingTask;
    v12 = [(VCPEffectsAssetProcessingTask *)&v26 init];
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_assets, a3);
      id v14 = objc_retainBlock(v10);
      id progressHandler = v13->_progressHandler;
      v13->_id progressHandler = v14;

      if (v11) {
        v16 = v11;
      }
      else {
        v16 = &stru_10021CA40;
      }
      v17 = objc_retainBlock(v16);
      id completionHandler = v13->_completionHandler;
      v13->_id completionHandler = v17;

      v19 = [(NSArray *)v13->_assets objectAtIndexedSubscript:0];
      uint64_t v20 = [v19 photoLibrary];
      photoLibrary = v13->_photoLibrary;
      v13->_photoLibrary = (PHPhotoLibrary *)v20;

      uint64_t v22 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v13->_photoLibrary];
      database = v13->_database;
      v13->_database = (VCPDatabaseWriter *)v22;
    }
    self = v13;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)taskWithAssets:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [objc_alloc((Class)objc_opt_class()) initWithAssets:v7 progressHandler:v8 andCompletionHandler:v9];

  return v10;
}

- (int)persistResults:(id)a3 forAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "vcp_recipe");
  if (v8)
  {
    id v9 = [(PHPhotoLibrary *)self->_photoLibrary variationCache];
    id v10 = objc_msgSend(v6, "vcp_recipe");
    v11 = [v7 localIdentifier];
    [v9 saveAnalysisResult:v10 assetIdentifier:v11];

    v12 = objc_msgSend(v6, "vcp_gatingDescriptions");
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000BCD8C;
    v31[3] = &unk_10021CA68;
    id v13 = v9;
    id v32 = v13;
    id v14 = v7;
    id v33 = v14;
    [v12 enumerateKeysAndObjectsUsingBlock:v31];

    if (objc_msgSend(v6, "vcp_longExposureSugestionState") == (id)1)
    {
      uint64_t v15 = objc_msgSend(v6, "vcp_matchingScenes");
      v16 = (void *)v15;
      if (v15)
      {
        CFStringRef v36 = @"Matching scenes";
        uint64_t v37 = v15;
        v17 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        v18 = [v14 localIdentifier];
        [v13 saveGatingResult:v17 forVariationType:3 assetIdentifier:v18];
      }
    }
    photoLibrary = self->_photoLibrary;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000BCEA8;
    v28[3] = &unk_100219D70;
    id v29 = v14;
    id v30 = v6;
    id v27 = 0;
    [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v28 error:&v27];
    id v20 = v27;
    id v21 = [v13 analysisResultForAssetIdentifier:@"invalid"];
    if (v20)
    {
      int v22 = [v20 code];
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v23 = VCPLogInstance();
        os_log_type_t v24 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v23, v24))
        {
          v25 = [v20 description];
          *(_DWORD *)buf = 138412290;
          v35 = v25;
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "Failed to persist effects suggestions (%@)", buf, 0xCu);
        }
      }
    }
    else
    {
      int v22 = 0;
    }
  }
  else
  {
    int v22 = -18;
  }

  return v22;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0)
  {
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    v5 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:0];
    completionHandler[2](completionHandler, 0, v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)VCPEffectsAssetProcessingTask;
  [(VCPEffectsAssetProcessingTask *)&v6 dealloc];
}

- (float)resourceRequirement
{
  return 1.0;
}

- (int)processAsset:(id)a3
{
  id v4 = a3;
  database = self->_database;
  objc_super v6 = [v4 localIdentifier];
  id v25 = 0;
  [(VCPDatabaseWriter *)database analysisForAsset:v6 analysis:&v25];
  id v7 = v25;

  id v8 = objc_msgSend(v7, "vcp_effectsResult");
  if (objc_msgSend(v7, "vcp_version") == 70
    && (objc_msgSend(v8, "vcp_isValidEffectsResult") & 1) != 0)
  {
    goto LABEL_17;
  }
  id v9 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v9 setIncludedDetectionTypes:&off_100230440];
  id v21 = +[PHFace fetchFacesInAsset:v4 options:v9];
  if ([v21 count])
  {
    BOOL v10 = 1;
  }
  else if (((unint64_t)objc_msgSend(v7, "vcp_types") & 0xC) != 0)
  {
    v11 = objc_msgSend(v7, "vcp_results");
    v12 = [v11 objectForKeyedSubscript:@"FaceResults"];
    BOOL v10 = v12 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  uint64_t v24 = 0;
  id v13 = [objc_alloc((Class)VCPEffectsAnalyzer) initWithFlagHasFaceOrPet:v10];
  id v14 = +[VCPPhotosAsset assetWithPHAsset:v4];
  id v22 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000BD390;
  v23[3] = &unk_100219D98;
  v23[4] = self;
  int v15 = [v13 analyzeAsset:v14 onDemand:1 cancel:v23 statsFlags:&v24 results:&v22];
  id v16 = v22;

  if (!v15)
  {
    id v20 = v8;
    v17 = [v16 objectForKeyedSubscript:@"LivePhotoEffectsResults"];
    v18 = [v17 objectAtIndexedSubscript:0];
    id v8 = [v18 objectForKeyedSubscript:@"attributes"];
  }
  if (!v15)
  {
LABEL_17:
    if (objc_msgSend(v8, "vcp_isValidEffectsResult")) {
      int v15 = [(VCPEffectsAssetProcessingTask *)self persistResults:v8 forAsset:v4];
    }
    else {
      int v15 = -18;
    }
  }

  return v15;
}

- (int)main
{
  if (![(NSArray *)self->_assets count]) {
    return -50;
  }
  if (self->_progressHandler)
  {
    unsigned __int8 v3 = +[VCPProgressReporter reporterWithIntervalSeconds:1 andTotalJobCount:[(NSArray *)self->_assets count] andBlock:self->_progressHandler];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_assets;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v18;
    os_log_type_t v9 = VCPLogToOSLogType[4];
    *(void *)&long long v7 = 138412290;
    long long v16 = v7;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unsigned __int8 v12 = atomic_load((unsigned __int8 *)&self->_cancel);
        if (v12)
        {
          int v4 = -128;
          goto LABEL_21;
        }
        if ([(VCPEffectsAssetProcessingTask *)self processAsset:*(void *)(*((void *)&v17 + 1) + 8 * i)]&& (int)MediaAnalysisLogLevel() >= 4)
        {
          id v13 = VCPLogInstance();
          if (os_log_type_enabled(v13, v9))
          {
            id v14 = [v11 localIdentifier];
            *(_DWORD *)buf = v16;
            id v22 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, v9, "[%@] Live Photo Effects processing failed for asset", buf, 0xCu);
          }
        }
        objc_msgSend(v3, "increaseProcessedJobCountByOne", v16, (void)v17);
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  int v4 = 0;
LABEL_21:

  return v4;
}

- (int)run
{
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  int v3 = [(VCPEffectsAssetProcessingTask *)self main];
  if (v3)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      int v4 = VCPLogInstance();
      os_log_type_t v5 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v4, v5))
      {
        *(_WORD *)BOOL v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, v5, "Effects asset processing failed", v10, 2u);
      }
    }
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Effects asset processing failed";
    id v6 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    uint64_t v8 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v3 userInfo:v6];
    completionHandler[2](completionHandler, 0, v8);
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
  return v3;
}

- (void)cancel
{
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

@end