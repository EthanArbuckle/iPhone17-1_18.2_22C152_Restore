@interface EKStructuredLocationPrediction
+ (BOOL)shouldDoLocationPredictionForEvent:(id)a3;
+ (id)_mockLocationForEvent:(id)a3;
+ (id)locationPredictionForEvent:(id)a3 error:(id *)a4 timeout:(double)a5;
+ (void)userInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4;
@end

@implementation EKStructuredLocationPrediction

+ (BOOL)shouldDoLocationPredictionForEvent:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 preferredLocationWithoutPrediction];
  v5 = [MEMORY[0x1E4F57440] shared];
  if (objc_msgSend(v5, "get_suggestEventLocations") && (objc_msgSend(v3, "isNew") & 1) == 0)
  {
    v7 = [v4 geoLocation];
    if (v7 || [v3 locationPredictionState])
    {
      BOOL v6 = 0;
    }
    else
    {
      v22 = [v3 calendar];
      if ([v22 allowsContentModifications])
      {
        v23 = [v3 calendar];
        if ([v23 type] == 4)
        {
          BOOL v6 = 0;
        }
        else
        {
          v24 = [v3 calendar];
          if ([v24 type] == 3)
          {
            BOOL v6 = 0;
          }
          else
          {
            v25 = [v3 calendar];
            BOOL v6 = [v25 type] != 6;
          }
        }
      }
      else
      {
        BOOL v6 = 0;
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  v8 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = [v3 externalURL];
    v11 = [v3 title];
    v12 = [v4 geoLocation];
    uint64_t v13 = [v3 locationPredictionState];
    v14 = [v3 calendar];
    int v26 = 138544387;
    v27 = v10;
    __int16 v28 = 2117;
    v29 = v11;
    __int16 v30 = 1024;
    BOOL v31 = v12 != 0;
    __int16 v32 = 2048;
    uint64_t v33 = v13;
    __int16 v34 = 1024;
    int v35 = [v14 allowsContentModifications];
    _os_log_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_INFO, "Checking should do location prediction for event: %{public}@, title: %{sensitive}@, eventHasLocation: %{BOOL}d, locationPredictionState: %ld, allowsContentModifications: %d", (uint8_t *)&v26, 0x2Cu);
  }
  if (v6)
  {
    uint64_t v15 = *MEMORY[0x1E4F57868];
    int v16 = [MEMORY[0x1E4F57748] authorizationStatusForBundleIdentifier:*MEMORY[0x1E4F57868]];
    uint64_t v17 = [MEMORY[0x1E4F57748] locationPrecisionForBundleIdentifier:v15];
    BOOL v19 = (v16 - 3) < 2 && v17 == 2;
  }
  else
  {
    BOOL v19 = 0;
  }
  v20 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    int v26 = 67109120;
    LODWORD(v27) = v19;
    _os_log_impl(&dword_1A4E47000, v20, OS_LOG_TYPE_INFO, "shouldDoLocationPrediction: %d", (uint8_t *)&v26, 8u);
  }

  return v19;
}

void __75__EKStructuredLocationPrediction_locationPredictionForEvent_error_timeout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = +[EKStructuredLocation locationWithGEOMapItem:v5];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    v10 = [*(id *)(a1 + 32) location];
    [v10 horizontalUncertainty];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setRadius:");

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setImprecise:1];
    v11 = [[EKPredictedLocationOfInterest alloc] initWithPredictedLocationOfInterest:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setPredictedLOI:v11];
  }
  else
  {
    v12 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __75__EKStructuredLocationPrediction_locationPredictionForEvent_error_timeout___block_invoke_cold_1(v12, v6);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

+ (id)locationPredictionForEvent:(id)a3 error:(id *)a4 timeout:(double)a5
{
  id v7 = a3;
  if (([MEMORY[0x1E4F57700] currentProcessHasBooleanEntitlement:@"com.apple.CoreRoutine.LocationOfInterest"] & 1) == 0)
  {
    v18 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E47000, v18, OS_LOG_TYPE_INFO, "Skipping looking up predicted location because process is not entitled.", buf, 2u);
    }
    goto LABEL_8;
  }
  if (![a1 shouldDoLocationPredictionForEvent:v7])
  {
LABEL_8:
    id v17 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [v7 title];
  v9 = [v7 locationWithoutPrediction];
  v10 = [v7 calendar];
  v11 = [v10 calendarIdentifier];

  *(void *)buf = 0;
  v38 = buf;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__24;
  v41 = __Block_byref_object_dispose__24;
  id v42 = 0;
  v12 = [MEMORY[0x1E4F57440] shared];
  int v13 = objc_msgSend(v12, "get_suggestedLocationsTestMode");

  if (v13
    && ([a1 _mockLocationForEvent:v7],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = (void *)*((void *)v38 + 5),
        *((void *)v38 + 5) = v14,
        v15,
        (int v16 = (void *)*((void *)v38 + 5)) != 0))
  {
    id v17 = v16;
  }
  else
  {
    id v36 = 0;
    BOOL v19 = objc_msgSend(MEMORY[0x1E4F57758], "predictedLocationOfInterestForEventTitle:eventLocation:calendarIdentifier:timeout:error:", v8, v9, v11, dispatch_time(0, (uint64_t)(a5 * 1000000000.0)), &v36);
    id v20 = v36;
    if (v19)
    {
      v21 = (void *)EKWeakLinkClass();
      id v30 = v20;
      v22 = [v19 locationOfInterest];
      dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
      v24 = [v21 sharedService];
      v25 = [v22 mapItem];
      int v26 = [v25 geoMapItemHandle];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __75__EKStructuredLocationPrediction_locationPredictionForEvent_error_timeout___block_invoke;
      v31[3] = &unk_1E5B9A850;
      int v35 = buf;
      id v27 = v22;
      id v32 = v27;
      id v33 = v19;
      __int16 v28 = v23;
      __int16 v34 = v28;
      [v24 resolveMapItemLocallyFromHandle:v26 completionHandler:v31];

      dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
      id v20 = v30;
    }
    id v17 = *((id *)v38 + 5);
  }
  _Block_object_dispose(buf, 8);

LABEL_13:

  return v17;
}

+ (void)userInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 rtPredictedLocationOfInterest];
  if (v6)
  {
    if (userInteractionWithPredictedLocationOfInterest_interaction__onceToken != -1) {
      dispatch_once(&userInteractionWithPredictedLocationOfInterest_interaction__onceToken, &__block_literal_global_85);
    }
    id v7 = [(id)userInteractionWithPredictedLocationOfInterest_interaction__RTRoutineManagerClass defaultManager];
    [v7 userInteractionWithPredictedLocationOfInterest:v6 interaction:a4 feedback:0];
    goto LABEL_7;
  }
  uint64_t v8 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v8;
    v9 = [v5 customLabel];
    int v10 = 138543618;
    v11 = v9;
    __int16 v12 = 1024;
    int v13 = a4;
    _os_log_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_DEFAULT, "Got user interaction for mocked location of interest (%{public}@). Interaction type = %d", (uint8_t *)&v10, 0x12u);

LABEL_7:
  }
}

uint64_t __93__EKStructuredLocationPrediction_userInteractionWithPredictedLocationOfInterest_interaction___block_invoke()
{
  uint64_t result = EKWeakLinkClass();
  userInteractionWithPredictedLocationOfInterest_interaction__RTRoutineManagerClass = result;
  return result;
}

+ (id)_mockLocationForEvent:(id)a3
{
  uint64_t v3 = _mockLocationForEvent__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_mockLocationForEvent__onceToken, &__block_literal_global_24_3);
  }
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [v4 title];

  id v7 = [v5 predicateWithFormat:@"%@ CONTAINS SELF", v6];

  uint64_t v8 = [(id)_mockLocationForEvent__s_mockLocations allKeys];
  v9 = [v8 filteredArrayUsingPredicate:v7];
  int v10 = [v9 firstObject];

  v11 = [(id)_mockLocationForEvent__s_mockLocations objectForKey:v10];
  __int16 v12 = [v11 duplicate];

  return v12;
}

void __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke()
{
  uint64_t v0 = EKWeakLinkClass();
  uint64_t v1 = EKWeakLinkClass();
  uint64_t v2 = EKWeakLinkClass();
  uint64_t v3 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_115;
  v7[3] = &unk_1E5B9A8A0;
  uint64_t v9 = v0;
  uint64_t v10 = v1;
  uint64_t v11 = v2;
  id v4 = v3;
  id v8 = v4;
  unk_1EF9905C8(&unk_1EF953360, "enumerateKeysAndObjectsWithOptions:usingBlock:", 1, v7);
  id v5 = (void *)_mockLocationForEvent__s_mockLocations;
  _mockLocationForEvent__s_mockLocations = (uint64_t)v4;
  id v6 = v4;
}

void __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_115(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"Lat"];
  [v7 doubleValue];
  double v9 = v8;
  uint64_t v10 = [v6 objectForKeyedSubscript:@"Lon"];
  [v10 doubleValue];
  double v12 = v11;

  int v13 = [*(id *)(a1 + 40) sharedService];
  uint64_t v14 = objc_msgSend(v13, "ticketForReverseGeocodeCoordinate:shiftLocationsIfNeeded:traits:", 1, 0, v9, v12);
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_2;
  v27[3] = &unk_1E5B9A878;
  id v16 = v5;
  id v28 = v16;
  long long v32 = *(_OWORD *)(a1 + 48);
  id v17 = v6;
  id v29 = v17;
  id v30 = *(id *)(a1 + 32);
  v18 = v15;
  BOOL v31 = v18;
  [v14 submitWithHandler:v27 networkActivity:0];
  dispatch_time_t v19 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v18, v19))
  {
    id v20 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_115_cold_1((uint64_t)v16, v20, v21, v22, v23, v24, v25, v26);
    }
  }
}

void __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_2_cold_2((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  uint64_t v14 = [v5 firstObject];
  dispatch_semaphore_t v15 = v14;
  if (v14)
  {
    [v14 coordinate];
    double v17 = v16;
    [v15 coordinate];
    double v19 = v18;
    uint64_t v20 = [v15 addressDictionary];
    id v21 = objc_alloc(*(Class *)(a1 + 64));
    v47 = (void *)v20;
    uint64_t v22 = objc_msgSend(objc_alloc(*(Class *)(a1 + 72)), "initWithCoordinate:addressDictionary:", v20, v17, v19);
    uint64_t v23 = (void *)[v21 initWithPlacemark:v22];

    uint64_t v24 = [v15 geoAddress];
    uint64_t v25 = [v24 structuredAddress];

    uint64_t v26 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Type"];
    id v48 = v6;
    id v49 = v5;
    v46 = v26;
    if (v26) {
      uint64_t v27 = [v26 integerValue];
    }
    else {
      uint64_t v27 = -1;
    }
    int v35 = [EKPredictedLocationOfInterest alloc];
    uint64_t v36 = *(void *)(a1 + 32);
    [v23 name];
    v38 = v37 = v23;
    uint64_t v39 = [v25 countryCode];
    v40 = [v25 thoroughfare];
    [v25 locality];
    v41 = v45 = v25;
    id v42 = [(EKPredictedLocationOfInterest *)v35 initWithType:v27 customLabel:v36 mapItemName:v38 addressCountryCode:v39 addressThoroughFare:v40 addressLocality:v41];

    v43 = +[EKStructuredLocation locationWithMapItem:v37];
    [v43 setImprecise:1];
    [v43 setPredictedLOI:v42];
    id v44 = *(id *)(a1 + 48);
    objc_sync_enter(v44);
    [*(id *)(a1 + 48) setObject:v43 forKeyedSubscript:*(void *)(a1 + 32)];
    objc_sync_exit(v44);

    id v6 = v48;
    id v5 = v49;
  }
  else
  {
    id v28 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_2_cold_1(a1, v28, v29, v30, v31, v32, v33, v34);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void __75__EKStructuredLocationPrediction_locationPredictionForEvent_error_timeout___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 code];
  id v5 = [a2 domain];
  int v6 = 134218498;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_ERROR, "Failed to get map item from GEOMapService. error code = %ld, domain = %{public}@, error = %@", (uint8_t *)&v6, 0x20u);
}

void __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_115_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end