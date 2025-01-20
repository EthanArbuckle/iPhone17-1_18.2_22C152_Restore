@interface CATOperation
+ (BOOL)automaticallyNotifiesObserversOfCreatedDate;
+ (BOOL)automaticallyNotifiesObserversOfEnqueuedDate;
+ (BOOL)automaticallyNotifiesObserversOfFinishedDate;
+ (BOOL)automaticallyNotifiesObserversOfStartedDate;
+ (BOOL)automaticallyNotifiesObserversOfUUID;
+ (BOOL)isCancelable;
+ (id)callStackSymbols;
+ (id)keyPathsForValuesAffectingIsCanceled;
- (BOOL)canCancel;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isReady;
- (BOOL)whenStateIs:(int)a3 atomicallySwapWith:(int)a4;
- (CATOperation)init;
- (NSDate)createdDate;
- (NSDate)enqueuedDate;
- (NSDate)finishedDate;
- (NSDate)startedDate;
- (NSDictionary)userInfo;
- (NSError)error;
- (NSUUID)UUID;
- (id)description;
- (id)resultObject;
- (id)stateDescription;
- (int64_t)completedUnitCount;
- (int64_t)totalUnitCount;
- (unint64_t)phase;
- (void)addObserver:(id)a3;
- (void)addTarget:(id)a3 selector:(SEL)a4 forOperationEvents:(unint64_t)a5;
- (void)addTarget:(id)a3 selector:(SEL)a4 forOperationEvents:(unint64_t)a5 delegateQueue:(id)a6;
- (void)addTarget:(id)a3 selector:(SEL)a4 forOperationEvents:(unint64_t)a5 userInfo:(id)a6;
- (void)addTarget:(id)a3 selector:(SEL)a4 forOperationEvents:(unint64_t)a5 userInfo:(id)a6 delegateQueue:(id)a7;
- (void)endOperationSuccessfullyIfNeeded;
- (void)endOperationWithError:(id)a3;
- (void)endOperationWithResultObject:(id)a3;
- (void)finalizeOperation;
- (void)operationWillEnqueueOntoOperationQueue:(id)a3;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setCreatedDate:(id)a3;
- (void)setEnqueuedDate:(id)a3;
- (void)setError:(id)a3;
- (void)setFinishedDate:(id)a3;
- (void)setPhase:(unint64_t)a3;
- (void)setResultObject:(id)a3;
- (void)setStartedDate:(id)a3;
- (void)setTotalUnitCount:(int64_t)a3;
- (void)setUUID:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)start;
@end

@implementation CATOperation

+ (BOOL)automaticallyNotifiesObserversOfUUID
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfCreatedDate
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfEnqueuedDate
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfStartedDate
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfFinishedDate
{
  return 0;
}

+ (BOOL)isCancelable
{
  return 0;
}

- (CATOperation)init
{
  v13.receiver = self;
  v13.super_class = (Class)CATOperation;
  v2 = [(CATOperation *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    createdDate = v2->_createdDate;
    v2->_createdDate = (NSDate *)v3;

    uint64_t v5 = [MEMORY[0x263F08C38] UUID];
    UUID = v2->_UUID;
    v2->_UUID = (NSUUID *)v5;

    v2->_completedUnitCount = -1;
    v2->_totalUnitCount = -1;
    uint64_t v7 = objc_opt_new();
    mLock = v2->mLock;
    v2->mLock = (NSLock *)v7;

    v9 = [NSString stringWithFormat:@"%@.%p", objc_opt_class(), v2];
    [(NSLock *)v2->mLock setName:v9];

    v10 = [[_CATObserverManager alloc] initWithOperation:v2];
    mObserverManager = v2->mObserverManager;
    v2->mObserverManager = v10;
  }
  return v2;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CATOperation *)self name];
  v6 = [(CATOperation *)self UUID];
  uint64_t v7 = [v6 UUIDString];
  v8 = [(CATOperation *)self stateDescription];
  v9 = [v3 stringWithFormat:@"<%@: %p { name = %@, ID = %@, state = %@, completed = %ld/%ld }>", v4, self, v5, v7, v8, -[CATOperation completedUnitCount](self, "completedUnitCount"), -[CATOperation totalUnitCount](self, "totalUnitCount")];

  return v9;
}

- (id)stateDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = aA[![(CATOperation *)self isAsynchronous]];
  unsigned int v5 = atomic_load((unsigned int *)&self->mState);
  return (id)objc_msgSend(v3, "stringWithFormat:", @"%c%c%c [%ld]", v4, aReeeef[v5], aC[!-[CATOperation isCanceled](self, "isCanceled")], -[CATOperation queuePriority](self, "queuePriority"));
}

- (BOOL)isAsynchronous
{
  return 0;
}

+ (id)keyPathsForValuesAffectingIsCanceled
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"isCancelled"];
}

- (BOOL)isReady
{
  if ([(CATOperation *)self whenStateIs:0 atomicallySwapWith:1])
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    [(CATOperation *)self setEnqueuedDate:v3];

    [(CATOperation *)self setPhase:1];
  }
  v5.receiver = self;
  v5.super_class = (Class)CATOperation;
  return [(CATOperation *)&v5 isReady];
}

- (BOOL)isExecuting
{
  return [(CATOperation *)self phase] == 2;
}

- (BOOL)isFinished
{
  return [(CATOperation *)self phase] == 3;
}

- (void)start
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (![(CATOperation *)self whenStateIs:1 atomicallySwapWith:2])
  {
    objc_super v13 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v14 = atomic_load((unsigned int *)&self->mState);
    [v13 handleFailureInMethod:a2, self, @"CATOperation.m", 234, @"%@ cannot transition to '_CATOperationStateStarting' from state (%d).", self, v14 object file lineNumber description];
  }
  uint64_t v4 = (void *)MEMORY[0x2166930C0]();
  [(CATOperation *)self operationWillStart];
  objc_super v5 = [MEMORY[0x263EFF910] date];
  [(CATOperation *)self setStartedDate:v5];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(CATOperation *)self dependencies];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v17.receiver = self;
        v17.super_class = (Class)CATOperation;
        [(CATOperation *)&v17 removeDependency:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  if (![(CATOperation *)self whenStateIs:2 atomicallySwapWith:3])
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v16 = atomic_load((unsigned int *)&self->mState);
    [v15 handleFailureInMethod:a2, self, @"CATOperation.m", 250, @"%@ cannot transition to '_CATOperationStateRunning' from state (%d).", self, v16 object file lineNumber description];
  }
  if ([(CATOperation *)self isCanceled])
  {
    v12 = CATErrorWithCodeAndUserInfo(404, 0);
    [(CATOperation *)self endOperationWithError:v12];
  }
  else
  {
    [(CATOperation *)self willChangeValueForKey:@"isExecuting"];
    [(CATOperation *)self setPhase:2];
    [(CATOperation *)self didChangeValueForKey:@"isExecuting"];
    [(_CATObserverManager *)self->mObserverManager operationDidStart:self];
    [(CATOperation *)self main];
    if (![(CATOperation *)self isAsynchronous]) {
      [(CATOperation *)self endOperationSuccessfullyIfNeeded];
    }
  }
}

- (void)endOperationSuccessfullyIfNeeded
{
  id obj = [(id)objc_opt_class() callStackSymbols];
  [(NSLock *)self->mLock lock];
  if ([(CATOperation *)self whenStateIs:3 atomicallySwapWith:4])
  {
    objc_storeStrong((id *)&self->mCallStackSymbols, obj);
    [(NSLock *)self->mLock unlock];
    [(CATOperation *)self finalizeOperation];
  }
  else
  {
    [(NSLock *)self->mLock unlock];
  }
}

- (void)endOperationWithResultObject:(id)a3
{
  id v11 = a3;
  objc_super v5 = [(id)objc_opt_class() callStackSymbols];
  [(NSLock *)self->mLock lock];
  if ([(CATOperation *)self whenStateIs:3 atomicallySwapWith:4])
  {
    objc_storeStrong((id *)&self->mCallStackSymbols, v5);
    [(NSLock *)self->mLock unlock];
    [(CATOperation *)self setResultObject:v11];
    [(CATOperation *)self finalizeOperation];
  }
  else
  {
    int v6 = atomic_load((unsigned int *)&self->mState);
    [(NSLock *)self->mLock unlock];
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v8 = NSStringFromSelector(a2);
    uint64_t v9 = (void *)v8;
    if (v6 > 4)
    {
      [v7 handleFailureInMethod:a2, self, @"CATOperation.m", 311, @"%@ cannot call %@ when operation is already finished. Previous call:\n%@", self, v8, self->mCallStackSymbols object file lineNumber description];
    }
    else
    {
      signed int v10 = atomic_load((unsigned int *)&self->mState);
      [v7 handleFailureInMethod:a2, self, @"CATOperation.m", 307, @"%@ cannot call %@ when operation's state is %ld", self, v8, v10 object file lineNumber description];
    }
  }
}

- (void)endOperationWithError:(id)a3
{
  id v13 = a3;
  objc_super v5 = [(id)objc_opt_class() callStackSymbols];
  if (!v13)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    v12 = NSStringFromSelector(a2);
    [v11 handleFailureInMethod:a2, self, @"CATOperation.m", 319, @"%@ cannot call %@ when the specified error is nil.", self, v12 object file lineNumber description];
  }
  [(NSLock *)self->mLock lock];
  if ([(CATOperation *)self whenStateIs:3 atomicallySwapWith:4])
  {
    objc_storeStrong((id *)&self->mCallStackSymbols, v5);
    [(NSLock *)self->mLock unlock];
    [(CATOperation *)self setError:v13];
    [(CATOperation *)self finalizeOperation];
  }
  else
  {
    int v6 = atomic_load((unsigned int *)&self->mState);
    [(NSLock *)self->mLock unlock];
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v8 = NSStringFromSelector(a2);
    uint64_t v9 = (void *)v8;
    if (v6 > 4)
    {
      [v7 handleFailureInMethod:a2, self, @"CATOperation.m", 336, @"%@ cannot call %@ when operation is already finished. Previous call:\n%@", self, v8, self->mCallStackSymbols object file lineNumber description];
    }
    else
    {
      signed int v10 = atomic_load((unsigned int *)&self->mState);
      [v7 handleFailureInMethod:a2, self, @"CATOperation.m", 332, @"%@ cannot call %@ when operation's state is %ld", self, v8, v10 object file lineNumber description];
    }
  }
}

+ (id)callStackSymbols
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"CATCaptureCallStackSymbols"];
  uint64_t v4 = (void *)v3;
  objc_super v5 = (void *)MEMORY[0x263EFFA80];
  if (v3) {
    objc_super v5 = (void *)v3;
  }
  id v6 = v5;

  int v7 = [v6 BOOLValue];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F08B88] callStackSymbols];
    uint64_t v9 = (void *)[v8 copy];

    signed int v10 = objc_msgSend(v9, "subarrayWithRange:", 1, objc_msgSend(v9, "count") - 1);
  }
  else
  {
    signed int v10 = &unk_26C4B5E50;
  }

  return v10;
}

- (void)finalizeOperation
{
  [(CATOperation *)self operationWillFinish];
  if ([(CATOperation *)self whenStateIs:4 atomicallySwapWith:5])
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    [(CATOperation *)self setFinishedDate:v3];

    [(CATOperation *)self willChangeValueForKey:@"isExecuting"];
    [(CATOperation *)self willChangeValueForKey:@"isFinished"];
    [(CATOperation *)self setPhase:3];
    [(CATOperation *)self didChangeValueForKey:@"isFinished"];
    [(CATOperation *)self didChangeValueForKey:@"isExecuting"];
    [(CATOperation *)self operationDidFinish];
    mObserverManager = self->mObserverManager;
    [(_CATObserverManager *)mObserverManager operationDidFinish:self];
  }
}

- (void)operationWillEnqueueOntoOperationQueue:(id)a3
{
  if ([(CATOperation *)self whenStateIs:0 atomicallySwapWith:1])
  {
    uint64_t v4 = [MEMORY[0x263EFF910] date];
    [(CATOperation *)self setEnqueuedDate:v4];

    [(CATOperation *)self setPhase:1];
  }
}

- (BOOL)whenStateIs:(int)a3 atomicallySwapWith:(int)a4
{
  int v4 = a3;
  atomic_compare_exchange_strong(&self->mState, (unsigned int *)&v4, a4);
  return v4 == a3;
}

- (void)addObserver:(id)a3
{
}

- (void)addTarget:(id)a3 selector:(SEL)a4 forOperationEvents:(unint64_t)a5
{
}

- (void)addTarget:(id)a3 selector:(SEL)a4 forOperationEvents:(unint64_t)a5 userInfo:(id)a6
{
}

- (void)addTarget:(id)a3 selector:(SEL)a4 forOperationEvents:(unint64_t)a5 delegateQueue:(id)a6
{
}

- (void)addTarget:(id)a3 selector:(SEL)a4 forOperationEvents:(unint64_t)a5 userInfo:(id)a6 delegateQueue:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  v15 = [[_CATOperationTargetSelectorObserver alloc] initWithTarget:v14 selector:a4 events:a5 userInfo:v13 delegateQueue:v12];

  [(CATOperation *)self addObserver:v15];
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 288, 1);
}

- (void)setUUID:(id)a3
{
}

- (NSDate)createdDate
{
  return (NSDate *)objc_getProperty(self, a2, 296, 1);
}

- (void)setCreatedDate:(id)a3
{
}

- (NSDate)enqueuedDate
{
  return (NSDate *)objc_getProperty(self, a2, 304, 1);
}

- (void)setEnqueuedDate:(id)a3
{
}

- (NSDate)startedDate
{
  return (NSDate *)objc_getProperty(self, a2, 312, 1);
}

- (void)setStartedDate:(id)a3
{
}

- (NSDate)finishedDate
{
  return (NSDate *)objc_getProperty(self, a2, 320, 1);
}

- (void)setFinishedDate:(id)a3
{
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 336, 1);
}

- (void)setError:(id)a3
{
}

- (id)resultObject
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setResultObject:(id)a3
{
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 352, 1);
}

- (void)setUserInfo:(id)a3
{
}

- (BOOL)canCancel
{
  return self->_canCancel;
}

- (int64_t)completedUnitCount
{
  return self->_completedUnitCount;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  self->_completedUnitCount = a3;
}

- (int64_t)totalUnitCount
{
  return self->_totalUnitCount;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  self->_totalUnitCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong(&self->_resultObject, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_finishedDate, 0);
  objc_storeStrong((id *)&self->_startedDate, 0);
  objc_storeStrong((id *)&self->_enqueuedDate, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->mObserverManager, 0);
  objc_storeStrong((id *)&self->mLock, 0);

  objc_storeStrong((id *)&self->mCallStackSymbols, 0);
}

@end