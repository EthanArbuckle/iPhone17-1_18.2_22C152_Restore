@interface HMDCoreDataCloudKitOperationLogEvent
- (HMDCoreDataCloudKitOperationLogEvent)initWithOperationType:(unint64_t)a3;
- (HMDCoreDataCloudKitOperationLogEvent)initWithOperationType:(unint64_t)a3 interval:(double)a4;
- (double)interval;
- (unint64_t)operationType;
@end

@implementation HMDCoreDataCloudKitOperationLogEvent

- (double)interval
{
  return self->_interval;
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (HMDCoreDataCloudKitOperationLogEvent)initWithOperationType:(unint64_t)a3 interval:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HMDCoreDataCloudKitOperationLogEvent;
  result = [(HMMLogEvent *)&v7 init];
  if (result)
  {
    result->_operationType = a3;
    result->_interval = a4;
  }
  return result;
}

- (HMDCoreDataCloudKitOperationLogEvent)initWithOperationType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDCoreDataCloudKitOperationLogEvent;
  result = [(HMMLogEvent *)&v5 init];
  if (result) {
    result->_operationType = a3;
  }
  return result;
}

@end