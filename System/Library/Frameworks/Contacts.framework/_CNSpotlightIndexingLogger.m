@interface _CNSpotlightIndexingLogger
- (OS_os_log)log;
- (OS_os_log)summaryLog;
- (_CNSpotlightIndexingLogger)init;
- (id)_stringForSpotlightError:(id)a3 willRetry:(BOOL)a4;
- (void)deferringReindexAsFailedToPrepareForReindexing;
- (void)didNotFinishIndexingForDeltaSyncWithError:(id)a3;
- (void)didNotFinishIndexingForFullSyncWithError:(id)a3;
- (void)failedToBeginIndexBatchWithSpotlight:(id)a3;
- (void)failedToClearChangeHistory:(id)a3 toChangeAnchor:(id)a4 error:(id)a5;
- (void)failedToCreateSearchableItemForContactIdentifier:(id)a3;
- (void)failedToCreateUnarchiverForClientStateWithError:(id)a3;
- (void)failedToDeleteAllSearchableItemsWithSpotlight:(id)a3 willRetry:(BOOL)a4;
- (void)failedToEndIndexBatchWithSpotlight:(id)a3 willRetry:(BOOL)a4;
- (void)failedToFetchClientStateFromSpotlight:(id)a3 willRetry:(BOOL)a4;
- (void)failedToFetchContactForChange:(id)a3;
- (void)failedToFetchSearchableForContactIdentifiers:(id)a3 error:(id)a4;
- (void)failedToJournalItemIdentifiersForDeletionWithSpotlight:(id)a3 identifiers:(id)a4 willRetry:(BOOL)a5;
- (void)failedToJournalSearchableItemsForIndexingWithSpotlight:(id)a3 identifiers:(id)a4 willRetry:(BOOL)a5;
- (void)failedToUnarchiveClientStateData:(id)a3;
- (void)finishedBatchIndexWithUpdateIdentifiers:(id)a3 deleteIdentifiers:(id)a4;
- (void)finishedIndexingForDeltaSyncWithUpdateCount:(unint64_t)a3 deleteCount:(unint64_t)a4;
- (void)finishedIndexingForFullSyncWithCount:(unint64_t)a3;
- (void)indexingContacts:(id)a3;
- (void)noContactChangesToIndex;
- (void)reindexingAllSearchableItems:(id)a3;
- (void)reindexingSearchableItemsWithIdentifiers:(id)a3;
- (void)verifiedIndexWithSummmary:(id)a3;
- (void)verifyingIndex:(id)a3;
- (void)willBatchIndexForDeltaSyncWithUpdateCount:(unint64_t)a3 deleteCount:(unint64_t)a4;
- (void)willBatchIndexForFullSyncWithCount:(unint64_t)a3 lastOffset:(int64_t)a4 doneFullSync:(BOOL)a5;
- (void)willClearChangeHistory:(id)a3 toChangeAnchor:(id)a4;
- (void)willReindexAsChangeHistoryIsTruncated:(id)a3;
- (void)willReindexAsFailedToFetchChangeHistory:(id)a3 error:(id)a4;
- (void)willReindexAsFailedToFetchClientState;
- (void)willReindexAsFailedToRegisterForChangeHistory:(id)a3 error:(id)a4;
- (void)willReindexAsIndexVersionChangedFrom:(int64_t)a3 to:(int64_t)a4;
- (void)willReindexAsSnapshotAnchorChangedFrom:(id)a3 to:(id)a4;
- (void)willReindexItemsWithIdentifiers:(id)a3;
- (void)willResumeIndexingAfterOffset:(int64_t)a3;
- (void)willResumeReindexingAsNotFinished;
- (void)willStartIndexingWithClientState:(id)a3;
@end

@implementation _CNSpotlightIndexingLogger

- (_CNSpotlightIndexingLogger)init
{
  v9.receiver = self;
  v9.super_class = (Class)_CNSpotlightIndexingLogger;
  v2 = [(_CNSpotlightIndexingLogger *)&v9 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.contacts", "SpotlightIndexing");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    os_log_t v5 = os_log_create("com.apple.contacts", "SpotlightIndexingSummary");
    summaryLog = v2->_summaryLog;
    v2->_summaryLog = (OS_os_log *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)indexingContacts:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = os_signpost_id_generate((os_log_t)self->_log);
  v6 = self->_log;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Indexing Contacts", "", buf, 2u);
  }

  os_activity_t v8 = _os_activity_create(&dword_1909E3000, "IndexingContacts", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47___CNSpotlightIndexingLogger_indexingContacts___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v19 = v8;
  objc_super v9 = v8;
  v10 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47___CNSpotlightIndexingLogger_indexingContacts___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v11 = v4;
  id v16 = v11;
  id v17 = v10;
  id v12 = v10;
  os_activity_apply(v9, block);

  v13 = self->_log;
  v14 = v13;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v14, OS_SIGNPOST_INTERVAL_END, v5, "Indexing Contacts", "", buf, 2u);
  }
}

- (void)reindexingAllSearchableItems:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = os_signpost_id_generate((os_log_t)self->_log);
  v6 = self->_log;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Reindexing All Searchable Items", "", buf, 2u);
  }

  os_activity_t v8 = _os_activity_create(&dword_1909E3000, "ReindexingAllSearchableItems", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59___CNSpotlightIndexingLogger_reindexingAllSearchableItems___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v19 = v8;
  objc_super v9 = v8;
  v10 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59___CNSpotlightIndexingLogger_reindexingAllSearchableItems___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v11 = v4;
  id v16 = v11;
  id v17 = v10;
  id v12 = v10;
  os_activity_apply(v9, block);

  v13 = self->_log;
  v14 = v13;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v14, OS_SIGNPOST_INTERVAL_END, v5, "Reindexing All Searchable Items", "", buf, 2u);
  }
}

- (void)reindexingSearchableItemsWithIdentifiers:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = os_signpost_id_generate((os_log_t)self->_log);
  v6 = self->_log;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Reindexing Searchable Items with Identifiers", "", buf, 2u);
  }

  os_activity_t v8 = _os_activity_create(&dword_1909E3000, "ReindexingSearchableItemsWithIdentifiers", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71___CNSpotlightIndexingLogger_reindexingSearchableItemsWithIdentifiers___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v19 = v8;
  objc_super v9 = v8;
  v10 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71___CNSpotlightIndexingLogger_reindexingSearchableItemsWithIdentifiers___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v11 = v4;
  id v16 = v11;
  id v17 = v10;
  id v12 = v10;
  os_activity_apply(v9, block);

  v13 = self->_log;
  v14 = v13;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v14, OS_SIGNPOST_INTERVAL_END, v5, "Reindexing Searchable Items with Identifiers", "", buf, 2u);
  }
}

- (void)verifyingIndex:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = os_signpost_id_generate((os_log_t)self->_log);
  v6 = self->_log;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Verifying Index", "", buf, 2u);
  }

  os_activity_t v8 = _os_activity_create(&dword_1909E3000, "VerifyingIndex", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45___CNSpotlightIndexingLogger_verifyingIndex___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v19 = v8;
  objc_super v9 = v8;
  v10 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45___CNSpotlightIndexingLogger_verifyingIndex___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v11 = v4;
  id v16 = v11;
  id v17 = v10;
  id v12 = v10;
  os_activity_apply(v9, block);

  v13 = self->_log;
  v14 = v13;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v14, OS_SIGNPOST_INTERVAL_END, v5, "Verifying Index", "", buf, 2u);
  }
}

- (void)noContactChangesToIndex
{
  v2 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_1909E3000, v2, OS_LOG_TYPE_DEFAULT, "No contact changes to index", v3, 2u);
  }
}

- (void)willReindexItemsWithIdentifiers:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_signpost_id_t v5 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    uint64_t v7 = [v4 count];
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_DEFAULT, "Will reindex items with identifiers(%ld): %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)deferringReindexAsFailedToPrepareForReindexing
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Deferring the reindex as failed to prepare for reindexing", v1, 2u);
}

- (void)willStartIndexingWithClientState:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_signpost_id_t v5 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_DEFAULT, "Will start indexing with client state: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)willBatchIndexForFullSyncWithCount:(unint64_t)a3 lastOffset:(int64_t)a4 doneFullSync:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = &stru_1EE052B80;
    int v10 = 134218498;
    unint64_t v11 = a3;
    if (v5) {
      id v9 = @", final batch!";
    }
    __int16 v12 = 2048;
    int64_t v13 = a4;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1909E3000, v8, OS_LOG_TYPE_DEFAULT, "Will full sync batch index %li items with last offset %li%@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)willBatchIndexForDeltaSyncWithUpdateCount:(unint64_t)a3 deleteCount:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v6 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    unint64_t v8 = a3;
    __int16 v9 = 2048;
    unint64_t v10 = a4;
    _os_log_impl(&dword_1909E3000, v6, OS_LOG_TYPE_DEFAULT, "Will delta sync batch index %li update items and %li delete items", (uint8_t *)&v7, 0x16u);
  }
}

- (void)willClearChangeHistory:(id)a3 toChangeAnchor:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1909E3000, v8, OS_LOG_TYPE_DEFAULT, "Will clear change history for %{public}@ to change anchor %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)willReindexAsFailedToRegisterForChangeHistory:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[_CNSpotlightIndexingLogger willReindexAsFailedToRegisterForChangeHistory:error:]();
  }
}

- (void)willReindexAsFailedToFetchChangeHistory:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[_CNSpotlightIndexingLogger willReindexAsFailedToFetchChangeHistory:error:]();
  }
}

- (void)willReindexAsChangeHistoryIsTruncated:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNSpotlightIndexingLogger willReindexAsChangeHistoryIsTruncated:]();
  }
}

- (void)willReindexAsFailedToFetchClientState
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Will reindex as failed to fetch client state", v1, 2u);
}

- (void)willResumeReindexingAsNotFinished
{
  v2 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_1909E3000, v2, OS_LOG_TYPE_DEFAULT, "Will resume reindexing as previous attempt did not finish", v3, 2u);
  }
}

- (void)willReindexAsIndexVersionChangedFrom:(int64_t)a3 to:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    int64_t v8 = a3;
    __int16 v9 = 2048;
    int64_t v10 = a4;
    _os_log_impl(&dword_1909E3000, v6, OS_LOG_TYPE_DEFAULT, "Will reindex as index version has changed from %li to %li", (uint8_t *)&v7, 0x16u);
  }
}

- (void)willReindexAsSnapshotAnchorChangedFrom:(id)a3 to:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1909E3000, v8, OS_LOG_TYPE_DEFAULT, "Will reindex as the snapshot anchor has changed from %@ to %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)willResumeIndexingAfterOffset:(int64_t)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    int64_t v6 = a3;
    _os_log_impl(&dword_1909E3000, v4, OS_LOG_TYPE_DEFAULT, "Will resume the reindex after offset %li", (uint8_t *)&v5, 0xCu);
  }
}

- (void)failedToCreateSearchableItemForContactIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNSpotlightIndexingLogger failedToCreateSearchableItemForContactIdentifier:]();
  }
}

- (void)failedToFetchContactForChange:(id)a3
{
  id v4 = a3;
  int v5 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNSpotlightIndexingLogger failedToFetchContactForChange:]();
  }
}

- (void)failedToClearChangeHistory:(id)a3 toChangeAnchor:(id)a4 error:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138543874;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    _os_log_error_impl(&dword_1909E3000, v11, OS_LOG_TYPE_ERROR, "Failed to clear change history for %{public}@ to change anchor %@, error: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)failedToFetchSearchableForContactIdentifiers:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[_CNSpotlightIndexingLogger failedToFetchSearchableForContactIdentifiers:error:](v6, (uint64_t)v7, v8);
  }
}

- (id)_stringForSpotlightError:(id)a3 willRetry:(BOOL)a4
{
  id v4 = @"%@";
  if (a4) {
    id v4 = @"will retry, %@";
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", v4, a3);
}

- (void)failedToFetchClientStateFromSpotlight:(id)a3 willRetry:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = [(_CNSpotlightIndexingLogger *)self _stringForSpotlightError:v6 willRetry:v4];
    int v9 = 138543362;
    id v10 = v8;
    _os_log_error_impl(&dword_1909E3000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch client state from CoreSpotlight, %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)failedToBeginIndexBatchWithSpotlight:(id)a3
{
  id v4 = a3;
  int v5 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNSpotlightIndexingLogger failedToBeginIndexBatchWithSpotlight:]();
  }
}

- (void)failedToEndIndexBatchWithSpotlight:(id)a3 willRetry:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = [(_CNSpotlightIndexingLogger *)self _stringForSpotlightError:v6 willRetry:v4];
    int v9 = 138543362;
    id v10 = v8;
    _os_log_error_impl(&dword_1909E3000, v7, OS_LOG_TYPE_ERROR, "Failed to end index batch with CoreSpotlight, %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)failedToJournalSearchableItemsForIndexingWithSpotlight:(id)a3 identifiers:(id)a4 willRetry:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = [(_CNSpotlightIndexingLogger *)self _stringForSpotlightError:v8 willRetry:v5];
    int v12 = 138412802;
    id v13 = v11;
    __int16 v14 = 2048;
    uint64_t v15 = [v9 count];
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_error_impl(&dword_1909E3000, v10, OS_LOG_TYPE_ERROR, "Failed to journal searchable items for indexing with CoreSpotlight, %@ \nidentifiers(%ld) %{public}@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)failedToJournalItemIdentifiersForDeletionWithSpotlight:(id)a3 identifiers:(id)a4 willRetry:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = [(_CNSpotlightIndexingLogger *)self _stringForSpotlightError:v8 willRetry:v5];
    int v12 = 138543874;
    id v13 = v11;
    __int16 v14 = 2048;
    uint64_t v15 = [v9 count];
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_error_impl(&dword_1909E3000, v10, OS_LOG_TYPE_ERROR, "Failed to journal searchable item identifiers for deletion with CoreSpotlight,%{public}@ \nidentifiers(%ld) %{public}@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)failedToDeleteAllSearchableItemsWithSpotlight:(id)a3 willRetry:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = [(_CNSpotlightIndexingLogger *)self _stringForSpotlightError:v6 willRetry:v4];
    int v9 = 138543362;
    id v10 = v8;
    _os_log_error_impl(&dword_1909E3000, v7, OS_LOG_TYPE_ERROR, "Failed to delete all searchable items with CoreSpotlight, %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)failedToUnarchiveClientStateData:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNSpotlightIndexingLogger failedToUnarchiveClientStateData:]();
  }
}

- (void)failedToCreateUnarchiverForClientStateWithError:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNSpotlightIndexingLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNSpotlightIndexingLogger failedToCreateUnarchiverForClientStateWithError:]();
  }
}

- (void)finishedIndexingForFullSyncWithCount:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = [(_CNSpotlightIndexingLogger *)self summaryLog];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl(&dword_1909E3000, v4, OS_LOG_TYPE_DEFAULT, "Finished indexing for full sync with %ld contacts", (uint8_t *)&v5, 0xCu);
  }
}

- (void)finishedIndexingForDeltaSyncWithUpdateCount:(unint64_t)a3 deleteCount:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = [(_CNSpotlightIndexingLogger *)self summaryLog];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    unint64_t v8 = a3;
    __int16 v9 = 2048;
    unint64_t v10 = a4;
    _os_log_impl(&dword_1909E3000, v6, OS_LOG_TYPE_DEFAULT, "Finished indexing for delta sync with %li updates and %li deletes", (uint8_t *)&v7, 0x16u);
  }
}

- (void)finishedBatchIndexWithUpdateIdentifiers:(id)a3 deleteIdentifiers:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(_CNSpotlightIndexingLogger *)self summaryLog];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218754;
    uint64_t v10 = [v6 count];
    __int16 v11 = 2114;
    id v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = [v7 count];
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_impl(&dword_1909E3000, v8, OS_LOG_TYPE_DEFAULT, "Finished batch index \nupdateIdentifiers(%ld) \n%{public}@ \ndeleteIdentifiers(%ld) \n%{public}@", (uint8_t *)&v9, 0x2Au);
  }
}

- (void)didNotFinishIndexingForFullSyncWithError:(id)a3
{
  id v4 = a3;
  int v5 = [(_CNSpotlightIndexingLogger *)self summaryLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNSpotlightIndexingLogger didNotFinishIndexingForFullSyncWithError:]();
  }
}

- (void)didNotFinishIndexingForDeltaSyncWithError:(id)a3
{
  id v4 = a3;
  int v5 = [(_CNSpotlightIndexingLogger *)self summaryLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNSpotlightIndexingLogger didNotFinishIndexingForDeltaSyncWithError:]();
  }
}

- (void)verifiedIndexWithSummmary:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(_CNSpotlightIndexingLogger *)self summaryLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_DEFAULT, "Verified index, summary: \n%{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (OS_os_log)log
{
  return self->_log;
}

- (OS_os_log)summaryLog
{
  return self->_summaryLog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryLog, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (void)willReindexAsFailedToRegisterForChangeHistory:error:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_0(&dword_1909E3000, v0, v1, "Will reindex as failed to register for change history as %{public}@, error: %@");
}

- (void)willReindexAsFailedToFetchChangeHistory:error:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_0(&dword_1909E3000, v0, v1, "Will reindex as failed to fetch change history for %{public}@, error: %@");
}

- (void)willReindexAsChangeHistoryIsTruncated:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Will reindex as change history is truncated for %{public}@", v2, v3, v4, v5, v6);
}

- (void)failedToCreateSearchableItemForContactIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Failed to create searchable item for contact identifier: %{public}@", v2, v3, v4, v5, v6);
}

- (void)failedToFetchContactForChange:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Failed to fetch contact for change: %@", v2, v3, v4, v5, v6);
}

- (void)failedToFetchSearchableForContactIdentifiers:(NSObject *)a3 error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1();
  __int16 v7 = 2114;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1909E3000, a3, OS_LOG_TYPE_ERROR, "Failed to fetch searchable items for contact identifiers(%ld) %{public}@, error: %@", v6, 0x20u);
}

- (void)failedToBeginIndexBatchWithSpotlight:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Failed to begin index batch with CoreSpotlight, exception: %@", v2, v3, v4, v5, v6);
}

- (void)failedToUnarchiveClientStateData:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Failed to unarchive client state data from CoreSpotlight, exception: %@", v2, v3, v4, v5, v6);
}

- (void)failedToCreateUnarchiverForClientStateWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Failed to create unarchiver for client state data from CoreSpotlight, error: %@", v2, v3, v4, v5, v6);
}

- (void)didNotFinishIndexingForFullSyncWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Did not finish indexing for full sync, error: %@", v2, v3, v4, v5, v6);
}

- (void)didNotFinishIndexingForDeltaSyncWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Did not finish indexing for delta sync, error: %@", v2, v3, v4, v5, v6);
}

@end