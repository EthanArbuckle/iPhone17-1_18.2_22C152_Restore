@interface GEOComposedDrivingRouteStep
+ (BOOL)supportsSecureCoding;
- (GEOComposedDrivingRouteStep)initWithCoder:(id)a3;
- (GEOComposedDrivingRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 stepIndex:(unint64_t)a6 pointRange:(_NSRange)a7 maneuverPointRange:(_NSRange)a8;
- (GEOComposedDrivingRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 stepIndex:(unint64_t)a6 startRouteCoordinate:(id)a7 endRouteCoordinate:(id)a8 maneuverStartRouteCoordinate:(id)a9;
- (id)description;
- (id)evInfo;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedDrivingRouteStep

- (GEOComposedDrivingRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 stepIndex:(unint64_t)a6 startRouteCoordinate:(id)a7 endRouteCoordinate:(id)a8 maneuverStartRouteCoordinate:(id)a9
{
  id v15 = a5;
  v24.receiver = self;
  v24.super_class = (Class)GEOComposedDrivingRouteStep;
  v16 = [(GEOComposedRouteStep *)&v24 initWithComposedRoute:a3 geoRouteLeg:a4 geoStep:v15 routeSegmentType:1 stepIndex:a6 startRouteCoordinate:a7 endRouteCoordinate:a8 maneuverStartRouteCoordinate:a9];
  if (v16)
  {
    v17 = [v15 evStateInfo];

    if (v17)
    {
      v18 = [GEOComposedRouteEVStepInfo alloc];
      v19 = [v15 evStateInfo];
      uint64_t v20 = [(GEOComposedRouteEVStepInfo *)v18 initWithEVStateInfo:v19];
      evInfo = v16->_evInfo;
      v16->_evInfo = (GEOComposedRouteEVStepInfo *)v20;
    }
    v22 = v16;
  }

  return v16;
}

- (GEOComposedDrivingRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 stepIndex:(unint64_t)a6 pointRange:(_NSRange)a7 maneuverPointRange:(_NSRange)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v14 = a5;
  v23.receiver = self;
  v23.super_class = (Class)GEOComposedDrivingRouteStep;
  id v15 = -[GEOComposedRouteStep initWithComposedRoute:geoRouteLeg:geoStep:routeSegmentType:stepIndex:pointRange:maneuverPointRange:](&v23, sel_initWithComposedRoute_geoRouteLeg_geoStep_routeSegmentType_stepIndex_pointRange_maneuverPointRange_, a3, a4, v14, 1, a6, location, length, a8.location, a8.length);
  if (v15)
  {
    v16 = [v14 evStateInfo];

    if (v16)
    {
      v17 = [GEOComposedRouteEVStepInfo alloc];
      v18 = [v14 evStateInfo];
      uint64_t v19 = [(GEOComposedRouteEVStepInfo *)v17 initWithEVStateInfo:v18];
      evInfo = v15->_evInfo;
      v15->_evInfo = (GEOComposedRouteEVStepInfo *)v19;
    }
    v21 = v15;
  }

  return v15;
}

- (id)evInfo
{
  v3 = [(GEOComposedRouteStep *)self composedRoute];
  v4 = [v3 mutableData];
  objc_msgSend(v4, "evInfoForStepID:", -[GEOComposedRouteStep stepID](self, "stepID"));
  v5 = (GEOComposedRouteEVStepInfo *)objc_claimAutoreleasedReturnValue();

  evInfo = v5;
  if (!v5) {
    evInfo = self->_evInfo;
  }
  v7 = evInfo;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedDrivingRouteStep)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedDrivingRouteStep;
  v5 = [(GEOComposedRouteStep *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_evInfo"];
    evInfo = v5->_evInfo;
    v5->_evInfo = (GEOComposedRouteEVStepInfo *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedDrivingRouteStep;
  id v4 = a3;
  [(GEOComposedRouteStep *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_evInfo, @"_evInfo", v5.receiver, v5.super_class);
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)GEOComposedDrivingRouteStep;
  id v4 = [(GEOComposedRouteStep *)&v7 description];
  objc_super v5 = [v3 stringWithFormat:@"%@", v4];

  if (self->_evInfo) {
    [v5 appendFormat:@" | %@", self->_evInfo];
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end