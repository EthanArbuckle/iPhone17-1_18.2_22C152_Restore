@interface CPLMingleUtility
+ (BOOL)_applyMingledBatch:(id)a3 scope:(id)a4 forStore:(id)a5 onPutBatchInPullQueue:(id)a6 error:(id *)a7;
+ (BOOL)_remapScopedIdentifier:(id)a3 to:(id)a4 class:(Class)a5 inBatch:(id)a6 store:(id)a7 idMapping:(id)a8 cloudCache:(id)a9 remappedRecords:(id)a10 error:(id *)a11;
+ (BOOL)_shouldDeletePrivateRecordWithNaturalPrivateScopedIdentifier:(id)a3 correctPrivateScopedIdentifier:(id)a4 cloudCache:(id)a5 transientPullRepository:(id)a6;
+ (BOOL)applyShareRemapFixUpTasks:(id)a3 scope:(id)a4 store:(id)a5 onPutBatchInPullQueue:(id)a6 error:(id *)a7;
+ (BOOL)mingleChangeBatch:(id)a3 scope:(id)a4 forStore:(id)a5 onPutBatchInPullQueue:(id)a6 error:(id *)a7;
+ (BOOL)mingleRemappedBatch:(id)a3 scope:(id)a4 forStore:(id)a5 onPutBatchInPullQueue:(id)a6 error:(id *)a7;
+ (BOOL)mingleSharedRemappedBatch:(id)a3 scope:(id)a4 sharedScope:(id)a5 forStore:(id)a6 fixUpTasks:(id *)a7 onPutBatchInPullQueue:(id)a8 error:(id *)a9;
@end

@implementation CPLMingleUtility

+ (BOOL)applyShareRemapFixUpTasks:(id)a3 scope:(id)a4 store:(id)a5 onPutBatchInPullQueue:(id)a6 error:(id *)a7
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v48 = [v13 cloudCache];
  v47 = [v13 remappedRecords];
  v51 = [v13 transientPullRepository];
  v15 = objc_alloc_init(CPLChangeBatch);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v16 = v11;
  uint64_t v49 = [v16 countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (v49)
  {
    v39 = a7;
    id v40 = v14;
    id v41 = v13;
    id v42 = v12;
    v50 = 0;
    v43 = v15;
    uint64_t v44 = *(void *)v56;
    v45 = v16;
    while (1)
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v56 != v44) {
          objc_enumerationMutation(v16);
        }
        v18 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x1BA993DF0]();
        v20 = [v18 sharedCloudScopedIdentifier];
        v21 = [v18 realCloudScopedIdentifier];
        v22 = [v18 proposedPrivateScopedIdentifier];
        v23 = [CPLScopedIdentifier alloc];
        v24 = [v21 identifier];
        id v25 = [(CPLScopedIdentifier *)v23 initRelativeToScopedIdentifier:v22 identifier:v24];

        if ([a1 _shouldDeletePrivateRecordWithNaturalPrivateScopedIdentifier:v25 correctPrivateScopedIdentifier:v22 cloudCache:v48 transientPullRepository:v51])
        {
          if (!_CPLSilentLogging)
          {
            v26 = __CPLTaskOSLogDomain_611();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v27 = [v18 privateCloudScopedIdentifier];
              *(_DWORD *)buf = 138413058;
              v60 = v27;
              __int16 v61 = 2112;
              v62 = v20;
              __int16 v63 = 2112;
              v64 = v21;
              __int16 v65 = 2112;
              id v66 = v25;
              _os_log_impl(&dword_1B4CAC000, v26, OS_LOG_TYPE_DEFAULT, "After fix-up of %@, acknowledging shared record %@ has been remapped to %@ too late - so we will need to delete %@ in the client", buf, 0x2Au);
            }
          }
          v28 = objc_msgSend((id)objc_msgSend(v18, "recordClass", v39, v40, v41, v42), "newDeleteChangeWithScopedIdentifier:", v25);
          [(CPLChangeBatch *)v43 addRecord:v28];
        }
        else
        {
          if (_CPLSilentLogging) {
            goto LABEL_16;
          }
          v28 = __CPLTaskOSLogDomain_611();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = [v18 privateCloudScopedIdentifier];
            *(_DWORD *)buf = 138412802;
            v60 = v29;
            __int16 v61 = 2112;
            v62 = v20;
            __int16 v63 = 2112;
            v64 = v21;
            _os_log_impl(&dword_1B4CAC000, v28, OS_LOG_TYPE_DEFAULT, "After fix-up of %@, acknowledging %@ has been remapped to %@", buf, 0x20u);
          }
        }

LABEL_16:
        id v54 = 0;
        int v30 = objc_msgSend(v47, "addRemappedRecordWithScopedIdentifier:realScopedIdentifier:error:", v20, v21, &v54, v39, v40, v41, v42);
        id v31 = v54;
        if (v30)
        {
          v32 = [v18 sharedCloudScopedIdentifier];
          id v53 = v31;
          char v33 = [v51 markUnmingledChangeWithScopedIdentifierAsMingled:v32 error:&v53];
          id v34 = v53;

          if (v33)
          {
            int v35 = 1;
            goto LABEL_21;
          }
          id v31 = v34;
        }
        id v34 = v31;

        int v35 = 0;
        v50 = v34;
LABEL_21:

        id v16 = v45;
      }
      uint64_t v49 = [v45 countByEnumeratingWithState:&v55 objects:v67 count:16];
      if (!v49)
      {

        if (v35)
        {
          id v13 = v41;
          id v12 = v42;
          a7 = v39;
          id v14 = v40;
          v15 = v43;
          id v36 = v50;
          goto LABEL_26;
        }
        id v13 = v41;
        id v12 = v42;
        a7 = v39;
        id v14 = v40;
        v15 = v43;
        id v36 = v50;
        if (v39)
        {
LABEL_30:
          if ((v35 & 1) == 0)
          {
            id v36 = v36;
            LOBYTE(v35) = 0;
            *a7 = v36;
          }
        }
        goto LABEL_33;
      }
    }
  }

  id v36 = 0;
LABEL_26:
  if ([(CPLChangeBatch *)v15 count])
  {
    id v52 = v36;
    LOBYTE(v35) = [a1 _applyMingledBatch:v15 scope:v12 forStore:v13 onPutBatchInPullQueue:v14 error:&v52];
    id v37 = v52;

    id v36 = v37;
    if (a7) {
      goto LABEL_30;
    }
  }
  else
  {
    LOBYTE(v35) = 1;
  }
LABEL_33:

  return v35;
}

+ (BOOL)mingleSharedRemappedBatch:(id)a3 scope:(id)a4 sharedScope:(id)a5 forStore:(id)a6 fixUpTasks:(id *)a7 onPutBatchInPullQueue:(id)a8 error:(id *)a9
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v73 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v75 = [v16 cloudCache];
  v70 = [v16 remappedRecords];
  v18 = [v16 transientPullRepository];
  __int16 v65 = objc_alloc_init(CPLChangeBatch);
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v19 = v14;
  uint64_t v72 = [v19 countByEnumeratingWithState:&v79 objects:v91 count:16];
  if (!v72)
  {

    id v53 = 0;
    id v66 = 0;
    goto LABEL_58;
  }
  __int16 v61 = a7;
  id v62 = v17;
  id v66 = 0;
  id obj = v19;
  id v63 = v16;
  id v64 = v15;
  v74 = 0;
  char v68 = 1;
  uint64_t v71 = *(void *)v80;
  *(void *)&long long v20 = 138413058;
  long long v60 = v20;
  do
  {
    for (uint64_t i = 0; i != v72; ++i)
    {
      if (*(void *)v80 != v71) {
        objc_enumerationMutation(obj);
      }
      v22 = *(void **)(*((void *)&v79 + 1) + 8 * i);
      v23 = (void *)MEMORY[0x1BA993DF0]();
      v24 = [v22 scopedIdentifier];
      id v25 = [v22 realScopedIdentifier];
      v26 = [CPLScopedIdentifier alloc];
      v27 = [v73 scopeIdentifier];
      v28 = [v24 identifier];
      v29 = [(CPLScopedIdentifier *)v26 initWithScopeIdentifier:v27 identifier:v28];

      int v30 = v29;
      id v31 = [v18 unmingledChangeWithScopedIdentifier:v30];
      v32 = v31;
      if (v31 && [v31 supportsSharingScopedIdentifier])
      {
        if ([v32 isDelete])
        {
          char v33 = v30;
          if (_CPLSilentLogging)
          {
LABEL_36:

            goto LABEL_37;
          }
          id v34 = __CPLTaskOSLogDomain_611();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v84 = v24;
            __int16 v85 = 2112;
            v86 = v25;
            __int16 v87 = 2112;
            v88 = v30;
            _os_log_impl(&dword_1B4CAC000, v34, OS_LOG_TYPE_DEFAULT, "%@ has been remapped to %@ but the private record %@ is meant to be deleted", buf, 0x20u);
          }
          char v33 = v30;
LABEL_35:

          goto LABEL_36;
        }
        id v40 = [v32 sharingRecordScopedIdentifier];
        char v33 = v40;
        if (!v40)
        {
          if (!_CPLSilentLogging)
          {
            id v41 = __CPLTaskOSLogDomain_611();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v84 = v24;
              __int16 v85 = 2112;
              v86 = v25;
              __int16 v87 = 2112;
              v88 = v30;
              id v42 = v41;
              v43 = "%@ has been remapped to %@ but the private record %@ is not shared any more";
              uint32_t v44 = 32;
              goto LABEL_32;
            }
LABEL_33:
          }
LABEL_34:
          id v34 = v30;
          goto LABEL_35;
        }
        if (([v40 isEqual:v24] & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            id v41 = __CPLTaskOSLogDomain_611();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v60;
              v84 = v24;
              __int16 v85 = 2112;
              v86 = v25;
              __int16 v87 = 2112;
              v88 = v30;
              __int16 v89 = 2112;
              v90 = v33;
              id v42 = v41;
              v43 = "%@ has been remapped to %@ but the private record %@ is already shared to %@";
              uint32_t v44 = 42;
LABEL_32:
              _os_log_impl(&dword_1B4CAC000, v42, OS_LOG_TYPE_DEFAULT, v43, buf, v44);
            }
            goto LABEL_33;
          }
          goto LABEL_34;
        }
        int v35 = v30;
      }
      else
      {

        char v33 = [v75 targetForRecordWithSharedCloudScopedIdentifier:v24];
        if ([v33 targetState] != 3) {
          goto LABEL_36;
        }
        int v35 = [v33 scopedIdentifier];
      }

      if (v35)
      {
        if (!_CPLSilentLogging)
        {
          id v36 = __CPLTaskOSLogDomain_611();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v84 = v24;
            __int16 v85 = 2112;
            v86 = v25;
            __int16 v87 = 2112;
            v88 = v35;
            _os_log_impl(&dword_1B4CAC000, v36, OS_LOG_TYPE_DEFAULT, "%@ has been remapped to %@ but we will need to fix up %@ first", buf, 0x20u);
          }
        }
        id v37 = -[CPLSharedRemapFixUpTask initWithSharedCloudScopedIdentifier:realCloudScopedIdentifier:privateCloudScopedIdentifier:proposedPrivateScopedIdentifier:recordClass:]([CPLSharedRemapFixUpTask alloc], "initWithSharedCloudScopedIdentifier:realCloudScopedIdentifier:privateCloudScopedIdentifier:proposedPrivateScopedIdentifier:recordClass:", v24, v25, v35, v30, [v22 recordClass]);
        id v38 = v66;
        if (!v66) {
          id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        id v66 = v38;
        objc_msgSend(v38, "addObject:", v37, v60);
        int v39 = 1;
        goto LABEL_52;
      }
LABEL_37:
      v45 = [CPLScopedIdentifier alloc];
      v46 = [v25 identifier];
      int v35 = [(CPLScopedIdentifier *)v45 initRelativeToScopedIdentifier:v30 identifier:v46];

      if ([a1 _shouldDeletePrivateRecordWithNaturalPrivateScopedIdentifier:v35 correctPrivateScopedIdentifier:v30 cloudCache:v75 transientPullRepository:v18])
      {
        if (!_CPLSilentLogging)
        {
          v47 = __CPLTaskOSLogDomain_611();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v84 = v24;
            __int16 v85 = 2112;
            v86 = v25;
            __int16 v87 = 2112;
            v88 = v35;
            _os_log_impl(&dword_1B4CAC000, v47, OS_LOG_TYPE_DEFAULT, "Acknowledging shared record %@ has been remapped to %@ too late - so we will need to delete %@ in the client", buf, 0x20u);
          }
        }
        v48 = objc_msgSend((id)objc_msgSend(v22, "recordClass", (void)v60), "newDeleteChangeWithScopedIdentifier:", v35);
        [(CPLChangeBatch *)v65 addRecord:v48];
LABEL_46:

        goto LABEL_47;
      }
      if (!_CPLSilentLogging)
      {
        v48 = __CPLTaskOSLogDomain_611();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v84 = v24;
          __int16 v85 = 2112;
          v86 = v25;
          _os_log_impl(&dword_1B4CAC000, v48, OS_LOG_TYPE_DEFAULT, "Acknowledging shared record %@ has been remapped to %@", buf, 0x16u);
        }
        goto LABEL_46;
      }
LABEL_47:
      id v78 = 0;
      int v49 = objc_msgSend(v70, "addRemappedRecordWithScopedIdentifier:realScopedIdentifier:error:", v24, v25, &v78, (void)v60);
      v50 = (CPLSharedRemapFixUpTask *)v78;
      v51 = v50;
      if (v49)
      {
        v77 = v50;
        char v52 = [v18 markUnmingledChangeWithScopedIdentifierAsMingled:v24 error:&v77];
        id v37 = v77;

        if (v52)
        {
          int v39 = 1;
          char v68 = 1;
          goto LABEL_52;
        }
        v51 = v37;
      }
      int v39 = 0;
      char v68 = 0;
      id v37 = v74;
      v74 = v51;
LABEL_52:

      if (!v39) {
        goto LABEL_55;
      }
    }
    uint64_t v72 = [obj countByEnumeratingWithState:&v79 objects:v91 count:16];
  }
  while (v72);
LABEL_55:
  id v19 = obj;

  id v16 = v63;
  id v15 = v64;
  a7 = v61;
  id v17 = v62;
  id v53 = v74;
  if ((v68 & 1) == 0)
  {
LABEL_61:
    if (a9)
    {
      id v53 = v53;
      BOOL v57 = 0;
      *a9 = v53;
    }
    else
    {
      BOOL v57 = 0;
    }
    long long v58 = v65;
    id v56 = v66;
    goto LABEL_65;
  }
LABEL_58:
  if ([(CPLChangeBatch *)v65 count])
  {
    v76 = v53;
    char v54 = [a1 _applyMingledBatch:v65 scope:v73 forStore:v16 onPutBatchInPullQueue:v17 error:&v76];
    long long v55 = v76;

    id v53 = v55;
    if ((v54 & 1) == 0) {
      goto LABEL_61;
    }
  }
  id v56 = v66;
  *a7 = v56;
  BOOL v57 = 1;
  long long v58 = v65;
LABEL_65:

  return v57;
}

+ (BOOL)_shouldDeletePrivateRecordWithNaturalPrivateScopedIdentifier:(id)a3 correctPrivateScopedIdentifier:(id)a4 cloudCache:(id)a5 transientPullRepository:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  BOOL v15 = 0;
  if (([v9 isEqual:v10] & 1) == 0)
  {
    if ([v11 hasRecordWithScopedIdentifier:v9])
    {
      if (([v11 hasRecordWithScopedIdentifier:v10] & 1) != 0
        || ([v12 unmingledChangeWithScopedIdentifier:v10],
            id v13 = objc_claimAutoreleasedReturnValue(),
            char v14 = [v13 isFullRecord],
            v13,
            (v14 & 1) != 0))
      {
        BOOL v15 = 1;
      }
    }
  }

  return v15;
}

+ (BOOL)mingleRemappedBatch:(id)a3 scope:(id)a4 forStore:(id)a5 onPutBatchInPullQueue:(id)a6 error:(id *)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  BOOL v15 = objc_alloc_init(CPLChangeBatch);
  id v41 = [v13 idMapping];
  id v40 = [v13 cloudCache];
  int v39 = [v13 remappedRecords];
  id v42 = v13;
  id v38 = [v13 transientPullRepository];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v11;
  uint64_t v16 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v47;
    id v34 = v14;
    id v35 = v12;
    char v33 = a7;
LABEL_3:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v47 != v18) {
        objc_enumerationMutation(obj);
      }
      long long v20 = *(void **)(*((void *)&v46 + 1) + 8 * v19);
      v21 = (void *)MEMORY[0x1BA993DF0]();
      v22 = [v20 scopedIdentifier];
      v23 = [v20 realScopedIdentifier];
      uint64_t v24 = [v20 recordClass];
      id v45 = 0;
      id v25 = v15;
      int v26 = [a1 _remapScopedIdentifier:v22 to:v23 class:v24 inBatch:v15 store:v42 idMapping:v41 cloudCache:v40 remappedRecords:v39 error:&v45];
      id v27 = v45;

      if (!v26) {
        break;
      }
      v28 = [v20 scopedIdentifier];
      id v44 = v27;
      int v29 = [v38 markUnmingledChangeWithScopedIdentifierAsMingled:v28 error:&v44];
      id v30 = v44;

      if (!v29)
      {
        id v27 = v30;
        break;
      }

      ++v19;
      BOOL v15 = v25;
      if (v17 == v19)
      {
        uint64_t v17 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
        id v14 = v34;
        id v12 = v35;
        a7 = v33;
        if (v17) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    BOOL v15 = v25;

    char v31 = 0;
    id v14 = v34;
    id v12 = v35;
    a7 = v33;
    if (!v33) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_10:

    if (![(CPLChangeBatch *)v15 count])
    {
      id v27 = 0;
      char v31 = 1;
      goto LABEL_18;
    }
    id v43 = 0;
    char v31 = [a1 _applyMingledBatch:v15 scope:v12 forStore:v42 onPutBatchInPullQueue:v14 error:&v43];
    id v27 = v43;
    if (!a7) {
      goto LABEL_18;
    }
  }
  if ((v31 & 1) == 0)
  {
    id v27 = v27;
    char v31 = 0;
    *a7 = v27;
  }
LABEL_18:

  return v31;
}

+ (BOOL)_remapScopedIdentifier:(id)a3 to:(id)a4 class:(Class)a5 inBatch:(id)a6 store:(id)a7 idMapping:(id)a8 cloudCache:(id)a9 remappedRecords:(id)a10 error:(id *)a11
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  uint64_t v18 = (objc_class *)a4;
  id v19 = a6;
  id v55 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (!v18)
  {
    if (!_CPLSilentLogging)
    {
      long long v49 = __CPLTaskOSLogDomain_611();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        Class v61 = a5;
        __int16 v62 = 2112;
        id v63 = v17;
        _os_log_impl(&dword_1B4CAC000, v49, OS_LOG_TYPE_ERROR, "Trying to remap <%@ %@> to no other scoped identifier", buf, 0x16u);
      }
    }
    v50 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v51 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLMingleUtility.m"];
    [v50 handleFailureInMethod:a2, a1, v51, 176, @"Trying to remap <%@ %@> to no other scoped identifier", a5, v17 object file lineNumber description];

    abort();
  }
  v23 = v22;
  char v59 = 0;
  uint64_t v24 = [v20 localScopedIdentifierForCloudScopedIdentifier:v18 isFinal:&v59];
  if (!v24)
  {
LABEL_23:
    id v38 = v21;
    if (!_CPLSilentLogging)
    {
      int v39 = __CPLTaskOSLogDomain_611();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        Class v61 = a5;
        __int16 v62 = 2112;
        id v63 = v17;
        __int16 v64 = 2112;
        __int16 v65 = v18;
        _os_log_impl(&dword_1B4CAC000, v39, OS_LOG_TYPE_DEFAULT, "<%@ %@> has been remapped to %@", buf, 0x20u);
      }
    }
    id v57 = 0;
    char v40 = [v20 setFinalCloudScopedIdentifier:v18 forPendingCloudScopedIdentifier:v17 error:&v57];
    id v41 = v57;
    id v42 = v41;
    if (v40)
    {
      id v56 = v41;
      id v53 = v21;
      char v43 = [v21 remapAllRecordsWithPreviousScopedIdentifier:v17 newScopedIdentifier:v18 error:&v56];
      id v25 = v56;

      if (v43) {
        goto LABEL_29;
      }
      if (!_CPLSilentLogging)
      {
        long long v46 = __CPLTaskOSLogDomain_611();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          Class v61 = a5;
          __int16 v62 = 2112;
          id v63 = v17;
          __int16 v64 = 2112;
          __int16 v65 = v18;
          __int16 v66 = 2112;
          id v67 = v25;
          _os_log_impl(&dword_1B4CAC000, v46, OS_LOG_TYPE_ERROR, "Failed to update cloud cache remapping all %@s with %@ to %@: %@", buf, 0x2Au);
        }
      }
      id v42 = v25;
      id v38 = v21;
      if (!a11)
      {
LABEL_36:

        char v44 = 0;
        goto LABEL_51;
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v45 = __CPLTaskOSLogDomain_611();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          Class v61 = v18;
          __int16 v62 = 2112;
          id v63 = v17;
          __int16 v64 = 2112;
          __int16 v65 = (objc_class *)v42;
          _os_log_impl(&dword_1B4CAC000, v45, OS_LOG_TYPE_ERROR, "Failed to set final cloud identifier %@ for cloud identifier %@: %@", buf, 0x20u);
        }
      }
      if (!a11) {
        goto LABEL_36;
      }
    }
    id v42 = v42;
    *a11 = v42;
    goto LABEL_36;
  }
  id v25 = (id)v24;
  int v26 = [v20 localScopedIdentifierForCloudScopedIdentifier:v17 isFinal:&v59];
  if (!v26)
  {
    id v53 = v21;
    if (![v21 hasRecordWithScopedIdentifier:v17])
    {
      if (_CPLSilentLogging) {
        goto LABEL_16;
      }
      id v34 = __CPLTaskOSLogDomain_611();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        Class v61 = a5;
        __int16 v62 = 2112;
        id v63 = v17;
        _os_log_impl(&dword_1B4CAC000, v34, OS_LOG_TYPE_DEFAULT, "Ignoring remap for <%@ %@> as we don't know this record", buf, 0x16u);
      }
LABEL_15:

LABEL_16:
LABEL_29:

      char v44 = [v23 addRemappedRecordWithScopedIdentifier:v17 realScopedIdentifier:v18 error:a11];
      id v38 = v53;
      goto LABEL_51;
    }
    if (!_CPLSilentLogging)
    {
      id v30 = __CPLTaskOSLogDomain_611();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        Class v61 = a5;
        __int16 v62 = 2112;
        id v63 = v17;
        char v31 = "<%@ %@> has been remapped and should not even be here to begin with. Fixing cloud cache";
        v32 = v30;
        os_log_type_t v33 = OS_LOG_TYPE_ERROR;
        goto LABEL_12;
      }
LABEL_13:
    }
LABEL_14:
    id v34 = [(objc_class *)a5 newDeleteChangeWithScopedIdentifier:v17];
    [v19 addRecord:v34];
    goto LABEL_15;
  }
  char v52 = v23;
  id v27 = v19;
  v28 = [v55 transactionClientCacheView];
  int v29 = [v28 hasRecordWithScopedIdentifier:v25];

  if (v29)
  {
    id v19 = v27;
    id v53 = v21;
    v23 = v52;
    if (!_CPLSilentLogging)
    {
      id v30 = __CPLTaskOSLogDomain_611();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        Class v61 = a5;
        __int16 v62 = 2112;
        id v63 = v17;
        char v31 = "Got a remapped <%@ %@> too late, so we will need to delete it in the client";
        v32 = v30;
        os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
LABEL_12:
        _os_log_impl(&dword_1B4CAC000, v32, v33, v31, buf, 0x16u);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (!_CPLSilentLogging)
  {
    id v35 = __CPLTaskOSLogDomain_611();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      Class v61 = a5;
      __int16 v62 = 2112;
      id v63 = v17;
      __int16 v64 = 2112;
      __int16 v65 = v18;
      __int16 v66 = 2112;
      id v67 = v25;
      _os_log_impl(&dword_1B4CAC000, v35, OS_LOG_TYPE_DEFAULT, "<%@ %@> had been remapped to %@ but we believed %@ was already pointing to this cloud identifier. Which is wrong. Doing a normal remap here", buf, 0x2Au);
    }
  }
  id v58 = 0;
  char v36 = [v20 removeMappingForCloudScopedIdentifier:v18 error:&v58];
  id v37 = v58;
  if (v36)
  {

    id v19 = v27;
    v23 = v52;
    goto LABEL_23;
  }
  id v19 = v27;
  if (!_CPLSilentLogging)
  {
    long long v47 = __CPLTaskOSLogDomain_611();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      Class v61 = v18;
      __int16 v62 = 2112;
      id v63 = v37;
      _os_log_impl(&dword_1B4CAC000, v47, OS_LOG_TYPE_ERROR, "Can't reset mapping for %@: %@", buf, 0x16u);
    }
  }
  char v44 = 0;
  id v38 = v21;
  v23 = v52;
LABEL_51:

  return v44;
}

+ (BOOL)mingleChangeBatch:(id)a3 scope:(id)a4 forStore:(id)a5 onPutBatchInPullQueue:(id)a6 error:(id *)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [v14 cloudCache];
  if (!_CPLSilentLogging)
  {
    id v17 = __CPLTaskOSLogDomain_611();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v12;
      _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEBUG, "Processing %@", buf, 0xCu);
    }
  }
  id v25 = 0;
  uint64_t v18 = [v16 cloudChangeBatchFromBatch:v12 usingMapping:0 isFinal:0 withError:&v25];
  id v19 = v25;
  id v20 = v19;
  if (v18)
  {
    id v24 = v19;
    char v21 = [a1 _applyMingledBatch:v18 scope:v13 forStore:v14 onPutBatchInPullQueue:v15 error:&v24];
    id v22 = v24;

    id v20 = v22;
    if (!a7) {
      goto LABEL_11;
    }
  }
  else
  {
    char v21 = 0;
    if (!a7) {
      goto LABEL_11;
    }
  }
  if ((v21 & 1) == 0) {
    *a7 = v20;
  }
LABEL_11:

  return v21;
}

+ (BOOL)_applyMingledBatch:(id)a3 scope:(id)a4 forStore:(id)a5 onPutBatchInPullQueue:(id)a6 error:(id *)a7
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  id v10 = a4;
  id v11 = a5;
  v69 = (uint64_t (**)(id, id, id *))a6;
  v102[0] = 0;
  v102[1] = v102;
  v102[2] = 0x2020000000;
  char v103 = 0;
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x2020000000;
  char v101 = 0;
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __82__CPLMingleUtility__applyMingledBatch_scope_forStore_onPutBatchInPullQueue_error___block_invoke;
  v95[3] = &unk_1E60A6DB8;
  v98 = v102;
  v99 = v100;
  id v72 = v11;
  id v96 = v72;
  id v67 = v10;
  id v97 = v67;
  id v73 = (unsigned int (**)(void))MEMORY[0x1BA994060](v95);
  v70 = [v72 cloudCache];
  uint64_t v71 = [v72 idMapping];
  if (v74)
  {
    if (![v74 count])
    {
      id v15 = 0;
LABEL_7:
      id v17 = v74;
      if (!_CPLSilentLogging)
      {
        uint64_t v18 = __CPLTaskOSLogDomain_611();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v106 = v74;
          _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEBUG, "Applying to cloud cache %@", buf, 0xCu);
        }

        id v17 = v74;
      }
      id v93 = v15;
      int v16 = [v70 applyBatch:v17 isFinal:0 direction:2 withError:&v93];
      id v14 = v93;

      if (!v16) {
        goto LABEL_81;
      }
      if (![v74 count])
      {
        LOBYTE(v16) = 1;
        goto LABEL_84;
      }
      id v63 = [v72 downloadQueue];
      id v19 = [v72 scopes];
      id v64 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v90[0] = MEMORY[0x1E4F143A8];
      v90[1] = 3221225472;
      v90[2] = __82__CPLMingleUtility__applyMingledBatch_scope_forStore_onPutBatchInPullQueue_error___block_invoke_2;
      v90[3] = &unk_1E60A9290;
      id v61 = v20;
      id v91 = v61;
      id v66 = v19;
      id v92 = v66;
      __int16 v62 = (unsigned int (**)(void, void))MEMORY[0x1BA994060](v90);
      long long v88 = 0u;
      long long v89 = 0u;
      long long v87 = 0u;
      long long v86 = 0u;
      id obj = v74;
      uint64_t v21 = [obj countByEnumeratingWithState:&v86 objects:v111 count:16];
      if (v21)
      {
        uint64_t v23 = *(void *)v87;
        *(void *)&long long v22 = 138412802;
        long long v60 = v22;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v87 != v23) {
              objc_enumerationMutation(obj);
            }
            id v25 = *(void **)(*((void *)&v86 + 1) + 8 * i);
            int v26 = (void *)MEMORY[0x1BA993DF0]();
            if ([v25 supportsResources] && v73[2]())
            {
              id v27 = [v25 scopedIdentifier];
              uint64_t v28 = [v27 scopeIdentifier];

              if (([v64 containsObject:v28] & 1) == 0
                && ((unsigned int (**)(void, void *))v62)[2](v62, v28))
              {
                if (([v25 isDelete] & 1) != 0
                  || [v25 hasChangeType:2] && (objc_msgSend(v25, "inTrash") & 1) != 0
                  || objc_msgSend(v25, "isFullRecord", v60)
                  && ([v25 resources],
                      int v29 = objc_claimAutoreleasedReturnValue(),
                      BOOL v30 = [v29 count] == 0,
                      v29,
                      !v30))
                {
                  objc_msgSend(v64, "addObject:", v28, (void)v60);
                }
              }
            }
            char v31 = objc_msgSend(v25, "scopedIdentifier", (void)v60);
            char v85 = 0;
            if ([v25 supportsResources]
              && (([v25 hasChangeType:8] & 1) != 0 || objc_msgSend(v25, "isDelete")))
            {
              v32 = [v71 localScopedIdentifierForCloudScopedIdentifier:v31 isFinal:&v85];
              if (v32)
              {
                id v84 = v14;
                char v33 = [v63 removeAllBackgroundDownloadTasksForItemWithScopedIdentifier:v32 error:&v84];
                id v34 = v84;

                if (v33)
                {
                  int v35 = 1;
                }
                else
                {
                  if (!_CPLSilentLogging)
                  {
                    char v36 = __CPLTaskOSLogDomain_611();
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                    {
                      id v37 = objc_opt_class();
                      *(_DWORD *)buf = v60;
                      id v106 = v37;
                      __int16 v107 = 2112;
                      v108 = v32;
                      __int16 v109 = 2112;
                      id v110 = v34;
                      id v38 = v37;
                      _os_log_impl(&dword_1B4CAC000, v36, OS_LOG_TYPE_ERROR, "Can't remove background download tasks for <%@ %@> from queue: %@", buf, 0x20u);
                    }
                  }
                  int v35 = 0;
                }
                id v14 = v34;
              }
              else
              {
                int v35 = 1;
              }
            }
            else
            {
              int v35 = 1;
            }

            if (!v35)
            {
              id v42 = obj;
LABEL_77:
              id v49 = v14;
              goto LABEL_78;
            }
          }
          uint64_t v21 = [obj countByEnumeratingWithState:&v86 objects:v111 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      if ([v64 count])
      {
        if (!_CPLSilentLogging)
        {
          int v39 = __CPLTaskOSLogDomain_611();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            char v40 = [v64 allObjects];
            id v41 = [v40 componentsJoinedByString:@","];
            *(_DWORD *)buf = 138543362;
            id v106 = v41;
            _os_log_impl(&dword_1B4CAC000, v39, OS_LOG_TYPE_DEFAULT, "Tentatively consider %{public}@ have moved under quota", buf, 0xCu);
          }
        }
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        id v42 = v64;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v80 objects:v104 count:16];
        if (v43)
        {
          uint64_t v44 = *(void *)v81;
          do
          {
            for (uint64_t j = 0; j != v43; ++j)
            {
              if (*(void *)v81 != v44) {
                objc_enumerationMutation(v42);
              }
              long long v46 = [v66 scopeWithIdentifier:*(void *)(*((void *)&v80 + 1) + 8 * j)];
              if (v46)
              {
                long long v47 = [v66 sharingScopeForScope:v46];
                if (v47)
                {
                  id v79 = v14;
                  char v48 = [v66 setValue:0 forFlag:2 forScope:v47 error:&v79];
                  id v49 = v79;

                  if ((v48 & 1) == 0)
                  {

                    goto LABEL_78;
                  }
                }
                else
                {
                  id v49 = v14;
                }
                id v78 = v49;
                int v50 = [v66 setValue:0 forFlag:2 forScope:v46 error:&v78];
                id v14 = v78;

                if (!v50) {
                  goto LABEL_77;
                }
              }
            }
            uint64_t v43 = [v42 countByEnumeratingWithState:&v80 objects:v104 count:16];
          }
          while (v43);
        }
      }
      uint64_t v51 = [v66 busyStateForScope:v67];
      char v52 = v72;
      if (v51)
      {
        if (!_CPLSilentLogging)
        {
          id v53 = __CPLTaskOSLogDomain_611();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v106 = v67;
            _os_log_impl(&dword_1B4CAC000, v53, OS_LOG_TYPE_DEFAULT, "Tentatively consider %@ is not busy any more", buf, 0xCu);
          }
        }
        id v77 = v14;
        int v54 = [v66 storeBusyState:0 forScope:v67 error:&v77];
        id v49 = v77;

        if (!v54)
        {
LABEL_79:
          LOBYTE(v16) = 0;
          goto LABEL_80;
        }
        id v55 = [v66 sharingScopeForScope:v67];
        if (v55)
        {
          id v76 = v49;
          int v56 = [v66 storeBusyState:0 forScope:v55 error:&v76];
          id v14 = v76;

          if (!v56)
          {
            LOBYTE(v16) = 0;
            id v49 = v14;
LABEL_80:

            id v14 = v49;
            goto LABEL_81;
          }
        }
        else
        {
          id v14 = v49;
        }
        char v52 = v72;
      }
      id v58 = [v52 pullQueue];
      id v75 = v14;
      LOBYTE(v16) = [v58 appendChangeBatch:obj error:&v75];
      id v49 = v75;

      if (_CPLSilentLogging) {
        char v59 = 1;
      }
      else {
        char v59 = v16;
      }
      if (v59) {
        goto LABEL_80;
      }
      id v42 = __CPLTaskOSLogDomain_611();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v106 = v49;
        _os_log_impl(&dword_1B4CAC000, v42, OS_LOG_TYPE_ERROR, "Can't put batch in pull queue: %@", buf, 0xCu);
      }
LABEL_78:

      goto LABEL_79;
    }
    id v94 = 0;
    int v12 = v69[2](v69, v74, &v94);
    id v13 = v94;
    id v14 = v13;
    if (v12)
    {
      id v15 = v13;
      goto LABEL_7;
    }
    LOBYTE(v16) = 0;
  }
  else
  {
    LOBYTE(v16) = 0;
    id v14 = 0;
  }
LABEL_81:
  if (a7 && (v16 & 1) == 0)
  {
    id v14 = v14;
    LOBYTE(v16) = 0;
    *a7 = v14;
  }
LABEL_84:

  _Block_object_dispose(v100, 8);
  _Block_object_dispose(v102, 8);

  return v16;
}

uint64_t __82__CPLMingleUtility__applyMingledBatch_scope_forStore_onPutBatchInPullQueue_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = 1;
    v3 = [*(id *)(a1 + 32) pushRepository];
    v4 = [*(id *)(a1 + 40) scopeIdentifier];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 hasChangesInScopeWithIdentifier:v4] ^ 1;
  }
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

uint64_t __82__CPLMingleUtility__applyMingledBatch_scope_forStore_onPutBatchInPullQueue_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (!v4)
  {
    v5 = [*(id *)(a1 + 40) scopeWithIdentifier:v3];
    if (v5)
    {
      v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "valueForFlag:forScope:", 2, v5));
    }
    else
    {
      v4 = (void *)MEMORY[0x1E4F1CC28];
    }
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }
  uint64_t v6 = [v4 BOOLValue];

  return v6;
}

@end