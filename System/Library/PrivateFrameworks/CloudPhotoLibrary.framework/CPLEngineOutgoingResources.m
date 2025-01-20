@interface CPLEngineOutgoingResources
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)deleteResourcesToUploadWithUploadIdentifier:(id)a3 error:(id *)a4;
- (BOOL)openWithError:(id *)a3;
- (BOOL)shouldUploadResource:(id)a3;
- (BOOL)storeResourcesToUpload:(id)a3 withUploadIdentifier:(id)a4 shouldCheckResources:(BOOL)a5 error:(id *)a6;
- (id)resourceTypesToUploadForChange:(id)a3;
- (unint64_t)availableResourceSizeForUploadIdentifier:(id)a3;
- (unint64_t)countOfOriginalImages;
- (unint64_t)countOfOriginalOthers;
- (unint64_t)countOfOriginalVideos;
- (unint64_t)scopeType;
- (unint64_t)sizeOfOriginalResourcesToUpload;
- (unint64_t)sizeOfResourcesToUpload;
@end

@implementation CPLEngineOutgoingResources

- (unint64_t)sizeOfOriginalResourcesToUpload
{
  v2 = [(CPLEngineStorage *)self platformObject];
  unint64_t v3 = [v2 sizeOfOriginalResourcesToUpload];

  return v3;
}

- (unint64_t)sizeOfResourcesToUpload
{
  v2 = [(CPLEngineStorage *)self platformObject];
  unint64_t v3 = [v2 sizeOfResourcesToUpload];

  return v3;
}

- (BOOL)openWithError:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPLEngineOutgoingResources;
  return [(CPLEngineStorage *)&v4 openWithError:a3];
}

- (unint64_t)countOfOriginalOthers
{
  v2 = [(CPLEngineStorage *)self platformObject];
  unint64_t v3 = [v2 countOfOriginalOthers];

  return v3;
}

- (unint64_t)countOfOriginalVideos
{
  v2 = [(CPLEngineStorage *)self platformObject];
  unint64_t v3 = [v2 countOfOriginalVideos];

  return v3;
}

- (unint64_t)countOfOriginalImages
{
  v2 = [(CPLEngineStorage *)self platformObject];
  unint64_t v3 = [v2 countOfOriginalImages];

  return v3;
}

- (BOOL)shouldUploadResource:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 shouldUploadResource:v4];

  return v6;
}

- (unint64_t)availableResourceSizeForUploadIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  unint64_t v6 = [v5 availableResourceSizeForUploadIdentifier:v4];

  return v6;
}

- (id)resourceTypesToUploadForChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [v5 _pushContext];
  v7 = [v6 uploadIdentifier];

  if (!v7)
  {
    if (!_CPLSilentLogging)
    {
      v11 = __CPLStorageOSLogDomain_21571();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v5;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "%@ has no upload identifiers but has resources to upload", buf, 0xCu);
      }
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineOutgoingResources.m"];
    [v12 handleFailureInMethod:a2, self, v13, 98, @"%@ has no upload identifiers but has resources to upload", v5 object file lineNumber description];

    abort();
  }
  v8 = [(CPLEngineStorage *)self platformObject];
  v9 = [v8 resourceTypesToUploadForUploadIdentifier:v7];

  return v9;
}

- (BOOL)deleteResourcesToUploadWithUploadIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(CPLEngineStorage *)self engineStore];
  v8 = [v7 resourceStorage];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v9 = [(CPLEngineStorage *)self platformObject];
  v10 = [v9 resourcesToUploadForUploadIdentifier:v6];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (([v8 dropResourceForUpload:v15 error:a4] & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            v17 = __CPLStorageOSLogDomain_21571();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v24 = v15;
              _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "Failed to drop resource for upload: %@", buf, 0xCu);
            }
          }
          char v16 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  v10 = [(CPLEngineStorage *)self platformObject];
  char v16 = [v10 deleteResourcesToUploadWithUploadIdentifier:v6 error:a4];
LABEL_15:

  return v16;
}

- (BOOL)storeResourcesToUpload:(id)a3 withUploadIdentifier:(id)a4 shouldCheckResources:(BOOL)a5 error:(id *)a6
{
  BOOL v38 = a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v40 = self;
  uint64_t v12 = [(CPLEngineStorage *)self engineStore];
  uint64_t v13 = [v12 resourceStorage];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v10;
  uint64_t v14 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    SEL v37 = a2;
    uint64_t v16 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v19 = [v18 identity];
        uint64_t v20 = [v19 fingerPrint];
        if (!v20
          || (long long v21 = (void *)v20,
              [v19 fileUTI],
              long long v22 = objc_claimAutoreleasedReturnValue(),
              v22,
              v21,
              !v22))
        {
          if (!_CPLSilentLogging)
          {
            v34 = __CPLStorageOSLogDomain_21571();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v47 = v18;
              _os_log_impl(&dword_1B4CAC000, v34, OS_LOG_TYPE_ERROR, "Resource should be fully formed here: %@", buf, 0xCu);
            }
          }
          v35 = [MEMORY[0x1E4F28B00] currentHandler];
          v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineOutgoingResources.m"];
          [v35 handleFailureInMethod:v37, v40, v36, 46, @"Resource should be fully formed here: %@", v18 object file lineNumber description];

          abort();
        }
        v23 = [v19 fileURL];

        if (v23)
        {
          if (!_CPLSilentLogging)
          {
            uint64_t v24 = __CPLStorageOSLogDomain_21571();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v47 = v18;
              _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEBUG, "Storing for upload: %@", buf, 0xCu);
            }
          }
          v25 = [(CPLEngineStorage *)v40 platformObject];
          int v26 = [v25 storeResourceToUpload:v18 withUploadIdentifier:v11 error:a6];

          if (!v26) {
            goto LABEL_28;
          }
          char v27 = [v13 storeResourceForUpload:v18 shouldCheckResource:v38 error:a6];

          if ((v27 & 1) == 0) {
            goto LABEL_29;
          }
        }
        else
        {
          id v41 = 0;
          uint64_t v28 = [v13 storeResourceCopyForUpload:v18 error:&v41];
          id v29 = v41;
          v30 = v29;
          if (v28)
          {
            v31 = [(CPLEngineStorage *)v40 platformObject];
            int v32 = [v31 storeResourceToUpload:v18 withUploadIdentifier:v11 error:a6];

            if (!v32) {
              goto LABEL_30;
            }
          }
          else
          {
            if (![v29 isCPLErrorWithCode:27])
            {
              if (a6) {
                *a6 = v30;
              }

LABEL_28:
LABEL_29:
              LOBYTE(v32) = 0;
              goto LABEL_30;
            }
          }
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
      LOBYTE(v32) = 1;
      if (v15) {
        continue;
      }
      break;
    }
  }
  else
  {
    LOBYTE(v32) = 1;
  }
LABEL_30:

  return v32;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = [(CPLEngineStorage *)self platformObject];
  id v26 = 0;
  LODWORD(a4) = [v11 deleteRecordsForScopeIndex:a3 maxCount:a4 deletedCount:a5 discardedResources:&v26 error:a6];
  id v12 = v26;

  if (a4)
  {
    if ([v12 count])
    {
      uint64_t v13 = [(CPLEngineStorage *)self engineStore];
      uint64_t v14 = [v13 resourceStorage];

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v15 = v12;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v23 != v18) {
              objc_enumerationMutation(v15);
            }
            if (!objc_msgSend(v14, "dropResourceForUpload:error:", *(void *)(*((void *)&v22 + 1) + 8 * i), a6, (void)v22))
            {
              BOOL v20 = 0;
              goto LABEL_14;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
      BOOL v20 = 1;
LABEL_14:
    }
    else
    {
      BOOL v20 = 1;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (unint64_t)scopeType
{
  return 1;
}

@end