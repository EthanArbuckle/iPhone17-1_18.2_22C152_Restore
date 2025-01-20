@interface IDSCKModifyRecordZonesOperation
+ (Class)__class;
+ (id)alloc;
- (NSArray)recordZoneIDsToDelete;
- (NSArray)recordZonesToSave;
- (id)modifyRecordZonesCompletionBlock;
- (int64_t)qualityOfService;
- (void)setModifyRecordZonesCompletionBlock:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRecordZoneIDsToDelete:(id)a3;
- (void)setRecordZonesToSave:(id)a3;
@end

@implementation IDSCKModifyRecordZonesOperation

+ (Class)__class
{
  if (qword_1E944F590 != -1) {
    dispatch_once(&qword_1E944F590, &unk_1EEFCE198);
  }
  v2 = (void *)qword_1E944F588;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

- (NSArray)recordZonesToSave
{
  return self->_recordZonesToSave;
}

- (void)setRecordZonesToSave:(id)a3
{
}

- (NSArray)recordZoneIDsToDelete
{
  return self->_recordZoneIDsToDelete;
}

- (void)setRecordZoneIDsToDelete:(id)a3
{
}

- (id)modifyRecordZonesCompletionBlock
{
  return self->_modifyRecordZonesCompletionBlock;
}

- (void)setModifyRecordZonesCompletionBlock:(id)a3
{
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modifyRecordZonesCompletionBlock, 0);
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordZonesToSave, 0);
}

@end