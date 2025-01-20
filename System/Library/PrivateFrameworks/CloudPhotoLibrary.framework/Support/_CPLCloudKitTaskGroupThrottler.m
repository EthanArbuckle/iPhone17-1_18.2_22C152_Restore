@interface _CPLCloudKitTaskGroupThrottler
- (BOOL)shouldRunOperationsNow:(id)a3 error:(id *)a4;
- (NSDate)throttlingDate;
- (NSString)groupName;
- (_CPLCloudKitTaskGroupThrottler)initWithGroupName:(id)a3 minimumThrottlingInterval:(double)a4;
- (double)minimumThrottlingInterval;
- (id)statusWithNow:(id)a3;
- (void)_adjustThrottlingDateWithNow:(id)a3 andError:(id)a4;
- (void)_incrementThrottledCount;
- (void)operationDidFinishNow:(id)a3 withError:(id)a4;
@end

@implementation _CPLCloudKitTaskGroupThrottler

- (_CPLCloudKitTaskGroupThrottler)initWithGroupName:(id)a3 minimumThrottlingInterval:(double)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_CPLCloudKitTaskGroupThrottler;
  v7 = [(_CPLCloudKitTaskGroupThrottler *)&v17 init];
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    groupName = v7->_groupName;
    v7->_groupName = v8;

    v7->_minimumThrottlingInterval = a4;
    v10 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.cpl.cloudkit.throttling", v10);
    logQueue = v7->_logQueue;
    v7->_logQueue = (OS_dispatch_queue *)v11;

    if ([(NSString *)v7->_groupName hasPrefix:@"Locally Throttled "])
    {
      v13 = +[NSDate date];
      uint64_t v14 = objc_msgSend(v13, "dateByAddingTimeInterval:", fmax(v7->_minimumThrottlingInterval, 3600.0));
      throttlingDate = v7->_throttlingDate;
      v7->_throttlingDate = (NSDate *)v14;

      [(_CPLCloudKitTaskGroupThrottler *)v7 _adjustThrottlingDateWithNow:v13 andError:0];
    }
  }

  return v7;
}

- (void)_adjustThrottlingDateWithNow:(id)a3 andError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  throttlingDate = self->_throttlingDate;
  if (!throttlingDate) {
    goto LABEL_14;
  }
  [(NSDate *)throttlingDate timeIntervalSinceDate:v6];
  if (v9 <= 0.0)
  {
    dispatch_queue_t v11 = 0;
    goto LABEL_6;
  }
  double v10 = fmax(self->_minimumThrottlingInterval, 604800.0);
  if (v9 > v10)
  {
    dispatch_queue_t v11 = [v6 dateByAddingTimeInterval:v10];
LABEL_6:
    v12 = self->_throttlingDate;
    self->_throttlingDate = v11;

    throttlingError = self->_throttlingError;
    self->_throttlingError = 0;
  }
  if (self->_throttlingDate && !self->_throttlingError)
  {
    if (v7 && ![v7 isCPLErrorWithCode:1004])
    {
      CFStringRef v14 = @"Server is unavailable for %@";
      uint64_t v15 = 1000;
    }
    else
    {
      CFStringRef v14 = @"%@ has been throttled";
      uint64_t v15 = 1004;
    }
    id v16 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v14, self->_groupName);
    id v17 = objc_alloc((Class)NSError);
    uint64_t v18 = CPLErrorDomain;
    v22[0] = CPLErrorRetryAfterDateKey;
    v22[1] = NSLocalizedDescriptionKey;
    v23[0] = self->_throttlingDate;
    v23[1] = v16;
    v22[2] = @"CPLThrottling";
    v23[2] = &__kCFBooleanTrue;
    v19 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
    v20 = (NSError *)[v17 initWithDomain:v18 code:v15 userInfo:v19];
    v21 = self->_throttlingError;
    self->_throttlingError = v20;
  }
LABEL_14:
}

- (void)_incrementThrottledCount
{
  ++self->_throttledCount;
  logQueue = self->_logQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A648;
  block[3] = &unk_100275EA0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)logQueue, block);
}

- (void)operationDidFinishNow:(id)a3 withError:(id)a4
{
  id v26 = a3;
  id v7 = a4;
  if (+[CPLCloudKitErrors isOperationThrottledError:v7])
  {
    [(_CPLCloudKitTaskGroupThrottler *)self _incrementThrottledCount];
    throttlingError = self->_throttlingError;
    self->_throttlingError = 0;

    double v9 = [v7 userInfo];
    double v10 = (NSString *)CPLErrorRetryAfterDateKey;
    dispatch_queue_t v11 = [v9 objectForKeyedSubscript:CPLErrorRetryAfterDateKey];
    throttlingDate = self->_throttlingDate;
    self->_throttlingDate = v11;

    if (self->_throttlingDate)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          v13 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v28 = v10;
            __int16 v29 = 2112;
            id v30 = (id)objc_opt_class();
            id v14 = v30;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Invalid %@: %@", buf, 0x16u);
          }
        }
        uint64_t v15 = +[NSAssertionHandler currentHandler];
        id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCloudKitTransportTaskGate.m"];
        [v15 handleFailureInMethod:a2, self, v16, 217, @"Invalid %@: %@", v10, objc_opt_class() object file lineNumber description];

        goto LABEL_28;
      }
    }
    else
    {
      id v17 = [v7 userInfo];
      uint64_t v18 = [v17 objectForKeyedSubscript:CKErrorRetryAfterKey];

      if (v18)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            v23 = __CPLGenericOSLogDomain();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v28 = CKErrorRetryAfterKey;
              __int16 v29 = 2112;
              id v30 = (id)objc_opt_class();
              id v24 = v30;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Invalid %@: %@", buf, 0x16u);
            }
          }
          uint64_t v15 = +[NSAssertionHandler currentHandler];
          v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCloudKitTransportTaskGate.m"];
          [v15 handleFailureInMethod:a2, self, v25, 213, @"Invalid %@: %@", CKErrorRetryAfterKey, objc_opt_class() object file lineNumber description];

LABEL_28:
          abort();
        }
        [v18 doubleValue];
        +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
        v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
        v20 = self->_throttlingDate;
        self->_throttlingDate = v19;
      }
    }
    if (!self->_throttlingDate)
    {
      v21 = [v26 dateByAddingTimeInterval:3600.0];
      v22 = self->_throttlingDate;
      self->_throttlingDate = v21;
    }
    [(_CPLCloudKitTaskGroupThrottler *)self _adjustThrottlingDateWithNow:v26 andError:v7];
  }
  else if (v7)
  {
    if (+[CPLCloudKitErrors isOperationCancelledOrDeferredError:v7])
    {
      ++self->_cancelledCount;
    }
    else
    {
      ++self->_failedCount;
    }
  }
}

- (BOOL)shouldRunOperationsNow:(id)a3 error:(id *)a4
{
  id v7 = a3;
  [(_CPLCloudKitTaskGroupThrottler *)self _adjustThrottlingDateWithNow:v7 andError:0];
  if (self->_throttlingDate && objc_msgSend(v7, "compare:") == (id)-1)
  {
    [(_CPLCloudKitTaskGroupThrottler *)self _incrementThrottledCount];
    throttlingError = self->_throttlingError;
    if (!throttlingError) {
      sub_1001C7FE8((uint64_t)a2, (uint64_t)self);
    }
    BOOL v8 = 0;
    if (a4) {
      *a4 = throttlingError;
    }
  }
  else
  {
    BOOL v8 = 1;
  }
  ++self->_count;

  return v8;
}

- (id)statusWithNow:(id)a3
{
  id v4 = a3;
  [(_CPLCloudKitTaskGroupThrottler *)self _adjustThrottlingDateWithNow:v4 andError:0];
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:", @"%@: %lu (failed: %lu"), self->_groupName, self->_count, self->_failedCount;
  id v6 = v5;
  if (self->_cancelledCount) {
    objc_msgSend(v5, "appendFormat:", @" - cancelled: %lu", self->_cancelledCount);
  }
  throttlingDate = self->_throttlingDate;
  if (throttlingDate)
  {
    [(NSDate *)throttlingDate timeIntervalSinceDate:v4];
    BOOL v8 = +[CPLDateFormatter stringForTimeInterval:](CPLDateFormatter, "stringForTimeInterval:");
    [v6 appendFormat:@" - throttled: %lu - throttled for %@"], self->_throttledCount, v8);
  }
  else if (self->_throttledCount)
  {
    [v6 appendFormat:@" - throttled: %lu - not throttled any more"], self->_throttledCount);
  }
  else
  {
    [v6 appendString:@""]);
  }

  return v6;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (double)minimumThrottlingInterval
{
  return self->_minimumThrottlingInterval;
}

- (NSDate)throttlingDate
{
  return self->_throttlingDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttlingDate, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_logQueue, 0);
  objc_storeStrong((id *)&self->_throttlingError, 0);
}

@end