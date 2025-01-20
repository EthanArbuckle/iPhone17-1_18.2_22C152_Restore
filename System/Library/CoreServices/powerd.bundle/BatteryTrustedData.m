@interface BatteryTrustedData
- (BOOL)doNotRunAnymore;
- (BOOL)hasAuthPassed:(id)a3;
- (BOOL)haveFrameworkToRun;
- (BOOL)isTrustedAuthFeatureDisabled:(id)a3;
- (BOOL)startMatchingNotifications;
- (BatteryTrustedData)initWithIdentifer:(id)a3;
- (IONotificationPort)ioNotificationPort;
- (NSDictionary)initialData;
- (NSDictionary)trustedDataShared;
- (NSNumber)defaultTimer;
- (NSNumber)failedAuthCount;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)periodicTimer;
- (PPSTelemetryIdentifier)ppsId;
- (double)authLastFailedTime;
- (double)authLastPassedTime;
- (double)authTriggeredTime;
- (id)decodeNonce:(id)a3;
- (id)getInitTimerValueForAlarm:(id)a3;
- (unsigned)ioServiceAddedIterator;
- (void)cancelAlarm;
- (void)handleAppleBatteryAuthIORegData:(id)a3;
- (void)handleDataFromService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5;
- (void)handleServiceAdded:(unsigned int)a3;
- (void)readOverrideTimeFromDefaults;
- (void)sendToPPS:(id)a3;
- (void)setAlarmInSeconds:(id)a3;
- (void)setAuthLastFailedTime:(double)a3;
- (void)setAuthLastPassedTime:(double)a3;
- (void)setAuthTriggeredTime:(double)a3;
- (void)setDefaultTimer:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDoNotRunAnymore:(BOOL)a3;
- (void)setFailedAuthCount:(id)a3;
- (void)setInitialData:(id)a3;
- (void)setIoNotificationPort:(IONotificationPort *)a3;
- (void)setIoServiceAddedIterator:(unsigned int)a3;
- (void)setPeriodicTimer:(id)a3;
- (void)setPpsId:(PPSTelemetryIdentifier *)a3;
- (void)setQueue:(id)a3;
- (void)setTrustedDataShared:(id)a3;
- (void)start;
- (void)stop;
- (void)triggerBatteryReauthentication;
- (void)updatePublishedData:(id)a3;
@end

@implementation BatteryTrustedData

- (BatteryTrustedData)initWithIdentifer:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BatteryTrustedData;
  v5 = [(BatteryTrustedData *)&v21 init];
  v6 = v5;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR)) {
      sub_100064580();
    }
    goto LABEL_9;
  }
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR)) {
      sub_1000645B4();
    }
LABEL_9:
    v18 = 0;
    goto LABEL_14;
  }
  failedAuthCount = v5->_failedAuthCount;
  v5->_failedAuthCount = 0;

  v6->_ioNotificationPort = 0;
  v6->_ioServiceAddedIterator = 0;
  v6->_authLastFailedTime = 0.0;
  v6->_authLastPassedTime = 0.0;
  v6->_authTriggeredTime = 0.0;
  v8 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  v9 = [v4 stringByTrimmingCharactersInSet:v8];

  id v10 = +[NSString stringWithFormat:@"%@.battery%@", @"com.apple.powerd.batterytrusteddata.dailytaskQueue", v9];
  v11 = (const char *)[v10 UTF8String];
  v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
  queue = v6->_queue;
  v6->_queue = (OS_dispatch_queue *)v13;

  if (v6->_queue)
  {
    defaultTimer = v6->_defaultTimer;
    v6->_defaultTimer = (NSNumber *)&off_10009A4A0;

    v16 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.powerd.batterytrusteddata.dailytask"];
    defaults = v6->_defaults;
    v6->_defaults = v16;

    [(BatteryTrustedData *)v6 readOverrideTimeFromDefaults];
    v6->_ppsId = 0;
    v18 = v6;
  }
  else
  {
    v19 = (void *)qword_1000A46D8;
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR)) {
      sub_1000645E8(v19);
    }
    v18 = 0;
  }

LABEL_14:
  return v18;
}

- (void)readOverrideTimeFromDefaults
{
  v3 = [(BatteryTrustedData *)self defaults];
  id v4 = [v3 objectForKey:@"OverrideTimeSeconds"];

  v5 = qword_1000A46D8;
  BOOL v6 = os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v7 = 138412290;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Read defaults Override time in seconds: %@", (uint8_t *)&v7, 0xCu);
    }
    objc_storeStrong((id *)&self->_defaultTimer, v4);
  }
  else if (v6)
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No Override found for timer, using default timer value", (uint8_t *)&v7, 2u);
  }
}

- (id)getInitTimerValueForAlarm:(id)a3
{
  id v4 = a3;
  v5 = self->_defaultTimer;
  if (!v4)
  {
LABEL_12:
    v18 = v5;
    goto LABEL_22;
  }
  if (([v4 BOOLValue] & 1) == 0)
  {
    v17 = qword_1000A46D8;
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412290;
      CFStringRef v27 = (const __CFString *)v5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Initial auth suggest it has failed, timer value is %@ seconds", (uint8_t *)&v26, 0xCu);
    }
    goto LABEL_12;
  }
  BOOL v6 = [(NSDictionary *)self->_initialData objectForKeyedSubscript:@"TrustedBatteryLastTimePassed"];
  int v7 = v6;
  if (v6)
  {
    CFStringRef v8 = (const __CFString *)[v6 unsignedLongValue];
    v9 = +[NSDate date];
    [v9 timeIntervalSince1970];
    unint64_t v11 = (unint64_t)v10;

    unsigned int v12 = [(NSNumber *)self->_defaultTimer unsignedIntValue];
    if ((unint64_t)v8 >= v11)
    {
      uint64_t v23 = qword_1000A46D8;
      if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 134218498;
        CFStringRef v27 = v8;
        __int16 v28 = 2048;
        unint64_t v29 = v11;
        __int16 v30 = 2112;
        v31 = v5;
        v20 = "Last auth passed time (%llu) is greater than current time(%llu), timer value is %@ seconds";
LABEL_17:
        objc_super v21 = v23;
        uint32_t v22 = 32;
        goto LABEL_18;
      }
    }
    else
    {
      CFStringRef v13 = (const __CFString *)((char *)v8 + v12);
      if ((unint64_t)v13 <= v11)
      {

        v25 = qword_1000A46D8;
        v18 = (NSNumber *)&off_10009A4B8;
        if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 134218498;
          CFStringRef v27 = v13;
          __int16 v28 = 2048;
          unint64_t v29 = v11;
          __int16 v30 = 2112;
          v31 = (NSNumber *)&off_10009A4B8;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "End time(%llu) is greater than current time(%llu), timer value is %@ seconds", (uint8_t *)&v26, 0x20u);
        }
        goto LABEL_21;
      }
      if ((unint64_t)v13 - v11 < [(NSNumber *)self->_defaultTimer unsignedIntValue])
      {
        v14 = +[NSNumber numberWithUnsignedLongLong:(char *)v13 - v11];

        v15 = qword_1000A46D8;
        if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 138412290;
          CFStringRef v27 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Timer value is %@ seconds", (uint8_t *)&v26, 0xCu);
        }
        v16 = v14;
        goto LABEL_20;
      }
      uint64_t v23 = qword_1000A46D8;
      if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 134218498;
        CFStringRef v27 = v13;
        __int16 v28 = 2048;
        unint64_t v29 = v11;
        __int16 v30 = 2112;
        v31 = v5;
        v20 = "(%llu) is greater than current time(%llu), timer value is %@ seconds";
        goto LABEL_17;
      }
    }
  }
  else
  {
    uint64_t v19 = qword_1000A46D8;
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412546;
      CFStringRef v27 = @"TrustedBatteryLastTimePassed";
      __int16 v28 = 2112;
      unint64_t v29 = (unint64_t)v5;
      v20 = "%@ key is NULL, timer value is %@ seconds";
      objc_super v21 = v19;
      uint32_t v22 = 22;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v26, v22);
    }
  }
  v16 = v5;
LABEL_20:
  v18 = v16;
LABEL_21:

LABEL_22:

  return v18;
}

- (BOOL)haveFrameworkToRun
{
  if (sub_1000149EC() && sub_100014ABC())
  {
    v2 = qword_1000A46D8;
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CoreAccessories.framework loaded, continue running !!\n", buf, 2u);
    }
    return 1;
  }
  else
  {
    id v4 = qword_1000A46D8;
    BOOL v5 = os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v5)
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CoreAccessories.framework not loaded, bail out!!\n", v6, 2u);
      return 0;
    }
  }
  return result;
}

- (void)start
{
  if (![(BatteryTrustedData *)self startMatchingNotifications])
  {
    goto LABEL_20;
  }
  v3 = [(BatteryTrustedData *)self initialData];
  unsigned int v4 = [(BatteryTrustedData *)self isTrustedAuthFeatureDisabled:v3];

  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR)) {
      sub_100064684();
    }
LABEL_20:
    [(BatteryTrustedData *)self stop];
    return;
  }
  if (![(BatteryTrustedData *)self haveFrameworkToRun])
  {
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR)) {
      sub_1000646EC();
    }
    goto LABEL_20;
  }
  BOOL v5 = [(NSDictionary *)self->_initialData objectForKeyedSubscript:@"BatteryAuthPassed"];
  BOOL v6 = v5;
  if (v5
    && ([v5 BOOLValue] & 1) == 0
    && os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR))
  {
    sub_1000646B8();
  }
  int v7 = [(BatteryTrustedData *)self getInitTimerValueForAlarm:v6];
  CFStringRef v8 = qword_1000A46D8;
  if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    unint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Timer value determined to be %@ seconds", (uint8_t *)&v10, 0xCu);
  }
  [(BatteryTrustedData *)self handleAppleBatteryAuthIORegData:self->_initialData];
  [(BatteryTrustedData *)self setAlarmInSeconds:v7];
  v9 = qword_1000A46D8;
  if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Battery Trusted Data start completed", (uint8_t *)&v10, 2u);
  }
}

- (void)sendToPPS:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_ppsId)
    {
LABEL_3:
      v16 = self;
      BOOL v5 = +[NSMutableDictionary dictionary];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v6 = v4;
      id v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v18;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v6);
            }
            unint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            unsigned int v12 = [v11 stringByReplacingOccurrencesOfString:@" " withString:&stru_100093D08];
            CFStringRef v13 = [v6 objectForKey:v11];
            [v5 setObject:v13 forKey:v12];
          }
          id v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v8);
      }

      if (v16->_ppsId)
      {
        PPSSendTelemetry();
      }
      else if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR))
      {
        sub_100064788();
      }

      goto LABEL_20;
    }
    v14 = (PPSTelemetryIdentifier *)PPSCreateTelemetryIdentifier();
    self->_ppsId = v14;
    v15 = qword_1000A46D8;
    if (v14)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "ppsId created with subsystem BatteryTrustedData and Daily as BatteryTrustedData", buf, 2u);
      }
      goto LABEL_3;
    }
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR)) {
      sub_100064754();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR))
  {
    sub_100064720();
  }
LABEL_20:
}

- (void)triggerBatteryReauthentication
{
  v3 = qword_1000A46D8;
  if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Periodic Timer Fired\n", buf, 2u);
  }
  if (sub_1000149EC() && sub_100014ABC())
  {
    id v4 = +[NSDate date];
    [v4 timeIntervalSince1970];
    self->_authTriggeredTime = v5;

    id v6 = qword_1000A46D8;
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Trigger auth!", v12, 2u);
    }
    id v7 = (void (*)(void))sub_100014ABC();
    if (v7)
    {
      v7();
      [(BatteryTrustedData *)self setAlarmInSeconds:self->_defaultTimer];
    }
    else
    {
      uint64_t v9 = (BatteryTrustedData *)sub_1000647BC();
      [(BatteryTrustedData *)v9 cancelAlarm];
    }
  }
  else
  {
    id v8 = qword_1000A46D8;
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CoreAccessories.framework not loaded!!\n", v11, 2u);
    }
  }
}

- (void)cancelAlarm
{
  if (self->_periodicTimer)
  {
    v3 = qword_1000A46D8;
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelling any existing Alarms\n", v4, 2u);
    }
    dispatch_source_cancel((dispatch_source_t)self->_periodicTimer);
  }
}

- (void)setAlarmInSeconds:(id)a3
{
  id v4 = a3;
  [(BatteryTrustedData *)self cancelAlarm];
  double v5 = qword_1000A46D8;
  if (self->_doNotRunAnymore)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR)) {
      sub_1000647E0();
    }
    [(BatteryTrustedData *)self stop];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Arming a new timer for %@ seconds\n", buf, 0xCu);
    }
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    periodicTimer = self->_periodicTimer;
    self->_periodicTimer = v6;

    id v8 = self->_periodicTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100013A18;
    handler[3] = &unk_1000911E8;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_time_t v9 = dispatch_walltime(0, 1000000000 * [v4 unsignedIntValue]);
    dispatch_source_set_timer((dispatch_source_t)self->_periodicTimer, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_periodicTimer);
  }
}

- (BOOL)isTrustedAuthFeatureDisabled:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [v5 objectForKeyedSubscript:@"TrustedBatteryEnabled"];
    unsigned __int8 v7 = [v6 BOOLValue];
    id v8 = qword_1000A46D8;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Trusted data path enabled.", v11, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR)) {
        sub_100064848();
      }
      [(BatteryTrustedData *)self updatePublishedData:&off_10009AA10];
    }
    char v9 = v7 ^ 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR)) {
      sub_100064814();
    }
    [(BatteryTrustedData *)self updatePublishedData:&off_10009A9E8];
    char v9 = 1;
  }

  return v9;
}

- (BOOL)hasAuthPassed:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!v4
    || ([v4 objectForKeyedSubscript:@"BatteryAuthPassed"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    id v12 = qword_1000A46D8;
    BOOL v11 = 0;
    if (!os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Auth state unknown yet", buf, 2u);
LABEL_11:
    BOOL v11 = 0;
    goto LABEL_12;
  }
  unsigned __int8 v7 = [v5 objectForKeyedSubscript:@"BatteryAuthPassed"];
  unsigned __int8 v8 = [v7 BOOLValue];

  if ((v8 & 1) == 0)
  {
    CFStringRef v13 = +[NSNumber numberWithInt:[(NSNumber *)self->_failedAuthCount intValue] + 1];
    failedAuthCount = self->_failedAuthCount;
    self->_failedAuthCount = v13;

    self->_authLastFailedTime = self->_authTriggeredTime;
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR)) {
      sub_10006487C();
    }
    goto LABEL_11;
  }
  char v9 = [v5 objectForKeyedSubscript:@"TrustedBatteryLastTimePassed"];
  self->_authLastPassedTime = (double)(unint64_t)[v9 unsignedLongLongValue];

  SEL v10 = qword_1000A46D8;
  if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Auth Passed", v16, 2u);
  }
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (id)decodeNonce:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  if (v3 && [v3 length])
  {
    double v5 = qword_1000A46D8;
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Decoding Nonce now", (uint8_t *)v12, 2u);
    }
    memset(v12, 0, sizeof(v12));
    id v6 = v3;
    [v6 bytes];
    if ((unint64_t)[v6 length] <= 0x20)
    {
      __memcpy_chk();
      unsigned __int8 v7 = +[NSNumber numberWithInt:BYTE9(v12[0])];
      [v4 setObject:v7 forKeyedSubscript:@"Trusted Maximum Capacity"];

      unsigned __int8 v8 = +[NSNumber numberWithInt:WORD5(v12[0])];
      [v4 setObject:v8 forKeyedSubscript:@"Trusted Cycle Count"];

      char v9 = +[NSNumber numberWithInt:WORD6(v12[0])];
      [v4 setObject:v9 forKeyedSubscript:@"Trusted LifeTime Max WRdc"];

      if (HIWORD(v12[0]))
      {
        SEL v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)(86400 * HIWORD(v12[0]))];
        [v4 setObject:v10 forKeyedSubscript:@"Trusted Date Of First Use"];
      }
    }
  }

  return v4;
}

- (void)handleAppleBatteryAuthIORegData:(id)a3
{
  id v4 = a3;
  if ([(BatteryTrustedData *)self doNotRunAnymore])
  {
    if (self->_doNotRunAnymore) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v5 = [(BatteryTrustedData *)self isTrustedAuthFeatureDisabled:v4];
    self->_doNotRunAnymore = v5;
    if (v5)
    {
LABEL_3:
      [(BatteryTrustedData *)self stop];
      if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR)) {
        sub_1000648B0();
      }
      goto LABEL_13;
    }
  }
  id v6 = qword_1000A46D8;
  if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Data is %@", (uint8_t *)&v14, 0xCu);
  }
  unsigned __int8 v7 = [v4 objectForKeyedSubscript:@"TrustedBatteryDataRaw"];
  unsigned __int8 v8 = [(BatteryTrustedData *)self decodeNonce:v7];

  if ([(BatteryTrustedData *)self hasAuthPassed:v4])
  {
    [(BatteryTrustedData *)self sendToPPS:v8];
  }
  else
  {
    char v9 = qword_1000A46D8;
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Auth has failed/state Unknown", (uint8_t *)&v14, 2u);
    }
  }
  SEL v10 = +[NSMutableDictionary dictionaryWithDictionary:v8];
  BOOL v11 = [v4 objectForKeyedSubscript:@"TrustedBatteryEnabled"];
  [v10 setValue:v11 forKeyPath:@"Trusted Data Enabled"];

  id v12 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:(unint64_t)self->_authLastPassedTime];
  [v10 setValue:v12 forKeyPath:@"Trusted Data Timestamp"];
  id v13 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:(unint64_t)self->_authLastFailedTime];
  [v10 setValue:v13 forKeyPath:@"Trusted Data Failed Timestamp"];
  [v10 setValue:self->_failedAuthCount forKeyPath:@"Trusted Data Failed Count"];
  [(BatteryTrustedData *)self updatePublishedData:v10];

LABEL_13:
}

- (void)updatePublishedData:(id)a3
{
}

- (void)stop
{
  id v3 = qword_1000A46D8;
  if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "STOP Called: Removing transport matching notifications...", v4, 2u);
  }
  self->_doNotRunAnymore = 1;
  [(BatteryTrustedData *)self cancelAlarm];
  if ([(BatteryTrustedData *)self ioServiceAddedIterator]) {
    IOObjectRelease([(BatteryTrustedData *)self ioServiceAddedIterator]);
  }
  if ([(BatteryTrustedData *)self ioNotificationPort]) {
    IONotificationPortDestroy([(BatteryTrustedData *)self ioNotificationPort]);
  }
  [(BatteryTrustedData *)self updatePublishedData:&off_10009AA38];
}

- (BOOL)startMatchingNotifications
{
  [(BatteryTrustedData *)self setIoNotificationPort:IONotificationPortCreate(kIOMainPortDefault)];
  id v3 = [(BatteryTrustedData *)self ioNotificationPort];
  if (v3)
  {
    id v4 = [(BatteryTrustedData *)self ioNotificationPort];
    BOOL v5 = [(BatteryTrustedData *)self queue];
    IONotificationPortSetDispatchQueue(v4, v5);

    id v6 = [(BatteryTrustedData *)self ioNotificationPort];
    CFDictionaryRef v7 = IOServiceMatching("AppleBatteryAuth");
    uint64_t v8 = IOServiceAddMatchingNotification(v6, "IOServiceFirstMatch", v7, (IOServiceMatchingCallback)sub_100014318, self, &self->_ioServiceAddedIterator);
    if (v8)
    {
      uint64_t v9 = v8;
      SEL v10 = qword_1000A46D8;
      LODWORD(v3) = os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR);
      if (v3)
      {
        sub_1000648E4(v9, v10, v11, v12, v13, v14, v15, v16);
        LOBYTE(v3) = 0;
      }
    }
    else
    {
      sub_100014318(self, [(BatteryTrustedData *)self ioServiceAddedIterator]);
      LOBYTE(v3) = 1;
    }
  }
  return (char)v3;
}

- (void)handleServiceAdded:(unsigned int)a3
{
  kern_return_t v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSDictionary *initialData;
  NSDictionary *v18;
  io_object_t notification;
  uint8_t buf[16];

  BOOL v5 = qword_1000A46D8;
  if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Service matching notification callback fired!", buf, 2u);
  }
  notification = 0;
  id v6 = IOServiceAddInterestNotification([(BatteryTrustedData *)self ioNotificationPort], a3, "IOGeneralInterest", (IOServiceInterestCallback)sub_1000144C4, self, &notification);
  if (v6)
  {
    CFDictionaryRef v7 = v6;
    uint64_t v8 = qword_1000A46D8;
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR)) {
      sub_1000649C0(v7, v8);
    }
    IOObjectRelease(a3);
  }
  else if (IORegistryEntryCreateCFProperties(a3, (CFMutableDictionaryRef *)&v18, kCFAllocatorDefault, 0))
  {
    uint64_t v9 = qword_1000A46D8;
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR)) {
      sub_100064950(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  else
  {
    initialData = self->_initialData;
    self->_initialData = v18;
  }
}

- (void)handleDataFromService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5
{
  CFDictionaryRef v7 = qword_1000A46D8;
  if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Callback triggered", buf, 2u);
  }
  CFMutableDictionaryRef properties = 0;
  uint64_t v8 = IORegistryEntryCreateCFProperties(a3, &properties, kCFAllocatorDefault, 0);
  CFMutableDictionaryRef v9 = properties;
  if (v8) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = properties == 0;
  }
  if (v10)
  {
    uint64_t v11 = v8;
    uint64_t v12 = qword_1000A46D8;
    if (os_log_type_enabled((os_log_t)qword_1000A46D8, OS_LOG_TYPE_ERROR)) {
      sub_100064A4C(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  else
  {
    [(BatteryTrustedData *)self cancelAlarm];
    [(BatteryTrustedData *)self handleAppleBatteryAuthIORegData:v9];
    [(BatteryTrustedData *)self setAlarmInSeconds:self->_defaultTimer];
  }
}

- (IONotificationPort)ioNotificationPort
{
  return self->_ioNotificationPort;
}

- (void)setIoNotificationPort:(IONotificationPort *)a3
{
  self->_ioNotificationPort = a3;
}

- (unsigned)ioServiceAddedIterator
{
  return self->_ioServiceAddedIterator;
}

- (void)setIoServiceAddedIterator:(unsigned int)a3
{
  self->_ioServiceAddedIterator = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
}

- (BOOL)doNotRunAnymore
{
  return self->_doNotRunAnymore;
}

- (void)setDoNotRunAnymore:(BOOL)a3
{
  self->_doNotRunAnymore = a3;
}

- (NSDictionary)initialData
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInitialData:(id)a3
{
}

- (OS_dispatch_source)periodicTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPeriodicTimer:(id)a3
{
}

- (NSNumber)failedAuthCount
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFailedAuthCount:(id)a3
{
}

- (double)authTriggeredTime
{
  return self->_authTriggeredTime;
}

- (void)setAuthTriggeredTime:(double)a3
{
  self->_authTriggeredTime = a3;
}

- (double)authLastFailedTime
{
  return self->_authLastFailedTime;
}

- (void)setAuthLastFailedTime:(double)a3
{
  self->_authLastFailedTime = a3;
}

- (double)authLastPassedTime
{
  return self->_authLastPassedTime;
}

- (void)setAuthLastPassedTime:(double)a3
{
  self->_authLastPassedTime = a3;
}

- (NSUserDefaults)defaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDefaults:(id)a3
{
}

- (NSNumber)defaultTimer
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDefaultTimer:(id)a3
{
}

- (NSDictionary)trustedDataShared
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTrustedDataShared:(id)a3
{
}

- (PPSTelemetryIdentifier)ppsId
{
  return self->_ppsId;
}

- (void)setPpsId:(PPSTelemetryIdentifier *)a3
{
  self->_ppsId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedDataShared, 0);
  objc_storeStrong((id *)&self->_defaultTimer, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_failedAuthCount, 0);
  objc_storeStrong((id *)&self->_periodicTimer, 0);
  objc_storeStrong((id *)&self->_initialData, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end