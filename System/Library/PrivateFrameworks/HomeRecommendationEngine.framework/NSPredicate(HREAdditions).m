@interface NSPredicate(HREAdditions)
- (uint64_t)isEqualToPredicate:()HREAdditions;
@end

@implementation NSPredicate(HREAdditions)

- (uint64_t)isEqualToPredicate:()HREAdditions
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  v4 = [v3 predicateFormat];
  v5 = [v3 predicateFormat];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

@end