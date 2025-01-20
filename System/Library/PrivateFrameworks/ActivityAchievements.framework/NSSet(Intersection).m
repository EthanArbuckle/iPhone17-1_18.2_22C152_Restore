@interface NSSet(Intersection)
- (id)intersectSet:()Intersection;
@end

@implementation NSSet(Intersection)

- (id)intersectSet:()Intersection
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 intersectSet:v4];

  v6 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithSet:v5];

  return v6;
}

@end