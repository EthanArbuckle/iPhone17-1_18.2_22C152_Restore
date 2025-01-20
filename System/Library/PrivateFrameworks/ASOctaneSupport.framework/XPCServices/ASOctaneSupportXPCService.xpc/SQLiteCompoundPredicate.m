@interface SQLiteCompoundPredicate
+ (id)predicateMatchingAllPredicates:(id)a3;
+ (id)predicateMatchingAnyPredicates:(id)a3;
+ (id)predicateWithProperty:(id)a3 values:(id)a4 comparisonType:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)predicates;
- (id)SQLForEntityClass:(Class)a3;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (unint64_t)hash;
- (void)applyBinding:(id)a3 atIndex:(int *)a4;
@end

@implementation SQLiteCompoundPredicate

+ (id)predicateMatchingAllPredicates:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)v4[1];
  v4[1] = @" AND ";

  id v6 = [v3 copy];
  v7 = (void *)v4[2];
  v4[2] = v6;

  return v4;
}

+ (id)predicateMatchingAnyPredicates:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)v4[1];
  v4[1] = @" OR ";

  id v6 = [v3 copy];
  v7 = (void *)v4[2];
  v4[2] = v6;

  return v4;
}

+ (id)predicateWithProperty:(id)a3 values:(id)a4 comparisonType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:](SQLiteComparisonPredicate, "predicateWithProperty:value:comparisonType:", v8, *(void *)(*((void *)&v19 + 1) + 8 * i), a5, (void)v19);
        [v10 addObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  v17 = [a1 predicateMatchingAnyPredicates:v10];

  return v17;
}

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = self->_predicates;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v11), "applyBinding:atIndex:", v6, a4, (void)v12);
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)SQLiteCompoundPredicate;
  id v3 = [(SQLitePredicate *)&v8 hash];
  NSUInteger v4 = [(NSString *)self->_combinationOperation hash];
  v5 = [(SQLiteCompoundPredicate *)self predicates];
  id v6 = (char *)[v5 hash] + (void)v3 + v4;

  return (unint64_t)v6;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SQLiteCompoundPredicate;
  if ([(SQLitePredicate *)&v12 isEqual:v4]
    && ((combinationOperation = self->_combinationOperation, combinationOperation == (NSString *)v4[1])
     || -[NSString isEqual:](combinationOperation, "isEqual:")))
  {
    predicates = self->_predicates;
    v7 = [v4 predicates];
    if (predicates == v7)
    {
      unsigned __int8 v10 = 1;
    }
    else
    {
      objc_super v8 = self->_predicates;
      id v9 = [v4 predicates];
      unsigned __int8 v10 = [(NSArray *)v8 isEqual:v9];
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (id)SQLForEntityClass:(Class)a3
{
  if ([(NSArray *)self->_predicates count])
  {
    v5 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"(");
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = self->_predicates;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "SQLForEntityClass:", a3, (void)v13);
          if (v11)
          {
            if ((unint64_t)[v5 length] >= 2) {
              [v5 appendString:self->_combinationOperation];
            }
            [v5 appendString:v11];
          }
        }
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [v5 appendString:@""]);
  }
  else
  {
    v5 = +[NSMutableString stringWithString:@"1"];
  }
  return v5;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  NSUInteger v4 = self->_predicates;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        unsigned __int8 v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "SQLJoinClausesForEntityClass:", a3, (void)v12);
        if (v10)
        {
          if (!v7)
          {
            id v7 = +[NSMutableSet set];
          }
          [v7 unionSet:v10];
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSArray)predicates
{
  return self->_predicates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_combinationOperation, 0);
}

@end