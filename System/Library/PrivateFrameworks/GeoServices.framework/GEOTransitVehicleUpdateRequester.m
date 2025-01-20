@interface GEOTransitVehicleUpdateRequester
+ (id)sharedInstance;
- (NSHashTable)updaters;
- (NSMutableSet)processedTripIds;
- (id)_tripIdsForUpdaters:(id)a3 filteredTripIDs:(BOOL *)a4;
- (id)initPrivate;
- (void)_cancelRequestIfNeeded;
- (void)_cancelUpdateTimer;
- (void)_handleMapItems:(id)a3 error:(id)a4 forTripIDs:(id)a5;
- (void)_processTripIds;
- (void)_purgeAllObjects;
- (void)_removeTripIdsIfApplicable:(id)a3;
- (void)_scheduleUpdateTimerWithInterval:(double)a3;
- (void)_sendRequestForTripIds:(id)a3;
- (void)mockProcessedIds:(id)a3;
- (void)registerVehicleUpdater:(id)a3;
- (void)unregisterVehicleUpdater:(id)a3;
@end

@implementation GEOTransitVehicleUpdateRequester

- (void)_sendRequestForTripIds:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  if ([v23 count])
  {
    os_unfair_lock_lock(&self->_updatersLock);
    val = self;
    v4 = [(NSHashTable *)self->_updaters allObjects];
    os_unfair_lock_unlock(&self->_updatersLock);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v30 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ([v9 isActive])
          {
            v10 = [v9 delegate];
            char v11 = objc_opt_respondsToSelector();

            if (v11)
            {
              id v12 = objc_alloc(MEMORY[0x1E4F1CA80]);
              v13 = [v9 tripIDs];
              v14 = (void *)[v12 initWithSet:v13];

              [v14 intersectSet:v23];
              if ([v14 count])
              {
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __59__GEOTransitVehicleUpdateRequester__sendRequestForTripIds___block_invoke;
                block[3] = &unk_1E53D8998;
                block[4] = v9;
                id v28 = v14;
                dispatch_async(MEMORY[0x1E4F14428], block);
              }
            }
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v6);
    }

    v15 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v34 = v23;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_INFO, "Sending request for tripIDs %{private}@", buf, 0xCu);
    }

    os_unfair_lock_lock(&val->_inflightTripIdsLock);
    [(NSMutableSet *)val->_inflightTripIds unionSet:v23];
    os_unfair_lock_unlock(&val->_inflightTripIdsLock);
    v16 = +[GEOMapService sharedService];
    v17 = [v23 allObjects];
    v18 = [v16 defaultTraits];
    uint64_t v19 = [v16 ticketForTransitTripIdentifiers:v17 traits:v18];
    ticket = val->_ticket;
    val->_ticket = (GEOMapServiceTicket *)v19;

    objc_initWeak((id *)buf, val);
    v21 = val->_ticket;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __59__GEOTransitVehicleUpdateRequester__sendRequestForTripIds___block_invoke_15;
    v24[3] = &unk_1E53DA328;
    objc_copyWeak(&v26, (id *)buf);
    id v25 = v23;
    [(GEOMapServiceTicket *)v21 submitWithHandler:v24 networkActivity:0];

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "No tripIDs to request", buf, 2u);
    }
  }
}

+ (id)sharedInstance
{
  if (qword_1EB29F5A8 != -1) {
    dispatch_once(&qword_1EB29F5A8, &__block_literal_global_13);
  }
  v2 = (void *)_MergedGlobals_187;

  return v2;
}

- (void)registerVehicleUpdater:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 138477827;
      id v7 = v4;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "registering Updater %{private}@", (uint8_t *)&v6, 0xCu);
    }

    [(GEOTransitVehicleUpdateRequester *)self _cancelRequestIfNeeded];
    os_unfair_lock_lock(&self->_updatersLock);
    [(NSHashTable *)self->_updaters addObject:v4];
    os_unfair_lock_unlock(&self->_updatersLock);
    if ([v4 isActive]) {
      [(GEOTransitVehicleUpdateRequester *)self _processTripIds];
    }
  }
}

- (id)initPrivate
{
  v12.receiver = self;
  v12.super_class = (Class)GEOTransitVehicleUpdateRequester;
  v2 = [(GEOTransitVehicleUpdateRequester *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_updatersLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    updaters = v3->_updaters;
    v3->_updaters = (NSHashTable *)v4;

    v3->_processedTripIdsLock._os_unfair_lock_opaque = 0;
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:5];
    processedTripIds = v3->_processedTripIds;
    v3->_processedTripIds = (NSMutableSet *)v6;

    v3->_inflightTripIdsLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:5];
    inflightTripIds = v3->_inflightTripIds;
    v3->_inflightTripIds = (NSMutableSet *)v8;

    v3->_requestInterval = 15.0;
    *(_OWORD *)&v3->_maxRetries = xmmword_18A62D260;
    v10 = v3;
  }

  return v3;
}

- (void)_handleMapItems:(id)a3 error:(id)a4 forTripIDs:(id)a5
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock(&self->_updatersLock);
  char v11 = [(NSHashTable *)self->_updaters allObjects];
  os_unfair_lock_unlock(&self->_updatersLock);
  os_unfair_lock_lock(&self->_inflightTripIdsLock);
  [(NSMutableSet *)self->_inflightTripIds minusSet:v10];
  os_unfair_lock_unlock(&self->_inflightTripIdsLock);
  id v92 = v10;
  id v84 = v8;
  v85 = v11;
  v86 = v9;
  v83 = self;
  if (v9)
  {
    objc_super v12 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412547;
      uint64_t v125 = (uint64_t)v9;
      __int16 v126 = 2113;
      uint64_t v127 = (uint64_t)v10;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "Error %@ for requested tripIDs %{private}@", buf, 0x16u);
    }

    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v118 objects:v132 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v119;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v119 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v118 + 1) + 8 * i);
          if ([v18 isActive])
          {
            uint64_t v19 = [v18 delegate];
            char v20 = objc_opt_respondsToSelector();

            if (v20)
            {
              id v21 = objc_alloc(MEMORY[0x1E4F1CA80]);
              v22 = [v18 tripIDs];
              id v23 = (void *)[v21 initWithSet:v22];

              [v23 intersectSet:v92];
              if ([v23 count])
              {
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __69__GEOTransitVehicleUpdateRequester__handleMapItems_error_forTripIDs___block_invoke;
                block[3] = &unk_1E53D99F0;
                block[4] = v18;
                id v116 = v23;
                id v117 = v86;
                dispatch_async(MEMORY[0x1E4F14428], block);
              }
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v118 objects:v132 count:16];
      }
      while (v15);
    }

    v24 = v86;
    id v25 = [v86 domain];
    id v26 = GEOErrorDomain();
    if ([v25 isEqualToString:v26])
    {
      v27 = v84;
      if ([v86 code] == -8)
      {

        id v28 = v92;
      }
      else
      {
        uint64_t v68 = [v86 code];

        BOOL v69 = v68 == -11;
        id v28 = v92;
        if (!v69) {
          goto LABEL_83;
        }
      }
      unint64_t maxRetries = v83->_maxRetries;
      unint64_t v71 = v83->_numRetries + 1;
      v83->_numRetries = v71;
      if (v71 <= maxRetries)
      {
        [(GEOTransitVehicleUpdateRequester *)v83 _scheduleUpdateTimerWithInterval:v83->_requestInterval];
        goto LABEL_83;
      }
      v83->_numRetries = 0;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      id v72 = v13;
      uint64_t v73 = [v72 countByEnumeratingWithState:&v111 objects:v131 count:16];
      if (v73)
      {
        uint64_t v74 = v73;
        uint64_t v75 = *(void *)v112;
        do
        {
          for (uint64_t j = 0; j != v74; ++j)
          {
            if (*(void *)v112 != v75) {
              objc_enumerationMutation(v72);
            }
            v77 = *(void **)(*((void *)&v111 + 1) + 8 * j);
            if ([v77 isActive])
            {
              v78 = [v77 delegate];
              char v79 = objc_opt_respondsToSelector();

              if (v79)
              {
                id v80 = objc_alloc(MEMORY[0x1E4F1CA80]);
                v81 = [v77 tripIDs];
                v82 = (void *)[v80 initWithSet:v81];

                [v82 intersectSet:v92];
                if ([v82 count])
                {
                  v109[0] = MEMORY[0x1E4F143A8];
                  v109[1] = 3221225472;
                  v109[2] = __69__GEOTransitVehicleUpdateRequester__handleMapItems_error_forTripIDs___block_invoke_2;
                  v109[3] = &unk_1E53D8998;
                  v109[4] = v77;
                  id v110 = v82;
                  dispatch_async(MEMORY[0x1E4F14428], v109);
                }
              }
            }
          }
          uint64_t v74 = [v72 countByEnumeratingWithState:&v111 objects:v131 count:16];
        }
        while (v74);
      }

      v27 = v84;
      v24 = v86;
    }
    else
    {

      v27 = v84;
    }
    id v28 = v92;
  }
  else
  {
    self->_numRetries = 0;
    os_unfair_lock_lock(&self->_processedTripIdsLock);
    [(NSMutableSet *)self->_processedTripIds unionSet:v10];
    os_unfair_lock_unlock(&self->_processedTripIdsLock);
    v93 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v29 = v8;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v105 objects:v130 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v106;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v106 != v32) {
            objc_enumerationMutation(v29);
          }
          id v34 = [*(id *)(*((void *)&v105 + 1) + 8 * k) _transitVehiclePosition];
          if (v34)
          {
            v35 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              uint64_t v36 = GEOTransitVehiclePositionDescription(v34);
              uint64_t v37 = [v34 tripID];
              *(_DWORD *)buf = 138412547;
              uint64_t v125 = (uint64_t)v36;
              __int16 v126 = 2049;
              uint64_t v127 = v37;
              _os_log_impl(&dword_188D96000, v35, OS_LOG_TYPE_INFO, "Received %@ for tripID %{private}lu", buf, 0x16u);
            }
            [v93 addObject:v34];
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v105 objects:v130 count:16];
      }
      while (v31);
    }

    uint64_t v38 = [v93 count];
    id v28 = v10;
    if (v38 != [v10 count])
    {
      v39 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v40 = [v93 count];
        uint64_t v41 = [v10 count];
        *(_DWORD *)buf = 134218499;
        uint64_t v125 = v40;
        __int16 v126 = 2048;
        uint64_t v127 = v41;
        __int16 v128 = 2113;
        id v129 = v10;
        _os_log_impl(&dword_188D96000, v39, OS_LOG_TYPE_DEBUG, "Received %lu/%lu positions from requested tripIDs %{private}@", buf, 0x20u);
      }
    }
    long long v103 = 0u;
    long long v104 = 0u;
    long long v102 = 0u;
    long long v101 = 0u;
    obuint64_t j = v85;
    uint64_t v42 = [obj countByEnumeratingWithState:&v101 objects:v123 count:16];
    unint64_t v43 = 0x1E4F1C000uLL;
    if (v42)
    {
      uint64_t v44 = v42;
      uint64_t v45 = *(void *)v102;
      uint64_t v87 = *(void *)v102;
      do
      {
        uint64_t v46 = 0;
        uint64_t v88 = v44;
        do
        {
          if (*(void *)v102 != v45) {
            objc_enumerationMutation(obj);
          }
          v47 = *(void **)(*((void *)&v101 + 1) + 8 * v46);
          if ([v47 isActive])
          {
            id v48 = objc_alloc(*(Class *)(v43 + 2688));
            v49 = [v47 tripIDs];
            v50 = (void *)[v48 initWithSet:v49];

            [v50 intersectSet:v28];
            if ([v50 count])
            {
              v90 = v47;
              uint64_t v91 = v46;
              v51 = objc_msgSend(objc_alloc(*(Class *)(v43 + 2688)), "initWithCapacity:", objc_msgSend(v93, "count"));
              long long v97 = 0u;
              long long v98 = 0u;
              long long v99 = 0u;
              long long v100 = 0u;
              id v52 = v93;
              uint64_t v53 = [v52 countByEnumeratingWithState:&v97 objects:v122 count:16];
              if (v53)
              {
                uint64_t v54 = v53;
                uint64_t v55 = *(void *)v98;
                do
                {
                  for (uint64_t m = 0; m != v54; ++m)
                  {
                    if (*(void *)v98 != v55) {
                      objc_enumerationMutation(v52);
                    }
                    v57 = *(void **)(*((void *)&v97 + 1) + 8 * m);
                    v58 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v57, "tripID"));
                    int v59 = [v50 containsObject:v58];

                    if (v59) {
                      [v51 addObject:v57];
                    }
                  }
                  uint64_t v54 = [v52 countByEnumeratingWithState:&v97 objects:v122 count:16];
                }
                while (v54);
              }

              uint64_t v60 = [v51 count];
              v61 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
              BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG);
              if (v60)
              {
                uint64_t v45 = v87;
                if (v62)
                {
                  v63 = [v90 delegate];
                  uint64_t v64 = [v52 count];
                  v65 = [v52 valueForKey:@"tripID"];
                  *(_DWORD *)buf = 138412802;
                  uint64_t v125 = (uint64_t)v63;
                  __int16 v126 = 2048;
                  uint64_t v127 = v64;
                  __int16 v128 = 2112;
                  id v129 = v65;
                  _os_log_impl(&dword_188D96000, v61, OS_LOG_TYPE_DEBUG, "Sending %@ %lu positions, tripIDs:%@", buf, 0x20u);
                }
                v94[0] = MEMORY[0x1E4F143A8];
                v94[1] = 3221225472;
                v94[2] = __69__GEOTransitVehicleUpdateRequester__handleMapItems_error_forTripIDs___block_invoke_23;
                v94[3] = &unk_1E53D99F0;
                v94[4] = v90;
                v51 = v51;
                v95 = v51;
                id v96 = v50;
                dispatch_async(MEMORY[0x1E4F14428], v94);

                id v28 = v92;
                unint64_t v43 = 0x1E4F1C000;
                uint64_t v44 = v88;
              }
              else
              {
                unint64_t v43 = 0x1E4F1C000;
                uint64_t v45 = v87;
                uint64_t v44 = v88;
                if (v62)
                {
                  v67 = [v90 delegate];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v125 = (uint64_t)v67;
                  _os_log_impl(&dword_188D96000, v61, OS_LOG_TYPE_DEBUG, "%@ wants different tripIDs than we just received", buf, 0xCu);
                }
                id v28 = v92;
              }
              uint64_t v46 = v91;
            }
            else
            {
              v51 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                v66 = [v47 delegate];
                *(_DWORD *)buf = 138412290;
                uint64_t v125 = (uint64_t)v66;
                _os_log_impl(&dword_188D96000, v51, OS_LOG_TYPE_DEBUG, "%@ did not request any of these tripIDs", buf, 0xCu);
              }
            }
          }
          ++v46;
        }
        while (v46 != v44);
        uint64_t v44 = [obj countByEnumeratingWithState:&v101 objects:v123 count:16];
      }
      while (v44);
    }

    [(GEOTransitVehicleUpdateRequester *)v83 _scheduleUpdateTimerWithInterval:v83->_requestInterval];
    v27 = v84;
    v24 = 0;
  }
LABEL_83:
}

- (id)_tripIdsForUpdaters:(id)a3 filteredTripIDs:(BOOL *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    id v21 = a4;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v22 = v5;
    obuint64_t j = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      BOOL v24 = 0;
      uint64_t v9 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(obj);
          }
          char v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          objc_super v12 = objc_msgSend(v11, "tripIDs", v21);
          uint64_t v13 = [v12 count];
          if ([v12 count]
            && ([v11 delegate],
                uint64_t v14 = objc_claimAutoreleasedReturnValue(),
                char v15 = objc_opt_respondsToSelector(),
                v14,
                (v15 & 1) != 0))
          {
            uint64_t v16 = [v11 delegate];
            v17 = [v16 transitVehicleUpdater:v11 shouldUpdateVehiclePositionsForTripIDs:v12];

            BOOL v18 = v24 || v13 != [v17 count];
            BOOL v24 = v18;
            uint64_t v19 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138478083;
              uint64_t v30 = v17;
              __int16 v31 = 2112;
              uint64_t v32 = v11;
              _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_INFO, "Validated tripIDs %{private}@ for %@", buf, 0x16u);
            }
          }
          else
          {
            v17 = v12;
          }
          [v6 unionSet:v17];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v8);
    }
    else
    {
      BOOL v24 = 0;
    }

    if (v21) {
      BOOL *v21 = v24;
    }
    id v5 = v22;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v6;
}

- (void)_scheduleUpdateTimerWithInterval:(double)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
      *(_DWORD *)buf = 134218242;
      double v14 = a3;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "Scheduling update in %#.1lfs at %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    [(NSTimer *)self->_updateTimer invalidate];
    uint64_t v7 = (void *)MEMORY[0x1E4F1CB00];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__GEOTransitVehicleUpdateRequester__scheduleUpdateTimerWithInterval___block_invoke_7;
    v10[3] = &unk_1E53DA300;
    objc_copyWeak(&v11, (id *)buf);
    uint64_t v8 = [v7 scheduledTimerWithTimeInterval:0 repeats:v10 block:a3];
    updateTimer = self->_updateTimer;
    self->_updateTimer = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__GEOTransitVehicleUpdateRequester__scheduleUpdateTimerWithInterval___block_invoke;
    block[3] = &unk_1E53D79B0;
    block[4] = self;
    *(double *)&void block[5] = a3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)_cancelUpdateTimer
{
  if (self->_updateTimer)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Cancelling scheduled update", v5, 2u);
    }

    [(NSTimer *)self->_updateTimer invalidate];
    updateTimer = self->_updateTimer;
    self->_updateTimer = 0;
  }
}

void __50__GEOTransitVehicleUpdateRequester_sharedInstance__block_invoke()
{
  id v0 = [[GEOTransitVehicleUpdateRequester alloc] initPrivate];
  v1 = (void *)_MergedGlobals_187;
  _MergedGlobals_187 = (uint64_t)v0;
}

- (void)_purgeAllObjects
{
  [(GEOTransitVehicleUpdateRequester *)self _cancelRequestIfNeeded];
  [(GEOTransitVehicleUpdateRequester *)self _cancelUpdateTimer];
  os_unfair_lock_lock(&self->_updatersLock);
  [(NSHashTable *)self->_updaters removeAllObjects];
  os_unfair_lock_unlock(&self->_updatersLock);
  os_unfair_lock_lock(&self->_processedTripIdsLock);
  [(NSMutableSet *)self->_processedTripIds removeAllObjects];
  os_unfair_lock_unlock(&self->_processedTripIdsLock);
  os_unfair_lock_lock(&self->_inflightTripIdsLock);
  [(NSMutableSet *)self->_inflightTripIds removeAllObjects];

  os_unfair_lock_unlock(&self->_inflightTripIdsLock);
}

- (void)_cancelRequestIfNeeded
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_ticket;
  ticket = v2->_ticket;
  v2->_ticket = 0;

  objc_sync_exit(v2);
  if (v3)
  {
    os_unfair_lock_lock(&v2->_inflightTripIdsLock);
    id v5 = (void *)[(NSMutableSet *)v2->_inflightTripIds copy];
    [(NSMutableSet *)v2->_inflightTripIds removeAllObjects];
    os_unfair_lock_unlock(&v2->_inflightTripIdsLock);
    id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138477827;
      uint64_t v8 = v5;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "cancelling ticket for inflight tripIDs %{private}@", (uint8_t *)&v7, 0xCu);
    }

    [(GEOMapServiceTicket *)v3 cancel];
  }
}

- (void)unregisterVehicleUpdater:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138477827;
      id v8 = v4;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "unregistering Updater %{private}@", (uint8_t *)&v7, 0xCu);
    }

    id v6 = [v4 tripIDs];
    [(GEOTransitVehicleUpdateRequester *)self _removeTripIdsIfApplicable:v6];

    os_unfair_lock_lock(&self->_updatersLock);
    [(NSHashTable *)self->_updaters removeObject:v4];
    os_unfair_lock_unlock(&self->_updatersLock);
  }
}

uint64_t __69__GEOTransitVehicleUpdateRequester__scheduleUpdateTimerWithInterval___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleUpdateTimerWithInterval:*(double *)(a1 + 40)];
}

void __69__GEOTransitVehicleUpdateRequester__scheduleUpdateTimerWithInterval___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Performing scheduled update", v4, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 6);
    [*((id *)WeakRetained + 4) removeAllObjects];
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
    v3 = (void *)*((void *)WeakRetained + 8);
    *((void *)WeakRetained + 8) = 0;

    [WeakRetained _processTripIds];
  }
}

- (void)_processTripIds
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Processing current requested tripIDs", buf, 2u);
  }

  char v10 = 0;
  os_unfair_lock_lock(&self->_updatersLock);
  id v4 = [(NSHashTable *)self->_updaters allObjects];
  id v5 = [(GEOTransitVehicleUpdateRequester *)self _tripIdsForUpdaters:v4 filteredTripIDs:&v10];

  os_unfair_lock_unlock(&self->_updatersLock);
  id v6 = [MEMORY[0x1E4F1CA80] setWithSet:v5];
  os_unfair_lock_lock(&self->_processedTripIdsLock);
  uint64_t v7 = [(NSMutableSet *)self->_processedTripIds count];
  [v6 minusSet:self->_processedTripIds];
  os_unfair_lock_unlock(&self->_processedTripIdsLock);
  os_unfair_lock_lock(&self->_inflightTripIdsLock);
  uint64_t v8 = [(NSMutableSet *)self->_inflightTripIds count];
  [v6 minusSet:self->_inflightTripIds];
  os_unfair_lock_unlock(&self->_inflightTripIdsLock);
  if ([v6 count])
  {
    [(GEOTransitVehicleUpdateRequester *)self _cancelUpdateTimer];
    [(GEOTransitVehicleUpdateRequester *)self _sendRequestForTripIds:v6];
  }
  else
  {
    uint64_t v9 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v12 = v8;
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_INFO, "No tripIDs to process (%lu in-flight, %lu processed)", buf, 0x16u);
    }

    if (v10) {
      [(GEOTransitVehicleUpdateRequester *)self _scheduleUpdateTimerWithInterval:self->_requestInterval];
    }
  }
}

void __59__GEOTransitVehicleUpdateRequester__sendRequestForTripIds___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transitVehicleUpdater:*(void *)(a1 + 32) willUpdateVehiclePositionsForTripIDs:*(void *)(a1 + 40)];
}

void __59__GEOTransitVehicleUpdateRequester__sendRequestForTripIds___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = WeakRetained;
    objc_sync_enter(v8);
    uint64_t v9 = (void *)v8[7];
    v8[7] = 0;

    objc_sync_exit(v8);
    [v8 _handleMapItems:v10 error:v5 forTripIDs:*(void *)(a1 + 32)];
  }
}

void __69__GEOTransitVehicleUpdateRequester__handleMapItems_error_forTripIDs___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transitVehicleUpdater:*(void *)(a1 + 32) didFailUpdateForTripIDs:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

void __69__GEOTransitVehicleUpdateRequester__handleMapItems_error_forTripIDs___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transitVehicleUpdater:*(void *)(a1 + 32) didTimeoutUpdateForTripIDs:*(void *)(a1 + 40)];
}

void __69__GEOTransitVehicleUpdateRequester__handleMapItems_error_forTripIDs___block_invoke_23(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transitVehicleUpdater:*(void *)(a1 + 32) didUpdateVehiclePositions:*(void *)(a1 + 40) forTripIDs:*(void *)(a1 + 48)];
}

- (void)_removeTripIdsIfApplicable:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    os_unfair_lock_lock(&self->_updatersLock);
    id v5 = [(NSHashTable *)self->_updaters allObjects];
    os_unfair_lock_unlock(&self->_updatersLock);
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v4];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v30;
      id v23 = self;
      uint64_t v24 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          __int16 v13 = objc_msgSend(v12, "tripIDs", v23);
          char v14 = [v13 isEqualToSet:v4];

          if ((v14 & 1) == 0)
          {
            uint64_t v15 = [v12 tripIDs];
            uint64_t v16 = [v15 allObjects];

            long long v27 = 0u;
            long long v28 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            id v17 = v16;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v26;
              while (2)
              {
                for (uint64_t j = 0; j != v19; ++j)
                {
                  if (*(void *)v26 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * j);
                  if ([v6 containsObject:v22])
                  {
                    [v6 removeObject:v22];
                    if (![v6 count])
                    {

                      goto LABEL_22;
                    }
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
                if (v19) {
                  continue;
                }
                break;
              }
            }

            uint64_t v10 = v24;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        self = v23;
      }
      while (v9);
    }

    os_unfair_lock_lock(&self->_processedTripIdsLock);
    [(NSMutableSet *)self->_processedTripIds minusSet:v6];
    os_unfair_lock_unlock(&self->_processedTripIdsLock);
LABEL_22:
  }
}

- (NSHashTable)updaters
{
  return self->_updaters;
}

- (NSMutableSet)processedTripIds
{
  return self->_processedTripIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_inflightTripIds, 0);
  objc_storeStrong((id *)&self->_processedTripIds, 0);

  objc_storeStrong((id *)&self->_updaters, 0);
}

- (void)mockProcessedIds:(id)a3
{
}

@end