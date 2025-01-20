@interface AMSSQLiteQueryDescriptor
- (AMSSQLitePredicate)predicate;
- (BOOL)returnsDistinctEntities;
- (Class)entityClass;
- (Class)memoryEntityClass;
- (NSArray)orderingDirections;
- (NSArray)orderingProperties;
- (NSString)orderingClause;
- (id)_newSelectSQLWithProperties:(id)a3 columns:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)limitCount;
- (void)setEntityClass:(Class)a3;
- (void)setLimitCount:(int64_t)a3;
- (void)setMemoryEntityClass:(Class)a3;
- (void)setOrderingClause:(id)a3;
- (void)setOrderingDirections:(id)a3;
- (void)setOrderingProperties:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setReturnsDistinctEntities:(BOOL)a3;
@end

@implementation AMSSQLiteQueryDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = self->_entityClass;
  *(void *)(v5 + 16) = self->_limitCount;
  *(void *)(v5 + 24) = self->_memoryEntityClass;
  uint64_t v6 = [(NSString *)self->_orderingClause copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSArray *)self->_orderingDirections copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSArray *)self->_orderingProperties copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  id v12 = [(AMSSQLitePredicate *)self->_predicate copyWithZone:a3];
  v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  *(unsigned char *)(v5 + 64) = self->_returnsDistinctEntities;
  return (id)v5;
}

- (id)_newSelectSQLWithProperties:(id)a3 columns:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"SELECT "];
  v9 = v8;
  if (self->_returnsDistinctEntities) {
    [v8 appendString:@"DISTINCT "];
  }
  v37 = v7;
  uint64_t v10 = [v7 componentsJoinedByString:@", "];
  [v9 appendString:v10];

  v11 = [(objc_class *)self->_entityClass databaseTable];
  [v9 appendFormat:@" FROM %@", v11];

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v13 = [(AMSSQLitePredicate *)self->_predicate SQLJoinClausesForEntityClass:self->_entityClass];
  if (v13) {
    [v12 unionSet:v13];
  }
  v36 = (void *)v13;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v43 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [(objc_class *)self->_entityClass joinClauseForProperty:*(void *)(*((void *)&v42 + 1) + 8 * i)];
        if (v19) {
          [v12 addObject:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v16);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v20 = v12;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8 * j);
        [v9 appendString:@" "];
        [v9 appendString:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v22);
  }

  v26 = [(AMSSQLitePredicate *)self->_predicate SQLForEntityClass:self->_entityClass];
  if (v26)
  {
    [v9 appendString:@" WHERE "];
    [v9 appendString:v26];
  }
  uint64_t v27 = [(NSArray *)self->_orderingProperties count];
  if (self->_orderingClause)
  {
    [v9 appendString:@" ORDER BY "];
    [v9 appendString:self->_orderingClause];
  }
  else
  {
    uint64_t v28 = v27;
    if (v27 >= 1)
    {
      id v29 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      unint64_t v30 = 0;
      do
      {
        Class entityClass = self->_entityClass;
        v32 = [(NSArray *)self->_orderingProperties objectAtIndex:v30];
        v33 = [(objc_class *)entityClass disambiguatedSQLForProperty:v32];

        if ([v29 length]) {
          [v29 appendString:@", "];
        }
        [v29 appendString:v33];
        [v29 appendString:@" "];
        if (v30 >= [(NSArray *)self->_orderingDirections count])
        {
          [v29 appendString:@"ASC"];
        }
        else
        {
          v34 = [(NSArray *)self->_orderingDirections objectAtIndex:v30];
          [v29 appendString:v34];
        }
        ++v30;
      }
      while (v28 != v30);
      [v9 appendString:@" ORDER BY "];
      [v9 appendString:v29];
    }
  }
  if (self->_limitCount) {
    [v9 appendString:@" LIMIT ?"];
  }

  return v9;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (void)setEntityClass:(Class)a3
{
  self->_Class entityClass = a3;
}

- (Class)memoryEntityClass
{
  return self->_memoryEntityClass;
}

- (void)setMemoryEntityClass:(Class)a3
{
  self->_memoryEntityClass = a3;
}

- (int64_t)limitCount
{
  return self->_limitCount;
}

- (void)setLimitCount:(int64_t)a3
{
  self->_limitCount = a3;
}

- (NSString)orderingClause
{
  return self->_orderingClause;
}

- (void)setOrderingClause:(id)a3
{
}

- (NSArray)orderingDirections
{
  return self->_orderingDirections;
}

- (void)setOrderingDirections:(id)a3
{
}

- (NSArray)orderingProperties
{
  return self->_orderingProperties;
}

- (void)setOrderingProperties:(id)a3
{
}

- (BOOL)returnsDistinctEntities
{
  return self->_returnsDistinctEntities;
}

- (void)setReturnsDistinctEntities:(BOOL)a3
{
  self->_returnsDistinctEntities = a3;
}

- (AMSSQLitePredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_orderingProperties, 0);
  objc_storeStrong((id *)&self->_orderingDirections, 0);
  objc_storeStrong((id *)&self->_orderingClause, 0);
}

@end