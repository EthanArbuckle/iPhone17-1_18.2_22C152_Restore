@interface BRCSyncUpOperation
+ (id)syncUpOperationForZone:(id)a3 sessionContext:(id)a4 syncUpCallback:(id)a5 maxCost:(float)a6 retryAfter:(unint64_t *)a7;
- (BOOL)_performMetadataSaltingOperationIfNecessaryWithCompletion:(id)a3;
- (BOOL)_performPCSChainOperationIfNecessaryWithCompletion:(id)a3;
- (BOOL)_recordIsIWorkShareable:(id)a3;
- (BOOL)encounteredErrorOnPCSChainedItem;
- (BOOL)prepareWithMaxCost:(float)a3 retryAfter:(unint64_t *)a4;
- (BOOL)shouldRetryForError:(id)a3;
- (BOOL)throttledItemInBatch;
- (BRCDirectoryItem)itemNeedingBasehashSalting;
- (BRCLocalItem)itemNeedingPCSChaining;
- (BRCServerZone)serverZone;
- (BRCSyncUpCallbackProtocol)syncUpCallback;
- (BRCSyncUpOperation)initWithZone:(id)a3 sessionContext:(id)a4 syncUpCallback:(id)a5;
- (NSMutableArray)createdAppLibraryNames;
- (NSMutableArray)iworkUnsharedShareIDs;
- (NSMutableArray)packagesInFlight;
- (NSMutableArray)recordsNeedingNewSharingProtectionInfo;
- (NSMutableArray)recordsNeedingUpdatedSharingProtectionInfo;
- (NSMutableArray)recordsToSave;
- (NSMutableDictionary)conflictLosersToResolveByRecordID;
- (NSMutableDictionary)pluginFieldsForRecordDeletesByID;
- (NSMutableDictionary)recordIDsToDeleteToEtags;
- (NSMutableDictionary)renamedShareIDsToNames;
- (NSMutableOrderedSet)deletedRecordIDs;
- (NSString)stageID;
- (float)cost;
- (id)createActivity;
- (id)syncUpCompletionBlock;
- (void)_performModifyRecordsOrBatchOperationWithCompletion:(id)a3;
- (void)_performShareUpdateAndModifyRecordsWithCompletion:(id)a3;
- (void)_performUpdateSharingProtectionDataIfNecessary:(id)a3;
- (void)_scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation;
- (void)_setSharingFieldsOnContentRecord:(id)a3 withProtectionData:(id)a4 baseToken:(id)a5 routingKey:(id)a6 forceOverwrite:(BOOL)a7;
- (void)dealloc;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)performShareUpdate:(id)a3;
- (void)setConflictLosersToResolveByRecordID:(id)a3;
- (void)setDeletedRecordIDs:(id)a3;
- (void)setItemNeedingBasehashSalting:(id)a3;
- (void)setItemNeedingPCSChaining:(id)a3;
- (void)setIworkUnsharedShareIDs:(id)a3;
- (void)setPackagesInFlight:(id)a3;
- (void)setPluginFieldsForRecordDeletesByID:(id)a3;
- (void)setRecordIDsToDeleteToEtags:(id)a3;
- (void)setRecordsNeedingNewSharingProtectionInfo:(id)a3;
- (void)setRecordsNeedingUpdatedSharingProtectionInfo:(id)a3;
- (void)setRecordsToSave:(id)a3;
- (void)setRenamedShareIDsToNames:(id)a3;
- (void)setServerZone:(id)a3;
- (void)setStageID:(id)a3;
- (void)setSyncUpCompletionBlock:(id)a3;
- (void)setThrottledItemInBatch:(BOOL)a3;
@end

@implementation BRCSyncUpOperation

- (BOOL)prepareWithMaxCost:(float)a3 retryAfter:(unint64_t *)a4
{
  uint64_t v181 = *MEMORY[0x1E4F143B8];
  v140 = [(BRCServerZone *)self->_serverZone clientZone];
  if ([v140 isSyncBlocked])
  {
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncUpOperation prepareWithMaxCost:retryAfter:]();
    }

LABEL_5:
    BOOL v7 = 0;
    goto LABEL_112;
  }
  if (([v140 isCloudDocsZone] & 1) == 0
    && [v140 isPrivateZone]
    && ![(BRCServerZone *)self->_serverZone hasFetchedServerZoneState])
  {
    long long v163 = 0u;
    long long v164 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    v8 = [v140 asPrivateClientZone];
    v9 = [v8 appLibraries];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v161 objects:v180 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v162;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v162 != v11) {
            objc_enumerationMutation(v9);
          }
          if ((~[*(id *)(*((void *)&v161 + 1) + 8 * i) state] & 0x140000) != 0)
          {
            v15 = brc_bread_crumbs();
            v16 = brc_default_log();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
              -[BRCSyncUpOperation prepareWithMaxCost:retryAfter:].cold.7();
            }

            goto LABEL_24;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v161 objects:v180 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    v13 = brc_bread_crumbs();
    v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpOperation prepareWithMaxCost:retryAfter:].cold.6();
    }

    [v140 clearSyncUpError];
    if (a4)
    {
      BOOL v7 = 0;
      *a4 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_112;
    }
    goto LABEL_5;
  }
LABEL_24:
  v138 = [[BRCSyncUpEnumerator alloc] initWithClientZone:v140];
  unsigned int v17 = [(BRCSyncUpEnumerator *)v138 batchSize];
  v18 = [v140 db];
  [v18 assertOnQueue];

  memset(v160, 0, sizeof(v160));
  __brc_create_section(0, (uint64_t)"-[BRCSyncUpOperation prepareWithMaxCost:retryAfter:]", 386, v160);
  v19 = brc_bread_crumbs();
  v20 = brc_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v166 = v160[0];
    __int16 v167 = 2112;
    uint64_t v168 = (uint64_t)v140;
    __int16 v169 = 1024;
    *(_DWORD *)v170 = v17;
    *(_WORD *)&v170[4] = 2112;
    *(void *)&v170[6] = v19;
    _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Sync: syncing up clientZone %@. batch size - %u%@", buf, 0x26u);
  }

  unint64_t v21 = v17;
  v137 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v17];
  v22 = [v140 mangledID];
  v135 = +[BRCUserDefaults defaultsForMangledID:v22];

  v23 = NSString;
  v24 = [(_BRCOperation *)self operationID];
  v25 = [v24 UUIDString];
  v26 = [v23 stringWithFormat:@"sync-up-%@", v25];
  stageID = self->_stageID;
  self->_stageID = v26;

  v28 = [(BRCSessionContext *)self->super._sessionContext syncUpStager];
  [v28 associateSyncUpStageID:self->_stageID withOperation:self];

  v29 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v21];
  recordsToSave = self->_recordsToSave;
  self->_recordsToSave = v29;

  v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  packagesInFlight = self->_packagesInFlight;
  self->_packagesInFlight = v31;

  v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  createdAppLibraryNames = self->_createdAppLibraryNames;
  self->_createdAppLibraryNames = v33;

  v35 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
  deletedRecordIDs = self->_deletedRecordIDs;
  self->_deletedRecordIDs = v35;

  v37 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  iworkUnsharedShareIDs = self->_iworkUnsharedShareIDs;
  self->_iworkUnsharedShareIDs = v37;

  v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  renamedShareIDsToNames = self->_renamedShareIDsToNames;
  self->_renamedShareIDsToNames = v39;

  v41 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  recordsNeedingNewSharingProtectionInfo = self->_recordsNeedingNewSharingProtectionInfo;
  self->_recordsNeedingNewSharingProtectionInfo = v41;

  v43 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  recordsNeedingUpdatedSharingProtectionInfo = self->_recordsNeedingUpdatedSharingProtectionInfo;
  self->_recordsNeedingUpdatedSharingProtectionInfo = v43;

  v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  recordIDsToDeleteToEtags = self->_recordIDsToDeleteToEtags;
  self->_recordIDsToDeleteToEtags = v45;

  v47 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  pluginFieldsForRecordDeletesByID = self->_pluginFieldsForRecordDeletesByID;
  self->_pluginFieldsForRecordDeletesByID = v47;

  v49 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  conflictLosersToResolveByRecordID = self->_conflictLosersToResolveByRecordID;
  self->_conflictLosersToResolveByRecordID = v49;

  v139 = objc_alloc_init(BRCSyncUpOperationBuilder);
  [(BRCSyncUpOperationBuilder *)v139 setOp:self];
  [(BRCSyncUpOperationBuilder *)v139 setDefaults:v135];
  v51 = [v140 session];
  [(BRCSyncUpOperationBuilder *)v139 setSession:v51];

  v52 = 0;
  float v53 = 0.0;
  while (1)
  {
    uint64_t v54 = [(NSMutableArray *)self->_recordsToSave count];
    if (v54 + [(NSMutableOrderedSet *)self->_deletedRecordIDs count] + 2 > v21
      || [(NSMutableArray *)self->_iworkUnsharedShareIDs count] + 1 > v21)
    {
      break;
    }
    v55 = [(BRCSyncUpEnumerator *)v138 nextObject];

    if (v55)
    {
      v56 = (void *)MEMORY[0x1D9438760]();
      [(BRCSyncUpOperationBuilder *)v139 addItem:v55];
      float v58 = v57;
      if (v57 <= 0.0)
      {
        v60 = [(BRCSyncUpOperationBuilder *)v139 itemNeedingBasehashSalting];
        itemNeedingBasehashSalting = self->_itemNeedingBasehashSalting;
        self->_itemNeedingBasehashSalting = v60;

        if (v60
          || ([(BRCSyncUpOperationBuilder *)v139 itemNeedingPCSChaining],
              v62 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue(),
              itemNeedingPCSChaining = self->_itemNeedingPCSChaining,
              self->_itemNeedingPCSChaining = v62,
              itemNeedingPCSChaining,
              v62))
        {
          int v59 = 15;
        }
        else
        {
          v64 = [v55 itemID];
          char v65 = [v64 isDocumentsFolder];

          if ((v65 & 1) == 0)
          {
            v66 = brc_bread_crumbs();
            v67 = brc_default_log();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v166 = (uint64_t)v55;
              __int16 v167 = 2112;
              uint64_t v168 = (uint64_t)v66;
              _os_log_debug_impl(&dword_1D353B000, v67, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring item with negative cost for now %@%@", buf, 0x16u);
            }
          }
          int v59 = 14;
        }
      }
      else
      {
        [v137 addObject:v55];
        float v53 = v53 + v58;
        int v59 = v53 >= a3 ? 15 : 0;
      }
      v52 = v55;
      if (v59 != 15) {
        continue;
      }
    }
    goto LABEL_45;
  }
  v55 = v52;
LABEL_45:
  id v142 = v55;
  long long v158 = 0u;
  long long v159 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  v68 = [(BRCSyncUpEnumerator *)v138 itemsNeedingUnshare];
  uint64_t v69 = [v68 countByEnumeratingWithState:&v156 objects:v179 count:16];
  if (v69)
  {
    uint64_t v143 = *(void *)v157;
    obuint64_t j = v68;
    do
    {
      uint64_t v144 = v69;
      for (uint64_t j = 0; j != v144; ++j)
      {
        if (*(void *)v157 != v143) {
          objc_enumerationMutation(obj);
        }
        v71 = *(void **)(*((void *)&v156 + 1) + 8 * j);
        v72 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initShareIDWithShareableItem:v71];
        [(NSMutableOrderedSet *)self->_deletedRecordIDs addObject:v72];
        if ([v71 isDocument])
        {
          v73 = [v71 asDocument];
          v74 = [v73 baseRecord];
          v75 = [v73 currentVersion];
          v76 = [v75 ckInfo];
          [v74 serializeSystemFields:v76];
        }
        else
        {
          v74 = [v71 baseStructureRecord];
          v73 = [v71 st];
          v75 = [v73 ckInfo];
          [v74 serializeSystemFields:v75];
        }

        long long v154 = 0u;
        long long v155 = 0u;
        long long v152 = 0u;
        long long v153 = 0u;
        v77 = self->_recordsToSave;
        uint64_t v78 = [(NSMutableArray *)v77 countByEnumeratingWithState:&v152 objects:v178 count:16];
        if (v78)
        {
          uint64_t v79 = *(void *)v153;
          while (2)
          {
            for (uint64_t k = 0; k != v78; ++k)
            {
              if (*(void *)v153 != v79) {
                objc_enumerationMutation(v77);
              }
              v81 = [*(id *)(*((void *)&v152 + 1) + 8 * k) recordID];
              v82 = [v74 recordID];
              char v83 = [v81 isEqual:v82];

              if (v83)
              {

                goto LABEL_63;
              }
            }
            uint64_t v78 = [(NSMutableArray *)v77 countByEnumeratingWithState:&v152 objects:v178 count:16];
            if (v78) {
              continue;
            }
            break;
          }
        }

        [(NSMutableArray *)self->_recordsToSave addObject:v74];
LABEL_63:
      }
      v68 = obj;
      uint64_t v69 = [obj countByEnumeratingWithState:&v156 objects:v179 count:16];
    }
    while (v69);
  }

  v84 = self;
  id v85 = v142;
  if (self->_itemNeedingBasehashSalting || self->_itemNeedingPCSChaining)
  {
    v86 = brc_bread_crumbs();
    v87 = brc_default_log();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
    {
      v129 = self->_itemNeedingBasehashSalting;
      v130 = @"salting";
      if (!v129)
      {
        v130 = @"pcs chaining";
        v129 = (BRCDirectoryItem *)self->_itemNeedingPCSChaining;
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v166 = (uint64_t)v130;
      __int16 v167 = 2112;
      uint64_t v168 = (uint64_t)v129;
      __int16 v169 = 2112;
      *(void *)v170 = v86;
      _os_log_debug_impl(&dword_1D353B000, v87, OS_LOG_TYPE_DEBUG, "[DEBUG] Dedicating this sync up operation to %@ %@%@", buf, 0x20u);
    }

    v84 = self;
    [(NSMutableArray *)self->_recordsToSave removeAllObjects];
    id v85 = v142;
    [(NSMutableOrderedSet *)self->_deletedRecordIDs removeAllObjects];
    [(NSMutableArray *)self->_iworkUnsharedShareIDs removeAllObjects];
    [(NSMutableDictionary *)self->_renamedShareIDsToNames removeAllObjects];
    [(NSMutableDictionary *)self->_recordIDsToDeleteToEtags removeAllObjects];
    [(NSMutableDictionary *)self->_pluginFieldsForRecordDeletesByID removeAllObjects];
    [(NSMutableDictionary *)self->_conflictLosersToResolveByRecordID removeAllObjects];
    [(NSMutableArray *)self->_recordsNeedingUpdatedSharingProtectionInfo removeAllObjects];
    [(NSMutableArray *)self->_recordsNeedingNewSharingProtectionInfo removeAllObjects];
    [v137 removeAllObjects];
    [(NSMutableArray *)self->_createdAppLibraryNames removeAllObjects];
  }
  [(BRCSyncUpEnumerator *)v138 invalidate];
  if ([(NSMutableArray *)v84->_recordsToSave count]
    || [(NSMutableOrderedSet *)v84->_deletedRecordIDs count]
    || [(NSMutableArray *)v84->_iworkUnsharedShareIDs count]
    || [(NSMutableDictionary *)v84->_renamedShareIDsToNames count]
    || v84->_itemNeedingPCSChaining
    || v84->_itemNeedingBasehashSalting)
  {
    if (!v84->_itemNeedingPCSChaining && !v84->_itemNeedingBasehashSalting)
    {
      v84->_unint64_t requestID = [v140 allocateSyncUpRequestID];
      uint64_t v145 = [v137 count];
      long long v150 = 0u;
      long long v151 = 0u;
      long long v148 = 0u;
      long long v149 = 0u;
      id v88 = v137;
      uint64_t v89 = [v88 countByEnumeratingWithState:&v148 objects:v177 count:16];
      if (v89)
      {
        uint64_t v90 = *(void *)v149;
        do
        {
          uint64_t v91 = 0;
          v92 = v142;
          do
          {
            if (*(void *)v149 != v90) {
              objc_enumerationMutation(v88);
            }
            id v142 = *(id *)(*((void *)&v148 + 1) + 8 * v91);

            v93 = (void *)MEMORY[0x1D9438760]();
            if ([v142 isDocument])
            {
              v94 = [v142 asDocument];
              v95 = [v140 session];
              v96 = [v95 analyticsReporter];
              v97 = [v94 itemID];
              v147[0] = MEMORY[0x1E4F143A8];
              v147[1] = 3221225472;
              v147[2] = __52__BRCSyncUpOperation_prepareWithMaxCost_retryAfter___block_invoke;
              v147[3] = &unk_1E69971A8;
              v147[4] = self;
              v147[5] = v145;
              [v96 lookupFSEventToSyncUpEventByItemID:v97 accessor:v147];
            }
            [v142 saveToDBAndValidateLocalDiffs];
            ++v91;
            v92 = v142;
          }
          while (v89 != v91);
          uint64_t v89 = [v88 countByEnumeratingWithState:&v148 objects:v177 count:16];
        }
        while (v89);
      }

      id v85 = 0;
      v84 = self;
    }
    v98 = [(BRCServerZone *)v84->_serverZone mangledID];
    v99 = +[BRCUserDefaults defaultsForMangledID:v98];
    id v142 = v85;
    if ([v99 destroyiWorkShares])
    {
      BOOL v100 = [(NSMutableArray *)v84->_iworkUnsharedShareIDs count] == 0;

      if (!v100)
      {
        v101 = brc_bread_crumbs();
        v102 = brc_default_log();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG)) {
          -[BRCSyncUpOperation prepareWithMaxCost:retryAfter:].cold.5();
        }

        [(NSMutableOrderedSet *)self->_deletedRecordIDs addObjectsFromArray:self->_iworkUnsharedShareIDs];
        [(NSMutableArray *)self->_iworkUnsharedShareIDs removeAllObjects];
      }
    }
    else
    {
    }
    if ([v140 isPrivateZone])
    {
      v103 = [v140 asPrivateClientZone];
      v104 = [v103 defaultAppLibrary];
      char v105 = [v104 rootRecordCreated];

      if ((v105 & 1) == 0)
      {
        v106 = (void *)MEMORY[0x1E4F1A2D8];
        v107 = [(BRCServerZone *)self->_serverZone zoneID];
        v108 = [v106 rootDirectoryRecordForZoneID:v107];

        v109 = [(BRCSyncUpOperationBuilder *)v139 rootChildBasehashSalt];
        if (v109)
        {
          objc_msgSend(v108, "brc_fillWithChildBasehashSalt:", v109);
          v110 = [v140 asPrivateClientZone];
          v111 = [v110 defaultAppLibrary];

          if (([v111 state] & 0x200000) != 0 || objc_msgSend(v111, "saltingState") < 2) {
            uint64_t v112 = 3;
          }
          else {
            uint64_t v112 = [v111 saltingState];
          }
          v113 = [NSNumber numberWithUnsignedInt:v112];
          [v108 setObject:v113 forKeyedSubscript:@"saltingState"];
        }
        [(NSMutableArray *)self->_recordsToSave insertObject:v108 atIndex:0];
        v114 = brc_bread_crumbs();
        v115 = brc_default_log();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG)) {
          -[BRCSyncUpOperation prepareWithMaxCost:retryAfter:].cold.4();
        }
      }
    }
    v116 = brc_bread_crumbs();
    v117 = brc_default_log();
    if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
    {
      unint64_t requestID = self->_requestID;
      uint64_t v124 = [(NSMutableArray *)self->_recordsToSave count];
      uint64_t v125 = [(NSMutableOrderedSet *)self->_deletedRecordIDs count];
      uint64_t v126 = [(NSMutableArray *)self->_iworkUnsharedShareIDs count];
      uint64_t v127 = [(NSMutableDictionary *)self->_renamedShareIDsToNames count];
      uint64_t v128 = [v137 count];
      *(_DWORD *)buf = 134219522;
      uint64_t v166 = requestID;
      __int16 v167 = 2048;
      uint64_t v168 = v124;
      __int16 v169 = 2048;
      *(void *)v170 = v125;
      *(_WORD *)&v170[8] = 2048;
      *(void *)&v170[10] = v126;
      __int16 v171 = 2048;
      uint64_t v172 = v127;
      __int16 v173 = 2048;
      uint64_t v174 = v128;
      __int16 v175 = 2112;
      v176 = v116;
      _os_log_debug_impl(&dword_1D353B000, v117, OS_LOG_TYPE_DEBUG, "[DEBUG] preparing to send in requestID:%lld: %lu records, delete %lu recordIDs, unshare %lu iwork shares, rename %lu shares, about %lu items%@", buf, 0x48u);
    }

    v118 = brc_bread_crumbs();
    v119 = brc_default_log();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v120 = [v137 count];
      v121 = [v140 mangledID];
      *(_DWORD *)buf = 134218498;
      uint64_t v166 = v120;
      __int16 v167 = 2112;
      uint64_t v168 = (uint64_t)v121;
      __int16 v169 = 2112;
      *(void *)v170 = v118;
      _os_log_impl(&dword_1D353B000, v119, OS_LOG_TYPE_DEFAULT, "[NOTICE] sending %lu items to the cloud for %@\n%@", buf, 0x20u);
    }
    if (a4) {
      *a4 = 0;
    }
    self->_cost = v53;
    BOOL v7 = 1;
  }
  else
  {
    v131 = brc_bread_crumbs();
    v132 = brc_default_log();
    if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpOperation prepareWithMaxCost:retryAfter:]();
    }

    if ([v137 count])
    {
      v133 = brc_bread_crumbs();
      v134 = brc_default_log();
      if (os_log_type_enabled(v134, OS_LOG_TYPE_FAULT)) {
        -[BRCSyncUpOperation prepareWithMaxCost:retryAfter:]();
      }
    }
    [v140 clearSyncUpError];
    BOOL v7 = 0;
    if (a4) {
      *a4 = [(BRCSyncUpEnumerator *)v138 retryAfter];
    }
  }

  __brc_leave_section(v160);
LABEL_112:

  return v7;
}

void __52__BRCSyncUpOperation_prepareWithMaxCost_retryAfter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setSyncUpBatchSize:v3];
  [*(id *)(a1 + 32) associateCKOperationsToEventMetric:v4];
}

- (BRCSyncUpOperation)initWithZone:(id)a3 sessionContext:(id)a4 syncUpCallback:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  v12 = [v9 zoneName];
  v13 = [@"sync-up/" stringByAppendingString:v12];

  v14 = [v9 ownerName];
  char v15 = [v14 isEqualToString:*MEMORY[0x1E4F19C08]];

  if ((v15 & 1) == 0)
  {
    v16 = [v9 ownerName];
    uint64_t v17 = [v13 stringByAppendingFormat:@":%@", v16];

    v13 = (void *)v17;
  }
  v18 = [v9 metadataSyncContext];
  v25.receiver = self;
  v25.super_class = (Class)BRCSyncUpOperation;
  v19 = [(_BRCOperation *)&v25 initWithName:v13 syncContext:v18 sessionContext:v11];

  if (v19)
  {
    [(BRCSyncUpOperation *)v19 setQueuePriority:4];
    v20 = [(_BRCOperation *)v19 callbackQueue];
    unint64_t v21 = [v9 clientZone];
    v22 = [v21 session];
    v23 = [v22 clientTruthWorkloop];
    dispatch_set_target_queue(v20, v23);

    objc_storeStrong((id *)&v19->_serverZone, a3);
    objc_storeStrong((id *)&v19->_syncUpCallback, a5);
  }

  return v19;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "sync-up", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

+ (id)syncUpOperationForZone:(id)a3 sessionContext:(id)a4 syncUpCallback:(id)a5 maxCost:(float)a6 retryAfter:(unint64_t *)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  char v15 = (void *)[objc_alloc((Class)a1) initWithZone:v14 sessionContext:v13 syncUpCallback:v12];

  *(float *)&double v16 = a6;
  if ([v15 prepareWithMaxCost:a7 retryAfter:v16])
  {
    id v17 = v15;
  }
  else
  {
    uint64_t v18 = [v15 completionBlock];
    v19 = (void *)v18;
    if (v18) {
      (*(void (**)(uint64_t))(v18 + 16))(v18);
    }

    id v17 = 0;
  }

  return v17;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_packagesInFlight;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeDB];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)BRCSyncUpOperation;
  [(_BRCOperation *)&v8 dealloc];
}

- (BOOL)_performMetadataSaltingOperationIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[BRCUserDefaults defaultsForMangledID:0];
  if (![v5 supportsEnhancedDrivePrivacy])
  {

    goto LABEL_6;
  }
  itemNeedingBasehashSalting = self->_itemNeedingBasehashSalting;

  if (!itemNeedingBasehashSalting)
  {
LABEL_6:
    BOOL v11 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = [(BRCLocalItem *)self->_itemNeedingBasehashSalting appLibrary];
  objc_super v8 = [(_BRCOperation *)self callbackQueue];
  long long v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    long long v12 = [v7 db];
    id v10 = [v12 serialQueue];
  }
  id v13 = [v7 db];
  uint64_t v14 = [v13 serialQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke;
  v18[3] = &unk_1E6993D18;
  v18[4] = self;
  id v19 = v7;
  id v20 = v10;
  id v21 = v4;
  id v15 = v10;
  id v16 = v7;
  dispatch_sync(v14, v18);

  BOOL v11 = 1;
LABEL_9:

  return v11;
}

void __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  os_activity_t v2 = [[BRCSaltingBatchOperation alloc] initWithParentItem:*(void *)(*(void *)(a1 + 32) + 616) sessionContext:*(void *)(*(void *)(a1 + 32) + 256)];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_2;
  uint64_t v7 = &unk_1E69971D0;
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v3;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  [(BRCSaltingBatchOperation *)v2 setMetadataCompletionBlock:&v4];
  objc_msgSend(*(id *)(a1 + 32), "addSubOperation:", v2, v4, v5, v6, v7, v8);
}

void __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_2(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 616);
    *(_DWORD *)buf = 138413314;
    uint64_t v21 = v14;
    __int16 v22 = 1024;
    int v23 = a2;
    __int16 v24 = 1024;
    int v25 = a3;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2112;
    v29 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished metadata salting a batch for item %@ when completed: %d validation: %d error: %@%@", buf, 0x2Cu);
  }

  if (v7 || a3)
  {
    id v10 = [*(id *)(a1 + 40) db];
    id v11 = [v10 serialQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_26;
    v15[3] = &unk_1E6993D18;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 32);
    id v16 = v12;
    uint64_t v17 = v13;
    id v18 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 56);
    dispatch_async(v11, v15);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_26(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t v3 = [*(id *)(a1 + 32) defaultClientZone];
  uint64_t v4 = [*(id *)(*(void *)(v2 + 8) + 616) itemID];
  uint64_t v5 = [v3 itemByItemID:v4];

  uint64_t v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_26_cold_2();
  }

  if (v5)
  {
    uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 512);
    id v9 = [*(id *)(a1 + 32) defaultClientZone];
    id v10 = [v9 dbRowID];
    [v8 postponeSyncUpCallback:v5 inZone:v10];
  }
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_26_cold_1();
  }

  uint64_t v13 = [*(id *)(a1 + 32) defaultClientZone];
  [v13 scheduleSyncDown];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_27;
  block[3] = &unk_1E6995800;
  uint64_t v14 = *(NSObject **)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  dispatch_async(v14, block);
}

uint64_t __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_performPCSChainOperationIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  itemNeedingPCSChaining = self->_itemNeedingPCSChaining;
  if (itemNeedingPCSChaining)
  {
    uint64_t v6 = [(BRCLocalItem *)self->_itemNeedingPCSChaining appLibrary];
    id v7 = [(_BRCOperation *)self callbackQueue];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v10 = [v6 db];
      id v9 = [v10 serialQueue];
    }
    id v11 = [v6 db];
    id v12 = [v11 serialQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke;
    v16[3] = &unk_1E6993D18;
    v16[4] = self;
    id v17 = v6;
    id v18 = v9;
    id v19 = v4;
    id v13 = v9;
    id v14 = v6;
    dispatch_sync(v12, v16);
  }
  return itemNeedingPCSChaining != 0;
}

void __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke(id *a1)
{
  uint64_t v2 = [*((id *)a1[4] + 76) itemID];
  uint64_t v3 = [a1[5] defaultClientZone];
  id v4 = [v3 serverItemByItemID:v2];

  uint64_t v5 = [[BRCPCSChainingOperation alloc] initWithRootItem:v4 appLibrary:a1[5] sessionContext:*((void *)a1[4] + 32) syncUpCallback:*((void *)a1[4] + 64)];
  [(BRCPCSChainingOperation *)v5 setShouldFillBatch:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6997248;
  id v8 = a1[5];
  id v9 = v2;
  id v10 = a1[4];
  id v11 = a1[6];
  id v12 = a1[7];
  id v6 = v2;
  [(BRCPCSChainingOperation *)v5 setPcsChainCompletionBlock:v7];
  [a1[4] addSubOperation:v5];
}

void __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke_2(uint64_t a1, int a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109890;
    int v27 = a2;
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v9;
    __int16 v32 = 2112;
    v33 = v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished PCS chaining a batch when completed: %d listOp: %@ error: %@%@", buf, 0x26u);
  }

  if (v9)
  {
    id v12 = [*(id *)(a1 + 32) db];
    id v13 = [v12 serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke_31;
    block[3] = &unk_1E69971F8;
    id v21 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = *(void **)(a1 + 56);
    id v22 = v14;
    uint64_t v23 = v15;
    id v24 = v16;
    id v25 = *(id *)(a1 + 64);
    dispatch_async(v13, block);

    id v17 = v21;
  }
  else
  {
    if (!v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      goto LABEL_8;
    }
    [v8 beginObservingChangesWithDelegate:0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke_3;
    v18[3] = &unk_1E6997220;
    id v19 = *(id *)(a1 + 64);
    [v8 addPreFlushDirectoryListCompletionBlock:v18];
    id v17 = v19;
  }

LABEL_8:
}

void __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke_31(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) defaultClientZone];
  uint64_t v3 = [v2 itemByItemID:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = *(void **)(*(void *)(a1 + 48) + 512);
    uint64_t v5 = [*(id *)(a1 + 32) defaultClientZone];
    id v6 = [v5 dbRowID];
    [v4 postponeSyncUpCallback:v3 inZone:v6];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke_2_32;
  block[3] = &unk_1E6995800;
  id v7 = *(NSObject **)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  dispatch_async(v7, block);
}

uint64_t __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke_2_32(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performModifyRecordsOrBatchOperationWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCServerZone *)self->_serverZone clientZone];
  id v6 = [(BRCSyncContext *)self->super._syncContext session];
  id v7 = self->_serverZone;
  if (![(BRCSyncUpOperation *)self _performMetadataSaltingOperationIfNecessaryWithCompletion:v4]&& ![(BRCSyncUpOperation *)self _performPCSChainOperationIfNecessaryWithCompletion:v4])
  {
    uint64_t v8 = [(NSMutableArray *)self->_recordsToSave count];
    if (v8 + [(NSMutableOrderedSet *)self->_deletedRecordIDs count])
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1A198]);
      [v9 setRecordsToSave:self->_recordsToSave];
      id v10 = [(NSMutableOrderedSet *)self->_deletedRecordIDs array];
      [v9 setRecordIDsToDelete:v10];

      [v9 setRecordIDsToDeleteToEtags:self->_recordIDsToDeleteToEtags];
      if ([(NSMutableDictionary *)self->_pluginFieldsForRecordDeletesByID count]) {
        [v9 setPluginFieldsForRecordDeletesByID:self->_pluginFieldsForRecordDeletesByID];
      }
      if ([(NSMutableDictionary *)self->_conflictLosersToResolveByRecordID count]) {
        [v9 setConflictLosersToResolveByRecordID:self->_conflictLosersToResolveByRecordID];
      }
      [v9 setSavePolicy:0];
      id v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&self->_requestID length:8];
      [v9 setClientChangeTokenData:v11];

      [v9 setAtomic:1];
      id v12 = [v5 db];
      id v13 = [v12 serialQueue];
      [v9 setCallbackQueue:v13];

      id v14 = objc_opt_new();
      uint64_t v15 = [v5 mangledID];
      id v16 = +[BRCUserDefaults defaultsForMangledID:v15];
      char v17 = [v16 skipPerItemSyncUpThrottling];

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke;
      v21[3] = &unk_1E6997298;
      id v22 = v5;
      uint64_t v23 = self;
      id v24 = v14;
      id v25 = v6;
      __int16 v26 = v7;
      char v27 = v17;
      id v18 = v14;
      [v9 setPerRecordCompletionBlock:v21];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_45;
      v19[3] = &unk_1E69972C0;
      id v20 = v4;
      [v9 setModifyRecordsCompletionBlock:v19];
      [(_BRCOperation *)self addSubOperation:v9];
    }
    else
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && v6)
  {
    memset(v45, 0, sizeof(v45));
    __brc_create_section(0, (uint64_t)"-[BRCSyncUpOperation _performModifyRecordsOrBatchOperationWithCompletion:]_block_invoke", 740, v45);
    uint64_t v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v31 = v45[0];
      __int16 v32 = [v5 recordID];
      v33 = [v32 recordName];
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v31;
      __int16 v47 = 2112;
      v48 = v33;
      __int16 v49 = 2112;
      v50 = v7;
      __int16 v51 = 2112;
      v52 = v8;
      _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx sync-up error for record %@: %@%@", buf, 0x2Au);
    }
    id v10 = [*(id *)(a1 + 32) db];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_37;
    v36[3] = &unk_1E6997270;
    id v37 = v7;
    id v38 = v5;
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = *(void **)(a1 + 48);
    id v39 = v11;
    uint64_t v40 = v12;
    id v41 = v13;
    id v42 = *(id *)(a1 + 56);
    id v43 = *(id *)(a1 + 64);
    char v44 = *(unsigned char *)(a1 + 72);
    [v10 groupInBatch:v36];

    __brc_leave_section(v45);
  }
  else if (v5)
  {
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = [v5 recordID];
    id v16 = [v15 recordName];
    int v17 = [v16 hasPrefix:@"documentContent/"];

    if (v17)
    {
      id v18 = [v5 recordID];
      id v19 = [v14 session];
      id v20 = objc_msgSend(v18, "brc_itemIDWithSession:", v19);

      id v21 = [v14 itemByItemID:v20];
      if (([v21 isDocumentBeingCopiedToNewZone] & 1) == 0)
      {
        id v22 = [v21 st];
        uint64_t v23 = [v22 filename];
        id v24 = objc_msgSend(v23, "br_pathExtension");

        if (([v24 isEqualToString:@"key"] & 1) != 0
          || ([v24 isEqualToString:@"numbers"] & 1) != 0
          || [v24 isEqualToString:@"pages"])
        {
          id v25 = [v5 objectForKeyedSubscript:@"pkgContent"];
          __int16 v26 = v25;
          if (v25)
          {
            *(void *)buf = 0;
            char v27 = [v25 openWithError:buf];
            id v28 = *(id *)buf;
            if (v27)
            {
              if (![v26 itemCount])
              {
                id v29 = brc_bread_crumbs();
                __int16 v30 = brc_default_log();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
                  __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_cold_1();
                }
              }
              [v26 close];
            }
            else
            {
              uint64_t v34 = brc_bread_crumbs();
              v35 = brc_default_log();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
                __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_cold_2();
              }
            }
          }
        }
      }
    }
  }
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_37(uint64_t a1)
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(*(id *)(a1 + 32), "brc_isCloudKitUnknownItemError") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "brc_isCloudKitErrorMissingContentRecordForNewStructureRecord"))
  {
    uint64_t v2 = *(void **)(a1 + 40);
    id v3 = *(id *)(a1 + 48);
    id v4 = [v2 recordID];
    id v5 = [v3 session];
    id v6 = objc_msgSend(v4, "brc_itemIDWithSession:", v5);

    id v7 = [v3 itemByItemID:v6];

    [v7 handleUnknownItemError];
    [v7 saveToDB];

LABEL_19:
    id v25 = 0;
    id v26 = 0;
    id v27 = 0;
    goto LABEL_20;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "brc_isStaleRecordUpdateError") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "brc_isReferenceValidationError"))
  {
    uint64_t v8 = *(void **)(a1 + 48);
    id v9 = *(id *)(a1 + 40);
    id v10 = v8;
    id v11 = [v9 recordID];
    uint64_t v12 = [v10 session];
    id v13 = objc_msgSend(v11, "brc_itemIDWithSession:", v12);

    id v14 = [v10 itemByItemID:v13];
    uint64_t v15 = [v14 parentItemIDInZone];
    id v16 = v15;
    if (v15 && ([v15 isNonDesktopRoot] & 1) == 0)
    {
      int v17 = [v14 clientZone];
      id v18 = [v17 itemByItemID:v16];

      if ([v18 isDeadOrMissingInServerTruth])
      {
        id v19 = brc_bread_crumbs();
        id v20 = brc_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_37_cold_2();
        }

        [v18 markForceNeedsSyncUp];
        [v18 saveToDB];
      }
    }
    if ([v14 isDeadOrMissingInServerTruth])
    {
      id v21 = brc_bread_crumbs();
      id v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_37_cold_1();
      }

      [v14 markForceRejected];
      [v14 markNeedsUploadOrSyncingUp];
      [v14 saveToDB];
    }
    else
    {
      uint64_t v23 = [v9 recordID];
      id v24 = (id)[v10 locateRecordIfNecessaryForRecordID:v23 isUserWaiting:0];
    }
    goto LABEL_19;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "brc_containsCloudKitErrorCode:", 10))
  {
    id v28 = *(void **)(a1 + 40);
    id v29 = *(id *)(a1 + 48);
    __int16 v30 = [v28 recordID];
    uint64_t v31 = [v29 session];
    __int16 v32 = objc_msgSend(v30, "brc_itemIDWithSession:", v31);

    v33 = [v29 itemByItemID:v32];
    uint64_t v34 = [v29 mangledID];
    v35 = +[BRCUserDefaults defaultsForMangledID:v34];

    if (![v33 isSharedToMeChildItem]
      || ![v35 changeItemIDOnUnknownItem])
    {
      goto LABEL_27;
    }
    v99 = objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v33);
    v98 = objc_msgSend(v99, "brc_shareItemID");
    uint64_t v36 = [v35 maxSyncPathDepth];
    id v37 = [v33 db];
    id v38 = [v33 itemID];
    id v39 = [v29 dbRowID];
    uint64_t v40 = [v29 dbRowID];
    id v41 = (void *)[v37 itemIDWithSQL:@" WITH RECURSIVE item_parents (item_id, item_sharing_options, item_parent_id) AS(         SELECT item_id, item_sharing_options, item_parent_id FROM server_items           WHERE item_id = %@ AND zone_rowid = %@       UNION ALL          SELECT li.item_id, li.item_sharing_options, li.item_parent_id FROM server_items AS li     INNER JOIN item_parents AS p WHERE li.zone_rowid = %@ AND p.item_parent_id = li.item_id          LIMIT %u)        SELECT item_id FROM item_parents WHERE (item_sharing_options & 4) != 0", v38, v39, v40, v36];

    if (v98 && [v41 isEqualToItemID:v98])
    {

LABEL_27:
      goto LABEL_28;
    }
    v46 = brc_bread_crumbs();
    __int16 v47 = brc_default_log();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v111 = v98;
      __int16 v112 = 2112;
      id v113 = v41;
      __int16 v114 = 2112;
      v115 = v32;
      __int16 v116 = 2112;
      v117 = v46;
      _os_log_impl(&dword_1D353B000, v47, OS_LOG_TYPE_DEFAULT, "[WARNING] We changed share roots from %@ to %@ on %@ and got a permission error so behaving like an unknown item%@", buf, 0x2Au);
    }

    [v33 handleUnknownItemError];
    char v48 = [v33 saveToDB];

    if (v48) {
      goto LABEL_19;
    }
  }
LABEL_28:
  if (objc_msgSend(*(id *)(a1 + 32), "brc_isCloudKitErrorRequiringAssetRescan")
    || objc_msgSend(*(id *)(a1 + 32), "brc_isCloudKitErrorRequiringAssetReupload"))
  {
    reuploadItemInContainer(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 32), *(void **)(a1 + 56));
    goto LABEL_19;
  }
  id v42 = *(void **)(a1 + 32);
  id v109 = 0;
  int v43 = objc_msgSend(v42, "brc_isCloudKitErrorUnsupportedOSForItemAndGetMinimumSupported:", &v109);
  id v27 = v109;
  if (v43)
  {
    markRecordBacklistedFromSyncWithMinimumSupportedOS(*(void **)(a1 + 40), v27, *(void **)(a1 + 48));
    id v25 = 0;
    id v26 = 0;
    goto LABEL_20;
  }
  char v44 = *(void **)(a1 + 32);
  id v108 = 0;
  int v45 = objc_msgSend(v44, "brc_isCloudKitErrorReparentedToNewParent:", &v108);
  id v26 = v108;
  if (v45)
  {
    markRecordNeedingRemapToNewParent(*(void **)(a1 + 40), v26, *(void **)(a1 + 48), *(void **)(a1 + 64));
    id v25 = 0;
    goto LABEL_20;
  }
  __int16 v49 = *(void **)(a1 + 32);
  id v107 = 0;
  int v50 = objc_msgSend(v49, "brc_isCloudKitErrorRemappedToNewRecordName:", &v107);
  id v25 = v107;
  if (v50)
  {
    markRecordNeedingRemapToNewRecordName(*(void **)(a1 + 40), v25, *(void **)(a1 + 48), *(void **)(a1 + 64));
    goto LABEL_20;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "brc_isIndividualItemBlacklistError"))
  {
    __int16 v51 = [*(id *)(a1 + 40) recordID];
    v52 = [*(id *)(a1 + 48) session];
    objc_msgSend(v51, "brc_itemIDWithSession:", v52);
    id v53 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v54 = [*(id *)(a1 + 48) itemByItemID:v53];
    v55 = brc_bread_crumbs();
    v56 = brc_default_log();
    if (os_log_type_enabled(v56, (os_log_type_t)0x90u)) {
      __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_37_cold_3();
    }

    float v57 = *(void **)(a1 + 48);
    float v58 = *(void **)(*(void *)(a1 + 56) + 512);
    int v59 = [v57 dbRowID];
    [v58 blockSyncUpCallback:v54 inZone:v59];
    goto LABEL_45;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "brc_containsCloudKitErrorCode:", 15)
    || !objc_msgSend(*(id *)(a1 + 32), "brc_containsCloudKitInternalErrorCode:", 2040))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "brc_isCloudKitPCSChainingError")
      || ([*(id *)(a1 + 40) parent],
          v64 = objc_claimAutoreleasedReturnValue(),
          v64,
          v64))
    {
      char v65 = *(void **)(a1 + 32);
      id v100 = 0;
      int v66 = objc_msgSend(v65, "brc_isCloudKitShouldBeUsingEnhancedDrivePrivacyWithFieldName:", &v100);
      id v53 = v100;
      if (!v66)
      {
        if ([*(id *)(a1 + 48) handleSaltingErrorIfNeeded:*(void *)(a1 + 32) record:*(void *)(a1 + 40)])
        {
          handleErrorForRecord(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 32), *(void **)(a1 + 56));
        }
        else if (objc_msgSend(*(id *)(a1 + 32), "brc_isCloudKitAtomicFailure"))
        {
          v71 = brc_bread_crumbs();
          v72 = brc_default_log();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
            __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_37_cold_4();
          }
        }
        else
        {
          if (*(unsigned char *)(a1 + 88))
          {
            v81 = brc_bread_crumbs();
            v82 = brc_default_log();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG)) {
              __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_37_cold_5();
            }
          }
          else
          {
            handleErrorForRecord(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 32), *(void **)(a1 + 56));
          }
          v93 = [*(id *)(a1 + 40) parent];
          *(unsigned char *)(*(void *)(a1 + 56) + 520) = v93 != 0;
        }
        goto LABEL_84;
      }
      v67 = brc_bread_crumbs();
      v68 = brc_default_log();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        v94 = *(void **)(a1 + 80);
        *(_DWORD *)buf = 138412802;
        v111 = v94;
        __int16 v112 = 2112;
        id v113 = v53;
        __int16 v114 = 2112;
        v115 = v67;
        _os_log_debug_impl(&dword_1D353B000, v68, OS_LOG_TYPE_DEBUG, "[DEBUG] Enabling server zone %@ to use enhanced drive privacy (fieldName %@)%@", buf, 0x20u);
      }

      uint64_t v69 = *(void **)(a1 + 48);
      uint64_t v70 = 0x400000;
      goto LABEL_57;
    }
    v73 = [*(id *)(a1 + 40) recordID];
    v74 = [*(id *)(a1 + 48) session];
    objc_msgSend(v73, "brc_itemIDWithSession:", v74);
    id v53 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v54 = [*(id *)(a1 + 48) itemByItemID:v53];
    int v59 = [*(id *)(a1 + 48) serverItemByItemID:v53];
    if ([v54 isZoneRoot])
    {
      id v75 = 0;
    }
    else
    {
      char v83 = *(void **)(a1 + 48);
      v84 = [v54 st];
      id v85 = [v84 parentID];
      id v75 = [v83 serverItemByItemID:v85];

      if (v75 && ![v75 pcsChainState])
      {
        v95 = brc_bread_crumbs();
        v96 = brc_default_log();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v111 = v95;
          _os_log_impl(&dword_1D353B000, v96, OS_LOG_TYPE_DEFAULT, "[WARNING] Updating parent item to be chained because it is unknown and we encountered a PCS error%@", buf, 0xCu);
        }

        v97 = [*(id *)(a1 + 72) serverTruthWorkloop];
        v104[0] = MEMORY[0x1E4F143A8];
        v104[1] = 3221225472;
        v104[2] = __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_38;
        v104[3] = &unk_1E6993628;
        id v105 = *(id *)(a1 + 72);
        id v75 = v75;
        id v106 = v75;
        dispatch_async(v97, v104);

        v92 = v105;
        goto LABEL_88;
      }
    }
    if (!v59 || [v59 pcsChainState])
    {
      v86 = brc_bread_crumbs();
      v87 = brc_default_log();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        id v88 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v111 = v88;
        __int16 v112 = 2112;
        id v113 = v86;
        _os_log_impl(&dword_1D353B000, v87, OS_LOG_TYPE_DEFAULT, "[WARNING] Encountered an unknown pcs error for %@%@", buf, 0x16u);
      }

      handleErrorForRecord(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 32), *(void **)(a1 + 56));
      *(unsigned char *)(*(void *)(a1 + 56) + 520) = 1;
      goto LABEL_89;
    }
    uint64_t v89 = brc_bread_crumbs();
    uint64_t v90 = brc_default_log();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v111 = v89;
      _os_log_impl(&dword_1D353B000, v90, OS_LOG_TYPE_DEFAULT, "[WARNING] Updating local item to be chained because it is unknown and we encountered a PCS error%@", buf, 0xCu);
    }

    uint64_t v91 = [*(id *)(a1 + 72) serverTruthWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_42;
    block[3] = &unk_1E6993628;
    id v102 = *(id *)(a1 + 72);
    id v103 = v59;
    dispatch_async(v91, block);

    v92 = v102;
LABEL_88:

LABEL_89:
LABEL_45:

LABEL_84:
    goto LABEL_20;
  }
  v60 = [*(id *)(a1 + 40) recordID];
  int v61 = objc_msgSend(v60, "brc_isZoneRootRecordID");

  if (!v61)
  {
    v76 = [*(id *)(a1 + 40) recordID];
    int v77 = objc_msgSend(v76, "brc_isAppLibraryRootRecordID");

    if (!v77) {
      goto LABEL_20;
    }
    uint64_t v78 = *(void **)(a1 + 72);
    uint64_t v79 = [*(id *)(a1 + 40) recordID];
    v80 = objc_msgSend(v79, "brc_appLibraryRootZoneName");
    id v53 = [v78 appLibraryByID:v80];

    uint64_t v69 = v53;
    uint64_t v70 = 2;
LABEL_57:
    [v69 setStateBits:v70];
    goto LABEL_84;
  }
  if ([*(id *)(a1 + 48) isPrivateZone])
  {
    v62 = [*(id *)(a1 + 48) asPrivateClientZone];
    v63 = [v62 defaultAppLibrary];
    [v63 setStateBits:2];
  }
LABEL_20:
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_38(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) serverDB];
  uint64_t v2 = [*(id *)(a1 + 40) itemID];
  id v3 = [*(id *)(a1 + 40) serverZone];
  id v4 = [v3 dbRowID];
  [v5 execute:@"UPDATE server_items SET pcs_state = 3 WHERE item_id = %@ AND zone_rowid = %@ AND pcs_state = 0", v2, v4];
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_42(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) serverDB];
  uint64_t v2 = [*(id *)(a1 + 40) itemID];
  id v3 = [*(id *)(a1 + 40) serverZone];
  id v4 = [v3 dbRowID];
  [v5 execute:@"UPDATE server_items SET pcs_state = 3 WHERE item_id = %@ AND zone_rowid = %@ AND pcs_state = 0", v2, v4];
}

uint64_t __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  syncUpCompletionBlocuint64_t k = (void (**)(id, void *, id, id))self->_syncUpCompletionBlock;
  if (syncUpCompletionBlock)
  {
    id v9 = [(BRCServerZone *)self->_serverZone clientZone];
    syncUpCompletionBlock[2](syncUpCompletionBlock, v9, v6, v7);

    id v10 = self->_syncUpCompletionBlock;
    self->_syncUpCompletionBlocuint64_t k = 0;
  }
  [(BRCSyncUpOperation *)self hash];
  kdebug_trace();
  v11.receiver = self;
  v11.super_class = (Class)BRCSyncUpOperation;
  [(_BRCOperation *)&v11 finishWithResult:v6 error:v7];
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)performShareUpdate:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableArray *)self->_iworkUnsharedShareIDs count]
    || [(NSMutableDictionary *)self->_renamedShareIDsToNames count])
  {
    id v5 = [(BRCSyncUpOperation *)self serverZone];
    char v6 = [v5 isPrivateZone];

    if ((v6 & 1) == 0)
    {
      int v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[BRCSyncUpOperation performShareUpdate:]();
      }
    }
    id v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      renamedShareIDsToNames = self->_renamedShareIDsToNames;
      iworkUnsharedShareIDs = self->_iworkUnsharedShareIDs;
      *(_DWORD *)buf = 138412802;
      id v26 = renamedShareIDsToNames;
      __int16 v27 = 2112;
      id v28 = iworkUnsharedShareIDs;
      __int16 v29 = 2112;
      __int16 v30 = v7;
      _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Fetching share IDs shared by us for renames: %@ and unshare: %@%@", buf, 0x20u);
    }

    id v9 = (void *)MEMORY[0x1E4F1CA80];
    id v10 = [(NSMutableDictionary *)self->_renamedShareIDsToNames allKeys];
    objc_super v11 = [v9 setWithArray:v10];

    [v11 addObjectsFromArray:self->_iworkUnsharedShareIDs];
    id v12 = objc_alloc(MEMORY[0x1E4F1A0A8]);
    id v13 = [v11 allObjects];
    id v14 = (void *)[v12 initWithRecordIDs:v13];

    [v14 setShouldFetchAssetContent:0];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    id v21 = __41__BRCSyncUpOperation_performShareUpdate___block_invoke;
    id v22 = &unk_1E6997338;
    uint64_t v23 = self;
    id v24 = v4;
    [v14 setFetchRecordsCompletionBlock:&v19];
    -[_BRCOperation addSubOperation:](self, "addSubOperation:", v14, v19, v20, v21, v22);
  }
  else
  {
    (*((void (**)(id, BRCSyncUpOperation *, void))v4 + 2))(v4, self, 0);
  }
}

void __41__BRCSyncUpOperation_performShareUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __41__BRCSyncUpOperation_performShareUpdate___block_invoke_2;
    v56[3] = &unk_1E69972E8;
    id v8 = v6;
    id v57 = v8;
    if (objc_msgSend(v8, "brc_checkErrorsFromCloudKit:", v56))
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v9 = brc_bread_crumbs();
      id v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v61 = v8;
        __int16 v62 = 2112;
        v63 = v9;
        _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] got an error while fetching the records and shares %@, but ignoring it%@", buf, 0x16u);
      }
    }
  }
  id v37 = v7;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = [v5 allKeys];
  uint64_t v45 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v45)
  {
    uint64_t v12 = *(void *)v53;
    uint64_t v13 = *MEMORY[0x1E4F19D78];
    uint64_t v39 = *MEMORY[0x1E4F19DD0];
    uint64_t v38 = *MEMORY[0x1E4F593B8];
    id v40 = v5;
    uint64_t v41 = a1;
    uint64_t v42 = *MEMORY[0x1E4F19D78];
    uint64_t v43 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v53 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        id v16 = [v5 objectForKeyedSubscript:v15];
        int v17 = [v16 recordType];
        int v18 = [v17 isEqualToString:v13];

        if (v18)
        {
          id v19 = v11;
          id v20 = v16;
          int v21 = [*(id *)(*(void *)(a1 + 32) + 560) containsObject:v15];
          id v22 = [*(id *)(*(void *)(a1 + 32) + 568) objectForKeyedSubscript:v15];

          if (v21)
          {
            [v20 setPublicPermission:1];
            uint64_t v23 = [v20 participants];
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            uint64_t v24 = [v23 countByEnumeratingWithState:&v48 objects:v58 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v49;
              do
              {
                for (uint64_t j = 0; j != v25; ++j)
                {
                  if (*(void *)v49 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  id v28 = *(void **)(*((void *)&v48 + 1) + 8 * j);
                  if ([v28 type] != 1) {
                    [v20 removeParticipant:v28];
                  }
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v48 objects:v58 count:16];
              }
              while (v25);
              id v5 = v40;
              a1 = v41;
            }
            id v11 = v19;
            uint64_t v12 = v43;
LABEL_28:
          }
          else
          {
            id v11 = v19;
            uint64_t v12 = v43;
            if (v22)
            {
              uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 568) objectForKeyedSubscript:v15];
              __int16 v29 = [v20 objectForKeyedSubscript:v39];
              objc_msgSend(v20, "brc_updateWithLogicalName:isFolder:", v23, objc_msgSend(v29, "isEqualToString:", v38));

              goto LABEL_28;
            }
          }
          [v11 addObject:v20];

          uint64_t v13 = v42;
        }
      }
      uint64_t v45 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
    }
    while (v45);
  }

  if ([v11 count])
  {
    __int16 v30 = brc_bread_crumbs();
    uint64_t v31 = brc_default_log();
    __int16 v32 = v37;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      __41__BRCSyncUpOperation_performShareUpdate___block_invoke_cold_2();
    }

    v33 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:v11 recordIDsToDelete:0];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __41__BRCSyncUpOperation_performShareUpdate___block_invoke_52;
    v46[3] = &unk_1E6997310;
    id v34 = *(id *)(a1 + 40);
    v46[4] = *(void *)(a1 + 32);
    id v47 = v34;
    [v33 setModifyRecordsCompletionBlock:v46];
    [*(id *)(a1 + 32) addSubOperation:v33];
  }
  else
  {
    v35 = brc_bread_crumbs();
    uint64_t v36 = brc_default_log();
    __int16 v32 = v37;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      __41__BRCSyncUpOperation_performShareUpdate___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __41__BRCSyncUpOperation_performShareUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F19C40]])
  {
    if ([v3 code] == 11)
    {

LABEL_6:
      uint64_t v6 = 0;
      goto LABEL_10;
    }
    uint64_t v5 = [v3 code];

    if (v5 == 2) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = 138412546;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Got a permanent error %@ when fetching records and shares%@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v6 = 1;
LABEL_10:

  return v6;
}

uint64_t __41__BRCSyncUpOperation_performShareUpdate___block_invoke_52(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a4);
}

- (void)_performShareUpdateAndModifyRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__BRCSyncUpOperation__performShareUpdateAndModifyRecordsWithCompletion___block_invoke;
  v6[3] = &unk_1E6997388;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BRCSyncUpOperation *)self performShareUpdate:v6];
}

void __72__BRCSyncUpOperation__performShareUpdateAndModifyRecordsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __72__BRCSyncUpOperation__performShareUpdateAndModifyRecordsWithCompletion___block_invoke_2;
    v5[3] = &unk_1E6997360;
    id v4 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    [v4 _performModifyRecordsOrBatchOperationWithCompletion:v5];
  }
}

uint64_t __72__BRCSyncUpOperation__performShareUpdateAndModifyRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __82__BRCSyncUpOperation__scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation__block_invoke;
  v2[3] = &unk_1E6996858;
  v2[4] = self;
  [(BRCSyncUpOperation *)self _performShareUpdateAndModifyRecordsWithCompletion:v2];
}

void __82__BRCSyncUpOperation__scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
LABEL_7:
    [*(id *)(a1 + 32) completedWithResult:v5 error:v6];
    goto LABEL_8;
  }
  if (![*(id *)(*(void *)(a1 + 32) + 648) shouldRecreateServerZoneAfterError:v6])
  {
    id v10 = brc_bread_crumbs();
    int v11 = brc_default_log();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u)) {
      __82__BRCSyncUpOperation__scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation__block_invoke_cold_1();
    }

    goto LABEL_7;
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v7 = [*(id *)(*(void *)(a1 + 32) + 648) clientZone];
  id v8 = [v7 asPrivateClientZone];
  uint64_t v9 = [*(id *)(a1 + 32) group];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__BRCSyncUpOperation__scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation__block_invoke_2;
  v12[3] = &unk_1E69938D0;
  objc_copyWeak(&v13, &location);
  [v8 createCloudKitZoneWithGroup:v9 completion:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
LABEL_8:
}

void __82__BRCSyncUpOperation__scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (v5) {
    [WeakRetained completedWithResult:0 error:v5];
  }
  else {
    [WeakRetained _scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation];
  }
}

- (void)_setSharingFieldsOnContentRecord:(id)a3 withProtectionData:(id)a4 baseToken:(id)a5 routingKey:(id)a6 forceOverwrite:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [v11 recordType];
  char v16 = [v15 isEqualToString:@"content"];

  if (v16)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_19:
    id v28 = brc_bread_crumbs();
    __int16 v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncUpOperation _setSharingFieldsOnContentRecord:withProtectionData:baseToken:routingKey:forceOverwrite:]();
    }

    if (v13) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  uint64_t v26 = brc_bread_crumbs();
  __int16 v27 = brc_default_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
    -[BRCSyncUpOperation _setSharingFieldsOnContentRecord:withProtectionData:baseToken:routingKey:forceOverwrite:]();
  }

  if (!v12) {
    goto LABEL_19;
  }
LABEL_3:
  uint64_t v17 = [v11 mutableEncryptedPublicSharingKeyData];
  if (v17)
  {
    int v18 = (void *)v17;
    id v19 = [v11 mutableEncryptedPublicSharingKeyData];
    char v20 = [v19 isEqualToData:v12];

    if ((v20 & 1) == 0)
    {
      int v21 = brc_bread_crumbs();
      id v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        uint64_t v25 = [v11 mutableEncryptedPublicSharingKeyData];
        int v30 = 138412802;
        id v31 = v12;
        __int16 v32 = 2112;
        id v33 = v25;
        __int16 v34 = 2112;
        id v35 = v21;
        _os_log_fault_impl(&dword_1D353B000, v22, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Protection data mismatch between share and record being shared! (%@ vs %@)%@", (uint8_t *)&v30, 0x20u);
      }
      if (v7) {
        [v11 setMutableEncryptedPublicSharingKeyData:v12];
      }
    }
  }
  if (v13) {
LABEL_10:
  }
    [v11 setBaseToken:v13];
LABEL_11:
  if (v14) {
    [v11 setRoutingKey:v14];
  }
  uint64_t v23 = brc_bread_crumbs();
  uint64_t v24 = brc_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    int v30 = 138413314;
    id v31 = v11;
    __int16 v32 = 2112;
    id v33 = v12;
    __int16 v34 = 2112;
    id v35 = v13;
    __int16 v36 = 2112;
    id v37 = v14;
    __int16 v38 = 2112;
    uint64_t v39 = v23;
    _os_log_debug_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] updated content record %@ with protectionData %@ baseToken %@ routingKey %@%@", (uint8_t *)&v30, 0x34u);
  }
}

- (BOOL)_recordIsIWorkShareable:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"extension"];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F59560] iWorkShareableExtensions];
    id v6 = [v3 objectForKeyedSubscript:@"extension"];
    BOOL v7 = [v6 lowercaseString];
    char v8 = [v5 containsObject:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)_performUpdateSharingProtectionDataIfNecessary:(id)a3
{
  v34[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableArray *)self->_recordsNeedingUpdatedSharingProtectionInfo count])
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v25 = v4;
    if ([(NSMutableArray *)self->_recordsNeedingUpdatedSharingProtectionInfo count])
    {
      unint64_t v5 = 0;
      do
      {
        id v6 = [(NSMutableArray *)self->_recordsNeedingUpdatedSharingProtectionInfo objectAtIndexedSubscript:v5];
        id v7 = objc_alloc(MEMORY[0x1E4F1A2F8]);
        char v8 = [v6 recordID];
        uint64_t v9 = (void *)[v7 initShareIDWithRecordID:v8 serverZone:self->_serverZone];

        [v26 addObject:v9];
        id v10 = [v6 recordType];
        int v11 = [v10 isEqualToString:@"content"];

        if (v11)
        {
          id v12 = [v6 recordID];
          [v26 addObject:v12];
          goto LABEL_6;
        }
        while (++v5 < [(NSMutableArray *)self->_recordsNeedingUpdatedSharingProtectionInfo count])
        {
          id v12 = [(NSMutableArray *)self->_recordsNeedingUpdatedSharingProtectionInfo objectAtIndexedSubscript:v5];
          id v13 = objc_alloc(MEMORY[0x1E4F1A2F8]);
          id v14 = [v6 recordID];
          uint64_t v15 = (void *)[v13 initShareIDWithRecordID:v14 serverZone:self->_serverZone];

          if (([v15 isEqual:v9] & 1) == 0)
          {

            break;
          }
          char v16 = [v12 recordType];
          int v17 = [v16 isEqualToString:@"content"];

          if (v17)
          {
            int v18 = [v12 recordID];
            [v26 addObject:v18];
          }
LABEL_6:
        }
      }
      while (v5 < [(NSMutableArray *)self->_recordsNeedingUpdatedSharingProtectionInfo count]);
    }
    id v19 = [(BRCSyncContext *)self->super._syncContext ckContainer];
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__23;
    v32[4] = __Block_byref_object_dispose__23;
    id v33 = 0;
    char v20 = (void *)[objc_alloc(MEMORY[0x1E4F1A0A8]) initWithRecordIDs:v26];
    [v20 setShouldFetchAssetContent:0];
    uint64_t v21 = *MEMORY[0x1E4F19E08];
    v34[0] = *MEMORY[0x1E4F19DF0];
    v34[1] = v21;
    uint64_t v22 = *MEMORY[0x1E4F19DF8];
    v34[2] = *MEMORY[0x1E4F19E00];
    v34[3] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
    [v20 setDesiredKeys:v23];

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke;
    v31[3] = &unk_1E69973B0;
    v31[4] = self;
    v31[5] = v32;
    [v20 setPerRecordCompletionBlock:v31];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_59;
    v27[3] = &unk_1E6997400;
    int v30 = v32;
    id v29 = v25;
    v27[4] = self;
    id v24 = v19;
    id v28 = v24;
    [v20 setFetchRecordsCompletionBlock:v27];
    [(_BRCOperation *)self addSubOperation:v20];

    id v4 = v25;
    _Block_object_dispose(v32, 8);
  }
  else
  {
    (*((void (**)(id, BRCSyncUpOperation *, void))v4 + 2))(v4, self, 0);
  }
}

void __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v9 && (objc_msgSend(v9, "brc_isCloudKitUnknownItemError") & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
  int v11 = [v7 recordType];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F19D78]];

  if (v12)
  {
    id v13 = v7;
    id v14 = [v13 publicSharingIdentity];

    if (!v14)
    {
      long long v50 = brc_bread_crumbs();
      long long v51 = brc_default_log();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
        __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_cold_1();
      }
    }
    id v15 = [v13 publicSharingIdentity];
    id v61 = [v13 routingKey];
    char v16 = [v13 baseToken];

    v68 = objc_msgSend(v8, "brc_shareItemID");
    BOOL v57 = 0;
    uint64_t v64 = 0;
    int v17 = 0;
    if (!v15) {
      goto LABEL_57;
    }
LABEL_27:
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    obuint64_t j = *(id *)(*(void *)(a1 + 32) + 584);
    uint64_t v67 = [obj countByEnumeratingWithState:&v69 objects:v73 count:16];
    if (!v67) {
      goto LABEL_56;
    }
    __int16 v62 = v17;
    long long v53 = v10;
    id v54 = v8;
    id v55 = v7;
    LOBYTE(v35) = 0;
    uint64_t v66 = *(void *)v70;
    uint64_t v36 = *MEMORY[0x1E4F19E08];
    uint64_t v60 = *MEMORY[0x1E4F19DF0];
    uint64_t v59 = *MEMORY[0x1E4F19E00];
    uint64_t v58 = *MEMORY[0x1E4F19DF8];
    *(void *)&long long v34 = 138412802;
    long long v52 = v34;
    uint64_t v65 = *MEMORY[0x1E4F19E08];
    v56 = v16;
    while (1)
    {
      for (uint64_t i = 0; i != v67; ++i)
      {
        char v38 = v35;
        if (*(void *)v70 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        uint64_t v40 = objc_msgSend(v39, "recordID", v52);
        uint64_t v41 = [*(id *)(*(void *)(a1 + 32) + 248) session];
        uint64_t v42 = [v40 brc_itemIDWithSession:v41];

        int v35 = [v68 isEqualToItemID:v42];
        if (v35)
        {
          if ([*(id *)(a1 + 32) _recordIsIWorkShareable:v39])
          {
            uint64_t v43 = a1;
            char v44 = [v39 encryptedValues];
            uint64_t v45 = [v44 objectForKeyedSubscript:v36];

            if (!v45)
            {
              v46 = [v39 encryptedValues];
              [v46 setObject:v15 forKeyedSubscript:v36];
              goto LABEL_42;
            }
            if (([v15 isEqualToData:v45] & 1) == 0)
            {
              v46 = brc_bread_crumbs();
              id v47 = brc_default_log();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = v52;
                id v75 = v45;
                __int16 v76 = 2112;
                id v77 = v15;
                __int16 v78 = 2112;
                id v79 = v46;
                _os_log_fault_impl(&dword_1D353B000, v47, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: protection data mismatch! ignoring content records version (%@ to %@)%@", buf, 0x20u);
              }

LABEL_42:
            }

            a1 = v43;
            char v16 = v56;
          }
          if (v16) {
            [v39 setObject:v16 forKeyedSubscript:v60];
          }
          if (v62) {
            [v39 setObject:v62 forKeyedSubscript:v59];
          }
          if (v64) {
            [v39 setObject:v64 forKeyedSubscript:v58];
          }
          long long v48 = [v39 recordType];
          int v49 = [v48 isEqualToString:@"content"];

          if (v49) {
            [*(id *)(a1 + 32) _setSharingFieldsOnContentRecord:v39 withProtectionData:v15 baseToken:v16 routingKey:v61 forceOverwrite:v57];
          }
          goto LABEL_52;
        }
        if (v38)
        {

          id v8 = v54;
          id v7 = v55;
          id v10 = v53;
          int v17 = v62;
          goto LABEL_55;
        }
LABEL_52:

        uint64_t v36 = v65;
      }
      uint64_t v67 = [obj countByEnumeratingWithState:&v69 objects:v73 count:16];
      if (!v67)
      {
        id v8 = v54;
        id v7 = v55;
        id v10 = v53;
        int v17 = v62;
        goto LABEL_56;
      }
    }
  }
  int v18 = [v7 recordType];
  int v19 = [v18 isEqualToString:@"content"];

  if (v19)
  {
    char v20 = [v7 mutableEncryptedPublicSharingKeyData];
    uint64_t v21 = v20;
    uint64_t v22 = (uint64_t *)MEMORY[0x1E4F19E08];
    if (v20)
    {
      id v15 = v20;
      uint64_t v23 = *v22;
    }
    else
    {
      id v24 = [v7 encryptedValues];
      uint64_t v23 = *v22;
      id v15 = [v24 objectForKeyedSubscript:v23];
    }
    uint64_t v25 = [v7 mutableEncryptedPublicSharingKeyData];
    BOOL v57 = v25 != 0;

    id v26 = [v7 encryptedValues];
    __int16 v27 = [v26 objectForKeyedSubscript:v23];

    if (v27)
    {
      if ([v27 isEqualToData:v15])
      {
        [*(id *)(a1 + 32) _recordIsIWorkShareable:v7];
        goto LABEL_23;
      }
      id v28 = brc_bread_crumbs();
      id v29 = brc_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138413058;
        id v75 = v15;
        __int16 v76 = 2112;
        id v77 = v27;
        __int16 v78 = 2112;
        id v79 = v7;
        __int16 v80 = 2112;
        v81 = v28;
        _os_log_fault_impl(&dword_1D353B000, v29, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: protection data mismatch between content public sharing identity and web sharing data (%@ vs %@) for %@%@", buf, 0x2Au);
      }
    }
    else
    {
      if (![*(id *)(a1 + 32) _recordIsIWorkShareable:v7]) {
        goto LABEL_23;
      }
      id v28 = brc_bread_crumbs();
      id v29 = brc_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_cold_2();
      }
    }

LABEL_23:
    id v61 = [v7 routingKey];
    int v30 = [v7 baseToken];
    id v31 = v30;
    if (v30)
    {
      id v32 = v30;
    }
    else
    {
      id v32 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F19DF0]];
    }
    char v16 = v32;

    id v33 = [*(id *)(*(void *)(a1 + 32) + 248) session];
    v68 = objc_msgSend(v8, "brc_itemIDWithSession:", v33);

    int v17 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F19E00]];
    uint64_t v64 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F19DF8]];

    if (!v15)
    {
LABEL_57:

      goto LABEL_58;
    }
    goto LABEL_27;
  }
  if (v7)
  {
    brc_bread_crumbs();
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v40 = brc_default_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
      __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_cold_3();
    }
    id v15 = 0;
    id v61 = 0;
    char v16 = 0;
    v68 = 0;
    int v17 = 0;
    uint64_t v64 = 0;
LABEL_55:

LABEL_56:
    goto LABEL_57;
  }
  id v15 = 0;
  id v61 = 0;
  char v16 = 0;
  v68 = 0;
  int v17 = 0;

LABEL_58:
}

void __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v27 = a2;
  id v28 = a3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    dispatch_group_t v5 = dispatch_group_create();
    unint64_t v6 = 0;
    uint64_t v35 = 0;
    uint64_t v36 = &v35;
    uint64_t v37 = 0x2020000000;
    uint64_t v38 = 0;
    uint64_t v7 = *MEMORY[0x1E4F19E08];
    uint64_t v8 = *MEMORY[0x1E4F59368];
    *(void *)&long long v9 = 138412290;
    long long v26 = v9;
    while (1)
    {
      if (v6 >= objc_msgSend(*(id *)(*(void *)(a1 + 32) + 584), "count", v26))
      {
        _Block_object_dispose(&v35, 8);
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        goto LABEL_18;
      }
      id v10 = [*(id *)(*(void *)(a1 + 32) + 584) objectAtIndexedSubscript:v36[3]];
      int v11 = [v10 encryptedValues];
      int v12 = [v11 objectForKeyedSubscript:v7];
      if (v12)
      {
      }
      else
      {
        int v13 = [*(id *)(a1 + 32) _recordIsIWorkShareable:v10];

        if (!v13) {
          goto LABEL_16;
        }
        id v14 = brc_bread_crumbs();
        id v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v40 = v10;
          __int16 v41 = 2112;
          uint64_t v42 = v14;
          _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] record %@ still needs web sharing protection data%@", buf, 0x16u);
        }

        dispatch_group_enter(v5);
        char v16 = *(void **)(a1 + 40);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_60;
        v29[3] = &unk_1E69973D8;
        uint64_t v33 = *(void *)(a1 + 56);
        id v17 = v10;
        uint64_t v18 = *(void *)(a1 + 32);
        id v30 = v17;
        uint64_t v31 = v18;
        long long v34 = &v35;
        int v19 = v5;
        id v32 = v19;
        [v16 getNewWebSharingIdentityDataWithCompletionHandler:v29];
        dispatch_time_t v20 = dispatch_time(0, 10000000000);
        if (dispatch_group_wait(v19, v20))
        {
          uint64_t v21 = brc_bread_crumbs();
          uint64_t v22 = brc_default_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v26;
            uint64_t v40 = v21;
            _os_log_fault_impl(&dword_1D353B000, v22, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Timed out while waiting for new web-sharing identity%@", buf, 0xCu);
          }

          uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", v8, 15, @"unreachable: Timed out while waiting for new web-sharing identity");
          uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v25 = *(void **)(v24 + 40);
          *(void *)(v24 + 40) = v23;
        }
        int v11 = v30;
      }

LABEL_16:
      unint64_t v6 = v36[3] + 1;
      v36[3] = v6;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_18:
}

void __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_60_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  long long v9 = [*(id *)(a1 + 32) encryptedValues];
  uint64_t v10 = *MEMORY[0x1E4F19E08];
  [v9 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F19E08]];

  id v11 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  int v12 = [*(id *)(a1 + 32) recordID];
  int v13 = (void *)[v11 initShareIDWithRecordID:v12 serverZone:*(void *)(*(void *)(a1 + 40) + 648)];

  for (unint64_t i = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) + 1;
        i < [*(id *)(*(void *)(a1 + 40) + 584) count];
        ++i)
  {
    id v15 = [*(id *)(*(void *)(a1 + 40) + 584) objectAtIndexedSubscript:i];
    id v16 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    id v17 = [v15 recordID];
    uint64_t v18 = (void *)[v16 initShareIDWithRecordID:v17 serverZone:*(void *)(*(void *)(a1 + 40) + 648)];

    if (![v18 isEqual:v13])
    {

      break;
    }
    int v19 = [v15 encryptedValues];
    [v19 setObject:v5 forKeyedSubscript:v10];

    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = i;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)main
{
  [(BRCSyncUpOperation *)self hash];
  kdebug_trace();
  id v3 = [(BRCSyncContext *)self->super._syncContext ckContainer];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__BRCSyncUpOperation_main__block_invoke;
  v5[3] = &unk_1E6997450;
  void v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [(BRCSyncUpOperation *)self _performUpdateSharingProtectionDataIfNecessary:v5];
}

void __26__BRCSyncUpOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = (id *)(a1 + 32);
  id v4 = *(id **)(a1 + 32);
  if (a3)
  {
    [v4 completedWithResult:0 error:a3];
    return;
  }
  if (([v4[72] count] & 1) == 0 && objc_msgSend(*((id *)*v5 + 72), "count"))
  {
    id v6 = dispatch_group_create();
    if ([*((id *)*v5 + 72) count])
    {
      unint64_t v7 = 0;
      do
      {
        dispatch_group_enter(v6);
        uint64_t v8 = *(void *)(a1 + 32);
        long long v9 = *(void **)(a1 + 40);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __26__BRCSyncUpOperation_main__block_invoke_2;
        v17[3] = &unk_1E6997428;
        v17[4] = v8;
        unint64_t v19 = v7;
        uint64_t v18 = v6;
        [v9 getNewWebSharingIdentityDataWithCompletionHandler:v17];

        v7 += 2;
      }
      while (v7 < [*(id *)(*(void *)(a1 + 32) + 576) count]);
    }
    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
LABEL_15:

    goto LABEL_16;
  }
  if ([*((id *)*v5 + 72) count])
  {
    id v6 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __26__BRCSyncUpOperation_main__block_invoke_cold_2();
    }

    goto LABEL_15;
  }
LABEL_16:
  id v11 = brc_bread_crumbs();
  int v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __26__BRCSyncUpOperation_main__block_invoke_cold_1();
  }

  if ([*((id *)*v5 + 81) isPrivateZone]
    && ([*((id *)*v5 + 81) hasFetchedServerZoneState] & 1) == 0)
  {
    int v13 = [*((id *)*v5 + 81) clientZone];
    id v14 = [v13 asPrivateClientZone];
    id v15 = [*v5 group];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __26__BRCSyncUpOperation_main__block_invoke_67;
    v16[3] = &unk_1E69939E8;
    v16[4] = *v5;
    [v14 createCloudKitZoneWithGroup:v15 completion:v16];
  }
  else
  {
    [*v5 _scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation];
  }
}

void __26__BRCSyncUpOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 576) objectAtIndexedSubscript:*(void *)(a1 + 48)];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 576) objectAtIndexedSubscript:*(void *)(a1 + 48) + 1];
  long long v9 = [v7 recordID];
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 648) session];
  id v11 = objc_msgSend(v9, "brc_itemIDWithSession:", v10);

  int v12 = [v8 recordID];
  int v13 = [*(id *)(*(void *)(a1 + 32) + 648) session];
  id v14 = objc_msgSend(v12, "brc_itemIDWithSession:", v13);

  if (v5 && !v6 && ([v11 isEqualToItemID:v14] & 1) != 0)
  {
    id v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __26__BRCSyncUpOperation_main__block_invoke_2_cold_1();
    }

    id v17 = [v7 encryptedValues];
    uint64_t v18 = *MEMORY[0x1E4F19E08];
    [v17 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F19E08]];

    unint64_t v19 = [v8 encryptedValues];
    [v19 setObject:v5 forKeyedSubscript:v18];
    goto LABEL_12;
  }
  if (([v11 isEqual:v14] & 1) == 0)
  {
    uint64_t v22 = brc_bread_crumbs();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      __26__BRCSyncUpOperation_main__block_invoke_2_cold_3();
    }

    if (v6) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
  if (!v6)
  {
LABEL_16:
    uint64_t v24 = brc_bread_crumbs();
    uint64_t v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      __26__BRCSyncUpOperation_main__block_invoke_2_cold_2();
    }
  }
LABEL_9:
  unint64_t v19 = brc_bread_crumbs();
  dispatch_time_t v20 = brc_default_log();
  if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
  {
    uint64_t v21 = [v7 recordID];
    int v26 = 138412802;
    id v27 = v21;
    __int16 v28 = 2112;
    id v29 = v6;
    __int16 v30 = 2112;
    uint64_t v31 = v19;
    _os_log_error_impl(&dword_1D353B000, v20, (os_log_type_t)0x90u, "[ERROR] Failed getting web sharing identity for %@ - %@%@", (uint8_t *)&v26, 0x20u);
  }
LABEL_12:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __26__BRCSyncUpOperation_main__block_invoke_67(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 completedWithResult:0 error:a2];
  }
  else {
    return [v2 _scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation];
  }
}

- (NSMutableArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setRecordsToSave:(id)a3
{
}

- (NSMutableArray)packagesInFlight
{
  return self->_packagesInFlight;
}

- (void)setPackagesInFlight:(id)a3
{
}

- (NSMutableArray)createdAppLibraryNames
{
  return self->_createdAppLibraryNames;
}

- (NSMutableOrderedSet)deletedRecordIDs
{
  return self->_deletedRecordIDs;
}

- (void)setDeletedRecordIDs:(id)a3
{
}

- (NSMutableArray)iworkUnsharedShareIDs
{
  return self->_iworkUnsharedShareIDs;
}

- (void)setIworkUnsharedShareIDs:(id)a3
{
}

- (NSMutableDictionary)renamedShareIDsToNames
{
  return self->_renamedShareIDsToNames;
}

- (void)setRenamedShareIDsToNames:(id)a3
{
}

- (NSMutableArray)recordsNeedingNewSharingProtectionInfo
{
  return self->_recordsNeedingNewSharingProtectionInfo;
}

- (void)setRecordsNeedingNewSharingProtectionInfo:(id)a3
{
}

- (NSMutableArray)recordsNeedingUpdatedSharingProtectionInfo
{
  return self->_recordsNeedingUpdatedSharingProtectionInfo;
}

- (void)setRecordsNeedingUpdatedSharingProtectionInfo:(id)a3
{
}

- (NSMutableDictionary)recordIDsToDeleteToEtags
{
  return self->_recordIDsToDeleteToEtags;
}

- (void)setRecordIDsToDeleteToEtags:(id)a3
{
}

- (NSMutableDictionary)pluginFieldsForRecordDeletesByID
{
  return self->_pluginFieldsForRecordDeletesByID;
}

- (void)setPluginFieldsForRecordDeletesByID:(id)a3
{
}

- (BRCLocalItem)itemNeedingPCSChaining
{
  return self->_itemNeedingPCSChaining;
}

- (void)setItemNeedingPCSChaining:(id)a3
{
}

- (BRCDirectoryItem)itemNeedingBasehashSalting
{
  return self->_itemNeedingBasehashSalting;
}

- (void)setItemNeedingBasehashSalting:(id)a3
{
}

- (NSMutableDictionary)conflictLosersToResolveByRecordID
{
  return self->_conflictLosersToResolveByRecordID;
}

- (void)setConflictLosersToResolveByRecordID:(id)a3
{
}

- (NSString)stageID
{
  return self->_stageID;
}

- (void)setStageID:(id)a3
{
}

- (id)syncUpCompletionBlock
{
  return self->_syncUpCompletionBlock;
}

- (void)setSyncUpCompletionBlock:(id)a3
{
}

- (float)cost
{
  return self->_cost;
}

- (BRCServerZone)serverZone
{
  return self->_serverZone;
}

- (void)setServerZone:(id)a3
{
}

- (BOOL)encounteredErrorOnPCSChainedItem
{
  return self->_encounteredErrorOnPCSChainedItem;
}

- (BOOL)throttledItemInBatch
{
  return self->_throttledItemInBatch;
}

- (void)setThrottledItemInBatch:(BOOL)a3
{
  self->_throttledItemInBatch = a3;
}

- (BRCSyncUpCallbackProtocol)syncUpCallback
{
  return self->_syncUpCallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong(&self->_syncUpCompletionBlock, 0);
  objc_storeStrong((id *)&self->_stageID, 0);
  objc_storeStrong((id *)&self->_conflictLosersToResolveByRecordID, 0);
  objc_storeStrong((id *)&self->_itemNeedingBasehashSalting, 0);
  objc_storeStrong((id *)&self->_itemNeedingPCSChaining, 0);
  objc_storeStrong((id *)&self->_pluginFieldsForRecordDeletesByID, 0);
  objc_storeStrong((id *)&self->_recordIDsToDeleteToEtags, 0);
  objc_storeStrong((id *)&self->_recordsNeedingUpdatedSharingProtectionInfo, 0);
  objc_storeStrong((id *)&self->_recordsNeedingNewSharingProtectionInfo, 0);
  objc_storeStrong((id *)&self->_renamedShareIDsToNames, 0);
  objc_storeStrong((id *)&self->_iworkUnsharedShareIDs, 0);
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_createdAppLibraryNames, 0);
  objc_storeStrong((id *)&self->_packagesInFlight, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong((id *)&self->_syncUpCallback, 0);
}

- (void)prepareWithMaxCost:retryAfter:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Can't prepare sync for a zone that is blocked%@", v2, v3, v4, v5, v6);
}

- (void)prepareWithMaxCost:retryAfter:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: items.count == 0%@", v2, v3, v4, v5, v6);
}

- (void)prepareWithMaxCost:retryAfter:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] no record needs syncing at the moment.%@", v2, v3, v4, v5, v6);
}

- (void)prepareWithMaxCost:retryAfter:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Because this is our first time syncing up, adding %@%@");
}

- (void)prepareWithMaxCost:retryAfter:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] destroying shares instead of unsharing%@", v2, v3, v4, v5, v6);
}

- (void)prepareWithMaxCost:retryAfter:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Avoid syncing up a pristine zone%@", v2, v3, v4, v5, v6);
}

- (void)prepareWithMaxCost:retryAfter:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] %@ is not pristine and needs sync%@");
}

void __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_26_cold_1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*v1 defaultClientZone];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] Scheduling sync down for zone %@%@", v4);
}

void __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_26_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Postponing sync up for item %@%@");
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Uploaded an iWork package of size 0 (itemID: %@)%@");
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Unable to open iwork package %@%@");
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_37_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Forcing item dead in the server truth to re-upload as a rejected item - %@%@");
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_37_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Forcing sync up of dead parent %@%@");
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_37_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Blocking %@ from sync up until it is next modified because the server failed with a permanent error%@");
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_37_cold_4()
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*v1 recordID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] ignoring error for %@ because an other item in the batch failed%@", v4);
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_37_cold_5()
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*v1 recordID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] skipping throttling item %@ even though it caused the failure%@", v4);
}

- (void)performShareUpdate:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.serverZone.isPrivateZone%@", v2, v3, v4, v5, v6);
}

void __41__BRCSyncUpOperation_performShareUpdate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] No shares need saving%@", v2, v3, v4, v5, v6);
}

void __41__BRCSyncUpOperation_performShareUpdate___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Saving shares %@ shared by us for unshare and rename%@");
}

void __82__BRCSyncUpOperation__scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] send metadata error: %@%@");
}

- (void)_setSharingFieldsOnContentRecord:withProtectionData:baseToken:routingKey:forceOverwrite:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: protectionData%@", v2, v3, v4, v5, v6);
}

- (void)_setSharingFieldsOnContentRecord:withProtectionData:baseToken:routingKey:forceOverwrite:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [contentRecord.recordType isEqualToString:kBRRecordTypeContent]%@", v2, v3, v4, v5, v6);
}

void __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: share.publicSharingIdentity%@", v2, v3, v4, v5, v6);
}

void __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: content record is missing protection data %@%@");
}

void __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !fetchedRecord%@", v2, v3, v4, v5, v6);
}

void __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_60_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Failed to get new web sharing identity: %@%@");
}

void __26__BRCSyncUpOperation_main__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)v2 + 504);
  uint64_t v4 = [*(id *)(*(void *)v2 + 648) clientZone];
  int v5 = 134218498;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v1;
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: sending requestID:%lld for container %@%@", (uint8_t *)&v5, 0x20u);
}

void __26__BRCSyncUpOperation_main__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: invalid sharing records count%@", v2, v3, v4, v5, v6);
}

void __26__BRCSyncUpOperation_main__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 recordID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] got web sharing identity for %@%@", v4);
}

void __26__BRCSyncUpOperation_main__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: error%@", v2, v3, v4, v5, v6);
}

void __26__BRCSyncUpOperation_main__block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [firstItemID isEqual:secondItemID]%@", v2, v3, v4, v5, v6);
}

@end