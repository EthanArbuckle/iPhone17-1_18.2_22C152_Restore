@interface SGEventGeocode
+ (BOOL)isGeocodeCandidate:(id)a3;
+ (BOOL)isGeocodeCandidateLocation:(id)a3 forEvent:(id)a4;
+ (BOOL)locationIsAirport:(id)a3;
+ (BOOL)locationIsGeocoded:(id)a3;
+ (id)_serialQueue;
+ (id)dateForUTCDate:(id)a3 withTimeZone:(id)a4;
+ (id)geocodeEvent:(id)a3;
+ (id)poiCategoriesFromString:(id)a3;
+ (void)geocodeAddress:(id)a3 withCallback:(id)a4;
+ (void)geocodeAddressWithCanonicalSearch:(id)a3 withCallback:(id)a4;
+ (void)geocodeEvent:(id)a3 withCallback:(id)a4;
+ (void)geocodeLocation:(id)a3 usingMode:(unint64_t)a4 withGeoFilters:(id)a5 withCallback:(id)a6;
+ (void)geocodePOIWithName:(id)a3 ofTypes:(id)a4 inRegion:(id)a5 withCallback:(id)a6;
@end

@implementation SGEventGeocode

+ (id)poiCategoriesFromString:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  context = (void *)MEMORY[0x1A6265250]();
  v26 = v3;
  v4 = [v3 componentsSeparatedByString:@","];
  v5 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    v27 = (void *)*MEMORY[0x1E4F64080];
    v28 = (void *)*MEMORY[0x1E4F640E8];
    v29 = (void *)*MEMORY[0x1E4F64040];
    v30 = (void *)*MEMORY[0x1E4F63FC0];
    v10 = (void *)*MEMORY[0x1E4F63F38];
    v11 = (void *)*MEMORY[0x1E4F64100];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        char v14 = [v13 isEqualToString:@"restaurant"];
        v15 = v11;
        if (v14) {
          goto LABEL_21;
        }
        char v16 = [v13 isEqualToString:@"airport"];
        v15 = v10;
        if (v16) {
          goto LABEL_21;
        }
        char v17 = [v13 isEqualToString:@"car-rental"];
        v15 = v30;
        if ((v17 & 1) == 0)
        {
          char v18 = [v13 isEqualToString:@"hotel"];
          v15 = v29;
          if ((v18 & 1) == 0)
          {
            char v19 = [v13 isEqualToString:@"public-transport"];
            v15 = v28;
            if ((v19 & 1) == 0)
            {
              int v20 = [v13 isEqualToString:@"movie-theater"];
              v15 = v27;
              if (!v20) {
                continue;
              }
            }
          }
        }
LABEL_21:
        id v21 = v15;
        if (v21)
        {
          v22 = v21;
          [v5 addObject:v21];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }

  v23 = (void *)[v5 copy];

  return v23;
}

+ (void)geocodeEvent:(id)a3 withCallback:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a1 geocodeEvent:a3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__SGEventGeocode_geocodeEvent_withCallback___block_invoke;
  v9[3] = &unk_1E5B8E540;
  id v10 = v6;
  id v8 = v6;
  [v7 wait:v9];
}

uint64_t __44__SGEventGeocode_geocodeEvent_withCallback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)geocodeEvent:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__SGEventGeocode_geocodeEvent___block_invoke;
  v9[3] = &unk_1E5B8E518;
  id v10 = v5;
  id v11 = a1;
  id v6 = v5;
  uint64_t v7 = +[SGFuture futureForObject:v6 withKey:a2 onCreate:v9];

  return v7;
}

void __31__SGEventGeocode_geocodeEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v22 = a2;
  id v3 = dispatch_group_create();
  v4 = [*(id *)(a1 + 32) geocodeLocations];
  id v5 = (void *)[v4 mutableCopy];

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  char v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__1346;
  v43[4] = __Block_byref_object_dispose__1347;
  id v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__1346;
  v41[4] = __Block_byref_object_dispose__1347;
  id v42 = 0;
  uint64_t v6 = [*(id *)(a1 + 32) geocodingMode];
  uint64_t v7 = *(void **)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) poiFilters];
  uint64_t v9 = [v7 poiCategoriesFromString:v8];

  for (unint64_t i = 0; [v5 count] > i; ++i)
  {
    id v11 = [v5 objectAtIndexedSubscript:i];
    if ([*(id *)(a1 + 40) isGeocodeCandidateLocation:v11 forEvent:*(void *)(a1 + 32)])
    {
      dispatch_group_enter(v3);
      v12 = sgEventsLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [*(id *)(a1 + 32) loggingIdentifier];
        *(_DWORD *)buf = 67109378;
        int v48 = i;
        __int16 v49 = 2114;
        v50 = v13;
        _os_log_impl(&dword_1A4D8C000, v12, OS_LOG_TYPE_DEFAULT, "SGEventGeocode geocodeEvent: Starting geocoding location at index %d. [SGEvent (%{public}@)]", buf, 0x12u);
      }
      char v14 = objc_opt_class();
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __31__SGEventGeocode_geocodeEvent___block_invoke_59;
      v31[3] = &unk_1E5B8E4C8;
      id v32 = *(id *)(a1 + 32);
      uint64_t v36 = v43;
      id v15 = v11;
      id v33 = v15;
      v37 = v41;
      uint64_t v16 = *(void *)(a1 + 40);
      v38 = v45;
      uint64_t v39 = v16;
      id v34 = v5;
      int v40 = i;
      v35 = v3;
      [v14 geocodeLocation:v15 usingMode:v6 withGeoFilters:v9 withCallback:v31];
    }
  }
  char v17 = [*(id *)(a1 + 40) _serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SGEventGeocode_geocodeEvent___block_invoke_2;
  block[3] = &unk_1E5B8E4F0;
  v27 = v41;
  id v18 = *(id *)(a1 + 32);
  uint64_t v19 = *(void *)(a1 + 40);
  v29 = v45;
  uint64_t v30 = v19;
  id v24 = v18;
  id v25 = v5;
  v28 = v43;
  id v26 = v22;
  id v20 = v22;
  id v21 = v5;
  dispatch_group_notify(v3, v17, block);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);

  _Block_object_dispose(v45, 8);
}

void __31__SGEventGeocode_geocodeEvent___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v5) {
    goto LABEL_14;
  }
  uint64_t v6 = [*(id *)(a1 + 32) geocodeStartTimeZone];
  if (!v6)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v6 = 0;
    }
    else
    {
      if (![*(id *)(a1 + 40) geocodeIsStart]) {
        goto LABEL_8;
      }
      uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
      id v8 = v5;
      uint64_t v6 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v8;
    }
  }

LABEL_8:
  uint64_t v9 = [*(id *)(a1 + 32) geocodeEndTimeZone];
  if (!v9)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      uint64_t v9 = 0;
    }
    else
    {
      if (![*(id *)(a1 + 40) geocodeIsEnd]) {
        goto LABEL_14;
      }
      uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
      id v11 = v5;
      uint64_t v9 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v11;
    }
  }

LABEL_14:
  if (v12
    && (![*(id *)(a1 + 88) locationIsGeocoded:*(void *)(a1 + 40)]
     || [*(id *)(a1 + 88) locationIsAirport:*(void *)(a1 + 40)])
    && [*(id *)(a1 + 88) locationIsGeocoded:v12])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    [*(id *)(a1 + 48) setObject:v12 atIndexedSubscript:*(int *)(a1 + 96)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __31__SGEventGeocode_geocodeEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v59 = a1 + 56;
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) geocodeEndTimeZone];
  }
  id v5 = v4;
  uint64_t v57 = v2;
  uint64_t v58 = v2 + 64;
  uint64_t v6 = *(void **)(*(void *)(*(void *)(v2 + 64) + 8) + 40);
  if (v6)
  {
    id v7 = v6;
    goto LABEL_34;
  }
  uint64_t v8 = [*(id *)(v2 + 32) geocodeStartTimeZone];
  uint64_t v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (void *)v8;
  }
  else {
    uint64_t v10 = v5;
  }
  id v7 = v10;

  if (!v7)
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v11 = [*(id *)(v2 + 32) geocodeLocations];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (!v12)
    {
      id v7 = 0;
      goto LABEL_33;
    }
    uint64_t v13 = v12;
    id v7 = 0;
    uint64_t v14 = *(void *)v62;
    while (1)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v62 != v14) {
          objc_enumerationMutation(v11);
        }
        v1 = *(NSObject **)(*((void *)&v61 + 1) + 8 * i);
        if ([v1 geocodeIsStart])
        {
          uint64_t v16 = [v1 geocodeAddress];
          char v17 = +[SGTimeZone timeZoneForAddress:v16];

          if (v17)
          {
            objc_storeStrong((id *)(*(void *)(*(void *)v58 + 8) + 40), v17);
            if ([v1 geocodeIsEnd])
            {
              v1 = *(NSObject **)(*(void *)v59 + 8);
              id v18 = v17;
              id v7 = v18;
LABEL_26:
              Class isa = v1[5].isa;
              v1[5].Class isa = (Class)v18;

              continue;
            }
            id v7 = v17;
          }
          else
          {
            id v7 = 0;
          }
        }
        else
        {
          if ([v1 geocodeIsEnd]) {
            BOOL v19 = v5 == 0;
          }
          else {
            BOOL v19 = 0;
          }
          if (v19)
          {
            v1 = [v1 geocodeAddress];
            id v5 = +[SGTimeZone timeZoneForAddress:v1];

            if (v5)
            {
              v1 = *(NSObject **)(*(void *)v59 + 8);
              id v18 = v5;
              id v5 = v18;
              goto LABEL_26;
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v61 objects:v65 count:16];
      if (!v13)
      {
LABEL_33:

        break;
      }
    }
  }
LABEL_34:
  id v21 = [*(id *)(v2 + 32) geocodeEndTimeZone];
  if (v21)
  {
  }
  else if (!*(void *)(*(void *)(*(void *)v59 + 8) + 40))
  {
    uint64_t v23 = [*(id *)(v2 + 32) geocodeStartTimeZone];
    id v24 = (void *)v23;
    uint64_t v26 = v2 + 64;
    uint64_t v25 = v59;
LABEL_41:
    id v22 = (void *)v23;
    if (!v23)
    {
      id v22 = v24;
      id v24 = *(void **)(*(void *)(*(void *)v26 + 8) + 40);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)v25 + 8) + 40), v24);
    goto LABEL_44;
  }
  id v22 = [*(id *)(v2 + 32) geocodeStartTimeZone];
  if (!v22)
  {
    if (*(void *)(*(void *)(*(void *)v58 + 8) + 40)) {
      goto LABEL_45;
    }
    uint64_t v23 = [*(id *)(v2 + 32) geocodeEndTimeZone];
    id v24 = (void *)v23;
    uint64_t v25 = v2 + 64;
    uint64_t v26 = v59;
    goto LABEL_41;
  }
LABEL_44:

LABEL_45:
  uint64_t v27 = *(void *)(*(void *)(*(void *)(v2 + 64) + 8) + 40);
  if (*(unsigned char *)(*(void *)(*(void *)(v2 + 72) + 8) + 24))
  {
    if (!v27) {
      goto LABEL_57;
    }
LABEL_49:
    [*(id *)(v2 + 32) geocodeStartTimeZone];
    if (objc_claimAutoreleasedReturnValue()) {
      __assert_rtn("+[SGEventGeocode geocodeEvent:]_block_invoke_2", "SGEventGeocode.m", 408, "![event geocodeStartTimeZone]");
    }
    v28 = [*(id *)(v2 + 32) geocodeStartDate];

    if (v28)
    {
      v29 = *(void **)(v2 + 80);
      uint64_t v30 = [*(id *)(v2 + 32) geocodeStartDate];
      long long v31 = [v29 dateForUTCDate:v30 withTimeZone:*(void *)(*(void *)(*(void *)(v2 + 64) + 8) + 40)];
    }
    else
    {
      uint64_t v30 = sgEventsLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A4D8C000, v30, OS_LOG_TYPE_ERROR, "SGGeocodeEvent: event geocodeStartDate is nil", buf, 2u);
      }
      long long v31 = 0;
    }

LABEL_58:
    if (*(void *)(*(void *)(*(void *)v59 + 8) + 40))
    {
      [*(id *)(v2 + 32) geocodeEndTimeZone];
      if (objc_claimAutoreleasedReturnValue()) {
        __assert_rtn("+[SGEventGeocode geocodeEvent:]_block_invoke", "SGEventGeocode.m", 422, "![event geocodeEndTimeZone]");
      }
      id v32 = [*(id *)(v2 + 32) geocodeEndDate];

      if (v32)
      {
        id v33 = *(void **)(v2 + 80);
        v1 = [*(id *)(v2 + 32) geocodeEndDate];
        id v34 = [v33 dateForUTCDate:v1 withTimeZone:*(void *)(*(void *)(*(void *)(v2 + 56) + 8) + 40)];
      }
      else
      {
        v1 = sgEventsLogHandle();
        if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A4D8C000, v1, OS_LOG_TYPE_ERROR, "SGGeocodeEvent: event geocodeEndDate is nil", buf, 2u);
        }
        id v34 = 0;
      }

      if (v31)
      {
        if (v34)
        {
          int v55 = 0;
          int v35 = 0;
          uint64_t v36 = *(void **)(v2 + 32);
LABEL_80:
          v53 = v31;
          v56 = v31;
LABEL_81:
          int v40 = *(void **)(*(void *)(*(void *)v58 + 8) + 40);
          v41 = v40;
          if (!v40)
          {
            v41 = [*(id *)(v2 + 32) geocodeStartTimeZone];
          }
          id v42 = v34;
          if (v35)
          {
            id v42 = [*(id *)(v2 + 32) geocodeEndDate];
          }
          v43 = *(void **)(*(void *)(*(void *)v59 + 8) + 40);
          id v44 = v43;
          if (!v43)
          {
            id v44 = [*(id *)(v57 + 32) geocodeEndTimeZone];
          }
          objc_msgSend(v36, "geocodedEventWithStartDate:startTimeZone:endDate:endTimeZone:locations:", v56, v41, v42, v44, *(void *)(v57 + 40), v53);
          id v45 = (id)objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            if (!v35)
            {
LABEL_90:
              uint64_t v2 = v57;
              if (!v40) {

              }
              if (v55) {
              long long v31 = v54;
              }
LABEL_101:

              goto LABEL_102;
            }
          }
          else
          {

            if (!v35) {
              goto LABEL_90;
            }
          }

          goto LABEL_90;
        }
        goto LABEL_70;
      }
    }
    else
    {
      if (v31)
      {
LABEL_70:
        int v37 = 0;
        goto LABEL_71;
      }
      id v34 = 0;
    }
    uint64_t v39 = [*(id *)(v2 + 32) geocodeStartDate];
    if (!v39) {
      goto LABEL_98;
    }
    v1 = v39;
    if (v34)
    {

      int v35 = 0;
      goto LABEL_77;
    }
    int v37 = 1;
LABEL_71:
    v38 = [*(id *)(v2 + 32) geocodeEndDate];

    if (v37)
    {

      id v34 = 0;
      if (v38)
      {
        int v35 = 1;
LABEL_77:
        uint64_t v36 = *(void **)(v2 + 32);
        v56 = objc_msgSend(v36, "geocodeStartDate", v31);
        int v55 = 1;
        goto LABEL_81;
      }
    }
    else
    {
      if (v38)
      {
        int v55 = 0;
        id v34 = 0;
        uint64_t v36 = *(void **)(v2 + 32);
        int v35 = 1;
        goto LABEL_80;
      }
      id v34 = 0;
    }
LABEL_98:
    char v46 = sgEventsLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1A4D8C000, v46, OS_LOG_TYPE_FAULT, "SGGeocodeEvent: Missing start or end date, going with existing event to avoid creating a new faulty event", buf, 2u);
    }

    id v45 = *(id *)(v2 + 32);
    goto LABEL_101;
  }
  if (v27) {
    goto LABEL_49;
  }
  if (*(void *)(*(void *)(*(void *)v59 + 8) + 40))
  {
LABEL_57:
    long long v31 = 0;
    goto LABEL_58;
  }
  id v45 = *(id *)(v2 + 32);
LABEL_102:
  if (v45 == *(id *)(v2 + 32))
  {
    v47 = [v45 geocodeStartDate];
    int v48 = [*(id *)(v2 + 32) geocodeStartTimeZone];
    __int16 v49 = [*(id *)(v2 + 32) geocodeEndDate];
    v50 = [*(id *)(v2 + 32) geocodeEndTimeZone];
    uint64_t v51 = [*(id *)(v2 + 32) geocodeLocations];
    uint64_t v52 = [v45 geocodedEventWithStartDate:v47 startTimeZone:v48 endDate:v49 endTimeZone:v50 locations:v51];

    id v45 = (id)v52;
    uint64_t v2 = v57;
  }
  [*(id *)(v2 + 48) succeed:v45];
}

+ (id)dateForUTCDate:(id)a3 withTimeZone:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F1C9A8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  uint64_t v9 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v10 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v9 setTimeZone:v10];

  id v11 = [v9 components:1048828 fromDate:v7];

  [v11 setTimeZone:v6];
  uint64_t v12 = [v9 dateFromComponents:v11];

  return v12;
}

+ (void)geocodeLocation:(id)a3 usingMode:(unint64_t)a4 withGeoFilters:(id)a5 withCallback:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__1346;
  v48[4] = __Block_byref_object_dispose__1347;
  id v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__1346;
  v46[4] = __Block_byref_object_dispose__1347;
  id v47 = 0;
  unsigned int v13 = [a1 locationIsAirport:v10];
  char v14 = v13;
  unint64_t v15 = v13;
  if (a4) {
    unint64_t v15 = a4;
  }
  switch(v15)
  {
    case 1uLL:
      if (v13)
      {
        id v19 = [NSString alloc];
        id v20 = [v10 geocodeAirportCode];
        uint64_t v16 = (void *)[v19 initWithFormat:@"%@ airport", v20];
      }
      else
      {
        id v23 = [NSString alloc];
        id v20 = [v10 geocodeLabel];
        id v24 = [v10 geocodeAddress];
        uint64_t v16 = (void *)[v23 initWithFormat:@"%@, %@", v20, v24];
      }
      uint64_t v25 = objc_opt_class();
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke_54;
      v39[3] = &unk_1E5B8E478;
      v41[1] = v46;
      v41[3] = a1;
      id v40 = v10;
      v41[2] = v48;
      char v42 = v14;
      v41[0] = v12;
      [v25 geocodeAddress:v16 withCallback:v39];
      uint64_t v26 = &v40;
      uint64_t v27 = (id *)v41;
      break;
    case 2uLL:
      if (v13)
      {
        uint64_t v16 = [v10 geocodeAirportCode];
      }
      else
      {
        id v28 = [NSString alloc];
        v29 = [v10 geocodeLabel];
        uint64_t v30 = [v10 geocodeAddress];
        uint64_t v16 = (void *)[v28 initWithFormat:@"%@, %@", v29, v30];
      }
      id v18 = v44;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke;
      v44[3] = &unk_1E5B8E400;
      v44[7] = v46;
      char v45 = v14;
      id v31 = v11;
      v44[4] = v31;
      v44[8] = v48;
      v44[5] = v10;
      v44[6] = v12;
      [a1 geocodePOIWithName:v16 ofTypes:v31 inRegion:0 withCallback:v44];
      goto LABEL_17;
    case 3uLL:
      uint64_t v16 = [v10 geocodeAddress];
      char v17 = objc_opt_class();
      id v18 = v43;
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke_45;
      v43[3] = &unk_1E5B8E450;
      v43[7] = v46;
      v43[8] = v48;
      v43[4] = v10;
      void v43[5] = v11;
      v43[9] = a1;
      v43[6] = v12;
      [v17 geocodeAddress:v16 withCallback:v43];
LABEL_17:
      uint64_t v26 = (id *)(v18 + 4);
      uint64_t v27 = (id *)(v18 + 5);

      break;
    default:
      if (v13)
      {
        id v21 = [NSString alloc];
        id v22 = [v10 geocodeAirportCode];
        uint64_t v16 = (void *)[v21 initWithFormat:@"%@ airport", v22];
      }
      else
      {
        id v32 = [NSString alloc];
        id v22 = [v10 geocodeLabel];
        id v33 = [v10 geocodeAddress];
        uint64_t v16 = (void *)[v32 initWithFormat:@"%@, %@", v22, v33];
      }
      id v34 = objc_opt_class();
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke_55;
      v35[3] = &unk_1E5B8E4A0;
      v37[1] = v46;
      v37[2] = v48;
      id v36 = v10;
      char v38 = v14;
      v37[0] = v12;
      [v34 geocodeAddressWithCanonicalSearch:v16 withCallback:v35];
      uint64_t v26 = &v36;
      uint64_t v27 = (id *)v37;
      break;
  }

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);
}

void __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 coordinate];
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [v3 timezone];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = sgEventsLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    if (*(unsigned char *)(a1 + 72)) {
      id v22 = @"Yes";
    }
    else {
      id v22 = @"No";
    }
    id v23 = objc_msgSend(*(id *)(a1 + 32), "_pas_componentsJoinedByString:", @",");
    int v24 = 138412546;
    uint64_t v25 = v22;
    __int16 v26 = 2112;
    uint64_t v27 = v23;
    _os_log_debug_impl(&dword_1A4D8C000, v11, OS_LOG_TYPE_DEBUG, "SGEventGeocode geocodeLocation: Found POI using mode SGGeocodingModePOIOnly (isAirport? : %@, filters: %@)", (uint8_t *)&v24, 0x16u);
  }
  id v12 = *(void **)(a1 + 40);
  unsigned int v13 = [v3 name];
  char v14 = [v3 geoAddress];
  unint64_t v15 = [v14 formattedAddressLines];
  uint64_t v16 = objc_msgSend(v15, "_pas_componentsJoinedByString:", @", ");
  char v17 = [MEMORY[0x1E4F64710] sharedService];
  id v18 = [v17 handleForMapItem:v3];
  uint64_t v19 = [v12 geocodedLocationWithLabel:v13 address:v16 latitude:v18 longitude:v5 accuracy:v7 handle:1.0];
  uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
  id v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 timezone];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    double v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [v4 coordinate];
    double v9 = v8;
    double v11 = v10;
    id v12 = *(void **)(a1 + 32);
    unsigned int v13 = [MEMORY[0x1E4F64710] sharedService];
    char v14 = [v13 handleForMapItem:v4];
    uint64_t v15 = [v12 geocodedLocationWithLatitude:v14 longitude:v9 accuracy:v11 handle:1.0];
    uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
    char v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    id v18 = sgEventsLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v29 = objc_msgSend(*(id *)(a1 + 40), "_pas_componentsJoinedByString:", @",");
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v29;
      _os_log_debug_impl(&dword_1A4D8C000, v18, OS_LOG_TYPE_DEBUG, "SGEventGeocode geocodeLocation: Found address using mode SGGeocodingModeAddressThenPOI. Now trying to refine and look for a relevant POI w/ filters: %@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v19 = [*(id *)(a1 + 32) geocodeLabel];
    if (v19)
    {
      uint64_t v20 = [*(id *)(a1 + 32) geocodeLabel];
      if ([v20 isEqualToString:&stru_1EF915628])
      {
      }
      else
      {
        id v21 = [*(id *)(a1 + 32) geocodeLabel];
        id v22 = [*(id *)(a1 + 32) geocodeAddress];
        char v23 = [v21 isEqualToString:v22];

        if ((v23 & 1) == 0)
        {
          int v24 = [*(id *)(a1 + 32) geocodeLabel];
          id v25 = objc_alloc(MEMORY[0x1E4F64700]);
          GEOCoordinateRegionMakeWithDistance();
          __int16 v26 = objc_msgSend(v25, "initWithCoordinateRegion:");
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v38 = 0x3032000000;
          uint64_t v39 = __Block_byref_object_copy__1346;
          id v40 = __Block_byref_object_dispose__1347;
          id v41 = 0;
          id v41 = [*(id *)(a1 + 32) geocodeLabel];
          uint64_t v27 = objc_opt_class();
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke_50;
          v30[3] = &unk_1E5B8E428;
          double v35 = v9;
          double v36 = v11;
          uint64_t v28 = *(void *)(a1 + 40);
          id v32 = *(id *)(a1 + 48);
          int8x16_t v33 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
          p_long long buf = &buf;
          id v31 = *(id *)(a1 + 32);
          [v27 geocodePOIWithName:v24 ofTypes:v28 inRegion:v26 withCallback:v30];

          _Block_object_dispose(&buf, 8);
          goto LABEL_10;
        }
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_10:
}

void __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke_54(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = v3;
  if (!v3) {
    goto LABEL_10;
  }
  uint64_t v5 = [v3 timezone];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [v4 coordinate];
  double v9 = v8;
  double v11 = v10;
  if (![*(id *)(a1 + 64) locationIsGeocoded:*(void *)(a1 + 32)]
    || ([*(id *)(a1 + 32) geocodeAirportCode],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v12))
  {
    id v25 = *(void **)(a1 + 32);
    int v24 = [MEMORY[0x1E4F64710] sharedService];
    __int16 v26 = [v24 handleForMapItem:v4];
    uint64_t v27 = [v25 geocodedLocationWithLatitude:v26 longitude:v9 accuracy:v11 handle:1.0];
    uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
    v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

LABEL_7:
    goto LABEL_8;
  }
  [*(id *)(a1 + 32) geocodeLatitude];
  [*(id *)(a1 + 32) geocodeLongitude];
  GEOMapPointForCoordinate();
  GEOMapPointForCoordinate();
  GEOMetersBetweenMapPoints();
  unsigned int v13 = *(void **)(a1 + 32);
  if (v14 <= 10000.0)
  {
    int v24 = [v4 name];
    __int16 v26 = [v4 geoAddress];
    id v31 = [v26 formattedAddressLines];
    id v32 = objc_msgSend(v31, "_pas_componentsJoinedByString:", @", ");
    int8x16_t v33 = [MEMORY[0x1E4F64710] sharedService];
    id v34 = [v33 handleForMapItem:v4];
    uint64_t v35 = [v13 geocodedLocationWithLabel:v24 address:v32 latitude:v34 longitude:v9 accuracy:v11 handle:1.0];
    uint64_t v36 = *(void *)(*(void *)(a1 + 56) + 8);
    int v37 = *(void **)(v36 + 40);
    *(void *)(v36 + 40) = v35;

    goto LABEL_7;
  }
  uint64_t v15 = [*(id *)(a1 + 32) geocodeLabel];
  uint64_t v16 = [*(id *)(a1 + 32) geocodeAddress];
  [*(id *)(a1 + 32) geocodeLatitude];
  double v18 = v17;
  [*(id *)(a1 + 32) geocodeLongitude];
  uint64_t v20 = [v13 geocodedLocationWithLabel:v15 address:v16 latitude:0 longitude:v18 accuracy:v19 handle:1.0];
  uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
  id v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
  int v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = 0;
LABEL_8:

  uint64_t v30 = sgEventsLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    if (*(unsigned char *)(a1 + 72)) {
      uint64_t v38 = @"Yes";
    }
    else {
      uint64_t v38 = @"No";
    }
    int v39 = 138412290;
    id v40 = v38;
    _os_log_debug_impl(&dword_1A4D8C000, v30, OS_LOG_TYPE_DEBUG, "SGEventGeocode geocodeLocation: Found address using mode SGGecodingModeAddressOnly. (isAirport? : %@)", (uint8_t *)&v39, 0xCu);
  }

LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = a2;
    [v3 coordinate];
    double v5 = v4;
    double v7 = v6;
    uint64_t v8 = [v3 timezone];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    double v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    double v11 = *(void **)(a1 + 32);
    id v12 = [MEMORY[0x1E4F64710] sharedService];
    unsigned int v13 = [v12 handleForMapItem:v3];

    uint64_t v14 = [v11 geocodedLocationWithLatitude:v13 longitude:v5 accuracy:v7 handle:1.0];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    double v17 = sgEventsLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      if (*(unsigned char *)(a1 + 64)) {
        double v19 = @"Yes";
      }
      else {
        double v19 = @"No";
      }
      int v20 = 138412290;
      uint64_t v21 = v19;
      _os_log_debug_impl(&dword_1A4D8C000, v17, OS_LOG_TYPE_DEBUG, "SGEventGeocode geocodeLocation: Found address using mode SGGeocodingModeAddressWithCanonicalSearch. (isAirport? : %@)", (uint8_t *)&v20, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke_50(void *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v5 = v3;
  if (v3)
  {
    [v3 coordinate];
    double v7 = v6;
    double v9 = v8;
    GEOMapPointForCoordinate();
    GEOMapPointForCoordinate();
    GEOMetersBetweenMapPoints();
    if (v10 <= 500.0)
    {
      uint64_t v11 = [v5 timezone];
      uint64_t v12 = *(void *)(a1[7] + 8);
      unsigned int v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      uint64_t v14 = [v5 name];
      uint64_t v15 = [v14 lowercaseString];
      uint64_t v16 = [*(id *)(*(void *)(a1[8] + 8) + 40) lowercaseString];
      int v17 = [v15 isEqualToString:v16];

      if (v17)
      {
        double v18 = (void *)a1[4];
        double v19 = [v5 name];
        int v20 = [v5 geoAddress];
        uint64_t v21 = [v20 formattedAddressLines];
        uint64_t v22 = objc_msgSend(v21, "_pas_componentsJoinedByString:", @", ");
        uint64_t v23 = [MEMORY[0x1E4F64710] sharedService];
        int v24 = [v23 handleForMapItem:v5];
        uint64_t v25 = [v18 geocodedLocationWithLabel:v19 address:v22 latitude:v24 longitude:v7 accuracy:v9 handle:1.0];
        uint64_t v26 = *(void *)(a1[6] + 8);
        uint64_t v27 = *(void **)(v26 + 40);
        *(void *)(v26 + 40) = v25;

        uint64_t v28 = sgEventsLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v29 = [v5 name];
          int v34 = 138739971;
          uint64_t v35 = v29;
          uint64_t v30 = "SGEventGeocode geocodeLocation: Found POI using mode SGGeocodingModeAddressThenPOI %{sensitive}@";
          id v31 = v28;
          uint32_t v32 = 12;
LABEL_10:
          _os_log_debug_impl(&dword_1A4D8C000, v31, OS_LOG_TYPE_DEBUG, v30, (uint8_t *)&v34, v32);
        }
      }
      else
      {
        uint64_t v28 = sgEventsLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v29 = [v5 name];
          uint64_t v33 = *(void *)(*(void *)(a1[8] + 8) + 40);
          int v34 = 138740227;
          uint64_t v35 = v29;
          __int16 v36 = 2117;
          uint64_t v37 = v33;
          uint64_t v30 = "SGEventGeocode geocodeLocation: Found POI using mode SGGeocodingModeAddressThenPOI: %{sensitive}@, but d"
                "idn't match exactly the extracted label (%{sensitive}@). Falling back on address location only";
          id v31 = v28;
          uint32_t v32 = 22;
          goto LABEL_10;
        }
      }
    }
  }
  (*(void (**)(void, void, void, uint64_t))(a1[5] + 16))(a1[5], *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40), v4);
}

+ (void)geocodePOIWithName:(id)a3 ofTypes:(id)a4 inRegion:(id)a5 withCallback:(id)a6
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v9;
  uint64_t v14 = (void *)MEMORY[0x1A6265250]();
  uint64_t v15 = [MEMORY[0x1E4F64710] sharedService];
  uint64_t v16 = [v15 defaultTraits];

  if (v11) {
    [v16 setMapRegion:v11];
  }
  int v17 = (void *)[objc_alloc(MEMORY[0x1E4F647F0]) initWithCategoriesToInclude:v10 categoriesToExclude:0];
  double v18 = (void *)[objc_alloc(MEMORY[0x1E4F64938]) initWithResultTypes:2];
  double v19 = (void *)MEMORY[0x1A6265250]();
  int v20 = [MEMORY[0x1E4F64710] sharedService];
  v29[0] = v17;
  v29[1] = v18;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  uint64_t v21 = v24 = v10;
  uint64_t v22 = [v20 ticketForSearchQuery:v13 filters:v21 maxResults:5 traits:v16];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __67__SGEventGeocode_geocodePOIWithName_ofTypes_inRegion_withCallback___block_invoke;
  v26[3] = &unk_1E5B8E3D8;
  id v27 = v12;
  id v28 = a1;
  id v23 = v12;
  [v22 submitWithHandler:v26 networkActivity:0];
}

void __67__SGEventGeocode_geocodePOIWithName_ofTypes_inRegion_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 40) _serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__SGEventGeocode_geocodePOIWithName_ofTypes_inRegion_withCallback___block_invoke_2;
  v6[3] = &unk_1E5B8E3B0;
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __67__SGEventGeocode_geocodePOIWithName_ofTypes_inRegion_withCallback___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

+ (void)geocodeAddressWithCanonicalSearch:(id)a3 withCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1A6265250]();
  id v9 = (void *)MEMORY[0x1A6265250]();
  id v10 = [MEMORY[0x1E4F64710] sharedService];
  id v11 = [v10 defaultTraits];

  id v12 = (void *)MEMORY[0x1A6265250]();
  id v13 = [MEMORY[0x1E4F64710] sharedService];
  uint64_t v14 = [v13 ticketForCanonicalLocationSearchQueryString:v6 traits:v11];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__SGEventGeocode_geocodeAddressWithCanonicalSearch_withCallback___block_invoke;
  v16[3] = &unk_1E5B8E3D8;
  id v18 = a1;
  id v15 = v7;
  id v17 = v15;
  [v14 submitWithHandler:v16 networkActivity:0];
}

void __65__SGEventGeocode_geocodeAddressWithCanonicalSearch_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 40) _serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__SGEventGeocode_geocodeAddressWithCanonicalSearch_withCallback___block_invoke_2;
  v6[3] = &unk_1E5B8E3B0;
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __65__SGEventGeocode_geocodeAddressWithCanonicalSearch_withCallback___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

+ (void)geocodeAddress:(id)a3 withCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1A6265250]();
  id v9 = (void *)MEMORY[0x1A6265250]();
  id v10 = [MEMORY[0x1E4F64710] sharedService];
  id v11 = [v10 defaultTraits];

  id v12 = (void *)MEMORY[0x1A6265250]();
  id v13 = [MEMORY[0x1E4F64710] sharedService];
  uint64_t v14 = [v13 ticketForSearchQuery:v6 completionItem:0 maxResults:5 traits:v11];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__SGEventGeocode_geocodeAddress_withCallback___block_invoke;
  v16[3] = &unk_1E5B8E3D8;
  id v18 = a1;
  id v15 = v7;
  id v17 = v15;
  [v14 submitWithHandler:v16 networkActivity:0];
}

void __46__SGEventGeocode_geocodeAddress_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 40) _serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__SGEventGeocode_geocodeAddress_withCallback___block_invoke_2;
  v6[3] = &unk_1E5B8E3B0;
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __46__SGEventGeocode_geocodeAddress_withCallback___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

+ (BOOL)isGeocodeCandidate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(v4, "geocodeLocations", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([a1 isGeocodeCandidateLocation:*(void *)(*((void *)&v12 + 1) + 8 * i) forEvent:v4])
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)isGeocodeCandidateLocation:(id)a3 forEvent:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [a1 locationIsGeocoded:v6];
  if (!v8
    || ([v6 geocodeAirportCode], id v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    BOOL v10 = [v6 geocodeAddress];

    if (!v10)
    {
      long long v13 = sgEventsLogHandle();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
LABEL_14:

        BOOL v17 = 0;
        goto LABEL_15;
      }
      long long v14 = [v7 loggingIdentifier];
      int v19 = 138543362;
      int v20 = v14;
      long long v15 = "SGEventGeocode isGeocodeCandidateLocation: Returning NO, event has no address. [SGEvent (%{public}@)]";
LABEL_17:
      _os_log_debug_impl(&dword_1A4D8C000, v13, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v19, 0xCu);

      goto LABEL_14;
    }
    if (v8)
    {
      id v11 = [v7 geocodeStartTimeZone];
      if (v11 || ([v6 geocodeIsStart] & 1) == 0)
      {
        long long v12 = [v7 geocodeEndTimeZone];
        if (v12)
        {

LABEL_13:
          long long v13 = sgEventsLogHandle();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_14;
          }
          long long v14 = [v7 loggingIdentifier];
          int v19 = 138543362;
          int v20 = v14;
          long long v15 = "SGEventGeocode isGeocodeCandidateLocation: Returning NO, nothing to work with. [SGEvent (%{public}@)]";
          goto LABEL_17;
        }
        char v16 = [v6 geocodeIsEnd];

        if ((v16 & 1) == 0) {
          goto LABEL_13;
        }
      }
    }
  }
  BOOL v17 = 1;
LABEL_15:

  return v17;
}

+ (BOOL)locationIsGeocoded:(id)a3
{
  id v3 = a3;
  [v3 geocodeLatitude];
  [v3 geocodeLongitude];

  return 1;
}

+ (BOOL)locationIsAirport:(id)a3
{
  id v4 = a3;
  id v5 = [v4 geocodeAirportCode];
  if (v5) {
    char v6 = [a1 locationIsGeocoded:v4];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (id)_serialQueue
{
  if (_serialQueue_onceToken != -1) {
    dispatch_once(&_serialQueue_onceToken, &__block_literal_global_1381);
  }
  uint64_t v2 = (void *)_serialQueue_queue;

  return v2;
}

void __30__SGEventGeocode__serialQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.suggestions.SGEventGeocode", attr);
  uint64_t v2 = (void *)_serialQueue_queue;
  _serialQueue_queue = (uint64_t)v1;
}

@end