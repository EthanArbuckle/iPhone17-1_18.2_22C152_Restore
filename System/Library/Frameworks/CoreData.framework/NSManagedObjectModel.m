@interface NSManagedObjectModel
+ (BOOL)supportsSecureCoding;
+ (BOOL)versionHashes:(id)a3 compatibleWithStoreMetadata:(id)a4;
+ (NSDictionary)checksumsForVersionedModelAtURL:(NSURL *)modelURL error:(NSError *)error;
+ (NSManagedObjectModel)mergedModelFromBundles:(NSArray *)bundles;
+ (NSManagedObjectModel)mergedModelFromBundles:(NSArray *)bundles forStoreMetadata:(NSDictionary *)metadata;
+ (NSManagedObjectModel)modelByMergingModels:(NSArray *)models;
+ (NSManagedObjectModel)modelByMergingModels:(NSArray *)models forStoreMetadata:(NSDictionary *)metadata;
+ (id)versionsHashesForModelAtURL:(id)a3 error:(id *)a4;
+ (int64_t)_debugOptimizedModelLayout;
+ (uint64_t)_deepCollectEntitiesInArray:(void *)a3 entity:;
+ (void)_modelPathsFromBundles:(uint64_t)a1;
+ (void)_newModelFromOptimizedEncoding:(uint64_t *)a3 error:;
- (BOOL)isConfiguration:(NSString *)configuration compatibleWithStoreMetadata:(NSDictionary *)metadata;
- (BOOL)isEditable;
- (BOOL)isEqual:(id)a3;
- (NSArray)configurations;
- (NSArray)entities;
- (NSArray)entitiesForConfiguration:(NSString *)configuration;
- (NSDictionary)entitiesByName;
- (NSDictionary)entityVersionHashesByName;
- (NSDictionary)fetchRequestTemplatesByName;
- (NSDictionary)localizationDictionary;
- (NSFetchRequest)fetchRequestFromTemplateWithName:(NSString *)name substitutionVariables:(NSDictionary *)variables;
- (NSFetchRequest)fetchRequestTemplateForName:(NSString *)name;
- (NSManagedObjectModel)init;
- (NSManagedObjectModel)initWithCoder:(id)a3;
- (NSManagedObjectModel)initWithContentsOfOptimizedURL:(id)a3;
- (NSManagedObjectModel)initWithContentsOfURL:(NSURL *)url;
- (NSManagedObjectModel)initWithContentsOfURL:(id)a3 forStoreMetadata:(id)a4;
- (NSSet)versionIdentifiers;
- (NSString)versionChecksum;
- (id)_entitiesByVersionHash;
- (id)_entityVersionHashesByNameInStyle:(id)result;
- (id)_entityVersionHashesDigest;
- (id)_entityVersionHashesDigestFrom:(id)result;
- (id)_initWithContentsOfURL:(id)a3 options:(unint64_t)a4;
- (id)_initWithEntities:(id)a3;
- (id)_localizationPolicy;
- (id)_modelForVersionHashes:(id)a3;
- (id)_optimizedEncoding:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)immutableCopy;
- (id)versionHash;
- (int64_t)_modelsReferenceIDOffset;
- (uint64_t)_allowedClassesFromTransformableAttributes;
- (uint64_t)_hasEntityWithDerivedAttribute;
- (uint64_t)_hasEntityWithUniquenessConstraints;
- (uint64_t)_isConfiguration:(uint64_t)a3 inStyle:(void *)a4 compatibleWithStoreMetadata:;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)_addEntity:(id)a3;
- (void)_createCachesAndOptimizeState;
- (void)_finalizeIndexes;
- (void)_flattenProperties;
- (void)_removeEntity:(uint64_t)a1;
- (void)_restoreValidation;
- (void)_setIsEditable:(BOOL)a3;
- (void)_setIsEditable:(BOOL)a3 optimizationStyle:(unint64_t)a4;
- (void)_setLocalizationPolicy:(id)a3;
- (void)_setModelsReferenceIDOffset:(int64_t)a3;
- (void)_sortedEntitiesForConfiguration:(void *)result;
- (void)_stripForMigration;
- (void)_throwIfNotEditable;
- (void)_traverseTombstonesAndMark:(uint64_t)a1;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setEntities:(NSArray *)entities;
- (void)setEntities:(NSArray *)entities forConfiguration:(NSString *)configuration;
- (void)setFetchRequestTemplate:(NSFetchRequest *)fetchRequestTemplate forName:(NSString *)name;
- (void)setLocalizationDictionary:(NSDictionary *)localizationDictionary;
- (void)setVersionIdentifiers:(NSSet *)versionIdentifiers;
@end

@implementation NSManagedObjectModel

uint64_t __75__NSManagedObjectModel__NSInternalMethods___entityVersionHashesDigestFrom___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (int64_t)_modelsReferenceIDOffset
{
  return [self->_additionalPrivateIvars[1] longValue];
}

- (uint64_t)_hasEntityWithUniquenessConstraints
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    unsigned int v2 = *(_DWORD *)(result + 64);
    if ((v2 & 4) != 0)
    {
      return (v2 >> 3) & 1;
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
      long long v7 = 0u;
      long long v8 = 0u;
      v3 = *(void **)(result + 32);
      result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (result)
      {
        uint64_t v4 = result;
        uint64_t v5 = *(void *)v8;
        while (2)
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            if (*(void *)v8 != v5) {
              objc_enumerationMutation(v3);
            }
            if (-[NSEntityDescription _hasUniqueProperties]([*(id *)(v1 + 32) objectForKey:*(void *)(*((void *)&v7 + 1) + 8 * i)])) {
              return 1;
            }
          }
          uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
          result = 0;
          if (v4) {
            continue;
          }
          break;
        }
      }
    }
  }
  return result;
}

- (void)_finalizeIndexes
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v5 = 0u;
    long long v6 = 0u;
    result = (void *)[result countByEnumeratingWithState:&v5 objects:v9 count:16];
    if (result)
    {
      unsigned int v2 = result;
      uint64_t v3 = *(void *)v6;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v6 != v3) {
            objc_enumerationMutation(v1);
          }
          -[NSEntityDescription _finalizeIndexes](*(void *)(*((void *)&v5 + 1) + 8 * (void)v4));
          uint64_t v4 = (char *)v4 + 1;
        }
        while (v2 != v4);
        result = (void *)[v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
        unsigned int v2 = result;
      }
      while (result);
    }
  }
  return result;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (!a3->var1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v9 = [(NSManagedObjectModel *)self entities];
      a3->var3[3] = 0;
      a3->var3[4] = (unint64_t)v9;
    }
  }
  uint64_t v10 = (NSArray *)a3->var3[4];
  if (v10)
  {
    if (!a3->var3[3]) {
      uint64_t v10 = [(NSManagedObjectModel *)self entities];
    }
    return [(NSArray *)v10 countByEnumeratingWithState:a3 objects:a4 count:a5];
  }
  else
  {
    entities = self->_entities;
    return [(NSMutableDictionary *)entities _valueCountByEnumeratingWithState:a3 objects:a4 count:a5];
  }
}

- (NSArray)entities
{
  return (NSArray *)[(NSMutableDictionary *)self->_entities allValues];
}

- (void)_sortedEntitiesForConfiguration:(void *)result
{
  if (result)
  {
    unsigned int v2 = (void *)[result entitiesForConfiguration:a2];
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"name" ascending:1 selector:sel_caseInsensitiveCompare_];
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v3, 0);
    uint64_t v5 = [v2 sortedArrayUsingDescriptors:v4];

    return (void *)v5;
  }
  return result;
}

- (id)versionHash
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    uint64_t v3 = malloc_default_zone();
  }
  memset(&c, 0, sizeof(c));
  uint64_t v4 = (unsigned __int8 *)malloc_type_zone_malloc(v3, 0x20uLL, 0x6853F68FuLL);
  CC_SHA256_Init(&c);
  uint64_t v5 = objc_msgSend((id)-[NSMutableDictionary allValues](self->_entities, "allValues"), "sortedArrayUsingFunction:context:", _compareEntitiesByName, 0);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        CC_SHA256_Update(&c, (const void *)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9++), "versionHash"), "bytes"), 0x20u);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);
  }
  CC_SHA256_Final(v4, &c);
  uint64_t v10 = (void *)[MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:32];
  v11 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    v11 = malloc_default_zone();
  }
  malloc_zone_free(v11, v4);
  return v10;
}

- (id)_entityVersionHashesDigestFrom:(id)result
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    memset(&c, 0, sizeof(c));
    uint64_t v3 = CC_SHA512_Init(&c);
    uint64_t v4 = (void *)MEMORY[0x18C127630](v3);
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_427);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v11 = (void *)[a2 objectForKey:v10];
          uint64_t v12 = (const char *)[v10 UTF8String];
          CC_LONG v13 = strlen(v12);
          CC_SHA512_Update(&c, v12, v13);
          LODWORD(v12) = [v11 length];
          [v11 getBytes:data length:v12];
          CC_SHA512_Update(&c, data, (CC_LONG)v12);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v7);
    }
    CC_SHA512_Final(md, &c);
    long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:64];
    id v15 = (id)[v14 base64EncodedStringWithOptions:0];

    return v15;
  }
  return result;
}

- (void)_removeEntity:(uint64_t)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ([a2 managedObjectModel] != a1) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can't remove entity - doesn't belong to this model." userInfo:0]);
    }
    uint64_t v4 = [a2 name];
    [(id)a1 _throwIfNotEditable];
    if (v4)
    {
      v31 = (void *)[*(id *)(a1 + 32) objectForKey:v4];
      if (v31)
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v29 = v4;
        obuint64_t j = *(id *)(a1 + 40);
        uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v33 != v7) {
                objc_enumerationMutation(obj);
              }
              uint64_t v9 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              uint64_t v10 = (void *)[MEMORY[0x1E4F1C978] arrayWithObject:v31];
              v11 = *(void **)(a1 + 40);
              if (v11)
              {
                uint64_t v12 = [v11 objectForKey:v9];
                if (v12)
                {
                  CC_LONG v13 = (void *)v12;
                  if ((*(unsigned char *)(a1 + 64) & 3) != 0)
                  {
                    uint64_t v14 = [NSString stringWithUTF8String:"_removeEntities called on immutable NSManagedObjectModel"];
                    _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, v28);
                    v21 = __pflogFaultLog;
                    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl(&dword_18AB82000, v21, OS_LOG_TYPE_FAULT, "CoreData: _removeEntities called on immutable NSManagedObjectModel", buf, 2u);
                    }
                  }
                  long long v38 = 0u;
                  long long v39 = 0u;
                  long long v36 = 0u;
                  long long v37 = 0u;
                  uint64_t v22 = [v10 countByEnumeratingWithState:&v36 objects:buf count:16];
                  if (v22)
                  {
                    uint64_t v23 = v22;
                    uint64_t v24 = *(void *)v37;
                    do
                    {
                      for (uint64_t j = 0; j != v23; ++j)
                      {
                        if (*(void *)v37 != v24) {
                          objc_enumerationMutation(v10);
                        }
                        uint64_t v26 = [v13 indexOfObjectIdenticalTo:*(void *)(*((void *)&v36 + 1) + 8 * j)];
                        if (v26 != 0x7FFFFFFFFFFFFFFFLL) {
                          [v13 removeObjectAtIndex:v26];
                        }
                      }
                      uint64_t v23 = [v10 countByEnumeratingWithState:&v36 objects:buf count:16];
                    }
                    while (v23);
                  }
                }
              }
            }
            uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v6);
        }
        v27 = v31;
        [*(id *)(a1 + 32) removeObjectForKey:v29];
        -[NSEntityDescription _setManagedObjectModel:](v31, 0);
      }
    }
  }
}

- (void)setEntities:(NSArray *)entities
{
  [(NSManagedObjectModel *)self _throwIfNotEditable];
  if ((+[_PFRoutines _doNameAndTypeCheck:]((uint64_t)_PFRoutines, entities) & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't add an entity to a managed object model (missing name or bad properties)." userInfo:0]);
  }
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_entities allValues];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v9 = (void *)[v5 objectAtIndex:i];
      if ([(NSArray *)entities indexOfObjectIdenticalTo:v9] == 0x7FFFFFFFFFFFFFFFLL) {
        -[NSManagedObjectModel _removeEntity:]((uint64_t)self, v9);
      }
    }
  }
  NSUInteger v10 = [(NSArray *)entities count];
  if (v10)
  {
    NSUInteger v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
    {
      id v13 = [(NSArray *)entities objectAtIndex:j];
      if ([v5 indexOfObjectIdenticalTo:v13] == 0x7FFFFFFFFFFFFFFFLL) {
        [(NSManagedObjectModel *)self _addEntity:v13];
      }
    }
  }
}

- (void)_addEntity:(id)a3
{
  [(NSManagedObjectModel *)self _throwIfNotEditable];
  if (!a3) {
    return;
  }
  uint64_t v5 = [a3 name];
  if (!v5)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    uint64_t v9 = @"Can't add unnamed entity to model.";
    goto LABEL_10;
  }
  uint64_t v6 = v5;
  if ([(NSMutableDictionary *)self->_entities objectForKey:v5])
  {
    NSUInteger v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3B8];
    uint64_t v9 = (__CFString *)[NSString stringWithFormat:@"Model already contains an entity named %@.", v6];
    uint64_t v7 = v10;
    uint64_t v8 = v11;
LABEL_10:
    objc_exception_throw((id)[v7 exceptionWithName:v8 reason:v9 userInfo:0]);
  }
  [(NSMutableDictionary *)self->_entities setObject:a3 forKey:v6];

  -[NSEntityDescription _setManagedObjectModel:](a3, (uint64_t)self);
}

- (NSString)versionChecksum
{
  if ([(NSManagedObjectModel *)self isEditable])
  {
    _NSCoreDataLog(1, @"Attempting to retrieve an NSManagedObjectModel version checksum while the model is still editable. This may result in an unstable verison checksum. Add model to NSPersistentStoreCoordinator and try again.", v3, v4, v5, v6, v7, v8, v12);
    [(NSManagedObjectModel *)self _setIsEditable:0];
  }
  uint64_t v9 = objc_msgSend(-[NSManagedObjectModel versionHash](self, "versionHash"), "base64EncodedStringWithOptions:", 0);
  uint64_t v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];

  return (NSString *)[v9 stringByTrimmingCharactersInSet:v10];
}

- (void)_throwIfNotEditable
{
  if (![(NSManagedObjectModel *)self isEditable]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't modify an immutable model." userInfo:0]);
  }
}

- (BOOL)isEditable
{
  return (*(unsigned char *)&self->_managedObjectModelFlags & 1) == 0;
}

- (void)_createCachesAndOptimizeState
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  __managedObjectModelFlags managedObjectModelFlags = self->_managedObjectModelFlags;
  if ((*(unsigned char *)&managedObjectModelFlags & 2) == 0)
  {
    self->___managedObjectModelFlags managedObjectModelFlags = (__managedObjectModelFlags)(*(_DWORD *)&managedObjectModelFlags | 2);
    id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    entities = self->_entities;
    id v61 = v4;
    uint64_t v6 = objc_msgSend((id)-[NSMutableDictionary allValues](entities, "allValues"), "sortedArrayUsingFunction:context:", _compareEntitiesByName, 0);
    unint64_t v7 = [v6 count];
    v60[1] = v60;
    unint64_t v8 = MEMORY[0x1F4188790](v7);
    uint64_t v11 = (char *)v60 - v10;
    size_t v12 = 8 * v9;
    if (v8 >= 0x201)
    {
      uint64_t v11 = (char *)NSAllocateScannedUncollectable();
      uint64_t v14 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)v60 - v10, 8 * v9);
      MEMORY[0x1F4188790](v13);
      uint64_t v14 = (char *)v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v14, v12);
    }
    objc_msgSend(v6, "getObjects:range:", v11, 0, v7);
    if (v7)
    {
      uint64_t v15 = (id *)v11;
      uint64_t v16 = v14;
      unint64_t v17 = v7;
      do
      {
        *(void *)uint64_t v16 = [*v15 name];
        v16 += 8;
        ++v15;
        --v17;
      }
      while (v17);
    }
    v62 = [[NSKnownKeysDictionary alloc] initWithObjects:v11 forKeys:v14 count:v7];
    if (v7 >= 0x201)
    {
      NSZoneFree(0, v11);
      NSZoneFree(0, v14);
    }

    uint64_t v18 = v62;
    self->_entities = &v62->super;
    uint64_t v19 = [(NSKnownKeysDictionary *)v18 values];
    if (!self->_configurations) {
      self->_configurations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    -[NSMutableDictionary setObject:forKey:](self->_configurations, "setObject:forKey:", [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:v7], @"PF_DEFAULT_CONFIGURATION_NAME");
    if (!*((void *)self->_additionalPrivateIvars + 3)) {
      *((void *)self->_additionalPrivateIvars + 3) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    objc_msgSend(self->_additionalPrivateIvars[3], "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[NSKnownKeysDictionary allKeys](v62, "allKeys")), @"PF_DEFAULT_CONFIGURATION_NAME");
    Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    uint64_t v21 = [(NSKnownKeysDictionary *)v62 count];
    if (v21)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        uint64_t v23 = *(void *)(v19 + 8 * i);
        [(id)v23 _flattenProperties];
        if (v23) {
          *(void *)(v23 + 160) = i;
        }
        CFSetAddValue(Mutable, (const void *)v23);
        if (v23)
        {
          uint64_t v24 = *(void *)(v23 + 128);
          if (!v24 || (v25 = *(void **)(v24 + 24)) == 0) {
            v25 = NSArray_EmptyArray;
          }
        }
        else
        {
          v25 = 0;
        }
        if ([v25 count])
        {
          *(_DWORD *)&self->_managedObjectModelFlags |= 8u;
          if (v23) {
            *(_DWORD *)(v23 + 120) |= 0x800u;
          }
        }
      }
    }
    uint64_t v26 = (void *)[MEMORY[0x1E4F1CA48] array];
    unint64_t v27 = 0;
LABEL_29:
    if (CFSetGetCount(Mutable) >= 1)
    {
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      uint64_t v28 = [(__CFSet *)Mutable countByEnumeratingWithState:&v71 objects:v77 count:16];
      if (!v28) {
        goto LABEL_55;
      }
      uint64_t v29 = *(void *)v72;
      while (1)
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v72 != v29) {
            objc_enumerationMutation(Mutable);
          }
          v31 = *(_DWORD **)(*((void *)&v71 + 1) + 8 * v30);
          if (v31)
          {
            uint64_t v32 = -1;
            uint64_t v33 = *(void *)(*((void *)&v71 + 1) + 8 * v30);
            do
            {
              uint64_t v33 = *(void *)(v33 + 80);
              ++v32;
            }
            while (v33);
          }
          else
          {
            uint64_t v32 = 0;
          }
          if (v27 > 0x3E7 || v32 == v27)
          {
            [v26 addObject:v31];
            uint64_t v34 = [v31 superentity];
            if (v34 && (*(unsigned char *)(v34 + 121) & 8) != 0)
            {
              if (!v31) {
                goto LABEL_50;
              }
              int v35 = v31[30] | 0x800;
              v31[30] = v35;
              if ((v35 & 0x800) == 0) {
                goto LABEL_50;
              }
            }
            else if (!v31 || (v31[30] & 0x800) == 0)
            {
LABEL_50:
              [v31 _createCachesAndOptimizeState];
              goto LABEL_51;
            }
            long long v36 = v31;
            do
            {
              int v37 = v36[30];
              if ((v37 & 0x1000) != 0) {
                break;
              }
              v36[30] = v37 | 0x1000;
              long long v36 = (_DWORD *)*((void *)v36 + 10);
            }
            while (v36);
            goto LABEL_50;
          }
LABEL_51:
          ++v30;
        }
        while (v30 != v28);
        uint64_t v38 = [(__CFSet *)Mutable countByEnumeratingWithState:&v71 objects:v77 count:16];
        uint64_t v28 = v38;
        if (!v38)
        {
LABEL_55:
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          uint64_t v39 = [v26 countByEnumeratingWithState:&v67 objects:v76 count:16];
          if (v39)
          {
            uint64_t v40 = *(void *)v68;
            do
            {
              for (uint64_t j = 0; j != v39; ++j)
              {
                if (*(void *)v68 != v40) {
                  objc_enumerationMutation(v26);
                }
                CFSetRemoveValue(Mutable, *(const void **)(*((void *)&v67 + 1) + 8 * j));
              }
              uint64_t v39 = [v26 countByEnumeratingWithState:&v67 objects:v76 count:16];
            }
            while (v39);
          }
          ++v27;
          goto LABEL_29;
        }
      }
    }
    CFRelease(Mutable);
    [v26 removeAllObjects];
    unint64_t v42 = [(NSKnownKeysDictionary *)v62 count];
    if (v42)
    {
      for (uint64_t k = 0; k != v42; ++k)
      {
        v44 = *(_DWORD **)(v19 + 8 * k);
        if (-[NSEntityDescription _hasUniqueProperties]((BOOL)v44))
        {
          v45 = -[NSEntityDescription _checkSelfForNonCascadeNoInverses]((uint64_t)v44);
          if (v45)
          {
            if (v44)
            {
              v46 = v44;
              do
              {
                int v47 = v46[30];
                if ((v47 & 0x2000) != 0) {
                  break;
                }
                v46[30] = v47 | 0x2000;
                v46 = (_DWORD *)*((void *)v46 + 10);
              }
              while (v46);
            }
            uint64_t v48 = [v44 uniquenessConstraints];
            [v44 name];
            [v45 name];
            objc_msgSend((id)objc_msgSend(v45, "inverseRelationship"), "name");
            [v45 name];
            _NSCoreDataLog(1, @"Cannot use uniqueness constraints { %@ } on entity '%@' due to relationship '%@' having a mandatory to-one inverse relationship '%@' and not using a cascade delete rule on '%@'", v49, v50, v51, v52, v53, v54, v48);
          }
        }
      }
    }
    if (BYTE6(z9dsptsiQ80etb9782fsrs98bfdle88))
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      fetchRequestTemplates = self->_fetchRequestTemplates;
      uint64_t v56 = [(NSMutableDictionary *)fetchRequestTemplates countByEnumeratingWithState:&v63 objects:v75 count:16];
      if (v56)
      {
        uint64_t v57 = *(void *)v64;
        do
        {
          for (uint64_t m = 0; m != v56; ++m)
          {
            if (*(void *)v64 != v57) {
              objc_enumerationMutation(fetchRequestTemplates);
            }
            v59 = (void *)[(NSMutableDictionary *)self->_fetchRequestTemplates objectForKey:*(void *)(*((void *)&v63 + 1) + 8 * m)];
            [v59 allowEvaluation];
            [v59 _incrementInUseCounter];
          }
          uint64_t v56 = [(NSMutableDictionary *)fetchRequestTemplates countByEnumeratingWithState:&v63 objects:v75 count:16];
        }
        while (v56);
      }
    }
    -[NSManagedObjectModel _finalizeIndexes](self);
    if (v42 >= 6 && (int)+[_PFTask getNumActiveProcessors]() >= 2) {

    }
    [v61 drain];
  }
}

- (NSArray)entitiesForConfiguration:(NSString *)configuration
{
  if ((*(unsigned char *)&self->_managedObjectModelFlags & 2) != 0)
  {
    configurations = self->_configurations;
    return (NSArray *)-[NSMutableDictionary objectForKey:](configurations, "objectForKey:");
  }
  if (configuration)
  {
    configurations = self->_configurations;
    return (NSArray *)-[NSMutableDictionary objectForKey:](configurations, "objectForKey:");
  }
  return [(NSManagedObjectModel *)self entities];
}

+ (void)_newModelFromOptimizedEncoding:(uint64_t *)a3 error:
{
  v327[1] = *MEMORY[0x1E4F143B8];
  self;
  if (!a2) {
    return;
  }
  objc_opt_class();
  objc_opt_class();
  v327[0] = 0;
  BytePtr = (unsigned int *)CFDataGetBytePtr(a2);
  if ((unint64_t)[(__CFData *)a2 length] < 0x40) {
    return;
  }
  if (!memcmp("momv2$srsraori55717101jhus-[6910aathnnhi86786714[-;uadmiraenv143", BytePtr, 0x40uLL))
  {
    uint64_t v10 = 13;
  }
  else
  {
    if ((unint64_t)[(__CFData *)a2 length] < 0x40) {
      return;
    }
    if (memcmp("momv2$8129374fj;a30[5yo-]0-87ujuhok'p0907ljnlmmji870-oi43902[349", BytePtr, 0x40uLL))
    {
      if (!a3) {
        return;
      }
      uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F281F8];
      unint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = @"Unknown archive format";
      goto LABEL_31;
    }
    uint64_t v10 = 12;
  }
  unint64_t v11 = [(__CFData *)a2 length];
  if (v11 <= 0x9B)
  {
    if (!a3) {
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F281F8];
    unint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v9 = @"Corrupted archive: malformed header";
    goto LABEL_31;
  }
  unint64_t v326 = bswap32(BytePtr[16]);
  unsigned int v12 = BytePtr[18];
  uint64_t v13 = (char *)bswap32(v12);
  if (v13 > 0x10000) {
    goto LABEL_29;
  }
  LODWORD(v316) = BytePtr[20];
  uint64_t v14 = bswap32(v316);
  if (v14 > 0x10000) {
    goto LABEL_29;
  }
  unsigned int v15 = BytePtr[21];
  uint64_t v16 = bswap32(v15);
  if (v16 > 0x10000) {
    goto LABEL_29;
  }
  unsigned int v17 = BytePtr[22];
  uint64_t v18 = (uint64_t *)bswap32(v17);
  if (v18 > 0x10000) {
    goto LABEL_29;
  }
  LODWORD(v315) = BytePtr[23];
  uint64_t v19 = (uint64_t *)bswap32(v315);
  if (v19 > 0x10000) {
    goto LABEL_29;
  }
  unsigned int v20 = BytePtr[24];
  uint64_t v21 = (uint64_t *)bswap32(v20);
  if (v21 > 0x10000) {
    goto LABEL_29;
  }
  LODWORD(v314) = BytePtr[25];
  uint64_t v22 = (uint64_t *)bswap32(v314);
  if (v22 > 0x10000) {
    goto LABEL_29;
  }
  unint64_t v23 = v11;
  uint64_t v24 = BytePtr[27];
  uint64_t v25 = bswap32(v24);
  if (v25 > 0x10000) {
    goto LABEL_29;
  }
  unsigned int v26 = BytePtr[29];
  uint64_t v27 = bswap32(v26);
  if (v27 > 0x10000) {
    goto LABEL_29;
  }
  unsigned int v28 = BytePtr[31];
  uint64_t v29 = bswap32(v28);
  if (v29 > 0x10000
    || (unsigned int v30 = BytePtr[33], bswap32(v30) > 0x10000)
    || (v31 = BytePtr[35], unint64_t v32 = bswap32(v31), v32 > 0x10000)
    || (v313 = BytePtr[36], unsigned int v33 = bswap32(v313), v33 > 0x10000)
    || (unint64_t v34 = bswap32(BytePtr[37]), v34 > 0x10000)
    || (unint64_t v35 = bswap32(BytePtr[38]), v35 > 0x10000)
    || (unint64_t)v22 + v33 > v32)
  {
LABEL_29:
    if (!a3) {
      return;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F281F8];
    unint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v9 = @"Malformed archive: skipping";
LABEL_31:
    *a3 = objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 134060, objc_msgSend(v8, "dictionaryWithObject:forKey:", v9, @"Root cause"));
    return;
  }
  unsigned int v290 = v20;
  v291 = (unint64_t **)v10;
  unsigned int v287 = v31;
  unsigned int v288 = v12;
  uint64_t v306 = v27;
  unint64_t v294 = v34;
  unint64_t v293 = v35;
  v295 = v13;
  v297 = v22;
  uint64_t v296 = v32;
  int v301 = v24;
  uint64_t v307 = v25;
  v298 = v21;
  v299 = v19;
  uint64_t v303 = v14;
  v300 = v18;
  uint64_t v302 = v16;
  unsigned int v310 = v28;
  uint64_t v308 = v29;
  v311 = &v268;
  unsigned int v289 = BytePtr[17];
  LODWORD(v292) = BytePtr[19];
  LODWORD(v304) = BytePtr[26];
  LODWORD(v305) = BytePtr[28];
  unsigned int v36 = BytePtr[30];
  unint64_t v37 = bswap32(BytePtr[32]);
  unsigned int v286 = BytePtr[34];
  MEMORY[0x1F4188790](v24);
  uint64_t v312 = v40;
  if (v40 > 0x200)
  {
    v41 = (char *)NSAllocateScannedUncollectable();
    v309 = v41;
  }
  else
  {
    v309 = (char *)&v268 - v39;
    bzero((char *)&v268 - v39, 8 * v38);
  }
  unint64_t v325 = v37;
  uint64_t v42 = (v37 + 3) & 0x1FFFFFFFCLL;
  unint64_t v43 = v42 + 4;
  if (v42 + 4 <= v23)
  {
    unsigned int v44 = bswap32(*(unsigned int *)((char *)BytePtr + v42));
    unint64_t v325 = v43;
  }
  else
  {
    unsigned int v44 = 0;
  }
  if (v44 != v312)
  {
    if (!a3) {
      return;
    }
    uint64_t v53 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F281F8];
    v55 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v56 = @"Corrupted archive: Mismatched entity count";
    goto LABEL_99;
  }
  if (v30)
  {
    v45 = v309;
    uint64_t v46 = v312;
    while (1)
    {
      v41 = (char *)_readPFEncodedStringFromData((uint64_t)a2, (uint64_t)BytePtr, &v325, v23);
      if (!v41) {
        break;
      }
      *v45++ = v41;
      if (!--v46) {
        goto LABEL_44;
      }
    }
    if (!a3) {
      return;
    }
    uint64_t v53 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F281F8];
    v55 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v56 = @"Corrupted archive: failed to read property name";
LABEL_99:
    *a3 = objc_msgSend(v53, "errorWithDomain:code:userInfo:", v54, 134060, objc_msgSend(v55, "dictionaryWithObject:forKey:", v56, @"Root cause"));
    return;
  }
LABEL_44:
  uint64_t v47 = bswap32(v36);
  unsigned int v48 = v308;
  MEMORY[0x1F4188790](v41);
  uint64_t v51 = (unint64_t **)((char *)&v268 - v50);
  if (v48 > 0x200)
  {
    uint64_t v52 = NSAllocateScannedUncollectable();
    uint64_t v51 = (unint64_t **)v52;
  }
  else
  {
    bzero((char *)&v268 - v50, 8 * v49);
  }
  uint64_t v324 = v47;
  uint64_t v57 = (v47 + 3) & 0x1FFFFFFFCLL;
  uint64_t v58 = v57 + 4;
  if (v57 + 4 <= v23)
  {
    unsigned int v59 = bswap32(*(unsigned int *)((char *)BytePtr + v57));
    uint64_t v324 = v58;
  }
  else
  {
    unsigned int v59 = 0;
  }
  if (v59 != v48)
  {
    if (!a3) {
      return;
    }
    uint64_t v53 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F281F8];
    v55 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v56 = @"Corrupted archive: Mismatched string count";
    goto LABEL_99;
  }
  v285 = v51;
  if (v310)
  {
    v60 = v285;
    uint64_t v61 = v308;
    while (1)
    {
      id v62 = _newReadStringFromBytes((uint64_t)BytePtr, &v324, v23);
      if (!v62) {
        break;
      }
      long long v63 = v62;
      *v60++ = (unint64_t *)[v62 mutableCopy];

      if (!--v61) {
        goto LABEL_57;
      }
    }
    if (!a3) {
      return;
    }
    uint64_t v53 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F281F8];
    v55 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v56 = @"Corrupted archive: failed to read entity name or warning string";
    goto LABEL_99;
  }
LABEL_57:
  unint64_t v64 = bswap32(v305);
  uint64_t v65 = v306;
  MEMORY[0x1F4188790](v52);
  if (v65 > 0x200)
  {
    long long v68 = (char *)NSAllocateScannedUncollectable();
    v305 = v68;
  }
  else
  {
    v305 = (char *)&v268 - v67;
    bzero((char *)&v268 - v67, 8 * v66);
  }
  uint64_t v69 = v307;
  unint64_t v323 = v64;
  uint64_t v70 = (v64 + 3) & 0x1FFFFFFFCLL;
  unint64_t v71 = v70 + 4;
  if (v70 + 4 <= v23)
  {
    unsigned int v72 = bswap32(*(unsigned int *)((char *)BytePtr + v70));
    unint64_t v323 = v71;
  }
  else
  {
    unsigned int v72 = 0;
  }
  if (v72 != v65)
  {
    if (!a3) {
      return;
    }
    uint64_t v53 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F281F8];
    v55 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v56 = @"Corrupted archive: Mismatched data count";
    goto LABEL_99;
  }
  if (v26)
  {
    long long v73 = v305;
    uint64_t v74 = v65;
    while (1)
    {
      long long v68 = (char *)_readPFEncodedDataFromData((uint64_t)a2, (uint64_t)BytePtr, &v323, v23);
      if (!v68) {
        break;
      }
      *v73++ = v68;
      if (!--v74) {
        goto LABEL_72;
      }
    }
    if (!a3) {
      return;
    }
    uint64_t v53 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F281F8];
    v55 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v56 = @"Corrupted archive: failed to read data";
    goto LABEL_99;
  }
LABEL_72:
  uint64_t v75 = MEMORY[0x1F4188790](v68);
  v77 = (void **)((char *)&v268 - (((unint64_t)v76 + 15) & 0xFFFFFFFF0));
  unint64_t v322 = v78;
  uint64_t v79 = (v78 + 3) & 0x1FFFFFFFCLL;
  unint64_t v80 = v79 + 4;
  if (v79 + 4 <= v23)
  {
    unsigned int v81 = bswap32(*(unsigned int *)((char *)BytePtr + v79));
    unint64_t v322 = v80;
  }
  else
  {
    unsigned int v81 = 0;
  }
  if (v81 != v69)
  {
    if (!a3) {
      return;
    }
    uint64_t v53 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F281F8];
    v55 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v56 = @"Corrupted archive: Mismatched strategy count";
    goto LABEL_99;
  }
  if (!v301)
  {
    MEMORY[0x1F4188790](v75);
    v91 = (NSMutableDictionary **)((char *)&v268 - ((v92 + 15) & 0xFFFFFFFF0));
    Class v90 = NSClassFromString((NSString *)@"NSKnownKeysDictionary2");
    goto LABEL_92;
  }
  v304 = v76;
  v82 = (uint64_t *)((char *)&v268 - (((unint64_t)v76 + 15) & 0xFFFFFFFF0));
  uint64_t v83 = v69;
  do
  {
    uint64_t v84 = _newReadKKDMappingStrategyFromByes((uint64_t)a2, (uint64_t)BytePtr, &v322, v23, (uint64_t)v309);
    if (!v84)
    {
      if (!a3) {
        return;
      }
      uint64_t v53 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v54 = *MEMORY[0x1E4F281F8];
      v55 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v56 = @"Corrupted archive: failed to read kkd strategy";
      goto LABEL_99;
    }
    *v82++ = v84;
    --v83;
  }
  while (v83);
  MEMORY[0x1F4188790](v84);
  v86 = v77;
  v87 = (NSMutableDictionary **)((char *)&v268 - ((v85 + 15) & 0xFFFFFFFF0));
  Class v88 = NSClassFromString((NSString *)@"NSKnownKeysDictionary2");
  uint64_t v89 = 0;
  do
  {
    Class v90 = (Class)[(objc_class *)v88 newInstanceWithSearchStrategy:v86[v89] inData:a2];
    v87[v89++] = (NSMutableDictionary *)v90;
  }
  while (v307 != v89);
  v91 = v87;
  v77 = v86;
LABEL_92:
  MEMORY[0x1F4188790](v90);
  v95 = (char *)&v268 - v94;
  v284 = v77;
  if (v96 >= 0x1FF)
  {
    uint64_t v97 = NSAllocateScannedUncollectable();
    v95 = (char *)v97;
    if (!v97)
    {
      if (a3) {
        *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to allocate properties buffer", @"Root cause"));
      }
      if (v310)
      {
        uint64_t v122 = v308;
        v123 = (void **)v285;
        do
        {
          v124 = *v123++;

          --v122;
        }
        while (v122);
      }
      return;
    }
  }
  else
  {
    bzero((char *)&v268 - v94, 8 * v93);
  }
  MEMORY[0x1F4188790](v97);
  v100 = (uint64_t *)((char *)&v268 - v99);
  if (v101 > 0x1FE)
  {
    uint64_t v102 = NSAllocateScannedUncollectable();
    v100 = (uint64_t *)v102;
    if (!v102)
    {
      if (a3) {
        *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to allocate attributes buffer", @"Root cause"));
      }
      if (v303 >= 0x1FF) {
        NSZoneFree(0, v95);
      }
      if (v310)
      {
        uint64_t v130 = v308;
        v131 = (void **)v285;
        do
        {
          v132 = *v131++;

          --v130;
        }
        while (v130);
      }
      return;
    }
  }
  else
  {
    bzero((char *)&v268 - v99, 8 * v98);
  }
  uint64_t v103 = MEMORY[0x1F4188790](v102);
  v283 = (void **)v267;
  v267[0] = 0;
  v267[1] = 0;
  MEMORY[0x1F4188790](v103);
  v106 = (char *)&v268 - v105;
  v281 = v91;
  if (v107 > 0x1FE)
  {
    uint64_t v108 = NSAllocateScannedUncollectable();
    v106 = (char *)v108;
    if (!v108)
    {
      if (a3) {
        *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to allocate derived attributes buffer", @"Root cause"));
      }
      if (v302 >= 0x1FF) {
        NSZoneFree(0, v100);
      }
      if (v303 >= 0x1FF) {
        NSZoneFree(0, v95);
      }
      if (v310)
      {
        uint64_t v137 = v308;
        v138 = (void **)v285;
        do
        {
          v139 = *v138++;

          --v137;
        }
        while (v137);
      }
      return;
    }
  }
  else
  {
    bzero((char *)&v268 - v105, 8 * v104);
  }
  MEMORY[0x1F4188790](v108);
  v111 = (uint64_t *)((char *)&v268 - v110);
  if (v112 > 0x1FE)
  {
    uint64_t v113 = NSAllocateScannedUncollectable();
    v111 = (uint64_t *)v113;
    if (!v113)
    {
      if (a3) {
        *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to allocate relationships buffer", @"Root cause"));
      }
      if (v300 >= 0x1FF) {
        NSZoneFree(0, v106);
      }
      if (v302 >= 0x1FF) {
        NSZoneFree(0, v100);
      }
      if (v303 >= 0x1FF) {
        NSZoneFree(0, v95);
      }
      if (v310)
      {
        uint64_t v144 = v308;
        v145 = (void **)v285;
        do
        {
          v146 = *v145++;

          --v144;
        }
        while (v144);
      }
      return;
    }
  }
  else
  {
    bzero((char *)&v268 - v110, 8 * v109);
  }
  v282 = v111;
  v304 = (uint64_t *)v106;
  v280 = v95;
  MEMORY[0x1F4188790](v113);
  if (v116 > 0x1FE)
  {
    v117 = (uint64_t *)NSAllocateScannedUncollectable();
    v279 = v117;
    if (!v117)
    {
      if (a3) {
        *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to allocate expressions buffer", @"Root cause"));
      }
      if (v299 >= 0x1FF) {
        NSZoneFree(0, v282);
      }
      if (v300 >= 0x1FF) {
        NSZoneFree(0, v304);
      }
      if (v302 >= 0x1FF) {
        NSZoneFree(0, v100);
      }
      if (v303 >= 0x1FF) {
        NSZoneFree(0, v280);
      }
      if (v310)
      {
        uint64_t v150 = v308;
        v151 = (void **)v285;
        do
        {
          v152 = *v151++;

          --v150;
        }
        while (v150);
      }
      return;
    }
  }
  else
  {
    v279 = (uint64_t *)((char *)&v268 - v115);
    bzero((char *)&v268 - v115, 8 * v114);
  }
  MEMORY[0x1F4188790](v117);
  if (v120 > 0x1FE)
  {
    v121 = (uint64_t *)NSAllocateScannedUncollectable();
    v277 = v121;
    if (!v121)
    {
      if (a3) {
        *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to allocate fetched properties buffer", @"Root cause"));
      }
      if (v298 >= 0x1FF) {
        NSZoneFree(0, v279);
      }
      if (v299 >= 0x1FF) {
        NSZoneFree(0, v282);
      }
      if (v300 >= 0x1FF) {
        NSZoneFree(0, v304);
      }
      if (v302 >= 0x1FF) {
        NSZoneFree(0, v100);
      }
      if (v303 >= 0x1FF) {
        NSZoneFree(0, v280);
      }
      if (v310)
      {
        uint64_t v179 = v308;
        v180 = (void **)v285;
        do
        {
          v181 = *v180++;

          --v179;
        }
        while (v179);
      }
      return;
    }
  }
  else
  {
    v277 = (uint64_t *)((char *)&v268 - v119);
    bzero((char *)&v268 - v119, 8 * v118);
  }
  MEMORY[0x1F4188790](v121);
  if (v127 > 0x1FE)
  {
    uint64_t v129 = NSAllocateScannedUncollectable();
    v128 = (char *)v129;
    if (!v129)
    {
      if (a3) {
        *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to allocate fetch requests buffer", @"Root cause"));
      }
      if (v297 >= 0x1FF) {
        NSZoneFree(0, v277);
      }
      if (v298 >= 0x1FF) {
        NSZoneFree(0, v279);
      }
      if (v299 >= 0x1FF) {
        NSZoneFree(0, v282);
      }
      if (v300 >= 0x1FF) {
        NSZoneFree(0, v304);
      }
      if (v302 >= 0x1FF) {
        NSZoneFree(0, v100);
      }
      if (v303 >= 0x1FF) {
        NSZoneFree(0, v280);
      }
      if (v310)
      {
        uint64_t v183 = v308;
        v184 = (void **)v285;
        do
        {
          v185 = *v184++;

          --v183;
        }
        while (v183);
      }
      return;
    }
  }
  else
  {
    v128 = (char *)&v268 - v126;
    bzero((char *)&v268 - v126, 8 * v125);
  }
  MEMORY[0x1F4188790](v129);
  v278 = (char *)&v268 - v134;
  if (v135 > 0x1FE)
  {
    v136 = (char *)NSAllocateScannedUncollectable();
    v278 = v136;
    if (!v136)
    {
      if (a3) {
        *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to allocate entities buffer", @"Root cause"));
      }
      if (v296 >= 0x1FF) {
        NSZoneFree(0, v128);
      }
      if (v297 >= 0x1FF) {
        NSZoneFree(0, v277);
      }
      if (v298 >= 0x1FF) {
        NSZoneFree(0, v279);
      }
      if (v299 >= 0x1FF) {
        NSZoneFree(0, v282);
      }
      if (v300 >= 0x1FF) {
        NSZoneFree(0, v304);
      }
      if (v302 >= 0x1FF) {
        NSZoneFree(0, v100);
      }
      if (v303 >= 0x1FF) {
        NSZoneFree(0, v280);
      }
      if (v310)
      {
        uint64_t v186 = v308;
        v187 = (void **)v285;
        do
        {
          v188 = *v187++;

          --v186;
        }
        while (v186);
      }
      return;
    }
  }
  else
  {
    bzero(v278, 8 * v133);
  }
  MEMORY[0x1F4188790](v136);
  v276 = (char *)&v268 - v141;
  if (v142 > 0x1FE)
  {
    v143 = (char *)NSAllocateScannedUncollectable();
    v276 = v143;
    if (!v143)
    {
      if (a3) {
        *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to allocate fetchIndexes buffer", @"Root cause"));
      }
      if (v295 >= 0x1FF) {
        NSZoneFree(0, v278);
      }
      if (v296 >= 0x1FF) {
        NSZoneFree(0, v128);
      }
      if (v297 >= 0x1FF) {
        NSZoneFree(0, v277);
      }
      if (v298 >= 0x1FF) {
        NSZoneFree(0, v279);
      }
      if (v299 >= 0x1FF) {
        NSZoneFree(0, v282);
      }
      if (v300 >= 0x1FF) {
        NSZoneFree(0, v304);
      }
      if (v302 >= 0x1FF) {
        NSZoneFree(0, v100);
      }
      if (v303 >= 0x1FF) {
        NSZoneFree(0, v280);
      }
      if (v310)
      {
        uint64_t v189 = v308;
        v190 = (void **)v285;
        do
        {
          v191 = *v190++;

          --v189;
        }
        while (v189);
      }
      return;
    }
  }
  else
  {
    bzero(v276, 8 * v140);
  }
  MEMORY[0x1F4188790](v143);
  v275 = (char *)&v268 - v148;
  if (v149 > 0x1FE)
  {
    v275 = (char *)NSAllocateScannedUncollectable();
    if (!v275)
    {
      if (a3) {
        *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to allocate entities buffer", @"Root cause"));
      }
      if (v294 >= 0x1FF) {
        NSZoneFree(0, v276);
      }
      if (v295 >= 0x1FF) {
        NSZoneFree(0, v278);
      }
      if (v296 >= 0x1FF) {
        NSZoneFree(0, v128);
      }
      if (v297 >= 0x1FF) {
        NSZoneFree(0, v277);
      }
      if (v298 >= 0x1FF) {
        NSZoneFree(0, v279);
      }
      if (v299 >= 0x1FF) {
        NSZoneFree(0, v282);
      }
      if (v300 >= 0x1FF) {
        NSZoneFree(0, v304);
      }
      if (v302 >= 0x1FF) {
        NSZoneFree(0, v100);
      }
      if (v303 >= 0x1FF) {
        NSZoneFree(0, v280);
      }
      if (v310)
      {
        uint64_t v193 = v308;
        v194 = (void **)v285;
        do
        {
          v195 = *v194++;

          --v193;
        }
        while (v193);
      }
      return;
    }
  }
  else
  {
    bzero(v275, 8 * v147);
  }
  v153 = (objc_class *)objc_opt_class();
  int v154 = v302;
  unsigned int v155 = _PFAllocateObjects(v153, (void **)v100, v302, 0);
  if (v155 != v154)
  {
    unsigned int v182 = v155;
    if (a3) {
      *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to create attributes", @"Root cause"));
    }
    goto LABEL_451;
  }
  objc_opt_class();
  v156 = (objc_class *)objc_opt_class();
  int v157 = (int)v300;
  unsigned int v158 = _PFAllocateObjects(v156, (void **)v304, v300, 0);
  if (v158 != v157)
  {
    unsigned int v192 = v158;
    if (a3) {
      *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to create derived attributes", @"Root cause"));
    }
    goto LABEL_448;
  }
  v159 = (objc_class *)objc_opt_class();
  int v160 = (int)v299;
  unsigned int v161 = _PFAllocateObjects(v159, (void **)v282, v299, 0);
  if (v161 != v160)
  {
    unsigned int v196 = v161;
    if (a3) {
      *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to create relationships", @"Root cause"));
    }
    goto LABEL_445;
  }
  v162 = (objc_class *)objc_opt_class();
  int v163 = (int)v298;
  unsigned int v164 = _PFAllocateObjects(v162, (void **)v279, v298, 0);
  if (v164 != v163)
  {
    unsigned int v197 = v164;
    if (a3) {
      *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to create expressions", @"Root cause"));
    }
    goto LABEL_442;
  }
  v165 = (objc_class *)objc_opt_class();
  int v166 = (int)v297;
  LODWORD(v274) = _PFAllocateObjects(v165, (void **)v277, v297, 0);
  if (v274 != v166)
  {
    if (a3) {
      *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to create fetched properties", @"Root cause"));
    }
    goto LABEL_439;
  }
  v167 = (objc_class *)objc_opt_class();
  int v168 = v296;
  LODWORD(v274) = _PFAllocateObjects(v167, (void **)v128, v296, 0);
  if (v274 != v168)
  {
    if (a3) {
      *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to create fetch requests", @"Root cause"));
    }
    goto LABEL_436;
  }
  v169 = (objc_class *)objc_opt_class();
  int v170 = (int)v295;
  LODWORD(v274) = _PFAllocateObjects(v169, (void **)v278, v295, 0);
  if (v274 != v170)
  {
    if (a3) {
      *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to create entities", @"Root cause"));
    }
    goto LABEL_433;
  }
  v171 = (objc_class *)objc_opt_class();
  int v172 = v294;
  LODWORD(v274) = _PFAllocateObjects(v171, (void **)v276, v294, 0);
  if (v274 != v172)
  {
    if (a3) {
      *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to create fetchIndexDescriptions", @"Root cause"));
    }
    goto LABEL_430;
  }
  v173 = (objc_class *)objc_opt_class();
  int v174 = v293;
  LODWORD(v274) = _PFAllocateObjects(v173, (void **)v275, v293, 0);
  if (v274 != v174)
  {
    if (a3) {
      *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Allocation failure: unable to create fetchIndexElementDescriptions", @"Root cause"));
    }
    goto LABEL_427;
  }
  unint64_t v175 = bswap32(v292);
  unint64_t v321 = v175;
  uint64_t v176 = (v175 + 3) & 0x1FFFFFFFCLL;
  unint64_t v177 = v176 + 4;
  if (v176 + 4 <= v23)
  {
    unsigned int v178 = bswap32(*(unsigned int *)((char *)BytePtr + v176));
    unint64_t v321 = v177;
    unint64_t v175 = v177;
  }
  else
  {
    unsigned int v178 = 0;
  }
  if (v178 != v302)
  {
    if (a3)
    {
      v201 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v202 = *MEMORY[0x1E4F281F8];
      v203 = (void *)MEMORY[0x1E4F1C9E8];
      v204 = @"Corrupt archive: mismatch between header and contents for attribute count";
      goto LABEL_422;
    }
    goto LABEL_424;
  }
  uint64_t v198 = (v175 + 3) & 0x7FFFFFFFCLL;
  unint64_t v199 = v198 + 4;
  if (v198 + 4 <= v23)
  {
    unsigned int v200 = bswap32(*(unsigned int *)((char *)BytePtr + v198));
    unint64_t v321 = v199;
    unint64_t v175 = v199;
  }
  else
  {
    unsigned int v200 = 0;
  }
  if (v200 != v300)
  {
    if (a3)
    {
      v201 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v202 = *MEMORY[0x1E4F281F8];
      v203 = (void *)MEMORY[0x1E4F1C9E8];
      v204 = @"Corrupt archive: mismatch between header and contents for derived attribute count";
      goto LABEL_422;
    }
    goto LABEL_424;
  }
  uint64_t v205 = (v175 + 3) & 0x1FFFFFFFFCLL;
  unint64_t v206 = v205 + 4;
  if (v205 + 4 <= v23)
  {
    unsigned int v207 = bswap32(*(unsigned int *)((char *)BytePtr + v205));
    unint64_t v321 = v206;
    unint64_t v175 = v206;
  }
  else
  {
    unsigned int v207 = 0;
  }
  if (v207 != v299)
  {
    if (a3)
    {
      v201 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v202 = *MEMORY[0x1E4F281F8];
      v203 = (void *)MEMORY[0x1E4F1C9E8];
      v204 = @"Corrupt archive: mismatch between header and contents for relationship count";
      goto LABEL_422;
    }
    goto LABEL_424;
  }
  uint64_t v208 = (v175 + 3) & 0x7FFFFFFFFCLL;
  unint64_t v209 = v208 + 4;
  if (v208 + 4 <= v23)
  {
    unsigned int v210 = bswap32(*(unsigned int *)((char *)BytePtr + v208));
    unint64_t v321 = v209;
    unint64_t v175 = v209;
  }
  else
  {
    unsigned int v210 = 0;
  }
  if (v210 != v298)
  {
    if (a3)
    {
      v201 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v202 = *MEMORY[0x1E4F281F8];
      v203 = (void *)MEMORY[0x1E4F1C9E8];
      v204 = @"Corrupt archive: mismatch between header and contents for expression count";
      goto LABEL_422;
    }
    goto LABEL_424;
  }
  uint64_t v211 = (v175 + 3) & 0x1FFFFFFFFFCLL;
  unint64_t v212 = v211 + 4;
  if (v211 + 4 <= v23)
  {
    unsigned int v213 = bswap32(*(unsigned int *)((char *)BytePtr + v211));
    unint64_t v321 = v212;
  }
  else
  {
    unsigned int v213 = 0;
  }
  if (v213 != v297)
  {
    if (a3)
    {
      v201 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v202 = *MEMORY[0x1E4F281F8];
      v203 = (void *)MEMORY[0x1E4F1C9E8];
      v204 = @"Corrupt archive: mismatch between header and contents for fetched properties count";
      goto LABEL_422;
    }
    goto LABEL_424;
  }
  if (v15) {
    uint64_t v292 = *v100;
  }
  else {
    uint64_t v292 = 0;
  }
  if (v17) {
    uint64_t v274 = *v304;
  }
  else {
    uint64_t v274 = 0;
  }
  if (v315) {
    uint64_t v273 = *v282;
  }
  else {
    uint64_t v273 = 0;
  }
  if (v290) {
    uint64_t v272 = *v279;
  }
  else {
    uint64_t v272 = 0;
  }
  if (v314) {
    uint64_t v314 = *v277;
  }
  else {
    uint64_t v314 = 0;
  }
  if (v316)
  {
    uint64_t v214 = 0;
    uint64_t v268 = 0;
    uint64_t v269 = 0;
    uint64_t v270 = 0;
    uint64_t v271 = 0;
    uint64_t v316 = 0;
    uint64_t v215 = 0;
    uint64_t v216 = 0;
    do
    {
      v217 = (void *)_readPropertyIntoShellFromBytes((uint64_t)a2, (uint64_t)BytePtr, &v321, v23, (uint64_t)v278, (uint64_t)v280, (uint64_t)v128, v292, v274, v316, v273, v272, v314, (uint64_t)v309, (uint64_t)v285, (uint64_t)v305, (unint64_t)v291, (unint64_t *)v327);
      if (!v217)
      {
        if (!a3) {
          goto LABEL_424;
        }
        uint64_t v230 = v327[0];
        if (v327[0]) {
          goto LABEL_386;
        }
        v201 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v202 = *MEMORY[0x1E4F281F8];
        v254 = (void *)MEMORY[0x1E4F1C9E8];
        v255 = NSString;
        v267[0] = v214;
        v256 = @"Corrupt archive: unable to read property at index: %lu";
        goto LABEL_464;
      }
      *((void *)v280 + v214) = v217;
      if ((void *)v100[v216] == v217)
      {
        if (++v216 != v302)
        {
          v218 = (uint64_t *)v100[v216];
          v219 = (uint64_t **)&v324;
          goto LABEL_373;
        }
        uint64_t v292 = 0;
        uint64_t v216 = v302;
      }
      else
      {
        if (v283[v215] == v217)
        {
          if (__CFADD__(v215++, 1))
          {
            uint64_t v215 = 0;
            uint64_t v316 = 0;
          }
          else
          {
            uint64_t v316 = (uint64_t)v283[v215];
          }
          goto LABEL_374;
        }
        if ((void *)v304[v271] == v217)
        {
          if ((uint64_t *)++v271 == v300)
          {
            uint64_t v274 = 0;
            v218 = v300;
            v219 = (uint64_t **)&v305;
          }
          else
          {
            v218 = (uint64_t *)v304[v271];
            v219 = (uint64_t **)&v308;
          }
          goto LABEL_373;
        }
        if ((void *)v282[v270] == v217)
        {
          if ((uint64_t *)++v270 == v299)
          {
            uint64_t v273 = 0;
            v218 = v299;
            v219 = &v304;
          }
          else
          {
            v218 = (uint64_t *)v282[v270];
            v219 = (uint64_t **)&v307;
          }
          goto LABEL_373;
        }
        if ((void *)v279[v269] == v217)
        {
          if ((uint64_t *)++v269 == v298)
          {
            uint64_t v272 = 0;
            v218 = v298;
            v219 = (uint64_t **)&v303;
          }
          else
          {
            v218 = (uint64_t *)v279[v269];
            v219 = (uint64_t **)&v306;
          }
          goto LABEL_373;
        }
        if ((uint64_t *)++v268 == v297)
        {
          uint64_t v314 = 0;
          v218 = v297;
          v219 = (uint64_t **)&v302;
LABEL_373:
          *(v219 - 32) = v218;
          goto LABEL_374;
        }
        uint64_t v314 = v277[v268];
      }
LABEL_374:
      ++v214;
    }
    while (v303 != v214);
  }
  uint64_t v316 = objc_opt_class();
  if (!v315)
  {
LABEL_382:
    uint64_t v320 = bswap32(v289);
    uint64_t v227 = (v320 + 3) & 0x1FFFFFFFCLL;
    uint64_t v228 = v227 + 4;
    if (v227 + 4 <= v23)
    {
      unsigned int v229 = bswap32(*(unsigned int *)((char *)BytePtr + v227));
      uint64_t v320 = v228;
    }
    else
    {
      unsigned int v229 = 0;
    }
    if (v229 != v295)
    {
      if (a3)
      {
        v201 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v202 = *MEMORY[0x1E4F281F8];
        v203 = (void *)MEMORY[0x1E4F1C9E8];
        v204 = @"Corrupt archive: mismatch between header and contents for entity count";
        goto LABEL_422;
      }
      goto LABEL_424;
    }
    if (v288)
    {
      uint64_t v316 = 0;
      unint64_t v231 = 0;
      unint64_t v232 = 0;
      v233 = v275;
      v315 = v276;
      while (1)
      {
        unint64_t v319 = v294 - v232;
        unint64_t v318 = v293 - v231;
        if ((_readEntityIntoShellFromData(a2, (uint64_t)BytePtr, &v320, v23, *(void *)&v278[8 * v316], (uint64_t)v281, (uint64_t)v280, (uint64_t)v315, &v319, (uint64_t)v233, &v318, (uint64_t)v309, v285, (uint64_t)v305, (uint64_t)v278, (uint64_t)v284, v291, v327) & 1) == 0)break; {
        v232 += v319;
        }
        if (v232 > v294 || (v231 += v318, v231 > v293))
        {
          _NSCoreDataLog(1, @"Bad: decoding optimized model smashed memory. Bailing.", v234, v235, v236, v237, v238, v239, v268);
          __break(1u);
          return;
        }
        v315 += 8 * v319;
        v233 += 8 * v318;
        if (v295 == (char *)++v316) {
          goto LABEL_395;
        }
      }
      if (!a3) {
        goto LABEL_424;
      }
      uint64_t v247 = v327[0];
      if (!v327[0])
      {
        v201 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v202 = *MEMORY[0x1E4F281F8];
        v254 = (void *)MEMORY[0x1E4F1C9E8];
        v255 = NSString;
        v267[0] = v316;
        v256 = @"Corrupt archive: unable to read entity at index: %lu";
        goto LABEL_464;
      }
    }
    else
    {
LABEL_395:
      unint64_t v317 = bswap32(v286);
      unint64_t v240 = (v317 + 3) & 0x1FFFFFFFCLL;
      unint64_t v241 = v240 + 4;
      if (v240 + 4 <= v23)
      {
        unsigned int v242 = bswap32(*(unsigned int *)((char *)BytePtr + v240));
        unint64_t v317 = v241;
      }
      else
      {
        unsigned int v242 = 0;
      }
      if (v242 == v296)
      {
        if (!v287)
        {
LABEL_407:
          if (v302 >= 0x1FF) {
            NSZoneFree(0, v100);
          }
          if (v299 >= 0x1FF) {
            NSZoneFree(0, v282);
          }
          if (v297 >= 0x1FF) {
            NSZoneFree(0, v277);
          }
          if (v290)
          {
            v245 = 0;
            do
            {

              v245 = (uint64_t *)((char *)v245 + 1);
            }
            while (v298 != v245);
            if (v298 >= 0x1FF) {
              NSZoneFree(0, v279);
            }
          }
          if (v313) {
            v246 = v281[1];
          }
          else {
            v246 = 0;
          }
          v257 = _newReadModelFromBytes((uint64_t)a2, (uint64_t)BytePtr, &v326, v23, *v281, v246, (uint64_t)v278, (uint64_t)v128, (uint64_t)v309, (uint64_t)v305);
          if (v257 && v288)
          {
            v258 = (uint64_t *)v278;
            v259 = v295;
            do
            {
              uint64_t v260 = *v258++;
              *(void *)(v260 + 40) = v257;
              --v259;
            }
            while (v259);
          }
          if (v310)
          {
            v261 = (void **)v285;
            uint64_t v262 = v308;
            do
            {
              v263 = *v261++;

              --v262;
            }
            while (v262);
          }
          if (v287)
          {
            v264 = (void **)v128;
            uint64_t v265 = v296;
            do
            {
              v266 = *v264++;

              --v265;
            }
            while (v265);
          }
          if (v295 >= 0x1FF) {
            NSZoneFree(0, v278);
          }
          if (v303 >= 0x1FF) {
            NSZoneFree(0, v280);
          }
          if (v296 >= 0x1FF) {
            NSZoneFree(0, v128);
          }
          if (v312 >= 0x201) {
            NSZoneFree(0, v309);
          }
          if (v306 >= 0x201) {
            NSZoneFree(0, v305);
          }
          if (v308 >= 0x201) {
            NSZoneFree(0, v285);
          }
          if (v293 >= 0x1FF) {
            NSZoneFree(0, v275);
          }
          return;
        }
        uint64_t v244 = 0;
        while ((_readFetchRequestIntoShellFromData(a2, (uint64_t)BytePtr, &v317, v23, *(void *)&v128[8 * v244], (uint64_t)v281, (uint64_t)v280, (uint64_t)v309, (uint64_t)v285, (uint64_t)v305, (uint64_t)v278, (uint64_t)v284, (uint64_t)v291, v327) & 1) != 0)
        {
          if (v296 == ++v244) {
            goto LABEL_407;
          }
        }
        if (!a3) {
          goto LABEL_424;
        }
        uint64_t v230 = v327[0];
        if (v327[0])
        {
LABEL_386:
          *a3 = v230;
          goto LABEL_424;
        }
        v201 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v202 = *MEMORY[0x1E4F281F8];
        v254 = (void *)MEMORY[0x1E4F1C9E8];
        v255 = NSString;
        v267[0] = v244;
        v256 = @"Corrupt archive: unable to read fetch request at index: %lu";
LABEL_464:
        v204 = (__CFString *)objc_msgSend(v255, "stringWithFormat:", v256, v267[0]);
        v203 = v254;
      }
      else
      {
        if (!a3) {
          goto LABEL_424;
        }
        v201 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v202 = *MEMORY[0x1E4F281F8];
        v203 = (void *)MEMORY[0x1E4F1C9E8];
        v204 = @"Corrupt archive: mismatch between header and contents for fetch request count";
      }
LABEL_422:
      uint64_t v247 = objc_msgSend(v201, "errorWithDomain:code:userInfo:", v202, 134060, objc_msgSend(v203, "dictionaryWithObject:forKey:", v204, @"Root cause", v268));
    }
    *a3 = v247;
    goto LABEL_424;
  }
  v221 = (id *)v282;
  v222 = v299;
  while (1)
  {
    v223 = (id *)*v221;
    v224 = objc_msgSend(*v221, "inverseRelationship", v268);
    if (v224) {
      break;
    }
LABEL_381:
    ++v221;
    v222 = (uint64_t *)((char *)v222 - 1);
    if (!v222) {
      goto LABEL_382;
    }
  }
  uint64_t v225 = [v224 unsignedIntegerValue];
  v226 = (void *)*((void *)v280 + v225);
  if (objc_opt_class() == v316)
  {
    if (v223)
    {

      v223[14] = v226;
    }
    goto LABEL_381;
  }
  if (a3)
  {
    v201 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v202 = *MEMORY[0x1E4F281F8];
    v243 = (void *)MEMORY[0x1E4F1C9E8];
    v204 = (__CFString *)[NSString stringWithFormat:@"Corrupt archive: relationship with name (%@) has bad inverse index %@", objc_msgSend(v223, "name"), v226];
    v203 = v243;
    goto LABEL_422;
  }
LABEL_424:
  if (v303 >= 0x1FF) {
    NSZoneFree(0, v280);
  }
  LODWORD(v274) = v293;
LABEL_427:
  _PFDeallocateObjects((void **)v275, v274);
  if (v293 >= 0x1FF) {
    NSZoneFree(0, v275);
  }
  LODWORD(v274) = v294;
LABEL_430:
  _PFDeallocateObjects((void **)v276, v274);
  if (v294 >= 0x1FF) {
    NSZoneFree(0, v276);
  }
  LODWORD(v274) = v295;
LABEL_433:
  _PFDeallocateObjects((void **)v278, v274);
  if (v295 >= 0x1FF) {
    NSZoneFree(0, v278);
  }
  LODWORD(v274) = v296;
LABEL_436:
  _PFDeallocateObjects((void **)v128, v274);
  if (v296 >= 0x1FF) {
    NSZoneFree(0, v128);
  }
  LODWORD(v274) = v297;
LABEL_439:
  _PFDeallocateObjects((void **)v277, v274);
  if (v297 >= 0x1FF) {
    NSZoneFree(0, v277);
  }
  unsigned int v197 = v298;
LABEL_442:
  _PFDeallocateObjects((void **)v279, v197);
  if (v298 >= 0x1FF) {
    NSZoneFree(0, v279);
  }
  unsigned int v196 = v299;
LABEL_445:
  _PFDeallocateObjects((void **)v282, v196);
  if (v299 >= 0x1FF) {
    NSZoneFree(0, v282);
  }
  unsigned int v192 = v300;
LABEL_448:
  _PFDeallocateObjects((void **)v304, v192);
  if (v300 >= 0x1FF) {
    NSZoneFree(0, v304);
  }
  _PFDeallocateObjects(v283, 0);
  unsigned int v182 = v302;
LABEL_451:
  _PFDeallocateObjects((void **)v100, v182);
  if (v302 >= 0x1FF) {
    NSZoneFree(0, v100);
  }
  uint64_t v248 = v308;
  v249 = (void **)v285;
  if (v310)
  {
    do
    {
      v250 = *v249++;

      --v248;
    }
    while (v248);
  }
  if (v301)
  {
    uint64_t v251 = v307;
    v252 = v284;
    do
    {
      v253 = *v252++;

      --v251;
    }
    while (v251);
  }
}

- (NSDictionary)entitiesByName
{
  return &self->_entities->super;
}

- (NSSet)versionIdentifiers
{
  return self->_versionIdentifiers;
}

- (id)_entityVersionHashesByNameInStyle:(id)result
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = (void *)[result entitiesByName];
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
          uint64_t v10 = (void *)MEMORY[0x18C127630]();
          objc_msgSend(v4, "setValue:forKey:", -[NSEntityDescription _versionHashInStyle:]((unint64_t *)objc_msgSend(v3, "objectForKey:", v9), a2), v9);
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    return v4;
  }
  return result;
}

- (NSDictionary)entityVersionHashesByName
{
  return (NSDictionary *)-[NSManagedObjectModel _entityVersionHashesByNameInStyle:](self, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    objc_msgSend(v4, "_setModelsReferenceIDOffset:", -[NSManagedObjectModel _modelsReferenceIDOffset](self, "_modelsReferenceIDOffset"));
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    entities = self->_entities;
    uint64_t v7 = [(NSMutableDictionary *)entities countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v43 != v9) {
            objc_enumerationMutation(entities);
          }
          long long v11 = (void *)[(NSMutableDictionary *)self->_entities objectForKey:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          if (![v11 superentity])
          {
            long long v12 = (void *)[v11 copy];
            +[NSManagedObjectModel _deepCollectEntitiesInArray:entity:]((uint64_t)NSManagedObjectModel, v5, v12);
          }
        }
        uint64_t v8 = [(NSMutableDictionary *)entities countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v8);
    }
    [v4 setEntities:v5];

    id v13 = *self->_additionalPrivateIvars;
    if (v13)
    {
      long long v14 = (void *)[v13 copy];
      [v4 _setLocalizationPolicy:v14];
    }
    obuint64_t j = self->_configurations;
    if (obj)
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v15 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v39;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v39 != v17) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void *)(*((void *)&v38 + 1) + 8 * j);
            id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            uint64_t v21 = [(NSManagedObjectModel *)self entitiesForConfiguration:v19];
            uint64_t v22 = [(NSArray *)v21 count];
            if (v22)
            {
              uint64_t v23 = v22;
              for (uint64_t k = 0; k != v23; ++k)
                objc_msgSend(v20, "addObject:", objc_msgSend(v4[4], "objectForKey:", objc_msgSend(-[NSArray objectAtIndex:](v21, "objectAtIndex:", k), "name")));
            }
            [v4 setEntities:v20 forConfiguration:v19];
          }
          uint64_t v16 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v38 objects:v47 count:16];
        }
        while (v16);
      }
    }
    fetchRequestTemplates = self->_fetchRequestTemplates;
    if (fetchRequestTemplates)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v26 = [(NSMutableDictionary *)fetchRequestTemplates countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v35;
        do
        {
          for (uint64_t m = 0; m != v27; ++m)
          {
            if (*(void *)v35 != v28) {
              objc_enumerationMutation(fetchRequestTemplates);
            }
            uint64_t v30 = *(void *)(*((void *)&v34 + 1) + 8 * m);
            unsigned int v31 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_fetchRequestTemplates, "objectForKey:", v30), "copy");
            [v4 setFetchRequestTemplate:v31 forName:v30];
          }
          uint64_t v27 = [(NSMutableDictionary *)fetchRequestTemplates countByEnumeratingWithState:&v34 objects:v46 count:16];
        }
        while (v27);
      }
    }
    [v4 setVersionIdentifiers:self->_versionIdentifiers];
  }
  return v4;
}

- (void)setEntities:(NSArray *)entities forConfiguration:(NSString *)configuration
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_managedObjectModelFlags & 3) != 0)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"setEntities called on immutable NSManagedObjectModel"];
    _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, v25);
    long long v14 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18AB82000, v14, OS_LOG_TYPE_FAULT, "CoreData: setEntities called on immutable NSManagedObjectModel", buf, 2u);
    }
  }
  NSUInteger v15 = [(NSArray *)entities count];
  if (v15)
  {
    NSUInteger v16 = v15;
    for (uint64_t i = 0; i != v16; ++i)
    {
      id v18 = [(NSArray *)entities objectAtIndex:i];
      if ((objc_msgSend(v18, "isEqual:", -[NSMutableDictionary objectForKey:](self->_entities, "objectForKey:", objc_msgSend(v18, "name"))) & 1) == 0)objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], @"Entities for a configuration must already be in the model.", 0)); {
    }
      }
  }
  if (!self->_configurations) {
    self->_configurations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v19 = (void *)[(NSArray *)entities mutableCopy];
  [(NSMutableDictionary *)self->_configurations setObject:v19 forKey:configuration];
  if (!*((void *)self->_additionalPrivateIvars + 3)) {
    *((void *)self->_additionalPrivateIvars + 3) = objc_opt_new();
  }
  id v20 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v21 = [(NSArray *)entities countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(entities);
        }
        objc_msgSend(v20, "addObject:", objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v24++), "name"));
      }
      while (v22 != v24);
      uint64_t v22 = [(NSArray *)entities countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v22);
  }
  [self->_additionalPrivateIvars[3] setObject:v20 forKeyedSubscript:configuration];
}

- (void)_setModelsReferenceIDOffset:(int64_t)a3
{
  if (a3 < 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot assign a negative reference ID offset to a managed object model." userInfo:0]);
  }
  if ([self->_additionalPrivateIvars[1] longValue] != a3)
  {

    *((void *)self->_additionalPrivateIvars + 1) = [objc_alloc(NSNumber) initWithLong:a3];
  }
}

- (id)_initWithEntities:(id)a3
{
  objc_opt_class();
  objc_opt_class();
  v10.receiver = self;
  v10.super_class = (Class)NSManagedObjectModel;
  id v5 = [(NSManagedObjectModel *)&v10 init];
  uint64_t v6 = v5;
  if (v5)
  {
    *(_DWORD *)&v5->_managedObjectModelFlags &= 0xFFFFFFFC;
    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6->_configurations = 0;
    v6->_fetchRequestTemplates = 0;
    v6->_entities = v7;
    v6->_versionIdentifiers = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    uint64_t v8 = (id *)PF_CALLOC_OBJECT_ARRAY(4);
    v6->_additionalPrivateIvars = v8;
    *uint64_t v8 = 0;
    *((void *)v6->_additionalPrivateIvars + 3) = 0;
    *((void *)v6->_additionalPrivateIvars + 1) = 0;
    *((void *)v6->_additionalPrivateIvars + 2) = 0;
    if (a3) {
      [(NSManagedObjectModel *)v6 setEntities:a3];
    }
  }
  return v6;
}

- (NSManagedObjectModel)init
{
  objc_opt_class();
  objc_opt_class();

  return (NSManagedObjectModel *)[(NSManagedObjectModel *)self _initWithEntities:0];
}

+ (uint64_t)_deepCollectEntitiesInArray:(void *)a3 entity:
{
  self;
  [a2 addObject:a3];
  id v5 = (void *)[a3 subentities];
  uint64_t result = [v5 count];
  if (result)
  {
    uint64_t v7 = result;
    for (uint64_t i = 0; i != v7; ++i)
      uint64_t result = +[NSManagedObjectModel _deepCollectEntitiesInArray:entity:](NSManagedObjectModel, a2, [v5 objectAtIndex:i]);
  }
  return result;
}

- (void)setVersionIdentifiers:(NSSet *)versionIdentifiers
{
  if (self->_versionIdentifiers != versionIdentifiers)
  {
    if (versionIdentifiers) {
      id v4 = (NSSet *)[(NSSet *)versionIdentifiers copy];
    }
    else {
      id v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    id v5 = v4;

    self->_versionIdentifiers = v5;
  }
}

- (uint64_t)_allowedClassesFromTransformableAttributes
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = *(void *)(*(void *)(result + 24) + 16);
    if (!result)
    {
      id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      obuint64_t j = *(id *)(v1 + 32);
      uint64_t v15 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v15)
      {
        uint64_t v13 = *(void *)v22;
        uint64_t v14 = v1;
        do
        {
          uint64_t v3 = 0;
          do
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = v3;
            id v4 = (void *)[*(id *)(v1 + 32) objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * v3)];
            long long v17 = 0u;
            long long v18 = 0u;
            long long v19 = 0u;
            long long v20 = 0u;
            id v5 = (void *)[v4 attributesByName];
            uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v6)
            {
              uint64_t v7 = v6;
              uint64_t v8 = *(void *)v18;
              do
              {
                for (uint64_t i = 0; i != v7; ++i)
                {
                  if (*(void *)v18 != v8) {
                    objc_enumerationMutation(v5);
                  }
                  objc_super v10 = objc_msgSend((id)objc_msgSend(v4, "attributesByName"), "valueForKey:", *(void *)(*((void *)&v17 + 1) + 8 * i));
                  if ([v10 valueTransformerName])
                  {
                    objc_msgSend(MEMORY[0x1E4F29248], "valueTransformerForName:", objc_msgSend(v10, "valueTransformerName"));
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)objc_opt_class(), "allowedTopLevelClasses"));
                    }
                  }
                }
                uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
              }
              while (v7);
            }
            uint64_t v3 = v16 + 1;
            uint64_t v1 = v14;
          }
          while (v16 + 1 != v15);
          uint64_t v15 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v15);
      }
      uint64_t v11 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(*(void *)(v1 + 24) + 16), (unint64_t *)&v11, (unint64_t)v2);
      if (v11) {

      }
      return *(void *)(*(void *)(v1 + 24) + 16);
    }
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isConfiguration:(NSString *)configuration compatibleWithStoreMetadata:(NSDictionary *)metadata
{
  return -[NSManagedObjectModel _isConfiguration:inStyle:compatibleWithStoreMetadata:]((uint64_t)self, (uint64_t)a2, 0, metadata);
}

- (uint64_t)_isConfiguration:(uint64_t)a3 inStyle:(void *)a4 compatibleWithStoreMetadata:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v6 = (void *)result;
  uint64_t v7 = (void *)[a4 objectForKey:0x1ED796A00];
  unsigned int v8 = [v7 intValue];
  if ([v7 intValue] > 3) {
    return 0;
  }
  uint64_t result = [a4 objectForKey:@"NSStoreModelVersionHashes"];
  if (!result) {
    return result;
  }
  uint64_t v9 = (void *)result;
  uint64_t v10 = objc_msgSend((id)objc_msgSend(v6, "entitiesByName"), "count");
  if (v10 != [v9 count]) {
    return 0;
  }
  id v11 = -[NSManagedObjectModel _entityVersionHashesByNameInStyle:](v6, a3);
  uint64_t v12 = v11;
  if (v8 < 3)
  {
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    long long v21 = 0uLL;
    long long v22 = 0uLL;
    uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
LABEL_8:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t result = [v9 objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * v16)];
        if (!result) {
          return result;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
          uint64_t result = 1;
          if (v14) {
            goto LABEL_8;
          }
          return result;
        }
      }
    }
    return 1;
  }
  long long v27 = 0uLL;
  long long v28 = 0uLL;
  long long v25 = 0uLL;
  long long v26 = 0uLL;
  uint64_t v17 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (!v17) {
    return 1;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v26;
LABEL_19:
  uint64_t v20 = 0;
  while (1)
  {
    if (*(void *)v26 != v19) {
      objc_enumerationMutation(v12);
    }
    uint64_t result = objc_msgSend((id)objc_msgSend(v12, "objectForKey:", *(void *)(*((void *)&v25 + 1) + 8 * v20)), "isEqual:", objc_msgSend(v9, "objectForKey:", *(void *)(*((void *)&v25 + 1) + 8 * v20)));
    if (!result) {
      return result;
    }
    if (v18 == ++v20)
    {
      uint64_t v18 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
      uint64_t result = 1;
      if (v18) {
        goto LABEL_19;
      }
      return result;
    }
  }
}

- (NSManagedObjectModel)initWithContentsOfOptimizedURL:(id)a3
{
  objc_opt_class();
  objc_opt_class();
  id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v5 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = (_PFVMData *)[a3 path];
  char v15 = 0;
  char v7 = [v5 fileExistsAtPath:v6 isDirectory:&v15];
  if (v15) {
    char v8 = v7;
  }
  else {
    char v8 = 0;
  }
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v6 = 0;
LABEL_6:
    int v10 = 1;
    goto LABEL_13;
  }
  if (v6)
  {
    uint64_t v6 = [[_PFVMData alloc] initWithContentsOfFile:v6 options:0 error:0];
    if (![(_PFVMData *)v6 length])
    {
      uint64_t v9 = 0;
      goto LABEL_6;
    }
    +[NSManagedObjectModel _newModelFromOptimizedEncoding:error:]((uint64_t)NSManagedObjectModel, (const __CFData *)v6, 0);
    uint64_t v9 = v11;
    if (v11)
    {
      uint64_t v12 = [[NSValidationErrorLocalizationPolicy alloc] initWithURL:a3];
      [(NSManagedObjectModel *)v9 _setLocalizationPolicy:v12];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  int v10 = 0;
LABEL_13:
  [v4 drain];
  id v13 = 0;

  if (v10) {
    return 0;
  }
  else {
    return v9;
  }
}

- (id)_initWithContentsOfURL:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  objc_opt_class();
  objc_opt_class();
  if (a3)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    char v15 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v16 = (void *)[a3 path];
    char v76 = 0;
    int v17 = [v15 fileExistsAtPath:v16 isDirectory:&v76];
    if (v17) {
      BOOL v18 = v76 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18)
    {
      char v19 = v17;
      int v20 = objc_msgSend((id)objc_msgSend(v16, "pathExtension"), "isEqualToString:", @"omo");
      char v21 = v19 | v20;
      if (v20) {
        uint64_t v22 = (uint64_t)v16;
      }
      else {
        uint64_t v22 = 0;
      }
      if (v21)
      {
        int v23 = v20;
LABEL_16:

        if (v22)
        {
          long long v39 = [NSManagedObjectModel alloc];
          long long v24 = -[NSManagedObjectModel initWithContentsOfOptimizedURL:](v39, "initWithContentsOfOptimizedURL:", [MEMORY[0x1E4F1CB10] fileURLWithPath:v22 isDirectory:0]);
          if (v24)
          {
LABEL_41:
            unint64_t v71 = [[NSValidationErrorLocalizationPolicy alloc] initWithURL:a3];
            [(NSManagedObjectModel *)v24 _setLocalizationPolicy:v71];

LABEL_45:
            [v14 drain];
            return v24;
          }
          if (!PFUseToolchainBehaviors()) {
            _NSCoreDataLog(4, @" Failed to load optimized model at path '%@'", v33, v34, v35, v36, v37, v38, v22);
          }
          if (v23)
          {
            long long v40 = (void *)[v16 stringByDeletingLastPathComponent];
            if (objc_msgSend((id)objc_msgSend(v40, "pathExtension"), "isEqualToString:", @"momd"))
            {
              long long v41 = [[NSManagedObjectModelBundle alloc] initWithPath:v40];
              if (v41)
              {
                uint64_t v16 = objc_msgSend(-[NSManagedObjectModelBundle currentVersionURL](v41, "currentVersionURL"), "path");
                uint64_t v22 = 0;
                if (!v16) {
                  goto LABEL_44;
                }
              }
              else
              {
                _NSCoreDataLog(1, @" Failed to load model bundle at path '%@'", v42, v43, v44, v45, v46, v47, (uint64_t)v16);
                if (!v16) {
                  goto LABEL_44;
                }
              }
LABEL_29:
              if (v16 != (void *)v22)
              {
                uint64_t v75 = 0;
                uint64_t v49 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v16 options:0 error:&v75];
                if (v75)
                {
                  uint64_t v50 = NSStringFromSelector(a2);
                  _NSCoreDataLog(1, @"Failed reading data in %@ from path %@, error, %@", v51, v52, v53, v54, v55, v56, (uint64_t)v50);
                }
                id v74 = 0;
                if ([v49 length])
                {
                  long long v63 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v49 error:&v74];
                  unint64_t v64 = v63;
                  if (v4)
                  {
                    [v63 setRequiresSecureCoding:1];
                    [v64 _allowDecodingCyclesInSecureMode];
                  }
                  else
                  {
                    [v63 setRequiresSecureCoding:0];
                  }
                  [v64 setDecodingFailurePolicy:1];
                  long long v24 = (NSManagedObjectModel *)(id)objc_msgSend(v64, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", objc_opt_class()), @"root");
                  if ([v64 error]) {
                    id v74 = (id)[v64 error];
                  }

                  if (v24)
                  {

                    goto LABEL_41;
                  }
                  _NSCoreDataLog(1, @" Failed to load keyed archive model at path '%@' with error '%@'", v65, v66, v67, v68, v69, v70, (uint64_t)v16);
                }
                else
                {
                  _NSCoreDataLog(1, @"Unable model at path (file is zero bytes) '%@'", v57, v58, v59, v60, v61, v62, (uint64_t)v16);
                }
              }
LABEL_44:
              _NSCoreDataLog(1, @" Failed to load NSManagedObjectModel with URL '%@'", v33, v34, v35, v36, v37, v38, (uint64_t)a3);
              long long v24 = 0;
              goto LABEL_45;
            }
          }
        }
LABEL_28:
        if (!v16) {
          goto LABEL_44;
        }
        goto LABEL_29;
      }
      unsigned int v48 = @" Failed to load model as no file exists at path '%@'";
    }
    else
    {
      long long v25 = [[NSManagedObjectModelBundle alloc] initWithPath:v16];
      if (v25)
      {
        unint64_t v32 = v25;
        uint64_t v22 = objc_msgSend(-[NSManagedObjectModelBundle optimizedVersionURL](v25, "optimizedVersionURL"), "path");
        uint64_t v16 = objc_msgSend(-[NSManagedObjectModelBundle currentVersionURL](v32, "currentVersionURL"), "path");
        int v23 = 0;
        goto LABEL_16;
      }
      unsigned int v48 = @" Failed to load model bundle at path '%@'";
    }
    _NSCoreDataLog(1, (uint64_t)v48, v26, v27, v28, v29, v30, v31, (uint64_t)v16);

    uint64_t v22 = 0;
    goto LABEL_28;
  }
  _NSCoreDataLog(1, @" Cannot load NSManagedObjectModel.  nil is an illegal URL parameter", v8, v9, v10, v11, v12, v13, v73);
  if (BYTE2(dword_1EB270AB0)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"CoreData: Cannot load NSManagedObjectModel.  nil is an illegal URL parameter" userInfo:0]);
  }

  return 0;
}

- (void)dealloc
{
  if (self->_optimizationHints)
  {
    uint64_t v3 = [(NSMutableDictionary *)self->_entities count] - 1;
    if (v3 >= 0)
    {
      do

      while (v3 != -1);
    }
  }
  self->_optimizationHints = 0;
  fetchRequestTemplates = self->_fetchRequestTemplates;
  if (fetchRequestTemplates)
  {

    self->_fetchRequestTemplates = 0;
  }

  self->_configurations = 0;
  self->_entities = 0;

  self->_versionIdentifiers = 0;
  additionalPrivateIvars = self->_additionalPrivateIvars;
  if (additionalPrivateIvars)
  {

    *self->_additionalPrivateIvars = 0;
    *((void *)self->_additionalPrivateIvars + 1) = 0;

    *((void *)self->_additionalPrivateIvars + 2) = 0;
    *((void *)self->_additionalPrivateIvars + 3) = 0;
    PF_FREE_OBJECT_ARRAY(self->_additionalPrivateIvars);
    self->_additionalPrivateIvars = 0;
  }

  self->_dataForOptimization = 0;
  v6.receiver = self;
  v6.super_class = (Class)NSManagedObjectModel;
  [(NSManagedObjectModel *)&v6 dealloc];
}

- (void)_setLocalizationPolicy:(id)a3
{
  id v3 = *self->_additionalPrivateIvars;
  if (v3 != a3)
  {

    *self->_additionalPrivateIvars = a3;
  }
}

+ (NSManagedObjectModel)mergedModelFromBundles:(NSArray *)bundles
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  uint64_t v4 = objc_opt_class();
  context = (void *)MEMORY[0x18C127630](v4);
  id v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  objc_super v6 = +[NSManagedObjectModel _modelPathsFromBundles:]((uint64_t)NSManagedObjectModel, bundles);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x18C127630]();
        uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
        int v20 = [[NSManagedObjectModel alloc] initWithContentsOfURL:v13];
        if (v20) {
          [v5 addObject:v20];
        }
        else {
          _NSCoreDataLog(1, @"+mergedModelFromBundles: Failed to load model at URL '%@'", v14, v15, v16, v17, v18, v19, v13);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }
  if ([v5 count] == 1) {
    char v21 = (void *)[v5 objectAtIndex:0];
  }
  else {
    char v21 = (void *)[a1 modelByMergingModels:v5];
  }
  id v22 = v21;
  return (NSManagedObjectModel *)v22;
}

- (NSManagedObjectModel)initWithContentsOfURL:(NSURL *)url
{
  return (NSManagedObjectModel *)[(NSManagedObjectModel *)self _initWithContentsOfURL:url options:byte_1EB270AB4];
}

- (void)_setIsEditable:(BOOL)a3 optimizationStyle:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_sync_enter(self);
  uint64_t v8 = (void *)MEMORY[0x18C127630](v7);
  __managedObjectModelFlags managedObjectModelFlags = self->_managedObjectModelFlags;
  if (!(*(unsigned char *)&managedObjectModelFlags & 1) == v5)
  {
    if (BYTE6(z9dsptsiQ80etb9782fsrs98bfdle88))
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      fetchRequestTemplates = self->_fetchRequestTemplates;
      uint64_t v11 = [(NSMutableDictionary *)fetchRequestTemplates countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(fetchRequestTemplates);
            }
            uint64_t v14 = (void *)[(NSMutableDictionary *)self->_fetchRequestTemplates objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * i)];
            [v14 allowEvaluation];
            [v14 _incrementInUseCounter];
          }
          uint64_t v11 = [(NSMutableDictionary *)fetchRequestTemplates countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v11);
      }
    }
  }
  else
  {
    if (*(unsigned char *)&managedObjectModelFlags) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Models cannot become mutable after being marked immutable." userInfo:0]);
    }
    unsigned int v15 = *(_DWORD *)&managedObjectModelFlags & 0xFFFFFFFE | !v5;
    if (a4) {
      v15 |= 4u;
    }
    self->___managedObjectModelFlags managedObjectModelFlags = (__managedObjectModelFlags)v15;
    -[NSManagedObjectModel _traverseTombstonesAndMark:]((uint64_t)self, 1);
    [(NSManagedObjectModel *)self _createCachesAndOptimizeState];
  }
  objc_sync_exit(self);
}

- (void)_setIsEditable:(BOOL)a3
{
}

- (void)_traverseTombstonesAndMark:(uint64_t)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1 && (*(unsigned char *)(a1 + 64) & 0x10) == 0)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obuint64_t j = *(id *)(a1 + 32);
    uint64_t v19 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v19)
    {
      char v5 = 0;
      uint64_t v18 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(obj);
          }
          objc_super v6 = (void *)[*(id *)(a1 + 32) objectForKey:*(void *)(*((void *)&v38 + 1) + 8 * i)];
          uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "userInfo"), "objectForKey:", @"NSPersistentHistoryTombstoneAttributes");
          uint64_t v8 = v7;
          if (v7)
          {
            if ([v7 isNSString])
            {
              if ([v8 length])
              {
                id v21 = (id)[v8 componentsSeparatedByString:@","];
                long long v36 = 0u;
                long long v37 = 0u;
                long long v34 = 0u;
                long long v35 = 0u;
                uint64_t v9 = [v21 countByEnumeratingWithState:&v34 objects:v44 count:16];
                if (v9)
                {
                  uint64_t v10 = *(void *)v35;
                  do
                  {
                    for (uint64_t j = 0; j != v9; ++j)
                    {
                      if (*(void *)v35 != v10) {
                        objc_enumerationMutation(v21);
                      }
                      if (v6)
                      {
                        uint64_t v12 = *(void *)(*((void *)&v34 + 1) + 8 * j);
                        uint64_t v13 = v6;
                        do
                        {
                          if (!-[NSEntityDescription _attributeNamed:]([v13 superentity], v12))
                          {
                            objc_msgSend(-[NSEntityDescription _attributeNamed:]((uint64_t)v13, v12), "setPreservesValueInHistoryOnDeletion:", a2);
                            v43[0] = v13;
                            v43[1] = v12;
                            objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v43, 2));
                            uint64_t v13 = 0;
                            char v5 = 1;
                          }
                          uint64_t v13 = (void *)[v13 superentity];
                        }
                        while (v13);
                      }
                    }
                    uint64_t v9 = [v21 countByEnumeratingWithState:&v34 objects:v44 count:16];
                  }
                  while (v9);
                }
              }
            }
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
      }
      while (v19);
      if (v5)
      {
        uint64_t v28 = 0;
        long long v29 = &v28;
        uint64_t v30 = 0x3052000000;
        uint64_t v31 = __Block_byref_object_copy__13;
        unint64_t v32 = __Block_byref_object_dispose__13;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __71__NSManagedObjectModel__NSInternalMethods___traverseTombstonesAndMark___block_invoke;
        v26[3] = &unk_1E544C7D0;
        char v27 = a2;
        v26[4] = &v28;
        uint64_t v33 = v26;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v14 = [v4 countByEnumeratingWithState:&v22 objects:v42 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v23;
          do
          {
            for (uint64_t k = 0; k != v14; ++k)
            {
              if (*(void *)v23 != v15) {
                objc_enumerationMutation(v4);
              }
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v29[5] + 16))(v29[5], [*(id *)(*((void *)&v22 + 1) + 8 * k) objectAtIndexedSubscript:0], objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * k), "objectAtIndexedSubscript:", 1));
            }
            uint64_t v14 = [v4 countByEnumeratingWithState:&v22 objects:v42 count:16];
          }
          while (v14);
        }
        _Block_object_dispose(&v28, 8);
      }
    }
  }
}

+ (NSDictionary)checksumsForVersionedModelAtURL:(NSURL *)modelURL error:(NSError *)error
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = (id)[MEMORY[0x1E4F1C9E8] dictionary];
  uint64_t v7 = [[NSManagedObjectModelBundle alloc] initWithPath:[(NSURL *)modelURL path]];
  if (v7)
  {
    uint64_t v8 = v7;
    id v6 = [(NSManagedObjectModelBundle *)v7 versionChecksums];
    if (!v6) {
      id v6 = (id)[MEMORY[0x1E4F1C9E8] dictionary];
    }
    id v9 = v6;
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F281F8];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = [NSString stringWithFormat:@"Failed to load model at URL '%@'", modelURL];
    uint64_t v13 = (NSError *)objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 258, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1));
    id v14 = v6;
    if (v13)
    {
      _NSCoreDataLog(1, @"+checksumsForVersionedModelAtURL:error: Failed to load model at URL '%@' due to error %@", v15, v16, v17, v18, v19, v20, (uint64_t)modelURL);
      if (error) {
        *error = v13;
      }
    }
  }
  return (NSDictionary *)v6;
}

+ (void)_modelPathsFromBundles:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  self;
  if (a2)
  {
    if ((unint64_t)[a2 count] >= 2)
    {
      BOOL v3 = BYTE1(z9dsptsiQ80etb9782fsrs98bfdle88) != 0;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
    if (v4) {
      a2 = (void *)[MEMORY[0x1E4F1C978] arrayWithObject:v4];
    }
    else {
      a2 = 0;
    }
  }
  BOOL v3 = 0;
LABEL_8:
  if (a2) {
    char v5 = a2;
  }
  else {
    char v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x18C127630]();
        if (!v3
          || (uint64_t v13 = objc_msgSend((id)objc_msgSend(v11, "bundlePath"), "pathComponents"),
              (unint64_t)[v13 count] < 5)
          || !objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", 1), "isEqual:", @"System")
          || (objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", 2), "isEqual:", @"Library") & 1) == 0)
        {
          objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v11, "pathsForResourcesOfType:inDirectory:", @"mom", 0));
          objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v11, "pathsForResourcesOfType:inDirectory:", @"momd", 0));
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  return v6;
}

- (NSManagedObjectModel)initWithCoder:(id)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  objc_opt_class();
  v89.receiver = self;
  v89.super_class = (Class)NSManagedObjectModel;
  newValue = [(NSManagedObjectModel *)&v89 init];
  if (newValue)
  {
    +[PFModelDecoderContext assertNoContext];
    id v4 = +[PFModelDecoderContext retainedContext];
    id v6 = v4;
    if (v4) {
      objc_setProperty_nonatomic(v4, v5, newValue, 8);
    }
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v86 = __38__NSManagedObjectModel_initWithCoder___block_invoke;
    v87 = &unk_1E544B868;
    id v88 = v6;
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend((id)objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0), "setByAddingObjectsFromArray:", +[NSKnownKeysDictionary classesForArchiving](NSKnownKeysDictionary, "classesForArchiving")), @"NSEntities");
    newValue->_entities = v12;
    if (v12)
    {
      if (([(NSMutableDictionary *)v12 isNSDictionary] & 1) == 0)
      {
        objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, &unk_1ED7E1DA8));

        goto LABEL_68;
      }
      uint64_t v13 = (void *)[MEMORY[0x1E4F1CA80] set];
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v14 = (void *)[(NSMutableDictionary *)newValue->_entities allKeys];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v81 objects:v93 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v82;
        uint64_t v17 = *MEMORY[0x1E4F281F8];
LABEL_8:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v82 != v16) {
            objc_enumerationMutation(v14);
          }
          long long v19 = *(void **)(*((void *)&v81 + 1) + 8 * v18);
          uint64_t v20 = (void *)MEMORY[0x18C127630]();
          uint64_t v21 = (void *)[(NSMutableDictionary *)newValue->_entities objectForKeyedSubscript:v19];
          if ([v19 isNSString]
            && (objc_opt_class(), long long v22 = v21, (objc_opt_isKindOfClass() & 1) != 0))
          {
            while (1)
            {
              long long v22 = (void *)[v22 superentity];
              if (!v22 || ([v13 containsObject:v22] & 1) != 0) {
                break;
              }
              uint64_t v23 = [v22 name];
              if (!v23
                || (void *)[(NSMutableDictionary *)newValue->_entities objectForKeyedSubscript:v23] != v22)
              {
                objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v17, 4866, &unk_1ED7E1DF8));

                goto LABEL_19;
              }
              [v13 addObject:v22];
            }
            uint64_t v80 = 0;
            if ([v21 performPostDecodeValidationInModel:newValue error:&v80])
            {
              int v24 = 0;
              goto LABEL_20;
            }
            [a3 failWithError:v80];
          }
          else
          {
            objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v17, 4866, &unk_1ED7E1DD0));
          }
LABEL_19:
          newValue = 0;
          int v24 = 1;
LABEL_20:
          if (v24) {
            goto LABEL_68;
          }
          if (++v18 == v15)
          {
            uint64_t v25 = [v14 countByEnumeratingWithState:&v81 objects:v93 count:16];
            uint64_t v15 = v25;
            if (v25) {
              goto LABEL_8;
            }
            break;
          }
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        newValue->_entities = (NSMutableDictionary *)[(NSMutableDictionary *)newValue->_entities mutableCopy];
      }
    }
    long long v26 = (id *)PF_CALLOC_OBJECT_ARRAY(4);
    newValue->_additionalPrivateIvars = v26;
    *long long v26 = 0;
    *((void *)newValue->_additionalPrivateIvars + 1) = 0;
    *((void *)newValue->_additionalPrivateIvars + 2) = 0;
    *((void *)newValue->_additionalPrivateIvars + 3) = 0;
    char v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v27, "setWithObjects:", v28, v29, v30, v31, v32, objc_opt_class(), 0), @"NSConfigurations");
    if (v33)
    {
      newValue->_configurations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *((void *)newValue->_additionalPrivateIvars + 3) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      context = (void *)MEMORY[0x18C127630]();
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v76 objects:v92 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v77;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v77 != v35) {
              objc_enumerationMutation(v33);
            }
            uint64_t v37 = *(void *)(*((void *)&v76 + 1) + 8 * i);
            long long v38 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v33, "objectForKey:", v37), "allObjects"), "mutableCopy");
            [(NSMutableDictionary *)newValue->_configurations setObject:v38 forKey:v37];
            long long v39 = (void *)[MEMORY[0x1E4F1CA80] set];
            long long v74 = 0u;
            long long v75 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            uint64_t v40 = [v38 countByEnumeratingWithState:&v72 objects:v91 count:16];
            if (v40)
            {
              uint64_t v41 = *(void *)v73;
              do
              {
                for (uint64_t j = 0; j != v40; ++j)
                {
                  if (*(void *)v73 != v41) {
                    objc_enumerationMutation(v38);
                  }
                  objc_msgSend(v39, "addObject:", objc_msgSend(*(id *)(*((void *)&v72 + 1) + 8 * j), "name"));
                }
                uint64_t v40 = [v38 countByEnumeratingWithState:&v72 objects:v91 count:16];
              }
              while (v40);
            }
            [newValue->_additionalPrivateIvars[3] setObject:v39 forKey:v37];
          }
          uint64_t v34 = [v33 countByEnumeratingWithState:&v76 objects:v92 count:16];
        }
        while (v34);
      }
    }
    uint64_t v43 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v44 = objc_opt_class();
    uint64_t v45 = objc_opt_class();
    uint64_t v46 = objc_opt_class();
    uint64_t v47 = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v43, "setWithObjects:", v44, v45, v46, objc_opt_class(), 0), @"NSFetchRequestTemplates");
    newValue->_fetchRequestTemplates = v47;
    if (!v47)
    {
LABEL_60:
      uint64_t v56 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v57 = objc_opt_class();
      uint64_t v58 = objc_opt_class();
      uint64_t v59 = objc_opt_class();
      uint64_t v60 = objc_opt_class();
      uint64_t v61 = (NSSet *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v56, "setWithObjects:", v57, v58, v59, v60, objc_opt_class(), 0), @"NSVersionIdentifiers");
      uint64_t v62 = newValue;
      newValue->_versionIdentifiers = v61;
      if (!v61)
      {
        long long v63 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
        uint64_t v62 = newValue;
        newValue->_versionIdentifiers = v63;
      }
      *(_DWORD *)&v62->_managedObjectModelFlags &= 0xFFFFFFFC;
      -[NSManagedObjectModel _finalizeIndexes](v62);
      goto LABEL_69;
    }
    if ([(NSMutableDictionary *)v47 isNSDictionary])
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      unsigned int v48 = (void *)[(NSMutableDictionary *)newValue->_fetchRequestTemplates allKeys];
      uint64_t v49 = [v48 countByEnumeratingWithState:&v68 objects:v90 count:16];
      if (v49)
      {
        uint64_t v50 = *(void *)v69;
        while (2)
        {
          for (uint64_t k = 0; k != v49; ++k)
          {
            if (*(void *)v69 != v50) {
              objc_enumerationMutation(v48);
            }
            uint64_t v52 = *(void **)(*((void *)&v68 + 1) + 8 * k);
            uint64_t v53 = (void *)[(NSMutableDictionary *)newValue->_fetchRequestTemplates objectForKeyedSubscript:v52];
            if (![v52 isNSString]
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, &unk_1ED7E1E48));

              goto LABEL_68;
            }
            uint64_t v54 = (void *)[v53 entity];
            uint64_t v55 = v54;
            if (v54
              && (![v54 name]
               || (void *)-[NSMutableDictionary objectForKeyedSubscript:](newValue->_entities, "objectForKeyedSubscript:", [v55 name]) != v55))
            {
              objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, &unk_1ED7E1E70));

              goto LABEL_68;
            }
          }
          uint64_t v49 = [v48 countByEnumeratingWithState:&v68 objects:v90 count:16];
          if (v49) {
            continue;
          }
          break;
        }
      }
      goto LABEL_60;
    }
    objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, &unk_1ED7E1E20));

LABEL_68:
    newValue = 0;
LABEL_69:
    v86((uint64_t)v85);
    return newValue;
  }
  return 0;
}

void __38__NSManagedObjectModel_initWithCoder___block_invoke(uint64_t a1)
{
}

+ (NSManagedObjectModel)modelByMergingModels:(NSArray *)models
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  objc_opt_class();
  if (!models) {
    return 0;
  }
  NSUInteger v4 = [(NSArray *)models count];
  if (v4 == 1)
  {
    id v6 = (NSManagedObjectModel *)objc_msgSend(-[NSArray objectAtIndex:](models, "objectAtIndex:", 0), "copy");
    goto LABEL_7;
  }
  unint64_t v5 = v4;
  if (!v4)
  {
    id v6 = objc_alloc_init(NSManagedObjectModel);
LABEL_7:
    return v6;
  }
  id v98 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v8 = 0;
  unint64_t v105 = v5 - 2;
  unint64_t v102 = v5;
  uint64_t v103 = models;
  do
  {
    context = (void *)MEMORY[0x18C127630]();
    uint64_t v9 = [(NSArray *)models objectAtIndex:v8];
    if (v8 + 1 >= v5) {
      goto LABEL_33;
    }
    uint64_t v10 = v9;
    uint64_t v11 = v8 + 1;
    do
    {
      id v12 = [(NSArray *)models objectAtIndex:v11];
      uint64_t v13 = (void *)[v12 entitiesByName];
      long long v130 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      id v14 = (void *)[v13 allValues];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v130 objects:v143 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v131;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v131 != v17) {
              objc_enumerationMutation(v14);
            }
            long long v19 = *(void **)(*((void *)&v130 + 1) + 8 * i);
            uint64_t v20 = [v19 name];
            if (v10)
            {
              uint64_t v21 = v20;
              long long v22 = (void *)[v10[4] objectForKey:v20];
              if (v22)
              {
                if (([v22 isEqual:v19] & 1) == 0)
                {
                  [v98 drain];
                  Class v90 = (void *)MEMORY[0x1E4F1CA00];
                  uint64_t v91 = *MEMORY[0x1E4F1C3C8];
                  uint64_t v92 = [NSString stringWithFormat:@"Can't merge models with two different entities named '%@'", v21];
                  uint64_t v93 = v90;
                  uint64_t v94 = v91;
                  goto LABEL_114;
                }
              }
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v130 objects:v143 count:16];
        }
        while (v16);
      }
      uint64_t v23 = (void *)[v12 fetchRequestTemplatesByName];
      long long v126 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v126 objects:v142 count:16];
      if (!v24) {
        goto LABEL_32;
      }
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v127;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v127 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v126 + 1) + 8 * j);
          uint64_t v29 = [v12 fetchRequestTemplateForName:v28];
          uint64_t v30 = (void *)[v10 fetchRequestTemplateForName:v28];
          if (v30 && ([v30 isEqual:v29] & 1) == 0)
          {
            [v98 drain];
            v95 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v96 = *MEMORY[0x1E4F1C3C8];
            uint64_t v92 = [NSString stringWithFormat:@"Can't merge models with two different fetch request templates for name'%@'", v28];
            uint64_t v93 = v95;
            uint64_t v94 = v96;
LABEL_114:
            objc_exception_throw((id)[v93 exceptionWithName:v94 reason:v92 userInfo:0]);
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v126 objects:v142 count:16];
      }
      while (v25);
LABEL_32:
      ++v11;
      unint64_t v5 = v102;
      models = v103;
    }
    while (v11 != v102);
LABEL_33:
  }
  while (v8++ != v105);
  uint64_t v32 = (id *)(id)objc_msgSend(-[NSArray objectAtIndex:](models, "objectAtIndex:", 0), "copy");
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v34 = objc_alloc_init(NSMergedPolicyLocalizationPolicy);
  if ([v32 _localizationPolicy]) {
    -[NSMergedPolicyLocalizationPolicy addPolicy:](v34, "addPolicy:", [v32 _localizationPolicy]);
  }
  uint64_t v99 = v34;
  uint64_t v35 = [v32 _setLocalizationPolicy:v34];
  if (v5 >= 2)
  {
    uint64_t v36 = 1;
    unint64_t v37 = 0x1E544A000uLL;
    do
    {
      v100 = (void *)MEMORY[0x18C127630](v35);
      uint64_t v101 = v36;
      long long v38 = [(NSArray *)models objectAtIndex:v36];
      [v33 removeAllObjects];
      long long v39 = (void *)[v38 entitiesByName];
      long long v122 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v122 objects:v141 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v123;
        do
        {
          for (uint64_t k = 0; k != v41; ++k)
          {
            if (*(void *)v123 != v42) {
              objc_enumerationMutation(v39);
            }
            uint64_t v44 = (void *)[v39 objectForKey:*(void *)(*((void *)&v122 + 1) + 8 * k)];
            if (![v44 superentity])
            {
              uint64_t v45 = (void *)[v44 copy];
              +[NSManagedObjectModel _deepCollectEntitiesInArray:entity:](*(void *)(v37 + 3744), v33, v45);
            }
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v122 objects:v141 count:16];
        }
        while (v41);
      }
      uint64_t v46 = [v33 count];
      if (v46)
      {
        uint64_t v47 = v46;
        for (uint64_t m = 0; m != v47; ++m)
        {
          uint64_t v49 = (void *)[v33 objectAtIndex:m];
          uint64_t v50 = [v49 name];
          if (!v32 || ![v32[4] objectForKey:v50]) {
            [v32 _addEntity:v49];
          }
        }
      }
      if ([v38 _localizationPolicy]) {
        -[NSMergedPolicyLocalizationPolicy addPolicy:](v99, "addPolicy:", [v38 _localizationPolicy]);
      }
      contexta = v38;
      if ([v38[5] count])
      {
        long long v120 = 0u;
        long long v121 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        obuint64_t j = v38[5];
        uint64_t v109 = [obj countByEnumeratingWithState:&v118 objects:v140 count:16];
        if (v109)
        {
          uint64_t v106 = *(void *)v119;
          do
          {
            for (uint64_t n = 0; n != v109; ++n)
            {
              if (*(void *)v119 != v106) {
                objc_enumerationMutation(obj);
              }
              uint64_t v52 = *(void *)(*((void *)&v118 + 1) + 8 * n);
              [v33 removeAllObjects];
              uint64_t v53 = (void *)[contexta entitiesForConfiguration:v52];
              long long v114 = 0u;
              long long v115 = 0u;
              long long v116 = 0u;
              long long v117 = 0u;
              uint64_t v54 = [v53 countByEnumeratingWithState:&v114 objects:v139 count:16];
              if (v54)
              {
                uint64_t v55 = v54;
                uint64_t v56 = *(void *)v115;
                do
                {
                  uint64_t v57 = 0;
                  do
                  {
                    if (*(void *)v115 != v56) {
                      objc_enumerationMutation(v53);
                    }
                    uint64_t v58 = [*(id *)(*((void *)&v114 + 1) + 8 * v57) name];
                    if (v32) {
                      uint64_t v59 = [v32[4] objectForKey:v58];
                    }
                    else {
                      uint64_t v59 = 0;
                    }
                    [v33 addObject:v59];
                    ++v57;
                  }
                  while (v55 != v57);
                  uint64_t v60 = [v53 countByEnumeratingWithState:&v114 objects:v139 count:16];
                  uint64_t v55 = v60;
                }
                while (v60);
              }
              if (v32)
              {
                if (((_BYTE)v32[8] & 3) != 0)
                {
                  uint64_t v61 = [NSString stringWithUTF8String:"_addEntities called on immutable NSManagedObjectModel"];
                  _NSCoreDataLog(17, v61, v62, v63, v64, v65, v66, v67, v97);
                  long long v68 = __pflogFaultLog;
                  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_fault_impl(&dword_18AB82000, v68, OS_LOG_TYPE_FAULT, "CoreData: _addEntities called on immutable NSManagedObjectModel", buf, 2u);
                  }
                }
                id v69 = v32[5];
                if (!v69)
                {
                  id v69 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  v32[5] = v69;
                }
                uint64_t v70 = [v69 objectForKey:v52];
                if (v70)
                {
                  long long v71 = (void *)v70;
                  long long v136 = 0u;
                  long long v137 = 0u;
                  long long v134 = 0u;
                  long long v135 = 0u;
                  uint64_t v72 = [v33 countByEnumeratingWithState:&v134 objects:buf count:16];
                  if (v72)
                  {
                    uint64_t v73 = v72;
                    uint64_t v74 = *(void *)v135;
                    do
                    {
                      for (iuint64_t i = 0; ii != v73; ++ii)
                      {
                        if (*(void *)v135 != v74) {
                          objc_enumerationMutation(v33);
                        }
                        uint64_t v76 = *(void *)(*((void *)&v134 + 1) + 8 * ii);
                        if ([v71 indexOfObjectIdenticalTo:v76] == 0x7FFFFFFFFFFFFFFFLL) {
                          [v71 addObject:v76];
                        }
                      }
                      uint64_t v73 = [v33 countByEnumeratingWithState:&v134 objects:buf count:16];
                    }
                    while (v73);
                  }
                }
                else
                {
                  long long v77 = (void *)[v33 mutableCopy];
                  [v32[5] setObject:v77 forKey:v52];
                }
                if (!*((void *)v32[3] + 3)) {
                  *((void *)v32[3] + 3) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                }
                objc_msgSend(*((id *)v32[3] + 3), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(v32[5], "objectForKeyedSubscript:", v52)), v52);
              }
            }
            uint64_t v109 = [obj countByEnumeratingWithState:&v118 objects:v140 count:16];
          }
          while (v109);
        }
      }
      long long v78 = (void *)[contexta fetchRequestTemplatesByName];
      long long v110 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      uint64_t v79 = [v78 countByEnumeratingWithState:&v110 objects:v138 count:16];
      if (v79)
      {
        uint64_t v80 = v79;
        uint64_t v81 = *(void *)v111;
        do
        {
          for (juint64_t j = 0; jj != v80; ++jj)
          {
            if (*(void *)v111 != v81) {
              objc_enumerationMutation(v78);
            }
            uint64_t v83 = *(void *)(*((void *)&v110 + 1) + 8 * jj);
            if (![v32 fetchRequestTemplateForName:v83])
            {
              long long v84 = objc_msgSend((id)objc_msgSend(v78, "objectForKey:", v83), "copy");
              [v32 setFetchRequestTemplate:v84 forName:v83];
            }
          }
          uint64_t v80 = [v78 countByEnumeratingWithState:&v110 objects:v138 count:16];
        }
        while (v80);
      }
      uint64_t v85 = [contexta versionIdentifiers];
      unint64_t v37 = 0x1E544A000;
      if (v85 && v32)
      {
        uint64_t v86 = v85;
        v87 = (void *)[v32 versionIdentifiers];
        if (v87)
        {
          id v88 = (void *)[v87 mutableCopy];
          [v88 unionSet:v86];
          objc_msgSend(v32, "setVersionIdentifiers:", (id)objc_msgSend(v88, "copy"));
        }
        else
        {
          [v32 setVersionIdentifiers:v86];
        }
      }
      uint64_t v36 = v101 + 1;
      models = v103;
    }
    while (v101 + 1 != v102);
  }

  objc_super v89 = v32;
  [v98 drain];
  return (NSManagedObjectModel *)v32;
}

+ (NSManagedObjectModel)mergedModelFromBundles:(NSArray *)bundles forStoreMetadata:(NSDictionary *)metadata
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x18C127630](a1, a2);
  unint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v6 = +[NSManagedObjectModel _modelPathsFromBundles:]((uint64_t)NSManagedObjectModel, bundles);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x18C127630]();
        char v21 = 0;
        if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", v11, &v21))BOOL v13 = v21 == 0; {
        else
        }
          BOOL v13 = 1;
        if (v13) {
          id v14 = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", [MEMORY[0x1E4F1CB10] fileURLWithPath:v11 isDirectory:0]);
        }
        else {
          id v14 = [[NSManagedObjectModelBundle alloc] initWithPath:v11];
        }
        uint64_t v15 = v14;
        if (v15) {
          [v5 addObject:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }
  id v16 = (id)[a1 modelByMergingModels:v5 forStoreMetadata:metadata];
  return (NSManagedObjectModel *)v16;
}

+ (NSManagedObjectModel)modelByMergingModels:(NSArray *)models forStoreMetadata:(NSDictionary *)metadata
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v7 = (id)objc_msgSend(-[NSDictionary objectForKey:](metadata, "objectForKey:", @"NSStoreModelVersionHashes"), "mutableCopy");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = [(NSArray *)models countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(models);
        }
        BOOL v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v14 = (void *)MEMORY[0x18C127630]();
        uint64_t v15 = [v13 _modelForVersionHashes:v7];
        if (v15)
        {
          id v16 = (void *)v15;
          if (!v10) {
            id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v10 addObject:v16];
          objc_msgSend(v7, "removeObjectsForKeys:", objc_msgSend((id)objc_msgSend(v16, "entitiesByName"), "allKeys"));
          if (![v7 count])
          {
            goto LABEL_15;
          }
        }
      }
      uint64_t v9 = [(NSArray *)models countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v10 = 0;
  }
LABEL_15:
  id v17 = v10;
  uint64_t v18 = [v10 count];
  uint64_t v19 = [v7 count];
  uint64_t v20 = 0;
  if (v18 && !v19)
  {
    if (v18 == 1) {
      char v21 = (NSManagedObjectModel *)[v10 objectAtIndex:0];
    }
    else {
      char v21 = +[NSManagedObjectModel modelByMergingModels:v10];
    }
    uint64_t v20 = v21;
  }
  [v6 drain];
  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (void *)MEMORY[0x18C127630](self, a2);
  if (self->_entities)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_entities];
    entities = self->_entities;
  }
  else
  {
    entities = 0;
    id v6 = 0;
  }
  [a3 encodeObject:entities forKey:@"NSEntities"];

  uint64_t v8 = [(NSMutableDictionary *)self->_configurations count];
  if (v8 != ([(NSMutableDictionary *)self->_configurations objectForKey:@"PF_DEFAULT_CONFIGURATION_NAME"] != 0))
  {
    uint64_t v15 = v5;
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    configurations = self->_configurations;
    uint64_t v11 = [(NSMutableDictionary *)configurations countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(configurations);
          }
          objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[NSMutableDictionary objectForKey:](self->_configurations, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i))), *(void *)(*((void *)&v16 + 1) + 8 * i));
        }
        uint64_t v12 = [(NSMutableDictionary *)configurations countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
    [v9 removeObjectForKey:@"PF_DEFAULT_CONFIGURATION_NAME"];
    [a3 encodeObject:v9 forKey:@"NSConfigurations"];
    unint64_t v5 = v15;
  }
  [a3 encodeObject:self->_fetchRequestTemplates forKey:@"NSFetchRequestTemplates"];
  [a3 encodeObject:self->_versionIdentifiers forKey:@"NSVersionIdentifiers"];
}

- (unint64_t)hash
{
  id v2 = objc_opt_class();

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_15;
  }
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  unint64_t v5 = [(NSManagedObjectModel *)self entitiesByName];
  uint64_t v6 = [a3 entitiesByName];
  if (v5 == (NSDictionary *)v6
    || (uint64_t v7 = v6, LOBYTE(v6) = 0, v5) && v7 && (LODWORD(v6) = -[NSDictionary isEqual:](v5, "isEqual:"), v6))
  {
    uint64_t v8 = [(NSManagedObjectModel *)self fetchRequestTemplatesByName];
    uint64_t v6 = [a3 fetchRequestTemplatesByName];
    if (v8 != (NSDictionary *)v6)
    {
      uint64_t v9 = v6;
      LOBYTE(v6) = 0;
      if (v8 && v9)
      {
        LOBYTE(v6) = -[NSDictionary isEqual:](v8, "isEqual:");
      }
      return v6;
    }
LABEL_15:
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NSManagedObjectModel;
  return (id)[NSString stringWithFormat:@"(%@) isEditable %u, entities %@, fetch request templates %@", -[NSManagedObjectModel description](&v3, sel_description), -[NSManagedObjectModel isEditable](self, "isEditable"), -[NSManagedObjectModel entitiesByName](self, "entitiesByName"), -[NSManagedObjectModel fetchRequestTemplatesByName](self, "fetchRequestTemplatesByName")];
}

- (NSArray)configurations
{
  configurations = self->_configurations;
  if (configurations) {
    return (NSArray *)[(NSMutableDictionary *)configurations allKeys];
  }
  else {
    return (NSArray *)NSArray_EmptyArray;
  }
}

- (NSDictionary)fetchRequestTemplatesByName
{
  if (self->_fetchRequestTemplates) {
    return &self->_fetchRequestTemplates->super;
  }
  else {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
}

- (NSFetchRequest)fetchRequestTemplateForName:(NSString *)name
{
  uint64_t result = (NSFetchRequest *)self->_fetchRequestTemplates;
  if (result) {
    return (NSFetchRequest *)[(NSFetchRequest *)result objectForKey:name];
  }
  return result;
}

- (void)setFetchRequestTemplate:(NSFetchRequest *)fetchRequestTemplate forName:(NSString *)name
{
  fetchRequestTemplates = self->_fetchRequestTemplates;
  if (!fetchRequestTemplates)
  {
    fetchRequestTemplates = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_fetchRequestTemplates = fetchRequestTemplates;
  }
  uint64_t v8 = (NSFetchRequest *)[(NSMutableDictionary *)fetchRequestTemplates objectForKey:name];
  if (v8 != fetchRequestTemplate)
  {
    if (fetchRequestTemplate)
    {
      uint64_t v9 = [(NSFetchRequest *)fetchRequestTemplate entity];
      uint64_t v10 = [(NSMutableDictionary *)self->_entities objectForKey:[(NSEntityDescription *)v9 name]];
      if (v10)
      {
        uint64_t v11 = v10;
        if ((NSEntityDescription *)v10 == v9)
        {
          uint64_t v13 = self->_fetchRequestTemplates;
          [(NSMutableDictionary *)v13 setObject:fetchRequestTemplate forKey:name];
        }
        else
        {
          id v14 = (id)[(NSFetchRequest *)fetchRequestTemplate copy];
          [v14 setEntity:v11];
          [(NSMutableDictionary *)self->_fetchRequestTemplates setObject:v14 forKey:name];
        }
      }
      else if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
      {
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Cannot set fetch request template.  This model does not contain entity '%@'.", -[NSEntityDescription name](v9, "name")), 0 reason userInfo]);
      }
    }
    else if (v8)
    {
      uint64_t v12 = self->_fetchRequestTemplates;
      [(NSMutableDictionary *)v12 removeObjectForKey:name];
    }
  }
}

- (NSFetchRequest)fetchRequestFromTemplateWithName:(NSString *)name substitutionVariables:(NSDictionary *)variables
{
  unint64_t v5 = [(NSManagedObjectModel *)self fetchRequestTemplateForName:name];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (NSFetchRequest *)(id)[(NSFetchRequest *)v5 copy];
  [(NSFetchRequest *)v6 setPredicate:[(NSPredicate *)[(NSFetchRequest *)v6 predicate] predicateWithSubstitutionVariables:variables]];
  return v6;
}

- (NSDictionary)localizationDictionary
{
  uint64_t result = [(NSManagedObjectModel *)self _localizationPolicy];
  if (result)
  {
    objc_super v3 = result;
    [(NSDictionary *)result _ensureFullLocalizationDictionaryIsLoaded];
    return (NSDictionary *)[(NSDictionary *)v3 localizationDictionary];
  }
  return result;
}

- (void)setLocalizationDictionary:(NSDictionary *)localizationDictionary
{
  unint64_t v5 = [(NSManagedObjectModel *)self _localizationPolicy];
  if (!v5)
  {
    unint64_t v5 = [[NSValidationErrorLocalizationPolicy alloc] initWithURL:0];
    [(NSManagedObjectModel *)self _setLocalizationPolicy:v5];
  }

  [(NSValidationErrorLocalizationPolicy *)v5 setLocalizationDictionary:localizationDictionary];
}

+ (id)versionsHashesForModelAtURL:(id)a3 error:(id *)a4
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v25 = 0;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v7 = (void *)[a3 path];
  if (!objc_msgSend((id)objc_msgSend(v7, "pathExtension"), "isEqualToString:", @"momd")
    || (uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", objc_msgSend(v7, "stringByAppendingPathComponent:", @"VersionInfo.plist"), 0), (v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithContentsOfURL:error:", v8, &v25)) == 0)|| (v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"NSManagedObjectModel_VersionHashes"), "objectForKey:", objc_msgSend(v9, "objectForKey:", @"NSManagedObjectModel_CurrentVersionName")), v11 = (id)v10, !v10))
  {
    uint64_t v12 = [[NSManagedObjectModel alloc] initWithContentsOfURL:a3];
    uint64_t v13 = v12;
    if (v12)
    {
      uint64_t v10 = [(NSManagedObjectModel *)v12 entityVersionHashesByName];
      id v14 = (id)v10;
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  id v15 = v25;
  id v16 = (id)v10;
  [v6 drain];
  id v17 = 0;
  id v18 = v25;
  id v19 = (id)v10;
  id v20 = v25;
  if (!(v10 | (unint64_t)v25))
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    v27[0] = @"Unable to model NSManagedObjectModel";
    uint64_t v22 = *MEMORY[0x1E4F28328];
    v26[0] = @"reason";
    v26[1] = v22;
    v27[1] = [a3 path];
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
    id v20 = (id)[v21 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v23];
    id v25 = v20;
  }
  if (a4 && v20) {
    *a4 = v20;
  }
  return (id)v10;
}

+ (BOOL)versionHashes:(id)a3 compatibleWithStoreMetadata:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", 0x1ED796A00), "intValue") > 3) {
    goto LABEL_13;
  }
  uint64_t v6 = [a4 objectForKey:@"NSStoreModelVersionHashes"];
  if (!v6) {
    return v6;
  }
  uint64_t v7 = (void *)v6;
  uint64_t v8 = [a3 count];
  if (v8 != [v7 count])
  {
LABEL_13:
    LOBYTE(v6) = 0;
    return v6;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
LABEL_6:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(a3);
      }
      LODWORD(v6) = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * v12)), "isEqual:", objc_msgSend(v7, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * v12)));
      if (!v6) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        LOBYTE(v6) = 1;
        if (v10) {
          goto LABEL_6;
        }
        return v6;
      }
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (id)_optimizedEncoding:(id *)a3
{
  objc_super v3 = (unsigned char *)MEMORY[0x1F4188790](self);
  unint64_t v5 = v4;
  uint64_t v6 = v3;
  uint64_t v468 = *MEMORY[0x1E4F143B8];
  [v3 _setIsEditable:0 optimizationStyle:1];
  if ((v6[64] & 4) == 0)
  {
    uint64_t v7 = (void *)[v6 copy];
    uint64_t v8 = (void *)[v7 _optimizedEncoding:v5];

    return v8;
  }
  v328 = v5;
  uint64_t v10 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  v349 = *(const void *(__cdecl **)(CFAllocatorRef, const void *))(MEMORY[0x1E4F1D530] + 8);
  v444.versiouint64_t n = 0;
  v444.retaiuint64_t n = v349;
  long long v348 = *(_OWORD *)(MEMORY[0x1E4F1D530] + 16);
  *(_OWORD *)&v444.release = v348;
  uint64_t v11 = *(CFHashCode (__cdecl **)(const void *))(MEMORY[0x1E4F1D530] + 40);
  v444.equal = 0;
  v444.hash = v11;
  v443.versiouint64_t n = 0;
  *(_OWORD *)&v443.retaiuint64_t n = *(_OWORD *)(MEMORY[0x1E4F1D540] + 8);
  v443.copyDescriptiouint64_t n = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x1E4F1D540] + 24);
  v443.equal = 0;
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v340 = v6;
  uint64_t v13 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  CFMutableArrayRef Mutable = CFArrayCreateMutable(v12, 0, MEMORY[0x1E4F1D510]);
  v347 = CFDictionaryCreateMutable(v12, 0, &v444, &v443);
  v333 = CFArrayCreateMutable(v12, 0, v13);
  CFArrayAppendValue(v333, &stru_1ED787880);
  v334 = CFDictionaryCreateMutable(v12, 0, v10, &v443);
  CFDictionarySetValue(v334, &stru_1ED787880, (const void *)[NSNumber numberWithUnsignedInteger:0]);
  v345 = CFArrayCreateMutable(v12, 0, v13);
  CFArrayAppendValue(v345, &stru_1ED787880);
  v350 = CFDictionaryCreateMutable(v12, 0, v10, &v443);
  CFDictionarySetValue(v350, &stru_1ED787880, (const void *)[NSNumber numberWithUnsignedInteger:0]);
  v344 = CFArrayCreateMutable(v12, 0, v13);
  CFArrayAppendValue(v344, (const void *)[MEMORY[0x1E4F1C9B8] data]);
  long long v14 = CFDictionaryCreateMutable(v12, 0, v10, &v443);
  long long v15 = (const void *)[MEMORY[0x1E4F1CA98] null];
  CFDictionarySetValue(v14, v15, (const void *)[NSNumber numberWithUnsignedInteger:0]);
  CFMutableArrayRef v16 = CFArrayCreateMutable(v12, 0, v13);
  uint64_t v17 = [*((id *)v340 + 4) mapping];
  CFMutableArrayRef v330 = v16;
  [(__CFArray *)v16 addObject:v17];
  id v18 = CFDictionaryCreateMutable(v12, 0, &v444, &v443);
  uint64_t v19 = (const void *)[*((id *)v340 + 4) mapping];
  CFDictionarySetValue(v18, v19, (const void *)[NSNumber numberWithUnsignedInteger:0]);
  id v20 = v13;
  uint64_t v21 = v340;
  CFMutableArrayRef v336 = CFArrayCreateMutable(v12, 0, v20);
  v442.versiouint64_t n = 0;
  v442.retaiuint64_t n = v349;
  v442.release = (CFDictionaryReleaseCallBack)v348;
  v442.equal = 0;
  v442.copyDescriptiouint64_t n = 0;
  v442.hash = v11;
  uint64_t v22 = CFDictionaryCreateMutable(v12, 0, &v442, &v443);
  uint64_t v23 = [*((id *)v340 + 6) count];
  v331 = v18;
  CFMutableDictionaryRef v337 = v22;
  if (v23)
  {
    long long v24 = [[NSKnownKeysDictionary alloc] initWithDictionary:*((void *)v340 + 6)];
    if (![(__CFDictionary *)v18 objectForKey:[(NSKnownKeysDictionary *)v24 mapping]])
    {
      uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v330, "count"));
      uint64_t v21 = v340;
      [(__CFArray *)v330 addObject:[(NSKnownKeysDictionary *)v24 mapping]];
      long long v26 = [(NSKnownKeysDictionary *)v24 mapping];
      uint64_t v27 = (const void *)v25;
      uint64_t v22 = v337;
      CFDictionarySetValue(v18, v26, v27);
    }
    unint64_t v326 = v24;
    long long v441 = 0u;
    long long v440 = 0u;
    long long v439 = 0u;
    long long v438 = 0u;
    v349 = (const void *(__cdecl *)(CFAllocatorRef, const void *))*((void *)v21 + 6);
    uint64_t v28 = [v349 countByEnumeratingWithState:&v438 objects:v467 count:16];
    uint64_t v29 = v345;
    if (v28)
    {
      uint64_t v30 = v28;
      uint64_t v31 = *(void *)v439;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v439 != v31) {
            objc_enumerationMutation(v349);
          }
          uint64_t v33 = *(void *)(*((void *)&v438 + 1) + 8 * i);
          if (![(__CFDictionary *)v350 objectForKey:v33])
          {
            uint64_t v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v345, "count"));
            [(__CFArray *)v345 addObject:v33];
            [(__CFDictionary *)v350 setObject:v34 forKey:v33];
          }
          uint64_t v35 = (const void *)[*((id *)v340 + 6) objectForKey:v33];
          if (!CFDictionaryGetValue(v22, v35))
          {
            uint64_t v36 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v336, "count"));
            uint64_t v22 = v337;
            [(__CFArray *)v336 addObject:v35];
            CFDictionarySetValue(v337, v35, v36);
          }
        }
        uint64_t v30 = [v349 countByEnumeratingWithState:&v438 objects:v467 count:16];
      }
      while (v30);
    }
    uint64_t v21 = v340;
  }
  else
  {
    unint64_t v326 = 0;
    uint64_t v29 = v345;
  }
  unint64_t v325 = (objc_class *)objc_opt_class();
  v346 = (objc_class *)objc_opt_class();
  v327 = [[NSSQLModel alloc] initWithManagedObjectModel:v21 configurationName:0 retainHashHack:1];
  if (!v327)
  {
    if (v328) {
      uint64_t *v328 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:0];
    }
LABEL_211:
    id v193 = 0;
    goto LABEL_212;
  }
  long long v437 = 0u;
  long long v436 = 0u;
  long long v435 = 0u;
  long long v434 = 0u;
  unint64_t v37 = (void *)*((void *)v21 + 5);
  uint64_t v38 = [v37 countByEnumeratingWithState:&v434 objects:v466 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v435;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v435 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v42 = *(void *)(*((void *)&v434 + 1) + 8 * j);
        if (![(__CFDictionary *)v350 objectForKey:v42])
        {
          uint64_t v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
          [(__CFArray *)v29 addObject:v42];
          [(__CFDictionary *)v350 setObject:v43 forKey:v42];
        }
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v434 objects:v466 count:16];
    }
    while (v39);
  }
  long long v433 = 0u;
  long long v432 = 0u;
  long long v431 = 0u;
  long long v430 = 0u;
  v349 = (const void *(__cdecl *)(CFAllocatorRef, const void *))*((void *)v340 + 7);
  uint64_t v44 = [v349 countByEnumeratingWithState:&v430 objects:v465 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v431;
    do
    {
      for (uint64_t k = 0; k != v45; ++k)
      {
        if (*(void *)v431 != v46) {
          objc_enumerationMutation(v349);
        }
        unsigned int v48 = *(const void **)(*((void *)&v430 + 1) + 8 * k);
        if (![(__CFDictionary *)v14 objectForKey:v48])
        {
          uint64_t v49 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
          -[__CFArray addObject:](v344, "addObject:", [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v48 requiringSecureCoding:1 error:0]);
          CFDictionarySetValue(v14, v48, v49);
        }
      }
      uint64_t v45 = [v349 countByEnumeratingWithState:&v430 objects:v465 count:16];
    }
    while (v45);
  }
  long long v429 = 0u;
  long long v428 = 0u;
  long long v427 = 0u;
  long long v426 = 0u;
  id v50 = (id)[*((id *)v340 + 4) allValues];
  uint64_t v51 = [v50 countByEnumeratingWithState:&v426 objects:v464 count:16];
  *(void *)&long long v348 = v14;
  if (!v51)
  {
    unsigned int v342 = 0;
    unsigned int v332 = 0;
    uint64_t v323 = 0;
    uint64_t v324 = 0;
    LODWORD(v349) = 0;
    goto LABEL_244;
  }
  unsigned int v342 = 0;
  unsigned int v332 = 0;
  uint64_t v323 = 0;
  uint64_t v324 = 0;
  LODWORD(v349) = 0;
  uint64_t v52 = *(void *)v427;
  uint64_t v53 = v347;
  id v318 = v50;
  uint64_t v320 = v52;
  do
  {
    uint64_t v54 = 0;
    uint64_t v319 = v51;
    do
    {
      if (*(void *)v427 != v52)
      {
        uint64_t v55 = v54;
        objc_enumerationMutation(v50);
        uint64_t v54 = v55;
      }
      uint64_t v321 = v54;
      id v56 = *(id *)(*((void *)&v426 + 1) + 8 * v54);
      uint64_t v322 = objc_msgSend(v56, "name", v318);
      id v329 = v56;
      if (!-[__CFDictionary objectForKey:](v350, "objectForKey:"))
      {
        uint64_t v57 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
        [(__CFArray *)v29 addObject:v322];
        id v56 = v329;
        [(__CFDictionary *)v350 setObject:v57 forKey:v322];
      }
      uint64_t v58 = [v56 versionHashModifier];
      if (v58)
      {
        uint64_t v59 = v58;
        if (![(__CFDictionary *)v334 objectForKey:v58])
        {
          uint64_t v60 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
          [(__CFArray *)v333 addObject:v59];
          uint64_t v61 = v60;
          id v56 = v329;
          [(__CFDictionary *)v334 setObject:v61 forKey:v59];
        }
      }
      uint64_t v62 = [v56 versionHash];
      if (v62)
      {
        uint64_t v63 = (const void *)v62;
        if (![(__CFDictionary *)v14 objectForKey:v62])
        {
          uint64_t v64 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
          [(__CFArray *)v344 addObject:v63];
          uint64_t v65 = (const void *)v64;
          id v56 = v329;
          CFDictionarySetValue(v14, v63, v65);
        }
      }
      uint64_t v66 = [v56 managedObjectClassName];
      if (v66)
      {
        uint64_t v67 = v66;
        if (![(__CFDictionary *)v350 objectForKey:v66])
        {
          uint64_t v68 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
          [(__CFArray *)v29 addObject:v67];
          uint64_t v69 = v68;
          id v56 = v329;
          [(__CFDictionary *)v350 setObject:v69 forKey:v67];
        }
      }
      uint64_t v70 = [v56 renamingIdentifier];
      if (v70)
      {
        uint64_t v71 = v70;
        if (![(__CFDictionary *)v334 objectForKey:v70])
        {
          uint64_t v72 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
          [(__CFArray *)v333 addObject:v71];
          uint64_t v73 = v72;
          id v56 = v329;
          [(__CFDictionary *)v334 setObject:v73 forKey:v71];
        }
      }
      uint64_t v74 = [v56 coreSpotlightDisplayNameExpression];
      if (v74)
      {
        long long v75 = (const void *)v74;
        if (![(__CFDictionary *)v14 objectForKey:v74])
        {
          uint64_t v76 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
          -[__CFArray addObject:](v344, "addObject:", [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v75 requiringSecureCoding:1 error:0]);
          long long v77 = (const void *)v76;
          id v56 = v329;
          CFDictionarySetValue(v14, v75, v77);
        }
      }
      long long v424 = 0u;
      long long v425 = 0u;
      long long v422 = 0u;
      long long v423 = 0u;
      id v335 = (id)[v56 indexes];
      uint64_t v339 = [v335 countByEnumeratingWithState:&v422 objects:v463 count:16];
      if (v339)
      {
        uint64_t v338 = *(void *)v423;
        do
        {
          long long v78 = 0;
          do
          {
            if (*(void *)v423 != v338) {
              objc_enumerationMutation(v335);
            }
            v341 = v78;
            uint64_t v79 = *(void **)(*((void *)&v422 + 1) + 8 * (void)v78);
            uint64_t v80 = [v79 name];
            if (v80)
            {
              uint64_t v81 = v80;
              if (![(__CFDictionary *)v350 objectForKey:v80])
              {
                uint64_t v82 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
                [(__CFArray *)v29 addObject:v81];
                [(__CFDictionary *)v350 setObject:v82 forKey:v81];
              }
            }
            uint64_t v83 = [v79 partialIndexPredicate];
            if (v83)
            {
              long long v84 = (const void *)v83;
              if (![(__CFDictionary *)v14 objectForKey:v83])
              {
                uint64_t v85 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                -[__CFArray addObject:](v344, "addObject:", [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v84 requiringSecureCoding:1 error:0]);
                CFDictionarySetValue(v14, v84, v85);
              }
            }
            long long v420 = 0u;
            long long v421 = 0u;
            long long v418 = 0u;
            long long v419 = 0u;
            uint64_t v86 = (void *)[v79 elements];
            uint64_t v87 = [v86 countByEnumeratingWithState:&v418 objects:v462 count:16];
            if (v87)
            {
              uint64_t v88 = v87;
              uint64_t v89 = *(void *)v419;
              do
              {
                for (uint64_t m = 0; m != v88; ++m)
                {
                  if (*(void *)v419 != v89) {
                    objc_enumerationMutation(v86);
                  }
                  uint64_t v91 = *(void **)(*((void *)&v418 + 1) + 8 * m);
                  uint64_t v92 = [v91 propertyName];
                  if (v92)
                  {
                    uint64_t v93 = v92;
                    if (![(__CFDictionary *)v350 objectForKey:v92])
                    {
                      uint64_t v94 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v345, "count"));
                      long long v14 = (__CFDictionary *)v348;
                      [(__CFArray *)v345 addObject:v93];
                      uint64_t v95 = v94;
                      uint64_t v53 = v347;
                      [(__CFDictionary *)v350 setObject:v95 forKey:v93];
                    }
                  }
                  uint64_t v96 = (void *)[v91 property];
                  if ([v96 _propertyType] == 5)
                  {
                    if (![(__CFDictionary *)v53 objectForKey:v96])
                    {
                      uint64_t v97 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](Mutable, "count"));
                      uint64_t v53 = v347;
                      [(__CFArray *)Mutable addObject:v96];
                      CFDictionarySetValue(v347, v96, v97);
                    }
                    uint64_t v98 = [v96 name];
                    if (![(__CFDictionary *)v350 objectForKey:v98])
                    {
                      uint64_t v99 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v345, "count"));
                      long long v14 = (__CFDictionary *)v348;
                      [(__CFArray *)v345 addObject:v98];
                      uint64_t v100 = v99;
                      uint64_t v53 = v347;
                      [(__CFDictionary *)v350 setObject:v100 forKey:v98];
                    }
                    LODWORD(v349) = v349 + 1;
                    uint64_t v101 = [v96 expression];
                    if (![(__CFDictionary *)v14 objectForKey:v101])
                    {
                      uint64_t v102 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                      long long v14 = (__CFDictionary *)v348;
                      -[__CFArray addObject:](v344, "addObject:", [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v101 requiringSecureCoding:1 error:0]);
                      [(id)v348 setObject:v102 forKey:v101];
                    }
                  }
                }
                v342 += v88;
                uint64_t v88 = [v86 countByEnumeratingWithState:&v418 objects:v462 count:16];
              }
              while (v88);
            }
            long long v78 = v341 + 1;
            uint64_t v29 = v345;
          }
          while (v341 + 1 != (char *)v339);
          v332 += v339;
          uint64_t v339 = [v335 countByEnumeratingWithState:&v422 objects:v463 count:16];
        }
        while (v339);
      }
      id v103 = v329;
      uint64_t v104 = (void *)[v329 userInfo];
      if ([v104 count] && !-[__CFDictionary objectForKey:](v14, "objectForKey:", v104))
      {
        uint64_t v105 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
        -[__CFArray addObject:](v344, "addObject:", [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v104 requiringSecureCoding:1 error:0]);
        uint64_t v106 = (const void *)v105;
        id v103 = v329;
        CFDictionarySetValue(v14, v104, v106);
      }
      if (!-[__CFDictionary objectForKey:](v331, "objectForKey:", [v103 _propertySearchMapping]))
      {
        unsigned int v107 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v330, "count"));
        id v103 = v329;
        -[__CFArray addObject:](v330, "addObject:", [v329 _propertySearchMapping]);
        CFDictionarySetValue(v331, (const void *)[v329 _propertySearchMapping], v107);
      }
      if ([v103 subentitiesByName])
      {
        if (objc_msgSend((id)objc_msgSend(v103, "subentitiesByName"), "count"))
        {
          uint64_t v108 = (const void *)objc_msgSend((id)objc_msgSend(v103, "subentitiesByName"), "mapping");
          if (![(__CFDictionary *)v331 objectForKey:v108])
          {
            uint64_t v109 = NSNumber;
            uint64_t v110 = [(__CFArray *)v330 count];
            long long v111 = v109;
            id v103 = v329;
            CFDictionarySetValue(v331, v108, (const void *)[v111 numberWithUnsignedInteger:v110]);
            [(__CFArray *)v330 addObject:v108];
          }
        }
      }
      long long v112 = (void *)[v103 attributesByName];
      if (!-[__CFDictionary objectForKey:](v331, "objectForKey:", [v112 mapping]))
      {
        uint64_t v113 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v330, "count"));
        -[__CFArray addObject:](v330, "addObject:", [v112 mapping]);
        long long v114 = (const void *)[v112 mapping];
        long long v115 = (const void *)v113;
        id v103 = v329;
        CFDictionarySetValue(v331, v114, v115);
      }
      long long v116 = (void *)[v103 relationshipsByName];
      if (!-[__CFDictionary objectForKey:](v331, "objectForKey:", [v116 mapping]))
      {
        uint64_t v117 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v330, "count"));
        -[__CFArray addObject:](v330, "addObject:", [v116 mapping]);
        long long v118 = (const void *)[v116 mapping];
        long long v119 = (const void *)v117;
        id v103 = v329;
        CFDictionarySetValue(v331, v118, v119);
      }
      long long v416 = 0u;
      long long v417 = 0u;
      long long v414 = 0u;
      long long v415 = 0u;
      long long v120 = (void *)[v103 properties];
      uint64_t v121 = [v120 countByEnumeratingWithState:&v414 objects:v461 count:16];
      if (v121)
      {
        uint64_t v122 = v121;
        id v123 = *(id *)v415;
        uint64_t v338 = (uint64_t)v120;
        id v335 = v123;
LABEL_105:
        id v124 = 0;
        uint64_t v339 = v122;
        while (1)
        {
          if (*(id *)v415 != v123) {
            objc_enumerationMutation(v120);
          }
          long long v125 = *(void **)(*((void *)&v414 + 1) + 8 * (void)v124);
          uint64_t v126 = [v125 name];
          if (object_getClass(v125) != v325) {
            break;
          }
LABEL_192:
          id v124 = (char *)v124 + 1;
          if (v124 == (id)v122)
          {
            uint64_t v122 = [v120 countByEnumeratingWithState:&v414 objects:v461 count:16];
            uint64_t v53 = v347;
            if (!v122) {
              goto LABEL_194;
            }
            goto LABEL_105;
          }
        }
        if (![(__CFDictionary *)v350 objectForKey:v126])
        {
          uint64_t v127 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
          [(__CFArray *)v29 addObject:v126];
          [(__CFDictionary *)v350 setValue:v127 forKey:v126];
        }
        uint64_t v128 = [v125 versionHashModifier];
        if (v128)
        {
          uint64_t v129 = v128;
          if (![(__CFDictionary *)v334 objectForKey:v128])
          {
            uint64_t v130 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
            [(__CFArray *)v333 addObject:v129];
            [(__CFDictionary *)v334 setValue:v130 forKey:v129];
          }
        }
        uint64_t v131 = [v125 versionHash];
        if (v131)
        {
          long long v132 = (const void *)v131;
          if (![(__CFDictionary *)v14 objectForKey:v131])
          {
            long long v133 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
            [(__CFArray *)v344 addObject:v132];
            CFDictionarySetValue(v14, v132, v133);
          }
        }
        long long v134 = (void *)[v125 renamingIdentifier];
        if (v134)
        {
          long long v135 = v134;
          if ((objc_msgSend(v134, "isEqualToString:", objc_msgSend(v125, "name")) & 1) == 0
            && ![(__CFDictionary *)v334 objectForKey:v135])
          {
            uint64_t v136 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
            [(__CFArray *)v333 addObject:v135];
            [(__CFDictionary *)v334 setObject:v136 forKey:v135];
          }
        }
        long long v137 = (void *)[v125 userInfo];
        if ([v137 count] && !-[__CFDictionary objectForKey:](v14, "objectForKey:", v137))
        {
          v138 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
          -[__CFArray addObject:](v344, "addObject:", [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v137 requiringSecureCoding:1 error:0]);
          CFDictionarySetValue(v14, v137, v138);
        }
        v139 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](Mutable, "count"));
        [(__CFArray *)Mutable addObject:v125];
        CFDictionarySetValue(v347, v125, v139);
        uint64_t v140 = [v125 _propertyType];
        v341 = (char *)v124;
        switch(v140)
        {
          case 2:
          case 6:
            uint64_t v141 = v140;
            uint64_t v142 = [v125 attributeValueClassName];
            if (v142)
            {
              uint64_t v143 = v142;
              if (![(__CFDictionary *)v350 objectForKey:v142])
              {
                uint64_t v144 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
                [(__CFArray *)v29 addObject:v143];
                [(__CFDictionary *)v350 setObject:v144 forKey:v143];
              }
            }
            uint64_t v145 = [v125 valueTransformerName];
            if (v145)
            {
              uint64_t v146 = v145;
              if (![(__CFDictionary *)v334 objectForKey:v145])
              {
                uint64_t v147 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
                [(__CFArray *)v333 addObject:v146];
                [(__CFDictionary *)v334 setObject:v147 forKey:v146];
              }
            }
            uint64_t v148 = [v125 defaultValue];
            if (!v148) {
              goto LABEL_157;
            }
            unsigned int v149 = (void *)v148;
            uint64_t v150 = [v125 attributeType];
            if (v150 <= 499)
            {
              if (v150 <= 299)
              {
                if (v150 != 100 && v150 != 200) {
                  goto LABEL_155;
                }
                goto LABEL_157;
              }
              if (v150 == 300) {
                goto LABEL_157;
              }
              if (v150 != 400)
              {
LABEL_155:
                if (![(__CFDictionary *)v14 objectForKey:v149])
                {
                  uint64_t v155 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v149 requiringSecureCoding:1 error:0];
                  v156 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                  long long v14 = (__CFDictionary *)v348;
                  [(__CFArray *)v344 addObject:v155];
                  CFDictionarySetValue((CFMutableDictionaryRef)v348, v149, v156);
                }
                goto LABEL_157;
              }
              unsigned int v149 = (void *)[v149 stringValue];
              if ([(__CFDictionary *)v350 objectForKey:v149])
              {
LABEL_157:
                if (v141 == 6)
                {
                  uint64_t v157 = [v125 derivationExpression];
                  if (v157)
                  {
                    unsigned int v158 = (const void *)v157;
                    if (![(__CFDictionary *)v14 objectForKey:v157])
                    {
                      uint64_t v159 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v158 requiringSecureCoding:1 error:0];
                      int v160 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                      long long v14 = (__CFDictionary *)v348;
                      [(__CFArray *)v344 addObject:v159];
                      CFDictionarySetValue((CFMutableDictionaryRef)v348, v158, v160);
                    }
                  }
                  if (v125)
                  {
                    unsigned int v161 = (const void *)v125[16];
                    if (v161)
                    {
                      if (![(__CFDictionary *)v14 objectForKey:v125[16]])
                      {
                        uint64_t v162 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v161 requiringSecureCoding:1 error:0];
                        int v163 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                        long long v14 = (__CFDictionary *)v348;
                        [(__CFArray *)v344 addObject:v162];
                        CFDictionarySetValue((CFMutableDictionaryRef)v348, v161, v163);
                      }
                    }
                  }
                  ++HIDWORD(v323);
                }
                else
                {
                  LODWORD(v323) = v323 + 1;
                }
                goto LABEL_167;
              }
              uint64_t v153 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
              [(__CFArray *)v29 addObject:v149];
              int v154 = v350;
            }
            else
            {
              if (v150 <= 699)
              {
                if (v150 != 500 && v150 != 600) {
                  goto LABEL_155;
                }
                goto LABEL_157;
              }
              if (v150 != 700)
              {
                if (v150 != 800 && v150 != 900) {
                  goto LABEL_155;
                }
                goto LABEL_157;
              }
              if ([(__CFDictionary *)v334 objectForKey:v149]) {
                goto LABEL_157;
              }
              uint64_t v153 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
              [(__CFArray *)v333 addObject:v149];
              int v154 = v334;
            }
            [(__CFDictionary *)v154 setObject:v153 forKey:v149];
            goto LABEL_157;
          case 3:
            ++HIDWORD(v324);
            v151 = (const void *)[v125 fetchRequest];
            if (!CFDictionaryGetValue(v337, v151))
            {
              v152 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v336, "count"));
              [(__CFArray *)v336 addObject:v151];
              CFDictionarySetValue(v337, v151, v152);
            }
            goto LABEL_167;
          case 4:
            LODWORD(v324) = v324 + 1;
LABEL_167:
            long long v412 = 0u;
            long long v413 = 0u;
            long long v410 = 0u;
            long long v411 = 0u;
            unsigned int v164 = v125;
            v165 = (void *)[v125 _rawValidationPredicates];
            uint64_t v166 = [v165 countByEnumeratingWithState:&v410 objects:v460 count:16];
            if (v166)
            {
              uint64_t v167 = v166;
              uint64_t v168 = *(void *)v411;
              do
              {
                for (uint64_t n = 0; n != v167; ++n)
                {
                  if (*(void *)v411 != v168) {
                    objc_enumerationMutation(v165);
                  }
                  int v170 = *(const void **)(*((void *)&v410 + 1) + 8 * n);
                  if (![(__CFDictionary *)v14 objectForKey:v170])
                  {
                    v171 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                    long long v14 = (__CFDictionary *)v348;
                    -[__CFArray addObject:](v344, "addObject:", [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v170 requiringSecureCoding:1 error:0]);
                    CFDictionarySetValue((CFMutableDictionaryRef)v348, v170, v171);
                  }
                }
                uint64_t v167 = [v165 countByEnumeratingWithState:&v410 objects:v460 count:16];
              }
              while (v167);
            }
            long long v408 = 0u;
            long long v409 = 0u;
            long long v406 = 0u;
            long long v407 = 0u;
            int v172 = (void *)[v164 _rawValidationWarnings];
            uint64_t v173 = [v172 countByEnumeratingWithState:&v406 objects:v459 count:16];
            if (!v173)
            {
              uint64_t v29 = v345;
              goto LABEL_191;
            }
            uint64_t v174 = v173;
            uint64_t v175 = *(void *)v407;
            uint64_t v29 = v345;
            while (2)
            {
              uint64_t v176 = 0;
LABEL_179:
              if (*(void *)v407 != v175) {
                objc_enumerationMutation(v172);
              }
              unint64_t v177 = *(void **)(*((void *)&v406 + 1) + 8 * v176);
              if ([v177 isNSString])
              {
                if (![(__CFDictionary *)v334 objectForKey:v177])
                {
                  uint64_t v178 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
                  uint64_t v29 = v345;
                  [(__CFArray *)v333 addObject:v177];
                  [(__CFDictionary *)v334 setObject:v178 forKey:v177];
                }
                goto LABEL_187;
              }
              if ([v177 isNSNumber])
              {
                if (![(__CFDictionary *)v14 objectForKey:v177])
                {
                  uint64_t v179 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                  long long v14 = (__CFDictionary *)v348;
                  -[__CFArray addObject:](v344, "addObject:", [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v177 requiringSecureCoding:1 error:0]);
                  CFDictionarySetValue((CFMutableDictionaryRef)v348, v177, v179);
                }
LABEL_187:
                if (v174 == ++v176)
                {
                  uint64_t v174 = [v172 countByEnumeratingWithState:&v406 objects:v459 count:16];
                  if (!v174)
                  {
LABEL_191:
                    long long v120 = (void *)v338;
                    uint64_t v122 = v339;
                    id v123 = v335;
                    id v124 = v341;
                    goto LABEL_192;
                  }
                  continue;
                }
                goto LABEL_179;
              }
              break;
            }
            uint64_t v189 = v328;
            if (!v328) {
              goto LABEL_211;
            }
            v190 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v191 = *MEMORY[0x1E4F281F8];
            uint64_t v192 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Invalid value in warnings array" forKey:@"Base error"];
LABEL_208:
            id v193 = 0;
            *uint64_t v189 = [v190 errorWithDomain:v191 code:134060 userInfo:v192];
            break;
          case 7:
            uint64_t v189 = v328;
            if (!v328) {
              goto LABEL_211;
            }
            v190 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v191 = *MEMORY[0x1E4F281F8];
            uint64_t v192 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Unsupported property; can't optimize composite attribute",
                     @"Base error",
                     v125,
                     @"Property",
                     0);
            goto LABEL_208;
          default:
            uint64_t v189 = v328;
            if (!v328) {
              goto LABEL_211;
            }
            v190 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v191 = *MEMORY[0x1E4F281F8];
            uint64_t v192 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Invalid property; can't optimize",
                     @"Base error",
                     v125,
                     @"Property",
                     0);
            goto LABEL_208;
        }
LABEL_212:
        CFMutableArrayRef v194 = Mutable;
        v195 = v344;
        unsigned int v196 = v333;
        unsigned int v197 = v334;
        CFMutableArrayRef v198 = v336;
        if (!Mutable) {
          goto LABEL_214;
        }
LABEL_213:
        CFRelease(v194);
        goto LABEL_214;
      }
LABEL_194:
      uint64_t v180 = [(NSSQLModel *)v327 entityNamed:v322];
      long long v402 = 0u;
      long long v403 = 0u;
      long long v404 = 0u;
      long long v405 = 0u;
      v181 = (void *)-[NSSQLEntity properties](v180);
      uint64_t v182 = [v181 countByEnumeratingWithState:&v402 objects:v458 count:16];
      if (v182)
      {
        uint64_t v183 = v182;
        uint64_t v184 = *(void *)v403;
        do
        {
          for (iuint64_t i = 0; ii != v183; ++ii)
          {
            if (*(void *)v403 != v184) {
              objc_enumerationMutation(v181);
            }
            uint64_t v186 = [*(id *)(*((void *)&v402 + 1) + 8 * ii) name];
            if (![(__CFDictionary *)v350 objectForKey:v186])
            {
              uint64_t v187 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
              [(__CFArray *)v29 addObject:v186];
              uint64_t v188 = v187;
              uint64_t v53 = v347;
              [(__CFDictionary *)v350 setObject:v188 forKey:v186];
            }
          }
          uint64_t v183 = [v181 countByEnumeratingWithState:&v402 objects:v458 count:16];
        }
        while (v183);
      }
      uint64_t v52 = v320;
      uint64_t v54 = v321 + 1;
      id v50 = v318;
    }
    while (v321 + 1 != v319);
    uint64_t v51 = [v318 countByEnumeratingWithState:&v426 objects:v464 count:16];
    uint64_t v52 = v320;
  }
  while (v51);
LABEL_244:
  long long v400 = 0u;
  long long v401 = 0u;
  long long v398 = 0u;
  long long v399 = 0u;
  uint64_t v338 = [(__CFArray *)v336 countByEnumeratingWithState:&v398 objects:v457 count:16];
  if (v338)
  {
    id v335 = *(id *)v399;
    do
    {
      uint64_t v203 = 0;
      do
      {
        if (*(id *)v399 != v335) {
          objc_enumerationMutation(v336);
        }
        uint64_t v339 = v203;
        v341 = *(char **)(*((void *)&v398 + 1) + 8 * v203);
        uint64_t v204 = [v341 predicate];
        uint64_t v205 = v347;
        if (v204)
        {
          unint64_t v206 = (const void *)v204;
          if (![(__CFDictionary *)v14 objectForKey:v204])
          {
            unsigned int v207 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
            -[__CFArray addObject:](v344, "addObject:", [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v206 requiringSecureCoding:1 error:0]);
            CFDictionarySetValue(v14, v206, v207);
          }
        }
        uint64_t v208 = [v341 havingPredicate];
        if (v208)
        {
          unint64_t v209 = (const void *)v208;
          if (![(__CFDictionary *)v14 objectForKey:v208])
          {
            unsigned int v210 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
            -[__CFArray addObject:](v344, "addObject:", [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v209 requiringSecureCoding:1 error:0]);
            CFDictionarySetValue(v14, v209, v210);
          }
        }
        uint64_t v211 = (void *)[v341 propertiesToFetch];
        long long v394 = 0u;
        long long v395 = 0u;
        long long v396 = 0u;
        long long v397 = 0u;
        uint64_t v212 = [v211 countByEnumeratingWithState:&v394 objects:v456 count:16];
        if (v212)
        {
          uint64_t v213 = v212;
          uint64_t v214 = *(void *)v395;
          do
          {
            for (juint64_t j = 0; jj != v213; ++jj)
            {
              if (*(void *)v395 != v214) {
                objc_enumerationMutation(v211);
              }
              uint64_t v216 = *(void **)(*((void *)&v394 + 1) + 8 * jj);
              if (object_getClass(v216) == v346)
              {
                if (![(__CFDictionary *)v205 objectForKey:v216])
                {
                  v217 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](Mutable, "count"));
                  uint64_t v205 = v347;
                  [(__CFArray *)Mutable addObject:v216];
                  CFDictionarySetValue(v347, v216, v217);
                }
                uint64_t v218 = [v216 name];
                if (![(__CFDictionary *)v350 objectForKey:v218])
                {
                  uint64_t v219 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v345, "count"));
                  long long v14 = (__CFDictionary *)v348;
                  [(__CFArray *)v345 addObject:v218];
                  uint64_t v220 = v219;
                  uint64_t v205 = v347;
                  [(__CFDictionary *)v350 setObject:v220 forKey:v218];
                }
                LODWORD(v349) = v349 + 1;
                uint64_t v221 = [v216 expression];
                if (![(__CFDictionary *)v14 objectForKey:v221])
                {
                  uint64_t v222 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                  long long v14 = (__CFDictionary *)v348;
                  -[__CFArray addObject:](v344, "addObject:", [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v221 requiringSecureCoding:1 error:0]);
                  [(id)v348 setObject:v222 forKey:v221];
                }
              }
            }
            uint64_t v213 = [v211 countByEnumeratingWithState:&v394 objects:v456 count:16];
          }
          while (v213);
        }
        v223 = (void *)[v341 propertiesToGroupBy];
        long long v390 = 0u;
        long long v391 = 0u;
        long long v392 = 0u;
        long long v393 = 0u;
        uint64_t v224 = [v223 countByEnumeratingWithState:&v390 objects:v455 count:16];
        if (v224)
        {
          uint64_t v225 = v224;
          uint64_t v226 = *(void *)v391;
          do
          {
            for (kuint64_t k = 0; kk != v225; ++kk)
            {
              if (*(void *)v391 != v226) {
                objc_enumerationMutation(v223);
              }
              uint64_t v228 = *(void **)(*((void *)&v390 + 1) + 8 * kk);
              if (object_getClass(v228) == v346)
              {
                if (![(__CFDictionary *)v205 objectForKey:v228])
                {
                  unsigned int v229 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](Mutable, "count"));
                  uint64_t v205 = v347;
                  [(__CFArray *)Mutable addObject:v228];
                  CFDictionarySetValue(v347, v228, v229);
                }
                uint64_t v230 = [v228 name];
                if (![(__CFDictionary *)v350 objectForKey:v230])
                {
                  uint64_t v231 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v345, "count"));
                  long long v14 = (__CFDictionary *)v348;
                  [(__CFArray *)v345 addObject:v230];
                  uint64_t v232 = v231;
                  uint64_t v205 = v347;
                  [(__CFDictionary *)v350 setObject:v232 forKey:v230];
                }
                LODWORD(v349) = v349 + 1;
                uint64_t v233 = [v228 expression];
                if (![(__CFDictionary *)v14 objectForKey:v233])
                {
                  uint64_t v234 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                  long long v14 = (__CFDictionary *)v348;
                  -[__CFArray addObject:](v344, "addObject:", [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v233 requiringSecureCoding:1 error:0]);
                  [(id)v348 setObject:v234 forKey:v233];
                }
              }
            }
            uint64_t v225 = [v223 countByEnumeratingWithState:&v390 objects:v455 count:16];
          }
          while (v225);
        }
        uint64_t v235 = (void *)[v341 sortDescriptors];
        long long v386 = 0u;
        long long v387 = 0u;
        long long v388 = 0u;
        long long v389 = 0u;
        uint64_t v236 = [v235 countByEnumeratingWithState:&v386 objects:v454 count:16];
        uint64_t v29 = v345;
        if (v236)
        {
          uint64_t v237 = v236;
          uint64_t v238 = *(void *)v387;
          do
          {
            for (muint64_t m = 0; mm != v237; ++mm)
            {
              if (*(void *)v387 != v238) {
                objc_enumerationMutation(v235);
              }
              uint64_t v240 = *(void *)(*((void *)&v386 + 1) + 8 * mm);
              if (![(__CFDictionary *)v14 objectForKey:v240])
              {
                uint64_t v241 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
                long long v14 = (__CFDictionary *)v348;
                -[__CFArray addObject:](v344, "addObject:", [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v240 requiringSecureCoding:1 error:0]);
                [(id)v348 setObject:v241 forKey:v240];
              }
            }
            uint64_t v237 = [v235 countByEnumeratingWithState:&v386 objects:v454 count:16];
          }
          while (v237);
        }
        unsigned int v242 = (void *)[v341 relationshipKeyPathsForPrefetching];
        long long v382 = 0u;
        long long v383 = 0u;
        long long v384 = 0u;
        long long v385 = 0u;
        uint64_t v243 = [v242 countByEnumeratingWithState:&v382 objects:v453 count:16];
        if (v243)
        {
          uint64_t v244 = v243;
          uint64_t v245 = *(void *)v383;
          do
          {
            for (nuint64_t n = 0; nn != v244; ++nn)
            {
              if (*(void *)v383 != v245) {
                objc_enumerationMutation(v242);
              }
              uint64_t v247 = *(void *)(*((void *)&v382 + 1) + 8 * nn);
              if (![(__CFDictionary *)v350 objectForKey:v247])
              {
                uint64_t v248 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFArray count](v345, "count"));
                [(__CFArray *)v345 addObject:v247];
                [(__CFDictionary *)v350 setObject:v248 forKey:v247];
              }
            }
            uint64_t v244 = [v242 countByEnumeratingWithState:&v382 objects:v453 count:16];
          }
          while (v244);
        }
        uint64_t v203 = v339 + 1;
      }
      while (v339 + 1 != v338);
      uint64_t v338 = [(__CFArray *)v336 countByEnumeratingWithState:&v398 objects:v457 count:16];
    }
    while (v338);
  }
  uint64_t v381 = 0;
  int v380 = -559038737;
  id v193 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  [v193 appendBytes:"momv2$srsraori55717101jhus-[6910aathnnhi86786714[-;uadmiraenv143" length:64];
  int v249 = [v193 length];
  unsigned int v250 = (v249 + 3) & 0xFFFFFFFC;
  if (v250 != v249) {
    [v193 appendBytes:&v381 length:v250 - v249];
  }
  v346 = (objc_class *)[v193 length];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v381 length:4];
  [v193 appendBytes:&v380 length:4];
  [v193 appendBytes:&v380 length:4];
  [v193 appendBytes:&v380 length:4];
  [v193 appendBytes:&v380 length:4];
  v341 = (char *)[v193 length];
  _writeInt32IntoData(v193, [(__CFArray *)v333 count]);
  long long v378 = 0u;
  long long v379 = 0u;
  long long v376 = 0u;
  long long v377 = 0u;
  uint64_t v251 = [(__CFArray *)v333 countByEnumeratingWithState:&v376 objects:v451 count:16];
  if (v251)
  {
    uint64_t v252 = v251;
    uint64_t v253 = *(void *)v377;
    do
    {
      for (uint64_t i1 = 0; i1 != v252; ++i1)
      {
        if (*(void *)v377 != v253) {
          objc_enumerationMutation(v333);
        }
        _writeStringIntoData(*(void **)(*((void *)&v376 + 1) + 8 * i1), v193, v452);
      }
      uint64_t v252 = [(__CFArray *)v333 countByEnumeratingWithState:&v376 objects:v451 count:16];
    }
    while (v252);
  }
  [v193 appendBytes:&v380 length:4];
  [v193 appendBytes:&v380 length:4];
  uint64_t v339 = [v193 length];
  _writeInt32IntoData(v193, [(__CFArray *)v29 count]);
  long long v374 = 0u;
  long long v375 = 0u;
  long long v372 = 0u;
  long long v373 = 0u;
  uint64_t v255 = [(__CFArray *)v29 countByEnumeratingWithState:&v372 objects:v450 count:16];
  if (v255)
  {
    uint64_t v256 = v255;
    uint64_t v257 = *(void *)v373;
    do
    {
      for (uint64_t i2 = 0; i2 != v256; ++i2)
      {
        if (*(void *)v373 != v257) {
          objc_enumerationMutation(v29);
        }
        _writePFEncodedStringShapeIntoData(v193, *(void **)(*((void *)&v372 + 1) + 8 * i2), v452);
      }
      uint64_t v256 = [(__CFArray *)v29 countByEnumeratingWithState:&v372 objects:v450 count:16];
    }
    while (v256);
  }
  [v193 appendBytes:&v380 length:4];
  [v193 appendBytes:&v380 length:4];
  uint64_t v338 = [v193 length];
  _writeInt32IntoData(v193, [(__CFArray *)v344 count]);
  long long v370 = 0u;
  long long v371 = 0u;
  long long v368 = 0u;
  long long v369 = 0u;
  uint64_t v259 = [(__CFArray *)v344 countByEnumeratingWithState:&v368 objects:v449 count:16];
  if (v259)
  {
    uint64_t v260 = v259;
    uint64_t v261 = *(void *)v369;
    do
    {
      for (uint64_t i3 = 0; i3 != v260; ++i3)
      {
        if (*(void *)v369 != v261) {
          objc_enumerationMutation(v344);
        }
        _writePFEncodedDataShapeIntoData(v193, *(void **)(*((void *)&v368 + 1) + 8 * i3));
      }
      uint64_t v260 = [(__CFArray *)v344 countByEnumeratingWithState:&v368 objects:v449 count:16];
    }
    while (v260);
  }
  [v193 appendBytes:&v380 length:4];
  [v193 appendBytes:&v380 length:4];
  id v335 = (id)[v193 length];
  _writeInt32IntoData(v193, [(__CFArray *)v330 count]);
  long long v366 = 0u;
  long long v367 = 0u;
  long long v364 = 0u;
  long long v365 = 0u;
  uint64_t v263 = [(__CFArray *)v330 countByEnumeratingWithState:&v364 objects:v448 count:16];
  if (v263)
  {
    uint64_t v264 = v263;
    uint64_t v265 = *(void *)v365;
    do
    {
      for (uint64_t i4 = 0; i4 != v264; ++i4)
      {
        if (*(void *)v365 != v265) {
          objc_enumerationMutation(v330);
        }
        _writeKKDMappingStrategyIntoData(v193, *(void **)(*((void *)&v364 + 1) + 8 * i4), v350);
      }
      uint64_t v264 = [(__CFArray *)v330 countByEnumeratingWithState:&v364 objects:v448 count:16];
    }
    while (v264);
  }
  [v193 appendBytes:&v380 length:4];
  [v193 appendBytes:&v380 length:4];
  id v329 = (id)[v193 length];
  _writeInt32IntoData(v193, v323);
  _writeInt32IntoData(v193, HIDWORD(v323));
  _writeInt32IntoData(v193, v324);
  _writeInt32IntoData(v193, v349);
  _writeInt32IntoData(v193, HIDWORD(v324));
  long long v362 = 0u;
  long long v363 = 0u;
  long long v360 = 0u;
  long long v361 = 0u;
  uint64_t v267 = [(__CFArray *)Mutable countByEnumeratingWithState:&v360 objects:v447 count:16];
  if (v267)
  {
    uint64_t v268 = v267;
    uint64_t v269 = *(void *)v361;
    do
    {
      for (uint64_t i5 = 0; i5 != v268; ++i5)
      {
        if (*(void *)v361 != v269) {
          objc_enumerationMutation(Mutable);
        }
        objc_msgSend(*(id *)(*((void *)&v360 + 1) + 8 * i5), "_writeIntoData:propertiesDict:uniquedPropertyNames:uniquedStrings:uniquedData:entitiesSlots:fetchRequests:", v193, v347, v350, v334, v14, objc_msgSend(*((id *)v340 + 4), "mapping"), v337);
      }
      uint64_t v268 = [(__CFArray *)Mutable countByEnumeratingWithState:&v360 objects:v447 count:16];
    }
    while (v268);
  }
  [v193 appendBytes:&v380 length:4];
  [v193 appendBytes:&v380 length:4];
  uint64_t v322 = [v193 length];
  _writeInt32IntoData(v193, [*((id *)v340 + 4) count]);
  uint64_t v271 = objc_msgSend((id)objc_msgSend(*((id *)v340 + 4), "mapping"), "length");
  if (v271)
  {
    uint64_t v272 = v271;
    for (uint64_t i6 = 0; i6 != v272; ++i6)
      objc_msgSend((id)objc_msgSend(*((id *)v340 + 4), "valueAtIndex:", i6), "_writeIntoData:propertiesDict:uniquedPropertyNames:uniquedStrings:uniquedData:uniquedMappings:entities:", v193, v347, v350, v334, v14, v331, *((void *)v340 + 4));
  }
  [v193 appendBytes:&v380 length:4];
  [v193 appendBytes:&v380 length:4];
  unint64_t v325 = (objc_class *)[v193 length];
  _writeInt32IntoData(v193, [(__CFArray *)v336 count]);
  uint64_t v274 = [(__CFArray *)v336 count];
  if (v274)
  {
    uint64_t v275 = v274;
    for (uint64_t i7 = 0; i7 != v275; ++i7)
      objc_msgSend((id)-[__CFArray objectAtIndex:](v336, "objectAtIndex:", i7), "_writeIntoData:propertiesDict:uniquedPropertyNames:uniquedStrings:uniquedData:uniquedMappings:entities:", v193, v347, v350, v334, v14, v331, *((void *)v340 + 4));
  }
  [v193 appendBytes:&v380 length:4];
  [v193 appendBytes:&v380 length:4];
  uint64_t v321 = [v193 length];
  _writeInt32IntoData(v193, *((_DWORD *)v340 + 16));
  v277 = (void *)*((void *)v340 + 4);
  if (v277) {
    unsigned int v278 = [v277 count];
  }
  else {
    unsigned int v278 = 0;
  }
  _writeInt32IntoData(v193, v278);
  if (v326 && [(NSKnownKeysDictionary *)v326 count])
  {
    _writeInt32IntoData(v193, [*((id *)v340 + 6) count]);
    long long v358 = 0u;
    long long v359 = 0u;
    long long v356 = 0u;
    long long v357 = 0u;
    v279 = (void *)[*((id *)v340 + 6) allValues];
    uint64_t v280 = [v279 countByEnumeratingWithState:&v356 objects:v446 count:16];
    if (v280)
    {
      uint64_t v281 = v280;
      uint64_t v282 = *(void *)v357;
      do
      {
        for (uint64_t i8 = 0; i8 != v281; ++i8)
        {
          if (*(void *)v357 != v282) {
            objc_enumerationMutation(v279);
          }
          unint64_t v284 = objc_msgSend((id)CFDictionaryGetValue(v337, *(const void **)(*((void *)&v356 + 1) + 8 * i8)), "unsignedIntegerValue");
          _writeInt64IntoData(v193, v284);
        }
        uint64_t v281 = [v279 countByEnumeratingWithState:&v356 objects:v446 count:16];
      }
      while (v281);
    }
  }
  else
  {
    _writeInt32IntoData(v193, 0);
  }
  v285 = (void *)*((void *)v340 + 5);
  if (v285)
  {
    _writeInt32IntoData(v193, [v285 count]);
    unsigned int v286 = (void *)[*((id *)v340 + 4) mapping];
    long long v352 = 0u;
    long long v353 = 0u;
    long long v354 = 0u;
    long long v355 = 0u;
    *(void *)&long long v348 = *((void *)v340 + 5);
    uint64_t v287 = [(id)v348 countByEnumeratingWithState:&v352 objects:v445 count:16];
    if (v287)
    {
      uint64_t v288 = v287;
      uint64_t v289 = *(void *)v353;
      do
      {
        for (uint64_t i9 = 0; i9 != v288; ++i9)
        {
          if (*(void *)v353 != v289) {
            objc_enumerationMutation((id)v348);
          }
          uint64_t v291 = *(void *)(*((void *)&v352 + 1) + 8 * i9);
          uint64_t v292 = (void *)[*((id *)v340 + 5) objectForKey:v291];
          _writeInt32IntoData(v193, objc_msgSend((id)-[__CFDictionary objectForKey:](v350, "objectForKey:", v291), "unsignedIntegerValue"));
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v292 = (void *)[v292 allObjects];
          }
          _writePFEncodedArrayShapeIntoData(v193, v292, v286, 0);
        }
        uint64_t v288 = [(id)v348 countByEnumeratingWithState:&v352 objects:v445 count:16];
      }
      while (v288);
    }
  }
  else
  {
    _writeInt32IntoData(v193, 0);
  }
  unint64_t v293 = (id *)v340;
  _writePFEncodedArrayShapeIntoData(v193, (void *)[*((id *)v340 + 7) allObjects], v14, 0);
  if ([*((id *)v340 + 4) count])
  {
    unint64_t v294 = 0;
    do
    {
      _writeInt64IntoData(v193, 0);
      ++v294;
    }
    while (v294 < [*((id *)v340 + 4) count]);
  }
  *(void *)&long long v348 = v327->_entitiesByName;
  uint64_t v295 = [*((id *)v340 + 4) count];
  uint64_t v29 = v345;
  if (v295)
  {
    uint64_t v296 = v295;
    for (uint64_t i10 = 0; i10 != v296; ++i10)
    {
      uint64_t v298 = objc_msgSend((id)objc_msgSend(v293[4], "valueAtIndex:", i10), "name");
      v299 = (void *)[(id)v348 objectForKey:v298];
      if (v299 && (v300 = (void *)v299[31]) != 0)
      {
        uint64_t v301 = [(id)-[NSSQLEntity properties]((uint64_t)v299) count];
        unint64_t v302 = MEMORY[0x1F4188790](v301);
        v305 = (char *)&v318 - v304;
        unint64_t v306 = v302;
        if (v302 > 0x200) {
          v305 = (char *)NSAllocateScannedUncollectable();
        }
        else {
          bzero((char *)&v318 - v304, 8 * v303);
        }
        uint64_t v307 = v300[1];
        if (v307 >= 1)
        {
          uint64_t v308 = 0;
          v309 = (uint64_t *)v300[9];
          do
          {
            uint64_t v311 = *v309++;
            uint64_t v310 = v311;
            uint64_t v312 = v300[8];
            if (v312 != v311 && v310 != ~v312) {
              *(void *)&v305[8 * v308++] = v310;
            }
            --v307;
          }
          while (v307);
        }
        uint64_t v314 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v305 count:v306];
        _writePFEncodedArrayShapeIntoData(v193, v314, v350, 0);

        if (v306 >= 0x201) {
          NSZoneFree(0, v305);
        }
        unint64_t v293 = (id *)v340;
      }
      else if (v328)
      {
        uint64_t v317 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSString, "stringWithFormat:", @"Can't find hashorder for entity '%@'", objc_msgSend(v299, "name")), @"Base Problem" code userInfo];
        uint64_t *v328 = v317;

        goto LABEL_211;
      }
    }
  }
  [v193 appendBytes:&v381 length:8];
  unsigned int v351 = bswap32(v321);
  int v315 = (int)v346;
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", v346, 4, &v351);
  unsigned int v351 = bswap32(v322);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 4), 4, &v351);
  unsigned int v351 = bswap32([v293[4] count]);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 8), 4, &v351);
  unsigned int v351 = bswap32(v329);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 12), 4, &v351);
  unsigned int v351 = bswap32([(__CFDictionary *)v347 count]);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 16), 4, &v351);
  unsigned int v351 = bswap32(v323);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 20), 4, &v351);
  unsigned int v351 = bswap32(HIDWORD(v323));
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 24), 4, &v351);
  unsigned int v351 = bswap32(v324);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 28), 4, &v351);
  unsigned int v351 = bswap32(v349);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 32), 4, &v351);
  unsigned int v351 = bswap32(HIDWORD(v324));
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 36), 4, &v351);
  unsigned int v351 = bswap32(v335);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 40), 4, &v351);
  unsigned int v351 = bswap32([(__CFArray *)v330 count]);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 44), 4, &v351);
  unsigned int v351 = bswap32(v338);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 48), 4, &v351);
  v195 = v344;
  unsigned int v351 = bswap32([(__CFArray *)v344 count]);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 52), 4, &v351);
  unsigned int v351 = bswap32(v341);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 56), 4, &v351);
  uint64_t v316 = v293;
  unsigned int v197 = v334;
  unsigned int v351 = bswap32([(__CFDictionary *)v334 count]);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 60), 4, &v351);
  unsigned int v351 = bswap32(v339);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 64), 4, &v351);
  unsigned int v351 = bswap32([(__CFDictionary *)v350 count]);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 68), 4, &v351);
  unsigned int v351 = bswap32(v325);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 72), 4, &v351);
  CFMutableArrayRef v198 = v336;
  unsigned int v351 = bswap32([(__CFArray *)v336 count]);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 76), 4, &v351);
  unsigned int v351 = bswap32([v316[6] count]);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 80), 4, &v351);
  unsigned int v351 = bswap32(v332);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 84), 4, &v351);
  unsigned int v351 = bswap32(v342);
  objc_msgSend(v193, "replaceBytesInRange:withBytes:", (v315 + 88), 4, &v351);
  CFMutableArrayRef v194 = Mutable;
  unsigned int v196 = v333;
  if (Mutable) {
    goto LABEL_213;
  }
LABEL_214:
  if (v347) {
    CFRelease(v347);
  }
  if (v196) {
    CFRelease(v196);
  }
  if (v197) {
    CFRelease(v197);
  }
  if (v29) {
    CFRelease(v29);
  }
  if (v350) {
    CFRelease(v350);
  }
  CFMutableArrayRef v199 = v330;
  unsigned int v200 = v331;
  v201 = v326;
  if (v195) {
    CFRelease(v195);
  }
  if (v14) {
    CFRelease(v14);
  }
  if (v199) {
    CFRelease(v199);
  }
  if (v200) {
    CFRelease(v200);
  }
  CFMutableDictionaryRef v202 = v337;
  if (v201) {

  }
  if (v198) {
    CFRelease(v198);
  }
  if (v202) {
    CFRelease(v202);
  }
  if (v327) {

  }
  if (v193) {
    return v193;
  }
  else {
    return 0;
  }
}

- (NSManagedObjectModel)initWithContentsOfURL:(id)a3 forStoreMetadata:(id)a4
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v7 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v8 = [a3 path];
  char v14 = 0;
  if (![v7 fileExistsAtPath:v8 isDirectory:&v14])
  {
LABEL_6:
    uint64_t v10 = 0;
    goto LABEL_12;
  }
  if (v14)
  {
    uint64_t v9 = [[NSManagedObjectModelBundle alloc] initWithPath:v8];
    if (v9)
    {
      uint64_t v10 = (NSManagedObjectModel *)-[NSManagedObjectModelBundle _modelForVersionHashes:](v9, "_modelForVersionHashes:", [a4 objectForKey:@"NSStoreModelVersionHashes"]);
      if (!v10) {
        goto LABEL_12;
      }
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  uint64_t v11 = [[NSManagedObjectModel alloc] initWithContentsOfURL:a3];
  if (!-[NSManagedObjectModel isConfiguration:compatibleWithStoreMetadata:](v11, "isConfiguration:compatibleWithStoreMetadata:", 0, a4)&& !-[NSManagedObjectModel _isConfiguration:inStyle:compatibleWithStoreMetadata:]((uint64_t)v11, v12, 1, a4))
  {
    uint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v10 = v11;
  if (v11)
  {
LABEL_10:
    uint64_t v11 = [[NSValidationErrorLocalizationPolicy alloc] initWithURL:a3];
    [(NSManagedObjectModel *)v10 _setLocalizationPolicy:v11];
LABEL_11:
  }
LABEL_12:
  [v6 drain];
  return v10;
}

- (id)_modelForVersionHashes:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(NSManagedObjectModel *)self entitiesByName];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v12 = [(NSDictionary *)v5 objectForKey:v11];
        uint64_t v13 = [a3 objectForKey:v11];
        if (v12)
        {
          uint64_t v14 = v13;
          if ((objc_msgSend((id)objc_msgSend(v12, "versionHash"), "isEqual:", v13) & 1) != 0
            || -[NSEntityDescription _hasPotentialHashSkew]((uint64_t)v12)
            && objc_msgSend((id)-[NSEntityDescription _newVersionHashInStyle:]((uint64_t)v12, 1), "isEqual:", v14))
          {
            if (!v8) {
              id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            objc_msgSend(v8, "addObject:", (id)objc_msgSend(v12, "copy"));
          }
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }
  if (![v8 count])
  {
    id v15 = 0;
    if (!v8) {
      return v15;
    }
    goto LABEL_28;
  }
  id v15 = [[NSManagedObjectModel alloc] _initWithEntities:v8];
  objc_msgSend(v15, "setVersionIdentifiers:", -[NSManagedObjectModel versionIdentifiers](self, "versionIdentifiers"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  fetchRequestTemplates = self->_fetchRequestTemplates;
  uint64_t v17 = [(NSMutableDictionary *)fetchRequestTemplates countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(fetchRequestTemplates);
        }
        uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * j);
        uint64_t v22 = (void *)[(NSMutableDictionary *)self->_fetchRequestTemplates objectForKey:v21];
        if (objc_msgSend(v8, "containsObject:", objc_msgSend(v22, "entity"))) {
          [v15 setFetchRequestTemplate:v22 forName:v21];
        }
      }
      uint64_t v18 = [(NSMutableDictionary *)fetchRequestTemplates countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v18);
  }
  if (v8) {
LABEL_28:
  }

  return v15;
}

+ (int64_t)_debugOptimizedModelLayout
{
  if (qword_1EB2706E0 != -1) {
    dispatch_once(&qword_1EB2706E0, &__block_literal_global_9);
  }
  return _MergedGlobals_76;
}

uint64_t __70__NSManagedObjectModel__NSInternalMethods___debugOptimizedModelLayout__block_invoke()
{
  uint64_t result = +[_PFRoutines integerValueForOverride:@"com.apple.CoreData.OptimizedModelLayoutDebug"];
  _MergedGlobals_76 = result;
  return result;
}

- (id)immutableCopy
{
  if ((*(unsigned char *)&self->_managedObjectModelFlags & 2) != 0)
  {
    return self;
  }
  else
  {
    id v2 = (void *)MEMORY[0x18C127630]();
    objc_super v3 = (void *)[(NSManagedObjectModel *)self copy];
    [v3 _createCachesAndOptimizeState];
    return v3;
  }
}

- (id)_entityVersionHashesDigest
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = -[NSManagedObjectModel _entityVersionHashesByNameInStyle:](result, 1);
    return -[NSManagedObjectModel _entityVersionHashesDigestFrom:](v1, v2);
  }
  return result;
}

- (void)_flattenProperties
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (void *)[(NSMutableDictionary *)self->_entities allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _flattenProperties];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (uint64_t)_hasEntityWithDerivedAttribute
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    id v2 = *(void **)(result + 32);
    uint64_t result = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v7;
      while (2)
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v2);
          }
          if (-[NSEntityDescription _hasDerivedAttributes]([*(id *)(v1 + 32) objectForKey:*(void *)(*((void *)&v6 + 1) + 8 * v5)])) {
            return 1;
          }
          ++v5;
        }
        while (v3 != v5);
        uint64_t result = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
        uint64_t v3 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

uint64_t __71__NSManagedObjectModel__NSInternalMethods___traverseTombstonesAndMark___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_msgSend(-[NSEntityDescription _attributeNamed:]((uint64_t)a2, a3), "setPreservesValueInHistoryOnDeletion:", *(unsigned __int8 *)(a1 + 40));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = objc_msgSend(a2, "subentities", 0);
  uint64_t result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
        ++v9;
      }
      while (v7 != v9);
      uint64_t result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

- (id)_localizationPolicy
{
  return *self->_additionalPrivateIvars;
}

- (id)_entitiesByVersionHash
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (void *)[result entities];
    id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v1, "count"));
    long long v7 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v1);
          }
          objc_msgSend(v2, "setObject:forKey:", *(void *)(*((void *)&v7 + 1) + 8 * v6), objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6), "versionHash"));
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
    return v2;
  }
  return result;
}

- (void)_stripForMigration
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(NSManagedObjectModel *)self entities];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _stripForMigration];
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_restoreValidation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(NSManagedObjectModel *)self entities];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _restoreValidation];
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

@end