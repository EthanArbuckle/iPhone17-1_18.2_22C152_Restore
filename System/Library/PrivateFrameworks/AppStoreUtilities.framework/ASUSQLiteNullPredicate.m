@interface ASUSQLiteNullPredicate
+ (id)isNotNullPredicateWithProperty:(id)a3;
+ (id)isNullPredicateWithProperty:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesNull;
- (id)SQLForEntityClass:(Class)a3;
@end

@implementation ASUSQLiteNullPredicate

+ (id)isNotNullPredicateWithProperty:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[16] = 0;
  uint64_t v5 = [v3 copy];

  v6 = (void *)*((void *)v4 + 1);
  *((void *)v4 + 1) = v5;

  return v4;
}

+ (id)isNullPredicateWithProperty:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[16] = 1;
  uint64_t v5 = [v3 copy];

  v6 = (void *)*((void *)v4 + 1);
  *((void *)v4 + 1) = v5;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASUSQLiteNullPredicate;
  if ([(ASUSQLitePropertyPredicate *)&v8 isEqual:v4])
  {
    BOOL v5 = [(ASUSQLiteNullPredicate *)self matchesNull];
    int v6 = v5 ^ [v4 matchesNull] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)SQLForEntityClass:(Class)a3
{
  BOOL v5 = [(ASUSQLitePropertyPredicate *)self property];
  int v6 = [(objc_class *)a3 disambiguatedSQLForProperty:v5];

  v7 = NSString;
  BOOL v8 = [(ASUSQLiteNullPredicate *)self matchesNull];
  v9 = @"IS NOT NULL";
  if (v8) {
    v9 = @"IS NULL";
  }
  v10 = [v7 stringWithFormat:@"%@ %@", v6, v9];

  return v10;
}

- (BOOL)matchesNull
{
  return self->_matchesNull;
}

@end