@interface HDDaemonSyncMessageHandler
- (BOOL)sendCodableChange:(id)a3 resultAnchor:(int64_t)a4 sequence:(int64_t)a5 done:(BOOL)a6 error:(id *)a7;
- (BOOL)sendCodableChange:(id)a3 version:(id)a4 resultAnchor:(int64_t)a5 sequence:(int64_t)a6 done:(BOOL)a7 error:(id *)a8;
- (HDDaemonSyncMessageHandler)initWithSyncEntityClass:(Class)a3 anchorRange:(HDSyncAnchorRange)a4 session:(id)a5 requiredAnchorMap:(id)a6;
- (NSError)sendChangesError;
- (id)description;
- (int64_t)currentAnchor;
- (int64_t)sendChangesStatus;
- (uint64_t)_sendChangesWithError:(uint64_t)a1;
- (void)abandonUnsentChangesForError:(id)a3;
- (void)dealloc;
@end

@implementation HDDaemonSyncMessageHandler

- (HDDaemonSyncMessageHandler)initWithSyncEntityClass:(Class)a3 anchorRange:(HDSyncAnchorRange)a4 session:(id)a5 requiredAnchorMap:(id)a6
{
  int64_t end = a4.end;
  int64_t start = a4.start;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HDDaemonSyncMessageHandler;
  v14 = [(HDDaemonSyncMessageHandler *)&v20 init];
  v15 = v14;
  if (v14)
  {
    v14->_syncEntityClass = a3;
    v14->_anchorRange.int64_t start = start;
    v14->_anchorRange.int64_t end = end;
    v14->_lastAnchor = start;
    v14->_currentAnchor = start;
    objc_storeStrong((id *)&v14->_session, a5);
    uint64_t v16 = [v13 copy];
    requiredAnchorMap = v15->_requiredAnchorMap;
    v15->_requiredAnchorMap = (HDSyncAnchorMap *)v16;

    v15->_sendChangesStatus = 1;
    v15->_done = 0;
    changes = v15->_changes;
    v15->_changes = 0;

    v15->_accumulatedChangeSetSize = 0;
  }

  return v15;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_changes count])
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
    {
      changes = self->_changes;
      v5 = v3;
      *(_DWORD *)buf = 138412546;
      v8 = self;
      __int16 v9 = 2048;
      uint64_t v10 = [(NSMutableArray *)changes count];
      _os_log_fault_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_FAULT, "%@ has %ld changes that must be sent prior to deallocation", buf, 0x16u);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)HDDaemonSyncMessageHandler;
  [(HDDaemonSyncMessageHandler *)&v6 dealloc];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HDSyncSession *)self->_session shortSessionIdentifier];
  objc_super v6 = [v3 stringWithFormat:@"<%@:%p %@ %@ %lld -> %lld, %lld>", v4, self, v5, self->_syncEntityClass, self->_anchorRange.start, self->_anchorRange.end, self->_currentAnchor];

  return v6;
}

- (BOOL)sendCodableChange:(id)a3 resultAnchor:(int64_t)a4 sequence:(int64_t)a5 done:(BOOL)a6 error:(id *)a7
{
  return [(HDDaemonSyncMessageHandler *)self sendCodableChange:a3 version:0 resultAnchor:a4 sequence:a5 done:a6 error:a7];
}

- (BOOL)sendCodableChange:(id)a3 version:(id)a4 resultAnchor:(int64_t)a5 sequence:(int64_t)a6 done:(BOOL)a7 error:(id *)a8
{
  BOOL v8 = a7;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  if (self->_done)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HDDaemonSyncMessageHandler.m", 94, @"%@ is already done", self object file lineNumber description];
  }
  self->_done = v8;
  _HKInitializeLogging();
  v15 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    Class syncEntityClass = self->_syncEntityClass;
    v25 = v15;
    uint64_t v16 = HDSyncVersionRangeToString(*(void *)&a4);
    int64_t start = self->_anchorRange.start;
    int64_t end = self->_anchorRange.end;
    if (v8) {
      v19 = "final";
    }
    else {
      v19 = "interim";
    }
    *(_DWORD *)buf = 138545154;
    Class v29 = syncEntityClass;
    __int16 v30 = 2114;
    v31 = v16;
    __int16 v32 = 2048;
    int64_t v33 = start;
    __int16 v34 = 2048;
    int64_t v35 = end;
    __int16 v36 = 2080;
    v37 = v19;
    __int16 v38 = 2048;
    int64_t v39 = a5;
    __int16 v40 = 2048;
    uint64_t v41 = [v14 count];
    __int16 v42 = 2048;
    int64_t v43 = a6;
    _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "Sync for %{public}@ (Version: %{public}@) from %lld -> %lld produced %s result anchor %lld and %lu objects with sequence %lld.", buf, 0x52u);
  }
  if (a6 || self->_currentAnchor != a5)
  {
    if (self->_anchorRange.end < a5)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, self, @"HDDaemonSyncMessageHandler.m", 114, @"Invalid parameter not satisfying: %@", @"resultAnchor <= _anchorRange.end" object file lineNumber description];
    }
    id v27 = v14;
    char v20 = HKWithAutoreleasePool();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a8, 100, @"syncObjectsWithStore failed to update result anchor for entity type %@.", self->_syncEntityClass);
    [(NSMutableArray *)self->_changes removeAllObjects];
    char v20 = 0;
  }

  return v20;
}

uint64_t __89__HDDaemonSyncMessageHandler_sendCodableChange_version_resultAnchor_sequence_done_error___block_invoke(uint64_t a1, void *a2)
{
  if (!*(void *)(a1 + 48))
  {
    *(void *)(*(void *)(a1 + 32) + 80) = *(void *)(*(void *)(a1 + 32) + 88);
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 64) lastObject];
    v5 = [v4 sequenceNumber];
    objc_msgSend(v4, "setSequenceNumber:done:", objc_msgSend(v5, "longLongValue"), 1);
  }
  if ([*(id *)(a1 + 40) count])
  {
    objc_super v6 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) newChangeWithSyncEntityClass:*(void *)(*(void *)(a1 + 32) + 8) version:*(void *)(a1 + 64)];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = HDSyncAnchorRangeMake(*(void *)(*(void *)(a1 + 32) + 80), *(void *)(a1 + 56));
    objc_msgSend(v6, "setObjects:syncAnchorRange:requiredAnchorMap:", v7, v8, v9, *(void *)(*(void *)(a1 + 32) + 40));
    [v6 setSequenceNumber:*(void *)(a1 + 48) done:*(unsigned __int8 *)(a1 + 72)];
    if (!*(void *)(*(void *)(a1 + 32) + 64))
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 64);
      *(void *)(v11 + 64) = v10;
    }
    uint64_t v13 = [v6 encodedByteCount];
    uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 32) maxEncodedBytesPerChangeSetForSyncEntityClass:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(v15 + 72) + v13;
    if (v16 <= v14)
    {
      *(void *)(v15 + 72) = v16;
    }
    else
    {
      if (!-[HDDaemonSyncMessageHandler _sendChangesWithError:](v15, a2))
      {

        return 0;
      }
      *(void *)(*(void *)(a1 + 32) + 72) = v13;
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "hk_addNonNilObject:", v6);
  }
  if (!*(unsigned char *)(a1 + 72)
    || (uint64_t result = -[HDDaemonSyncMessageHandler _sendChangesWithError:](*(void *)(a1 + 32), a2), result))
  {
    *(void *)(*(void *)(a1 + 32) + 88) = *(void *)(a1 + 56);
    return 1;
  }
  return result;
}

- (uint64_t)_sendChangesWithError:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (![*(id *)(a1 + 64) count]) {
    return 1;
  }
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = "final";
    if (!*(unsigned char *)(a1 + 48)) {
      v5 = "accumulated";
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v5;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Attempt sending %s changes", buf, 0x16u);
  }
  objc_super v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 64);
  id v8 = v6;
  self;
  uint64_t v29 = 0;
  __int16 v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__200;
  id v27 = __Block_byref_object_dispose__200;
  id v28 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __57__HDDaemonSyncMessageHandler__sendChanges_session_error___block_invoke;
  __int16 v34 = &unk_1E630DD30;
  __int16 v36 = &v29;
  v37 = &v23;
  id v10 = v9;
  int64_t v35 = v10;
  [v8 sendChanges:v7 completion:buf];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v11 = (void *)v24[5];
  id v12 = v11;
  uint64_t v13 = v12;
  if (v12) {
    id v14 = v12;
  }

  uint64_t v15 = v30[3];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  id v16 = v13;
  [*(id *)(a1 + 64) removeAllObjects];
  BOOL v17 = v15 != 0;
  if (v15)
  {
    if (v15 == 2) {
      *(void *)(a1 + 96) = 2;
    }
  }
  else
  {
    id v18 = v16;
    if (v13)
    {
      v19 = v18;
      if (a2) {
        *a2 = v18;
      }
      else {
        _HKLogDroppedError();
      }

      *(void *)(a1 + 96) = 0;
      objc_storeStrong((id *)(a1 + 104), v11);
    }
    else
    {
      *(void *)(a1 + 96) = 0;
      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 122, @"Sending changes failed but did not provide an error.");
      v21 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v20;
    }
  }

  return v17;
}

void __57__HDDaemonSyncMessageHandler__sendChanges_session_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)abandonUnsentChangesForError:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableArray *)self->_changes count])
  {
    _HKInitializeLogging();
    id v5 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
    {
      changes = self->_changes;
      id v7 = v5;
      int v8 = 138543874;
      dispatch_semaphore_t v9 = self;
      __int16 v10 = 2048;
      uint64_t v11 = [(NSMutableArray *)changes count];
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_INFO, "%{public}@ Abandoning %ld due to an error during generation: %{public}@", (uint8_t *)&v8, 0x20u);
    }
    [(NSMutableArray *)self->_changes removeAllObjects];
  }
}

- (int64_t)currentAnchor
{
  return self->_currentAnchor;
}

- (int64_t)sendChangesStatus
{
  return self->_sendChangesStatus;
}

- (NSError)sendChangesError
{
  return self->_sendChangesError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendChangesError, 0);
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_requiredAnchorMap, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end