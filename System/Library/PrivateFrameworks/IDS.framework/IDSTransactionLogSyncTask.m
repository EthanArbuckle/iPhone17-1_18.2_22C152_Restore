@interface IDSTransactionLogSyncTask
- (BOOL)shouldContinueFromLastSyncPoint;
- (id)batchProcessingBlock;
- (id)knownRecordIDsFromList;
- (void)setBatchProcessingBlock:(id)a3;
- (void)setKnownRecordIDsFromList:(id)a3;
- (void)setShouldContinueFromLastSyncPoint:(BOOL)a3;
@end

@implementation IDSTransactionLogSyncTask

- (id)batchProcessingBlock
{
  return self->_batchProcessingBlock;
}

- (void)setBatchProcessingBlock:(id)a3
{
}

- (id)knownRecordIDsFromList
{
  return self->_knownRecordIDsFromList;
}

- (void)setKnownRecordIDsFromList:(id)a3
{
}

- (BOOL)shouldContinueFromLastSyncPoint
{
  return self->_shouldContinueFromLastSyncPoint;
}

- (void)setShouldContinueFromLastSyncPoint:(BOOL)a3
{
  self->_shouldContinueFromLastSyncPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_knownRecordIDsFromList, 0);

  objc_storeStrong(&self->_batchProcessingBlock, 0);
}

@end