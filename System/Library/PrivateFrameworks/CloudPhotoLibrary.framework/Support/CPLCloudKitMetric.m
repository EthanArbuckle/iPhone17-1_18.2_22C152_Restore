@interface CPLCloudKitMetric
+ (void)initialize;
- (BOOL)submitted;
- (CKContainer)container;
- (CPLCloudKitMetric)initWithName:(id)a3;
- (NSString)identifier;
- (NSString)name;
- (NSString)resultDescription;
- (id)description;
- (id)redactedDescription;
- (int64_t)result;
- (unint64_t)outstandingBeginCount;
- (void)_submitIfNecessary;
- (void)associateWithOperation:(id)a3;
- (void)associatedOperationDidComplete:(id)a3;
- (void)begin;
- (void)drop;
- (void)end;
- (void)setContainer:(id)a3;
- (void)setError:(id)a3;
- (void)setResult:(int64_t)a3;
@end

@implementation CPLCloudKitMetric

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    byte_1002CEB08 = [v2 BOOLForKey:@"CPLCloudKitLogMetrics"];

    if (byte_1002CEB08)
    {
      v5 = CPLCopyDefaultSerialQueueAttributes();
      dispatch_queue_t v3 = dispatch_queue_create("com.apple.cpl.cloudkit.metrics", v5);
      v4 = (void *)qword_1002CEB10;
      qword_1002CEB10 = (uint64_t)v3;
    }
  }
}

- (CPLCloudKitMetric)initWithName:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPLCloudKitMetric;
  v5 = [(CPLCloudKitMetric *)&v16 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    name = v5->_name;
    v5->_name = v6;

    id v8 = objc_alloc((Class)CKEventMetric);
    v9 = +[NSDate date];
    v10 = (CKEventMetric *)[v8 initWithEventName:v4 atTime:v9];
    ckEventMetric = v5->_ckEventMetric;
    v5->_ckEventMetric = v10;

    v12 = byte_1002CEB08
        ? (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%@ #%lu", v5->_name, sub_1000BECF4()]: v5->_name;
    identifier = v5->_identifier;
    v5->_identifier = v12;

    if (byte_1002CEB08)
    {
      if (!_CPLSilentLogging)
      {
        v15 = sub_1000BEDA0();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v5;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: starting", buf, 0xCu);
        }
      }
    }
  }

  return v5;
}

- (void)_submitIfNecessary
{
  if (!self->_outstandingBeginCount && ![(NSMutableSet *)self->_outstandingOperations count])
  {
    self->_submitted = 1;
    if (byte_1002CEB08 && !_CPLSilentLogging)
    {
      v6 = sub_1000BEDA0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = [(CKContainer *)self->_container containerIdentifier];
        int v8 = 138412546;
        v9 = self;
        __int16 v10 = 2112;
        v11 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: submitting to %@", (uint8_t *)&v8, 0x16u);
      }
    }
    [(CPLCloudKitMetric *)self prepareCKEventMetric:self->_ckEventMetric];
    dispatch_queue_t v3 = +[NSNumber numberWithInteger:self->_result];
    [(CKEventMetric *)self->_ckEventMetric setObject:v3 forKeyedSubscript:@"result"];

    ckEventMetric = self->_ckEventMetric;
    v5 = +[NSDate date];
    [(CKEventMetric *)ckEventMetric setEndTime:v5];

    [(CKContainer *)self->_container submitEventMetric:self->_ckEventMetric];
  }
}

- (void)associateWithOperation:(id)a3
{
  id v4 = a3;
  if (!self->_submitted)
  {
    if (byte_1002CEB08 && !_CPLSilentLogging)
    {
      int v8 = sub_1000BEDA0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [v4 cplOperationClassDescription];
        *(_DWORD *)buf = 138412546;
        v11 = self;
        __int16 v12 = 2112;
        v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: associating %@", buf, 0x16u);
      }
    }
    outstandingOperations = self->_outstandingOperations;
    if (outstandingOperations)
    {
      [(NSMutableSet *)outstandingOperations addObject:v4];
    }
    else
    {
      v6 = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithObjects:", v4, 0);
      v7 = self->_outstandingOperations;
      self->_outstandingOperations = v6;
    }
  }
}

- (void)associatedOperationDidComplete:(id)a3
{
  id v4 = a3;
  if (!self->_submitted)
  {
    if (byte_1002CEB08 && !_CPLSilentLogging)
    {
      v7 = sub_1000BEDA0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = [v4 cplOperationClassDescription];
        int v9 = 138412546;
        __int16 v10 = self;
        __int16 v11 = 2112;
        __int16 v12 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: finished %@", (uint8_t *)&v9, 0x16u);
      }
    }
    if (([(CKEventMetric *)self->_ckEventMetric associateWithCompletedOperation:v4] & 1) == 0&& !_CPLSilentLogging)
    {
      v5 = sub_1000BEDA0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = [v4 cplOperationClassDescription];
        int v9 = 138412546;
        __int16 v10 = self;
        __int16 v11 = 2112;
        __int16 v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@: failed to associate with completed %@", (uint8_t *)&v9, 0x16u);
      }
    }
    [(NSMutableSet *)self->_outstandingOperations removeObject:v4];
    [(CPLCloudKitMetric *)self _submitIfNecessary];
  }
}

- (void)begin
{
  if (!self->_submitted)
  {
    ++self->_outstandingBeginCount;
    if (byte_1002CEB08)
    {
      if (!_CPLSilentLogging)
      {
        v2 = sub_1000BEDA0();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t outstandingBeginCount = self->_outstandingBeginCount;
          *(_DWORD *)buf = 138412546;
          v6 = self;
          __int16 v7 = 2048;
          unint64_t v8 = outstandingBeginCount;
          _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@: begin (%lu)", buf, 0x16u);
        }
      }
    }
  }
}

- (void)end
{
  if (!self->_submitted)
  {
    unint64_t outstandingBeginCount = self->_outstandingBeginCount;
    if (!outstandingBeginCount) {
      sub_1001CF3DC(a2, (uint64_t)self);
    }
    if (byte_1002CEB08 && !_CPLSilentLogging)
    {
      id v4 = sub_1000BEDA0();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v5 = self->_outstandingBeginCount;
        int v6 = 138412546;
        __int16 v7 = self;
        __int16 v8 = 2048;
        unint64_t v9 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: end (%lu)", (uint8_t *)&v6, 0x16u);
      }

      unint64_t outstandingBeginCount = self->_outstandingBeginCount;
    }
    self->_unint64_t outstandingBeginCount = outstandingBeginCount - 1;
    [(CPLCloudKitMetric *)self _submitIfNecessary];
  }
}

- (void)setError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    if ([v4 isCPLOperationCancelledError])
    {
      int64_t v5 = 2;
    }
    else if ([v6 isCPLOperationDeferredError])
    {
      int64_t v5 = 3;
    }
    else
    {
      int64_t v5 = 1;
    }
    self->_result = v5;
    id v4 = v6;
  }
  else
  {
    self->_result = 0;
  }
}

- (void)drop
{
  self->_submitted = 1;
  self->_unint64_t outstandingBeginCount = 0;
  self->_outstandingOperations = 0;
  _objc_release_x1();
}

- (NSString)resultDescription
{
  unint64_t v2 = self->_result - 1;
  if (v2 > 2) {
    return (NSString *)&stru_10027FEB8;
  }
  else {
    return (NSString *)*(&off_10027AA28 + v2);
  }
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  id v4 = [(CPLCloudKitMetric *)self identifier];
  int64_t v5 = [(CPLCloudKitMetric *)self resultDescription];
  id v6 = [v3 initWithFormat:@"<%@%@>", v4, v5];

  return v6;
}

- (id)redactedDescription
{
  id v3 = objc_alloc((Class)NSString);
  id v4 = [(CPLCloudKitMetric *)self identifier];
  int64_t v5 = [(CPLCloudKitMetric *)self resultDescription];
  id v6 = [v3 initWithFormat:@"<%@%@>", v4, v5];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (int64_t)result
{
  return self->_result;
}

- (void)setResult:(int64_t)a3
{
  self->_result = a3;
}

- (unint64_t)outstandingBeginCount
{
  return self->_outstandingBeginCount;
}

- (BOOL)submitted
{
  return self->_submitted;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_ckEventMetric, 0);
  objc_storeStrong((id *)&self->_outstandingOperations, 0);
}

@end