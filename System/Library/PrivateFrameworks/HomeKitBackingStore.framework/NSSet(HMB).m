@interface NSSet(HMB)
- (id)hmbDescription;
@end

@implementation NSSet(HMB)

- (id)hmbDescription
{
  v2 = (void *)[@"{" mutableCopy];
  v3 = [a1 allObjects];
  v4 = [v3 componentsJoinedByString:@","];
  [v2 appendString:v4];

  [v2 appendString:@"}"];
  v5 = (void *)[v2 copy];

  return v5;
}

@end