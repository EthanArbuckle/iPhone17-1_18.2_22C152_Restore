@interface GEODirectionsFeedbackCollector
- (BOOL)_canSampleBadEvTrip;
- (BOOL)batteryDied;
- (BOOL)didSuggestFindMy;
- (BOOL)didSuggestWalkingRoute;
- (BOOL)enteredParkingMode;
- (BOOL)hasActiveFeedbackSession;
- (BOOL)isBadEvExperience;
- (BOOL)isEVRoute;
- (BOOL)userDidAcceptWalkingRoute;
- (BOOL)userDidLaunchFindMy;
- (GEODirectionsFeedback)currentDirectionsFeedback;
- (GEODirectionsFeedbackCollector)init;
- (GEODirectionsFeedbackLogMessage)currentFeedbackLogMessage;
- (GEOLocation)arrivalLocation;
- (GEOLocation)parkingDetectionLocation;
- (NSArray)waypoints;
- (NSNumber)stateOfChargeAtDestActual;
- (NSNumber)stateOfChargeAtDestPredicted;
- (NSNumber)stateOfChargeAtOrigin;
- (NSString)evChargingModel;
- (NSString)evConsumptionModel;
- (double)timeBetweenParkedAndArrival;
- (id)description;
- (int64_t)endReason;
- (unint64_t)arrivedAtDestinationCount;
- (unint64_t)inParkingModeCount;
- (void)_updateFeedbackSessionWithResponseID:(id)a3;
- (void)addAlightNotificationFeedback:(id)a3;
- (void)addGuidanceEventFeedback:(id)a3;
- (void)addRouteID:(id)a3 routeIndex:(unsigned int)a4 stepID:(unsigned int)a5 completeStep:(BOOL)a6;
- (void)addStepFeedback:(id)a3;
- (void)addTrafficRerouteFeedback:(id)a3;
- (void)changeNavigationType:(int)a3;
- (void)dealloc;
- (void)endFeedbackSessionWithTracePath:(id)a3;
- (void)reset;
- (void)setARWalkingUsedInNavigation:(BOOL)a3;
- (void)setARWalkingUsedInRoutePlanning:(BOOL)a3;
- (void)setArrivalLocation:(id)a3;
- (void)setArrivedAtDestinationCount:(unint64_t)a3;
- (void)setAudioFeedback:(GEONavigationAudioFeedback *)a3;
- (void)setBatteryDied:(BOOL)a3;
- (void)setChargingStopAdded:(BOOL)a3;
- (void)setCurrentDirectionsFeedback:(id)a3;
- (void)setCurrentFeedbackLogMessage:(id)a3;
- (void)setDidSuggestFindMy:(BOOL)a3;
- (void)setDidSuggestWalkingRoute:(BOOL)a3;
- (void)setEndReason:(int64_t)a3;
- (void)setEnteredParkingMode:(BOOL)a3;
- (void)setEvChargingModel:(id)a3;
- (void)setEvConsumptionModel:(id)a3;
- (void)setFinalLocation:(id)a3 asArrival:(BOOL)a4;
- (void)setHasEnteredPreArrivalMode:(BOOL)a3;
- (void)setInParkingModeCount:(unint64_t)a3;
- (void)setIsBadEvExperience:(BOOL)a3;
- (void)setIsCoarseLocationUsed:(BOOL)a3;
- (void)setIsEVRoute:(BOOL)a3;
- (void)setIsHandsFreeProfileUsed:(BOOL)a3;
- (void)setIsVLFImprovementUsed:(BOOL)a3;
- (void)setModalities:(id)a3;
- (void)setOriginalExpectedTime:(double)a3;
- (void)setParkingDetectionLocation:(id)a3;
- (void)setStateOfChargeAtDestActual:(id)a3;
- (void)setStateOfChargeAtDestPredicted:(id)a3;
- (void)setStateOfChargeAtOrigin:(id)a3;
- (void)setTimeBetweenParkedAndArrival:(double)a3;
- (void)setTransportType:(int)a3;
- (void)setTripOrigin:(id)a3;
- (void)setUserDidAcceptWalkingRoute:(BOOL)a3;
- (void)setUserDidLaunchFindMy:(BOOL)a3;
- (void)setVoiceGuidanceLevel:(int)a3;
- (void)setWasEverConnectedToCarplay:(BOOL)a3;
- (void)setWaypoints:(id)a3;
- (void)startFeedbackSessionForResponseID:(id)a3 withNavigationType:(int)a4;
@end

@implementation GEODirectionsFeedbackCollector

- (GEODirectionsFeedbackCollector)init
{
  v3.receiver = self;
  v3.super_class = (Class)GEODirectionsFeedbackCollector;
  result = [(GEODirectionsFeedbackCollector *)&v3 init];
  if (result) {
    result->_transportType = 4;
  }
  return result;
}

- (void)dealloc
{
  [(GEODirectionsFeedbackCollector *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)GEODirectionsFeedbackCollector;
  [(GEODirectionsFeedbackCollector *)&v3 dealloc];
}

- (void)reset
{
  *(_WORD *)&self->_isEVRoute = 0;
  self->_batteryDied = 0;
  stateOfChargeAtOrigin = self->_stateOfChargeAtOrigin;
  self->_stateOfChargeAtOrigin = 0;

  stateOfChargeAtDestPredicted = self->_stateOfChargeAtDestPredicted;
  self->_stateOfChargeAtDestPredicted = 0;

  stateOfChargeAtDestActual = self->_stateOfChargeAtDestActual;
  self->_stateOfChargeAtDestActual = 0;

  waypoints = self->_waypoints;
  self->_waypoints = 0;

  evConsumptionModel = self->_evConsumptionModel;
  self->_evConsumptionModel = 0;

  evChargingModel = self->_evChargingModel;
  self->_evChargingModel = 0;

  currentFeedbackLogMessage = self->_currentFeedbackLogMessage;
  self->_currentFeedbackLogMessage = 0;

  isVLFImprovementUsed = self->_isVLFImprovementUsed;
  self->_isVLFImprovementUsed = 0;

  arWalkingUsedInRoutePlanning = self->_arWalkingUsedInRoutePlanning;
  self->_arWalkingUsedInRoutePlanning = 0;

  arWalkingUsedInNavigation = self->_arWalkingUsedInNavigation;
  self->_arWalkingUsedInNavigation = 0;

  self->_transportType = 4;
  isHandsFreeProfileUsed = self->_isHandsFreeProfileUsed;
  self->_isHandsFreeProfileUsed = 0;

  [(GEODirectionsFeedbackCollector *)self setCurrentDirectionsFeedback:0];
}

- (BOOL)hasActiveFeedbackSession
{
  v2 = [(GEODirectionsFeedbackCollector *)self currentFeedbackLogMessage];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_updateFeedbackSessionWithResponseID:(id)a3
{
  id v4 = a3;
  v6 = [(GEODirectionsFeedbackCollector *)self currentFeedbackLogMessage];
  if (!v6)
  {
    v6 = objc_alloc_init(GEODirectionsFeedbackLogMessage);
    -[GEODirectionsFeedbackCollector setCurrentFeedbackLogMessage:](self, "setCurrentFeedbackLogMessage:");
  }
  v5 = objc_alloc_init(GEODirectionsFeedback);
  [(GEODirectionsFeedback *)v5 setDirectionResponseID:v4];

  [(GEODirectionsFeedback *)v5 setIsCarplayConnected:self->_wasEverConnectedToCarplay];
  [(GEODirectionsFeedbackCollector *)self setCurrentDirectionsFeedback:v5];
  [(GEODirectionsFeedbackLogMessage *)v6 addDirectionsFeedback:v5];
}

- (void)startFeedbackSessionForResponseID:(id)a3 withNavigationType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(GEODirectionsFeedbackCollector *)self _updateFeedbackSessionWithResponseID:a3];
  self->_currentDirectionsModeStartTime = CFAbsoluteTimeGetCurrent();
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  navigationModes = self->_navigationModes;
  self->_navigationModes = v6;

  v8 = objc_alloc_init(GEODurationInNavigationMode);
  [(GEODurationInNavigationMode *)v8 setType:v4];
  [(NSMutableArray *)self->_navigationModes addObject:v8];
}

- (void)setOriginalExpectedTime:(double)a3
{
  self->_originalExpectedTime = a3;
}

- (void)setTripOrigin:(id)a3
{
}

- (void)setWasEverConnectedToCarplay:(BOOL)a3
{
  self->_wasEverConnectedToCarplay = a3;
  -[GEODirectionsFeedback setIsCarplayConnected:](self->_currentDirectionsFeedback, "setIsCarplayConnected:");
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (void)addGuidanceEventFeedback:(id)a3
{
  id v4 = a3;
  id v5 = [(GEODirectionsFeedbackCollector *)self currentDirectionsFeedback];
  [v5 addGuidanceFeedback:v4];
}

- (void)addStepFeedback:(id)a3
{
  id v4 = a3;
  id v5 = [(GEODirectionsFeedbackCollector *)self currentDirectionsFeedback];
  [v5 addStepFeedback:v4];
}

- (void)addRouteID:(id)a3 routeIndex:(unsigned int)a4 stepID:(unsigned int)a5 completeStep:(BOOL)a6
{
  if (a3)
  {
    uint64_t v6 = *(void *)&a5;
    if (a5 != -1)
    {
      BOOL v7 = a6;
      uint64_t v8 = *(void *)&a4;
      id v10 = a3;
      v12 = objc_alloc_init(GEOStepFeedback);
      [(GEOStepFeedback *)v12 setStepID:v6];
      [(GEOStepFeedback *)v12 setCompletionTimeStamp:CFAbsoluteTimeGetCurrent()];
      [(GEOStepFeedback *)v12 setCompletedStep:v7];
      [(GEOStepFeedback *)v12 setRouteID:v10];

      [(GEOStepFeedback *)v12 setRouteIndex:v8];
      v11 = [(GEODirectionsFeedbackCollector *)self currentDirectionsFeedback];
      [v11 addStepFeedback:v12];
    }
  }
}

- (void)addTrafficRerouteFeedback:(id)a3
{
  id v4 = a3;
  id v5 = [(GEODirectionsFeedbackCollector *)self currentDirectionsFeedback];
  [v5 addTrafficRerouteFeedback:v4];
}

- (void)setFinalLocation:(id)a3 asArrival:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  uint64_t v6 = [(GEODirectionsFeedbackCollector *)self currentDirectionsFeedback];
  if (v6)
  {
    BOOL v7 = (void *)v6;
    BOOL v8 = [(GEODirectionsFeedbackLogMessage *)self->_currentFeedbackLogMessage arrivedAtDestination];

    if (!v8)
    {
      [(GEODirectionsFeedbackLogMessage *)self->_currentFeedbackLogMessage setFinalLocation:v9];
      [(GEODirectionsFeedbackLogMessage *)self->_currentFeedbackLogMessage setArrivedAtDestination:v4];
    }
  }
}

- (void)setHasEnteredPreArrivalMode:(BOOL)a3
{
  self->_hasEnteredPreArrivalMode = a3;
}

- (void)addAlightNotificationFeedback:(id)a3
{
  id v4 = a3;
  id v5 = [(GEODirectionsFeedbackCollector *)self currentDirectionsFeedback];
  [v5 addAlightNotificationFeedback:v4];
}

- (void)setAudioFeedback:(GEONavigationAudioFeedback *)a3
{
  id v5 = [(GEODirectionsFeedbackCollector *)self currentDirectionsFeedback];

  if (a3)
  {
    if (v5)
    {
      long long v6 = *(_OWORD *)&a3->_manuallyChangedRouteCount;
      long long v7 = *(_OWORD *)&a3->_bTHFPAvailableAtEndOfNav;
      v8[0] = v6;
      *(_OWORD *)((char *)v8 + 12) = *(_OWORD *)&a3->_pauseSpokenAudioEnabled;
      [(GEODirectionsFeedbackLogMessage *)self->_currentFeedbackLogMessage setNavigationAudioFeedback:&v7];
    }
  }
}

- (void)setVoiceGuidanceLevel:(int)a3
{
  self->_voiceGuidanceLevel = a3;
}

- (void)setIsHandsFreeProfileUsed:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  isHandsFreeProfileUsed = self->_isHandsFreeProfileUsed;
  self->_isHandsFreeProfileUsed = v4;
}

- (void)setModalities:(id)a3
{
  id v4 = a3;
  id v5 = [(GEODirectionsFeedbackCollector *)self currentDirectionsFeedback];
  [v5 setModalitys:v4];
}

- (void)setIsVLFImprovementUsed:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  isVLFImprovementUsed = self->_isVLFImprovementUsed;
  self->_isVLFImprovementUsed = v4;
}

- (void)setARWalkingUsedInRoutePlanning:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  arWalkingUsedInRoutePlanning = self->_arWalkingUsedInRoutePlanning;
  self->_arWalkingUsedInRoutePlanning = v4;
}

- (void)setARWalkingUsedInNavigation:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  arWalkingUsedInNavigation = self->_arWalkingUsedInNavigation;
  self->_arWalkingUsedInNavigation = v4;
}

- (void)setChargingStopAdded:(BOOL)a3
{
  self->_chargingStopAdded = a3;
}

- (void)changeNavigationType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  double currentDirectionsModeStartTime = self->_currentDirectionsModeStartTime;
  double Current = CFAbsoluteTimeGetCurrent();
  self->_double currentDirectionsModeStartTime = Current;
  double v7 = Current - currentDirectionsModeStartTime;
  id v9 = [(NSMutableArray *)self->_navigationModes lastObject];
  [v9 setDuration:v7];
  BOOL v8 = objc_alloc_init(GEODurationInNavigationMode);
  [(GEODurationInNavigationMode *)v8 setType:v3];
  [(NSMutableArray *)self->_navigationModes addObject:v8];
}

- (void)setIsCoarseLocationUsed:(BOOL)a3
{
  self->_isCoarseLocationUsed = a3;
}

- (void)endFeedbackSessionWithTracePath:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!self->_currentFeedbackLogMessage) {
    goto LABEL_34;
  }
  v61 = v4;
  CFAbsoluteTime v6 = CFAbsoluteTimeGetCurrent() - self->_currentDirectionsModeStartTime;
  v60 = [(NSMutableArray *)self->_navigationModes lastObject];
  [v60 setDuration:v6];
  [(GEODirectionsFeedbackLogMessage *)self->_currentFeedbackLogMessage setDurationOfTrip:0.0];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  double v7 = self->_navigationModes;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v77 objects:v81 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v78 != v10) {
          objc_enumerationMutation(v7);
        }
        currentFeedbackLogMessage = self->_currentFeedbackLogMessage;
        [*(id *)(*((void *)&v77 + 1) + 8 * i) duration];
        double v14 = v13;
        [(GEODirectionsFeedbackLogMessage *)currentFeedbackLogMessage durationOfTrip];
        [(GEODirectionsFeedbackLogMessage *)currentFeedbackLogMessage setDurationOfTrip:v14 + v15];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v77 objects:v81 count:16];
    }
    while (v9);
  }

  stateOfChargeAtDestActual = self->_stateOfChargeAtDestActual;
  if (stateOfChargeAtDestActual && self->_stateOfChargeAtDestPredicted)
  {
    v17 = NSNumber;
    [(NSNumber *)stateOfChargeAtDestActual doubleValue];
    double v19 = v18;
    [(NSNumber *)self->_stateOfChargeAtDestPredicted doubleValue];
    uint64_t v21 = objc_msgSend(v17, "numberWithUnsignedInt:", vabdd_f64(v19, v20));
  }
  else
  {
    uint64_t v21 = 0;
  }
  id GEOAPPortalClass = getGEOAPPortalClass();
  v74 = [(GEODirectionsFeedbackLogMessage *)self->_currentFeedbackLogMessage directionsFeedbacks];
  v73 = [(GEODirectionsFeedbackLogMessage *)self->_currentFeedbackLogMessage finalLocation];
  arrivalLocation = self->_arrivalLocation;
  v72 = objc_msgSend(NSNumber, "numberWithBool:", -[GEODirectionsFeedbackLogMessage arrivedAtDestination](self->_currentFeedbackLogMessage, "arrivedAtDestination"));
  v22 = self->_currentFeedbackLogMessage;
  if (v22)
  {
    [(GEODirectionsFeedbackLogMessage *)v22 navigationAudioFeedback];
    v22 = self->_currentFeedbackLogMessage;
  }
  else
  {
    memset(v76, 0, 44);
  }
  v23 = NSNumber;
  [(GEODirectionsFeedbackLogMessage *)v22 durationOfTrip];
  v71 = objc_msgSend(v23, "numberWithDouble:");
  navigationModes = self->_navigationModes;
  v70 = [NSNumber numberWithBool:self->_hasEnteredPreArrivalMode];
  v69 = [NSNumber numberWithDouble:self->_originalExpectedTime];
  isVLFImprovementUsed = self->_isVLFImprovementUsed;
  v68 = [NSNumber numberWithBool:self->_isCoarseLocationUsed];
  v67 = [NSNumber numberWithBool:self->_batteryDied];
  v66 = [NSNumber numberWithBool:self->_chargingStopAdded];
  tripOrigin = self->_tripOrigin;
  BOOL isEVRoute = self->_isEVRoute;
  v75 = (void *)v21;
  if (self->_isEVRoute)
  {
    v64 = [NSNumber numberWithBool:self->_isBadEvExperience];
    if (self->_isEVRoute)
    {
      v63 = [NSNumber numberWithBool:self->_isBadEvExperience];
      if (self->_isEVRoute)
      {
        v62 = objc_msgSend(NSNumber, "numberWithBool:", -[GEODirectionsFeedbackCollector _canSampleBadEvTrip](self, "_canSampleBadEvTrip"));
        uint64_t v54 = 0;
        BOOL v52 = self->_isEVRoute;
      }
      else
      {
        BOOL v52 = 0;
        uint64_t v54 = 0x100000000;
        v62 = 0;
      }
      goto LABEL_23;
    }
    BOOL v52 = 0;
    v63 = 0;
  }
  else
  {
    BOOL v52 = 0;
    v63 = 0;
    v64 = 0;
  }
  v62 = 0;
  uint64_t v54 = 0x100000001;
LABEL_23:
  long long v51 = *(_OWORD *)&self->_stateOfChargeAtOrigin;
  v50 = self->_stateOfChargeAtDestActual;
  long long v49 = *(_OWORD *)&self->_waypoints;
  arWalkingUsedInRoutePlanning = self->_arWalkingUsedInRoutePlanning;
  evChargingModel = self->_evChargingModel;
  arWalkingUsedInNavigation = self->_arWalkingUsedInNavigation;
  int transportType = self->_transportType;
  int voiceGuidanceLevel = self->_voiceGuidanceLevel;
  isHandsFreeProfileUsed = self->_isHandsFreeProfileUsed;
  v43 = [NSNumber numberWithInt:self->_endReason == 1];
  v42 = [NSNumber numberWithInt:self->_endReason == 2];
  v65 = [NSNumber numberWithInt:self->_endReason == 3];
  v39 = [NSNumber numberWithInt:self->_endReason == 4];
  parkingDetectionLocation = self->_parkingDetectionLocation;
  v25 = [NSNumber numberWithDouble:self->_timeBetweenParkedAndArrival];
  v40 = [NSNumber numberWithUnsignedInteger:self->_arrivedAtDestinationCount];
  v38 = [NSNumber numberWithUnsignedInteger:self->_inParkingModeCount];
  v26 = [NSNumber numberWithBool:self->_enteredParkingMode];
  v27 = [NSNumber numberWithBool:self->_didSuggestWalkingRoute];
  v28 = [NSNumber numberWithBool:self->_userDidAcceptWalkingRoute];
  v29 = [NSNumber numberWithBool:self->_didSuggestFindMy];
  v30 = [NSNumber numberWithBool:self->_userDidLaunchFindMy];
  LODWORD(v37) = voiceGuidanceLevel;
  HIDWORD(v36) = transportType;
  LOBYTE(v36) = v52;
  objc_msgSend(GEOAPPortalClass, "captureDirectionsWithDirectionsFeedbacks:finalLocation:arrivalLocation:arrivedAtDestination:navigationAudioFeedback:durationOfTrip:durationInNavigationModes:preArrival:originalEta:isVlfImprovementUsed:isCoarseLocationUsed:acceptedCyclingWorkout:batteryDied:chargingStopAdded:isSiriEngaged:tripOrigin:wasBadRouteExperience:isBadEvExperience:isEvSampleTrip:stateOfChargeAtOrigin:stateOfChargeAtDestPredicted:stateOfChargeAtDestActual:stateOfChargeDiffAtDest:waypoints:evConsumptionModel:evChargingMode:isEVRoute:activeNavMode:arWalkingUsedInRoutePlanning:arWalkingUsedInNavigation:voiceGuidanceLevel:hFPEnabled:isEndRouteTermination:isParkedCarTermination:isTransitionToWalkingTermination:isTransitionToFindmyTermination:parkingDetectionLocation:timeBetweenParkedAndArrival:arrivedAtDestinationCount:inParkingModeCount:isInParkingMode:isSuggestToWalkingTriggered:isTransitedToWalking:isSuggestToFindmyTriggered:isTransitedToFindmy:", v74, v73, arrivalLocation, v72, v76, v71, navigationModes, v70, v69, isVLFImprovementUsed,
    v68,
    0,
    v67,
    v66,
    0,
    tripOrigin,
    v64,
    v63,
    v62,
    v51,
    v50,
    v75,
    v49,
    evChargingModel,
    v36,
    arWalkingUsedInRoutePlanning,
    arWalkingUsedInNavigation,
    v37,
    isHandsFreeProfileUsed,
    v43,
    v42,
    v65,
    v39,
    parkingDetectionLocation,
    v25,
    v40,
    v38,
    v26,
    v27,
    v28,
    v29,
    v30);

  if ((v54 & 0x100000000) == 0) {
  id v5 = v61;
  }
  if ((v54 & 1) == 0) {

  }
  if (isEVRoute) {
  v31 = +[GEOPlatform sharedPlatform];
  }
  int v32 = [v31 isInternalInstall];

  if (v32)
  {
    uint64_t Integer = GEOConfigGetInteger(GeoServicesConfig_EnableFullNavTraceLogMessages, (uint64_t)off_1E91138A8);
    if ([v61 length])
    {
      if (Integer == 1)
      {
        v34 = [MEMORY[0x1E4F28CB8] defaultManager];
        v35 = [v34 contentsAtPath:v61];

        [getGEOAPPortalClass() captureNavTraceWithNavTraceData:v35];
      }
    }
  }
  [(GEODirectionsFeedbackCollector *)self reset];

LABEL_34:
}

- (BOOL)_canSampleBadEvTrip
{
  if (self->_isEVRoute)
  {
    v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v3 = [v2 BOOLForKey:@"GEODirectionsFeedbackCollector_CanSampleBadEvTripKey"];

    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 setBool:v3 ^ 1u forKey:@"GEODirectionsFeedbackCollector_CanSampleBadEvTripKey"];
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)description
{
  return (id)[(GEODirectionsFeedbackLogMessage *)self->_currentFeedbackLogMessage formattedText];
}

- (GEODirectionsFeedbackLogMessage)currentFeedbackLogMessage
{
  return self->_currentFeedbackLogMessage;
}

- (void)setCurrentFeedbackLogMessage:(id)a3
{
}

- (GEODirectionsFeedback)currentDirectionsFeedback
{
  return self->_currentDirectionsFeedback;
}

- (void)setCurrentDirectionsFeedback:(id)a3
{
}

- (BOOL)batteryDied
{
  return self->_batteryDied;
}

- (void)setBatteryDied:(BOOL)a3
{
  self->_batteryDied = a3;
}

- (BOOL)isEVRoute
{
  return self->_isEVRoute;
}

- (void)setIsEVRoute:(BOOL)a3
{
  self->_BOOL isEVRoute = a3;
}

- (BOOL)isBadEvExperience
{
  return self->_isBadEvExperience;
}

- (void)setIsBadEvExperience:(BOOL)a3
{
  self->_isBadEvExperience = a3;
}

- (NSNumber)stateOfChargeAtOrigin
{
  return self->_stateOfChargeAtOrigin;
}

- (void)setStateOfChargeAtOrigin:(id)a3
{
}

- (NSNumber)stateOfChargeAtDestPredicted
{
  return self->_stateOfChargeAtDestPredicted;
}

- (void)setStateOfChargeAtDestPredicted:(id)a3
{
}

- (NSNumber)stateOfChargeAtDestActual
{
  return self->_stateOfChargeAtDestActual;
}

- (void)setStateOfChargeAtDestActual:(id)a3
{
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
}

- (NSString)evConsumptionModel
{
  return self->_evConsumptionModel;
}

- (void)setEvConsumptionModel:(id)a3
{
}

- (NSString)evChargingModel
{
  return self->_evChargingModel;
}

- (void)setEvChargingModel:(id)a3
{
}

- (double)timeBetweenParkedAndArrival
{
  return self->_timeBetweenParkedAndArrival;
}

- (void)setTimeBetweenParkedAndArrival:(double)a3
{
  self->_timeBetweenParkedAndArrival = a3;
}

- (unint64_t)arrivedAtDestinationCount
{
  return self->_arrivedAtDestinationCount;
}

- (void)setArrivedAtDestinationCount:(unint64_t)a3
{
  self->_arrivedAtDestinationCount = a3;
}

- (unint64_t)inParkingModeCount
{
  return self->_inParkingModeCount;
}

- (void)setInParkingModeCount:(unint64_t)a3
{
  self->_inParkingModeCount = a3;
}

- (BOOL)enteredParkingMode
{
  return self->_enteredParkingMode;
}

- (void)setEnteredParkingMode:(BOOL)a3
{
  self->_enteredParkingMode = a3;
}

- (BOOL)didSuggestWalkingRoute
{
  return self->_didSuggestWalkingRoute;
}

- (void)setDidSuggestWalkingRoute:(BOOL)a3
{
  self->_didSuggestWalkingRoute = a3;
}

- (BOOL)userDidAcceptWalkingRoute
{
  return self->_userDidAcceptWalkingRoute;
}

- (void)setUserDidAcceptWalkingRoute:(BOOL)a3
{
  self->_userDidAcceptWalkingRoute = a3;
}

- (BOOL)didSuggestFindMy
{
  return self->_didSuggestFindMy;
}

- (void)setDidSuggestFindMy:(BOOL)a3
{
  self->_didSuggestFindMy = a3;
}

- (BOOL)userDidLaunchFindMy
{
  return self->_userDidLaunchFindMy;
}

- (void)setUserDidLaunchFindMy:(BOOL)a3
{
  self->_userDidLaunchFindMy = a3;
}

- (int64_t)endReason
{
  return self->_endReason;
}

- (void)setEndReason:(int64_t)a3
{
  self->_endReason = a3;
}

- (GEOLocation)parkingDetectionLocation
{
  return self->_parkingDetectionLocation;
}

- (void)setParkingDetectionLocation:(id)a3
{
}

- (GEOLocation)arrivalLocation
{
  return self->_arrivalLocation;
}

- (void)setArrivalLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalLocation, 0);
  objc_storeStrong((id *)&self->_parkingDetectionLocation, 0);
  objc_storeStrong((id *)&self->_isHandsFreeProfileUsed, 0);
  objc_storeStrong((id *)&self->_evChargingModel, 0);
  objc_storeStrong((id *)&self->_evConsumptionModel, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_stateOfChargeAtDestActual, 0);
  objc_storeStrong((id *)&self->_stateOfChargeAtDestPredicted, 0);
  objc_storeStrong((id *)&self->_stateOfChargeAtOrigin, 0);
  objc_storeStrong((id *)&self->_arWalkingUsedInNavigation, 0);
  objc_storeStrong((id *)&self->_arWalkingUsedInRoutePlanning, 0);
  objc_storeStrong((id *)&self->_isVLFImprovementUsed, 0);
  objc_storeStrong((id *)&self->_tripOrigin, 0);
  objc_storeStrong((id *)&self->_navigationModes, 0);
  objc_storeStrong((id *)&self->_currentFeedbackLogMessage, 0);

  objc_storeStrong((id *)&self->_currentDirectionsFeedback, 0);
}

@end