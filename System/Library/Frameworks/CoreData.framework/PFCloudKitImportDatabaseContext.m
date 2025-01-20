@interface PFCloudKitImportDatabaseContext
- (BOOL)hasWorkToDo;
- (PFCloudKitImportDatabaseContext)init;
- (id)description;
- (void)dealloc;
@end

@implementation PFCloudKitImportDatabaseContext

- (PFCloudKitImportDatabaseContext)init
{
  v4.receiver = self;
  v4.super_class = (Class)PFCloudKitImportDatabaseContext;
  v2 = [(PFCloudKitImportDatabaseContext *)&v4 init];
  if (v2)
  {
    v2->_changedRecordZoneIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v2->_deletedRecordZoneIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v2->_purgedRecordZoneIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v2->_userResetEncryptedDataZoneIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v2->_updatedChangeToken = 0;
  }
  return v2;
}

- (void)dealloc
{
  self->_changedRecordZoneIDs = 0;
  self->_deletedRecordZoneIDs = 0;

  self->_purgedRecordZoneIDs = 0;
  self->_userResetEncryptedDataZoneIDs = 0;

  self->_updatedChangeToken = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitImportDatabaseContext;
  [(PFCloudKitImportDatabaseContext *)&v3 dealloc];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PFCloudKitImportDatabaseContext;
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", -[PFCloudKitImportDatabaseContext description](&v6, sel_description));
  updatedChangeToken = self->_updatedChangeToken;
  if (!updatedChangeToken) {
    updatedChangeToken = (CKServerChangeToken *)[MEMORY[0x1E4F1CA98] null];
  }
  [v3 appendFormat:@" {\nToken: %@", updatedChangeToken];
  if ([(NSMutableSet *)self->_changedRecordZoneIDs count]) {
    [v3 appendFormat:@"\nChanged:\n%@", self->_changedRecordZoneIDs];
  }
  if ([(NSMutableSet *)self->_deletedRecordZoneIDs count]) {
    [v3 appendFormat:@"\nDeleted:\n%@", self->_deletedRecordZoneIDs];
  }
  if ([(NSMutableSet *)self->_purgedRecordZoneIDs count]) {
    [v3 appendFormat:@"\nPurged:\n%@", self->_purgedRecordZoneIDs];
  }
  if ([(NSMutableSet *)self->_userResetEncryptedDataZoneIDs count]) {
    [v3 appendFormat:@"\nReset:\n%@", self->_userResetEncryptedDataZoneIDs];
  }
  [v3 appendString:@"\n}"];
  return v3;
}

- (BOOL)hasWorkToDo
{
  if (result)
  {
    uint64_t v1 = result;
    return [*(id *)(result + 8) count]
        || [*(id *)(v1 + 24) count]
        || [*(id *)(v1 + 16) count] != 0;
  }
  return result;
}

@end