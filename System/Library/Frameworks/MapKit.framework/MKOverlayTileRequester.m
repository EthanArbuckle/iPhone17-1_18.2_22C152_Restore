@interface MKOverlayTileRequester
@end

@implementation MKOverlayTileRequester

BOOL __42___MKOverlayTileRequester__doWorkOrFinish__block_invoke()
{
  BOOL result = _MKLinkedOnOrAfterReleaseSet(3081);
  _MergedGlobals_4 = !result;
  return result;
}

void __42___MKOverlayTileRequester__doWorkOrFinish__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + (int)*MEMORY[0x1E4F64CA0]));
  [WeakRetained tileRequesterFinished:*(void *)(a1 + 32)];
}

void __46___MKOverlayTileRequester__operationFinished___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = objc_alloc(MEMORY[0x1E4F64AB8]);
    v4 = [*(id *)(a1 + 32) data];
    uint64_t v5 = [v3 initWithData:v4];
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F64AB8]);
    v4 = [*(id *)(a1 + 32) data];
    uint64_t v5 = [v6 initWithDecodedRepresentation:v4];
  }
  id v8 = (id)v5;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + (int)*MEMORY[0x1E4F64CA0]));
  objc_msgSend(WeakRetained, "tileRequester:receivedData:tileEdition:tileSetDB:tileSet:etag:forKey:userInfo:", *(void *)(a1 + 40), v8, 1, 1, 0, 0, *(void *)(a1 + 48), *(void *)(a1 + 56), 0);
}

void __50___MKOverlayTileRequester__operationFailed_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + (int)*MEMORY[0x1E4F64CA0]));
  objc_msgSend(WeakRetained, "tileRequester:receivedError:forKey:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __32___MKOverlayTileRequester_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startOnWorkQueue];
}

uint64_t __36___MKOverlayTileRequester_isRunning__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) count];
  if (result)
  {
    BOOL v3 = 1;
  }
  else
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 80) count];
    BOOL v3 = result != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

uint64_t __33___MKOverlayTileRequester_cancel__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 80);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5++), "cancel", (void)v7);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }

  return [*(id *)(a1 + 32) _cleanup];
}

void __37___MKOverlayTileRequester_cancelKey___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 80);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v14 != v4) {
        objc_enumerationMutation(v2);
      }
      id v6 = *(void **)(*((void *)&v13 + 1) + 8 * v5);
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v17 = objc_msgSend(v6, "key", (void)v13);
      uint64_t v18 = v7;
      if (GEOTileKeyEquals()) {
        break;
      }
      if (v3 == ++v5)
      {
        uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v8 = v6;

    if (!v8) {
      goto LABEL_12;
    }
    [*(id *)(*(void *)(a1 + 32) + 80) removeObject:v8];
    [v8 cancel];
  }
  else
  {
LABEL_9:

LABEL_12:
    if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "count", (void)v13))
    {
      uint64_t v9 = 0;
      while (1)
      {
        long long v10 = [*(id *)(*(void *)(a1 + 32) + 72) objectAtIndexedSubscript:v9];
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        uint64_t v17 = [v10 key];
        uint64_t v18 = v11;
        char v12 = GEOTileKeyEquals();

        if (v12) {
          break;
        }
        if (++v9 >= (unint64_t)[*(id *)(*(void *)(a1 + 32) + 72) count]) {
          goto LABEL_19;
        }
      }
      if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
        [*(id *)(*(void *)(a1 + 32) + 72) removeObjectAtIndex:v9];
      }
    }
LABEL_19:
    id v8 = 0;
  }
}

@end