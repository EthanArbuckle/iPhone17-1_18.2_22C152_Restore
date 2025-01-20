@interface NSFetchRequest
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)supportsSecureCoding;
+ (NSFetchRequest)fetchRequestWithEntityName:(NSString *)entityName;
+ (id)_newDenormalizedFetchProperties:(id)a3;
+ (id)_stringForFetchRequestResultType:(unint64_t)a3;
+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 andPolicy:(id)a5;
+ (void)initialize;
- (BOOL)_disablePersistentStoreResultCaching;
- (BOOL)_isAsyncRequest;
- (BOOL)_isCachingFetchRequest;
- (BOOL)_isEditable;
- (BOOL)includesPendingChanges;
- (BOOL)includesPropertyValues;
- (BOOL)includesSubentities;
- (BOOL)isEqual:(id)a3;
- (BOOL)purgeableResult;
- (BOOL)returnsDistinctResults;
- (BOOL)returnsObjectsAsFaults;
- (BOOL)shouldRefreshRefetchedObjects;
- (NSArray)affectedStores;
- (NSArray)execute:(NSError *)error;
- (NSArray)propertiesToFetch;
- (NSArray)propertiesToGroupBy;
- (NSArray)relationshipKeyPathsForPrefetching;
- (NSArray)sortDescriptors;
- (NSEntityDescription)entity;
- (NSFetchRequest)init;
- (NSFetchRequest)initWithCoder:(id)a3;
- (NSFetchRequest)initWithEntityName:(NSString *)entityName;
- (NSFetchRequestResultType)resultType;
- (NSPredicate)havingPredicate;
- (NSPredicate)predicate;
- (NSString)entityName;
- (NSUInteger)fetchBatchSize;
- (NSUInteger)fetchLimit;
- (NSUInteger)fetchOffset;
- (id)_XPCEncodedFlags;
- (id)_asyncResultHandle;
- (id)_newNormalizedFetchProperties:(uint64_t)a1;
- (id)_newValidatedProperties:(int)a3 groupBy:(void *)a4 error:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeForXPC;
- (uint64_t)_bindExpressionDescriptionProperties:(uint64_t)result;
- (unint64_t)_encodedFetchRequestFlagsForFlags:(unint64_t)a3;
- (unint64_t)_fetchBatchLRUEntriesLimit;
- (unint64_t)allocationSize;
- (unint64_t)allocationType;
- (unint64_t)hash;
- (unint64_t)requestType;
- (void)_incrementInUseCounter;
- (void)_resolveEntityWithContext:(id)a3;
- (void)_setAsyncResultHandle:(id)a3;
- (void)_setDisablePersistentStoreResultCaching:(BOOL)a3;
- (void)_setFetchBatchLRUEntriesLimit:(unint64_t)a3;
- (void)_setFlagsFromXPCEncoding:(id)a3;
- (void)_throwIfNotEditable;
- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 uniquedMappings:(id)a8 entities:(id)a9;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAffectedStores:(NSArray *)affectedStores;
- (void)setAllocationSize:(unint64_t)a3;
- (void)setAllocationType:(unint64_t)a3;
- (void)setEntity:(NSEntityDescription *)entity;
- (void)setFetchBatchSize:(NSUInteger)fetchBatchSize;
- (void)setFetchLimit:(NSUInteger)fetchLimit;
- (void)setFetchOffset:(NSUInteger)fetchOffset;
- (void)setHavingPredicate:(NSPredicate *)havingPredicate;
- (void)setIncludesPendingChanges:(BOOL)includesPendingChanges;
- (void)setIncludesPropertyValues:(BOOL)includesPropertyValues;
- (void)setIncludesSubentities:(BOOL)includesSubentities;
- (void)setPredicate:(NSPredicate *)predicate;
- (void)setPropertiesToFetch:(NSArray *)propertiesToFetch;
- (void)setPropertiesToGroupBy:(NSArray *)propertiesToGroupBy;
- (void)setPurgeableResult:(BOOL)a3;
- (void)setRelationshipKeyPathsForPrefetching:(NSArray *)relationshipKeyPathsForPrefetching;
- (void)setResultType:(NSFetchRequestResultType)resultType;
- (void)setReturnsDistinctResults:(BOOL)returnsDistinctResults;
- (void)setReturnsObjectsAsFaults:(BOOL)returnsObjectsAsFaults;
- (void)setShouldRefreshRefetchedObjects:(BOOL)shouldRefreshRefetchedObjects;
- (void)setSortDescriptors:(NSArray *)sortDescriptors;
@end

@implementation NSFetchRequest

- (BOOL)_disablePersistentStoreResultCaching
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (unint64_t)requestType
{
  return 1;
}

- (NSArray)propertiesToFetch
{
  return self->_valuesToFetch;
}

- (NSUInteger)fetchBatchSize
{
  return self->_batchSize;
}

- (NSFetchRequestResultType)resultType
{
  return ((unint64_t)self->_flags >> 3) & 7;
}

- (NSEntityDescription)entity
{
  if ((*((unsigned char *)&self->_flags + 1) & 2) != 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F28778], objc_msgSend(NSString, "stringWithFormat:", @"This fetch request (%p) was created with a string name (%@), and cannot respond to -entity until used by an NSManagedObjectContext", self, self->_entity, 0), 0 reason userInfo]);
  }
  return self->_entity;
}

- (NSArray)relationshipKeyPathsForPrefetching
{
  return self->_relationshipKeyPathsForPrefetching;
}

- (BOOL)returnsObjectsAsFaults
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (NSUInteger)fetchLimit
{
  return self->_fetchLimit;
}

- (BOOL)includesPropertyValues
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)includesPendingChanges
{
  return (*(_DWORD *)&self->_flags & 0x80) == 0 && (*(_DWORD *)&self->_flags & 0x38) != 16;
}

- (void)_resolveEntityWithContext:(id)a3
{
  _fetchRequestFlags flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    entity = self->_entity;
    v6 = +[NSEntityDescription entityForName:entity inManagedObjectContext:a3];
    if (!v6) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"NSFetchRequest could not locate an NSEntityDescription for entity name '%@'", entity), 0 reason userInfo]);
    }
    v7 = v6;

    self->_entity = v7;
    _fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFDFF);
    self->__fetchRequestFlags flags = flags;
  }
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
    id v16 = 0;
    valuesToFetch = self->_valuesToFetch;
    if (valuesToFetch)
    {
      v9 = (NSArray *)-[NSFetchRequest _newValidatedProperties:groupBy:error:](self, valuesToFetch, 0, &v16);
      if (!v9) {
        goto LABEL_19;
      }
      v10 = v9;

      self->_valuesToFetch = v10;
    }
    groupByProperties = self->_groupByProperties;
    if (!groupByProperties)
    {
LABEL_11:
      _fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags | 0x800);
      self->__fetchRequestFlags flags = flags;
      goto LABEL_12;
    }
    v12 = (NSArray *)-[NSFetchRequest _newValidatedProperties:groupBy:error:](self, groupByProperties, 1, &v16);
    if (v12)
    {
      v13 = v12;

      self->_groupByProperties = v13;
      goto LABEL_11;
    }
LABEL_19:
    objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v16, "userInfo"), "valueForKey:", @"NSUnderlyingException"));
  }
LABEL_12:
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
    v14 = self->_valuesToFetch;
    if (v14) {
      -[NSFetchRequest _bindExpressionDescriptionProperties:]((uint64_t)self, v14);
    }
    v15 = self->_groupByProperties;
    if (v15) {
      -[NSFetchRequest _bindExpressionDescriptionProperties:]((uint64_t)self, v15);
    }
    *(_DWORD *)&self->_flags |= 0x1000u;
  }
}

- (void)allowEvaluation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)&self->_flags + 2) & 0x80) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(NSPredicate *)self->_predicate allowEvaluation];
    }
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    sortDescriptors = self->_sortDescriptors;
    uint64_t v4 = [(NSArray *)sortDescriptors countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(sortDescriptors);
          }
          v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v8 allowEvaluation];
          }
        }
        uint64_t v5 = [(NSArray *)sortDescriptors countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
    *(_DWORD *)&self->_flags |= 0x800000u;
  }
}

- (unint64_t)allocationType
{
  return ((unint64_t)self->_flags >> 14) & 7;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (BOOL)includesSubentities
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (NSPredicate)havingPredicate
{
  return self->_havingPredicate;
}

- (NSUInteger)fetchOffset
{
  return (NSUInteger)*self->_additionalPrivateIvars;
}

- (NSArray)propertiesToGroupBy
{
  return self->_groupByProperties;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (BOOL)returnsDistinctResults
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)dealloc
{
  if ((*((unsigned char *)&self->_flags + 1) & 2) != 0) {

  }
  self->_entity = 0;
  self->_predicate = 0;

  self->_sortDescriptors = 0;
  self->_relationshipKeyPathsForPrefetching = 0;

  self->_valuesToFetch = 0;
  self->_groupByProperties = 0;

  self->_havingPredicate = 0;
  *((void *)self->_additionalPrivateIvars + 1) = 0;
  PF_FREE_OBJECT_ARRAY(self->_additionalPrivateIvars);
  self->_additionalPrivateIvars = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSFetchRequest;
  [(NSPersistentStoreRequest *)&v3 dealloc];
}

- (id)_newValidatedProperties:(int)a3 groupBy:(void *)a4 error:
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  [a1 _throwIfNotEditable];
  id v76 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v70 = a1;
  if ((a1[26] & 0x38) != 0) {
    int v7 = 1;
  }
  else {
    int v7 = a3;
  }
  int v72 = v7;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v73 = [a2 countByEnumeratingWithState:&v88 objects:v94 count:16];
  if (v73)
  {
    uint64_t v74 = *(void *)v89;
    int v75 = a3;
    v71 = a2;
LABEL_7:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v89 != v74) {
        objc_enumerationMutation(a2);
      }
      long long v9 = *(NSExpressionDescription **)(*((void *)&v88 + 1) + 8 * v8);
      uint64_t v77 = v8;
      if ([(NSExpressionDescription *)v9 isNSString])
      {
        long long v10 = (void *)[(NSExpressionDescription *)v9 componentsSeparatedByString:@"."];
        long long v11 = (void *)[v70 entity];
        uint64_t v12 = [v10 count];
        if (v12 == 1)
        {
          v13 = (NSExpressionDescription *)objc_msgSend((id)objc_msgSend(v11, "propertiesByName"), "objectForKey:", v9);
          if (v13)
          {
            uint64_t v14 = v13;
            if (v72 && [(NSPropertyDescription *)v13 isTransient])
            {
LABEL_118:

              v53 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v54 = *MEMORY[0x1E4F1C3C8];
              v61 = @"setPropertiesToFetch:";
              if (a3) {
                v61 = @"setPropertiesToGroupBy:";
              }
              uint64_t v58 = [NSString stringWithFormat:@"Invalid keypath %@ passed to %@", v9, v61];
              goto LABEL_132;
            }
            if (a3
              && [(NSExpressionDescription *)v14 _propertyType] == 4
              && (unint64_t)[(NSExpressionDescription *)v14 maxCount] >= 2)
            {
LABEL_121:

              v53 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v54 = *MEMORY[0x1E4F1C3C8];
              uint64_t v58 = [NSString stringWithFormat:@"Invalid keypath %@ passed to setPropertiesToGroupBy:", v9, v67];
LABEL_132:
              uint64_t v65 = [v53 exceptionWithName:v54 reason:v58 userInfo:0];
              if (!a4) {
                return 0;
              }
              id v76 = 0;
              *a4 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", v65, @"NSUnderlyingException"));
              return v76;
            }
          }
          else
          {
            if (![(NSExpressionDescription *)v9 isEqualToString:@"objectID"]) {
              goto LABEL_118;
            }
            v49 = objc_alloc_init(NSExpressionDescription);
            [(NSPropertyDescription *)v49 setName:@"objectID"];
            -[NSExpressionDescription setExpression:](v49, "setExpression:", [MEMORY[0x1E4F28C68] expressionForEvaluatedObject]);
            [(NSExpressionDescription *)v49 setExpressionResultType:2000];
            uint64_t v14 = v49;
          }
          goto LABEL_86;
        }
        uint64_t v18 = v12;
        uint64_t v19 = [v10 objectAtIndex:0];
        if (v11) {
          v20 = (NSExpressionDescription *)objc_msgSend((id)objc_msgSend(v11, "propertiesByName"), "objectForKey:", v19);
        }
        else {
          v20 = 0;
        }
        if ([(NSExpressionDescription *)v20 _propertyType] == 7)
        {
          if ((unint64_t)[v10 count] >= 2)
          {
            char v21 = 0;
            unint64_t v22 = 1;
LABEL_28:
            v78 = v9;
            do
            {
              v23 = (void *)[v10 objectAtIndex:v22];
              long long v84 = 0u;
              long long v85 = 0u;
              long long v86 = 0u;
              long long v87 = 0u;
              v24 = (void *)[(NSExpressionDescription *)v20 elements];
              uint64_t v25 = [v24 countByEnumeratingWithState:&v84 objects:v93 count:16];
              if (v25)
              {
                uint64_t v26 = v25;
                uint64_t v27 = *(void *)v85;
LABEL_31:
                uint64_t v28 = 0;
                while (1)
                {
                  if (*(void *)v85 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v14 = *(NSExpressionDescription **)(*((void *)&v84 + 1) + 8 * v28);
                  if (objc_msgSend(v23, "isEqualToString:", -[NSPropertyDescription name](v14, "name"))) {
                    break;
                  }
                  if (v26 == ++v28)
                  {
                    uint64_t v26 = [v24 countByEnumeratingWithState:&v84 objects:v93 count:16];
                    if (v26) {
                      goto LABEL_31;
                    }
                    goto LABEL_37;
                  }
                }
                ++v22;
                char v21 = 1;
                v20 = v14;
                long long v9 = v14;
                if ([v10 count] > v22) {
                  goto LABEL_28;
                }
                goto LABEL_86;
              }
LABEL_37:
              ++v22;
            }
            while ([v10 count] > v22);
            long long v9 = v78;
            uint64_t v14 = v78;
            if (v21) {
              goto LABEL_86;
            }
          }

          v53 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v54 = *MEMORY[0x1E4F1C3C8];
          v55 = NSString;
          v56 = @"setPropertiesToFetch:";
          BOOL v57 = v75 == 0;
LABEL_103:
          if (!v57) {
            v56 = @"setPropertiesToGroupBy:";
          }
          uint64_t v58 = [v55 stringWithFormat:@"Invalid keypath %@ passed to %@:", v9, v56];
          goto LABEL_132;
        }
        if (v18)
        {
          uint64_t v43 = objc_msgSend((id)objc_msgSend(v11, "propertiesByName"), "objectForKey:", objc_msgSend(v10, "objectAtIndex:", 0));
          if (v43)
          {
            v44 = (void *)v43;
            uint64_t v45 = 1;
            while (1)
            {
              if (v72 && [v44 isTransient]) {
                goto LABEL_102;
              }
              if (a3 && [v44 _propertyType] == 4 && (unint64_t)objc_msgSend(v44, "maxCount") >= 2) {
                goto LABEL_121;
              }
              uint64_t v46 = [v44 _propertyType];
              if ((v46 & 0xFFFFFFFFFFFFFFFBLL) == 2) {
                break;
              }
              if (v46 != 4)
              {

                v53 = (void *)MEMORY[0x1E4F1CA00];
                uint64_t v54 = *MEMORY[0x1E4F1C3C8];
                v59 = @"setPropertiesToFetch:";
                if (a3) {
                  v59 = @"setPropertiesToGroupBy:";
                }
                uint64_t v58 = [NSString stringWithFormat:@"Invalid keypath %@ passed to %@ (invalid property type)", v9, v59];
                goto LABEL_132;
              }
              if ((a3 & 1) == 0 && [v44 isToMany])
              {

                v53 = (void *)MEMORY[0x1E4F1CA00];
                uint64_t v54 = *MEMORY[0x1E4F1C3C8];
                uint64_t v58 = [NSString stringWithFormat:@"Invalid to many relationship in setPropertiesToFetch: (%@)", v9, v67];
                goto LABEL_132;
              }
              if (v18 == v45)
              {
                uint64_t v14 = objc_alloc_init(NSExpressionDescription);
                [(NSPropertyDescription *)v14 setName:v9];
                -[NSExpressionDescription setExpression:](v14, "setExpression:", [MEMORY[0x1E4F28C68] expressionForKeyPath:v9]);
                v51 = v14;
                uint64_t v50 = 2000;
                goto LABEL_97;
              }
              v44 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "destinationEntity"), "propertiesByName"), "objectForKey:", objc_msgSend(v10, "objectAtIndex:", v45++));
              if (!v44) {
                goto LABEL_102;
              }
            }
            if (v18 == v45)
            {
              uint64_t v14 = objc_alloc_init(NSExpressionDescription);
              [(NSPropertyDescription *)v14 setName:v9];
              -[NSExpressionDescription setExpression:](v14, "setExpression:", [MEMORY[0x1E4F28C68] expressionForKeyPath:v9]);
              uint64_t v50 = [v44 attributeType];
              v51 = v14;
LABEL_97:
              [(NSExpressionDescription *)v51 setExpressionResultType:v50];
              goto LABEL_86;
            }

            v53 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v54 = *MEMORY[0x1E4F1C3C8];
            v64 = @"setPropertiesToFetch:";
            if (a3) {
              v64 = @"setPropertiesToGroupBy:";
            }
            uint64_t v58 = [NSString stringWithFormat:@"Invalid keypath %@ passed to %@ (non-terminal attribute)", v9, v64];
            goto LABEL_132;
          }
LABEL_102:

          v53 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v54 = *MEMORY[0x1E4F1C3C8];
          v55 = NSString;
          v56 = @"setPropertiesToFetch:";
          BOOL v57 = a3 == 0;
          goto LABEL_103;
        }
      }
      else
      {
        uint64_t v15 = [(NSExpressionDescription *)v9 _propertyType];
        if (v15 == 5)
        {
          if (a3)
          {
            id v16 = [(NSExpressionDescription *)v9 expression];
            uint64_t v17 = [(NSExpression *)v16 expressionType];
            if (v17 != 3)
            {
              if (v17 == 4 && sel_valueForKey_ != (char *)[(NSExpression *)v16 selector]) {
                [(NSExpression *)v16 selector];
              }

              v53 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v54 = *MEMORY[0x1E4F1C3C8];
              uint64_t v58 = [NSString stringWithFormat:@"Invalid keypath expression (%@) passed to setPropertiesToFetch:", v9, v67];
              goto LABEL_132;
            }
          }
        }
        else
        {
          uint64_t v29 = v15;
          if (v72 && [(NSPropertyDescription *)v9 isTransient])
          {

            v53 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v54 = *MEMORY[0x1E4F1C3C8];
            v62 = @"setPropertiesToFetch:";
            if (a3) {
              v62 = @"setPropertiesToGroupBy:";
            }
            uint64_t v58 = [NSString stringWithFormat:@"Invalid property %@ passed to %@ (property is transient)", v9, v62];
            goto LABEL_132;
          }
          v30 = (void *)[v70 entity];
          v31 = objc_msgSend(-[NSPropertyDescription _qualifiedName](v9, "_qualifiedName"), "componentsSeparatedByString:", @".");
          v79 = v9;
          v69 = v30;
          if ((unint64_t)[v31 count] < 2)
          {
            uint64_t v47 = [(NSPropertyDescription *)v9 name];
            if (!v30) {
              goto LABEL_109;
            }
            v33 = objc_msgSend((id)objc_msgSend(v30, "propertiesByName"), "objectForKey:", v47);
          }
          else
          {
            uint64_t v32 = [v31 objectAtIndex:0];
            if (v30) {
              v33 = objc_msgSend((id)objc_msgSend(v30, "propertiesByName"), "objectForKey:", v32);
            }
            else {
              v33 = 0;
            }
            if ((unint64_t)[v31 count] >= 2)
            {
              unint64_t v35 = 1;
              do
              {
                v36 = (void *)[v31 objectAtIndex:v35];
                long long v80 = 0u;
                long long v81 = 0u;
                long long v82 = 0u;
                long long v83 = 0u;
                v37 = (void *)[v33 elements];
                uint64_t v38 = [v37 countByEnumeratingWithState:&v80 objects:v92 count:16];
                if (v38)
                {
                  uint64_t v39 = v38;
                  uint64_t v40 = *(void *)v81;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v39; ++i)
                    {
                      if (*(void *)v81 != v40) {
                        objc_enumerationMutation(v37);
                      }
                      v42 = *(void **)(*((void *)&v80 + 1) + 8 * i);
                      if (objc_msgSend(v36, "isEqualToString:", objc_msgSend(v42, "name")))
                      {
                        v33 = v42;
                        goto LABEL_58;
                      }
                    }
                    uint64_t v39 = [v37 countByEnumeratingWithState:&v80 objects:v92 count:16];
                    if (v39) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_58:
                ++v35;
              }
              while ([v31 count] > v35);
            }
          }
          if (!v33)
          {
LABEL_109:

            v53 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v54 = *MEMORY[0x1E4F1C3C8];
            v60 = @"setPropertiesToFetch:";
            if (v75) {
              v60 = @"setPropertiesToGroupBy:";
            }
            uint64_t v58 = [NSString stringWithFormat:@"Attribute/relationship description names passed to %@ must match name on fetch entity (%@)", v60, v79];
            goto LABEL_132;
          }
          long long v9 = v79;
          if ((v75 & 1) != 0 || BYTE2(z9dsptsiQ80etb9782fsrs98bfdle88))
          {
            uint64_t v48 = [(NSPropertyDescription *)v79 entity];
            if (v69)
            {
              uint64_t v34 = v48;
              if (v69 != (void *)v48 && ([v69 _subentitiesIncludes:v48] & 1) == 0)
              {

                v53 = (void *)MEMORY[0x1E4F1CA00];
                uint64_t v54 = *MEMORY[0x1E4F1C3C8];
                uint64_t v58 = [NSString stringWithFormat:@"Invalid property (%@) passed to setPropertiesToFetch: (entity mismatch)", v79, v67];
                goto LABEL_132;
              }
            }
          }
          if (v29 == 4 && [(NSExpressionDescription *)v79 isToMany])
          {

            v53 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v54 = *MEMORY[0x1E4F1C3C8];
            v63 = @"setPropertiesToFetch:";
            if (v75) {
              v63 = @"setPropertiesToGroupBy:";
            }
            uint64_t v58 = [NSString stringWithFormat:@"Invalid to many relationship (%@) passed to %@:", v79, v63];
            goto LABEL_132;
          }
        }
      }
      uint64_t v14 = v9;
LABEL_86:
      if ([v76 indexOfObjectIdenticalTo:v14] == 0x7FFFFFFFFFFFFFFFLL) {
        [v76 addObject:v14];
      }
      uint64_t v8 = v77 + 1;
      a3 = v75;
      a2 = v71;
      if (v77 + 1 == v73)
      {
        uint64_t v52 = [v71 countByEnumeratingWithState:&v88 objects:v94 count:16];
        uint64_t v73 = v52;
        if (v52) {
          goto LABEL_7;
        }
        return v76;
      }
    }
  }
  return v76;
}

- (void)setFetchOffset:(NSUInteger)fetchOffset
{
  *self->_additionalPrivateIvars = (id)fetchOffset;
}

- (void)setRelationshipKeyPathsForPrefetching:(NSArray *)relationshipKeyPathsForPrefetching
{
  [(NSFetchRequest *)self _throwIfNotEditable];
  if (self->_relationshipKeyPathsForPrefetching != relationshipKeyPathsForPrefetching)
  {
    uint64_t v5 = (NSArray *)[(NSArray *)relationshipKeyPathsForPrefetching copy];

    self->_relationshipKeyPathsForPrefetching = v5;
  }
}

- (void)setFetchBatchSize:(NSUInteger)fetchBatchSize
{
  self->_batchSize = fetchBatchSize;
}

- (void)setIncludesPendingChanges:(BOOL)includesPendingChanges
{
  BOOL v3 = includesPendingChanges;
  [(NSFetchRequest *)self _throwIfNotEditable];
  if (v3) {
    int v5 = 0;
  }
  else {
    int v5 = 128;
  }
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v5);
}

- (void)setReturnsObjectsAsFaults:(BOOL)returnsObjectsAsFaults
{
  BOOL v3 = returnsObjectsAsFaults;
  [(NSFetchRequest *)self _throwIfNotEditable];
  if (v3) {
    int v5 = 64;
  }
  else {
    int v5 = 0;
  }
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v5);
}

- (void)setFetchLimit:(NSUInteger)fetchLimit
{
  unsigned int v3 = fetchLimit;
  [(NSFetchRequest *)self _throwIfNotEditable];
  self->_fetchLimit = v3;
}

- (void)setSortDescriptors:(NSArray *)sortDescriptors
{
  [(NSFetchRequest *)self _throwIfNotEditable];
  int v5 = self->_sortDescriptors;
  if (v5 != sortDescriptors)
  {

    self->_sortDescriptors = (NSArray *)[(NSArray *)sortDescriptors copy];
  }
}

- (NSFetchRequest)init
{
  v4.receiver = self;
  v4.super_class = (Class)NSFetchRequest;
  v2 = [(NSFetchRequest *)&v4 init];
  if (v2)
  {
    v2->_additionalPrivateIvars = (id *)PF_CALLOC_OBJECT_ARRAY(3);
    v2->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&v2->_flags & 0xFFBE1B00 | 0x46);
  }
  return v2;
}

- (void)setIncludesSubentities:(BOOL)includesSubentities
{
  BOOL v3 = includesSubentities;
  [(NSFetchRequest *)self _throwIfNotEditable];
  if (v3) {
    int v5 = 2;
  }
  else {
    int v5 = 0;
  }
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v5);
}

- (void)setEntity:(NSEntityDescription *)entity
{
  if ((*((unsigned char *)&self->_flags + 1) & 2) != 0)
  {
    if (([(NSString *)[(NSEntityDescription *)entity name] isEqual:self->_entity] & 1) == 0) {
      [(NSFetchRequest *)self _throwIfNotEditable];
    }

    *(_DWORD *)&self->_flags &= ~0x200u;
  }
  else
  {
    [(NSFetchRequest *)self _throwIfNotEditable];
  }
  self->_entity = entity;
}

- (void)setIncludesPropertyValues:(BOOL)includesPropertyValues
{
  BOOL v3 = includesPropertyValues;
  [(NSFetchRequest *)self _throwIfNotEditable];
  if (v3) {
    int v5 = 4;
  }
  else {
    int v5 = 0;
  }
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v5);
}

- (void)setPredicate:(NSPredicate *)predicate
{
  [(NSFetchRequest *)self _throwIfNotEditable];
  int v5 = self->_predicate;
  if (v5 != predicate)
  {

    self->_predicate = predicate;
  }
}

- (void)_throwIfNotEditable
{
  if (![(NSFetchRequest *)self _isEditable]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't modify a named fetch request in an immutable model." userInfo:0]);
  }
}

- (BOOL)_isEditable
{
  return (*((unsigned char *)&self->_flags + 1) & 1) == 0;
}

- (id)_asyncResultHandle
{
  return (id)*((void *)self->_additionalPrivateIvars + 1);
}

- (void)_setAsyncResultHandle:(id)a3
{
  id v5 = (id)*((void *)self->_additionalPrivateIvars + 1);
  if (v5) {
    BOOL v6 = v5 == a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {

  }
  if (a3) {
    *(_DWORD *)&self->_flags |= 0x200000u;
  }
  *((void *)self->_additionalPrivateIvars + 1) = a3;
}

- (BOOL)_isCachingFetchRequest
{
  return 0;
}

- (BOOL)_isAsyncRequest
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSFetchRequest;
  objc_super v4 = [(NSPersistentStoreRequest *)&v8 copyWithZone:a3];
  if (v4)
  {
    entity = self->_entity;
    if ((*((unsigned char *)&self->_flags + 1) & 2) != 0) {
      entity = entity;
    }
    v4[6] = entity;
    v4[7] = self->_predicate;
    v4[8] = [(NSArray *)self->_sortDescriptors copy];
    v4[10] = self->_fetchLimit;
    v4[11] = self->_allocationSize;
    v4[9] = self->_batchSize;
    *((_DWORD *)v4 + 26) = v4[13] & 0xFFE1FFFF | (((*(_DWORD *)&self->_flags >> 17) & 0xF) << 17);
    *(void *)v4[4] = *self->_additionalPrivateIvars;
    *((_DWORD *)v4 + 26) = *(_DWORD *)&self->_flags & 0xFFFFF6FF;
    v4[12] = [(NSArray *)self->_relationshipKeyPathsForPrefetching copy];
    v4[5] = [(NSArray *)self->_valuesToFetch copy];
    v4[3] = [(NSPredicate *)self->_havingPredicate copy];
    v4[2] = [(NSArray *)self->_groupByProperties copy];
    unsigned int v6 = v4[13] & 0xFFFE3FFF | (((*(_DWORD *)&self->_flags >> 14) & 7) << 14);
    *((_DWORD *)v4 + 26) = v6;
    *((_DWORD *)v4 + 26) = v6 & 0xFFBFFFFF | (((*(_DWORD *)&self->_flags >> 22) & 1) << 22);
  }
  return v4;
}

- (NSFetchRequest)initWithEntityName:(NSString *)entityName
{
  objc_super v4 = [(NSFetchRequest *)self init];
  id v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->_flags |= 0x200u;
    v4->_entity = (NSEntityDescription *)[(NSString *)entityName copy];
  }
  return v5;
}

+ (id)_newDenormalizedFetchProperties:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((id)[MEMORY[0x1E4F1CA98] null] == a3) {
    return 0;
  }
  objc_super v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 isNSString])
        {
          [v4 addObject:v9];
        }
        else
        {
          long long v10 = objc_alloc_init(NSExpressionDescription);
          -[NSPropertyDescription setName:](v10, "setName:", [v9 objectAtIndex:0]);
          -[NSExpressionDescription setExpressionResultType:](v10, "setExpressionResultType:", objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 1), "unsignedIntegerValue"));
          -[NSExpressionDescription setExpression:](v10, "setExpression:", [v9 objectAtIndex:2]);
          [v4 addObject:v10];
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  return v4;
}

- (NSArray)affectedStores
{
  v3.receiver = self;
  v3.super_class = (Class)NSFetchRequest;
  return [(NSPersistentStoreRequest *)&v3 affectedStores];
}

- (NSString)entityName
{
  p__fetchRequestFlags flags = &self->_flags;
  result = (NSString *)self->_entity;
  if ((*((unsigned char *)p_flags + 1) & 2) == 0) {
    return (NSString *)[(NSString *)result name];
  }
  return result;
}

- (void)_incrementInUseCounter
{
  *(_DWORD *)&self->_flags |= 0x100u;
}

+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 andPolicy:(id)a5
{
  objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:a3 error:0];
  [v8 setDelegate:a4];
  uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  long long v10 = (void *)+[_NSXPCStoreUtilities classesForFetchArchive]();
  if (a5) {
    long long v10 = objc_msgSend(v10, "setByAddingObjectsFromSet:", objc_msgSend(a5, "allowableClassesForClientWithContext:", a4));
  }
  long long v11 = (void *)[v8 decodeObjectOfClasses:v10 forKey:@"root"];

  long long v12 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", [v11 objectAtIndex:0]);
  -[NSFetchRequest _setFlagsFromXPCEncoding:](v12, "_setFlagsFromXPCEncoding:", [v11 objectAtIndex:1]);
  uint64_t v13 = [v11 objectAtIndex:2];
  if (v9 != v13) {
    [(NSFetchRequest *)v12 setSortDescriptors:v13];
  }
  uint64_t v14 = [v11 objectAtIndex:3];
  if (v9 != v14) {
    [(NSFetchRequest *)v12 setPredicate:v14];
  }
  uint64_t v15 = [v11 objectAtIndex:4];
  if (v9 != v15) {
    [(NSFetchRequest *)v12 setHavingPredicate:v15];
  }
  uint64_t v16 = [v11 objectAtIndex:5];
  if (v9 != v16) {
    [(NSFetchRequest *)v12 setRelationshipKeyPathsForPrefetching:v16];
  }
  -[NSFetchRequest setFetchOffset:](v12, "setFetchOffset:", objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 6), "unsignedIntegerValue"));
  -[NSFetchRequest setFetchLimit:](v12, "setFetchLimit:", objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 7), "unsignedLongValue"));
  -[NSFetchRequest setFetchBatchSize:](v12, "setFetchBatchSize:", objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 8), "unsignedIntegerValue"));
  uint64_t v17 = [v11 objectAtIndex:9];
  if (v9 != v17)
  {
    uint64_t v18 = (void *)[a1 _newDenormalizedFetchProperties:v17];
    [(NSFetchRequest *)v12 setPropertiesToFetch:v18];
  }
  uint64_t v19 = [v11 objectAtIndex:10];
  if (v9 != v19)
  {
    v20 = (void *)[a1 _newDenormalizedFetchProperties:v19];
    [(NSFetchRequest *)v12 setPropertiesToGroupBy:v20];
  }
  return v12;
}

+ (NSFetchRequest)fetchRequestWithEntityName:(NSString *)entityName
{
  objc_super v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEntityName:entityName];

  return (NSFetchRequest *)v3;
}

- (void)setPropertiesToFetch:(NSArray *)propertiesToFetch
{
  [(NSFetchRequest *)self _throwIfNotEditable];
  if (self->_valuesToFetch != propertiesToFetch)
  {
    if ([(NSEntityDescription *)self->_entity isNSString])
    {
      *(_DWORD *)&self->_flags &= ~0x800u;
      uint64_t v5 = (NSArray *)[(NSArray *)propertiesToFetch copy];
    }
    else
    {
      id v7 = 0;
      uint64_t v6 = (NSArray *)-[NSFetchRequest _newValidatedProperties:groupBy:error:](self, propertiesToFetch, 0, &v7);
      if (!v6) {
        objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v7, "userInfo"), "valueForKey:", @"NSUnderlyingException"));
      }
      uint64_t v5 = v6;
      *(_DWORD *)&self->_flags |= 0x800u;
    }

    self->_valuesToFetch = v5;
  }
}

- (void)setAffectedStores:(NSArray *)affectedStores
{
  [(NSFetchRequest *)self _throwIfNotEditable];
  v5.receiver = self;
  v5.super_class = (Class)NSFetchRequest;
  [(NSPersistentStoreRequest *)&v5 setAffectedStores:affectedStores];
}

- (void)setPropertiesToGroupBy:(NSArray *)propertiesToGroupBy
{
  [(NSFetchRequest *)self _throwIfNotEditable];
  if (self->_groupByProperties != propertiesToGroupBy)
  {
    if ([(NSEntityDescription *)self->_entity isNSString])
    {
      *(_DWORD *)&self->_flags &= ~0x800u;
      objc_super v5 = (NSArray *)[(NSArray *)propertiesToGroupBy copy];
    }
    else
    {
      id v7 = 0;
      uint64_t v6 = (NSArray *)-[NSFetchRequest _newValidatedProperties:groupBy:error:](self, propertiesToGroupBy, 1, &v7);
      if (!v6) {
        objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v7, "userInfo"), "valueForKey:", @"NSUnderlyingException"));
      }
      objc_super v5 = v6;
      *(_DWORD *)&self->_flags |= 0x800u;
    }

    self->_groupByProperties = v5;
  }
}

- (void)setResultType:(NSFetchRequestResultType)resultType
{
  [(NSFetchRequest *)self _throwIfNotEditable];
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFC7 | (8 * (resultType & 7)));
  if (resultType == 4 || resultType == 1)
  {
    [(NSFetchRequest *)self setIncludesPropertyValues:0];
  }
}

- (void)setShouldRefreshRefetchedObjects:(BOOL)shouldRefreshRefetchedObjects
{
  BOOL v3 = shouldRefreshRefetchedObjects;
  [(NSFetchRequest *)self _throwIfNotEditable];
  if (v3) {
    int v5 = 1024;
  }
  else {
    int v5 = 0;
  }
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v5);
}

- (void)setReturnsDistinctResults:(BOOL)returnsDistinctResults
{
  BOOL v3 = returnsDistinctResults;
  [(NSFetchRequest *)self _throwIfNotEditable];
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | v3);
}

- (unint64_t)_fetchBatchLRUEntriesLimit
{
  _fetchRequestFlags flags = self->_flags;
  BOOL v3 = ((*(unsigned int *)&flags >> 17) & 0xF) == 0;
  unsigned int v4 = 1 << (((*(unsigned int *)&flags >> 17) & 0xF) - 1);
  if (v3) {
    return 0;
  }
  else {
    return v4;
  }
}

- (BOOL)shouldRefreshRefetchedObjects
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (void)setHavingPredicate:(NSPredicate *)havingPredicate
{
  [(NSFetchRequest *)self _throwIfNotEditable];
  if (self->_havingPredicate != havingPredicate)
  {
    int v5 = havingPredicate;

    self->_havingPredicate = havingPredicate;
  }
}

- (void)setAllocationType:(unint64_t)a3
{
  [(NSFetchRequest *)self _throwIfNotEditable];
  if (((a3 - 1 < 2) & _PF_XPCStore_DisableExplicitBufferedAllocations_91407470) != 0) {
    int v5 = 49152;
  }
  else {
    int v5 = (a3 & 7) << 14;
  }
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFE3FFF | v5);
}

- (void)_setFlagsFromXPCEncoding:(id)a3
{
  self->__fetchRequestFlags flags = (_fetchRequestFlags)[a3 integerValue];
}

- (id)encodeForXPC
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_msgSend(v5, "addObject:", -[NSFetchRequest entityName](self, "entityName"));
  objc_msgSend(v5, "addObject:", -[NSFetchRequest _XPCEncodedFlags](self, "_XPCEncodedFlags"));
  uint64_t v6 = [(NSFetchRequest *)self sortDescriptors];
  if (v6) {
    [v5 addObject:v6];
  }
  else {
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
  }
  id v7 = [(NSFetchRequest *)self predicate];
  if (v7)
  {
    if (isKindOfClass) {
      id v7 = [(NSPredicate *)v7 predicateWithSubstitutionVariables:[(NSFetchRequest *)self substitutionVariables]];
    }
    id v8 = [+[_NSXPCStorePredicateRemapper defaultInstance] createPredicateForFetchFromPredicate:v7];
    [v5 addObject:v8];
  }
  else
  {
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
  }
  uint64_t v9 = [(NSFetchRequest *)self havingPredicate];
  if (v9)
  {
    if (isKindOfClass) {
      uint64_t v9 = [(NSPredicate *)v9 predicateWithSubstitutionVariables:[(NSFetchRequest *)self substitutionVariables]];
    }
    [v5 addObject:v9];
  }
  else
  {
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
  }
  long long v10 = [(NSFetchRequest *)self relationshipKeyPathsForPrefetching];
  if (v10) {
    [v5 addObject:v10];
  }
  else {
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
  }
  objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", -[NSFetchRequest fetchOffset](self, "fetchOffset")));
  objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", -[NSFetchRequest fetchLimit](self, "fetchLimit")));
  objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", -[NSFetchRequest fetchBatchSize](self, "fetchBatchSize")));
  if ([(NSFetchRequest *)self resultType] == 2 || ![(NSFetchRequest *)self resultType])
  {
    id v11 = -[NSFetchRequest _newNormalizedFetchProperties:]((uint64_t)self, [(NSFetchRequest *)self propertiesToFetch]);
    [v5 addObject:v11];
  }
  else
  {
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
  }
  id v12 = -[NSFetchRequest _newNormalizedFetchProperties:]((uint64_t)self, [(NSFetchRequest *)self propertiesToGroupBy]);
  [v5 addObject:v12];

  id v13 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v5);
  [v3 drain];
  id v14 = 0;
  return v13;
}

- (id)_newNormalizedFetchProperties:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (a2)
  {
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a2, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v4 = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v4) {
      return v3;
    }
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    while (1)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(a2);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * v7);
        if ([v8 isNSString])
        {
          uint64_t v9 = v3;
          uint64_t v10 = (uint64_t)v8;
LABEL_13:
          [v9 addObject:v10];
          goto LABEL_14;
        }
        unint64_t v11 = [v8 _propertyType];
        if (v11 > 7) {
          goto LABEL_14;
        }
        if (((1 << v11) & 0xD4) != 0)
        {
          uint64_t v10 = [v8 name];
          uint64_t v9 = v3;
          goto LABEL_13;
        }
        if (v11 == 5)
        {
          id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
          objc_msgSend(v12, "addObject:", objc_msgSend(v8, "name"));
          objc_msgSend(v12, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "expressionResultType")));
          objc_msgSend(v12, "addObject:", objc_msgSend(v8, "expression"));
          [v3 addObject:v12];
        }
LABEL_14:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v13 = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v5 = v13;
      if (!v13) {
        return v3;
      }
    }
  }
  uint64_t v15 = (void *)[MEMORY[0x1E4F1CA98] null];

  return v15;
}

- (id)_XPCEncodedFlags
{
  return (id)[NSNumber numberWithInteger:*(_DWORD *)&self->_flags & 0xFFFFFCFF | 0x200];
}

- (uint64_t)_bindExpressionDescriptionProperties:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    id v3 = (void *)result;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    result = [a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v11;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(a2);
          }
          uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v8 = (void *)[v7 expression];
            if ([v8 expressionType] == 3) {
              id v9 = -[NSEntityDescription _attributeNamed:]([v3 entity], objc_msgSend(v8, "keyPath"));
            }
            else {
              id v9 = 0;
            }
            -[NSExpressionDescription setUnderlyingAttribute:](v7, v9);
          }
          ++v6;
        }
        while (v4 != v6);
        result = [a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (NSArray)execute:(NSError *)error
{
  uint64_t v4 = *(void **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
  if (!v4)
  {
    uint64_t v7 = 0;
    char v8 = 1;
    if (!error) {
      return v7;
    }
    goto LABEL_8;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    uint64_t v7 = (NSArray *)[v4 executeFetchRequest:self error:error];
  }
  else {
    uint64_t v7 = 0;
  }
  char v8 = isKindOfClass ^ 1;
  if (error)
  {
LABEL_8:
    if (v8) {
      *error = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:&unk_1ED7E1C40];
    }
  }
  return v7;
}

+ (void)initialize
{
  self;
  objc_opt_class();
  if ((id)objc_opt_class() == a1)
  {

    id v3 = getprogname();
    if (v3)
    {
      if (*v3)
      {
        if (!strncmp("PhotosReliveWidget", v3, 0x12uLL)) {
          _PF_XPCStore_DisableExplicitBufferedAllocations_91407470 = 1;
        }
      }
    }
  }
}

- (id)description
{
  id v3 = [(NSFetchRequest *)self entityName];
  v21.receiver = self;
  v21.super_class = (Class)NSFetchRequest;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", CFSTR("%@ (entity: %@; predicate: (%@); sortDescriptors: (%@); "),
                 [(NSFetchRequest *)&v21 description],
                 v3,
                 [(NSFetchRequest *)self predicate],
                 [(NSFetchRequest *)self sortDescriptors]);
  NSUInteger v5 = [(NSFetchRequest *)self fetchLimit];
  if (v5) {
    objc_msgSend(v4, "appendFormat:", @"limit: %u; ", v5);
  }
  NSUInteger v6 = [(NSFetchRequest *)self fetchOffset];
  if (v6) {
    objc_msgSend(v4, "appendFormat:", @"offset: %u; ", v6);
  }
  NSUInteger v7 = [(NSFetchRequest *)self fetchBatchSize];
  if (v7) {
    objc_msgSend(v4, "appendFormat:", @"batch size: %u; ", v7);
  }
  char v8 = +[NSFetchRequest _stringForFetchRequestResultType:((unint64_t)self->_flags >> 3) & 7];
  uint64_t v9 = [(__CFString *)v8 length];
  long long v10 = @"unknown request type";
  if (v9) {
    long long v10 = v8;
  }
  [v4 appendFormat:@"type: %@; ", v10];
  id v11 = [(NSArray *)[(NSFetchRequest *)self affectedStores] valueForKey:@"identifier"];
  if (v11) {
    [v4 appendFormat:@"affected stores: (%@); ", v11];
  }
  if (![(NSFetchRequest *)self includesSubentities]) {
    [v4 appendString:@"includesSubentities: NO; "];
  }
  if (![(NSFetchRequest *)self includesPropertyValues]) {
    [v4 appendString:@"includesPropertyValues: NO; "];
  }
  if (![(NSFetchRequest *)self returnsObjectsAsFaults]) {
    [v4 appendString:@"returnsObjectsAsFaults: NO; "];
  }
  if (![(NSFetchRequest *)self includesPendingChanges]) {
    [v4 appendString:@"includesPendingChanges: NO; "];
  }
  if ([(NSFetchRequest *)self returnsDistinctResults]) {
    [v4 appendString:@"returnsDistinctResults: YES; "];
  }
  _fetchRequestFlags flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    [v4 appendString:@"shouldRefreshRefetchedObjects: YES; "];
    _fetchRequestFlags flags = self->_flags;
  }
  int v13 = (*(unsigned int *)&flags >> 14) & 7;
  if (v13 == 1)
  {
    id v14 = @"NSFetchRequestBufferAllocationType";
  }
  else
  {
    if (v13 != 2) {
      goto LABEL_28;
    }
    id v14 = @"NSFetchRequestVMBufferAllocationType";
  }
  [v4 appendFormat:@"allocation type: %@; ", v14];
LABEL_28:
  unint64_t v15 = [(NSFetchRequest *)self allocationSize];
  if (v15) {
    objc_msgSend(v4, "appendFormat:", @"allocation size: %u; ", v15);
  }
  long long v16 = [(NSFetchRequest *)self relationshipKeyPathsForPrefetching];
  if ([(NSArray *)v16 count]) {
    [v4 appendFormat:@"relationshipKeyPathsForPrefetching: (%@); ", v16];
  }
  long long v17 = [(NSFetchRequest *)self propertiesToFetch];
  if ([(NSArray *)v17 count]) {
    [v4 appendFormat:@"propertiesToFetch: (%@); ", v17];
  }
  long long v18 = [(NSFetchRequest *)self havingPredicate];
  if (v18) {
    [v4 appendFormat:@"havingPredicate: (%@); ", v18];
  }
  long long v19 = [(NSFetchRequest *)self propertiesToGroupBy];
  if ([(NSArray *)v19 count]) {
    [v4 appendFormat:@"propertiesToGroupBy: (%@); ", v19];
  }
  [v4 appendString:@""]);
  return v4;
}

- (unint64_t)allocationSize
{
  return self->_allocationSize;
}

+ (id)_stringForFetchRequestResultType:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3 < 5 && ((0x17u >> a3) & 1) != 0) {
    return off_1E544BFD8[a3];
  }
  uint64_t v4 = [NSString stringWithUTF8String:"Unknown fetch request result type: %ld"];
  _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, a3);
  id v11 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v14 = a3;
    _os_log_fault_impl(&dword_18AB82000, v11, OS_LOG_TYPE_FAULT, "CoreData: Unknown fetch request result type: %ld", buf, 0xCu);
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_35;
  }
  if (!a3) {
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_34;
  }
  uint64_t v5 = [(NSFetchRequest *)self entityName];
  uint64_t v6 = [a3 entityName];
  if (v5 != (NSString *)v6)
  {
    uint64_t v7 = v6;
    LOBYTE(v6) = 0;
    if (!v5) {
      return v6;
    }
    if (!v7) {
      return v6;
    }
    LODWORD(v6) = -[NSString isEqual:](v5, "isEqual:");
    if (!v6) {
      return v6;
    }
  }
  if (((*((_DWORD *)a3 + 26) ^ *(_DWORD *)&self->_flags) & 0x7FE4FF) != 0
    || (NSUInteger v8 = -[NSFetchRequest fetchLimit](self, "fetchLimit"), v8 != [a3 fetchLimit])
    || (NSUInteger v9 = -[NSFetchRequest fetchBatchSize](self, "fetchBatchSize"), v9 != [a3 fetchBatchSize])
    || (NSUInteger v10 = -[NSFetchRequest fetchOffset](self, "fetchOffset"), v10 != [a3 fetchOffset]))
  {
LABEL_34:
    LOBYTE(v6) = 0;
    return v6;
  }
  id v11 = [(NSFetchRequest *)self predicate];
  uint64_t v6 = [a3 predicate];
  if (v11 == (NSPredicate *)v6
    || (uint64_t v12 = v6, LOBYTE(v6) = 0, v11) && v12 && (LODWORD(v6) = -[NSPredicate isEqual:](v11, "isEqual:"), v6))
  {
    int v13 = [(NSFetchRequest *)self sortDescriptors];
    uint64_t v6 = [a3 sortDescriptors];
    if (v13 == (NSArray *)v6
      || (uint64_t v14 = v6, LOBYTE(v6) = 0, v13) && v14 && (LODWORD(v6) = -[NSArray isEqual:](v13, "isEqual:"), v6))
    {
      uint64_t v15 = [(NSFetchRequest *)self propertiesToFetch];
      uint64_t v6 = [a3 propertiesToFetch];
      if (v15 == (NSArray *)v6
        || (uint64_t v16 = v6, LOBYTE(v6) = 0, v15) && v16 && (LODWORD(v6) = -[NSArray isEqual:](v15, "isEqual:"), v6))
      {
        long long v17 = [(NSFetchRequest *)self havingPredicate];
        uint64_t v6 = [a3 havingPredicate];
        if (v17 == (NSPredicate *)v6
          || (uint64_t v18 = v6, LOBYTE(v6) = 0, v17)
          && v18
          && (LODWORD(v6) = -[NSPredicate isEqual:](v17, "isEqual:"), v6))
        {
          long long v19 = [(NSFetchRequest *)self propertiesToGroupBy];
          uint64_t v6 = [a3 propertiesToGroupBy];
          if (v19 != (NSArray *)v6)
          {
            uint64_t v20 = v6;
            LOBYTE(v6) = 0;
            if (v19 && v20)
            {
              LOBYTE(v6) = -[NSArray isEqual:](v19, "isEqual:");
            }
            return v6;
          }
LABEL_35:
          LOBYTE(v6) = 1;
        }
      }
    }
  }
  return v6;
}

- (NSFetchRequest)initWithCoder:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)NSFetchRequest;
  uint64_t v4 = [(NSFetchRequest *)&v40 init];
  if (v4)
  {
    uint64_t v5 = +[PFModelDecoderContext retainedContext];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v37 = __32__NSFetchRequest_initWithCoder___block_invoke;
    uint64_t v38 = &unk_1E544B868;
    uint64_t v39 = v5;
    v4->_additionalPrivateIvars = (id *)PF_CALLOC_OBJECT_ARRAY(3);
    if ([a3 decodeBoolForKey:@"NSHasFetchRequestFlags"])
    {
      unint64_t v6 = [a3 decodeIntegerForKey:@"NSFetchRequestFlags"];
      [(NSFetchRequest *)v4 setReturnsDistinctResults:v6 & 1];
      [(NSFetchRequest *)v4 setIncludesSubentities:(v6 >> 1) & 1];
      [(NSFetchRequest *)v4 setIncludesPropertyValues:(v6 >> 2) & 1];
      [(NSFetchRequest *)v4 setReturnsObjectsAsFaults:(v6 >> 3) & 1];
      [(NSFetchRequest *)v4 setIncludesPendingChanges:(v6 >> 4) & 1];
      [(NSFetchRequest *)v4 setShouldRefreshRefetchedObjects:(v6 >> 5) & 1];
      [(NSFetchRequest *)v4 _setDisablePersistentStoreResultCaching:(v6 >> 6) & 1];
      -[NSFetchRequest setResultType:](v4, "setResultType:", [a3 decodeIntegerForKey:@"NSResultType"]);
      -[NSFetchRequest setAllocationType:](v4, "setAllocationType:", [a3 decodeIntegerForKey:@"NSAllocationType"]);
      [(NSFetchRequest *)v4 setPurgeableResult:(v6 >> 7) & 1];
    }
    else
    {
      v4->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&v4->_flags & 0xFFBE1B00 | 0x46);
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    NSUInteger v9 = (NSEntityDescription *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), @"NSEntity");
    v4->_entity = v9;
    if ([(NSEntityDescription *)v9 isNSString])
    {
      *(_DWORD *)&v4->_flags |= 0x200u;
      NSUInteger v10 = v4->_entity;
    }
    else if (v4->_entity)
    {
      if (v5) {
        id v11 = (void *)v5[3];
      }
      else {
        id v11 = 0;
      }
      objc_msgSend(v11, "addObject:");
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        int v13 = &unk_1ED7E1BF0;
      }
      else {
        int v13 = &unk_1ED7E1BC8;
      }
      if (v5 == 0 || (isKindOfClass & 1) == 0) {
        goto LABEL_31;
      }
      if (!v5[1])
      {
        int v13 = &unk_1ED7E1BF0;
        goto LABEL_31;
      }
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v4->_predicate = (NSPredicate *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0), @"NSPredicate");
    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v4->_sortDescriptors = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0), @"NSSortDescriptors");
    if (!byte_1EB270ABE)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(NSPredicate *)v4->_predicate allowEvaluation];
      }
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      sortDescriptors = v4->_sortDescriptors;
      uint64_t v19 = [(NSArray *)sortDescriptors countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v33 != v20) {
              objc_enumerationMutation(sortDescriptors);
            }
            unint64_t v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v22 allowEvaluation];
            }
          }
          uint64_t v19 = [(NSArray *)sortDescriptors countByEnumeratingWithState:&v32 objects:v41 count:16];
        }
        while (v19);
      }
    }
    v4->_fetchLimit = (int)[a3 decodeIntForKey:@"NSFetchLimit"];
    *v4->_additionalPrivateIvars = (id)(int)[a3 decodeIntForKey:@"NSFetchOffset"];
    v4->_batchSize = [a3 decodeIntegerForKey:@"NSBatchSize"];
    v4->_allocationSize = [a3 decodeIntegerForKey:@"NSAllocationSize"];
    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v23, "setWithObjects:", v24, v25, v26, objc_opt_class(), 0), @"NSValuesToFetch");
    v4->_valuesToFetch = v27;
    if (!v27 || ([(NSArray *)v27 isNSArray] & 1) != 0)
    {
      v4->_havingPredicate = (NSPredicate *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSHavingPredicate"];
      uint64_t v28 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v29 = objc_opt_class();
      uint64_t v30 = objc_opt_class();
      v4->_groupByProperties = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v28, "setWithObjects:", v29, v30, objc_opt_class(), 0), @"NSValuesToGroupBy");
LABEL_32:
      v37((uint64_t)v36);
      return v4;
    }
    int v13 = &unk_1ED7E1C18;
LABEL_31:
    objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, v13));

    uint64_t v4 = 0;
    goto LABEL_32;
  }
  return v4;
}

void __32__NSFetchRequest_initWithCoder___block_invoke(uint64_t a1)
{
}

- (void)_setDisablePersistentStoreResultCaching:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSFetchRequest *)self _throwIfNotEditable];
  if (v3) {
    int v5 = 0x2000;
  }
  else {
    int v5 = 0;
  }
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v5);
}

- (void)setPurgeableResult:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSFetchRequest *)self _throwIfNotEditable];
  if (v3) {
    int v5 = 0x400000;
  }
  else {
    int v5 = 0;
  }
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFBFFFFF | v5);
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (unint64_t)_encodedFetchRequestFlagsForFlags:(unint64_t)a3
{
  return a3;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFetchRequest propertiesToGroupBy](self, "propertiesToGroupBy"), @"NSValuesToGroupBy");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFetchRequest havingPredicate](self, "havingPredicate"), @"NSHavingPredicate");
  objc_msgSend(a3, "encodeInt:forKey:", -[NSFetchRequest fetchOffset](self, "fetchOffset"), @"NSFetchOffset");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFetchRequest propertiesToFetch](self, "propertiesToFetch"), @"NSValuesToFetch");
  if ((*((unsigned char *)&self->_flags + 1) & 2) != 0) {
    [a3 encodeObject:self->_entity forKey:@"NSEntity"];
  }
  else {
    objc_msgSend(a3, "encodeConditionalObject:forKey:", -[NSFetchRequest entity](self, "entity"), @"NSEntity");
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFetchRequest predicate](self, "predicate"), @"NSPredicate");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFetchRequest sortDescriptors](self, "sortDescriptors"), @"NSSortDescriptors");
  objc_msgSend(a3, "encodeInt:forKey:", -[NSFetchRequest fetchLimit](self, "fetchLimit"), @"NSFetchLimit");
  objc_msgSend(a3, "encodeInt:forKey:", -[NSFetchRequest fetchBatchSize](self, "fetchBatchSize"), @"NSBatchSize");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFetchRequest relationshipKeyPathsForPrefetching](self, "relationshipKeyPathsForPrefetching"), @"NSRelationshipKeyPathsForPrefetching");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSFetchRequest resultType](self, "resultType"), @"NSResultType");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSFetchRequest allocationType](self, "allocationType"), @"NSAllocationType");
  if ([(NSFetchRequest *)self allocationSize]) {
    objc_msgSend(a3, "encodeInteger:forKey:", -[NSFetchRequest allocationSize](self, "allocationSize"), @"NSAllocationSize");
  }
  uint64_t v5 = [(NSFetchRequest *)self returnsDistinctResults];
  if ([(NSFetchRequest *)self includesSubentities]) {
    v5 |= 2uLL;
  }
  if ([(NSFetchRequest *)self includesPropertyValues]) {
    v5 |= 4uLL;
  }
  if ([(NSFetchRequest *)self returnsObjectsAsFaults]) {
    v5 |= 8uLL;
  }
  if ([(NSFetchRequest *)self includesPendingChanges]) {
    v5 |= 0x10uLL;
  }
  if ([(NSFetchRequest *)self shouldRefreshRefetchedObjects]) {
    v5 |= 0x20uLL;
  }
  if ([(NSFetchRequest *)self _disablePersistentStoreResultCaching]) {
    v5 |= 0x40uLL;
  }
  if ([(NSFetchRequest *)self purgeableResult]) {
    v5 |= 0x80uLL;
  }
  [a3 encodeBool:1 forKey:@"NSHasFetchRequestFlags"];
  unint64_t v6 = [(NSFetchRequest *)self _encodedFetchRequestFlagsForFlags:v5];

  [a3 encodeInteger:v6 forKey:@"NSFetchRequestFlags"];
}

- (unint64_t)hash
{
  unint64_t v3 = [(NSEntityDescription *)[(NSFetchRequest *)self entity] hash] ^ __rbit32([(NSFetchRequest *)self resultType]);
  [(NSFetchRequest *)self predicate];
  uint64_t v4 = [(NSFetchRequest *)self sortDescriptors];
  if ([(NSArray *)v4 count])
  {
    uint64_t v5 = objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", 0), "key");
    if (v5) {
      v3 ^= [v5 hash];
    }
  }
  unint64_t v6 = [(NSFetchRequest *)self propertiesToFetch];
  if ([(NSArray *)v6 count])
  {
    id v7 = [(NSArray *)v6 objectAtIndex:0];
    if (([v7 isNSString] & 1) == 0) {
      id v7 = (id)[v7 name];
    }
    v3 ^= [v7 hash];
  }
  return v3;
}

- (void)setAllocationSize:(unint64_t)a3
{
  unsigned int v3 = a3;
  [(NSFetchRequest *)self _throwIfNotEditable];
  self->_allocationSize = v3;
}

- (BOOL)purgeableResult
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 6) & 1;
}

- (void)_setFetchBatchLRUEntriesLimit:(unint64_t)a3
{
  if (a3)
  {
    unsigned int v3 = 1024;
    if (a3 < 0x400) {
      unsigned int v3 = a3;
    }
    self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFE1FFFF | (((((__clz(__rbit32(v3)) << 17) + 0x20000) >> 17) & 0xF) << 17));
  }
  else
  {
    *(_DWORD *)&self->_flags &= 0xFFE1FFFF;
  }
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 uniquedMappings:(id)a8 entities:(id)a9
{
  if (!_writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass_0) {
    _writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass_0 = objc_opt_class();
  }
  uint64_t v12 = objc_msgSend(a9, "mapping", a3, a4, a5, a6, a7, a8);
  _writeInt32IntoData(a3, 0xBEEFCAFE);
  uint64_t v32 = [a3 length];
  _writeInt32IntoData(a3, 0);
  unsigned int v13 = [(NSArray *)self->_groupByProperties count];
  _writeInt32IntoData(a3, v13);
  if (v13)
  {
    unsigned int v14 = v13;
    do
    {
      _writeInt64IntoData(a3, 0);
      --v14;
    }
    while (v14);
    uint64_t v15 = 0;
    uint64_t v16 = v13;
    do
    {
      id v17 = -[NSArray objectAtIndex:](self->_groupByProperties, "objectAtIndex:", v15, v32);
      uint64_t v18 = _writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass_0;
      if (v18 == objc_opt_class())
      {
        _writeInt32IntoData(a3, 0);
        _writeInt32IntoData(a3, objc_msgSend(v12, "indexForKey:", objc_msgSend((id)objc_msgSend(v17, "entity"), "name")));
        _writeNSPropertyProxyIntoData(a3, v17, a4);
      }
      else
      {
        if ([v17 isNSString])
        {
          _writeInt32IntoData(a3, 1u);
          id v19 = a5;
        }
        else
        {
          _writeInt32IntoData(a3, 2u);
          id v19 = a4;
        }
        _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(v19, "objectForKey:", v17), "unsignedIntegerValue"));
      }
      ++v15;
    }
    while (v16 != v15);
  }
  if (self->_havingPredicate) {
    unsigned int v20 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:"), "unsignedIntegerValue");
  }
  else {
    unsigned int v20 = 0;
  }
  _writeInt32IntoData(a3, v20);
  _writeInt64IntoData(a3, [(NSFetchRequest *)self fetchOffset]);
  unsigned int v21 = [(NSArray *)self->_valuesToFetch count];
  _writeInt32IntoData(a3, v21);
  if (v21)
  {
    unsigned int v22 = v21;
    do
    {
      _writeInt64IntoData(a3, 0);
      --v22;
    }
    while (v22);
    uint64_t v23 = 0;
    uint64_t v24 = v21;
    do
    {
      id v25 = -[NSArray objectAtIndex:](self->_valuesToFetch, "objectAtIndex:", v23, v32);
      uint64_t v26 = _writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass_0;
      if (v26 == objc_opt_class())
      {
        _writeInt32IntoData(a3, 0);
        _writeInt32IntoData(a3, objc_msgSend(v12, "indexForKey:", objc_msgSend((id)objc_msgSend(v25, "entity"), "name")));
        _writeNSPropertyProxyIntoData(a3, v25, a4);
      }
      else
      {
        if ([v25 isNSString])
        {
          _writeInt32IntoData(a3, 1u);
          id v27 = a5;
        }
        else
        {
          _writeInt32IntoData(a3, 2u);
          id v27 = a4;
        }
        _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(v27, "objectForKey:", v25), "unsignedIntegerValue"));
      }
      ++v23;
    }
    while (v24 != v23);
  }
  if ([(NSEntityDescription *)self->_entity isNSString])
  {
    _writeInt32IntoData(a3, 0);
    unsigned int v28 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", self->_entity), "unsignedIntegerValue");
  }
  else
  {
    _writeInt32IntoData(a3, 1u);
    unsigned int v28 = objc_msgSend(v12, "indexForKey:", -[NSEntityDescription name](self->_entity, "name"));
  }
  _writeInt32IntoData(a3, v28);
  if (self->_predicate) {
    unsigned int v29 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:"), "unsignedIntegerValue");
  }
  else {
    unsigned int v29 = 0;
  }
  _writeInt32IntoData(a3, v29);
  sortDescriptors = self->_sortDescriptors;
  if (sortDescriptors && [(NSArray *)sortDescriptors count])
  {
    _writeInt32IntoData(a3, [(NSArray *)self->_sortDescriptors count]);
    _writePFEncodedArrayShapeIntoData(a3, self->_sortDescriptors, a7, 0);
  }
  else
  {
    _writeInt32IntoData(a3, 0);
  }
  _writeInt64IntoData(a3, self->_batchSize);
  _writeInt64IntoData(a3, self->_fetchLimit);
  unsigned int v31 = [(NSArray *)self->_relationshipKeyPathsForPrefetching count];
  _writeInt32IntoData(a3, v31);
  if (v31) {
    _writePFEncodedArrayShapeIntoData(a3, self->_relationshipKeyPathsForPrefetching, a5, 0);
  }
  _writeInt32IntoData(a3, *(_DWORD *)&self->_flags);
  _writeInt32IntoData(a3, 0xBEEFCAFE);
  unsigned int v36 = bswap32([a3 length] - v33);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v33, 4, &v36);
}

@end