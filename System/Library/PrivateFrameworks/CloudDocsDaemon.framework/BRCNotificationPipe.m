@interface BRCNotificationPipe
- (BOOL)isWatchingGlobalItemID:(id)a3;
- (BRCItemGlobalID)oldWatchedAncestorItemGlobalID;
- (BRCItemGlobalID)watchedAncestorItemGlobalID;
- (BRCNotificationManager)manager;
- (BRCNotificationPipe)initWithReceiver:(id)a3 manager:(id)a4 startingRank:(unint64_t)a5;
- (BRCNotificationPipe)initWithXPCReceiver:(id)a3 client:(id)a4 manager:(id)a5 startingRank:(unint64_t)a6;
- (BRCNotificationPipeDelegate)delegate;
- (BRFileObjectID)watchedAncestorFileObjectID;
- (NSString)description;
- (NSString)watchedAncestorFilenameToItem;
- (OS_dispatch_queue)queue;
- (id)_initWithManager:(id)a3 startingRank:(unint64_t)a4;
- (int)_isInterestingUpdate:(id)a3;
- (void)__flush;
- (void)__performBlockafterDBAndNotifFlush:(id)a3 session:(id)a4 description:(id)a5 error:(id)a6;
- (void)_addIntraContainerUpdatesFromInterContainerUpdate:(id)a3 toArray:(id)a4;
- (void)_flushProgressUpdates;
- (void)_gatherIfNeededAndFlushAsync;
- (void)_performBlock:(id)a3 whenNotifsAreFullyFlushedInAppLibrary:(id)a4 description:(id)a5;
- (void)_prepareForSecondGatherWithRank:(unint64_t)a3;
- (void)_processProgressUpdates:(id)a3;
- (void)_registerAsWatcherIfNeeded;
- (void)_stopWatchingItems;
- (void)_triggerImmediateReadOfDocumentIfNeeded;
- (void)_watchItem:(id)a3 options:(unsigned __int16)a4 gatherReply:(id)a5;
- (void)addDequeueCallback:(id)a3;
- (void)addNotification:(id)a3 asDead:(BOOL)a4;
- (void)boostPriority:(id)a3;
- (void)close;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateIfWatchingAppLibraryIDs:(id)a3;
- (void)invalidateReceiverIfWatchingAppLibraryIDs:(id)a3;
- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4;
- (void)processProgressUpdates:(id)a3;
- (void)processUpdates:(id)a3 withRank:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setOldWatchedAncestorItemGlobalID:(id)a3;
- (void)setWatchedAncestorFileObjectID:(id)a3;
- (void)setWatchedAncestorFilenameToItem:(id)a3;
- (void)setWatchedAncestorItemGlobalID:(id)a3;
- (void)watchItemAtURL:(id)a3 lookup:(id)a4 options:(unsigned __int16)a5 gatherReply:(id)a6;
- (void)watchItemAtURL:(id)a3 options:(unsigned __int16)a4 gatherReply:(id)a5;
- (void)watchItemInProcessAtURL:(id)a3 options:(unsigned __int16)a4 gatherReply:(id)a5;
- (void)watchItemWithFileObjectID:(id)a3 options:(unsigned __int16)a4 request:(id)a5 gatherReply:(id)a6;
- (void)watchItemsNamesPrefixedBy:(id)a3 inScopes:(unsigned __int16)a4 appLibraryIDs:(id)a5 gatherReply:(id)a6;
- (void)watchScopes:(unsigned __int16)a3 appLibraryIDs:(id)a4 gatherReply:(id)a5;
- (void)watchScopes:(unsigned __int16)a3 gatherReply:(id)a4;
- (void)watchScopes:(unsigned __int16)a3 trustedAppLibraryIDs:(id)a4 gatherReply:(id)a5;
@end

@implementation BRCNotificationPipe

- (void)dealloc
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _receiver == nil%@", v2, v3, v4, v5, v6);
}

- (void)_registerAsWatcherIfNeeded
{
  uint64_t v3 = [(BRCNotificationPipe *)self watchedAncestorFilenameToItem];

  if (!v3)
  {
    uint64_t v4 = [(BRCNotificationPipe *)self watchedAncestorFileObjectID];
    if (v4)
    {
      uint64_t v5 = v4;
      [(BRCNotificationManager *)self->_manager registerPipe:self asWatcherForFileObjectID:v4];
      uint64_t v4 = v5;
    }
  }
}

- (void)addNotification:(id)a3 asDead:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = [v6 appLibrary];
  if ([v6 isBRAlias]
    && v7
    && ([(NSMutableSet *)self->_externalAppLibraries containsObject:v7] & 1) == 0)
  {
    externalAppLibraries = self->_externalAppLibraries;
    if (!externalAppLibraries)
    {
      v9 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
      v10 = self->_externalAppLibraries;
      self->_externalAppLibraries = v9;

      externalAppLibraries = self->_externalAppLibraries;
    }
    [(NSMutableSet *)externalAppLibraries addObject:v7];
    v11 = [(BRCNotificationPipe *)self delegate];
    [v11 notificationPipe:self willObserveAppLibrary:v7];
  }
  client = self->_client;
  if (client
    && ![(BRCXPCClient *)client isSandboxed]
    && ![(BRCXPCClient *)self->_client hasPrivateSharingInterfaceEntitlement])
  {
    v13 = [v6 notificationByStrippingSharingInfoIfNeeded];
    if (v13)
    {
      v14 = brc_bread_crumbs();
      v15 = brc_notifications_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[BRCNotificationPipe addNotification:asDead:]();
      }

      id v16 = v13;
      id v6 = v16;
    }
  }
  [(BRNotificationQueue *)self->_notifs addNotification:v6 asDead:v4];
}

- (void)addDequeueCallback:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(BRNotificationQueue *)self->_notifs addDequeueCallback:v5];
}

- (id)_initWithManager:(id)a3 startingRank:(unint64_t)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BRCNotificationPipe;
  v8 = [(BRCNotificationPipe *)&v16 init];
  if (v8)
  {
    v9 = (BRNotificationQueue *)objc_alloc_init(MEMORY[0x1E4F594F0]);
    notifs = v8->_notifs;
    v8->_notifs = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingProgressUpdatesByID = v8->_pendingProgressUpdatesByID;
    v8->_pendingProgressUpdatesByID = v11;

    objc_storeStrong((id *)&v8->_manager, a3);
    v8->_initialGatherMaxRank = a4;
    uint64_t v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    recursiveScopeListOps = v8->_recursiveScopeListOps;
    v8->_recursiveScopeListOps = (NSHashTable *)v13;
  }
  return v8;
}

- (BRCNotificationPipe)initWithXPCReceiver:(id)a3 client:(id)a4 manager:(id)a5 startingRank:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = [(BRCNotificationPipe *)self _initWithManager:a5 startingRank:a6];
  if (v12)
  {
    uint64_t v13 = [v11 connection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __71__BRCNotificationPipe_initWithXPCReceiver_client_manager_startingRank___block_invoke;
    v20[3] = &unk_1E69939E8;
    v14 = v12;
    v21 = v14;
    uint64_t v15 = [v10 remoteObjectProxyWithErrorHandler:v20];
    receiver = v14->_receiver;
    v14->_receiver = (BRItemNotificationReceiving *)v15;

    uint64_t v17 = [v13 _queue];
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v14->_client, a4);
  }

  return v12;
}

void __71__BRCNotificationPipe_initWithXPCReceiver_client_manager_startingRank___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  memset(v7, 0, sizeof(v7));
  __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe initWithXPCReceiver:client:manager:startingRank:]_block_invoke", 483, v7);
  BOOL v4 = brc_bread_crumbs();
  id v5 = brc_notifications_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v7[0];
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx %@ got error %@%@", buf, 0x2Au);
  }

  [*(id *)(a1 + 32) invalidate];
  __brc_leave_section(v7);
}

- (BRCNotificationPipe)initWithReceiver:(id)a3 manager:(id)a4 startingRank:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [(BRCNotificationPipe *)self _initWithManager:v10 startingRank:a5];
  __int16 v12 = (BRCNotificationPipe *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 1, a3);
    id v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    __int16 v14 = dispatch_queue_attr_make_with_autorelease_frequency(v13, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.brc.pipe", v14);

    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v15;

    uint64_t v17 = [v10 session];
    v18 = [v17 volume];
    v12->_volumeIsCaseSensitive = [v18 isCaseSensitive];
  }
  return v12;
}

- (NSString)description
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:64];
  [v3 appendFormat:@"<%@ %p", objc_opt_class(), self];
  if (self->_client)
  {
    [v3 appendString:@" "];
    BOOL v4 = [(BRCXPCClient *)self->_client description];
    [v3 appendString:v4];
  }
  if (self->_gatherer) {
    [v3 appendString:@" gathering"];
  }
  if ([(NSSet *)self->_watchedAppLibraryIDs count])
  {
    id v5 = [(NSSet *)self->_watchedAppLibraryIDs allObjects];
    uint64_t v6 = [v5 componentsJoinedByString:@", "];
    [v3 appendFormat:@" {%@}", v6];
  }
  int watchKind = self->_watchKind;
  if (watchKind)
  {
    unsigned __int16 watchItemOptions = self->_watchItemOptions;
    __int16 v12 = @" {children of ";
    if ((watchItemOptions & 2) == 0) {
      __int16 v12 = @" {item at ";
    }
    if ((watchItemOptions & 4) != 0) {
      id v13 = @" {descendants of ";
    }
    else {
      id v13 = v12;
    }
    [v3 appendString:v13];
    __int16 v14 = [(BRCNotificationPipe *)self watchedAncestorItemGlobalID];

    if (v14)
    {
      dispatch_queue_t v15 = [(BRCNotificationPipe *)self watchedAncestorItemGlobalID];
      uint64_t v16 = [v15 description];
      [v3 appendString:v16];

      uint64_t v17 = [(BRCNotificationPipe *)self watchedAncestorFileObjectID];
    }
    else
    {
      v18 = [(BRCNotificationPipe *)self watchedAncestorFilenameToItem];

      uint64_t v17 = [(BRCNotificationPipe *)self watchedAncestorFileObjectID];
      if (v18)
      {
        v19 = [(BRCNotificationPipe *)self watchedAncestorFilenameToItem];
        [v3 appendFormat:@"[fid:%@ n:%@]", v17, v19];

        goto LABEL_32;
      }
    }

    if (!v17)
    {
LABEL_33:
      uint64_t v20 = BRCPrettyPrintBitmap();
      v21 = (void *)v20;
      if ((self->_watchKind & 0x20) != 0) {
        v22 = @"|withAliases";
      }
      else {
        v22 = &stru_1F2AC7720;
      }
      [v3 appendFormat:@" (%@%@)}", v20, v22];

      goto LABEL_37;
    }
    uint64_t v17 = [(BRCNotificationPipe *)self watchedAncestorFileObjectID];
    [v3 appendFormat:@"[fid:%@]", v17];
LABEL_32:

    goto LABEL_33;
  }
  if ((watchKind & 0x26) == 0) {
    goto LABEL_37;
  }
  [v3 appendString:@" {NSMDQ"];
  int v8 = self->_watchKind;
  if ((v8 & 4) == 0)
  {
    if ((v8 & 2) == 0) {
      goto LABEL_11;
    }
LABEL_41:
    [v3 appendString:@" docs"];
    int v8 = self->_watchKind;
    if ((v8 & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }
  [v3 appendString:@" data"];
  int v8 = self->_watchKind;
  if ((v8 & 2) != 0) {
    goto LABEL_41;
  }
LABEL_11:
  if ((v8 & 8) == 0) {
    goto LABEL_16;
  }
LABEL_12:
  if ((v8 & 0x80) != 0) {
    id v9 = @" dirs-only";
  }
  else {
    id v9 = @" dirs";
  }
  [v3 appendString:v9];
LABEL_16:
  int v10 = self->_watchKind;
  if ((v10 & 0x10) == 0)
  {
    if ((v10 & 0x20) == 0) {
      goto LABEL_18;
    }
LABEL_44:
    [v3 appendString:@" ext"];
    if ((self->_watchKind & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  [v3 appendString:@" faults"];
  int v10 = self->_watchKind;
  if ((v10 & 0x20) != 0) {
    goto LABEL_44;
  }
LABEL_18:
  if ((v10 & 0x40) != 0) {
LABEL_19:
  }
    [v3 appendString:@" trash"];
LABEL_20:
  [v3 appendString:@"}"];
LABEL_37:
  objc_msgSend(v3, "appendFormat:", @" queued:%ld>", -[BRNotificationQueue count](self->_notifs, "count"));
  return (NSString *)v3;
}

- (int)_isInterestingUpdate:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(BRCNotificationPipe *)self watchedAncestorFilenameToItem];

  if (v5)
  {
    uint64_t v6 = [(BRCNotificationPipe *)self watchedAncestorFileObjectID];

    if (v6)
    {
      id v7 = [v4 parentFileObjectID];
      int v8 = [(BRCNotificationPipe *)self watchedAncestorFileObjectID];
      int v9 = [v7 isEqualToFileObjectID:v8];
    }
    else
    {
      int v9 = 0;
    }
    int v10 = [(BRCNotificationPipe *)self watchedAncestorFilenameToItem];
    if (!v9
      || (uint64_t volumeIsCaseSensitive = self->_volumeIsCaseSensitive,
          [v4 logicalName],
          __int16 v12 = objc_claimAutoreleasedReturnValue(),
          LODWORD(volumeIsCaseSensitive) = objc_msgSend(v12, "br_isEqualToStringForHFS:isCaseSensitive:", v10, volumeIsCaseSensitive), v12, !volumeIsCaseSensitive))
    {
      v27 = brc_bread_crumbs();
      v28 = brc_notifications_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[BRCNotificationPipe _isInterestingUpdate:]5();
      }
      int v29 = 0;
      goto LABEL_127;
    }
    [(BRCNotificationPipe *)self setWatchedAncestorFilenameToItem:0];
    id v13 = [v4 fileObjectID];
    [(BRCNotificationPipe *)self setWatchedAncestorFileObjectID:v13];

    [(BRCNotificationPipe *)self _registerAsWatcherIfNeeded];
  }
  uint64_t v14 = [(BRCNotificationPipe *)self watchedAncestorFileObjectID];
  if (!v14) {
    goto LABEL_17;
  }
  dispatch_queue_t v15 = (void *)v14;
  uint64_t v16 = [v4 fileObjectID];
  uint64_t v17 = [(BRCNotificationPipe *)self watchedAncestorFileObjectID];
  int v18 = [v16 isEqualToFileObjectID:v17];

  if (v18)
  {
    v19 = [(BRCNotificationPipe *)self watchedAncestorItemGlobalID];
    uint64_t v20 = [v4 itemGlobalID];
    char v21 = [v19 isEqualToItemGlobalID:v20];

    if ((v21 & 1) == 0)
    {
      v22 = [(BRCNotificationPipe *)self watchedAncestorItemGlobalID];
      [(BRCNotificationPipe *)self setOldWatchedAncestorItemGlobalID:v22];

      v23 = [v4 itemGlobalID];
      [(BRCNotificationPipe *)self setWatchedAncestorItemGlobalID:v23];

      [(BRCNotificationPipe *)self _registerAsWatcherIfNeeded];
      v24 = [(BRCNotificationPipe *)self oldWatchedAncestorItemGlobalID];

      if (v24)
      {
        v25 = brc_bread_crumbs();
        v26 = brc_notifications_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          [(BRCNotificationPipe *)self _isInterestingUpdate:v26];
        }
      }
      else
      {
        v25 = brc_bread_crumbs();
        v26 = brc_notifications_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          [(BRCNotificationPipe *)self _isInterestingUpdate:v26];
        }
      }
    }
  }
  else
  {
LABEL_17:
    uint64_t v30 = [(BRCNotificationPipe *)self watchedAncestorItemGlobalID];
    if (v30)
    {
      v31 = (void *)v30;
      v32 = [v4 itemGlobalID];
      v33 = [(BRCNotificationPipe *)self watchedAncestorItemGlobalID];
      int v34 = [v32 isEqualToItemGlobalID:v33];

      if (v34)
      {
        v35 = [(BRCNotificationPipe *)self watchedAncestorFileObjectID];
        v36 = [v4 fileObjectID];
        char v37 = [v35 isEqualToFileObjectID:v36];

        if ((v37 & 1) == 0)
        {
          v38 = brc_bread_crumbs();
          v39 = brc_notifications_log();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            v68 = [(BRCNotificationPipe *)self watchedAncestorItemGlobalID];
            v69 = [v4 fileObjectID];
            v70 = [(BRCNotificationPipe *)self watchedAncestorFileObjectID];
            int v79 = 138413058;
            v80 = v68;
            __int16 v81 = 2112;
            v82 = v69;
            __int16 v83 = 2112;
            v84 = v70;
            __int16 v85 = 2112;
            v86 = v38;
            _os_log_debug_impl(&dword_1D353B000, v39, OS_LOG_TYPE_DEBUG, "[NOTIF] Learning new fileObjectID for %@: %@ (was %@)%@", (uint8_t *)&v79, 0x2Au);
          }
          v40 = [v4 fileObjectID];
          [(BRCNotificationPipe *)self setWatchedAncestorFileObjectID:v40];

          [(BRCNotificationPipe *)self _registerAsWatcherIfNeeded];
        }
      }
    }
  }
  int v10 = [(BRCNotificationPipe *)self watchedAncestorItemGlobalID];
  v27 = [(BRCNotificationPipe *)self watchedAncestorFileObjectID];
  if ([v4 isBRAlias])
  {
    watchedAppLibraryIDs = self->_watchedAppLibraryIDs;
    v42 = [v4 aliasSourceAppLibraryID];
    if ([(NSSet *)watchedAppLibraryIDs containsObject:v42]) {
      int v43 = (LOBYTE(self->_watchedAppLibrariesFlags) >> 2) & 1;
    }
    else {
      LOBYTE(v43) = 0;
    }
  }
  else
  {
    LOBYTE(v43) = 0;
  }
  int watchKind = self->_watchKind;
  if ((watchKind & 6) != 0)
  {
    v45 = [v4 appLibrary];
    int v46 = [v45 includesDataScope];

    int v47 = self->_watchKind;
    if ([v4 isDirectory] && (self->_watchKind & 8) == 0)
    {
      v28 = brc_bread_crumbs();
      v48 = brc_notifications_log();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
LABEL_85:
        int v29 = 0;
        goto LABEL_126;
      }
LABEL_36:
      -[BRCNotificationPipe _isInterestingUpdate:]();
      goto LABEL_85;
    }
    if ((v47 & 6) == 6) {
      int v49 = 0;
    }
    else {
      int v49 = v46;
    }
    if (v49 != 1)
    {
      if (![v4 isInTrashScope] || (self->_watchKind & 0x40) != 0)
      {
        v53 = self->_watchedAppLibraryIDs;
        v54 = [v4 appLibraryID];
        LOBYTE(v53) = [(NSSet *)v53 containsObject:v54] | v43;

        if (v53)
        {
          v28 = brc_bread_crumbs();
          v48 = brc_notifications_log();
          int v29 = 2;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
            -[BRCNotificationPipe _isInterestingUpdate:]1();
          }
          goto LABEL_126;
        }
        v28 = brc_bread_crumbs();
        v48 = brc_notifications_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
          -[BRCNotificationPipe _isInterestingUpdate:]2();
        }
      }
      else
      {
        v28 = brc_bread_crumbs();
        v48 = brc_notifications_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
          -[BRCNotificationPipe _isInterestingUpdate:]0();
        }
      }
      goto LABEL_125;
    }
    int watchKind = self->_watchKind;
  }
  if (watchKind)
  {
    if (self->_watchItemOptions)
    {
      if (v27)
      {
        v51 = [v4 fileObjectID];
        int v52 = [v51 isEqualToFileObjectID:v27];

        if (v52)
        {
          v28 = brc_bread_crumbs();
          v48 = brc_notifications_log();
          int v29 = 2;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
            -[BRCNotificationPipe _isInterestingUpdate:]8();
          }
          goto LABEL_126;
        }
      }
      if (v10)
      {
        v57 = [v4 itemGlobalID];
        int v58 = [v57 isEqualToItemGlobalID:v10];

        if (v58)
        {
          v28 = brc_bread_crumbs();
          v48 = brc_notifications_log();
          int v29 = 2;
          if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
LABEL_126:

LABEL_127:
            goto LABEL_128;
          }
          goto LABEL_118;
        }
      }
    }
    if ((self->_watchItemOptions & 2) != 0 && v27)
    {
      v59 = [v4 parentFileObjectID];
      int v60 = [v59 isEqualToFileObjectID:v27];

      if (v60)
      {
        v28 = brc_bread_crumbs();
        v48 = brc_notifications_log();
        int v29 = 2;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
          -[BRCNotificationPipe _isInterestingUpdate:]5();
        }
        goto LABEL_126;
      }
      v64 = [v4 oldParentFileObjectID];
      int v65 = [v64 isEqualToFileObjectID:v27];

      if (v65)
      {
        v28 = brc_bread_crumbs();
        v48 = brc_notifications_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
          -[BRCNotificationPipe _isInterestingUpdate:]6();
        }
        goto LABEL_125;
      }
    }
  }
  int v50 = [v4 isDocumentsFolder];
  if (v50 && (self->_watchItemOptions & 0x10) != 0)
  {
    v55 = [v4 appLibrary];
    v28 = [v55 containerMetadata];

    if ([v28 isDocumentScopePublic]
      && ([v28 isInInitialState] & 1) == 0)
    {
      v48 = brc_bread_crumbs();
      v56 = brc_notifications_log();
      int v29 = 2;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
        -[BRCNotificationPipe _isInterestingUpdate:]4();
      }
    }
    else
    {
      v48 = brc_bread_crumbs();
      v56 = brc_notifications_log();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
        -[BRCNotificationPipe _isInterestingUpdate:]3();
      }
      int v29 = 1;
    }

    goto LABEL_126;
  }
  if ((self->_watchKind & 0x46) != 0 || (self->_watchItemOptions & 4) != 0)
  {
    if (v50)
    {
      v28 = brc_bread_crumbs();
      v48 = brc_notifications_log();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
        -[BRCNotificationPipe _isInterestingUpdate:]();
      }
      goto LABEL_85;
    }
    if ([v4 isDirectory] && (self->_watchKind & 8) == 0)
    {
      v28 = brc_bread_crumbs();
      v48 = brc_notifications_log();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_85;
      }
      goto LABEL_36;
    }
    if (objc_msgSend(v4, "br_downloadStatus") == 1 && (self->_watchKind & 0x10) == 0)
    {
      v28 = brc_bread_crumbs();
      v48 = brc_notifications_log();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
        -[BRCNotificationPipe _isInterestingUpdate:]();
      }
      goto LABEL_85;
    }
    v61 = self->_watchedAppLibraryIDs;
    v62 = [v4 appLibraryID];
    LOBYTE(v61) = [(NSSet *)v61 containsObject:v62] | v43;

    if ((v61 & 1) == 0)
    {
      v28 = brc_bread_crumbs();
      v48 = brc_notifications_log();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
        -[BRCNotificationPipe _isInterestingUpdate:]2();
      }
      goto LABEL_125;
    }
    int v63 = self->_watchKind;
    if ((v63 & 0x46) != 0)
    {
      if ([v4 isInDocumentScope])
      {
        if ((self->_watchKind & 2) != 0)
        {
          v28 = brc_bread_crumbs();
          v48 = brc_notifications_log();
          int v29 = 2;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
            -[BRCNotificationPipe _isInterestingUpdate:].cold.9();
          }
          goto LABEL_126;
        }
      }
      else if ([v4 isInDataScope])
      {
        if ((self->_watchKind & 4) != 0)
        {
          v28 = brc_bread_crumbs();
          v48 = brc_notifications_log();
          int v29 = 2;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
            -[BRCNotificationPipe _isInterestingUpdate:]0();
          }
          goto LABEL_126;
        }
      }
      else if ([v4 isInTrashScope] && (self->_watchKind & 0x40) != 0)
      {
        v28 = brc_bread_crumbs();
        v48 = brc_notifications_log();
        int v29 = 2;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
          -[BRCNotificationPipe _isInterestingUpdate:]1();
        }
        goto LABEL_126;
      }
LABEL_119:
      if (([v4 diffs] & 0xC010) != 0)
      {
        v28 = brc_bread_crumbs();
        v48 = brc_notifications_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
          -[BRCNotificationPipe _isInterestingUpdate:].cold.5();
        }
      }
      else
      {
        if (![v4 isDead]) {
          goto LABEL_47;
        }
        v28 = brc_bread_crumbs();
        v48 = brc_notifications_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
          -[BRCNotificationPipe _isInterestingUpdate:].cold.4();
        }
      }
LABEL_125:
      int v29 = 1;
      goto LABEL_126;
    }
    if (!v10) {
      goto LABEL_119;
    }
    if ((v63 & 1) == 0)
    {
      v77 = brc_bread_crumbs();
      v78 = brc_default_log();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT)) {
        -[BRCNotificationPipe _isInterestingUpdate:].cold.8();
      }
    }
    v66 = [v4 parentGlobalIDs];
    int v67 = [v66 containsObject:v10];

    if (v67)
    {
      v28 = brc_bread_crumbs();
      v48 = brc_notifications_log();
      int v29 = 2;
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_126;
      }
    }
    else
    {
      uint64_t v71 = [(BRCNotificationPipe *)self oldWatchedAncestorItemGlobalID];
      if (!v71) {
        goto LABEL_119;
      }
      v72 = (void *)v71;
      v73 = [v4 parentGlobalIDs];
      v74 = [(BRCNotificationPipe *)self oldWatchedAncestorItemGlobalID];
      int v75 = [v73 containsObject:v74];

      if (!v75) {
        goto LABEL_119;
      }
      v28 = brc_bread_crumbs();
      v48 = brc_notifications_log();
      int v29 = 2;
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_126;
      }
    }
LABEL_118:
    -[BRCNotificationPipe _isInterestingUpdate:].cold.6();
    goto LABEL_126;
  }
LABEL_47:
  int v29 = 0;
LABEL_128:

  return v29;
}

- (void)_addIntraContainerUpdatesFromInterContainerUpdate:(id)a3 toArray:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v30 = a4;
  if ([v6 isBRAlias])
  {
    if ((self->_watchKind & 0x20) == 0) {
      goto LABEL_23;
    }
    watchedAppLibraryIDs = self->_watchedAppLibraryIDs;
    int v8 = [v6 aliasSourceAppLibraryID];
    LODWORD(watchedAppLibraryIDs) = [(NSSet *)watchedAppLibraryIDs containsObject:v8];

    if (!watchedAppLibraryIDs) {
      goto LABEL_23;
    }
LABEL_22:
    [v30 addObject:v6];
    goto LABEL_23;
  }
  int v9 = self->_watchedAppLibraryIDs;
  int v10 = [v6 appLibraryID];
  LOBYTE(v9) = [(NSSet *)v9 containsObject:v10];

  if (v9) {
    goto LABEL_8;
  }
  uint64_t v11 = [v6 oldAppLibraryID];
  if (!v11) {
    goto LABEL_9;
  }
  __int16 v12 = (void *)v11;
  id v13 = self->_watchedAppLibraryIDs;
  uint64_t v14 = [v6 oldAppLibraryID];
  LODWORD(v13) = [(NSSet *)v13 containsObject:v14];

  if (v13)
  {
LABEL_8:
    [v30 addObject:v6];
    char v15 = 1;
  }
  else
  {
LABEL_9:
    char v15 = 0;
  }
  if ((self->_watchKind & 0x20) != 0)
  {
    char v28 = v15;
    uint64_t v16 = (void *)[(NSSet *)self->_watchedAppLibraryIDs mutableCopy];
    uint64_t v17 = [v6 appLibraryIDsWithReverseAliases];
    [v16 intersectSet:v17];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v16;
    uint64_t v18 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
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
          v23 = [(BRCNotificationManager *)self->_manager session];
          v24 = [v23 appLibraryByID:v22];

          v25 = [v24 db];
          v26 = [v25 serialQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __81__BRCNotificationPipe__addIntraContainerUpdatesFromInterContainerUpdate_toArray___block_invoke;
          block[3] = &unk_1E6993600;
          id v32 = v24;
          id v33 = v6;
          id v34 = v30;
          id v27 = v24;
          dispatch_sync(v26, block);
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v19);
    }

    char v15 = v28;
  }
  if ((v15 & 1) == 0 && (self->_watchItemOptions & 0x10) != 0 && [v6 isDocumentsFolder]) {
    goto LABEL_22;
  }
LABEL_23:
}

void __81__BRCNotificationPipe__addIntraContainerUpdatesFromInterContainerUpdate_toArray___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) unsaltedBookmarkData];
  int v8 = [v2 aliasByUnsaltedBookmarkData:v3];

  id v4 = v8;
  if (v8)
  {
    char v5 = [v8 isDead];
    id v4 = v8;
    if ((v5 & 1) == 0)
    {
      id v6 = [v8 asBRAlias];
      id v7 = +[BRCNotification notificationWithAliasItem:v6 targetItemNotification:*(void *)(a1 + 40)];

      [*(id *)(a1 + 48) addObject:v7];
      id v4 = v8;
    }
  }
}

- (void)_prepareForSecondGatherWithRank:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_receiver)
  {
    char v5 = brc_bread_crumbs();
    id v6 = brc_notifications_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCNotificationPipe _prepareForSecondGatherWithRank:]();
    }

    dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
    if (self->_gatherer)
    {
      __int16 v12 = brc_bread_crumbs();
      id v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[BRCNotificationPipe _prepareForSecondGatherWithRank:]();
      }
    }
    id v7 = [BRCDataOrDocsScopeGatherer alloc];
    int v8 = [(NSSet *)self->_watchedAppLibraries allObjects];
    unint64_t initialGatherMaxRank = self->_initialGatherMaxRank;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__BRCNotificationPipe__prepareForSecondGatherWithRank___block_invoke;
    v14[3] = &unk_1E69939E8;
    v14[4] = self;
    int v10 = [(BRCDataOrDocsScopeGatherer *)v7 initWithNotificationPipe:self appLibraries:v8 startingRank:initialGatherMaxRank maxRank:a3 + 1 withDeadItems:1 gatherReply:v14];
    gatherer = self->_gatherer;
    self->_gatherer = v10;

    self->_unint64_t initialGatherMaxRank = 0;
  }
}

void __55__BRCNotificationPipe__prepareForSecondGatherWithRank___block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_notifications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __55__BRCNotificationPipe__prepareForSecondGatherWithRank___block_invoke_cold_1();
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 80));
}

- (void)processUpdates:(id)a3 withRank:(unint64_t)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_receiver)
  {
    if (self->_watchKind)
    {
      memset(v32, 0, sizeof(v32));
      __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe processUpdates:withRank:]", 872, v32);
      id v7 = brc_bread_crumbs();
      int v8 = brc_notifications_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219010;
        *(void *)&uint8_t buf[4] = v32[0];
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2112;
        id v35 = v6;
        __int16 v36 = 2048;
        unint64_t v37 = a4;
        __int16 v38 = 2112;
        v39 = v7;
        _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx %@: processing updates %@ [rank:%lld]%@", buf, 0x34u);
      }

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v35) = 0;
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__BRCNotificationPipe_processUpdates_withRank___block_invoke;
      block[3] = &unk_1E6995850;
      block[5] = buf;
      block[6] = a4;
      void block[4] = self;
      dispatch_sync(queue, block);
      int v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v11 = v6;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v28;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v28 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * v14);
            uint64_t v16 = (void *)MEMORY[0x1D9438760]();
            [(BRCNotificationPipe *)self _addIntraContainerUpdatesFromInterContainerUpdate:v15 toArray:v10];
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
        }
        while (v12);
      }

      uint64_t v17 = [v11 count];
      uint64_t v18 = [v10 count];
      uint64_t v19 = v17 - v18;
      if (v17 != v18)
      {
        if ([v10 count])
        {
          uint64_t v20 = brc_bread_crumbs();
          char v21 = brc_notifications_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            -[BRCNotificationPipe processUpdates:withRank:]((uint64_t)v20, v19, v21);
          }
        }
        else
        {
          uint64_t v20 = brc_bread_crumbs();
          char v21 = brc_notifications_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            -[BRCNotificationPipe processUpdates:withRank:]();
          }
        }
      }
      if ([v10 count] || *(unsigned char *)(*(void *)&buf[8] + 24))
      {
        v23 = self->_queue;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __47__BRCNotificationPipe_processUpdates_withRank___block_invoke_140;
        v24[3] = &unk_1E6993628;
        id v25 = v10;
        v26 = self;
        dispatch_sync(v23, v24);
      }
      _Block_object_dispose(buf, 8);
      __brc_leave_section(v32);
    }
    else
    {
      unint64_t initialGatherMaxRank = self->_initialGatherMaxRank;
      if (initialGatherMaxRank && initialGatherMaxRank < a4 && !self->_secondaryGatherMaxRank) {
        self->_secondaryGatherMaxRank = a4;
      }
    }
  }
}

void *__47__BRCNotificationPipe_processUpdates_withRank___block_invoke(void *a1)
{
  result = (void *)a1[4];
  unint64_t v3 = result[14];
  if (v3 && (unint64_t v4 = a1[6], v3 < v4) && !result[15])
  {
    if (result[9])
    {
      result[15] = v4;
    }
    else
    {
      result = objc_msgSend(result, "_prepareForSecondGatherWithRank:");
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    }
  }
  else if (!result[9] && !result[15])
  {
    result[14] = 0;
  }
  return result;
}

uint64_t __47__BRCNotificationPipe_processUpdates_withRank___block_invoke_140(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        int v8 = (void *)MEMORY[0x1D9438760](v3);
        int v9 = objc_msgSend(*(id *)(a1 + 40), "_isInterestingUpdate:", v7, (void)v11);
        if (v9) {
          [*(id *)(a1 + 40) addNotification:v7 asDead:v9 == 1];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v4 = v3;
    }
    while (v3);
  }

  return [*(id *)(a1 + 40) _gatherIfNeededAndFlushAsync];
}

- (void)__flush
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v4 = [v3 notifBatchSize];
  if (!self->_hasUpdatesInFlight)
  {
    uint64_t v5 = v4;
    if ([(BRNotificationQueue *)self->_notifs count])
    {
      notifs = self->_notifs;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __30__BRCNotificationPipe___flush__block_invoke;
      uint64_t v7[3] = &unk_1E6995878;
      v7[4] = self;
      [(BRNotificationQueue *)notifs dequeue:v5 block:v7];
    }
  }
}

void __30__BRCNotificationPipe___flush__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v30 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v29 = objc_opt_new();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = brc_bread_crumbs();
    uint64_t v17 = brc_notifications_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v43 = v27;
      __int16 v44 = 2048;
      uint64_t v45 = [v3 count];
      __int16 v46 = 2112;
      int v47 = v16;
      _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[NOTIF] %@: sending %ld notifications:%@", buf, 0x20u);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v18 = v3;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v19)
    {
      uint64_t v21 = v19;
      uint64_t v22 = *(void *)v37;
      *(void *)&long long v20 = 138412546;
      long long v28 = v20;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(v18);
          }
          uint64_t v24 = *(void *)(*((void *)&v36 + 1) + 8 * v23);
          id v25 = brc_bread_crumbs();
          v26 = brc_notifications_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v28;
            uint64_t v43 = v24;
            __int16 v44 = 2112;
            uint64_t v45 = (uint64_t)v25;
            _os_log_debug_impl(&dword_1D353B000, v26, OS_LOG_TYPE_DEBUG, "[NOTIF]   %@%@", buf, 0x16u);
          }

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v18 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v21);
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count", v28));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([*(id *)(*(void *)(a1 + 32) + 32) isSandboxed]) {
          [v10 generateLogicalExtension:v30 physicalExtension:v29];
        }
        if ([v10 isDocumentsFolder])
        {
          long long v11 = [v10 appLibrary];
          long long v12 = [v11 containerMetadata];
          long long v13 = +[BRQueryItem containerItemForContainer:v12 withRepresentativeItem:v10];
          [v4 addObject:v13];
        }
        else
        {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v7);
  }

  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(v14 + 8);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __30__BRCNotificationPipe___flush__block_invoke_142;
  v31[3] = &unk_1E6993698;
  v31[4] = v14;
  [v15 receiveUpdates:v4 logicalExtensions:v30 physicalExtensions:v29 reply:v31];
}

void __30__BRCNotificationPipe___flush__block_invoke_142(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  memset(v17, 0, sizeof(v17));
  __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe __flush]_block_invoke", 981, v17);
  id v2 = brc_bread_crumbs();
  id v3 = brc_notifications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)block = 134218498;
    *(void *)&void block[4] = v17[0];
    *(_WORD *)&block[12] = 2112;
    *(void *)&block[14] = v13;
    *(_WORD *)&block[22] = 2112;
    uint64_t v21 = v2;
    _os_log_debug_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx %@: received notification acknowledgement%@", block, 0x20u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 136);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __30__BRCNotificationPipe___flush__block_invoke_143;
  v16[3] = &unk_1E6993698;
  v16[4] = v4;
  uint64_t v6 = v5;
  uint64_t v7 = v16;
  uint64_t v8 = (void *)MEMORY[0x1D9438760]();
  long long v18 = 0uLL;
  uint64_t v19 = 0;
  __brc_create_section(0, (uint64_t)"brc_dispatch_async_autorelease_with_logs", 276, &v18);
  int v9 = brc_bread_crumbs();
  int v10 = brc_notifications_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = v18;
    label = dispatch_queue_get_label(v6);
    *(_DWORD *)block = 134218498;
    *(void *)&void block[4] = v14;
    *(_WORD *)&block[12] = 2080;
    *(void *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    uint64_t v21 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[NOTIF] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  long long v24 = v18;
  uint64_t v25 = v19;
  *(void *)block = MEMORY[0x1E4F143A8];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = __brc_dispatch_async_autorelease_with_logs_block_invoke_0;
  uint64_t v21 = &unk_1E6993710;
  long long v11 = v6;
  uint64_t v22 = v11;
  long long v12 = v7;
  id v23 = v12;
  dispatch_async(v11, block);

  __brc_leave_section(v17);
}

uint64_t __30__BRCNotificationPipe___flush__block_invoke_143(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 0;
  [*(id *)(*(void *)(a1 + 32) + 16) processDequeueCallbacks];
  id v2 = *(void **)(a1 + 32);
  return [v2 _gatherIfNeededAndFlushAsync];
}

- (void)_gatherIfNeededAndFlushAsync
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] %@: client is really backlogged, invalidating%@");
}

void __51__BRCNotificationPipe__gatherIfNeededAndFlushAsync__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 136));
  id v5 = *(void **)(a1 + 32);
  if (a2) {
    goto LABEL_6;
  }
  if ((id)v5[9] == v6)
  {
    v5[9] = 0;

    id v5 = *(void **)(a1 + 32);
  }
  if (!v5[15] || v5[9])
  {
LABEL_6:
    objc_msgSend(v5, "__flush");
  }
  else
  {
    objc_msgSend(v5, "_prepareForSecondGatherWithRank:");
    *(void *)(*(void *)(a1 + 32) + 120) = 0;
    [*(id *)(a1 + 32) _gatherIfNeededAndFlushAsync];
  }
}

- (void)_stopWatchingItems
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_watchedAppLibrariesFlags)
  {
    -[BRCNotificationManager unregisterAppLibraries:forFlags:](self->_manager, "unregisterAppLibraries:forFlags:", self->_watchedAppLibraries);
    self->_watchedAppLibrariesFlags = 0;
  }
  [(BRCNotificationManager *)self->_manager unregisterPipeAsWatcher:self];
  id v3 = [(BRCNotificationPipe *)self delegate];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v4 = self->_watchedAppLibraries;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v32;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v4);
        }
        [v3 notificationPipe:self didObserveAppLibrary:*(void *)(*((void *)&v31 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v5);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = self->_externalAppLibraries;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v28;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v8);
        }
        [v3 notificationPipe:self didObserveAppLibrary:*(void *)(*((void *)&v27 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v9);
  }

  watchedAppLibraries = self->_watchedAppLibraries;
  self->_watchedAppLibraries = 0;

  [(BRCNotificationPipe *)self setWatchedAncestorFileObjectID:0];
  [(BRCNotificationPipe *)self setWatchedAncestorItemGlobalID:0];
  [(BRCNotificationPipe *)self setWatchedAncestorFilenameToItem:0];
  [(BRCDataOrDocsScopeGatherer *)self->_gatherer invalidate];
  gatherer = self->_gatherer;
  self->_gatherer = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_listOp);
  uint64_t v15 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained endObservingChangesWithDelegate:self];
    objc_storeWeak((id *)&self->_listOp, 0);
  }
  uint64_t v16 = self;
  objc_sync_enter(v16);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v17 = v16->_recursiveScopeListOps;
  uint64_t v18 = [(NSHashTable *)v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v20++), "endObservingChanges", (void)v23);
      }
      while (v18 != v20);
      uint64_t v18 = [(NSHashTable *)v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v18);
  }

  [(NSHashTable *)v16->_recursiveScopeListOps removeAllObjects];
  objc_sync_exit(v16);

  boostReply = (void (**)(void))v16->_boostReply;
  if (boostReply)
  {
    boostReply[2]();
    id v22 = v16->_boostReply;
    v16->_boostReply = 0;
  }
}

- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4
{
  id obj = a4;
  p_listOp = &self->_listOp;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_listOp);

  if (WeakRetained == v7) {
    objc_storeWeak((id *)p_listOp, obj);
  }
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__BRCNotificationPipe_close__block_invoke;
  block[3] = &unk_1E6993698;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __28__BRCNotificationPipe_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)__performBlockafterDBAndNotifFlush:(id)a3 session:(id)a4 description:(id)a5 error:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = brc_bread_crumbs();
  uint64_t v15 = brc_notifications_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v28 = v12;
    __int16 v29 = 2112;
    long long v30 = self;
    __int16 v31 = 2112;
    long long v32 = v14;
    _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[NOTIF] Waiting for db flush for %@ in %@%@", buf, 0x20u);
  }

  uint64_t v16 = [v11 clientTruthWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke;
  block[3] = &unk_1E6995940;
  id v22 = v11;
  id v23 = v12;
  id v25 = v13;
  id v26 = v10;
  long long v24 = self;
  id v17 = v13;
  id v18 = v10;
  id v19 = v12;
  id v20 = v11;
  dispatch_async(v16, block);
}

void __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) clientDB];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_2;
  v10[3] = &unk_1E6993A60;
  id v11 = *(id *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_3;
  v5[3] = &unk_1E6995918;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  id v9 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 56);
  [v2 performWithFlags:0 action:v10 whenFlushed:v5];
}

uint64_t __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_2(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 32) clientDB];
  [v1 forceBatchStart];

  return 1;
}

void __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_3(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  id v3 = brc_notifications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_3_cold_1(a1, (uint64_t)v2, v3);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(NSObject **)(v4 + 136);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_147;
  v6[3] = &unk_1E69958F0;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  dispatch_async(v5, v6);
}

void __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_147(id *a1)
{
  objc_initWeak(&location, a1[4]);
  id v2 = a1[4];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_2_148;
  v3[3] = &unk_1E69958C8;
  objc_copyWeak(&v7, &location);
  id v4 = a1[5];
  id v6 = a1[7];
  id v5 = a1[6];
  [v2 addDequeueCallback:v3];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_2_148(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = brc_bread_crumbs();
  id v4 = brc_notifications_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412802;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = WeakRetained;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[NOTIF] Finished gather group for %@ in %@%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_performBlock:(id)a3 whenNotifsAreFullyFlushedInAppLibrary:(id)a4 description:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 session];
  uint64_t v12 = brc_bread_crumbs();
  id v13 = brc_notifications_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v22 = v10;
    __int16 v23 = 2112;
    long long v24 = self;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[NOTIF] Waiting for faulting for %@ in %@%@", buf, 0x20u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__BRCNotificationPipe__performBlock_whenNotifsAreFullyFlushedInAppLibrary_description___block_invoke;
  uint64_t v17[3] = &unk_1E6995968;
  v17[4] = self;
  id v18 = v11;
  id v19 = v10;
  id v20 = v8;
  id v14 = v10;
  id v15 = v11;
  id v16 = v8;
  [v9 notifyClient:@"nsmdq" whenFaultingIsDone:v17];
}

void __87__BRCNotificationPipe__performBlock_whenNotifsAreFullyFlushedInAppLibrary_description___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      __87__BRCNotificationPipe__performBlock_whenNotifsAreFullyFlushedInAppLibrary_description___block_invoke_cold_1();
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "__performBlockafterDBAndNotifFlush:session:description:error:", *(void *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48), v3);
}

- (void)watchScopes:(unsigned __int16)a3 trustedAppLibraryIDs:(id)a4 gatherReply:(id)a5
{
  unsigned int v55 = a3;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v49 = a4;
  int v50 = (void (**)(id, void *))a5;
  memset(v81, 0, sizeof(v81));
  __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe watchScopes:trustedAppLibraryIDs:gatherReply:]", 1187, v81);
  uint64_t v7 = brc_bread_crumbs();
  id v8 = brc_notifications_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134220290;
    *(void *)&uint8_t buf[4] = v81[0];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&unsigned char buf[24] = v55 & 1;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = (v55 >> 1) & 1;
    *(_WORD *)&buf[34] = 1024;
    *(_DWORD *)&buf[36] = (v55 >> 2) & 1;
    LOWORD(v85) = 1024;
    *(_DWORD *)((char *)&v85 + 2) = (v55 >> 3) & 1;
    HIWORD(v85) = 1024;
    int v86 = (v55 >> 4) & 1;
    __int16 v87 = 1024;
    int v88 = 0;
    __int16 v89 = 2112;
    id v90 = v49;
    __int16 v91 = 2112;
    v92 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx %@: starting watching ubiquitous scope (docs:%d data:%d ext:%d dirs:%d faults:%d trash:%d) for %@%@", buf, 0x4Eu);
  }

  if (self->_watchKind)
  {
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      int watchKind = self->_watchKind;
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = watchKind;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v9;
      _os_log_error_impl(&dword_1D353B000, v10, (os_log_type_t)0x90u, "[ERROR] %@: EALREADY: watch already set up to kind %d%@", buf, 0x1Cu);
    }

    id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 37);
    v50[2](v50, v11);
  }
  else if ((2 * v55) & 6 | (32 * ((v55 >> 2) & 1)))
  {
    v54 = [(BRCNotificationManager *)self->_manager session];
    id v52 = [MEMORY[0x1E4F1CA80] setWithArray:v49];
    id obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v49, "count"));
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v12 = v49;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v77 objects:v83 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v78 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v77 + 1) + 8 * i);
          id v17 = [v54 appLibraryByID:v16];
          if (v17)
          {
            [obj addObject:v17];
          }
          else
          {
            id v18 = brc_bread_crumbs();
            id v19 = brc_default_log();
            if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = self;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v16;
              *(_WORD *)&buf[22] = 2112;
              *(void *)&unsigned char buf[24] = v18;
              _os_log_error_impl(&dword_1D353B000, v19, (os_log_type_t)0x90u, "[ERROR] %@: unable to find container %@%@", buf, 0x20u);
            }

            [v52 removeObject:v16];
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v77 objects:v83 count:16];
      }
      while (v13);
    }

    if ([obj count])
    {
      objc_storeStrong((id *)&self->_watchedAppLibraries, obj);
      objc_storeStrong((id *)&self->_watchedAppLibraryIDs, v52);
      self->_watchedAppLibrariesFlags = 3;
      id v20 = (OS_dispatch_group *)dispatch_group_create();
      gatherGroup = self->_gatherGroup;
      self->_gatherGroup = v20;

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      *(void *)&unsigned char buf[24] = __Block_byref_object_copy__10;
      *(void *)&buf[32] = __Block_byref_object_dispose__10;
      id v85 = 0;
      objc_initWeak(&location, self);
      if ((self->_watchKind & 0x20) != 0) {
        self->_watchedAppLibrariesFlags |= 4uLL;
      }
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      v51 = self->_watchedAppLibraries;
      uint64_t v22 = [(NSSet *)v51 countByEnumeratingWithState:&v72 objects:v82 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v73;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v73 != v23) {
              objc_enumerationMutation(v51);
            }
            __int16 v25 = *(void **)(*((void *)&v72 + 1) + 8 * j);
            id v26 = [(BRCNotificationPipe *)self delegate];
            [v26 notificationPipe:self willObserveAppLibrary:v25];

            if (v55)
            {
              uint64_t v27 = [v25 dbRowID];
              id v28 = +[BRCItemID documentsItemIDWithAppLibraryRowID:v27];

              dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
              __int16 v29 = [v25 db];
              long long v30 = [v29 serialQueue];
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke;
              block[3] = &unk_1E69959B8;
              void block[4] = v25;
              id v68 = v28;
              v69 = self;
              id v31 = v28;
              objc_copyWeak(&v71, &location);
              v70 = buf;
              dispatch_async(v30, block);

              objc_destroyWeak(&v71);
            }
            if ((v55 & 2) != 0)
            {
              long long v32 = [v25 rootItemID];
              dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
              uint64_t v33 = [v25 db];
              long long v34 = [v33 serialQueue];
              v62[0] = MEMORY[0x1E4F143A8];
              v62[1] = 3221225472;
              v62[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3;
              v62[3] = &unk_1E69959B8;
              v62[4] = v25;
              id v63 = v32;
              v64 = self;
              id v35 = v32;
              objc_copyWeak(&v66, &location);
              int v65 = buf;
              dispatch_async(v34, v62);

              objc_destroyWeak(&v66);
            }
          }
          uint64_t v22 = [(NSSet *)v51 countByEnumeratingWithState:&v72 objects:v82 count:16];
        }
        while (v22);
      }

      [(BRCNotificationManager *)self->_manager registerAppLibraries:self->_watchedAppLibraries forFlags:self->_watchedAppLibrariesFlags];
      dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      long long v36 = [BRCDataOrDocsScopeGatherer alloc];
      long long v37 = [obj allObjects];
      unint64_t initialGatherMaxRank = self->_initialGatherMaxRank;
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3_157;
      v60[3] = &unk_1E69959E0;
      objc_copyWeak(&v61, &location);
      v60[4] = buf;
      long long v39 = [(BRCDataOrDocsScopeGatherer *)v36 initWithNotificationPipe:self appLibraries:v37 startingRank:1 maxRank:initialGatherMaxRank withDeadItems:0 gatherReply:v60];
      gatherer = self->_gatherer;
      self->_gatherer = v39;

      self->_int watchKind = (2 * (_BYTE)v55) & 0x80 | v55 & 0x18 | (2 * v55) & 6 | (32 * ((v55 >> 2) & 1));
      v41 = self->_gatherGroup;
      v42 = [(BRCNotificationPipe *)self queue];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_158;
      v56[3] = &unk_1E6995A08;
      objc_copyWeak(&v59, &location);
      v57 = v50;
      int v58 = buf;
      dispatch_group_notify(v41, v42, v56);

      [(BRCNotificationPipe *)self _gatherIfNeededAndFlushAsync];
      objc_destroyWeak(&v59);
      objc_destroyWeak(&v61);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      uint64_t v45 = brc_bread_crumbs();
      __int16 v46 = brc_default_log();
      if (os_log_type_enabled(v46, (os_log_type_t)0x90u)) {
        -[BRCNotificationPipe watchScopes:trustedAppLibraryIDs:gatherReply:]();
      }

      int v47 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 2);
      v50[2](v50, v47);
    }
    id v11 = v54;
  }
  else
  {
    uint64_t v43 = brc_bread_crumbs();
    __int16 v44 = brc_default_log();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v43;
      _os_log_impl(&dword_1D353B000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] %@: client didn't specify Document or Data Scope%@", buf, 0x16u);
    }

    id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 22);
    v50[2](v50, v11);
  }

  __brc_leave_section(v81);
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) defaultClientZone];
  id v3 = [v2 fetchRecursiveDirectoryContentsIfNecessary:*(void *)(a1 + 40) isUserWaiting:1 rescheduleApply:1];

  if (v3)
  {
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_notifications_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_2();
    }

    [v3 beginObservingChanges];
    id v6 = *(id *)(a1 + 48);
    objc_sync_enter(v6);
    [*(id *)(*(void *)(a1 + 48) + 192) addObject:v3];
    objc_sync_exit(v6);

    objc_initWeak(&location, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_154;
    v10[3] = &unk_1E6995990;
    objc_copyWeak(&v11, (id *)(a1 + 64));
    objc_copyWeak(&v12, &location);
    uint64_t v7 = *(void *)(a1 + 56);
    void v10[4] = *(void *)(a1 + 32);
    v10[5] = v7;
    [v3 addRecursiveDirectoryListCompletionBlock:v10];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_notifications_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_1();
    }

    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 48) + 80));
  }
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_154(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v6 = (id *)WeakRetained;
    objc_sync_enter(v6);
    [v6[24] removeObject:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v7 + 40);
    id v8 = (id *)(v7 + 40);
    id v9 = v10;
    if (v10) {
      id v11 = v9;
    }
    else {
      id v11 = v3;
    }
    objc_storeStrong(v8, v11);
    objc_sync_exit(v6);

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2;
    v15[3] = &unk_1E6995358;
    uint64_t v13 = a1 + 32;
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v14 = objc_msgSend(v5, "description", MEMORY[0x1E4F143A8], 3221225472, __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2, &unk_1E6995358, v6, *(void *)(v13 + 8));
    [v6 _performBlock:v15 whenNotifsAreFullyFlushedInAppLibrary:v12 description:v14];
  }
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v10 = a2;
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  uint64_t v7 = v8;
  id v9 = v10;
  if (v8) {
    id v9 = v7;
  }
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 80));
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) defaultClientZone];
  id v3 = [v2 fetchRecursiveDirectoryContentsIfNecessary:*(void *)(a1 + 40) isUserWaiting:1 rescheduleApply:1];

  if (v3)
  {
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_notifications_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_2();
    }

    [v3 beginObservingChanges];
    id v6 = *(id *)(a1 + 48);
    objc_sync_enter(v6);
    [*(id *)(*(void *)(a1 + 48) + 192) addObject:v3];
    objc_sync_exit(v6);

    objc_initWeak(&location, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_155;
    v10[3] = &unk_1E6995990;
    objc_copyWeak(&v11, (id *)(a1 + 64));
    objc_copyWeak(&v12, &location);
    uint64_t v7 = *(void *)(a1 + 56);
    void v10[4] = *(void *)(a1 + 32);
    v10[5] = v7;
    [v3 addRecursiveDirectoryListCompletionBlock:v10];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_notifications_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_1();
    }

    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 48) + 80));
  }
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_155(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v6 = (id *)WeakRetained;
    objc_sync_enter(v6);
    [v6[24] removeObject:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v7 + 40);
    id v8 = (id *)(v7 + 40);
    id v9 = v10;
    if (v10) {
      id v11 = v9;
    }
    else {
      id v11 = v3;
    }
    objc_storeStrong(v8, v11);
    objc_sync_exit(v6);

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2_156;
    v15[3] = &unk_1E6995358;
    uint64_t v13 = a1 + 32;
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v14 = objc_msgSend(v5, "description", MEMORY[0x1E4F143A8], 3221225472, __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2_156, &unk_1E6995358, v6, *(void *)(v13 + 8));
    [v6 _performBlock:v15 whenNotifsAreFullyFlushedInAppLibrary:v12 description:v14];
  }
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2_156(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v10 = a2;
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  uint64_t v7 = v8;
  id v9 = v10;
  if (v8) {
    id v9 = v7;
  }
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 80));
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3_157(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (dispatch_group_t *)WeakRetained;
    objc_sync_enter(v6);
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(void **)(v7 + 40);
    id v8 = (id *)(v7 + 40);
    id v9 = v10;
    if (v10) {
      id v11 = v9;
    }
    else {
      id v11 = v3;
    }
    objc_storeStrong(v8, v11);
    objc_sync_exit(v6);

    uint64_t v12 = brc_bread_crumbs();
    uint64_t v13 = brc_notifications_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3_157_cold_1();
    }

    dispatch_group_leave(v6[10]);
  }
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_158(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = brc_bread_crumbs();
  id v4 = brc_notifications_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_158_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

- (void)_watchItem:(id)a3 options:(unsigned __int16)a4 gatherReply:(id)a5
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  if (self->_watchKind)
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      int watchKind = self->_watchKind;
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = watchKind;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v10;
      _os_log_error_impl(&dword_1D353B000, v11, (os_log_type_t)0x90u, "[ERROR] %@: EALREADY: watch already set up to kind %d%@", buf, 0x1Cu);
    }

    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 37);
    v9[2](v9, v12);

    goto LABEL_35;
  }
  if (v8)
  {
    [(BRCNotificationPipe *)self setWatchedAncestorFilenameToItem:0];
    uint64_t v13 = [v8 fileObjectID];
    [(BRCNotificationPipe *)self setWatchedAncestorFileObjectID:v13];

    uint64_t v14 = [v8 itemGlobalID];
    [(BRCNotificationPipe *)self setWatchedAncestorItemGlobalID:v14];

    id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v16 = [v8 appLibrary];
    id v85 = v16;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
    id v18 = (NSSet *)[v15 initWithArray:v17];
    watchedAppLibraries = self->_watchedAppLibraries;
    self->_watchedAppLibraries = v18;

    id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v21 = [v8 appLibrary];
    uint64_t v22 = [v21 appLibraryID];
    v84 = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
    long long v24 = (NSSet *)[v20 initWithArray:v23];
    watchedAppLibraryIDs = self->_watchedAppLibraryIDs;
    self->_watchedAppLibraryIDs = v24;

LABEL_8:
    [(BRCNotificationPipe *)self _registerAsWatcherIfNeeded];
    self->_unsigned __int16 watchItemOptions = a4;
    uint64_t v27 = (OS_dispatch_group *)dispatch_group_create();
    gatherGroup = self->_gatherGroup;
    self->_gatherGroup = v27;

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&unsigned char buf[24] = __Block_byref_object_copy__10;
    v82 = __Block_byref_object_dispose__10;
    id v83 = 0;
    objc_initWeak(&location, self);
    if (!self->_watchedAncestorFileObjectID || ![v8 isDirectory])
    {
LABEL_28:
      if ((a4 & 4) != 0) {
        uint64_t v43 = 3;
      }
      else {
        uint64_t v43 = 1;
      }
      dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      if (self->_gatherer)
      {
        v56 = brc_bread_crumbs();
        v57 = brc_default_log();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT)) {
          -[BRCNotificationPipe _prepareForSecondGatherWithRank:]();
        }
      }
      __int16 v44 = [BRCDataOrDocsScopeGatherer alloc];
      uint64_t v45 = [(NSSet *)self->_watchedAppLibraries allObjects];
      unint64_t initialGatherMaxRank = self->_initialGatherMaxRank;
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_165;
      v69[3] = &unk_1E69959E0;
      objc_copyWeak(&v70, &location);
      v69[4] = buf;
      int v47 = [(BRCDataOrDocsScopeGatherer *)v44 initWithNotificationPipe:self appLibraries:v45 startingRank:1 maxRank:initialGatherMaxRank withDeadItems:0 gatherReply:v69];
      gatherer = self->_gatherer;
      self->_gatherer = v47;

      self->_int watchKind = 1;
      id v49 = self->_gatherGroup;
      int v50 = [(BRCNotificationPipe *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_166;
      block[3] = &unk_1E6995A08;
      objc_copyWeak(&v68, &location);
      id v66 = v9;
      int v67 = buf;
      dispatch_group_notify(v49, v50, block);

      if ((a4 & 8) != 0)
      {
        v51 = [(BRCNotificationPipe *)self watchedAncestorItemGlobalID];
        [(BRCDataOrDocsScopeGatherer *)self->_gatherer setGatheredChildrenItemGlobalID:v51];
      }
      queue = self->_queue;
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_167;
      v61[3] = &unk_1E6995A58;
      v61[4] = self;
      id v63 = buf;
      uint64_t v64 = v43;
      id v62 = v8;
      v53 = v61;
      *(void *)from = MEMORY[0x1E4F143A8];
      *(void *)&from[8] = 3221225472;
      *(void *)&from[16] = __brc_dispatch_async_autorelease_block_invoke;
      __int16 v87 = &unk_1E6995800;
      id v88 = v53;
      v54 = queue;
      dispatch_async(v54, from);

      objc_destroyWeak(&v68);
      objc_destroyWeak(&v70);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

      goto LABEL_35;
    }
    int v60 = [v8 clientZone];
    __int16 v29 = [v8 appLibrary];
    if ((a4 & 4) != 0)
    {
      long long v39 = [v8 itemID];
      id v31 = [v60 fetchRecursiveDirectoryContentsIfNecessary:v39 isUserWaiting:1 rescheduleApply:1];

      if (v31)
      {
        uint64_t v40 = brc_bread_crumbs();
        v41 = brc_notifications_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)from = 138412802;
          *(void *)&from[4] = v31;
          *(_WORD *)&from[12] = 2112;
          *(void *)&from[14] = self;
          *(_WORD *)&from[22] = 2112;
          __int16 v87 = v40;
          _os_log_debug_impl(&dword_1D353B000, v41, OS_LOG_TYPE_DEBUG, "[NOTIF] Waiting on gather group for %@ in %@%@", from, 0x20u);
        }

        dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      }
      [v31 beginObservingChanges];
      v42 = self;
      objc_sync_enter(v42);
      [(NSHashTable *)v42->_recursiveScopeListOps addObject:v31];
      objc_sync_exit(v42);

      objc_initWeak((id *)from, v31);
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke;
      v75[3] = &unk_1E6995990;
      objc_copyWeak(&v78, &location);
      objc_copyWeak(&v79, (id *)from);
      long long v77 = buf;
      id v76 = v29;
      [v31 addRecursiveDirectoryListCompletionBlock:v75];

      objc_destroyWeak(&v79);
      objc_destroyWeak(&v78);
      objc_destroyWeak((id *)from);
    }
    else
    {
      if ((a4 & 2) == 0)
      {
LABEL_27:

        goto LABEL_28;
      }
      long long v30 = [(BRCItemGlobalID *)self->_watchedAncestorItemGlobalID itemID];
      id v31 = [v60 fetchDirectoryContentsIfNecessary:v30 isUserWaiting:1 rescheduleApplyScheduler:1];

      [v31 beginObservingChangesWithDelegate:self];
      if (v31)
      {
        long long v32 = brc_bread_crumbs();
        uint64_t v33 = brc_notifications_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)from = 138412802;
          *(void *)&from[4] = v31;
          *(_WORD *)&from[12] = 2112;
          *(void *)&from[14] = self;
          *(_WORD *)&from[22] = 2112;
          __int16 v87 = v32;
          _os_log_debug_impl(&dword_1D353B000, v33, OS_LOG_TYPE_DEBUG, "[NOTIF] Waiting on gather group for %@ in %@%@", from, 0x20u);
        }

        dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_listOp);
      BOOL v35 = WeakRetained == 0;

      if (!v35)
      {
        int v58 = brc_bread_crumbs();
        id v59 = brc_default_log();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT)) {
          -[BRCNotificationPipe _watchItem:options:gatherReply:]();
        }
      }
      objc_storeWeak((id *)&self->_listOp, v31);
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_163;
      v71[3] = &unk_1E6995A30;
      objc_copyWeak(&v74, &location);
      v71[4] = self;
      long long v73 = buf;
      id v72 = v29;
      [v31 addDirectoryListCompletionBlock:v71];

      objc_destroyWeak(&v74);
    }

    goto LABEL_27;
  }
  id v26 = [(BRCNotificationPipe *)self watchedAncestorFilenameToItem];

  if (v26) {
    goto LABEL_8;
  }
  long long v36 = brc_bread_crumbs();
  long long v37 = brc_default_log();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
    -[BRCNotificationPipe _watchItem:options:gatherReply:]();
  }

  uint64_t v38 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: Invalid notification pipe setup");
  v9[2](v9, v38);

LABEL_35:
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v6 = (id *)WeakRetained;
    objc_sync_enter(v6);
    [v6[24] removeObject:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v7 + 40);
    id v8 = (id *)(v7 + 40);
    id v9 = v10;
    if (v10) {
      id v11 = v9;
    }
    else {
      id v11 = v3;
    }
    objc_storeStrong(v8, v11);
    objc_sync_exit(v6);

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_2;
    v15[3] = &unk_1E6995358;
    uint64_t v13 = a1 + 32;
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v14 = objc_msgSend(v5, "description", MEMORY[0x1E4F143A8], 3221225472, __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_2, &unk_1E6995358, v6, *(void *)(v13 + 8));
    [v6 _performBlock:v15 whenNotifsAreFullyFlushedInAppLibrary:v12 description:v14];
  }
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v10 = a2;
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  uint64_t v7 = v8;
  id v9 = v10;
  if (v8) {
    id v9 = v7;
  }
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 80));
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_163(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = brc_bread_crumbs();
  id v6 = brc_notifications_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v20 = v17;
    __int16 v21 = 2112;
    id v22 = v3;
    __int16 v23 = 2112;
    id v24 = WeakRetained;
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[NOTIF] %@ - Calling the list completion block with %@, sself = %@%@", buf, 0x2Au);
  }

  if (WeakRetained)
  {
    uint64_t v7 = (id *)WeakRetained;
    objc_sync_enter(v7);
    id v8 = objc_loadWeakRetained(v7 + 18);
    objc_storeWeak(v7 + 18, 0);
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void **)(v9 + 40);
    id v10 = (id *)(v9 + 40);
    id v11 = v12;
    if (v12) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v3;
    }
    objc_storeStrong(v10, v13);
    objc_sync_exit(v7);

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_164;
    v18[3] = &unk_1E6995358;
    uint64_t v15 = a1 + 40;
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v16 = objc_msgSend(v8, "description", MEMORY[0x1E4F143A8], 3221225472, __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_164, &unk_1E6995358, v7, *(void *)(v15 + 8));
    [v7 _performBlock:v18 whenNotifsAreFullyFlushedInAppLibrary:v14 description:v16];
  }
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_164(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v10 = a2;
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  uint64_t v7 = v8;
  uint64_t v9 = v10;
  if (v8) {
    uint64_t v9 = v7;
  }
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 80));
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_165(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (dispatch_group_t *)WeakRetained;
    objc_sync_enter(v6);
    uint64_t v7 = brc_bread_crumbs();
    id v8 = brc_notifications_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3_157_cold_1();
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = *(void **)(v9 + 40);
    id v10 = (id *)(v9 + 40);
    id v11 = v12;
    if (v12) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v3;
    }
    objc_storeStrong(v10, v13);
    dispatch_group_leave(v6[10]);
    objc_sync_exit(v6);
  }
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_166(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = brc_bread_crumbs();
  id v4 = brc_notifications_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_166_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_167(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8))
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v3 = *(id *)(v2 + 184);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v43 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v28 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v8 = [*(id *)(a1 + 32) delegate];
          [v8 notificationPipe:*(void *)(a1 + 32) willObserveAppLibrary:v7];
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v43 count:16];
      }
      while (v4);
    }

    *(void *)(*(void *)(a1 + 32) + 208) = *(void *)(a1 + 56);
    [*(id *)(*(void *)(a1 + 32) + 128) registerAppLibraries:*(void *)(*(void *)(a1 + 32) + 184) forFlags:*(void *)(a1 + 56)];
    uint64_t v9 = brc_bread_crumbs();
    id v10 = brc_notifications_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v19 = *(void **)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 40);
      __int16 v21 = [v19 watchedAncestorFileObjectID];
      id v22 = [*(id *)(a1 + 32) watchedAncestorItemGlobalID];
      uint64_t v23 = [*(id *)(a1 + 32) watchedAncestorFilenameToItem];
      id v24 = (void *)v23;
      __int16 v25 = &stru_1F2AC7720;
      *(_DWORD *)buf = 138413570;
      if (v23) {
        __int16 v25 = (__CFString *)v23;
      }
      long long v32 = v19;
      __int16 v33 = 2112;
      uint64_t v34 = v20;
      __int16 v35 = 2112;
      long long v36 = v21;
      __int16 v37 = 2112;
      uint64_t v38 = v22;
      __int16 v39 = 2112;
      uint64_t v40 = v25;
      __int16 v41 = 2112;
      v42 = v9;
      _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[NOTIF] %@: started watching children of %@ (fsid:%@ id:%@ filename:%@)%@", buf, 0x3Eu);
    }
    [*(id *)(a1 + 32) _gatherIfNeededAndFlushAsync];
  }
  else
  {
    id obj = (id)v2;
    objc_sync_enter(obj);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v13;
    }
    else
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 4);
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v14 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }

    [*(id *)(*(void *)(a1 + 32) + 72) invalidate];
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(void **)(v17 + 72);
    *(void *)(v17 + 72) = 0;

    objc_sync_exit(obj);
  }
}

- (void)invalidateIfWatchingAppLibraryIDs:(id)a3
{
  if ([(NSSet *)self->_watchedAppLibraryIDs intersectsSet:a3])
  {
    [(BRCNotificationPipe *)self close];
  }
}

- (void)invalidateReceiverIfWatchingAppLibraryIDs:(id)a3
{
  if ([(NSSet *)self->_watchedAppLibraryIDs intersectsSet:a3])
  {
    receiver = self->_receiver;
    [(BRItemNotificationReceiving *)receiver invalidate];
  }
}

- (BOOL)isWatchingGlobalItemID:(id)a3
{
  return [(BRCItemGlobalID *)self->_watchedAncestorItemGlobalID isEqualToItemGlobalID:a3];
}

- (BRCNotificationManager)manager
{
  return self->_manager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BRCNotificationPipeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BRCNotificationPipeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BRCItemGlobalID)oldWatchedAncestorItemGlobalID
{
  return (BRCItemGlobalID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOldWatchedAncestorItemGlobalID:(id)a3
{
}

- (BRCItemGlobalID)watchedAncestorItemGlobalID
{
  return (BRCItemGlobalID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWatchedAncestorItemGlobalID:(id)a3
{
}

- (BRFileObjectID)watchedAncestorFileObjectID
{
  return (BRFileObjectID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWatchedAncestorFileObjectID:(id)a3
{
}

- (NSString)watchedAncestorFilenameToItem
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setWatchedAncestorFilenameToItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_watchedAppLibraryIDs, 0);
  objc_storeStrong((id *)&self->_recursiveScopeListOps, 0);
  objc_storeStrong((id *)&self->_watchedAppLibraries, 0);
  objc_storeStrong((id *)&self->_externalAppLibraries, 0);
  objc_storeStrong((id *)&self->_watchForBundleID, 0);
  objc_storeStrong((id *)&self->_watchNamePrefix, 0);
  objc_destroyWeak((id *)&self->_listOp);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_pendingProgressUpdatesByID, 0);
  objc_storeStrong((id *)&self->_gatherGroup, 0);
  objc_storeStrong((id *)&self->_gatherer, 0);
  objc_storeStrong((id *)&self->_watchedAncestorFilenameToItem, 0);
  objc_storeStrong((id *)&self->_watchedAncestorFileObjectID, 0);
  objc_storeStrong((id *)&self->_watchedAncestorItemGlobalID, 0);
  objc_storeStrong((id *)&self->_oldWatchedAncestorItemGlobalID, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong(&self->_boostReply, 0);
  objc_storeStrong((id *)&self->_notifs, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
}

- (void)watchItemsNamesPrefixedBy:(id)a3 inScopes:(unsigned __int16)a4 appLibraryIDs:(id)a5 gatherReply:(id)a6
{
  uint64_t v8 = a4;
  id v9 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (BRCNotificationPipe *)a3;
  id v12 = a5;
  id v13 = a6;
  memset(v30, 0, sizeof(v30));
  __brc_create_section(1, (uint64_t)"-[BRCNotificationPipe(IPCs) watchItemsNamesPrefixedBy:inScopes:appLibraryIDs:gatherReply:]", 1564, v30);
  uint64_t v14 = brc_bread_crumbs();
  uint64_t v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v27 = v13;
    id v16 = v9;
    id v17 = v12;
    id v18 = v11;
    uint64_t v19 = v8;
    uint64_t v20 = v30[0];
    qos_class_t v21 = qos_class_self();
    id v22 = BRCPrettyPrintEnumWithContext(v21, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    long long v32 = (BRCNotificationPipe *)v20;
    __int16 v33 = 2112;
    uint64_t v34 = self;
    __int16 v35 = 2112;
    long long v36 = v22;
    __int16 v37 = 2080;
    uint64_t v38 = "-[BRCNotificationPipe(IPCs) watchItemsNamesPrefixedBy:inScopes:appLibraryIDs:gatherReply:]";
    __int16 v39 = 2112;
    uint64_t v40 = v14;
    _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    uint64_t v8 = v19;
    uint64_t v11 = v18;
    id v12 = v17;
    id v9 = v16;
    id v13 = v27;
  }

  client = self->_client;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __90__BRCNotificationPipe_IPCs__watchItemsNamesPrefixedBy_inScopes_appLibraryIDs_gatherReply___block_invoke;
  v28[3] = &unk_1E69957B0;
  v28[4] = self;
  id v24 = v13;
  id v29 = v24;
  LODWORD(client) = _brc_ipc_check_logged_status(client, 1, v28);

  if (client)
  {
    __int16 v25 = brc_bread_crumbs();
    id v26 = brc_notifications_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      long long v32 = self;
      __int16 v33 = 2112;
      uint64_t v34 = v11;
      __int16 v35 = 2112;
      long long v36 = v25;
      _os_log_debug_impl(&dword_1D353B000, v26, OS_LOG_TYPE_DEBUG, "[NOTIF] %@: watching items prefixed by \"%@\"%@", buf, 0x20u);
    }

    objc_storeStrong((id *)&self->_watchNamePrefix, v9);
    [(BRCNotificationPipe *)self watchScopes:v8 appLibraryIDs:v12 gatherReply:v24];
  }
  __brc_leave_section(v30);
}

void __90__BRCNotificationPipe_IPCs__watchItemsNamesPrefixedBy_inScopes_appLibraryIDs_gatherReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)watchScopes:(unsigned __int16)a3 appLibraryIDs:(id)a4 gatherReply:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  memset(v25, 0, sizeof(v25));
  __brc_create_section(1, (uint64_t)"-[BRCNotificationPipe(IPCs) watchScopes:appLibraryIDs:gatherReply:]", 1579, v25);
  id v10 = brc_bread_crumbs();
  __int16 v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v25[0];
    qos_class_t v13 = qos_class_self();
    uint64_t v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v27 = v12;
    __int16 v28 = 2112;
    id v29 = self;
    __int16 v30 = 2112;
    id v31 = v14;
    __int16 v32 = 2080;
    __int16 v33 = "-[BRCNotificationPipe(IPCs) watchScopes:appLibraryIDs:gatherReply:]";
    __int16 v34 = 2112;
    __int16 v35 = v10;
    _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  client = self->_client;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __67__BRCNotificationPipe_IPCs__watchScopes_appLibraryIDs_gatherReply___block_invoke;
  qos_class_t v21 = &unk_1E6995A80;
  id v22 = self;
  id v16 = v8;
  id v23 = v16;
  id v17 = v9;
  id v24 = v17;
  LODWORD(client) = _brc_ipc_check_applibrary_proxy(client, 1, &v18);

  if (client) {
    -[BRCNotificationPipe watchScopes:trustedAppLibraryIDs:gatherReply:](self, "watchScopes:trustedAppLibraryIDs:gatherReply:", v6, v16, v17, v18, v19, v20, v21, v22);
  }
  __brc_leave_section(v25);
}

void __67__BRCNotificationPipe_IPCs__watchScopes_appLibraryIDs_gatherReply___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
  {
    id v9 = (void *)a1[5];
    uint64_t v10 = *(void *)(a1[4] + 32);
    int v11 = 138413058;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    _os_log_error_impl(&dword_1D353B000, v5, (os_log_type_t)0x90u, "[ERROR] %@: can't watch %@: %@%@", (uint8_t *)&v11, 0x2Au);
  }

  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = a1[4];
    int v11 = 138412802;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v11, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)watchScopes:(unsigned __int16)a3 gatherReply:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCNotificationPipe(IPCs) watchScopes:gatherReply:]", 1589, v18);
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v18[0];
    qos_class_t v10 = qos_class_self();
    int v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    id v22 = self;
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 2080;
    id v26 = "-[BRCNotificationPipe(IPCs) watchScopes:gatherReply:]";
    __int16 v27 = 2112;
    __int16 v28 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  client = self->_client;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__BRCNotificationPipe_IPCs__watchScopes_gatherReply___block_invoke;
  v16[3] = &unk_1E69957B0;
  v16[4] = self;
  id v13 = v6;
  id v17 = v13;
  LODWORD(client) = _brc_ipc_check_applibraries_access(client, 1, v16);

  if (client)
  {
    id v14 = [(BRCXPCClient *)self->_client entitledAppLibraryIDs];
    __int16 v15 = [v14 allObjects];

    [(BRCNotificationPipe *)self watchScopes:v4 trustedAppLibraryIDs:v15 gatherReply:v13];
  }
  __brc_leave_section(v18);
}

void __53__BRCNotificationPipe_IPCs__watchScopes_gatherReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32);
    int v10 = 138412802;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    __int16 v15 = v4;
    _os_log_error_impl(&dword_1D353B000, v5, (os_log_type_t)0x90u, "[ERROR] %@: can't watch app containers: %@%@", (uint8_t *)&v10, 0x20u);
  }

  id v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138412802;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    __int16 v15 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v10, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)boostPriority:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v13, 0, sizeof(v13));
  __brc_create_section(1, (uint64_t)"-[BRCNotificationPipe(IPCs) boostPriority:]", 1596, v13);
  uint64_t v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v13[0];
    qos_class_t v8 = qos_class_self();
    uint64_t v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    id v17 = self;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    __int16 v20 = 2080;
    __int16 v21 = "-[BRCNotificationPipe(IPCs) boostPriority:]";
    __int16 v22 = 2112;
    __int16 v23 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  boostReply = (void (**)(void))self->_boostReply;
  if (boostReply) {
    boostReply[2]();
  }
  uint64_t v11 = (void *)MEMORY[0x1D94389C0](v4);
  id v12 = self->_boostReply;
  self->_boostReply = v11;

  __brc_leave_section(v13);
}

- (void)watchItemWithFileObjectID:(id)a3 options:(unsigned __int16)a4 request:(id)a5 gatherReply:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(BRCNotificationManager *)self->_manager session];
  __int16 v14 = brc_bread_crumbs();
  uint64_t v15 = brc_notifications_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[BRCNotificationPipe(IPCs) watchItemWithFileObjectID:options:request:gatherReply:]();
  }

  __int16 v16 = [v13 clientTruthWorkloop];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __83__BRCNotificationPipe_IPCs__watchItemWithFileObjectID_options_request_gatherReply___block_invoke;
  v21[3] = &unk_1E6995AA8;
  id v22 = v13;
  id v23 = v10;
  __int16 v25 = self;
  id v26 = v12;
  id v24 = v11;
  unsigned __int16 v27 = a4;
  id v17 = v11;
  id v18 = v12;
  id v19 = v10;
  id v20 = v13;
  dispatch_async_with_logs_2(v16, v21);
}

void __83__BRCNotificationPipe_IPCs__watchItemWithFileObjectID_options_request_gatherReply___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) itemByFileObjectID:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 appLibrary];
    uint64_t v5 = [v4 appLibraryID];
    if (v5)
    {
      int v6 = [*(id *)(a1 + 48) isSystemRequest];
      if (v4) {
        BOOL v7 = v6 == 0;
      }
      else {
        BOOL v7 = 1;
      }
      if (v7 || ([v4 isAppInstalled] & 1) != 0)
      {
        if ([v3 isZoneRoot])
        {
          [*(id *)(a1 + 56) setWatchedAncestorFilenameToItem:0];
          [*(id *)(a1 + 56) setWatchedAncestorFileObjectID:*(void *)(a1 + 40)];
        }
        else
        {
          id v17 = [v3 st];
          id v18 = [v17 logicalName];
          [*(id *)(a1 + 56) setWatchedAncestorFilenameToItem:v18];

          id v19 = [v3 parentFileObjectID];
          [*(id *)(a1 + 56) setWatchedAncestorFileObjectID:v19];
        }
        [*(id *)(a1 + 56) setWatchedAncestorItemGlobalID:0];
        id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        __int16 v33 = v4;
        __int16 v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
        uint64_t v22 = [v20 initWithArray:v21];
        uint64_t v23 = *(void *)(a1 + 56);
        id v24 = *(void **)(v23 + 184);
        *(void *)(v23 + 184) = v22;

        id v25 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        __int16 v32 = v5;
        id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
        uint64_t v27 = [v25 initWithArray:v26];
        uint64_t v28 = *(void *)(a1 + 56);
        uint64_t v29 = *(void **)(v28 + 200);
        *(void *)(v28 + 200) = v27;

        [*(id *)(a1 + 56) _watchItem:v3 options:*(unsigned __int16 *)(a1 + 72) gatherReply:*(void *)(a1 + 64)];
      }
      else
      {
        __int16 v30 = brc_bread_crumbs();
        id v31 = brc_notifications_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          __83__BRCNotificationPipe_IPCs__watchItemWithFileObjectID_options_request_gatherReply___block_invoke_cold_1();
        }

        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
    }
    else
    {
      id v12 = brc_bread_crumbs();
      id v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        uint64_t v35 = v14;
        __int16 v36 = 2112;
        uint64_t v37 = 0;
        __int16 v38 = 2112;
        __int16 v39 = v12;
        _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Path %@ is not an existing app library: %@%@", buf, 0x20u);
      }

      uint64_t v15 = *(void *)(a1 + 64);
      __int16 v16 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 22);
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
    }
  }
  else
  {
    qos_class_t v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v35 = v10;
      __int16 v36 = 2112;
      uint64_t v37 = 0;
      __int16 v38 = 2112;
      __int16 v39 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Path %@ is not an existing container: %@%@", buf, 0x20u);
    }

    uint64_t v11 = *(void *)(a1 + 64);
    id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 22);
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v4);
  }
}

- (void)_triggerImmediateReadOfDocumentIfNeeded
{
  id v3 = [(BRCNotificationPipe *)self watchedAncestorFilenameToItem];

  if (!v3)
  {
    id v4 = [(BRCNotificationPipe *)self watchedAncestorFileObjectID];
    int v5 = [v4 isDocumentID];

    if (v5)
    {
      int v6 = [(BRCNotificationManager *)self->_manager session];
      BOOL v7 = [(BRCNotificationPipe *)self watchedAncestorFileObjectID];
      qos_class_t v8 = [v6 clientDB];
      uint64_t v9 = [v8 serialQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __68__BRCNotificationPipe_IPCs___triggerImmediateReadOfDocumentIfNeeded__block_invoke;
      v12[3] = &unk_1E6993628;
      id v13 = v6;
      id v14 = v7;
      id v10 = v7;
      id v11 = v6;
      dispatch_async_with_logs_2(v9, v12);
    }
  }
}

void __68__BRCNotificationPipe_IPCs___triggerImmediateReadOfDocumentIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) documentID];
  id v4 = objc_msgSend(v2, "globalItemByDocumentID:", objc_msgSend(v3, "unsignedIntValue"));

  if (v4)
  {
    int v5 = [[BRCItemToPathLookup alloc] initWithItem:v4];
    int v6 = [(BRCItemToPathLookup *)v5 byFileSystemID];
    BOOL v7 = v6;
    if (v6)
    {
      int v14 = 0;
      if ([v6 resolveMustExist:0 error:&v14])
      {
        qos_class_t v8 = [*(id *)(a1 + 32) clientDB];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __68__BRCNotificationPipe_IPCs___triggerImmediateReadOfDocumentIfNeeded__block_invoke_2;
        v11[3] = &unk_1E6995AD0;
        id v12 = *(id *)(a1 + 32);
        id v13 = v7;
        [v8 groupInBatch:v11];

        uint64_t v9 = v12;
      }
      else
      {
        uint64_t v9 = brc_bread_crumbs();
        id v10 = brc_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          __int16 v16 = v7;
          __int16 v17 = 1024;
          int v18 = v14;
          __int16 v19 = 2112;
          id v20 = v9;
          _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] can't resolve %@ %{errno}d%@", buf, 0x1Cu);
        }
      }
    }
  }
}

void __68__BRCNotificationPipe_IPCs___triggerImmediateReadOfDocumentIfNeeded__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fsReader];
  [v2 fseventAtPath:*(void *)(a1 + 40) flags:0 options:1 unresolvedLastPathComponent:0];
}

- (void)invalidate
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  memset(v13, 0, sizeof(v13));
  __brc_create_section(1, (uint64_t)"-[BRCNotificationPipe(IPCs) invalidate]", 1688, v13);
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = v13[0];
    qos_class_t v6 = qos_class_self();
    BOOL v7 = BRCPrettyPrintEnumWithContext(v6, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    __int16 v17 = self;
    __int16 v18 = 2112;
    __int16 v19 = v7;
    __int16 v20 = 2080;
    uint64_t v21 = "-[BRCNotificationPipe(IPCs) invalidate]";
    __int16 v22 = 2112;
    uint64_t v23 = v3;
    _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  if (self->_receiver)
  {
    memset(v12, 0, sizeof(v12));
    __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe(IPCs) invalidate]", 1695, v12);
    qos_class_t v8 = brc_bread_crumbs();
    uint64_t v9 = brc_notifications_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v15 = v12[0];
      __int16 v16 = 2112;
      __int16 v17 = self;
      __int16 v18 = 2112;
      __int16 v19 = v8;
      _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx invalidating %@%@", buf, 0x20u);
    }

    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    [(BRCNotificationPipe *)self _triggerImmediateReadOfDocumentIfNeeded];
    [(BRCNotificationPipe *)self _stopWatchingItems];
    client = self->_client;
    self->_client = 0;

    [(BRItemNotificationReceiving *)self->_receiver invalidate];
    [(BRNotificationQueue *)self->_notifs removeAllObjects];
    receiver = self->_receiver;
    self->_receiver = 0;

    self->_hasUpdatesInFlight = 0;
    __brc_leave_section(v12);
  }
  __brc_leave_section(v13);
}

- (void)watchItemAtURL:(id)a3 options:(unsigned __int16)a4 gatherReply:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCNotificationPipe(LegacyAdditions) watchItemAtURL:options:gatherReply:]", 39, v24);
  id v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v24[0];
    qos_class_t v13 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v8 path];
    *(_DWORD *)buf = 134219266;
    uint64_t v26 = v12;
    __int16 v27 = 2112;
    uint64_t v28 = self;
    __int16 v29 = 2112;
    id v30 = v14;
    __int16 v31 = 2080;
    __int16 v32 = "-[BRCNotificationPipe(LegacyAdditions) watchItemAtURL:options:gatherReply:]";
    __int16 v33 = 2112;
    __int16 v34 = v15;
    __int16 v35 = 2112;
    __int16 v36 = v10;
    _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  client = self->_client;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_options_gatherReply___block_invoke;
  v19[3] = &unk_1E69970E0;
  id v17 = v8;
  id v20 = v17;
  uint64_t v21 = self;
  id v18 = v9;
  id v22 = v18;
  unsigned __int16 v23 = a4;
  _brc_ipc_check_url_access(client, (const char *)1, (uint64_t)v17, 1, 0, (uint64_t)v19);

  __brc_leave_section(v24);
}

void __75__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_options_gatherReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe(LegacyAdditions) watchItemAtURL:options:gatherReply:]_block_invoke", 31, v17);
  BOOL v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = v17[0];
    __int16 v16 = [*(id *)(a1 + 32) path];
    *(_DWORD *)buf = 134218498;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    id v21 = v16;
    __int16 v22 = 2112;
    unsigned __int16 v23 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx watching '%@'%@", buf, 0x20u);
  }
  if (v6)
  {
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [*(id *)(a1 + 32) path];
      *(_DWORD *)buf = 138412802;
      uint64_t v19 = (uint64_t)v11;
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      unsigned __int16 v23 = v9;
      _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed watching %@ - %@%@", buf, 0x20u);
    }
    uint64_t v12 = brc_bread_crumbs();
    qos_class_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      unsigned __int16 v23 = v12;
      _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 40) watchItemAtURL:*(void *)(a1 + 32) lookup:v5 options:*(unsigned __int16 *)(a1 + 56) gatherReply:*(void *)(a1 + 48)];
  }
  __brc_leave_section(v17);
}

- (void)watchItemAtURL:(id)a3 lookup:(id)a4 options:(unsigned __int16)a5 gatherReply:(id)a6
{
  v102[1] = *MEMORY[0x1E4F143B8];
  id v71 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *))a6;
  if (!self->_watchKind)
  {
    unsigned __int16 v68 = a5;
    uint64_t v15 = [v10 relpath];
    uint64_t v14 = [v15 appLibrary];

    v69 = [v14 appLibraryID];
    if (!v14 || !v69)
    {
      __int16 v22 = brc_bread_crumbs();
      unsigned __int16 v23 = brc_default_log();
      if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&unsigned char buf[24] = v10;
        LOWORD(v100) = 2112;
        *(void *)((char *)&v100 + 2) = v22;
        _os_log_error_impl(&dword_1D353B000, v23, (os_log_type_t)0x90u, "[ERROR] %@: Invalid watched app library (%@) for lookup: %@%@", buf, 0x2Au);
      }

      id v70 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 22);
      v11[2](v11, v70);
      goto LABEL_28;
    }
    v102[0] = v14;
    id v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:1];
    v101 = v69;
    int v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
    __int16 v16 = [v10 relpath];
    int v17 = [v16 exists];

    if (v17)
    {
      [(BRCNotificationPipe *)self setWatchedAncestorFilenameToItem:0];
      id v18 = [v10 relpath];
      uint64_t v19 = [v18 fileObjectID];
      [(BRCNotificationPipe *)self setWatchedAncestorFileObjectID:v19];

      __int16 v20 = [v10 byIDLocalItem];
      id v21 = [v20 itemGlobalID];
      [(BRCNotificationPipe *)self setWatchedAncestorItemGlobalID:v21];
    }
    else
    {
      uint64_t v24 = [v10 faultedRelpath];
      int v25 = [v24 exists];

      if (v25)
      {
        [(BRCNotificationPipe *)self setWatchedAncestorFilenameToItem:0];
        uint64_t v26 = [v10 faultedRelpath];
        __int16 v27 = [v26 fileObjectID];
        [(BRCNotificationPipe *)self setWatchedAncestorFileObjectID:v27];

        uint64_t v28 = [v10 faultedLocalItem];
        __int16 v29 = [v28 itemGlobalID];
        [(BRCNotificationPipe *)self setWatchedAncestorItemGlobalID:v29];
      }
      else
      {
        id v30 = [v10 filename];
        [(BRCNotificationPipe *)self setWatchedAncestorFilenameToItem:v30];

        __int16 v31 = [v10 parentRelpath];
        __int16 v32 = [v31 fileObjectID];
        [(BRCNotificationPipe *)self setWatchedAncestorFileObjectID:v32];

        [(BRCNotificationPipe *)self setWatchedAncestorItemGlobalID:0];
      }
    }
    [(BRCNotificationPipe *)self _registerAsWatcherIfNeeded];
    self->_unsigned __int16 watchItemOptions = v68;
    __int16 v33 = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v70];
    watchedAppLibraries = self->_watchedAppLibraries;
    self->_watchedAppLibraries = v33;

    __int16 v35 = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v67];
    watchedAppLibraryIDs = self->_watchedAppLibraryIDs;
    self->_watchedAppLibraryIDs = v35;

    uint64_t v37 = (OS_dispatch_group *)dispatch_group_create();
    gatherGroup = self->_gatherGroup;
    self->_gatherGroup = v37;

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&unsigned char buf[24] = __Block_byref_object_copy__22;
    *(void *)&long long v100 = __Block_byref_object_dispose__22;
    *((void *)&v100 + 1) = 0;
    objc_initWeak(&location, self);
    __int16 v39 = [v10 byIDLocalItem];
    char v40 = v68;
    uint64_t v41 = v39;
    v42 = &off_1D3887000;
    id v66 = v39;
    if (!self->_watchedAncestorFileObjectID || ![v39 isDirectory])
    {
LABEL_23:
      uint64_t v52 = 7;
      if ((v40 & 4) == 0) {
        uint64_t v52 = 5;
      }
      uint64_t v65 = v52;
      dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      v53 = [BRCDataOrDocsScopeGatherer alloc];
      unint64_t initialGatherMaxRank = self->_initialGatherMaxRank;
      uint64_t v80 = MEMORY[0x1E4F143A8];
      uint64_t v81 = *((void *)v42 + 130);
      uint64_t v55 = v81;
      v82 = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_2_9;
      id v83 = &unk_1E69959E0;
      objc_copyWeak(&v85, &location);
      v84 = buf;
      v56 = [(BRCDataOrDocsScopeGatherer *)v53 initWithNotificationPipe:self appLibraries:v70 startingRank:1 maxRank:initialGatherMaxRank withDeadItems:0 gatherReply:&v80];
      gatherer = self->_gatherer;
      self->_gatherer = v56;

      self->_int watchKind = 33;
      int v58 = self->_gatherGroup;
      id v59 = [(BRCNotificationPipe *)self queue];
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = v55;
      v76[2] = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_10;
      v76[3] = &unk_1E6995A08;
      objc_copyWeak(&v79, &location);
      long long v77 = v11;
      id v78 = buf;
      dispatch_group_notify(v58, v59, v76);

      if ((v68 & 8) != 0)
      {
        int v60 = [(BRCNotificationPipe *)self watchedAncestorItemGlobalID];
        [(BRCDataOrDocsScopeGatherer *)self->_gatherer setGatheredChildrenItemGlobalID:v60];
      }
      queue = self->_queue;
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = v55;
      v72[2] = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_11;
      v72[3] = &unk_1E6995A58;
      v72[4] = self;
      id v74 = buf;
      uint64_t v75 = v65;
      id v73 = v71;
      id v62 = v72;
      v97[0] = MEMORY[0x1E4F143A8];
      v97[1] = v55;
      v97[2] = __brc_dispatch_async_autorelease_block_invoke_0;
      v97[3] = &unk_1E6995800;
      id v98 = v62;
      id v63 = queue;
      dispatch_async(v63, v97);

      objc_destroyWeak(&v79);
      objc_destroyWeak(&v85);

      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

LABEL_28:
      goto LABEL_29;
    }
    uint64_t v43 = [v41 clientZone];
    if ((v68 & 4) != 0)
    {
      dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      id v49 = [v43 db];
      int v50 = [v49 serialQueue];
      v51 = v43;
      int v47 = v90;
      v90[0] = MEMORY[0x1E4F143A8];
      v90[1] = 3221225472;
      v90[2] = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke;
      v90[3] = &unk_1E6997108;
      uint64_t v64 = v51;
      v90[4] = v51;
      id v91 = v66;
      v92 = self;
      objc_copyWeak(&v95, &location);
      v94 = buf;
      id v93 = v14;
      dispatch_async(v50, v90);

      objc_destroyWeak(&v95);
    }
    else
    {
      if ((v68 & 2) == 0)
      {
LABEL_22:

        char v40 = v68;
        v42 = &off_1D3887000;
        goto LABEL_23;
      }
      dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      uint64_t v44 = [v43 db];
      uint64_t v45 = [v44 serialQueue];
      __int16 v46 = v43;
      int v47 = block;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_3;
      block[3] = &unk_1E6997130;
      uint64_t v64 = v46;
      void block[4] = v46;
      void block[5] = self;
      objc_copyWeak(&v89, &location);
      id v88 = buf;
      id v87 = v14;
      dispatch_async(v45, block);

      objc_destroyWeak(&v89);
    }

    uint64_t v43 = v64;
    goto LABEL_22;
  }
  uint64_t v12 = brc_bread_crumbs();
  qos_class_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
  {
    int watchKind = self->_watchKind;
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = watchKind;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v12;
    _os_log_error_impl(&dword_1D353B000, v13, (os_log_type_t)0x90u, "[ERROR] %@: EALREADY: watch already set up to kind %d%@", buf, 0x1Cu);
  }

  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 37);
  v11[2](v11, v14);
LABEL_29:
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) itemID];
  id v5 = [v3 fetchRecursiveDirectoryContentsIfNecessary:v4 isUserWaiting:1 rescheduleApply:1];

  if (v5)
  {
    id v6 = brc_bread_crumbs();
    BOOL v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_cold_2();
    }

    [v5 beginObservingChanges];
    id v8 = *(id *)(a1 + 48);
    objc_sync_enter(v8);
    [*(id *)(*(void *)(a1 + 48) + 192) addObject:v5];
    objc_sync_exit(v8);

    objc_initWeak(&location, v5);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_3;
    uint64_t v13[3] = &unk_1E6995990;
    objc_copyWeak(&v15, (id *)(a1 + 72));
    objc_copyWeak(&v16, &location);
    long long v12 = *(_OWORD *)(a1 + 56);
    id v9 = (id)v12;
    long long v14 = v12;
    [v5 addRecursiveDirectoryListCompletionBlock:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_cold_1(v2, (uint64_t)v10, v11);
    }

    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 48) + 80));
  }
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v6 = (id *)WeakRetained;
    objc_sync_enter(v6);
    [v6[24] removeObject:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v7 + 40);
    id v8 = (id *)(v7 + 40);
    id v9 = v10;
    if (v10) {
      id v11 = v9;
    }
    else {
      id v11 = v3;
    }
    objc_storeStrong(v8, v11);
    objc_sync_exit(v6);

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_2;
    v15[3] = &unk_1E6995358;
    uint64_t v13 = a1 + 32;
    uint64_t v12 = *(void *)(a1 + 32);
    long long v14 = objc_msgSend(v5, "description", MEMORY[0x1E4F143A8], 3221225472, __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_2, &unk_1E6995358, v6, *(void *)(v13 + 8));
    [v6 _performBlock:v15 whenNotifsAreFullyFlushedInAppLibrary:v12 description:v14];
  }
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v10 = a2;
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  uint64_t v7 = v8;
  id v9 = v10;
  if (v8) {
    id v9 = v7;
  }
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 80));
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_3(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 48) itemID];
  id v4 = [v2 fetchDirectoryContentsIfNecessary:v3 isUserWaiting:1 rescheduleApplyScheduler:1];

  if (v4)
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_cold_2();
    }

    [v4 beginObservingChangesWithDelegate:*(void *)(a1 + 40)];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 144));
    BOOL v8 = WeakRetained == 0;

    if (!v8)
    {
      uint64_t v13 = brc_bread_crumbs();
      long long v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_3_cold_1((uint64_t)v13, v14);
      }
    }
    objc_storeWeak((id *)(*(void *)(a1 + 40) + 144), v4);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_6;
    v16[3] = &unk_1E6995A30;
    objc_copyWeak(&v18, (id *)(a1 + 64));
    v16[4] = *(void *)(a1 + 40);
    long long v15 = *(_OWORD *)(a1 + 48);
    id v9 = (id)v15;
    long long v17 = v15;
    [v4 addDirectoryListCompletionBlock:v16];

    objc_destroyWeak(&v18);
  }
  else
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 48) itemID];
      *(_DWORD *)buf = 138412546;
      __int16 v20 = v12;
      __int16 v21 = 2112;
      __int16 v22 = v10;
      _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Could not create ListDirectoryContentsOperation for %@%@", buf, 0x16u);
    }
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 80));
  }
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (objc_msgSend(v3, "brc_isIgnorableListDirectoryError"))
    {
      uint64_t v5 = brc_bread_crumbs();
      id v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = WeakRetained[6];
        *(_DWORD *)buf = 138412802;
        uint64_t v20 = v17;
        __int16 v21 = 2112;
        id v22 = v3;
        __int16 v23 = 2112;
        uint64_t v24 = v5;
        _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring list error %@ - %@%@", buf, 0x20u);
      }

      id v3 = 0;
    }
    uint64_t v7 = WeakRetained;
    objc_sync_enter(v7);
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    objc_storeWeak(v7 + 18, 0);
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void **)(v9 + 40);
    id v10 = (id *)(v9 + 40);
    id v11 = v12;
    if (v12) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v3;
    }
    objc_storeStrong(v10, v13);
    objc_sync_exit(v7);

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_7;
    uint64_t v18[3] = &unk_1E6995358;
    uint64_t v15 = a1 + 40;
    uint64_t v14 = *(void *)(a1 + 40);
    id v16 = objc_msgSend(v8, "description", MEMORY[0x1E4F143A8], 3221225472, __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_7, &unk_1E6995358, v7, *(void *)(v15 + 8));
    [v7 _performBlock:v18 whenNotifsAreFullyFlushedInAppLibrary:v14 description:v16];
  }
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_7(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v10 = a2;
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  uint64_t v7 = v8;
  uint64_t v9 = v10;
  if (v8) {
    uint64_t v9 = v7;
  }
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 80));
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_2_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (dispatch_group_t *)WeakRetained;
    objc_sync_enter(v6);
    uint64_t v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_2_9_cold_1();
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = *(void **)(v9 + 40);
    id v10 = (id *)(v9 + 40);
    id v11 = v12;
    if (v12) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v3;
    }
    objc_storeStrong(v10, v13);
    dispatch_group_leave(v6[10]);
    objc_sync_exit(v6);
  }
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_10_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_11(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8))
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v3 = *(id *)(v2 + 184);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v43 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v28 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v8 = [*(id *)(a1 + 32) delegate];
          [v8 notificationPipe:*(void *)(a1 + 32) willObserveAppLibrary:v7];
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v43 count:16];
      }
      while (v4);
    }

    *(void *)(*(void *)(a1 + 32) + 208) = *(void *)(a1 + 56);
    [*(id *)(*(void *)(a1 + 32) + 128) registerAppLibraries:*(void *)(*(void *)(a1 + 32) + 184) forFlags:*(void *)(a1 + 56)];
    uint64_t v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = [*(id *)(a1 + 40) path];
      __int16 v21 = [*(id *)(a1 + 32) watchedAncestorFileObjectID];
      id v22 = [*(id *)(a1 + 32) watchedAncestorItemGlobalID];
      uint64_t v23 = [*(id *)(a1 + 32) watchedAncestorFilenameToItem];
      uint64_t v24 = (void *)v23;
      uint64_t v25 = &stru_1F2AC7720;
      *(_DWORD *)buf = 138413570;
      if (v23) {
        uint64_t v25 = (__CFString *)v23;
      }
      uint64_t v32 = v19;
      __int16 v33 = 2112;
      __int16 v34 = v20;
      __int16 v35 = 2112;
      __int16 v36 = v21;
      __int16 v37 = 2112;
      __int16 v38 = v22;
      __int16 v39 = 2112;
      char v40 = v25;
      __int16 v41 = 2112;
      v42 = v9;
      _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: started watching children of %@ (fsid:%@ id:%@ filename:%@)%@", buf, 0x3Eu);
    }
    [*(id *)(a1 + 32) _gatherIfNeededAndFlushAsync];
  }
  else
  {
    id obj = (id)v2;
    objc_sync_enter(obj);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v13;
    }
    else
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 4);
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v14 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }

    [*(id *)(*(void *)(a1 + 32) + 72) invalidate];
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(void **)(v17 + 72);
    *(void *)(v17 + 72) = 0;

    objc_sync_exit(obj);
  }
}

- (void)watchItemInProcessAtURL:(id)a3 options:(unsigned __int16)a4 gatherReply:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(BRCNotificationManager *)self->_manager session];
  uint64_t v11 = [v10 clientDB];
  uint64_t v12 = [v11 serialQueue];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __84__BRCNotificationPipe_LegacyAdditions__watchItemInProcessAtURL_options_gatherReply___block_invoke;
  v28[3] = &unk_1E6997158;
  id v13 = v8;
  id v29 = v13;
  id v14 = v10;
  id v30 = v14;
  id v15 = v9;
  __int16 v31 = self;
  id v32 = v15;
  unsigned __int16 v33 = a4;
  uint64_t v16 = v12;
  uint64_t v17 = v28;
  __int16 v21 = (void *)MEMORY[0x1D9438760](v17, v18, v19, v20);
  long long v34 = 0uLL;
  uint64_t v35 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v34);
  id v22 = brc_bread_crumbs();
  uint64_t v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v26 = v34;
    label = dispatch_queue_get_label(v16);
    *(_DWORD *)block = 134218498;
    *(void *)&void block[4] = v26;
    *(_WORD *)&block[12] = 2080;
    *(void *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    __int16 v37 = v22;
    _os_log_debug_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  long long v40 = v34;
  uint64_t v41 = v35;
  *(void *)block = MEMORY[0x1E4F143A8];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = __dispatch_async_with_logs_block_invoke_11;
  __int16 v37 = &unk_1E6993710;
  uint64_t v24 = v16;
  __int16 v38 = v24;
  uint64_t v25 = v17;
  id v39 = v25;
  dispatch_async(v24, block);
}

void __84__BRCNotificationPipe_LegacyAdditions__watchItemInProcessAtURL_options_gatherReply___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [[BRCURLToItemLookup alloc] initWithURL:*(void *)(a1 + 32) allowAppLibraryRoot:1 session:*(void *)(a1 + 40)];
  id v10 = 0;
  BOOL v3 = [(BRCURLToItemLookup *)v2 resolveAndKeepOpenWithError:&v10];
  id v4 = v10;
  if (v3)
  {
    if (v2) {
      [*(id *)(a1 + 48) watchItemAtURL:*(void *)(a1 + 32) lookup:v2 options:*(unsigned __int16 *)(a1 + 64) gatherReply:*(void *)(a1 + 56)];
    }
  }
  else
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) path];
      *(_DWORD *)buf = 138412802;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      id v14 = v4;
      __int16 v15 = 2112;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Path %@ is not an existing container: %@%@", buf, 0x20u);
    }
    uint64_t v8 = *(void *)(a1 + 56);
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 22);
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  [(BRCURLToItemLookup *)v2 closePaths];
}

- (void)_flushProgressUpdates
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_hasProgressUpdatesInFlight)
  {
    if ([(NSMutableDictionary *)self->_pendingProgressUpdatesByID count])
    {
      self->_hasProgressUpdatesInFlight = 1;
      voucher_adopt();
      receiver = self->_receiver;
      id v4 = [(NSMutableDictionary *)self->_pendingProgressUpdatesByID allValues];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __61__BRCNotificationPipe_LegacyAdditions___flushProgressUpdates__block_invoke;
      v5[3] = &unk_1E6993698;
      void v5[4] = self;
      [(BRItemNotificationReceiving *)receiver receiveProgressUpdates:v4 reply:v5];

      [(NSMutableDictionary *)self->_pendingProgressUpdatesByID removeAllObjects];
    }
  }
}

void __61__BRCNotificationPipe_LegacyAdditions___flushProgressUpdates__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  memset(v17, 0, sizeof(v17));
  __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe(LegacyAdditions) _flushProgressUpdates]_block_invoke", 269, v17);
  uint64_t v2 = brc_bread_crumbs();
  BOOL v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)block = 134218498;
    *(void *)&void block[4] = v17[0];
    *(_WORD *)&block[12] = 2112;
    *(void *)&block[14] = v13;
    *(_WORD *)&block[22] = 2112;
    __int16 v21 = v2;
    _os_log_debug_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: received progress acknowledgement%@", block, 0x20u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 136);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__BRCNotificationPipe_LegacyAdditions___flushProgressUpdates__block_invoke_14;
  v16[3] = &unk_1E6993698;
  v16[4] = v4;
  id v6 = v5;
  uint64_t v7 = v16;
  uint64_t v8 = (void *)MEMORY[0x1D9438760]();
  long long v18 = 0uLL;
  uint64_t v19 = 0;
  __brc_create_section(0, (uint64_t)"brc_dispatch_async_autorelease_with_logs", 276, &v18);
  id v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = v18;
    label = dispatch_queue_get_label(v6);
    *(_DWORD *)block = 134218498;
    *(void *)&void block[4] = v14;
    *(_WORD *)&block[12] = 2080;
    *(void *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    __int16 v21 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  long long v24 = v18;
  uint64_t v25 = v19;
  *(void *)block = MEMORY[0x1E4F143A8];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = __brc_dispatch_async_autorelease_with_logs_block_invoke_1;
  __int16 v21 = &unk_1E6993710;
  uint64_t v11 = v6;
  id v22 = v11;
  uint64_t v12 = v7;
  id v23 = v12;
  dispatch_async(v11, block);

  __brc_leave_section(v17);
}

uint64_t __61__BRCNotificationPipe_LegacyAdditions___flushProgressUpdates__block_invoke_14(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 104) = 0;
  return [*(id *)(a1 + 32) _flushProgressUpdates];
}

- (void)_processProgressUpdates:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_receiver && self->_watchKind)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v6 = [(BRCNotificationPipe *)self watchedAncestorFileObjectID];
    if (v6
      && ([(BRCNotificationPipe *)self watchedAncestorFileObjectID],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 isFolderOrAliasID],
          v7,
          v6,
          v8))
    {
      id v9 = [(BRCNotificationPipe *)self watchedAncestorFileObjectID];
      id v10 = [v9 folderID];
      [v5 addObject:v10];

      unsigned int watchItemOptions = self->_watchItemOptions;
      if ((watchItemOptions & 4) != 0) {
        int v12 = 0x7FFFFFFF;
      }
      else {
        int v12 = (watchItemOptions >> 1) & 1;
      }
    }
    else
    {
      watchedAppLibraries = self->_watchedAppLibraries;
      if (watchedAppLibraries)
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v14 = watchedAppLibraries;
        uint64_t v15 = [(NSSet *)v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v31 != v16) {
                objc_enumerationMutation(v14);
              }
              long long v18 = [*(id *)(*((void *)&v30 + 1) + 8 * i) fileID];
              [v5 addObject:v18];
            }
            uint64_t v15 = [(NSSet *)v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
          }
          while (v15);
        }

        int v12 = 0x7FFFFFFF;
      }
      else
      {
        int v12 = 0;
      }
    }
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    char v29 = 0;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __64__BRCNotificationPipe_LegacyAdditions___processProgressUpdates___block_invoke;
    id v23 = &unk_1E6997180;
    id v19 = v5;
    uint64_t v25 = self;
    uint64_t v26 = v28;
    int v27 = v12;
    id v24 = v19;
    [v4 enumerateKeysAndObjectsUsingBlock:&v20];
    [(BRCNotificationPipe *)self _flushProgressUpdates];

    _Block_object_dispose(v28, 8);
  }
}

void __64__BRCNotificationPipe_LegacyAdditions___processProgressUpdates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = objc_msgSend(v6, "parentFileIDs", 0);
    int v8 = [v7 reverseObjectEnumerator];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      int v11 = 0;
      uint64_t v12 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v8);
          }
          int v14 = *(_DWORD *)(a1 + 56);
          if (v14 != 0x7FFFFFFF)
          {
            if (v11 > v14) {
              goto LABEL_16;
            }
            ++v11;
          }
          if ([*(id *)(a1 + 32) containsObject:*(void *)(*((void *)&v15 + 1) + 8 * i)])
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
            goto LABEL_16;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(*(void *)(a1 + 40) + 96) setObject:v6 forKeyedSubscript:v5];
  }
}

- (void)processProgressUpdates:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__BRCNotificationPipe_LegacyAdditions__processProgressUpdates___block_invoke;
  uint64_t v7[3] = &unk_1E6993628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __63__BRCNotificationPipe_LegacyAdditions__processProgressUpdates___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processProgressUpdates:*(void *)(a1 + 40)];
}

- (void)addNotification:asDead:.cold.1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[NOTIF] stripped sharing info for %@%@", (void)v3, DWORD2(v3));
}

- (void)_isInterestingUpdate:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Update is \"Documents\", discarding: %@%@");
}

- (void)_isInterestingUpdate:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Update is a directory, discarding %@%@");
}

- (void)_isInterestingUpdate:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Update is a fault, discarding %@%@");
}

- (void)_isInterestingUpdate:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Queueing OUTSIDE (dead item) notification: %@%@");
}

- (void)_isInterestingUpdate:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Queueing OUTSIDE (reparented) notification: %@%@");
}

- (void)_isInterestingUpdate:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Queueing INSIDE (itemID match) notification: %@%@");
}

- (void)_isInterestingUpdate:.cold.8()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _watchKind & WATCH_ITEM%@", v2, v3, v4, v5, v6);
}

- (void)_isInterestingUpdate:.cold.9()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Queueing INSIDE (below a Documents/ folder) notification: %@%@");
}

- (void)_isInterestingUpdate:.cold.10()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Queueing INSIDE (not below a Documents/ folder) notification: %@%@");
}

- (void)_isInterestingUpdate:.cold.11()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Queueing INSIDE (below a .Trash/ folder) notification: %@%@");
}

- (void)_isInterestingUpdate:.cold.12()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Queueing OUTSIDE (moved out library scope) notification: %@%@");
}

- (void)_isInterestingUpdate:.cold.13()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Queueing OUTSIDE (watching containers) notification: %@%@");
}

- (void)_isInterestingUpdate:.cold.14()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Queueing INSIDE (watching containers) notification: %@%@");
}

- (void)_isInterestingUpdate:.cold.15()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Queueing INSIDE (parentObjectID match) notification: %@%@");
}

- (void)_isInterestingUpdate:.cold.16()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Queueing OUTSIDE (oldParentFileObjectID match) notification: %@%@");
}

- (void)_isInterestingUpdate:.cold.18()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Queueing INSIDE (fileObjectID match) notification: %@%@");
}

- (void)_isInterestingUpdate:.cold.20()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Update is in the trash, discarding %@%@");
}

- (void)_isInterestingUpdate:.cold.21()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Queueing INSIDE (in the scope) notification: %@%@");
}

- (void)_isInterestingUpdate:.cold.22()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Queueing OUTSIDE (moved out library scope) notification: %@%@");
}

- (void)_isInterestingUpdate:(NSObject *)a3 .cold.23(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 watchedAncestorItemGlobalID];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[NOTIF] Learning itemID for our ancestor: %@%@", (uint8_t *)&v6, 0x16u);
}

- (void)_isInterestingUpdate:(NSObject *)a3 .cold.24(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v6 = [a1 watchedAncestorItemGlobalID];
  uint64_t v7 = [a1 oldWatchedAncestorItemGlobalID];
  int v8 = 138412802;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  int v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[NOTIF] Learning path-match for %@ (was %@)%@", (uint8_t *)&v8, 0x20u);
}

- (void)_isInterestingUpdate:.cold.25()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Ancestor isn't resolved yet, discarding %@%@");
}

- (void)_prepareForSecondGatherWithRank:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !_gatherer%@", v2, v3, v4, v5, v6);
}

- (void)_prepareForSecondGatherWithRank:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[NOTIF] doing the second phase gathering%@", v2, v3, v4, v5, v6);
}

void __55__BRCNotificationPipe__prepareForSecondGatherWithRank___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[NOTIF] Finished second phase gathering%@", v2, v3, v4, v5, v6);
}

- (void)processUpdates:withRank:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[NOTIF] dropping all updates%@", v2, v3, v4, v5, v6);
}

- (void)processUpdates:(NSObject *)a3 withRank:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&void v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_1(&dword_1D353B000, a2, a3, "[NOTIF] dropping %ld updates%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[NOTIF] Waiting for notification flush for %@ in %@%@", (uint8_t *)&v5, 0x20u);
}

void __87__BRCNotificationPipe__performBlock_whenNotifsAreFullyFlushedInAppLibrary_description___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Failed to wait for faulting to complete - %@%@");
}

- (void)watchScopes:trustedAppLibraryIDs:gatherReply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] %@: Unable to resolve scopes%@");
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[NOTIF] Could not create RecursiveListDirectoryContentsOperation for %@%@", (void)v3, DWORD2(v3));
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Waiting for group for list op %@%@");
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3_157_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Finished normal gather phase for %@%@");
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_158_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Calling gather reply callback for %@%@");
}

- (void)_watchItem:options:gatherReply:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Invalid notification pipe setup%@", v2, v3, v4, v5, v6);
}

- (void)_watchItem:options:gatherReply:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !_listOp%@", v2, v3, v4, v5, v6);
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_166_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] Finished waiting on gather group for %@%@");
}

void __83__BRCNotificationPipe_IPCs__watchItemWithFileObjectID_options_request_gatherReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] App library %@ not installed, not waiting for gathering to finish%@");
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 itemID];
  int v6 = 138412546;
  __int16 v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Could not create RecursiveListDirectoryContentsOperation for %@%@", (uint8_t *)&v6, 0x16u);
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Waiting on gather group for %@%@");
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !self->_listOp%@", (uint8_t *)&v2, 0xCu);
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_2_9_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Finished normal gather phase for %@%@");
}

void __82__BRCNotificationPipe_LegacyAdditions__watchItemAtURL_lookup_options_gatherReply___block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Finished waiting on gather group for %@%@");
}

@end