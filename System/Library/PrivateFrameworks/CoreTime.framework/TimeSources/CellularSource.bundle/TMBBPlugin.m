@interface TMBBPlugin
- (BOOL)airplaneMode;
- (BOOL)fetchTimeFromNetwork:(BOOL)a3;
- (RadiosPreferences)radiosPrefs;
- (TMBBPlugin)initWithClock:(id)a3 daemonCore:(id)a4;
- (TMNetworkTimeMap)networkTimeMap;
- (__CTServerConnection)ctServerConnection;
- (int)mobileCountryCode;
- (int)simulatedMcc;
- (unint64_t)fetchTime;
- (void)TMCAFetchEvent:(int64_t)a3;
- (void)airplaneModeChanged;
- (void)attemptLocationNetworkCorroboration;
- (void)dealloc;
- (void)fetch:(id)a3;
- (void)locationProvidedTimeZone:(id)a3;
- (void)networkSource:(id)a3 providedTimeZones:(id)a4;
- (void)provideNetworkTimeZone:(id)a3;
- (void)setAirplaneMode:(BOOL)a3;
- (void)setCtServerConnection:(__CTServerConnection *)a3;
- (void)setFetchTime:(unint64_t)a3;
- (void)setNetworkTimeMap:(id)a3;
- (void)setRadiosPrefs:(id)a3;
- (void)setSimulatedMcc:(id)a3 withHandler:(id)a4;
- (void)setSimulatedMcc:(int)a3;
- (void)sourceBecameUnavailable:(id)a3;
- (void)sourceWillBecomeAvailable:(id)a3;
- (void)timeZoneWasReset:(id)a3;
@end

@implementation TMBBPlugin

- (void)dealloc
{
  [(RadiosPreferences *)self->_radiosPrefs setDelegate:0];

  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection) {
    CFRelease(ctServerConnection);
  }

  v4.receiver = self;
  v4.super_class = (Class)TMBBPlugin;
  [(TMBBPlugin *)&v4 dealloc];
}

- (TMBBPlugin)initWithClock:(id)a3 daemonCore:(id)a4
{
  v6 = [(TMBBPlugin *)self init];
  if (v6)
  {
    BBTIME_FACILITY = (uint64_t)os_log_create("com.apple.timed", "cell");
    v6->_daemonCore = (TMDaemonCore *)a4;
    v6->_clock = (TMMonotonicClock *)a3;
    v6->_simulatedMcc = -1;
    v6->_networkTimeMap = [[TMNetworkTimeMap alloc] initWithUrl:+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", [+[NSBundle bundleForClass:objc_opt_class()] pathForResource:@"tz_map" ofType:@"plist"])];
    uint64_t v13 = 0;
    long long v15 = 0u;
    uint64_t v16 = 0;
    v14 = v6;
    [+[NSBundle mainBundle] bundleIdentifier];
    uint64_t v7 = _CTServerConnectionCreateWithIdentifier();
    v6->_ctServerConnection = (__CTServerConnection *)v7;
    if (!v7 && os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_ERROR)) {
      sub_5D5C();
    }
    v8 = (RadiosPreferences *)objc_alloc_init((Class)RadiosPreferences);
    v6->_radiosPrefs = v8;
    [(RadiosPreferences *)v8 setDelegate:v6];
    [(TMBBPlugin *)v6 airplaneModeChanged];
    v9 = BBTIME_FACILITY;
    if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "CellularTimePlugin loaded.", v12, 2u);
    }
    v6->cellularTimeZones = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v6->primedSources = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)sub_3F74, @"TMRTCResetNotification", 0, (CFNotificationSuspensionBehavior)0);
  }
  return v6;
}

- (void)airplaneModeChanged
{
  v3 = [(TMDaemonCore *)self->_daemonCore workloop];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_40A8;
  block[3] = &unk_8190;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)provideNetworkTimeZone:(id)a3
{
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"TMCurrentTime"), "doubleValue");
  double v6 = v5;
  unsigned int v31 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"TMTzOffset"), "intValue");
  id v7 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"TMMcc"), "intValue");
  id v8 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"TMTzOffset"), "intValue");
  id v9 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"TMDstActive"), "BOOLValue");
  id v10 = [a3 objectForKey:@"TMSource"];
  id v11 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"TMCellSlot"), "intValue");
  v12 = +[NSMutableString stringWithFormat:@"%@-%u", v10, v11];
  uint64_t v13 = BBTIME_FACILITY;
  if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413570;
    *(void *)v33 = v10;
    *(_WORD *)&v33[8] = 2048;
    double v34 = v6;
    *(_WORD *)v35 = 1024;
    *(_DWORD *)&v35[2] = v31;
    *(_WORD *)&v35[6] = 1024;
    *(_DWORD *)&v35[8] = v9;
    LOWORD(v36) = 1024;
    *(_DWORD *)((char *)&v36 + 2) = v7;
    HIWORD(v36) = 1024;
    *(_DWORD *)v37 = v11;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Received network time zone \"%@\" with %.2f %+d DST %d in %d slot %d\n", buf, 0x2Eu);
  }
  uint64_t v30 = (uint64_t)v10;
  v14 = [(TMNetworkTimeMap *)[(TMBBPlugin *)self networkTimeMap] timeZonesWithOffset:v8 dst:v9 mcc:v7 time:v6];
  if (v14)
  {
    long long v15 = v14;
    id v16 = 0;
  }
  else
  {
    v25 = BBTIME_FACILITY;
    if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v33 = v8;
      *(_WORD *)&v33[4] = 1024;
      *(_DWORD *)&v33[6] = v9;
      LOWORD(v34) = 1024;
      *(_DWORD *)((char *)&v34 + 2) = v7;
      HIWORD(v34) = 2048;
      *(double *)v35 = v6;
      _os_log_error_impl(&dword_0, v25, OS_LOG_TYPE_ERROR, "Olson time zone not found for offset %d dst %d mcc %d time %f", buf, 0x1Eu);
    }
    id v26 = [(TMNetworkTimeMap *)[(TMBBPlugin *)self networkTimeMap] etcGmtZoneForOffset:v8 dst:v9 mcc:v7 time:v6];
    if (!v26)
    {
      long long v15 = 0;
LABEL_23:
      [(TMBBPlugin *)self networkSource:v12 providedTimeZones:v15];
      return;
    }
    id v16 = v26;
    long long v15 = +[NSOrderedSet orderedSetWithObject:v26];
    if (!v15) {
      goto LABEL_23;
    }
  }
  v17 = +[NSMutableDictionary dictionaryWithDictionary:a3];
  [(NSMutableDictionary *)v17 setObject:[(NSOrderedSet *)v15 firstObject] forKey:@"TMTimeZone"];
  v18 = CORETIME_DATA_FACILITY;
  if (os_log_type_enabled((os_log_t)CORETIME_DATA_FACILITY, OS_LOG_TYPE_DEFAULT))
  {
    v19 = self;
    id v20 = [(NSMutableDictionary *)v17 objectForKeyedSubscript:@"TMSource"];
    objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
    *(_DWORD *)buf = 138413826;
    *(void *)v33 = @"NTZ";
    *(_WORD *)&v33[8] = 2112;
    double v34 = *(double *)&v20;
    self = v19;
    *(_WORD *)v35 = 2048;
    *(void *)&v35[2] = v21;
    *(_WORD *)&v35[10] = 2048;
    double v36 = v6;
    *(_WORD *)v37 = 1024;
    *(_DWORD *)&v37[2] = v31;
    __int16 v38 = 1024;
    int v39 = (int)v9;
    __int16 v40 = 1024;
    int v41 = (int)v7;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,t_s,%.9f,off,%d,dst,%d,mcc,%d", buf, 0x3Cu);
  }
  if (v6 >= -1.0 && v6 <= 1.0
    || -1.0 - kCFAbsoluteTimeIntervalSince1970 <= v6 && 1.0 - kCFAbsoluteTimeIntervalSince1970 >= v6
    || v6 >= -6.31456128e10 && v6 <= -6.31456128e10
    || (double v22 = kCFAbsoluteTimeIntervalSince1904,
        double v23 = -1.0 - kCFAbsoluteTimeIntervalSince1904,
        -1.0 - kCFAbsoluteTimeIntervalSince1904 <= v6)
    && (v23 = 1.0, double v22 = 1.0 - kCFAbsoluteTimeIntervalSince1904, 1.0 - kCFAbsoluteTimeIntervalSince1904 >= v6))
  {
    v24 = BBTIME_FACILITY;
    if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_FAULT)) {
      sub_5D90(v30, v24);
    }
    return;
  }
  if (v7 < 0x3E8)
  {
    -[TMBBPlugin TMCAFetchEvent:](self, "TMCAFetchEvent:", 2, v22, v23);
    id v27 = [(NSMutableDictionary *)v17 mutableCopy];
    [v27 setObject:v12 forKeyedSubscript:@"TMSource"];
    if (v16)
    {
      p_daemonCore = &self->_daemonCore;
      [(TMDaemonCore *)self->_daemonCore setSourceUnavailable:v27];
      [(NSMutableString *)v12 appendFormat:@"-Non-Olson"];
    }
    else
    {
      v29 = +[NSString stringWithFormat:@"%@-%s", v12, "Non-Olson"];
      if (![(NSMutableDictionary *)self->cellularTimeZones objectForKeyedSubscript:v29])
      {
LABEL_33:
        [(TMDaemonCore *)self->_daemonCore setSourceTimeZone:v27];
        AnalyticsSendEventLazy();

        goto LABEL_23;
      }
      [v27 setObject:v29 forKeyedSubscript:@"TMSource"];
      p_daemonCore = &self->_daemonCore;
      [(TMDaemonCore *)self->_daemonCore setSourceUnavailable:v27];
      [v27 setObject:v12 forKeyedSubscript:@"TMSource"];
    }
    [(TMDaemonCore *)*p_daemonCore setSourceAvailable:v27];
    goto LABEL_33;
  }
  if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_FAULT)) {
    sub_5E08();
  }
}

- (void)timeZoneWasReset:(id)a3
{
  uint64_t v4 = [a3 isEqualToString:@"AirplaneMode"] ^ 1;
  double v5 = BBTIME_FACILITY;
  if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Time zone was reset, fetching hard: %d", (uint8_t *)v6, 8u);
  }
  [(TMBBPlugin *)self TMCAFetchEvent:1];
  [(TMBBPlugin *)self fetchTimeFromNetwork:v4];
}

- (void)sourceWillBecomeAvailable:(id)a3
{
}

- (void)fetch:(id)a3
{
  if ((([a3 hasPrefix:@"NITZ"] & 1) != 0
     || [a3 hasPrefix:@"CDMA"])
    && ([(NSMutableSet *)self->primedSources containsObject:a3] & 1) == 0)
  {
    double v5 = BBTIME_FACILITY;
    if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Fetching network time zone due to request from manager.", v6, 2u);
    }
    [(TMBBPlugin *)self fetchTimeFromNetwork:0];
  }
}

- (BOOL)fetchTimeFromNetwork:(BOOL)a3
{
  [(TMBBPlugin *)self TMCAFetchEvent:3];
  if (self->_ctServerConnection)
  {
    _CTServerConnectionFetchTimeFromNetwork();
    uint64_t v4 = BBTIME_FACILITY;
    if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v8 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Fetch time from network failed unexpectedly (%d).", buf, 8u);
    }
  }
  else if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_ERROR))
  {
    sub_5E48();
  }
  return 0;
}

- (int)mobileCountryCode
{
  int simulatedMcc = self->_simulatedMcc;
  int v3 = simulatedMcc;
  if (simulatedMcc == -1)
  {
    if (self->_ctServerConnection)
    {
      id v7 = 0;
      if (_CTServerConnectionCopyMobileCountryCode())
      {
        if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_ERROR)) {
          sub_5F5C();
        }
        int v3 = 0;
      }
      else
      {
        int v3 = [v7 intValue];
        uint64_t v4 = BBTIME_FACILITY;
        if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_DEBUG)) {
          sub_5EE4(v3, v4);
        }
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_ERROR)) {
        sub_5EB0();
      }
      int v3 = 0;
    }
  }
  double v5 = BBTIME_FACILITY;
  if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v7) = 67109376;
    HIDWORD(v7) = v3;
    __int16 v8 = 1024;
    BOOL v9 = simulatedMcc != -1;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Current mcc: '%d' simulated:'%d'.", (uint8_t *)&v7, 0xEu);
  }
  return v3;
}

- (void)setSimulatedMcc:(id)a3 withHandler:(id)a4
{
  double v6 = (__CFString *)objc_msgSend(a3, "objectForKey:", @"TMMcc", a4);
  unsigned int v7 = [(__CFString *)v6 intValue];
  self->_int simulatedMcc = v7;
  __int16 v8 = CORETIME_DATA_FACILITY;
  if (os_log_type_enabled((os_log_t)CORETIME_DATA_FACILITY, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [a3 objectForKeyedSubscript:@"TMSource"];
    objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
    int simulatedMcc = self->_simulatedMcc;
    int v17 = 138413058;
    CFStringRef v18 = @"set_simulated_mcc";
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2048;
    uint64_t v22 = v11;
    __int16 v23 = 1024;
    int v24 = simulatedMcc;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,mcc,%d", (uint8_t *)&v17, 0x26u);
    unsigned int v7 = self->_simulatedMcc;
  }
  uint64_t v12 = BBTIME_FACILITY;
  BOOL v13 = os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_DEFAULT);
  if (v7 == -1)
  {
    if (!v13) {
      return;
    }
    LOWORD(v17) = 0;
    v14 = "Not simulating mcc.";
    long long v15 = v12;
    uint32_t v16 = 2;
  }
  else
  {
    if (!v13) {
      return;
    }
    int v17 = 138412546;
    CFStringRef v18 = v6;
    __int16 v19 = 1024;
    LODWORD(v20) = v7;
    v14 = "Simulating mcc: %@ (%d)";
    long long v15 = v12;
    uint32_t v16 = 18;
  }
  _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, v16);
}

- (void)sourceBecameUnavailable:(id)a3
{
  if ([a3 isEqualToString:@"Location"])
  {
    -[TMBBPlugin locationProvidedTimeZone:](self, "locationProvidedTimeZone:");
  }
  else if (([a3 hasPrefix:@"NITZ"] & 1) != 0 {
         || [a3 hasPrefix:@"CDMA"])
  }
  {
    [(NSMutableDictionary *)self->cellularTimeZones setObject:0 forKeyedSubscript:a3];
    if (([a3 hasSuffix:@"Non-Olson"] & 1) == 0)
    {
      id v5 = [a3 stringByAppendingFormat:@"-Non-Olson"];
      if ([(NSMutableDictionary *)self->cellularTimeZones objectForKeyedSubscript:v5])
      {
        [(TMMonotonicClock *)self->_clock coarseMonotonicTime];
        [(TMDaemonCore *)self->_daemonCore setSourceUnavailable:+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, @"TMSource", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"TMRtcTime", 0)];
      }
      [(TMBBPlugin *)self attemptLocationNetworkCorroboration];
    }
  }
}

- (void)locationProvidedTimeZone:(id)a3
{
  self->locationTimeZone = (NSString *)a3;

  [(TMBBPlugin *)self attemptLocationNetworkCorroboration];
}

- (void)networkSource:(id)a3 providedTimeZones:(id)a4
{
  -[NSMutableSet removeObject:](self->primedSources, "removeObject:");
  [(NSMutableDictionary *)self->cellularTimeZones setObject:a4 forKeyedSubscript:a3];

  [(TMBBPlugin *)self attemptLocationNetworkCorroboration];
}

- (void)attemptLocationNetworkCorroboration
{
  int v3 = BBTIME_FACILITY;
  if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_INFO))
  {
    cellularTimeZones = self->cellularTimeZones;
    locationTimeZone = self->locationTimeZone;
    *(_DWORD *)buf = 138412546;
    CFStringRef v18 = locationTimeZone;
    __int16 v19 = 2112;
    id v20 = cellularTimeZones;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Attempting network corroboration. Location: %@, Network: %@", buf, 0x16u);
  }
  id v6 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  [v6 setObject:@"LocationAndNetwork" forKeyedSubscript:@"TMSource"];
  [v6 setObject:self->locationTimeZone forKeyedSubscript:@"TMTimeZone"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v7 = self->cellularTimeZones;
  id v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->cellularTimeZones, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i)), "containsObject:", self->locationTimeZone))
        {
          [(TMDaemonCore *)self->_daemonCore setSourceTimeZone:v6];
          goto LABEL_13;
        }
      }
      id v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  [(TMDaemonCore *)self->_daemonCore setSourceUnavailable:v6];
LABEL_13:
}

- (void)TMCAFetchEvent:(int64_t)a3
{
  unint64_t v5 = [(TMBBPlugin *)self fetchTime];
  if (v5)
  {
    unint64_t v6 = v5;
    __uint64_t v7 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    if (v7)
    {
      unint64_t v13 = (v7 - v6) / 0x3B9ACA00;
      AnalyticsSendEventLazy();
      -[TMBBPlugin setFetchTime:](self, "setFetchTime:", 0, _NSConcreteStackBlock, 3221225472, sub_561C, &unk_81D0, v13, a3);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_ERROR)) {
        sub_5E7C();
      }
      -[TMBBPlugin setFetchTime:](self, "setFetchTime:", 0, v8, v9, v10, v11, v12, v14);
    }
  }
}

- (BOOL)airplaneMode
{
  return self->_airplaneMode;
}

- (void)setAirplaneMode:(BOOL)a3
{
  self->_airplaneMode = a3;
}

- (RadiosPreferences)radiosPrefs
{
  return self->_radiosPrefs;
}

- (void)setRadiosPrefs:(id)a3
{
}

- (int)simulatedMcc
{
  return self->_simulatedMcc;
}

- (void)setSimulatedMcc:(int)a3
{
  self->_int simulatedMcc = a3;
}

- (__CTServerConnection)ctServerConnection
{
  return self->_ctServerConnection;
}

- (void)setCtServerConnection:(__CTServerConnection *)a3
{
  self->_ctServerConnection = a3;
}

- (TMNetworkTimeMap)networkTimeMap
{
  return self->_networkTimeMap;
}

- (void)setNetworkTimeMap:(id)a3
{
}

- (unint64_t)fetchTime
{
  return self->_fetchTime;
}

- (void)setFetchTime:(unint64_t)a3
{
  self->_fetchTime = a3;
}

@end