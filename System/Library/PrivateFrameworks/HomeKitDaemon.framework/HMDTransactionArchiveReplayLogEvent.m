@interface HMDTransactionArchiveReplayLogEvent
- (HMDTransactionArchiveReplayLogEvent)initWithNumUncommittedRecords:(int64_t)a3 numUncommittedAndPushedRecords:(int64_t)a4;
- (int64_t)numUncommittedAndPushedRecords;
- (int64_t)numUncommittedRecords;
@end

@implementation HMDTransactionArchiveReplayLogEvent

- (int64_t)numUncommittedAndPushedRecords
{
  return self->_numUncommittedAndPushedRecords;
}

- (int64_t)numUncommittedRecords
{
  return self->_numUncommittedRecords;
}

- (HMDTransactionArchiveReplayLogEvent)initWithNumUncommittedRecords:(int64_t)a3 numUncommittedAndPushedRecords:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HMDTransactionArchiveReplayLogEvent;
  result = [(HMMLogEvent *)&v7 init];
  if (result)
  {
    result->_numUncommittedRecords = a3;
    result->_numUncommittedAndPushedRecords = a4;
  }
  return result;
}

@end