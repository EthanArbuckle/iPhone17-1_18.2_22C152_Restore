@interface SQLiteNullPredicate
+ (id)isNotNullPredicateWithProperty:(id)a3;
+ (id)isNullPredicateWithProperty:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesNull;
- (id)SQLForEntityClass:(Class)a3;
@end

@implementation SQLiteNullPredicate

+ (id)isNotNullPredicateWithProperty:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[24] = 0;
  id v5 = [v3 copy];

  v6 = (void *)*((void *)v4 + 1);
  *((void *)v4 + 1) = v5;

  return v4;
}

+ (id)isNullPredicateWithProperty:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[24] = 1;
  id v5 = [v3 copy];

  v6 = (void *)*((void *)v4 + 1);
  *((void *)v4 + 1) = v5;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SQLiteNullPredicate;
  if ([(SQLitePropertyPredicate *)&v8 isEqual:v4])
  {
    unsigned int v5 = [(SQLiteNullPredicate *)self matchesNull];
    unsigned int v6 = v5 ^ [v4 matchesNull] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)SQLForEntityClass:(Class)a3
{
  id v4 = [(SQLitePropertyPredicate *)self _transformedSQLForEntityClass:a3];
  unsigned int v5 = [(SQLiteNullPredicate *)self matchesNull];
  CFStringRef v6 = @"IS NOT NULL";
  if (v5) {
    CFStringRef v6 = @"IS NULL";
  }
  v7 = +[NSString stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (BOOL)matchesNull
{
  return self->_matchesNull;
}

@end