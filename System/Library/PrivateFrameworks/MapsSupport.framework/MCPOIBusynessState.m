@interface MCPOIBusynessState
+ (id)sharedState;
- (id)initInternal;
- (unint64_t)numberOfPlaceInferenceInLastDay;
- (unint64_t)numberOfRunsInLastDay;
- (unint64_t)numberOfRunsInLastHour;
- (void)_getLastDay:(id)a3;
- (void)_loadState;
- (void)_saveStateIsolated;
- (void)incrementPlaceInferenceCount;
- (void)incrementRunCount;
@end

@implementation MCPOIBusynessState

+ (id)sharedState
{
  if (qword_1000239E0 != -1) {
    dispatch_once(&qword_1000239E0, &stru_10001C868);
  }
  v2 = (void *)qword_1000239D8;

  return v2;
}

- (id)initInternal
{
  v9.receiver = self;
  v9.super_class = (Class)MCPOIBusynessState;
  v2 = [(MCPOIBusynessState *)&v9 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v3;

    [(MCPOIBusynessState *)v2 _loadState];
    global_queue = (void *)geo_get_global_queue();
    uint64_t v6 = _GEOConfigAddBlockListenerForKey();
    id stateListener = v2->_stateListener;
    v2->_id stateListener = (id)v6;
  }
  return v2;
}

- (void)_loadState
{
}

- (void)_saveStateIsolated
{
  geo_assert_isolated();
  v9[0] = @"countPerHour";
  uint64_t v3 = +[NSNumber numberWithUnsignedInteger:self->_countPerHour];
  v10[0] = v3;
  v9[1] = @"countPerDay";
  v4 = +[NSNumber numberWithUnsignedInteger:self->_countPerDay];
  v10[1] = v4;
  v9[2] = @"piCountPerDay";
  v5 = +[NSNumber numberWithUnsignedInteger:self->_placeInferenceCountPerDay];
  lastHourReset = self->_lastHourReset;
  lastDayReset = self->_lastDayReset;
  v10[2] = v5;
  v10[3] = lastHourReset;
  v9[3] = @"lastHourReset";
  v9[4] = @"lastDayReset";
  v10[4] = lastDayReset;
  v8 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];

  GEOConfigSetDictionary();
}

- (void)incrementRunCount
{
}

- (void)incrementPlaceInferenceCount
{
}

- (unint64_t)numberOfRunsInLastHour
{
  +[NSDate date];
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  geo_isolate_sync();
  unint64_t v2 = v6[3];

  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_getLastDay:(id)a3
{
  id v3 = a3;
  uint64_t v6 = +[NSDate date];
  uint64_t v7 = v3;
  id v4 = v3;
  id v5 = v6;
  geo_isolate_sync();
}

- (unint64_t)numberOfRunsInLastDay
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000060B8;
  v4[3] = &unk_10001C628;
  v4[4] = self;
  v4[5] = &v5;
  [(MCPOIBusynessState *)self _getLastDay:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unint64_t)numberOfPlaceInferenceInLastDay
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006188;
  v4[3] = &unk_10001C628;
  v4[4] = self;
  v4[5] = &v5;
  [(MCPOIBusynessState *)self _getLastDay:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolater, 0);
  objc_storeStrong(&self->_stateListener, 0);
  objc_storeStrong((id *)&self->_lastDayReset, 0);

  objc_storeStrong((id *)&self->_lastHourReset, 0);
}

@end