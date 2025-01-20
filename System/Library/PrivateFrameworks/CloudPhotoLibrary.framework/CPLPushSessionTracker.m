@interface CPLPushSessionTracker
+ (BOOL)notifyClientOfStore:(id)a3 ofStatusChanges:(id)a4 error:(id *)a5;
- (BOOL)applyHasBeenSuccessful;
- (BOOL)checkScopeIdentifier:(id)a3;
- (BOOL)computeDiff;
- (BOOL)computeExpandedBatchWithError:(id *)a3;
- (BOOL)diffHasBeenSuccessful;
- (BOOL)diffedBatchCanLowerQuota;
- (BOOL)expandHasBeenSuccessful;
- (BOOL)hasClientRecordWithLocalScopedIdentifier:(id)a3;
- (BOOL)hasCloudRecordWithLocalScopedIdentifier:(id)a3;
- (BOOL)hasPushChangeTasks;
- (BOOL)knowsClientRecordWithScopedIdentifier:(id)a3;
- (BOOL)notifyClientOfStatusChangesIfNecessaryWithError:(id *)a3;
- (BOOL)shouldCancelSyncSessionTryingToUploadChange:(id)a3;
- (CPLChangeBatch)diffedBatch;
- (CPLChangeBatch)expandedBatch;
- (CPLChangeBatch)incomingBatch;
- (CPLEngineStore)store;
- (CPLPushChangeTasks)pushChangeTasks;
- (CPLPushSessionTracker)initWithIncomingBatch:(id)a3 store:(id)a4 error:(id *)a5;
- (NSArray)addedRecords;
- (NSArray)deletedRecordScopedIdentifiers;
- (NSArray)revertedChanges;
- (NSArray)updatedRecords;
- (NSDate)now;
- (NSDictionary)recordWithStatusChangesToNotify;
- (NSDictionary)resourcesToUpload;
- (NSSet)unquarantinedRecordScopedIdentifiers;
- (id)_realChangeFromChange:(id)a3 comparedToStoredRecord:(id)a4 changeType:(unint64_t)a5;
- (id)_resourceIdentitiesFromChange:(id)a3;
- (id)deletedRecordIdentifiers;
- (id)enqueuedOrStoredRecordWithLocalScopedIdentifier:(id)a3;
- (id)resourceIdentitiesForRecordWithLocalScopedIdentifier:(id)a3;
- (id)storedClientRecordWithLocalScopedIdentifier:(id)a3;
- (id)storedCloudRecordWithLocalScopedIdentifier:(id)a3;
- (unint64_t)ignoredRecordCount;
- (void)acknowledgeNewClientRecord:(id)a3 withScopedIdentifier:(id)a4;
- (void)enumerateDiffWithBlock:(id)a3;
- (void)setNow:(id)a3;
@end

@implementation CPLPushSessionTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_revertedChanges, 0);
  objc_storeStrong((id *)&self->_diffedBatch, 0);
  objc_storeStrong((id *)&self->_pushChangeTasks, 0);
  objc_storeStrong((id *)&self->_expandedBatch, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_incomingBatch, 0);
  objc_storeStrong((id *)&self->_invalidScopeIdentifiers, 0);
  objc_storeStrong((id *)&self->_validScopeIdentifiers, 0);
  objc_storeStrong((id *)&self->_recordWithStatusChangesToNotify, 0);
  objc_storeStrong((id *)&self->_resourcesToUpload, 0);
  objc_storeStrong((id *)&self->_fullRecords, 0);
  objc_storeStrong((id *)&self->_changesWithResourceChanges, 0);
  objc_storeStrong((id *)&self->_deletedRecordScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_updatedRecords, 0);
  objc_storeStrong((id *)&self->_addedRecords, 0);
  objc_storeStrong((id *)&self->_storedCloudRecords, 0);
  objc_storeStrong((id *)&self->_storedClientRecords, 0);
  objc_storeStrong((id *)&self->_incomingBatchRecordPerScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_unquarantinedRecordScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_idMapping, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
}

- (BOOL)applyHasBeenSuccessful
{
  return self->_applyHasBeenSuccessful;
}

- (BOOL)diffHasBeenSuccessful
{
  return self->_diffHasBeenSuccessful;
}

- (BOOL)expandHasBeenSuccessful
{
  return self->_expandHasBeenSuccessful;
}

- (void)setNow:(id)a3
{
}

- (NSDate)now
{
  return self->_now;
}

- (BOOL)diffedBatchCanLowerQuota
{
  return self->_diffedBatchCanLowerQuota;
}

- (unint64_t)ignoredRecordCount
{
  return self->_ignoredRecordCount;
}

- (NSArray)revertedChanges
{
  return self->_revertedChanges;
}

- (NSDictionary)recordWithStatusChangesToNotify
{
  return &self->_recordWithStatusChangesToNotify->super;
}

- (CPLChangeBatch)diffedBatch
{
  return self->_diffedBatch;
}

- (CPLPushChangeTasks)pushChangeTasks
{
  return self->_pushChangeTasks;
}

- (NSSet)unquarantinedRecordScopedIdentifiers
{
  return &self->_unquarantinedRecordScopedIdentifiers->super;
}

- (CPLChangeBatch)expandedBatch
{
  return self->_expandedBatch;
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (CPLChangeBatch)incomingBatch
{
  return self->_incomingBatch;
}

- (BOOL)shouldCancelSyncSessionTryingToUploadChange:(id)a3
{
  id v4 = a3;
  v5 = [v4 scopedIdentifier];
  if ([(NSMutableArray *)self->_changesWithResourceChanges containsObject:v5]
    && [v4 supportsResources]
    && [v4 hasChangeType:8])
  {
    v6 = [v4 resources];
    BOOL v7 = [v6 count] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)notifyClientOfStatusChangesIfNecessaryWithError:(id *)a3
{
  if ([(CPLChangeBatch *)self->_diffedBatch count] || !self->_recordWithStatusChangesToNotify) {
    return 1;
  }
  v6 = objc_opt_class();
  store = self->_store;
  recordWithStatusChangesToNotify = self->_recordWithStatusChangesToNotify;
  return [v6 notifyClientOfStore:store ofStatusChanges:recordWithStatusChangesToNotify error:a3];
}

- (NSDictionary)resourcesToUpload
{
  return (NSDictionary *)self->_resourcesToUpload;
}

- (id)deletedRecordIdentifiers
{
  v2 = [(CPLPushSessionTracker *)self deletedRecordScopedIdentifiers];
  v3 = +[CPLScopedIdentifier unscopedIdentifiersFromArrayOfScopedIdentifiers:v2];

  return v3;
}

- (NSArray)deletedRecordScopedIdentifiers
{
  return (NSArray *)self->_deletedRecordScopedIdentifiers;
}

- (NSArray)updatedRecords
{
  return (NSArray *)self->_updatedRecords;
}

- (NSArray)addedRecords
{
  return (NSArray *)self->_addedRecords;
}

- (void)enumerateDiffWithBlock:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obj = self->_diffedBatch;
  uint64_t v5 = [(CPLChangeBatch *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v21 = *(void *)v24;
    BOOL v7 = v4 + 16;
    v18 = self;
    v19 = v4;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v24 != v21) {
        objc_enumerationMutation(obj);
      }
      v9 = *(void **)(*((void *)&v23 + 1) + 8 * v8);
      unsigned __int8 v22 = 0;
      v10 = [v9 scopedIdentifier];
      v11 = [(NSMutableDictionary *)self->_fullRecords objectForKeyedSubscript:v10];
      id v12 = v9;
      if (([v12 hasChangeType:2] & 1) == 0)
      {
        v13 = v7;
        uint64_t v14 = [v11 relatedIdentifier];
        uint64_t v15 = [v11 secondaryIdentifier];
        if (v14 | v15)
        {
          v16 = (void *)[v12 copy];

          [v16 setRelatedIdentifier:v14];
          [v16 setSecondaryIdentifier:v15];
          id v12 = v16;
          self = v18;
          id v4 = v19;
        }

        BOOL v7 = v13;
      }
      v17 = [(NSMutableDictionary *)self->_resourcesToUpload objectForKeyedSubscript:v10];
      (*((void (**)(char *, id, void *, unsigned __int8 *))v4 + 2))(v4, v12, v17, &v22);

      LODWORD(v17) = v22;
      if (v17) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [(CPLChangeBatch *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)computeDiff
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  if (!self->_expandHasBeenSuccessful)
  {
    if (!_CPLSilentLogging)
    {
      v99 = __CPLSessionOSLogDomain_15527();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        v100 = NSStringFromSelector(a2);
        LODWORD(v163) = 138412290;
        *(void *)((char *)&v163 + 4) = v100;
        _os_log_impl(&dword_1B4CAC000, v99, OS_LOG_TYPE_ERROR, "%@ called before expansion", (uint8_t *)&v163, 0xCu);
      }
    }
    v101 = [MEMORY[0x1E4F28B00] currentHandler];
    v102 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPushSessionTracker.m"];
    v103 = NSStringFromSelector(a2);
    [v101 handleFailureInMethod:a2, self, v102, 842, @"%@ called before expansion", v103 object file lineNumber description];

    abort();
  }
  if (self->_diffHasBeenSuccessful)
  {
    if (!_CPLSilentLogging)
    {
      v104 = __CPLSessionOSLogDomain_15527();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      {
        v105 = NSStringFromSelector(a2);
        LODWORD(v163) = 138412290;
        *(void *)((char *)&v163 + 4) = v105;
        _os_log_impl(&dword_1B4CAC000, v104, OS_LOG_TYPE_ERROR, "%@ called twice", (uint8_t *)&v163, 0xCu);
      }
    }
    v106 = [MEMORY[0x1E4F28B00] currentHandler];
    v107 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPushSessionTracker.m"];
    v108 = NSStringFromSelector(a2);
    [v106 handleFailureInMethod:a2, self, v107, 843, @"%@ called twice", v108 object file lineNumber description];

    abort();
  }
  v3 = objc_alloc_init(CPLChangeBatch);
  diffedBatch = self->_diffedBatch;
  self->_diffedBatch = v3;

  uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  addedRecords = self->_addedRecords;
  self->_addedRecords = v5;

  BOOL v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  updatedRecords = self->_updatedRecords;
  self->_updatedRecords = v7;

  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  deletedRecordScopedIdentifiers = self->_deletedRecordScopedIdentifiers;
  self->_deletedRecordScopedIdentifiers = v9;

  v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  fullRecords = self->_fullRecords;
  self->_fullRecords = v11;

  v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  resourcesToUpload = self->_resourcesToUpload;
  self->_resourcesToUpload = v13;

  uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  changesWithResourceChanges = self->_changesWithResourceChanges;
  self->_changesWithResourceChanges = v15;

  id v113 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v152[0] = MEMORY[0x1E4F143A8];
  v152[1] = 3221225472;
  v152[2] = __36__CPLPushSessionTracker_computeDiff__block_invoke;
  v152[3] = &unk_1E60A9290;
  id v110 = v17;
  id v153 = v110;
  v120 = self;
  v154 = self;
  v18 = (void *)MEMORY[0x1BA994060](v152);
  v150[0] = MEMORY[0x1E4F143A8];
  v150[1] = 3221225472;
  v150[2] = __36__CPLPushSessionTracker_computeDiff__block_invoke_2;
  v150[3] = &unk_1E60A92B8;
  id v111 = v18;
  id v151 = v111;
  v150[4] = self;
  v116 = (void *)MEMORY[0x1BA994060](v150);
  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  obuint64_t j = self->_expandedBatch;
  uint64_t v117 = [(CPLChangeBatch *)obj countByEnumeratingWithState:&v146 objects:v166 count:16];
  if (v117)
  {
    uint64_t v115 = *(void *)v147;
    do
    {
      for (uint64_t i = 0; i != v117; ++i)
      {
        if (*(void *)v147 != v115) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v146 + 1) + 8 * i);
        uint64_t v21 = [v20 scopedIdentifier];
        if (!v21)
        {
          if (!_CPLSilentLogging)
          {
            v90 = __CPLSessionOSLogDomain_15527();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
            {
              LODWORD(v163) = 138412290;
              *(void *)((char *)&v163 + 4) = v20;
              _os_log_impl(&dword_1B4CAC000, v90, OS_LOG_TYPE_ERROR, "%@ should have an identifier", (uint8_t *)&v163, 0xCu);
            }
          }
          v91 = [MEMORY[0x1E4F28B00] currentHandler];
          v92 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPushSessionTracker.m"];
          [v91 handleFailureInMethod:a2, v120, v92, 878, @"%@ should have an identifier", v20 object file lineNumber description];

          abort();
        }
        if ([v20 isFullRecord]) {
          [(CPLPushSessionTracker *)v120 acknowledgeNewClientRecord:v20 withScopedIdentifier:v21];
        }
        *(void *)&long long v163 = 0;
        *((void *)&v163 + 1) = &v163;
        uint64_t v164 = 0x2020000000;
        BOOL v165 = 0;
        if ([v20 supportsResources]
          && [v20 hasChangeType:8])
        {
          unsigned __int8 v22 = [v20 resources];
          BOOL v23 = [v22 count] != 0;
        }
        else
        {
          BOOL v23 = 0;
        }
        BOOL v165 = v23;
        v142[0] = MEMORY[0x1E4F143A8];
        v142[1] = 3221225472;
        v142[2] = __36__CPLPushSessionTracker_computeDiff__block_invoke_48;
        v142[3] = &unk_1E60A92E0;
        v145 = &v163;
        v142[4] = v120;
        id v24 = v21;
        id v143 = v24;
        id v144 = v116;
        v119 = (void (**)(void, void, void))MEMORY[0x1BA994060](v142);
        v138[0] = MEMORY[0x1E4F143A8];
        v138[1] = 3221225472;
        v138[2] = __36__CPLPushSessionTracker_computeDiff__block_invoke_2_49;
        v138[3] = &unk_1E60A9308;
        v141 = &v163;
        v138[4] = v120;
        id v25 = v24;
        id v139 = v25;
        v140 = v20;
        v118 = (void (**)(void))MEMORY[0x1BA994060](v138);
        if ([v20 isMasterChange]) {
          [v113 setObject:&unk_1F0D91430 forKeyedSubscript:v25];
        }
        long long v26 = [(CPLPushSessionTracker *)v120 storedClientRecordWithLocalScopedIdentifier:v25];
        if (v26)
        {
          if ([v20 isDelete])
          {
            if (!_CPLSilentLogging)
            {
              v27 = __CPLSessionOSLogDomain_15527();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                id v28 = (id)objc_opt_class();
                v29 = [v20 scopedIdentifier];
                *(_DWORD *)buf = 138412546;
                id v157 = v28;
                __int16 v158 = 2112;
                id v159 = v29;
                _os_log_impl(&dword_1B4CAC000, v27, OS_LOG_TYPE_DEBUG, "-- adding real change delete <%@ %@> to batch", buf, 0x16u);
              }
            }
            [(NSMutableArray *)v120->_deletedRecordScopedIdentifiers addObject:v25];
            if (v120->_diffedBatchCanLowerQuota) {
              char v30 = 1;
            }
            else {
              char v30 = [v20 canLowerQuota];
            }
            v120->_diffedBatchCanLowerQuota = v30;
            uint64_t v59 = [v26 relatedIdentifier];
            uint64_t v60 = [v26 secondaryIdentifier];
            if (v59 | v60)
            {
              v31 = [v20 copy];
              [v31 setRelatedIdentifier:v59];
              [v31 setSecondaryIdentifier:v60];
            }
            else
            {
              v31 = v20;
            }
            ((void (**)(void, NSObject *, void *))v119)[2](v119, v31, v26);
            [(NSMutableDictionary *)v120->_fullRecords setObject:v26 forKeyedSubscript:v25];
            if ([v20 isAssetChange])
            {
              v61 = [v26 masterScopedIdentifier];
              if (v61)
              {
                v62 = [v113 objectForKeyedSubscript:v61];
                uint64_t v63 = [v62 integerValue];

                if (v63 != 0x8000000000000000)
                {
                  v64 = [NSNumber numberWithInteger:v63 + 1];
                  [v113 setObject:v64 forKeyedSubscript:v61];
                }
              }
            }
            if ([v26 supportsResources]) {
              [(NSMutableArray *)v120->_changesWithResourceChanges addObject:v25];
            }
          }
          else
          {
            id v34 = v20;
            id v35 = v34;
            if ([v34 isFullRecord])
            {
              v36 = [(id)objc_opt_class() copyPropertyBlockForDirection:1];
              id v35 = v34;
              if (v36)
              {
                v37 = (void *)[(id)objc_opt_class() newRecordWithScopedIdentifier:v25];

                v129[0] = MEMORY[0x1E4F143A8];
                v129[1] = 3221225472;
                v129[2] = __36__CPLPushSessionTracker_computeDiff__block_invoke_54;
                v129[3] = &unk_1E60A9330;
                id v133 = v36;
                id v35 = v37;
                id v130 = v35;
                id v131 = v34;
                id v132 = v26;
                [v35 cplCopyPropertiesFromObject:v34 withCopyBlock:v129];
              }
            }
            if ([v35 supportsResources]
              && [v35 hasChangeType:8]
              && ([v34 resources],
                  v38 = objc_claimAutoreleasedReturnValue(),
                  v114 = (void *)[v38 cplDeepCopy],
                  v38,
                  v114))
            {
              if (v35 == v34)
              {
                id v35 = (id)[v34 copy];
              }
              long long v127 = 0u;
              long long v128 = 0u;
              long long v125 = 0u;
              long long v126 = 0u;
              v39 = [v35 resources];
              uint64_t v40 = [v39 countByEnumeratingWithState:&v125 objects:v155 count:16];
              if (v40)
              {
                uint64_t v41 = *(void *)v126;
                do
                {
                  for (uint64_t j = 0; j != v40; ++j)
                  {
                    if (*(void *)v126 != v41) {
                      objc_enumerationMutation(v39);
                    }
                    v43 = [*(id *)(*((void *)&v125 + 1) + 8 * j) identity];
                    [v43 setAvailable:1];
                    [v43 setFileURL:0];
                  }
                  uint64_t v40 = [v39 countByEnumeratingWithState:&v125 objects:v155 count:16];
                }
                while (v40);
              }
            }
            else
            {
              v114 = 0;
            }
            v44 = objc_alloc_init(CPLRecordChangeDiffTracker);
            id v124 = 0;
            v31 = [v26 realRecordChangeFromRecordChange:v35 direction:1 newRecord:&v124 diffTracker:v44];
            v45 = v124;

            if ([(NSMutableSet *)v120->_unquarantinedRecordScopedIdentifiers containsObject:v25])
            {
              if (v31)
              {
                v46 = v45;
                v45 = v31;
              }
              else
              {
                v46 = v26;
              }
              v31 = v46;

              [(CPLRecordChangeDiffTracker *)v44 withTrackerForChangeType:2 block:&__block_literal_global_60];
              v45 = v31;
            }
            if (v31)
            {
              if (!v45)
              {
                if (!_CPLSilentLogging)
                {
                  v93 = __CPLSessionOSLogDomain_15527();
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v157 = v34;
                    _os_log_impl(&dword_1B4CAC000, v93, OS_LOG_TYPE_ERROR, "With a real change should come an updated record for %@", buf, 0xCu);
                  }
                }
                v94 = [MEMORY[0x1E4F28B00] currentHandler];
                v95 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPushSessionTracker.m"];
                [v94 handleFailureInMethod:a2, v120, v95, 1076, @"With a real change should come an updated record for %@", v34 object file lineNumber description];

                abort();
              }
              v68 = [v31 recordModificationDate];
              BOOL v69 = v68 == 0;

              if (v69)
              {
                v70 = [v34 recordModificationDate];
                [v31 setRecordModificationDate:v70];
              }
              if (!_CPLSilentLogging)
              {
                v71 = __CPLSessionOSLogDomain_15527();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                {
                  id v72 = (id)objc_opt_class();
                  v73 = [v34 scopedIdentifier];
                  *(_DWORD *)buf = 138412802;
                  id v157 = v72;
                  __int16 v158 = 2112;
                  id v159 = v73;
                  __int16 v160 = 2112;
                  v161 = v44;
                  _os_log_impl(&dword_1B4CAC000, v71, OS_LOG_TYPE_DEFAULT, "-- adding real change <%@ %@> to batch (%@)", buf, 0x20u);
                }
              }
              [(NSMutableArray *)v120->_updatedRecords addObject:v45];
              if (v120->_diffedBatchCanLowerQuota) {
                char v74 = 1;
              }
              else {
                char v74 = [v31 canLowerQuota];
              }
              v120->_diffedBatchCanLowerQuota = v74;
              if (([v31 hasChangeType:2] & 1) == 0)
              {
                v79 = [v26 relatedIdentifier];
                [v31 setRelatedIdentifier:v79];

                v80 = [v26 secondaryIdentifier];
                [v31 setSecondaryIdentifier:v80];
              }
              ((void (**)(void, NSObject *, void *))v119)[2](v119, v31, v26);
              [(NSMutableDictionary *)v120->_fullRecords setObject:v45 forKeyedSubscript:v25];
              if (v114 && [v31 hasChangeType:8]) {
                [(NSMutableDictionary *)v120->_resourcesToUpload setObject:v114 forKeyedSubscript:v25];
              }
              if ([v31 supportsResources]
                && [v31 hasChangeType:8])
              {
                [(NSMutableArray *)v120->_changesWithResourceChanges addObject:v25];
              }
            }
            else
            {
              if (!_CPLSilentLogging)
              {
                v75 = __CPLSessionOSLogDomain_15527();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
                {
                  id v76 = (id)objc_opt_class();
                  id v77 = [v34 scopedIdentifier];
                  v78 = [v26 cplFullDescription];
                  *(_DWORD *)buf = 138412802;
                  id v157 = v76;
                  __int16 v158 = 2112;
                  id v159 = v77;
                  __int16 v160 = 2112;
                  v161 = v78;
                  _os_log_impl(&dword_1B4CAC000, v75, OS_LOG_TYPE_DEBUG, "-- <%@ %@> did not result in a change of the stored record: %@", buf, 0x20u);
                }
              }
              v118[2]();
            }
          }
LABEL_122:

          goto LABEL_123;
        }
        if (![v20 isDelete])
        {
          if (([v20 isFullRecord] & 1) == 0)
          {
            if (!_CPLSilentLogging)
            {
              v96 = __CPLSessionOSLogDomain_15527();
              if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v157 = v20;
                _os_log_impl(&dword_1B4CAC000, v96, OS_LOG_TYPE_ERROR, "%@ should be a full record as a new record", buf, 0xCu);
              }
            }
            v97 = [MEMORY[0x1E4F28B00] currentHandler];
            v98 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPushSessionTracker.m"];
            [v97 handleFailureInMethod:a2, v120, v98, 923, @"%@ should be a full record as a new record", v20 object file lineNumber description];

            abort();
          }
          if ([v20 isAssetChange])
          {
            v47 = [0 masterScopedIdentifier];
            if (v47)
            {
              v48 = [v113 objectForKeyedSubscript:v47];
              uint64_t v49 = [v48 integerValue];

              if (v49 != 0x8000000000000000)
              {
                v50 = [NSNumber numberWithInteger:v49 - 1];
                [v113 setObject:v50 forKeyedSubscript:v47];
              }
            }
          }
          v51 = v20;
          if ([v51 supportsResources])
          {
            v52 = [v51 resources];
            v53 = (void *)[v52 cplDeepCopy];

            if (v53)
            {
              [(NSMutableDictionary *)v120->_resourcesToUpload setObject:v53 forKeyedSubscript:v25];
              v31 = [v51 copy];

              long long v136 = 0u;
              long long v137 = 0u;
              long long v134 = 0u;
              long long v135 = 0u;
              v54 = [v31 resources];
              uint64_t v55 = [v54 countByEnumeratingWithState:&v134 objects:v162 count:16];
              if (v55)
              {
                uint64_t v56 = *(void *)v135;
                do
                {
                  for (uint64_t k = 0; k != v55; ++k)
                  {
                    if (*(void *)v135 != v56) {
                      objc_enumerationMutation(v54);
                    }
                    v58 = [*(id *)(*((void *)&v134 + 1) + 8 * k) identity];
                    [v58 setAvailable:1];
                    [v58 setFileURL:0];
                  }
                  uint64_t v55 = [v54 countByEnumeratingWithState:&v134 objects:v162 count:16];
                }
                while (v55);
              }
            }
            else
            {
              v31 = v51;
            }
          }
          else
          {
            v31 = v51;
          }
          if (!_CPLSilentLogging)
          {
            v81 = __CPLSessionOSLogDomain_15527();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
            {
              id v82 = (id)objc_opt_class();
              id v83 = [v31 scopedIdentifier];
              v84 = [v31 cplFullDescription];
              *(_DWORD *)buf = 138412802;
              id v157 = v82;
              __int16 v158 = 2112;
              id v159 = v83;
              __int16 v160 = 2112;
              v161 = v84;
              _os_log_impl(&dword_1B4CAC000, v81, OS_LOG_TYPE_DEBUG, "-- adding real change <%@ %@> to batch (new record): %@", buf, 0x20u);
            }
          }
          [(NSMutableArray *)v120->_addedRecords addObject:v31];
          if (v120->_diffedBatchCanLowerQuota) {
            char v85 = 1;
          }
          else {
            char v85 = [v31 canLowerQuota];
          }
          v120->_diffedBatchCanLowerQuota = v85;
          ((void (**)(void, NSObject *, void))v119)[2](v119, v31, 0);
          [(NSMutableDictionary *)v120->_fullRecords setObject:v31 forKeyedSubscript:v25];
          goto LABEL_122;
        }
        if ([(NSMutableSet *)v120->_unquarantinedRecordScopedIdentifiers containsObject:v25])
        {
          if (_CPLSilentLogging) {
            goto LABEL_123;
          }
          v31 = __CPLSessionOSLogDomain_15527();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            id v32 = (id)objc_opt_class();
            v33 = [v20 scopedIdentifier];
            *(_DWORD *)buf = 138412546;
            id v157 = v32;
            __int16 v158 = 2112;
            id v159 = v33;
            _os_log_impl(&dword_1B4CAC000, v31, OS_LOG_TYPE_DEFAULT, "-- <%@ %@> is already missing in cache but forcing delete as it is unquarantining the record", buf, 0x16u);
          }
          goto LABEL_122;
        }
        if (!_CPLSilentLogging)
        {
          v65 = __CPLSessionOSLogDomain_15527();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
          {
            id v66 = (id)objc_opt_class();
            v67 = [v20 scopedIdentifier];
            *(_DWORD *)buf = 138412546;
            id v157 = v66;
            __int16 v158 = 2112;
            id v159 = v67;
            _os_log_impl(&dword_1B4CAC000, v65, OS_LOG_TYPE_DEBUG, "-- <%@ %@> is already missing in cache. Ignoring delete", buf, 0x16u);
          }
        }
        v118[2]();
LABEL_123:

        _Block_object_dispose(&v163, 8);
      }
      uint64_t v117 = [(CPLChangeBatch *)obj countByEnumeratingWithState:&v146 objects:v166 count:16];
    }
    while (v117);
  }

  v86 = [(CPLEngineStore *)v120->_store quarantinedRecords];
  v121[0] = MEMORY[0x1E4F143A8];
  v121[1] = 3221225472;
  v121[2] = __36__CPLPushSessionTracker_computeDiff__block_invoke_67;
  v121[3] = &unk_1E60A9378;
  v121[4] = v120;
  id v122 = v86;
  id v123 = v116;
  id v87 = v116;
  id v88 = v86;
  [v113 enumerateKeysAndObjectsUsingBlock:v121];
  v120->_diffHasBeenSuccessful = 1;

  return 1;
}

uint64_t __36__CPLPushSessionTracker_computeDiff__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 BOOLValue];
  }
  else
  {
    BOOL v7 = [*(id *)(*(void *)(a1 + 40) + 8) scopeWithIdentifier:v3];
    if (v7) {
      uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 8) hasFinishedAFullSyncForScope:v7] ^ 1;
    }
    else {
      uint64_t v6 = 1;
    }
    uint64_t v8 = [NSNumber numberWithBool:v6];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v3];
  }
  return v6;
}

void __36__CPLPushSessionTracker_computeDiff__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v7 scopedIdentifier];
  v9 = [v8 scopeIdentifier];
  id v10 = +[CPLRecordPushContext newPushContextForChange:v7 overStoredRecord:v6 initialUpload:(*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v9)];

  [v7 _setPushContext:v10];
  [*(id *)(*(void *)(a1 + 32) + 176) addRecord:v7];
}

void __36__CPLPushSessionTracker_computeDiff__block_invoke_48(void *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24) && ([v10 hasChangeType:8] & 1) == 0)
  {
    id v6 = *(void **)(a1[4] + 104);
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v8 = a1[4];
      v9 = *(void **)(v8 + 104);
      *(void *)(v8 + 104) = v7;

      id v6 = *(void **)(a1[4] + 104);
    }
    [v6 setObject:v10 forKeyedSubscript:a1[5]];
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __36__CPLPushSessionTracker_computeDiff__block_invoke_2_49(void *a1)
{
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    if (!*(void *)(a1[4] + 104))
    {
      id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v3 = a1[4];
      id v4 = *(void **)(v3 + 104);
      *(void *)(v3 + 104) = v2;
    }
    id v5 = (void *)[(id)objc_opt_class() newDeleteChangeWithScopedIdentifier:a1[5]];
    [*(id *)(a1[4] + 104) setObject:v5 forKeyedSubscript:a1[5]];
  }
  ++*(void *)(a1[4] + 192);
}

uint64_t __36__CPLPushSessionTracker_computeDiff__block_invoke_54(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void, void, void, void, uint64_t, uint64_t, uint64_t, uint64_t))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], a4, a5, a6, 1);
}

void __36__CPLPushSessionTracker_computeDiff__block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a3 integerValue];
  if (v6 >= 1)
  {
    unint64_t v7 = v6;
    if (([*(id *)(a1 + 32) hasCloudRecordWithLocalScopedIdentifier:v5] & 1) == 0)
    {
      uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 152) transactionClientCacheView];
      unint64_t v9 = [v8 countOfRecordsWithRelatedScopedIdentifier:v5 class:objc_opt_class()];

      if (v7 >= v9)
      {
        id v10 = [*(id *)(a1 + 32) storedClientRecordWithLocalScopedIdentifier:v5];
        if (v10)
        {
          id v11 = +[CPLRecordChange newDeleteChangeWithScopedIdentifier:v5];
          if (([*(id *)(*(void *)(a1 + 32) + 24) containsObject:v5] & 1) != 0
            || ![*(id *)(a1 + 40) isRecordWithScopedIdentifierQuarantined:v5])
          {
            if (!_CPLSilentLogging)
            {
              v13 = __CPLSessionOSLogDomain_15527();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                int v14 = 138412290;
                id v15 = v5;
                _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "Automatically deleting not yet uploaded master %@", (uint8_t *)&v14, 0xCu);
              }
            }
          }
          else
          {
            if (!_CPLSilentLogging)
            {
              id v12 = __CPLSessionOSLogDomain_15527();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                int v14 = 138412290;
                id v15 = v5;
                _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "Automatically deleting and unquarantining not yet uploaded master %@", (uint8_t *)&v14, 0xCu);
              }
            }
            [*(id *)(*(void *)(a1 + 32) + 24) addObject:v5];
          }
          [*(id *)(*(void *)(a1 + 32) + 72) addObject:v5];
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          [*(id *)(*(void *)(a1 + 32) + 88) setObject:v10 forKeyedSubscript:v5];
          [*(id *)(*(void *)(a1 + 32) + 80) addObject:v5];
        }
      }
    }
  }
}

uint64_t __36__CPLPushSessionTracker_computeDiff__block_invoke_2_57(uint64_t a1, void *a2)
{
  return [a2 noteObjectsDifferOnProperty:@"quarantine"];
}

- (BOOL)computeExpandedBatchWithError:(id *)a3
{
  id v4 = self;
  uint64_t v333 = *MEMORY[0x1E4F143B8];
  if (self->_expandHasBeenSuccessful)
  {
    if (!_CPLSilentLogging)
    {
      v218 = __CPLSessionOSLogDomain_15527();
      if (os_log_type_enabled(v218, OS_LOG_TYPE_ERROR))
      {
        v219 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        p_super = v219;
        _os_log_impl(&dword_1B4CAC000, v218, OS_LOG_TYPE_ERROR, "%@ called twice", buf, 0xCu);
      }
    }
    v216 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    v217 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPushSessionTracker.m"];
    v220 = NSStringFromSelector(a2);
    [v216 handleFailureInMethod:a2, v4, v217, 323, @"%@ called twice", v220 object file lineNumber description];

LABEL_400:
    abort();
  }
  id v5 = a3;
  now = self->_now;
  if (now)
  {
    unint64_t v7 = now;
  }
  else
  {
    unint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  }
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[CPLChangeBatch count](v4->_incomingBatch, "count"));
  incomingBatchRecordPerScopedIdentifiers = v4->_incomingBatchRecordPerScopedIdentifiers;
  v4->_incomingBatchRecordPerScopedIdentifiers = (NSMutableDictionary *)v8;

  id v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unquarantinedRecordScopedIdentifiers = v4->_unquarantinedRecordScopedIdentifiers;
  v4->_unquarantinedRecordScopedIdentifiers = v10;

  id v12 = objc_alloc_init(CPLChangeBatch);
  expandedBatch = v4->_expandedBatch;
  v4->_expandedBatch = v12;

  int v14 = [[CPLPushChangeTasks alloc] initEmpty];
  pushChangeTasks = v4->_pushChangeTasks;
  v4->_pushChangeTasks = v14;

  uint64_t v16 = [(CPLPushSessionTracker *)v4 store];
  id v17 = [v16 engineLibrary];
  v18 = [v17 transport];
  v232 = [v18 fingerprintContext];

  v246 = [(CPLEngineStore *)v4->_store pushPullGatekeepers];
  id v267 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v312 = 0u;
  long long v313 = 0u;
  long long v314 = 0u;
  long long v315 = 0u;
  obuint64_t j = v4->_incomingBatch;
  uint64_t v266 = [(CPLChangeBatch *)obj countByEnumeratingWithState:&v312 objects:v332 count:16];
  if (!v266)
  {
LABEL_380:

    BOOL v205 = [(CPLPushChangeTasks *)v4->_pushChangeTasks hasTasks];
    v4->_BOOL expandHasBeenSuccessful = !v205;
    if (v205)
    {
      if (!_CPLSilentLogging)
      {
        v206 = __CPLSessionOSLogDomain_15527();
        if (os_log_type_enabled(v206, OS_LOG_TYPE_DEFAULT))
        {
          v207 = v4->_pushChangeTasks;
          *(_DWORD *)buf = 138412290;
          p_super = &v207->super;
          _os_log_impl(&dword_1B4CAC000, v206, OS_LOG_TYPE_DEFAULT, "Batch was rejected because of %@", buf, 0xCu);
        }
      }
      revertedChanges = +[CPLErrors cplErrorWithCode:18 description:@"Client needs to fix records in batch"];
      v209 = [(CPLPushChangeTasks *)v4->_pushChangeTasks invalidRecordScopedIdentifiers];
      if ([v209 count]) {
        [(CPLEngineStore *)v4->_store noteInvalidRecordScopedIdentifiersInPushSession:v209];
      }
      if (v5) {
        id *v5 = revertedChanges;
      }
    }
    else
    {
      if (![v267 count])
      {
LABEL_393:
        BOOL expandHasBeenSuccessful = v4->_expandHasBeenSuccessful;
        goto LABEL_394;
      }
      uint64_t v211 = [v267 array];
      revertedChanges = v4->_revertedChanges;
      v4->_revertedChanges = (NSArray *)v211;
    }

    goto LABEL_393;
  }
  uint64_t v264 = *(void *)v313;
  p_isa = (id *)&v4->super.isa;
  v236 = v5;
LABEL_7:
  uint64_t v19 = 0;
LABEL_8:
  if (*(void *)v313 != v264) {
    objc_enumerationMutation(obj);
  }
  v20 = [*(id *)(*((void *)&v312 + 1) + 8 * v19) copy];
  [v20 awakeFromStorage];
  if ([v20 isScopeChange])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v21 = __CPLSessionOSLogDomain_15527();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        p_super = v20;
        _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_DEFAULT, "Client pushed a scope change: %@", buf, 0xCu);
      }
    }
    scopes = v4->_scopes;
    id v311 = 0;
    BOOL v23 = [(CPLEngineScopeStorage *)scopes updateScopeWithChange:v20 error:&v311];
    id v24 = v311;
    if (!v23)
    {
      if (!_CPLSilentLogging)
      {
        id v25 = __CPLSessionOSLogDomain_15527();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          p_super = v20;
          __int16 v326 = 2112;
          uint64_t v327 = (uint64_t)v24;
          _os_log_impl(&dword_1B4CAC000, v25, OS_LOG_TYPE_ERROR, "Client failed to update scope with %@: %@", buf, 0x16u);
        }
      }
      if (v5) {
        id *v5 = v24;
      }
      int v26 = 1;
      goto LABEL_50;
    }
LABEL_49:
    int v26 = 3;
    goto LABEL_50;
  }
  uint64_t v265 = v19;
  long long v309 = 0u;
  long long v310 = 0u;
  long long v307 = 0u;
  long long v308 = 0u;
  id v27 = v246;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v307 objects:v331 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v308;
LABEL_25:
    uint64_t v31 = 0;
    while (1)
    {
      if (*(void *)v308 != v30) {
        objc_enumerationMutation(v27);
      }
      id v32 = *(NSObject **)(*((void *)&v307 + 1) + 8 * v31);
      uint64_t v33 = [v32 checkPushedChange:v20];
      switch(v33)
      {
        case 2:
          if (!_CPLSilentLogging)
          {
            id v34 = __CPLSessionOSLogDomain_15527();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              p_super = v32;
              __int16 v326 = 2112;
              uint64_t v327 = (uint64_t)v20;
              _os_log_impl(&dword_1B4CAC000, v34, OS_LOG_TYPE_DEFAULT, "%@ modified %@ so we will revert it", buf, 0x16u);
            }
          }
          [v267 addObject:v20];
          break;
        case 3:
          if (!_CPLSilentLogging)
          {
            v39 = __CPLSessionOSLogDomain_15527();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              p_super = v32;
              __int16 v326 = 2112;
              uint64_t v327 = (uint64_t)v20;
              _os_log_impl(&dword_1B4CAC000, v39, OS_LOG_TYPE_DEFAULT, "%@ asked to reject %@", buf, 0x16u);
            }
          }
          uint64_t v40 = v4->_pushChangeTasks;
          uint64_t v41 = [v20 scopedIdentifier];
          [(CPLPushChangeTasks *)v40 addTask:1 forRecordWithScopedIdentifier:v41];

LABEL_63:
          uint64_t v19 = v265;
LABEL_64:
          if (++v19 == v266)
          {
            uint64_t v204 = [(CPLChangeBatch *)obj countByEnumeratingWithState:&v312 objects:v332 count:16];
            uint64_t v266 = v204;
            if (!v204) {
              goto LABEL_380;
            }
            goto LABEL_7;
          }
          goto LABEL_8;
        case 1:
          if (!_CPLSilentLogging)
          {
            v42 = __CPLSessionOSLogDomain_15527();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              p_super = v32;
              __int16 v326 = 2112;
              uint64_t v327 = (uint64_t)v20;
              _os_log_impl(&dword_1B4CAC000, v42, OS_LOG_TYPE_DEFAULT, "%@ asked to drop (and revert) %@", buf, 0x16u);
            }
          }
          [v267 addObject:v20];
          goto LABEL_63;
      }
      if (v29 == ++v31)
      {
        uint64_t v29 = [v27 countByEnumeratingWithState:&v307 objects:v331 count:16];
        if (!v29) {
          break;
        }
        goto LABEL_25;
      }
    }
  }

  if (([v20 isDelete] & 1) == 0)
  {
    id v35 = [v20 recordModificationDate];

    if (!v35) {
      [v20 setRecordModificationDate:v7];
    }
  }
  uint64_t v36 = [v20 scopedIdentifier];
  uint64_t v19 = v265;
  if (!v36)
  {
    if (!_CPLSilentLogging)
    {
      v213 = __CPLSessionOSLogDomain_15527();
      if (os_log_type_enabled(v213, OS_LOG_TYPE_ERROR))
      {
        v214 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        p_super = v214;
        v215 = v214;
        _os_log_impl(&dword_1B4CAC000, v213, OS_LOG_TYPE_ERROR, "%@ should have an identifier here", buf, 0xCu);
      }
    }
    v216 = [MEMORY[0x1E4F28B00] currentHandler];
    v217 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPushSessionTracker.m"];
    [v216 handleFailureInMethod:a2, v4, v217, 377, @"%@ should have an identifier here", objc_opt_class() object file lineNumber description];
    goto LABEL_400;
  }
  id v24 = (id)v36;
  v37 = [(NSMutableDictionary *)v4->_incomingBatchRecordPerScopedIdentifiers objectForKey:v36];

  if (v37)
  {
    if (!_CPLSilentLogging)
    {
      v38 = __CPLSessionOSLogDomain_15527();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        p_super = v20;
        _os_log_impl(&dword_1B4CAC000, v38, OS_LOG_TYPE_ERROR, "Client pushed the same record twice: %@ - ignoring", buf, 0xCu);
      }
    }
    ++v4->_ignoredRecordCount;
    goto LABEL_49;
  }
  [(NSMutableDictionary *)v4->_incomingBatchRecordPerScopedIdentifiers setObject:v20 forKeyedSubscript:v24];
  if (v4->_checkScopeIdentifier)
  {
LABEL_88:
    if (computeExpandedBatchWithError__onceToken != -1) {
      dispatch_once(&computeExpandedBatchWithError__onceToken, &__block_literal_global_15597);
    }
    if (![v20 supportsResources]
      || ![v20 hasChangeType:8])
    {
      goto LABEL_172;
    }
    uint64_t v55 = [v20 resourceCopyFromScopedIdentifier];
    if (!v55)
    {
LABEL_171:

LABEL_172:
      v86 = [(CPLEngineStore *)v4->_store quarantinedRecords];
      v235 = v24;
      int v87 = [v86 isRecordWithScopedIdentifierQuarantined:v24];
      v234 = v86;
      if (v87)
      {
        if (([v20 isFullRecord] & 1) == 0
          && ![v20 isDelete])
        {
          id v24 = v235;
          if (!_CPLSilentLogging)
          {
            uint64_t v115 = __CPLSessionOSLogDomain_15527();
            if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              p_super = v20;
              _os_log_impl(&dword_1B4CAC000, v115, OS_LOG_TYPE_DEFAULT, "Client pushed quarantined record: %@ - rejecting", buf, 0xCu);
            }
          }
          [(CPLPushChangeTasks *)v4->_pushChangeTasks addTask:1 forRecordWithScopedIdentifier:v235];
          goto LABEL_228;
        }
        if (!_CPLSilentLogging)
        {
          id v88 = __CPLSessionOSLogDomain_15527();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            p_super = v20;
            _os_log_impl(&dword_1B4CAC000, v88, OS_LOG_TYPE_DEFAULT, "Client pushed quarantined record: %@ - unquarantining", buf, 0xCu);
          }
        }
        if ([v20 isAssetChange])
        {
          v89 = [v20 masterScopedIdentifier];
          if (v89
            && ([(NSMutableSet *)v4->_unquarantinedRecordScopedIdentifiers containsObject:v89] & 1) == 0
            && [v86 isRecordWithScopedIdentifierQuarantined:v89])
          {
            id v24 = v235;
            if (!_CPLSilentLogging)
            {
              v90 = __CPLSessionOSLogDomain_15527();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                p_super = v20;
                _os_log_impl(&dword_1B4CAC000, v90, OS_LOG_TYPE_DEFAULT, "Client pushed quarantined asset: %@ but also needs to push its master - rejecting", buf, 0xCu);
              }
            }
            [(CPLPushChangeTasks *)v4->_pushChangeTasks addTask:4 forRecordWithScopedIdentifier:v235];

LABEL_228:
            int v26 = 3;
LABEL_366:

            goto LABEL_50;
          }
        }
        [(NSMutableSet *)v4->_unquarantinedRecordScopedIdentifiers addObject:v235];
      }
      if (![v20 validateRecordForTracker:v4])
      {
        int v26 = 3;
LABEL_365:
        id v24 = v235;
        goto LABEL_366;
      }
      v298[0] = MEMORY[0x1E4F143A8];
      v298[1] = 3221225472;
      v298[2] = __55__CPLPushSessionTracker_computeExpandedBatchWithError___block_invoke_22;
      v298[3] = &unk_1E60A9240;
      v91 = v20;
      v299 = v91;
      v300 = v4;
      id v92 = v235;
      id v301 = v92;
      v93 = (uint64_t (**)(void, void, void))MEMORY[0x1BA994060](v298);
      v258 = v92;
      uint64_t v94 = [(CPLPushSessionTracker *)v4 storedClientRecordWithLocalScopedIdentifier:v92];
      v233 = (void *)v94;
      if (v94)
      {
        uint64_t v95 = v94;
        if (![v91 supportsResources]
          || ![v91 hasChangeType:8])
        {
          goto LABEL_279;
        }
        v228 = v93;
        long long v288 = 0u;
        long long v289 = 0u;
        long long v286 = 0u;
        long long v287 = 0u;
        v96 = [v91 resources];
        uint64_t v97 = [v96 countByEnumeratingWithState:&v286 objects:v320 count:16];
        if (v97)
        {
          uint64_t v98 = v97;
          v260 = v91;
          v223 = v7;
          int v99 = 0;
          char v100 = 0;
          uint64_t v101 = *(void *)v287;
          while (2)
          {
            for (uint64_t i = 0; i != v98; ++i)
            {
              if (*(void *)v287 != v101) {
                objc_enumerationMutation(v96);
              }
              v103 = *(NSObject **)(*((void *)&v286 + 1) + 8 * i);
              v104 = [v103 identity];
              v105 = [v104 fileURL];

              if (!v105)
              {
                char v100 = [v103 canGenerateDerivative];
                int v99 = 1;
              }
              v106 = [v104 fingerPrint];

              if (!v106)
              {
                id v4 = (CPLPushSessionTracker *)p_isa;
                unint64_t v7 = v223;
                id v5 = v236;
                if (!_CPLSilentLogging)
                {
                  long long v137 = __CPLSessionOSLogDomain_15527();
                  if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    p_super = v103;
                    __int16 v326 = 2112;
                    uint64_t v327 = (uint64_t)v260;
                    _os_log_impl(&dword_1B4CAC000, v137, OS_LOG_TYPE_DEFAULT, "Client pushed a record with a resource missing finger print %@: %@", buf, 0x16u);
                  }
                }
                [p_isa[21] addTask:0 forRecordWithScopedIdentifier:v258];

                int v26 = 3;
                goto LABEL_324;
              }
            }
            uint64_t v98 = [v96 countByEnumeratingWithState:&v286 objects:v320 count:16];
            if (v98) {
              continue;
            }
            break;
          }

          v93 = v228;
          v91 = v260;
          int v107 = ((uint64_t (**)(void, NSObject *, void *))v228)[2](v228, v260, v233);
          id v5 = v236;
          if ((v107 & v99) == 1)
          {
            id v4 = (CPLPushSessionTracker *)p_isa;
            v108 = [p_isa _realChangeFromChange:v260 comparedToStoredRecord:v233 changeType:8];
            v109 = v108;
            unint64_t v7 = v223;
            if (v108 && [v108 hasChangeType:8])
            {
              if ((v100 & 1) != 0
                || ![v260 allowsToOnlyUploadNewResources])
              {
                v202 = [v109 resourceCopyFromScopedIdentifier];

                if (!v202) {
                  goto LABEL_369;
                }
              }
              else
              {
                id v285 = 0;
                int v110 = [v260 changeIsOnlyAddingResourcesToRecord:v233 addedResources:&v285];
                id v111 = v285;
                if (v110 && !_CPLSilentLogging)
                {
                  v112 = __CPLSessionOSLogDomain_15527();
                  if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    p_super = v260;
                    __int16 v326 = 2112;
                    uint64_t v327 = (uint64_t)v111;
                    _os_log_impl(&dword_1B4CAC000, v112, OS_LOG_TYPE_DEFAULT, "Client pushed a record update with sparse resources but just adding new non-sparse resources: %@\nAdded resources:\n%@", buf, 0x16u);
                  }
                }
                if ((v110 & 1) == 0)
                {
LABEL_369:
                  if (!_CPLSilentLogging)
                  {
                    v203 = __CPLSessionOSLogDomain_15527();
                    if (os_log_type_enabled(v203, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      p_super = v260;
                      _os_log_impl(&dword_1B4CAC000, v203, OS_LOG_TYPE_ERROR, "Client pushed a record update with sparse resources: %@", buf, 0xCu);
                    }
                  }
                  int v26 = 3;
                  [p_isa[21] addTask:3 forRecordWithScopedIdentifier:v258];

                  goto LABEL_324;
                }
              }
            }
            else if (!_CPLSilentLogging)
            {
              v187 = __CPLSessionOSLogDomain_15527();
              if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                p_super = v260;
                _os_log_impl(&dword_1B4CAC000, v187, OS_LOG_TYPE_DEFAULT, "Client pushed a record update with sparse resources but with no actual resource change: %@", buf, 0xCu);
              }
            }
            v93 = v228;
            goto LABEL_279;
          }
          id v4 = (CPLPushSessionTracker *)p_isa;
          unint64_t v7 = v223;
          if (v107) {
            goto LABEL_279;
          }
          goto LABEL_337;
        }

        v93 = v228;
        if (((uint64_t (**)(void, NSObject *, uint64_t))v228)[2](v228, v91, v95))
        {
LABEL_279:
          if (![v91 isAssetChange]) {
            goto LABEL_363;
          }
          if ([v91 isDelete])
          {
            v140 = v91;
            v225 = v7;
            v230 = v93;
            long long v283 = 0u;
            long long v284 = 0u;
            long long v281 = 0u;
            long long v282 = 0u;
            v141 = [(CPLEngineStore *)v4->_store transactionClientCacheView];
            v142 = [v141 recordViewsWithRelatedScopedIdentifier:v258 class:objc_opt_class()];

            uint64_t v143 = [v142 countByEnumeratingWithState:&v281 objects:v319 count:16];
            if (v143)
            {
              uint64_t v144 = v143;
              uint64_t v145 = *(void *)v282;
              do
              {
                for (uint64_t j = 0; j != v144; ++j)
                {
                  if (*(void *)v282 != v145) {
                    objc_enumerationMutation(v142);
                  }
                  long long v147 = *(void **)(*((void *)&v281 + 1) + 8 * j);
                  long long v148 = [v147 scopedIdentifier];
                  long long v149 = [v147 synthesizedRecord];
                  [(NSMutableDictionary *)v4->_storedClientRecords setObject:v149 forKeyedSubscript:v148];

                  v150 = v4->_expandedBatch;
                  id v151 = +[CPLRecordChange newDeleteChangeWithScopedIdentifier:v148];
                  [(CPLChangeBatch *)v150 addRecord:v151];
                }
                uint64_t v144 = [v142 countByEnumeratingWithState:&v281 objects:v319 count:16];
              }
              while (v144);
            }

            [(CPLChangeBatch *)v4->_expandedBatch addRecord:v140];
            int v26 = 0;
            unint64_t v7 = v225;
            v93 = v230;
            id v5 = v236;
            goto LABEL_364;
          }
          if (![v91 hasChangeType:16]) {
            goto LABEL_363;
          }
          id v249 = [v91 containerRelations];
          if ([v91 changeType] != 16)
          {
            if (([v91 isFullRecord] & 1) == 0) {
              [v91 setChangeType:[v91 changeType] & 0xFFFFFFFFFFFFFFEFLL];
            }
            [v91 setContainerRelations:0];
            [(CPLChangeBatch *)v4->_expandedBatch addRecord:v91];
          }
          v152 = v91;
          v226 = v7;
          v228 = v93;
          id v153 = [(CPLEngineStore *)v4->_store transactionClientCacheView];
          v154 = [v153 recordViewsWithRelatedScopedIdentifier:v258 class:objc_opt_class()];

          id v262 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          long long v277 = 0u;
          long long v278 = 0u;
          long long v279 = 0u;
          long long v280 = 0u;
          id v253 = v154;
          uint64_t v155 = [v253 countByEnumeratingWithState:&v277 objects:v318 count:16];
          if (v155)
          {
            uint64_t v156 = v155;
            uint64_t v157 = *(void *)v278;
            do
            {
              for (uint64_t k = 0; k != v156; ++k)
              {
                if (*(void *)v278 != v157) {
                  objc_enumerationMutation(v253);
                }
                id v159 = *(void **)(*((void *)&v277 + 1) + 8 * k);
                __int16 v160 = [v159 synthesizedRecord];
                v161 = [v160 relation];
                v162 = [v161 containerIdentifier];

                if (v162)
                {
                  [v262 setObject:v160 forKeyedSubscript:v162];
                  storedClientRecords = v4->_storedClientRecords;
                  uint64_t v164 = [v159 scopedIdentifier];
                  [(NSMutableDictionary *)storedClientRecords setObject:v160 forKeyedSubscript:v164];
                }
              }
              uint64_t v156 = [v253 countByEnumeratingWithState:&v277 objects:v318 count:16];
            }
            while (v156);
          }

          id v165 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          id v241 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v245 = [v152 recordModificationDate];
          long long v273 = 0u;
          long long v274 = 0u;
          long long v275 = 0u;
          long long v276 = 0u;
          id v250 = v249;
          uint64_t v166 = [v250 countByEnumeratingWithState:&v273 objects:v317 count:16];
          uint64_t v167 = v262;
          if (v166)
          {
            uint64_t v168 = v166;
            uint64_t v169 = *(void *)v274;
            id v239 = v165;
            do
            {
              for (uint64_t m = 0; m != v168; ++m)
              {
                if (*(void *)v274 != v169) {
                  objc_enumerationMutation(v250);
                }
                v171 = *(void **)(*((void *)&v273 + 1) + 8 * m);
                v172 = [v171 containerIdentifier];
                if (v172 && ([v165 containsObject:v172] & 1) == 0)
                {
                  [v165 addObject:v172];
                  v173 = [v167 objectForKeyedSubscript:v172];
                  v174 = v173;
                  if (v173)
                  {
                    v175 = [v173 scopedIdentifier];
                    id v176 = +[CPLRecordChange newRecordWithScopedIdentifier:v175];

                    v177 = [v258 identifier];
                    [v176 setItemIdentifier:v177];

                    [v176 setRelation:v171];
                    [v176 setRecordModificationDate:v245];
                    [v167 removeObjectForKey:v172];
                    [v241 addObject:v176];
                  }
                  else
                  {
                    id v176 = [v171 proposedScopedIdentifierForItemScopedIdentifier:v258];
                    id v178 = +[CPLRecordChange newRecordWithScopedIdentifier:v176];
                    v179 = [v258 identifier];
                    [v178 setItemIdentifier:v179];

                    uint64_t v167 = v262;
                    [v178 setRelation:v171];
                    [v178 setRecordModificationDate:v245];
                    [v241 addObject:v178];
                  }
                  id v165 = v239;
                }
              }
              uint64_t v168 = [v250 countByEnumeratingWithState:&v273 objects:v317 count:16];
            }
            while (v168);
          }

          v272[0] = MEMORY[0x1E4F143A8];
          v272[1] = 3221225472;
          v272[2] = __55__CPLPushSessionTracker_computeExpandedBatchWithError___block_invoke_33;
          v272[3] = &unk_1E60A9268;
          id v4 = (CPLPushSessionTracker *)p_isa;
          v272[4] = p_isa;
          [v167 enumerateKeysAndObjectsUsingBlock:v272];
          long long v270 = 0u;
          long long v271 = 0u;
          long long v268 = 0u;
          long long v269 = 0u;
          id v180 = v241;
          uint64_t v181 = [v180 countByEnumeratingWithState:&v268 objects:v316 count:16];
          unint64_t v7 = v226;
          id v5 = v236;
          if (v181)
          {
            uint64_t v182 = v181;
            uint64_t v183 = *(void *)v269;
            do
            {
              for (uint64_t n = 0; n != v182; ++n)
              {
                if (*(void *)v269 != v183) {
                  objc_enumerationMutation(v180);
                }
                [p_isa[20] addRecord:*(void *)(*((void *)&v268 + 1) + 8 * n)];
              }
              uint64_t v182 = [v180 countByEnumeratingWithState:&v268 objects:v316 count:16];
            }
            while (v182);
          }

          int v26 = 0;
LABEL_324:
          v93 = v228;
LABEL_364:

          uint64_t v19 = v265;
          goto LABEL_365;
        }
LABEL_337:
        int v26 = 3;
        goto LABEL_364;
      }
      if ([v91 isDelete])
      {
        if (!_CPLSilentLogging)
        {
          id v113 = v93;
          v114 = __CPLSessionOSLogDomain_15527();
          if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            p_super = v91;
            _os_log_impl(&dword_1B4CAC000, v114, OS_LOG_TYPE_DEBUG, "Client pushed a delete to an already deleted record: %@ - ignoring", buf, 0xCu);
          }

          v93 = v113;
        }
        ++v4->_ignoredRecordCount;
        goto LABEL_337;
      }
      if (([v91 isFullRecord] & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          v138 = v93;
          id v139 = __CPLSessionOSLogDomain_15527();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            p_super = v91;
            _os_log_impl(&dword_1B4CAC000, v139, OS_LOG_TYPE_ERROR, "Client pushed a change but we are missing the full record: %@", buf, 0xCu);
          }

          v93 = v138;
        }
        [(CPLPushChangeTasks *)v4->_pushChangeTasks addTask:2 forRecordWithScopedIdentifier:v258];
        goto LABEL_337;
      }
      if (![v91 supportsResources]) {
        goto LABEL_352;
      }
      id v252 = [v91 fingerprintSchemeWithContext:v232];
      long long v294 = 0u;
      long long v295 = 0u;
      long long v296 = 0u;
      long long v297 = 0u;
      id v244 = [v91 resources];
      uint64_t v240 = [v244 countByEnumeratingWithState:&v294 objects:v322 count:16];
      if (!v240)
      {
        int v136 = 1;
        goto LABEL_350;
      }
      id v248 = *(id *)v295;
      v224 = v7;
      v229 = v93;
LABEL_233:
      uint64_t v116 = 0;
      while (1)
      {
        if (*(id *)v295 != v248) {
          objc_enumerationMutation(v244);
        }
        uint64_t v117 = *(NSObject **)(*((void *)&v294 + 1) + 8 * v116);
        v118 = [v117 identity];
        uint64_t v119 = [v118 fingerPrint];
        if (!v119)
        {
          if (_CPLSilentLogging)
          {
            v186 = 0;
            id v5 = v236;
            v93 = v229;
          }
          else
          {
            v185 = __CPLSessionOSLogDomain_15527();
            id v5 = v236;
            if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              p_super = v117;
              __int16 v326 = 2112;
              uint64_t v327 = (uint64_t)v91;
              _os_log_impl(&dword_1B4CAC000, v185, OS_LOG_TYPE_ERROR, "Client pushed a record with a resource missing finger print %@: %@", buf, 0x16u);
            }
            v186 = 0;
            v93 = v229;
LABEL_334:
          }
          goto LABEL_335;
        }
        v120 = (void *)v119;
        v121 = v91;
        id v122 = [v252 zeroByteFileFingerprint];
        id v261 = v120;
        int v123 = [v120 isEqualToString:v122];

        if (v123)
        {
          if (!_CPLSilentLogging)
          {
            v185 = __CPLSessionOSLogDomain_15527();
            id v5 = v236;
            v91 = v121;
            if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              p_super = v117;
              __int16 v326 = 2112;
              uint64_t v327 = (uint64_t)v121;
              _os_log_impl(&dword_1B4CAC000, v185, OS_LOG_TYPE_ERROR, "Client pushed a record with 0 fileSize %@: %@", buf, 0x16u);
            }
            v93 = v229;
            v186 = v261;
            goto LABEL_334;
          }
          id v5 = v236;
          v93 = v229;
          v91 = v121;
          v186 = v120;
LABEL_335:
          [(CPLPushChangeTasks *)v4->_pushChangeTasks addTask:0 forRecordWithScopedIdentifier:v258];
          goto LABEL_349;
        }
        id v124 = [v118 fileUTI];

        if (v124) {
          BOOL v125 = 0;
        }
        else {
          BOOL v125 = _CPLSilentLogging == 0;
        }
        if (v125)
        {
          long long v126 = __CPLSessionOSLogDomain_15527();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            p_super = v117;
            __int16 v326 = 2112;
            uint64_t v327 = (uint64_t)v121;
            _os_log_impl(&dword_1B4CAC000, v126, OS_LOG_TYPE_ERROR, "Client pushed a record with a resource missing file type %@: %@", buf, 0x16u);
          }
        }
        long long v127 = [(CPLPushSessionTracker *)v4 storedCloudRecordWithLocalScopedIdentifier:v258];
        long long v128 = [v118 fileURL];
        if (!v128)
        {
          if (![v117 canGenerateDerivative]) {
            goto LABEL_262;
          }
          if (computeExpandedBatchWithError__onceToken_24 != -1) {
            dispatch_once(&computeExpandedBatchWithError__onceToken_24, &__block_literal_global_27_15617);
          }
          if (computeExpandedBatchWithError__alwaysAskForDerivatives) {
            char v129 = 1;
          }
          else {
            char v129 = v87;
          }
          if (v129) {
            goto LABEL_344;
          }
          if (!v127) {
            goto LABEL_344;
          }
          id v130 = objc_msgSend(v127, "resourceForType:", -[NSObject resourceType](v117, "resourceType"));
          if (!v130) {
            goto LABEL_344;
          }
          long long v128 = v130;
          id v131 = [v130 identity];
          if (![v131 isAvailable]) {
            goto LABEL_343;
          }
          uint64_t v132 = [v131 fingerPrint];
          uint64_t v133 = [v118 fingerPrint];
          long long v134 = (void *)v133;
          if (v132 && v133)
          {
            char v237 = [(id)v132 isEqual:v133];

            id v4 = (CPLPushSessionTracker *)p_isa;
            if ((v237 & 1) == 0) {
              goto LABEL_343;
            }
          }
          else
          {
            uint64_t v238 = v132 | v133;

            id v4 = (CPLPushSessionTracker *)p_isa;
            if (v238)
            {
LABEL_343:

LABEL_344:
              id v5 = v236;
              v91 = v121;
              v186 = v261;
              if (!_CPLSilentLogging)
              {
                v188 = __CPLSessionOSLogDomain_15527();
                if (os_log_type_enabled(v188, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  p_super = v91;
                  _os_log_impl(&dword_1B4CAC000, v188, OS_LOG_TYPE_DEFAULT, "Client optimistically pushed a record without resources but was wrong: %@", buf, 0xCu);
                }
              }
              [(CPLPushChangeTasks *)v4->_pushChangeTasks addTask:3 forRecordWithScopedIdentifier:v258];

              v93 = v229;
LABEL_349:

              int v136 = 0;
              unint64_t v7 = v224;
              goto LABEL_350;
            }
          }
        }
LABEL_262:

        ++v116;
        v91 = v121;
        if (v240 == v116)
        {
          uint64_t v135 = [v244 countByEnumeratingWithState:&v294 objects:v322 count:16];
          int v136 = 1;
          unint64_t v7 = v224;
          v93 = v229;
          id v5 = v236;
          uint64_t v240 = v135;
          if (!v135)
          {
LABEL_350:

            v189 = v93;
            int v190 = ((uint64_t (**)(void, NSObject *, void))v93)[2](v93, v91, 0);

            int v26 = 3;
            if (!v190)
            {
              v93 = v189;
              goto LABEL_364;
            }
            v93 = v189;
            if (!v136) {
              goto LABEL_364;
            }
LABEL_352:
            if ([v91 isAssetChange])
            {
              v227 = v7;
              v231 = v93;
              v191 = [v91 containerRelations];
              [v91 setContainerRelations:0];
              [(CPLChangeBatch *)v4->_expandedBatch addRecord:v91];
              id v192 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              id v254 = [v91 recordModificationDate];
              long long v290 = 0u;
              long long v291 = 0u;
              long long v292 = 0u;
              long long v293 = 0u;
              id v263 = v191;
              uint64_t v193 = [v263 countByEnumeratingWithState:&v290 objects:v321 count:16];
              if (v193)
              {
                uint64_t v194 = v193;
                uint64_t v195 = *(void *)v291;
                do
                {
                  for (iuint64_t i = 0; ii != v194; ++ii)
                  {
                    if (*(void *)v291 != v195) {
                      objc_enumerationMutation(v263);
                    }
                    v197 = *(void **)(*((void *)&v290 + 1) + 8 * ii);
                    v198 = [v197 containerIdentifier];
                    if (([v192 containsObject:v198] & 1) == 0)
                    {
                      [v192 addObject:v198];
                      v199 = [v197 proposedScopedIdentifierForItemScopedIdentifier:v258];
                      id v200 = +[CPLRecordChange newRecordWithScopedIdentifier:v199];
                      v201 = [v258 identifier];
                      [v200 setItemIdentifier:v201];

                      [v200 setRelation:v197];
                      [v200 setRecordModificationDate:v254];
                      [p_isa[20] addRecord:v200];

                      id v4 = (CPLPushSessionTracker *)p_isa;
                      id v5 = v236;
                    }
                  }
                  uint64_t v194 = [v263 countByEnumeratingWithState:&v290 objects:v321 count:16];
                }
                while (v194);
              }

              int v26 = 0;
              unint64_t v7 = v227;
              v93 = v231;
              goto LABEL_364;
            }
LABEL_363:
            [(CPLChangeBatch *)v4->_expandedBatch addRecord:v91];
            int v26 = 0;
            goto LABEL_364;
          }
          goto LABEL_233;
        }
      }
    }
    if (computeExpandedBatchWithError__simulateResourceCopyFailure)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v56 = __CPLSessionOSLogDomain_15527();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          p_super = v20;
          __int16 v326 = 2112;
          uint64_t v327 = (uint64_t)v55;
          _os_log_impl(&dword_1B4CAC000, v56, OS_LOG_TYPE_ERROR, "Simulating resource copy failure for change %@ with resources copied from %@", buf, 0x16u);
        }
      }
      [(CPLPushChangeTasks *)v4->_pushChangeTasks addTask:7 forRecordWithScopedIdentifier:v24];
      goto LABEL_159;
    }
    v57 = [v20 resources];
    if ([v57 count])
    {
      v58 = [(CPLPushSessionTracker *)v4 resourceIdentitiesForRecordWithLocalScopedIdentifier:v55];
      if (v58)
      {
        long long v304 = 0u;
        long long v305 = 0u;
        long long v302 = 0u;
        long long v303 = 0u;
        v251 = v57;
        uint64_t v59 = [v251 countByEnumeratingWithState:&v302 objects:v323 count:16];
        if (!v59) {
          goto LABEL_167;
        }
        uint64_t v60 = v59;
        id v242 = v57;
        id v247 = v55;
        v222 = v7;
        uint64_t v257 = *(void *)v303;
        id v259 = v58;
LABEL_103:
        uint64_t v61 = 0;
        while (1)
        {
          if (*(void *)v303 != v257) {
            objc_enumerationMutation(v251);
          }
          v62 = *(void **)(*((void *)&v302 + 1) + 8 * v61);
          uint64_t v63 = [v62 identity];
          uint64_t v64 = [v62 sourceResourceType];
          if (!v64) {
            break;
          }
          uint64_t v65 = v64;
          id v66 = v24;
          v67 = [NSNumber numberWithUnsignedInteger:v64];
          v68 = [v259 objectForKeyedSubscript:v67];

          if (v68)
          {
            uint64_t v69 = [v63 fingerPrint];
            v70 = [v68 fingerPrint];
            unint64_t v71 = (unint64_t)v70;
            if (v69) {
              BOOL v72 = v70 == 0;
            }
            else {
              BOOL v72 = 1;
            }
            if (v72)
            {

              if (v69 | v71) {
                goto LABEL_148;
              }
            }
            else
            {
              char v73 = [(id)v69 isEqual:v70];

              if ((v73 & 1) == 0)
              {
LABEL_148:
                if (!_CPLSilentLogging)
                {
                  id v82 = __CPLSessionOSLogDomain_15527();
                  id v5 = v236;
                  uint64_t v19 = v265;
                  if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
                  {
                    v84 = +[CPLResource shortDescriptionForResourceType:v65];
                    *(_DWORD *)buf = 138412802;
                    p_super = v20;
                    __int16 v326 = 2112;
                    uint64_t v327 = (uint64_t)v84;
                    __int16 v328 = 2112;
                    id v329 = v247;
                    _os_log_impl(&dword_1B4CAC000, v82, OS_LOG_TYPE_ERROR, "Client pushed %@ copying resource %@ from %@ but the fingerprints don't match", buf, 0x20u);
                  }
                  goto LABEL_151;
                }
                goto LABEL_375;
              }
            }
          }
          else if ([v62 resourceType] != 1000 {
                 || ([v20 isAssetChange] & 1) == 0)
          }
          {
            if (!_CPLSilentLogging)
            {
              id v82 = __CPLSessionOSLogDomain_15527();
              id v5 = v236;
              uint64_t v19 = v265;
              if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
              {
                id v83 = +[CPLResource shortDescriptionForResourceType:v65];
                *(_DWORD *)buf = 138412802;
                p_super = v20;
                __int16 v326 = 2112;
                uint64_t v327 = (uint64_t)v83;
                __int16 v328 = 2112;
                id v329 = v247;
                _os_log_impl(&dword_1B4CAC000, v82, OS_LOG_TYPE_ERROR, "Client pushed %@ copying resource %@ from %@ but it does not have this resource", buf, 0x20u);
              }
              v68 = 0;
LABEL_151:
              id v4 = (CPLPushSessionTracker *)p_isa;
              unint64_t v7 = v222;
LABEL_152:

LABEL_153:
              v80 = v251;
LABEL_154:

              goto LABEL_155;
            }
            v68 = 0;
LABEL_375:
            id v4 = (CPLPushSessionTracker *)p_isa;
            unint64_t v7 = v222;
            id v5 = v236;
            uint64_t v19 = v265;
            goto LABEL_153;
          }

          ++v61;
          id v4 = (CPLPushSessionTracker *)p_isa;
          id v24 = v66;
          if (v60 == v61)
          {
            uint64_t v60 = [v251 countByEnumeratingWithState:&v302 objects:v323 count:16];
            if (!v60)
            {
              unint64_t v7 = v222;
              id v5 = v236;
              uint64_t v19 = v265;
              uint64_t v55 = v247;
              v57 = v242;
              v58 = v259;
              goto LABEL_167;
            }
            goto LABEL_103;
          }
        }
        id v66 = v24;
        unint64_t v7 = v222;
        id v5 = v236;
        uint64_t v19 = v265;
        v80 = v251;
        if (!_CPLSilentLogging)
        {
          v68 = __CPLSessionOSLogDomain_15527();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            id v82 = +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", [v62 resourceType]);
            *(_DWORD *)buf = 138412802;
            p_super = v20;
            __int16 v326 = 2112;
            uint64_t v327 = (uint64_t)v82;
            __int16 v328 = 2112;
            id v329 = v247;
            _os_log_impl(&dword_1B4CAC000, v68, OS_LOG_TYPE_ERROR, "Client pushed %@ copying resource to %@ from %@ but did not specify which resource type to copy from", buf, 0x20u);
            goto LABEL_152;
          }
          goto LABEL_154;
        }
LABEL_155:

        id v24 = v66;
        uint64_t v55 = v247;
        v57 = v242;
        v58 = v259;
      }
      else
      {
        if (_CPLSilentLogging)
        {
LABEL_157:
          [(CPLPushChangeTasks *)v4->_pushChangeTasks addTask:7 forRecordWithScopedIdentifier:v24];

LABEL_158:
LABEL_159:

          goto LABEL_49;
        }
        v80 = __CPLSessionOSLogDomain_15527();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          uint64_t v81 = [v57 count];
          *(_DWORD *)buf = 138412802;
          p_super = v20;
          __int16 v326 = 2048;
          uint64_t v327 = v81;
          __int16 v328 = 2112;
          id v329 = v55;
          _os_log_impl(&dword_1B4CAC000, v80, OS_LOG_TYPE_ERROR, "Client pushed %@ copying %lu resources from %@ which is unknown or deleted", buf, 0x20u);
        }
      }

      goto LABEL_157;
    }
    if ([v20 isAssetChange]
      && ([v20 adjustments],
          char v74 = objc_claimAutoreleasedReturnValue(),
          v74,
          v74))
    {
      v75 = [(CPLPushSessionTracker *)v4 enqueuedOrStoredRecordWithLocalScopedIdentifier:v55];
      if (v75)
      {
        v58 = v75;
        if ([v75 isAssetChange])
        {
          v251 = [v58 resourceForType:1000];
          if (v251)
          {
            id v243 = v57;
            if (!_CPLSilentLogging)
            {
              id v76 = __CPLSessionOSLogDomain_15527();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                p_super = v251;
                __int16 v326 = 2112;
                uint64_t v327 = (uint64_t)v58;
                _os_log_impl(&dword_1B4CAC000, v76, OS_LOG_TYPE_DEFAULT, "Automatically inferring using %@ in adjusted %@", buf, 0x16u);
              }
            }
            id v77 = [v251 copy];
            [v77 setSourceResourceType:[v251 resourceType]];
            v330 = v77;
            v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v330 count:1];
            [v20 setResources:v78];

            v57 = v243;
            goto LABEL_166;
          }
          if (!_CPLSilentLogging)
          {
            id v77 = __CPLSessionOSLogDomain_15527();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              p_super = v20;
              __int16 v326 = 2112;
              uint64_t v327 = (uint64_t)v58;
              _os_log_impl(&dword_1B4CAC000, v77, OS_LOG_TYPE_DEFAULT, "Client pushed adjusted %@ with no original resource to use from %@ - hopefully, the resources will be copied from what's on the server", buf, 0x16u);
            }
LABEL_166:

LABEL_167:
            char v85 = v251;
            goto LABEL_168;
          }
          char v85 = 0;
        }
        else
        {
          if (_CPLSilentLogging)
          {
LABEL_169:

            goto LABEL_170;
          }
          char v85 = __CPLSessionOSLogDomain_15527();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            p_super = v20;
            __int16 v326 = 2112;
            uint64_t v327 = (uint64_t)v58;
            _os_log_impl(&dword_1B4CAC000, v85, OS_LOG_TYPE_ERROR, "Client pushed adjusted %@ with no resources to copy from %@", buf, 0x16u);
          }
        }
LABEL_168:

        goto LABEL_169;
      }
    }
    else if ([(CPLPushSessionTracker *)v4 knowsClientRecordWithScopedIdentifier:v55])
    {
LABEL_170:

      goto LABEL_171;
    }
    if (!_CPLSilentLogging)
    {
      v79 = __CPLSessionOSLogDomain_15527();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        p_super = v20;
        __int16 v326 = 2112;
        uint64_t v327 = (uint64_t)v55;
        _os_log_impl(&dword_1B4CAC000, v79, OS_LOG_TYPE_ERROR, "Client pushed %@ copying 0 resources from %@ which is unknown or deleted", buf, 0x16u);
      }
    }
    [(CPLPushChangeTasks *)v4->_pushChangeTasks addTask:7 forRecordWithScopedIdentifier:v24];
    goto LABEL_158;
  }
  v43 = [v24 scopeIdentifier];
  validScopeIdentifiers = v4->_validScopeIdentifiers;
  if (validScopeIdentifiers
    && ([(NSMutableSet *)validScopeIdentifiers containsObject:v43] & 1) != 0)
  {
LABEL_87:

    goto LABEL_88;
  }
  v45 = [(CPLEngineScopeStorage *)v4->_scopes scopeWithIdentifier:v43];
  if (v45)
  {
LABEL_86:

    goto LABEL_87;
  }
  if (!_CPLSilentLogging)
  {
    v46 = __CPLSessionOSLogDomain_15527();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      p_super = v43;
      _os_log_impl(&dword_1B4CAC000, v46, OS_LOG_TYPE_ERROR, "Client pushed records for an unknown scope %@ (likely because CPL database has been wiped) but does not support re-creating that scope itself. Automatically recreating it", buf, 0xCu);
    }
  }
  id v47 = v24;
  v48 = v4->_scopes;
  id v306 = 0;
  uint64_t v49 = [(CPLEngineScopeStorage *)v48 createScopeWithIdentifier:v43 scopeType:0 flags:0 transportScope:0 error:&v306];
  id v50 = v306;

  if (v49)
  {
    v51 = v4->_validScopeIdentifiers;
    if (v51)
    {
      [(NSMutableSet *)v51 addObject:v43];
    }
    else
    {
      uint64_t v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v43, 0);
      v54 = v4->_validScopeIdentifiers;
      v4->_validScopeIdentifiers = (NSMutableSet *)v53;
    }
    id v24 = v47;

    uint64_t v19 = v265;
    goto LABEL_86;
  }
  id v24 = v47;
  if (!_CPLSilentLogging)
  {
    v52 = __CPLSessionOSLogDomain_15527();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      p_super = v43;
      __int16 v326 = 2112;
      uint64_t v327 = (uint64_t)v50;
      _os_log_impl(&dword_1B4CAC000, v52, OS_LOG_TYPE_ERROR, "Failed to re-create scope %@ automatically: %@", buf, 0x16u);
    }
  }
  if (v5) {
    id *v5 = v50;
  }

  int v26 = 1;
  uint64_t v19 = v265;
LABEL_50:

  if (v26 == 3 || !v26) {
    goto LABEL_64;
  }

  BOOL expandHasBeenSuccessful = 0;
LABEL_394:

  return expandHasBeenSuccessful;
}

uint64_t __55__CPLPushSessionTracker_computeExpandedBatchWithError___block_invoke_22(void *a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 isMasterChange])
  {
    if ([v5 hasChangeType:8]) {
      unint64_t v7 = v5;
    }
    else {
      unint64_t v7 = v6;
    }
    id v8 = v7;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    unint64_t v9 = objc_msgSend(v5, "expungeableResourceStates", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v15 = objc_msgSend(v8, "resourceForType:", objc_msgSend(v14, "resourceType"));

          if (!v15)
          {
            if (!_CPLSilentLogging)
            {
              id v17 = __CPLSessionOSLogDomain_15527();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                uint64_t v18 = a1[4];
                *(_DWORD *)buf = 138412546;
                id v25 = v14;
                __int16 v26 = 2112;
                uint64_t v27 = v18;
                _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "Client pushed a record with a expungeable resource type that doesn't exist as a resource on this record %@: %@", buf, 0x16u);
              }
            }
            [*(id *)(a1[5] + 168) addTask:8 forRecordWithScopedIdentifier:a1[6]];
            uint64_t v16 = 0;
            goto LABEL_20;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    uint64_t v16 = 1;
LABEL_20:
  }
  else
  {
    uint64_t v16 = 1;
  }

  return v16;
}

void __55__CPLPushSessionTracker_computeExpandedBatchWithError___block_invoke_33(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 scopedIdentifier];
  id v5 = +[CPLRecordChange newDeleteChangeWithScopedIdentifier:v4];

  [*(id *)(*(void *)(a1 + 32) + 160) addRecord:v5];
}

void __55__CPLPushSessionTracker_computeExpandedBatchWithError___block_invoke_25()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  computeExpandedBatchWithError__alwaysAskForDerivatives = [v0 BOOLForKey:@"CPLAlwaysAskForDerivatives"];
}

void __55__CPLPushSessionTracker_computeExpandedBatchWithError___block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  computeExpandedBatchWithError__simulateResourceCopyFailure = [v0 BOOLForKey:@"CPLSimulateResourceCopyFailure"];
}

- (id)_realChangeFromChange:(id)a3 comparedToStoredRecord:(id)a4 changeType:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  uint64_t v10 = v9;
  if ([v9 supportsResources])
  {
    if (!a5 || (uint64_t v10 = v9, (a5 & 8) != 0))
    {
      uint64_t v11 = [v9 resources];
      uint64_t v12 = (void *)[v11 cplDeepCopy];

      uint64_t v10 = v9;
      if (v12)
      {
        uint64_t v10 = (void *)[v9 copy];

        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        v13 = [v10 resources];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v23 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = [*(id *)(*((void *)&v22 + 1) + 8 * i) identity];
              [v18 setAvailable:1];
              [v18 setFileURL:0];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v15);
        }
      }
    }
  }
  uint64_t v21 = 0;
  uint64_t v19 = [v8 realRecordChangeFromRecordChange:v10 direction:1 newRecord:&v21 changeType:a5 diffTracker:0];

  return v19;
}

- (BOOL)hasCloudRecordWithLocalScopedIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_storedCloudRecords objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
    BOOL v7 = v5 != v6;
  }
  else
  {
    char v13 = 0;
    id v8 = [(CPLEngineIDMapping *)self->_idMapping cloudScopedIdentifierForLocalScopedIdentifier:v4 isFinal:&v13];
    if (v8
      && ([(CPLEngineStore *)self->_store cloudCache],
          id v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 hasRecordWithScopedIdentifier:v8],
          v9,
          v10))
    {
      [(NSMutableDictionary *)self->_storedCloudRecords setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v4];
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
      [(NSMutableDictionary *)self->_storedCloudRecords setObject:v11 forKeyedSubscript:v4];

      BOOL v7 = 0;
    }
  }
  return v7;
}

- (void)acknowledgeNewClientRecord:(id)a3 withScopedIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v13 = 0;
  id v6 = [(CPLEngineIDMapping *)self->_idMapping cloudScopedIdentifierForLocalScopedIdentifier:v5 isFinal:&v13];
  if (v6)
  {
    BOOL v7 = [(CPLEngineStore *)self->_store cloudCache];
    id v12 = 0;
    char v8 = [v7 ackownledgeRecordWithScopedIdentifier:v6 error:&v12];
    id v9 = v12;

    if (v8)
    {
      int v10 = [(NSMutableDictionary *)self->_storedClientRecords objectForKeyedSubscript:v5];
      if (v10)
      {
        uint64_t v11 = [MEMORY[0x1E4F1CA98] null];

        if (v10 == v11) {
          [(NSMutableDictionary *)self->_storedClientRecords setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v5];
        }
      }
    }
    else
    {
      if (_CPLSilentLogging)
      {
LABEL_10:

        goto LABEL_11;
      }
      int v10 = __CPLSessionOSLogDomain_15527();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v15 = v5;
        __int16 v16 = 2112;
        id v17 = v6;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Failed to acknowledge %@ (cloud %@) for client in cloud cache: %@", buf, 0x20u);
      }
    }

    goto LABEL_10;
  }
LABEL_11:
}

- (id)storedCloudRecordWithLocalScopedIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_storedCloudRecords objectForKeyedSubscript:v4];
  id v6 = (void *)v5;
  if (v5) {
    BOOL v7 = v5 == MEMORY[0x1E4F1CC38];
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    char v14 = 0;
    char v8 = [(CPLEngineIDMapping *)self->_idMapping cloudScopedIdentifierForLocalScopedIdentifier:v4 isFinal:&v14];
    if (v8)
    {
      id v9 = [(CPLEngineStore *)self->_store cloudCache];
      uint64_t v10 = [v9 recordWithScopedIdentifier:v8 isFinal:1];

      id v6 = (void *)v10;
    }
    if (v6)
    {
      [(NSMutableDictionary *)self->_storedCloudRecords setObject:v6 forKeyedSubscript:v4];
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1CA98] null];
      [(NSMutableDictionary *)self->_storedCloudRecords setObject:v12 forKeyedSubscript:v4];
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];

    if (v6 == v11)
    {

      id v6 = 0;
    }
  }

  return v6;
}

- (BOOL)hasClientRecordWithLocalScopedIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_storedClientRecords objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
    BOOL v7 = v5 != v6;
  }
  else
  {
    char v8 = [(CPLEngineStore *)self->_store transactionClientCacheView];
    int v9 = [v8 hasRecordWithScopedIdentifier:v4];

    if (v9)
    {
      [(NSMutableDictionary *)self->_storedClientRecords setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v4];
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
      [(NSMutableDictionary *)self->_storedClientRecords setObject:v10 forKeyedSubscript:v4];

      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)storedClientRecordWithLocalScopedIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_storedClientRecords objectForKeyedSubscript:v4];
  id v6 = (void *)v5;
  if (v5) {
    BOOL v7 = v5 == MEMORY[0x1E4F1CC38];
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    char v8 = [(CPLEngineStore *)self->_store transactionClientCacheView];
    int v9 = [v8 recordViewWithScopedIdentifier:v4];
    uint64_t v10 = [v9 synthesizedRecord];

    if (v10)
    {
      [(NSMutableDictionary *)self->_storedClientRecords setObject:v10 forKeyedSubscript:v4];
      id v6 = (void *)v10;
      goto LABEL_12;
    }
    id v6 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableDictionary *)self->_storedClientRecords setObject:v6 forKeyedSubscript:v4];
    goto LABEL_11;
  }
  uint64_t v11 = [MEMORY[0x1E4F1CA98] null];

  if (v6 == v11)
  {
LABEL_11:

    id v6 = 0;
  }
LABEL_12:

  return v6;
}

- (BOOL)checkScopeIdentifier:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_checkScopeIdentifier)
  {
    validScopeIdentifiers = self->_validScopeIdentifiers;
    if (!validScopeIdentifiers
      || ([(NSMutableSet *)validScopeIdentifiers containsObject:v4] & 1) == 0)
    {
      invalidScopeIdentifiers = self->_invalidScopeIdentifiers;
      if (invalidScopeIdentifiers
        && ([(NSMutableSet *)invalidScopeIdentifiers containsObject:v4] & 1) != 0)
      {
        BOOL v6 = 0;
        goto LABEL_36;
      }
      char v8 = [(CPLEngineScopeStorage *)self->_scopes scopeWithIdentifier:v4];
      if (!v8
        || (([(CPLEngineScopeStorage *)self->_scopes flagsForScope:v8],
             int v9 = objc_claimAutoreleasedReturnValue(),
             int v10 = [v9 valueForFlag:16],
             int v11 = [v9 valueForFlag:36],
             int v12 = v10 | v11,
             v9,
             v12 == 1)
          ? (BOOL v13 = v11 == 0)
          : (BOOL v13 = 0),
            v13))
      {
        char v14 = [(CPLEngineStore *)self->_store mainScopeIdentifier];
        int v15 = [v4 isEqualToString:v14];

        if (!v15)
        {
LABEL_29:
          long long v25 = self->_invalidScopeIdentifiers;
          if (v25)
          {
            [(NSMutableSet *)v25 addObject:v4];
          }
          else
          {
            __int16 v26 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v4, 0);
            uint64_t v27 = self->_invalidScopeIdentifiers;
            self->_invalidScopeIdentifiers = v26;
          }
          BOOL v6 = 0;
LABEL_35:

          goto LABEL_36;
        }
        if (!_CPLSilentLogging)
        {
          __int16 v16 = __CPLSessionOSLogDomain_15527();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            id v17 = [(CPLEngineStore *)self->_store mainScopeIdentifier];
            *(_DWORD *)buf = 138412290;
            uint64_t v33 = v17;
            _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "Client failed to properly re-enable %@ - will do it directly", buf, 0xCu);
          }
        }
        scopes = self->_scopes;
        id v31 = 0;
        BOOL v19 = [(CPLEngineScopeStorage *)scopes enablePrimaryScopeWithError:&v31];
        id v20 = v31;
        uint64_t v21 = v20;
        if (!v19)
        {
          if (!_CPLSilentLogging)
          {
            long long v23 = __CPLSessionOSLogDomain_15527();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              long long v24 = [(CPLEngineStore *)self->_store mainScopeIdentifier];
              *(_DWORD *)buf = 138412546;
              uint64_t v33 = v24;
              __int16 v34 = 2112;
              id v35 = v21;
              _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_ERROR, "Failed to auto-enable %@: %@", buf, 0x16u);
            }
          }

          goto LABEL_29;
        }
      }
      else if (v12)
      {
        goto LABEL_29;
      }
      long long v22 = self->_validScopeIdentifiers;
      if (v22)
      {
        [(NSMutableSet *)v22 addObject:v4];
      }
      else
      {
        uint64_t v28 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v4, 0);
        uint64_t v29 = self->_validScopeIdentifiers;
        self->_validScopeIdentifiers = v28;
      }
      BOOL v6 = 1;
      goto LABEL_35;
    }
  }
  BOOL v6 = 1;
LABEL_36:

  return v6;
}

- (id)resourceIdentitiesForRecordWithLocalScopedIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_incomingBatchRecordPerScopedIdentifiers objectForKeyedSubscript:v4];
  BOOL v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  if ([v5 isDelete])
  {
    BOOL v7 = 0;
    goto LABEL_13;
  }
  if (![v6 supportsResources] || !objc_msgSend(v6, "hasChangeType:", 8))
  {
LABEL_7:
    char v8 = [(CPLPushSessionTracker *)self storedClientRecordWithLocalScopedIdentifier:v4];
    int v9 = v8;
    if (v8)
    {
      if ([v8 supportsResources])
      {
        BOOL v7 = [(CPLPushSessionTracker *)self _resourceIdentitiesFromChange:v9];
      }
      else
      {
        BOOL v7 = (void *)MEMORY[0x1E4F1CC08];
      }
    }
    else
    {
      BOOL v7 = 0;
    }

    goto LABEL_13;
  }
  BOOL v7 = [(CPLPushSessionTracker *)self _resourceIdentitiesFromChange:v6];
LABEL_13:

  return v7;
}

- (id)enqueuedOrStoredRecordWithLocalScopedIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_incomingBatchRecordPerScopedIdentifiers objectForKeyedSubscript:v4];
  BOOL v6 = v5;
  if (v5)
  {
    if ([v5 isDelete])
    {
      BOOL v7 = 0;
      goto LABEL_7;
    }
    id v8 = v6;
  }
  else
  {
    id v8 = [(CPLPushSessionTracker *)self storedClientRecordWithLocalScopedIdentifier:v4];
  }
  BOOL v7 = v8;
LABEL_7:

  return v7;
}

- (id)_resourceIdentitiesFromChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 resources];
  if ([v3 count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          int v11 = objc_msgSend(v10, "identity", (void)v14);
          if (v11)
          {
            int v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "resourceType"));
            [v4 setObject:v11 forKeyedSubscript:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

- (BOOL)knowsClientRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_incomingBatchRecordPerScopedIdentifiers objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5) {
    LODWORD(self) = [v5 isDelete] ^ 1;
  }
  else {
    LOBYTE(self) = [(CPLPushSessionTracker *)self hasClientRecordWithLocalScopedIdentifier:v4];
  }

  return (char)self;
}

- (BOOL)hasPushChangeTasks
{
  return [(CPLPushChangeTasks *)self->_pushChangeTasks hasTasks];
}

- (CPLPushSessionTracker)initWithIncomingBatch:(id)a3 store:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CPLPushSessionTracker;
  int v11 = [(CPLPushSessionTracker *)&v23 init];
  int v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_store, a4);
    uint64_t v13 = +[CPLClientCacheBaseView clientCacheBaseViewIDMappingForStore:v12->_store];
    idMapping = v12->_idMapping;
    v12->_idMapping = (CPLEngineIDMapping *)v13;

    uint64_t v15 = [v10 scopes];
    scopes = v12->_scopes;
    v12->_scopes = (CPLEngineScopeStorage *)v15;

    v12->_checkScopeIdentifier = [v10 libraryOptions] != 0;
    objc_storeStrong((id *)&v12->_incomingBatch, a3);
    if (![(CPLChangeBatch *)v12->_incomingBatch sortBatchWithError:a5])
    {
      uint64_t v21 = 0;
      goto LABEL_6;
    }
    long long v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    storedClientRecords = v12->_storedClientRecords;
    v12->_storedClientRecords = v17;

    uint64_t v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    storedCloudRecords = v12->_storedCloudRecords;
    v12->_storedCloudRecords = v19;
  }
  uint64_t v21 = v12;
LABEL_6:

  return v21;
}

+ (BOOL)notifyClientOfStore:(id)a3 ofStatusChanges:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  if ([v8 count])
  {
    id v9 = [v7 statusCenter];
    uint64_t v17 = 0;
    __int16 v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy__15654;
    uint64_t v21 = __Block_byref_object_dispose__15655;
    id v22 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__CPLPushSessionTracker_notifyClientOfStore_ofStatusChanges_error___block_invoke;
    v13[3] = &unk_1E60A93A0;
    uint64_t v15 = &v23;
    id v10 = v9;
    id v14 = v10;
    long long v16 = &v17;
    [v8 enumerateKeysAndObjectsUsingBlock:v13];
    if (a5 && !*((unsigned char *)v24 + 24)) {
      *a5 = (id) v18[5];
    }

    _Block_object_dispose(&v17, 8);
  }
  char v11 = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __67__CPLPushSessionTracker_notifyClientOfStore_ofStatusChanges_error___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = (void *)a1[4];
  id v10 = 0;
  char v7 = [v6 notifyStatusForRecordHasChanged:a3 persist:1 error:&v10];
  id v8 = v10;
  id v9 = v10;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v7;
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    *a4 = 1;
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v8);
  }
}

@end