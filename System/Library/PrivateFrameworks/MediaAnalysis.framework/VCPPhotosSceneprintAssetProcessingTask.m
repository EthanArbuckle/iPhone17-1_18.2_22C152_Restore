@interface VCPPhotosSceneprintAssetProcessingTask
+ (id)taskWithAssets:(id)a3 options:(id)a4 andCompletionHandler:(id)a5;
+ (unint64_t)_panoVNRequestMethod;
- (BOOL)autoCancellable;
- (BOOL)run:(id *)a3;
- (VCPPhotosSceneprintAssetProcessingTask)initWithAssets:(id)a3 options:(id)a4 andCompletionHandler:(id)a5;
- (float)resourceRequirement;
- (int)run;
- (void)cancel;
- (void)dealloc;
@end

@implementation VCPPhotosSceneprintAssetProcessingTask

- (VCPPhotosSceneprintAssetProcessingTask)initWithAssets:(id)a3 options:(id)a4 andCompletionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 count])
  {
    v19.receiver = self;
    v19.super_class = (Class)VCPPhotosSceneprintAssetProcessingTask;
    v12 = [(VCPPhotosSceneprintAssetProcessingTask *)&v19 init];
    if (v12)
    {
      v13 = _Block_copy(v11);
      id completionHandler = v12->_completionHandler;
      v12->_id completionHandler = v13;

      objc_storeStrong((id *)&v12->_assets, a3);
      v15 = [v10 objectForKeyedSubscript:@"SceneprintRevision"];

      if (v15)
      {
        v16 = [v10 objectForKeyedSubscript:@"SceneprintRevision"];
        v12->_revision = [v16 unsignedIntegerValue];
      }
      else
      {
        v12->_revision = 3737841671;
      }
    }
    self = v12;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)dealloc
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F45968] globalSession];
  [v3 releaseCachedResources];

  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v4 & 1) == 0)
  {
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v7 = [NSString stringWithFormat:@"Sceneprint task cancelled"];
    v12[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v9 = [v6 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v8];
    completionHandler[2](completionHandler, 0, v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)VCPPhotosSceneprintAssetProcessingTask;
  [(VCPPhotosSceneprintAssetProcessingTask *)&v10 dealloc];
}

+ (id)taskWithAssets:(id)a3 options:(id)a4 andCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAssets:v7 options:v8 andCompletionHandler:v9];

  return v10;
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
}

+ (unint64_t)_panoVNRequestMethod
{
  return 0;
}

- (BOOL)run:(id *)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1C186D320](self, a2);
  v77 = self;
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  v75 = +[VCPSceneProcessingImageManager imageManager];
  v71 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  obj = v77->_assets;
  unsigned __int8 v4 = a3;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v84 objects:v101 count:16];
  if (!v5) {
    goto LABEL_48;
  }
  uint64_t v76 = *(void *)v85;
  uint64_t v72 = *MEMORY[0x1E4F28760];
  uint64_t v73 = *MEMORY[0x1E4F28568];
  do
  {
    uint64_t v6 = 0;
    do
    {
      if (*(void *)v85 != v76) {
        objc_enumerationMutation(obj);
      }
      id v7 = *(void **)(*((void *)&v84 + 1) + 8 * v6);
      unsigned __int8 v8 = atomic_load((unsigned __int8 *)&v77->_cancel);
      if (v8)
      {
        if (v4)
        {
          v61 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v99 = v73;
          uint64_t v100 = [NSString stringWithFormat:@"Sceneprint task cancelled"];
          v78 = (void *)v100;
          v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
          uint64_t v62 = [v61 errorWithDomain:v72 code:-128 userInfo:v29];
          v63 = *v4;
          *unsigned __int8 v4 = (id)v62;
LABEL_53:

LABEL_54:
LABEL_55:
        }
LABEL_56:

        BOOL v60 = 0;
        goto LABEL_57;
      }
      id v9 = objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allAcceptableResourcesForAsset:", *(void *)(*((void *)&v84 + 1) + 8 * v6));
      v78 = objc_msgSend(v9, "vcp_thumbnailResource");

      if ((objc_msgSend(v78, "vcp_isLocallyAvailable") & 1) == 0)
      {
        if (a3)
        {
          v64 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v97 = v73;
          v65 = NSString;
          v29 = [v7 localIdentifier];
          v63 = [v65 stringWithFormat:@"[%@] Thumbnail is not locally available", v29];
          v98 = v63;
          v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
          v67 = [v64 errorWithDomain:v72 code:-23802 userInfo:v66];
          id v68 = *a3;
          *a3 = v67;

          goto LABEL_53;
        }
        goto LABEL_55;
      }
      uint64_t v10 = objc_msgSend(v7, "vcp_abnormalImageDimensionForSceneNet");
      if (v10)
      {
        uint64_t v11 = [(id)objc_opt_class() _panoVNRequestMethod];
        if (!v11)
        {
          id v30 = objc_alloc(MEMORY[0x1E4F45890]);
          v31 = [v78 privateFileURL];
          v29 = (void *)[v30 initWithURL:v31 options:MEMORY[0x1E4F1CC08]];

          goto LABEL_25;
        }
        v82 = 0;
        v83 = 0;
        v12 = [v78 privateFileURL];
        int v13 = [v75 loadFullPixelBuffer:&v83 scaledPixelBuffer299:&v82 scaledPixelBuffer360:0 fromImageURL:v12 abnormalDimension:v10];

        if (v13)
        {
          if (a3)
          {
            v14 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v93 = v73;
            v15 = NSString;
            v16 = [v7 localIdentifier];
            v17 = [v15 stringWithFormat:@"[%@] Failed to load thumbnail image", v16];
            v94 = v17;
            v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
            objc_super v19 = [v14 errorWithDomain:v72 code:v13 userInfo:v18];
            id v20 = *a3;
            *a3 = v19;
          }
LABEL_16:
          v29 = 0;
          goto LABEL_24;
        }
        id v32 = objc_alloc(MEMORY[0x1E4F45890]);
        if (v11 == 1) {
          v33 = &v83;
        }
        else {
          v33 = &v82;
        }
        uint64_t v35 = [v32 initWithCVPixelBuffer:*v33 options:MEMORY[0x1E4F1CC08]];
      }
      else
      {
        v82 = 0;
        v83 = 0;
        v21 = [v78 privateFileURL];
        int v13 = [v75 loadFullPixelBuffer:&v83 scaledPixelBuffer299:&v82 scaledPixelBuffer360:0 fromImageURL:v21 abnormalDimension:0];

        if (v13)
        {
          if (a3)
          {
            v22 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v95 = v73;
            v23 = NSString;
            v24 = [v7 localIdentifier];
            v25 = [v23 stringWithFormat:@"[%@] Failed to load thumbnail image", v24];
            v96 = v25;
            v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
            v27 = [v22 errorWithDomain:v72 code:v13 userInfo:v26];
            id v28 = *a3;
            *a3 = v27;
          }
          goto LABEL_16;
        }
        id v34 = objc_alloc(MEMORY[0x1E4F45890]);
        uint64_t v35 = [v34 initWithCVPixelBuffer:v82 options:MEMORY[0x1E4F1CC08]];
      }
      v29 = (void *)v35;
LABEL_24:
      CF<opaqueCMSampleBuffer *>::~CF(&v82);
      CF<opaqueCMSampleBuffer *>::~CF(&v83);
      if (v13) {
        goto LABEL_54;
      }
LABEL_25:
      id v36 = objc_alloc_init(MEMORY[0x1E4F45758]);
      unint64_t revision = v77->_revision;
      id v81 = 0;
      char v38 = [v36 setRevision:revision error:&v81];
      id v39 = v81;
      if ((v38 & 1) == 0)
      {
        if (!a3)
        {
          int v49 = 1;
          goto LABEL_42;
        }
        v50 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v91 = v73;
        v44 = [NSString stringWithFormat:@"[%@] Failed to set revision %lu - %@", objc_opt_class(), v77->_revision, v39];
        v92 = v44;
        v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
        v52 = [v50 errorWithDomain:v72 code:-50 userInfo:v51];
        id v53 = *a3;
        *a3 = v52;

        goto LABEL_35;
      }
      [v36 setMetalContextPriority:1];
      [v36 setPreferBackgroundProcessing:1];
      if (DeviceHasANE())
      {
        v40 = [MEMORY[0x1E4F458E8] defaultANEDevice];
        [v36 setProcessingDevice:v40];
      }
      id v90 = v36;
      v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
      id v80 = v39;
      char v42 = [v29 performRequests:v41 error:&v80];
      id v43 = v80;

      if (v42)
      {
        v44 = [v36 results];
        if ([v44 count] == 1)
        {
          v45 = [v44 firstObject];
          v46 = [v45 sceneprints];
          v47 = [v46 firstObject];

          v48 = [v7 localIdentifier];
          [v71 setObject:v47 forKeyedSubscript:v48];
          int v49 = 0;
          goto LABEL_39;
        }
        if (a3)
        {
          v54 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v88 = v73;
          v55 = NSString;
          v47 = [v7 localIdentifier];
          v48 = [v55 stringWithFormat:@"[%@] Invalid sceneprint result", v47];
          v89 = v48;
          v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
          v57 = [v54 errorWithDomain:v72 code:-18 userInfo:v56];
          id v58 = *a3;
          *a3 = v57;

          int v49 = 1;
LABEL_39:
        }
        else
        {
          int v49 = 1;
        }
        id v39 = v43;
LABEL_41:

        goto LABEL_42;
      }
      if (a3)
      {
        id v39 = v43;
        v44 = *a3;
        *a3 = v39;
LABEL_35:
        int v49 = 1;
        goto LABEL_41;
      }
      int v49 = 1;
      id v39 = v43;
LABEL_42:

      unsigned __int8 v4 = a3;
      if (v49) {
        goto LABEL_56;
      }
      ++v6;
    }
    while (v5 != v6);
    uint64_t v59 = [(NSArray *)obj countByEnumeratingWithState:&v84 objects:v101 count:16];
    uint64_t v5 = v59;
  }
  while (v59);
LABEL_48:

  (*((void (**)(void))v77->_completionHandler + 2))();
  BOOL v60 = 1;
LABEL_57:

  return v60;
}

- (int)run
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  if ([(VCPPhotosSceneprintAssetProcessingTask *)self run:&v7])
  {
    int v3 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      unsigned __int8 v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = [v7 description];
        *(_DWORD *)buf = 138412290;
        id v9 = v5;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "Sceneprint task failed (%@)", buf, 0xCu);
      }
    }
    (*((void (**)(void))self->_completionHandler + 2))();
    int v3 = [v7 code];
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end