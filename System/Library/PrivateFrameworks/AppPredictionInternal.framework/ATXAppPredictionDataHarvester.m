@interface ATXAppPredictionDataHarvester
+ (id)_generateLoggingDictionaryFromPredictionItem:(id)a3 itemIndex:(unint64_t)a4 itemOutcome:(unint64_t)a5 sessionOutcome:(unint64_t)a6 sessionUUID:(id)a7;
+ (void)_sendToCoreAnalytics:(id)a3;
+ (void)harvestDataFromPredictionItem:(id)a3 itemIndex:(unint64_t)a4 itemOutcome:(unint64_t)a5 sessionOutcome:(unint64_t)a6 sessionUUID:(id)a7;
@end

@implementation ATXAppPredictionDataHarvester

+ (void)harvestDataFromPredictionItem:(id)a3 itemIndex:(unint64_t)a4 itemOutcome:(unint64_t)a5 sessionOutcome:(unint64_t)a6 sessionUUID:(id)a7
{
  id v11 = a7;
  id v12 = a3;
  v13 = __atxlog_handle_default();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);

  v15 = __atxlog_handle_default();
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "ATXAppPredictionDataHarvester.dataCollection", " enableTelemetry=YES ", buf, 2u);
  }

  v17 = +[ATXAppPredictionDataHarvester _generateLoggingDictionaryFromPredictionItem:v12 itemIndex:a4 itemOutcome:a5 sessionOutcome:a6 sessionUUID:v11];

  +[ATXAppPredictionDataHarvester _sendToCoreAnalytics:v17];
  v18 = __atxlog_handle_default();
  v19 = v18;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v19, OS_SIGNPOST_INTERVAL_END, v14, "ATXAppPredictionDataHarvester.dataCollection", " enableTelemetry=YES ", v20, 2u);
  }
}

+ (id)_generateLoggingDictionaryFromPredictionItem:(id)a3 itemIndex:(unint64_t)a4 itemOutcome:(unint64_t)a5 sessionOutcome:(unint64_t)a6 sessionUUID:(id)a7
{
  id v9 = a3;
  id v26 = a7;
  v10 = objc_opt_new();
  for (uint64_t i = 0; i != 817; ++i)
  {
    id v12 = (void *)MEMORY[0x1D25F6CC0]();
    v13 = NSNumber;
    id v14 = v9;
    LODWORD(v15) = *(_DWORD *)([v14 scoreInputs] + 4 * i);
    v16 = [v13 numberWithFloat:v15];
    v17 = +[_ATXScoreTypes aggdStringForScoreInput:i];
    [v10 setObject:v16 forKeyedSubscript:v17];
  }
  v18 = NSNumber;
  [v14 totalScore];
  v19 = objc_msgSend(v18, "numberWithFloat:");
  [v10 setObject:v19 forKeyedSubscript:@"score"];

  v20 = [NSNumber numberWithUnsignedInteger:a4];
  [v10 setObject:v20 forKeyedSubscript:@"itemIndex"];

  v21 = [NSNumber numberWithUnsignedInteger:a5];
  [v10 setObject:v21 forKeyedSubscript:@"itemOutcome"];

  v22 = [NSNumber numberWithUnsignedInteger:a6];
  [v10 setObject:v22 forKeyedSubscript:@"sessionOutcome"];

  [v10 setObject:v26 forKeyedSubscript:@"sessionUUID"];
  return v10;
}

+ (void)_sendToCoreAnalytics:(id)a3
{
}

@end