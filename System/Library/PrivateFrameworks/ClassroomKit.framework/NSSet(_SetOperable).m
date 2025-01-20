@interface NSSet(_SetOperable)
- (id)setByIntersectingSet:()_SetOperable;
- (id)setBySubtractingSet:()_SetOperable;
@end

@implementation NSSet(_SetOperable)

- (id)setBySubtractingSet:()_SetOperable
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    [v5 minusSet:v6];
  }
  else
  {
    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = [v6 allObjects];

    v11 = [v9 setWithArray:v10];
    [v5 minusSet:v11];

    id v8 = (id)v10;
  }

  v12 = (void *)[v5 copy];

  return v12;
}

- (id)setByIntersectingSet:()_SetOperable
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    [v5 intersectSet:v6];
  }
  else
  {
    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = [v6 allObjects];

    v11 = [v9 setWithArray:v10];
    [v5 intersectSet:v11];

    id v8 = (id)v10;
  }

  v12 = (void *)[v5 copy];

  return v12;
}

@end