@interface GEORequestCounterRemoteProxy
- (BOOL)countersEnabled;
- (id)externalRequestCounterTicketForType:(id)a3 subtype:(id)a4 source:(id)a5 appId:(id)a6;
- (id)requestCounterTicketForType:(id)a3 auditToken:(id)a4 traits:(id)a5;
- (void)_incrementExternalForApp:(id)a3 startTime:(id)a4 endTime:(id)a5 xmitBytes:(int64_t)a6 recvBytes:(int64_t)a7 usedInterfaces:(unint64_t)a8 requestType:(id)a9 requestSubtype:(id)a10 source:(id)a11;
- (void)_incrementForApp:(id)a3 offlineCohortId:(id)a4 requestMode:(int)a5 startTime:(id)a6 endTime:(id)a7 requestType:(id)a8 result:(unsigned __int8)a9 error:(id)a10 xmitBytes:(int64_t)a11 recvBytes:(int64_t)a12 usedInterfaces:(unint64_t)a13;
- (void)clearCounters;
- (void)externalRequestsCount:(id)a3;
- (void)fetchRoutePreloadSessionsFrom:(id)a3 completion:(id)a4 completionQueue:(id)a5;
- (void)placeCacheGetCounts:(unint64_t)a3 forApp:(id)a4 inTimeRange:(id)a5 ofType:(int)a6 handler:(id)a7;
- (void)placeCacheRegisterCacheResult:(unsigned __int8)a3 forApp:(id)a4 requestType:(int)a5 timestamp:(id)a6;
- (void)readProactiveTileDownloadsSince:(id)a3 handler:(id)a4;
- (void)readRequestLogsDuring:(id)a3 handler:(id)a4;
- (void)readRequestsPerAppDuring:(id)a3 handler:(id)a4;
- (void)recordRoutePreloadSessionAt:(id)a3 transportType:(int64_t)a4 tilesPreloaded:(unint64_t)a5 tilesUsed:(unint64_t)a6 tilesMissed:(unint64_t)a7;
- (void)setCountersEnabled:(BOOL)a3;
@end

@implementation GEORequestCounterRemoteProxy

- (BOOL)countersEnabled
{
  return GEOConfigGetBOOL(GeoServicesConfig_RequestCounterEnabledDefault, (uint64_t)off_1E91141E8);
}

- (void)setCountersEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v13[2] = *MEMORY[0x1E4F143B8];
  v5 = +[GEOXPCConnection createServerConnectionFor:10 debugIdentifier:@"RequestCounter" eventHandler:0];
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  v7 = [NSNumber numberWithBool:v3];
  [v6 setObject:v7 forKey:@"enabled"];

  v12[0] = @"message";
  v12[1] = @"userInfo";
  v13[0] = @"requestCounter.setCountersEnabled";
  v13[1] = v6;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  qos_class_self();
  global_workloop = (void *)geo_get_global_workloop();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__GEORequestCounterRemoteProxy_setCountersEnabled___block_invoke;
  v11[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v11[4] = a2;
  [v5 sendMessage:v9 withReply:global_workloop handler:v11];
}

void __51__GEORequestCounterRemoteProxy_setCountersEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x18C1213B0](a2) == MEMORY[0x1E4F145A8])
  {
    BOOL v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "%{public}@ failed on XPC", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (id)requestCounterTicketForType:(id)a3 auditToken:(id)a4 traits:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  if ([(GEORequestCounterRemoteProxy *)self countersEnabled]) {
    v10 = self;
  }
  else {
    v10 = 0;
  }
  v11 = +[_GEORemoteRequestCounterTicket requestCounterTicketForType:a3 auditToken:v9 traits:v8 remoteProxy:v10];

  return v11;
}

- (void)_incrementForApp:(id)a3 offlineCohortId:(id)a4 requestMode:(int)a5 startTime:(id)a6 endTime:(id)a7 requestType:(id)a8 result:(unsigned __int8)a9 error:(id)a10 xmitBytes:(int64_t)a11 recvBytes:(int64_t)a12 usedInterfaces:(unint64_t)a13
{
  uint64_t v16 = *(void *)&a5;
  v43[2] = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = a4;
  id v22 = a6;
  id v23 = a7;
  id v24 = a10;
  if ([(GEORequestCounterRemoteProxy *)self countersEnabled])
  {
    SEL v40 = a2;
    v39 = +[GEOXPCConnection createServerConnectionFor:10 debugIdentifier:@"RequestCounter" eventHandler:0];
    v25 = [MEMORY[0x1E4F1CA60] dictionary];
    v26 = v25;
    if (v22)
    {
      [v25 setObject:v22 forKeyedSubscript:@"startTime"];
      if (v23)
      {
LABEL_4:
        [v26 setObject:v23 forKeyedSubscript:@"endTime"];
LABEL_7:
        [v26 setObject:v20 forKeyedSubscript:@"appID"];
        [v26 setObject:v21 forKeyedSubscript:@"cohortID"];
        v29 = [NSNumber numberWithInt:v16];
        [v26 setObject:v29 forKeyedSubscript:@"reqMode"];

        v30 = [NSNumber numberWithInt:(a8.var1.var0 | a8.var0)];
        [v26 setObject:v30 forKeyedSubscript:@"reqType"];

        v31 = [NSNumber numberWithUnsignedChar:a9];
        [v26 setObject:v31 forKeyedSubscript:@"reqResult"];

        v32 = [NSNumber numberWithLongLong:a11];
        [v26 setObject:v32 forKeyedSubscript:@"xmitB"];

        v33 = [NSNumber numberWithLongLong:a12];
        [v26 setObject:v33 forKeyedSubscript:@"recvB"];

        v34 = [NSNumber numberWithUnsignedInteger:a13];
        [v26 setObject:v34 forKeyedSubscript:@"iface"];

        v35 = _geo_NSErrorDictionaryRepresentationCopy(v24);
        [v26 setObject:v35 forKeyedSubscript:@"error"];

        v42[0] = @"message";
        v42[1] = @"userInfo";
        v43[0] = @"requestCounter.increment";
        v43[1] = v26;
        v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
        v37 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        qos_class_self();
        global_workloop = (void *)geo_get_global_workloop();
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __155__GEORequestCounterRemoteProxy__incrementForApp_offlineCohortId_requestMode_startTime_endTime_requestType_result_error_xmitBytes_recvBytes_usedInterfaces___block_invoke;
        v41[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
        v41[4] = v40;
        [v39 sendMessage:v37 withReply:global_workloop handler:v41];

        goto LABEL_8;
      }
    }
    else
    {
      v27 = [MEMORY[0x1E4F1C9C8] date];
      [v26 setObject:v27 forKeyedSubscript:@"startTime"];

      if (v23) {
        goto LABEL_4;
      }
    }
    v28 = [MEMORY[0x1E4F1C9C8] date];
    [v26 setObject:v28 forKeyedSubscript:@"endTime"];

    goto LABEL_7;
  }
LABEL_8:
}

void __155__GEORequestCounterRemoteProxy__incrementForApp_offlineCohortId_requestMode_startTime_endTime_requestType_result_error_xmitBytes_recvBytes_usedInterfaces___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x18C1213B0](a2) == MEMORY[0x1E4F145A8])
  {
    BOOL v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "%{public}@ failed on XPC", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)readRequestsPerAppDuring:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[GEOXPCConnection createServerConnectionFor:10 debugIdentifier:@"RequestCounter" eventHandler:0];
    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
    v10 = [v6 startDate];
    [v9 setObject:v10 forKeyedSubscript:@"startTime"];

    v11 = [v6 endDate];
    [v9 setObject:v11 forKeyedSubscript:@"endTime"];

    v19[0] = @"message";
    v19[1] = @"userInfo";
    v20[0] = @"requestCounter.readRequests";
    v20[1] = v9;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    qos_class_self();
    global_workloop = (void *)geo_get_global_workloop();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__GEORequestCounterRemoteProxy_readRequestsPerAppDuring_handler___block_invoke;
    v16[3] = &unk_1E53DB758;
    SEL v18 = a2;
    id v17 = v7;
    [v8 sendMessage:v13 withReply:global_workloop handler:v16];
  }
  else
  {
    id v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      id v22 = v15;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "%{public}@ cannot be called without a handler", buf, 0xCu);
    }
  }
}

void __65__GEORequestCounterRemoteProxy_readRequestsPerAppDuring_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F145A8])
  {
    SEL v18 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138543362;
      id v23 = v19;
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "%{public}@ failed on XPC", buf, 0xCu);
    }
    v4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    int v5 = [v4 objectForKey:@"userInfo"];
    id v20 = objc_msgSend(v5, "_geo_errorForKey:", @"err");
    id v6 = [v5 objectForKeyedSubscript:@"response"];
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    id v21 = 0;
    v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v12 fromData:v6 error:&v21];
    id v14 = v21;
    if (v14)
    {
      v15 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        id v23 = v14;
        _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "Error decoding response: %{private}@", buf, 0xCu);
      }
    }
    uint64_t v16 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v17 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138478083;
      id v23 = v17;
      __int16 v24 = 2113;
      v25 = v13;
      _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_DEBUG, "%{private}@ received: %{private}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)readRequestLogsDuring:(id)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = +[GEOXPCConnection createServerConnectionFor:10 debugIdentifier:@"RequestCounter" eventHandler:0];
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v10 = [v6 startDate];
    [v9 setObject:v10 forKeyedSubscript:@"startTime"];

    uint64_t v11 = [v6 endDate];
    [v9 setObject:v11 forKeyedSubscript:@"endTime"];

    v19[0] = @"message";
    v19[1] = @"userInfo";
    v20[0] = @"requestCounter.readRequestLogs";
    v20[1] = v9;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    qos_class_self();
    global_workloop = (void *)geo_get_global_workloop();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__GEORequestCounterRemoteProxy_readRequestLogsDuring_handler___block_invoke;
    v16[3] = &unk_1E53DB758;
    SEL v18 = a2;
    id v17 = v7;
    [v8 sendMessage:v13 withReply:global_workloop handler:v16];
  }
  else
  {
    uint64_t v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      id v22 = v15;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "%{public}@ cannot be called without a handler", buf, 0xCu);
    }
  }
}

void __62__GEORequestCounterRemoteProxy_readRequestLogsDuring_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F145A8])
  {
    id v21 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138543362;
      id v26 = v22;
      _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "%{public}@ failed on XPC", buf, 0xCu);
    }
    v4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    int v5 = [v4 objectForKey:@"userInfo"];
    id v6 = objc_msgSend(v5, "_geo_errorForKey:", @"err");
    id v7 = [v5 objectForKeyedSubscript:@"response"];
    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    id v24 = 0;
    uint64_t v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v10 fromData:v7 error:&v24];
    id v12 = v24;
    if (v12)
    {
      v13 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        id v26 = v12;
        _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "Error decoding response: %{private}@", buf, 0xCu);
      }
    }
    id v14 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      uint64_t v23 = v5;
      id v15 = v3;
      uint64_t v16 = v10;
      id v17 = v7;
      SEL v18 = v6;
      id v20 = v19 = a1;
      *(_DWORD *)buf = 138478083;
      id v26 = v20;
      __int16 v27 = 2113;
      v28 = v11;
      _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "%{private}@ received: %{private}@", buf, 0x16u);

      a1 = v19;
      id v6 = v18;
      id v7 = v17;
      uint64_t v10 = v16;
      id v3 = v15;
      int v5 = v23;
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)clearCounters
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = +[GEOXPCConnection createServerConnectionFor:10 debugIdentifier:@"RequestCounter" eventHandler:0];
  uint64_t v8 = @"message";
  v9[0] = @"requestCounter.clear";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  int v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  qos_class_self();
  global_workloop = (void *)geo_get_global_workloop();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__GEORequestCounterRemoteProxy_clearCounters__block_invoke;
  v7[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v7[4] = a2;
  [v3 sendMessage:v5 withReply:global_workloop handler:v7];
}

void __45__GEORequestCounterRemoteProxy_clearCounters__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x18C1213B0](a2) == MEMORY[0x1E4F145A8])
  {
    id v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v5 = 138543362;
      id v6 = v4;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "%{public}@ failed on XPC", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)readProactiveTileDownloadsSince:(id)a3 handler:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    uint64_t v8 = +[GEOXPCConnection createServerConnectionFor:10 debugIdentifier:@"RequestCounter" eventHandler:0];
    SEL v18 = @"since";
    v19[0] = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    v16[0] = @"message";
    v16[1] = @"userInfo";
    v17[0] = @"requestCounter.readProactiveTileDownloads";
    v17[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    uint64_t v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    qos_class_self();
    global_workloop = (void *)geo_get_global_workloop();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__GEORequestCounterRemoteProxy_readProactiveTileDownloadsSince_handler___block_invoke;
    void v13[3] = &unk_1E53DB758;
    SEL v15 = a2;
    id v14 = v6;
    [v8 sendMessage:v11 withReply:global_workloop handler:v13];
  }
}

void __72__GEORequestCounterRemoteProxy_readProactiveTileDownloadsSince_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F145A8])
  {
    uint64_t v16 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138543362;
      id v20 = v17;
      _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "%{public}@ failed on XPC", buf, 0xCu);
    }
    v4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    int v5 = [v4 objectForKey:@"userInfo"];
    objc_msgSend(v5, "_geo_errorForKey:", @"err");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v5 objectForKeyedSubscript:@"data"];
    uint64_t v8 = (void *)v7;
    uint64_t v9 = 0;
    if (!v6 && v7)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v12 = objc_opt_class();
      v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
      id v18 = 0;
      uint64_t v9 = [v10 unarchivedObjectOfClasses:v13 fromData:v8 error:&v18];
      id v6 = v18;
    }
    id v14 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      SEL v15 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138478083;
      id v20 = v15;
      __int16 v21 = 2113;
      id v22 = v9;
      _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "%{private}@ received: %{private}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)recordRoutePreloadSessionAt:(id)a3 transportType:(int64_t)a4 tilesPreloaded:(unint64_t)a5 tilesUsed:(unint64_t)a6 tilesMissed:(unint64_t)a7
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  if ([(GEORequestCounterRemoteProxy *)self countersEnabled])
  {
    id v14 = +[GEOXPCConnection createServerConnectionFor:10 debugIdentifier:@"RequestCounter" eventHandler:0];
    SEL v15 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v16 = NSNumber;
    id v17 = [v13 startDate];
    [v17 timeIntervalSinceReferenceDate];
    id v18 = objc_msgSend(v16, "numberWithDouble:");
    [v15 setObject:v18 forKeyedSubscript:@"start"];

    uint64_t v19 = NSNumber;
    id v20 = [v13 endDate];
    [v20 timeIntervalSinceReferenceDate];
    __int16 v21 = objc_msgSend(v19, "numberWithDouble:");
    [v15 setObject:v21 forKeyedSubscript:@"end"];

    id v22 = [NSNumber numberWithInteger:a4];
    [v15 setObject:v22 forKeyedSubscript:@"transport_type"];

    uint64_t v23 = [NSNumber numberWithUnsignedInteger:a5];
    [v15 setObject:v23 forKeyedSubscript:@"tiles_preloaded"];

    id v24 = [NSNumber numberWithUnsignedInteger:a6];
    [v15 setObject:v24 forKeyedSubscript:@"tiles_used"];

    v25 = [NSNumber numberWithUnsignedInteger:a7];
    [v15 setObject:v25 forKeyedSubscript:@"tiles_missed"];

    v30[0] = @"message";
    v30[1] = @"userInfo";
    v31[0] = @"requestCounter.recordRoutePreloadSession";
    v31[1] = v15;
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
    __int16 v27 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    qos_class_self();
    global_workloop = (void *)geo_get_global_workloop();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __111__GEORequestCounterRemoteProxy_recordRoutePreloadSessionAt_transportType_tilesPreloaded_tilesUsed_tilesMissed___block_invoke;
    v29[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
    v29[4] = a2;
    [v14 sendMessage:v27 withReply:global_workloop handler:v29];
  }
}

void __111__GEORequestCounterRemoteProxy_recordRoutePreloadSessionAt_transportType_tilesPreloaded_tilesUsed_tilesMissed___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x18C1213B0](a2) == MEMORY[0x1E4F145A8])
  {
    id v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "%@ failed on XPC", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)fetchRoutePreloadSessionsFrom:(id)a3 completion:(id)a4 completionQueue:(id)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (v8)
  {
    id v9 = a5;
    id v10 = a3;
    uint64_t v11 = +[GEOXPCConnection createServerConnectionFor:10 debugIdentifier:@"RequestCounter" eventHandler:0];
    id v24 = @"since";
    uint64_t v12 = NSNumber;
    [v10 timeIntervalSinceReferenceDate];
    double v14 = v13;

    SEL v15 = [v12 numberWithDouble:v14];
    v25[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];

    v22[0] = @"message";
    v22[1] = @"userInfo";
    v23[0] = @"requestCounter.fetchRoutePreloadSessions";
    v23[1] = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    id v18 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __89__GEORequestCounterRemoteProxy_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke;
    v19[3] = &unk_1E53DB758;
    SEL v21 = a2;
    id v20 = v8;
    [v11 sendMessage:v18 withReply:v9 handler:v19];
  }
}

void __89__GEORequestCounterRemoteProxy_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F145A8])
  {
    SEL v15 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138543362;
      SEL v21 = v16;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "%{public}@ failed on XPC", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    int v5 = [v4 objectForKey:@"userInfo"];
    id v6 = objc_msgSend(v5, "_geo_errorForKey:", @"err");
    uint64_t v7 = [v5 objectForKeyedSubscript:@"response"];
    if (v6)
    {
      id v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        SEL v21 = v6;
        _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "received error on XPC reply (%@)", buf, 0xCu);
      }
    }
    if (v7)
    {
      id v9 = (void *)MEMORY[0x1E4F28DC0];
      id v10 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
      id v19 = v6;
      double v13 = [v9 unarchivedObjectOfClasses:v12 fromData:v7 error:&v19];
      id v14 = v19;

      id v6 = v14;
    }
    else
    {
      double v13 = 0;
    }
    id v17 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v18 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138478083;
      SEL v21 = v18;
      __int16 v22 = 2113;
      uint64_t v23 = v13;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_DEBUG, "%{private}@ received: %{private}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)externalRequestCounterTicketForType:(id)a3 subtype:(id)a4 source:(id)a5 appId:(id)a6
{
  return +[_GEORemoteExternalRequestCounterTicket externalRequestCounterForType:a3 subtype:a4 source:a5 appId:a6 remoteProxy:self];
}

- (void)_incrementExternalForApp:(id)a3 startTime:(id)a4 endTime:(id)a5 xmitBytes:(int64_t)a6 recvBytes:(int64_t)a7 usedInterfaces:(unint64_t)a8 requestType:(id)a9 requestSubtype:(id)a10 source:(id)a11
{
  id v25 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  if ([(GEORequestCounterRemoteProxy *)self countersEnabled])
  {
    __int16 v22 = [[GEOExternalRequestCounterIncrementRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
    uint64_t v23 = objc_alloc_init(GEOExternalRequestCounterInfo);
    [(GEOExternalRequestCounterInfo *)v23 setAppId:v25];
    [(GEOExternalRequestCounterInfo *)v23 setStartTime:v17];
    [(GEOExternalRequestCounterInfo *)v23 setEndTime:v18];
    [(GEOExternalRequestCounterInfo *)v23 setXmitBytes:a6];
    [(GEOExternalRequestCounterInfo *)v23 setRecvBytes:a7];
    [(GEOExternalRequestCounterInfo *)v23 setUsedInterface:a8];
    [(GEOExternalRequestCounterInfo *)v23 setRequestType:v19];
    [(GEOExternalRequestCounterInfo *)v23 setRequestSubtype:v20];
    [(GEOExternalRequestCounterInfo *)v23 setSource:v21];
    [(GEOExternalRequestCounterIncrementRequest *)v22 setInfo:v23];
    uint64_t v24 = +[GEOXPCConnection createServerConnectionFor:10 debugIdentifier:@"RequestCounter" eventHandler:0];
    [(GEOXPCRequest *)v22 send:v24];
  }
}

- (void)externalRequestsCount:(id)a3
{
  id v3 = a3;
  v4 = [[GEOExternalRequestCounterCountRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  int v5 = +[GEOXPCConnection createServerConnectionFor:10 debugIdentifier:@"RequestCounter" eventHandler:0];
  qos_class_self();
  global_workloop = (void *)geo_get_global_workloop();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__GEORequestCounterRemoteProxy_externalRequestsCount___block_invoke;
  v8[3] = &unk_1E53DB780;
  id v9 = v3;
  id v7 = v3;
  [(GEOXPCRequest *)v4 send:v5 withReply:global_workloop handler:v8];
}

void __54__GEORequestCounterRemoteProxy_externalRequestsCount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objects];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)placeCacheRegisterCacheResult:(unsigned __int8)a3 forApp:(id)a4 requestType:(int)a5 timestamp:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v8 = a3;
  id v9 = a6;
  id v10 = a4;
  double v13 = [[GEORequestCounterCacheAddEntry alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  uint64_t v11 = (void *)[v10 copy];

  [(GEORequestCounterCacheAddEntry *)v13 setAppId:v11];
  [(GEORequestCounterCacheAddEntry *)v13 setTimestamp:v9];

  [(GEORequestCounterCacheAddEntry *)v13 setRequestKindRaw:v6];
  [(GEORequestCounterCacheAddEntry *)v13 setResult:v8];
  uint64_t v12 = +[GEOXPCConnection createServerConnectionFor:10 debugIdentifier:@"RequestCounter" eventHandler:0];
  [(GEOXPCRequest *)v13 send:v12];
}

- (void)placeCacheGetCounts:(unint64_t)a3 forApp:(id)a4 inTimeRange:(id)a5 ofType:(int)a6 handler:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = [[GEORequestCounterCacheGetResults alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEORequestCounterCacheGetResults *)v14 setMode:a3];
  SEL v15 = (void *)[v13 copy];

  [(GEORequestCounterCacheGetResults *)v14 setAppId:v15];
  uint64_t v16 = [v12 startDate];
  [(GEORequestCounterCacheGetResults *)v14 setStartTime:v16];

  id v17 = [v12 endDate];

  [(GEORequestCounterCacheGetResults *)v14 setEndTime:v17];
  [(GEORequestCounterCacheGetResults *)v14 setRequestKindRaw:v7];
  id v18 = +[GEOXPCConnection createServerConnectionFor:10 debugIdentifier:@"RequestCounter" eventHandler:0];
  qos_class_self();
  global_workloop = (void *)geo_get_global_workloop();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __86__GEORequestCounterRemoteProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke;
  v21[3] = &unk_1E53DB7A8;
  id v22 = v11;
  id v20 = v11;
  [(GEOXPCRequest *)v14 send:v18 withReply:global_workloop handler:v21];
}

void __86__GEORequestCounterRemoteProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [v9 results];
  if (v5)
  {
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
  }
  else
  {
    uint64_t v8 = [v9 error];
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);
  }
}

@end