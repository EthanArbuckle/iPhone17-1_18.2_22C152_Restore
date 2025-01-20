@interface GEOLogMsgEventDirections
+ (BOOL)isValid:(id)a3;
+ (Class)directionsFeedbackType;
+ (Class)durationInNavigationModeType;
+ (Class)waypointsType;
- (BOOL)acceptedCyclingWorkout;
- (BOOL)arWalkingUsedInNavigation;
- (BOOL)arWalkingUsedInRoutePlanning;
- (BOOL)arrivedAtDestination;
- (BOOL)batteryDied;
- (BOOL)chargingStopAdded;
- (BOOL)hFPEnabled;
- (BOOL)hasAcceptedCyclingWorkout;
- (BOOL)hasActiveNavMode;
- (BOOL)hasArWalkingUsedInNavigation;
- (BOOL)hasArWalkingUsedInRoutePlanning;
- (BOOL)hasArrivalLocation;
- (BOOL)hasArrivedAtDestination;
- (BOOL)hasArrivedAtDestinationCount;
- (BOOL)hasBatteryDied;
- (BOOL)hasChargingStopAdded;
- (BOOL)hasDurationOfTrip;
- (BOOL)hasEvChargingMode;
- (BOOL)hasEvConsumptionModel;
- (BOOL)hasFinalLocation;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHFPEnabled;
- (BOOL)hasInParkingModeCount;
- (BOOL)hasIsBadEvExperience;
- (BOOL)hasIsCoarseLocationUsed;
- (BOOL)hasIsCyclingNlgAvailable;
- (BOOL)hasIsEndRouteTermination;
- (BOOL)hasIsEvSampleTrip;
- (BOOL)hasIsInParkingMode;
- (BOOL)hasIsParkedCarTermination;
- (BOOL)hasIsSiriEngaged;
- (BOOL)hasIsSuggestToFindmyTriggered;
- (BOOL)hasIsSuggestToWalkingTriggered;
- (BOOL)hasIsTransitedToFindmy;
- (BOOL)hasIsTransitedToWalking;
- (BOOL)hasIsTransitionToFindmyTermination;
- (BOOL)hasIsTransitionToWalkingTermination;
- (BOOL)hasIsVlfImprovementUsed;
- (BOOL)hasNavSessionId;
- (BOOL)hasNavigationAudioFeedback;
- (BOOL)hasOriginalEta;
- (BOOL)hasParkingDetectionLocation;
- (BOOL)hasPreArrival;
- (BOOL)hasStateOfChargeAtDestActual;
- (BOOL)hasStateOfChargeAtDestPredicted;
- (BOOL)hasStateOfChargeAtOrigin;
- (BOOL)hasStateOfChargeDiffAtDest;
- (BOOL)hasTimeBetweenParkedAndArrival;
- (BOOL)hasTripOrigin;
- (BOOL)hasVoiceGuidanceLevel;
- (BOOL)isBadEvExperience;
- (BOOL)isCoarseLocationUsed;
- (BOOL)isCyclingNlgAvailable;
- (BOOL)isEndRouteTermination;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEvSampleTrip;
- (BOOL)isInParkingMode;
- (BOOL)isParkedCarTermination;
- (BOOL)isSiriEngaged;
- (BOOL)isSuggestToFindmyTriggered;
- (BOOL)isSuggestToWalkingTriggered;
- (BOOL)isTransitedToFindmy;
- (BOOL)isTransitedToWalking;
- (BOOL)isTransitionToFindmyTermination;
- (BOOL)isTransitionToWalkingTermination;
- (BOOL)isVlfImprovementUsed;
- (BOOL)preArrival;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)tripOrigin;
- (GEOLocation)arrivalLocation;
- (GEOLocation)finalLocation;
- (GEOLocation)parkingDetectionLocation;
- (GEOLogMsgEventDirections)init;
- (GEOLogMsgEventDirections)initWithData:(id)a3;
- (GEOLogMsgEventDirections)initWithDictionary:(id)a3;
- (GEOLogMsgEventDirections)initWithJSON:(id)a3;
- (GEONavigationAudioFeedback)navigationAudioFeedback;
- (GEOSessionID)navSessionId;
- (NSMutableArray)directionsFeedbacks;
- (NSMutableArray)durationInNavigationModes;
- (NSMutableArray)waypoints;
- (NSString)evChargingMode;
- (NSString)evConsumptionModel;
- (double)durationOfTrip;
- (double)timeBetweenParkedAndArrival;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)activeNavModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)directionsFeedbackAtIndex:(unint64_t)a3;
- (id)durationInNavigationModeAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)voiceGuidanceLevelAsString:(int)a3;
- (id)waypointsAtIndex:(unint64_t)a3;
- (int)StringAsActiveNavMode:(id)a3;
- (int)StringAsVoiceGuidanceLevel:(id)a3;
- (int)activeNavMode;
- (int)voiceGuidanceLevel;
- (unint64_t)directionsFeedbacksCount;
- (unint64_t)durationInNavigationModesCount;
- (unint64_t)hash;
- (unint64_t)waypointsCount;
- (unsigned)arrivedAtDestinationCount;
- (unsigned)inParkingModeCount;
- (unsigned)originalEta;
- (unsigned)stateOfChargeAtDestActual;
- (unsigned)stateOfChargeAtDestPredicted;
- (unsigned)stateOfChargeAtOrigin;
- (unsigned)stateOfChargeDiffAtDest;
- (void)_addNoFlagsDirectionsFeedback:(uint64_t)a1;
- (void)_addNoFlagsDurationInNavigationMode:(uint64_t)a1;
- (void)_addNoFlagsWaypoints:(uint64_t)a1;
- (void)_readArrivalLocation;
- (void)_readDirectionsFeedbacks;
- (void)_readDurationInNavigationModes;
- (void)_readEvChargingMode;
- (void)_readEvConsumptionModel;
- (void)_readFinalLocation;
- (void)_readParkingDetectionLocation;
- (void)_readTripOrigin;
- (void)_readWaypoints;
- (void)addDirectionsFeedback:(id)a3;
- (void)addDurationInNavigationMode:(id)a3;
- (void)addWaypoints:(id)a3;
- (void)clearDirectionsFeedbacks;
- (void)clearDurationInNavigationModes;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearWaypoints;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAcceptedCyclingWorkout:(BOOL)a3;
- (void)setActiveNavMode:(int)a3;
- (void)setArWalkingUsedInNavigation:(BOOL)a3;
- (void)setArWalkingUsedInRoutePlanning:(BOOL)a3;
- (void)setArrivalLocation:(id)a3;
- (void)setArrivedAtDestination:(BOOL)a3;
- (void)setArrivedAtDestinationCount:(unsigned int)a3;
- (void)setBatteryDied:(BOOL)a3;
- (void)setChargingStopAdded:(BOOL)a3;
- (void)setDirectionsFeedbacks:(id)a3;
- (void)setDurationInNavigationModes:(id)a3;
- (void)setDurationOfTrip:(double)a3;
- (void)setEvChargingMode:(id)a3;
- (void)setEvConsumptionModel:(id)a3;
- (void)setFinalLocation:(id)a3;
- (void)setHFPEnabled:(BOOL)a3;
- (void)setHasAcceptedCyclingWorkout:(BOOL)a3;
- (void)setHasActiveNavMode:(BOOL)a3;
- (void)setHasArWalkingUsedInNavigation:(BOOL)a3;
- (void)setHasArWalkingUsedInRoutePlanning:(BOOL)a3;
- (void)setHasArrivedAtDestination:(BOOL)a3;
- (void)setHasArrivedAtDestinationCount:(BOOL)a3;
- (void)setHasBatteryDied:(BOOL)a3;
- (void)setHasChargingStopAdded:(BOOL)a3;
- (void)setHasDurationOfTrip:(BOOL)a3;
- (void)setHasHFPEnabled:(BOOL)a3;
- (void)setHasInParkingModeCount:(BOOL)a3;
- (void)setHasIsBadEvExperience:(BOOL)a3;
- (void)setHasIsCoarseLocationUsed:(BOOL)a3;
- (void)setHasIsCyclingNlgAvailable:(BOOL)a3;
- (void)setHasIsEndRouteTermination:(BOOL)a3;
- (void)setHasIsEvSampleTrip:(BOOL)a3;
- (void)setHasIsInParkingMode:(BOOL)a3;
- (void)setHasIsParkedCarTermination:(BOOL)a3;
- (void)setHasIsSiriEngaged:(BOOL)a3;
- (void)setHasIsSuggestToFindmyTriggered:(BOOL)a3;
- (void)setHasIsSuggestToWalkingTriggered:(BOOL)a3;
- (void)setHasIsTransitedToFindmy:(BOOL)a3;
- (void)setHasIsTransitedToWalking:(BOOL)a3;
- (void)setHasIsTransitionToFindmyTermination:(BOOL)a3;
- (void)setHasIsTransitionToWalkingTermination:(BOOL)a3;
- (void)setHasIsVlfImprovementUsed:(BOOL)a3;
- (void)setHasNavSessionId:(BOOL)a3;
- (void)setHasNavigationAudioFeedback:(BOOL)a3;
- (void)setHasOriginalEta:(BOOL)a3;
- (void)setHasPreArrival:(BOOL)a3;
- (void)setHasStateOfChargeAtDestActual:(BOOL)a3;
- (void)setHasStateOfChargeAtDestPredicted:(BOOL)a3;
- (void)setHasStateOfChargeAtOrigin:(BOOL)a3;
- (void)setHasStateOfChargeDiffAtDest:(BOOL)a3;
- (void)setHasTimeBetweenParkedAndArrival:(BOOL)a3;
- (void)setHasVoiceGuidanceLevel:(BOOL)a3;
- (void)setInParkingModeCount:(unsigned int)a3;
- (void)setIsBadEvExperience:(BOOL)a3;
- (void)setIsCoarseLocationUsed:(BOOL)a3;
- (void)setIsCyclingNlgAvailable:(BOOL)a3;
- (void)setIsEndRouteTermination:(BOOL)a3;
- (void)setIsEvSampleTrip:(BOOL)a3;
- (void)setIsInParkingMode:(BOOL)a3;
- (void)setIsParkedCarTermination:(BOOL)a3;
- (void)setIsSiriEngaged:(BOOL)a3;
- (void)setIsSuggestToFindmyTriggered:(BOOL)a3;
- (void)setIsSuggestToWalkingTriggered:(BOOL)a3;
- (void)setIsTransitedToFindmy:(BOOL)a3;
- (void)setIsTransitedToWalking:(BOOL)a3;
- (void)setIsTransitionToFindmyTermination:(BOOL)a3;
- (void)setIsTransitionToWalkingTermination:(BOOL)a3;
- (void)setIsVlfImprovementUsed:(BOOL)a3;
- (void)setNavSessionId:(GEOSessionID)a3;
- (void)setNavigationAudioFeedback:(GEONavigationAudioFeedback *)a3;
- (void)setOriginalEta:(unsigned int)a3;
- (void)setParkingDetectionLocation:(id)a3;
- (void)setPreArrival:(BOOL)a3;
- (void)setStateOfChargeAtDestActual:(unsigned int)a3;
- (void)setStateOfChargeAtDestPredicted:(unsigned int)a3;
- (void)setStateOfChargeAtOrigin:(unsigned int)a3;
- (void)setStateOfChargeDiffAtDest:(unsigned int)a3;
- (void)setTimeBetweenParkedAndArrival:(double)a3;
- (void)setTripOrigin:(id)a3;
- (void)setVoiceGuidanceLevel:(int)a3;
- (void)setWaypoints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventDirections

- (void)_readArrivalLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 244) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArrivalLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v109 = 0;
    goto LABEL_209;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([*(id *)(a1 + 88) count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    id v6 = *(id *)(a1 + 88);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v145 objects:v151 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v146;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v146 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v145 + 1) + 8 * i);
          if (a2) {
            [v11 jsonRepresentation];
          }
          else {
          id v12 = [v11 dictionaryRepresentation];
          }

          [v5 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v145 objects:v151 count:16];
      }
      while (v8);
    }

    if (a2) {
      v13 = @"directionsFeedback";
    }
    else {
      v13 = @"directions_feedback";
    }
    [v4 setObject:v5 forKey:v13];
  }
  v14 = [(id)a1 finalLocation];
  v15 = v14;
  if (v14)
  {
    if (a2)
    {
      v16 = [v14 jsonRepresentation];
      v17 = @"finalLocation";
    }
    else
    {
      v16 = [v14 dictionaryRepresentation];
      v17 = @"final_location";
    }
    id v18 = v16;

    [v4 setObject:v18 forKey:v17];
  }

  uint64_t v19 = *(void *)(a1 + 240);
  if ((v19 & 0x20000) != 0)
  {
    v39 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 220)];
    if (a2) {
      v40 = @"arrivedAtDestination";
    }
    else {
      v40 = @"arrived_at_destination";
    }
    [v4 setObject:v39 forKey:v40];

    uint64_t v19 = *(void *)(a1 + 240);
    if ((v19 & 1) == 0)
    {
LABEL_24:
      if ((v19 & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_69;
    }
  }
  else if ((v19 & 1) == 0)
  {
    goto LABEL_24;
  }
  if (a2) {
    v41 = @"navigationAudioFeedback";
  }
  else {
    v41 = @"navigation_audio_feedback";
  }
  _GEONavigationAudioFeedbackDictionaryRepresentation((unsigned __int8 *)(a1 + 16), a2);
  id v42 = (id)objc_claimAutoreleasedReturnValue();

  [v4 setObject:v42 forKey:v41];
  uint64_t v19 = *(void *)(a1 + 240);
  if ((v19 & 4) == 0)
  {
LABEL_25:
    if ((v19 & 2) == 0) {
      goto LABEL_30;
    }
    goto LABEL_26;
  }
LABEL_69:
  v43 = [NSNumber numberWithDouble:*(double *)(a1 + 104)];
  if (a2) {
    v44 = @"durationOfTrip";
  }
  else {
    v44 = @"duration_of_trip";
  }
  [v4 setObject:v43 forKey:v44];

  if ((*(void *)(a1 + 240) & 2) != 0)
  {
LABEL_26:
    v20 = _GEOSessionIDDictionaryRepresentation((void *)(a1 + 64));
    if (a2) {
      v21 = @"navSessionId";
    }
    else {
      v21 = @"nav_session_id";
    }
    id v22 = v20;

    [v4 setObject:v22 forKey:v21];
  }
LABEL_30:
  if ([*(id *)(a1 + 96) count])
  {
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    long long v141 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    id v24 = *(id *)(a1 + 96);
    uint64_t v25 = [v24 countByEnumeratingWithState:&v141 objects:v150 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v142;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v142 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v141 + 1) + 8 * j);
          if (a2) {
            [v29 jsonRepresentation];
          }
          else {
          id v30 = [v29 dictionaryRepresentation];
          }

          [v23 addObject:v30];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v141 objects:v150 count:16];
      }
      while (v26);
    }

    if (a2) {
      v31 = @"durationInNavigationMode";
    }
    else {
      v31 = @"duration_in_navigation_mode";
    }
    [v4 setObject:v23 forKey:v31];
  }
  uint64_t v32 = *(void *)(a1 + 240);
  if ((v32 & 0x80) != 0)
  {
    v45 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 192)];
    if (a2) {
      v46 = @"originalEta";
    }
    else {
      v46 = @"original_eta";
    }
    [v4 setObject:v45 forKey:v46];

    uint64_t v32 = *(void *)(a1 + 240);
    if ((v32 & 0x800000000) == 0)
    {
LABEL_47:
      if ((v32 & 0x400000) == 0) {
        goto LABEL_48;
      }
      goto LABEL_82;
    }
  }
  else if ((v32 & 0x800000000) == 0)
  {
    goto LABEL_47;
  }
  v47 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 238)];
  if (a2) {
    v48 = @"preArrival";
  }
  else {
    v48 = @"pre_arrival";
  }
  [v4 setObject:v47 forKey:v48];

  uint64_t v32 = *(void *)(a1 + 240);
  if ((v32 & 0x400000) == 0)
  {
LABEL_48:
    if ((v32 & 0x200000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_86;
  }
LABEL_82:
  v49 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 225)];
  if (a2) {
    v50 = @"isCyclingNlgAvailable";
  }
  else {
    v50 = @"is_cycling_nlg_available";
  }
  [v4 setObject:v49 forKey:v50];

  uint64_t v32 = *(void *)(a1 + 240);
  if ((v32 & 0x200000) == 0)
  {
LABEL_49:
    if ((v32 & 0x400000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_90;
  }
LABEL_86:
  v51 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 224)];
  if (a2) {
    v52 = @"isCoarseLocationUsed";
  }
  else {
    v52 = @"is_coarse_location_used";
  }
  [v4 setObject:v51 forKey:v52];

  uint64_t v32 = *(void *)(a1 + 240);
  if ((v32 & 0x400000000) == 0)
  {
LABEL_50:
    if ((v32 & 0x4000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_94;
  }
LABEL_90:
  v53 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 237)];
  if (a2) {
    v54 = @"isVlfImprovementUsed";
  }
  else {
    v54 = @"is_vlf_improvement_used";
  }
  [v4 setObject:v53 forKey:v54];

  uint64_t v32 = *(void *)(a1 + 240);
  if ((v32 & 0x4000) == 0)
  {
LABEL_51:
    if ((v32 & 0x40000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_98;
  }
LABEL_94:
  v55 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 217)];
  if (a2) {
    v56 = @"acceptedCyclingWorkout";
  }
  else {
    v56 = @"accepted_cycling_workout";
  }
  [v4 setObject:v55 forKey:v56];

  uint64_t v32 = *(void *)(a1 + 240);
  if ((v32 & 0x40000) == 0)
  {
LABEL_52:
    if ((v32 & 0x80000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_102;
  }
LABEL_98:
  v57 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 221)];
  if (a2) {
    v58 = @"batteryDied";
  }
  else {
    v58 = @"battery_died";
  }
  [v4 setObject:v57 forKey:v58];

  uint64_t v32 = *(void *)(a1 + 240);
  if ((v32 & 0x80000) == 0)
  {
LABEL_53:
    if ((v32 & 0x8000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_54;
  }
LABEL_102:
  v59 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 222)];
  if (a2) {
    v60 = @"chargingStopAdded";
  }
  else {
    v60 = @"charging_stop_added";
  }
  [v4 setObject:v59 forKey:v60];

  if ((*(void *)(a1 + 240) & 0x8000000) != 0)
  {
LABEL_54:
    v33 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 230)];
    if (a2) {
      v34 = @"isSiriEngaged";
    }
    else {
      v34 = @"is_siri_engaged";
    }
    [v4 setObject:v33 forKey:v34];
  }
LABEL_58:
  v35 = [(id)a1 tripOrigin];
  v36 = v35;
  if (v35)
  {
    if (a2)
    {
      v37 = [v35 jsonRepresentation];
      v38 = @"tripOrigin";
    }
    else
    {
      v37 = [v35 dictionaryRepresentation];
      v38 = @"trip_origin";
    }
    id v61 = v37;

    [v4 setObject:v61 forKey:v38];
  }

  uint64_t v62 = *(void *)(a1 + 240);
  if ((v62 & 0x100000) != 0)
  {
    v84 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 223)];
    if (a2) {
      v85 = @"isBadEvExperience";
    }
    else {
      v85 = @"is_bad_ev_experience";
    }
    [v4 setObject:v84 forKey:v85];

    uint64_t v62 = *(void *)(a1 + 240);
    if ((v62 & 0x1000000) == 0)
    {
LABEL_111:
      if ((v62 & 0x400) == 0) {
        goto LABEL_112;
      }
      goto LABEL_170;
    }
  }
  else if ((v62 & 0x1000000) == 0)
  {
    goto LABEL_111;
  }
  v86 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 227)];
  if (a2) {
    v87 = @"isEvSampleTrip";
  }
  else {
    v87 = @"is_ev_sample_trip";
  }
  [v4 setObject:v86 forKey:v87];

  uint64_t v62 = *(void *)(a1 + 240);
  if ((v62 & 0x400) == 0)
  {
LABEL_112:
    if ((v62 & 0x200) == 0) {
      goto LABEL_113;
    }
    goto LABEL_174;
  }
LABEL_170:
  v88 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 204)];
  if (a2) {
    v89 = @"stateOfChargeAtOrigin";
  }
  else {
    v89 = @"state_of_charge_at_origin";
  }
  [v4 setObject:v88 forKey:v89];

  uint64_t v62 = *(void *)(a1 + 240);
  if ((v62 & 0x200) == 0)
  {
LABEL_113:
    if ((v62 & 0x100) == 0) {
      goto LABEL_114;
    }
    goto LABEL_178;
  }
LABEL_174:
  v90 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 200)];
  if (a2) {
    v91 = @"stateOfChargeAtDestPredicted";
  }
  else {
    v91 = @"state_of_charge_at_dest_predicted";
  }
  [v4 setObject:v90 forKey:v91];

  uint64_t v62 = *(void *)(a1 + 240);
  if ((v62 & 0x100) == 0)
  {
LABEL_114:
    if ((v62 & 0x800) == 0) {
      goto LABEL_119;
    }
    goto LABEL_115;
  }
LABEL_178:
  v92 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 196)];
  if (a2) {
    v93 = @"stateOfChargeAtDestActual";
  }
  else {
    v93 = @"state_of_charge_at_dest_actual";
  }
  [v4 setObject:v92 forKey:v93];

  if ((*(void *)(a1 + 240) & 0x800) != 0)
  {
LABEL_115:
    v63 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 208)];
    if (a2) {
      v64 = @"stateOfChargeDiffAtDest";
    }
    else {
      v64 = @"state_of_charge_diff_at_dest";
    }
    [v4 setObject:v63 forKey:v64];
  }
LABEL_119:
  if ([*(id *)(a1 + 160) count])
  {
    v65 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 160), "count"));
    long long v137 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    id v66 = *(id *)(a1 + 160);
    uint64_t v67 = [v66 countByEnumeratingWithState:&v137 objects:v149 count:16];
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = *(void *)v138;
      do
      {
        for (uint64_t k = 0; k != v68; ++k)
        {
          if (*(void *)v138 != v69) {
            objc_enumerationMutation(v66);
          }
          v71 = *(void **)(*((void *)&v137 + 1) + 8 * k);
          if (a2) {
            [v71 jsonRepresentation];
          }
          else {
          id v72 = [v71 dictionaryRepresentation];
          }

          [v65 addObject:v72];
        }
        uint64_t v68 = [v66 countByEnumeratingWithState:&v137 objects:v149 count:16];
      }
      while (v68);
    }

    [v4 setObject:v65 forKey:@"waypoints"];
  }
  v73 = [(id)a1 evConsumptionModel];
  if (v73)
  {
    if (a2) {
      v74 = @"evConsumptionModel";
    }
    else {
      v74 = @"ev_consumption_model";
    }
    [v4 setObject:v73 forKey:v74];
  }

  v75 = [(id)a1 evChargingMode];
  if (v75)
  {
    if (a2) {
      v76 = @"evChargingMode";
    }
    else {
      v76 = @"ev_charging_mode";
    }
    [v4 setObject:v75 forKey:v76];
  }

  uint64_t v77 = *(void *)(a1 + 240);
  if ((v77 & 0x10) != 0)
  {
    uint64_t v94 = *(int *)(a1 + 180);
    if (v94 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 180));
      v95 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v95 = off_1E53F8018[v94];
    }
    if (a2) {
      v111 = @"activeNavMode";
    }
    else {
      v111 = @"active_nav_mode";
    }
    [v4 setObject:v95 forKey:v111];

    uint64_t v77 = *(void *)(a1 + 240);
    if ((v77 & 0x10000) == 0)
    {
LABEL_143:
      if ((v77 & 0x8000) == 0) {
        goto LABEL_144;
      }
      goto LABEL_221;
    }
  }
  else if ((v77 & 0x10000) == 0)
  {
    goto LABEL_143;
  }
  v112 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 219)];
  if (a2) {
    v113 = @"arWalkingUsedInRoutePlanning";
  }
  else {
    v113 = @"ar_walking_used_in_route_planning";
  }
  [v4 setObject:v112 forKey:v113];

  uint64_t v77 = *(void *)(a1 + 240);
  if ((v77 & 0x8000) == 0)
  {
LABEL_144:
    if ((v77 & 0x1000) == 0) {
      goto LABEL_145;
    }
    goto LABEL_225;
  }
LABEL_221:
  v114 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 218)];
  if (a2) {
    v115 = @"arWalkingUsedInNavigation";
  }
  else {
    v115 = @"ar_walking_used_in_navigation";
  }
  [v4 setObject:v114 forKey:v115];

  uint64_t v77 = *(void *)(a1 + 240);
  if ((v77 & 0x1000) == 0)
  {
LABEL_145:
    if ((v77 & 0x2000) == 0) {
      goto LABEL_146;
    }
    goto LABEL_232;
  }
LABEL_225:
  uint64_t v116 = *(int *)(a1 + 212);
  if (v116 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 212));
    v117 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v117 = off_1E53F85D8[v116];
  }
  if (a2) {
    v118 = @"voiceGuidanceLevel";
  }
  else {
    v118 = @"voice_guidance_level";
  }
  [v4 setObject:v117 forKey:v118];

  uint64_t v77 = *(void *)(a1 + 240);
  if ((v77 & 0x2000) == 0)
  {
LABEL_146:
    if ((v77 & 0x2000000) == 0) {
      goto LABEL_147;
    }
    goto LABEL_236;
  }
LABEL_232:
  v119 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 216)];
  if (a2) {
    v120 = @"hFPEnabled";
  }
  else {
    v120 = @"HFP_enabled";
  }
  [v4 setObject:v119 forKey:v120];

  uint64_t v77 = *(void *)(a1 + 240);
  if ((v77 & 0x2000000) == 0)
  {
LABEL_147:
    if ((v77 & 0x20000000) == 0) {
      goto LABEL_148;
    }
    goto LABEL_240;
  }
LABEL_236:
  v121 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 228)];
  if (a2) {
    v122 = @"isInParkingMode";
  }
  else {
    v122 = @"is_in_parking_mode";
  }
  [v4 setObject:v121 forKey:v122];

  uint64_t v77 = *(void *)(a1 + 240);
  if ((v77 & 0x20000000) == 0)
  {
LABEL_148:
    if ((v77 & 0x80000000) == 0) {
      goto LABEL_149;
    }
    goto LABEL_244;
  }
LABEL_240:
  v123 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 232)];
  if (a2) {
    v124 = @"isSuggestToWalkingTriggered";
  }
  else {
    v124 = @"is_suggest_to_walking_triggered";
  }
  [v4 setObject:v123 forKey:v124];

  uint64_t v77 = *(void *)(a1 + 240);
  if ((v77 & 0x80000000) == 0)
  {
LABEL_149:
    if ((v77 & 0x10000000) == 0) {
      goto LABEL_150;
    }
    goto LABEL_248;
  }
LABEL_244:
  v125 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 234)];
  if (a2) {
    v126 = @"isTransitedToWalking";
  }
  else {
    v126 = @"is_transited_to_walking";
  }
  [v4 setObject:v125 forKey:v126];

  uint64_t v77 = *(void *)(a1 + 240);
  if ((v77 & 0x10000000) == 0)
  {
LABEL_150:
    if ((v77 & 0x40000000) == 0) {
      goto LABEL_151;
    }
    goto LABEL_252;
  }
LABEL_248:
  v127 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 231)];
  if (a2) {
    v128 = @"isSuggestToFindmyTriggered";
  }
  else {
    v128 = @"is_suggest_to_findmy_triggered";
  }
  [v4 setObject:v127 forKey:v128];

  uint64_t v77 = *(void *)(a1 + 240);
  if ((v77 & 0x40000000) == 0)
  {
LABEL_151:
    if ((v77 & 0x800000) == 0) {
      goto LABEL_152;
    }
    goto LABEL_256;
  }
LABEL_252:
  v129 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 233)];
  if (a2) {
    v130 = @"isTransitedToFindmy";
  }
  else {
    v130 = @"is_transited_to_findmy";
  }
  [v4 setObject:v129 forKey:v130];

  uint64_t v77 = *(void *)(a1 + 240);
  if ((v77 & 0x800000) == 0)
  {
LABEL_152:
    if ((v77 & 0x4000000) == 0) {
      goto LABEL_153;
    }
    goto LABEL_260;
  }
LABEL_256:
  v131 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 226)];
  if (a2) {
    v132 = @"isEndRouteTermination";
  }
  else {
    v132 = @"is_end_route_termination";
  }
  [v4 setObject:v131 forKey:v132];

  uint64_t v77 = *(void *)(a1 + 240);
  if ((v77 & 0x4000000) == 0)
  {
LABEL_153:
    if ((v77 & 0x200000000) == 0) {
      goto LABEL_154;
    }
    goto LABEL_264;
  }
LABEL_260:
  v133 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 229)];
  if (a2) {
    v134 = @"isParkedCarTermination";
  }
  else {
    v134 = @"is_parked_car_termination";
  }
  [v4 setObject:v133 forKey:v134];

  uint64_t v77 = *(void *)(a1 + 240);
  if ((v77 & 0x200000000) == 0)
  {
LABEL_154:
    if ((v77 & 0x100000000) == 0) {
      goto LABEL_159;
    }
    goto LABEL_155;
  }
LABEL_264:
  v135 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 236)];
  if (a2) {
    v136 = @"isTransitionToWalkingTermination";
  }
  else {
    v136 = @"is_transition_to_walking_termination";
  }
  [v4 setObject:v135 forKey:v136];

  if ((*(void *)(a1 + 240) & 0x100000000) != 0)
  {
LABEL_155:
    v78 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 235)];
    if (a2) {
      v79 = @"isTransitionToFindmyTermination";
    }
    else {
      v79 = @"is_transition_to_findmy_termination";
    }
    [v4 setObject:v78 forKey:v79];
  }
LABEL_159:
  v80 = [(id)a1 parkingDetectionLocation];
  v81 = v80;
  if (v80)
  {
    if (a2)
    {
      v82 = [v80 jsonRepresentation];
      v83 = @"parkingDetectionLocation";
    }
    else
    {
      v82 = [v80 dictionaryRepresentation];
      v83 = @"parking_detection_location";
    }
    id v96 = v82;

    [v4 setObject:v96 forKey:v83];
  }

  uint64_t v97 = *(void *)(a1 + 240);
  if ((v97 & 8) == 0)
  {
    if ((v97 & 0x20) == 0) {
      goto LABEL_189;
    }
LABEL_201:
    v106 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 184)];
    if (a2) {
      v107 = @"arrivedAtDestinationCount";
    }
    else {
      v107 = @"arrived_at_destination_count";
    }
    [v4 setObject:v106 forKey:v107];

    if ((*(void *)(a1 + 240) & 0x40) == 0) {
      goto LABEL_194;
    }
    goto LABEL_190;
  }
  v104 = [NSNumber numberWithDouble:*(double *)(a1 + 144)];
  if (a2) {
    v105 = @"timeBetweenParkedAndArrival";
  }
  else {
    v105 = @"time_between_parked_and_arrival";
  }
  [v4 setObject:v104 forKey:v105];

  uint64_t v97 = *(void *)(a1 + 240);
  if ((v97 & 0x20) != 0) {
    goto LABEL_201;
  }
LABEL_189:
  if ((v97 & 0x40) != 0)
  {
LABEL_190:
    v98 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 188)];
    if (a2) {
      v99 = @"inParkingModeCount";
    }
    else {
      v99 = @"in_parking_mode_count";
    }
    [v4 setObject:v98 forKey:v99];
  }
LABEL_194:
  v100 = [(id)a1 arrivalLocation];
  v101 = v100;
  if (v100)
  {
    if (a2)
    {
      v102 = [v100 jsonRepresentation];
      v103 = @"arrivalLocation";
    }
    else
    {
      v102 = [v100 dictionaryRepresentation];
      v103 = @"arrival_location";
    }
    id v108 = v102;

    [v4 setObject:v108 forKey:v103];
  }

  id v109 = v4;
LABEL_209:

  return v109;
}

- (GEOLogMsgEventDirections)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventDirections;
  v2 = [(GEOLogMsgEventDirections *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventDirections)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventDirections;
  id v3 = [(GEOLogMsgEventDirections *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDirectionsFeedbacks
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 244) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsFeedbacks_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (NSMutableArray)directionsFeedbacks
{
  -[GEOLogMsgEventDirections _readDirectionsFeedbacks]((uint64_t)self);
  directionsFeedbacks = self->_directionsFeedbacks;

  return directionsFeedbacks;
}

- (void)setDirectionsFeedbacks:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000000uLL;
  directionsFeedbacks = self->_directionsFeedbacks;
  self->_directionsFeedbacks = v4;
}

- (void)clearDirectionsFeedbacks
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000000uLL;
  directionsFeedbacks = self->_directionsFeedbacks;

  [(NSMutableArray *)directionsFeedbacks removeAllObjects];
}

- (void)addDirectionsFeedback:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventDirections _readDirectionsFeedbacks]((uint64_t)self);
  -[GEOLogMsgEventDirections _addNoFlagsDirectionsFeedback:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000000uLL;
}

- (void)_addNoFlagsDirectionsFeedback:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      id v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)directionsFeedbacksCount
{
  -[GEOLogMsgEventDirections _readDirectionsFeedbacks]((uint64_t)self);
  directionsFeedbacks = self->_directionsFeedbacks;

  return [(NSMutableArray *)directionsFeedbacks count];
}

- (id)directionsFeedbackAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventDirections _readDirectionsFeedbacks]((uint64_t)self);
  directionsFeedbacks = self->_directionsFeedbacks;

  return (id)[(NSMutableArray *)directionsFeedbacks objectAtIndex:a3];
}

+ (Class)directionsFeedbackType
{
  return (Class)objc_opt_class();
}

- (void)_readFinalLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 245) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFinalLocation_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasFinalLocation
{
  return self->_finalLocation != 0;
}

- (GEOLocation)finalLocation
{
  -[GEOLogMsgEventDirections _readFinalLocation]((uint64_t)self);
  finalLocation = self->_finalLocation;

  return finalLocation;
}

- (void)setFinalLocation:(id)a3
{
  *(void *)&self->_flags |= 0x220000000000uLL;
  objc_storeStrong((id *)&self->_finalLocation, a3);
}

- (BOOL)arrivedAtDestination
{
  return self->_arrivedAtDestination;
}

- (void)setArrivedAtDestination:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200000020000uLL;
  self->_arrivedAtDestination = a3;
}

- (void)setHasArrivedAtDestination:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000020000;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasArrivedAtDestination
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (GEONavigationAudioFeedback)navigationAudioFeedback
{
  long long v3 = *(_OWORD *)&self->_spokenPromptsCount;
  *(_OWORD *)&retstr->_bTHFPAvailableAtEndOfNav = *(_OWORD *)&self->_manuallyChangedRouteCount;
  *(_OWORD *)&retstr->_manuallyChangedRouteCount = v3;
  *(_OWORD *)&retstr->_pauseSpokenAudioEnabled = *(_OWORD *)&self[1]._bTHFPAvailableAtEndOfNav;
  return self;
}

- (void)setNavigationAudioFeedback:(GEONavigationAudioFeedback *)a3
{
  *(void *)&self->_flags |= 0x200000000001uLL;
  long long v4 = *(_OWORD *)&a3->_bTHFPAvailableAtEndOfNav;
  long long v3 = *(_OWORD *)&a3->_manuallyChangedRouteCount;
  *(_OWORD *)&self->_navigationAudioFeedback._pauseSpokenAudioEnabled = *(_OWORD *)&a3->_pauseSpokenAudioEnabled;
  *(_OWORD *)&self->_navigationAudioFeedback._bTHFPAvailableAtEndOfNav = v4;
  *(_OWORD *)&self->_navigationAudioFeedback._manuallyChangedRouteCount = v3;
}

- (void)setHasNavigationAudioFeedback:(BOOL)a3
{
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x200000000000);
}

- (BOOL)hasNavigationAudioFeedback
{
  return *(_DWORD *)&self->_flags & 1;
}

- (double)durationOfTrip
{
  return self->_durationOfTrip;
}

- (void)setDurationOfTrip:(double)a3
{
  *(void *)&self->_flags |= 0x200000000004uLL;
  self->_durationOfTrip = a3;
}

- (void)setHasDurationOfTrip:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000000004;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasDurationOfTrip
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (GEOSessionID)navSessionId
{
  p_navSessionId = &self->_navSessionId;
  unint64_t high = self->_navSessionId._high;
  unint64_t low = p_navSessionId->_low;
  result._unint64_t low = low;
  result._unint64_t high = high;
  return result;
}

- (void)setNavSessionId:(GEOSessionID)a3
{
  *(void *)&self->_flags |= 0x200000000002uLL;
  self->_navSessionId = a3;
}

- (void)setHasNavSessionId:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000000002;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasNavSessionId
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readDurationInNavigationModes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 244) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDurationInNavigationModes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (NSMutableArray)durationInNavigationModes
{
  -[GEOLogMsgEventDirections _readDurationInNavigationModes]((uint64_t)self);
  durationInNavigationModes = self->_durationInNavigationModes;

  return durationInNavigationModes;
}

- (void)setDurationInNavigationModes:(id)a3
{
  long long v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000000uLL;
  durationInNavigationModes = self->_durationInNavigationModes;
  self->_durationInNavigationModes = v4;
}

- (void)clearDurationInNavigationModes
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000000uLL;
  durationInNavigationModes = self->_durationInNavigationModes;

  [(NSMutableArray *)durationInNavigationModes removeAllObjects];
}

- (void)addDurationInNavigationMode:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventDirections _readDurationInNavigationModes]((uint64_t)self);
  -[GEOLogMsgEventDirections _addNoFlagsDurationInNavigationMode:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000000uLL;
}

- (void)_addNoFlagsDurationInNavigationMode:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 96);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      id v4 = *(void **)(a1 + 96);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)durationInNavigationModesCount
{
  -[GEOLogMsgEventDirections _readDurationInNavigationModes]((uint64_t)self);
  durationInNavigationModes = self->_durationInNavigationModes;

  return [(NSMutableArray *)durationInNavigationModes count];
}

- (id)durationInNavigationModeAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventDirections _readDurationInNavigationModes]((uint64_t)self);
  durationInNavigationModes = self->_durationInNavigationModes;

  return (id)[(NSMutableArray *)durationInNavigationModes objectAtIndex:a3];
}

+ (Class)durationInNavigationModeType
{
  return (Class)objc_opt_class();
}

- (unsigned)originalEta
{
  return self->_originalEta;
}

- (void)setOriginalEta:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000000080uLL;
  self->_originalEta = a3;
}

- (void)setHasOriginalEta:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000000080;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasOriginalEta
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (BOOL)preArrival
{
  return self->_preArrival;
}

- (void)setPreArrival:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200800000000uLL;
  self->_preArrival = a3;
}

- (void)setHasPreArrival:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200800000000;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasPreArrival
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 3) & 1;
}

- (BOOL)isCyclingNlgAvailable
{
  return self->_isCyclingNlgAvailable;
}

- (void)setIsCyclingNlgAvailable:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200000400000uLL;
  self->_isCyclingNlgAvailable = a3;
}

- (void)setHasIsCyclingNlgAvailable:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000400000;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasIsCyclingNlgAvailable
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 6) & 1;
}

- (BOOL)isCoarseLocationUsed
{
  return self->_isCoarseLocationUsed;
}

- (void)setIsCoarseLocationUsed:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200000200000uLL;
  self->_isCoarseLocationUsed = a3;
}

- (void)setHasIsCoarseLocationUsed:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000200000;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasIsCoarseLocationUsed
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (BOOL)isVlfImprovementUsed
{
  return self->_isVlfImprovementUsed;
}

- (void)setIsVlfImprovementUsed:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200400000000uLL;
  self->_isVlfImprovementUsed = a3;
}

- (void)setHasIsVlfImprovementUsed:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200400000000;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasIsVlfImprovementUsed
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 2) & 1;
}

- (BOOL)acceptedCyclingWorkout
{
  return self->_acceptedCyclingWorkout;
}

- (void)setAcceptedCyclingWorkout:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200000004000uLL;
  self->_acceptedCyclingWorkout = a3;
}

- (void)setHasAcceptedCyclingWorkout:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000004000;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasAcceptedCyclingWorkout
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (BOOL)batteryDied
{
  return self->_batteryDied;
}

- (void)setBatteryDied:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200000040000uLL;
  self->_batteryDied = a3;
}

- (void)setHasBatteryDied:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000040000;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasBatteryDied
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 2) & 1;
}

- (BOOL)chargingStopAdded
{
  return self->_chargingStopAdded;
}

- (void)setChargingStopAdded:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200000080000uLL;
  self->_chargingStopAdded = a3;
}

- (void)setHasChargingStopAdded:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000080000;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasChargingStopAdded
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 3) & 1;
}

- (BOOL)isSiriEngaged
{
  return self->_isSiriEngaged;
}

- (void)setIsSiriEngaged:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200008000000uLL;
  self->_isSiriEngaged = a3;
}

- (void)setHasIsSiriEngaged:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200008000000;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasIsSiriEngaged
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 3) & 1;
}

- (void)_readTripOrigin
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 245) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTripOrigin_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasTripOrigin
{
  return self->_tripOrigin != 0;
}

- (GEOLatLng)tripOrigin
{
  -[GEOLogMsgEventDirections _readTripOrigin]((uint64_t)self);
  tripOrigin = self->_tripOrigin;

  return tripOrigin;
}

- (void)setTripOrigin:(id)a3
{
  *(void *)&self->_flags |= 0x280000000000uLL;
  objc_storeStrong((id *)&self->_tripOrigin, a3);
}

- (BOOL)isBadEvExperience
{
  return self->_isBadEvExperience;
}

- (void)setIsBadEvExperience:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200000100000uLL;
  self->_isBadEvExperience = a3;
}

- (void)setHasIsBadEvExperience:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000100000;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasIsBadEvExperience
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (BOOL)isEvSampleTrip
{
  return self->_isEvSampleTrip;
}

- (void)setIsEvSampleTrip:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200001000000uLL;
  self->_isEvSampleTrip = a3;
}

- (void)setHasIsEvSampleTrip:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200001000000;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasIsEvSampleTrip
{
  return *((unsigned char *)&self->_flags + 3) & 1;
}

- (unsigned)stateOfChargeAtOrigin
{
  return self->_stateOfChargeAtOrigin;
}

- (void)setStateOfChargeAtOrigin:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000000400uLL;
  self->_stateOfChargeAtOrigin = a3;
}

- (void)setHasStateOfChargeAtOrigin:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000000400;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasStateOfChargeAtOrigin
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (unsigned)stateOfChargeAtDestPredicted
{
  return self->_stateOfChargeAtDestPredicted;
}

- (void)setStateOfChargeAtDestPredicted:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000000200uLL;
  self->_stateOfChargeAtDestPredicted = a3;
}

- (void)setHasStateOfChargeAtDestPredicted:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000000200;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasStateOfChargeAtDestPredicted
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (unsigned)stateOfChargeAtDestActual
{
  return self->_stateOfChargeAtDestActual;
}

- (void)setStateOfChargeAtDestActual:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000000100uLL;
  self->_stateOfChargeAtDestActual = a3;
}

- (void)setHasStateOfChargeAtDestActual:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000000100;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasStateOfChargeAtDestActual
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (unsigned)stateOfChargeDiffAtDest
{
  return self->_stateOfChargeDiffAtDest;
}

- (void)setStateOfChargeDiffAtDest:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000000800uLL;
  self->_stateOfChargeDiffAtDest = a3;
}

- (void)setHasStateOfChargeDiffAtDest:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000000800;
  }
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasStateOfChargeDiffAtDest
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (void)_readWaypoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 245) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypoints_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (NSMutableArray)waypoints
{
  -[GEOLogMsgEventDirections _readWaypoints]((uint64_t)self);
  waypoints = self->_waypoints;

  return waypoints;
}

- (void)setWaypoints:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000000uLL;
  waypoints = self->_waypoints;
  self->_waypoints = v4;
}

- (void)clearWaypoints
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000000uLL;
  waypoints = self->_waypoints;

  [(NSMutableArray *)waypoints removeAllObjects];
}

- (void)addWaypoints:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventDirections _readWaypoints]((uint64_t)self);
  -[GEOLogMsgEventDirections _addNoFlagsWaypoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000000uLL;
}

- (void)_addNoFlagsWaypoints:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 160);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 160);
      *(void *)(a1 + 160) = v5;

      id v4 = *(void **)(a1 + 160);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)waypointsCount
{
  -[GEOLogMsgEventDirections _readWaypoints]((uint64_t)self);
  waypoints = self->_waypoints;

  return [(NSMutableArray *)waypoints count];
}

- (id)waypointsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventDirections _readWaypoints]((uint64_t)self);
  waypoints = self->_waypoints;

  return (id)[(NSMutableArray *)waypoints objectAtIndex:a3];
}

+ (Class)waypointsType
{
  return (Class)objc_opt_class();
}

- (void)_readEvConsumptionModel
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 245) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvConsumptionModel_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasEvConsumptionModel
{
  return self->_evConsumptionModel != 0;
}

- (NSString)evConsumptionModel
{
  -[GEOLogMsgEventDirections _readEvConsumptionModel]((uint64_t)self);
  evConsumptionModel = self->_evConsumptionModel;

  return evConsumptionModel;
}

- (void)setEvConsumptionModel:(id)a3
{
  *(void *)&self->_flags |= 0x210000000000uLL;
  objc_storeStrong((id *)&self->_evConsumptionModel, a3);
}

- (void)_readEvChargingMode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 244) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvChargingMode_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasEvChargingMode
{
  return self->_evChargingMode != 0;
}

- (NSString)evChargingMode
{
  -[GEOLogMsgEventDirections _readEvChargingMode]((uint64_t)self);
  evChargingMode = self->_evChargingMode;

  return evChargingMode;
}

- (void)setEvChargingMode:(id)a3
{
  *(void *)&self->_flags |= 0x208000000000uLL;
  objc_storeStrong((id *)&self->_evChargingMode, a3);
}

- (int)activeNavMode
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $896FCD321D059B35A66825024FB599E5 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    return self->_activeNavMode;
  }
  else {
    return 0;
  }
}

- (void)setActiveNavMode:(int)a3
{
  *(void *)&self->_flags |= 0x200000000010uLL;
  self->_activeNavMode = a3;
}

- (void)setHasActiveNavMode:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000000010;
  }
  self->_$896FCD321D059B35A66825024FB599E5 flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasActiveNavMode
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)activeNavModeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F8018[a3];
  }

  return v3;
}

- (int)StringAsActiveNavMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)arWalkingUsedInRoutePlanning
{
  return self->_arWalkingUsedInRoutePlanning;
}

- (void)setArWalkingUsedInRoutePlanning:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200000010000uLL;
  self->_arWalkingUsedInRoutePlanning = a3;
}

- (void)setHasArWalkingUsedInRoutePlanning:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000010000;
  }
  self->_$896FCD321D059B35A66825024FB599E5 flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasArWalkingUsedInRoutePlanning
{
  return *((unsigned char *)&self->_flags + 2) & 1;
}

- (BOOL)arWalkingUsedInNavigation
{
  return self->_arWalkingUsedInNavigation;
}

- (void)setArWalkingUsedInNavigation:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200000008000uLL;
  self->_arWalkingUsedInNavigation = a3;
}

- (void)setHasArWalkingUsedInNavigation:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000008000;
  }
  self->_$896FCD321D059B35A66825024FB599E5 flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasArWalkingUsedInNavigation
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (int)voiceGuidanceLevel
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $896FCD321D059B35A66825024FB599E5 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x1000) != 0) {
    return self->_voiceGuidanceLevel;
  }
  else {
    return 0;
  }
}

- (void)setVoiceGuidanceLevel:(int)a3
{
  *(void *)&self->_flags |= 0x200000001000uLL;
  self->_voiceGuidanceLevel = a3;
}

- (void)setHasVoiceGuidanceLevel:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000001000;
  }
  self->_$896FCD321D059B35A66825024FB599E5 flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasVoiceGuidanceLevel
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (id)voiceGuidanceLevelAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F85D8[a3];
  }

  return v3;
}

- (int)StringAsVoiceGuidanceLevel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LEVEL_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LEVEL_NONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LEVEL_INCIDENTS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LEVEL_FULL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hFPEnabled
{
  return self->_hFPEnabled;
}

- (void)setHFPEnabled:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200000002000uLL;
  self->_hFPEnabled = a3;
}

- (void)setHasHFPEnabled:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000002000;
  }
  self->_$896FCD321D059B35A66825024FB599E5 flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFDFFFFFFFDFFFLL | v3);
}

- (BOOL)hasHFPEnabled
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (BOOL)isInParkingMode
{
  return self->_isInParkingMode;
}

- (void)setIsInParkingMode:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200002000000uLL;
  self->_isInParkingMode = a3;
}

- (void)setHasIsInParkingMode:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200002000000;
  }
  self->_$896FCD321D059B35A66825024FB599E5 flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasIsInParkingMode
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 1) & 1;
}

- (BOOL)isSuggestToWalkingTriggered
{
  return self->_isSuggestToWalkingTriggered;
}

- (void)setIsSuggestToWalkingTriggered:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200020000000uLL;
  self->_isSuggestToWalkingTriggered = a3;
}

- (void)setHasIsSuggestToWalkingTriggered:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200020000000;
  }
  self->_$896FCD321D059B35A66825024FB599E5 flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasIsSuggestToWalkingTriggered
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 5) & 1;
}

- (BOOL)isTransitedToWalking
{
  return self->_isTransitedToWalking;
}

- (void)setIsTransitedToWalking:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200080000000uLL;
  self->_isTransitedToWalking = a3;
}

- (void)setHasIsTransitedToWalking:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200080000000;
  }
  self->_$896FCD321D059B35A66825024FB599E5 flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasIsTransitedToWalking
{
  return *((unsigned __int8 *)&self->_flags + 3) >> 7;
}

- (BOOL)isSuggestToFindmyTriggered
{
  return self->_isSuggestToFindmyTriggered;
}

- (void)setIsSuggestToFindmyTriggered:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200010000000uLL;
  self->_isSuggestToFindmyTriggered = a3;
}

- (void)setHasIsSuggestToFindmyTriggered:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200010000000;
  }
  self->_$896FCD321D059B35A66825024FB599E5 flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasIsSuggestToFindmyTriggered
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 4) & 1;
}

- (BOOL)isTransitedToFindmy
{
  return self->_isTransitedToFindmy;
}

- (void)setIsTransitedToFindmy:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200040000000uLL;
  self->_isTransitedToFindmy = a3;
}

- (void)setHasIsTransitedToFindmy:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200040000000;
  }
  self->_$896FCD321D059B35A66825024FB599E5 flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasIsTransitedToFindmy
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 6) & 1;
}

- (BOOL)isEndRouteTermination
{
  return self->_isEndRouteTermination;
}

- (void)setIsEndRouteTermination:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200000800000uLL;
  self->_isEndRouteTermination = a3;
}

- (void)setHasIsEndRouteTermination:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000800000;
  }
  self->_$896FCD321D059B35A66825024FB599E5 flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasIsEndRouteTermination
{
  return *((unsigned __int8 *)&self->_flags + 2) >> 7;
}

- (BOOL)isParkedCarTermination
{
  return self->_isParkedCarTermination;
}

- (void)setIsParkedCarTermination:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200004000000uLL;
  self->_isParkedCarTermination = a3;
}

- (void)setHasIsParkedCarTermination:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200004000000;
  }
  self->_$896FCD321D059B35A66825024FB599E5 flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasIsParkedCarTermination
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 2) & 1;
}

- (BOOL)isTransitionToWalkingTermination
{
  return self->_isTransitionToWalkingTermination;
}

- (void)setIsTransitionToWalkingTermination:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200200000000uLL;
  self->_isTransitionToWalkingTermination = a3;
}

- (void)setHasIsTransitionToWalkingTermination:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200200000000;
  }
  self->_$896FCD321D059B35A66825024FB599E5 flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasIsTransitionToWalkingTermination
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 1) & 1;
}

- (BOOL)isTransitionToFindmyTermination
{
  return self->_isTransitionToFindmyTermination;
}

- (void)setIsTransitionToFindmyTermination:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200100000000uLL;
  self->_isTransitionToFindmyTermination = a3;
}

- (void)setHasIsTransitionToFindmyTermination:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200100000000;
  }
  self->_$896FCD321D059B35A66825024FB599E5 flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasIsTransitionToFindmyTermination
{
  return *((unsigned char *)&self->_flags + 4) & 1;
}

- (void)_readParkingDetectionLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 245) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readParkingDetectionLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasParkingDetectionLocation
{
  return self->_parkingDetectionLocation != 0;
}

- (GEOLocation)parkingDetectionLocation
{
  -[GEOLogMsgEventDirections _readParkingDetectionLocation]((uint64_t)self);
  parkingDetectionLocation = self->_parkingDetectionLocation;

  return parkingDetectionLocation;
}

- (void)setParkingDetectionLocation:(id)a3
{
  *(void *)&self->_flags |= 0x240000000000uLL;
  objc_storeStrong((id *)&self->_parkingDetectionLocation, a3);
}

- (double)timeBetweenParkedAndArrival
{
  return self->_timeBetweenParkedAndArrival;
}

- (void)setTimeBetweenParkedAndArrival:(double)a3
{
  *(void *)&self->_flags |= 0x200000000008uLL;
  self->_timeBetweenParkedAndArrival = a3;
}

- (void)setHasTimeBetweenParkedAndArrival:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000000008;
  }
  self->_$896FCD321D059B35A66825024FB599E5 flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasTimeBetweenParkedAndArrival
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)arrivedAtDestinationCount
{
  return self->_arrivedAtDestinationCount;
}

- (void)setArrivedAtDestinationCount:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000000020uLL;
  self->_arrivedAtDestinationCount = a3;
}

- (void)setHasArrivedAtDestinationCount:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000000020;
  }
  self->_$896FCD321D059B35A66825024FB599E5 flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasArrivedAtDestinationCount
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (unsigned)inParkingModeCount
{
  return self->_inParkingModeCount;
}

- (void)setInParkingModeCount:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000000040uLL;
  self->_inParkingModeCount = a3;
}

- (void)setHasInParkingModeCount:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (a3) {
    uint64_t v3 = 0x200000000040;
  }
  self->_$896FCD321D059B35A66825024FB599E5 flags = ($896FCD321D059B35A66825024FB599E5)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasInParkingModeCount
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (BOOL)hasArrivalLocation
{
  return self->_arrivalLocation != 0;
}

- (GEOLocation)arrivalLocation
{
  -[GEOLogMsgEventDirections _readArrivalLocation]((uint64_t)self);
  arrivalLocation = self->_arrivalLocation;

  return arrivalLocation;
}

- (void)setArrivalLocation:(id)a3
{
  *(void *)&self->_flags |= 0x201000000000uLL;
  objc_storeStrong((id *)&self->_arrivalLocation, a3);
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventDirections;
  int v4 = [(GEOLogMsgEventDirections *)&v8 description];
  id v5 = [(GEOLogMsgEventDirections *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventDirections _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventDirections _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventDirections)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventDirections *)-[GEOLogMsgEventDirections _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_304;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_304;
  }
  if (a3) {
    objc_super v6 = @"directionsFeedback";
  }
  else {
    objc_super v6 = @"directions_feedback";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  id v141 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v153 objects:v159 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v154;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v154 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v153 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v14 = [GEODirectionsFeedback alloc];
            if (a3) {
              uint64_t v15 = [(GEODirectionsFeedback *)v14 initWithJSON:v13];
            }
            else {
              uint64_t v15 = [(GEODirectionsFeedback *)v14 initWithDictionary:v13];
            }
            v16 = (void *)v15;
            [a1 addDirectionsFeedback:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v153 objects:v159 count:16];
      }
      while (v10);
    }

    id v5 = v141;
  }

  if (a3) {
    v17 = @"finalLocation";
  }
  else {
    v17 = @"final_location";
  }
  id v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v19 = [GEOLocation alloc];
    if (a3) {
      uint64_t v20 = [(GEOLocation *)v19 initWithJSON:v18];
    }
    else {
      uint64_t v20 = [(GEOLocation *)v19 initWithDictionary:v18];
    }
    v21 = (void *)v20;
    [a1 setFinalLocation:v20];
  }
  if (a3) {
    id v22 = @"arrivedAtDestination";
  }
  else {
    id v22 = @"arrived_at_destination";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setArrivedAtDestination:", objc_msgSend(v23, "BOOLValue"));
  }

  if (a3) {
    id v24 = @"navigationAudioFeedback";
  }
  else {
    id v24 = @"navigation_audio_feedback";
  }
  uint64_t v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    memset(v152, 0, 44);
    _GEONavigationAudioFeedbackFromDictionaryRepresentation(v25, (uint64_t)v152, a3);
    long long v150 = v152[0];
    v151[0] = v152[1];
    *(_OWORD *)((char *)v151 + 12) = *(_OWORD *)((char *)&v152[1] + 12);
    [a1 setNavigationAudioFeedback:&v150];
  }

  if (a3) {
    uint64_t v26 = @"durationOfTrip";
  }
  else {
    uint64_t v26 = @"duration_of_trip";
  }
  uint64_t v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v27 doubleValue];
    objc_msgSend(a1, "setDurationOfTrip:");
  }

  if (a3) {
    v28 = @"navSessionId";
  }
  else {
    v28 = @"nav_session_id";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v152[0] = 0uLL;
    _GEOSessionIDFromDictionaryRepresentation(v29, v152);
    [a1 setNavSessionId:v152[0]];
  }

  if (a3) {
    id v30 = @"durationInNavigationMode";
  }
  else {
    id v30 = @"duration_in_navigation_mode";
  }
  v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v148 = 0u;
    long long v149 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    id v32 = v31;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v146 objects:v158 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v147;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v147 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v37 = *(void *)(*((void *)&v146 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v38 = [GEODurationInNavigationMode alloc];
            if (a3) {
              uint64_t v39 = [(GEODurationInNavigationMode *)v38 initWithJSON:v37];
            }
            else {
              uint64_t v39 = [(GEODurationInNavigationMode *)v38 initWithDictionary:v37];
            }
            v40 = (void *)v39;
            [a1 addDurationInNavigationMode:v39];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v146 objects:v158 count:16];
      }
      while (v34);
    }

    id v5 = v141;
  }

  if (a3) {
    v41 = @"originalEta";
  }
  else {
    v41 = @"original_eta";
  }
  id v42 = [v5 objectForKeyedSubscript:v41];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setOriginalEta:", objc_msgSend(v42, "unsignedIntValue"));
  }

  if (a3) {
    v43 = @"preArrival";
  }
  else {
    v43 = @"pre_arrival";
  }
  v44 = [v5 objectForKeyedSubscript:v43];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPreArrival:", objc_msgSend(v44, "BOOLValue"));
  }

  if (a3) {
    v45 = @"isCyclingNlgAvailable";
  }
  else {
    v45 = @"is_cycling_nlg_available";
  }
  v46 = [v5 objectForKeyedSubscript:v45];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsCyclingNlgAvailable:", objc_msgSend(v46, "BOOLValue"));
  }

  if (a3) {
    v47 = @"isCoarseLocationUsed";
  }
  else {
    v47 = @"is_coarse_location_used";
  }
  v48 = [v5 objectForKeyedSubscript:v47];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsCoarseLocationUsed:", objc_msgSend(v48, "BOOLValue"));
  }

  if (a3) {
    v49 = @"isVlfImprovementUsed";
  }
  else {
    v49 = @"is_vlf_improvement_used";
  }
  v50 = [v5 objectForKeyedSubscript:v49];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsVlfImprovementUsed:", objc_msgSend(v50, "BOOLValue"));
  }

  if (a3) {
    v51 = @"acceptedCyclingWorkout";
  }
  else {
    v51 = @"accepted_cycling_workout";
  }
  v52 = [v5 objectForKeyedSubscript:v51];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAcceptedCyclingWorkout:", objc_msgSend(v52, "BOOLValue"));
  }

  if (a3) {
    v53 = @"batteryDied";
  }
  else {
    v53 = @"battery_died";
  }
  v54 = [v5 objectForKeyedSubscript:v53];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBatteryDied:", objc_msgSend(v54, "BOOLValue"));
  }

  if (a3) {
    v55 = @"chargingStopAdded";
  }
  else {
    v55 = @"charging_stop_added";
  }
  v56 = [v5 objectForKeyedSubscript:v55];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setChargingStopAdded:", objc_msgSend(v56, "BOOLValue"));
  }

  if (a3) {
    v57 = @"isSiriEngaged";
  }
  else {
    v57 = @"is_siri_engaged";
  }
  v58 = [v5 objectForKeyedSubscript:v57];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsSiriEngaged:", objc_msgSend(v58, "BOOLValue"));
  }

  if (a3) {
    v59 = @"tripOrigin";
  }
  else {
    v59 = @"trip_origin";
  }
  v60 = [v5 objectForKeyedSubscript:v59];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v61 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v62 = [(GEOLatLng *)v61 initWithJSON:v60];
    }
    else {
      uint64_t v62 = [(GEOLatLng *)v61 initWithDictionary:v60];
    }
    v63 = (void *)v62;
    [a1 setTripOrigin:v62];
  }
  if (a3) {
    v64 = @"isBadEvExperience";
  }
  else {
    v64 = @"is_bad_ev_experience";
  }
  v65 = [v5 objectForKeyedSubscript:v64];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsBadEvExperience:", objc_msgSend(v65, "BOOLValue"));
  }

  if (a3) {
    id v66 = @"isEvSampleTrip";
  }
  else {
    id v66 = @"is_ev_sample_trip";
  }
  uint64_t v67 = [v5 objectForKeyedSubscript:v66];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsEvSampleTrip:", objc_msgSend(v67, "BOOLValue"));
  }

  if (a3) {
    uint64_t v68 = @"stateOfChargeAtOrigin";
  }
  else {
    uint64_t v68 = @"state_of_charge_at_origin";
  }
  uint64_t v69 = [v5 objectForKeyedSubscript:v68];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStateOfChargeAtOrigin:", objc_msgSend(v69, "unsignedIntValue"));
  }

  if (a3) {
    v70 = @"stateOfChargeAtDestPredicted";
  }
  else {
    v70 = @"state_of_charge_at_dest_predicted";
  }
  v71 = [v5 objectForKeyedSubscript:v70];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStateOfChargeAtDestPredicted:", objc_msgSend(v71, "unsignedIntValue"));
  }

  if (a3) {
    id v72 = @"stateOfChargeAtDestActual";
  }
  else {
    id v72 = @"state_of_charge_at_dest_actual";
  }
  v73 = [v5 objectForKeyedSubscript:v72];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStateOfChargeAtDestActual:", objc_msgSend(v73, "unsignedIntValue"));
  }

  if (a3) {
    v74 = @"stateOfChargeDiffAtDest";
  }
  else {
    v74 = @"state_of_charge_diff_at_dest";
  }
  v75 = [v5 objectForKeyedSubscript:v74];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStateOfChargeDiffAtDest:", objc_msgSend(v75, "unsignedIntValue"));
  }

  v76 = [v5 objectForKeyedSubscript:@"waypoints"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v144 = 0u;
    long long v145 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    id v77 = v76;
    uint64_t v78 = [v77 countByEnumeratingWithState:&v142 objects:v157 count:16];
    if (v78)
    {
      uint64_t v79 = v78;
      uint64_t v80 = *(void *)v143;
      do
      {
        for (uint64_t k = 0; k != v79; ++k)
        {
          if (*(void *)v143 != v80) {
            objc_enumerationMutation(v77);
          }
          uint64_t v82 = *(void *)(*((void *)&v142 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v83 = [GEOWaypointInfo alloc];
            if (a3) {
              uint64_t v84 = [(GEOWaypointInfo *)v83 initWithJSON:v82];
            }
            else {
              uint64_t v84 = [(GEOWaypointInfo *)v83 initWithDictionary:v82];
            }
            v85 = (void *)v84;
            [a1 addWaypoints:v84];
          }
        }
        uint64_t v79 = [v77 countByEnumeratingWithState:&v142 objects:v157 count:16];
      }
      while (v79);
    }

    id v5 = v141;
  }

  if (a3) {
    v86 = @"evConsumptionModel";
  }
  else {
    v86 = @"ev_consumption_model";
  }
  v87 = [v5 objectForKeyedSubscript:v86];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v88 = (void *)[v87 copy];
    [a1 setEvConsumptionModel:v88];
  }
  if (a3) {
    v89 = @"evChargingMode";
  }
  else {
    v89 = @"ev_charging_mode";
  }
  v90 = [v5 objectForKeyedSubscript:v89];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v91 = (void *)[v90 copy];
    [a1 setEvChargingMode:v91];
  }
  if (a3) {
    v92 = @"activeNavMode";
  }
  else {
    v92 = @"active_nav_mode";
  }
  v93 = [v5 objectForKeyedSubscript:v92];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v94 = v93;
    if ([v94 isEqualToString:@"AUTOMOBILE"])
    {
      uint64_t v95 = 0;
    }
    else if ([v94 isEqualToString:@"TRANSIT"])
    {
      uint64_t v95 = 1;
    }
    else if ([v94 isEqualToString:@"WALKING"])
    {
      uint64_t v95 = 2;
    }
    else if ([v94 isEqualToString:@"BICYCLE"])
    {
      uint64_t v95 = 3;
    }
    else if ([v94 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
    {
      uint64_t v95 = 4;
    }
    else if ([v94 isEqualToString:@"FERRY"])
    {
      uint64_t v95 = 5;
    }
    else if ([v94 isEqualToString:@"RIDESHARE"])
    {
      uint64_t v95 = 6;
    }
    else
    {
      uint64_t v95 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_195;
    }
    uint64_t v95 = [v93 intValue];
  }
  [a1 setActiveNavMode:v95];
LABEL_195:

  if (a3) {
    id v96 = @"arWalkingUsedInRoutePlanning";
  }
  else {
    id v96 = @"ar_walking_used_in_route_planning";
  }
  uint64_t v97 = [v5 objectForKeyedSubscript:v96];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setArWalkingUsedInRoutePlanning:", objc_msgSend(v97, "BOOLValue"));
  }

  if (a3) {
    v98 = @"arWalkingUsedInNavigation";
  }
  else {
    v98 = @"ar_walking_used_in_navigation";
  }
  v99 = [v5 objectForKeyedSubscript:v98];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setArWalkingUsedInNavigation:", objc_msgSend(v99, "BOOLValue"));
  }

  if (a3) {
    v100 = @"voiceGuidanceLevel";
  }
  else {
    v100 = @"voice_guidance_level";
  }
  v101 = [v5 objectForKeyedSubscript:v100];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v102 = v101;
    if ([v102 isEqualToString:@"LEVEL_UNKNOWN"])
    {
      uint64_t v103 = 0;
    }
    else if ([v102 isEqualToString:@"LEVEL_NONE"])
    {
      uint64_t v103 = 1;
    }
    else if ([v102 isEqualToString:@"LEVEL_INCIDENTS"])
    {
      uint64_t v103 = 2;
    }
    else if ([v102 isEqualToString:@"LEVEL_FULL"])
    {
      uint64_t v103 = 3;
    }
    else
    {
      uint64_t v103 = 0;
    }

    goto LABEL_221;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v103 = [v101 intValue];
LABEL_221:
    [a1 setVoiceGuidanceLevel:v103];
  }

  if (a3) {
    v104 = @"hFPEnabled";
  }
  else {
    v104 = @"HFP_enabled";
  }
  v105 = [v5 objectForKeyedSubscript:v104];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setHFPEnabled:", objc_msgSend(v105, "BOOLValue"));
  }

  if (a3) {
    v106 = @"isInParkingMode";
  }
  else {
    v106 = @"is_in_parking_mode";
  }
  v107 = [v5 objectForKeyedSubscript:v106];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsInParkingMode:", objc_msgSend(v107, "BOOLValue"));
  }

  if (a3) {
    id v108 = @"isSuggestToWalkingTriggered";
  }
  else {
    id v108 = @"is_suggest_to_walking_triggered";
  }
  id v109 = [v5 objectForKeyedSubscript:v108];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsSuggestToWalkingTriggered:", objc_msgSend(v109, "BOOLValue"));
  }

  if (a3) {
    v110 = @"isTransitedToWalking";
  }
  else {
    v110 = @"is_transited_to_walking";
  }
  v111 = [v5 objectForKeyedSubscript:v110];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsTransitedToWalking:", objc_msgSend(v111, "BOOLValue"));
  }

  if (a3) {
    v112 = @"isSuggestToFindmyTriggered";
  }
  else {
    v112 = @"is_suggest_to_findmy_triggered";
  }
  v113 = [v5 objectForKeyedSubscript:v112];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsSuggestToFindmyTriggered:", objc_msgSend(v113, "BOOLValue"));
  }

  if (a3) {
    v114 = @"isTransitedToFindmy";
  }
  else {
    v114 = @"is_transited_to_findmy";
  }
  v115 = [v5 objectForKeyedSubscript:v114];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsTransitedToFindmy:", objc_msgSend(v115, "BOOLValue"));
  }

  if (a3) {
    uint64_t v116 = @"isEndRouteTermination";
  }
  else {
    uint64_t v116 = @"is_end_route_termination";
  }
  v117 = [v5 objectForKeyedSubscript:v116];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsEndRouteTermination:", objc_msgSend(v117, "BOOLValue"));
  }

  if (a3) {
    v118 = @"isParkedCarTermination";
  }
  else {
    v118 = @"is_parked_car_termination";
  }
  v119 = [v5 objectForKeyedSubscript:v118];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsParkedCarTermination:", objc_msgSend(v119, "BOOLValue"));
  }

  if (a3) {
    v120 = @"isTransitionToWalkingTermination";
  }
  else {
    v120 = @"is_transition_to_walking_termination";
  }
  v121 = [v5 objectForKeyedSubscript:v120];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsTransitionToWalkingTermination:", objc_msgSend(v121, "BOOLValue"));
  }

  if (a3) {
    v122 = @"isTransitionToFindmyTermination";
  }
  else {
    v122 = @"is_transition_to_findmy_termination";
  }
  v123 = [v5 objectForKeyedSubscript:v122];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsTransitionToFindmyTermination:", objc_msgSend(v123, "BOOLValue"));
  }

  if (a3) {
    v124 = @"parkingDetectionLocation";
  }
  else {
    v124 = @"parking_detection_location";
  }
  v125 = [v5 objectForKeyedSubscript:v124];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v126 = [GEOLocation alloc];
    if (a3) {
      uint64_t v127 = [(GEOLocation *)v126 initWithJSON:v125];
    }
    else {
      uint64_t v127 = [(GEOLocation *)v126 initWithDictionary:v125];
    }
    v128 = (void *)v127;
    [a1 setParkingDetectionLocation:v127];
  }
  if (a3) {
    v129 = @"timeBetweenParkedAndArrival";
  }
  else {
    v129 = @"time_between_parked_and_arrival";
  }
  v130 = [v5 objectForKeyedSubscript:v129];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v130 doubleValue];
    objc_msgSend(a1, "setTimeBetweenParkedAndArrival:");
  }

  if (a3) {
    v131 = @"arrivedAtDestinationCount";
  }
  else {
    v131 = @"arrived_at_destination_count";
  }
  v132 = [v5 objectForKeyedSubscript:v131];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setArrivedAtDestinationCount:", objc_msgSend(v132, "unsignedIntValue"));
  }

  if (a3) {
    v133 = @"inParkingModeCount";
  }
  else {
    v133 = @"in_parking_mode_count";
  }
  v134 = [v5 objectForKeyedSubscript:v133];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setInParkingModeCount:", objc_msgSend(v134, "unsignedIntValue"));
  }

  if (a3) {
    v135 = @"arrivalLocation";
  }
  else {
    v135 = @"arrival_location";
  }
  v136 = [v5 objectForKeyedSubscript:v135];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v137 = [GEOLocation alloc];
    if (a3) {
      uint64_t v138 = [(GEOLocation *)v137 initWithJSON:v136];
    }
    else {
      uint64_t v138 = [(GEOLocation *)v137 initWithDictionary:v136];
    }
    long long v139 = (void *)v138;
    [a1 setArrivalLocation:v138];
  }
  a1 = a1;

LABEL_304:
  return a1;
}

- (GEOLogMsgEventDirections)initWithJSON:(id)a3
{
  return (GEOLogMsgEventDirections *)-[GEOLogMsgEventDirections _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_2436;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_2437;
    }
    GEOLogMsgEventDirectionsReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgEventDirectionsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventDirectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventDirectionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLogMsgEventDirectionsIsDirty((uint64_t)self) & 1) == 0)
  {
    v23 = self->_reader;
    objc_sync_enter(v23);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v24 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v24];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v23);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventDirections *)self readAll:0];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    objc_super v6 = self->_directionsFeedbacks;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v7);
    }

    if (self->_finalLocation) {
      PBDataWriterWriteSubmessage();
    }
    $896FCD321D059B35A66825024FB599E5 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x20000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 flags = self->_flags;
    }
    if (*(unsigned char *)&flags)
    {
      uint64_t v33 = 0;
      PBDataWriterPlaceMark();
      GEONavigationAudioFeedbackWriteTo((uint64_t)&self->_navigationAudioFeedback);
      PBDataWriterRecallMark();
      $896FCD321D059B35A66825024FB599E5 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 4) != 0)
    {
      PBDataWriterWriteDoubleField();
      $896FCD321D059B35A66825024FB599E5 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 2) != 0)
    {
      uint64_t v33 = 0;
      PBDataWriterPlaceMark();
      PBDataWriterWriteUint64Field();
      PBDataWriterWriteUint64Field();
      PBDataWriterRecallMark();
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v11 = self->_durationInNavigationModes;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v29 objects:v39 count:16];
      }
      while (v12);
    }

    $896FCD321D059B35A66825024FB599E5 v15 = self->_flags;
    if ((*(unsigned char *)&v15 & 0x80) != 0)
    {
      PBDataWriterWriteUint32Field();
      $896FCD321D059B35A66825024FB599E5 v15 = self->_flags;
    }
    if ((*(void *)&v15 & 0x800000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v15 = self->_flags;
    }
    if ((*(_DWORD *)&v15 & 0x400000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v15 = self->_flags;
    }
    if ((*(_DWORD *)&v15 & 0x200000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v15 = self->_flags;
    }
    if ((*(void *)&v15 & 0x400000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v15 = self->_flags;
    }
    if ((*(_WORD *)&v15 & 0x4000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v15 = self->_flags;
    }
    if ((*(_DWORD *)&v15 & 0x40000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v15 = self->_flags;
    }
    if ((*(_DWORD *)&v15 & 0x80000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v15 = self->_flags;
    }
    if ((*(_DWORD *)&v15 & 0x8000000) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_tripOrigin) {
      PBDataWriterWriteSubmessage();
    }
    $896FCD321D059B35A66825024FB599E5 v16 = self->_flags;
    if ((*(_DWORD *)&v16 & 0x100000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v16 = self->_flags;
    }
    if ((*(_DWORD *)&v16 & 0x1000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v16 = self->_flags;
    }
    if ((*(_WORD *)&v16 & 0x400) != 0)
    {
      PBDataWriterWriteUint32Field();
      $896FCD321D059B35A66825024FB599E5 v16 = self->_flags;
    }
    if ((*(_WORD *)&v16 & 0x200) != 0)
    {
      PBDataWriterWriteUint32Field();
      $896FCD321D059B35A66825024FB599E5 v16 = self->_flags;
    }
    if ((*(_WORD *)&v16 & 0x100) != 0)
    {
      PBDataWriterWriteUint32Field();
      $896FCD321D059B35A66825024FB599E5 v16 = self->_flags;
    }
    if ((*(_WORD *)&v16 & 0x800) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v17 = self->_waypoints;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v25 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t k = 0; k != v18; ++k)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v17);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v25 objects:v38 count:16];
      }
      while (v18);
    }

    if (self->_evConsumptionModel) {
      PBDataWriterWriteStringField();
    }
    if (self->_evChargingMode) {
      PBDataWriterWriteStringField();
    }
    $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
    if ((*(unsigned char *)&v21 & 0x10) != 0)
    {
      PBDataWriterWriteInt32Field();
      $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
    }
    if ((*(_DWORD *)&v21 & 0x10000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
    }
    if ((*(_WORD *)&v21 & 0x8000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
    }
    if ((*(_WORD *)&v21 & 0x1000) != 0)
    {
      PBDataWriterWriteInt32Field();
      $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
    }
    if ((*(_WORD *)&v21 & 0x2000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
    }
    if ((*(_DWORD *)&v21 & 0x2000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
    }
    if ((*(_DWORD *)&v21 & 0x20000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
    }
    if ((*(_DWORD *)&v21 & 0x80000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
    }
    if ((*(_DWORD *)&v21 & 0x10000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
    }
    if ((*(_DWORD *)&v21 & 0x40000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
    }
    if ((*(_DWORD *)&v21 & 0x800000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
    }
    if ((*(_DWORD *)&v21 & 0x4000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
    }
    if ((*(void *)&v21 & 0x200000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
    }
    if ((*(void *)&v21 & 0x100000000) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_parkingDetectionLocation) {
      PBDataWriterWriteSubmessage();
    }
    $896FCD321D059B35A66825024FB599E5 v22 = self->_flags;
    if ((*(unsigned char *)&v22 & 8) != 0)
    {
      PBDataWriterWriteDoubleField();
      $896FCD321D059B35A66825024FB599E5 v22 = self->_flags;
    }
    if ((*(unsigned char *)&v22 & 0x20) != 0)
    {
      PBDataWriterWriteUint32Field();
      $896FCD321D059B35A66825024FB599E5 v22 = self->_flags;
    }
    if ((*(unsigned char *)&v22 & 0x40) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_arrivalLocation) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  -[GEOLogMsgEventDirections _readArrivalLocation]((uint64_t)self);
  if ([(GEOLocation *)self->_arrivalLocation hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOLogMsgEventDirections _readDirectionsFeedbacks]((uint64_t)self);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  objc_super v6 = self->_directionsFeedbacks;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v6);
      }
      if ([*(id *)(*((void *)&v20 + 1) + 8 * v10) hasGreenTeaWithValue:v3]) {
        goto LABEL_23;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  -[GEOLogMsgEventDirections _readFinalLocation]((uint64_t)self);
  if (![(GEOLocation *)self->_finalLocation hasGreenTeaWithValue:v3])
  {
    -[GEOLogMsgEventDirections _readParkingDetectionLocation]((uint64_t)self);
    if (![(GEOLocation *)self->_parkingDetectionLocation hasGreenTeaWithValue:v3])
    {
      -[GEOLogMsgEventDirections _readTripOrigin]((uint64_t)self);
      if (![(GEOLatLng *)self->_tripOrigin hasGreenTeaWithValue:v3])
      {
        -[GEOLogMsgEventDirections _readWaypoints]((uint64_t)self);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        objc_super v6 = self->_waypoints;
        uint64_t v11 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (!v11)
        {
LABEL_22:
          BOOL v5 = 0;
LABEL_24:

          return v5;
        }
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v17;
LABEL_16:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14), "hasGreenTeaWithValue:", v3, (void)v16)) {
            break;
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v12) {
              goto LABEL_16;
            }
            goto LABEL_22;
          }
        }
LABEL_23:
        BOOL v5 = 1;
        goto LABEL_24;
      }
    }
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  long long v25 = (char *)a3;
  [(GEOLogMsgEventDirections *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v25 + 1, self->_reader);
  *((_DWORD *)v25 + 42) = self->_readerMarkPos;
  *((_DWORD *)v25 + 43) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLogMsgEventDirections *)self directionsFeedbacksCount])
  {
    [v25 clearDirectionsFeedbacks];
    unint64_t v4 = [(GEOLogMsgEventDirections *)self directionsFeedbacksCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgEventDirections *)self directionsFeedbackAtIndex:i];
        [v25 addDirectionsFeedback:v7];
      }
    }
  }
  if (self->_finalLocation) {
    objc_msgSend(v25, "setFinalLocation:");
  }
  $896FCD321D059B35A66825024FB599E5 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
    v25[220] = self->_arrivedAtDestination;
    *((void *)v25 + 30) |= 0x20000uLL;
    $896FCD321D059B35A66825024FB599E5 flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_10;
      }
LABEL_71:
      *((void *)v25 + 13) = *(void *)&self->_durationOfTrip;
      *((void *)v25 + 30) |= 4uLL;
      if ((*(void *)&self->_flags & 2) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&flags & 1) == 0)
  {
    goto LABEL_9;
  }
  long long v23 = *(_OWORD *)&self->_navigationAudioFeedback._pauseSpokenAudioEnabled;
  long long v24 = *(_OWORD *)&self->_navigationAudioFeedback._manuallyChangedRouteCount;
  *((_OWORD *)v25 + 1) = *(_OWORD *)&self->_navigationAudioFeedback._bTHFPAvailableAtEndOfNav;
  *((_OWORD *)v25 + 2) = v24;
  *(_OWORD *)(v25 + 44) = v23;
  *((void *)v25 + 30) |= 1uLL;
  $896FCD321D059B35A66825024FB599E5 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0) {
    goto LABEL_71;
  }
LABEL_10:
  if ((*(unsigned char *)&flags & 2) != 0)
  {
LABEL_11:
    *((_OWORD *)v25 + 4) = self->_navSessionId;
    *((void *)v25 + 30) |= 2uLL;
  }
LABEL_12:
  if ([(GEOLogMsgEventDirections *)self durationInNavigationModesCount])
  {
    [v25 clearDurationInNavigationModes];
    unint64_t v9 = [(GEOLogMsgEventDirections *)self durationInNavigationModesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(GEOLogMsgEventDirections *)self durationInNavigationModeAtIndex:j];
        [v25 addDurationInNavigationMode:v12];
      }
    }
  }
  $896FCD321D059B35A66825024FB599E5 v13 = self->_flags;
  uint64_t v14 = v25;
  if ((*(unsigned char *)&v13 & 0x80) != 0)
  {
    *((_DWORD *)v25 + 48) = self->_originalEta;
    *((void *)v25 + 30) |= 0x80uLL;
    $896FCD321D059B35A66825024FB599E5 v13 = self->_flags;
    if ((*(void *)&v13 & 0x800000000) == 0)
    {
LABEL_18:
      if ((*(_DWORD *)&v13 & 0x400000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_75;
    }
  }
  else if ((*(void *)&v13 & 0x800000000) == 0)
  {
    goto LABEL_18;
  }
  v25[238] = self->_preArrival;
  *((void *)v25 + 30) |= 0x800000000uLL;
  $896FCD321D059B35A66825024FB599E5 v13 = self->_flags;
  if ((*(_DWORD *)&v13 & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v13 & 0x200000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_76;
  }
LABEL_75:
  v25[225] = self->_isCyclingNlgAvailable;
  *((void *)v25 + 30) |= 0x400000uLL;
  $896FCD321D059B35A66825024FB599E5 v13 = self->_flags;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
LABEL_20:
    if ((*(void *)&v13 & 0x400000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_77;
  }
LABEL_76:
  v25[224] = self->_isCoarseLocationUsed;
  *((void *)v25 + 30) |= 0x200000uLL;
  $896FCD321D059B35A66825024FB599E5 v13 = self->_flags;
  if ((*(void *)&v13 & 0x400000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v13 & 0x4000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_78;
  }
LABEL_77:
  v25[237] = self->_isVlfImprovementUsed;
  *((void *)v25 + 30) |= 0x400000000uLL;
  $896FCD321D059B35A66825024FB599E5 v13 = self->_flags;
  if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v13 & 0x40000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_79;
  }
LABEL_78:
  v25[217] = self->_acceptedCyclingWorkout;
  *((void *)v25 + 30) |= 0x4000uLL;
  $896FCD321D059B35A66825024FB599E5 v13 = self->_flags;
  if ((*(_DWORD *)&v13 & 0x40000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v13 & 0x80000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_80;
  }
LABEL_79:
  v25[221] = self->_batteryDied;
  *((void *)v25 + 30) |= 0x40000uLL;
  $896FCD321D059B35A66825024FB599E5 v13 = self->_flags;
  if ((*(_DWORD *)&v13 & 0x80000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v13 & 0x8000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_80:
  v25[222] = self->_chargingStopAdded;
  *((void *)v25 + 30) |= 0x80000uLL;
  if ((*(void *)&self->_flags & 0x8000000) != 0)
  {
LABEL_25:
    v25[230] = self->_isSiriEngaged;
    *((void *)v25 + 30) |= 0x8000000uLL;
  }
LABEL_26:
  if (self->_tripOrigin)
  {
    objc_msgSend(v25, "setTripOrigin:");
    uint64_t v14 = v25;
  }
  $896FCD321D059B35A66825024FB599E5 v15 = self->_flags;
  if ((*(_DWORD *)&v15 & 0x100000) != 0)
  {
    v14[223] = self->_isBadEvExperience;
    *((void *)v14 + 30) |= 0x100000uLL;
    $896FCD321D059B35A66825024FB599E5 v15 = self->_flags;
    if ((*(_DWORD *)&v15 & 0x1000000) == 0)
    {
LABEL_30:
      if ((*(_WORD *)&v15 & 0x400) == 0) {
        goto LABEL_31;
      }
      goto LABEL_84;
    }
  }
  else if ((*(_DWORD *)&v15 & 0x1000000) == 0)
  {
    goto LABEL_30;
  }
  v14[227] = self->_isEvSampleTrip;
  *((void *)v14 + 30) |= 0x1000000uLL;
  $896FCD321D059B35A66825024FB599E5 v15 = self->_flags;
  if ((*(_WORD *)&v15 & 0x400) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v15 & 0x200) == 0) {
      goto LABEL_32;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((_DWORD *)v14 + 51) = self->_stateOfChargeAtOrigin;
  *((void *)v14 + 30) |= 0x400uLL;
  $896FCD321D059B35A66825024FB599E5 v15 = self->_flags;
  if ((*(_WORD *)&v15 & 0x200) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v15 & 0x100) == 0) {
      goto LABEL_33;
    }
LABEL_86:
    *((_DWORD *)v14 + 49) = self->_stateOfChargeAtDestActual;
    *((void *)v14 + 30) |= 0x100uLL;
    if ((*(void *)&self->_flags & 0x800) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_85:
  *((_DWORD *)v14 + 50) = self->_stateOfChargeAtDestPredicted;
  *((void *)v14 + 30) |= 0x200uLL;
  $896FCD321D059B35A66825024FB599E5 v15 = self->_flags;
  if ((*(_WORD *)&v15 & 0x100) != 0) {
    goto LABEL_86;
  }
LABEL_33:
  if ((*(_WORD *)&v15 & 0x800) != 0)
  {
LABEL_34:
    *((_DWORD *)v14 + 52) = self->_stateOfChargeDiffAtDest;
    *((void *)v14 + 30) |= 0x800uLL;
  }
LABEL_35:
  if ([(GEOLogMsgEventDirections *)self waypointsCount])
  {
    [v25 clearWaypoints];
    unint64_t v16 = [(GEOLogMsgEventDirections *)self waypointsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t k = 0; k != v17; ++k)
      {
        long long v19 = [(GEOLogMsgEventDirections *)self waypointsAtIndex:k];
        [v25 addWaypoints:v19];
      }
    }
  }
  if (self->_evConsumptionModel) {
    objc_msgSend(v25, "setEvConsumptionModel:");
  }
  long long v20 = v25;
  if (self->_evChargingMode)
  {
    objc_msgSend(v25, "setEvChargingMode:");
    long long v20 = v25;
  }
  $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
  if ((*(unsigned char *)&v21 & 0x10) != 0)
  {
    v20[45] = self->_activeNavMode;
    *((void *)v20 + 30) |= 0x10uLL;
    $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
    if ((*(_DWORD *)&v21 & 0x10000) == 0)
    {
LABEL_45:
      if ((*(_WORD *)&v21 & 0x8000) == 0) {
        goto LABEL_46;
      }
      goto LABEL_90;
    }
  }
  else if ((*(_DWORD *)&v21 & 0x10000) == 0)
  {
    goto LABEL_45;
  }
  *((unsigned char *)v20 + 219) = self->_arWalkingUsedInRoutePlanning;
  *((void *)v20 + 30) |= 0x10000uLL;
  $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x8000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v21 & 0x1000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((unsigned char *)v20 + 218) = self->_arWalkingUsedInNavigation;
  *((void *)v20 + 30) |= 0x8000uLL;
  $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x1000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v21 & 0x2000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_92;
  }
LABEL_91:
  v20[53] = self->_voiceGuidanceLevel;
  *((void *)v20 + 30) |= 0x1000uLL;
  $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x2000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v21 & 0x2000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((unsigned char *)v20 + 216) = self->_hFPEnabled;
  *((void *)v20 + 30) |= 0x2000uLL;
  $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x2000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v21 & 0x20000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((unsigned char *)v20 + 228) = self->_isInParkingMode;
  *((void *)v20 + 30) |= 0x2000000uLL;
  $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x20000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v21 & 0x80000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((unsigned char *)v20 + 232) = self->_isSuggestToWalkingTriggered;
  *((void *)v20 + 30) |= 0x20000000uLL;
  $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x80000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v21 & 0x10000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_96;
  }
LABEL_95:
  *((unsigned char *)v20 + 234) = self->_isTransitedToWalking;
  *((void *)v20 + 30) |= 0x80000000uLL;
  $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x10000000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v21 & 0x40000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_97;
  }
LABEL_96:
  *((unsigned char *)v20 + 231) = self->_isSuggestToFindmyTriggered;
  *((void *)v20 + 30) |= 0x10000000uLL;
  $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x40000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v21 & 0x800000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_98;
  }
LABEL_97:
  *((unsigned char *)v20 + 233) = self->_isTransitedToFindmy;
  *((void *)v20 + 30) |= 0x40000000uLL;
  $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x800000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v21 & 0x4000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_99;
  }
LABEL_98:
  *((unsigned char *)v20 + 226) = self->_isEndRouteTermination;
  *((void *)v20 + 30) |= 0x800000uLL;
  $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x4000000) == 0)
  {
LABEL_55:
    if ((*(void *)&v21 & 0x200000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_100;
  }
LABEL_99:
  *((unsigned char *)v20 + 229) = self->_isParkedCarTermination;
  *((void *)v20 + 30) |= 0x4000000uLL;
  $896FCD321D059B35A66825024FB599E5 v21 = self->_flags;
  if ((*(void *)&v21 & 0x200000000) == 0)
  {
LABEL_56:
    if ((*(void *)&v21 & 0x100000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
LABEL_100:
  *((unsigned char *)v20 + 236) = self->_isTransitionToWalkingTermination;
  *((void *)v20 + 30) |= 0x200000000uLL;
  if ((*(void *)&self->_flags & 0x100000000) != 0)
  {
LABEL_57:
    *((unsigned char *)v20 + 235) = self->_isTransitionToFindmyTermination;
    *((void *)v20 + 30) |= 0x100000000uLL;
  }
LABEL_58:
  if (self->_parkingDetectionLocation)
  {
    objc_msgSend(v25, "setParkingDetectionLocation:");
    long long v20 = v25;
  }
  $896FCD321D059B35A66825024FB599E5 v22 = self->_flags;
  if ((*(unsigned char *)&v22 & 8) != 0)
  {
    *((void *)v20 + 18) = *(void *)&self->_timeBetweenParkedAndArrival;
    *((void *)v20 + 30) |= 8uLL;
    $896FCD321D059B35A66825024FB599E5 v22 = self->_flags;
    if ((*(unsigned char *)&v22 & 0x20) == 0)
    {
LABEL_62:
      if ((*(unsigned char *)&v22 & 0x40) == 0) {
        goto LABEL_64;
      }
      goto LABEL_63;
    }
  }
  else if ((*(unsigned char *)&v22 & 0x20) == 0)
  {
    goto LABEL_62;
  }
  v20[46] = self->_arrivedAtDestinationCount;
  *((void *)v20 + 30) |= 0x20uLL;
  if ((*(void *)&self->_flags & 0x40) != 0)
  {
LABEL_63:
    v20[47] = self->_inParkingModeCount;
    *((void *)v20 + 30) |= 0x40uLL;
  }
LABEL_64:
  if (self->_arrivalLocation)
  {
    objc_msgSend(v25, "setArrivalLocation:");
    long long v20 = v25;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventDirections *)self readAll:0];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    unint64_t v9 = self->_directionsFeedbacks;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v54 != v11) {
            objc_enumerationMutation(v9);
          }
          $896FCD321D059B35A66825024FB599E5 v13 = (void *)[*(id *)(*((void *)&v53 + 1) + 8 * i) copyWithZone:a3];
          [(id)v5 addDirectionsFeedback:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v10);
    }

    id v14 = [(GEOLocation *)self->_finalLocation copyWithZone:a3];
    $896FCD321D059B35A66825024FB599E5 v15 = *(void **)(v5 + 128);
    *(void *)(v5 + 128) = v14;

    $896FCD321D059B35A66825024FB599E5 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x20000) != 0)
    {
      *(unsigned char *)(v5 + 220) = self->_arrivedAtDestination;
      *(void *)(v5 + 240) |= 0x20000uLL;
      $896FCD321D059B35A66825024FB599E5 flags = self->_flags;
      if ((*(unsigned char *)&flags & 1) == 0)
      {
LABEL_14:
        if ((*(unsigned char *)&flags & 4) == 0) {
          goto LABEL_15;
        }
        goto LABEL_71;
      }
    }
    else if ((*(unsigned char *)&flags & 1) == 0)
    {
      goto LABEL_14;
    }
    long long v43 = *(_OWORD *)&self->_navigationAudioFeedback._pauseSpokenAudioEnabled;
    long long v44 = *(_OWORD *)&self->_navigationAudioFeedback._manuallyChangedRouteCount;
    *(_OWORD *)(v5 + 16) = *(_OWORD *)&self->_navigationAudioFeedback._bTHFPAvailableAtEndOfNav;
    *(_OWORD *)(v5 + 32) = v44;
    *(_OWORD *)(v5 + 44) = v43;
    *(void *)(v5 + 240) |= 1uLL;
    $896FCD321D059B35A66825024FB599E5 flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) == 0)
    {
LABEL_15:
      if ((*(unsigned char *)&flags & 2) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
LABEL_71:
    *(double *)(v5 + 104) = self->_durationOfTrip;
    *(void *)(v5 + 240) |= 4uLL;
    if ((*(void *)&self->_flags & 2) == 0)
    {
LABEL_17:
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      unint64_t v17 = self->_durationInNavigationModes;
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v50 != v19) {
              objc_enumerationMutation(v17);
            }
            $896FCD321D059B35A66825024FB599E5 v21 = (void *)[*(id *)(*((void *)&v49 + 1) + 8 * j) copyWithZone:a3];
            [(id)v5 addDurationInNavigationMode:v21];
          }
          uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v49 objects:v58 count:16];
        }
        while (v18);
      }

      $896FCD321D059B35A66825024FB599E5 v22 = self->_flags;
      if ((*(unsigned char *)&v22 & 0x80) != 0)
      {
        *(_DWORD *)(v5 + 192) = self->_originalEta;
        *(void *)(v5 + 240) |= 0x80uLL;
        $896FCD321D059B35A66825024FB599E5 v22 = self->_flags;
        if ((*(void *)&v22 & 0x800000000) == 0)
        {
LABEL_26:
          if ((*(_DWORD *)&v22 & 0x400000) == 0) {
            goto LABEL_27;
          }
          goto LABEL_75;
        }
      }
      else if ((*(void *)&v22 & 0x800000000) == 0)
      {
        goto LABEL_26;
      }
      *(unsigned char *)(v5 + 238) = self->_preArrival;
      *(void *)(v5 + 240) |= 0x800000000uLL;
      $896FCD321D059B35A66825024FB599E5 v22 = self->_flags;
      if ((*(_DWORD *)&v22 & 0x400000) == 0)
      {
LABEL_27:
        if ((*(_DWORD *)&v22 & 0x200000) == 0) {
          goto LABEL_28;
        }
        goto LABEL_76;
      }
LABEL_75:
      *(unsigned char *)(v5 + 225) = self->_isCyclingNlgAvailable;
      *(void *)(v5 + 240) |= 0x400000uLL;
      $896FCD321D059B35A66825024FB599E5 v22 = self->_flags;
      if ((*(_DWORD *)&v22 & 0x200000) == 0)
      {
LABEL_28:
        if ((*(void *)&v22 & 0x400000000) == 0) {
          goto LABEL_29;
        }
        goto LABEL_77;
      }
LABEL_76:
      *(unsigned char *)(v5 + 224) = self->_isCoarseLocationUsed;
      *(void *)(v5 + 240) |= 0x200000uLL;
      $896FCD321D059B35A66825024FB599E5 v22 = self->_flags;
      if ((*(void *)&v22 & 0x400000000) == 0)
      {
LABEL_29:
        if ((*(_WORD *)&v22 & 0x4000) == 0) {
          goto LABEL_30;
        }
        goto LABEL_78;
      }
LABEL_77:
      *(unsigned char *)(v5 + 237) = self->_isVlfImprovementUsed;
      *(void *)(v5 + 240) |= 0x400000000uLL;
      $896FCD321D059B35A66825024FB599E5 v22 = self->_flags;
      if ((*(_WORD *)&v22 & 0x4000) == 0)
      {
LABEL_30:
        if ((*(_DWORD *)&v22 & 0x40000) == 0) {
          goto LABEL_31;
        }
        goto LABEL_79;
      }
LABEL_78:
      *(unsigned char *)(v5 + 217) = self->_acceptedCyclingWorkout;
      *(void *)(v5 + 240) |= 0x4000uLL;
      $896FCD321D059B35A66825024FB599E5 v22 = self->_flags;
      if ((*(_DWORD *)&v22 & 0x40000) == 0)
      {
LABEL_31:
        if ((*(_DWORD *)&v22 & 0x80000) == 0) {
          goto LABEL_32;
        }
        goto LABEL_80;
      }
LABEL_79:
      *(unsigned char *)(v5 + 221) = self->_batteryDied;
      *(void *)(v5 + 240) |= 0x40000uLL;
      $896FCD321D059B35A66825024FB599E5 v22 = self->_flags;
      if ((*(_DWORD *)&v22 & 0x80000) == 0)
      {
LABEL_32:
        if ((*(_DWORD *)&v22 & 0x8000000) == 0) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }
LABEL_80:
      *(unsigned char *)(v5 + 222) = self->_chargingStopAdded;
      *(void *)(v5 + 240) |= 0x80000uLL;
      if ((*(void *)&self->_flags & 0x8000000) == 0)
      {
LABEL_34:
        id v23 = [(GEOLatLng *)self->_tripOrigin copyWithZone:a3];
        long long v24 = *(void **)(v5 + 152);
        *(void *)(v5 + 152) = v23;

        $896FCD321D059B35A66825024FB599E5 v25 = self->_flags;
        if ((*(_DWORD *)&v25 & 0x100000) != 0)
        {
          *(unsigned char *)(v5 + 223) = self->_isBadEvExperience;
          *(void *)(v5 + 240) |= 0x100000uLL;
          $896FCD321D059B35A66825024FB599E5 v25 = self->_flags;
          if ((*(_DWORD *)&v25 & 0x1000000) == 0)
          {
LABEL_36:
            if ((*(_WORD *)&v25 & 0x400) == 0) {
              goto LABEL_37;
            }
            goto LABEL_84;
          }
        }
        else if ((*(_DWORD *)&v25 & 0x1000000) == 0)
        {
          goto LABEL_36;
        }
        *(unsigned char *)(v5 + 227) = self->_isEvSampleTrip;
        *(void *)(v5 + 240) |= 0x1000000uLL;
        $896FCD321D059B35A66825024FB599E5 v25 = self->_flags;
        if ((*(_WORD *)&v25 & 0x400) == 0)
        {
LABEL_37:
          if ((*(_WORD *)&v25 & 0x200) == 0) {
            goto LABEL_38;
          }
          goto LABEL_85;
        }
LABEL_84:
        *(_DWORD *)(v5 + 204) = self->_stateOfChargeAtOrigin;
        *(void *)(v5 + 240) |= 0x400uLL;
        $896FCD321D059B35A66825024FB599E5 v25 = self->_flags;
        if ((*(_WORD *)&v25 & 0x200) == 0)
        {
LABEL_38:
          if ((*(_WORD *)&v25 & 0x100) == 0) {
            goto LABEL_39;
          }
          goto LABEL_86;
        }
LABEL_85:
        *(_DWORD *)(v5 + 200) = self->_stateOfChargeAtDestPredicted;
        *(void *)(v5 + 240) |= 0x200uLL;
        $896FCD321D059B35A66825024FB599E5 v25 = self->_flags;
        if ((*(_WORD *)&v25 & 0x100) == 0)
        {
LABEL_39:
          if ((*(_WORD *)&v25 & 0x800) == 0) {
            goto LABEL_41;
          }
          goto LABEL_40;
        }
LABEL_86:
        *(_DWORD *)(v5 + 196) = self->_stateOfChargeAtDestActual;
        *(void *)(v5 + 240) |= 0x100uLL;
        if ((*(void *)&self->_flags & 0x800) == 0)
        {
LABEL_41:
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          uint64_t v26 = self->_waypoints;
          uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v45 objects:v57 count:16];
          if (v27)
          {
            uint64_t v28 = *(void *)v46;
            do
            {
              for (uint64_t k = 0; k != v27; ++k)
              {
                if (*(void *)v46 != v28) {
                  objc_enumerationMutation(v26);
                }
                long long v30 = objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * k), "copyWithZone:", a3, (void)v45);
                [(id)v5 addWaypoints:v30];
              }
              uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v45 objects:v57 count:16];
            }
            while (v27);
          }

          uint64_t v31 = [(NSString *)self->_evConsumptionModel copyWithZone:a3];
          long long v32 = *(void **)(v5 + 120);
          *(void *)(v5 + 120) = v31;

          uint64_t v33 = [(NSString *)self->_evChargingMode copyWithZone:a3];
          long long v34 = *(void **)(v5 + 112);
          *(void *)(v5 + 112) = v33;

          $896FCD321D059B35A66825024FB599E5 v35 = self->_flags;
          if ((*(unsigned char *)&v35 & 0x10) != 0)
          {
            *(_DWORD *)(v5 + 180) = self->_activeNavMode;
            *(void *)(v5 + 240) |= 0x10uLL;
            $896FCD321D059B35A66825024FB599E5 v35 = self->_flags;
            if ((*(_DWORD *)&v35 & 0x10000) == 0)
            {
LABEL_50:
              if ((*(_WORD *)&v35 & 0x8000) == 0) {
                goto LABEL_51;
              }
              goto LABEL_90;
            }
          }
          else if ((*(_DWORD *)&v35 & 0x10000) == 0)
          {
            goto LABEL_50;
          }
          *(unsigned char *)(v5 + 219) = self->_arWalkingUsedInRoutePlanning;
          *(void *)(v5 + 240) |= 0x10000uLL;
          $896FCD321D059B35A66825024FB599E5 v35 = self->_flags;
          if ((*(_WORD *)&v35 & 0x8000) == 0)
          {
LABEL_51:
            if ((*(_WORD *)&v35 & 0x1000) == 0) {
              goto LABEL_52;
            }
            goto LABEL_91;
          }
LABEL_90:
          *(unsigned char *)(v5 + 218) = self->_arWalkingUsedInNavigation;
          *(void *)(v5 + 240) |= 0x8000uLL;
          $896FCD321D059B35A66825024FB599E5 v35 = self->_flags;
          if ((*(_WORD *)&v35 & 0x1000) == 0)
          {
LABEL_52:
            if ((*(_WORD *)&v35 & 0x2000) == 0) {
              goto LABEL_53;
            }
            goto LABEL_92;
          }
LABEL_91:
          *(_DWORD *)(v5 + 212) = self->_voiceGuidanceLevel;
          *(void *)(v5 + 240) |= 0x1000uLL;
          $896FCD321D059B35A66825024FB599E5 v35 = self->_flags;
          if ((*(_WORD *)&v35 & 0x2000) == 0)
          {
LABEL_53:
            if ((*(_DWORD *)&v35 & 0x2000000) == 0) {
              goto LABEL_54;
            }
            goto LABEL_93;
          }
LABEL_92:
          *(unsigned char *)(v5 + 216) = self->_hFPEnabled;
          *(void *)(v5 + 240) |= 0x2000uLL;
          $896FCD321D059B35A66825024FB599E5 v35 = self->_flags;
          if ((*(_DWORD *)&v35 & 0x2000000) == 0)
          {
LABEL_54:
            if ((*(_DWORD *)&v35 & 0x20000000) == 0) {
              goto LABEL_55;
            }
            goto LABEL_94;
          }
LABEL_93:
          *(unsigned char *)(v5 + 228) = self->_isInParkingMode;
          *(void *)(v5 + 240) |= 0x2000000uLL;
          $896FCD321D059B35A66825024FB599E5 v35 = self->_flags;
          if ((*(_DWORD *)&v35 & 0x20000000) == 0)
          {
LABEL_55:
            if ((*(_DWORD *)&v35 & 0x80000000) == 0) {
              goto LABEL_56;
            }
            goto LABEL_95;
          }
LABEL_94:
          *(unsigned char *)(v5 + 232) = self->_isSuggestToWalkingTriggered;
          *(void *)(v5 + 240) |= 0x20000000uLL;
          $896FCD321D059B35A66825024FB599E5 v35 = self->_flags;
          if ((*(_DWORD *)&v35 & 0x80000000) == 0)
          {
LABEL_56:
            if ((*(_DWORD *)&v35 & 0x10000000) == 0) {
              goto LABEL_57;
            }
            goto LABEL_96;
          }
LABEL_95:
          *(unsigned char *)(v5 + 234) = self->_isTransitedToWalking;
          *(void *)(v5 + 240) |= 0x80000000uLL;
          $896FCD321D059B35A66825024FB599E5 v35 = self->_flags;
          if ((*(_DWORD *)&v35 & 0x10000000) == 0)
          {
LABEL_57:
            if ((*(_DWORD *)&v35 & 0x40000000) == 0) {
              goto LABEL_58;
            }
            goto LABEL_97;
          }
LABEL_96:
          *(unsigned char *)(v5 + 231) = self->_isSuggestToFindmyTriggered;
          *(void *)(v5 + 240) |= 0x10000000uLL;
          $896FCD321D059B35A66825024FB599E5 v35 = self->_flags;
          if ((*(_DWORD *)&v35 & 0x40000000) == 0)
          {
LABEL_58:
            if ((*(_DWORD *)&v35 & 0x800000) == 0) {
              goto LABEL_59;
            }
            goto LABEL_98;
          }
LABEL_97:
          *(unsigned char *)(v5 + 233) = self->_isTransitedToFindmy;
          *(void *)(v5 + 240) |= 0x40000000uLL;
          $896FCD321D059B35A66825024FB599E5 v35 = self->_flags;
          if ((*(_DWORD *)&v35 & 0x800000) == 0)
          {
LABEL_59:
            if ((*(_DWORD *)&v35 & 0x4000000) == 0) {
              goto LABEL_60;
            }
            goto LABEL_99;
          }
LABEL_98:
          *(unsigned char *)(v5 + 226) = self->_isEndRouteTermination;
          *(void *)(v5 + 240) |= 0x800000uLL;
          $896FCD321D059B35A66825024FB599E5 v35 = self->_flags;
          if ((*(_DWORD *)&v35 & 0x4000000) == 0)
          {
LABEL_60:
            if ((*(void *)&v35 & 0x200000000) == 0) {
              goto LABEL_61;
            }
            goto LABEL_100;
          }
LABEL_99:
          *(unsigned char *)(v5 + 229) = self->_isParkedCarTermination;
          *(void *)(v5 + 240) |= 0x4000000uLL;
          $896FCD321D059B35A66825024FB599E5 v35 = self->_flags;
          if ((*(void *)&v35 & 0x200000000) == 0)
          {
LABEL_61:
            if ((*(void *)&v35 & 0x100000000) == 0) {
              goto LABEL_63;
            }
            goto LABEL_62;
          }
LABEL_100:
          *(unsigned char *)(v5 + 236) = self->_isTransitionToWalkingTermination;
          *(void *)(v5 + 240) |= 0x200000000uLL;
          if ((*(void *)&self->_flags & 0x100000000) == 0)
          {
LABEL_63:
            id v36 = -[GEOLocation copyWithZone:](self->_parkingDetectionLocation, "copyWithZone:", a3, (void)v45);
            long long v37 = *(void **)(v5 + 136);
            *(void *)(v5 + 136) = v36;

            $896FCD321D059B35A66825024FB599E5 v38 = self->_flags;
            if ((*(unsigned char *)&v38 & 8) != 0)
            {
              *(double *)(v5 + 144) = self->_timeBetweenParkedAndArrival;
              *(void *)(v5 + 240) |= 8uLL;
              $896FCD321D059B35A66825024FB599E5 v38 = self->_flags;
              if ((*(unsigned char *)&v38 & 0x20) == 0)
              {
LABEL_65:
                if ((*(unsigned char *)&v38 & 0x40) == 0)
                {
LABEL_67:
                  id v39 = [(GEOLocation *)self->_arrivalLocation copyWithZone:a3];
                  v40 = *(void **)(v5 + 80);
                  *(void *)(v5 + 80) = v39;

                  id v41 = (id)v5;
                  goto LABEL_68;
                }
LABEL_66:
                *(_DWORD *)(v5 + 188) = self->_inParkingModeCount;
                *(void *)(v5 + 240) |= 0x40uLL;
                goto LABEL_67;
              }
            }
            else if ((*(unsigned char *)&v38 & 0x20) == 0)
            {
              goto LABEL_65;
            }
            *(_DWORD *)(v5 + 184) = self->_arrivedAtDestinationCount;
            *(void *)(v5 + 240) |= 0x20uLL;
            if ((*(void *)&self->_flags & 0x40) == 0) {
              goto LABEL_67;
            }
            goto LABEL_66;
          }
LABEL_62:
          *(unsigned char *)(v5 + 235) = self->_isTransitionToFindmyTermination;
          *(void *)(v5 + 240) |= 0x100000000uLL;
          goto LABEL_63;
        }
LABEL_40:
        *(_DWORD *)(v5 + 208) = self->_stateOfChargeDiffAtDest;
        *(void *)(v5 + 240) |= 0x800uLL;
        goto LABEL_41;
      }
LABEL_33:
      *(unsigned char *)(v5 + 230) = self->_isSiriEngaged;
      *(void *)(v5 + 240) |= 0x8000000uLL;
      goto LABEL_34;
    }
LABEL_16:
    *(GEOSessionID *)(v5 + 64) = self->_navSessionId;
    *(void *)(v5 + 240) |= 2uLL;
    goto LABEL_17;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*((unsigned char *)&self->_flags + 5) & 0x20) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgEventDirectionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_68:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_276;
  }
  [(GEOLogMsgEventDirections *)self readAll:1];
  [v4 readAll:1];
  directionsFeedbacks = self->_directionsFeedbacks;
  if ((unint64_t)directionsFeedbacks | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](directionsFeedbacks, "isEqual:")) {
      goto LABEL_276;
    }
  }
  finalLocation = self->_finalLocation;
  if ((unint64_t)finalLocation | *((void *)v4 + 16))
  {
    if (!-[GEOLocation isEqual:](finalLocation, "isEqual:")) {
      goto LABEL_276;
    }
  }
  $896FCD321D059B35A66825024FB599E5 flags = self->_flags;
  uint64_t v8 = *((void *)v4 + 30);
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0) {
      goto LABEL_276;
    }
    if (self->_arrivedAtDestination)
    {
      if (!v4[220]) {
        goto LABEL_276;
      }
    }
    else if (v4[220])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_276;
  }
  if (*(unsigned char *)&flags & 1) != 0 && (v8)
  {
    if (memcmp(&self->_navigationAudioFeedback, v4 + 16, 0x2CuLL)) {
      goto LABEL_276;
    }
  }
  else if ((*(_DWORD *)&flags | v8))
  {
    goto LABEL_276;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_durationOfTrip != *((double *)v4 + 13)) {
      goto LABEL_276;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_276;
  }
  if ((*(unsigned char *)&flags & 2) != 0 && (v8 & 2) != 0)
  {
    if (self->_navSessionId._high != *((void *)v4 + 8) || self->_navSessionId._low != *((void *)v4 + 9)) {
      goto LABEL_276;
    }
  }
  else if (((*(_DWORD *)&flags | v8) & 2) != 0)
  {
    goto LABEL_276;
  }
  durationInNavigationModes = self->_durationInNavigationModes;
  if ((unint64_t)durationInNavigationModes | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](durationInNavigationModes, "isEqual:")) {
      goto LABEL_276;
    }
    $896FCD321D059B35A66825024FB599E5 flags = self->_flags;
    uint64_t v8 = *((void *)v4 + 30);
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_originalEta != *((_DWORD *)v4 + 48)) {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_276;
  }
  if ((*(void *)&flags & 0x800000000) != 0)
  {
    if ((v8 & 0x800000000) == 0) {
      goto LABEL_276;
    }
    if (self->_preArrival)
    {
      if (!v4[238]) {
        goto LABEL_276;
      }
    }
    else if (v4[238])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x800000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&flags & 0x400000) != 0)
  {
    if ((v8 & 0x400000) == 0) {
      goto LABEL_276;
    }
    if (self->_isCyclingNlgAvailable)
    {
      if (!v4[225]) {
        goto LABEL_276;
      }
    }
    else if (v4[225])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x400000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&flags & 0x200000) != 0)
  {
    if ((v8 & 0x200000) == 0) {
      goto LABEL_276;
    }
    if (self->_isCoarseLocationUsed)
    {
      if (!v4[224]) {
        goto LABEL_276;
      }
    }
    else if (v4[224])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x200000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(void *)&flags & 0x400000000) != 0)
  {
    if ((v8 & 0x400000000) == 0) {
      goto LABEL_276;
    }
    if (self->_isVlfImprovementUsed)
    {
      if (!v4[237]) {
        goto LABEL_276;
      }
    }
    else if (v4[237])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x400000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v8 & 0x4000) == 0) {
      goto LABEL_276;
    }
    if (self->_acceptedCyclingWorkout)
    {
      if (!v4[217]) {
        goto LABEL_276;
      }
    }
    else if (v4[217])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x4000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0) {
      goto LABEL_276;
    }
    if (self->_batteryDied)
    {
      if (!v4[221]) {
        goto LABEL_276;
      }
    }
    else if (v4[221])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0) {
      goto LABEL_276;
    }
    if (self->_chargingStopAdded)
    {
      if (!v4[222]) {
        goto LABEL_276;
      }
    }
    else if (v4[222])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&flags & 0x8000000) != 0)
  {
    if ((v8 & 0x8000000) == 0) {
      goto LABEL_276;
    }
    if (self->_isSiriEngaged)
    {
      if (!v4[230]) {
        goto LABEL_276;
      }
    }
    else if (v4[230])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x8000000) != 0)
  {
    goto LABEL_276;
  }
  tripOrigin = self->_tripOrigin;
  if ((unint64_t)tripOrigin | *((void *)v4 + 19))
  {
    if (!-[GEOLatLng isEqual:](tripOrigin, "isEqual:")) {
      goto LABEL_276;
    }
    $896FCD321D059B35A66825024FB599E5 flags = self->_flags;
    uint64_t v8 = *((void *)v4 + 30);
  }
  if ((*(_DWORD *)&flags & 0x100000) != 0)
  {
    if ((v8 & 0x100000) == 0) {
      goto LABEL_276;
    }
    if (self->_isBadEvExperience)
    {
      if (!v4[223]) {
        goto LABEL_276;
      }
    }
    else if (v4[223])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x100000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&flags & 0x1000000) != 0)
  {
    if ((v8 & 0x1000000) == 0) {
      goto LABEL_276;
    }
    if (self->_isEvSampleTrip)
    {
      if (!v4[227]) {
        goto LABEL_276;
      }
    }
    else if (v4[227])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x1000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_stateOfChargeAtOrigin != *((_DWORD *)v4 + 51)) {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_stateOfChargeAtDestPredicted != *((_DWORD *)v4 + 50)) {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_stateOfChargeAtDestActual != *((_DWORD *)v4 + 49)) {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_stateOfChargeDiffAtDest != *((_DWORD *)v4 + 52)) {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_276;
  }
  waypoints = self->_waypoints;
  if ((unint64_t)waypoints | *((void *)v4 + 20)
    && !-[NSMutableArray isEqual:](waypoints, "isEqual:"))
  {
    goto LABEL_276;
  }
  evConsumptionModel = self->_evConsumptionModel;
  if ((unint64_t)evConsumptionModel | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](evConsumptionModel, "isEqual:")) {
      goto LABEL_276;
    }
  }
  evChargingMode = self->_evChargingMode;
  if ((unint64_t)evChargingMode | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](evChargingMode, "isEqual:")) {
      goto LABEL_276;
    }
  }
  $896FCD321D059B35A66825024FB599E5 v15 = self->_flags;
  uint64_t v16 = *((void *)v4 + 30);
  if ((*(unsigned char *)&v15 & 0x10) != 0)
  {
    if ((v16 & 0x10) == 0 || self->_activeNavMode != *((_DWORD *)v4 + 45)) {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x10) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&v15 & 0x10000) != 0)
  {
    if ((v16 & 0x10000) == 0) {
      goto LABEL_276;
    }
    if (self->_arWalkingUsedInRoutePlanning)
    {
      if (!v4[219]) {
        goto LABEL_276;
      }
    }
    else if (v4[219])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x10000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_WORD *)&v15 & 0x8000) != 0)
  {
    if ((v16 & 0x8000) == 0) {
      goto LABEL_276;
    }
    if (self->_arWalkingUsedInNavigation)
    {
      if (!v4[218]) {
        goto LABEL_276;
      }
    }
    else if (v4[218])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x8000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_WORD *)&v15 & 0x1000) != 0)
  {
    if ((v16 & 0x1000) == 0 || self->_voiceGuidanceLevel != *((_DWORD *)v4 + 53)) {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x1000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_WORD *)&v15 & 0x2000) != 0)
  {
    if ((v16 & 0x2000) == 0) {
      goto LABEL_276;
    }
    if (self->_hFPEnabled)
    {
      if (!v4[216]) {
        goto LABEL_276;
      }
    }
    else if (v4[216])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x2000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&v15 & 0x2000000) != 0)
  {
    if ((v16 & 0x2000000) == 0) {
      goto LABEL_276;
    }
    if (self->_isInParkingMode)
    {
      if (!v4[228]) {
        goto LABEL_276;
      }
    }
    else if (v4[228])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x2000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&v15 & 0x20000000) != 0)
  {
    if ((v16 & 0x20000000) == 0) {
      goto LABEL_276;
    }
    if (self->_isSuggestToWalkingTriggered)
    {
      if (!v4[232]) {
        goto LABEL_276;
      }
    }
    else if (v4[232])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x20000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&v15 & 0x80000000) != 0)
  {
    if ((v16 & 0x80000000) == 0) {
      goto LABEL_276;
    }
    if (self->_isTransitedToWalking)
    {
      if (!v4[234]) {
        goto LABEL_276;
      }
    }
    else if (v4[234])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x80000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&v15 & 0x10000000) != 0)
  {
    if ((v16 & 0x10000000) == 0) {
      goto LABEL_276;
    }
    if (self->_isSuggestToFindmyTriggered)
    {
      if (!v4[231]) {
        goto LABEL_276;
      }
    }
    else if (v4[231])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x10000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&v15 & 0x40000000) != 0)
  {
    if ((v16 & 0x40000000) == 0) {
      goto LABEL_276;
    }
    if (self->_isTransitedToFindmy)
    {
      if (!v4[233]) {
        goto LABEL_276;
      }
    }
    else if (v4[233])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x40000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&v15 & 0x800000) != 0)
  {
    if ((v16 & 0x800000) == 0) {
      goto LABEL_276;
    }
    if (self->_isEndRouteTermination)
    {
      if (!v4[226]) {
        goto LABEL_276;
      }
    }
    else if (v4[226])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x800000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&v15 & 0x4000000) != 0)
  {
    if ((v16 & 0x4000000) == 0) {
      goto LABEL_276;
    }
    if (self->_isParkedCarTermination)
    {
      if (!v4[229]) {
        goto LABEL_276;
      }
    }
    else if (v4[229])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x4000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(void *)&v15 & 0x200000000) != 0)
  {
    if ((v16 & 0x200000000) == 0) {
      goto LABEL_276;
    }
    if (self->_isTransitionToWalkingTermination)
    {
      if (!v4[236]) {
        goto LABEL_276;
      }
    }
    else if (v4[236])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x200000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(void *)&v15 & 0x100000000) != 0)
  {
    if ((v16 & 0x100000000) == 0) {
      goto LABEL_276;
    }
    if (self->_isTransitionToFindmyTermination)
    {
      if (!v4[235]) {
        goto LABEL_276;
      }
    }
    else if (v4[235])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x100000000) != 0)
  {
    goto LABEL_276;
  }
  parkingDetectionLocation = self->_parkingDetectionLocation;
  if (!((unint64_t)parkingDetectionLocation | *((void *)v4 + 17))) {
    goto LABEL_259;
  }
  if (!-[GEOLocation isEqual:](parkingDetectionLocation, "isEqual:"))
  {
LABEL_276:
    char v19 = 0;
    goto LABEL_277;
  }
  $896FCD321D059B35A66825024FB599E5 v15 = self->_flags;
  uint64_t v16 = *((void *)v4 + 30);
LABEL_259:
  if ((*(unsigned char *)&v15 & 8) != 0)
  {
    if ((v16 & 8) == 0 || self->_timeBetweenParkedAndArrival != *((double *)v4 + 18)) {
      goto LABEL_276;
    }
  }
  else if ((v16 & 8) != 0)
  {
    goto LABEL_276;
  }
  if ((*(unsigned char *)&v15 & 0x20) != 0)
  {
    if ((v16 & 0x20) == 0 || self->_arrivedAtDestinationCount != *((_DWORD *)v4 + 46)) {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x20) != 0)
  {
    goto LABEL_276;
  }
  if ((*(unsigned char *)&v15 & 0x40) != 0)
  {
    if ((v16 & 0x40) == 0 || self->_inParkingModeCount != *((_DWORD *)v4 + 47)) {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x40) != 0)
  {
    goto LABEL_276;
  }
  arrivalLocation = self->_arrivalLocation;
  if ((unint64_t)arrivalLocation | *((void *)v4 + 10)) {
    char v19 = -[GEOLocation isEqual:](arrivalLocation, "isEqual:");
  }
  else {
    char v19 = 1;
  }
LABEL_277:

  return v19;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventDirections *)self readAll:1];
  uint64_t v61 = [(NSMutableArray *)self->_directionsFeedbacks hash];
  unint64_t v60 = [(GEOLocation *)self->_finalLocation hash];
  $896FCD321D059B35A66825024FB599E5 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0)
  {
    uint64_t v59 = 0;
    if (*(unsigned char *)&flags) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v58 = 0;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v8 = 0;
    goto LABEL_13;
  }
  uint64_t v59 = 2654435761 * self->_arrivedAtDestination;
  if ((*(unsigned char *)&flags & 1) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v58 = PBHashBytes();
  $896FCD321D059B35A66825024FB599E5 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double durationOfTrip = self->_durationOfTrip;
  double v5 = -durationOfTrip;
  if (durationOfTrip >= 0.0) {
    double v5 = self->_durationOfTrip;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_13:
  unint64_t v57 = v8;
  if ((*(unsigned char *)&flags & 2) != 0) {
    uint64_t v56 = PBHashBytes();
  }
  else {
    uint64_t v56 = 0;
  }
  uint64_t v55 = [(NSMutableArray *)self->_durationInNavigationModes hash];
  $896FCD321D059B35A66825024FB599E5 v9 = self->_flags;
  if ((*(unsigned char *)&v9 & 0x80) != 0)
  {
    uint64_t v54 = 2654435761 * self->_originalEta;
    if ((*(void *)&v9 & 0x800000000) != 0)
    {
LABEL_18:
      uint64_t v53 = 2654435761 * self->_preArrival;
      if ((*(_DWORD *)&v9 & 0x400000) != 0) {
        goto LABEL_19;
      }
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v54 = 0;
    if ((*(void *)&v9 & 0x800000000) != 0) {
      goto LABEL_18;
    }
  }
  uint64_t v53 = 0;
  if ((*(_DWORD *)&v9 & 0x400000) != 0)
  {
LABEL_19:
    uint64_t v52 = 2654435761 * self->_isCyclingNlgAvailable;
    if ((*(_DWORD *)&v9 & 0x200000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v52 = 0;
  if ((*(_DWORD *)&v9 & 0x200000) != 0)
  {
LABEL_20:
    uint64_t v51 = 2654435761 * self->_isCoarseLocationUsed;
    if ((*(void *)&v9 & 0x400000000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v51 = 0;
  if ((*(void *)&v9 & 0x400000000) != 0)
  {
LABEL_21:
    uint64_t v50 = 2654435761 * self->_isVlfImprovementUsed;
    if ((*(_WORD *)&v9 & 0x4000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v50 = 0;
  if ((*(_WORD *)&v9 & 0x4000) != 0)
  {
LABEL_22:
    uint64_t v49 = 2654435761 * self->_acceptedCyclingWorkout;
    if ((*(_DWORD *)&v9 & 0x40000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v49 = 0;
  if ((*(_DWORD *)&v9 & 0x40000) != 0)
  {
LABEL_23:
    uint64_t v48 = 2654435761 * self->_batteryDied;
    if ((*(_DWORD *)&v9 & 0x80000) != 0) {
      goto LABEL_24;
    }
LABEL_33:
    uint64_t v47 = 0;
    if ((*(_DWORD *)&v9 & 0x8000000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_34;
  }
LABEL_32:
  uint64_t v48 = 0;
  if ((*(_DWORD *)&v9 & 0x80000) == 0) {
    goto LABEL_33;
  }
LABEL_24:
  uint64_t v47 = 2654435761 * self->_chargingStopAdded;
  if ((*(_DWORD *)&v9 & 0x8000000) != 0)
  {
LABEL_25:
    uint64_t v46 = 2654435761 * self->_isSiriEngaged;
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v46 = 0;
LABEL_35:
  unint64_t v45 = [(GEOLatLng *)self->_tripOrigin hash];
  $896FCD321D059B35A66825024FB599E5 v10 = self->_flags;
  if ((*(_DWORD *)&v10 & 0x100000) != 0)
  {
    uint64_t v44 = 2654435761 * self->_isBadEvExperience;
    if ((*(_DWORD *)&v10 & 0x1000000) != 0)
    {
LABEL_37:
      uint64_t v43 = 2654435761 * self->_isEvSampleTrip;
      if ((*(_WORD *)&v10 & 0x400) != 0) {
        goto LABEL_38;
      }
      goto LABEL_44;
    }
  }
  else
  {
    uint64_t v44 = 0;
    if ((*(_DWORD *)&v10 & 0x1000000) != 0) {
      goto LABEL_37;
    }
  }
  uint64_t v43 = 0;
  if ((*(_WORD *)&v10 & 0x400) != 0)
  {
LABEL_38:
    uint64_t v42 = 2654435761 * self->_stateOfChargeAtOrigin;
    if ((*(_WORD *)&v10 & 0x200) != 0) {
      goto LABEL_39;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v42 = 0;
  if ((*(_WORD *)&v10 & 0x200) != 0)
  {
LABEL_39:
    uint64_t v41 = 2654435761 * self->_stateOfChargeAtDestPredicted;
    if ((*(_WORD *)&v10 & 0x100) != 0) {
      goto LABEL_40;
    }
LABEL_46:
    uint64_t v40 = 0;
    if ((*(_WORD *)&v10 & 0x800) != 0) {
      goto LABEL_41;
    }
    goto LABEL_47;
  }
LABEL_45:
  uint64_t v41 = 0;
  if ((*(_WORD *)&v10 & 0x100) == 0) {
    goto LABEL_46;
  }
LABEL_40:
  uint64_t v40 = 2654435761 * self->_stateOfChargeAtDestActual;
  if ((*(_WORD *)&v10 & 0x800) != 0)
  {
LABEL_41:
    uint64_t v39 = 2654435761 * self->_stateOfChargeDiffAtDest;
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v39 = 0;
LABEL_48:
  uint64_t v38 = [(NSMutableArray *)self->_waypoints hash];
  NSUInteger v37 = [(NSString *)self->_evConsumptionModel hash];
  NSUInteger v36 = [(NSString *)self->_evChargingMode hash];
  $896FCD321D059B35A66825024FB599E5 v11 = self->_flags;
  if ((*(unsigned char *)&v11 & 0x10) != 0)
  {
    uint64_t v35 = 2654435761 * self->_activeNavMode;
    if ((*(_DWORD *)&v11 & 0x10000) != 0)
    {
LABEL_50:
      uint64_t v34 = 2654435761 * self->_arWalkingUsedInRoutePlanning;
      if ((*(_WORD *)&v11 & 0x8000) != 0) {
        goto LABEL_51;
      }
      goto LABEL_65;
    }
  }
  else
  {
    uint64_t v35 = 0;
    if ((*(_DWORD *)&v11 & 0x10000) != 0) {
      goto LABEL_50;
    }
  }
  uint64_t v34 = 0;
  if ((*(_WORD *)&v11 & 0x8000) != 0)
  {
LABEL_51:
    uint64_t v33 = 2654435761 * self->_arWalkingUsedInNavigation;
    if ((*(_WORD *)&v11 & 0x1000) != 0) {
      goto LABEL_52;
    }
    goto LABEL_66;
  }
LABEL_65:
  uint64_t v33 = 0;
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
LABEL_52:
    uint64_t v32 = 2654435761 * self->_voiceGuidanceLevel;
    if ((*(_WORD *)&v11 & 0x2000) != 0) {
      goto LABEL_53;
    }
    goto LABEL_67;
  }
LABEL_66:
  uint64_t v32 = 0;
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
LABEL_53:
    uint64_t v31 = 2654435761 * self->_hFPEnabled;
    if ((*(_DWORD *)&v11 & 0x2000000) != 0) {
      goto LABEL_54;
    }
    goto LABEL_68;
  }
LABEL_67:
  uint64_t v31 = 0;
  if ((*(_DWORD *)&v11 & 0x2000000) != 0)
  {
LABEL_54:
    uint64_t v30 = 2654435761 * self->_isInParkingMode;
    if ((*(_DWORD *)&v11 & 0x20000000) != 0) {
      goto LABEL_55;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v30 = 0;
  if ((*(_DWORD *)&v11 & 0x20000000) != 0)
  {
LABEL_55:
    uint64_t v29 = 2654435761 * self->_isSuggestToWalkingTriggered;
    if ((*(_DWORD *)&v11 & 0x80000000) != 0) {
      goto LABEL_56;
    }
    goto LABEL_70;
  }
LABEL_69:
  uint64_t v29 = 0;
  if ((*(_DWORD *)&v11 & 0x80000000) != 0)
  {
LABEL_56:
    uint64_t v28 = 2654435761 * self->_isTransitedToWalking;
    if ((*(_DWORD *)&v11 & 0x10000000) != 0) {
      goto LABEL_57;
    }
    goto LABEL_71;
  }
LABEL_70:
  uint64_t v28 = 0;
  if ((*(_DWORD *)&v11 & 0x10000000) != 0)
  {
LABEL_57:
    uint64_t v12 = 2654435761 * self->_isSuggestToFindmyTriggered;
    if ((*(_DWORD *)&v11 & 0x40000000) != 0) {
      goto LABEL_58;
    }
    goto LABEL_72;
  }
LABEL_71:
  uint64_t v12 = 0;
  if ((*(_DWORD *)&v11 & 0x40000000) != 0)
  {
LABEL_58:
    uint64_t v13 = 2654435761 * self->_isTransitedToFindmy;
    if ((*(_DWORD *)&v11 & 0x800000) != 0) {
      goto LABEL_59;
    }
    goto LABEL_73;
  }
LABEL_72:
  uint64_t v13 = 0;
  if ((*(_DWORD *)&v11 & 0x800000) != 0)
  {
LABEL_59:
    uint64_t v14 = 2654435761 * self->_isEndRouteTermination;
    if ((*(_DWORD *)&v11 & 0x4000000) != 0) {
      goto LABEL_60;
    }
    goto LABEL_74;
  }
LABEL_73:
  uint64_t v14 = 0;
  if ((*(_DWORD *)&v11 & 0x4000000) != 0)
  {
LABEL_60:
    uint64_t v15 = 2654435761 * self->_isParkedCarTermination;
    if ((*(void *)&v11 & 0x200000000) != 0) {
      goto LABEL_61;
    }
LABEL_75:
    uint64_t v16 = 0;
    if ((*(void *)&v11 & 0x100000000) != 0) {
      goto LABEL_62;
    }
    goto LABEL_76;
  }
LABEL_74:
  uint64_t v15 = 0;
  if ((*(void *)&v11 & 0x200000000) == 0) {
    goto LABEL_75;
  }
LABEL_61:
  uint64_t v16 = 2654435761 * self->_isTransitionToWalkingTermination;
  if ((*(void *)&v11 & 0x100000000) != 0)
  {
LABEL_62:
    uint64_t v17 = 2654435761 * self->_isTransitionToFindmyTermination;
    goto LABEL_77;
  }
LABEL_76:
  uint64_t v17 = 0;
LABEL_77:
  unint64_t v18 = [(GEOLocation *)self->_parkingDetectionLocation hash];
  $896FCD321D059B35A66825024FB599E5 v19 = self->_flags;
  if ((*(unsigned char *)&v19 & 8) != 0)
  {
    double timeBetweenParkedAndArrival = self->_timeBetweenParkedAndArrival;
    double v22 = -timeBetweenParkedAndArrival;
    if (timeBetweenParkedAndArrival >= 0.0) {
      double v22 = self->_timeBetweenParkedAndArrival;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  if ((*(unsigned char *)&v19 & 0x20) != 0)
  {
    uint64_t v25 = 2654435761 * self->_arrivedAtDestinationCount;
    if ((*(unsigned char *)&v19 & 0x40) != 0) {
      goto LABEL_87;
    }
LABEL_89:
    uint64_t v26 = 0;
    return v60 ^ v61 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v25 ^ v26 ^ [(GEOLocation *)self->_arrivalLocation hash];
  }
  uint64_t v25 = 0;
  if ((*(unsigned char *)&v19 & 0x40) == 0) {
    goto LABEL_89;
  }
LABEL_87:
  uint64_t v26 = 2654435761 * self->_inParkingModeCount;
  return v60 ^ v61 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v25 ^ v26 ^ [(GEOLocation *)self->_arrivalLocation hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (char *)a3;
  [v4 readAll:0];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v5 = *((id *)v4 + 11);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v44 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOLogMsgEventDirections *)self addDirectionsFeedback:*(void *)(*((void *)&v43 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v7);
  }

  finalLocation = self->_finalLocation;
  uint64_t v11 = *((void *)v4 + 16);
  if (finalLocation)
  {
    if (v11) {
      -[GEOLocation mergeFrom:](finalLocation, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOLogMsgEventDirections setFinalLocation:](self, "setFinalLocation:");
  }
  uint64_t v12 = *((void *)v4 + 30);
  if ((v12 & 0x20000) != 0)
  {
    self->_arrivedAtDestination = v4[220];
    *(void *)&self->_flags |= 0x20000uLL;
    uint64_t v12 = *((void *)v4 + 30);
    if ((v12 & 1) == 0)
    {
LABEL_15:
      if ((v12 & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_40;
    }
  }
  else if ((v12 & 1) == 0)
  {
    goto LABEL_15;
  }
  long long v21 = *(_OWORD *)(v4 + 44);
  long long v22 = *((_OWORD *)v4 + 2);
  *(_OWORD *)&self->_navigationAudioFeedback._bTHFPAvailableAtEndOfNav = *((_OWORD *)v4 + 1);
  *(_OWORD *)&self->_navigationAudioFeedback._manuallyChangedRouteCount = v22;
  *(_OWORD *)&self->_navigationAudioFeedback._pauseSpokenAudioEnabled = v21;
  *(void *)&self->_flags |= 1uLL;
  uint64_t v12 = *((void *)v4 + 30);
  if ((v12 & 4) == 0)
  {
LABEL_16:
    if ((v12 & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_40:
  self->_double durationOfTrip = *((double *)v4 + 13);
  *(void *)&self->_flags |= 4uLL;
  if ((*((void *)v4 + 30) & 2) != 0)
  {
LABEL_17:
    self->_navSessionId = (GEOSessionID)*((_OWORD *)v4 + 4);
    *(void *)&self->_flags |= 2uLL;
  }
LABEL_18:
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v13 = *((id *)v4 + 12);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(v13);
        }
        [(GEOLogMsgEventDirections *)self addDurationInNavigationMode:*(void *)(*((void *)&v39 + 1) + 8 * j)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v15);
  }

  uint64_t v18 = *((void *)v4 + 30);
  if ((v18 & 0x80) != 0)
  {
    self->_originalEta = *((_DWORD *)v4 + 48);
    *(void *)&self->_flags |= 0x80uLL;
    uint64_t v18 = *((void *)v4 + 30);
    if ((v18 & 0x800000000) == 0)
    {
LABEL_27:
      if ((v18 & 0x400000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_44;
    }
  }
  else if ((v18 & 0x800000000) == 0)
  {
    goto LABEL_27;
  }
  self->_preArrival = v4[238];
  *(void *)&self->_flags |= 0x800000000uLL;
  uint64_t v18 = *((void *)v4 + 30);
  if ((v18 & 0x400000) == 0)
  {
LABEL_28:
    if ((v18 & 0x200000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_isCyclingNlgAvailable = v4[225];
  *(void *)&self->_flags |= 0x400000uLL;
  uint64_t v18 = *((void *)v4 + 30);
  if ((v18 & 0x200000) == 0)
  {
LABEL_29:
    if ((v18 & 0x400000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_isCoarseLocationUsed = v4[224];
  *(void *)&self->_flags |= 0x200000uLL;
  uint64_t v18 = *((void *)v4 + 30);
  if ((v18 & 0x400000000) == 0)
  {
LABEL_30:
    if ((v18 & 0x4000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_isVlfImprovementUsed = v4[237];
  *(void *)&self->_flags |= 0x400000000uLL;
  uint64_t v18 = *((void *)v4 + 30);
  if ((v18 & 0x4000) == 0)
  {
LABEL_31:
    if ((v18 & 0x40000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_acceptedCyclingWorkout = v4[217];
  *(void *)&self->_flags |= 0x4000uLL;
  uint64_t v18 = *((void *)v4 + 30);
  if ((v18 & 0x40000) == 0)
  {
LABEL_32:
    if ((v18 & 0x80000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_batteryDied = v4[221];
  *(void *)&self->_flags |= 0x40000uLL;
  uint64_t v18 = *((void *)v4 + 30);
  if ((v18 & 0x80000) == 0)
  {
LABEL_33:
    if ((v18 & 0x8000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_49:
  self->_chargingStopAdded = v4[222];
  *(void *)&self->_flags |= 0x80000uLL;
  if ((*((void *)v4 + 30) & 0x8000000) != 0)
  {
LABEL_34:
    self->_isSiriEngaged = v4[230];
    *(void *)&self->_flags |= 0x8000000uLL;
  }
LABEL_35:
  tripOrigin = self->_tripOrigin;
  uint64_t v20 = *((void *)v4 + 19);
  if (tripOrigin)
  {
    if (v20) {
      -[GEOLatLng mergeFrom:](tripOrigin, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[GEOLogMsgEventDirections setTripOrigin:](self, "setTripOrigin:");
  }
  uint64_t v23 = *((void *)v4 + 30);
  if ((v23 & 0x100000) != 0)
  {
    self->_isBadEvExperience = v4[223];
    *(void *)&self->_flags |= 0x100000uLL;
    uint64_t v23 = *((void *)v4 + 30);
    if ((v23 & 0x1000000) == 0)
    {
LABEL_55:
      if ((v23 & 0x400) == 0) {
        goto LABEL_56;
      }
      goto LABEL_91;
    }
  }
  else if ((v23 & 0x1000000) == 0)
  {
    goto LABEL_55;
  }
  self->_isEvSampleTrip = v4[227];
  *(void *)&self->_flags |= 0x1000000uLL;
  uint64_t v23 = *((void *)v4 + 30);
  if ((v23 & 0x400) == 0)
  {
LABEL_56:
    if ((v23 & 0x200) == 0) {
      goto LABEL_57;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_stateOfChargeAtOrigin = *((_DWORD *)v4 + 51);
  *(void *)&self->_flags |= 0x400uLL;
  uint64_t v23 = *((void *)v4 + 30);
  if ((v23 & 0x200) == 0)
  {
LABEL_57:
    if ((v23 & 0x100) == 0) {
      goto LABEL_58;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_stateOfChargeAtDestPredicted = *((_DWORD *)v4 + 50);
  *(void *)&self->_flags |= 0x200uLL;
  uint64_t v23 = *((void *)v4 + 30);
  if ((v23 & 0x100) == 0)
  {
LABEL_58:
    if ((v23 & 0x800) == 0) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
LABEL_93:
  self->_stateOfChargeAtDestActual = *((_DWORD *)v4 + 49);
  *(void *)&self->_flags |= 0x100uLL;
  if ((*((void *)v4 + 30) & 0x800) != 0)
  {
LABEL_59:
    self->_stateOfChargeDiffAtDest = *((_DWORD *)v4 + 52);
    *(void *)&self->_flags |= 0x800uLL;
  }
LABEL_60:
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v24 = *((id *)v4 + 20);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(v24);
        }
        -[GEOLogMsgEventDirections addWaypoints:](self, "addWaypoints:", *(void *)(*((void *)&v35 + 1) + 8 * k), (void)v35);
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v26);
  }

  if (*((void *)v4 + 15)) {
    -[GEOLogMsgEventDirections setEvConsumptionModel:](self, "setEvConsumptionModel:");
  }
  if (*((void *)v4 + 14)) {
    -[GEOLogMsgEventDirections setEvChargingMode:](self, "setEvChargingMode:");
  }
  uint64_t v29 = *((void *)v4 + 30);
  if ((v29 & 0x10) != 0)
  {
    self->_activeNavMode = *((_DWORD *)v4 + 45);
    *(void *)&self->_flags |= 0x10uLL;
    uint64_t v29 = *((void *)v4 + 30);
    if ((v29 & 0x10000) == 0)
    {
LABEL_73:
      if ((v29 & 0x8000) == 0) {
        goto LABEL_74;
      }
      goto LABEL_97;
    }
  }
  else if ((v29 & 0x10000) == 0)
  {
    goto LABEL_73;
  }
  self->_arWalkingUsedInRoutePlanning = v4[219];
  *(void *)&self->_flags |= 0x10000uLL;
  uint64_t v29 = *((void *)v4 + 30);
  if ((v29 & 0x8000) == 0)
  {
LABEL_74:
    if ((v29 & 0x1000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_arWalkingUsedInNavigation = v4[218];
  *(void *)&self->_flags |= 0x8000uLL;
  uint64_t v29 = *((void *)v4 + 30);
  if ((v29 & 0x1000) == 0)
  {
LABEL_75:
    if ((v29 & 0x2000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_99;
  }
LABEL_98:
  self->_voiceGuidanceLevel = *((_DWORD *)v4 + 53);
  *(void *)&self->_flags |= 0x1000uLL;
  uint64_t v29 = *((void *)v4 + 30);
  if ((v29 & 0x2000) == 0)
  {
LABEL_76:
    if ((v29 & 0x2000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_hFPEnabled = v4[216];
  *(void *)&self->_flags |= 0x2000uLL;
  uint64_t v29 = *((void *)v4 + 30);
  if ((v29 & 0x2000000) == 0)
  {
LABEL_77:
    if ((v29 & 0x20000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_101;
  }
LABEL_100:
  self->_isInParkingMode = v4[228];
  *(void *)&self->_flags |= 0x2000000uLL;
  uint64_t v29 = *((void *)v4 + 30);
  if ((v29 & 0x20000000) == 0)
  {
LABEL_78:
    if ((v29 & 0x80000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_102;
  }
LABEL_101:
  self->_isSuggestToWalkingTriggered = v4[232];
  *(void *)&self->_flags |= 0x20000000uLL;
  uint64_t v29 = *((void *)v4 + 30);
  if ((v29 & 0x80000000) == 0)
  {
LABEL_79:
    if ((v29 & 0x10000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_isTransitedToWalking = v4[234];
  *(void *)&self->_flags |= 0x80000000uLL;
  uint64_t v29 = *((void *)v4 + 30);
  if ((v29 & 0x10000000) == 0)
  {
LABEL_80:
    if ((v29 & 0x40000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_104;
  }
LABEL_103:
  self->_isSuggestToFindmyTriggered = v4[231];
  *(void *)&self->_flags |= 0x10000000uLL;
  uint64_t v29 = *((void *)v4 + 30);
  if ((v29 & 0x40000000) == 0)
  {
LABEL_81:
    if ((v29 & 0x800000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_isTransitedToFindmy = v4[233];
  *(void *)&self->_flags |= 0x40000000uLL;
  uint64_t v29 = *((void *)v4 + 30);
  if ((v29 & 0x800000) == 0)
  {
LABEL_82:
    if ((v29 & 0x4000000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_isEndRouteTermination = v4[226];
  *(void *)&self->_flags |= 0x800000uLL;
  uint64_t v29 = *((void *)v4 + 30);
  if ((v29 & 0x4000000) == 0)
  {
LABEL_83:
    if ((v29 & 0x200000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_107;
  }
LABEL_106:
  self->_isParkedCarTermination = v4[229];
  *(void *)&self->_flags |= 0x4000000uLL;
  uint64_t v29 = *((void *)v4 + 30);
  if ((v29 & 0x200000000) == 0)
  {
LABEL_84:
    if ((v29 & 0x100000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_85;
  }
LABEL_107:
  self->_isTransitionToWalkingTermination = v4[236];
  *(void *)&self->_flags |= 0x200000000uLL;
  if ((*((void *)v4 + 30) & 0x100000000) != 0)
  {
LABEL_85:
    self->_isTransitionToFindmyTermination = v4[235];
    *(void *)&self->_flags |= 0x100000000uLL;
  }
LABEL_86:
  parkingDetectionLocation = self->_parkingDetectionLocation;
  uint64_t v31 = *((void *)v4 + 17);
  if (parkingDetectionLocation)
  {
    if (v31) {
      -[GEOLocation mergeFrom:](parkingDetectionLocation, "mergeFrom:");
    }
  }
  else if (v31)
  {
    -[GEOLogMsgEventDirections setParkingDetectionLocation:](self, "setParkingDetectionLocation:");
  }
  uint64_t v32 = *((void *)v4 + 30);
  if ((v32 & 8) != 0)
  {
    self->_double timeBetweenParkedAndArrival = *((double *)v4 + 18);
    *(void *)&self->_flags |= 8uLL;
    uint64_t v32 = *((void *)v4 + 30);
    if ((v32 & 0x20) == 0)
    {
LABEL_113:
      if ((v32 & 0x40) == 0) {
        goto LABEL_115;
      }
      goto LABEL_114;
    }
  }
  else if ((v32 & 0x20) == 0)
  {
    goto LABEL_113;
  }
  self->_arrivedAtDestinationCount = *((_DWORD *)v4 + 46);
  *(void *)&self->_flags |= 0x20uLL;
  if ((*((void *)v4 + 30) & 0x40) != 0)
  {
LABEL_114:
    self->_inParkingModeCount = *((_DWORD *)v4 + 47);
    *(void *)&self->_flags |= 0x40uLL;
  }
LABEL_115:
  arrivalLocation = self->_arrivalLocation;
  uint64_t v34 = *((void *)v4 + 10);
  if (arrivalLocation)
  {
    if (v34) {
      -[GEOLocation mergeFrom:](arrivalLocation, "mergeFrom:");
    }
  }
  else if (v34)
  {
    -[GEOLogMsgEventDirections setArrivalLocation:](self, "setArrivalLocation:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_tripOrigin, 0);
  objc_storeStrong((id *)&self->_parkingDetectionLocation, 0);
  objc_storeStrong((id *)&self->_finalLocation, 0);
  objc_storeStrong((id *)&self->_evConsumptionModel, 0);
  objc_storeStrong((id *)&self->_evChargingMode, 0);
  objc_storeStrong((id *)&self->_durationInNavigationModes, 0);
  objc_storeStrong((id *)&self->_directionsFeedbacks, 0);
  objc_storeStrong((id *)&self->_arrivalLocation, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end