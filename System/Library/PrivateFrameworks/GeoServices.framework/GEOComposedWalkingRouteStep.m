@interface GEOComposedWalkingRouteStep
- (GEOComposedWalkingRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 stepIndex:(unint64_t)a6 pointRange:(_NSRange)a7 maneuverPointRange:(_NSRange)a8;
- (GEOComposedWalkingRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 stepIndex:(unint64_t)a6 startRouteCoordinate:(id)a7 endRouteCoordinate:(id)a8 maneuverStartRouteCoordinate:(id)a9;
@end

@implementation GEOComposedWalkingRouteStep

- (GEOComposedWalkingRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 stepIndex:(unint64_t)a6 startRouteCoordinate:(id)a7 endRouteCoordinate:(id)a8 maneuverStartRouteCoordinate:(id)a9
{
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedWalkingRouteStep;
  return [(GEOComposedRouteStep *)&v10 initWithComposedRoute:a3 geoRouteLeg:a4 geoStep:a5 routeSegmentType:2 stepIndex:a6 startRouteCoordinate:a7 endRouteCoordinate:a8 maneuverStartRouteCoordinate:a9];
}

- (GEOComposedWalkingRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 stepIndex:(unint64_t)a6 pointRange:(_NSRange)a7 maneuverPointRange:(_NSRange)a8
{
  v9.receiver = self;
  v9.super_class = (Class)GEOComposedWalkingRouteStep;
  return -[GEOComposedRouteStep initWithComposedRoute:geoRouteLeg:geoStep:routeSegmentType:stepIndex:pointRange:maneuverPointRange:](&v9, sel_initWithComposedRoute_geoRouteLeg_geoStep_routeSegmentType_stepIndex_pointRange_maneuverPointRange_, a3, a4, a5, 2, a6, a7.location, a7.length, a8.location, a8.length);
}

@end