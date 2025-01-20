@interface GEORequestCounter
+ (id)sharedCounter;
+ (void)useLocalProxy;
+ (void)useProxy:(Class)a3;
+ (void)useRemoteProxy;
- (BOOL)countersEnabled;
- (GEORequestCounter)init;
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
- (void)readRequestLogsSince:(id)a3 handler:(id)a4;
- (void)readRequestsPerAppDuring:(id)a3 handler:(id)a4;
- (void)readRequestsPerAppSince:(id)a3 handler:(id)a4;
- (void)recordRoutePreloadSessionAt:(id)a3 transportType:(int64_t)a4 tilesPreloaded:(unint64_t)a5 tilesUsed:(unint64_t)a6 tilesMissed:(unint64_t)a7;
- (void)setCountersEnabled:(BOOL)a3;
- (void)startedProactiveTileDownloadForIdentifier:(id)a3 policy:(unsigned __int8)a4;
@end

@implementation GEORequestCounter

- (void)placeCacheRegisterCacheResult:(unsigned __int8)a3 forApp:(id)a4 requestType:(int)a5 timestamp:(id)a6
{
}

+ (id)sharedCounter
{
  if (qword_1EB29F588 != -1) {
    dispatch_once(&qword_1EB29F588, &__block_literal_global_475);
  }
  v2 = (void *)qword_1EB29F580;

  return v2;
}

- (id)requestCounterTicketForType:(id)a3 auditToken:(id)a4 traits:(id)a5
{
  return (id)[(GEORequestCounterProtocol *)self->_proxy requestCounterTicketForType:a3 auditToken:a4 traits:a5];
}

+ (void)useProxy:(Class)a3
{
  _proxyClass = (uint64_t)a3;
}

+ (void)useLocalProxy
{
  uint64_t v3 = objc_opt_class();

  [a1 useProxy:v3];
}

+ (void)useRemoteProxy
{
  uint64_t v3 = objc_opt_class();

  [a1 useProxy:v3];
}

void __34__GEORequestCounter_sharedCounter__block_invoke()
{
  v0 = objc_alloc_init(GEORequestCounter);
  v1 = (void *)qword_1EB29F580;
  qword_1EB29F580 = (uint64_t)v0;
}

- (GEORequestCounter)init
{
  v7.receiver = self;
  v7.super_class = (Class)GEORequestCounter;
  v2 = [(GEORequestCounter *)&v7 init];
  if (v2)
  {
    uint64_t v3 = (objc_class *)_proxyClass;
    if (!_proxyClass)
    {
      [(id)objc_opt_class() useRemoteProxy];
      uint64_t v3 = (objc_class *)_proxyClass;
    }
    v4 = (GEORequestCounterProtocol *)objc_alloc_init(v3);
    proxy = v2->_proxy;
    v2->_proxy = v4;
  }
  return v2;
}

- (BOOL)countersEnabled
{
  return [(GEORequestCounterProtocol *)self->_proxy countersEnabled];
}

- (void)setCountersEnabled:(BOOL)a3
{
}

- (void)readRequestsPerAppSince:(id)a3 handler:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F28C18];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v11 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v10 = (void *)[v9 initWithStartDate:v8 endDate:v11];

  [(GEORequestCounter *)self readRequestsPerAppDuring:v10 handler:v7];
}

- (void)readRequestLogsSince:(id)a3 handler:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F28C18];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v11 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v10 = (void *)[v9 initWithStartDate:v8 endDate:v11];

  [(GEORequestCounter *)self readRequestLogsDuring:v10 handler:v7];
}

- (void)readRequestsPerAppDuring:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      v10 = [v7 startDate];
      [v9 timeIntervalSinceDate:v10];
      double v12 = v11;

      if (v12 >= 0.0)
      {
        proxy = self->_proxy;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __54__GEORequestCounter_readRequestsPerAppDuring_handler___block_invoke;
        v19[3] = &unk_1E53DA250;
        v20 = v8;
        [(GEORequestCounterProtocol *)proxy readRequestsPerAppDuring:v7 handler:v19];
        v16 = v20;
        goto LABEL_13;
      }
      v13 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v22 = v14;
      v15 = "%{public}@ needs a start date that is in the past";
    }
    else
    {
      v13 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        v16 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12];
        (*((void (**)(id, void, NSObject *))v8 + 2))(v8, 0, v16);
        goto LABEL_13;
      }
      v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v22 = v14;
      v15 = "%{public}@ needs an interval that is not nil";
    }
    _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);

    goto LABEL_11;
  }
  v16 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    v22 = v17;
    _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "%{public}@ needs a handler", buf, 0xCu);
  }
LABEL_13:
}

uint64_t __54__GEORequestCounter_readRequestsPerAppDuring_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)readRequestLogsDuring:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      v10 = [v7 startDate];
      [v9 timeIntervalSinceDate:v10];
      double v12 = v11;

      if (v12 >= 0.0)
      {
        proxy = self->_proxy;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __51__GEORequestCounter_readRequestLogsDuring_handler___block_invoke;
        v19[3] = &unk_1E53DA278;
        v20 = v8;
        [(GEORequestCounterProtocol *)proxy readRequestLogsDuring:v7 handler:v19];
        v16 = v20;
        goto LABEL_13;
      }
      v13 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v22 = v14;
      v15 = "%{public}@ needs a start date that is in the past";
    }
    else
    {
      v13 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        v16 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12];
        (*((void (**)(id, void, NSObject *))v8 + 2))(v8, 0, v16);
        goto LABEL_13;
      }
      v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v22 = v14;
      v15 = "%{public}@ needs an interval that is not nil";
    }
    _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);

    goto LABEL_11;
  }
  v16 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    v22 = v17;
    _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "%{public}@ needs a handler", buf, 0xCu);
  }
LABEL_13:
}

uint64_t __51__GEORequestCounter_readRequestLogsDuring_handler___block_invoke(uint64_t a1)
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
  return (id)[(GEORequestCounterProtocol *)self->_proxy externalRequestCounterTicketForType:a3 subtype:a4 source:a5 appId:a6];
}

- (void)externalRequestsCount:(id)a3
{
}

- (void)placeCacheGetCounts:(unint64_t)a3 forApp:(id)a4 inTimeRange:(id)a5 ofType:(int)a6 handler:(id)a7
{
}

- (void).cxx_destruct
{
}

@end