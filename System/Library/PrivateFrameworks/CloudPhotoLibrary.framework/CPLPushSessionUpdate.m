@interface CPLPushSessionUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)applyToStore:(id)a3 error:(id *)a4;
- (BOOL)discardFromStore:(id)a3 error:(id *)a4;
- (CPLChangeBatch)diffBatch;
- (CPLPushSessionUpdate)initWithCoder:(id)a3;
- (CPLPushSessionUpdate)initWithPushSessionTracker:(id)a3 error:(id *)a4;
- (NSArray)addedRecords;
- (NSArray)deletedRecordScopedIdentifiers;
- (NSArray)revertedChanges;
- (NSArray)updatedRecords;
- (NSDictionary)pushContexts;
- (NSDictionary)recordWithStatusChangesToNotify;
- (NSSet)unquarantinedRecordScopedIdentifiers;
- (id)pendingRecordChangeForClientCacheWithLocalScopedIdentifier:(id)a3;
- (id)statusDescription;
- (id)storageForStatusInStore:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLPushSessionUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revertedChanges, 0);
  objc_storeStrong((id *)&self->_recordWithStatusChangesToNotify, 0);
  objc_storeStrong((id *)&self->_unquarantinedRecordScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_deletedRecordScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_updatedRecords, 0);
  objc_storeStrong((id *)&self->_addedRecords, 0);
  objc_storeStrong((id *)&self->_pushContexts, 0);
  objc_storeStrong((id *)&self->_diffBatch, 0);
}

- (NSArray)revertedChanges
{
  return self->_revertedChanges;
}

- (NSDictionary)recordWithStatusChangesToNotify
{
  return self->_recordWithStatusChangesToNotify;
}

- (NSSet)unquarantinedRecordScopedIdentifiers
{
  return self->_unquarantinedRecordScopedIdentifiers;
}

- (NSArray)deletedRecordScopedIdentifiers
{
  return self->_deletedRecordScopedIdentifiers;
}

- (NSArray)updatedRecords
{
  return self->_updatedRecords;
}

- (NSArray)addedRecords
{
  return self->_addedRecords;
}

- (NSDictionary)pushContexts
{
  return self->_pushContexts;
}

- (CPLChangeBatch)diffBatch
{
  return self->_diffBatch;
}

- (id)pendingRecordChangeForClientCacheWithLocalScopedIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSArray *)self->_deletedRecordScopedIdentifiers containsObject:v4])
  {
    id v5 = +[CPLRecordChange newDeleteChangeWithScopedIdentifier:v4];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_updatedRecords;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "scopedIdentifier", (void)v15);
          char v13 = [v12 isEqual:v4];

          if (v13)
          {
            id v5 = v11;

            goto LABEL_13;
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v5 = 0;
  }
LABEL_13:

  return v5;
}

- (id)statusDescription
{
  return [(CPLChangeBatch *)self->_diffBatch summaryDescription];
}

- (id)storageForStatusInStore:(id)a3
{
  return (id)[a3 pushRepository];
}

- (BOOL)discardFromStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CPLPushSessionUpdate;
  if ([(CPLChangeSessionUpdate *)&v27 discardFromStore:v6 error:a4])
  {
    uint64_t v7 = [v6 outgoingResources];
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 1;
    uint64_t v17 = 0;
    long long v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__3141;
    v21 = __Block_byref_object_dispose__3142;
    id v22 = 0;
    pushContexts = self->_pushContexts;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__CPLPushSessionUpdate_discardFromStore_error___block_invoke;
    v13[3] = &unk_1E60A7330;
    long long v15 = &v23;
    id v9 = v7;
    id v14 = v9;
    long long v16 = &v17;
    [(NSDictionary *)pushContexts enumerateKeysAndObjectsUsingBlock:v13];
    int v10 = *((unsigned __int8 *)v24 + 24);
    if (a4 && !*((unsigned char *)v24 + 24))
    {
      *a4 = (id) v18[5];
      int v10 = *((unsigned __int8 *)v24 + 24);
    }
    BOOL v11 = v10 != 0;

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __47__CPLPushSessionUpdate_discardFromStore_error___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = [a3 uploadIdentifier];
  if (v6)
  {
    uint64_t v7 = (void *)a1[4];
    uint64_t v8 = *(void *)(a1[6] + 8);
    id obj = *(id *)(v8 + 40);
    char v9 = [v7 deleteResourcesToUploadWithUploadIdentifier:v6 error:&obj];
    objc_storeStrong((id *)(v8 + 40), obj);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v9;
    if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
      *a4 = 1;
    }
  }
}

- (BOOL)applyToStore:(id)a3 error:(id *)a4
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v105.receiver = self;
  v105.super_class = (Class)CPLPushSessionUpdate;
  if ([(CPLChangeSessionUpdate *)&v105 applyToStore:v6 error:a4])
  {
    uint64_t v7 = [v6 statusCenter];
    uint64_t v8 = [v6 idMapping];
    if ([(NSSet *)self->_unquarantinedRecordScopedIdentifiers count])
    {
      if (!_CPLSilentLogging)
      {
        char v9 = __CPLPushSessionOSLogDomain();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          NSUInteger v10 = [(NSSet *)self->_unquarantinedRecordScopedIdentifiers count];
          *(_DWORD *)buf = 134217984;
          NSUInteger v114 = v10;
          _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Unquarantining %lu records", buf, 0xCu);
        }
      }
      BOOL v11 = [v6 quarantinedRecords];
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      v12 = self->_unquarantinedRecordScopedIdentifiers;
      uint64_t v13 = [(NSSet *)v12 countByEnumeratingWithState:&v101 objects:v112 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v102;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v102 != v15) {
              objc_enumerationMutation(v12);
            }
            if (![(NSArray *)v11 removeQuarantinedRecordWithScopedIdentifier:*(void *)(*((void *)&v101 + 1) + 8 * i) notify:0 error:a4])
            {
              LOBYTE(v28) = 0;
              goto LABEL_38;
            }
          }
          uint64_t v14 = [(NSSet *)v12 countByEnumeratingWithState:&v101 objects:v112 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
    }
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    BOOL v11 = self->_deletedRecordScopedIdentifiers;
    uint64_t v17 = [(NSArray *)v11 countByEnumeratingWithState:&v97 objects:v111 count:16];
    v75 = self;
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v98;
LABEL_18:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v98 != v19) {
          objc_enumerationMutation(v11);
        }
        uint64_t v21 = *(void *)(*((void *)&v97 + 1) + 8 * v20);
        if (![v8 addDeleteEventForRecordWithLocalScopedIdentifier:v21 direction:1 error:a4]|| !objc_msgSend(v7, "discardNotificationForRecordWithScopedIdentifier:error:", v21, a4))
        {
          goto LABEL_36;
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [(NSArray *)v11 countByEnumeratingWithState:&v97 objects:v111 count:16];
          self = v75;
          if (v18) {
            goto LABEL_18;
          }
          break;
        }
      }
    }

    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    BOOL v11 = self->_addedRecords;
    uint64_t v22 = [(NSArray *)v11 countByEnumeratingWithState:&v93 objects:v110 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v94;
LABEL_27:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v94 != v24) {
          objc_enumerationMutation(v11);
        }
        char v26 = [*(id *)(*((void *)&v93 + 1) + 8 * v25) scopedIdentifier];
        int v27 = [v8 addAddEventForRecordWithLocalScopedIdentifier:v26 direction:1 error:a4];

        if (!v27) {
          break;
        }
        if (v23 == ++v25)
        {
          uint64_t v23 = [(NSArray *)v11 countByEnumeratingWithState:&v93 objects:v110 count:16];
          if (v23) {
            goto LABEL_27;
          }
          goto LABEL_33;
        }
      }
LABEL_36:
      LOBYTE(v28) = 0;
LABEL_39:

LABEL_40:
      goto LABEL_41;
    }
LABEL_33:

    if (__CPLPushSessionAutoCancelSync) {
      BOOL v11 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    else {
      BOOL v11 = 0;
    }
    v68 = v6;
    v69 = v8;
    v67 = v7;
    v12 = [v6 pushRepository];
    id v74 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    uint64_t v65 = 24;
    v30 = v75->_diffBatch;
    uint64_t v72 = [(CPLChangeBatch *)v30 countByEnumeratingWithState:&v89 objects:v109 count:16];
    uint64_t v31 = 0;
    if (v72)
    {
      id obj = v30;
      uint64_t v71 = *(void *)v90;
LABEL_45:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v90 != v71) {
          objc_enumerationMutation(obj);
        }
        v33 = *(void **)(*((void *)&v89 + 1) + 8 * v32);
        uint64_t v34 = objc_msgSend(v33, "changeType", v65);
        id v35 = [v33 scopedIdentifier];
        v36 = [v35 scopeIdentifier];
        [v74 addObject:v36];

        v37 = [(NSDictionary *)v75->_pushContexts objectForKeyedSubscript:v35];
        if (!v37) {
          v37 = [[CPLRecordPushContext alloc] initWithUploadIdentifier:0 flags:0 priority:0];
        }
        if ([(NSSet *)v75->_unquarantinedRecordScopedIdentifiers containsObject:v35]) {
          [v33 _setShouldNotTrustCloudCache:1];
        }
        if (![(NSSet *)v12 storeChange:v33 pushContext:v37 error:a4]) {
          goto LABEL_107;
        }
        if (__CPLPushSessionAutoCancelSync
          && [v33 supportsResources]
          && (([v33 isDelete] & 1) != 0 || objc_msgSend(v33, "hasChangeType:", 8)))
        {
          [(NSArray *)v11 addObject:v35];
        }
        v31 |= v34;

        if (v72 == ++v32)
        {
          v30 = obj;
          uint64_t v72 = [(CPLChangeBatch *)obj countByEnumeratingWithState:&v89 objects:v109 count:16];
          if (v72) {
            goto LABEL_45;
          }
          break;
        }
      }
    }

    uint64_t v8 = v69;
    if (__CPLPushSessionAutoCancelSync)
    {
      if ([(NSArray *)v11 count])
      {
        v38 = [(NSSet *)v12 storedExtractedBatch];
        if (v38)
        {
          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          v73 = v38;
          id v76 = [v38 batch];
          uint64_t v39 = [v76 countByEnumeratingWithState:&v85 objects:v108 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            uint64_t v41 = *(void *)v86;
            while (2)
            {
              for (uint64_t j = 0; j != v40; ++j)
              {
                if (*(void *)v86 != v41) {
                  objc_enumerationMutation(v76);
                }
                v43 = *(void **)(*((void *)&v85 + 1) + 8 * j);
                if (objc_msgSend(v43, "supportsResources", v65))
                {
                  if ([v43 hasChangeType:8])
                  {
                    v44 = [v43 scopedIdentifier];
                    BOOL v45 = [(NSArray *)v11 containsObject:v44];

                    uint64_t v8 = v69;
                    if (v45)
                    {
                      if (!_CPLSilentLogging)
                      {
                        v46 = __CPLPushSessionOSLogDomain();
                        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412290;
                          NSUInteger v114 = (NSUInteger)v43;
                          _os_log_impl(&dword_1B4CAC000, v46, OS_LOG_TYPE_DEFAULT, "Relaunching sync session because currently uploading %@ has been overwritten", buf, 0xCu);
                        }
                      }
                      v47 = [v68 engineLibrary];
                      v48 = [v47 syncManager];
                      [v48 cancelCurrentSyncSession];

                      goto LABEL_79;
                    }
                  }
                }
              }
              uint64_t v40 = [v76 countByEnumeratingWithState:&v85 objects:v108 count:16];
              if (v40) {
                continue;
              }
              break;
            }
          }
LABEL_79:
        }
      }
    }
    v49 = v74;
    v50 = v75;
    if (objc_msgSend(v74, "count", v65))
    {
      id obj = [v68 scopes];
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v35 = v74;
      uint64_t v51 = [v35 countByEnumeratingWithState:&v81 objects:v107 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = *(void *)v82;
LABEL_83:
        uint64_t v54 = 0;
        while (1)
        {
          if (*(void *)v82 != v53) {
            objc_enumerationMutation(v35);
          }
          v37 = [(CPLChangeBatch *)obj scopeWithIdentifier:*(void *)(*((void *)&v81 + 1) + 8 * v54)];
          if (v37)
          {
            if (![(CPLChangeBatch *)obj setScopeHasChangesToPushToTransport:v37 changeTypes:v31 error:a4])break; {
          }
            }

          if (v52 == ++v54)
          {
            uint64_t v52 = [v35 countByEnumeratingWithState:&v81 objects:v107 count:16];
            if (v52) {
              goto LABEL_83;
            }
            goto LABEL_90;
          }
        }
LABEL_107:

        LOBYTE(v28) = 0;
        uint64_t v7 = v67;
        id v6 = v68;
        uint64_t v8 = v69;
LABEL_38:

        goto LABEL_39;
      }
LABEL_90:

      uint64_t v8 = v69;
      v49 = v74;
      v50 = v75;
    }

    id v6 = v68;
    BOOL v11 = [[CPLSimpleMergeHelper alloc] initWithEngineStore:v68];
    v55 = [(NSArray *)v11 mergerForBatch:*(Class *)((char *)&v50->super.super.isa + v66) error:a4];
    v28 = v55;
    if (!v55)
    {
      uint64_t v7 = v67;
      goto LABEL_39;
    }
    int v56 = [v55 mergeConflictsWithError:a4];

    uint64_t v7 = v67;
    if (!v56
      || [*(id *)((char *)&v50->super.super.isa + v66) count]
      && ([v68 quarantinedRecords],
          v57 = objc_claimAutoreleasedReturnValue(),
          int v58 = [v57 resetRejectedRecordsWithError:a4],
          v57,
          !v58)
      || (recordWithStatusChangesToNotify = v50->_recordWithStatusChangesToNotify) != 0
      && !+[CPLPushSessionTracker notifyClientOfStore:v68 ofStatusChanges:recordWithStatusChangesToNotify error:a4])
    {
      LOBYTE(v28) = 0;
      goto LABEL_40;
    }
    if (![(NSArray *)v50->_revertedChanges count])
    {
      LOBYTE(v28) = 1;
      goto LABEL_40;
    }
    BOOL v11 = [v68 revertRecords];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v12 = v50->_revertedChanges;
    uint64_t v60 = [(NSSet *)v12 countByEnumeratingWithState:&v77 objects:v106 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v78;
LABEL_100:
      uint64_t v63 = 0;
      while (1)
      {
        if (*(void *)v78 != v62) {
          objc_enumerationMutation(v12);
        }
        v28 = *(void **)(*((void *)&v77 + 1) + 8 * v63);
        v64 = [v28 scopedIdentifier];
        LODWORD(v28) = -[NSArray addRecordsToRevertWithLocalScopedIdentifier:class:error:](v11, "addRecordsToRevertWithLocalScopedIdentifier:class:error:", v64, [v28 recordClass], a4);

        if (!v28) {
          break;
        }
        if (v61 == ++v63)
        {
          uint64_t v61 = [(NSSet *)v12 countByEnumeratingWithState:&v77 objects:v106 count:16];
          LOBYTE(v28) = 1;
          if (v61) {
            goto LABEL_100;
          }
          break;
        }
      }
      uint64_t v7 = v67;
    }
    else
    {
      LOBYTE(v28) = 1;
    }
    goto LABEL_38;
  }
  LOBYTE(v28) = 0;
LABEL_41:

  return (char)v28;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPushSessionUpdate;
  id v4 = a3;
  [(CPLChangeSessionUpdate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_pushContexts, @"pc", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_diffBatch forKey:@"b"];
  [v4 encodeObject:self->_addedRecords forKey:@"n"];
  [v4 encodeObject:self->_updatedRecords forKey:@"u"];
  [v4 encodeObject:self->_deletedRecordScopedIdentifiers forKey:@"d"];
  [v4 encodeObject:self->_unquarantinedRecordScopedIdentifiers forKey:@"q"];
  [v4 encodeObject:self->_recordWithStatusChangesToNotify forKey:@"notify"];
  [v4 encodeObject:self->_revertedChanges forKey:@"reverted"];
}

- (CPLPushSessionUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CPLPushSessionUpdate;
  objc_super v5 = [(CPLChangeSessionUpdate *)&v29 initWithCoder:v4];
  if (v5)
  {
    if (initWithCoder__onceToken != -1) {
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_3154);
    }
    uint64_t v6 = [v4 decodeObjectOfClasses:initWithCoder__pushContextsClasses forKey:@"pc"];
    pushContexts = v5->_pushContexts;
    v5->_pushContexts = (NSDictionary *)v6;

    if (!v5->_pushContexts)
    {
      uint64_t v8 = +[CPLRecordPushContext pushContextsFromStoredUploadIdentifiersInCoder:v4 key:@"ul"];
      char v9 = v5->_pushContexts;
      v5->_pushContexts = (NSDictionary *)v8;
    }
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"b"];
    diffBatch = v5->_diffBatch;
    v5->_diffBatch = (CPLChangeBatch *)v10;

    uint64_t v12 = [v4 decodeObjectOfClasses:initWithCoder__recordsClasses forKey:@"n"];
    addedRecords = v5->_addedRecords;
    v5->_addedRecords = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClasses:initWithCoder__recordsClasses forKey:@"u"];
    updatedRecords = v5->_updatedRecords;
    v5->_updatedRecords = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClasses:initWithCoder__deletedIdentifiersClasses forKey:@"d"];
    deletedRecordScopedIdentifiers = v5->_deletedRecordScopedIdentifiers;
    v5->_deletedRecordScopedIdentifiers = (NSArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClasses:initWithCoder__unquarantinedRecordIdentifiersClasses forKey:@"q"];
    unquarantinedRecordScopedIdentifiers = v5->_unquarantinedRecordScopedIdentifiers;
    v5->_unquarantinedRecordScopedIdentifiers = (NSSet *)v18;

    uint64_t v20 = +[CPLScopedIdentifier scopedIdentifiersFromArrayOfUnknownIdentifiers:v5->_deletedRecordScopedIdentifiers];
    uint64_t v21 = v5->_deletedRecordScopedIdentifiers;
    v5->_deletedRecordScopedIdentifiers = (NSArray *)v20;

    uint64_t v22 = +[CPLScopedIdentifier scopedIdentifiersFromSetOfUnknownIdentifiers:v5->_unquarantinedRecordScopedIdentifiers];
    uint64_t v23 = v5->_unquarantinedRecordScopedIdentifiers;
    v5->_unquarantinedRecordScopedIdentifiers = (NSSet *)v22;

    uint64_t v24 = [v4 decodeObjectOfClasses:initWithCoder__recordWithStatusChangesToNotifyClasses forKey:@"notify"];
    recordWithStatusChangesToNotify = v5->_recordWithStatusChangesToNotify;
    v5->_recordWithStatusChangesToNotify = (NSDictionary *)v24;

    uint64_t v26 = [v4 decodeObjectOfClasses:initWithCoder__recordsClasses forKey:@"reverted"];
    revertedChanges = v5->_revertedChanges;
    v5->_revertedChanges = (NSArray *)v26;
  }
  return v5;
}

uint64_t __38__CPLPushSessionUpdate_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  id v4 = (void *)initWithCoder__pushContextsClasses;
  initWithCoder__pushContextsClasses = v3;

  objc_super v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  char v9 = (void *)initWithCoder__deletedIdentifiersClasses;
  initWithCoder__deletedIdentifiersClasses = v8;

  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  uint64_t v13 = (void *)initWithCoder__recordsClasses;
  initWithCoder__recordsClasses = v12;

  uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
  uint64_t v18 = (void *)initWithCoder__unquarantinedRecordIdentifiersClasses;
  initWithCoder__unquarantinedRecordIdentifiersClasses = v17;

  uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
  uint64_t v23 = initWithCoder__recordWithStatusChangesToNotifyClasses;
  initWithCoder__recordWithStatusChangesToNotifyClasses = v22;
  return MEMORY[0x1F41817F8](v22, v23);
}

- (CPLPushSessionUpdate)initWithPushSessionTracker:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v56 = [v6 resourcesToUpload];
  uint64_t v7 = [v6 store];
  v55 = [v7 outgoingResources];

  uint64_t v51 = v6;
  uint64_t v8 = [v6 diffedBatch];
  char v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v8;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v60 objects:v66 count:16];
  uint64_t v54 = v10;
  if (v11)
  {
    uint64_t v12 = v11;
    SEL v48 = a2;
    v49 = a4;
    v57 = 0;
    uint64_t v13 = *(void *)v61;
    uint64_t v53 = v9;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v61 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        uint64_t v16 = [v15 _pushContext];
        if (!v16)
        {
          if (!_CPLSilentLogging)
          {
            BOOL v45 = __CPLGenericOSLogDomain();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v65 = v15;
              _os_log_impl(&dword_1B4CAC000, v45, OS_LOG_TYPE_ERROR, "%@ should have a push context", buf, 0xCu);
            }
          }
          v46 = [MEMORY[0x1E4F28B00] currentHandler];
          v47 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLChangeSessionUpdate.m"];
          [v46 handleFailureInMethod:v48, self, v47, 104, @"%@ should have a push context", v15 object file lineNumber description];

          abort();
        }
        uint64_t v17 = (void *)v16;
        uint64_t v18 = [v15 scopedIdentifier];
        if ([v15 supportsResources]
          && [v15 hasChangeType:8])
        {
          uint64_t v19 = [v56 objectForKeyedSubscript:v18];
          if (v19)
          {
            uint64_t v20 = [v15 isAssetChange];
            uint64_t v21 = [v17 pushContextAddingUploadIdentifier];

            [v15 _setPushContext:v21];
            uint64_t v22 = [v21 uploadIdentifier];
            id v59 = v57;
            LODWORD(v20) = [v55 storeResourcesToUpload:v19 withUploadIdentifier:v22 shouldCheckResources:v20 error:&v59];
            id v23 = v59;

            if (!v20)
            {

              char v9 = v53;
              if (v49)
              {
                id v23 = v23;
                uint64_t v24 = 0;
                id *v49 = v23;
              }
              else
              {
                uint64_t v24 = 0;
              }
              uint64_t v25 = v51;
              v43 = self;
              goto LABEL_25;
            }
            uint64_t v17 = v21;
            v57 = v23;
            char v9 = v53;
            id v10 = v54;
          }
        }
        [v9 setObject:v17 forKeyedSubscript:v18];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v60 objects:v66 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    v57 = 0;
  }

  uint64_t v25 = v51;
  uint64_t v26 = [v51 store];
  v58.receiver = self;
  v58.super_class = (Class)CPLPushSessionUpdate;
  int v27 = [(CPLChangeSessionUpdate *)&v58 initWithStore:v26];

  if (v27)
  {
    uint64_t v28 = [v9 copy];
    pushContexts = v27->_pushContexts;
    v27->_pushContexts = (NSDictionary *)v28;

    objc_storeStrong((id *)&v27->_diffBatch, obj);
    uint64_t v30 = [v51 addedRecords];
    addedRecords = v27->_addedRecords;
    v27->_addedRecords = (NSArray *)v30;

    uint64_t v32 = [v51 updatedRecords];
    updatedRecords = v27->_updatedRecords;
    v27->_updatedRecords = (NSArray *)v32;

    uint64_t v34 = [v51 deletedRecordScopedIdentifiers];
    deletedRecordScopedIdentifiers = v27->_deletedRecordScopedIdentifiers;
    v27->_deletedRecordScopedIdentifiers = (NSArray *)v34;

    uint64_t v36 = [v51 unquarantinedRecordScopedIdentifiers];
    unquarantinedRecordScopedIdentifiers = v27->_unquarantinedRecordScopedIdentifiers;
    v27->_unquarantinedRecordScopedIdentifiers = (NSSet *)v36;

    uint64_t v38 = [v51 recordWithStatusChangesToNotify];
    recordWithStatusChangesToNotify = v27->_recordWithStatusChangesToNotify;
    v27->_recordWithStatusChangesToNotify = (NSDictionary *)v38;

    uint64_t v40 = [v51 revertedChanges];
    revertedChanges = v27->_revertedChanges;
    v27->_revertedChanges = (NSArray *)v40;

    if (![(NSArray *)v27->_revertedChanges count])
    {
      v42 = v27->_revertedChanges;
      v27->_revertedChanges = 0;
    }
  }
  v43 = v27;
  uint64_t v24 = v43;
  id v23 = v57;
LABEL_25:

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end