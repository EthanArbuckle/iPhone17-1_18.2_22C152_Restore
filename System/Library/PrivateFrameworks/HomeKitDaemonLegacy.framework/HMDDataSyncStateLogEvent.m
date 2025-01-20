@interface HMDDataSyncStateLogEvent
- (HMDDataSyncStateLogEvent)initWithDataSyncState:(unint64_t)a3;
- (unint64_t)dataSyncState;
@end

@implementation HMDDataSyncStateLogEvent

- (unint64_t)dataSyncState
{
  return self->_dataSyncState;
}

- (HMDDataSyncStateLogEvent)initWithDataSyncState:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDDataSyncStateLogEvent;
  result = [(HMMLogEvent *)&v5 init];
  if (result) {
    result->_dataSyncState = a3;
  }
  return result;
}

@end