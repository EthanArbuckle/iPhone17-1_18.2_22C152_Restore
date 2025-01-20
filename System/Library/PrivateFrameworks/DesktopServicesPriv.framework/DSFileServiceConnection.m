@interface DSFileServiceConnection
- (BOOL)_addOperationForProgress:(id)a3;
- (DSFileServiceConnection)init;
- (id)didUpdateInProgressOperationsHandler;
- (void)_reloadCurrentOperations;
- (void)_removeOperationForProgress:(id)a3;
- (void)_subscribeToProgressIfNeeded:(id)a3;
- (void)_triggerReloadCurrentOperations;
- (void)dealloc;
- (void)requestInProgressOperationsWithResponseBlock:(id)a3;
- (void)setDidUpdateInProgressOperationsHandler:(id)a3;
@end

@implementation DSFileServiceConnection

- (void)setDidUpdateInProgressOperationsHandler:(id)a3
{
}

- (void)requestInProgressOperationsWithResponseBlock:(id)a3
{
  v5 = (void (**)(id, void *, void))a3;
  v4 = (void *)[(NSMutableArray *)self->_fileOperations copy];
  v5[2](v5, v4, 0);
}

void __31__DSFileServiceConnection_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadCurrentOperations];
}

- (void)_reloadCurrentOperations
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.DesktopServicesHelper.FileService" options:4096];
  v4 = DSFileServiceXPCInterface();
  [v3 setRemoteObjectInterface:v4];

  [v3 setInterruptionHandler:&__block_literal_global_46];
  [v3 resume];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__DSFileServiceConnection__reloadCurrentOperations__block_invoke;
  v11[3] = &unk_1E698FE10;
  v6 = v5;
  v12 = v6;
  v7 = [v3 remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__DSFileServiceConnection__reloadCurrentOperations__block_invoke_13;
  v9[3] = &unk_1E698FE38;
  v9[4] = self;
  v8 = v6;
  v10 = v8;
  [v7 inProgressOperationsWithReply:v9];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  [v3 invalidate];
}

- (DSFileServiceConnection)init
{
  v21.receiver = self;
  v21.super_class = (Class)DSFileServiceConnection;
  id v2 = [(DSFileServiceConnection *)&v21 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    uint64_t v5 = objc_opt_new();
    v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    uint64_t v7 = objc_opt_new();
    v8 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v7;

    v9 = dispatch_get_global_queue(0, 0);
    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x1E4F14438], 0, 0, v9);
    v11 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v10;

    objc_initWeak(&location, v2);
    v12 = *((void *)v2 + 1);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __31__DSFileServiceConnection_init__block_invoke;
    v18 = &unk_1E698FD70;
    objc_copyWeak(&v19, &location);
    dispatch_source_set_event_handler(v12, &v15);
    dispatch_resume(*((dispatch_object_t *)v2 + 1));
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, v2, (CFNotificationCallback)OperationsUpdatedHandler, @"com.apple.DesktopServicesHelper.FileService.Update", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(v2, "_triggerReloadCurrentOperations", v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return (DSFileServiceConnection *)v2;
}

- (void)_triggerReloadCurrentOperations
{
}

void __51__DSFileServiceConnection__reloadCurrentOperations__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = LogObj(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_1D343E000, v7, OS_LOG_TYPE_ERROR, "Error fetching in-progress operations: %@", buf, 0xCu);
    }
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(a1 + 32);
          v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "url", (void)v13);
          [v11 _subscribeToProgressIfNeeded:v12];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)dealloc
{
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, self, @"com.apple.DesktopServicesHelper.FileService.Update", 0);
  dispatch_source_cancel((dispatch_source_t)self->_updateCurrentOperationsSource);
  v4.receiver = self;
  v4.super_class = (Class)DSFileServiceConnection;
  [(DSFileServiceConnection *)&v4 dealloc];
}

- (BOOL)_addOperationForProgress:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"DSFileOperationUUID"];

  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = LogObj(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v21 = 138543362;
      v22 = v6;
      _os_log_impl(&dword_1D343E000, v8, OS_LOG_TYPE_INFO, "Adding new operation for progress %{public}@", (uint8_t *)&v21, 0xCu);
    }

    uint64_t v9 = [[DSFileOperationID alloc] initWithUUID:v6];
    [v7 setOperationID:v9];

    dispatch_source_t v10 = [v4 userInfo];
    v11 = [v10 objectForKeyedSubscript:@"DSFileOperationDateStarted"];
    [v7 setDateStarted:v11];

    v12 = [v4 userInfo];
    long long v13 = [v12 objectForKeyedSubscript:@"DSFileOperationIconUTTypeIdentifier"];
    long long v14 = static_objc_cast<NSString,objc_object * {__strong}>(v13);

    if (!v14)
    {
      long long v15 = LogObj(2);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1D343E000, v15, OS_LOG_TYPE_ERROR, "Received nil UTI String for progress", (uint8_t *)&v21, 2u);
      }
    }
    id v16 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:v14 allowUndeclared:1];
    if (!v16)
    {
      v17 = LogObj(2);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = [v4 userInfo];
        id v19 = [v18 objectForKeyedSubscript:@"DSFileOperationIconUTTypeIdentifier"];
        int v21 = 138543362;
        v22 = v19;
        _os_log_impl(&dword_1D343E000, v17, OS_LOG_TYPE_ERROR, "Unable to find UTType for identifier '%{public}@', will use generic item type", (uint8_t *)&v21, 0xCu);
      }
      id v16 = (id)*MEMORY[0x1E4F44408];
    }
    [v7 setUtType:v16];
    [v7 setProgress:v4];
    [(NSMutableArray *)self->_fileOperations addObject:v7];
  }
  return v6 != 0;
}

- (void)_removeOperationForProgress:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [DSFileOperationID alloc];
  id v6 = [v4 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"DSFileOperationUUID"];
  uint64_t v8 = [(DSFileOperationID *)v5 initWithUUID:v7];

  uint64_t v9 = objc_opt_new();
  [v9 setOperationID:v8];
  dispatch_source_t v10 = LogObj(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = [v4 userInfo];
    v12 = [v11 objectForKeyedSubscript:@"DSFileOperationUUID"];
    int v13 = 138543362;
    long long v14 = v12;
    _os_log_impl(&dword_1D343E000, v10, OS_LOG_TYPE_INFO, "Removing operation for progress %{public}@", (uint8_t *)&v13, 0xCu);
  }
  [(NSMutableArray *)self->_fileOperations removeObject:v9];
}

- (void)_subscribeToProgressIfNeeded:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (NSURL *)a3;
  id v5 = [(NSMutableDictionary *)self->_progressTokenMap objectForKeyedSubscript:v4];

  if (v5)
  {
    id v6 = LogObj(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = SanitizedURL(v4);
      *(_DWORD *)buf = 138543362;
      v18 = v7;
      _os_log_impl(&dword_1D343E000, v6, OS_LOG_TYPE_DEBUG, "Already subscribed to progress for %{public}@", buf, 0xCu);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    int v13 = __56__DSFileServiceConnection__subscribeToProgressIfNeeded___block_invoke;
    long long v14 = &unk_1E698FDE8;
    objc_copyWeak(&v16, (id *)buf);
    uint64_t v8 = v4;
    uint64_t v15 = v8;
    uint64_t v9 = (void *)MEMORY[0x1D9436FC0](&v11);
    if ([(NSURL *)v8 startAccessingSecurityScopedResource])
    {
      dispatch_source_t v10 = [MEMORY[0x1E4F28F90] addSubscriberForFileURL:v8 withPublishingHandler:v9];
      if (v10) {
        [(NSMutableDictionary *)self->_progressTokenMap setObject:v10 forKeyedSubscript:v8];
      }
    }
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

id __56__DSFileServiceConnection__subscribeToProgressIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained _addOperationForProgress:v3])
    {
      [v5[2] addObject:v3];
      id v6 = [v5 didUpdateInProgressOperationsHandler];

      if (v6)
      {
        uint64_t v7 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __56__DSFileServiceConnection__subscribeToProgressIfNeeded___block_invoke_4;
        block[3] = &unk_1E698FD98;
        uint64_t v20 = v5;
        dispatch_async(v7, block);
      }
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __56__DSFileServiceConnection__subscribeToProgressIfNeeded___block_invoke_5;
      v15[3] = &unk_1E698FDC0;
      id v16 = v5;
      id v17 = v3;
      id v18 = *(id *)(a1 + 32);
      uint64_t v8 = (void *)MEMORY[0x1D9436FC0](v15);
      uint64_t v12 = (void *)MEMORY[0x1D9436FC0](v8, v9, v10, v11);
    }
    else
    {
      int v13 = [v5[3] objectForKeyedSubscript:*(void *)(a1 + 32)];
      if (v13)
      {
        [MEMORY[0x1E4F28F90] removeSubscriber:v13];
        [v5[3] setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
      }
      [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];

      uint64_t v12 = &__block_literal_global_10;
    }
  }
  else
  {
    uint64_t v12 = &__block_literal_global_0;
  }

  return v12;
}

void __56__DSFileServiceConnection__subscribeToProgressIfNeeded___block_invoke_4(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) didUpdateInProgressOperationsHandler];
  v1[2]();
}

void __56__DSFileServiceConnection__subscribeToProgressIfNeeded___block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _removeOperationForProgress:*(void *)(a1 + 40)];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 48)];
  if (v2)
  {
    [MEMORY[0x1E4F28F90] removeSubscriber:v2];
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 48) stopAccessingSecurityScopedResource];
  id v3 = [*(id *)(a1 + 32) didUpdateInProgressOperationsHandler];

  if (v3)
  {
    id v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__DSFileServiceConnection__subscribeToProgressIfNeeded___block_invoke_6;
    block[3] = &unk_1E698FD98;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(v4, block);
  }
}

void __56__DSFileServiceConnection__subscribeToProgressIfNeeded___block_invoke_6(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) didUpdateInProgressOperationsHandler];
  v1[2]();
}

void __51__DSFileServiceConnection__reloadCurrentOperations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = LogObj(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D343E000, v4, OS_LOG_TYPE_ERROR, "Error calling DSFileService: %@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)didUpdateInProgressOperationsHandler
{
  return self->_didUpdateInProgressOperationsHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didUpdateInProgressOperationsHandler, 0);
  objc_storeStrong((id *)&self->_fileOperations, 0);
  objc_storeStrong((id *)&self->_progressTokenMap, 0);
  objc_storeStrong((id *)&self->_progresses, 0);
  objc_storeStrong((id *)&self->_updateCurrentOperationsSource, 0);
}

@end