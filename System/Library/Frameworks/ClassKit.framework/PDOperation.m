@interface PDOperation
- (BOOL)isAborted;
- (BOOL)isFinished;
- (BOOL)mayUseCellularData;
- (BOOL)requiresValidUser;
- (NSError)operationError;
- (NSMutableDictionary)statusReport;
- (NSString)operationID;
- (NSString)sourceApplicationBundleIdentifier;
- (PDDatabase)database;
- (PDOperation)init;
- (PDOperation)initWithDatabase:(id)a3;
- (PDOperationsManager)manager;
- (double)timeoutIntervalForRequests;
- (id)logSubsystem;
- (id)stringForState;
- (int64_t)maxExecutionCount;
- (void)abort;
- (void)abortWithError:(id)a3;
- (void)addOnFinishBlock:(id)a3;
- (void)cancel;
- (void)finishWithError:(id)a3;
- (void)markAsFinished;
- (void)setAborted:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)setManager:(id)a3;
- (void)setSourceApplicationBundleIdentifier:(id)a3;
@end

@implementation PDOperation

- (PDDatabase)database
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_database);

  return (PDDatabase *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_operationError, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_destroyWeak((id *)&self->_database);
  objc_storeStrong((id *)&self->_onFinishBlocks, 0);

  objc_storeStrong((id *)&self->_operationTransaction, 0);
}

- (PDOperation)initWithDatabase:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PDOperation;
  v5 = [(PDOperation *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_database, v4);
    [(PDOperation *)v6 setQualityOfService:17];
    uint64_t v7 = +[NSString stringWithFormat:@"op-%d", ic()];
    operationID = v6->_operationID;
    v6->_operationID = (NSString *)v7;

    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = +[NSString stringWithFormat:@"%@-%@", v10, v6->_operationID];
    [(PDOperation *)v6 setName:v11];

    uint64_t v12 = sub_10000C710();
    sourceApplicationBundleIdentifier = v6->_sourceApplicationBundleIdentifier;
    v6->_sourceApplicationBundleIdentifier = (NSString *)v12;

    id v14 = [(PDOperation *)v6 name];
    [v14 UTF8String];
    uint64_t v15 = os_transaction_create();
    operationTransaction = v6->_operationTransaction;
    v6->_operationTransaction = (OS_os_transaction *)v15;

    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (PDOperation)init
{
  uint64_t v3 = objc_opt_class();
  id v4 = NSStringFromSelector(a2);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"The method -[%@ %@] is not available.", v3, v4);
  id v6 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)PDOperation;
  [(PDOperation *)&v3 cancel];
  [(PDOperation *)self abort];
}

- (void)abort
{
  NSStringFromSelector("isAborted");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(PDOperation *)self willChangeValueForKey:v3];
  self->_aborted = 1;
  [(PDOperation *)self didChangeValueForKey:v3];
  [(PDOperation *)self markAsFinished];
}

- (BOOL)isAborted
{
  return self->_aborted;
}

- (BOOL)requiresValidUser
{
  return 1;
}

- (id)stringForState
{
  if ([(PDOperation *)self isCancelled]) {
    return @"cancelled";
  }
  if ([(PDOperation *)self isAborted]) {
    return @"aborted";
  }
  if ([(PDOperation *)self isFinished]) {
    return @"finished";
  }
  if ([(PDOperation *)self isReady]) {
    return @"ready";
  }
  if ([(PDOperation *)self isExecuting]) {
    return @"executing";
  }
  return @"unknown";
}

- (void)markAsFinished
{
  [(PDOperation *)self setFinished:1];
  id v3 = +[PDUserDefaults sharedDefaults];
  unsigned int v4 = [v3 enableVerboseLogging];

  if (v4)
  {
    CLSInitLog();
    v5 = (void *)CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
    {
      id v6 = v5;
      uint64_t v7 = [(PDOperation *)self stringForState];
      v8 = objc_opt_class();
      id v9 = v8;
      v10 = [(PDOperation *)self operationID];
      int v11 = 138412802;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      id v14 = v8;
      __int16 v15 = 2114;
      v16 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "OPS: markAsFinished: %@ %{public}@:%{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)abortWithError:(id)a3
{
  objc_storeStrong((id *)&self->_operationError, a3);

  [(PDOperation *)self abort];
}

- (void)finishWithError:(id)a3
{
  objc_storeStrong((id *)&self->_operationError, a3);

  [(PDOperation *)self markAsFinished];
}

- (BOOL)isFinished
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_finished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFinished:(BOOL)a3
{
  int v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int finished = self->_finished;
  os_unfair_lock_unlock(p_lock);
  if (finished != v3)
  {
    if (qword_10023E708 != -1) {
      dispatch_once(&qword_10023E708, &stru_1001F50C8);
    }
    [(PDOperation *)self willChangeValueForKey:qword_10023E700];
    os_unfair_lock_lock(p_lock);
    self->_int finished = v3;
    os_unfair_lock_unlock(p_lock);
    [(PDOperation *)self didChangeValueForKey:qword_10023E700];
    if (v3)
    {
      os_unfair_lock_lock(p_lock);
      id v7 = [(NSMutableArray *)self->_onFinishBlocks copy];
      os_unfair_lock_unlock(p_lock);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v8 = v7;
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v15;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v8);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * i));
          }
          id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v10);
      }

      [(PDOperation *)self flushCachedData];
      os_unfair_lock_lock(p_lock);
      operationTransaction = self->_operationTransaction;
      self->_operationTransaction = 0;

      os_unfair_lock_unlock(p_lock);
    }
  }
}

- (void)addOnFinishBlock:(id)a3
{
  id v9 = (void (**)(id, PDOperation *))a3;
  if ([(PDOperation *)self isFinished]) {
    v9[2](v9, self);
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  onFinishBlocks = self->_onFinishBlocks;
  if (!onFinishBlocks)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    id v7 = self->_onFinishBlocks;
    self->_onFinishBlocks = v6;

    onFinishBlocks = self->_onFinishBlocks;
  }
  id v8 = objc_retainBlock(v9);
  [(NSMutableArray *)onFinishBlocks addObject:v8];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)mayUseCellularData
{
  return 1;
}

- (int64_t)maxExecutionCount
{
  return 15;
}

- (double)timeoutIntervalForRequests
{
  return 60.0;
}

- (NSMutableDictionary)statusReport
{
  int v3 = objc_opt_new();
  unsigned int v4 = [(PDOperation *)self name];
  [v3 setObject:v4 forKeyedSubscript:@"operation"];

  operationError = self->_operationError;
  if (operationError)
  {
    id v6 = [(NSError *)operationError description];
    [v3 setObject:v6 forKeyedSubscript:@"operationError"];
  }
  else
  {
    [v3 setObject:@"none" forKeyedSubscript:@"operationError"];
  }
  id v7 = [(PDOperation *)self operationID];
  [v3 setObject:v7 forKeyedSubscript:@"operationID"];

  id v8 = +[NSNumber numberWithBool:[(PDOperation *)self isAborted]];
  [v3 setObject:v8 forKeyedSubscript:@"isAborted"];

  id v9 = +[NSNumber numberWithBool:[(PDOperation *)self isCancelled]];
  [v3 setObject:v9 forKeyedSubscript:@"isCancelled"];

  id v10 = +[NSNumber numberWithBool:[(PDOperation *)self isFinished]];
  [v3 setObject:v10 forKeyedSubscript:@"isFinished"];

  uint64_t v11 = [(PDOperation *)self sourceApplicationBundleIdentifier];
  [v3 setObject:v11 forKeyedSubscript:@"sourceApplicationBundleIdentifier"];

  return (NSMutableDictionary *)v3;
}

- (id)logSubsystem
{
  return CLSLogOperations;
}

- (void)setAborted:(BOOL)a3
{
  self->_aborted = a3;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (NSError)operationError
{
  return self->_operationError;
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
}

- (PDOperationsManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);

  return (PDOperationsManager *)WeakRetained;
}

- (void)setManager:(id)a3
{
}

@end