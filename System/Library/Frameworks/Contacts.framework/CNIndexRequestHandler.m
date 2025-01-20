@interface CNIndexRequestHandler
- (BOOL)deleteAllSearchableItems;
- (BOOL)deleteSearchableItemsWithIdentifiers:(id *)a1;
- (BOOL)endIndexBatchWithClientState;
- (BOOL)fetchLastClientState;
- (BOOL)indexSearchableItems:(id *)a1;
- (CNIndexRequestHandler)initWithContactStore:(id)a3;
- (CNIndexRequestHandler)initWithContactStore:(id)a3 searchableIndex:(id)a4 logger:(id)a5 batchSize:(unint64_t)a6;
- (id)_futureForDeleteAllSearchableItems;
- (id)_futureForDeleteSearchableItemsWithIdentifiers:(id *)a1;
- (id)_futureForEndIndexBatchWithClientState:(id *)a1;
- (id)_futureForIndexSearchableItems:(id *)a1;
- (id)fetchChangeHistory;
- (id)fetchChangeHistoryWithError:(uint64_t)a1;
- (id)fetchSearchableItemsIndexedByContactIdentifierWithError:(uint64_t)a1;
- (id)searchableItemsForContactIdentifiers:(id)a1;
- (id)verifyIndexLoggingSummary:(BOOL)a3 error:(id *)a4;
- (uint64_t)_batchIndexUpdatingItems:(void *)a3 deletingItemsWithIdentifiers:(void *)a4 fullSyncOffset:(void *)a5 fullSyncDone:;
- (uint64_t)_performIndexingWithForcedReindexing:(uint64_t)result;
- (uint64_t)batchIndexUpdatingItems:(uint64_t)a3 fullSyncOffset:(uint64_t)a4 fullSyncDone:;
- (uint64_t)batchIndexUpdatingItems:(void *)a3 deletingItemsWithIdentifiers:;
- (uint64_t)beginIndexBatch;
- (uint64_t)deltaSyncContacts:(uint64_t)a1;
- (uint64_t)fullSyncContacts;
- (uint64_t)prepareForFullSync:(uint64_t)a1;
- (void)_futureForFetchLastClientState;
- (void)consumeChangeHistory:(uint64_t)a1;
- (void)fetchAndCheckLastClientState;
- (void)performIndexing;
- (void)registerForChangeHistory;
- (void)reindexAllSearchableItems;
- (void)reindexSearchableItemsWithIdentifiers:(id)a3;
@end

@implementation CNIndexRequestHandler

- (CNIndexRequestHandler)initWithContactStore:(id)a3
{
  v4 = (Class (__cdecl *)())getCSSearchableIndexClass;
  id v5 = a3;
  v6 = (void *)[objc_alloc(v4()) initWithName:@"contacts" protectionClass:*MEMORY[0x1E4F28358] bundleIdentifier:@"com.apple.MobileAddressBook"];
  v7 = +[CNContactsEnvironment currentEnvironment];
  v8 = [v7 loggerProvider];
  v9 = [v8 spotlightIndexingLogger];

  v10 = [(CNIndexRequestHandler *)self initWithContactStore:v5 searchableIndex:v6 logger:v9 batchSize:100];
  return v10;
}

- (CNIndexRequestHandler)initWithContactStore:(id)a3 searchableIndex:(id)a4 logger:(id)a5 batchSize:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CNIndexRequestHandler;
  v14 = [(CNIndexRequestHandler *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_contactStore, a3);
    objc_storeStrong((id *)&v15->_index, a4);
    objc_storeStrong((id *)&v15->_logger, a5);
    v15->_isFullSyncNeeded = 0;
    clientState = v15->_clientState;
    v15->_batchSize = a6;
    v15->_clientState = 0;

    v17 = v15;
  }

  return v15;
}

- (void)performIndexing
{
  if (self) {
    logger = self->_logger;
  }
  else {
    logger = 0;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__CNIndexRequestHandler_performIndexing__block_invoke;
  v3[3] = &unk_1E56B3B58;
  v3[4] = self;
  [(CNSpotlightIndexingLogger *)logger indexingContacts:v3];
}

uint64_t __40__CNIndexRequestHandler_performIndexing__block_invoke(uint64_t a1)
{
  return -[CNIndexRequestHandler _performIndexingWithForcedReindexing:](*(void *)(a1 + 32), 0);
}

- (uint64_t)_performIndexingWithForcedReindexing:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  -[CNIndexRequestHandler registerForChangeHistory](result);
  id v11 = -[CNIndexRequestHandler fetchChangeHistory](v3);
  if (a2)
  {
    *(unsigned char *)(v3 + 8) = 1;
    v4 = objc_alloc_init(CNIndexClientState);
    id v5 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = v4;
  }
  else
  {
    -[CNIndexRequestHandler fetchAndCheckLastClientState](v3);
  }
  if (*(unsigned char *)(v3 + 8) && (-[CNIndexRequestHandler prepareForFullSync:](v3, v11) & 1) == 0)
  {
    [*(id *)(v3 + 32) deferringReindexAsFailedToPrepareForReindexing];
  }
  else
  {
    uint64_t v6 = *(void *)(v3 + 48);
    id v7 = *(id *)(v3 + 32);
    [v7 willStartIndexingWithClientState:v6];

    if (*(unsigned char *)(v3 + 8))
    {
      int v8 = -[CNIndexRequestHandler fullSyncContacts](v3);
LABEL_12:
      if (v8 && v11) {
        -[CNIndexRequestHandler consumeChangeHistory:](v3, v11);
      }
      goto LABEL_16;
    }
    v9 = [v11 contactChanges];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      int v8 = -[CNIndexRequestHandler deltaSyncContacts:](v3, v11);
      goto LABEL_12;
    }
    [*(id *)(v3 + 32) noContactChangesToIndex];
  }
LABEL_16:

  return MEMORY[0x1F41817F8]();
}

- (void)reindexAllSearchableItems
{
  if (self) {
    logger = self->_logger;
  }
  else {
    logger = 0;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__CNIndexRequestHandler_reindexAllSearchableItems__block_invoke;
  v3[3] = &unk_1E56B3B58;
  v3[4] = self;
  [(CNSpotlightIndexingLogger *)logger reindexingAllSearchableItems:v3];
}

uint64_t __50__CNIndexRequestHandler_reindexAllSearchableItems__block_invoke(uint64_t a1)
{
  return -[CNIndexRequestHandler _performIndexingWithForcedReindexing:](*(void *)(a1 + 32), 1);
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3
{
  id v4 = a3;
  if (self) {
    logger = self->_logger;
  }
  else {
    logger = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CNIndexRequestHandler_reindexSearchableItemsWithIdentifiers___block_invoke;
  v7[3] = &unk_1E56B3B80;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [(CNSpotlightIndexingLogger *)logger reindexingSearchableItemsWithIdentifiers:v7];
}

void __63__CNIndexRequestHandler_reindexSearchableItemsWithIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_cn_slicesWithMaximumCount:", 100);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
        uint64_t v8 = *(void *)(a1 + 40);
        if (v8) {
          v9 = *(void **)(v8 + 32);
        }
        else {
          v9 = 0;
        }
        [v9 willReindexItemsWithIdentifiers:*(void *)(*((void *)&v12 + 1) + 8 * v6)];
        uint64_t v10 = -[CNIndexRequestHandler searchableItemsForContactIdentifiers:](*(id *)(a1 + 40), v7);
        if ([v10 count]) {
          -[CNIndexRequestHandler indexSearchableItems:](*(id **)(a1 + 40), v10);
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v11 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v4 = v11;
    }
    while (v11);
  }
}

- (id)searchableItemsForContactIdentifiers:(id)a1
{
  id v2 = a1;
  v25[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = [CNContactFetchRequest alloc];
    uint64_t v5 = +[CNContact descriptorForRequiredKeysForSearchableItem];
    v25[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    id v7 = [(CNContactFetchRequest *)v4 initWithKeysToFetch:v6];

    uint64_t v8 = +[CNContact predicateForContactsWithIdentifiers:v3];
    [(CNContactFetchRequest *)v7 setPredicate:v8];

    [(CNContactFetchRequest *)v7 setUnifyResults:1];
    v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v3];

    uint64_t v11 = (void *)*((void *)v2 + 2);
    id v24 = 0;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    objc_super v19 = __62__CNIndexRequestHandler_searchableItemsForContactIdentifiers___block_invoke;
    v20 = &unk_1E56B3C18;
    id v12 = v9;
    id v21 = v12;
    id v13 = v10;
    id v22 = v13;
    id v23 = v2;
    id v14 = v11;
    [v14 enumerateContactsWithFetchRequest:v7 error:&v24 usingBlock:&v17];
    id v15 = v24;

    if (objc_msgSend(v13, "count", v17, v18, v19, v20)) {
      [*((id *)v2 + 4) failedToFetchSearchableForContactIdentifiers:v13 error:v15];
    }
    id v2 = v12;
  }

  return v2;
}

- (BOOL)indexSearchableItems:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = -[CNIndexRequestHandler _futureForIndexSearchableItems:](a1, v3);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__CNIndexRequestHandler_indexSearchableItems___block_invoke;
    v14[3] = &unk_1E56B3D58;
    v14[4] = a1;
    id v5 = v3;
    id v15 = v5;
    uint64_t v6 = [v4 recover:v14];

    id v13 = 0;
    id v7 = [v6 result:&v13];
    id v8 = v13;
    BOOL v9 = v7 != 0;

    if (!v7)
    {
      id v10 = a1[4];
      uint64_t v11 = [v5 valueForKey:@"uniqueIdentifier"];
      [v10 failedToJournalSearchableItemsForIndexingWithSpotlight:v8 identifiers:v11 willRetry:0];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)registerForChangeHistory
{
  if (a1)
  {
    id v2 = *(void **)(a1 + 16);
    id v6 = 0;
    id v3 = v2;
    char v4 = [v3 registerChangeHistoryClientIdentifier:@"com.apple.contacts.corespotlight" error:&v6];
    id v5 = v6;

    if ((v4 & 1) == 0)
    {
      [*(id *)(a1 + 32) willReindexAsFailedToRegisterForChangeHistory:@"com.apple.contacts.corespotlight" error:v5];
      *(unsigned char *)(a1 + 8) = 1;
    }
  }
}

- (id)fetchChangeHistory
{
  if (a1)
  {
    id v5 = 0;
    id v2 = -[CNIndexRequestHandler fetchChangeHistoryWithError:](a1, (uint64_t)&v5);
    id v3 = v5;
    if (v2)
    {
      if (![v2 changesTruncated])
      {
LABEL_7:

        goto LABEL_8;
      }
      [*(id *)(a1 + 32) willReindexAsChangeHistoryIsTruncated:@"com.apple.contacts.corespotlight"];
    }
    else
    {
      [*(id *)(a1 + 32) willReindexAsFailedToFetchChangeHistory:@"com.apple.contacts.corespotlight" error:v3];
    }
    *(unsigned char *)(a1 + 8) = 1;
    goto LABEL_7;
  }
  id v2 = 0;
LABEL_8:

  return v2;
}

- (void)fetchAndCheckLastClientState
{
  if (a1)
  {
    if (-[CNIndexRequestHandler fetchLastClientState](a1))
    {
      if ([*(id *)(a1 + 48) isFullSyncDone])
      {
        if ([*(id *)(a1 + 48) indexVersion] == 4) {
          return;
        }
        id v2 = *(void **)(a1 + 32);
        id v3 = *(id *)(a1 + 48);
        id v4 = v2;
        objc_msgSend(v4, "willReindexAsIndexVersionChangedFrom:to:", objc_msgSend(v3, "indexVersion"), 4);
      }
      else
      {
        [*(id *)(a1 + 32) willResumeReindexingAsNotFinished];
      }
    }
    else
    {
      [*(id *)(a1 + 32) willReindexAsFailedToFetchClientState];
    }
    *(unsigned char *)(a1 + 8) = 1;
  }
}

- (uint64_t)prepareForFullSync:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    [*(id *)(a1 + 48) setIndexVersion:4];
    [*(id *)(a1 + 48) setIsFullSyncDone:0];
    id v4 = *(id *)(a1 + 48);
    if ([v4 fullSyncOffset] <= 0)
    {
    }
    else
    {
      id v5 = [*(id *)(a1 + 48) fullSyncSnapshotAnchor];
      id v6 = [v3 latestChangeAnchor];
      uint64_t v7 = [v5 compare:v6];

      if (v7)
      {
        id v8 = *(void **)(a1 + 32);
        id v9 = *(id *)(a1 + 48);
        id v10 = v8;
        uint64_t v11 = [v9 fullSyncSnapshotAnchor];
        id v12 = [v3 latestChangeAnchor];
        [v10 willReindexAsSnapshotAnchorChangedFrom:v11 to:v12];

        [*(id *)(a1 + 48) setFullSyncOffset:0];
      }
    }
    id v13 = [v3 latestChangeAnchor];
    [*(id *)(a1 + 48) setFullSyncSnapshotAnchor:v13];

    if ([*(id *)(a1 + 48) fullSyncOffset])
    {
      id v14 = *(void **)(a1 + 32);
      id v15 = *(id *)(a1 + 48);
      id v16 = v14;
      objc_msgSend(v16, "willResumeIndexingAfterOffset:", objc_msgSend(v15, "fullSyncOffset"));
    }
    else if (!-[CNIndexRequestHandler deleteAllSearchableItems]((id *)a1))
    {
      a1 = 0;
      goto LABEL_11;
    }
    a1 = 1;
  }
LABEL_11:

  return a1;
}

- (uint64_t)fullSyncContacts
{
  uint64_t v1 = a1;
  v32[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = [CNContactFetchRequest alloc];
    id v3 = +[CNContact descriptorForRequiredKeysForSearchableItem];
    v32[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    id v5 = [(CNContactFetchRequest *)v2 initWithKeysToFetch:v4];

    [(CNContactFetchRequest *)v5 setUnifyResults:1];
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    uint64_t v27 = 0;
    uint64_t v18 = 0;
    objc_super v19 = &v18;
    uint64_t v20 = 0x3032000000;
    id v21 = __Block_byref_object_copy_;
    id v22 = __Block_byref_object_dispose_;
    id v23 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    id v6 = *(id *)(v1 + 16);
    v12[8] = &v14;
    id v13 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__CNIndexRequestHandler_fullSyncContacts__block_invoke;
    v12[3] = &unk_1E56B3BA8;
    v12[4] = v1;
    v12[5] = &v24;
    v12[6] = &v18;
    v12[7] = &v28;
    int v7 = [v6 enumerateContactsWithFetchRequest:v5 error:&v13 usingBlock:v12];
    id v8 = v13;

    if (v7
      && !*((unsigned char *)v29 + 24)
      && -[CNIndexRequestHandler batchIndexUpdatingItems:fullSyncOffset:fullSyncDone:](v1, (void *)v19[5], v25[3], 1)&& (uint64_t v9 = [(id)v19[5] count], v15[3] += v9, !*((unsigned char *)v29 + 24)))
    {
      id v10 = *(id *)(v1 + 32);
      [v10 finishedIndexingForFullSyncWithCount:v15[3]];
      uint64_t v1 = 1;
    }
    else
    {
      id v10 = *(id *)(v1 + 32);
      [v10 didNotFinishIndexingForFullSyncWithError:v8];
      uint64_t v1 = 0;
    }

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);
  }
  return v1;
}

- (uint64_t)deltaSyncContacts:(uint64_t)a1
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    uint64_t v34 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy_;
    v25 = __Block_byref_object_dispose_;
    id v26 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy_;
    objc_super v19 = __Block_byref_object_dispose_;
    id v20 = [MEMORY[0x1E4F1CA48] array];
    id v4 = +[CNContact descriptorForRequiredKeysForSearchableItem];
    v39[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    id v6 = *(id *)(a1 + 16);
    id v14 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__CNIndexRequestHandler_deltaSyncContacts___block_invoke;
    v13[3] = &unk_1E56B3BD0;
    v13[4] = a1;
    v13[5] = &v21;
    v13[6] = &v15;
    v13[7] = &v35;
    v13[8] = &v31;
    v13[9] = &v27;
    int v7 = [v3 enumerateContactChangesWithKeysToFetch:v5 fromContactStore:v6 error:&v14 usingBlock:v13];
    id v8 = v14;

    if (v7
      && !*((unsigned char *)v36 + 24)
      && -[CNIndexRequestHandler batchIndexUpdatingItems:deletingItemsWithIdentifiers:](a1, (void *)v22[5], (void *)v16[5])&& (v9 = [(id)v22[5] count], v32[3] += v9, uint64_t v10 = objc_msgSend((id)v16[5], "count"), v28[3] += v10, !*((unsigned char *)v36 + 24)))
    {
      id v11 = *(id *)(a1 + 32);
      [v11 finishedIndexingForDeltaSyncWithUpdateCount:v32[3] deleteCount:v28[3]];
      a1 = 1;
    }
    else
    {
      id v11 = *(id *)(a1 + 32);
      [v11 didNotFinishIndexingForDeltaSyncWithError:v8];
      a1 = 0;
    }

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
  }
  return a1;
}

- (void)consumeChangeHistory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(id *)(a1 + 32);
    id v5 = [v3 latestChangeAnchor];
    [v4 willClearChangeHistory:@"com.apple.contacts.corespotlight" toChangeAnchor:v5];

    id v6 = [[CNChangeHistoryClearRequest alloc] initWithClientIdentifier:@"com.apple.contacts.corespotlight"];
    int v7 = [v3 latestChangeAnchor];
    [(CNChangeHistoryClearRequest *)v6 setToChangeAnchor:v7];

    id v8 = *(void **)(a1 + 16);
    id v14 = 0;
    id v9 = v8;
    char v10 = [v9 executeChangeHistoryClearRequest:v6 error:&v14];
    id v11 = v14;

    if ((v10 & 1) == 0)
    {
      id v12 = *(id *)(a1 + 32);
      id v13 = [v3 latestChangeAnchor];
      [v12 failedToClearChangeHistory:@"com.apple.contacts.corespotlight" toChangeAnchor:v13 error:v11];
    }
  }
}

- (id)fetchChangeHistoryWithError:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [[CNChangeHistoryFetchRequest alloc] initWithClientIdentifier:@"com.apple.contacts.corespotlight"];
    [(CNChangeHistoryFetchRequest *)v4 setShouldUnifyResults:1];
    id v5 = [*(id *)(a1 + 16) changeHistoryWithFetchRequest:v4 error:a2];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)fetchLastClientState
{
  if (!a1) {
    return 0;
  }
  id v2 = -[CNIndexRequestHandler _futureForFetchLastClientState]((void *)a1);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__CNIndexRequestHandler_fetchLastClientState__block_invoke;
  v15[3] = &unk_1E56B3D30;
  v15[4] = a1;
  id v3 = [v2 recover:v15];

  uint64_t v4 = *MEMORY[0x1E4F5A2B0];
  id v14 = 0;
  id v5 = [v3 result:&v14];
  id v6 = v14;
  int v7 = (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  BOOL v8 = v7 != 0;
  if (v7)
  {
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = +[CNIndexClientState clientStateWithData:v7 logger:v9];
    id v11 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v10;
  }
  else
  {
    [*(id *)(a1 + 32) failedToFetchClientStateFromSpotlight:v6 willRetry:0];
    id v12 = objc_alloc_init(CNIndexClientState);
    id v9 = *(id *)(a1 + 48);
    *(void *)(a1 + 48) = v12;
  }

  return v8;
}

- (BOOL)deleteAllSearchableItems
{
  if (!a1) {
    return 0;
  }
  id v2 = -[CNIndexRequestHandler _futureForDeleteAllSearchableItems](a1);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__CNIndexRequestHandler_deleteAllSearchableItems__block_invoke;
  v9[3] = &unk_1E56B3D30;
  v9[4] = a1;
  id v3 = [v2 recover:v9];

  id v8 = 0;
  uint64_t v4 = [v3 result:&v8];
  id v5 = v8;
  BOOL v6 = v4 != 0;

  if (!v4) {
    [a1[4] failedToDeleteAllSearchableItemsWithSpotlight:v5 willRetry:0];
  }

  return v6;
}

void __41__CNIndexRequestHandler_fullSyncContacts__block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v15 = a2;
  uint64_t v5 = a1[4];
  if (v5) {
    int v7 = *(void **)(v5 + 48);
  }
  else {
    int v7 = 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a1[5] + 8) + 24);
  if (v6 < [v7 fullSyncOffset]) {
    goto LABEL_15;
  }
  id v8 = [v15 searchableItemForIndexing];
  if (!v8)
  {
    id v12 = (void *)a1[4];
    if (v12) {
      id v12 = (void *)v12[4];
    }
    id v13 = v12;
    id v14 = [v15 identifier];
    [v13 failedToCreateSearchableItemForContactIdentifier:v14];

    goto LABEL_14;
  }
  uint64_t v9 = [*(id *)(*(void *)(a1[6] + 8) + 40) count];
  uint64_t v10 = a1[4];
  if (v10) {
    uint64_t v11 = *(void *)(v10 + 40);
  }
  else {
    uint64_t v11 = 0;
  }
  if (v9 != v11)
  {
LABEL_10:
    [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v8];
LABEL_14:

LABEL_15:
    ++*(void *)(*(void *)(a1[5] + 8) + 24);
    goto LABEL_16;
  }
  if (-[CNIndexRequestHandler batchIndexUpdatingItems:fullSyncOffset:fullSyncDone:](v10, *(void **)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[5] + 8) + 24), 0))
  {
    *(void *)(*(void *)(a1[8] + 8) + 24) += [*(id *)(*(void *)(a1[6] + 8) + 40) count];
    [*(id *)(*(void *)(a1[6] + 8) + 40) removeAllObjects];
    goto LABEL_10;
  }
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  *a3 = 1;

LABEL_16:
}

- (uint64_t)batchIndexUpdatingItems:(uint64_t)a3 fullSyncOffset:(uint64_t)a4 fullSyncDone:
{
  if (result)
  {
    uint64_t v7 = result;
    id v8 = *(id *)(result + 32);
    id v9 = a2;
    objc_msgSend(v8, "willBatchIndexForFullSyncWithCount:lastOffset:doneFullSync:", objc_msgSend(v9, "count"), a3, a4);

    uint64_t v10 = [NSNumber numberWithInteger:a3];
    uint64_t v11 = [NSNumber numberWithBool:a4];
    uint64_t v12 = -[CNIndexRequestHandler _batchIndexUpdatingItems:deletingItemsWithIdentifiers:fullSyncOffset:fullSyncDone:](v7, v9, 0, v10, v11);

    return v12;
  }
  return result;
}

void __43__CNIndexRequestHandler_deltaSyncContacts___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v19 = a2;
  unint64_t v5 = [v19 changeType];
  if (v5 <= 5)
  {
    if (((1 << v5) & 0x1B) != 0)
    {
      uint64_t v6 = [v19 contact];

      if (!v6)
      {
        uint64_t v15 = a1[4];
        if (v15) {
          uint64_t v16 = *(void **)(v15 + 32);
        }
        else {
          uint64_t v16 = 0;
        }
        [v16 failedToFetchContactForChange:v19];
        goto LABEL_22;
      }
      uint64_t v7 = [v19 contact];
      id v8 = [v7 searchableItemForIndexing];

      if (!v8)
      {
        uint64_t v17 = (void *)a1[4];
        if (v17) {
          uint64_t v17 = (void *)v17[4];
        }
        uint64_t v18 = v17;
        id v8 = [v19 contact];
        id v9 = [v8 identifier];
        [v18 failedToCreateSearchableItemForContactIdentifier:v9];

        goto LABEL_21;
      }
      id v9 = 0;
    }
    else
    {
      uint64_t v10 = [v19 contactIdentifier];
      if (!v10) {
        goto LABEL_22;
      }
      id v9 = (void *)v10;
      id v8 = 0;
    }
    uint64_t v11 = [*(id *)(*(void *)(a1[5] + 8) + 40) count];
    uint64_t v12 = [*(id *)(*(void *)(a1[6] + 8) + 40) count] + v11;
    uint64_t v13 = a1[4];
    if (v13) {
      uint64_t v14 = *(void *)(v13 + 40);
    }
    else {
      uint64_t v14 = 0;
    }
    if (v12 == v14)
    {
      if ((-[CNIndexRequestHandler batchIndexUpdatingItems:deletingItemsWithIdentifiers:](v13, *(void **)(*(void *)(a1[5] + 8) + 40), *(void **)(*(void *)(a1[6] + 8) + 40)) & 1) == 0)
      {
        *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
        *a3 = 1;
        goto LABEL_21;
      }
      *(void *)(*(void *)(a1[8] + 8) + 24) += [*(id *)(*(void *)(a1[5] + 8) + 40) count];
      *(void *)(*(void *)(a1[9] + 8) + 24) += [*(id *)(*(void *)(a1[6] + 8) + 40) count];
      [*(id *)(*(void *)(a1[5] + 8) + 40) removeAllObjects];
      [*(id *)(*(void *)(a1[6] + 8) + 40) removeAllObjects];
    }
    objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "_cn_addNonNilObject:", v8);
    objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "_cn_addNonNilObject:", v9);
LABEL_21:
  }
LABEL_22:
}

- (uint64_t)batchIndexUpdatingItems:(void *)a3 deletingItemsWithIdentifiers:
{
  if (result)
  {
    uint64_t v5 = result;
    id v6 = *(id *)(result + 32);
    id v7 = a3;
    id v8 = a2;
    objc_msgSend(v6, "willBatchIndexForDeltaSyncWithUpdateCount:deleteCount:", objc_msgSend(v8, "count"), objc_msgSend(v7, "count"));

    uint64_t v9 = -[CNIndexRequestHandler _batchIndexUpdatingItems:deletingItemsWithIdentifiers:fullSyncOffset:fullSyncDone:](v5, v8, v7, 0, 0);
    return v9;
  }
  return result;
}

- (uint64_t)_batchIndexUpdatingItems:(void *)a3 deletingItemsWithIdentifiers:(void *)a4 fullSyncOffset:(void *)a5 fullSyncDone:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    if (-[CNIndexRequestHandler beginIndexBatch](a1))
    {
      if ([v9 count] && !-[CNIndexRequestHandler indexSearchableItems:]((id *)a1, v9)
        || [v10 count] && !-[CNIndexRequestHandler deleteSearchableItemsWithIdentifiers:]((id *)a1, v10))
      {
        -[CNIndexRequestHandler endIndexBatchWithClientState]((id *)a1);
      }
      else
      {
        if (v11) {
          objc_msgSend(*(id *)(a1 + 48), "setFullSyncOffset:", objc_msgSend(v11, "integerValue"));
        }
        if (v12 && [v12 BOOLValue])
        {
          *(unsigned char *)(a1 + 8) = 0;
          [*(id *)(a1 + 48) setIsFullSyncDone:1];
        }
        if (-[CNIndexRequestHandler endIndexBatchWithClientState]((id *)a1))
        {
          uint64_t v13 = objc_msgSend(v9, "_cn_map:", &__block_literal_global);
          [*(id *)(a1 + 32) finishedBatchIndexWithUpdateIdentifiers:v13 deleteIdentifiers:v10];

          a1 = 1;
          goto LABEL_16;
        }
      }
    }
    a1 = 0;
  }
LABEL_16:

  return a1;
}

- (uint64_t)beginIndexBatch
{
  if (result)
  {
    id v1 = *(id *)(result + 24);
    [v1 beginIndexBatch];

    return 1;
  }
  return result;
}

- (BOOL)deleteSearchableItemsWithIdentifiers:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = -[CNIndexRequestHandler _futureForDeleteSearchableItemsWithIdentifiers:](a1, v3);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__CNIndexRequestHandler_deleteSearchableItemsWithIdentifiers___block_invoke;
    v12[3] = &unk_1E56B3D58;
    v12[4] = a1;
    id v5 = v3;
    id v13 = v5;
    id v6 = [v4 recover:v12];

    id v11 = 0;
    id v7 = [v6 result:&v11];
    id v8 = v11;
    BOOL v9 = v7 != 0;

    if (!v7) {
      [a1[4] failedToJournalItemIdentifiersForDeletionWithSpotlight:v8 identifiers:v5 willRetry:0];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)endIndexBatchWithClientState
{
  if (!a1) {
    return 0;
  }
  id v2 = a1[6];
  id v3 = [v2 data];

  uint64_t v4 = -[CNIndexRequestHandler _futureForEndIndexBatchWithClientState:](a1, v3);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__CNIndexRequestHandler_endIndexBatchWithClientState__block_invoke;
  v12[3] = &unk_1E56B3D58;
  v12[4] = a1;
  id v5 = v3;
  id v13 = v5;
  id v6 = [v4 recover:v12];

  id v11 = 0;
  id v7 = [v6 result:&v11];
  id v8 = v11;
  BOOL v9 = v7 != 0;

  if (!v7) {
    [a1[4] failedToEndIndexBatchWithSpotlight:v8 willRetry:0];
  }

  return v9;
}

uint64_t __107__CNIndexRequestHandler__batchIndexUpdatingItems_deletingItemsWithIdentifiers_fullSyncOffset_fullSyncDone___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

void __62__CNIndexRequestHandler_searchableItemsForContactIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 searchableItemForIndexing];
  if (v3)
  {
    [*(id *)(a1 + 32) addObject:v3];
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = [v8 identifier];
    [v4 removeObject:v5];
  }
  else
  {
    id v6 = *(void **)(a1 + 48);
    if (v6) {
      id v6 = (void *)v6[4];
    }
    id v7 = v6;
    id v5 = [v8 identifier];
    [v7 failedToCreateSearchableItemForContactIdentifier:v5];
  }
}

- (id)fetchSearchableItemsIndexedByContactIdentifierWithError:(uint64_t)a1
{
  v14[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = *MEMORY[0x1E4F28358];
    uint64_t v4 = getMDItemUniqueIdentifier();
    v14[0] = v4;
    id v5 = getMDItemIndexOID();
    v14[1] = v5;
    id v6 = getMDItemDisplayName();
    v14[2] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
    id v8 = +[CNCoreSpotlightSearch executeQuery:@"kMDItemRole ==\"*\" protectionClass:v3 bundleID:@"com.apple.MobileAddressBook"" fetchAttributes:v7 error:a2];

    BOOL v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __81__CNIndexRequestHandler_fetchSearchableItemsIndexedByContactIdentifierWithError___block_invoke;
    v12[3] = &unk_1E56B3C40;
    id v10 = v9;
    id v13 = v10;
    objc_msgSend(v8, "_cn_each:", v12);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __81__CNIndexRequestHandler_fetchSearchableItemsIndexedByContactIdentifierWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 attributeSet];
  id v5 = getMDItemUniqueIdentifier();
  id v6 = [v4 attributeForKey:v5];

  [*(id *)(a1 + 32) setValue:v3 forKey:v6];
}

- (id)verifyIndexLoggingSummary:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  if (self) {
    logger = self->_logger;
  }
  else {
    logger = 0;
  }
  id v8 = logger;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke;
  v14[3] = &unk_1E56B3CE0;
  void v14[4] = self;
  void v14[5] = &v16;
  v14[6] = &v22;
  BOOL v15 = !v5;
  [(CNSpotlightIndexingLogger *)v8 verifyingIndex:v14];

  if (v5)
  {
    if (self) {
      BOOL v9 = self->_logger;
    }
    else {
      BOOL v9 = 0;
    }
    id v10 = v9;
    [(CNSpotlightIndexingLogger *)v10 verifiedIndexWithSummmary:v23[5]];
  }
  if (a4)
  {
    id v11 = (void *)v17[5];
    if (v11) {
      *a4 = (id)[v11 copy];
    }
  }
  id v12 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);

  return v12;
}

void __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v55[0] = *(id *)(v3 + 40);
  uint64_t v4 = -[CNIndexRequestHandler fetchSearchableItemsIndexedByContactIdentifierWithError:](v2, (uint64_t)v55);
  objc_storeStrong((id *)(v3 + 40), v55[0]);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendFormat:@"Verification skipped, spotlight error: %@", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  else
  {
    BOOL v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:@"identifier"];
    if (*(unsigned char *)(a1 + 56))
    {
      id v6 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
      [v5 addObject:v6];
    }
    id v7 = [[CNContactFetchRequest alloc] initWithKeysToFetch:v5];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      id v11 = *(void **)(v10 + 16);
    }
    else {
      id v11 = 0;
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v54 = *(id *)(v12 + 40);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_2;
    v50[3] = &unk_1E56B3C18;
    id v13 = v4;
    id v51 = v13;
    id v14 = v8;
    id v52 = v14;
    id v15 = v9;
    id v53 = v15;
    id v16 = v11;
    char v17 = [v16 enumerateContactsWithFetchRequest:v7 error:&v54 usingBlock:v50];
    objc_storeStrong((id *)(v12 + 40), v54);

    if (v17)
    {
      uint64_t v18 = *(void *)(a1 + 32);
      id v49 = 0;
      id v19 = -[CNIndexRequestHandler fetchChangeHistoryWithError:](v18, (uint64_t)&v49);
      id v35 = v49;
      id v20 = [v19 contactChanges];
      uint64_t v21 = [v20 count];

      if (v21)
      {
        uint64_t v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        uint64_t v23 = [v19 contactChanges];
        [v22 appendFormat:@"Verification skipped, have pending change history to index, total = %ld.\n", objc_msgSend(v23, "count")];
      }
      else if ([v15 count])
      {
        uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
        id v48 = *(id *)(v24 + 40);
        CNSetError(&v48, 1004, 0);
        objc_storeStrong((id *)(v24 + 40), v48);
        v25 = objc_alloc_init(CNContactFormatter);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_3;
        aBlock[3] = &unk_1E56B3C68;
        id v26 = v25;
        v47 = v26;
        id v27 = _Block_copy(aBlock);
        uint64_t v34 = v26;
        if (-[CNIndexRequestHandler fetchLastClientState](*(void *)(a1 + 32)))
        {
          data = *(__CFString **)(a1 + 32);
          if (data) {
            data = (__CFString *)data[1].data;
          }
        }
        else
        {
          data = @"<no state>";
        }
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendFormat:@"Client index state:\n%@\n", data];
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "appendFormat:", @"%ld not indexed:\n", objc_msgSend(v15, "count"));
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_4;
        v42[3] = &unk_1E56B3C90;
        id v29 = v27;
        uint64_t v30 = *(void *)(a1 + 48);
        id v43 = v29;
        uint64_t v44 = v30;
        char v45 = *(unsigned char *)(a1 + 56);
        objc_msgSend(v15, "_cn_each:", v42);
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "appendFormat:", @"%ld indexed:\n", objc_msgSend(v14, "count"));
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_5;
        v38[3] = &unk_1E56B3C90;
        uint64_t v31 = *(void *)(a1 + 48);
        id v39 = v29;
        uint64_t v40 = v31;
        char v41 = *(unsigned char *)(a1 + 56);
        id v32 = v29;
        objc_msgSend(v14, "_cn_each:", v38);
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "appendFormat:", @"%ld unknown in index:\n", objc_msgSend(v13, "count"));
        uint64_t v33 = [v13 allValues];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_6;
        v36[3] = &unk_1E56B3CB8;
        char v37 = *(unsigned char *)(a1 + 56);
        v36[4] = *(void *)(a1 + 48);
        objc_msgSend(v33, "_cn_each:", v36);
      }
      else
      {
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendFormat:@"All contacts indexed, total = %ld\n", objc_msgSend(v14, "count")];
      }
    }
    else
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendFormat:@"Verification skipped, contacts error: %@", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    }
  }
}

void __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v9 = v3;
  BOOL v5 = [v3 identifier];
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    [*(id *)(a1 + 40) addObject:v9];
    id v7 = *(void **)(a1 + 32);
    id v8 = [v9 identifier];
    [v7 removeObjectForKey:v8];
  }
  else
  {
    [*(id *)(a1 + 48) addObject:v9];
  }
}

void __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_3(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a3;
  id v8 = a2;
  id v10 = [v7 identifier];
  if (a4)
  {
    uint64_t v9 = [*(id *)(a1 + 32) stringFromContact:v7];

    [v8 appendFormat:@"<CNContact: identifier=%@, fullName=%@>\n", v10, v9];
    id v8 = (id)v9;
  }
  else
  {

    [v8 appendFormat:@"<CNContact: identifier=%@>\n", v10];
  }
}

uint64_t __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2, *(unsigned __int8 *)(a1 + 48));
}

uint64_t __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2, *(unsigned __int8 *)(a1 + 48));
}

void __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_6(uint64_t a1, void *a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = a2;
  id v13 = [v4 attributeSet];
  BOOL v5 = getMDItemUniqueIdentifier();
  id v6 = [v13 attributeForKey:v5];
  id v7 = [v4 attributeSet];
  if (v2)
  {
    id v8 = getMDItemIndexOID();
    uint64_t v9 = [v7 attributeForKey:v8];
    id v10 = [v4 attributeSet];

    id v11 = getMDItemDisplayName();
    uint64_t v12 = [v10 attributeForKey:v11];
    [v3 appendFormat:@"<CSSearchableItem: identifier=%@, oid=%@, displayName=%@>\n", v6, v9, v12];
  }
  else
  {

    id v8 = getMDItemIndexOID();
    uint64_t v9 = [v7 attributeForKey:v8];
    [v3 appendFormat:@"<CSSearchableItem: identifier=%@, oid=%@>\n", v6, v9];
  }
}

- (void)_futureForFetchLastClientState
{
  id v1 = a1;
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
    id v3 = (void *)v1[3];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__CNIndexRequestHandler__futureForFetchLastClientState__block_invoke;
    v6[3] = &unk_1E56B3D08;
    id v7 = v2;
    id v4 = v2;
    [v3 fetchLastClientStateWithCompletionHandler:v6];
    id v1 = [v4 future];
  }

  return v1;
}

void __55__CNIndexRequestHandler__futureForFetchLastClientState__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "finishWithError:");
  }
  else
  {
    (*(void (**)(void))(*MEMORY[0x1E4F5A2A8] + 16))();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v3 finishWithResult:v5];
  }
}

void *__45__CNIndexRequestHandler_fetchLastClientState__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    id v4 = *(void **)(v3 + 32);
  }
  else {
    id v4 = 0;
  }
  [v4 failedToFetchClientStateFromSpotlight:a2 willRetry:1];
  id v5 = *(void **)(a1 + 32);

  return -[CNIndexRequestHandler _futureForFetchLastClientState](v5);
}

- (id)_futureForEndIndexBatchWithClientState:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
    id v5 = a1[3];
    id v6 = [v4 errorOnlyCompletionHandlerAdapter];
    [v5 endIndexBatchWithClientState:v3 completionHandler:v6];

    a1 = [v4 future];
  }

  return a1;
}

id *__53__CNIndexRequestHandler_endIndexBatchWithClientState__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    id v4 = *(void **)(v3 + 32);
  }
  else {
    id v4 = 0;
  }
  [v4 failedToEndIndexBatchWithSpotlight:a2 willRetry:1];
  id v5 = *(id **)(a1 + 32);
  id v6 = *(void **)(a1 + 40);

  return -[CNIndexRequestHandler _futureForEndIndexBatchWithClientState:](v5, v6);
}

- (id)_futureForIndexSearchableItems:(id *)a1
{
  id v2 = a1;
  if (a1)
  {
    uint64_t v3 = (objc_class *)MEMORY[0x1E4F5A4B8];
    id v4 = a2;
    id v5 = objc_alloc_init(v3);
    id v6 = v2[3];
    id v7 = [v5 errorOnlyCompletionHandlerAdapter];
    [v6 indexSearchableItems:v4 completionHandler:v7];

    id v2 = [v5 future];
  }

  return v2;
}

id *__46__CNIndexRequestHandler_indexSearchableItems___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v4 = (void *)v4[4];
  }
  id v5 = *(void **)(a1 + 40);
  id v6 = v4;
  id v7 = a2;
  id v8 = [v5 valueForKey:@"uniqueIdentifier"];
  [v6 failedToJournalSearchableItemsForIndexingWithSpotlight:v7 identifiers:v8 willRetry:1];

  uint64_t v9 = *(id **)(a1 + 32);
  id v10 = *(void **)(a1 + 40);

  return -[CNIndexRequestHandler _futureForIndexSearchableItems:](v9, v10);
}

- (id)_futureForDeleteSearchableItemsWithIdentifiers:(id *)a1
{
  id v2 = a1;
  if (a1)
  {
    uint64_t v3 = (objc_class *)MEMORY[0x1E4F5A4B8];
    id v4 = a2;
    id v5 = objc_alloc_init(v3);
    id v6 = v2[3];
    id v7 = [v5 errorOnlyCompletionHandlerAdapter];
    [v6 deleteSearchableItemsWithIdentifiers:v4 completionHandler:v7];

    id v2 = [v5 future];
  }

  return v2;
}

id *__62__CNIndexRequestHandler_deleteSearchableItemsWithIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    id v4 = *(void **)(v3 + 32);
  }
  else {
    id v4 = 0;
  }
  [v4 failedToJournalItemIdentifiersForDeletionWithSpotlight:a2 identifiers:*(void *)(a1 + 40) willRetry:1];
  id v5 = *(id **)(a1 + 32);
  id v6 = *(void **)(a1 + 40);

  return -[CNIndexRequestHandler _futureForDeleteSearchableItemsWithIdentifiers:](v5, v6);
}

- (id)_futureForDeleteAllSearchableItems
{
  id v1 = a1;
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
    id v3 = v1[3];
    id v4 = [v2 errorOnlyCompletionHandlerAdapter];
    [v3 deleteAllSearchableItemsWithCompletionHandler:v4];

    id v1 = [v2 future];
  }

  return v1;
}

id *__49__CNIndexRequestHandler_deleteAllSearchableItems__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    id v4 = *(void **)(v3 + 32);
  }
  else {
    id v4 = 0;
  }
  [v4 failedToDeleteAllSearchableItemsWithSpotlight:a2 willRetry:1];
  id v5 = *(id **)(a1 + 32);

  return -[CNIndexRequestHandler _futureForDeleteAllSearchableItems](v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientState, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_index, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end