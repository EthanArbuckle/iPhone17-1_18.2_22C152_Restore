@interface UIDocumentPickerCloudDirectoryObserver
@end

@implementation UIDocumentPickerCloudDirectoryObserver

uint64_t __67___UIDocumentPickerCloudDirectoryObserver_initWithScopes_delegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateQuery];
}

void __53___UIDocumentPickerCloudDirectoryObserver_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) stopQuery];
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:*(void *)(a1 + 32) name:0 object:*(void *)(*(void *)(a1 + 32) + 88)];

  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 88);
  *(void *)(v3 + 88) = 0;
}

void __61___UIDocumentPickerCloudDirectoryObserver_setQueryPredicate___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  id v6 = *(id *)(*(void *)(a1 + 32) + 64);
  id v3 = v2;
  if (v6 == v3)
  {
  }
  else
  {
    if (v3)
    {
      char v4 = [v6 isEqual:v3];

      if (v4) {
        return;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
    v5 = *(void **)(a1 + 32);
    if (v5[11])
    {
      [v5 _updateQuery];
    }
  }
}

void __57___UIDocumentPickerCloudDirectoryObserver_queryPredicate__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 88) predicate];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __90___UIDocumentPickerCloudDirectoryObserver__queryResultsWithChangedObjects_changedResults___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v5 = [[_UIDocumentPickerContainerMetadataItem alloc] initWithMetadataItem:v3];
  objc_msgSend(a1[4], "addObject:");
  int v4 = [a1[5] containsObject:v3];

  if (v4) {
    [a1[6] addObject:v5];
  }
}

void __58___UIDocumentPickerCloudDirectoryObserver_setStaticItems___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v3 != v2 && (objc_msgSend(v3, "isEqualToOrderedSet:") & 1) == 0)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "indexOfObject:", v11, (void)v14);
          if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          {
            [v4 addObject:v11];
          }
          else
          {
            v13 = [*(id *)(*(void *)(a1 + 32) + 56) objectAtIndex:v12];
            [v5 addObject:v13];
            [v4 addObject:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), v4);
    if ([*(id *)(a1 + 32) afterInitialUpdate]) {
      [*(id *)(a1 + 32) _updateObservers:v5];
    }
  }
}

void __54___UIDocumentPickerCloudDirectoryObserver_staticItems__block_invoke(uint64_t a1)
{
}

uint64_t __61___UIDocumentPickerCloudDirectoryObserver_isVisiblePredicate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [v2 title];
  char v4 = [v3 hasPrefix:@"."];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [v2 url];
    uint64_t v7 = [v6 pathComponents];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "hasPrefix:", @".", (void)v14))
          {
            uint64_t v5 = 0;
            goto LABEL_13;
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    uint64_t v5 = 1;
LABEL_13:
  }
  return v5;
}

uint64_t __61___UIDocumentPickerCloudDirectoryObserver_isVisiblePredicate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 title];
  int v3 = [v2 hasPrefix:@"."];

  return v3 ^ 1u;
}

@end