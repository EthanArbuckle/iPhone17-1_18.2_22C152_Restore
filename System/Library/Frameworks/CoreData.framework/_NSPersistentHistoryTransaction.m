@interface _NSPersistentHistoryTransaction
+ (BOOL)supportsSecureCoding;
- (_NSPersistentHistoryTransaction)initWithCoder:(id)a3;
- (_NSPersistentHistoryTransaction)initWithDictionary:(id)a3 andObjectID:(id)a4;
- (id)_backingObjectID;
- (id)author;
- (id)bundleID;
- (id)changes;
- (id)contextName;
- (id)initialQueryGenerationToken;
- (id)objectIDNotification;
- (id)postQueryGenerationToken;
- (id)processID;
- (id)storeID;
- (id)timestamp;
- (id)token;
- (int64_t)transactionNumber;
- (void)_setChanges:(void *)result;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSPersistentHistoryTransaction

- (int64_t)transactionNumber
{
  return self->_rowIdentifier;
}

- (void)_setChanges:(void *)result
{
  if (result)
  {
    v3 = result;
    v4 = (void *)result[3];
    if (v4 != a2)
    {

      result = a2;
      v3[3] = result;
    }
  }
  return result;
}

- (void)dealloc
{
  self->_changes = 0;
  self->_contextName = 0;

  self->_author = 0;
  self->_bundleID = 0;

  self->_processID = 0;
  self->_queryGeneration = 0;

  self->_storeID = 0;
  self->_backingObjectID = 0;

  self->_coordinator = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSPersistentHistoryTransaction;
  [(_NSPersistentHistoryTransaction *)&v3 dealloc];
}

- (id)contextName
{
  return self->_contextName;
}

- (_NSPersistentHistoryTransaction)initWithDictionary:(id)a3 andObjectID:(id)a4
{
  uint64_t v7 = [a4 _referenceData64];
  v8 = (void *)[a3 objectForKey:@"AUTHORTS"];
  if (!v8) {
    v8 = (void *)[a3 objectForKey:@"AUTHOR"];
  }
  v9 = (void *)[a3 objectForKey:@"BUNDLEIDTS"];
  if (!v9) {
    v9 = (void *)[a3 objectForKey:@"BUNDLEID"];
  }
  v10 = (void *)[a3 objectForKey:@"CONTEXTNAMETS"];
  if (!v10) {
    v10 = (void *)[a3 objectForKey:@"CONTEXTNAME"];
  }
  v11 = (void *)[a3 objectForKey:@"PROCESSIDTS"];
  if (!v11) {
    v11 = (void *)[a3 objectForKey:@"PROCESSID"];
  }
  v12 = (void *)[a3 objectForKey:@"QUERYGEN"];
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"TIMESTAMP"), "doubleValue");
  double v14 = v13;
  v20.receiver = self;
  v20.super_class = (Class)_NSPersistentHistoryTransaction;
  v15 = [(_NSPersistentHistoryTransaction *)&v20 init];
  if (v15)
  {
    v16 = (unint64_t *)[a4 persistentStore];
    v17 = v16;
    if (v16)
    {
      v18 = (void *)atomic_load(v16 + 1);
      if ([v18 _isDeallocating]) {
        v16 = 0;
      }
      else {
        v16 = v18;
      }
    }
    v15->_coordinator = (NSPersistentStoreCoordinator *)v16;
    v15->_storeID = (NSString *)objc_msgSend((id)objc_msgSend(v17, "identifier"), "copy");
    v15->_rowIdentifier = v7;
    v15->_timestamp = v14;
    v15->_bundleID = (NSString *)v9;
    v15->_processID = (NSString *)v11;
    v15->_contextName = (NSString *)v10;
    v15->_author = (NSString *)v8;
    v15->_queryGeneration = (NSData *)v12;
    v15->_backingObjectID = (NSManagedObjectID *)a4;
  }
  return v15;
}

- (id)changes
{
  return self->_changes;
}

- (id)token
{
  objc_super v3 = [_NSPersistentHistoryToken alloc];
  v4 = -[_NSPersistentHistoryToken initWithTransactionNumber:andStoreID:](v3, "initWithTransactionNumber:andStoreID:", [NSNumber numberWithLongLong:self->_rowIdentifier], self->_storeID);

  return v4;
}

- (id)author
{
  return self->_author;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSPersistentHistoryTransaction)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)_NSPersistentHistoryTransaction;
  v4 = [(_NSPersistentHistoryTransaction *)&v17 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x18C127630]();
    v4->_storeID = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPersistentHistoryTransactionStoreID"];
    v4->_rowIdentifier = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSPersistentHistoryTransactionRowID"), "longLongValue");
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSPersistentHistoryTransactionTimestamp"), "doubleValue");
    v4->_timestamp = v6;
    v4->_changes = (NSArray *)(id)[a3 decodeObjectOfClasses:+[_PFRoutines historyChangesArrayClassesForSecureCoding]() forKey:@"NSPersistentHistoryTransactionChangeSet"];
    v4->_bundleID = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPersistentHistoryTransactionBundleID"];
    v4->_processID = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPersistentHistoryTransactionProcessID"];
    v4->_contextName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPersistentHistoryTransactionContextName"];
    v4->_author = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPersistentHistoryTransactionAuthor"];
    v4->_queryGeneration = (NSData *)(id)[a3 decodeObjectOfClasses:+[_PFRoutines historyQueryGenDataClassesForSecureCoding]() forKey:@"NSPersistentHistoryTransactionQueryGen"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    changes = v4->_changes;
    uint64_t v8 = [(NSArray *)changes countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(changes);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) _setTransaction:v4];
        }
        uint64_t v9 = [(NSArray *)changes countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5 = (void *)MEMORY[0x18C127630](self, a2);
  [a3 encodeObject:self->_storeID forKey:@"NSPersistentHistoryTransactionStoreID"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_rowIdentifier), @"NSPersistentHistoryTransactionRowID");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_timestamp), @"NSPersistentHistoryTransactionTimestamp");
  [a3 encodeObject:self->_changes forKey:@"NSPersistentHistoryTransactionChangeSet"];
  [a3 encodeObject:self->_bundleID forKey:@"NSPersistentHistoryTransactionBundleID"];
  [a3 encodeObject:self->_processID forKey:@"NSPersistentHistoryTransactionProcessID"];
  [a3 encodeObject:self->_contextName forKey:@"NSPersistentHistoryTransactionContextName"];
  [a3 encodeObject:self->_author forKey:@"NSPersistentHistoryTransactionAuthor"];
  [a3 encodeObject:self->_queryGeneration forKey:@"NSPersistentHistoryTransactionQueryGen"];
}

- (id)timestamp
{
  return (id)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_timestamp];
}

- (id)initialQueryGenerationToken
{
  if (!self->_queryGeneration) {
    return 0;
  }
  objc_super v3 = [(NSManagedObjectID *)self->_backingObjectID persistentStore];
  queryGeneration = self->_queryGeneration;
  if ([(NSData *)queryGeneration isNSData]) {
    queryGeneration = -[_PFSQLiteSnapshotWrapper initWithData:]([_PFSQLiteSnapshotWrapper alloc], queryGeneration);
  }
  if (v3)
  {
    v5 = [_NSQueryGenerationToken alloc];
    if (v5) {
      v5 = (_NSQueryGenerationToken *)-[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:](v5, queryGeneration, v3, 0);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)postQueryGenerationToken
{
  if (self)
  {
    objc_super v3 = [(NSManagedObjectID *)self->_backingObjectID persistentStore];
    if (v3)
    {
      if ((BYTE1(v3[1]._modelMap) & 0x40) != 0) {
        return 0;
      }
    }
  }
  v4 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterTransaction:self];
  [(NSPersistentHistoryChangeRequest *)v4 setResultType:3];
  [(NSPersistentHistoryChangeRequest *)v4 setFetchLimit:1];
  id v5 = [(NSPersistentStoreCoordinator *)self->_coordinator executeRequest:v4 withContext:0 error:0];
  if (!objc_msgSend((id)objc_msgSend(v5, "result"), "count")) {
    return 0;
  }
  double v6 = objc_msgSend((id)objc_msgSend(v5, "result"), "objectAtIndexedSubscript:", 0);

  return (id)[v6 initialQueryGenerationToken];
}

- (id)storeID
{
  return self->_storeID;
}

- (id)bundleID
{
  return self->_bundleID;
}

- (id)processID
{
  return self->_processID;
}

- (id)_backingObjectID
{
  return self->_backingObjectID;
}

- (id)objectIDNotification
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x18C127630](self, a2);
  if (!self)
  {
    uint64_t v17 = 0;
    goto LABEL_22;
  }
  v4 = (void *)[MEMORY[0x1E4F1CA80] set];
  id v5 = (void *)[MEMORY[0x1E4F1CA80] set];
  double v6 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  changes = self->_changes;
  uint64_t v8 = [(NSArray *)changes countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v8) {
    goto LABEL_15;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v21 != v10) {
        objc_enumerationMutation(changes);
      }
      v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      uint64_t v13 = [v12 changedObjectID];
      uint64_t v14 = [v12 changeType];
      long long v15 = v4;
      if (!v14) {
        goto LABEL_12;
      }
      if (v14 == 2)
      {
        long long v15 = v6;
LABEL_12:
        [v15 addObject:v13];
        continue;
      }
      long long v15 = v5;
      if (v14 == 1) {
        goto LABEL_12;
      }
    }
    uint64_t v9 = [(NSArray *)changes countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v9);
LABEL_15:
  long long v16 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  if ([v4 count]) {
    [v16 setValue:v4 forKey:@"inserted_objectIDs"];
  }
  if ([v5 count]) {
    [v16 setValue:v5 forKey:@"updated_objectIDs"];
  }
  if ([v6 count]) {
    [v16 setValue:v6 forKey:@"deleted_objectIDs"];
  }
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v16];
LABEL_22:
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F28EA0]) initWithName:@"NSManagedObjectContextDidSaveObjectIDsNotification" object:0 userInfo:v17];

  return v18;
}

@end