@interface BRCSyncUpEnumerator
- (BOOL)_checkForSharesWithinSharesWithItem:(id)a3;
- (BOOL)_checkIfParentNeedsRevivalWithParentItem:(id)a3 item:(id)a4;
- (BOOL)_checkIfShouldDenylistForChildrenOfItemBeingCopiedToNewZone:(id)a3;
- (BOOL)_checkIfShouldDenylistForParentDirectoryFaultWithItem:(id)a3 needsDirFaultCheck:(BOOL *)a4;
- (BOOL)_checkIfShouldDenylistForPathMatch:(id)a3;
- (BOOL)_denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:(id)a3 now:(unint64_t)a4;
- (BOOL)_handlePendingShareItemWithPendingDeleteChildren:(id)a3;
- (BOOL)_handleSharedItemWhichMovedToNewShare:(id)a3 rootItem:(id)a4;
- (BOOL)handleItemForOSUpgrade:(id)a3 parentItemID:(id)a4;
- (BOOL)isDenyListed:(id)a3;
- (BOOL)shouldDenylistRemainingDeletionParentStackForItem:(id)a3;
- (BRCSyncUpEnumerator)initWithClientZone:(id)a3;
- (NSMutableArray)itemsNeedingUnshare;
- (NSMutableSet)chainedParentIDAllowlist;
- (id)_documentsOrAliasesNeedingSyncUpEnumerator;
- (id)_liveDirectoriesNeedingSyncUpEnumerator;
- (id)_nextLiveItem;
- (id)_nextTombstone;
- (id)_tombstoneLeavesNeedingSyncUpEnumerator;
- (id)nextObject;
- (unint64_t)retryAfter;
- (unsigned)batchSize;
- (void)_denyListDescendantStack:(id)a3 parentItem:(id)a4 andAddToSet:(id)a5;
- (void)_denyListDescendantStack:(id)a3 parentItem:(id)a4 andAddToSet:(id)a5 descendantBlock:(id)a6;
- (void)_nextLiveItem;
- (void)invalidate;
@end

@implementation BRCSyncUpEnumerator

- (BRCSyncUpEnumerator)initWithClientZone:(id)a3
{
  NSMutableIndexSet *returned;
  uint64_t v27;
  NSMutableArray *stack;
  objc_super v30;

  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BRCSyncUpEnumerator;
  v6 = [(BRCSyncUpEnumerator *)&v30 init];
  if (v6)
  {
    v7 = [v5 mangledID];
    v8 = +[BRCUserDefaults defaultsForMangledID:v7];

    v6->_batchSize = [v5 syncUpBatchSize];
    v6->_maxDepth = [v8 maxSyncPathDepth];
    v6->_should2PhasePCSChain = [v8 should2PhasePCSChain];
    v6->_retryAfter = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v6->_clientZone, a3);
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v6->_batchSize];
    visitedItemIDsToDepthMap = v6->_visitedItemIDsToDepthMap;
    v6->_visitedItemIDsToDepthMap = (NSMutableDictionary *)v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    itemIDsLostOrThrottled = v6->_itemIDsLostOrThrottled;
    v6->_itemIDsLostOrThrottled = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    itemIDsNeedingOSUpgrade = v6->_itemIDsNeedingOSUpgrade;
    v6->_itemIDsNeedingOSUpgrade = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    itemIDsNeedingDirectoryFetch = v6->_itemIDsNeedingDirectoryFetch;
    v6->_itemIDsNeedingDirectoryFetch = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    itemIDsWithChildrenBeingCopiedToNewZone = v6->_itemIDsWithChildrenBeingCopiedToNewZone;
    v6->_itemIDsWithChildrenBeingCopiedToNewZone = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    chainedParentIDAllowlist = v6->_chainedParentIDAllowlist;
    v6->_chainedParentIDAllowlist = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    itemsNeedingUnshare = v6->_itemsNeedingUnshare;
    v6->_itemsNeedingUnshare = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    tooDeepItems = v6->_tooDeepItems;
    v6->_tooDeepItems = v23;

    v25 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    returned = v6->_returned;
    v6->_returned = v25;

    v27 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6->_maxDepth];
    stack = v6->_stack;
    v6->_stack = (NSMutableArray *)v27;

    v6->_currentDepth = 0;
    v6->_stage = 0;
  }
  return v6;
}

- (void)invalidate
{
  [(PQLEnumeration *)self->_enumerator close];
  enumerator = self->_enumerator;
  self->_enumerator = 0;
}

- (id)_documentsOrAliasesNeedingSyncUpEnumerator
{
  v3 = [(BRCClientZone *)self->_clientZone db];
  v4 = [(BRCClientZone *)self->_clientZone dbRowID];
  id v5 = (void *)[v3 fetch:@"SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_doc_id, li.item_file_id, li.item_generation, li.item_localname, li.item_processing_stamp, li.item_staged_file_id, li.item_staged_generation, li.item_bouncedname, li.item_scope, li.item_tmpbounceno, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.desired_version, li.item_live_conflict_loser_etags, li.item_thumb_live_signature, li.item_thumb_greedy, li.version_block_sync_until_bundle_id, li.version_block_sync_until_timestamp FROM client_items AS li  INNER JOIN client_sync_up AS su    ON su.throttle_id = li.rowid  WHERE         su.throttle_state = 50    AND su.zone_rowid = %@    AND su.in_flight_diffs IS NULL    AND li.item_type IN (1, 2, 8, 5, 6, 7, 3)    AND li.item_state = 0    AND li.item_localsyncupstate = 4    AND li.item_min_supported_os_rowid IS NULL ORDER BY su.retry_count ASC", v4];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__BRCSyncUpEnumerator__documentsOrAliasesNeedingSyncUpEnumerator__block_invoke;
  v8[3] = &unk_1E6994120;
  v8[4] = self;
  v6 = [v5 enumerateObjects:v8];

  return v6;
}

id __65__BRCSyncUpEnumerator__documentsOrAliasesNeedingSyncUpEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 24);
  id v6 = a2;
  v7 = [v5 session];
  v8 = [*(id *)(*(void *)(a1 + 32) + 24) session];
  uint64_t v9 = [v8 clientDB];
  v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (id)_liveDirectoriesNeedingSyncUpEnumerator
{
  v3 = [(BRCClientZone *)self->_clientZone db];
  v4 = [(BRCClientZone *)self->_clientZone dbRowID];
  id v5 = (void *)[v3 fetch:@"SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_doc_id, li.item_file_id, li.item_generation, li.item_localname, li.item_processing_stamp, li.item_staged_file_id, li.item_staged_generation, li.item_bouncedname, li.item_scope, li.item_tmpbounceno, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.desired_version, li.item_live_conflict_loser_etags, li.item_thumb_live_signature, li.item_thumb_greedy, li.version_block_sync_until_bundle_id, li.version_block_sync_until_timestamp FROM client_items AS li  INNER JOIN client_sync_up AS su  ON su.throttle_id = li.rowid  WHERE         su.throttle_state = 50    AND su.zone_rowid = %@    AND su.in_flight_diffs IS NULL    AND li.item_type IN (0, 9, 10, 4)    AND (li.item_state = 0)    AND li.item_localsyncupstate = 4    AND li.item_min_supported_os_rowid IS NULL ORDER BY su.retry_count ASC", v4];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__BRCSyncUpEnumerator__liveDirectoriesNeedingSyncUpEnumerator__block_invoke;
  v8[3] = &unk_1E6994120;
  v8[4] = self;
  id v6 = [v5 enumerateObjects:v8];

  return v6;
}

id __62__BRCSyncUpEnumerator__liveDirectoriesNeedingSyncUpEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 24);
  id v6 = a2;
  v7 = [v5 session];
  v8 = [*(id *)(*(void *)(a1 + 32) + 24) session];
  uint64_t v9 = [v8 clientDB];
  v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (id)_tombstoneLeavesNeedingSyncUpEnumerator
{
  v3 = [(BRCClientZone *)self->_clientZone db];
  v4 = [(BRCClientZone *)self->_clientZone dbRowID];
  id v5 = (void *)[v3 fetch:@"SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_doc_id, li.item_file_id, li.item_generation, li.item_localname, li.item_processing_stamp, li.item_staged_file_id, li.item_staged_generation, li.item_bouncedname, li.item_scope, li.item_tmpbounceno, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.desired_version, li.item_live_conflict_loser_etags, li.item_thumb_live_signature, li.item_thumb_greedy, li.version_block_sync_until_bundle_id, li.version_block_sync_until_timestamp FROM client_items AS li  INNER JOIN client_sync_up AS su    ON su.throttle_id = li.rowid  WHERE         su.throttle_state = 50    AND su.zone_rowid = %@    AND su.in_flight_diffs IS NULL    AND li.item_state = 1    AND li.item_localsyncupstate = 4    AND NOT EXISTS(SELECT 1 FROM client_items AS ci                     WHERE li.item_id = ci.item_parent_id                      AND ci.zone_rowid = su.zone_rowid                      AND ci.item_state != -2)    AND li.item_min_supported_os_rowid IS NULL ORDER BY su.retry_count ASC", v4];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__BRCSyncUpEnumerator__tombstoneLeavesNeedingSyncUpEnumerator__block_invoke;
  v8[3] = &unk_1E6994120;
  v8[4] = self;
  id v6 = [v5 enumerateObjects:v8];

  return v6;
}

id __62__BRCSyncUpEnumerator__tombstoneLeavesNeedingSyncUpEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 24);
  id v6 = a2;
  v7 = [v5 session];
  v8 = [*(id *)(*(void *)(a1 + 32) + 24) session];
  uint64_t v9 = [v8 clientDB];
  v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (void)_denyListDescendantStack:(id)a3 parentItem:(id)a4 andAddToSet:(id)a5 descendantBlock:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void *))a6;
  if ([v10 isDirectory])
  {
    v13 = [v10 itemID];
    [v11 addObject:v13];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v19, "isDirectory", (void)v22))
        {
          v20 = [v19 itemID];
          [v11 addObject:v20];
        }
        if (v12)
        {
          v21 = [v19 itemID];
          v12[2](v12, v21);
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  [v14 removeAllObjects];
}

- (void)_denyListDescendantStack:(id)a3 parentItem:(id)a4 andAddToSet:(id)a5
{
}

- (BOOL)_denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:(id)a3 now:(unint64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 needsOSUpgradeToSyncUp])
  {
    v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpEnumerator _denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:now:]();
    }

    [(BRCSyncUpEnumerator *)self _denyListDescendantStack:self->_stack parentItem:v6 andAddToSet:self->_itemIDsLostOrThrottled];
LABEL_23:
    BOOL v16 = 1;
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = [(BRCClientZone *)self->_clientZone syncThrottles];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          unint64_t v22 = 0;
          if ([v14 matchesItem:v6 nsecsToRetry:&v22 now:a4]) {
            BOOL v15 = v22 == 0;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15)
          {
            uint64_t v17 = brc_bread_crumbs();
            v18 = brc_default_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              id v28 = v6;
              __int16 v29 = 2048;
              unint64_t v30 = v22;
              __int16 v31 = 2112;
              v32 = v17;
              _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ and all dependents because %llu nsecs to retry%@", buf, 0x20u);
            }

            unint64_t retryAfter = self->_retryAfter;
            if (retryAfter >= v22) {
              unint64_t retryAfter = v22;
            }
            self->_unint64_t retryAfter = retryAfter;
            [(BRCSyncUpEnumerator *)self _denyListDescendantStack:self->_stack parentItem:v6 andAddToSet:self->_itemIDsLostOrThrottled];

            goto LABEL_23;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v33 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)isDenyListed:(id)a3
{
  id v4 = a3;
  if (([(NSMutableSet *)self->_itemIDsLostOrThrottled containsObject:v4] & 1) != 0
    || ([(NSMutableSet *)self->_itemIDsNeedingOSUpgrade containsObject:v4] & 1) != 0
    || ([(NSMutableSet *)self->_itemIDsWithChildrenBeingCopiedToNewZone containsObject:v4] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [(NSMutableSet *)self->_itemIDsNeedingDirectoryFetch containsObject:v4];
  }

  return v5;
}

- (BOOL)shouldDenylistRemainingDeletionParentStackForItem:(id)a3
{
  id v4 = a3;
  if ([v4 isDead])
  {
    itemIDsNeedingDirectoryFetch = self->_itemIDsNeedingDirectoryFetch;
    id v6 = [v4 itemID];
    if ([(NSMutableSet *)itemIDsNeedingDirectoryFetch containsObject:v6])
    {
      char v7 = 1;
    }
    else
    {
      itemIDsWithChildrenBeingCopiedToNewZone = self->_itemIDsWithChildrenBeingCopiedToNewZone;
      id v9 = [v4 itemID];
      char v7 = [(NSMutableSet *)itemIDsWithChildrenBeingCopiedToNewZone containsObject:v9];
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)handleItemForOSUpgrade:(id)a3 parentItemID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 needsOSUpgradeToSyncUp] & 1) != 0
    || [(NSMutableSet *)self->_itemIDsNeedingOSUpgrade containsObject:v7])
  {
    v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpEnumerator handleItemForOSUpgrade:parentItemID:]();
    }

    if (![v6 needsOSUpgradeToSyncUp])
    {
      uint64_t v10 = [v6 parentItemIDInZone];
      uint64_t v11 = v10;
      if (v10 && ([v10 isNonDesktopRoot] & 1) == 0)
      {
        uint64_t v12 = [v6 clientZone];
        v13 = [v12 itemByItemID:v11];

        [v6 inheritOSUpgradeNeededFromItem:v13];
        [v6 saveToDB];
      }
      [(NSMutableArray *)self->_stack removeLastObject];
    }
    stack = self->_stack;
    itemIDsNeedingOSUpgrade = self->_itemIDsNeedingOSUpgrade;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__BRCSyncUpEnumerator_handleItemForOSUpgrade_parentItemID___block_invoke;
    v18[3] = &unk_1E699C2A0;
    v18[4] = self;
    id v19 = v6;
    [(BRCSyncUpEnumerator *)self _denyListDescendantStack:stack parentItem:v19 andAddToSet:itemIDsNeedingOSUpgrade descendantBlock:v18];

    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

void __59__BRCSyncUpEnumerator_handleItemForOSUpgrade_parentItemID___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 24) itemByItemID:a2];
  if (([v3 needsOSUpgradeToSyncUp] & 1) == 0)
  {
    [v3 inheritOSUpgradeNeededFromItem:*(void *)(a1 + 40)];
    [v3 saveToDB];
  }
}

- (BOOL)_handleSharedItemWhichMovedToNewShare:(id)a3 rootItem:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 sharingOptions] & 4) == 0)
  {
    v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncUpEnumerator _handleSharedItemWhichMovedToNewShare:rootItem:]();
    }

    goto LABEL_21;
  }
  uint64_t v10 = [v6 clientZone];
  if ([v10 isEqualToClientZone:self->_clientZone]) {
    BOOL v11 = [(BRCClientZone *)self->_clientZone isPrivateZone];
  }
  else {
    BOOL v11 = 0;
  }

  uint64_t v12 = brc_bread_crumbs();
  v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = " in the same zone";
    int v24 = 138413058;
    if (!v11) {
      id v14 = 0;
    }
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2080;
    __int16 v29 = v14;
    __int16 v30 = 2112;
    __int16 v31 = v12;
    _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] item with shareID %@ is moving into a shared parent %@%s%@", (uint8_t *)&v24, 0x2Au);
  }

  if (!v11)
  {
    clientZone = self->_clientZone;
    v8 = [v7 itemGlobalID];
    [(BRCClientZone *)clientZone itemMovedIntoShareInThisZone:v6 associatedItemID:v8];
LABEL_21:
    BOOL v19 = 1;
    goto LABEL_22;
  }
  BOOL v15 = [v6 clientZone];
  BOOL v16 = [v6 itemID];
  v8 = [v15 serverItemByItemID:v16];

  if (([v8 sharingOptions] & 4) != 0)
  {
    v21 = brc_bread_crumbs();
    unint64_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpEnumerator _handleSharedItemWhichMovedToNewShare:rootItem:]();
    }

    [(NSMutableArray *)self->_itemsNeedingUnshare addObject:v6];
    goto LABEL_21;
  }
  uint64_t v17 = brc_bread_crumbs();
  v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[BRCSyncUpEnumerator _handleSharedItemWhichMovedToNewShare:rootItem:]();
  }

  [v6 updateItemMetadataFromServerItem:v8 appliedSharingPermission:0];
  [v6 saveToDBForServerEdit:1 keepAliases:0];
  BOOL v19 = 0;
LABEL_22:

  return v19;
}

- (BOOL)_checkForSharesWithinSharesWithItem:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isDead] & 1) != 0 || (objc_msgSend(v4, "isFSRoot"))
  {
    char v5 = 0;
    BOOL v6 = 0;
    goto LABEL_4;
  }
  if (([v4 localDiffs] & 0x20) != 0 && (objc_msgSend(v4, "sharingOptions") & 4) != 0)
  {
    char v5 = [v4 parentItemOnFS];
    if (([v5 sharingOptions] & 0x48) != 0)
    {
      id v25 = [v4 asShareableItem];
      BOOL v26 = [(BRCSyncUpEnumerator *)self _handleSharedItemWhichMovedToNewShare:v25 rootItem:0];

      if (v26)
      {
        brc_bread_crumbs();
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          [(BRCSyncUpEnumerator *)v4 _checkForSharesWithinSharesWithItem:v27];
        }

        BOOL v6 = 1;
        goto LABEL_34;
      }
    }
  }
  else
  {
    char v5 = 0;
  }
  if (([v4 localDiffs] & 0x20) != 0
    && [(BRCClientZone *)self->_clientZone isPrivateZone]
    && [v4 isDirectory])
  {
    if (!v5)
    {
      char v5 = [v4 parentItemOnFS];
    }
    if (([v5 sharingOptions] & 0x48) != 0)
    {
      v8 = [(BRCClientZone *)self->_clientZone session];
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      char v42 = 0;
      id v9 = [v4 asDirectory];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __59__BRCSyncUpEnumerator__checkForSharesWithinSharesWithItem___block_invoke;
      v34[3] = &unk_1E699C2C8;
      id v10 = v8;
      v38 = &v39;
      id v35 = v10;
      v36 = self;
      id v11 = v4;
      id v37 = v11;
      [v10 enumerateItemsWithShareIDUnderParent:v9 block:v34];

      BOOL v6 = *((unsigned char *)v40 + 24) != 0;
      if (*((unsigned char *)v40 + 24))
      {
        uint64_t v12 = brc_bread_crumbs();
        v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          id v14 = [v11 itemID];
          -[BRCSyncUpEnumerator _checkForSharesWithinSharesWithItem:](v14, (uint64_t)v12, v47, v13);
        }
      }
      _Block_object_dispose(&v39, 8);
LABEL_34:

      goto LABEL_20;
    }
  }
  BOOL v6 = 0;
LABEL_20:
  if (([v4 sharingOptions] & 0x7C) == 4 && objc_msgSend(v4, "isDirectory"))
  {
    BOOL v15 = [v4 clientZone];
    BOOL v16 = [v4 itemID];
    uint64_t v17 = [v15 serverItemByItemID:v16];

    if (([v17 sharingOptions] & 0x7C) == 4)
    {
      v18 = [(BRCClientZone *)self->_clientZone session];
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      char v42 = 0;
      BOOL v19 = [v4 asDirectory];
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      __int16 v30 = __59__BRCSyncUpEnumerator__checkForSharesWithinSharesWithItem___block_invoke_15;
      __int16 v31 = &unk_1E699C2F0;
      id v20 = v4;
      id v32 = v20;
      v33 = &v39;
      [v18 enumerateItemsWithShareIDUnderParent:v19 block:&v28];

      if (*((unsigned char *)v40 + 24))
      {
        v21 = brc_bread_crumbs();
        unint64_t v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v44 = v20;
          __int16 v45 = 2112;
          v46 = v21;
          _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Unsharing turd folder share %@ because it now has shared children%@", buf, 0x16u);
        }

        itemsNeedingUnshare = self->_itemsNeedingUnshare;
        int v24 = objc_msgSend(v20, "asShareableItem", v28, v29, v30, v31);
        [(NSMutableArray *)itemsNeedingUnshare addObject:v24];

        BOOL v6 = 1;
      }

      _Block_object_dispose(&v39, 8);
    }
  }
LABEL_4:

  return v6;
}

void __59__BRCSyncUpEnumerator__checkForSharesWithinSharesWithItem___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) itemByItemGlobalID:a2];
  if (([v6 isDead] & 1) == 0)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(unsigned char *)(v3 + 24))
    {
      *(unsigned char *)(v3 + 24) = 1;
    }
    else
    {
      id v4 = *(void **)(a1 + 40);
      char v5 = [v6 asShareableItem];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 _handleSharedItemWhichMovedToNewShare:v5 rootItem:*(void *)(a1 + 48)];
    }
  }
}

void __59__BRCSyncUpEnumerator__checkForSharesWithinSharesWithItem___block_invoke_15(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  v8 = [v6 itemGlobalID];
  char v9 = [v8 isEqualToItemGlobalID:v7];

  if ((v9 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)_checkIfParentNeedsRevivalWithParentItem:(id)a3 item:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v6 isRejected])
  {
    clientZone = self->_clientZone;
    v13 = [v6 clientZone];
    if ([(BRCClientZone *)clientZone isEqualToClientZone:v13]
      && [v6 isKnownByServer]
      && [v6 isIdleOrRejected])
    {
      int v14 = [v6 isDeadOrMissingInServerTruth];

      if (v14)
      {
        if ([v6 isSharedToMeChildItem]) {
          goto LABEL_13;
        }
        BOOL v15 = [v6 clientZone];
        int v16 = [v15 isPrivateZone];

        if (v16)
        {
          uint64_t v17 = [v6 clientZone];
          v18 = [v17 asPrivateClientZone];
          BOOL v19 = [v6 itemID];
          int v20 = [v18 pcsChainStateForItem:v19] & 0xFFFFFFFE;

          if (v20 == 2)
          {
LABEL_13:
            v8 = brc_bread_crumbs();
            char v9 = brc_default_log();
            if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_5;
            }
            int v22 = 138412546;
            id v23 = v6;
            __int16 v24 = 2112;
            id v25 = v8;
            id v10 = "[WARNING] Parent item needs to be revived to sync up %@%@";
            goto LABEL_4;
          }
        }
      }
    }
    else
    {
    }
    BOOL v11 = 0;
    goto LABEL_17;
  }
  v8 = brc_bread_crumbs();
  char v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v8;
    id v10 = "[WARNING] Parent item is rejected so we will reset if we try to sync up without syncing up the parent. Item: %@%@";
LABEL_4:
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v22, 0x16u);
  }
LABEL_5:

  [v6 markForceNeedsSyncUp];
  [v6 saveToDB];
  BOOL v11 = 1;
LABEL_17:

  return v11;
}

- (BOOL)_handlePendingShareItemWithPendingDeleteChildren:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 appLibrary];
  char v5 = [v4 mangledID];
  id v6 = +[BRCUserDefaults defaultsForMangledID:v5];
  char v7 = [v6 preventSharingFolderWithPendingDelete];

  if ((v7 & 1) == 0)
  {
    uint64_t v12 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpEnumerator _handlePendingShareItemWithPendingDeleteChildren:]((uint64_t)v12, v17);
    }

    goto LABEL_13;
  }
  if (![v3 isChildSharedItem]) {
    goto LABEL_14;
  }
  if (![v3 isSharedByMe]) {
    goto LABEL_14;
  }
  if (![v3 isDirectory]) {
    goto LABEL_14;
  }
  v8 = [v3 asDirectory];
  int v9 = [v8 containsPendingDeleteDocuments];

  if (!v9) {
    goto LABEL_14;
  }
  id v10 = [v3 clientZone];
  BOOL v11 = [v3 itemID];
  uint64_t v12 = [v10 serverItemByItemID:v11];

  if ([v12 isChildSharedItem])
  {
LABEL_13:

LABEL_14:
    BOOL v16 = 0;
    goto LABEL_15;
  }
  v13 = brc_bread_crumbs();
  int v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v15 = [v3 itemID];
    int v19 = 138412546;
    int v20 = v15;
    __int16 v21 = 2112;
    int v22 = v13;
    _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Sync: denylist %@ until the delete of its child%@", (uint8_t *)&v19, 0x16u);
  }
  BOOL v16 = 1;
LABEL_15:

  return v16;
}

- (BOOL)_checkIfShouldDenylistForPathMatch:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isDirectory] && (objc_msgSend(v4, "isKnownByServerOrInFlight") & 1) == 0)
  {
    char v5 = [v4 serverPathMatchItemID];
    if (v5)
    {
      if (![(BRCClientZone *)self->_clientZone existsByItemID:v5])
      {
        id v6 = [(BRCClientZone *)self->_clientZone serverItemByItemID:v5];
        char v7 = [v6 isBRAlias];

        if ((v7 & 1) == 0)
        {
          v8 = brc_bread_crumbs();
          LOBYTE(v9) = 1;
          id v10 = brc_default_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            int v9 = [v4 itemID];
            int v14 = 138412802;
            BOOL v15 = v9;
            __int16 v16 = 2112;
            uint64_t v17 = v5;
            __int16 v18 = 2112;
            int v19 = v8;
            _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because it's an unresolved path-match with %@%@", (uint8_t *)&v14, 0x20u);

            LOBYTE(v9) = 1;
          }
          goto LABEL_13;
        }
      }
    }
  }
  if (([v4 localDiffs] & 0x1000000060) != 0)
  {
    char v5 = [v4 serverPathMatchItemID];
    if (!v5)
    {
      LOBYTE(v9) = 0;
      goto LABEL_17;
    }
    v8 = [(BRCClientZone *)self->_clientZone itemByItemID:v5];
    LODWORD(v9) = [v8 isLost];
    if (!v9)
    {
LABEL_14:

LABEL_17:
      goto LABEL_18;
    }
    id v10 = brc_bread_crumbs();
    BOOL v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = [v4 itemID];
      int v14 = 138412802;
      BOOL v15 = v13;
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      __int16 v18 = 2112;
      int v19 = v10;
      _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because we have a lost item at the same path in the server truth - %@%@", (uint8_t *)&v14, 0x20u);
    }
LABEL_13:

    goto LABEL_14;
  }
  LOBYTE(v9) = 0;
LABEL_18:

  return (char)v9;
}

- (BOOL)_checkIfShouldDenylistForParentDirectoryFaultWithItem:(id)a3 needsDirFaultCheck:(BOOL *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [(BRCClientZone *)self->_clientZone serverZone];
  if (([v7 state] & 4) != 0
    || ([v7 hasFetchedServerZoneState] & 1) == 0
    || [(BRCClientZone *)self->_clientZone isSharedZone]
    && [v6 isSharedToMeTopLevelItem])
  {
    BOOL v8 = 0;
    *a4 = 0;
  }
  else
  {
    id v10 = [v6 st];
    BOOL v11 = [v10 parentID];

    clientZone = self->_clientZone;
    v13 = [v6 db];
    int v14 = [(BRCClientZone *)clientZone serverItemTypeByItemID:v11 db:v13];

    if (v14 == 9)
    {
      BOOL v15 = brc_bread_crumbs();
      __int16 v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412546;
        id v20 = v6;
        __int16 v21 = 2112;
        int v22 = v15;
        _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] denylist %@ because parent is a directory fault in the server truth%@", (uint8_t *)&v19, 0x16u);
      }

      uint64_t v17 = self->_clientZone;
      BOOL v8 = 1;
      __int16 v18 = [(BRCClientZone *)v17 fetchDirectoryContentsIfNecessary:v11 isUserWaiting:0 rescheduleApplyScheduler:1];
      [v18 beginObservingChangesWithDelegate:0];
      *a4 = 0;
    }
    else
    {
      BOOL v8 = 0;
      if (!(_BYTE)v14) {
        *a4 = 0;
      }
    }
  }
  return v8;
}

- (BOOL)_checkIfShouldDenylistForChildrenOfItemBeingCopiedToNewZone:(id)a3
{
  id v4 = a3;
  itemIDsWithChildrenBeingCopiedToNewZone = self->_itemIDsWithChildrenBeingCopiedToNewZone;
  id v6 = [v4 itemID];
  LOBYTE(itemIDsWithChildrenBeingCopiedToNewZone) = [(NSMutableSet *)itemIDsWithChildrenBeingCopiedToNewZone containsObject:v6];

  if (itemIDsWithChildrenBeingCopiedToNewZone)
  {
    char v7 = 1;
  }
  else
  {
    BOOL v8 = [(BRCClientZone *)self->_clientZone db];
    int v9 = [v4 itemID];
    id v10 = [(BRCClientZone *)self->_clientZone dbRowID];
    BOOL v11 = (void *)[v8 numberWithSQL:@"SELECT 1 FROM client_items AS ci INNER JOIN server_items AS si ON ci.version_old_zone_item_id = si.item_id AND ci.version_old_zone_rowid = si.zone_rowid  WHERE si.item_parent_id = %@ AND si.zone_rowid = %@ LIMIT 1", v9, v10];

    char v7 = [v11 BOOLValue];
  }

  return v7;
}

- (id)_nextLiveItem
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = brc_current_date_nsec();
  uint64_t v4 = [(NSMutableArray *)self->_stack lastObject];
  if (v4)
  {
    char v5 = (void *)v4;
    do
    {
      id v6 = (void *)MEMORY[0x1D9438760]();
      ++self->_currentDepth;
      [(NSMutableArray *)self->_stack removeLastObject];
      if ([v5 isDirectory])
      {
        char v7 = [NSNumber numberWithUnsignedInt:self->_currentDepth];
        visitedItemIDsToDepthMap = self->_visitedItemIDsToDepthMap;
        int v9 = [v5 itemID];
        [(NSMutableDictionary *)visitedItemIDsToDepthMap setObject:v7 forKeyedSubscript:v9];
      }
      if ((-[NSMutableIndexSet containsIndex:](self->_returned, "containsIndex:", [v5 dbRowID]) & 1) == 0
        && [v5 syncUpState] == 4
        && ![(BRCSyncUpEnumerator *)self _denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:v5 now:v3])
      {
        -[NSMutableIndexSet addIndex:](self->_returned, "addIndex:", [v5 dbRowID]);
        uint64_t v17 = v5;
        v52 = v17;
        goto LABEL_71;
      }
      uint64_t v10 = [(NSMutableArray *)self->_stack lastObject];

      char v5 = (void *)v10;
    }
    while (v10);
  }
  self->_currentDepth = 0;
  if ([(NSMutableArray *)self->_stack count])
  {
    v61 = brc_bread_crumbs();
    v62 = brc_default_log();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT)) {
      [(BRCSyncUpEnumerator *)(uint64_t)v61 _nextLiveItem];
    }
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  BOOL v11 = self->_enumerator;
  uint64_t v66 = [(PQLEnumeration *)v11 countByEnumeratingWithState:&v68 objects:v74 count:16];
  if (!v66)
  {
LABEL_61:
    v52 = 0;
    uint64_t v17 = v11;
    goto LABEL_71;
  }
  v13 = 0;
  uint64_t v14 = *(void *)v69;
  BOOL v15 = &OBJC_IVAR___BRCFairScheduler__resumed;
  *(void *)&long long v12 = 67109634;
  long long v63 = v12;
  uint64_t v64 = *(void *)v69;
  v65 = v11;
LABEL_12:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v69 != v14) {
      objc_enumerationMutation(v11);
    }
    uint64_t v17 = (PQLEnumeration *)*(id *)(*((void *)&v68 + 1) + 8 * v16);

    if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v15[500]), "containsIndex:", -[PQLEnumeration dbRowID](v17, "dbRowID")))
    {
      v13 = v17;
      goto LABEL_56;
    }
    __int16 v18 = [(PQLEnumeration *)v17 itemID];
    BOOL v19 = [(BRCSyncUpEnumerator *)self isDenyListed:v18];

    if (!v19) {
      break;
    }
    v13 = v17;
LABEL_55:
    BOOL v15 = &OBJC_IVAR___BRCFairScheduler__resumed;
LABEL_56:
    if (++v16 == v66)
    {
      uint64_t v51 = [(PQLEnumeration *)v11 countByEnumeratingWithState:&v68 objects:v74 count:16];
      uint64_t v66 = v51;
      if (!v51)
      {

        goto LABEL_61;
      }
      goto LABEL_12;
    }
  }
  while (2)
  {
    char v67 = 0;
    id v20 = [(PQLEnumeration *)v17 itemID];
    char v21 = [v20 isDocumentsFolder] ^ 1;

    char v67 = v21;
    int v22 = [(PQLEnumeration *)v17 clientZone];
    if ([v22 isEqualToClientZone:self->_clientZone])
    {
    }
    else
    {
      uint64_t v23 = [(PQLEnumeration *)v17 parentClientZone];
      int v24 = [v23 isEqualToClientZone:self->_clientZone];

      if (v24)
      {
        id v25 = [(PQLEnumeration *)v17 parentItemOnFS];
        uint64_t v26 = [v25 itemID];
        id v27 = v25;
        goto LABEL_24;
      }
    }
    uint64_t v26 = [(PQLEnumeration *)v17 parentItemIDInZone];
    id v27 = 0;
LABEL_24:
    [(NSMutableArray *)self->_stack addObject:v17];
    if ([(NSMutableArray *)self->_stack count] >= (unint64_t)self->_maxDepth)
    {
      id v44 = brc_bread_crumbs();
      __int16 v45 = brc_default_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int maxDepth = self->_maxDepth;
        *(_DWORD *)buf = v63;
        *(_DWORD *)v73 = maxDepth;
        *(_WORD *)&v73[4] = 2112;
        *(void *)&v73[6] = v17;
        *(_WORD *)&v73[14] = 2112;
        *(void *)&v73[16] = v44;
        _os_log_impl(&dword_1D353B000, v45, OS_LOG_TYPE_DEFAULT, "[WARNING] max depth %u reached at %@%@", buf, 0x1Cu);
      }

      goto LABEL_53;
    }
    int v28 = [(PQLEnumeration *)v17 isLost];
    char v29 = v28;
    if (v28)
    {
      __int16 v30 = brc_bread_crumbs();
      __int16 v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v43 = [(PQLEnumeration *)v17 itemID];
        *(_DWORD *)buf = 138412546;
        *(void *)v73 = v43;
        *(_WORD *)&v73[8] = 2112;
        *(void *)&v73[10] = v30;
        _os_log_debug_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because it's lost%@", buf, 0x16u);
      }
    }
    id v32 = [(BRCClientZone *)self->_clientZone itemIDsBlockedFromSyncForCZMProcessing];
    v33 = [(PQLEnumeration *)v17 itemGlobalID];
    int v34 = [v32 containsObject:v33];

    if (!v34)
    {
      if (v29) {
        goto LABEL_52;
      }
      BOOL v35 = [(BRCSyncUpEnumerator *)self _checkForSharesWithinSharesWithItem:v17];
      if (!v35 && v67) {
        BOOL v35 = [(BRCSyncUpEnumerator *)self _checkIfShouldDenylistForParentDirectoryFaultWithItem:v17 needsDirFaultCheck:&v67];
      }
      if (v35
        || [(BRCSyncUpEnumerator *)self _checkIfShouldDenylistForPathMatch:v17]
        || [(NSMutableSet *)self->_itemIDsLostOrThrottled containsObject:v26])
      {
        goto LABEL_52;
      }
      if ([(BRCSyncUpEnumerator *)self handleItemForOSUpgrade:v17 parentItemID:v26]|| [(BRCSyncUpEnumerator *)self _handlePendingShareItemWithPendingDeleteChildren:v17])
      {
        goto LABEL_53;
      }
      v36 = [(NSMutableDictionary *)self->_visitedItemIDsToDepthMap objectForKey:v26];

      if (v36)
      {
        v49 = [(NSMutableDictionary *)self->_visitedItemIDsToDepthMap objectForKeyedSubscript:v26];
        self->_currentDepth = [v49 intValue];

        goto LABEL_53;
      }
      if ([v26 isNonDesktopRoot]) {
        goto LABEL_53;
      }
      id v37 = v27;
      if (!v27)
      {
        v38 = [0 clientZone];
        uint64_t v39 = [(PQLEnumeration *)v17 clientZone];
        char v40 = [v38 isEqualToClientZone:v39];

        if (v40) {
          goto LABEL_62;
        }
        if (!v26) {
          goto LABEL_63;
        }
        uint64_t v41 = [(PQLEnumeration *)v17 clientZone];
        id v37 = [v41 itemByItemID:v26];

        if (!v37)
        {
LABEL_62:

LABEL_63:
          v53 = brc_bread_crumbs();
          v54 = brc_default_log();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
          {
            clientZone = self->_clientZone;
            *(_DWORD *)buf = 138412802;
            *(void *)v73 = clientZone;
            *(_WORD *)&v73[8] = 2112;
            *(void *)&v73[10] = v17;
            *(_WORD *)&v73[18] = 2112;
            *(void *)&v73[20] = v53;
            _os_log_fault_impl(&dword_1D353B000, v54, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: reset needed for %@ because of orphan %@%@", buf, 0x20u);
          }

          [(BRCClientZone *)self->_clientZone scheduleResetServerAndClientTruthsForReason:@"orphan.live"];
          v52 = 0;
          v55 = v65;
          goto LABEL_70;
        }
      }
      [(BRCSyncUpEnumerator *)self _checkIfParentNeedsRevivalWithParentItem:v37 item:v17];
      id v42 = v37;

      uint64_t v17 = (PQLEnumeration *)v42;
      continue;
    }
    break;
  }
  v47 = brc_bread_crumbs();
  uint64_t v48 = brc_default_log();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    v50 = [(PQLEnumeration *)v17 itemID];
    *(_DWORD *)buf = 138412546;
    *(void *)v73 = v50;
    *(_WORD *)&v73[8] = 2112;
    *(void *)&v73[10] = v47;
    _os_log_debug_impl(&dword_1D353B000, v48, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because it's already being processed for CZM%@", buf, 0x16u);
  }
LABEL_52:
  [(BRCSyncUpEnumerator *)self _denyListDescendantStack:self->_stack parentItem:v17 andAddToSet:self->_itemIDsLostOrThrottled];
LABEL_53:

  if (![(NSMutableArray *)self->_stack count])
  {
    v13 = v17;
    uint64_t v14 = v64;
    BOOL v11 = v65;
    goto LABEL_55;
  }
  v55 = v65;
  if ((unint64_t)[(NSMutableArray *)self->_stack count] >= 2)
  {
    unint64_t v56 = 1;
    do
    {
      v57 = [(NSMutableArray *)self->_stack objectAtIndexedSubscript:v56];
      v58 = [(NSMutableArray *)self->_stack objectAtIndexedSubscript:v56 - 1];
      [v57 checkIsInDocumentsScopeWithParent:v58];

      ++v56;
    }
    while (v56 < [(NSMutableArray *)self->_stack count]);
  }
  v52 = [(BRCSyncUpEnumerator *)self _nextLiveItem];
LABEL_70:

LABEL_71:
  return v52;
}

- (id)_nextTombstone
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  uint64_t v110 = brc_current_date_nsec();
  uint64_t v3 = 0;
  id v4 = 0;
  char v5 = &OBJC_IVAR___BRCFairScheduler__resumed;
  id v6 = &OBJC_IVAR___BRCFairScheduler__resumed;
  while (2)
  {
    while (1)
    {
      char v7 = v4;
      id v4 = [(NSMutableArray *)self->_stack firstObject];

      if (!v4) {
        break;
      }
      BOOL v8 = (void *)MEMORY[0x1D9438760]();
      BOOL v9 = [(BRCSyncUpEnumerator *)self shouldDenylistRemainingDeletionParentStackForItem:v4];
      stack = self->_stack;
      if (v9)
      {
        [(NSMutableArray *)stack removeAllObjects];
        break;
      }
      [(NSMutableArray *)stack removeObjectAtIndex:0];
      if (![v4 isDirectory]) {
        goto LABEL_37;
      }
      BOOL v11 = [v4 itemID];
      [(NSMutableDictionary *)self->_visitedItemIDsToDepthMap setObject:&unk_1F2B27720 forKeyedSubscript:v11];
      if ([v4 syncUpState] == 4)
      {
        long long v12 = v5;
        uint64_t v13 = v6[500];
        if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v13), "containsIndex:", objc_msgSend(v4, "dbRowID")))
        {
          int v14 = 3;
          char v5 = v12;
        }
        else
        {
          uint64_t v15 = [(NSMutableDictionary *)self->_tombstonesEmbargo objectForKeyedSubscript:v11];

          uint64_t v3 = (void *)v15;
          if (!v15)
          {
            __int16 v18 = [(BRCClientZone *)self->_clientZone db];
            uint64_t v19 = *(uint64_t *)((char *)&self->super.super.isa + v13);
            id v20 = [(BRCClientZone *)self->_clientZone dbRowID];
            uint64_t v21 = [v18 numberWithSQL:@"SELECT COUNT(*) FROM client_items  WHERE item_parent_id = %@     AND item_localsyncupstate = 4    AND NOT indexset_contains(%p, rowid)    AND zone_rowid = %@    AND item_state != -2", v11, v19, v20];

            v111 = (void *)v21;
            if (!v21)
            {
              v99 = brc_bread_crumbs();
              v100 = brc_default_log();
              if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v123 = v99;
                _os_log_fault_impl(&dword_1D353B000, v100, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: n%@", buf, 0xCu);
              }
            }
            int v22 = [(BRCClientZone *)self->_clientZone mangledID];
            uint64_t v23 = +[BRCUserDefaults defaultsForMangledID:v22];
            int v24 = [v23 checkTombstoneEmbargoReparents];

            if (v24)
            {
              id v25 = [(BRCClientZone *)self->_clientZone db];
              uint64_t v26 = [(BRCClientZone *)self->_clientZone dbRowID];
              id v27 = (void *)[v25 numberWithSQL:@"SELECT COUNT(*) FROM server_items AS si INNER JOIN client_items AS ci USING (item_id, zone_rowid) WHERE si.item_parent_id = %@ AND si.zone_rowid = %@ AND ci.item_parent_id != si.item_parent_id AND ci.item_localsyncupstate != 0 AND NOT indexset_contains(%p, ci.rowid)", v11, v26, *(Class *)((char *)&self->super.super.isa + v13)];

              if (!v27)
              {
                v101 = brc_bread_crumbs();
                v102 = brc_default_log();
                if (os_log_type_enabled(v102, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v123 = v101;
                  _os_log_fault_impl(&dword_1D353B000, v102, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: reparentedOutCount%@", buf, 0xCu);
                }
              }
              int v28 = v111;
              if ([v27 unsignedLongLongValue])
              {
                char v29 = brc_bread_crumbs();
                __int16 v30 = brc_default_log();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v31 = [v27 unsignedLongLongValue];
                  *(_DWORD *)buf = 138412802;
                  *(void *)v123 = v11;
                  *(_WORD *)&v123[8] = 2048;
                  *(void *)&v123[10] = v31;
                  *(_WORD *)&v123[18] = 2112;
                  *(void *)&v123[20] = v29;
                  _os_log_impl(&dword_1D353B000, v30, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ has %llu items with a new parent%@", buf, 0x20u);
                }

                uint64_t v32 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v27, "unsignedLongLongValue") + objc_msgSend(v111, "unsignedLongLongValue"));

                int v28 = (void *)v32;
              }
            }
            else
            {
              int v28 = v111;
            }
            if (![v28 BOOLValue])
            {

              uint64_t v3 = 0;
LABEL_35:
              char v5 = v12;
              goto LABEL_36;
            }
            if (!self->_tombstonesEmbargo)
            {
              BOOL v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
              tombstonesEmbargo = self->_tombstonesEmbargo;
              self->_tombstonesEmbargo = v35;
            }
            id v37 = brc_bread_crumbs();
            v38 = brc_default_log();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              *(void *)v123 = v11;
              *(_WORD *)&v123[8] = 2112;
              *(void *)&v123[10] = v28;
              *(_WORD *)&v123[18] = 2112;
              *(void *)&v123[20] = v37;
              _os_log_debug_impl(&dword_1D353B000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] Embargoing item %@: it has %@ unsynced children%@", buf, 0x20u);
            }

            [(NSMutableDictionary *)self->_tombstonesEmbargo setObject:v28 forKeyedSubscript:v11];
            uint64_t v3 = v28;
            if (!v28) {
              goto LABEL_35;
            }
          }
          if (![v3 integerValue])
          {
            v33 = brc_bread_crumbs();
            int v34 = brc_default_log();
            char v5 = v12;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)v123 = v11;
              *(_WORD *)&v123[8] = 2112;
              *(void *)&v123[10] = v33;
              _os_log_debug_impl(&dword_1D353B000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] Item %@ is un-embargoed%@", buf, 0x16u);
            }

            [(NSMutableDictionary *)self->_tombstonesEmbargo removeObjectForKey:v11];
LABEL_36:

LABEL_37:
            uint64_t v39 = [v4 st];
            BOOL v11 = [v39 parentID];

            char v40 = [(NSMutableDictionary *)self->_tombstonesEmbargo objectForKeyedSubscript:v11];

            if (v40)
            {
              uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v40, "integerValue") - 1);

              uint64_t v41 = brc_bread_crumbs();
              id v42 = brc_default_log();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                *(void *)v123 = v11;
                *(_WORD *)&v123[8] = 2112;
                *(void *)&v123[10] = v3;
                *(_WORD *)&v123[18] = 2112;
                *(void *)&v123[20] = v41;
                _os_log_debug_impl(&dword_1D353B000, v42, OS_LOG_TYPE_DEBUG, "[DEBUG] Embargoed item %@ has now %@ unreturned dead children left%@", buf, 0x20u);
              }

              [(NSMutableDictionary *)self->_tombstonesEmbargo setObject:v3 forKeyedSubscript:v11];
            }
            else
            {
              v43 = brc_bread_crumbs();
              id v44 = brc_default_log();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)v123 = v11;
                *(_WORD *)&v123[8] = 2112;
                *(void *)&v123[10] = v43;
                _os_log_debug_impl(&dword_1D353B000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] item %@ isn't embargoed%@", buf, 0x16u);
              }

              uint64_t v3 = 0;
            }
            id v6 = &OBJC_IVAR___BRCFairScheduler__resumed;
            if ([(BRCSyncUpEnumerator *)self _denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:v4 now:v110])
            {
              int v14 = 4;
            }
            else
            {
              -[NSMutableIndexSet addIndex:](self->_returned, "addIndex:", [v4 dbRowID]);
              id v108 = v4;
              int v14 = 1;
            }
            goto LABEL_47;
          }
          uint64_t v16 = brc_bread_crumbs();
          uint64_t v17 = brc_default_log();
          char v5 = v12;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)v123 = v11;
            *(_WORD *)&v123[8] = 2112;
            *(void *)&v123[10] = v3;
            *(_WORD *)&v123[18] = 2112;
            *(void *)&v123[20] = v16;
            _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Item %@ is embargoed: %@ unsynced children%@", buf, 0x20u);
          }

          [(NSMutableArray *)self->_stack removeAllObjects];
          int v14 = 4;
          id v6 = &OBJC_IVAR___BRCFairScheduler__resumed;
        }
      }
      else
      {
        int v14 = 3;
      }
LABEL_47:

      if (v14 != 3)
      {
        if (v14 != 4)
        {
          id v107 = v108;
          goto LABEL_144;
        }
        break;
      }
    }
    if ([(NSMutableArray *)self->_stack count])
    {
      v97 = brc_bread_crumbs();
      v98 = brc_default_log();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v123 = v97;
        _os_log_fault_impl(&dword_1D353B000, v98, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _stack.count == 0%@", buf, 0xCu);
      }
    }
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id obj = *(id *)((char *)&self->super.super.isa + v5[504]);
    uint64_t v115 = [obj countByEnumeratingWithState:&v117 objects:v121 count:16];
    if (!v115)
    {
      v50 = 0;
      id v107 = 0;
      __int16 v45 = v4;
      goto LABEL_143;
    }
    v112 = v3;
    uint64_t v116 = *(void *)v118;
    __int16 v45 = v4;
    while (2)
    {
      uint64_t v46 = 0;
LABEL_53:
      if (*(void *)v118 != v116) {
        objc_enumerationMutation(obj);
      }
      id v4 = *(id *)(*((void *)&v117 + 1) + 8 * v46);

      uint64_t v47 = v6[500];
      if ((objc_msgSend(*(id *)((char *)&self->super.super.isa + v47), "containsIndex:", objc_msgSend(v4, "dbRowID")) & 1) != 0
        || ([v4 itemID],
            uint64_t v48 = objc_claimAutoreleasedReturnValue(),
            BOOL v49 = [(BRCSyncUpEnumerator *)self isDenyListed:v48],
            v48,
            v49))
      {
LABEL_117:
        __int16 v45 = v4;
        if (++v46 == v115)
        {
          uint64_t v93 = [obj countByEnumeratingWithState:&v117 objects:v121 count:16];
          uint64_t v115 = v93;
          if (!v93)
          {
            v50 = 0;
            id v107 = 0;
            uint64_t v3 = v112;
            goto LABEL_143;
          }
          continue;
        }
        goto LABEL_53;
      }
      break;
    }
    [(NSMutableArray *)self->_stack addObject:v4];
    if ([(NSMutableArray *)self->_stack count] >= (unint64_t)self->_maxDepth)
    {
      __int16 v45 = 0;
LABEL_103:
      v52 = brc_bread_crumbs();
      v81 = brc_default_log();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int maxDepth = self->_maxDepth;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v123 = maxDepth;
        *(_WORD *)&v123[4] = 2112;
        *(void *)&v123[6] = v4;
        *(_WORD *)&v123[14] = 2112;
        *(void *)&v123[16] = v52;
        _os_log_impl(&dword_1D353B000, v81, OS_LOG_TYPE_DEFAULT, "[WARNING] max depth %u reached at %@%@", buf, 0x1Cu);
      }

LABEL_111:
      id v6 = &OBJC_IVAR___BRCFairScheduler__resumed;

      if (v45)
      {
        v85 = brc_bread_crumbs();
        v86 = brc_default_log();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
        {
          v88 = [v45 debugItemIDString];
          *(_DWORD *)buf = 138412546;
          *(void *)v123 = v88;
          *(_WORD *)&v123[8] = 2112;
          *(void *)&v123[10] = v85;
          _os_log_debug_impl(&dword_1D353B000, v86, OS_LOG_TYPE_DEBUG, "[DEBUG] Fetching recursive contents of %@ because it is the highest dead parent dir-fault%@", buf, 0x16u);
        }
        v87 = [(BRCClientZone *)self->_clientZone fetchRecursiveDirectoryContentsIfNecessary:v45 isUserWaiting:0 rescheduleApply:1];
        [v87 beginObservingChanges];

        id v6 = &OBJC_IVAR___BRCFairScheduler__resumed;
      }
      if ([(NSMutableArray *)self->_stack count])
      {
        if ((unint64_t)[(NSMutableArray *)self->_stack count] >= 2)
        {
          unint64_t v94 = 1;
          do
          {
            v95 = [(NSMutableArray *)self->_stack objectAtIndexedSubscript:v94];
            v96 = [(NSMutableArray *)self->_stack objectAtIndexedSubscript:v94 - 1];
            [v95 checkIsInDocumentsScopeWithParent:v96];

            ++v94;
          }
          while (v94 < [(NSMutableArray *)self->_stack count]);
        }

        uint64_t v3 = v112;
        char v5 = &OBJC_IVAR___BRCFairScheduler__resumed;
        continue;
      }

      goto LABEL_117;
    }
    break;
  }
  __int16 v45 = 0;
  char v113 = 0;
  v50 = v4;
  while (1)
  {
    uint64_t v51 = [v50 st];
    v52 = [v51 parentID];

    char v53 = [v50 isLost];
    if ([v50 isDead] && objc_msgSend(v50, "isDirectory"))
    {
      if ((v113 & 1) != 0
        || ([v50 asDirectory],
            v54 = objc_claimAutoreleasedReturnValue(),
            BOOL v55 = [(BRCSyncUpEnumerator *)self _checkIfShouldDenylistForChildrenOfItemBeingCopiedToNewZone:v54], v54, v55))
      {
        unint64_t v56 = brc_bread_crumbs();
        v57 = brc_default_log();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v123 = v50;
          *(_WORD *)&v123[8] = 2112;
          *(void *)&v123[10] = v56;
          _os_log_debug_impl(&dword_1D353B000, v57, OS_LOG_TYPE_DEBUG, "[DEBUG] denylist all deletes for item which has children being copied to a new zone %@%@", buf, 0x16u);
        }

        itemIDsWithChildrenBeingCopiedToNewZone = self->_itemIDsWithChildrenBeingCopiedToNewZone;
        v59 = [v50 itemID];
        [(NSMutableSet *)itemIDsWithChildrenBeingCopiedToNewZone addObject:v59];

        char v113 = 1;
        if (v45)
        {
LABEL_66:
          v60 = [v50 asDirectory];
          int v61 = [v60 isDirectoryFault];

          if (!v61)
          {
LABEL_80:
            itemIDsNeedingDirectoryFetch = self->_itemIDsNeedingDirectoryFetch;
            v72 = [v50 itemID];
            [(NSMutableSet *)itemIDsNeedingDirectoryFetch addObject:v72];

            goto LABEL_81;
          }
LABEL_72:
          if ([v50 isSharedToMeTopLevelItem])
          {
            uint64_t v66 = brc_bread_crumbs();
            char v67 = brc_default_log();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)v123 = v50;
              *(_WORD *)&v123[8] = 2112;
              *(void *)&v123[10] = v66;
              _os_log_debug_impl(&dword_1D353B000, v67, OS_LOG_TYPE_DEBUG, "[DEBUG] Highest parent dead fault is nil because it's a shared-to-me top level item - %@%@", buf, 0x16u);
            }

            uint64_t v68 = 0;
          }
          else
          {
            long long v69 = brc_bread_crumbs();
            long long v70 = brc_default_log();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
            {
              v109 = [v50 itemID];
              v78 = [v109 itemIDString];
              *(_DWORD *)buf = 138412546;
              *(void *)v123 = v78;
              *(_WORD *)&v123[8] = 2112;
              *(void *)&v123[10] = v69;
              _os_log_debug_impl(&dword_1D353B000, v70, OS_LOG_TYPE_DEBUG, "[DEBUG] Highest parent dead fault is %@%@", buf, 0x16u);
            }
            uint64_t v68 = [v50 itemID];
          }

          __int16 v45 = (void *)v68;
          goto LABEL_80;
        }
      }
      else
      {
        char v113 = 0;
        if (v45) {
          goto LABEL_66;
        }
      }
      v62 = self->_itemIDsNeedingDirectoryFetch;
      long long v63 = [v50 itemID];
      if ([(NSMutableSet *)v62 containsObject:v63])
      {
      }
      else
      {
        uint64_t v64 = [v50 asDirectory];
        char v65 = [v64 containsDirFault];

        if ((v65 & 1) == 0)
        {
          __int16 v45 = 0;
          goto LABEL_81;
        }
      }
      goto LABEL_72;
    }
LABEL_81:
    if ([v50 isSharedToMeTopLevelItem]
      && [v50 isDirectory]
      && [v50 isAlmostDead]
      && [(BRCClientZone *)self->_clientZone isSharedZone])
    {
      v89 = brc_bread_crumbs();
      v90 = brc_default_log();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v123 = v50;
        *(_WORD *)&v123[8] = 2112;
        *(void *)&v123[10] = v89;
        _os_log_debug_impl(&dword_1D353B000, v90, OS_LOG_TYPE_DEBUG, "[DEBUG] denylist all children deletes when leaving top level folder share %@%@", buf, 0x16u);
      }

      [(BRCSyncUpEnumerator *)self _denyListDescendantStack:self->_stack parentItem:v50 andAddToSet:self->_itemIDsLostOrThrottled];
      if (!(v113 & 1 | (([v50 isDead] & 1) == 0)))
      {
        v91 = self->_itemIDsWithChildrenBeingCopiedToNewZone;
        v92 = [v50 itemID];
        LOBYTE(v91) = [(NSMutableSet *)v91 containsObject:v92];

        if ((v91 & 1) == 0)
        {
          objc_msgSend(*(id *)((char *)&self->super.super.isa + v47), "addIndex:", objc_msgSend(v50, "dbRowID"));
          id v107 = v50;
          goto LABEL_142;
        }
      }
LABEL_110:
      id v4 = v50;
      goto LABEL_111;
    }
    uint64_t v73 = [(NSMutableDictionary *)self->_visitedItemIDsToDepthMap objectForKey:v52];
    if (v73 && (v74 = (void *)v73, char v75 = [v50 isLost], v74, (v75 & 1) == 0))
    {
      if ([v50 isLive]) {
        goto LABEL_110;
      }
      if (([v50 isDead] & 1) == 0)
      {
        v79 = brc_bread_crumbs();
        v80 = brc_default_log();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v123 = v79;
          _os_log_fault_impl(&dword_1D353B000, v80, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: item.isDead%@", buf, 0xCu);
        }
      }
    }
    else
    {
      if ((v53 & 1) != 0
        || [(NSMutableSet *)self->_itemIDsLostOrThrottled containsObject:v52])
      {
        v83 = brc_bread_crumbs();
        v84 = brc_default_log();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v123 = v50;
          *(_WORD *)&v123[8] = 2112;
          *(void *)&v123[10] = v83;
          _os_log_debug_impl(&dword_1D353B000, v84, OS_LOG_TYPE_DEBUG, "[DEBUG] denylisting %@ and its descendants%@", buf, 0x16u);
        }

        [(BRCSyncUpEnumerator *)self _denyListDescendantStack:self->_stack parentItem:v50 andAddToSet:self->_itemIDsLostOrThrottled];
        goto LABEL_110;
      }
      if ([(BRCSyncUpEnumerator *)self handleItemForOSUpgrade:v50 parentItemID:v52])
      {
        goto LABEL_110;
      }
    }
    v76 = [v50 parentItemIDInZone];
    if ([v76 isNonDesktopRoot])
    {

      goto LABEL_110;
    }
    if (!v76) {
      break;
    }
    v77 = [v50 clientZone];
    id v4 = [v77 itemByItemID:v76];

    if (!v4) {
      break;
    }

    [(NSMutableArray *)self->_stack addObject:v4];
    v50 = v4;
    if ([(NSMutableArray *)self->_stack count] >= (unint64_t)self->_maxDepth) {
      goto LABEL_103;
    }
  }
  v103 = brc_bread_crumbs();
  v104 = brc_default_log();
  if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
  {
    clientZone = self->_clientZone;
    *(_DWORD *)buf = 138412802;
    *(void *)v123 = clientZone;
    *(_WORD *)&v123[8] = 2112;
    *(void *)&v123[10] = v50;
    *(_WORD *)&v123[18] = 2112;
    *(void *)&v123[20] = v103;
    _os_log_fault_impl(&dword_1D353B000, v104, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: reset needed for %@ because of orphan %@%@", buf, 0x20u);
  }

  [(BRCClientZone *)self->_clientZone scheduleResetServerAndClientTruthsForReason:@"orphan.tombstone"];
  id v107 = 0;
LABEL_142:
  uint64_t v3 = v112;

LABEL_143:
  id v4 = v50;
LABEL_144:

  return v107;
}

- (id)nextObject
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int stage = self->_stage;
  if (stage <= 3)
  {
    do
    {
      if ((stage - 1) > 1)
      {
        if (stage == 3)
        {
          id v4 = [(BRCSyncUpEnumerator *)self _nextTombstone];
          if (v4) {
            goto LABEL_26;
          }
        }
      }
      else
      {
        id v4 = [(BRCSyncUpEnumerator *)self _nextLiveItem];
        if (v4) {
          goto LABEL_26;
        }
      }
      int stage = self->_stage + 1;
      self->_int stage = stage;
      switch(stage)
      {
        case 0:
          enumerator = brc_bread_crumbs();
          id v6 = brc_default_log();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v16 = enumerator;
            _os_log_fault_impl(&dword_1D353B000, v6, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Sync: shouldn't be here%@", buf, 0xCu);
          }
          goto LABEL_22;
        case 1:
          char v7 = brc_bread_crumbs();
          BOOL v8 = brc_default_log();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v16 = v7;
            _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: enumerating documents needing sync up%@", buf, 0xCu);
          }

          BOOL v9 = [(BRCSyncUpEnumerator *)self _documentsOrAliasesNeedingSyncUpEnumerator];
          goto LABEL_19;
        case 2:
          uint64_t v10 = brc_bread_crumbs();
          BOOL v11 = brc_default_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v16 = v10;
            _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: enumerating live or new directories%@", buf, 0xCu);
          }

          BOOL v9 = [(BRCSyncUpEnumerator *)self _liveDirectoriesNeedingSyncUpEnumerator];
          goto LABEL_19;
        case 3:
          long long v12 = brc_bread_crumbs();
          uint64_t v13 = brc_default_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v16 = v12;
            _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: enumerating tombstones%@", buf, 0xCu);
          }

          BOOL v9 = [(BRCSyncUpEnumerator *)self _tombstoneLeavesNeedingSyncUpEnumerator];
LABEL_19:
          enumerator = self->_enumerator;
          self->_enumerator = v9;
          goto LABEL_23;
        case 4:
          enumerator = brc_bread_crumbs();
          id v6 = brc_default_log();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v16 = enumerator;
            _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: done enumerating all stages%@", buf, 0xCu);
          }
LABEL_22:

LABEL_23:
          int stage = self->_stage;
          break;
        default:
          break;
      }
    }
    while (stage < 4);
  }
  id v4 = 0;
LABEL_26:
  return v4;
}

- (unsigned)batchSize
{
  return self->_batchSize;
}

- (unint64_t)retryAfter
{
  return self->_retryAfter;
}

- (NSMutableSet)chainedParentIDAllowlist
{
  return self->_chainedParentIDAllowlist;
}

- (NSMutableArray)itemsNeedingUnshare
{
  return self->_itemsNeedingUnshare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsNeedingUnshare, 0);
  objc_storeStrong((id *)&self->_chainedParentIDAllowlist, 0);
  objc_storeStrong((id *)&self->_tooDeepItems, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_returned, 0);
  objc_storeStrong((id *)&self->_tombstonesEmbargo, 0);
  objc_storeStrong((id *)&self->_itemIDsWithChildrenBeingCopiedToNewZone, 0);
  objc_storeStrong((id *)&self->_itemIDsNeedingDirectoryFetch, 0);
  objc_storeStrong((id *)&self->_itemIDsNeedingOSUpgrade, 0);
  objc_storeStrong((id *)&self->_itemIDsLostOrThrottled, 0);
  objc_storeStrong((id *)&self->_visitedItemIDsToDepthMap, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

- (void)_denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:now:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Sync: denylist %@ because it needs a newer OS to sync up%@");
}

- (void)handleItemForOSUpgrade:parentItemID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] marking needs-upgrade %@ and its descendants%@");
}

- (void)_handleSharedItemWhichMovedToNewShare:rootItem:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Unexpected item %@. Ignoring%@", v1, 0x16u);
}

- (void)_handleSharedItemWhichMovedToNewShare:rootItem:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Just learning share property changes from %@%@");
}

- (void)_handleSharedItemWhichMovedToNewShare:rootItem:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] We need to unshare %@%@");
}

- (void)_checkForSharesWithinSharesWithItem:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because it is moving into a share and has shared children%@", buf, 0x16u);
}

- (void)_checkForSharesWithinSharesWithItem:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v5 = [a1 itemID];
  int v6 = 138412546;
  char v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ for item share-within-share processing%@", (uint8_t *)&v6, 0x16u);
}

- (void)_handlePendingShareItemWithPendingDeleteChildren:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Not waiting for deletes because of a default%@", (uint8_t *)&v2, 0xCu);
}

- (void)_nextLiveItem
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _stack.count == 0%@", (uint8_t *)&v2, 0xCu);
}

@end