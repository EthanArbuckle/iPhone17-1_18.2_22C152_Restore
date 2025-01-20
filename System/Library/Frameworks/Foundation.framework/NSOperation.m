@interface NSOperation
+ (BOOL)_removesDependenciesAfterFinish;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)currentOperation;
+ (id)keyPathsForValuesAffectingCancelled;
+ (id)keyPathsForValuesAffectingExecuting;
+ (id)keyPathsForValuesAffectingFinished;
+ (id)keyPathsForValuesAffectingIsCancelled;
+ (id)keyPathsForValuesAffectingIsExecuting;
+ (id)keyPathsForValuesAffectingIsFinished;
+ (id)keyPathsForValuesAffectingIsReady;
+ (id)keyPathsForValuesAffectingReady;
- (BOOL)isAsynchronous;
- (BOOL)isCancelled;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isReady;
- (NSArray)dependencies;
- (NSOperation)init;
- (NSOperationQueuePriority)queuePriority;
- (NSQualityOfService)qualityOfService;
- (NSString)name;
- (double)threadPriority;
- (id)__graphDescription:(unint64_t)a3;
- (id)_copyCompletionBlock;
- (id)_implicitObservationInfo;
- (id)debugDescription;
- (id)description;
- (void)addDependency:(NSOperation *)op;
- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)cancel;
- (void)completionBlock;
- (void)dealloc;
- (void)observationInfo;
- (void)removeAllDependencies;
- (void)removeDependency:(NSOperation *)op;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4;
- (void)setCompletionBlock:(void *)completionBlock;
- (void)setName:(NSString *)name;
- (void)setObservationInfo:(void *)a3;
- (void)setQualityOfService:(NSQualityOfService)qualityOfService;
- (void)setQueuePriority:(NSOperationQueuePriority)queuePriority;
- (void)setThreadPriority:(double)threadPriority;
- (void)start;
- (void)waitUntilFinished;
- (void)waitUntilFinishedOrTimeout:(double)a3;
@end

@implementation NSOperation

- (void)observationInfo
{
  return self->_iop.__obsInfo;
}

- (id)_implicitObservationInfo
{
  p_lock = &self->_iop.__lock;
  os_unfair_lock_lock(&self->_iop.__lock);
  v4 = self->_iop.__implicitObsInfo;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)start
{
  v36[5] = *MEMORY[0x1E4F143B8];
  unsigned int v2 = atomic_load(&self->_iop.__state);
  if (v2 == 244) {
    return;
  }
  char v4 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_iop.__state, (unsigned __int8 *)&v4, 0xD8u);
  if (!v4)
  {
    if (v2 <= 0x50 && ![(NSOperation *)self isReady])
    {
      atomic_store(v2, &self->_iop.__state);
      v5 = +[NSString stringWithFormat:@"%@: receiver is not yet ready to execute", _NSMethodExceptionProem((objc_class *)self, sel_start)];
      goto LABEL_54;
    }
    goto LABEL_8;
  }
  if (v2 != 216)
  {
    if (v2 == 224 || v2 == 240)
    {
      v5 = +[NSString stringWithFormat:@"%@: receiver is already executing", _NSMethodExceptionProem((objc_class *)self, sel_start)];
      goto LABEL_54;
    }
LABEL_53:
    v5 = +[NSString stringWithFormat:@"%@: something is trying to start the receiver simultaneously from more than one thread", _NSMethodExceptionProem((objc_class *)self, sel_start)];
LABEL_54:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v5 userInfo:0]);
  }
  if (!self->_iop.__queue) {
    goto LABEL_53;
  }
LABEL_8:
  v6 = (void *)MEMORY[0x185308110]();
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_iop.__isCancelled);
  if ((v7 & 1) == 0)
  {
    if (atomic_load(&self->_iop.__isExecutingObserverCount))
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __iop_start_block_invoke;
      v36[3] = &__block_descriptor_40_e5_v8__0l;
      v36[4] = &self->_iop;
      [(NSOperation *)self _changeValueForKeys:_NSOperationExecutingKeys count:1 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:v36];
    }
    else
    {
      atomic_store(0xE0u, &self->_iop.__state);
      +[__NSOperationInternalObserver _observeValueForKeyPath:@"isExecuting" ofObject:self changeKind:0 oldValue:0 newValue:0 indexes:0 context:0];
    }
    double thread_prio = self->_iop.__thread_prio;
    if (thread_prio == 0.5)
    {
      double v11 = 0.0;
    }
    else
    {
      +[NSThread threadPriority];
      double v11 = v10;
      +[NSThread setThreadPriority:self->_iop.__thread_prio];
    }
    os_unfair_lock_lock(&self->_iop.__lock);
    v12 = self->_iop.__queue;
    os_unfair_lock_unlock(&self->_iop.__lock);
    if (v12
      && object_getClass(self) != (Class)_NSBarrierOperation
      && (int v13 = atomic_load(&v12->_iqp.__progressReporting)) != 0)
    {
      os_unfair_lock_lock(&v12->_iqp.__queueLock);
      progress = v12->_iqp._progress;
      if (!progress)
      {
        progress = (_NSOperationQueueProgress *)-[_NSOperationQueueProgress initWithQueue:]([_NSOperationQueueProgress alloc], (uint64_t)v12);
        v12->_iqp._progress = progress;
      }
      os_unfair_lock_unlock(&v12->_iqp.__queueLock);
      v15 = [[NSProgress alloc] initWithParent:0 userInfo:0];
      [(NSProgress *)v15 setTotalUnitCount:1];
      [(NSProgress *)progress addChild:v15 withPendingUnitCount:1];
    }
    else
    {
      v15 = 0;
    }
    [(NSProgress *)v15 becomeCurrentWithPendingUnitCount:1];
    _CFExecutableLinkedOnOrAfter();
    __NSOPERATION_IS_INVOKING_MAIN__(self);
    [(NSProgress *)v15 resignCurrent];

    if (thread_prio != 0.5) {
      +[NSThread setThreadPriority:v11];
    }
  }
  int v16 = atomic_load(&self->_iop.__state);
  if (v16 != 224)
  {
    if (atomic_load(&self->_iop.__isFinishedObserverCount))
    {
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      v33 = __iop_start_block_invoke_3;
      v34 = &__block_descriptor_40_e5_v8__0l;
      p_iop = &self->_iop;
      [(NSOperation *)self _changeValueForKeys:&_NSOperationFinishedKeys count:1 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:&v31];
    }
    else
    {
      atomic_store(0xF0u, &self->_iop.__state);
      +[__NSOperationInternalObserver _observeValueForKeyPath:@"isFinished" ofObject:self changeKind:0 oldValue:0 newValue:0 indexes:0 context:0];
    }
    goto LABEL_48;
  }
  char v17 = 0;
  uint64_t v18 = 0;
  char v19 = 1;
  char v20 = 1;
  do
  {
    while (1)
    {
      while (1)
      {
        char v21 = v17;
        char v22 = v20;
        char v23 = v19;
        v24 = _NSOperationExecutingAndFinishedKeys[v18];
        if (v24 != @"isReady") {
          break;
        }
        char v20 = 0;
        int v25 = atomic_load(&self->_iop.__isReadyObserverCount);
        char v26 = v17 | (v25 != 0);
        char v17 = 1;
        char v19 = v22;
        uint64_t v18 = 1;
        if (v26) {
          goto LABEL_38;
        }
      }
      if (v24 != @"isFinished") {
        break;
      }
      char v20 = 0;
      p_isFinishedObserverCount = &self->_iop.__isFinishedObserverCount;
LABEL_37:
      int v25 = atomic_load(p_isFinishedObserverCount);
      char v28 = v17 | (v25 != 0);
      uint64_t v18 = 1;
      char v19 = v22;
      char v17 = 1;
      if (v28)
      {
LABEL_38:
        if (v25) {
          char v29 = v23;
        }
        else {
          char v29 = v22;
        }
        if (v29) {
          goto LABEL_42;
        }
        goto LABEL_47;
      }
    }
    if (v24 == @"isExecuting")
    {
      char v20 = 0;
      p_isFinishedObserverCount = &self->_iop.__isExecutingObserverCount;
      goto LABEL_37;
    }
    if (v24 == @"isCancelled")
    {
      char v20 = 0;
      p_isFinishedObserverCount = &self->_iop.__isCancelledObserverCount;
      goto LABEL_37;
    }
    char v20 = 0;
    uint64_t v18 = 1;
    char v19 = v22;
    char v17 = 1;
  }
  while ((v21 & 1) == 0);
  if (v22)
  {
LABEL_42:
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __iop_start_block_invoke_2;
    v34 = &__block_descriptor_40_e5_v8__0l;
    p_iop = &self->_iop;
    [(NSOperation *)self _changeValueForKeys:_NSOperationExecutingAndFinishedKeys count:2 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:&v31];
    goto LABEL_48;
  }
LABEL_47:
  atomic_store(0xF0u, &self->_iop.__state);
  +[__NSOperationInternalObserver _observeValueForKeyPath:@"isExecuting" ofObject:self changeKind:0 oldValue:0 newValue:0 indexes:0 context:0];
  +[__NSOperationInternalObserver _observeValueForKeyPath:@"isFinished" ofObject:self changeKind:0 oldValue:0 newValue:0 indexes:0 context:0];
LABEL_48:
}

- (BOOL)isFinished
{
  unsigned int v2 = atomic_load(&self->_iop.__state);
  return v2 > 0xEF;
}

- (BOOL)isExecuting
{
  int v2 = atomic_load(&self->_iop.__state);
  return v2 == 224;
}

- (BOOL)isReady
{
  int v2 = self;
  p_lock = &self->_iop.__lock;
  os_unfair_lock_lock(&self->_iop.__lock);
  LOBYTE(v2) = v2->_iop.__unfinished_deps == 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

uint64_t __35__NSOperation_setQualityOfService___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1 > 16)
  {
    if (v1 != 17 && v1 != 33 && v1 != 25) {
LABEL_9:
    }
      LOBYTE(v1) = 0;
  }
  else
  {
    if (v1 == -1)
    {
      LOBYTE(v1) = 21;
      goto LABEL_11;
    }
    if (v1 != 5 && v1 != 9) {
      goto LABEL_9;
    }
  }
LABEL_11:
  atomic_store(v1, (unsigned __int8 *)(*(void *)(result + 32) + 241));
  return result;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (([a3 isEqualToString:@"isFinished"] & 1) != 0
    || ([a3 isEqualToString:@"finished"] & 1) != 0
    || ([a3 isEqualToString:@"isReady"] & 1) != 0
    || ([a3 isEqualToString:@"ready"] & 1) != 0
    || ([a3 isEqualToString:@"isExecuting"] & 1) != 0
    || ([a3 isEqualToString:@"executing"] & 1) != 0
    || ([a3 isEqualToString:@"isCancelled"] & 1) != 0
    || ([a3 isEqualToString:@"cancelled"] & 1) != 0
    || ([a3 isEqualToString:@"dependencies"] & 1) != 0
    || ([a3 isEqualToString:@"queuePriority"] & 1) != 0
    || ([a3 isEqualToString:@"isAsynchronous"] & 1) != 0
    || ([a3 isEqualToString:@"name"] & 1) != 0
    || ([a3 isEqualToString:@"qualityOfService"] & 1) != 0
    || ([a3 isEqualToString:@"completionBlock"] & 1) != 0)
  {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NSOperation;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

+ (id)keyPathsForValuesAffectingReady
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"isReady"];
}

+ (id)keyPathsForValuesAffectingFinished
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"isFinished"];
}

+ (id)keyPathsForValuesAffectingExecuting
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"isExecuting"];
}

+ (id)keyPathsForValuesAffectingIsReady
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"ready"];
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"finished"];
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"executing"];
}

+ (id)keyPathsForValuesAffectingIsCancelled
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"cancelled"];
}

+ (id)keyPathsForValuesAffectingCancelled
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"isCancelled"];
}

- (BOOL)isCancelled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_iop.__isCancelled);
  return v2 & 1;
}

- (void)waitUntilFinished
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_iop.__lock;
  os_unfair_lock_lock(&self->_iop.__lock);
  char v4 = self->_iop.__queue;
  os_unfair_lock_unlock(p_lock);
  qos_class_t v5 = atomic_load(&self->_iop.__propertyQoS);
  char v22 = v4;
  if (v4) {
    objc_super v6 = oq_begin_waiting((uint64_t)v4, v5);
  }
  else {
    objc_super v6 = 0;
  }
  os_unfair_lock_lock(p_lock);
  char v21 = self;
  uint64_t v7 = (void *)[(NSMutableArray *)self->_iop.__dependencies copy];
  os_unfair_lock_unlock(p_lock);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        if (v6)
        {
          uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          int v13 = (os_unfair_lock_s *)(v12 + 232);
          os_unfair_lock_lock((os_unfair_lock_t)(v12 + 232));
          id v14 = *(id *)(v12 + 32);
          os_unfair_lock_unlock(v13);
          if (v14)
          {
            os_unfair_lock_lock((os_unfair_lock_t)v14 + 2);
            uint64_t v15 = [*((id *)v14 + 19) count];
            if (v15)
            {
              uint64_t v16 = v15;
              for (uint64_t j = 0; j != v16; ++j)
              {
                uint64_t v18 = (_opaque_pthread_t *)[*((id *)v14 + 19) pointerAtIndex:j];
                if (!NSMapMember(v6, v18, 0, 0))
                {
                  pthread_override_t started = pthread_override_qos_class_start_np(v18, v5, 0);
                  NSMapInsertKnownAbsent(v6, v18, started);
                }
              }
            }
            os_unfair_lock_unlock((os_unfair_lock_t)v14 + 2);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v24 count:16];
    }
    while (v9);
  }

  p_wait_mutex = &v21->_iop.__wait_mutex;
  pthread_mutex_lock(&v21->_iop.__wait_mutex);
  if (![(NSOperation *)v21 isFinished])
  {
    do
      pthread_cond_wait(&v21->_iop.__wait_cond, p_wait_mutex);
    while (![(NSOperation *)v21 isFinished]);
  }
  pthread_mutex_unlock(p_wait_mutex);
  if (v6) {
    oq_end_waiting(v6);
  }
}

- (void)addDependency:(NSOperation *)op
{
}

- (NSQualityOfService)qualityOfService
{
  NSQualityOfService result = op_get_property_qos((uint64_t)self);
  if (result == (NSQualityOfServiceUtility|0x4) || result == 0) {
    return -1;
  }
  return result;
}

- (id)description
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [(NSOperation *)self name];
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)NSOperation;
    return +[NSString stringWithFormat:@"%@{name = '%@'}", [(NSOperation *)&v6 description], v3];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NSOperation;
    return [(NSOperation *)&v5 description];
  }
}

- (NSString)name
{
  if (self->_iop.__nameBuffer) {
    return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  }
  else {
    return 0;
  }
}

- (void)setQueuePriority:(NSOperationQueuePriority)queuePriority
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)queuePriority <= 0xFFFFFFFFFFFFFFF8) {
    char v3 = -8;
  }
  else {
    char v3 = -4;
  }
  if (queuePriority > NSOperationQueuePriorityLow) {
    char v3 = 0;
  }
  if (queuePriority <= 3) {
    char v4 = v3;
  }
  else {
    char v4 = 4;
  }
  if (queuePriority <= 7) {
    char v5 = v4;
  }
  else {
    char v5 = 8;
  }
  if (self->_iop.__prio != v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __iop_setQueuePriority_block_invoke;
    v6[3] = &unk_1E51F9698;
    v6[4] = self;
    char v7 = v5;
    [(NSOperation *)self _changeValueForKeys:_NSOperationQueuePriorityKeys count:1 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:v6];
  }
}

- (void)setName:(NSString *)name
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __iop_setName_block_invoke;
  v3[3] = &unk_1E51F8B80;
  v3[4] = name;
  v3[5] = &self->_iop;
  [(NSOperation *)self _changeValueForKeys:_NSOperationNameKeys count:1 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:v3];
}

- (NSOperation)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)NSOperation;
  unsigned __int8 v2 = [(NSOperation *)&v14 init];
  if (qword_1EB1ECBA8 != -1) {
    dispatch_once(&qword_1EB1ECBA8, &__block_literal_global_32);
  }
  char v3 = objc_opt_class();
  value = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB1ECBC8);
  CFArrayRef v4 = (const __CFArray *)qword_1EB1ECBD0;
  v17.length = CFArrayGetCount((CFArrayRef)qword_1EB1ECBD0);
  v17.location = 0;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v4, v17, v3);
  if (FirstIndexOfValue == -1)
  {
    v15[0] = xmmword_1E51F9618;
    v15[1] = *(_OWORD *)&off_1E51F9628;
    v15[2] = xmmword_1E51F9638;
    uint64_t v8 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CAD0]) initWithObjects:v15 count:6];
    uint64_t v9 = self;
    ImplicitObservationInfo = _NSKeyValueCreateImplicitObservationInfo(v9, v8, 0, 0, (objc_class *)v3, (objc_class **)&value);

    CFArrayAppendValue((CFMutableArrayRef)qword_1EB1ECBD0, v3);
    CFArrayAppendValue((CFMutableArrayRef)qword_1EB1ECBD8, value);
    CFArrayAppendValue((CFMutableArrayRef)qword_1EB1ECBE0, ImplicitObservationInfo);
  }
  else
  {
    CFIndex v6 = FirstIndexOfValue;
    value = (void *)CFArrayGetValueAtIndex((CFArrayRef)qword_1EB1ECBD8, FirstIndexOfValue);
    ImplicitObservationInfo = (void *)CFArrayGetValueAtIndex((CFArrayRef)qword_1EB1ECBE0, v6);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB1ECBC8);
  object_setClass(v2, (Class)value);
  pthread_mutex_init(&v2->_iop.__wait_mutex, 0);
  pthread_cond_init(&v2->_iop.__wait_cond, 0);
  atomic_store(1u, (unsigned __int8 *)&v2->_iop.__cached_isReady);
  v2->_iop.__prio = -1;
  v2->_iop.__double thread_prio = 0.5;
  v2->_iop.__nameBuffer = 0;
  v2->_iop._shouldRemoveDependenciesAfterFinish = [(id)objc_opt_class() _removesDependenciesAfterFinish];
  id v10 = ImplicitObservationInfo;
  os_unfair_lock_lock(&v2->_iop.__lock);
  implicitObsInfo = v2->_iop.__implicitObsInfo;
  v2->_iop.__implicitObsInfo = ImplicitObservationInfo;
  os_unfair_lock_unlock(&v2->_iop.__lock);

  return v2;
}

+ (BOOL)_removesDependenciesAfterFinish
{
  return 0;
}

- (void)setCompletionBlock:(void *)completionBlock
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __iop_setCompletionBlock_block_invoke;
  v3[3] = &unk_1E51F9718;
  v3[4] = completionBlock;
  v3[5] = &self->_iop;
  [(NSOperation *)self _changeValueForKeys:&_NSOperationCompletionBlockKeys count:1 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:v3];
}

- (void)setQualityOfService:(NSQualityOfService)qualityOfService
{
  v5[6] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (unint64_t)(qualityOfService + 1) > 0x22
    || ((1 << (qualityOfService + 1)) & 0x404040441) == 0;
  NSQualityOfService v4 = NSQualityOfServiceDefault;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__NSOperation_setQualityOfService___block_invoke;
  v5[3] = &unk_1E51F8B80;
  if (!v3) {
    NSQualityOfService v4 = qualityOfService;
  }
  v5[4] = self;
  v5[5] = v4;
  [(NSOperation *)self _changeValueForKeys:&_NSOperationQualityOfServiceKeys count:1 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:v5];
}

- (NSOperationQueuePriority)queuePriority
{
  int prio = self->_iop.__prio;
  if (prio == 255) {
    LOBYTE(prio) = 0;
  }
  return (uint64_t)(char)prio;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  obsInfo = self->_iop.__obsInfo;
  if (obsInfo)
  {
    self->_iop.__obsInfo = 0;
  }
  os_unfair_lock_lock(&self->_iop.__lock);
  implicitObsInfo = self->_iop.__implicitObsInfo;
  self->_iop.__implicitObsInfo = 0;
  os_unfair_lock_unlock(&self->_iop.__lock);

  os_unfair_lock_lock(&self->_iop.__lock);
  queue = self->_iop.__queue;
  self->_iop.__queue = 0;
  voucher = self->_iop._voucher;
  id schedule = self->_iop.__schedule;
  self->_iop._voucher = 0;
  self->_iop.__id schedule = 0;
  os_unfair_lock_unlock(&self->_iop.__lock);

  if (schedule) {
    _Block_release(schedule);
  }

  pthread_cond_destroy(&self->_iop.__wait_cond);
  pthread_mutex_destroy(&self->_iop.__wait_mutex);

  free(self->_iop.__nameBuffer);
  v8.receiver = self;
  v8.super_class = (Class)NSOperation;
  [(NSOperation *)&v8 dealloc];
}

- (BOOL)isAsynchronous
{
  uint64_t v3 = [(NSOperation *)self methodForSelector:sel_isAsynchronous];
  if (v3 != +[NSOperation instanceMethodForSelector:sel_isAsynchronous])return 0; {
  uint64_t v5 = [(NSOperation *)self methodForSelector:sel_isConcurrent];
  }
  if (v5 == +[NSOperation instanceMethodForSelector:sel_isConcurrent])return 0; {

  }
  return [(NSOperation *)self isConcurrent];
}

CFMutableArrayRef __19__NSOperation_init__block_invoke()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CFB0];
  qword_1EB1ECBD0 = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 16, &__NSOperationImplicitObservationArrayCallbacks);
  qword_1EB1ECBD8 = (uint64_t)CFArrayCreateMutable(v0, 16, &__NSOperationImplicitObservationArrayCallbacks);
  CFMutableArrayRef result = CFArrayCreateMutable(v0, 16, &__NSOperationImplicitObservationArrayCallbacks);
  qword_1EB1ECBE0 = (uint64_t)result;
  return result;
}

- (void)cancel
{
  v7[5] = *MEMORY[0x1E4F143B8];
  if (![(NSOperation *)self isFinished])
  {
    if (atomic_load(&self->_iop.__isCancelledObserverCount))
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __iop_cancel_block_invoke;
      v7[3] = &__block_descriptor_40_e5_v8__0l;
      v7[4] = &self->_iop;
      [(NSOperation *)self _changeValueForKeys:_NSOperationCancelKeys count:1 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:v7];
    }
    else
    {
      atomic_store(1u, (unsigned __int8 *)&self->_iop.__isCancelled);
    }
    unsigned int v4 = atomic_load(&self->_iop.__state);
    if (v4 <= 0xDF)
    {
      if (atomic_load(&self->_iop.__isReadyObserverCount))
      {
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __iop_cancel_block_invoke_2;
        v6[3] = &__block_descriptor_40_e5_v8__0l;
        v6[4] = &self->_iop;
        [(NSOperation *)self _changeValueForKeys:&_NSOperationReadyKeys count:1 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:v6];
      }
      else
      {
        os_unfair_lock_lock(&self->_iop.__lock);
        self->_iop.__unfinished_deps = 0;
        os_unfair_lock_unlock(&self->_iop.__lock);
        +[__NSOperationInternalObserver _observeValueForKeyPath:@"isReady" ofObject:self changeKind:0 oldValue:0 newValue:0 indexes:0 context:0];
      }
      if (self->_iop._shouldRemoveDependenciesAfterFinish) {
        iop_removeAllDependencies((unsigned __int8 *)&self->_iop, self);
      }
    }
  }
}

- (void)completionBlock
{
  p_lock = &self->_iop.__lock;
  os_unfair_lock_lock(&self->_iop.__lock);
  id v4 = self->_iop.__completion;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSArray)dependencies
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  p_lock = &self->_iop.__lock;
  os_unfair_lock_lock(&self->_iop.__lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  dependencies = self->_iop.__dependencies;
  uint64_t v6 = [(NSMutableArray *)dependencies countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(dependencies);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (object_getClass(v10) != (Class)_NSBarrierOperation) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [(NSMutableArray *)dependencies countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v7);
  }
  os_unfair_lock_unlock(p_lock);
  if (v3) {
    return (NSArray *)v3;
  }
  else {
    return (NSArray *)[MEMORY[0x1E4F1C978] array];
  }
}

- (void)setObservationInfo:(void *)a3
{
  obsInfo = self->_iop.__obsInfo;
  if (obsInfo != a3)
  {
    id v5 = obsInfo;
    self->_iop.__obsInfo = a3;
  }
}

+ (id)currentOperation
{
  id v2 = (id)_CFGetTSD();

  return v2;
}

- (BOOL)isConcurrent
{
  uint64_t v3 = [(NSOperation *)self methodForSelector:sel_isConcurrent];
  if (v3 != +[NSOperation instanceMethodForSelector:sel_isConcurrent])return 0; {
  uint64_t v5 = [(NSOperation *)self methodForSelector:sel_isAsynchronous];
  }
  if (v5 == +[NSOperation instanceMethodForSelector:sel_isAsynchronous])return 0; {

  }
  return [(NSOperation *)self isAsynchronous];
}

- (double)threadPriority
{
  return self->_iop.__thread_prio;
}

- (void)setThreadPriority:(double)threadPriority
{
  v4[6] = *MEMORY[0x1E4F143B8];
  unsigned int v3 = atomic_load(&self->_iop.__state);
  if (v3 <= 0xD7)
  {
    if (threadPriority <= 0.0) {
      threadPriority = 0.0;
    }
    v4[1] = 3221225472;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[2] = __iop_setThreadPriority_block_invoke;
    v4[3] = &__block_descriptor_48_e5_v8__0l;
    if (threadPriority >= 1.0) {
      threadPriority = 1.0;
    }
    v4[4] = &self->_iop;
    *(double *)&v4[5] = threadPriority;
    [(NSOperation *)self _changeValueForKeys:&_NSOperationThreadPriorityKeys count:1 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:v4];
  }
}

- (id)_copyCompletionBlock
{
  if (qword_1EB1ECBC0 != -1) {
    dispatch_once(&qword_1EB1ECBC0, &__block_literal_global_361);
  }
  os_unfair_lock_lock(&self->_iop.__lock);
  id completion = self->_iop.__completion;
  if (_MergedGlobals_11) {
    self->_iop.__id completion = 0;
  }
  else {
    id v4 = completion;
  }
  os_unfair_lock_unlock(&self->_iop.__lock);
  return completion;
}

- (void)waitUntilFinishedOrTimeout:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v4 = CFAbsoluteTimeGetCurrent() + a3;
  os_unfair_lock_lock(&self->_iop.__lock);
  uint64_t v5 = self->_iop.__queue;
  os_unfair_lock_unlock(&self->_iop.__lock);
  qos_class_t v6 = atomic_load(&self->_iop.__propertyQoS);
  if (v5) {
    uint64_t v7 = oq_begin_waiting((uint64_t)v5, v6);
  }
  else {
    uint64_t v7 = 0;
  }
  pthread_mutex_lock(&self->_iop.__wait_mutex);
  for (double i = v4 - CFAbsoluteTimeGetCurrent(); i > 0.0; double i = v4 - CFAbsoluteTimeGetCurrent())
  {
    if ([(NSOperation *)self isFinished]) {
      break;
    }
    v9.tv_sec = vcvtmd_s64_f64(i);
    v9.tv_nsec = (int)((i - (double)(uint64_t)floor(i)) * 1000000000.0);
    pthread_cond_timedwait_relative_np(&self->_iop.__wait_cond, &self->_iop.__wait_mutex, &v9);
  }
  pthread_mutex_unlock(&self->_iop.__wait_mutex);
  if (v7) {
    oq_end_waiting(v7);
  }
}

- (void)removeDependency:(NSOperation *)op
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_iop = &self->_iop;
  qos_class_t v6 = op;
  uint64_t v7 = self;
  char v8 = 0;
  uint64_t v9 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  char v22 = __iop_removeDependency_block_invoke;
  char v23 = &unk_1E51F9740;
  long long v25 = self;
  long long v26 = p_iop;
  v24 = op;
  LOBYTE(v10) = 1;
  uint64_t v11 = 1;
  do
  {
    while (1)
    {
      while (1)
      {
        char v12 = v8;
        uint64_t v13 = v11;
        char v14 = v10;
        long long v15 = _NSOperationDependenciesAndReadyKeys[v9];
        if (v15 != @"isReady") {
          break;
        }
        uint64_t v11 = 0;
        int v16 = atomic_load(&self->_iop.__isReadyObserverCount);
        char v17 = v8 | (v16 != 0);
        char v8 = 1;
        uint64_t v10 = v13;
        uint64_t v9 = 1;
        if (v17) {
          goto LABEL_14;
        }
      }
      if (v15 != @"isFinished") {
        break;
      }
      uint64_t v11 = 0;
      p_isFinishedObserverCount = &self->_iop.__isFinishedObserverCount;
LABEL_13:
      int v16 = atomic_load(p_isFinishedObserverCount);
      char v19 = v8 | (v16 != 0);
      uint64_t v9 = 1;
      uint64_t v10 = v13;
      char v8 = 1;
      if (v19)
      {
LABEL_14:
        if (v16) {
          char v20 = v14;
        }
        else {
          char v20 = v13;
        }
        if (v20) {
          goto LABEL_18;
        }
        goto LABEL_20;
      }
    }
    if (v15 == @"isExecuting")
    {
      uint64_t v11 = 0;
      p_isFinishedObserverCount = &self->_iop.__isExecutingObserverCount;
      goto LABEL_13;
    }
    if (v15 == @"isCancelled")
    {
      uint64_t v11 = 0;
      p_isFinishedObserverCount = &self->_iop.__isCancelledObserverCount;
      goto LABEL_13;
    }
    uint64_t v11 = 0;
    uint64_t v9 = 1;
    uint64_t v10 = v13;
    char v8 = 1;
  }
  while ((v12 & 1) == 0);
  if (v13)
  {
LABEL_18:
    [(NSOperation *)self _changeValueForKeys:_NSOperationDependenciesAndReadyKeys count:2 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:v21];
    goto LABEL_21;
  }
LABEL_20:
  ((void (*)(void *, uint64_t, uint64_t))v22)(v21, 1, v10);
  +[__NSOperationInternalObserver _observeValueForKeyPath:@"isReady" ofObject:self changeKind:0 oldValue:0 newValue:0 indexes:0 context:0];
LABEL_21:
}

- (void)removeAllDependencies
{
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (([a4 isEqualToString:@"isReady"] & 1) != 0
    || ([a4 isEqualToString:@"ready"] & 1) != 0)
  {
    if (atomic_fetch_add((atomic_uchar *volatile)&self->_iop.__isReadyObserverCount, 1u) != 255) {
      goto LABEL_4;
    }
    atomic_store(0xFFu, &self->_iop.__isReadyObserverCount);
    uint64_t v11 = @"isReady";
LABEL_18:
    char v12 = +[NSString stringWithFormat:@"added too many observers to an NSOperation for %@", v11];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v12 userInfo:0]);
  }
  if (([a4 isEqualToString:@"isExecuting"] & 1) != 0
    || ([a4 isEqualToString:@"executing"] & 1) != 0)
  {
    if (atomic_fetch_add((atomic_uchar *volatile)&self->_iop.__isExecutingObserverCount, 1u) != 255) {
      goto LABEL_4;
    }
    atomic_store(0xFFu, &self->_iop.__isExecutingObserverCount);
    uint64_t v11 = @"isExecuting";
    goto LABEL_18;
  }
  if (([a4 isEqualToString:@"isCancelled"] & 1) != 0
    || ([a4 isEqualToString:@"cancelled"] & 1) != 0)
  {
    if (atomic_fetch_add((atomic_uchar *volatile)&self->_iop.__isCancelledObserverCount, 1u) != 255) {
      goto LABEL_4;
    }
    atomic_store(0xFFu, &self->_iop.__isCancelledObserverCount);
    uint64_t v11 = @"isCancelled";
    goto LABEL_18;
  }
  if ((([a4 isEqualToString:@"isFinished"] & 1) != 0
     || ([a4 isEqualToString:@"finished"] & 1) != 0)
    && atomic_fetch_add((atomic_uchar *volatile)&self->_iop.__isFinishedObserverCount, 1u) == 255)
  {
    atomic_store(0xFFu, &self->_iop.__isFinishedObserverCount);
    uint64_t v11 = @"isFinished";
    goto LABEL_18;
  }
LABEL_4:
  v13.receiver = self;
  v13.super_class = (Class)NSOperation;
  [(NSOperation *)&v13 addObserver:a3 forKeyPath:a4 options:a5 context:a6];
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSOperation;
  -[NSOperation removeObserver:forKeyPath:](&v7, sel_removeObserver_forKeyPath_, a3);
  if (([a4 isEqualToString:@"isReady"] & 1) != 0
    || ([a4 isEqualToString:@"ready"] & 1) != 0)
  {
    uint64_t v6 = 244;
LABEL_13:
    atomic_fetch_add((atomic_uchar *volatile)self + v6, 0xFFu);
    return;
  }
  if (([a4 isEqualToString:@"isExecuting"] & 1) != 0
    || ([a4 isEqualToString:@"executing"] & 1) != 0)
  {
    uint64_t v6 = 242;
    goto LABEL_13;
  }
  if (([a4 isEqualToString:@"isCancelled"] & 1) != 0
    || ([a4 isEqualToString:@"cancelled"] & 1) != 0)
  {
    uint64_t v6 = 245;
    goto LABEL_13;
  }
  if (([a4 isEqualToString:@"isFinished"] & 1) != 0
    || [a4 isEqualToString:@"finished"])
  {
    uint64_t v6 = 243;
    goto LABEL_13;
  }
}

- (id)debugDescription
{
  BOOL v3 = [(NSOperation *)self isFinished];
  BOOL v4 = [(NSOperation *)self isReady];
  BOOL v5 = [(NSOperation *)self isCancelled];
  BOOL v6 = [(NSOperation *)self isExecuting];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = @"NO";
  if (v3) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  if (v4) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  if (v5) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if (v6) {
    uint64_t v8 = @"YES";
  }
  return +[NSString stringWithFormat:@"<%@ %p isFinished=%@ isReady=%@ isCancelled=%@ isExecuting=%@>", v7, self, v9, v10, v11, v8];
}

- (id)__graphDescription:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)[&stru_1ECA5C228 mutableCopy];
  if (a3)
  {
    unint64_t v6 = a3;
    do
    {
      [v5 appendString:@"  "];
      --v6;
    }
    while (v6);
  }
  objc_msgSend(v5, "appendString:", -[NSOperation debugDescription](self, "debugDescription"));
  int v7 = atomic_load(&self->_iop.__state);
  if (v7 > 215)
  {
    if (v7 > 239)
    {
      if (v7 == 240)
      {
        uint64_t v8 = "finishing";
        goto LABEL_24;
      }
      if (v7 == 244)
      {
        uint64_t v8 = "finished";
        goto LABEL_24;
      }
    }
    else
    {
      if (v7 == 216)
      {
        uint64_t v8 = "starting";
        goto LABEL_24;
      }
      if (v7 == 224)
      {
        uint64_t v8 = "executing";
        goto LABEL_24;
      }
    }
  }
  else if (v7 > 79)
  {
    if (v7 == 80)
    {
      uint64_t v8 = "enqueued";
      goto LABEL_24;
    }
    if (v7 == 136)
    {
      uint64_t v8 = "dispatching";
      goto LABEL_24;
    }
  }
  else
  {
    if (!v7)
    {
      uint64_t v8 = "initialized";
      goto LABEL_24;
    }
    if (v7 == 72)
    {
      uint64_t v8 = "enqueuing";
      goto LABEL_24;
    }
  }
  uint64_t v8 = "unknown";
LABEL_24:
  objc_msgSend(v5, "appendFormat:", @" %s\n", v8);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [(NSOperation *)self dependencies];
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    unint64_t v13 = a3 + 1;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v5, "appendString:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14++), "__graphDescription:", v13));
      }
      while (v11 != v14);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v16 count:16];
    }
    while (v11);
  }
  return v5;
}

@end