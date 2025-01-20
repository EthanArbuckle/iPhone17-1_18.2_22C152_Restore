@interface FPFetchThumbnailsOperation
- (FPFetchThumbnailsOperation)init;
- (FPFetchThumbnailsOperation)initWithItem:(id)a3 versions:(id)a4 desiredSize:(CGSize)a5 screenScale:(double)a6 itemManager:(id)a7;
- (FPFetchThumbnailsOperation)initWithItems:(id)a3 desiredSize:(CGSize)a4 screenScale:(double)a5 itemManager:(id)a6;
- (id)perThumbnailCompletionBlock;
- (id)perThumbnailWithVersionCompletionBlock;
- (id)thumbnailsFetchCompletionBlock;
- (void)_perItemCompletionBlockFor:(id)a3 version:(id)a4 thumbnailURL:(id)a5 thumbnailData:(id)a6 contentType:(id)a7 metadata:(id)a8 error:(id)a9;
- (void)cancel;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)operation:(id)a3 didReceiveProgressInfo:(id)a4 error:(id)a5;
- (void)setPerThumbnailCompletionBlock:(id)a3;
- (void)setPerThumbnailWithVersionCompletionBlock:(id)a3;
- (void)setThumbnailsFetchCompletionBlock:(id)a3;
@end

@implementation FPFetchThumbnailsOperation

- (FPFetchThumbnailsOperation)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"FPFetchThumbnailsOperation.m", 282, @"UNREACHABLE: Use FPItemManager to create %@.", objc_opt_class() object file lineNumber description];

  return 0;
}

- (FPFetchThumbnailsOperation)initWithItems:(id)a3 desiredSize:(CGSize)a4 screenScale:(double)a5 itemManager:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  uint64_t v14 = [v12 count];
  if (!v13
    || (a5 >= 1.0 ? (BOOL v15 = v14 == 0) : (BOOL v15 = 1),
        !v15 ? (BOOL v16 = width < 1.0) : (BOOL v16 = 1),
        !v16 ? (BOOL v17 = height < 1.0) : (BOOL v17 = 1),
        v17))
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v41 = objc_opt_class();
    v52.double width = width;
    v52.double height = height;
    v42 = NSStringFromSize(v52);
    [v40 handleFailureInMethod:a2, self, @"FPFetchThumbnailsOperation.m", 298, @"invalid parameter to initialize %@ (items:%@, desiredSize:%@, screenScale:%f, itemManager:%@)", v41, v12, v42, *(void *)&a5, v13 object file lineNumber description];

    v39 = 0;
    goto LABEL_30;
  }
  v49.receiver = self;
  v49.super_class = (Class)FPFetchThumbnailsOperation;
  v18 = [(FPOperation *)&v49 init];
  if (!v18) {
    goto LABEL_28;
  }
  id v44 = v13;
  uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v12, "count"));
  dictionary = v18->_dictionary;
  v18->_dictionary = (NSMutableDictionary *)v19;

  v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  appLibraryItems = v18->_appLibraryItems;
  v18->_appLibraryItems = v21;

  v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  placeHoldersItems = v18->_placeHoldersItems;
  v18->_placeHoldersItems = v23;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v25 = v12;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (!v26) {
    goto LABEL_27;
  }
  uint64_t v27 = v26;
  uint64_t v28 = *(void *)v46;
  do
  {
    for (uint64_t i = 0; i != v27; ++i)
    {
      if (*(void *)v46 != v28) {
        objc_enumerationMutation(v25);
      }
      v30 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      if ([v30 isPlaceholder])
      {
        v31 = v18->_placeHoldersItems;
LABEL_23:
        [(NSMutableArray *)v31 addObject:v30];
        continue;
      }
      v32 = +[FPAppRegistry sharedRegistry];
      id v33 = (id)[v32 promoteItemToAppLibraryIfNeeded:v30];

      if ([v30 isContainer])
      {
        v34 = objc_msgSend(v30, "fp_appContainerBundleIdentifier");

        if (v34)
        {
          v31 = v18->_appLibraryItems;
          goto LABEL_23;
        }
      }
      v35 = v18->_dictionary;
      v36 = [v30 itemID];
      [(NSMutableDictionary *)v35 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:v36];
    }
    uint64_t v27 = [v25 countByEnumeratingWithState:&v45 objects:v50 count:16];
  }
  while (v27);
LABEL_27:

  v18->_desiredSize.double width = width;
  v18->_desiredSize.double height = height;
  v18->_screenScale = a5;
  objc_storeStrong((id *)&v18->_itemManager, a6);
  v37 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
  subOperationQueue = v18->_subOperationQueue;
  v18->_subOperationQueue = v37;

  [(NSOperationQueue *)v18->_subOperationQueue setName:@"com.apple.FileProvider.FetchThumbnailsOperation"];
  [(NSOperationQueue *)v18->_subOperationQueue setMaxConcurrentOperationCount:2];
  id v13 = v44;
LABEL_28:
  self = v18;
  v39 = self;
LABEL_30:

  return v39;
}

- (FPFetchThumbnailsOperation)initWithItem:(id)a3 versions:(id)a4 desiredSize:(CGSize)a5 screenScale:(double)a6 itemManager:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v22 = v13;
  BOOL v15 = (void *)MEMORY[0x1E4F1C978];
  id v16 = a7;
  BOOL v17 = [v15 arrayWithObjects:&v22 count:1];
  v18 = -[FPFetchThumbnailsOperation initWithItems:desiredSize:screenScale:itemManager:](self, "initWithItems:desiredSize:screenScale:itemManager:", v17, v16, width, height, a6, v22, v23);

  if (v18)
  {
    dictionary = v18->_dictionary;
    v20 = [v13 itemID];
    [(NSMutableDictionary *)dictionary setObject:v14 forKeyedSubscript:v20];
  }
  return v18;
}

- (void)main
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v4 = self->_placeHoldersItems;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v9 = fp_current_or_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v8;
          _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring request for %@ because it's a placeholder", (uint8_t *)&buf, 0xCu);
        }

        v10 = [v8 itemID];
        v11 = [v10 identifier];
        [(FPFetchThumbnailsOperation *)self _perItemCompletionBlockFor:v11 version:0 thumbnailURL:0 thumbnailData:0 contentType:0 metadata:0 error:0];
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v5);
  }

  if (self->_subOperations)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"FPFetchThumbnailsOperation.m" lineNumber:366 description:@"no sub operations should have been crated before this point"];
  }
  id v13 = [MEMORY[0x1E4F1CA48] array];
  subOperations = self->_subOperations;
  self->_subOperations = v13;

  if ([(NSMutableArray *)self->_appLibraryItems count])
  {
    if (self->_desiredSize.width >= self->_desiredSize.height) {
      double width = self->_desiredSize.width;
    }
    else {
      double width = self->_desiredSize.height;
    }
    id v16 = -[FPFetchAppLibraryIconsOperation initWithAppLibraryItems:desiredSize:screenScale:]([FPFetchAppLibraryIconsOperation alloc], "initWithAppLibraryItems:desiredSize:screenScale:", self->_appLibraryItems, width, width, self->_screenScale);
    BOOL v17 = v16;
    if (!v16)
    {
      uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"can't fetch app-library icons for %@", self->_appLibraryItems);
      [(FPOperation *)self completedWithResult:0 error:v27];

      return;
    }
    [(FPFetchAppLibraryIconsOperation *)v16 setDelegate:self];
    [(NSMutableArray *)self->_subOperations addObject:v17];
  }
  if ([(NSMutableDictionary *)self->_dictionary count])
  {
    v18 = -[FPFetchRegularItemThumbnailsOperation initWithDictionary:desiredSizeToScale:itemManager:]([FPFetchRegularItemThumbnailsOperation alloc], "initWithDictionary:desiredSizeToScale:itemManager:", self->_dictionary, self->_itemManager, self->_desiredSize.width * self->_screenScale, self->_screenScale * self->_desiredSize.height);
    uint64_t v19 = v18;
    if (!v18)
    {
      uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
      v29 = [(NSMutableDictionary *)self->_dictionary allKeys];
      v30 = objc_msgSend(v28, "fp_invalidArgumentError:", @"can't fetch thumbnails for %@", v29);

      [(FPOperation *)self completedWithResult:0 error:v30];
      return;
    }
    [(FPFetchRegularItemThumbnailsOperation *)v18 setDelegate:self];
    [(NSMutableArray *)self->_subOperations addObject:v19];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v43 = 0x3032000000;
  id v44 = __Block_byref_object_copy__4;
  long long v45 = __Block_byref_object_dispose__4;
  id v46 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __34__FPFetchThumbnailsOperation_main__block_invoke;
  v36[3] = &unk_1E5AF2440;
  v36[4] = self;
  v36[5] = &buf;
  v20 = (void *)MEMORY[0x1A6248B00](v36);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __34__FPFetchThumbnailsOperation_main__block_invoke_2;
  v35[3] = &unk_1E5AF2468;
  v35[4] = self;
  v35[5] = &buf;
  v21 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v35];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v22 = self->_subOperations;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        [v26 setFinishedBlock:v20];
        [v21 addDependency:v26];
        [(NSOperationQueue *)self->_subOperationQueue addOperation:v26];
      }
      uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v23);
  }

  [(NSOperationQueue *)self->_subOperationQueue addOperation:v21];
  _Block_object_dispose(&buf, 8);
}

void __34__FPFetchThumbnailsOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v7 = v5;
    id v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    objc_sync_exit(v6);

    id v5 = v7;
  }
}

uint64_t __34__FPFetchThumbnailsOperation_main__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)cancel
{
  [(NSMutableArray *)self->_subOperations makeObjectsPerformSelector:sel_cancel];
  v3.receiver = self;
  v3.super_class = (Class)FPFetchThumbnailsOperation;
  [(FPOperation *)&v3 cancel];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(FPFetchThumbnailsOperation *)self thumbnailsFetchCompletionBlock];
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
    [(FPFetchThumbnailsOperation *)self setThumbnailsFetchCompletionBlock:0];
  }

  v10.receiver = self;
  v10.super_class = (Class)FPFetchThumbnailsOperation;
  [(FPOperation *)&v10 finishWithResult:v7 error:v6];
}

- (void)operation:(id)a3 didReceiveProgressInfo:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    v9 = [v7 objectForKeyedSubscript:@"identifier"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_super v10 = fp_current_or_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[FPFetchThumbnailsOperation operation:didReceiveProgressInfo:error:]((uint64_t)self, v10);
      }
      goto LABEL_42;
    }
    objc_super v10 = [v7 objectForKeyedSubscript:@"version"];
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v11 = fp_current_or_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[FPFetchThumbnailsOperation operation:didReceiveProgressInfo:error:].cold.7();
        }
        goto LABEL_41;
      }
    }
    if (v8)
    {
      [(FPFetchThumbnailsOperation *)self _perItemCompletionBlockFor:v9 version:v10 thumbnailURL:0 thumbnailData:0 contentType:0 metadata:0 error:v8];
LABEL_42:

      goto LABEL_43;
    }
    v11 = [v7 objectForKeyedSubscript:@"thumbnailData"];
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v12 = fp_current_or_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[FPFetchThumbnailsOperation operation:didReceiveProgressInfo:error:].cold.6();
        }
        goto LABEL_40;
      }
    }
    id v12 = [v7 objectForKeyedSubscript:@"thumbnailDataURLWrapper"];
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v13 = fp_current_or_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[FPFetchThumbnailsOperation operation:didReceiveProgressInfo:error:].cold.5();
        }
        goto LABEL_39;
      }
    }
    id v13 = [v7 objectForKeyedSubscript:@"contentType"];
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v14 = fp_current_or_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[FPFetchThumbnailsOperation operation:didReceiveProgressInfo:error:].cold.4();
        }
        goto LABEL_38;
      }
    }
    id v14 = [v7 objectForKeyedSubscript:@"thumbnailMetaData"];
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[FPFetchThumbnailsOperation operation:didReceiveProgressInfo:error:]();
      }
    }
    else
    {
      if ([v13 isEqualToString:@"com.apple.fileprovider.serialized-if-image"])
      {
        id v26 = 0;
        BOOL v15 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:getIFImageClass() fromData:v11 error:&v26];
        id v25 = v26;
        if (v15)
        {
          uint64_t v23 = v15;
          uint64_t v16 = objc_opt_new();
          [(id)*MEMORY[0x1E4F444E0] identifier];
          id v22 = v24 = v16;
          uint64_t v17 = _CGImageDestinationCreateWithData(v16, (uint64_t)v22);
          if (v17)
          {
            v18 = (const void *)v17;
            _CGImageDestinationAddImage(v17, [v23 CGImage]);
            _CGImageDestinationFinalize((uint64_t)v18);
            CFRelease(v18);
          }
          uint64_t v19 = self;
          v20 = v24;
          [(FPFetchThumbnailsOperation *)v19 _perItemCompletionBlockFor:v9 version:v10 thumbnailURL:0 thumbnailData:v24 contentType:v22 metadata:v14 error:0];

          BOOL v15 = v23;
        }
        else
        {
          v20 = fp_current_or_default_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            -[FPFetchThumbnailsOperation operation:didReceiveProgressInfo:error:]();
          }
        }

        goto LABEL_38;
      }
      v21 = [v12 url];
      [(FPFetchThumbnailsOperation *)self _perItemCompletionBlockFor:v9 version:v10 thumbnailURL:v21 thumbnailData:v11 contentType:v13 metadata:v14 error:0];
    }

LABEL_38:
LABEL_39:

LABEL_40:
LABEL_41:

    goto LABEL_42;
  }
LABEL_43:
}

- (void)_perItemCompletionBlockFor:(id)a3 version:(id)a4 thumbnailURL:(id)a5 thumbnailData:(id)a6 contentType:(id)a7 metadata:(id)a8 error:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (([(FPFetchThumbnailsOperation *)self isCancelled] & 1) == 0)
  {
    id v22 = [(FPFetchThumbnailsOperation *)self perThumbnailCompletionBlock];
    if (v22)
    {

LABEL_5:
      uint64_t v24 = [(FPOperation *)self callbackQueue];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __119__FPFetchThumbnailsOperation__perItemCompletionBlockFor_version_thumbnailURL_thumbnailData_contentType_metadata_error___block_invoke;
      v25[3] = &unk_1E5AF2490;
      v25[4] = self;
      id v26 = v18;
      id v27 = v17;
      id v28 = v15;
      id v29 = v19;
      id v30 = v21;
      id v31 = v16;
      id v32 = v20;
      dispatch_async(v24, v25);

      goto LABEL_6;
    }
    uint64_t v23 = [(FPFetchThumbnailsOperation *)self perThumbnailWithVersionCompletionBlock];

    if (v23) {
      goto LABEL_5;
    }
  }
LABEL_6:
}

void __119__FPFetchThumbnailsOperation__perItemCompletionBlockFor_version_thumbnailURL_thumbnailData_contentType_metadata_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) perThumbnailCompletionBlock];

  if (v2)
  {
    id v3 = *(id *)(a1 + 40);
    if (!v3)
    {
      id v3 = *(id *)(a1 + 48);
      if (v3)
      {
        int v7 = [v3 startAccessingSecurityScopedResource];
        id v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:*(void *)(a1 + 48) options:1 error:0];
        if (v7)
        {
          id v9 = v3;
          [*(id *)(a1 + 48) stopAccessingSecurityScopedResource];
          id v3 = v9;
        }
      }
    }
    id v8 = v3;
    v4 = [*(id *)(a1 + 32) perThumbnailCompletionBlock];
    ((void (**)(void, void, id, void, void))v4)[2](v4, *(void *)(a1 + 56), v8, *(void *)(a1 + 64), *(void *)(a1 + 72));
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) perThumbnailWithVersionCompletionBlock];

    if (!v5) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) perThumbnailWithVersionCompletionBlock];
    v6[2](v6, *(void *)(a1 + 56), *(void *)(a1 + 80), *(void *)(a1 + 48), *(void *)(a1 + 64), *(void *)(a1 + 88), *(void *)(a1 + 72));

    if (!*(void *)(a1 + 48)) {
      return;
    }
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v8 removeItemAtURL:*(void *)(a1 + 48) error:0];
  }
}

- (id)perThumbnailCompletionBlock
{
  return self->_perThumbnailCompletionBlock;
}

- (void)setPerThumbnailCompletionBlock:(id)a3
{
}

- (id)perThumbnailWithVersionCompletionBlock
{
  return self->_perThumbnailWithVersionCompletionBlock;
}

- (void)setPerThumbnailWithVersionCompletionBlock:(id)a3
{
}

- (id)thumbnailsFetchCompletionBlock
{
  return self->_thumbnailsFetchCompletionBlock;
}

- (void)setThumbnailsFetchCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_thumbnailsFetchCompletionBlock, 0);
  objc_storeStrong(&self->_perThumbnailWithVersionCompletionBlock, 0);
  objc_storeStrong(&self->_perThumbnailCompletionBlock, 0);
  objc_storeStrong((id *)&self->_subOperations, 0);
  objc_storeStrong((id *)&self->_subOperationQueue, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_placeHoldersItems, 0);
  objc_storeStrong((id *)&self->_appLibraryItems, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (void)operation:(uint64_t)a1 didReceiveProgressInfo:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  OUTLINED_FUNCTION_4_3();
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] <%@:%p>: identifier required to call per item completion block", v4, 0x16u);
}

- (void)operation:didReceiveProgressInfo:error:.cold.2()
{
  OUTLINED_FUNCTION_3_2();
  objc_opt_class();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_5(&dword_1A33AE000, v0, v1, "[DEBUG] <%@:%p>: failed to unarchive IFImage (%@)", v2, v3, v4, v5, v6);
}

- (void)operation:didReceiveProgressInfo:error:.cold.3()
{
  OUTLINED_FUNCTION_3_2();
  objc_opt_class();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_0_5(&dword_1A33AE000, v0, v1, "[DEBUG] <%@:%p>: thumbnail metadata provided is of an invalid type (%@)", v2, v3, v4, v5, v6);
}

- (void)operation:didReceiveProgressInfo:error:.cold.4()
{
  OUTLINED_FUNCTION_3_2();
  objc_opt_class();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_0_5(&dword_1A33AE000, v0, v1, "[DEBUG] <%@:%p>: contentType provided is of an invalid type (%@)", v2, v3, v4, v5, v6);
}

- (void)operation:didReceiveProgressInfo:error:.cold.5()
{
  OUTLINED_FUNCTION_3_2();
  objc_opt_class();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_0_5(&dword_1A33AE000, v0, v1, "[DEBUG] <%@:%p>: thumbnail data url provided is of an invalid type (%@)", v2, v3, v4, v5, v6);
}

- (void)operation:didReceiveProgressInfo:error:.cold.6()
{
  OUTLINED_FUNCTION_3_2();
  objc_opt_class();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_0_5(&dword_1A33AE000, v0, v1, "[DEBUG] <%@:%p>: thumbnail data provided is of an invalid type (%@)", v2, v3, v4, v5, v6);
}

- (void)operation:didReceiveProgressInfo:error:.cold.7()
{
  OUTLINED_FUNCTION_3_2();
  objc_opt_class();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_0_5(&dword_1A33AE000, v0, v1, "[DEBUG] <%@:%p>: version provided is of an invalid type (%@)", v2, v3, v4, v5, v6);
}

@end