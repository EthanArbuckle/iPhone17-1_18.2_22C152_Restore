@interface _EMMessageRepositoryMailboxPredictionObserver
- (EFCancelationToken)cancelationToken;
- (NSArray)messageObjectIDs;
- (_EMMessageRepositoryMailboxPredictionObserver)initWithMessageObjectIDs:(id)a3 completionHandler:(id)a4;
- (id)completionHandler;
- (void)_performWithRemoteConnection:(id)a3 forRecovery:(BOOL)a4;
- (void)cancel;
- (void)dealloc;
- (void)mailboxWasPredicted:(id)a3;
- (void)performWithRemoteConnection:(id)a3;
- (void)recoverWithRemoteConnection:(id)a3;
@end

@implementation _EMMessageRepositoryMailboxPredictionObserver

- (_EMMessageRepositoryMailboxPredictionObserver)initWithMessageObjectIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_EMMessageRepositoryMailboxPredictionObserver;
  v8 = [(_EMMessageRepositoryMailboxPredictionObserver *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    messageObjectIDs = v8->_messageObjectIDs;
    v8->_messageObjectIDs = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    id completionHandler = v8->_completionHandler;
    v8->_id completionHandler = (id)v11;

    v13 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E4F60D40]);
    cancelationToken = v8->_cancelationToken;
    v8->_cancelationToken = v13;
  }
  return v8;
}

- (void)dealloc
{
  [(_EMMessageRepositoryMailboxPredictionObserver *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)_EMMessageRepositoryMailboxPredictionObserver;
  [(_EMMessageRepositoryMailboxPredictionObserver *)&v3 dealloc];
}

- (void)cancel
{
  id v2 = [(_EMMessageRepositoryMailboxPredictionObserver *)self cancelationToken];
  [v2 cancel];
}

- (void)performWithRemoteConnection:(id)a3
{
}

- (void)recoverWithRemoteConnection:(id)a3
{
}

- (void)_performWithRemoteConnection:(id)a3 forRecovery:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(_EMMessageRepositoryMailboxPredictionObserver *)self cancelationToken];
  if (([v7 isCanceled] & 1) == 0)
  {
    if (v4) {
      [v7 removeAllCancelationBlocks];
    }
    v8 = [v6 remoteObjectProxy];
    uint64_t v9 = [(_EMMessageRepositoryMailboxPredictionObserver *)self messageObjectIDs];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __90___EMMessageRepositoryMailboxPredictionObserver__performWithRemoteConnection_forRecovery___block_invoke;
    v10[3] = &unk_1E63E3248;
    id v11 = v7;
    [v8 predictMailboxForMovingMessages:v9 withObserver:self completionHandler:v10];
  }
}

- (void)mailboxWasPredicted:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(_EMMessageRepositoryMailboxPredictionObserver *)self cancelationToken];
  char v5 = [v4 isCanceled];

  if ((v5 & 1) == 0)
  {
    id v6 = [(_EMMessageRepositoryMailboxPredictionObserver *)self cancelationToken];
    [v6 cancel];

    id v7 = [(_EMMessageRepositoryMailboxPredictionObserver *)self completionHandler];
    ((void (**)(void, id))v7)[2](v7, v8);
  }
}

- (NSArray)messageObjectIDs
{
  return self->_messageObjectIDs;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (EFCancelationToken)cancelationToken
{
  return self->_cancelationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_messageObjectIDs, 0);
}

@end