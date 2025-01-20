@interface BRBaseFileEnumerator
- (BRBaseFileEnumerator)initWithFileObjectID:(id)a3 itemIdentifier:(id)a4 recursive:(BOOL)a5;
- (NSString)description;
- (void)_accountTokenDidChange;
- (void)_handleNotificationError:(id)a3;
- (void)_invalidate;
- (void)_setupNotificationReceivingIfNeededWithCompletion:(id)a3;
- (void)_signalChange;
- (void)_startObservingAccountChangesIfNeeded;
- (void)_stopObservingAccountChanges;
- (void)containerListDidChange;
- (void)currentSyncAnchorWithCompletionHandler:(id)a3;
- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4;
- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4;
- (void)enumerateNextGatherBatchWithObserver:(id)a3 fromPage:(id)a4;
- (void)invalidate;
- (void)invalidateChangeToken;
- (void)receiveProgressUpdates:(id)a3 reply:(id)a4;
- (void)receiveUpdates:(id)a3 logicalExtensions:(id)a4 physicalExtensions:(id)a5 reply:(id)a6;
- (void)setupNotificationReceivingIfNeededWithCompletion:(id)a3;
- (void)watchItemWithUpdateSender:(id)a3 options:(unsigned __int16)a4 errorHandler:(id)a5 gatherReply:(id)a6;
@end

@implementation BRBaseFileEnumerator

- (BRBaseFileEnumerator)initWithFileObjectID:(id)a3 itemIdentifier:(id)a4 recursive:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)BRBaseFileEnumerator;
  v11 = [(BRBaseFileEnumerator *)&v25 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_itemIdentifier, a4);
    objc_storeStrong((id *)&v12->_fileObjectID, a3);
    uint64_t v13 = objc_opt_new();
    updatedItemsByIDs = v12->_updatedItemsByIDs;
    v12->_updatedItemsByIDs = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    deletedItemsIdentifiers = v12->_deletedItemsIdentifiers;
    v12->_deletedItemsIdentifiers = (NSMutableArray *)v15;

    v12->_isRecursive = a5;
    if (brc_block_remember_persona)
    {
      v17 = +[UMUserManager sharedManager];
      uint64_t v18 = objc_msgSend(v17, "br_currentPersonaID");
      personaID = v12->_personaID;
      v12->_personaID = (NSString *)v18;
    }
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(v20, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("file-enumerator", v21);

    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v22;

    uuid_generate(v12->_uuid);
  }

  return v12;
}

- (void)_startObservingAccountChangesIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isObservingAccountChanges && !self->_invalidated)
  {
    self->_isObservingAccountChanges = 1;
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_accountTokenDidChange" name:BRAccountTokenDidChangeNotification object:0];
    if ([(NSString *)self->_itemIdentifier isEqualToString:NSFileProviderRootContainerItemIdentifier])
    {
      id v3 = +[BRContainer allContainers];
      v4 = +[NSNotificationCenter defaultCenter];
      [v4 addObserver:self selector:"containerListDidChange" name:BRContainerListDidChangeNotification object:0];
    }
  }
}

- (void)_signalChange
{
  id v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100022844();
  }

  id v5 = +[NSFileProviderManager br_sharedProviderManager];
  itemIdentifier = self->_itemIdentifier;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004574;
  v7[3] = &unk_1000385C0;
  v7[4] = self;
  [v5 signalEnumeratorForContainerItemIdentifier:itemIdentifier completionHandler:v7];
}

- (void)_handleNotificationError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_1000048C8;
  v20 = &unk_1000385E8;
  v21 = self;
  id v6 = v4;
  id v22 = v6;
  dispatch_async((dispatch_queue_t)queue, &v17);
  v7 = self;
  objc_sync_enter(v7);
  if (v7->_gatherEnumerationObserver)
  {
    v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      gatherEnumerationObserver = v7->_gatherEnumerationObserver;
      fileObjectID = v7->_fileObjectID;
      *(_DWORD *)buf = 138413314;
      v24 = v7;
      __int16 v25 = 2112;
      id v26 = v6;
      __int16 v27 = 2112;
      v28 = gatherEnumerationObserver;
      __int16 v29 = 2112;
      v30 = fileObjectID;
      __int16 v31 = 2112;
      v32 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Completed gathering with error %@ observer %@ for %@%@", buf, 0x34u);
    }

    if (objc_msgSend(v6, "brc_isXPCConnectionError", v17, v18, v19, v20, v21))
    {
      id v10 = v7->_gatherEnumerationObserver;
      v11 = objc_msgSend(v6, "br_fileProviderError");
      [(NSFileProviderEnumerationObserver *)v10 finishEnumeratingWithError:v11];
    }
    else
    {
      v7->_completedGather = 1;
      v12 = brc_bread_crumbs();
      uint64_t v13 = brc_default_log();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
        sub_1000228AC();
      }

      [(NSFileProviderEnumerationObserver *)v7->_gatherEnumerationObserver finishEnumeratingUpToPage:0];
    }
    v14 = v7->_gatherEnumerationObserver;
    v7->_gatherEnumerationObserver = 0;
  }
  objc_sync_exit(v7);
}

- (void)watchItemWithUpdateSender:(id)a3 options:(unsigned __int16)a4 errorHandler:(id)a5 gatherReply:(id)a6
{
  id v6 = brc_bread_crumbs();
  v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: watchItemWithUpdateSender must be implemented in base class.%@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_setupNotificationReceivingIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100004CC8;
  v18[3] = &unk_100038610;
  v18[4] = self;
  id v5 = v4;
  id v19 = v5;
  id v6 = objc_retainBlock(v18);
  [(BRBaseFileEnumerator *)self _startObservingAccountChangesIfNeeded];
  if (self->_isSettingUpNotificationReceiving)
  {
    v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_1000229EC();
    }
  }
  self->_isSettingUpNotificationReceiving = 1;
  if (self->_remoteNotificationSender)
  {
    ((void (*)(void *, void))v6[2])(v6, 0);
  }
  else
  {
    v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100022984();
    }

    id v9 = +[BRDaemonConnection defaultConnection];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100004CE0;
    v16[3] = &unk_100038638;
    id v10 = v6;
    id v17 = v10;
    v11 = [v9 remoteObjectProxyWithErrorHandler:v16];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100004CF0;
    v14[3] = &unk_1000386F0;
    v14[4] = self;
    uint64_t v15 = v10;
    [v11 getItemUpdateSenderWithReceiver:self reply:v14];
  }
}

- (void)setupNotificationReceivingIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005344;
  v7[3] = &unk_100038718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)enumerateNextGatherBatchWithObserver:(id)a3 fromPage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if (v8->_nextPage)
  {
    id v9 = objc_msgSend(v7, "br_pageTokenOffset");
    if (v9 != (id)[(NSData *)v8->_nextPage br_pageTokenOffset])
    {
      uint64_t v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = objc_msgSend(v7, "br_pageTokenOffset");
        unint64_t v16 = [(NSData *)v8->_nextPage br_pageTokenOffset];
        int v31 = 138413058;
        v32 = v8;
        __int16 v33 = 2048;
        unint64_t v34 = (unint64_t)v15;
        __int16 v35 = 2048;
        unint64_t v36 = v16;
        __int16 v37 = 2112;
        id v38 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Incoming page %lld does not equal current page %lld%@", (uint8_t *)&v31, 0x2Au);
      }

      gatherEnumerationObserver = +[NSError br_errorWithPOSIXCode:4];
      [v6 finishEnumeratingWithError:gatherEnumerationObserver];
      goto LABEL_19;
    }
  }
  if (!v8->_completedGather)
  {
    uint64_t v18 = +[NSData br_pageTokenFromSortOrder:gatherBatch:](NSData, "br_pageTokenFromSortOrder:gatherBatch:", objc_msgSend(v7, "br_pageTokenSortOrder"), (char *)objc_msgSend(v7, "br_pageTokenOffset") + 1);
    nextPage = v8->_nextPage;
    v8->_nextPage = (NSData *)v18;

    v20 = brc_bread_crumbs();
    v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v26 = [(NSData *)v8->_nextPage br_pageTokenOffset];
      fileObjectID = v8->_fileObjectID;
      int v31 = 138413314;
      v32 = v8;
      __int16 v33 = 2048;
      unint64_t v34 = v26;
      __int16 v35 = 2112;
      unint64_t v36 = (unint64_t)fileObjectID;
      __int16 v37 = 2112;
      id v38 = v6;
      __int16 v39 = 2112;
      v40 = v20;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Enumerating gather batch up with next offset %lld for %@ observer %@%@", (uint8_t *)&v31, 0x34u);
    }

    if ([(NSMutableDictionary *)v8->_updatedItemsByIDs count])
    {
      id v22 = brc_bread_crumbs();
      v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        updatedItemsByIDs = v8->_updatedItemsByIDs;
        int v31 = 138412802;
        v32 = v8;
        __int16 v33 = 2112;
        unint64_t v34 = (unint64_t)updatedItemsByIDs;
        __int16 v35 = 2112;
        unint64_t v36 = (unint64_t)v22;
        _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Returning updated items immediately %@%@", (uint8_t *)&v31, 0x20u);
      }

      v24 = [(NSMutableDictionary *)v8->_updatedItemsByIDs allValues];
      [v6 didEnumerateItems:v24];

      [(NSMutableDictionary *)v8->_updatedItemsByIDs removeAllObjects];
      v12 = v8->_nextPage;
      goto LABEL_16;
    }
    if (v8->_gatherEnumerationObserver)
    {
      __int16 v29 = brc_bread_crumbs();
      v30 = brc_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        sub_100022BB8();
      }
    }
    __int16 v25 = (NSFileProviderEnumerationObserver *)v6;
    gatherEnumerationObserver = v8->_gatherEnumerationObserver;
    v8->_gatherEnumerationObserver = v25;
LABEL_19:

    goto LABEL_20;
  }
  id v10 = brc_bread_crumbs();
  v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100022C20();
  }

  v12 = 0;
LABEL_16:
  [v6 finishEnumeratingUpToPage:v12];
LABEL_20:
  objc_sync_exit(v8);
}

- (void)currentSyncAnchorWithCompletionHandler:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  id v6 = +[NSData br_changeTokenFromRank:0 uuid:uuid];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_fileObjectID;
  memset(v34, 0, sizeof(v34));
  sub_1000149C4(0, (uint64_t)"-[BRBaseFileEnumerator enumerateItemsForObserver:startingAtPage:]", 294, v34);
  id v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    unint64_t v36 = (BRBaseFileEnumerator *)v34[0];
    __int16 v37 = 2112;
    id v38 = self;
    __int16 v39 = 2112;
    v40 = v8;
    __int16 v41 = 2112;
    v42 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@ - listing items for %@%@", buf, 0x2Au);
  }

  if (v7)
  {
    v11 = brc_bread_crumbs();
    v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v19 = (BRBaseFileEnumerator *)objc_msgSend(v7, "br_pageTokenOffset");
      unsigned int v20 = objc_msgSend(v7, "br_pageTokenCompletedInitialEnumeration");
      v21 = "";
      *(_DWORD *)buf = 138413058;
      unint64_t v36 = self;
      __int16 v37 = 2048;
      if (v20) {
        v21 = " (gather batch)";
      }
      id v38 = v19;
      __int16 v39 = 2080;
      v40 = (void *)v21;
      __int16 v41 = 2112;
      v42 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - from page %lu%s%@", buf, 0x2Au);
    }
  }
  long long v30 = 0uLL;
  uint64_t v31 = 0;
  sub_1000149C4(0, (uint64_t)"-[BRBaseFileEnumerator enumerateItemsForObserver:startingAtPage:]", 299, &v30);
  uint64_t v13 = brc_bread_crumbs();
  v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t v36 = (BRBaseFileEnumerator *)v30;
    __int16 v37 = 2112;
    id v38 = self;
    __int16 v39 = 2112;
    v40 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx %@ - calling bird%@", buf, 0x20u);
  }

  long long v32 = v30;
  uint64_t v33 = v31;
  unsigned __int8 v15 = objc_msgSend(v7, "br_pageTokenSortOrder");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100005BF0;
  v22[3] = &unk_100038768;
  id v16 = v6;
  id v23 = v16;
  id v17 = v7;
  id v24 = v17;
  __int16 v25 = self;
  long long v27 = v32;
  uint64_t v28 = v33;
  uint64_t v18 = v8;
  unint64_t v26 = v18;
  unsigned __int8 v29 = v15;
  [(BRBaseFileEnumerator *)self setupNotificationReceivingIfNeededWithCompletion:v22];

  sub_100014B98(v34);
}

- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  memset(v27, 0, sizeof(v27));
  sub_1000149C4(0, (uint64_t)"-[BRBaseFileEnumerator enumerateChangesForObserver:fromSyncAnchor:]", 352, v27);
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = v27[0];
    id v23 = [(BRFileObjectID *)self->_fileObjectID asString];
    *(_DWORD *)buf = 134218754;
    uint64_t v29 = v22;
    __int16 v30 = 2112;
    uint64_t v31 = self;
    __int16 v32 = 2112;
    id v33 = v23;
    __int16 v34 = 2112;
    unint64_t v35 = (unint64_t)v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@ - listing changes for %@%@", buf, 0x2Au);
  }
  id v10 = self;
  objc_sync_enter(v10);
  id v11 = objc_msgSend(v7, "br_changeTokenRankWithUUID:", v10->_uuid);
  v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v29 = (uint64_t)v10;
    __int16 v30 = 2048;
    uint64_t v31 = (BRBaseFileEnumerator *)v11;
    __int16 v32 = 2112;
    id v33 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - requested rank: %lld%@", buf, 0x20u);
  }

  if (((unint64_t)v11 & 0x8000000000000000) != 0 || (id)v10->_rank != v11)
  {
    id v19 = brc_bread_crumbs();
    unsigned int v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_100022C88();
    }

    v21 = +[NSError errorWithDomain:NSFileProviderErrorDomain code:-1002 userInfo:0];
    [v6 finishEnumeratingWithError:v21];
    [(BRBaseFileEnumerator *)v10 invalidateChangeToken];

    goto LABEL_15;
  }
  if (![(NSMutableDictionary *)v10->_updatedItemsByIDs count]
    && ![(NSMutableArray *)v10->_deletedItemsIdentifiers count])
  {
    id v24 = brc_bread_crumbs();
    __int16 v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_100022D0C();
    }

    [v6 finishEnumeratingChangesUpToSyncAnchor:v7 moreComing:0];
LABEL_15:
    objc_sync_exit(v10);

    id v16 = 0;
    v14 = 0;
    id v15 = 0;
    goto LABEL_16;
  }
  v14 = [(NSMutableDictionary *)v10->_updatedItemsByIDs allValues];
  id v15 = [(NSMutableArray *)v10->_deletedItemsIdentifiers copy];
  [(NSMutableDictionary *)v10->_updatedItemsByIDs removeAllObjects];
  [(NSMutableArray *)v10->_deletedItemsIdentifiers removeAllObjects];
  ++v10->_rank;
  id v16 = +[NSData br_changeTokenFromRank:uuid:](NSData, "br_changeTokenFromRank:uuid:");
  objc_sync_exit(v10);

  id v17 = brc_bread_crumbs();
  uint64_t v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    unint64_t rank = v10->_rank;
    *(_DWORD *)buf = 138413314;
    uint64_t v29 = (uint64_t)v10;
    __int16 v30 = 2112;
    uint64_t v31 = v14;
    __int16 v32 = 2112;
    id v33 = v15;
    __int16 v34 = 2048;
    unint64_t v35 = rank;
    __int16 v36 = 2112;
    __int16 v37 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Sending back items %@, deleted %@, new rank %lld%@", buf, 0x34u);
  }

  [v6 didUpdateItems:v14];
  [v6 didDeleteItemsWithIdentifiers:v15];
  [v6 finishEnumeratingChangesUpToSyncAnchor:v16 moreComing:0];
LABEL_16:

  sub_100014B98(v27);
}

- (void)receiveUpdates:(id)a3 logicalExtensions:(id)a4 physicalExtensions:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v37 = a4;
  id v38 = a5;
  __int16 v39 = (void (**)(void))a6;
  id v11 = self;
  objc_sync_enter(v11);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v41;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(NSMutableDictionary **)(*((void *)&v40 + 1) + 8 * i);
        if ([(NSMutableDictionary *)v16 isDead])
        {
          updatedItemsByIDs = v11->_updatedItemsByIDs;
          uint64_t v18 = [(NSMutableDictionary *)v16 fileObjectID];
          [(NSMutableDictionary *)updatedItemsByIDs setObject:0 forKeyedSubscript:v18];

          deletedItemsIdentifiers = v11->_deletedItemsIdentifiers;
          unsigned int v20 = [(NSMutableDictionary *)v16 fileObjectID];
          v21 = [v20 asString];
          [(NSMutableArray *)deletedItemsIdentifiers addObject:v21];
        }
        else
        {
          uint64_t v22 = [(NSMutableDictionary *)v16 asFileProviderItem];
          BOOL v23 = v22 == 0;

          if (!v23)
          {
            id v24 = v11->_deletedItemsIdentifiers;
            __int16 v25 = [(NSMutableDictionary *)v16 fileObjectID];
            unint64_t v26 = [v25 asString];
            [(NSMutableArray *)v24 removeObject:v26];

            long long v27 = v11->_updatedItemsByIDs;
            unsigned int v20 = [(NSMutableDictionary *)v16 fileObjectID];
            [(NSMutableDictionary *)v27 setObject:v16 forKeyedSubscript:v20];
            goto LABEL_13;
          }
          unsigned int v20 = brc_bread_crumbs();
          v21 = brc_default_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v45 = v11;
            __int16 v46 = 2112;
            v47 = v16;
            __int16 v48 = 2112;
            v49 = (NSFileProviderEnumerationObserver *)v20;
            _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Ignoring un-representable item %@%@", buf, 0x20u);
          }
        }

LABEL_13:
      }
      id v13 = [v12 countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v13);
  }

  if (v11->_gatherEnumerationObserver && [(NSMutableDictionary *)v11->_updatedItemsByIDs count])
  {
    uint64_t v28 = brc_bread_crumbs();
    uint64_t v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      __int16 v34 = v11->_updatedItemsByIDs;
      gatherEnumerationObserver = v11->_gatherEnumerationObserver;
      fileObjectID = v11->_fileObjectID;
      *(_DWORD *)buf = 138413314;
      v45 = v11;
      __int16 v46 = 2112;
      v47 = v34;
      __int16 v48 = 2112;
      v49 = gatherEnumerationObserver;
      __int16 v50 = 2112;
      v51 = fileObjectID;
      __int16 v52 = 2112;
      v53 = v28;
      _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Enumerating updated items %@ directly to observer %@ because we are still gathering for %@%@", buf, 0x34u);
    }

    __int16 v30 = v11->_gatherEnumerationObserver;
    uint64_t v31 = [(NSMutableDictionary *)v11->_updatedItemsByIDs allValues];
    [(NSFileProviderEnumerationObserver *)v30 didEnumerateItems:v31];

    [(NSMutableDictionary *)v11->_updatedItemsByIDs removeAllObjects];
    [(NSFileProviderEnumerationObserver *)v11->_gatherEnumerationObserver finishEnumeratingUpToPage:v11->_nextPage];
    __int16 v32 = v11->_gatherEnumerationObserver;
    v11->_gatherEnumerationObserver = 0;
  }
  id v33 = (char *)[(NSMutableDictionary *)v11->_updatedItemsByIDs count];
  if (&v33[(void)[(NSMutableArray *)v11->_deletedItemsIdentifiers count]] >= (char *)0x1389) {
    [(BRBaseFileEnumerator *)v11 invalidateChangeToken];
  }
  objc_sync_exit(v11);

  [(BRBaseFileEnumerator *)v11 _signalChange];
  v39[2]();
}

- (void)receiveProgressUpdates:(id)a3 reply:(id)a4
{
  id v4 = (void (**)(void))a4;
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100022D74();
  }

  v4[2](v4);
}

- (void)containerListDidChange
{
  if ([(NSString *)self->_personaID isEqualToString:@"__defaultPersonaID__"]
    || (id v3 = self->_personaID) == 0)
  {
    if (qword_100043D58 != -1) {
      dispatch_once(&qword_100043D58, &stru_100038788);
    }
    id v4 = (NSString *)(id)qword_100043D60;
    int v5 = 1;
  }
  else
  {
    id v4 = v3;
    int v5 = 0;
  }
  id v6 = +[UMUserManager sharedManager];
  id v7 = [v6 currentPersona];

  id v25 = 0;
  id v8 = [v7 userPersonaUniqueString];
  id v9 = v8;
  if (v8 == v4 || [(NSString *)v8 isEqualToString:v4])
  {
    id v10 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v24 = 0;
    id v13 = [v7 copyCurrentPersonaContextWithError:&v24];
    id v14 = v24;
    id v15 = v25;
    id v25 = v13;

    if (v14)
    {
      id v16 = brc_bread_crumbs();
      id v17 = brc_default_log();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
        sub_100022DDC();
      }
    }
    id v10 = [v7 generateAndRestorePersonaContextWithPersonaUniqueString:v4];

    if (v10)
    {
      uint64_t v18 = brc_bread_crumbs();
      id v19 = brc_default_log();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        personaID = self->_personaID;
        *(_DWORD *)buf = 138412802;
        uint64_t v27 = (uint64_t)personaID;
        __int16 v28 = 2112;
        uint64_t v29 = v10;
        __int16 v30 = 2112;
        uint64_t v31 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v19, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:
    }
  }
  else
  {
    if (v5 && ([v7 isDataSeparatedPersona] & 1) == 0)
    {
      uint64_t v18 = brc_bread_crumbs();
      id v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_100022EAC();
      }
      id v10 = 0;
      goto LABEL_29;
    }
    v21 = brc_bread_crumbs();
    uint64_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_100022E44();
    }

    id v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
LABEL_10:
  memset(v23, 0, sizeof(v23));
  sub_1000149C4(0, (uint64_t)"-[BRBaseFileEnumerator containerListDidChange]", 449, v23);
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v27 = v23[0];
    __int16 v28 = 2112;
    uint64_t v29 = self;
    __int16 v30 = 2112;
    uint64_t v31 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@ - container list did change, invalidating our change token%@", buf, 0x20u);
  }

  [(BRBaseFileEnumerator *)self invalidateChangeToken];
  [(BRBaseFileEnumerator *)self _signalChange];
  sub_100014B98(v23);

  _BRRestorePersona();
}

- (void)_accountTokenDidChange
{
  if ([(NSString *)self->_personaID isEqualToString:@"__defaultPersonaID__"]
    || (id v3 = self->_personaID) == 0)
  {
    if (qword_100043D68 != -1) {
      dispatch_once(&qword_100043D68, &stru_1000387A8);
    }
    id v4 = (NSString *)(id)qword_100043D70;
    int v5 = 1;
  }
  else
  {
    id v4 = v3;
    int v5 = 0;
  }
  id v6 = +[UMUserManager sharedManager];
  id v7 = [v6 currentPersona];

  id v26 = 0;
  id v8 = [v7 userPersonaUniqueString];
  id v9 = v8;
  if (v8 == v4 || [(NSString *)v8 isEqualToString:v4])
  {
    id v10 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v25 = 0;
    id v14 = [v7 copyCurrentPersonaContextWithError:&v25];
    id v15 = v25;
    id v16 = v26;
    id v26 = v14;

    if (v15)
    {
      id v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u)) {
        sub_100022DDC();
      }
    }
    id v10 = [v7 generateAndRestorePersonaContextWithPersonaUniqueString:v4];

    if (v10)
    {
      id v19 = brc_bread_crumbs();
      unsigned int v20 = brc_default_log();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      {
        personaID = self->_personaID;
        *(_DWORD *)buf = 138412802;
        __int16 v28 = (BRBaseFileEnumerator *)personaID;
        __int16 v29 = 2112;
        __int16 v30 = v10;
        __int16 v31 = 2112;
        __int16 v32 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v20, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:
    }
  }
  else
  {
    if (v5 && ([v7 isDataSeparatedPersona] & 1) == 0)
    {
      id v19 = brc_bread_crumbs();
      unsigned int v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_100022EAC();
      }
      id v10 = 0;
      goto LABEL_29;
    }
    uint64_t v22 = brc_bread_crumbs();
    BOOL v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_100022E44();
    }

    id v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
LABEL_10:
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v28 = self;
    __int16 v29 = 2112;
    __int16 v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - received account did update notification, invalidating change token%@", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007464;
  block[3] = &unk_1000387D0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);

  _BRRestorePersona();
}

- (void)invalidateChangeToken
{
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100022F14();
  }

  int v5 = self;
  objc_sync_enter(v5);
  [(NSMutableArray *)v5->_deletedItemsIdentifiers removeAllObjects];
  [(NSMutableDictionary *)v5->_updatedItemsByIDs removeAllObjects];
  v5->_unint64_t rank = 0;
  uuid_generate(v5->_uuid);
  objc_sync_exit(v5);
}

- (void)_stopObservingAccountChanges
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_isObservingAccountChanges = 0;
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = self;
  objc_sync_enter(v3);
  v3->_invalidated = 1;
  [(BRItemNotificationSending *)v3->_remoteNotificationSender invalidate];
  remoteNotificationSender = v3->_remoteNotificationSender;
  v3->_remoteNotificationSender = 0;

  objc_sync_exit(v3);

  [(BRBaseFileEnumerator *)v3 _stopObservingAccountChanges];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000076D0;
  block[3] = &unk_1000387D0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = (void *)v4;
  if (self->_invalidated) {
    id v6 = " INVALIDATED";
  }
  else {
    id v6 = "";
  }
  if (self->_completedGather) {
    id v7 = "";
  }
  else {
    id v7 = " gathering";
  }
  id v8 = +[NSString stringWithFormat:@"<%@:0x%p foid:%@%s%s>", v4, self, self->_fileObjectID, v6, v7];

  return (NSString *)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextPage, 0);
  objc_storeStrong((id *)&self->_gatherEnumerationObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_deletedItemsIdentifiers, 0);
  objc_storeStrong((id *)&self->_updatedItemsByIDs, 0);
  objc_storeStrong((id *)&self->_remoteNotificationSender, 0);
  objc_storeStrong((id *)&self->_fileObjectID, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end