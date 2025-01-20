@interface AXNotificationObserverClientDied
@end

@implementation AXNotificationObserverClientDied

void ___AXNotificationObserverClientDied_block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = &OBJC_IVAR___AXElementFetcher__delegate;
  CFDictionaryGetValue((CFDictionaryRef)ObserverDictionary, (const void *)0x270F);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v34 count:16];
  v5 = v3;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v29;
LABEL_3:
    uint64_t v9 = 0;
    uint64_t v10 = v7 + v6;
    while (1)
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(v3);
      }
      v11 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
      v12 = [v11 observer];
      int v13 = [v12 isEqual:*(void *)(a1 + 40)];

      if (v13) {
        break;
      }
      if (v6 == ++v9)
      {
        uint64_t v6 = [v3 countByEnumeratingWithState:&v28 objects:v34 count:16];
        uint64_t v7 = v10;
        if (v6) {
          goto LABEL_3;
        }
        v5 = v3;
        v2 = &OBJC_IVAR___AXElementFetcher__delegate;
        goto LABEL_14;
      }
    }
    v14 = AXRuntimeLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v11;
      _os_log_impl(&dword_1BA657000, v14, OS_LOG_TYPE_INFO, "Removing client observer: %@", buf, 0xCu);
    }

    v5 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v7 + v9];

    v2 = &OBJC_IVAR___AXElementFetcher__delegate;
    if (v5)
    {
      [v3 removeObjectsAtIndexes:v5];
      goto LABEL_14;
    }
  }
  else
  {
LABEL_14:
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 count] == 0;
  id v15 = *(id *)(a1 + 40);
  CFIndex Count = CFDictionaryGetCount(*((CFDictionaryRef *)v2 + 272));
  v17 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
  if (v17)
  {
    v18 = v17;
    id v27 = v3;
    CFDictionaryGetKeysAndValues(*((CFDictionaryRef *)v2 + 272), 0, v17);
    if (Count >= 1)
    {
      for (uint64_t i = 0; i != Count; ++i)
      {
        id v20 = (id)v18[i];
        uint64_t v21 = [v20 count];
        if (v21)
        {
          unint64_t v22 = v21;
          for (unint64_t j = 0; j < v22; ++j)
          {
            v24 = [v20 objectAtIndex:j];
            v25 = [v24 observer];
            int v26 = [v25 isEqual:v15];

            if (v26)
            {
              [v20 removeObjectAtIndex:j];
              --v22;
            }
          }
        }
      }
    }
    free(v18);
    id v3 = v27;
  }
}

@end