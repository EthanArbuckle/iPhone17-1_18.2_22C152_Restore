@interface GEOComposedWaypointToRoute
- (id)shortDescription;
@end

@implementation GEOComposedWaypointToRoute

- (id)shortDescription
{
  uint64_t v3 = objc_opt_class();
  v4 = [(GEOComposedWaypointToRoute *)self name];
  v5 = +[NSString stringWithFormat:@"<%@:%p, name: %@>", v3, self, v4];

  return v5;
}

@end