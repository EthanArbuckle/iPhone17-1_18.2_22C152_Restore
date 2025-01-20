@interface PDAsyncOperation
- (BOOL)didExecute;
- (BOOL)isAsynchronous;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (id)statusReport;
- (void)execute;
- (void)markAsExecuting;
- (void)markAsFinished;
- (void)prepare;
- (void)setDidExecute:(BOOL)a3;
- (void)setExecuting:(BOOL)a3;
- (void)start;
@end

@implementation PDAsyncOperation

- (void)prepare
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v3 = [(PDAsyncOperation *)self dependencies];
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (!v4) {
    goto LABEL_19;
  }
  id v5 = v4;
  uint64_t v6 = *(void *)v24;
  while (2)
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v24 != v6) {
        objc_enumerationMutation(v3);
      }
      v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if ([v8 isCancelled])
      {
        if (isKindOfClass)
        {
LABEL_13:
          id v11 = v8;
          v12 = [v11 operationError];
          v13 = objc_msgSend(v12, "cls_underlyingErrorWithDomain:", CLSErrorCodeDomain);

          if (v13)
          {
            v14 = [v13 domain];
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Aborting operation (dependency failed with error domain:'%@' code:%ld).", v14, [v13 code]);

LABEL_16:
            v16 = +[NSError cls_createErrorWithCode:326 underlyingError:v13 description:v15];
            CLSInitLog();
            v17 = (void *)CLSLogOperations;
            if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
            {
              v18 = v17;
              v19 = objc_opt_class();
              id v20 = v19;
              v21 = objc_opt_class();
              *(_DWORD *)buf = 138412802;
              v28 = v19;
              __int16 v29 = 2112;
              v30 = v21;
              __int16 v31 = 2112;
              v32 = v13;
              id v22 = v21;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "PDRetry aborting operation %@. Dependent operation %@ failed with %@", buf, 0x20u);
            }
            [(PDOperation *)self abortWithError:v16];

            goto LABEL_19;
          }
        }
        v15 = +[NSString stringWithFormat:@"Aborting operation (dependency failed)."];
        v13 = 0;
        goto LABEL_16;
      }
      if (isKindOfClass & 1) != 0 && ([v8 isAborted]) {
        goto LABEL_13;
      }
    }
    id v5 = [v3 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v5) {
      continue;
    }
    break;
  }
LABEL_19:
}

- (void)execute
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)start
{
  if ([(PDOperation *)self isAborted])
  {
    [(PDAsyncOperation *)self markAsFinished];
  }
  else
  {
    id v4 = [(PDOperation *)self database];

    if (v4)
    {
      [(PDAsyncOperation *)self prepare];
      if (![(PDOperation *)self isFinished])
      {
        [(PDAsyncOperation *)self markAsExecuting];
        [(PDAsyncOperation *)self execute];
      }
    }
    else
    {
      [(PDOperation *)self abort];
    }
  }
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)markAsFinished
{
  [(PDAsyncOperation *)self setExecuting:0];
  v3.receiver = self;
  v3.super_class = (Class)PDAsyncOperation;
  [(PDOperation *)&v3 markAsFinished];
}

- (void)markAsExecuting
{
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)didExecute
{
  return self->_didExecute;
}

- (void)setExecuting:(BOOL)a3
{
  if (self->_executing != a3)
  {
    if (a3) {
      self->_didExecute = 1;
    }
    if (qword_10023E558 != -1) {
      dispatch_once(&qword_10023E558, &stru_1001F3830);
    }
    [(PDAsyncOperation *)self willChangeValueForKey:qword_10023E550];
    self->_executing = 0;
    uint64_t v4 = qword_10023E550;
    [(PDAsyncOperation *)self didChangeValueForKey:v4];
  }
}

- (id)statusReport
{
  v6.receiver = self;
  v6.super_class = (Class)PDAsyncOperation;
  objc_super v3 = [(PDOperation *)&v6 statusReport];
  uint64_t v4 = +[NSNumber numberWithBool:[(PDAsyncOperation *)self didExecute]];
  [v3 setObject:v4 forKeyedSubscript:@"didExecute"];

  return v3;
}

- (void)setDidExecute:(BOOL)a3
{
  self->_didExecute = a3;
}

@end