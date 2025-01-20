@interface ASDJobManager
- (ASDJobManager)init;
- (ASDJobManager)initWithOptions:(id)a3;
- (id)_mapAllJobsToIDs;
- (void)_applyUpdates:(void *)a3 usingBlock:;
- (void)_connectToDaemon;
- (void)_getJobsWithIDs:(void *)a3 usingBlock:;
- (void)_invalidate;
- (void)_sendJobsChanged:(uint64_t)a1;
- (void)_sendJobsCompleted:(uint64_t)a1;
- (void)_sendProgressUpdated:(uint64_t)a1;
- (void)addJobObserver:(id)a3;
- (void)applicationInstallsDidChange:(id)a3;
- (void)cancelJobsWithIDs:(id)a3 completionBlock:(id)a4;
- (void)dealloc;
- (void)didChangeJobs:(id)a3;
- (void)didCompleteJobs:(id)a3 finalPhases:(id)a4;
- (void)didUpdateProgress:(id)a3;
- (void)didUpdateStates:(id)a3;
- (void)finishJobs:(id)a3;
- (void)getJobsUsingBlock:(id)a3;
- (void)getJobsWithIDs:(id)a3 usingBlock:(id)a4;
- (void)invalidate;
- (void)pauseJobsWithIDs:(id)a3 completionBlock:(id)a4;
- (void)removeJobObserver:(id)a3;
- (void)resumeJobsWithIDs:(id)a3 completionBlock:(id)a4;
@end

@implementation ASDJobManager

- (ASDJobManager)init
{
  v3 = objc_alloc_init(ASDJobManagerOptions);
  v4 = [(ASDJobManager *)self initWithOptions:v3];

  return v4;
}

- (ASDJobManager)initWithOptions:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)ASDJobManager;
  v5 = [(ASDJobManager *)&v33 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.appstoredaemon.ASDJobManager.access", v6);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.appstoredaemon.ASDJobManager.observer", v9);
    observerQueue = v5->_observerQueue;
    v5->_observerQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.appstoredaemon.ASDJobManager.xpc", v12);
    xpcQueue = v5->_xpcQueue;
    v5->_xpcQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = objc_opt_new();
    jobs = v5->_jobs;
    v5->_jobs = (NSArray *)v15;

    uint64_t v17 = [v4 copy];
    options = v5->_options;
    v5->_options = (ASDJobManagerOptions *)v17;

    v19 = SecTaskCreateFromSelf(0);
    if (v19)
    {
      v20 = v19;
      CFErrorRef error = 0;
      CFTypeRef v21 = SecTaskCopyValueForEntitlement(v19, @"com.apple.private.coreservices.canmaplsdatabase", &error);
      if (error) {
        CFRelease(error);
      }
      if (v21)
      {
        CFTypeID v22 = CFGetTypeID(v21);
        if (v22 == CFBooleanGetTypeID())
        {
          int Value = CFBooleanGetValue((CFBooleanRef)v21);
          CFRelease(v21);
          CFRelease(v20);
          v5->_useLaunchServicesProgress = Value != 0;
          if (Value)
          {
            v24 = [getLSApplicationWorkspaceClass() defaultWorkspace];
            [v24 addObserver:v5];
          }
          goto LABEL_12;
        }
        CFRelease(v21);
      }
      CFRelease(v20);
    }
    v5->_useLaunchServicesProgress = 0;
LABEL_12:
    v25 = v5->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__ASDJobManager_initWithOptions___block_invoke;
    block[3] = &unk_1E58B2EB8;
    v26 = v5;
    v32 = v26;
    dispatch_async(v25, block);
    objc_initWeak((id *)&error, v26);
    v27 = v5->_accessQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __33__ASDJobManager_initWithOptions___block_invoke_2;
    handler[3] = &unk_1E58B36F8;
    objc_copyWeak(&v30, (id *)&error);
    notify_register_dispatch("com.apple.appstored.daemon.launched", v26 + 8, v27, handler);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)&error);
  }
  return v5;
}

void __33__ASDJobManager_initWithOptions___block_invoke(uint64_t a1)
{
}

- (void)_connectToDaemon
{
  v35[1] = *(id *)MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (-[ASDBaseClient _clientHasEntitlement:](a1, @"com.apple.appstored.jobmanager")) {
      goto LABEL_6;
    }
    v2 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = objc_opt_class();
      id v22 = *(id *)((char *)&buf + 4);
      _os_log_error_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_ERROR, "[%{public}@]: Treating as legacy client", (uint8_t *)&buf, 0xCu);
    }
    if (-[ASDBaseClient _clientHasEntitlement:](a1, @"com.apple.itunesstored.private"))
    {
LABEL_6:
      v3 = *(void **)(a1 + 16);
      if (v3) {
        [v3 invalidate];
      }
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.appstored.xpc.jobmanager" options:0];
      v5 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v4;

      [*(id *)(a1 + 16) _setQueue:*(void *)(a1 + 80)];
      v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C7B8];
      dispatch_queue_t v7 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v8 = objc_opt_class();
      v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
      [v6 setClasses:v9 forSelector:sel_getJobsUsingReplyBlock_ argumentIndex:0 ofReply:1];

      dispatch_queue_t v10 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v11 = objc_opt_class();
      v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
      [v6 setClasses:v12 forSelector:sel_getJobsWithIDs_usingReplyBlock_ argumentIndex:0 ofReply:1];

      [v6 setClass:objc_opt_class() forSelector:sel_registerJobManagerWithOptions_replyBlock_ argumentIndex:0 ofReply:0];
      [*(id *)(a1 + 16) setRemoteObjectInterface:v6];
      dispatch_queue_t v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC64BD8];
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v15 = objc_opt_class();
      v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      [v13 setClasses:v16 forSelector:sel_didChangeJobs_ argumentIndex:0 ofReply:0];

      [*(id *)(a1 + 16) setExportedInterface:v13];
      [*(id *)(a1 + 16) setExportedObject:a1];
      objc_initWeak(&location, (id)a1);
      objc_initWeak(&from, *(id *)(a1 + 16));
      uint64_t v17 = *(void **)(a1 + 16);
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v32 = __33__ASDJobManager__setupConnection__block_invoke;
      objc_super v33 = &unk_1E58B4FF0;
      objc_copyWeak(&v34, &location);
      objc_copyWeak(v35, &from);
      [v17 setInvalidationHandler:&buf];
      v18 = *(void **)(a1 + 16);
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __33__ASDJobManager__setupConnection__block_invoke_130;
      v26 = &unk_1E58B4FF0;
      objc_copyWeak((id *)&v27, &location);
      objc_copyWeak(&v28, &from);
      [v18 setInterruptionHandler:&v23];
      [*(id *)(a1 + 16) resume];
      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)&v27);
      objc_destroyWeak(v35);
      objc_destroyWeak(&v34);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    id v19 = *(id *)(a1 + 56);
    uint64_t v20 = *(void *)(a1 + 16);
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v32 = __45__ASDJobManager__registerManagerWithOptions___block_invoke;
    objc_super v33 = &unk_1E58B4F28;
    id v21 = v19;
    id v34 = v21;
    v35[0] = (id)a1;
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __45__ASDJobManager__registerManagerWithOptions___block_invoke_39;
    v26 = &unk_1E58B2F08;
    uint64_t v27 = a1;
    [(id)a1 _call:v20 run:&buf error:&v23];
  }
}

void __33__ASDJobManager_initWithOptions___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[ASDJobManager _connectToDaemon]((uint64_t)WeakRetained);
}

- (void)dealloc
{
  if (self->_useLaunchServicesProgress)
  {
    v3 = [getLSApplicationWorkspaceClass() defaultWorkspace];
    [v3 removeObserver:self];
  }
  -[ASDJobManager _invalidate]((uint64_t)self);
  v4.receiver = self;
  v4.super_class = (Class)ASDJobManager;
  [(ASDJobManager *)&v4 dealloc];
}

- (void)_invalidate
{
  if (a1)
  {
    notify_cancel(*(_DWORD *)(a1 + 32));
    v2 = *(void **)(a1 + 16);
    if (v2)
    {
      [v2 invalidate];
      v3 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0;
    }
  }
}

- (void)addJobObserver:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__ASDJobManager_addJobObserver___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __32__ASDJobManager_addJobObserver___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (void)cancelJobsWithIDs:(id)a3 completionBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    id v10 = v9;
    uint64_t v11 = [v6 componentsJoinedByString:@", "];
    *(_DWORD *)long long buf = 138543618;
    id v19 = v9;
    __int16 v20 = 2114;
    id v21 = v11;
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: cancelJobsWithIDs: %{public}@", buf, 0x16u);
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke;
  block[3] = &unk_1E58B3510;
  void block[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(accessQueue, block);
}

void __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_2;
  v8[3] = &unk_1E58B4FA0;
  id v9 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_5;
  v6[3] = &unk_1E58B33A8;
  id v5 = *(id *)(a1 + 48);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _call:v3 run:v8 error:v6];
}

void __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_3;
  v6[3] = &unk_1E58B3358;
  id v5 = *(id *)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  [a2 cancelJobsWithIDs:v4 completionBlock:v6];
}

void __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_3(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_4;
    v5[3] = &unk_1E58B48B0;
    id v6 = v2;
    char v7 = a2;
    dispatch_async(v4, v5);
  }
}

uint64_t __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_6;
    v6[3] = &unk_1E58B2E18;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __51__ASDJobManager_cancelJobsWithIDs_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)finishJobs:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v10), "persistentID"));
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__ASDJobManager_finishJobs___block_invoke;
    block[3] = &unk_1E58B2FA8;
    void block[4] = self;
    id v14 = v6;
    id v15 = v5;
    dispatch_async(accessQueue, block);
  }
}

void __28__ASDJobManager_finishJobs___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (v2)
  {
    id v4 = *(void **)(v2 + 64);
    if (!v4)
    {
      uint64_t v5 = objc_opt_new();
      id v6 = *(void **)(v2 + 64);
      *(void *)(v2 + 64) = v5;

      id v4 = *(void **)(v2 + 64);
    }
    [v4 addObjectsFromArray:v3];
    uint64_t v7 = (void *)[*(id *)(v2 + 24) mutableCopy];
    uint64_t v8 = [*(id *)(v2 + 64) allObjects];
    [v7 removeObjectsInArray:v8];

    uint64_t v9 = [v7 copy];
    uint64_t v10 = *(void **)(v2 + 24);
    *(void *)(v2 + 24) = v9;
  }
  id v11 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 48);
  id v13 = v12;
  if (v11)
  {
    uint64_t v14 = v11[2];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __36__ASDJobManager__finishJobsWithIDs___block_invoke;
    v16[3] = &unk_1E58B4F28;
    id v17 = v12;
    long long v18 = v11;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __36__ASDJobManager__finishJobsWithIDs___block_invoke_4;
    v15[3] = &unk_1E58B2F08;
    v15[4] = v11;
    [v11 _call:v14 run:v16 error:v15];
  }
}

- (void)getJobsUsingBlock:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__ASDJobManager_getJobsUsingBlock___block_invoke;
  v7[3] = &unk_1E58B33D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __35__ASDJobManager_getJobsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __35__ASDJobManager_getJobsUsingBlock___block_invoke_2;
  uint64_t v10 = &unk_1E58B4E90;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v3;
  id v4 = &v7;
  uint64_t v5 = v4;
  if (v2)
  {
    uint64_t v6 = v2[2];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __36__ASDJobManager__getJobsUsingBlock___block_invoke;
    v15[3] = &unk_1E58B4F50;
    v15[4] = v2;
    long long v16 = v4;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __36__ASDJobManager__getJobsUsingBlock___block_invoke_4;
    v13[3] = &unk_1E58B3040;
    v13[4] = v2;
    uint64_t v14 = v16;
    objc_msgSend(v2, "_call:run:error:", v6, v15, v13, v7, v8, v9, v10);
  }
}

void __35__ASDJobManager_getJobsUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __35__ASDJobManager_getJobsUsingBlock___block_invoke_3;
    v6[3] = &unk_1E58B2E18;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __35__ASDJobManager_getJobsUsingBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getJobsWithIDs:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__ASDJobManager_getJobsWithIDs_usingBlock___block_invoke;
  block[3] = &unk_1E58B3510;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

void __43__ASDJobManager_getJobsWithIDs_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__ASDJobManager_getJobsWithIDs_usingBlock___block_invoke_2;
  v5[3] = &unk_1E58B4E90;
  id v4 = *(id *)(a1 + 48);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  -[ASDJobManager _getJobsWithIDs:usingBlock:](v2, v3, v5);
}

void __43__ASDJobManager_getJobsWithIDs_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__ASDJobManager_getJobsWithIDs_usingBlock___block_invoke_3;
    v6[3] = &unk_1E58B2E18;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __43__ASDJobManager_getJobsWithIDs_usingBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_getJobsWithIDs:(void *)a3 usingBlock:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      id v10 = [v5 componentsJoinedByString:@", "];
      *(_DWORD *)long long buf = 138543618;
      long long v19 = v8;
      __int16 v20 = 2114;
      uint64_t v21 = v10;
      _os_log_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Getting job(s) with IDs: %{public}@", buf, 0x16u);
    }
    uint64_t v11 = a1[2];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke;
    v14[3] = &unk_1E58B4FA0;
    id v15 = v5;
    long long v16 = a1;
    id v17 = v6;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_2_36;
    v12[3] = &unk_1E58B3040;
    v12[4] = a1;
    id v13 = v17;
    [a1 _call:v11 run:v14 error:v12];
  }
}

- (void)invalidate
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__ASDJobManager_invalidate__block_invoke;
  block[3] = &unk_1E58B2EB8;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

void __27__ASDJobManager_invalidate__block_invoke(uint64_t a1)
{
}

- (void)pauseJobsWithIDs:(id)a3 completionBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_opt_class();
    id v10 = v9;
    uint64_t v11 = [v6 componentsJoinedByString:@", "];
    *(_DWORD *)long long buf = 138543618;
    long long v19 = v9;
    __int16 v20 = 2114;
    uint64_t v21 = v11;
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: pauseJobsWithIDs: %{public}@", buf, 0x16u);
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke;
  block[3] = &unk_1E58B3510;
  void block[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(accessQueue, block);
}

void __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_2;
  v8[3] = &unk_1E58B4FA0;
  id v9 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_5;
  v6[3] = &unk_1E58B33A8;
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _call:v3 run:v8 error:v6];
}

void __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_3;
  v6[3] = &unk_1E58B3358;
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  [a2 pauseJobsWithIDs:v4 completionBlock:v6];
}

void __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_4;
    v5[3] = &unk_1E58B48B0;
    id v6 = v2;
    char v7 = a2;
    dispatch_async(v4, v5);
  }
}

uint64_t __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_6;
    v6[3] = &unk_1E58B2E18;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __50__ASDJobManager_pauseJobsWithIDs_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)removeJobObserver:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__ASDJobManager_removeJobObserver___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __35__ASDJobManager_removeJobObserver___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 48)) {
    return [*(id *)(*(void *)(result + 32) + 48) removeObject:*(void *)(result + 40)];
  }
  return result;
}

- (void)resumeJobsWithIDs:(id)a3 completionBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_opt_class();
    id v10 = v9;
    id v11 = [v6 componentsJoinedByString:@", "];
    *(_DWORD *)long long buf = 138543618;
    long long v19 = v9;
    __int16 v20 = 2114;
    uint64_t v21 = v11;
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: resumeJobsWithIDs: %{public}@", buf, 0x16u);
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke;
  block[3] = &unk_1E58B3510;
  void block[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(accessQueue, block);
}

void __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_2;
  v8[3] = &unk_1E58B4FA0;
  id v9 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_5;
  v6[3] = &unk_1E58B33A8;
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _call:v3 run:v8 error:v6];
}

void __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_3;
  v6[3] = &unk_1E58B3358;
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  [a2 resumeJobsWithIDs:v4 completionBlock:v6];
}

void __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_4;
    block[3] = &unk_1E58B30B8;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_6;
    v6[3] = &unk_1E58B2E18;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __51__ASDJobManager_resumeJobsWithIDs_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)didChangeJobs:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__ASDJobManager_didChangeJobs___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __31__ASDJobManager_didChangeJobs___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v23 = v3;
    __int16 v24 = 2114;
    uint64_t v25 = v4;
    id v5 = v3;
    _os_log_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@]: didChangeJobs: %{public}@", buf, 0x16u);
  }
  id v6 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) mutableCopy];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "containsObject:", v12, (void)v17) & 1) == 0)
        {
          uint64_t v13 = [v6 indexOfObject:v12];
          if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
            [v6 addObject:v12];
          }
          else {
            [v6 replaceObjectAtIndex:v13 withObject:v12];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  uint64_t v14 = [v6 copy];
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(v15 + 24);
  *(void *)(v15 + 24) = v14;

  -[ASDJobManager _sendJobsChanged:](*(void *)(a1 + 32), v6);
}

- (void)_sendJobsChanged:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 48) allObjects];
    id v5 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__ASDJobManager__sendJobsChanged___block_invoke;
    block[3] = &unk_1E58B2FA8;
    id v8 = v4;
    uint64_t v9 = a1;
    id v10 = v3;
    id v6 = v4;
    dispatch_async(v5, block);
  }
}

- (void)didCompleteJobs:(id)a3 finalPhases:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ASDJobManager_didCompleteJobs_finalPhases___block_invoke;
  block[3] = &unk_1E58B2FA8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

void __45__ASDJobManager_didCompleteJobs_finalPhases___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = v3;
    id v6 = [v4 componentsJoinedByString:@", "];
    *(_DWORD *)long long buf = 138543618;
    id v30 = v3;
    __int16 v31 = 2114;
    v32 = v6;
    _os_log_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@]: didCompleteJobs: %{public}@", buf, 0x16u);
  }
  id v7 = -[ASDJobManager _mapAllJobsToIDs](*(void *)(a1 + 32));
  id v8 = objc_opt_new();
  id v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) mutableCopy];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v16 = [v7 objectForKey:v15];
        if (v16)
        {
          [v9 removeObject:v16];
          [*(id *)(*(void *)(a1 + 32) + 64) removeObject:v16];
          [v8 addObject:v16];
          long long v17 = [*(id *)(a1 + 48) objectForKey:v15];
          long long v18 = v17;
          if (v17) {
            objc_msgSend(v16, "setPhase:", objc_msgSend(v17, "integerValue"));
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }

  uint64_t v19 = [v9 copy];
  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = *(void **)(v20 + 24);
  *(void *)(v20 + 24) = v19;

  uint64_t v22 = *(void *)(a1 + 32);
  uint64_t v23 = (void *)[v8 copy];
  -[ASDJobManager _sendJobsCompleted:](v22, v23);
}

- (id)_mapAllJobsToIDs
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v3 = *(id *)(a1 + 64);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "persistentID"));
          [v2 setObject:v8 forKey:v9];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v5);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = *(id *)(a1 + 24);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * j);
          id v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v15, "persistentID", (void)v18));
          [v2 setObject:v15 forKey:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v12);
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (void)_sendJobsCompleted:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 && [v3 count])
  {
    uint64_t v5 = [*(id *)(a1 + 48) allObjects];
    uint64_t v6 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__ASDJobManager__sendJobsCompleted___block_invoke;
    block[3] = &unk_1E58B2FA8;
    id v9 = v5;
    uint64_t v10 = a1;
    id v11 = v4;
    id v7 = v5;
    dispatch_async(v6, block);
  }
}

- (void)didUpdateProgress:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__ASDJobManager_didUpdateProgress___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __35__ASDJobManager_didUpdateProgress___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 72);
  id v3 = ASDLogHandleForCategory(13);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 138543618;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      id v10 = v8;
      _os_log_debug_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_DEBUG, "[%{public}@]: didUpdateProgress, but using LaunchServices: %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = *(void *)(a1 + 40);
      int v11 = 138543618;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      uint64_t v14 = v6;
      id v7 = v5;
      _os_log_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: didUpdateProgress: %{public}@", (uint8_t *)&v11, 0x16u);
    }
    -[ASDJobManager _applyUpdates:usingBlock:](*(void *)(a1 + 32), *(void **)(a1 + 40), &__block_literal_global_28);
  }
}

void __35__ASDJobManager_didUpdateProgress___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 doubleValue];
  objc_msgSend(v4, "setPercentComplete:");
}

- (void)_applyUpdates:(void *)a3 usingBlock:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v27 = v5;
    id v7 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v8 = *(id *)(a1 + 24);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v8);
          }
          __int16 v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v13, "persistentID", v27));
          [v7 setObject:v13 forKey:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v10);
    }

    uint64_t v15 = objc_opt_new();
    id v16 = objc_opt_new();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __42__ASDJobManager__applyUpdates_usingBlock___block_invoke;
    v29[3] = &unk_1E58B4ED8;
    id v17 = v7;
    id v30 = v17;
    id v33 = v6;
    id v18 = v15;
    id v31 = v18;
    id v19 = v16;
    id v32 = v19;
    id v5 = v27;
    [v27 enumerateKeysAndObjectsUsingBlock:v29];
    if ([v19 count])
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __42__ASDJobManager__applyUpdates_usingBlock___block_invoke_2;
      v28[3] = &unk_1E58B4F00;
      v28[4] = a1;
      -[ASDJobManager _getJobsWithIDs:usingBlock:]((void *)a1, v19, v28);
    }
    long long v20 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      long long v21 = objc_opt_class();
      *(_DWORD *)long long buf = 138543618;
      v39 = v21;
      __int16 v40 = 2114;
      id v41 = v18;
      id v22 = v21;
      _os_log_impl(&dword_19BF6A000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Sending updated jobs: %{public}@", buf, 0x16u);
    }
    long long v23 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      long long v24 = objc_opt_class();
      long long v25 = *(void **)(a1 + 24);
      *(_DWORD *)long long buf = 138543618;
      v39 = v24;
      __int16 v40 = 2114;
      id v41 = v25;
      id v26 = v24;
      _os_log_impl(&dword_19BF6A000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Our jobs are: %{public}@", buf, 0x16u);
    }
    -[ASDJobManager _sendProgressUpdated:](a1, v18);
  }
}

- (void)didUpdateStates:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__ASDJobManager_didUpdateStates___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __33__ASDJobManager_didUpdateStates___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    id v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    id v5 = v3;
    _os_log_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@]: didUpdateStates: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  -[ASDJobManager _applyUpdates:usingBlock:](*(void *)(a1 + 32), *(void **)(a1 + 40), &__block_literal_global_24_0);
}

void __33__ASDJobManager_didUpdateStates___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  objc_msgSend(v4, "setPhase:", objc_msgSend(a3, "integerValue"));
}

- (void)applicationInstallsDidChange:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__ASDJobManager_applicationInstallsDidChange___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __46__ASDJobManager_applicationInstallsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v28 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v7 = *(void **)(*(void *)(a1 + 40) + 24);
        id v8 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v9 = [v6 bundleIdentifier];
        uint64_t v10 = [v8 predicateWithFormat:@"%K == %@", @"bundleID", v9];
        uint64_t v11 = [v7 filteredArrayUsingPredicate:v10];

        uint64_t v12 = [v6 installProgress];
        [v12 fractionCompleted];
        double v14 = v13;

        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v15 = v11;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v24 != v18) {
                objc_enumerationMutation(v15);
              }
              long long v20 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              [v20 percentComplete];
              if (v14 > v21) {
                [v20 setPercentComplete:v14];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v17);
        }

        -[ASDJobManager _sendProgressUpdated:](*(void *)(a1 + 40), v15);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v3);
  }
}

- (void)_sendProgressUpdated:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 48) allObjects];
    id v5 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__ASDJobManager__sendProgressUpdated___block_invoke;
    block[3] = &unk_1E58B2FA8;
    id v8 = v4;
    uint64_t v9 = a1;
    id v10 = v3;
    id v6 = v4;
    dispatch_async(v5, block);
  }
}

void __42__ASDJobManager__applyUpdates_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKey:v9];
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id v7 = *(void **)(a1 + 40);
    id v8 = v6;
  }
  else
  {
    id v7 = *(void **)(a1 + 48);
    id v8 = v9;
  }
  [v7 addObject:v8];
}

void __42__ASDJobManager__applyUpdates_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__ASDJobManager__applyUpdates_usingBlock___block_invoke_3;
  v7[3] = &unk_1E58B2DF0;
  void v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __42__ASDJobManager__applyUpdates_usingBlock___block_invoke_3(uint64_t a1)
{
}

uint64_t __36__ASDJobManager__finishJobsWithIDs___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__ASDJobManager__finishJobsWithIDs___block_invoke_2;
  v4[3] = &unk_1E58B2EB8;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [a2 finishJobsWithIDs:v2 replyBlock:v4];
}

void __36__ASDJobManager__finishJobsWithIDs___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ASDJobManager__finishJobsWithIDs___block_invoke_3;
  block[3] = &unk_1E58B2EB8;
  void block[4] = v1;
  dispatch_async(v2, block);
}

void __36__ASDJobManager__finishJobsWithIDs___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = 0;
}

void __36__ASDJobManager__finishJobsWithIDs___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ASDJobManager__finishJobsWithIDs___block_invoke_5;
  block[3] = &unk_1E58B2EB8;
  void block[4] = v1;
  dispatch_async(v2, block);
}

void __36__ASDJobManager__finishJobsWithIDs___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = 0;
}

void __36__ASDJobManager__getJobsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__ASDJobManager__getJobsUsingBlock___block_invoke_2;
  v4[3] = &unk_1E58B3FC8;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 getJobsUsingReplyBlock:v4];
}

void __36__ASDJobManager__getJobsUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ASDJobManager__getJobsUsingBlock___block_invoke_3;
  block[3] = &unk_1E58B3510;
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

void __36__ASDJobManager__getJobsUsingBlock___block_invoke_3(uint64_t a1)
{
  id v6 = (id)[*(id *)(a1 + 32) mutableCopy];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 64) allObjects];
  [v6 removeObjectsInArray:v2];

  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __36__ASDJobManager__getJobsUsingBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ASDJobManager__getJobsUsingBlock___block_invoke_5;
  block[3] = &unk_1E58B4208;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __36__ASDJobManager__getJobsUsingBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke(void *a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_2;
  v5[3] = &unk_1E58B3FC8;
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)a1[6];
  void v5[4] = a1[5];
  id v6 = v4;
  [a2 getJobsWithIDs:v3 usingReplyBlock:v5];
}

void __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_3;
  block[3] = &unk_1E58B3510;
  void block[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

void __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138543618;
    long long v28 = v3;
    __int16 v29 = 2114;
    uint64_t v30 = v4;
    id v5 = v3;
    _os_log_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Additional jobs arrived: %{public}@", buf, 0x16u);
  }
  id v6 = (void *)[*(id *)(a1 + 40) mutableCopy];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_34;
  v25[3] = &unk_1E58B4F78;
  v25[4] = *(void *)(a1 + 32);
  id v7 = [v6 indexesOfObjectsPassingTest:v25];
  [v6 removeObjectsAtIndexes:v7];
  id v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) mutableCopy];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v8, "indexOfObject:", v14, (void)v21);
        if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
          [v8 addObject:v14];
        }
        else {
          [v8 replaceObjectAtIndex:v15 withObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v11);
  }

  uint64_t v16 = [v8 copy];
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = *(void **)(v17 + 24);
  *(void *)(v17 + 24) = v16;

  uint64_t v19 = *(void *)(a1 + 48);
  long long v20 = (void *)[v9 copy];
  (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
}

uint64_t __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_34(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) containsObject:a2];
}

void __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_2_36(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_3_37;
  block[3] = &unk_1E58B4208;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __44__ASDJobManager__getJobsWithIDs_usingBlock___block_invoke_3_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__ASDJobManager__handleInterruptedConnection___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    uint64_t v2 = result;
    result = [*(id *)(v1 + 24) count];
    if (result)
    {
      uint64_t v3 = *(void *)(v2 + 32);
      return -[ASDJobManager _connectToDaemon](v3);
    }
  }
  return result;
}

void __46__ASDJobManager__handleInvalidatedConnection___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(v1 + 16);
  if (v3 == v2)
  {
    *(void *)(v1 + 16) = 0;
  }
}

uint64_t __45__ASDJobManager__registerManagerWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__ASDJobManager__registerManagerWithOptions___block_invoke_2;
  v4[3] = &unk_1E58B4FC8;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [a2 registerJobManagerWithOptions:v2 replyBlock:v4];
}

void __45__ASDJobManager__registerManagerWithOptions___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = ASDLogHandleForCategory(13);
  uint64_t v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v16 = 138543362;
      *(void *)&void v16[4] = objc_opt_class();
      id v11 = *(id *)&v16[4];
      _os_log_impl(&dword_19BF6A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Registration completed successfully", v16, 0xCu);
    }
    uint64_t v12 = *(void *)(a1 + 32);
    double v13 = v8;
    uint64_t v10 = v13;
    if (v12)
    {
      uint64_t v14 = *(NSObject **)(v12 + 8);
      *(void *)uint64_t v16 = MEMORY[0x1E4F143A8];
      *(void *)&v16[8] = 3221225472;
      *(void *)&v16[16] = __34__ASDJobManager__updateActiveIDs___block_invoke;
      uint64_t v17 = &unk_1E58B2DF0;
      uint64_t v18 = v12;
      uint64_t v19 = v13;
      dispatch_async(v14, v16);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)uint64_t v16 = 138543618;
    *(void *)&void v16[4] = objc_opt_class();
    *(_WORD *)&v16[12] = 2114;
    *(void *)&v16[14] = v7;
    id v15 = *(id *)&v16[4];
    _os_log_error_impl(&dword_19BF6A000, v10, OS_LOG_TYPE_ERROR, "[%{public}@]: Registration failed with error: %{public}@", v16, 0x16u);
  }
}

void __45__ASDJobManager__registerManagerWithOptions___block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543618;
    id v6 = (id)objc_opt_class();
    __int16 v7 = 2114;
    id v8 = v2;
    id v4 = v6;
    _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "[%{public}@]: Registration failed with connection error: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void __34__ASDJobManager__sendJobsChanged___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        __int16 v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "jobManager:changedJobs:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __36__ASDJobManager__sendJobsCompleted___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        __int16 v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "jobManager:completedJobs:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __38__ASDJobManager__sendProgressUpdated___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        __int16 v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "jobManager:updatedProgressOfJobs:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __33__ASDJobManager__setupConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8[0]) = 0;
    _os_log_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_DEFAULT, "[ASDJobManager]: Server connection was invalidated", (uint8_t *)v8, 2u);
  }

  id v5 = v3;
  uint64_t v6 = v5;
  if (WeakRetained)
  {
    __int16 v7 = WeakRetained[1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__ASDJobManager__handleInvalidatedConnection___block_invoke;
    v8[3] = &unk_1E58B2DF0;
    void v8[4] = WeakRetained;
    id v9 = v5;
    dispatch_async(v7, v8);
  }
}

void __33__ASDJobManager__setupConnection__block_invoke_130(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_DEFAULT, "[ASDJobManager]: Server connection was interrupted", (uint8_t *)v6, 2u);
  }

  if (WeakRetained)
  {
    id v5 = WeakRetained[1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__ASDJobManager__handleInterruptedConnection___block_invoke;
    v6[3] = &unk_1E58B2EB8;
    void v6[4] = WeakRetained;
    dispatch_async(v5, v6);
  }
}

void __34__ASDJobManager__updateActiveIDs___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = v3;
    uint64_t v6 = [v4 componentsJoinedByString:@", "];
    *(_DWORD *)long long buf = 138543618;
    uint64_t v31 = v3;
    __int16 v32 = 2114;
    uint64_t v33 = v6;
    _os_log_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@]: updateActiveIDs: %{public}@", buf, 0x16u);
  }
  __int16 v7 = -[ASDJobManager _mapAllJobsToIDs](*(void *)(a1 + 32));
  long long v8 = (void *)MEMORY[0x1E4F1CA80];
  id v9 = [v7 allKeys];
  long long v10 = [v8 setWithArray:v9];

  long long v11 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
  [v10 minusSet:v11];

  uint64_t v12 = objc_opt_new();
  uint64_t v13 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) mutableCopy];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = objc_msgSend(v7, "objectForKey:", *(void *)(*((void *)&v25 + 1) + 8 * v18), (void)v25);
        if (v19)
        {
          [v13 removeObject:v19];
          [*(id *)(*(void *)(a1 + 32) + 64) removeObject:v19];
          [v12 addObject:v19];
          [v19 setPhase:4];
        }

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [v13 copy];
  uint64_t v21 = *(void *)(a1 + 32);
  long long v22 = *(void **)(v21 + 24);
  *(void *)(v21 + 24) = v20;

  uint64_t v23 = *(void *)(a1 + 32);
  long long v24 = (void *)[v12 copy];
  -[ASDJobManager _sendJobsCompleted:](v23, v24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_removedJobs, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_jobs, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end