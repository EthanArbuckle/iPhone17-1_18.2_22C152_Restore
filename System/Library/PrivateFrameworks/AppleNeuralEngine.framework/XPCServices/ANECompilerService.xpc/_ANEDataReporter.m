@interface _ANEDataReporter
+ (id)analyticsKey:(id)a3;
+ (id)reportClient:(id)a3 modelName:(id)a4;
+ (void)addValue:(int64_t)a3 forScalarKey:(id)a4;
+ (void)reportErrorMsg:(unsigned int)a3 status:(unsigned int)a4;
+ (void)reportTelemetryToPPS:(id)a3 playload:(id)a4;
@end

@implementation _ANEDataReporter

+ (void)addValue:(int64_t)a3 forScalarKey:(id)a4
{
  id v5 = a4;
  v7 = [a1 analyticsKey:v5];
  v8 = +[_ANEStrings coreAnalyticsANEUsageKeyGroup];
  id v9 = v7;
  AnalyticsSendEventLazy();
}

+ (id)reportClient:(id)a3 modelName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[_ANEStrings coreAnalyticsANEUsageDefaultReportedClient];
  v8 = v7;
  if (v5 && v6)
  {
    id v9 = [&off_100050470 objectForKeyedSubscript:v5];
    if (!v9)
    {
      v10 = +[_ANEStrings systemLibraryPath];
      v11 = [v6 stringByReplacingOccurrencesOfString:v10 withString:&stru_10004D218];

      v12 = [v11 stringByReplacingOccurrencesOfString:@"PrivateFrameworks/" withString:&stru_10004D218];
      v13 = [v12 stringByReplacingOccurrencesOfString:@"Frameworks/" withString:&stru_10004D218];
      v14 = [v13 componentsSeparatedByString:@"/"];
      v15 = v14;
      if (!v14
        || (objc_msgSend(v14, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v14, "count") > 1),
            (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0)
        || (v17 = (void *)v16,
            [&off_100050498 objectForKeyedSubscript:v16],
            id v9 = (id)objc_claimAutoreleasedReturnValue(),
            v17,
            !v9))
      {
        id v9 = v8;
      }
    }
    +[_ANEDataReporter addValue:1 forScalarKey:v9];
  }
  else
  {
    id v9 = v7;
  }

  return v9;
}

+ (id)analyticsKey:(id)a3
{
  id v3 = a3;
  v4 = +[_ANEStrings coreAnalyticsANEUsageKeyGroup];
  id v5 = +[NSString stringWithFormat:@"%@.%@", v4, v3];

  return v5;
}

+ (void)reportTelemetryToPPS:(id)a3 playload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (&_PPSSendTelemetry) {
    BOOL v8 = &_PPSCreateTelemetryIdentifier == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    if (qword_100057E90 != -1) {
      dispatch_once(&qword_100057E90, &stru_10004CE50);
    }
    v10 = [(id)qword_100057E88 objectForKey:v5];
    id v9 = v10;
    if (v10)
    {
      uint64_t v14 = 0;
      [v10 getValue:&v14];
      uint64_t v11 = v14;
      v12 = +[_ANELog common];
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v11)
      {
        if (v13) {
          sub_100031FF4((uint64_t)v5, v12);
        }

        PPSSendTelemetry();
        goto LABEL_20;
      }
      if (v13) {
        sub_100031F7C((uint64_t)v5, v12);
      }
    }
    else
    {
      v12 = +[_ANELog common];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100031F04((uint64_t)v5, v12);
      }
    }

    goto LABEL_20;
  }
  id v9 = +[_ANELog common];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100031EC0(v9);
  }
LABEL_20:
}

+ (void)reportErrorMsg:(unsigned int)a3 status:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v9[0] = @"statusType";
  id v6 = +[NSNumber numberWithUnsignedInt:*(void *)&a3];
  v9[1] = @"returnType";
  v10[0] = v6;
  v7 = +[NSNumber numberWithUnsignedInt:v4];
  v10[1] = v7;
  BOOL v8 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [a1 reportTelemetryToPPS:@"ANEStatus" playload:v8];
}

@end