@interface VCPFaceProcessingVersionManager
+ (id)resetLevelDescription:(int64_t)a3;
+ (id)sharedManagerForPhotoLibrary:(id)a3;
- (BOOL)_updateVersionStateFileWithError:(id *)a3;
- (VCPFaceProcessingVersionManager)initWithPhotoLibrary:(id)a3;
- (id)_versionStateURL;
- (int)_updateCurrentProcessingVersion:(int)a3;
- (int)currentProcessingVersion;
- (int)defaultProcessingVersion;
- (int)migrateFaceProcessingToVersion:(int)a3;
- (int)resetAnalysisDataWithResetLevel:(int64_t)a3 error:(id *)a4;
@end

@implementation VCPFaceProcessingVersionManager

- (VCPFaceProcessingVersionManager)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v14.receiver = self;
    v14.super_class = (Class)VCPFaceProcessingVersionManager;
    v6 = [(VCPFaceProcessingVersionManager *)&v14 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_photoLibrary, a3);
      id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v9 = [(VCPFaceProcessingVersionManager *)v7 _versionStateURL];
      uint64_t v10 = [v8 initWithContentsOfURL:v9];
      versionState = v7->_versionState;
      v7->_versionState = (NSDictionary *)v10;
    }
    self = v7;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)sharedManagerForPhotoLibrary:(id)a3
{
  id v3 = a3;
  v4 = [v3 photoLibraryURL];
  id v5 = [v4 absoluteString];

  v6 = [NSString stringWithFormat:@"VCPFaceProcessingVersionManager-%@", v5];
  v7 = +[VCPSharedInstanceManager sharedManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__VCPFaceProcessingVersionManager_sharedManagerForPhotoLibrary___block_invoke;
  v11[3] = &unk_1E6298888;
  id v8 = v3;
  id v12 = v8;
  v9 = [v7 sharedInstanceWithIdentifier:v6 andCreationBlock:v11];

  return v9;
}

VCPFaceProcessingVersionManager *__64__VCPFaceProcessingVersionManager_sharedManagerForPhotoLibrary___block_invoke(uint64_t a1)
{
  v1 = [[VCPFaceProcessingVersionManager alloc] initWithPhotoLibrary:*(void *)(a1 + 32)];
  return v1;
}

- (id)_versionStateURL
{
  v2 = [(PHPhotoLibrary *)self->_photoLibrary vcp_visionCacheStorageDirectoryURL];
  id v3 = [v2 absoluteURL];

  v4 = [v3 URLByAppendingPathComponent:@"mediaAnalysisVersionState.plist"];

  return v4;
}

- (BOOL)_updateVersionStateFileWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  versionState = self->_versionState;
  id v5 = [(VCPFaceProcessingVersionManager *)self _versionStateURL];
  id v11 = 0;
  BOOL v6 = [(NSDictionary *)versionState writeToURL:v5 error:&v11];
  id v7 = v11;

  if (v7) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v6;
  }
  if (!v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v7;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[FaceModelBump] Failed to update version state - %@", buf, 0xCu);
      }
    }
    if (a3) {
      *a3 = v7;
    }
  }

  return v6;
}

- (int)defaultProcessingVersion
{
  int v3 = _os_feature_enabled_impl();
  if ([(PHPhotoLibrary *)self->_photoLibrary isSystemPhotoLibrary]
    && (VCPMAIsAppleInternal() & v3) == 1
    && (!_os_feature_enabled_impl()
     || (+[VCPPhotosAutoCounterWorker workerWithPhotoLibrary:](VCPPhotosAutoCounterWorker, "workerWithPhotoLibrary:", self->_photoLibrary), v4 = objc_claimAutoreleasedReturnValue(), uint64_t v5 = [v4 optInPersonCount], v4, v5)))
  {
    if (![(VCPFaceProcessingVersionManager *)self currentProcessingVersion]) {
      [(VCPFaceProcessingVersionManager *)self _updateCurrentProcessingVersion:11];
    }
    return [(VCPFaceProcessingVersionManager *)self currentProcessingVersion];
  }
  else if (_os_feature_enabled_impl())
  {
    return 15;
  }
  else
  {
    return 11;
  }
}

- (int)currentProcessingVersion
{
  int v3 = [(NSDictionary *)self->_versionState objectForKeyedSubscript:@"FaceProcessingInternalVersion"];
  if (v3)
  {
    v4 = [(NSDictionary *)self->_versionState objectForKeyedSubscript:@"FaceProcessingInternalVersion"];
    int v5 = [v4 integerValue];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (int)_updateCurrentProcessingVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = self;
  objc_sync_enter(v4);
  versionState = v4->_versionState;
  if (versionState)
  {
    uint64_t v6 = [(NSDictionary *)versionState mutableCopy];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v7 = (void *)v6;
  BOOL v8 = [NSNumber numberWithInt:v3];
  [v7 setObject:v8 forKeyedSubscript:@"FaceProcessingInternalVersion"];

  v9 = [(VCPFaceProcessingVersionManager *)v4 _versionStateURL];
  if (v9)
  {
    id v18 = 0;
    char v10 = [v7 writeToURL:v9 error:&v18];
    id v11 = v18;
    if (v11) {
      char v12 = 0;
    }
    else {
      char v12 = v10;
    }
    if (v12)
    {
      id v13 = v7;
      uint64_t v14 = 0;
      int v15 = 0;
      p_super = &v4->_versionState->super;
      v4->_versionState = v13;
    }
    else
    {
      uint64_t v14 = v11;
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v15 = -20;
        goto LABEL_21;
      }
      p_super = VCPLogInstance();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v14;
        _os_log_impl(&dword_1BBEDA000, p_super, OS_LOG_TYPE_ERROR, "[FaceModelBump] Failed to update version state - %@", buf, 0xCu);
      }
      int v15 = -20;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      uint64_t v14 = 0;
      int v15 = -50;
      goto LABEL_21;
    }
    p_super = VCPLogInstance();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = 0;
      _os_log_impl(&dword_1BBEDA000, p_super, OS_LOG_TYPE_ERROR, "[FaceModelBump] No persistentURL to update version state - %@", buf, 0xCu);
    }
    uint64_t v14 = 0;
    int v15 = -50;
  }

LABEL_21:
  objc_sync_exit(v4);

  return v15;
}

- (int)resetAnalysisDataWithResetLevel:(int64_t)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [(PHPhotoLibrary *)self->_photoLibrary photoLibraryURL];
      v9 = [v8 path];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEFAULT, "[FaceModelBump] Resetting face data ... (%@)", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __73__VCPFaceProcessingVersionManager_resetAnalysisDataWithResetLevel_error___block_invoke;
  id v18 = &unk_1E62988D8;
  p_long long buf = &buf;
  v22 = a4;
  v19 = self;
  id v11 = v10;
  v20 = v11;
  char v12 = _Block_copy(&v15);
  -[PHPhotoLibrary resetFaceAnalysisWithResetLevel:completionHandler:](self->_photoLibrary, "resetFaceAnalysisWithResetLevel:completionHandler:", a3, v12, v15, v16, v17, v18, v19);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  int v13 = *(_DWORD *)(*((void *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
  return v13;
}

void __73__VCPFaceProcessingVersionManager_resetAnalysisDataWithResetLevel_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5 || (a2 & 1) == 0)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -18;
    if (v5 && *(void *)(a1 + 56))
    {
      uint64_t v12 = [v5 copy];
      int v13 = *(void ***)(a1 + 56);
      uint64_t v14 = *v13;
      *int v13 = (void *)v12;
    }
  }
  else if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "mad_useVUGallery"))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__VCPFaceProcessingVersionManager_resetAnalysisDataWithResetLevel_error___block_invoke_2;
    aBlock[3] = &unk_1E62988B0;
    aBlock[4] = *(void *)(a1 + 48);
    id v7 = (void (**)(void *, void *))_Block_copy(aBlock);
    BOOL v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "vcp_visionCacheStorageDirectoryURL");
    v9 = [v8 URLByAppendingPathComponent:@"VUIndex.sqlite"];
    v7[2](v7, v9);

    dispatch_semaphore_t v10 = [v8 URLByAppendingPathComponent:@"VUIndex.sqlite-shm"];
    v7[2](v7, v10);

    id v11 = [v8 URLByAppendingPathComponent:@"VUIndex.sqlite-wal"];
    v7[2](v7, v11);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __73__VCPFaceProcessingVersionManager_resetAnalysisDataWithResetLevel_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v5 = [v3 path];
    int v6 = [v4 fileExistsAtPath:v5];

    if (v6)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        id v7 = VCPLogInstance();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v14 = v3;
          _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[FaceModelBump] Dropping %@", buf, 0xCu);
        }
      }
      BOOL v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v12 = 0;
      char v9 = [v8 removeItemAtURL:v3 error:&v12];
      id v10 = v12;

      if ((v9 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          id v11 = VCPLogInstance();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412546;
            id v14 = v3;
            __int16 v15 = 2112;
            id v16 = v10;
            _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "[FaceModelBump] Failed to remove %@ - %@", buf, 0x16u);
          }
        }
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -18;
      }
    }
  }
}

- (int)migrateFaceProcessingToVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v5 = [(VCPFaceProcessingVersionManager *)self currentProcessingVersion];
  if (!v5 || (int v6 = v5, v5 > (int)v3))
  {
    id v7 = self;
    objc_sync_enter(v7);
    int v8 = [(VCPFaceProcessingVersionManager *)v7 _updateCurrentProcessingVersion:5];
    if (v8)
    {
      objc_sync_exit(v7);

      return v8;
    }
    int v6 = [(VCPFaceProcessingVersionManager *)v7 currentProcessingVersion];
    objc_sync_exit(v7);
  }
  if (v6 >= (int)v3) {
    return 0;
  }
  char v9 = self;
  objc_sync_enter(v9);
  id v13 = 0;
  int v8 = [(VCPFaceProcessingVersionManager *)v9 resetAnalysisDataWithResetLevel:2 error:&v13];
  if (v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v15 = v13;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "[FaceModelBump] Failed to reset Face Analysis data for PhotoLibrary %@", buf, 0xCu);
      }
    }
    BOOL v11 = 0;
  }
  else
  {
    int v8 = [(VCPFaceProcessingVersionManager *)v9 _updateCurrentProcessingVersion:v3];
    BOOL v11 = v8 == 0;
  }

  objc_sync_exit(v9);
  if (v11) {
    return 0;
  }
  return v8;
}

+ (id)resetLevelDescription:(int64_t)a3
{
  uint64_t v3 = @"Reset none";
  if (a3 == 1) {
    uint64_t v3 = @"Reset faceAdjustmentVersion";
  }
  if (a3 == 2) {
    return @"Reset for Forward Compatible version bump (asset.faceAdjustmentVersion + facecrops)";
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionState, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end