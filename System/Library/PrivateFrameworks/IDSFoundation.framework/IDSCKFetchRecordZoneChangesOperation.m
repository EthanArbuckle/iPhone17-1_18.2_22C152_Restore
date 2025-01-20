@interface IDSCKFetchRecordZoneChangesOperation
+ (Class)__class;
+ (id)alloc;
- (BOOL)fetchAllChanges;
- (id)fetchRecordZoneChangesCompletionBlock;
- (id)recordChangedBlock;
- (id)recordWithIDWasDeletedBlock;
- (id)recordZoneChangeTokensUpdatedBlock;
- (id)recordZoneFetchCompletionBlock;
- (void)setFetchAllChanges:(BOOL)a3;
- (void)setFetchRecordZoneChangesCompletionBlock:(id)a3;
- (void)setRecordChangedBlock:(id)a3;
- (void)setRecordWithIDWasDeletedBlock:(id)a3;
- (void)setRecordZoneChangeTokensUpdatedBlock:(id)a3;
- (void)setRecordZoneFetchCompletionBlock:(id)a3;
@end

@implementation IDSCKFetchRecordZoneChangesOperation

+ (Class)__class
{
  if (qword_1E944F570 != -1) {
    dispatch_once(&qword_1E944F570, &unk_1EEFCE0F8);
  }
  v2 = (void *)qword_1E944F568;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (void)setFetchAllChanges:(BOOL)a3
{
  self->_fetchAllChanges = a3;
}

- (id)recordChangedBlock
{
  return self->_recordChangedBlock;
}

- (void)setRecordChangedBlock:(id)a3
{
}

- (id)recordWithIDWasDeletedBlock
{
  return self->_recordWithIDWasDeletedBlock;
}

- (void)setRecordWithIDWasDeletedBlock:(id)a3
{
}

- (id)recordZoneChangeTokensUpdatedBlock
{
  return self->_recordZoneChangeTokensUpdatedBlock;
}

- (void)setRecordZoneChangeTokensUpdatedBlock:(id)a3
{
}

- (id)recordZoneFetchCompletionBlock
{
  return self->_recordZoneFetchCompletionBlock;
}

- (void)setRecordZoneFetchCompletionBlock:(id)a3
{
}

- (id)fetchRecordZoneChangesCompletionBlock
{
  return self->_fetchRecordZoneChangesCompletionBlock;
}

- (void)setFetchRecordZoneChangesCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchRecordZoneChangesCompletionBlock, 0);
  objc_storeStrong(&self->_recordZoneFetchCompletionBlock, 0);
  objc_storeStrong(&self->_recordZoneChangeTokensUpdatedBlock, 0);
  objc_storeStrong(&self->_recordWithIDWasDeletedBlock, 0);
  objc_storeStrong(&self->_recordChangedBlock, 0);
}

@end