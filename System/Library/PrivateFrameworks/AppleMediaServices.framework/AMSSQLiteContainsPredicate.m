@interface AMSSQLiteContainsPredicate
+ (id)containsPredicateWithProperty:(id)a3 query:(id)a4 queryProperty:(id)a5;
+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4;
+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4;
- (AMSSQLiteQuery)query;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNegative;
- (NSArray)values;
- (NSString)queryProperty;
- (id)SQLForEntityClass:(Class)a3;
- (void)applyBinding:(id)a3 atIndex:(int *)a4;
@end

@implementation AMSSQLiteContainsPredicate

+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v8 = [v6 copy];

  v9 = (void *)v7[1];
  v7[1] = v8;

  *((unsigned char *)v7 + 16) = 0;
  uint64_t v10 = [v5 copy];

  v11 = (void *)v7[5];
  v7[5] = v10;

  return v7;
}

+ (id)containsPredicateWithProperty:(id)a3 query:(id)a4 queryProperty:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v11 = [v9 copy];

  v12 = (void *)v10[1];
  v10[1] = v11;

  *((unsigned char *)v10 + 16) = 0;
  v13 = (void *)v10[3];
  v10[3] = v7;
  id v14 = v7;

  uint64_t v15 = [v8 copy];
  v16 = (void *)v10[4];
  v10[4] = v15;

  return v10;
}

+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v8 = [v6 copy];

  id v9 = (void *)v7[1];
  v7[1] = v8;

  *((unsigned char *)v7 + 16) = 1;
  uint64_t v10 = [v5 copy];

  uint64_t v11 = (void *)v7[5];
  v7[5] = v10;

  return v7;
}

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  query = self->_query;
  if (query)
  {
    [(AMSSQLiteQuery *)query applyBinding:v6 atIndex:a4];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = self->_values;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          AMSSQLiteBindFoundationValue(v6, *a4, *(void **)(*((void *)&v13 + 1) + 8 * i));
          ++*a4;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AMSSQLiteContainsPredicate;
  if ([(AMSSQLitePropertyPredicate *)&v17 isEqual:v6])
  {
    int v7 = [(AMSSQLiteContainsPredicate *)self isNegative];
    if (v7 == [v6 isNegative])
    {
      uint64_t v9 = [(AMSSQLiteContainsPredicate *)self values];
      uint64_t v10 = [v6 values];
      if (v9 == v10
        || ([(AMSSQLiteContainsPredicate *)self values],
            v3 = objc_claimAutoreleasedReturnValue(),
            [v6 values],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        uint64_t v11 = [(AMSSQLiteContainsPredicate *)self query];
        uint64_t v12 = [v6 query];
        if (v11 == (void *)v12)
        {

          char v8 = 1;
        }
        else
        {
          long long v13 = (void *)v12;
          long long v14 = [(AMSSQLiteContainsPredicate *)self query];
          long long v15 = [v6 query];
          char v8 = [v14 isEqual:v15];
        }
        if (v9 == v10) {
          goto LABEL_12;
        }
      }
      else
      {
        char v8 = 0;
      }

LABEL_12:
      goto LABEL_13;
    }
  }
  char v8 = 0;
LABEL_13:

  return v8;
}

- (id)SQLForEntityClass:(Class)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(AMSSQLitePropertyPredicate *)self property];
  id v6 = [(objc_class *)a3 disambiguatedSQLForProperty:v5];

  int v7 = [MEMORY[0x1E4F28E78] stringWithString:v6];
  char v8 = v7;
  if (self->_negative) {
    uint64_t v9 = CFSTR(" NOT IN (");
  }
  else {
    uint64_t v9 = CFSTR(" IN (");
  }
  [v7 appendString:v9];
  query = self->_query;
  if (query)
  {
    v17[0] = self->_queryProperty;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    id v12 = [(AMSSQLiteQuery *)query copySelectSQLWithProperties:v11];

    if (v12) {
      [v8 appendString:v12];
    }
  }
  else
  {
    uint64_t v14 = [self->_values count];
    if (v14)
    {
      uint64_t v15 = v14;
      [v8 appendString:@"?"];
      uint64_t v16 = v15 - 1;
      if (v15 != 1)
      {
        do
        {
          [v8 appendString:@", ?"];
          --v16;
        }
        while (v16);
      }
    }
  }
  [v8 appendString:@""]);

  return v8;
}

- (BOOL)isNegative
{
  return self->_negative;
}

- (AMSSQLiteQuery)query
{
  return self->_query;
}

- (NSString)queryProperty
{
  return self->_queryProperty;
}

- (NSArray)values
{
  return (NSArray *)self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_values, 0);
  objc_storeStrong((id *)&self->_queryProperty, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end