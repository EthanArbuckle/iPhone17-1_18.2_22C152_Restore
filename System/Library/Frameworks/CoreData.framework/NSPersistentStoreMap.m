@interface NSPersistentStoreMap
+ (void)initialize;
- (NSPersistentStoreMap)initWithStore:(id)a3;
- (id)_updatedMetadataWithSeed:(int)a3 includeVersioning:;
- (id)configurationName;
- (id)dataForKey:(id)a3;
- (id)handleFetchRequest:(id)a3;
- (id)retainedObjectIDsForRelationship:(id)a3 forObjectID:(id)a4;
- (uint64_t)_setMetadata:(uint64_t)result;
- (uint64_t)databaseUUID;
- (unint64_t)nextPK64;
- (void)addObject:(id)a3 objectIDMap:(id)a4;
- (void)dealloc;
- (void)removeObject:(id)a3 objectIDMap:(id)a4;
- (void)setMetadata:(void *)result;
- (void)updateObject:(id)a3 objectIDMap:(id)a4;
@end

@implementation NSPersistentStoreMap

+ (void)initialize
{
}

- (NSPersistentStoreMap)initWithStore:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NSPersistentStoreMap;
  v4 = [(NSPersistentStoreMap *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_store = (NSMappedObjectStore *)a3;
    id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    v7 = +[NSStoreMappingGenerator defaultMappingGenerator]();
    if ([(NSPersistentStoreMap *)v5 configurationName]) {
      v8 = [(NSPersistentStoreMap *)v5 configurationName];
    }
    else {
      v8 = @"PF_DEFAULT_CONFIGURATION_NAME";
    }
    v5->_mappings = (NSDictionary *)-[NSStoreMappingGenerator mappingsDictForConfigurationWithName:inModel:]((uint64_t)v7, (uint64_t)v8, objc_msgSend((id)objc_msgSend(a3, "_persistentStoreCoordinator"), "managedObjectModel"));
    [v6 drain];
  }
  return v5;
}

- (void)dealloc
{
  self->_store = 0;

  self->_databaseUUID = 0;
  self->_storeMetadata = 0;

  self->_mappings = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentStoreMap;
  [(NSPersistentStoreMap *)&v3 dealloc];
}

- (id)configurationName
{
  return [(NSPersistentStore *)self->_store configurationName];
}

- (id)dataForKey:(id)a3
{
  return 0;
}

- (void)addObject:(id)a3 objectIDMap:(id)a4
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)removeObject:(id)a3 objectIDMap:(id)a4
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)updateObject:(id)a3 objectIDMap:(id)a4
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (id)handleFetchRequest:(id)a3
{
  return 0;
}

- (id)retainedObjectIDsForRelationship:(id)a3 forObjectID:(id)a4
{
  return 0;
}

- (unint64_t)nextPK64
{
  objc_sync_enter(self);
  unint64_t v3 = self->_nextPK64 + 1;
  self->_nextPK64 = v3;
  objc_sync_exit(self);
  return v3;
}

- (uint64_t)databaseUUID
{
  if (result)
  {
    uint64_t v1 = result;
    result = *(void *)(result + 16);
    if (!result)
    {
      result = [(__CFString *)+[_PFRoutines _getUUID]() copy];
      *(void *)(v1 + 16) = result;
    }
  }
  return result;
}

- (id)_updatedMetadataWithSeed:(int)a3 includeVersioning:
{
  if (!result) {
    return result;
  }
  id v5 = result;
  id v6 = (void *)[a2 mutableCopy];
  if (!v6) {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
  }
  uint64_t v7 = [*((id *)v5 + 1) type];
  if (!v7) {
    uint64_t v7 = [a2 objectForKey:@"NSStoreType"];
  }
  [v6 setObject:v7 forKey:@"NSStoreType"];
  v8 = (__CFString *)[a2 objectForKey:@"NSStoreUUID"];
  if (!v8)
  {
    v8 = (__CFString *)*((void *)v5 + 2);
    if (!v8)
    {
      v8 = (__CFString *)[(__CFString *)+[_PFRoutines _getUUID]() copy];
      *((void *)v5 + 2) = v8;
      if (!v8) {
        v8 = +[_PFRoutines _getUUID]();
      }
    }
  }
  [v6 setObject:v8 forKey:@"NSStoreUUID"];
  if (a3)
  {
    [v6 setValue:+[_PFRoutines _getPFBundleVersionNumber]() forKey:0x1ED796A20];
    v9 = (void *)[*((id *)v5 + 1) _persistentStoreCoordinator];
    if (v9)
    {
      objc_super v10 = (void *)[v9 managedObjectModel];
      v11 = (void *)[v10 entityVersionHashesByName];
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", 3), 0x1ED796A00);
      [v6 setObject:v11 forKey:@"NSStoreModelVersionHashes"];
      if (v10) {
        uint64_t v12 = objc_msgSend((id)objc_msgSend(v10, "versionIdentifiers"), "allObjects");
      }
      else {
        uint64_t v12 = 0;
      }
      [v6 setObject:v12 forKey:@"NSStoreModelVersionIdentifiers"];
      objc_msgSend(v6, "setObject:forKey:", -[NSManagedObjectModel _entityVersionHashesDigestFrom:](v10, v11), 0x1ED796400);
      uint64_t v13 = [v10 versionChecksum];
      v14 = v6;
    }
    else
    {
      if (![v6 objectForKey:0x1ED796A00]) {
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(*((id *)v5 + 3), "objectForKey:", 0x1ED796A00), 0x1ED796A00);
      }
      if (![v6 objectForKey:@"NSStoreModelVersionHashes"]) {
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(*((id *)v5 + 3), "objectForKey:", @"NSStoreModelVersionHashes"), @"NSStoreModelVersionHashes");
      }
      if (![v6 objectForKey:0x1ED796400]) {
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(*((id *)v5 + 3), "objectForKey:", 0x1ED796400), 0x1ED796400);
      }
      if (![v6 objectForKey:@"NSStoreModelVersionIdentifiers"]) {
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(*((id *)v5 + 3), "objectForKey:", @"NSStoreModelVersionIdentifiers"), @"NSStoreModelVersionIdentifiers");
      }
      if ([v6 objectForKey:@"NSStoreModelVersionChecksumKey"]) {
        goto LABEL_25;
      }
      uint64_t v13 = [*((id *)v5 + 3) objectForKey:@"NSStoreModelVersionChecksumKey"];
      v14 = v6;
    }
    [v14 setObject:v13 forKey:@"NSStoreModelVersionChecksumKey"];
  }
LABEL_25:

  return v6;
}

- (uint64_t)_setMetadata:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    result = [a2 isEqual:*(void *)(result + 24)];
    if ((result & 1) == 0)
    {
      v4 = (void *)[a2 objectForKey:@"NSStoreUUID"];
      if (v4)
      {
        if (*(void **)(v3 + 16) != v4)
        {
          uint64_t v5 = [v4 copy];

          *(void *)(v3 + 16) = v5;
        }
      }

      result = a2;
      *(void *)(v3 + 24) = result;
    }
  }
  return result;
}

- (void)setMetadata:(void *)result
{
  if (result)
  {
    uint64_t v2 = (uint64_t)result;
    id v3 = -[NSPersistentStoreMap _updatedMetadataWithSeed:includeVersioning:](result, a2, 1);
    return (void *)-[NSPersistentStoreMap _setMetadata:](v2, v3);
  }
  return result;
}

@end