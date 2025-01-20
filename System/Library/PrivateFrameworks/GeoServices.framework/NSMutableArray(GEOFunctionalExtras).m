@interface NSMutableArray(GEOFunctionalExtras)
- (void)_geo_filter:()GEOFunctionalExtras;
@end

@implementation NSMutableArray(GEOFunctionalExtras)

- (void)_geo_filter:()GEOFunctionalExtras
{
  id v4 = a3;
  if ([a1 count])
  {
    v5 = (void *)MEMORY[0x1E4F28F60];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__NSMutableArray_GEOFunctionalExtras___geo_filter___block_invoke;
    v7[3] = &unk_1E53E16A0;
    id v8 = v4;
    v6 = [v5 predicateWithBlock:v7];
    [a1 filterUsingPredicate:v6];
  }
}

@end