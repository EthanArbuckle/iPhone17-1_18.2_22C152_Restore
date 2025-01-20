@interface NSAtomicStore
+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4;
+ (void)initialize;
- (BOOL)load:(NSError *)error;
- (BOOL)save:(NSError *)error;
- (NSAtomicStore)init;
- (NSAtomicStore)initWithPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)coordinator configurationName:(NSString *)configurationName URL:(NSURL *)url options:(NSDictionary *)options;
- (NSAtomicStoreCacheNode)cacheNodeForObjectID:(NSManagedObjectID *)objectID;
- (NSAtomicStoreCacheNode)newCacheNodeForManagedObject:(NSManagedObject *)managedObject;
- (NSManagedObjectID)objectIDForEntity:(NSEntityDescription *)entity referenceObject:(id)data;
- (NSSet)cacheNodes;
- (id)_rawMetadata__;
- (id)executeFetchRequest:(void *)a3 withContext:;
- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)metadata;
- (id)newReferenceObjectForManagedObject:(NSManagedObject *)managedObject;
- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4;
- (id)referenceObjectForObjectID:(NSManagedObjectID *)objectID;
- (uint64_t)_insertNodeIntoEntityCache:(uint64_t)a1;
- (void)_didLoadMetadata;
- (void)_getNewIDForObject:(void *)result;
- (void)_retrieveNodesSatisfyingRequest:(uint64_t)a1;
- (void)addCacheNodes:(NSSet *)cacheNodes;
- (void)dealloc;
- (void)setMetadata:(id)a3;
- (void)updateCacheNode:(NSAtomicStoreCacheNode *)node fromManagedObject:(NSManagedObject *)managedObject;
@end

@implementation NSAtomicStore

+ (void)initialize
{
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4
{
}

- (NSAtomicStore)init
{
}

- (NSAtomicStore)initWithPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)coordinator configurationName:(NSString *)configurationName URL:(NSURL *)url options:(NSDictionary *)options
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v7 = [(NSPersistentStoreCoordinator *)coordinator managedObjectModel];
  uint64_t v8 = [(NSManagedObjectModel *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              if ([v17 _isAttribute]
                && [v17 attributeType] == 1000
                && [v17 isFileBackedFuture])
              {

                objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Atomic stores do not support file backed futures" userInfo:0]);
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v14);
        }
      }
      uint64_t v9 = [(NSManagedObjectModel *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }
  v24.receiver = self;
  v24.super_class = (Class)NSAtomicStore;
  v18 = [(NSPersistentStore *)&v24 initWithPersistentStoreCoordinator:coordinator configurationName:configurationName URL:url options:options];
  if (v18)
  {
    v18->_nodeCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v18->_entityCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v18;
}

- (void)dealloc
{
  self->_nodeCache = 0;
  self->_entityCache = 0;

  self->_storeMetadata = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSAtomicStore;
  [(NSPersistentStore *)&v3 dealloc];
}

- (BOOL)save:(NSError *)error
{
}

- (BOOL)load:(NSError *)error
{
}

- (void)addCacheNodes:(NSSet *)cacheNodes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithArray:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator"), "managedObjectModel"), "entitiesForConfiguration:", -[NSPersistentStore configurationName](self, "configurationName")), "valueForKey:", @"name"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(NSSet *)cacheNodes countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(cacheNodes);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v5, "containsObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectID"), "entity"), "name")) & 1) == 0)
        {

          objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Store %@ cannot hold instances of entity %@", self, objc_msgSend((id)objc_msgSend(v10, "objectID"), "entity")), 0 reason userInfo]);
        }
        if (self)
        {
          -[NSMutableDictionary setObject:forKey:](self->_nodeCache, "setObject:forKey:", v10, [v10 objectID]);
          -[NSAtomicStore _insertNodeIntoEntityCache:]((uint64_t)self, v10);
        }
      }
      uint64_t v7 = [(NSSet *)cacheNodes countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (NSSet)cacheNodes
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(NSMutableDictionary *)self->_nodeCache allValues];

  return (NSSet *)[v2 setWithArray:v3];
}

- (NSAtomicStoreCacheNode)cacheNodeForObjectID:(NSManagedObjectID *)objectID
{
  return (NSAtomicStoreCacheNode *)[(NSMutableDictionary *)self->_nodeCache objectForKey:objectID];
}

- (NSAtomicStoreCacheNode)newCacheNodeForManagedObject:(NSManagedObject *)managedObject
{
}

- (void)updateCacheNode:(NSAtomicStoreCacheNode *)node fromManagedObject:(NSManagedObject *)managedObject
{
}

- (id)newReferenceObjectForManagedObject:(NSManagedObject *)managedObject
{
  objc_sync_enter(self);
  int64_t v4 = self->_nextReference + 1;
  self->_nextReference = v4;
  objc_sync_exit(self);
  id v5 = objc_alloc(NSNumber);

  return (id)[v5 initWithInteger:v4];
}

- (NSManagedObjectID)objectIDForEntity:(NSEntityDescription *)entity referenceObject:(id)data
{
  result = (NSManagedObjectID *)objc_msgSend(objc_alloc((Class)-[NSPersistentStore objectIDFactoryForEntity:](self, "objectIDFactoryForEntity:", entity)), "initWithObject:", data);
  if (BYTE1(z9dsptsiQ80etb9782fsrs98bfdle88))
  {
    return result;
  }
  return result;
}

- (id)referenceObjectForObjectID:(NSManagedObjectID *)objectID
{
  if (!objectID) {
    return 0;
  }
  if ((NSAtomicStore *)[(NSManagedObjectID *)objectID persistentStore] != self) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot retrieve referenceObject from an objectID that was not created by this store" userInfo:0]);
  }

  return [(NSManagedObjectID *)objectID _referenceData];
}

- (id)_rawMetadata__
{
  return self->_storeMetadata;
}

- (id)metadata
{
  id result = self->_storeMetadata;
  if (!result)
  {
    id result = (id)[MEMORY[0x1E4F1CA60] dictionaryWithObject:+[_PFRoutines _getUUID]() forKey:@"NSStoreUUID"];
    self->_storeMetadata = (NSMutableDictionary *)result;
  }
  return result;
}

- (void)setMetadata:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSAtomicStore;
  -[NSPersistentStore setMetadata:](&v6, sel_setMetadata_);
  if (([a3 isEqual:self->_storeMetadata] & 1) == 0)
  {
    id v5 = [(NSPersistentStore *)self _updatedMetadataWithSeed:a3 includeVersioning:1];

    self->_storeMetadata = (NSMutableDictionary *)v5;
  }
}

- (uint64_t)_insertNodeIntoEntityCache:(uint64_t)a1
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "objectID"), "entity");
  if (v4)
  {
    if ((*(unsigned char *)(v4 + 120) & 4) != 0)
    {
      id v5 = *(void **)(v4 + 72);
    }
    else
    {
      do
      {
        id v5 = (void *)v4;
        uint64_t v4 = [(id)v4 superentity];
      }
      while (v4);
    }
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = [v5 name];
  id v7 = (id)[*(id *)(a1 + 112) objectForKey:v6];
  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [*(id *)(a1 + 112) setObject:v7 forKey:v6];
  }

  return [v7 addObject:a2];
}

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  if (!a3) {
LABEL_93:
  }
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Unknown command type %@", a4, a5, a3), 0 reason userInfo]);
  switch([a3 requestType])
  {
    case 1:
      if ([a3 resultType] == 4) {
        goto LABEL_4;
      }
      return -[NSAtomicStore executeFetchRequest:withContext:]((uint64_t)self, a3, (void **)a4);
    case 2:
      if (!self) {
        return 0;
      }
      if (-[NSSaveChangesRequest hasChanges]((BOOL)a3)
        || (unsigned __int8 v14 = atomic_load((unsigned __int8 *)&self->super._isMetadataDirty), (v14 & 1) != 0))
      {
        obuint64_t j = a3;
        uint64_t v15 = (void *)[a3 insertedObjects];
        uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
        v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
        long long v99 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        uint64_t v18 = [v15 countByEnumeratingWithState:&v99 objects:v107 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v100;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v100 != v20) {
                objc_enumerationMutation(v15);
              }
              v22 = *(void **)(*((void *)&v99 + 1) + 8 * i);
              if (objc_msgSend((id)objc_msgSend(v22, "objectID"), "isTemporaryID"))
              {
                v23 = -[NSAtomicStore _getNewIDForObject:](self, v22);
                [v16 addObject:v22];
                [v17 addObject:v23];
              }
            }
            uint64_t v19 = [v15 countByEnumeratingWithState:&v99 objects:v107 count:16];
          }
          while (v19);
        }
        if ([v16 count])
        {
          objc_super v24 = (void *)-[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:]((uint64_t)a4, v16, v17);
          if (v24) {
            -[NSSaveChangesRequest _addChangedObjectIDsNotification:]((uint64_t)obj, (uint64_t)v24);
          }
        }
        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        uint64_t v25 = [v15 countByEnumeratingWithState:&v95 objects:v106 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v96;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v96 != v27) {
                objc_enumerationMutation(v15);
              }
              if (*(void *)(*((void *)&v95 + 1) + 8 * j))
              {
                long long v29 = -[NSAtomicStore newCacheNodeForManagedObject:](self, "newCacheNodeForManagedObject:");
                [(NSMutableDictionary *)self->_nodeCache setObject:v29 forKey:[(NSAtomicStoreCacheNode *)v29 objectID]];
                -[NSAtomicStore _insertNodeIntoEntityCache:]((uint64_t)self, v29);
              }
            }
            uint64_t v26 = [v15 countByEnumeratingWithState:&v95 objects:v106 count:16];
          }
          while (v26);
        }
        long long v30 = (void *)[obj deletedObjects];
        id v31 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v91 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        uint64_t v32 = [v30 countByEnumeratingWithState:&v91 objects:v105 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v92;
          do
          {
            for (uint64_t k = 0; k != v33; ++k)
            {
              if (*(void *)v92 != v34) {
                objc_enumerationMutation(v30);
              }
              v36 = *(void **)(*((void *)&v91 + 1) + 8 * k);
              if (-[NSMutableDictionary objectForKey:](self->_nodeCache, "objectForKey:", [v36 objectID]))
              {
                objc_msgSend(v31, "addObject:", -[NSMutableDictionary objectForKey:](self->_nodeCache, "objectForKey:", objc_msgSend(v36, "objectID")));
              }
            }
            uint64_t v33 = [v30 countByEnumeratingWithState:&v91 objects:v105 count:16];
          }
          while (v33);
        }
        [(NSAtomicStore *)self willRemoveCacheNodes:v31];

        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        uint64_t v37 = [v30 countByEnumeratingWithState:&v87 objects:v104 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v88;
          do
          {
            uint64_t v40 = 0;
            do
            {
              if (*(void *)v88 != v39) {
                objc_enumerationMutation(v30);
              }
              v41 = *(void **)(*((void *)&v87 + 1) + 8 * v40);
              if (v41)
              {
                v42 = (void *)-[NSMutableDictionary objectForKey:](self->_nodeCache, "objectForKey:", [v41 objectID]);
                uint64_t v43 = [v42 objectID];
                if (v43) {
                  [(NSMutableDictionary *)self->_nodeCache removeObjectForKey:v43];
                }
                uint64_t v44 = objc_msgSend((id)objc_msgSend(v42, "objectID"), "entity");
                if (v44)
                {
                  if ((*(unsigned char *)(v44 + 120) & 4) != 0)
                  {
                    v45 = *(void **)(v44 + 72);
                  }
                  else
                  {
                    do
                    {
                      v45 = (void *)v44;
                      uint64_t v44 = [(id)v44 superentity];
                    }
                    while (v44);
                  }
                }
                else
                {
                  v45 = 0;
                }
                uint64_t v46 = [v45 name];
                if (v46)
                {
                  uint64_t v47 = v46;
                  v48 = (void *)[(NSMutableDictionary *)self->_entityCache objectForKey:v46];
                  if (v48)
                  {
                    v49 = v48;
                    [v48 removeObject:v42];
                    if (![v49 count]) {
                      [(NSMutableDictionary *)self->_entityCache removeObjectForKey:v47];
                    }
                  }
                }
              }
              ++v40;
            }
            while (v40 != v38);
            uint64_t v50 = [v30 countByEnumeratingWithState:&v87 objects:v104 count:16];
            uint64_t v38 = v50;
          }
          while (v50);
        }
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        id obja = (id)[obj updatedObjects];
        uint64_t v51 = [obja countByEnumeratingWithState:&v83 objects:v103 count:16];
        if (v51)
        {
          uint64_t v52 = v51;
          uint64_t v53 = *(void *)v84;
          do
          {
            for (uint64_t m = 0; m != v52; ++m)
            {
              if (*(void *)v84 != v53) {
                objc_enumerationMutation(obja);
              }
              v55 = *(id ***)(*((void *)&v83 + 1) + 8 * m);
              if (v55)
              {
                v56 = (void *)[*(id *)(*((void *)&v83 + 1) + 8 * m) entity];
                if (v56) {
                  v57 = (void *)v56[14];
                }
                else {
                  v57 = 0;
                }
                uint64_t v62 = _kvcPropertysPrimitiveGetters(v56);
                unint64_t v64 = v57[18];
                uint64_t v63 = v57[19];
                if (v64 < v63 + v64)
                {
                  do
                  {
                    _PF_Handler_Primitive_GetProperty(v55, v64, 0, *(void *)(v62 + 8 * v64), v58, v59, v60, v61);
                    [v65 count];
                    ++v64;
                    --v63;
                  }
                  while (v63);
                }
                unint64_t v67 = v57[26];
                uint64_t v66 = v57[27];
                if (v67 < v66 + v67)
                {
                  do
                  {
                    _PF_Handler_Primitive_GetProperty(v55, v67, 0, *(void *)(v62 + 8 * v67), v58, v59, v60, v61);
                    [v68 count];
                    ++v67;
                    --v66;
                  }
                  while (v66);
                }
                v69 = (void *)-[NSMutableDictionary objectForKey:](self->_nodeCache, "objectForKey:", [v55 objectID]);
                [(NSAtomicStore *)self updateCacheNode:v69 fromManagedObject:v55];
                objc_msgSend(v69, "_setVersionNumber:", objc_msgSend(v69, "_versionNumber") + 1);
              }
            }
            uint64_t v52 = [obja countByEnumeratingWithState:&v83 objects:v103 count:16];
          }
          while (v52);
        }
        id v82 = 0;
        id v70 = [(NSAtomicStore *)self metadata];
        if (objc_msgSend((id)objc_msgSend(v70, "objectForKey:", 0x1ED796A40), "integerValue") != self->_nextReference)
        {
          uint64_t v71 = objc_msgSend(NSNumber, "numberWithInteger:");
          v72 = (void *)[v70 mutableCopy];
          [v72 setObject:v71 forKey:0x1ED796A40];
          [(NSAtomicStore *)self setMetadata:v72];
        }
        if (![(NSAtomicStore *)self save:&v82])
        {
          if (v82)
          {
            uint64_t v78 = [v82 code];
            if (v82) {
              v77 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"NSCoreDataPrimaryError", 0);
            }
            else {
              v77 = 0;
            }
          }
          else
          {
            v77 = 0;
            uint64_t v78 = 134030;
          }
          id v79 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3A8], v78, @"Error saving the persistent store.", v77);
          objc_exception_throw(v79);
        }
        [(NSPersistentStore *)self _setMetadataDirty:0];
      }
      return (id)NSArray_EmptyArray;
    case 3:
LABEL_4:
      if (!self) {
        return 0;
      }
      id v9 = (id)[a3 copy];
      objc_msgSend(v9, "setPredicate:", -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:](+[_NSMemoryStorePredicateRemapper defaultInstance](_NSMemoryStorePredicateRemapper, "defaultInstance"), "createPredicateForFetchFromPredicate:", objc_msgSend(v9, "predicate")));
      uint64_t v10 = objc_msgSend(-[NSAtomicStore _retrieveNodesSatisfyingRequest:]((uint64_t)self, v9), "count");
      long long v11 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v12 = [NSNumber numberWithUnsignedLong:v10];
      return (id)[v11 arrayWithObject:v12];
    case 8:
      if (!a5) {
        return 0;
      }
      v73 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v74 = *MEMORY[0x1E4F281F8];
      v75 = &unk_1ED7E1808;
      goto LABEL_88;
    case 10:
      if (!a5) {
        return 0;
      }
      v73 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v74 = *MEMORY[0x1E4F281F8];
      v75 = &unk_1ED7E1830;
LABEL_88:
      id v76 = (id)[v73 errorWithDomain:v74 code:134091 userInfo:v75];
      id result = 0;
      *a5 = v76;
      return result;
    default:
      goto LABEL_93;
  }
}

- (id)executeFetchRequest:(void *)a3 withContext:
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  uint64_t v75 = a1;
  if (!a1) {
    return 0;
  }
  uint64_t v4 = a2;
  if ([a2 propertiesToGroupBy]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unsupported fetch request: store %@ does not support GROUP BY", v75), 0 reason userInfo]);
  }
  id v5 = -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:](+[_NSMemoryStorePredicateRemapper defaultInstance](_NSMemoryStorePredicateRemapper, "defaultInstance"), "createPredicateForFetchFromPredicate:", [v4 predicate]);
  uint64_t v6 = *(void *)(v75 + 48);
  id v7 = (id)[v4 copy];
  [v7 setPredicate:v5];
  id v8 = -[NSAtomicStore _retrieveNodesSatisfyingRequest:](v75, v7);
  uint64_t v9 = [v4 resultType];
  uint64_t v10 = [v4 resultType];
  char v11 = [v4 includesPropertyValues];
  char v12 = [v4 returnsObjectsAsFaults];
  uint64_t v13 = [v8 count];
  unint64_t v14 = v13;
  unint64_t v66 = v13;
  if (!v9)
  {
    id v65 = &v63;
    MEMORY[0x1F4188790](v13);
    uint64_t v20 = (char *)&v63 - v19;
    if (v14 >= 0x201)
    {
      uint64_t v20 = (char *)NSAllocateScannedUncollectable();
      objc_msgSend(v8, "getObjects:range:", v20, 0, v14);
    }
    else
    {
      bzero((char *)&v63 - v19, 8 * v18);
      objc_msgSend(v8, "getObjects:range:", v20, 0, v14);
      if (!v14)
      {
        char v21 = 1;
LABEL_18:
        id v8 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:v20 count:v14];
        if ((v21 & 1) == 0)
        {
          uint64_t v27 = (void **)v20;
          unint64_t v28 = v14;
          do
          {
            long long v29 = *v27++;

            --v28;
          }
          while (v28);
        }
        if (v14 >= 0x201) {
          NSZoneFree(0, v20);
        }
        goto LABEL_72;
      }
    }
    uint64_t v22 = 0;
    char v23 = v11 ^ 1 | v12;
    do
    {
      objc_super v24 = *(void **)&v20[8 * v22];
      uint64_t v25 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](a3, v24, v6);
      if ((v23 & 1) == 0)
      {
        uint64_t v26 = (void *)[*(id *)(v75 + 104) objectForKey:v24];
        if (v25) {
          v25[4] |= 0x200u;
        }
        _PFFaultHandlerFulfillFault(v6, (uint64_t)v25, (uint64_t)a3, v26, 1);
      }
      *(void *)&v20[8 * v22++] = v25;
    }
    while (v66 != v22);
    char v21 = 0;
    unint64_t v14 = v66;
    goto LABEL_18;
  }
  if (v10 != 2) {
    goto LABEL_72;
  }
  id v65 = &v63;
  MEMORY[0x1F4188790](v13);
  v17 = (char *)&v63 - v16;
  if (v14 > 0x200) {
    v17 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v63 - v16, 8 * v15);
  }
  objc_msgSend(v8, "getObjects:range:", v17, 0, v14);
  id v30 = (id)[v4 propertiesToFetch];
  if (!v30)
  {
    id v31 = (void *)[v4 entity];
    if (v31) {
      uint64_t v32 = v31[14];
    }
    else {
      uint64_t v32 = 0;
    }
    uint64_t v33 = objc_msgSend((id)objc_msgSend(v31, "propertiesByName"), "values");
    id v30 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v33 + 8 * *(void *)(v32 + 48) count:*(void *)(v32 + 56) + *(void *)(v32 + 48)];
  }
  uint64_t v34 = [v30 count];
  unint64_t v35 = MEMORY[0x1F4188790](v34);
  uint64_t v37 = (char *)&v63 - v36;
  size_t v39 = 8 * v38;
  unint64_t v64 = v35;
  if (v35 > 0x200)
  {
    uint64_t v37 = (char *)NSAllocateScannedUncollectable();
    v69 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    bzero((char *)&v63 - v36, v39);
    MEMORY[0x1F4188790](v40);
    v69 = (char *)&v63 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v69, v39);
  }
  id v72 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v71 = objc_opt_class();
  if (!v14)
  {
    id v8 = (id)[MEMORY[0x1E4F1CA48] arrayWithObjects:v17 count:0];
    goto LABEL_69;
  }
  uint64_t v63 = v4;
  uint64_t v76 = 0;
  id v41 = 0;
  unint64_t v67 = v37;
  id v74 = v30;
  do
  {
    long long v79 = 0u;
    long long v80 = 0u;
    long long v78 = 0u;
    long long v77 = 0u;
    uint64_t v42 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v77, v81, 16, v63);
    if (!v42) {
      goto LABEL_60;
    }
    uint64_t v43 = 0;
    uint64_t v44 = *(void *)v78;
    do
    {
      uint64_t v45 = 0;
      uint64_t v70 = (int)v43;
      uint64_t v46 = &v69[8 * (int)v43];
      uint64_t v68 = v43;
      v73 = &v37[8 * (int)v43];
      do
      {
        id v47 = v41;
        if (*(void *)v78 != v44) {
          objc_enumerationMutation(v74);
        }
        v48 = *(void **)(*((void *)&v77 + 1) + 8 * v45);
        v49 = v17;
        uint64_t v50 = (void *)[*(id *)(v75 + 104) objectForKey:*(void *)&v17[8 * v76]];
        uint64_t v51 = [v48 _propertyType];
        uint64_t v52 = [v48 name];
        if ([v48 _isAttribute])
        {
          uint64_t v53 = [v50 valueForKey:v52];
          goto LABEL_44;
        }
        if (v51 != 5)
        {
          if (v51 == 4)
          {
            uint64_t v53 = objc_msgSend((id)objc_msgSend(v50, "valueForKey:", v52), "objectID");
LABEL_44:
            v54 = (void *)v53;
          }
          else
          {
            v54 = 0;
          }
          v17 = v49;
          id v41 = v47;
          goto LABEL_46;
        }
        v55 = (void *)[v48 expression];
        v54 = (void *)[v55 expressionValueWithObject:v50 context:v72];
        if ([v55 expressionType] == 50)
        {
          v17 = v49;
          if (([v55 isCountOnlyRequest] & 1) != 0
            || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v55, "requestExpression"), "expressionValueWithObject:context:", 0, 0), "resultType") == 4)
          {
            v54 = (void *)[v54 lastObject];
          }
        }
        else
        {
          v17 = v49;
        }
        id v41 = v47;
        if (objc_opt_isKindOfClass()) {
          v54 = (void *)[v54 objectID];
        }
LABEL_46:
        if (!v41) {
          *(void *)&v73[8 * v45] = v52;
        }
        *(void *)&v46[8 * v45++] = v54;
      }
      while (v42 != v45);
      id v30 = v74;
      uint64_t v56 = [v74 countByEnumeratingWithState:&v77 objects:v81 count:16];
      uint64_t v42 = v56;
      uint64_t v43 = v70 + v45;
      uint64_t v37 = v67;
    }
    while (v56);
    LODWORD(v42) = v45 + v68;
    unint64_t v14 = v66;
LABEL_60:
    if (!v41) {
      id v41 = [[NSKnownKeysMappingStrategy alloc] initForKeys:v37 count:(int)v42];
    }
    v57 = [[NSKnownKeysDictionary alloc] initWithSearchStrategy:v41];
    uint64_t v58 = v76;
    *(void *)&v17[8 * v76] = v57;
    [(NSKnownKeysDictionary *)v57 setValues:v69];
    uint64_t v76 = v58 + 1;
  }
  while (v58 + 1 != v14);
  id v8 = (id)[MEMORY[0x1E4F1CA48] arrayWithObjects:v17 count:v14];
  uint64_t v59 = 0;
  do

  while (v14 != v59);
  if (v14 >= 0x201) {
    NSZoneFree(0, v17);
  }
  uint64_t v4 = v63;
LABEL_69:
  if (v64 >= 0x201)
  {
    NSZoneFree(0, v37);
    NSZoneFree(0, v69);
  }

LABEL_72:
  unint64_t v60 = [v4 fetchOffset];
  if (v60)
  {
    if (v60 <= v14) {
      [v8 removeObjectsInRange:0];
    }
    else {
      [v8 removeAllObjects];
    }
    unint64_t v14 = [v8 count];
  }
  unint64_t v61 = [v4 fetchLimit];
  if (v61 && v14 > v61) {
    objc_msgSend(v8, "removeObjectsInRange:", v61, v14 - v61);
  }
  return v8;
}

- (void)_retrieveNodesSatisfyingRequest:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 entity];
  id v5 = (void *)v4;
  if (v4)
  {
    if ((*(unsigned char *)(v4 + 120) & 4) != 0)
    {
      uint64_t v6 = *(void **)(v4 + 72);
    }
    else
    {
      do
      {
        uint64_t v6 = (void *)v4;
        uint64_t v4 = [(id)v4 superentity];
      }
      while (v4);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(*(id *)(a1 + 112), "objectForKey:", objc_msgSend(v6, "name"));
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  uint64_t v26 = (void *)[a2 predicate];
  if (!v26) {
    uint64_t v26 = (void *)[MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  unint64_t v9 = [a2 fetchLimit];
  if ([a2 sortDescriptors]) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  int v11 = !v10;
  int v12 = objc_msgSend(a2, "includesSubentities", a2);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v13 = v7;
  uint64_t v14 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
LABEL_16:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v28 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * v17);
      uint64_t v19 = objc_msgSend((id)objc_msgSend(v18, "objectID"), "entity");
      if ((v5 == (void *)v19 || v12 && [v5 _subentitiesIncludes:v19])
        && [v26 evaluateWithObject:v18])
      {
        [v8 addObject:v18];
      }
      if (v11 && [v8 count] > v9) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v15) {
          goto LABEL_16;
        }
        break;
      }
    }
  }
  uint64_t v20 = [v25 sortDescriptors];
  if (v20) {
    [v8 sortUsingDescriptors:v20];
  }
  uint64_t v21 = [v8 count];
  if (v21)
  {
    uint64_t v22 = v21;
    for (uint64_t i = 0; i != v22; ++i)
      objc_msgSend(v8, "replaceObjectAtIndex:withObject:", i, objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", i), "objectID"));
  }
  return v8;
}

- (void)_getNewIDForObject:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)[result newReferenceObjectForManagedObject:a2];
    uint64_t v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "objectIDFactoryForEntity:", objc_msgSend(a2, "entity"))), "initWithObject:", v4);

    return (void *)v5;
  }
  return result;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  if (self)
  {
    self = (NSAtomicStore *)-[NSMutableDictionary objectForKey:](self->_nodeCache, "objectForKey:", a3, a4, a5);
    uint64_t v5 = vars8;
  }
  return self;
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self) {
    id v7 = (void *)[(NSMutableDictionary *)self->_nodeCache objectForKey:a4];
  }
  else {
    id v7 = 0;
  }
  uint64_t v8 = [a3 name];
  char v9 = [a3 isToMany];
  BOOL v10 = (void *)[v7 valueForKey:v8];
  int v11 = v10;
  if (v9)
  {
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFIndex v13 = [v10 count];
    Mutable = CFArrayCreateMutable(v12, v13, MEMORY[0x1E4F1D510]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v15 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v11);
          }
          CFArrayAppendValue(Mutable, (const void *)[*(id *)(*((void *)&v21 + 1) + 8 * v18++) objectID]);
        }
        while (v16 != v18);
        uint64_t v16 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }
    return Mutable;
  }
  else
  {
    uint64_t v20 = (void *)[v10 objectID];
    return v20;
  }
}

- (void)_didLoadMetadata
{
  uint64_t v3 = objc_msgSend(-[NSAtomicStore metadata](self, "metadata"), "objectForKey:", 0x1ED796A40);
  if (v3) {
    uint64_t v3 = (void *)[v3 integerValue];
  }
  self->_nextReference = (int64_t)v3;
}

- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3, a4);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(a3);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        CFAllocatorRef v12 = (void *)[v11 objectID];
        if ([v12 isTemporaryID])
        {
          CFIndex v13 = -[NSAtomicStore _getNewIDForObject:](self, v11);
          [v6 addObject:v13];
        }
        else
        {
          [v6 addObject:v12];
        }
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  return v6;
}

@end