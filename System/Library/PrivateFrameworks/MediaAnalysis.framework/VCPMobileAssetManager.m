@interface VCPMobileAssetManager
+ (BOOL)isCaptionOTAEnabled;
+ (BOOL)isOTAFailTestEnabled;
+ (id)assetName:(int64_t)a3;
+ (id)assetVersion:(int64_t)a3;
+ (id)sharedManager;
+ (int64_t)assetTypeForName:(id)a3;
- (VCPMobileAssetManager)init;
- (id)cloneAsset:(id)a3 to:(id)a4;
- (id)downloadMobileAssetIfNeeded:(id)a3 petWatchDog:(id)a4;
- (id)queryMobileAssets;
- (id)retrieveAssetLocalURL:(id)a3 assetVersion:(id)a4 petWatchDog:(id)a5 cancelBlock:(id)a6;
- (id)retrieveAssetLocalURL:(int64_t)a3;
- (id)retrieveAssetLocalURL:(int64_t)a3 petWatchDog:(id)a4 cancelBlock:(id)a5;
- (id)retrieveAssetOnce:(int64_t)a3 petWatchDog:(id)a4 cancelBlock:(id)a5;
- (int)purgeAllInstalledAssets;
@end

@implementation VCPMobileAssetManager

- (VCPMobileAssetManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)VCPMobileAssetManager;
  v2 = [(VCPMobileAssetManager *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mediaanalysis.VCPMobileAssetManager", 0);
    assetQueue = v2->_assetQueue;
    v2->_assetQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mediaanalysis.VCPMobileAssetManager.retrieveAssetOnce", 0);
    retrieveAssetOnceQueue = v2->_retrieveAssetOnceQueue;
    v2->_retrieveAssetOnceQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    assetsURL = v2->_assetsURL;
    v2->_assetsURL = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    assetsNotAvailable = v2->_assetsNotAvailable;
    v2->_assetsNotAvailable = (NSMutableSet *)v9;
  }
  return v2;
}

+ (BOOL)isCaptionOTAEnabled
{
  return 0;
}

+ (BOOL)isOTAFailTestEnabled
{
  return 0;
}

+ (id)sharedManager
{
  v2 = +[VCPSharedInstanceManager sharedManager];
  dispatch_queue_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  dispatch_queue_t v5 = [v2 sharedInstanceWithIdentifier:v4 andCreationBlock:&__block_literal_global_95];

  return v5;
}

VCPMobileAssetManager *__38__VCPMobileAssetManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(VCPMobileAssetManager);
  return v0;
}

+ (id)assetName:(int64_t)a3
{
  if ((unint64_t)a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownType(%lu)", a3);
    dispatch_queue_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    dispatch_queue_t v3 = off_1E629CD40[a3];
  }
  return v3;
}

+ (int64_t)assetTypeForName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AXImageCaption"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"AXImageCaptionCSU"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"AXVideoCaptionEncoder"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"AXVideoCaptionDecoder"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"MiCaImageCaptionDecoder"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"MiCaVideoCaptionDecoder"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"Pissarro"])
  {
    int64_t v4 = 6;
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

+ (id)assetVersion:(int64_t)a3
{
  int64_t v4 = @"9.5";
  switch(a3)
  {
    case 0:
    case 3:
      break;
    case 1:
      int64_t v4 = @"8.3";
      break;
    case 2:
      int64_t v4 = @"3.0";
      break;
    case 4:
    case 5:
      if (+[VCPVideoTransformerBackbone revision] == 3)
      {
        int64_t v4 = @"3.0.0";
      }
      else
      {
        if (+[VCPVideoTransformerBackbone revision] != 4) {
          goto LABEL_8;
        }
        int64_t v4 = @"4.0.0";
      }
      break;
    case 6:
      int64_t v4 = @"LatestVersion";
      break;
    default:
LABEL_8:
      objc_msgSend(NSString, "stringWithFormat:", @"UnknownType(%lu)", a3);
      int64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v4;
}

- (id)cloneAsset:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__59;
  v21 = __Block_byref_object_dispose__59;
  id v22 = 0;
  assetQueue = self->_assetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__VCPMobileAssetManager_cloneAsset_to___block_invoke;
  block[3] = &unk_1E629CC30;
  id v14 = v7;
  id v15 = v6;
  v16 = &v17;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(assetQueue, block);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __39__VCPMobileAssetManager_cloneAsset_to___block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/tmp/com.apple.mediaanalysisd/" isDirectory:1];
  int64_t v4 = [v3 URLByAppendingPathComponent:*(void *)(a1 + 32) isDirectory:1];

  char v52 = 0;
  dispatch_queue_t v5 = [v4 path];
  char v6 = [v2 fileExistsAtPath:v5 isDirectory:&v52];

  if (v6)
  {
    id v7 = 0;
    goto LABEL_8;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v4;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "[MobileAssetManager] Creating clone directory for asset: %@", buf, 0xCu);
    }
  }
  id v51 = 0;
  char v9 = [v2 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v51];
  id v7 = v51;
  if (v9)
  {
LABEL_8:
    id v10 = [*(id *)(a1 + 40) lastPathComponent];
    id v11 = [v4 URLByAppendingPathComponent:v10 isDirectory:1];

    v47 = [*(id *)(a1 + 40) path];
    objc_super v12 = [v11 path];
    v13 = [*(id *)(a1 + 40) URLByAppendingPathComponent:@"model_info.json" isDirectory:0];
    id v14 = [v11 URLByAppendingPathComponent:@"model_info.json" isDirectory:0];
    v46 = v13;
    id v15 = [v13 path];
    v45 = v14;
    if ([v2 fileExistsAtPath:v15])
    {
      v16 = [v14 path];
      int v17 = [v2 fileExistsAtPath:v16];

      if (!v17) {
        goto LABEL_26;
      }
      id v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v46];
      uint64_t v18 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v14];
      uint64_t v19 = (void *)v18;
      if (v15 && v18)
      {
        id v50 = v7;
        v44 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v15 options:0 error:&v50];
        id v20 = v50;

        id v49 = v20;
        v21 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v19 options:0 error:&v49];
        id v7 = v49;

        id v22 = v44;
        if (v44 && v21 && [v44 isEqualToDictionary:v21])
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v23 = VCPLogInstance();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v54 = v11;
              _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEBUG, "[MobileAssetManager] Same asset already existing at %@, skip cloning", buf, 0xCu);
            }

            id v22 = v44;
          }
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v11);

LABEL_51:
LABEL_52:

          goto LABEL_53;
        }
      }
    }

LABEL_26:
    v24 = v7;
    v25 = [v11 path];
    int v26 = [v2 fileExistsAtPath:v25 isDirectory:0];

    if (v26)
    {
      id v48 = v24;
      int v27 = [v2 removeItemAtURL:v11 error:&v48];
      id v7 = v48;

      int v28 = MediaAnalysisLogLevel();
      if (v27)
      {
        if (v28 >= 7)
        {
          v29 = VCPLogInstance();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v11;
            v30 = "[MobileAssetManager] Delete old clone asset at %@";
            v31 = v29;
            os_log_type_t v32 = OS_LOG_TYPE_DEBUG;
            uint32_t v33 = 12;
LABEL_35:
            _os_log_impl(&dword_1BBEDA000, v31, v32, v30, buf, v33);
            goto LABEL_36;
          }
          goto LABEL_36;
        }
      }
      else if (v28 >= 3)
      {
        v29 = VCPLogInstance();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v54 = v11;
          __int16 v55 = 2112;
          id v56 = v7;
          v30 = "[MobileAssetManager] Could not delete old clone asset at %@ with error: %@";
          v31 = v29;
          os_log_type_t v32 = OS_LOG_TYPE_ERROR;
          uint32_t v33 = 22;
          goto LABEL_35;
        }
LABEL_36:
      }
    }
    else
    {
      id v7 = v24;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v34 = VCPLogInstance();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v54 = v47;
        __int16 v55 = 2112;
        id v56 = v12;
        _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_DEBUG, "[MobileAssetManager] Cloning asset: '%@' to: '%@'", buf, 0x16u);
      }
    }
    v35 = v47;
    v36 = (const char *)[v35 UTF8String];
    id v37 = v12;
    LODWORD(v36) = clonefile(v36, (const char *)[v37 UTF8String], 1u);
    int v38 = MediaAnalysisLogLevel();
    if (v36)
    {
      if (v38 >= 3)
      {
        v39 = VCPLogInstance();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          int v40 = *__error();
          v41 = __error();
          v42 = strerror(*v41);
          *(_DWORD *)buf = 138413314;
          v54 = v35;
          __int16 v55 = 2112;
          id v56 = v37;
          __int16 v57 = 1024;
          int v58 = 1;
          __int16 v59 = 1024;
          int v60 = v40;
          __int16 v61 = 2080;
          v62 = v42;
          _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_ERROR, "[MobileAssetManager] Could not clone asset. clonefile(%@, %@, %o) FAILED with (%d : %s)", buf, 0x2Cu);
        }
      }
    }
    else
    {
      if (v38 >= 7)
      {
        v43 = VCPLogInstance();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v11;
          _os_log_impl(&dword_1BBEDA000, v43, OS_LOG_TYPE_DEBUG, "[MobileAssetManager] Asset successfully cloned at: %@", buf, 0xCu);
        }
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v11);
    }
    goto LABEL_51;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v54 = v4;
      __int16 v55 = 2112;
      id v56 = v7;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "[MobileAssetManager] Could not create clone directory for asset: %@. error: %@", buf, 0x16u);
    }
    goto LABEL_52;
  }
LABEL_53:
}

- (id)queryMobileAssets
{
  if (queryMobileAssets_once != -1) {
    dispatch_once(&queryMobileAssets_once, &__block_literal_global_606);
  }
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  objc_super v12 = __Block_byref_object_copy__59;
  v13 = __Block_byref_object_dispose__59;
  id v14 = 0;
  assetQueue = self->_assetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__VCPMobileAssetManager_queryMobileAssets__block_invoke_610;
  block[3] = &unk_1E629B028;
  void block[4] = &v9;
  dispatch_sync(assetQueue, block);
  if (!v10[5] && (int)MediaAnalysisLogLevel() >= 3)
  {
    int64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[MobileAssetManager] No VCPMobileAsset query results", v7, 2u);
    }
  }
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __42__VCPMobileAssetManager_queryMobileAssets__block_invoke()
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v0 = VCPLogInstance();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v0, OS_LOG_TYPE_INFO, "[MobileAssetManager] Updating MobileAsset catalog", buf, 2u);
    }
  }
  *(void *)buf = 0;
  id v3 = buf;
  uint64_t v4 = 0x3032000000;
  id v5 = __Block_byref_object_copy__59;
  char v6 = __Block_byref_object_dispose__59;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __42__VCPMobileAssetManager_queryMobileAssets__block_invoke_608;
  v1[3] = &unk_1E629CC58;
  v1[4] = buf;
  [MEMORY[0x1E4F77FB0] startCatalogDownload:@"com.apple.MobileAsset.VCPMobileAssets" then:v1];
  dispatch_semaphore_wait(*((dispatch_semaphore_t *)v3 + 5), 0xFFFFFFFFFFFFFFFFLL);
  _Block_object_dispose(buf, 8);
}

intptr_t __42__VCPMobileAssetManager_queryMobileAssets__block_invoke_608(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 134217984;
      uint64_t v7 = a2;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEBUG, "[MobileAssetManager] Download meta data reply %ld", (uint8_t *)&v6, 0xCu);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

void __42__VCPMobileAssetManager_queryMobileAssets__block_invoke_610(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F77FB8]) initWithType:@"com.apple.MobileAsset.VCPMobileAssets"];
  uint64_t v3 = [v2 queryMetaDataSync];
  if (v3)
  {
    uint64_t v4 = v3;
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v9 = 134217984;
        uint64_t v10 = v4;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "[MobileAssetManager] Queried asset metadata error with MAQueryResult: %ld", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v6 = [v2 results];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (id)downloadMobileAssetIfNeeded:(id)a3 petWatchDog:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    *(void *)buf = 0;
    int v17 = buf;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__59;
    id v20 = __Block_byref_object_dispose__59;
    id v21 = 0;
    assetQueue = self->_assetQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__VCPMobileAssetManager_downloadMobileAssetIfNeeded_petWatchDog___block_invoke;
    block[3] = &unk_1E629CCD0;
    id v13 = v6;
    id v14 = v7;
    id v15 = buf;
    dispatch_sync(assetQueue, block);
    id v9 = *((id *)v17 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "[MobileAssetManager] Asset to download is nil", buf, 2u);
      }
    }
    id v9 = 0;
  }

  return v9;
}

void __65__VCPMobileAssetManager_downloadMobileAssetIfNeeded_petWatchDog___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v2 = dispatch_group_create();
  id v3 = objc_alloc_init(MEMORY[0x1E4F77FE8]);
  [v3 setAllowsCellularAccess:1];
  [v3 setDiscretionary:0];
  [v3 setTimeoutIntervalForResource:110];
  uint64_t v37 = 0;
  int v38 = &v37;
  uint64_t v39 = 0x3032000000;
  int v40 = __Block_byref_object_copy__59;
  v41 = __Block_byref_object_dispose__59;
  id v42 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  if ([*(id *)(a1 + 32) state] == 1 || !objc_msgSend(*(id *)(a1 + 32), "state"))
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [*(id *)(a1 + 32) assetId];
        *(_DWORD *)buf = 138412290;
        v44 = v11;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_INFO, "[MobileAssetManager] Mobile asset %@ not local - downloading", buf, 0xCu);
      }
    }
    os_log_type_t v32 = 0;
    if ([*(id *)(a1 + 32) spaceCheck:&v32])
    {
      dispatch_group_enter(v2);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __65__VCPMobileAssetManager_downloadMobileAssetIfNeeded_petWatchDog___block_invoke_613;
      v30[3] = &unk_1E629CC80;
      objc_super v12 = *(void **)(a1 + 32);
      id v31 = *(id *)(a1 + 40);
      [v12 attachProgressCallBack:v30];
      uint64_t v13 = *(void *)(a1 + 40);
      if (v13) {
        (*(void (**)(void))(v13 + 16))();
      }
      id v14 = *(void **)(a1 + 32);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __65__VCPMobileAssetManager_downloadMobileAssetIfNeeded_petWatchDog___block_invoke_615;
      v26[3] = &unk_1E629CCA8;
      id v15 = v2;
      int v27 = v15;
      int v28 = &v37;
      v29 = &v33;
      [v14 startDownload:v3 completionWithError:v26];

      dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      unint64_t v16 = v34[3];
      if (v16 <= 0x1D && ((1 << v16) & 0x2000C001) != 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          int v17 = VCPLogInstance();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            uint64_t v18 = [*(id *)(a1 + 32) getLocalUrl];
            uint64_t v19 = (void *)v34[3];
            *(_DWORD *)buf = 138412546;
            v44 = v18;
            __int16 v45 = 2048;
            v46 = v19;
            _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_INFO, "[MobileAssetManager] Mobile asset successfully downloaded at:%@ with downloadResult:%ld", buf, 0x16u);
          }
        }
        uint64_t v20 = [*(id *)(a1 + 32) getLocalUrl];
        uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
        id v22 = *(NSObject **)(v21 + 40);
        *(void *)(v21 + 40) = v20;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_26;
        }
        id v22 = VCPLogInstance();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = [*(id *)(a1 + 32) assetId];
          v24 = (void *)v34[3];
          v25 = [(id)v38[5] description];
          *(_DWORD *)buf = 138412802;
          v44 = v23;
          __int16 v45 = 2048;
          v46 = v24;
          __int16 v47 = 2112;
          id v48 = v25;
          _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, "[MobileAssetManager] Mobile asset %@ download failed with MADownloadResult:%ld and error:%@", buf, 0x20u);
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_26;
      }
      id v22 = VCPLogInstance();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v44 = v32;
        _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, "[MobileAssetManager] Space not available to download asset %lli", buf, 0xCu);
      }
    }

    goto LABEL_26;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [*(id *)(a1 + 32) assetId];
      id v6 = [*(id *)(a1 + 32) getLocalUrl];
      *(_DWORD *)buf = 138412546;
      v44 = v5;
      __int16 v45 = 2112;
      v46 = v6;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "[MobileAssetManager] Mobile asset %@ already exists at %@, skip downloading", buf, 0x16u);
    }
  }
  uint64_t v7 = [*(id *)(a1 + 32) getLocalUrl];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

LABEL_26:
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
}

void __65__VCPMobileAssetManager_downloadMobileAssetIfNeeded_petWatchDog___block_invoke_613(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 134218240;
      uint64_t v7 = [v3 totalWritten];
      __int16 v8 = 2048;
      uint64_t v9 = [v3 totalExpected];
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "[MobileAssetManager] Progress callback: %lld %lld", (uint8_t *)&v6, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

void __65__VCPMobileAssetManager_downloadMobileAssetIfNeeded_petWatchDog___block_invoke_615(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 134217984;
      uint64_t v9 = a2;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MobileAssetManager] Downloaded asset with result %li", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)retrieveAssetLocalURL:(id)a3 assetVersion:(id)a4 petWatchDog:(id)a5 cancelBlock:(id)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  objc_super v12 = (void (**)(void))a5;
  uint64_t v13 = (unsigned int (**)(void))a6;
  __int16 v47 = self;
  if (![(id)objc_opt_class() isOTAFailTestEnabled])
  {
    if (VCPMAIsAppleInternal())
    {
      unint64_t v16 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
      int v17 = [v16 resourceURL];

      uint64_t v18 = [NSString stringWithFormat:@"%@/%@", v10, v11];
      [MEMORY[0x1E4F1CB10] URLWithString:v18 relativeToURL:v17];
      v46 = id v58 = 0;
      int v19 = [v46 checkResourceIsReachableAndReturnError:&v58];
      id v20 = v58;
      if (v19)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          uint64_t v21 = VCPLogInstance();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            id v61 = v10;
            __int16 v62 = 2112;
            id v63 = v11;
            __int16 v64 = 2112;
            uint64_t v65 = (uint64_t)v46;
            _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_INFO, "[MobileAssetManager] In-framework asset (%@-%@) available at %@", buf, 0x20u);
          }
        }
        id v14 = v46;

        id v15 = v14;
        goto LABEL_92;
      }
    }
    else
    {
      v46 = 0;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v22 = VCPLogInstance();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v61 = v10;
        __int16 v62 = 2112;
        id v63 = v11;
        _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_INFO, "[MobileAssetManager] Retrieving (download if not present) mobile asset: %@-%@", buf, 0x16u);
      }
    }
    if (v13 && v13[2](v13))
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v23 = VCPLogInstance();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v24 = "[MobileAssetManager] Cancelled";
LABEL_51:
          _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
          goto LABEL_52;
        }
        goto LABEL_52;
      }
      goto LABEL_53;
    }
    if (v12) {
      v12[2](v12);
    }
    v25 = [(VCPMobileAssetManager *)v47 queryMobileAssets];
    if (!v25)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v23 = VCPLogInstance();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v24 = "[MobileAssetManager] No results queried with MobileAsset";
          goto LABEL_51;
        }
LABEL_52:
        int v38 = 0;
        v53 = 0;
        obj = 0;
LABEL_89:

        goto LABEL_90;
      }
LABEL_53:
      int v38 = 0;
      v53 = 0;
      obj = 0;
LABEL_90:
      id v14 = v38;
      id v15 = v14;
LABEL_91:

      goto LABEL_92;
    }
    __int16 v45 = v12;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    obj = v25;
    uint64_t v51 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v51)
    {
      v53 = 0;
      uint64_t v50 = *(void *)v55;
      id v52 = v10;
      id v48 = v11;
LABEL_30:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v55 != v50) {
          objc_enumerationMutation(obj);
        }
        int v27 = *(void **)(*((void *)&v54 + 1) + 8 * v26);
        int v28 = (void *)MEMORY[0x1C186D320]();
        if (v13 && v13[2](v13))
        {
          id v10 = v52;
          id v11 = v48;
          objc_super v12 = v45;
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            id v42 = VCPLogInstance();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              v43 = [v27 assetId];
              *(_DWORD *)buf = 138412290;
              id v61 = v43;
              _os_log_impl(&dword_1BBEDA000, v42, OS_LOG_TYPE_ERROR, "[MobileAssetManager] Cancelled processing %@", buf, 0xCu);
            }
          }
          int v38 = 0;
          v23 = obj;
          goto LABEL_89;
        }
        v29 = v13;
        v30 = [v27 attributes];
        id v31 = [v30 objectForKey:@"Model"];
        os_log_type_t v32 = [v31 objectForKey:@"AssetName"];
        uint64_t v33 = [v31 objectForKey:@"Version"];
        if (![v32 isEqualToString:v52]) {
          goto LABEL_43;
        }
        if (([v48 isEqualToString:@"LatestVersion"] & 1) != 0
          || [v33 isEqualToString:v48])
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v34 = VCPLogInstance();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              id v61 = v27;
              __int16 v62 = 2112;
              id v63 = v32;
              __int16 v64 = 2112;
              uint64_t v65 = (uint64_t)v33;
              _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_DEBUG, "[MobileAssetManager] Asset successfully queried: %@ (name %@ ver %@)", buf, 0x20u);
            }
          }
          id v35 = v27;

          int v36 = 0;
          int v37 = 1;
          v53 = v35;
        }
        else
        {
LABEL_43:
          int v37 = 0;
          int v36 = 1;
        }

        if (!v36) {
          break;
        }
        ++v26;
        uint64_t v13 = v29;
        if (v51 == v26)
        {
          id v10 = v52;
          id v11 = v48;
          uint64_t v51 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
          if (v51) {
            goto LABEL_30;
          }
          goto LABEL_55;
        }
      }

      id v11 = v48;
      uint64_t v13 = v29;
      if (v37)
      {
        id v10 = v52;
        goto LABEL_58;
      }
      id v14 = 0;
      id v15 = v46;
      id v10 = v52;
      objc_super v12 = v45;
      goto LABEL_91;
    }
    v53 = 0;
LABEL_55:

LABEL_58:
    objc_super v12 = v45;
    if (v13 && v13[2](v13))
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v38 = 0;
        goto LABEL_90;
      }
      v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "[MobileAssetManager] Cancelled", buf, 2u);
      }
      int v38 = 0;
      goto LABEL_89;
    }
    uint64_t v39 = [(VCPMobileAssetManager *)v47 downloadMobileAssetIfNeeded:v53 petWatchDog:v45];

    int v40 = MediaAnalysisLogLevel();
    if (!v39)
    {
      if (v40 < 3)
      {
        int v38 = 0;
        v46 = 0;
        goto LABEL_90;
      }
      v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v61 = v10;
        __int16 v62 = 2112;
        id v63 = v11;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "[MobileAssetManager] Failed to download asset: %@-%@", buf, 0x16u);
      }
      int v38 = 0;
      v46 = 0;
      goto LABEL_89;
    }
    if (v40 >= 7)
    {
      v41 = VCPLogInstance();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v61 = v10;
        __int16 v62 = 2112;
        id v63 = v11;
        __int16 v64 = 2112;
        uint64_t v65 = v39;
        _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_DEBUG, "[MobileAssetManager] Asset %@-%@ local url: %@", buf, 0x20u);
      }
    }
    if (v13 && v13[2](v13))
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v23 = VCPLogInstance();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "[MobileAssetManager] Cancelled", buf, 2u);
        }
        int v38 = 0;
LABEL_84:
        v46 = v39;
        goto LABEL_89;
      }
      int v38 = 0;
    }
    else
    {
      int v38 = [(VCPMobileAssetManager *)v47 cloneAsset:v39 to:v10];
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v23 = VCPLogInstance();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v61 = v10;
          __int16 v62 = 2112;
          id v63 = v11;
          __int16 v64 = 2112;
          uint64_t v65 = (uint64_t)v38;
          _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_INFO, "[MobileAssetManager] Retrieved asset %@-%@ at: %@", buf, 0x20u);
        }
        goto LABEL_84;
      }
    }
    v46 = v39;
    goto LABEL_90;
  }
  if ((int)MediaAnalysisLogLevel() < 6)
  {
    id v15 = 0;
    goto LABEL_93;
  }
  id v14 = VCPLogInstance();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_INFO, "[MobileAssetManager] OTAFailTest enabled, asset downloading fail for testing", buf, 2u);
  }
  id v15 = 0;
LABEL_92:

LABEL_93:
  return v15;
}

- (id)retrieveAssetLocalURL:(int64_t)a3 petWatchDog:(id)a4 cancelBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(id)objc_opt_class() assetName:a3];
  id v11 = [(id)objc_opt_class() assetVersion:a3];
  objc_super v12 = [(VCPMobileAssetManager *)self retrieveAssetLocalURL:v10 assetVersion:v11 petWatchDog:v9 cancelBlock:v8];

  return v12;
}

- (id)retrieveAssetLocalURL:(int64_t)a3
{
  return [(VCPMobileAssetManager *)self retrieveAssetLocalURL:a3 petWatchDog:0 cancelBlock:0];
}

- (id)retrieveAssetOnce:(int64_t)a3 petWatchDog:(id)a4 cancelBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__59;
  v24 = __Block_byref_object_dispose__59;
  id v25 = 0;
  retrieveAssetOnceQueue = self->_retrieveAssetOnceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__VCPMobileAssetManager_retrieveAssetOnce_petWatchDog_cancelBlock___block_invoke;
  block[3] = &unk_1E629CCF8;
  uint64_t v18 = &v20;
  int64_t v19 = a3;
  void block[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(retrieveAssetOnceQueue, block);
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __67__VCPMobileAssetManager_retrieveAssetOnce_petWatchDog_cancelBlock___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() assetName:*(void *)(a1 + 64)];
  id v3 = [(id)objc_opt_class() assetVersion:*(void *)(a1 + 64)];
  if ([*(id *)(*(void *)(a1 + 32) + 32) containsObject:v2])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412546;
        id v16 = v2;
        __int16 v17 = 2112;
        uint64_t v18 = v3;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[MobileAssetManager] Asset %@-%@ not present and failed to download", (uint8_t *)&v15, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v2];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v8 = VCPLogInstance();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          int v15 = 138412802;
          id v16 = v2;
          __int16 v17 = 2112;
          uint64_t v18 = v3;
          __int16 v19 = 2112;
          uint64_t v20 = v9;
          _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "[MobileAssetManager] Asset %@-%@ present at %@", (uint8_t *)&v15, 0x20u);
        }
      }
    }
    else
    {
      uint64_t v10 = [*(id *)(a1 + 32) retrieveAssetLocalURL:*(void *)(a1 + 64) petWatchDog:*(void *)(a1 + 40) cancelBlock:*(void *)(a1 + 48)];
      uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v14 = *(void *)(a1 + 32);
      if (v13) {
        [*(id *)(v14 + 24) setObject:v13 forKeyedSubscript:v2];
      }
      else {
        [*(id *)(v14 + 32) addObject:v2];
      }
    }
  }
}

- (int)purgeAllInstalledAssets
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  assetQueue = self->_assetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__VCPMobileAssetManager_purgeAllInstalledAssets__block_invoke;
  block[3] = &unk_1E629B028;
  void block[4] = &v6;
  dispatch_sync(assetQueue, block);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __48__VCPMobileAssetManager_purgeAllInstalledAssets__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v1 = dispatch_group_create();
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F77FB8]) initWithType:@"com.apple.MobileAsset.VCPMobileAssets"];
  [v2 returnTypes:2];
  if ([v2 queryMetaDataSync])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "[MobileAssetManager] Mobile asset query failed", buf, 2u);
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -18;
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    __int16 v19 = v2;
    uint64_t v4 = [v2 results];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v26;
      uint64_t v8 = v22;
      int v9 = &unk_1E629CD20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            id v12 = v1;
            uint64_t v13 = v8;
            uint64_t v14 = v7;
            int v15 = v9;
            id v16 = VCPLogInstance();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              [v11 attributes];
              v18 = __int16 v17 = v4;
              *(_DWORD *)buf = 138412290;
              v30 = v18;
              _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_INFO, "[MobileAssetManager] Requesting purge of asset attributes:%@", buf, 0xCu);

              uint64_t v4 = v17;
            }

            int v9 = v15;
            uint64_t v7 = v14;
            uint64_t v8 = v13;
            v1 = v12;
          }
          dispatch_group_enter(v1);
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v22[0] = __48__VCPMobileAssetManager_purgeAllInstalledAssets__block_invoke_621;
          v22[1] = v9;
          uint64_t v24 = *(void *)(a1 + 32);
          v23 = v1;
          [v11 purgeWithError:v21];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v6);
    }

    v2 = v19;
  }
  dispatch_group_wait(v1, 0xFFFFFFFFFFFFFFFFLL);
}

void __48__VCPMobileAssetManager_purgeAllInstalledAssets__block_invoke_621(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2 != (void *)3 && a2)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = [v5 description];
        int v9 = 138412546;
        uint64_t v10 = v8;
        __int16 v11 = 2048;
        id v12 = a2;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[MobileAssetManager] Failed to purge the asset with error: (%@) and result: (%ld)", (uint8_t *)&v9, 0x16u);
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -18;
  }
  else if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 134217984;
      uint64_t v10 = a2;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[MobileAssetManager] Asset purged successfully %ld", (uint8_t *)&v9, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsNotAvailable, 0);
  objc_storeStrong((id *)&self->_assetsURL, 0);
  objc_storeStrong((id *)&self->_retrieveAssetOnceQueue, 0);
  objc_storeStrong((id *)&self->_assetQueue, 0);
}

@end