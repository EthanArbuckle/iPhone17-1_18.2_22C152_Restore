@interface GEOComposedWaypointToRoute(Logging)
- (id)shortDescription;
@end

@implementation GEOComposedWaypointToRoute(Logging)

- (id)shortDescription
{
  v2 = NSString;
  uint64_t v3 = objc_opt_class();
  v4 = [a1 name];
  v5 = [v2 stringWithFormat:@"<%@:%p, name: %@>", v3, a1, v4];

  return v5;
}

@end