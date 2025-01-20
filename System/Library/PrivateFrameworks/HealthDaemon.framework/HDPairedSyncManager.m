@interface HDPairedSyncManager
+ (id)syncCoordinatorWithServiceName:(id)a3;
- (BOOL)permitSynchronization;
- (HDPairedSyncManager)initWithProfile:(id)a3 queue:(id)a4;
- (PSYSyncCoordinator)syncCoordinator;
- (__CFString)_typeStringForSyncSession:(__CFString *)a1;
- (id)diagnosticDescription;
- (void)dealloc;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4;
- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3;
@end

@implementation HDPairedSyncManager

- (BOOL)permitSynchronization
{
  return [(PSYSyncCoordinator *)self->_pairedSyncCoordinator syncRestriction] == 0;
}

- (HDPairedSyncManager)initWithProfile:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDPairedSyncManager;
  v8 = [(HDPairedSyncManager *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    v10 = [v6 daemon];
    uint64_t v11 = [v10 pairedSyncCoordinatorWithServiceName:@"com.apple.pairedsync.healthd"];
    pairedSyncCoordinator = v9->_pairedSyncCoordinator;
    v9->_pairedSyncCoordinator = (PSYSyncCoordinator *)v11;

    [(PSYSyncCoordinator *)v9->_pairedSyncCoordinator setDelegate:v9 queue:v9->_queue];
    uint64_t v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    unfinishedSyncSessions = v9->_unfinishedSyncSessions;
    v9->_unfinishedSyncSessions = (NSHashTable *)v13;

    v15 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v15 addObject:v9];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
  [v3 removeObject:self];

  v4.receiver = self;
  v4.super_class = (Class)HDPairedSyncManager;
  [(HDPairedSyncManager *)&v4 dealloc];
}

- (PSYSyncCoordinator)syncCoordinator
{
  return self->_pairedSyncCoordinator;
}

+ (id)syncCoordinatorWithServiceName:(id)a3
{
  return (id)[MEMORY[0x1E4F83B78] syncCoordinatorWithServiceName:a3];
}

- (__CFString)_typeStringForSyncSession:(__CFString *)a1
{
  id v3 = a2;
  objc_super v4 = v3;
  if (a1)
  {
    unint64_t v5 = [v3 syncSessionType];
    if (v5 > 2) {
      a1 = 0;
    }
    else {
      a1 = off_1E6302648[v5];
    }
  }

  return a1;
}

void __60__HDPairedSyncManager__queue_pairedSyncDidStartWithSession___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HDPairedSyncManager__queue_pairedSyncDidStartWithSession___block_invoke_2;
  block[3] = &unk_1E62F30F8;
  block[4] = v5;
  id v9 = *(id *)(a1 + 40);
  id v10 = v4;
  id v7 = v4;
  dispatch_async(v6, block);
}

void __60__HDPairedSyncManager__queue_pairedSyncDidStartWithSession___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  uint64_t v5 = v4;
  if (v1)
  {
    if (v3)
    {
      if (v4) {
        goto LABEL_4;
      }
    }
    else
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel__queue_didSendRestoreMessagesForSession_error_, v1, @"HDPairedSyncManager.m", 98, @"Invalid parameter not satisfying: %@", @"syncSession != nil" object file lineNumber description];

      if (v5)
      {
LABEL_4:
        _HKInitializeLogging();
        id v6 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v9 = v5;
          _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "failed to send restore messages: %{public}@", buf, 0xCu);
        }
      }
    }
    [v3 syncDidCompleteSending];
  }
}

void __60__HDPairedSyncManager__queue_pairedSyncDidStartWithSession___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HDPairedSyncManager__queue_pairedSyncDidStartWithSession___block_invoke_4;
  block[3] = &unk_1E62F30F8;
  block[4] = v5;
  id v9 = *(id *)(a1 + 40);
  id v10 = v4;
  id v7 = v4;
  dispatch_async(v6, block);
}

void __60__HDPairedSyncManager__queue_pairedSyncDidStartWithSession___block_invoke_4(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    [*(id *)(v1 + 32) removeObject:v3];
    _HKInitializeLogging();
    uint64_t v5 = (void *)*MEMORY[0x1E4F29FA8];
    id v6 = *MEMORY[0x1E4F29FA8];
    if (v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v10 = v5;
        uint64_t v11 = [v3 sessionIdentifier];
        v12 = [v11 UUIDString];
        int v13 = 138543618;
        v14 = v12;
        __int16 v15 = 2114;
        id v16 = v4;
        _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "sync session %{public}@ failed error: %{public}@", (uint8_t *)&v13, 0x16u);
      }
      [v3 syncDidFailWithError:v4];
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = v5;
        v8 = [v3 sessionIdentifier];
        id v9 = [v8 UUIDString];
        int v13 = 138543362;
        v14 = v9;
        _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "sync session %{public}@ complete", (uint8_t *)&v13, 0xCu);
      }
      [v3 syncDidComplete];
    }
  }
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2(queue);
  id v7 = v6;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = -[HDPairedSyncManager _typeStringForSyncSession:]((__CFString *)self, v7);
    uint64_t v11 = [v7 sessionIdentifier];
    v12 = [v11 UUIDString];
    int v13 = [v7 pairedDevice];
    v14 = objc_msgSend(v13, "hd_shortDescription");
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2114;
    v22 = v14;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%@ %{public}@ did start for device %{public}@", buf, 0x20u);
  }
  [(NSHashTable *)self->_unfinishedSyncSessions addObject:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v16 = [WeakRetained nanoSyncManager];
  uint64_t v17 = [v7 pairedDevice];
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __60__HDPairedSyncManager__queue_pairedSyncDidStartWithSession___block_invoke;
  v22 = &unk_1E62F5D48;
  v23 = self;
  id v24 = v7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__HDPairedSyncManager__queue_pairedSyncDidStartWithSession___block_invoke_3;
  v19[3] = &unk_1E62F5D48;
  v19[4] = self;
  id v18 = v24;
  id v20 = v18;
  [v16 pairedSyncDidBeginForDevice:v17 messagesSentHandler:buf completion:v19];
}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    v8 = -[HDPairedSyncManager _typeStringForSyncSession:]((__CFString *)self, v5);
    id v9 = [v5 sessionIdentifier];
    id v10 = [v9 UUIDString];
    int v11 = 138412546;
    v12 = v8;
    __int16 v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_INFO, "%@ %{public}@ was invalidated", (uint8_t *)&v11, 0x16u);
  }
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    pairedSyncCoordinator = self->_pairedSyncCoordinator;
    id v6 = v4;
    uint64_t v7 = [(PSYSyncCoordinator *)pairedSyncCoordinator syncRestriction];
    v8 = @"limit push";
    if (v7 != 1) {
      v8 = 0;
    }
    if (!v7) {
      v8 = @"none";
    }
    id v9 = v8;
    int v10 = 138412290;
    int v11 = v9;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "sync restriction changed to %@", (uint8_t *)&v10, 0xCu);
  }
}

- (id)diagnosticDescription
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E78] string];
  if (self)
  {
    uint64_t v4 = [(PSYSyncCoordinator *)self->_pairedSyncCoordinator syncRestriction];
    id v5 = @"limit push";
    if (v4 != 1) {
      id v5 = 0;
    }
    if (!v4) {
      id v5 = @"none";
    }
  }
  else
  {
    id v5 = 0;
  }
  [v3 appendFormat:@"\n\tSync Restriction: %@", v5];
  id v6 = [(NSHashTable *)self->_unfinishedSyncSessions allObjects];
  if ([v6 count])
  {
    [v3 appendFormat:@"\n\tUnfinished Sync Sessions:"];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v18 = v6;
    id obj = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(obj);
          }
          int v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v12 = [v11 sessionIdentifier];
          __int16 v13 = [v12 UUIDString];
          v14 = -[HDPairedSyncManager _typeStringForSyncSession:]((__CFString *)self, v11);
          uint64_t v15 = [v11 pairedDevice];
          id v16 = objc_msgSend(v15, "hd_shortDescription");
          [v3 appendFormat:@"\n\t\t%@ (%@): %@", v13, v14, v16];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    id v6 = v18;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unfinishedSyncSessions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);

  objc_storeStrong((id *)&self->_pairedSyncCoordinator, 0);
}

@end