@interface PHAssetCreationRequestBridge
+ (id)buildAdjustmentsPlistPathForPhotoKitIngestJob:(id)a3 withSourcePath:(id)a4;
- (BOOL)_executeCreationRequestWithImageJobDict:(id)a3 error:(id *)a4;
- (BOOL)_executeCreationRequestWithVideoJobDict:(id)a3 error:(id *)a4;
- (BOOL)_finalizeBurstImage:(id)a3;
- (BOOL)_handleVideoPreviewImageOnlyJob:(id)a3 previewImageSurface:(__IOSurface *)a4 error:(id *)a5;
- (id)executeCreationRequestWithBatchJobDictionaries:(id)a3;
- (id)executeCreationRequestWithJobDict:(id)a3 previewImageSurface:(__IOSurface *)a4;
- (void)_deleteImageJobFilesWithJobDictionary:(id)a3;
- (void)_deleteJobFileAtPath:(id)a3 withJobDict:(id)a4;
@end

@implementation PHAssetCreationRequestBridge

- (void)_deleteJobFileAtPath:(id)a3 withJobDict:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = v7;
  if (v5)
  {
    id v13 = 0;
    char v9 = [v7 removeItemAtPath:v5 error:&v13];
    id v10 = v13;
    if ((v9 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
    {
      v11 = PLPhotoKitIngestGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8C8F0]];
        *(_DWORD *)buf = 138412802;
        id v15 = v5;
        __int16 v16 = 2112;
        v17 = v12;
        __int16 v18 = 2112;
        id v19 = v10;
        _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "PhotoKit Ingest Bridge: Failed to remove file at path: %@, for UUID:%@ %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v10 = 0;
  }
}

- (void)_deleteImageJobFilesWithJobDictionary:(id)a3
{
  id v13 = a3;
  uint64_t v4 = *MEMORY[0x1E4F8CA78];
  id v5 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F8CA78]];
  [(PHAssetCreationRequestBridge *)self _deleteJobFileAtPath:v5 withJobDict:v13];

  id v6 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F8C8D8]];
  [(PHAssetCreationRequestBridge *)self _deleteJobFileAtPath:v6 withJobDict:v13];

  v7 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F8CA18]];
  [(PHAssetCreationRequestBridge *)self _deleteJobFileAtPath:v7 withJobDict:v13];

  v8 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F8CA38]];
  [(PHAssetCreationRequestBridge *)self _deleteJobFileAtPath:v8 withJobDict:v13];

  char v9 = [v13 objectForKey:*MEMORY[0x1E4F8C8B0]];

  if (v9)
  {
    id v10 = [v13 objectForKeyedSubscript:v4];
    v11 = +[PHAssetCreationRequestBridge buildAdjustmentsPlistPathForPhotoKitIngestJob:v13 withSourcePath:v10];
    [(PHAssetCreationRequestBridge *)self _deleteJobFileAtPath:v11 withJobDict:v13];
  }
  v12 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F8CA30]];
  [(PHAssetCreationRequestBridge *)self _deleteJobFileAtPath:v12 withJobDict:v13];
}

- (BOOL)_finalizeBurstImage:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v4 = [MEMORY[0x1E4F8AA78] systemPhotoLibrary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__PHAssetCreationRequestBridge__finalizeBurstImage___block_invoke;
  v9[3] = &unk_1E5848318;
  id v5 = v3;
  id v10 = v5;
  id v6 = v4;
  id v11 = v6;
  v12 = &v13;
  [v6 performTransactionAndWait:v9];
  char v7 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __52__PHAssetCreationRequestBridge__finalizeBurstImage___block_invoke(uint64_t a1)
{
  id v22 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C918]];
  v2 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C888]];
  id v3 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C890]];
  uint64_t v4 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F8C898]];
  if ((unint64_t)[v2 count] >= 2)
  {
    id v5 = (void *)MEMORY[0x1E4F8A6B8];
    id v6 = [*(id *)(a1 + 40) managedObjectContext];
    v21 = [v5 assetsWithAvalancheUUID:v22 inManagedObjectContext:v6];

    uint64_t v20 = [MEMORY[0x1E4F8A950] assetsWithUUIDs:v3 options:3 inLibrary:*(void *)(a1 + 40)];
    id v19 = [MEMORY[0x1E4F8A950] assetWithUUID:v4 inLibrary:*(void *)(a1 + 40)];
    char v7 = (void *)MEMORY[0x1E4F8A6B8];
    v8 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v21];
    char v9 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v20];
    LOBYTE(v18) = 1;
    id v10 = (id)[v7 updatePropertiesForAssets:v8 autoPicks:v9 stackAsset:v19 userFavorites:0 deleteNonPicks:0 setFirstPick:1 allowDissolve:v18];

    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F8A6B8]) initWithUUID:v22 photoLibrary:*(void *)(a1 + 40)];
    v12 = [v11 stackAsset];
    [v12 generateLargeThumbnailFileIfNecessary];

    uint64_t v13 = (void *)MEMORY[0x1E4F8A6B8];
    v14 = [v11 assets];
    uint64_t v15 = [v11 autoPicks];
    char v16 = [v11 stackAsset];
    v17 = [v11 userFavorites];
    [v13 updateMembershipForAssets:v14 autoPicks:v15 stackAsset:v16 userFavorites:v17 deleteNonPicks:0 allowDissolve:1 inLibrary:*(void *)(a1 + 40)];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)_handleVideoPreviewImageOnlyJob:(id)a3 previewImageSurface:(__IOSurface *)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = PLPhotoKitIngestGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8C8F0]];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEFAULT, "PhotoKit Ingest Bridge: Beginning timelapse video placeholder job dictionary request creation for asset with UUID: %@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__16238;
  v39 = __Block_byref_object_dispose__16239;
  id v40 = 0;
  id v10 = +[PHPhotoLibrary sharedPhotoLibrary];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __90__PHAssetCreationRequestBridge__handleVideoPreviewImageOnlyJob_previewImageSurface_error___block_invoke;
  v21[3] = &unk_1E5844ED8;
  id v11 = v7;
  id v22 = v11;
  p_long long buf = &buf;
  v24 = &v26;
  v25 = a4;
  uint64_t v12 = *((void *)&buf + 1);
  id obj = *(id *)(*((void *)&buf + 1) + 40);
  int v13 = [v10 performChangesAndWait:v21 error:&obj];
  objc_storeStrong((id *)(v12 + 40), obj);
  if (v13 && *((unsigned char *)v27 + 24))
  {
    id v14 = *(id *)(*((void *)&buf + 1) + 40);
    BOOL v15 = 1;
  }
  else
  {
    char v16 = PLPhotoKitIngestGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F8C8F0]];
      int v18 = *((unsigned __int8 *)v27 + 24);
      *(_DWORD *)v30 = 138412802;
      v31 = v17;
      __int16 v32 = 1024;
      int v33 = v13;
      __int16 v34 = 1024;
      int v35 = v18;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "PhotoKit Ingest Bridge: Failed to perform performChangesAndWait block on previewImage creation request for asset %@ with success performing changes: %d and success creating request: %d", v30, 0x18u);
    }
    id v14 = *(id *)(*((void *)&buf + 1) + 40);
    if (a5)
    {
      id v14 = v14;
      BOOL v15 = 0;
      *a5 = v14;
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

void __90__PHAssetCreationRequestBridge__handleVideoPreviewImageOnlyJob_previewImageSurface_error___block_invoke(void *a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = +[PHAssetCreationRequest creationRequestForAssetFromVideoPreviewJobDict:a1[4] withPreviewImageSurface:a1[7]];
  if (v2)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *MEMORY[0x1E4F8C500];
    uint64_t v9 = *MEMORY[0x1E4F28228];
    v10[0] = @"Timelapse preview job creation request returned nil";
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v6 = [v3 errorWithDomain:v4 code:41005 userInfo:v5];
    uint64_t v7 = *(void *)(a1[5] + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (BOOL)_executeCreationRequestWithVideoJobDict:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = PLPhotoKitIngestGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v6 objectForKeyedSubscript:@"captureLogID"];
    uint64_t v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8C8F0]];
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEFAULT, "PhotoKit Ingest Bridge: %{public}@ Beginning video job dictionary request creation for asset with UUID: %{public}@", buf, 0x16u);
  }
  uint64_t v32 = 0;
  int v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v45 = __Block_byref_object_copy__16238;
  v46 = __Block_byref_object_dispose__16239;
  id v47 = 0;
  id v10 = +[PHPhotoLibrary sharedPhotoLibrary];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __78__PHAssetCreationRequestBridge__executeCreationRequestWithVideoJobDict_error___block_invoke;
  v28[3] = &unk_1E58485C8;
  id v11 = v6;
  id v29 = v11;
  v30 = buf;
  v31 = &v32;
  uint64_t v12 = *(void *)&buf[8];
  id obj = *(id *)(*(void *)&buf[8] + 40);
  int v13 = [v10 performChangesAndWait:v28 error:&obj];
  objc_storeStrong((id *)(v12 + 40), obj);
  if (v13 && *((unsigned char *)v33 + 24))
  {
    uint64_t v14 = *MEMORY[0x1E4F8CAE8];
    BOOL v15 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F8CAE8]];
    [(PHAssetCreationRequestBridge *)self _deleteJobFileAtPath:v15 withJobDict:v11];

    char v16 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F8CA38]];
    [(PHAssetCreationRequestBridge *)self _deleteJobFileAtPath:v16 withJobDict:v11];

    v17 = [v11 objectForKey:*MEMORY[0x1E4F8C8B0]];

    if (v17)
    {
      int v18 = [v11 objectForKeyedSubscript:v14];
      id v19 = +[PHAssetCreationRequestBridge buildAdjustmentsPlistPathForPhotoKitIngestJob:v11 withSourcePath:v18];
      [(PHAssetCreationRequestBridge *)self _deleteJobFileAtPath:v19 withJobDict:v11];
    }
    id v20 = *(id *)(*(void *)&buf[8] + 40);
    BOOL v21 = 1;
  }
  else
  {
    id v22 = PLPhotoKitIngestGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = [v11 objectForKeyedSubscript:@"captureLogID"];
      v24 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F8C8F0]];
      int v25 = *((unsigned __int8 *)v33 + 24);
      *(_DWORD *)v36 = 138544130;
      uint64_t v37 = v23;
      __int16 v38 = 2112;
      v39 = v24;
      __int16 v40 = 1024;
      int v41 = v13;
      __int16 v42 = 1024;
      int v43 = v25;
      _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_ERROR, "PhotoKit Ingest Bridge: %{public}@ Failed to perform performChangesAndWait block on video creation request for asset %@ with success performing changes: %d and success creating request: %d", v36, 0x22u);
    }
    id v20 = *(id *)(*(void *)&buf[8] + 40);
    if (a4)
    {
      id v20 = v20;
      BOOL v21 = 0;
      *a4 = v20;
    }
    else
    {
      BOOL v21 = 0;
    }
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v32, 8);

  return v21;
}

void __78__PHAssetCreationRequestBridge__executeCreationRequestWithVideoJobDict_error___block_invoke(void *a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = +[PHAssetCreationRequest creationRequestForAssetFromVideoJobDictionary:a1[4]];
  if (v2)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *MEMORY[0x1E4F8C500];
    uint64_t v9 = *MEMORY[0x1E4F28228];
    v10[0] = @"Video job creation request returned nil";
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v6 = [v3 errorWithDomain:v4 code:41005 userInfo:v5];
    uint64_t v7 = *(void *)(a1[5] + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (BOOL)_executeCreationRequestWithImageJobDict:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = PLPhotoKitIngestGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v6 objectForKeyedSubscript:@"captureLogID"];
    uint64_t v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8C8F0]];
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEFAULT, "PhotoKit Ingest Bridge: %{public}@ Beginning image job dictionary request creation for asset with UUID: %{public}@", buf, 0x16u);
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v39 = __Block_byref_object_copy__16238;
  __int16 v40 = __Block_byref_object_dispose__16239;
  id v41 = 0;
  id v10 = +[PHPhotoLibrary sharedPhotoLibrary];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __78__PHAssetCreationRequestBridge__executeCreationRequestWithImageJobDict_error___block_invoke;
  v22[3] = &unk_1E58485C8;
  id v11 = v6;
  id v23 = v11;
  v24 = buf;
  int v25 = &v26;
  uint64_t v12 = *(void *)&buf[8];
  id obj = *(id *)(*(void *)&buf[8] + 40);
  int v13 = [v10 performChangesAndWait:v22 error:&obj];
  objc_storeStrong((id *)(v12 + 40), obj);
  if (v13 && *((unsigned char *)v27 + 24))
  {
    [(PHAssetCreationRequestBridge *)self _deleteImageJobFilesWithJobDictionary:v11];
    id v14 = *(id *)(*(void *)&buf[8] + 40);
    BOOL v15 = 1;
  }
  else
  {
    char v16 = PLPhotoKitIngestGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = [v11 objectForKeyedSubscript:@"captureLogID"];
      int v18 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F8C8F0]];
      int v19 = *((unsigned __int8 *)v27 + 24);
      *(_DWORD *)v30 = 138544130;
      v31 = v17;
      __int16 v32 = 2114;
      int v33 = v18;
      __int16 v34 = 1024;
      int v35 = v13;
      __int16 v36 = 1024;
      int v37 = v19;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "PhotoKit Ingest Bridge: %{public}@ Failed to perform performChangesAndWait block on image creation request for asset %{public}@ with success performing changes: %d and success creating request: %d", v30, 0x22u);
    }
    id v14 = *(id *)(*(void *)&buf[8] + 40);
    if (a4)
    {
      id v14 = v14;
      BOOL v15 = 0;
      *a4 = v14;
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

void __78__PHAssetCreationRequestBridge__executeCreationRequestWithImageJobDict_error___block_invoke(void *a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = +[PHAssetCreationRequest creationRequestForAssetFromImageJobDictionary:a1[4] holdingDirectoryPath:0];
  if (v2)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *MEMORY[0x1E4F8C500];
    uint64_t v9 = *MEMORY[0x1E4F28228];
    v10[0] = @"Image job creation request returned nil";
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v6 = [v3 errorWithDomain:v4 code:41005 userInfo:v5];
    uint64_t v7 = *(void *)(a1[5] + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (id)executeCreationRequestWithJobDict:(id)a3 previewImageSurface:(__IOSurface *)a4
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F8C8F0];
  v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8C8F0]];
  if (v8)
  {
  }
  else
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8C888]];

    if (!v9)
    {
      int v37 = PLPhotoKitIngestGetLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        __int16 v38 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8C970]];
        *(_DWORD *)long long buf = 138543362;
        v59 = v38;
        _os_log_impl(&dword_19B043000, v37, OS_LOG_TYPE_ERROR, "PhotoKit Ingest Bridge: Asset UUID(s) for job %{public}@ nil.", buf, 0xCu);
      }
      v39 = (void *)MEMORY[0x1E4F8B9B8];
      __int16 v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F8C500];
      uint64_t v66 = *MEMORY[0x1E4F28228];
      v67[0] = @"The asset UUID(s) for job dictionaries cannot be nil";
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:&v66 count:1];
      int v25 = [v40 errorWithDomain:v41 code:41005 userInfo:v17];
      uint64_t v26 = [v39 failureWithError:v25];
      goto LABEL_27;
    }
  }
  uint64_t v10 = *MEMORY[0x1E4F8C970];
  id v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8C970]];
  if ([v11 isEqualToString:*MEMORY[0x1E4F8C9D8]])
  {

LABEL_7:
    v55 = 0;
    BOOL v14 = [(PHAssetCreationRequestBridge *)self _executeCreationRequestWithVideoJobDict:v6 error:&v55];
    BOOL v15 = v55;
    goto LABEL_8;
  }
  uint64_t v12 = [v6 objectForKeyedSubscript:v10];
  int v13 = [v12 isEqualToString:*MEMORY[0x1E4F8C9D0]];

  if (v13) {
    goto LABEL_7;
  }
  int v35 = [v6 objectForKeyedSubscript:v10];
  int v36 = [v35 isEqualToString:*MEMORY[0x1E4F8C9B8]];

  if (v36)
  {
    v54 = 0;
    BOOL v14 = [(PHAssetCreationRequestBridge *)self _executeCreationRequestWithImageJobDict:v6 error:&v54];
    BOOL v15 = v54;
    goto LABEL_8;
  }
  int v43 = [v6 objectForKeyedSubscript:v10];
  int v44 = [v43 isEqualToString:*MEMORY[0x1E4F8C980]];

  if ((v44 & 1) == 0)
  {
    v45 = [v6 objectForKeyedSubscript:v10];
    int v46 = [v45 isEqualToString:*MEMORY[0x1E4F8C9E0]];

    if (!v46)
    {
      v17 = [NSString stringWithFormat:@"Could not start processing the asset with job dictionary: %@", v6];
      uint64_t v48 = (void *)MEMORY[0x1E4F8B9B8];
      v49 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v50 = *MEMORY[0x1E4F8C500];
      uint64_t v56 = *MEMORY[0x1E4F28228];
      v57 = v17;
      v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      v52 = [v49 errorWithDomain:v50 code:41005 userInfo:v51];
      __int16 v34 = [v48 failureWithError:v52];

      goto LABEL_28;
    }
    if (!PLIsCamera())
    {
      v53 = 0;
      BOOL v14 = [(PHAssetCreationRequestBridge *)self _handleVideoPreviewImageOnlyJob:v6 previewImageSurface:a4 error:&v53];
      BOOL v15 = v53;
LABEL_8:
      id v16 = v15;
      v17 = v16;
      if (v14)
      {
LABEL_9:
        int v18 = PLPhotoKitIngestGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [v6 objectForKeyedSubscript:@"captureLogID"];
          id v20 = (void *)v19;
          if (v19) {
            BOOL v21 = (__CFString *)v19;
          }
          else {
            BOOL v21 = @"(unkown capture ID)";
          }
          id v22 = [v6 objectForKeyedSubscript:v10];
          id v23 = [v6 objectForKeyedSubscript:v7];
          *(_DWORD *)long long buf = 138543874;
          v59 = v21;
          __int16 v60 = 2114;
          id v61 = v22;
          __int16 v62 = 2114;
          v63 = v23;
          _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEFAULT, "PhotoKit Ingest Bridge: %{public}@ Successfully completed %{public}@ with UUID: %{public}@", buf, 0x20u);
        }
        v24 = (void *)MEMORY[0x1E4F8B9B8];
        int v25 = [MEMORY[0x1E4F1CA98] null];
        uint64_t v26 = [v24 successWithResult:v25];
LABEL_27:
        __int16 v34 = (void *)v26;

        goto LABEL_28;
      }
      if (v16) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    id v47 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B043000, v47, OS_LOG_TYPE_DEFAULT, "PhotoKit Ingest Bridge: Skipping Camera preview image job due to duplicate job from nebulad", buf, 2u);
    }

LABEL_39:
    v17 = 0;
    goto LABEL_9;
  }
  if ([(PHAssetCreationRequestBridge *)self _finalizeBurstImage:v6]) {
    goto LABEL_39;
  }
LABEL_16:
  v27 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v28 = *MEMORY[0x1E4F8C500];
  uint64_t v64 = *MEMORY[0x1E4F28228];
  v65 = @"Failure during creation of the asset.";
  char v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
  v17 = [v27 errorWithDomain:v28 code:41005 userInfo:v29];

LABEL_17:
  v30 = PLPhotoKitIngestGetLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    uint64_t v31 = [v6 objectForKeyedSubscript:@"captureLogID"];
    __int16 v32 = (void *)v31;
    int v33 = @"(unkown capture ID)";
    *(_DWORD *)long long buf = 138543874;
    if (v31) {
      int v33 = (__CFString *)v31;
    }
    v59 = v33;
    __int16 v60 = 2112;
    id v61 = v6;
    __int16 v62 = 2112;
    v63 = v17;
    _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_ERROR, "PhotoKit Ingest Bridge: %{public}@  Failed to create asset with job dictionary %@ \nError: %@", buf, 0x20u);
  }
  __int16 v34 = [MEMORY[0x1E4F8B9B8] failureWithError:v17];
LABEL_28:

  return v34;
}

- (id)executeCreationRequestWithBatchJobDictionaries:(id)a3
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    char v47 = 0;
    *(void *)__int16 v38 = 0;
    v39 = v38;
    uint64_t v40 = 0x3032000000;
    uint64_t v41 = __Block_byref_object_copy__16238;
    uint64_t v42 = __Block_byref_object_dispose__16239;
    id v43 = 0;
    id v5 = +[PHPhotoLibrary sharedPhotoLibrary];
    id v6 = [v4 objectAtIndexedSubscript:0];
    uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8C8C0]];

    v8 = PLPhotoKitIngestGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v50 = v7;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEFAULT, "PhotoKit Ingest Bridge: Beginning burst image creation requests with camera avalanche UUID: %{public}@", buf, 0xCu);
    }

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __79__PHAssetCreationRequestBridge_executeCreationRequestWithBatchJobDictionaries___block_invoke;
    v34[3] = &unk_1E58485C8;
    id v9 = v4;
    id v35 = v9;
    int v36 = v38;
    int v37 = &v44;
    uint64_t v10 = (id *)(v39 + 40);
    id obj = (id)*((void *)v39 + 5);
    int v11 = [v5 performChangesAndWait:v34 error:&obj];
    objc_storeStrong(v10, obj);
    if (*((unsigned char *)v45 + 24)) {
      int v12 = v11;
    }
    else {
      int v12 = 0;
    }
    int v13 = (void *)MEMORY[0x1E4F8B9B8];
    if (v12 == 1)
    {
      BOOL v14 = [MEMORY[0x1E4F1CA98] null];
      BOOL v15 = [v13 successWithResult:v14];
    }
    else
    {
      BOOL v15 = [MEMORY[0x1E4F8B9B8] failureWithError:*((void *)v39 + 5)];
    }
    if ([v15 isSuccess])
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v22 = v9;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v48 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v30 != v24) {
              objc_enumerationMutation(v22);
            }
            -[PHAssetCreationRequestBridge _deleteImageJobFilesWithJobDictionary:](self, "_deleteImageJobFilesWithJobDictionary:", *(void *)(*((void *)&v29 + 1) + 8 * i), (void)v29);
          }
          uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v48 count:16];
        }
        while (v23);
      }

      uint64_t v26 = PLPhotoKitIngestGetLog();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      *(_DWORD *)long long buf = 138543362;
      uint64_t v50 = v7;
      v27 = "PhotoKit Ingest Bridge: Successfully completed burst job with camera avalanche UUID: %{public}@";
    }
    else
    {
      uint64_t v26 = PLPhotoKitIngestGetLog();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:

        id v19 = v15;
        _Block_object_dispose(v38, 8);

        _Block_object_dispose(&v44, 8);
        BOOL v21 = v19;
        goto LABEL_27;
      }
      *(_DWORD *)long long buf = 138543362;
      uint64_t v50 = v7;
      v27 = "PhotoKit Ingest Bridge: Failed to complete burst job with camera avalanche UUID: %{public}@";
    }
    _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
    goto LABEL_26;
  }
  id v16 = PLPhotoKitIngestGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__int16 v38 = 0;
    _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "PhotoKit Ingest Bridge: No incoming jobs present.", v38, 2u);
  }

  v17 = (void *)MEMORY[0x1E4F8B9B8];
  int v18 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v51 = *MEMORY[0x1E4F28228];
  v52[0] = @"The batch of job dictionaries for a burst job must contain job dictionaries";
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
  id v20 = [v18 errorWithDomain:*MEMORY[0x1E4F8C500] code:41005 userInfo:v19];
  BOOL v21 = [v17 failureWithError:v20];

LABEL_27:

  return v21;
}

void __79__PHAssetCreationRequestBridge_executeCreationRequestWithBatchJobDictionaries___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    id v6 = 0;
    uint64_t v7 = *(void *)v23;
    uint64_t v21 = *MEMORY[0x1E4F8C500];
    uint64_t v20 = *MEMORY[0x1E4F28228];
    *(void *)&long long v4 = 138543618;
    long long v19 = v4;
    do
    {
      uint64_t v8 = 0;
      id v9 = v6;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v2);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
        id v6 = +[PHAssetCreationRequest creationRequestForAssetFromImageJobDictionary:holdingDirectoryPath:](PHAssetCreationRequest, "creationRequestForAssetFromImageJobDictionary:holdingDirectoryPath:", v10, 0, v19);

        if (v6)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        }
        else
        {
          int v11 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v30 = v20;
          long long v31 = @"Image job creation request returned nil";
          int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
          uint64_t v13 = [v11 errorWithDomain:v21 code:41005 userInfo:v12];
          uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
          BOOL v15 = *(void **)(v14 + 40);
          *(void *)(v14 + 40) = v13;

          id v16 = PLPhotoKitIngestGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = [v10 objectForKeyedSubscript:@"captureLogID"];
            uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            *(_DWORD *)long long buf = v19;
            v27 = v17;
            __int16 v28 = 2112;
            uint64_t v29 = v18;
            _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "PhotoKit Ingest Bridge: %{public}@ Burst creation request failed with error: %@", buf, 0x16u);
          }
        }
        ++v8;
        id v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v5);
  }
}

+ (id)buildAdjustmentsPlistPathForPhotoKitIngestJob:(id)a3 withSourcePath:(id)a4
{
  long long v4 = [MEMORY[0x1E4F1CB10] URLWithString:a4];
  uint64_t v5 = NSString;
  id v6 = [v4 pathExtension];
  uint64_t v7 = [v5 stringWithFormat:@".%@", v6];

  uint64_t v8 = [v4 URLByDeletingLastPathComponent];
  id v9 = [v8 absoluteString];
  uint64_t v10 = [v9 stringByReplacingOccurrencesOfString:@"file://" withString:&stru_1EEAC1950];

  int v11 = [v4 lastPathComponent];
  int v12 = [v11 stringByReplacingOccurrencesOfString:v7 withString:&stru_1EEAC1950];

  uint64_t v13 = [NSString stringWithFormat:@"%@%@_Adjustments.plist", v10, v12];

  return v13;
}

@end