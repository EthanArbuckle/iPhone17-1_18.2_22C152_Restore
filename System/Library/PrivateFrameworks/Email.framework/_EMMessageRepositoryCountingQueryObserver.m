@interface _EMMessageRepositoryCountingQueryObserver
- (EFPair)queryIdentifier;
- (_EMMessageRepositoryCountingQueryObserver)initWithRepository:(id)a3 queryIdentifier:(id)a4 includingServerCountsForMailboxScope:(id)a5 observer:(id)a6;
- (void)_performQueryWithRemoteConnection:(id)a3 forRecovery:(BOOL)a4;
- (void)cancel;
- (void)countDidChange:(int64_t)a3 acknowledgementToken:(id)a4;
- (void)dealloc;
- (void)performWithRemoteConnection:(id)a3;
- (void)recoverWithRemoteConnection:(id)a3;
@end

@implementation _EMMessageRepositoryCountingQueryObserver

- (void)countDidChange:(int64_t)a3 acknowledgementToken:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = +[EMMessageRepository log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(_EMMessageRepositoryCountingQueryObserver *)self queryIdentifier];
    int v16 = 134218498;
    v17 = self;
    __int16 v18 = 2114;
    v19 = v8;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl(&dword_1BEFDB000, v7, OS_LOG_TYPE_DEFAULT, "<%p> Acknowledging count update for %{public}@: %{public}@", (uint8_t *)&v16, 0x20u);
  }
  [v6 invoke];
  if (([(EFCancelationToken *)self->_token isCanceled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    if (WeakRetained)
    {
      repository = self->_repository;
      v11 = [NSNumber numberWithInteger:a3];
      v12 = [(_EMMessageRepositoryCountingQueryObserver *)self queryIdentifier];
      [(EMMessageRepository *)repository setQueryCount:v11 forQueryIdentifier:v12];

      v13 = [(EMRepository *)self->_repository trampoliningObserverForObserver:WeakRetained];
      v14 = self->_repository;
      v15 = [(EFPair *)self->_queryIdentifier first];
      [v13 messageRepository:v14 query:v15 countDidChange:a3];
    }
    else
    {
      [(_EMMessageRepositoryCountingQueryObserver *)self cancel];
    }
  }
}

- (EFPair)queryIdentifier
{
  return (EFPair *)objc_getProperty(self, a2, 48, 1);
}

- (void)_performQueryWithRemoteConnection:(id)a3 forRecovery:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([(EFCancelationToken *)self->_token isCanceled] & 1) == 0)
  {
    if (v4) {
      [(EFCancelationToken *)self->_token removeAllCancelationBlocks];
    }
    v7 = [v6 remoteObjectProxy];
    v8 = [(EFPair *)self->_queryIdentifier first];
    serverCountMailboxScope = self->_serverCountMailboxScope;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __91___EMMessageRepositoryCountingQueryObserver__performQueryWithRemoteConnection_forRecovery___block_invoke;
    v10[3] = &unk_1E63E3248;
    v10[4] = self;
    [v7 startCountingQuery:v8 includingServerCountsForMailboxScope:serverCountMailboxScope withObserver:self completionHandler:v10];
  }
}

- (void)performWithRemoteConnection:(id)a3
{
}

- (_EMMessageRepositoryCountingQueryObserver)initWithRepository:(id)a3 queryIdentifier:(id)a4 includingServerCountsForMailboxScope:(id)a5 observer:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_EMMessageRepositoryCountingQueryObserver;
  v15 = [(_EMMessageRepositoryCountingQueryObserver *)&v20 init];
  int v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_repository, a3);
    objc_storeStrong((id *)&v16->_serverCountMailboxScope, a5);
    objc_storeWeak((id *)&v16->_observer, v14);
    v17 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E4F60D40]);
    token = v16->_token;
    v16->_token = v17;

    objc_storeStrong((id *)&v16->_queryIdentifier, a4);
  }

  return v16;
}

- (void)cancel
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryIdentifier, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_serverCountMailboxScope, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_repository, 0);
}

- (void)dealloc
{
  [(EFCancelationToken *)self->_token cancel];
  v3.receiver = self;
  v3.super_class = (Class)_EMMessageRepositoryCountingQueryObserver;
  [(_EMMessageRepositoryCountingQueryObserver *)&v3 dealloc];
}

- (void)recoverWithRemoteConnection:(id)a3
{
}

@end