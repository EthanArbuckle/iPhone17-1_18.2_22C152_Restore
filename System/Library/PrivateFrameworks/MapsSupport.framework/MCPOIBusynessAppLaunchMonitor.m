@interface MCPOIBusynessAppLaunchMonitor
+ (MCPOIBusynessAppLaunchMonitor)sharedAppLaunchMonitor;
+ (id)_contextStorePredicate;
+ (void)_processLaunch;
- (MCPOIBusynessAppLaunchMonitor)init;
- (void)_createContextStoreRegistrationIfNecessary;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation MCPOIBusynessAppLaunchMonitor

+ (MCPOIBusynessAppLaunchMonitor)sharedAppLaunchMonitor
{
  if (qword_100023A10 != -1) {
    dispatch_once(&qword_100023A10, &stru_10001CA28);
  }
  v2 = (void *)qword_100023A08;

  return (MCPOIBusynessAppLaunchMonitor *)v2;
}

- (MCPOIBusynessAppLaunchMonitor)init
{
  v11.receiver = self;
  v11.super_class = (Class)MCPOIBusynessAppLaunchMonitor;
  id v2 = [(MCPOIBusynessAppLaunchMonitor *)&v11 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    signal(30, (void (__cdecl *)(int))1);
    dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
    v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    v7 = *((void *)v2 + 2);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100007DE0;
    handler[3] = &unk_10001C650;
    id v10 = v2;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_activate(*((dispatch_object_t *)v2 + 2));
  }
  return (MCPOIBusynessAppLaunchMonitor *)v2;
}

- (void)startMonitoring
{
  uint64_t v3 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "startMonitoring", buf, 2u);
  }

  dispatch_source_t v5 = self->_isolater;
  _geo_isolate_lock();
  [(MCPOIBusynessAppLaunchMonitor *)self _createContextStoreRegistrationIfNecessary];
  v4 = +[_CDClientContext userContext];
  [v4 registerCallback:self->_changeRegistration];

  _geo_isolate_unlock();
}

- (void)_createContextStoreRegistrationIfNecessary
{
  geo_assert_isolated();
  if (!self->_changeRegistration)
  {
    id v5 = +[MCPOIBusynessAppLaunchMonitor _contextStorePredicate];
    uint64_t v3 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.Maps.geocorrectiond.applaunch.registration" contextualPredicate:v5 clientIdentifier:@"com.apple.Maps.geocorrectiond.contextstore-registration" callback:&stru_10001CA68];
    changeRegistration = self->_changeRegistration;
    self->_changeRegistration = v3;
  }
}

+ (void)_processLaunch
{
  +[MCPOIBusynessAnalytics report:0];
  if (+[MCPOIBusynessUploadConditionsChecker shouldUploadBasedOnTime])
  {
    id v2 = GEOGetPOIBusynessLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "attempting to leech location", buf, 2u);
    }

    uint64_t v3 = +[MCPOIBusynessProcessor sharedProcessor];
    [v3 leechLocation];
  }
  else
  {
    +[MCPOIBusynessAnalytics report:4];
    uint64_t v3 = GEOGetPOIBusynessLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Should not upload payload", v4, 2u);
    }
  }
}

+ (id)_contextStorePredicate
{
  id v2 = +[MCPOIBusynessLocationOfInterestManager sharedLocationOfInterestManagerInstance];
  uint64_t v3 = [v2 suppressedLocationsOfInterestUUIDs];

  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[v3 count] + 3);
  id v5 = +[_CDContextQueries keyPathForLowPowerModeStatus];
  v6 = +[_CDContextualPredicate predicateForKeyPath:v5, @"SELF.%@.value == NO", v5 withFormat];
  [v4 addObject:v6];

  unint64_t UInteger = GEOConfigGetUInteger();
  unint64_t v8 = 20;
  if (UInteger > 0x14) {
    unint64_t v8 = UInteger;
  }
  if (v8 >= 0x64) {
    uint64_t v9 = 100;
  }
  else {
    uint64_t v9 = v8;
  }
  id v10 = +[_CDContextQueries keyPathForBatteryLevel];
  objc_super v11 = +[_CDContextualPredicate predicateForKeyPath:v10, @"SELF.%@.value >= %d", v10, v9 withFormat];
  [v4 addObject:v11];

  v12 = +[_CDContextQueries keyPathForNearbyLOIIdentifiers];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v3;
  id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = +[_CDContextualPredicate predicateForKeyPath:v12, @"NOT (%@ IN SELF.%@.value)", *(void *)(*((void *)&v23 + 1) + 8 * i), v12, (void)v23 withFormat];
        [v4 addObject:v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  v19 = +[_CDContextQueries keyPathForAppUsageDataDictionaries];
  v20 = +[_CDContextualPredicate predicateForKeyPath:v19, @"SELF.%@.value.@count > 0", v19 withFormat];
  [v4 addObject:v20];

  v21 = +[_CDContextualPredicate andPredicateWithSubpredicates:v4];

  return v21;
}

- (void)stopMonitoring
{
  uint64_t v3 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "stopMonitoring", buf, 2u);
  }

  v6 = self->_isolater;
  _geo_isolate_lock();
  [(MCPOIBusynessAppLaunchMonitor *)self _createContextStoreRegistrationIfNecessary];
  v4 = +[_CDClientContext userContext];
  [v4 deregisterCallback:self->_changeRegistration];

  changeRegistration = self->_changeRegistration;
  self->_changeRegistration = 0;

  _geo_isolate_unlock();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRegistration, 0);
  objc_storeStrong((id *)&self->_sigUsr1Source, 0);

  objc_storeStrong((id *)&self->_isolater, 0);
}

@end