@interface MKTransitMapItemUpdater
- (BOOL)_isInfoExpiredRelativeToDate:(id)a3;
- (BOOL)isRefreshing;
- (BOOL)isStuckWithExpiredInfoRelativeToDate:(id)a3;
- (BOOL)lastInfoRefreshFailed;
- (MKMapItem)mapItem;
- (MKTransitMapItemUpdater)initWithMapItem:(id)a3 delegate:(id)a4;
- (NSDate)suggestedDataRefreshDate;
- (NSTimer)dataRefreshTimer;
- (void)_processUpdatedMapItems:(id)a3 identifier:(id)a4 ttl:(double)a5 error:(id)a6;
- (void)_refreshTransitInfoIfNeeded;
- (void)_resumeDataRefreshTimer;
- (void)_scheduleDataUpdateForTransitItemAtDate:(id)a3;
- (void)_suspendDataRefreshTimer;
- (void)_transitInfoUpdated;
- (void)setActive:(BOOL)a3;
- (void)setDataRefreshTimer:(id)a3;
- (void)setLastInfoRefreshFailed:(BOOL)a3;
- (void)setRefreshing:(BOOL)a3;
- (void)setSuggestedDataRefreshDate:(id)a3;
@end

@implementation MKTransitMapItemUpdater

- (MKTransitMapItemUpdater)initWithMapItem:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKTransitMapItemUpdater;
  v8 = [(MKTransitItemReferenceDateUpdater *)&v11 initWithDelegate:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_mapItem, a3);
  }

  return v9;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)MKTransitMapItemUpdater;
  -[MKTransitItemReferenceDateUpdater setActive:](&v21, sel_setActive_);
  v5 = MKGetTransitItemUpdaterLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v6)
    {
      id v7 = [(MKTransitMapItemUpdater *)self mapItem];
      v8 = [v7 name];
      v9 = [(MKTransitMapItemUpdater *)self mapItem];
      v10 = [v9 _identifier];
      uint64_t v11 = [v10 muid];
      *(_DWORD *)buf = 138412546;
      v23 = v8;
      __int16 v24 = 2048;
      uint64_t v25 = v11;
      _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_DEBUG, "Activating updater for %@ <muid: %llu>", buf, 0x16u);
    }
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v13 = [(MKTransitMapItemUpdater *)self mapItem];
    [v12 addObserver:self selector:sel__transitInfoUpdated name:@"kMapItemTransitInfoDidUpdateNotification" object:v13];

    [(MKTransitMapItemUpdater *)self _resumeDataRefreshTimer];
  }
  else
  {
    if (v6)
    {
      v14 = [(MKTransitMapItemUpdater *)self mapItem];
      v15 = [v14 name];
      v16 = [(MKTransitMapItemUpdater *)self mapItem];
      v17 = [v16 _identifier];
      uint64_t v18 = [v17 muid];
      *(_DWORD *)buf = 138412546;
      v23 = v15;
      __int16 v24 = 2048;
      uint64_t v25 = v18;
      _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_DEBUG, "Deactivating updater for %@ <muid: %llu>", buf, 0x16u);
    }
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v20 = [(MKTransitMapItemUpdater *)self mapItem];
    [v19 removeObserver:self name:@"kMapItemTransitInfoDidUpdateNotification" object:v20];

    [(MKTransitMapItemUpdater *)self _suspendDataRefreshTimer];
  }
}

- (void)_resumeDataRefreshTimer
{
  BOOL v3 = [(MKTransitMapItemUpdater *)self suggestedDataRefreshDate];

  if (v3)
  {
    id v4 = [(MKTransitMapItemUpdater *)self suggestedDataRefreshDate];
    [(MKTransitMapItemUpdater *)self _scheduleDataUpdateForTransitItemAtDate:v4];
  }
  else
  {
    [(MKTransitMapItemUpdater *)self _refreshTransitInfoIfNeeded];
  }
}

- (void)_suspendDataRefreshTimer
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MKTransitMapItemUpdater *)self dataRefreshTimer];

  if (v3)
  {
    id v4 = MKGetTransitItemUpdaterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = [(MKTransitMapItemUpdater *)self mapItem];
      BOOL v6 = [v5 name];
      id v7 = [(MKTransitMapItemUpdater *)self mapItem];
      v8 = [v7 _identifier];
      uint64_t v9 = [v8 muid];
      v10 = [(MKTransitMapItemUpdater *)self dataRefreshTimer];
      uint64_t v11 = [v10 fireDate];
      int v13 = 138412802;
      v14 = v6;
      __int16 v15 = 2048;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_DEBUG, "Cancelling scheduled mapItem update for %@ <muid: %llu> at %@", (uint8_t *)&v13, 0x20u);
    }
    v12 = [(MKTransitMapItemUpdater *)self dataRefreshTimer];
    [v12 invalidate];

    [(MKTransitMapItemUpdater *)self setDataRefreshTimer:0];
  }
}

- (void)_scheduleDataUpdateForTransitItemAtDate:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MKTransitMapItemUpdater *)self setSuggestedDataRefreshDate:v4];
  if ([(MKTransitItemReferenceDateUpdater *)self isActive]
    && ([(MKTransitMapItemUpdater *)self suggestedDataRefreshDate],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    BOOL v6 = [(MKTransitMapItemUpdater *)self dataRefreshTimer];
    [v6 invalidate];

    [v4 timeIntervalSinceNow];
    double v8 = v7;
    uint64_t v9 = MKGetTransitItemUpdaterLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8 <= 0.0)
    {
      if (v10)
      {
        v27 = [(MKTransitMapItemUpdater *)self mapItem];
        v28 = [v27 name];
        v29 = [(MKTransitMapItemUpdater *)self mapItem];
        v30 = [v29 _identifier];
        *(_DWORD *)buf = 138412802;
        v34 = v28;
        __int16 v35 = 2048;
        uint64_t v36 = [v30 muid];
        __int16 v37 = 2112;
        v38 = (const char *)v4;
        _os_log_impl(&dword_18BAEC000, v9, OS_LOG_TYPE_DEBUG, "Performing immediate mapItem update for %@ <muid: %llu>, was scheduled for %@", buf, 0x20u);
      }
      [(MKTransitMapItemUpdater *)self _refreshTransitInfoIfNeeded];
    }
    else
    {
      if (v10)
      {
        uint64_t v11 = [(MKTransitMapItemUpdater *)self mapItem];
        v12 = [v11 name];
        int v13 = [(MKTransitMapItemUpdater *)self mapItem];
        v14 = [v13 _identifier];
        *(_DWORD *)buf = 138412802;
        v34 = v12;
        __int16 v35 = 2048;
        uint64_t v36 = [v14 muid];
        __int16 v37 = 2112;
        v38 = (const char *)v4;
        _os_log_impl(&dword_18BAEC000, v9, OS_LOG_TYPE_DEBUG, "Scheduling mapItem update for %@ <muid: %llu> at %@", buf, 0x20u);
      }
      objc_initWeak((id *)buf, self);
      __int16 v15 = (void *)MEMORY[0x1E4F1CB00];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __67__MKTransitMapItemUpdater__scheduleDataUpdateForTransitItemAtDate___block_invoke;
      v31[3] = &unk_1E54B9338;
      objc_copyWeak(&v32, (id *)buf);
      uint64_t v16 = [v15 scheduledTimerWithTimeInterval:0 repeats:v31 block:v8];
      [(MKTransitMapItemUpdater *)self setDataRefreshTimer:v16];

      __int16 v17 = [(MKTransitMapItemUpdater *)self suggestedDataRefreshDate];
      uint64_t v18 = [(MKTransitMapItemUpdater *)self dataRefreshTimer];
      [v18 setFireDate:v17];

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    uint64_t v19 = MKGetTransitItemUpdaterLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = [(MKTransitMapItemUpdater *)self mapItem];
      objc_super v21 = [v20 name];
      v22 = [(MKTransitMapItemUpdater *)self mapItem];
      v23 = [v22 _identifier];
      uint64_t v24 = [v23 muid];
      BOOL v25 = [(MKTransitItemReferenceDateUpdater *)self isActive];
      uint64_t v26 = "NO";
      *(_DWORD *)buf = 138413058;
      __int16 v35 = 2048;
      v34 = v21;
      if (v25) {
        uint64_t v26 = "YES";
      }
      uint64_t v36 = v24;
      __int16 v37 = 2080;
      v38 = v26;
      __int16 v39 = 2112;
      id v40 = v4;
      _os_log_impl(&dword_18BAEC000, v19, OS_LOG_TYPE_DEBUG, "Will not schedule mapItem update for %@ <muid: %llu> (isActive:%s, date:%@)", buf, 0x2Au);
    }
    [(MKTransitMapItemUpdater *)self _suspendDataRefreshTimer];
  }
}

void __67__MKTransitMapItemUpdater__scheduleDataUpdateForTransitItemAtDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshTransitInfoIfNeeded];
}

- (void)_refreshTransitInfoIfNeeded
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MKTransitMapItemUpdater *)self mapItem];

  if (v3)
  {
    id v4 = [(MKTransitItemReferenceDateUpdater *)self delegate];

    if (v4)
    {
      if (![(MKTransitMapItemUpdater *)self isRefreshing]
        && [(MKTransitItemReferenceDateUpdater *)self isActive])
      {
        v5 = [(MKTransitMapItemUpdater *)self dataRefreshTimer];
        [v5 invalidate];

        [(MKTransitMapItemUpdater *)self setDataRefreshTimer:0];
        BOOL v6 = [(MKTransitMapItemUpdater *)self mapItem];
        double v7 = [v6 _transitInfo];

        if (!v7)
        {
          v27 = MKGetTransitItemUpdaterLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18BAEC000, v27, OS_LOG_TYPE_ERROR, "Will not refresh item (transitInfo:NO)", buf, 2u);
          }

          [(MKTransitMapItemUpdater *)self setRefreshing:0];
          goto LABEL_50;
        }
        double v8 = [(MKTransitMapItemUpdater *)self mapItem];
        uint64_t v9 = [v8 _identifier];

        if (!v9)
        {
          BOOL v10 = MKGetTransitItemUpdaterLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18BAEC000, v10, OS_LOG_TYPE_DEBUG, "MapItem is missing an identifier. This is expected for Nearby Transit mapItems, but could indicate an error for other types.", buf, 2u);
          }
        }
        [v7 timeToLive];
        v12 = v11;
        int v13 = [(MKTransitMapItemUpdater *)self mapItem];
        v14 = [v13 _transitInfoUpdatedDate];

        if (*(double *)&v12 <= 0.0
          || v14
          && ([MEMORY[0x1E4F1C9C8] date],
              __int16 v15 = objc_claimAutoreleasedReturnValue(),
              [v15 timeIntervalSinceDate:v14],
              BOOL v17 = v16 < *(double *)&v12,
              v15,
              v17))
        {
          if (([v7 isTransitIncidentsTTLExpired] & 1) != 0
            || ([v7 hasTransitIncidentComponent] & 1) == 0)
          {
            v28 = MKGetTransitItemUpdaterLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              v29 = [(MKTransitMapItemUpdater *)self mapItem];
              v30 = [v29 name];
              uint64_t v31 = [v9 muid];
              int v32 = [v7 isTransitIncidentsTTLExpired];
              int v33 = [v7 hasTransitIncidentComponent];
              *(_DWORD *)buf = 138413058;
              v57 = v30;
              __int16 v58 = 2048;
              uint64_t v59 = v31;
              __int16 v60 = 1024;
              *(_DWORD *)v61 = v32;
              *(_WORD *)&v61[4] = 1024;
              *(_DWORD *)&v61[6] = v33;
              _os_log_impl(&dword_18BAEC000, v28, OS_LOG_TYPE_DEBUG, "MapItem %@ <muid: %llu> needs update: expired: %d, hasComponent: %d", buf, 0x22u);
            }
          }
          else
          {
            uint64_t v18 = [v7 lastFullScheduleValidDate];
            [v18 timeIntervalSinceNow];
            BOOL v20 = v19 > 300.0;

            if (v20)
            {
              int v21 = 0;
LABEL_40:
              __int16 v37 = [(MKTransitItemReferenceDateUpdater *)self delegate];
              v38 = [v37 ticketForTransitMapItemUpdater:self];

              if (v21)
              {
                if (v38)
                {
                  [(MKTransitMapItemUpdater *)self setRefreshing:1];
                  __int16 v39 = [(MKTransitItemReferenceDateUpdater *)self delegate];
                  id v40 = [(MKTransitMapItemUpdater *)self mapItem];
                  [v39 transitMapItemUpdater:self willUpdateMapItem:v40];

                  objc_initWeak((id *)buf, self);
                  v53[0] = MEMORY[0x1E4F143A8];
                  v53[1] = 3221225472;
                  v53[2] = __54__MKTransitMapItemUpdater__refreshTransitInfoIfNeeded__block_invoke;
                  v53[3] = &unk_1E54BF2D8;
                  objc_copyWeak(v55, (id *)buf);
                  id v54 = v9;
                  v55[1] = v12;
                  [v38 submitWithHandler:v53 networkActivity:0];

                  objc_destroyWeak(v55);
                  objc_destroyWeak((id *)buf);
                }
                else
                {
                  v42 = MKGetTransitItemUpdaterLog();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    v43 = [(MKTransitMapItemUpdater *)self mapItem];
                    v44 = [v43 name];
                    uint64_t v45 = [v9 muid];
                    v46 = [(MKTransitItemReferenceDateUpdater *)self delegate];
                    uint64_t v47 = objc_opt_class();
                    *(_DWORD *)buf = 138412802;
                    v57 = v44;
                    __int16 v58 = 2048;
                    uint64_t v59 = v45;
                    __int16 v60 = 2112;
                    *(void *)v61 = v47;
                    _os_log_impl(&dword_18BAEC000, v42, OS_LOG_TYPE_ERROR, "MapItem %@ <muid: %llu> needs update but delegate %@ failed to provide a ticket", buf, 0x20u);
                  }
                  v48 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:*(double *)&v12];
                  [(MKTransitMapItemUpdater *)self _scheduleDataUpdateForTransitItemAtDate:v48];
                  [(MKTransitMapItemUpdater *)self setRefreshing:0];
                }
              }
              else
              {
                if (*(double *)&v12 > 0.0)
                {
                  uint64_t v41 = [v14 dateByAddingTimeInterval:*(double *)&v12];
                  [(MKTransitMapItemUpdater *)self _scheduleDataUpdateForTransitItemAtDate:v41];
                }
                [(MKTransitMapItemUpdater *)self setRefreshing:0];
              }

LABEL_50:
              return;
            }
            v28 = MKGetTransitItemUpdaterLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              v49 = [(MKTransitMapItemUpdater *)self mapItem];
              v50 = [v49 name];
              uint64_t v51 = [v9 muid];
              v52 = [v7 lastFullScheduleValidDate];
              *(_DWORD *)buf = 138412802;
              v57 = v50;
              __int16 v58 = 2048;
              uint64_t v59 = v51;
              __int16 v60 = 2112;
              *(void *)v61 = v52;
              _os_log_impl(&dword_18BAEC000, v28, OS_LOG_TYPE_DEBUG, "MapItem %@ <muid: %llu> needs update: schedule ends %@", buf, 0x20u);
            }
          }
        }
        else
        {
          v28 = MKGetTransitItemUpdaterLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            v34 = [(MKTransitMapItemUpdater *)self mapItem];
            __int16 v35 = [v34 name];
            uint64_t v36 = [v9 muid];
            *(_DWORD *)buf = 138413058;
            v57 = v35;
            __int16 v58 = 2048;
            uint64_t v59 = v36;
            __int16 v60 = 2048;
            *(void *)v61 = v12;
            *(_WORD *)&v61[8] = 2112;
            v62 = v14;
            _os_log_impl(&dword_18BAEC000, v28, OS_LOG_TYPE_DEBUG, "MapItem %@ <muid: %llu> needs update: Schedule TTL = %#.1lfs, last updated: %@", buf, 0x2Au);
          }
        }

        int v21 = 1;
        goto LABEL_40;
      }
      v23 = MKGetTransitItemUpdaterLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        if ([(MKTransitMapItemUpdater *)self isRefreshing]) {
          uint64_t v24 = "YES";
        }
        else {
          uint64_t v24 = "NO";
        }
        if ([(MKTransitItemReferenceDateUpdater *)self isActive]) {
          BOOL v25 = "YES";
        }
        else {
          BOOL v25 = "NO";
        }
        *(_DWORD *)buf = 136315394;
        v57 = v24;
        __int16 v58 = 2080;
        uint64_t v59 = (uint64_t)v25;
        _os_log_impl(&dword_18BAEC000, v23, OS_LOG_TYPE_DEBUG, "Will not refresh item (refreshing:%s, isActive:%s)", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v26 = MKGetTransitItemUpdaterLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18BAEC000, v26, OS_LOG_TYPE_ERROR, "Will not refresh item, no delegate", buf, 2u);
      }

      [(MKTransitMapItemUpdater *)self _suspendDataRefreshTimer];
      [(MKTransitMapItemUpdater *)self setRefreshing:0];
    }
  }
  else
  {
    v22 = MKGetTransitItemUpdaterLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BAEC000, v22, OS_LOG_TYPE_ERROR, "Will not refresh item, no map item", buf, 2u);
    }

    [(MKTransitMapItemUpdater *)self setRefreshing:0];
  }
}

void __54__MKTransitMapItemUpdater__refreshTransitInfoIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _processUpdatedMapItems:v8 identifier:*(void *)(a1 + 32) ttl:v5 error:*(double *)(a1 + 48)];
  }
}

- (void)_processUpdatedMapItems:(id)a3 identifier:(id)a4 ttl:(double)a5 error:(id)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v59 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v46;
LABEL_3:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v46 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void **)(*((void *)&v45 + 1) + 8 * v17);
      double v19 = [v18 _identifier];
      char v20 = [v19 isEqual:v11];

      if (v20) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v45 objects:v59 count:16];
        if (v15) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v21 = v18;
    [v21 _markTransitInfoUpdated];

    if (v21) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_9:
  }
  if ([v13 count] == 1)
  {
    id v21 = [v13 firstObject];
    [v21 _markTransitInfoUpdated];
  }
  else
  {
    id v21 = 0;
  }
LABEL_14:
  v22 = MKGetTransitItemUpdaterLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v44 = [(MKTransitMapItemUpdater *)self mapItem];
    v23 = [v44 name];
    uint64_t v24 = [(MKTransitMapItemUpdater *)self mapItem];
    id v25 = v12;
    uint64_t v26 = [v24 _muid];
    uint64_t v27 = [v21 _transitInfoUpdatedDate];
    *(_DWORD *)buf = 138413314;
    double v50 = *(double *)&v23;
    __int16 v51 = 2048;
    uint64_t v52 = v26;
    id v12 = v25;
    __int16 v53 = 1024;
    BOOL v54 = v21 != 0;
    __int16 v55 = 2112;
    uint64_t v56 = v27;
    v28 = (void *)v27;
    __int16 v57 = 2112;
    id v58 = v25;
    _os_log_impl(&dword_18BAEC000, v22, OS_LOG_TYPE_DEBUG, "MapItem %@ <muid: %llu> update (success:%d, lastRefresh:%@, error:%@)", buf, 0x30u);
  }
  v29 = [v21 _transitInfo];
  if (v29)
  {
    v30 = [v21 _transitInfo];
    [v30 timeToLive];
    a5 = v31;
  }
  if (a5 > 0.0)
  {
    int v32 = [v21 _transitInfoUpdatedDate];
    if (v32)
    {
      int v33 = [v21 _transitInfoUpdatedDate];
      v34 = [v33 dateByAddingTimeInterval:a5];

      __int16 v35 = MKGetTransitItemUpdaterLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        double v50 = a5;
        __int16 v51 = 2112;
        uint64_t v52 = (uint64_t)v34;
        uint64_t v36 = "- Schedule TTL expires in %#.1lfs at %@";
LABEL_25:
        _os_log_impl(&dword_18BAEC000, v35, OS_LOG_TYPE_DEBUG, v36, buf, 0x16u);
      }
    }
    else
    {
      v34 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a5];
      __int16 v35 = MKGetTransitItemUpdaterLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        double v50 = a5;
        __int16 v51 = 2112;
        uint64_t v52 = (uint64_t)v34;
        uint64_t v36 = "- Suggesting next attempt based on previous TTL of %#.1lfs at %@";
        goto LABEL_25;
      }
    }

    goto LABEL_27;
  }
  v34 = 0;
LABEL_27:
  __int16 v37 = [v21 _transitInfo];
  v38 = [v37 lastFullScheduleValidDate];

  if (v38 && (!v34 || [v38 compare:v34] == -1))
  {
    __int16 v39 = MKGetTransitItemUpdaterLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      double v50 = *(double *)&v38;
      _os_log_impl(&dword_18BAEC000, v39, OS_LOG_TYPE_DEBUG, "- Schedule valid to %@", buf, 0xCu);
    }

    id v40 = v38;
    v34 = v40;
  }
  [(MKTransitMapItemUpdater *)self setLastInfoRefreshFailed:v21 == 0];
  if (v21)
  {
    uint64_t v41 = [(MKTransitMapItemUpdater *)self mapItem];
    [v41 _updateTransitInfoWithMapItem:v21];
  }
  [(MKTransitMapItemUpdater *)self setRefreshing:0];
  if ([(MKTransitItemReferenceDateUpdater *)self isActive])
  {
    v42 = [(MKTransitItemReferenceDateUpdater *)self delegate];
    v43 = [(MKTransitMapItemUpdater *)self mapItem];
    [v42 transitMapItemUpdater:self updatedMapItem:v43 error:v12];
  }
  [(MKTransitMapItemUpdater *)self _scheduleDataUpdateForTransitItemAtDate:v34];
}

- (BOOL)isStuckWithExpiredInfoRelativeToDate:(id)a3
{
  id v4 = a3;
  if ([(MKTransitMapItemUpdater *)self lastInfoRefreshFailed]) {
    BOOL v5 = [(MKTransitMapItemUpdater *)self _isInfoExpiredRelativeToDate:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isInfoExpiredRelativeToDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MKTransitMapItemUpdater *)self mapItem];
  BOOL v6 = [v5 _transitInfo];

  double v7 = [v6 lastFullScheduleValidDate];
  [v7 timeIntervalSinceDate:v4];
  double v9 = v8;

  return v9 <= 30.0;
}

- (void)_transitInfoUpdated
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MKTransitItemReferenceDateUpdater *)self delegate];

  if (!v3)
  {
    id v4 = MKGetTransitItemUpdaterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_ERROR, "Received a notification that the mapItem was updated, but there is no delegate", (uint8_t *)&v13, 2u);
    }

    [(MKTransitMapItemUpdater *)self _suspendDataRefreshTimer];
  }
  if (!self->_refreshing)
  {
    BOOL v5 = MKGetTransitItemUpdaterLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      BOOL v6 = [(MKTransitMapItemUpdater *)self mapItem];
      double v7 = [v6 name];
      double v8 = [(MKTransitMapItemUpdater *)self mapItem];
      double v9 = [v8 _identifier];
      uint64_t v10 = [v9 muid];
      int v13 = 138412546;
      uint64_t v14 = v7;
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_DEBUG, "MapItem %@ <muid: %llu> updated outside of the network refresh", (uint8_t *)&v13, 0x16u);
    }
    [(MKTransitMapItemUpdater *)self setLastInfoRefreshFailed:0];
    id v11 = [(MKTransitItemReferenceDateUpdater *)self delegate];
    id v12 = [(MKTransitMapItemUpdater *)self mapItem];
    [v11 transitMapItemUpdater:self updatedMapItem:v12 error:0];
  }
}

- (BOOL)lastInfoRefreshFailed
{
  return self->_lastInfoRefreshFailed;
}

- (void)setLastInfoRefreshFailed:(BOOL)a3
{
  self->_lastInfoRefreshFailed = a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (BOOL)isRefreshing
{
  return self->_refreshing;
}

- (void)setRefreshing:(BOOL)a3
{
  self->_refreshing = a3;
}

- (NSTimer)dataRefreshTimer
{
  return self->_dataRefreshTimer;
}

- (void)setDataRefreshTimer:(id)a3
{
}

- (NSDate)suggestedDataRefreshDate
{
  return self->_suggestedDataRefreshDate;
}

- (void)setSuggestedDataRefreshDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedDataRefreshDate, 0);
  objc_storeStrong((id *)&self->_dataRefreshTimer, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end