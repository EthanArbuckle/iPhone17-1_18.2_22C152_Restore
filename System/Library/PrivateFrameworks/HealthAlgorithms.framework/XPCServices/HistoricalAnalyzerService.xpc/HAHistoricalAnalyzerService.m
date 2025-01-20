@interface HAHistoricalAnalyzerService
- (BOOL)shouldSendCoreAnalytics;
- (MAIHistoricalAnalyzer)analyzer;
- (MAIHistoricalDiagnosticLogger)diagnosticLogger;
- (id)latencyCoreAnalytics:(const MAIHistoricalAnalyzerOutput *)a3 start_nanoseconds:(unint64_t)a4 end_nanoseconds:(unint64_t)a5;
- (void)appendDays:(id)a3;
- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)beginSession;
- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)finishSessionWithReply:(id)a3;
- (void)setAnalyzer:(id)a3;
- (void)setDiagnosticLogger:(id)a3;
@end

@implementation HAHistoricalAnalyzerService

- (void)beginSession
{
  v3 = ha_get_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446210;
    v10 = "-[HAHistoricalAnalyzerService beginSession]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v9, 0xCu);
  }

  v4 = [(HAHistoricalAnalyzerService *)self analyzer];

  if (v4)
  {
    v5 = ha_get_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100002D1C();
    }
  }
  v6 = objc_opt_new();
  [(HAHistoricalAnalyzerService *)self setAnalyzer:v6];

  v7 = [(HAHistoricalAnalyzerService *)self analyzer];

  if (v7)
  {
    v8 = objc_opt_new();
    [(HAHistoricalAnalyzerService *)self setDiagnosticLogger:v8];
  }
  else
  {
    v8 = ha_get_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100002CE8();
    }
  }
}

- (MAIHistoricalAnalyzer)analyzer
{
  return self->_analyzer;
}

- (void)setDiagnosticLogger:(id)a3
{
}

- (void)setAnalyzer:(id)a3
{
}

- (BOOL)shouldSendCoreAnalytics
{
  v2 = +[MCProfileConnection sharedConnection];
  unsigned int v3 = [v2 isHealthDataSubmissionAllowed];

  if (v3)
  {
    v4 = +[NSUserDefaults standardUserDefaults];
    v5 = [v4 valueForKeyPath:@"HADateOfLastHistoricalAnalyzerCAEvent"];

    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v5 timeIntervalSinceNow];
      LOBYTE(v3) = v6 < -84600.0;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  v7 = [(HAHistoricalAnalyzerService *)self analyzer];

  if (v7)
  {
    v8 = [(HAHistoricalAnalyzerService *)self analyzer];
    [v8 beginPhase:v5 onJulianDay:v4];

    id v10 = [(HAHistoricalAnalyzerService *)self diagnosticLogger];
    [v10 beginPhase:v5 onJulianDay:v4];
  }
  else
  {
    int v9 = ha_get_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100002D50();
    }
  }
}

- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  v7 = [(HAHistoricalAnalyzerService *)self analyzer];

  if (v7)
  {
    v8 = [(HAHistoricalAnalyzerService *)self analyzer];
    [v8 endPhase:v5 onJulianDay:v4];

    id v10 = [(HAHistoricalAnalyzerService *)self diagnosticLogger];
    [v10 endPhase:v5 onJulianDay:v4];
  }
  else
  {
    int v9 = ha_get_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100002D50();
    }
  }
}

- (void)appendDays:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAHistoricalAnalyzerService *)self analyzer];

  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v12 = [(HAHistoricalAnalyzerService *)self analyzer];
          [v12 appendDay:v11];

          v13 = [(HAHistoricalAnalyzerService *)self diagnosticLogger];
          [v13 appendDay:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    double v6 = ha_get_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100002D50();
    }
  }
}

- (void)finishSessionWithReply:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = ha_get_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v21) = 136446210;
    *(void *)((char *)&v21 + 4) = "-[HAHistoricalAnalyzerService finishSessionWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v21, 0xCu);
  }

  double v6 = [(HAHistoricalAnalyzerService *)self analyzer];
  BOOL v7 = v6 == 0;

  if (v7)
  {
    long long v16 = ha_get_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_100002D50();
    }

    v4[2](v4, 0);
  }
  else
  {
    id v8 = [(HAHistoricalAnalyzerService *)self diagnosticLogger];
    [v8 finalizeHistoricalAnalyzerInput];

    __uint64_t v9 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    id v10 = [(HAHistoricalAnalyzerService *)self analyzer];
    *(void *)&long long v21 = [v10 analyze];
    *((void *)&v21 + 1) = v11;

    v12 = [(HAHistoricalAnalyzerService *)self latencyCoreAnalytics:&v21 start_nanoseconds:v9 end_nanoseconds:clock_gettime_nsec_np(_CLOCK_UPTIME_RAW)];
    AnalyticsSendEvent();
    v13 = [(HAHistoricalAnalyzerService *)self diagnosticLogger];
    id v14 = (id)v21;
    id v15 = *((id *)&v21 + 1);
    if (v13)
    {
      objc_msgSend(v13, "logHistoricalAnalyzerOutput:", v14, v15);
    }
    else
    {
    }
    unsigned int v17 = [(HAHistoricalAnalyzerService *)self shouldSendCoreAnalytics];
    if (*((void *)&v21 + 1)) {
      unsigned int v18 = v17;
    }
    else {
      unsigned int v18 = 0;
    }
    if (v18 == 1)
    {
      v19 = +[NSUserDefaults standardUserDefaults];
      v20 = +[NSDate date];
      [v19 setValue:v20 forKeyPath:@"HADateOfLastHistoricalAnalyzerCAEvent"];

      AnalyticsSendEvent();
    }
    [(HAHistoricalAnalyzerService *)self setAnalyzer:0];
    [(HAHistoricalAnalyzerService *)self setDiagnosticLogger:0];
    v4[2](v4, v21);
  }
}

- (id)latencyCoreAnalytics:(const MAIHistoricalAnalyzerOutput *)a3 start_nanoseconds:(unint64_t)a4 end_nanoseconds:(unint64_t)a5
{
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = a3->var0;
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v11, "predictionPrimarySource", (void)v24) > 4)
        {
          v13 = ha_get_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
            sub_100002D84(v30, v11, v31, v13);
          }
        }
        else
        {
          unsigned int v12 = [v11 predictionPrimarySource];
          ++*((_DWORD *)&v33 + v12);
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v8);
    uint64_t v15 = v33;
    uint64_t v14 = HIDWORD(v33);
    uint64_t v16 = v34;
    id v8 = (id)HIDWORD(v34);
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }

  v28[0] = @"milliseconds";
  unsigned int v17 = +[NSNumber numberWithUnsignedLongLong:(a5 - a4) / 0xF4240];
  v29[0] = v17;
  v28[1] = @"primarySourceCalendarMethod";
  unsigned int v18 = +[NSNumber numberWithInt:v15];
  v29[1] = v18;
  v28[2] = @"primarySourceHeartRate";
  v19 = +[NSNumber numberWithInt:v14];
  v29[2] = v19;
  v28[3] = @"primarySourceOvulationTestResult";
  v20 = +[NSNumber numberWithInt:v8];
  v29[3] = v20;
  v28[4] = @"primarySourceWristTemperature";
  long long v21 = +[NSNumber numberWithInt:v16];
  v29[4] = v21;
  v22 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:5];

  return v22;
}

- (MAIHistoricalDiagnosticLogger)diagnosticLogger
{
  return self->_diagnosticLogger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticLogger, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
}

@end