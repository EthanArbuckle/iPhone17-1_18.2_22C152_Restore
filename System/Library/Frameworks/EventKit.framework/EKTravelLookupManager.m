@interface EKTravelLookupManager
+ (id)defaultManager;
+ (void)estimateGeolocationFromHistoricDevicePositionAtLocation:(id)a3 withCompletionBlock:(id)a4;
- (void)_findCoordinatesForLocation:(id)a3 completionBlock:(id)a4;
- (void)_travelTimeFrom:(id)a3 to:(id)a4 arrivalDate:(id)a5 withRouteType:(id)a6 withCompletionBlock:(id)a7;
- (void)_travelTimeWithStartCoordinate:(id)a3 endCoordinate:(id)a4 arrivalDate:(id)a5 withRouteType:(id)a6 completionBlock:(id)a7;
- (void)_updateLocation:(id)a3 withMapItem:(id)a4 forRoute:(id)a5 withCompletionBlock:(id)a6;
- (void)travelTimeFrom:(id)a3 to:(id)a4 arrivalDate:(id)a5 withRouteTypes:(id)a6 withCompletionBlock:(id)a7;
@end

@implementation EKTravelLookupManager

+ (id)defaultManager
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!defaultManager__defaultManager)
  {
    v3 = objc_alloc_init(EKTravelLookupManager);
    v4 = (void *)defaultManager__defaultManager;
    defaultManager__defaultManager = (uint64_t)v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)defaultManager__defaultManager;

  return v5;
}

- (void)_travelTimeFrom:(id)a3 to:(id)a4 arrivalDate:(id)a5 withRouteType:(id)a6 withCompletionBlock:(id)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v31 = v12;
    __int16 v32 = 2112;
    id v33 = v13;
    __int16 v34 = 2112;
    id v35 = v15;
    __int16 v36 = 2112;
    id v37 = v14;
    _os_log_debug_impl(&dword_1A4E47000, v17, OS_LOG_TYPE_DEBUG, "Received request to find travel time from %@ to %@ by %@ arriving on date %@", buf, 0x2Au);
  }
  v18 = dispatch_get_global_queue(0, 0);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __90__EKTravelLookupManager__travelTimeFrom_to_arrivalDate_withRouteType_withCompletionBlock___block_invoke;
  v24[3] = &unk_1E5B99680;
  v24[4] = self;
  id v25 = v12;
  id v26 = v13;
  id v27 = v15;
  id v28 = v14;
  id v29 = v16;
  id v19 = v14;
  id v20 = v15;
  id v21 = v13;
  id v22 = v16;
  id v23 = v12;
  dispatch_async(v18, v24);
}

void __90__EKTravelLookupManager__travelTimeFrom_to_arrivalDate_withRouteType_withCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__EKTravelLookupManager__travelTimeFrom_to_arrivalDate_withRouteType_withCompletionBlock___block_invoke_2;
  v6[3] = &unk_1E5B99658;
  id v4 = *(id *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 32);
  id v11 = v4;
  v6[4] = v5;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  [v2 _findCoordinatesForLocation:v3 completionBlock:v6];
}

void __90__EKTravelLookupManager__travelTimeFrom_to_arrivalDate_withRouteType_withCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v3();
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __90__EKTravelLookupManager__travelTimeFrom_to_arrivalDate_withRouteType_withCompletionBlock___block_invoke_3;
    v8[3] = &unk_1E5B99658;
    id v14 = *(id *)(a1 + 72);
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 56);
    id v6 = *(id *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 32);
    id v12 = v6;
    uint64_t v13 = v7;
    [v4 _findCoordinatesForLocation:v5 completionBlock:v8];
  }
}

void __90__EKTravelLookupManager__travelTimeFrom_to_arrivalDate_withRouteType_withCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      __90__EKTravelLookupManager__travelTimeFrom_to_arrivalDate_withRouteType_withCompletionBlock___block_invoke_3_cold_1();
    }
    [*(id *)(a1 + 64) _travelTimeWithStartCoordinate:*(void *)(a1 + 32) endCoordinate:*(void *)(a1 + 40) arrivalDate:*(void *)(a1 + 56) withRouteType:*(void *)(a1 + 48) completionBlock:*(void *)(a1 + 72)];
  }
}

- (void)travelTimeFrom:(id)a3 to:(id)a4 arrivalDate:(id)a5 withRouteTypes:(id)a6 withCompletionBlock:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v12 = a6;
  id v24 = a7;
  uint64_t v13 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v27;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v46 = (uint64_t)v12;
    __int16 v47 = 2112;
    id v48 = v25;
    _os_log_debug_impl(&dword_1A4E47000, v13, OS_LOG_TYPE_DEBUG, "Received request to find travel time from %@ to %@ by %@ arriving on date %@", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v46 = 0;
  uint64_t v46 = [v12 count];
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0;
  id v23 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v15)
  {
    uint64_t v22 = *(void *)v40;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(v14);
        }
        uint64_t v17 = *(void *)(*((void *)&v39 + 1) + 8 * v16);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke;
        v28[3] = &unk_1E5B996A8;
        id v29 = v23;
        uint64_t v30 = v17;
        id v37 = buf;
        uint64_t v38 = v43;
        id v18 = v14;
        id v31 = v18;
        id v19 = v27;
        id v32 = v19;
        id v33 = self;
        id v20 = v26;
        id v34 = v20;
        id v21 = v25;
        id v35 = v21;
        id v36 = v24;
        [(EKTravelLookupManager *)self _travelTimeFrom:v19 to:v20 arrivalDate:v21 withRouteType:v17 withCompletionBlock:v28];

        ++v16;
      }
      while (v15 != v16);
      uint64_t v15 = [v18 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v15);
  }

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(buf, 8);
}

void __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  --*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
  if (v5)
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  else if (v6)
  {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
    if ([v6 code] == 5 || objc_msgSend(v6, "code") == 4) {
      ++*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
  {
    __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke_cold_4();
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
    if (v8 == [*(id *)(a1 + 48) count])
    {
      char v9 = [*(id *)(a1 + 56) isCurrentLocation];
      id v10 = EKLogHandle;
      BOOL v11 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG);
      if ((v9 & 1) == 0)
      {
        if (v11) {
          __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke_cold_2(v10, v12, v13, v14, v15, v16, v17, v18);
        }
        id v20 = objc_alloc_init(MEMORY[0x1E4F57740]);
        [v20 setType:2];
        [*(id *)(a1 + 64) travelTimeFrom:v20 to:*(void *)(a1 + 72) arrivalDate:*(void *)(a1 + 80) withRouteTypes:*(void *)(a1 + 48) withCompletionBlock:*(void *)(a1 + 88)];
        goto LABEL_21;
      }
      if (v11) {
        __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke_cold_1(v10, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    {
      __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke_cold_3();
    }
    uint64_t v19 = *(void *)(a1 + 88);
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, id))(v19 + 16))(v19, v20);
LABEL_21:
  }
  objc_sync_exit(v7);
}

- (void)_travelTimeWithStartCoordinate:(id)a3 endCoordinate:(id)a4 arrivalDate:(id)a5 withRouteType:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, void, void *))a7;
  if ((([v12 isCurrentLocation] & 1) != 0 || objc_msgSend(v13, "isCurrentLocation"))
    && ((uint64_t v17 = *MEMORY[0x1E4F57868],
         int v18 = [MEMORY[0x1E4F57748] authorizationStatusForBundleIdentifier:*MEMORY[0x1E4F57868]],
         char v19 = [MEMORY[0x1E4F57748] preciseLocationAuthorizedForBundleIdentifier:v17],
         v18 < 3)
     || (v19 & 1) == 0))
  {
    id v21 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E47000, v21, OS_LOG_TYPE_DEFAULT, "Can't use current location for travel time estimation because Calendar is not authorized for precise location access.", buf, 2u);
    }
    id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v20 = (void *)[v22 initWithDomain:EKTravelLookupErrorDomain code:0 userInfo:0];
    v16[2](v16, 0, v20);
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke;
    v23[3] = &unk_1E5B996F8;
    id v24 = v12;
    id v25 = v13;
    id v26 = v15;
    id v27 = v14;
    id v28 = self;
    id v29 = v16;
    dispatch_async(MEMORY[0x1E4F14428], v23);

    id v20 = v24;
  }
}

void __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = (objc_class *)EKWeakLinkClass();
  id v3 = (void *)EKWeakLinkClass();
  if ([*(id *)(a1 + 32) isCurrentLocation])
  {
    id v4 = [v3 mapItemForCurrentLocation];
  }
  else
  {
    id v5 = [v2 alloc];
    id v6 = [*(id *)(a1 + 32) location];
    [v6 coordinate];
    double v8 = v7;
    double v10 = v9;
    BOOL v11 = [*(id *)(a1 + 32) placemark];
    id v12 = [v11 addressDictionary];
    id v13 = objc_msgSend(v5, "initWithCoordinate:addressDictionary:", v12, v8, v10);

    id v4 = (void *)[objc_alloc((Class)v3) initWithPlacemark:v13];
  }
  if ([*(id *)(a1 + 40) isCurrentLocation])
  {
    id v14 = [v3 mapItemForCurrentLocation];
  }
  else
  {
    id v15 = [v2 alloc];
    uint64_t v16 = [*(id *)(a1 + 40) location];
    [v16 coordinate];
    double v18 = v17;
    double v20 = v19;
    id v21 = [*(id *)(a1 + 40) placemark];
    id v22 = [v21 addressDictionary];
    id v23 = objc_msgSend(v15, "initWithCoordinate:addressDictionary:", v22, v18, v20);

    id v14 = (void *)[objc_alloc((Class)v3) initWithPlacemark:v23];
  }
  id v24 = (objc_class *)EKWeakLinkClass();
  id v25 = (objc_class *)EKWeakLinkClass();
  if ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x1E4F57640]])
  {
    uint64_t v26 = 2;
  }
  else if ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x1E4F57630]])
  {
    uint64_t v26 = 1;
  }
  else if ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x1E4F57638]])
  {
    uint64_t v26 = 4;
  }
  else if ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x1E4F57628]])
  {
    uint64_t v26 = 8;
  }
  else
  {
    uint64_t v26 = 1;
  }
  id v27 = objc_alloc_init(v24);
  [v27 setSource:v4];
  [v27 setDestination:v14];
  [v27 setArrivalDate:*(void *)(a1 + 56)];
  [v27 setTransportType:v26];
  id v28 = (void *)[[v25 alloc] initWithRequest:v27];
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_cold_1();
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_27;
  v31[3] = &unk_1E5B996D0;
  id v36 = *(id *)(a1 + 72);
  id v32 = *(id *)(a1 + 32);
  id v33 = *(id *)(a1 + 40);
  id v29 = *(id *)(a1 + 48);
  uint64_t v30 = *(void *)(a1 + 64);
  id v34 = v29;
  uint64_t v35 = v30;
  [v28 calculateETAWithCompletionHandler:v31];
}

void __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_27(uint64_t *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = [v6 code];
    if ((unint64_t)(v7 - 1) > 4) {
      double v8 = @"EKTravelLookupErrorUnknown";
    }
    else {
      double v8 = off_1E5B99790[v7 - 1];
    }
    id v23 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_27_cold_3((uint64_t)v8, v23, v6);
    }
    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    [v5 expectedTravelTime];
    double v10 = v9;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_27_cold_2();
    }
    id v11 = objc_alloc_init(MEMORY[0x1E4F577B0]);
    [v11 setStart:a1[4]];
    [v11 setEnd:a1[5]];
    [v11 setDuration:v10];
    [v11 setRoute:a1[6]];
    if ([(id)a1[4] isCurrentLocation])
    {
      id v12 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
        __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_27_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
      }
      double v20 = (void *)a1[7];
      uint64_t v21 = a1[4];
      id v22 = [v5 source];
      [v20 _updateLocation:v21 withMapItem:v22 forRoute:v11 withCompletionBlock:a1[8]];
    }
    else
    {
      (*(void (**)(void))(a1[8] + 16))();
    }
  }
}

- (void)_updateLocation:(id)a3 withMapItem:(id)a4 forRoute:(id)a5 withCompletionBlock:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [a4 placemark];
  uint64_t v13 = [v12 location];

  [v9 setLocation:v13];
  uint64_t v14 = (void *)MEMORY[0x1E4F57750];
  uint64_t v15 = [v9 location];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __82__EKTravelLookupManager__updateLocation_withMapItem_forRoute_withCompletionBlock___block_invoke;
  v20[3] = &unk_1E5B99720;
  id v22 = v10;
  id v23 = v11;
  id v21 = v9;
  id v16 = v10;
  id v17 = v11;
  id v18 = v9;
  id v19 = (id)[v14 placemarkForLocation:v15 withCompletionBlock:v20];
}

void __82__EKTravelLookupManager__updateLocation_withMapItem_forRoute_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      __82__EKTravelLookupManager__updateLocation_withMapItem_forRoute_withCompletionBlock___block_invoke_cold_1();
    }
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    double v8 = (void *)[v13 initWithDomain:EKTravelLookupErrorDomain code:1 userInfo:0];
    id v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    double v8 = [v5 addressDictionary];
    if ([v8 count])
    {
      id v9 = [MEMORY[0x1E4F1BA80] postalAddressWithAddressBookDictionaryRepresentation:v8];
      id v10 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v9 style:0];
      [*(id *)(a1 + 32) setAddress:v10];
    }
    [*(id *)(a1 + 32) setPlacemark:v5];
    id v11 = [v5 name];
    [*(id *)(a1 + 32) setTitle:v11];

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      __82__EKTravelLookupManager__updateLocation_withMapItem_forRoute_withCompletionBlock___block_invoke_cold_2();
    }
    id v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v12();
}

- (void)_findCoordinatesForLocation:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    -[EKTravelLookupManager _findCoordinatesForLocation:completionBlock:].cold.6();
  }
  uint64_t v8 = [v6 location];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [v6 location];
    [v10 coordinate];
    BOOL v11 = CLLocationCoordinate2DIsValid(v24);

    if (v11)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
        -[EKTravelLookupManager _findCoordinatesForLocation:completionBlock:].cold.5();
      }
LABEL_10:
      v7[2](v7, 0);
      goto LABEL_20;
    }
  }
  int v12 = [v6 isCurrentLocation];
  BOOL v13 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v13) {
      -[EKTravelLookupManager _findCoordinatesForLocation:completionBlock:]();
    }
    goto LABEL_10;
  }
  if (v13) {
    -[EKTravelLookupManager _findCoordinatesForLocation:completionBlock:].cold.4();
  }
  uint64_t v14 = [v6 address];

  if (v14)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      -[EKTravelLookupManager _findCoordinatesForLocation:completionBlock:]();
    }
    uint64_t v15 = (void *)MEMORY[0x1E4F57750];
    id v16 = [v6 address];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __69__EKTravelLookupManager__findCoordinatesForLocation_completionBlock___block_invoke;
    v20[3] = &unk_1E5B99748;
    id v21 = v6;
    id v22 = self;
    id v23 = v7;
    id v17 = (id)[v15 placemarkForAddress:v16 withCompletionBlock:v20];
  }
  else
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v19 = (void *)[v18 initWithDomain:EKTravelLookupErrorDomain code:1 userInfo:0];
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      -[EKTravelLookupManager _findCoordinatesForLocation:completionBlock:]();
    }
    ((void (**)(id, void *))v7)[2](v7, v19);
  }
LABEL_20:
}

void __69__EKTravelLookupManager__findCoordinatesForLocation_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v5 location];
    [v8 coordinate];
    BOOL v9 = CLLocationCoordinate2DIsValid(v12);

    if (v9)
    {
      id v10 = [v5 location];
      [*(id *)(a1 + 32) setLocation:v10];

      [*(id *)(a1 + 32) setPlacemark:v5];
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
        __69__EKTravelLookupManager__findCoordinatesForLocation_completionBlock___block_invoke_cold_3();
      }
    }
  }
  else if (v6)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      __69__EKTravelLookupManager__findCoordinatesForLocation_completionBlock___block_invoke_cold_2();
    }
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v7 = (void *)[v11 initWithDomain:EKTravelLookupErrorDomain code:2 userInfo:0];
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      __69__EKTravelLookupManager__findCoordinatesForLocation_completionBlock___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)estimateGeolocationFromHistoricDevicePositionAtLocation:(id)a3 withCompletionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (objc_class *)EKWeakLinkClass();
  uint64_t v8 = EKWeakLinkClass();
  id v9 = objc_alloc_init(v7);
  CFRetain(v9);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __101__EKTravelLookupManager_estimateGeolocationFromHistoricDevicePositionAtLocation_withCompletionBlock___block_invoke;
  v12[3] = &unk_1E5B99770;
  id v14 = v5;
  uint64_t v15 = v8;
  id v13 = v9;
  id v10 = v9;
  id v11 = v5;
  [v10 fetchLocationsOfInterestAssociatedToIdentifier:v6 withHandler:v12];
}

void __101__EKTravelLookupManager_estimateGeolocationFromHistoricDevicePositionAtLocation_withCompletionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v4 = [a2 firstObject];
    [v4 confidence];
    if (v5 >= 0.5)
    {
      id v6 = objc_alloc(*(Class *)(a1 + 48));
      uint64_t v7 = [v4 location];
      [v7 latitude];
      double v9 = v8;
      id v10 = [v4 location];
      [v10 longitude];
      CLLocationCoordinate2D v12 = (void *)[v6 initWithLatitude:v9 longitude:v11];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  id v13 = *(const void **)(a1 + 32);

  CFRelease(v13);
}

void __90__EKTravelLookupManager__travelTimeFrom_to_arrivalDate_withRouteType_withCompletionBlock___block_invoke_3_cold_1()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_5();
  uint64_t v6 = v0;
  __int16 v7 = v1;
  uint64_t v8 = v2;
  __int16 v9 = v1;
  uint64_t v10 = v3;
  _os_log_debug_impl(&dword_1A4E47000, v4, OS_LOG_TYPE_DEBUG, "Calculating travel time from %@ to %@ by %@ on date %@", v5, 0x2Au);
}

void __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Finished finding travel times with results %@", v2, v3, v4, v5, v6);
}

void __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Didn't find route or error for routeType %@", v2, v3, v4, v5, v6);
}

void __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1A4E47000, v0, v1, "Getting directions %@ with request %@");
}

void __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_27_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_27_cold_2()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Found travel time in seconds %lul", v2, v3, v4, v5, v6);
}

void __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_27_cold_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  uint8_t v6 = [a3 description];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_1A4E47000, v5, OS_LOG_TYPE_DEBUG, "Travel time lookup failed with error code %@: %@", (uint8_t *)&v7, 0x16u);
}

void __82__EKTravelLookupManager__updateLocation_withMapItem_forRoute_withCompletionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Failed to get placemark with error %@", v2, v3, v4, v5, v6);
}

void __82__EKTravelLookupManager__updateLocation_withMapItem_forRoute_withCompletionBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Updated location to %@", v2, v3, v4, v5, v6);
}

- (void)_findCoordinatesForLocation:completionBlock:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "%@ is for current location.  Let MapKit handle", v2, v3, v4, v5, v6);
}

- (void)_findCoordinatesForLocation:completionBlock:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "%@ has no address", v2, v3, v4, v5, v6);
}

- (void)_findCoordinatesForLocation:completionBlock:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "%@ has an address.  Looking up coordinates", v2, v3, v4, v5, v6);
}

- (void)_findCoordinatesForLocation:completionBlock:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "%@ doesn't have coordinates", v2, v3, v4, v5, v6);
}

- (void)_findCoordinatesForLocation:completionBlock:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "%@ already has coordinates", v2, v3, v4, v5, v6);
}

- (void)_findCoordinatesForLocation:completionBlock:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Making sure that %@ has coordinates", v2, v3, v4, v5, v6);
}

void __69__EKTravelLookupManager__findCoordinatesForLocation_completionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Couldn't find coordinates for address for %@", v2, v3, v4, v5, v6);
}

void __69__EKTravelLookupManager__findCoordinatesForLocation_completionBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_0(&dword_1A4E47000, v0, v1, "Couldn't find coordinates for address for %@ and failed with error %@");
}

void __69__EKTravelLookupManager__findCoordinatesForLocation_completionBlock___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Found coordinates for address. Updated location to %@", v2, v3, v4, v5, v6);
}

@end