@interface NSSet(GEOFunctionalExtras)
- (id)_geo_filtered:()GEOFunctionalExtras;
@end

@implementation NSSet(GEOFunctionalExtras)

- (id)_geo_filtered:()GEOFunctionalExtras
{
  id v4 = a3;
  if ([a1 count])
  {
    v5 = (void *)MEMORY[0x1E4F28F60];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__NSSet_GEOFunctionalExtras___geo_filtered___block_invoke;
    v9[3] = &unk_1E53E16A0;
    id v10 = v4;
    v6 = [v5 predicateWithBlock:v9];
    v7 = [a1 filteredSetUsingPredicate:v6];
  }
  else
  {
    v7 = objc_opt_new();
  }

  return v7;
}

@end