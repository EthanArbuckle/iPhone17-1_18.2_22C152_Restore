@interface HDSQLiteTruePredicate
- (id)SQLForEntityClass:(Class)a3;
@end

@implementation HDSQLiteTruePredicate

- (id)SQLForEntityClass:(Class)a3
{
  return @"(1=1)";
}

@end