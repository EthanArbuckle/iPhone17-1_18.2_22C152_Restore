@interface GEOCompanionRouteDetails
- (BOOL)isTransitRoute;
@end

@implementation GEOCompanionRouteDetails

- (BOOL)isTransitRoute
{
  return [(GEOCompanionRouteDetails *)self hasOriginalSuggestedRoute];
}

@end