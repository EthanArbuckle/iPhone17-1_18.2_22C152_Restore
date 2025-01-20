@interface CPLDeleteChainedRecordExtractionStep
- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)a4 maximumResourceSize:(unint64_t)a5 error:(id *)a6;
- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3;
- (CPLDeleteChainedRecordExtractionStep)initWithStorage:(id)a3 class:(Class)a4 classDescription:(id)a5 scopeIdentifier:(id)a6 maximumCount:(unint64_t)a7;
- (Class)recordClass;
- (NSString)classDescription;
- (id)shortDescription;
- (unint64_t)maximumCount;
@end

@implementation CPLDeleteChainedRecordExtractionStep

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classDescription, 0);

  objc_storeStrong((id *)&self->_recordClass, 0);
}

- (unint64_t)maximumCount
{
  return self->_maximumCount;
}

- (NSString)classDescription
{
  return self->_classDescription;
}

- (Class)recordClass
{
  return self->_recordClass;
}

- (id)shortDescription
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"Deleted(%@, chained)", self->_classDescription];

  return v2;
}

- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3
{
  id v3 = a3;
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && ([v3 isDelete] & 1) != 0;

  return v4;
}

- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)a4 maximumResourceSize:(unint64_t)a5 error:(id *)a6
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unint64_t maximumCount = self->_maximumCount;
  if (maximumCount >= a4) {
    unint64_t maximumCount = a4;
  }
  v58 = v8;
  unint64_t v59 = maximumCount;
  v10 = [(CPLBatchExtractionStep *)self storage];
  v62 = self;
  Class recordClass = self->_recordClass;
  v12 = [(CPLBatchExtractionStep *)self scopeIdentifier];
  v64 = v10;
  v13 = [v10 allChangesWithClass:recordClass scopeIdentifier:v12 changeType:1024];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = v13;
  uint64_t v52 = [obj countByEnumeratingWithState:&v83 objects:v90 count:16];
  if (v52)
  {
    id v53 = 0;
    unint64_t v54 = 0;
    uint64_t v15 = *(void *)v84;
    uint64_t v50 = *(void *)v84;
    while (2)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v84 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v56 = v16;
        v17 = *(void **)(*((void *)&v83 + 1) + 8 * v16);
        v57 = [v17 scopedIdentifier];
        if ((objc_msgSend(v14, "containsObject:") & 1) == 0)
        {
          v60 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
          v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v17, 0);
          id v19 = v18;
          while ([v18 count])
          {
            v20 = v19;
            context = (void *)MEMORY[0x1BA993DF0]();
            [v60 addObjectsFromArray:v19];
            id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v79 = 0u;
            long long v80 = 0u;
            long long v81 = 0u;
            long long v82 = 0u;
            id v66 = v20;
            uint64_t v21 = [v66 countByEnumeratingWithState:&v79 objects:v89 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v80;
              uint64_t v63 = *(void *)v80;
              do
              {
                uint64_t v24 = 0;
                uint64_t v65 = v22;
                do
                {
                  if (*(void *)v80 != v23) {
                    objc_enumerationMutation(v66);
                  }
                  v25 = [*(id *)(*((void *)&v79 + 1) + 8 * v24) scopedIdentifier];
                  if (([v14 containsObject:v25] & 1) == 0)
                  {
                    [v14 addObject:v25];
                    long long v77 = 0u;
                    long long v78 = 0u;
                    long long v75 = 0u;
                    long long v76 = 0u;
                    id v68 = v25;
                    v26 = [v64 allChangesWithClass:v62->_recordClass relatedScopedIdentifier:v25];
                    uint64_t v27 = [v26 countByEnumeratingWithState:&v75 objects:v88 count:16];
                    if (v27)
                    {
                      uint64_t v28 = v27;
                      uint64_t v29 = *(void *)v76;
                      do
                      {
                        for (uint64_t i = 0; i != v28; ++i)
                        {
                          if (*(void *)v76 != v29) {
                            objc_enumerationMutation(v26);
                          }
                          v31 = *(void **)(*((void *)&v75 + 1) + 8 * i);
                          if ([v31 isDelete])
                          {
                            v32 = [v31 scopedIdentifier];
                            char v33 = [v14 containsObject:v32];

                            if ((v33 & 1) == 0) {
                              [v19 addObject:v31];
                            }
                          }
                        }
                        uint64_t v28 = [v26 countByEnumeratingWithState:&v75 objects:v88 count:16];
                      }
                      while (v28);
                    }

                    uint64_t v23 = v63;
                    uint64_t v22 = v65;
                    v25 = v68;
                  }

                  ++v24;
                }
                while (v24 != v22);
                uint64_t v22 = [v66 countByEnumeratingWithState:&v79 objects:v89 count:16];
              }
              while (v22);
            }

            v18 = v19;
          }
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v69 = [v60 reverseObjectEnumerator];
          uint64_t v34 = [v69 countByEnumeratingWithState:&v71 objects:v87 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v72;
            v37 = (char *)v54;
            while (2)
            {
              uint64_t v38 = 0;
              v67 = &v37[v35];
              v55 = v37;
              v39 = v37 + 1;
              v40 = v53;
              do
              {
                if (*(void *)v72 != v36) {
                  objc_enumerationMutation(v69);
                }
                uint64_t v41 = *(void *)(*((void *)&v71 + 1) + 8 * v38);
                [v58 addChange:v41 fromStorage:v64];
                id v70 = v40;
                int v42 = [v64 removeChange:v41 error:&v70];
                id v43 = v70;

                if (v42) {
                  BOOL v44 = (unint64_t)&v39[v38] >= v59;
                }
                else {
                  BOOL v44 = 1;
                }
                if (v44)
                {
                  id v53 = v43;
                  unint64_t v45 = (unint64_t)&v55[v38 + 1];
                  goto LABEL_45;
                }
                ++v38;
                v40 = v43;
              }
              while (v35 != v38);
              id v53 = v43;
              uint64_t v35 = [v69 countByEnumeratingWithState:&v71 objects:v87 count:16];
              v37 = v67;
              if (v35) {
                continue;
              }
              break;
            }
            int v42 = 1;
            unint64_t v45 = (unint64_t)v67;
          }
          else
          {
            int v42 = 1;
            unint64_t v45 = v54;
          }
LABEL_45:

          if (v42) {
            BOOL v46 = v45 >= v59;
          }
          else {
            BOOL v46 = 1;
          }
          unint64_t v54 = v45;
          if (v46)
          {

            goto LABEL_56;
          }
          uint64_t v15 = v50;
        }

        uint64_t v16 = v56 + 1;
      }
      while (v56 + 1 != v52);
      uint64_t v52 = [obj countByEnumeratingWithState:&v83 objects:v90 count:16];
      if (v52) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v53 = 0;
    unint64_t v54 = 0;
  }
  int v42 = 1;
LABEL_56:

  if (v42 && v54 >= v59) {
    [v58 setFull:1];
  }
  if (a6) {
    char v47 = v42;
  }
  else {
    char v47 = 1;
  }
  if ((v47 & 1) == 0) {
    *a6 = v53;
  }

  return v42;
}

- (CPLDeleteChainedRecordExtractionStep)initWithStorage:(id)a3 class:(Class)a4 classDescription:(id)a5 scopeIdentifier:(id)a6 maximumCount:(unint64_t)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CPLDeleteChainedRecordExtractionStep;
  uint64_t v16 = [(CPLBatchExtractionStep *)&v25 initWithStorage:v13 scopeIdentifier:v15];
  if (v16)
  {
    if ((Class)[(objc_class *)a4 relatedRecordClass] != a4)
    {
      if (!_CPLSilentLogging)
      {
        v20 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = (void *)[(objc_class *)a4 relatedRecordClass];
          *(_DWORD *)buf = 138412546;
          Class v27 = a4;
          __int16 v28 = 2112;
          uint64_t v29 = v21;
          id v22 = v21;
          _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_ERROR, "Trying to extract new %@ chained but their related record class is %@", buf, 0x16u);
        }
      }
      uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLBatchExtractionStep.m"];
      [v23 handleFailureInMethod:a2, v16, v24, 282, @"Trying to extract new %@ chained but their related record class is %@", a4, -[objc_class relatedRecordClass](a4, "relatedRecordClass") object file lineNumber description];

      abort();
    }
    objc_storeStrong((id *)&v16->_recordClass, a4);
    uint64_t v17 = [v14 copy];
    classDescription = v16->_classDescription;
    v16->_classDescription = (NSString *)v17;

    v16->_unint64_t maximumCount = a7;
  }

  return v16;
}

@end