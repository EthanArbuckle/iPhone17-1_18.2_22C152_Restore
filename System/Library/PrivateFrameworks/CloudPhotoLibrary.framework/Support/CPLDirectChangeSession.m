@interface CPLDirectChangeSession
+ selfCrashResetReason;
- (BOOL)processSessionContext:(id)a3 inStore:(id)a4 error:(id *)a5;
- (BOOL)tearedDown;
- (CPLDirectChangeSession)initWithAbstractObject:(id)a3;
- (id)clientWorkDescription;
- (void)beginClientWork;
- (void)beginSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)discardTentativeResetReason;
- (void)dispatchCallback:(id)a3;
- (void)endClientWork;
- (void)finalizeWithCompletionHandler:(id)a3;
- (void)registerTentativeResetReason;
- (void)tearDownWithCompletionHandler:(id)a3;
@end

@implementation CPLDirectChangeSession

- (CPLDirectChangeSession)initWithAbstractObject:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CPLDirectChangeSession;
  v3 = [(CPLDirectChangeSession *)&v11 initWithAbstractObject:a3];
  if (v3)
  {
    v4 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.cpl.session.lock", v4);
    lock = v3->_lock;
    v3->_lock = (OS_dispatch_queue *)v5;

    v7 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.cpl.session.callback", v7);
    callbackQueue = v3->_callbackQueue;
    v3->_callbackQueue = (OS_dispatch_queue *)v8;
  }
  return v3;
}

- (id)clientWorkDescription
{
  v4 = +[NSAssertionHandler currentHandler];
  dispatch_queue_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/DirectClientToEngine/CPLDirectChangeSession.m"];
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 44, @"%@ should be implemented by subclasses", v6 object file lineNumber description];

  abort();
}

- (void)beginClientWork
{
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001700DC;
  block[3] = &unk_100275EA0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)lock, block);
}

- (BOOL)processSessionContext:(id)a3 inStore:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 scopes];
  v10 = [v8 mainScopeIdentifier];

  objc_super v11 = [v9 scopeWithIdentifier:v10];

  if (v11
    && ((id v12 = [v7 estimatedInitialSizeForLocalLibrary],
         id v13 = [v7 estimatedInitialAssetCountForLocalLibrary],
         id v14 = [v9 estimatedSizeForScope:v11],
         v13 > [v9 estimatedAssetCountForScope:v11])
     || v12 > v14))
  {
    unsigned __int8 v15 = [v9 storeEstimatedSize:v12 estimatedAssetCount:v13 forScope:v11 error:a5];
  }
  else
  {
    unsigned __int8 v15 = 1;
  }

  return v15;
}

- (void)beginSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = +[NSAssertionHandler currentHandler];
  id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/DirectClientToEngine/CPLDirectChangeSession.m"];
  id v14 = NSStringFromSelector(a2);
  [v12 handleFailureInMethod:a2, self, v13, 81, @"%@ should be implemented by subclasses", v14 object file lineNumber description];

  abort();
}

- (void)finalizeWithCompletionHandler:(id)a3
{
  id v5 = a3;
  v6 = +[NSAssertionHandler currentHandler];
  id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/DirectClientToEngine/CPLDirectChangeSession.m"];
  id v8 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 85, @"%@ should be implemented by subclasses", v8 object file lineNumber description];

  abort();
}

- (void)endClientWork
{
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001704A4;
  block[3] = &unk_100275EA0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)lock, block);
}

- (void)tearDownWithCompletionHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  [(CPLDirectChangeSession *)self discardTentativeResetReason];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100170754;
  block[3] = &unk_1002768A8;
  block[4] = self;
  void block[5] = &v17;
  dispatch_sync((dispatch_queue_t)lock, block);
  if (*((unsigned char *)v18 + 24))
  {
    v6 = [(CPLDirectChangeSession *)self abstractObject];
    id v7 = [v6 libraryManager];
    id v8 = [v7 platformObject];
    id v9 = [v8 engineLibrary];
    id v10 = [v9 store];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100170854;
    v13[3] = &unk_10027DE50;
    id v11 = v10;
    id v14 = v11;
    unsigned __int8 v15 = v4;
    id v12 = [v11 performReadTransactionWithBlock:v13];
  }
  else
  {
    v4[2](v4);
  }
  _Block_object_dispose(&v17, 8);
}

- (void)dispatchCallback:(id)a3
{
  id v4 = a3;
  callbackQueue = self->_callbackQueue;
  id v6 = v4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100170C68;
  block[3] = &unk_100275DF8;
  id v10 = v6;
  id v7 = callbackQueue;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v8);
}

- (BOOL)tearedDown
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100170A14;
  v5[3] = &unk_100275F88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ selfCrashResetReason
{
  void *v2;
  uint64_t vars8;

  if (qword_1002DBD00 != -1) {
    dispatch_once(&qword_1002DBD00, &stru_10027EB28);
  }
  v2 = (void *)qword_1002DBD08;
  return v2;
}

- (void)registerTentativeResetReason
{
  if (self->_tentativeReason) {
    sub_1001D0118(a2, (uint64_t)self);
  }
  id v5 = [(id)objc_opt_class() selfCrashResetReason];
  char v3 = +[CPLResetTracker registerTentativeResetReasonIfCrashing:v5];
  tentativeReason = self->_tentativeReason;
  self->_tentativeReason = v3;
}

- (void)discardTentativeResetReason
{
  if (self->_tentativeReason)
  {
    +[CPLResetTracker discardTentativeResetReason:](CPLResetTracker, "discardTentativeResetReason:");
    tentativeReason = self->_tentativeReason;
    self->_tentativeReason = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tentativeReason, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end