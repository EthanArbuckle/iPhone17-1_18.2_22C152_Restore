@interface HDSQLiteFalsePredicate
- (id)SQLForEntityClass:(Class)a3;
@end

@implementation HDSQLiteFalsePredicate

- (id)SQLForEntityClass:(Class)a3
{
  return @"(1=0)";
}

@end