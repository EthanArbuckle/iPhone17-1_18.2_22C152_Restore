@interface CPLNewChainedRecordExtractionStep
- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)a4 maximumResourceSize:(unint64_t)a5 error:(id *)a6;
- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3;
- (CPLNewChainedRecordExtractionStep)initWithStorage:(id)a3 class:(Class)a4 classDescription:(id)a5 scopeIdentifier:(id)a6 maximumCount:(unint64_t)a7;
- (Class)recordClass;
- (NSString)classDescription;
- (id)shortDescription;
- (unint64_t)maximumCount;
@end

@implementation CPLNewChainedRecordExtractionStep

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
  v2 = (void *)[[NSString alloc] initWithFormat:@"New(%@, chained)", self->_classDescription];
  return v2;
}

- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3
{
  id v3 = a3;
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && ([v3 isFullRecord] & 1) != 0;

  return v4;
}

- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)a4 maximumResourceSize:(unint64_t)a5 error:(id *)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  unint64_t maximumCount = self->_maximumCount;
  if (maximumCount >= a4) {
    unint64_t maximumCount = a4;
  }
  unint64_t v46 = maximumCount;
  v10 = [(CPLBatchExtractionStep *)self storage];
  Class recordClass = self->_recordClass;
  v12 = [(CPLBatchExtractionStep *)self scopeIdentifier];
  v13 = [v10 allChangesWithClass:recordClass scopeIdentifier:v12 changeType:0];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    unint64_t v18 = 0;
    id v19 = 0;
    uint64_t v20 = *(void *)v58;
    uint64_t v44 = *(void *)v58;
    v39 = a6;
    id v40 = v15;
    id v41 = v14;
    while (2)
    {
      uint64_t v21 = 0;
      uint64_t v45 = v17;
      do
      {
        if (*(void *)v58 != v20) {
          objc_enumerationMutation(v15);
        }
        v22 = *(void **)(*((void *)&v57 + 1) + 8 * v21);
        v23 = objc_msgSend(v22, "scopedIdentifier", v39);
        if (([v14 containsObject:v23] & 1) == 0)
        {
          [v14 addObject:v23];
          v24 = [v22 relatedScopedIdentifier];
          v47 = v22;
          v48 = v23;
          if (v24 && ([v14 containsObject:v24] & 1) == 0)
          {
            id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            while (([v14 containsObject:v24] & 1) == 0)
            {
              v25 = [v10 changeWithScopedIdentifier:v24];
              [v14 addObject:v24];
              if (!v25 || ([v25 isDelete] & 1) != 0 || (objc_msgSend(v25, "isFullRecord") & 1) == 0)
              {

                break;
              }
              [v49 addObject:v25];
              uint64_t v26 = [v25 relatedScopedIdentifier];

              v24 = (void *)v26;
              if (!v26) {
                break;
              }
            }
            long long v55 = 0u;
            long long v56 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            v27 = [v49 reverseObjectEnumerator];
            uint64_t v28 = [v27 countByEnumeratingWithState:&v53 objects:v61 count:16];
            if (v28)
            {
              uint64_t v29 = v28;
              uint64_t v30 = *(void *)v54;
              while (2)
              {
                uint64_t v31 = 0;
                unint64_t v42 = v18 + v29;
                unint64_t v43 = v18 + 1;
                v32 = v19;
                do
                {
                  if (*(void *)v54 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  uint64_t v33 = *(void *)(*((void *)&v53 + 1) + 8 * v31);
                  [v50 addChange:v33 fromStorage:v10];
                  id v52 = v32;
                  int v34 = [v10 removeChange:v33 error:&v52];
                  id v19 = v52;

                  if (!v34)
                  {
                    unint64_t v18 = v43 + v31;

                    id v15 = v40;
                    id v14 = v41;
                    goto LABEL_37;
                  }
                  ++v31;
                  v32 = v19;
                }
                while (v29 != v31);
                uint64_t v29 = [v27 countByEnumeratingWithState:&v53 objects:v61 count:16];
                unint64_t v18 = v42;
                if (v29) {
                  continue;
                }
                break;
              }
            }

            id v15 = v40;
            id v14 = v41;
          }
          v35 = v19;
          ++v18;
          [v50 addChange:v47 fromStorage:v10];
          id v51 = v19;
          int v34 = [v10 removeChange:v47 error:&v51];
          id v19 = v51;

          if (v34) {
            BOOL v36 = v18 >= v46;
          }
          else {
            BOOL v36 = 1;
          }
          if (v36)
          {
LABEL_37:

            a6 = v39;
            goto LABEL_39;
          }

          uint64_t v20 = v44;
          uint64_t v17 = v45;
          v23 = v48;
        }

        ++v21;
      }
      while (v21 != v17);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v57 objects:v62 count:16];
      int v34 = 1;
      a6 = v39;
      if (v17) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v18 = 0;
    id v19 = 0;
    int v34 = 1;
  }
LABEL_39:

  if (v34 && v18 >= v46) {
    [v50 setFull:1];
  }
  if (a6) {
    char v37 = v34;
  }
  else {
    char v37 = 1;
  }
  if ((v37 & 1) == 0) {
    *a6 = v19;
  }

  return v34;
}

- (CPLNewChainedRecordExtractionStep)initWithStorage:(id)a3 class:(Class)a4 classDescription:(id)a5 scopeIdentifier:(id)a6 maximumCount:(unint64_t)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CPLNewChainedRecordExtractionStep;
  uint64_t v16 = [(CPLBatchExtractionStep *)&v25 initWithStorage:v13 scopeIdentifier:v15];
  if (v16)
  {
    if ((Class)[(objc_class *)a4 relatedRecordClass] != a4)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v20 = __CPLGenericOSLogDomain();
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
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLBatchExtractionStep.m"];
      [v23 handleFailureInMethod:a2, v16, v24, 174, @"Trying to extract new %@ chained but their related record class is %@", a4, -[objc_class relatedRecordClass](a4, "relatedRecordClass") object file lineNumber description];

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