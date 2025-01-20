@interface EDSearchableIndexPersistence
+ (NSString)searchableMessagesTableName;
+ (OS_os_log)log;
+ (OS_os_log)signpostLog;
+ (id)searchableAttachmentsTableSchema;
+ (id)searchableDataDetectionResultsTableSchema;
+ (id)searchableMessageTombstonesTableSchema;
+ (id)searchableMessagesTableSchema;
+ (id)searchableRebuildTableSchema;
+ (id)searchableRichLinksTableSchema;
+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4;
- (BOOL)_canPerformIncrementalIndexForIdentifier:(id)a3 indexingType:(int64_t)a4;
- (EDMessagePersistence)messagePersistence;
- (EDPersistedAttachmentID)lastProcessedAttachmentID;
- (EDPersistenceDatabase)database;
- (EDRichLinkPersistence)richLinkPersistence;
- (EDSearchableIndexHookResponder)hookResponder;
- (EDSearchableIndexPersistence)initWithDatabase:(id)a3 messagePersistence:(id)a4 richLinkPersistence:(id)a5 hookResponder:(id)a6;
- (NSDictionary)statistics;
- (NSString)additionalFilterClause;
- (id)_assignIndexedItems:(id)a3 connection:(id)a4 query:(id)a5 indexedBindingsGenerator:(id)a6;
- (id)_assignIndexedItems:(id)a3 transaction:(int64_t)a4 connection:(id)a5;
- (id)_attachmentItemsFromAttachmentData:(id)a3 limit:(unint64_t)a4 cancelationToken:(id)a5;
- (id)_messagesRequiringIndexingForType:(int64_t)a3 excludingIdentifiers:(id)a4 limit:(int64_t)a5;
- (id)_richLinkItemsFromRichLinkData:(id)a3 limit:(unint64_t)a4 cancelationToken:(id)a5;
- (id)_searchableIndexMessageIndexingTypes;
- (id)allMailboxIdentifiersForMessage:(id)a3;
- (id)childIdentifiersToRemoveFromSearchableIndex:(id)a3 whenRemovingParentIdentifiers:(id)a4;
- (id)distinctTransactionIDsForSearchableIndex:(id)a3;
- (id)domainsToRemoveForSearchableIndex:(id)a3;
- (id)itemsToIndexForSearchableIndex:(id)a3 excludingIdentifiers:(id)a4 count:(unint64_t)a5 cancelationToken:(id)a6;
- (id)itemsToRemoveForSearchableIndex:(id)a3;
- (id)messagesWhere:(id)a3 useSearchableRebuildTable:(BOOL)a4 limit:(int64_t)a5;
- (id)searchableIndex:(id)a3 assignTransaction:(int64_t)a4 updates:(id)a5;
- (id)searchableIndex:(id)a3 attachmentItemsForMessageWithIdentifier:(id)a4;
- (id)searchableIndex:(id)a3 invalidateItemsInTransactions:(id)a4;
- (id)searchableIndexItemsFromMessages:(id)a3 type:(int64_t)a4;
- (id)selectMessageIDsFromBacklogWithBatchSize:(unint64_t)a3;
- (id)urlForMessageID:(id)a3;
- (id)verificationDataSamplesForSearchableIndex:(id)a3 count:(unint64_t)a4 lastVerifiedMessageID:(int64_t)a5;
- (id)verificationDataSamplesFromMessageIDTransactionIDDictionary:(id)a3;
- (int64_t)indexingTypeForSearchableIndex:(id)a3 item:(id)a4;
- (unint64_t)rebuildIndexState;
- (unint64_t)signpostID;
- (void)_addSearchableDataDetectionResults:(id)a3 withMessage:(id)a4 transaction:(int64_t)a5;
- (void)_assignIndexedDataDetectionItems:(id)a3 transaction:(int64_t)a4 connection:(id)a5;
- (void)_enumerateSearchableIndexMessageIndexingTypesUsingBlock:(id)a3;
- (void)attachmentItemMetadataForAttachmentID:(id)a3 attachmentPersistentID:(id)a4 messagePersistentID:(id)a5 name:(id)a6 mailboxID:(int64_t)a7 result:(id)a8;
- (void)clearOrphanedSearchableMessagesFromDatabase;
- (void)searchableIndex:(id)a3 assignIndexingType:(int64_t)a4 forIdentifiers:(id)a5;
- (void)searchableIndex:(id)a3 indexGeneratedSummaries:(id)a4;
- (void)searchableIndex:(id)a3 invalidateItemsGreaterThanTransaction:(int64_t)a4;
- (void)searchableIndex:(id)a3 prepareToIndexAttachmentsForMessageWithIdentifier:(id)a4;
- (void)searchableIndex:(id)a3 willRemoveIdentifiers:(id)a4 type:(int64_t)a5;
- (void)searchableRichLinkItemMetadataForRichLinkID:(id)a3 messagePersistentID:(id)a4 mailboxID:(int64_t)a5 title:(id)a6 url:(id)a7 result:(id)a8;
- (void)setLastProcessedAttachmentID:(id)a3;
- (void)setRebuildIndexState:(unint64_t)a3;
- (void)startReindexingWithConnection:(id)a3;
- (void)transitionBacklogBatchToCXWithBatchSize:(unint64_t)a3 protectionHandler:(id)a4;
@end

@implementation EDSearchableIndexPersistence

- (id)_assignIndexedItems:(id)a3 connection:(id)a4 query:(id)a5 indexedBindingsGenerator:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v30 = a4;
  id v28 = a5;
  v34 = (void (**)(id, void *, void *))a6;
  v27 = v9;
  if ([v9 count])
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v10 = [v30 preparedStatementForQueryString:v28];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v9;
    uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (!v11) {
      goto LABEL_15;
    }
    uint64_t v33 = *(void *)v37;
    uint64_t v31 = *MEMORY[0x1E4F60D10];
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v33) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v14 = NSNumber;
        v15 = [v13 messageID];
        v16 = objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v15, "databaseID"));

        v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "hasBodyData"));
        v18 = v34[2](v34, v16, v17);
        id v35 = 0;
        char v19 = [v10 executeWithIndexedBindings:v18 usingBlock:0 error:&v35];
        id v20 = v35;
        v21 = v20;
        if ((v19 & 1) == 0)
        {
          v22 = [v20 domain];
          if ([v22 isEqualToString:v31])
          {
            BOOL v23 = [v21 code] == 19;

            if (v23)
            {
              v24 = [v13 messageID];
              v25 = [v24 stringValue];
              [v29 addObject:v25];

              goto LABEL_13;
            }
          }
          else
          {
          }
          [v30 handleError:v21 message:@"Adding to searchable_messages index"];
        }
LABEL_13:
        [v10 clearBindingsWithError:0];
        [v10 resetWithError:0];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (!v11)
      {
LABEL_15:

        goto LABEL_17;
      }
    }
  }
  id v29 = (id)MEMORY[0x1E4F1CBF0];
LABEL_17:

  return v29;
}

id __75__EDSearchableIndexPersistence__assignIndexedItems_transaction_connection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) addObject:v5];
  v9[0] = v5;
  v9[1] = v5;
  v9[2] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];

  return v7;
}

- (id)_assignIndexedItems:(id)a3 transaction:(int64_t)a4 connection:(id)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v61 = a5;
  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v60 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v7 = [v6 messages];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v55 = (void *)[[NSString alloc] initWithFormat:@"INSERT OR REPLACE INTO searchable_messages (message_id, message, transaction_id, reindex_type, message_body_indexed) VALUES (?, ?, %lld, %ld, ?)", a4, 0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__EDSearchableIndexPersistence__assignIndexedItems_transaction_connection___block_invoke;
    aBlock[3] = &unk_1E6C05B60;
    id v70 = v60;
    v56 = _Block_copy(aBlock);
    id v9 = [v6 messages];
    v10 = [(EDSearchableIndexPersistence *)self _assignIndexedItems:v9 connection:v61 query:v55 indexedBindingsGenerator:v56];

    [v59 addObjectsFromArray:v10];
    if ([(EDSearchableIndexPersistence *)self rebuildIndexState] == 1)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      v12 = [v6 messages];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v65 objects:v73 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v66 != v14) {
              objc_enumerationMutation(v12);
            }
            v16 = NSNumber;
            v17 = [*(id *)(*((void *)&v65 + 1) + 8 * i) messageID];
            v18 = objc_msgSend(v16, "numberWithLongLong:", objc_msgSend(v17, "databaseID"));

            [v11 addObject:v18];
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v65 objects:v73 count:16];
        }
        while (v13);
      }

      char v19 = [MEMORY[0x1E4F60E78] column:@"message_id"];
      id v20 = [v19 in:v11];

      v21 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"searchable_rebuild" where:v20];
      id v64 = 0;
      char v22 = [v61 executeDeleteStatement:v21 error:&v64];
      id v23 = v64;
      if ((v22 & 1) == 0) {
        [v61 handleError:v23 message:@"Deleting from searchable_rebuild table"];
      }
    }
  }
  v24 = [v6 updatedMessages];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    v26 = (void *)[[NSString alloc] initWithFormat:@"INSERT OR REPLACE INTO searchable_messages (message_id, message, transaction_id, reindex_type, message_body_indexed) VALUES (?, ?, %lld, %ld, COALESCE((SELECT message_body_indexed FROM searchable_messages WHERE message_id = ?), ?))", a4, 0];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __75__EDSearchableIndexPersistence__assignIndexedItems_transaction_connection___block_invoke_2;
    v62[3] = &unk_1E6C05B60;
    id v63 = v60;
    v27 = _Block_copy(v62);
    id v28 = [v6 updatedMessages];
    id v29 = [(EDSearchableIndexPersistence *)self _assignIndexedItems:v28 connection:v61 query:v26 indexedBindingsGenerator:v27];

    [v59 addObjectsFromArray:v29];
  }
  if ([v60 count])
  {
    id v30 = objc_alloc(MEMORY[0x1E4F60F10]);
    uint64_t v31 = +[EDMessagePersistence messagesTableName];
    v32 = (void *)[v30 initWithTable:v31 conflictResolution:4];

    uint64_t v33 = [MEMORY[0x1E4F60E78] column:@"ROWID"];
    [v32 setObject:v33 forKeyedSubscript:@"searchable_message"];
    v34 = [v33 in:v60];
    [v32 setWhereClause:v34];

    [v61 executeUpdateStatement:v32 error:0];
  }
  id v35 = [v6 attachments];
  uint64_t v36 = [v35 count];

  if (v36)
  {
    long long v37 = +[EDSearchableIndexPersistence log];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      long long v38 = NSNumber;
      long long v39 = [v6 attachments];
      v40 = objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v39, "count"));
      *(_DWORD *)buf = 138412290;
      v72 = v40;
      _os_log_impl(&dword_1DB39C000, v37, OS_LOG_TYPE_DEFAULT, "Inserting %@ attachment items into the searchable_attachments table", buf, 0xCu);
    }
    uint64_t v41 = [v6 attachments];
    v42 = -[EDPersistenceDatabaseConnection assignIndexedAttachmentItems:transaction:](v61, v41, a4);

    [v59 addObjectsFromArray:v42];
  }
  v43 = [v6 richLinks];
  uint64_t v44 = [v43 count];

  if (v44)
  {
    v45 = +[EDSearchableIndexPersistence log];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = NSNumber;
      v47 = [v6 richLinks];
      v48 = objc_msgSend(v46, "numberWithUnsignedInteger:", objc_msgSend(v47, "count"));
      *(_DWORD *)buf = 138412290;
      v72 = v48;
      _os_log_impl(&dword_1DB39C000, v45, OS_LOG_TYPE_DEFAULT, "Inserting %@ rich link items into the searchable_rich_links table", buf, 0xCu);
    }
    v49 = [v6 richLinks];
    v50 = -[EDPersistenceDatabaseConnection assignIndexedRichLinkItems:transaction:](v61, v49, a4);

    [v59 addObjectsFromArray:v50];
  }
  v51 = [v6 dataDetectionItems];
  uint64_t v52 = [v51 count];

  if (v52)
  {
    v53 = [v6 dataDetectionItems];
    [(EDSearchableIndexPersistence *)self _assignIndexedDataDetectionItems:v53 transaction:a4 connection:v61];
  }

  return v59;
}

- (void)_enumerateSearchableIndexMessageIndexingTypesUsingBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (uint64_t (**)(id, uint64_t))a3;
  id v5 = [(EDSearchableIndexPersistence *)self _searchableIndexMessageIndexingTypes];
  unint64_t v6 = [v5 count];
  unsigned __int8 v14 = -86;
  unsigned __int8 v7 = atomic_load(&self->_currentIndexingTypeIndex);
  unsigned __int8 v14 = v7;
  int v8 = atomic_load(&v14);
  while (1)
  {
    uint64_t v9 = atomic_load(&v14);
    v10 = [v5 objectAtIndexedSubscript:v9];
    if ((v4[2](v4, [v10 integerValue]) & 1) == 0) {
      break;
    }
    if (v6 <= (atomic_fetch_add((atomic_uchar *volatile)&v14, 1u) + 1)) {
      atomic_store(0, &v14);
    }

    int v11 = atomic_load(&v14);
    if (v11 == v8) {
      goto LABEL_10;
    }
  }
  unsigned __int8 v12 = atomic_load(&v14);
  atomic_store(v12, &self->_currentIndexingTypeIndex);
  uint64_t v13 = +[EDSearchableIndexPersistence log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v10;
    _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Did not finish indexing all types. Starting with type %{public}@ next time.", buf, 0xCu);
  }

LABEL_10:
}

uint64_t __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  if (result)
  {
    unint64_t v5 = result;
    if ([*(id *)(a1 + 32) isCanceled])
    {
      return 0;
    }
    else
    {
      unint64_t v6 = [*(id *)(a1 + 40) _messagesRequiringIndexingForType:a2 excludingIdentifiers:*(void *)(a1 + 48) limit:v5];
      unint64_t v7 = [v6 count];
      if (v7 > v5)
      {
        uint64_t v8 = objc_msgSend(v6, "subarrayWithRange:", 0, v5);

        unint64_t v6 = (void *)v8;
      }
      uint64_t v9 = +[EDSearchableIndexPersistence signpostLog];
      os_signpost_id_t v10 = [*(id *)(a1 + 40) signpostID];
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        int v14 = 134218496;
        uint64_t v15 = a2;
        __int16 v16 = 2048;
        unint64_t v17 = v5;
        __int16 v18 = 1024;
        int v19 = [MEMORY[0x1E4F60E00] bucketMessageCount:v7];
        _os_signpost_emit_with_name_impl(&dword_1DB39C000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "EDSearchableIndexPersistenceMessagesToItems", "type=%ld limit=%lu messageCount=%u", (uint8_t *)&v14, 0x1Cu);
      }

      int v11 = [*(id *)(a1 + 40) searchableIndexItemsFromMessages:v6 type:a2];
      unsigned __int8 v12 = +[EDSearchableIndexPersistence signpostLog];
      os_signpost_id_t v13 = [*(id *)(a1 + 40) signpostID];
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        LOWORD(v14) = 0;
        _os_signpost_emit_with_name_impl(&dword_1DB39C000, v12, OS_SIGNPOST_INTERVAL_END, v13, "EDSearchableIndexPersistenceMessagesToItems", "", (uint8_t *)&v14, 2u);
      }

      [*(id *)(a1 + 56) addObjectsFromArray:v11];
      return 1;
    }
  }
  return result;
}

unint64_t __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_383(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) count];
  unint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = v3 >= v2;
  unint64_t v5 = v3 - v2;
  if (v4) {
    return v5;
  }
  else {
    return 0;
  }
}

- (id)_messagesRequiringIndexingForType:(int64_t)a3 excludingIdentifiers:(id)a4 limit:(int64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [a4 componentsJoinedByString:@","];
  BOOL v9 = 0;
  os_signpost_id_t v10 = 0;
  switch(a3)
  {
    case 0:
      os_signpost_id_t v10 = [NSString stringWithFormat:@"((messages.searchable_message IS NULL OR messages.ROWID IN (SELECT message_id FROM searchable_messages WHERE searchable_messages.transaction_id = %ld)) AND likely(messages.ROWID NOT IN (%@)))", 0, v8];
      BOOL v9 = [(EDSearchableIndexPersistence *)self rebuildIndexState] == 1;
      break;
    case 2:
    case 7:
      id v11 = [NSString alloc];
      unsigned __int8 v12 = @"((messages.ROWID IN (SELECT message_id FROM searchable_messages WHERE (searchable_messages.reindex_type = 1 OR searchable_messages.reindex_type = 2 OR searchable_messages.reindex_type = 7))) AND likely(messages.ROWID NOT IN (%@)))";
      goto LABEL_4;
    case 4:
    case 5:
      id v11 = [NSString alloc];
      unsigned __int8 v12 = @"messages.global_message_id IN (SELECT data_detection_results.global_message_id FROM data_detection_results LEFT OUTER JOIN searchable_data_detection_results ON data_detection_results.ROWID = searchable_data_detection_results.data_detection_result WHERE searchable_data_detection_results.data_detection_result IS NULL) AND likely(messages.ROWID NOT IN (%@))";
LABEL_4:
      os_signpost_id_t v10 = objc_msgSend(v11, "initWithFormat:", v12, v8);
      BOOL v9 = 0;
      break;
    default:
      break;
  }
  os_signpost_id_t v13 = [(EDSearchableIndexPersistence *)self additionalFilterClause];
  if ([v13 length])
  {
    uint64_t v14 = [[NSString alloc] initWithFormat:@"%@ AND %@", v10, v13];

    os_signpost_id_t v10 = (void *)v14;
  }
  if (v10)
  {
    uint64_t v15 = +[EDSearchableIndexPersistence signpostLog];
    os_signpost_id_t v16 = [(EDSearchableIndexPersistence *)self signpostID];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_DWORD *)buf = 134218240;
      int64_t v24 = a3;
      __int16 v25 = 2048;
      int64_t v26 = a5;
      _os_signpost_emit_with_name_impl(&dword_1DB39C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v16, "EDSearchableIndexPersistenceMessagesForIndexing", "type=%ld limit=%ld", buf, 0x16u);
    }

    uint64_t v17 = [(EDSearchableIndexPersistence *)self messagesWhere:v10 useSearchableRebuildTable:v9 limit:a5];
    __int16 v18 = +[EDSearchableIndexPersistence signpostLog];
    os_signpost_id_t v19 = [(EDSearchableIndexPersistence *)self signpostID];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DB39C000, v18, OS_SIGNPOST_INTERVAL_END, v19, "EDSearchableIndexPersistenceMessagesForIndexing", "", buf, 2u);
    }

    uint64_t v20 = (void *)v17;
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if ([(EDSearchableIndexPersistence *)self rebuildIndexState] == 1
    && !([v20 count] | a3))
  {
    [(EDSearchableIndexPersistence *)self setRebuildIndexState:2];
    v21 = +[EDSearchableIndexPersistence log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_DEFAULT, "Reindex complete. Switching to EDSearchableIndexRebuildTableStateUseDefaultQuery state", buf, 2u);
    }
  }

  return v20;
}

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__EDSearchableIndexPersistence_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_8 != -1) {
    dispatch_once(&signpostLog_onceToken_8, block);
  }
  unint64_t v2 = (void *)signpostLog_log_8;

  return (OS_os_log *)v2;
}

- (unint64_t)rebuildIndexState
{
  return self->_rebuildIndexState;
}

uint64_t __74__EDSearchableIndexPersistence_searchableIndex_assignTransaction_updates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  BOOL v4 = [*(id *)(a1 + 40) indexedItems];

  if (v4)
  {
    unint64_t v5 = *(void **)(a1 + 48);
    unint64_t v6 = [*(id *)(a1 + 40) indexedItems];
    unint64_t v7 = [v5 _assignIndexedItems:v6 transaction:*(void *)(a1 + 64) connection:v3];

    [*(id *)(a1 + 56) addObjectsFromArray:v7];
  }
  uint64_t v8 = [*(id *)(a1 + 40) removedIdentifiers];
  -[EDPersistenceDatabaseConnection assignTombstonesForIdentifiers:type:transaction:](v3, v8, 0, *(void *)(a1 + 64));
  BOOL v9 = [*(id *)(a1 + 40) removedDomainIdentifiers];
  -[EDPersistenceDatabaseConnection assignTombstonesForIdentifiers:type:transaction:](v3, v9, 1, *(void *)(a1 + 64));

  uint64_t v10 = *(void *)(a1 + 64);
  if (v10 >= 11 && !(v10 % 0xAuLL))
  {
    -[EDPersistenceDatabaseConnection deleteTombstonesBeforeTransaction:](v3, v10 - 10);
    uint64_t v10 = *(void *)(a1 + 64);
  }
  BOOL v11 = +[EDSearchableIndex isValidTransaction:v10];
  if ([v8 count]) {
    BOOL v12 = v11;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12) {
    -[EDPersistenceDatabaseConnection removeIndexedIdentifiers:](v3, v8);
  }

  return 1;
}

- (id)itemsToIndexForSearchableIndex:(id)a3 excludingIdentifiers:(id)a4 count:(unint64_t)a5 cancelationToken:(id)a6
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v73 = a4;
  id v70 = a6;
  v77 = self;
  unint64_t v9 = [(EDSearchableIndexPersistence *)self rebuildIndexState];
  uint64_t v10 = +[EDSearchableIndexPersistence log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = +[EDSearchableIndexScheduler isTurboModeIndexingEnabled];
    BOOL v12 = @"off";
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = a5;
    if (v11) {
      BOOL v12 = @"on";
    }
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v116 = (uint64_t (*)(uint64_t, uint64_t))v12;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "SearchableIndex is requesting a batch of up to %lu items requiring indexing, rebuild state = %lu, turbo mode = %@", buf, 0x20u);
  }

  if (!v9)
  {
    os_signpost_id_t v13 = [(EDSearchableIndexPersistence *)v77 database];
    uint64_t v14 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence itemsToIndexForSearchableIndex:excludingIdentifiers:count:cancelationToken:]"];
    v104[0] = MEMORY[0x1E4F143A8];
    v104[1] = 3221225472;
    v104[2] = __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke;
    v104[3] = &unk_1E6C00AF0;
    v104[4] = v77;
    objc_msgSend(v13, "__performReadWithCaller:usingBlock:", v14, v104);
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_383;
  aBlock[3] = &unk_1E6C05A70;
  id v71 = v15;
  id v102 = v71;
  unint64_t v103 = a5;
  v72 = _Block_copy(aBlock);
  id v78 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v80 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v116 = __Block_byref_object_copy__35;
  v117 = __Block_byref_object_dispose__35;
  id v118 = (id)0xAAAAAAAAAAAAAAAALL;
  id v118 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id obj = v73;
  uint64_t v16 = [obj countByEnumeratingWithState:&v97 objects:v114 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v98;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v98 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v97 + 1) + 8 * i);
        uint64_t v20 = +[EDSearchableIndexAttachmentItem attachmentPersistentIDFromItemIdentifier:v19];
        uint64_t v21 = +[EDSearchableIndexRichLinkItem richLinkItemIdentifierFromSearchableItemIdentifier:v19];
        char v22 = (void *)v21;
        if (v20)
        {
          [v80 addObject:v20];
        }
        else if (v21)
        {
          id v23 = +[EDSearchableIndexRichLinkItem messageIDandRichLinkIDFromRichLinkIdentifier:v19];
          int64_t v24 = v23;
          if (v23)
          {
            __int16 v25 = [v23 first];
            int64_t v26 = [*(id *)(*(void *)&buf[8] + 40) objectForKeyedSubscript:v25];
            BOOL v27 = v26 == 0;

            if (v27)
            {
              id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              [*(id *)(*(void *)&buf[8] + 40) setObject:v28 forKeyedSubscript:v25];
            }
            id v29 = [*(id *)(*(void *)&buf[8] + 40) objectForKeyedSubscript:v25];
            id v30 = [v24 second];
            [v29 addObject:v30];
          }
        }
        else
        {
          [v78 addObject:v19];
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v97 objects:v114 count:16];
    }
    while (v16);
  }

  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_2;
  v91[3] = &unk_1E6C05A98;
  uint64_t v31 = v72;
  id v96 = v31;
  id v32 = v70;
  id v92 = v32;
  v93 = v77;
  id v68 = v78;
  id v94 = v68;
  id v75 = v71;
  id v95 = v75;
  [(EDSearchableIndexPersistence *)v77 _enumerateSearchableIndexMessageIndexingTypesUsingBlock:v91];
  unint64_t v33 = v31[2](v31);
  if (v33 >= 0xC) {
    unint64_t v34 = 12;
  }
  else {
    unint64_t v34 = v33;
  }
  id v35 = +[EDSearchableIndexPersistence signpostLog];
  os_signpost_id_t v36 = [(EDSearchableIndexPersistence *)v77 signpostID];
  if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    LODWORD(v109) = 134217984;
    *(void *)((char *)&v109 + 4) = v34;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v36, "EDSearchableIndexPersistenceWhileLoop", "limit=%ld", (uint8_t *)&v109, 0xCu);
  }

  uint64_t v74 = [MEMORY[0x1E4F1C9C8] now];
  do
  {
    if (!v34 || ([v32 isCanceled] & 1) != 0) {
      break;
    }
    *(void *)&long long v109 = 0;
    *((void *)&v109 + 1) = &v109;
    uint64_t v110 = 0x3032000000;
    v111 = __Block_byref_object_copy__35;
    v112 = __Block_byref_object_dispose__35;
    id v113 = 0;
    long long v37 = [(EDSearchableIndexPersistence *)v77 database];
    long long v38 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence itemsToIndexForSearchableIndex:excludingIdentifiers:count:cancelationToken:]"];
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_388;
    v86[3] = &unk_1E6C05AC0;
    v90 = &v109;
    id v87 = v80;
    v88 = v77;
    id v39 = v32;
    id v89 = v39;
    objc_msgSend(v37, "__performReadWithCaller:usingBlock:", v38, v86);

    v40 = +[EDSearchableIndexPersistence log];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = [*(id *)(*((void *)&v109 + 1) + 40) count];
      *(_DWORD *)v105 = 134217984;
      double v106 = *(double *)&v41;
      _os_log_impl(&dword_1DB39C000, v40, OS_LOG_TYPE_DEFAULT, "Found item count:%lu for attachment indexing", v105, 0xCu);
    }

    if ([*(id *)(*((void *)&v109 + 1) + 40) count] && (objc_msgSend(v39, "isCanceled") & 1) == 0)
    {
      v43 = [(EDSearchableIndexPersistence *)v77 _attachmentItemsFromAttachmentData:*(void *)(*((void *)&v109 + 1) + 40) limit:v34 cancelationToken:v39];
      unint64_t v44 = [v43 count];
      v45 = +[EDSearchableIndexPersistence log];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v46 = [*(id *)(*((void *)&v109 + 1) + 40) count];
        *(_DWORD *)v105 = 134218240;
        double v106 = *(double *)&v44;
        __int16 v107 = 2048;
        uint64_t v108 = v46;
        _os_log_impl(&dword_1DB39C000, v45, OS_LOG_TYPE_DEFAULT, "Generated %lu attachment items from %lu attachment data", v105, 0x16u);
      }

      if (v44)
      {
        [v75 addObjectsFromArray:v43];
        if (v34 >= v44) {
          v34 -= v44;
        }
        else {
          unint64_t v34 = 0;
        }
      }
      v47 = [MEMORY[0x1E4F1C9C8] now];
      [v47 timeIntervalSinceDate:v74];
      double v49 = v48;

      if (v49 >= 5.0)
      {
        [v39 cancel];
        v50 = +[EDSearchableIndexPersistence log];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v105 = 134217984;
          double v106 = v49;
          _os_log_error_impl(&dword_1DB39C000, v50, OS_LOG_TYPE_ERROR, "Taking too long to find attachmentItems after:%f", v105, 0xCu);
        }

        int v42 = 5;
      }
      else
      {
        int v42 = 0;
      }
    }
    else
    {
      int v42 = 5;
    }

    _Block_object_dispose(&v109, 8);
  }
  while (!v42);
  v51 = +[EDSearchableIndexPersistence signpostLog];
  os_signpost_id_t v52 = [(EDSearchableIndexPersistence *)v77 signpostID];
  if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
  {
    LOWORD(v109) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v51, OS_SIGNPOST_INTERVAL_END, v52, "EDSearchableIndexPersistenceWhileLoop", "", (uint8_t *)&v109, 2u);
  }

  unint64_t v53 = v31[2](v31);
  v76 = [MEMORY[0x1E4F1C9C8] now];
  if (v53 >= 0xC) {
    unint64_t v53 = 12;
  }
  do
  {
    if (!v53 || ([v32 isCanceled] & 1) != 0) {
      break;
    }
    *(void *)&long long v109 = 0;
    *((void *)&v109 + 1) = &v109;
    uint64_t v110 = 0x3032000000;
    v111 = __Block_byref_object_copy__35;
    v112 = __Block_byref_object_dispose__35;
    id v113 = 0;
    v54 = [(EDSearchableIndexPersistence *)v77 database];
    v55 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence itemsToIndexForSearchableIndex:excludingIdentifiers:count:cancelationToken:]"];
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_389;
    v82[3] = &unk_1E6C05AE8;
    v84 = &v109;
    v85 = buf;
    id v56 = v32;
    id v83 = v56;
    objc_msgSend(v54, "__performReadWithCaller:usingBlock:", v55, v82);

    if (![*(id *)(*((void *)&v109 + 1) + 40) count]) {
      goto LABEL_59;
    }
    if (([v56 isCanceled] & 1) == 0)
    {
      v58 = [(EDSearchableIndexPersistence *)v77 _richLinkItemsFromRichLinkData:*(void *)(*((void *)&v109 + 1) + 40) limit:v53 cancelationToken:v56];
      unint64_t v59 = [v58 count];
      id v60 = +[EDSearchableIndexPersistence log];
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v61 = [v58 count];
        *(_DWORD *)v105 = 134218240;
        double v106 = *(double *)&v59;
        __int16 v107 = 2048;
        uint64_t v108 = v61;
        _os_log_impl(&dword_1DB39C000, v60, OS_LOG_TYPE_DEFAULT, "Generated %lu rich link items from %lu rich link data", v105, 0x16u);
      }

      if (v59)
      {
        [v75 addObjectsFromArray:v58];
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_390;
        v81[3] = &unk_1E6C05B10;
        v81[4] = buf;
        [v58 enumerateObjectsUsingBlock:v81];
        if (v53 >= v59) {
          v53 -= v59;
        }
        else {
          unint64_t v53 = 0;
        }
      }
      v62 = [MEMORY[0x1E4F1C9C8] now];
      [v62 timeIntervalSinceDate:v76];
      double v64 = v63;

      if (v64 >= 5.0)
      {
        [v56 cancel];
        long long v65 = +[EDSearchableIndexPersistence log];
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v105 = 134217984;
          double v106 = v64;
          _os_log_error_impl(&dword_1DB39C000, v65, OS_LOG_TYPE_ERROR, "Taking too long to find rich link items after:%f", v105, 0xCu);
        }

        int v57 = 7;
      }
      else
      {
        int v57 = 0;
      }
    }
    else
    {
LABEL_59:
      int v57 = 7;
    }

    _Block_object_dispose(&v109, 8);
  }
  while (!v57);
  id v66 = v75;

  _Block_object_dispose(buf, 8);

  return v66;
}

uint64_t __64__EDSearchableIndexPersistence_itemsToRemoveForSearchableIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  unint64_t v5 = -[EDPersistenceDatabaseConnection selectIdentifiersForTombstonesOfType:](v3, 0);
  [v4 addObjectsFromArray:v5];

  unint64_t v6 = *(void **)(a1 + 32);
  unint64_t v7 = -[EDPersistenceDatabaseConnection selectIdentifiersForDeletedMessages](v3);
  [v6 addObjectsFromArray:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  unint64_t v9 = -[EDPersistenceDatabaseConnection selectIdentifiersForDeletedAttachments](v3);
  [v8 addObjectsFromArray:v9];

  return 1;
}

- (id)searchableIndex:(id)a3 assignTransaction:(int64_t)a4 updates:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [(EDSearchableIndexPersistence *)self hookResponder];
  char v9 = objc_opt_respondsToSelector();
  uint64_t v10 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  if ([v7 hasUpdates])
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v11 = [(EDSearchableIndexPersistence *)self database];
    BOOL v12 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence searchableIndex:assignTransaction:updates:]"];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __74__EDSearchableIndexPersistence_searchableIndex_assignTransaction_updates___block_invoke;
    v20[3] = &unk_1E6BFFE60;
    os_signpost_id_t v13 = v10;
    uint64_t v21 = v13;
    id v14 = v7;
    id v22 = v14;
    id v23 = self;
    int64_t v25 = a4;
    id v15 = v19;
    id v24 = v15;
    objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v20);

    if (v9) {
      [v8 searchableIndexDidAssignTransaction:a4 toUpdates:v14 withMissingIdentifiers:v15 generationWindow:v13];
    }
    uint64_t v16 = v24;
    id v17 = v15;
  }
  else
  {
    id v17 = (id)MEMORY[0x1E4F1CBF0];
    if (v9) {
      [v8 searchableIndexDidAssignTransaction:a4 toUpdates:v7 withMissingIdentifiers:MEMORY[0x1E4F1CBF0] generationWindow:v10];
    }
  }

  return v17;
}

- (id)itemsToRemoveForSearchableIndex:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v5 = [(EDSearchableIndexPersistence *)self database];
  unint64_t v6 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence itemsToRemoveForSearchableIndex:]"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__EDSearchableIndexPersistence_itemsToRemoveForSearchableIndex___block_invoke;
  v9[3] = &unk_1E6C00AF0;
  id v7 = v4;
  id v10 = v7;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v9);

  return v7;
}

- (EDSearchableIndexHookResponder)hookResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hookResponder);

  return (EDSearchableIndexHookResponder *)WeakRetained;
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (id)_searchableIndexMessageIndexingTypes
{
  if (_searchableIndexMessageIndexingTypes_onceToken != -1) {
    dispatch_once(&_searchableIndexMessageIndexingTypes_onceToken, &__block_literal_global_430_0);
  }
  unint64_t v2 = (void *)_searchableIndexMessageIndexingTypes_indexingTypes;

  return v2;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__EDSearchableIndexPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_83 != -1) {
    dispatch_once(&log_onceToken_83, block);
  }
  unint64_t v2 = (void *)log_log_83;

  return (OS_os_log *)v2;
}

void __35__EDSearchableIndexPersistence_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  unint64_t v2 = (void *)log_log_83;
  log_log_83 = (uint64_t)v1;
}

void __43__EDSearchableIndexPersistence_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  unint64_t v2 = (void *)signpostLog_log_8;
  signpostLog_log_8 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (NSString)searchableMessagesTableName
{
  return (NSString *)@"searchable_messages";
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  v32[4] = *MEMORY[0x1E4F143B8];
  id v30 = [a1 searchableMessagesTableSchema];
  id v29 = [a1 searchableAttachmentsTableSchema];
  id v28 = [a1 searchableRichLinksTableSchema];
  BOOL v27 = [a1 searchableDataDetectionResultsTableSchema];
  id v24 = [a1 searchableRebuildTableSchema];
  unint64_t v5 = [EDPersistenceForeignKeyPlaceholder alloc];
  int64_t v26 = [v30 columnForName:@"message"];
  uint64_t v20 = +[EDMessagePersistence messagesTableName];
  uint64_t v21 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v5, "initWithColumn:tableName:onDelete:onUpdate:", v26);
  v32[0] = v21;
  unint64_t v6 = [EDPersistenceForeignKeyPlaceholder alloc];
  int64_t v25 = [v29 columnForName:@"attachment"];
  id v7 = +[EDAttachmentPersistence messageAttachmentsTableName];
  uint64_t v8 = [(EDPersistenceForeignKeyPlaceholder *)v6 initWithColumn:v25 tableName:v7 onDelete:3 onUpdate:0];
  v32[1] = v8;
  char v9 = [EDPersistenceForeignKeyPlaceholder alloc];
  id v10 = [v28 columnForName:@"rich_link"];
  BOOL v11 = +[EDRichLinkPersistence richLinksTableName];
  BOOL v12 = [(EDPersistenceForeignKeyPlaceholder *)v9 initWithColumn:v10 tableName:v11 onDelete:3 onUpdate:0];
  v32[2] = v12;
  os_signpost_id_t v13 = [EDPersistenceForeignKeyPlaceholder alloc];
  id v14 = [v27 columnForName:@"message_id"];
  id v15 = +[EDMessagePersistence messagesTableName];
  uint64_t v16 = [(EDPersistenceForeignKeyPlaceholder *)v13 initWithColumn:v14 tableName:v15 onDelete:3 onUpdate:0];
  v32[3] = v16;
  *a3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];

  *a4 = (id)MEMORY[0x1E4F1CBF0];
  v31[0] = v30;
  id v17 = [a1 searchableMessageTombstonesTableSchema];
  v31[1] = v17;
  v31[2] = v29;
  v31[3] = v28;
  v31[4] = v27;
  v31[5] = v24;
  __int16 v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:6];

  return v18;
}

+ (id)searchableRebuildTableSchema
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message_id" nullable:0];
  v7[0] = v3;
  os_signpost_id_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  unint64_t v5 = (void *)[v2 initWithName:@"searchable_rebuild" rowIDType:2 columns:v4];

  return v5;
}

+ (id)searchableMessagesTableSchema
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F60F08]);
  os_signpost_id_t v4 = [a1 searchableMessagesTableName];
  unint64_t v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message" nullable:1];
  v23[0] = v5;
  unint64_t v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"transaction_id" nullable:0];
  v23[1] = v6;
  id v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message_body_indexed" nullable:0];
  v23[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"reindex_type" nullable:0];
  v23[3] = v8;
  char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  id v10 = (void *)[v3 initWithName:v4 rowIDType:1 rowIDAlias:@"message_id" columns:v9];

  v22[0] = @"message";
  v22[1] = @"reindex_type";
  v22[2] = @"transaction_id";
  BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  [v10 addIndexForColumns:v11];

  BOOL v12 = (void *)[objc_alloc(MEMORY[0x1E4F60E78]) initWithName:@"reindex_type"];
  os_signpost_id_t v13 = [v12 notEqualTo:&unk_1F35BAF70];

  id v14 = objc_alloc(MEMORY[0x1E4F60EB0]);
  id v15 = [v10 name];
  v21[0] = @"reindex_type";
  v21[1] = @"message_id";
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  id v17 = (void *)[v14 initWithTableName:v15 columnNames:v16 where:v13 unique:0];
  [v10 addIndex:v17];

  v20[0] = @"transaction_id";
  v20[1] = @"message_id";
  __int16 v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [v10 addIndexForColumns:v18];

  return v10;
}

+ (id)searchableMessageTombstonesTableSchema
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"type" nullable:0];
  v11[0] = v3;
  os_signpost_id_t v4 = [MEMORY[0x1E4F60E80] textColumnWithName:@"identifier" collation:1 nullable:0];
  v11[1] = v4;
  unint64_t v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"transaction_id" nullable:1];
  v11[2] = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  id v7 = (void *)[v2 initWithName:@"searchable_message_tombstones" rowIDType:2 columns:v6];

  [v7 addUniquenessConstraintForColumns:&unk_1F35BB558 conflictResolution:1];
  v10[0] = @"transaction_id";
  v10[1] = @"type";
  v10[2] = @"identifier";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  [v7 addIndexForColumns:v8];

  return v7;
}

+ (id)searchableAttachmentsTableSchema
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"attachment" nullable:1];
  v13[0] = v3;
  os_signpost_id_t v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message_id" nullable:1];
  v13[1] = v4;
  unint64_t v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"transaction_id" nullable:0];
  v13[2] = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  id v7 = (void *)[v2 initWithName:@"searchable_attachments" rowIDType:1 rowIDAlias:@"attachment_id" columns:v6];

  BOOL v12 = @"attachment";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v7 addIndexForColumns:v8];

  BOOL v11 = @"message_id";
  char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  [v7 addIndexForColumns:v9];

  return v7;
}

+ (id)searchableRichLinksTableSchema
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"rich_link" nullable:1];
  v13[0] = v3;
  os_signpost_id_t v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message_id" nullable:1];
  v13[1] = v4;
  unint64_t v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"transaction_id" nullable:0];
  v13[2] = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  id v7 = (void *)[v2 initWithName:@"searchable_rich_links" rowIDType:1 rowIDAlias:@"rich_link_id" columns:v6];

  BOOL v12 = @"rich_link";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v7 addIndexForColumns:v8];

  BOOL v11 = @"message_id";
  char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  [v7 addIndexForColumns:v9];

  return v7;
}

+ (id)searchableDataDetectionResultsTableSchema
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"data_detection_result" nullable:1];
  v13[0] = v3;
  os_signpost_id_t v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message" nullable:1];
  v13[1] = v4;
  unint64_t v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"transaction_id" nullable:0];
  v13[2] = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  id v7 = (void *)[v2 initWithName:@"searchable_data_detection_results" rowIDType:1 columns:v6];

  BOOL v12 = @"message";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v7 addIndexForColumns:v8];

  BOOL v11 = @"data_detection_result";
  char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  [v7 addIndexForColumns:v9];

  return v7;
}

- (EDSearchableIndexPersistence)initWithDatabase:(id)a3 messagePersistence:(id)a4 richLinkPersistence:(id)a5 hookResponder:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)EDSearchableIndexPersistence;
  id v15 = [(EDSearchableIndexPersistence *)&v21 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_database, a3);
    objc_storeWeak((id *)&v16->_hookResponder, v14);
    objc_storeStrong((id *)&v16->_messagePersistence, a4);
    objc_storeStrong((id *)&v16->_richLinkPersistence, a5);
    v16->_lastProcessedAttachmentIDLock._os_unfair_lock_opaque = 0;
    lastProcessedAttachmentID = v16->_lastProcessedAttachmentID;
    v16->_lastProcessedAttachmentID = 0;

    __int16 v18 = [[EDDataDetectionPersistence alloc] initWithDatabase:v11 messagePersistence:0 hookResponder:0];
    dataDetectionPersistence = v16->_dataDetectionPersistence;
    v16->_dataDetectionPersistence = v18;
  }
  return v16;
}

- (EDPersistedAttachmentID)lastProcessedAttachmentID
{
  p_lastProcessedAttachmentIDLock = &self->_lastProcessedAttachmentIDLock;
  os_unfair_lock_lock(&self->_lastProcessedAttachmentIDLock);
  p_lastProcessedAttachmentID = &self->_lastProcessedAttachmentID;
  lastProcessedAttachmentID = self->_lastProcessedAttachmentID;
  if (!lastProcessedAttachmentID)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__35;
    id v15 = __Block_byref_object_dispose__35;
    id v16 = 0;
    unint64_t v6 = [(EDSearchableIndexPersistence *)self database];
    id v7 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence lastProcessedAttachmentID]"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__EDSearchableIndexPersistence_lastProcessedAttachmentID__block_invoke;
    void v10[3] = &unk_1E6BFFFB8;
    v10[4] = &v11;
    objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v10);

    objc_storeStrong((id *)p_lastProcessedAttachmentID, (id)v12[5]);
    _Block_object_dispose(&v11, 8);

    lastProcessedAttachmentID = *p_lastProcessedAttachmentID;
  }
  uint64_t v8 = lastProcessedAttachmentID;
  os_unfair_lock_unlock(p_lastProcessedAttachmentIDLock);

  return v8;
}

uint64_t __57__EDSearchableIndexPersistence_lastProcessedAttachmentID__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = -[EDPersistenceDatabaseConnection selectLastProcessedAttachmentID](v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1;
}

- (void)setLastProcessedAttachmentID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (EDPersistedAttachmentID *)a3;
  os_unfair_lock_lock(&self->_lastProcessedAttachmentIDLock);
  if (self->_lastProcessedAttachmentID == v5)
  {
    os_unfair_lock_unlock(&self->_lastProcessedAttachmentIDLock);
  }
  else
  {
    objc_storeStrong((id *)&self->_lastProcessedAttachmentID, a3);
    os_unfair_lock_unlock(&self->_lastProcessedAttachmentIDLock);
    unint64_t v6 = +[EDSearchableIndexPersistence log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = @"com.apple.mail.searchableIndex.lastProcessedAttachmentIDKey";
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Setting object:%@ for key: %@", buf, 0x16u);
    }

    id v7 = [(EDSearchableIndexPersistence *)self database];
    uint64_t v8 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence setLastProcessedAttachmentID:]"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__EDSearchableIndexPersistence_setLastProcessedAttachmentID___block_invoke;
    v9[3] = &unk_1E6C00AF0;
    id v10 = v5;
    objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v9);
  }
}

uint64_t __61__EDSearchableIndexPersistence_setLastProcessedAttachmentID___block_invoke(uint64_t a1, void *a2)
{
  return -[EDPersistenceDatabaseConnection setLastProcessedAttachmentID:](a2, *(void **)(a1 + 32));
}

- (id)messagesWhere:(id)a3 useSearchableRebuildTable:(BOOL)a4 limit:(int64_t)a5
{
  id v7 = a3;
  [(EDSearchableIndexPersistence *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDSearchableIndexPersistence messagesWhere:useSearchableRebuildTable:limit:]", "EDSearchableIndexPersistence.m", 985, "0");
}

- (id)searchableIndexItemsFromMessages:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  [(EDSearchableIndexPersistence *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDSearchableIndexPersistence searchableIndexItemsFromMessages:type:]", "EDSearchableIndexPersistence.m", 989, "0");
}

- (void)attachmentItemMetadataForAttachmentID:(id)a3 attachmentPersistentID:(id)a4 messagePersistentID:(id)a5 name:(id)a6 mailboxID:(int64_t)a7 result:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  [(EDSearchableIndexPersistence *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDSearchableIndexPersistence attachmentItemMetadataForAttachmentID:attachmentPersistentID:messagePersistentID:name:mailboxID:result:]", "EDSearchableIndexPersistence.m", 993, "0");
}

- (id)searchableIndex:(id)a3 attachmentItemsForMessageWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  objc_super v21 = __Block_byref_object_copy__35;
  id v22 = __Block_byref_object_dispose__35;
  id v23 = 0;
  id v7 = [(EDSearchableIndexPersistence *)self database];
  uint64_t v8 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence searchableIndex:attachmentItemsForMessageWithIdentifier:]"];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __88__EDSearchableIndexPersistence_searchableIndex_attachmentItemsForMessageWithIdentifier___block_invoke;
  id v15 = &unk_1E6BFFF68;
  id v17 = &v18;
  id v9 = v5;
  id v16 = v9;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, &v12);

  if (objc_msgSend((id)v19[5], "count", v12, v13, v14, v15))
  {
    id v10 = [(EDSearchableIndexPersistence *)self _attachmentItemsFromAttachmentData:v19[5] limit:512 cancelationToken:v6];
  }
  else
  {
    id v10 = 0;
  }

  _Block_object_dispose(&v18, 8);

  return v10;
}

uint64_t __88__EDSearchableIndexPersistence_searchableIndex_attachmentItemsForMessageWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = -[EDPersistenceDatabaseConnection attachmentDataForMessageWithIdentifier:](v3, *(void **)(a1 + 32));
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1;
}

- (void)searchableIndex:(id)a3 indexGeneratedSummaries:(id)a4
{
  id v6 = a4;
  uint64_t v5 = [(EDSearchableIndexPersistence *)self messagePersistence];
  [v5 setGeneratedSummaries:v6];
}

- (id)verificationDataSamplesFromMessageIDTransactionIDDictionary:(id)a3
{
  id v5 = a3;
  [(EDSearchableIndexPersistence *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDSearchableIndexPersistence verificationDataSamplesFromMessageIDTransactionIDDictionary:]", "EDSearchableIndexPersistence.m", 1017, "0");
}

- (NSString)additionalFilterClause
{
}

- (NSDictionary)statistics
{
}

- (id)domainsToRemoveForSearchableIndex:(id)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__35;
  uint64_t v12 = __Block_byref_object_dispose__35;
  id v13 = (id)MEMORY[0x1E4F1CBF0];
  id v3 = [(EDSearchableIndexPersistence *)self database];
  uint64_t v4 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence domainsToRemoveForSearchableIndex:]"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __66__EDSearchableIndexPersistence_domainsToRemoveForSearchableIndex___block_invoke;
  v7[3] = &unk_1E6BFFFB8;
  v7[4] = &v8;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __66__EDSearchableIndexPersistence_domainsToRemoveForSearchableIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = -[EDPersistenceDatabaseConnection selectIdentifiersForTombstonesOfType:](v3, 1);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1;
}

uint64_t __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = -[EDPersistenceDatabaseConnection selectIsReindexing]((BOOL)v3);
  uint64_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 setRebuildIndexState:1];
    id v6 = +[EDSearchableIndexPersistence log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Reindex in-progress.  Switching to EDSearchableIndexRebuildTableStateUseRebuildTableQuery state", v8, 2u);
    }
  }
  else
  {
    [v5 setRebuildIndexState:2];
  }

  return 1;
}

uint64_t __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_388(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) lastProcessedAttachmentID];
  uint64_t v6 = -[EDPersistenceDatabaseConnection attachmentDataForItemsRequiringIndexingExcludingIDs:lastProcessedAttachmentID:limit:cancelationToken:](v3, v4, v5, 512, *(void **)(a1 + 48));
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return 1;
}

uint64_t __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_389(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = -[EDPersistenceDatabaseConnection richLinkDataForItemsRequiringIndexingExcludingIdentifiers:limit:cancelationToken:](v3, *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 512, *(void **)(a1 + 32));
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1;
}

void __107__EDSearchableIndexPersistence_itemsToIndexForSearchableIndex_excludingIdentifiers_count_cancelationToken___block_invoke_390(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 messagePersistentID];
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v3];

  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v5 forKeyedSubscript:v3];
  }
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v3];
  uint64_t v7 = [v9 metadatum];
  uint64_t v8 = [v7 richLinkID];
  [v6 addObject:v8];
}

- (id)selectMessageIDsFromBacklogWithBatchSize:(unint64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__35;
  id v13 = __Block_byref_object_dispose__35;
  id v14 = (id)MEMORY[0x1E4F1CBF0];
  uint64_t v4 = [(EDSearchableIndexPersistence *)self database];
  id v5 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence selectMessageIDsFromBacklogWithBatchSize:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__EDSearchableIndexPersistence_selectMessageIDsFromBacklogWithBatchSize___block_invoke;
  v8[3] = &unk_1E6BFFE38;
  v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __73__EDSearchableIndexPersistence_selectMessageIDsFromBacklogWithBatchSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = -[EDPersistenceDatabaseConnection selectMessageIDsFromBacklogWithBatchSize:](v3, *(void *)(a1 + 40));
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1;
}

- (void)transitionBacklogBatchToCXWithBatchSize:(unint64_t)a3 protectionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(EDSearchableIndexPersistence *)self selectMessageIDsFromBacklogWithBatchSize:a3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    uint64_t v10 = *MEMORY[0x1E4F28368];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "stringValue", (void)v14);
        id v13 = [(EDSearchableIndexPersistence *)self urlForMessageID:v12];

        [v6 enqueueMovingFile:v13 toProtectionClass:v10];
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (id)urlForMessageID:(id)a3
{
  id v5 = a3;
  [(EDSearchableIndexPersistence *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDSearchableIndexPersistence urlForMessageID:]", "EDSearchableIndexPersistence.m", 1256, "0");
}

- (int64_t)indexingTypeForSearchableIndex:(id)a3 item:(id)a4
{
  id v5 = a4;
  int64_t v6 = [v5 indexingType];
  if (+[EDSearchableIndex isIncrementalIndexingType:v6])
  {
    id v7 = [v5 identifier];
    BOOL v8 = [(EDSearchableIndexPersistence *)self _canPerformIncrementalIndexForIdentifier:v7 indexingType:v6];

    uint64_t v9 = 5;
    if (v6 != 4) {
      uint64_t v9 = 0;
    }
    if (!v8) {
      int64_t v6 = v9;
    }
  }

  return v6;
}

- (BOOL)_canPerformIncrementalIndexForIdentifier:(id)a3 indexingType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v7 = [(EDSearchableIndexPersistence *)self database];
  BOOL v8 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence _canPerformIncrementalIndexForIdentifier:indexingType:]"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__EDSearchableIndexPersistence__canPerformIncrementalIndexForIdentifier_indexingType___block_invoke;
  v13[3] = &unk_1E6C05B38;
  id v9 = v6;
  id v14 = v9;
  long long v15 = &v21;
  long long v16 = &v17;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v13);

  if (!+[EDSearchableIndex isValidTransaction:v22[3]]
    || (v10 = v18[3], BOOL v11 = 1, v10 != a4) && v10)
  {
    BOOL v11 = 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

uint64_t __86__EDSearchableIndexPersistence__canPerformIncrementalIndexForIdentifier_indexingType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = -[EDPersistenceDatabaseConnection selectTransactionAndIndexTypeForMessage:](v3, *(void **)(a1 + 32));
  id v5 = [v4 first];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 longLongValue];

  id v6 = [v4 second];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 integerValue];

  return 1;
}

- (void)searchableIndex:(id)a3 assignIndexingType:(int64_t)a4 forIdentifiers:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  switch(a4)
  {
    case 0:
    case 5:
      id v14 = [NSString alloc];
      uint64_t v12 = [v10 componentsJoinedByString:@","];
      uint64_t v13 = [v14 initWithFormat:@"UPDATE OR IGNORE searchable_messages SET transaction_id = %lld WHERE message_id IN (%@)", 0, v12];
      goto LABEL_4;
    case 1:
    case 2:
    case 4:
    case 7:
      id v11 = [NSString alloc];
      uint64_t v12 = [v10 componentsJoinedByString:@","];
      uint64_t v13 = [v11 initWithFormat:@"UPDATE OR IGNORE searchable_messages SET reindex_type = %lld WHERE transaction_id != %lld AND message_id IN (%@)", a4, 0, v12];
LABEL_4:
      long long v15 = (void *)v13;
      goto LABEL_8;
    case 3:
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"EDSearchableIndexPersistence.m" lineNumber:1378 description:@"Does not support re-indexing of attachment types. Will need to be implemented if needed."];
      goto LABEL_7;
    case 6:
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"EDSearchableIndexPersistence.m" lineNumber:1382 description:@"Does not support re-indexing of rich link types. Will need to be implemented if needed."];
LABEL_7:
      long long v15 = 0;
LABEL_8:

      break;
    default:
      long long v15 = 0;
      break;
  }
  long long v16 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  uint64_t v17 = [(EDSearchableIndexPersistence *)self database];
  uint64_t v18 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence searchableIndex:assignIndexingType:forIdentifiers:]"];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__EDSearchableIndexPersistence_searchableIndex_assignIndexingType_forIdentifiers___block_invoke;
  void v22[3] = &unk_1E6BFF3D8;
  uint64_t v19 = v16;
  uint64_t v23 = v19;
  id v20 = v15;
  id v24 = v20;
  objc_msgSend(v17, "__performWriteWithCaller:usingBlock:", v18, v22);

  uint64_t v21 = [(EDSearchableIndexPersistence *)self hookResponder];
  if (objc_opt_respondsToSelector()) {
    [v21 searchableIndexDidAssignIndexingType:a4 forIdentifiers:v10 generationWindow:v19];
  }
}

uint64_t __82__EDSearchableIndexPersistence_searchableIndex_assignIndexingType_forIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  [v3 executeStatementString:*(void *)(a1 + 40) errorMessage:@"Assigning the re-indexing type for a set of identifiers"];

  return 1;
}

- (void)searchableIndex:(id)a3 willRemoveIdentifiers:(id)a4 type:(int64_t)a5
{
  id v7 = a4;
  if ([v7 count])
  {
    BOOL v8 = [(EDSearchableIndexPersistence *)self database];
    id v9 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence searchableIndex:willRemoveIdentifiers:type:]"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__EDSearchableIndexPersistence_searchableIndex_willRemoveIdentifiers_type___block_invoke;
    void v10[3] = &unk_1E6BFF4A0;
    id v11 = v7;
    int64_t v12 = a5;
    objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v10);
  }
}

uint64_t __75__EDSearchableIndexPersistence_searchableIndex_willRemoveIdentifiers_type___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (id)childIdentifiersToRemoveFromSearchableIndex:(id)a3 whenRemovingParentIdentifiers:(id)a4
{
  id v5 = a4;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__35;
  uint64_t v18 = __Block_byref_object_dispose__35;
  id v19 = (id)0xAAAAAAAAAAAAAAAALL;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(EDSearchableIndexPersistence *)self database];
  id v7 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence childIdentifiersToRemoveFromSearchableIndex:whenRemovingParentIdentifiers:]"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __106__EDSearchableIndexPersistence_childIdentifiersToRemoveFromSearchableIndex_whenRemovingParentIdentifiers___block_invoke;
  v11[3] = &unk_1E6BFFF68;
  uint64_t v13 = &v14;
  id v8 = v5;
  id v12 = v8;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v11);

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

uint64_t __106__EDSearchableIndexPersistence_childIdentifiersToRemoveFromSearchableIndex_whenRemovingParentIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = -[EDPersistenceDatabaseConnection selectAttachmentIdentifiersForMessages:](v3, *(void **)(a1 + 32));
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1;
}

- (void)startReindexingWithConnection:(id)a3
{
  id v4 = a3;
  [(EDSearchableIndexPersistence *)self setLastProcessedAttachmentID:0];
  -[EDPersistenceDatabaseConnection emptyAllSearchableIndexTables](v4);
  -[EDPersistenceDatabaseConnection clearReferencesToSearchableMessages](v4);
  -[EDPersistenceDatabaseConnection addAllMessagesToRebuildTable](v4);
  [(EDSearchableIndexPersistence *)self setRebuildIndexState:1];
  uint64_t v5 = +[EDSearchableIndexPersistence log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Reindex requested.  Switching to EDSearchableIndexRebuildTableStateUseRebuildTableQuery state", v6, 2u);
  }
}

- (void)searchableIndex:(id)a3 invalidateItemsGreaterThanTransaction:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = +[EDSearchableIndexPersistence log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v11 = a4;
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating items greater than transaction %lld", buf, 0xCu);
  }

  id v7 = [(EDSearchableIndexPersistence *)self database];
  id v8 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence searchableIndex:invalidateItemsGreaterThanTransaction:]"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__EDSearchableIndexPersistence_searchableIndex_invalidateItemsGreaterThanTransaction___block_invoke;
  v9[3] = &unk_1E6BFF4A0;
  void v9[4] = self;
  v9[5] = a4;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v9);
}

uint64_t __86__EDSearchableIndexPersistence_searchableIndex_invalidateItemsGreaterThanTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    [v4 setLastProcessedAttachmentID:0];
    -[EDPersistenceDatabaseConnection deleteMessagesAfterTransaction:](v3, *(void *)(a1 + 40));
    -[EDPersistenceDatabaseConnection deleteAttachmentsAfterTransaction:](v3, *(void *)(a1 + 40));
    -[EDPersistenceDatabaseConnection clearTransactionsForTombstonesAfterTransaction:](v3, *(void *)(a1 + 40));
  }
  else
  {
    [v4 startReindexingWithConnection:v3];
  }

  return 1;
}

- (id)searchableIndex:(id)a3 invalidateItemsInTransactions:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v7 = [(EDSearchableIndexPersistence *)self database];
  id v8 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence searchableIndex:invalidateItemsInTransactions:]"];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  long long v15 = __78__EDSearchableIndexPersistence_searchableIndex_invalidateItemsInTransactions___block_invoke;
  uint64_t v16 = &unk_1E6BFF3D8;
  id v9 = v6;
  id v17 = v9;
  id v10 = v5;
  id v18 = v10;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, &v13);

  int64_t v11 = objc_msgSend(v9, "allObjects", v13, v14, v15, v16);

  return v11;
}

uint64_t __78__EDSearchableIndexPersistence_searchableIndex_invalidateItemsInTransactions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = -[EDPersistenceDatabaseConnection selectMessageIdentifiersForTransactions:](v3, *(void **)(a1 + 40));
  [v4 addObjectsFromArray:v5];

  id v6 = *(void **)(a1 + 32);
  id v7 = -[EDPersistenceDatabaseConnection selectTombstoneIdentifiersForTransactions:](v3, *(void **)(a1 + 40));
  [v6 addObjectsFromArray:v7];

  id v8 = *(void **)(a1 + 32);
  id v9 = -[EDPersistenceDatabaseConnection selectAttachmentIdentifiersForTransactions:](v3, *(void **)(a1 + 40));
  [v8 addObjectsFromArray:v9];

  -[EDPersistenceDatabaseConnection deleteMessagesInTransactions:](v3, *(void **)(a1 + 40));
  -[EDPersistenceDatabaseConnection deleteAttachmentsInTransactions:](v3, *(void **)(a1 + 40));
  -[EDPersistenceDatabaseConnection deleteRichLinksInTransactions:](v3, *(void **)(a1 + 40));
  -[EDPersistenceDatabaseConnection deleteTombstonesInTransactions:](v3, *(void **)(a1 + 40));

  return 1;
}

- (void)searchableIndex:(id)a3 prepareToIndexAttachmentsForMessageWithIdentifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = +[EDSearchableIndexPersistence log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Clearing existing searchable_attachment entries for message_id %@", buf, 0xCu);
  }

  id v7 = [(EDSearchableIndexPersistence *)self database];
  id v8 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence searchableIndex:prepareToIndexAttachmentsForMessageWithIdentifier:]"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__EDSearchableIndexPersistence_searchableIndex_prepareToIndexAttachmentsForMessageWithIdentifier___block_invoke;
  v11[3] = &unk_1E6C00AF0;
  id v9 = v5;
  id v12 = v9;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v11);

  [(EDSearchableIndexPersistence *)self setLastProcessedAttachmentID:0];
  id v10 = +[EDSearchableIndexPersistence log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v9;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "SearchableIndex is preparing to index attachments for message with identifier: %{public}@", buf, 0xCu);
  }
}

uint64_t __98__EDSearchableIndexPersistence_searchableIndex_prepareToIndexAttachmentsForMessageWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (id)verificationDataSamplesForSearchableIndex:(id)a3 count:(unint64_t)a4 lastVerifiedMessageID:(int64_t)a5
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__35;
  id v17 = __Block_byref_object_dispose__35;
  id v18 = 0;
  id v8 = [(EDSearchableIndexPersistence *)self database];
  id v9 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence verificationDataSamplesForSearchableIndex:count:lastVerifiedMessageID:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__EDSearchableIndexPersistence_verificationDataSamplesForSearchableIndex_count_lastVerifiedMessageID___block_invoke;
  v12[3] = &unk_1E6C00B18;
  v12[4] = &v13;
  v12[5] = a4;
  v12[6] = a5;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v12);

  id v10 = [(EDSearchableIndexPersistence *)self verificationDataSamplesFromMessageIDTransactionIDDictionary:v14[5]];
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __102__EDSearchableIndexPersistence_verificationDataSamplesForSearchableIndex_count_lastVerifiedMessageID___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = -[EDPersistenceDatabaseConnection messageIDTransactionIDDictionaryToVerifyWithCount:lastVerifiedMessageID:](v3, a1[5], a1[6]);
  uint64_t v5 = *(void *)(a1[4] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1;
}

- (id)distinctTransactionIDsForSearchableIndex:(id)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__35;
  uint64_t v13 = __Block_byref_object_dispose__35;
  id v14 = (id)0xAAAAAAAAAAAAAAAALL;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(EDSearchableIndexPersistence *)self database];
  uint64_t v5 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence distinctTransactionIDsForSearchableIndex:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__EDSearchableIndexPersistence_distinctTransactionIDsForSearchableIndex___block_invoke;
  v8[3] = &unk_1E6BFFFB8;
  v8[4] = &v9;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  id v6 = (void *)[(id)v10[5] copy];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __73__EDSearchableIndexPersistence_distinctTransactionIDsForSearchableIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = -[EDPersistenceDatabaseConnection selectDistinctTransactionIDs](v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1;
}

- (void)clearOrphanedSearchableMessagesFromDatabase
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = +[EDSearchableIndexPersistence signpostLog];
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = +[EDSearchableIndexPersistence signpostLog];
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "EDSearchableIndexPersistenceOrphanedValues", "", buf, 2u);
  }

  *(void *)buf = 0;
  id v14 = buf;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  id v7 = [(EDSearchableIndexPersistence *)self database];
  id v8 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence clearOrphanedSearchableMessagesFromDatabase]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__EDSearchableIndexPersistence_clearOrphanedSearchableMessagesFromDatabase__block_invoke;
  v12[3] = &unk_1E6BFFFB8;
  v12[4] = buf;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v12);

  uint64_t v9 = +[EDSearchableIndexPersistence signpostLog];
  id v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    uint64_t v11 = *((void *)v14 + 3);
    *(_DWORD *)id v17 = 134349056;
    uint64_t v18 = v11;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v10, OS_SIGNPOST_INTERVAL_END, v4, "EDSearchableIndexPersistenceOrphanedValues", "SpotlightVerificationOrphanedValues=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", v17, 0xCu);
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __75__EDSearchableIndexPersistence_clearOrphanedSearchableMessagesFromDatabase__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -[EDPersistenceDatabaseConnection clearReferencesToMissingSearchableMessages](v3);
  os_signpost_id_t v4 = +[EDSearchableIndexPersistence log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v7 = 134217984;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Setting %lu orphaned searchable_message values to NULL", (uint8_t *)&v7, 0xCu);
  }

  return 1;
}

void __68__EDSearchableIndexPersistence__searchableIndexMessageIndexingTypes__block_invoke()
{
  v0 = (void *)_searchableIndexMessageIndexingTypes_indexingTypes;
  _searchableIndexMessageIndexingTypes_indexingTypes = (uint64_t)&unk_1F35BB570;
}

id __75__EDSearchableIndexPersistence__assignIndexedItems_transaction_connection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void v9[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) addObject:v5];
  v9[0] = v5;
  v9[1] = v5;
  v9[2] = v5;
  v9[3] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];

  return v7;
}

- (id)_attachmentItemsFromAttachmentData:(id)a3 limit:(unint64_t)a4 cancelationToken:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v33 = a5;
  id v34 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v8)
  {
    id v9 = 0;
    uint64_t v32 = *(void *)v46;
    unint64_t v31 = a4;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v46 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v12 = [v11 attachmentPersistentID];

        uint64_t v13 = [v11 attachmentID];
        id v14 = [v11 attachmentPersistentID];
        uint64_t v15 = [v11 messagePersistentID];
        uint64_t v16 = [v11 name];
        uint64_t v17 = [v11 mailboxID];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __90__EDSearchableIndexPersistence__attachmentItemsFromAttachmentData_limit_cancelationToken___block_invoke;
        v40[3] = &unk_1E6C05B88;
        id v9 = v12;
        id v41 = v9;
        int v42 = v11;
        id v18 = v34;
        id v43 = v18;
        id v44 = v36;
        [(EDSearchableIndexPersistence *)self attachmentItemMetadataForAttachmentID:v13 attachmentPersistentID:v14 messagePersistentID:v15 name:v16 mailboxID:v17 result:v40];

        if ([v18 count] >= v31)
        {

          goto LABEL_13;
        }
        char v19 = [v33 isCanceled];

        if (v19) {
          goto LABEL_13;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v9 = 0;
  }
LABEL_13:

  if ([v36 count])
  {
    id v20 = [v36 allObjects];
    uint64_t v21 = [v20 componentsJoinedByString:@","];

    id v22 = [NSString alloc];
    uint64_t v23 = +[EDAttachmentPersistence messageAttachmentsTableName];
    id v24 = (void *)[v22 initWithFormat:@"SELECT attachment FROM %@ WHERE message IN (%@)", v23, v21];

    int64_t v25 = [(EDSearchableIndexPersistence *)self database];
    int64_t v26 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence _attachmentItemsFromAttachmentData:limit:cancelationToken:]"];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __90__EDSearchableIndexPersistence__attachmentItemsFromAttachmentData_limit_cancelationToken___block_invoke_2;
    v37[3] = &unk_1E6BFF3D8;
    id v27 = v24;
    id v38 = v27;
    id v28 = v21;
    id v39 = v28;
    objc_msgSend(v25, "__performWriteWithCaller:usingBlock:", v26, v37);
  }
  if (v9) {
    [(EDSearchableIndexPersistence *)self setLastProcessedAttachmentID:v9];
  }

  return v34;
}

void __90__EDSearchableIndexPersistence__attachmentItemsFromAttachmentData_limit_cancelationToken___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v10 = a2;
  if (v10)
  {
    id v5 = [EDSearchableIndexAttachmentItem alloc];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) messagePersistentID];
    uint64_t v8 = [(EDSearchableIndexAttachmentItem *)v5 initWithAttachmentPersistentID:v6 messagePersistentID:v7 metadatum:v10];

    [*(id *)(a1 + 48) addObject:v8];
  }
  else
  {
    if (!a3) {
      goto LABEL_6;
    }
    id v9 = *(void **)(a1 + 56);
    uint64_t v8 = [*(id *)(a1 + 40) messagePersistentID];
    [v9 addObject:v8];
  }

LABEL_6:
}

uint64_t __90__EDSearchableIndexPersistence__attachmentItemsFromAttachmentData_limit_cancelationToken___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  int64_t v26 = __Block_byref_object_copy__35;
  id v27 = __Block_byref_object_dispose__35;
  id v28 = (id)0xAAAAAAAAAAAAAAAALL;
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  os_signpost_id_t v4 = [v3 preparedStatementForQueryString:*(void *)(a1 + 32)];
  id v21 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90__EDSearchableIndexPersistence__attachmentItemsFromAttachmentData_limit_cancelationToken___block_invoke_3;
  void v22[3] = &unk_1E6BFF4C8;
  void v22[4] = &v23;
  uint64_t v5 = [v4 executeUsingBlock:v22 error:&v21];
  id v6 = v21;
  if (v5)
  {
    id v7 = [NSString alloc];
    uint64_t v8 = +[EDAttachmentPersistence messageAttachmentsTableName];
    id v9 = (void *)[v7 initWithFormat:@"DELETE FROM %@ WHERE message IN (%@)", v8, *(void *)(a1 + 40)];

    [v3 executeStatementString:v9 errorMessage:@"Removing unexpected messages from attachments table"];
    id v10 = NSString;
    uint64_t v11 = +[EDAttachmentPersistence messageAttachmentsTableName];
    id v12 = [v10 stringWithFormat:@"SELECT attachment FROM %@ WHERE attachment IN (%@)", v11, v24[5]];

    uint64_t v13 = [v3 preparedStatementForQueryString:v12];
    id v19 = v6;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __90__EDSearchableIndexPersistence__attachmentItemsFromAttachmentData_limit_cancelationToken___block_invoke_4;
    v20[3] = &unk_1E6BFF4C8;
    void v20[4] = &v23;
    [v13 executeUsingBlock:v20 error:&v19];
    id v14 = v19;

    uint64_t v15 = NSString;
    uint64_t v16 = +[EDAttachmentPersistence attachmentsTableName];
    uint64_t v17 = [v15 stringWithFormat:@"DELETE FROM %@ WHERE ROWID IN (%@)", v16, v24[5]];

    [v3 executeStatementString:v17 errorMessage:@"Removing unexpected messages from attachments table"];
    id v6 = v14;
  }
  else
  {
    [v3 handleError:v6 message:@"get attachment for messageid"];
  }

  _Block_object_dispose(&v23, 8);
  return v5;
}

uint64_t __90__EDSearchableIndexPersistence__attachmentItemsFromAttachmentData_limit_cancelationToken___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

uint64_t __90__EDSearchableIndexPersistence__attachmentItemsFromAttachmentData_limit_cancelationToken___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeObject:a2];
}

- (id)_richLinkItemsFromRichLinkData:(id)a3 limit:(unint64_t)a4 cancelationToken:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v31 = a5;
  id v32 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unint64_t v29 = a4;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v12 = [v11 richLinkID];
        uint64_t v13 = [v11 messageID];
        uint64_t v14 = [v11 mailboxID];
        uint64_t v15 = [v11 title];
        uint64_t v16 = [v11 url];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __86__EDSearchableIndexPersistence__richLinkItemsFromRichLinkData_limit_cancelationToken___block_invoke;
        v36[3] = &unk_1E6C05BB0;
        v36[4] = v11;
        id v17 = v32;
        id v37 = v17;
        id v38 = v33;
        [(EDSearchableIndexPersistence *)self searchableRichLinkItemMetadataForRichLinkID:v12 messagePersistentID:v13 mailboxID:v14 title:v15 url:v16 result:v36];

        if ([v17 count] >= v29)
        {

          goto LABEL_12;
        }
        char v18 = [v31 isCanceled];

        if (v18) {
          goto LABEL_12;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  if ([v33 count])
  {
    id v19 = [v33 allObjects];
    id v20 = [v19 componentsJoinedByString:@","];

    id v21 = [NSString alloc];
    id v22 = +[EDRichLinkPersistence messageRichLinksTableName];
    uint64_t v23 = (void *)[v21 initWithFormat:@"SELECT m.global_message_id, mr.rich_link FROM %@ AS mr  LEFT OUTER JOIN messages AS m ON (m.global_message_id = mr.global_message_id) WHERE m.ROWID IN (%@)", v22, v20];

    id v24 = [(EDSearchableIndexPersistence *)self database];
    uint64_t v25 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence _richLinkItemsFromRichLinkData:limit:cancelationToken:]"];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __86__EDSearchableIndexPersistence__richLinkItemsFromRichLinkData_limit_cancelationToken___block_invoke_2;
    v34[3] = &unk_1E6C00AF0;
    id v26 = v23;
    id v35 = v26;
    objc_msgSend(v24, "__performWriteWithCaller:usingBlock:", v25, v34);
  }

  return v32;
}

void __86__EDSearchableIndexPersistence__richLinkItemsFromRichLinkData_limit_cancelationToken___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v9 = a2;
  if (v9)
  {
    uint64_t v5 = [EDSearchableIndexRichLinkItem alloc];
    id v6 = [*(id *)(a1 + 32) messageID];
    id v7 = [(EDSearchableIndexRichLinkItem *)v5 initWithMessageID:v6 metadatum:v9];

    [*(id *)(a1 + 40) addObject:v7];
  }
  else
  {
    if (!a3) {
      goto LABEL_6;
    }
    uint64_t v8 = *(void **)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) messageID];
    [v8 addObject:v7];
  }

LABEL_6:
}

uint64_t __86__EDSearchableIndexPersistence__richLinkItemsFromRichLinkData_limit_cancelationToken___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  long long v45 = __Block_byref_object_copy__35;
  long long v46 = __Block_byref_object_dispose__35;
  id v47 = (id)0xAAAAAAAAAAAAAAAALL;
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  long long v39 = __Block_byref_object_copy__35;
  long long v40 = __Block_byref_object_dispose__35;
  id v41 = (id)0xAAAAAAAAAAAAAAAALL;
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  os_signpost_id_t v4 = [v3 preparedStatementForQueryString:*(void *)(a1 + 32)];
  id v34 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __86__EDSearchableIndexPersistence__richLinkItemsFromRichLinkData_limit_cancelationToken___block_invoke_3;
  v35[3] = &unk_1E6C04FF0;
  v35[4] = &v36;
  v35[5] = &v42;
  char v5 = [v4 executeUsingBlock:v35 error:&v34];
  id v6 = v34;
  if (v5)
  {
    id v31 = v4;
    id v7 = [(id)v37[5] allObjects];
    uint64_t v8 = [v7 componentsJoinedByString:@","];

    unint64_t v29 = (void *)v8;
    id v9 = [(id)v43[5] allObjects];
    uint64_t v10 = [v9 componentsJoinedByString:@","];

    id v30 = (void *)v10;
    id v11 = [NSString alloc];
    id v12 = +[EDRichLinkPersistence messageRichLinksTableName];
    uint64_t v13 = (void *)[v11 initWithFormat:@"DELETE FROM %@ WHERE global_message_id IN (%@)", v12, v8];

    int v14 = [v3 executeStatementString:v13 errorMessage:@"Removing unexpected rich links from message_rich_links table"];
    uint64_t v15 = NSString;
    uint64_t v16 = +[EDRichLinkPersistence messageRichLinksTableName];
    id v17 = [v15 stringWithFormat:@"SELECT rich_link FROM %@ WHERE rich_link IN (%@)", v16, v10];

    char v18 = [v3 preparedStatementForQueryString:v17];
    id v19 = v18;
    if (v14)
    {
      id v32 = v6;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __86__EDSearchableIndexPersistence__richLinkItemsFromRichLinkData_limit_cancelationToken___block_invoke_4;
      v33[3] = &unk_1E6BFF4C8;
      v33[4] = &v42;
      int v20 = [v18 executeUsingBlock:v33 error:&v32];
      id v21 = v32;

      id v6 = v21;
    }
    else
    {
      int v20 = 0;
    }
    uint64_t v23 = [(id)v43[5] allObjects];
    id v24 = [v23 componentsJoinedByString:@","];

    uint64_t v25 = NSString;
    id v26 = +[EDRichLinkPersistence richLinksTableName];
    id v27 = [v25 stringWithFormat:@"DELETE FROM %@ WHERE ROWID IN (%@)", v26, v24];

    if (v20) {
      uint64_t v22 = [v3 executeStatementString:v27 errorMessage:@"Removing unexpected rich links from rich_links table"];
    }
    else {
      uint64_t v22 = 0;
    }
    os_signpost_id_t v4 = v31;
  }
  else
  {
    [v3 handleError:v6 message:@"Could not find rich links to remove for messageIDs"];
    uint64_t v22 = 0;
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v22;
}

void __86__EDSearchableIndexPersistence__richLinkItemsFromRichLinkData_limit_cancelationToken___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v10 = v3;
  char v5 = [v3 objectAtIndexedSubscript:0];
  id v6 = [v5 stringValue];
  [v4 addObject:v6];

  id v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v8 = [v10 objectAtIndexedSubscript:1];
  id v9 = [v8 stringValue];
  [v7 addObject:v9];
}

void __86__EDSearchableIndexPersistence__richLinkItemsFromRichLinkData_limit_cancelationToken___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = [a2 objectAtIndexedSubscript:0];
  id v3 = [v4 stringValue];
  [v2 removeObject:v3];
}

- (void)searchableRichLinkItemMetadataForRichLinkID:(id)a3 messagePersistentID:(id)a4 mailboxID:(int64_t)a5 title:(id)a6 url:(id)a7 result:(id)a8
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v39 = a6;
  id v40 = a7;
  uint64_t v15 = (void (**)(id, void *, void))a8;
  uint64_t v16 = [(EDSearchableIndexPersistence *)self messagePersistence];
  id v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v14, "databaseID"));
  v41[0] = v17;
  char v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  id v19 = [v16 persistedMessagesForDatabaseIDs:v18 requireProtectedData:0 temporarilyUnavailableDatabaseIDs:0];
  int v20 = [v19 firstObject];

  if (v20)
  {
    id v21 = [(EDSearchableIndexPersistence *)self richLinkPersistence];
    uint64_t v22 = [v20 basePath];
    char v23 = [v21 verifyFileExistsForRichLinkID:v13 basePath:v22];

    if ((v23 & 1) == 0)
    {
      id v24 = +[EDSearchableIndexPersistence log];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[EDSearchableIndexPersistence searchableRichLinkItemMetadataForRichLinkID:messagePersistentID:mailboxID:title:url:result:]();
      }
    }
    uint64_t v25 = [(EDSearchableIndexPersistence *)self allMailboxIdentifiersForMessage:v20];
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v27 = [v20 to];
    uint64_t v28 = [v27 count];

    if (v28)
    {
      unint64_t v29 = [v20 to];
      [v26 addObjectsFromArray:v29];
    }
    id v30 = [v20 cc];
    uint64_t v31 = [v30 count];

    if (v31)
    {
      id v32 = [v20 cc];
      [v26 addObjectsFromArray:v32];
    }
    id v33 = +[EDSearchableIndexItem domainIdentifierForMessage:v20];
    id v34 = [EDSearchableIndexRichLinkItemMetadatum alloc];
    id v35 = [v20 dateReceived];
    uint64_t v36 = [v20 dateSent];
    id v37 = [(EDSearchableIndexRichLinkItemMetadatum *)v34 initWithDomainIdentifier:v33 accountIdentifier:0 mailboxIdentifiers:v25 senderAddress:0 recipientAddresses:v26 dateReceived:v35 dateSent:v36 url:v40 richLinkID:v13 title:v39];

    v15[2](v15, v37, 0);
  }
  else
  {
    uint64_t v38 = +[EDSearchableIndexPersistence log];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      -[EDSearchableIndexPersistence searchableRichLinkItemMetadataForRichLinkID:messagePersistentID:mailboxID:title:url:result:]();
    }

    v15[2](v15, 0, 1);
  }
}

- (id)allMailboxIdentifiersForMessage:(id)a3
{
  id v5 = a3;
  [(EDSearchableIndexPersistence *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDSearchableIndexPersistence allMailboxIdentifiersForMessage:]", "EDSearchableIndexPersistence.m", 1913, "0");
}

- (void)_assignIndexedDataDetectionItems:(id)a3 transaction:(int64_t)a4 connection:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a3;
  uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    uint64_t v9 = *MEMORY[0x1E4F5FCC8];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        id v12 = [(EDSearchableIndexPersistence *)self messagePersistence];
        id v13 = [v11 messageID];
        uint64_t v14 = objc_msgSend(v12, "globalIDForMessageWithDatabaseID:mailboxScope:", objc_msgSend(v13, "databaseID"), 0);

        if (v14 != v9)
        {
          uint64_t v15 = [(EDDataDetectionPersistence *)self->_dataDetectionPersistence getDataDetectionResultRowIDsForGlobalMessageID:v14];
          uint64_t v16 = [v11 messageID];
          [(EDSearchableIndexPersistence *)self _addSearchableDataDetectionResults:v15 withMessage:v16 transaction:a4];
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)_addSearchableDataDetectionResults:(id)a3 withMessage:(id)a4 transaction:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    v20[0] = 0;
    v20[1] = v20;
    void v20[2] = 0x2020000000;
    char v21 = 1;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__35;
    v18[4] = __Block_byref_object_dispose__35;
    id v19 = 0;
    uint64_t v10 = [(EDSearchableIndexPersistence *)self database];
    id v11 = [NSString stringWithUTF8String:"-[EDSearchableIndexPersistence _addSearchableDataDetectionResults:withMessage:transaction:]"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __91__EDSearchableIndexPersistence__addSearchableDataDetectionResults_withMessage_transaction___block_invoke;
    v12[3] = &unk_1E6C05BD8;
    id v13 = v8;
    id v14 = v9;
    uint64_t v15 = v20;
    uint64_t v16 = v18;
    int64_t v17 = a5;
    objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v12);

    _Block_object_dispose(v18, 8);
    _Block_object_dispose(v20, 8);
  }
}

BOOL __91__EDSearchableIndexPersistence__addSearchableDataDetectionResults_withMessage_transaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v20 = a2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"searchable_data_detection_results"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v23;
    uint64_t v6 = a1 + 56;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "databaseID"));
        [v3 setObject:v9 forKeyedSubscript:@"message"];

        uint64_t v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "longLongValue"));
        [v3 setObject:v10 forKeyedSubscript:@"data_detection_result"];

        id v11 = [NSNumber numberWithLongLong:*(void *)(a1 + 64)];
        [v3 setObject:v11 forKeyedSubscript:@"transaction_id"];

        uint64_t v12 = *(void *)(*(void *)v6 + 8);
        id v21 = *(id *)(v12 + 40);
        char v13 = [v20 executeInsertStatement:v3 error:&v21];
        objc_storeStrong((id *)(v12 + 40), v21);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v13;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
        {
          id v14 = +[EDSearchableIndexPersistence log];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138412546;
            id v27 = v8;
            __int16 v28 = 2112;
            uint64_t v29 = v15;
            _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Data detection result %@ with message %@ was successfully added to the searchable_data_detection_results table", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v16 = +[EDSearchableIndexPersistence log];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            __91__EDSearchableIndexPersistence__addSearchableDataDetectionResults_withMessage_transaction___block_invoke_cold_1(v30, a1 + 56, &v31, v16);
          }

          [v20 handleError:*(void *)(*(void *)(*(void *)v6 + 8) + 40) message:@"Storing searchable data detection results"];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v4);
  }

  BOOL v17 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0;
  return v17;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDRichLinkPersistence)richLinkPersistence
{
  return self->_richLinkPersistence;
}

- (void)setRebuildIndexState:(unint64_t)a3
{
  self->_rebuildIndexState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richLinkPersistence, 0);
  objc_destroyWeak((id *)&self->_hookResponder);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_lastProcessedAttachmentID, 0);

  objc_storeStrong((id *)&self->_dataDetectionPersistence, 0);
}

- (void)searchableRichLinkItemMetadataForRichLinkID:messagePersistentID:mailboxID:title:url:result:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_8(&dword_1DB39C000, v0, v1, "Encountered a reference to a non-existent message in the rich_links table for richLinkPersistentID:%{public}@, messagePersistentID:%{public}@");
}

- (void)searchableRichLinkItemMetadataForRichLinkID:messagePersistentID:mailboxID:title:url:result:.cold.2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_8(&dword_1DB39C000, v0, v1, "Encountered a reference to an invalid file in the rich_links table for richLinkPersistentID:%{public}@, messagePersistentID:%{public}@");
}

void __91__EDSearchableIndexPersistence__addSearchableDataDetectionResults_withMessage_transaction___block_invoke_cold_1(uint8_t *buf, uint64_t a2, void *a3, os_log_t log)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  *(_DWORD *)buf = 138412290;
  *a3 = v4;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Error storing searchable data detection results: %@", buf, 0xCu);
}

@end