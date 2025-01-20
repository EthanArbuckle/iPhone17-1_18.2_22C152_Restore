@interface _ANEDataReporter
+ (id)analyticsKey:(id)a3;
+ (id)reportClient:(id)a3 modelName:(id)a4;
+ (void)addValue:(int64_t)a3 forScalarKey:(id)a4;
+ (void)reportErrorMsg:(unsigned int)a3 status:(unsigned int)a4;
+ (void)reportTelemetryToPPS:(id)a3 playload:(id)a4;
@end

@implementation _ANEDataReporter

+ (id)reportClient:(id)a3 modelName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[_ANEStrings coreAnalyticsANEUsageDefaultReportedClient];
  v8 = v7;
  if (v5 && v6)
  {
    id v9 = [&unk_1F35EC0D8 objectForKeyedSubscript:v5];
    if (!v9)
    {
      v10 = +[_ANEStrings systemLibraryPath];
      v11 = [v6 stringByReplacingOccurrencesOfString:v10 withString:&stru_1F35E5710];

      v12 = [v11 stringByReplacingOccurrencesOfString:@"PrivateFrameworks/" withString:&stru_1F35E5710];
      v13 = [v12 stringByReplacingOccurrencesOfString:@"Frameworks/" withString:&stru_1F35E5710];
      v14 = [v13 componentsSeparatedByString:@"/"];
      v15 = v14;
      if (!v14
        || (objc_msgSend(v14, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v14, "count") > 1),
            (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0)
        || (v17 = (void *)v16,
            [&unk_1F35EC100 objectForKeyedSubscript:v16],
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

+ (void)addValue:(int64_t)a3 forScalarKey:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E0193890]();
  v7 = [a1 analyticsKey:v5];
  v8 = +[_ANEStrings coreAnalyticsANEUsageKeyGroup];
  id v9 = v7;
  AnalyticsSendEventLazy();
}

+ (id)analyticsKey:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  id v5 = +[_ANEStrings coreAnalyticsANEUsageKeyGroup];
  id v6 = [v3 stringWithFormat:@"%@.%@", v5, v4];

  return v6;
}

+ (void)reportTelemetryToPPS:(id)a3 playload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E0193890]();
  if (MEMORY[0x1E4F928A0]) {
    BOOL v8 = MEMORY[0x1E4F92898] == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    if (reportTelemetryToPPS_playload__onceToken != -1) {
      dispatch_once(&reportTelemetryToPPS_playload__onceToken, &__block_literal_global_0);
    }
    v10 = [(id)reportTelemetryToPPS_playload__ppsIDMapping objectForKey:v5];
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
          +[_ANEDataReporter reportTelemetryToPPS:playload:].cold.4((uint64_t)v5, v12);
        }

        PPSSendTelemetry();
        goto LABEL_20;
      }
      if (v13) {
        +[_ANEDataReporter reportTelemetryToPPS:playload:]((uint64_t)v5, v12);
      }
    }
    else
    {
      v12 = +[_ANELog common];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[_ANEDataReporter reportTelemetryToPPS:playload:]((uint64_t)v5, v12);
      }
    }

    goto LABEL_20;
  }
  id v9 = +[_ANELog common];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[_ANEDataReporter reportTelemetryToPPS:playload:](v9);
  }
LABEL_20:
}

+ (void)reportErrorMsg:(unsigned int)a3 status:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"statusType";
  id v6 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  v9[1] = @"returnType";
  v10[0] = v6;
  v7 = [NSNumber numberWithUnsignedInt:v4];
  v10[1] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [a1 reportTelemetryToPPS:@"ANEStatus" playload:v8];
}

+ (void)reportTelemetryToPPS:(os_log_t)log playload:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB8AB000, log, OS_LOG_TYPE_DEBUG, "PerfPowerServices not supported.", v1, 2u);
}

+ (void)reportTelemetryToPPS:(uint64_t)a1 playload:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB8AB000, a2, OS_LOG_TYPE_ERROR, "Telemetry: invalid PPS category %@ specified!", (uint8_t *)&v2, 0xCu);
}

+ (void)reportTelemetryToPPS:(uint64_t)a1 playload:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DB8AB000, a2, OS_LOG_TYPE_DEBUG, "Telemetry: ppsId not available %@!", (uint8_t *)&v2, 0xCu);
}

+ (void)reportTelemetryToPPS:(uint64_t)a1 playload:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DB8AB000, a2, OS_LOG_TYPE_DEBUG, "Telemetry: report to category %@.", (uint8_t *)&v2, 0xCu);
}

@end