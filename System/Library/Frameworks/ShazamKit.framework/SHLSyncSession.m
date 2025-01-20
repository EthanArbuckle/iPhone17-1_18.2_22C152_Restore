@interface SHLSyncSession
- (BOOL)commitTransactionWithError:(id *)a3;
- (BOOL)startTransactionWithError:(id *)a3;
- (BOOL)undoTransactionWithError:(id *)a3;
- (OS_dispatch_queue)sessionDispatchQueue;
- (SHLLocalStateTransactionable)transaction;
- (SHLSyncSession)initWithConfiguration:(id)a3;
- (SHLSyncSessionDelegate)delegate;
- (SHLTaskSchedulerFactory)schedulerFactory;
- (void)executeFetchTask:(id)a3;
- (void)executeModifyTask:(id)a3;
- (void)executeTask:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSchedulerFactory:(id)a3;
- (void)setSessionDispatchQueue:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation SHLSyncSession

- (SHLSyncSession)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHLSyncSession;
  v5 = [(SHLSyncSession *)&v11 init];
  if (v5)
  {
    v6 = [[SHLTaskSchedulerFactory alloc] initWithConfiguration:v4];
    schedulerFactory = v5->_schedulerFactory;
    v5->_schedulerFactory = v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.shazam.ShazamLibrary.syncSession.dispatchQueue", 0);
    sessionDispatchQueue = v5->_sessionDispatchQueue;
    v5->_sessionDispatchQueue = (OS_dispatch_queue *)v8;
  }
  return v5;
}

- (void)executeTask:(id)a3
{
  id v5 = a3;
  id v4 = [v5 type];
  if (v4 == (id)1)
  {
    [(SHLSyncSession *)self executeFetchTask:v5];
  }
  else if (!v4)
  {
    [(SHLSyncSession *)self executeModifyTask:v5];
  }
}

- (void)executeModifyTask:(id)a3
{
  id v4 = a3;
  id v5 = [(SHLSyncSession *)self delegate];
  unsigned __int8 v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___SHLSyncSessionModifyTaskDelegate];

  if ((v6 & 1) == 0)
  {
    id v13 = +[NSException shl_exceptionWithName:NSInvalidArgumentException reason:@"You must conform to the protocol of the modify task you're trying to add."];
    objc_exception_throw(v13);
  }
  v7 = [(SHLSyncSession *)self delegate];
  [v4 setDelegate:v7];

  [v4 setSession:self];
  dispatch_queue_t v8 = [(SHLSyncSession *)self schedulerFactory];
  v9 = [v8 modifyTaskScheduler];

  objc_initWeak(&location, self);
  v10 = [v9 preconditions];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100040D64;
  v14[3] = &unk_100075EF8;
  objc_copyWeak(&v17, &location);
  id v11 = v4;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  +[SHLTaskPreconditionEvaluator evaluatePreconditions:v10 withCompletion:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)executeFetchTask:(id)a3
{
  id v4 = a3;
  id v5 = [(SHLSyncSession *)self delegate];
  unsigned __int8 v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___SHLSyncSessionFetchTaskDelegate];

  if ((v6 & 1) == 0)
  {
    id v13 = +[NSException shl_exceptionWithName:NSInvalidArgumentException reason:@"You must conform to the protocol of the fetch task you're trying to add."];
    objc_exception_throw(v13);
  }
  v7 = [(SHLSyncSession *)self delegate];
  [v4 setDelegate:v7];

  [v4 setSession:self];
  dispatch_queue_t v8 = [(SHLSyncSession *)self schedulerFactory];
  v9 = [v8 fetchTaskScheduler];

  objc_initWeak(&location, self);
  v10 = [v9 preconditions];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100041194;
  v14[3] = &unk_100075EF8;
  objc_copyWeak(&v17, &location);
  id v11 = v4;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  +[SHLTaskPreconditionEvaluator evaluatePreconditions:v10 withCompletion:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (BOOL)startTransactionWithError:(id *)a3
{
  id v5 = [(SHLSyncSession *)self schedulerFactory];
  unsigned __int8 v6 = [v5 createTransaction];
  [(SHLSyncSession *)self setTransaction:v6];

  v7 = [(SHLSyncSession *)self transaction];
  LOBYTE(a3) = [v7 startTransactionWithError:a3];

  return (char)a3;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  id v5 = [(SHLSyncSession *)self transaction];
  LOBYTE(a3) = [v5 commitTransactionWithError:a3];

  [(SHLSyncSession *)self setTransaction:0];
  return (char)a3;
}

- (BOOL)undoTransactionWithError:(id *)a3
{
  id v5 = [(SHLSyncSession *)self transaction];
  LOBYTE(a3) = [v5 undoTransactionWithError:a3];

  [(SHLSyncSession *)self setTransaction:0];
  return (char)a3;
}

- (SHLSyncSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHLSyncSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHLTaskSchedulerFactory)schedulerFactory
{
  return self->_schedulerFactory;
}

- (void)setSchedulerFactory:(id)a3
{
}

- (SHLLocalStateTransactionable)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (OS_dispatch_queue)sessionDispatchQueue
{
  return self->_sessionDispatchQueue;
}

- (void)setSessionDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_schedulerFactory, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end