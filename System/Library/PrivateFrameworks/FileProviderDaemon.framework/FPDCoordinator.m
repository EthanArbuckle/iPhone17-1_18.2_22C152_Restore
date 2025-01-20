@interface FPDCoordinator
+ (id)requestForClaimID:(id)a3;
- (FPDCoordinator)initWithExtensionManager:(id)a3 callbackQueue:(id)a4;
- (FPDExtensionManager)extensionManager;
- (id)_readingIntentWithURL:(id)a3 materializeOption:(unint64_t)a4;
- (void)cancel;
- (void)coordinateAtURL:(id)a3 recursively:(BOOL)a4 request:(id)a5 handler:(id)a6;
- (void)coordinateForCopyingFromURL:(id)a3 toURL:(id)a4 request:(id)a5 handler:(id)a6;
- (void)coordinateForMovingFromURL:(id)a3 toURL:(id)a4 request:(id)a5 handler:(id)a6;
- (void)coordinateForMovingFromURL:(id)a3 toURL:(id)a4 toTargetFolderURL:(id)a5 targetMaterializeOption:(unint64_t)a6 sourceMaterializeOption:(unint64_t)a7 request:(id)a8 handler:(id)a9;
- (void)dealloc;
- (void)resolveItem:(id)a3 completion:(id)a4;
- (void)resolveItem:(id)a3 recursively:(BOOL)a4 request:(id)a5 andCoordinateWithHandler:(id)a6;
- (void)resolveItemOrURL:(id)a3 recursively:(BOOL)a4 coordinateIfExport:(BOOL)a5 request:(id)a6 handler:(id)a7;
- (void)resolveItemOrURL:(id)a3 recursively:(BOOL)a4 request:(id)a5 andCoordinateWithHandler:(id)a6;
- (void)startAccessingURLForAtomDuration:(id)a3;
- (void)stopAccessingAllURLs;
- (void)stopAccessingURL:(id)a3;
@end

@implementation FPDCoordinator

- (FPDCoordinator)initWithExtensionManager:(id)a3 callbackQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FPDCoordinator;
  v8 = [(FPDCoordinator *)&v16 init];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    fileCoordinator = v8->_fileCoordinator;
    v8->_fileCoordinator = (NSFileCoordinator *)v9;

    objc_storeStrong((id *)&v8->_callbackQueue, a4);
    uint64_t v11 = objc_opt_new();
    coordinationQueue = v8->_coordinationQueue;
    v8->_coordinationQueue = (NSOperationQueue *)v11;

    [(NSOperationQueue *)v8->_coordinationQueue setUnderlyingQueue:v7];
    objc_storeWeak((id *)&v8->_extensionManager, v6);
    uint64_t v13 = objc_opt_new();
    currentlyAccessedURLs = v8->_currentlyAccessedURLs;
    v8->_currentlyAccessedURLs = (NSMutableSet *)v13;
  }
  return v8;
}

- (void)cancel
{
}

- (void)dealloc
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D744C000, log, OS_LOG_TYPE_ERROR, "[ERROR] someone forgot to call -stopAccessingAllURLs", v1, 2u);
}

- (void)startAccessingURLForAtomDuration:(id)a3
{
  id v5 = a3;
  v4 = self->_currentlyAccessedURLs;
  objc_sync_enter(v4);
  if (([(NSMutableSet *)self->_currentlyAccessedURLs containsObject:v5] & 1) == 0
    && [v5 startAccessingSecurityScopedResource])
  {
    [(NSMutableSet *)self->_currentlyAccessedURLs addObject:v5];
  }
  objc_sync_exit(v4);
}

- (void)stopAccessingURL:(id)a3
{
  id v5 = a3;
  v4 = self->_currentlyAccessedURLs;
  objc_sync_enter(v4);
  [v5 stopAccessingSecurityScopedResource];
  [(NSMutableSet *)self->_currentlyAccessedURLs removeObject:v5];
  objc_sync_exit(v4);
}

- (void)stopAccessingAllURLs
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = self->_currentlyAccessedURLs;
  objc_sync_enter(v3);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = self->_currentlyAccessedURLs;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "stopAccessingSecurityScopedResource", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_currentlyAccessedURLs removeAllObjects];
  objc_sync_exit(v3);
}

- (void)resolveItem:(id)a3 recursively:(BOOL)a4 request:(id)a5 andCoordinateWithHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__FPDCoordinator_resolveItem_recursively_request_andCoordinateWithHandler___block_invoke;
  v14[3] = &unk_1E6A74AD0;
  id v15 = v10;
  id v16 = v11;
  BOOL v17 = a4;
  v14[4] = self;
  id v12 = v10;
  id v13 = v11;
  [(FPDCoordinator *)self resolveItem:a3 completion:v14];
}

void __75__FPDCoordinator_resolveItem_recursively_request_andCoordinateWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (a2)
  {
    [v6 coordinateAtURL:a2 recursively:*(unsigned __int8 *)(a1 + 56) request:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v7 = v6[4];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__FPDCoordinator_resolveItem_recursively_request_andCoordinateWithHandler___block_invoke_2;
    v8[3] = &unk_1E6A74AA8;
    id v10 = *(id *)(a1 + 48);
    id v9 = v5;
    dispatch_async(v7, v8);
  }
}

uint64_t __75__FPDCoordinator_resolveItem_recursively_request_andCoordinateWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32), &__block_literal_global_11);
}

- (void)resolveItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  long long v8 = [v6 fileURL];

  if (v8)
  {
    id v9 = [v6 fileURL];
    [(FPDCoordinator *)self startAccessingURLForAtomDuration:v9];

    id v10 = [v6 fileURL];
    v7[2](v7, v10, 0);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionManager);
    id v12 = [v6 itemID];
    id v13 = [WeakRetained domainFromItemID:v12 reason:0];

    v14 = [v13 defaultBackend];
    id v15 = [v6 itemID];
    id v16 = +[FPDRequest requestForSelf];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __41__FPDCoordinator_resolveItem_completion___block_invoke;
    v17[3] = &unk_1E6A74B20;
    v17[4] = self;
    id v18 = v6;
    v19 = v7;
    [v14 URLForItemID:v15 creatingPlaceholderIfMissing:1 ignoreAlternateContentsURL:1 forBookmarkResolution:0 request:v16 completionHandler:v17];
  }
}

void __41__FPDCoordinator_resolveItem_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__FPDCoordinator_resolveItem_completion___block_invoke_2;
  block[3] = &unk_1E6A74AF8;
  id v13 = v5;
  id v14 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v6;
  uint64_t v16 = v9;
  id v17 = v8;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

void __41__FPDCoordinator_resolveItem_completion___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __41__FPDCoordinator_resolveItem_completion___block_invoke_2_cold_1(a1, v2);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v4 = [*(id *)(a1 + 48) url];
    [*(id *)(a1 + 56) startAccessingURLForAtomDuration:v4];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)resolveItemOrURL:(id)a3 recursively:(BOOL)a4 request:(id)a5 andCoordinateWithHandler:(id)a6
{
}

- (void)resolveItemOrURL:(id)a3 recursively:(BOOL)a4 coordinateIfExport:(BOOL)a5 request:(id)a6 handler:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v16 = a3;
  id v12 = a6;
  id v13 = (void (**)(id, void *, void, void *))a7;
  if ([v16 isProviderItem])
  {
    id v14 = [v16 asFPItem];
    [(FPDCoordinator *)self resolveItem:v14 recursively:v10 request:v12 andCoordinateWithHandler:v13];
  }
  else
  {
    [v16 asURL];
    if (v9) {
      id v14 = {;
    }
      [(FPDCoordinator *)self startAccessingURLForAtomDuration:v14];
      id v15 = [v16 asURL];
      [(FPDCoordinator *)self coordinateAtURL:v15 recursively:v10 request:v12 handler:v13];
    }
    else {
      id v14 = {;
    }
      v13[2](v13, v14, 0, &__block_literal_global_9);
    }
  }
}

- (void)coordinateAtURL:(id)a3 recursively:(BOOL)a4 request:(id)a5 handler:(id)a6
{
  BOOL v8 = a4;
  v32[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"FPDCoordinator.m", 218, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  if (v8) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  id v15 = [(FPDCoordinator *)self _readingIntentWithURL:v11 materializeOption:v14];
  id v16 = fp_current_or_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[FPDCoordinator coordinateAtURL:recursively:request:handler:](v8, (uint64_t)v11, v16);
  }

  id v17 = [MEMORY[0x1E4F28CA0] _nextClaimIdentifier];
  registerClaim(v17, v12);
  fileCoordinator = self->_fileCoordinator;
  v32[0] = v15;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  coordinationQueue = self->_coordinationQueue;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __62__FPDCoordinator_coordinateAtURL_recursively_request_handler___block_invoke;
  v26[3] = &unk_1E6A74B48;
  id v27 = v17;
  v28 = self;
  id v29 = v15;
  id v30 = v11;
  id v31 = v13;
  id v21 = v13;
  id v22 = v11;
  id v23 = v15;
  id v24 = v17;
  [(NSFileCoordinator *)fileCoordinator coordinateAccessWithIntents:v19 queue:coordinationQueue byAccessor:v26];
}

void __62__FPDCoordinator_coordinateAtURL_recursively_request_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unregisterClaim(*(void **)(a1 + 32));
  id v4 = [*(id *)(*(void *)(a1 + 40) + 16) retainAccess];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__FPDCoordinator_coordinateAtURL_recursively_request_handler___block_invoke_2;
  v12[3] = &unk_1E6A73418;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v6;
  id v7 = v4;
  id v15 = v7;
  BOOL v8 = (void *)MEMORY[0x1D9471EC0](v12);
  if (v3)
  {
    BOOL v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __62__FPDCoordinator_coordinateAtURL_recursively_request_handler___block_invoke_cold_1(a1, v3);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 64);
    id v11 = [*(id *)(a1 + 48) URL];
    (*(void (**)(uint64_t, void *, void, void *))(v10 + 16))(v10, v11, 0, v8);
  }
}

uint64_t __62__FPDCoordinator_coordinateAtURL_recursively_request_handler___block_invoke_2(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __62__FPDCoordinator_coordinateAtURL_recursively_request_handler___block_invoke_2_cold_1(a1, v2);
  }

  return [*(id *)(*(void *)(a1 + 40) + 16) releaseAccess:*(void *)(a1 + 48)];
}

- (void)coordinateForCopyingFromURL:(id)a3 toURL:(id)a4 request:(id)a5 handler:(id)a6
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  uint64_t v14 = [(FPDCoordinator *)self _readingIntentWithURL:v10 materializeOption:2];
  id v15 = [MEMORY[0x1E4F28C98] writingIntentWithURL:v11 options:0];
  id v16 = [MEMORY[0x1E4F28CA0] _nextClaimIdentifier];
  registerClaim(v16, v13);

  fileCoordinator = self->_fileCoordinator;
  v34[0] = v14;
  v34[1] = v15;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  coordinationQueue = self->_coordinationQueue;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __68__FPDCoordinator_coordinateForCopyingFromURL_toURL_request_handler___block_invoke;
  v26[3] = &unk_1E6A74B70;
  id v27 = v16;
  v28 = self;
  id v29 = v10;
  id v30 = v11;
  id v32 = v15;
  id v33 = v12;
  id v31 = v14;
  id v20 = v15;
  id v21 = v14;
  id v22 = v12;
  id v23 = v11;
  id v24 = v10;
  id v25 = v16;
  [(NSFileCoordinator *)fileCoordinator coordinateAccessWithIntents:v18 queue:coordinationQueue byAccessor:v26];
}

void __68__FPDCoordinator_coordinateForCopyingFromURL_toURL_request_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unregisterClaim(*(void **)(a1 + 32));
  if (v3)
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __68__FPDCoordinator_coordinateForCopyingFromURL_toURL_request_handler___block_invoke_cold_1(a1, v3);
    }

    id v5 = &__block_literal_global_28;
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 16) retainAccess];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __68__FPDCoordinator_coordinateForCopyingFromURL_toURL_request_handler___block_invoke_3;
    uint64_t v14 = &unk_1E6A736C0;
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = v6;
    id v7 = v6;
    id v5 = (void *)MEMORY[0x1D9471EC0](&v11);

    uint64_t v8 = *(void *)(a1 + 80);
    BOOL v9 = objc_msgSend(*(id *)(a1 + 64), "URL", v11, v12, v13, v14, v15);
    id v10 = [*(id *)(a1 + 72) URL];
    (*(void (**)(uint64_t, void *, void *, void, void *))(v8 + 16))(v8, v9, v10, 0, v5);
  }
}

uint64_t __68__FPDCoordinator_coordinateForCopyingFromURL_toURL_request_handler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) releaseAccess:*(void *)(a1 + 40)];
}

- (id)_readingIntentWithURL:(id)a3 materializeOption:(unint64_t)a4
{
  if (a4)
  {
    if (a4 == 2) {
      uint64_t v5 = 131073;
    }
    else {
      uint64_t v5 = 1;
    }
    uint64_t v6 = [MEMORY[0x1E4F28C98] readingIntentWithURL:a3 options:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (void)coordinateForMovingFromURL:(id)a3 toURL:(id)a4 toTargetFolderURL:(id)a5 targetMaterializeOption:(unint64_t)a6 sourceMaterializeOption:(unint64_t)a7 request:(id)a8 handler:(id)a9
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v38 = a9;
  id v17 = a8;
  id v18 = objc_opt_new();
  v19 = [MEMORY[0x1E4F28C98] writingIntentWithURL:v14 options:2];
  [v18 addObject:v19];
  id v20 = [MEMORY[0x1E4F28C98] writingIntentWithURL:v15 options:8];
  [v18 addObject:v20];
  unint64_t v21 = a6;
  id v22 = [(FPDCoordinator *)self _readingIntentWithURL:v16 materializeOption:a6];
  if (v22) {
    [v18 addObject:v22];
  }
  v39 = v18;
  id v23 = fp_current_or_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v37 = [NSNumber numberWithUnsignedInteger:a7];
    v34 = [NSNumber numberWithUnsignedInteger:v21];
    *(_DWORD *)buf = 138413314;
    id v50 = v14;
    __int16 v51 = 2112;
    id v52 = v16;
    __int16 v53 = 2112;
    v54 = v37;
    __int16 v55 = 2112;
    v56 = v34;
    __int16 v57 = 2048;
    uint64_t v58 = [v39 count];
    _os_log_debug_impl(&dword_1D744C000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Request to coordinateForMoving %@ to %@; sourceMaterializeOption %@ targetMaterializeOption %@. Intents (%lu)",
      buf,
      0x34u);
  }
  id v24 = [MEMORY[0x1E4F28CA0] _nextClaimIdentifier];
  registerClaim(v24, v17);

  fileCoordinator = self->_fileCoordinator;
  coordinationQueue = self->_coordinationQueue;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __133__FPDCoordinator_coordinateForMovingFromURL_toURL_toTargetFolderURL_targetMaterializeOption_sourceMaterializeOption_request_handler___block_invoke;
  v40[3] = &unk_1E6A74B98;
  id v41 = v24;
  id v42 = v14;
  id v43 = v15;
  id v44 = v16;
  id v45 = v19;
  id v46 = v20;
  id v47 = v22;
  id v48 = v38;
  id v36 = v22;
  id v27 = v20;
  id v28 = v19;
  id v29 = v38;
  id v30 = v16;
  id v31 = v15;
  id v32 = v14;
  id v33 = v24;
  [(NSFileCoordinator *)fileCoordinator coordinateAccessWithIntents:v39 queue:coordinationQueue byAccessor:v40];
}

void __133__FPDCoordinator_coordinateForMovingFromURL_toURL_toTargetFolderURL_targetMaterializeOption_sourceMaterializeOption_request_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unregisterClaim(*(void **)(a1 + 32));
  if (v3)
  {
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __133__FPDCoordinator_coordinateForMovingFromURL_toURL_toTargetFolderURL_targetMaterializeOption_sourceMaterializeOption_request_handler___block_invoke_cold_1((void *)a1, v3, v4);
    }

    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 88);
    uint64_t v6 = [*(id *)(a1 + 64) URL];
    id v7 = [*(id *)(a1 + 72) URL];
    uint64_t v8 = [*(id *)(a1 + 80) URL];
    (*(void (**)(uint64_t, void *, void *, void *, void))(v5 + 16))(v5, v6, v7, v8, 0);
  }
}

- (void)coordinateForMovingFromURL:(id)a3 toURL:(id)a4 request:(id)a5 handler:(id)a6
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1E4F28C98];
  id v14 = a5;
  id v15 = [v13 writingIntentWithURL:v10 options:2];
  id v16 = [MEMORY[0x1E4F28C98] writingIntentWithURL:v11 options:8];
  id v17 = [MEMORY[0x1E4F28CA0] _nextClaimIdentifier];
  registerClaim(v17, v14);

  fileCoordinator = self->_fileCoordinator;
  v34[0] = v15;
  v34[1] = v16;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  coordinationQueue = self->_coordinationQueue;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __67__FPDCoordinator_coordinateForMovingFromURL_toURL_request_handler___block_invoke;
  v27[3] = &unk_1E6A74BC0;
  id v28 = v17;
  id v29 = v10;
  id v30 = v11;
  id v31 = v15;
  id v32 = v16;
  id v33 = v12;
  id v21 = v16;
  id v22 = v15;
  id v23 = v12;
  id v24 = v11;
  id v25 = v10;
  id v26 = v17;
  [(NSFileCoordinator *)fileCoordinator coordinateAccessWithIntents:v19 queue:coordinationQueue byAccessor:v27];
}

void __67__FPDCoordinator_coordinateForMovingFromURL_toURL_request_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unregisterClaim(*(void **)(a1 + 32));
  if (v3)
  {
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __67__FPDCoordinator_coordinateForMovingFromURL_toURL_request_handler___block_invoke_cold_1(a1, v3);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 72);
    uint64_t v6 = [*(id *)(a1 + 56) URL];
    id v7 = [*(id *)(a1 + 64) URL];
    (*(void (**)(uint64_t, void *, void *, void))(v5 + 16))(v5, v6, v7, 0);
  }
}

+ (id)requestForClaimID:(id)a3
{
  id v3 = a3;
  if (initRequestDictionary_onceToken != -1) {
    dispatch_once(&initRequestDictionary_onceToken, &__block_literal_global_73);
  }
  id v4 = (id)requestPerClaimID;
  objc_sync_enter(v4);
  uint64_t v5 = [(id)requestPerClaimID objectForKeyedSubscript:v3];
  objc_sync_exit(v4);

  return v5;
}

- (FPDExtensionManager)extensionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionManager);
  return (FPDExtensionManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionManager);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_coordinationQueue, 0);
  objc_storeStrong((id *)&self->_fileCoordinator, 0);
  objc_storeStrong((id *)&self->_currentlyAccessedURLs, 0);
}

void __41__FPDCoordinator_resolveItem_completion___block_invoke_2_cold_1(uint64_t a1, id *a2)
{
  v2 = objc_msgSend(*a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v3, v4, "[ERROR] couldn't resolve item to URL, item: %@; %@",
    v5,
    v6,
    v7,
    v8,
    v9);
}

- (void)coordinateAtURL:(os_log_t)log recursively:request:handler:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = @"yes";
  if ((a1 & 1) == 0) {
    uint64_t v3 = @"no";
  }
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDCoordinator, going to materialize recursively ? %@ readURL %@", (uint8_t *)&v4, 0x16u);
}

void __62__FPDCoordinator_coordinateAtURL_recursively_request_handler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 56), "fp_shortDescription");
  int v4 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v5, v6, "[ERROR] couldn't coordinate at %@: %@", v7, v8, v9, v10, v11);
}

void __62__FPDCoordinator_coordinateAtURL_recursively_request_handler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDCoordinator: Releasing file coordinator for intent %@", (uint8_t *)&v3, 0xCu);
}

void __68__FPDCoordinator_coordinateForCopyingFromURL_toURL_request_handler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_3_6(&dword_1D744C000, v3, v4, "[ERROR] couldn't coordinate at %@ -> %@: %@", v5, v6, v7, v8, v9);
}

void __133__FPDCoordinator_coordinateForMovingFromURL_toURL_toTargetFolderURL_targetMaterializeOption_sourceMaterializeOption_request_handler___block_invoke_cold_1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  uint64_t v7 = objc_msgSend(a2, "fp_prettyDescription");
  int v8 = 138413058;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = v6;
  __int16 v14 = 2112;
  id v15 = v7;
  _os_log_error_impl(&dword_1D744C000, a3, OS_LOG_TYPE_ERROR, "[ERROR] couldn't coordinate at %@ / %@ / %@: %@", (uint8_t *)&v8, 0x2Au);
}

void __67__FPDCoordinator_coordinateForMovingFromURL_toURL_request_handler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_3_6(&dword_1D744C000, v3, v4, "[ERROR] couldn't coordinate at %@ / %@ : %@", v5, v6, v7, v8, v9);
}

@end