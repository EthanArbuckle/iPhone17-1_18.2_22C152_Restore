@interface GEOComposedBicycleRouteStep
- (GEOComposedBicycleRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 stepIndex:(unint64_t)a6 pointRange:(_NSRange)a7 maneuverPointRange:(_NSRange)a8;
- (GEOComposedBicycleRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 stepIndex:(unint64_t)a6 startRouteCoordinate:(id)a7 endRouteCoordinate:(id)a8 maneuverStartRouteCoordinate:(id)a9;
@end

@implementation GEOComposedBicycleRouteStep

- (GEOComposedBicycleRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 stepIndex:(unint64_t)a6 startRouteCoordinate:(id)a7 endRouteCoordinate:(id)a8 maneuverStartRouteCoordinate:(id)a9
{
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedBicycleRouteStep;
  return [(GEOComposedRouteStep *)&v10 initWithComposedRoute:a3 geoRouteLeg:a4 geoStep:a5 routeSegmentType:4 stepIndex:a6 startRouteCoordinate:a7 endRouteCoordinate:a8 maneuverStartRouteCoordinate:a9];
}

- (GEOComposedBicycleRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 stepIndex:(unint64_t)a6 pointRange:(_NSRange)a7 maneuverPointRange:(_NSRange)a8
{
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedBicycleRouteStep;
  v8 = -[GEOComposedRouteStep initWithComposedRoute:geoRouteLeg:geoStep:routeSegmentType:stepIndex:pointRange:maneuverPointRange:](&v12, sel_initWithComposedRoute_geoRouteLeg_geoStep_routeSegmentType_stepIndex_pointRange_maneuverPointRange_, a3, a4, a5, 4, a6, a7.location, a7.length, a8.location, a8.length);
  v9 = v8;
  if (v8) {
    objc_super v10 = v8;
  }

  return v9;
}

@end