@interface GEORequestCounterServer
+ (id)identifier;
+ (id)possibleBackgroundTaskIdentifiers;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (void)addCacheResultWithRequest:(id)a3;
- (void)clearWithMessage:(id)a3;
- (void)externalCountWithRequest:(id)a3;
- (void)externalIncrementWithRequest:(id)a3;
- (void)fetchRoutePreloadSessionsWithMessage:(id)a3;
- (void)getCacheResultsWithRequest:(id)a3;
- (void)incrementWithMessage:(id)a3;
- (void)readProactiveTileDownloadsWithMessage:(id)a3;
- (void)readRequestLogsWithMessage:(id)a3;
- (void)readRequestsWithMessage:(id)a3;
- (void)recordRoutePreloadSessionWithMessage:(id)a3;
- (void)runBackgroundTask:(id)a3;
- (void)setCountersEnabledWithMessage:(id)a3;
@end

@implementation GEORequestCounterServer

+ (id)identifier
{
  return @"requestCounter";
}

- (void)setCountersEnabledWithMessage:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"enabled"];
  id v7 = [v6 BOOLValue];

  v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = NSStringFromSelector(a2);
    v10 = (void *)v9;
    v11 = "NO";
    if (v7) {
      v11 = "YES";
    }
    int v13 = 138478083;
    uint64_t v14 = v9;
    __int16 v15 = 2081;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{private}@ got enabled=%{private}s", (uint8_t *)&v13, 0x16u);
  }
  v12 = +[GEORequestCounter sharedCounter];
  [v12 setCountersEnabled:v7];

  [v4 sendReply:0];
}

- (void)incrementWithMessage:(id)a3
{
  id v36 = a3;
  id v4 = [v36 userInfo];
  v37 = [v4 objectForKeyedSubscript:@"startTime"];
  v35 = [v4 objectForKeyedSubscript:@"endTime"];
  v5 = [v4 objectForKeyedSubscript:@"appID"];
  v6 = [v4 objectForKeyedSubscript:@"xmitB"];
  id v34 = [v6 longLongValue];

  id v7 = [v4 objectForKeyedSubscript:@"recvB"];
  id v33 = [v7 longLongValue];

  v8 = [v4 objectForKeyedSubscript:@"reqType"];
  id v9 = [v8 intValue];

  v10 = [v4 objectForKeyedSubscript:@"cohortID"];
  v11 = [v4 objectForKeyedSubscript:@"reqMode"];
  unsigned int v31 = [v11 intValue];

  unsigned int v12 = (unsigned __int16)v9 & 0x7F00;
  unsigned int v13 = (v9 >> 8) & 0x7F;
  int v14 = 1 << (BYTE1(v9) & 0x7F);
  if ((v14 & 0xC05) != 0) {
    unsigned int v15 = v9;
  }
  else {
    unsigned int v15 = 0;
  }
  if ((v14 & 0xAA) != 0)
  {
    unint64_t v16 = (unint64_t)v9 << 32;
  }
  else
  {
    unsigned int v12 = v15;
    unint64_t v16 = 0;
  }
  if (v13 <= 0xB) {
    uint64_t v17 = v12;
  }
  else {
    uint64_t v17 = 0;
  }
  if (v13 <= 0xB) {
    unint64_t v18 = v16;
  }
  else {
    unint64_t v18 = 0;
  }
  v19 = [v4 objectForKeyedSubscript:@"error"];
  v32 = _geo_NSErrorFromDictionaryRepresentationCopy();

  v20 = [v4 objectForKeyedSubscript:@"iface"];
  id v30 = [v20 unsignedIntegerValue];

  v21 = [v4 objectForKeyedSubscript:@"reqResult"];
  unsigned __int8 v22 = [v21 unsignedIntegerValue];

  v23 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v24 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138478595;
    v39 = v24;
    __int16 v40 = 2113;
    v41 = v5;
    __int16 v42 = 1024;
    int v43 = (int)v9;
    __int16 v44 = 1024;
    int v45 = v22;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{private}@ got appID=%{private}@ type=0x%x result=%hhu", buf, 0x22u);
  }
  unint64_t v25 = v18 | v17;

  v26 = +[GEORequestCountPowerLogger sharedInstance];
  [v26 incrementCountForClient:v5 requestType:v9];

  v27 = +[GEOOfflineStateManager shared];
  if ([v10 length]) {
    v28 = v10;
  }
  else {
    v28 = v5;
  }
  [v35 timeIntervalSinceDate:v37];
  objc_msgSend(v27, "reportResponse:usedInterfaces:requestMode:forCohortId:duration:error:", v25, v30, v31, v28, v32);

  v29 = +[GEORequestCounterPersistence sharedInstance];
  [v29 incrementForApp:v5 startTime:v37 endTime:v35 requestType:v9 result:v22 xmitBytes:v34 recvBytes:v33 usedInterfaces:v30 withCompletion:0];

  [v36 sendReply:0];
}

- (void)readRequestsWithMessage:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"startTime"];
  id v7 = [v5 objectForKeyedSubscript:@"endTime"];
  id v8 = objc_alloc((Class)NSDateInterval);
  id v9 = v6;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = +[NSDate distantPast];
    if (v7)
    {
LABEL_3:
      id v10 = [v8 initWithStartDate:v9 endDate:v7];
      if (v6) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  unsigned int v15 = +[NSDate distantFuture];
  id v10 = [v8 initWithStartDate:v9 endDate:v15];

  if (!v6) {
LABEL_4:
  }

LABEL_5:
  v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138478083;
    v19 = v12;
    __int16 v20 = 2113;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{private}@ got in %{private}@", buf, 0x16u);
  }
  unsigned int v13 = +[GEORequestCounter sharedCounter];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000C254;
  v16[3] = &unk_1000713C0;
  id v17 = v4;
  id v14 = v4;
  [v13 readRequestsPerAppDuring:v10 handler:v16];
}

- (void)readRequestLogsWithMessage:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"startTime"];
  id v7 = [v5 objectForKeyedSubscript:@"endTime"];
  id v8 = objc_alloc((Class)NSDateInterval);
  id v9 = v6;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = +[NSDate distantPast];
    if (v7)
    {
LABEL_3:
      id v10 = [v8 initWithStartDate:v9 endDate:v7];
      if (v6) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  unsigned int v15 = +[NSDate distantFuture];
  id v10 = [v8 initWithStartDate:v9 endDate:v15];

  if (!v6) {
LABEL_4:
  }

LABEL_5:
  v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138478083;
    v19 = v12;
    __int16 v20 = 2113;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{private}@ got in %{private}@", buf, 0x16u);
  }
  unsigned int v13 = +[GEORequestCounter sharedCounter];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000C5C8;
  v16[3] = &unk_100071410;
  id v17 = v4;
  id v14 = v4;
  [v13 readRequestLogsDuring:v10 handler:v16];
}

- (void)clearWithMessage:(id)a3
{
  id v4 = a3;
  v3 = +[GEORequestCounter sharedCounter];
  [v3 clearCounters];

  [v4 sendReply:0];
}

- (void)runBackgroundTask:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  GEOBackgroundTaskReportReportTaskInitiated();

  v6 = [v4 identifier];
  unsigned int v7 = [v6 isEqualToString:GEORequestCounterPowerLoggerBackgroundTaskIdentifier];

  if (v7)
  {
    id v8 = +[GEORequestCountPowerLogger sharedInstance];
    [v8 flushToPowerLog];

    [v4 setTaskCompleted];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GEORequestCounterServer;
    [(GEORequestCounterServer *)&v9 runBackgroundTask:v4];
  }
}

- (void)readProactiveTileDownloadsWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"since"];

  v6 = +[GEORequestCounter sharedCounter];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000C904;
  v8[3] = &unk_100071410;
  id v9 = v3;
  id v7 = v3;
  [v6 readProactiveTileDownloadsSince:v5 handler:v8];
}

- (void)recordRoutePreloadSessionWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"start"];
  +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(unint64_t)[v5 unsignedIntegerValue]);
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  v6 = [v3 userInfo];
  id v7 = [v6 objectForKeyedSubscript:@"end"];
  id v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(unint64_t)[v7 unsignedIntegerValue]);

  id v9 = [v3 userInfo];
  id v10 = [v9 objectForKeyedSubscript:@"transport_type"];
  id v11 = [v10 integerValue];

  unsigned int v12 = [v3 userInfo];
  unsigned int v13 = [v12 objectForKeyedSubscript:@"tiles_preloaded"];
  id v14 = [v13 unsignedIntegerValue];

  unsigned int v15 = [v3 userInfo];
  unint64_t v16 = [v15 objectForKeyedSubscript:@"tiles_used"];
  id v17 = [v16 unsignedIntegerValue];

  unint64_t v18 = [v3 userInfo];

  v19 = [v18 objectForKeyedSubscript:@"tiles_missed"];
  id v20 = [v19 unsignedIntegerValue];

  id v21 = +[GEORequestCounter sharedCounter];
  id v22 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v23 endDate:v8];
  [v21 recordRoutePreloadSessionAt:v22 transportType:v11 tilesPreloaded:v14 tilesUsed:v17 tilesMissed:v20];
}

- (void)fetchRoutePreloadSessionsWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"since"];
  v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(unint64_t)[v5 unsignedIntegerValue]);

  id v7 = +[GEORequestCounter sharedCounter];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000CD80;
  v10[3] = &unk_100071438;
  id v11 = v3;
  id v8 = v3;
  id v9 = +[GEOXPCConnection defaultXPCServerConnectionQueue];
  [v7 fetchRoutePreloadSessionsFrom:v6 completion:v10 completionQueue:v9];
}

- (void)externalIncrementWithRequest:(id)a3
{
  id v13 = [a3 info];
  id v3 = +[GEORequestCounterPersistence sharedInstance];
  id v4 = [v13 appId];
  v5 = [v13 startTime];
  v6 = [v13 endTime];
  id v7 = [v13 xmitBytes];
  id v8 = [v13 recvBytes];
  id v9 = [v13 usedInterface];
  id v10 = [v13 requestType];
  id v11 = [v13 requestSubtype];
  unsigned int v12 = [v13 source];
  [v3 incrementExternalForApp:v4 startTime:v5 endTime:v6 xmitBytes:v7 recvBytes:v8 usedInterfaces:v9 requestType:v10 requestSubtype:v11 source:v12];
}

- (void)externalCountWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = +[GEORequestCounterPersistence sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000D064;
  v6[3] = &unk_100071438;
  id v7 = v3;
  id v5 = v3;
  [v4 externalRequestsCount:v6];
}

- (void)addCacheResultWithRequest:(id)a3
{
  id v3 = a3;
  id v8 = +[GEORequestCounter sharedCounter];
  id v4 = [v3 result];
  id v5 = [v3 appId];
  id v6 = [v3 requestKindRaw];
  id v7 = [v3 timestamp];

  [v8 placeCacheRegisterCacheResult:v4 forApp:v5 requestType:v6 timestamp:v7];
}

- (void)getCacheResultsWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)GEORequestCounterCacheGetResultsReply) initWithRequest:v3];
  id v5 = [v3 startTime];
  if (v5)
  {
  }
  else
  {
    id v6 = [v3 endTime];

    if (!v6) {
      goto LABEL_12;
    }
  }
  id v7 = objc_alloc((Class)NSDateInterval);
  id v8 = [v3 startTime];
  id v9 = v8;
  if (!v8)
  {
    id v9 = +[NSDate distantPast];
  }
  id v10 = [v3 endTime];
  if (v10)
  {
    id v6 = [v7 initWithStartDate:v9 endDate:v10];
  }
  else
  {
    id v11 = +[NSDate distantFuture];
    id v6 = [v7 initWithStartDate:v9 endDate:v11];
  }
  if (!v8) {

  }
LABEL_12:
  unsigned int v12 = +[GEORequestCounter sharedCounter];
  id v13 = [v3 mode];
  id v14 = [v3 appId];
  id v15 = [v3 requestKindRaw];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000D398;
  v17[3] = &unk_100071410;
  id v18 = v4;
  id v16 = v4;
  [v12 placeCacheGetCounts:v13 forApp:v14 inTimeRange:v6 ofType:v15 handler:v17];
}

+ (id)possibleBackgroundTaskIdentifiers
{
  return &off_100077948;
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008D68(v10);
  BOOL v14 = 0;
  if (v13 > 1561)
  {
    if (v13 > 2614)
    {
      switch(v13)
      {
        case 2615:
          if (sub_100019858(v12, v11, @"requestCounter", v10, &off_1000779F0, 0))
          {
            id v30 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
            id v16 = v30;
            BOOL v14 = v30 != 0;
            if (v30)
            {
              [v30 setSignpostId:a6];
              [(GEORequestCounterServer *)self fetchRoutePreloadSessionsWithMessage:v16];
              goto LABEL_48;
            }
            goto LABEL_49;
          }
          goto LABEL_50;
        case 2617:
          if (sub_100019858(v12, v11, @"requestCounter", v10, &off_1000779D8, 0))
          {
            id v31 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
            id v16 = v31;
            BOOL v14 = v31 != 0;
            if (v31)
            {
              [v31 setSignpostId:a6];
              [(GEORequestCounterServer *)self recordRoutePreloadSessionWithMessage:v16];
              goto LABEL_48;
            }
            goto LABEL_49;
          }
          goto LABEL_50;
        case 2690:
          if (sub_100019858(v12, v11, @"requestCounter", v10, &off_1000779C0, 0))
          {
            id v20 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
            id v16 = v20;
            BOOL v14 = v20 != 0;
            if (v20)
            {
              [v20 setSignpostId:a6];
              [(GEORequestCounterServer *)self readProactiveTileDownloadsWithMessage:v16];
              goto LABEL_48;
            }
            goto LABEL_49;
          }
          goto LABEL_50;
      }
    }
    else
    {
      switch(v13)
      {
        case 1562:
          if (sub_100019858(v12, v11, @"requestCounter", v10, &off_100077990, 0))
          {
            id v23 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
            id v16 = v23;
            BOOL v14 = v23 != 0;
            if (v23)
            {
              [v23 setSignpostId:a6];
              [(GEORequestCounterServer *)self readRequestLogsWithMessage:v16];
              goto LABEL_48;
            }
            goto LABEL_49;
          }
          goto LABEL_50;
        case 1800:
          uint64_t v24 = objc_opt_class();
          unint64_t v25 = sub_100008DBC(@"requestCounter", v10, v11, v24, v12);
          id v16 = v25;
          BOOL v14 = v25 != 0;
          if (v25)
          {
            [v25 setSignpostId:a6];
            [(GEORequestCounterServer *)self externalIncrementWithRequest:v16];
            goto LABEL_48;
          }
          goto LABEL_49;
        case 1866:
          if (sub_100019858(v12, v11, @"requestCounter", v10, &off_100077960, 0))
          {
            id v17 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
            id v16 = v17;
            BOOL v14 = v17 != 0;
            if (v17)
            {
              [v17 setSignpostId:a6];
              [(GEORequestCounterServer *)self setCountersEnabledWithMessage:v16];
              goto LABEL_48;
            }
LABEL_49:

            break;
          }
LABEL_50:
          BOOL v14 = 1;
          break;
      }
    }
  }
  else if (v13 > 1387)
  {
    switch(v13)
    {
      case 1388:
        uint64_t v26 = objc_opt_class();
        v27 = sub_100008DBC(@"requestCounter", v10, v11, v26, v12);
        id v16 = v27;
        BOOL v14 = v27 != 0;
        if (v27)
        {
          [v27 setSignpostId:a6];
          [(GEORequestCounterServer *)self externalCountWithRequest:v16];
          goto LABEL_48;
        }
        goto LABEL_49;
      case 1404:
        uint64_t v28 = objc_opt_class();
        v29 = sub_100008DBC(@"requestCounter", v10, v11, v28, v12);
        id v16 = v29;
        BOOL v14 = v29 != 0;
        if (v29)
        {
          [v29 setSignpostId:a6];
          [(GEORequestCounterServer *)self addCacheResultWithRequest:v16];
          goto LABEL_48;
        }
        goto LABEL_49;
      case 1542:
        BOOL v14 = 1;
        if (sub_100019858(v12, v11, @"requestCounter", v10, &off_100077A08, 1))
        {
          uint64_t v18 = objc_opt_class();
          v19 = sub_100008DBC(@"requestCounter", v10, v11, v18, v12);
          id v16 = v19;
          BOOL v14 = v19 != 0;
          if (v19)
          {
            [v19 setSignpostId:a6];
            [(GEORequestCounterServer *)self getCacheResultsWithRequest:v16];
            goto LABEL_48;
          }
          goto LABEL_49;
        }
        break;
    }
  }
  else
  {
    switch(v13)
    {
      case 519:
        if (sub_100019858(v12, v11, @"requestCounter", v10, &off_1000779A8, 0))
        {
          id v21 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
          id v16 = v21;
          BOOL v14 = v21 != 0;
          if (v21)
          {
            [v21 setSignpostId:a6];
            [(GEORequestCounterServer *)self clearWithMessage:v16];
            goto LABEL_48;
          }
          goto LABEL_49;
        }
        goto LABEL_50;
      case 965:
        id v22 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
        id v16 = v22;
        BOOL v14 = v22 != 0;
        if (v22)
        {
          [v22 setSignpostId:a6];
          [(GEORequestCounterServer *)self incrementWithMessage:v16];
          goto LABEL_48;
        }
        goto LABEL_49;
      case 1272:
        if (sub_100019858(v12, v11, @"requestCounter", v10, &off_100077978, 0))
        {
          id v15 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
          id v16 = v15;
          BOOL v14 = v15 != 0;
          if (v15)
          {
            [v15 setSignpostId:a6];
            [(GEORequestCounterServer *)self readRequestsWithMessage:v16];
LABEL_48:
            BOOL v14 = 1;
            goto LABEL_49;
          }
          goto LABEL_49;
        }
        goto LABEL_50;
    }
  }

  return v14;
}

@end