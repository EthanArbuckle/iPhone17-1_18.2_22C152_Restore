@interface PFCloudKitOperationBatch
- (PFCloudKitOperationBatch)init;
- (uint64_t)addRecord:(uint64_t)result;
- (void)addDeletedRecordID:(uint64_t)a3 forRecordOfType:;
- (void)dealloc;
@end

@implementation PFCloudKitOperationBatch

- (PFCloudKitOperationBatch)init
{
  v5.receiver = self;
  v5.super_class = (Class)PFCloudKitOperationBatch;
  v2 = [(PFCloudKitOperationBatch *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_sizeInBytes = 0;
    v2->_recordTypeToDeletedRecordID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_records = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_deletedRecordIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v3->_recordIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  return v3;
}

- (void)dealloc
{
  self->_recordTypeToDeletedRecordID = 0;
  self->_records = 0;

  self->_deletedRecordIDs = 0;
  self->_recordIDs = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitOperationBatch;
  [(PFCloudKitOperationBatch *)&v3 dealloc];
}

- (uint64_t)addRecord:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    *(void *)(result + 40) += [a2 size];
    [*(id *)(v3 + 24) addObject:a2];
    v4 = *(void **)(v3 + 32);
    uint64_t v5 = [a2 recordID];
    return [v4 addObject:v5];
  }
  return result;
}

- (void)addDeletedRecordID:(uint64_t)a3 forRecordOfType:
{
  if (a1)
  {
    [*(id *)(a1 + 8) addObject:a2];
    *(void *)(a1 + 40) += +[PFCloudKitSerializer estimateByteSizeOfRecordID:]((uint64_t)PFCloudKitSerializer, a2);
    id v6 = (id)[*(id *)(a1 + 16) objectForKey:a3];
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [*(id *)(a1 + 16) setObject:v7 forKey:a3];
      id v6 = v7;
    }
    id v8 = v6;
    [v6 addObject:a2];
  }
}

@end