@interface NSXPCSaveRequestContext
- (id)initForStore:(id)a3 request:(id)a4 metadata:(id)a5 forceInsertsToUpdates:(BOOL)a6 context:(id)a7;
- (id)managedObjectContext;
- (id)newEncodedSaveRequest;
- (void)_encodeObjectsForSave:(char)a3 forDelete:;
- (void)_updateRollbackCacheForObjectWithID:(void *)a3 relationship:(void *)a4 withValuesFrom:;
- (void)dealloc;
@end

@implementation NSXPCSaveRequestContext

- (id)initForStore:(id)a3 request:(id)a4 metadata:(id)a5 forceInsertsToUpdates:(BOOL)a6 context:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)NSXPCSaveRequestContext;
  v12 = [(NSXPCSaveRequestContext *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_store = (NSXPCStore *)a3;
    v12->_request = (NSSaveChangesRequest *)a4;
    v12->_context = (NSManagedObjectContext *)a7;
    v12->_metadata = (NSDictionary *)a5;
    v13->_changeCache = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a4, "updatedObjects"), "count")+ objc_msgSend((id)objc_msgSend(a4, "insertedObjects"), "count"));
    v13->_interrupts = 0;
    v13->_forceUpdates = a6;
  }
  return v13;
}

- (void)dealloc
{
  self->_request = 0;
  self->_context = 0;

  self->_metadata = 0;
  self->_changeCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSXPCSaveRequestContext;
  [(NSXPCSaveRequestContext *)&v3 dealloc];
}

- (id)managedObjectContext
{
  return self->_context;
}

- (void)_updateRollbackCacheForObjectWithID:(void *)a3 relationship:(void *)a4 withValuesFrom:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 objectForKey:a2];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = [a4 count];
    unint64_t v9 = v8;
    v21[1] = v21;
    if (v8 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v8;
    }
    if (v8 >= 0x201) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }
    v12 = (char *)v21 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v8 > 0x200) {
      v12 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v21 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v10);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
    long long v22 = 0u;
    uint64_t v13 = [a4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(a4);
          }
          *(void *)&v12[8 * v15 + 8 * i] = [*(id *)(*((void *)&v22 + 1) + 8 * i) objectID];
        }
        uint64_t v14 = [a4 countByEnumeratingWithState:&v22 objects:v26 count:16];
        v15 += i;
      }
      while (v14);
    }
    int v18 = [a3 isOrdered];
    v19 = (Class *)0x1E4F1CAA0;
    if (!v18) {
      v19 = (Class *)0x1E4F1CAD0;
    }
    v20 = (void *)[objc_alloc(*v19) initWithObjects:v12 count:v9];
    -[NSPersistentCacheRow setRelatedObjectIDs:forProperty:options:andTimestamp:]((void *)v7, v20, a3, *(double *)(v7 + 32));

    if (v9 >= 0x201) {
      NSZoneFree(0, v12);
    }
  }
}

- (void)_encodeObjectsForSave:(char)a3 forDelete:
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  v72 = (void *)[MEMORY[0x1E4F1CA48] array];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSinceReferenceDate");
  double v5 = v4;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obunint64_t j = a2;
  uint64_t v73 = [a2 countByEnumeratingWithState:&v80 objects:v84 count:16];
  if (v73)
  {
    uint64_t v70 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v73; ++i)
      {
        if (*(void *)v81 != v70) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        uint64_t v8 = [v7 objectID];
        uint64_t v76 = i;
        if ((a3 & 1) == 0)
        {
          uint64_t v9 = v8;
          uint64_t v10 = [NSIncrementalStoreNode alloc];
          uint64_t v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          v12 = (void *)[v7 entity];
          uint64_t v13 = v12;
          v77 = v10;
          if (v12) {
            uint64_t v14 = (void *)v12[14];
          }
          else {
            uint64_t v14 = 0;
          }
          uint64_t v15 = objc_msgSend((id)objc_msgSend(v12, "propertiesByName"), "values");
          uint64_t v20 = _kvcPropertysPrimitiveGetters(v13);
          uint64_t v21 = v14[7] + v14[6];
          if (v21)
          {
            for (unint64_t j = 0; j != v21; ++j)
            {
              long long v23 = *(void **)(v15 + 8 * j);
              _PF_Handler_Primitive_GetProperty((id **)v7, j, 0, *(void *)(v20 + 8 * j), v16, v17, v18, v19);
              if (v24) {
                objc_msgSend(v11, "setValue:forKey:", v24, objc_msgSend(v23, "name"));
              }
            }
          }
          unint64_t v26 = v14[12];
          uint64_t v25 = v14[13];
          if (v26 < v25 + v26)
          {
            do
            {
              uint64_t v27 = *(void **)(v15 + 8 * v26);
              _PF_Handler_Primitive_GetProperty((id **)v7, v26, 0, *(void *)(v20 + 8 * v26), v16, v17, v18, v19);
              if (v28) {
                uint64_t v29 = [v28 objectID];
              }
              else {
                uint64_t v29 = NSKeyValueCoding_NullValue;
              }
              objc_msgSend(v11, "setValue:forKey:", v29, objc_msgSend(v27, "name"));
              ++v26;
              --v25;
            }
            while (v25);
          }
          v30 = -[NSIncrementalStoreNode initWithObjectID:withValues:version:](v77, "initWithObjectID:withValues:version:", v9, v11, [v7 _versionReference] + 1);
          v31 = [[NSXPCRow alloc] initWithNode:v30];

          if (v31) {
            v31->super._birth = v5;
          }
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v31, -[NSXPCRow objectID](v31, "objectID"));

          uint64_t i = v76;
        }
        if (v7)
        {
          v32 = (void *)[MEMORY[0x1E4F1CA48] array];
          v33 = (void *)[v7 entity];
          v34 = (const void *)[v7 objectID];
          [v32 addObject:v34];
          v78 = -[_NSQueryGenerationToken _generationalComponentForStore:](objc_msgSend((id)objc_msgSend(v7, "managedObjectContext"), "_queryGenerationToken"), *(id *)(a1 + 8));
          v35 = -[NSXPCStore _cachedRowForObjectWithID:generation:](*(os_unfair_lock_s **)(a1 + 8), v34, v78);
          unsigned int v36 = [v7 _versionReference];
          objc_msgSend(v32, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v36));
          if (v33) {
            v37 = (void *)v33[14];
          }
          else {
            v37 = 0;
          }
          uint64_t v74 = objc_msgSend((id)objc_msgSend(v33, "propertiesByName"), "values");
          v75 = v37;
          unint64_t v38 = v37[6];
          uint64_t v39 = v37[7];
          v40 = objc_alloc_init(_NSNoChangeToken);
          [v32 addObject:v40];
          uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
          if (v38 < v39 + v38)
          {
            v42 = (id *)(v74 + 8 * v38);
            do
            {
              id v43 = *v42;
              v44 = objc_msgSend(v7, "primitiveValueForKey:", objc_msgSend(*v42, "name"));
              uint64_t v45 = [(os_unfair_lock_s *)v35 valueForPropertyDescription:v43];
              if (v35
                && (!v44 ? (BOOL v46 = v41 == v45) : (BOOL v46 = 0), v46 || [v44 isEqual:v45]))
              {
                v47 = v32;
                v48 = v40;
              }
              else
              {
                v47 = v32;
                if (v44) {
                  v48 = v44;
                }
                else {
                  v48 = (void *)v41;
                }
              }
              [v47 addObject:v48];
              ++v42;
              --v39;
            }
            while (v39);
          }
          unint64_t v49 = v75[12];
          uint64_t v50 = v75[13];
          if (v49 < v50 + v49)
          {
            v51 = (id *)(v74 + 8 * v49);
            do
            {
              id v52 = *v51;
              v53 = objc_msgSend((id)objc_msgSend(v7, "primitiveValueForKey:", objc_msgSend(*v51, "name")), "objectID");
              uint64_t v54 = [(os_unfair_lock_s *)v35 valueForPropertyDescription:v52];
              if (v35
                && (!v53 ? (BOOL v55 = v41 == v54) : (BOOL v55 = 0), v55 || [v53 isEqual:v54]))
              {
                v56 = v32;
                v57 = v40;
              }
              else
              {
                v56 = v32;
                if (v53) {
                  v57 = v53;
                }
                else {
                  v57 = (void *)v41;
                }
              }
              [v56 addObject:v57];
              ++v51;
              --v50;
            }
            while (v50);
          }
          unint64_t v58 = v75[14];
          uint64_t v59 = v75[15];
          if (v58 < v59 + v58)
          {
            v60 = (id *)(v74 + 8 * v58);
            do
            {
              id v61 = *v60;
              v62 = objc_msgSend(v7, "primitiveValueForKey:", objc_msgSend(*v60, "name"));
              v63 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
              [v32 addObject:v63];

              if ([v62 isFault]) {
                goto LABEL_65;
              }
              if (!v62) {
                v62 = (void *)[MEMORY[0x1E4F1CAD0] set];
              }
              v64 = -[NSXPCStore _cachedRowForRelationship:onObjectWithID:generation:](*(os_unfair_lock_s **)(a1 + 8), v61, v34, v78);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if ([(os_unfair_lock_s *)v64 count]) {
                  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Array with content where there should be a set." userInfo:0]);
                }
                v64 = (os_unfair_lock_s *)[MEMORY[0x1E4F1CAD0] setWithArray:v64];
              }
              if (!v64) {
                v64 = (os_unfair_lock_s *)[MEMORY[0x1E4F1CAD0] set];
              }
              if ([(os_unfair_lock_s *)v64 isEqual:v62])
              {
LABEL_65:
                [v63 addObject:v40];
              }
              else
              {
                -[NSXPCSaveRequestContext _updateRollbackCacheForObjectWithID:relationship:withValuesFrom:](*(void **)(a1 + 40), (uint64_t)v34, v61, v62);
                v65 = (void *)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v62);
                v66 = (void *)[v65 mutableCopy];
                [v66 minusSet:v64];
                v67 = (void *)[(os_unfair_lock_s *)v64 mutableCopy];
                [v67 minusSet:v65];

                objc_msgSend(v63, "addObject:", objc_msgSend(v66, "allObjects"));
                objc_msgSend(v63, "addObject:", objc_msgSend(v67, "allObjects"));
              }
              ++v60;
              --v59;
            }
            while (v59);
          }

          uint64_t i = v76;
        }
        else
        {
          v32 = 0;
        }
        [v72 addObject:v32];
      }
      uint64_t v73 = [obj countByEnumeratingWithState:&v80 objects:v84 count:16];
    }
    while (v73);
  }
  return v72;
}

- (id)newEncodedSaveRequest
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    v2 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    objc_super v3 = v2;
    uint64_t v4 = *(void *)(v1 + 24);
    if (v4) {
      [v2 setValue:v4 forKey:@"NSMetadata"];
    }
    double v5 = (void *)[*(id *)(v1 + 16) insertedObjects];
    if ([v5 count]) {
      objc_msgSend(v3, "setObject:forKey:", -[NSXPCSaveRequestContext _encodeObjectsForSave:forDelete:](v1, v5, 0), @"inserted");
    }
    uint64_t v6 = (void *)[*(id *)(v1 + 16) deletedObjects];
    if ([v6 count]) {
      objc_msgSend(v3, "setObject:forKey:", -[NSXPCSaveRequestContext _encodeObjectsForSave:forDelete:](v1, v6, 1), @"deleted");
    }
    uint64_t v7 = (void *)[*(id *)(v1 + 16) updatedObjects];
    if ([v7 count]) {
      objc_msgSend(v3, "setObject:forKey:", -[NSXPCSaveRequestContext _encodeObjectsForSave:forDelete:](v1, v7, 0), @"updated");
    }
    uint64_t v8 = (void *)[*(id *)(v1 + 16) lockedObjects];
    if ([v8 count]) {
      objc_msgSend(v3, "setObject:forKey:", -[NSXPCSaveRequestContext _encodeObjectsForSave:forDelete:](v1, v8, 0), @"locked");
    }
    if (*(unsigned char *)(v1 + 56))
    {
      id v9 = (id)[v3 objectForKey:@"inserted"];
      [v3 removeObjectForKey:@"inserted"];
      uint64_t v10 = (void *)[v3 objectForKey:@"updated"];
      if (v10) {
        [v10 addObjectsFromArray:v9];
      }
      else {
        [v3 setObject:v9 forKey:@"updated"];
      }
    }
    return +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v3);
  }
  return result;
}

@end