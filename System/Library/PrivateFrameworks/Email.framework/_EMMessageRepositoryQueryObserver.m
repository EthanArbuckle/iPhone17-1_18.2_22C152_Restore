@interface _EMMessageRepositoryQueryObserver
- (EMInMemoryThreadCollection)threadCollection;
- (EMInMemoryThreadQueryHandler)inMemoryThreadQueryHandler;
- (EMObjectID)observationIdentifier;
- (_EMMessageRepositoryQueryObserver)initWithRepository:(id)a3 query:(id)a4 observer:(id)a5 queryHandlerStorable:(id)a6;
- (id)_createInMemoryThreadQueryHandler;
- (id)_precachedItemsFromExtraInfo:(id)a3;
- (id)queryHelperObserver;
- (id)trampoliningObserver;
- (void)_createInMemoryThreadQueryHandlerIfNeeded;
- (void)_performQueryWithRemoteConnection:(id)a3 forRecovery:(BOOL)a4;
- (void)cancel;
- (void)clearInMemoryThreadDataIfNeeded;
- (void)dealloc;
- (void)observer:(id)a3 matchedAddedObjectIDs:(id)a4 after:(id)a5 extraInfo:(id)a6;
- (void)observer:(id)a3 matchedAddedObjectIDs:(id)a4 before:(id)a5 extraInfo:(id)a6;
- (void)observer:(id)a3 matchedChangesForObjectIDs:(id)a4;
- (void)observer:(id)a3 matchedDeletedObjectIDs:(id)a4;
- (void)observer:(id)a3 matchedMovedObjectIDs:(id)a4 after:(id)a5 extraInfo:(id)a6;
- (void)observer:(id)a3 matchedMovedObjectIDs:(id)a4 before:(id)a5 extraInfo:(id)a6;
- (void)observer:(id)a3 matchedOldestItemsUpdatedForMailboxes:(id)a4;
- (void)observer:(id)a3 replacedExistingObjectID:(id)a4 withNewObjectID:(id)a5;
- (void)observer:(id)a3 wasUpdated:(id)a4;
- (void)observerDidFinishInitialLoad:(id)a3;
- (void)observerDidFinishRemoteSearch:(id)a3;
- (void)observerWillRestart:(id)a3;
- (void)performWithRemoteConnection:(id)a3;
- (void)recoverWithRemoteConnection:(id)a3;
- (void)refreshQueryWithRemoteConnection:(id)a3;
- (void)setInMemoryThreadQueryHandler:(id)a3;
@end

@implementation _EMMessageRepositoryQueryObserver

- (void)observerDidFinishInitialLoad:(id)a3
{
  if (([(EFCancelationToken *)self->_token isCanceled] & 1) == 0)
  {
    os_unfair_lock_lock(&self->_recoveryLock);
    self->_recoveryAttempt = 0;
    os_unfair_lock_unlock(&self->_recoveryLock);
    id v4 = [(_EMMessageRepositoryQueryObserver *)self trampoliningObserver];
    [v4 queryDidFinishInitialLoad];
  }
}

- (void)observer:(id)a3 matchedAddedObjectIDs:(id)a4 before:(id)a5 extraInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (([(EFCancelationToken *)self->_token isCanceled] & 1) == 0)
  {
    [(_EMMessageRepositoryQueryObserver *)self clearInMemoryThreadDataIfNeeded];
    v14 = [(_EMMessageRepositoryQueryObserver *)self trampoliningObserver];
    [v14 queryMatchedAddedObjectIDs:v11 before:v12 extraInfo:v13];

    repository = self->_repository;
    observationIdentifier = self->_observationIdentifier;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __85___EMMessageRepositoryQueryObserver_observer_matchedAddedObjectIDs_before_extraInfo___block_invoke;
    v22 = &unk_1E63E59C0;
    v23 = self;
    id v24 = v10;
    [(EMMessageRepository *)repository _detectChangesForMatchedAddedObjectIDs:v11 observerationIdentifier:observationIdentifier matchedChangesHandler:&v19];
    v17 = self->_repository;
    v18 = -[_EMMessageRepositoryQueryObserver _precachedItemsFromExtraInfo:](self, "_precachedItemsFromExtraInfo:", v13, v19, v20, v21, v22, v23);
    [(EMMessageRepository *)v17 _addPrecachedItems:v18];
  }
}

- (id)trampoliningObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  if (WeakRetained)
  {
    id v4 = [(EMRepository *)self->_repository trampoliningObserverForObserver:WeakRetained];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)clearInMemoryThreadDataIfNeeded
{
  if (_os_feature_enabled_impl())
  {
    queryHelperObserver = self->_queryHelperObserver;
    if (queryHelperObserver)
    {
      if (![(_EMMessageRepositoryMessageQueryHelperObserver *)queryHelperObserver didUseThreadCollection])
      {
        [(_EMMessageRepositoryQueryObserver *)self setInMemoryThreadQueryHandler:0];
        id v4 = self->_queryHelperObserver;
        self->_queryHelperObserver = 0;
      }
    }
  }
}

- (id)_precachedItemsFromExtraInfo:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"precachedItems"];
  return v3;
}

- (void)performWithRemoteConnection:(id)a3
{
}

- (_EMMessageRepositoryQueryObserver)initWithRepository:(id)a3 query:(id)a4 observer:(id)a5 queryHandlerStorable:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_EMMessageRepositoryQueryObserver;
  v15 = [(_EMMessageRepositoryQueryObserver *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_repository, a3);
    objc_storeStrong((id *)&v16->_query, a4);
    uint64_t v17 = [v13 objectID];
    observationIdentifier = v16->_observationIdentifier;
    v16->_observationIdentifier = (EMObjectID *)v17;

    objc_storeWeak((id *)&v16->_observer, v13);
    uint64_t v19 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E4F60D40]);
    token = v16->_token;
    v16->_token = v19;

    uint64_t v21 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"_EMMessageRepositoryQueryObserver.recoveryScheduler"];
    recoveryScheduler = v16->_recoveryScheduler;
    v16->_recoveryScheduler = (EFScheduler *)v21;

    v16->_recoveryLock._os_unfair_lock_opaque = 0;
    v16->_recoveryAttempt = 0;
    objc_storeWeak((id *)&v16->_queryHandlerStorable, v14);
    [(_EMMessageRepositoryQueryObserver *)v16 _createInMemoryThreadQueryHandlerIfNeeded];
  }

  return v16;
}

- (void)_performQueryWithRemoteConnection:(id)a3 forRecovery:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([(EFCancelationToken *)self->_token isCanceled] & 1) == 0)
  {
    if (v4)
    {
      v7 = [(_EMMessageRepositoryQueryObserver *)self trampoliningObserver];
      [v7 queryDidStartRecovery];

      [(EFCancelationToken *)self->_token removeAllCancelationBlocks];
      v8 = [(_EMMessageRepositoryQueryObserver *)self threadCollection];
      [v8 clearForRecovery];
    }
    v9 = [v6 remoteObjectProxy];
    query = self->_query;
    observationIdentifier = self->_observationIdentifier;
    id v12 = [(_EMMessageRepositoryQueryObserver *)self queryHelperObserver];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83___EMMessageRepositoryQueryObserver__performQueryWithRemoteConnection_forRecovery___block_invoke;
    v13[3] = &unk_1E63E3248;
    v13[4] = self;
    [v9 performQuery:query withObserver:self observationIdentifier:observationIdentifier helperObserver:v12 completionHandler:v13];
  }
}

- (id)queryHelperObserver
{
  if (_os_feature_enabled_impl()
    && !self->_queryHelperObserver
    && [(objc_class *)[(EMQuery *)self->_query targetClass] isEqual:objc_opt_class()])
  {
    [(_EMMessageRepositoryQueryObserver *)self _createInMemoryThreadQueryHandlerIfNeeded];
    v3 = [_EMMessageRepositoryMessageQueryHelperObserver alloc];
    BOOL v4 = [(_EMMessageRepositoryQueryObserver *)self threadCollection];
    v5 = [(_EMMessageRepositoryMessageQueryHelperObserver *)v3 initWithThreadCollection:v4 repository:self->_repository observer:self observationIdentifier:self->_observationIdentifier];
    queryHelperObserver = self->_queryHelperObserver;
    self->_queryHelperObserver = v5;
  }
  v7 = self->_queryHelperObserver;
  return v7;
}

- (void)_createInMemoryThreadQueryHandlerIfNeeded
{
  if (_os_feature_enabled_impl())
  {
    v3 = [(_EMMessageRepositoryQueryObserver *)self inMemoryThreadQueryHandler];
    if (!v3)
    {
      BOOL v4 = [(EMQuery *)self->_query targetClass];
      if (v4 != (objc_class *)objc_opt_class()) {
        return;
      }
      uint64_t v5 = [(_EMMessageRepositoryQueryObserver *)self _createInMemoryThreadQueryHandler];
      -[_EMMessageRepositoryQueryObserver setInMemoryThreadQueryHandler:](self, "setInMemoryThreadQueryHandler:");
      v3 = (void *)v5;
    }
  }
}

- (void)dealloc
{
  [(EFCancelationToken *)self->_token cancel];
  [(_EMMessageRepositoryQueryObserver *)self setInMemoryThreadQueryHandler:0];
  v3.receiver = self;
  v3.super_class = (Class)_EMMessageRepositoryQueryObserver;
  [(_EMMessageRepositoryQueryObserver *)&v3 dealloc];
}

- (void)cancel
{
}

- (EMInMemoryThreadCollection)threadCollection
{
  v2 = [(_EMMessageRepositoryQueryObserver *)self inMemoryThreadQueryHandler];
  objc_super v3 = [v2 threadCollection];

  return (EMInMemoryThreadCollection *)v3;
}

- (void)refreshQueryWithRemoteConnection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[EMMessageRepository log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    observationIdentifier = self->_observationIdentifier;
    query = self->_query;
    v8 = [(EMQuery *)query debugDescription];
    int v10 = 134218754;
    id v11 = self;
    __int16 v12 = 2114;
    id v13 = observationIdentifier;
    __int16 v14 = 2048;
    v15 = query;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Observer:%{public}@ refreshing query<%p>: %@", (uint8_t *)&v10, 0x2Au);
  }
  [(EFCancelable *)self->_remoteCancelable cancel];
  queryHelperObserver = self->_queryHelperObserver;
  self->_queryHelperObserver = 0;

  [(_EMMessageRepositoryQueryObserver *)self setInMemoryThreadQueryHandler:0];
  [(_EMMessageRepositoryQueryObserver *)self _performQueryWithRemoteConnection:v4 forRecovery:1];
}

- (void)recoverWithRemoteConnection:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_recoveryLock);
  int64_t recoveryAttempt = self->_recoveryAttempt;
  if (self->_recoveryIsScheduled)
  {
    os_unfair_lock_unlock(&self->_recoveryLock);
    id v6 = +[EMMessageRepository log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      observationIdentifier = self->_observationIdentifier;
      query = self->_query;
      v9 = [(EMQuery *)query debugDescription];
      *(_DWORD *)buf = 134219010;
      *(void *)&buf[4] = self;
      __int16 v25 = 2114;
      v26 = observationIdentifier;
      __int16 v27 = 2048;
      int64_t v28 = recoveryAttempt;
      __int16 v29 = 2048;
      double v30 = *(double *)&query;
      __int16 v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_1BEFDB000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Observer:%{public}@ recovery attempt %ld already scheduled for query<%p>: %@", buf, 0x34u);
    }
  }
  else
  {
    self->_int64_t recoveryAttempt = recoveryAttempt + 1;
    if (recoveryAttempt)
    {
      self->_recoveryIsScheduled = 1;
      os_unfair_lock_unlock(&self->_recoveryLock);
      if (recoveryAttempt <= 1) {
        double v10 = 2.0;
      }
      else {
        double v10 = 4.0;
      }
      id v11 = +[EMMessageRepository log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = self->_observationIdentifier;
        id v13 = self->_query;
        __int16 v14 = [(EMQuery *)v13 debugDescription];
        *(_DWORD *)buf = 134219266;
        *(void *)&buf[4] = self;
        __int16 v25 = 2114;
        v26 = v12;
        __int16 v27 = 2048;
        int64_t v28 = recoveryAttempt;
        __int16 v29 = 2048;
        double v30 = v10;
        __int16 v31 = 2048;
        v32 = v13;
        __int16 v33 = 2112;
        v34 = v14;
        _os_log_impl(&dword_1BEFDB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Observer:%{public}@ scheduling recovery %ld with %fs delay for query<%p>: %@", buf, 0x3Eu);
      }
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      recoveryScheduler = self->_recoveryScheduler;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __65___EMMessageRepositoryQueryObserver_recoverWithRemoteConnection___block_invoke;
      v21[3] = &unk_1E63E5998;
      objc_copyWeak(v23, (id *)buf);
      v23[1] = (id)recoveryAttempt;
      id v22 = v4;
      id v16 = (id)[(EFScheduler *)recoveryScheduler afterDelay:v21 performBlock:v10];

      objc_destroyWeak(v23);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      os_unfair_lock_unlock(&self->_recoveryLock);
      uint64_t v17 = +[EMMessageRepository log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = self->_observationIdentifier;
        uint64_t v19 = self->_query;
        uint64_t v20 = [(EMQuery *)v19 debugDescription];
        *(_DWORD *)buf = 134219010;
        *(void *)&buf[4] = self;
        __int16 v25 = 2114;
        v26 = v18;
        __int16 v27 = 2048;
        int64_t v28 = 0;
        __int16 v29 = 2048;
        double v30 = *(double *)&v19;
        __int16 v31 = 2112;
        v32 = v20;
        _os_log_impl(&dword_1BEFDB000, v17, OS_LOG_TYPE_DEFAULT, "<%p> Observer:%{public}@ attempting recovery %ld for query<%p>: %@", buf, 0x34u);
      }
      [(_EMMessageRepositoryQueryObserver *)self _performQueryWithRemoteConnection:v4 forRecovery:1];
    }
  }
}

- (void)observer:(id)a3 wasUpdated:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([(EFCancelationToken *)self->_token isCanceled] & 1) == 0)
  {
    v8 = +[EMMessageRepository log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218498;
      double v10 = self;
      __int16 v11 = 2114;
      id v12 = v6;
      __int16 v13 = 2114;
      id v14 = v7;
      _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "<%p> Acknowledging update for %{public}@: %{public}@", (uint8_t *)&v9, 0x20u);
    }

    [v7 invoke];
  }
}

- (void)observer:(id)a3 matchedAddedObjectIDs:(id)a4 after:(id)a5 extraInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (([(EFCancelationToken *)self->_token isCanceled] & 1) == 0)
  {
    id v14 = [(_EMMessageRepositoryQueryObserver *)self trampoliningObserver];
    [v14 queryMatchedAddedObjectIDs:v11 after:v12 extraInfo:v13];

    repository = self->_repository;
    observationIdentifier = self->_observationIdentifier;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __84___EMMessageRepositoryQueryObserver_observer_matchedAddedObjectIDs_after_extraInfo___block_invoke;
    id v22 = &unk_1E63E59C0;
    v23 = self;
    id v24 = v10;
    [(EMMessageRepository *)repository _detectChangesForMatchedAddedObjectIDs:v11 observerationIdentifier:observationIdentifier matchedChangesHandler:&v19];
    uint64_t v17 = self->_repository;
    uint64_t v18 = -[_EMMessageRepositoryQueryObserver _precachedItemsFromExtraInfo:](self, "_precachedItemsFromExtraInfo:", v13, v19, v20, v21, v22, v23);
    [(EMMessageRepository *)v17 _addPrecachedItems:v18];
  }
}

- (void)observer:(id)a3 matchedMovedObjectIDs:(id)a4 before:(id)a5 extraInfo:(id)a6
{
  id v12 = a4;
  id v9 = a5;
  id v10 = a6;
  if (([(EFCancelationToken *)self->_token isCanceled] & 1) == 0)
  {
    id v11 = [(_EMMessageRepositoryQueryObserver *)self trampoliningObserver];
    [v11 queryMatchedMovedObjectIDs:v12 before:v9 extraInfo:v10];
  }
}

- (void)observer:(id)a3 matchedMovedObjectIDs:(id)a4 after:(id)a5 extraInfo:(id)a6
{
  id v12 = a4;
  id v9 = a5;
  id v10 = a6;
  if (([(EFCancelationToken *)self->_token isCanceled] & 1) == 0)
  {
    id v11 = [(_EMMessageRepositoryQueryObserver *)self trampoliningObserver];
    [v11 queryMatchedMovedObjectIDs:v12 after:v9 extraInfo:v10];
  }
}

- (void)observer:(id)a3 matchedChangesForObjectIDs:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (([(EFCancelationToken *)self->_token isCanceled] & 1) == 0)
  {
    [(EMMessageRepository *)self->_repository _applyChangesToCachedObjects:v5];
    id v9 = @"changesByObjectID";
    v10[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v7 = [(_EMMessageRepositoryQueryObserver *)self trampoliningObserver];
    v8 = [v5 allKeys];
    [v7 queryMatchedChangedObjectIDs:v8 extraInfo:v6];
  }
}

- (void)observer:(id)a3 matchedDeletedObjectIDs:(id)a4
{
  id v6 = a4;
  if (([(EFCancelationToken *)self->_token isCanceled] & 1) == 0)
  {
    id v5 = [(_EMMessageRepositoryQueryObserver *)self trampoliningObserver];
    [v5 queryMatchedDeletedObjectIDs:v6];
  }
}

- (void)observerDidFinishRemoteSearch:(id)a3
{
  if (([(EFCancelationToken *)self->_token isCanceled] & 1) == 0)
  {
    id v4 = [(_EMMessageRepositoryQueryObserver *)self trampoliningObserver];
    [v4 queryDidFinishRemoteSearch];
  }
}

- (void)observer:(id)a3 replacedExistingObjectID:(id)a4 withNewObjectID:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  if (([(EFCancelationToken *)self->_token isCanceled] & 1) == 0)
  {
    v8 = [(_EMMessageRepositoryQueryObserver *)self trampoliningObserver];
    [v8 queryReplacedObjectID:v9 withNewObjectID:v7];
  }
}

- (void)observerWillRestart:(id)a3
{
  if (([(EFCancelationToken *)self->_token isCanceled] & 1) == 0)
  {
    id v4 = [(_EMMessageRepositoryQueryObserver *)self trampoliningObserver];
    [v4 queryDidStartRecovery];
  }
}

- (void)observer:(id)a3 matchedOldestItemsUpdatedForMailboxes:(id)a4
{
  id v6 = a4;
  if (([(EFCancelationToken *)self->_token isCanceled] & 1) == 0)
  {
    id v5 = [(_EMMessageRepositoryQueryObserver *)self trampoliningObserver];
    if ([v5 conformsToProtocol:&unk_1F1A71890]) {
      [v5 queryMatchedOldestItemsUpdatedForMailboxesObjectIDs:v6];
    }
  }
}

- (id)_createInMemoryThreadQueryHandler
{
  objc_super v3 = [EMInMemoryThreadQueryHandler alloc];
  repository = self->_repository;
  query = self->_query;
  id v6 = [(EMMessageRepository *)repository mailboxRepository];
  id v7 = [(EMInMemoryThreadQueryHandler *)v3 initWithQuery:query repository:repository mailboxTypeResolver:v6 resultsObserver:self observationIdentifier:self->_observationIdentifier];

  return v7;
}

- (void)setInMemoryThreadQueryHandler:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inMemoryThreadQueryHandler);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_inMemoryThreadQueryHandler);
    objc_storeWeak((id *)&self->_inMemoryThreadQueryHandler, obj);
    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_queryHandlerStorable);
      [v7 removeQueryHandler:v6];
    }
    if (obj)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_queryHandlerStorable);
      [v8 addQueryHandler:obj];
    }
    id v5 = obj;
  }
}

- (EMInMemoryThreadQueryHandler)inMemoryThreadQueryHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inMemoryThreadQueryHandler);
  return (EMInMemoryThreadQueryHandler *)WeakRetained;
}

- (EMObjectID)observationIdentifier
{
  return self->_observationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationIdentifier, 0);
  objc_destroyWeak((id *)&self->_inMemoryThreadQueryHandler);
  objc_destroyWeak((id *)&self->_queryHandlerStorable);
  objc_storeStrong((id *)&self->_queryHelperObserver, 0);
  objc_storeStrong((id *)&self->_recoveryScheduler, 0);
  objc_storeStrong((id *)&self->_remoteCancelable, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_repository, 0);
}

@end