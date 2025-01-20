@interface CLLocationUpdater
+ (CLLocationUpdater)liveUpdaterWithConfiguration:(CLLiveUpdateConfiguration)configuration queue:(dispatch_queue_t)queue handler:(void *)handler;
+ (CLLocationUpdater)liveUpdaterWithQueue:(dispatch_queue_t)queue handler:(void *)handler;
+ (id)_historicalUpdaterWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 dateInterval:(id)a5 sampleCount:(int)a6 queue:(id)a7 handler:(id)a8;
+ (id)_historicalUpdaterWithDateInterval:(id)a3 sampleCount:(int)a4 queue:(id)a5 handler:(id)a6;
+ (id)_liveUpdaterWithConfiguration:(int64_t)a3 queue:(id)a4 handler:(id)a5;
+ (id)_liveUpdaterWithQueue:(id)a3 handler:(id)a4;
+ (id)historicalUpdaterWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 dateInterval:(id)a5 sampleCount:(int)a6 locationManager:(id)a7 queue:(id)a8 handler:(id)a9;
+ (id)historicalUpdaterWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 dateInterval:(id)a5 sampleCount:(int)a6 queue:(id)a7 handler:(id)a8;
+ (id)historicalUpdaterWithDateInterval:(id)a3 sampleCount:(int)a4 locationManager:(id)a5 queue:(id)a6 handler:(id)a7;
+ (id)historicalUpdaterWithDateInterval:(id)a3 sampleCount:(int)a4 queue:(id)a5 handler:(id)a6;
+ (id)liveUpdaterWithConfiguration:(int64_t)a3 locationManager:(id)a4 queue:(id)a5 handler:(id)a6;
- (BOOL)shouldBeRunning;
- (CLLocationManager)manager;
- (CLLocationUpdater)initWithRegistrationMessageName:(const char *)a3 messagePayload:(id)a4 locationManager:(id)a5 queue:(id)a6 handler:(id)a7;
- (NSData)storageToken;
- (NSString)identityToken;
- (id).cxx_construct;
- (id)weakClient;
- (void)createConnection;
- (void)dealloc;
- (void)destroyConnection;
- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3;
- (void)handleMessageDiagnostics:(shared_ptr<CLConnectionMessage>)a3;
- (void)handleMessageHistoricalLocations:(shared_ptr<CLConnectionMessage>)a3;
- (void)handleMessageHistoricalLocationsFinished:(shared_ptr<CLConnectionMessage>)a3;
- (void)handleMessageLocation:(shared_ptr<CLConnectionMessage>)a3;
- (void)handleMessageLocationUnavailable:(shared_ptr<CLConnectionMessage>)a3;
- (void)invalidate;
- (void)manageConnection;
- (void)pause;
- (void)resume;
- (void)setHandler:(id)a3;
- (void)setIdentityToken:(id)a3;
- (void)setManager:(id)a3;
- (void)setShouldBeRunning:(BOOL)a3;
- (void)setStorageToken:(id)a3;
- (void)setWeakClient:(id)a3;
- (void)tearDown;
- (void)updateIdentityToken:(id)a3 withStorageToken:(id)a4;
@end

@implementation CLLocationUpdater

+ (id)historicalUpdaterWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 dateInterval:(id)a5 sampleCount:(int)a6 queue:(id)a7 handler:(id)a8
{
  return (id)MEMORY[0x1F4181798](CLLocationUpdater, sel__historicalUpdaterWithCenter_radius_dateInterval_sampleCount_queue_handler_);
}

+ (id)historicalUpdaterWithDateInterval:(id)a3 sampleCount:(int)a4 queue:(id)a5 handler:(id)a6
{
  return (id)MEMORY[0x1F4181798](CLLocationUpdater, sel__historicalUpdaterWithDateInterval_sampleCount_queue_handler_);
}

+ (CLLocationUpdater)liveUpdaterWithConfiguration:(CLLiveUpdateConfiguration)configuration queue:(dispatch_queue_t)queue handler:(void *)handler
{
  return (CLLocationUpdater *)MEMORY[0x1F4181798](CLLocationUpdater, sel__liveUpdaterWithConfiguration_queue_handler_);
}

+ (CLLocationUpdater)liveUpdaterWithQueue:(dispatch_queue_t)queue handler:(void *)handler
{
  return (CLLocationUpdater *)MEMORY[0x1F4181798](a1, sel__liveUpdaterWithConfiguration_queue_handler_);
}

+ (id)_liveUpdaterWithConfiguration:(int64_t)a3 queue:(id)a4 handler:(id)a5
{
  +[CLLocationManager weakSharedInstance];

  return (id)MEMORY[0x1F4181798](CLLocationUpdater, sel_liveUpdaterWithConfiguration_locationManager_queue_handler_);
}

+ (id)_liveUpdaterWithQueue:(id)a3 handler:(id)a4
{
  return (id)MEMORY[0x1F4181798](CLLocationUpdater, sel__liveUpdaterWithConfiguration_queue_handler_);
}

+ (id)_historicalUpdaterWithDateInterval:(id)a3 sampleCount:(int)a4 queue:(id)a5 handler:(id)a6
{
  +[CLLocationManager weakSharedInstance];

  return (id)MEMORY[0x1F4181798](CLLocationUpdater, sel_historicalUpdaterWithDateInterval_sampleCount_locationManager_queue_handler_);
}

+ (id)_historicalUpdaterWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 dateInterval:(id)a5 sampleCount:(int)a6 queue:(id)a7 handler:(id)a8
{
  +[CLLocationManager weakSharedInstance];

  return (id)MEMORY[0x1F4181798](CLLocationUpdater, sel_historicalUpdaterWithCenter_radius_dateInterval_sampleCount_locationManager_queue_handler_);
}

- (CLLocationUpdater)initWithRegistrationMessageName:(const char *)a3 messagePayload:(id)a4 locationManager:(id)a5 queue:(id)a6 handler:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)CLLocationUpdater;
  v13 = [(CLLocationUpdater *)&v20 init];
  if (v13)
  {
    v14 = _os_activity_create(&dword_1906B8000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v14, &v19);

    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
    v15 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 68290563;
      int v22 = 0;
      __int16 v23 = 2082;
      v24 = "";
      __int16 v25 = 2082;
      v26 = "activity";
      __int16 v27 = 2114;
      v28 = v16;
      __int16 v29 = 2050;
      v30 = v13;
      __int16 v31 = 2082;
      v32 = a3;
      __int16 v33 = 2113;
      id v34 = a4;
      __int16 v35 = 2050;
      id v36 = a5;
      _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"name\":%{public, location:escape_only}s, \"messagePayload\":%{private, location:escape_only}@, \"manager\":\"%{public}p\"}", buf, 0x4Eu);
    }
    if (!a6)
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
      }
      v17 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        int v22 = 0;
        __int16 v23 = 2082;
        v24 = "";
        __int16 v25 = 2050;
        v26 = (const char *)v13;
        _os_log_impl(&dword_1906B8000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater has nil callback queue; Creating locally\", \"self\":\"%{public}p\"}",
          buf,
          0x1Cu);
      }
      a6 = +[CLLocationManager sharedQueue];
    }
    v13->_silo = (CLDispatchSilo *)[objc_alloc(MEMORY[0x1E4F73038]) initWithUnderlyingQueue:a6 bePermissive:0];
    [(CLLocationUpdater *)v13 setManager:a5];
    v13->_messageName = (NSString *)(id)[NSString stringWithUTF8String:a3];
    v13->_mutableMsgDictionary = (NSMutableDictionary *)[a4 mutableCopy];
    [(CLLocationUpdater *)v13 setIdentityToken:0];
    [(CLLocationUpdater *)v13 setShouldBeRunning:0];
    v13->_lastTimestamp = 0.0;
    if (a7) {
      v13->_clientCallback = _Block_copy(a7);
    }
    os_activity_scope_leave(&v19);
  }
  return v13;
}

+ (id)liveUpdaterWithConfiguration:(int64_t)a3 locationManager:(id)a4 queue:(id)a5 handler:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (([a4 isMasquerading] & 1) == 0 && !sub_190717A7C()) {
    NSLog(&cfstr_ErrorCllocatio.isa);
  }
  objc_super v20 = @"config";
  v21[0] = [NSNumber numberWithInteger:a3];
  v10 = -[CLLocationUpdater initWithRegistrationMessageName:messagePayload:locationManager:queue:handler:]([CLLocationUpdater alloc], "initWithRegistrationMessageName:messagePayload:locationManager:queue:handler:", "LocationUpdaterLive/kCLConnectionMessage", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1], a4, a5, a6);
  [a4 addIdentifiableClient:v10];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
  }
  v11 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 68289282;
    int v15 = 0;
    __int16 v16 = 2082;
    v17 = "";
    __int16 v18 = 2050;
    os_activity_scope_state_s v19 = v10;
    _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater liveUpdaterWithConfiguration:queue:handler: created\", \"updater\":\"%{public}p\"}", (uint8_t *)&v14, 0x1Cu);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
  }
  v12 = qword_1EB2713E0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
  {
    int v14 = 68289282;
    int v15 = 0;
    __int16 v16 = 2082;
    v17 = "";
    __int16 v18 = 2050;
    os_activity_scope_state_s v19 = v10;
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater liveUpdaterWithConfiguration:queue:handler: created", "{\"msg%{public}.0s\":\"#locationUpdater liveUpdaterWithConfiguration:queue:handler: created\", \"updater\":\"%{public}p\"}", (uint8_t *)&v14, 0x1Cu);
  }
  return v10;
}

+ (id)historicalUpdaterWithDateInterval:(id)a3 sampleCount:(int)a4 locationManager:(id)a5 queue:(id)a6 handler:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
    __int16 v16 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      int v25 = 0;
      __int16 v26 = 2082;
      __int16 v27 = "";
      __int16 v28 = 2050;
      id v29 = a1;
      _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#locationUpdater, interestInterval must be valid\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
      }
    }
    v17 = qword_1EB2713E0;
    if (!os_signpost_enabled((os_log_t)qword_1EB2713E0)) {
      return 0;
    }
    *(_DWORD *)buf = 68289282;
    int v25 = 0;
    __int16 v26 = 2082;
    __int16 v27 = "";
    __int16 v28 = 2050;
    id v29 = a1;
    __int16 v18 = "#locationUpdater, interestInterval must be valid";
    os_activity_scope_state_s v19 = "{\"msg%{public}.0s\":\"#locationUpdater, interestInterval must be valid\", \"self\":\"%{public}p\"}";
    goto LABEL_24;
  }
  uint64_t v8 = *(void *)&a4;
  if (a4 <= 0)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
    objc_super v20 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      int v25 = 0;
      __int16 v26 = 2082;
      __int16 v27 = "";
      __int16 v28 = 2050;
      id v29 = a1;
      _os_log_impl(&dword_1906B8000, v20, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#locationUpdater, sampleCount must be greater than 0\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
      }
    }
    v17 = qword_1EB2713E0;
    if (!os_signpost_enabled((os_log_t)qword_1EB2713E0)) {
      return 0;
    }
    *(_DWORD *)buf = 68289282;
    int v25 = 0;
    __int16 v26 = 2082;
    __int16 v27 = "";
    __int16 v28 = 2050;
    id v29 = a1;
    __int16 v18 = "#locationUpdater, sampleCount must be greater than 0";
    os_activity_scope_state_s v19 = "{\"msg%{public}.0s\":\"#locationUpdater, sampleCount must be greater than 0\", \"self\":\"%{public}p\"}";
LABEL_24:
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v18, v19, buf, 0x1Cu);
    return 0;
  }
  v23[0] = &unk_1EE023868;
  v23[1] = objc_msgSend(a3, "startDate", @"kCLConnectionMessageTranscriptFetchRadiusKey", @"kCLConnectionMessageLocationUpdaterStartDateKey");
  v22[2] = @"kCLConnectionMessageLocationUpdaterEndDateKey";
  v23[2] = [a3 endDate];
  v22[3] = @"kCLConnectionMessageTranscriptFetchSampleCountKey";
  v23[3] = [NSNumber numberWithInt:v8];
  v13 = -[CLLocationUpdater initWithRegistrationMessageName:messagePayload:locationManager:queue:handler:]([CLLocationUpdater alloc], "initWithRegistrationMessageName:messagePayload:locationManager:queue:handler:", "LocationUpdaterHistorical/kCLConnectionMessage", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4], a5, a6, a7);
  [a5 addIdentifiableClient:v13];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
  }
  int v14 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v25 = 0;
    __int16 v26 = 2082;
    __int16 v27 = "";
    __int16 v28 = 2050;
    id v29 = v13;
    _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater historicalUpdaterWithDateInterval:sampleCount:sampleCount:queue:handler: created\", \"updater\":\"%{public}p\"}", buf, 0x1Cu);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
  }
  int v15 = qword_1EB2713E0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
  {
    *(_DWORD *)buf = 68289282;
    int v25 = 0;
    __int16 v26 = 2082;
    __int16 v27 = "";
    __int16 v28 = 2050;
    id v29 = v13;
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater historicalUpdaterWithDateInterval:sampleCount:sampleCount:queue:handler: created", "{\"msg%{public}.0s\":\"#locationUpdater historicalUpdaterWithDateInterval:sampleCount:sampleCount:queue:handler: created\", \"updater\":\"%{public}p\"}", buf, 0x1Cu);
  }
  return v13;
}

+ (id)historicalUpdaterWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 dateInterval:(id)a5 sampleCount:(int)a6 locationManager:(id)a7 queue:(id)a8 handler:(id)a9
{
  uint64_t v12 = *(void *)&a6;
  id v13 = a5;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a5)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v19 = [MEMORY[0x1E4F1C9C8] distantPast];
    id v13 = (id)objc_msgSend(v18, "initWithStartDate:endDate:", v19, objc_msgSend(MEMORY[0x1E4F1C9C8], "now"));
  }
  if ((int)v12 <= 0)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
    __int16 v23 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      int v29 = 0;
      __int16 v30 = 2082;
      __int16 v31 = "";
      __int16 v32 = 2050;
      id v33 = a1;
      _os_log_impl(&dword_1906B8000, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#locationUpdater, sampleCount must be greater than 0\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
      }
    }
    v24 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)buf = 68289282;
      int v29 = 0;
      __int16 v30 = 2082;
      __int16 v31 = "";
      __int16 v32 = 2050;
      id v33 = a1;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater, sampleCount must be greater than 0", "{\"msg%{public}.0s\":\"#locationUpdater, sampleCount must be greater than 0\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
    }
    return 0;
  }
  else
  {
    v27[0] = objc_msgSend(NSNumber, "numberWithDouble:", latitude, @"kCLConnectionMessageTranscriptFetchCenterLatitudeKey");
    v26[1] = @"kCLConnectionMessageTranscriptFetchCenterLongitudeKey";
    v27[1] = [NSNumber numberWithDouble:longitude];
    v26[2] = @"kCLConnectionMessageTranscriptFetchRadiusKey";
    v27[2] = [NSNumber numberWithDouble:a4];
    v26[3] = @"kCLConnectionMessageLocationUpdaterStartDateKey";
    v27[3] = [v13 startDate];
    v26[4] = @"kCLConnectionMessageLocationUpdaterEndDateKey";
    v27[4] = [v13 endDate];
    v26[5] = @"kCLConnectionMessageTranscriptFetchSampleCountKey";
    v27[5] = [NSNumber numberWithInt:v12];
    objc_super v20 = -[CLLocationUpdater initWithRegistrationMessageName:messagePayload:locationManager:queue:handler:]([CLLocationUpdater alloc], "initWithRegistrationMessageName:messagePayload:locationManager:queue:handler:", "LocationUpdaterHistorical/kCLConnectionMessage", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:6], a7, a8, a9);
    [a7 addIdentifiableClient:v20];
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
    v21 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v29 = 0;
      __int16 v30 = 2082;
      __int16 v31 = "";
      __int16 v32 = 2050;
      id v33 = v20;
      _os_log_impl(&dword_1906B8000, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater historicalUpdaterWithCenter:radius:dateInterval:sampleCount:queue:handler: created\", \"updater\":\"%{public}p\"}", buf, 0x1Cu);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
      }
    }
    int v22 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)buf = 68289282;
      int v29 = 0;
      __int16 v30 = 2082;
      __int16 v31 = "";
      __int16 v32 = 2050;
      id v33 = v20;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater historicalUpdaterWithCenter:radius:dateInterval:sampleCount:queue:handler: created", "{\"msg%{public}.0s\":\"#locationUpdater historicalUpdaterWithCenter:radius:dateInterval:sampleCount:queue:handler: created\", \"updater\":\"%{public}p\"}", buf, 0x1Cu);
    }
  }
  return v20;
}

- (void)pause
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(CLLocationUpdater *)self setShouldBeRunning:0];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
  }
  v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    int v13 = 0;
    __int16 v14 = 2082;
    int v15 = "";
    __int16 v16 = 2082;
    v17 = (CLLocationUpdater *)"activity";
    __int16 v18 = 2114;
    uint64_t v19 = v6;
    __int16 v20 = 2050;
    v21 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
  }
  v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v13 = 0;
    __int16 v14 = 2082;
    int v15 = "";
    __int16 v16 = 2050;
    v17 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater pause is called\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
  }
  uint64_t v8 = qword_1EB2713E0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
  {
    *(_DWORD *)buf = 68289282;
    int v13 = 0;
    __int16 v14 = 2082;
    int v15 = "";
    __int16 v16 = 2050;
    v17 = self;
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater pause is called", "{\"msg%{public}.0s\":\"#locationUpdater pause is called\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
  }
  silo = self->_silo;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1907385BC;
  v10[3] = &unk_1E5696BF0;
  v10[4] = self;
  [(CLDispatchSilo *)silo async:v10];
  os_activity_scope_leave(&state);
}

- (void)resume
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(CLLocationUpdater *)self setShouldBeRunning:1];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
  }
  v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    int v13 = 0;
    __int16 v14 = 2082;
    int v15 = "";
    __int16 v16 = 2082;
    v17 = (CLLocationUpdater *)"activity";
    __int16 v18 = 2114;
    uint64_t v19 = v6;
    __int16 v20 = 2050;
    v21 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
  }
  v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v13 = 0;
    __int16 v14 = 2082;
    int v15 = "";
    __int16 v16 = 2050;
    v17 = self;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater resume is called\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
  }
  uint64_t v8 = qword_1EB2713E0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
  {
    *(_DWORD *)buf = 68289282;
    int v13 = 0;
    __int16 v14 = 2082;
    int v15 = "";
    __int16 v16 = 2050;
    v17 = self;
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater resume is called", "{\"msg%{public}.0s\":\"#locationUpdater resume is called\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
  }
  silo = self->_silo;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1907388A4;
  v10[3] = &unk_1E5696BF0;
  v10[4] = self;
  [(CLDispatchSilo *)silo async:v10];
  os_activity_scope_leave(&state);
}

- (void)updateIdentityToken:(id)a3 withStorageToken:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v7 = _os_activity_create(&dword_1906B8000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
  }
  uint64_t v8 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    int v14 = 0;
    __int16 v15 = 2082;
    __int16 v16 = "";
    __int16 v17 = 2082;
    __int16 v18 = "activity";
    __int16 v19 = 2114;
    __int16 v20 = v9;
    __int16 v21 = 2050;
    uint64_t v22 = self;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  silo = self->_silo;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_190738C44;
  v11[3] = &unk_1E5696EE8;
  v11[4] = self;
  v11[5] = a3;
  [(CLDispatchSilo *)silo async:v11];
  os_activity_scope_leave(&state);
}

- (void)tearDown
{
  self->_mutableMsgDictionary = 0;
  self->_messageName = 0;
  [(CLLocationUpdater *)self setIdentityToken:0];
  [(CLLocationUpdater *)self setStorageToken:0];
  _Block_release(self->_clientCallback);
  self->_clientCallback = 0;
  [(CLLocationUpdater *)self setManager:0];

  self->_silo = 0;
}

- (void)invalidate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
  }
  v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    int v11 = 0;
    __int16 v12 = 2082;
    int v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "activity";
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2050;
    __int16 v19 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationUpdater *)self setShouldBeRunning:0];
  silo = self->_silo;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_190738ED8;
  v8[3] = &unk_1E5696BF0;
  v8[4] = self;
  [(CLDispatchSilo *)silo async:v8];
  os_activity_scope_leave(&state);
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
  }
  v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 2082;
    __int16 v17 = "activity";
    __int16 v18 = 2114;
    __int16 v19 = v6;
    __int16 v20 = 2050;
    __int16 v21 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLLocationUpdater *)self setShouldBeRunning:0];
  silo = self->_silo;
  locationdConnection = self->_locationdConnection;
  self->_locationdConnection = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_190739108;
  v10[3] = &unk_1E5696EA0;
  v10[4] = locationdConnection;
  [(CLDispatchSilo *)silo async:v10];
  [(CLLocationUpdater *)self tearDown];
  v9.receiver = self;
  v9.super_class = (Class)CLLocationUpdater;
  [(CLLocationUpdater *)&v9 dealloc];
  os_activity_scope_leave(&state);
}

- (void)manageConnection
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_1906B8000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &v7);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
  }
  v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    int v9 = 0;
    __int16 v10 = 2082;
    int v11 = "";
    __int16 v12 = 2082;
    int v13 = "activity";
    __int16 v14 = 2114;
    __int16 v15 = v6;
    __int16 v16 = 2050;
    __int16 v17 = self;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  [(CLDispatchSilo *)self->_silo assertInside];
  if ([(CLLocationUpdater *)self shouldBeRunning]
    && [(CLLocationUpdater *)self identityToken])
  {
    [(CLLocationUpdater *)self createConnection];
  }
  else
  {
    [(CLLocationUpdater *)self destroyConnection];
  }
  os_activity_scope_leave(&v7);
}

- (void)createConnection
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(CLDispatchSilo *)self->_silo assertInside];
  if (!self->_locationdConnection)
  {
    if (self->_clientCallback) {
      operator new();
    }
    if (qword_1EB2713E8 != -1) {
      goto LABEL_15;
    }
    while (1)
    {
      v3 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&uint8_t buf[4] = 0;
        __int16 v7 = 2082;
        uint64_t v8 = "";
        __int16 v9 = 2082;
        __int16 v10 = "assert";
        __int16 v11 = 2081;
        __int16 v12 = "_clientCallback != nullptr";
        _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#locationUpdater client callback handler should not be nil when attempting to -resume\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
        }
      }
      v4 = qword_1EB2713E0;
      if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
      {
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&uint8_t buf[4] = 0;
        __int16 v7 = 2082;
        uint64_t v8 = "";
        __int16 v9 = 2082;
        __int16 v10 = "assert";
        __int16 v11 = 2081;
        __int16 v12 = "_clientCallback != nullptr";
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater client callback handler should not be nil when attempting to -resume", "{\"msg%{public}.0s\":\"#locationUpdater client callback handler should not be nil when attempting to -resume\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
        }
      }
      v5 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&uint8_t buf[4] = 0;
        __int16 v7 = 2082;
        uint64_t v8 = "";
        __int16 v9 = 2082;
        __int16 v10 = "assert";
        __int16 v11 = 2081;
        __int16 v12 = "_clientCallback != nullptr";
        _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#locationUpdater client callback handler should not be nil when attempting to -resume\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }
      abort_report_np();
      __break(1u);
LABEL_15:
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
  }
}

- (void)destroyConnection
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [(CLDispatchSilo *)self->_silo assertInside];
  if (self->_locationdConnection)
  {
    if ([(CLLocationUpdater *)self identityToken]
      && ![(CLLocationUpdater *)self shouldBeRunning])
    {
      sub_19073BF10("kCLConnectionMessageDestroyUponDisconnection", &v16);
      uint64_t v14 = v16;
      __int16 v15 = v17;
      if (v17) {
        atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      CLConnection::sendMessage();
      if (v15) {
        sub_1906BFE48(v15);
      }
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
      }
      v3 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        v4 = [(NSString *)[(CLLocationUpdater *)self identityToken] UTF8String];
        *(_DWORD *)buf = 68289538;
        int v19 = 0;
        __int16 v20 = 2082;
        __int16 v21 = "";
        __int16 v22 = 2082;
        uint64_t v23 = v4;
        __int16 v24 = 2050;
        int v25 = self;
        _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater destroyUponDisconnection(DIC)\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
        }
      }
      v5 = qword_1EB2713E0;
      if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
      {
        v6 = [(NSString *)[(CLLocationUpdater *)self identityToken] UTF8String];
        *(_DWORD *)buf = 68289538;
        int v19 = 0;
        __int16 v20 = 2082;
        __int16 v21 = "";
        __int16 v22 = 2082;
        uint64_t v23 = v6;
        __int16 v24 = 2050;
        int v25 = self;
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater destroyUponDisconnection(DIC)", "{\"msg%{public}.0s\":\"#locationUpdater destroyUponDisconnection(DIC)\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
      }
      if (v17) {
        sub_1906BFE48(v17);
      }
    }
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
    __int16 v7 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(NSString *)[(CLLocationUpdater *)self identityToken] UTF8String];
      *(_DWORD *)buf = 68289538;
      int v19 = 0;
      __int16 v20 = 2082;
      __int16 v21 = "";
      __int16 v22 = 2082;
      uint64_t v23 = v8;
      __int16 v24 = 2050;
      int v25 = self;
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater destroying connection\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
      }
    }
    __int16 v9 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      __int16 v10 = [(NSString *)[(CLLocationUpdater *)self identityToken] UTF8String];
      *(_DWORD *)buf = 68289538;
      int v19 = 0;
      __int16 v20 = 2082;
      __int16 v21 = "";
      __int16 v22 = 2082;
      uint64_t v23 = v10;
      __int16 v24 = 2050;
      int v25 = self;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater destroying connection", "{\"msg%{public}.0s\":\"#locationUpdater destroying connection\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
    }
    locationdConnection = (CLConnection *)self->_locationdConnection;
    self->_locationdConnection = 0;
    CLConnection::deferredDelete(locationdConnection);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
    __int16 v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(NSString *)[(CLLocationUpdater *)self identityToken] UTF8String];
      *(_DWORD *)buf = 68289538;
      int v19 = 0;
      __int16 v20 = 2082;
      __int16 v21 = "";
      __int16 v22 = 2082;
      uint64_t v23 = v13;
      __int16 v24 = 2050;
      int v25 = self;
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater destroying connection\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
    }
  }
}

- (void)handleMessageLocation:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = a3.var0;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(CLDispatchSilo *)self->_silo assertInside];
  if ([(CLLocationUpdater *)self shouldBeRunning] && self->_clientCallback)
  {
    v6 = *(CLConnectionMessage **)var0;
    __int16 v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    __int16 v9 = (NSSet *)objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(v6, v9);
    __int16 v11 = _os_activity_create(&dword_1906B8000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);

    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
    __int16 v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 68290051;
      int v20 = 0;
      __int16 v21 = 2082;
      __int16 v22 = "";
      __int16 v23 = 2082;
      __int16 v24 = "activity";
      __int16 v25 = 2114;
      uint64_t v26 = v13;
      __int16 v27 = 2050;
      __int16 v28 = self;
      __int16 v29 = 2113;
      __int16 v30 = DictionaryOfClasses;
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"payload\":%{private, location:escape_only}@}", buf, 0x3Au);
    }
    uint64_t v14 = copyLocationsFromLocationMessagePayload(DictionaryOfClasses);
    if ([v14 count]) {
      uint64_t v15 = [v14 objectAtIndexedSubscript:0];
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = -[CLUpdate initWithLocation:diagnostics:]([CLUpdate alloc], "initWithLocation:diagnostics:", v15, objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", @"kCLConnectionMessageDiagnosticsKey"), "unsignedLongValue"));
    (*((void (**)(void))self->_clientCallback + 2))();
    [(NSDate *)[(CLLocation *)[(CLUpdate *)v16 location] timestamp] timeIntervalSinceReferenceDate];
    self->_lastTimestamp = v17;

    os_activity_scope_leave(&state);
  }
}

- (void)handleMessageLocationUnavailable:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = a3.var0;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  [(CLDispatchSilo *)self->_silo assertInside];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
  }
  v6 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v19 = 0;
    __int16 v20 = 2082;
    __int16 v21 = "";
    __int16 v22 = 2050;
    __int16 v23 = self;
    _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater location unavailable\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
  }
  __int16 v7 = qword_1EB2713E0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
  {
    *(_DWORD *)buf = 68289282;
    int v19 = 0;
    __int16 v20 = 2082;
    __int16 v21 = "";
    __int16 v22 = 2050;
    __int16 v23 = self;
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater location unavailable", "{\"msg%{public}.0s\":\"#locationUpdater location unavailable\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
  }
  if ([(CLLocationUpdater *)self shouldBeRunning] && self->_clientCallback)
  {
    uint64_t v8 = *(CLConnectionMessage **)var0;
    __int16 v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    __int16 v11 = (NSSet *)objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(v8, v11);
    uint64_t v13 = _os_activity_create(&dword_1906B8000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v13, &state);

    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
    uint64_t v14 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 68290051;
      int v19 = 0;
      __int16 v20 = 2082;
      __int16 v21 = "";
      __int16 v22 = 2082;
      __int16 v23 = (CLLocationUpdater *)"activity";
      __int16 v24 = 2114;
      __int16 v25 = v15;
      __int16 v26 = 2050;
      __int16 v27 = self;
      __int16 v28 = 2113;
      __int16 v29 = DictionaryOfClasses;
      _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"payload\":%{private, location:escape_only}@}", buf, 0x3Au);
    }
    uint64_t v16 = -[CLUpdate initWithLocation:diagnostics:]([CLUpdate alloc], "initWithLocation:diagnostics:", 0, objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", @"kCLConnectionMessageDiagnosticsKey"), "unsignedLongValue"));
    (*((void (**)(void))self->_clientCallback + 2))();

    os_activity_scope_leave(&state);
  }
}

- (void)handleMessageHistoricalLocations:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = (CLConnectionMessage **)a3.var0;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [(CLDispatchSilo *)self->_silo assertInside];
  if ([(CLLocationUpdater *)self shouldBeRunning] && self->_clientCallback)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    __int16 v9 = (NSSet *)objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v9);
    __int16 v11 = _os_activity_create(&dword_1906B8000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);

    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
    __int16 v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = NSStringFromSelector(a2);
      uint64_t buf = 68290051;
      __int16 v35 = 2082;
      id v36 = "";
      __int16 v37 = 2082;
      *(void *)v38 = "activity";
      *(_WORD *)&v38[8] = 2114;
      *(void *)&v38[10] = v13;
      __int16 v39 = 2050;
      v40 = self;
      __int16 v41 = 2113;
      v42 = DictionaryOfClasses;
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"payload\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x3Au);
    }
    uint64_t v14 = (void *)[DictionaryOfClasses objectForKeyedSubscript:@"Locations"];
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
    uint64_t v15 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [v14 count];
      uint64_t buf = 68289538;
      __int16 v35 = 2082;
      id v36 = "";
      __int16 v37 = 1026;
      *(_DWORD *)v38 = v16;
      *(_WORD *)&v38[4] = 2050;
      *(void *)&v38[6] = self;
      _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater historical received historicalLocations\", \"Count\":%{public}d, \"self\":\"%{public}p\"}", (uint8_t *)&buf, 0x22u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
      }
    }
    double v17 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      int v18 = [v14 count];
      uint64_t buf = 68289538;
      __int16 v35 = 2082;
      id v36 = "";
      __int16 v37 = 1026;
      *(_DWORD *)v38 = v18;
      *(_WORD *)&v38[4] = 2050;
      *(void *)&v38[6] = self;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater historical received historicalLocations", "{\"msg%{public}.0s\":\"#locationUpdater historical received historicalLocations\", \"Count\":%{public}d, \"self\":\"%{public}p\"}", (uint8_t *)&buf, 0x22u);
    }
    uint64_t v19 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", @"kCLConnectionMessageDiagnosticsKey"), "unsignedLongValue");
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v20 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v14);
          }
          __int16 v23 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          __int16 v24 = (void *)MEMORY[0x192FCF260]();
          __int16 v25 = [[CLUpdate alloc] initWithLocation:v23 diagnostics:v19];
          (*((void (**)(void))self->_clientCallback + 2))();

          objc_msgSend((id)objc_msgSend(v23, "timestamp"), "timeIntervalSinceReferenceDate");
          self->_lastTimestamp = v26;
        }
        uint64_t v20 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v20);
    }
    __int16 v27 = [[CLUpdate alloc] initWithLocation:0 diagnostics:v19];
    (*((void (**)(void))self->_clientCallback + 2))();

    os_activity_scope_leave(&state);
  }
}

- (void)handleMessageHistoricalLocationsFinished:(shared_ptr<CLConnectionMessage>)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(CLDispatchSilo *)self->_silo assertInside];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
  }
  v4 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 68289282;
    int v8 = 0;
    __int16 v9 = 2082;
    uint64_t v10 = "";
    __int16 v11 = 2050;
    __int16 v12 = self;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater historical delivery completed\", \"self\":\"%{public}p\"}", (uint8_t *)&v7, 0x1Cu);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
  }
  v5 = qword_1EB2713E0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
  {
    int v7 = 68289282;
    int v8 = 0;
    __int16 v9 = 2082;
    uint64_t v10 = "";
    __int16 v11 = 2050;
    __int16 v12 = self;
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater historical delivery completed", "{\"msg%{public}.0s\":\"#locationUpdater historical delivery completed\", \"self\":\"%{public}p\"}", (uint8_t *)&v7, 0x1Cu);
  }
  clientCallback = (void (**)(id, void))self->_clientCallback;
  if (clientCallback) {
    clientCallback[2](clientCallback, 0);
  }
  [(CLLocationUpdater *)self invalidate];
}

- (void)handleMessageDiagnostics:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = a3.var0;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(CLDispatchSilo *)self->_silo assertInside];
  if ([(CLLocationUpdater *)self shouldBeRunning] && self->_clientCallback)
  {
    v6 = *(CLConnectionMessage **)var0;
    int v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    __int16 v9 = (NSSet *)objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(v6, v9);
    __int16 v11 = _os_activity_create(&dword_1906B8000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);

    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
    __int16 v12 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = NSStringFromSelector(a2);
      *(_DWORD *)uint64_t buf = 68290051;
      int v17 = 0;
      __int16 v18 = 2082;
      uint64_t v19 = "";
      __int16 v20 = 2082;
      uint64_t v21 = "activity";
      __int16 v22 = 2114;
      __int16 v23 = v13;
      __int16 v24 = 2050;
      __int16 v25 = self;
      __int16 v26 = 2113;
      __int16 v27 = DictionaryOfClasses;
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"payload\":%{private, location:escape_only}@}", buf, 0x3Au);
    }
    uint64_t v14 = -[CLUpdate initWithLocation:diagnostics:]([CLUpdate alloc], "initWithLocation:diagnostics:", 0, objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", @"kCLConnectionMessageDiagnosticsKey"), "unsignedLongValue"));
    (*((void (**)(void))self->_clientCallback + 2))();

    os_activity_scope_leave(&state);
  }
}

- (void)setHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_clientCallback)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
    int v7 = qword_1EB2713E0;
    p_cache = (void **)"assert";
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      __int16 v12 = "";
      __int16 v13 = 2082;
      uint64_t v14 = "assert";
      __int16 v15 = 2081;
      int v16 = "_clientCallback == nullptr";
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#locationUpdater should initially be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
      }
    }
    uint64_t v8 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      __int16 v12 = "";
      __int16 v13 = 2082;
      uint64_t v14 = "assert";
      __int16 v15 = 2081;
      int v16 = "_clientCallback == nullptr";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater should initially be nil", "{\"msg%{public}.0s\":\"#locationUpdater should initially be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
      }
    }
    v3 = (CLLocationUpdater *)qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      __int16 v12 = "";
      __int16 v13 = 2082;
      uint64_t v14 = "assert";
      __int16 v15 = 2081;
      int v16 = "_clientCallback == nullptr";
      _os_log_impl(&dword_1906B8000, &v3->super, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#locationUpdater should initially be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_22:
    dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    goto LABEL_5;
  }
  v3 = self;
  if (a3)
  {
    self->_clientCallback = _Block_copy(a3);
    return;
  }
  p_cache = CLCircularRegion.cache;
  if (qword_1EB2713E8 != -1) {
    goto LABEL_22;
  }
LABEL_5:
  v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2050;
    uint64_t v14 = (const char *)v3;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#locationUpdater can't set a nil handler\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
    if (p_cache[125] != (void *)-1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
    }
  }
  v6 = qword_1EB2713E0;
  if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2050;
    uint64_t v14 = (const char *)v3;
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater can't set a nil handler", "{\"msg%{public}.0s\":\"#locationUpdater can't set a nil handler\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
  }
}

- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = a3.var0;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v6 = _os_activity_create(&dword_1906B8000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &state);

  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
  }
  int v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    uint64_t v9 = CLConnectionMessage::name(*(CLConnectionMessage **)var0);
    if (*(char *)(v9 + 23) >= 0) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = *(void *)v9;
    }
    *(_DWORD *)uint64_t buf = 68290050;
    int v53 = 0;
    __int16 v54 = 2082;
    v55 = "";
    __int16 v56 = 2082;
    v57 = "activity";
    __int16 v58 = 2114;
    v59 = (CLLocationUpdater *)v8;
    __int16 v60 = 2050;
    v61 = self;
    __int16 v62 = 2082;
    uint64_t v63 = v10;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"message\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  uint64_t v11 = CLConnectionMessage::name(*(CLConnectionMessage **)var0);
  int v12 = *(char *)(v11 + 23);
  if (v12 < 0)
  {
    if (*(void *)(v11 + 8) != 28) {
      goto LABEL_23;
    }
    uint64_t v11 = *(void *)v11;
  }
  else if (v12 != 28)
  {
    goto LABEL_23;
  }
  if (*(void *)v11 == 0x656E6E6F434C436BLL
    && *(void *)(v11 + 8) == 0x73654D6E6F697463
    && *(void *)(v11 + 16) == 0x61636F4C65676173
    && *(_DWORD *)(v11 + 24) == 1852795252)
  {
    goto LABEL_32;
  }
LABEL_23:
  int v16 = (void *)CLConnectionMessage::name(*(CLConnectionMessage **)var0);
  int v17 = *((char *)v16 + 23);
  if (v17 < 0)
  {
    if (v16[1] != 39) {
      goto LABEL_29;
    }
    int v16 = (void *)*v16;
LABEL_28:
    if (memcmp(v16, "kCLConnectionMessageCompensatedLocation", 0x27uLL)) {
      goto LABEL_29;
    }
LABEL_32:
    __int16 v20 = (std::__shared_weak_count *)*((void *)var0 + 1);
    v49 = *(CLConnectionMessage **)var0;
    v50 = v20;
    if (v20) {
      atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(CLLocationUpdater *)self handleMessageLocation:&v49];
    uint64_t v21 = v50;
    if (!v50) {
      goto LABEL_83;
    }
    goto LABEL_82;
  }
  if (v17 == 39) {
    goto LABEL_28;
  }
LABEL_29:
  __int16 v18 = (void *)CLConnectionMessage::name(*(CLConnectionMessage **)var0);
  int v19 = *((char *)v18 + 23);
  if (v19 < 0)
  {
    if (v18[1] != 39) {
      goto LABEL_39;
    }
    __int16 v18 = (void *)*v18;
  }
  else if (v19 != 39)
  {
    goto LABEL_39;
  }
  if (!memcmp(v18, "kCLConnectionMessageHistoricalLocations", 0x27uLL))
  {
    __int16 v37 = (std::__shared_weak_count *)*((void *)var0 + 1);
    v47 = *(CLConnectionMessage **)var0;
    v48 = v37;
    if (v37) {
      atomic_fetch_add_explicit(&v37->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(CLLocationUpdater *)self handleMessageHistoricalLocations:&v47];
    uint64_t v21 = v48;
    if (!v48) {
      goto LABEL_83;
    }
    goto LABEL_82;
  }
LABEL_39:
  __int16 v22 = (void *)CLConnectionMessage::name(*(CLConnectionMessage **)var0);
  int v23 = *((char *)v22 + 23);
  if (v23 < 0)
  {
    if (v22[1] != 47) {
      goto LABEL_45;
    }
    __int16 v22 = (void *)*v22;
  }
  else if (v23 != 47)
  {
    goto LABEL_45;
  }
  if (!memcmp(v22, "kCLConnectionMessageHistoricalLocationsFinished", 0x2FuLL))
  {
    v38 = (std::__shared_weak_count *)*((void *)var0 + 1);
    v45 = *(CLConnectionMessage **)var0;
    v46 = v38;
    if (v38) {
      atomic_fetch_add_explicit(&v38->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(CLLocationUpdater *)self handleMessageHistoricalLocationsFinished:&v45];
    uint64_t v21 = v46;
    if (!v46) {
      goto LABEL_83;
    }
    goto LABEL_82;
  }
LABEL_45:
  __int16 v24 = (void *)CLConnectionMessage::name(*(CLConnectionMessage **)var0);
  int v25 = *((char *)v24 + 23);
  if (v25 < 0)
  {
    if (v24[1] != 39) {
      goto LABEL_51;
    }
    __int16 v24 = (void *)*v24;
    goto LABEL_50;
  }
  if (v25 == 39)
  {
LABEL_50:
    if (memcmp(v24, "kCLConnectionMessageLocationUnavailable", 0x27uLL)) {
      goto LABEL_51;
    }
    __int16 v39 = (std::__shared_weak_count *)*((void *)var0 + 1);
    uint64_t v43 = *(CLConnectionMessage **)var0;
    v44 = v39;
    if (v39) {
      atomic_fetch_add_explicit(&v39->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(CLLocationUpdater *)self handleMessageLocationUnavailable:&v43];
    uint64_t v21 = v44;
    if (!v44) {
      goto LABEL_83;
    }
LABEL_82:
    sub_1906BFE48(v21);
    goto LABEL_83;
  }
LABEL_51:
  uint64_t v26 = CLConnectionMessage::name(*(CLConnectionMessage **)var0);
  int v27 = *(char *)(v26 + 23);
  if (v27 < 0)
  {
    if (*(void *)(v26 + 8) != 31)
    {
LABEL_66:
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
      }
      long long v31 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
      {
        uint64_t v32 = CLConnectionMessage::name(*(CLConnectionMessage **)var0);
        id v33 = *(char *)(v32 + 23) >= 0 ? (const char *)v32 : *(const char **)v32;
        *(_DWORD *)uint64_t buf = 68289538;
        int v53 = 0;
        __int16 v54 = 2082;
        v55 = "";
        __int16 v56 = 2082;
        v57 = v33;
        __int16 v58 = 2050;
        v59 = self;
        _os_log_impl(&dword_1906B8000, v31, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#locationUpdater received unhandled message\", \"Message\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE005760);
        }
      }
      uint64_t v34 = qword_1EB2713E0;
      if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
      {
        uint64_t v35 = CLConnectionMessage::name(*(CLConnectionMessage **)var0);
        if (*(char *)(v35 + 23) >= 0) {
          id v36 = (const char *)v35;
        }
        else {
          id v36 = *(const char **)v35;
        }
        *(_DWORD *)uint64_t buf = 68289538;
        int v53 = 0;
        __int16 v54 = 2082;
        v55 = "";
        __int16 v56 = 2082;
        v57 = v36;
        __int16 v58 = 2050;
        v59 = self;
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v34, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater received unhandled message", "{\"msg%{public}.0s\":\"#locationUpdater received unhandled message\", \"Message\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
      }
      goto LABEL_83;
    }
    uint64_t v26 = *(void *)v26;
  }
  else if (v27 != 31)
  {
    goto LABEL_66;
  }
  if (*(void *)v26 != 0x656E6E6F434C436BLL
    || *(void *)(v26 + 8) != 0x73654D6E6F697463
    || *(void *)(v26 + 16) != 0x6761694465676173
    || *(void *)(v26 + 23) != 0x73636974736F6E67)
  {
    goto LABEL_66;
  }
  v40 = (std::__shared_weak_count *)*((void *)var0 + 1);
  __int16 v41 = *(CLConnectionMessage **)var0;
  v42 = v40;
  if (v40) {
    atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(CLLocationUpdater *)self handleMessageDiagnostics:&v41];
  uint64_t v21 = v42;
  if (v42) {
    goto LABEL_82;
  }
LABEL_83:
  os_activity_scope_leave(&state);
}

- (NSString)identityToken
{
  return self->identityToken;
}

- (void)setIdentityToken:(id)a3
{
}

- (NSData)storageToken
{
  return self->storageToken;
}

- (void)setStorageToken:(id)a3
{
}

- (CLLocationManager)manager
{
  return self->manager;
}

- (void)setManager:(id)a3
{
}

- (id)weakClient
{
  return objc_loadWeak(&self->weakClient);
}

- (void)setWeakClient:(id)a3
{
}

- (BOOL)shouldBeRunning
{
  return self->_shouldBeRunning;
}

- (void)setShouldBeRunning:(BOOL)a3
{
  self->_shouldBeRunning = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->weakClient);

  sub_19073BD88(&self->_callbackDropManager._vptr$CLCallbackDropManager);
}

- (id).cxx_construct
{
  self->_callbackDropManager._vptr$CLCallbackDropManager = (void **)&unk_1EE004B48;
  v3 = (char *)operator new(0x20uLL);
  *((void *)v3 + 1) = 0;
  *((void *)v3 + 2) = 0;
  *(void *)v3 = &unk_1EE005378;
  self->_callbackDropManager.fToken.__cntrl_ = (__shared_weak_count *)v3;
  *((_DWORD *)v3 + 6) = 31337;
  self->_callbackDropManager.fToken.__ptr_ = (int *)(v3 + 24);
  return self;
}

@end