@interface BRCAppLibrary
- (BOOL)containerMetadataNeedsSyncUp;
- (BOOL)hasActiveAliasQueries;
- (BOOL)hasActiveQueries;
- (BOOL)hasActiveRecursiveQueries;
- (BOOL)hasLocalChanges;
- (BOOL)hasUbiquitousDocuments;
- (BOOL)hasUbiquityClientsConnected;
- (BOOL)includesDataScope;
- (BOOL)integrityCheckBoosting;
- (BOOL)isAppInstalled;
- (BOOL)isCloudDocsAppLibrary;
- (BOOL)isCoordinationPendingForItem:(id)a3;
- (BOOL)isDesktopAppLibrary;
- (BOOL)isDocumentScopePublic;
- (BOOL)isDocumentsAppLibrary;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAppLibrary:(id)a3;
- (BOOL)isForeground;
- (BOOL)isGreedy;
- (BOOL)isStillTargetingSharedServerZone:(id)a3;
- (BOOL)isiCloudDesktopAppLibrary;
- (BOOL)markChildrenLostForItemID:(id)a3 inZone:(id)a4 fileID:(id)a5;
- (BOOL)markChildrenLostForItemID:(id)a3 inZone:(id)a4 fileID:(id)a5 startingFromRow:(unint64_t)a6 hasMoreWork:(BOOL *)a7;
- (BOOL)needsSave;
- (BOOL)rootRecordCreated;
- (BOOL)setStateBits:(unsigned int)a3;
- (BOOL)shouldEvictUploadedItems;
- (BOOL)shouldSaveContainerMetadataServerside;
- (BOOL)wasMovedToCloudDocs;
- (BOOL)zoneHasShareAlias;
- (BRCALRowID)dbRowID;
- (BRCAccountSession)session;
- (BRCAppLibrary)init;
- (BRCAppLibrary)initWithMangledID:(id)a3 dbRowID:(id)a4 zoneRowID:(id)a5 db:(id)a6 plist:(id)a7 session:(id)a8 initialCreation:(BOOL)a9 createdRootOnDisk:(BOOL)a10 createdCZMMoved:(BOOL)a11 rootFileID:(id)a12 childBasehashSalt:(id)a13 saltingState:(unsigned int)a14;
- (BRCAppLibraryDelegate)delegate;
- (BRCFSEventsMonitor)fsEventsMonitor;
- (BRCPQLConnection)db;
- (BRCPrivateClientZone)defaultClientZone;
- (BRCRelativePath)documentsPath;
- (BRCRelativePath)root;
- (BRCSyncContext)transferSyncContext;
- (BRCSyncContext)transferSyncContextIfExists;
- (BRCZoneRowID)zoneRowID;
- (BRContainer)containerMetadata;
- (BRMangledID)mangledID;
- (NSData)childBasehashSalt;
- (NSMutableDictionary)plist;
- (NSNumber)deepScanStamp;
- (NSNumber)fileID;
- (NSNumber)generationID;
- (NSNumber)rootQuotaUsage;
- (NSString)absolutePath;
- (NSString)appLibraryID;
- (NSString)containerMetadataEtag;
- (NSString)description;
- (NSString)identifier;
- (NSString)logName;
- (NSString)pathRelativeToRoot;
- (NSURL)url;
- (brc_task_tracker)tracker;
- (id)_aliasAppLibraryTargetSQLPrefix;
- (id)_targetSharedServerZonesEnumerator;
- (id)_unwrappedDescriptionWithContext:(id)a3;
- (id)aliasByUnsaltedBookmarkData:(id)a3;
- (id)containerMetadataFilledWithTCCInfo;
- (id)coordinatorForItem:(id)a3 forRead:(BOOL)a4;
- (id)descriptionWithContext:(id)a3;
- (id)documentsFolderItemID;
- (id)enumerateUserVisibleChildrenDirectoriesOfItemGlobalID:(id)a3 db:(id)a4;
- (id)enumerateUserVisibleChildrenOfItemGlobalID:(id)a3 sortOrder:(unsigned __int8)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 db:(id)a7;
- (id)fetchDocumentsDirectoryItem;
- (id)fetchDocumentsDirectoryItem:(id)a3;
- (id)fetchRootItem;
- (id)fetchRootItemInDB:(id)a3;
- (id)itemByRowID:(unint64_t)a3;
- (id)itemByRowID:(unint64_t)a3 db:(id)a4;
- (id)itemIDByRowID:(unint64_t)a3;
- (id)itemIDByRowID:(unint64_t)a3 db:(id)a4;
- (id)itemsEnumeratorChildOf:(id)a3 withDeadItems:(BOOL)a4 rankMin:(unint64_t)a5 rankMax:(unint64_t)a6 count:(unint64_t)a7 db:(id)a8;
- (id)itemsEnumeratorWithRankMin:(unint64_t)a3 rankMax:(unint64_t)a4 namePrefix:(id)a5 withDeadItems:(BOOL)a6 shouldIncludeFolders:(BOOL)a7 shouldIncludeOnlyFolders:(BOOL)a8 shouldIncludeDocumentsScope:(BOOL)a9 shouldIncludeDataScope:(BOOL)a10 shouldIncludeExternalScope:(BOOL)a11 shouldIncludeTrashScope:(BOOL)a12 count:(unint64_t)a13 db:(id)a14;
- (id)liveAliasesEnumeratorTargetingThisAppLibrary;
- (id)rootItemGlobalID;
- (id)rootItemID;
- (int64_t)maxLostStamp;
- (int64_t)throttleHashWithItemID:(id)a3;
- (unint64_t)allocateLostStampAddingBackoff:(BOOL)a3;
- (unint64_t)containerMetadataSyncRequestID;
- (unint64_t)documentCountWithDB:(id)a3;
- (unint64_t)documentSizeUsageWithDB:(id)a3;
- (unint64_t)hash;
- (unint64_t)syncedFolderType;
- (unsigned)_activateState:(unsigned int)a3 origState:(unsigned int)a4;
- (unsigned)saltingState;
- (unsigned)state;
- (void)_addTargetSharedServerZone:(id)a3;
- (void)_addTargetSharedServerZoneForSharedItem:(id)a3;
- (void)_removeAllTargetSharedServerZonesWhenNoLongerForeground;
- (void)_removeTargetSharedServerZoneIfNecessary:(id)a3;
- (void)_resolveTargetSharedClientZonesWhenBecameForeground;
- (void)_updateContainerMetadataFromRecord:(id)a3 stripIcons:(BOOL)a4;
- (void)_updateIsInCloudDocsZone;
- (void)activate;
- (void)addClientUsingUbiquity:(id)a3;
- (void)addForegroundClient:(id)a3;
- (void)associateWithClientZone:(id)a3;
- (void)associateWithClientZone:(id)a3 offline:(BOOL)a4;
- (void)cancelFileCoordinators;
- (void)cancelWriteCoordinatorForItem:(id)a3;
- (void)clearStateBits:(unsigned int)a3;
- (void)close;
- (void)computeDocumentEvictableSizeUsageWithDB:(id)a3 reply:(id)a4;
- (void)computeDocumentEvictableSizeUsageWithLowTimeDelta:(double)a3 medTimeDelta:(double)a4 highTimeDelta:(double)a5 db:(id)a6 reply:(id)a7;
- (void)continueMarkingChildrenLostInZone:(id)a3;
- (void)didCreateDataScopedItem;
- (void)didCreateDocumentScopedItem;
- (void)didFindLostItem:(id)a3 oldAppLibrary:(id)a4;
- (void)didReceiveHandoffRequest;
- (void)didRemoveDocumentsFolder;
- (void)didUpdateDocumentScopePublic;
- (void)dumpToContext:(id)a3;
- (void)fetchPristineness;
- (void)fetchTrashItems;
- (void)freeFileCoordinationSlotsAfterDelayForRead:(BOOL)a3;
- (void)fsrootDidMoveToPath:(id)a3;
- (void)integrityCheckBoosting;
- (void)isGreedy;
- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4;
- (void)notifyClient:(id)a3 whenFaultingIsDone:(id)a4;
- (void)recomputeShouldEvictState;
- (void)recreateDocumentsFolderIfNeededOnDisk;
- (void)registerQueryWithAliases:(BOOL)a3 isRecursive:(BOOL)a4;
- (void)removeClientUsingUbiquity:(id)a3;
- (void)removeForegroundClient:(id)a3;
- (void)scheduleContainerMetadataSyncUp;
- (void)scheduleDeepScanWithReason:(id)a3;
- (void)scheduleFullLibraryContentsFetch;
- (void)setChildBasehashSalt:(id)a3;
- (void)setContainerMetadataEtag:(id)a3;
- (void)setContainerMetadataNeedsSyncUp:(BOOL)a3;
- (void)setContainerMetadataSyncRequestID:(unint64_t)a3;
- (void)setDbRowID:(id)a3;
- (void)setDeepScanStamp:(id)a3;
- (void)setDefaultClientZone:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFileID:(id)a3;
- (void)setGenerationID:(id)a3;
- (void)setMaxLostStamp:(int64_t)a3;
- (void)setNeedsSave:(BOOL)a3;
- (void)setRootFileID:(unint64_t)a3;
- (void)setRootQuotaUsage:(id)a3;
- (void)setSaltingState:(unsigned int)a3;
- (void)setSession:(id)a3;
- (void)setZoneRowID:(id)a3;
- (void)unregisterQueryWithAliases:(BOOL)a3 isRecursive:(BOOL)a4;
- (void)updateFromFSAtPath:(id)a3;
- (void)updateWithPlist:(id)a3;
- (void)zoneDidChangeMovedToCloudDocsState;
@end

@implementation BRCAppLibrary

- (NSString)logName
{
  return self->_appLibraryID;
}

- (BOOL)isCloudDocsAppLibrary
{
  return [(NSString *)self->_appLibraryID isEqualToString:*MEMORY[0x1E4F59418]];
}

- (BOOL)isDesktopAppLibrary
{
  return 0;
}

- (BOOL)isDocumentsAppLibrary
{
  return 0;
}

- (BOOL)isiCloudDesktopAppLibrary
{
  if ([(BRCAppLibrary *)self isDesktopAppLibrary]) {
    return 1;
  }
  return [(BRCAppLibrary *)self isDocumentsAppLibrary];
}

- (unint64_t)syncedFolderType
{
  return 1;
}

- (BOOL)includesDataScope
{
  return ![(BRCAppLibrary *)self isCloudDocsAppLibrary];
}

- (BOOL)rootRecordCreated
{
  return (LOBYTE(self->_state) >> 1) & 1;
}

- (void)setNeedsSave:(BOOL)a3
{
  if (self->_needsSave != a3)
  {
    if (a3)
    {
      [(BRCPQLConnection *)self->_db forceBatchStart];
      v5 = brc_bread_crumbs();
      v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[BRCAppLibrary setNeedsSave:]();
      }
    }
    self->_needsSave = a3;
  }
}

- (NSString)absolutePath
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(BRCAppLibrary *)self root];
  v4 = [v3 absolutePath];

  v5 = [(BRCAppLibrary *)self pathRelativeToRoot];
  v6 = [v4 stringByAppendingPathComponent:v5];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] no path for an app library%@", (uint8_t *)&v11, 0xCu);
    }
  }
  return (NSString *)v6;
}

- (NSURL)url
{
  v2 = [(BRCAppLibrary *)self absolutePath];
  if (v2) {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v2 isDirectory:1];
  }
  else {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (BOOL)hasActiveQueries
{
  return atomic_load_explicit((atomic_ullong *volatile)&self->_activeQueries, memory_order_acquire) != 0;
}

- (BOOL)hasActiveRecursiveQueries
{
  return atomic_load_explicit((atomic_ullong *volatile)&self->_activeRecursiveQueries, memory_order_acquire) != 0;
}

- (BRCAppLibrary)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[BRCAppLibrary init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return 0;
}

- (BRCAppLibrary)initWithMangledID:(id)a3 dbRowID:(id)a4 zoneRowID:(id)a5 db:(id)a6 plist:(id)a7 session:(id)a8 initialCreation:(BOOL)a9 createdRootOnDisk:(BOOL)a10 createdCZMMoved:(BOOL)a11 rootFileID:(id)a12 childBasehashSalt:(id)a13 saltingState:(unsigned int)a14
{
  id v20 = a3;
  id v21 = a4;
  id obj = a5;
  id v22 = a5;
  id v82 = a6;
  id v23 = a7;
  id v81 = a8;
  id v80 = a12;
  id v24 = a13;
  v25 = v24;
  if (v21)
  {
    if (v22) {
      goto LABEL_3;
    }
    goto LABEL_30;
  }
  id v74 = v24;
  id v57 = v23;
  id v58 = v22;
  v59 = brc_bread_crumbs();
  v60 = brc_default_log();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
    -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:]();
  }

  id v22 = v58;
  id v23 = v57;
  v25 = v74;
  if (!v22)
  {
LABEL_30:
    v75 = v25;
    id v61 = v23;
    id v62 = v22;
    v63 = brc_bread_crumbs();
    v64 = brc_default_log();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:].cold.4();
    }

    id v22 = v62;
    id v23 = v61;
    v25 = v75;
  }
LABEL_3:
  if (([v20 isPrivate] & 1) == 0)
  {
    v76 = v25;
    id v65 = v23;
    id v66 = v22;
    v67 = brc_bread_crumbs();
    v68 = brc_default_log();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:]();
    }

    id v22 = v66;
    id v23 = v65;
    v25 = v76;
  }
  v83.receiver = self;
  v83.super_class = (Class)BRCAppLibrary;
  v26 = [(BRCAppLibrary *)&v83 init];
  if (v26)
  {
    id v72 = v22;
    id v77 = v23;
    if (v23 && a9)
    {
      v27 = brc_bread_crumbs();
      v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:]();
      }
    }
    v73 = v25;
    objc_msgSend(v20, "appLibraryOrZoneName", v21);
    id v29 = objc_claimAutoreleasedReturnValue();
    uint64_t v30 = brc_task_tracker_create((const char *)[v29 UTF8String]);
    tracker = v26->_tracker;
    v26->_tracker = (brc_task_tracker *)v30;

    v32 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    XPCClientsUsingUbiquity = v26->_XPCClientsUsingUbiquity;
    v26->_XPCClientsUsingUbiquity = v32;

    objc_storeStrong((id *)&v26->_db, a6);
    objc_storeStrong((id *)&v26->_dbRowID, a4);
    objc_storeStrong((id *)&v26->_zoneRowID, obj);
    objc_storeStrong((id *)&v26->_session, a8);
    uint64_t v34 = objc_opt_new();
    targetSharedServerZones = v26->_targetSharedServerZones;
    v26->_targetSharedServerZones = (NSMutableSet *)v34;

    uint64_t v36 = [MEMORY[0x1E4F1CA80] set];
    foregroundClients = v26->_foregroundClients;
    v26->_foregroundClients = (NSMutableSet *)v36;

    objc_storeStrong((id *)&v26->_fileID, a12);
    objc_storeStrong((id *)&v26->_mangledID, a3);
    uint64_t v38 = [v20 appLibraryOrZoneName];
    appLibraryID = v26->_appLibraryID;
    v26->_appLibraryID = (NSString *)v38;

    uint64_t v40 = objc_opt_new();
    pendingFileCoordinators = v26->_pendingFileCoordinators;
    v26->_pendingFileCoordinators = (NSMutableDictionary *)v40;

    uint64_t v42 = brc_current_date_nsec();
    uint64_t v43 = v42;
    if (a9)
    {
      unsigned int state = v26->_state;
      int v45 = state | 0x140000;
      v26->_unsigned int state = state | 0x140000;
      v26->_maxLostStamp = v42;
      id v46 = a13;
      if (!a10 || a11)
      {
        int v47 = state | 0x140800;
        if (a10) {
          int v48 = v45;
        }
        else {
          int v48 = v47;
        }
        if (a11) {
          int v49 = v48 | 0x200000;
        }
        else {
          int v49 = v48;
        }
        v26->_unsigned int state = v49;
      }
      v50 = @"initial creation";
      id v21 = v71;
    }
    else
    {
      id v21 = v71;
      id v46 = a13;
      if (!v71)
      {
        v69 = brc_bread_crumbs();
        v70 = brc_default_log();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT)) {
          -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:]();
        }
      }
      id v23 = v77;
      [(BRCAppLibrary *)v26 updateWithPlist:v77];
      if (v26->_generationID) {
        goto LABEL_25;
      }
      v50 = @"generationID is nil";
    }
    uint64_t v51 = [NSNumber numberWithLongLong:v43];
    deepScanStamp = v26->_deepScanStamp;
    v26->_deepScanStamp = (NSNumber *)v51;

    deepScanReason = v26->_deepScanReason;
    v26->_deepScanReason = &v50->isa;

    v26->_unsigned int state = v26->_state & 0xFFF7FFFB | 4;
    [(BRCAppLibrary *)v26 setNeedsSave:1];
    id v23 = v77;
LABEL_25:
    uint64_t v54 = [MEMORY[0x1E4F594A8] containerForMangledID:v20];
    containerMetadata = v26->_containerMetadata;
    v26->_containerMetadata = (BRContainer *)v54;

    [(BRCAppLibrary *)v26 _updateIsInCloudDocsZone];
    v26->_saltingState = a14;
    objc_storeStrong((id *)&v26->_childBasehashSalt, v46);
    id v22 = v72;
    v25 = v73;
  }

  return v26;
}

- (void)updateWithPlist:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"state"];
  self->_unsigned int state = [v5 unsignedIntValue];

  v6 = [v4 objectForKeyedSubscript:@"fileID"];
  fileID = self->_fileID;
  self->_fileID = v6;

  v8 = [v4 objectForKeyedSubscript:@"generationID"];
  generationID = self->_generationID;
  self->_generationID = v8;

  v10 = [v4 objectForKeyedSubscript:@"maxLostStamp"];
  self->_maxLostStamp = [v10 unsignedLongLongValue];

  int v11 = [v4 objectForKeyedSubscript:@"deepScanStamp"];
  deepScanStamp = self->_deepScanStamp;
  self->_deepScanStamp = v11;

  uint64_t v13 = [v4 objectForKeyedSubscript:@"deepScanReason"];
  deepScanReason = self->_deepScanReason;
  self->_deepScanReason = v13;

  v15 = [v4 objectForKeyedSubscript:@"metadataChangetag"];
  containerMetadataEtag = self->_containerMetadataEtag;
  self->_containerMetadataEtag = v15;

  v17 = [v4 objectForKeyedSubscript:@"metadataNeedsSyncUp"];

  self->_containerMetadataNeedsSyncUp = [v17 BOOLValue];
  [(BRContainer *)self->_containerMetadata setIsInInitialState:([(BRCAppLibrary *)self state] >> 18) & 1];
  if (!self->_generationID)
  {
    [(BRCAppLibrary *)self scheduleDeepScanWithReason:@"generationID is nil after update"];
  }
}

- (void)associateWithClientZone:(id)a3
{
}

- (void)associateWithClientZone:(id)a3 offline:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v4) {
    [(BRCPQLConnection *)self->_db assertOnQueue];
  }
  if (!v6)
  {
    id v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary associateWithClientZone:offline:]();
    }
  }
  v9 = self;
  objc_sync_enter(v9);
  if ([(NSMutableSet *)v9->_foregroundClients count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_defaultClientZone);
    int v11 = [WeakRetained serverZone];
    [v11 removeForegroundClient:v9];

    v12 = [v6 serverZone];
    [v12 addForegroundClient:v9];
  }
  objc_storeWeak((id *)&v9->_defaultClientZone, v6);
  uint64_t v13 = [v6 dbRowID];
  zoneRowID = v9->_zoneRowID;
  v9->_zoneRowID = (BRCZoneRowID *)v13;

  objc_sync_exit(v9);
  [v6 addAppLibrary:v9 offline:v4];
  [(BRCAppLibrary *)v9 _updateIsInCloudDocsZone];
}

- (BOOL)isDocumentScopePublic
{
  v2 = [(BRCAppLibrary *)self containerMetadata];
  char v3 = [v2 isDocumentScopePublic];

  return v3;
}

- (NSMutableDictionary)plist
{
  char v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:12];
  BOOL v4 = [NSNumber numberWithUnsignedInt:self->_state];
  [v3 setObject:v4 forKeyedSubscript:@"state"];

  fileID = self->_fileID;
  if (fileID) {
    [v3 setObject:fileID forKeyedSubscript:@"fileID"];
  }
  generationID = self->_generationID;
  if (generationID) {
    [v3 setObject:generationID forKeyedSubscript:@"generationID"];
  }
  id v7 = [NSNumber numberWithLongLong:self->_maxLostStamp];
  [v3 setObject:v7 forKeyedSubscript:@"maxLostStamp"];

  deepScanStamp = self->_deepScanStamp;
  if (deepScanStamp) {
    [v3 setObject:deepScanStamp forKeyedSubscript:@"deepScanStamp"];
  }
  deepScanReason = self->_deepScanReason;
  if (deepScanReason) {
    [v3 setObject:deepScanReason forKeyedSubscript:@"deepScanReason"];
  }
  containerMetadataEtag = self->_containerMetadataEtag;
  if (containerMetadataEtag) {
    [v3 setObject:containerMetadataEtag forKeyedSubscript:@"metadataChangetag"];
  }
  if (self->_containerMetadataNeedsSyncUp) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"metadataNeedsSyncUp"];
  }
  [v3 setObject:self->_rootQuotaUsage forKeyedSubscript:@"rootQuota"];
  return (NSMutableDictionary *)v3;
}

- (void)close
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [a1 appLibraryID];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] closing app library: %@%@", (uint8_t *)&v6, 0x16u);
}

- (BOOL)isAppInstalled
{
  return (self->_state & 0x800000) == 0;
}

- (void)activate
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !_activated%@", v2, v3, v4, v5, v6);
}

- (unsigned)_activateState:(unsigned int)a3 origState:(unsigned int)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  id v7 = [(BRCAppLibrary *)self defaultClientZone];
  if (a3 != 0x1000000 && (a3 & 0x1000000) != 0)
  {
    int v49 = brc_bread_crumbs();
    v50 = brc_default_log();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary _activateState:origState:]();
    }
  }
  if (self->_state != a3)
  {
    [(BRCAppLibrary *)self setNeedsSave:1];
    self->_unsigned int state = a3;
  }
  if ([(BRCAppLibrary *)self isCloudDocsAppLibrary]
    || [(BRCAppLibrary *)self isiCloudDesktopAppLibrary])
  {
    unsigned int state = self->_state & 0xFFFBFFFF;
    self->_unsigned int state = state;
  }
  else
  {
    unsigned int state = self->_state;
  }
  unsigned int v9 = state ^ a4;
  if (state != a4)
  {
    if (self->_needsSave)
    {
      uint64_t v10 = brc_bread_crumbs();
      int v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v48 = BRCPrettyPrintBitmapWithContext(a4, (uint64_t)&applibrary_state_entries, 0);
        *(_DWORD *)buf = 138412802;
        v60 = self;
        __int16 v61 = 2112;
        id v62 = v48;
        __int16 v63 = 2112;
        v64 = v10;
        _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ state changed, was %@%@", buf, 0x20u);
      }
    }
    if ((v9 & 0xC) != 0)
    {
      unsigned int v12 = self->_state & 0xC;
      uint64_t v13 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsReader];
      v14 = v13;
      if (v12 == 4)
      {

        if (!v14)
        {
          uint64_t v51 = brc_bread_crumbs();
          v52 = brc_default_log();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
            -[BRCAppLibrary _activateState:origState:]();
          }
        }
        v14 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsReader];
        [v14 scheduleAppLibraryForLostScan:self];
      }
      else
      {
        [v13 unscheduleAppLibraryForLostScan:self];
      }
    }
    if ((v9 & 0x80000) != 0 && (self->_state & 0x80000) == 0) {
      [v7 scheduleSyncUp];
    }
    if ((v9 & 0x1800000) != 0x800000) {
      goto LABEL_33;
    }
    if ((a4 & 0x800000) != 0)
    {
      if ([(BRCAccountSession *)self->_session hasOptimizeStorageEnabled])
      {
LABEL_33:
        if ((v9 & 0x40000) != 0)
        {
          unsigned int v20 = [(BRCAppLibrary *)self state];
          [(BRContainer *)self->_containerMetadata setIsInInitialState:(v20 >> 18) & 1];
          [MEMORY[0x1E4F594A8] postContainerListUpdateNotification];
          if ([(BRContainer *)self->_containerMetadata isInInitialState])
          {
            if ([(NSString *)self->_appLibraryID isEqualToString:*MEMORY[0x1E4F59268]])
            {
              id v21 = [(BRCAppLibrary *)self defaultClientZone];
              char v22 = [v21 hasCompletedInitialSyncDownOnce];

              if ((v22 & 1) == 0) {
                [(BRCAppLibrary *)self addForegroundClient:self];
              }
            }
          }
          id WeakRetained = objc_loadWeakRetained((id *)&self->_pristineFetchOp);
          id v24 = WeakRetained;
          if ((v20 & 0x40000) == 0 && WeakRetained)
          {
            [WeakRetained endObservingChangesWithDelegate:self];
            objc_storeWeak((id *)&self->_pristineFetchOp, 0);
          }
        }
        if ((v9 & 0x4000000) != 0 && ([(BRCAppLibrary *)self state] & 0x4000000) != 0)
        {
          BOOL v25 = [(BRCAppLibrary *)self includesDataScope];
          if ((a4 & 0x1000000) == 0 && v25)
          {
            v26 = [(BRCAppLibrary *)self defaultClientZone];
            v27 = [(BRCAppLibrary *)self documentsFolderItemID];
            v28 = [v26 itemByItemID:v27];
            id v29 = [v28 asDirectory];

            uint64_t v30 = [v29 clientZone];
            v31 = [v29 itemID];
            v32 = [v30 serverItemByItemID:v31];

            v33 = [v29 st];
            uint64_t v34 = v33;
            if (v32)
            {
              v35 = [v32 st];
              objc_msgSend(v34, "setType:", objc_msgSend(v35, "type"));
            }
            else
            {
              [v33 setType:0];
            }

            uint64_t v36 = brc_bread_crumbs();
            v37 = brc_default_log();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
              -[BRCAppLibrary _activateState:origState:]();
            }

            [v29 saveToDB];
          }
        }
        if (([(BRCAppLibrary *)self state] & 0x4040000) == 0x40000) {
          [(BRCAppLibrary *)self fetchPristineness];
        }
        if ((v9 & 0x4000000) != 0 && ([(BRCAppLibrary *)self state] & 0x14000000) == 0x4000000) {
          [(BRCAppLibrary *)self fetchTrashItems];
        }
        if ((a4 & 0x140000) != 0 && (v9 & 0x140000) != 0) {
          [v7 scheduleSyncUp];
        }
        if ((v9 & 0x200000) != 0 && ![(BRCAppLibrary *)self isCloudDocsAppLibrary])
        {
          [(BRCAppLibrary *)self zoneDidChangeMovedToCloudDocsState];
          if ([(BRCAppLibrary *)self wasMovedToCloudDocs])
          {
            uint64_t v38 = [(BRCAccountSession *)self->_session applyScheduler];
            [v38 didCompleteCrossZoneMigrationForAppLibrary:self];
          }
        }
        if ((v9 & 0x800) != 0 && ([(BRCAppLibrary *)self state] & 0x800) == 0)
        {
          if ([(BRCAppLibrary *)self isCloudDocsAppLibrary])
          {
            session = self->_session;
            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v57[2] = __42__BRCAppLibrary__activateState_origState___block_invoke;
            v57[3] = &unk_1E6996110;
            v57[4] = self;
            [(BRCAccountSession *)session enumerateSharedClientZones:v57];
          }
          else
          {
            long long v55 = 0u;
            long long v56 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            uint64_t v40 = self->_targetSharedServerZones;
            uint64_t v41 = [(NSMutableSet *)v40 countByEnumeratingWithState:&v53 objects:v58 count:16];
            if (v41)
            {
              uint64_t v42 = v41;
              uint64_t v43 = *(void *)v54;
              do
              {
                for (uint64_t i = 0; i != v42; ++i)
                {
                  if (*(void *)v54 != v43) {
                    objc_enumerationMutation(v40);
                  }
                  uint64_t v45 = *(void *)(*((void *)&v53 + 1) + 8 * i);
                  id v46 = [(BRCAccountSession *)self->_session applyScheduler];
                  [v46 rescheduleSuspendedJobsMatching:v45 inState:22];
                }
                uint64_t v42 = [(NSMutableSet *)v40 countByEnumeratingWithState:&v53 objects:v58 count:16];
              }
              while (v42);
            }
          }
        }
        goto LABEL_76;
      }
      v18 = brc_bread_crumbs();
      v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v60 = self;
        __int16 v61 = 2112;
        id v62 = v18;
        _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[NOTICE] downloading everything in %@ because the app is now installed%@", buf, 0x16u);
      }

      v17 = [(BRCAppLibrary *)self fetchRootItem];
      [v17 startDownloadInTask:self->_tracker options:1 etagIfLoser:0 stageFileName:0 error:0];
    }
    else
    {
      v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v60 = self;
        __int16 v61 = 2112;
        id v62 = v15;
        _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEFAULT, "[NOTICE] evicting everything in %@ because the app was removed%@", buf, 0x16u);
      }

      v17 = [(BRCAppLibrary *)self fetchRootItem];
      [v17 evictInTask:self->_tracker options:5 error:0];
    }

    goto LABEL_33;
  }
LABEL_76:
  objc_msgSend(v7, "_flushIdleBlocksIfNeeded", (void)v53);

  return v9;
}

uint64_t __42__BRCAppLibrary__activateState_origState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 104);
  id v3 = a2;
  uint64_t v4 = [v2 applyScheduler];
  uint64_t v5 = [v3 sharedZone];

  [v4 rescheduleSuspendedJobsMatching:v5 inState:22];
  return 1;
}

- (BOOL)setStateBits:(unsigned int)a3
{
  unsigned int state = self->_state;
  BOOL v4 = (a3 & ~state) != 0;
  -[BRCAppLibrary _activateState:origState:](self, "_activateState:origState:", state | a3);
  return v4;
}

- (void)clearStateBits:(unsigned int)a3
{
}

- (void)didUpdateDocumentScopePublic
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = brc_bread_crumbs();
  BOOL v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [(BRCAppLibrary *)self appLibraryID];
    uint8_t v6 = [(BRCAppLibrary *)self containerMetadata];
    int v7 = [v6 isDocumentScopePublic];
    __int16 v8 = @"private";
    int v12 = 138412802;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    if (v7) {
      __int16 v8 = @"public";
    }
    v15 = v8;
    __int16 v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_INFO, "[INFO] %@ becomes %@%@", (uint8_t *)&v12, 0x20u);
  }
  unsigned int v9 = [(BRCAppLibrary *)self defaultClientZone];
  [(BRCAppLibrary *)self scheduleDeepScanWithReason:@"state of documentScopePublic changed"];
  [(BRCAccountSession *)self->_session recomputeAppSyncBlockStateForPrivateClientZone:v9];
  uint64_t v10 = [(BRCAppLibrary *)self containerMetadata];
  if ([v10 isDocumentScopePublic])
  {
    BOOL v11 = [(BRCAppLibrary *)self wasMovedToCloudDocs];

    if (!v11) {
      [v9 clearAndRefetchRecentAndFavoriteDocuments];
    }
  }
  else
  {
  }
}

- (BOOL)isGreedy
{
  id v3 = [(BRCAppLibrary *)self session];
  char v4 = [v3 hasOptimizeStorageEnabled];

  if (v4)
  {
    uint64_t v5 = +[BRCUserDefaults defaultsForMangledID:self->_mangledID];
    if ([v5 shouldAppLibraryBeGreedy])
    {
      uint8_t v6 = brc_bread_crumbs();
      int v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[BRCAppLibrary isGreedy]();
      }
LABEL_18:

LABEL_19:
      char v10 = 1;
      goto LABEL_20;
    }
    if (![(BRCAppLibrary *)self shouldEvictUploadedItems])
    {
      if (![(BRCAppLibrary *)self hasUbiquityClientsConnected])
      {
        int v12 = [(BRCAppLibrary *)self session];
        char v10 = [v12 isGreedy];

        goto LABEL_20;
      }
      uint8_t v6 = brc_bread_crumbs();
      int v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[BRCAppLibrary isGreedy]();
      }
      goto LABEL_18;
    }
    __int16 v8 = brc_bread_crumbs();
    unsigned int v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCAppLibrary isGreedy]();
    }
  }
  else
  {
    if (![(BRCAppLibrary *)self shouldEvictUploadedItems])
    {
      uint64_t v5 = brc_bread_crumbs();
      uint8_t v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[BRCAppLibrary isGreedy].cold.5();
      }
      goto LABEL_19;
    }
    uint64_t v5 = brc_bread_crumbs();
    __int16 v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCAppLibrary isGreedy].cold.4();
    }
  }

  char v10 = 0;
LABEL_20:

  return v10;
}

- (BOOL)isEqualToAppLibrary:(id)a3
{
  char v4 = a3;
  uint64_t v5 = [v4 mangledID];
  if (v5) {
    char v6 = [(BRMangledID *)self->_mangledID isEqualToMangledID:v4[12]];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(BRMangledID *)self->_mangledID hash];
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (BRCAppLibrary *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(BRCAppLibrary *)self isEqualToAppLibrary:v4];
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)[(BRCAppLibrary *)self descriptionWithContext:0];
}

- (id)_unwrappedDescriptionWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BRCAppLibrary *)self transferSyncContextIfExists];

  if (v5)
  {
    if ([(BRCAppLibrary *)self isForeground])
    {
      char v6 = @"foreground";
      uint64_t v7 = 7;
      goto LABEL_7;
    }
    char v6 = @"background";
  }
  else
  {
    char v6 = @"NA";
  }
  uint64_t v7 = 2;
LABEL_7:
  __int16 v8 = +[BRCDumpContext highlightedString:v6 type:v7 context:v4];
  id v9 = objc_alloc(MEMORY[0x1E4F28E78]);
  appLibraryID = self->_appLibraryID;
  dbRowID = self->_dbRowID;
  int v12 = BRCPrettyPrintBitmapWithContext(self->_state, (uint64_t)&applibrary_state_entries, v4);
  uint64_t v13 = (void *)[v9 initWithFormat:@"%@[%@] %@ {s:%@} ino:%@ gen:%@", appLibraryID, dbRowID, v8, v12, self->_fileID, self->_generationID];

  deepScanStamp = self->_deepScanStamp;
  v15 = @" ago";
  if (deepScanStamp)
  {
    [(NSNumber *)deepScanStamp longLongValue];
    brc_current_date_nsec();
    brc_interval_from_nsec();
    if (v16 >= 0.0) {
      v15 = &stru_1F2AC7720;
    }
    else {
      double v16 = -v16;
    }
    v17 = +[BRCDumpContext stringFromInterval:v4 context:v16];
    [v13 appendFormat:@" deep-scan:%@%@ -reason:%@", v17, v15, self->_deepScanReason];
  }
  [v13 appendString:@" queries:"];
  if ([(BRCAppLibrary *)self hasActiveQueries]) {
    [v13 appendString:@"q"];
  }
  if ([(BRCAppLibrary *)self hasActiveRecursiveQueries]) {
    [v13 appendString:@"r"];
  }
  if ([(BRCAppLibrary *)self hasActiveAliasQueries]) {
    [v13 appendString:@"a"];
  }
  if ([(BRCAppLibrary *)self containerMetadataNeedsSyncUp]) {
    uint64_t v18 = "needs-sync-up";
  }
  else {
    uint64_t v18 = "idle";
  }
  v19 = [(BRCAppLibrary *)self containerMetadataEtag];
  unsigned int v20 = [(BRCAppLibrary *)self containerMetadata];
  id v21 = [v20 shortDescription];
  [v13 appendFormat:@" metadata:%s etag:%@ %@", v18, v19, v21];

  if ((self->_state & 4) != 0)
  {
    brc_current_date_nsec();
    brc_interval_from_nsec();
    if (v22 >= 0.0)
    {
      id v23 = &stru_1F2AC7720;
    }
    else
    {
      double v22 = -v22;
      id v23 = @" ago";
    }
    id v24 = +[BRCDumpContext stringFromInterval:v4 context:v22];
    [v13 appendFormat:@" max-lost:%@%@", v24, v23];
  }
  BOOL v25 = [(BRCAppLibrary *)self containerMetadata];
  v26 = [v25 bundleIdentifiers];

  if ([v26 count])
  {
    v27 = [v26 allObjects];
    v28 = [v27 componentsJoinedByString:@", "];
    [v13 appendFormat:@" bundles:{%@}", v28];
  }
  id v29 = +[BRCUserDefaults defaultsForMangledID:0];
  int v30 = [v29 supportsEnhancedDrivePrivacy];

  if (v30)
  {
    uint64_t saltingState = (int)self->_saltingState;
    v32 = saltingState > 3 ? @"no server item" : off_1E6996130[saltingState];
    [v13 appendFormat:@" salt-st{%@}", v32];
    childBasehashSalt = self->_childBasehashSalt;
    if (childBasehashSalt)
    {
      uint64_t v34 = [(NSData *)childBasehashSalt brc_truncatedSHA256];
      v35 = objc_msgSend(v34, "brc_hexadecimalString");
      [v13 appendFormat:@" child-base-salt-validation{%@}", v35];
    }
  }

  return v13;
}

- (id)descriptionWithContext:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [(BRCAppLibrary *)self _unwrappedDescriptionWithContext:v5];

  __int16 v8 = (void *)[v6 initWithFormat:@"<%@>", v7];
  return v8;
}

- (void)dumpToContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(BRCAppLibrary *)self descriptionWithContext:v4];
  [v4 writeLineWithFormat:@"+ app library: %@", v5];

  if ([(BRCAppLibrary *)self isForeground])
  {
    [v4 pushIndentation];
    [v4 writeLineWithFormat:@"+ foreground clients:"];
    [v4 pushIndentation];
    id v6 = self;
    objc_sync_enter(v6);
    uint64_t v7 = (void *)[(NSMutableSet *)v6->_foregroundClients copy];
    objc_sync_exit(v6);

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          [v4 writeLineWithFormat:@"%@", *(void *)(*((void *)&v12 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [v4 popIndentation];
    [v4 popIndentation];
  }
}

- (id)itemsEnumeratorWithRankMin:(unint64_t)a3 rankMax:(unint64_t)a4 namePrefix:(id)a5 withDeadItems:(BOOL)a6 shouldIncludeFolders:(BOOL)a7 shouldIncludeOnlyFolders:(BOOL)a8 shouldIncludeDocumentsScope:(BOOL)a9 shouldIncludeDataScope:(BOOL)a10 shouldIncludeExternalScope:(BOOL)a11 shouldIncludeTrashScope:(BOOL)a12 count:(unint64_t)a13 db:(id)a14
{
  BOOL v61 = a6;
  BOOL v62 = a8;
  BOOL v14 = a7;
  id v17 = a5;
  id v18 = a14;
  if (itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__once == -1)
  {
    if (a9) {
      goto LABEL_9;
    }
  }
  else
  {
    dispatch_once(&itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__once, &__block_literal_global_17);
    if (a9) {
      goto LABEL_9;
    }
  }
  if (a10 || a11)
  {
LABEL_9:
    BOOL v60 = v14;
    unint64_t v58 = a4;
    unint64_t v59 = a3;
    if ([v17 length])
    {
      id v22 = v17;
      id v23 = objc_msgSend(v17, "br_stringByBackslashEscapingCharactersInString:", @"\\_%");
      id v24 = [NSString stringWithFormat:@"%@%%", v23];
      BOOL v25 = [NSString stringWithFormat:@"%% %@%%", v23];
      v19 = [MEMORY[0x1E4FBA8F8] formatInjection:@"AND (item_filename LIKE %@ ESCAPE '\\' OR item_filename LIKE %@ ESCAPE '\\')", v24, v25];

      if (a9) {
        goto LABEL_15;
      }
    }
    else
    {
      id v22 = v17;
      v19 = [MEMORY[0x1E4FBA908] rawInjection:"" length:0];
      if (a9) {
        goto LABEL_15;
      }
    }
    if (!a10)
    {
      uint64_t v20 = 0;
      goto LABEL_20;
    }
LABEL_15:
    v26 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInEitherScope;
    if (!a9 || !a10) {
      v26 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDocumentScope;
    }
    if (!a9) {
      v26 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDataScope;
    }
    uint64_t v20 = (uint64_t)(id)*v26;
LABEL_20:
    id v17 = v22;
    v27 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInExternalScope;
    if (a11) {
      v28 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInExternalScope;
    }
    else {
      v28 = 0;
    }
    unint64_t v29 = v28;
    if (v20 | v29)
    {
      int v30 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInTrashScope;
      if (!a12) {
        int v30 = 0;
      }
      id v31 = v30;
      v32 = (void *)MEMORY[0x1E4FBA8F8];
      v33 = (void *)v20;
      if (v20)
      {
        if (v29) {
          goto LABEL_28;
        }
        goto LABEL_56;
      }
    }
    else
    {
      v44 = brc_bread_crumbs();
      uint64_t v45 = brc_default_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
        -[BRCAppLibrary itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:]();
      }

      id v46 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInTrashScope;
      if (!a12) {
        id v46 = 0;
      }
      id v31 = v46;
      v32 = (void *)MEMORY[0x1E4FBA8F8];
    }
    v33 = [MEMORY[0x1E4FBA908] rawInjection:"0" length:1];
    if (v29)
    {
LABEL_28:
      if (v31) {
        goto LABEL_29;
      }
      goto LABEL_57;
    }
LABEL_56:
    v27 = [MEMORY[0x1E4FBA908] rawInjection:"0" length:1];
    if (v31)
    {
LABEL_29:
      uint64_t v34 = [v32 formatInjection:@"AND ((%@) OR (%@) OR (%@))", v33, v27, v31];
      if (v29) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
LABEL_57:
    int v47 = [MEMORY[0x1E4FBA908] rawInjection:"0" length:1];
    uint64_t v34 = [v32 formatInjection:@"AND ((%@) OR (%@) OR (%@))", v33, v27, v47];

    if (v29)
    {
LABEL_31:
      if (!v20) {

      }
      dbRowID = self->_dbRowID;
      int v36 = !v60 || v62;
      if (v61)
      {
        if (v36)
        {
          v37 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isFolder;
          if (!v60) {
            v37 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isDocument;
          }
          long long v54 = v34;
          unint64_t v56 = a13;
          v50 = v19;
          uint64_t v52 = *v37;
          int v48 = self->_dbRowID;
          uint64_t v38 = @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp    FROM client_items   WHERE item_notifs_rank >= %lld     AND item_notifs_rank < %lld     AND +app_library_rowid = %@     AND item_state IN (0, -1, 1)     %@      %@      %@ ORDER BY item_notifs_rank   LIMIT %lld";
LABEL_42:
          uint64_t v40 = objc_msgSend(v18, "fetch:", v38, v59, v58, v48, v50, v52, v54, v56);
LABEL_46:
          v64[0] = MEMORY[0x1E4F143A8];
          v64[1] = 3221225472;
          v64[2] = __234__BRCAppLibrary_itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db___block_invoke_164;
          v64[3] = &unk_1E6994148;
          v64[4] = self;
          id v65 = v18;
          id v21 = [v40 enumerateObjects:v64];

          goto LABEL_47;
        }
        uint64_t v41 = [MEMORY[0x1E4FBA908] rawInjection:"" length:0];
        long long v55 = v34;
        unint64_t v57 = a13;
        uint64_t v51 = v19;
        long long v53 = v41;
        int v49 = dbRowID;
        uint64_t v42 = @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp    FROM client_items   WHERE item_notifs_rank >= %lld     AND item_notifs_rank < %lld     AND +app_library_rowid = %@     AND item_state IN (0, -1, 1)     %@      %@      %@ ORDER BY item_notifs_rank   LIMIT %lld";
      }
      else
      {
        if (v36)
        {
          v39 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isFolder;
          if (!v60) {
            v39 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isDocument;
          }
          long long v54 = v34;
          unint64_t v56 = a13;
          v50 = v19;
          uint64_t v52 = *v39;
          int v48 = self->_dbRowID;
          uint64_t v38 = @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp    FROM client_items   WHERE item_notifs_rank >= %lld     AND item_notifs_rank < %lld     AND +app_library_rowid = %@     AND item_state IN (0, -1)     %@      %@      %@ ORDER BY item_notifs_rank   LIMIT %lld";
          goto LABEL_42;
        }
        uint64_t v41 = [MEMORY[0x1E4FBA908] rawInjection:"" length:0];
        long long v55 = v34;
        unint64_t v57 = a13;
        uint64_t v51 = v19;
        long long v53 = v41;
        int v49 = dbRowID;
        uint64_t v42 = @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp    FROM client_items   WHERE item_notifs_rank >= %lld     AND item_notifs_rank < %lld     AND +app_library_rowid = %@     AND item_state IN (0, -1)     %@      %@      %@ ORDER BY item_notifs_rank   LIMIT %lld";
      }
      uint64_t v40 = objc_msgSend(v18, "fetch:", v42, v59, v58, v49, v51, v53, v55, v57);

      goto LABEL_46;
    }
LABEL_30:

    goto LABEL_31;
  }
  v19 = brc_bread_crumbs();
  uint64_t v20 = brc_default_log();
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_FAULT)) {
    -[BRCAppLibrary itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:]();
  }
  id v21 = 0;
LABEL_47:

  return v21;
}

void __234__BRCAppLibrary_itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db___block_invoke()
{
  [MEMORY[0x1E4FBA908] rawInjection:"item_type != 3" length:14];
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [MEMORY[0x1E4FBA8F8] formatInjection:@"item_scope = 2 AND %@", v14];
  uint64_t v1 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDocumentScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDocumentScope = v0;

  uint64_t v2 = [MEMORY[0x1E4FBA8F8] formatInjection:@"item_scope = 1 AND %@", v14];
  id v3 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDataScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDataScope = v2;

  uint64_t v4 = [MEMORY[0x1E4FBA8F8] formatInjection:@"(%@) OR (%@)", itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDocumentScope, itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDataScope];
  id v5 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInEitherScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInEitherScope = v4;

  uint64_t v6 = [MEMORY[0x1E4FBA8F8] formatInjection:@"(   item_scope = 2 OR item_scope = 1) AND item_type = 3"];
  uint64_t v7 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInExternalScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInExternalScope = v6;

  uint64_t v8 = [MEMORY[0x1E4FBA908] rawInjection:"item_scope = 3" length:14];
  uint64_t v9 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInTrashScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInTrashScope = v8;

  uint64_t v10 = objc_msgSend(MEMORY[0x1E4FBA908], "rawInjection:length:", "AND item_type IN (1, 2, 8, 5, 6, 7)", 35);
  uint64_t v11 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isDocument;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isDocument = v10;

  uint64_t v12 = [MEMORY[0x1E4FBA908] rawInjection:"AND item_type = 0" length:17];
  long long v13 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isFolder;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isFolder = v12;
}

id __234__BRCAppLibrary_itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db___block_invoke_164(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 session];
  uint64_t v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)itemsEnumeratorChildOf:(id)a3 withDeadItems:(BOOL)a4 rankMin:(unint64_t)a5 rankMax:(unint64_t)a6 count:(unint64_t)a7 db:(id)a8
{
  BOOL v11 = a4;
  id v14 = a8;
  id v15 = a3;
  double v16 = [v15 itemID];
  if (v11)
  {
    id v17 = "";
    uint64_t v18 = 0;
  }
  else
  {
    id v17 = "AND item_state IN (0, -1)";
    uint64_t v18 = 25;
  }
  v19 = [MEMORY[0x1E4FBA908] rawInjection:v17 length:v18];
  uint64_t v20 = [v15 zoneRowID];

  id v21 = (void *)[v14 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp    FROM client_items   WHERE item_parent_id = %@      AND item_notifs_rank >= %lld      AND item_notifs_rank < %lld     %@      AND item_parent_zone_rowid = %@ ORDER BY item_notifs_rank   LIMIT %lld", v16, a5, a6, v19, v20, a7];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __79__BRCAppLibrary_itemsEnumeratorChildOf_withDeadItems_rankMin_rankMax_count_db___block_invoke;
  v25[3] = &unk_1E6994148;
  v25[4] = self;
  id v26 = v14;
  id v22 = v14;
  id v23 = [v21 enumerateObjects:v25];

  return v23;
}

id __79__BRCAppLibrary_itemsEnumeratorChildOf_withDeadItems_rankMin_rankMax_count_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 session];
  uint64_t v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)enumerateUserVisibleChildrenOfItemGlobalID:(id)a3 sortOrder:(unsigned __int8)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 db:(id)a7
{
  int v10 = a4;
  id v12 = a3;
  id v13 = a7;
  if (v10 == 1)
  {
    id v14 = (void *)MEMORY[0x1E4FBA908];
    id v15 = "version_mtime DESC";
    uint64_t v16 = 18;
    goto LABEL_5;
  }
  if (!v10)
  {
    id v14 = (void *)MEMORY[0x1E4FBA908];
    id v15 = "item_filename";
    uint64_t v16 = 13;
LABEL_5:
    id v17 = [v14 rawInjection:v15 length:v16];
    goto LABEL_7;
  }
  id v17 = 0;
LABEL_7:
  uint64_t v18 = [v12 itemID];
  v19 = [v12 zoneRowID];
  uint64_t v20 = (void *)[v13 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp    FROM client_items   WHERE item_parent_id = %@      AND item_state IN (0, -1)     AND item_parent_zone_rowid = %@     AND (item_user_visible = 1 OR item_scope = 3) ORDER BY %@   LIMIT  %lld   OFFSET %lld", v18, v19, v17, a6, a5];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __86__BRCAppLibrary_enumerateUserVisibleChildrenOfItemGlobalID_sortOrder_offset_limit_db___block_invoke;
  v24[3] = &unk_1E6994148;
  v24[4] = self;
  id v25 = v13;
  id v21 = v13;
  id v22 = [v20 enumerateObjects:v24];

  return v22;
}

id __86__BRCAppLibrary_enumerateUserVisibleChildrenOfItemGlobalID_sortOrder_offset_limit_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 session];
  uint64_t v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)enumerateUserVisibleChildrenDirectoriesOfItemGlobalID:(id)a3 db:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 itemID];
  uint64_t v9 = [v7 zoneRowID];

  int v10 = (void *)[v6 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp     FROM client_items    WHERE item_parent_id = %@       AND item_state IN (0, -1)      AND item_type = 0      AND item_parent_zone_rowid = %@       AND item_user_visible = 1  ORDER BY item_filename    LIMIT %lld", v8, v9, 1000];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__BRCAppLibrary_enumerateUserVisibleChildrenDirectoriesOfItemGlobalID_db___block_invoke;
  v14[3] = &unk_1E6994148;
  v14[4] = self;
  id v15 = v6;
  id v11 = v6;
  id v12 = [v10 enumerateObjects:v14];

  return v12;
}

id __74__BRCAppLibrary_enumerateUserVisibleChildrenDirectoriesOfItemGlobalID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  uint64_t v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (void)didRemoveDocumentsFolder
{
}

- (void)didCreateDocumentScopedItem
{
}

- (void)didCreateDataScopedItem
{
}

- (void)fetchPristineness
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Listing documents folder to fetch pristineness for %@%@");
}

- (void)scheduleFullLibraryContentsFetch
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: We shouldn't be scheduling a full app library contents fetch when sync is blocked for %@%@");
}

- (void)fetchTrashItems
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Listing trash folder for %@%@");
}

void __32__BRCAppLibrary_fetchTrashItems__block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    block[7] = v2;
    block[8] = v3;
    id v5 = [*(id *)(*(void *)(a1 + 32) + 112) serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__BRCAppLibrary_fetchTrashItems__block_invoke_2;
    block[3] = &unk_1E6993698;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v5, block);
  }
}

uint64_t __32__BRCAppLibrary_fetchTrashItems__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStateBits:0x10000000];
}

- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  p_pristineFetchOp = &self->_pristineFetchOp;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pristineFetchOp);

  if (WeakRetained == v10
    || (p_pristineFetchOp = &self->_trashFetchOp,
        id v9 = objc_loadWeakRetained((id *)&self->_trashFetchOp),
        v9,
        v9 == v10))
  {
    objc_storeWeak((id *)p_pristineFetchOp, v6);
  }
}

- (int64_t)throttleHashWithItemID:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCAppLibrary *)self appLibraryID];
  uint64_t v6 = [v5 hash];
  uint64_t v7 = [v4 hash];

  return v7 ^ v6;
}

- (BOOL)hasUbiquitousDocuments
{
  id v2 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT 1 FROM client_items  WHERE item_type NOT IN (0, 9, 10, 4)    AND item_state IN (0, -1)    AND app_library_rowid = %@ LIMIT 1", self->_dbRowID];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasLocalChanges
{
  id v2 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT auto_document_with_local_changes_count > 0 FROM app_libraries WHERE rowid = %@", self->_dbRowID];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)zoneHasShareAlias
{
  id v2 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT EXISTS (SELECT 1 FROM server_items WHERE zone_rowid = %@ AND item_type = 3 AND item_alias_target like '%%:\\_%%' ESCAPE '\\')", self->_dbRowID];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)addForegroundClient:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v20 = brc_bread_crumbs();
    id v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary addForegroundClient:]();
    }
  }
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v26 = v5;
    __int16 v27 = 2112;
    id v28 = v4;
    __int16 v29 = 2112;
    int v30 = v6;
    _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - adding foreground client %@%@", buf, 0x20u);
  }

  uint64_t v8 = [(NSMutableSet *)v5->_foregroundClients count];
  if ([(NSMutableSet *)v5->_foregroundClients containsObject:v4])
  {
    id v22 = brc_bread_crumbs();
    id v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary addForegroundClient:]();
    }
  }
  [(NSMutableSet *)v5->_foregroundClients addObject:v4];
  if (!v8)
  {
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCAppLibrary addForegroundClient:]();
    }

    [(BRCAppLibrary *)v5 _resolveTargetSharedClientZonesWhenBecameForeground];
    id v11 = [(BRCAppLibrary *)v5 defaultClientZone];
    id v12 = [v11 serverZone];

    if ([v12 isCloudDocsZone]
      && ([(BRCAppLibrary *)v5 mangledID],
          id v13 = objc_claimAutoreleasedReturnValue(),
          +[BRCUserDefaults defaultsForMangledID:v13],
          id v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v14 shouldBoostDefaultZone],
          v14,
          v13,
          (v15 & 1) == 0))
    {
      brc_bread_crumbs();
      uint64_t v16 = (BRCAppLibrary *)objc_claimAutoreleasedReturnValue();
      id v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v16;
        _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Preventing boosting default server zone%@", buf, 0xCu);
      }
    }
    else
    {
      [v12 addForegroundClient:v5];
    }
    uint64_t v18 = [(BRCAppLibrary *)v5 transferSyncContext];
    [v18 addForegroundClient:v5];
    if (![(NSMutableSet *)v5->_targetSharedServerZones count])
    {
      v19 = [(BRCPQLConnection *)v5->_db serialQueue];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __37__BRCAppLibrary_addForegroundClient___block_invoke;
      v24[3] = &unk_1E6993698;
      v24[4] = v5;
      dispatch_async_with_logs_3(v19, v24);
    }
  }
  objc_sync_exit(v5);
}

void __37__BRCAppLibrary_addForegroundClient___block_invoke(uint64_t a1)
{
  os_log_t v1 = (void *)(a1 + 32);
  if ([*(id *)(a1 + 32) zoneHasShareAlias])
  {
    *(unsigned char *)(*v1 + 129) = 1;
    id v2 = [*(id *)(*v1 + 104) syncContextProvider];
    char v3 = [v2 sharedMetadataSyncContext];

    [v3 addForegroundClient:*v1];
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __37__BRCAppLibrary_addForegroundClient___block_invoke_cold_1(v1);
    }
  }
}

- (void)removeForegroundClient:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary addForegroundClient:]();
    }
  }
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v22 = v5;
    __int16 v23 = 2112;
    id v24 = v4;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - removing foreground client %@%@", buf, 0x20u);
  }

  uint64_t v8 = [(NSMutableSet *)v5->_foregroundClients count];
  if (([(NSMutableSet *)v5->_foregroundClients containsObject:v4] & 1) == 0)
  {
    uint64_t v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary removeForegroundClient:]();
    }
  }
  [(NSMutableSet *)v5->_foregroundClients removeObject:v4];
  if (v8 && ![(NSMutableSet *)v5->_foregroundClients count])
  {
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCAppLibrary removeForegroundClient:]();
    }

    [(BRCAppLibrary *)v5 _removeAllTargetSharedServerZonesWhenNoLongerForeground];
    id v11 = [(BRCAppLibrary *)v5 defaultClientZone];
    id v12 = [v11 serverZone];

    [v12 removeForegroundClient:v5];
    id v13 = [(BRCAppLibrary *)v5 transferSyncContext];
    [v13 removeForegroundClient:v5];
    id v14 = [(BRCAccountSession *)v5->_session clientDB];
    char v15 = [v14 serialQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __40__BRCAppLibrary_removeForegroundClient___block_invoke;
    v20[3] = &unk_1E6993698;
    v20[4] = v5;
    dispatch_async_with_logs_3(v15, v20);
  }
  objc_sync_exit(v5);
}

void __40__BRCAppLibrary_removeForegroundClient___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 129))
  {
    char v3 = [*(id *)(v1 + 104) syncContextProvider];
    id v4 = [v3 sharedMetadataSyncContext];

    [v4 removeForegroundClient:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(a1 + 32) + 129) = 0;
  }
}

- (BOOL)isForeground
{
  id v2 = [(BRCAppLibrary *)self transferSyncContextIfExists];
  char v3 = [v2 isForeground];

  return v3;
}

- (BOOL)integrityCheckBoosting
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  char v3 = [(BRCAccountSession *)self->_session clientDB];
  [v3 assertOnQueue];

  id v4 = [(BRCAppLibrary *)self defaultClientZone];
  id v5 = [v4 serverZone];
  uint64_t v6 = [v5 metadataSyncContextIfExists];

  uint64_t v7 = [(BRCAppLibrary *)self transferSyncContextIfExists];
  uint64_t v8 = [(NSMutableSet *)self->_foregroundClients count];
  id v9 = [v7 foregroundClients];
  int v10 = [v9 containsObject:self];

  if (v8)
  {
    if ((v10 & 1) == 0)
    {
      char v15 = brc_bread_crumbs();
      id v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCAppLibrary integrityCheckBoosting].cold.4();
      }
      goto LABEL_36;
    }
    id v11 = [v6 foregroundClients];
    char v12 = [v11 containsObject:self];

    if ((v12 & 1) == 0)
    {
      char v15 = brc_bread_crumbs();
      id v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCAppLibrary integrityCheckBoosting]();
      }
      goto LABEL_36;
    }
    int v36 = v6;
    id v13 = [(BRCAppLibrary *)self _targetSharedServerZonesEnumerator];
    id v14 = [(NSMutableSet *)self->_targetSharedServerZones mutableCopy];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    char v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (!v16) {
      goto LABEL_14;
    }
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v38;
    v35 = v7;
LABEL_6:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v38 != v18) {
        objc_enumerationMutation(v15);
      }
      uint64_t v20 = *(BRCAppLibrary **)(*((void *)&v37 + 1) + 8 * v19);
      if ((-[NSObject containsObject:](v14, "containsObject:", v20, v35) & 1) == 0) {
        break;
      }
      [v14 removeObject:v20];
      id v21 = [(BRCAppLibrary *)v20 transferSyncContextIfExists];
      id v22 = [v21 foregroundClients];
      char v23 = [v22 containsObject:self];

      if ((v23 & 1) == 0)
      {
        id v28 = brc_bread_crumbs();
        v32 = brc_default_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
          goto LABEL_40;
        }
        goto LABEL_34;
      }
      id v24 = [(BRCAppLibrary *)v20 metadataSyncContextIfExists];
      __int16 v25 = [v24 foregroundClients];
      char v26 = [v25 containsObject:self];

      if ((v26 & 1) == 0)
      {
        id v28 = brc_bread_crumbs();
        v32 = brc_default_log();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
          goto LABEL_34;
        }
LABEL_40:
        *(_DWORD *)buf = 138412802;
        uint64_t v42 = v20;
        __int16 v43 = 2112;
        v44 = self;
        __int16 v45 = 2112;
        id v46 = v28;
        v33 = "[CRIT] UNREACHABLE: target shared zone %@ of %@ should be boosted%@";
LABEL_41:
        _os_log_fault_impl(&dword_1D353B000, v32, OS_LOG_TYPE_FAULT, v33, buf, 0x20u);
        goto LABEL_34;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v47 count:16];
        uint64_t v7 = v35;
        if (v17) {
          goto LABEL_6;
        }
LABEL_14:

        if ([v14 count])
        {
          uint64_t v27 = brc_bread_crumbs();
          id v28 = brc_default_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v42 = self;
            __int16 v43 = 2112;
            v44 = (BRCAppLibrary *)v14;
            __int16 v45 = 2112;
            id v46 = v27;
            _os_log_fault_impl(&dword_1D353B000, v28, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ has too many target shared server zones %@%@", buf, 0x20u);
          }
          uint64_t v6 = v36;
LABEL_35:

LABEL_36:
          BOOL v31 = 0;
        }
        else
        {
          BOOL v31 = 1;
          uint64_t v6 = v36;
        }

        goto LABEL_38;
      }
    }
    id v28 = brc_bread_crumbs();
    v32 = brc_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = self;
      __int16 v43 = 2112;
      v44 = v20;
      __int16 v45 = 2112;
      id v46 = v28;
      v33 = "[CRIT] UNREACHABLE: %@ has foreground clients but target shared zone %@ isn't targeted%@";
      goto LABEL_41;
    }
LABEL_34:
    uint64_t v7 = v35;
    uint64_t v6 = v36;

    uint64_t v27 = v15;
    goto LABEL_35;
  }
  if (v10)
  {
    char v15 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary integrityCheckBoosting]();
    }
    goto LABEL_36;
  }
  __int16 v29 = [v6 foregroundClients];
  int v30 = [v29 containsObject:self];

  if (v30)
  {
    char v15 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary integrityCheckBoosting]();
    }
    goto LABEL_36;
  }
  BOOL v31 = 1;
LABEL_38:

  return v31;
}

- (BOOL)shouldEvictUploadedItems
{
  return BYTE2(self->_state) >> 7;
}

- (void)recomputeShouldEvictState
{
  uint64_t v1 = "evicting uploaded items";
  if ((a1 & 1) == 0) {
    uint64_t v1 = "not evicting uploaded items";
  }
  LODWORD(v4) = 136315394;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v2, v3, "[DEBUG] evict status remains: %s%@", (void)v4, DWORD2(v4));
}

- (BRCSyncContext)transferSyncContextIfExists
{
  os_log_t v3 = [(BRCAccountSession *)self->_session syncContextProvider];
  long long v4 = [(BRCAppLibrary *)self mangledID];
  id v5 = [v3 transferSyncContextForMangledID:v4 createIfNeeded:0];

  return (BRCSyncContext *)v5;
}

- (BRCSyncContext)transferSyncContext
{
  os_log_t v3 = [(BRCAccountSession *)self->_session syncContextProvider];
  long long v4 = [(BRCAppLibrary *)self mangledID];
  id v5 = [v3 transferSyncContextForMangledID:v4];

  return (BRCSyncContext *)v5;
}

- (void)didReceiveHandoffRequest
{
  os_log_t v3 = [(BRCAppLibrary *)self defaultClientZone];
  long long v4 = [v3 serverZone];
  id v6 = [v4 metadataSyncContext];

  id v5 = [(BRCAppLibrary *)self transferSyncContext];
  if (v6 != v5) {
    [v6 didReceiveHandoffRequest];
  }
  [v5 didReceiveHandoffRequest];
}

- (NSString)identifier
{
  uint64_t v2 = [(BRCAppLibrary *)self mangledID];
  os_log_t v3 = [v2 mangledIDString];

  return (NSString *)v3;
}

- (id)_targetSharedServerZonesEnumerator
{
  id v3 = [(BRCPQLConnection *)self->_db fetch:@"SELECT DISTINCT ci.zone_rowid FROM client_items AS ci INNER JOIN client_zones AS cz ON ci.zone_rowid = cz.rowid WHERE ci.app_library_rowid = %@   AND ci.item_state IN (0, -1)   AND (ci.item_sharing_options & 4) != 0   AND cz.zone_owner != %@", self->_dbRowID, *MEMORY[0x1E4F19C08]];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__BRCAppLibrary__targetSharedServerZonesEnumerator__block_invoke;
  v6[3] = &unk_1E6994120;
  v6[4] = self;
  long long v4 = [v3 enumerateObjects:v6];

  return v4;
}

id __51__BRCAppLibrary__targetSharedServerZonesEnumerator__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 numberAtIndex:0];
  long long v4 = [*(id *)(*(void *)(a1 + 32) + 104) serverZoneByRowID:v3];
  id v5 = [v4 asSharedZone];

  return v5;
}

- (BOOL)isStillTargetingSharedServerZone:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  db = self->_db;
  dbRowID = self->_dbRowID;
  uint64_t v7 = [v4 dbRowID];
  id v8 = [(PQLConnection *)db numberWithSQL:@"SELECT rowid FROM client_items WHERE app_library_rowid = %@ AND zone_rowid = %@ AND (item_sharing_options & 4) != 0 AND item_state IN (0, -1) LIMIT 1", dbRowID, v7];

  uint64_t v9 = [v8 unsignedLongLongValue];
  if (v9)
  {
    int v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = self;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Item with rowid %llu is still targeting %@ for %@%@", buf, 0x2Au);
    }
  }
  return v9 != 0;
}

- (void)_resolveTargetSharedClientZonesWhenBecameForeground
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] resolving target shared zones for app library %@%@");
}

void __68__BRCAppLibrary__resolveTargetSharedClientZonesWhenBecameForeground__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  id v4 = *(void **)(a1 + 32);
  id v3 = (id *)(a1 + 32);
  [v4 _targetSharedServerZonesEnumerator];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        [v2 addObject:*(void *)(*((void *)&v23 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v2;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * v14);
        uint64_t v16 = (void *)MEMORY[0x1D9438760](v11);
        objc_msgSend(*v3, "_addTargetSharedServerZone:", v15, (void)v19);
        ++v14;
      }
      while (v12 != v14);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
      uint64_t v12 = v11;
    }
    while (v11);
  }

  __int16 v17 = brc_bread_crumbs();
  id v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    __68__BRCAppLibrary__resolveTargetSharedClientZonesWhenBecameForeground__block_invoke_cold_1((uint64_t)v3, (uint64_t)v17, v18);
  }
}

- (void)_removeAllTargetSharedServerZonesWhenNoLongerForeground
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _foregroundClients.count == 0%@", v2, v3, v4, v5, v6);
}

uint64_t __72__BRCAppLibrary__removeAllTargetSharedServerZonesWhenNoLongerForeground__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 136);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "removeForegroundClient:", *(void *)(a1 + 32), (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 32) + 136) removeAllObjects];
}

- (void)_addTargetSharedServerZoneForSharedItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__BRCAppLibrary__addTargetSharedServerZoneForSharedItem___block_invoke;
  v7[3] = &unk_1E6993628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_with_logs_3(v5, v7);
}

void __57__BRCAppLibrary__addTargetSharedServerZoneForSharedItem___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) serverZone];
  id v2 = [v3 asSharedZone];
  [v1 _addTargetSharedServerZone:v2];
}

- (void)_removeTargetSharedServerZoneIfNecessary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 clientZone];
  id v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    id v18 = self;
    __int16 v19 = 2112;
    long long v20 = v6;
    _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] attempting to remove target server zone %@ from %@%@", buf, 0x20u);
  }

  id v8 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__BRCAppLibrary__removeTargetSharedServerZoneIfNecessary___block_invoke;
  v11[3] = &unk_1E6993600;
  id v12 = v4;
  uint64_t v13 = self;
  id v14 = v5;
  id v9 = v5;
  id v10 = v4;
  dispatch_async_with_logs_3(v8, v11);
}

void __58__BRCAppLibrary__removeTargetSharedServerZoneIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) && (objc_msgSend(*(id *)(*(void *)(a1 + 40) + 136), "containsObject:") & 1) != 0)
  {
    if ([*(id *)(a1 + 40) isStillTargetingSharedServerZone:*(void *)(a1 + 32)])
    {
      id v2 = brc_bread_crumbs();
      id v3 = brc_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        uint64_t v4 = *(void *)(a1 + 48);
        int v9 = 138412802;
        uint64_t v10 = v4;
        __int16 v11 = 2112;
        uint64_t v12 = v5;
        __int16 v13 = 2112;
        id v14 = v2;
        id v6 = "[DEBUG] not removing target shared zone %@ from %@, because it's still targeting it%@";
LABEL_13:
        _os_log_debug_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v9, 0x20u);
      }
    }
    else
    {
      if ([*(id *)(*(void *)(a1 + 40) + 144) count]) {
        [*(id *)(a1 + 32) removeForegroundClient:*(void *)(a1 + 40)];
      }
      [*(id *)(*(void *)(a1 + 40) + 136) removeObject:*(void *)(a1 + 32)];
      id v2 = brc_bread_crumbs();
      id v3 = brc_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v7 = *(void *)(a1 + 48);
        int v9 = 138412802;
        uint64_t v10 = v7;
        __int16 v11 = 2112;
        uint64_t v12 = v8;
        __int16 v13 = 2112;
        id v14 = v2;
        id v6 = "[DEBUG] %@ is not a target shared zone of %@ anymore%@";
        goto LABEL_13;
      }
    }
  }
  else
  {
    id v2 = brc_bread_crumbs();
    id v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __58__BRCAppLibrary__removeTargetSharedServerZoneIfNecessary___block_invoke_cold_1(a1, (uint64_t)v2, v3);
    }
  }
}

- (void)_addTargetSharedServerZone:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 clientZone];
  id v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    id v14 = self;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] attempting to add target shared server zone %@ to %@%@", (uint8_t *)&v11, 0x20u);
  }

  uint64_t v8 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
  dispatch_assert_queue_V2(v8);

  if (v4)
  {
    if ([(NSMutableSet *)self->_foregroundClients count])
    {
      int v9 = brc_bread_crumbs();
      uint64_t v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 138412802;
        uint64_t v12 = self;
        __int16 v13 = 2112;
        id v14 = v5;
        __int16 v15 = 2112;
        uint64_t v16 = v9;
        _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Added %@ as foreground client to %@%@", (uint8_t *)&v11, 0x20u);
      }

      [v4 addForegroundClient:self];
    }
    [(NSMutableSet *)self->_targetSharedServerZones addObject:v4];
  }
}

- (id)itemIDByRowID:(unint64_t)a3 db:(id)a4
{
  return [(BRCAccountSession *)self->_session itemIDByRowID:a3 db:a4];
}

- (id)itemIDByRowID:(unint64_t)a3
{
  return [(BRCAccountSession *)self->_session itemIDByRowID:a3 db:self->_db];
}

- (id)itemByRowID:(unint64_t)a3 db:(id)a4
{
  return [(BRCAccountSession *)self->_session itemByRowID:a3 db:a4];
}

- (id)itemByRowID:(unint64_t)a3
{
  return [(BRCAccountSession *)self->_session itemByRowID:a3];
}

- (id)containerMetadataFilledWithTCCInfo
{
  id v2 = [(BRCAppLibrary *)self containerMetadata];
  id v3 = +[BRCDaemonContainerHelper sharedHelper];
  objc_msgSend(v2, "setIsCloudSyncTCCDisabled:", objc_msgSend(v3, "cloudSyncTCCDisabledForContainerMeta:", v2));

  return v2;
}

- (BOOL)wasMovedToCloudDocs
{
  return ([(BRCAppLibrary *)self state] >> 21) & 1;
}

- (BOOL)shouldSaveContainerMetadataServerside
{
  return ![(BRCAppLibrary *)self isCloudDocsAppLibrary];
}

- (id)documentsFolderItemID
{
  BOOL v3 = [(BRCAppLibrary *)self includesDataScope];
  id v4 = [BRCItemID alloc];
  uint64_t v5 = [(BRCAppLibrary *)self dbRowID];
  if (v3) {
    uint64_t v6 = [(BRCItemID *)v4 initAsDocumentsWithAppLibraryRowID:v5];
  }
  else {
    uint64_t v6 = [(BRCItemID *)v4 _initAsLibraryRootWithAppLibraryRowID:v5];
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

- (id)fetchRootItemInDB:(id)a3
{
  id v4 = [(BRCAppLibrary *)self dbRowID];
  if (v4)
  {
    id v5 = [[BRCItemID alloc] _initAsLibraryRootWithAppLibraryRowID:v4];
    uint64_t v6 = [[BRCZoneRootItem alloc] initWithZoneRootItemID:v5 session:self->_session];
  }
  else
  {
    uint64_t v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary fetchRootItemInDB:]();
    }

    uint64_t v6 = 0;
  }

  return v6;
}

- (id)fetchRootItem
{
  BOOL v3 = [(BRCAppLibrary *)self db];
  [v3 assertOnQueue];

  id v4 = [(BRCAppLibrary *)self db];
  id v5 = [(BRCAppLibrary *)self fetchRootItemInDB:v4];

  return v5;
}

- (id)fetchDocumentsDirectoryItem:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCAppLibrary *)self defaultClientZone];
  uint64_t v6 = [(BRCAppLibrary *)self documentsFolderItemID];
  uint64_t v7 = [v5 itemByItemID:v6 db:v4];

  uint64_t v8 = [v7 asDirectory];

  return v8;
}

- (id)fetchDocumentsDirectoryItem
{
  BOOL v3 = [(BRCAppLibrary *)self db];
  id v4 = [(BRCAppLibrary *)self fetchDocumentsDirectoryItem:v3];

  return v4;
}

- (id)rootItemID
{
  id v2 = [(BRCAppLibrary *)self dbRowID];
  if (v2)
  {
    id v3 = [[BRCItemID alloc] _initAsLibraryRootWithAppLibraryRowID:v2];
  }
  else
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary fetchRootItemInDB:]();
    }

    id v3 = 0;
  }

  return v3;
}

- (id)rootItemGlobalID
{
  id v3 = [BRCItemGlobalID alloc];
  id v4 = [(BRCAppLibrary *)self defaultClientZone];
  id v5 = [v4 dbRowID];
  uint64_t v6 = [(BRCAppLibrary *)self rootItemID];
  uint64_t v7 = [(BRCItemGlobalID *)v3 initWithZoneRowID:v5 itemID:v6];

  return v7;
}

- (void)zoneDidChangeMovedToCloudDocsState
{
  [(BRCAppLibrary *)self _updateIsInCloudDocsZone];
  id v2 = (void *)MEMORY[0x1E4F594A8];
  [v2 postContainerListUpdateNotification];
}

- (void)_updateIsInCloudDocsZone
{
  id v3 = [(BRCAppLibrary *)self defaultClientZone];
  -[BRContainer setIsInCloudDocsZone:](self->_containerMetadata, "setIsInCloudDocsZone:", [v3 isCloudDocsZone]);
}

- (void)setContainerMetadataEtag:(id)a3
{
  objc_storeStrong((id *)&self->_containerMetadataEtag, a3);
  [(BRCAppLibrary *)self setNeedsSave:1];
}

- (void)setContainerMetadataNeedsSyncUp:(BOOL)a3
{
  self->_containerMetadataNeedsSyncUp = a3;
  [(BRCAppLibrary *)self setNeedsSave:1];
}

- (void)scheduleContainerMetadataSyncUp
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] container-metadata needs sync up for %@%@");
}

- (NSString)pathRelativeToRoot
{
  return (NSString *)[(BRMangledID *)self->_mangledID mangledIDString];
}

- (void)setChildBasehashSalt:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = (NSData *)a3;
  uint64_t v6 = v5;
  if (self->_childBasehashSalt != v5 && !-[NSData isEqualToData:](v5, "isEqualToData:"))
  {
    uint64_t v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      __int16 v15 = [(NSData *)v6 brc_truncatedSHA256];
      int v9 = objc_msgSend(v15, "brc_hexadecimalString");
      uint64_t v10 = [(NSData *)self->_childBasehashSalt brc_truncatedSHA256];
      int v11 = objc_msgSend(v10, "brc_hexadecimalString");
      uint64_t v12 = [(BRCAppLibrary *)self mangledID];
      *(_DWORD *)buf = 138413058;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      __int16 v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      long long v23 = v7;
      _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Learning new child basehash salt %@ from %@ for %@%@", buf, 0x2Au);
    }
    if (self->_childBasehashSalt)
    {
      __int16 v13 = brc_bread_crumbs();
      id v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCAppLibrary setChildBasehashSalt:]();
      }
    }
    objc_storeStrong((id *)&self->_childBasehashSalt, a3);
    [(BRCAppLibrary *)self setNeedsSave:1];
  }
}

- (void)setSaltingState:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_saltingState != a3)
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      if (a3 > 3) {
        uint64_t v7 = @"no server item";
      }
      else {
        uint64_t v7 = off_1E6996130[a3];
      }
      uint64_t saltingState = (int)self->_saltingState;
      if (saltingState > 3) {
        int v9 = @"no server item";
      }
      else {
        int v9 = off_1E6996130[saltingState];
      }
      uint64_t v10 = [(BRCAppLibrary *)self mangledID];
      int v11 = 138413058;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      id v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      __int16 v18 = v5;
      _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Learning salt state %@ from %@ for %@%@", (uint8_t *)&v11, 0x2Au);
    }
    self->_uint64_t saltingState = a3;
    [(BRCAppLibrary *)self setNeedsSave:1];
  }
}

- (brc_task_tracker)tracker
{
  return self->_tracker;
}

- (BRCAppLibraryDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (BOOL)needsSave
{
  return self->_needsSave;
}

- (unsigned)state
{
  return self->_state;
}

- (BRCALRowID)dbRowID
{
  return self->_dbRowID;
}

- (void)setDbRowID:(id)a3
{
}

- (BRCZoneRowID)zoneRowID
{
  return self->_zoneRowID;
}

- (void)setZoneRowID:(id)a3
{
}

- (NSString)appLibraryID
{
  return self->_appLibraryID;
}

- (BRMangledID)mangledID
{
  return self->_mangledID;
}

- (NSNumber)deepScanStamp
{
  return self->_deepScanStamp;
}

- (void)setDeepScanStamp:(id)a3
{
}

- (NSNumber)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
}

- (NSNumber)generationID
{
  return self->_generationID;
}

- (void)setGenerationID:(id)a3
{
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (BRCPrivateClientZone)defaultClientZone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultClientZone);
  return (BRCPrivateClientZone *)WeakRetained;
}

- (void)setDefaultClientZone:(id)a3
{
}

- (BRContainer)containerMetadata
{
  return self->_containerMetadata;
}

- (NSString)containerMetadataEtag
{
  return self->_containerMetadataEtag;
}

- (BOOL)containerMetadataNeedsSyncUp
{
  return self->_containerMetadataNeedsSyncUp;
}

- (unint64_t)containerMetadataSyncRequestID
{
  return self->_containerMetadataSyncRequestID;
}

- (void)setContainerMetadataSyncRequestID:(unint64_t)a3
{
  self->_containerMetadataSyncRequestID = a3;
}

- (NSNumber)rootQuotaUsage
{
  return self->_rootQuotaUsage;
}

- (void)setRootQuotaUsage:(id)a3
{
}

- (NSData)childBasehashSalt
{
  return self->_childBasehashSalt;
}

- (unsigned)saltingState
{
  return self->_saltingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childBasehashSalt, 0);
  objc_storeStrong((id *)&self->_rootQuotaUsage, 0);
  objc_storeStrong((id *)&self->_containerMetadataEtag, 0);
  objc_storeStrong((id *)&self->_containerMetadata, 0);
  objc_storeStrong((id *)&self->_appLibraryID, 0);
  objc_storeStrong((id *)&self->_zoneRowID, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_destroyWeak((id *)&self->_trashFetchOp);
  objc_destroyWeak((id *)&self->_pristineFetchOp);
  objc_storeStrong((id *)&self->_foregroundClients, 0);
  objc_storeStrong((id *)&self->_targetSharedServerZones, 0);
  objc_destroyWeak((id *)&self->_defaultClientZone);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_mangledID, 0);
  objc_storeStrong((id *)&self->_dbRowID, 0);
  objc_storeStrong((id *)&self->_XPCClientsUsingUbiquity, 0);
  objc_storeStrong((id *)&self->_pendingFileCoordinators, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_deepScanReason, 0);
  objc_storeStrong((id *)&self->_deepScanStamp, 0);
}

- (void)_updateContainerMetadataFromRecord:(id)a3 stripIcons:(BOOL)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(BRCAppLibrary *)self session];
  uint64_t v8 = [v7 clientDB];
  int v9 = [v8 serialQueue];

  if (v9)
  {
    uint64_t v10 = objc_msgSend(v6, "brc_containerMetadataPropertiesData");
    if (v10)
    {
      if (![(BRCAppLibrary *)self shouldSaveContainerMetadataServerside])
      {
LABEL_16:
        objc_initWeak((id *)buf, self);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __102__BRCAppLibrary_BRCContainerMetadataSyncDownAdditions___updateContainerMetadataFromRecord_stripIcons___block_invoke_1;
        v20[3] = &unk_1E6996998;
        objc_copyWeak(&v22, (id *)buf);
        id v21 = v6;
        dispatch_async(v9, v20);

        objc_destroyWeak(&v22);
        objc_destroyWeak((id *)buf);
        goto LABEL_17;
      }
      if (a4)
      {
        int v11 = 0;
      }
      else
      {
        int v11 = objc_msgSend(v6, "brc_containerMetadataIconPaths");
      }
      __int16 v15 = [(BRCAppLibrary *)self containerMetadata];
      int v16 = [v15 isDocumentScopePublic];

      __int16 v17 = [(BRCAppLibrary *)self containerMetadata];
      [v17 updateMetadataWithRecordData:v10 iconPaths:v11];

      __int16 v18 = [(BRCAppLibrary *)self containerMetadata];
      int v19 = [v18 isDocumentScopePublic];

      if (v16 != v19)
      {
        objc_initWeak((id *)buf, self);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __102__BRCAppLibrary_BRCContainerMetadataSyncDownAdditions___updateContainerMetadataFromRecord_stripIcons___block_invoke;
        block[3] = &unk_1E6993C50;
        objc_copyWeak(&v24, (id *)buf);
        dispatch_async(v9, block);
        objc_destroyWeak(&v24);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      int v11 = brc_bread_crumbs();
      id v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v26 = v6;
        __int16 v27 = 2112;
        id v28 = v11;
        _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] no data in record %@%@", buf, 0x16u);
      }
    }
    goto LABEL_16;
  }
  uint64_t v10 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = [(BRCAppLibrary *)self session];
    *(_DWORD *)buf = 138412546;
    id v26 = v13;
    __int16 v27 = 2112;
    id v28 = v10;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Serial queue for session %@ is nil%@", buf, 0x16u);
  }
LABEL_17:
}

void __102__BRCAppLibrary_BRCContainerMetadataSyncDownAdditions___updateContainerMetadataFromRecord_stripIcons___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didUpdateDocumentScopePublic];
}

void __102__BRCAppLibrary_BRCContainerMetadataSyncDownAdditions___updateContainerMetadataFromRecord_stripIcons___block_invoke_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) recordChangeTag];
  [WeakRetained setContainerMetadataEtag:v2];
}

- (int64_t)maxLostStamp
{
  return self->_maxLostStamp;
}

- (void)setMaxLostStamp:(int64_t)a3
{
  self->_maxLostStamp = a3;
}

- (unint64_t)allocateLostStampAddingBackoff:(BOOL)a3
{
  BOOL v3 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  [(BRCAppLibrary *)self setNeedsSave:1];
  if (!v3)
  {
    int64_t maxLostStamp = self->_maxLostStamp;
    goto LABEL_5;
  }
  uint64_t v5 = brc_current_date_nsec();
  int64_t maxLostStamp = self->_maxLostStamp;
  if (v5 <= maxLostStamp)
  {
LABEL_5:
    unint64_t v7 = maxLostStamp + 1;
    goto LABEL_6;
  }
  unint64_t v7 = v5;
LABEL_6:
  self->_int64_t maxLostStamp = v7;
  [(BRCAppLibrary *)self setStateBits:4];
  return v7;
}

- (BOOL)markChildrenLostForItemID:(id)a3 inZone:(id)a4 fileID:(id)a5 startingFromRow:(unint64_t)a6 hasMoreWork:(BOOL *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v45 = a5;
  if (([(BRCPQLConnection *)self->_db isBatchSuspended] & 1) == 0)
  {
    v33 = brc_bread_crumbs();
    uint64_t v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem createSyncUpJob].cold.7();
    }
  }
  __int16 v13 = [v12 dbRowID];

  if (!v13)
  {
    v35 = brc_bread_crumbs();
    int v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary(LegacyAdditions) markChildrenLostForItemID:inZone:fileID:startingFromRow:hasMoreWork:]();
    }
  }
  id v14 = [(BRCAppLibrary *)self mangledID];
  __int16 v15 = +[BRCUserDefaults defaultsForMangledID:v14];

  uint64_t v43 = brc_current_date_nsec();
  [v15 readerLostItemBackoff];
  uint64_t v42 = brc_interval_to_nsec();
  [v15 markChildLostBackoff];
  uint64_t v41 = brc_interval_to_nsec();
  int v16 = [(BRCAccountSession *)self->_session volume];
  int v17 = [v16 deviceID];

  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x2020000000;
  v72[3] = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  int v71 = 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x2020000000;
  uint64_t v67 = 0;
  uint64_t v67 = [v45 unsignedLongValue];
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  int v65 = -1;
  uint64_t v40 = [v15 readerMarkChildrenLostBatchSize];
  BOOL v18 = [(BRCAppLibrary *)self hasActiveRecursiveQueries];
  long long v39 = a7;
  if ([v11 isNonDesktopRoot])
  {
    char v19 = [(BRCAppLibrary *)self isCloudDocsAppLibrary];
    uint64_t v20 = 0;
    if ([(BRCAppLibrary *)self isCloudDocsAppLibrary]) {
      char v21 = 2;
    }
    else {
      char v21 = 1;
    }
  }
  else
  {
    db = self->_db;
    long long v23 = [v12 dbRowID];
    id v24 = [(BRCPQLConnection *)db fetch:@"SELECT item_sharing_options, item_user_visible, item_scope FROM client_items WHERE item_id = %@ AND zone_rowid = %@", v11, v23];

    if ([v24 next])
    {
      int v25 = [v24 intAtIndex:0];
      char v19 = [v24 BOOLAtIndex:1];
      uint64_t v20 = (int)(v25 & 0xFFFFFFFB);
      if ([v11 isDocumentsFolder]) {
        char v21 = 2;
      }
      else {
        char v21 = [v24 intAtIndex:2];
      }
    }
    else
    {
      uint64_t v20 = 0;
      char v21 = 0;
      char v19 = 0;
    }
  }
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke;
  v59[3] = &unk_1E6998930;
  char v61 = v19;
  char v62 = v21;
  v59[6] = &v68;
  v59[7] = v66;
  BOOL v63 = v18;
  v59[4] = self;
  v59[5] = v72;
  v59[8] = v64;
  v59[9] = v20;
  int v60 = v17;
  id v26 = (void *)MEMORY[0x1D94389C0](v59);
  if ([v11 isNonDesktopRoot] && objc_msgSend(v12, "isSharedZone"))
  {
    long long v37 = brc_bread_crumbs();
    long long v38 = brc_default_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary(LegacyAdditions) markChildrenLostForItemID:inZone:fileID:startingFromRow:hasMoreWork:]();
    }
  }
  __int16 v27 = self->_db;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3;
  v46[3] = &unk_1E6998958;
  id v28 = v26;
  uint64_t v54 = v41 + v43 - v42;
  id v50 = v28;
  v46[4] = self;
  id v29 = v12;
  id v47 = v29;
  id v30 = v11;
  id v48 = v30;
  uint64_t v51 = v64;
  uint64_t v56 = v40;
  uint64_t v57 = v54;
  unint64_t v55 = a6;
  uint64_t v52 = &v68;
  id v31 = v45;
  id v49 = v31;
  long long v53 = v72;
  unint64_t v58 = v39;
  [(BRCPQLConnection *)v27 groupInBatch:v46];
  LOBYTE(v27) = *((_DWORD *)v69 + 6) != 0;

  _Block_object_dispose(v64, 8);
  _Block_object_dispose(v66, 8);
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(v72, 8);

  return (char)v27;
}

void __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  unsigned __int8 v7 = sqlite3_value_int(*a4);
  sqlite3_int64 v8 = sqlite3_value_int64(a4[2]);
  sqlite3_int64 v9 = sqlite3_value_int64(a4[3]);
  sqlite3_int64 v21 = sqlite3_value_int64(a4[4]);
  uint64_t v10 = sqlite3_value_blob(a4[5]);
  unsigned int v11 = sqlite3_value_int(a4[6]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_value_int64(a4[7]);
  int v12 = sqlite3_value_type(a4[8]);
  id v22 = [NSNumber numberWithLongLong:sqlite3_value_int64(a4[9])];
  __int16 v13 = sqlite3_value_text(a4[1]);
  int v14 = sqlite3_value_int(a4[10]);
  if ((v14 & 4) == 0 && *(void *)(a1 + 72) != v14) {
    goto LABEL_7;
  }
  uint64_t v20 = v9;
  int v15 = sqlite3_value_int(a4[11]) != 0;
  unsigned __int8 v16 = sqlite3_value_int(a4[12]);
  if (*(unsigned __int8 *)(a1 + 84) != v15
    || *(unsigned __int8 *)(a1 + 85) != v16
    || v7 <= 0xAu && ((1 << v7) & 0x611) != 0)
  {
    goto LABEL_7;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    || v10
    || v12 != 5
    || *(unsigned char *)(a1 + 86)
    || (objc_msgSend(v22, "br_isEqualToNumber:", *(void *)(*(void *)(a1 + 32) + 88)) & 1) == 0)
  {
    goto LABEL_7;
  }
  uint64_t v18 = *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v18 == -1)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = BRCOpenByID(*(_DWORD *)(a1 + 80), *(void *)(*(void *)(*(void *)(a1 + 56) + 8)+ 24), 0);
    uint64_t v18 = *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if ((v18 & 0x80000000) != 0)
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
LABEL_7:
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      int v17 = -1;
      goto LABEL_8;
    }
  }
  int HaveChangedByFileName = BRCFileMightHaveChangedByFileName(v18, (const char *)v13, v8, v20, v21, (__rbit32(v11) >> 24) & 0xC0 | 0x8000, (char)v7);
  if (HaveChangedByFileName) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  int v17 = HaveChangedByFileName << 31 >> 31;
LABEL_8:
  sqlite3_result_int(a2, v17);
}

void __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D94389C0](*(void *)(a1 + 64));
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 88);
  id v6 = [*(id *)(a1 + 40) dbRowID];
  char v7 = [v3 execute:@"UPDATE client_items  SET item_state = call_block(%p, item_type, IFNULL(item_localname, item_filename), item_file_id, item_generation, version_mtime, item_xattr_signature, item_mode, rowid, item_min_supported_os_rowid, app_library_rowid, item_sharing_options, item_user_visible, item_scope), item_processing_stamp = inc_and_fetch64(%p), app_library_rowid = %@ WHERE item_parent_zone_rowid = %@ AND item_parent_id = %@ AND rowid > %lu AND item_state = 0 AND item_type != 4 ORDER BY rowid LIMIT %lu", v4, a1 + 96, v5, v6, *(void *)(a1 + 48), *(void *)(a1 + 104), *(void *)(a1 + 112)];

  if ((v7 & 1) == 0)
  {
    sqlite3_int64 v8 = brc_bread_crumbs();
    sqlite3_int64 v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
      __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3_cold_2();
    }

    uint64_t v10 = brc_bread_crumbs();
    unsigned int v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3_cold_1();
    }
  }
  int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if ((v12 & 0x80000000) == 0)
  {
    close(v12);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = -1;
  }
  uint64_t v13 = *(void *)(a1 + 112);
  uint64_t v14 = *(void *)(a1 + 96) - *(void *)(a1 + 120);
  int v15 = brc_bread_crumbs();
  unsigned __int8 v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v30 = *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v31 = *(void *)(a1 + 48);
    v32 = @"not ";
    uint64_t v33 = *(void *)(a1 + 32);
    if (v14 == v13) {
      v32 = &stru_1F2AC7720;
    }
    *(_DWORD *)buf = 67110146;
    int v35 = v30;
    __int16 v36 = 2112;
    uint64_t v37 = v31;
    __int16 v38 = 2112;
    uint64_t v39 = v33;
    __int16 v40 = 2112;
    uint64_t v41 = v32;
    __int16 v42 = 2112;
    uint64_t v43 = v15;
    _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] marked lost %u children of %@ in %@,  continuation is %@needed%@", buf, 0x30u);
  }

  if (v14 == v13)
  {
    int v17 = [*(id *)(a1 + 40) dbRowID];
    char v18 = [v3 execute:@"INSERT OR REPLACE INTO mark_children_lost_progress(zone_rowid, item_parent_id, item_parent_file_id, last_updated_row_id, app_library_rowid) VALUES(%@, %@, %@, %lu, %@)", v17, *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24), *(void *)(*(void *)(a1 + 32) + 88)];

    if ((v18 & 1) == 0)
    {
      char v19 = brc_bread_crumbs();
      uint64_t v20 = brc_default_log();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
        __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3_cold_2();
      }

      sqlite3_int64 v21 = brc_bread_crumbs();
      id v22 = brc_default_log();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if (*(void *)(a1 + 104))
  {
    long long v23 = [*(id *)(a1 + 40) dbRowID];
    char v24 = [v3 execute:@"DELETE FROM mark_children_lost_progress WHERE zone_rowid = %@ AND item_parent_id = %@ AND last_updated_row_id = %lu", v23, *(void *)(a1 + 48), *(void *)(a1 + 104)];

    if ((v24 & 1) == 0)
    {
      int v25 = brc_bread_crumbs();
      id v26 = brc_default_log();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u)) {
        __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3_cold_2();
      }

      sqlite3_int64 v21 = brc_bread_crumbs();
      id v22 = brc_default_log();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        goto LABEL_22;
      }
LABEL_21:
      __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3_cold_1();
LABEL_22:
    }
  }
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    [*(id *)(a1 + 32) setStateBits:4];
    uint64_t v27 = *(void *)(a1 + 96);
    uint64_t v28 = *(void *)(a1 + 32);
    if (v27 > *(void *)(v28 + 32))
    {
      *(void *)(v28 + 32) = v27;
      [*(id *)(a1 + 32) setNeedsSave:1];
    }
  }
  id v29 = *(unsigned char **)(a1 + 128);
  if (v29) {
    *v29 |= v14 == v13;
  }
}

- (void)continueMarkingChildrenLostInZone:(id)a3
{
  id v4 = a3;
  char v16 = 0;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if (([(BRCPQLConnection *)self->_db isBatchSuspended] & 1) == 0)
  {
    int v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem createSyncUpJob].cold.7();
    }
  }
  if (![(BRCAccountSession *)self->_session isCancelled])
  {
    db = self->_db;
    id v6 = [v4 dbRowID];
    id v7 = [(BRCPQLConnection *)db fetch:@"SELECT item_parent_id, item_parent_file_id, last_updated_row_id FROM mark_children_lost_progress WHERE zone_rowid = %@ LIMIT 2", v6];

    if ([v7 next])
    {
      sqlite3_int64 v8 = [v7 objectOfClass:objc_opt_class() atIndex:0];
      sqlite3_int64 v9 = [v7 numberAtIndex:1];
      uint64_t v10 = [v7 integerAtIndex:2];
      if ([v7 next])
      {
        char v16 = 1;
        [v7 close];
      }
      [(BRCAppLibrary *)self markChildrenLostForItemID:v8 inZone:v4 fileID:v9 startingFromRow:v10 hasMoreWork:&v16];
      if (v16)
      {
        unsigned int v11 = [(BRCPQLConnection *)self->_db serialQueue];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __68__BRCAppLibrary_LegacyAdditions__continueMarkingChildrenLostInZone___block_invoke;
        v14[3] = &unk_1E6993628;
        v14[4] = self;
        id v15 = v4;
        brc_dispatch_async_autorelease_with_logs(v11, v14);
      }
    }
  }
}

void __68__BRCAppLibrary_LegacyAdditions__continueMarkingChildrenLostInZone___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 112);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__BRCAppLibrary_LegacyAdditions__continueMarkingChildrenLostInZone___block_invoke_2;
  v3[3] = &unk_1E6995AD0;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 groupInBatch:v3];
}

uint64_t __68__BRCAppLibrary_LegacyAdditions__continueMarkingChildrenLostInZone___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) continueMarkingChildrenLostInZone:*(void *)(a1 + 40)];
}

- (BOOL)markChildrenLostForItemID:(id)a3 inZone:(id)a4 fileID:(id)a5
{
  id v8 = a4;
  unsigned __int8 v16 = 0;
  BOOL v9 = [(BRCAppLibrary *)self markChildrenLostForItemID:a3 inZone:v8 fileID:a5 startingFromRow:0 hasMoreWork:&v16];
  int v10 = v16;
  if (v16)
  {
    unsigned int v11 = [(BRCPQLConnection *)self->_db serialQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID___block_invoke;
    v14[3] = &unk_1E6993628;
    v14[4] = self;
    id v15 = v8;
    brc_dispatch_async_autorelease_with_logs(v11, v14);

    int v10 = v16;
  }
  BOOL v12 = (v10 | v9) != 0;

  return v12;
}

void __74__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 112);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID___block_invoke_2;
  v3[3] = &unk_1E6995AD0;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 groupInBatch:v3];
}

uint64_t __74__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) continueMarkingChildrenLostInZone:*(void *)(a1 + 40)];
}

- (void)scheduleDeepScanWithReason:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = (BRCAppLibrary *)a3;
  uint64_t v5 = [(BRCAppLibrary *)self defaultClientZone];
  __int16 v6 = [v5 state];

  if ((v6 & 0x100) != 0)
  {
    brc_bread_crumbs();
    unsigned __int8 v16 = (BRCAppLibrary *)objc_claimAutoreleasedReturnValue();
    int v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      char v19 = v16;
      _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Not scheduling deep scan on an app library in a resetting zone%@", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    id v7 = [NSNumber numberWithLongLong:brc_current_date_nsec()];
    deepScanStamp = self->_deepScanStamp;
    self->_deepScanStamp = v7;

    if (self->_deepScanReason)
    {
      BOOL v9 = brc_bread_crumbs();
      int v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        deepScanReason = self->_deepScanReason;
        int v18 = 138543874;
        char v19 = (BRCAppLibrary *)deepScanReason;
        __int16 v20 = 2114;
        sqlite3_int64 v21 = v4;
        __int16 v22 = 2112;
        long long v23 = v9;
        _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Replacing deep scan reason %{public}@ with %{public}@%@", (uint8_t *)&v18, 0x20u);
      }
    }
    BOOL v12 = (NSString *)[(BRCAppLibrary *)v4 copy];
    uint64_t v13 = self->_deepScanReason;
    self->_deepScanReason = v12;

    [(BRCAppLibrary *)self setNeedsSave:1];
    uint64_t v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      int v18 = 138543874;
      char v19 = v4;
      __int16 v20 = 2112;
      sqlite3_int64 v21 = self;
      __int16 v22 = 2112;
      long long v23 = v14;
      _os_log_error_impl(&dword_1D353B000, v15, (os_log_type_t)0x90u, "[ERROR] Container needs deep-scan because %{public}@ - %@%@", (uint8_t *)&v18, 0x20u);
    }

    [(BRCAppLibrary *)self setStateBits:4];
    [(BRCAppLibrary *)self clearStateBits:0x80000];
  }
}

- (void)computeDocumentEvictableSizeUsageWithDB:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[BRCDiskSpaceReclaimer accessTimeDeltaForUrgency:3];
  double v9 = v8;
  double v10 = v8 + 1.0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__BRCAppLibrary_LegacyAdditions__computeDocumentEvictableSizeUsageWithDB_reply___block_invoke;
  v12[3] = &unk_1E6998980;
  id v13 = v6;
  id v11 = v6;
  [(BRCAppLibrary *)self computeDocumentEvictableSizeUsageWithLowTimeDelta:v7 medTimeDelta:v12 highTimeDelta:v10 db:v10 reply:v9];
}

uint64_t __80__BRCAppLibrary_LegacyAdditions__computeDocumentEvictableSizeUsageWithDB_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)computeDocumentEvictableSizeUsageWithLowTimeDelta:(double)a3 medTimeDelta:(double)a4 highTimeDelta:(double)a5 db:(id)a6 reply:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  uint64_t v14 = [(BRCAppLibrary *)self mangledID];
  id v28 = +[BRCUserDefaults defaultsForMangledID:v14];

  id v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-a3];
  [v15 timeIntervalSince1970];
  unint64_t v17 = (unint64_t)v16;

  int v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-a4];
  [v18 timeIntervalSince1970];
  unint64_t v20 = (unint64_t)v19;

  sqlite3_int64 v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-a5];
  [v21 timeIntervalSince1970];
  unint64_t v23 = (unint64_t)v22;

  uint64_t v24 = [v28 minAutomaticallyEvictableFilesize];
  uint64_t v25 = [v28 computeEvictableBatchSize];
  session = self->_session;
  uint64_t v27 = [MEMORY[0x1E4FBA8F8] formatInjection:@"AND app_library_rowid = %@", self->_dbRowID];
  [(BRCAccountSession *)session computeDocumentEvictableSizesForLowTime:v17 medTime:v20 highTime:v23 lowSize:0 medSize:0 highSize:0 minRowID:0 minSize:v24 batchSize:v25 injection:v27 db:v13 reply:v12];
}

- (void)recreateDocumentsFolderIfNeededOnDisk
{
  char v9 = 0;
  session = self->_session;
  id v4 = [(BRCAppLibrary *)self mangledID];
  LODWORD(session) = [(BRCAccountSession *)session createAppLibraryOnDisk:v4 createdRoot:0 createdDocuments:&v9 rootFileID:0];

  if (session)
  {
    uint64_t v5 = [(BRCAppLibrary *)self defaultClientZone];
    id v6 = [(BRCAppLibrary *)self documentsFolderItemID];
    id v7 = [v5 itemByItemID:v6];

    if (v9 || !v7)
    {
      double v8 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsReader];
      [v8 scanContainerDocumentsIfNeeded:self];
    }
  }
}

- (void)cancelFileCoordinators
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BRCAppLibrary(LegacyAdditions) cancelFileCoordinators]();
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_pendingFileCoordinators objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v9++) cancel];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(NSMutableDictionary *)self->_pendingFileCoordinators removeAllObjects];
  double v10 = [(BRCAccountSession *)self->_session applyScheduler];
  id v11 = [(BRCAppLibrary *)self defaultClientZone];
  id v12 = [v11 serverZone];
  [v10 rescheduleSuspendedJobsMatching:v12 inState:26];
}

- (void)cancelWriteCoordinatorForItem:(id)a3
{
  pendingFileCoordinators = self->_pendingFileCoordinators;
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "dbRowID"));
  id v5 = [(NSMutableDictionary *)pendingFileCoordinators objectForKeyedSubscript:v4];

  if (([v5 forRead] & 1) == 0) {
    [v5 cancel];
  }
}

- (id)coordinatorForItem:(id)a3 forRead:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "dbRowID"));
  uint64_t v8 = self->_session;
  uint64_t v9 = [(NSMutableDictionary *)self->_pendingFileCoordinators objectForKey:v7];

  if (v9)
  {
    double v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRCAppLibrary(LegacyAdditions) coordinatorForItem:forRead:]();
    }

    goto LABEL_12;
  }
  if (v4)
  {
    id v12 = [(BRCAccountSession(LegacyAdditions) *)v8 fsReader];
    char v13 = [v12 startReadCoordinationInAppLibrary:self];
  }
  else
  {
    id v12 = [(BRCAccountSession *)v8 applyScheduler];
    char v13 = [v12 startWriteCoordinationInAppLibrary:self];
  }
  char v14 = v13;

  if ((v14 & 1) == 0)
  {
    [(BRCAppLibrary *)self freeFileCoordinationSlotsAfterDelayForRead:v4];
LABEL_12:
    uint64_t v18 = 0;
    goto LABEL_13;
  }
  long long v15 = [BRCFileCoordinator alloc];
  session = self->_session;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __61__BRCAppLibrary_LegacyAdditions__coordinatorForItem_forRead___block_invoke;
  id v26 = &unk_1E69989A8;
  BOOL v30 = v4;
  id v17 = v7;
  id v27 = v17;
  id v28 = self;
  id v29 = v8;
  uint64_t v18 = [(BRCFileCoordinator *)v15 initWithSession:session forRead:v4 doneHandler:&v23];
  -[NSMutableDictionary setObject:forKey:](self->_pendingFileCoordinators, "setObject:forKey:", v18, v17, v23, v24, v25, v26);
  double v19 = brc_bread_crumbs();
  unint64_t v20 = brc_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    double v22 = "write";
    *(_DWORD *)buf = 136315650;
    if (v4) {
      double v22 = "read";
    }
    v32 = v22;
    __int16 v33 = 2112;
    id v34 = v6;
    __int16 v35 = 2112;
    __int16 v36 = v19;
    _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Allocated pending coordinated %s I/O for %@%@", buf, 0x20u);
  }

LABEL_13:
  return v18;
}

uint64_t __61__BRCAppLibrary_LegacyAdditions__coordinatorForItem_forRead___block_invoke(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __61__BRCAppLibrary_LegacyAdditions__coordinatorForItem_forRead___block_invoke_cold_1();
  }

  BOOL v4 = *(void **)(a1 + 48);
  if (*(unsigned char *)(a1 + 56))
  {
    id v5 = [v4 fsReader];
    [v5 endReadCoordinationInAppLibrary:*(void *)(a1 + 40)];
  }
  else
  {
    id v5 = [v4 applyScheduler];
    objc_msgSend(v5, "endWriteCoordinationInAppLibrary:rowID:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "integerValue"));
  }

  return [*(id *)(*(void *)(a1 + 40) + 72) removeObjectForKey:*(void *)(a1 + 32)];
}

- (void)freeFileCoordinationSlotsAfterDelayForRead:(BOOL)a3
{
  int v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = [(BRCAppLibrary *)self mangledID];
  id v6 = +[BRCUserDefaults defaultsForMangledID:v5];

  if (v3) {
    [v6 readerIOsCancelDelay];
  }
  else {
    [v6 writerIOsCancelDelay];
  }
  double v8 = v7;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [(NSMutableDictionary *)self->_pendingFileCoordinators objectEnumerator];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v14 forRead] == v3) {
          [v14 cancelAfterDelay:v8];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (BOOL)isCoordinationPendingForItem:(id)a3
{
  pendingFileCoordinators = self->_pendingFileCoordinators;
  BOOL v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "dbRowID"));
  id v5 = [(NSMutableDictionary *)pendingFileCoordinators objectForKey:v4];
  LOBYTE(pendingFileCoordinators) = v5 != 0;

  return (char)pendingFileCoordinators;
}

- (void)setRootFileID:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [NSNumber numberWithUnsignedLongLong:a3];
  if (([(NSNumber *)self->_fileID br_isEqualToNumber:v4] & 1) == 0)
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      fileID = self->_fileID;
      double v8 = [(BRCAppLibrary *)self appLibraryID];
      int v9 = 138413058;
      uint64_t v10 = fileID;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      __int16 v13 = 2112;
      char v14 = v8;
      __int16 v15 = 2112;
      long long v16 = v5;
      _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] app library root file id changed from %@ to %@ for %@%@", (uint8_t *)&v9, 0x2Au);
    }
    objc_storeStrong((id *)&self->_fileID, v4);
    [(BRCAppLibrary *)self setNeedsSave:1];
  }
}

- (void)fsrootDidMoveToPath:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(BRCAppLibrary *)self isiCloudDesktopAppLibrary])
  {
    __int16 v15 = brc_bread_crumbs();
    long long v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary(LegacyAdditions) fsrootDidMoveToPath:]();
    }
  }
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "fileID"));
  if ([(NSNumber *)self->_fileID br_isEqualToNumber:v5])
  {
    id v6 = brc_bread_crumbs();
    double v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BRCAppLibrary(LegacyAdditions) fsrootDidMoveToPath:]();
    }

    fileID = self->_fileID;
    self->_fileID = 0;

    generationID = self->_generationID;
    self->_generationID = 0;

    [(BRCAppLibrary *)self setNeedsSave:1];
    uint64_t v10 = @"fs-root was removed";
  }
  else
  {
    uint64_t v10 = [NSString stringWithFormat:@"fs-root was moved from %@ to %@", self->_fileID, v5];
    __int16 v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
      __int16 v13 = [(BRCAppLibrary *)self appLibraryID];
      char v14 = self->_fileID;
      *(_DWORD *)buf = 138413058;
      long long v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      double v22 = v5;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      _os_log_error_impl(&dword_1D353B000, v12, (os_log_type_t)0x90u, "[ERROR] fs-root moved on disk, but this is not the root item %@ is tracking\n tracking: %@, received: %@%@", buf, 0x2Au);
    }
  }
  [(BRCAppLibrary *)self scheduleDeepScanWithReason:v10];
}

- (void)updateFromFSAtPath:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = (NSNumber *)a3;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(0, (uint64_t)"-[BRCAppLibrary(LegacyAdditions) updateFromFSAtPath:]", 534, v17);
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = v17[0];
    char v14 = [(BRCAppLibrary *)self appLibraryID];
    *(_DWORD *)buf = 134218754;
    __int16 v19 = (BRCAppLibrary *)v13;
    __int16 v20 = 2112;
    __int16 v21 = v14;
    __int16 v22 = 2112;
    __int16 v23 = v4;
    __int16 v24 = 2112;
    uint64_t v25 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx updating %@ from %@%@", buf, 0x2Au);
  }
  [(BRCAppLibrary *)self setRootFileID:[(NSNumber *)v4 fileID]];
  objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NSNumber fsGenerationID](v4, "fsGenerationID"));
  double v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  generationID = self->_generationID;
  self->_generationID = v7;

  deepScanStamp = self->_deepScanStamp;
  self->_deepScanStamp = 0;

  deepScanReason = self->_deepScanReason;
  self->_deepScanReason = 0;

  [(BRCAppLibrary *)self setNeedsSave:1];
  __int16 v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    fileID = self->_fileID;
    long long v16 = self->_generationID;
    *(_DWORD *)buf = 138413058;
    __int16 v19 = self;
    __int16 v20 = 2112;
    __int16 v21 = fileID;
    __int16 v22 = 2112;
    __int16 v23 = v16;
    __int16 v24 = 2112;
    uint64_t v25 = v11;
    _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Done scanning container: %@, fileID:%@ generationID:%@%@", buf, 0x2Au);
  }

  __brc_leave_section(v17);
}

- (void)didFindLostItem:(id)a3 oldAppLibrary:(id)a4
{
  id v5 = a3;
  if (([a4 state] & 4) == 0)
  {
    __int16 v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary(LegacyAdditions) didFindLostItem:oldAppLibrary:]();
    }
  }
  if ([v5 needsSyncUp]) {
    goto LABEL_8;
  }
  if ([v5 isDirectory])
  {
    id v6 = [v5 asDirectory];
    int v7 = [v6 hasDeadChildren];

    if (v7)
    {
      double v8 = brc_bread_crumbs();
      int v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[BRCAppLibrary(LegacyAdditions) didFindLostItem:oldAppLibrary:]();
      }

LABEL_8:
      uint64_t v10 = [v5 clientZone];
      [v10 scheduleSyncUp];
    }
  }
}

- (BRCRelativePath)documentsPath
{
  BOOL v3 = [(BRCAppLibrary *)self includesDataScope];
  id v4 = [(BRCAppLibrary *)self root];
  id v5 = [(BRCAppLibrary *)self pathRelativeToRoot];
  id v6 = v5;
  if (v3)
  {
    int v7 = [v5 stringByAppendingPathComponent:*MEMORY[0x1E4F59400]];
    double v8 = [v4 pathWithChildAtPath:v7];
  }
  else
  {
    double v8 = [v4 pathWithChildAtPath:v5];
  }

  return (BRCRelativePath *)v8;
}

- (BRCRelativePath)root
{
  id v2 = [(BRCAppLibrary *)self fsEventsMonitor];
  BOOL v3 = [v2 root];

  return (BRCRelativePath *)v3;
}

- (BRCFSEventsMonitor)fsEventsMonitor
{
  session = self->_session;
  BOOL v3 = [(BRCAppLibrary *)self appLibraryID];
  id v4 = [(BRCAccountSession *)session fsEventsMonitorForAppLibraryID:v3];

  return (BRCFSEventsMonitor *)v4;
}

- (id)_aliasAppLibraryTargetSQLPrefix
{
  id v2 = [(BRCAppLibrary *)self mangledID];
  BOOL v3 = [v2 aliasTargetContainerString];
  id v4 = objc_msgSend(v3, "br_stringByBackslashEscapingCharactersInString:", @"\\_%");

  id v5 = [NSString stringWithFormat:@"%@/%%", v4];

  return v5;
}

- (id)liveAliasesEnumeratorTargetingThisAppLibrary
{
  db = self->_db;
  id v4 = [(BRCAppLibrary *)self _aliasAppLibraryTargetSQLPrefix];
  v5 = [(BRCPQLConnection *)db fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp          FROM client_items         WHERE item_type = 3           AND item_unsigned int state = 0           AND item_alias_target LIKE %@ ESCAPE '\\'", v4];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__BRCAppLibrary_LegacyAdditions__liveAliasesEnumeratorTargetingThisAppLibrary__block_invoke;
  v8[3] = &unk_1E6994120;
  v8[4] = self;
  id v6 = [v5 enumerateObjects:v8];

  return v6;
}

id __78__BRCAppLibrary_LegacyAdditions__liveAliasesEnumeratorTargetingThisAppLibrary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  int v7 = [v5 session];
  double v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(*(void *)(a1 + 32) + 112) error:a3];

  return v8;
}

- (id)aliasByUnsaltedBookmarkData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v10 = brc_bread_crumbs();
    __int16 v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary(LegacyAdditions) aliasByUnsaltedBookmarkData:]();
    }
  }
  id v5 = [(BRCPQLConnection *)self->_db fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_alias_target = %@ AND item_type = 3 AND app_library_rowid = %@", v4, self->_dbRowID];
  if ([v5 next])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__BRCAppLibrary_LegacyAdditions__aliasByUnsaltedBookmarkData___block_invoke;
    v12[3] = &unk_1E6994120;
    void v12[4] = self;
    id v6 = [v5 object:v12];
    [v5 close];
    id v7 = v6;
    double v8 = v7;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:12 andMessage:@"item not found"];
    [(BRCPQLConnection *)self->_db setLastError:v7];
    double v8 = 0;
  }

  return v8;
}

id __62__BRCAppLibrary_LegacyAdditions__aliasByUnsaltedBookmarkData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  double v8 = [*(id *)(a1 + 32) session];
  int v9 = [v8 clientDB];
  uint64_t v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (void)registerQueryWithAliases:(BOOL)a3 isRecursive:(BOOL)a4
{
  if (!a4)
  {
    if (!a3) {
      return;
    }
LABEL_5:
    atomic_fetch_add((atomic_ullong *volatile)&self->_activeAliasQueries, 1uLL);
    return;
  }
  atomic_fetch_add((atomic_ullong *volatile)&self->_activeRecursiveQueries, 1uLL);
  if (a3) {
    goto LABEL_5;
  }
}

- (void)unregisterQueryWithAliases:(BOOL)a3 isRecursive:(BOOL)a4
{
  if (a3) {
    atomic_fetch_add((atomic_ullong *volatile)&self->_activeAliasQueries, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a4) {
    atomic_fetch_add((atomic_ullong *volatile)&self->_activeRecursiveQueries, 0xFFFFFFFFFFFFFFFFLL);
  }
  atomic_fetch_add((atomic_ullong *volatile)&self->_activeQueries, 0xFFFFFFFFFFFFFFFFLL);
}

- (BOOL)hasActiveAliasQueries
{
  return atomic_load_explicit((atomic_ullong *volatile)&self->_activeAliasQueries, memory_order_acquire) != 0;
}

- (void)notifyClient:(id)a3 whenFaultingIsDone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BRCAppLibrary *)self defaultClientZone];
  [v8 notifyClient:v7 whenFaultingIsDone:v6];
}

- (void)addClientUsingUbiquity:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (![(NSMutableSet *)v5->_XPCClientsUsingUbiquity count])
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      __int16 v18 = 2112;
      __int16 v19 = v6;
      _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] First ubiquity client using container, schedule each item for download (client: %@, container: %@).%@", buf, 0x20u);
    }

    id v8 = [(BRCAppLibrary *)v5 tracker];
    int v9 = [(BRCAccountSession *)v5->_session clientDB];
    uint64_t v10 = [v9 serialQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__BRCAppLibrary_LegacyAdditions__addClientUsingUbiquity___block_invoke;
    v13[3] = &unk_1E6993698;
    v13[4] = v5;
    brc_task_tracker_async_with_logs(v8, v10, v13, 0);
  }
  if (([(NSMutableSet *)v5->_XPCClientsUsingUbiquity containsObject:v4] & 1) == 0)
  {
    __int16 v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      __int16 v18 = 2112;
      __int16 v19 = v11;
      _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ forces %@ to be greedy%@", buf, 0x20u);
    }

    [(NSMutableSet *)v5->_XPCClientsUsingUbiquity addObject:v4];
  }
  objc_sync_exit(v5);
}

void __57__BRCAppLibrary_LegacyAdditions__addClientUsingUbiquity___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fetchRootItem];
  if (([v2 isDirectory] & 1) == 0)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __57__BRCAppLibrary_LegacyAdditions__addClientUsingUbiquity___block_invoke_cold_1();
    }
  }
  BOOL v3 = [*(id *)(a1 + 32) tracker];
  [v2 startDownloadInTask:v3 options:0 etagIfLoser:0 stageFileName:0 error:0];
}

- (void)removeClientUsingUbiquity:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([(NSMutableSet *)v5->_XPCClientsUsingUbiquity containsObject:v4])
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412802;
      id v11 = v4;
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ no longer forces %@ to be greedy%@", (uint8_t *)&v10, 0x20u);
    }

    [(NSMutableSet *)v5->_XPCClientsUsingUbiquity removeObject:v4];
    if (![(NSMutableSet *)v5->_XPCClientsUsingUbiquity count])
    {
      id v8 = brc_bread_crumbs();
      int v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[BRCAppLibrary(LegacyAdditions) removeClientUsingUbiquity:]();
      }
    }
  }
  objc_sync_exit(v5);
}

- (BOOL)hasUbiquityClientsConnected
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NSMutableSet *)v2->_XPCClientsUsingUbiquity count] != 0;
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)documentSizeUsageWithDB:(id)a3
{
  BOOL v3 = (void *)[a3 numberWithSQL:@"SELECT auto_aggregate_size FROM app_libraries WHERE rowid = %@", self->_dbRowID];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (unint64_t)documentCountWithDB:(id)a3
{
  BOOL v3 = (void *)[a3 numberWithSQL:@"SELECT auto_document_count FROM app_libraries WHERE rowid = %@", self->_dbRowID];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (void)setNeedsSave:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] container state now needs flush: %@%@");
}

- (void)initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: dbRowID%@", v2, v3, v4, v5, v6);
}

- (void)initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] API MISUSE: unexpected parameter%@", v2, v3, v4, v5, v6);
}

- (void)initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: mangledID.isPrivate%@", v2, v3, v4, v5, v6);
}

- (void)initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: zoneRowID%@", v2, v3, v4, v5, v6);
}

- (void)associateWithClientZone:offline:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: associating nil client zone for %@%@");
}

- (void)_activateState:origState:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Updating documents folder to be of server type %@%@");
}

- (void)_activateState:origState:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _session.fsReader%@", v2, v3, v4, v5, v6);
}

- (void)_activateState:origState:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: state == BRCAppLibraryStateNotActivated || !(state & BRCAppLibraryStateNotActivated)%@", v2, v3, v4, v5, v6);
}

- (void)isGreedy
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] greediness enforced because optimize storage is disabled%@", v2, v3, v4, v5, v6);
}

- (void)itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: docsOrDataScopeInjection || externalScopeInjection%@", v2, v3, v4, v5, v6);
}

- (void)itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: asking for no scopes?%@", v2, v3, v4, v5, v6);
}

- (void)addForegroundClient:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] %@ - app library became foreground%@");
}

- (void)addForegroundClient:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: ![_foregroundClients containsObject:client]%@", v2, v3, v4, v5, v6);
}

- (void)addForegroundClient:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: client%@", v2, v3, v4, v5, v6);
}

void __37__BRCAppLibrary_addForegroundClient___block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] %@ - SharedDocs became foreground%@", (void)v3, DWORD2(v3));
}

- (void)removeForegroundClient:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] %@ - app library moved to background%@");
}

- (void)removeForegroundClient:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [_foregroundClients containsObject:client]%@", v2, v3, v4, v5, v6);
}

- (void)integrityCheckBoosting
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: %@ has foreground clients but the transfer sync context doesn't contain self%@");
}

void __68__BRCAppLibrary__resolveTargetSharedClientZonesWhenBecameForeground__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412802;
  *(void *)&v3[4] = *(void *)(*(void *)a1 + 136);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_7_2(&dword_1D353B000, a2, a3, "[DEBUG] resolved target shared zones %@ for app library %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

void __58__BRCAppLibrary__removeTargetSharedServerZoneIfNecessary___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412802;
  *(void *)&v3[4] = *(void *)(a1 + 48);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a1 + 40);
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_7_2(&dword_1D353B000, a2, a3, "[DEBUG] not removing target shared zone %@ from %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

- (void)fetchRootItemInDB:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: nil dbRowID for %@%@");
}

- (void)setChildBasehashSalt:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _childBasehashSalt == nil%@", v2, v3, v4, v5, v6);
}

void __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: bad sql statement%@", v2, v3, v4, v5, v6);
}

void __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] %@%@", v4, v5, v6, v7, v8);
}

void __61__BRCAppLibrary_LegacyAdditions__coordinatorForItem_forRead___block_invoke_cold_1()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_12_0();
  uint64_t v6 = v0;
  __int16 v7 = v1;
  uint64_t v8 = v2;
  __int16 v9 = v1;
  uint64_t v10 = v3;
  _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] Releasing coordinated %s I/O slot for r:%@ for %@%@", v5, 0x2Au);
}

void __57__BRCAppLibrary_LegacyAdditions__addClientUsingUbiquity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: rootItem.isDirectory%@", v2, v3, v4, v5, v6);
}

@end