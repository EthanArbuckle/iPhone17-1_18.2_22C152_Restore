@interface CPNavigationSession
- (BOOL)sendsNavigationMetadata;
- (CPLaneGuidance)currentLaneGuidance;
- (CPMapTemplate)mapTemplate;
- (CPNavigationSession)initWithTrip:(id)a3 mapTemplate:(id)a4;
- (CPNavigationSessionManaging)manager;
- (CPTrip)trip;
- (NAFuture)navigationSessionManagerFuture;
- (NSArray)currentRoadNameVariants;
- (NSArray)destinationNameVariants;
- (NSArray)upcomingManeuvers;
- (NSMutableArray)laneGuidances;
- (NSMutableArray)maneuvers;
- (id)_currentTripId;
- (int64_t)maneuverState;
- (unint64_t)pauseReason;
- (void)_updateLaneGuidanceIndiciesWithStartIndex:(unsigned __int16)a3 laneGuidances:(id)a4;
- (void)_updateManeuverIndiciesWithStartIndex:(unsigned __int16)a3 maneuvers:(id)a4;
- (void)addLaneGuidances:(id)a3;
- (void)addManeuvers:(id)a3;
- (void)cancelTrip;
- (void)clientTripNotPausedException;
- (void)finishTrip;
- (void)pauseTripForReason:(CPTripPauseReason)reason description:(NSString *)description;
- (void)pauseTripForReason:(CPTripPauseReason)reason description:(NSString *)description turnCardColor:(UIColor *)turnCardColor;
- (void)resumeTripWithUpdatedRouteInformation:(id)a3;
- (void)setCurrentLaneGuidance:(id)a3;
- (void)setCurrentRoadNameVariants:(id)a3;
- (void)setDestinationNameVariants:(id)a3;
- (void)setLaneGuidances:(id)a3;
- (void)setManager:(id)a3;
- (void)setManeuverState:(int64_t)a3;
- (void)setManeuvers:(id)a3;
- (void)setMapTemplate:(id)a3;
- (void)setNavigationSessionManagerFuture:(id)a3;
- (void)setPauseReason:(unint64_t)a3;
- (void)setSendsNavigationMetadata:(BOOL)a3;
- (void)setTrip:(id)a3;
- (void)setUpcomingManeuvers:(NSArray *)upcomingManeuvers;
- (void)updateTravelEstimates:(CPTravelEstimates *)estimates forManeuver:(CPManeuver *)maneuver;
@end

@implementation CPNavigationSession

- (CPNavigationSession)initWithTrip:(id)a3 mapTemplate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CPNavigationSession;
  v9 = [(CPNavigationSession *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_trip, a3);
    objc_storeWeak((id *)&v10->_mapTemplate, v8);
    v11 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
    navigationSessionManagerFuture = v10->_navigationSessionManagerFuture;
    v10->_navigationSessionManagerFuture = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    maneuvers = v10->_maneuvers;
    v10->_maneuvers = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    laneGuidances = v10->_laneGuidances;
    v10->_laneGuidances = v15;
  }
  return v10;
}

- (id)_currentTripId
{
  v2 = [(CPNavigationSession *)self trip];
  v3 = [v2 identifier];

  return v3;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
  id v5 = a3;
  id v6 = [(CPNavigationSession *)self navigationSessionManagerFuture];
  [v6 finishWithResult:v5];
}

- (void)pauseTripForReason:(CPTripPauseReason)reason description:(NSString *)description
{
}

- (void)pauseTripForReason:(CPTripPauseReason)reason description:(NSString *)description turnCardColor:(UIColor *)turnCardColor
{
  id v8 = description;
  v9 = turnCardColor;
  [(CPNavigationSession *)self setPauseReason:reason];
  v10 = [(CPNavigationSession *)self navigationSessionManagerFuture];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__CPNavigationSession_pauseTripForReason_description_turnCardColor___block_invoke;
  v14[3] = &unk_264309F88;
  v16 = v9;
  CPTripPauseReason v17 = reason;
  v15 = v8;
  v11 = v9;
  v12 = v8;
  id v13 = (id)[v10 addSuccessBlock:v14];
}

void __68__CPNavigationSession_pauseTripForReason_description_turnCardColor___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[4];
  id v8 = v3;
  if (v4)
  {
    id v7 = CPSanitizedBackgroundColor(v4);
    [v8 pauseTripForReason:v5 description:v6 turnCardColor:v7];
  }
  else
  {
    [v3 pauseTripForReason:v5 description:v6 turnCardColor:0];
  }
  if (a1[6] == 4) {
    [v8 startRerouting];
  }
}

- (void)_updateManeuverIndiciesWithStartIndex:(unsigned __int16)a3 maneuvers:(id)a4
{
  int v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      int v10 = v4;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        int v4 = v10 + 1;
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) setIndex:(unsigned __int16)v10++];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_updateLaneGuidanceIndiciesWithStartIndex:(unsigned __int16)a3 laneGuidances:(id)a4
{
  int v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      int v10 = v4;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        int v4 = v10 + 1;
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) setIndex:(unsigned __int16)v10++];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)resumeTripWithUpdatedRouteInformation:(id)a3
{
  id v4 = a3;
  if ([(CPNavigationSession *)self pauseReason] != 4) {
    [(CPNavigationSession *)self clientTripNotPausedException];
  }
  [(CPNavigationSession *)self setPauseReason:0];
  id v5 = [v4 maneuvers];
  [(CPNavigationSession *)self _updateManeuverIndiciesWithStartIndex:0 maneuvers:v5];

  uint64_t v6 = [v4 laneGuidances];
  [(CPNavigationSession *)self _updateLaneGuidanceIndiciesWithStartIndex:0 laneGuidances:v6];

  uint64_t v7 = [(CPNavigationSession *)self trip];
  uint64_t v8 = [v7 destinationTimeZoneOffsetFromGMT];

  BOOL v9 = [(CPNavigationSession *)self sendsNavigationMetadata];
  int v10 = [(CPNavigationSession *)self currentRoadNameVariants];
  long long v11 = [(CPNavigationSession *)self destinationNameVariants];
  long long v12 = [v4 routeInfoWithAccNavSupported:v9 roadNameVariants:v10 destinationNameVariants:v11 timeZoneOffset:v8];

  long long v13 = [(CPNavigationSession *)self navigationSessionManagerFuture];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __61__CPNavigationSession_resumeTripWithUpdatedRouteInformation___block_invoke;
  v17[3] = &unk_264309FB0;
  id v18 = v12;
  v19 = self;
  id v20 = v4;
  id v14 = v4;
  id v15 = v12;
  id v16 = (id)[v13 addSuccessBlock:v17];
}

void __61__CPNavigationSession_resumeTripWithUpdatedRouteInformation___block_invoke(uint64_t a1, void *a2)
{
  [a2 routeChangedWithReason:0 routeInfo:*(void *)(a1 + 32)];
  id v6 = [*(id *)(a1 + 40) mapTemplate];
  id v3 = [*(id *)(a1 + 48) currentManeuvers];
  id v4 = [v3 firstObject];
  id v5 = [*(id *)(a1 + 48) maneuverTravelEstimates];
  [v6 _updateBannerIfNecessaryForManeuver:v4 travelEstimates:v5];
}

- (void)finishTrip
{
  [(CPNavigationSession *)self setPauseReason:0];
  id v3 = [(CPNavigationSession *)self maneuvers];
  [v3 removeAllObjects];

  id v4 = [(CPNavigationSession *)self laneGuidances];
  [v4 removeAllObjects];

  id v6 = [(CPNavigationSession *)self navigationSessionManagerFuture];
  id v5 = (id)[v6 addSuccessBlock:&__block_literal_global_3];
}

uint64_t __33__CPNavigationSession_finishTrip__block_invoke(uint64_t a1, void *a2)
{
  return [a2 finishTrip];
}

- (void)cancelTrip
{
  [(CPNavigationSession *)self setPauseReason:0];
  id v3 = [(CPNavigationSession *)self maneuvers];
  [v3 removeAllObjects];

  id v4 = [(CPNavigationSession *)self laneGuidances];
  [v4 removeAllObjects];

  id v6 = [(CPNavigationSession *)self navigationSessionManagerFuture];
  id v5 = (id)[v6 addSuccessBlock:&__block_literal_global_3];
}

uint64_t __33__CPNavigationSession_cancelTrip__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancelTrip];
}

- (void)addManeuvers:(id)a3
{
  id v4 = (void *)[a3 copy];
  id v5 = [(CPNavigationSession *)self maneuvers];
  if ([v5 count])
  {
    id v6 = [(CPNavigationSession *)self maneuvers];
    uint64_t v7 = [v6 lastObject];
    unsigned __int16 v8 = [v7 index] + 1;
  }
  else
  {
    unsigned __int16 v8 = 0;
  }

  [(CPNavigationSession *)self _updateManeuverIndiciesWithStartIndex:v8 maneuvers:v4];
  BOOL v9 = [(CPNavigationSession *)self maneuvers];
  [v9 addObjectsFromArray:v4];

  int v10 = [(CPNavigationSession *)self navigationSessionManagerFuture];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __36__CPNavigationSession_addManeuvers___block_invoke;
  v13[3] = &unk_264309FF8;
  id v14 = v4;
  id v11 = v4;
  id v12 = (id)[v10 addSuccessBlock:v13];
}

uint64_t __36__CPNavigationSession_addManeuvers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addManeuvers:*(void *)(a1 + 32)];
}

- (void)addLaneGuidances:(id)a3
{
  id v4 = (void *)[a3 copy];
  id v5 = [(CPNavigationSession *)self laneGuidances];
  if ([v5 count])
  {
    id v6 = [(CPNavigationSession *)self laneGuidances];
    uint64_t v7 = [v6 lastObject];
    unsigned __int16 v8 = [v7 index] + 1;
  }
  else
  {
    unsigned __int16 v8 = 0;
  }

  [(CPNavigationSession *)self _updateLaneGuidanceIndiciesWithStartIndex:v8 laneGuidances:v4];
  BOOL v9 = [(CPNavigationSession *)self laneGuidances];
  [v9 addObjectsFromArray:v4];

  int v10 = [(CPNavigationSession *)self navigationSessionManagerFuture];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __40__CPNavigationSession_addLaneGuidances___block_invoke;
  v13[3] = &unk_264309FF8;
  id v14 = v4;
  id v11 = v4;
  id v12 = (id)[v10 addSuccessBlock:v13];
}

uint64_t __40__CPNavigationSession_addLaneGuidances___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addLaneGuidances:*(void *)(a1 + 32)];
}

- (void)setUpcomingManeuvers:(NSArray *)upcomingManeuvers
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = upcomingManeuvers;
  objc_storeStrong((id *)&self->_upcomingManeuvers, upcomingManeuvers);
  id v6 = [MEMORY[0x263EFF980] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = v5;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * v11);
        long long v13 = [(CPNavigationSession *)self mapTemplate];
        uint64_t v14 = [v13 _displayStyleForManeuver:v12];

        id v15 = [NSNumber numberWithInteger:v14];
        [v6 addObject:v15];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  id v16 = [(CPNavigationSession *)self navigationSessionManagerFuture];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __44__CPNavigationSession_setUpcomingManeuvers___block_invoke;
  v20[3] = &unk_264309FB0;
  v21 = v7;
  id v22 = v6;
  v23 = self;
  id v17 = v6;
  id v18 = v7;
  id v19 = (id)[v16 addSuccessBlock:v20];
}

void __44__CPNavigationSession_setUpcomingManeuvers___block_invoke(uint64_t a1, void *a2)
{
  [a2 showManeuvers:*(void *)(a1 + 32) usingDisplayStyles:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) firstObject];
  if (v4)
  {
    id v3 = [*(id *)(a1 + 48) mapTemplate];
    [v3 _postBannerIfNecessaryForManeuver:v4];
  }
}

- (void)setCurrentLaneGuidance:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentLaneGuidance, a3);
  id v6 = [(CPNavigationSession *)self navigationSessionManagerFuture];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__CPNavigationSession_setCurrentLaneGuidance___block_invoke;
  v9[3] = &unk_264309FF8;
  id v10 = v5;
  id v7 = v5;
  id v8 = (id)[v6 addSuccessBlock:v9];
}

uint64_t __46__CPNavigationSession_setCurrentLaneGuidance___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32)) {
    return objc_msgSend(a2, "setCurrentLaneGuidance:");
  }
  else {
    return [a2 clearCurrentLaneGuidance];
  }
}

- (void)setCurrentRoadNameVariants:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentRoadNameVariants, a3);
  id v6 = [(CPNavigationSession *)self navigationSessionManagerFuture];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__CPNavigationSession_setCurrentRoadNameVariants___block_invoke;
  v9[3] = &unk_264309FF8;
  id v10 = v5;
  id v7 = v5;
  id v8 = (id)[v6 addSuccessBlock:v9];
}

uint64_t __50__CPNavigationSession_setCurrentRoadNameVariants___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCurrentRoadNameVariants:*(void *)(a1 + 32)];
}

- (void)setManeuverState:(int64_t)a3
{
  self->_maneuverState = a3;
  id v4 = [(CPNavigationSession *)self navigationSessionManagerFuture];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__CPNavigationSession_setManeuverState___block_invoke;
  v6[3] = &__block_descriptor_40_e39_v16__0___CPNavigationSessionManaging__8l;
  v6[4] = a3;
  id v5 = (id)[v4 addSuccessBlock:v6];
}

uint64_t __40__CPNavigationSession_setManeuverState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setManeuverState:*(void *)(a1 + 32)];
}

- (void)updateTravelEstimates:(CPTravelEstimates *)estimates forManeuver:(CPManeuver *)maneuver
{
  id v6 = estimates;
  id v7 = maneuver;
  id v8 = [(CPNavigationSession *)self navigationSessionManagerFuture];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__CPNavigationSession_updateTravelEstimates_forManeuver___block_invoke;
  v12[3] = &unk_264309FB0;
  long long v13 = v6;
  uint64_t v14 = v7;
  id v15 = self;
  uint64_t v9 = v7;
  id v10 = v6;
  id v11 = (id)[v8 addSuccessBlock:v12];
}

void __57__CPNavigationSession_updateTravelEstimates_forManeuver___block_invoke(uint64_t a1, void *a2)
{
  [a2 updateTravelEstimates:*(void *)(a1 + 32) forManeuver:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 48) mapTemplate];
  [v3 _updateBannerIfNecessaryForManeuver:*(void *)(a1 + 40) travelEstimates:*(void *)(a1 + 32)];
}

- (void)setSendsNavigationMetadata:(BOOL)a3
{
  self->_sendsNavigationMetadata = a3;
  id v4 = [(CPNavigationSession *)self navigationSessionManagerFuture];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__CPNavigationSession_setSendsNavigationMetadata___block_invoke;
  v6[3] = &__block_descriptor_33_e39_v16__0___CPNavigationSessionManaging__8l;
  BOOL v7 = a3;
  id v5 = (id)[v4 addSuccessBlock:v6];
}

uint64_t __50__CPNavigationSession_setSendsNavigationMetadata___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSendsNavigationMetadata:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setDestinationNameVariants:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_destinationNameVariants, a3);
  id v6 = [(CPNavigationSession *)self navigationSessionManagerFuture];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__CPNavigationSession_setDestinationNameVariants___block_invoke;
  v9[3] = &unk_264309FF8;
  id v10 = v5;
  id v7 = v5;
  id v8 = (id)[v6 addSuccessBlock:v9];
}

uint64_t __50__CPNavigationSession_setDestinationNameVariants___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDestinationNameVariants:*(void *)(a1 + 32)];
}

- (void)clientTripNotPausedException
{
}

void __51__CPNavigationSession_clientTripNotPausedException__block_invoke()
{
}

- (NSArray)upcomingManeuvers
{
  return self->_upcomingManeuvers;
}

- (CPLaneGuidance)currentLaneGuidance
{
  return self->_currentLaneGuidance;
}

- (NSArray)currentRoadNameVariants
{
  return self->_currentRoadNameVariants;
}

- (int64_t)maneuverState
{
  return self->_maneuverState;
}

- (CPTrip)trip
{
  return self->_trip;
}

- (void)setTrip:(id)a3
{
}

- (CPMapTemplate)mapTemplate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapTemplate);

  return (CPMapTemplate *)WeakRetained;
}

- (void)setMapTemplate:(id)a3
{
}

- (NAFuture)navigationSessionManagerFuture
{
  return self->_navigationSessionManagerFuture;
}

- (void)setNavigationSessionManagerFuture:(id)a3
{
}

- (NSMutableArray)maneuvers
{
  return self->_maneuvers;
}

- (void)setManeuvers:(id)a3
{
}

- (NSMutableArray)laneGuidances
{
  return self->_laneGuidances;
}

- (void)setLaneGuidances:(id)a3
{
}

- (unint64_t)pauseReason
{
  return self->_pauseReason;
}

- (void)setPauseReason:(unint64_t)a3
{
  self->_pauseReason = a3;
}

- (CPNavigationSessionManaging)manager
{
  return self->_manager;
}

- (BOOL)sendsNavigationMetadata
{
  return self->_sendsNavigationMetadata;
}

- (NSArray)destinationNameVariants
{
  return self->_destinationNameVariants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationNameVariants, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_laneGuidances, 0);
  objc_storeStrong((id *)&self->_maneuvers, 0);
  objc_storeStrong((id *)&self->_navigationSessionManagerFuture, 0);
  objc_destroyWeak((id *)&self->_mapTemplate);
  objc_storeStrong((id *)&self->_trip, 0);
  objc_storeStrong((id *)&self->_currentRoadNameVariants, 0);
  objc_storeStrong((id *)&self->_currentLaneGuidance, 0);

  objc_storeStrong((id *)&self->_upcomingManeuvers, 0);
}

@end