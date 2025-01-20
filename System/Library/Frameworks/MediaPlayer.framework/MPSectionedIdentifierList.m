@interface MPSectionedIdentifierList
+ (BOOL)supportsSecureCoding;
+ (void)_performWithoutRequiringExclusivity:(id)a3;
- (BOOL)automaticallyReversesNonDestructiveDataSourceEdits;
- (BOOL)hasItem:(id)a3 inSection:(id)a4;
- (BOOL)hasSection:(id)a3;
- (BOOL)isDeletedItem:(id)a3 inSection:(id)a4;
- (BOOL)performWithExclusiveAccessAndReturnBOOL:(id)a3;
- (MPSectionedIdentifierList)init;
- (MPSectionedIdentifierList)initWithCoder:(id)a3;
- (MPSectionedIdentifierList)initWithIdentifier:(id)a3;
- (MPSectionedIdentifierListAnnotationDelegate)annotationDelegate;
- (MPSectionedIdentifierListDelegate)delegate;
- (NSArray)orderedSectionIdentifiers;
- (NSDictionary)_sectionDataSources;
- (NSSet)allSectionIdentifiers;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)identifier;
- (id)_dataSourceInsertItems:(id)a3 fromSection:(id)a4 afterEntry:(id)a5 withExclusiveAccessToken:(id)a6;
- (id)_dataSourceMoveItem:(id)a3 inSection:(id)a4 afterEntry:(id)a5 withExclusiveAccessToken:(id)a6;
- (id)_debugDescriptionWithEnumerator:(id)a3 lengths:(id *)a4;
- (id)_encodeEntry:(id)a3 withExclusiveAccessToken:(id)a4;
- (id)_endEntryWithExclusiveAccessToken:(id)a3;
- (id)_entryForPosition:(id)a3 withExclusiveAccessToken:(id)a4;
- (id)_firstSectionIDBeforePosition:(id)a3 withExclusiveAccessToken:(id)a4;
- (id)_itemEntry:(id)a3 sectionIdentifier:(id)a4 withExclusiveAccessToken:(id)a5;
- (id)_sectionHeadEntryMapWithExclusiveAccessToken:(id)a3;
- (id)_startEntriesWithExclusiveAccessToken:(id)a3;
- (id)_tailEntryForSectionIdentifier:(id)a3 withExclusiveAccessToken:(id)a4;
- (id)enumeratorWithOptions:(unint64_t)a3;
- (id)enumeratorWithOptions:(unint64_t)a3 startPosition:(id)a4 endPosition:(id)a5;
- (id)enumeratorWithOptions:(unint64_t)a3 startPosition:(id)a4 endPosition:(id)a5 withExclusiveAccessToken:(id)a6;
- (id)firstSectionMatching:(id)a3 containingItem:(id)a4 inSection:(id)a5;
- (id)performWithExclusiveAccessAndReturnObject:(id)a3;
- (int64_t)_itemCountWithExclusiveAccessToken:(id)a3;
- (int64_t)itemCount;
- (int64_t)performWithExclusiveAccessAndReturnInteger:(id)a3;
- (void)_addBranchToEntry:(id)a3 entries:(id)a4 withExclusiveAccessToken:(id)a5;
- (void)_insertDataSource:(id)a3 forSection:(id)a4 afterEntry:(id)a5 withExclusiveAccessToken:(id)a6;
- (void)_insertDataSourceHead:(id)a3 afterEntry:(id)a4 withExclusiveAccessToken:(id)a5;
- (void)_loadDataSource:(id)a3 forSection:(id)a4 completion:(id)a5;
- (void)_performDelegateCalloutForSection:(id)a3 block:(id)a4;
- (void)_stitchLastItemEntryToHeadEntry:(id)a3 branchList:(id)a4;
- (void)_stitchPreviousEntry:(id)a3 toEntry:(id)a4 cloneIndex:(id)a5;
- (void)_stitchWithPreviousEntry:(id)a3 list:(id)a4 cloneIndex:(id)a5;
- (void)addDataSource:(id)a3 section:(id)a4 afterHeadOfSection:(id)a5 completion:(id)a6;
- (void)addDataSource:(id)a3 section:(id)a4 afterItem:(id)a5 inSection:(id)a6 completion:(id)a7;
- (void)addDataSource:(id)a3 section:(id)a4 afterTailOfSection:(id)a5 completion:(id)a6;
- (void)addDataSource:(id)a3 section:(id)a4 beforeTailOfSection:(id)a5 completion:(id)a6;
- (void)addDataSourceAtEnd:(id)a3 section:(id)a4 completion:(id)a5;
- (void)addDataSourceAtStart:(id)a3 section:(id)a4 completion:(id)a5;
- (void)dataSourceBeginTransactionForSection:(id)a3;
- (void)dataSourceEndTransactionForSection:(id)a3;
- (void)dataSourceInsertItems:(id)a3 afterItem:(id)a4 inSection:(id)a5;
- (void)dataSourceInsertItemsAtHead:(id)a3 inSection:(id)a4;
- (void)dataSourceInsertItemsAtTail:(id)a3 inSection:(id)a4;
- (void)dataSourceMoveItem:(id)a3 afterItem:(id)a4 inSection:(id)a5;
- (void)dataSourceMoveItemToHead:(id)a3 inSection:(id)a4;
- (void)dataSourceMoveItemToTail:(id)a3 inSection:(id)a4;
- (void)dataSourceReloadItems:(id)a3 inSection:(id)a4;
- (void)dataSourceRemoveItems:(id)a3 fromSection:(id)a4;
- (void)dataSourceUpdateSection:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3 withExclusiveAccessToken:(id)a4;
- (void)moveItem:(id)a3 fromSection:(id)a4 afterHeadOfSection:(id)a5;
- (void)moveItem:(id)a3 fromSection:(id)a4 afterItem:(id)a5 inSection:(id)a6;
- (void)moveItem:(id)a3 fromSection:(id)a4 afterTailOfSection:(id)a5;
- (void)moveItemToEnd:(id)a3 fromSection:(id)a4;
- (void)moveItemToStart:(id)a3 fromSection:(id)a4;
- (void)performWithExclusiveAccess:(id)a3;
- (void)removeItem:(id)a3 fromSection:(id)a4;
- (void)replaceDataSource:(id)a3 forSection:(id)a4 completion:(id)a5;
- (void)setAnnotationDelegate:(id)a3;
- (void)setAutomaticallyReversesNonDestructiveDataSourceEdits:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MPSectionedIdentifierList

- (BOOL)automaticallyReversesNonDestructiveDataSourceEdits
{
  return self->_automaticallyReversesNonDestructiveDataSourceEdits;
}

void __70__MPSectionedIdentifierList__stitchWithPreviousEntry_list_cloneIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (_NSIsNSArray())
  {
    [*(id *)(a1 + 32) _stitchWithPreviousEntry:*(void *)(a1 + 40) list:v7 cloneIndex:*(void *)(a1 + 48)];
  }
  else
  {
    id v6 = v7;
    [*(id *)(a1 + 32) _stitchPreviousEntry:*(void *)(a1 + 40) toEntry:v6 cloneIndex:*(void *)(a1 + 48)];
    if (!a3)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
      if ([v6 entryType] == 4) {
        [*(id *)(a1 + 32) _stitchLastItemEntryToHeadEntry:*(void *)(a1 + 40) branchList:*(void *)(a1 + 56)];
      }
    }
  }
}

- (void)_stitchWithPreviousEntry:(id)a3 list:(id)a4 cloneIndex:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__43177;
  v36 = __Block_byref_object_dispose__43178;
  id v22 = v8;
  id v37 = v22;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v29;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v28 + 1) + 8 * v14);
        int v16 = _NSIsNSArray();
        id v17 = v15;
        v18 = (void *)v33[5];
        if (v16)
        {
          id v19 = v18;
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __70__MPSectionedIdentifierList__stitchWithPreviousEntry_list_cloneIndex___block_invoke;
          v23[3] = &unk_1E57F69F0;
          v23[4] = self;
          id v20 = v19;
          id v24 = v20;
          id v25 = v10;
          v27 = &v32;
          id v21 = v17;
          id v26 = v21;
          [v21 enumerateObjectsUsingBlock:v23];
        }
        else
        {
          -[MPSectionedIdentifierList _stitchPreviousEntry:toEntry:cloneIndex:](self, "_stitchPreviousEntry:toEntry:cloneIndex:", v18, v17, v10, v22);
          id v21 = (id)v33[5];
          v33[5] = (uint64_t)v17;
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v12);
  }

  _Block_object_dispose(&v32, 8);
}

- (void)_stitchLastItemEntryToHeadEntry:(id)a3 branchList:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)[v6 count] >= 2)
  {
    id v26 = v5;
    id v7 = [v5 sectionIdentifier];
    id v25 = v6;
    id v8 = [v6 objectAtIndexedSubscript:1];
    id v9 = v8;
    if ((_NSIsNSArray() & 1) == 0)
    {
      v32[0] = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    }
    id v24 = v8;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = objc_msgSend(v9, "reverseObjectEnumerator", v9);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(id *)(*((void *)&v27 + 1) + 8 * i);
          if (_NSIsNSArray())
          {
            uint64_t v16 = [v15 firstObject];

            id v15 = (id)v16;
          }
          id v17 = v15;
          if ([v17 entryType] == 3)
          {
            id v18 = v17;
            if (([v18 isUserCloned] & 1) == 0)
            {
              id v19 = [v18 sectionIdentifier];
              char v20 = [v19 isEqualToString:v7];

              id v21 = [v18 hostedSectionIdentifier];
              char v22 = [v21 isEqualToString:v7];

              if (v20 & 1) != 0 || (v22)
              {
                [v26 setLastItemEntry:v18];

                goto LABEL_20;
              }
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_20:

    id v6 = v25;
    id v5 = v26;
  }
}

void __71__MPSectionedIdentifierList_performWithExclusiveAccessAndReturnObject___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  +[MPDispatchQueueExclusiveAccessToken tokenWithQueue:owner:](MPDispatchQueueExclusiveAccessToken, "tokenWithQueue:owner:", *(void *)(a1[4] + 16));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = (*(void (**)(uint64_t, id))(v2 + 16))(v2, v6);
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __56__MPSectionedIdentifierList_performWithExclusiveAccess___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  +[MPDispatchQueueExclusiveAccessToken tokenWithQueue:owner:](MPDispatchQueueExclusiveAccessToken, "tokenWithQueue:owner:", *(void *)(*(void *)(a1 + 32) + 16));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __38__MPSectionedIdentifierList_itemCount__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _itemCountWithExclusiveAccessToken:a2];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_itemCountWithExclusiveAccessToken:(id)a3
{
  return self->_itemCount;
}

void __40__MPSectionedIdentifierList_hasSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:a2];
  uint64_t v3 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3 != 0;
}

id __54__MPSectionedIdentifierList_orderedSectionIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 56) copy];

  return v1;
}

uint64_t __77__MPSectionedIdentifierList_enumeratorWithOptions_startPosition_endPosition___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) enumeratorWithOptions:*(void *)(a1 + 56) startPosition:*(void *)(a1 + 40) endPosition:*(void *)(a1 + 48) withExclusiveAccessToken:a2];
}

void __53__MPSectionedIdentifierList_isDeletedItem_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:a2];
  uint64_t v3 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [v3 identifiersItemEntryMap];
  id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 48)];
  id v6 = [v5 latestUserClone];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v6 isRemoved];
}

void __47__MPSectionedIdentifierList_hasItem_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:a2];
  uint64_t v3 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [v3 identifiersItemEntryMap];
  id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v5 != 0;
}

- (id)enumeratorWithOptions:(unint64_t)a3 startPosition:(id)a4 endPosition:(id)a5 withExclusiveAccessToken:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  uint64_t v12 = [(MPSectionedIdentifierList *)self _entryForPosition:a4 withExclusiveAccessToken:v10];
  uint64_t v13 = [(MPSectionedIdentifierList *)self _entryForPosition:v11 withExclusiveAccessToken:v10];

  uint64_t v14 = off_1E57EC6B8;
  if ((a3 & 8) != 0) {
    uint64_t v14 = off_1E57EC6C8;
  }
  id v15 = (void *)[objc_alloc(*v14) initWithSectionedIdentifierList:self options:a3 startEntry:v12 endEntry:v13 withExclusiveAccessToken:v10];

  return v15;
}

- (id)_entryForPosition:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [v8 assertHasExclusiveAccessForOwner:self];
  if (v7)
  {
    switch([v7 entryType])
    {
      case 0:
      case 1:
      case 5:
        id v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2 object:self file:@"MPSectionedIdentifierList.m" lineNumber:1030 description:@"Unsupported position type"];
        id v10 = 0;
        goto LABEL_10;
      case 2:
        id v9 = [(MPSectionedIdentifierList *)self _sectionHeadEntryMapWithExclusiveAccessToken:v8];
        id v11 = [v7 sectionIdentifier];
        id v10 = [v9 objectForKeyedSubscript:v11];
        goto LABEL_9;
      case 3:
        id v9 = [v7 itemIdentifier];
        id v11 = [v7 sectionIdentifier];
        uint64_t v12 = [(MPSectionedIdentifierList *)self _itemEntry:v9 sectionIdentifier:v11 withExclusiveAccessToken:v8];
        uint64_t v13 = [v12 latestUserClone];
        goto LABEL_8;
      case 4:
        id v9 = [(MPSectionedIdentifierList *)self _sectionHeadEntryMapWithExclusiveAccessToken:v8];
        id v11 = [v7 sectionIdentifier];
        uint64_t v12 = [v9 objectForKeyedSubscript:v11];
        uint64_t v13 = [v12 tailEntry];
LABEL_8:
        id v10 = (void *)v13;

LABEL_9:
LABEL_10:

        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    id v10 = 0;
  }

  return v10;
}

id __50__MPSectionedIdentifierList_allSectionIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:a2];
  uint64_t v3 = [v2 allKeys];

  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];

  return v4;
}

- (id)_endEntryWithExclusiveAccessToken:(id)a3
{
  [a3 assertHasExclusiveAccessForOwner:self];
  endEntry = self->_endEntry;

  return endEntry;
}

- (id)_sectionHeadEntryMapWithExclusiveAccessToken:(id)a3
{
  [a3 assertHasExclusiveAccessForOwner:self];
  sectionHeadEntryMap = self->_sectionHeadEntryMap;

  return sectionHeadEntryMap;
}

- (void)_stitchPreviousEntry:(id)a3 toEntry:(id)a4 cloneIndex:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v9 setPreviousEntry:v8];
  if ([v9 entryType] != 4)
  {
    if (v8) {
      [v8 addNextEntry:v9];
    }
    else {
      [(NSMutableArray *)self->_startEntries addObject:v9];
    }
  }
  uint64_t v11 = [v9 entryType];
  switch(v11)
  {
    case 4:
      [v8 setTailEntry:v9];
      [v9 setSectionHeadEntry:v8];
      break;
    case 3:
      id v14 = v9;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __69__MPSectionedIdentifierList__stitchPreviousEntry_toEntry_cloneIndex___block_invoke;
      v29[3] = &unk_1E57F6A18;
      id v30 = v10;
      id v15 = (void (**)(void, void, void))MEMORY[0x19971E0F0](v29);
      uint64_t v16 = [v14 positionKey];
      id v17 = [v16 generation];
      int v18 = [v17 isEqualToString:@"1"];

      if (v18)
      {
        if ([v14 hasClones])
        {
          id v19 = [v14 sectionIdentifier];
          char v20 = [v14 itemIdentifier];
          id v21 = ((void (**)(void, void *, void *))v15)[2](v15, v19, v20);

          [v21 setRootEntry:v14];
        }
        sectionHeadEntryMap = self->_sectionHeadEntryMap;
        v23 = [v14 sectionIdentifier];
        id v24 = [(NSMutableDictionary *)sectionHeadEntryMap objectForKeyedSubscript:v23];
        id v25 = [v24 identifiersItemEntryMap];
        id v26 = [v14 itemIdentifier];
        [v25 setObject:v14 forKeyedSubscript:v26];
      }
      else
      {
        long long v27 = [v14 sectionIdentifier];
        long long v28 = [v14 itemIdentifier];
        v23 = ((void (**)(void, void *, void *))v15)[2](v15, v27, v28);

        id v24 = [v23 clonedEntries];
        [v24 addObject:v14];
      }

      break;
    case 2:
      uint64_t v12 = self->_sectionHeadEntryMap;
      uint64_t v13 = [v9 sectionIdentifier];
      [(NSMutableDictionary *)v12 setObject:v9 forKeyedSubscript:v13];

      break;
  }
}

- (id)_startEntriesWithExclusiveAccessToken:(id)a3
{
  [a3 assertHasExclusiveAccessForOwner:self];
  id v4 = (void *)[(NSMutableArray *)self->_startEntries copy];

  return v4;
}

- (id)_itemEntry:(id)a3 sectionIdentifier:(id)a4 withExclusiveAccessToken:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [v11 assertHasExclusiveAccessForOwner:self];
  uint64_t v12 = [(MPSectionedIdentifierList *)self _sectionHeadEntryMapWithExclusiveAccessToken:v11];

  uint64_t v13 = [v12 objectForKeyedSubscript:v10];
  id v14 = [v13 identifiersItemEntryMap];
  id v15 = [v14 objectForKeyedSubscript:v9];

  if (!v15)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"MPSectionedIdentifierList.m", 1055, @"No item exists at %@:%@", v10, v9 object file lineNumber description];
  }

  return v15;
}

void __69__MPSectionedIdentifierList_replaceDataSource_forSection_completion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  [v3 assertHasExclusiveAccessForOwner:a1[4]];
  id v4 = os_log_create("com.apple.amp.mediaplayer", "Default");
  id v5 = v4;
  os_signpost_id_t v6 = a1[8];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SIL-Replace-Enumerate", (const char *)&unk_1956A9243, buf, 2u);
  }

  id v7 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  if (!v7)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a1[9], a1[4], @"MPSectionedIdentifierList.m", 344, @"Could not find head entry for section identifier: %@", a1[5] object file lineNumber description];
  }
  id v8 = [[MPSectionedIdentifierListEnumerator alloc] initWithSectionedIdentifierList:a1[4] options:33 startEntry:v7 endEntry:0 withExclusiveAccessToken:v3];
  uint64_t v9 = [(MPSectionedIdentifierListEnumerator *)v8 nextObjectWithExclusiveAccessToken:v3];
  if (v9)
  {
    id v10 = (void *)v9;
    while (1)
    {
      if ([v10 entryType] == 3)
      {
        id v11 = [v10 itemResult];
        uint64_t v12 = [v11 sectionIdentifier];
        int v13 = [v12 isEqualToString:a1[5]];

        if (v13)
        {
          id v14 = (void *)a1[6];
          id v15 = [v10 itemResult];
          uint64_t v16 = [v15 itemIdentifier];
          [v14 addObject:v16];
        }
      }
      else if ([v10 entryType] == 4)
      {
        id v17 = [v10 trackingEntryResult];
        int v18 = [v17 sectionIdentifier];
        char v19 = [v18 isEqualToString:a1[5]];

        if (v19)
        {
LABEL_14:

          break;
        }
      }
      uint64_t v20 = [(MPSectionedIdentifierListEnumerator *)v8 nextObjectWithExclusiveAccessToken:v3];

      id v10 = (void *)v20;
      if (!v20) {
        goto LABEL_14;
      }
    }
  }
  [v7 setDataSource:a1[7]];
  id v21 = os_log_create("com.apple.amp.mediaplayer", "Default");
  char v22 = v21;
  os_signpost_id_t v23 = a1[8];
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)id v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v22, OS_SIGNPOST_INTERVAL_END, v23, "SIL-Replace-Enumerate", (const char *)&unk_1956A9243, v25, 2u);
  }
}

- (MPSectionedIdentifierList)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MPSectionedIdentifierList *)self init];
  os_signpost_id_t v6 = v5;
  if (v5)
  {
    [(MPSectionedIdentifierList *)v5 _beforeInitWithCoder:v4];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v6->_itemCount = [v4 decodeIntegerForKey:@"ic"];
    v6->_automaticallyReversesNonDestructiveDataSourceEdits = [v4 decodeBoolForKey:@"arne"];
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"el"];

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(MPSectionedIdentifierList *)v6 _stitchWithPreviousEntry:0 list:v12 cloneIndex:v13];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __43__MPSectionedIdentifierList_initWithCoder___block_invoke;
    void v32[3] = &unk_1E57F69C8;
    id v14 = v6;
    v33 = v14;
    [v13 enumerateKeysAndObjectsUsingBlock:v32];
    id v15 = [v12 lastObject];
    if (_NSIsNSArray())
    {
      uint64_t v16 = [v15 firstObject];

      id v15 = (void *)v16;
    }
    objc_storeStrong(v14 + 4, v15);
    id v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    char v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"os"];

    if (v20)
    {
      objc_storeStrong(v14 + 7, v20);
    }
    else
    {
      id v30 = v13;
      long long v31 = v12;
      context = (void *)MEMORY[0x19971DE60]();
      id v21 = [v14 enumeratorWithOptions:16777233];
      uint64_t v22 = [v21 nextObject];
      if (v22)
      {
        os_signpost_id_t v23 = (void *)v22;
        do
        {
          if ([v23 entryType] == 2)
          {
            id v24 = v14[7];
            id v25 = [v23 trackingEntryResult];
            id v26 = [v25 sectionIdentifier];
            [v24 addObject:v26];
          }
          uint64_t v27 = [v21 nextObject];

          os_signpost_id_t v23 = (void *)v27;
        }
        while (v27);
      }

      id v13 = v30;
      uint64_t v12 = v31;
    }
  }
  return v6;
}

- (MPSectionedIdentifierList)init
{
  return [(MPSectionedIdentifierList *)self initWithIdentifier:0];
}

- (MPSectionedIdentifierList)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MPSectionedIdentifierList;
  id v5 = [(MPSectionedIdentifierList *)&v19 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediaplayer.MPSectionedIdentifierList/accessQueue", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    if (v4)
    {
      id v8 = (NSString *)v4;
    }
    else
    {
      MSVNanoIDCreateTaggedPointer();
      id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    identifier = v5->_identifier;
    v5->_identifier = v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    sectionHeadEntryMap = v5->_sectionHeadEntryMap;
    v5->_sectionHeadEntryMap = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    sectionTransactionCallouts = v5->_sectionTransactionCallouts;
    v5->_sectionTransactionCallouts = (NSMutableDictionary *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    startEntries = v5->_startEntries;
    v5->_startEntries = (NSMutableArray *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    orderedSections = v5->_orderedSections;
    v5->_orderedSections = (NSMutableArray *)v16;
  }
  return v5;
}

- (void)setAutomaticallyReversesNonDestructiveDataSourceEdits:(BOOL)a3
{
  self->_automaticallyReversesNonDestructiveDataSourceEdits = a3;
}

- (NSSet)allSectionIdentifiers
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__MPSectionedIdentifierList_allSectionIdentifiers__block_invoke;
  v4[3] = &unk_1E57F6BA8;
  v4[4] = self;
  id v2 = [(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnObject:v4];

  return (NSSet *)v2;
}

- (id)enumeratorWithOptions:(unint64_t)a3 startPosition:(id)a4 endPosition:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__MPSectionedIdentifierList_enumeratorWithOptions_startPosition_endPosition___block_invoke;
  v14[3] = &unk_1E57F6B08;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v10 = v9;
  id v11 = v8;
  uint64_t v12 = [(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnObject:v14];

  return v12;
}

- (NSArray)orderedSectionIdentifiers
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__MPSectionedIdentifierList_orderedSectionIdentifiers__block_invoke;
  v4[3] = &unk_1E57F6BA8;
  v4[4] = self;
  id v2 = [(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnObject:v4];

  return (NSArray *)v2;
}

- (id)performWithExclusiveAccessAndReturnObject:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__43177;
  objc_super v19 = __Block_byref_object_dispose__43178;
  id v20 = 0;
  if (_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken != -1) {
    dispatch_once(&_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken, &__block_literal_global_43173);
  }
  uint64_t v5 = _MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey;
  if (pthread_getspecific(_MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey))
  {
    dispatch_queue_t v6 = +[MPPThreadKeyExclusiveAccessToken tokenWithKey:v5 owner:self];
    uint64_t v7 = v4[2](v4, v6);
    id v8 = (void *)v16[5];
    v16[5] = v7;
  }
  else
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__MPSectionedIdentifierList_performWithExclusiveAccessAndReturnObject___block_invoke;
    block[3] = &unk_1E57F6AE0;
    uint64_t v14 = &v15;
    block[4] = self;
    id v13 = v4;
    dispatch_sync(accessQueue, block);
    dispatch_queue_t v6 = v13;
  }

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)replaceDataSource:(id)a3 forSection:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  id v13 = os_log_create("com.apple.amp.mediaplayer", "Default");
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, self);

  uint64_t v15 = os_log_create("com.apple.amp.mediaplayer", "Default");
  id v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138543362;
    id v34 = v10;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "SIL-Replace", "section=%{public}@", buf, 0xCu);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __69__MPSectionedIdentifierList_replaceDataSource_forSection_completion___block_invoke;
  v27[3] = &unk_1E57F6A90;
  v27[4] = self;
  id v28 = v10;
  os_signpost_id_t v31 = v14;
  SEL v32 = a2;
  id v29 = v12;
  id v30 = v9;
  id v17 = v9;
  id v18 = v12;
  id v19 = v10;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v27];
  id v20 = os_log_create("com.apple.amp.mediaplayer", "Default");
  id v21 = v20;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v14, "SIL-Replace-Reload", (const char *)&unk_1956A9243, buf, 2u);
  }

  uint64_t v22 = [[_MPIdentifierListSectionProxy alloc] initWithSection:v19 sectionedIdentifierList:self existingItemIdentifiers:v18];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __69__MPSectionedIdentifierList_replaceDataSource_forSection_completion___block_invoke_55;
  v24[3] = &unk_1E57F6AB8;
  id v25 = v11;
  os_signpost_id_t v26 = v14;
  id v23 = v11;
  [v17 reloadSection:v22 completion:v24];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isDeletedItem:(id)a3 inSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__MPSectionedIdentifierList_isDeletedItem_inSection___block_invoke;
  v11[3] = &unk_1E57F6BF8;
  os_signpost_id_t v14 = &v15;
  v11[4] = self;
  id v8 = v7;
  id v12 = v8;
  id v9 = v6;
  id v13 = v9;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v11];
  LOBYTE(self) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

- (BOOL)hasItem:(id)a3 inSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__MPSectionedIdentifierList_hasItem_inSection___block_invoke;
  v11[3] = &unk_1E57F6BF8;
  os_signpost_id_t v14 = &v15;
  v11[4] = self;
  id v8 = v7;
  id v12 = v8;
  id v9 = v6;
  id v13 = v9;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v11];
  LOBYTE(self) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

- (BOOL)hasSection:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__MPSectionedIdentifierList_hasSection___block_invoke;
  v7[3] = &unk_1E57F6C20;
  id v9 = &v10;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (int64_t)itemCount
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__MPSectionedIdentifierList_itemCount__block_invoke;
  v4[3] = &unk_1E57F6C48;
  v4[4] = self;
  void v4[5] = &v5;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)performWithExclusiveAccess:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken != -1) {
    dispatch_once(&_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken, &__block_literal_global_43173);
  }
  uint64_t v5 = _MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey;
  if (pthread_getspecific(_MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey))
  {
    id v6 = +[MPPThreadKeyExclusiveAccessToken tokenWithKey:v5 owner:self];
    v4[2](v4, v6);
  }
  else
  {
    accessQueue = self->_accessQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__MPSectionedIdentifierList_performWithExclusiveAccess___block_invoke;
    v8[3] = &unk_1E57F9140;
    v8[4] = self;
    id v9 = v4;
    dispatch_sync(accessQueue, v8);
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setAnnotationDelegate:(id)a3
{
}

void __69__MPSectionedIdentifierList_replaceDataSource_forSection_completion___block_invoke_55(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplayer", "Default");
  uint64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SIL-Replace-Reload", (const char *)&unk_1956A9243, buf, 2u);
  }

  uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "Default");
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SIL-Replace", (const char *)&unk_1956A9243, v10, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_debugDescriptionWithEnumerator:(id)a3 lengths:(id *)a4
{
  v118[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  v91 = v4;
  v95 = [v4 nextObject];
  uint64_t v6 = [v95 branchDepth];
  LODWORD(v104) = 0;
  LODWORD(v105) = 0;
  LODWORD(v102) = 0;
  LODWORD(v103) = 0;
  unint64_t v7 = 0;
  uint64_t v8 = 0;
  v92 = &stru_1EE680640;
  id obj = v5;
  while (2)
  {
    uint64_t v9 = v6;
    context = (void *)MEMORY[0x19971DE60]();
    uint64_t v10 = [v91 nextObject];
    uint64_t v11 = [v10 branchDepth];
    uint64_t v12 = v9 - v8;
    unint64_t v106 = v7;
    v108 = (void *)v11;
    v98 = v10;
    v100 = (void *)v9;
    if (v9 == v8)
    {
      uint64_t v13 = v11;
    }
    else
    {
      if (v9 > v8)
      {
        uint64_t v14 = (2 * v8) | 1;
        do
        {
          uint64_t v15 = [&stru_1EE680640 stringByPaddingToLength:v14 withString:@" ┃" startingAtIndex:1];
          id v16 = [v15 stringByAppendingString:@"⤵︎"];
          v118[0] = v16;
          v118[1] = &stru_1EE680640;
          v118[2] = &stru_1EE680640;
          v118[3] = &stru_1EE680640;
          v118[4] = &stru_1EE680640;
          uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:5];
          [v5 addObject:v17];

          v14 += 2;
          --v12;
        }
        while (v12);
      }
      uint64_t v18 = [&stru_1EE680640 stringByPaddingToLength:2 * v9 withString:@"┃ " startingAtIndex:0];

      v92 = (__CFString *)v18;
      uint64_t v10 = v98;
      uint64_t v13 = (uint64_t)v108;
    }
    id v19 = [(MPSectionedIdentifierList *)self annotationDelegate];
    if (v10) {
      BOOL v20 = v13 < v9;
    }
    else {
      BOOL v20 = 1;
    }
    int v21 = v20;
    switch([v95 entryType])
    {
      case 0:
        uint64_t v22 = &stru_1EE680640;
        id v23 = &stru_1EE680640;
        id v24 = &stru_1EE680640;
        id v25 = &stru_1EE680640;
        os_signpost_id_t v26 = @"UNKNOWN";
        goto LABEL_47;
      case 1:
        os_signpost_id_t v26 = [(__CFString *)v92 stringByAppendingString:@"┏◨ START"];
        uint64_t v22 = &stru_1EE680640;
        id v23 = &stru_1EE680640;
        id v24 = &stru_1EE680640;
        id v25 = &stru_1EE680640;
        goto LABEL_47;
      case 2:
        uint64_t v27 = [(__CFString *)v92 stringByAppendingString:@"┣◑ HEAD"];
        id v28 = [v95 trackingEntryResult];
        id v25 = [v28 sectionIdentifier];

        if (objc_opt_respondsToSelector())
        {
          id v29 = [v19 debugDescriptionForSection:v25];
          id v30 = v29;
          unint64_t v31 = 0x1E4F1C000;
          if (v29) {
            uint64_t v22 = v29;
          }
          else {
            uint64_t v22 = &stru_1EE680640;
          }

          id v23 = &stru_1EE680640;
          id v24 = &stru_1EE680640;
        }
        else
        {
          uint64_t v22 = &stru_1EE680640;
          id v23 = &stru_1EE680640;
          id v24 = &stru_1EE680640;
          unint64_t v31 = 0x1E4F1C000;
        }
        os_signpost_id_t v26 = (__CFString *)v27;
        goto LABEL_48;
      case 3:
        SEL v32 = [v95 itemResult];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v70 = [MEMORY[0x1E4F28B00] currentHandler];
          [v70 handleFailureInMethod:a2, self, @"MPSectionedIdentifierList+Debugging.m", 81, @"debugDescription is counting on itemResult being an instance of %@", objc_opt_class() object file lineNumber description];
        }
        if (v21) {
          v33 = @"┗◉ ITEM";
        }
        else {
          v33 = @"┣◉ ITEM";
        }
        uint64_t v88 = [(__CFString *)v92 stringByAppendingString:v33];
        id v25 = [v32 sectionIdentifier];
        id v34 = [v32 itemIdentifier];
        id v24 = [@"- " stringByAppendingString:v34];

        uint64_t v35 = [v32 state];
        uint64_t v37 = v36;
        v114[0] = MEMORY[0x1E4F143A8];
        v114[1] = 3221225472;
        v114[2] = __80__MPSectionedIdentifierList_Debugging___debugDescriptionWithEnumerator_lengths___block_invoke;
        v114[3] = &unk_1E57F33A8;
        v114[4] = self;
        id v89 = v32;
        id v115 = v89;
        BOOL v38 = [(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnBOOL:v114];
        uint64_t v39 = NSString;
        if ((v35 & 0x100) != 0) {
          v40 = @"⛔️";
        }
        else {
          v40 = @"▫️";
        }
        if (v35) {
          v41 = @"🔅";
        }
        else {
          v41 = @"▫️";
        }
        if ((v35 & 0x1000000) != 0) {
          v42 = @"🛑";
        }
        else {
          v42 = @"▫️";
        }
        if ((v35 & 0x10000) != 0) {
          v43 = @"🔆";
        }
        else {
          v43 = @"▫️";
        }
        uint64_t v44 = v35 & 0x10000000000;
        if ((v35 & 0x100000000) != 0)
        {
          v47 = @"🆔";
        }
        else
        {
          if (!v44) {
            goto LABEL_68;
          }
          v86 = v41;
          uint64_t v87 = v37;
          v85 = NSString;
          v45 = v42;
          char v46 = [v89 isRemoved];
          v42 = v45;
          uint64_t v39 = v85;
          v41 = v86;
          uint64_t v37 = v87;
          if (v46)
          {
            uint64_t v44 = 1;
            v47 = @"✴️";
          }
          else
          {
LABEL_68:
            v47 = @"❇️";
            if ((v35 & 0x1000000000000) == 0) {
              v47 = @"▫️";
            }
          }
        }
        v63 = @"🆘";
        if (v38) {
          v63 = @"✳️";
        }
        if ((v35 & 0x100000000000000) == 0) {
          v63 = @"▫️";
        }
        v64 = [v39 stringWithFormat:@"%@%@%@%@%@%@", v40, v41, v42, v43, v47, v63];
        id v23 = v64;
        if (v44)
        {
          uint64_t v65 = [(__CFString *)v64 stringByAppendingFormat:@" (%ld)", v37];

          id v23 = (__CFString *)v65;
        }
        unint64_t v31 = 0x1E4F1C000;
        uint64_t v22 = &stru_1EE680640;
        if (objc_opt_respondsToSelector())
        {
          v66 = v23;
          v67 = [v89 itemIdentifier];
          v68 = [v89 sectionIdentifier];
          v69 = [v19 debugDescriptionForItem:v67 inSection:v68];

          if (v69) {
            uint64_t v22 = v69;
          }
          else {
            uint64_t v22 = &stru_1EE680640;
          }

          unint64_t v31 = 0x1E4F1C000;
          id v23 = v66;
        }

        os_signpost_id_t v26 = (__CFString *)v88;
        goto LABEL_48;
      case 4:
        v48 = [v95 trackingEntryResult];
        id v25 = [v48 sectionIdentifier];
        if (v21) {
          v49 = @"┗◐ TAIL";
        }
        else {
          v49 = @"┣◐ TAIL";
        }
        uint64_t v50 = [(__CFString *)v92 stringByAppendingString:v49];

        os_signpost_id_t v26 = (__CFString *)v50;
        uint64_t v22 = &stru_1EE680640;
        id v23 = &stru_1EE680640;
        id v24 = &stru_1EE680640;
        goto LABEL_47;
      case 5:
        uint64_t v22 = &stru_1EE680640;
        id v23 = &stru_1EE680640;
        id v24 = &stru_1EE680640;
        id v25 = &stru_1EE680640;
        os_signpost_id_t v26 = @"┗◧ END";
        goto LABEL_47;
      default:
        uint64_t v22 = &stru_1EE680640;
        id v23 = &stru_1EE680640;
        id v24 = &stru_1EE680640;
        id v25 = &stru_1EE680640;
        os_signpost_id_t v26 = &stru_1EE680640;
LABEL_47:
        unint64_t v31 = 0x1E4F1C000uLL;
LABEL_48:
        v51 = v19;
        v52 = v26;
        int v53 = [(__CFString *)v26 length];
        if ((int)v102 <= v53) {
          uint64_t v54 = v53;
        }
        else {
          uint64_t v54 = v102;
        }
        uint64_t v102 = v54;
        int v55 = [(__CFString *)v25 length];
        if ((int)v103 <= v55) {
          uint64_t v56 = v55;
        }
        else {
          uint64_t v56 = v103;
        }
        uint64_t v103 = v56;
        int v57 = [(__CFString *)v24 length];
        if ((int)v104 <= v57) {
          uint64_t v58 = v57;
        }
        else {
          uint64_t v58 = v104;
        }
        uint64_t v104 = v58;
        int v59 = [(__CFString *)v23 length];
        if ((int)v105 <= v59) {
          uint64_t v60 = v59;
        }
        else {
          uint64_t v60 = v105;
        }
        uint64_t v105 = v60;
        v117[0] = v52;
        v117[1] = v25;
        v117[2] = v24;
        v117[3] = v23;
        v117[4] = v22;
        v61 = [*(id *)(v31 + 2424) arrayWithObjects:v117 count:5];
        [obj addObject:v61];

        if (v106 <= 0xC7)
        {
          id v62 = v98;

          v95 = v62;
        }
        else
        {
          v108 = v100;
        }

        uint64_t v6 = (uint64_t)v108;
        uint64_t v5 = obj;
        if (v106 <= 0xC7)
        {
          unint64_t v7 = v106 + 1;
          uint64_t v8 = (uint64_t)v100;
          if (v95) {
            continue;
          }
        }
        contexta = (void *)(v106 + 1);
        v71 = [MEMORY[0x1E4F28E78] string];
        long long v110 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        id obja = obj;
        uint64_t v101 = [obja countByEnumeratingWithState:&v110 objects:v116 count:16];
        if (v101)
        {
          uint64_t v99 = *(void *)v111;
          do
          {
            for (uint64_t i = 0; i != v101; ++i)
            {
              if (*(void *)v111 != v99) {
                objc_enumerationMutation(obja);
              }
              v73 = *(void **)(*((void *)&v110 + 1) + 8 * i);
              v109 = (void *)MEMORY[0x19971DE60]();
              if ((unint64_t)[v71 length] >= 2) {
                [v71 appendString:@"\n"];
              }
              v107 = [v73 objectAtIndexedSubscript:0];
              v74 = [v107 stringByPaddingToLength:v102 withString:@" " startingAtIndex:0];
              v75 = [v73 objectAtIndexedSubscript:1];
              v76 = [v75 stringByLeftPaddingToLength:v103 withString:@" " startingAtIndex:0];
              v77 = [v73 objectAtIndexedSubscript:2];
              v78 = [v77 stringByPaddingToLength:v104 withString:@" " startingAtIndex:0];
              v79 = [v73 objectAtIndexedSubscript:3];
              v80 = [v79 stringByPaddingToLength:v105 withString:@" " startingAtIndex:0];
              v81 = [v73 objectAtIndexedSubscript:4];
              [v71 appendFormat:@"%@ %@ %@ %@ %@", v74, v76, v78, v80, v81, 0];
            }
            uint64_t v101 = [obja countByEnumeratingWithState:&v110 objects:v116 count:16];
          }
          while (v101);
        }

        if ((uint64_t)contexta < [(MPSectionedIdentifierList *)self itemCount]) {
          objc_msgSend(v71, "appendFormat:", @"... and %lld more", -[MPSectionedIdentifierList itemCount](self, "itemCount") - (void)contexta);
        }
        if (a4)
        {
          a4->var0 = v102;
          a4->var1 = v103;
          a4->var2 = v104;
          a4->var3 = v105;
        }

        return v71;
    }
  }
}

BOOL __80__MPSectionedIdentifierList_Debugging___debugDescriptionWithEnumerator_lengths___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:a2];
  id v4 = [*(id *)(a1 + 40) sectionIdentifier];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 identifiersItemEntryMap];
  unint64_t v7 = [*(id *)(a1 + 40) itemIdentifier];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  BOOL v9 = v8 == *(void **)(a1 + 40);

  return v9;
}

- (NSString)debugDescription
{
  id v3 = [(MPSectionedIdentifierList *)self enumeratorWithOptions:23];
  id v4 = [(MPSectionedIdentifierList *)self _debugDescriptionWithEnumerator:v3 lengths:0];

  return (NSString *)v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_annotationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_orderedSections, 0);
  objc_storeStrong((id *)&self->_sectionTransactionCallouts, 0);
  objc_storeStrong((id *)&self->_sectionHeadEntryMap, 0);
  objc_storeStrong((id *)&self->_endEntry, 0);
  objc_storeStrong((id *)&self->_startEntries, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (MPSectionedIdentifierListAnnotationDelegate)annotationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationDelegate);

  return (MPSectionedIdentifierListAnnotationDelegate *)WeakRetained;
}

- (MPSectionedIdentifierListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPSectionedIdentifierListDelegate *)WeakRetained;
}

- (void)_performDelegateCalloutForSection:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__MPSectionedIdentifierList__performDelegateCalloutForSection_block___block_invoke;
  v10[3] = &unk_1E57F6D60;
  v10[4] = self;
  id v11 = v6;
  uint64_t v8 = (void (**)(void))v7;
  id v12 = v8;
  id v9 = v6;
  if ([(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnBOOL:v10])
  {
    v8[2](v8);
  }
}

BOOL __69__MPSectionedIdentifierList__performDelegateCalloutForSection_block___block_invoke(void *a1)
{
  int64_t v2 = [*(id *)(a1[4] + 48) objectForKeyedSubscript:a1[5]];
  id v3 = (void *)MEMORY[0x19971E0F0](a1[6]);
  [v2 addObject:v3];

  return v2 == 0;
}

- (id)_tailEntryForSectionIdentifier:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [v8 assertHasExclusiveAccessForOwner:self];
  id v9 = [(MPSectionedIdentifierList *)self _sectionHeadEntryMapWithExclusiveAccessToken:v8];

  uint64_t v10 = [v9 objectForKeyedSubscript:v7];
  id v11 = [v10 tailEntry];

  if (!v11)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MPSectionedIdentifierList.m", 1085, @"No tail exists for %@", v7 object file lineNumber description];
  }

  return v11;
}

- (NSDictionary)_sectionDataSources
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_sectionHeadEntryMap, "count"));
  sectionHeadEntryMap = self->_sectionHeadEntryMap;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__MPSectionedIdentifierList__sectionDataSources__block_invoke;
  v8[3] = &unk_1E57F6D38;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)sectionHeadEntryMap enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)[v5 copy];

  return (NSDictionary *)v6;
}

void __48__MPSectionedIdentifierList__sectionDataSources__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 dataSource];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (void)_loadDataSource:(id)a3 forSection:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [_MPIdentifierListSectionProxy alloc];
  id v12 = [(_MPIdentifierListSectionProxy *)v11 initWithSection:v9 sectionedIdentifierList:self existingItemIdentifiers:MEMORY[0x1E4F1CBF0]];

  [v10 reloadSection:v12 completion:v8];
}

- (void)_insertDataSource:(id)a3 forSection:(id)a4 afterEntry:(id)a5 withExclusiveAccessToken:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [v10 assertHasExclusiveAccessForOwner:self];
  id v15 = +[MPSectionedIdentifierListHeadEntry headEntryWithSectionIdentifier:v12];
  [v15 setDataSource:v13];

  uint64_t v14 = [(MPSectionedIdentifierList *)self _sectionHeadEntryMapWithExclusiveAccessToken:v10];
  [v14 setObject:v15 forKeyedSubscript:v12];

  [(MPSectionedIdentifierList *)self _insertDataSourceHead:v15 afterEntry:v11 withExclusiveAccessToken:v10];
}

- (void)_insertDataSourceHead:(id)a3 afterEntry:(id)a4 withExclusiveAccessToken:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (MPSectionedIdentifierListEntry *)a4;
  id v10 = a5;
  [v10 assertHasExclusiveAccessForOwner:self];
  if (self->_endEntry == v9)
  {
    id v11 = [v8 tailEntry];
    endEntry = self->_endEntry;
    self->_endEntry = v11;
  }
  v14[0] = v8;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [(MPSectionedIdentifierList *)self _addBranchToEntry:v9 entries:v13 withExclusiveAccessToken:v10];
}

- (id)_dataSourceMoveItem:(id)a3 inSection:(id)a4 afterEntry:(id)a5 withExclusiveAccessToken:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [v10 assertHasExclusiveAccessForOwner:self];
  uint64_t v14 = [(MPSectionedIdentifierList *)self _itemEntry:v13 sectionIdentifier:v12 withExclusiveAccessToken:v10];
  id v15 = (void *)[v14 newClonedEntry];
  [v15 setDataSourceCloned];
  v21[0] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [(MPSectionedIdentifierList *)self _addBranchToEntry:v11 entries:v16 withExclusiveAccessToken:v10];

  [v14 setDataSourceMoved];
  uint64_t v17 = [(MPSectionedIdentifierList *)self _sectionHeadEntryMapWithExclusiveAccessToken:v10];

  uint64_t v18 = [v17 objectForKeyedSubscript:v12];

  id v19 = [v18 identifiersItemEntryMap];
  [v19 setObject:v15 forKeyedSubscript:v13];

  return v15;
}

- (id)_dataSourceInsertItems:(id)a3 fromSection:(id)a4 afterEntry:(id)a5 withExclusiveAccessToken:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = self;
  id v32 = v12;
  id v14 = a6;
  [v14 assertHasExclusiveAccessForOwner:v13];
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v31 = v14;
  id v15 = [(MPSectionedIdentifierList *)v13 _sectionHeadEntryMapWithExclusiveAccessToken:v14];
  id v16 = v11;
  uint64_t v17 = [v15 objectForKeyedSubscript:v11];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v10;
  uint64_t v18 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        id v23 = +[MPSectionedIdentifierListItemEntry itemEntryWithSectionIdentifier:v16 itemIdentifier:v22];
        id v24 = v13;
        if ([(MPSectionedIdentifierList *)v13 automaticallyReversesNonDestructiveDataSourceEdits])
        {
          [v23 setUserRemoved];
        }
        [v34 addObject:v23];
        id v25 = [v17 identifiersItemEntryMap];
        [v25 setObject:v23 forKeyedSubscript:v22];

        id v13 = v24;
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v19);
  }

  [(MPSectionedIdentifierList *)v13 _addBranchToEntry:v32 entries:v34 withExclusiveAccessToken:v31];
  if ([(MPSectionedIdentifierList *)v13 automaticallyReversesNonDestructiveDataSourceEdits])
  {
    os_signpost_id_t v26 = os_log_create("com.apple.amp.mediaplayer", "SIL");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = v13;
      uint64_t v28 = [obj count];
      id v29 = objc_msgSend(obj, "msv_compactDescription");
      *(_DWORD *)buf = 138543874;
      v40 = v16;
      __int16 v41 = 2048;
      uint64_t v42 = v28;
      id v13 = v27;
      __int16 v43 = 2114;
      uint64_t v44 = v29;
      _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] _dataSourceInsertItems:fromSection:afterEntry: | setUserRemoved [auto reversing datasource edits] items=(:%lld)[%{public}@]", buf, 0x20u);
    }
  }
  if (!-[MPSectionedIdentifierList automaticallyReversesNonDestructiveDataSourceEdits](v13, "automaticallyReversesNonDestructiveDataSourceEdits"))v13->_itemCount += [v34 count]; {

  }
  return v34;
}

- (void)_addBranchToEntry:(id)a3 entries:(id)a4 withExclusiveAccessToken:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = (MPSectionedIdentifierListEntry *)a3;
  id v10 = a4;
  id v11 = a5;
  [v11 assertHasExclusiveAccessForOwner:self];
  if ([v10 count])
  {
    if (v9)
    {
LABEL_3:
      id v12 = [(MPSectionedIdentifierList *)self _sectionHeadEntryMapWithExclusiveAccessToken:v11];
      id v13 = [(MPSectionedIdentifierListEntry *)v9 sectionIdentifier];
      id v14 = [v12 objectForKeyedSubscript:v13];
      id v15 = [v14 tailEntry];
      id v16 = [v15 previousEntry];
      if (v16 == v9)
      {
        v33 = [(MPSectionedIdentifierListEntry *)v9 sectionIdentifier];
        [v10 firstObject];
        v18 = id v34 = v11;
        [v18 sectionIdentifier];
        uint64_t v19 = v35 = v10;
        uint64_t v17 = [v33 isEqualToString:v19] ^ 1;

        id v10 = v35;
        id v11 = v34;
      }
      else
      {
        uint64_t v17 = 0;
      }

      [(MPSectionedIdentifierListEntry *)v9 addBranch:v10 forceBranchDepthIncrease:v17];
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"MPSectionedIdentifierList.m" lineNumber:960 description:@"Cannot add empty branch"];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v21 = v11;
  uint64_t v22 = self->_startEntries;
  uint64_t v23 = [(NSMutableArray *)v22 count];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v24 = v10;
  id v25 = v10;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v37;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(v25);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * v29++) setBranchDepth:v23];
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v27);
  }

  id v30 = [v25 firstObject];
  [(NSMutableArray *)v22 addObject:v30];

  id v10 = v24;
  id v11 = v21;
LABEL_16:
  if (self->_endEntry == v9)
  {
    unint64_t v31 = [v10 lastObject];
    endEntry = self->_endEntry;
    self->_endEntry = v31;
  }
}

- (void)dataSourceEndTransactionForSection:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__MPSectionedIdentifierList_dataSourceEndTransactionForSection___block_invoke;
  v18[3] = &unk_1E57F6D10;
  v18[4] = self;
  id v6 = v5;
  id v19 = v6;
  SEL v20 = a2;
  id v7 = [(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnObject:v18];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sectionedIdentifierList:self dataSourceDidBeginTransactionForSection:v6];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v13) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * v13));
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v21 count:16];
    }
    while (v11);
  }

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidEndTransactionForSection:", self, v6, (void)v14);
  }
}

id __64__MPSectionedIdentifierList_dataSourceEndTransactionForSection___block_invoke(void *a1)
{
  int64_t v2 = [*(id *)(a1[4] + 48) objectForKeyedSubscript:a1[5]];

  if (!v2)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a1[6], a1[4], @"MPSectionedIdentifierList.m", 937, @"Attempt to end transaction for section without active transaction: %@", a1[5] object file lineNumber description];
  }
  id v3 = [*(id *)(a1[4] + 48) objectForKeyedSubscript:a1[5]];
  [*(id *)(a1[4] + 48) setObject:0 forKeyedSubscript:a1[5]];

  return v3;
}

- (void)dataSourceBeginTransactionForSection:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__MPSectionedIdentifierList_dataSourceBeginTransactionForSection___block_invoke;
  v7[3] = &unk_1E57F6CE8;
  v7[4] = self;
  id v8 = v5;
  SEL v9 = a2;
  id v6 = v5;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v7];
}

void __66__MPSectionedIdentifierList_dataSourceBeginTransactionForSection___block_invoke(void *a1)
{
  int64_t v2 = [*(id *)(a1[4] + 48) objectForKeyedSubscript:a1[5]];

  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:a1[6], a1[4], @"MPSectionedIdentifierList.m", 930, @"Attempted to begin transaction for section with active transaction: %@", a1[5] object file lineNumber description];
  }
  id v4 = [MEMORY[0x1E4F1CA48] array];
  [*(id *)(a1[4] + 48) setObject:v4 forKeyedSubscript:a1[5]];
}

- (void)dataSourceUpdateSection:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__MPSectionedIdentifierList_dataSourceUpdateSection___block_invoke;
  v6[3] = &unk_1E57F9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MPSectionedIdentifierList *)self _performDelegateCalloutForSection:v5 block:v6];
}

void __53__MPSectionedIdentifierList_dataSourceUpdateSection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sectionedIdentifierList:*(void *)(a1 + 32) dataSourceDidUpdateSection:*(void *)(a1 + 40)];
  }
}

- (void)dataSourceReloadItems:(id)a3 inSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__MPSectionedIdentifierList_dataSourceReloadItems_inSection___block_invoke;
  v10[3] = &unk_1E57FA038;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MPSectionedIdentifierList *)self _performDelegateCalloutForSection:v8 block:v10];
}

void __61__MPSectionedIdentifierList_dataSourceReloadItems_inSection___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sectionedIdentifierList:a1[4] dataSourceDidUpdateItems:a1[5] inSection:a1[6]];
  }
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sectionedIdentifierList:a1[4] dataSourceDidChangeItems:a1[5] inSection:a1[6]];
  }
}

- (void)dataSourceRemoveItems:(id)a3 fromSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__MPSectionedIdentifierList_dataSourceRemoveItems_fromSection___block_invoke;
  v15[3] = &unk_1E57F6B30;
  id v8 = v6;
  id v16 = v8;
  long long v17 = self;
  id v9 = v7;
  id v18 = v9;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__MPSectionedIdentifierList_dataSourceRemoveItems_fromSection___block_invoke_2;
  v12[3] = &unk_1E57FA038;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(MPSectionedIdentifierList *)self _performDelegateCalloutForSection:v10 block:v12];
}

void __63__MPSectionedIdentifierList_dataSourceRemoveItems_fromSection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(a1 + 40), "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", *(void *)(*((void *)&v12 + 1) + 8 * v8), *(void *)(a1 + 48), v3, (void)v12);
        id v10 = [v9 latestUserClone];
        char v11 = [v10 isRemoved];

        if ((v11 & 1) == 0) {
          --*(void *)(*(void *)(a1 + 40) + 8);
        }
        [v9 setDataSourceRemoved];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

void __63__MPSectionedIdentifierList_dataSourceRemoveItems_fromSection___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sectionedIdentifierList:a1[4] dataSourceDidRemoveItems:a1[5] fromSection:a1[6]];
  }
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sectionedIdentifierList:a1[4] dataSourceDidChangeItems:a1[5] inSection:a1[6]];
  }
}

- (void)dataSourceMoveItemToTail:(id)a3 inSection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__MPSectionedIdentifierList_dataSourceMoveItemToTail_inSection___block_invoke;
  v16[3] = &unk_1E57F6C98;
  v16[4] = self;
  id v9 = v7;
  id v17 = v9;
  id v10 = v8;
  id v18 = v10;
  SEL v19 = a2;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v16];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__MPSectionedIdentifierList_dataSourceMoveItemToTail_inSection___block_invoke_2;
  v13[3] = &unk_1E57FA038;
  v13[4] = self;
  id v14 = v9;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  [(MPSectionedIdentifierList *)self _performDelegateCalloutForSection:v11 block:v13];
}

void __64__MPSectionedIdentifierList_dataSourceMoveItemToTail_inSection___block_invoke(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) automaticallyReversesNonDestructiveDataSourceEdits])
  {
    id v4 = [*(id *)(a1 + 32) _itemEntry:*(void *)(a1 + 40) sectionIdentifier:*(void *)(a1 + 48) withExclusiveAccessToken:v3];
  }
  else
  {
    id v4 = 0;
  }
  if ([*(id *)(a1 + 32) automaticallyReversesNonDestructiveDataSourceEdits])
  {
    uint64_t v5 = [v4 latestUserClone];
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:v3];
  id v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 48)];
  id v8 = [v7 lastItemEntry];

  if (!v8)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"MPSectionedIdentifierList.m", 855, @"Could not find tail item entry for section identifier: %@", *(void *)(a1 + 48) object file lineNumber description];
  }
  id v9 = [*(id *)(a1 + 32) _dataSourceMoveItem:*(void *)(a1 + 40) inSection:*(void *)(a1 + 48) afterEntry:v8 withExclusiveAccessToken:v3];
  id v10 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:v3];
  id v11 = [v10 objectForKeyedSubscript:*(void *)(a1 + 48)];
  [v11 setLastItemEntry:v9];

  if ([*(id *)(a1 + 32) automaticallyReversesNonDestructiveDataSourceEdits])
  {
    if (v4)
    {
      if (v5) {
        goto LABEL_12;
      }
    }
    else
    {
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"MPSectionedIdentifierList.m" lineNumber:861 description:@"entryToMove cannot be nil"];

      if (v5) {
        goto LABEL_12;
      }
    }
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"MPSectionedIdentifierList.m" lineNumber:862 description:@"entryToMoveLatestUserClone cannot be nil"];

LABEL_12:
    if (v4 == v5)
    {
      id v12 = (void *)[v9 newClonedEntry];
      [v9 setUserMoved];
      long long v13 = *(void **)(a1 + 32);
      v18[0] = v12;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      [v13 _addBranchToEntry:v4 entries:v14 withExclusiveAccessToken:v3];
    }
  }
}

void __64__MPSectionedIdentifierList_dataSourceMoveItemToTail_inSection___block_invoke_2(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = a1[4];
    v8[0] = a1[5];
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [WeakRetained sectionedIdentifierList:v3 dataSourceDidMoveItems:v4 inSection:a1[6]];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = a1[4];
    uint64_t v7 = a1[5];
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    [WeakRetained sectionedIdentifierList:v5 dataSourceDidChangeItems:v6 inSection:a1[6]];
  }
}

- (void)dataSourceMoveItem:(id)a3 afterItem:(id)a4 inSection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __68__MPSectionedIdentifierList_dataSourceMoveItem_afterItem_inSection___block_invoke;
  v20[3] = &unk_1E57F6B58;
  v20[4] = self;
  id v12 = v9;
  id v21 = v12;
  id v13 = v11;
  id v22 = v13;
  id v23 = v10;
  SEL v24 = a2;
  id v14 = v10;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__MPSectionedIdentifierList_dataSourceMoveItem_afterItem_inSection___block_invoke_2;
  v17[3] = &unk_1E57FA038;
  v17[4] = self;
  id v18 = v12;
  id v19 = v13;
  id v15 = v13;
  id v16 = v12;
  [(MPSectionedIdentifierList *)self _performDelegateCalloutForSection:v15 block:v17];
}

void __68__MPSectionedIdentifierList_dataSourceMoveItem_afterItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) automaticallyReversesNonDestructiveDataSourceEdits])
  {
    id v4 = [*(id *)(a1 + 32) _itemEntry:*(void *)(a1 + 40) sectionIdentifier:*(void *)(a1 + 48) withExclusiveAccessToken:v3];
  }
  else
  {
    id v4 = 0;
  }
  if ([*(id *)(a1 + 32) automaticallyReversesNonDestructiveDataSourceEdits])
  {
    uint64_t v5 = [v4 latestUserClone];
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [*(id *)(a1 + 32) _itemEntry:*(void *)(a1 + 56) sectionIdentifier:*(void *)(a1 + 48) withExclusiveAccessToken:v3];
  uint64_t v7 = [*(id *)(a1 + 32) _dataSourceMoveItem:*(void *)(a1 + 40) inSection:*(void *)(a1 + 48) afterEntry:v6 withExclusiveAccessToken:v3];
  id v8 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:v3];
  id v9 = [v8 objectForKeyedSubscript:*(void *)(a1 + 48)];
  id v10 = [v9 lastItemEntry];

  if (v10 == v6)
  {
    id v11 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:v3];
    id v12 = [v11 objectForKeyedSubscript:*(void *)(a1 + 48)];
    [v12 setLastItemEntry:v7];
  }
  if ([*(id *)(a1 + 32) automaticallyReversesNonDestructiveDataSourceEdits])
  {
    if (v4)
    {
      if (v5) {
        goto LABEL_12;
      }
    }
    else
    {
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"MPSectionedIdentifierList.m" lineNumber:828 description:@"entryToMove cannot be nil"];

      if (v5) {
        goto LABEL_12;
      }
    }
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"MPSectionedIdentifierList.m" lineNumber:829 description:@"entryToMoveLatestUserClone cannot be nil"];

LABEL_12:
    if (v4 == v5)
    {
      id v13 = (void *)[v7 newClonedEntry];
      [v7 setUserMoved];
      id v14 = *(void **)(a1 + 32);
      v18[0] = v13;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      [v14 _addBranchToEntry:v4 entries:v15 withExclusiveAccessToken:v3];
    }
  }
}

void __68__MPSectionedIdentifierList_dataSourceMoveItem_afterItem_inSection___block_invoke_2(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = a1[4];
    v8[0] = a1[5];
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [WeakRetained sectionedIdentifierList:v3 dataSourceDidMoveItems:v4 inSection:a1[6]];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = a1[4];
    uint64_t v7 = a1[5];
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    [WeakRetained sectionedIdentifierList:v5 dataSourceDidChangeItems:v6 inSection:a1[6]];
  }
}

- (void)dataSourceMoveItemToHead:(id)a3 inSection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__MPSectionedIdentifierList_dataSourceMoveItemToHead_inSection___block_invoke;
  v16[3] = &unk_1E57F6C98;
  v16[4] = self;
  id v9 = v7;
  id v17 = v9;
  id v10 = v8;
  id v18 = v10;
  SEL v19 = a2;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v16];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__MPSectionedIdentifierList_dataSourceMoveItemToHead_inSection___block_invoke_2;
  v13[3] = &unk_1E57FA038;
  v13[4] = self;
  id v14 = v9;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  [(MPSectionedIdentifierList *)self _performDelegateCalloutForSection:v11 block:v13];
}

void __64__MPSectionedIdentifierList_dataSourceMoveItemToHead_inSection___block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) automaticallyReversesNonDestructiveDataSourceEdits])
  {
    id v4 = [*(id *)(a1 + 32) _itemEntry:*(void *)(a1 + 40) sectionIdentifier:*(void *)(a1 + 48) withExclusiveAccessToken:v3];
  }
  else
  {
    id v4 = 0;
  }
  if ([*(id *)(a1 + 32) automaticallyReversesNonDestructiveDataSourceEdits])
  {
    uint64_t v5 = [v4 latestUserClone];
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:v3];
  id v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 48)];

  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"MPSectionedIdentifierList.m", 790, @"Could not find head entry for section identifier: %@", *(void *)(a1 + 48) object file lineNumber description];
  }
  id v8 = [*(id *)(a1 + 32) _dataSourceMoveItem:*(void *)(a1 + 40) inSection:*(void *)(a1 + 48) afterEntry:v7 withExclusiveAccessToken:v3];
  if ([*(id *)(a1 + 32) automaticallyReversesNonDestructiveDataSourceEdits])
  {
    if (v4)
    {
      if (v5) {
        goto LABEL_12;
      }
    }
    else
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"MPSectionedIdentifierList.m" lineNumber:794 description:@"entryToMove cannot be nil"];

      if (v5) {
        goto LABEL_12;
      }
    }
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"MPSectionedIdentifierList.m" lineNumber:795 description:@"entryToMoveLatestUserClone cannot be nil"];

LABEL_12:
    if (v4 == v5)
    {
      id v9 = (void *)[v8 newClonedEntry];
      [v8 setUserMoved];
      id v10 = *(void **)(a1 + 32);
      v15[0] = v9;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      [v10 _addBranchToEntry:v4 entries:v11 withExclusiveAccessToken:v3];
    }
  }
}

void __64__MPSectionedIdentifierList_dataSourceMoveItemToHead_inSection___block_invoke_2(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = a1[4];
    v8[0] = a1[5];
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [WeakRetained sectionedIdentifierList:v3 dataSourceDidMoveItems:v4 inSection:a1[6]];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = a1[4];
    uint64_t v7 = a1[5];
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    [WeakRetained sectionedIdentifierList:v5 dataSourceDidChangeItems:v6 inSection:a1[6]];
  }
}

- (void)dataSourceInsertItemsAtTail:(id)a3 inSection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 count])
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MPSectionedIdentifierList.m", 765, @"Invalid insertion (no item identifiers) in section: %@", v8 object file lineNumber description];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__MPSectionedIdentifierList_dataSourceInsertItemsAtTail_inSection___block_invoke;
  v17[3] = &unk_1E57F6C98;
  v17[4] = self;
  id v9 = v8;
  id v18 = v9;
  SEL v20 = a2;
  id v10 = v7;
  id v19 = v10;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v17];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __67__MPSectionedIdentifierList_dataSourceInsertItemsAtTail_inSection___block_invoke_2;
  v14[3] = &unk_1E57FA038;
  v14[4] = self;
  id v15 = v10;
  id v16 = v9;
  id v11 = v9;
  id v12 = v10;
  [(MPSectionedIdentifierList *)self _performDelegateCalloutForSection:v11 block:v14];
}

void __67__MPSectionedIdentifierList_dataSourceInsertItemsAtTail_inSection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _sectionHeadEntryMapWithExclusiveAccessToken:v4];
  uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v7 = [v6 tailEntry];
  id v14 = [v7 previousEntry];

  id v8 = v14;
  if (!v14)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"MPSectionedIdentifierList.m", 768, @"Could not find last entry (tailEntry.previous) for section identifier: %@", *(void *)(a1 + 40) object file lineNumber description];

    id v8 = 0;
  }
  id v9 = [*(id *)(a1 + 32) _dataSourceInsertItems:*(void *)(a1 + 48) fromSection:*(void *)(a1 + 40) afterEntry:v8 withExclusiveAccessToken:v4];
  id v10 = [v9 lastObject];
  id v11 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:v4];

  id v12 = [v11 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v12 setLastItemEntry:v10];
}

void __67__MPSectionedIdentifierList_dataSourceInsertItemsAtTail_inSection___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sectionedIdentifierList:a1[4] dataSourceDidAddItems:a1[5] toSection:a1[6]];
  }
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sectionedIdentifierList:a1[4] dataSourceDidChangeItems:a1[5] inSection:a1[6]];
  }
}

- (void)dataSourceInsertItems:(id)a3 afterItem:(id)a4 inSection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![v9 count])
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"MPSectionedIdentifierList.m", 744, @"Invalid insertion (no item identifiers) in section: %@", v11 object file lineNumber description];
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __71__MPSectionedIdentifierList_dataSourceInsertItems_afterItem_inSection___block_invoke;
  v21[3] = &unk_1E57F6CC0;
  v21[4] = self;
  id v22 = v10;
  id v12 = v11;
  id v23 = v12;
  id v13 = v9;
  id v24 = v13;
  id v14 = v10;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v21];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __71__MPSectionedIdentifierList_dataSourceInsertItems_afterItem_inSection___block_invoke_2;
  v18[3] = &unk_1E57FA038;
  v18[4] = self;
  id v19 = v13;
  id v20 = v12;
  id v15 = v12;
  id v16 = v13;
  [(MPSectionedIdentifierList *)self _performDelegateCalloutForSection:v15 block:v18];
}

void __71__MPSectionedIdentifierList_dataSourceInsertItems_afterItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) _itemEntry:*(void *)(a1 + 40) sectionIdentifier:*(void *)(a1 + 48) withExclusiveAccessToken:v11];
  id v4 = [*(id *)(a1 + 32) _dataSourceInsertItems:*(void *)(a1 + 56) fromSection:*(void *)(a1 + 48) afterEntry:v3 withExclusiveAccessToken:v11];
  uint64_t v5 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:v11];
  uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 48)];
  id v7 = [v6 lastItemEntry];

  if (v7 == v3)
  {
    id v8 = [v4 lastObject];
    id v9 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:v11];
    id v10 = [v9 objectForKeyedSubscript:*(void *)(a1 + 48)];
    [v10 setLastItemEntry:v8];
  }
}

void __71__MPSectionedIdentifierList_dataSourceInsertItems_afterItem_inSection___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sectionedIdentifierList:a1[4] dataSourceDidAddItems:a1[5] toSection:a1[6]];
  }
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sectionedIdentifierList:a1[4] dataSourceDidChangeItems:a1[5] inSection:a1[6]];
  }
}

- (void)dataSourceInsertItemsAtHead:(id)a3 inSection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 count])
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MPSectionedIdentifierList.m", 723, @"Invalid insertion (no item identifiers) in section: %@", v8 object file lineNumber description];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__MPSectionedIdentifierList_dataSourceInsertItemsAtHead_inSection___block_invoke;
  v17[3] = &unk_1E57F6C98;
  v17[4] = self;
  id v9 = v8;
  id v18 = v9;
  SEL v20 = a2;
  id v10 = v7;
  id v19 = v10;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v17];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __67__MPSectionedIdentifierList_dataSourceInsertItemsAtHead_inSection___block_invoke_2;
  v14[3] = &unk_1E57FA038;
  v14[4] = self;
  id v15 = v10;
  id v16 = v9;
  id v11 = v9;
  id v12 = v10;
  [(MPSectionedIdentifierList *)self _performDelegateCalloutForSection:v11 block:v14];
}

void __67__MPSectionedIdentifierList_dataSourceInsertItemsAtHead_inSection___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:");
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v4)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"MPSectionedIdentifierList.m", 726, @"Could not find head entry for section identifier: %@", *(void *)(a1 + 40) object file lineNumber description];
  }
  uint64_t v5 = [*(id *)(a1 + 32) _dataSourceInsertItems:*(void *)(a1 + 48) fromSection:*(void *)(a1 + 40) afterEntry:v4 withExclusiveAccessToken:v13];
  uint64_t v6 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:v13];
  id v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v8 = [v7 lastItemEntry];

  if (!v8)
  {
    id v9 = [v5 lastObject];
    id v10 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:v13];
    id v11 = [v10 objectForKeyedSubscript:*(void *)(a1 + 40)];
    [v11 setLastItemEntry:v9];
  }
}

void __67__MPSectionedIdentifierList_dataSourceInsertItemsAtHead_inSection___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sectionedIdentifierList:a1[4] dataSourceDidAddItems:a1[5] toSection:a1[6]];
  }
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sectionedIdentifierList:a1[4] dataSourceDidChangeItems:a1[5] inSection:a1[6]];
  }
}

- (void)removeItem:(id)a3 fromSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__MPSectionedIdentifierList_removeItem_fromSection___block_invoke;
  v10[3] = &unk_1E57F6B30;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v10];
}

void __52__MPSectionedIdentifierList_removeItem_fromSection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) _itemEntry:*(void *)(a1 + 40) sectionIdentifier:*(void *)(a1 + 48) withExclusiveAccessToken:a2];
  id v4 = [v3 latestUserClone];

  if (([v4 isRemoved] & 1) == 0) {
    --*(void *)(*(void *)(a1 + 32) + 8);
  }
  [v4 setUserRemoved];
  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 72);
    id v7 = [v4 itemIdentifier];
    id v8 = [v4 sectionIdentifier];
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "[SIL:%{public}@] removeItem:%{public}@ fromSection:%{public}@ | removing [user removed]", (uint8_t *)&v9, 0x20u);
  }
}

- (void)moveItem:(id)a3 fromSection:(id)a4 afterTailOfSection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __69__MPSectionedIdentifierList_moveItem_fromSection_afterTailOfSection___block_invoke;
  v15[3] = &unk_1E57F6B58;
  void v15[4] = self;
  id v16 = v11;
  id v18 = v10;
  SEL v19 = a2;
  id v17 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v11;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v15];
}

void __69__MPSectionedIdentifierList_moveItem_fromSection_afterTailOfSection___block_invoke(uint64_t a1, void *a2)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _sectionHeadEntryMapWithExclusiveAccessToken:v4];
  uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v6)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"MPSectionedIdentifierList.m", 695, @"Could not head entry for section identifier: %@", *(void *)(a1 + 40) object file lineNumber description];
  }
  id v7 = [v6 tailEntry];
  if (!v7)
  {
    SEL v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"MPSectionedIdentifierList.m", 697, @"Could not find tail entry for section identifier: %@", *(void *)(a1 + 40) object file lineNumber description];
  }
  id v8 = [*(id *)(a1 + 32) _itemEntry:*(void *)(a1 + 48) sectionIdentifier:*(void *)(a1 + 56) withExclusiveAccessToken:v4];
  id v9 = [v8 latestUserClone];

  id v10 = (void *)[v9 newClonedEntry];
  [v10 setUserCloned];
  [v9 setUserMoved];
  id v11 = *(void **)(a1 + 32);
  v28[0] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [v11 _addBranchToEntry:v7 entries:v12 withExclusiveAccessToken:v4];

  id v13 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 72);
    uint64_t v15 = [v9 itemIdentifier];
    id v16 = [v9 sectionIdentifier];
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    uint64_t v21 = v14;
    __int16 v22 = 2114;
    id v23 = v15;
    __int16 v24 = 2114;
    id v25 = v16;
    __int16 v26 = 2114;
    uint64_t v27 = v17;
    _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_DEFAULT, "[SIL:%{public}@] moveItem:%{public}@ fromSection:%{public}@ afterTailOfSection:%{public}@ | moving [user moved]", buf, 0x2Au);
  }
}

- (void)moveItem:(id)a3 fromSection:(id)a4 afterItem:(id)a5 inSection:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __70__MPSectionedIdentifierList_moveItem_fromSection_afterItem_inSection___block_invoke;
  v18[3] = &unk_1E57F6C70;
  v18[4] = self;
  id v19 = v12;
  id v20 = v13;
  id v21 = v10;
  id v22 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v13;
  id v17 = v12;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v18];
}

void __70__MPSectionedIdentifierList_moveItem_fromSection_afterItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = a2;
  id v7 = [v3 _itemEntry:v4 sectionIdentifier:v5 withExclusiveAccessToken:v6];
  id v8 = [v7 latestUserClone];

  id v9 = [*(id *)(a1 + 32) _itemEntry:*(void *)(a1 + 56) sectionIdentifier:*(void *)(a1 + 64) withExclusiveAccessToken:v6];
  id v10 = [v9 latestUserClone];

  id v11 = (void *)[v10 newClonedEntry];
  [v11 setUserCloned];
  [v10 setUserMoved];
  id v12 = *(void **)(a1 + 32);
  v30[0] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  [v12 _addBranchToEntry:v8 entries:v13 withExclusiveAccessToken:v6];

  id v14 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 72);
    id v16 = [v10 itemIdentifier];
    id v17 = [v10 sectionIdentifier];
    id v18 = [v8 itemIdentifier];
    id v19 = [v8 sectionIdentifier];
    int v20 = 138544386;
    uint64_t v21 = v15;
    __int16 v22 = 2114;
    id v23 = v16;
    __int16 v24 = 2114;
    id v25 = v17;
    __int16 v26 = 2114;
    uint64_t v27 = v18;
    __int16 v28 = 2114;
    uint64_t v29 = v19;
    _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEFAULT, "[SIL:%{public}@] moveItem:%{public}@ fromSection:%{public}@ afterItem:%{public}@ inSection:%{public}@ | moving [user moved]", (uint8_t *)&v20, 0x34u);
  }
}

- (void)moveItem:(id)a3 fromSection:(id)a4 afterHeadOfSection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __69__MPSectionedIdentifierList_moveItem_fromSection_afterHeadOfSection___block_invoke;
  v15[3] = &unk_1E57F6B58;
  void v15[4] = self;
  id v16 = v11;
  id v18 = v10;
  SEL v19 = a2;
  id v17 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v11;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v15];
}

void __69__MPSectionedIdentifierList_moveItem_fromSection_afterHeadOfSection___block_invoke(uint64_t a1, void *a2)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _sectionHeadEntryMapWithExclusiveAccessToken:v4];
  id v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v6)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"MPSectionedIdentifierList.m", 669, @"Could not find head entry for section identifier: %@", *(void *)(a1 + 40) object file lineNumber description];
  }
  id v7 = [*(id *)(a1 + 32) _itemEntry:*(void *)(a1 + 48) sectionIdentifier:*(void *)(a1 + 56) withExclusiveAccessToken:v4];
  id v8 = [v7 latestUserClone];

  id v9 = (void *)[v8 newClonedEntry];
  [v9 setUserCloned];
  [v8 setUserMoved];
  id v10 = *(void **)(a1 + 32);
  v26[0] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v10 _addBranchToEntry:v6 entries:v11 withExclusiveAccessToken:v4];

  id v12 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 72);
    id v14 = [v8 itemIdentifier];
    uint64_t v15 = [v8 sectionIdentifier];
    uint64_t v16 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    uint64_t v19 = v13;
    __int16 v20 = 2114;
    uint64_t v21 = v14;
    __int16 v22 = 2114;
    id v23 = v15;
    __int16 v24 = 2114;
    uint64_t v25 = v16;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "[SIL:%{public}@] moveItem:%{public}@ fromSection:%{public}@ afterHeadOfSection:%{public}@ | moving [user moved]", buf, 0x2Au);
  }
}

- (void)moveItemToEnd:(id)a3 fromSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__MPSectionedIdentifierList_moveItemToEnd_fromSection___block_invoke;
  v10[3] = &unk_1E57F6B30;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v10];
}

void __55__MPSectionedIdentifierList_moveItemToEnd_fromSection___block_invoke(void *a1, void *a2)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v6 = a2;
  id v7 = [v3 _itemEntry:v4 sectionIdentifier:v5 withExclusiveAccessToken:v6];
  id v8 = [v7 latestUserClone];

  id v9 = (void *)[v8 newClonedEntry];
  [v9 setUserCloned];
  [v8 setUserMoved];
  id v10 = (void *)a1[4];
  id v11 = [v10 _endEntryWithExclusiveAccessToken:v6];
  v23[0] = v9;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [v10 _addBranchToEntry:v11 entries:v12 withExclusiveAccessToken:v6];

  uint64_t v13 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1[4] + 72);
    uint64_t v15 = [v8 itemIdentifier];
    uint64_t v16 = [v8 sectionIdentifier];
    int v17 = 138543874;
    uint64_t v18 = v14;
    __int16 v19 = 2114;
    __int16 v20 = v15;
    __int16 v21 = 2114;
    __int16 v22 = v16;
    _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_DEFAULT, "[SIL:%{public}@] moveItemToEnd:%{public}@ fromSection:%{public}@ | moving [user moved]", (uint8_t *)&v17, 0x20u);
  }
}

- (void)moveItemToStart:(id)a3 fromSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__MPSectionedIdentifierList_moveItemToStart_fromSection___block_invoke;
  v10[3] = &unk_1E57F6B30;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v10];
}

void __57__MPSectionedIdentifierList_moveItemToStart_fromSection___block_invoke(void *a1, void *a2)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v6 = a2;
  id v7 = [v3 _itemEntry:v4 sectionIdentifier:v5 withExclusiveAccessToken:v6];
  id v8 = [v7 latestUserClone];

  id v9 = (void *)[v8 newClonedEntry];
  [v9 setUserCloned];
  [v8 setUserMoved];
  id v10 = (void *)a1[4];
  v22[0] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  [v10 _addBranchToEntry:0 entries:v11 withExclusiveAccessToken:v6];

  id v12 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1[4] + 72);
    uint64_t v14 = [v8 itemIdentifier];
    uint64_t v15 = [v8 sectionIdentifier];
    int v16 = 138543874;
    uint64_t v17 = v13;
    __int16 v18 = 2114;
    __int16 v19 = v14;
    __int16 v20 = 2114;
    __int16 v21 = v15;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "[SIL:%{public}@] moveItemToStart:%{public}@ fromSection:%{public}@ | moving [user moved]", (uint8_t *)&v16, 0x20u);
  }
}

- (id)firstSectionMatching:(id)a3 containingItem:(id)a4 inSection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__MPSectionedIdentifierList_firstSectionMatching_containingItem_inSection___block_invoke;
  v17[3] = &unk_1E57F6BD0;
  v17[4] = self;
  id v18 = v10;
  id v20 = v9;
  SEL v21 = a2;
  id v19 = v11;
  id v12 = v9;
  id v13 = v11;
  id v14 = v10;
  uint64_t v15 = [(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnObject:v17];

  return v15;
}

id __75__MPSectionedIdentifierList_firstSectionMatching_containingItem_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _itemEntry:*(void *)(a1 + 40) sectionIdentifier:*(void *)(a1 + 48) withExclusiveAccessToken:a2];
  if (!v3)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"MPSectionedIdentifierList.m", 585, @"No item exists at %@:%@", *(void *)(a1 + 48), *(void *)(a1 + 40) object file lineNumber description];
  }
  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  while (1)
  {
    uint64_t v5 = [v3 entryType];
    if (v5 == 4)
    {
      id v6 = [v3 sectionIdentifier];
      [v4 addObject:v6];
LABEL_10:

      goto LABEL_11;
    }
    if (v5 == 2) {
      break;
    }
LABEL_11:
    id v6 = [v3 previousEntry];

    uint64_t v3 = v6;
    if (!v6) {
      goto LABEL_12;
    }
  }
  id v6 = [v3 sectionIdentifier];
  if (([v4 containsObject:v6] & 1) != 0
    || !(*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
  {
    goto LABEL_10;
  }

LABEL_12:

  return v6;
}

- (void)addDataSourceAtEnd:(id)a3 section:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__MPSectionedIdentifierList_addDataSourceAtEnd_section_completion___block_invoke;
  v13[3] = &unk_1E57F6B30;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = a5;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v13];
  [(MPSectionedIdentifierList *)self _loadDataSource:v11 forSection:v10 completion:v12];
}

uint64_t __67__MPSectionedIdentifierList_addDataSourceAtEnd_section_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v6 = a2;
  id v7 = [v3 _endEntryWithExclusiveAccessToken:v6];
  [v3 _insertDataSource:v4 forSection:v5 afterEntry:v7 withExclusiveAccessToken:v6];

  id v8 = *(void **)(a1[4] + 56);
  uint64_t v9 = a1[6];

  return [v8 addObject:v9];
}

- (void)addDataSource:(id)a3 section:(id)a4 beforeTailOfSection:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __82__MPSectionedIdentifierList_addDataSource_section_beforeTailOfSection_completion___block_invoke;
  v18[3] = &unk_1E57F6B58;
  v18[4] = self;
  id v19 = v13;
  id v21 = v11;
  SEL v22 = a2;
  id v20 = v12;
  id v14 = v11;
  id v15 = v12;
  id v16 = v13;
  id v17 = a6;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v18];
  [(MPSectionedIdentifierList *)self _loadDataSource:v14 forSection:v15 completion:v17];
}

void __82__MPSectionedIdentifierList_addDataSource_section_beforeTailOfSection_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _sectionHeadEntryMapWithExclusiveAccessToken:v4];
  id v14 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v6 = v14;
  if (!v14)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"MPSectionedIdentifierList.m", 551, @"Could not head entry for section identifier: %@", *(void *)(a1 + 40) object file lineNumber description];

    id v6 = 0;
  }
  id v7 = [v6 tailEntry];
  id v8 = [v7 previousEntry];

  if (!v8)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"MPSectionedIdentifierList.m", 553, @"Could not find tail's previous entry for section identifier: %@", *(void *)(a1 + 40) object file lineNumber description];
  }
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = +[MPSectionedIdentifierListPosition positionForTailOfSection:*(void *)(a1 + 40)];
  id v11 = [v9 _firstSectionIDBeforePosition:v10 withExclusiveAccessToken:v4];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "insertObject:atIndex:", *(void *)(a1 + 48), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "indexOfObject:", v11) + 1);
  [*(id *)(a1 + 32) _insertDataSource:*(void *)(a1 + 56) forSection:*(void *)(a1 + 48) afterEntry:v8 withExclusiveAccessToken:v4];
}

- (void)addDataSource:(id)a3 section:(id)a4 afterTailOfSection:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __81__MPSectionedIdentifierList_addDataSource_section_afterTailOfSection_completion___block_invoke;
  v18[3] = &unk_1E57F6B58;
  v18[4] = self;
  id v19 = v13;
  id v21 = v11;
  SEL v22 = a2;
  id v20 = v12;
  id v14 = v11;
  id v15 = v12;
  id v16 = v13;
  id v17 = a6;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v18];
  [(MPSectionedIdentifierList *)self _loadDataSource:v14 forSection:v15 completion:v17];
}

void __81__MPSectionedIdentifierList_addDataSource_section_afterTailOfSection_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _sectionHeadEntryMapWithExclusiveAccessToken:v4];
  id v10 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v6 = v10;
  if (!v10)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"MPSectionedIdentifierList.m", 539, @"Could not head entry for section identifier: %@", *(void *)(a1 + 40) object file lineNumber description];

    id v6 = 0;
  }
  id v7 = [v6 tailEntry];
  if (!v7)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"MPSectionedIdentifierList.m", 541, @"Could not find tail entry for section identifier: %@", *(void *)(a1 + 40) object file lineNumber description];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "insertObject:atIndex:", *(void *)(a1 + 48), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "indexOfObject:", *(void *)(a1 + 40)) + 1);
  [*(id *)(a1 + 32) _insertDataSource:*(void *)(a1 + 56) forSection:*(void *)(a1 + 48) afterEntry:v7 withExclusiveAccessToken:v4];
}

- (void)addDataSource:(id)a3 section:(id)a4 afterItem:(id)a5 inSection:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  __int16 v24 = __82__MPSectionedIdentifierList_addDataSource_section_afterItem_inSection_completion___block_invoke;
  uint64_t v25 = &unk_1E57F6B80;
  __int16 v26 = self;
  id v27 = v15;
  id v28 = v16;
  id v29 = v14;
  id v30 = v13;
  SEL v31 = a2;
  id v17 = v13;
  id v18 = v14;
  id v19 = v16;
  id v20 = v15;
  id v21 = a7;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:&v22];
  -[MPSectionedIdentifierList _loadDataSource:forSection:completion:](self, "_loadDataSource:forSection:completion:", v17, v18, v21, v22, v23, v24, v25, v26);
}

void __82__MPSectionedIdentifierList_addDataSource_section_afterItem_inSection_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = a2;
  id v7 = [v3 _itemEntry:v4 sectionIdentifier:v5 withExclusiveAccessToken:v6];
  id v12 = [v7 latestUserClone];

  if (!v12)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 32), @"MPSectionedIdentifierList.m", 528, @"Could not find item entry for identifier: %@", *(void *)(a1 + 40) object file lineNumber description];
  }
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = +[MPSectionedIdentifierListPosition positionForItem:*(void *)(a1 + 40) inSection:*(void *)(a1 + 48)];
  id v10 = [v8 _firstSectionIDBeforePosition:v9 withExclusiveAccessToken:v6];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "insertObject:atIndex:", *(void *)(a1 + 56), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "indexOfObject:", v10) + 1);
  [*(id *)(a1 + 32) _insertDataSource:*(void *)(a1 + 64) forSection:*(void *)(a1 + 56) afterEntry:v12 withExclusiveAccessToken:v6];
}

- (id)_firstSectionIDBeforePosition:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  context = (void *)MEMORY[0x19971DE60]();
  uint64_t v9 = [(MPSectionedIdentifierList *)self enumeratorWithOptions:16777241 startPosition:v7 endPosition:0 withExclusiveAccessToken:v8];
  uint64_t v10 = [v9 nextObjectWithExclusiveAccessToken:v8];
  if (v10)
  {
    id v11 = (void *)v10;
    do
    {
      switch([v11 entryType])
      {
        case 0:
          id v14 = [MEMORY[0x1E4F28B00] currentHandler];
          id v15 = v14;
          SEL v16 = a2;
          id v17 = self;
          uint64_t v18 = 513;
          id v19 = @"Unexpected encounter of Unknown entry";
          goto LABEL_9;
        case 1:
          id v14 = [MEMORY[0x1E4F28B00] currentHandler];
          id v15 = v14;
          SEL v16 = a2;
          id v17 = self;
          uint64_t v18 = 507;
          id v19 = @"Unexpected encounter of Start entry";
          goto LABEL_9;
        case 2:
        case 4:
          id v12 = [v11 trackingEntryResult];
          id v13 = [v12 sectionIdentifier];

          if (v13) {
            goto LABEL_12;
          }
          break;
        case 5:
          id v14 = [MEMORY[0x1E4F28B00] currentHandler];
          id v15 = v14;
          SEL v16 = a2;
          id v17 = self;
          uint64_t v18 = 510;
          id v19 = @"Unexpected encounter of End entry";
LABEL_9:
          [v14 handleFailureInMethod:v16 object:v17 file:@"MPSectionedIdentifierList.m" lineNumber:v18 description:v19];

          break;
        default:
          break;
      }
      uint64_t v20 = [v9 nextObjectWithExclusiveAccessToken:v8];

      id v11 = (void *)v20;
    }
    while (v20);
  }
  id v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2 object:self file:@"MPSectionedIdentifierList.m" lineNumber:520 description:@"Could not find section identifier to update orderedSections"];

  id v11 = 0;
  id v13 = 0;
LABEL_12:

  return v13;
}

- (void)addDataSource:(id)a3 section:(id)a4 afterHeadOfSection:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __81__MPSectionedIdentifierList_addDataSource_section_afterHeadOfSection_completion___block_invoke;
  v18[3] = &unk_1E57F6B58;
  v18[4] = self;
  id v19 = v13;
  id v21 = v11;
  SEL v22 = a2;
  id v20 = v12;
  id v14 = v11;
  id v15 = v12;
  id v16 = v13;
  id v17 = a6;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v18];
  [(MPSectionedIdentifierList *)self _loadDataSource:v14 forSection:v15 completion:v17];
}

void __81__MPSectionedIdentifierList_addDataSource_section_afterHeadOfSection_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _sectionHeadEntryMapWithExclusiveAccessToken:v4];
  id v7 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v7)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"MPSectionedIdentifierList.m", 486, @"Could not find head entry for section identifier: %@", *(void *)(a1 + 40) object file lineNumber description];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "insertObject:atIndex:", *(void *)(a1 + 48), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "indexOfObject:", *(void *)(a1 + 40)) + 1);
  [*(id *)(a1 + 32) _insertDataSource:*(void *)(a1 + 56) forSection:*(void *)(a1 + 48) afterEntry:v7 withExclusiveAccessToken:v4];
}

- (void)addDataSourceAtStart:(id)a3 section:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__MPSectionedIdentifierList_addDataSourceAtStart_section_completion___block_invoke;
  v13[3] = &unk_1E57F6B30;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v10 = v8;
  id v11 = v9;
  id v12 = a5;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v13];
  [(MPSectionedIdentifierList *)self _loadDataSource:v10 forSection:v11 completion:v12];
}

void __69__MPSectionedIdentifierList_addDataSourceAtStart_section_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 56);
  id v5 = a2;
  [v4 insertObject:v3 atIndex:0];
  [*(id *)(a1 + 32) _insertDataSource:*(void *)(a1 + 48) forSection:*(void *)(a1 + 40) afterEntry:0 withExclusiveAccessToken:v5];
}

- (id)enumeratorWithOptions:(unint64_t)a3
{
  return [(MPSectionedIdentifierList *)self enumeratorWithOptions:a3 startPosition:0 endPosition:0];
}

- (int64_t)performWithExclusiveAccessAndReturnInteger:(id)a3
{
  id v4 = (uint64_t (**)(id, void *))a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  if (_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken != -1) {
    dispatch_once(&_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken, &__block_literal_global_43173);
  }
  uint64_t v5 = _MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey;
  if (pthread_getspecific(_MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey))
  {
    id v6 = +[MPPThreadKeyExclusiveAccessToken tokenWithKey:v5 owner:self];
    uint64_t v7 = v4[2](v4, v6);
    v15[3] = v7;
  }
  else
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__MPSectionedIdentifierList_performWithExclusiveAccessAndReturnInteger___block_invoke;
    block[3] = &unk_1E57F6AE0;
    id v13 = &v14;
    block[4] = self;
    id v12 = v4;
    dispatch_sync(accessQueue, block);
    id v6 = v12;
  }

  int64_t v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __72__MPSectionedIdentifierList_performWithExclusiveAccessAndReturnInteger___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  +[MPDispatchQueueExclusiveAccessToken tokenWithQueue:owner:](MPDispatchQueueExclusiveAccessToken, "tokenWithQueue:owner:", *(void *)(a1[4] + 16));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)(a1[6] + 8) + 24) = (*(uint64_t (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (BOOL)performWithExclusiveAccessAndReturnBOOL:(id)a3
{
  id v4 = (uint64_t (**)(id, void *))a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  if (_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken != -1) {
    dispatch_once(&_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken, &__block_literal_global_43173);
  }
  uint64_t v5 = _MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey;
  if (pthread_getspecific(_MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey))
  {
    id v6 = +[MPPThreadKeyExclusiveAccessToken tokenWithKey:v5 owner:self];
    char v7 = v4[2](v4, v6);
    *((unsigned char *)v15 + 24) = v7;
  }
  else
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__MPSectionedIdentifierList_performWithExclusiveAccessAndReturnBOOL___block_invoke;
    block[3] = &unk_1E57F6AE0;
    id v13 = &v14;
    block[4] = self;
    id v12 = v4;
    dispatch_sync(accessQueue, block);
    id v6 = v12;
  }

  char v9 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __69__MPSectionedIdentifierList_performWithExclusiveAccessAndReturnBOOL___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  +[MPDispatchQueueExclusiveAccessToken tokenWithQueue:owner:](MPDispatchQueueExclusiveAccessToken, "tokenWithQueue:owner:", *(void *)(a1[4] + 16));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (*(uint64_t (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (id)_encodeEntry:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__43177;
  id v28 = __Block_byref_object_dispose__43178;
  id v9 = v6;
  id v10 = v9;
  id v11 = 0;
  id v29 = v9;
  while (1)
  {
    id v12 = [v9 encodableNextEntriesWithExclusiveAccessToken:v7];

    if (!v12 || ![v12 count]) {
      break;
    }
    if ([v12 count] == 1)
    {
      uint64_t v13 = [v12 firstObject];
      [v8 addObject:v13];
      id v14 = (id)v25[5];
      v25[5] = v13;
    }
    else
    {
      if ((unint64_t)[v12 count] < 2) {
        goto LABEL_9;
      }
      id v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __67__MPSectionedIdentifierList__encodeEntry_withExclusiveAccessToken___block_invoke;
      v19[3] = &unk_1E57F6A68;
      id v14 = v15;
      uint64_t v23 = &v24;
      id v20 = v14;
      id v21 = self;
      id v22 = v7;
      [v12 enumerateObjectsUsingBlock:v19];
      uint64_t v16 = (void *)[v14 copy];
      [v8 addObject:v16];
    }
LABEL_9:
    id v9 = (id)v25[5];
    id v11 = v12;
  }
  char v17 = (void *)[v8 copy];
  _Block_object_dispose(&v24, 8);

  return v17;
}

void __67__MPSectionedIdentifierList__encodeEntry_withExclusiveAccessToken___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  if (a3)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    [v5 addObject:v11];
    id v6 = [*(id *)(a1 + 40) _encodeEntry:v11 withExclusiveAccessToken:*(void *)(a1 + 48)];
    [v5 addObjectsFromArray:v6];

    id v7 = *(void **)(a1 + 32);
    id v8 = (void *)[v5 copy];
    [v7 addObject:v8];
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v11];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = v11;
    uint64_t v5 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
}

- (void)encodeWithCoder:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  [v6 assertHasExclusiveAccessForOwner:self];
  [v8 encodeObject:self->_identifier forKey:@"id"];
  [v8 encodeInteger:self->_itemCount forKey:@"ic"];
  [v8 encodeBool:self->_automaticallyReversesNonDestructiveDataSourceEdits forKey:@"arne"];
  id v7 = [(MPSectionedIdentifierList *)self _encodeEntry:self withExclusiveAccessToken:v6];

  [v8 encodeObject:v7 forKey:@"el"];
  [v8 encodeObject:self->_orderedSections forKey:@"os"];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__MPSectionedIdentifierList_encodeWithCoder___block_invoke;
  v6[3] = &unk_1E57F6A40;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v6];
}

uint64_t __45__MPSectionedIdentifierList_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) encodeWithCoder:*(void *)(a1 + 40) withExclusiveAccessToken:a2];
}

_MPSectionedIdentifierListCloneIndexEntry *__69__MPSectionedIdentifierList__stitchPreviousEntry_toEntry_cloneIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [MEMORY[0x1E4F779D8] pairWithFirst:a2 second:a3];
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = objc_alloc_init(_MPSectionedIdentifierListCloneIndexEntry);
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

void __43__MPSectionedIdentifierList_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 clonedEntries];
  id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"positionKey" ascending:1];
  v32[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  id v10 = [v7 sortedArrayUsingDescriptors:v9];

  id v11 = (void *)[v10 mutableCopy];
  id v12 = [v6 rootEntry];
  [v12 setClonedEntries:v11];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * v17);
        id v19 = objc_msgSend(v6, "rootEntry", (void)v27);
        [v18 setRootEntry:v19];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v15);
  }

  id v20 = [v6 rootEntry];
  id v21 = [v20 latestDataSourceClone];
  id v22 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v23 = [v5 first];
  uint64_t v24 = [v22 objectForKeyedSubscript:v23];
  uint64_t v25 = [v24 identifiersItemEntryMap];
  uint64_t v26 = [v5 second];
  [v25 setObject:v21 forKeyedSubscript:v26];
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  identifier = self->_identifier;
  id v6 = [(NSMutableArray *)self->_orderedSections msv_compactDescription];
  id v7 = [v3 stringWithFormat:@"<%@: %p id=%@ sections=[%@]>", v4, self, identifier, v6];

  return (NSString *)v7;
}

- (void)dealloc
{
  id v3 = (void *)MEMORY[0x19971DE60](self, a2);
  uint64_t v4 = [(MPSectionedIdentifierList *)self enumeratorWithOptions:16777247];
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    id v6 = (void *)v5;
    do
    {
      if ((unint64_t)([v6 entryType] - 2) <= 2) {
        [v6 prepareForDealloc];
      }
      uint64_t v7 = [v4 nextObject];

      id v6 = (void *)v7;
    }
    while (v7);
  }

  v8.receiver = self;
  v8.super_class = (Class)MPSectionedIdentifierList;
  [(MPSectionedIdentifierList *)&v8 dealloc];
}

+ (void)_performWithoutRequiringExclusivity:(id)a3
{
  uint64_t v3 = _MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken;
  uint64_t v4 = (void (**)(void))a3;
  if (v3 != -1) {
    dispatch_once(&_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken, &__block_literal_global_43173);
  }
  pthread_key_t v5 = _MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey;
  pthread_setspecific(_MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey, (const void *)1);
  v4[2](v4);

  pthread_setspecific(v5, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end