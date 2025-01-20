@interface NSSaveChangesRequest
+ (void)initialize;
- (BOOL)_secureOperation;
- (BOOL)hasChanges;
- (NSSaveChangesRequest)init;
- (NSSaveChangesRequest)initWithInsertedObjects:(NSSet *)insertedObjects updatedObjects:(NSSet *)updatedObjects deletedObjects:(NSSet *)deletedObjects lockedObjects:(NSSet *)lockedObjects;
- (NSSet)deletedObjects;
- (NSSet)insertedObjects;
- (NSSet)lockedObjects;
- (NSSet)updatedObjects;
- (id)description;
- (uint64_t)_addChangedObjectIDsNotification:(uint64_t)result;
- (unint64_t)requestType;
- (void)_setSecureOperation:(BOOL)a3;
- (void)dealloc;
- (void)setDeletedObjects:(void *)result;
@end

@implementation NSSaveChangesRequest

- (unint64_t)requestType
{
  return 2;
}

- (NSSet)updatedObjects
{
  return self->_updatedObjects;
}

- (NSSet)insertedObjects
{
  return self->_insertedObjects;
}

- (NSSet)deletedObjects
{
  return self->_deletedObjects;
}

- (NSSet)lockedObjects
{
  return self->_optimisticallyLockedObjects;
}

- (BOOL)hasChanges
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 16) count];
    uint64_t v3 = [*(id *)(v1 + 24) count] + v2;
    return v3 + [*(id *)(v1 + 32) count] != 0;
  }
  return result;
}

- (uint64_t)_addChangedObjectIDsNotification:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(id *)(result + 56);
    if (!v4)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *(void *)(v3 + 56) = v4;
    }
    return [v4 addObject:a2];
  }
  return result;
}

- (BOOL)_secureOperation
{
  return (BYTE1(self->_flags) >> 1) & 1;
}

- (void)dealloc
{
  self->_insertedObjects = 0;
  self->_updatedObjects = 0;

  self->_deletedObjects = 0;
  self->_optimisticallyLockedObjects = 0;

  self->_mutatedObjectIDsNotifications = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSaveChangesRequest;
  [(NSPersistentStoreRequest *)&v3 dealloc];
}

- (NSSaveChangesRequest)initWithInsertedObjects:(NSSet *)insertedObjects updatedObjects:(NSSet *)updatedObjects deletedObjects:(NSSet *)deletedObjects lockedObjects:(NSSet *)lockedObjects
{
  v12.receiver = self;
  v12.super_class = (Class)NSSaveChangesRequest;
  v10 = [(NSSaveChangesRequest *)&v12 init];
  if (v10)
  {
    v10->_insertedObjects = insertedObjects;
    v10->_updatedObjects = updatedObjects;
    v10->_deletedObjects = deletedObjects;
    v10->_optimisticallyLockedObjects = lockedObjects;
    v10->_flags = 0;
  }
  return v10;
}

+ (void)initialize
{
}

- (NSSaveChangesRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSSaveChangesRequest;
  result = [(NSSaveChangesRequest *)&v3 init];
  if (result)
  {
    result->_insertedObjects = 0;
    result->_updatedObjects = 0;
    result->_deletedObjects = 0;
    result->_optimisticallyLockedObjects = 0;
    result->_flags = 0;
  }
  return result;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v4 = (__CFString *)objc_msgSend(-[NSSet valueForKey:](self->_insertedObjects, "valueForKey:", @"objectID"), "allObjects");
  v5 = (__CFString *)objc_msgSend(-[NSSet valueForKey:](self->_updatedObjects, "valueForKey:", @"objectID"), "allObjects");
  v6 = (__CFString *)objc_msgSend(-[NSSet valueForKey:](self->_deletedObjects, "valueForKey:", @"objectID"), "allObjects");
  v7 = (__CFString *)objc_msgSend(-[NSSet valueForKey:](self->_optimisticallyLockedObjects, "valueForKey:", @"objectID"), "allObjects");
  v8 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)NSSaveChangesRequest;
  id v9 = [(NSSaveChangesRequest *)&v14 description];
  if (![(__CFString *)v4 count]) {
    id v4 = &stru_1ED787880;
  }
  if (![(__CFString *)v5 count]) {
    v5 = &stru_1ED787880;
  }
  if (![(__CFString *)v6 count]) {
    v6 = &stru_1ED787880;
  }
  if ([(__CFString *)v7 count]) {
    v10 = v7;
  }
  else {
    v10 = &stru_1ED787880;
  }
  v11 = (void *)[v8 stringWithFormat:@"%@ { inserts (%@), updates (%@), deletes (%@) locks (%@) }", v9, v4, v5, v6, v10];
  id v12 = v11;
  [v3 drain];
  return v11;
}

- (void)setDeletedObjects:(void *)result
{
  if (result)
  {
    id v3 = result;
    id v4 = (void *)result[4];
    if (v4 != a2)
    {

      result = (void *)[a2 count];
      if (result) {
        result = a2;
      }
      v3[4] = result;
    }
  }
  return result;
}

- (void)_setSecureOperation:(BOOL)a3
{
  unint64_t v3 = self->_flags | 0x200;
  if (!a3) {
    unint64_t v3 = self->_flags & 0xFFFFFEFF;
  }
  self->_flags = v3;
}

@end