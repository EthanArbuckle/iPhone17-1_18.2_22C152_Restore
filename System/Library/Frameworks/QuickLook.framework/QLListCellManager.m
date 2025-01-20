@interface QLListCellManager
- (NSMutableDictionary)operations;
- (NSOperationQueue)generationQueue;
- (QLListCellManager)init;
- (void)_operationDidFinish:(id)a3;
- (void)dealloc;
- (void)operation:(id)a3 didDetermineFileSize:(id)a4 fileTypeString:(id)a5;
- (void)operation:(id)a3 didGenerateThumbnail:(id)a4;
- (void)setGenerationQueue:(id)a3;
- (void)setOperations:(id)a3;
- (void)setupCell:(id)a3 withItem:(id)a4 atIndex:(unint64_t)a5;
@end

@implementation QLListCellManager

- (QLListCellManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)QLListCellManager;
  v2 = [(QLListCellManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    operations = v2->_operations;
    v2->_operations = (NSMutableDictionary *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.quicklook.celllistmanager.serialqueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    generationQueue = v2->_generationQueue;
    v2->_generationQueue = (NSOperationQueue *)v7;

    [(NSOperationQueue *)v2->_generationQueue setMaxConcurrentOperationCount:4];
    v9 = v2;
  }

  return v2;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_generationQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)QLListCellManager;
  [(QLListCellManager *)&v3 dealloc];
}

- (void)setupCell:(id)a3 withItem:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  serialQueue = self->_serialQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__QLListCellManager_setupCell_withItem_atIndex___block_invoke;
  v13[3] = &unk_2642F5770;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(serialQueue, v13);
}

void __48__QLListCellManager_setupCell_withItem_atIndex___block_invoke(uint64_t a1)
{
  v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  objc_super v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v2];
  v4 = v3;
  if (v3) {
    [v3 cancel];
  }
  [*(id *)(a1 + 40) setRow:*(void *)(a1 + 56)];
  dispatch_queue_t v5 = [[QLListCellDataGenerationOperation alloc] initWithListCell:*(void *)(a1 + 40) index:*(void *)(a1 + 56) item:*(void *)(a1 + 48) delegate:*(void *)(a1 + 32)];
  objc_initWeak(&location, v5);
  objc_initWeak(&from, *(id *)(a1 + 32));
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __48__QLListCellManager_setupCell_withItem_atIndex___block_invoke_2;
  id v9 = &unk_2642F61B0;
  objc_copyWeak(&v10, &from);
  objc_copyWeak(&v11, &location);
  [(QLListCellDataGenerationOperation *)v5 setCompletionBlock:&v6];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v5, v2, v6, v7, v8, v9);
  [*(id *)(*(void *)(a1 + 32) + 24) addOperation:v5];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __48__QLListCellManager_setupCell_withItem_atIndex___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _operationDidFinish:v2];
}

- (void)_operationDidFinish:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "index"));
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__QLListCellManager__operationDidFinish___block_invoke;
  block[3] = &unk_2642F5078;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_sync(serialQueue, block);
}

void __41__QLListCellManager__operationDidFinish___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  objc_super v3 = (void *)a1[6];

  if (v2 == v3)
  {
    uint64_t v4 = a1[5];
    dispatch_queue_t v5 = *(void **)(a1[4] + 16);
    [v5 removeObjectForKey:v4];
  }
}

- (void)operation:(id)a3 didGenerateThumbnail:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isCancelled] & 1) == 0)
  {
    serialQueue = self->_serialQueue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__QLListCellManager_operation_didGenerateThumbnail___block_invoke;
    v9[3] = &unk_2642F50C8;
    id v10 = v6;
    id v11 = v7;
    dispatch_sync(serialQueue, v9);
  }
}

void __52__QLListCellManager_operation_didGenerateThumbnail___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) index];
  id v4 = [*(id *)(a1 + 32) cell];
  if (v2 == [v4 row])
  {
    char v3 = [*(id *)(a1 + 32) isCancelled];

    if ((v3 & 1) == 0)
    {
      id v5 = *(id *)(a1 + 32);
      id v6 = *(id *)(a1 + 40);
      QLRunInMainThread();
    }
  }
  else
  {
  }
}

void __52__QLListCellManager_operation_didGenerateThumbnail___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) cell];
  [v2 setThumbnail:v1];
}

- (void)operation:(id)a3 didDetermineFileSize:(id)a4 fileTypeString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v8 isCancelled] & 1) == 0)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__QLListCellManager_operation_didDetermineFileSize_fileTypeString___block_invoke;
    block[3] = &unk_2642F5078;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_sync(serialQueue, block);
  }
}

void __67__QLListCellManager_operation_didDetermineFileSize_fileTypeString___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) index];
  id v10 = [*(id *)(a1 + 32) cell];
  if (v2 == [v10 row])
  {
    char v3 = [*(id *)(a1 + 32) isCancelled];

    if (v3) {
      return;
    }
    id v4 = objc_msgSend(MEMORY[0x263F086F0], "stringFromByteCount:countStyle:", objc_msgSend(*(id *)(a1 + 40), "longLongValue"), 0);
    id v5 = v4;
    id v6 = *(void **)(a1 + 48);
    if (v6 && v4)
    {
      id v7 = [NSString stringWithFormat:@"%@ – %@", *(void *)(a1 + 48), v4];
    }
    else if (v6)
    {
      id v7 = v6;
    }
    else
    {
      if (!v4)
      {
        id v8 = 0;
        goto LABEL_14;
      }
      id v7 = v4;
    }
    id v8 = v7;
LABEL_14:
    id v11 = *(id *)(a1 + 32);
    id v9 = v8;
    QLRunInMainThread();

    return;
  }
}

void __67__QLListCellManager_operation_didDetermineFileSize_fileTypeString___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) cell];
  [v2 setSubtitleString:v1];
}

- (NSMutableDictionary)operations
{
  return self->_operations;
}

- (void)setOperations:(id)a3
{
}

- (NSOperationQueue)generationQueue
{
  return self->_generationQueue;
}

- (void)setGenerationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationQueue, 0);
  objc_storeStrong((id *)&self->_operations, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end