@interface NSMutableArray(GEOComposedRouteStepInternal)
- (uint64_t)_transit_hasAnyFieldSet;
- (void)_transit_mergeFrom:()GEOComposedRouteStepInternal;
@end

@implementation NSMutableArray(GEOComposedRouteStepInternal)

- (uint64_t)_transit_hasAnyFieldSet
{
  return 1;
}

- (void)_transit_mergeFrom:()GEOComposedRouteStepInternal
{
  id v4 = a3;
  [a1 removeAllObjects];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a1 addObjectsFromArray:v4];
  }
}

@end