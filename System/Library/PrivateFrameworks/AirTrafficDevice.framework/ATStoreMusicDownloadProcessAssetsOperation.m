@interface ATStoreMusicDownloadProcessAssetsOperation
- (void)_removeDRMFromDownloadedAssetWithCompletion:(id)a3;
- (void)cancel;
- (void)execute;
- (void)finishWithError:(id)a3 operationResult:(id)a4;
@end

@implementation ATStoreMusicDownloadProcessAssetsOperation

- (void).cxx_destruct
{
}

- (void)_removeDRMFromDownloadedAssetWithCompletion:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ATStoreDownloadProcessAssetsOperation *)self assetsOperationResult];
  v6 = [v5 storeMediaResponseItem];

  v24 = v6;
  v7 = [v6 downloadableAsset];
  v8 = [(ATStoreDownloadProcessAssetsOperation *)self assetsOperationResult];
  v9 = [v8 downloadFilePath];

  v10 = [v7 fairPlayInfoList];
  v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v29 + 1) + 8 * v16) responseSinfDictionary];
        [v11 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v14);
  }

  v18 = [(ATStoreDownloadProcessAssetsOperation *)self assetsOperationResult];
  if ([v18 isHLSDownload])
  {
  }
  else
  {
    uint64_t v19 = [v11 count];

    if (v19)
    {
      v20 = (void *)[objc_alloc(MEMORY[0x1E4FB86F8]) initWithFilePath:v9 sinfs:v11];
      v21 = [(ICRequestOperation *)self progress];
      v22 = [v20 progress];
      [v21 addChild:v22 withPendingUnitCount:50];

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __90__ATStoreMusicDownloadProcessAssetsOperation__removeDRMFromDownloadedAssetWithCompletion___block_invoke;
      v25[3] = &unk_1E6B88958;
      v25[4] = self;
      id v26 = v7;
      id v27 = v9;
      id v28 = v4;
      [v20 removeDRMWithCompletionHandler:v25];

      goto LABEL_15;
    }
  }
  v23 = _ATLogCategoryAssetUtils();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = self;
    _os_log_impl(&dword_1D9A2D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ skipping removing DRM from downloaded file", buf, 0xCu);
  }

  (*((void (**)(id, void *, void))v4 + 2))(v4, v9, 0);
LABEL_15:
}

void __90__ATStoreMusicDownloadProcessAssetsOperation__removeDRMFromDownloadedAssetWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = _ATLogCategoryAssetUtils();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v8;
    __int16 v28 = 2114;
    id v29 = v6;
    _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ removing DRM completed. err=%{public}@", buf, 0x16u);
  }

  id v9 = v6;
  if (v5)
  {
    id v10 = v5;
  }
  else
  {
    id v10 = [*(id *)(a1 + 40) fileExtension];
  }
  v11 = v10;
  if (v9)
  {
    id v12 = 0;
    id v13 = v9;
  }
  else
  {
    id v12 = *(id *)(a1 + 48);
    uint64_t v14 = [*(id *)(a1 + 48) pathExtension];
    uint64_t v15 = v14;
    if (!v11 || v14 && ([v14 isEqualToString:v11] & 1) != 0)
    {
      id v13 = 0;
    }
    else
    {
      uint64_t v16 = [*(id *)(a1 + 48) stringByDeletingPathExtension];
      uint64_t v17 = [v16 stringByAppendingPathExtension:v11];

      v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v19 = *(void *)(a1 + 48);
      id v25 = 0;
      char v20 = [v18 moveItemAtPath:v19 toPath:v17 error:&v25];
      id v13 = v25;

      if (v20)
      {
        v21 = (void *)v17;
        uint64_t v17 = 0;
      }
      else
      {
        v22 = _ATLogCategoryAssetUtils();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = *(void *)(a1 + 32);
          v24 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138544130;
          uint64_t v27 = v23;
          __int16 v28 = 2114;
          id v29 = v24;
          __int16 v30 = 2114;
          uint64_t v31 = v17;
          __int16 v32 = 2114;
          id v33 = v13;
          _os_log_impl(&dword_1D9A2D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to rename downloaded file from %{public}@ --> %{public}@. err=%{public}@", buf, 0x2Au);
        }

        v21 = v13;
        id v13 = 0;
      }

      id v12 = (id)v17;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)finishWithError:(id)a3 operationResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v8;
  if (!v8)
  {
    if ([(ATStoreMusicDownloadProcessAssetsOperation *)self isCancelled])
    {
      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
    }
    else
    {
      id v9 = 0;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)ATStoreMusicDownloadProcessAssetsOperation;
  [(ATStoreDownloadOperation *)&v11 finishWithError:v9 operationResult:v7];
  downloadDoneRequest = self->_downloadDoneRequest;
  self->_downloadDoneRequest = 0;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)ATStoreMusicDownloadProcessAssetsOperation;
  [(ATStoreMusicDownloadProcessAssetsOperation *)&v3 cancel];
  [(ICSongDownloadDoneRequest *)self->_downloadDoneRequest cancel];
}

- (void)execute
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(ATStoreMusicDownloadProcessAssetsOperation *)self isCancelled])
  {
    id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
    -[ATStoreMusicDownloadProcessAssetsOperation finishWithError:operationResult:](self, "finishWithError:operationResult:");
  }
  else
  {
    objc_super v3 = [(ATStoreDownloadOperation *)self asset];
    id v4 = [(ATStoreDownloadProcessAssetsOperation *)self assetsOperationResult];
    id v5 = [v4 requestContext];

    id v6 = [(ATStoreDownloadProcessAssetsOperation *)self assetsOperationResult];
    id v7 = [v6 storeMediaResponseItem];

    id v8 = [v7 downloadableAsset];
    id v9 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      __int16 v25 = 2114;
      id v26 = v3;
      _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ starting process assets phase for asset %{public}@", buf, 0x16u);
    }

    id v10 = [(ATStoreDownloadProcessAssetsOperation *)self assetsOperationResult];
    char v11 = [v10 isHLSDownload];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__ATStoreMusicDownloadProcessAssetsOperation_execute__block_invoke;
    v17[3] = &unk_1E6B88930;
    v17[4] = self;
    id v18 = v3;
    char v22 = v11;
    id v19 = v8;
    id v20 = v7;
    id v21 = v5;
    id v12 = v5;
    id v13 = v7;
    id v14 = v8;
    id v15 = v3;
    [(ATStoreMusicDownloadProcessAssetsOperation *)self _removeDRMFromDownloadedAssetWithCompletion:v17];
  }
}

void __53__ATStoreMusicDownloadProcessAssetsOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6
    || [*(id *)(a1 + 32) isCancelled]
    && ([MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0],
        (id v7 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    [*(id *)(a1 + 32) finishWithError:v7 operationResult:0];
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) storeInfo];
    id v9 = [v8 endpointType];
    uint64_t v10 = [v9 integerValue];

    if (*(unsigned char *)(a1 + 72))
    {
      char v11 = [*(id *)(a1 + 40) assetType];
      char v12 = [v11 isEqualToString:@"Music"];
    }
    else
    {
      char v12 = 0;
    }
    uint64_t v13 = 2;
    if (v10 != 3 && (v12 & 1) == 0)
    {
      if (*(unsigned char *)(a1 + 72))
      {
        uint64_t v13 = 1;
      }
      else
      {
        id v14 = [*(id *)(a1 + 48) fairPlayInfoList];
        if ([v14 count])
        {
          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v87 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v61;
            while (2)
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v61 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v20 = [*(id *)(*((void *)&v60 + 1) + 8 * i) dpInfoData];

                if (v20)
                {
                  uint64_t v13 = 0;
                  goto LABEL_23;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v60 objects:v87 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }
          uint64_t v13 = 1;
LABEL_23:
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
    }
    [*(id *)(a1 + 40) setProtectionType:v13];
    id v21 = [v5 pathExtension];
    char v22 = [*(id *)(a1 + 40) identifier];
    uint64_t v23 = [v22 stringByAppendingPathExtension:v21];

    v24 = [MEMORY[0x1E4F79AF8] pathForBaseLocationPath:250];
    __int16 v25 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v25 createDirectoryAtPath:v24 withIntermediateDirectories:1 attributes:0 error:0];

    v55 = (void *)v23;
    id v26 = [v24 stringByAppendingPathComponent:v23];
    uint64_t v27 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v27 removeItemAtPath:v26 error:0];

    __int16 v28 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = *(void *)(a1 + 32);
      buf.st_dev = 138543874;
      *(void *)&buf.int st_mode = v29;
      WORD2(buf.st_ino) = 2114;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v5;
      HIWORD(buf.st_gid) = 2114;
      *(void *)&buf.st_rdev = v26;
      _os_log_impl(&dword_1D9A2D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ moving downloaded file from %{public}@ --> %{public}@", (uint8_t *)&buf, 0x20u);
    }

    __int16 v30 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v59 = 0;
    char v31 = [v30 moveItemAtPath:v5 toPath:v26 error:&v59];
    id v7 = v59;

    if (v31)
    {
      v54 = v21;
      __int16 v32 = objc_alloc_init(ATStoreDownloadOperationResult);
      [(ATStoreDownloadOperationResult *)v32 setStoreMediaResponseItem:*(void *)(a1 + 56)];
      [(ATStoreDownloadOperationResult *)v32 setRequestContext:*(void *)(a1 + 64)];
      [(ATStoreDownloadOperationResult *)v32 setDownloadFilePath:v26];
      id v33 = [*(id *)(a1 + 32) assetsOperationResult];
      uint64_t v34 = [v33 assetClientParams];
      [(ATStoreDownloadOperationResult *)v32 setAssetClientParams:v34];

      v35 = [*(id *)(a1 + 56) downloadIdentifier];

      if (v35)
      {
        id v36 = objc_alloc(MEMORY[0x1E4FB8718]);
        uint64_t v37 = *(void *)(a1 + 64);
        v38 = [*(id *)(a1 + 56) downloadIdentifier];
        uint64_t v39 = objc_msgSend(v36, "initWithRequestContext:downloadIdentifier:songID:", v37, v38, objc_msgSend(*(id *)(a1 + 56), "storeAdamID"));
        uint64_t v40 = *(void *)(a1 + 32);
        v41 = *(void **)(v40 + 328);
        *(void *)(v40 + 328) = v39;

        v42 = [*(id *)(a1 + 32) progress];
        v43 = [*(id *)(*(void *)(a1 + 32) + 328) progress];
        [v42 addChild:v43 withPendingUnitCount:50];

        uint64_t v44 = *(void *)(a1 + 32);
        v45 = *(void **)(v44 + 328);
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __53__ATStoreMusicDownloadProcessAssetsOperation_execute__block_invoke_109;
        v56[3] = &unk_1E6B88BE0;
        v56[4] = v44;
        __int16 v32 = v32;
        v57 = v32;
        [v45 performRequestWithResponseHandler:v56];
      }
      else
      {
        [*(id *)(a1 + 32) finishWithError:v7 operationResult:v32];
      }
      id v21 = v54;
    }
    else
    {
      v46 = _ATLogCategoryStoreDownloads();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        uint64_t v47 = *(void *)(a1 + 32);
        buf.st_dev = 138543618;
        *(void *)&buf.int st_mode = v47;
        WORD2(buf.st_ino) = 2114;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v7;
        _os_log_impl(&dword_1D9A2D000, v46, OS_LOG_TYPE_ERROR, "%{public}@ failed to rename downloaded file. err=%{public}@", (uint8_t *)&buf, 0x16u);
      }

      v48 = objc_msgSend(v7, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x1E4F281F8], 513);

      if (v48)
      {
        v53 = v21;
        memset(&buf, 0, sizeof(buf));
        id v49 = v5;
        stat((const char *)[v49 UTF8String], &buf);
        memset(&v58, 0, sizeof(v58));
        id v50 = v24;
        stat((const char *)[v50 UTF8String], &v58);
        v51 = _ATLogCategoryStoreDownloads();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          uint64_t v52 = *(void *)(a1 + 32);
          *(_DWORD *)v64 = 138545922;
          uint64_t v65 = v52;
          __int16 v66 = 2112;
          id v67 = v49;
          __int16 v68 = 2048;
          __darwin_ino64_t st_ino = buf.st_ino;
          __int16 v70 = 1024;
          int st_mode = buf.st_mode;
          __int16 v72 = 1024;
          uid_t st_uid = buf.st_uid;
          __int16 v74 = 1024;
          gid_t st_gid = buf.st_gid;
          __int16 v76 = 2112;
          id v77 = v50;
          __int16 v78 = 2048;
          __darwin_ino64_t v79 = v58.st_ino;
          __int16 v80 = 1024;
          int v81 = v58.st_mode;
          __int16 v82 = 1024;
          uid_t v83 = v58.st_uid;
          __int16 v84 = 1024;
          gid_t v85 = v58.st_gid;
          _os_log_impl(&dword_1D9A2D000, v51, OS_LOG_TYPE_ERROR, "%{public}@ Permission Denied moving file at path %@ (ino_t=%llu mode_t=%hu uid_t=%u gid_t=%u) to directory %@ (ino_t=%llu mode_t=%hu uid_t=%u gid_t=%u)", v64, 0x58u);
        }

        id v21 = v53;
      }
      objc_msgSend(*(id *)(a1 + 32), "finishWithError:operationResult:", v7, 0, v53);
      __int16 v32 = [MEMORY[0x1E4F28CB8] defaultManager];
      [(ATStoreDownloadOperationResult *)v32 removeItemAtPath:v5 error:0];
    }
  }
}

uint64_t __53__ATStoreMusicDownloadProcessAssetsOperation_execute__block_invoke_109(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2 operationResult:*(void *)(a1 + 40)];
}

@end