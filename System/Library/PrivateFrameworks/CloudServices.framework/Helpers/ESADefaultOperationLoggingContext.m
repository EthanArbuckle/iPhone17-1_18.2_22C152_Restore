@interface ESADefaultOperationLoggingContext
- (ESADefaultOperationLoggingContext)init;
- (NSDate)currentTime;
- (NSUUID)currentBootId;
- (double)activityRecordRetentionInterval;
- (double)operationTimeoutInterval;
- (int)currentPID;
- (unint64_t)operationRecordRetentionMaxCount;
- (void)setCurrentBootId:(id)a3;
- (void)setCurrentPID:(int)a3;
- (void)setCurrentTime:(id)a3;
@end

@implementation ESADefaultOperationLoggingContext

- (ESADefaultOperationLoggingContext)init
{
  v9.receiver = self;
  v9.super_class = (Class)ESADefaultOperationLoggingContext;
  v2 = [(ESADefaultOperationLoggingContext *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSDate date];
    currentTime = v2->_currentTime;
    v2->_currentTime = (NSDate *)v3;

    uint64_t v5 = sub_1000042B8();
    currentBootId = v2->_currentBootId;
    v2->_currentBootId = (NSUUID *)v5;

    v2->_currentPID = getpid();
    v7 = v2;
  }

  return v2;
}

- (unint64_t)operationRecordRetentionMaxCount
{
  return 500;
}

- (double)activityRecordRetentionInterval
{
  return 604800.0;
}

- (double)operationTimeoutInterval
{
  return 600.0;
}

- (NSDate)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(id)a3
{
}

- (NSUUID)currentBootId
{
  return self->_currentBootId;
}

- (void)setCurrentBootId:(id)a3
{
}

- (int)currentPID
{
  return self->_currentPID;
}

- (void)setCurrentPID:(int)a3
{
  self->_currentPID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBootId, 0);

  objc_storeStrong((id *)&self->_currentTime, 0);
}

@end