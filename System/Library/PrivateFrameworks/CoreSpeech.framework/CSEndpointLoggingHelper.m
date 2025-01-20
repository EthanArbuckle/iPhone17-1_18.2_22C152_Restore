@interface CSEndpointLoggingHelper
+ (id)getMHClientEventByMhUUID:(id)a3;
+ (id)getMHStatisticDistributionInfoFromDictionary:(id)a3;
+ (id)getMHStatisticDistributionInfoFromDictionary:(id)a3 withScaleFactor:(double)a4;
+ (void)reportMHEndpointerAccessibleContextEventWithThresholdType:(id)a3 MhId:(id)a4;
+ (void)reportServerEndpointWithMhId:(id)a3;
@end

@implementation CSEndpointLoggingHelper

+ (void)reportServerEndpointWithMhId:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init((Class)MHSchemaMHEndpointDetected);
    [v4 setEndpointerType:5];
    v5 = +[CSEndpointLoggingHelper getMHClientEventByMhUUID:v3];
    [v5 setEndpointDetected:v4];
    v6 = +[AssistantSiriAnalytics sharedStream];
    [v6 emitMessage:v5];

    v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      v10 = "+[CSEndpointLoggingHelper reportServerEndpointWithMhId:]";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Submit MHEndpointDetectedEvent to SELF for MH ID: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      v10 = "+[CSEndpointLoggingHelper reportServerEndpointWithMhId:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s MHID not set, skipping SELF Logging", (uint8_t *)&v9, 0xCu);
    }
  }
}

+ (void)reportMHEndpointerAccessibleContextEventWithThresholdType:(id)a3 MhId:(id)a4
{
  v5 = (__CFString *)a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init((Class)MHSchemaMHEndpointerAccessibleContext);
    v8 = v7;
    if (v5 == @"accessible-extended") {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2 * (v5 == @"accessible-maximum");
    }
    [v7 setAccessibleEndpointerLevel:v9];
    v10 = +[CSEndpointLoggingHelper getMHClientEventByMhUUID:v6];
    [v10 setEndpointerAccessibleContext:v8];
    __int16 v11 = +[AssistantSiriAnalytics sharedStream];
    [v11 emitMessage:v10];

    id v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315394;
      v15 = "+[CSEndpointLoggingHelper reportMHEndpointerAccessibleContextEventWithThresholdType:MhId:]";
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Submit MHEndpointerAccessibleContextEvent to SELF for MH ID: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      v15 = "+[CSEndpointLoggingHelper reportMHEndpointerAccessibleContextEventWithThresholdType:MhId:]";
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s MHID not set, skipping SELF Logging", (uint8_t *)&v14, 0xCu);
    }
  }
}

+ (id)getMHStatisticDistributionInfoFromDictionary:(id)a3 withScaleFactor:(double)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)MHSchemaMHStatisticDistributionInfo);
  id v7 = [v5 objectForKey:@"Num"];
  objc_msgSend(v6, "setNum:", objc_msgSend(v7, "intValue"));

  v8 = [v5 objectForKey:@"Avg"];
  [v8 floatValue];
  double v10 = v9 * a4;
  *(float *)&double v10 = v10;
  objc_msgSend(v6, "setAvg:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v10));

  __int16 v11 = [v5 objectForKey:@"Max"];
  [v11 floatValue];
  double v13 = v12 * a4;
  *(float *)&double v13 = v13;
  objc_msgSend(v6, "setMax:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v13));

  int v14 = [v5 objectForKey:@"Min"];
  [v14 floatValue];
  double v16 = v15 * a4;
  *(float *)&double v16 = v16;
  objc_msgSend(v6, "setMin:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v16));

  id v17 = [v5 objectForKey:@"P95"];
  [v17 floatValue];
  double v19 = v18 * a4;
  *(float *)&double v19 = v19;
  objc_msgSend(v6, "setP95:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v19));

  v20 = [v5 objectForKey:@"Median"];
  [v20 floatValue];
  double v22 = v21 * a4;
  *(float *)&double v22 = v22;
  objc_msgSend(v6, "setMedian:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v22));

  v23 = [v5 objectForKey:@"Std"];
  [v23 floatValue];
  objc_msgSend(v6, "setStd:");

  v24 = [v5 objectForKey:@"Warmup"];

  if (v24)
  {
    [v24 floatValue];
    double v26 = v25 * a4;
    *(float *)&double v26 = v26;
    objc_msgSend(v6, "setWarmup:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v26));
  }

  return v6;
}

+ (id)getMHStatisticDistributionInfoFromDictionary:(id)a3
{
  return +[CSEndpointLoggingHelper getMHStatisticDistributionInfoFromDictionary:a3 withScaleFactor:1.0];
}

+ (id)getMHClientEventByMhUUID:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = objc_alloc_init((Class)MHSchemaMHClientEvent);
    id v5 = objc_alloc((Class)SISchemaUUID);
    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];
    id v7 = [v5 initWithNSUUID:v6];

    id v8 = objc_alloc_init((Class)MHSchemaMHClientEventMetadata);
    [v8 setMhId:v7];
    [v4 setEventMetadata:v8];
  }
  else
  {
    float v9 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = v9;
      int v13 = 136315650;
      int v14 = "+[CSEndpointLoggingHelper getMHClientEventByMhUUID:]";
      __int16 v15 = 2112;
      id v16 = v3;
      __int16 v17 = 2112;
      id v18 = (id)objc_opt_class();
      id v11 = v18;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s mhUUID = %@, class = %@", (uint8_t *)&v13, 0x20u);
    }
    id v4 = 0;
  }

  return v4;
}

@end