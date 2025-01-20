@interface NSSQLFetchRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (BOOL)isFaultRequest;
- (BOOL)shouldUseBatches;
- (NSFetchRequest)request;
- (NSSQLFetchRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5;
- (NSSQLiteStatement)fetchStatement;
- (id)_createStatement;
- (id)createChildContextForNestedFetchRequest:(id)a3;
- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (uint64_t)_fireFaultsForValue:(uint64_t)result;
- (uint64_t)addObjectIDsToRegister:(uint64_t)result;
- (uint64_t)addObjectsToAwaken:(uint64_t)result;
- (void)_setupBindVariablesForCachedStatement:(void *)a3 usingValues:;
- (void)addFaultsThatWereFired:(void *)result;
- (void)dealloc;
- (void)executeEpilogue;
- (void)executePrologue;
- (void)setFetchStatement:(id)a3;
- (void)setIsFaultRequest:(BOOL)a3;
- (void)ubiquitousExternalReferenceLocationForUUID:(void *)result;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation NSSQLFetchRequestContext

- (NSSQLFetchRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  id v7 = a3;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (BYTE1(dword_1EB270AB8))
  {
    if ([a3 fetchBatchSize])
    {
      if ([v7 resultType] == 2 && !objc_msgSend((id)objc_msgSend(v7, "propertiesToGroupBy"), "count"))
      {
        int v9 = [v7 returnsDistinctResults];
        if ((v9 & 1) == 0)
        {
          int v26 = v9;
          if (!objc_msgSend((id)objc_msgSend(v7, "propertiesToFetch"), "count"))
          {
            int v10 = 1;
            goto LABEL_7;
          }
          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          id obj = (id)[v7 propertiesToFetch];
          uint64_t v27 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            BOOL v29 = 0;
            int v10 = v26 ^ 1;
            uint64_t v30 = *(void *)v71;
            while (2)
            {
              uint64_t v31 = 0;
              do
              {
                if (*(void *)v71 != v30) {
                  objc_enumerationMutation(obj);
                }
                v32 = *(void **)(*((void *)&v70 + 1) + 8 * v31);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && (objc_msgSend((id)objc_msgSend(v32, "expression"), "expressionType") == 14
                   || objc_msgSend((id)objc_msgSend(v32, "expression"), "expressionType") == 4))
                {
                  _NSCoreDataLog(1, @"Returning unbatched results for unsupported NSExpression in propertiesToFetch: %@", v33, v34, v35, v36, v37, v38, (uint64_t)v32);
                  [v7 setFetchBatchSize:0];
                  goto LABEL_6;
                }
                BOOL v29 = v29
                   || (objc_msgSend((id)objc_msgSend(v32, "name"), "isEqualToString:", @"objectID") & 1) != 0
                   || objc_msgSend((id)objc_msgSend(v32, "name"), "isEqualToString:", @"self");
                if (objc_msgSend((id)objc_msgSend(v32, "name"), "isEqualToString:", @"isDeleted"))
                {
                  if (!+[_PFRoutines BOOLValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.BatchDictionaryFault"))
                  {
                    _NSCoreDataLog(1, @"Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBatchSize > 0 however propertiesToFetch includes sentinel value 'isDeleted' property: %@", v55, v56, v57, v58, v59, v60, (uint64_t)v7);
                    goto LABEL_6;
                  }
                  uint64_t v61 = [NSString stringWithUTF8String:"Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBatchSize > 0 however propertiesToFetch includes sentinel value 'isDeleted' property: %@"];
                  _NSCoreDataLog(17, v61, v62, v63, v64, v65, v66, v67, (uint64_t)v7);
                  v53 = __pflogFaultLog;
                  if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
                    goto LABEL_6;
                  }
                  *(_DWORD *)buf = 138412290;
                  id v75 = v7;
                  v54 = "CoreData: Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBa"
                        "tchSize > 0 however propertiesToFetch includes sentinel value 'isDeleted' property: %@";
                  goto LABEL_65;
                }
                ++v31;
              }
              while (v28 != v31);
              uint64_t v39 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
              uint64_t v28 = v39;
              if (v39) {
                continue;
              }
              break;
            }
            if (v29) {
              goto LABEL_7;
            }
          }
          if (+[_PFRoutines BOOLValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.BatchDictionaryFault"))
          {
            uint64_t v46 = [NSString stringWithUTF8String:"Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBatchSize > 0 however propertiesToFetch does not include required 'self' or 'objectID' property: %@"];
            _NSCoreDataLog(17, v46, v47, v48, v49, v50, v51, v52, (uint64_t)v7);
            v53 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v75 = v7;
              v54 = "CoreData: Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBatchS"
                    "ize > 0 however propertiesToFetch does not include required 'self' or 'objectID' property: %@";
LABEL_65:
              _os_log_fault_impl(&dword_18AB82000, v53, OS_LOG_TYPE_FAULT, v54, buf, 0xCu);
            }
          }
          else
          {
            _NSCoreDataLog(1, @"Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBatchSize > 0 however propertiesToFetch does not include required 'self' or 'objectID' property: %@", v40, v41, v42, v43, v44, v45, (uint64_t)v7);
          }
        }
      }
    }
  }
LABEL_6:
  int v10 = 0;
LABEL_7:
  if (![v7 fetchBatchSize]
    || (([v7 resultType] != 0) & ~v10) != 0
    || [v7 allocationType] == 1
    || [v7 allocationType] == 2)
  {
    char v11 = 0;
    id v12 = v7;
    id v7 = 0;
  }
  else
  {
    id v12 = (id)[v7 copy];
    char v11 = 1;
    [v12 setResultType:1];
    [v12 setIncludesPropertyValues:0];
  }
  if ([v12 resultType] == 1)
  {
    id v13 = v12;
    if (!v7)
    {
      id v13 = (id)[v12 copy];
      id v7 = v12;
      id v12 = v13;
    }
    [v13 setPropertiesToFetch:0];
  }
  v69.receiver = self;
  v69.super_class = (Class)NSSQLFetchRequestContext;
  v14 = [(NSSQLStoreRequestContext *)&v69 initWithRequest:v12 context:a4 sqlCore:a5];
  v15 = v14;
  if (v14)
  {
    if (a5)
    {
      v14->_storeIsUbiquitized = objc_msgSend((id)objc_msgSend(a5, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey") != 0;
      if ((*((unsigned char *)a5 + 201) & 0x40) != 0)
      {
LABEL_24:
        v15->_fileBackedFuturesDirectory = (NSString *)(id)[a5 fileBackedFuturesDirectory];
        if (a5)
        {
          v15->_fileProtectionLevel = (*((_DWORD *)a5 + 50) >> 2) & 7;
          v15->_faultHandler = (NSFaultHandler *)*((id *)a5 + 6);
          v18 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(a5, (void *)[v12 entity]);
        }
        else
        {
          v15->_fileProtectionLevel = 0;
          v18 = 0;
          v15->_faultHandler = 0;
        }
        v19 = v18;
        v15->_sqlEntity = v19;
        v15->_sqlModel = (NSSQLModel *)[(NSSQLEntity *)v19 model];
        v15->_isFaultRequest = 0;
        v15->_originalRequest = (NSFetchRequest *)v7;
        v15->_shouldUseBatches = v11;
        v15->_fetchPlan = fetchPlanAllocateInitialize([(NSSQLFetchRequestContext *)v15 request], &v15->super._sqlCore->super, v15->super._context);
        uint64_t v20 = [v12 resultType];
        int v21 = [v12 returnsObjectsAsFaults];
        if (v20 == 1)
        {
          int v22 = 4;
        }
        else if (v20 == 2)
        {
          int v22 = 16;
        }
        else
        {
          int v23 = v21;
          uint64_t v24 = objc_msgSend((id)objc_msgSend(v12, "propertiesToFetch"), "count");
          if (v23) {
            int v22 = 0;
          }
          else {
            int v22 = 12;
          }
          if (v24) {
            int v22 = 20;
          }
        }
        v15->_fetchPlan->flags = ($C6D29F7D67899FE11DE7F8953A7C3E5F)(*(_DWORD *)&v15->_fetchPlan->flags & 0xFFFFFFE3 | v22);
        return v15;
      }
    }
    else
    {
      v14->_storeIsUbiquitized = 0;
    }
    v15->_externalDataReferencesDirectory = (NSString *)(id)[a5 externalDataReferencesDirectory];
    if (a5)
    {
      if (!atomic_load((unint64_t *)a5 + 21)) {
        [a5 externalDataReferencesDirectory];
      }
      v17 = (void *)atomic_load((unint64_t *)a5 + 22);
    }
    else
    {
      v17 = 0;
    }
    v15->_externalDataLinksDirectory = (NSString *)v17;
    goto LABEL_24;
  }
  return v15;
}

- (NSFetchRequest)request
{
  v3.receiver = self;
  v3.super_class = (Class)NSSQLFetchRequestContext;
  return (NSFetchRequest *)[(NSSQLStoreRequestContext *)&v3 persistentStoreRequest];
}

- (void)visitPredicateExpression:(id)a3
{
  uint64_t v5 = [a3 expressionType];
  if (v5)
  {
    if (v5 == 3
      || v5 == 4
      && (sel_valueForKey_ == (char *)[a3 selector]
       || sel_valueForKeyPath_ == (char *)[a3 selector]))
    {
      v6 = (void *)[a3 operand];
      if (![v6 expressionType])
      {
        id v7 = (void *)[v6 constantValue];
        -[NSSQLFetchRequestContext _fireFaultsForValue:]((uint64_t)self, v7);
      }
    }
  }
  else
  {
    v8 = (void *)[a3 constantValue];
    if ((([v8 isNSArray] & 1) != 0
       || ([v8 isNSSet] & 1) != 0
       || [v8 isNSOrderedSet])
      && (objc_opt_respondsToSelector() & 1) != 0
      && [v8 isFault])
    {
      [v8 willRead];
    }
  }
}

- (void)dealloc
{
  self->_externalDataReferencesDirectory = 0;
  self->_externalDataLinksDirectory = 0;

  self->_fileBackedFuturesDirectory = 0;
  self->_sqlEntity = 0;

  self->_faultHandler = 0;
  self->_sqlModel = 0;

  self->_objectIDsToRegister = 0;
  self->_objectsToAwaken = 0;

  self->_parentContext = 0;
  self->_statement = 0;

  self->_originalRequest = 0;
  fetchPlan = self->_fetchPlan;
  if (fetchPlan) {

  }
  self->_concurrentFetchingPipelineRows = 0;
  self->_prefetchingSubstitutionVariables = 0;

  self->_resultFaultsThatWereFired = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSSQLFetchRequestContext;
  [(NSSQLStoreRequestContext *)&v4 dealloc];
}

- (void)executeEpilogue
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self && [(NSMutableSet *)self->_objectIDsToRegister allObjects]) {
    [(NSSQLCore *)self->super._sqlCore managedObjectContextDidRegisterObjectsWithIDs:[(NSMutableSet *)self->_objectIDsToRegister allObjects] generation:[(NSManagedObjectContext *)self->super._context _queryGenerationToken]];
  }
  if (![(NSFetchRequest *)[(NSSQLFetchRequestContext *)self request] resultType]
    && !-[NSFetchRequest returnsObjectsAsFaults](-[NSSQLFetchRequestContext request](self, "request"), "returnsObjectsAsFaults")&& objc_msgSend(-[NSSQLStoreRequestContext result](self, "result"), "count"))
  {
    unint64_t v3 = 0;
    do
    {
      objc_super v4 = (_DWORD *)objc_msgSend(-[NSSQLStoreRequestContext result](self, "result"), "objectAtIndex:", v3);
      [(NSMutableSet *)self->_objectsToAwaken removeObject:v4];
      if (objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_resultFaultsThatWereFired, "objectAtIndex:", v3), "BOOLValue"))
      {
        v4[4] |= 0x1000u;
        [v4 awakeFromFetch];
        v4[4] &= ~0x1000u;
      }
      ++v3;
    }
    while (v3 < objc_msgSend(-[NSSQLStoreRequestContext result](self, "result"), "count"));
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objectsToAwaken = self->_objectsToAwaken;
  uint64_t v6 = [(NSMutableSet *)objectsToAwaken countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(objectsToAwaken);
        }
        int v10 = *(_DWORD **)(*((void *)&v11 + 1) + 8 * v9);
        v10[4] |= 0x1000u;
        [v10 awakeFromFetch];
        v10[4] &= ~0x1000u;
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)objectsToAwaken countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)executeRequestCore:(id *)a3
{
  [(NSSQLFetchRequestContext *)self fetchStatement];
  [(NSSQLStoreRequestContext *)self setResult:_executeFetchRequest((uint64_t)self)];
  if (!self) {
    return [(NSSQLStoreRequestContext *)self result] != 0;
  }
  error = self->super._error;
  if (error && a3) {
    *a3 = error;
  }
  return !self->super._exception && !self->super._error && [(NSSQLStoreRequestContext *)self result] != 0;
}

- (NSSQLiteStatement)fetchStatement
{
  statement = self->_statement;
  if (statement) {
    return statement;
  }
  if (![(NSFetchRequest *)[(NSSQLFetchRequestContext *)self request] _isCachingFetchRequest])
  {
    statement = [(NSSQLFetchRequestContext *)self _createStatement];
    self->_statement = statement;
    return statement;
  }
  objc_super v4 = [(NSSQLFetchRequestContext *)self request];
  uint64_t v5 = [(NSFetchRequest *)v4 _cachedInfoForRequestor:self->super._connection];
  if (v5)
  {
    uint64_t v6 = v5;
    if ([(NSFetchRequest *)v4 fetchLimit]
      && !objc_msgSend((id)-[NSFetchRequest substitutionVariables](v4, "substitutionVariables"), "objectForKey:", @"FETCH_REQUEST_LIMIT_SUBSTITUTION"))
    {
      int v10 = *(void **)(v6 + 16);
      uint64_t v8 = (void *)(v6 + 16);
      uint64_t v7 = v10;
      if (!v10 || !v7[8]) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v9 = *(void **)(v6 + 8);
      uint64_t v8 = (void *)(v6 + 8);
      uint64_t v7 = v9;
      if (!v9 || !v7[8])
      {
LABEL_12:

        uint64_t v7 = 0;
        void *v8 = 0;
      }
    }
    long long v11 = v7;
    statement = v11;
    if (v11)
    {
      self->_isUsingCachedStatement = 1;
      fetchPlan = self->_fetchPlan;
      $C6D29F7D67899FE11DE7F8953A7C3E5F flags = fetchPlan->flags;
      if ((*(unsigned char *)&flags & 0x18) == 0x10)
      {
        fetchPlan->statement_entity = v11->_fakeEntityForFetch;
        fetchPlan->$C6D29F7D67899FE11DE7F8953A7C3E5F flags = ($C6D29F7D67899FE11DE7F8953A7C3E5F)(*(_DWORD *)&flags & 0xFFFFFFFE);
      }
      prefetchingSubstitutionVariables = self->_prefetchingSubstitutionVariables;
      if (prefetchingSubstitutionVariables) {
        -[NSSQLFetchRequestContext _setupBindVariablesForCachedStatement:usingValues:]((uint64_t)self, v11, prefetchingSubstitutionVariables);
      }
      else {
        -[NSSQLFetchRequestContext _setupBindVariablesForCachedStatement:usingValues:]((uint64_t)self, v11, (void *)[(NSFetchRequest *)[(NSSQLFetchRequestContext *)self request] substitutionVariables]);
      }
    }
    v15 = statement;
    if (statement) {
      return statement;
    }
  }
  statement = [(NSSQLFetchRequestContext *)self _createStatement];
  self->_statement = statement;
  if ([(NSFetchRequest *)[(NSSQLFetchRequestContext *)self request] _isCachingFetchRequest])
  {
    self->_isUsingCachedStatement = 1;
    uint64_t v16 = [(NSSQLFetchRequestContext *)self request];
    id v17 = (id)[(NSFetchRequest *)v16 _cachedInfoForRequestor:self->super._connection];
    if (!v17)
    {
      id v17 = [[NSCachedFetchRequestThunk alloc] initForConnection:self->super._connection];
      [(NSFetchRequest *)v16 _cacheInfo:v17 forRequestor:self->super._connection];
    }
    if ([(NSFetchRequest *)v16 fetchLimit]
      && !objc_msgSend((id)-[NSFetchRequest substitutionVariables](v16, "substitutionVariables"), "objectForKey:", @"FETCH_REQUEST_LIMIT_SUBSTITUTION"))
    {
      if (v17)
      {
        ptrdiff_t v19 = 16;
        goto LABEL_29;
      }
    }
    else if (v17)
    {
      ptrdiff_t v19 = 8;
LABEL_29:
      objc_setProperty_nonatomic(v17, v18, statement, v19);
    }
  }
  return statement;
}

- (void)addFaultsThatWereFired:(void *)result
{
  if (result)
  {
    v2 = result;
    unint64_t v3 = (void *)result[21];
    if (v3)
    {
      return (void *)[v3 addObjectsFromArray:a2];
    }
    else
    {
      result = a2;
      v2[21] = result;
    }
  }
  return result;
}

- (void)_setupBindVariablesForCachedStatement:(void *)a3 usingValues:
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (a2 && (uint64_t v4 = a2[7]) != 0)
  {
    uint64_t v5 = *(void **)(v4 + 8);
    v53 = *(void **)(v4 + 16);
  }
  else
  {
    uint64_t v5 = 0;
    v53 = 0;
  }
  uint64_t v6 = (void *)[a2 bindVariables];
  unint64_t v54 = [v5 count];
  if (v54)
  {
    unint64_t v7 = 0;
    uint64_t v51 = v5;
    do
    {
      uint64_t v8 = (void *)[v5 objectAtIndex:v7];
      unint64_t v9 = v7 + 1;
      int v10 = (void *)[v5 objectAtIndex:v9];
      long long v11 = (void *)[a3 valueForKey:v8];
      if (!v11)
      {
        uint64_t v42 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v43 = *MEMORY[0x1E4F1C3B8];
        uint64_t v45 = NSString;
        uint64_t v47 = v8;
        goto LABEL_66;
      }
      long long v12 = v11;
      if ([v11 expressionType])
      {
        uint64_t v42 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v43 = *MEMORY[0x1E4F1C3C8];
        uint64_t v45 = NSString;
        uint64_t v47 = v8;
        goto LABEL_68;
      }
      long long v13 = (void *)[v12 constantValue];
      if (([v13 isNSArray] & 1) != 0
        || ([v13 isNSSet] & 1) != 0
        || [v13 isNSOrderedSet])
      {
LABEL_62:
        uint64_t v42 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v43 = *MEMORY[0x1E4F1C3C8];
        uint64_t v44 = [NSString stringWithFormat:@"bad substitution variable for %@, must not be a collection", v8, ClassName, v49];
        goto LABEL_70;
      }
      long long v14 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v10, "unsignedIntegerValue"));
      if ([v14 sqlType] != 2) {
        goto LABEL_29;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = v6;
        uint64_t v16 = (void *)[v13 objectID];
        id v17 = v16;
        uint64_t v18 = a1;
        if (a1) {
          a1 = *(void *)(a1 + 8);
        }
        if (a1 == [v16 persistentStore]) {
          uint64_t v19 = [v17 _referenceData64];
        }
        else {
          uint64_t v19 = 0;
        }
        a1 = v18;
        uint64_t v6 = v15;
        uint64_t v5 = v51;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v21 = [v13 longLongValue];
LABEL_26:
          uint64_t v19 = v21;
          goto LABEL_27;
        }
        if (a1) {
          uint64_t v20 = *(void *)(a1 + 8);
        }
        else {
          uint64_t v20 = 0;
        }
        if (v20 == [v13 persistentStore])
        {
          uint64_t v21 = [v13 _referenceData64];
          goto LABEL_26;
        }
        uint64_t v19 = 0;
      }
LABEL_27:
      if (([v8 isEqual:@"FETCH_REQUEST_LIMIT_SUBSTITUTION"] & 1) == 0
        && ![v8 isEqual:@"FETCH_REQUEST_OFFSET_SUBSTITUTION"])
      {
        [v14 setInt64:v19];
        goto LABEL_30;
      }
LABEL_29:
      [v14 setValue:v13];
LABEL_30:
      unint64_t v7 = v9 + 1;
    }
    while (v7 < v54);
  }
  uint64_t v55 = (void *)[a2 bindIntarrays];
  unint64_t v52 = [v55 count];
  if (!v52) {
    return;
  }
  for (unint64_t i = 0; i < v52; i += 3)
  {
    uint64_t v23 = [v53 objectAtIndex:i];
    uint64_t v24 = (void *)[v53 objectAtIndex:i + 1];
    v25 = (void *)[v53 objectAtIndex:i + 2];
    int v26 = (void *)[a3 valueForKey:v23];
    if (!v26)
    {
      uint64_t v42 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v43 = *MEMORY[0x1E4F1C3B8];
      uint64_t v45 = NSString;
      uint64_t v47 = (void *)v23;
LABEL_66:
      uint64_t v46 = @"missing variable binding for %@";
      goto LABEL_69;
    }
    uint64_t v27 = v26;
    if ([v26 expressionType])
    {
      uint64_t v42 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v43 = *MEMORY[0x1E4F1C3C8];
      uint64_t v45 = NSString;
      uint64_t v47 = (void *)v23;
LABEL_68:
      uint64_t v46 = @"bad substitution variable for %@, must be a constant value";
LABEL_69:
      uint64_t v44 = objc_msgSend(v45, "stringWithFormat:", v46, v47, ClassName, v49);
      goto LABEL_70;
    }
    uint64_t v28 = (void *)[v27 constantValue];
    if (([v28 isNSArray] & 1) == 0
      && ([v28 isNSSet] & 1) == 0
      && ([v28 isNSOrderedSet] & 1) == 0)
    {
      uint64_t v42 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v43 = *MEMORY[0x1E4F1C3C8];
      uint64_t v44 = [NSString stringWithFormat:@"bad substitution variable for %@, must be a collection", v23, ClassName, v49];
      goto LABEL_70;
    }
    BOOL v29 = objc_msgSend(v55, "objectAtIndex:", objc_msgSend(v25, "unsignedIntegerValue"));
    if ([v28 count])
    {
      memset(v61, 0, sizeof(v61));
      [v28 countByEnumeratingWithState:v61 objects:v63 count:16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v31 = (id)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v28);
LABEL_48:
        uint64_t v30 = v31;
        goto LABEL_49;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v31 = v28;
        goto LABEL_48;
      }
      uint64_t v42 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v43 = *MEMORY[0x1E4F1C3C8];
      uint64_t v44 = [NSString stringWithFormat:@"bad substitution variable for %@, must be a collection of objects or objectIDs", v23, ClassName, v49];
LABEL_70:
      objc_exception_throw((id)[v42 exceptionWithName:v43 reason:v44 userInfo:a3]);
    }
    uint64_t v30 = 0;
LABEL_49:
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v32 = [v30 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (!v32) {
      goto LABEL_59;
    }
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v58 != v34) {
          objc_enumerationMutation(v30);
        }
        uint64_t v8 = *(void **)(*((void *)&v57 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || (objc_msgSend((id)objc_msgSend(v8, "entity"), "isKindOfEntity:", v24) & 1) == 0)
        {
          ClassName = object_getClassName(v8);
          uint64_t v49 = [v24 name];
          _NSCoreDataLog(1, @"oid = %@ [oid class] = %s expecting entity %@", v36, v37, v38, v39, v40, v41, (uint64_t)v8);
          __break(1u);
          goto LABEL_62;
        }
      }
      uint64_t v33 = [v30 countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v33);
LABEL_59:
    [v29 setValue:v30];
  }
}

- (void)setIsFaultRequest:(BOOL)a3
{
  self->_isFaultRequest = a3;
}

- (void)setFetchStatement:(id)a3
{
  statement = self->_statement;
  self->_statement = (NSSQLiteStatement *)a3;
}

uint64_t __43__NSSQLFetchRequestContext_executePrologue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "visitPredicateExpression:");
}

- (BOOL)shouldUseBatches
{
  return self->_shouldUseBatches;
}

- (id)_createStatement
{
  v2 = self;
  if (self) {
    self = (NSSQLFetchRequestContext *)self->super._sqlCore;
  }
  id result = (id)-[NSSQLiteAdapter newSelectStatementWithFetchRequestContext:ignoreInheritance:]([(NSSQLFetchRequestContext *)self adapter], v2, v2->_isFaultRequest);
  if (result)
  {
    fetchPlan = v2->_fetchPlan;
    $C6D29F7D67899FE11DE7F8953A7C3E5F flags = fetchPlan->flags;
    if ((*(unsigned char *)&flags & 0x18) == 0x10)
    {
      fetchPlan->statement_entity = (NSSQLEntity *)*((void *)result + 6);
      fetchPlan->$C6D29F7D67899FE11DE7F8953A7C3E5F flags = ($C6D29F7D67899FE11DE7F8953A7C3E5F)(*(_DWORD *)&flags & 0xFFFFFFFE);
    }
  }
  return result;
}

- (id)createChildContextForNestedFetchRequest:(id)a3
{
  uint64_t v5 = [NSSQLFetchRequestContext alloc];
  if (self)
  {
    connection = self->super._connection;
    context = self->super._context;
    sqlCore = self->super._sqlCore;
    if (v5) {
      goto LABEL_3;
    }
    return 0;
  }
  context = 0;
  connection = 0;
  sqlCore = 0;
  if (!v5) {
    return 0;
  }
LABEL_3:
  unint64_t v9 = [(NSSQLFetchRequestContext *)v5 initWithRequest:a3 context:context sqlCore:sqlCore];
  if (v9)
  {
    v9->_parentContext = self;
    -[NSSQLStoreRequestContext setConnection:]((uint64_t)v9, connection);
  }
  return v9;
}

- (uint64_t)addObjectIDsToRegister:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(id *)(result + 152);
    if (!v4)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      *(void *)(v3 + 152) = v4;
    }
    return [v4 addObjectsFromArray:a2];
  }
  return result;
}

- (uint64_t)addObjectsToAwaken:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(id *)(result + 160);
    if (!v4)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      *(void *)(v3 + 160) = v4;
    }
    return [v4 addObjectsFromArray:a2];
  }
  return result;
}

- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  if (self) {
    self = (NSSQLFetchRequestContext *)self->super._connection;
  }
  uint64_t v6 = -[NSSQLiteConnection prefetchRequestCache]((NSSQLitePrefetchRequestCache *)self);

  return [(NSSQLitePrefetchRequestCache *)v6 manyToOnePrefetchRequestForRelationshipNamed:a3 onEntity:a4];
}

- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  if (self) {
    self = (NSSQLFetchRequestContext *)self->super._connection;
  }
  uint64_t v6 = -[NSSQLiteConnection prefetchRequestCache]((NSSQLitePrefetchRequestCache *)self);

  return [(NSSQLitePrefetchRequestCache *)v6 inverseIsToOnePrefetchRequestForRelationshipNamed:a3 onEntity:a4];
}

- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  if (self) {
    self = (NSSQLFetchRequestContext *)self->super._connection;
  }
  uint64_t v6 = -[NSSQLiteConnection prefetchRequestCache]((NSSQLitePrefetchRequestCache *)self);

  return [(NSSQLitePrefetchRequestCache *)v6 manyToManyPrefetchRequestsForRelationshipNamed:a3 onEntity:a4];
}

- (void)executePrologue
{
  uint64_t v3 = [(NSFetchRequest *)[(NSSQLFetchRequestContext *)self request] predicate];
  if (self && v3) {
    [(NSPredicate *)v3 acceptVisitor:self flags:1];
  }
  id v4 = [(NSFetchRequest *)[(NSSQLFetchRequestContext *)self request] havingPredicate];
  if (self && v4) {
    [(NSPredicate *)v4 acceptVisitor:self flags:1];
  }
  [(NSSQLFetchRequestContext *)self request];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (void *)[(NSFetchRequest *)[(NSSQLFetchRequestContext *)self request] substitutionVariables];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__NSSQLFetchRequestContext_executePrologue__block_invoke;
    v6[3] = &unk_1E544CD08;
    v6[4] = self;
    [v5 enumerateKeysAndObjectsUsingBlock:v6];
  }
}

- (void)ubiquitousExternalReferenceLocationForUUID:(void *)result
{
  if (result) {
    return (void **)+[PFUbiquitySwitchboard ubiquitousExternalReferenceLocationForUUID:inStore:]((uint64_t)PFUbiquitySwitchboard, a2, result[1]);
  }
  return result;
}

- (uint64_t)_fireFaultsForValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      return [a2 willAccessValueForKey:0];
    }
    else if (([a2 isNSArray] & 1) != 0 {
           || ([a2 isNSSet] & 1) != 0
    }
           || (id result = [a2 isNSOrderedSet], result))
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __48__NSSQLFetchRequestContext__fireFaultsForValue___block_invoke;
      v4[3] = &unk_1E544F8C0;
      v4[4] = v3;
      return [a2 enumerateObjectsUsingBlock:v4];
    }
  }
  return result;
}

uint64_t __48__NSSQLFetchRequestContext__fireFaultsForValue___block_invoke(uint64_t a1)
{
  return -[NSSQLFetchRequestContext _fireFaultsForValue:](*(void *)(a1 + 32));
}

- (BOOL)isFaultRequest
{
  return self->_isFaultRequest;
}

@end