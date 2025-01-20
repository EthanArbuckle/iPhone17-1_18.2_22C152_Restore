@interface NSPredicate(SQLitePredicate)
- (uint64_t)hd_sqlPredicateForSelect;
@end

@implementation NSPredicate(SQLitePredicate)

- (uint64_t)hd_sqlPredicateForSelect
{
  return 0;
}

@end