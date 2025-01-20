@interface AMSObservable
- (AMSObservable)init;
- (AMSObservable)initWithNotification:(id)a3 object:(id)a4;
- (AMSObservable)initWithObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5;
- (AMSObservable)initWithObserver:(id)a3;
- (AMSObservable)initWithObserver:(id)a3 behavior:(unint64_t)a4;
- (AMSObservable)initWithObservers:(id)a3;
- (AMSObservable)initWithObservers:(id)a3 behavior:(unint64_t)a4;
- (BOOL)_isComplete;
- (BOOL)cancel;
- (BOOL)isCancelled;
- (BOOL)isComplete;
- (BOOL)sendCompletion;
- (BOOL)sendFailure:(id)a3;
- (BOOL)sendResult:(id)a3;
- (NSConditionLock)stateLock;
- (NSError)failureError;
- (NSMutableArray)observers;
- (NSMutableArray)queuedResults;
- (NSString)logKey;
- (OS_dispatch_queue)sendMessageQueue;
- (id)subscribeWithResultBlock:(id)a3;
- (unint64_t)behavior;
- (void)setFailureError:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueuedResults:(id)a3;
- (void)setSendMessageQueue:(id)a3;
- (void)setStateLock:(id)a3;
- (void)subscribe:(id)a3;
- (void)unsubscribe:(id)a3;
- (void)unsubscribeAll;
@end

@implementation AMSObservable

- (void)subscribe:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(AMSObservable *)self stateLock];
  [v5 lock];

  v6 = [(AMSObservable *)self stateLock];
  uint64_t v7 = [v6 condition];

  if (v7 == 1)
  {
    v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      v8 = +[AMSLogConfig sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_12;
    }
    v10 = objc_opt_class();
    id v11 = v10;
    v12 = [(AMSObservable *)self logKey];
    *(_DWORD *)buf = 138543618;
    v55 = v10;
    __int16 v56 = 2114;
    v57 = v12;
    v13 = "%{public}@: [%{public}@] Someone is attempting to add an observer to a completed AMSObservable.";
LABEL_11:
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEBUG, v13, buf, 0x16u);

LABEL_12:
    id v17 = [(AMSObservable *)self stateLock];
    [v17 unlock];
    goto LABEL_35;
  }
  v14 = [(AMSObservable *)self observers];
  int v15 = [v14 containsObject:v4];

  if (v15)
  {
    v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      v8 = +[AMSLogConfig sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_12;
    }
    v16 = objc_opt_class();
    id v11 = v16;
    v12 = [(AMSObservable *)self logKey];
    *(_DWORD *)buf = 138543618;
    v55 = v16;
    __int16 v56 = 2114;
    v57 = v12;
    v13 = "%{public}@: [%{public}@] Someone is attempting to add an observer to a AMSObservable it's already observing.";
    goto LABEL_11;
  }
  v18 = [(AMSObservable *)self observers];
  [v18 addObject:v4];

  v19 = [(AMSObservable *)self queuedResults];
  v20 = (void *)[v19 copy];

  v21 = [(AMSObservable *)self queuedResults];
  [v21 removeAllObjects];

  id v39 = v4;
  if ([v20 count])
  {
    v22 = +[AMSLogConfig sharedConfig];
    if (!v22)
    {
      v22 = +[AMSLogConfig sharedConfig];
    }
    v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = objc_opt_class();
      id v25 = v24;
      v26 = [(AMSObservable *)self logKey];
      *(_DWORD *)buf = 138543618;
      v55 = v24;
      __int16 v56 = 2114;
      v57 = v26;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] There are pending results. Sending them now that we have an observer.", buf, 0x16u);
    }
    v27 = [(AMSObservable *)self observers];
    v42 = (void *)[v27 copy];
  }
  else
  {
    v42 = 0;
  }
  v28 = [(AMSObservable *)self stateLock];
  [v28 unlock];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v17 = v20;
  uint64_t v43 = [v17 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v43)
  {
    obuint64_t j = v17;
    uint64_t v41 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v49 != v41) {
          objc_enumerationMutation(obj);
        }
        v30 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v31 = v42;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v45 != v34) {
                objc_enumerationMutation(v31);
              }
              v36 = *(void **)(*((void *)&v44 + 1) + 8 * j);
              v37 = (void *)[v30 copy];
              v38 = [(AMSObservable *)self sendMessageQueue];
              [v36 _sendResult:v37 usingQueue:v38];
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v44 objects:v52 count:16];
          }
          while (v33);
        }
      }
      id v17 = obj;
      uint64_t v43 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v43);
  }

  id v4 = v39;
LABEL_35:
}

- (NSConditionLock)stateLock
{
  return self->_stateLock;
}

- (NSMutableArray)queuedResults
{
  return self->_queuedResults;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (AMSObservable)init
{
  return [(AMSObservable *)self initWithObserver:0];
}

- (AMSObservable)initWithObserver:(id)a3 behavior:(unint64_t)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    v11[0] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v9 = [(AMSObservable *)self initWithObservers:v8 behavior:a4];
  }
  else
  {
    v9 = [(AMSObservable *)self initWithObservers:0 behavior:a4];
  }

  return v9;
}

- (AMSObservable)initWithObservers:(id)a3 behavior:(unint64_t)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AMSObservable;
  uint64_t v7 = [(AMSObservable *)&v20 init];
  v8 = v7;
  if (v7)
  {
    v7->_behavior = a4;
    uint64_t v9 = AMSGenerateLogCorrelationKey();
    logKey = v8->_logKey;
    v8->_logKey = (NSString *)v9;

    if (v6) {
      id v11 = (NSMutableArray *)[v6 mutableCopy];
    }
    else {
      id v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    observers = v8->_observers;
    v8->_observers = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    queuedResults = v8->_queuedResults;
    v8->_queuedResults = v13;

    dispatch_queue_t v15 = dispatch_queue_create("coma.apple.AppleMediaServices.AMSObservable.sendMessage", MEMORY[0x1E4F14430]);
    sendMessageQueue = v8->_sendMessageQueue;
    v8->_sendMessageQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    stateLock = v8->_stateLock;
    v8->_stateLock = (NSConditionLock *)v17;
  }
  return v8;
}

- (AMSObservable)initWithObserver:(id)a3
{
  return [(AMSObservable *)self initWithObserver:a3 behavior:0];
}

- (AMSObservable)initWithObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [[_AMSKeyValueObservable alloc] initWithObject:v9 keyPath:v8 options:a5];

  return &v10->super;
}

- (AMSObservable)initWithNotification:(id)a3 object:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_AMSNotificationObservable alloc] initWithNotification:v7 object:v6];

  return &v8->super;
}

- (AMSObservable)initWithObservers:(id)a3
{
  return [(AMSObservable *)self initWithObservers:a3 behavior:0];
}

- (BOOL)isCancelled
{
  v3 = [(AMSObservable *)self stateLock];
  [v3 lock];

  if ([(AMSObservable *)self _isComplete])
  {
    id v4 = [(AMSObservable *)self failureError];
    char v5 = objc_msgSend(v4, "ams_isUserCancelledError");
  }
  else
  {
    char v5 = 0;
  }
  id v6 = [(AMSObservable *)self stateLock];
  [v6 unlock];

  return v5;
}

- (BOOL)isComplete
{
  v3 = [(AMSObservable *)self stateLock];
  [v3 lock];

  LOBYTE(v3) = [(AMSObservable *)self _isComplete];
  id v4 = [(AMSObservable *)self stateLock];
  [v4 unlock];

  return (char)v3;
}

- (BOOL)cancel
{
  v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
  LOBYTE(self) = [(AMSObservable *)self sendFailure:v3];

  return (char)self;
}

- (BOOL)sendCompletion
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSObservable *)self stateLock];
  [v3 lock];

  id v4 = [(AMSObservable *)self stateLock];
  uint64_t v5 = [v4 condition];

  if (v5 == 1)
  {
    v16 = +[AMSLogConfig sharedConfig];
    if (!v16)
    {
      v16 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = objc_opt_class();
      id v19 = v18;
      objc_super v20 = [(AMSObservable *)self logKey];
      *(_DWORD *)buf = 138543618;
      v28 = v18;
      __int16 v29 = 2114;
      v30 = v20;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Someone is attempting to send a completion from a completed AMSObservable.", buf, 0x16u);
    }
    id v9 = [(AMSObservable *)self stateLock];
    [v9 unlock];
  }
  else
  {
    id v6 = [(AMSObservable *)self observers];
    id v7 = (void *)[v6 copy];

    id v8 = [(AMSObservable *)self stateLock];
    [v8 unlockWithCondition:1];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
          dispatch_queue_t v15 = [(AMSObservable *)self sendMessageQueue];
          [v14 _sendCompletionUsingQueue:v15];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }
  }
  return v5 != 1;
}

- (BOOL)sendFailure:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(AMSObservable *)self stateLock];
  [v5 lock];

  id v6 = [(AMSObservable *)self stateLock];
  uint64_t v7 = [v6 condition];

  if (v7 == 1)
  {
    v18 = +[AMSLogConfig sharedConfig];
    if (!v18)
    {
      v18 = +[AMSLogConfig sharedConfig];
    }
    id v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      objc_super v20 = objc_opt_class();
      id v21 = v20;
      long long v22 = [(AMSObservable *)self logKey];
      *(_DWORD *)buf = 138543618;
      v30 = v20;
      __int16 v31 = 2114;
      uint64_t v32 = v22;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Someone is attempting to send a failure from a completed AMSObservable.", buf, 0x16u);
    }
    id v11 = [(AMSObservable *)self stateLock];
    [v11 unlock];
  }
  else
  {
    [(AMSObservable *)self setFailureError:v4];
    id v8 = [(AMSObservable *)self observers];
    id v9 = (void *)[v8 copy];

    uint64_t v10 = [(AMSObservable *)self stateLock];
    [v10 unlockWithCondition:1];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * v15);
          uint64_t v17 = [(AMSObservable *)self sendMessageQueue];
          [v16 _sendFailure:v4 usingQueue:v17];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }
  }
  return v7 != 1;
}

- (BOOL)sendResult:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(AMSObservable *)self stateLock];
  [v5 lock];

  id v6 = [(AMSObservable *)self stateLock];
  uint64_t v7 = [v6 condition];

  if (v7 == 1)
  {
    id v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = v10;
      uint64_t v12 = [(AMSObservable *)self logKey];
      *(_DWORD *)buf = 138543618;
      v65 = v10;
      __int16 v66 = 2114;
      v67 = v12;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Someone is attempting to send a result from a completed AMSObservable.", buf, 0x16u);
    }
    uint64_t v13 = [(AMSObservable *)self stateLock];
    [v13 unlock];
    BOOL v14 = 0;
    goto LABEL_37;
  }
  uint64_t v15 = [(AMSObservable *)self queuedResults];
  [v15 addObject:v4];

  v16 = [(AMSObservable *)self queuedResults];
  uint64_t v13 = (void *)[v16 copy];

  uint64_t v17 = [(AMSObservable *)self observers];
  v18 = (void *)[v17 copy];

  v53 = v18;
  if ([v18 count])
  {
    id v19 = +[AMSLogConfig sharedConfig];
    if (!v19)
    {
      id v19 = +[AMSLogConfig sharedConfig];
    }
    objc_super v20 = [v19 OSLogObject];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_13;
    }
    id v21 = v13;
    long long v22 = objc_opt_class();
    id v23 = v22;
    long long v24 = [(AMSObservable *)self logKey];
    *(_DWORD *)buf = 138543618;
    v65 = v22;
    uint64_t v13 = v21;
    __int16 v66 = 2114;
    v67 = v24;
    long long v25 = "%{public}@: [%{public}@] There's at least one observer. Sending the result.";
    goto LABEL_12;
  }
  unint64_t v26 = [(AMSObservable *)self behavior];
  uint64_t v27 = +[AMSLogConfig sharedConfig];
  id v19 = (void *)v27;
  if (v26)
  {
    if (!v27)
    {
      id v19 = +[AMSLogConfig sharedConfig];
    }
    v28 = [v19 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      __int16 v29 = v13;
      v30 = objc_opt_class();
      id v31 = v30;
      uint64_t v32 = [(AMSObservable *)self logKey];
      *(_DWORD *)buf = 138543618;
      v65 = v30;
      uint64_t v13 = v29;
      __int16 v66 = 2114;
      v67 = v32;
      _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] The are no observers. Queuing the result.", buf, 0x16u);
    }
    goto LABEL_20;
  }
  if (!v27)
  {
    id v19 = +[AMSLogConfig sharedConfig];
  }
  objc_super v20 = [v19 OSLogObject];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    long long v47 = v13;
    long long v48 = objc_opt_class();
    id v23 = v48;
    long long v24 = [(AMSObservable *)self logKey];
    *(_DWORD *)buf = 138543618;
    v65 = v48;
    uint64_t v13 = v47;
    __int16 v66 = 2114;
    v67 = v24;
    long long v25 = "%{public}@: [%{public}@] The are no observers.";
LABEL_12:
    _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEBUG, v25, buf, 0x16u);
  }
LABEL_13:

  id v19 = [(AMSObservable *)self queuedResults];
  [v19 removeAllObjects];
LABEL_20:

  uint64_t v33 = [(AMSObservable *)self stateLock];
  [v33 unlock];

  uint64_t v34 = [v53 count];
  BOOL v14 = v34 != 0;
  if (v34)
  {
    long long v49 = v13;
    id v50 = v4;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    obuint64_t j = v13;
    uint64_t v35 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v52 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v59 != v52) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = *(void *)(*((void *)&v58 + 1) + 8 * i);
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v39 = v53;
          uint64_t v40 = [v39 countByEnumeratingWithState:&v54 objects:v62 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            uint64_t v42 = *(void *)v55;
            do
            {
              for (uint64_t j = 0; j != v41; ++j)
              {
                if (*(void *)v55 != v42) {
                  objc_enumerationMutation(v39);
                }
                long long v44 = *(void **)(*((void *)&v54 + 1) + 8 * j);
                long long v45 = [(AMSObservable *)self sendMessageQueue];
                [v44 _sendResult:v38 usingQueue:v45];
              }
              uint64_t v41 = [v39 countByEnumeratingWithState:&v54 objects:v62 count:16];
            }
            while (v41);
          }
        }
        uint64_t v36 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
      }
      while (v36);
    }

    uint64_t v13 = v49;
    id v4 = v50;
    BOOL v14 = 1;
  }

LABEL_37:
  return v14;
}

- (id)subscribeWithResultBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[AMSObserver alloc] initWithResultBlock:v4];

  [(AMSObservable *)self subscribe:v5];
  return v5;
}

- (void)unsubscribe:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(AMSObservable *)self stateLock];
  [v5 lock];

  id v6 = [(AMSObservable *)self stateLock];
  uint64_t v7 = [v6 condition];

  if (v7 == 1)
  {
    id v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_13;
    }
    uint64_t v10 = objc_opt_class();
    id v11 = v10;
    uint64_t v12 = [(AMSObservable *)self logKey];
    int v18 = 138543618;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = v12;
    uint64_t v13 = "%{public}@: [%{public}@] Someone is attempting to remove an observer from a completed observable.";
LABEL_12:
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v18, 0x16u);

LABEL_13:
    goto LABEL_14;
  }
  BOOL v14 = [(AMSObservable *)self observers];
  char v15 = [v14 containsObject:v4];

  if ((v15 & 1) == 0)
  {
    id v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_13;
    }
    v16 = objc_opt_class();
    id v11 = v16;
    uint64_t v12 = [(AMSObservable *)self logKey];
    int v18 = 138543618;
    id v19 = v16;
    __int16 v20 = 2114;
    id v21 = v12;
    uint64_t v13 = "%{public}@: [%{public}@] Someone is attempting to remove an observer from an observable it isn't subscribed to.";
    goto LABEL_12;
  }
  id v8 = [(AMSObservable *)self observers];
  [v8 removeObject:v4];
LABEL_14:

  uint64_t v17 = [(AMSObservable *)self stateLock];
  [v17 unlock];
}

- (void)unsubscribeAll
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSObservable *)self stateLock];
  [v3 lock];

  id v4 = [(AMSObservable *)self stateLock];
  uint64_t v5 = [v4 condition];

  if (v5 == 1)
  {
    id v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      uint64_t v10 = [(AMSObservable *)self logKey];
      *(_DWORD *)buf = 138543618;
      char v15 = v8;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Someone is attempting to remove all observers from a completed observable.", buf, 0x16u);
    }
    id v11 = [(AMSObservable *)self stateLock];
    [v11 unlock];
  }
  else
  {
    uint64_t v12 = [(AMSObservable *)self observers];
    [v12 removeAllObjects];

    id v13 = [(AMSObservable *)self stateLock];
    [v13 unlock];
  }
}

- (BOOL)_isComplete
{
  v2 = [(AMSObservable *)self stateLock];
  BOOL v3 = [v2 condition] == 1;

  return v3;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (NSError)failureError
{
  return self->_failureError;
}

- (void)setFailureError:(id)a3
{
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (void)setObservers:(id)a3
{
}

- (void)setQueuedResults:(id)a3
{
}

- (OS_dispatch_queue)sendMessageQueue
{
  return self->_sendMessageQueue;
}

- (void)setSendMessageQueue:(id)a3
{
}

- (void)setStateLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_sendMessageQueue, 0);
  objc_storeStrong((id *)&self->_queuedResults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_failureError, 0);
}

@end