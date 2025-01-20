@interface HDDatabaseJournal
+ (id)_journalEntriesFromChapterEnties:(uint64_t)a1;
- (BOOL)addJournalEntries:(id)a3 profile:(id)a4 error:(id *)a5;
- (BOOL)isMerging;
- (BOOL)mergeWithProfile:(id)a3 activity:(id)a4 shouldContinueHandler:(id)a5;
- (BOOL)mergeWithProfile:(id)a3 shouldContinueHandler:(id)a4;
- (BOOL)performMergeTransactionWithProfile:(id)a3 transactionContext:(id)a4 error:(id *)a5 block:(id)a6;
- (HDDatabaseJournal)init;
- (HDDatabaseJournal)initWithType:(int64_t)a3 path:(id)a4;
- (HDDatabaseJournalDelegate)delegate;
- (NSNumber)maximumJournalBytes;
- (OS_dispatch_queue)mergeQueue;
- (double)ageOfOldestJournal;
- (id)_unitTesting_directoryURL;
- (id)description;
- (id)journalMergeInterruptions;
- (id)progressForJournalMerge;
- (int64_t)journalChapterCount;
- (int64_t)type;
- (uint64_t)_setActiveTransactionAndReturnInterrupted:(uint64_t)a1;
- (unint64_t)sizeOnDisk;
- (void)_executeAtomically:(os_unfair_lock_s *)a1;
- (void)_unitTesting_closeCurrentJournalChapter;
- (void)_unitTesting_setJournalStatusRequiresMerge;
- (void)_unitTesting_setSerializedDataEnumerationThreshold:(int64_t)a3;
- (void)dealloc;
- (void)interruptJournalMerge;
- (void)invalidate;
- (void)lock;
- (void)resetJournalMergeInterruptionsCount;
- (void)resumeJournalMerge;
- (void)setDelegate:(id)a3;
- (void)setMaximumJournalBytes:(id)a3;
- (void)unlock;
@end

@implementation HDDatabaseJournal

- (void)_executeAtomically:(os_unfair_lock_s *)a1
{
  v4 = a2;
  if (a1)
  {
    v3 = a1 + 8;
    os_unfair_lock_lock(v3);
    v4[2]();
    os_unfair_lock_unlock(v3);
  }
}

- (HDDatabaseJournal)initWithType:(int64_t)a3 path:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!a3)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HDDatabaseJournal.m", 90, @"Invalid parameter not satisfying: %@", @"type != HDDatabaseJournalTypeDefault" object file lineNumber description];
  }
  v24.receiver = self;
  v24.super_class = (Class)HDDatabaseJournal;
  v8 = [(HDDatabaseJournal *)&v24 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
    URL = v9->_URL;
    v9->_URL = (NSURL *)v10;

    v9->_journalLock._os_unfair_lock_opaque = 0;
    uint64_t v12 = HKCreateSerialDispatchQueue();
    mergeQueue = v9->_mergeQueue;
    v9->_mergeQueue = (OS_dispatch_queue *)v12;

    v9->_progressLock._os_unfair_lock_opaque = 0;
    *(void *)&v9->_interruptionLock._os_unfair_lock_opaque = 0;
    v9->_activeTransactionLock._os_unfair_lock_opaque = 0;
    v9->_journalStatus = 0;
    lastInsertedEntryClassName = v9->_lastInsertedEntryClassName;
    v9->_lastInsertedEntryClassName = 0;

    v9->_serializedDataEnumerationThreshold = 0x10000;
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    journalMergeInterruptions = v9->_journalMergeInterruptions;
    v9->_journalMergeInterruptions = v15;

    v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    if (([v17 fileExistsAtPath:v7 isDirectory:0] & 1) == 0)
    {
      id v23 = 0;
      char v18 = [v17 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v23];
      id v19 = v23;
      if ((v18 & 1) == 0)
      {
        _HKInitializeLogging();
        v20 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v26 = v7;
          __int16 v27 = 2114;
          id v28 = v19;
          _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "Error creating journal directory %{public}@: %{public}@", buf, 0x16u);
        }
      }
    }
  }

  return v9;
}

- (HDDatabaseJournal)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (void)dealloc
{
  [(HDJournalChapter *)self->_currentJournalChapter close];
  v3.receiver = self;
  v3.super_class = (Class)HDDatabaseJournal;
  [(HDDatabaseJournal *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = HDStringFromDatabaseJournalType(self->_type);
  unint64_t journalStatus = self->_journalStatus;
  if (journalStatus >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unexpected (%ld)", self->_journalStatus);
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = off_1E6300F40[journalStatus];
  }
  int v8 = [(HDJournalChapter *)self->_currentJournalChapter isOpen];
  v9 = @"Closed";
  if (v8) {
    v9 = @"Open";
  }
  uint64_t v10 = [v3 stringWithFormat:@"<%@:%p, %@, %@, %@>", v4, self, v5, v7, v9];

  return v10;
}

- (void)lock
{
}

- (void)unlock
{
}

- (BOOL)addJournalEntries:(id)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v54 = a4;
  os_unfair_lock_assert_owner(&self->_journalLock);
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 100, @"Journal has already been invalidated.");
    BOOL v8 = 0;
    goto LABEL_55;
  }
  v53 = a5;
  self->_unint64_t journalStatus = 2;
  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
  {
    v46 = v9;
    uint64_t v47 = [v55 count];
    v48 = [(NSURL *)self->_URL path];
    *(_DWORD *)buf = 134218242;
    uint64_t v77 = v47;
    __int16 v78 = 2114;
    uint64_t v79 = (uint64_t)v48;
    _os_log_debug_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_DEBUG, "Appending %lu journal entries to %{public}@", buf, 0x16u);
  }
  uint64_t v10 = [(HDDatabaseJournal *)self maximumJournalBytes];
  if (v10) {
    unint64_t v63 = [(HDDatabaseJournal *)self sizeOnDisk];
  }
  else {
    unint64_t v63 = 0;
  }
  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v55;
  uint64_t v61 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
  if (!v61)
  {
    uint64_t v58 = 0;
    v62 = 0;
    goto LABEL_44;
  }
  uint64_t v58 = 0;
  v62 = 0;
  uint64_t v60 = *(void *)v73;
  v59 = v10;
LABEL_10:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v73 != v60) {
      objc_enumerationMutation(obj);
    }
    uint64_t v12 = *(void *)(*((void *)&v72 + 1) + 8 * v11);
    v13 = (void *)MEMORY[0x1C187C0E0]();
    id v71 = 0;
    v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v71];
    id v15 = v71;
    if (v10)
    {
      unint64_t v16 = [v10 unsignedLongValue];
      if ([v14 length] + v63 > v16) {
        break;
      }
    }
    uint64_t v64 = v11;
    v65 = v13;
    if (v14)
    {
      char v17 = 1;
      while (1)
      {
        char v18 = v17;
        uint64_t v19 = objc_opt_class();
        id v70 = v15;
        id v20 = v14;
        if ([v20 length])
        {
          if (([(HDJournalChapter *)self->_currentJournalChapter canAppendData:v20] & 1) == 0) {
            [(HDJournalChapter *)self->_currentJournalChapter close];
          }
          if ([(HDJournalChapter *)self->_currentJournalChapter isOpen])
          {
LABEL_25:
            LOBYTE(v21) = [(HDJournalChapter *)self->_currentJournalChapter appendData:v20 entryClass:v19 error:&v70];
            goto LABEL_29;
          }
          uint64_t v21 = +[HDJournalChapterEnumerator nextJournalChapterNameForURL:self->_URL];
          if (v21)
          {
            v22 = [HDDatabaseJournalDatabase alloc];
            id v23 = [(NSURL *)self->_URL URLByAppendingPathComponent:v21];
            objc_super v24 = [(HDDatabaseJournalDatabase *)v22 initWithURL:v23];
            currentJournalChapter = self->_currentJournalChapter;
            self->_currentJournalChapter = v24;

            _HKInitializeLogging();
            id v26 = *MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
            {
              uint64_t v29 = self->_currentJournalChapter;
              *(_DWORD *)buf = 138543362;
              uint64_t v77 = (uint64_t)v29;
              _os_log_debug_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEBUG, "Creating new journal chapter %{public}@", buf, 0xCu);
            }
            int v27 = [(HDJournalChapter *)self->_currentJournalChapter createAndOpenForWritingWithError:&v70];

            if (v27) {
              goto LABEL_25;
            }
            LOBYTE(v21) = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v70, 102, @"Unable to create journal name");
          }
        }
        else
        {
          LOBYTE(v21) = 1;
        }
LABEL_29:

        id v28 = v70;
        if (v21)
        {
          ++v58;
          v30 = (objc_class *)objc_opt_class();
          v31 = NSStringFromClass(v30);
          v32 = [v56 objectForKeyedSubscript:v31];
          unint64_t v33 = [v32 integerValue];
          unint64_t v34 = [v20 length];
          if (v33 <= v34) {
            unint64_t v35 = v34;
          }
          else {
            unint64_t v35 = v33;
          }
          v36 = [NSNumber numberWithInteger:v35 >> 10];
          [v56 setObject:v36 forKeyedSubscript:v31];

          v63 += [v20 length];
          goto LABEL_39;
        }
        char v17 = 0;
        id v15 = v28;
        if ((v18 & 1) == 0) {
          goto LABEL_33;
        }
      }
    }
    id v28 = v15;
LABEL_33:
    if (!v62)
    {
      id v28 = v28;
      v62 = v28;
    }
LABEL_39:
    uint64_t v10 = v59;

    uint64_t v11 = v64 + 1;
    if (v64 + 1 == v61)
    {
      uint64_t v61 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
      if (!v61) {
        goto LABEL_44;
      }
      goto LABEL_10;
    }
  }
  uint64_t v37 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 123, @"Cannot append journal entry of %lu bytes: current size is %lu and maximum is %zu", objc_msgSend(v14, "length"), v63, v16);

  v62 = (void *)v37;
LABEL_44:

  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __53__HDDatabaseJournal_addJournalEntries_profile_error___block_invoke;
  v67[3] = &unk_1E6300E60;
  id v68 = v54;
  v69 = self;
  [v56 enumerateKeysAndObjectsUsingBlock:v67];
  BOOL v8 = v62 == 0;
  if (v62)
  {
    _HKInitializeLogging();
    v38 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      v49 = v38;
      uint64_t v50 = [obj count];
      v51 = [(NSURL *)self->_URL path];
      *(_DWORD *)buf = 134218754;
      uint64_t v77 = v58;
      __int16 v78 = 2048;
      uint64_t v79 = v50;
      __int16 v80 = 2114;
      v81 = v51;
      __int16 v82 = 2114;
      v83 = v62;
      _os_log_error_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_ERROR, "Added %lu of %lu entries to %{public}@, error: %{public}@", buf, 0x2Au);
    }
  }
  v39 = self->_currentJournalChapter;
  id v66 = 0;
  char v40 = [(HDJournalChapter *)v39 flushDataToDisk:&v66];
  id v41 = v66;
  if ((v40 & 1) == 0)
  {
    _HKInitializeLogging();
    v42 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      v52 = self->_currentJournalChapter;
      *(_DWORD *)buf = 138543618;
      uint64_t v77 = (uint64_t)v52;
      __int16 v78 = 2114;
      uint64_t v79 = (uint64_t)v41;
      _os_log_error_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_ERROR, "Failed to flush data to %{public}@: %{public}@", buf, 0x16u);
    }
  }
  id v43 = v62;
  v44 = v43;
  if (v62)
  {
    if (v53) {
      id *v53 = v43;
    }
    else {
      _HKLogDroppedError();
    }
  }

LABEL_55:
  return v8;
}

void __53__HDDatabaseJournal_addJournalEntries_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 daemon];
  BOOL v8 = [v9 analyticsSubmissionCoordinator];
  objc_msgSend(v8, "database_reportJournalEntryInsertedForJournal:entryClass:entrySize:", *(void *)(*(void *)(a1 + 40) + 104), v7, v6);
}

- (BOOL)performMergeTransactionWithProfile:(id)a3 transactionContext:(id)a4 error:(id *)a5 block:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v13 = [a3 database];
  if (!v13)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HDDatabaseJournal.m", 236, @"Invalid parameter not satisfying: %@", @"database != nil" object file lineNumber description];

    if (self) {
      goto LABEL_3;
    }
LABEL_9:
    char v17 = 0;
    goto LABEL_7;
  }
  if (!self) {
    goto LABEL_9;
  }
LABEL_3:
  v14 = (void *)[v11 mutableCopy];
  id v15 = v14;
  if (v14) {
    unint64_t v16 = v14;
  }
  else {
    unint64_t v16 = objc_alloc_init(HDMutableDatabaseTransactionContext);
  }
  char v17 = v16;

  [(HDMutableDatabaseTransactionContext *)v17 setSkipJournalMerge:1];
  [(HDMutableDatabaseTransactionContext *)v17 setJournalType:self->_type];
  [(HDMutableDatabaseTransactionContext *)v17 setRequiresWrite:1];
  [(HDMutableDatabaseTransactionContext *)v17 setRequiresProtectedData:1];
LABEL_7:
  char v18 = [v13 performTransactionWithContext:v17 error:a5 block:v12 inaccessibilityHandler:0];

  return v18;
}

- (id)progressForJournalMerge
{
  p_progressLock = &self->_progressLock;
  os_unfair_lock_lock(&self->_progressLock);
  if (self->_progressLock_observableProgress)
  {
    objc_msgSend(MEMORY[0x1E4F28F90], "hd_progressMirroringProgress:");
    uint64_t v4 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_progressLock);
  }
  else
  {
    v5 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
    progressLock_observableProgress = self->_progressLock_observableProgress;
    self->_progressLock_observableProgress = v5;

    os_unfair_lock_unlock(p_progressLock);
    uint64_t v4 = self->_progressLock_observableProgress;
  }

  return v4;
}

- (BOOL)mergeWithProfile:(id)a3 shouldContinueHandler:(id)a4
{
  return [(HDDatabaseJournal *)self mergeWithProfile:a3 activity:0 shouldContinueHandler:a4];
}

- (BOOL)mergeWithProfile:(id)a3 activity:(id)a4 shouldContinueHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 1;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __69__HDDatabaseJournal_mergeWithProfile_activity_shouldContinueHandler___block_invoke;
  id v20 = &unk_1E6300E88;
  uint64_t v21 = self;
  v25 = &v31;
  id v11 = v8;
  id v22 = v11;
  id v12 = v9;
  id v23 = v12;
  id v13 = v10;
  id v24 = v13;
  id v26 = &v27;
  -[HDDatabaseJournal _executeAtomically:]((os_unfair_lock_s *)self, &v17);
  if (*((unsigned char *)v32 + 24))
  {
    if (*((unsigned char *)v28 + 24))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "databaseJournalMergeDidComplete:", self, v17, v18, v19, v20, v21, v22, v23);

      BOOL v15 = *((unsigned char *)v32 + 24) != 0;
    }
    else
    {
      BOOL v15 = 1;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v15;
}

void __69__HDDatabaseJournal_mergeWithProfile_activity_shouldContinueHandler___block_invoke(uint64_t a1)
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 65))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  else if (*(void *)(v2 + 56) != 1)
  {
    objc_super v3 = [*(id *)(a1 + 40) database];
    uint64_t v4 = [v3 contentProtectionManager];
    uint64_t v5 = [v4 observedState];

    if (v5 == 2)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      _HKInitializeLogging();
      id v6 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v7;
        _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Trying to merge journals when device is locked", buf, 0xCu);
      }
    }
    else
    {
      id v82 = +[HKDaemonTransaction transactionWithOwner:*(void *)(a1 + 32)];
      *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v85 = *(void *)(a1 + 48);
      id v9 = *(void **)(a1 + 56);
      id v89 = *(id *)(a1 + 40);
      id v86 = v9;
      if (v8)
      {
        v90 = [[HDJournalChapterEnumerator alloc] initWithURL:*(void *)(v8 + 136)];
        uint64_t v95 = v8;
        if ([(HDJournalChapterEnumerator *)v90 hasJournalChapters])
        {
          id v10 = (objc_class *)objc_opt_class();
          uint64_t v79 = NSStringFromClass(v10);
          id v11 = [v89 database];
          id v98 = 0;
          v84 = [v11 takeAccessibilityAssertionWithOwnerIdentifier:v79 shouldPerformTransaction:0 timeout:&v98 error:600.0];
          id v78 = v98;

          if (v84)
          {
            id v97 = 0;
            BOOL v12 = [(HDJournalChapterEnumerator *)v90 loadSortedJournalChaptersWithError:&v97];
            id v77 = v97;
            if (v12)
            {
              uint64_t v13 = v8;
              lock = (os_unfair_lock_s *)(v8 + 8);
              os_unfair_lock_lock((os_unfair_lock_t)(v8 + 8));
              if (!*(void *)(v8 + 16))
              {
                uint64_t v14 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
                BOOL v15 = *(void **)(v8 + 16);
                *(void *)(v8 + 16) = v14;

                uint64_t v13 = v8;
              }
              unint64_t v16 = *(void **)(v13 + 24);
              if (v16)
              {
                objc_msgSend(*(id *)(v8 + 24), "setTotalUnitCount:", -[HDJournalChapterEnumerator totalJournalChapterCount](v90, "totalJournalChapterCount")+ objc_msgSend(v16, "completedUnitCount"));
              }
              else
              {
                uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", -[HDJournalChapterEnumerator totalJournalChapterCount](v90, "totalJournalChapterCount"));
                id v22 = *(void **)(v8 + 24);
                *(void *)(v8 + 24) = v21;

                [*(id *)(v8 + 16) addChild:*(void *)(v8 + 24) withPendingUnitCount:1];
              }
              id v75 = *(id *)(v8 + 24);
              os_unfair_lock_unlock(lock);
              if (![(HDJournalChapterEnumerator *)v90 hasMoreJournalChapters])
              {
                char v66 = 0;
                goto LABEL_93;
              }
              __int16 v80 = (os_unfair_lock_s *)(v8 + 40);
LABEL_29:
              id v96 = 0;
              v81 = [(HDJournalChapterEnumerator *)v90 nextOpenJournalChapterError:&v96];
              id v74 = v96;
              if (v81)
              {
                uint64_t v88 = 0;
                uint64_t v23 = 0;
                while (1)
                {
                  os_unfair_lock_lock(v80);
                  os_unfair_lock_unlock(v80);
                  uint64_t v92 = v23;
                  if (v23 < 1)
                  {
                    v94 = 0;
                  }
                  else
                  {
                    if (v85) {
                      objc_msgSend(NSString, "stringWithFormat:", @"%ld", v23 + 1);
                    }
                    else {
                    id v24 = objc_msgSend(NSString, "stringWithFormat:", @"(%ld / %ld)", v23 + 1, 10);
                    }
                    v94 = [NSString stringWithFormat:@"Retrying, attempt %@", v24];
                  }
                  if (v88 >= 1)
                  {
                    uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Continuing (%ld)", v88);

                    v94 = (__CFString *)v25;
                  }
                  _HKInitializeLogging();
                  id v26 = (void *)*MEMORY[0x1E4F29F18];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
                  {
                    if (v94) {
                      uint64_t v27 = v94;
                    }
                    else {
                      uint64_t v27 = @"Starting";
                    }
                    id v28 = v26;
                    uint64_t v29 = [(HDJournalChapterEnumerator *)v90 currentJournalChapterIndex];
                    uint64_t v30 = [(HDJournalChapterEnumerator *)v90 totalJournalChapterCount];
                    *(_DWORD *)buf = 138413058;
                    *(void *)&uint8_t buf[4] = v27;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v81;
                    *(_WORD *)&buf[22] = 2048;
                    v108 = (void *)v29;
                    LOWORD(v109) = 2048;
                    *(void *)((char *)&v109 + 2) = v30;
                    _os_log_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_DEFAULT, "%@ journal merge for %{public}@ (%ld of %ld)", buf, 0x2Au);
                  }
                  id v31 = v81;
                  id v32 = v89;
                  id v91 = v84;
                  id v33 = v86;
                  id v34 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
                  os_signpost_id_t v35 = _HKLogSignpostIDGenerate();
                  _HKInitializeLogging();
                  v36 = (void *)*MEMORY[0x1E4F29F18];
                  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29F18]))
                  {
                    uint64_t v37 = v36;
                    v38 = v37;
                    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
                    {
                      v39 = [v31 name];
                      LODWORD(v115) = 138543362;
                      *(void *)((char *)&v115 + 4) = v39;
                      _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v35, "merge-journal-chapter", "chapter=%{public}@", (uint8_t *)&v115, 0xCu);
                    }
                  }
                  *(void *)&long long v115 = 0;
                  *((void *)&v115 + 1) = &v115;
                  uint64_t v116 = 0x2020000000;
                  int v117 = 0;
                  *(void *)buf = MEMORY[0x1E4F143A8];
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&buf[16] = __95__HDDatabaseJournal__mergeJournalChapter_profile_accessibilityAssertion_shouldContinueHandler___block_invoke;
                  v108 = &unk_1E6300F00;
                  *(void *)&long long v109 = v95;
                  v113 = &v115;
                  id v87 = v31;
                  *((void *)&v109 + 1) = v87;
                  os_signpost_id_t v114 = v35;
                  id v40 = v32;
                  id v110 = v40;
                  id v83 = v33;
                  id v112 = v83;
                  id v41 = v34;
                  id v111 = v41;
                  v42 = _Block_copy(buf);
                  id v43 = [v40 dataManager];
                  [v43 openObserverTransaction];

                  v44 = [v40 userDomainConceptManager];
                  [v44 openObserverTransaction];

                  v45 = *(void **)(v95 + 72);
                  *(void *)(v95 + 72) = 0;

                  v46 = objc_alloc_init(HDMutableDatabaseTransactionContext);
                  [(HDMutableDatabaseTransactionContext *)v46 setCacheScope:1];
                  [(HDMutableDatabaseTransactionContext *)v46 addAccessibilityAssertion:v91];
                  id v100 = 0;
                  int v47 = [(id)v95 performMergeTransactionWithProfile:v40 transactionContext:v46 error:&v100 block:v42];
                  id v48 = v100;
                  -[HDDatabaseJournal _setActiveTransactionAndReturnInterrupted:](v95, 0);
                  v49 = [v40 dataManager];
                  [v49 closeObserverTransaction];

                  uint64_t v50 = [v40 userDomainConceptManager];
                  [v50 closeObserverTransaction];

                  _HKInitializeLogging();
                  v51 = (void *)*MEMORY[0x1E4F29F18];
                  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29F18]))
                  {
                    v52 = v51;
                    v53 = v52;
                    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
                    {
                      id v54 = [v87 name];
                      *(_DWORD *)v101 = 138543618;
                      v102 = v54;
                      __int16 v103 = 1024;
                      LODWORD(v104) = v47;
                      _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v53, OS_SIGNPOST_INTERVAL_END, v35, "merge-journal-chapter", "chapter=%{public}@ success=%{BOOL}d", v101, 0x12u);
                    }
                  }
                  if (v47)
                  {
                    if ((*(_DWORD *)(*((void *)&v115 + 1) + 24) - 2) > 2
                      || ([*(id *)(v95 + 144) close], *(_DWORD *)(*((void *)&v115 + 1) + 24) == 4))
                    {
                      id v55 = v48;
                    }
                    else
                    {
                      [v87 close];
                      id v99 = v48;
                      char v63 = [v87 removeWithError:&v99];
                      id v55 = v99;

                      if ((v63 & 1) == 0)
                      {
                        _HKInitializeLogging();
                        uint64_t v64 = *MEMORY[0x1E4F29F18];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)v101 = 138543618;
                          v102 = v81;
                          __int16 v103 = 2114;
                          id v104 = v55;
                          _os_log_error_impl(&dword_1BCB7D000, v64, OS_LOG_TYPE_ERROR, "An error occurred while removing %{public}@: %{public}@", v101, 0x16u);
                        }
                      }
                    }
                    int v56 = *(_DWORD *)(*((void *)&v115 + 1) + 24);
                    id v48 = v55;
                  }
                  else if (objc_msgSend(v48, "hk_isTransactionInterruptedError"))
                  {
                    _HKInitializeLogging();
                    v57 = (id)*MEMORY[0x1E4F29F18];
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v58 = [*(id *)(v95 + 136) path];
                      v59 = *(void **)(v95 + 72);
                      uint64_t v60 = [NSString stringWithFormat:@" with original error: %@", v48];
                      *(_DWORD *)v101 = 138543874;
                      v102 = v58;
                      __int16 v103 = 2114;
                      id v104 = v59;
                      __int16 v105 = 2112;
                      v106 = v60;
                      _os_log_impl(&dword_1BCB7D000, v57, OS_LOG_TYPE_DEFAULT, "Journal merge transaction for %{public}@ (%{public}@) was interrupted%@", v101, 0x20u);
                    }
                    int v56 = 1;
                  }
                  else
                  {
                    _HKInitializeLogging();
                    uint64_t v61 = *MEMORY[0x1E4F29F18];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v101 = 138543618;
                      v102 = v81;
                      __int16 v103 = 2114;
                      id v104 = v48;
                      _os_log_error_impl(&dword_1BCB7D000, v61, OS_LOG_TYPE_ERROR, "Merge transaction aborted for %{public}@; bailing out of journal merge: %{public}@",
                        v101,
                        0x16u);
                    }
                    int v56 = 0;
                  }

                  _Block_object_dispose(&v115, 8);
                  if (v56 == 1)
                  {
                    uint64_t v88 = 0;
                    uint64_t v93 = v92 + 1;
                  }
                  else
                  {
                    if (v56 != 4)
                    {
                      if (v56)
                      {

                        if (v92 <= 9 || v85 != 0)
                        {
                          if (v75) {
                            objc_msgSend(v75, "setCompletedUnitCount:", objc_msgSend(v75, "completedUnitCount") + 1);
                          }

                          char v66 = 0;
                          if ([(HDJournalChapterEnumerator *)v90 hasMoreJournalChapters]) {
                            goto LABEL_29;
                          }
                          goto LABEL_93;
                        }
                      }
                      else
                      {

                        BOOL v67 = v85 != 0;
                        if (v92 < 10) {
                          BOOL v67 = 1;
                        }
                        if (v67) {
                          goto LABEL_92;
                        }
                      }
LABEL_91:
                      _HKInitializeLogging();
                      id v68 = *MEMORY[0x1E4F29F18];
                      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR)) {
                        goto LABEL_92;
                      }
                      *(_DWORD *)buf = 138412290;
                      *(void *)&uint8_t buf[4] = v81;
                      long long v73 = "Used maximum retry attempts for %@";
                      goto LABEL_103;
                    }
                    uint64_t v93 = 0;
                    ++v88;
                  }

                  uint64_t v23 = v93;
                  if (v93 >= 10 && v85 == 0) {
                    goto LABEL_91;
                  }
                }
              }
              _HKInitializeLogging();
              id v68 = *MEMORY[0x1E4F29F18];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v74;
                long long v73 = "Could not get next journal chapter %{public}@";
LABEL_103:
                _os_log_error_impl(&dword_1BCB7D000, v68, OS_LOG_TYPE_ERROR, v73, buf, 0xCu);
              }
LABEL_92:

              char v66 = 1;
LABEL_93:
              [v84 invalidate];
              [(HDJournalChapterEnumerator *)v90 closeJournalChapters];
              if ((v66 & 1) == 0)
              {
                os_unfair_lock_lock(lock);
                v69 = *(void **)(v95 + 24);
                *(void *)(v95 + 24) = 0;

                id v70 = *(void **)(v95 + 16);
                *(void *)(v95 + 16) = 0;

                os_unfair_lock_unlock(lock);
                *(void *)(v95 + 56) = 1;
              }

              char v18 = v66 ^ 1;
            }
            else
            {
              _HKInitializeLogging();
              id v20 = *MEMORY[0x1E4F29F18];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v77;
                _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "Failed to load sorted journal chapters: %{public}@", buf, 0xCu);
              }
              [v84 invalidate];
              char v18 = 0;
            }
          }
          else
          {
            _HKInitializeLogging();
            uint64_t v19 = *MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v78;
              _os_log_debug_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEBUG, "Failed to acquire database accessibility assertion for journal merge: %{public}@", buf, 0xCu);
            }
            char v18 = 0;
          }
        }
        else
        {
          if (*(void *)(v8 + 104) != 1)
          {
            _HKInitializeLogging();
            uint64_t v17 = (void *)*MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
            {
              uint64_t v71 = *(void *)(v8 + 136);
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v71;
              long long v72 = v17;
              _os_log_debug_impl(&dword_1BCB7D000, v72, OS_LOG_TYPE_DEBUG, "No journal chapter files to merge in %{public}@", buf, 0xCu);
            }
          }
          char v18 = 1;
          *(void *)(v8 + 56) = 1;
        }
      }
      else
      {
        char v18 = 0;
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v18;
      *(unsigned char *)(*(void *)(a1 + 32) + 96) = 0;
      [v82 invalidate];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    }
  }
}

- (void)interruptJournalMerge
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_interruptionsInfoLock = &self->_interruptionsInfoLock;
  os_unfair_lock_lock(&self->_interruptionsInfoLock);
  uint64_t v4 = [NSString stringWithUTF8String:dispatch_queue_get_label(0)];
  uint64_t v5 = [(NSMutableDictionary *)self->_journalMergeInterruptions objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 unsignedIntValue];

  journalMergeInterruptions = self->_journalMergeInterruptions;
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v6 + 1];
  [(NSMutableDictionary *)journalMergeInterruptions setObject:v8 forKey:v4];

  os_unfair_lock_unlock(p_interruptionsInfoLock);
  os_unfair_lock_lock(&self->_interruptionLock);
  os_unfair_lock_lock(&self->_activeTransactionLock);
  self->_interrupted = 1;
  if (self->_activeMergeTransaction)
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v4;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Journal merge interruption requested on %@", (uint8_t *)&v10, 0x16u);
    }
    [(HDDatabaseTransaction *)self->_activeMergeTransaction requestTransactionInterruption];
  }
  os_unfair_lock_unlock(&self->_activeTransactionLock);
}

- (void)resumeJournalMerge
{
  p_activeTransactionLock = &self->_activeTransactionLock;
  os_unfair_lock_lock(&self->_activeTransactionLock);
  self->_interrupted = 0;
  os_unfair_lock_unlock(p_activeTransactionLock);

  os_unfair_lock_unlock(&self->_interruptionLock);
}

- (void)invalidate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __31__HDDatabaseJournal_invalidate__block_invoke;
  v2[3] = &unk_1E62F3208;
  v2[4] = self;
  -[HDDatabaseJournal _executeAtomically:]((os_unfair_lock_s *)self, v2);
}

uint64_t __31__HDDatabaseJournal_invalidate__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 65) = 1;
  return [*(id *)(*(void *)(a1 + 32) + 144) close];
}

- (int64_t)journalChapterCount
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__HDDatabaseJournal_journalChapterCount__block_invoke;
  v4[3] = &unk_1E62F3230;
  v4[4] = self;
  v4[5] = &v5;
  -[HDDatabaseJournal _executeAtomically:]((os_unfair_lock_s *)self, v4);
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

int64_t __40__HDDatabaseJournal_journalChapterCount__block_invoke(uint64_t a1)
{
  int64_t result = +[HDJournalChapterEnumerator journalChapterCountForURL:*(void *)(*(void *)(a1 + 32) + 136)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)sizeOnDisk
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if (self) {
    URL = self->_URL;
  }
  else {
    URL = 0;
  }
  uint64_t v5 = *MEMORY[0x1E4F1C670];
  uint64_t v6 = *MEMORY[0x1E4F1C720];
  v46[0] = *MEMORY[0x1E4F1C670];
  v46[1] = v6;
  uint64_t v30 = v6;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v8 = URL;
  id v9 = [v7 arrayWithObjects:v46 count:2];
  uint64_t v29 = v3;
  int v10 = [v3 enumeratorAtURL:v8 includingPropertiesForKeys:v9 options:0 errorHandler:&__block_literal_global_106];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    unint64_t v31 = 0;
    uint64_t v14 = *(void *)v38;
    while (1)
    {
      uint64_t v15 = 0;
      uint64_t v32 = v13;
      do
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(v11);
        }
        unint64_t v16 = *(void **)(*((void *)&v37 + 1) + 8 * v15);
        id v35 = 0;
        id v36 = 0;
        char v17 = [v16 getResourceValue:&v36 forKey:v5 error:&v35];
        id v18 = v36;
        id v19 = v35;
        if ((v17 & 1) == 0)
        {
          _HKInitializeLogging();
          id v26 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v42 = v16;
            __int16 v43 = 2114;
            id v44 = v19;
            _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_INFO, "Failed to retrieve file type during size computation: %{public}@ (%{public}@)", buf, 0x16u);
          }
LABEL_14:
          id v25 = v19;
          goto LABEL_18;
        }
        if (![v18 BOOLValue]) {
          goto LABEL_14;
        }
        uint64_t v20 = v14;
        uint64_t v21 = v5;
        id v22 = v11;
        id v33 = 0;
        id v34 = 0;
        char v23 = [v16 getResourceValue:&v34 forKey:v30 error:&v33];
        id v24 = v34;
        id v25 = v33;

        if (v23)
        {
          v31 += [v24 longLongValue];
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v27 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v42 = v16;
            __int16 v43 = 2114;
            id v44 = v25;
            _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_INFO, "Failed to retrieve file size during size computation: %{public}@ (%{public}@)", buf, 0x16u);
          }
        }
        id v11 = v22;

        uint64_t v5 = v21;
        uint64_t v14 = v20;
        uint64_t v13 = v32;
LABEL_18:

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (!v13) {
        goto LABEL_22;
      }
    }
  }
  unint64_t v31 = 0;
LABEL_22:

  return v31;
}

uint64_t __31__HDDatabaseJournal_sizeOnDisk__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
  {
    int v8 = 138543618;
    id v9 = v4;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, "Failed to enumerate URL during size computation: %{public}@ (%{public}@)", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

- (double)ageOfOldestJournal
{
  v53[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if (self) {
    URL = self->_URL;
  }
  else {
    URL = 0;
  }
  uint64_t v5 = *MEMORY[0x1E4F1C670];
  uint64_t v6 = *MEMORY[0x1E4F1C540];
  v53[0] = *MEMORY[0x1E4F1C670];
  v53[1] = v6;
  uint64_t v34 = v6;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
  int v8 = URL;
  id v9 = [v7 arrayWithObjects:v53 count:2];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __39__HDDatabaseJournal_ageOfOldestJournal__block_invoke;
  v43[3] = &unk_1E6300EB0;
  v43[4] = self;
  unint64_t v31 = v3;
  __int16 v10 = [v3 enumeratorAtURL:v8 includingPropertiesForKeys:v9 options:0 errorHandler:v43];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v32 = self;
    uint64_t v14 = *(void *)v40;
    double v15 = 0.0;
    uint64_t v33 = *(void *)v40;
    while (1)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v11);
        }
        char v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v37 = 0;
        id v38 = 0;
        char v18 = [v17 getResourceValue:&v38 forKey:v5 error:&v37];
        id v19 = v38;
        id v20 = v37;
        if ((v18 & 1) == 0)
        {
          _HKInitializeLogging();
          id v28 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v45 = v32;
            __int16 v46 = 2114;
            int v47 = v17;
            __int16 v48 = 2114;
            id v49 = v20;
            _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to retrieve file type during journal age computation: %{public}@ (%{public}@)", buf, 0x20u);
          }
LABEL_17:
          id v25 = v20;
          goto LABEL_21;
        }
        if (![v19 BOOLValue]) {
          goto LABEL_17;
        }
        uint64_t v21 = v5;
        id v22 = v11;
        id v35 = 0;
        id v36 = 0;
        char v23 = [v17 getResourceValue:&v36 forKey:v34 error:&v35];
        id v24 = v36;
        id v25 = v35;

        if (v23)
        {
          [v24 timeIntervalSinceNow];
          if (v15 < v26) {
            double v15 = v26;
          }
          _HKInitializeLogging();
          uint64_t v27 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138544130;
            v45 = v32;
            __int16 v46 = 2112;
            int v47 = v17;
            __int16 v48 = 2114;
            id v49 = v24;
            __int16 v50 = 2050;
            double v51 = v15;
            _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Journal file %@ creation date %{public}@, oldest age %{public}f", buf, 0x2Au);
          }
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v29 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v45 = v32;
            __int16 v46 = 2114;
            int v47 = v17;
            __int16 v48 = 2114;
            id v49 = v25;
            _os_log_error_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to retrieve file size during journal age computation: %{public}@ (%{public}@)", buf, 0x20u);
          }
        }
        id v11 = v22;

        uint64_t v5 = v21;
        uint64_t v14 = v33;
LABEL_21:
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v52 count:16];
      if (!v13) {
        goto LABEL_25;
      }
    }
  }
  double v15 = 0.0;
LABEL_25:

  return v15;
}

uint64_t __39__HDDatabaseJournal_ageOfOldestJournal__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543874;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v5;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to enumerate URL during journal age computation: %{public}@ (%{public}@)", (uint8_t *)&v10, 0x20u);
  }

  return 1;
}

uint64_t __95__HDDatabaseJournal__mergeJournalChapter_profile_accessibilityAssertion_shouldContinueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (-[HDDatabaseJournal _setActiveTransactionAndReturnInterrupted:](*(void *)(a1 + 32), v5))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_transactionInterruptedError");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (a3) {
        *a3 = v6;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8);
    int v25 = 1;
    goto LABEL_19;
  }
  int v7 = [*(id *)(a1 + 40) readVersionWithError:a3];
  if (!v7)
  {
    uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8);
    int v25 = 2;
LABEL_19:
    *(_DWORD *)(v24 + 24) = v25;
    goto LABEL_33;
  }
  int v8 = v7;
  _HKInitializeLogging();
  uint64_t v9 = (id *)MEMORY[0x1E4F29F18];
  int v10 = (void *)*MEMORY[0x1E4F29F18];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29F18]))
  {
    uint64_t v11 = v10;
    __int16 v12 = v11;
    os_signpost_id_t v13 = *(void *)(a1 + 80);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      __int16 v14 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138543362;
      id v48 = v14;
      _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "merge-journal-chapter-load-entries", "chapter=%{public}@", buf, 0xCu);
    }
  }
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  id v15 = *(void **)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);
  id v42 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __95__HDDatabaseJournal__mergeJournalChapter_profile_accessibilityAssertion_shouldContinueHandler___block_invoke_343;
  v33[3] = &unk_1E6300ED8;
  uint64_t v40 = *(void *)(a1 + 80);
  id v34 = v15;
  id v38 = *(id *)(a1 + 64);
  long long v39 = &v43;
  uint64_t v35 = *(void *)(a1 + 32);
  id v36 = *(id *)(a1 + 48);
  int v41 = v8;
  id v37 = v5;
  LODWORD(v16) = [v34 enumerateEntriesWithProfile:v16 transaction:v37 error:&v42 handler:v33];
  id v17 = v42;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v16;
  unsigned int v18 = *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v18 < 2)
  {
    _HKInitializeLogging();
    id v19 = *v9;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      double v26 = HDStringFromJournalProcessingResult(*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
      uint64_t v27 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v48 = v26;
      __int16 v49 = 2114;
      id v50 = v27;
      __int16 v51 = 2114;
      double v52 = *(double *)&v17;
      _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "A transient error (%{public}@) was encountered processing %{public}@, error: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    if (v18 - 3 >= 2)
    {
      if (v18 == 2)
      {
        _HKInitializeLogging();
        id v28 = *v9;
        if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v32 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          id v48 = v32;
          __int16 v49 = 2114;
          id v50 = v17;
          _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "A fatal error occurred while processing %{public}@, error: %{public}@", buf, 0x16u);
        }
      }
      goto LABEL_26;
    }
    _HKInitializeLogging();
    id v19 = *v9;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      HDStringFromJournalProcessingResult(*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = *(void **)(a1 + 40);
      unint64_t v22 = v44[3];
      [*(id *)(a1 + 56) timeIntervalSinceNow];
      *(_DWORD *)buf = 138544130;
      id v48 = v20;
      __int16 v49 = 2114;
      id v50 = v21;
      __int16 v51 = 2048;
      double v52 = (double)v22 * 0.0009765625;
      __int16 v53 = 2048;
      double v54 = -v23;
      _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ processing %{public}@ (%0.1lfkb), time: %.2f sec.", buf, 0x2Au);
    }
  }

LABEL_26:
  if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) - 3) >= 2)
  {
    id v29 = v17;
    uint64_t v30 = v29;
    if (v29)
    {
      if (a3) {
        *a3 = v29;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  _Block_object_dispose(&v43, 8);

LABEL_33:
  return 1;
}

- (uint64_t)_setActiveTransactionAndReturnInterrupted:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v5 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    if (v4 && !*(void *)(a1 + 48) && *(unsigned char *)(a1 + 64))
    {
      [v4 requestTransactionInterruption];
      [v4 requireRollback];
    }
    objc_storeStrong((id *)(a1 + 48), a2);
    a1 = *(unsigned char *)(a1 + 64) != 0;
    os_unfair_lock_unlock(v5);
  }

  return a1;
}

uint64_t __95__HDDatabaseJournal__mergeJournalChapter_profile_accessibilityAssertion_shouldContinueHandler___block_invoke_343(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v70 = a2;
  _HKInitializeLogging();
  int v8 = (void *)*MEMORY[0x1E4F29F18];
  uint64_t v71 = a1;
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29F18]))
  {
    uint64_t v9 = v8;
    int v10 = v9;
    os_signpost_id_t v11 = *(void *)(a1 + 80);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      __int16 v12 = [*(id *)(v71 + 32) name];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v12;
      _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v10, OS_SIGNPOST_INTERVAL_END, v11, "merge-journal-chapter-load-entries", "chapter=%{public}@", buf, 0xCu);
    }
    a1 = v71;
  }
  uint64_t v13 = *(void *)(a1 + 64);
  if (!v13)
  {
    id v69 = 0;
LABEL_10:
    _HKInitializeLogging();
    uint64_t v16 = (void *)*MEMORY[0x1E4F29F18];
    if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29F18]))
    {
      id v17 = v16;
      unsigned int v18 = v17;
      os_signpost_id_t v19 = *(void *)(v71 + 80);
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        id v20 = [*(id *)(v71 + 32) name];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v20;
        _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v19, "merge-journal-chapter-merge-entries", "chapter=%{public}@", buf, 0xCu);
      }
    }
    *(void *)(*(void *)(*(void *)(v71 + 72) + 8) + 24) += a3;
    uint64_t v22 = *(void *)(v71 + 40);
    uint64_t v21 = *(void **)(v71 + 48);
    id v68 = v70;
    id v72 = v21;
    uint64_t v74 = v22;
    if (v22)
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v83 = 0;
      v84 = &v83;
      uint64_t v85 = 0x2020000000;
      uint64_t v86 = 0;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id obj = v68;
      uint64_t v24 = 0;
      uint64_t v25 = [obj countByEnumeratingWithState:&v79 objects:buf count:16];
      if (!v25) {
        goto LABEL_39;
      }
      uint64_t v26 = *(void *)v80;
      while (1)
      {
        uint64_t v27 = 0;
        id v28 = v24;
        do
        {
          if (*(void *)v80 != v26) {
            objc_enumerationMutation(obj);
          }
          id v29 = *(void **)(*((void *)&v79 + 1) + 8 * v27);
          uint64_t v30 = [v29 entryClassName];
          BOOL v31 = v30 != v28;
          if (v30 == v28) {
            goto LABEL_24;
          }
          if (!v28)
          {
            BOOL v31 = 0;
            goto LABEL_29;
          }
          id v5 = [v29 entryClassName];
          if ([v5 isEqualToString:v28])
          {
LABEL_24:
            uint64_t v32 = v84[3];
            if ([v29 size] + v32 <= *(void *)(v74 + 80))
            {
              if (v30 == v28) {
                uint64_t v30 = v28;
              }
              else {

              }
              goto LABEL_34;
            }
          }
          else
          {
            BOOL v31 = 1;
          }
LABEL_29:
          uint64_t v33 = [v23 count];
          if (v31)
          {
            BOOL v34 = v33 == 0;
          }
          else
          {
            BOOL v34 = v33 == 0;
          }

          if (!v34)
          {
            v75[1] = (id)MEMORY[0x1E4F143A8];
            v75[2] = (id)3221225472;
            v75[3] = __50__HDDatabaseJournal__mergeJournalEntries_profile___block_invoke;
            v75[4] = &unk_1E62F76B8;
            id v76 = v23;
            id v77 = v72;
            id v78 = &v83;
            HKWithAutoreleasePool();

            uint64_t v30 = v76;
LABEL_34:
          }
          uint64_t v24 = [v29 entryClassName];

          [v23 addObject:v29];
          uint64_t v35 = [v29 size];
          v84[3] += v35;
          ++v27;
          id v28 = v24;
        }
        while (v25 != v27);
        uint64_t v36 = [obj countByEnumeratingWithState:&v79 objects:buf count:16];
        uint64_t v25 = v36;
        if (!v36)
        {
LABEL_39:

          if ([v23 count])
          {
            id v37 = +[HDDatabaseJournal _journalEntriesFromChapterEnties:]((uint64_t)HDDatabaseJournal, v23);
            id v38 = [v37 firstObject];
            [(id)objc_opt_class() applyEntries:v37 withProfile:v72];
          }
          uint64_t v39 = [v24 copy];
          uint64_t v40 = *(void **)(v74 + 72);
          *(void *)(v74 + 72) = v39;

          _Block_object_dispose(&v83, 8);
          break;
        }
      }
    }

    int v41 = *(_DWORD *)(v71 + 88);
    uint64_t v42 = *(void *)(v71 + 40);
    uint64_t v43 = *(void **)(v71 + 56);
    id v44 = *(id *)(v71 + 48);
    id v45 = v43;
    uint64_t v46 = v45;
    if (!v42)
    {
      int v56 = 0;
      goto LABEL_64;
    }
    if (v41 != 3)
    {
      int v56 = 1;
LABEL_64:

      _HKInitializeLogging();
      uint64_t v61 = (void *)*MEMORY[0x1E4F29F18];
      if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29F18]))
      {
        v62 = v61;
        char v63 = v62;
        os_signpost_id_t v64 = *(void *)(v71 + 80);
        if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
        {
          v65 = [*(id *)(v71 + 32) name];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v65;
          __int16 v88 = 1024;
          int v89 = v56;
          _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v63, OS_SIGNPOST_INTERVAL_END, v64, "merge-journal-chapter-merge-entries", "chapter=%{public}@ success=%{BOOL}d", buf, 0x12u);
        }
      }
      if (v56) {
        uint64_t v60 = 3;
      }
      else {
        uint64_t v60 = 2;
      }
      goto LABEL_72;
    }
    int v47 = [v45 databaseForEntityProtectionClass:2];
    *(void *)buf = 0;
    id v48 = +[HDSQLiteEntity maxPersistentIDWithPredicate:0 database:v47 error:buf];
    id v49 = *(id *)buf;
    id v50 = v49;
    if (v48)
    {
      uint64_t v51 = [v48 longLongValue];
      uint64_t v52 = [v44 currentSyncIdentityPersistentID];
      *(void *)&long long v79 = 0;
      BOOL v53 = +[HDKeyValueEntity setOkemoZursObjectAnchor:v51 syncIdentity:v52 database:v47 error:&v79];
      id v54 = (id)v79;
      uint64_t v55 = v54;
      if (v53)
      {

LABEL_56:
        int v56 = 1;
        goto LABEL_63;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a5, 100, @"Failed to set object anchor", v54);
    }
    else
    {
      if (!v49) {
        goto LABEL_56;
      }
      if (a5)
      {
        int v56 = 0;
        *a5 = v49;
LABEL_63:

        goto LABEL_64;
      }
      _HKLogDroppedError();
    }
    int v56 = 0;
    goto LABEL_63;
  }
  v75[0] = 0;
  char v14 = (*(uint64_t (**)(uint64_t, id *))(v13 + 16))(v13, v75);
  id v15 = v75[0];
  if (v14)
  {
    id v69 = v15;
    goto LABEL_10;
  }
  v57 = v15;
  _HKInitializeLogging();
  uint64_t v58 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v57;
    _os_log_impl(&dword_1BCB7D000, v58, OS_LOG_TYPE_DEFAULT, "Journal merge aborted: should-continue handler returned NO: %{public}@", buf, 0xCu);
  }
  id v59 = v57;
  id v69 = v59;
  if (v59)
  {
    if (a5) {
      *a5 = v59;
    }
    else {
      _HKLogDroppedError();
    }
    id v59 = v69;
  }

  uint64_t v60 = 0;
LABEL_72:

  return v60;
}

uint64_t __50__HDDatabaseJournal__mergeJournalEntries_profile___block_invoke(uint64_t a1)
{
  int64_t v2 = +[HDDatabaseJournal _journalEntriesFromChapterEnties:]((uint64_t)HDDatabaseJournal, *(void **)(a1 + 32));
  id v3 = [v2 firstObject];
  [(id)objc_opt_class() applyEntries:v2 withProfile:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) removeAllObjects];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;

  return 1;
}

+ (id)_journalEntriesFromChapterEnties:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_362);

  return v3;
}

id __54__HDDatabaseJournal__journalEntriesFromChapterEnties___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  id v2 = [a2 deserializedEntryWithError:&v6];
  id v3 = v6;
  if (!v2)
  {
    _HKInitializeLogging();
    id v4 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v8 = v3;
      _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "Unable to deserialize journal entry: %{public}@", buf, 0xCu);
    }
  }

  return v2;
}

- (void)resetJournalMergeInterruptionsCount
{
  p_interruptionsInfoLock = &self->_interruptionsInfoLock;
  os_unfair_lock_lock(&self->_interruptionsInfoLock);
  [(NSMutableDictionary *)self->_journalMergeInterruptions removeAllObjects];

  os_unfair_lock_unlock(p_interruptionsInfoLock);
}

- (id)journalMergeInterruptions
{
  p_interruptionsInfoLock = &self->_interruptionsInfoLock;
  os_unfair_lock_lock(&self->_interruptionsInfoLock);
  id v4 = (void *)[(NSMutableDictionary *)self->_journalMergeInterruptions copy];
  os_unfair_lock_unlock(p_interruptionsInfoLock);

  return v4;
}

- (void)_unitTesting_closeCurrentJournalChapter
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60__HDDatabaseJournal__unitTesting_closeCurrentJournalChapter__block_invoke;
  v2[3] = &unk_1E62F3208;
  v2[4] = self;
  -[HDDatabaseJournal _executeAtomically:]((os_unfair_lock_s *)self, v2);
}

uint64_t __60__HDDatabaseJournal__unitTesting_closeCurrentJournalChapter__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 144) close];
}

- (id)_unitTesting_directoryURL
{
  return self->_URL;
}

- (void)_unitTesting_setJournalStatusRequiresMerge
{
  self->_unint64_t journalStatus = 2;
}

- (void)_unitTesting_setSerializedDataEnumerationThreshold:(int64_t)a3
{
  self->_serializedDataEnumerationThreshold = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (HDDatabaseJournalDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDDatabaseJournalDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)mergeQueue
{
  return self->_mergeQueue;
}

- (NSNumber)maximumJournalBytes
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setMaximumJournalBytes:(id)a3
{
}

- (BOOL)isMerging
{
  return self->_isMerging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentJournalChapter, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_maximumJournalBytes, 0);
  objc_storeStrong((id *)&self->_mergeQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_journalMergeInterruptions, 0);
  objc_storeStrong((id *)&self->_lastInsertedEntryClassName, 0);
  objc_storeStrong((id *)&self->_activeMergeTransaction, 0);
  objc_storeStrong((id *)&self->_progressLock_internalProgress, 0);

  objc_storeStrong((id *)&self->_progressLock_observableProgress, 0);
}

@end