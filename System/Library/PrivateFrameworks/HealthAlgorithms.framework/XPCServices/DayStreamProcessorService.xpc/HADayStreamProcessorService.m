@interface HADayStreamProcessorService
- (BOOL)shouldSendCoreAnalytics;
- (MAIDayStreamDiagnosticLogger)diagnosticLogger;
- (MAIDayStreamProcessor)processor;
- (id)latencyCoreAnalytics:(const MAIDayStreamProcessorOutput *)a3 start_nanoseconds:(unint64_t)a4 end_nanoseconds:(unint64_t)a5;
- (void)appendDays:(id)a3;
- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)beginSessionWithConfig:(id)a3;
- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)finishSessionWithMostRecentMenstrualFlowJulianDayUpdated:(unsigned int)a3 withReply:(id)a4;
- (void)setDiagnosticLogger:(id)a3;
- (void)setProcessor:(id)a3;
@end

@implementation HADayStreamProcessorService

- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  v7 = [(HADayStreamProcessorService *)self processor];

  if (v7)
  {
    v8 = [(HADayStreamProcessorService *)self processor];
    [v8 beginPhase:v5 onJulianDay:v4];

    id v10 = [(HADayStreamProcessorService *)self diagnosticLogger];
    [v10 beginPhase:v5 onJulianDay:v4];
  }
  else
  {
    v9 = ha_get_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100002B90();
    }
  }
}

- (void)beginSessionWithConfig:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ha_get_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446210;
    v12 = "-[HADayStreamProcessorService beginSessionWithConfig:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v11, 0xCu);
  }

  v6 = [(HADayStreamProcessorService *)self processor];

  if (v6)
  {
    v7 = ha_get_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100002B5C();
    }
  }
  id v8 = [objc_alloc((Class)MAIDayStreamProcessor) initWithConfig:v4];
  [(HADayStreamProcessorService *)self setProcessor:v8];

  v9 = [(HADayStreamProcessorService *)self processor];

  if (v9)
  {
    id v10 = [objc_alloc((Class)MAIDayStreamDiagnosticLogger) initWithConfig:v4];
    [(HADayStreamProcessorService *)self setDiagnosticLogger:v10];
  }
  else
  {
    id v10 = ha_get_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100002B28();
    }
  }
}

- (MAIDayStreamProcessor)processor
{
  return self->_processor;
}

- (void)setProcessor:(id)a3
{
}

- (void)setDiagnosticLogger:(id)a3
{
}

- (MAIDayStreamDiagnosticLogger)diagnosticLogger
{
  return self->_diagnosticLogger;
}

- (BOOL)shouldSendCoreAnalytics
{
  v2 = +[MCProfileConnection sharedConnection];
  unsigned int v3 = [v2 isHealthDataSubmissionAllowed];

  if (v3)
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    uint64_t v5 = [v4 valueForKeyPath:@"HADateOfLastDayStreamProcessorCAEvent"];

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

- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  v7 = [(HADayStreamProcessorService *)self processor];

  if (v7)
  {
    id v8 = [(HADayStreamProcessorService *)self processor];
    [v8 endPhase:v5 onJulianDay:v4];

    id v10 = [(HADayStreamProcessorService *)self diagnosticLogger];
    [v10 endPhase:v5 onJulianDay:v4];
  }
  else
  {
    v9 = ha_get_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100002B90();
    }
  }
}

- (void)appendDays:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HADayStreamProcessorService *)self processor];

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
          v12 = [(HADayStreamProcessorService *)self processor];
          [v12 appendDay:v11];

          v13 = [(HADayStreamProcessorService *)self diagnosticLogger];
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
      sub_100002B90();
    }
  }
}

- (void)finishSessionWithMostRecentMenstrualFlowJulianDayUpdated:(unsigned int)a3 withReply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  double v6 = (void (**)(id, void))a4;
  id v7 = ha_get_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = "-[HADayStreamProcessorService finishSessionWithMostRecentMenstrualFlowJulianDayUpdated:withReply:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  id v8 = [(HADayStreamProcessorService *)self processor];
  BOOL v9 = v8 == 0;

  if (v9)
  {
    long long v14 = ha_get_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_100002B90();
    }

    v6[2](v6, 0);
  }
  else
  {
    id v10 = [(HADayStreamProcessorService *)self diagnosticLogger];
    [v10 finalizeDayStreamInputWithDay:v4];

    __uint64_t v11 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    long long buf = 0uLL;
    id v25 = 0;
    v12 = [(HADayStreamProcessorService *)self processor];
    v13 = v12;
    if (v12)
    {
      [v12 analyzeWithMostRecentMenstrualFlowJulianDayUpdated:v4];
    }
    else
    {
      long long buf = 0uLL;
      id v25 = 0;
    }

    long long v15 = [(HADayStreamProcessorService *)self latencyCoreAnalytics:&buf start_nanoseconds:v11 end_nanoseconds:clock_gettime_nsec_np(_CLOCK_UPTIME_RAW)];
    AnalyticsSendEvent();
    long long v16 = [(HADayStreamProcessorService *)self diagnosticLogger];
    id v17 = (id)buf;
    v23[0] = v17;
    id v18 = *((id *)&buf + 1);
    v23[1] = v18;
    id v19 = v25;
    v23[2] = v19;
    if (v16)
    {
      [v16 logDayStreamProcessorOutput:v23];
    }
    else
    {
      v20 = v19;
    }
    if ([(HADayStreamProcessorService *)self shouldSendCoreAnalytics])
    {
      v21 = +[NSUserDefaults standardUserDefaults];
      v22 = +[NSDate date];
      [v21 setValue:v22 forKeyPath:@"HADateOfLastDayStreamProcessorCAEvent"];

      if (*((void *)&buf + 1)) {
        AnalyticsSendEvent();
      }
      if (v25) {
        AnalyticsSendEvent();
      }
    }
    [(HADayStreamProcessorService *)self setProcessor:0];
    [(HADayStreamProcessorService *)self setDiagnosticLogger:0];
    v6[2](v6, buf);
  }
}

- (id)latencyCoreAnalytics:(const MAIDayStreamProcessorOutput *)a3 start_nanoseconds:(unint64_t)a4 end_nanoseconds:(unint64_t)a5
{
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v7 = [a3->var0 menstruationPredictions];
  id v8 = [v7 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ([v12 predictionPrimarySource] > 4)
        {
          long long v14 = ha_get_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
            sub_100002BC4((uint64_t)v43, v12);
          }
        }
        else
        {
          unsigned int v13 = [v12 predictionPrimarySource];
          ++*((_DWORD *)&v45 + v13);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v9);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v15 = [a3->var0 fertilityPredictions];
  id v16 = [v15 countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
        if ([v20 predictionPrimarySource] > 4)
        {
          v22 = ha_get_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
            sub_100002BC4((uint64_t)v41, v20);
          }
        }
        else
        {
          unsigned int v21 = [v20 predictionPrimarySource];
          ++*((_DWORD *)&v45 + v21);
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v17);
  }

  v39[0] = @"milliseconds";
  v23 = +[NSNumber numberWithUnsignedLongLong:(a5 - a4) / 0xF4240];
  v40[0] = v23;
  v39[1] = @"primarySourceCalendarMethod";
  v24 = +[NSNumber numberWithInt:v45];
  v40[1] = v24;
  v39[2] = @"primarySourceHeartRate";
  id v25 = +[NSNumber numberWithInt:HIDWORD(v45)];
  v40[2] = v25;
  v39[3] = @"primarySourceOvulationTestResult";
  v26 = +[NSNumber numberWithInt:HIDWORD(v46)];
  v40[3] = v26;
  v39[4] = @"primarySourceWristTemperature";
  v27 = +[NSNumber numberWithInt:v46];
  v40[4] = v27;
  v28 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:5];

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticLogger, 0);
  objc_storeStrong((id *)&self->_processor, 0);
}

@end