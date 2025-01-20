@interface GEOComposedRouteStep
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)endGeoCoordinate;
- ($1AB5FA073B851C12C2339EC22442E995)startGeoCoordinate;
- ($212C09783140BCCD23384160D545CE0D)endRouteCoordinate;
- ($212C09783140BCCD23384160D545CE0D)maneuverStartRouteCoordinate;
- ($212C09783140BCCD23384160D545CE0D)startRouteCoordinate;
- (BOOL)_belongsToTransferGroup;
- (BOOL)hasDuration;
- (BOOL)isArrivalStep;
- (BOOL)isChargingStop;
- (BOOL)isStartOrResumeStep;
- (BOOL)isUncertainArrival;
- (BOOL)shouldCreateAlightExitGroup;
- (BOOL)shouldCreateArrivalGroup;
- (BOOL)shouldCreateEnterBoardGroup;
- (BOOL)shouldCreateFerryProgressionGroup;
- (BOOL)shouldCreateTransferGroup;
- (BOOL)shouldCreateTripProgressionGroup;
- (BOOL)shouldPreloadWithHighPriority;
- (GEOComposedRoute)composedRoute;
- (GEOComposedRouteEVStepInfo)evInfo;
- (GEOComposedRouteSegment)segment;
- (GEOComposedRouteStep)getNextStep;
- (GEOComposedRouteStep)getPreviousStep;
- (GEOComposedRouteStep)initWithCoder:(id)a3;
- (GEOComposedRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 routeSegmentType:(int64_t)a6 stepIndex:(unint64_t)a7 pointRange:(_NSRange)a8 maneuverPointRange:(_NSRange)a9;
- (GEOComposedRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 routeSegmentType:(int64_t)a6 stepIndex:(unint64_t)a7 startRouteCoordinate:(id)a8 endRouteCoordinate:(id)a9 maneuverStartRouteCoordinate:(id)a10;
- (GEOComposedRouteStep)initWithComposedRoute:(id)a3 routeSegmentType:(int64_t)a4 stepIndex:(unint64_t)a5 pointRange:(_NSRange)a6;
- (GEOComposedString)distanceStringForListView;
- (GEOComposedString)distanceStringForSignView;
- (GEOComposedTransitTripRouteStep)closestLogicalBoardOrAlightStep;
- (GEOComposedTransitTripRouteStep)nextAlightingStep;
- (GEOComposedTransitTripRouteStep)nextBoardingStep;
- (GEOComposedTransitTripRouteStep)previousAlightingStep;
- (GEOComposedTransitTripRouteStep)previousBoardingStep;
- (GEOInstructionSet)instructions;
- (GEOJunction)junction;
- (GEOPBTransitStop)endingStop;
- (GEOPBTransitStop)nextStop;
- (GEOPBTransitStop)previousStop;
- (GEOPBTransitStop)startingStop;
- (GEOPolylineCoordinateRange)routeCoordinateRange;
- (GEOStep)geoStep;
- (GEOTransitArtworkDataSource)artworkOverride;
- (GEOTransitArtworkDataSource)routeDetailsSecondaryArtwork;
- (GEOTransitStep)transitStep;
- (NSArray)advisories;
- (NSArray)instructionStringsForListView;
- (NSArray)normalInstructionStringsForSignView;
- (NSArray)routeDetailsPrimaryArtwork;
- (NSArray)steppingArtwork;
- (NSArray)transitIncidents;
- (NSString)description;
- (NSString)maneuverRoadName;
- (NSString)maneuverRoadOrExitName;
- (_NSRange)maneuverPointRange;
- (_NSRange)pointRange;
- (double)distance;
- (double)travelTime;
- (id)firstNameOrBranch;
- (id)maneuverAndInstructionDescription;
- (id)maneuverDescription;
- (id)timeCheckpoints;
- (int)drivingSide;
- (int)maneuver;
- (int)maneuverType;
- (int)transportType;
- (int64_t)routeSegmentType;
- (unint64_t)pathIndex;
- (unint64_t)stepIndex;
- (unsigned)duration;
- (unsigned)endPointIndex;
- (unsigned)maneuverStartPointIndex;
- (unsigned)pointCount;
- (unsigned)startPointIndex;
- (unsigned)startTime;
- (unsigned)stepID;
- (void)encodeWithCoder:(id)a3;
- (void)setComposedRoute:(id)a3;
@end

@implementation GEOComposedRouteStep

- (BOOL)shouldPreloadWithHighPriority
{
  if ([(GEOComposedRouteStep *)self transportType] != 1) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(GEOComposedRouteStep *)self canPreloadTilesForThisStep];
}

- (int)maneuver
{
  v2 = [(GEOComposedRouteStep *)self transitStep];
  int v3 = [v2 maneuverType];

  return v3;
}

- (BOOL)shouldCreateEnterBoardGroup
{
  if ([(GEOComposedRouteStep *)self maneuver] == 3) {
    return ![(GEOComposedRouteStep *)self _belongsToTransferGroup];
  }
  else {
    return 0;
  }
}

- (BOOL)shouldCreateAlightExitGroup
{
  if ([(GEOComposedRouteStep *)self maneuver] == 5) {
    return ![(GEOComposedRouteStep *)self _belongsToTransferGroup];
  }
  else {
    return 0;
  }
}

- (BOOL)shouldCreateTransferGroup
{
  if ([(GEOComposedRouteStep *)self maneuver] != 5) {
    return 0;
  }

  return [(GEOComposedRouteStep *)self _belongsToTransferGroup];
}

- (BOOL)shouldCreateTripProgressionGroup
{
  if ([(GEOComposedRouteStep *)self maneuver] == 5) {
    return ![(GEOComposedRouteStep *)self shouldCreateFerryProgressionGroup];
  }
  else {
    return 0;
  }
}

- (BOOL)shouldCreateFerryProgressionGroup
{
  if ([(GEOComposedRouteStep *)self routeSegmentType] == 6)
  {
    int v3 = self;
    if ([(GEOComposedRouteStep *)v3 maneuver] == 5
      && ([(GEOComposedRouteStep *)v3 isRail] & 1) == 0)
    {
      int v4 = [(GEOComposedRouteStep *)v3 isBus] ^ 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)shouldCreateArrivalGroup
{
  if ([(GEOComposedRouteStep *)self maneuver] != 10) {
    return 0;
  }
  int v3 = [(GEOComposedRouteStep *)self getPreviousStep];
  BOOL v4 = [v3 routeSegmentType] == 2;

  return v4;
}

- (BOOL)_belongsToTransferGroup
{
  if ([(GEOComposedRouteStep *)self routeSegmentType] == 6)
  {
    int v3 = self;
    if ([(GEOComposedRouteStep *)v3 maneuver] == 5)
    {
      BOOL v4 = [(GEOComposedRouteStep *)v3 nextTransitStep];
      if ([v4 maneuver] != 3)
      {
        if ([v4 maneuver] == 6)
        {
          v5 = [v4 nextTransitStep];
          BOOL v6 = [v5 maneuver] == 3;
LABEL_16:
          BOOL v7 = v6;

          goto LABEL_21;
        }
LABEL_20:
        BOOL v7 = 0;
        goto LABEL_21;
      }
    }
    else
    {
      if ([(GEOComposedRouteStep *)v3 maneuver] != 3)
      {
        if ([(GEOComposedRouteStep *)v3 maneuver] != 6
          || ([(GEOComposedRouteStep *)v3 previousTransitStep],
              v8 = objc_claimAutoreleasedReturnValue(),
              int v9 = [v8 maneuver],
              v8,
              v9 != 5))
        {
          BOOL v7 = 0;
LABEL_22:

          return v7;
        }
        BOOL v4 = [(GEOComposedRouteStep *)v3 nextTransitStep];
        BOOL v7 = [v4 maneuver] == 3;
LABEL_21:

        goto LABEL_22;
      }
      BOOL v4 = [(GEOComposedRouteStep *)v3 previousTransitStep];
      if ([v4 maneuver] != 5)
      {
        if ([v4 maneuver] == 6)
        {
          v5 = [v4 previousTransitStep];
          BOOL v6 = [v5 maneuver] == 5;
          goto LABEL_16;
        }
        goto LABEL_20;
      }
    }
    BOOL v7 = 1;
    goto LABEL_21;
  }
  return 0;
}

- (GEOComposedRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 routeSegmentType:(int64_t)a6 stepIndex:(unint64_t)a7 startRouteCoordinate:(id)a8 endRouteCoordinate:(id)a9 maneuverStartRouteCoordinate:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v28.receiver = self;
  v28.super_class = (Class)GEOComposedRouteStep;
  v19 = [(GEOComposedRouteStep *)&v28 init];
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_composedRoute, v16);
    objc_storeStrong((id *)&v20->_geoStep, a5);
    v20->_routeSegmentType = a6;
    v20->_stepIndex = a7;
    if ([v18 hasDistanceCm])
    {
      double v21 = (double)[v18 distanceCm] * 0.01;
    }
    else if ([v18 hasDistanceMeters])
    {
      [v18 distanceMeters];
      double v21 = v22;
    }
    else
    {
      double v21 = (double)[v18 distance];
    }
    v20->_distance = v21;
    v20->_startRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a8;
    v20->_endRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a9;
    v20->_maneuverStartRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a10;
    if ([v18 hasOverrideDrivingSide]) {
      int v23 = [v18 overrideDrivingSide];
    }
    else {
      int v23 = [v17 drivingSide];
    }
    v20->_drivingSide = v23;
    if ([v18 hasJunctionType])
    {
      v24 = [[GEOJunction alloc] initWithStep:v20];
      junction = v20->_junction;
      v20->_junction = v24;
    }
    v26 = v20;
  }

  return v20;
}

- (GEOComposedRouteStep)initWithComposedRoute:(id)a3 routeSegmentType:(int64_t)a4 stepIndex:(unint64_t)a5 pointRange:(_NSRange)a6
{
  NSUInteger v6 = a6.length - 1;
  if (!a6.length) {
    NSUInteger v6 = 0;
  }
  return -[GEOComposedRouteStep initWithComposedRoute:geoRouteLeg:geoStep:routeSegmentType:stepIndex:pointRange:maneuverPointRange:](self, "initWithComposedRoute:geoRouteLeg:geoStep:routeSegmentType:stepIndex:pointRange:maneuverPointRange:", a3, 0, 0, a4, a5, a6.location, a6.length, v6 + a6.location, 1);
}

- (GEOComposedRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 routeSegmentType:(int64_t)a6 stepIndex:(unint64_t)a7 pointRange:(_NSRange)a8 maneuverPointRange:(_NSRange)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v29.receiver = self;
  v29.super_class = (Class)GEOComposedRouteStep;
  id v17 = [(GEOComposedRouteStep *)&v29 init];
  id v18 = v17;
  if (!v17) {
    goto LABEL_21;
  }
  objc_storeWeak((id *)&v17->_composedRoute, v14);
  objc_storeStrong((id *)&v18->_geoStep, a5);
  v18->_stepIndex = a7;
  if ([v16 hasDistanceCm])
  {
    double v19 = (double)[v16 distanceCm] * 0.01;
  }
  else if ([v16 hasDistanceMeters])
  {
    [v16 distanceMeters];
    double v19 = v20;
  }
  else
  {
    double v19 = (double)[v16 distance];
  }
  v18->_distance = v19;
  v18->_routeSegmentType = a6;
  if (a8.location + a8.length) {
    int location = LODWORD(a8.location) + LODWORD(a8.length) - 1;
  }
  else {
    int location = a8.location;
  }
  v18->_$604ECB7A8067A7300F159AE8ED6889F8 startRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)LODWORD(a8.location);
  v18->_endRouteCoordinate.index = location;
  v18->_endRouteCoordinate.offset = 0.0;
  $604ECB7A8067A7300F159AE8ED6889F8 startRouteCoordinate = v18->_startRouteCoordinate;
  $604ECB7A8067A7300F159AE8ED6889F8 endRouteCoordinate = v18->_endRouteCoordinate;
  if (endRouteCoordinate.index == startRouteCoordinate.index)
  {
    if (endRouteCoordinate.offset >= startRouteCoordinate.offset) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (endRouteCoordinate.index < startRouteCoordinate.index) {
LABEL_14:
  }
    v18->_$604ECB7A8067A7300F159AE8ED6889F8 startRouteCoordinate = endRouteCoordinate;
LABEL_15:
  v18->_maneuverStartRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)LODWORD(a9.location);
  if ([v16 hasOverrideDrivingSide]) {
    int v24 = [v16 overrideDrivingSide];
  }
  else {
    int v24 = [v15 drivingSide];
  }
  v18->_drivingSide = v24;
  if ([v16 hasJunctionType])
  {
    v25 = [[GEOJunction alloc] initWithStep:v18];
    junction = v18->_junction;
    v18->_junction = v25;
  }
  v27 = v18;
LABEL_21:

  return v18;
}

- (GEOComposedRouteSegment)segment
{
  int v3 = [(GEOComposedRouteStep *)self composedRoute];
  BOOL v4 = objc_msgSend(v3, "segmentForStepIndex:", -[GEOComposedRouteStep stepIndex](self, "stepIndex"));

  return (GEOComposedRouteSegment *)v4;
}

- (int)transportType
{
  unint64_t v2 = self->_routeSegmentType - 1;
  if (v2 > 5) {
    return 4;
  }
  else {
    return dword_18A640B5C[v2];
  }
}

- (int)maneuverType
{
  geoStep = self->_geoStep;
  if (geoStep) {
    LODWORD(geoStep) = [(GEOStep *)geoStep maneuverType];
  }
  return (int)geoStep;
}

- (_NSRange)pointRange
{
  NSUInteger v2 = self->_endRouteCoordinate.index - self->_startRouteCoordinate.index + 1;
  NSUInteger index = self->_startRouteCoordinate.index;
  result.length = v2;
  result.int location = index;
  return result;
}

- (unsigned)startPointIndex
{
  return self->_startRouteCoordinate.index;
}

- (unsigned)endPointIndex
{
  return self->_endRouteCoordinate.index;
}

- (unsigned)pointCount
{
  [(GEOComposedRouteStep *)self pointRange];
  return v2;
}

- (_NSRange)maneuverPointRange
{
  NSUInteger v2 = self->_endRouteCoordinate.index - self->_maneuverStartRouteCoordinate.index + 1;
  NSUInteger index = self->_maneuverStartRouteCoordinate.index;
  result.length = v2;
  result.int location = index;
  return result;
}

- (unsigned)maneuverStartPointIndex
{
  return self->_maneuverStartRouteCoordinate.index;
}

- (NSString)maneuverRoadOrExitName
{
  maneuverRoadOrExitName = self->_maneuverRoadOrExitName;
  if (!maneuverRoadOrExitName)
  {
    BOOL v4 = [(GEOComposedRouteStep *)self geoStep];
    v5 = v4;
    if (v4)
    {
      NSUInteger v6 = [v4 exitNumber];
      BOOL v7 = [v6 name];
      uint64_t v8 = [v7 length];

      if (v8)
      {
        int v9 = [v5 exitNumber];
        v10 = [v9 name];
        v11 = self->_maneuverRoadOrExitName;
        self->_maneuverRoadOrExitName = v10;
      }
      else
      {
        v12 = [(GEOComposedRouteStep *)self maneuverRoadName];
        int v9 = self->_maneuverRoadOrExitName;
        self->_maneuverRoadOrExitName = v12;
      }
    }
    maneuverRoadOrExitName = self->_maneuverRoadOrExitName;
  }

  return maneuverRoadOrExitName;
}

- (NSString)maneuverRoadName
{
  NSUInteger v2 = self;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  maneuverRoadName = self->_maneuverRoadName;
  if (!maneuverRoadName)
  {
    BOOL v4 = [(GEOComposedRouteStep *)v2 geoStep];
    v5 = v4;
    if (!v4)
    {
LABEL_31:

      maneuverRoadName = v2->_maneuverRoadName;
      goto LABEL_32;
    }
    v27 = v4;
    objc_super v28 = v2;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    NSUInteger v6 = [v4 signposts];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      int v9 = 0;
      v10 = 0;
      v11 = 0;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v6);
          }
          id v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v15 = [v14 name];
          uint64_t v16 = [v15 length];

          if (v16)
          {
            int v17 = [v14 signType];
            if (v17 == 3)
            {
              if (!v10)
              {
                v10 = [v14 name];
              }
            }
            else if (v17 == 2)
            {
              if (!v9)
              {
                int v9 = [v14 name];
              }
            }
            else if (v17 == 1 && v11 == 0)
            {
              v11 = [v14 name];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v8);
    }
    else
    {
      int v9 = 0;
      v10 = 0;
      v11 = 0;
    }

    if ([v10 length])
    {
      double v19 = v10;
      v5 = v27;
      NSUInteger v2 = v28;
    }
    else
    {
      v5 = v27;
      double v21 = [v27 firstNameInfo];
      float v22 = [v21 name];
      uint64_t v23 = [v22 length];

      NSUInteger v2 = v28;
      if (v23)
      {
        float v20 = [v27 firstNameInfo];
        uint64_t v24 = [v20 name];
        v25 = v28->_maneuverRoadName;
        v28->_maneuverRoadName = (NSString *)v24;

        goto LABEL_30;
      }
      if ([v11 length])
      {
        double v19 = v11;
      }
      else
      {
        if (![v9 length])
        {
          float v20 = v28->_maneuverRoadName;
          v28->_maneuverRoadName = (NSString *)&stru_1ED51F370;
          goto LABEL_30;
        }
        double v19 = v9;
      }
    }
    float v20 = v2->_maneuverRoadName;
    v2->_maneuverRoadName = v19;
LABEL_30:

    goto LABEL_31;
  }
LABEL_32:

  return maneuverRoadName;
}

- (unint64_t)pathIndex
{
  int v3 = [(GEOComposedRouteStep *)self geoStep];
  if (v3)
  {
    BOOL v4 = [(GEOComposedRouteStep *)self geoStep];
    unint64_t v5 = [v4 zilchPathIndex];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isStartOrResumeStep
{
  int v3 = [(GEOComposedRouteStep *)self geoStep];

  if (!v3) {
    return 0;
  }
  BOOL v4 = [(GEOComposedRouteStep *)self geoStep];
  int v5 = [v4 maneuverType];

  return v5 == 17 || v5 == 85;
}

- (BOOL)isUncertainArrival
{
  return 0;
}

- (BOOL)isArrivalStep
{
  int v3 = [(GEOComposedRouteStep *)self geoStep];

  if (!v3) {
    return 0;
  }
  BOOL v4 = [(GEOComposedRouteStep *)self geoStep];
  unsigned int v5 = [v4 maneuverType];

  if (v5 <= 0x22) {
    return (0x600040000uLL >> v5) & 1;
  }
  else {
    return 0;
  }
}

- (BOOL)isChargingStop
{
  int v3 = [(GEOComposedRouteStep *)self geoStep];

  if (!v3) {
    return 0;
  }
  BOOL v4 = [(GEOComposedRouteStep *)self geoStep];
  int v5 = [v4 maneuverType];

  return (v5 - 82) < 3;
}

- ($1AB5FA073B851C12C2339EC22442E995)startGeoCoordinate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composedRoute);
  objc_msgSend(WeakRetained, "pointAtRouteCoordinate:", -[GEOComposedRouteStep startRouteCoordinate](self, "startRouteCoordinate"));
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v5;
  double v11 = v7;
  double v12 = v9;
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)endGeoCoordinate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composedRoute);
  objc_msgSend(WeakRetained, "pointAtRouteCoordinate:", -[GEOComposedRouteStep endRouteCoordinate](self, "endRouteCoordinate"));
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v5;
  double v11 = v7;
  double v12 = v9;
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (BOOL)hasDuration
{
  geoStep = self->_geoStep;
  if (geoStep) {
    LOBYTE(geoStep) = [(GEOStep *)geoStep hasExpectedTime];
  }
  return (char)geoStep;
}

- (unsigned)duration
{
  return [(GEOStep *)self->_geoStep expectedTime];
}

- (unsigned)stepID
{
  return [(GEOStep *)self->_geoStep stepID];
}

- (GEOComposedRouteStep)getPreviousStep
{
  int v3 = [(GEOComposedRouteStep *)self composedRoute];
  double v4 = [v3 steps];
  uint64_t v5 = [v4 count];

  if (v5 && [(GEOComposedRouteStep *)self stepIndex])
  {
    double v6 = [(GEOComposedRouteStep *)self composedRoute];
    double v7 = [v6 steps];
    double v8 = objc_msgSend(v7, "objectAtIndex:", -[GEOComposedRouteStep stepIndex](self, "stepIndex") - 1);
  }
  else
  {
    double v8 = 0;
  }

  return (GEOComposedRouteStep *)v8;
}

- (GEOComposedRouteStep)getNextStep
{
  int v3 = [(GEOComposedRouteStep *)self composedRoute];
  double v4 = [v3 steps];
  uint64_t v5 = [v4 count];

  if (v5
    && (unint64_t v6 = [(GEOComposedRouteStep *)self stepIndex] + 1,
        [(GEOComposedRouteStep *)self composedRoute],
        double v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 stepsCount],
        v7,
        v6 < v8))
  {
    double v9 = [(GEOComposedRouteStep *)self composedRoute];
    double v10 = [v9 steps];
    double v11 = [v10 objectAtIndex:v6];
  }
  else
  {
    double v11 = 0;
  }

  return (GEOComposedRouteStep *)v11;
}

- (GEOPBTransitStop)startingStop
{
  return 0;
}

- (GEOPBTransitStop)endingStop
{
  return 0;
}

- (unsigned)startTime
{
  return 0;
}

- (GEOPBTransitStop)previousStop
{
  NSUInteger v2 = [(GEOComposedRouteStep *)self getPreviousStep];
  int v3 = [v2 previousStop];

  return (GEOPBTransitStop *)v3;
}

- (GEOPBTransitStop)nextStop
{
  NSUInteger v2 = [(GEOComposedRouteStep *)self getNextStep];
  int v3 = [v2 nextStop];

  return (GEOPBTransitStop *)v3;
}

- (GEOComposedTransitTripRouteStep)nextBoardingStep
{
  NSUInteger v2 = [(GEOComposedRouteStep *)self getNextStep];
  int v3 = [v2 nextBoardingStep];

  return (GEOComposedTransitTripRouteStep *)v3;
}

- (GEOComposedTransitTripRouteStep)previousBoardingStep
{
  NSUInteger v2 = [(GEOComposedRouteStep *)self getPreviousStep];
  int v3 = [v2 previousBoardingStep];

  return (GEOComposedTransitTripRouteStep *)v3;
}

- (GEOComposedTransitTripRouteStep)nextAlightingStep
{
  NSUInteger v2 = [(GEOComposedRouteStep *)self getNextStep];
  int v3 = [v2 nextAlightingStep];

  return (GEOComposedTransitTripRouteStep *)v3;
}

- (GEOComposedTransitTripRouteStep)previousAlightingStep
{
  NSUInteger v2 = [(GEOComposedRouteStep *)self getPreviousStep];
  int v3 = [v2 previousAlightingStep];

  return (GEOComposedTransitTripRouteStep *)v3;
}

- (GEOComposedTransitTripRouteStep)closestLogicalBoardOrAlightStep
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  uint64_t v4 = [(GEOComposedRouteStep *)self nextBoardingStep];
  if (v4) {
    [v3 addObject:v4];
  }
  uint64_t v5 = [(GEOComposedRouteStep *)self previousBoardingStep];
  if (v5) {
    [v3 addObject:v5];
  }
  uint64_t v6 = [(GEOComposedRouteStep *)self nextAlightingStep];
  if (v6) {
    [v3 addObject:v6];
  }
  v25 = (void *)v4;
  uint64_t v7 = [(GEOComposedRouteStep *)self previousAlightingStep];
  if (v7) {
    [v3 addObject:v7];
  }
  float v22 = (void *)v7;
  uint64_t v23 = (void *)v6;
  uint64_t v24 = (void *)v5;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    double v10 = 0;
    uint64_t v11 = *(void *)v28;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v28 != v11) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
      int64_t v15 = [(GEOComposedRouteStep *)self stepIndex];
      uint64_t v16 = [v14 stepIndex];
      unint64_t v17 = [(GEOComposedRouteStep *)self stepIndex];
      uint64_t v18 = [v14 stepIndex];
      int64_t v19 = v15 >= v16 ? v17 - v18 : v18 - v17;
      if (v19 < v12)
      {
        id v20 = v14;

        uint64_t v12 = v19;
        double v10 = v20;
        if (!v19) {
          break;
        }
      }
      if (v9 == ++v13)
      {
        uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        id v20 = v10;
        if (v9) {
          goto LABEL_11;
        }
        break;
      }
    }
  }
  else
  {
    id v20 = 0;
  }

  return (GEOComposedTransitTripRouteStep *)v20;
}

- (id)firstNameOrBranch
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v3 = [(GEOComposedRouteStep *)self geoStep];
  id v4 = [v3 firstNameInfo];

  if (!v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [(GEOComposedRouteStep *)self geoStep];
    uint64_t v6 = [v5 signposts];

    id v4 = (id)[v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v6);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v9 signType] == 1)
          {
            id v4 = v9;
            goto LABEL_12;
          }
        }
        id v4 = (id)[v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }

  return v4;
}

- (NSArray)advisories
{
  return 0;
}

- (NSArray)transitIncidents
{
  return 0;
}

- (GEOTransitStep)transitStep
{
  return 0;
}

- (GEOInstructionSet)instructions
{
  NSUInteger v2 = [(GEOComposedRouteStep *)self geoStep];
  int v3 = [v2 instructionSet];

  return (GEOInstructionSet *)v3;
}

- (GEOComposedString)distanceStringForListView
{
  int v3 = [GEOComposedString alloc];
  id v4 = [(GEOComposedRouteStep *)self instructions];
  uint64_t v5 = [v4 drivingWalkingListInstruction];
  uint64_t v6 = -[GEODrivingWalkingInstruction title](v5);
  uint64_t v7 = [(GEOComposedString *)v3 initWithGeoFormattedString:v6];

  return v7;
}

- (NSArray)instructionStringsForListView
{
  NSUInteger v2 = [(GEOComposedRouteStep *)self instructions];
  int v3 = [v2 drivingWalkingListInstruction];
  id v4 = -[GEODrivingWalkingInstruction normalCommands](v3);
  uint64_t v5 = objc_msgSend(v4, "_geo_compactMap:", &__block_literal_global_199);

  return (NSArray *)v5;
}

GEOComposedString *__53__GEOComposedRouteStep_instructionStringsForListView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [[GEOComposedString alloc] initWithGeoFormattedString:v2];

  return v3;
}

- (GEOComposedString)distanceStringForSignView
{
  int v3 = [GEOComposedString alloc];
  id v4 = [(GEOComposedRouteStep *)self instructions];
  uint64_t v5 = [v4 drivingWalkingSignInstruction];
  uint64_t v6 = -[GEODrivingWalkingInstruction title](v5);
  uint64_t v7 = [(GEOComposedString *)v3 initWithGeoFormattedString:v6];

  return v7;
}

- (NSArray)normalInstructionStringsForSignView
{
  id v2 = [(GEOComposedRouteStep *)self instructions];
  int v3 = [v2 drivingWalkingSignInstruction];
  id v4 = -[GEODrivingWalkingInstruction normalCommands](v3);
  uint64_t v5 = objc_msgSend(v4, "_geo_compactMap:", &__block_literal_global_5_1);

  return (NSArray *)v5;
}

GEOComposedString *__59__GEOComposedRouteStep_normalInstructionStringsForSignView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [[GEOComposedString alloc] initWithGeoFormattedString:v2];

  return v3;
}

- (GEOTransitArtworkDataSource)artworkOverride
{
  int v3 = [(GEOComposedRouteStep *)self geoStep];
  if ([v3 hasArtworkOverride])
  {
    id v4 = [(GEOComposedRouteStep *)self geoStep];
    uint64_t v5 = [v4 artworkOverride];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (GEOTransitArtworkDataSource *)v5;
}

- (NSArray)steppingArtwork
{
  return 0;
}

- (NSArray)routeDetailsPrimaryArtwork
{
  return 0;
}

- (GEOTransitArtworkDataSource)routeDetailsSecondaryArtwork
{
  return 0;
}

- (GEOComposedRouteEVStepInfo)evInfo
{
  return 0;
}

- (id)maneuverDescription
{
  geoStep = (__CFString *)self->_geoStep;
  if (geoStep)
  {
    uint64_t v3 = [(__CFString *)geoStep maneuverType];
    geoStep = @"NO_TURN";
    switch((int)v3)
    {
      case 0:
        break;
      case 1:
        geoStep = @"LEFT_TURN";
        break;
      case 2:
        geoStep = @"RIGHT_TURN";
        break;
      case 3:
        geoStep = @"STRAIGHT_AHEAD";
        break;
      case 4:
        geoStep = @"U_TURN";
        break;
      case 5:
        geoStep = @"FOLLOW_ROAD";
        break;
      case 6:
        geoStep = @"ENTER_ROUNDABOUT";
        break;
      case 7:
        geoStep = @"EXIT_ROUNDABOUT";
        break;
      case 11:
        geoStep = @"OFF_RAMP";
        break;
      case 12:
        geoStep = @"ON_RAMP";
        break;
      case 16:
        geoStep = @"ARRIVE_END_OF_NAVIGATION";
        break;
      case 17:
        geoStep = @"START_ROUTE";
        break;
      case 18:
        geoStep = @"ARRIVE_AT_DESTINATION";
        break;
      case 20:
        geoStep = @"KEEP_LEFT";
        break;
      case 21:
        geoStep = @"KEEP_RIGHT";
        break;
      case 22:
        geoStep = @"ENTER_FERRY";
        break;
      case 23:
        geoStep = @"EXIT_FERRY";
        break;
      case 24:
        geoStep = @"CHANGE_FERRY";
        break;
      case 25:
        geoStep = @"START_ROUTE_WITH_U_TURN";
        break;
      case 26:
        geoStep = @"U_TURN_AT_ROUNDABOUT";
        break;
      case 27:
        geoStep = @"LEFT_TURN_AT_END";
        break;
      case 28:
        geoStep = @"RIGHT_TURN_AT_END";
        break;
      case 29:
        geoStep = @"HIGHWAY_OFF_RAMP_LEFT";
        break;
      case 30:
        geoStep = @"HIGHWAY_OFF_RAMP_RIGHT";
        break;
      case 33:
        geoStep = @"ARRIVE_AT_DESTINATION_LEFT";
        break;
      case 34:
        geoStep = @"ARRIVE_AT_DESTINATION_RIGHT";
        break;
      case 35:
        geoStep = @"U_TURN_WHEN_POSSIBLE";
        break;
      case 39:
        geoStep = @"ARRIVE_END_OF_DIRECTIONS";
        break;
      case 41:
        geoStep = @"ROUNDABOUT_EXIT_1";
        break;
      case 42:
        geoStep = @"ROUNDABOUT_EXIT_2";
        break;
      case 43:
        geoStep = @"ROUNDABOUT_EXIT_3";
        break;
      case 44:
        geoStep = @"ROUNDABOUT_EXIT_4";
        break;
      case 45:
        geoStep = @"ROUNDABOUT_EXIT_5";
        break;
      case 46:
        geoStep = @"ROUNDABOUT_EXIT_6";
        break;
      case 47:
        geoStep = @"ROUNDABOUT_EXIT_7";
        break;
      case 48:
        geoStep = @"ROUNDABOUT_EXIT_8";
        break;
      case 49:
        geoStep = @"ROUNDABOUT_EXIT_9";
        break;
      case 50:
        geoStep = @"ROUNDABOUT_EXIT_10";
        break;
      case 51:
        geoStep = @"ROUNDABOUT_EXIT_11";
        break;
      case 52:
        geoStep = @"ROUNDABOUT_EXIT_12";
        break;
      case 53:
        geoStep = @"ROUNDABOUT_EXIT_13";
        break;
      case 54:
        geoStep = @"ROUNDABOUT_EXIT_14";
        break;
      case 55:
        geoStep = @"ROUNDABOUT_EXIT_15";
        break;
      case 56:
        geoStep = @"ROUNDABOUT_EXIT_16";
        break;
      case 57:
        geoStep = @"ROUNDABOUT_EXIT_17";
        break;
      case 58:
        geoStep = @"ROUNDABOUT_EXIT_18";
        break;
      case 59:
        geoStep = @"ROUNDABOUT_EXIT_19";
        break;
      case 60:
        geoStep = @"SHARP_LEFT_TURN";
        break;
      case 61:
        geoStep = @"SHARP_RIGHT_TURN";
        break;
      case 62:
        geoStep = @"SLIGHT_LEFT_TURN";
        break;
      case 63:
        geoStep = @"SLIGHT_RIGHT_TURN";
        break;
      case 64:
        geoStep = @"CHANGE_HIGHWAY";
        break;
      case 65:
        geoStep = @"CHANGE_HIGHWAY_LEFT";
        break;
      case 66:
        geoStep = @"CHANGE_HIGHWAY_RIGHT";
        break;
      case 80:
        geoStep = @"TOLL_STATION";
        break;
      case 81:
        geoStep = @"ENTER_TUNNEL";
        break;
      case 82:
        geoStep = @"WAYPOINT_STOP";
        break;
      case 83:
        geoStep = @"WAYPOINT_STOP_LEFT";
        break;
      case 84:
        geoStep = @"WAYPOINT_STOP_RIGHT";
        break;
      case 85:
        geoStep = @"RESUME_ROUTE";
        break;
      case 86:
        geoStep = @"RESUME_ROUTE_WITH_U_TURN";
        break;
      case 87:
        geoStep = @"CUSTOM";
        break;
      case 88:
        geoStep = @"TURN_AROUND";
        break;
      default:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
        geoStep = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }

  return geoStep;
}

- (id)maneuverAndInstructionDescription
{
  uint64_t v3 = [(GEOComposedRouteStep *)self maneuverDescription];
  uint64_t v4 = [(GEOComposedRouteStep *)self instructionDescription];
  uint64_t v5 = (void *)v4;
  if (v3 && v4)
  {
    [NSString stringWithFormat:@"[%@] (%@)", v3, v4];
    uint64_t v6 = LABEL_8:;
    goto LABEL_9;
  }
  if (v3)
  {
    [NSString stringWithFormat:@"[%@]", v3, v8];
    goto LABEL_8;
  }
  if (v4)
  {
    [NSString stringWithFormat:@"(%@)", v4, v8];
    goto LABEL_8;
  }
  uint64_t v6 = 0;
LABEL_9:

  return v6;
}

- (NSString)description
{
  uint64_t v4 = NSString;
  uint64_t v5 = GEOPolylineCoordinateAsString(*(void *)&self->_startRouteCoordinate, 1, 0, v2);
  uint64_t v7 = GEOPolylineCoordinateAsString(*(void *)&self->_endRouteCoordinate, 1, 0, v6);
  uint64_t v9 = GEOPolylineCoordinateAsString(*(void *)&self->_maneuverStartRouteCoordinate, 1, 0, v8);
  double v10 = [v4 stringWithFormat:@"[%@ - %@] (%@)", v5, v7, v9];

  long long v11 = NSString;
  unint64_t stepIndex = self->_stepIndex;
  uint64_t v13 = [(GEOComposedRouteStep *)self stepID];
  unint64_t v14 = self->_routeSegmentType - 1;
  if (v14 > 5) {
    int64_t v15 = @"unknown";
  }
  else {
    int64_t v15 = off_1E53F5B70[v14];
  }
  uint64_t v16 = [v11 stringWithFormat:@"Step %d (%u) | %@, %gm, %@", stepIndex, v13, v15, *(void *)&self->_distance, v10];

  return (NSString *)v16;
}

- (GEOPolylineCoordinateRange)routeCoordinateRange
{
  $604ECB7A8067A7300F159AE8ED6889F8 endRouteCoordinate = self->_endRouteCoordinate;
  LODWORD(v3) = HIDWORD(*(void *)&self->_startRouteCoordinate);
  unint64_t v4 = 0xBF80000000000000;
  float v5 = floorf(v3);
  uint64_t v6 = vcvtms_u32_f32(v3) + *(void *)&self->_startRouteCoordinate;
  if (v3 >= 0.0) {
    unint64_t v4 = (unint64_t)COERCE_UNSIGNED_INT(v3 - v5) << 32;
  }
  else {
    uint64_t v6 = 0;
  }
  BOOL v7 = endRouteCoordinate.offset < 0.0;
  unint64_t v8 = (vcvtms_u32_f32(endRouteCoordinate.offset) + endRouteCoordinate.index) | ((unint64_t)COERCE_UNSIGNED_INT(endRouteCoordinate.offset - floorf(endRouteCoordinate.offset)) << 32);
  if (v7) {
    PolylineCoordinate v9 = (PolylineCoordinate)0xBF80000000000000;
  }
  else {
    PolylineCoordinate v9 = (PolylineCoordinate)v8;
  }
  PolylineCoordinate v10 = (PolylineCoordinate)(v4 | v6);
  result.end = v9;
  result.start = v10;
  return result;
}

- (double)travelTime
{
  return (double)[(GEOComposedRouteStep *)self duration];
}

- (id)timeCheckpoints
{
  return [(GEOStep *)self->_geoStep timeCheckpoints];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteStep)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)GEOComposedRouteStep;
  float v5 = [(GEOComposedRouteStep *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_geoStep"];
    geoStep = v5->_geoStep;
    v5->_geoStep = (GEOStep *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_junction"];
    junction = v5->_junction;
    v5->_junction = (GEOJunction *)v8;

    v5->_drivingSide = [v4 decodeIntegerForKey:@"_drivingSide"];
    v5->_unint64_t stepIndex = [v4 decodeIntegerForKey:@"_stepIndex"];
    [v4 decodeDoubleForKey:@"_distance"];
    v5->_distance = v10;
    unint64_t v26 = 0;
    id v11 = v4;
    long long v12 = (const void *)[v11 decodeBytesForKey:@"_startRouteCoordinate" returnedLength:&v26];
    if (v26 && v12)
    {
      if (v26 >= 8) {
        size_t v13 = 8;
      }
      else {
        size_t v13 = v26;
      }
      memcpy(&v5->_startRouteCoordinate, v12, v13);
    }
    unint64_t v26 = 0;
    id v14 = v11;
    int64_t v15 = (const void *)[v14 decodeBytesForKey:@"_endRouteCoordinate" returnedLength:&v26];
    if (v26 && v15)
    {
      if (v26 >= 8) {
        size_t v16 = 8;
      }
      else {
        size_t v16 = v26;
      }
      memcpy(&v5->_endRouteCoordinate, v15, v16);
    }
    unint64_t v26 = 0;
    id v17 = v14;
    uint64_t v18 = (const void *)[v17 decodeBytesForKey:@"_maneuverStartRouteCoordinate" returnedLength:&v26];
    if (v26 && v18)
    {
      if (v26 >= 8) {
        size_t v19 = 8;
      }
      else {
        size_t v19 = v26;
      }
      memcpy(&v5->_maneuverStartRouteCoordinate, v18, v19);
    }
    uint64_t v20 = [v17 decodeObjectOfClass:objc_opt_class() forKey:@"_maneuverRoadOrExitName"];
    maneuverRoadOrExitName = v5->_maneuverRoadOrExitName;
    v5->_maneuverRoadOrExitName = (NSString *)v20;

    uint64_t v22 = [v17 decodeObjectOfClass:objc_opt_class() forKey:@"_maneuverRoadName"];
    maneuverRoadName = v5->_maneuverRoadName;
    v5->_maneuverRoadName = (NSString *)v22;

    v5->_routeSegmentType = [v17 decodeIntegerForKey:@"_routeSegmentType"];
    uint64_t v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  geoStep = self->_geoStep;
  id v5 = a3;
  [v5 encodeObject:geoStep forKey:@"_geoStep"];
  [v5 encodeObject:self->_junction forKey:@"_junction"];
  [v5 encodeInteger:self->_drivingSide forKey:@"_drivingSide"];
  [v5 encodeInteger:self->_stepIndex forKey:@"_stepIndex"];
  [v5 encodeDouble:@"_distance" forKey:self->_distance];
  [v5 encodeBytes:&self->_startRouteCoordinate length:8 forKey:@"_startRouteCoordinate"];
  [v5 encodeBytes:&self->_endRouteCoordinate length:8 forKey:@"_endRouteCoordinate"];
  [v5 encodeBytes:&self->_maneuverStartRouteCoordinate length:8 forKey:@"_maneuverStartRouteCoordinate"];
  [v5 encodeObject:self->_maneuverRoadOrExitName forKey:@"_maneuverRoadOrExitName"];
  [v5 encodeObject:self->_maneuverRoadName forKey:@"_maneuverRoadName"];
  [v5 encodeInteger:self->_routeSegmentType forKey:@"_routeSegmentType"];
}

- (GEOComposedRoute)composedRoute
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composedRoute);

  return (GEOComposedRoute *)WeakRetained;
}

- (void)setComposedRoute:(id)a3
{
}

- (GEOStep)geoStep
{
  return self->_geoStep;
}

- (GEOJunction)junction
{
  return self->_junction;
}

- (int)drivingSide
{
  return self->_drivingSide;
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (double)distance
{
  return self->_distance;
}

- ($212C09783140BCCD23384160D545CE0D)startRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_startRouteCoordinate;
}

- ($212C09783140BCCD23384160D545CE0D)endRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_endRouteCoordinate;
}

- ($212C09783140BCCD23384160D545CE0D)maneuverStartRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_maneuverStartRouteCoordinate;
}

- (int64_t)routeSegmentType
{
  return self->_routeSegmentType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maneuverRoadName, 0);
  objc_storeStrong((id *)&self->_maneuverRoadOrExitName, 0);
  objc_storeStrong((id *)&self->_junction, 0);
  objc_storeStrong((id *)&self->_geoStep, 0);

  objc_destroyWeak((id *)&self->_composedRoute);
}

@end