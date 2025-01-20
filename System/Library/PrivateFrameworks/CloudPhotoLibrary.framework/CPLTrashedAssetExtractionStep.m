@interface CPLTrashedAssetExtractionStep
- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)a4 maximumResourceSize:(unint64_t)a5 error:(id *)a6;
- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3;
- (CPLTrashedAssetExtractionStep)initWithStorage:(id)a3 scopeIdentifier:(id)a4 maximumCount:(unint64_t)a5;
- (id)shortDescription;
- (unint64_t)maximumCount;
@end

@implementation CPLTrashedAssetExtractionStep

- (unint64_t)maximumCount
{
  return self->_maximumCount;
}

- (id)shortDescription
{
  return @"Trashed(Asset)";
}

- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 isAssetChange] && (objc_msgSend(v3, "inTrash") & 1) != 0;

  return v4;
}

- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)a4 maximumResourceSize:(unint64_t)a5 error:(id *)a6
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x2020000000;
  char v67 = 1;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__13065;
  v62 = __Block_byref_object_dispose__13066;
  id v63 = 0;
  unint64_t maximumCount = self->_maximumCount;
  if (maximumCount >= a4) {
    unint64_t maximumCount = a4;
  }
  unint64_t v38 = maximumCount;
  v36 = self;
  v11 = [(CPLBatchExtractionStep *)self storage];
  uint64_t v12 = objc_opt_class();
  v13 = [(CPLBatchExtractionStep *)self scopeIdentifier];
  v14 = [v11 allChangesWithClass:v12 scopeIdentifier:v13 trashed:1];

  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v53[3] = a5;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __87__CPLTrashedAssetExtractionStep_extractToBatch_maximumCount_maximumResourceSize_error___block_invoke;
  v45[3] = &unk_1E60A8D98;
  id v39 = v11;
  id v46 = v39;
  v48 = v53;
  id v15 = v9;
  id v47 = v15;
  v49 = &v54;
  v50 = &v64;
  v51 = &v58;
  unint64_t v52 = v38;
  v16 = (void (**)(void, void *, void *))MEMORY[0x1BA994060](v45);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v14;
  uint64_t v17 = [obj countByEnumeratingWithState:&v41 objects:v70 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v42;
    v19 = v16 + 2;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v22 = (void *)MEMORY[0x1BA993DF0]();
        if ([v21 isFullRecord])
        {
          v23 = [v21 masterScopedIdentifier];
          if (!v23)
          {
            if (!_CPLSilentLogging)
            {
              v32 = __CPLGenericOSLogDomain();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v69 = v21;
                _os_log_impl(&dword_1B4CAC000, v32, OS_LOG_TYPE_ERROR, "%@ should have a master identifier", buf, 0xCu);
              }
            }
            v33 = [MEMORY[0x1E4F28B00] currentHandler];
            v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLBatchExtractionStep.m"];
            [v33 handleFailureInMethod:a2, v36, v34, 635, @"%@ should have a master identifier", v21 object file lineNumber description];

            abort();
          }
          v24 = [v39 changeWithScopedIdentifier:v23];
          v25 = v24;
          if (v24)
          {
            int v26 = [v24 isFullRecord];
            v27 = *v19;
            if (v26)
            {
              v27(v16, v21, v25);
LABEL_16:

              goto LABEL_17;
            }
          }
          else
          {
            v27 = *v19;
          }
          v27(v16, v21, 0);
          goto LABEL_16;
        }
        v16[2](v16, v21, 0);
LABEL_17:
        BOOL v28 = ([v15 isFull] & 1) == 0 && *((unsigned char *)v65 + 24) && v55[3] < v38;
        if (!v28) {
          goto LABEL_24;
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v41 objects:v70 count:16];
    }
    while (v17);
  }
LABEL_24:

  if (*((unsigned char *)v65 + 24) && (v55[3] || [v15 batchCanLowerQuota])) {
    [v15 setFull:1];
  }
  int v29 = *((unsigned __int8 *)v65 + 24);
  if (a6 && !*((unsigned char *)v65 + 24))
  {
    *a6 = (id) v59[5];
    int v29 = *((unsigned __int8 *)v65 + 24);
  }
  BOOL v30 = v29 != 0;

  _Block_object_dispose(v53, 8);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

  return v30;
}

void __87__CPLTrashedAssetExtractionStep_extractToBatch_maximumCount_maximumResourceSize_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [v5 effectiveResourceSizeToUploadUsingStorage:*(void *)(a1 + 32)];
  if (v6) {
    v7 += [v6 effectiveResourceSizeToUploadUsingStorage:*(void *)(a1 + 32)];
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v9 = *(void *)(v8 + 24);
  if (v7 > v9)
  {
    v10 = [*(id *)(a1 + 40) batch];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      uint64_t v12 = *(void **)(a1 + 40);
LABEL_11:
      [v12 setFull:1];
      goto LABEL_15;
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    unint64_t v9 = *(void *)(v8 + 24);
  }
  BOOL v13 = v9 >= v7;
  unint64_t v14 = v9 - v7;
  if (!v13) {
    unint64_t v14 = 0;
  }
  *(void *)(v8 + 24) = v14;
  if (v6)
  {
    uint64_t v12 = *(void **)(a1 + 40);
    if ((unint64_t)(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + 2) > *(void *)(a1 + 80)) {
      goto LABEL_11;
    }
    [v12 addChange:v6 fromStorage:*(void *)(a1 + 32)];
    id v15 = *(void **)(a1 + 32);
    uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
    id obj = *(id *)(v16 + 40);
    char v17 = [v15 removeChange:v6 error:&obj];
    objc_storeStrong((id *)(v16 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v17;
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    [*(id *)(a1 + 40) addChange:v5 fromStorage:*(void *)(a1 + 32)];
    uint64_t v18 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8);
    id v21 = *(id *)(v19 + 40);
    char v20 = [v18 removeChange:v5 error:&v21];
    objc_storeStrong((id *)(v19 + 40), v21);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v20;
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
LABEL_15:
}

- (CPLTrashedAssetExtractionStep)initWithStorage:(id)a3 scopeIdentifier:(id)a4 maximumCount:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CPLTrashedAssetExtractionStep;
  uint64_t v11 = [(CPLBatchExtractionStep *)&v18 initWithStorage:v9 scopeIdentifier:v10];
  uint64_t v12 = v11;
  if (v11)
  {
    if (a5 <= 1)
    {
      if (!_CPLSilentLogging)
      {
        unint64_t v14 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)char v17 = 0;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Can't extract masters with no room for assets", v17, 2u);
        }
      }
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLBatchExtractionStep.m"];
      [v15 handleFailureInMethod:a2 object:v12 file:v16 lineNumber:577 description:@"Can't extract masters with no room for assets"];

      abort();
    }
    v11->_unint64_t maximumCount = a5;
  }

  return v12;
}

@end