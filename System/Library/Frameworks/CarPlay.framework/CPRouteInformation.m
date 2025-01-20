@interface CPRouteInformation
- (CPLaneGuidance)currentLaneGuidance;
- (CPRouteInformation)initWithManeuvers:(id)a3 laneGuidances:(id)a4 currentManeuvers:(id)a5 currentLaneGuidance:(id)a6 tripTravelEstimates:(id)a7 maneuverTravelEstimates:(id)a8;
- (CPTravelEstimates)maneuverTravelEstimates;
- (CPTravelEstimates)tripTravelEstimates;
- (NSArray)currentManeuvers;
- (NSArray)laneGuidances;
- (NSArray)maneuvers;
- (id)routeInfoWithAccNavSupported:(BOOL)a3 roadNameVariants:(id)a4 destinationNameVariants:(id)a5 timeZoneOffset:(signed __int16)a6;
@end

@implementation CPRouteInformation

- (CPRouteInformation)initWithManeuvers:(id)a3 laneGuidances:(id)a4 currentManeuvers:(id)a5 currentLaneGuidance:(id)a6 tripTravelEstimates:(id)a7 maneuverTravelEstimates:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CPRouteInformation;
  v18 = [(CPRouteInformation *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_maneuvers, a3);
    objc_storeStrong((id *)&v19->_laneGuidances, a4);
    objc_storeStrong((id *)&v19->_currentManeuvers, a5);
    objc_storeStrong((id *)&v19->_currentLaneGuidance, a6);
    objc_storeStrong((id *)&v19->_tripTravelEstimates, a7);
    objc_storeStrong((id *)&v19->_maneuverTravelEstimates, a8);
  }

  return v19;
}

- (id)routeInfoWithAccNavSupported:(BOOL)a3 roadNameVariants:(id)a4 destinationNameVariants:(id)a5 timeZoneOffset:(signed __int16)a6
{
  uint64_t v6 = a6;
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = objc_opt_new();
  v13 = [(CPRouteInformation *)self currentManeuvers];
  [v12 setCurrentManeuvers:v13];

  v14 = [(CPRouteInformation *)self currentLaneGuidance];
  [v12 setCurrentLaneGuidance:v14];

  if (v8)
  {
    [v12 setGuidanceState:1];
    id v15 = [(CPRouteInformation *)self tripTravelEstimates];
    id v16 = [v15 distanceRemaining];
    [v12 setDistanceRemaining:v16];

    id v17 = [(CPRouteInformation *)self tripTravelEstimates];
    v18 = [v17 distanceRemainingToDisplay];
    [v12 setDistanceRemainingDisplay:v18];

    v19 = [(CPRouteInformation *)self tripTravelEstimates];
    [v19 timeRemaining];
    objc_msgSend(v12, "setTimeRemaining:");

    v20 = (void *)MEMORY[0x263EFF910];
    id v21 = [(CPRouteInformation *)self tripTravelEstimates];
    [v21 timeRemaining];
    id v22 = objc_msgSend(v20, "dateWithTimeIntervalSinceNow:");
    [v12 setEstimatedTimeOfArrival:v22];

    id v23 = [(CPRouteInformation *)self maneuverTravelEstimates];
    objc_super v24 = [v23 distanceRemaining];
    [v12 setDistanceRemainingToNextManeuver:v24];

    v25 = [(CPRouteInformation *)self maneuverTravelEstimates];
    v26 = [v25 distanceRemainingToDisplay];
    [v12 setDistanceRemainingToNextManeuverDisplay:v26];

    [v12 setCurrentRoadNameVariants:v10];
    [v12 setDestinationNameVariants:v11];
    [v12 setSourceSupportsRouteGuidance:1];
    [v12 setDestinationTimeZoneOffsetMinutes:v6];
    v27 = [(CPRouteInformation *)self currentLaneGuidance];
    [v12 setLaneGuidanceShowing:v27 != 0];
  }
  v28 = [CPRouteInfo alloc];
  v29 = [(CPRouteInformation *)self maneuvers];
  v30 = [(CPRouteInformation *)self laneGuidances];
  v31 = [(CPRouteInfo *)v28 initWithRouteGuidance:v12 maneuvers:v29 laneGuidances:v30];

  return v31;
}

- (NSArray)maneuvers
{
  return self->_maneuvers;
}

- (NSArray)laneGuidances
{
  return self->_laneGuidances;
}

- (NSArray)currentManeuvers
{
  return self->_currentManeuvers;
}

- (CPLaneGuidance)currentLaneGuidance
{
  return self->_currentLaneGuidance;
}

- (CPTravelEstimates)tripTravelEstimates
{
  return self->_tripTravelEstimates;
}

- (CPTravelEstimates)maneuverTravelEstimates
{
  return self->_maneuverTravelEstimates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maneuverTravelEstimates, 0);
  objc_storeStrong((id *)&self->_tripTravelEstimates, 0);
  objc_storeStrong((id *)&self->_currentLaneGuidance, 0);
  objc_storeStrong((id *)&self->_currentManeuvers, 0);
  objc_storeStrong((id *)&self->_laneGuidances, 0);

  objc_storeStrong((id *)&self->_maneuvers, 0);
}

@end