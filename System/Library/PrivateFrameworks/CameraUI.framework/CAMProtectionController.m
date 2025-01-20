@interface CAMProtectionController
+ (BOOL)isCameraPerformingHighPriorityDiskActivity;
+ (id)pathForProtectNebulaDaemonWritesIndicator;
- (CAMProtectionController)init;
- (NSCountedSet)_persistenceProtectionInflightRequestsByType;
- (NSMutableDictionary)_burstProcessingProtectionFileDescriptorsByIdentifier;
- (NSMutableDictionary)_persistenceProtectionFileDescriptorsByType;
- (NSMutableSet)_nebulaDaemonWriteProtectionInflightIdentifiers;
- (OS_dispatch_queue)_protectionQueue;
- (id)_burstProcessingProtectionPathForIdentifier:(id)a3;
- (id)_persistenceProtectionPathForType:(int64_t)a3;
- (int)_burstProcessingProtectionFileDescriptorForIdentifier:(id)a3;
- (int)_nebulaDaemonWriteProtectionFileDescriptor;
- (int)_persistenceProtectionFileDescriptorForType:(int64_t)a3;
- (int64_t)_persistenceProtectionTypeForRequest:(id)a3;
- (void)_addBurstProcessingProtectionIndicatorForIdentifier:(id)a3;
- (void)_addPersistenceProtectionIndicatorForType:(int64_t)a3 logIdentifier:(id)a4;
- (void)_allowSuspensionWhileFileLockedForPath:(id)a3;
- (void)_protectionQueueAbortProtectionForBurstProcessing;
- (void)_protectionQueueAbortProtectionForNebulaDaemonWritesForReason:(id)a3;
- (void)_protectionQueueAbortProtectionForProtectionTypes;
- (void)_protectionQueueRemoveBurstProcessingProtectionIndicatorForIdentifier:(id)a3;
- (void)_protectionQueueRemovePersistenceProtectionIndicatorForType:(int64_t)a3 unlinkFile:(BOOL)a4 logIdentifier:(id)a5;
- (void)_protectionQueueStartProtectingNebulaDaemonWritesForIdentifier:(id)a3;
- (void)_protectionQueueStartProtectingPersistenceForType:(int64_t)a3 logIdentifier:(id)a4;
- (void)_protectionQueueStopProtectingNebulaDaemonWritesForIdentifier:(id)a3 closeFile:(BOOL)a4;
- (void)_protectionQueueStopProtectingPersistenceForType:(int64_t)a3 logIdentifier:(id)a4;
- (void)abortOutstandingNebulaDaemonWriteProtectionsForReason:(id)a3;
- (void)dealloc;
- (void)startProtectingBurstProcessingForIdentifier:(id)a3;
- (void)startProtectingNebulaDaemonWritesForIdentifier:(id)a3;
- (void)startProtectingPersistenceForRequest:(id)a3;
- (void)stopProtectingBurstProcessingForIdentifier:(id)a3;
- (void)stopProtectingNebulaDaemonWritesForIdentifier:(id)a3;
- (void)stopProtectingPersistenceForRequest:(id)a3;
@end

@implementation CAMProtectionController

- (CAMProtectionController)init
{
  v12.receiver = self;
  v12.super_class = (Class)CAMProtectionController;
  v2 = [(CAMProtectionController *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.camera.crash-protection", v3);
    protectionQueue = v2->__protectionQueue;
    v2->__protectionQueue = (OS_dispatch_queue *)v4;

    v6 = [(CAMProtectionController *)v2 _protectionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31__CAMProtectionController_init__block_invoke;
    block[3] = &unk_263FA0208;
    v7 = v2;
    v11 = v7;
    dispatch_sync(v6, block);

    v8 = v7;
  }

  return v2;
}

- (OS_dispatch_queue)_protectionQueue
{
  return self->__protectionQueue;
}

void __31__CAMProtectionController_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F08760]);
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_queue_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 48);
  *(void *)(v12 + 48) = v11;

  *(_DWORD *)(*(void *)(a1 + 32) + 8) = -1;
}

- (void)startProtectingPersistenceForRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CAMProtectionController *)self _protectionQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __64__CAMProtectionController_startProtectingPersistenceForRequest___block_invoke;
    v6[3] = &unk_263FA0408;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

void __64__CAMProtectionController_startProtectingPersistenceForRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _persistenceProtectionTypeForRequest:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) persistenceUUID];
  [v3 _protectionQueueStartProtectingPersistenceForType:v2 logIdentifier:v4];
}

- (int64_t)_persistenceProtectionTypeForRequest:(id)a3
{
  return [a3 type] == 1;
}

- (void)_protectionQueueStartProtectingPersistenceForType:(int64_t)a3 logIdentifier:(id)a4
{
  id v9 = a4;
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  id v7 = [(CAMProtectionController *)self _persistenceProtectionInflightRequestsByType];
  uint64_t v8 = [v7 countForObject:v6];
  [v7 addObject:v6];
  if (!v8) {
    [(CAMProtectionController *)self _addPersistenceProtectionIndicatorForType:a3 logIdentifier:v9];
  }
}

- (NSCountedSet)_persistenceProtectionInflightRequestsByType
{
  return self->__persistenceProtectionInflightRequestsByType;
}

- (void)_addPersistenceProtectionIndicatorForType:(int64_t)a3 logIdentifier:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [NSNumber numberWithInteger:a3];
  uint64_t v8 = [(CAMProtectionController *)self _persistenceProtectionPathForType:a3];
  if ([(CAMProtectionController *)self _persistenceProtectionFileDescriptorForType:a3] < 0)
  {
    id v10 = v8;
    uint64_t v11 = open((const char *)[v10 fileSystemRepresentation], 2721, 438);
    if ((v11 & 0x80000000) != 0)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      v13 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v24 = v6;
        __int16 v25 = 2048;
        double v26 = *(double *)&a3;
        _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "ProtectionController %{public}@: Couldn't setup protection indicator for type %ld, triggering crash recovery!", buf, 0x16u);
      }

      v22 = [MEMORY[0x263F5DB40] sharedSystemLibraryAssetsdClient];
      v14 = [v22 libraryClient];
      [v14 recoverFromCrashIfNeeded];

      sleep(1u);
      id v15 = v10;
      uint64_t v11 = open((const char *)[v15 fileSystemRepresentation], 2721, 438);
      if ((v11 & 0x80000000) != 0)
      {
        do
        {
          double v16 = CFAbsoluteTimeGetCurrent();
          v17 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            id v24 = v6;
            __int16 v25 = 2048;
            double v26 = *(double *)&a3;
            __int16 v27 = 2048;
            double v28 = v16 - Current;
            _os_log_impl(&dword_2099F8000, v17, OS_LOG_TYPE_DEFAULT, "ProtectionController %{public}@: Couldn't setup protection indicator for type %ld, waiting for crash recovery (elapsed time %.1f seconds)!", buf, 0x20u);
          }

          sleep(1u);
          uint64_t v18 = open((const char *)[v15 fileSystemRepresentation], 2721, 438);
        }
        while ((v18 & 0x80000000) != 0);
        uint64_t v11 = v18;
      }
      double v19 = CFAbsoluteTimeGetCurrent();
      v20 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v24 = v6;
        __int16 v25 = 2048;
        double v26 = v19 - Current;
        _os_log_impl(&dword_2099F8000, v20, OS_LOG_TYPE_DEFAULT, "ProtectionController %{public}@: Completed crash recovery (took %.3f seconds)", buf, 0x16u);
      }
    }
    [(CAMProtectionController *)self _allowSuspensionWhileFileLockedForPath:v10];
    id v9 = [(CAMProtectionController *)self _persistenceProtectionFileDescriptorsByType];
    v21 = [NSNumber numberWithInt:v11];
    [v9 setObject:v21 forKey:v7];
  }
  else
  {
    id v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v24 = v6;
      __int16 v25 = 2048;
      double v26 = *(double *)&a3;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "ProtectionController %{public}@: Ignoring attempt to add persistence protection for type %ld, protection already exists.", buf, 0x16u);
    }
  }
}

- (id)_persistenceProtectionPathForType:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = [MEMORY[0x263F5DB20] photoDataDirectory];
    id v4 = v3;
    id v5 = @"takingvideo";
    goto LABEL_5;
  }
  if (!a3)
  {
    uint64_t v3 = [MEMORY[0x263F5DB20] photoDataDirectory];
    id v4 = v3;
    id v5 = @"takingphoto";
LABEL_5:
    id v6 = [v3 stringByAppendingPathComponent:v5];

    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:
  return v6;
}

- (int)_persistenceProtectionFileDescriptorForType:(int64_t)a3
{
  id v4 = [(CAMProtectionController *)self _persistenceProtectionFileDescriptorsByType];
  id v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKey:v5];

  if (v6) {
    int v7 = [v6 intValue];
  }
  else {
    int v7 = -1;
  }

  return v7;
}

- (NSMutableDictionary)_persistenceProtectionFileDescriptorsByType
{
  return self->__persistenceProtectionFileDescriptorsByType;
}

- (void)stopProtectingPersistenceForRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CAMProtectionController *)self _protectionQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __63__CAMProtectionController_stopProtectingPersistenceForRequest___block_invoke;
    v6[3] = &unk_263FA0408;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

void __63__CAMProtectionController_stopProtectingPersistenceForRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _persistenceProtectionTypeForRequest:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) persistenceUUID];
  [v3 _protectionQueueStopProtectingPersistenceForType:v2 logIdentifier:v4];
}

- (void)_protectionQueueStopProtectingPersistenceForType:(int64_t)a3 logIdentifier:(id)a4
{
  id v8 = a4;
  id v6 = [NSNumber numberWithInteger:a3];
  id v7 = [(CAMProtectionController *)self _persistenceProtectionInflightRequestsByType];
  [v7 removeObject:v6];
  if (![v7 countForObject:v6]) {
    [(CAMProtectionController *)self _protectionQueueRemovePersistenceProtectionIndicatorForType:a3 unlinkFile:1 logIdentifier:v8];
  }
}

- (void)_protectionQueueRemovePersistenceProtectionIndicatorForType:(int64_t)a3 unlinkFile:(BOOL)a4 logIdentifier:(id)a5
{
  BOOL v5 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = [NSNumber numberWithInteger:a3];
  int v10 = [(CAMProtectionController *)self _persistenceProtectionFileDescriptorForType:a3];
  if (v10 < 0)
  {
    v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543618;
      id v15 = v8;
      __int16 v16 = 2048;
      int64_t v17 = a3;
      _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "ProtectionController %{public}@: Ignoring attempt to remove persistence protection for type %ld, protection doesn't exist.", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    int v11 = v10;
    if (v5)
    {
      id v12 = [(CAMProtectionController *)self _persistenceProtectionPathForType:a3];
      unlink((const char *)[v12 fileSystemRepresentation]);
    }
    flock(v11, 8);
    close(v11);
    v13 = [(CAMProtectionController *)self _persistenceProtectionFileDescriptorsByType];
    [v13 removeObjectForKey:v9];
  }
}

- (void)dealloc
{
  uint64_t v3 = [(CAMProtectionController *)self _protectionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__CAMProtectionController_dealloc__block_invoke;
  block[3] = &unk_263FA0208;
  void block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)CAMProtectionController;
  [(CAMProtectionController *)&v4 dealloc];
}

uint64_t __34__CAMProtectionController_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _protectionQueueAbortProtectionForProtectionTypes];
  [*(id *)(a1 + 32) _protectionQueueAbortProtectionForBurstProcessing];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _protectionQueueAbortProtectionForNebulaDaemonWritesForReason:@"ProtectionController dealloc"];
}

- (void)_protectionQueueAbortProtectionForProtectionTypes
{
  uint64_t v3 = [(CAMProtectionController *)self _persistenceProtectionFileDescriptorsByType];
  objc_super v4 = [v3 allKeys];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __76__CAMProtectionController__protectionQueueAbortProtectionForProtectionTypes__block_invoke;
  v5[3] = &unk_263FA33C8;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __76__CAMProtectionController__protectionQueueAbortProtectionForProtectionTypes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 integerValue];
  objc_super v4 = [*(id *)(a1 + 32) _persistenceProtectionPathForType:v3];
  BOOL v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "ProtectionController: Aborting protection indicator for type %ld and leaving file on disk so crash recovery will be executed later: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 32) _protectionQueueRemovePersistenceProtectionIndicatorForType:v3 unlinkFile:0 logIdentifier:@"(aborting)"];
}

- (void)_allowSuspensionWhileFileLockedForPath:(id)a3
{
  char value = -1;
  id v3 = a3;
  int v4 = setxattr((const char *)[v3 UTF8String], "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0);
  if (v4 < 0)
  {
    int v5 = v4;
    int v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(CAMProtectionController *)v3 _allowSuspensionWhileFileLockedForPath:v6];
    }
  }
}

- (id)_burstProcessingProtectionPathForIdentifier:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x263F5DB30];
    id v4 = a3;
    int v5 = [v3 incomingDirectoryPath];
    int v6 = [v5 stringByAppendingPathComponent:v4];

    uint64_t v7 = [v6 stringByAppendingPathExtension:*MEMORY[0x263F5DBE8]];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (int)_burstProcessingProtectionFileDescriptorForIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(CAMProtectionController *)self _burstProcessingProtectionFileDescriptorsByIdentifier];
  int v6 = [v5 objectForKey:v4];

  if (v6) {
    int v7 = [v6 intValue];
  }
  else {
    int v7 = -1;
  }

  return v7;
}

- (void)_addBurstProcessingProtectionIndicatorForIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = v4;
  if (v4 && [v4 length])
  {
    id v6 = [(CAMProtectionController *)self _burstProcessingProtectionPathForIdentifier:v5];
    uint64_t v7 = open((const char *)[v6 fileSystemRepresentation], 2689, 438);
    if ((v7 & 0x80000000) != 0)
    {
      id v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v12 = v5;
        _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "ProtectionController: Couldn't setup protection indicator for burst identifier %{public}@!", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v8 = v7;
      id v9 = [(CAMProtectionController *)self _burstProcessingProtectionFileDescriptorsByIdentifier];
      uint64_t v10 = [NSNumber numberWithInt:v8];
      [v9 setObject:v10 forKey:v5];
    }
  }
}

- (void)_protectionQueueRemoveBurstProcessingProtectionIndicatorForIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = v4;
  if (v4 && [v4 length])
  {
    id v6 = [(CAMProtectionController *)self _burstProcessingProtectionPathForIdentifier:v5];
    int v7 = [(CAMProtectionController *)self _burstProcessingProtectionFileDescriptorForIdentifier:v5];
    if (v7 < 0)
    {
      id v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = v5;
        _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "ProtectionController: Ignoring attempt to remove burst processing protection for identifier %{public}@, protection doesn't exist.", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      int v8 = v7;
      flock(v7, 8);
      close(v8);
      id v9 = [(CAMProtectionController *)self _burstProcessingProtectionFileDescriptorsByIdentifier];
      [v9 removeObjectForKey:v5];
    }

    id v10 = v6;
    unlink((const char *)[v10 fileSystemRepresentation]);
  }
}

- (void)_protectionQueueAbortProtectionForBurstProcessing
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = [(CAMProtectionController *)self _burstProcessingProtectionFileDescriptorsByIdentifier];
  id v4 = [v3 allKeys];
  if ([v4 count])
  {
    int v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int v8 = v4;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "ProtectionController: Aborting protection of in-flight burst identifiers because the protection controller is going away: %{public}@", buf, 0xCu);
    }

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __76__CAMProtectionController__protectionQueueAbortProtectionForBurstProcessing__block_invoke;
    v6[3] = &unk_263FA1378;
    v6[4] = self;
    [v4 enumerateObjectsUsingBlock:v6];
  }
}

uint64_t __76__CAMProtectionController__protectionQueueAbortProtectionForBurstProcessing__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _protectionQueueRemoveBurstProcessingProtectionIndicatorForIdentifier:a2];
}

- (void)startProtectingBurstProcessingForIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(CAMProtectionController *)self _protectionQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__CAMProtectionController_startProtectingBurstProcessingForIdentifier___block_invoke;
  v7[3] = &unk_263FA0408;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __71__CAMProtectionController_startProtectingBurstProcessingForIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _addBurstProcessingProtectionIndicatorForIdentifier:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _protectionQueueStartProtectingPersistenceForType:0 logIdentifier:v3];
}

- (void)stopProtectingBurstProcessingForIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(CAMProtectionController *)self _protectionQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__CAMProtectionController_stopProtectingBurstProcessingForIdentifier___block_invoke;
  v7[3] = &unk_263FA0408;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __70__CAMProtectionController_stopProtectingBurstProcessingForIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _protectionQueueRemoveBurstProcessingProtectionIndicatorForIdentifier:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _protectionQueueStopProtectingPersistenceForType:0 logIdentifier:v3];
}

+ (id)pathForProtectNebulaDaemonWritesIndicator
{
  uint64_t v2 = [MEMORY[0x263F5DB20] photoDataDirectory];
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"suspendnebulad"];

  return v3;
}

+ (BOOL)isCameraPerformingHighPriorityDiskActivity
{
  id v2 = +[CAMProtectionController pathForProtectNebulaDaemonWritesIndicator];
  int v3 = open((const char *)[v2 fileSystemRepresentation], 128, 438);
  if (v3 < 0)
  {
    BOOL v5 = 0;
  }
  else
  {
    int v4 = v3;
    BOOL v5 = flock(v3, 6) != 0;
    flock(v4, 8);
    close(v4);
  }

  return v5;
}

- (void)startProtectingNebulaDaemonWritesForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(CAMProtectionController *)self _protectionQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __74__CAMProtectionController_startProtectingNebulaDaemonWritesForIdentifier___block_invoke;
    v7[3] = &unk_263FA0408;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(v5, v7);
  }
  else
  {
    id v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "ProtectionController: cannot protect nebulad writes for nil identifier", buf, 2u);
    }
  }
}

uint64_t __74__CAMProtectionController_startProtectingNebulaDaemonWritesForIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _protectionQueueStartProtectingNebulaDaemonWritesForIdentifier:*(void *)(a1 + 40)];
}

- (void)stopProtectingNebulaDaemonWritesForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(CAMProtectionController *)self _protectionQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __73__CAMProtectionController_stopProtectingNebulaDaemonWritesForIdentifier___block_invoke;
    v6[3] = &unk_263FA0408;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

uint64_t __73__CAMProtectionController_stopProtectingNebulaDaemonWritesForIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _protectionQueueStopProtectingNebulaDaemonWritesForIdentifier:*(void *)(a1 + 40) closeFile:0];
}

- (void)abortOutstandingNebulaDaemonWriteProtectionsForReason:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CAMProtectionController *)self _protectionQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__CAMProtectionController_abortOutstandingNebulaDaemonWriteProtectionsForReason___block_invoke;
  v7[3] = &unk_263FA0408;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __81__CAMProtectionController_abortOutstandingNebulaDaemonWriteProtectionsForReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _protectionQueueAbortProtectionForNebulaDaemonWritesForReason:*(void *)(a1 + 40)];
}

- (void)_protectionQueueStartProtectingNebulaDaemonWritesForIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  nebulaDaemonWriteProtectionInflightIdentifiers = self->__nebulaDaemonWriteProtectionInflightIdentifiers;
  id v5 = a3;
  uint64_t v6 = [(NSMutableSet *)nebulaDaemonWriteProtectionInflightIdentifiers count];
  [(NSMutableSet *)self->__nebulaDaemonWriteProtectionInflightIdentifiers addObject:v5];

  if (!v6)
  {
    id v7 = [(id)objc_opt_class() pathForProtectNebulaDaemonWritesIndicator];
    int nebulaDaemonWriteProtectionFileDescriptor = self->__nebulaDaemonWriteProtectionFileDescriptor;
    if ((nebulaDaemonWriteProtectionFileDescriptor & 0x80000000) == 0) {
      goto LABEL_18;
    }
    id v9 = v7;
    int v10 = open((const char *)[v9 fileSystemRepresentation], 673, 438);
    self->__int nebulaDaemonWriteProtectionFileDescriptor = v10;
    if (v10 < 0)
    {
      int v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v9;
        _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "ProtectionController: Failed to open indicator at path %{public}@", buf, 0xCu);
      }
    }
    else
    {
      [(CAMProtectionController *)self _allowSuspensionWhileFileLockedForPath:v9];
    }
    int nebulaDaemonWriteProtectionFileDescriptor = self->__nebulaDaemonWriteProtectionFileDescriptor;
    if ((nebulaDaemonWriteProtectionFileDescriptor & 0x80000000) == 0)
    {
LABEL_18:
      if (flock(nebulaDaemonWriteProtectionFileDescriptor, 2))
      {
        id v12 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v15 = v7;
          _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "ProtectionController: Failed to set exclusive lock on indicator at path %{public}@", buf, 0xCu);
        }
      }
    }
    uint64_t v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "ProtectionController: nebulad suspend", buf, 2u);
    }

    notify_post("com.apple.camera.nebulad.io.suspend");
  }
}

- (void)_protectionQueueStopProtectingNebulaDaemonWritesForIdentifier:(id)a3 closeFile:(BOOL)a4
{
  BOOL v4 = a4;
  nebulaDaemonWriteProtectionInflightIdentifiers = self->__nebulaDaemonWriteProtectionInflightIdentifiers;
  id v7 = a3;
  uint64_t v8 = [(NSMutableSet *)nebulaDaemonWriteProtectionInflightIdentifiers count];
  [(NSMutableSet *)self->__nebulaDaemonWriteProtectionInflightIdentifiers removeObject:v7];

  uint64_t v9 = [(NSMutableSet *)self->__nebulaDaemonWriteProtectionInflightIdentifiers count];
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    int nebulaDaemonWriteProtectionFileDescriptor = self->__nebulaDaemonWriteProtectionFileDescriptor;
    if ((nebulaDaemonWriteProtectionFileDescriptor & 0x80000000) == 0)
    {
      flock(nebulaDaemonWriteProtectionFileDescriptor, 8);
      if (v4)
      {
        close(self->__nebulaDaemonWriteProtectionFileDescriptor);
        self->__int nebulaDaemonWriteProtectionFileDescriptor = -1;
      }
    }
    id v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "ProtectionController: nebulad resume", v13, 2u);
    }

    notify_post("com.apple.camera.nebulad.io.resume");
  }
}

- (void)_protectionQueueAbortProtectionForNebulaDaemonWritesForReason:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NSMutableSet *)self->__nebulaDaemonWriteProtectionInflightIdentifiers allObjects];
  if ([v5 count])
  {
    uint64_t v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v9 = v4;
      __int16 v10 = 2114;
      int v11 = v5;
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "ProtectionController: Aborting protection of nebulad activity for reason \"%{public}@\". In-flight identifiers: %{public}@", buf, 0x16u);
    }

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __89__CAMProtectionController__protectionQueueAbortProtectionForNebulaDaemonWritesForReason___block_invoke;
    v7[3] = &unk_263FA1378;
    v7[4] = self;
    [v5 enumerateObjectsUsingBlock:v7];
  }
}

uint64_t __89__CAMProtectionController__protectionQueueAbortProtectionForNebulaDaemonWritesForReason___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _protectionQueueStopProtectingNebulaDaemonWritesForIdentifier:a2 closeFile:1];
}

- (NSMutableDictionary)_burstProcessingProtectionFileDescriptorsByIdentifier
{
  return self->__burstProcessingProtectionFileDescriptorsByIdentifier;
}

- (NSMutableSet)_nebulaDaemonWriteProtectionInflightIdentifiers
{
  return self->__nebulaDaemonWriteProtectionInflightIdentifiers;
}

- (int)_nebulaDaemonWriteProtectionFileDescriptor
{
  return self->__nebulaDaemonWriteProtectionFileDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__nebulaDaemonWriteProtectionInflightIdentifiers, 0);
  objc_storeStrong((id *)&self->__burstProcessingProtectionFileDescriptorsByIdentifier, 0);
  objc_storeStrong((id *)&self->__persistenceProtectionFileDescriptorsByType, 0);
  objc_storeStrong((id *)&self->__persistenceProtectionInflightRequestsByType, 0);
  objc_storeStrong((id *)&self->__protectionQueue, 0);
}

- (void)_allowSuspensionWhileFileLockedForPath:(NSObject *)a3 .cold.1(void *a1, int a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a1 lastPathComponent];
  int v6 = 138543618;
  id v7 = v5;
  __int16 v8 = 2080;
  id v9 = strerror(a2);
  _os_log_error_impl(&dword_2099F8000, a3, OS_LOG_TYPE_ERROR, "Failed to set extended attributes on path: %{public}@ with error: %s", (uint8_t *)&v6, 0x16u);
}

@end