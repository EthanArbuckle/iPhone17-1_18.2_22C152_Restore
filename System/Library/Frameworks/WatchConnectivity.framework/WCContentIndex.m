@interface WCContentIndex
- (BOOL)invalidated;
- (BOOL)isEqual:(id)a3;
- (NSArray)index;
- (NSMutableArray)cachedContentIndex;
- (NSOperationQueue)operationQueue;
- (NSString)description;
- (NSURL)itemURL;
- (WCContentIndex)initWithContainingFolder:(id)a3;
- (id)addContentIdentifier:(id)a3;
- (id)commit;
- (id)lastGenerationIdentifier;
- (unint64_t)hash;
- (void)commit;
- (void)invalidate;
- (void)loadContentIfNecessary;
- (void)removeContentIdentifier:(id)a3;
- (void)setCachedContentIndex:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setItemURL:(id)a3;
- (void)setLastGenerationIdentifier:(id)a3;
- (void)setOperationQueue:(id)a3;
@end

@implementation WCContentIndex

- (WCContentIndex)initWithContainingFolder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WCContentIndex;
  v5 = [(WCContentIndex *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 URLByAppendingPathComponent:@"contents.index" isDirectory:0];
    itemURL = v5->_itemURL;
    v5->_itemURL = (NSURL *)v6;

    uint64_t v8 = objc_opt_new();
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = (NSOperationQueue *)v8;

    [(NSOperationQueue *)v5->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v5->_operationQueue setQualityOfService:17];
    [(WCContentIndex *)v5 loadContentIfNecessary];
    [MEMORY[0x263F08830] addFilePresenter:v5];
  }

  return v5;
}

- (void)invalidate
{
  [(WCContentIndex *)self setInvalidated:1];
  v3 = (void *)MEMORY[0x263F08830];

  [v3 removeFilePresenter:self];
}

- (void)loadContentIfNecessary
{
  *a2 = 136446466;
  OUTLINED_FUNCTION_0_1((uint64_t)a1, (uint64_t)a2, (uint64_t)"-[WCContentIndex loadContentIfNecessary]");
  OUTLINED_FUNCTION_1_0(&dword_222A02000, v3, (uint64_t)v3, "%{public}s could not get generation identifier for index file with error: %{public}@", v4);
}

void __40__WCContentIndex_loadContentIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v2 + 40);
  v3 = (id *)(v2 + 40);
  if (!v4)
  {
    id obj = 0;
    uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:a2 options:0 error:&obj];
    objc_storeStrong(v3, obj);
    if (v6)
    {
      v7 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      id v11 = 0;
      uint64_t v8 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:1 format:0 error:&v11];
      objc_storeStrong(v7, v11);
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }
}

- (NSArray)index
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263F088D8]) initWithTarget:self selector:sel_loadContentIfNecessary object:0];
  uint64_t v4 = [(WCContentIndex *)self presentedItemOperationQueue];
  v9[0] = v3;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [v4 addOperations:v5 waitUntilFinished:1];

  uint64_t v6 = [(WCContentIndex *)self cachedContentIndex];
  v7 = (void *)[v6 copy];

  return (NSArray *)v7;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WCContentIndex *)self itemURL];
  v7 = [v6 path];
  uint64_t v8 = [(WCContentIndex *)self cachedContentIndex];
  uint64_t v9 = WCCompactStringFromCollection(v8);
  v10 = [v3 stringWithFormat:@"<%@: %p, file: %@, index: %@>", v5, self, v7, v9];

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (WCContentIndex *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(WCContentIndex *)self itemURL];
      v7 = [(WCContentIndex *)v5 itemURL];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v2 = [(WCContentIndex *)self itemURL];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)addContentIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(WCContentIndex *)self cachedContentIndex];
    [v5 addObject:v4];

    uint64_t v6 = [(WCContentIndex *)self commit];
    if (v6)
    {
      v7 = [(WCContentIndex *)self cachedContentIndex];
      [v7 removeObject:v4];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)removeContentIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(WCContentIndex *)self cachedContentIndex];
    int v6 = [v5 containsObject:v4];

    if (v6)
    {
      v7 = [(WCContentIndex *)self cachedContentIndex];
      [v7 removeObject:v4];

      id v8 = [(WCContentIndex *)self commit];
    }
    else
    {
      uint64_t v9 = wc_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(WCContentIndex *)(uint64_t)v4 removeContentIdentifier:v10];
      }
    }
  }
}

- (id)commit
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(WCContentIndex *)self cachedContentIndex];
  unint64_t v4 = [v3 count];

  if (v4 < 0x1B59)
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__0;
    v27 = __Block_byref_object_dispose__0;
    id v28 = 0;
    v14 = (void *)[objc_alloc(MEMORY[0x263F08830]) initWithFilePresenter:self];
    v15 = [(WCContentIndex *)self presentedItemURL];
    v17 = (id *)(v24 + 5);
    v16 = (void *)v24[5];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __24__WCContentIndex_commit__block_invoke;
    v21[3] = &unk_26463C670;
    v21[5] = &v23;
    id obj = v16;
    v21[4] = self;
    [v14 coordinateWritingItemAtURL:v15 options:8 error:&obj byAccessor:v21];
    objc_storeStrong(v17, obj);

    if (v24[5])
    {
      v18 = wc_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = NSPrintF();
        [(WCContentIndex *)v19 commit];
      }
    }
    _Block_object_dispose(&v23, 8);

    v13 = 0;
  }
  else
  {
    v5 = [(WCContentIndex *)self cachedContentIndex];
    unint64_t v6 = [v5 count];

    if (v6 >= 0x1B63)
    {
      v7 = [(WCContentIndex *)self cachedContentIndex];
      int v8 = [v7 count];

      uint64_t v9 = [(WCContentIndex *)self cachedContentIndex];
      uint64_t v10 = objc_msgSend(v9, "subarrayWithRange:", v8 - 7000, 7000);
      id v11 = (void *)[v10 mutableCopy];
      [(WCContentIndex *)self setCachedContentIndex:v11];
    }
    v12 = wc_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(WCContentIndex *)self commit];
    }

    v13 = [MEMORY[0x263F087E8] wcErrorWithCode:7015 userInfo:0];
  }

  return v13;
}

void __24__WCContentIndex_commit__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1 + 40;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v5 = (void *)MEMORY[0x263F08AC0];
    unint64_t v6 = [*(id *)(a1 + 32) cachedContentIndex];
    v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id obj = 0;
    int v8 = [v5 dataWithPropertyList:v6 format:200 options:0 error:&obj];
    objc_storeStrong(v7, obj);

    if (v8)
    {
      uint64_t v9 = *(void *)(*(void *)v4 + 8);
      id v12 = *(id *)(v9 + 40);
      char v10 = [v8 writeToURL:v3 options:1073741825 error:&v12];
      objc_storeStrong((id *)(v9 + 40), v12);
      if ((v10 & 1) != 0 || [*(id *)(*(void *)(*(void *)v4 + 8) + 40) code] == 4) {
        goto LABEL_10;
      }
      id v11 = wc_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __24__WCContentIndex_commit__block_invoke_cold_2(v4, v3, v11);
      }
    }
    else
    {
      id v11 = wc_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __24__WCContentIndex_commit__block_invoke_cold_1(v4, v11);
      }
    }

LABEL_10:
  }
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSMutableArray)cachedContentIndex
{
  return self->_cachedContentIndex;
}

- (void)setCachedContentIndex:(id)a3
{
}

- (id)lastGenerationIdentifier
{
  return self->_lastGenerationIdentifier;
}

- (void)setLastGenerationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastGenerationIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedContentIndex, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_itemURL, 0);
}

- (void)removeContentIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 136446466;
  uint64_t v4 = "-[WCContentIndex removeContentIdentifier:]";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_1_0(&dword_222A02000, a2, a3, "%{public}s identifier not in index %{public}@", (uint8_t *)&v3);
}

- (void)commit
{
  *a2 = 136446466;
  OUTLINED_FUNCTION_0_1((uint64_t)a1, (uint64_t)a2, (uint64_t)"-[WCContentIndex commit]");
  OUTLINED_FUNCTION_1_0(&dword_222A02000, v3, (uint64_t)v3, "%{public}s could not coordinate writing to index file with error: %{public}@", v4);
}

void __24__WCContentIndex_commit__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  int v3 = NSPrintF();
  int v5 = 136446466;
  uint64_t v6 = "-[WCContentIndex commit]_block_invoke";
  __int16 v7 = 2114;
  int v8 = v3;
  OUTLINED_FUNCTION_1_0(&dword_222A02000, a2, v4, "%{public}s could not serialize content data %{public}@", (uint8_t *)&v5);
}

void __24__WCContentIndex_commit__block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  int v5 = NSPrintF();
  uint64_t v6 = [a2 path];
  *(_DWORD *)buf = 136446722;
  int v8 = "-[WCContentIndex commit]_block_invoke";
  __int16 v9 = 2114;
  char v10 = v5;
  __int16 v11 = 2114;
  id v12 = v6;
  _os_log_error_impl(&dword_222A02000, a3, OS_LOG_TYPE_ERROR, "%{public}s error %{public}@ writing file to %{public}@", buf, 0x20u);
}

@end