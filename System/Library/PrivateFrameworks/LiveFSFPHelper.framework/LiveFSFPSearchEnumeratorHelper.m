@interface LiveFSFPSearchEnumeratorHelper
+ (id)criteriaForQuery:(id)a3;
+ (id)newForQuery:(id)a3 withExtension:(id)a4;
- (NSSortDescriptor)sortD;
- (id)copySearchCompletionBlock;
- (id)copySearchResultBlock;
- (id)initForQuery:(id)a3 withExtension:(id)a4;
- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4;
- (void)finallyEnumerateItemsForObserver:(id)a3 inRange:(_NSRange)a4;
- (void)scheduleReaders;
- (void)setSortD:(id)a3;
- (void)start;
- (void)waitForSearchResultsForObserver:(id)a3 startingAtPage:(id)a4;
@end

@implementation LiveFSFPSearchEnumeratorHelper

- (id)initForQuery:(id)a3 withExtension:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *MEMORY[0x263F053F0];
  id v24 = 0;
  v10 = [v8 itemForIdentifier:v9 error:&v24];
  id v11 = v24;
  if (v10)
  {
    v23.receiver = self;
    v23.super_class = (Class)LiveFSFPSearchEnumeratorHelper;
    v12 = [(LiveFSFPEnumeratorHelper *)&v23 initForExtension:v8 item:v10];
    if (v12)
    {
      v13 = livefs_std_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[LiveFSFPSearchEnumeratorHelper initForQuery:withExtension:]();
      }

      objc_storeStrong(v12 + 9, a3);
      dispatch_queue_t v14 = dispatch_queue_create("search work queue", 0);
      id v15 = v12[11];
      v12[11] = v14;

      uint64_t v16 = objc_opt_new();
      id v17 = v12[10];
      v12[10] = (id)v16;

      uint64_t v18 = objc_opt_new();
      id v19 = v12[12];
      v12[12] = (id)v18;
    }
    self = v12;
    v20 = self;
  }
  else
  {
    v21 = livefs_std_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPSearchEnumeratorHelper initForQuery:withExtension:]();
    }

    v20 = 0;
  }

  return v20;
}

+ (id)newForQuery:(id)a3 withExtension:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initForQuery:v7 withExtension:v6];

  return v8;
}

+ (id)criteriaForQuery:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F52268]];
  v5 = livefs_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v3 filename];
    id v7 = [v3 allowedContentTypes];
    *(_DWORD *)buf = 136315650;
    id v24 = "+[LiveFSFPSearchEnumeratorHelper criteriaForQuery:]";
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_22CE49000, v5, OS_LOG_TYPE_INFO, "%s: filename '%@' allowed '%@'", buf, 0x20u);
  }
  uint64_t v8 = [v3 filename];
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    uint64_t v22 = v8;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    [v4 setObject:v10 forKey:*MEMORY[0x263F52258]];
  }
  id v11 = [v3 allowedContentTypes];
  if (([v11 containsObject:@"public.item"] & 1) == 0)
  {
    v12 = [v3 allowedPathExtensions];
    if (v12)
    {
      v13 = objc_opt_new();
      uint64_t v17 = MEMORY[0x263EF8330];
      uint64_t v18 = 3221225472;
      id v19 = __51__LiveFSFPSearchEnumeratorHelper_criteriaForQuery___block_invoke;
      v20 = &unk_264934068;
      id v14 = v13;
      id v21 = v14;
      [v12 enumerateObjectsUsingBlock:&v17];
      id v15 = livefs_std_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v24 = v11;
        __int16 v25 = 2112;
        id v26 = v14;
        _os_log_impl(&dword_22CE49000, v15, OS_LOG_TYPE_DEFAULT, "Content types %@ gave names %@", buf, 0x16u);
      }

      if (objc_msgSend(v14, "count", v17, v18, v19, v20)) {
        [v4 setObject:v14 forKey:*MEMORY[0x263F52260]];
      }
    }
  }

  return v4;
}

void __51__LiveFSFPSearchEnumeratorHelper_criteriaForQuery___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [@"." stringByAppendingString:a2];
  [v2 addObject:v3];
}

- (void)scheduleReaders
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = (void *)[(NSMutableArray *)self->_pendingReaderBlocks copy];
  [(NSMutableArray *)self->_pendingReaderBlocks removeAllObjects];
  v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_22CE49000, v4, OS_LOG_TYPE_INFO, "Starting to schedule readers %@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__LiveFSFPSearchEnumeratorHelper_scheduleReaders__block_invoke;
  v6[3] = &unk_264934090;
  v6[4] = self;
  [v3 enumerateObjectsUsingBlock:v6];
  v5 = livefs_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22CE49000, v5, OS_LOG_TYPE_INFO, "Done scheduling", buf, 2u);
  }
}

void __49__LiveFSFPSearchEnumeratorHelper_scheduleReaders__block_invoke(uint64_t a1, void *a2)
{
}

- (id)copySearchResultBlock
{
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke;
  v6[3] = &unk_264934108;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  id v3 = (void *)MEMORY[0x230F765B0](v6);
  v4 = (void *)[v3 copy];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = livefs_std_log();
  id v11 = v10;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "-[LiveFSFPSearchEnumeratorHelper copySearchResultBlock]_block_invoke";
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl(&dword_22CE49000, v11, OS_LOG_TYPE_INFO, "%s: got paths %@", buf, 0x16u);
    }

    v12 = WeakRetained[11];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke_37;
    block[3] = &unk_2649340E0;
    uint64_t v16 = v7;
    id v13 = v8;
    int v20 = a4;
    uint64_t v14 = *(void *)(a1 + 32);
    id v17 = v13;
    uint64_t v18 = v14;
    id v19 = WeakRetained;
    dispatch_async(v12, block);

    id v11 = v16;
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke_cold_1(v11);
  }
}

void __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke_37(uint64_t a1)
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke_2;
  v7[3] = &unk_2649340B8;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  int v11 = *(_DWORD *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 48);
  id v8 = v3;
  uint64_t v9 = v4;
  v10 = &v12;
  [v2 enumerateObjectsUsingBlock:v7];

  if (*((unsigned char *)v13 + 24))
  {
    v5 = livefs_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_22CE49000, v5, OS_LOG_TYPE_INFO, "Added some, waking", v6, 2u);
    }

    [*(id *)(a1 + 56) scheduleReaders];
  }
  _Block_object_dispose(&v12, 8);
}

void __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v11 = a2;
  v5 = (char *)[v11 fileSystemRepresentation];
  if (v5 && *v5 && *v5 != 46 && !strstr(v5, "/."))
  {
    id v6 = objc_opt_new();
    [v6 setPath:v11];
    id v7 = [v6 path];
    id v8 = [v7 lastPathComponent];
    [v6 setFilename:v8];

    uint64_t v9 = [objc_retainAutorelease(*(id *)(a1 + 32)) bytes] + (*(_DWORD *)(a1 + 56) * a3);
    v10 = [NSNumber numberWithDouble:(double)*(uint64_t *)(v9 + 96) + (double)*(uint64_t *)(v9 + 104) * 0.000000001];
    [v6 setModTime:v10];

    [*(id *)(*(void *)(a1 + 40) + 80) addObject:v6];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (id)copySearchCompletionBlock
{
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__LiveFSFPSearchEnumeratorHelper_copySearchCompletionBlock__block_invoke;
  v6[3] = &unk_264934158;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  id v3 = (void *)MEMORY[0x230F765B0](v6);
  uint64_t v4 = (void *)[v3 copy];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __59__LiveFSFPSearchEnumeratorHelper_copySearchCompletionBlock__block_invoke(uint64_t a1, int a2)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[11];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__LiveFSFPSearchEnumeratorHelper_copySearchCompletionBlock__block_invoke_44;
    block[3] = &unk_264934130;
    int v9 = a2;
    void block[4] = *(void *)(a1 + 32);
    block[5] = v5;
    dispatch_async(v6, block);
  }
  else
  {
    id v7 = livefs_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke_cold_1(v7);
    }
  }
}

uint64_t __59__LiveFSFPSearchEnumeratorHelper_copySearchCompletionBlock__block_invoke_44(uint64_t a1)
{
  uint64_t v2 = a1 + 48;
  int v3 = *(_DWORD *)(a1 + 48);
  uint64_t v4 = livefs_std_log();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59__LiveFSFPSearchEnumeratorHelper_copySearchCompletionBlock__block_invoke_44_cold_2(a1, v2, v5);
    }
    uint64_t v6 = 3;
  }
  else
  {
    uint64_t v6 = 2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __59__LiveFSFPSearchEnumeratorHelper_copySearchCompletionBlock__block_invoke_44_cold_1(a1, v5);
    }
  }

  [*(id *)(a1 + 40) setState:v6];
  return [*(id *)(a1 + 40) scheduleReaders];
}

- (void)start
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_22CE49000, v0, OS_LOG_TYPE_ERROR, "%s: Error ensuring file handle, got error %@", (uint8_t *)v1, 0x16u);
}

void __39__LiveFSFPSearchEnumeratorHelper_start__block_invoke(uint64_t a1, void *a2)
{
}

void __39__LiveFSFPSearchEnumeratorHelper_start__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v4 = livefs_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __39__LiveFSFPSearchEnumeratorHelper_start__block_invoke_2_cold_1(a1, a2, v4);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (void)finallyEnumerateItemsForObserver:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = objc_opt_new();
  int v21 = location;
  if ([(LiveFSFPEnumeratorHelper *)self state] == 2)
  {
    unint64_t v9 = [(NSMutableArray *)self->searchResults count];
    if (v9 <= location)
    {
      [v7 finishEnumeratingUpToPage:0];
      goto LABEL_16;
    }
    unint64_t v10 = (location + 64);
    BOOL v11 = v9 <= v10;
    if (v9 <= v10) {
      NSUInteger length = v9 - location;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  uint64_t v12 = livefs_std_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = [(LiveFSFPEnumeratorHelper *)self state];
    searchResults = self->searchResults;
    *(_DWORD *)buf = 134219008;
    __int16 v23 = self;
    __int16 v24 = 1024;
    int v25 = v13;
    __int16 v26 = 2048;
    NSUInteger v27 = location;
    __int16 v28 = 2048;
    NSUInteger v29 = length;
    __int16 v30 = 2048;
    v31 = searchResults;
    _os_log_impl(&dword_22CE49000, v12, OS_LOG_TYPE_INFO, "enumerator helper[%p]: state %d range: %lu -> %lu out of %p,", buf, 0x30u);
  }

  char v15 = -[NSMutableArray subarrayWithRange:](self->searchResults, "subarrayWithRange:", location, length);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __75__LiveFSFPSearchEnumeratorHelper_finallyEnumerateItemsForObserver_inRange___block_invoke;
  v19[3] = &unk_2649341D0;
  v19[4] = self;
  uint64_t v16 = v8;
  int v20 = v16;
  [v15 enumerateObjectsUsingBlock:v19];
  id v17 = livefs_std_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v23 = v16;
    _os_log_impl(&dword_22CE49000, v17, OS_LOG_TYPE_INFO, "Built results %@", buf, 0xCu);
  }

  [v7 didEnumerateItems:v16];
  if (v11)
  {
    [v7 finishEnumeratingUpToPage:0];
  }
  else
  {
    int v21 = location + 64;
    uint64_t v18 = [MEMORY[0x263EFF8F8] dataWithBytes:&v21 length:4];
    [v7 finishEnumeratingUpToPage:v18];
  }
LABEL_16:
}

void __75__LiveFSFPSearchEnumeratorHelper_finallyEnumerateItemsForObserver_inRange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v5 = [v3 path];
  uint64_t v6 = [*(id *)(a1 + 32) enumeratedItem];
  id v7 = [v4 itemAtPath:v5 parent:v6];

  if (v7)
  {
    [*(id *)(a1 + 40) addObject:v7];
  }
  else
  {
    id v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __75__LiveFSFPSearchEnumeratorHelper_finallyEnumerateItemsForObserver_inRange___block_invoke_cold_1(v3, v8);
    }
  }
}

- (void)waitForSearchResultsForObserver:(id)a3 startingAtPage:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = livefs_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = [(LiveFSFPEnumeratorHelper *)self state];
    int v10 = [v7 isEqual:*MEMORY[0x263F053B0]];
    int v11 = [v7 isEqual:*MEMORY[0x263F053A8]];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[LiveFSFPSearchEnumeratorHelper waitForSearchResultsForObserver:startingAtPage:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v9;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v10;
    LOWORD(v32) = 1024;
    *(_DWORD *)((char *)&v32 + 2) = v11;
    _os_log_impl(&dword_22CE49000, v8, OS_LOG_TYPE_INFO, "%s: entered state %d page issbn %d, issbd %d", buf, 0x1Eu);
  }

  if (![(LiveFSFPEnumeratorHelper *)self state]) {
    [(LiveFSFPSearchEnumeratorHelper *)self start];
  }
  if ([(LiveFSFPEnumeratorHelper *)self state] == 3)
  {
    uint64_t v12 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:89];
    [v6 finishEnumeratingWithError:v12];
    int v13 = livefs_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[LiveFSFPSearchEnumeratorHelper waitForSearchResultsForObserver:startingAtPage:]();
    }
  }
  else
  {
    if (([v7 isEqual:*MEMORY[0x263F053B0]] & 1) != 0
      || ([v7 isEqual:*MEMORY[0x263F053A8]] & 1) != 0)
    {
      LODWORD(v14) = 0;
    }
    else if ([v7 length] != 4 {
           || (unint64_t v14 = *(unsigned int *)[v7 bytes], (v14 & 0x3F) != 0)
    }
           || [(NSMutableArray *)self->searchResults count] <= v14)
    {
      int v20 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:22];
      [v6 finishEnumeratingWithError:v20];

      goto LABEL_18;
    }
    char v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      searchResults = self->searchResults;
      *(_DWORD *)buf = 134218752;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v32 = 64;
      LOWORD(v33) = 2048;
      *(void *)((char *)&v33 + 2) = searchResults;
      _os_log_impl(&dword_22CE49000, v15, OS_LOG_TYPE_INFO, "enumerator helper[%p]: range: %lu -> %lu out of %p,", buf, 0x2Au);
    }

    if ([(LiveFSFPEnumeratorHelper *)self state] == 2
      || [(NSMutableArray *)self->searchResults count] >= (unint64_t)(v14 + 64))
    {
      -[LiveFSFPSearchEnumeratorHelper finallyEnumerateItemsForObserver:inRange:](self, "finallyEnumerateItemsForObserver:inRange:", v6, v14, 64);
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3042000000;
      uint64_t v32 = (uint64_t)__Block_byref_object_copy__51;
      *(void *)&long long v33 = __Block_byref_object_dispose__52;
      *((void *)&v33 + 1) = 0;
      uint64_t v21 = MEMORY[0x263EF8330];
      uint64_t v22 = 3221225472;
      __int16 v23 = __81__LiveFSFPSearchEnumeratorHelper_waitForSearchResultsForObserver_startingAtPage___block_invoke;
      __int16 v24 = &unk_2649341F8;
      NSUInteger v27 = buf;
      int v25 = self;
      int v30 = v14;
      id v26 = v6;
      uint64_t v28 = v14;
      uint64_t v29 = 64;
      id v17 = (void *)MEMORY[0x230F765B0](&v21);
      objc_storeWeak((id *)(*(void *)&buf[8] + 40), v17);
      pendingReaderBlocks = self->_pendingReaderBlocks;
      id v19 = (void *)MEMORY[0x230F765B0](v17);
      -[NSMutableArray addObject:](pendingReaderBlocks, "addObject:", v19, v21, v22, v23, v24, v25);

      _Block_object_dispose(buf, 8);
      objc_destroyWeak((id *)&v33 + 1);
    }
  }
LABEL_18:
}

void __81__LiveFSFPSearchEnumeratorHelper_waitForSearchResultsForObserver_startingAtPage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  if (!WeakRetained || [*(id *)(a1 + 32) state] == 3)
  {
    uint64_t v2 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:89];
    [*(id *)(a1 + 40) finishEnumeratingWithError:v2];
LABEL_4:

    goto LABEL_9;
  }
  if ([*(id *)(a1 + 32) state] != 2)
  {
    unint64_t v3 = (*(_DWORD *)(a1 + 72) + 64);
    if ([*(id *)(*(void *)(a1 + 32) + 80) count] < v3)
    {
      uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 96);
      uint64_t v2 = (void *)MEMORY[0x230F765B0](WeakRetained);
      [v4 addObject:v2];
      goto LABEL_4;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "finallyEnumerateItemsForObserver:inRange:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 64));
LABEL_9:
}

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  searchWorkQueue = self->_searchWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__LiveFSFPSearchEnumeratorHelper_enumerateItemsForObserver_startingAtPage___block_invoke;
  block[3] = &unk_264934220;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(searchWorkQueue, block);
}

uint64_t __75__LiveFSFPSearchEnumeratorHelper_enumerateItemsForObserver_startingAtPage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) waitForSearchResultsForObserver:*(void *)(a1 + 40) startingAtPage:*(void *)(a1 + 48)];
}

- (NSSortDescriptor)sortD
{
  return (NSSortDescriptor *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSortD:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortD, 0);
  objc_storeStrong((id *)&self->_pendingReaderBlocks, 0);
  objc_storeStrong((id *)&self->_searchWorkQueue, 0);
  objc_storeStrong((id *)&self->searchResults, 0);
  objc_storeStrong((id *)&self->_ourSearchQuery, 0);
}

- (void)initForQuery:withExtension:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22CE49000, v0, OS_LOG_TYPE_ERROR, "Error %@ retrieving root item. Search aborted.", v1, 0xCu);
}

- (void)initForQuery:withExtension:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_22CE49000, v0, OS_LOG_TYPE_DEBUG, "enumerator helper[%p]: Creating search enumerator", v1, 0xCu);
}

void __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22CE49000, log, OS_LOG_TYPE_ERROR, "gettingStrongSelf failed", v1, 2u);
}

void __59__LiveFSFPSearchEnumeratorHelper_copySearchCompletionBlock__block_invoke_44_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  unint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 72) searchContainerItemIdentifier];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_22CE49000, a2, OS_LOG_TYPE_DEBUG, "Search %@ completed", v4, 0xCu);
}

void __59__LiveFSFPSearchEnumeratorHelper_copySearchCompletionBlock__block_invoke_44_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 72) searchContainerItemIdentifier];
  OUTLINED_FUNCTION_0();
  __int16 v7 = 1024;
  int v8 = v5;
  _os_log_error_impl(&dword_22CE49000, a3, OS_LOG_TYPE_ERROR, "Search %@ ended with error %d", v6, 0x12u);
}

void __39__LiveFSFPSearchEnumeratorHelper_start__block_invoke_2_cold_1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  v4[0] = 67109378;
  v4[1] = a2;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_error_impl(&dword_22CE49000, log, OS_LOG_TYPE_ERROR, "Error %d starting search %@", (uint8_t *)v4, 0x12u);
}

void __75__LiveFSFPSearchEnumeratorHelper_finallyEnumerateItemsForObserver_inRange___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 path];
  int v4 = 136315394;
  __int16 v5 = "-[LiveFSFPSearchEnumeratorHelper finallyEnumerateItemsForObserver:inRange:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_22CE49000, a2, OS_LOG_TYPE_ERROR, "%s: unable to find item at path %@", (uint8_t *)&v4, 0x16u);
}

- (void)waitForSearchResultsForObserver:startingAtPage:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_22CE49000, v0, OS_LOG_TYPE_DEBUG, "enumerator helper[%p]: returning ECANCELED", v1, 0xCu);
}

@end