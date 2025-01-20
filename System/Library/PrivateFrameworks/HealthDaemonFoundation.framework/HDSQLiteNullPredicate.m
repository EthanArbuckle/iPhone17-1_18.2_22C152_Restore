@interface HDSQLiteNullPredicate
+ (id)isNotNullPredicateWithProperty:(id)a3;
+ (id)isNullPredicateWithProperty:(id)a3;
- (BOOL)isCompatibleWithPredicate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesNull;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
@end

@implementation HDSQLiteNullPredicate

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

- (id)SQLForEntityClass:(Class)a3
{
  uint64_t v5 = [(HDSQLitePropertyPredicate *)self property];
  v6 = [(objc_class *)a3 disambiguatedSQLForProperty:v5];

  v7 = NSString;
  BOOL v8 = [(HDSQLiteNullPredicate *)self matchesNull];
  v9 = @"IS NOT NULL";
  if (v8) {
    v9 = @"IS NULL";
  }
  v10 = [v7 stringWithFormat:@"(%@ %@)", v6, v9];

  return v10;
}

- (BOOL)matchesNull
{
  return self->_matchesNull;
}

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

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDSQLiteNullPredicate;
  if ([(HDSQLitePropertyPredicate *)&v8 isEqual:v4])
  {
    BOOL v5 = [(HDSQLiteNullPredicate *)self matchesNull];
    int v6 = v5 ^ [v4 matchesNull] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = [(HDSQLitePropertyPredicate *)self property];
  BOOL v5 = (void *)v4;
  if (self->_matchesNull) {
    int v6 = "";
  }
  else {
    int v6 = "NOT ";
  }
  v7 = [v3 stringWithFormat:@"<\"%@\" IS %sNULL>", v4, v6];

  return v7;
}

- (BOOL)isCompatibleWithPredicate:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)HDSQLiteNullPredicate;
  if ([(HDSQLitePropertyPredicate *)&v7 isCompatibleWithPredicate:v4]) {
    BOOL v5 = self->_matchesNull == v4[16];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

@end