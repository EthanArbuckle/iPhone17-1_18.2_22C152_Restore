@interface EKMapsUtilities
+ (id)_locationStringForStructuredLocation:(id)a3 withTitle:(id)a4;
+ (id)mapsURLForLocation:(id)a3 onEvent:(id)a4 hasMapItemLaunchOptionFromTimeToLeaveNotification:(BOOL)a5;
+ (void)geocodeEventIfNeeded:(id)a3;
@end

@implementation EKMapsUtilities

+ (id)mapsURLForLocation:(id)a3 onEvent:(id)a4 hasMapItemLaunchOptionFromTimeToLeaveNotification:(BOOL)a5
{
  BOOL v5 = a5;
  v39[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = [v8 preferredLocation];
    if (!v10)
    {
      v15 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
      {
        int v33 = 138412290;
        v34 = v9;
        _os_log_impl(&dword_1A4E47000, v15, OS_LOG_TYPE_INFO, "No structured location found.  Will not generate URL for event: [%@]", (uint8_t *)&v33, 0xCu);
      }
      v14 = 0;
      goto LABEL_30;
    }
    v11 = (void *)EKWeakLinkClass();
    v12 = [v10 mapKitHandle];
    if (v12)
    {
    }
    else
    {
      v16 = [v10 geoLocation];

      if (!v16)
      {
        v20 = 0;
LABEL_18:
        v22 = [v10 mapKitHandle];

        if (v22)
        {
          v23 = [v10 mapKitHandle];
          v37 = v23;
          v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
          v14 = [v11 _urlForMapItemHandles:v24 options:v20];

          v25 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
          {
            int v33 = 138412546;
            v34 = v14;
            __int16 v35 = 2112;
            v36 = v10;
            _os_log_impl(&dword_1A4E47000, v25, OS_LOG_TYPE_INFO, "MapKit handle found.  Generated URL [%@] for location [%@].", (uint8_t *)&v33, 0x16u);
          }
        }
        else
        {
          v26 = [v10 geoLocation];

          if (v26)
          {
            v27 = [(id)objc_opt_class() _locationStringForStructuredLocation:v10 withTitle:v7];
            v28 = [v10 geoLocation];
            v29 = [v10 address];
            v14 = [v11 _urlForLocation:v28 address:v29 label:v27 options:v20];

            v30 = EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
            {
              int v33 = 138412546;
              v34 = v14;
              __int16 v35 = 2112;
              v36 = v10;
              _os_log_impl(&dword_1A4E47000, v30, OS_LOG_TYPE_INFO, "Geolocation found.  Generated URL [%@] for location [%@].", (uint8_t *)&v33, 0x16u);
            }
          }
          else
          {
            v31 = EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
            {
              int v33 = 138412290;
              v34 = v10;
              _os_log_impl(&dword_1A4E47000, v31, OS_LOG_TYPE_INFO, "No map kit handle or geolocation found.  Will not generate URL for location: [%@]", (uint8_t *)&v33, 0xCu);
            }
            v14 = 0;
          }
        }

LABEL_30:
        goto LABEL_31;
      }
    }
    uint64_t v17 = EKWeakLinkStringConstant();
    v18 = (void *)v17;
    if (v17)
    {
      uint64_t v38 = v17;
      v19 = [NSNumber numberWithBool:v5];
      v39[0] = v19;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    }
    else
    {
      v21 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        +[EKMapsUtilities mapsURLForLocation:onEvent:hasMapItemLaunchOptionFromTimeToLeaveNotification:](v21);
      }
      v20 = 0;
    }

    goto LABEL_18;
  }
  v13 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    +[EKMapsUtilities mapsURLForLocation:onEvent:hasMapItemLaunchOptionFromTimeToLeaveNotification:](v13);
  }
  v14 = 0;
LABEL_31:

  return v14;
}

+ (id)_locationStringForStructuredLocation:(id)a3 withTitle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v9 = 0;
    goto LABEL_11;
  }
  id v7 = [v5 address];
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v5 title];
    if (!v8) {
      goto LABEL_8;
    }
  }
  if (([v7 hasPrefix:v8] & 1) != 0 || !objc_msgSend(v7, "CalContainsSubstring:", v8))
  {
    id v10 = [MEMORY[0x1E4F57740] fullDisplayStringWithTitle:v8 address:v7];
    goto LABEL_10;
  }
LABEL_8:
  id v10 = v7;
LABEL_10:
  v9 = v10;

LABEL_11:

  return v9;
}

+ (void)geocodeEventIfNeeded:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[EKFeatureSet isTravelAdvisorySupported])
  {
    v4 = [v3 locationWithoutPrediction];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      id v6 = [v3 structuredLocationWithoutPrediction];
      uint64_t v7 = [v6 geoLocation];
      if (v7)
      {
        id v8 = (void *)v7;
        v9 = [v6 mapKitHandle];

        if (!v9)
        {
          v11 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v61 = v3;
            v12 = "Event has geoLocation but no mapKitHandle.  Will not attempt geocode for event: [%@]";
            goto LABEL_18;
          }
          goto LABEL_36;
        }
      }
      id v10 = [v3 suggestionInfo];

      if (v10)
      {
        v11 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v61 = v3;
          v12 = "Event is a suggested event.  Will not attempt geocode for event: [%@]";
LABEL_18:
          _os_log_impl(&dword_1A4E47000, v11, OS_LOG_TYPE_INFO, v12, buf, 0xCu);
          goto LABEL_36;
        }
        goto LABEL_36;
      }
      if ([v3 _hasChangesForKey:*MEMORY[0x1E4F56D10]])
      {
        v11 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v61 = v3;
          v12 = "Event has unsaved location changes.  Will not attempt geocode for event: [%@]";
          goto LABEL_18;
        }
LABEL_36:

        goto LABEL_37;
      }
      if (geocodeEventIfNeeded__onceToken != -1) {
        dispatch_once(&geocodeEventIfNeeded__onceToken, &__block_literal_global_74);
      }
      v15 = NSNumber;
      v16 = [v3 objectID];
      uint64_t v17 = objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "rowID"));

      v18 = [(id)geocodeEventIfNeeded__s_lastGeocodedStringForEvent objectForKeyedSubscript:v17];
      v19 = [v3 locationWithoutPrediction];
      int v20 = [v19 isEqualToString:v18];

      if (v20)
      {
        id v21 = [(id)geocodeEventIfNeeded__s_lastGeocodeDateForEvent objectForKeyedSubscript:v17];
        if (v21)
        {
          v22 = objc_opt_new();
          [v22 timeIntervalSinceDate:v21];
          double v24 = v23;

          if (v24 < 86400.0)
          {
            v25 = EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v61 = v3;
              _os_log_impl(&dword_1A4E47000, v25, OS_LOG_TYPE_INFO, "Event location hasn't changed since we geocoded 24 hours ago.  Will not attempt geocode for event: [%@]", buf, 0xCu);
            }
            goto LABEL_35;
          }
        }
      }
      v48 = v18;
      v26 = objc_opt_new();
      [(id)geocodeEventIfNeeded__s_lastGeocodeDateForEvent setObject:v26 forKeyedSubscript:v17];

      v27 = [v3 locationWithoutPrediction];
      v49 = v17;
      [(id)geocodeEventIfNeeded__s_lastGeocodedStringForEvent setObject:v27 forKeyedSubscript:v17];

      v28 = [(id)geocodeEventIfNeeded__storeForSavingProvider eventStore];
      v29 = [v3 objectID];
      v30 = [v3 startDate];
      v31 = [v28 eventForObjectID:v29 occurrenceDate:v30 checkValid:0];

      v32 = [v31 locationWithoutPrediction];
      int v33 = [v31 clientLocation];
      v34 = [v33 mapKitHandle];
      if (v34) {
        [v31 clientLocation];
      }
      else {
      __int16 v35 = [v31 structuredLocationWithoutPrediction];
      }
      v36 = [v35 mapKitHandle];

      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_23;
      v54[3] = &unk_1E5B998D8;
      id v37 = v31;
      id v55 = v37;
      id v38 = v32;
      id v56 = v38;
      id v39 = v36;
      id v57 = v39;
      id v58 = v49;
      id v21 = v28;
      id v59 = v21;
      v40 = (void *)MEMORY[0x1A6266730](v54);
      if (v39)
      {
        id v41 = v38;
        v42 = (void *)EKWeakLinkClass();
        v43 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v61 = v3;
          _os_log_impl(&dword_1A4E47000, v43, OS_LOG_TYPE_DEFAULT, "Starting geocode of mapHandle for event: [%@]", buf, 0xCu);
        }
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_29;
        v50[3] = &unk_1E5B99900;
        id v51 = v40;
        [v42 _mapItemFromHandle:v39 completionHandler:v50];

        id v38 = v41;
        goto LABEL_34;
      }
      if ([v37 locationIsAConferenceRoom])
      {
        v44 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v45 = "The event has a location that is a conference room.  Will not attempt to geocode its location string.";
LABEL_47:
          _os_log_impl(&dword_1A4E47000, v44, OS_LOG_TYPE_INFO, v45, buf, 2u);
        }
      }
      else
      {
        char v46 = [v37 automaticLocationGeocodingAllowed];
        v44 = EKLogHandle;
        if (v46)
        {
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v61 = v3;
            _os_log_impl(&dword_1A4E47000, v44, OS_LOG_TYPE_DEFAULT, "Starting geocode of location string for event: [%@]", buf, 0xCu);
          }
          v47 = (void *)MEMORY[0x1E4F57718];
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_27;
          v52[3] = &unk_1E5B99900;
          id v53 = v40;
          [v47 geocodeLocationString:v38 withCompletionBlock:v52];

          goto LABEL_34;
        }
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v45 = "Automatic location geocoding is disallowed.  Will not attempt to geocode this event's location string.";
          goto LABEL_47;
        }
      }
LABEL_34:

      v18 = v48;
      uint64_t v17 = v49;
LABEL_35:

      goto LABEL_36;
    }
    v13 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v61 = v3;
      v14 = "Event has no location.  Will not attempt geocode for event: [%@]";
      goto LABEL_12;
    }
  }
  else
  {
    v13 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v61 = v3;
      v14 = "Travel advisory not supported.  Will not attempt geocode for event: [%@]";
LABEL_12:
      _os_log_impl(&dword_1A4E47000, v13, OS_LOG_TYPE_INFO, v14, buf, 0xCu);
    }
  }
LABEL_37:
}

uint64_t __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)geocodeEventIfNeeded__s_lastGeocodeDateForEvent;
  geocodeEventIfNeeded__s_lastGeocodeDateForEvent = v0;

  uint64_t v2 = objc_opt_new();
  id v3 = (void *)geocodeEventIfNeeded__s_lastGeocodedStringForEvent;
  geocodeEventIfNeeded__s_lastGeocodedStringForEvent = v2;

  v4 = [[EKEphemeralCacheEventStoreProvider alloc] initWithCreationBlock:&__block_literal_global_20_0];
  uint64_t v5 = geocodeEventIfNeeded__storeForSavingProvider;
  geocodeEventIfNeeded__storeForSavingProvider = (uint64_t)v4;

  return MEMORY[0x1F41817F8](v4, v5);
}

id __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_2()
{
  uint64_t v0 = objc_opt_new();

  return v0;
}

void __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_23(id *a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  v9 = dispatch_get_global_queue(9, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_2_24;
  v12[3] = &unk_1E5B998B0;
  id v13 = a1[4];
  char v20 = a4;
  id v14 = a1[5];
  id v15 = a1[6];
  id v16 = v8;
  id v17 = a1[7];
  id v18 = v7;
  id v19 = a1[8];
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_2_24(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshIfRefreshableAndNotify:1];
  uint64_t v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 88))
  {
    id v3 = *(void **)(a1 + 40);
    v4 = [v2 locationWithoutPrediction];
    LOBYTE(v3) = [v3 isEqualToString:v4];

    if (v3) {
      goto LABEL_3;
    }
LABEL_16:
    char v20 = EKLogHandle;
    if (!os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)v26 = 0;
    id v21 = "Geocoding finished but the event location changed. Not saving results of geocode.";
    v22 = v26;
    goto LABEL_18;
  }
  id v6 = *(void **)(a1 + 48);
  id v7 = [v2 clientLocation];
  id v8 = [v7 mapKitHandle];
  v9 = *(void **)(a1 + 32);
  if (v8)
  {
    id v10 = [v9 clientLocation];
    id v11 = [v10 mapKitHandle];
    char v12 = [v6 isEqualToData:v11];
  }
  else
  {
    id v8 = [v9 structuredLocationWithoutPrediction];
    id v10 = [v8 mapKitHandle];
    char v12 = [v6 isEqualToData:v10];
  }

  if ((v12 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_3:
  if (*(void *)(a1 + 56))
  {
    uint64_t v5 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_2_24_cold_2((uint64_t *)(a1 + 56), v5);
    }
    [(id)geocodeEventIfNeeded__s_lastGeocodeDateForEvent removeObjectForKey:*(void *)(a1 + 64)];
    [(id)geocodeEventIfNeeded__s_lastGeocodedStringForEvent removeObjectForKey:*(void *)(a1 + 64)];
    return;
  }
  uint64_t v13 = *(void *)(a1 + 72);
  if (!v13)
  {
    char v20 = EKLogHandle;
    if (!os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v23 = 0;
    id v21 = "Geocoding finished but the location string was not geocodable.";
    v22 = (uint8_t *)&v23;
LABEL_18:
    _os_log_impl(&dword_1A4E47000, v20, OS_LOG_TYPE_DEFAULT, v21, v22, 2u);
    return;
  }
  id v14 = *(void **)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 80);
  id v25 = 0;
  int v16 = [v14 updateWithGeocodedMapItemAndSaveWithCommit:v13 eventStore:v15 error:&v25];
  id v17 = v25;
  id v18 = v17;
  id v19 = EKLogHandle;
  if (!v16 || v17)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_2_24_cold_1((uint64_t)v18, v19);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E47000, v19, OS_LOG_TYPE_DEFAULT, "Geocoding finished and event was updated.", buf, 2u);
  }
}

uint64_t __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)mapsURLForLocation:(os_log_t)log onEvent:hasMapItemLaunchOptionFromTimeToLeaveNotification:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "'nil' 'event' provided.  Will not generate URL for an event location.", v1, 2u);
}

+ (void)mapsURLForLocation:(os_log_t)log onEvent:hasMapItemLaunchOptionFromTimeToLeaveNotification:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Error: Could not weak link MapKit string constant symbol '_MKLaunchOptionsFromTimeToLeaveNotificationKey'. Cannot add '_MKLaunchOptionsFromTimeToLeaveNotificationKey' map item URL option as a result.", v1, 2u);
}

void __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_2_24_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Failed to save geocoded event: [%@]", (uint8_t *)&v2, 0xCu);
}

void __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_2_24_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Geocoding finished with an error: [%@]", (uint8_t *)&v3, 0xCu);
}

@end