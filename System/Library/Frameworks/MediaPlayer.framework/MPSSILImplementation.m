@interface MPSSILImplementation
@end

@implementation MPSSILImplementation

BOOL __80___MPSSILImplementation__enumerator_didEncounterEntry_withExclusiveAccessToken___block_invoke(uint64_t a1, void *a2)
{
  return [a2 entryType] == 3;
}

id __50___MPSSILImplementation_orderedSectionIdentifiers__block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 96) copy];

  return v1;
}

uint64_t __34___MPSSILImplementation_itemCount__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 8);
  uint64_t result = [*(id *)(v2 + 112) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result + v3;
  return result;
}

void __57___MPSSILImplementation_dataSourceReloadItems_inSection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v25 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:");
  v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
  v5 = [v4 dataSource];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = *(id *)(a1 + 48);
  uint64_t v24 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v27;
    *(void *)&long long v6 = 138543618;
    long long v21 = v6;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v26 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          int v9 = [v5 section:*(void *)(a1 + 40) shouldShuffleExcludeItem:v8];
        }
        else {
          int v9 = 0;
        }
        v10 = objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", v25, v21);
        v11 = [v10 objectForKeyedSubscript:*(void *)(a1 + 40)];
        v12 = [v11 identifiersItemEntryMap];
        v13 = [v12 objectForKeyedSubscript:v8];

        if (v13)
        {
          if (v9)
          {
            v14 = [v13 previousEntry];

            if (v14)
            {
              v15 = [v13 latestUserClone];
              char v16 = [v15 isRemoved];

              if ((v16 & 1) == 0) {
                --*(void *)(*(void *)(a1 + 32) + 8);
              }
              [v13 setUserRemoved];
              v17 = os_log_create("com.apple.amp.mediaplayer", "SIL");
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                v18 = [v13 sectionIdentifier];
                v19 = [v13 itemIdentifier];
                *(_DWORD *)buf = v21;
                v31 = v18;
                __int16 v32 = 2114;
                v33 = v19;
                _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] dataSourceReloadItem:%{public}@ inSection:… | setUserRemoved [applying exclude from shuffle]", buf, 0x16u);
              }
            }
            else
            {
              [*(id *)(*(void *)(a1 + 32) + 112) removeObject:v13];
            }
          }
        }
        else if ((v9 & 1) == 0)
        {
          v20 = [*(id *)(a1 + 32) _createShuffleCloneForItem:v8 inSection:*(void *)(a1 + 40) withExclusiveAccessToken:v25];
          [*(id *)(*(void *)(a1 + 32) + 112) addObject:v20];
        }
        ++v7;
      }
      while (v24 != v7);
      uint64_t v24 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v24);
  }
}

void __59___MPSSILImplementation_dataSourceRemoveItems_fromSection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * v7);
        int v9 = [*(id *)(a1 + 40) _sectionHeadEntryMapWithExclusiveAccessToken:v3];
        v10 = [v9 objectForKeyedSubscript:*(void *)(a1 + 48)];
        v11 = [v10 identifiersItemEntryMap];
        v12 = [v11 objectForKeyedSubscript:v8];

        v13 = [v12 previousEntry];

        if (v13)
        {
          [*(id *)(a1 + 56) addObject:v8];
        }
        else
        {
          v14 = [v12 latestUserClone];
          uint64_t v15 = [v14 isRemoved];

          if ((v15 & 1) == 0) {
            --*(void *)(*(void *)(a1 + 40) + 8);
          }
          [v12 setDataSourceRemoved];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
}

uint64_t __63___MPSSILImplementation_dataSourceInsertItemsAtTail_inSection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _isSequentialSection:*(void *)(a1 + 40) withExclusiveAccessToken:v3];
  if ((v4 & 1) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = *(id *)(a1 + 48);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(a1 + 32), "_createShuffleCloneForItem:inSection:withExclusiveAccessToken:", *(void *)(*((void *)&v12 + 1) + 8 * v9), *(void *)(a1 + 40), v3, (void)v12);
          if (v10) {
            [*(id *)(*(void *)(a1 + 32) + 112) addObject:v10];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

uint64_t __67___MPSSILImplementation_dataSourceInsertItems_afterItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _isSequentialSection:*(void *)(a1 + 40) withExclusiveAccessToken:v3];
  if ((v4 & 1) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = *(id *)(a1 + 48);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(a1 + 32), "_createShuffleCloneForItem:inSection:withExclusiveAccessToken:", *(void *)(*((void *)&v12 + 1) + 8 * v9), *(void *)(a1 + 40), v3, (void)v12);
          if (v10) {
            [*(id *)(*(void *)(a1 + 32) + 112) addObject:v10];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

uint64_t __63___MPSSILImplementation_dataSourceInsertItemsAtHead_inSection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _isSequentialSection:*(void *)(a1 + 40) withExclusiveAccessToken:v3];
  if ((v4 & 1) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = *(id *)(a1 + 48);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(a1 + 32), "_createShuffleCloneForItem:inSection:withExclusiveAccessToken:", *(void *)(*((void *)&v12 + 1) + 8 * v9), *(void *)(a1 + 40), v3, (void)v12);
          if (v10) {
            [*(id *)(*(void *)(a1 + 32) + 112) addObject:v10];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

void __65___MPSSILImplementation_addDataSourceAtEnd_section_sequentially___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = a2;
    uint64_t v7 = [v3 _endEntryWithExclusiveAccessToken:v6];
    [v3 _insertDataSource:v4 forSection:v5 afterEntry:v7 withExclusiveAccessToken:v6];

    [*(id *)(a1 + 32) _updateOrderedSectionIDsWithExclusiveAccessToken:v6];
  }
  else
  {
    [v3 _addShuffleSection:*(void *)(a1 + 48) dataSource:*(void *)(a1 + 40) withExclusiveAccessToken:a2];
  }
}

void __80___MPSSILImplementation_addDataSource_section_sequentially_beforeTailOfSection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (*(unsigned char *)(a1 + 64)
    && (int v4 = [*(id *)(a1 + 32) _isSequentialSection:*(void *)(a1 + 40) withExclusiveAccessToken:v3],
        id v3 = v12,
        v4))
  {
    uint64_t v5 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:v12];
    id v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];

    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    v10 = [v6 tailEntry];
    v11 = [v10 previousEntry];
    [v7 _insertDataSource:v8 forSection:v9 afterEntry:v11 withExclusiveAccessToken:v12];

    [*(id *)(a1 + 32) _updateOrderedSectionIDsWithExclusiveAccessToken:v12];
  }
  else
  {
    [*(id *)(a1 + 32) _addShuffleSection:*(void *)(a1 + 56) dataSource:*(void *)(a1 + 48) withExclusiveAccessToken:v3];
  }
}

void __79___MPSSILImplementation_addDataSource_section_sequentially_afterTailOfSection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = v3;
  if (*(unsigned char *)(a1 + 64)
    && (int v4 = [*(id *)(a1 + 32) _isSequentialSection:*(void *)(a1 + 40) withExclusiveAccessToken:v3],
        id v3 = v11,
        v4))
  {
    uint64_t v5 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:v11];
    id v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];

    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    v10 = [v6 tailEntry];
    [v7 _insertDataSource:v8 forSection:v9 afterEntry:v10 withExclusiveAccessToken:v11];

    [*(id *)(a1 + 32) _updateOrderedSectionIDsWithExclusiveAccessToken:v11];
  }
  else
  {
    [*(id *)(a1 + 32) _addShuffleSection:*(void *)(a1 + 56) dataSource:*(void *)(a1 + 48) withExclusiveAccessToken:v3];
  }
}

void __80___MPSSILImplementation_addDataSource_section_sequentially_afterItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (*(unsigned char *)(a1 + 72))
  {
    int v4 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:v3];
    uint64_t v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v6 = [v5 identifiersItemEntryMap];
    uint64_t v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 48)];
    uint64_t v8 = [v7 latestUserClone];

    uint64_t v9 = [v8 previousEntry];

    if (v9)
    {
      [*(id *)(a1 + 32) _insertDataSource:*(void *)(a1 + 56) forSection:*(void *)(a1 + 64) afterEntry:v8 withExclusiveAccessToken:v10];
      [*(id *)(a1 + 32) _updateOrderedSectionIDsWithExclusiveAccessToken:v10];

      goto LABEL_6;
    }
  }
  [*(id *)(a1 + 32) _addShuffleSection:*(void *)(a1 + 64) dataSource:*(void *)(a1 + 56) withExclusiveAccessToken:v10];
LABEL_6:
}

void __67___MPSSILImplementation_addDataSourceAtStart_section_sequentially___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = a2;
    [v3 _insertDataSource:v4 forSection:v5 afterEntry:0 withExclusiveAccessToken:v6];
    [*(id *)(a1 + 32) _updateOrderedSectionIDsWithExclusiveAccessToken:v6];
  }
  else
  {
    [v3 _addShuffleSection:*(void *)(a1 + 48) dataSource:*(void *)(a1 + 40) withExclusiveAccessToken:a2];
  }
}

void __60___MPSSILImplementation_safelyReshuffleAfterItem_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:a2];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"🔀"];

  uint64_t v5 = [v4 lastItemEntry];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v24 = v4;
    unint64_t v7 = 0x1E935F000uLL;
    uint64_t v8 = "com.apple.amp.mediaplayer";
    uint64_t v9 = "SIL";
    do
    {
      id v10 = [v6 sectionIdentifier];
      if ([v10 isEqual:*(void *)(a1 + 40)])
      {
        id v11 = [v6 itemIdentifier];
        char v12 = [v11 isEqual:*(void *)(a1 + 48)];
      }
      else
      {
        char v12 = 0;
      }

      long long v13 = [v6 nextEntries];
      unint64_t v14 = [v13 count];

      if (v14 > 1 || (v12 & 1) != 0) {
        break;
      }
      if (([v6 isRemoved] & 1) == 0)
      {
        long long v15 = (void *)[v6 newClonedEntry];
        [*(id *)(*(void *)(a1 + 32) + *(int *)(v7 + 2212)) addObject:v15];
        --*(void *)(*(void *)(a1 + 32) + 8);
        [v6 setUserRemoved];
        char v16 = os_log_create(v8, v9);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = [*(id *)(a1 + 32) identifier];
          [v6 sectionIdentifier];
          long long v18 = v9;
          long long v19 = v8;
          long long v21 = v20 = v7;
          uint64_t v22 = [v6 itemIdentifier];
          *(_DWORD *)buf = 138543874;
          long long v26 = v17;
          __int16 v27 = 2114;
          long long v28 = v21;
          __int16 v29 = 2114;
          v30 = v22;
          _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_DEFAULT, "[SIL:%{public}@] safelyReshuffleAfterItem:%{public}@ inSection:%{public}@ | setUserRemoved [applying exclude from shuffle]", buf, 0x20u);

          unint64_t v7 = v20;
          uint64_t v8 = v19;
          uint64_t v9 = v18;
        }
      }
      uint64_t v23 = [v6 previousEntry];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        break;
      }

      id v6 = v23;
    }
    while (v23);

    uint64_t v4 = v24;
  }
}

uint64_t __52___MPSSILImplementation_dequeueCandidatesWithQuota___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _dequeueCandidatesWithQuota:*(void *)(a1 + 40) withExclusiveAccessToken:a2];
}

void __66___MPSSILImplementation_encodeWithCoder_withExclusiveAccessToken___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (([*(id *)(a1 + 32) _isSequentialSection:a2 withExclusiveAccessToken:*(void *)(a1 + 40)] & 1) == 0) {
    [*(id *)(a1 + 48) addObject:v5];
  }
}

void __113___MPSSILImplementation_initWithSectionedIdentifierList_randomSource_startingItemEntry_withExclusiveAccessToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [a3 dataSource];
  [v5 _addShuffleSection:v6 dataSource:v7 withExclusiveAccessToken:*(void *)(a1 + 40)];
}

@end