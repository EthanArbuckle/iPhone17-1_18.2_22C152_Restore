@interface MCMDataProtectionChangeOperation
+ (BOOL)deleteUpdateFileWithContainerIdentity:(id)a3 error:(id *)a4;
+ (id)_readAndValidateDataProtectionUpdateAtURL:(id)a3 userIdentityCache:(id)a4 error:(id *)a5;
+ (id)dataProtectionChangeOperationAtURL:(id)a3 queue:(id)a4 error:(id *)a5;
+ (id)dataProtectionChangeOperationWithContainerMetadata:(id)a3 settingClass:(int)a4 retryingIfLocked:(BOOL)a5 changeType:(int)a6 queue:(id)a7;
+ (id)urlForProtectionOperationWithContainerIdentity:(id)a3;
- (BOOL)_deleteUpdateFileWithError:(id *)a3;
- (BOOL)_onQueue_deleteUpdateFileWithError:(id *)a3;
- (BOOL)_onQueue_stillMostCurrentUpdate;
- (BOOL)_onQueue_writeToDiskWithError:(id *)a3;
- (BOOL)_runChangeOperationNeedToRetry:(BOOL *)a3 error:(id *)a4;
- (BOOL)_stillMostCurrentUpdate;
- (BOOL)retried;
- (BOOL)retryIfLocked;
- (BOOL)writeToDiskWithError:(id *)a3;
- (MCMDataProtectionChangeOperation)initWithContainerMetadata:(id)a3 newClass:(int)a4 retryingIfLocked:(BOOL)a5 changeType:(int)a6 internalChangeID:(id)a7 queue:(id)a8 userIdentityCache:(id)a9;
- (MCMDataProtectionChangeOperation)initWithContainerMetadata:(id)a3 newClass:(int)a4 retryingIfLocked:(BOOL)a5 changeType:(int)a6 queue:(id)a7 userIdentityCache:(id)a8;
- (MCMMetadata)dataContainerMetadata;
- (MCMUserIdentityCache)userIdentityCache;
- (NSUUID)internalChangeID;
- (OS_dispatch_queue)queue;
- (id)completionBlock;
- (id)retryStartBlock;
- (int)changeType;
- (int)newDataProtectionClass;
- (void)performChangeOperation;
- (void)setChangeType:(int)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDataContainerMetadata:(id)a3;
- (void)setInternalChangeID:(id)a3;
- (void)setNewDataProtectionClass:(int)a3;
- (void)setRetried:(BOOL)a3;
- (void)setRetryIfLocked:(BOOL)a3;
- (void)setRetryStartBlock:(id)a3;
@end

@implementation MCMDataProtectionChangeOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_internalChangeID, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_retryStartBlock, 0);

  objc_storeStrong((id *)&self->_dataContainerMetadata, 0);
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setInternalChangeID:(id)a3
{
  p_internalChangeID = &self->_internalChangeID;

  objc_storeStrong((id *)p_internalChangeID, a3);
}

- (NSUUID)internalChangeID
{
  return self->_internalChangeID;
}

- (void)setRetried:(BOOL)a3
{
  self->_retried = a3;
}

- (BOOL)retried
{
  return self->_retried;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setRetryStartBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)retryStartBlock
{
  return self->_retryStartBlock;
}

- (void)setRetryIfLocked:(BOOL)a3
{
  self->_retryIfLocked = a3;
}

- (BOOL)retryIfLocked
{
  return self->_retryIfLocked;
}

- (void)setChangeType:(int)a3
{
  self->_changeType = a3;
}

- (int)changeType
{
  return self->_changeType;
}

- (void)setNewDataProtectionClass:(int)a3
{
  self->_newDataProtectionClass = a3;
}

- (int)newDataProtectionClass
{
  return self->_newDataProtectionClass;
}

- (void)setDataContainerMetadata:(id)a3
{
  p_dataContainerMetadata = &self->_dataContainerMetadata;

  objc_storeStrong((id *)p_dataContainerMetadata, a3);
}

- (MCMMetadata)dataContainerMetadata
{
  return self->_dataContainerMetadata;
}

- (void)performChangeOperation
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  char v49 = 0;
  id v48 = 0;
  BOOL v3 = [(MCMDataProtectionChangeOperation *)self _runChangeOperationNeedToRetry:&v49 error:&v48];
  id v4 = v48;
  if (!v3)
  {
    char v49 = 0;
    v5 = container_log_handle_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
      v7 = [v6 userIdentity];
      v8 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
      v9 = [v8 identifier];
      v10 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
      uint64_t v11 = [v10 containerClass];
      int v12 = [(MCMDataProtectionChangeOperation *)self newDataProtectionClass];
      *(_DWORD *)buf = 138413314;
      *(void *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v11;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v12;
      *(_WORD *)&buf[38] = 2112;
      id v51 = v4;
      _os_log_impl(&dword_1D7739000, v5, OS_LOG_TYPE_DEFAULT, "Operation to update protection classes for user: %@, id: %@, containerClass: %llu to class %d failed with error %@", buf, 0x30u);
    }
  }
  if (v49)
  {
    if ([(MCMDataProtectionChangeOperation *)self retryIfLocked])
    {
      v13 = container_log_handle_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = [(MCMDataProtectionChangeOperation *)self newDataProtectionClass];
        v15 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
        v16 = [v15 userIdentity];
        v17 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
        v18 = [v17 identifier];
        v19 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
        uint64_t v20 = [v19 containerClass];
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v14;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v16;
        *(_WORD *)&buf[18] = 2112;
        *(void *)&buf[20] = v18;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = v20;
        _os_log_impl(&dword_1D7739000, v13, OS_LOG_TYPE_DEFAULT, "Retrying container protection update to %d on next unlock for user: %@, id: %@, containerClass: %llu", buf, 0x26u);
      }
      v21 = (void *)gLockStateQueue;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __58__MCMDataProtectionChangeOperation_performChangeOperation__block_invoke;
      v47[3] = &unk_1E6A80730;
      v47[4] = self;
      v22 = v47;
      v23 = v21;
      MEMORY[0x1D9479910]();
      dispatch_time_t v24 = dispatch_time(0, 10000000000);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __MCMRunTransactionalTaskWithDelay_block_invoke;
      *(void *)&buf[24] = &unk_1E6A80868;
      *(void *)&buf[32] = v22;
      v25 = v22;
      dispatch_after(v24, v23, buf);

      goto LABEL_21;
    }
    if (v49)
    {
      v26 = container_log_handle_for_category();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v39 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
        v40 = [v39 userIdentity];
        v41 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
        v42 = [v41 identifier];
        v43 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
        uint64_t v44 = [v43 containerClass];
        int v45 = [(MCMDataProtectionChangeOperation *)self newDataProtectionClass];
        *(_DWORD *)buf = 138413058;
        *(void *)&buf[4] = v40;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v42;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v44;
        *(_WORD *)&buf[32] = 1024;
        *(_DWORD *)&buf[34] = v45;
        _os_log_error_impl(&dword_1D7739000, v26, OS_LOG_TYPE_ERROR, "Tried to update user: %@, id: %@, containerClass: %llu to protection class %d, but was locked and didn't retry", buf, 0x26u);
      }
    }
  }
  id v46 = v4;
  BOOL v27 = [(MCMDataProtectionChangeOperation *)self _deleteUpdateFileWithError:&v46];
  id v28 = v46;

  if (!v27)
  {
    v29 = container_log_handle_for_category();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v32 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
      v33 = [v32 userIdentity];
      v34 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
      v35 = [v34 identifier];
      v36 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
      uint64_t v37 = [v36 containerClass];
      int v38 = [(MCMDataProtectionChangeOperation *)self newDataProtectionClass];
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v35;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v37;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v38;
      _os_log_error_impl(&dword_1D7739000, v29, OS_LOG_TYPE_ERROR, "Failed to delete update file for user: %@, id: %@, containerClass: %llu, protection class %d", buf, 0x26u);
    }
  }
  v30 = [(MCMDataProtectionChangeOperation *)self completionBlock];

  if (v30)
  {
    v31 = [(MCMDataProtectionChangeOperation *)self completionBlock];
    ((void (**)(void, id))v31)[2](v31, v28);
  }
  id v4 = v28;
LABEL_21:
}

uint64_t __58__MCMDataProtectionChangeOperation_performChangeOperation__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) retried] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) retryStartBlock];

    if (v2)
    {
      BOOL v3 = [*(id *)(a1 + 32) retryStartBlock];
      v3[2]();
    }
  }
  [*(id *)(a1 + 32) setRetried:1];
  id v4 = *(void **)(a1 + 32);

  return [v4 performChangeOperation];
}

- (BOOL)_runChangeOperationNeedToRetry:(BOOL *)a3 error:(id *)a4
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__8424;
  v75 = __Block_byref_object_dispose__8425;
  id v76 = 0;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__8424;
  v69 = __Block_byref_object_dispose__8425;
  id v70 = 0;
  v5 = MCMSharedFastWorkloop();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MCMDataProtectionChangeOperation__runChangeOperationNeedToRetry_error___block_invoke;
  block[3] = &unk_1E6A80108;
  block[4] = self;
  block[5] = &v71;
  block[6] = &v65;
  dispatch_async_and_wait(v5, block);

  if (!v66[5])
  {
    v39 = container_log_handle_for_category();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
      v41 = [v40 userIdentity];
      v42 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
      v43 = [v42 identifier];
      uint64_t v44 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
      uint64_t v45 = [v44 containerClass];
      uint64_t v46 = v72[5];
      *(_DWORD *)buf = 138413058;
      v88 = v41;
      __int16 v89 = 2112;
      v90 = v43;
      __int16 v91 = 2048;
      uint64_t v92 = v45;
      __int16 v93 = 2112;
      uint64_t v94 = v46;
      _os_log_error_impl(&dword_1D7739000, v39, OS_LOG_TYPE_ERROR, "Failed to lookup container to set data protection for user identity: %@, identifier: %@, Class: %llu; %@",
        buf,
        0x2Au);
    }
LABEL_39:
    uint64_t v52 = 0;
    obuint64_t j = 0;
LABEL_40:

    BOOL v38 = 0;
    if (a4) {
      *a4 = (id) v72[5];
    }
    v61 = v52;
    goto LABEL_43;
  }
  v6 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
  v7 = [v6 containerPath];
  v8 = [(id)v66[5] containerPath];
  char v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    v47 = [[MCMError alloc] initWithErrorType:10];
    id v48 = (void *)v72[5];
    v72[5] = (uint64_t)v47;

    v39 = container_log_handle_for_category();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_WORD *)buf = 0;
    char v49 = "Cancelling data protection operation because container path changed on disk. This indicates the app may have b"
          "een updated and changed its protection level.";
LABEL_48:
    _os_log_error_impl(&dword_1D7739000, v39, OS_LOG_TYPE_ERROR, v49, buf, 2u);
    goto LABEL_39;
  }
  if (![(MCMDataProtectionChangeOperation *)self _stillMostCurrentUpdate])
  {
    v50 = [[MCMError alloc] initWithErrorType:69];
    id v51 = (void *)v72[5];
    v72[5] = (uint64_t)v50;

    v39 = container_log_handle_for_category();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_WORD *)buf = 0;
    char v49 = "Cancelling data protection operation because another more current operation on this container has taken precedence";
    goto LABEL_48;
  }
  id v10 = containermanager_copy_global_configuration();
  uint64_t v11 = [v10 appUserDataItemNames];

  int v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  obuint64_t j = v11;
  uint64_t v13 = [obj countByEnumeratingWithState:&v83 objects:v82 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v84 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        v17 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
        v18 = [v17 containerPath];
        v19 = [v18 containerDataURL];
        uint64_t v20 = [v19 URLByAppendingPathComponent:v16 isDirectory:1];

        if (v20)
        {
          [v12 addObject:v20];
        }
        else
        {
          v21 = container_log_handle_for_category();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v88 = v16;
            _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "itemURL is nil for item: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v83 objects:v82 count:16];
    }
    while (v13);
  }

  v22 = +[MCMTestLocks sharedInstance];
  [v22 waitOnLock:10];

  char v60 = [(MCMDataProtectionChangeOperation *)self changeType];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v23 = v12;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v78 objects:v77 count:16];
  v61 = v23;
  if (!v24) {
    goto LABEL_33;
  }
  uint64_t v25 = *(void *)v79;
  uint64_t v26 = *MEMORY[0x1E4F28798];
  while (2)
  {
    for (uint64_t j = 0; j != v24; ++j)
    {
      if (*(void *)v79 != v25) {
        objc_enumerationMutation(v61);
      }
      uint64_t v28 = *(void *)(*((void *)&v78 + 1) + 8 * j);
      v29 = +[MCMFileManager defaultManager];
      uint64_t v30 = [(MCMDataProtectionChangeOperation *)self newDataProtectionClass];
      id v63 = 0;
      char v31 = [v29 setDataProtectionAtURL:v28 toDataProtectionClass:v30 directoriesOnly:(v60 & 2) == 0 recursive:1 error:&v63];
      id v32 = v63;

      if ((v31 & 1) == 0)
      {
        v33 = [v32 domain];
        if ([v33 isEqualToString:v26])
        {
          BOOL v34 = [v32 code] == 1;

          if (v34)
          {
            v56 = [[MCMError alloc] initWithNSError:v32 url:v28 defaultErrorType:61];
            v57 = (void *)v72[5];
            v72[5] = (uint64_t)v56;

            *a3 = 1;
            goto LABEL_46;
          }
        }
        else
        {
        }
        v35 = [v32 domain];
        if ([v35 isEqualToString:v26] && objc_msgSend(v32, "code") == 2)
        {
        }
        else
        {
          v36 = [v32 domain];
          if (([v36 isEqualToString:v26] & 1) == 0)
          {

LABEL_45:
            v54 = [[MCMError alloc] initWithNSError:v32 url:v28 defaultErrorType:152];
            v55 = (void *)v72[5];
            v72[5] = (uint64_t)v54;

LABEL_46:
            v39 = v61;
            uint64_t v52 = v61;
            goto LABEL_40;
          }
          BOOL v37 = [v32 code] == 9;

          if (!v37) {
            goto LABEL_45;
          }
        }
      }
    }
    v23 = v61;
    uint64_t v24 = [v61 countByEnumeratingWithState:&v78 objects:v77 count:16];
    if (v24) {
      continue;
    }
    break;
  }
LABEL_33:

  BOOL v38 = 1;
LABEL_43:
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(&v71, 8);
  return v38;
}

void __73__MCMDataProtectionChangeOperation__runChangeOperationNeedToRetry_error___block_invoke(uint64_t a1)
{
  obj[1] = *(id *)MEMORY[0x1E4F143B8];
  v2 = +[MCMCommandContext privileged];
  BOOL v3 = [v2 containerCache];
  id v4 = [*(id *)(a1 + 32) dataContainerMetadata];
  v5 = [v4 containerIdentity];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  obj[0] = *(id *)(v6 + 40);
  v7 = [v3 entryForContainerIdentity:v5 error:obj];
  objc_storeStrong((id *)(v6 + 40), obj[0]);

  if (v7)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(id *)(v8 + 40);
    uint64_t v9 = [v7 metadataWithError:&v12];
    objc_storeStrong((id *)(v8 + 40), v12);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (BOOL)_deleteUpdateFileWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v5 = [(MCMDataProtectionChangeOperation *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__MCMDataProtectionChangeOperation__deleteUpdateFileWithError___block_invoke;
  v7[3] = &unk_1E6A800E0;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  dispatch_sync(v5, v7);

  LOBYTE(a3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

uint64_t __63__MCMDataProtectionChangeOperation__deleteUpdateFileWithError___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_deleteUpdateFileWithError:", *(void *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_onQueue_deleteUpdateFileWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (![(MCMDataProtectionChangeOperation *)self _onQueue_stillMostCurrentUpdate])
  {
    uint64_t v10 = container_log_handle_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      char v11 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
      uint64_t v12 = [v11 userIdentity];
      uint64_t v13 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
      uint64_t v14 = [v13 identifier];
      v15 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
      *(_DWORD *)buf = 138412802;
      v19 = v12;
      __int16 v20 = 2112;
      v21 = v14;
      __int16 v22 = 2048;
      uint64_t v23 = [v15 containerClass];
      _os_log_impl(&dword_1D7739000, v10, OS_LOG_TYPE_DEFAULT, "Nothing to delete because there is a newer update for user: %@, id: %@, containerClass: %llu", buf, 0x20u);
    }
    id v8 = 0;
    goto LABEL_8;
  }
  v5 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
  uint64_t v6 = [v5 containerIdentity];
  id v17 = 0;
  BOOL v7 = +[MCMDataProtectionChangeOperation deleteUpdateFileWithContainerIdentity:v6 error:&v17];
  id v8 = v17;

  if (v7)
  {
LABEL_8:
    BOOL v9 = 1;
    goto LABEL_9;
  }
  if (a3)
  {
    id v8 = v8;
    BOOL v9 = 0;
    *a3 = v8;
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_9:

  return v9;
}

- (BOOL)_stillMostCurrentUpdate
{
  v2 = self;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(MCMDataProtectionChangeOperation *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MCMDataProtectionChangeOperation__stillMostCurrentUpdate__block_invoke;
  block[3] = &unk_1E6A80180;
  block[4] = v2;
  block[5] = &v6;
  dispatch_sync(v3, block);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __59__MCMDataProtectionChangeOperation__stillMostCurrentUpdate__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_stillMostCurrentUpdate");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_onQueue_stillMostCurrentUpdate
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
  id v4 = [v3 containerIdentity];
  v5 = +[MCMDataProtectionChangeOperation urlForProtectionOperationWithContainerIdentity:v4];

  if (!v5)
  {
    uint64_t v8 = container_log_handle_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D7739000, v8, OS_LOG_TYPE_ERROR, "Failed to get url for storing pending operations.", buf, 2u);
    }
    goto LABEL_9;
  }
  uint64_t v6 = [(MCMDataProtectionChangeOperation *)self userIdentityCache];
  id v17 = 0;
  BOOL v7 = +[MCMDataProtectionChangeOperation _readAndValidateDataProtectionUpdateAtURL:v5 userIdentityCache:v6 error:&v17];
  uint64_t v8 = v17;

  if (!v7)
  {
    uint64_t v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = [v5 path];
      *(_DWORD *)buf = 138412546;
      v19 = v16;
      __int16 v20 = 2112;
      v21 = v8;
      _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Failed to read data protection update from %@; error = %@",
        buf,
        0x16u);
    }
LABEL_9:
    char v13 = 0;
    goto LABEL_10;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v10 = [v7 objectForKeyedSubscript:@"MCMDataOperationInternalID"];
  char v11 = (void *)[v9 initWithUUIDString:v10];

  uint64_t v12 = [(MCMDataProtectionChangeOperation *)self internalChangeID];
  char v13 = [v12 isEqual:v11];

LABEL_10:
  return v13;
}

- (BOOL)writeToDiskWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v5 = [(MCMDataProtectionChangeOperation *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__MCMDataProtectionChangeOperation_writeToDiskWithError___block_invoke;
  v7[3] = &unk_1E6A800E0;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  dispatch_sync(v5, v7);

  LOBYTE(a3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

uint64_t __57__MCMDataProtectionChangeOperation_writeToDiskWithError___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_writeToDiskWithError:", *(void *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_onQueue_writeToDiskWithError:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
  if (!v5
    || (uint64_t v6 = (void *)v5, v7 = [(MCMDataProtectionChangeOperation *)self changeType], v6, !v7))
  {
    uint64_t v30 = [[MCMError alloc] initWithErrorType:38 category:3];
    id v32 = container_log_handle_for_category();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v36 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
      *(_DWORD *)buf = 138412546;
      uint64_t v45 = v36;
      __int16 v46 = 1024;
      int v47 = [(MCMDataProtectionChangeOperation *)self changeType];
      _os_log_error_impl(&dword_1D7739000, v32, OS_LOG_TYPE_ERROR, "Invalid Update Info: metadata: %@, changeType: %u", buf, 0x12u);
    }
    uint64_t v24 = 0;
    id v17 = 0;
    id v27 = 0;
    goto LABEL_19;
  }
  BOOL v37 = a3;
  v42[0] = @"MCMDataOperationIdentifier";
  v39 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
  BOOL v38 = [v39 identifier];
  v43[0] = v38;
  v42[1] = @"MCMDataOperationContainerClass";
  uint64_t v8 = NSNumber;
  id v9 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
  uint64_t v10 = objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v9, "containerClass"));
  v43[1] = v10;
  v42[2] = @"MCMDataOperationProtectionClass";
  char v11 = objc_msgSend(NSNumber, "numberWithInt:", -[MCMDataProtectionChangeOperation newDataProtectionClass](self, "newDataProtectionClass"));
  v43[2] = v11;
  v42[3] = @"MCMDataOperationChangeType";
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MCMDataProtectionChangeOperation changeType](self, "changeType"));
  v43[3] = v12;
  v42[4] = @"MCMDataOperationRetryIfLocked";
  char v13 = objc_msgSend(NSNumber, "numberWithBool:", -[MCMDataProtectionChangeOperation retryIfLocked](self, "retryIfLocked"));
  v43[4] = v13;
  v42[5] = @"MCMDataOperationInternalID";
  uint64_t v14 = [(MCMDataProtectionChangeOperation *)self internalChangeID];
  v15 = [v14 UUIDString];
  v43[5] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:6];
  id v17 = (void *)[v16 mutableCopy];

  v18 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
  LODWORD(v14) = +[MCMUserIdentity isUserIdentityRequiredForContainerClass:](MCMUserIdentity, "isUserIdentityRequiredForContainerClass:", [v18 containerClass]);

  if (v14)
  {
    v19 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
    __int16 v20 = [v19 userIdentity];
    v21 = [v20 plist];
    [v17 setObject:v21 forKeyedSubscript:@"MCMDataOperationUserIdentity"];
  }
  uint64_t v22 = [(MCMDataProtectionChangeOperation *)self dataContainerMetadata];
  uint64_t v23 = [v22 containerIdentity];
  uint64_t v24 = +[MCMDataProtectionChangeOperation urlForProtectionOperationWithContainerIdentity:v23];

  if (!v24)
  {
    uint64_t v30 = [[MCMError alloc] initWithErrorType:84 category:1];
    id v32 = container_log_handle_for_category();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D7739000, v32, OS_LOG_TYPE_ERROR, "Failed to get url for storing pending operations.", buf, 2u);
    }
    uint64_t v24 = 0;
    id v27 = 0;
    goto LABEL_18;
  }
  uint64_t v25 = +[MCMFileManager defaultManager];
  id v41 = 0;
  char v26 = [v25 removeItemAtURL:v24 error:&v41];
  id v27 = v41;

  if (v26)
  {
    uint64_t v28 = +[MCMFileManager defaultManager];
    uint64_t v29 = [(id)v28 dataWritingOptionsForFileAtURL:v24];

    id v40 = 0;
    LOBYTE(v28) = objc_msgSend(v17, "MCM_writeToURL:withOptions:error:", v24, v29, &v40);
    id v27 = v40;
    if (v28)
    {
      uint64_t v30 = 0;
      BOOL v31 = 1;
      goto LABEL_22;
    }
    uint64_t v30 = [[MCMError alloc] initWithNSError:v27 url:v24 defaultErrorType:85];
    id v32 = container_log_handle_for_category();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    v33 = [v24 path];
    *(_DWORD *)buf = 138412290;
    uint64_t v45 = v33;
    BOOL v34 = "Failed to write data protection update dictionary to URL %@";
    goto LABEL_24;
  }
  uint64_t v30 = [[MCMError alloc] initWithNSError:v27 url:v24 defaultErrorType:36];
  id v32 = container_log_handle_for_category();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    v33 = [v24 path];
    *(_DWORD *)buf = 138412290;
    uint64_t v45 = v33;
    BOOL v34 = "Failed to remove pending data protection file at %@";
LABEL_24:
    _os_log_error_impl(&dword_1D7739000, v32, OS_LOG_TYPE_ERROR, v34, buf, 0xCu);
  }
LABEL_18:
  a3 = v37;
LABEL_19:

  if (a3)
  {
    uint64_t v30 = v30;
    BOOL v31 = 0;
    *a3 = v30;
  }
  else
  {
    BOOL v31 = 0;
  }
LABEL_22:

  return v31;
}

- (MCMDataProtectionChangeOperation)initWithContainerMetadata:(id)a3 newClass:(int)a4 retryingIfLocked:(BOOL)a5 changeType:(int)a6 queue:(id)a7 userIdentityCache:(id)a8
{
  return [(MCMDataProtectionChangeOperation *)self initWithContainerMetadata:a3 newClass:*(void *)&a4 retryingIfLocked:a5 changeType:*(void *)&a6 internalChangeID:0 queue:a7 userIdentityCache:a8];
}

- (MCMDataProtectionChangeOperation)initWithContainerMetadata:(id)a3 newClass:(int)a4 retryingIfLocked:(BOOL)a5 changeType:(int)a6 internalChangeID:(id)a7 queue:(id)a8 userIdentityCache:(id)a9
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v24 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MCMDataProtectionChangeOperation;
  v18 = [(MCMDataProtectionChangeOperation *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_dataContainerMetadata, a3);
    v19->_retryIfLocked = a5;
    p_internalChangeID = (void **)&v19->_internalChangeID;
    v19->_newDataProtectionClass = a4;
    v19->_changeType = a6;
    objc_storeStrong((id *)&v19->_internalChangeID, a7);
    objc_storeStrong((id *)&v19->_queue, a8);
    objc_storeStrong((id *)&v19->_userIdentityCache, a9);
    if (!v19->_internalChangeID)
    {
      uint64_t v21 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v22 = *p_internalChangeID;
      *p_internalChangeID = (void *)v21;
    }
  }

  return v19;
}

+ (BOOL)deleteUpdateFileWithContainerIdentity:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[MCMDataProtectionChangeOperation urlForProtectionOperationWithContainerIdentity:a3];
  if (v5)
  {
    uint64_t v6 = +[MCMFileManager defaultManager];
    id v14 = 0;
    char v7 = [v6 removeItemAtURL:v5 error:&v14];
    id v8 = v14;

    if (v7)
    {
      id v9 = 0;
      BOOL v10 = 1;
      goto LABEL_12;
    }
    id v9 = [[MCMError alloc] initWithNSError:v8 url:v5 defaultErrorType:36];
    char v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      char v13 = [v5 path];
      *(_DWORD *)buf = 138412546;
      id v16 = v13;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Failed to remove data protection file at %@ : %@", buf, 0x16u);
    }
  }
  else
  {
    id v9 = [[MCMError alloc] initWithErrorType:84];
    char v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Failed to get url for storing pending operations.", buf, 2u);
    }
    id v8 = 0;
  }

  if (a4)
  {
    id v9 = v9;
    BOOL v10 = 0;
    *a4 = v9;
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_12:

  return v10;
}

+ (id)urlForProtectionOperationWithContainerIdentity:(id)a3
{
  id v3 = a3;
  id v4 = containermanager_copy_global_configuration();
  uint64_t v5 = [v4 managedPathRegistry];
  uint64_t v6 = [v5 containermanagerPendingUpdates];

  char v7 = [v6 url];
  id v8 = NSString;
  id v9 = [v3 identifier];
  BOOL v10 = [v3 containerConfig];
  uint64_t v11 = [v10 containerClass];
  uint64_t v12 = [v3 userIdentity];

  char v13 = [v12 identifier];
  id v14 = [v8 stringWithFormat:@"%@-%llu-%@.plist", v9, v11, v13];
  v15 = [v7 URLByAppendingPathComponent:v14 isDirectory:0];

  return v15;
}

+ (id)_readAndValidateDataProtectionUpdateAtURL:(id)a3 userIdentityCache:(id)a4 error:(id *)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v14 = [[MCMError alloc] initWithErrorType:38];
    v15 = container_log_handle_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, "URL cannot be nil", buf, 2u);
    }
    goto LABEL_9;
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfURL:v7];
  if (!v9)
  {
    id v14 = [[MCMError alloc] initWithErrorType:12];
    v15 = container_log_handle_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v61 = [v7 path];
      *(_DWORD *)buf = 138412290;
      uint64_t v69 = (uint64_t)v61;
      _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, "Failed to read update info at URL %@", buf, 0xCu);
    }
LABEL_9:

    id v16 = 0;
    id v17 = 0;
    id v18 = 0;
    BOOL v10 = 0;
    goto LABEL_71;
  }
  BOOL v10 = v9;
  uint64_t v11 = [v9 objectForKeyedSubscript:@"MCMDataOperationIdentifier"];
  objc_opt_class();
  id v12 = v11;
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if (!v13)
  {
    id v14 = [[MCMError alloc] initWithErrorType:29];
    uint64_t v22 = container_log_handle_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v63 = [v10 objectForKeyedSubscript:@"MCMDataOperationIdentifier"];
      v64 = [v7 path];
      *(_DWORD *)buf = 138412546;
      uint64_t v69 = (uint64_t)v63;
      __int16 v70 = 2112;
      uint64_t v71 = v64;
      _os_log_error_impl(&dword_1D7739000, v22, OS_LOG_TYPE_ERROR, "Invalid update info Identifier: %@ at %@", buf, 0x16u);
    }
    goto LABEL_44;
  }
  uint64_t v19 = [v10 objectForKeyedSubscript:@"MCMDataOperationContainerClass"];
  objc_opt_class();
  id v20 = v19;
  if (objc_opt_isKindOfClass()) {
    id v21 = v20;
  }
  else {
    id v21 = 0;
  }

  if (v21)
  {
    uint64_t v23 = 0;
    goto LABEL_21;
  }
  id v24 = [v10 objectForKeyedSubscript:@"MCMDataOperationContainerClass"];
  uint64_t v23 = [v24 unsignedLongLongValue];

  if ((unint64_t)(v23 - 1) >= 0xE)
  {
    id v14 = [[MCMError alloc] initWithErrorType:29];
    id v40 = container_log_handle_for_category();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      uint64_t v65 = [v7 path];
      *(_DWORD *)buf = 134218242;
      uint64_t v69 = v23;
      __int16 v70 = 2112;
      uint64_t v71 = v65;
      _os_log_error_impl(&dword_1D7739000, v40, OS_LOG_TYPE_ERROR, "Invalid update info container class: %ld at %@", buf, 0x16u);
    }
LABEL_44:
    id v16 = 0;
    id v17 = 0;
LABEL_70:
    id v18 = 0;
    goto LABEL_71;
  }
LABEL_21:
  if (!+[MCMUserIdentity isUserIdentityRequiredForContainerClass:v23])
  {
    id v16 = 0;
    id v17 = 0;
    goto LABEL_29;
  }
  uint64_t v67 = 1;
  id v25 = [v10 objectForKeyedSubscript:@"MCMDataOperationUserIdentity"];
  objc_opt_class();
  id v26 = v25;
  if (objc_opt_isKindOfClass()) {
    id v17 = v26;
  }
  else {
    id v17 = 0;
  }

  if (!v17)
  {
    id v41 = [v10 objectForKeyedSubscript:@"MCMDataOperationUserId"];
    objc_opt_class();
    id v42 = v41;
    if (objc_opt_isKindOfClass()) {
      id v43 = v42;
    }
    else {
      id v43 = 0;
    }

    if (!v43)
    {
      id v14 = [[MCMError alloc] initWithErrorType:29];
      uint64_t v52 = container_log_handle_for_category();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = [v10 objectForKeyedSubscript:@"MCMDataOperationUserId"];
        v54 = [v7 path];
        *(_DWORD *)buf = 138412546;
        uint64_t v69 = (uint64_t)v53;
        __int16 v70 = 2112;
        uint64_t v71 = v54;
        v55 = "Invalid update info user id: %@ at %@";
        v56 = v52;
        uint32_t v57 = 22;
        goto LABEL_83;
      }
LABEL_69:

      id v16 = 0;
      goto LABEL_70;
    }
    id v51 = +[MCMPOSIXUser posixUserWithUID:](MCMPOSIXUser, "posixUserWithUID:", [v43 intValue]);
    id v16 = [v8 userIdentityForPersonalPersonaWithPOSIXUser:v51];

    if (v16) {
      goto LABEL_28;
    }
LABEL_62:
    id v14 = [[MCMError alloc] initWithErrorType:29];
    uint64_t v52 = container_log_handle_for_category();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = [v10 objectForKeyedSubscript:@"MCMDataOperationUserIdentity"];
      v54 = [v7 path];
      *(_DWORD *)buf = 138412802;
      uint64_t v69 = (uint64_t)v53;
      __int16 v70 = 2112;
      uint64_t v71 = v54;
      __int16 v72 = 2048;
      uint64_t v73 = v67;
      v55 = "Invalid update info user identity: %@ at %@: %llu";
      v56 = v52;
      uint32_t v57 = 32;
LABEL_83:
      _os_log_error_impl(&dword_1D7739000, v56, OS_LOG_TYPE_ERROR, v55, buf, v57);

      goto LABEL_69;
    }
    goto LABEL_69;
  }
  id v16 = +[MCMUserIdentity userIdentityWithPlist:v17 cache:v8 error:&v67];
  if (!v16) {
    goto LABEL_62;
  }
LABEL_28:
  [v10 setObject:v16 forKeyedSubscript:@"MCMDataOperationUserIdentity"];
LABEL_29:
  uint64_t v27 = [v10 objectForKeyedSubscript:@"MCMDataOperationProtectionClass"];
  objc_opt_class();
  id v28 = v27;
  if (objc_opt_isKindOfClass()) {
    id v29 = v28;
  }
  else {
    id v29 = 0;
  }

  if (!v29)
  {
    id v14 = [[MCMError alloc] initWithErrorType:29];
    v33 = container_log_handle_for_category();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    BOOL v34 = [v10 objectForKeyedSubscript:@"MCMDataOperationProtectionClass"];
    v35 = [v7 path];
    *(_DWORD *)buf = 138412546;
    uint64_t v69 = (uint64_t)v34;
    __int16 v70 = 2112;
    uint64_t v71 = v35;
    v36 = "Invalid update info protection class: %@ at %@";
LABEL_66:
    _os_log_error_impl(&dword_1D7739000, v33, OS_LOG_TYPE_ERROR, v36, buf, 0x16u);

    goto LABEL_67;
  }
  uint64_t v30 = [v10 objectForKeyedSubscript:@"MCMDataOperationChangeType"];
  objc_opt_class();
  id v31 = v30;
  if (objc_opt_isKindOfClass()) {
    id v32 = v31;
  }
  else {
    id v32 = 0;
  }

  if (!v32)
  {
    id v14 = [[MCMError alloc] initWithErrorType:29];
    v33 = container_log_handle_for_category();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    BOOL v34 = [v10 objectForKeyedSubscript:@"MCMDataOperationChangeType"];
    v35 = [v7 path];
    *(_DWORD *)buf = 138412546;
    uint64_t v69 = (uint64_t)v34;
    __int16 v70 = 2112;
    uint64_t v71 = v35;
    v36 = "Invalid update info change type: %@ at %@";
    goto LABEL_66;
  }
  BOOL v37 = [v10 objectForKeyedSubscript:@"MCMDataOperationRetryIfLocked"];
  objc_opt_class();
  id v38 = v37;
  if (objc_opt_isKindOfClass()) {
    id v39 = v38;
  }
  else {
    id v39 = 0;
  }

  if (!v39)
  {
    id v14 = [[MCMError alloc] initWithErrorType:29];
    v33 = container_log_handle_for_category();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    BOOL v34 = [v10 objectForKeyedSubscript:@"MCMDataOperationRetryIfLocked"];
    v35 = [v7 path];
    *(_DWORD *)buf = 138412546;
    uint64_t v69 = (uint64_t)v34;
    __int16 v70 = 2112;
    uint64_t v71 = v35;
    v36 = "Invalid update info retry: %@ at %@";
    goto LABEL_66;
  }
  uint64_t v44 = [v10 objectForKeyedSubscript:@"MCMDataOperationInternalID"];
  objc_opt_class();
  id v45 = v44;
  if (objc_opt_isKindOfClass()) {
    id v46 = v45;
  }
  else {
    id v46 = 0;
  }

  if (!v46)
  {
    id v14 = [[MCMError alloc] initWithErrorType:29];
    v33 = container_log_handle_for_category();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      BOOL v34 = [v10 objectForKeyedSubscript:@"MCMDataOperationInternalID"];
      v35 = [v7 path];
      *(_DWORD *)buf = 138412546;
      uint64_t v69 = (uint64_t)v34;
      __int16 v70 = 2112;
      uint64_t v71 = v35;
      v36 = "Invalid update info UUID String: %@ at %@";
      goto LABEL_66;
    }
LABEL_67:

    goto LABEL_70;
  }
  id v47 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v48 = [v10 objectForKeyedSubscript:@"MCMDataOperationInternalID"];
  char v49 = (void *)[v47 initWithUUIDString:v48];

  objc_opt_class();
  id v18 = v49;
  if (objc_opt_isKindOfClass()) {
    id v50 = v18;
  }
  else {
    id v50 = 0;
  }

  if (!v50)
  {
    id v14 = [[MCMError alloc] initWithErrorType:29];
    v62 = container_log_handle_for_category();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v66 = [v7 path];
      *(_DWORD *)buf = 138412546;
      uint64_t v69 = (uint64_t)v18;
      __int16 v70 = 2112;
      uint64_t v71 = v66;
      _os_log_error_impl(&dword_1D7739000, v62, OS_LOG_TYPE_ERROR, "Invalid update info UUID: %@ at %@", buf, 0x16u);
    }
LABEL_71:
    v58 = 0;
    if (!a5) {
      goto LABEL_74;
    }
    goto LABEL_72;
  }
  v58 = (void *)[v10 copy];
  id v14 = 0;
  if (!a5) {
    goto LABEL_74;
  }
LABEL_72:
  if (!v58) {
    *a5 = v14;
  }
LABEL_74:
  id v59 = v58;

  return v59;
}

+ (id)dataProtectionChangeOperationAtURL:(id)a3 queue:(id)a4 error:(id *)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v61 = a4;
  uint64_t v67 = 1;
  uint64_t v8 = +[MCMUserIdentitySharedCache sharedInstance];
  id v66 = 0;
  id v9 = +[MCMDataProtectionChangeOperation _readAndValidateDataProtectionUpdateAtURL:v7 userIdentityCache:v8 error:&v66];
  id v10 = v66;
  char v60 = (void *)v8;
  if (!v9)
  {
    id v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v38 = [v7 path];
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v69 = v38;
      _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Failed to read data protection update at %@", buf, 0xCu);
    }
    v15 = 0;
    id v16 = 0;
    id v17 = 0;
    v62 = 0;
    id v63 = 0;
    goto LABEL_7;
  }
  uint64_t v11 = [v9 objectForKeyedSubscript:@"MCMDataOperationUserIdentity"];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = +[MCMUserIdentityCache defaultUserIdentity];
  }
  id v20 = v13;

  id v63 = v20;
  v62 = +[MCMClientConnection privilegedClientConnectionWithUserIdentity:v20];
  id v21 = [v9 objectForKeyedSubscript:@"MCMDataOperationContainerClass"];
  uint64_t v22 = [v21 unsignedLongLongValue];

  id v23 = containermanager_copy_global_configuration();
  id v24 = [v23 staticConfig];
  v15 = [v24 configForContainerClass:v22];

  if (!v15)
  {
    id v32 = v7;
    v33 = [[MCMError alloc] initWithErrorType:20 category:3];

    id v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)uint64_t v69 = v22;
      _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Container class [%llu] in operation undefined.", buf, 0xCu);
    }
    v15 = 0;
    goto LABEL_20;
  }
  if (([v15 supportedOnPlatform] & 1) == 0)
  {
    id v32 = v7;
    v33 = [[MCMError alloc] initWithErrorType:72 category:3];

    id v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)uint64_t v69 = v22;
      _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Container class [%llu] in operation unsupported.", buf, 0xCu);
    }
LABEL_20:
    id v16 = 0;
    id v17 = 0;
    id v18 = 0;
    uint64_t v19 = 0;
    id v10 = v33;
    id v7 = v32;
    goto LABEL_21;
  }
  id v25 = [v9 objectForKeyedSubscript:@"MCMDataOperationIdentifier"];
  id v17 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v63 identifier:v25 containerConfig:v15 platform:0 userIdentityCache:v8 error:&v67];

  if (v17)
  {
    id v26 = [v62 context];
    uint64_t v27 = [v26 containerFactory];
    id v65 = v10;
    id v16 = [v27 containerForContainerIdentity:v17 createIfNecessary:0 error:&v65];
    id v28 = v65;

    if (v16)
    {
      id v58 = v7;
      id v64 = v28;
      id v18 = [v16 metadataWithError:&v64];
      id v10 = v64;

      if (v18)
      {
        id v57 = objc_alloc((Class)a1);
        id v14 = [v9 objectForKeyedSubscript:@"MCMDataOperationProtectionClass"];
        unsigned int v56 = [v14 intValue];
        uint64_t v52 = [v9 objectForKeyedSubscript:@"MCMDataOperationRetryIfLocked"];
        unsigned int v54 = [v52 BOOLValue];
        v55 = [v9 objectForKeyedSubscript:@"MCMDataOperationChangeType"];
        unsigned int v53 = [v55 intValue];
        id v29 = objc_alloc(MEMORY[0x1E4F29128]);
        uint64_t v30 = [v9 objectForKeyedSubscript:@"MCMDataOperationInternalID"];
        id v31 = (void *)[v29 initWithUUIDString:v30];
        uint64_t v19 = (void *)[v57 initWithContainerMetadata:v18 newClass:v56 retryingIfLocked:v54 changeType:v53 internalChangeID:v31 queue:v61 userIdentityCache:v60];
      }
      else
      {
        id v14 = container_log_handle_for_category();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          id v47 = [v9 objectForKeyedSubscript:@"MCMDataOperationUserId"];
          int v48 = [v47 unsignedIntValue];
          char v49 = [v9 objectForKeyedSubscript:@"MCMDataOperationIdentifier"];
          id v50 = [v9 objectForKeyedSubscript:@"MCMDataOperationContainerClass"];
          uint64_t v51 = [v50 unsignedLongLongValue];
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)uint64_t v69 = v48;
          *(_WORD *)&v69[4] = 2112;
          *(void *)&v69[6] = v49;
          *(_WORD *)&v69[14] = 2048;
          *(void *)&v69[16] = v51;
          __int16 v70 = 2048;
          uint64_t v71 = v67;
          __int16 v72 = 2112;
          id v73 = v10;
          _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Failed to get metadata for container from file userId: %u, identifier: %@, Class: %llu : %llu, %@", buf, 0x30u);
        }
        id v18 = 0;
        uint64_t v19 = 0;
      }
      id v7 = v58;
      goto LABEL_21;
    }
    id v10 = v28;
    id v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v41 = [v9 objectForKeyedSubscript:@"MCMDataOperationUserId"];
      int v42 = [v41 unsignedIntValue];
      [v9 objectForKeyedSubscript:@"MCMDataOperationIdentifier"];
      uint64_t v44 = v43 = v7;
      id v45 = [v9 objectForKeyedSubscript:@"MCMDataOperationContainerClass"];
      uint64_t v46 = [v45 unsignedLongLongValue];
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)uint64_t v69 = v42;
      *(_WORD *)&v69[4] = 2112;
      *(void *)&v69[6] = v44;
      *(_WORD *)&v69[14] = 2048;
      *(void *)&v69[16] = v46;
      __int16 v70 = 2048;
      uint64_t v71 = v67;
      __int16 v72 = 2112;
      id v73 = v10;
      _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Failed to lookup container metadata from file userId: %u, identifier: %@, Class: %llu : %llu, %@", buf, 0x30u);

      id v7 = v43;
    }
    id v16 = 0;
LABEL_7:
    id v18 = 0;
    uint64_t v19 = 0;
    goto LABEL_21;
  }
  v36 = [MCMError alloc];
  uint64_t v37 = [(MCMError *)v36 initWithErrorType:v67];

  id v14 = container_log_handle_for_category();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v39 = v67;
    uint64_t error_description = container_get_error_description();
    *(_DWORD *)buf = 134218242;
    *(void *)uint64_t v69 = v39;
    *(_WORD *)&v69[8] = 2080;
    *(void *)&v69[10] = error_description;
    _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Could not create user identity; error = (%llu)%s",
      buf,
      0x16u);
  }
  id v16 = 0;
  id v17 = 0;
  id v18 = 0;
  uint64_t v19 = 0;
  id v10 = (id)v37;
LABEL_21:

  if (a5 && !v19) {
    *a5 = v10;
  }
  id v34 = v19;

  return v34;
}

+ (id)dataProtectionChangeOperationWithContainerMetadata:(id)a3 settingClass:(int)a4 retryingIfLocked:(BOOL)a5 changeType:(int)a6 queue:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  BOOL v8 = a5;
  uint64_t v9 = *(void *)&a4;
  id v11 = a7;
  id v12 = a3;
  id v13 = objc_alloc((Class)objc_opt_class());
  id v14 = +[MCMUserIdentitySharedCache sharedInstance];
  v15 = (void *)[v13 initWithContainerMetadata:v12 newClass:v9 retryingIfLocked:v8 changeType:v7 queue:v11 userIdentityCache:v14];

  return v15;
}

@end