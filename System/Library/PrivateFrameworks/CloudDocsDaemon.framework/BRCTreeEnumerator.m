@interface BRCTreeEnumerator
- (BOOL)_visitNewParent;
- (BOOL)finishIfCancelled;
- (BRCTreeEnumerator)initWithSession:(id)a3;
- (BRCTreeEnumerator)initWithSession:(id)a3 group:(id)a4;
- (BRCTreeEnumerator)initWithSession:(id)a3 tracker:(id)a4;
- (id)completionHandler;
- (unint64_t)__iterate:(unint64_t)a3;
- (void)_doneWithError:(id)a3;
- (void)_iterate:(unint64_t)a3;
- (void)_scheduleAsync;
- (void)_visitNewParent;
- (void)cancel;
- (void)enumerateBelow:(id)a3 appLibrary:(id)a4 recursively:(BOOL)a5 handler:(id)a6;
- (void)setCompletionHandler:(id)a3;
@end

@implementation BRCTreeEnumerator

- (BRCTreeEnumerator)initWithSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCTreeEnumerator;
  v6 = [(BRCTreeEnumerator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    objc_storeStrong(&v7->_strongSelf, v7);
  }

  return v7;
}

- (BRCTreeEnumerator)initWithSession:(id)a3 tracker:(id)a4
{
  id v7 = a4;
  v8 = [(BRCTreeEnumerator *)self initWithSession:a3];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_tracker, a4);
  }

  return v9;
}

- (BRCTreeEnumerator)initWithSession:(id)a3 group:(id)a4
{
  id v7 = a4;
  v8 = [(BRCTreeEnumerator *)self initWithSession:a3];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_group, a4);
  }

  return v9;
}

- (void)cancel
{
  self->_isCancelled = 1;
}

- (void)_doneWithError:(id)a3
{
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCTreeEnumerator _doneWithError:]((uint64_t)v5, v6);
  }

  id handler = self->_handler;
  if (handler)
  {
    self->_id handler = 0;

    toVisit = self->_toVisit;
    self->_toVisit = 0;

    seen = self->_seen;
    self->_seen = 0;

    group = self->_group;
    if (group) {
      dispatch_group_leave(group);
    }
    completionHandler = (void (**)(id, id))self->_completionHandler;
    if (completionHandler) {
      completionHandler[2](completionHandler, v4);
    }
  }
  id strongSelf = self->_strongSelf;
  self->_id strongSelf = 0;
}

- (void)enumerateBelow:(id)a3 appLibrary:(id)a4 recursively:(BOOL)a5 handler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11) {
    -[BRCTreeEnumerator enumerateBelow:appLibrary:recursively:handler:]();
  }
  v14 = v13;
  v15 = (void *)MEMORY[0x1D94389C0]();
  id handler = self->_handler;
  self->_id handler = v15;

  objc_storeStrong((id *)&self->_parentID, a3);
  objc_storeStrong((id *)&self->_appLibrary, a4);
  v17 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
  seen = self->_seen;
  self->_seen = v17;

  v19 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
  toVisit = self->_toVisit;
  self->_toVisit = v19;

  self->_isRecursive = a5;
  v21 = brc_bread_crumbs();
  v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[BRCTreeEnumerator enumerateBelow:appLibrary:recursively:handler:]();
  }

  group = self->_group;
  if (group) {
    dispatch_group_enter(group);
  }
  [(BRCTreeEnumerator *)self _scheduleAsync];
}

- (BOOL)finishIfCancelled
{
  BOOL isCancelled = self->_isCancelled;
  if (self->_isCancelled)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    [(BRCTreeEnumerator *)self _doneWithError:v4];
  }
  return isCancelled;
}

- (void)_scheduleAsync
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __35__BRCTreeEnumerator__scheduleAsync__block_invoke;
  v15[3] = &unk_1E6993698;
  v15[4] = self;
  v3 = (void *)MEMORY[0x1D94389C0](v15, a2);
  id v4 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
  tracker = self->_tracker;
  if (tracker)
  {
    brc_task_tracker_async_with_logs(tracker, v4, v3, 0);
  }
  else
  {
    v6 = v4;
    id v7 = v3;
    v8 = (void *)MEMORY[0x1D9438760]();
    long long v16 = 0uLL;
    uint64_t v17 = 0;
    __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v16);
    objc_super v9 = brc_bread_crumbs();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = v16;
      label = dispatch_queue_get_label(v6);
      *(_DWORD *)block = 134218498;
      *(void *)&block[4] = v13;
      *(_WORD *)&block[12] = 2080;
      *(void *)&block[14] = label;
      *(_WORD *)&block[22] = 2112;
      v19 = v9;
      _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
    }

    long long v22 = v16;
    uint64_t v23 = v17;
    *(void *)block = MEMORY[0x1E4F143A8];
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = __dispatch_async_with_logs_block_invoke_21;
    v19 = &unk_1E6993710;
    id v11 = v6;
    v20 = v11;
    id v12 = v7;
    id v21 = v12;
    dispatch_async(v11, block);
  }
}

void __35__BRCTreeEnumerator__scheduleAsync__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) finishIfCancelled] & 1) == 0)
  {
    v2 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];

    if (v2)
    {
      uint64_t v3 = *(void *)(a1 + 32);
      if (!*(void *)(v3 + 16))
      {
        v8 = brc_bread_crumbs();
        objc_super v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          __35__BRCTreeEnumerator__scheduleAsync__block_invoke_cold_2((uint64_t)v8, v9);
        }

        uint64_t v3 = *(void *)(a1 + 32);
      }
      id v4 = [*(id *)(v3 + 32) mangledID];
      id v5 = +[BRCUserDefaults defaultsForMangledID:v4];

      objc_msgSend(*(id *)(a1 + 32), "_iterate:", objc_msgSend(v5, "treeEnumeratorBatchSize"));
    }
    else
    {
      v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __35__BRCTreeEnumerator__scheduleAsync__block_invoke_cold_1((uint64_t)v6, v7);
      }

      [*(id *)(a1 + 32) _doneWithError:0];
    }
  }
}

- (BOOL)_visitNewParent
{
  for (i = self->_toVisit; ; i = self->_toVisit)
  {
    if (![(NSMutableIndexSet *)i count])
    {
      [(BRCTreeEnumerator *)self _doneWithError:0];
      return 0;
    }
    uint64_t v4 = [(NSMutableIndexSet *)self->_toVisit firstIndex];
    [(NSMutableIndexSet *)self->_toVisit removeIndex:v4];
    id v5 = [(BRCAccountSession *)self->_session itemByRowID:v4];
    if (v5) {
      break;
    }
  }
  id v7 = v5;
  uint64_t v8 = [v5 itemID];
  parentID = self->_parentID;
  p_parentID = &self->_parentID;
  *p_parentID = (BRCItemID *)v8;

  p_parentID[2] = 0;
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[BRCTreeEnumerator _visitNewParent]();
  }

  return 1;
}

- (unint64_t)__iterate:(unint64_t)a3
{
  id v5 = [(BRCAccountSession *)self->_session clientDB];
  v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(BRCTreeEnumerator *)(uint64_t)self __iterate:v7];
  }

  unint64_t rowID = self->_rowID;
  parentID = self->_parentID;
  v10 = [(BRCAppLibrary *)self->_appLibrary dbRowID];
  id v11 = (void *)[v5 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE rowid > %lld   AND item_parent_id = %@  AND app_library_rowid = %@  AND NOT indexset_contains(%p, rowid) ORDER BY rowid    LIMIT %ld", rowID, parentID, v10, self->_seen, a3];

  if ([v11 next])
  {
    do
    {
      id v12 = (void *)MEMORY[0x1D9438760]();
      id v13 = [(BRCAccountSession *)self->_session newLocalItemFromPQLResultSet:v11 db:v5 error:0];
      unint64_t v14 = [v13 dbRowID];
      self->_unint64_t rowID = v14;
      if (([(NSMutableIndexSet *)self->_seen containsIndex:v14] & 1) == 0)
      {
        [(NSMutableIndexSet *)self->_seen addIndex:self->_rowID];
        if ((([v13 isDirectory] & 1) != 0 || objc_msgSend(v13, "isFSRoot"))
          && self->_isRecursive)
        {
          [(NSMutableIndexSet *)self->_toVisit addIndex:self->_rowID];
        }
        else
        {
          id v15 = (id)(*((uint64_t (**)(void))self->_handler + 2))();
        }
      }
    }
    while (([v11 next] & 1) != 0);
  }
  unint64_t v16 = [v11 rowNumber];

  return v16;
}

- (void)_iterate:(unint64_t)a3
{
  if (a3)
  {
    unint64_t v5 = 0;
    while (1)
    {
      v5 += [(BRCTreeEnumerator *)self __iterate:a3];
      if (v5 >= a3) {
        break;
      }
      if (![(BRCTreeEnumerator *)self _visitNewParent]) {
        return;
      }
    }
  }
  [(BRCTreeEnumerator *)self _scheduleAsync];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_toVisit, 0);
  objc_storeStrong((id *)&self->_seen, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_parentID, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)_doneWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] done iterating%@", (uint8_t *)&v2, 0xCu);
}

- (void)enumerateBelow:appLibrary:recursively:handler:.cold.1()
{
  __assert_rtn("-[BRCTreeEnumerator enumerateBelow:appLibrary:recursively:handler:]", "BRCTreeEnumerator.m", 95, "parentID != nil");
}

- (void)enumerateBelow:appLibrary:recursively:handler:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Starting enumerating under %@%@");
}

void __35__BRCTreeEnumerator__scheduleAsync__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] cancelling enumeration because container deactivated%@", (uint8_t *)&v2, 0xCu);
}

void __35__BRCTreeEnumerator__scheduleAsync__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: self->_handler%@", (uint8_t *)&v2, 0xCu);
}

- (void)_visitNewParent
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] visiting a new parent: %@%@");
}

- (void)__iterate:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] continue iterating under parent %@, for _rowID > %ld%@", (uint8_t *)&v5, 0x20u);
}

@end