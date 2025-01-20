@interface GEOComposedTransitTripRouteStep
+ (BOOL)supportsSecureCoding;
- (BOOL)canPreloadTilesForThisStep;
- (BOOL)hasDuration;
- (BOOL)isBus;
- (BOOL)isRail;
- (GEOComposedTransitTripRouteStep)initWithCoder:(id)a3;
- (GEOComposedTransitTripRouteStep)initWithComposedRoute:(id)a3 decoderData:(id)a4 step:(id)a5 stepIndex:(unint64_t)a6 duration:(unsigned int)a7 pointRange:(_NSRange)a8;
- (GEOComposedTransitTripRouteStep)initWithComposedRoute:(id)a3 routeSegmentType:(int64_t)a4 stepIndex:(unint64_t)a5 pointRange:(_NSRange)a6 line:(id)a7 maneuverType:(int)a8 significance:(int)a9;
- (GEOTransitBoardingInfo)boardingInfo;
- (GEOTransitLine)transitLine;
- (GEOTransitSystem)transitSystem;
- (GEOTransitVehicleInfo)transitVehicle;
- (NSArray)arrivalTimes;
- (NSArray)arrivalTimesAtOrigin;
- (NSArray)departureTimes;
- (NSArray)routeLineArtwork;
- (NSDate)arrivalTime;
- (NSDate)arrivalTimeAtOrigin;
- (NSDate)departureTime;
- (NSTimeZone)arrivalTimeZone;
- (NSTimeZone)departureTimeZone;
- (double)departureTimeIntervalMax;
- (double)departureTimeIntervalMin;
- (id)description;
- (unsigned)duration;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedTransitTripRouteStep

- (GEOComposedTransitTripRouteStep)initWithComposedRoute:(id)a3 decoderData:(id)a4 step:(id)a5 stepIndex:(unint64_t)a6 duration:(unsigned int)a7 pointRange:(_NSRange)a8
{
  uint64_t v8 = *(void *)&a7;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  v77.receiver = self;
  v77.super_class = (Class)GEOComposedTransitTripRouteStep;
  v15 = -[GEOComposedTransitRouteStep initWithComposedRoute:decoderData:routeSegmentType:step:stepIndex:duration:pointRange:](&v77, sel_initWithComposedRoute_decoderData_routeSegmentType_step_stepIndex_duration_pointRange_, a3, v13, 6, v14, a6, v8, a8.location, a8.length);
  if (v15)
  {
    if ([v14 hasStartingStopIndex])
    {
      unsigned int v16 = [v14 startingStopIndex];
      if ([v13 stopsCount] > (unint64_t)v16)
      {
        v17 = [v13 stops];
        uint64_t v18 = objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v14, "startingStopIndex"));
        originStop = v15->super._originStop;
        v15->super._originStop = (GEOPBTransitStop *)v18;
      }
    }
    if ([v14 hasEndingStopIndex])
    {
      unsigned int v20 = [v14 endingStopIndex];
      if ([v13 stopsCount] > (unint64_t)v20)
      {
        v21 = [v13 stops];
        uint64_t v22 = objc_msgSend(v21, "objectAtIndex:", objc_msgSend(v14, "endingStopIndex"));
        destinationStop = v15->super._destinationStop;
        v15->super._destinationStop = (GEOPBTransitStop *)v22;
      }
    }
    v24 = [v14 vehicleInfos];
    v25 = [v24 firstObject];

    objc_storeStrong((id *)&v15->_transitVehicle, v25);
    if ([v25 hasDepartureFrequencyMin]) {
      v15->_departureTimeIntervalMin = (double)[v25 departureFrequencyMin];
    }
    if ([v25 hasDepartureFrequencyMax]) {
      v15->_departureTimeIntervalMax = (double)[v25 departureFrequencyMax];
    }
    if ([v14 vehicleInfosCount])
    {
      v69 = v25;
      id v71 = v13;
      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "vehicleInfosCount"));
      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "vehicleInfosCount"));
      v72 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "vehicleInfosCount"));
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v70 = v14;
      v28 = [v14 vehicleInfos];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v73 objects:v78 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v74;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v74 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v73 + 1) + 8 * i);
            if ([v33 hasDepartureTime])
            {
              v34 = [v33 departureTime];
              double v35 = (double)[v34 absTime];

              v36 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v35];
              [v27 addObject:v36];

              double v37 = (double)([(GEOTransitStep *)v15->super._transitStep startingTime] + v8);
              if (v37 > v35) {
                double v35 = (double)([(GEOTransitStep *)v15->super._transitStep startingTime]
              }
                             + v8);
              v38 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v35];
              [v72 addObject:v38];
            }
            if ([v33 hasArrivalTime])
            {
              v39 = [v33 arrivalTime];
              double v40 = (double)[v39 absTime];

              v41 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v40];
              [v26 addObject:v41];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v73 objects:v78 count:16];
        }
        while (v30);
      }

      uint64_t v42 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v26];
      arrivalTimesAtOrigin = v15->_arrivalTimesAtOrigin;
      v15->_arrivalTimesAtOrigin = (NSArray *)v42;

      uint64_t v44 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v27];
      departureTimes = v15->_departureTimes;
      v15->_departureTimes = (NSArray *)v44;

      uint64_t v46 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v72];
      arrivalTimes = v15->_arrivalTimes;
      v15->_arrivalTimes = (NSArray *)v46;

      id v14 = v70;
      id v13 = v71;
      v25 = v69;
    }
    if ([v25 hasLineIndex]
      && (unsigned int v48 = [v25 lineIndex], objc_msgSend(v13, "linesCount") > (unint64_t)v48))
    {
      v49 = objc_msgSend(v13, "lineAtIndex:", objc_msgSend(v25, "lineIndex"));
    }
    else
    {
      v49 = 0;
    }
    if ([v49 hasSystemIndex]
      && (unsigned int v50 = [v49 systemIndex], objc_msgSend(v13, "systemsCount") > (unint64_t)v50))
    {
      v51 = objc_msgSend(v13, "systemAtIndex:", objc_msgSend(v49, "systemIndex"));
      if (v51)
      {
        v52 = [[_GEOTransitSystem alloc] initWithSystem:v51];
        char v53 = 0;
        goto LABEL_37;
      }
    }
    else
    {
      v51 = 0;
    }
    v52 = 0;
    char v53 = 1;
LABEL_37:
    objc_storeStrong((id *)&v15->_transitSystem, v52);
    if ((v53 & 1) == 0) {

    }
    if (v49)
    {
      if ([v14 hasLocation])
      {
        v54 = [v14 location];
        [v54 coordinate];
        double v56 = v55;
        double v58 = v57;
      }
      else
      {
        double v58 = -180.0;
        double v56 = -180.0;
      }
      v60 = -[_GEOTransitLine initWithLine:system:locationHint:]([_GEOTransitLine alloc], "initWithLine:system:locationHint:", v49, v15->_transitSystem, v56, v58);
      transitLine = v15->_transitLine;
      v15->_transitLine = (GEOTransitLine *)v60;
    }
    else
    {
      transitLine = v15->_transitLine;
      v15->_transitLine = 0;
    }

    if ([v25 clusteredRouteLineArtworkIndexsCount])
    {
      uint64_t v61 = objc_msgSend(v13, "artworkFromIndices:count:", objc_msgSend(v25, "clusteredRouteLineArtworkIndexs"), objc_msgSend(v25, "clusteredRouteLineArtworkIndexsCount"));
      routeLineArtwork = v15->_routeLineArtwork;
      v15->_routeLineArtwork = (NSArray *)v61;
    }
    else
    {
      if (![v25 hasRouteLineArtworkIndex]) {
        goto LABEL_51;
      }
      unsigned int v63 = [v25 routeLineArtworkIndex];
      if ([v13 artworksCount] <= (unint64_t)v63) {
        goto LABEL_51;
      }
      v64 = [v13 artworks];
      routeLineArtwork = objc_msgSend(v64, "objectAtIndex:", objc_msgSend(v25, "routeLineArtworkIndex"));

      uint64_t v65 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", routeLineArtwork, 0);
      v66 = v15->_routeLineArtwork;
      v15->_routeLineArtwork = (NSArray *)v65;
    }
LABEL_51:
    v15->_isBus = [v49 guidanceSnappingType] == 1;
    v15->_isRail = [v49 guidanceSnappingType] == 2;
    v15->_canPreloadTiles = [v14 prioritizeTilesPreloading];
    v67 = v15;
  }
  return v15;
}

- (GEOComposedTransitTripRouteStep)initWithComposedRoute:(id)a3 routeSegmentType:(int64_t)a4 stepIndex:(unint64_t)a5 pointRange:(_NSRange)a6 line:(id)a7 maneuverType:(int)a8 significance:(int)a9
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v15 = a3;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)GEOComposedTransitTripRouteStep;
  v17 = -[GEOComposedRouteStep initWithComposedRoute:routeSegmentType:stepIndex:pointRange:](&v30, sel_initWithComposedRoute_routeSegmentType_stepIndex_pointRange_, v15, a4, a5, location, length);
  if (v17)
  {
    uint64_t v18 = [v15 stops];
    uint64_t v19 = [v18 objectAtIndexedSubscript:a5];
    originStop = v17->super._originStop;
    v17->super._originStop = (GEOPBTransitStop *)v19;

    v21 = [v15 stops];
    uint64_t v22 = [v21 objectAtIndexedSubscript:a5];
    destinationStop = v17->super._destinationStop;
    v17->super._destinationStop = (GEOPBTransitStop *)v22;

    v24 = objc_alloc_init(GEOTransitStep);
    transitStep = v17->super._transitStep;
    v17->super._transitStep = v24;

    [(GEOTransitStep *)v17->super._transitStep setManeuverType:a8];
    [(GEOTransitStep *)v17->super._transitStep setSignificanceForEndNode:a9];
    v26 = -[_GEOTransitLine initWithLine:system:locationHint:]([_GEOTransitLine alloc], "initWithLine:system:locationHint:", v16, 0, -180.0, -180.0);
    transitLine = v17->_transitLine;
    v17->_transitLine = (GEOTransitLine *)v26;

    v17->super._maneuver = a8;
    v28 = v17;
  }

  return v17;
}

- (NSTimeZone)departureTimeZone
{
  if ([(GEOPBTransitStop *)self->super._originStop hasTimezone])
  {
    v3 = (void *)MEMORY[0x1E4F1CAF0];
    v4 = [(GEOPBTransitStop *)self->super._originStop timezone];
    v5 = [v3 timeZoneWithName:v4];
  }
  else
  {
    v5 = 0;
  }

  return (NSTimeZone *)v5;
}

- (NSTimeZone)arrivalTimeZone
{
  if ([(GEOPBTransitStop *)self->super._destinationStop hasTimezone])
  {
    v3 = (void *)MEMORY[0x1E4F1CAF0];
    v4 = [(GEOPBTransitStop *)self->super._destinationStop timezone];
    v5 = [v3 timeZoneWithName:v4];
  }
  else
  {
    v5 = 0;
  }

  return (NSTimeZone *)v5;
}

- (NSDate)arrivalTimeAtOrigin
{
  v2 = [(NSArray *)self->_arrivalTimesAtOrigin firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = 0;
  }
  else {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

- (NSDate)departureTime
{
  v2 = [(NSArray *)self->_departureTimes firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = 0;
  }
  else {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

- (NSDate)arrivalTime
{
  v2 = [(NSArray *)self->_arrivalTimes firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = 0;
  }
  else {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

- (BOOL)hasDuration
{
  v3 = [(GEOComposedTransitTripRouteStep *)self arrivalTime];
  uint64_t v4 = [(GEOComposedTransitTripRouteStep *)self departureTime];
  v5 = (void *)v4;
  if (v3 && v4)
  {
    [v3 timeIntervalSinceDate:v4];
    unsigned __int8 v7 = v6 > 0.0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GEOComposedTransitTripRouteStep;
    unsigned __int8 v7 = [(GEOComposedTransitRouteStep *)&v9 hasDuration];
  }

  return v7;
}

- (unsigned)duration
{
  v3 = [(GEOComposedTransitTripRouteStep *)self arrivalTime];
  uint64_t v4 = [(GEOComposedTransitTripRouteStep *)self departureTime];
  v5 = (void *)v4;
  if (v3 && v4)
  {
    [v3 timeIntervalSinceDate:v4];
    if (v6 < 0.0) {
      NSLog(&cfstr_ArrivalTimeSho.isa);
    }
    [v3 timeIntervalSinceDate:v5];
    unsigned int v8 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOComposedTransitTripRouteStep;
    unsigned int v8 = [(GEOComposedTransitRouteStep *)&v10 duration];
  }

  return v8;
}

- (BOOL)canPreloadTilesForThisStep
{
  return self->_canPreloadTiles;
}

- (GEOTransitBoardingInfo)boardingInfo
{
  v2 = [(GEOComposedTransitRouteStep *)self transitStep];
  v3 = [v2 boardingInfo];

  return (GEOTransitBoardingInfo *)v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(GEOComposedTransitRouteStep *)self originStopIntermediateListName];
  v5 = (void *)v4;
  if (v4)
  {
    double v6 = [v3 stringWithFormat:@"%@", v4];
  }
  else
  {
    double v7 = NSNumber;
    unsigned int v8 = [(GEOComposedTransitRouteStep *)self originStop];
    objc_super v9 = objc_msgSend(v7, "numberWithUnsignedLongLong:", objc_msgSend(v8, "muid"));
    double v6 = [v3 stringWithFormat:@"%@", v9];
  }
  objc_super v10 = [(GEOComposedTransitRouteStep *)self originStop];
  v11 = [(GEOComposedTransitRouteStep *)self destinationStop];

  if (v10 != v11)
  {
    v12 = NSString;
    id v13 = [(GEOComposedTransitRouteStep *)self destinationStopIntermediateListName];
    id v14 = v13;
    if (!v13)
    {
      id v15 = NSNumber;
      v11 = [(GEOComposedTransitRouteStep *)self destinationStop];
      id v14 = objc_msgSend(v15, "numberWithUnsignedLongLong:", objc_msgSend(v11, "muid"));
    }
    uint64_t v16 = [v12 stringWithFormat:@"%@, %@", v6, v14];

    if (!v13)
    {
    }
    double v6 = (void *)v16;
  }
  v17 = [(GEOComposedTransitTripRouteStep *)self transitVehicle];
  int v18 = [v17 pickupDropoffType];

  if (v18 == 100) {
    uint64_t v19 = @" SKIPPED";
  }
  else {
    uint64_t v19 = &stru_1ED51F370;
  }
  unsigned int v20 = NSString;
  v24.receiver = self;
  v24.super_class = (Class)GEOComposedTransitTripRouteStep;
  v21 = [(GEOComposedTransitRouteStep *)&v24 description];
  uint64_t v22 = [v20 stringWithFormat:@"%@ | [%@]%@", v21, v6, v19];

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedTransitTripRouteStep)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GEOComposedTransitTripRouteStep;
  v5 = [(GEOComposedTransitRouteStep *)&v24 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_arrivalTimesAtOrigin"];
    arrivalTimesAtOrigin = v5->_arrivalTimesAtOrigin;
    v5->_arrivalTimesAtOrigin = (NSArray *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_departureTimes"];
    departureTimes = v5->_departureTimes;
    v5->_departureTimes = (NSArray *)v8;

    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_arrivalTimes"];
    arrivalTimes = v5->_arrivalTimes;
    v5->_arrivalTimes = (NSArray *)v10;

    [v4 decodeDoubleForKey:@"_departureTimeIntervalMin"];
    v5->_departureTimeIntervalMin = v12;
    [v4 decodeDoubleForKey:@"_departureTimeIntervalMax"];
    v5->_departureTimeIntervalMax = v13;
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_transitVehicle"];
    transitVehicle = v5->_transitVehicle;
    v5->_transitVehicle = (GEOTransitVehicleInfo *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_transitLine"];
    transitLine = v5->_transitLine;
    v5->_transitLine = (GEOTransitLine *)v16;

    uint64_t v18 = [(GEOTransitLine *)v5->_transitLine system];
    transitSystem = v5->_transitSystem;
    v5->_transitSystem = (GEOTransitSystem *)v18;

    uint64_t v20 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_routeLineArtwork"];
    routeLineArtwork = v5->_routeLineArtwork;
    v5->_routeLineArtwork = (NSArray *)v20;

    v5->_isRail = [v4 decodeBoolForKey:@"_isRail"];
    v5->_isBus = [v4 decodeBoolForKey:@"_isBus"];
    v5->_canPreloadTiles = [v4 decodeBoolForKey:@"_canPreloadTiles"];
    uint64_t v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTransitTripRouteStep;
  id v4 = a3;
  [(GEOComposedTransitRouteStep *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_arrivalTimesAtOrigin, @"_arrivalTimesAtOrigin", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_departureTimes forKey:@"_departureTimes"];
  [v4 encodeObject:self->_arrivalTimes forKey:@"_arrivalTimes"];
  [v4 encodeDouble:@"_departureTimeIntervalMin" forKey:self->_departureTimeIntervalMin];
  [v4 encodeDouble:@"_departureTimeIntervalMax" forKey:self->_departureTimeIntervalMax];
  [v4 encodeObject:self->_transitVehicle forKey:@"_transitVehicle"];
  [v4 encodeObject:self->_transitLine forKey:@"_transitLine"];
  [v4 encodeObject:self->_routeLineArtwork forKey:@"_routeLineArtwork"];
  [v4 encodeBool:self->_isRail forKey:@"_isRail"];
  [v4 encodeBool:self->_isBus forKey:@"_isBus"];
  [v4 encodeBool:self->_canPreloadTiles forKey:@"_canPreloadTiles"];
}

- (NSArray)arrivalTimesAtOrigin
{
  return self->_arrivalTimesAtOrigin;
}

- (NSArray)departureTimes
{
  return self->_departureTimes;
}

- (NSArray)arrivalTimes
{
  return self->_arrivalTimes;
}

- (double)departureTimeIntervalMin
{
  return self->_departureTimeIntervalMin;
}

- (double)departureTimeIntervalMax
{
  return self->_departureTimeIntervalMax;
}

- (GEOTransitVehicleInfo)transitVehicle
{
  return self->_transitVehicle;
}

- (GEOTransitLine)transitLine
{
  return self->_transitLine;
}

- (GEOTransitSystem)transitSystem
{
  return self->_transitSystem;
}

- (NSArray)routeLineArtwork
{
  return self->_routeLineArtwork;
}

- (BOOL)isRail
{
  return self->_isRail;
}

- (BOOL)isBus
{
  return self->_isBus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeLineArtwork, 0);
  objc_storeStrong((id *)&self->_transitSystem, 0);
  objc_storeStrong((id *)&self->_transitLine, 0);
  objc_storeStrong((id *)&self->_transitVehicle, 0);
  objc_storeStrong((id *)&self->_arrivalTimes, 0);
  objc_storeStrong((id *)&self->_departureTimes, 0);

  objc_storeStrong((id *)&self->_arrivalTimesAtOrigin, 0);
}

@end