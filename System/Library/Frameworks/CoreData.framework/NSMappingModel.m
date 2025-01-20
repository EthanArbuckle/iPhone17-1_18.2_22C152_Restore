@interface NSMappingModel
+ (BOOL)supportsSecureCoding;
+ (NSMappingModel)inferredMappingModelForSourceModel:(NSManagedObjectModel *)sourceModel destinationModel:(NSManagedObjectModel *)destinationModel error:(NSError *)error;
+ (NSMappingModel)mappingModelFromBundles:(NSArray *)bundles forSourceModel:(NSManagedObjectModel *)sourceModel destinationModel:(NSManagedObjectModel *)destinationModel;
+ (id)_mappingModelFromBundles:(void *)a3 forSourceModel:(void *)a4 destinationModel:;
+ (id)_newMappingModelFromBundles:(id)a3 forSourceHashes:(id)a4 destinationHashes:(id)a5;
+ (int)migrationDebugLevel;
+ (void)initialize;
+ (void)setMigrationDebugLevel:(int)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)entityMappings;
- (NSDictionary)entityMappingsByName;
- (NSMappingModel)init;
- (NSMappingModel)initWithCoder:(id)a3;
- (NSMappingModel)initWithContentsOfURL:(NSURL *)url;
- (id)_initWithEntityMappings:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)_hasInferredMappingNeedingValidation;
- (uint64_t)_isInferredMappingModel;
- (void)_throwIfNotEditable;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setEntityMappings:(NSArray *)entityMappings;
@end

@implementation NSMappingModel

+ (void)initialize
{
  self;
  if ((id)objc_opt_class() == a1)
  {
    self;
    _CoreData_MigrationDebug = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.MigrationDebug");
    if (!_CoreData_MigrationDebug)
    {
      v3 = getprogname();
      if (v3)
      {
        v4 = v3;
        if (*v3)
        {
          if (!strncmp("assetsd", v3, 7uLL) || !strncmp("photolibraryd", v4, 0xDuLL)) {
            _CoreData_MigrationDebug = 1;
          }
        }
      }
    }
  }
}

+ (id)_newMappingModelFromBundles:(id)a3 forSourceHashes:(id)a4 destinationHashes:(id)a5
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  int v75 = +[NSMappingModel migrationDebugLevel];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v67 = [a3 countByEnumeratingWithState:&v84 objects:v90 count:16];
  if (!v67) {
    return 0;
  }
  uint64_t v6 = *(void *)v85;
  uint64_t v65 = *(void *)v85;
  id v66 = a3;
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v85 != v6) {
        objc_enumerationMutation(a3);
      }
      uint64_t v68 = v7;
      v8 = *(void **)(*((void *)&v84 + 1) + 8 * v7);
      context = (void *)MEMORY[0x18C127630]();
      v9 = (void *)[v8 pathsForResourcesOfType:@"cdm" inDirectory:0];
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      obuint64_t j = v9;
      uint64_t v74 = [v9 countByEnumeratingWithState:&v80 objects:v89 count:16];
      if (v74)
      {
        uint64_t v71 = *(void *)v81;
        while (2)
        {
          for (uint64_t i = 0; i != v74; ++i)
          {
            if (*(void *)v81 != v71) {
              objc_enumerationMutation(obj);
            }
            v11 = *(void **)(*((void *)&v80 + 1) + 8 * i);
            v12 = [NSMappingModel alloc];
            v13 = -[NSMappingModel initWithContentsOfURL:](v12, "initWithContentsOfURL:", [MEMORY[0x1E4F1CB10] fileURLWithPath:v11]);
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            long long v76 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            v16 = [(NSMappingModel *)v13 entityMappings];
            uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v76 objects:v88 count:16];
            if (v17)
            {
              uint64_t v24 = v17;
              uint64_t v25 = *(void *)v77;
              do
              {
                for (uint64_t j = 0; j != v24; ++j)
                {
                  if (*(void *)v77 != v25) {
                    objc_enumerationMutation(v16);
                  }
                  v27 = *(void **)(*((void *)&v76 + 1) + 8 * j);
                  uint64_t v28 = [v27 sourceEntityVersionHash];
                  if (v28) {
                    [v14 addObject:v28];
                  }
                  uint64_t v29 = [v27 destinationEntityVersionHash];
                  if (v29) {
                    [v15 addObject:v29];
                  }
                }
                uint64_t v24 = [(NSArray *)v16 countByEnumeratingWithState:&v76 objects:v88 count:16];
              }
              while (v24);
            }
            if (v75 >= 2) {
              _NSCoreDataLog(4, @"(migration) checking mapping model %@\n source hashes: \n%@\n destination hashes: %@\n", v18, v19, v20, v21, v22, v23, (uint64_t)v11);
            }
            if ([v14 count]) {
              int v30 = [v14 isSubsetOfSet:a4];
            }
            else {
              int v30 = 0;
            }
            if ([v15 count]) {
              int v31 = [v15 isSubsetOfSet:a5];
            }
            else {
              int v31 = 0;
            }
            int v32 = v30 & v31;
            if (v75 >= 2 && (v32 & 1) == 0)
            {
              if (v30) {
                v33 = &stru_1ED787880;
              }
              else {
                v33 = @"source";
              }
              [v11 lastPathComponent];
              _NSCoreDataLog(4, @"(migration) mismatched %@%@%@ hashes for mapping model %@\n", v34, v35, v36, v37, v38, v39, (uint64_t)v33);
              if ((v30 & 1) == 0 && [v14 intersectsSet:a4])
              {
                v40 = (void *)[v14 mutableCopy];
                [v40 intersectSet:a4];
                uint64_t v41 = [a4 count];
                uint64_t v42 = [v40 count];
                _NSCoreDataLog(4, @"(migration) no match found for %d of %d mapping model source hashes", v43, v44, v45, v46, v47, v48, v41 - v42);
              }
              if ((v31 & 1) == 0 && [v15 intersectsSet:a5])
              {
                v49 = (void *)[v15 mutableCopy];
                [v49 intersectSet:a5];
                uint64_t v50 = [a5 count];
                uint64_t v51 = [v49 count];
                _NSCoreDataLog(4, @"(migration) no match found for %d of %d mapping model destination hashes", v52, v53, v54, v55, v56, v57, v50 - v51);
              }
            }

            if (v32)
            {
              if (v75 >= 1) {
                _NSCoreDataLog(4, @"(migration) found compatible mapping model %@", v58, v59, v60, v61, v62, v63, (uint64_t)v11);
              }
              return v13;
            }
          }
          uint64_t v74 = [obj countByEnumeratingWithState:&v80 objects:v89 count:16];
          if (v74) {
            continue;
          }
          break;
        }
      }
      uint64_t v7 = v68 + 1;
      uint64_t v6 = v65;
      a3 = v66;
    }
    while (v68 + 1 != v67);
    v13 = 0;
    uint64_t v67 = [v66 countByEnumeratingWithState:&v84 objects:v90 count:16];
  }
  while (v67);
  return v13;
}

+ (NSMappingModel)mappingModelFromBundles:(NSArray *)bundles forSourceModel:(NSManagedObjectModel *)sourceModel destinationModel:(NSManagedObjectModel *)destinationModel
{
  result = (NSMappingModel *)+[NSMappingModel _mappingModelFromBundles:forSourceModel:destinationModel:]((uint64_t)NSMappingModel, bundles, sourceModel, destinationModel);
  if (!result)
  {
    return (NSMappingModel *)+[NSMappingModel _mappingModelFromBundles:forSourceModel:destinationModel:]((uint64_t)NSMappingModel, 0, sourceModel, destinationModel);
  }
  return result;
}

+ (id)_mappingModelFromBundles:(void *)a3 forSourceModel:(void *)a4 destinationModel:
{
  uint64_t v7 = self;
  int v8 = +[NSMappingModel migrationDebugLevel];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (v8 >= 2)
  {
    uint64_t v10 = [a3 entityVersionHashesByName];
    [a4 entityVersionHashesByName];
    _NSCoreDataLog(4, @"(migration) looking for mapping model with \n source hashes: \n%@\n destination hashes: %@\n", v11, v12, v13, v14, v15, v16, v10);
  }
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend((id)objc_msgSend(a3, "entityVersionHashesByName"), "allValues"));
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend((id)objc_msgSend(a4, "entityVersionHashesByName"), "allValues"));
  int v37 = v8;
  if ([a2 count])
  {
    id v19 = (id)[a2 mutableCopy];
    uint64_t v20 = (void *)[v7 _newMappingModelFromBundles:v19 forSourceHashes:v17 destinationHashes:v18];
    if (v20)
    {
LABEL_14:
      [v9 drain];
      goto LABEL_15;
    }
  }
  else
  {
    id v19 = (id)[MEMORY[0x1E4F1CA48] array];
    uint64_t v25 = [MEMORY[0x1E4F28B50] mainBundle];
    if (v25) {
      [v19 addObject:v25];
    }
    uint64_t v20 = (void *)[v7 _newMappingModelFromBundles:v19 forSourceHashes:v17 destinationHashes:v18];
    if (v20) {
      goto LABEL_14;
    }
    uint64_t v26 = [MEMORY[0x1E4F28B50] allBundles];
    uint64_t v20 = (void *)[v7 _newMappingModelFromBundles:v26 forSourceHashes:v17 destinationHashes:v18];
    [v19 addObjectsFromArray:v26];
    if (v20) {
      goto LABEL_14;
    }
    uint64_t v27 = [MEMORY[0x1E4F28B50] allFrameworks];
    uint64_t v20 = (void *)[v7 _newMappingModelFromBundles:v27 forSourceHashes:v17 destinationHashes:v18];
    [v19 addObjectsFromArray:v27];
    if (v20) {
      goto LABEL_14;
    }
  }
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(-[NSManagedObjectModel _entityVersionHashesByNameInStyle:](a3, 1), "allValues"));
  char v22 = [v17 isEqual:v21];
  if ((v22 & 1) == 0)
  {
    uint64_t v20 = (void *)[v7 _newMappingModelFromBundles:v19 forSourceHashes:v21 destinationHashes:v18];
    if (v20) {
      goto LABEL_14;
    }
  }
  uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend((id)objc_msgSend(a4, "entityVersionHashesByName"), "allValues"));
  if ([v18 isEqual:v23])
  {
    uint64_t v20 = 0;
    int v24 = v37;
  }
  else
  {
    uint64_t v20 = (void *)[v7 _newMappingModelFromBundles:v19 forSourceHashes:v21 destinationHashes:v23];
    if (v20) {
      char v29 = 1;
    }
    else {
      char v29 = v22;
    }
    int v24 = v37;
    if ((v29 & 1) == 0) {
      uint64_t v20 = (void *)[v7 _newMappingModelFromBundles:v19 forSourceHashes:v17 destinationHashes:v23];
    }
  }
  [v9 drain];
  if (v24 >= 2 && !v20) {
    _NSCoreDataLog(4, @"(migration) no suitable mapping model found", v30, v31, v32, v33, v34, v35, v36);
  }
LABEL_15:

  return v20;
}

+ (NSMappingModel)inferredMappingModelForSourceModel:(NSManagedObjectModel *)sourceModel destinationModel:(NSManagedObjectModel *)destinationModel error:(NSError *)error
{
  if (!sourceModel)
  {
    uint64_t v31 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v32 = *MEMORY[0x1E4F1C3C8];
    uint64_t v33 = @"Cannot create an inferred NSMappingModel with a nil source model";
    goto LABEL_14;
  }
  if (!destinationModel)
  {
    uint64_t v31 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v32 = *MEMORY[0x1E4F1C3C8];
    uint64_t v33 = @"Cannot create an inferred NSMappingModel with a nil destination model";
LABEL_14:
    objc_exception_throw((id)[v31 exceptionWithName:v32 reason:v33 userInfo:0]);
  }
  int v8 = +[NSMappingModel migrationDebugLevel];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (v8 >= 1)
  {
    uint64_t v10 = [(NSManagedObjectModel *)sourceModel entityVersionHashesByName];
    [(NSManagedObjectModel *)destinationModel entityVersionHashesByName];
    _NSCoreDataLog(4, @"(migration) inferring a mapping model between data models with \n source hashes: \n%@\n destination hashes: %@\n", v11, v12, v13, v14, v15, v16, (uint64_t)v10);
  }
  id v34 = 0;
  uint64_t v17 = [[_NSMappingModelBuilder alloc] initWithSourceModel:sourceModel destinationModel:destinationModel];
  uint64_t v18 = -[_NSMappingModelBuilder newInferredMappingModel:]((NSMappingModel *)v17, (uint64_t *)&v34);
  id v19 = v34;

  [v9 drain];
  uint64_t v20 = v18;
  id v21 = v34;
  id v22 = 0;
  id v23 = v34;
  if (error && v34) {
    *error = (NSError *)v34;
  }
  if (v8 >= 1 && !v18)
  {
    [v23 userInfo];
    _NSCoreDataLog(4, @"(migration) inferring mapping model failed with error: %@ userInfo: %@\n", v24, v25, v26, v27, v28, v29, (uint64_t)v23);
  }
  return v18;
}

- (NSMappingModel)init
{
  return (NSMappingModel *)[(NSMappingModel *)self _initWithEntityMappings:0];
}

- (NSMappingModel)initWithContentsOfURL:(NSURL *)url
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:url];
  uint64_t v9 = 0;
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  uint64_t v7 = (NSMappingModel *)(id)+[_PFRoutines unarchiveCylicGraphObjectOfClasses:fromData:error:]((uint64_t)_PFRoutines, v6, v5, (uint64_t)&v9);
  [v4 drain];
  return v7;
}

- (void)dealloc
{
  self->_entityMappings = 0;
  self->_entityMappingsByName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSMappingModel;
  [(NSMappingModel *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSMappingModel *)self entityMappings];
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", a3), "init");
    uint64_t v8 = [(NSArray *)v6 count];
    if (v8)
    {
      uint64_t v9 = v8;
      for (uint64_t i = 0; i != v9; ++i)
      {
        uint64_t v11 = objc_msgSend(-[NSArray objectAtIndex:](v6, "objectAtIndex:", i), "copy");
        [v7 addObject:v11];
      }
    }
    [v5 setEntityMappings:v7];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(NSMappingModel *)self entityMappings];
  uint64_t v6 = [a3 entityMappings];
  if (v5 == (NSArray *)v6) {
    return 1;
  }
  uint64_t v7 = v6;
  BOOL result = 0;
  if (v5 && v7)
  {
    return -[NSArray isEqual:](v5, "isEqual:");
  }
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"(%@), entityMappings %@", objc_opt_class(), -[NSMappingModel entityMappings](self, "entityMappings")];
}

- (NSArray)entityMappings
{
  if (self->_entityMappings) {
    return &self->_entityMappings->super;
  }
  else {
    return (NSArray *)NSArray_EmptyArray;
  }
}

- (void)setEntityMappings:(NSArray *)entityMappings
{
  [(NSMappingModel *)self _throwIfNotEditable];
  uint64_t v5 = self->_entityMappings;
  if (v5 != (NSMutableArray *)entityMappings)
  {

    self->_entityMappings = (NSMutableArray *)[(NSArray *)entityMappings copy];
    self->_entityMappingsByName = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    NSUInteger v6 = [(NSArray *)entityMappings count];
    if (v6)
    {
      NSUInteger v7 = v6;
      for (uint64_t i = 0; v7 != i; ++i)
      {
        id v9 = [(NSArray *)entityMappings objectAtIndex:i];
        [(NSMappingModel *)self _throwIfNotEditable];
        if (v9)
        {
          uint64_t v10 = [v9 name];
          if (!v10)
          {
            uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v13 = *MEMORY[0x1E4F1C3C8];
            uint64_t v14 = @"Can't add unnamed entity mapping to model.";
            goto LABEL_12;
          }
          uint64_t v11 = v10;
          if ([(NSMutableDictionary *)self->_entityMappingsByName objectForKey:v10])
          {
            uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v16 = *MEMORY[0x1E4F1C3B8];
            uint64_t v14 = (__CFString *)[NSString stringWithFormat:@"Model already contains an entity mapping named %@.", v11];
            uint64_t v12 = v15;
            uint64_t v13 = v16;
LABEL_12:
            objc_exception_throw((id)[v12 exceptionWithName:v13 reason:v14 userInfo:0]);
          }
          [(NSMutableDictionary *)self->_entityMappingsByName setObject:v9 forKey:v11];
        }
      }
    }
  }
}

- (NSDictionary)entityMappingsByName
{
  return &self->_entityMappingsByName->super;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[NSMappingModel entityMappings](self, "entityMappings"), @"NSEntityMappings");
  uint64_t v5 = [(NSMappingModel *)self entityMappingsByName];

  [a3 encodeObject:v5 forKey:@"NSEntityMappingsByName"];
}

- (NSMappingModel)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NSMappingModel;
  id v4 = [(NSMappingModel *)&v12 init];
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    v4->_entityMappings = (NSMutableArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0), @"NSEntityMappings");
    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v4->_entityMappingsByName = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0), @"NSEntityMappingsByName");
  }
  return v4;
}

+ (int)migrationDebugLevel
{
  return _CoreData_MigrationDebug;
}

+ (void)setMigrationDebugLevel:(int)a3
{
  _CoreData_MigrationDebug = a3;
}

- (uint64_t)_isInferredMappingModel
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    v1 = objc_msgSend((id)result, "entityMappings", 0);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v8;
LABEL_4:
      uint64_t v5 = 0;
      while (1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = (void *)[*(id *)(*((void *)&v7 + 1) + 8 * v5) name];
        BOOL result = [v6 hasPrefix:_NSInferredMappingPrefix];
        if (!result) {
          break;
        }
        if (v3 == ++v5)
        {
          uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
          if (v3) {
            goto LABEL_4;
          }
          return 1;
        }
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)_hasInferredMappingNeedingValidation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    v1 = objc_msgSend((id)result, "entityMappings", 0);
    BOOL result = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      uint64_t v2 = result;
      uint64_t v3 = *(void *)v7;
      while (2)
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v7 != v3) {
            objc_enumerationMutation(v1);
          }
          uint64_t v5 = (void *)[*(id *)(*((void *)&v6 + 1) + 8 * v4) userInfo];
          if (objc_msgSend((id)objc_msgSend(v5, "objectForKey:", _NSInferredMappingCouldFailValidation), "BOOLValue")) {
            return 1;
          }
          ++v4;
        }
        while (v2 != v4);
        BOOL result = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
        uint64_t v2 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (id)_initWithEntityMappings:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSMappingModel;
  uint64_t v4 = [(NSMappingModel *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->_modelMappingFlags &= ~1u;
    v4->_entityMappings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_entityMappingsByName = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (a3) {
      [(NSMappingModel *)v5 setEntityMappings:a3];
    }
  }
  return v5;
}

- (void)_throwIfNotEditable
{
  if (!self || (*(unsigned char *)&self->_modelMappingFlags & 1) != 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't modify an immutable mapping model." userInfo:0]);
  }
}

@end