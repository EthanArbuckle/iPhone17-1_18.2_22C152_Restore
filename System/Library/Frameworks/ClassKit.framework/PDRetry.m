@interface PDRetry
- (BOOL)_shouldRetry:(id)a3;
- (void)_perform;
- (void)_processBlockDoneStatus:(BOOL)a3 error:(id)a4 completionBlocks:(id)a5;
@end

@implementation PDRetry

- (void)_perform
{
  self->_consecutiveRunRequested = 0;
  ++self->_currentAttempt;
  id v3 = [(NSMutableArray *)self->_completionBlocks copy];
  [(NSMutableArray *)self->_completionBlocks removeAllObjects];
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004A3D4;
  v6[3] = &unk_1001F2D00;
  objc_copyWeak(&v8, &location);
  id v4 = v3;
  id v7 = v4;
  v5 = objc_retainBlock(v6);
  self->_state = 1;
  (*((void (**)(void))self->_block + 2))();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldRetry:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_currentAttempt >= self->_maxAttempts)
  {
    CLSInitLog();
    v13 = CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
    {
      unint64_t currentAttempt = self->_currentAttempt;
      name = self->_name;
      int v17 = 138412546;
      v18 = name;
      __int16 v19 = 2048;
      unint64_t v20 = currentAttempt;
      v10 = "PDRetry task: %@ (%ld) retry limit reached.";
      v11 = v13;
      uint32_t v12 = 22;
      goto LABEL_10;
    }
LABEL_7:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  BOOL v6 = 1;
  if (v4 && (objc_msgSend(v4, "cls_isRetryable:", 1) & 1) == 0)
  {
    CLSInitLog();
    id v7 = CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v9 = self->_currentAttempt;
      id v8 = self->_name;
      int v17 = 138412802;
      v18 = v8;
      __int16 v19 = 2048;
      unint64_t v20 = v9;
      __int16 v21 = 2112;
      v22 = v5;
      v10 = "PDRetry task: %@ (%ld) retry denied for error:%@";
      v11 = v7;
      uint32_t v12 = 32;
LABEL_10:
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v17, v12);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (void)_processBlockDoneStatus:(BOOL)a3 error:(id)a4 completionBlocks:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!a3)
  {
    CLSInitLog();
    v10 = CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_INFO))
    {
      unint64_t currentAttempt = self->_currentAttempt;
      name = self->_name;
      *(_DWORD *)buf = 138412802;
      v31 = name;
      __int16 v32 = 2048;
      unint64_t v33 = currentAttempt;
      __int16 v34 = 2114;
      unint64_t v35 = (unint64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "PDRetry task: %@ (%ld) failed; error: %{public}@;",
        buf,
        0x20u);
    }
    if ([(PDRetry *)self _shouldRetry:v8])
    {
      [(NSMutableArray *)self->_completionBlocks addObjectsFromArray:v9];
      uint64_t v13 = (uint64_t)(float)(exp2f((float)self->_currentAttempt) + 2.0);
      CLSInitLog();
      v14 = CLSLogOperations;
      if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v20 = self->_currentAttempt;
        __int16 v19 = self->_name;
        *(_DWORD *)buf = 138412802;
        v31 = v19;
        __int16 v32 = 2048;
        unint64_t v33 = v20;
        __int16 v34 = 2048;
        unint64_t v35 = v13;
        _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "PDRetry scheduling retry for task: %@ (%ld); will retry after %lld seconds;",
          buf,
          0x20u);
      }
      self->_state = 2;
      objc_initWeak((id *)buf, self);
      dispatch_time_t v15 = dispatch_time(0, 1000000000 * v13);
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004AAA4;
      block[3] = &unk_1001F2D28;
      objc_copyWeak(&v29, (id *)buf);
      dispatch_after(v15, queue, block);
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
      goto LABEL_15;
    }
    CLSInitLog();
    int v17 = CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v22 = self->_currentAttempt;
      __int16 v21 = self->_name;
      unint64_t maxAttempts = self->_maxAttempts;
      *(_DWORD *)buf = 138412802;
      v31 = v21;
      __int16 v32 = 2048;
      unint64_t v33 = v22;
      __int16 v34 = 2048;
      unint64_t v35 = maxAttempts;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "PDRetry task: %@ failed; we made %ld attempts out of %ld max; this was our last attempt - bailing out!",
        buf,
        0x20u);
    }
    self->_unint64_t currentAttempt = 0;
    if (!v8)
    {
      id v8 = +[NSError cls_createErrorWithCode:6, @"perform %@ failed with max retries: %ld", self->_name, self->_maxAttempts format];
    }
  }
  self->_state = 0;
  if (self->_consecutiveRunRequested) {
    [(PDRetry *)self _perform];
  }
  v18 = dispatch_get_global_queue(0, 0);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10004AAE8;
  v24[3] = &unk_1001F2D50;
  id v25 = v9;
  BOOL v27 = a3;
  id v8 = v8;
  id v26 = v8;
  dispatch_async(v18, v24);

LABEL_15:
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_completionBlocks, 0);
}

@end