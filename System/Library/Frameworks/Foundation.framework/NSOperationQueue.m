@interface NSOperationQueue
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (NSOperationQueue)currentQueue;
+ (NSOperationQueue)mainQueue;
- (BOOL)isSuspended;
- (BOOL)overcommitsOperations;
- (NSArray)operations;
- (NSInteger)maxConcurrentOperationCount;
- (NSOperationQueue)init;
- (NSProgress)progress;
- (NSQualityOfService)qualityOfService;
- (NSString)description;
- (NSString)name;
- (NSUInteger)operationCount;
- (dispatch_queue_t)underlyingQueue;
- (id)__graphDescription;
- (void)_fc_addUncancellableOperationForReactorID:(id)a3 block:(id)a4;
- (void)_fc_addUncancellableOperationWithBlock:(id)a3;
- (void)addBarrierBlock:(void *)barrier;
- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)addOperation:(NSOperation *)op;
- (void)addOperationWithBlock:(void *)block;
- (void)addOperations:(NSArray *)ops waitUntilFinished:(BOOL)wait;
- (void)cancelAllOperations;
- (void)dealloc;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4;
- (void)setMaxConcurrentOperationCount:(NSInteger)maxConcurrentOperationCount;
- (void)setName:(NSString *)name;
- (void)setOvercommitsOperations:(BOOL)a3;
- (void)setQualityOfService:(NSQualityOfService)qualityOfService;
- (void)setSuspended:(BOOL)suspended;
- (void)setUnderlyingQueue:(dispatch_queue_t)underlyingQueue;
- (void)waitUntilAllOperationsAreFinished;
@end

@implementation NSOperationQueue

- (void)addOperation:(NSOperation *)op
{
}

void __28__NSOperationQueue_setName___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40)) {
    v3 = *(__CFString **)(a1 + 40);
  }
  else {
    v3 = &stru_1ECA5C228;
  }
  v4 = *(void **)(v2 + 192);
  *(void *)(v2 + 192) = [(__CFString *)v3 copy];

  v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);

  os_unfair_lock_unlock(v5);
}

uint64_t __33__NSOperationQueue_setSuspended___block_invoke(uint64_t result)
{
  return result;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (([a3 isEqualToString:@"operations"] & 1) != 0
    || ([a3 isEqualToString:@"operationCount"] & 1) != 0
    || ([a3 isEqualToString:@"suspended"] & 1) != 0
    || ([a3 isEqualToString:@"operationCount"] & 1) != 0
    || ([a3 isEqualToString:@"name"] & 1) != 0
    || ([a3 isEqualToString:@"qualityOfService"] & 1) != 0)
  {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NSOperationQueue;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_iqp.__mainQ)
  {
    __break(1u);
LABEL_10:
    objc_super v6 = 0;
    goto LABEL_8;
  }
  uint64_t v2 = self;
  dispatch_queue = self->_iqp.__dispatch_queue;
  if (dispatch_queue) {
    dispatch_release(dispatch_queue);
  }
  v2->_iqp.__dispatch_queue = 0;
  backingQueue = v2->_iqp.__backingQueue;
  if (backingQueue) {
    dispatch_release(backingQueue);
  }

  progress = v2->_iqp._progress;
  if (!progress) {
    goto LABEL_10;
  }
  os_unfair_lock_lock(&progress->_queueLock);
  progress->_queue = 0;
  os_unfair_lock_unlock(&progress->_queueLock);
  objc_super v6 = v2->_iqp._progress;
LABEL_8:

  v7.receiver = v2;
  v7.super_class = (Class)NSOperationQueue;
  [(NSOperationQueue *)&v7 dealloc];
}

- (NSOperationQueue)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!_NSIsMultiThreaded)
  {
    _NSIsMultiThreaded = 1;
    [+[NSNotificationCenter defaultCenter] postNotificationName:@"NSWillBecomeMultiThreadedNotification" object:0 userInfo:0];
  }
  v9.receiver = self;
  v9.super_class = (Class)NSOperationQueue;
  v3 = [(NSOperationQueue *)&v9 init];
  v4 = [[NSPointerArray alloc] initWithOptions:258];
  v3->_iqp.__queueLock._os_unfair_lock_opaque = 0;
  v3->_iqp.__activeThreads = v4;
  v3->_iqp.__maxNumOps = -1;
  v3->_iqp.__actualMaxNumOps = 0x7FFFFFFF;
  v5 = +[NSString stringWithFormat:@"NSOperationQueue %p", v3];
  name = v3->_iqp.__name;
  v3->_iqp.__name = (NSString *)[(NSString *)v5 copy];

  if (atomic_exchange((atomic_uchar *volatile)&v3->_iqp.__propertyQoS, 0))
  {
    backingQueue = v3->_iqp.__backingQueue;
    v3->_iqp.__backingQueue = 0;
    v3->_iqp.__nameBuffer[0] = 0;
    if (backingQueue) {
      dispatch_release(backingQueue);
    }
  }
  return v3;
}

- (void)waitUntilAllOperationsAreFinished
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = self;
  for (i = objc_opt_new(); ; [i removeAllObjects])
  {
    __NSOperationQueueGetOperations((uint64_t)self, i, 1);
    if (![i count]) {
      break;
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [i countByEnumeratingWithState:&v10 objects:v9 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(i);
          }
          __NSOPERATIONQUEUE_IS_WAITING_ON_AN_OPERATION__(*(void **)(*((void *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        uint64_t v6 = [i countByEnumeratingWithState:&v10 objects:v9 count:16];
      }
      while (v6);
    }
  }
}

- (void)cancelAllOperations
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!self->_iqp.__mainQ)
  {
    v3 = (void *)[MEMORY[0x1E4F1CA48] array];
    __NSOperationQueueGetOperations((uint64_t)self, v3, 1);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          __NSOPERATIONQUEUE_IS_CANCELLING_AN_OPERATION__(*(void **)(*((void *)&v9 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
      }
      while (v5);
    }
  }
}

- (void)setUnderlyingQueue:(dispatch_queue_t)underlyingQueue
{
  if (!self->_iqp.__mainQ)
  {
    if (__NSOperationQueueGetOperations((uint64_t)self, 0, 1))
    {
      uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: operation queue must be empty in order to change underlying dispatch queue", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
      objc_exception_throw(v7);
    }
    if (underlyingQueue) {
      dispatch_retain(underlyingQueue);
    }
    dispatch_queue = self->_iqp.__dispatch_queue;
    if (dispatch_queue) {
      dispatch_release(dispatch_queue);
    }
    self->_iqp.__dispatch_queue = (OS_dispatch_queue *)underlyingQueue;
  }
}

- (NSArray)operations
{
  v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  __NSOperationQueueGetOperations((uint64_t)self, v3, 0);
  return v3;
}

- (void)addOperations:(NSArray *)ops waitUntilFinished:(BOOL)wait
{
  BOOL v4 = wait;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  __addOperations((objc_class *)self, a2, 0, (unint64_t)ops, 0);
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = [(NSArray *)ops countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(ops);
          }
          __NSOPERATIONQUEUE_IS_WAITING_ON_AN_OPERATION__(*(void **)(*((void *)&v11 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)ops countByEnumeratingWithState:&v11 objects:v10 count:16];
      }
      while (v7);
    }
  }
}

- (void)setSuspended:(BOOL)suspended
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!self->_iqp.__mainQ)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __33__NSOperationQueue_setSuspended___block_invoke;
    v5[3] = &unk_1E51F9698;
    v5[4] = self;
    BOOL v6 = suspended;
    [(NSOperationQueue *)self _changeValueForKeys:&_NSOperationQueueSuspendedKeys count:1 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:v5];
    if (!suspended) {
      __NSOQSchedule((uint64_t)self);
    }
  }
}

- (void)addOperationWithBlock:(void *)block
{
  BOOL v4 = +[NSBlockOperation blockOperationWithBlock:block];
  uint64_t property_qos = oq_get_property_qos((uint64_t)self);
  if (property_qos) {
    [(NSOperation *)v4 setQualityOfService:property_qos];
  }

  [(NSOperationQueue *)self addOperation:v4];
}

- (void)setName:(NSString *)name
{
  v3[6] = *MEMORY[0x1E4F143B8];
  if (!self->_iqp.__mainQ)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __28__NSOperationQueue_setName___block_invoke;
    v3[3] = &unk_1E51F6678;
    v3[4] = self;
    v3[5] = name;
    [(NSOperationQueue *)self _changeValueForKeys:_NSOperationNameKeys count:1 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:v3];
  }
}

- (void)setQualityOfService:(NSQualityOfService)qualityOfService
{
  v5[6] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (unint64_t)(qualityOfService + 1) > 0x22
    || ((1 << (qualityOfService + 1)) & 0x404040441) == 0;
  NSQualityOfService v4 = NSQualityOfServiceDefault;
  if (!v3) {
    NSQualityOfService v4 = qualityOfService;
  }
  if (!self->_iqp.__mainQ)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40__NSOperationQueue_setQualityOfService___block_invoke;
    v5[3] = &unk_1E51F8B80;
    v5[4] = self;
    void v5[5] = v4;
    [(NSOperationQueue *)self _changeValueForKeys:&_NSOperationQualityOfServiceKeys count:1 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:v5];
  }
}

+ (NSOperationQueue)mainQueue
{
  if (qword_1EB1ECBB8 != -1) {
    dispatch_once(&qword_1EB1ECBB8, &__block_literal_global_262);
  }
  return (NSOperationQueue *)qword_1EB1ECBB0;
}

- (NSInteger)maxConcurrentOperationCount
{
  return self->_iqp.__maxNumOps;
}

+ (NSOperationQueue)currentQueue
{
  if (pthread_main_np() == 1)
  {
    return +[NSOperationQueue mainQueue];
  }
  else
  {
    id v3 = (id)_CFGetTSD();
    return (NSOperationQueue *)v3;
  }
}

void __29__NSOperationQueue_mainQueue__block_invoke()
{
  v0 = objc_allocWithZone((Class)NSOperationQueue);
  v1 = [[NSPointerArray alloc] initWithOptions:258];
  v0[2] = 0;
  *((void *)v0 + 19) = v1;
  *((void *)v0 + 20) = 1;
  v0[42] = 1;
  *((unsigned char *)v0 + 506) = -1;
  uint64_t v2 = (void *)*((void *)v0 + 24);
  *((void *)v0 + 24) = [@"NSOperationQueue Main Queue" copy];

  qos_class_t v3 = qos_class_main();
  oq_set_property_qos((uint64_t)v0, v3);
  qword_1EB1ECBB0 = (uint64_t)v0;
}

void __40__NSOperationQueue_setQualityOfService___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  oq_set_property_qos(*(void *)(a1 + 32), *(void *)(a1 + 40));
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);

  os_unfair_lock_unlock(v2);
}

- (void)setMaxConcurrentOperationCount:(NSInteger)maxConcurrentOperationCount
{
  if (maxConcurrentOperationCount <= -2)
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: count (%ld) cannot be negative", _NSMethodExceptionProem((objc_class *)self, a2), maxConcurrentOperationCount), 0 reason userInfo];
    objc_exception_throw(v7);
  }
  if (!self->_iqp.__mainQ)
  {
    os_unfair_lock_lock(&self->_iqp.__queueLock);
    self->_iqp.__maxNumOps = maxConcurrentOperationCount;
    if (maxConcurrentOperationCount > 0x7FFFFFFF || maxConcurrentOperationCount == -1) {
      int v6 = 0x7FFFFFFF;
    }
    else {
      int v6 = maxConcurrentOperationCount;
    }
    self->_iqp.__actualMaxNumOps = v6;
    os_unfair_lock_unlock(&self->_iqp.__queueLock);
    __NSOQSchedule((uint64_t)self);
  }
}

- (NSUInteger)operationCount
{
  return atomic_load(&self->_iqp.__operationCount);
}

- (BOOL)isSuspended
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_iqp.__suspended);
  return v2 & 1;
}

- (NSQualityOfService)qualityOfService
{
  NSQualityOfService result = oq_get_property_qos((uint64_t)self);
  if (result == (NSQualityOfServiceUtility|0x4) || result == 0) {
    return -1;
  }
  return result;
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([a4 isEqualToString:@"operations"])
  {
    if (atomic_fetch_add((atomic_uchar *volatile)&self->_iqp.__operationsObserverCount, 1u) == 255)
    {
      atomic_store(0xFFu, &self->_iqp.__operationsObserverCount);
      long long v11 = @"operations";
      goto LABEL_8;
    }
  }
  else if (([a4 isEqualToString:@"operationCount"] & 1) != 0 {
         && atomic_fetch_add((atomic_uchar *volatile)&self->_iqp.__operationCountObserverCount, 1u) == 255)
  }
  {
    atomic_store(0xFFu, &self->_iqp.__operationCountObserverCount);
    long long v11 = @"operationCount";
LABEL_8:
    long long v12 = +[NSString stringWithFormat:@"added too many observers to an NSOperationQueue for %@", v11];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v12 userInfo:0]);
  }
  v13.receiver = self;
  v13.super_class = (Class)NSOperationQueue;
  [(NSOperationQueue *)&v13 addObserver:a3 forKeyPath:a4 options:a5 context:a6];
}

- (void)addBarrierBlock:(void *)barrier
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_iqp = &self->_iqp;
  os_unfair_lock_lock(&self->_iqp.__queueLock);
  firstOperation = self->_iqp.__firstOperation;
  if (firstOperation)
  {
    v10.receiver = [_NSBarrierOperation alloc];
    v10.super_class = (Class)_NSBarrierOperation;
    uint64_t v8 = [(NSOperationQueue *)&v10 init];
    *(void *)&v8->_iqp.__nameBuffer[48] = _Block_copy(barrier);
    v8->_iqp.__nameBuffer[38] = 12;
    do
    {
      [(NSOperationQueue *)v8 addDependency:firstOperation];
      firstOperation = firstOperation->_iop.__nextOp;
    }
    while (firstOperation);
    __addOperations((objc_class *)self, a2, (uint64_t)v8, 0, 1);
    os_unfair_lock_unlock(&p_iqp->__queueLock);
LABEL_5:

    __NSOQSchedule((uint64_t)self);
    return;
  }
  uint64_t v9 = oq_synthesize_backing_queue((uint64_t)self);
  os_unfair_lock_unlock(&p_iqp->__queueLock);
  if (!v9)
  {
    uint64_t v8 = 0;
    goto LABEL_5;
  }
  dispatch_barrier_async(v9, barrier);

  dispatch_release(v9);
}

- (NSProgress)progress
{
  p_iqp = &self->_iqp;
  os_unfair_lock_lock(&self->_iqp.__queueLock);
  progress = self->_iqp._progress;
  if (!progress)
  {
    progress = (_NSOperationQueueProgress *)-[_NSOperationQueueProgress initWithQueue:]([_NSOperationQueueProgress alloc], (uint64_t)self);
    self->_iqp._progress = progress;
  }
  os_unfair_lock_unlock(&p_iqp->__queueLock);
  return &progress->super;
}

- (BOOL)overcommitsOperations
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_iqp.__overcommit);
  return v2 & 1;
}

- (void)setOvercommitsOperations:(BOOL)a3
{
  if (!self->_iqp.__mainQ && (atomic_exchange((atomic_uchar *volatile)&self->_iqp.__overcommit, a3) & 1) != a3)
  {
    backingQueue = self->_iqp.__backingQueue;
    self->_iqp.__backingQueue = 0;
    self->_iqp.__nameBuffer[0] = 0;
    if (backingQueue) {
      dispatch_release(backingQueue);
    }
  }
}

- (dispatch_queue_t)underlyingQueue
{
  if (self->_iqp.__mainQ) {
    return (dispatch_queue_t)MEMORY[0x1E4F14428];
  }
  p_iqp = &self->_iqp;
  os_unfair_lock_lock(&self->_iqp.__queueLock);
  uint64_t v5 = self->_iqp.__dispatch_queue;
  os_unfair_lock_unlock(&p_iqp->__queueLock);
  return (dispatch_queue_t)v5;
}

- (NSString)name
{
  p_iqp = &self->_iqp;
  os_unfair_lock_lock(&self->_iqp.__queueLock);
  name = self->_iqp.__name;
  os_unfair_lock_unlock(&p_iqp->__queueLock);
  return name;
}

- (id)__graphDescription
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  qos_class_t v3 = (void *)[&stru_1ECA5C228 mutableCopy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  NSQualityOfService v4 = [(NSOperationQueue *)self operations];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "appendString:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "__graphDescription:", 0));
        [v3 appendString:@"\n"];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
  return v3;
}

- (NSString)description
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  qos_class_t v3 = [(NSOperationQueue *)self name];
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)NSOperationQueue;
    return +[NSString stringWithFormat:@"%@{name = '%@'}", [(NSOperationQueue *)&v6 description], v3];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NSOperationQueue;
    return [(NSOperationQueue *)&v5 description];
  }
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSOperationQueue;
  -[NSOperationQueue removeObserver:forKeyPath:](&v7, sel_removeObserver_forKeyPath_, a3);
  if ([a4 isEqualToString:@"operations"])
  {
    uint64_t v6 = 503;
  }
  else
  {
    if (![a4 isEqualToString:@"operationCount"]) {
      return;
    }
    uint64_t v6 = 504;
  }
  atomic_fetch_add((atomic_uchar *volatile)self + v6, 0xFFu);
}

- (void)_fc_addUncancellableOperationWithBlock:(id)a3
{
  NSQualityOfService v4 = +[NSBlockOperation blockOperationWithBlock:a3];

  [(NSOperationQueue *)self addOperation:v4];
}

- (void)_fc_addUncancellableOperationForReactorID:(id)a3 block:(id)a4
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __95__NSOperationQueue_NSFileCoordinationSupport___fc_addUncancellableOperationForReactorID_block___block_invoke;
  v4[3] = &unk_1E51F9B10;
  v4[4] = a3;
  v4[5] = a4;
  [(NSOperationQueue *)self addOperation:+[NSBlockOperation blockOperationWithBlock:v4]];
}

void __95__NSOperationQueue_NSFileCoordinationSupport___fc_addUncancellableOperationForReactorID_block___block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = [+[NSThread currentThread] threadDictionary];
  id v3 = (id)[(NSMutableDictionary *)v2 objectForKeyedSubscript:@"_NSCurrentReactorID"];
  [(NSMutableDictionary *)v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"_NSCurrentReactorID"];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [(NSMutableDictionary *)v2 setObject:v3 forKeyedSubscript:@"_NSCurrentReactorID"];
}

@end