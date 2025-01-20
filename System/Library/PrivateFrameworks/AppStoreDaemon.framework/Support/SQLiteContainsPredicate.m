@interface SQLiteContainsPredicate
+ (id)containsPredicateWithProperty:(id)a3 query:(id)a4 queryProperty:(id)a5;
+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4;
+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNegative;
- (NSArray)values;
- (NSString)queryProperty;
- (SQLiteQuery)query;
- (id)SQLForEntityClass:(Class)a3;
- (void)applyBinding:(id)a3 atIndex:(int *)a4;
@end

@implementation SQLiteContainsPredicate

+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  id v8 = [v6 copy];

  v9 = (void *)v7[1];
  v7[1] = v8;

  *((unsigned char *)v7 + 16) = 0;
  id v10 = [v5 copy];

  v11 = (void *)v7[5];
  v7[5] = v10;

  return v7;
}

+ (id)containsPredicateWithProperty:(id)a3 query:(id)a4 queryProperty:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  id v11 = [v9 copy];

  v12 = (void *)v10[1];
  v10[1] = v11;

  *((unsigned char *)v10 + 16) = 0;
  v13 = (void *)v10[3];
  v10[3] = v7;
  id v14 = v7;

  id v15 = [v8 copy];
  v16 = (void *)v10[4];
  v10[4] = v15;

  return v10;
}

+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  id v8 = [v6 copy];

  id v9 = (void *)v7[1];
  v7[1] = v8;

  *((unsigned char *)v7 + 16) = 1;
  id v10 = [v5 copy];

  id v11 = (void *)v7[5];
  v7[5] = v10;

  return v7;
}

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  id v6 = a3;
  query = self->_query;
  if (query)
  {
    [(SQLiteQuery *)query applyBinding:v6 atIndex:a4];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = self->_values;
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          sub_10041E7A8(v6, *a4, *(void **)(*((void *)&v13 + 1) + 8 * i));
          ++*a4;
        }
        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SQLiteContainsPredicate;
  if ([(SQLitePropertyPredicate *)&v17 isEqual:v6])
  {
    unsigned int v7 = [(SQLiteContainsPredicate *)self isNegative];
    if (v7 == [v6 isNegative])
    {
      id v9 = [(SQLiteContainsPredicate *)self values];
      id v10 = [v6 values];
      if (v9 == v10
        || ([(SQLiteContainsPredicate *)self values],
            v3 = objc_claimAutoreleasedReturnValue(),
            [v6 values],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        uint64_t v11 = [(SQLiteContainsPredicate *)self query];
        uint64_t v12 = [v6 query];
        if (v11 == (void *)v12)
        {

          unsigned __int8 v8 = 1;
        }
        else
        {
          long long v13 = (void *)v12;
          long long v14 = [(SQLiteContainsPredicate *)self query];
          long long v15 = [v6 query];
          unsigned __int8 v8 = [v14 isEqual:v15];
        }
        if (v9 == v10) {
          goto LABEL_12;
        }
      }
      else
      {
        unsigned __int8 v8 = 0;
      }

LABEL_12:
      goto LABEL_13;
    }
  }
  unsigned __int8 v8 = 0;
LABEL_13:

  return v8;
}

- (id)SQLForEntityClass:(Class)a3
{
  id v5 = [(SQLitePropertyPredicate *)self property];
  id v6 = [(objc_class *)a3 disambiguatedSQLForProperty:v5];

  unsigned int v7 = +[NSMutableString stringWithString:v6];
  unsigned __int8 v8 = v7;
  if (self->_negative) {
    CFStringRef v9 = CFSTR(" NOT IN (");
  }
  else {
    CFStringRef v9 = CFSTR(" IN (");
  }
  [v7 appendString:v9];
  query = self->_query;
  if (query)
  {
    queryProperty = self->_queryProperty;
    uint64_t v11 = +[NSArray arrayWithObjects:&queryProperty count:1];
    id v12 = [(SQLiteQuery *)query copySelectSQLWithProperties:v11];

    if (v12) {
      [v8 appendString:v12];
    }
  }
  else
  {
    long long v14 = (char *)[self->_values count];
    if (v14)
    {
      long long v15 = v14;
      [v8 appendString:@"?"];
      long long v16 = v15 - 1;
      if (v15 != (char *)1)
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

- (SQLiteQuery)query
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