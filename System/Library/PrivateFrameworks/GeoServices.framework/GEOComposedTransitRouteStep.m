@interface GEOComposedTransitRouteStep
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)endGeoCoordinate;
- ($1AB5FA073B851C12C2339EC22442E995)startGeoCoordinate;
- (BOOL)hasDuration;
- (BOOL)isArrivalStep;
- (BOOL)isStartOrResumeStep;
- (GEOComposedTransitRouteStep)initWithCoder:(id)a3;
- (GEOComposedTransitRouteStep)initWithComposedRoute:(id)a3 decoderData:(id)a4 routeSegmentType:(int64_t)a5 step:(id)a6 stepIndex:(unint64_t)a7 duration:(unsigned int)a8 pointRange:(_NSRange)a9;
- (GEOComposedTransitRouteStep)nextTransitStep;
- (GEOComposedTransitRouteStep)previousTransitStep;
- (GEOPBTransitHall)destinationHall;
- (GEOPBTransitHall)originHall;
- (GEOPBTransitStop)destinationStop;
- (GEOPBTransitStop)originStop;
- (GEOTransitScheduleInfo)scheduleInfo;
- (GEOTransitStep)transitStep;
- (GEOTransitVehicleEntries)vehicleEntries;
- (NSArray)regionAlerts;
- (NSString)destinationStopIntermediateListName;
- (NSString)originStopIntermediateListName;
- (double)distance;
- (id)_intermediateListNameForStop:(id)a3;
- (id)_largestEntityAtStop:(id)a3 passingTest:(id)a4;
- (id)advisories;
- (id)description;
- (id)instructionDescription;
- (id)instructions;
- (id)maneuverDescription;
- (id)nextAlightingStep;
- (id)nextBoardingStep;
- (id)nextStop;
- (id)previousAlightingStep;
- (id)previousBoardingStep;
- (id)previousStop;
- (id)routeDetailsPrimaryArtwork;
- (id)routeDetailsSecondaryArtwork;
- (id)steppingArtwork;
- (id)transitIncidents;
- (int)maneuver;
- (unint64_t)_muidForStop:(id)a3;
- (unint64_t)destinationTransitEntityMuid;
- (unint64_t)originTransitEntityMuid;
- (unsigned)duration;
- (unsigned)startTime;
- (void)_populateArtworksWithDecoderData:(id)a3;
- (void)_populateIncidentsWithDecoderData:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedTransitRouteStep

- (GEOComposedTransitRouteStep)initWithComposedRoute:(id)a3 decoderData:(id)a4 routeSegmentType:(int64_t)a5 step:(id)a6 stepIndex:(unint64_t)a7 duration:(unsigned int)a8 pointRange:(_NSRange)a9
{
  id v15 = a4;
  id v16 = a6;
  v37.receiver = self;
  v37.super_class = (Class)GEOComposedTransitRouteStep;
  v17 = -[GEOComposedRouteStep initWithComposedRoute:routeSegmentType:stepIndex:pointRange:](&v37, sel_initWithComposedRoute_routeSegmentType_stepIndex_pointRange_, a3, a5, a7, a9.location, a9.length);
  if (v17)
  {
    v17->_maneuver = [v16 maneuverType];
    v17->_startTime = [v16 startingTime];
    v17->_duration = a8;
    objc_storeStrong((id *)&v17->_transitStep, a6);
    [(GEOComposedTransitRouteStep *)v17 _populateIncidentsWithDecoderData:v15];
    [(GEOComposedTransitRouteStep *)v17 _populateArtworksWithDecoderData:v15];
    if ([v16 hasStartingStopIndex])
    {
      unsigned int v18 = [v16 startingStopIndex];
      if ([v15 stopsCount] > (unint64_t)v18)
      {
        v19 = [v15 stops];
        uint64_t v20 = objc_msgSend(v19, "objectAtIndex:", objc_msgSend(v16, "startingStopIndex"));
        originStop = v17->_originStop;
        v17->_originStop = (GEOPBTransitStop *)v20;
      }
    }
    if ([v16 hasEndingStopIndex])
    {
      unsigned int v22 = [v16 endingStopIndex];
      if ([v15 stopsCount] > (unint64_t)v22)
      {
        v23 = [v15 stops];
        uint64_t v24 = objc_msgSend(v23, "objectAtIndex:", objc_msgSend(v16, "endingStopIndex"));
        destinationStop = v17->_destinationStop;
        v17->_destinationStop = (GEOPBTransitStop *)v24;
      }
    }
    v26 = v17->_originStop;
    if (v26)
    {
      if ([(GEOPBTransitStop *)v26 hasHallIndex])
      {
        unsigned int v27 = [(GEOPBTransitStop *)v17->_originStop hallIndex];
        if ([v15 hallsCount] > (unint64_t)v27)
        {
          v28 = [v15 halls];
          uint64_t v29 = objc_msgSend(v28, "objectAtIndex:", -[GEOPBTransitStop hallIndex](v17->_originStop, "hallIndex"));
          originHall = v17->_originHall;
          v17->_originHall = (GEOPBTransitHall *)v29;
        }
      }
    }
    v31 = v17->_destinationStop;
    if (v31)
    {
      if ([(GEOPBTransitStop *)v31 hasHallIndex])
      {
        unsigned int v32 = [(GEOPBTransitStop *)v17->_destinationStop hallIndex];
        if ([v15 hallsCount] > (unint64_t)v32)
        {
          v33 = [v15 halls];
          uint64_t v34 = objc_msgSend(v33, "objectAtIndex:", -[GEOPBTransitStop hallIndex](v17->_destinationStop, "hallIndex"));
          destinationHall = v17->_destinationHall;
          v17->_destinationHall = (GEOPBTransitHall *)v34;
        }
      }
    }
  }

  return v17;
}

- (void)_populateIncidentsWithDecoderData:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(GEOTransitStep *)self->_transitStep advisoriesInfo];
  v6 = [v5 genericAdvisorys];

  if (v6)
  {
    v30 = objc_opt_new();
    v7 = objc_opt_new();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v8 = [(GEOTransitStep *)self->_transitStep advisoriesInfo];
    v9 = [v8 genericAdvisorys];

    obuint64_t j = v9;
    uint64_t v31 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v31)
    {
      uint64_t v29 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v12 = [GEOComposedRouteAdvisory alloc];
          v13 = [v4 transitIncidents];
          v14 = [(GEOComposedRouteAdvisory *)v12 initWithGeoAdvisoryNotice:v11 transitIncidents:v13];
          [v30 addObject:v14];

          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v15 = [v11 advisoryItems];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v33;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v33 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void **)(*((void *)&v32 + 1) + 8 * j);
                v21 = [v4 transitIncidents];
                unsigned int v22 = objc_msgSend(v21, "objectAtIndex:", objc_msgSend(v20, "transitIncidentIndex"));

                v23 = [[_GEOTransitIncident alloc] initWithIncident:v22];
                [v7 addObject:v23];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v17);
          }
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v31);
    }

    uint64_t v24 = (NSArray *)[v30 copy];
    advisories = self->_advisories;
    self->_advisories = v24;

    v26 = (NSArray *)[v7 copy];
    transitIncidents = self->_transitIncidents;
    self->_transitIncidents = v26;
  }
}

- (void)_populateArtworksWithDecoderData:(id)a3
{
  id v14 = a3;
  id v4 = objc_msgSend(v14, "artworkFromIndices:count:", -[GEOTransitStep routeDetailsPrimaryArtworkIndexs](self->_transitStep, "routeDetailsPrimaryArtworkIndexs"), -[GEOTransitStep routeDetailsPrimaryArtworkIndexsCount](self->_transitStep, "routeDetailsPrimaryArtworkIndexsCount"));
  objc_storeStrong((id *)&self->_routeDetailsPrimaryArtwork, v4);
  routeDetailsSecondaryArtwork = [(GEOComposedTransitRouteStep *)self transitStep];
  if ([routeDetailsSecondaryArtwork hasRouteDetailsSecondaryArtworkIndex])
  {
    v6 = [(GEOComposedTransitRouteStep *)self transitStep];
    unsigned int v7 = [v6 routeDetailsSecondaryArtworkIndex];
    unint64_t v8 = [v14 artworksCount];

    if (v8 <= v7) {
      goto LABEL_5;
    }
    v9 = [v14 artworks];
    v10 = [(GEOComposedTransitRouteStep *)self transitStep];
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v10, "routeDetailsSecondaryArtworkIndex"));
    v11 = (GEOTransitArtworkDataSource *)objc_claimAutoreleasedReturnValue();

    routeDetailsSecondaryArtwork = self->_routeDetailsSecondaryArtwork;
    self->_routeDetailsSecondaryArtwork = v11;
  }

LABEL_5:
  objc_msgSend(v14, "artworkFromIndices:count:", -[GEOTransitStep steppingArtworkIndexs](self->_transitStep, "steppingArtworkIndexs"), -[GEOTransitStep steppingArtworkIndexsCount](self->_transitStep, "steppingArtworkIndexsCount"));
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  steppingArtwork = self->_steppingArtwork;
  self->_steppingArtwork = v12;
}

- (BOOL)hasDuration
{
  return self->_duration != 0;
}

- (unsigned)duration
{
  return self->_duration;
}

- (double)distance
{
  BOOL v3 = [(GEOTransitStep *)self->_transitStep hasDistanceInMeters];
  double result = 0.0;
  if (v3) {
    return (double)[(GEOTransitStep *)self->_transitStep distanceInMeters];
  }
  return result;
}

- (GEOTransitStep)transitStep
{
  return self->_transitStep;
}

- (id)instructions
{
  v2 = [(GEOComposedTransitRouteStep *)self transitStep];
  BOOL v3 = [v2 instructions];

  return v3;
}

- (GEOTransitVehicleEntries)vehicleEntries
{
  v2 = [(GEOComposedTransitRouteStep *)self transitStep];
  BOOL v3 = [v2 vehiclePositionInfo];

  return (GEOTransitVehicleEntries *)v3;
}

- (GEOTransitScheduleInfo)scheduleInfo
{
  v2 = [(GEOComposedTransitRouteStep *)self transitStep];
  BOOL v3 = [v2 scheduleInfo];

  return (GEOTransitScheduleInfo *)v3;
}

- (NSArray)regionAlerts
{
  return (NSArray *)[(GEOTransitStep *)self->_transitStep regionAlerts];
}

- (GEOComposedTransitRouteStep)previousTransitStep
{
  v2 = [(GEOComposedRouteStep *)self getPreviousStep];
  BOOL v3 = v2;
  if (v2)
  {
    if ([v2 transportType] == 1) {
      v2 = v3;
    }
    else {
      v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

- (GEOComposedTransitRouteStep)nextTransitStep
{
  v2 = [(GEOComposedRouteStep *)self getNextStep];
  BOOL v3 = v2;
  if (v2)
  {
    if ([v2 transportType] == 1) {
      v2 = v3;
    }
    else {
      v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

- (unsigned)startTime
{
  return self->_startTime;
}

- (id)previousStop
{
  BOOL v3 = [(GEOComposedTransitRouteStep *)self originStop];

  if (v3)
  {
    id v4 = [(GEOComposedTransitRouteStep *)self originStop];
  }
  else
  {
    v5 = [(GEOComposedRouteStep *)self getPreviousStep];
    v6 = [v5 endingStop];

    unsigned int v7 = [(GEOComposedRouteStep *)self getPreviousStep];
    unint64_t v8 = v7;
    if (v6) {
      [v7 endingStop];
    }
    else {
    id v4 = [v7 previousStop];
    }
  }

  return v4;
}

- (id)nextStop
{
  BOOL v3 = [(GEOComposedTransitRouteStep *)self destinationStop];

  if (v3)
  {
    id v4 = [(GEOComposedTransitRouteStep *)self destinationStop];
  }
  else
  {
    v5 = [(GEOComposedRouteStep *)self getNextStep];
    v6 = [v5 startingStop];

    unsigned int v7 = [(GEOComposedRouteStep *)self getNextStep];
    unint64_t v8 = v7;
    if (v6) {
      [v7 startingStop];
    }
    else {
    id v4 = [v7 nextStop];
    }
  }

  return v4;
}

- (id)nextBoardingStep
{
  if ([(GEOComposedTransitRouteStep *)self maneuver] == 3)
  {
    BOOL v3 = self;
  }
  else
  {
    id v4 = [(GEOComposedRouteStep *)self getNextStep];
    BOOL v3 = [v4 nextBoardingStep];
  }

  return v3;
}

- (id)previousBoardingStep
{
  if ([(GEOComposedTransitRouteStep *)self maneuver] == 3)
  {
    BOOL v3 = self;
  }
  else
  {
    id v4 = [(GEOComposedRouteStep *)self getPreviousStep];
    BOOL v3 = [v4 previousBoardingStep];
  }

  return v3;
}

- (id)nextAlightingStep
{
  if ([(GEOComposedTransitRouteStep *)self maneuver] == 5)
  {
    BOOL v3 = self;
  }
  else
  {
    id v4 = [(GEOComposedRouteStep *)self getNextStep];
    BOOL v3 = [v4 nextAlightingStep];
  }

  return v3;
}

- (id)previousAlightingStep
{
  if ([(GEOComposedTransitRouteStep *)self maneuver] == 5)
  {
    BOOL v3 = self;
  }
  else
  {
    id v4 = [(GEOComposedRouteStep *)self getPreviousStep];
    BOOL v3 = [v4 previousAlightingStep];
  }

  return v3;
}

- ($1AB5FA073B851C12C2339EC22442E995)startGeoCoordinate
{
  uint64_t v3 = [(GEOComposedTransitRouteStep *)self originHall];
  if (v3
    && (id v4 = (void *)v3,
        [(GEOComposedTransitRouteStep *)self originHall],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 hasLocation],
        v5,
        v4,
        v6))
  {
    unsigned int v7 = [(GEOComposedTransitRouteStep *)self originHall];
    unint64_t v8 = [v7 location];
  }
  else
  {
    v9 = [(GEOComposedTransitRouteStep *)self startingStop];
    unsigned int v7 = v9;
    if (!v9)
    {
      v22.receiver = self;
      v22.super_class = (Class)GEOComposedTransitRouteStep;
      [(GEOComposedRouteStep *)&v22 startGeoCoordinate];
      double v12 = v16;
      double v14 = v17;
      uint64_t v15 = v18;
      goto LABEL_8;
    }
    unint64_t v8 = [v9 latLng];
  }
  v10 = v8;
  [v8 coordinate];
  double v12 = v11;
  double v14 = v13;
  *(double *)&uint64_t v15 = 1.79769313e308;

LABEL_8:
  double v19 = v12;
  double v20 = v14;
  double v21 = *(double *)&v15;
  result.var2 = v21;
  result.var1 = v20;
  result.var0 = v19;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)endGeoCoordinate
{
  uint64_t v3 = [(GEOComposedTransitRouteStep *)self destinationHall];
  if (v3
    && (id v4 = (void *)v3,
        [(GEOComposedTransitRouteStep *)self destinationHall],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 hasLocation],
        v5,
        v4,
        v6))
  {
    unsigned int v7 = [(GEOComposedTransitRouteStep *)self destinationHall];
    unint64_t v8 = [v7 location];
  }
  else
  {
    v9 = [(GEOComposedTransitRouteStep *)self endingStop];
    unsigned int v7 = v9;
    if (!v9)
    {
      v22.receiver = self;
      v22.super_class = (Class)GEOComposedTransitRouteStep;
      [(GEOComposedRouteStep *)&v22 endGeoCoordinate];
      double v12 = v16;
      double v14 = v17;
      uint64_t v15 = v18;
      goto LABEL_8;
    }
    unint64_t v8 = [v9 latLng];
  }
  v10 = v8;
  [v8 coordinate];
  double v12 = v11;
  double v14 = v13;
  *(double *)&uint64_t v15 = 1.79769313e308;

LABEL_8:
  double v19 = v12;
  double v20 = v14;
  double v21 = *(double *)&v15;
  result.var2 = v21;
  result.var1 = v20;
  result.var0 = v19;
  return result;
}

- (BOOL)isStartOrResumeStep
{
  return [(GEOTransitStep *)self->_transitStep maneuverType] == 1;
}

- (BOOL)isArrivalStep
{
  if ([(GEOComposedTransitRouteStep *)self maneuver] == 10) {
    return 1;
  }
  id v4 = [(GEOComposedRouteStep *)self getNextStep];
  int v5 = [v4 maneuver];

  BOOL result = v5 == 10
        && ([(GEOComposedRouteStep *)self getNextStep],
            int v6 = objc_claimAutoreleasedReturnValue(),
            [v6 distance],
            double v8 = v7,
            v6,
            v8 == 0.0)
        && [(GEOComposedTransitRouteStep *)self maneuver] == 5;
  return result;
}

- (id)maneuverDescription
{
  uint64_t v2 = [(GEOTransitStep *)self->_transitStep maneuverType];
  if (v2 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v2);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E1258[(int)v2];
  }

  return v3;
}

- (id)instructionDescription
{
  uint64_t v3 = [(GEOTransitStep *)self->_transitStep instructions];
  id v4 = [v3 transitListInstruction];
  int v5 = [v4 commandFormatteds];
  int v6 = [v5 firstObject];

  if (v6)
  {
    double v7 = [[GEOComposedString alloc] initWithGeoFormattedString:v6];
    double v8 = [(GEOComposedString *)v7 stringWithDefaultOptions];
  }
  else
  {
    double v8 = [(GEOComposedTransitRouteStep *)self destinationStopIntermediateListName];
  }

  return v8;
}

- (id)description
{
  if (qword_1E9116908 != -1) {
    dispatch_once(&qword_1E9116908, &__block_literal_global_70);
  }
  id v4 = (void *)_MergedGlobals_1_0;
  LODWORD(v2) = self->_startTime;
  int v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v2];
  int v6 = [v4 stringFromDate:v5];

  double v7 = (void *)_MergedGlobals_1_0;
  double v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)(self->_duration + self->_startTime)];
  v9 = [v7 stringFromDate:v8];

  v10 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)GEOComposedTransitRouteStep;
  double v11 = [(GEOComposedRouteStep *)&v16 description];
  uint64_t maneuver = self->_maneuver;
  if (maneuver >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_maneuver);
    double v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v13 = off_1E53E1258[maneuver];
  }
  double v14 = [v10 stringWithFormat:@"%@ | %@, %@ - %@", v11, v13, v6, v9];

  return v14;
}

uint64_t __42__GEOComposedTransitRouteStep_description__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_1_0;
  _MergedGlobals_1_0 = (uint64_t)v0;

  unint64_t v2 = (void *)_MergedGlobals_1_0;

  return [v2 setDateFormat:@"h:mm:ss a"];
}

- (unint64_t)originTransitEntityMuid
{
  uint64_t v3 = [(GEOComposedTransitRouteStep *)self originStop];
  unint64_t v4 = [(GEOComposedTransitRouteStep *)self _muidForStop:v3];

  return v4;
}

- (unint64_t)destinationTransitEntityMuid
{
  uint64_t v3 = [(GEOComposedTransitRouteStep *)self destinationStop];
  unint64_t v4 = [(GEOComposedTransitRouteStep *)self _muidForStop:v3];

  return v4;
}

- (unint64_t)_muidForStop:(id)a3
{
  uint64_t v3 = [(GEOComposedTransitRouteStep *)self _largestEntityAtStop:a3 passingTest:&__block_literal_global_19];
  unint64_t v4 = [v3 muid];

  return v4;
}

uint64_t __44__GEOComposedTransitRouteStep__muidForStop___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasMuid];
}

- (id)_largestEntityAtStop:(id)a3 passingTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (uint64_t (**)(void, void))v7;
  id v9 = 0;
  if (v6 && v7)
  {
    v10 = [(GEOComposedRouteStep *)self composedRoute];
    double v11 = [v10 getHallForStop:v6];

    if (v11)
    {
      double v12 = [(GEOComposedRouteStep *)self composedRoute];
      id v9 = [v12 getStationForHall:v11];

      if (((uint64_t (**)(void, id))v8)[2](v8, v9))
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    char v13 = ((uint64_t (**)(void, void *))v8)[2](v8, v11);
    double v14 = v11;
    if ((v13 & 1) != 0 || (int v15 = ((uint64_t (**)(void, id))v8)[2](v8, v6), v14 = v6, v15)) {
      id v9 = v14;
    }
    else {
      id v9 = 0;
    }
    goto LABEL_10;
  }
LABEL_11:

  return v9;
}

- (NSString)originStopIntermediateListName
{
  uint64_t v3 = [(GEOComposedTransitRouteStep *)self originStop];
  unint64_t v4 = [(GEOComposedTransitRouteStep *)self _intermediateListNameForStop:v3];

  return (NSString *)v4;
}

- (NSString)destinationStopIntermediateListName
{
  uint64_t v3 = [(GEOComposedTransitRouteStep *)self destinationStop];
  unint64_t v4 = [(GEOComposedTransitRouteStep *)self _intermediateListNameForStop:v3];

  return (NSString *)v4;
}

- (id)_intermediateListNameForStop:(id)a3
{
  id v4 = a3;
  int v5 = [(GEOComposedRouteStep *)self composedRoute];
  id v6 = [v5 getHallForStop:v4];

  id v7 = [v6 bestName];
  if (![v7 length])
  {
    uint64_t v8 = [v4 bestName];

    id v7 = (void *)v8;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedTransitRouteStep)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)GEOComposedTransitRouteStep;
  int v5 = [(GEOComposedRouteStep *)&v28 initWithCoder:v4];
  if (v5)
  {
    v5->_uint64_t maneuver = [v4 decodeIntegerForKey:@"_maneuver"];
    v5->_startTime = [v4 decodeIntegerForKey:@"_startTime"];
    v5->_duration = [v4 decodeIntegerForKey:@"_duration"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_transitStep"];
    transitStep = v5->_transitStep;
    v5->_transitStep = (GEOTransitStep *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_routeDetailsPrimaryArtwork"];
    routeDetailsPrimaryArtwork = v5->_routeDetailsPrimaryArtwork;
    v5->_routeDetailsPrimaryArtwork = (NSArray *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeDetailsSecondaryArtwork"];
    routeDetailsSecondaryArtwork = v5->_routeDetailsSecondaryArtwork;
    v5->_routeDetailsSecondaryArtwork = (GEOTransitArtworkDataSource *)v10;

    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_steppingArtwork"];
    steppingArtwork = v5->_steppingArtwork;
    v5->_steppingArtwork = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originStop"];
    originStop = v5->_originStop;
    v5->_originStop = (GEOPBTransitStop *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_destinationStop"];
    destinationStop = v5->_destinationStop;
    v5->_destinationStop = (GEOPBTransitStop *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originHall"];
    originHall = v5->_originHall;
    v5->_originHall = (GEOPBTransitHall *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_destinationHall"];
    destinationHall = v5->_destinationHall;
    v5->_destinationHall = (GEOPBTransitHall *)v20;

    uint64_t v22 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_advisories"];
    advisories = v5->_advisories;
    v5->_advisories = (NSArray *)v22;

    uint64_t v24 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_transitIncidents"];
    transitIncidents = v5->_transitIncidents;
    v5->_transitIncidents = (NSArray *)v24;

    v26 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTransitRouteStep;
  id v4 = a3;
  [(GEOComposedRouteStep *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maneuver, @"_maneuver", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_startTime forKey:@"_startTime"];
  [v4 encodeInteger:self->_duration forKey:@"_duration"];
  [v4 encodeObject:self->_transitStep forKey:@"_transitStep"];
  [v4 encodeObject:self->_routeDetailsPrimaryArtwork forKey:@"_routeDetailsPrimaryArtwork"];
  [v4 encodeObject:self->_routeDetailsSecondaryArtwork forKey:@"_routeDetailsSecondaryArtwork"];
  [v4 encodeObject:self->_steppingArtwork forKey:@"_steppingArtwork"];
  [v4 encodeObject:self->_originStop forKey:@"_originStop"];
  [v4 encodeObject:self->_destinationStop forKey:@"_destinationStop"];
  [v4 encodeObject:self->_originHall forKey:@"_originHall"];
  [v4 encodeObject:self->_destinationHall forKey:@"_destinationHall"];
  [v4 encodeObject:self->_advisories forKey:@"_advisories"];
  [v4 encodeObject:self->_transitIncidents forKey:@"_transitIncidents"];
}

- (int)maneuver
{
  return self->_maneuver;
}

- (id)routeDetailsPrimaryArtwork
{
  return self->_routeDetailsPrimaryArtwork;
}

- (id)routeDetailsSecondaryArtwork
{
  return self->_routeDetailsSecondaryArtwork;
}

- (id)steppingArtwork
{
  return self->_steppingArtwork;
}

- (GEOPBTransitStop)originStop
{
  return self->_originStop;
}

- (GEOPBTransitStop)destinationStop
{
  return self->_destinationStop;
}

- (GEOPBTransitHall)originHall
{
  return self->_originHall;
}

- (GEOPBTransitHall)destinationHall
{
  return self->_destinationHall;
}

- (id)transitIncidents
{
  return self->_transitIncidents;
}

- (id)advisories
{
  return self->_advisories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advisories, 0);
  objc_storeStrong((id *)&self->_transitIncidents, 0);
  objc_storeStrong((id *)&self->_destinationHall, 0);
  objc_storeStrong((id *)&self->_originHall, 0);
  objc_storeStrong((id *)&self->_destinationStop, 0);
  objc_storeStrong((id *)&self->_originStop, 0);
  objc_storeStrong((id *)&self->_steppingArtwork, 0);
  objc_storeStrong((id *)&self->_routeDetailsSecondaryArtwork, 0);
  objc_storeStrong((id *)&self->_routeDetailsPrimaryArtwork, 0);

  objc_storeStrong((id *)&self->_transitStep, 0);
}

@end