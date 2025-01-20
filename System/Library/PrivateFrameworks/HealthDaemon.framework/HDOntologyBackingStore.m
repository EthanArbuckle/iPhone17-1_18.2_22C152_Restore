@interface HDOntologyBackingStore
+ (id)_ontologyURLWithBaseURL:(uint64_t)a1;
+ (id)unitTesting_ontologyBackingStoreForDaemon:(id)a3 baseURL:(id)a4;
+ (id)unitTesting_ontologyURLWithBaseURL:(id)a3;
- (BOOL)isAvailable;
- (BOOL)obliterateWithReason:(id)a3 error:(id *)a4;
- (BOOL)performOntologyTransactionForWrite:(BOOL)a3 profile:(id)a4 databaseTransaction:(id)a5 error:(id *)a6 transactionHandler:(id)a7;
- (HDDaemon)daemon;
- (HDOntologyBackingStore)init;
- (HDOntologyBackingStore)initWithDaemon:(id)a3;
- (NSString)protectedResourceIdentifier;
- (id)_initWithDaemon:(id)a3 baseURL:(id)a4;
- (id)checkOutProtectedResourceWithAssertion:(id)a3 transaction:(id)a4 error:(id *)a5;
- (id)newConnectionForPool:(id)a3 error:(id *)a4;
- (id)requestProtectedResourceAccessAssertionForOwnerIdentifier:(id)a3 error:(id *)a4;
- (id)sizeOfUnderlyingDatabaseInBytes;
- (uint64_t)_allowedToOpenDatabaseWithError:(uint64_t)result;
- (uint64_t)_performOntologyTransactionWithProfile:(void *)a3 databaseTransaction:(unsigned int)a4 write:(void *)a5 error:(void *)a6 transactionHandler:;
- (void)_flushConnectionsAndWait;
- (void)_queue_flushDatabaseConnectionsIfNecessary;
- (void)_updateAvailability;
- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4;
- (void)close;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)daemonReady:(id)a3;
- (void)databasePool:(id)a3 didFlushConnections:(id)a4;
- (void)invalidate;
- (void)obliterateWithReason:(id)a3;
- (void)registerOntologyDatabase:(id)a3;
@end

@implementation HDOntologyBackingStore

- (HDOntologyBackingStore)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDOntologyBackingStore)initWithDaemon:(id)a3
{
  id v4 = a3;
  v5 = [v4 healthDirectoryURL];
  v6 = [(HDOntologyBackingStore *)self _initWithDaemon:v4 baseURL:v5];

  return v6;
}

- (id)_initWithDaemon:(id)a3 baseURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)HDOntologyBackingStore;
  v8 = [(HDOntologyBackingStore *)&v34 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_daemon, v6);
    uint64_t v10 = +[HDOntologyBackingStore _ontologyURLWithBaseURL:]((uint64_t)HDOntologyBackingStore, v7);
    ontologyURL = v9->_ontologyURL;
    v9->_ontologyURL = (NSURL *)v10;

    atomic_store(0, (unsigned __int8 *)&v9->_invalidated);
    uint64_t v12 = HKCreateSerialDispatchQueue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    v14 = NSString;
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    uint64_t v17 = [v14 stringWithFormat:@"%@.%p.transaction", v16, v9];
    threadLocalTransactionKey = v9->_threadLocalTransactionKey;
    v9->_threadLocalTransactionKey = (NSString *)v17;

    v9->_available = 0;
    v9->_availabilityLock._os_unfair_lock_opaque = 0;
    v9->_observedContentProtectionState = 0;
    id v19 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v20 = HKLogHealthOntology();
    uint64_t v21 = [v19 initWithName:@"HDOntologyBackingStoreObserver" loggingCategory:v20];
    observers = v9->_observers;
    v9->_observers = (HKObserverSet *)v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F65CF0]) initWithConcurrentReaderLimit:2 delegate:v9];
    databaseConnectionPool = v9->_databaseConnectionPool;
    v9->_databaseConnectionPool = (HDDatabaseConnectionPool *)v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    activeDatabaseConnectionLock = v9->_activeDatabaseConnectionLock;
    v9->_activeDatabaseConnectionLock = (NSConditionLock *)v25;

    v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeDatabaseConnections = v9->_activeDatabaseConnections;
    v9->_activeDatabaseConnections = v27;

    v29 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E4F65CD0]);
    protectedResourceAssertionManager = v9->_protectedResourceAssertionManager;
    v9->_protectedResourceAssertionManager = v29;

    [(HDAssertionManager *)v9->_protectedResourceAssertionManager addObserver:v9 forAssertionIdentifier:@"OntologyDatabaseAccessibility" queue:v9->_queue];
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_daemon);
    [WeakRetained registerProtectedResourceStoreProvider:v9];

    id v32 = objc_loadWeakRetained((id *)&v9->_daemon);
    [v32 registerDaemonReadyObserver:v9 queue:v9->_queue];
  }
  return v9;
}

+ (id)_ontologyURLWithBaseURL:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [v2 URLByAppendingPathComponent:@"ontology" isDirectory:1];

  id v4 = [v3 URLByAppendingPathComponent:@"HealthOntology.db" isDirectory:0];

  return v4;
}

- (BOOL)performOntologyTransactionForWrite:(BOOL)a3 profile:(id)a4 databaseTransaction:(id)a5 error:(id *)a6 transactionHandler:(id)a7
{
  unsigned int v10 = a3;
  id v12 = a4;
  id v13 = a7;
  if (a5)
  {
    char v14 = -[HDOntologyBackingStore _performOntologyTransactionWithProfile:databaseTransaction:write:error:transactionHandler:]((uint64_t)self, v12, a5, v10, a6, v13);
  }
  else
  {
    v15 = [v12 database];
    v16 = +[HDDatabaseTransactionContext contextForReadingProtectedData];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __114__HDOntologyBackingStore_performOntologyTransactionForWrite_profile_databaseTransaction_error_transactionHandler___block_invoke;
    v18[3] = &unk_1E62F85E8;
    v18[4] = self;
    id v19 = v12;
    char v21 = v10;
    id v20 = v13;
    char v14 = [v15 performTransactionWithContext:v16 error:a6 block:v18 inaccessibilityHandler:0];
  }
  return v14;
}

- (uint64_t)_performOntologyTransactionWithProfile:(void *)a3 databaseTransaction:(unsigned int)a4 write:(void *)a5 error:(void *)a6 transactionHandler:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a6;
  if (!a1)
  {
    uint64_t v23 = 0;
    goto LABEL_21;
  }
  char v14 = [v12 ontologyDatabase];
  if (v14)
  {
    if (-[HDOntologyBackingStore _allowedToOpenDatabaseWithError:](a1, a5))
    {
      unsigned int v39 = a4;
      id v15 = v11;
      id v16 = v12;
      id v40 = v13;
      uint64_t v17 = (uint64_t (**)(id, void *, void *))v13;
      v18 = [MEMORY[0x1E4F29060] currentThread];
      id v19 = [v18 threadDictionary];

      id v20 = v19;
      char v21 = [v19 objectForKeyedSubscript:*(void *)(a1 + 32)];
      v22 = v21;
      if (v21)
      {
        if (([v21 isWriteTransaction] & 1) != 0 || !v39)
        {
          uint64_t v23 = v17[2](v17, v22, a5);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 131, @"Cannot perform an ontology write transaction nested inside a read transaction");
          uint64_t v23 = 0;
        }
        v30 = v16;
      }
      else
      {
        id v38 = v15;
        id v35 = v16;
        id v37 = v16;
        v33 = v20;
        id v36 = v20;
        objc_super v34 = v17;
        v24 = v17;
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
        v26 = [WeakRetained contentProtectionManager];
        int v27 = [v26 isProtectedDataAvailable];

        if (v27) {
          uint64_t v28 = v39;
        }
        else {
          uint64_t v28 = v39 | 4;
        }
        v29 = [*(id *)(a1 + 64) checkOutConnectionWithOptions:v28 error:a5];
        if (v29)
        {
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __133__HDOntologyBackingStore__performOutermostTransactionForWrite_profile_databaseTransaction_threadDictionary_error_transactionHandler___block_invoke;
          v41[3] = &unk_1E630AFE8;
          id v42 = v38;
          id v43 = v37;
          char v47 = v39;
          id v32 = v36;
          id v44 = v32;
          uint64_t v45 = a1;
          v46 = v24;
          uint64_t v23 = [v29 performTransactionWithError:a5 write:v39 block:v41];

          v22 = 0;
          [v32 removeObjectForKey:*(void *)(a1 + 32)];
          [*(id *)(a1 + 64) checkInConnection:v29 flushImmediately:0];
        }
        else
        {
          uint64_t v23 = 0;
          v22 = 0;
        }
        v30 = v35;

        id v20 = v33;
        uint64_t v17 = v34;
      }

      id v13 = v40;
      goto LABEL_20;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Ontology database is nil for transaction %@", v12);
  }
  uint64_t v23 = 0;
LABEL_20:

LABEL_21:
  return v23;
}

uint64_t __114__HDOntologyBackingStore_performOntologyTransactionForWrite_profile_databaseTransaction_error_transactionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return -[HDOntologyBackingStore _performOntologyTransactionWithProfile:databaseTransaction:write:error:transactionHandler:](*(void *)(a1 + 32), *(void **)(a1 + 40), a2, *(unsigned __int8 *)(a1 + 56), a3, *(void **)(a1 + 48));
}

- (void)registerOntologyDatabase:(id)a3
{
}

- (BOOL)isAvailable
{
  id v2 = self;
  p_availabilityLock = &self->_availabilityLock;
  os_unfair_lock_lock(&self->_availabilityLock);
  LOBYTE(v2) = v2->_available;
  os_unfair_lock_unlock(p_availabilityLock);
  return (char)v2;
}

- (void)close
{
  -[HDOntologyBackingStore _flushConnectionsAndWait]((uint64_t)self);
  if (self)
  {
    [(NSConditionLock *)self->_activeDatabaseConnectionLock lockWhenCondition:0];
    [(NSConditionLock *)self->_activeDatabaseConnectionLock unlock];
  }

  -[HDOntologyBackingStore _updateAvailability]((uint64_t)self);
}

- (void)_flushConnectionsAndWait
{
  if (a1)
  {
    v1 = [*(id *)(a1 + 64) flush];
    dispatch_group_wait(v1, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)_updateAvailability
{
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    uint64_t v7 = 0;
    if (-[HDOntologyBackingStore _allowedToOpenDatabaseWithError:](a1, &v7))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
      id v4 = [WeakRetained contentProtectionManager];
      int v5 = [v4 observedState] != 2 || objc_msgSend(*(id *)(a1 + 64), "count") > 0;
    }
    else
    {
      int v5 = 0;
    }
    os_unfair_lock_assert_owner(v2);
    if (*(unsigned __int8 *)(a1 + 44) != v5)
    {
      *(unsigned char *)(a1 + 44) = v5;
      id v6 = *(void **)(a1 + 56);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __66__HDOntologyBackingStore__availabilityLock_handleNewAvailability___block_invoke;
      v8[3] = &unk_1E630B010;
      v8[4] = a1;
      [v6 notifyObservers:v8];
    }
    os_unfair_lock_unlock(v2);
  }
}

- (void)invalidate
{
  if (atomic_exchange((atomic_uchar *volatile)&self->_invalidated, 1u))
  {
    if (!self) {
      goto LABEL_5;
    }
  }
  else
  {
    os_unfair_lock_lock(&self->_availabilityLock);
    self->_available = 0;
    os_unfair_lock_unlock(&self->_availabilityLock);
    [(HDAssertionManager *)self->_protectedResourceAssertionManager invalidate];
    -[HDOntologyBackingStore _flushConnectionsAndWait]((uint64_t)self);
  }
  [(NSConditionLock *)self->_activeDatabaseConnectionLock lockWhenCondition:0];
  [(NSConditionLock *)self->_activeDatabaseConnectionLock unlock];
LABEL_5:

  -[HDOntologyBackingStore _updateAvailability]((uint64_t)self);
}

- (void)obliterateWithReason:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  BOOL v4 = [(HDOntologyBackingStore *)self obliterateWithReason:a3 error:&v7];
  id v5 = v7;
  if (!v4)
  {
    _HKInitializeLogging();
    id v6 = HKLogHealthOntology();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v9 = self;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: unable to obliterate database: %{public}@", buf, 0x16u);
    }
  }
}

- (BOOL)obliterateWithReason:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (id)[(HDDatabaseConnectionPool *)self->_databaseConnectionPool flush];
  [(NSConditionLock *)self->_activeDatabaseConnectionLock lockWhenCondition:0];
  _HKInitializeLogging();
  v8 = HKLogHealthOntology();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = self;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "Obliterate %{public}@ for %{public}@", buf, 0x16u);
  }

  v9 = self->_ontologyURL;
  self;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  char v11 = objc_msgSend(v10, "hd_removeSQLiteDatabaseAtURL:preserveCopy:", v9, 0);
  if ((v11 & 1) == 0)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    id v13 = [(NSURL *)v9 path];
    objc_msgSend(v12, "hk_assignError:code:format:", a4, 102, @"Unable to remove underlying database at '%@'", v13);
  }
  [(NSConditionLock *)self->_activeDatabaseConnectionLock unlock];

  return v11;
}

- (id)sizeOfUnderlyingDatabaseInBytes
{
  v37[3] = *MEMORY[0x1E4F143B8];
  v3 = [(NSURL *)self->_ontologyURL lastPathComponent];
  BOOL v4 = [(NSURL *)self->_ontologyURL URLByDeletingLastPathComponent];
  v37[0] = self->_ontologyURL;
  id v5 = [v3 stringByAppendingString:@"-wal"];
  id v6 = [v4 URLByAppendingPathComponent:v5];
  v37[1] = v6;
  v24 = v3;
  id v7 = [v3 stringByAppendingString:@"-shm"];
  v8 = [v4 URLByAppendingPathComponent:v7];
  v37[2] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v25 = 0;
        __int16 v17 = objc_msgSend(v16, "hk_fileSizeWithError:", &v25);
        id v18 = v25;
        uint64_t v19 = v18;
        if (!v17 && (objc_msgSend(v18, "hk_isCocoaNoSuchFileError") & 1) == 0)
        {
          _HKInitializeLogging();
          id v20 = HKLogHealthOntology();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = [v16 path];
            *(_DWORD *)buf = 138543874;
            v31 = self;
            __int16 v32 = 2114;
            v33 = v23;
            __int16 v34 = 2114;
            id v35 = v19;
            _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "%{public}@: error getting size of \"%{public}@\": %{public}@", buf, 0x20u);
          }
          char v21 = 0;
          goto LABEL_16;
        }
        v13 += [v17 longLongValue];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  char v21 = [NSNumber numberWithLongLong:v13];
LABEL_16:

  return v21;
}

+ (id)unitTesting_ontologyURLWithBaseURL:(id)a3
{
  return +[HDOntologyBackingStore _ontologyURLWithBaseURL:]((uint64_t)a1, a3);
}

+ (id)unitTesting_ontologyBackingStoreForDaemon:(id)a3 baseURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithDaemon:v7 baseURL:v6];

  return v8;
}

- (void)daemonReady:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  id v5 = [WeakRetained contentProtectionManager];
  [v5 addContentProtectionObserver:self withQueue:self->_queue];

  id v6 = objc_loadWeakRetained((id *)&self->_daemon);
  id v7 = [v6 contentProtectionManager];
  int64_t v8 = [v7 observedState];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_availabilityLock);
  self->_observedContentProtectionState = v8;
  os_unfair_lock_unlock(&self->_availabilityLock);

  -[HDOntologyBackingStore _updateAvailability]((uint64_t)self);
}

- (NSString)protectedResourceIdentifier
{
  return (NSString *)@"OntologyDatabase";
}

- (id)requestProtectedResourceAccessAssertionForOwnerIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__176;
  id v38 = __Block_byref_object_dispose__176;
  id v39 = 0;
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__176;
  __int16 v32 = __Block_byref_object_dispose__176;
  id v33 = 0;
  queue = self->_queue;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  char v21 = __90__HDOntologyBackingStore_requestProtectedResourceAccessAssertionForOwnerIdentifier_error___block_invoke;
  v22 = &unk_1E630AFC0;
  uint64_t v23 = self;
  id v25 = &v40;
  long long v26 = &v28;
  long long v27 = &v34;
  id v8 = v6;
  id v24 = v8;
  dispatch_sync(queue, &v19);
  v9 = (void *)v35[5];
  if (v9)
  {
    if (v41[3] >= 1)
    {
      id v10 = v8;
      databaseConnectionPool = self->_databaseConnectionPool;
      id v44 = 0;
      uint64_t v12 = -[HDDatabaseConnectionPool checkOutConnectionWithOptions:error:](databaseConnectionPool, "checkOutConnectionWithOptions:error:", 10, &v44, v19, v20, v21, v22, v23);
      id v13 = v44;
      if (v12)
      {
        [(HDDatabaseConnectionPool *)self->_databaseConnectionPool checkInConnection:v12 flushImmediately:0];
      }
      else
      {
        _HKInitializeLogging();
        id v16 = HKLogHealthOntology();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v46 = v10;
          __int16 v47 = 2114;
          id v48 = v13;
          _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "Failed to pre-emptively check out ontology connection for accessibility assertion owner \"%{public}@\": %{public}@", buf, 0x16u);
        }
      }
      v9 = (void *)v35[5];
    }
    id v17 = v9;
  }
  else
  {
    id v14 = (id)v29[5];
    id v15 = v14;
    if (v14)
    {
      if (a4) {
        *a4 = v14;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v17 = 0;
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);

  return v17;
}

void __90__HDOntologyBackingStore_requestProtectedResourceAccessAssertionForOwnerIdentifier_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  v3 = [WeakRetained contentProtectionManager];
  uint64_t v4 = [v3 observedState];

  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v4 == 2)
  {
    if (![v5 count])
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_protectedDataInaccessibilityError");
      uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      return;
    }
  }
  else
  {
    uint64_t v9 = [v5 cacheSize];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9
                                                                - [*(id *)(*(void *)(a1 + 32) + 64) count];
  }
  uint64_t v10 = [objc_alloc(MEMORY[0x1E4F65CC8]) initWithAssertionIdentifier:@"OntologyDatabaseAccessibility" ownerIdentifier:*(void *)(a1 + 40)];
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (([*(id *)(*(void *)(a1 + 32) + 88) takeAssertion:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)] & 1) == 0)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v14 + 40);
    id v15 = [*(id *)(a1 + 32) protectedResourceIdentifier];
    objc_msgSend(v13, "hk_assignError:code:format:", &obj, 100, @"Unable to check out protected resource /'%@/' for owner %@", v15, *(void *)(a1 + 40));
    objc_storeStrong((id *)(v14 + 40), obj);

    uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;
  }
}

- (id)checkOutProtectedResourceWithAssertion:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7 = a3;
  if ([(HDAssertionManager *)self->_protectedResourceAssertionManager hasActiveAssertion:v7])
  {
    id v8 = self;
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = [(HDOntologyBackingStore *)self protectedResourceIdentifier];
    objc_msgSend(v9, "hk_assignError:code:format:", a5, 3, @"Unable to check out protected resource /'%@/' with assertion %@", v10, v7);

    id v8 = 0;
  }

  return v8;
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);

  -[HDOntologyBackingStore _queue_flushDatabaseConnectionsIfNecessary]((uint64_t)self);
}

- (void)_queue_flushDatabaseConnectionsIfNecessary
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    uint64_t v2 = *(void *)(a1 + 48);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    if (v2 == 2
      && ([*(id *)(a1 + 88) hasActiveAssertionForIdentifier:@"OntologyDatabaseAccessibility"] & 1) == 0)
    {
      id v3 = (id)[*(id *)(a1 + 64) flush];
    }
  }
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_availabilityLock);
  self->_observedContentProtectionState = a3;
  os_unfair_lock_unlock(&self->_availabilityLock);
  -[HDOntologyBackingStore _queue_flushDatabaseConnectionsIfNecessary]((uint64_t)self);

  -[HDOntologyBackingStore _updateAvailability]((uint64_t)self);
}

- (id)newConnectionForPool:(id)a3 error:(id *)a4
{
  if (!-[HDOntologyBackingStore _allowedToOpenDatabaseWithError:]((uint64_t)self, a4)) {
    return 0;
  }
  [(NSConditionLock *)self->_activeDatabaseConnectionLock lock];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  id v7 = [WeakRetained contentProtectionManager];
  uint64_t v8 = [v7 observedState];

  if (v8 == 2)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_protectedDataInaccessibilityError");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a4) {
        *a4 = v9;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = +[HDSimpleGraphDatabase graphDatabaseWithURL:self->_ontologyURL error:a4];
  }
  [(NSMutableSet *)self->_activeDatabaseConnections hk_addNonNilObject:v10];
  [(NSConditionLock *)self->_activeDatabaseConnectionLock unlockWithCondition:[(NSMutableSet *)self->_activeDatabaseConnections count] != 0];
  return v10;
}

- (uint64_t)_allowedToOpenDatabaseWithError:(uint64_t)result
{
  if (result)
  {
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)(result + 16));
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a2, 119, @"%@:%p is invalidated", objc_opt_class(), result);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(result + 96));
      id v5 = [WeakRetained contentProtectionManager];
      char v6 = [v5 deviceUnlockedSinceBoot];

      if (v6) {
        return 1;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_databaseInaccessibleBeforeFirstUnlockError");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        if (a2) {
          *a2 = v7;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    return 0;
  }
  return result;
}

- (void)databasePool:(id)a3 didFlushConnections:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(NSConditionLock *)self->_activeDatabaseConnectionLock lock];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        -[NSMutableSet removeObject:](self->_activeDatabaseConnections, "removeObject:", v11, (void)v12);
        [v11 close];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(NSConditionLock *)self->_activeDatabaseConnectionLock unlockWithCondition:[(NSMutableSet *)self->_activeDatabaseConnections count] != 0];
  -[HDOntologyBackingStore _updateAvailability]((uint64_t)self);
}

uint64_t __133__HDOntologyBackingStore__performOutermostTransactionForWrite_profile_databaseTransaction_threadDictionary_error_transactionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[HDOntologyTransaction alloc] initWithProfile:*(void *)(a1 + 32) databaseTransaction:*(void *)(a1 + 40) graphDatabase:v3 isWriteTransaction:*(unsigned __int8 *)(a1 + 72)];

  [*(id *)(a1 + 48) setObject:v4 forKeyedSubscript:*(void *)(*(void *)(a1 + 56) + 32)];
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();

  return v5;
}

uint64_t __66__HDOntologyBackingStore__availabilityLock_handleNewAvailability___block_invoke(uint64_t a1, void *a2)
{
  return [a2 ontologyBackingStore:*(void *)(a1 + 32) didBecomeAvailable:*(unsigned __int8 *)(*(void *)(a1 + 32) + 44)];
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (HDDaemon *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_protectedResourceAssertionManager, 0);
  objc_storeStrong((id *)&self->_activeDatabaseConnections, 0);
  objc_storeStrong((id *)&self->_activeDatabaseConnectionLock, 0);
  objc_storeStrong((id *)&self->_databaseConnectionPool, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_threadLocalTransactionKey, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_ontologyURL, 0);
}

@end