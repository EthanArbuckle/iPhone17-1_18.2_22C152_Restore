@interface HDSQLiteJoinPredicate
+ (id)predicateWithJoinClauses:(id)a3;
- (NSSet)joinClauses;
@end

@implementation HDSQLiteJoinPredicate

+ (id)predicateWithJoinClauses:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(HDSQLiteJoinPredicate);
  uint64_t v5 = [v3 copy];

  joinClauses = v4->_joinClauses;
  v4->_joinClauses = (NSSet *)v5;

  return v4;
}

- (NSSet)joinClauses
{
  return self->_joinClauses;
}

- (void).cxx_destruct
{
}

@end