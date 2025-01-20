@interface HDDataEntityEnumerator
- (BOOL)enumerateInTransaction:(id)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)enumerateIncludingDeletedObjects:(BOOL)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)enumerateSampleTimesIncludingDeletedObjects:(BOOL)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)enumerateWithError:(id *)a3 handler:(id)a4;
- (BOOL)ignoreEntityClassAdditionalPredicateForEnumeration;
- (BOOL)improveJoinOrderingForStartDateIndexSelection;
- (HDDatabaseTransactionContext)databaseTransactionContext;
- (HDSQLitePredicate)deletedObjectsPredicate;
- (NSArray)sortDescriptors;
- (NSNumber)anchor;
- (NSNumber)deletedObjectsAnchor;
- (NSSet)objectTypes;
- (NSSet)restrictedSourceEntities;
- (NSString)lastSQL;
- (_HKFilter)filter;
- (id)_initWithEntityClass:(Class)a3 profile:(id)a4;
- (id)_initWithObjectType:(id)a3 entityClass:(Class)a4 profile:(id)a5;
- (id)_initWithObjectTypes:(id)a3 entityClass:(Class)a4 profile:(id)a5;
- (id)_joinClauseForProperties:(id)a3;
- (id)authorizationFilter;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodingOptionForKey:(id)a3;
- (uint64_t)_enumerateObjectsWithDatabaseTransaction:(__CFString *)a3 error:(void *)a4 handler:;
- (uint64_t)_prepareDeletedObjectsAndSamplesDescriptor:(__CFString *)a3 error:;
- (uint64_t)_prepareDescriptor:(__CFString *)a3 error:;
- (uint64_t)_setOrderingTermsOnDescriptor:(uint64_t)a3 error:;
- (void)addEncodingOptionsFromDictionary:(id)a3;
- (void)setAnchor:(id)a3;
- (void)setAuthorizationFilter:(id)a3;
- (void)setDatabaseTransactionContext:(id)a3;
- (void)setDeletedObjectsAnchor:(id)a3;
- (void)setDeletedObjectsPredicate:(id)a3;
- (void)setEncodingOption:(id)a3 forKey:(id)a4;
- (void)setFilter:(id)a3;
- (void)setIgnoreEntityClassAdditionalPredicateForEnumeration:(BOOL)a3;
- (void)setImproveJoinOrderingForStartDateIndexSelection:(BOOL)a3;
- (void)setRestrictedSourceEntities:(id)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation HDDataEntityEnumerator

- (void)addEncodingOptionsFromDictionary:(id)a3
{
  encodingOptions = self->_encodingOptions;
  if (encodingOptions)
  {
    [(NSMutableDictionary *)encodingOptions addEntriesFromDictionary:a3];
  }
  else
  {
    v5 = (NSMutableDictionary *)[a3 mutableCopy];
    v6 = self->_encodingOptions;
    self->_encodingOptions = v5;
  }
}

- (BOOL)enumerateWithError:(id *)a3 handler:(id)a4
{
  id v7 = a4;
  v8 = v7;
  if (!a3)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HDDataEntityEnumerator.m", 88, @"Invalid parameter not satisfying: %@", @"outError != NULL" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
LABEL_6:
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HDDataEntityEnumerator.m", 89, @"Invalid parameter not satisfying: %@", @"handler != nil" object file lineNumber description];

    char v12 = 0;
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_6;
  }
LABEL_3:
  v9 = [(HDSQLiteQueryDescriptor *)self entityClass];
  v10 = [(HDProfile *)self->_profile database];
  databaseTransactionContext = self->_databaseTransactionContext;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__HDDataEntityEnumerator_enumerateWithError_handler___block_invoke;
  v16[3] = &unk_1E62F8050;
  v16[4] = self;
  id v17 = v8;
  char v12 = [(objc_class *)v9 performReadTransactionWithHealthDatabase:v10 context:databaseTransactionContext error:a3 block:v16];

LABEL_4:
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_lastSQL, 0);
  objc_storeStrong((id *)&self->_databaseTransactionContext, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_deletedObjectsPredicate, 0);
  objc_storeStrong((id *)&self->_deletedObjectsAnchor, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong(&self->_authorizationFilter, 0);
  objc_storeStrong((id *)&self->_restrictedSourceEntities, 0);
  objc_storeStrong((id *)&self->_objectTypes, 0);
  objc_storeStrong((id *)&self->_encodingOptions, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

- (void)setAnchor:(id)a3
{
}

- (BOOL)enumerateIncludingDeletedObjects:(BOOL)a3 error:(id *)a4 handler:(id)a5
{
  id v9 = a5;
  v10 = v9;
  if (!a4)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDDataEntityEnumerator.m", 122, @"Invalid parameter not satisfying: %@", @"outError != NULL" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_11:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDDataEntityEnumerator.m", 123, @"Invalid parameter not satisfying: %@", @"handler != nil" object file lineNumber description];

    char v14 = 0;
    goto LABEL_9;
  }
  if (!v9) {
    goto LABEL_11;
  }
LABEL_3:
  if (a3)
  {
    v11 = [(HDSQLiteQueryDescriptor *)self entityClass];
    if (!v11)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"HDDataEntityEnumerator.m", 137, @"Querying with a nil entity class %@. You're about to be sad. Did you forget to implement -hd_dataEntityClass or an extension in HKObject+HDExtensions?", self object file lineNumber description];
    }
    char v12 = [(HDProfile *)self->_profile database];
    databaseTransactionContext = self->_databaseTransactionContext;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __73__HDDataEntityEnumerator_enumerateIncludingDeletedObjects_error_handler___block_invoke_2;
    v20[3] = &unk_1E6309488;
    v20[4] = self;
    v22 = v11;
    id v21 = v10;
    char v14 = [(objc_class *)v11 performReadTransactionWithHealthDatabase:v12 context:databaseTransactionContext error:a4 block:v20];

    v15 = v21;
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __73__HDDataEntityEnumerator_enumerateIncludingDeletedObjects_error_handler___block_invoke;
    v23[3] = &unk_1E63011A0;
    id v24 = v10;
    char v14 = [(HDDataEntityEnumerator *)self enumerateWithError:a4 handler:v23];
    v15 = v24;
  }

LABEL_9:
  return v14;
}

- (void)setFilter:(id)a3
{
}

- (void)setAuthorizationFilter:(id)a3
{
}

- (void)setSortDescriptors:(id)a3
{
}

- (void)setRestrictedSourceEntities:(id)a3
{
}

- (NSNumber)anchor
{
  return self->_anchor;
}

uint64_t __53__HDDataEntityEnumerator_enumerateWithError_handler___block_invoke(uint64_t a1, void *a2, __CFString **a3)
{
  return -[HDDataEntityEnumerator _enumerateObjectsWithDatabaseTransaction:error:handler:](*(void **)(a1 + 32), a2, a3, *(void **)(a1 + 40));
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HDDataEntityEnumerator;
  v4 = [(HDSQLiteQueryDescriptor *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 8, self->_profile);
  *((unsigned char *)v4 + 80) = self->_useLeftJoin;
  return v4;
}

- (uint64_t)_prepareDescriptor:(__CFString *)a3 error:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    objc_super v6 = (void *)[(id)a1 entityClass];
    id v7 = [(id)a1 predicate];
    v8 = *(void **)(a1 + 88);
    if (v8)
    {
      id v9 = (void *)MEMORY[0x1E4F65D08];
      v10 = HDSampleEntityPredicateForDataTypes(v8);
      uint64_t v11 = [v9 compoundPredicateWithPredicate:v10 otherPredicate:v7];

      id v7 = (void *)v11;
    }
    if ([*(id *)(a1 + 112) longLongValue] >= 1)
    {
      char v12 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"data_id" greaterThanValue:*(void *)(a1 + 112)];
      uint64_t v13 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v7 otherPredicate:v12];

      id v7 = (void *)v13;
    }
    char v14 = *(void **)(a1 + 160);
    if (v14)
    {
      v15 = (void *)MEMORY[0x1E4F65D08];
      v16 = [v14 predicateWithProfile:*(void *)(a1 + 64)];
      uint64_t v17 = [v15 compoundPredicateWithPredicate:v7 otherPredicate:v16];

      id v7 = (void *)v17;
    }
    v18 = [v6 predicateMatchingPreferredEntityTypeIfRequiredWithPredicate:v7];

    v19 = *(void **)(a1 + 96);
    if (v19)
    {
      v20 = HDDataEntityPredicateForSourceEntitySet(7, v19);
      uint64_t v21 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v20 otherPredicate:v18];

      v18 = (void *)v21;
    }
    if (!*(unsigned char *)(a1 + 81))
    {
      v22 = (void *)MEMORY[0x1E4F65D58];
      v23 = [v6 additionalPredicateForEnumeration];
      uint64_t v24 = [v22 compoundPredicateWithPredicate:v23 otherPredicate:v18];

      v18 = (void *)v24;
    }
    if (*(void *)(a1 + 136)
      && (-[HDDataEntityEnumerator _setOrderingTermsOnDescriptor:error:](a1, v5, (uint64_t)a3) & 1) == 0)
    {
      _HKInitializeLogging();
      v28 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        if (a3) {
          v31 = *a3;
        }
        else {
          v31 = @"<no provided outError>";
        }
        *(_DWORD *)buf = 138543362;
        v34 = v31;
        _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "Invalid sort descriptor: %{public}@", buf, 0xCu);
      }
      char v27 = 0;
    }
    else
    {
      [v5 setPredicate:v18];
      if ([(id)a1 improveJoinOrderingForStartDateIndexSelection])
      {
        id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v26 = objc_opt_class();
        do
        {
          [v25 addObject:v26];
          v26 = (void *)[v26 superclass];
        }
        while (([v26 isSubclassOfClass:objc_opt_class()] & 1) != 0);
        [v5 setPreferredEntityJoinOrder:v25];
      }
      char v27 = 1;
    }
    unsigned __int8 v32 = v27;

    uint64_t v29 = v32;
  }
  else
  {
    uint64_t v29 = 0;
  }

  return v29;
}

- (id)authorizationFilter
{
  return self->_authorizationFilter;
}

- (id)_joinClauseForProperties:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_useLeftJoin)
  {
    id v5 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    objc_super v6 = (void *)[v5 mutableCopy];

    id v7 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v8 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    id v9 = objc_msgSend(v7, "initWithObjects:", v8, 0);

    v10 = [(HDSQLiteQueryDescriptor *)self entityClass];
    if ([(objc_class *)v10 isSubclassOfClass:objc_opt_class()]
      && v10 != (objc_class *)objc_opt_class())
    {
      do
      {
        if ([(objc_class *)v10 isBackedByTable])
        {
          uint64_t v11 = [(objc_class *)v10 disambiguatedDatabaseTable];
          [v9 addObject:v11];

          char v12 = [(objc_class *)v10 disambiguatedDatabaseTable];
          [v6 appendFormat:@" LEFT JOIN %@ USING(%@)", v12, @"data_id"];
        }
        v10 = (objc_class *)[(objc_class *)v10 superclass];
      }
      while (v10 != (objc_class *)objc_opt_class());
    }
    uint64_t v13 = [(HDSQLiteQueryDescriptor *)self entityClass];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v15 = [(objc_class *)v13 joinClausesForProperty:@"data_provenances.source_id"];
    [v14 unionSet:v15];

    v16 = [(HDSQLiteQueryDescriptor *)self predicate];
    uint64_t v17 = [v16 SQLJoinClausesForEntityClass:v13];
    [v14 unionSet:v17];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v31 = v4;
    id v18 = v4;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [(objc_class *)v13 joinClausesForProperty:*(void *)(*((void *)&v38 + 1) + 8 * i)];
          if (v23) {
            [v14 unionSet:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v20);
    }

    v37.receiver = self;
    v37.super_class = (Class)HDDataEntityEnumerator;
    uint64_t v24 = [(HDSQLiteQueryDescriptor *)&v37 _sortedJoinClauses:v14 preferredOrder:0 baseTables:v9];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v34 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = [*(id *)(*((void *)&v33 + 1) + 8 * j) SQLJoinClause];
          [v6 appendFormat:@" %@", v29];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v26);
    }

    id v4 = v31;
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)HDDataEntityEnumerator;
    objc_super v6 = [(HDSQLiteQueryDescriptor *)&v32 _joinClauseForProperties:v4];
  }

  return v6;
}

uint64_t __73__HDDataEntityEnumerator_enumerateIncludingDeletedObjects_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (uint64_t)_prepareDeletedObjectsAndSamplesDescriptor:(__CFString *)a3 error:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
LABEL_18:
    uint64_t v31 = 0;
    goto LABEL_19;
  }
  if (*(void *)(a1 + 136)
    && (-[HDDataEntityEnumerator _setOrderingTermsOnDescriptor:error:](a1, v5, (uint64_t)a3) & 1) == 0)
  {
    _HKInitializeLogging();
    objc_super v32 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      if (a3) {
        long long v34 = *a3;
      }
      else {
        long long v34 = @"<no provided outError>";
      }
      *(_DWORD *)buf = 138412290;
      long long v38 = v34;
      _os_log_error_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_ERROR, "Invalid sort descriptor: %@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  objc_super v6 = +[HDDataEntity disambiguatedSQLForProperty:@"data_id"];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8 = *(void **)(a1 + 88);
  if (v8)
  {
    id v9 = HDSampleEntityPredicateForDataTypes(v8);
    objc_msgSend(v7, "hk_addNonNilObject:", v9);
  }
  if ([*(id *)(a1 + 112) longLongValue] >= 1)
  {
    v10 = [MEMORY[0x1E4F65D00] predicateWithProperty:v6 greaterThanValue:*(void *)(a1 + 112)];
    objc_msgSend(v7, "hk_addNonNilObject:", v10);
  }
  long long v35 = v5;
  uint64_t v11 = *(void **)(a1 + 96);
  if (v11)
  {
    char v12 = HDDataEntityPredicateForSourceEntitySet(7, v11);
    objc_msgSend(v7, "hk_addNonNilObject:", v12);
  }
  uint64_t v13 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v7];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15 = (void *)[(id)a1 entityClass];
  v16 = HDDataEntityPredicateForType(1);
  objc_msgSend(v14, "hk_addNonNilObject:", v16);

  uint64_t v17 = [(id)a1 predicate];
  objc_msgSend(v14, "hk_addNonNilObject:", v17);

  if (!*(unsigned char *)(a1 + 81))
  {
    id v18 = [v15 additionalPredicateForEnumeration];
    objc_msgSend(v14, "hk_addNonNilObject:", v18);
  }
  uint64_t v19 = *(void **)(a1 + 160);
  if (v19)
  {
    uint64_t v20 = [v19 predicateWithProfile:*(void *)(a1 + 64)];
    objc_msgSend(v14, "hk_addNonNilObject:", v20);
  }
  uint64_t v21 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v14];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v23 = HDDataEntityPredicateForType(2);
  objc_msgSend(v22, "hk_addNonNilObject:", v23);

  if ([*(id *)(a1 + 120) longLongValue] >= 1)
  {
    uint64_t v24 = [MEMORY[0x1E4F65D00] predicateWithProperty:v6 greaterThanValue:*(void *)(a1 + 120)];
    objc_msgSend(v22, "hk_addNonNilObject:", v24);
  }
  objc_msgSend(v22, "hk_addNonNilObject:", *(void *)(a1 + 128));
  uint64_t v25 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v22];
  uint64_t v26 = (void *)MEMORY[0x1E4F65D58];
  uint64_t v27 = (void *)MEMORY[0x1E4F65D08];
  v36[0] = v21;
  v36[1] = v25;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  uint64_t v29 = [v27 predicateMatchingAnyPredicates:v28];
  v30 = [v26 compoundPredicateWithPredicate:v13 otherPredicate:v29];

  id v5 = v35;
  [v35 setPredicate:v30];

  uint64_t v31 = 1;
LABEL_19:

  return v31;
}

- (void)setDeletedObjectsAnchor:(id)a3
{
}

- (id)_initWithEntityClass:(Class)a3 profile:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDDataEntityEnumerator;
  v8 = [(HDDataEntityEnumerator *)&v12 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_profile, a4);
    v11.receiver = v9;
    v11.super_class = (Class)HDDataEntityEnumerator;
    [(HDSQLiteQueryDescriptor *)&v11 setEntityClass:a3];
  }

  return v9;
}

- (id)_initWithObjectType:(id)a3 entityClass:(Class)a4 profile:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a5;
  v10 = [v8 setWithObject:a3];
  id v11 = [(HDDataEntityEnumerator *)self _initWithObjectTypes:v10 entityClass:a4 profile:v9];

  return v11;
}

- (id)_initWithObjectTypes:(id)a3 entityClass:(Class)a4 profile:(id)a5
{
  id v9 = a3;
  v10 = [(HDDataEntityEnumerator *)self _initWithEntityClass:a4 profile:a5];
  id v11 = v10;
  if (v10) {
    objc_storeStrong(v10 + 11, a3);
  }

  return v11;
}

- (void)setEncodingOption:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  encodingOptions = self->_encodingOptions;
  if (!encodingOptions)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = self->_encodingOptions;
    self->_encodingOptions = v8;

    encodingOptions = self->_encodingOptions;
  }
  [(NSMutableDictionary *)encodingOptions setObject:v10 forKeyedSubscript:v6];
}

- (id)encodingOptionForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_encodingOptions objectForKeyedSubscript:a3];
}

- (uint64_t)_enumerateObjectsWithDatabaseTransaction:(__CFString *)a3 error:(void *)a4 handler:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    id v9 = (void *)[a1 copy];
    if (-[HDDataEntityEnumerator _prepareDescriptor:error:]((uint64_t)a1, v9, a3))
    {
      id v10 = (void *)[a1 entityClass];
      id v11 = objc_alloc(MEMORY[0x1E4F65D60]);
      objc_super v12 = [v7 databaseForEntityClass:v10];
      uint64_t v13 = (void *)[v11 initWithDatabase:v12 descriptor:v9];

      uint64_t v14 = a1[8];
      uint64_t v15 = a1[9];
      v16 = [a1 authorizationFilter];
      uint64_t v17 = [v10 entityEncoderForProfile:v14 transaction:v7 purpose:1 encodingOptions:v15 authorizationFilter:v16];

      id v18 = [v17 orderedProperties];
      id v29 = 0;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __81__HDDataEntityEnumerator__enumerateObjectsWithDatabaseTransaction_error_handler___block_invoke;
      v26[3] = &unk_1E62F8518;
      id v19 = v17;
      id v27 = v19;
      id v28 = v8;
      uint64_t v20 = [v13 enumeratePersistentIDsAndProperties:v18 error:&v29 enumerationHandler:v26];
      id v21 = v29;

      id v22 = [v13 lastSQLStatement];
      uint64_t v23 = [v22 copy];
      uint64_t v24 = (void *)a1[19];
      a1[19] = v23;

      [v19 finish];
      if (v21)
      {
        if (a3)
        {
          uint64_t v20 = 0;
          *a3 = (__CFString *)v21;
        }
        else
        {
          _HKLogDroppedError();
          uint64_t v20 = 0;
        }
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

- (BOOL)enumerateInTransaction:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (!a4)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HDDataEntityEnumerator.m", 108, @"Invalid parameter not satisfying: %@", @"outError != NULL" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HDDataEntityEnumerator.m", 109, @"Invalid parameter not satisfying: %@", @"handler != nil" object file lineNumber description];

    char v12 = 0;
    goto LABEL_4;
  }
  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  char v12 = -[HDDataEntityEnumerator _enumerateObjectsWithDatabaseTransaction:error:handler:](self, v9, (__CFString **)a4, v11);
LABEL_4:

  return v12;
}

uint64_t __73__HDDataEntityEnumerator_enumerateIncludingDeletedObjects_error_handler___block_invoke_2(uint64_t a1, void *a2, __CFString **a3)
{
  v30[5] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = (unsigned char *)[*(id *)(a1 + 32) copy];
  v6[80] = 1;
  if (-[HDDataEntityEnumerator _prepareDeletedObjectsAndSamplesDescriptor:error:](*(void *)(a1 + 32), v6, a3))
  {
    uint64_t v26 = [v5 databaseForEntityClass:*(void *)(a1 + 48)];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F65D60]) initWithDatabase:v26 descriptor:v6];
    id v8 = *(void **)(a1 + 48);
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = v9[8];
    uint64_t v11 = v9[9];
    char v12 = [v9 authorizationFilter];
    uint64_t v13 = [v8 entityEncoderForProfile:v10 transaction:v5 purpose:1 encodingOptions:v11 authorizationFilter:v12];

    uint64_t v14 = +[HDDataEntity disambiguatedSQLForProperty:@"data_id"];
    v30[0] = v14;
    v30[1] = @"type";
    v30[2] = @"external_sync_ids.sid";
    v30[3] = @"external_sync_ids.version";
    v30[4] = @"external_sync_ids.object_code";
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
    v16 = [v13 orderedProperties];
    uint64_t v17 = [v15 arrayByAddingObjectsFromArray:v16];

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __73__HDDataEntityEnumerator_enumerateIncludingDeletedObjects_error_handler___block_invoke_3;
    v27[3] = &unk_1E63063F8;
    id v18 = *(id *)(a1 + 40);
    id v28 = v13;
    id v29 = v18;
    id v19 = v13;
    uint64_t v20 = [v7 enumerateProperties:v17 error:a3 enumerationHandler:v27];
    id v21 = [v7 lastSQLStatement];
    uint64_t v22 = [v21 copy];
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v24 = *(void **)(v23 + 152);
    *(void *)(v23 + 152) = v22;

    [v19 finish];
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

uint64_t __73__HDDataEntityEnumerator_enumerateIncludingDeletedObjects_error_handler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = HDSQLiteColumnAsInt64();
  if (HDSQLiteColumnAsInt64() == 2)
  {
    id v8 = HDSQLiteColumnWithNameAsUUID();
    id v9 = HDSQLiteColumnWithNameAsString();
    uint64_t v10 = HDSQLiteColumnWithNameAsNumber();
    uint64_t v11 = [MEMORY[0x1E4F2AEF0] _metadataWithSyncIdentifier:v9 syncVersion:v10];
    char v12 = [MEMORY[0x1E4F2AEF0] _deletedObjectWithUUID:v8 metadata:v11];
    if (v12) {
      LOBYTE(a4) = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }

    if (v12) {
      return a4 & 1;
    }
  }
  else
  {
    uint64_t v13 = [*(id *)(a1 + 32) objectForPersistentID:v7 row:a3 error:a4];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      uint64_t v15 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

      return v15;
    }
  }
  LOBYTE(a4) = 1;
  return a4 & 1;
}

- (BOOL)enumerateSampleTimesIncludingDeletedObjects:(BOOL)a3 error:(id *)a4 handler:(id)a5
{
  id v9 = a5;
  uint64_t v10 = v9;
  if (!a4)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HDDataEntityEnumerator.m", 208, @"Invalid parameter not satisfying: %@", @"outError != NULL" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDDataEntityEnumerator.m", 209, @"Invalid parameter not satisfying: %@", @"handler != nil" object file lineNumber description];

    char v14 = 0;
    goto LABEL_6;
  }
  if (!v9) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v11 = [(HDSQLiteQueryDescriptor *)self entityClass];
  if (!v11)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDDataEntityEnumerator.m", 215, @"Querying with a nil entity class %@. You're about to be sad. Did you forget to implement -hd_dataEntityClass or an extension in HKObject+HDExtensions?", self object file lineNumber description];
  }
  char v12 = [(HDProfile *)self->_profile database];
  databaseTransactionContext = self->_databaseTransactionContext;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__HDDataEntityEnumerator_enumerateSampleTimesIncludingDeletedObjects_error_handler___block_invoke;
  v19[3] = &unk_1E63094B0;
  BOOL v22 = a3;
  v19[4] = self;
  id v21 = v11;
  id v20 = v10;
  char v14 = [(objc_class *)v11 performReadTransactionWithHealthDatabase:v12 context:databaseTransactionContext error:a4 block:v19];

LABEL_6:
  return v14;
}

uint64_t __84__HDDataEntityEnumerator_enumerateSampleTimesIncludingDeletedObjects_error_handler___block_invoke(uint64_t a1, void *a2, __CFString **a3)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = (unsigned char *)[*(id *)(a1 + 32) copy];
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(a1 + 56))
  {
    if (-[HDDataEntityEnumerator _prepareDescriptor:error:](v7, v6, a3)) {
      goto LABEL_5;
    }
LABEL_6:
    uint64_t v12 = 0;
    goto LABEL_7;
  }
  if (!-[HDDataEntityEnumerator _prepareDeletedObjectsAndSamplesDescriptor:error:](v7, v6, a3)) {
    goto LABEL_6;
  }
  v6[80] = 1;
LABEL_5:
  id v8 = [v5 databaseForEntityClass:*(void *)(a1 + 48)];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F65D60]) initWithDatabase:v8 descriptor:v6];
  uint64_t v10 = +[HDDataEntity disambiguatedSQLForProperty:@"data_id"];
  v20[0] = v10;
  v20[1] = @"start_date";
  v20[2] = @"end_date";
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__HDDataEntityEnumerator_enumerateSampleTimesIncludingDeletedObjects_error_handler___block_invoke_2;
  v18[3] = &unk_1E62F4138;
  id v19 = *(id *)(a1 + 40);
  uint64_t v12 = [v9 enumerateProperties:v11 error:a3 enumerationHandler:v18];
  uint64_t v13 = [v9 lastSQLStatement];
  uint64_t v14 = [v13 copy];
  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(void **)(v15 + 152);
  *(void *)(v15 + 152) = v14;

LABEL_7:
  return v12;
}

uint64_t __84__HDDataEntityEnumerator_enumerateSampleTimesIncludingDeletedObjects_error_handler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  HDSQLiteColumnAsInt64();
  if (MEMORY[0x1C1879FC0](a3, 1)) {
    double v5 = 2.22507386e-308;
  }
  else {
    double v5 = MEMORY[0x1C1879F40](a3, 1);
  }
  if (MEMORY[0x1C1879FC0](a3, 2)) {
    v7.n128_u64[0] = 0x10000000000000;
  }
  else {
    v7.n128_u64[0] = MEMORY[0x1C1879F40](a3, 2);
  }
  id v8 = *(uint64_t (**)(__n128, __n128))(*(void *)(a1 + 32) + 16);
  v6.n128_f64[0] = v5;

  return v8(v6, v7);
}

- (uint64_t)_setOrderingTermsOnDescriptor:(uint64_t)a3 error:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  __n128 v6 = (void *)[(id)a1 entityClass];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = *(id *)(a1 + 136);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = [v6 orderingTermForSortDescriptor:v12];
        if (!v13)
        {
          v16 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v17 = [v12 key];
          objc_msgSend(v16, "hk_assignError:code:format:", a3, 3, @"%@ is not a valid sort key for samples of type %@", v17, *(void *)(a1 + 88));

          uint64_t v15 = 0;
          goto LABEL_11;
        }
        uint64_t v14 = (void *)v13;
        [v5 addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  [v4 setOrderingTerms:v5];
  uint64_t v15 = 1;
LABEL_11:

  return v15;
}

uint64_t __81__HDDataEntityEnumerator__enumerateObjectsWithDatabaseTransaction_error_handler___block_invoke(uint64_t a1)
{
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v2 = HKWithAutoreleasePool();

  return v2;
}

uint64_t __81__HDDataEntityEnumerator__enumerateObjectsWithDatabaseTransaction_error_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) objectForPersistentID:*(void *)(a1 + 48) row:*(void *)(a1 + 56) error:a2];
  if (v3) {
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

- (NSSet)objectTypes
{
  return self->_objectTypes;
}

- (NSSet)restrictedSourceEntities
{
  return self->_restrictedSourceEntities;
}

- (NSNumber)deletedObjectsAnchor
{
  return self->_deletedObjectsAnchor;
}

- (HDSQLitePredicate)deletedObjectsPredicate
{
  return self->_deletedObjectsPredicate;
}

- (void)setDeletedObjectsPredicate:(id)a3
{
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (HDDatabaseTransactionContext)databaseTransactionContext
{
  return self->_databaseTransactionContext;
}

- (void)setDatabaseTransactionContext:(id)a3
{
}

- (BOOL)ignoreEntityClassAdditionalPredicateForEnumeration
{
  return self->_ignoreEntityClassAdditionalPredicateForEnumeration;
}

- (void)setIgnoreEntityClassAdditionalPredicateForEnumeration:(BOOL)a3
{
  self->_ignoreEntityClassAdditionalPredicateForEnumeration = a3;
}

- (BOOL)improveJoinOrderingForStartDateIndexSelection
{
  return self->_improveJoinOrderingForStartDateIndexSelection;
}

- (void)setImproveJoinOrderingForStartDateIndexSelection:(BOOL)a3
{
  self->_improveJoinOrderingForStartDateIndexSelection = a3;
}

- (NSString)lastSQL
{
  return self->_lastSQL;
}

- (_HKFilter)filter
{
  return self->_filter;
}

@end