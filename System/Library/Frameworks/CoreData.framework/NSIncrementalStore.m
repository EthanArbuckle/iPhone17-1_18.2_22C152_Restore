@interface NSIncrementalStore
+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5;
+ (id)identifierForNewStoreAtURL:(NSURL *)storeURL;
+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4;
- (BOOL)_prepareForExecuteRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (BOOL)load:(id *)a3;
- (BOOL)loadMetadata:(NSError *)error;
- (NSArray)obtainPermanentIDsForObjects:(NSArray *)array error:(NSError *)error;
- (NSIncrementalStoreNode)newValuesForObjectWithID:(NSManagedObjectID *)objectID withContext:(NSManagedObjectContext *)context error:(NSError *)error;
- (NSManagedObjectID)newObjectIDForEntity:(NSEntityDescription *)entity referenceObject:(id)data;
- (id)_newObjectIDForEntityDescription:(id)a3 pk:(int64_t)a4;
- (id)_rawMetadata__;
- (id)executeRequest:(NSPersistentStoreRequest *)request withContext:(NSManagedObjectContext *)context error:(NSError *)error;
- (id)metadata;
- (id)newValueForRelationship:(NSRelationshipDescription *)relationship forObjectWithID:(NSManagedObjectID *)objectID withContext:(NSManagedObjectContext *)context error:(NSError *)error;
- (id)referenceObjectForObjectID:(NSManagedObjectID *)objectID;
- (void)_setMetadata:(id)a3 includeVersioning:(BOOL)a4;
- (void)dealloc;
- (void)setMetadata:(id)a3;
@end

@implementation NSIncrementalStore

- (BOOL)load:(id *)a3
{
  return 1;
}

+ (id)identifierForNewStoreAtURL:(NSURL *)storeURL
{
  return +[_PFRoutines _getUUID]();
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4
{
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithPersistentStoreCoordinator:configurationName:URL:options:", 0, 0, a3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"NSReadOnlyPersistentStoreOption"));
  int v6 = [v5 loadMetadata:a4];
  v7 = 0;
  if (v6) {
    v7 = (void *)[v5 metadata];
  }

  return v7;
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5
{
  v7 = (void *)[objc_alloc((Class)a1) initWithPersistentStoreCoordinator:0 configurationName:0 URL:a4 options:0];
  [v7 setMetadata:a3];
  v8 = objc_alloc_init(NSSaveChangesRequest);
  uint64_t v9 = [v7 executeRequest:v8 withContext:0 error:a5];

  return v9 != 0;
}

- (void)dealloc
{
  self->_storeMetadata = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSIncrementalStore;
  [(NSPersistentStore *)&v3 dealloc];
}

- (id)metadata
{
  storeMetadata = self->_storeMetadata;
  if (storeMetadata)
  {
    id v4 = [(NSDictionary *)storeMetadata objectForKey:@"_NSMetadataLastIdentifier"];
    unint64_t lastIdentifier = self->_lastIdentifier;
    if (lastIdentifier != [v4 unsignedLongValue])
    {
      id v6 = (id)[(NSDictionary *)self->_storeMetadata mutableCopy];
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_lastIdentifier), @"_NSMetadataLastIdentifier");

      v7 = (NSDictionary *)[v6 copy];
LABEL_7:
      self->_storeMetadata = v7;
    }
  }
  else
  {
    v12 = 0;
    if (![(NSIncrementalStore *)self loadMetadata:&v12])
    {
      uint64_t v9 = v12;
      if (v12)
      {
        v10 = (__CFString *)*MEMORY[0x1E4F28A50];
      }
      else
      {
        uint64_t v9 = @"Unknown failure";
        v10 = @"Reason";
      }
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v9 forKey:v10];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Failed to load metadata" userInfo:v11]);
    }
    if (!self->_storeMetadata)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend((id)objc_opt_class(), "identifierForNewStoreAtURL:", -[NSPersistentStore URL](self, "URL")), @"NSStoreUUID");
      self->_unint64_t lastIdentifier = 0;
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", 0), @"_NSMetadataLastIdentifier");
      v7 = (NSDictionary *)[(NSPersistentStore *)self _updatedMetadataWithSeed:v6 includeVersioning:1];
      goto LABEL_7;
    }
  }
  return self->_storeMetadata;
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)loadMetadata:(NSError *)error
{
  return 0;
}

- (NSArray)obtainPermanentIDsForObjects:(NSArray *)array error:(NSError *)error
{
  NSUInteger v7 = [(NSArray *)array count];
  if (__CFADD__(v7, self->_lastIdentifier))
  {
    v8 = 0;
    if (error) {
      *error = (NSError *)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Keyspace exhausted", @"Problem"));
    }
  }
  else
  {
    NSUInteger v9 = v7;
    v8 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
    if (v9)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        uint64_t v11 = objc_msgSend(-[NSArray objectAtIndex:](array, "objectAtIndex:", i), "entity");
        v12 = NSNumber;
        ++self->_lastIdentifier;
        v13 = -[NSIncrementalStore newObjectIDForEntity:referenceObject:](self, "newObjectIDForEntity:referenceObject:", v11, objc_msgSend(v12, "numberWithUnsignedLongLong:"));
        [(NSArray *)v8 addObject:v13];
      }
    }
  }
  return v8;
}

- (BOOL)_prepareForExecuteRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend((id)objc_msgSend(a3, "insertedObjects"), "count")) {
    return 1;
  }
  id v28 = 0;
  id v23 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  NSUInteger v9 = objc_msgSend((id)objc_msgSend(a3, "insertedObjects"), "allObjects");
  v10 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v15, "objectID"), "isTemporaryID")) {
          [v10 addObject:v15];
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v12);
  }
  v16 = [(NSIncrementalStore *)self obtainPermanentIDsForObjects:v10 error:&v28];
  BOOL v17 = v16 != 0;
  if (v16)
  {
    v18 = (void *)-[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:]((uint64_t)a4, v10, v16);
    if (v18) {
      -[NSSaveChangesRequest _addChangedObjectIDsNotification:]((uint64_t)a3, (uint64_t)v18);
    }
  }
  id v19 = v28;
  [v23 drain];
  id v20 = v28;
  if (v28)
  {
    if (a5) {
      *a5 = v28;
    }
    id v21 = v20;
  }
  return v17;
}

- (NSIncrementalStoreNode)newValuesForObjectWithID:(NSManagedObjectID *)objectID withContext:(NSManagedObjectContext *)context error:(NSError *)error
{
  return 0;
}

- (id)newValueForRelationship:(NSRelationshipDescription *)relationship forObjectWithID:(NSManagedObjectID *)objectID withContext:(NSManagedObjectContext *)context error:(NSError *)error
{
  return 0;
}

- (id)executeRequest:(NSPersistentStoreRequest *)request withContext:(NSManagedObjectContext *)context error:(NSError *)error
{
  return 0;
}

- (NSManagedObjectID)newObjectIDForEntity:(NSEntityDescription *)entity referenceObject:(id)data
{
  id v5 = objc_alloc((Class)[(NSPersistentStore *)self objectIDFactoryForEntity:entity]);

  return (NSManagedObjectID *)[v5 initWithObject:data];
}

- (id)referenceObjectForObjectID:(NSManagedObjectID *)objectID
{
  if ((NSIncrementalStore *)[(NSManagedObjectID *)objectID persistentStore] != self) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot retrieve referenceObject from an objectID that was not created by this store" userInfo:0]);
  }

  return [(NSManagedObjectID *)objectID _referenceData];
}

- (id)_rawMetadata__
{
  return self->_storeMetadata;
}

- (void)_setMetadata:(id)a3 includeVersioning:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(NSDictionary *)self->_storeMetadata objectForKey:@"_NSMetadataLastIdentifier"];
  if (self->_storeMetadata != a3 || (unint64_t v8 = self->_lastIdentifier, v8 != [v7 unsignedLongValue]))
  {
    NSUInteger v9 = (void *)[a3 mutableCopy];
    v10 = (void *)[v9 objectForKey:@"_NSMetadataLastIdentifier"];
    if (v10)
    {
      unint64_t lastIdentifier = self->_lastIdentifier;
      if (lastIdentifier > [v10 unsignedLongValue]) {
        objc_msgSend(v9, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_lastIdentifier), @"_NSMetadataLastIdentifier");
      }
    }
    id v12 = [(NSPersistentStore *)self _updatedMetadataWithSeed:v9 includeVersioning:v4];

    v13.receiver = self;
    v13.super_class = (Class)NSIncrementalStore;
    [(NSPersistentStore *)&v13 setMetadata:v12];

    self->_storeMetadata = (NSDictionary *)v12;
  }
}

- (id)_newObjectIDForEntityDescription:(id)a3 pk:(int64_t)a4
{
  return 0;
}

@end