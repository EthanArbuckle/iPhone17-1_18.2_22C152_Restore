@interface GEOComposedRouteLeg
+ (BOOL)supportsSecureCoding;
- ($212C09783140BCCD23384160D545CE0D)endRouteCoordinate;
- ($212C09783140BCCD23384160D545CE0D)startRouteCoordinate;
- (GEOArrivalParameters)arrivalParameters;
- (GEOComposedRoute)route;
- (GEOComposedRouteEVChargingStationInfo)chargingStationInfo;
- (GEOComposedRouteLeg)initWithCoder:(id)a3;
- (GEOComposedRouteLeg)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 legIndex:(unint64_t)a5 origin:(id)a6 destination:(id)a7 arrivalParameters:(id)a8;
- (GEOComposedRouteLeg)initWithComposedRoute:(id)a3 legIndex:(unint64_t)a4 origin:(id)a5 destination:(id)a6 arrivalParameters:(id)a7;
- (GEOComposedRouteLeg)nextLeg;
- (GEOComposedString)destinationListInstruction;
- (GEOComposedString)originListInstruction;
- (GEOComposedWaypoint)destination;
- (GEOComposedWaypoint)origin;
- (GEOComposedWaypointDisplayInfo)destinationDisplayInfo;
- (GEOComposedWaypointDisplayInfo)originDisplayInfo;
- (GEOWaypointInfo)geoDestinationWaypointInfo;
- (GEOWaypointInfo)geoOriginWaypointInfo;
- (NSArray)destinationListSecondaryInstructions;
- (NSArray)originListSecondaryInstructions;
- (NSArray)segments;
- (NSData)serverLegIDForAnalytics;
- (_NSRange)pointRange;
- (_NSRange)segmentRange;
- (_NSRange)stepRange;
- (double)chargingDuration;
- (double)distance;
- (double)travelDuration;
- (id)description;
- (int)drivingSide;
- (unint64_t)endStepIndex;
- (unint64_t)legIndex;
- (unint64_t)pointCount;
- (unint64_t)startStepIndex;
- (unint64_t)stepCount;
- (unsigned)endPointIndex;
- (unsigned)startPointIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setDestination:(id)a3;
- (void)setDistance:(double)a3;
- (void)setOrigin:(id)a3;
- (void)setPointRange:(_NSRange)a3;
- (void)setRoute:(id)a3;
- (void)setSegmentRange:(_NSRange)a3;
- (void)setServerLegIDForAnalytics:(id)a3;
- (void)setStepRange:(_NSRange)a3;
@end

@implementation GEOComposedRouteLeg

- (GEOComposedRouteLeg)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 legIndex:(unint64_t)a5 origin:(id)a6 destination:(id)a7 arrivalParameters:(id)a8
{
  id v14 = a4;
  v15 = [(GEOComposedRouteLeg *)self initWithComposedRoute:a3 legIndex:a5 origin:a6 destination:a7 arrivalParameters:a8];
  if (v15)
  {
    v15->_drivingSide = [v14 drivingSide];
    uint64_t v16 = [v14 originWaypointInfo];
    geoOriginWaypointInfo = v15->_geoOriginWaypointInfo;
    v15->_geoOriginWaypointInfo = (GEOWaypointInfo *)v16;

    uint64_t v18 = [v14 destinationWaypointInfo];
    geoDestinationWaypointInfo = v15->_geoDestinationWaypointInfo;
    v15->_geoDestinationWaypointInfo = (GEOWaypointInfo *)v18;

    uint64_t v20 = [v14 routeID];
    serverLegIDForAnalytics = v15->_serverLegIDForAnalytics;
    v15->_serverLegIDForAnalytics = (NSData *)v20;

    v22 = [GEOComposedString alloc];
    v23 = [v14 originListInstruction];
    v24 = -[GEODrivingWalkingInstruction title](v23);
    uint64_t v25 = [(GEOComposedString *)v22 initWithGeoFormattedString:v24];
    originListInstruction = v15->_originListInstruction;
    v15->_originListInstruction = (GEOComposedString *)v25;

    v27 = [v14 originListInstruction];
    v28 = -[GEODrivingWalkingInstruction normalCommands](v27);
    uint64_t v29 = objc_msgSend(v28, "_geo_compactMap:", &__block_literal_global_101);
    originListSecondaryInstructions = v15->_originListSecondaryInstructions;
    v15->_originListSecondaryInstructions = (NSArray *)v29;

    v31 = [GEOComposedString alloc];
    v32 = [v14 destinationListInstruction];
    v33 = -[GEODrivingWalkingInstruction title](v32);
    uint64_t v34 = [(GEOComposedString *)v31 initWithGeoFormattedString:v33];
    destinationListInstruction = v15->_destinationListInstruction;
    v15->_destinationListInstruction = (GEOComposedString *)v34;

    v36 = [v14 destinationListInstruction];
    v37 = -[GEODrivingWalkingInstruction normalCommands](v36);
    uint64_t v38 = objc_msgSend(v37, "_geo_compactMap:", &__block_literal_global_2);
    destinationListSecondaryInstructions = v15->_destinationListSecondaryInstructions;
    v15->_destinationListSecondaryInstructions = (NSArray *)v38;

    v40 = v15;
  }

  return v15;
}

GEOComposedString *__103__GEOComposedRouteLeg_initWithComposedRoute_geoRouteLeg_legIndex_origin_destination_arrivalParameters___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GEOComposedString alloc] initWithGeoFormattedString:v2];

  return v3;
}

GEOComposedString *__103__GEOComposedRouteLeg_initWithComposedRoute_geoRouteLeg_legIndex_origin_destination_arrivalParameters___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GEOComposedString alloc] initWithGeoFormattedString:v2];

  return v3;
}

- (GEOComposedRouteLeg)initWithComposedRoute:(id)a3 legIndex:(unint64_t)a4 origin:(id)a5 destination:(id)a6 arrivalParameters:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)GEOComposedRouteLeg;
  uint64_t v16 = [(GEOComposedRouteLeg *)&v20 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_route, v12);
    v17->_legIndex = a4;
    objc_storeStrong((id *)&v17->_origin, a5);
    objc_storeStrong((id *)&v17->_destination, a6);
    objc_storeStrong((id *)&v17->_arrivalParameters, a7);
    uint64_t v18 = v17;
  }

  return v17;
}

- (GEOComposedRouteLeg)nextLeg
{
  unint64_t v3 = self->_legIndex + 1;
  p_route = &self->_route;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_route);
  v6 = [WeakRetained legs];
  if (v3 >= [v6 count])
  {
    v9 = 0;
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)p_route);
    v8 = [v7 legs];
    v9 = [v8 objectAtIndexedSubscript:self->_legIndex + 1];
  }

  return (GEOComposedRouteLeg *)v9;
}

- (double)travelDuration
{
  unint64_t v3 = [(GEOComposedRouteLeg *)self startStepIndex];
  for (double i = 0.0; v3 <= [(GEOComposedRouteLeg *)self endStepIndex]; ++v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_route);
    v6 = [WeakRetained steps];
    id v7 = [v6 objectAtIndexedSubscript:v3];

    double i = i + (double)[v7 duration];
  }
  return i;
}

- (unsigned)startPointIndex
{
  return self->_pointRange.location;
}

- ($212C09783140BCCD23384160D545CE0D)startRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)[(GEOComposedRouteLeg *)self startPointIndex];
}

- (unsigned)endPointIndex
{
  return LODWORD(self->_pointRange.length) + LODWORD(self->_pointRange.location) - 1;
}

- ($212C09783140BCCD23384160D545CE0D)endRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)[(GEOComposedRouteLeg *)self endPointIndex];
}

- (unint64_t)pointCount
{
  return self->_pointRange.length;
}

- (unint64_t)startStepIndex
{
  return self->_stepRange.location;
}

- (unint64_t)endStepIndex
{
  return self->_stepRange.location + self->_stepRange.length - 1;
}

- (unint64_t)stepCount
{
  return self->_stepRange.length;
}

- (NSArray)segments
{
  NSUInteger v3 = self->_segmentRange.length + self->_segmentRange.location;
  p_route = &self->_route;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_route);
  v6 = [WeakRetained segments];
  unint64_t v7 = [v6 count];

  if (v3 > v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: NSMaxRange(_segmentRange) <= _route.segments.count", v12, 2u);
    }
    v10 = 0;
  }
  else
  {
    id v8 = objc_loadWeakRetained((id *)p_route);
    v9 = [v8 segments];
    v10 = objc_msgSend(v9, "subarrayWithRange:", self->_segmentRange.location, self->_segmentRange.length);
  }

  return (NSArray *)v10;
}

- (void)setServerLegIDForAnalytics:(id)a3
{
}

- (GEOComposedRouteEVChargingStationInfo)chargingStationInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_route);
  v4 = [WeakRetained mutableData];
  v5 = objc_msgSend(v4, "chargingStationInfoForLegIndex:", -[GEOComposedRouteLeg legIndex](self, "legIndex"));

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [(GEOComposedWaypoint *)self->_destination chargingInfo];
  }
  unint64_t v7 = v6;

  return (GEOComposedRouteEVChargingStationInfo *)v7;
}

- (GEOComposedWaypointDisplayInfo)originDisplayInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_route);
  v4 = [WeakRetained mutableData];
  v5 = objc_msgSend(v4, "originDisplayInfoForLeg:", -[GEOComposedRouteLeg legIndex](self, "legIndex"));

  return (GEOComposedWaypointDisplayInfo *)v5;
}

- (GEOComposedWaypointDisplayInfo)destinationDisplayInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_route);
  v4 = [WeakRetained mutableData];
  v5 = objc_msgSend(v4, "destinationDisplayInfoForLeg:", -[GEOComposedRouteLeg legIndex](self, "legIndex"));

  return (GEOComposedWaypointDisplayInfo *)v5;
}

- (double)chargingDuration
{
  id v2 = [(GEOComposedRouteLeg *)self chargingStationInfo];
  [v2 chargingTime];
  double v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteLeg)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)GEOComposedRouteLeg;
  v5 = [(GEOComposedRouteLeg *)&v39 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_origin"];
    origin = v5->_origin;
    v5->_origin = (GEOComposedWaypoint *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_destination"];
    destination = v5->_destination;
    v5->_destination = (GEOComposedWaypoint *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originListInstruction"];
    originListInstruction = v5->_originListInstruction;
    v5->_originListInstruction = (GEOComposedString *)v10;

    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_originListSecondaryInstructions"];
    originListSecondaryInstructions = v5->_originListSecondaryInstructions;
    v5->_originListSecondaryInstructions = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_destinationListInstruction"];
    destinationListInstruction = v5->_destinationListInstruction;
    v5->_destinationListInstruction = (GEOComposedString *)v14;

    uint64_t v16 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_destinationListSecondaryInstructions"];
    destinationListSecondaryInstructions = v5->_destinationListSecondaryInstructions;
    v5->_destinationListSecondaryInstructions = (NSArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_arrivalParameters"];
    arrivalParameters = v5->_arrivalParameters;
    v5->_arrivalParameters = (GEOArrivalParameters *)v18;

    unint64_t v38 = 0;
    id v20 = v4;
    v21 = (const void *)[v20 decodeBytesForKey:@"_pointRange" returnedLength:&v38];
    if (v38 && v21)
    {
      if (v38 >= 0x10) {
        size_t v22 = 16;
      }
      else {
        size_t v22 = v38;
      }
      memcpy(&v5->_pointRange, v21, v22);
    }
    unint64_t v38 = 0;
    id v23 = v20;
    v24 = (const void *)[v23 decodeBytesForKey:@"_stepRange" returnedLength:&v38];
    if (v38 && v24)
    {
      if (v38 >= 0x10) {
        size_t v25 = 16;
      }
      else {
        size_t v25 = v38;
      }
      memcpy(&v5->_stepRange, v24, v25);
    }
    unint64_t v38 = 0;
    id v26 = v23;
    v27 = (const void *)[v26 decodeBytesForKey:@"_segmentRange" returnedLength:&v38];
    if (v38 && v27)
    {
      if (v38 >= 0x10) {
        size_t v28 = 16;
      }
      else {
        size_t v28 = v38;
      }
      memcpy(&v5->_segmentRange, v27, v28);
    }
    v5->_legIndex = [v26 decodeIntegerForKey:@"_legIndex"];
    [v26 decodeDoubleForKey:@"_distance"];
    v5->_distance = v29;
    v5->_drivingSide = [v26 decodeIntegerForKey:@"_drivingSide"];
    uint64_t v30 = [v26 decodeObjectOfClass:objc_opt_class() forKey:@"_geoOriginWaypointInfo"];
    geoOriginWaypointInfo = v5->_geoOriginWaypointInfo;
    v5->_geoOriginWaypointInfo = (GEOWaypointInfo *)v30;

    uint64_t v32 = [v26 decodeObjectOfClass:objc_opt_class() forKey:@"_geoDestinationWaypointInfo"];
    geoDestinationWaypointInfo = v5->_geoDestinationWaypointInfo;
    v5->_geoDestinationWaypointInfo = (GEOWaypointInfo *)v32;

    uint64_t v34 = [v26 decodeObjectOfClass:objc_opt_class() forKey:@"_serverLegIDForAnalytics"];
    serverLegIDForAnalytics = v5->_serverLegIDForAnalytics;
    v5->_serverLegIDForAnalytics = (NSData *)v34;

    v36 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  origin = self->_origin;
  id v5 = a3;
  [v5 encodeObject:origin forKey:@"_origin"];
  [v5 encodeObject:self->_destination forKey:@"_destination"];
  [v5 encodeObject:self->_originListInstruction forKey:@"_originListInstruction"];
  [v5 encodeObject:self->_originListSecondaryInstructions forKey:@"_originListSecondaryInstructions"];
  [v5 encodeObject:self->_destinationListInstruction forKey:@"_destinationListInstruction"];
  [v5 encodeObject:self->_destinationListSecondaryInstructions forKey:@"_destinationListSecondaryInstructions"];
  [v5 encodeObject:self->_arrivalParameters forKey:@"_arrivalParameters"];
  [v5 encodeBytes:&self->_pointRange length:16 forKey:@"_pointRange"];
  [v5 encodeBytes:&self->_stepRange length:16 forKey:@"_stepRange"];
  [v5 encodeBytes:&self->_segmentRange length:16 forKey:@"_segmentRange"];
  [v5 encodeInteger:self->_legIndex forKey:@"_legIndex"];
  [v5 encodeDouble:@"_distance" forKey:self->_distance];
  [v5 encodeInteger:self->_drivingSide forKey:@"_drivingSide"];
  [v5 encodeObject:self->_geoOriginWaypointInfo forKey:@"_geoOriginWaypointInfo"];
  [v5 encodeObject:self->_geoDestinationWaypointInfo forKey:@"_geoDestinationWaypointInfo"];
  [v5 encodeObject:self->_serverLegIDForAnalytics forKey:@"_serverLegIDForAnalytics"];
}

- (id)description
{
  double v3 = NSString;
  unint64_t v4 = [(GEOComposedRouteLeg *)self legIndex];
  unint64_t v5 = [(GEOComposedRouteLeg *)self startStepIndex];
  unint64_t v6 = [(GEOComposedRouteLeg *)self endStepIndex];
  $212C09783140BCCD23384160D545CE0D v7 = [(GEOComposedRouteLeg *)self startRouteCoordinate];
  v9 = GEOPolylineCoordinateAsString(*(void *)&v7, 1, 0, v8);
  $212C09783140BCCD23384160D545CE0D v10 = [(GEOComposedRouteLeg *)self endRouteCoordinate];
  uint64_t v12 = GEOPolylineCoordinateAsString(*(void *)&v10, 1, 0, v11);
  id v13 = [v3 stringWithFormat:@"Leg %d | Steps %d-%d, [%@ - %@]", v4, v5, v6, v9, v12];

  return v13;
}

- (GEOComposedRoute)route
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_route);

  return (GEOComposedRoute *)WeakRetained;
}

- (void)setRoute:(id)a3
{
}

- (unint64_t)legIndex
{
  return self->_legIndex;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (_NSRange)pointRange
{
  NSUInteger length = self->_pointRange.length;
  NSUInteger location = self->_pointRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setPointRange:(_NSRange)a3
{
  self->_pointRange = a3;
}

- (_NSRange)stepRange
{
  NSUInteger length = self->_stepRange.length;
  NSUInteger location = self->_stepRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setStepRange:(_NSRange)a3
{
  self->_stepRange = a3;
}

- (_NSRange)segmentRange
{
  NSUInteger length = self->_segmentRange.length;
  NSUInteger location = self->_segmentRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSegmentRange:(_NSRange)a3
{
  self->_segmentRange = a3;
}

- (GEOComposedWaypoint)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
}

- (GEOComposedWaypoint)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (GEOArrivalParameters)arrivalParameters
{
  return self->_arrivalParameters;
}

- (GEOComposedString)originListInstruction
{
  return self->_originListInstruction;
}

- (NSArray)originListSecondaryInstructions
{
  return self->_originListSecondaryInstructions;
}

- (GEOComposedString)destinationListInstruction
{
  return self->_destinationListInstruction;
}

- (NSArray)destinationListSecondaryInstructions
{
  return self->_destinationListSecondaryInstructions;
}

- (int)drivingSide
{
  return self->_drivingSide;
}

- (GEOWaypointInfo)geoOriginWaypointInfo
{
  return self->_geoOriginWaypointInfo;
}

- (GEOWaypointInfo)geoDestinationWaypointInfo
{
  return self->_geoDestinationWaypointInfo;
}

- (NSData)serverLegIDForAnalytics
{
  return self->_serverLegIDForAnalytics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverLegIDForAnalytics, 0);
  objc_storeStrong((id *)&self->_geoDestinationWaypointInfo, 0);
  objc_storeStrong((id *)&self->_geoOriginWaypointInfo, 0);
  objc_storeStrong((id *)&self->_destinationListSecondaryInstructions, 0);
  objc_storeStrong((id *)&self->_destinationListInstruction, 0);
  objc_storeStrong((id *)&self->_originListSecondaryInstructions, 0);
  objc_storeStrong((id *)&self->_originListInstruction, 0);
  objc_storeStrong((id *)&self->_arrivalParameters, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_origin, 0);

  objc_destroyWeak((id *)&self->_route);
}

@end