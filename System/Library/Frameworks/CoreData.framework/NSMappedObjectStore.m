@interface NSMappedObjectStore
+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5;
- (NSMappedObjectStore)init;
- (NSMappedObjectStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6;
- (id)_rawMetadata__;
- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)getNewIDForObject:(id *)result;
- (id)identifier;
- (id)metadata;
- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4;
- (void)_setMap:(void *)result;
- (void)dealloc;
- (void)executeFetchRequest:(void *)a3 withContext:;
- (void)saveDocumentToPath:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation NSMappedObjectStore

+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  return 0;
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6
{
  return 0;
}

- (NSMappedObjectStore)init
{
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSMappedObjectStore must be initialized with initWithPersistentStoreCoordinator:configurationName:URL:options:" userInfo:0]);
}

- (NSMappedObjectStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v7 = (void *)[a3 managedObjectModel];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v45 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v44 + 1) + 8 * j);
              uint64_t v18 = [v17 _propertyType];
              switch(v18)
              {
                case 2:
                  if ([v17 attributeType] == 1000
                    && [v17 isFileBackedFuture])
                  {

                    v31 = (void *)MEMORY[0x1E4F1CA00];
                    uint64_t v32 = *MEMORY[0x1E4F1C3C8];
                    v33 = @"Core Data provided atomic stores do not support file backed futures";
LABEL_35:
                    objc_exception_throw((id)[v31 exceptionWithName:v32 reason:v33 userInfo:0]);
                  }
                  break;
                case 6:

                  v31 = (void *)MEMORY[0x1E4F1CA00];
                  uint64_t v32 = *MEMORY[0x1E4F1C3C8];
                  v33 = @"Core Data provided atomic stores do not support derived properties";
                  goto LABEL_35;
                case 7:

                  v31 = (void *)MEMORY[0x1E4F1CA00];
                  uint64_t v32 = *MEMORY[0x1E4F1C3C8];
                  v33 = @"Core Data provided atomic stores do not support composite attributes";
                  goto LABEL_35;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
          }
          while (v14);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v9);
  }
  v43.receiver = self;
  v43.super_class = (Class)NSMappedObjectStore;
  v19 = [(NSPersistentStore *)&v43 initWithPersistentStoreCoordinator:a3 configurationName:a4 URL:a5 options:a6];
  v20 = v19;
  if (v19)
  {
    v21 = objc_msgSend((id)objc_msgSend(-[NSPersistentStore _persistentStoreCoordinator](v19, "_persistentStoreCoordinator"), "managedObjectModel"), "entitiesForConfiguration:", a4);
    CFIndex v22 = *MEMORY[0x1E4F1D548];
    callBacks.retain = 0;
    callBacks.release = 0;
    callBacks.version = v22;
    *(_OWORD *)&callBacks.copyDescription = *(_OWORD *)(MEMORY[0x1E4F1D548] + 24);
    callBacks.hash = *(CFSetHashCallBack *)(MEMORY[0x1E4F1D548] + 40);
    v20->_entitiesToFetch = (NSSet *)CFSetCreateMutable(0, [v21 count], &callBacks);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v52 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v39;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(v21);
          }
          v27 = *(void **)(*((void *)&v38 + 1) + 8 * k);
          [(NSSet *)v20->_entitiesToFetch addObject:v27];
          -[NSSet addObjectsFromArray:](v20->_entitiesToFetch, "addObjectsFromArray:", [v27 subentities]);
          uint64_t v28 = [v27 superentity];
          if (v28)
          {
            v29 = (void *)v28;
            do
            {
              [(NSSet *)v20->_entitiesToFetch addObject:v29];
              v29 = (void *)[v29 superentity];
            }
            while (v29);
          }
        }
        uint64_t v24 = [v21 countByEnumeratingWithState:&v38 objects:v52 count:16];
      }
      while (v24);
    }
  }
  return v20;
}

- (void)dealloc
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);

  self->_theMap = 0;
  entitiesToFetch = self->_entitiesToFetch;
  if (entitiesToFetch) {
    CFRelease(entitiesToFetch);
  }
  [v3 drain];
  v5.receiver = self;
  v5.super_class = (Class)NSMappedObjectStore;
  [(NSPersistentStore *)&v5 dealloc];
}

- (void)_setMap:(void *)result
{
  if (result)
  {
    id v3 = result;
    v4 = (void *)result[13];
    if (v4 != a2)
    {

      result = a2;
      v3[13] = result;
    }
  }
  return result;
}

- (void)saveDocumentToPath:(id)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (!a3) {
LABEL_65:
  }
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Unknown command type %@", a4, a5, a3), 0 reason userInfo]);
  switch([a3 requestType])
  {
    case 1:
      if ([a3 resultType] == 4) {
        goto LABEL_4;
      }
      if (!-[NSSet containsObject:](self->_entitiesToFetch, "containsObject:", [a3 entity])) {
        return (id)NSArray_EmptyArray;
      }
      return -[NSMappedObjectStore executeFetchRequest:withContext:]((uint64_t)self, a3, (void **)a4);
    case 2:
      if (!self) {
        return 0;
      }
      if (-[NSSaveChangesRequest hasChanges]((BOOL)a3)
        || (unsigned __int8 v17 = atomic_load((unsigned __int8 *)&self->super._isMetadataDirty), (v17 & 1) != 0))
      {
        id v44 = a4;
        id v45 = a3;
        uint64_t v18 = (void *)[a3 insertedObjects];
        v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v18, "count"));
        long long v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v18, "count"));
        v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v18, "count"));
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v21 = [v18 countByEnumeratingWithState:&v59 objects:v66 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v60;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v60 != v22) {
                objc_enumerationMutation(v18);
              }
              uint64_t v24 = *(void **)(*((void *)&v59 + 1) + 8 * i);
              uint64_t v25 = (void *)[v24 objectID];
              if ([v25 isTemporaryID])
              {
                v26 = -[NSMappedObjectStore getNewIDForObject:]((id *)&self->super.super.isa, v24);
                [v19 setObject:v26 forKey:v25];
                [v46 addObject:v24];
                [v20 addObject:v26];
              }
            }
            uint64_t v21 = [v18 countByEnumeratingWithState:&v59 objects:v66 count:16];
          }
          while (v21);
        }
        if ([v46 count])
        {
          v27 = (void *)-[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:]((uint64_t)v44, v46, v20);
          if (v27) {
            -[NSSaveChangesRequest _addChangedObjectIDsNotification:]((uint64_t)v45, (uint64_t)v27);
          }
        }
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        uint64_t v28 = [v18 countByEnumeratingWithState:&v55 objects:v65 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v56;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v56 != v29) {
                objc_enumerationMutation(v18);
              }
              uint64_t v31 = *(void *)(*((void *)&v55 + 1) + 8 * j);
              if (v31) {
                [(NSPersistentStoreMap *)self->_theMap addObject:v31 objectIDMap:v19];
              }
            }
            uint64_t v28 = [v18 countByEnumeratingWithState:&v55 objects:v65 count:16];
          }
          while (v28);
        }
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        uint64_t v32 = (void *)[v45 deletedObjects];
        uint64_t v33 = [v32 countByEnumeratingWithState:&v51 objects:v64 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v52;
          do
          {
            for (uint64_t k = 0; k != v33; ++k)
            {
              if (*(void *)v52 != v34) {
                objc_enumerationMutation(v32);
              }
              uint64_t v36 = *(void *)(*((void *)&v51 + 1) + 8 * k);
              if (v36) {
                [(NSPersistentStoreMap *)self->_theMap removeObject:v36 objectIDMap:v19];
              }
            }
            uint64_t v33 = [v32 countByEnumeratingWithState:&v51 objects:v64 count:16];
          }
          while (v33);
        }
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        v37 = (void *)[v45 updatedObjects];
        uint64_t v38 = [v37 countByEnumeratingWithState:&v47 objects:v63 count:16];
        if (v38)
        {
          uint64_t v39 = *(void *)v48;
          do
          {
            for (uint64_t m = 0; m != v38; ++m)
            {
              if (*(void *)v48 != v39) {
                objc_enumerationMutation(v37);
              }
              uint64_t v41 = *(void *)(*((void *)&v47 + 1) + 8 * m);
              if (v41) {
                [(NSPersistentStoreMap *)self->_theMap updateObject:v41 objectIDMap:v19];
              }
            }
            uint64_t v38 = [v37 countByEnumeratingWithState:&v47 objects:v63 count:16];
          }
          while (v38);
        }
        v42 = [(NSPersistentStore *)self URL];
        if (v42) {
          [(NSMappedObjectStore *)self saveDocumentToPath:[(NSURL *)v42 path]];
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
      uint64_t v10 = objc_msgSend(-[NSPersistentStoreMap handleFetchRequest:](self->_theMap, "handleFetchRequest:", v9), "count");
      v11 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v12 = [NSNumber numberWithUnsignedLong:v10];
      return (id)[v11 arrayWithObject:v12];
    case 8:
      if (!a5) {
        return 0;
      }
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F281F8];
      v16 = &unk_1ED7E1E98;
      goto LABEL_58;
    case 10:
      if (!a5) {
        return 0;
      }
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F281F8];
      v16 = &unk_1ED7E1EC0;
LABEL_58:
      id v43 = (id)[v14 errorWithDomain:v15 code:134091 userInfo:v16];
      id result = 0;
      *a5 = v43;
      return result;
    default:
      goto LABEL_65;
  }
}

- (void)executeFetchRequest:(void *)a3 withContext:
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  uint64_t v72 = a1;
  if (!a1) {
    return 0;
  }
  v4 = a2;
  if ([a2 propertiesToGroupBy]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unsupported fetch request: store %@ does not support GROUP BY", v72), 0 reason userInfo]);
  }
  id v5 = -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:](+[_NSMemoryStorePredicateRemapper defaultInstance](_NSMemoryStorePredicateRemapper, "defaultInstance"), "createPredicateForFetchFromPredicate:", [v4 predicate]);
  uint64_t v6 = *(void *)(v72 + 48);
  id v7 = (id)[v4 copy];
  [v7 setPredicate:v5];
  uint64_t v8 = (void *)[*(id *)(v72 + 104) handleFetchRequest:v7];
  uint64_t v9 = [v4 resultType];
  uint64_t v10 = [v4 resultType];
  char v11 = [v4 includesPropertyValues];
  char v12 = [v4 returnsObjectsAsFaults];
  uint64_t v13 = [v8 count];
  unint64_t v14 = v13;
  unint64_t v63 = v13;
  if (v9)
  {
    if (v10 != 2) {
      goto LABEL_70;
    }
    long long v62 = &v60;
    MEMORY[0x1F4188790](v13);
    unsigned __int8 v17 = (char *)&v60 - v16;
    if (v14 > 0x200) {
      unsigned __int8 v17 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v60 - v16, 8 * v15);
    }
    objc_msgSend(v8, "getObjects:range:", v17, 0, v14);
    id v27 = (id)[v4 propertiesToFetch];
    if (!v27)
    {
      uint64_t v28 = (void *)[v4 entity];
      if (v28) {
        uint64_t v29 = v28[14];
      }
      else {
        uint64_t v29 = 0;
      }
      uint64_t v30 = objc_msgSend((id)objc_msgSend(v28, "propertiesByName"), "values");
      id v27 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v30 + 8 * *(void *)(v29 + 48) count:*(void *)(v29 + 56) + *(void *)(v29 + 48)];
    }
    uint64_t v31 = [v27 count];
    unint64_t v32 = MEMORY[0x1F4188790](v31);
    uint64_t v34 = (char *)&v60 - v33;
    size_t v36 = 8 * v35;
    unint64_t v61 = v32;
    if (v32 > 0x200)
    {
      uint64_t v34 = (char *)NSAllocateScannedUncollectable();
      v66 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)&v60 - v33, v36);
      MEMORY[0x1F4188790](v37);
      v66 = (char *)&v60 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v66, v36);
    }
    id v69 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v68 = objc_opt_class();
    if (!v14)
    {
      uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithObjects:v17 count:0];
      goto LABEL_67;
    }
    long long v60 = v4;
    uint64_t v73 = 0;
    id v38 = 0;
    v64 = v34;
    id v71 = v27;
    while (1)
    {
      long long v76 = 0u;
      long long v77 = 0u;
      long long v75 = 0u;
      long long v74 = 0u;
      uint64_t v39 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v74, v78, 16, v60);
      if (!v39) {
        goto LABEL_58;
      }
      uint64_t v40 = 0;
      uint64_t v41 = *(void *)v75;
      do
      {
        uint64_t v42 = 0;
        uint64_t v67 = (int)v40;
        id v43 = &v66[8 * (int)v40];
        uint64_t v65 = v40;
        v70 = &v34[8 * (int)v40];
        do
        {
          id v44 = v38;
          if (*(void *)v75 != v41) {
            objc_enumerationMutation(v71);
          }
          id v45 = *(void **)(*((void *)&v74 + 1) + 8 * v42);
          long long v46 = v17;
          long long v47 = objc_msgSend(*(id *)(v72 + 104), "dataForKey:", objc_msgSend(*(id *)&v17[8 * v73], "_referenceData"));
          uint64_t v48 = [v45 _propertyType];
          uint64_t v49 = [v45 name];
          if (v48 != 5)
          {
            if (v48 == 4)
            {
              uint64_t v50 = objc_msgSend((id)objc_msgSend(v47, "valueForKey:", v49), "objectID");
LABEL_42:
              long long v51 = (void *)v50;
            }
            else
            {
              if (v48 == 2)
              {
                uint64_t v50 = [v47 valueForKey:v49];
                goto LABEL_42;
              }
              long long v51 = 0;
            }
            unsigned __int8 v17 = v46;
            id v38 = v44;
            goto LABEL_49;
          }
          long long v52 = (void *)[v45 expression];
          long long v51 = (void *)[v52 expressionValueWithObject:v47 context:v69];
          if ([v52 expressionType] == 50)
          {
            unsigned __int8 v17 = v46;
            if (([v52 isCountOnlyRequest] & 1) != 0
              || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v52, "requestExpression"), "expressionValueWithObject:context:", 0, 0), "resultType") == 4)
            {
              long long v51 = (void *)[v51 lastObject];
            }
          }
          else
          {
            unsigned __int8 v17 = v46;
          }
          id v38 = v44;
          if (objc_opt_isKindOfClass()) {
            long long v51 = (void *)[v51 objectID];
          }
LABEL_49:
          if (!v38) {
            *(void *)&v70[8 * v42] = v49;
          }
          *(void *)&v43[8 * v42++] = v51;
        }
        while (v39 != v42);
        id v27 = v71;
        uint64_t v53 = [v71 countByEnumeratingWithState:&v74 objects:v78 count:16];
        uint64_t v39 = v53;
        uint64_t v40 = v67 + v42;
        uint64_t v34 = v64;
      }
      while (v53);
      LODWORD(v39) = v42 + v65;
      unint64_t v14 = v63;
LABEL_58:
      if (!v38) {
        id v38 = [[NSKnownKeysMappingStrategy alloc] initForKeys:v34 count:(int)v39];
      }
      long long v54 = [[NSKnownKeysDictionary alloc] initWithSearchStrategy:v38];
      uint64_t v55 = v73;
      *(void *)&v17[8 * v73] = v54;
      [(NSKnownKeysDictionary *)v54 setValues:v66];
      uint64_t v73 = v55 + 1;
      if (v55 + 1 == v14)
      {
        uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithObjects:v17 count:v14];
        uint64_t v56 = 0;
        do

        while (v14 != v56);
        if (v14 >= 0x201) {
          NSZoneFree(0, v17);
        }
        v4 = v60;
LABEL_67:
        if (v61 >= 0x201)
        {
          NSZoneFree(0, v34);
          NSZoneFree(0, v66);
        }

        goto LABEL_70;
      }
    }
  }
  long long v62 = &v60;
  MEMORY[0x1F4188790](v13);
  v20 = (char *)&v60 - v19;
  if (v14 >= 0x201)
  {
    v20 = (char *)NSAllocateScannedUncollectable();
    objc_msgSend(v8, "getObjects:range:", v20, 0, v14);
  }
  else
  {
    bzero((char *)&v60 - v19, 8 * v18);
    objc_msgSend(v8, "getObjects:range:", v20, 0, v14);
    if (!v14)
    {
      uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithObjects:v20 count:0];
      goto LABEL_70;
    }
  }
  uint64_t v21 = 0;
  char v22 = v11 ^ 1 | v12;
  do
  {
    uint64_t v23 = *(void **)&v20[8 * v21];
    uint64_t v24 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](a3, v23, v6);
    if ((v22 & 1) == 0)
    {
      uint64_t v25 = objc_msgSend(*(id *)(v72 + 104), "dataForKey:", objc_msgSend(v23, "_referenceData"));
      if (v24) {
        v24[4] |= 0x200u;
      }
      _PFFaultHandlerFulfillFault(v6, (uint64_t)v24, (uint64_t)a3, v25, 1);
    }
    *(void *)&v20[8 * v21++] = v24;
  }
  while (v63 != v21);
  unint64_t v14 = v63;
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithObjects:v20 count:v63];
  uint64_t v26 = 0;
  do

  while (v14 != v26);
  if (v14 >= 0x201) {
    NSZoneFree(0, v20);
  }
LABEL_70:
  unint64_t v57 = [v4 fetchOffset];
  if (v57)
  {
    if (v57 <= v14) {
      [v8 removeObjectsInRange:0];
    }
    else {
      [v8 removeAllObjects];
    }
    unint64_t v14 = [v8 count];
  }
  unint64_t v58 = [v4 fetchLimit];
  if (v58 && v14 > v58) {
    objc_msgSend(v8, "removeObjectsInRange:", v58, v14 - v58);
  }
  return v8;
}

- (id)getNewIDForObject:(id *)result
{
  if (result)
  {
    id v3 = result;
    uint64_t v4 = [result[13] nextPK64];
    id v5 = (objc_class *)objc_msgSend(v3, "objectIDFactoryForEntity:", objc_msgSend(a2, "entity"));
    uint64_t v6 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:v4];
    uint64_t v7 = [[v5 alloc] initWithObject:v6];

    return (id *)v7;
  }
  return result;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  id v5 = -[NSPersistentStoreMap dataForKey:](self->_theMap, "dataForKey:", [a3 _referenceData]);

  return v5;
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  id v7 = -[NSPersistentStoreMap retainedObjectIDsForRelationship:forObjectID:](self->_theMap, "retainedObjectIDsForRelationship:forObjectID:", a3, a4, a5, a6);
  if (([a3 isToMany] & 1) == 0)
  {
    uint64_t v8 = (void *)[v7 lastObject];
    id v9 = v8;

    return v8;
  }
  return v7;
}

- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3, a4);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(a3);
        }
        char v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v12 = (void *)[v11 objectID];
        if ([v12 isTemporaryID]) {
          uint64_t v13 = -[NSMappedObjectStore getNewIDForObject:]((id *)&self->super.super.isa, v11);
        }
        else {
          uint64_t v13 = v12;
        }
        unint64_t v14 = v13;
        [v6 addObject:v13];
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  return v6;
}

- (id)identifier
{
  return (id)-[NSPersistentStoreMap databaseUUID]((uint64_t)self->_theMap);
}

- (id)_rawMetadata__
{
  theMap = self->_theMap;
  if (theMap) {
    return theMap->_storeMetadata;
  }
  else {
    return 0;
  }
}

- (id)metadata
{
  theMap = self->_theMap;
  if (theMap) {
    return theMap->_storeMetadata;
  }
  else {
    return 0;
  }
}

- (void)setMetadata:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSMappedObjectStore;
  -[NSPersistentStore setMetadata:](&v5, sel_setMetadata_);
  -[NSPersistentStoreMap setMetadata:](self->_theMap, a3);
}

@end