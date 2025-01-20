@interface SQLiteQueryDescriptor
- (BOOL)returnsDistinctEntities;
- (Class)entityClass;
- (Class)memoryEntityClass;
- (NSArray)orderingDirections;
- (NSArray)orderingProperties;
- (NSString)orderingClause;
- (SQLitePredicate)predicate;
- (SQLiteQueryDescriptor)initWithEntityClass:(Class)a3;
- (SQLiteQueryDescriptor)initWithEntityClass:(Class)a3 memoryEntityClass:(Class)a4;
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

@implementation SQLiteQueryDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_entityClass;
  v5[2] = self->_limitCount;
  v5[3] = self->_memoryEntityClass;
  id v6 = [(NSString *)self->_orderingClause copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSArray *)self->_orderingDirections copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  id v10 = [(NSArray *)self->_orderingProperties copyWithZone:a3];
  v11 = (void *)v5[6];
  v5[6] = v10;

  id v12 = [(SQLitePredicate *)self->_predicate copyWithZone:a3];
  v13 = (void *)v5[7];
  v5[7] = v12;

  *((unsigned char *)v5 + 64) = self->_returnsDistinctEntities;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_orderingProperties, 0);
  objc_storeStrong((id *)&self->_orderingDirections, 0);

  objc_storeStrong((id *)&self->_orderingClause, 0);
}

- (id)_newSelectSQLWithProperties:(id)a3 columns:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSMutableString) initWithString:@"SELECT "];
  v9 = v8;
  if (self->_returnsDistinctEntities) {
    [v8 appendString:@"DISTINCT "];
  }
  v37 = v7;
  id v10 = [v7 componentsJoinedByString:@", "];
  [v9 appendString:v10];

  v11 = [(objc_class *)self->_entityClass databaseTable];
  [v9 appendFormat:@" FROM %@", v11];

  id v12 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v13 = [(SQLitePredicate *)self->_predicate SQLJoinClausesForEntityClass:self->_entityClass];
  if (v13) {
    [v12 unionSet:v13];
  }
  v36 = (void *)v13;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v14 = v6;
  id v15 = [v14 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v43;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v43 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [(objc_class *)self->_entityClass joinClauseForProperty:*(void *)(*((void *)&v42 + 1) + 8 * i)];
        if (v19) {
          [v12 addObject:v19];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v16);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v20 = v12;
  id v21 = [v20 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v39;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8 * (void)j);
        [v9 appendString:@" "];
        [v9 appendString:v25];
      }
      id v22 = [v20 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v22);
  }

  v26 = [(SQLitePredicate *)self->_predicate SQLForEntityClass:self->_entityClass];
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
      id v29 = objc_alloc_init((Class)NSMutableString);
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

- (void)setPredicate:(id)a3
{
}

- (void)setOrderingProperties:(id)a3
{
}

- (void)setOrderingDirections:(id)a3
{
}

- (SQLitePredicate)predicate
{
  return self->_predicate;
}

- (int64_t)limitCount
{
  return self->_limitCount;
}

- (SQLiteQueryDescriptor)initWithEntityClass:(Class)a3 memoryEntityClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SQLiteQueryDescriptor;
  result = [(SQLiteQueryDescriptor *)&v7 init];
  if (result)
  {
    result->_Class entityClass = a3;
    result->_memoryEntityClass = a4;
  }
  return result;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (SQLiteQueryDescriptor)initWithEntityClass:(Class)a3
{
  return [(SQLiteQueryDescriptor *)self initWithEntityClass:a3 memoryEntityClass:0];
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

- (NSArray)orderingProperties
{
  return self->_orderingProperties;
}

- (BOOL)returnsDistinctEntities
{
  return self->_returnsDistinctEntities;
}

- (void)setReturnsDistinctEntities:(BOOL)a3
{
  self->_returnsDistinctEntities = a3;
}

@end