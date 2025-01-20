@interface HDCloudSyncSessionContext
- (BOOL)addChangeData:(id)a3 changes:(id)a4 sessionIdentifier:(id)a5 outError:(id *)a6;
- (BOOL)hasOpenSequence;
- (BOOL)resetInvalidArchiveCreatorWithSessionUUID:(id)a3 error:(id *)a4;
- (HDCloudSyncSessionContext)init;
- (HDCloudSyncSessionContext)initWithChangedSyncEntityCount:(unint64_t)a3 profile:(id)a4;
- (HDProfile)profile;
- (HDSyncAnchorRangeMap)pendingAnchorRangeMap;
- (NSProgress)progress;
- (NSURL)archiveURL;
- (_HKArchiveCreator)archiveCreator;
- (unint64_t)archiveCount;
- (unint64_t)archiveSize;
- (unint64_t)changesetCount;
- (void)finishProgress;
- (void)setArchiveCount:(unint64_t)a3;
- (void)setChangesetCount:(unint64_t)a3;
@end

@implementation HDCloudSyncSessionContext

- (HDCloudSyncSessionContext)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncSessionContext)initWithChangedSyncEntityCount:(unint64_t)a3 profile:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDCloudSyncSessionContext;
  v7 = [(HDCloudSyncSessionContext *)&v16 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_profile, v6);
    v9 = objc_alloc_init(HDSyncAnchorRangeMap);
    pendingAnchorRangeMap = v8->_pendingAnchorRangeMap;
    v8->_pendingAnchorRangeMap = v9;

    v8->_changesetCount = 0;
    v8->_archiveCount = 0;
    uint64_t v11 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:a3];
    progress = v8->_progress;
    v8->_progress = (NSProgress *)v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    syncEntityClassesWithProcessedChanges = v8->_syncEntityClassesWithProcessedChanges;
    v8->_syncEntityClassesWithProcessedChanges = v13;
  }
  return v8;
}

- (unint64_t)archiveSize
{
  v2 = [(_HKArchiveCreator *)self->_archiveCreator fileHandle];
  unint64_t v3 = [v2 seekToEndOfFile];

  return v3;
}

- (BOOL)resetInvalidArchiveCreatorWithSessionUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  archiveCreator = self->_archiveCreator;
  if (archiveCreator && ([(_HKArchiveCreator *)archiveCreator archiveIsValid] & 1) != 0)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    v10 = NSString;
    uint64_t v11 = [v6 UUIDString];
    v12 = [v10 stringWithFormat:@"syncarchive-%@-%llu", v11, self->_archiveCount];

    v13 = [v9 temporaryDirectory];
    v14 = [v13 URLByAppendingPathComponent:v12];
    v15 = [v14 URLByAppendingPathExtension:@"zip"];

    objc_super v16 = HDAssetFileHandleForFileURL(v15, v9, (uint64_t)a4);
    BOOL v8 = v16 != 0;
    if (v16)
    {
      v17 = (_HKArchiveCreator *)[objc_alloc(MEMORY[0x1E4F2B850]) initWithFileHandle:v16 archiveType:0];
      v18 = self->_archiveCreator;
      self->_archiveCreator = v17;

      objc_storeStrong((id *)&self->_archiveURL, v15);
      [(HDSyncAnchorRangeMap *)self->_pendingAnchorRangeMap reset];
      unint64_t v19 = self->_archiveCount + 1;
      self->_changesetCount = 0;
      self->_archiveCount = v19;
    }
  }
  return v8;
}

- (BOOL)addChangeData:(id)a3 changes:(id)a4 sessionIdentifier:(id)a5 outError:(id *)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if ([(HDCloudSyncSessionContext *)self resetInvalidArchiveCreatorWithSessionUUID:a5 error:a6])
  {
    v63 = a6;
    id v64 = v11;
    id v65 = v10;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v68 objects:v74 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v66 = v12;
      uint64_t v67 = *(void *)v69;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v69 != v67) {
          objc_enumerationMutation(v12);
        }
        objc_super v16 = *(void **)(*((void *)&v68 + 1) + 8 * v15);
        syncEntityClassesWithProcessedChanges = self->_syncEntityClassesWithProcessedChanges;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        LOBYTE(syncEntityClassesWithProcessedChanges) = -[NSMutableSet containsObject:](syncEntityClassesWithProcessedChanges, "containsObject:", [v16 syncEntityClassForProfile:WeakRetained]);

        if ((syncEntityClassesWithProcessedChanges & 1) == 0)
        {
          unint64_t v19 = self->_syncEntityClassesWithProcessedChanges;
          id v20 = objc_loadWeakRetained((id *)&self->_profile);
          -[NSMutableSet addObject:](v19, "addObject:", [v16 syncEntityClassForProfile:v20]);

          unint64_t v21 = [(NSMutableSet *)self->_syncEntityClassesWithProcessedChanges count];
          unint64_t v22 = [(NSProgress *)self->_progress totalUnitCount];
          if (v21 >= v22) {
            unint64_t v23 = v22;
          }
          else {
            unint64_t v23 = v21;
          }
          [(NSProgress *)self->_progress setCompletedUnitCount:v23];
        }
        v24 = self->_pendingAnchorRangeMap;
        id v25 = v16;
        self;
        uint64_t v72 = 0;
        uint64_t v73 = 0;
        v26 = [v25 syncEntityIdentifier];
        BOOL v27 = [(HDSyncAnchorRangeMap *)v24 getAnchorRange:&v72 forSyncEntityIdentifier:v26];

        if (v27)
        {
          v28 = [v25 sequenceNumber];
          if ([v28 integerValue])
          {
          }
          else
          {
            uint64_t v36 = [v25 syncAnchorRange];
            uint64_t v37 = v73;

            BOOL v38 = v36 == v37;
            id v12 = v66;
            if (!v38)
            {
              v55 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v56 = objc_opt_class();
              uint64_t v57 = [v25 syncAnchorRange];
              uint64_t v58 = v73;
              v59 = [v25 sequenceNumber];
              objc_msgSend(v55, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v56, sel__updateAnchorRangeMap_withChange_outError_, @"startAnchor (%lld) != previous endAnchor (%lld), sequence (%@)"", v57, v58, v59);
LABEL_30:
              id v60 = (id)objc_claimAutoreleasedReturnValue();
              id v61 = v60;
              if (v60)
              {
                id v11 = v64;
                id v10 = v65;
                if (v63)
                {
                  id v61 = v60;
                  id *v63 = v61;
                }
                else
                {
                  _HKLogDroppedError();
                }
              }
              else
              {
                id v11 = v64;
                id v10 = v65;
              }

              BOOL v49 = 0;
              v46 = v66;
              goto LABEL_36;
            }
          }
          v39 = [v25 sequenceNumber];
          if ([v39 integerValue] < 1)
          {
          }
          else
          {
            [v25 syncAnchorRange];
            uint64_t v41 = v40;
            uint64_t v42 = v73;

            BOOL v38 = v41 == v42;
            id v12 = v66;
            if (!v38)
            {
              v50 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v51 = objc_opt_class();
              [v25 syncAnchorRange];
              uint64_t v53 = v52;
              uint64_t v54 = v73;
              v59 = [v25 sequenceNumber];
              objc_msgSend(v50, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v51, sel__updateAnchorRangeMap_withChange_outError_, @"endAnchor (%lld) != previous endAnchor (%lld), sequence (%@)"", v53, v54, v59);
              goto LABEL_30;
            }
          }
          [v25 syncAnchorRange];
          uint64_t v73 = v43;
          v32 = [v25 syncEntityIdentifier];
          uint64_t v34 = v72;
          uint64_t v35 = v73;
          v33 = v24;
        }
        else
        {
          uint64_t v29 = [v25 syncAnchorRange];
          uint64_t v31 = v30;
          v32 = [v25 syncEntityIdentifier];
          v33 = v24;
          uint64_t v34 = v29;
          uint64_t v35 = v31;
        }
        -[HDSyncAnchorRangeMap setAnchorRange:forSyncEntityIdentifier:](v33, "setAnchorRange:forSyncEntityIdentifier:", v34, v35, v32);

        v44 = [v25 sequenceNumber];
        if (v44) {
          char v45 = [v25 done] ^ 1;
        }
        else {
          char v45 = 0;
        }
        self->_hasOpenSequence = v45;

        if (v14 == ++v15)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v68 objects:v74 count:16];
          if (v14) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    v46 = objc_msgSend([NSString alloc], "initWithFormat:", @"/changeset-%04llu", self->_changesetCount);
    archiveCreator = self->_archiveCreator;
    v48 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v46 isDirectory:0];
    id v10 = v65;
    [(_HKArchiveCreator *)archiveCreator addDataToArchive:v65 pathInArchive:v48];

    ++self->_changesetCount;
    BOOL v49 = 1;
    id v11 = v64;
LABEL_36:
  }
  else
  {
    BOOL v49 = 0;
  }

  return v49;
}

- (void)finishProgress
{
  progress = self->_progress;
  self->_progress = 0;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (_HKArchiveCreator)archiveCreator
{
  return self->_archiveCreator;
}

- (NSURL)archiveURL
{
  return self->_archiveURL;
}

- (HDSyncAnchorRangeMap)pendingAnchorRangeMap
{
  return self->_pendingAnchorRangeMap;
}

- (unint64_t)changesetCount
{
  return self->_changesetCount;
}

- (void)setChangesetCount:(unint64_t)a3
{
  self->_changesetCount = a3;
}

- (unint64_t)archiveCount
{
  return self->_archiveCount;
}

- (void)setArchiveCount:(unint64_t)a3
{
  self->_archiveCount = a3;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (BOOL)hasOpenSequence
{
  return self->_hasOpenSequence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_pendingAnchorRangeMap, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
  objc_storeStrong((id *)&self->_archiveCreator, 0);
  objc_destroyWeak((id *)&self->_profile);

  objc_storeStrong((id *)&self->_syncEntityClassesWithProcessedChanges, 0);
}

@end