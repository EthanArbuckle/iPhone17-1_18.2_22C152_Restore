@interface HDSQLiteQueryDescriptor
- (BOOL)returnsDistinctEntities;
- (BOOL)shouldExpandLastSQLStatement;
- (Class)entityClass;
- (HDSQLitePredicate)predicate;
- (NSArray)orderingTerms;
- (NSArray)preferredEntityJoinOrder;
- (NSString)groupBy;
- (id)_SQLForDeleteWithError:(id *)a3;
- (id)_SQLForSelectWithProperties:(id)a3 columns:(id)a4;
- (id)_joinClauseComparatorWithPreferredEntityOrder:(void *)a1;
- (id)_joinClauseForProperties:(id)a3;
- (id)_sortedJoinClauses:(id)a3 preferredOrder:(id)a4 baseTables:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)selectSQLForProperties:(id)a3;
- (int64_t)limitCount;
- (void)bindToDeleteStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
- (void)bindToSelectStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
- (void)setEntityClass:(Class)a3;
- (void)setGroupBy:(id)a3;
- (void)setLimitCount:(int64_t)a3;
- (void)setOrderingTerms:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setPreferredEntityJoinOrder:(id)a3;
- (void)setReturnsDistinctEntities:(BOOL)a3;
- (void)setShouldExpandLastSQLStatement:(BOOL)a3;
@end

@implementation HDSQLiteQueryDescriptor

- (id)_sortedJoinClauses:(id)a3 preferredOrder:(id)a4 baseTables:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v27 = a4;
  id v25 = a5;
  v8 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithSet:v25];
  v30 = (void *)[v26 mutableCopy];
  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v27)
  {
    v29 = -[HDSQLiteQueryDescriptor _joinClauseComparatorWithPreferredEntityOrder:](self, v27);
  }
  else
  {
    v29 = 0;
  }
  while (objc_msgSend(v30, "count", v25))
  {
    [v9 removeAllObjects];
    [v10 removeAllObjects];
    v11 = [v30 allObjects];
    v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_6];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v13);
          }
          v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v18 = [v17 localTable];
          char v19 = [v8 containsObject:v18];

          if (v19)
          {
            [v9 addObject:v17];
            v20 = [v17 joinAsName];
            char v21 = [v8 containsObject:v20];

            if ((v21 & 1) == 0)
            {
              v22 = [v17 joinAsName];
              [v8 addObject:v22];

              [v10 addObject:v17];
            }
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v14);
    }

    if (![v9 count])
    {
      _HKInitializeLogging();
      v23 = *MEMORY[0x263F098E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E8], OS_LOG_TYPE_ERROR)) {
        -[HDSQLiteQueryDescriptor _sortedJoinClauses:preferredOrder:baseTables:]((uint64_t)v30, (uint64_t)v8, v23);
      }

      break;
    }
    if (v29) {
      [v10 sortUsingComparator:v29];
    }
    [v28 addObjectsFromArray:v10];
    [v30 minusSet:v9];
  }

  return v28;
}

- (id)selectSQLForProperties:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6 = [(HDSQLiteQueryDescriptor *)self entityClass];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = -[objc_class disambiguatedSQLForProperty:](v6, "disambiguatedSQLForProperty:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = [(HDSQLiteQueryDescriptor *)self _SQLForSelectWithProperties:v7 columns:v5];

  return v12;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (id)_SQLForSelectWithProperties:(id)a3 columns:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v9 = (id)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"SELECT "];
  id v10 = v6;
  id v11 = v5;
  HKWithAutoreleasePool();
  id v7 = v9;

  return v7;
}

- (id)_joinClauseForProperties:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v25 = objc_msgSend((id)-[objc_class entityClassForEnumeration](self->_entityClass, "entityClassForEnumeration"), "disambiguatedDatabaseTable");
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v5 = [(HDSQLitePredicate *)self->_predicate SQLJoinClausesForEntityClass:self->_entityClass];
  if ([v5 count]) {
    [v4 unionSet:v5];
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v24;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [(objc_class *)self->_entityClass joinClausesForProperty:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        if (v10) {
          [v4 unionSet:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    if ((unint64_t)[v4 count] < 2)
    {
      v18 = [v4 anyObject];
      uint64_t v19 = NSString;
      v20 = [v18 SQLJoinClause];
      id v11 = [v19 stringWithFormat:@"%@ %@", v25, v20];
    }
    else
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", v25, 0);
      v23 = -[HDSQLiteQueryDescriptor _sortedJoinClauses:preferredOrder:baseTables:](self, "_sortedJoinClauses:preferredOrder:baseTables:", v4, self->_preferredEntityJoinOrder);
      id v11 = (id)[v25 mutableCopy];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v12 = v23;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v27;
        do
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v12);
            }
            long long v16 = *(void **)(*((void *)&v26 + 1) + 8 * j);
            [v11 appendString:@" "];
            long long v17 = [v16 SQLJoinClause];
            [v11 appendString:v17];
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
        }
        while (v13);
      }
    }
  }
  else
  {
    id v11 = v25;
  }

  return v11;
}

uint64_t __72__HDSQLiteQueryDescriptor__sortedJoinClauses_preferredOrder_baseTables___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 joinType];
  if (v6 >= [v5 joinType])
  {
    uint64_t v8 = [v4 joinType];
    uint64_t v7 = v8 > [v5 joinType];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredEntityJoinOrder, 0);
  objc_storeStrong((id *)&self->_groupBy, 0);
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_storeStrong((id *)&self->_orderingTerms, 0);
}

- (HDSQLitePredicate)predicate
{
  return self->_predicate;
}

id __63__HDSQLiteQueryDescriptor__SQLForSelectWithProperties_columns___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 SQL];

  return v2;
}

- (void)setPredicate:(id)a3
{
}

- (void)setEntityClass:(Class)a3
{
  self->_entityClass = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 16) = self->_entityClass;
  *(void *)(v5 + 24) = self->_limitCount;
  uint64_t v6 = [(NSArray *)self->_orderingTerms copy];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  id v8 = [(HDSQLitePredicate *)self->_predicate copyWithZone:a3];
  id v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  *(unsigned char *)(v5 + 8) = self->_returnsDistinctEntities;
  uint64_t v10 = [(NSString *)self->_groupBy copy];
  id v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSArray *)self->_preferredEntityJoinOrder copy];
  uint64_t v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  *(unsigned char *)(v5 + 9) = self->_shouldExpandLastSQLStatement;
  return (id)v5;
}

- (void)setGroupBy:(id)a3
{
}

- (void)setLimitCount:(int64_t)a3
{
  self->_limitCount = a3;
}

- (void)setOrderingTerms:(id)a3
{
}

- (NSString)groupBy
{
  return self->_groupBy;
}

uint64_t __63__HDSQLiteQueryDescriptor__SQLForSelectWithProperties_columns___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8)) {
    [*(id *)(a1 + 40) appendString:@"DISTINCT "];
  }
  v2 = *(void **)(a1 + 40);
  v3 = [*(id *)(a1 + 48) componentsJoinedByString:@", "];
  [v2 appendString:v3];

  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 32) _joinClauseForProperties:*(void *)(a1 + 56)];
  [v4 appendFormat:@" FROM %@", v5];

  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 40) SQLForEntityClass:*(void *)(*(void *)(a1 + 32) + 16)];
  if (v6) {
    [*(id *)(a1 + 40) appendFormat:@" WHERE %@", v6];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 48);
  if (v8)
  {
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = [NSString stringWithFormat:@" GROUP BY %@", v8];
    [v9 appendString:v10];

    uint64_t v7 = *(void *)(a1 + 32);
  }
  if ([*(id *)(v7 + 32) count])
  {
    [*(id *)(a1 + 40) appendString:@" ORDER BY "];
    objc_msgSend(*(id *)(a1 + 40), "hk_appendComponentsJoinedByString:container:componentGenerator:", @", ", *(void *)(*(void *)(a1 + 32) + 32), &__block_literal_global_375);
  }
  if (*(void *)(*(void *)(a1 + 32) + 24)) {
    [*(id *)(a1 + 40) appendString:@" LIMIT ?"];
  }

  return 1;
}

- (id)_SQLForDeleteWithError:(id *)a3
{
  uint64_t v5 = (void *)MEMORY[0x263EFF4A0];
  if (self->_returnsDistinctEntities) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The DELETE statement does not support the DISTINCT keyword"];
  }
  if (self->_groupBy) {
    [MEMORY[0x263EFF940] raise:*v5 format:@"The DELETE statement does not support the GROUP BY keyword"];
  }
  uint64_t v6 = [(objc_class *)self->_entityClass disambiguatedDatabaseTable];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"DELETE FROM %@", v6];
  uint64_t v8 = [(HDSQLitePredicate *)self->_predicate SQLJoinClausesForEntityClass:self->_entityClass];
  if ([v8 count])
  {
    id v9 = [(HDSQLiteQueryDescriptor *)self _joinClauseForProperties:0];
    if (!v9)
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a3, 100, @"SQL could not be created due to non-expected nil join clause");
      id v13 = 0;
      goto LABEL_16;
    }
    uint64_t v10 = [(HDSQLitePredicate *)self->_predicate SQLForEntityClass:self->_entityClass];
    if (v10)
    {
      id v11 = [(objc_class *)self->_entityClass disambiguatedSQLForProperty:@"ROWID"];
      [v7 appendFormat:@" WHERE %@ IN (SELECT %@ FROM %@ WHERE %@)", v11, v11, v9, v10];
    }
  }
  else
  {
    uint64_t v12 = [(HDSQLitePredicate *)self->_predicate SQLForEntityClass:self->_entityClass];
    id v9 = (void *)v12;
    if (v12) {
      [v7 appendFormat:@" WHERE %@", v12];
    }
  }

  if (self->_limitCount) {
    [v7 appendFormat:@" LIMIT ?"];
  }
  id v13 = v7;
LABEL_16:

  return v13;
}

- (void)bindToSelectStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  -[HDSQLitePredicate bindToStatement:bindingIndex:](self->_predicate, "bindToStatement:bindingIndex:");
  groupBy = self->_groupBy;
  if (groupBy) {
    sqlite3_bind_text(a3, *a4, [(NSString *)groupBy UTF8String], [(NSString *)self->_groupBy length], (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  int64_t limitCount = self->_limitCount;
  if (limitCount >= 0x80000000)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HDSQLiteQuery.mm", 151, @"bindToSelectStatement called with limit count %ld, greater than maximum allowed limit count (%d)", self->_limitCount, 0x7FFFFFFFLL object file lineNumber description];

    int64_t limitCount = self->_limitCount;
    if (!limitCount) {
      return;
    }
  }
  else if (!limitCount)
  {
    return;
  }
  sqlite3_bind_int(a3, *a4, limitCount);
  ++*a4;
}

- (BOOL)shouldExpandLastSQLStatement
{
  return self->_shouldExpandLastSQLStatement;
}

- (void)setReturnsDistinctEntities:(BOOL)a3
{
  self->_returnsDistinctEntities = a3;
}

- (void)bindToDeleteStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  -[HDSQLitePredicate bindToStatement:bindingIndex:](self->_predicate, "bindToStatement:bindingIndex:");
  int64_t limitCount = self->_limitCount;
  if (limitCount >= 0x80000000)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HDSQLiteQuery.mm", 161, @"bindToDeleteStatement called with limit count %ld, greater than maximum allowed limit count (%d)", self->_limitCount, 0x7FFFFFFFLL object file lineNumber description];

    int64_t limitCount = self->_limitCount;
    if (!limitCount) {
      return;
    }
  }
  else if (!limitCount)
  {
    return;
  }
  sqlite3_bind_int(a3, *a4, limitCount);
  ++*a4;
}

- (id)_joinClauseComparatorWithPreferredEntityOrder:(void *)a1
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        uint64_t v10 = v7;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * v9);
          uint64_t v12 = [NSNumber numberWithInteger:v10 + v9];
          [v4 setObject:v12 forKeyedSubscript:v11];

          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        uint64_t v7 = v10 + v9;
      }
      while (v6);
      uint64_t v6 = v10 + v9;
    }

    id v13 = [NSNumber numberWithInteger:v6];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __73__HDSQLiteQueryDescriptor__joinClauseComparatorWithPreferredEntityOrder___block_invoke;
    v17[3] = &unk_2643D4F38;
    id v18 = v4;
    id v19 = v13;
    id v14 = v13;
    id v15 = v4;
    a1 = (void *)MEMORY[0x21D49F640](v17);
  }

  return a1;
}

uint64_t __73__HDSQLiteQueryDescriptor__joinClauseComparatorWithPreferredEntityOrder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", objc_msgSend(v5, "targetEntityClass"));
  uint64_t v8 = v7;
  if (!v7) {
    uint64_t v8 = *(void **)(a1 + 40);
  }
  id v9 = v8;

  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", objc_msgSend(v6, "targetEntityClass"));
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v11 = *(void **)(a1 + 40);
  }
  id v12 = v11;

  uint64_t v13 = [v9 compare:v12];
  return v13;
}

- (int64_t)limitCount
{
  return self->_limitCount;
}

- (NSArray)orderingTerms
{
  return self->_orderingTerms;
}

- (BOOL)returnsDistinctEntities
{
  return self->_returnsDistinctEntities;
}

- (NSArray)preferredEntityJoinOrder
{
  return self->_preferredEntityJoinOrder;
}

- (void)setPreferredEntityJoinOrder:(id)a3
{
}

- (void)setShouldExpandLastSQLStatement:(BOOL)a3
{
  self->_shouldExpandLastSQLStatement = a3;
}

- (void)_sortedJoinClauses:(uint64_t)a1 preferredOrder:(uint64_t)a2 baseTables:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21BFB4000, log, OS_LOG_TYPE_ERROR, "No clauses in %@ can be joined after tables %@", (uint8_t *)&v3, 0x16u);
}

@end