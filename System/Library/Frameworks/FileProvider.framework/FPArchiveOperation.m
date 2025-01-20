@interface FPArchiveOperation
+ (id)extensionForArchiveFormat:(unint64_t)a3 utType:(id *)a4;
- (BOOL)_checkNeedOfTemporaryDirectory;
- (FPArchiveOperation)initWithItems:(id)a3 destinationFolder:(id)a4;
- (id)archiveCompletionBlock;
- (id)findUniqueArchivedName:(id)a3 parent:(id)a4;
- (unint64_t)_fpToDSArchiveFormat:(unint64_t)a3;
- (unint64_t)archiveFormat;
- (void)_archiveURLForDSEnumeratedDestination:(id)a3 service:(id)a4 completionHandler:(id)a5;
- (void)_archiveURLForFPEnumeratedDestination:(id)a3 targetArchiveName:(id)a4 service:(id)a5 completionHandler:(id)a6;
- (void)_archiveURLs:(id)a3 targetArchiveName:(id)a4 completionHandler:(id)a5;
- (void)_checkNeedOfTemporaryDirectory;
- (void)_coordinateArchivedItemsWithCompletionHandler:(id)a3;
- (void)_copyArchivedItemsWithCompletionHandler:(id)a3;
- (void)_materializeDestinationFolder:(id)a3;
- (void)_prepareItemsWithCompletionHandler:(id)a3;
- (void)actionMain;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)presendNotifications;
- (void)setArchiveCompletionBlock:(id)a3;
- (void)setArchiveFormat:(unint64_t)a3;
@end

@implementation FPArchiveOperation

+ (id)extensionForArchiveFormat:(unint64_t)a3 utType:(id *)a4
{
  switch(a3)
  {
    case 0uLL:
      goto LABEL_5;
    case 1uLL:
      if (a4)
      {
        id v6 = (id)*MEMORY[0x1E4F44328];
        v7 = @"cpio";
        goto LABEL_11;
      }
      v7 = @"cpio";
      break;
    case 2uLL:
      if (a4)
      {
        id v6 = (id)*MEMORY[0x1E4F44328];
        v7 = @"cpgz";
        goto LABEL_11;
      }
      v7 = @"cpgz";
      break;
    case 3uLL:
      v11 = (id *)MEMORY[0x1E4F444E8];
      goto LABEL_10;
    case 4uLL:
      v11 = (id *)MEMORY[0x1E4F44310];
      goto LABEL_10;
    case 5uLL:
      if (a4)
      {
        id v6 = (id)*MEMORY[0x1E4F44328];
        v7 = @"aea";
LABEL_11:
        *a4 = v6;
      }
      else
      {
        v7 = @"aea";
      }
      break;
    default:
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"FPArchiveOperation.m", 168, @"No DS match for FP archive format: %ld", a3);

LABEL_5:
      v11 = (id *)MEMORY[0x1E4F44558];
LABEL_10:
      id v6 = *v11;
      v7 = [*v11 preferredFilenameExtension];
      if (a4) {
        goto LABEL_11;
      }
      break;
  }

  return v7;
}

- (FPArchiveOperation)initWithItems:(id)a3 destinationFolder:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"FPArchiveOperation.m", 181, @"no items to archive: %@", v8 object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"FPArchiveOperation.m", 182, @"Invalid parameter not satisfying: %@", @"destinationFolder" object file lineNumber description];

LABEL_3:
  v10 = [v9 providerDomainID];
  v22.receiver = self;
  v22.super_class = (Class)FPArchiveOperation;
  v11 = [(FPActionOperation *)&v22 initWithProvider:v10 action:0];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_items, a3);
    objc_storeStrong((id *)&v11->_destinationFolder, a4);
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.FileProvider.ArchiveOperation", v12);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v13;

    v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v11->_operationQueue;
    v11->_operationQueue = v15;

    [(NSOperationQueue *)v11->_operationQueue setUnderlyingQueue:v11->_queue];
    [(NSOperationQueue *)v11->_operationQueue setMaxConcurrentOperationCount:1];
    v11->_archiveFormat = 0;
    v17 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
    [(FPActionOperation *)v11 setProgress:v17];

    v18 = [(FPActionOperation *)v11 progress];
    objc_msgSend(v18, "fp_setFileOperationKind:", *MEMORY[0x1E4F28850]);
  }
  return v11;
}

- (void)_coordinateArchivedItemsWithCompletionHandler:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  v18 = +[FPItemManager defaultManager];
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__5;
  v33[4] = __Block_byref_object_dispose__5;
  id v34 = 0;
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_items, "count"));
  v4 = dispatch_group_create();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = self->_items;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v30;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v29 + 1) + 8 * v7);
        dispatch_group_enter(v4);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke;
        v25[3] = &unk_1E5AF24E8;
        id v26 = v3;
        v28 = v33;
        v27 = v4;
        [v18 fetchURLForItem:v8 completionHandler:v25];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v5);
  }

  id v9 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5AF2558;
  v24 = v33;
  id v11 = v15;
  id v23 = v11;
  id v12 = v3;
  id v20 = v12;
  v21 = self;
  id v13 = v9;
  id v22 = v13;
  dispatch_group_notify(v4, queue, block);
  v14 = [(FPActionOperation *)self progress];
  [v14 addChild:v13 withPendingUnitCount:10];

  _Block_object_dispose(v33, 8);
}

void __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  else {
    [*(id *)(a1 + 32) addObject:v7];
  }
  objc_sync_exit(v6);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
  }
  else
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
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
          v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v11 = [MEMORY[0x1E4F28C98] readingIntentWithURL:v10 options:0x20000];
          [v4 addObject:v11];
          if ([v10 startAccessingSecurityScopedResource]) {
            [v3 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v7);
    }

    id v12 = objc_opt_new();
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 480);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke_4;
    v17[3] = &unk_1E5AF2530;
    id v18 = v3;
    id v22 = *(id *)(a1 + 56);
    id v19 = *(id *)(a1 + 48);
    id v20 = v4;
    id v21 = v12;
    id v14 = v12;
    id v15 = v4;
    id v16 = v3;
    [v14 coordinateAccessWithIntents:v15 queue:v13 byAccessor:v17];
  }
}

void __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * i) stopAccessingSecurityScopedResource];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    [*(id *)(a1 + 40) setCompletedUnitCount:100];
    id v9 = objc_msgSend(*(id *)(a1 + 48), "fp_map:", &__block_literal_global_57);
    v10 = [*(id *)(a1 + 56) retainAccess];
    uint64_t v11 = *(void *)(a1 + 64);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke_7;
    v14[3] = &unk_1E5AF17D0;
    id v15 = *(id *)(a1 + 32);
    id v16 = *(id *)(a1 + 56);
    id v17 = v10;
    id v12 = *(void (**)(uint64_t, void *, void, void *))(v11 + 16);
    id v13 = v10;
    v12(v11, v9, 0, v14);
  }
}

uint64_t __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 URL];
}

uint64_t __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke_7(uint64_t a1)
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "stopAccessingSecurityScopedResource", (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) releaseAccess:*(void *)(a1 + 48)];
}

- (void)_copyArchivedItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[FPItemManager defaultManager];
  uint64_t v6 = [(NSArray *)self->_items firstObject];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__FPArchiveOperation__copyArchivedItemsWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E5AF25A8;
  id v10 = v5;
  id v11 = v4;
  v9[4] = self;
  id v7 = v5;
  id v8 = v4;
  [v7 fetchURLForItem:v6 completionHandler:v9];
}

void __62__FPArchiveOperation__copyArchivedItemsWithCompletionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    id v8 = [[FPArchiveTemporaryFolder alloc] initWithURL:v5];
    id v22 = 0;
    long long v9 = [(FPArchiveTemporaryFolder *)v8 temporaryFolderURLGetError:&v22];
    id v7 = v22;
    if (v9)
    {
      id v10 = [(FPMoveOperation *)[FPCopyOperation alloc] initWithItems:*((void *)a1[4] + 56) destinationURL:v9];
      [(FPMoveOperation *)v10 setShouldBounceOnCollision:1];
      [(FPActionOperation *)v10 setHaveStitching:0];
      [(FPMoveOperation *)v10 setLastUsageUpdatePolicy:1];
      id location = 0;
      objc_initWeak(&location, v10);
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      id v15 = __62__FPArchiveOperation__copyArchivedItemsWithCompletionHandler___block_invoke_4;
      id v16 = &unk_1E5AF2580;
      objc_copyWeak(&v20, &location);
      id v17 = v9;
      id v19 = a1[6];
      long long v18 = v8;
      [(FPActionOperation *)v10 setActionCompletionBlock:&v13];
      objc_msgSend(a1[5], "scheduleAction:", v10, v13, v14, v15, v16);
      id v11 = [a1[4] progress];
      id v12 = [(FPActionOperation *)v10 progress];
      [v11 addChild:v12 withPendingUnitCount:10];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(void))a1[6] + 2))();
    }
  }
}

void __62__FPArchiveOperation__copyArchivedItemsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (v3)
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v6 removeItemAtURL:*(void *)(a1 + 32) error:0];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [WeakRetained transferLocations];
    long long v9 = [v8 allValues];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__FPArchiveOperation__copyArchivedItemsWithCompletionHandler___block_invoke_6;
    v10[3] = &unk_1E5AF0748;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, void *, void, void *))(v7 + 16))(v7, v9, 0, v10);
  }
}

void __62__FPArchiveOperation__copyArchivedItemsWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 removeItemAtURL:*(void *)(a1 + 32) error:0];
}

- (BOOL)_checkNeedOfTemporaryDirectory
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = self->_items;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v4) {
    goto LABEL_10;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v28;
  obj = v3;
  while (2)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v28 != v6) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      long long v9 = [v8 providerDomainID];
      id v10 = [(NSArray *)self->_items firstObject];
      id v11 = [v10 providerDomainID];
      char v12 = [v9 isEqualToString:v11];

      if ((v12 & 1) == 0)
      {
        id v20 = fp_current_or_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[FPArchiveOperation _checkNeedOfTemporaryDirectory]();
        }
        goto LABEL_18;
      }
      uint64_t v13 = [v8 parentItemID];
      uint64_t v14 = [(NSArray *)self->_items firstObject];
      id v15 = [v14 parentItemID];
      char v16 = [v13 isEqualToItemID:v15];

      if ((v16 & 1) == 0)
      {
        id v20 = fp_current_or_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[FPArchiveOperation _checkNeedOfTemporaryDirectory]();
        }
LABEL_18:
        char v19 = 1;
        long long v18 = obj;
        goto LABEL_19;
      }
    }
    id v3 = obj;
    uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v5) {
      continue;
    }
    break;
  }
LABEL_10:

  id v17 = [(NSArray *)self->_items firstObject];
  long long v18 = [v17 providerID];

  if (([v18 isEqualToString:@"com.apple.FileProvider.LocalStorage"] & 1) != 0
    || ([v18 isEqualToString:@"com.apple.filesystems.UserFS.FileProvider"] & 1) != 0
    || ([v18 isEqualToString:@"com.apple.SMBClientProvider.FileProvider"] & 1) != 0)
  {
    char v19 = 0;
  }
  else
  {
    id v22 = [(NSArray *)self->_items firstObject];
    uint64_t v23 = [v22 providerDomainID];
    id v20 = +[FPProviderDomain providerDomainWithID:v23 cachePolicy:1 error:0];

    char v24 = [v20 isUsingFPFS];
    if ((v24 & 1) == 0)
    {
      long long v25 = fp_current_or_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[FPArchiveOperation _checkNeedOfTemporaryDirectory]();
      }
    }
    char v19 = v24 ^ 1;
LABEL_19:
  }
  return v19;
}

- (void)_materializeDestinationFolder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[FPItemManager defaultManager];
  destinationFolder = self->_destinationFolder;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__FPArchiveOperation__materializeDestinationFolder___block_invoke;
  v8[3] = &unk_1E5AF2620;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 fetchURLForItem:destinationFolder completionHandler:v8];
}

void __52__FPArchiveOperation__materializeDestinationFolder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __52__FPArchiveOperation__materializeDestinationFolder___block_invoke_cold_1(a1, (uint64_t)v5);
    }

    char v9 = [v5 startAccessingSecurityScopedResource];
    id v10 = objc_opt_new();
    id v11 = [MEMORY[0x1E4F28C98] readingIntentWithURL:v5 options:0];
    v20[0] = v11;
    char v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 480);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__FPArchiveOperation__materializeDestinationFolder___block_invoke_81;
    v15[3] = &unk_1E5AF25F8;
    id v16 = 0;
    char v19 = v9;
    id v17 = v5;
    id v18 = *(id *)(a1 + 40);
    [v10 coordinateAccessWithIntents:v12 queue:v13 byAccessor:v15];

    goto LABEL_9;
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:516 userInfo:0];
    (*(void (**)(uint64_t, void, void *, void *))(v14 + 16))(v14, 0, v10, &__block_literal_global_79);
LABEL_9:

    goto LABEL_10;
  }
  (*(void (**)(uint64_t, void, id, void *))(v14 + 16))(v14, 0, v6, &__block_literal_global_79);
LABEL_10:
}

void __52__FPArchiveOperation__materializeDestinationFolder___block_invoke_81(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    if (*(unsigned char *)(a1 + 56)) {
      [*(id *)(a1 + 40) stopAccessingSecurityScopedResource];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__FPArchiveOperation__materializeDestinationFolder___block_invoke_3;
    v6[3] = &unk_1E5AF25D0;
    char v8 = *(unsigned char *)(a1 + 56);
    id v7 = v4;
    (*(void (**)(uint64_t, id, void, void *))(v5 + 16))(v5, v7, 0, v6);
  }
}

uint64_t __52__FPArchiveOperation__materializeDestinationFolder___block_invoke_3(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) stopAccessingSecurityScopedResource];
  }
  return result;
}

- (void)_prepareItemsWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void, void *, void *))a3;
  if ([(NSArray *)self->_items count])
  {
    if ([(FPArchiveOperation *)self _checkNeedOfTemporaryDirectory])
    {
      [(FPArchiveOperation *)self _copyArchivedItemsWithCompletionHandler:v4];
    }
    else
    {
      id v6 = fp_current_or_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[FPArchiveOperation _prepareItemsWithCompletionHandler:]();
      }

      [(FPArchiveOperation *)self _coordinateArchivedItemsWithCompletionHandler:v4];
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:0];
    v4[2](v4, 0, v5, &__block_literal_global_86);
  }
}

- (unint64_t)_fpToDSArchiveFormat:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3 >= 6)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"FPArchiveOperation.m", 423, @"No DS match for FP archive format: %ld", v3);

    return 0;
  }
  return v3;
}

- (void)_archiveURLForFPEnumeratedDestination:(id)a3 targetArchiveName:(id)a4 service:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a5;
  id v15 = fp_current_or_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[FPArchiveOperation _archiveURLForFPEnumeratedDestination:targetArchiveName:service:completionHandler:]();
  }

  unint64_t v16 = [(FPArchiveOperation *)self _fpToDSArchiveFormat:[(FPArchiveOperation *)self archiveFormat]];
  id v17 = [v11 firstObject];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  char v24 = __104__FPArchiveOperation__archiveURLForFPEnumeratedDestination_targetArchiveName_service_completionHandler___block_invoke;
  long long v25 = &unk_1E5AF2670;
  id v28 = v13;
  SEL v29 = a2;
  long long v26 = self;
  id v27 = v12;
  id v18 = v12;
  id v19 = v13;
  id v20 = [v14 archiveItemsWithURLs:v11 compressionFormat:v16 destinationFolderURL:v17 completionHandler:&v22];

  long long v21 = [(FPActionOperation *)self progress];
  [v21 addChild:v20 withPendingUnitCount:80];
}

void __104__FPArchiveOperation__archiveURLForFPEnumeratedDestination_targetArchiveName_service_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_13;
  }
  if (v7)
  {
    if (!v8) {
      goto LABEL_7;
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"FPArchiveOperation.m" lineNumber:446 description:@"url should exist if error is nil"];

    if (!v8)
    {
LABEL_7:
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"FPArchiveOperation.m" lineNumber:447 description:@"nil archive name"];
    }
  }
  char v12 = [v7 startAccessingSecurityScopedResource];
  id v13 = [v7 URLByAppendingPathComponent:v8 isDirectory:0];
  id v14 = *(id *)(a1 + 40);
  id v15 = [*(id *)(*(void *)(a1 + 32) + 464) fileURL];

  if (v15)
  {
    unint64_t v16 = *(id **)(a1 + 32);
    id v17 = [v16[58] fileURL];
    uint64_t v18 = [v16 findUniqueArchivedName:v14 parent:v17];

    id v14 = (id)v18;
  }
  id v19 = fp_current_or_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v28 = *(void *)(a1 + 32);
    uint64_t v29 = *(void *)(v28 + 464);
    *(_DWORD *)id location = 138413058;
    *(void *)&location[4] = v28;
    __int16 v43 = 2112;
    v44 = v13;
    __int16 v45 = 2112;
    uint64_t v46 = v29;
    __int16 v47 = 2112;
    id v48 = v14;
    _os_log_debug_impl(&dword_1A33AE000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: moving archive from temporary folder %@ to provider %@ with name \"%@\"", location, 0x2Au);
  }

  id v20 = [FPMoveOperation alloc];
  v41 = v13;
  long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  uint64_t v22 = [(FPMoveOperation *)v20 initWithURLs:v21 destinationFolder:*(void *)(*(void *)(a1 + 32) + 464)];

  v39 = v13;
  id v40 = v14;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  [(FPMoveOperation *)v22 setTargetFilenamesByURL:v23];

  *(void *)id location = 0;
  objc_initWeak((id *)location, v22);
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  uint64_t v32 = __104__FPArchiveOperation__archiveURLForFPEnumeratedDestination_targetArchiveName_service_completionHandler___block_invoke_95;
  v33 = &unk_1E5AF2648;
  id v34 = v7;
  char v38 = v12;
  id v36 = *(id *)(a1 + 48);
  objc_copyWeak(&v37, (id *)location);
  id v24 = v13;
  id v35 = v24;
  [(FPActionOperation *)v22 setActionCompletionBlock:&v30];
  -[FPMoveOperation setShouldBounceOnCollision:](v22, "setShouldBounceOnCollision:", 1, v30, v31, v32, v33);
  [(FPActionOperation *)v22 setHaveStitching:0];
  long long v25 = [*(id *)(a1 + 32) progress];
  long long v26 = [(FPActionOperation *)v22 progress];
  [v25 addChild:v26 withPendingUnitCount:10];

  id v27 = +[FPItemManager defaultManager];
  [v27 scheduleAction:v22];

  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)location);

LABEL_13:
}

void __104__FPArchiveOperation__archiveURLForFPEnumeratedDestination_targetArchiveName_service_completionHandler___block_invoke_95(uint64_t a1, void *a2)
{
  unint64_t v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a2;
  uint64_t v5 = [v3 defaultManager];
  [v5 removeItemAtURL:*(void *)(a1 + 32) error:0];

  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = [WeakRetained transferResults];
  id v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v8, v4);
}

- (void)_archiveURLForDSEnumeratedDestination:(id)a3 service:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke;
  v14[3] = &unk_1E5AF26E8;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(FPArchiveOperation *)self _materializeDestinationFolder:v14];
}

void __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    (*((void (**)(id))v9 + 2))(v9);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_cold_1(a1, v7, v11);
    }

    uint64_t v13 = *(void *)(a1 + 40);
    id v12 = *(void **)(a1 + 48);
    uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "_fpToDSArchiveFormat:", objc_msgSend(*(id *)(a1 + 32), "archiveFormat"));
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_97;
    long long v21 = &unk_1E5AF26C0;
    uint64_t v15 = *(void *)(a1 + 32);
    id v22 = 0;
    uint64_t v23 = v15;
    id v24 = v10;
    id v25 = *(id *)(a1 + 56);
    id v16 = [v12 archiveItemsAtURLs:v13 toURL:v7 options:0 compressionFormat:v14 passphrase:0 completionHandler:&v18];
    id v17 = objc_msgSend(*(id *)(a1 + 32), "progress", v18, v19, v20, v21);
    [v17 addChild:v16 withPendingUnitCount:80];
  }
}

void __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_97(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = a1[4];
  id v8 = fp_current_or_default_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (!v5 || v7)
  {
    if (v9) {
      __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_97_cold_2((uint64_t)a1, a1 + 4);
    }

    (*((void (**)(void))a1[6] + 2))();
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    if (v9) {
      __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_97_cold_1((uint64_t)a1, v5);
    }

    id v10 = +[FPItemManager defaultManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_98;
    v11[3] = &unk_1E5AF2698;
    id v12 = v5;
    id v13 = a1[6];
    id v14 = a1[7];
    [v10 fetchItemForURL:v12 completionHandler:v11];
  }
}

void __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_98(void *a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v6 removeItemAtURL:a1[4] error:0];
  }
  (*(void (**)(void))(a1[5] + 16))();
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_archiveURLs:(id)a3 targetArchiveName:(id)a4 completionHandler:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  getDSArchiveServiceClass();
  id v10 = objc_opt_new();
  id v11 = [(FPItem *)self->_destinationFolder providerDomainID];
  id v12 = +[FPProviderDomain providerDomainWithID:v11 cachePolicy:1 error:0];

  if ([v12 isUsingFPFS])
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_8;
    }
LABEL_6:
    [(FPArchiveOperation *)self _archiveURLForDSEnumeratedDestination:v15 service:v10 completionHandler:v9];
    goto LABEL_9;
  }
  id v13 = [v12 providerID];
  if ([v13 isEqualToString:@"com.apple.FileProvider.LocalStorage"])
  {
    char v14 = objc_opt_respondsToSelector();

    if (v14) {
      goto LABEL_6;
    }
  }
  else
  {
  }
LABEL_8:
  [(FPArchiveOperation *)self _archiveURLForFPEnumeratedDestination:v15 targetArchiveName:v8 service:v10 completionHandler:v9];
LABEL_9:
}

- (id)findUniqueArchivedName:(id)a3 parent:(id)a4
{
  id v5 = a3;
  id v11 = 0;
  id v6 = objc_msgSend(a4, "fp_existingURLOfChildWithName:isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:", v5, 0, 0, &v11, 1);
  id v7 = v11;
  id v8 = v7;
  if (v6)
  {
    if (!v7) {
      id v8 = &unk_1EF6C38D8;
    }
    id v9 = objc_msgSend(v5, "fp_bouncedNameWithIndex:isDir:", objc_msgSend(v8, "longValue") + 1, 0);
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (void)actionMain
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A33AE000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: preparing items for archiving: %@", v2, 0x16u);
}

void __32__FPArchiveOperation_actionMain__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    v9[2](v9);
    [*(id *)(a1 + 32) completedWithResult:0 error:v8];
  }
  else
  {
    uint64_t v11 = [v7 count];
    if (v11 == [*(id *)(*(void *)(a1 + 32) + 448) count] && objc_msgSend(v7, "count"))
    {
      if ([*(id *)(*(void *)(a1 + 32) + 448) count] == 1)
      {
        uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 448) firstObject];
        id v20 = [v19 filename];
        long long v21 = objc_msgSend(v20, "fp_displayNameFromFilenameWithHiddenPathExtension:isFolder:", 1, objc_msgSend(v19, "isFolder"));
        id v22 = +[FPArchiveOperation extensionForArchiveFormat:utType:](FPArchiveOperation, "extensionForArchiveFormat:utType:", [*(id *)(a1 + 32) archiveFormat], 0);
        uint64_t v23 = objc_msgSend(v21, "fp_filenameFromDisplayNameWithExtension:", v22);
      }
      else
      {
        uint64_t v19 = FPLoc(@"ARCHIVE_FILENAME", v12, v13, v14, v15, v16, v17, v18, v28[0]);
        id v20 = +[FPArchiveOperation extensionForArchiveFormat:utType:](FPArchiveOperation, "extensionForArchiveFormat:utType:", [*(id *)(a1 + 32) archiveFormat], 0);
        uint64_t v23 = [v19 stringByAppendingPathExtension:v20];
      }

      long long v26 = *(void **)(a1 + 32);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = (uint64_t)__32__FPArchiveOperation_actionMain__block_invoke_2;
      v28[3] = (uint64_t)&unk_1E5AF2710;
      id v27 = v10;
      v28[4] = *(void *)(a1 + 32);
      id v29 = v27;
      [v26 _archiveURLs:v7 targetArchiveName:v23 completionHandler:v28];
    }
    else
    {
      v10[2](v10);
      id v24 = *(void **)(a1 + 32);
      id v25 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:0];
      [v24 completedWithResult:0 error:v25];
    }
  }
}

void __32__FPArchiveOperation_actionMain__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t))(v5 + 16);
  id v7 = a3;
  id v8 = a2;
  v6(v5);
  [*(id *)(a1 + 32) completedWithResult:v8 error:v7];
}

- (void)presendNotifications
{
  __int16 v3 = [(FPActionOperation *)self stitcher];
  [v3 start];

  id v14 = [(NSArray *)self->_items firstObject];
  NSUInteger v4 = [(NSArray *)self->_items count];
  uint64_t v5 = [(FPActionOperation *)self stitcher];
  id v6 = [v14 parentItemIdentifier];
  id v7 = [v14 providerDomainID];
  unint64_t v8 = [(FPArchiveOperation *)self archiveFormat];
  if (v4 == 1) {
    [v5 createArchivePlaceholderForItem:v14 underParent:v6 inProviderDomainID:v7 withArchiveFormat:v8];
  }
  else {
  id v9 = [v5 createGenericArchivePlaceholderUnderParent:v6 inProviderDomainID:v7 withArchiveFormat:v8];
  }
  placeholderID = self->_placeholderID;
  self->_placeholderID = v9;

  uint64_t v11 = +[FPProgressManager defaultManager];
  uint64_t v12 = [(FPActionOperation *)self progress];
  [v11 registerCopyProgress:v12 forItemID:self->_placeholderID];

  uint64_t v13 = [(FPActionOperation *)self stitcher];
  [v13 flush];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v7)
  {
    if ([(NSArray *)self->_items count] == 1)
    {
      id v9 = [(NSArray *)self->_items firstObject];
    }
    else
    {
      id v9 = 0;
    }
    id v10 = objc_msgSend(v7, "fp_annotatedErrorWithItem:variant:", v9, @"Archive");
  }
  else
  {
    id v9 = [(FPActionOperation *)self stitcher];
    [v9 associateItem:v8 withPlaceholderID:self->_placeholderID];
    id v10 = 0;
  }

  uint64_t v11 = [(FPActionOperation *)self stitcher];
  [v11 finishWithItem:v8 error:v10];

  uint64_t v12 = [(FPArchiveOperation *)self archiveCompletionBlock];
  uint64_t v13 = (void *)v12;
  if (v12)
  {
    (*(void (**)(uint64_t, id, void *))(v12 + 16))(v12, v8, v10);
    [(FPArchiveOperation *)self setArchiveCompletionBlock:0];
  }

  v14.receiver = self;
  v14.super_class = (Class)FPArchiveOperation;
  [(FPActionOperation *)&v14 finishWithResult:v8 error:v10];
}

- (id)archiveCompletionBlock
{
  return self->_archiveCompletionBlock;
}

- (void)setArchiveCompletionBlock:(id)a3
{
}

- (unint64_t)archiveFormat
{
  return self->_archiveFormat;
}

- (void)setArchiveFormat:(unint64_t)a3
{
  self->_archiveFormat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_archiveCompletionBlock, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_destinationFolder, 0);
  objc_storeStrong((id *)&self->_placeholderID, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (void)_checkNeedOfTemporaryDirectory
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] %@: item set contain items from several domains, prepare by copy", v2, v3, v4, v5, v6);
}

void __52__FPArchiveOperation__materializeDestinationFolder___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_4(a1, a2), "fp_shortDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v3, v4, "[DEBUG] %@: materializing target URL: %@", v5, v6, v7, v8, v9);
}

- (void)_prepareItemsWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] %@: downloading content of item prior to archiving", v2, v3, v4, v5, v6);
}

- (void)_archiveURLForFPEnumeratedDestination:targetArchiveName:service:completionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_5();
  _os_log_debug_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: creating archive from URLs using old SPI: %@", v1, 0x16u);
}

void __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint8_t v6 = objc_msgSend(a2, "fp_shortDescription");
  int v7 = 138412802;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_debug_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: creating archive from URLs using new SPI: %@ to %@", (uint8_t *)&v7, 0x20u);
}

void __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_97_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "fp_shortDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v3, v4, "[DEBUG] %@: archiving succeeded at %@", v5, v6, v7, v8, v9);
}

void __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_97_cold_2(uint64_t a1, id *a2)
{
  uint64_t v2 = objc_msgSend(*a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v3, v4, "[DEBUG] %@: archiving failed with error %@", v5, v6, v7, v8, v9);
}

@end