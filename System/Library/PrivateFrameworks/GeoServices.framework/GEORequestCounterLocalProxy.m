@interface GEORequestCounterLocalProxy
- (BOOL)countersEnabled;
- (GEORequestCounterLocalProxy)init;
- (GEORequestCounterLocalProxy)initWithPersistence:(id)a3;
- (id)externalRequestCounterTicketForType:(id)a3 subtype:(id)a4 source:(id)a5 appId:(id)a6;
- (id)requestCounterTicketForType:(id)a3 auditToken:(id)a4 traits:(id)a5;
- (void)clearCounters;
- (void)externalRequestsCount:(id)a3;
- (void)fetchRoutePreloadSessionsFrom:(id)a3 completion:(id)a4 completionQueue:(id)a5;
- (void)finishedProactiveTileDownloadForIdentifier:(id)a3 policy:(unsigned __int8)a4 tilesConsidered:(unsigned int)a5 tileDownloadAttempts:(unsigned int)a6 successes:(unsigned int)a7 failures:(unsigned int)a8 bytesDownloaded:(unint64_t)a9;
- (void)placeCacheGetCounts:(unint64_t)a3 forApp:(id)a4 inTimeRange:(id)a5 ofType:(int)a6 handler:(id)a7;
- (void)placeCacheRegisterCacheResult:(unsigned __int8)a3 forApp:(id)a4 requestType:(int)a5 timestamp:(id)a6;
- (void)readProactiveTileDownloadsSince:(id)a3 handler:(id)a4;
- (void)readRequestLogsDuring:(id)a3 handler:(id)a4;
- (void)readRequestsPerAppDuring:(id)a3 handler:(id)a4;
- (void)recordRoutePreloadSessionAt:(id)a3 transportType:(int64_t)a4 tilesPreloaded:(unint64_t)a5 tilesUsed:(unint64_t)a6 tilesMissed:(unint64_t)a7;
- (void)setCountersEnabled:(BOOL)a3;
- (void)startedProactiveTileDownloadForIdentifier:(id)a3 policy:(unsigned __int8)a4;
@end

@implementation GEORequestCounterLocalProxy

- (void)placeCacheRegisterCacheResult:(unsigned __int8)a3 forApp:(id)a4 requestType:(int)a5 timestamp:(id)a6
{
}

- (id)requestCounterTicketForType:(id)a3 auditToken:(id)a4 traits:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  if ([(GEORequestCounterLocalProxy *)self countersEnabled]) {
    persistence = self->_persistence;
  }
  else {
    persistence = 0;
  }
  v11 = +[_GEOLocalRequestCounterTicket requestCounterTicketForType:a3 auditToken:v9 traits:v8 persistence:persistence];

  return v11;
}

- (BOOL)countersEnabled
{
  return GEOConfigGetBOOL(GeoServicesConfig_RequestCounterEnabledDefault, (uint64_t)off_1E91141E8);
}

- (GEORequestCounterLocalProxy)init
{
  v3 = +[GEORequestCounterPersistence sharedInstance];
  v4 = [(GEORequestCounterLocalProxy *)self initWithPersistence:v3];

  return v4;
}

- (GEORequestCounterLocalProxy)initWithPersistence:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORequestCounterLocalProxy;
  v6 = [(GEORequestCounterLocalProxy *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistence, a3);
    [(GEORequestCounterPersistence *)v7->_persistence setEnabled:[(GEORequestCounterLocalProxy *)v7 countersEnabled]];
  }

  return v7;
}

- (void)setCountersEnabled:(BOOL)a3
{
  -[GEORequestCounterPersistence setEnabled:](self->_persistence, "setEnabled:");
  int v3 = GeoServicesConfig_RequestCounterEnabledDefault;
  v4 = off_1E91141E8;

  GEOConfigSetBOOL(v3, (uint64_t)v4);
}

- (void)readRequestsPerAppDuring:(id)a3 handler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
      objc_super v9 = [MEMORY[0x1E4F1C9C8] date];
      v10 = [v7 startDate];
      [v9 timeIntervalSinceDate:v10];
      double v12 = v11;

      if (v12 >= 0.0)
      {
        persistence = self->_persistence;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __64__GEORequestCounterLocalProxy_readRequestsPerAppDuring_handler___block_invoke;
        v21[3] = &unk_1E53DA250;
        v22 = v8;
        [(GEORequestCounterPersistence *)persistence countsDuring:v7 withCompletion:v21];
        v15 = v22;
        goto LABEL_14;
      }
      v13 = NSString;
      v14 = NSStringFromSelector(a2);
      v15 = [v13 stringWithFormat:@"%@ needs a start date that is in the past", v14];

      v16 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterLocalProxy");
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 138543362;
      v24 = v15;
    }
    else
    {
      v18 = NSString;
      v19 = NSStringFromSelector(a2);
      v15 = [v18 stringWithFormat:@"%@ needs an interval that is not nil", v19];

      v16 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterLocalProxy");
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        v17 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:v15];
        (*((void (**)(id, void, NSObject *))v8 + 2))(v8, 0, v17);
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138543362;
      v24 = v15;
    }
    _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    goto LABEL_11;
  }
  v15 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterLocalProxy");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    v24 = v17;
    _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "%{public}@ needs a handler", buf, 0xCu);
LABEL_12:
  }
LABEL_14:
}

uint64_t __64__GEORequestCounterLocalProxy_readRequestsPerAppDuring_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)readRequestLogsDuring:(id)a3 handler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
      objc_super v9 = [MEMORY[0x1E4F1C9C8] date];
      v10 = [v7 startDate];
      [v9 timeIntervalSinceDate:v10];
      double v12 = v11;

      if (v12 >= 0.0)
      {
        persistence = self->_persistence;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __61__GEORequestCounterLocalProxy_readRequestLogsDuring_handler___block_invoke;
        v21[3] = &unk_1E53DA278;
        v22 = v8;
        [(GEORequestCounterPersistence *)persistence logsDuring:v7 withCompletion:v21];
        v15 = v22;
        goto LABEL_14;
      }
      v13 = NSString;
      v14 = NSStringFromSelector(a2);
      v15 = [v13 stringWithFormat:@"%@ needs a start date that is in the past", v14];

      v16 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterLocalProxy");
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 138543362;
      v24 = v15;
    }
    else
    {
      v18 = NSString;
      v19 = NSStringFromSelector(a2);
      v15 = [v18 stringWithFormat:@"%@ needs an interval that is not nil", v19];

      v16 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterLocalProxy");
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        v17 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:v15];
        (*((void (**)(id, void, NSObject *))v8 + 2))(v8, 0, v17);
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138543362;
      v24 = v15;
    }
    _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    goto LABEL_11;
  }
  v15 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterLocalProxy");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    v24 = v17;
    _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "%{public}@ needs a handler", buf, 0xCu);
LABEL_12:
  }
LABEL_14:
}

uint64_t __61__GEORequestCounterLocalProxy_readRequestLogsDuring_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearCounters
{
}

- (void)startedProactiveTileDownloadForIdentifier:(id)a3 policy:(unsigned __int8)a4
{
}

- (void)finishedProactiveTileDownloadForIdentifier:(id)a3 policy:(unsigned __int8)a4 tilesConsidered:(unsigned int)a5 tileDownloadAttempts:(unsigned int)a6 successes:(unsigned int)a7 failures:(unsigned int)a8 bytesDownloaded:(unint64_t)a9
{
}

- (void)readProactiveTileDownloadsSince:(id)a3 handler:(id)a4
{
}

- (void)recordRoutePreloadSessionAt:(id)a3 transportType:(int64_t)a4 tilesPreloaded:(unint64_t)a5 tilesUsed:(unint64_t)a6 tilesMissed:(unint64_t)a7
{
}

- (void)fetchRoutePreloadSessionsFrom:(id)a3 completion:(id)a4 completionQueue:(id)a5
{
}

- (id)externalRequestCounterTicketForType:(id)a3 subtype:(id)a4 source:(id)a5 appId:(id)a6
{
  return +[_GEOLocalExternalRequestCounterTicket externalRequestCounterForType:a3 subtype:a4 source:a5 appId:a6 persistence:self->_persistence];
}

- (void)externalRequestsCount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    persistence = self->_persistence;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__GEORequestCounterLocalProxy_externalRequestsCount___block_invoke;
    v7[3] = &unk_1E53E7680;
    id v8 = v4;
    [(GEORequestCounterPersistence *)persistence externalRequestsCount:v7];
  }
}

uint64_t __53__GEORequestCounterLocalProxy_externalRequestsCount___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)placeCacheGetCounts:(unint64_t)a3 forApp:(id)a4 inTimeRange:(id)a5 ofType:(int)a6 handler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (!v13)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F28C18]);
    v16 = [MEMORY[0x1E4F1C9C8] distantPast];
    v17 = [MEMORY[0x1E4F1C9C8] distantFuture];
    id v13 = (id)[v15 initWithStartDate:v16 endDate:v17];
  }
  BOOL v18 = [v12 length] == 0;
  switch(a3)
  {
    case 0uLL:
      v19 = &__block_literal_global_20_0;
      v20 = &__block_literal_global_116;
      break;
    case 1uLL:
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_4;
      v46[3] = &__block_descriptor_37_e52___GEORequestCounterCacheResults_20__0__NSString_8i16l;
      BOOL v48 = a6 == 0;
      int v47 = a6;
      v19 = (void *)MEMORY[0x18C120660](v46);
      v20 = &__block_literal_global_23_0;
      break;
    case 2uLL:
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_6;
      v43[3] = &unk_1E53E7728;
      BOOL v45 = v18;
      id v44 = v12;
      v19 = (void *)MEMORY[0x18C120660](v43);

      v20 = &__block_literal_global_26;
      break;
    case 3uLL:
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_8;
      v38[3] = &unk_1E53E7750;
      BOOL v41 = v18;
      id v39 = v12;
      BOOL v42 = a6 == 0;
      int v40 = a6;
      v19 = (void *)MEMORY[0x18C120660](v38);

      v20 = &__block_literal_global_29_0;
      break;
    default:
      v20 = 0;
      v19 = 0;
      break;
  }
  v21 = [MEMORY[0x1E4F1CA60] dictionary];
  persistence = self->_persistence;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_9;
  v30[3] = &unk_1E53E7778;
  BOOL v36 = a6 == 0;
  int v35 = a6;
  BOOL v37 = v18;
  id v31 = v12;
  id v33 = v20;
  id v32 = v21;
  id v34 = v19;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_35;
  v27[3] = &unk_1E53E77A0;
  id v28 = v32;
  id v29 = v14;
  id v23 = v32;
  id v24 = v14;
  id v25 = v19;
  id v26 = v12;
  [(GEORequestCounterPersistence *)persistence getPlaceCacheResultsInTimeRange:v13 rawCounts:v30 complete:v27];
}

uint64_t __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [NSString stringWithFormat:@"%@:%d", a2, a3];
}

GEORequestCounterCacheResults *__85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = objc_alloc_init(GEORequestCounterCacheResults);
  [(GEORequestCounterCacheResults *)v5 setAppId:v4];

  [(GEORequestCounterCacheResults *)v5 setRequestKindRaw:a3];

  return v5;
}

id __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_3(int a1, id a2)
{
  return a2;
}

GEORequestCounterCacheResults *__85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(GEORequestCounterCacheResults);
  [(GEORequestCounterCacheResults *)v4 setAppId:v3];

  if (!*(unsigned char *)(a1 + 36)) {
    [(GEORequestCounterCacheResults *)v4 setRequestKindRaw:*(unsigned int *)(a1 + 32)];
  }

  return v4;
}

uint64_t __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_5()
{
  return objc_msgSend(NSNumber, "numberWithInt:");
}

GEORequestCounterCacheResults *__85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_alloc_init(GEORequestCounterCacheResults);
  [(GEORequestCounterCacheResults *)v5 setRequestKindRaw:a3];
  if (!*(unsigned char *)(a1 + 40)) {
    [(GEORequestCounterCacheResults *)v5 setAppId:*(void *)(a1 + 32)];
  }

  return v5;
}

__CFString *__85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_7()
{
  return &stru_1ED51F370;
}

GEORequestCounterCacheResults *__85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_8(uint64_t a1)
{
  v2 = objc_alloc_init(GEORequestCounterCacheResults);
  id v3 = v2;
  if (!*(unsigned char *)(a1 + 44)) {
    [(GEORequestCounterCacheResults *)v2 setAppId:*(void *)(a1 + 32)];
  }
  if (!*(unsigned char *)(a1 + 45)) {
    [(GEORequestCounterCacheResults *)v3 setRequestKindRaw:*(unsigned int *)(a1 + 40)];
  }

  return v3;
}

void __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_9(uint64_t a1, void *a2, void *a3, int a4, int a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  if ((*(unsigned char *)(a1 + 68) || *(_DWORD *)(a1 + 64) == a4)
    && (*(unsigned char *)(a1 + 69) || [v9 isEqualToString:*(void *)(a1 + 32)]))
  {
    double v11 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (v11)
    {
      id v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:v11];
      if (!v12)
      {
        id v12 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        id v13 = [MEMORY[0x1E4F1C9C8] distantFuture];
        [v12 setStartTime:v13];

        id v14 = [MEMORY[0x1E4F1C9C8] distantPast];
        [v12 setEndTime:v14];

        [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:v11];
      }
      switch(a5)
      {
        case 0:
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            v19[0] = 67109120;
            v19[1] = 0;
            _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid cache result: %d", (uint8_t *)v19, 8u);
          }
          break;
        case 1:
          objc_msgSend(v12, "setCacheHitCount:", objc_msgSend(v12, "cacheHitCount") + 1);
          break;
        case 2:
          objc_msgSend(v12, "setCacheMissCount:", objc_msgSend(v12, "cacheMissCount") + 1);
          break;
        case 3:
          objc_msgSend(v12, "setCacheExpiredCount:", objc_msgSend(v12, "cacheExpiredCount") + 1);
          break;
        default:
          break;
      }
      id v15 = [v12 startTime];
      uint64_t v16 = [v10 compare:v15];

      if (v16 == -1) {
        [v12 setStartTime:v10];
      }
      v17 = [v12 endTime];
      uint64_t v18 = [v10 compare:v17];

      if (v18 == 1) {
        [v12 setEndTime:v10];
      }
    }
  }
}

void __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 allValues];
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v5, v4);
}

- (void).cxx_destruct
{
}

@end