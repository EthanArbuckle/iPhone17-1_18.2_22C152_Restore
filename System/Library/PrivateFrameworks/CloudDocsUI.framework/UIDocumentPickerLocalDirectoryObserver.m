@interface UIDocumentPickerLocalDirectoryObserver
@end

@implementation UIDocumentPickerLocalDirectoryObserver

id *__61___UIDocumentPickerLocalDirectoryObserver_setQueryPredicate___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  result = (id *)(*(void *)(a1 + 32) + 72);
  if (*result != v2)
  {
    objc_storeStrong(result, v2);
    result = (id *)[*(id *)(*(void *)(a1 + 32) + 96) count];
    if (result)
    {
      v4 = *(void **)(a1 + 32);
      return (id *)[v4 updateResultsForSource:0];
    }
  }
  return result;
}

uint64_t __57___UIDocumentPickerLocalDirectoryObserver_queryPredicate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x270F9A758](v2, v4);
}

void __58___UIDocumentPickerLocalDirectoryObserver_setStaticItems___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v3 != v2 && (objc_msgSend(v3, "isEqualToOrderedSet:") & 1) == 0)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "indexOfObject:", v11, (void)v17);
          if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          {
            [v4 addObject:v11];
          }
          else
          {
            v13 = [*(id *)(*(void *)(a1 + 32) + 64) objectAtIndex:v12];
            [v5 addObject:v13];
            [v4 addObject:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    uint64_t v14 = [v4 copy];
    uint64_t v15 = *(void *)(a1 + 32);
    v16 = *(void **)(v15 + 64);
    *(void *)(v15 + 64) = v14;

    [*(id *)(a1 + 32) updateResultsForSource:0];
  }
}

void __54___UIDocumentPickerLocalDirectoryObserver_staticItems__block_invoke(uint64_t a1)
{
}

uint64_t __61___UIDocumentPickerLocalDirectoryObserver_isVisiblePredicate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 url];
  id v8 = 0;
  int v3 = [v2 getResourceValue:&v8 forKey:*MEMORY[0x263EFF6C8] error:0];
  id v4 = v8;
  id v5 = v4;
  if (v3)
  {
    if (v4) {
      uint64_t v6 = [v4 BOOLValue] ^ 1;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t __66___UIDocumentPickerLocalDirectoryObserver_gatherResultsForSource___block_invoke()
{
  return 1;
}

void __56___UIDocumentPickerLocalDirectoryObserver_initialUpdate__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 88);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(a1 + 32), "gatherResultsForSource:", v7, (void)v11);
        [*(id *)(*(void *)(a1 + 32) + 96) setObject:v8 forKeyedSubscript:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  uint64_t v9 = *(void **)(a1 + 32);
  v10 = [v9 gatherResults];
  [v9 processUpdate:v10 changedObjects:0];
}

void __66___UIDocumentPickerLocalDirectoryObserver_updateResultsForSource___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = objc_msgSend(*(id *)(a1 + 40), "gatherResultsForSource:");
    [*(id *)(*(void *)(a1 + 40) + 96) setObject:v2 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = [v3 gatherResults];
  [v3 processUpdate:v4 changedObjects:0];
}

uint64_t __73___UIDocumentPickerLocalDirectoryObserver_dispatchSourceDidReceiveEvent___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 104) = 0;
  return [*(id *)(a1 + 32) updateResultsForSource:*(void *)(a1 + 40)];
}

@end