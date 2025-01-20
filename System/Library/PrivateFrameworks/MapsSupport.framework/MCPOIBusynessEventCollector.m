@interface MCPOIBusynessEventCollector
+ (void)startProcessingPayload:(id)a3;
- (MCPOIBusynessEventCollector)initWithBusynessData:(id)a3;
- (void)collectBluePOI:(id)a3 analytics:(id)a4;
- (void)collectDifferentialPrivacy:(id)a3;
- (void)collectRealTime;
- (void)dealloc;
- (void)processBluePOI;
- (void)processDifferentialPrivacy;
- (void)processRealTime;
- (void)reportMetrics;
- (void)start;
@end

@implementation MCPOIBusynessEventCollector

- (MCPOIBusynessEventCollector)initWithBusynessData:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MCPOIBusynessEventCollector;
  v6 = [(MCPOIBusynessEventCollector *)&v14 init];
  if (v6)
  {
    [v5 writeToDisk];
    objc_storeStrong((id *)&v6->_poiBusynessData, a3);
    uint64_t v7 = [v5 leechedGEOLocation];
    location = v6->_location;
    v6->_location = (GEOLocation *)v7;

    v6->_rtEnabled = GEOConfigGetBOOL();
    v6->_dpEnabled = GEOConfigGetBOOL();
    v6->_bpEnabled = GEOConfigGetBOOL();
    dispatch_group_t v9 = dispatch_group_create();
    reportingGroup = v6->_reportingGroup;
    v6->_reportingGroup = (OS_dispatch_group *)v9;

    uint64_t v11 = geo_dispatch_queue_create_with_qos();
    eventCollectorQueue = v6->_eventCollectorQueue;
    v6->_eventCollectorQueue = (OS_dispatch_queue *)v11;
  }
  return v6;
}

- (void)dealloc
{
  v3 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "MCPOIBusynessEventCollector.dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)MCPOIBusynessEventCollector;
  [(MCPOIBusynessEventCollector *)&v4 dealloc];
}

+ (void)startProcessingPayload:(id)a3
{
  id v3 = a3;
  objc_super v4 = [[MCPOIBusynessEventCollector alloc] initWithBusynessData:v3];

  [(MCPOIBusynessEventCollector *)v4 start];
}

- (void)start
{
  id v3 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    [(GEOLocation *)self->_location coordinate];
    uint64_t v5 = v4;
    [(GEOLocation *)self->_location coordinate];
    *(_DWORD *)buf = 134283777;
    uint64_t v12 = v5;
    __int16 v13 = 2049;
    uint64_t v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "MCPOIBusynessEventCollector.start, location: %{private}f,%{private}f", buf, 0x16u);
  }

  uint64_t v7 = +[MCPOIBusynessState sharedState];
  [v7 incrementRunCount];

  [(MCPOIBusynessEventCollector *)self processRealTime];
  [(MCPOIBusynessEventCollector *)self processDifferentialPrivacy];
  eventCollectorQueue = self->_eventCollectorQueue;
  reportingGroup = self->_reportingGroup;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DBDC;
  block[3] = &unk_10001C650;
  block[4] = self;
  dispatch_group_notify(reportingGroup, eventCollectorQueue, block);
}

- (void)reportMetrics
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventCollectorQueue);
  BYTE1(v3) = self->_bpCollected;
  LOBYTE(v3) = self->_bpEnabled;
  +[MCPOIBusynessAnalytics reportCompleteWithRTEnabled:rtCollected:rtError:dpEnabled:dpCollected:dpError:bpEnabled:bpCollected:bpError:](MCPOIBusynessAnalytics, "reportCompleteWithRTEnabled:rtCollected:rtError:dpEnabled:dpCollected:dpError:bpEnabled:bpCollected:bpError:", self->_rtEnabled, self->_rtCollected, self->_rtError, self->_dpEnabled, self->_dpCollected, self->_dpError, v3, self->_bpError);
}

- (void)processRealTime
{
  if (self->_rtEnabled)
  {
    dispatch_group_enter((dispatch_group_t)self->_reportingGroup);
    location = self->_location;
    uint64_t Integer = GEOConfigGetInteger();
    eventCollectorQueue = self->_eventCollectorQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000DD08;
    v6[3] = &unk_10001D798;
    v6[4] = self;
    +[GEOPOIBusynessHelper checkIsEnabledForLocation:location radius:Integer workQueue:eventCollectorQueue result:v6];
  }
}

- (void)collectRealTime
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventCollectorQueue);
  int v3 = IOPSDrawingUnlimitedPower();
  if (v3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  +[MCPOIBusynessAnalytics report:v4];
  uint64_t v5 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v6 = [(NSMutableArray *)self->_poiPredictionData count];
    uint64_t v7 = "ON";
    if (v3) {
      uint64_t v7 = "NOT ON";
    }
    *(_DWORD *)buf = 67109378;
    unsigned int v16 = v6;
    __int16 v17 = 2080;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Collecting RT data with %d predictions %s battery", buf, 0x12u);
  }

  [(GEOLocation *)self->_location timestamp];
  v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(GEOLocation *)self->_location coordinate];
  dispatch_group_t v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(GEOLocation *)self->_location coordinate];
  uint64_t v11 = +[NSNumber numberWithDouble:v10];
  [(GEOLocation *)self->_location horizontalAccuracy];
  uint64_t v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(GEOLocation *)self->_location verticalAccuracy];
  __int16 v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  uint64_t v14 = +[NSNumber numberWithInt:[(GEOLocation *)self->_location altitude]];
  +[GEOAPPortal capturePoiBusynessDataWithTimestamp:v8 GEOLatLng_lat:v9 GEOLatLng_lng:v11 horizontalAccuracy:v12 verticalAccuracy:v13 altitude:v14 poiPredictions:self->_poiPredictionData];
}

- (void)processBluePOI
{
  if (self->_bpEnabled)
  {
    int v3 = objc_alloc_init(MCPOIBusynessBluePOIAnalytics);
    dispatch_group_enter((dispatch_group_t)self->_reportingGroup);
    uint64_t v4 = [(MCPOIBusynessData *)self->_poiBusynessData visit];

    [(MCPOIBusynessBluePOIAnalytics *)v3 setIsInVisit:v4 != 0];
    uint64_t v5 = GEOGetPOIBusynessLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "No valid visists, calling fetchInferedPlaceNames:", buf, 2u);
    }

    unsigned int v6 = +[MCPOIBusynessLocationManager sharedLocationManager];
    eventCollectorQueue = self->_eventCollectorQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000E274;
    v9[3] = &unk_10001D7C0;
    v9[4] = self;
    double v10 = v3;
    v8 = v3;
    [v6 fetchInferedPlaceNames:v4 != 0 analytics:v8 completionQueue:eventCollectorQueue completion:v9];
  }
  else
  {
    [(MCPOIBusynessEventCollector *)self collectRealTime];
  }
}

- (void)collectBluePOI:(id)a3 analytics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventCollectorQueue);
  v8 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v15 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Resolving muids for %d BluePOI inferences", buf, 8u);
  }

  dispatch_group_t v9 = objc_alloc_init(MCRoutineHelper);
  eventCollectorQueue = self->_eventCollectorQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000E674;
  v12[3] = &unk_10001D810;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [(MCRoutineHelper *)v9 findMUIDsForPlaceInferences:v6 analytics:v11 completionQueue:eventCollectorQueue completionHandler:v12];
}

- (void)processDifferentialPrivacy
{
  if (self->_dpEnabled)
  {
    if (sub_10000D61C())
    {
      dispatch_group_enter((dispatch_group_t)self->_reportingGroup);
      location = self->_location;
      uint64_t v4 = GEOConfigGetArray();
      eventCollectorQueue = self->_eventCollectorQueue;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10000EAB8;
      v6[3] = &unk_10001D838;
      v6[4] = self;
      +[GEOPOIBusynessHelper generateDPPOIBusynessForLocation:location radii:v4 workQueue:eventCollectorQueue result:v6];
    }
  }
}

- (void)collectDifferentialPrivacy:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventCollectorQueue);
  +[MCPOIBusynessAnalytics report:3];
  uint64_t v5 = +[GEOPOIBusynessHelper dpClientVersionHashWithMCPOIBusynessVersion:@"1"];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  id v6 = (id *)qword_100023A70;
  uint64_t v23 = qword_100023A70;
  if (!qword_100023A70)
  {
    unsigned int v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    __int16 v17 = sub_10000F1E0;
    v18 = &unk_10001D748;
    v19 = &v20;
    id v7 = (void *)sub_10000D7D4();
    v21[3] = (uint64_t)dlsym(v7, "kDPMetadataVersionHash");
    qword_100023A70 = *(void *)(v19[1] + 24);
    id v6 = (id *)v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v6)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  id v24 = *v6;
  v25 = v5;
  id v8 = v24;
  dispatch_group_t v9 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000EEE4;
  v12[3] = &unk_10001D860;
  id v13 = v9;
  id v14 = v5;
  id v10 = v5;
  id v11 = v9;
  [v4 enumerateKeysAndObjectsUsingBlock:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bpError, 0);
  objc_storeStrong((id *)&self->_dpError, 0);
  objc_storeStrong((id *)&self->_rtError, 0);
  objc_storeStrong((id *)&self->_poiPredictionData, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_poiBusynessData, 0);
  objc_storeStrong((id *)&self->_reportingGroup, 0);

  objc_storeStrong((id *)&self->_eventCollectorQueue, 0);
}

@end