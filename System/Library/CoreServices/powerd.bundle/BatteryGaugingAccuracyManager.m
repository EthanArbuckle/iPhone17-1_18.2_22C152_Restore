@interface BatteryGaugingAccuracyManager
+ (id)InstanceManager;
- (BOOL)chargeToFullDueToDOD0:(double)a3 time:(id)a4;
- (BOOL)chargeToFullDueToQMax:(double)a3 time:(id)a4;
- (BOOL)disableSocLimitPolicy;
- (BOOL)lastChargeToFullRequested;
- (NSArray)lastDOD0Values;
- (NSArray)lastQMaxArray;
- (NSDate)lastAttemptedFullChargeDate;
- (NSDate)lastDOD0Update;
- (NSDate)lastFullChargeDate;
- (NSDate)lastQMaxUpdate;
- (NSDate)lastQualifiedQmaxDate;
- (NSNumber)lastDOD0ValueAtQualQmax;
- (NSNumber)testDOD0UpdateDate;
- (NSNumber)testFullyChargedDate;
- (NSNumber)testQmaxUpdateDate;
- (NSNumber)testQualifiedQMaxDOD0Value;
- (NSNumber)testQualifiedQMaxDate;
- (double)timeSinceLastDOD0Update;
- (double)timeSinceLastQmaxUpdate;
- (id)batteryPercentFromBatteryProperties:(id)a3;
- (id)dod0ArrayFromBatteryProperties:(id)a3;
- (id)dod0AtQualQmaxFromBatteryProperties:(id)a3;
- (id)externalConnectedFromBatteryProperties:(id)a3;
- (id)fcStatusFromBatteryProperties:(id)a3;
- (id)gaugingAccuracyMetricGet;
- (id)gaugingMitigationStatistics;
- (id)getBatteryProperties;
- (id)initBatteryGaugingAccuracyData;
- (id)qMaxFromBatteryProperties:(id)a3;
- (unint64_t)lastMaxDaysSinceFC;
- (unint64_t)lastMaxDaysSinceOcv;
- (unint64_t)lastMaxDaysSinceQmax;
- (unint64_t)lastNumOfChargeToFullReached;
- (unint64_t)lastNumOfChargeToFullRequest;
- (unint64_t)lastNumOfDOD0QualQmaxUpdates;
- (unint64_t)lastNumOfOcvRequested;
- (unint64_t)lastNumOfQmaxRequested;
- (unint64_t)lastNumOfQmaxTooOld;
- (unint64_t)lastNumOfQmaxTooRecent;
- (unint64_t)lastNumOfQmaxTooSmall;
- (unint64_t)maxDaysSinceFC;
- (unint64_t)maxDaysSinceOcv;
- (unint64_t)maxDaysSinceQmax;
- (unint64_t)numOfChargeToFullReached;
- (unint64_t)numOfChargeToFullRequest;
- (unint64_t)numOfDOD0QualQmaxUpdates;
- (unint64_t)numOfOcvRequested;
- (unint64_t)numOfQmaxRequested;
- (unint64_t)numOfQmaxTooOld;
- (unint64_t)numOfQmaxTooRecent;
- (unint64_t)numOfQmaxTooSmall;
- (void)handleAlarmEvent:(id)a3;
- (void)handleBatteryStateDataUpdate;
- (void)incrAnalyticsMetricsAttribute:(unint64_t *)a3;
- (void)periodicActions;
- (void)periodicChargeToFullCheck;
- (void)reportMonthlyData;
- (void)requestPeriodicActionsInMinutes:(int)a3 waking:(BOOL)a4;
- (void)restoreAnalyticDataFromDisk:(id)a3 :(unint64_t *)a4;
- (void)setLastAttemptedFullChargeDate:(id)a3;
- (void)setLastChargeToFullRequested:(BOOL)a3;
- (void)setLastDOD0Update:(id)a3;
- (void)setLastDOD0ValueAtQualQmax:(id)a3;
- (void)setLastDOD0Values:(id)a3;
- (void)setLastFullChargeDate:(id)a3;
- (void)setLastMaxDaysSinceFC:(unint64_t)a3;
- (void)setLastMaxDaysSinceOcv:(unint64_t)a3;
- (void)setLastMaxDaysSinceQmax:(unint64_t)a3;
- (void)setLastNumOfChargeToFullReached:(unint64_t)a3;
- (void)setLastNumOfChargeToFullRequest:(unint64_t)a3;
- (void)setLastNumOfDOD0QualQmaxUpdates:(unint64_t)a3;
- (void)setLastNumOfOcvRequested:(unint64_t)a3;
- (void)setLastNumOfQmaxRequested:(unint64_t)a3;
- (void)setLastNumOfQmaxTooOld:(unint64_t)a3;
- (void)setLastNumOfQmaxTooRecent:(unint64_t)a3;
- (void)setLastNumOfQmaxTooSmall:(unint64_t)a3;
- (void)setLastQMaxArray:(id)a3;
- (void)setLastQMaxUpdate:(id)a3;
- (void)setLastQualifiedQmaxDate:(id)a3;
- (void)setMaxDaysSinceFC:(unint64_t)a3;
- (void)setMaxDaysSinceOcv:(unint64_t)a3;
- (void)setMaxDaysSinceQmax:(unint64_t)a3;
- (void)setNumOfChargeToFullReached:(unint64_t)a3;
- (void)setNumOfChargeToFullRequest:(unint64_t)a3;
- (void)setNumOfDOD0QualQmaxUpdates:(unint64_t)a3;
- (void)setNumOfOcvRequested:(unint64_t)a3;
- (void)setNumOfQmaxRequested:(unint64_t)a3;
- (void)setNumOfQmaxTooOld:(unint64_t)a3;
- (void)setNumOfQmaxTooRecent:(unint64_t)a3;
- (void)setNumOfQmaxTooSmall:(unint64_t)a3;
- (void)setTestDOD0UpdateDate:(id)a3;
- (void)setTestFullyChargedDate:(id)a3;
- (void)setTestQmaxUpdateDate:(id)a3;
- (void)setTestQualifiedQMaxDOD0Value:(id)a3;
- (void)setTestQualifiedQMaxDate:(id)a3;
- (void)setTimeSinceLastDOD0Update:(double)a3;
- (void)setTimeSinceLastQmaxUpdate:(double)a3;
- (void)updateAnalyticsData;
- (void)updateAnalyticsMetricsMaxAttribute:(unint64_t *)a3 interval:(double)a4;
- (void)updateLastDOD0Values:(id)a3 atDate:(id)a4;
- (void)updateLastQMaxArray:(id)a3 atDate:(id)a4;
- (void)writeNSNumberDataToDisk:(id)a3 :(id)a4;
@end

@implementation BatteryGaugingAccuracyManager

- (id)dod0AtQualQmaxFromBatteryProperties:(id)a3
{
  v3 = qword_1000A4F68;
  id v4 = a3;
  dispatch_assert_queue_V2(v3);
  v5 = [v4 objectForKeyedSubscript:@"BatteryData"];

  v6 = [v5 objectForKeyedSubscript:@"Dod0AtQualifiedQmax"];

  if (v6) {
    id v7 = v6;
  }

  return v6;
}

- (id)batteryPercentFromBatteryProperties:(id)a3
{
  v3 = qword_1000A4F68;
  id v4 = a3;
  dispatch_assert_queue_V2(v3);
  v5 = [v4 objectForKeyedSubscript:@"BatteryData"];

  v6 = [v5 objectForKeyedSubscript:@"StateOfCharge"];

  if (v6) {
    id v7 = v6;
  }

  return v6;
}

- (id)fcStatusFromBatteryProperties:(id)a3
{
  v3 = qword_1000A4F68;
  id v4 = a3;
  dispatch_assert_queue_V2(v3);
  v5 = [v4 objectForKeyedSubscript:@"FullyCharged"];

  if (v5) {
    id v6 = v5;
  }

  return v5;
}

- (id)externalConnectedFromBatteryProperties:(id)a3
{
  v3 = qword_1000A4F68;
  id v4 = a3;
  dispatch_assert_queue_V2(v3);
  v5 = [v4 objectForKeyedSubscript:@"ExternalConnected"];

  if (v5) {
    id v6 = v5;
  }

  return v5;
}

- (id)dod0ArrayFromBatteryProperties:(id)a3
{
  id v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  id v4 = [v3 objectForKeyedSubscript:@"BatteryData"];
  v5 = [v4 objectForKeyedSubscript:@"DOD0"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
  }
  else
  {
    id v7 = [v3 objectForKeyedSubscript:@"BatteryFCCData"];
    v8 = [v7 objectForKeyedSubscript:@"DOD0"];

    if (v8)
    {
      v10 = v8;
      id v6 = +[NSArray arrayWithObjects:&v10 count:1];
    }
    else
    {
      id v6 = &__NSArray0__struct;
    }
  }

  return v6;
}

- (id)qMaxFromBatteryProperties:(id)a3
{
  id v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  id v4 = [v3 objectForKeyedSubscript:@"BatteryData"];
  v5 = [v4 objectForKeyedSubscript:@"Qmax"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
  }
  else
  {
    id v7 = [v3 objectForKeyedSubscript:@"BatteryData"];
    v8 = [v7 objectForKeyedSubscript:@"ITMiscStatus"];

    if (v8)
    {
      id v6 = +[NSMutableArray array];
      [v6 addObject:v8];
    }
    else
    {
      id v6 = &__NSArray0__struct;
    }
  }

  return v6;
}

- (BOOL)chargeToFullDueToDOD0:(double)a3 time:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  testDOD0UpdateDate = self->_testDOD0UpdateDate;
  if (!testDOD0UpdateDate)
  {
    if (a3 >= 259200.0) {
      goto LABEL_7;
    }
    [(BatteryGaugingAccuracyManager *)self incrAnalyticsMetricsAttribute:&self->_numOfOcvRequested];
    v10 = qword_1000A4608;
    BOOL v11 = 0;
    if (!os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    int v17 = 134217984;
    double v18 = a3 / 86400.0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Last DOD0 Change: %.1f days too recent", (uint8_t *)&v17, 0xCu);
LABEL_13:
    BOOL v11 = 0;
    goto LABEL_14;
  }
  [(NSNumber *)testDOD0UpdateDate doubleValue];
  v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  [v6 timeIntervalSinceDate:v8];
  if (v9 < 259200.0)
  {
    v13 = (void *)qword_1000A4608;
    if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      [v6 timeIntervalSinceDate:v8];
      int v17 = 134217984;
      double v18 = v15 / 86400.0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "(Test) Last DOD0 Change: %.1f days too recent", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_13;
  }

LABEL_7:
  v12 = qword_1000A4608;
  if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134217984;
    double v18 = a3 / 86400.0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Last DOD0 Change: %.1f days ago; charge to full",
      (uint8_t *)&v17,
      0xCu);
  }
  BOOL v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)chargeToFullDueToQMax:(double)a3 time:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  testQmaxUpdateDate = self->_testQmaxUpdateDate;
  if (testQmaxUpdateDate)
  {
    [(NSNumber *)testQmaxUpdateDate doubleValue];
    v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v6 timeIntervalSinceDate:v8];
    if (v9 < 1209600.0)
    {
      v16 = (void *)qword_1000A4608;
      if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = v16;
        [v6 timeIntervalSinceDate:v8];
        int v40 = 134217984;
        double v41 = v18 / 86400.0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "(Test) Last Qmax change was %.1f days ago too recent", (uint8_t *)&v40, 0xCu);
      }
      goto LABEL_28;
    }
  }
  else if (a3 < 1209600.0)
  {
    v10 = qword_1000A4608;
    if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 134217984;
      double v41 = a3 / 86400.0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Last Qmax change was %.1f days ago too recent", (uint8_t *)&v40, 0xCu);
    }
    p_numOfQmaxTooRecent = &self->_numOfQmaxTooRecent;
    goto LABEL_32;
  }
  testQualifiedQMaxDOD0Value = self->_testQualifiedQMaxDOD0Value;
  if (!testQualifiedQMaxDOD0Value)
  {
    lastDOD0ValueAtQualQmax = self->_lastDOD0ValueAtQualQmax;
    if (lastDOD0ValueAtQualQmax && [(NSNumber *)lastDOD0ValueAtQualQmax intValue] <= 50000)
    {
      v20 = (void *)qword_1000A4608;
      if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->_lastDOD0ValueAtQualQmax;
        v22 = v20;
        int v40 = 67109120;
        LODWORD(v41) = [(NSNumber *)v21 intValue];
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "QMax update necessary, but dod0 at last qual Qmax was too small (%d)", (uint8_t *)&v40, 8u);
      }
      p_numOfQmaxTooRecent = &self->_numOfQmaxTooSmall;
      goto LABEL_32;
    }
LABEL_19:
    testQualifiedQMaxDate = self->_testQualifiedQMaxDate;
    if (testQualifiedQMaxDate)
    {
      [(NSNumber *)testQualifiedQMaxDate doubleValue];
      v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      v24 = +[NSDate now];
      [v24 timeIntervalSinceDate:v8];
      double v26 = v25;

      if (v26 >= 108000.0)
      {
        v31 = (void *)qword_1000A4608;
        if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
        {
          v32 = v31;
          v33 = +[NSDate now];
          [v33 timeIntervalSinceDate:self->_lastQualifiedQmaxDate];
          int v40 = 134217984;
          double v41 = v34 / 3600.0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "(Test) QMax update necessary, but last qualQmax was too long ago (%.1f hours)", (uint8_t *)&v40, 0xCu);
        }
        goto LABEL_28;
      }

      goto LABEL_23;
    }
    v27 = +[NSDate now];
    [v27 timeIntervalSinceDate:self->_lastQualifiedQmaxDate];
    double v29 = v28;

    if (v29 < 108000.0)
    {
LABEL_23:
      v30 = qword_1000A4608;
      if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
      {
        int v40 = 134217984;
        double v41 = a3 / 86400.0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Last QMax Change: %.1f days ago; charge to full now",
          (uint8_t *)&v40,
          0xCu);
      }
      [(BatteryGaugingAccuracyManager *)self incrAnalyticsMetricsAttribute:&self->_numOfQmaxRequested];
      BOOL v14 = 1;
      goto LABEL_34;
    }
    v35 = (void *)qword_1000A4608;
    if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v35;
      v37 = +[NSDate now];
      [v37 timeIntervalSinceDate:self->_lastQualifiedQmaxDate];
      int v40 = 134217984;
      double v41 = v38 / 3600.0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "QMax update necessary, but last qualQmax was too long ago (%.1f hours)", (uint8_t *)&v40, 0xCu);
    }
    p_numOfQmaxTooRecent = &self->_numOfQmaxTooOld;
LABEL_32:
    [(BatteryGaugingAccuracyManager *)self incrAnalyticsMetricsAttribute:p_numOfQmaxTooRecent];
    goto LABEL_33;
  }
  if ([(NSNumber *)testQualifiedQMaxDOD0Value intValue] > 50000) {
    goto LABEL_19;
  }
  v13 = (void *)qword_1000A4608;
  BOOL v14 = 0;
  if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = self->_testQualifiedQMaxDOD0Value;
    v8 = v13;
    int v40 = 67109120;
    LODWORD(v41) = [(NSNumber *)v15 intValue];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(Test) QMax update necessary, but dod0 at last qual Qmax was too small (%d)", (uint8_t *)&v40, 8u);
LABEL_28:

LABEL_33:
    BOOL v14 = 0;
  }
LABEL_34:

  return v14;
}

- (void)requestPeriodicActionsInMinutes:(int)a3 waking:(BOOL)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  time_t v6 = time(0);
  xpc_dictionary_set_date(xdict, "Date", 1000000000 * (v6 + 60 * a3));
  if (!a4) {
    xpc_dictionary_set_BOOL(xdict, "ShouldWake", 0);
  }
  xpc_set_event();
}

- (void)handleAlarmEvent:(id)a3
{
  id v4 = qword_1000A4F68;
  id v5 = a3;
  dispatch_assert_queue_V2(v4);
  time_t v6 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v5, _xpc_event_key_name)];
  xpc_object_t reply = xpc_dictionary_create_reply(v5);
  xpc_dictionary_get_remote_connection(v5);
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  xpc_connection_send_message(v8, reply);
  double v9 = qword_1000A4608;
  if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    BOOL v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Alarm fired for %@", (uint8_t *)&v10, 0xCu);
  }
  if ([v6 isEqualToString:@"GaugingMitigationActions"]) {
    [(BatteryGaugingAccuracyManager *)self periodicActions];
  }
}

- (id)getBatteryProperties
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  CFDictionaryRef v2 = IOServiceMatching("IOPMPowerSource");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    io_object_t v4 = MatchingService;
    CFMutableDictionaryRef properties = 0;
    IORegistryEntryCreateCFProperties(MatchingService, &properties, kCFAllocatorDefault, 0);
    id v5 = [(__CFDictionary *)properties copy];
    IOObjectRelease(v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)updateAnalyticsMetricsMaxAttribute:(unint64_t *)a3 interval:(double)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  double v6 = (double)*a3;
  if (a4 / 86400.0 > v6) {
    double v6 = a4 / 86400.0;
  }
  *a3 = (unint64_t)v6;
}

- (void)incrAnalyticsMetricsAttribute:(unint64_t *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  id v5 = [(BatteryGaugingAccuracyManager *)self getBatteryProperties];
  double v6 = [(BatteryGaugingAccuracyManager *)self externalConnectedFromBatteryProperties:v5];

  if (v6 && [v6 BOOLValue]) {
    ++*a3;
  }

  _objc_release_x1();
}

- (id)gaugingAccuracyMetricGet
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  id v3 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];
  io_object_t v4 = qword_1000A4608;
  if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "gaugingAccuracyMetricGet policy state\n", v16, 2u);
  }
  [v3 setObject:self->_lastDOD0ValueAtQualQmax forKeyedSubscript:@"lastQualQmaxDODValue"];
  [v3 setObject:self->_lastQualifiedQmaxDate forKeyedSubscript:@"lastQualQMaxDate"];
  [v3 setObject:self->_lastQMaxUpdate forKeyedSubscript:@"lastQMaxUpdate"];
  [v3 setObject:self->_lastDOD0Update forKeyedSubscript:@"lastDOD0Update"];
  [v3 setObject:self->_lastFullChargeDate forKeyedSubscript:@"lastFullChargeDate"];
  [v3 setObject:self->_lastAttemptedFullChargeDate forKeyedSubscript:@"lastAttemptedFullChargeDate"];
  id v5 = +[NSNumber numberWithBool:self->_lastChargeToFullRequested];
  [v3 setObject:v5 forKeyedSubscript:@"lastFullChargeReq"];

  testQmaxUpdateDate = self->_testQmaxUpdateDate;
  if (testQmaxUpdateDate)
  {
    [(NSNumber *)testQmaxUpdateDate doubleValue];
    id v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v3 setObject:v7 forKeyedSubscript:@"testQmaxUpdateDate"];
  }
  testDOD0UpdateDate = self->_testDOD0UpdateDate;
  if (testDOD0UpdateDate)
  {
    [(NSNumber *)testDOD0UpdateDate doubleValue];
    double v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v3 setObject:v9 forKeyedSubscript:@"testDOD0UpdateDate"];
  }
  testFullyChargedDate = self->_testFullyChargedDate;
  if (testFullyChargedDate)
  {
    [(NSNumber *)testFullyChargedDate doubleValue];
    BOOL v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v3 setObject:v11 forKeyedSubscript:@"testFullyChargedDate"];
  }
  testQualifiedQMaxDate = self->_testQualifiedQMaxDate;
  if (testQualifiedQMaxDate)
  {
    [(NSNumber *)testQualifiedQMaxDate doubleValue];
    v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v3 setObject:v13 forKeyedSubscript:@"testQualQMaxDate"];
  }
  testQualifiedQMaxDOD0Value = self->_testQualifiedQMaxDOD0Value;
  if (testQualifiedQMaxDOD0Value) {
    [v3 setObject:testQualifiedQMaxDOD0Value forKeyedSubscript:@"testQualQmaxDODValue"];
  }

  return v3;
}

- (void)periodicActions
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  id v3 = [(BatteryGaugingAccuracyManager *)self getBatteryProperties];
  io_object_t v4 = v3;
  if (v3 && [v3 count])
  {
    [(BatteryGaugingAccuracyManager *)self reportMonthlyData];
    id v5 = +[NSDate date];
    double v6 = [(BatteryGaugingAccuracyManager *)self dod0AtQualQmaxFromBatteryProperties:v4];
    id v7 = v6;
    if (v6
      && (unsigned int v8 = [v6 intValue],
          v8 != [(NSNumber *)self->_lastDOD0ValueAtQualQmax intValue]))
    {
      objc_storeStrong((id *)&self->_lastDOD0ValueAtQualQmax, v7);
      objc_storeStrong((id *)&self->_lastQualifiedQmaxDate, v5);
      BOOL v11 = qword_1000A4608;
      if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
      {
        lastDOD0ValueAtQualQmax = self->_lastDOD0ValueAtQualQmax;
        *(_DWORD *)buf = 138412290;
        double v34 = lastDOD0ValueAtQualQmax;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "dod0 at qualQmax value has changed, update it %@\n", buf, 0xCu);
      }
      [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastQualQmaxDODValue" :v7];
      [(NSDate *)self->_lastQualifiedQmaxDate timeIntervalSinceReferenceDate];
      v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastQualQMaxDate" :v13];

      [(BatteryGaugingAccuracyManager *)self incrAnalyticsMetricsAttribute:&self->_numOfDOD0QualQmaxUpdates];
      int v9 = 1;
    }
    else
    {
      int v9 = 0;
    }
    BOOL v14 = [(BatteryGaugingAccuracyManager *)self batteryPercentFromBatteryProperties:v4];
    double v15 = v14;
    if (v14) {
      int v32 = [v14 integerValue];
    }
    else {
      int v32 = 0;
    }
    v16 = [(BatteryGaugingAccuracyManager *)self externalConnectedFromBatteryProperties:v4];
    int v17 = v16;
    if (v16) {
      unsigned int v18 = [v16 BOOLValue];
    }
    else {
      unsigned int v18 = 0;
    }
    v19 = [(BatteryGaugingAccuracyManager *)self fcStatusFromBatteryProperties:v4];
    v20 = v19;
    v21 = (_DWORD *)&unk_1000A4000;
    if (v19)
    {
      unsigned int v22 = [v19 integerValue];
      if (v22)
      {
        int v31 = v9;
        objc_storeStrong((id *)&self->_lastFullChargeDate, v5);
        lastAttemptedFullChargeDate = self->_lastAttemptedFullChargeDate;
        self->_lastAttemptedFullChargeDate = 0;

        v24 = qword_1000A4608;
        if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
        {
          lastFullChargeDate = self->_lastFullChargeDate;
          *(_DWORD *)buf = 138412290;
          double v34 = lastFullChargeDate;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "FC detected, updating lastFullyCharge date to %@", buf, 0xCu);
        }
        [(NSDate *)self->_lastFullChargeDate timeIntervalSinceReferenceDate];
        double v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastFullChargeDate" :v26];

        [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastAttemptedFullChargeDate" :0];
        v21 = &unk_1000A4000;
        if (dword_1000A4F70)
        {
          int v9 = v31;
        }
        else
        {
          [(BatteryGaugingAccuracyManager *)self incrAnalyticsMetricsAttribute:&self->_numOfChargeToFullReached];
          v21 = &unk_1000A4000;
          int v9 = 1;
        }
      }
      else
      {
        v21 = (_DWORD *)&unk_1000A4000;
      }
    }
    else
    {
      unsigned int v22 = 0;
    }
    v21[988] = v22;
    [(BatteryGaugingAccuracyManager *)self periodicChargeToFullCheck];
    if (v32 > 95) {
      unsigned int v27 = v18;
    }
    else {
      unsigned int v27 = 0;
    }
    if (v27 != 1 || v22)
    {
      double v28 = self;
      uint64_t v29 = 60;
      uint64_t v30 = 0;
    }
    else
    {
      double v28 = self;
      uint64_t v29 = 5;
      uint64_t v30 = 1;
    }
    [(BatteryGaugingAccuracyManager *)v28 requestPeriodicActionsInMinutes:v29 waking:v30];
    if (v9) {
      [(BatteryGaugingAccuracyManager *)self updateAnalyticsData];
    }
  }
  else
  {
    int v10 = qword_1000A4608;
    if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Invalid batteryProperties, skip updating Qmax", buf, 2u);
    }
  }
}

- (id)gaugingMitigationStatistics
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  id v3 = +[NSMutableDictionary dictionary];
  io_object_t v4 = +[NSNumber numberWithInteger:self->_numOfChargeToFullRequest - self->_lastNumOfChargeToFullRequest];
  [v3 setObject:v4 forKeyedSubscript:@"nrOfPeriodicFullChargeRequested"];

  id v5 = +[NSNumber numberWithInteger:self->_numOfChargeToFullReached - self->_lastNumOfChargeToFullReached];
  [v3 setObject:v5 forKeyedSubscript:@"nrOfSessionsReachingFullCharge"];

  double v6 = +[NSNumber numberWithInteger:self->_numOfDOD0QualQmaxUpdates - self->_lastNumOfDOD0QualQmaxUpdates];
  [v3 setObject:v6 forKeyedSubscript:@"nrOfDOD0AtQualifiedQmaxUpdates"];

  id v7 = +[NSNumber numberWithInteger:self->_numOfQmaxTooRecent - self->_lastNumOfQmaxTooRecent];
  [v3 setObject:v7 forKeyedSubscript:@"nrOfQMaxTooRecent"];

  unsigned int v8 = +[NSNumber numberWithInteger:self->_numOfQmaxTooOld - self->_lastNumOfQmaxTooOld];
  [v3 setObject:v8 forKeyedSubscript:@"nrOfQMaxTooOld"];

  int v9 = +[NSNumber numberWithInteger:self->_numOfQmaxTooSmall - self->_lastNumOfQmaxTooSmall];
  [v3 setObject:v9 forKeyedSubscript:@"nrOfDOD0TooSmall"];

  int v10 = +[NSNumber numberWithInteger:self->_numOfQmaxRequested - self->_lastNumOfQmaxRequested];
  [v3 setObject:v10 forKeyedSubscript:@"nrOfQMaxRequested"];

  BOOL v11 = +[NSNumber numberWithInteger:self->_numOfOcvRequested - self->_lastNumOfOcvRequested];
  [v3 setObject:v11 forKeyedSubscript:@"nrOfOCVRequested"];

  v12 = +[NSNumber numberWithInteger:self->_maxDaysSinceQmax - self->_lastMaxDaysSinceQmax];
  [v3 setObject:v12 forKeyedSubscript:@"maxDaysSinceQmax"];

  v13 = +[NSNumber numberWithInteger:self->_maxDaysSinceOcv - self->_lastMaxDaysSinceOcv];
  [v3 setObject:v13 forKeyedSubscript:@"maxDaysSinceOCV"];

  BOOL v14 = +[NSNumber numberWithInteger:self->_maxDaysSinceFC - self->_lastMaxDaysSinceFC];
  [v3 setObject:v14 forKeyedSubscript:@"maxDaysSinceLastFullCharge"];

  long long v15 = *(_OWORD *)&self->_numOfChargeToFullRequest;
  long long v16 = *(_OWORD *)&self->_numOfDOD0QualQmaxUpdates;
  *(_OWORD *)&self->_lastNumOfChargeToFullRequest = v15;
  *(_OWORD *)&self->_lastNumOfDOD0QualQmaxUpdates = v16;
  long long v17 = *(_OWORD *)&self->_numOfQmaxRequested;
  *(_OWORD *)&self->_lastNumOfQmaxTooOld = *(_OWORD *)&self->_numOfQmaxTooOld;
  *(_OWORD *)&self->_lastNumOfQmaxRequested = v17;
  *(_OWORD *)&self->_lastMaxDaysSinceQmax = *(_OWORD *)&self->_maxDaysSinceQmax;
  self->_lastMaxDaysSinceFC = self->_maxDaysSinceFC;
  unsigned int v18 = +[NSNumber numberWithInteger:(void)v15];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastNrOfPeriodicFullChargeRequested" :v18];

  v19 = +[NSNumber numberWithInteger:self->_lastNumOfChargeToFullReached];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastNrOfSessionsReachingFullCharge" :v19];

  v20 = +[NSNumber numberWithInteger:self->_lastNumOfDOD0QualQmaxUpdates];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastNrOfDOD0AtQualifiedQmaxUpdates" :v20];

  v21 = +[NSNumber numberWithInteger:self->_lastNumOfQmaxTooRecent];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastNrOfQMaxTooRecent" :v21];

  unsigned int v22 = +[NSNumber numberWithInteger:self->_lastNumOfQmaxTooOld];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastNrOfQMaxTooOld" :v22];

  v23 = +[NSNumber numberWithInteger:self->_lastNumOfQmaxTooSmall];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastNrOfDOD0TooSmall" :v23];

  v24 = +[NSNumber numberWithInteger:self->_lastNumOfQmaxRequested];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastNrOfQMaxRequested" :v24];

  double v25 = +[NSNumber numberWithInteger:self->_lastNumOfOcvRequested];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastNrOfOCVRequested" :v25];

  double v26 = +[NSNumber numberWithInteger:self->_lastMaxDaysSinceQmax];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastMaxDaysSinceQmax" :v26];

  unsigned int v27 = +[NSNumber numberWithInteger:self->_lastMaxDaysSinceOcv];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastMaxDaysSinceOCV" :v27];

  double v28 = +[NSNumber numberWithInteger:self->_lastMaxDaysSinceFC];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastMaxDaysSinceLastFullCharge" :v28];

  return v3;
}

- (void)reportMonthlyData
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  id v3 = (void *)os_transaction_create();
  io_object_t v4 = (void *)CFPreferencesCopyAppValue(@"MonthlyDataReportedDate", @"com.apple.powerd.batterygauging");
  id v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    double v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    id v7 = +[NSDate date];
    unsigned int v8 = v7;
    if (v6 && ([v7 timeIntervalSinceDate:v6], v9 < 2592000.0))
    {
      int v10 = qword_1000A4608;
      if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v16 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Considered submitting monthly OBC analytics, but not enough time has passed since last submission: %@", buf, 0xCu);
      }
    }
    else
    {
      [v8 timeIntervalSinceReferenceDate];
      BOOL v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"MonthlyDataReportedDate" :v11];

      BOOL v14 = [(BatteryGaugingAccuracyManager *)self gaugingMitigationStatistics];
      id v12 = v14;
      AnalyticsSendEventLazy();
    }
  }
  else
  {
    v13 = qword_1000A4608;
    if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "reportMonthlyData invalid interval\n", buf, 2u);
    }
  }
}

- (void)periodicChargeToFullCheck
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  id v3 = (void *)CFPreferencesCopyAppValue(@"MonthlyDataReportedDate", @"com.apple.powerd.batterygauging");
  io_object_t v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    id v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    double v6 = +[NSDate date];
    id v7 = v6;
    if (v5 && ([v6 timeIntervalSinceDate:v5], v8 < 43200.0))
    {
      double v9 = qword_1000A4608;
      if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not enough time has passed since last charge to full check: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      int v10 = qword_1000A4608;
      if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "periodicChargeToFullCheck run disableSocLimitPolicy\n", (uint8_t *)&v12, 2u);
      }
      [(BatteryGaugingAccuracyManager *)self handleBatteryStateDataUpdate];
    }
  }
  else
  {
    BOOL v11 = qword_1000A4608;
    if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "periodicChargeToFullCheck invalid interval\n", (uint8_t *)&v12, 2u);
    }
  }
}

- (BOOL)disableSocLimitPolicy
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  id v3 = [(BatteryGaugingAccuracyManager *)self getBatteryProperties];
  io_object_t v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = +[NSDate date];
    double v6 = [(BatteryGaugingAccuracyManager *)self qMaxFromBatteryProperties:v4];
    id v7 = v6;
    double v8 = 0.0;
    double v9 = 0.0;
    if (v6)
    {
      if (([v6 isEqualToArray:self->_lastQMaxArray] & 1) == 0) {
        [(BatteryGaugingAccuracyManager *)self updateLastQMaxArray:v7 atDate:v5];
      }
      [v5 timeIntervalSinceDate:self->_lastQMaxUpdate];
      double v9 = v10;
      self->_timeSinceLastQmaxUpdate = v10;
      -[BatteryGaugingAccuracyManager updateAnalyticsMetricsMaxAttribute:interval:](self, "updateAnalyticsMetricsMaxAttribute:interval:", &self->_maxDaysSinceQmax);
    }
    unsigned int v11 = [(BatteryGaugingAccuracyManager *)self chargeToFullDueToQMax:v5 time:v9];
    int v12 = [(BatteryGaugingAccuracyManager *)self dod0ArrayFromBatteryProperties:v4];
    v13 = v12;
    if (v12)
    {
      if (([v12 isEqualToArray:self->_lastDOD0Values] & 1) == 0) {
        [(BatteryGaugingAccuracyManager *)self updateLastDOD0Values:v13 atDate:v5];
      }
      [v5 timeIntervalSinceDate:self->_lastDOD0Update];
      double v8 = v14;
      self->_timeSinceLastDOD0Update = v14;
      -[BatteryGaugingAccuracyManager updateAnalyticsMetricsMaxAttribute:interval:](self, "updateAnalyticsMetricsMaxAttribute:interval:", &self->_maxDaysSinceOcv);
    }
    unsigned int v15 = v11 | [(BatteryGaugingAccuracyManager *)self chargeToFullDueToDOD0:v5 time:v8];
    testFullyChargedDate = self->_testFullyChargedDate;
    if (testFullyChargedDate)
    {
      [(NSNumber *)testFullyChargedDate doubleValue];
      long long v17 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      [v5 timeIntervalSinceDate:v17];
      if (v18 > 1814400.0)
      {
        v19 = (void *)qword_1000A4608;
        if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v19;
          [v5 timeIntervalSinceDate:v17];
          int v38 = 134217984;
          double v39 = v21 / 86400.0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "(Test) Last full charge date was %.1f days ago, try and charge to full", (uint8_t *)&v38, 0xCu);
        }
        unsigned int v15 = 1;
      }
LABEL_16:

LABEL_17:
      unsigned int v22 = qword_1000A4608;
      if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
      {
        int v38 = 67109120;
        LODWORD(v39) = v15;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Charge To Full Request:%d", (uint8_t *)&v38, 8u);
      }

      goto LABEL_22;
    }
    p_lastFullChargeDate = &self->_lastFullChargeDate;
    if (!self->_lastFullChargeDate) {
      goto LABEL_17;
    }
    objc_msgSend(v5, "timeIntervalSinceDate:");
    if (v26 <= 1814400.0)
    {
      if (!*p_lastFullChargeDate) {
        goto LABEL_17;
      }
      double v34 = (void *)qword_1000A4608;
      if (!os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      v35 = *p_lastFullChargeDate;
      long long v17 = v34;
      [v5 timeIntervalSinceDate:v35];
      int v38 = 134217984;
      double v39 = v36 / 86400.0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Last full charge date was %.1f days ago too recent", (uint8_t *)&v38, 0xCu);
      goto LABEL_16;
    }
    unsigned int v27 = (void *)qword_1000A4608;
    if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
    {
      double v28 = *p_lastFullChargeDate;
      uint64_t v29 = v27;
      [v5 timeIntervalSinceDate:v28];
      int v38 = 134217984;
      double v39 = v30 / 86400.0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Last full charge date was %.1f days ago, try and charge to full", (uint8_t *)&v38, 0xCu);
    }
    [v5 timeIntervalSinceDate:self->_lastFullChargeDate];
    -[BatteryGaugingAccuracyManager updateAnalyticsMetricsMaxAttribute:interval:](self, "updateAnalyticsMetricsMaxAttribute:interval:", &self->_maxDaysSinceFC);
    if (self->_lastAttemptedFullChargeDate)
    {
      objc_msgSend(v5, "timeIntervalSinceDate:");
      if (v31 > 43200.0)
      {
        objc_storeStrong((id *)&self->_lastFullChargeDate, v5);
        lastAttemptedFullChargeDate = self->_lastAttemptedFullChargeDate;
        self->_lastAttemptedFullChargeDate = 0;

        [(NSDate *)self->_lastFullChargeDate timeIntervalSinceReferenceDate];
        v33 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastFullChargeDate" :v33];

        [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastAttemptedFullChargeDate" :0];
LABEL_35:
        unsigned int v15 = 1;
        goto LABEL_17;
      }
      if (self->_lastAttemptedFullChargeDate) {
        goto LABEL_35;
      }
    }
    objc_storeStrong((id *)&self->_lastAttemptedFullChargeDate, v5);
    [(NSDate *)self->_lastAttemptedFullChargeDate timeIntervalSinceReferenceDate];
    v37 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"lastAttemptedFullChargeDate" :v37];

    goto LABEL_35;
  }
  v23 = qword_1000A4608;
  LOBYTE(v15) = 0;
  if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v38) = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Invalid batteryProperties, skip gauging mitigation charge to full action", (uint8_t *)&v38, 2u);
    LOBYTE(v15) = 0;
  }
LABEL_22:

  return v15;
}

- (void)updateAnalyticsData
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  id v3 = +[NSNumber numberWithInteger:self->_numOfChargeToFullRequest];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"nrOfPeriodicFullChargeRequested" :v3];

  io_object_t v4 = +[NSNumber numberWithInteger:self->_numOfChargeToFullReached];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"nrOfSessionsReachingFullCharge" :v4];

  id v5 = +[NSNumber numberWithInteger:self->_numOfDOD0QualQmaxUpdates];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"nrOfDOD0AtQualifiedQmaxUpdates" :v5];

  double v6 = +[NSNumber numberWithInteger:self->_numOfQmaxTooRecent];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"nrOfQMaxTooRecent" :v6];

  id v7 = +[NSNumber numberWithInteger:self->_numOfQmaxTooOld];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"nrOfQMaxTooOld" :v7];

  double v8 = +[NSNumber numberWithInteger:self->_numOfQmaxTooSmall];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"nrOfDOD0TooSmall" :v8];

  double v9 = +[NSNumber numberWithInteger:self->_numOfQmaxRequested];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"nrOfQMaxRequested" :v9];

  double v10 = +[NSNumber numberWithInteger:self->_numOfOcvRequested];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"nrOfOCVRequested" :v10];

  unsigned int v11 = +[NSNumber numberWithInteger:self->_maxDaysSinceQmax];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"maxDaysSinceQmax" :v11];

  int v12 = +[NSNumber numberWithInteger:self->_maxDaysSinceOcv];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"maxDaysSinceOCV" :v12];

  id v13 = +[NSNumber numberWithInteger:self->_maxDaysSinceFC];
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"maxDaysSinceLastFullCharge" :v13];
}

- (void)updateLastQMaxArray:(id)a3 atDate:(id)a4
{
  double v6 = (NSArray *)a3;
  id v7 = (NSDate *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  if (v6) {
    double v8 = v6;
  }
  else {
    double v8 = (NSArray *)&__NSArray0__struct;
  }
  v14[0] = @"lastQMax";
  v14[1] = @"lastQMaxUpdate";
  v15[0] = v8;
  [(NSDate *)v7 timeIntervalSinceReferenceDate];
  double v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v15[1] = v9;
  CFDictionaryRef v10 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  CFPreferencesSetMultiple(v10, 0, @"com.apple.powerd.batterygauging", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  lastQMaxArray = self->_lastQMaxArray;
  self->_lastQMaxArray = v6;
  int v12 = v6;

  lastQMaxUpdate = self->_lastQMaxUpdate;
  self->_lastQMaxUpdate = v7;
}

- (void)updateLastDOD0Values:(id)a3 atDate:(id)a4
{
  double v6 = (NSArray *)a3;
  id v7 = (NSDate *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  if (v6) {
    double v8 = v6;
  }
  else {
    double v8 = (NSArray *)&__NSArray0__struct;
  }
  v14[0] = @"lastDOD0";
  v14[1] = @"lastDOD0Update";
  v15[0] = v8;
  [(NSDate *)v7 timeIntervalSinceReferenceDate];
  double v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v15[1] = v9;
  CFDictionaryRef v10 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  CFPreferencesSetMultiple(v10, 0, @"com.apple.powerd.batterygauging", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  lastDOD0Values = self->_lastDOD0Values;
  self->_lastDOD0Values = v6;
  int v12 = v6;

  lastDOD0Update = self->_lastDOD0Update;
  self->_lastDOD0Update = v7;
}

- (void)writeNSNumberDataToDisk:(id)a3 :(id)a4
{
  id v5 = qword_1000A4F68;
  id v6 = a4;
  key = (__CFString *)a3;
  dispatch_assert_queue_V2(v5);
  CFPreferencesSetAppValue(key, v6, @"com.apple.powerd.batterygauging");
}

- (void)restoreAnalyticDataFromDisk:(id)a3 :(unint64_t *)a4
{
  id v5 = qword_1000A4F68;
  id v6 = (__CFString *)a3;
  dispatch_assert_queue_V2(v5);
  double v8 = (void *)CFPreferencesCopyAppValue(v6, @"com.apple.powerd.batterygauging");

  if (v8) {
    id v7 = [v8 integerValue];
  }
  else {
    id v7 = 0;
  }
  *a4 = (unint64_t)v7;

  _objc_release_x1();
}

- (id)initBatteryGaugingAccuracyData
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  v46.receiver = self;
  v46.super_class = (Class)BatteryGaugingAccuracyManager;
  id v3 = [(BatteryGaugingAccuracyManager *)&v46 init];
  if (!v3) {
    return v3;
  }
  io_object_t v4 = (NSNumber *)CFPreferencesCopyAppValue(@"testQmaxUpdateDate", @"com.apple.powerd.batterygauging");
  testQmaxUpdateDate = v3->_testQmaxUpdateDate;
  v3->_testQmaxUpdateDate = v4;

  id v6 = (NSNumber *)CFPreferencesCopyAppValue(@"testDOD0UpdateDate", @"com.apple.powerd.batterygauging");
  testDOD0UpdateDate = v3->_testDOD0UpdateDate;
  v3->_testDOD0UpdateDate = v6;

  double v8 = (NSNumber *)CFPreferencesCopyAppValue(@"testFullyChargedDate", @"com.apple.powerd.batterygauging");
  testFullyChargedDate = v3->_testFullyChargedDate;
  v3->_testFullyChargedDate = v8;

  CFDictionaryRef v10 = (NSNumber *)CFPreferencesCopyAppValue(@"testQualQMaxDate", @"com.apple.powerd.batterygauging");
  testQualifiedQMaxDate = v3->_testQualifiedQMaxDate;
  v3->_testQualifiedQMaxDate = v10;

  int v12 = (NSNumber *)CFPreferencesCopyAppValue(@"testQualQmaxDODValue", @"com.apple.powerd.batterygauging");
  testQualifiedQMaxDOD0Value = v3->_testQualifiedQMaxDOD0Value;
  v3->_testQualifiedQMaxDOD0Value = v12;

  double v14 = (void *)CFPreferencesCopyAppValue(@"MonthlyDataReportedDate", @"com.apple.powerd.batterygauging");
  if (!v14)
  {
    unsigned int v15 = +[NSDate date];
    [v15 timeIntervalSinceReferenceDate];
    CFPreferencesSetAppValue(@"MonthlyDataReportedDate", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"com.apple.powerd.batterygauging");
  }
  long long v16 = (void *)CFPreferencesCopyAppValue(@"MonthlyDataReportedDate", @"com.apple.powerd.batterygauging");

  if (!v16)
  {
    long long v17 = +[NSDate date];
    [v17 timeIntervalSinceReferenceDate];
    CFPreferencesSetAppValue(@"MonthlyDataReportedDate", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"com.apple.powerd.batterygauging");
  }
  double v18 = (void *)CFPreferencesCopyAppValue(@"lastDOD0", @"com.apple.powerd.batterygauging");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = v18;
LABEL_10:
    lastDOD0Values = v3->_lastDOD0Values;
    v3->_lastDOD0Values = v19;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v48 = v18;
    v19 = +[NSArray arrayWithObjects:&v48 count:1];
    goto LABEL_10;
  }
  lastDOD0Values = v3->_lastDOD0Values;
  v3->_lastDOD0Values = (NSArray *)&__NSArray0__struct;
LABEL_12:

  double v21 = (void *)CFPreferencesCopyAppValue(@"lastDOD0Update", @"com.apple.powerd.batterygauging");
  if (v21)
  {
    [v21 doubleValue];
    +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    +[NSDate date];
  uint64_t v22 = };
  lastDOD0Update = v3->_lastDOD0Update;
  v3->_lastDOD0Update = (NSDate *)v22;

  v24 = (void *)CFPreferencesCopyAppValue(@"lastQMax", @"com.apple.powerd.batterygauging");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v25 = v24;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      lastQMaxArray = v3->_lastQMaxArray;
      v3->_lastQMaxArray = (NSArray *)&__NSArray0__struct;
      goto LABEL_21;
    }
    v47 = v24;
    double v25 = +[NSArray arrayWithObjects:&v47 count:1];
  }
  lastQMaxArray = v3->_lastQMaxArray;
  v3->_lastQMaxArray = v25;
LABEL_21:

  unsigned int v27 = (void *)CFPreferencesCopyAppValue(@"lastQMaxUpdate", @"com.apple.powerd.batterygauging");
  if (v27)
  {
    [v27 doubleValue];
    +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    +[NSDate date];
  uint64_t v28 = };
  lastQMaxUpdate = v3->_lastQMaxUpdate;
  v3->_lastQMaxUpdate = (NSDate *)v28;

  double v30 = (void *)CFPreferencesCopyAppValue(@"lastFullChargeDate", @"com.apple.powerd.batterygauging");
  if (v30)
  {
    [v30 doubleValue];
    uint64_t v31 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    lastFullChargeDate = v3->_lastFullChargeDate;
    v3->_lastFullChargeDate = (NSDate *)v31;
  }
  else
  {
    uint64_t v33 = +[NSDate date];
    double v34 = v3->_lastFullChargeDate;
    v3->_lastFullChargeDate = (NSDate *)v33;

    [(NSDate *)v3->_lastFullChargeDate timeIntervalSinceReferenceDate];
    CFPreferencesSetAppValue(@"lastFullChargeDate", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"com.apple.powerd.batterygauging");
  }
  v35 = (void *)CFPreferencesCopyAppValue(@"lastQualQMaxDate", @"com.apple.powerd.batterygauging");

  if (v35)
  {
    [v35 doubleValue];
    uint64_t v36 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    lastQualifiedQmaxDate = v3->_lastQualifiedQmaxDate;
    v3->_lastQualifiedQmaxDate = (NSDate *)v36;
  }
  else
  {
    uint64_t v38 = +[NSDate date];
    double v39 = v3->_lastQualifiedQmaxDate;
    v3->_lastQualifiedQmaxDate = (NSDate *)v38;

    [(NSDate *)v3->_lastQualifiedQmaxDate timeIntervalSinceReferenceDate];
    CFPreferencesSetAppValue(@"lastQualQMaxDate", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"com.apple.powerd.batterygauging");
  }
  int v40 = (void *)CFPreferencesCopyAppValue(@"lastAttemptedFullChargeDate", @"com.apple.powerd.batterygauging");

  if (v40)
  {
    [v40 doubleValue];
    uint64_t v41 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    lastAttemptedFullChargeDate = v3->_lastAttemptedFullChargeDate;
    v3->_lastAttemptedFullChargeDate = (NSDate *)v41;
  }
  else
  {
    lastAttemptedFullChargeDate = v3->_lastAttemptedFullChargeDate;
    v3->_lastAttemptedFullChargeDate = 0;
  }

  v43 = (NSNumber *)CFPreferencesCopyAppValue(@"lastQualQmaxDODValue", @"com.apple.powerd.batterygauging");
  lastDOD0ValueAtQualQmax = v3->_lastDOD0ValueAtQualQmax;
  v3->_lastDOD0ValueAtQualQmax = v43;

  if (!v3->_lastDOD0ValueAtQualQmax)
  {
    v3->_lastDOD0ValueAtQualQmax = (NSNumber *)&off_10009A710;

    CFPreferencesSetAppValue(@"lastQualQmaxDODValue", v3->_lastDOD0ValueAtQualQmax, @"com.apple.powerd.batterygauging");
  }
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"nrOfPeriodicFullChargeRequested" :&v3->_numOfChargeToFullRequest];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"nrOfSessionsReachingFullCharge" :&v3->_numOfChargeToFullReached];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"nrOfDOD0AtQualifiedQmaxUpdates" :&v3->_numOfDOD0QualQmaxUpdates];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"nrOfQMaxTooRecent" :&v3->_numOfQmaxTooRecent];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"nrOfQMaxTooOld" :&v3->_numOfQmaxTooOld];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"nrOfDOD0TooSmall" :&v3->_numOfQmaxTooSmall];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"nrOfQMaxRequested" :&v3->_numOfQmaxRequested];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"nrOfOCVRequested" :&v3->_numOfOcvRequested];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"maxDaysSinceQmax" :&v3->_maxDaysSinceQmax];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"maxDaysSinceOCV" :&v3->_maxDaysSinceOcv];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"maxDaysSinceLastFullCharge" :&v3->_maxDaysSinceFC];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"lastNrOfPeriodicFullChargeRequested" :&v3->_lastNumOfChargeToFullRequest];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"lastNrOfSessionsReachingFullCharge" :&v3->_lastNumOfChargeToFullReached];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"lastNrOfDOD0AtQualifiedQmaxUpdates" :&v3->_lastNumOfDOD0QualQmaxUpdates];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"lastNrOfQMaxTooRecent" :&v3->_lastNumOfQmaxTooRecent];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"lastNrOfQMaxTooOld" :&v3->_lastNumOfQmaxTooOld];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"lastNrOfDOD0TooSmall" :&v3->_lastNumOfQmaxTooSmall];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"lastNrOfQMaxRequested" :&v3->_lastNumOfQmaxRequested];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"lastNrOfOCVRequested" :&v3->_lastNumOfOcvRequested];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"lastMaxDaysSinceQmax" :&v3->_lastMaxDaysSinceQmax];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"lastMaxDaysSinceOCV" :&v3->_lastMaxDaysSinceOcv];
  [(BatteryGaugingAccuracyManager *)v3 restoreAnalyticDataFromDisk:@"lastMaxDaysSinceLastFullCharge" :&v3->_lastMaxDaysSinceFC];
  [(BatteryGaugingAccuracyManager *)v3 periodicActions];

  return v3;
}

- (void)handleBatteryStateDataUpdate
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  unsigned int v3 = [(BatteryGaugingAccuracyManager *)self disableSocLimitPolicy];
  BOOL v4 = v3;
  if (self->_lastChargeToFullRequested) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = v3;
  }
  if (v5 == 1)
  {
    id v6 = qword_1000A4608;
    if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "HandleBatteryDataUpdate ChargeToFull Enabled", buf, 2u);
    }
    [(BatteryGaugingAccuracyManager *)self incrAnalyticsMetricsAttribute:&self->_numOfChargeToFullRequest];
LABEL_14:
    sub_10001935C(v5);
    goto LABEL_15;
  }
  if (self->_lastChargeToFullRequested) {
    char v7 = v3;
  }
  else {
    char v7 = 1;
  }
  if ((v7 & 1) == 0)
  {
    double v8 = qword_1000A4608;
    if (os_log_type_enabled((os_log_t)qword_1000A4608, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "HandleBatteryDataUpdate ChargeToFull Disabled", v11, 2u);
    }
    goto LABEL_14;
  }
LABEL_15:
  self->_lastChargeToFullRequested = v4;
  double v9 = +[NSDate date];
  [v9 timeIntervalSinceReferenceDate];
  CFDictionaryRef v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(BatteryGaugingAccuracyManager *)self writeNSNumberDataToDisk:@"MonthlyDataReportedDate" :v10];

  [(BatteryGaugingAccuracyManager *)self updateAnalyticsData];
}

+ (id)InstanceManager
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000A4F68);
  if (qword_1000A4F80 != -1) {
    dispatch_once(&qword_1000A4F80, &stru_100092CE0);
  }
  CFDictionaryRef v2 = (void *)qword_1000A4F78;

  return v2;
}

- (double)timeSinceLastDOD0Update
{
  return self->_timeSinceLastDOD0Update;
}

- (void)setTimeSinceLastDOD0Update:(double)a3
{
  self->_timeSinceLastDOD0Update = a3;
}

- (double)timeSinceLastQmaxUpdate
{
  return self->_timeSinceLastQmaxUpdate;
}

- (void)setTimeSinceLastQmaxUpdate:(double)a3
{
  self->_timeSinceLastQmaxUpdate = a3;
}

- (NSNumber)testQmaxUpdateDate
{
  return self->_testQmaxUpdateDate;
}

- (void)setTestQmaxUpdateDate:(id)a3
{
}

- (NSNumber)testDOD0UpdateDate
{
  return self->_testDOD0UpdateDate;
}

- (void)setTestDOD0UpdateDate:(id)a3
{
}

- (NSNumber)testFullyChargedDate
{
  return self->_testFullyChargedDate;
}

- (void)setTestFullyChargedDate:(id)a3
{
}

- (NSNumber)testQualifiedQMaxDate
{
  return self->_testQualifiedQMaxDate;
}

- (void)setTestQualifiedQMaxDate:(id)a3
{
}

- (NSNumber)testQualifiedQMaxDOD0Value
{
  return self->_testQualifiedQMaxDOD0Value;
}

- (void)setTestQualifiedQMaxDOD0Value:(id)a3
{
}

- (NSArray)lastDOD0Values
{
  return self->_lastDOD0Values;
}

- (void)setLastDOD0Values:(id)a3
{
}

- (BOOL)lastChargeToFullRequested
{
  return self->_lastChargeToFullRequested;
}

- (void)setLastChargeToFullRequested:(BOOL)a3
{
  self->_lastChargeToFullRequested = a3;
}

- (NSDate)lastDOD0Update
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastDOD0Update:(id)a3
{
}

- (NSArray)lastQMaxArray
{
  return self->_lastQMaxArray;
}

- (void)setLastQMaxArray:(id)a3
{
}

- (NSDate)lastQMaxUpdate
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastQMaxUpdate:(id)a3
{
}

- (NSNumber)lastDOD0ValueAtQualQmax
{
  return self->_lastDOD0ValueAtQualQmax;
}

- (void)setLastDOD0ValueAtQualQmax:(id)a3
{
}

- (NSDate)lastQualifiedQmaxDate
{
  return self->_lastQualifiedQmaxDate;
}

- (void)setLastQualifiedQmaxDate:(id)a3
{
}

- (NSDate)lastFullChargeDate
{
  return self->_lastFullChargeDate;
}

- (void)setLastFullChargeDate:(id)a3
{
}

- (NSDate)lastAttemptedFullChargeDate
{
  return self->_lastAttemptedFullChargeDate;
}

- (void)setLastAttemptedFullChargeDate:(id)a3
{
}

- (unint64_t)numOfChargeToFullRequest
{
  return self->_numOfChargeToFullRequest;
}

- (void)setNumOfChargeToFullRequest:(unint64_t)a3
{
  self->_numOfChargeToFullRequest = a3;
}

- (unint64_t)numOfChargeToFullReached
{
  return self->_numOfChargeToFullReached;
}

- (void)setNumOfChargeToFullReached:(unint64_t)a3
{
  self->_numOfChargeToFullReached = a3;
}

- (unint64_t)numOfDOD0QualQmaxUpdates
{
  return self->_numOfDOD0QualQmaxUpdates;
}

- (void)setNumOfDOD0QualQmaxUpdates:(unint64_t)a3
{
  self->_numOfDOD0QualQmaxUpdates = a3;
}

- (unint64_t)numOfQmaxTooRecent
{
  return self->_numOfQmaxTooRecent;
}

- (void)setNumOfQmaxTooRecent:(unint64_t)a3
{
  self->_numOfQmaxTooRecent = a3;
}

- (unint64_t)numOfQmaxTooOld
{
  return self->_numOfQmaxTooOld;
}

- (void)setNumOfQmaxTooOld:(unint64_t)a3
{
  self->_numOfQmaxTooOld = a3;
}

- (unint64_t)numOfQmaxTooSmall
{
  return self->_numOfQmaxTooSmall;
}

- (void)setNumOfQmaxTooSmall:(unint64_t)a3
{
  self->_numOfQmaxTooSmall = a3;
}

- (unint64_t)numOfQmaxRequested
{
  return self->_numOfQmaxRequested;
}

- (void)setNumOfQmaxRequested:(unint64_t)a3
{
  self->_numOfQmaxRequested = a3;
}

- (unint64_t)numOfOcvRequested
{
  return self->_numOfOcvRequested;
}

- (void)setNumOfOcvRequested:(unint64_t)a3
{
  self->_numOfOcvRequested = a3;
}

- (unint64_t)maxDaysSinceQmax
{
  return self->_maxDaysSinceQmax;
}

- (void)setMaxDaysSinceQmax:(unint64_t)a3
{
  self->_maxDaysSinceQmax = a3;
}

- (unint64_t)maxDaysSinceOcv
{
  return self->_maxDaysSinceOcv;
}

- (void)setMaxDaysSinceOcv:(unint64_t)a3
{
  self->_maxDaysSinceOcv = a3;
}

- (unint64_t)maxDaysSinceFC
{
  return self->_maxDaysSinceFC;
}

- (void)setMaxDaysSinceFC:(unint64_t)a3
{
  self->_maxDaysSinceFC = a3;
}

- (unint64_t)lastNumOfChargeToFullRequest
{
  return self->_lastNumOfChargeToFullRequest;
}

- (void)setLastNumOfChargeToFullRequest:(unint64_t)a3
{
  self->_lastNumOfChargeToFullRequest = a3;
}

- (unint64_t)lastNumOfChargeToFullReached
{
  return self->_lastNumOfChargeToFullReached;
}

- (void)setLastNumOfChargeToFullReached:(unint64_t)a3
{
  self->_lastNumOfChargeToFullReached = a3;
}

- (unint64_t)lastNumOfDOD0QualQmaxUpdates
{
  return self->_lastNumOfDOD0QualQmaxUpdates;
}

- (void)setLastNumOfDOD0QualQmaxUpdates:(unint64_t)a3
{
  self->_lastNumOfDOD0QualQmaxUpdates = a3;
}

- (unint64_t)lastNumOfQmaxTooRecent
{
  return self->_lastNumOfQmaxTooRecent;
}

- (void)setLastNumOfQmaxTooRecent:(unint64_t)a3
{
  self->_lastNumOfQmaxTooRecent = a3;
}

- (unint64_t)lastNumOfQmaxTooOld
{
  return self->_lastNumOfQmaxTooOld;
}

- (void)setLastNumOfQmaxTooOld:(unint64_t)a3
{
  self->_lastNumOfQmaxTooOld = a3;
}

- (unint64_t)lastNumOfQmaxTooSmall
{
  return self->_lastNumOfQmaxTooSmall;
}

- (void)setLastNumOfQmaxTooSmall:(unint64_t)a3
{
  self->_lastNumOfQmaxTooSmall = a3;
}

- (unint64_t)lastNumOfQmaxRequested
{
  return self->_lastNumOfQmaxRequested;
}

- (void)setLastNumOfQmaxRequested:(unint64_t)a3
{
  self->_lastNumOfQmaxRequested = a3;
}

- (unint64_t)lastNumOfOcvRequested
{
  return self->_lastNumOfOcvRequested;
}

- (void)setLastNumOfOcvRequested:(unint64_t)a3
{
  self->_lastNumOfOcvRequested = a3;
}

- (unint64_t)lastMaxDaysSinceQmax
{
  return self->_lastMaxDaysSinceQmax;
}

- (void)setLastMaxDaysSinceQmax:(unint64_t)a3
{
  self->_lastMaxDaysSinceQmax = a3;
}

- (unint64_t)lastMaxDaysSinceOcv
{
  return self->_lastMaxDaysSinceOcv;
}

- (void)setLastMaxDaysSinceOcv:(unint64_t)a3
{
  self->_lastMaxDaysSinceOcv = a3;
}

- (unint64_t)lastMaxDaysSinceFC
{
  return self->_lastMaxDaysSinceFC;
}

- (void)setLastMaxDaysSinceFC:(unint64_t)a3
{
  self->_lastMaxDaysSinceFC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAttemptedFullChargeDate, 0);
  objc_storeStrong((id *)&self->_lastFullChargeDate, 0);
  objc_storeStrong((id *)&self->_lastQualifiedQmaxDate, 0);
  objc_storeStrong((id *)&self->_lastDOD0ValueAtQualQmax, 0);
  objc_storeStrong((id *)&self->_lastQMaxUpdate, 0);
  objc_storeStrong((id *)&self->_lastQMaxArray, 0);
  objc_storeStrong((id *)&self->_lastDOD0Update, 0);
  objc_storeStrong((id *)&self->_lastDOD0Values, 0);
  objc_storeStrong((id *)&self->_testQualifiedQMaxDOD0Value, 0);
  objc_storeStrong((id *)&self->_testQualifiedQMaxDate, 0);
  objc_storeStrong((id *)&self->_testFullyChargedDate, 0);
  objc_storeStrong((id *)&self->_testDOD0UpdateDate, 0);

  objc_storeStrong((id *)&self->_testQmaxUpdateDate, 0);
}

@end