@interface NSDictionaryStoreMap
+ (void)initialize;
- (NSDictionaryStoreMap)initWithStore:(id)a3;
- (NSDictionaryStoreMap)initWithStore:(id)a3 fromArchivedData:(id)a4;
- (NSDictionaryStoreMap)initWithStore:(id)a3 fromPath:(id)a4;
- (id)dataForKey:(id)a3;
- (id)handleFetchRequest:(id)a3;
- (id)retainedObjectIDsForRelationship:(id)a3 forObjectID:(id)a4;
- (uint64_t)_archivedData;
- (void)addObject:(id)a3 objectIDMap:(id)a4;
- (void)dealloc;
- (void)removeObject:(id)a3 objectIDMap:(id)a4;
- (void)saveToPath:(uint64_t)a1;
- (void)updateObject:(id)a3 objectIDMap:(id)a4;
@end

@implementation NSDictionaryStoreMap

+ (void)initialize
{
}

- (NSDictionaryStoreMap)initWithStore:(id)a3
{
  return [(NSDictionaryStoreMap *)self initWithStore:a3 fromPath:0];
}

- (NSDictionaryStoreMap)initWithStore:(id)a3 fromPath:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)NSDictionaryStoreMap;
  v6 = -[NSPersistentStoreMap initWithStore:](&v23, sel_initWithStore_);
  if (v6)
  {
    if (a4)
    {
      v7 = objc_alloc_init(NSBinaryObjectStoreFile);
      v7->_storeOptions = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "options"), "copy");
      uint64_t v22 = 0;
      if ((-[NSBinaryObjectStoreFile readFromFile:error:]((uint64_t)v7, (uint64_t)a4, &v22) & 1) == 0)
      {

        v16 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:v22 forKey:*MEMORY[0x1E4F28A50]];
        id v17 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], 259, @"Can't read binary data from file", v16);
        objc_exception_throw(v17);
      }
      if (v7->_databaseVersion != 134481920)
      {

        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't load binary data from file (file was created by an incompatible version of CoreData)" userInfo:0]);
      }
      -[NSPersistentStoreMap _setMetadata:]((uint64_t)v6, v7->_fullMetadata);
      v6->super._nextPK64 = v7->_primaryKeyGeneration;
      v8 = v7->_mapData;
      v6->_theMap = v8;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v9 = (void *)[(NSMutableDictionary *)v8 allValues];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v19;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v9);
            }
            -[NSStoreMapNode _setMap:](*(void *)(*((void *)&v18 + 1) + 8 * v12++), (uint64_t)v6);
          }
          while (v10 != v12);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
        }
        while (v10);
      }
    }
    else
    {
      v6->_theMap = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1024];
      v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", +[_PFRoutines _getUUID](), @"NSStoreUUID", @"Binary", @"NSStoreType", 0);
      id v14 = -[NSPersistentStoreMap _updatedMetadataWithSeed:includeVersioning:](v6, v13, 1);
      -[NSPersistentStoreMap _setMetadata:]((uint64_t)v6, v14);
    }
  }
  return v6;
}

- (NSDictionaryStoreMap)initWithStore:(id)a3 fromArchivedData:(id)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)NSDictionaryStoreMap;
  v6 = -[NSPersistentStoreMap initWithStore:](&v35, sel_initWithStore_);
  if (v6)
  {
    if (a4)
    {
      v7 = (void *)[a3 options];
      v8 = v7;
      if (byte_1EB270AB4)
      {
        v9 = (void *)[v7 objectForKey:@"_NSBinaryStoreInsecureDecodingCompatibilityOption"];
        if (v9) {
          int v10 = [v9 BOOLValue] ^ 1;
        }
        else {
          int v10 = 1;
        }
      }
      else
      {
        int v10 = 0;
      }
      id v34 = 0;
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:a4 error:&v34];
      if (v34)
      {
        uint64_t v23 = [v34 code];
        uint64_t v39 = *MEMORY[0x1E4F28A50];
        v40[0] = v34;
        v24 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
        id v25 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F28460], v23, @"Keyed archiver failure", v24);
        objc_exception_throw(v25);
      }
      id v12 = (id)+[NSBinaryObjectStore _classesForPropertyValues]();
      if (v10)
      {
        [v11 setRequiresSecureCoding:1];
        [v11 _allowDecodingCyclesInSecureMode];
        uint64_t v13 = [v8 objectForKey:@"NSBinaryStoreSecureDecodingClasses"];
        if (v13)
        {
          id v12 = (id)[v12 mutableCopy];
          [v12 unionSet:v13];
        }
      }
      else
      {
        [v11 setRequiresSecureCoding:0];
      }
      [v11 setDecodingFailurePolicy:1];
      if ([v11 decodeIntForKey:@"_NSStoreMapArchiveVersion"] != 134481920)
      {
        id v26 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F28460], 262, @"Can't load data from archived data (archived data was created by an incompatible version of CoreData)", 0);
        objc_exception_throw(v26);
      }
      id v14 = (void *)[v11 decodeObjectOfClasses:v12 forKey:@"_NSStoreMapArchiveMetadata"];
      if (v14)
      {
        id v15 = -[NSPersistentStoreMap _updatedMetadataWithSeed:includeVersioning:](v6, v14, 1);
        -[NSPersistentStoreMap _setMetadata:]((uint64_t)v6, v15);
      }
      v16 = (void *)[v11 decodeObjectOfClass:objc_opt_class() forKey:@"_NSStoreMapArchiveNextPK"];
      if (v16) {
        v16 = (void *)[v16 unsignedLongLongValue];
      }
      v6->super._nextPK64 = (unint64_t)v16;
      id v17 = (NSMutableDictionary *)(id)[v11 decodeObjectOfClasses:v12 forKey:@"_NSStoreMapArchiveData"];
      v6->_theMap = v17;
      if (v17)
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v18 = (void *)[(NSMutableDictionary *)v17 allValues];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v31 != v20) {
                objc_enumerationMutation(v18);
              }
              -[NSStoreMapNode _setMap:](*(void *)(*((void *)&v30 + 1) + 8 * i), (uint64_t)v6);
            }
            uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v19);
        }
      }
      if ([v11 error])
      {
        id v34 = (id)[v11 error];
        uint64_t v27 = [v34 code];
        uint64_t v36 = *MEMORY[0x1E4F28A50];
        id v37 = v34;
        v28 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        id v29 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F28460], v27, @"Keyed archiver failure", v28);
        objc_exception_throw(v29);
      }
      [v11 finishDecoding];

      if (v34)
      {

        return 0;
      }
    }
    else
    {
      v6->_theMap = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1024];
    }
  }
  return v6;
}

- (void)saveToPath:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  char v25 = 0;
  v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = [a2 stringByDeletingLastPathComponent];
  if (([v4 fileExistsAtPath:v5 isDirectory:&v25] & 1) == 0)
  {
    int v10 = [_NSCoreDataException alloc];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    uint64_t v12 = [NSString stringWithFormat:@"Directory does not exist : %@", v5];
LABEL_10:
    uint64_t v13 = v12;
    id v14 = v10;
    uint64_t v15 = v11;
    uint64_t v16 = 514;
    id v17 = 0;
    goto LABEL_17;
  }
  if (!v25)
  {
    int v10 = [_NSCoreDataException alloc];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    uint64_t v12 = [NSString stringWithFormat:@"Not a directory : %@", v5];
    goto LABEL_10;
  }
  v6 = objc_alloc_init(NSBinaryObjectStoreFile);
  v6->_storeOptions = (NSDictionary *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "options"), "copy");
  v6->_databaseVersion = 134481920;
  v7 = *(NSDictionary **)(a1 + 24);
  if (v6->_fullMetadata != v7)
  {
    uint64_t v8 = [(NSDictionary *)v7 copy];

    v6->_fullMetadata = (NSDictionary *)v8;
  }
  v6->_primaryKeyGeneration = *(void *)(a1 + 32);
  -[NSXPCStoreServerConnectionContext setActiveStore:]((uint64_t)v6, *(void **)(a1 + 48));
  id v24 = 0;
  unsigned __int8 v9 = -[NSBinaryObjectStoreFile writeToFile:error:](v6, (uint64_t)a2, (uint64_t)&v24);

  if ((v9 & 1) == 0)
  {
    if (v24)
    {
      long long v18 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:v24 forKey:*MEMORY[0x1E4F28A50]];
      id v19 = v24;
      if (v24)
      {
LABEL_15:
        if ([v19 code] != 513)
        {
          id v23 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], [v24 code], @"Binary store save failed.", v18);
          -[_NSCoreDataException _setDomain:]((uint64_t)v23, (void *)[v24 domain]);
          objc_exception_throw(v23);
        }
        uint64_t v20 = [_NSCoreDataException alloc];
        uint64_t v21 = *MEMORY[0x1E4F1C3C8];
        uint64_t v13 = [NSString stringWithFormat:@"Directory is not writable : %@", v5];
        id v14 = v20;
        uint64_t v15 = v21;
        uint64_t v16 = 513;
        id v17 = v18;
LABEL_17:
        id v22 = -[_NSCoreDataException initWithName:code:reason:userInfo:](v14, v15, v16, v13, v17);
        objc_exception_throw(v22);
      }
    }
    else
    {
      long long v18 = 0;
    }
    id v19 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:512 userInfo:0];
    id v24 = v19;
    goto LABEL_15;
  }
}

- (void)dealloc
{
  self->_theMap = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSDictionaryStoreMap;
  [(NSPersistentStoreMap *)&v3 dealloc];
}

- (id)dataForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_theMap objectForKey:a3];
}

- (void)addObject:(id)a3 objectIDMap:(id)a4
{
  v4 = (id **)a3;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (!self)
  {
    v57 = 0;
    goto LABEL_41;
  }
  uint64_t v8 = [a3 entity];
  unsigned __int8 v9 = (void *)[a3 objectID];
  v53 = (id **)a3;
  if (!a3)
  {
    v50 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v51 = *MEMORY[0x1E4F1C3C8];
    v52 = @"Can't construct a node from nil.";
    goto LABEL_50;
  }
  uint64_t v10 = (uint64_t)v9;
  if ([v9 isTemporaryID]) {
    uint64_t v10 = [a4 objectForKey:v10];
  }
  if (!v8)
  {
    v50 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v51 = *MEMORY[0x1E4F1C3B8];
    v52 = @"Can't find entity for object";
LABEL_50:
    objc_exception_throw((id)[v50 exceptionWithName:v51 reason:v52 userInfo:0]);
  }
  uint64_t v11 = *(void **)(v8 + 112);
  uint64_t v56 = objc_msgSend((id)objc_msgSend((id)v8, "propertiesByName"), "values");
  uint64_t v12 = PF_CALLOC_OBJECT_ARRAY([*(id *)(v8 + 104) length]);
  if ([a3 isFault]) {
    [a3 willAccessValueForKey:0];
  }
  uint64_t v58 = _kvcPropertysPrimitiveGetters((void *)v8);
  v57 = [[NSDictionaryMapNode alloc] initWithValues:v12 objectID:v10];
  -[NSStoreMapNode _setMap:]((uint64_t)v57, (uint64_t)self);
  unint64_t v18 = v11[6];
  uint64_t v17 = v11[7];
  v4 = v53;
  if (v18 < v17 + v18)
  {
    do
    {
      _PF_Handler_Primitive_GetProperty(v53, v18, 0, *(void *)(v58 + 8 * v18), v13, v14, v15, v16);
      if (v19) {
        v12[v18] = v19;
      }
      ++v18;
      --v17;
    }
    while (v17);
  }
  unint64_t v20 = v11[12];
  uint64_t v21 = v11[13];
  uint64_t v22 = v56;
  if (v20 < v21 + v20)
  {
    do
    {
      uint64_t v23 = [*(id *)(v22 + 8 * v20) name];
      _PF_Handler_Primitive_GetProperty(v53, v20, v23, *(void *)(v58 + 8 * v20), v24, v25, v26, v27);
      if (v28)
      {
        id v29 = (void *)v28;
        if (-[NSManagedObject _isValidRelationshipDestination__](v28))
        {
          long long v30 = (void *)[v29 objectID];
          if ([v30 isTemporaryID]) {
            long long v30 = (void *)[a4 objectForKey:v30];
          }
          if ((NSMappedObjectStore *)[v30 persistentStore] != self->super._store)
          {
            v48 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v53, @"Source object", v29, @"Destination Object", *(void *)(v56 + 8 * v20), @"Relationship", 0);

LABEL_45:
            id v49 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], 133010, @"CoreData does not support persistent cross-store relationships", v48);
            objc_exception_throw(v49);
          }
          long long v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", objc_msgSend(v30, "_referenceData"), 0);
          if (v57) {
            [(NSMutableDictionary *)v57->super._relatedNodes setObject:v31 forKey:v23];
          }

          uint64_t v22 = v56;
        }
      }
      ++v20;
      --v21;
    }
    while (v21);
  }
  unint64_t v32 = v11[18];
  unint64_t v55 = v11[19] + v32;
  if (v32 < v55)
  {
    do
    {
      uint64_t v33 = [*(id *)(v22 + 8 * v32) name];
      _PF_Handler_Primitive_GetProperty(v4, v32, v33, *(void *)(v58 + 8 * v32), v34, v35, v36, v37);
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v54 = v33;
        v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v38, "count"));
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v41 = [v39 countByEnumeratingWithState:&v59 objects:v63 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v60;
          do
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v60 != v43) {
                objc_enumerationMutation(v39);
              }
              v45 = *(void **)(*((void *)&v59 + 1) + 8 * i);
              if (-[NSManagedObject _isValidRelationshipDestination__]((uint64_t)v45))
              {
                v46 = (void *)[v45 objectID];
                if ([v46 isTemporaryID]) {
                  v46 = (void *)[a4 objectForKey:v46];
                }
                if ((NSMappedObjectStore *)[v46 persistentStore] != self->super._store)
                {
                  v48 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v53, @"Source object", v45, @"Destination Object", *(void *)(v56 + 8 * v32), @"Relationship", 0);

                  goto LABEL_45;
                }
                objc_msgSend(v40, "addObject:", objc_msgSend(v46, "_referenceData"));
              }
            }
            uint64_t v42 = [v39 countByEnumeratingWithState:&v59 objects:v63 count:16];
          }
          while (v42);
        }
        uint64_t v47 = [v40 count];
        if (v57 && v47) {
          [(NSMutableDictionary *)v57->super._relatedNodes setObject:v40 forKey:v54];
        }

        v4 = v53;
        uint64_t v22 = v56;
      }
      ++v32;
    }
    while (v32 != v55);
  }
LABEL_41:
  -[NSMutableDictionary setObject:forKey:](self->_theMap, "setObject:forKey:", v57, objc_msgSend((id)objc_msgSend(v4, "objectID"), "_referenceData"));
  [(NSStoreMapNode *)v57 _setVersionNumber:1];
}

- (void)removeObject:(id)a3 objectIDMap:(id)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "objectID"), "_referenceData");
  theMap = self->_theMap;

  [(NSMutableDictionary *)theMap removeObjectForKey:v5];
}

- (void)updateObject:(id)a3 objectIDMap:(id)a4
{
  v7 = (void *)[a3 entity];
  if (v7) {
    uint64_t v8 = (void *)v7[14];
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v13 = _kvcPropertysPrimitiveGetters(v7);
  unint64_t v14 = v8[18];
  uint64_t v15 = v8[19];
  if (v14 < v15 + v14)
  {
    do
    {
      _PF_Handler_Primitive_GetProperty((id **)a3, v14, 0, *(void *)(v13 + 8 * v14), v9, v10, v11, v12);
      [v16 count];
      ++v14;
      --v15;
    }
    while (v15);
  }
  unint64_t v17 = v8[26];
  uint64_t v18 = v8[27];
  if (v17 < v18 + v17)
  {
    do
    {
      _PF_Handler_Primitive_GetProperty((id **)a3, v17, 0, *(void *)(v13 + 8 * v17), v9, v10, v11, v12);
      [v19 count];
      ++v17;
      --v18;
    }
    while (v18);
  }
  uint64_t v20 = objc_msgSend((id)objc_msgSend(a3, "objectID"), "_referenceData");
  int v21 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_theMap, "objectForKey:", v20), "_versionNumber");
  [(NSDictionaryStoreMap *)self removeObject:a3 objectIDMap:a4];
  [(NSDictionaryStoreMap *)self addObject:a3 objectIDMap:a4];
  uint64_t v22 = (void *)[(NSMutableDictionary *)self->_theMap objectForKey:v20];

  [v22 _setVersionNumber:(v21 + 1)];
}

- (id)retainedObjectIDsForRelationship:(id)a3 forObjectID:(id)a4
{
  uint64_t v5 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_theMap, "objectForKey:", objc_msgSend(a4, "_referenceData")), "destinationsForRelationship:", objc_msgSend(a3, "name"));
  v6 = v5;
  if (v5) {
    uint64_t v7 = [v5 count];
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v10 = (void *)-[NSMutableDictionary objectForKey:](self->_theMap, "objectForKey:", [v6 objectAtIndex:i]);
      if (v10) {
        objc_msgSend(v8, "addObject:", objc_msgSend(v10, "objectID"));
      }
    }
  }
  return v8;
}

- (id)handleFetchRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[(NSMutableDictionary *)self->_theMap allValues];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)[a3 entity];
  uint64_t v7 = (void *)[a3 predicate];
  uint64_t v8 = [a3 fetchLimit];
  unint64_t v25 = v8;
  if ([a3 sortDescriptors]) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  int v10 = !v9;
  int v11 = objc_msgSend(a3, "includesSubentities", a3);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v12 = v4;
  uint64_t v13 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
LABEL_9:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v27 != v15) {
        objc_enumerationMutation(v12);
      }
      unint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * v16);
      uint64_t v18 = [v17 entity];
      if ((v6 == (void *)v18 || v11 && [v6 _subentitiesIncludes:v18])
        && (!v7 || [v7 evaluateWithObject:v17]))
      {
        [v5 addObject:v17];
      }
      if (v10 && [v5 count] > v25) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v14) {
          goto LABEL_9;
        }
        break;
      }
    }
  }
  uint64_t v19 = [v24 sortDescriptors];
  if (v19) {
    [v5 sortUsingDescriptors:v19];
  }
  uint64_t v20 = [v5 count];
  if (v20)
  {
    uint64_t v21 = v20;
    for (uint64_t i = 0; i != v21; ++i)
      objc_msgSend(v5, "replaceObjectAtIndex:withObject:", i, objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", i), "objectID"));
  }
  return v5;
}

- (uint64_t)_archivedData
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [MEMORY[0x1E4F1CA58] dataWithCapacity:1024];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initForWritingWithMutableData:v2];
  [v3 encodeInt:134481920 forKey:@"_NSStoreMapArchiveVersion"];
  [v3 encodeObject:a1[3] forKey:@"_NSStoreMapArchiveMetadata"];
  objc_msgSend(v3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a1[4]), @"_NSStoreMapArchiveNextPK");
  [v3 encodeObject:a1[6] forKey:@"_NSStoreMapArchiveData"];
  [v3 finishEncoding];

  return v2;
}

@end