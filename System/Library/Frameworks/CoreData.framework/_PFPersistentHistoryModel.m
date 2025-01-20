@interface _PFPersistentHistoryModel
+ (id)_retainedTombstonesForEntity:(uint64_t)a1;
+ (id)ancillaryModelNamespace;
+ (id)newPersistentHistoryManagedObjectModelForSQLModel:(uint64_t)a1 options:(void *)a2;
+ (id)newPersistentHistorySQLModelForSQLModel:(uint64_t)a1 options:(void *)a2;
+ (uint64_t)_hasTombstonesInUserInfo:(uint64_t)a1;
+ (uint64_t)_tombstonesColumnsForEntity:(uint64_t)a1;
+ (unint64_t)_maxCountOfTombstonesInModel:(uint64_t)a1;
+ (unint64_t)ancillaryEntityCount;
+ (unint64_t)ancillaryEntityOffset;
+ (void)_entitiesWithTooManyTombstonesInModel:(uint64_t)a1;
+ (void)_invalidateStaticCaches;
+ (void)createModelsWithTombstoneCount:(uint64_t)a1 andOptions:(uint64_t)a2;
+ (void)initialize;
+ (void)resetCaches;
@end

@implementation _PFPersistentHistoryModel

+ (id)ancillaryModelNamespace
{
  return @"PersistentHistory";
}

+ (void)createModelsWithTombstoneCount:(uint64_t)a1 andOptions:(uint64_t)a2
{
  v55[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  context = (void *)MEMORY[0x18C127630](v3);
  if (!_historyModelCache) {
    _historyModelCache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  if (!_historySQLModelCache) {
    _historySQLModelCache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v4 = objc_alloc_init(NSEntityDescription);
  v5 = objc_alloc_init(NSEntityDescription);
  v6 = objc_alloc_init(NSEntityDescription);
  id v7 = [[NSRelationshipDescription alloc] _initWithName:@"BUNDLEIDTS"];
  [v7 setDestinationEntity:v6];
  v47 = v7;
  [v7 setMaxCount:1];
  id v8 = [[NSRelationshipDescription alloc] _initWithName:@"PROCESSIDTS"];
  [v8 setDestinationEntity:v6];
  v46 = v8;
  [v8 setMaxCount:1];
  id v9 = [[NSRelationshipDescription alloc] _initWithName:@"CONTEXTNAMETS"];
  [v9 setDestinationEntity:v6];
  v45 = v9;
  [v9 setMaxCount:1];
  id v10 = [[NSRelationshipDescription alloc] _initWithName:@"AUTHORTS"];
  [v10 setDestinationEntity:v6];
  v44 = v10;
  [v10 setMaxCount:1];
  id v11 = [[NSAttributeDescription alloc] _initWithName:@"NAME" type:700];
  [(NSEntityDescription *)v6 setName:@"TRANSACTIONSTRING"];
  v55[0] = v11;
  -[NSEntityDescription setProperties:](v6, "setProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1]);
  v30 = v11;
  uint64_t v53 = [v11 name];
  uint64_t v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
  v31 = v6;
  -[NSEntityDescription setUniquenessConstraints:](v6, "setUniquenessConstraints:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1]);
  id v43 = [[NSAttributeDescription alloc] _initWithName:@"BUNDLEID" type:700];
  id v42 = [[NSAttributeDescription alloc] _initWithName:@"PROCESSID" type:700];
  id v41 = [[NSAttributeDescription alloc] _initWithName:@"CONTEXTNAME" type:700];
  id v40 = [[NSAttributeDescription alloc] _initWithName:@"AUTHOR" type:700];
  id v39 = [[NSAttributeDescription alloc] _initWithName:@"QUERYGEN" type:1000];
  id v38 = [[NSAttributeDescription alloc] _initWithName:@"TIMESTAMP" type:500];
  v34 = v4;
  [(NSEntityDescription *)v4 setName:@"TRANSACTION"];
  id v37 = [[NSAttributeDescription alloc] _initWithName:@"ENTITY" type:300];
  id v36 = [[NSAttributeDescription alloc] _initWithName:@"ENTITYPK" type:300];
  id v35 = [[NSAttributeDescription alloc] _initWithName:@"CHANGETYPE" type:100];
  id v12 = [[NSAttributeDescription alloc] _initWithName:@"COLUMNS" type:1000];
  v13 = v5;
  [(NSEntityDescription *)v5 setName:@"CHANGE"];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(int)a2];
  uint64_t v32 = a2;
  if ((int)a2 >= 1)
  {
    uint64_t v15 = 0;
    do
    {
      v16 = [NSAttributeDescription alloc];
      id v17 = -[NSAttributeDescription _initWithName:type:](v16, "_initWithName:type:", [NSString stringWithFormat:@"%@%lu", @"TOMBSTONE", v15], 1000);
      [v14 addObject:v17];

      ++v15;
    }
    while ((int)a2 != v15);
  }
  id v18 = [[NSRelationshipDescription alloc] _initWithName:@"CHANGES"];
  [v18 setDeleteRule:2];
  id v19 = [[NSRelationshipDescription alloc] _initWithName:@"TRANSACTIONID"];
  [v18 setInverseRelationship:v19];
  [v18 setDestinationEntity:v5];
  [v19 setInverseRelationship:v18];
  [v19 setDestinationEntity:v34];
  [v19 setMaxCount:1];
  [v19 setMinCount:1];
  v52[0] = v43;
  v52[1] = v42;
  v52[2] = v41;
  v52[3] = v40;
  v52[4] = v47;
  v52[5] = v46;
  v52[6] = v45;
  v52[7] = v10;
  v52[8] = v38;
  v52[9] = v39;
  v52[10] = v18;
  -[NSEntityDescription setProperties:](v34, "setProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:11]);
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v37, v36, v35, v12, 0);
  [v20 addObjectsFromArray:v14];
  [v20 addObject:v19];
  [(NSEntityDescription *)v5 setProperties:v20];
  v21 = [[NSFetchIndexElementDescription alloc] initWithProperty:v38 collationType:0];
  v22 = [NSFetchIndexDescription alloc];
  v51 = v21;
  v23 = -[NSFetchIndexDescription initWithName:elements:](v22, "initWithName:elements:", @"TransactionTimestampIndex", [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1]);
  v24 = [[NSFetchIndexElementDescription alloc] initWithProperty:v40 collationType:0];
  v25 = [NSFetchIndexDescription alloc];
  v50 = v24;
  v26 = -[NSFetchIndexDescription initWithName:elements:](v25, "initWithName:elements:", @"TransactionAuthorIndex", [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1]);
  v49[0] = v26;
  v49[1] = v23;
  -[NSEntityDescription setIndexes:](v34, "setIndexes:", [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2]);

  [(NSEntityDescription *)v34 _flattenProperties];
  [(NSEntityDescription *)v34 _createCachesAndOptimizeState];
  [(NSEntityDescription *)v13 _flattenProperties];
  [(NSEntityDescription *)v13 _createCachesAndOptimizeState];
  [(NSEntityDescription *)v31 _flattenProperties];
  [(NSEntityDescription *)v31 _createCachesAndOptimizeState];
  v48[0] = v34;
  v48[1] = v13;
  v48[2] = v31;
  id v27 = -[NSManagedObjectModel _initWithEntities:]([NSManagedObjectModel alloc], "_initWithEntities:", [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3]);
  objc_msgSend(v27, "_setModelsReferenceIDOffset:", +[_PFPersistentHistoryModel ancillaryEntityOffset](_PFPersistentHistoryModel, "ancillaryEntityOffset"));
  [v27 _setIsEditable:0];
  v28 = [[NSSQLModel alloc] initWithManagedObjectModel:v27];
  uint64_t v29 = [NSNumber numberWithInt:v32];
  [(id)_historyModelCache setObject:v27 forKey:v29];
  [(id)_historySQLModelCache setObject:v28 forKey:v29];
}

+ (id)newPersistentHistorySQLModelForSQLModel:(uint64_t)a1 options:(void *)a2
{
  self;
  unint64_t v3 = +[_PFPersistentHistoryModel _maxCountOfTombstonesInModel:]((uint64_t)_PFPersistentHistoryModel, a2);
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:v3];
  os_unfair_lock_lock_with_options();
  if (![(id)_historySQLModelCache objectForKey:v4]) {
    +[_PFPersistentHistoryModel createModelsWithTombstoneCount:andOptions:]((uint64_t)_PFPersistentHistoryModel, v3);
  }
  id v5 = (id)[(id)_historySQLModelCache objectForKey:v4];
  os_unfair_lock_unlock((os_unfair_lock_t)&_historyModelLock);
  return v5;
}

+ (id)newPersistentHistoryManagedObjectModelForSQLModel:(uint64_t)a1 options:(void *)a2
{
  self;
  unint64_t v3 = +[_PFPersistentHistoryModel _maxCountOfTombstonesInModel:]((uint64_t)_PFPersistentHistoryModel, a2);
  if (v3 >= 0x65)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"NSPersistentHistoryTrackingKey only supports a max of 100 tombstones per entity in the Model", +[_PFPersistentHistoryModel _entitiesWithTooManyTombstonesInModel:]((uint64_t)_PFPersistentHistoryModel, a2));
    objc_exception_throw(v8);
  }
  uint64_t v4 = v3;
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:v3];
  os_unfair_lock_lock_with_options();
  if (![(id)_historyModelCache objectForKey:v5]) {
    +[_PFPersistentHistoryModel createModelsWithTombstoneCount:andOptions:]((uint64_t)_PFPersistentHistoryModel, v4);
  }
  id v6 = (id)[(id)_historyModelCache objectForKey:v5];
  os_unfair_lock_unlock((os_unfair_lock_t)&_historyModelLock);
  return v6;
}

+ (unint64_t)_maxCountOfTombstonesInModel:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  if (a2) {
    a2 = (void *)a2[4];
  }
  uint64_t v3 = [a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  unint64_t v5 = 0;
  uint64_t v6 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(a2);
      }
      id v8 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]((uint64_t)_PFPersistentHistoryModel, *(void **)(*((void *)&v10 + 1) + 8 * i));
      if (objc_msgSend(v8, "count", (void)v10) > v5) {
        unint64_t v5 = [v8 count];
      }
    }
    uint64_t v4 = [a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v5;
}

+ (id)_retainedTombstonesForEntity:(uint64_t)a1
{
  uint64_t v3 = self;
  uint64_t v4 = (void *)MEMORY[0x18C127630](v3);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  while (1)
  {
    while (!a2)
      __58___PFPersistentHistoryModel__retainedTombstonesForEntity___block_invoke(0, v5);
    uint64_t v6 = a2[20];
    __58___PFPersistentHistoryModel__retainedTombstonesForEntity___block_invoke(a2, v5);
    if (!v6) {
      break;
    }
    a2 = (void *)a2[20];
  }
  id v7 = (id)[v5 array];

  return v7;
}

+ (unint64_t)ancillaryEntityOffset
{
  return 16000;
}

+ (unint64_t)ancillaryEntityCount
{
  return 3;
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    self;
  }
}

+ (void)_entitiesWithTooManyTombstonesInModel:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  if (a2) {
    a2 = (void *)a2[4];
  }
  uint64_t v4 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(a2);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]((uint64_t)_PFPersistentHistoryModel, v8);
        unint64_t v10 = objc_msgSend(v9, "count", (void)v12);
        if (v10 >= 0x65) {
          objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v10), objc_msgSend(v8, "name"));
        }
      }
      uint64_t v5 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  return v3;
}

+ (void)resetCaches
{
  self;
  os_unfair_lock_lock_with_options();

  _historySQLModelCache = 0;
  _historyModelCache = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_historyModelLock);
}

+ (void)_invalidateStaticCaches
{
}

+ (uint64_t)_hasTombstonesInUserInfo:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(a2);
        }
        id v7 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "userInfo"), "objectForKey:", @"NSPersistentHistoryTombstoneAttributes");
        if (v7)
        {
          id v8 = v7;
          if ([v7 isNSString])
          {
            if ([v8 length]) {
              return 1;
            }
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

+ (uint64_t)_tombstonesColumnsForEntity:(uint64_t)a1
{
  self;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  if (!a2) {
    goto LABEL_3;
  }
  while (*(void *)(a2 + 160))
  {
    do
    {
LABEL_3:
      __57___PFPersistentHistoryModel__tombstonesColumnsForEntity___block_invoke((id *)a2, v3);
      a2 = [(id)a2 rootEntity];
    }
    while (!a2);
  }
  __57___PFPersistentHistoryModel__tombstonesColumnsForEntity___block_invoke((id *)a2, v3);
  uint64_t v4 = [v3 array];

  return v4;
}

@end