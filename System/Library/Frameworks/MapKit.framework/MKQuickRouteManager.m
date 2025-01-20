@interface MKQuickRouteManager
@end

@implementation MKQuickRouteManager

void __33___MKQuickRouteManager_updateETA__block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[3];
  [v4 originCoordinate];
  double v8 = v6;
  double v9 = v7;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v5 == a2 && !*(unsigned char *)(v10 + 56))
  {
    if (!objc_msgSend(*(id *)(v10 + 8), "shouldUpdateEstimatedTravelTimeForNewOrigin:", v6, v7)) {
      return;
    }
    uint64_t v10 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v10 + 56) = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  BOOL v57 = 0;
  v11 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v11)
  {
    [v11 travelTime];
    BOOL v13 = v12 < 0.0 || v5 != a2;
  }
  else
  {
    BOOL v13 = 1;
  }
  BOOL v57 = v13;
  [*(id *)(*(void *)(a1 + 32) + 8) expireETAsIfNoLongerValid];
  if ([*(id *)(a1 + 32) haveETAsForPreferredTransportType:a2]
    && ([*(id *)(a1 + 32) bestETAForPreferredDirectionsType:a2],
        (v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v14);
    *(void *)(*(void *)(a1 + 32) + 24) = a2;
    v15 = [*(id *)(a1 + 32) view];
    [v15 quickRouteManager:*(void *)(a1 + 32) didUpdateETA:*(void *)(*(void *)(a1 + 32) + 16) error:*(void *)(*(void *)(a1 + 32) + 32) animated:*((unsigned __int8 *)v55 + 24)];
  }
  else
  {
    v14 = +[_MKRouteETA routeETAWithDistance:a2 travelTime:-1.0 transportType:-1.0];
    int v16 = [*(id *)(a1 + 32) isUsingCurrentLocationForOrigin];
    BOOL v17 = v9 >= -180.0;
    if (v9 > 180.0) {
      BOOL v17 = 0;
    }
    if (v8 < -90.0) {
      BOOL v17 = 0;
    }
    BOOL v18 = v8 <= 90.0 && v17;
    [*(id *)(a1 + 32) destinationCoordinate];
    BOOL v21 = v20 >= -180.0;
    if (v20 > 180.0) {
      BOOL v21 = 0;
    }
    if (v19 < -90.0) {
      BOOL v21 = 0;
    }
    BOOL v22 = v19 <= 90.0 && v21;
    if (v18 && v22)
    {
      GEOCalculateDistance();
      double v24 = v23;
      [*(id *)(a1 + 32) _maxDistanceToRequestETA];
      BOOL v26 = v24 > v25 && v25 > 0.0;
      if ([*(id *)(a1 + 32) _transportTypeShouldBeSmart]) {
        objc_msgSend(v14, "setTransportType:", objc_msgSend(*(id *)(a1 + 32), "guessTransportTypeForDistance:preferredDirectionsType:", a2, v24));
      }
    }
    else
    {
      BOOL v26 = 0;
    }
    v15 = [*(id *)(a1 + 32) mapItem];
    v27 = [*(id *)(a1 + 32) originMapItem];
    int v28 = [v27 isEqual:v15];
    if (v15) {
      BOOL v29 = v22;
    }
    else {
      BOOL v29 = 0;
    }
    if (v29)
    {
      int v30 = v16 & !v18 | v26 | v28;
      uint64_t v31 = *(void *)(a1 + 32);
      if (v30 == 1)
      {
        v32 = [(id)v31 view];
        [v32 quickRouteManager:*(void *)(a1 + 32) didUpdateETA:v14 error:0 animated:0];
      }
      else
      {
        if (*(void *)(v31 + 16))
        {
          if (v5 == a2)
          {
            [*(id *)(v31 + 16) setTravelTime:-1.0];
            v34 = [*(id *)(a1 + 32) view];
            [v34 quickRouteManager:*(void *)(a1 + 32) didUpdateETA:*(void *)(*(void *)(a1 + 32) + 16) error:0 animated:0];
          }
          else
          {
            v34 = [(id)v31 view];
            [v34 quickRouteManager:*(void *)(a1 + 32) didUpdateETA:v14 error:0 animated:0];
          }

          *((unsigned char *)v55 + 24) = 1;
          uint64_t v31 = *(void *)(a1 + 32);
        }
        uint64_t v48 = 0;
        v49 = &v48;
        uint64_t v50 = 0x2020000000;
        char v51 = 0;
        *(void *)(v31 + 24) = a2;
        v35 = *(void **)(a1 + 32);
        uint64_t v39 = MEMORY[0x1E4F143A8];
        uint64_t v40 = 3221225472;
        v41 = __33___MKQuickRouteManager_updateETA__block_invoke_3;
        v42 = &unk_1E54BC538;
        v43 = v35;
        uint64_t v47 = a2;
        id v36 = v14;
        id v44 = v36;
        v45 = &v54;
        v46 = &v48;
        [v35 requestNewETAForPreferredTransportType:a2 completion:&v39];
        if (!*((unsigned char *)v49 + 24))
        {
          v37 = *(void **)(a1 + 32);
          if (!v37[2])
          {
            v38 = objc_msgSend(v37, "view", v39, v40, v41, v42, v43);
            [v38 quickRouteManager:*(void *)(a1 + 32) didUpdateETA:v36 error:0 animated:0];
          }
        }

        _Block_object_dispose(&v48, 8);
      }
    }
    else
    {
      dispatch_time_t v33 = dispatch_time(0, 150000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __33___MKQuickRouteManager_updateETA__block_invoke_2;
      block[3] = &unk_1E54B8248;
      block[4] = *(void *)(a1 + 32);
      id v53 = v14;
      dispatch_after(v33, MEMORY[0x1E4F14428], block);
    }
  }

  _Block_object_dispose(&v54, 8);
}

void __33___MKQuickRouteManager_updateETA__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) mapItem];

  if (!v2)
  {
    id v3 = [*(id *)(a1 + 32) view];
    [v3 quickRouteManager:*(void *)(a1 + 32) didUpdateETA:*(void *)(a1 + 40) error:0 animated:0];
  }
}

void __33___MKQuickRouteManager_updateETA__block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6
    || ([*(id *)(a1 + 32) bestETAForPreferredDirectionsType:*(void *)(a1 + 64)],
        (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v3 = *(id *)(a1 + 40);
  }
  else
  {
    id v3 = v4;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v4);
  }
  uint64_t v5 = [*(id *)(a1 + 32) view];
  [v5 quickRouteManager:*(void *)(a1 + 32) didUpdateETA:v3 error:v6 animated:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

void __74___MKQuickRouteManager_requestNewETAForPreferredTransportType_completion___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (!a3)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v8 = objc_msgSend(v5, "_sortedETAs", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = 0;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v14 status])
          {
            unsigned int v15 = [v14 transportType];
            if (v15 > 5) {
              uint64_t v16 = 1;
            }
            else {
              uint64_t v16 = qword_18BD1B718[v15];
            }
            v11 |= v16 == a1[6];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }
    else
    {
      char v11 = 0;
    }

    BOOL v17 = [*(id *)(a1[4] + 8) etaResults];
    BOOL v18 = [NSNumber numberWithUnsignedInteger:a1[6]];
    double v19 = [v17 objectForKeyedSubscript:v18];
    if (!v19 && (v11 & 1) == 0)
    {
      if ([v6 transportType] == a1[6])
      {
        [v6 expectedTravelTime];
        double v21 = v20;

        if (v21 <= 0.0)
        {
LABEL_24:
          double v7 = *(void (**)(void))(a1[5] + 16);
          goto LABEL_25;
        }
        [v6 distance];
        double v23 = v22;
        [v6 expectedTravelTime];
        BOOL v17 = +[_MKRouteETA routeETAWithDistance:a1[6] travelTime:v23 transportType:v24];
        BOOL v18 = [*(id *)(a1[4] + 8) etaResults];
        double v19 = [NSNumber numberWithUnsignedInteger:a1[6]];
        [v18 setObject:v17 forKeyedSubscript:v19];
      }
      else
      {
        double v19 = 0;
      }
    }

    goto LABEL_24;
  }
  double v7 = *(void (**)(void))(a1[5] + 16);
LABEL_25:
  v7();
}

@end