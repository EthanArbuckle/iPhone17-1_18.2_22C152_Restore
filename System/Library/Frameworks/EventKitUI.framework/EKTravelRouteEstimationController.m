@interface EKTravelRouteEstimationController
+ (id)_basedOnLocationLocalizedString;
- (BOOL)estimatedTravelTimeRowHasErrorAtRowIndex:(unint64_t)a3;
- (BOOL)isEstimating;
- (EKStructuredLocation)destinationStructuredLocation;
- (EKStructuredLocation)evaluatedOriginLocation;
- (EKStructuredLocation)originStructuredLocation;
- (EKTravelRouteEstimationController)initWithDestinationStructuredLocation:(id)a3 eventStore:(id)a4;
- (EKTravelRouteEstimationControllerDelegate)delegate;
- (NSArray)rowData;
- (NSDate)arrivalDate;
- (NSDictionary)travelTimeEstimatedValues;
- (NSDictionary)travelTimeLookupErrors;
- (double)estimatedTravelTimeValueAtRowIndex:(unint64_t)a3;
- (id)_imageForCellAtIndex:(int64_t)a3;
- (id)_routingModeTypesAsEnum;
- (id)estimatedTravelTimeRowErrorAtRowIndex:(unint64_t)a3;
- (id)estimatedTravelTimeTableViewCellWithRowIndex:(unint64_t)a3 tableView:(id)a4;
- (int64_t)estimatedTravelTimeRoutingModeAtRowIndex:(unint64_t)a3;
- (unint64_t)numberOfOutputRows;
- (void)_beginOriginLocationEstimationCoreRoutineLookup;
- (void)_beginOriginLocationEstimationEventKitLookup;
- (void)_lookupTimedOut;
- (void)_originLocationEstimationCompletedCoreRoutineLookup;
- (void)_originLocationEstimationCompletedEventKitLookup;
- (void)beginOriginLocationEstimationLookup;
- (void)beginTravelTimeEstimationLookup;
- (void)dealloc;
- (void)setArrivalDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinationStructuredLocation:(id)a3;
- (void)setEvaluatedOriginLocation:(id)a3;
- (void)setIsEstimating:(BOOL)a3;
- (void)setOriginStructuredLocation:(id)a3;
- (void)setRowData:(id)a3;
- (void)setTravelTimeEstimatedValues:(id)a3;
- (void)setTravelTimeLookupErrors:(id)a3;
@end

@implementation EKTravelRouteEstimationController

- (EKTravelRouteEstimationController)initWithDestinationStructuredLocation:(id)a3 eventStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EKTravelRouteEstimationController;
  v8 = [(EKTravelRouteEstimationController *)&v10 init];
  if (v8)
  {
    EKUILogInitIfNeeded();
    [(EKTravelRouteEstimationController *)v8 setDestinationStructuredLocation:v6];
    objc_storeStrong((id *)&v8->_eventStore, a4);
  }

  return v8;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)EKTravelRouteEstimationController;
  [(EKTravelRouteEstimationController *)&v3 dealloc];
}

- (void)beginOriginLocationEstimationLookup
{
  objc_super v3 = [(EKTravelRouteEstimationController *)self arrivalDate];

  if (!v3)
  {
    id v7 = kEKUILogHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR)) {
      return;
    }
    __int16 v11 = 0;
    v8 = "Travel origin location lookup called with nil arrivalDate.";
    v9 = (uint8_t *)&v11;
LABEL_12:
    _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
    return;
  }
  if (!self->_eventStore)
  {
    id v7 = kEKUILogHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR)) {
      return;
    }
    __int16 v10 = 0;
    v8 = "Can't compute origin location with nil eventStore.";
    v9 = (uint8_t *)&v10;
    goto LABEL_12;
  }
  v4 = [(EKTravelRouteEstimationController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(EKTravelRouteEstimationController *)self delegate];
    [v6 routeEstimationControllerDidBeginOriginLocationLookup:self];
  }

  [(EKTravelRouteEstimationController *)self _beginOriginLocationEstimationEventKitLookup];
}

- (void)_beginOriginLocationEstimationCoreRoutineLookup
{
  objc_super v3 = dispatch_get_global_queue(-32768, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__EKTravelRouteEstimationController__beginOriginLocationEstimationCoreRoutineLookup__block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  dispatch_async(v3, block);
}

void __84__EKTravelRouteEstimationController__beginOriginLocationEstimationCoreRoutineLookup__block_invoke(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x1E4F57868];
  int v3 = [MEMORY[0x1E4F57748] authorizationStatusForBundleIdentifier:*MEMORY[0x1E4F57868]];
  char v4 = [MEMORY[0x1E4F57748] preciseLocationAuthorizedForBundleIdentifier:v2];
  if (v3 >= 3 && (v4 & 1) != 0)
  {
    char v5 = (objc_class *)EKWeakLinkClass();
    uint64_t v6 = EKWeakLinkClass();
    id v7 = objc_alloc_init(v5);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __84__EKTravelRouteEstimationController__beginOriginLocationEstimationCoreRoutineLookup__block_invoke_17;
    v10[3] = &unk_1E608A1B8;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v7;
    uint64_t v12 = v6;
    id v8 = v7;
    [v8 fetchRoutineStateWithHandler:v10];
  }
  else
  {
    v9 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_INFO, "Not estimating starting point using CoreRoutine because we don't have precise location authorization", buf, 2u);
    }
    [*(id *)(a1 + 32) _originLocationEstimationCompletedCoreRoutineLookup];
  }
}

void __84__EKTravelRouteEstimationController__beginOriginLocationEstimationCoreRoutineLookup__block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_ERROR, "Error fetching routine state: %@", buf, 0xCu);
    }
  }
  if (a2 == 2)
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [*(id *)(a1 + 32) arrivalDate];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __84__EKTravelRouteEstimationController__beginOriginLocationEstimationCoreRoutineLookup__block_invoke_18;
    v10[3] = &unk_1E608A190;
    uint64_t v9 = *(void *)(a1 + 48);
    v10[4] = *(void *)(a1 + 32);
    void v10[5] = v9;
    [v7 fetchPredictedLocationsOfInterestOnDate:v8 withHandler:v10];
  }
  else
  {
    [*(id *)(a1 + 32) _originLocationEstimationCompletedCoreRoutineLookup];
  }
}

void __84__EKTravelRouteEstimationController__beginOriginLocationEstimationCoreRoutineLookup__block_invoke_18(uint64_t a1, void *a2, uint64_t a3)
{
  id v29 = a2;
  uint64_t v5 = [v29 count];
  if (!a3 && v5)
  {
    uint64_t v6 = [v29 firstObject];
    [v6 confidence];
    if (v7 >= 0.5)
    {
      id v8 = [v6 locationOfInterest];
      uint64_t v9 = [*(id *)(a1 + 32) destinationStructuredLocation];
      __int16 v10 = [v9 geoLocation];
      [v10 coordinate];
      double v12 = v11;
      double v14 = v13;

      id v15 = objc_alloc(*(Class *)(a1 + 40));
      v16 = [v8 location];
      [v16 latitude];
      double v18 = v17;
      v19 = [v8 location];
      [v19 longitude];
      v21 = (void *)[v15 initWithLatitude:v18 longitude:v20];

      v22 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithLatitude:v12 longitude:v14];
      [v21 distanceFromLocation:v22];
      if (v23 > 10.0)
      {
        v24 = (void *)MEMORY[0x1E4F25630];
        v25 = [v8 mapItem];
        v26 = [v25 name];
        v27 = [v24 locationWithTitle:v26];
        [*(id *)(a1 + 32) setEvaluatedOriginLocation:v27];

        v28 = [*(id *)(a1 + 32) evaluatedOriginLocation];
        [v28 setGeoLocation:v21];
      }
    }
  }
  [*(id *)(a1 + 32) _originLocationEstimationCompletedCoreRoutineLookup];
}

- (void)_beginOriginLocationEstimationEventKitLookup
{
  int v3 = dispatch_get_global_queue(-32768, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__EKTravelRouteEstimationController__beginOriginLocationEstimationEventKitLookup__block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  dispatch_async(v3, block);
}

void __81__EKTravelRouteEstimationController__beginOriginLocationEstimationEventKitLookup__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int v3 = [*(id *)(a1 + 32) arrivalDate];
  char v4 = [v2 dateByAddingUnit:32 value:-2 toDate:v3 options:0];

  uint64_t v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v6 = [v5 dateByAddingUnit:128 value:-1 toDate:v4 options:0];

  double v7 = *(void **)(a1 + 32);
  id v8 = (void *)v7[1];
  uint64_t v9 = [v7 arrivalDate];
  __int16 v10 = [v8 predicateForEventsWithStartDate:v6 endDate:v9 calendars:0 loadDefaultProperties:1];

  uint64_t v11 = *(void *)(a1 + 32);
  double v12 = *(void **)(v11 + 8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__EKTravelRouteEstimationController__beginOriginLocationEstimationEventKitLookup__block_invoke_2;
  v14[3] = &unk_1E60879B8;
  v14[4] = v11;
  id v13 = (id)[v12 fetchEventsMatchingPredicate:v10 resultHandler:v14];
}

void __81__EKTravelRouteEstimationController__beginOriginLocationEstimationEventKitLookup__block_invoke_2(uint64_t a1, void *a2)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__EKTravelRouteEstimationController__beginOriginLocationEstimationEventKitLookup__block_invoke_3;
  v10[3] = &unk_1E608A160;
  v10[4] = *(void *)(a1 + 32);
  id v3 = a2;
  char v4 = [v3 indexesOfObjectsPassingTest:v10];
  uint64_t v5 = [v3 objectsAtIndexes:v4];

  if ([v5 count])
  {
    if ((unint64_t)[v5 count] < 2)
    {
      double v7 = [v5 firstObject];
    }
    else
    {
      uint64_t v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_47];
      double v7 = [v6 firstObject];
    }
    id v8 = [v7 structuredLocation];
    uint64_t v9 = [v8 duplicate];
    [*(id *)(a1 + 32) setEvaluatedOriginLocation:v9];
  }
  else
  {
    [*(id *)(a1 + 32) setEvaluatedOriginLocation:0];
  }
  [*(id *)(a1 + 32) _originLocationEstimationCompletedEventKitLookup];
}

BOOL __81__EKTravelRouteEstimationController__beginOriginLocationEstimationEventKitLookup__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 structuredLocation];
  if ([v4 isStructured])
  {
    uint64_t v5 = [v3 endDateUnadjustedForLegacyClients];
    uint64_t v6 = [*(id *)(a1 + 32) arrivalDate];
    BOOL v7 = [v5 compare:v6] != 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __81__EKTravelRouteEstimationController__beginOriginLocationEstimationEventKitLookup__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 endDateUnadjustedForLegacyClients];
  uint64_t v6 = [v4 endDateUnadjustedForLegacyClients];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_originLocationEstimationCompletedEventKitLookup
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__EKTravelRouteEstimationController__originLocationEstimationCompletedEventKitLookup__block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __85__EKTravelRouteEstimationController__originLocationEstimationCompletedEventKitLookup__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) evaluatedOriginLocation];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) delegate];
      [v6 routeEstimationControllerDidFinishOriginLocationLookup:*(void *)(a1 + 32)];
    }
  }
  else
  {
    [v3 _beginOriginLocationEstimationCoreRoutineLookup];
  }
}

- (void)_originLocationEstimationCompletedCoreRoutineLookup
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__EKTravelRouteEstimationController__originLocationEstimationCompletedCoreRoutineLookup__block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __88__EKTravelRouteEstimationController__originLocationEstimationCompletedCoreRoutineLookup__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 routeEstimationControllerDidFinishOriginLocationLookup:*(void *)(a1 + 32)];
  }
}

- (id)_routingModeTypesAsEnum
{
  if ([MEMORY[0x1E4F649C0] transitTTLSupportedInCurrentCountry]) {
    return &unk_1F0D03C88;
  }
  else {
    return &unk_1F0D03CA0;
  }
}

- (void)beginTravelTimeEstimationLookup
{
  self->_isEstimating = 1;
  rows = self->_rows;
  self->_rows = 0;

  id v4 = [(EKTravelRouteEstimationController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(EKTravelRouteEstimationController *)self delegate];
    [v6 routeEstimationControllerDidBeginTravelTimeLookup:self];
  }
  [(EKTravelRouteEstimationController *)self performSelector:sel__lookupTimedOut withObject:0 afterDelay:60.0];
  uint64_t v7 = dispatch_get_global_queue(-32768, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__EKTravelRouteEstimationController_beginTravelTimeEstimationLookup__block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  dispatch_async(v7, block);
}

void __68__EKTravelRouteEstimationController_beginTravelTimeEstimationLookup__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _routingModeTypesAsEnum];
  char v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(MEMORY[0x1E4F57740], "routeTypeStringForCalLocationRoutingMode:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v8), "integerValue"));
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  __int16 v10 = [*(id *)(a1 + 32) originStructuredLocation];
  uint64_t v11 = [v10 calLocation];

  double v12 = [*(id *)(a1 + 32) destinationStructuredLocation];
  id v13 = [v12 calLocation];

  double v14 = [MEMORY[0x1E4F25658] defaultManager];
  id v15 = [*(id *)(a1 + 32) arrivalDate];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__EKTravelRouteEstimationController_beginTravelTimeEstimationLookup__block_invoke_2;
  v16[3] = &unk_1E60893A0;
  v16[4] = *(void *)(a1 + 32);
  [v14 travelTimeFrom:v11 to:v13 arrivalDate:v15 withRouteTypes:v3 withCompletionBlock:v16];
}

void __68__EKTravelRouteEstimationController_beginTravelTimeEstimationLookup__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__EKTravelRouteEstimationController_beginTravelTimeEstimationLookup__block_invoke_3;
  block[3] = &unk_1E6087570;
  uint64_t v18 = a1;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
  long long v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F57740], "routingModeEnumForCalRouteType:", v9, v18);
        uint64_t v11 = [v4 objectForKey:v9];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v12 = [NSNumber numberWithInteger:v10];
          [v20 setObject:v11 forKeyedSubscript:v12];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_11;
          }
          [v11 duration];
          double v12 = [NSNumber numberWithDouble:ceil(v13 / 300.0) * 300.0];
          double v14 = [NSNumber numberWithInteger:v10];
          [v19 setObject:v12 forKeyedSubscript:v14];
        }
LABEL_11:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68__EKTravelRouteEstimationController_beginTravelTimeEstimationLookup__block_invoke_4;
  v21[3] = &unk_1E6087548;
  v21[4] = *(void *)(v18 + 32);
  id v22 = v19;
  id v23 = v20;
  id v15 = v20;
  id v16 = v19;
  long long v17 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], v21);
}

uint64_t __68__EKTravelRouteEstimationController_beginTravelTimeEstimationLookup__block_invoke_3(uint64_t a1)
{
  return [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel__lookupTimedOut object:0];
}

void __68__EKTravelRouteEstimationController_beginTravelTimeEstimationLookup__block_invoke_4(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setTravelTimeEstimatedValues:v2];

  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setTravelTimeLookupErrors:v3];

  long long v25 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = [*(id *)(a1 + 32) _routingModeTypesAsEnum];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v10 = [*(id *)(a1 + 32) travelTimeLookupErrors];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];

        double v12 = [*(id *)(a1 + 32) travelTimeEstimatedValues];
        double v13 = [v12 objectForKeyedSubscript:v9];

        if (v13)
        {
          [v13 doubleValue];
          BOOL v15 = v14 != 0.0;
        }
        else
        {
          BOOL v15 = 0;
        }
        [v13 doubleValue];
        BOOL v17 = v16 > 18000.0 && [v9 integerValue] == 2;
        [v13 doubleValue];
        BOOL v19 = v18 > 18000.0 && [v9 integerValue] == 4;
        int v20 = !v15;
        if (v11) {
          int v20 = 1;
        }
        if (((v20 | v17) & 1) == 0 && !v19) {
          [v25 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  v21 = (void *)[v25 copy];
  [*(id *)(a1 + 32) setRowData:v21];

  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  id v22 = [*(id *)(a1 + 32) delegate];
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    long long v24 = [*(id *)(a1 + 32) delegate];
    [v24 routeEstimationControllerDidFinishTravelTimeLookup:*(void *)(a1 + 32)];
  }
}

- (void)_lookupTimedOut
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(EKTravelRouteEstimationController *)self _routingModeTypesAsEnum];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:1001];
        [v3 setObject:v10 forKeyedSubscript:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [(EKTravelRouteEstimationController *)self setTravelTimeEstimatedValues:MEMORY[0x1E4F1CC08]];
  [(EKTravelRouteEstimationController *)self setTravelTimeLookupErrors:v3];
  [(EKTravelRouteEstimationController *)self setRowData:MEMORY[0x1E4F1CBF0]];
  self->_isEstimating = 0;
  uint64_t v11 = [(EKTravelRouteEstimationController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    double v13 = [(EKTravelRouteEstimationController *)self delegate];
    [v13 routeEstimationControllerDidFinishTravelTimeLookup:self];
  }
}

- (void)setOriginStructuredLocation:(id)a3
{
  objc_storeStrong((id *)&self->_originStructuredLocation, a3);
  [(EKTravelRouteEstimationController *)self setTravelTimeEstimatedValues:0];
  [(EKTravelRouteEstimationController *)self setTravelTimeLookupErrors:0];
  uint64_t v4 = MEMORY[0x1E4F1CBF0];

  [(EKTravelRouteEstimationController *)self setRowData:v4];
}

- (EKStructuredLocation)originStructuredLocation
{
  return self->_originStructuredLocation;
}

- (double)estimatedTravelTimeValueAtRowIndex:(unint64_t)a3
{
  travelTimeEstimatedValues = self->_travelTimeEstimatedValues;
  uint64_t v4 = [(NSArray *)self->_rowData objectAtIndexedSubscript:a3];
  uint64_t v5 = [(NSDictionary *)travelTimeEstimatedValues objectForKeyedSubscript:v4];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (id)estimatedTravelTimeRowErrorAtRowIndex:(unint64_t)a3
{
  if (self->_isEstimating)
  {
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EKTravelRouteEstimationControllerIsEstimating" code:1 userInfo:0];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)estimatedTravelTimeRowHasErrorAtRowIndex:(unint64_t)a3
{
  return self->_isEstimating;
}

- (unint64_t)numberOfOutputRows
{
  if (self->_isEstimating) {
    return 1;
  }
  else {
    return [(NSArray *)self->_rowData count];
  }
}

- (int64_t)estimatedTravelTimeRoutingModeAtRowIndex:(unint64_t)a3
{
  id v3 = [(NSArray *)self->_rowData objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)_imageForCellAtIndex:(int64_t)a3
{
  id v3 = [(NSArray *)self->_rowData objectAtIndexedSubscript:a3];
  uint64_t v4 = [v3 integerValue];

  switch(v4)
  {
    case -1:
    case 0:
    case 1:
      uint64_t v5 = CarImage();
      goto LABEL_7;
    case 2:
      uint64_t v5 = WalkmanImage();
      goto LABEL_7;
    case 3:
      uint64_t v5 = TransitImage();
      goto LABEL_7;
    case 4:
      uint64_t v5 = BicycleImage();
LABEL_7:
      double v6 = (void *)v5;
      break;
    default:
      double v6 = 0;
      break;
  }
  double v7 = [v6 imageWithRenderingMode:2];

  return v7;
}

- (id)estimatedTravelTimeTableViewCellWithRowIndex:(unint64_t)a3 tableView:(id)a4
{
  id v6 = a4;
  rows = self->_rows;
  if (!rows)
  {
    uint64_t v8 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    uint64_t v9 = self->_rows;
    self->_rows = v8;

    rows = self->_rows;
  }
  if ([(NSMutableArray *)rows count] <= a3
    || ([(NSMutableArray *)self->_rows objectAtIndex:a3],
        (uint64_t v10 = (EKEventEstimatedTravelTimeResultCell *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v10 = [(EKCalendarChooserCell *)[EKEventEstimatedTravelTimeResultCell alloc] initWithStyle:1 reuseIdentifier:0];
    [(EKEventEstimatedTravelTimeResultCell *)v10 frame];
    double v12 = v11;
    double v14 = v13;
    [v6 frame];
    -[EKEventEstimatedTravelTimeResultCell setFrame:](v10, "setFrame:", v12, v14);
    long long v15 = [(id)objc_opt_class() _basedOnLocationLocalizedString];
    long long v16 = [(EKEventEstimatedTravelTimeResultCell *)v10 textLabel];
    [v16 setText:v15];

    long long v17 = CUIKDisplayStringForTravelTimeUsingShortFormat();
    double v18 = [(EKEventEstimatedTravelTimeResultCell *)v10 detailTextLabel];
    [v18 setText:v17];

    [(EKCalendarChooserCell *)v10 layoutSubviews];
    uint64_t v19 = BicycleImage();
    [(EKCalendarChooserCell *)v10 setColorDotImage:v19];

    [(EKCalendarChooserCell *)v10 setShowsColorDot:1];
    [(EKCalendarChooserCell *)v10 textLeadingIndent];
    double v21 = v20;
    [v6 layoutMargins];
    double v23 = v22;
    [v6 layoutMargins];
    double v25 = v21 + v23 + v24;
    long long v26 = [(EKEventEstimatedTravelTimeResultCell *)v10 detailTextLabel];
    [v26 frame];
    double v28 = v27;
    long long v29 = [(EKEventEstimatedTravelTimeResultCell *)v10 textLabel];
    [v29 frame];
    double v31 = v25 + v28 + v30;
    [(EKEventEstimatedTravelTimeResultCell *)v10 frame];
    double v33 = v32 * 0.95;

    if (v31 > v33)
    {
      v34 = [(EKCalendarChooserCell *)[EKEventEstimatedTravelTimeResultCell alloc] initWithStyle:3 reuseIdentifier:0];

      v35 = [(EKEventEstimatedTravelTimeResultCell *)v34 textLabel];
      [v35 setNumberOfLines:0];

      uint64_t v10 = v34;
    }
    v36 = [(EKEventEstimatedTravelTimeResultCell *)v10 textLabel];
    [v36 setText:0];

    v37 = [(EKEventEstimatedTravelTimeResultCell *)v10 detailTextLabel];
    [v37 setText:0];

    [(EKCalendarChooserCell *)v10 setColorDotImage:0];
    [(EKCalendarChooserCell *)v10 setShowsColorDot:0];
    [(NSMutableArray *)self->_rows insertObject:v10 atIndex:a3];
  }
  if (self->_isEstimating)
  {
    v38 = EventKitUIBundle();
    v39 = [v38 localizedStringForKey:@"Estimating travel time…" value:&stru_1F0CC2140 table:0];
    v40 = [(EKEventEstimatedTravelTimeResultCell *)v10 textLabel];
    [v40 setText:v39];

    [MEMORY[0x1E4FB1618] lightGrayColor];
  }
  else
  {
    v41 = [(id)objc_opt_class() _basedOnLocationLocalizedString];
    [(EKCalendarChooserCell *)v10 setTextLabelText:v41];

    [(EKTravelRouteEstimationController *)self estimatedTravelTimeValueAtRowIndex:a3];
    v42 = CUIKDisplayStringForTravelTimeUsingShortFormat();
    v43 = [(EKEventEstimatedTravelTimeResultCell *)v10 detailTextLabel];
    [v43 setText:v42];

    v44 = [(EKTravelRouteEstimationController *)self _imageForCellAtIndex:a3];
    [(EKCalendarChooserCell *)v10 setColorDotImage:v44];

    [(EKCalendarChooserCell *)v10 setShowsColorDot:1];
    [MEMORY[0x1E4FB1618] blackColor];
  v45 = };
  v46 = [(EKEventEstimatedTravelTimeResultCell *)v10 textLabel];
  [v46 setTextColor:v45];

  return v10;
}

+ (id)_basedOnLocationLocalizedString
{
  uint64_t v2 = EventKitUIBundle();
  id v3 = [v2 localizedStringForKey:@"Based on location" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (EKTravelRouteEstimationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKTravelRouteEstimationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDate)arrivalDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setArrivalDate:(id)a3
{
}

- (EKStructuredLocation)destinationStructuredLocation
{
  return (EKStructuredLocation *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDestinationStructuredLocation:(id)a3
{
}

- (BOOL)isEstimating
{
  return self->_isEstimating;
}

- (void)setIsEstimating:(BOOL)a3
{
  self->_isEstimating = a3;
}

- (EKStructuredLocation)evaluatedOriginLocation
{
  return (EKStructuredLocation *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEvaluatedOriginLocation:(id)a3
{
}

- (NSDictionary)travelTimeEstimatedValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTravelTimeEstimatedValues:(id)a3
{
}

- (NSDictionary)travelTimeLookupErrors
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTravelTimeLookupErrors:(id)a3
{
}

- (NSArray)rowData
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRowData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowData, 0);
  objc_storeStrong((id *)&self->_travelTimeLookupErrors, 0);
  objc_storeStrong((id *)&self->_travelTimeEstimatedValues, 0);
  objc_storeStrong((id *)&self->_evaluatedOriginLocation, 0);
  objc_storeStrong((id *)&self->_destinationStructuredLocation, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_originStructuredLocation, 0);

  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end