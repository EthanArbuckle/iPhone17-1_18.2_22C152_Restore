@interface CPLNewAssetExtractionStep
- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)maximumCount maximumResourceSize:(unint64_t)a5 error:(id *)a6;
- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3;
- (CPLNewAssetExtractionStep)initWithStorage:(id)a3 scopeIdentifier:(id)a4 maximumCount:(unint64_t)a5;
- (id)shortDescription;
- (unint64_t)maximumCount;
- (void)reset;
@end

@implementation CPLNewAssetExtractionStep

- (void).cxx_destruct
{
}

- (unint64_t)maximumCount
{
  return self->_maximumCount;
}

- (id)shortDescription
{
  return @"New(Asset)";
}

- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 isAssetChange] && (objc_msgSend(v3, "isFullRecord") & 1) != 0;

  return v4;
}

- (void)reset
{
}

- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)maximumCount maximumResourceSize:(unint64_t)a5 error:(id *)a6
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v70 = a3;
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x2020000000;
  char v118 = 1;
  uint64_t v109 = 0;
  v110 = &v109;
  uint64_t v111 = 0x3032000000;
  v112 = __Block_byref_object_copy__13065;
  v113 = __Block_byref_object_dispose__13066;
  id v114 = 0;
  if (self->_maximumCount < maximumCount) {
    maximumCount = self->_maximumCount;
  }
  v68 = self;
  v9 = [(CPLBatchExtractionStep *)self storage];
  unint64_t v71 = maximumCount;
  SEL v59 = a2;
  uint64_t v10 = objc_opt_class();
  v11 = [(CPLBatchExtractionStep *)self scopeIdentifier];
  v12 = [v9 allChangesWithClass:v10 scopeIdentifier:v11 changeType:0];
  v66 = v9;

  id v75 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v105 objects:v121 count:16];
  if (v13)
  {
    uint64_t v72 = *(void *)v106;
    do
    {
      uint64_t v14 = 0;
      uint64_t v73 = v13;
      do
      {
        if (*(void *)v106 != v72) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v105 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1BA993DF0]();
        v17 = [v15 scopedIdentifier];
        if (([v75 containsObject:v17] & 1) == 0)
        {
          [v75 addObject:v17];
          uint64_t v19 = [v15 masterScopedIdentifier];
          v74 = (void *)v19;
          if (v19)
          {
            if ([(NSMutableSet *)v68->_alreadySeenMasterScopedIdentifiers containsObject:v19])
            {
              v20 = 0;
            }
            else
            {
              v20 = [v66 changeWithScopedIdentifier:v19];
            }
            [(NSMutableSet *)v68->_alreadySeenMasterScopedIdentifiers addObject:v19];
            if (v20 && ([v20 isFullRecord] & 1) != 0)
            {
              uint64_t v100 = 0;
              v101 = &v100;
              uint64_t v102 = 0x2020000000;
              uint64_t v103 = 0;
              uint64_t v103 = [v20 effectiveResourceSizeToUploadUsingStorage:v66];
              if (v71 == 1)
              {
                [(NSMutableSet *)v68->_alreadySeenMasterScopedIdentifiers removeObject:v19];
                [v70 setFull:1];
                int v18 = 2;
                unint64_t v71 = 1;
              }
              else
              {
                v64 = v20;
                uint64_t v96 = 0;
                v97 = &v96;
                uint64_t v98 = 0x2020000000;
                uint64_t v99 = 0;
                id v21 = objc_alloc(MEMORY[0x1E4F1CA48]);
                if (v71 - 1 >= 0x64) {
                  uint64_t v22 = 100;
                }
                else {
                  uint64_t v22 = v71 - 1;
                }
                v23 = (void *)[v21 initWithCapacity:v22];
                v87[0] = MEMORY[0x1E4F143A8];
                v87[1] = 3221225472;
                v87[2] = __83__CPLNewAssetExtractionStep_extractToBatch_maximumCount_maximumResourceSize_error___block_invoke;
                v87[3] = &unk_1E60A8D70;
                v91 = &v109;
                v92 = &v115;
                id v88 = v75;
                id v62 = v23;
                id v89 = v62;
                v93 = &v100;
                id v65 = v66;
                id v90 = v65;
                v94 = &v96;
                unint64_t v95 = v71 - 1;
                unint64_t v63 = v71 - 1;
                v69 = (uint64_t (**)(void, void, void))MEMORY[0x1BA994060](v87);
                int v24 = ((uint64_t (**)(void, void *, void *))v69)[2](v69, v17, v15);
                unint64_t v25 = v71 - 1;
                v26 = v20;
                if (v24)
                {
                  long long v85 = 0u;
                  long long v86 = 0u;
                  long long v83 = 0u;
                  long long v84 = 0u;
                  v27 = [v65 allChangesWithClass:objc_opt_class() relatedScopedIdentifier:v74];
                  uint64_t v28 = [v27 countByEnumeratingWithState:&v83 objects:v120 count:16];
                  if (v28)
                  {
                    uint64_t v29 = *(void *)v84;
                    while (2)
                    {
                      for (uint64_t i = 0; i != v28; ++i)
                      {
                        if (*(void *)v84 != v29) {
                          objc_enumerationMutation(v27);
                        }
                        v31 = *(void **)(*((void *)&v83 + 1) + 8 * i);
                        v32 = [v31 scopedIdentifier];
                        if (([v32 isEqual:v17] & 1) == 0
                          && (((uint64_t (**)(void, void *, void *))v69)[2](v69, v32, v31) & 1) == 0)
                        {

                          goto LABEL_40;
                        }
                      }
                      uint64_t v28 = [v27 countByEnumeratingWithState:&v83 objects:v120 count:16];
                      if (v28) {
                        continue;
                      }
                      break;
                    }
                  }
LABEL_40:

                  unint64_t v25 = v71 - 1;
                  v26 = v64;
                }
                if (!*((unsigned char *)v116 + 24)) {
                  goto LABEL_66;
                }
                if (v97[3] <= v25) {
                  goto LABEL_45;
                }
                v35 = [v70 batch];
                BOOL v36 = [v35 count] == 0;

                if (!v36)
                {
LABEL_47:
                  [(NSMutableSet *)v68->_alreadySeenMasterScopedIdentifiers removeObject:v74];
                  [v70 setFull:1];
                  goto LABEL_66;
                }
                [v62 removeLastObject];
                v26 = v64;
LABEL_45:
                unint64_t v37 = v101[3];
                unint64_t v38 = a5;
                if (v37 > a5)
                {
                  v39 = [v70 batch];
                  BOOL v40 = [v39 count] == 0;

                  if (!v40) {
                    goto LABEL_47;
                  }
                  unint64_t v37 = v101[3];
                  unint64_t v38 = a5;
                  v26 = v64;
                }
                BOOL v41 = v38 >= v37;
                unint64_t v42 = v38 - v37;
                if (!v41) {
                  unint64_t v42 = 0;
                }
                a5 = v42;
                [v70 addChange:v26 fromStorage:v65];
                v43 = (id *)(v110 + 5);
                id v82 = (id)v110[5];
                int v44 = [v65 removeChange:v26 error:&v82];
                objc_storeStrong(v43, v82);
                *((unsigned char *)v116 + 24) = v44;
                if (!v44) {
                  goto LABEL_66;
                }
                long long v80 = 0u;
                long long v81 = 0u;
                long long v78 = 0u;
                long long v79 = 0u;
                id v45 = v62;
                uint64_t v46 = [v45 countByEnumeratingWithState:&v78 objects:v119 count:16];
                if (v46)
                {
                  uint64_t v47 = *(void *)v79;
LABEL_54:
                  uint64_t v48 = 0;
                  while (1)
                  {
                    if (*(void *)v79 != v47) {
                      objc_enumerationMutation(v45);
                    }
                    uint64_t v49 = *(void *)(*((void *)&v78 + 1) + 8 * v48);
                    [v70 addChange:v49 fromStorage:v65];
                    v50 = (id *)(v110 + 5);
                    id v77 = (id)v110[5];
                    LOBYTE(v49) = [v65 removeChange:v49 error:&v77];
                    objc_storeStrong(v50, v77);
                    *((unsigned char *)v116 + 24) = v49;
                    if ((v49 & 1) == 0) {
                      break;
                    }
                    if (v46 == ++v48)
                    {
                      uint64_t v46 = [v45 countByEnumeratingWithState:&v78 objects:v119 count:16];
                      if (v46) {
                        goto LABEL_54;
                      }
                      break;
                    }
                  }
                }

                if (*((unsigned char *)v116 + 24))
                {
                  if (v97[3] >= v63 || a5 >> 11 <= 4)
                  {
                    [v70 setFull:1];
                    goto LABEL_66;
                  }
                  uint64_t v52 = [v45 count];
                  unint64_t v71 = v63 - v52;
                  if (v63 == v52)
                  {
                    if (!_CPLSilentLogging)
                    {
                      v56 = __CPLGenericOSLogDomain();
                      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1B4CAC000, v56, OS_LOG_TYPE_ERROR, "Batch should have at least one place left", buf, 2u);
                      }
                    }
                    v57 = [MEMORY[0x1E4F28B00] currentHandler];
                    v58 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLBatchExtractionStep.m"];
                    [v57 handleFailureInMethod:v59 object:v68 file:v58 lineNumber:543 description:@"Batch should have at least one place left"];

                    abort();
                  }
                  int v18 = 0;
                }
                else
                {
LABEL_66:
                  int v18 = 2;
                }

                _Block_object_dispose(&v96, 8);
                v20 = v64;
              }
              _Block_object_dispose(&v100, 8);
LABEL_69:

              goto LABEL_70;
            }
          }
          else
          {
            v20 = 0;
          }
          [v70 addChange:v15 fromStorage:v66];
          v33 = (id *)(v110 + 5);
          id v104 = (id)v110[5];
          int v34 = [v66 removeChange:v15 error:&v104];
          objc_storeStrong(v33, v104);
          *((unsigned char *)v116 + 24) = v34;
          if (v34)
          {
            if (v71 != 1)
            {
              --v71;
              int v18 = 3;
              goto LABEL_69;
            }
            [v70 setFull:1];
            unint64_t v71 = 0;
          }
          else
          {
            --v71;
          }
          int v18 = 2;
          goto LABEL_69;
        }
        int v18 = 3;
LABEL_70:

        if (v18 != 3 && v18) {
          goto LABEL_77;
        }
        ++v14;
      }
      while (v14 != v73);
      uint64_t v13 = [obj countByEnumeratingWithState:&v105 objects:v121 count:16];
    }
    while (v13);
  }
LABEL_77:

  int v53 = *((unsigned __int8 *)v116 + 24);
  if (a6 && !*((unsigned char *)v116 + 24))
  {
    *a6 = (id) v110[5];
    int v53 = *((unsigned __int8 *)v116 + 24);
  }
  BOOL v54 = v53 != 0;

  _Block_object_dispose(&v109, 8);
  _Block_object_dispose(&v115, 8);

  return v54;
}

BOOL __83__CPLNewAssetExtractionStep_extractToBatch_maximumCount_maximumResourceSize_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 isDelete])
  {
    BOOL v5 = 1;
  }
  else
  {
    if ([v4 isFullRecord] & 1) != 0 || (objc_msgSend(v4, "hasChangeType:", 2))
    {
      v6 = [v4 scopedIdentifier];
      [*(id *)(a1 + 32) addObject:v6];
      [*(id *)(a1 + 40) addObject:v4];
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += [v4 effectiveResourceSizeToUploadUsingStorage:*(void *)(a1 + 48)];
      BOOL v5 = ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) <= *(void *)(a1 + 88);
    }
    else
    {
      id v7 = [NSString alloc];
      v8 = +[CPLRecordChange descriptionForChangeType:](CPLRecordChange, "descriptionForChangeType:", [v4 changeType]);
      v6 = (void *)[v7 initWithFormat:@"Update to an asset (%@) instead of add while its master is new", v8];

      uint64_t v9 = +[CPLErrors invalidClientCacheErrorWithReason:v6];
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      BOOL v5 = 1;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    BOOL v12 = v5;
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (CPLNewAssetExtractionStep)initWithStorage:(id)a3 scopeIdentifier:(id)a4 maximumCount:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CPLNewAssetExtractionStep;
  v11 = [(CPLBatchExtractionStep *)&v20 initWithStorage:v9 scopeIdentifier:v10];
  BOOL v12 = v11;
  if (v11)
  {
    if (a5 <= 1)
    {
      if (!_CPLSilentLogging)
      {
        v16 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v19 = 0;
          _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "Can't extract masters with no room for assets", v19, 2u);
        }
      }
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      int v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLBatchExtractionStep.m"];
      [v17 handleFailureInMethod:a2 object:v12 file:v18 lineNumber:390 description:@"Can't extract masters with no room for assets"];

      abort();
    }
    v11->_maximumCount = a5;
    uint64_t v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    alreadySeenMasterScopedIdentifiers = v12->_alreadySeenMasterScopedIdentifiers;
    v12->_alreadySeenMasterScopedIdentifiers = v13;
  }
  return v12;
}

@end