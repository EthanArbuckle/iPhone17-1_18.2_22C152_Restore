@interface GEOTileDBWriteQueue
@end

@implementation GEOTileDBWriteQueue

void __85___GEOTileDBWriteQueue__prunePendingOperationsSupercededByOperationOnIsolationQueue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if ([a2 isSupercededByOperation:*(void *)(a1 + 32)])
  {
    v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v5)
    {
      [v5 addIndex:a3];
    }
    else
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:a3];
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }
}

uint64_t __47___GEOTileDBWriteQueue_flushPendingOperations___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushPendingOperations];
}

void __47___GEOTileDBWriteQueue__flushPendingOperations__block_invoke_411(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
        objc_msgSend(v7, "performWithDB:", WeakRetained, (void)v9);

        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) |= [v7 canIncreaseDataSizeInDB];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void __77___GEOTileDBWriteQueue_dataForKey_ETag_originalLoadReason_isKnownNotToExist___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1[4] + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v15 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
      uint64_t v8 = a1[7];
      uint64_t v9 = *(void *)(a1[6] + 8);
      id obj = *(id *)(v9 + 40);
      uint64_t v10 = [v7 dataForKey:a1[8] ETag:&obj originalLoadReason:a1[9] isKnownNotToExist:*(void *)(v8 + 8) + 24];
      objc_storeStrong((id *)(v9 + 40), obj);
      uint64_t v11 = *(void *)(a1[5] + 8);
      long long v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      if (*(void *)(*(void *)(a1[5] + 8) + 40) || *(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __47___GEOTileDBWriteQueue__flushPendingOperations__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

uint64_t __37___GEOTileDBWriteQueue_addOperation___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[3])
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    uint64_t v2 = *(void **)(a1 + 32);
  }
  [v2 _prunePendingOperationsSupercededByOperationOnIsolationQueue:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  unint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 24) count];
  uint64_t result = *(void *)(a1 + 32);
  if (v6 >= *(void *)(result + 8)) {
    return objc_msgSend((id)result, "flushPendingOperations:", 0, (void)v14);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = *(id *)(result + 24);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v8);
        }
        v11 += objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "sizeInBytes", (void)v14);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
  }

  uint64_t result = *(void *)(a1 + 32);
  if (v11 >= *(void *)(result + 16)) {
    return objc_msgSend((id)result, "flushPendingOperations:", 0, (void)v14);
  }
  return result;
}

void __48___GEOTileDBWriteQueue_dropAllPendingOperations__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    uint64_t v2 = GEOGetTileDBLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) count];
      int v6 = 134217984;
      uint64_t v7 = v3;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "Dropping %llu pending writes on the floor", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = 0;
  }
}

uint64_t __68___GEOTileDBWriteQueue_prunePendingOperationsSupercededByOperation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prunePendingOperationsSupercededByOperationOnIsolationQueue:*(void *)(a1 + 40)];
}

@end