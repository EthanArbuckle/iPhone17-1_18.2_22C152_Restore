@interface CPLChangeBatch
+ (BOOL)supportsSecureCoding;
- (BOOL)hasChangeWithScopedIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)sortBatchWithError:(id *)a3;
- (CPLChangeBatch)init;
- (CPLChangeBatch)initWithCoder:(id)a3;
- (CPLChangeBatch)initWithRecords:(id)a3;
- (NSArray)records;
- (id)_additionalRecords;
- (id)_descriptionRedacted:(BOOL)a3;
- (id)_initWithRecords:(id)a3;
- (id)additionalRecordWithScopedIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)cplFullDescription;
- (id)description;
- (id)filterScopeChangeFromBatch;
- (id)localResourceOfType:(unint64_t)a3 forItemWithCloudScopedIdentifier:(id)a4;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)recordWithScopedIdentifier:(id)a3;
- (id)redactedDescription;
- (id)summaryDescription;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)estimatedBatchSize;
- (void)_addAdditionalRecord:(id)a3;
- (void)_addChange:(id)a3 resultBatch:(id)a4 changesPerScopedIdentifier:(id)a5 changesPerClass:(id)a6;
- (void)_setAdditionalRecords:(id)a3;
- (void)_setRecords:(id)a3;
- (void)addRecord:(id)a3;
- (void)addRecordsFromBatch:(id)a3;
- (void)appendLocalResources:(id)a3 forItemWithCloudScopedIdentifier:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)extractInitialDownloadBatch:(id *)a3 shouldConsiderRecordFilter:(id)a4;
- (void)removeRecordWithScopedIdentifier:(id)a3;
@end

@implementation CPLChangeBatch

- (id)cplFullDescription
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@: [\n", objc_opt_class()];
  v4 = (void *)MEMORY[0x1BA993DF0]();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = self;
  uint64_t v6 = [(CPLChangeBatch *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) cplFullDescription];
        [v3 appendFormat:@"  %@\n", v10];
      }
      uint64_t v7 = [(CPLChangeBatch *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  v11 = [(CPLChangeBatch *)v5 _additionalRecords];
  if ([v11 count]) {
    [v3 appendString:@"Additional records:\n"];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v19 + 1) + 8 * j) cplFullDescription];
        [v3 appendFormat:@"  %@\n", v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  [v3 appendString:@"]"];
  return v3;
}

- (CPLChangeBatch)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CPLChangeBatch *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    unint64_t v8 = 0x1E4F1C000uLL;
    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v7, v6, 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"records"];

    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_27;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v10 = v10;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v21 = v4;
      id v13 = 0;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            [(CPLChangeBatch *)v5 addRecord:v16];
          }
          else
          {
            if (!v13) {
              id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v13 addObject:v16];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v12);

      unint64_t v8 = 0x1E4F1C000;
      if (!v13)
      {
        id v4 = v21;
        goto LABEL_22;
      }
      id v4 = v21;
      if (_CPLSilentLogging)
      {
LABEL_22:
        v18 = objc_msgSend(*(id *)(v8 + 2768), "setWithObjects:", v7, v6, 0);
        long long v19 = [v4 decodeObjectOfClasses:v18 forKey:@"additionalRecords"];

        if (!v19)
        {
LABEL_25:

          goto LABEL_28;
        }
        if (objc_opt_isKindOfClass())
        {
          [(CPLChangeBatch *)v5 _setAdditionalRecords:v19];
          goto LABEL_25;
        }

LABEL_27:
        v5 = 0;
        goto LABEL_28;
      }
      v17 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v13;
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "Bad records in a batch during deserialization: %@", buf, 0xCu);
      }
    }
    else
    {
      id v13 = 0;
      v17 = v10;
    }

    goto LABEL_22;
  }
LABEL_28:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(CPLChangeBatch *)self records];
  [v6 encodeObject:v4 forKey:@"records"];
  v5 = [(CPLChangeBatch *)self _additionalRecords];
  if ([v5 count]) {
    [v6 encodeObject:v5 forKey:@"additionalRecords"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)extractInitialDownloadBatch:(id *)a3 shouldConsiderRecordFilter:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = (unsigned int (**)(id, void *))a4;
  long long v25 = a3;
  *a3 = 0;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  unint64_t v8 = self;
  uint64_t v9 = [(CPLChangeBatch *)v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v35 + 1) + 8 * v12);
        int v14 = [v13 isFullRecord];
        if ([v13 supportsSharingScopedIdentifier])
        {
          uint64_t v15 = [v13 sharingScopeIdentifier];

          if (v15) {
            int v16 = 0;
          }
          else {
            int v16 = v14;
          }
          if (v16 != 1) {
            goto LABEL_23;
          }
        }
        else if ((v14 & 1) == 0)
        {
          goto LABEL_23;
        }
        if ([v13 isMasterChange] && v6[2](v6, v13))
        {
          v17 = [v13 scopedIdentifier];
          if (!v17) {
            goto LABEL_22;
          }
          v18 = v27;
        }
        else
        {
          if (![v13 isAssetChange]) {
            goto LABEL_23;
          }
          long long v19 = [v13 realIdentifier];

          if (v19) {
            goto LABEL_23;
          }
          v17 = [v13 masterScopedIdentifier];
          if (!v17) {
            goto LABEL_22;
          }
          v18 = v26;
        }
        long long v20 = [v18 objectForKey:v17];

        if (v20)
        {
LABEL_22:

LABEL_23:
          [v7 addObject:v13];
          goto LABEL_24;
        }
        [v18 setObject:v13 forKey:v17];

LABEL_24:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v21 = [(CPLChangeBatch *)v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
      uint64_t v10 = v21;
    }
    while (v21);
  }

  if ([v26 count])
  {
    long long v22 = objc_alloc_init(CPLChangeBatch);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __103__CPLChangeBatch_CPLEngineTransientRepository__extractInitialDownloadBatch_shouldConsiderRecordFilter___block_invoke;
    v30[3] = &unk_1E60A7EB8;
    id v31 = v27;
    v34 = v6;
    long long v23 = v22;
    v32 = v23;
    id v33 = v7;
    [v26 enumerateKeysAndObjectsUsingBlock:v30];
    if ([(CPLChangeBatch *)v23 count]) {
      *long long v25 = v23;
    }
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __103__CPLChangeBatch_CPLEngineTransientRepository__extractInitialDownloadBatch_shouldConsiderRecordFilter___block_invoke_2;
  v28[3] = &unk_1E60A7EE0;
  id v29 = v7;
  id v24 = v7;
  [v27 enumerateKeysAndObjectsUsingBlock:v28];
  [(CPLChangeBatch *)v8 _setRecords:v24];
}

void __103__CPLChangeBatch_CPLEngineTransientRepository__extractInitialDownloadBatch_shouldConsiderRecordFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKey:v7];
  if (v6 && (*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
  {
    [*(id *)(a1 + 40) addRecord:v6];
    [*(id *)(a1 + 40) addRecord:v5];
    [*(id *)(a1 + 32) removeObjectForKey:v7];
  }
  else
  {
    [*(id *)(a1 + 48) addObject:v5];
  }
}

uint64_t __103__CPLChangeBatch_CPLEngineTransientRepository__extractInitialDownloadBatch_shouldConsiderRecordFilter___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (BOOL)sortBatchWithError:(id *)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  if ([(CPLChangeBatch *)self count] <= 1)
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v5 = self;
    uint64_t v6 = [(CPLChangeBatch *)v5 countByEnumeratingWithState:&v78 objects:v85 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v79;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v79 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v78 + 1) + 8 * i) scopedIdentifier];

          if (!v10)
          {
            long long v37 = +[CPLErrors cplErrorWithCode:50, @"Tried to sort a batch containing a %@ with no identifier", objc_opt_class() description];
            long long v38 = v37;
            if (a3) {
              *a3 = v37;
            }

            BOOL v11 = 0;
            goto LABEL_81;
          }
        }
        uint64_t v7 = [(CPLChangeBatch *)v5 countByEnumeratingWithState:&v78 objects:v85 count:16];
        BOOL v11 = 1;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v11 = 1;
    }
    goto LABEL_81;
  }
  v57 = a3;
  if (sortBatchWithError__onceToken != -1) {
    dispatch_once(&sortBatchWithError__onceToken, &__block_literal_global_158);
  }
  uint64_t v12 = MEMORY[0x1BA993DF0]();
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v65 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  int v16 = self;
  uint64_t v17 = [(CPLChangeBatch *)v16 countByEnumeratingWithState:&v74 objects:v84 count:16];
  v58 = v13;
  v56 = (void *)v12;
  if (v17)
  {
    uint64_t v18 = v17;
    v59 = 0;
    v60 = 0;
    uint64_t v19 = *(void *)v75;
    while (1)
    {
      uint64_t v20 = 0;
      uint64_t v63 = v18;
      do
      {
        if (*(void *)v75 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v74 + 1) + 8 * v20);
        uint64_t v22 = [v21 scopedIdentifier];
        if (!v22)
        {
          id v5 = +[CPLErrors cplErrorWithCode:50, @"Tried to sort a batch containing a %@ with no identifier", objc_opt_class() description];
          BOOL v11 = 0;
          v39 = v16;
          goto LABEL_78;
        }
        long long v23 = (void *)v22;
        id v24 = [v21 realIdentifier];
        if (v24)
        {
          id v25 = v15;
LABEL_21:
          [v25 addObject:v21];
          goto LABEL_22;
        }
        id v26 = objc_opt_class();
        uint64_t v27 = [v21 changeType];
        if ([v26 isSubclassOfClass:sortBatchWithError__scopeChangeClass])
        {
          if (v27 == 1024)
          {
            id v25 = v60;
            uint64_t v18 = v63;
            if (!v60) {
              id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            v60 = v25;
          }
          else
          {
            id v25 = v59;
            uint64_t v18 = v63;
            if (!v59) {
              id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            v59 = v25;
          }
          goto LABEL_21;
        }
        if (v27 != 1024)
        {
          v30 = [v14 objectForKey:v26];
          if (v30)
          {
            id v29 = v30;
            id v31 = v21;
            v32 = v23;
          }
          else
          {
            id v29 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v21 forKey:v23];
            v30 = v14;
            id v31 = v29;
            v32 = v26;
          }
          [v30 setObject:v31 forKey:v32];
          id v33 = v65;
          v34 = v21;
          long long v35 = v23;
          goto LABEL_41;
        }
        v28 = [v58 objectForKey:v26];
        if (!v28)
        {
          id v29 = [MEMORY[0x1E4F1CA48] arrayWithObject:v21];
          id v33 = v58;
          v34 = v29;
          long long v35 = v26;
LABEL_41:
          [v33 setObject:v34 forKey:v35];
          goto LABEL_42;
        }
        id v29 = v28;
        [v28 addObject:v21];
LABEL_42:

        uint64_t v18 = v63;
LABEL_22:

        ++v20;
      }
      while (v18 != v20);
      uint64_t v36 = [(CPLChangeBatch *)v16 countByEnumeratingWithState:&v74 objects:v84 count:16];
      uint64_t v18 = v36;
      if (!v36)
      {

        if (v59) {
          objc_msgSend(v15, "addObjectsFromArray:");
        }
        else {
          v59 = 0;
        }
        id v13 = v58;
        goto LABEL_52;
      }
    }
  }

  v59 = 0;
  v60 = 0;
LABEL_52:
  uint64_t v40 = +[CPLEngineTransientRepository orderedClassesForDelete];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v70 objects:v83 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v71;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v71 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = [v13 objectForKey:*(void *)(*((void *)&v70 + 1) + 8 * j)];
        if (v45) {
          [v15 addObjectsFromArray:v45];
        }
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v70 objects:v83 count:16];
    }
    while (v42);
  }
  v46 = +[CPLEngineTransientRepository orderedClassesForChanges];

  v47 = [(CPLChangeBatch *)v16 records];
  v48 = (void *)[v47 mutableCopy];

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v39 = v46;
  uint64_t v64 = [(CPLChangeBatch *)v39 countByEnumeratingWithState:&v66 objects:v82 count:16];
  if (v64)
  {
    obuint64_t j = v39;
    uint64_t v62 = *(void *)v67;
    do
    {
      for (uint64_t k = 0; k != v64; ++k)
      {
        if (*(void *)v67 != v62) {
          objc_enumerationMutation(obj);
        }
        v50 = [v14 objectForKey:*(void *)(*((void *)&v66 + 1) + 8 * k)];
        if ([v50 count])
        {
          unint64_t v51 = 0;
          do
          {
            if (v51 >= [v48 count]) {
              break;
            }
            v52 = [v48 objectAtIndexedSubscript:v51];
            v53 = [v52 scopedIdentifier];
            v54 = [v50 objectForKeyedSubscript:v53];

            if (v54)
            {
              [v48 removeObjectAtIndex:v51];
              [(CPLChangeBatch *)v16 _addChange:v52 resultBatch:v15 changesPerScopedIdentifier:v65 changesPerClass:v14];
            }
            else
            {
              ++v51;
            }
          }
          while ([v50 count]);
        }
      }
      v39 = obj;
      uint64_t v64 = [(CPLChangeBatch *)obj countByEnumeratingWithState:&v66 objects:v82 count:16];
    }
    while (v64);
  }

  if (v60) {
    [v15 addObjectsFromArray:v60];
  }
  [(CPLChangeBatch *)v16 _setRecords:v15];

  id v5 = 0;
  BOOL v11 = 1;
LABEL_78:

  if (v57 && !v11)
  {
    id v5 = v5;
    BOOL v11 = 0;
    id *v57 = v5;
  }
LABEL_81:

  return v11;
}

uint64_t __67__CPLChangeBatch_CPLEngineTransientRepository__sortBatchWithError___block_invoke()
{
  uint64_t result = objc_opt_class();
  sortBatchWithError__scopeChangeClass = result;
  return result;
}

- (void)_addChange:(id)a3 resultBatch:(id)a4 changesPerScopedIdentifier:(id)a5 changesPerClass:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v17 scopedIdentifier];
  [v11 removeObjectForKey:v13];
  id v14 = [v12 objectForKey:objc_opt_class()];
  [v14 removeObjectForKey:v13];
  id v15 = [v17 relatedScopedIdentifier];
  if (v15)
  {
    int v16 = [v11 objectForKey:v15];
    if (v16) {
      [(CPLChangeBatch *)self _addChange:v16 resultBatch:v10 changesPerScopedIdentifier:v11 changesPerClass:v12];
    }
  }
  [v10 addObject:v17];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localResources, 0);
  objc_storeStrong((id *)&self->_additionalRecords, 0);
  objc_storeStrong((id *)&self->_records, 0);
}

- (unint64_t)estimatedBatchSize
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL calculateEstimatedBatchSize = self->_calculateEstimatedBatchSize;
  unint64_t result = self->_estimatedBatchSize;
  if (!calculateEstimatedBatchSize)
  {
    if (result)
    {
      if (!_CPLSilentLogging)
      {
        id v12 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Estimated batch size should not have been calculated yet", buf, 2u);
        }
      }
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      id v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLChangeBatch.m"];
      [v13 handleFailureInMethod:a2 object:self file:v14 lineNumber:343 description:@"Estimated batch size should not have been calculated yet"];

      abort();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = self->_records;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          self->_estimatedBatchSize += [*(id *)(*((void *)&v16 + 1) + 8 * i) estimatedRecordSize];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v7);
    }

    additionalRecords = self->_additionalRecords;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __36__CPLChangeBatch_estimatedBatchSize__block_invoke;
    v15[3] = &unk_1E60AB2F0;
    v15[4] = self;
    [(NSMutableDictionary *)additionalRecords enumerateKeysAndObjectsUsingBlock:v15];
    self->_BOOL calculateEstimatedBatchSize = 1;
    return self->_estimatedBatchSize;
  }
  return result;
}

uint64_t __36__CPLChangeBatch_estimatedBatchSize__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 estimatedRecordSize];
  *(void *)(*(void *)(a1 + 32) + 40) += result;
  return result;
}

- (id)redactedDescription
{
  return [(CPLChangeBatch *)self _descriptionRedacted:1];
}

- (id)description
{
  return [(CPLChangeBatch *)self _descriptionRedacted:0];
}

- (id)_descriptionRedacted:(BOOL)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(CPLChangeBatch *)self count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_records, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v6 = self->_records;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (a3) {
            [v11 redactedDescription];
          }
          else {
          id v12 = [v11 description];
          }
          [v5 addObject:v12];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    id v13 = NSString;
    uint64_t v14 = objc_opt_class();
    id v15 = [(CPLChangeBatch *)self summaryDescription];
    long long v16 = [v5 componentsJoinedByString:@",\n  "];
    long long v17 = [v13 stringWithFormat:@"<%@ %@ {{\n  %@\n}}>", v14, v15, v16];
  }
  else
  {
    long long v18 = NSString;
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = [(CPLChangeBatch *)self summaryDescription];
    long long v17 = [v18 stringWithFormat:@"<%@ %@>", v19, v20];
  }
  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_records, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = self->_records;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * v9) copy];
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }

  id v11 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithRecords:v4];
  if (self->_additionalRecords)
  {
    id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](self->_additionalRecords, "count"));
    additionalRecords = self->_additionalRecords;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __31__CPLChangeBatch_copyWithZone___block_invoke;
    v25[3] = &unk_1E60AB2F0;
    id v14 = v12;
    id v26 = v14;
    [(NSMutableDictionary *)additionalRecords enumerateKeysAndObjectsUsingBlock:v25];
    id v15 = (void *)v11[2];
    v11[2] = v14;
    id v16 = v14;
  }
  if (self->_localResources)
  {
    long long v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](self->_localResources, "count"));
    localResources = self->_localResources;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __31__CPLChangeBatch_copyWithZone___block_invoke_2;
    v23[3] = &unk_1E60AB340;
    id v19 = v17;
    id v24 = v19;
    [(NSMutableDictionary *)localResources enumerateKeysAndObjectsUsingBlock:v23];
    uint64_t v20 = (void *)v11[3];
    v11[3] = v19;
    id v21 = v19;
  }
  return v11;
}

void __31__CPLChangeBatch_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void __31__CPLChangeBatch_copyWithZone___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __31__CPLChangeBatch_copyWithZone___block_invoke_3;
  v10[3] = &unk_1E60AB318;
  id v11 = v8;
  id v9 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];

  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
}

void __31__CPLChangeBatch_copyWithZone___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (void)appendLocalResources:(id)a3 forItemWithCloudScopedIdentifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    id v19 = v7;
    if (!self->_localResources)
    {
      id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      localResources = self->_localResources;
      self->_localResources = v9;
    }
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          long long v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "resourceType"));
          [v11 setObject:v17 forKey:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    uint64_t v8 = v19;
    [(NSMutableDictionary *)self->_localResources setObject:v11 forKey:v19];
  }
}

- (id)localResourceOfType:(unint64_t)a3 forItemWithCloudScopedIdentifier:(id)a4
{
  id v5 = [(NSMutableDictionary *)self->_localResources objectForKey:a4];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  id v7 = [v5 objectForKey:v6];

  return v7;
}

- (id)summaryDescription
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([(CPLChangeBatch *)self count])
  {
    long long v28 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"["];
    id v3 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    id v4 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    id v5 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v7 = self;
    uint64_t v8 = [(CPLChangeBatch *)v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v13 = objc_opt_class();
          [v6 addObject:v13];
          uint64_t v14 = [v12 changeType];
          uint64_t v15 = v5;
          if (v14 != 1024)
          {
            if ([v12 isFullRecord]) {
              uint64_t v15 = v3;
            }
            else {
              uint64_t v15 = v4;
            }
          }
          [v15 addObject:v13];
        }
        uint64_t v9 = [(CPLChangeBatch *)v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v9);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = v6;
    uint64_t v16 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v30;
      char v19 = 1;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * j);
          uint64_t v22 = [v3 countForObject:v21];
          uint64_t v23 = [v4 countForObject:v21];
          uint64_t v24 = [v5 countForObject:v21];
          if (v19) {
            uint64_t v25 = @"%@: +%lu/%lu/-%lu";
          }
          else {
            uint64_t v25 = @", %@: +%lu/%lu/-%lu";
          }
          -[__CFString appendFormat:](v28, "appendFormat:", v25, v21, v22, v23, v24);
          char v19 = 0;
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
        char v19 = 0;
      }
      while (v17);
    }

    [(__CFString *)v28 appendFormat:@"]"];
  }
  else
  {
    long long v28 = @"[empty batch]";
  }
  return v28;
}

- (void)_setRecords:(id)a3
{
  self->_estimatedBatchSize = 0;
  self->_BOOL calculateEstimatedBatchSize = 0;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_records count];
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_records objectAtIndex:a3];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableArray *)self->_records countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    records = self->_records;
    id v6 = [v4 records];
    char v7 = [(NSMutableArray *)records isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_addAdditionalRecord:(id)a3
{
  id v4 = a3;
  additionalRecords = self->_additionalRecords;
  id v9 = v4;
  if (!additionalRecords)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    char v7 = self->_additionalRecords;
    self->_additionalRecords = v6;

    id v4 = v9;
    additionalRecords = self->_additionalRecords;
  }
  uint64_t v8 = [v4 scopedIdentifier];
  [(NSMutableDictionary *)additionalRecords setObject:v9 forKeyedSubscript:v8];

  if (self->_calculateEstimatedBatchSize) {
    self->_estimatedBatchSize += [v9 estimatedRecordSize];
  }
}

- (id)_additionalRecords
{
  return (id)[(NSMutableDictionary *)self->_additionalRecords allValues];
}

- (void)_setAdditionalRecords:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  additionalRecords = self->_additionalRecords;
  self->_additionalRecords = v5;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = self->_additionalRecords;
          uint64_t v14 = objc_msgSend(v12, "scopedIdentifier", (void)v15);
          [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  self->_estimatedBatchSize = 0;
  self->_BOOL calculateEstimatedBatchSize = 0;
}

- (id)additionalRecordWithScopedIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_additionalRecords objectForKey:a3];
}

- (id)filterScopeChangeFromBatch
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__22651;
  uint64_t v23 = __Block_byref_object_dispose__22652;
  id v24 = 0;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__22651;
  uint64_t v13 = __Block_byref_object_dispose__22652;
  id v14 = 0;
  uint64_t v3 = objc_opt_class();
  records = self->_records;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__CPLChangeBatch_filterScopeChangeFromBatch__block_invoke;
  v8[3] = &unk_1E60AB2C8;
  v8[4] = &v19;
  v8[5] = &v15;
  v8[6] = &v9;
  v8[7] = v3;
  [(NSMutableArray *)records enumerateObjectsUsingBlock:v8];
  if (v20[5])
  {
    id v5 = self->_records;
    if (v10[5]) {
      -[NSMutableArray removeObjectsAtIndexes:](v5, "removeObjectsAtIndexes:");
    }
    else {
      [(NSMutableArray *)v5 removeObjectAtIndex:v16[3]];
    }
  }
  id v6 = (id)v20[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v6;
}

void __44__CPLChangeBatch_filterScopeChangeFromBatch__block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = *(void *)(a1[4] + 8);
    uint64_t v10 = *(void **)(v7 + 40);
    uint64_t v9 = (id *)(v7 + 40);
    uint64_t v8 = v10;
    if (v10)
    {
      char v15 = 0;
      [v8 updateScopeFromScopeChange:v6 direction:2 didHaveChanges:&v15];
      uint64_t v11 = *(void **)(*(void *)(a1[6] + 8) + 40);
      if (!v11)
      {
        uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:*(void *)(*(void *)(a1[5] + 8) + 24)];
        uint64_t v13 = *(void *)(a1[6] + 8);
        id v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;

        uint64_t v11 = *(void **)(*(void *)(a1[6] + 8) + 40);
      }
      [v11 addIndex:a3];
    }
    else
    {
      objc_storeStrong(v9, a2);
      *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
    }
  }
}

- (id)recordWithScopedIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_records;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "scopedIdentifier", (void)v13);
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)hasChangeWithScopedIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_records;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "scopedIdentifier", (void)v12);
        char v10 = [v9 isEqual:v4];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSArray)records
{
  return (NSArray *)self->_records;
}

- (void)removeRecordWithScopedIdentifier:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(NSMutableArray *)self->_records count];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = [(NSMutableArray *)self->_records objectAtIndexedSubscript:v6];
      uint64_t v8 = [v7 scopedIdentifier];
      int v9 = [v8 isEqual:v10];

      if (v9) {
        break;
      }

      if (v5 == ++v6) {
        goto LABEL_7;
      }
    }
    [(NSMutableArray *)self->_records removeObjectAtIndex:v6];
    self->_estimatedBatchSize = 0;
    self->_BOOL calculateEstimatedBatchSize = 0;
  }
LABEL_7:
}

- (void)addRecordsFromBatch:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v8 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v13 = self;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Trying to add a nil list of records to %@", buf, 0xCu);
      }
    }
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLChangeBatch.m"];
    [v9 handleFailureInMethod:a2, self, v10, 100, @"Trying to add a nil list of records to %@", self object file lineNumber description];

    abort();
  }
  records = self->_records;
  id v11 = v5;
  uint64_t v7 = [v5 records];
  [(NSMutableArray *)records addObjectsFromArray:v7];

  self->_estimatedBatchSize = 0;
  self->_BOOL calculateEstimatedBatchSize = 0;
}

- (void)addRecord:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v6 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = self;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Trying to add a nil record to %@", buf, 0xCu);
      }
    }
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLChangeBatch.m"];
    [v7 handleFailureInMethod:a2, self, v8, 92, @"Trying to add a nil record to %@", self object file lineNumber description];

    abort();
  }
  id v9 = v5;
  [(NSMutableArray *)self->_records addObject:v5];
  if (self->_calculateEstimatedBatchSize) {
    self->_estimatedBatchSize += [v9 estimatedRecordSize];
  }
}

- (id)_initWithRecords:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(CPLChangeBatch *)self init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_records, a3);
  }

  return v7;
}

- (CPLChangeBatch)initWithRecords:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLChangeBatch *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    records = v5->_records;
    v5->_records = (NSMutableArray *)v6;
  }
  return v5;
}

- (CPLChangeBatch)init
{
  v6.receiver = self;
  v6.super_class = (Class)CPLChangeBatch;
  v2 = [(CPLChangeBatch *)&v6 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    records = v2->_records;
    v2->_records = v3;
  }
  return v2;
}

@end