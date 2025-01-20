@interface PHBatchAssetExpunger
+ (id)batchAssetExpungerWithAssets:(id)a3 deleteOptions:(id)a4 library:(id)a5 topLevelSelector:(SEL)a6;
- (BOOL)performChangesAndWait:(id *)a3;
- (PHBatchAssetExpunger)initWithAssets:(id)a3 deleteOptions:(id)a4 library:(id)a5 batchSize:(unint64_t)a6;
- (void)_batchExpungeInRange:(_NSRange)a3;
- (void)performChangesWithCompletionHandler:(id)a3;
@end

@implementation PHBatchAssetExpunger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchPerformChanges, 0);
  objc_storeStrong((id *)&self->_deleteOptions, 0);

  objc_storeStrong((id *)&self->_assets, 0);
}

- (void)_batchExpungeInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v6 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14.NSUInteger location = location;
    v14.NSUInteger length = length;
    v7 = NSStringFromRange(v14);
    int v9 = 134218242;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEFAULT, "Batch Expunge: %p Batch expunging assets in range: %@", (uint8_t *)&v9, 0x16u);
  }
  v8 = -[NSArray subarrayWithRange:](self->_assets, "subarrayWithRange:", location, length);
  +[PHAssetChangeRequest internalExpungeAssets:v8 deleteOptions:self->_deleteOptions];
}

- (void)performChangesWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v6 = [(NSArray *)self->_assets count];
    *(_DWORD *)buf = 134218240;
    v12 = self;
    __int16 v13 = 2048;
    NSUInteger v14 = v6;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEFAULT, "Batch Expunge: %p Start asynchronous expunge of %tu assets", buf, 0x16u);
  }

  batchPerformChanges = self->_batchPerformChanges;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__PHBatchAssetExpunger_performChangesWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E58465A8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(PHBatchPerformChanges *)batchPerformChanges performChangesWithCompletionHandler:v9];
}

void __60__PHBatchAssetExpunger_performChangesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSUInteger v6 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = @"NO";
    if (a2) {
      id v8 = @"YES";
    }
    int v9 = v8;
    int v11 = 134218498;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    NSUInteger v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEFAULT, "Batch Expunge: %p Finished asynchronous expunge: %@ %@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);
  }
}

- (BOOL)performChangesAndWait:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v6 = [(NSArray *)self->_assets count];
    *(_DWORD *)buf = 134218240;
    id v16 = self;
    __int16 v17 = 2048;
    NSUInteger v18 = v6;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEFAULT, "Batch Expunge: %p Start synchronous expunge of %tu assets", buf, 0x16u);
  }

  batchPerformChanges = self->_batchPerformChanges;
  id v14 = 0;
  BOOL v8 = [(PHBatchPerformChanges *)batchPerformChanges performChangesAndWait:&v14];
  id v9 = v14;
  uint64_t v10 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = @"NO";
    *(_DWORD *)buf = 134218498;
    id v16 = self;
    __int16 v17 = 2112;
    if (v8) {
      int v11 = @"YES";
    }
    NSUInteger v18 = (NSUInteger)v11;
    __int16 v19 = 2112;
    id v20 = v9;
    uint64_t v12 = v11;
    _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_DEFAULT, "Batch Expunge: %p Finished synchronous expunge: %@ %@", buf, 0x20u);
  }
  if (a3) {
    *a3 = v9;
  }

  return v8;
}

- (PHBatchAssetExpunger)initWithAssets:(id)a3 deleteOptions:(id)a4 library:(id)a5 batchSize:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PHBatchAssetExpunger;
  __int16 v13 = [(PHBatchAssetExpunger *)&v25 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    assets = v13->_assets;
    v13->_assets = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_deleteOptions, a4);
    objc_initWeak(&location, v13);
    id v16 = [PHBatchPerformChanges alloc];
    uint64_t v17 = [(NSArray *)v13->_assets count];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__PHBatchAssetExpunger_initWithAssets_deleteOptions_library_batchSize___block_invoke;
    v22[3] = &unk_1E58456F0;
    objc_copyWeak(&v23, &location);
    uint64_t v18 = [(PHBatchPerformChanges *)v16 initWithPhotoLibrary:v12 itemCount:v17 batchSize:a6 batchBlock:v22];
    batchPerformChanges = v13->_batchPerformChanges;
    v13->_batchPerformChanges = (PHBatchPerformChanges *)v18;

    id v20 = v13;
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __71__PHBatchAssetExpunger_initWithAssets_deleteOptions_library_batchSize___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_batchExpungeInRange:", a2, a3);
}

+ (id)batchAssetExpungerWithAssets:(id)a3 deleteOptions:(id)a4 library:(id)a5 topLevelSelector:(SEL)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  +[PHObject assertAllObjects:v11 forSelector:a6 areOfType:objc_opt_class()];
  id v12 = PLArrayFromEnumeration();

  __int16 v13 = [[PHBatchAssetExpunger alloc] initWithAssets:v12 deleteOptions:v10 library:v9 batchSize:200];

  return v13;
}

@end