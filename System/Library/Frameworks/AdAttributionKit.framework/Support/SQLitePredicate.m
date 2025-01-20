@interface SQLitePredicate
- (BOOL)isEqual:(id)a3;
- (id)SQLForEntityClass:(Class)a3;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (unint64_t)hash;
@end

@implementation SQLitePredicate

- (id)SQLForEntityClass:(Class)a3
{
  return 0;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  return 0;
}

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return (unint64_t)[v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();

  return v4 == v5;
}

@end