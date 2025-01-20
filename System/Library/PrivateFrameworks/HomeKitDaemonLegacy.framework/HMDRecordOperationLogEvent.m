@interface HMDRecordOperationLogEvent
- (BOOL)isLegacy;
- (HMDRecordOperationLogEvent)initWithSize:(unint64_t)a3 isLegacy:(BOOL)a4;
- (unint64_t)size;
@end

@implementation HMDRecordOperationLogEvent

- (BOOL)isLegacy
{
  return self->_legacy;
}

- (unint64_t)size
{
  return self->_size;
}

- (HMDRecordOperationLogEvent)initWithSize:(unint64_t)a3 isLegacy:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HMDRecordOperationLogEvent;
  result = [(HMMLogEvent *)&v7 init];
  if (result)
  {
    result->_size = a3;
    result->_legacy = a4;
  }
  return result;
}

@end