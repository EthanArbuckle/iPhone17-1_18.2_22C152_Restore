@interface MCMCommandOperationReclaimDiskSpace
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)_removeItemOrMoveToTempAtURL:(id)a3 error:(id *)a4;
- (BOOL)asynchronously;
- (BOOL)preflightClientAllowed;
- (MCMCommandOperationReclaimDiskSpace)initWithAsynchronously:(BOOL)a3 context:(id)a4 resultPromise:(id)a5;
- (MCMCommandOperationReclaimDiskSpace)initWithAsynchronously:(BOOL)a3 context:(id)a4 resultPromise:(id)a5 handoffForReply:(id)a6;
- (MCMCommandOperationReclaimDiskSpace)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMCommandOperationReclaimDiskSpace)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5 asyncResultPromise:(id)a6;
- (MCMReply)handoffReply;
- (MCMXPCMessage)message;
- (void)_deleteContainersAtDeathRowURL:(id)a3 error:(id *)a4;
- (void)_deleteContainersOnDeathRowWithCompletion:(id)a3;
- (void)execute;
@end

@implementation MCMCommandOperationReclaimDiskSpace

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoffReply, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

- (BOOL)asynchronously
{
  return self->_asynchronously;
}

- (MCMReply)handoffReply
{
  return self->_handoffReply;
}

- (MCMXPCMessage)message
{
  return self->_message;
}

- (void)_deleteContainersOnDeathRowWithCompletion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  uint64_t v23 = 0;
  v24 = (id *)&v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3634;
  v27 = __Block_byref_object_dispose__3635;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3634;
  v21 = __Block_byref_object_dispose__3635;
  id v22 = 0;
  id v5 = containermanager_copy_global_configuration();
  BOOL v6 = [v5 dispositionForContainerClass:2] == 1;

  if (v6)
  {
    v7 = [(MCMCommand *)self context];
    v8 = [v7 userIdentityCache];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __81__MCMCommandOperationReclaimDiskSpace__deleteContainersOnDeathRowWithCompletion___block_invoke;
    v16[3] = &unk_1E6A7F9C8;
    v16[4] = self;
    v16[5] = &v17;
    v16[6] = &v23;
    [v8 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v16];
  }
  id v9 = containermanager_copy_global_configuration();
  BOOL v10 = [v9 dispositionForContainerClass:1] == 1;

  if (v10)
  {
    uint64_t v11 = +[MCMContainerClassDeletedPath deletedGlobalURL];
    v12 = (void *)v18[5];
    v18[5] = v11;

    uint64_t v13 = v18[5];
    v14 = v24;
    id obj = v24[5];
    [(MCMCommandOperationReclaimDiskSpace *)self _deleteContainersAtDeathRowURL:v13 error:&obj];
    objc_storeStrong(v14 + 5, obj);
  }
  if (v4) {
    ((void (**)(id, id))v4)[2](v4, v24[5]);
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
}

void __81__MCMCommandOperationReclaimDiskSpace__deleteContainersOnDeathRowWithCompletion___block_invoke(void *a1, uint64_t a2)
{
  obj[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v3 = +[MCMContainerClassDeletedPath deletedURLWithUserIdentity:a2];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  BOOL v6 = (void *)a1[4];
  uint64_t v7 = *(void *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v8 = *(void *)(a1[6] + 8);
  obj[0] = *(id *)(v8 + 40);
  [v6 _deleteContainersAtDeathRowURL:v7 error:obj];
  objc_storeStrong((id *)(v8 + 40), obj[0]);
}

- (void)_deleteContainersAtDeathRowURL:(id)a3 error:(id *)a4
{
  v27 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__3634;
  v44 = __Block_byref_object_dispose__3635;
  id v45 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__3634;
  v38 = __Block_byref_object_dispose__3635;
  id v39 = 0;
  BOOL v6 = MCMSharedDeathrowQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__MCMCommandOperationReclaimDiskSpace__deleteContainersAtDeathRowURL_error___block_invoke;
  block[3] = &unk_1E6A80108;
  v32 = &v40;
  id v28 = v5;
  id v31 = v28;
  v33 = &v34;
  dispatch_sync(v6, block);

  if ([(id)v41[5] count])
  {
    uint64_t v7 = container_log_handle_for_category();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v8 = (void *)v41[5];
    *(_DWORD *)buf = 138412290;
    id v52 = v8;
    id v9 = "Preparing to delete: %@";
  }
  else
  {
    uint64_t v7 = container_log_handle_for_category();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v52 = v28;
    id v9 = "There are no items staged for delete at %@.";
  }
  _os_log_impl(&dword_1D7739000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
LABEL_7:

  BOOL v10 = (void *)v41[5];
  if (v10)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v11 = v10;
    v12 = 0;
    uint64_t v13 = [v11 countByEnumeratingWithState:&v47 objects:v46 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v48;
      do
      {
        uint64_t v15 = 0;
        v16 = v12;
        do
        {
          if (*(void *)v48 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void **)(*((void *)&v47 + 1) + 8 * v15);
          uint64_t v29 = v16;
          BOOL v18 = -[MCMCommandOperationReclaimDiskSpace _removeItemOrMoveToTempAtURL:error:](self, "_removeItemOrMoveToTempAtURL:error:", v17, &v29, v27);
          v12 = v29;

          if (!v18)
          {
            uint64_t v19 = container_log_handle_for_category();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v20 = [v17 path];
              uint64_t v21 = v35[5];
              *(_DWORD *)buf = 138412546;
              id v52 = v20;
              __int16 v53 = 2112;
              uint64_t v54 = v21;
              _os_log_error_impl(&dword_1D7739000, v19, OS_LOG_TYPE_ERROR, "Failed to destroy item at %@: %@", buf, 0x16u);
            }
          }
          ++v15;
          v16 = v12;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v47 objects:v46 count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v22 = [(id)v35[5] domain];
    if ([v22 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      BOOL v23 = [(id)v35[5] code] == 2;

      if (v23)
      {
        v12 = 0;
        goto LABEL_29;
      }
    }
    else
    {
    }
    v24 = [MCMError alloc];
    v12 = [(MCMError *)v24 initWithNSError:v35[5] url:v28 defaultErrorType:28];
    uint64_t v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = [v28 path];
      uint64_t v26 = v35[5];
      *(_DWORD *)buf = 138412546;
      id v52 = v25;
      __int16 v53 = 2112;
      uint64_t v54 = v26;
      _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Failed to get items for deletion at %@: %@", buf, 0x16u);
    }
  }

  if (v27 && v12)
  {
    v12 = v12;
    id *v27 = v12;
  }
LABEL_29:

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);
}

void __76__MCMCommandOperationReclaimDiskSpace__deleteContainersAtDeathRowURL_error___block_invoke(void *a1)
{
  obj[1] = *(id *)MEMORY[0x1E4F143B8];
  v2 = +[MCMFileManager defaultManager];
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(a1[6] + 8);
  obj[0] = *(id *)(v4 + 40);
  uint64_t v5 = [v2 urlsForItemsInDirectoryAtURL:v3 error:obj];
  objc_storeStrong((id *)(v4 + 40), obj[0]);
  uint64_t v6 = *(void *)(a1[5] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)_removeItemOrMoveToTempAtURL:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = 1;
  uint64_t v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/tmp" isDirectory:1];
  uint64_t v8 = +[MCMFileManager defaultManager];
  id v26 = 0;
  char v9 = [v8 removeItemAtURL:v5 error:&v26];
  id v10 = v26;

  if (v9) {
    goto LABEL_4;
  }
  uint64_t v11 = [v10 domain];
  if ([v11 isEqualToString:*MEMORY[0x1E4F28798]])
  {
    uint64_t v12 = [v10 code];

    if (v12 == 2)
    {
LABEL_4:
      uint64_t v13 = 0;
      goto LABEL_16;
    }
  }
  else
  {
  }
  uint64_t v14 = container_log_handle_for_category();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v22 = [v5 path];
    *(_DWORD *)buf = 138412546;
    id v28 = v22;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_debug_impl(&dword_1D7739000, v14, OS_LOG_TYPE_DEBUG, "Couldn't remove, so moving item to /tmp: %@ : %@", buf, 0x16u);
  }
  uint64_t v15 = +[MCMFileManager defaultManager];
  v16 = [v5 lastPathComponent];
  uint64_t v17 = [v7 URLByAppendingPathComponent:v16];
  id v25 = v10;
  char v18 = [v15 moveItemIfExistsAtURL:v5 toURL:v17 error:&v25];
  id v19 = v25;

  if (v18)
  {
    uint64_t v13 = 0;
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v13 = [[MCMError alloc] initWithNSError:v19 url:v5 defaultErrorType:17];
    v20 = container_log_handle_for_category();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      BOOL v23 = [v5 path];
      v24 = [v7 path];
      *(_DWORD *)buf = 138412802;
      id v28 = v23;
      __int16 v29 = 2112;
      id v30 = v24;
      __int16 v31 = 2112;
      id v32 = v19;
      _os_log_error_impl(&dword_1D7739000, v20, OS_LOG_TYPE_ERROR, "Failed to move dir %@ to %@: %@", buf, 0x20u);
    }
    BOOL v6 = 0;
    if (a4 && v13)
    {
      uint64_t v13 = v13;
      BOOL v6 = 0;
      *a4 = v13;
    }
  }
  id v10 = v19;
LABEL_16:

  return v6;
}

- (void)execute
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  uint64_t v4 = [(MCMCommand *)self resultPromise];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  char v18 = __46__MCMCommandOperationReclaimDiskSpace_execute__block_invoke;
  id v19 = &unk_1E6A805F0;
  v20 = self;
  id v21 = v4;
  id v5 = v4;
  BOOL v6 = (void *)MEMORY[0x1D9479020](&v16);
  if ([(MCMCommandOperationReclaimDiskSpace *)self asynchronously])
  {
    id v7 = MCMSharedSlowWorkloop();
    id v8 = v6;
    char v9 = v7;
    MEMORY[0x1D9479910]();
    *(void *)&long long block = MEMORY[0x1E4F143A8];
    *((void *)&block + 1) = 3221225472;
    BOOL v23 = __MCMRunTransactionalTask_block_invoke;
    v24 = &unk_1E6A80868;
    id v25 = v8;
    id v10 = v8;
    dispatch_async(v9, &block);
  }
  else
  {
    uint64_t v11 = [(MCMCommandOperationReclaimDiskSpace *)self handoffReply];

    if (!v11)
    {
      char v9 = MCMSharedSlowWorkloop();
      dispatch_async_and_wait(v9, v6);
      goto LABEL_8;
    }
    uint64_t v12 = container_log_handle_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = [(MCMCommand *)self context];
      uint64_t v15 = [v14 clientIdentity];
      LODWORD(block) = 138412290;
      *(void *)((char *)&block + 4) = v15;
      _os_log_debug_impl(&dword_1D7739000, v12, OS_LOG_TYPE_DEBUG, "Reply to reclaim handed off to the slow workloop for client [%@]", (uint8_t *)&block, 0xCu);
    }
    char v9 = [(MCMCommandOperationReclaimDiskSpace *)self handoffReply];
    id v10 = [(MCMCommand *)self context];
    uint64_t v13 = [v10 clientIdentity];
    [v9 handoffToSlowWorkloopforClientIdentity:v13 withBlock:v6];
  }
LABEL_8:
}

void __46__MCMCommandOperationReclaimDiskSpace_execute__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = +[MCMTestLocks sharedInstance];
  [v2 waitOnLock:9];

  uint64_t v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MCMCommandOperationReclaimDiskSpace_execute__block_invoke_2;
  v4[3] = &unk_1E6A7F9A0;
  v4[4] = v3;
  id v5 = *(id *)(a1 + 40);
  [v3 _deleteContainersOnDeathRowWithCompletion:v4];
}

void __46__MCMCommandOperationReclaimDiskSpace_execute__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v13 = [[MCMResultBase alloc] initWithError:v3];

  uint64_t v4 = [*(id *)(a1 + 32) message];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = containermanager_copy_global_configuration();
    if ([v6 runmode] == 2)
    {
    }
    else
    {
      id v7 = containermanager_copy_global_configuration();
      int v8 = [v7 runmode];

      if (v8 != 3) {
        goto LABEL_8;
      }
    }
    char v9 = objc_msgSend(*(id *)(a1 + 32), "message", v13);
    id v10 = [*(id *)(a1 + 32) context];
    uint64_t v11 = +[MCMCommand relayToPrivilegedDaemonMessage:v9 context:v10];

    if (!v3)
    {
      uint64_t v12 = v11;

      uint64_t v13 = v12;
    }
  }
LABEL_8:
  objc_msgSend(*(id *)(a1 + 40), "completeWithResult:", v13, v13);
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  id v3 = [v2 clientIdentity];

  uint64_t v4 = [v3 codeSignInfo];
  id v5 = [v4 entitlements];

  if ([v5 allowed] & 1) != 0 || (objc_msgSend(v5, "canDelete")) {
    char v6 = 1;
  }
  else {
    char v6 = [v5 canManageUserManagedAssets];
  }

  return v6;
}

- (MCMCommandOperationReclaimDiskSpace)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  return [(MCMCommandOperationReclaimDiskSpace *)self initWithMessage:a3 context:a4 reply:a5 asyncResultPromise:0];
}

- (MCMCommandOperationReclaimDiskSpace)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5 asyncResultPromise:(id)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MCMCommandOperationReclaimDiskSpace;
  uint64_t v12 = [(MCMCommand *)&v15 initWithMessage:v10 context:a4 reply:v11];
  uint64_t v13 = v12;
  if (v12)
  {
    v12->_asynchronously = 0;
    objc_storeStrong((id *)&v12->_handoffReply, a5);
    objc_storeStrong((id *)&v13->_message, a3);
  }

  return v13;
}

- (MCMCommandOperationReclaimDiskSpace)initWithAsynchronously:(BOOL)a3 context:(id)a4 resultPromise:(id)a5
{
  return [(MCMCommandOperationReclaimDiskSpace *)self initWithAsynchronously:a3 context:a4 resultPromise:a5 handoffForReply:0];
}

- (MCMCommandOperationReclaimDiskSpace)initWithAsynchronously:(BOOL)a3 context:(id)a4 resultPromise:(id)a5 handoffForReply:(id)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)MCMCommandOperationReclaimDiskSpace;
  uint64_t v12 = [(MCMCommand *)&v16 initWithContext:a4 resultPromise:a5];
  uint64_t v13 = v12;
  if (v12)
  {
    v12->_asynchronously = a3;
    message = v12->_message;
    v12->_message = 0;

    objc_storeStrong((id *)&v13->_handoffReply, a6);
  }

  return v13;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 4;
}

@end