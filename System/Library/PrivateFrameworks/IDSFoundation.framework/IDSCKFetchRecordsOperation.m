@interface IDSCKFetchRecordsOperation
+ (Class)__class;
+ (id)alloc;
- (NSArray)desiredKeys;
- (NSArray)recordIDs;
- (id)fetchRecordsCompletionBlock;
- (id)perRecordCompletionBlock;
- (id)perRecordProgressBlock;
- (void)setDesiredKeys:(id)a3;
- (void)setFetchRecordsCompletionBlock:(id)a3;
- (void)setPerRecordCompletionBlock:(id)a3;
- (void)setPerRecordProgressBlock:(id)a3;
- (void)setRecordIDs:(id)a3;
@end

@implementation IDSCKFetchRecordsOperation

+ (Class)__class
{
  if (qword_1E944F580 != -1) {
    dispatch_once(&qword_1E944F580, &unk_1EEFCE138);
  }
  v2 = (void *)qword_1E944F578;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
}

- (id)perRecordProgressBlock
{
  return self->_perRecordProgressBlock;
}

- (void)setPerRecordProgressBlock:(id)a3
{
}

- (id)perRecordCompletionBlock
{
  return self->_perRecordCompletionBlock;
}

- (void)setPerRecordCompletionBlock:(id)a3
{
}

- (id)fetchRecordsCompletionBlock
{
  return self->_fetchRecordsCompletionBlock;
}

- (void)setFetchRecordsCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchRecordsCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordProgressBlock, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
}

@end