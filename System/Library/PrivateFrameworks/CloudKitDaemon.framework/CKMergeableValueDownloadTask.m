@interface CKMergeableValueDownloadTask
- (CKMergeableRecordValue)recordValue;
- (CKMergeableValueID)mergeableValueID;
- (CKRecord)record;
- (NSString)key;
- (id)completionBlock;
- (void)setCompletionBlock:(id)a3;
- (void)setKey:(id)a3;
- (void)setMergeableValueID:(id)a3;
- (void)setRecord:(id)a3;
- (void)setRecordValue:(id)a3;
@end

@implementation CKMergeableValueDownloadTask

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (CKMergeableValueID)mergeableValueID
{
  return self->_mergeableValueID;
}

- (void)setMergeableValueID:(id)a3
{
}

- (CKMergeableRecordValue)recordValue
{
  return self->_recordValue;
}

- (void)setRecordValue:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_recordValue, 0);
  objc_storeStrong((id *)&self->_mergeableValueID, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end