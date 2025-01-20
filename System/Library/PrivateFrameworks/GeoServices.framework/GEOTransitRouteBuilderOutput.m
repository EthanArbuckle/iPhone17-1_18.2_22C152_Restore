@interface GEOTransitRouteBuilderOutput
- (BOOL)isWalkingOnlyRoute;
- (NSArray)rideSelections;
- (NSArray)sectionOptions;
- (void)setIsWalkingOnlyRoute:(BOOL)a3;
- (void)setRideSelections:(id)a3;
- (void)setSectionOptions:(id)a3;
@end

@implementation GEOTransitRouteBuilderOutput

- (void)setIsWalkingOnlyRoute:(BOOL)a3
{
  self->_isWalkingOnlyRoute = a3;
}

- (void)setRideSelections:(id)a3
{
}

- (void)setSectionOptions:(id)a3
{
}

- (BOOL)isWalkingOnlyRoute
{
  return self->_isWalkingOnlyRoute;
}

- (NSArray)rideSelections
{
  return self->_rideSelections;
}

- (NSArray)sectionOptions
{
  return self->_sectionOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionOptions, 0);

  objc_storeStrong((id *)&self->_rideSelections, 0);
}

@end