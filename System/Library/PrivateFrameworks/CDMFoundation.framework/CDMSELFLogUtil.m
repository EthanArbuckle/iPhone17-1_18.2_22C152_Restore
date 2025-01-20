@interface CDMSELFLogUtil
+ (BOOL)cdmAllServicesSetupEnded:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5;
+ (BOOL)cdmAllServicesSetupFailed:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5;
+ (BOOL)cdmAllServicesSetupStarted:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5;
+ (BOOL)cdmAllServicesWarmupEnded:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5;
+ (BOOL)cdmAllServicesWarmupFailed:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5;
+ (BOOL)cdmAllServicesWarmupStarted:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5;
+ (BOOL)cdmAssetSetupEnded:(id)a3 contextId:(id)a4 logMessage:(id)a5 dataDispatcherContext:(id)a6;
+ (BOOL)cdmAssetSetupFailed:(id)a3 contextId:(id)a4 errorDomain:(int)a5 errorCode:(unsigned int)a6 logMessage:(id)a7 dataDispatcherContext:(id)a8;
+ (BOOL)cdmAssetSetupStarted:(id)a3 contextId:(id)a4 serviceNames:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7;
+ (BOOL)cdmAssetsReported:(id)a3 metadata:(id)a4 dataDispatcherContext:(id)a5;
+ (BOOL)cdmClientSetupEnded:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5;
+ (BOOL)cdmClientSetupFailed:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5 logMessage:(id)a6;
+ (BOOL)cdmClientSetupFailed:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7;
+ (BOOL)cdmClientSetupStarted:(id)a3 logMessage:(id)a4 currentServiceGraph:(int)a5 dataDispatcherContext:(id)a6;
+ (BOOL)cdmClientWarmupEnded:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5;
+ (BOOL)cdmClientWarmupFailed:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7;
+ (BOOL)cdmClientWarmupStarted:(id)a3 logMessage:(id)a4 currentServiceGraph:(int)a5 dataDispatcherContext:(id)a6;
+ (BOOL)cdmEnded:(id)a3 metadata:(id)a4 logMessage:(id)a5 machAbsoluteTime:(unint64_t)a6 dataDispatcherContext:(id)a7;
+ (BOOL)cdmFailed:(int)a3 errorDomainString:(id)a4 errorCode:(int)a5 metadata:(id)a6 logMessage:(id)a7 dataDispatcherContext:(id)a8;
+ (BOOL)cdmFailed:(int)a3 metadata:(id)a4 logMessage:(id)a5 dataDispatcherContext:(id)a6;
+ (BOOL)cdmSetupMissingAssetsDetected:(id)a3 contextId:(id)a4 serviceNames:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7;
+ (BOOL)cdmStarted:(id)a3 metadata:(id)a4 logMessage:(id)a5 machAbsoluteTime:(unint64_t)a6 currentServiceGraph:(int)a7 dataDispatcherContext:(id)a8;
+ (BOOL)cdmXpcProcessingEnded:(id)a3 metadata:(id)a4 logMessage:(id)a5 dataDispatcherContext:(id)a6;
+ (BOOL)cdmXpcProcessingFailed:(id)a3 reason:(int)a4 errorCode:(unsigned int)a5 metadata:(id)a6 logMessage:(id)a7 dataDispatcherContext:(id)a8;
+ (BOOL)cdmXpcProcessingStarted:(id)a3 xpcType:(int)a4 xpcSystemEventType:(int)a5 serviceName:(int)a6 metadata:(id)a7 logMessage:(id)a8 dataDispatcherContext:(id)a9;
+ (BOOL)contextUpdateEnded:(id)a3 metadata:(id)a4 logMessage:(id)a5 dataDispatcherContext:(id)a6;
+ (BOOL)curareRequestLink:(id)a3 nlId:(id)a4 metadata:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7;
+ (BOOL)emitCurareContext:(id)a3 metadata:(id)a4 dataDispatcherContext:(id)a5;
+ (BOOL)emitEventsFromContainer:(id)a3 mainEventLogMessage:(id)a4;
+ (BOOL)emitEventsFromContainer:(id)a3 mainEventLogMessage:(id)a4 dataDispatcherContext:(id)a5;
+ (BOOL)emitEventsFromContainer:(id)a3 mainEventLogMessage:(id)a4 machAbsoluteTime:(unint64_t)a5 dataDispatcherContext:(id)a6;
+ (BOOL)emitEventsFromContainer:(id)a3 mainEventLogMessage:(id)a4 machAbsoluteTime:(unint64_t)a5 logLevel:(id)a6;
+ (BOOL)emitEventsFromContainer:(id)a3 mainEventLogMessage:(id)a4 machAbsoluteTime:(unint64_t)a5 logLevel:(id)a6 dataDispatcherContext:(id)a7;
+ (BOOL)emitNLXRequestLink:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5;
+ (BOOL)emitRequestLink:(id)a3 metadata:(id)a4 dataDispatcherContext:(id)a5;
+ (BOOL)isEventSampledForEmission:(id)a3;
+ (BOOL)matchingSpanEnded:(id)a3 metadata:(id)a4 logMessage:(id)a5 dataDispatcherContext:(id)a6;
+ (BOOL)orchestratorRequestLink:(id)a3 nlId:(id)a4 metadata:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7;
+ (BOOL)tokenizationEnded:(id)a3 inputType:(int)a4 metadata:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7;
+ (BOOL)tokenizationEndedWithMultiResponses:(id)a3 inputType:(int)a4 metadata:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7;
+ (id)convertNLAssetToSISchemaAsset:(id)a3 nlAsset:(id)a4;
+ (id)createSELFMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithRequestId:(id)a5 andWithResultCandidateId:(id)a6 andWithConnectionId:(id)a7;
+ (id)createSELFMetadataWithRequestId:(id)a3;
+ (id)getAssetNameWithLocaleSuffix:(id)a3 locale:(id)a4;
+ (id)getVersionForAsset:(id)a3;
+ (id)mintRequestIdAndCreateSELFMetadataWithRequestId;
+ (int)getLocaleForAsset:(id)a3;
+ (int)stringNodeNameToEnum:(id)a3;
+ (int)stringServiceTypeToEnum:(id)a3;
+ (int)stringXPCSystemEventTypeToEnum:(id)a3;
+ (unsigned)getSampleRateForEvent:(id)a3;
@end

@implementation CDMSELFLogUtil

+ (int)getLocaleForAsset:(id)a3
{
  v3 = [a3 uppercaseString];
  v4 = [NSString stringWithFormat:@"%@%@", @"LOCALE_", v3];

  id v5 = v4;
  if ([v5 isEqualToString:@"LOCALE_UNKNOWN_LOCALE"])
  {
    int v6 = 0;
  }
  else if ([v5 isEqualToString:@"LOCALE_AR_AE"])
  {
    int v6 = 1;
  }
  else if ([v5 isEqualToString:@"LOCALE_AR_SA"])
  {
    int v6 = 2;
  }
  else if ([v5 isEqualToString:@"LOCALE_CA_ES"])
  {
    int v6 = 3;
  }
  else if ([v5 isEqualToString:@"LOCALE_CS_CZ"])
  {
    int v6 = 4;
  }
  else if ([v5 isEqualToString:@"LOCALE_DA_DK"])
  {
    int v6 = 5;
  }
  else if ([v5 isEqualToString:@"LOCALE_DE_AT"])
  {
    int v6 = 6;
  }
  else if ([v5 isEqualToString:@"LOCALE_DE_CH"])
  {
    int v6 = 7;
  }
  else if ([v5 isEqualToString:@"LOCALE_DE_DE"])
  {
    int v6 = 8;
  }
  else if ([v5 isEqualToString:@"LOCALE_EL_GR"])
  {
    int v6 = 9;
  }
  else if ([v5 isEqualToString:@"LOCALE_EN_AE"])
  {
    int v6 = 10;
  }
  else if ([v5 isEqualToString:@"LOCALE_EN_AU"])
  {
    int v6 = 11;
  }
  else if ([v5 isEqualToString:@"LOCALE_EN_CA"])
  {
    int v6 = 12;
  }
  else if ([v5 isEqualToString:@"LOCALE_EN_GB"])
  {
    int v6 = 13;
  }
  else if ([v5 isEqualToString:@"LOCALE_EN_ID"])
  {
    int v6 = 14;
  }
  else if ([v5 isEqualToString:@"LOCALE_EN_IE"])
  {
    int v6 = 15;
  }
  else if ([v5 isEqualToString:@"LOCALE_EN_IN"])
  {
    int v6 = 16;
  }
  else if ([v5 isEqualToString:@"LOCALE_EN_MY"])
  {
    int v6 = 17;
  }
  else if ([v5 isEqualToString:@"LOCALE_EN_NZ"])
  {
    int v6 = 18;
  }
  else if ([v5 isEqualToString:@"LOCALE_EN_PH"])
  {
    int v6 = 19;
  }
  else if ([v5 isEqualToString:@"LOCALE_EN_SG"])
  {
    int v6 = 20;
  }
  else if ([v5 isEqualToString:@"LOCALE_EN_SA"])
  {
    int v6 = 21;
  }
  else if ([v5 isEqualToString:@"LOCALE_EN_US"])
  {
    int v6 = 22;
  }
  else if ([v5 isEqualToString:@"LOCALE_EN_ZA"])
  {
    int v6 = 23;
  }
  else if ([v5 isEqualToString:@"LOCALE_ES_CL"])
  {
    int v6 = 24;
  }
  else if ([v5 isEqualToString:@"LOCALE_ES_CO"])
  {
    int v6 = 25;
  }
  else if ([v5 isEqualToString:@"LOCALE_ES_ES"])
  {
    int v6 = 26;
  }
  else if ([v5 isEqualToString:@"LOCALE_ES_MX"])
  {
    int v6 = 27;
  }
  else if ([v5 isEqualToString:@"LOCALE_ES_US"])
  {
    int v6 = 28;
  }
  else if ([v5 isEqualToString:@"LOCALE_FI_FI"])
  {
    int v6 = 29;
  }
  else if ([v5 isEqualToString:@"LOCALE_FR_BE"])
  {
    int v6 = 30;
  }
  else if ([v5 isEqualToString:@"LOCALE_FR_CA"])
  {
    int v6 = 31;
  }
  else if ([v5 isEqualToString:@"LOCALE_FR_CH"])
  {
    int v6 = 32;
  }
  else if ([v5 isEqualToString:@"LOCALE_FR_FR"])
  {
    int v6 = 33;
  }
  else if ([v5 isEqualToString:@"LOCALE_HE_IL"])
  {
    int v6 = 34;
  }
  else if ([v5 isEqualToString:@"LOCALE_HI_IN"])
  {
    int v6 = 35;
  }
  else if ([v5 isEqualToString:@"LOCALE_HR_HR"])
  {
    int v6 = 36;
  }
  else if ([v5 isEqualToString:@"LOCALE_HU_HU"])
  {
    int v6 = 37;
  }
  else if ([v5 isEqualToString:@"LOCALE_ID_ID"])
  {
    int v6 = 38;
  }
  else if ([v5 isEqualToString:@"LOCALE_IT_CH"])
  {
    int v6 = 39;
  }
  else if ([v5 isEqualToString:@"LOCALE_IT_IT"])
  {
    int v6 = 40;
  }
  else if ([v5 isEqualToString:@"LOCALE_JA_JP"])
  {
    int v6 = 41;
  }
  else if ([v5 isEqualToString:@"LOCALE_KO_KR"])
  {
    int v6 = 42;
  }
  else if ([v5 isEqualToString:@"LOCALE_MS_MY"])
  {
    int v6 = 43;
  }
  else if ([v5 isEqualToString:@"LOCALE_NB_NO"])
  {
    int v6 = 44;
  }
  else if ([v5 isEqualToString:@"LOCALE_NL_BE"])
  {
    int v6 = 45;
  }
  else if ([v5 isEqualToString:@"LOCALE_NL_NL"])
  {
    int v6 = 46;
  }
  else if ([v5 isEqualToString:@"LOCALE_PL_PL"])
  {
    int v6 = 47;
  }
  else if ([v5 isEqualToString:@"LOCALE_PT_BR"])
  {
    int v6 = 48;
  }
  else if ([v5 isEqualToString:@"LOCALE_PT_PT"])
  {
    int v6 = 49;
  }
  else if ([v5 isEqualToString:@"LOCALE_RO_RO"])
  {
    int v6 = 50;
  }
  else if ([v5 isEqualToString:@"LOCALE_RU_RU"])
  {
    int v6 = 51;
  }
  else if ([v5 isEqualToString:@"LOCALE_SK_SK"])
  {
    int v6 = 52;
  }
  else if ([v5 isEqualToString:@"LOCALE_SV_SE"])
  {
    int v6 = 53;
  }
  else if ([v5 isEqualToString:@"LOCALE_TH_TH"])
  {
    int v6 = 54;
  }
  else if ([v5 isEqualToString:@"LOCALE_TR_TR"])
  {
    int v6 = 55;
  }
  else if ([v5 isEqualToString:@"LOCALE_UK_UA"])
  {
    int v6 = 56;
  }
  else if ([v5 isEqualToString:@"LOCALE_VI_VN"])
  {
    int v6 = 57;
  }
  else if ([v5 isEqualToString:@"LOCALE_WUU_CN"])
  {
    int v6 = 58;
  }
  else if ([v5 isEqualToString:@"LOCALE_YUE_CN"])
  {
    int v6 = 59;
  }
  else if ([v5 isEqualToString:@"LOCALE_ZH_CN"])
  {
    int v6 = 60;
  }
  else if ([v5 isEqualToString:@"LOCALE_ZH_HK"])
  {
    int v6 = 61;
  }
  else if ([v5 isEqualToString:@"LOCALE_ZH_TW"])
  {
    int v6 = 62;
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

+ (BOOL)cdmAllServicesWarmupEnded:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v7 = (void *)MEMORY[0x263F71F68];
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 createCDMAllServicesWarmupEndedLog:a3];
  BOOL v11 = +[CDMSELFLogUtil emitEventsFromContainer:v10 mainEventLogMessage:v9 dataDispatcherContext:v8];

  if (!v11)
  {
    v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      v15 = "+[CDMSELFLogUtil cdmAllServicesWarmupEnded:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM All Services Warmup ended event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v14, 0xCu);
    }
  }
  return v11;
}

+ (BOOL)cdmAllServicesSetupStarted:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v7 = (void *)MEMORY[0x263F71F68];
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 createCDMAllServicesSetupStartedLog:a3];
  BOOL v11 = +[CDMSELFLogUtil emitEventsFromContainer:v10 mainEventLogMessage:v9 dataDispatcherContext:v8];

  if (!v11)
  {
    v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      v15 = "+[CDMSELFLogUtil cdmAllServicesSetupStarted:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM All Services Setup started event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v14, 0xCu);
    }
  }
  return v11;
}

+ (BOOL)cdmAllServicesSetupEnded:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v7 = (void *)MEMORY[0x263F71F68];
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 createCDMAllServicesSetupEndedLog:a3];
  BOOL v11 = +[CDMSELFLogUtil emitEventsFromContainer:v10 mainEventLogMessage:v9 dataDispatcherContext:v8];

  if (!v11)
  {
    v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      v15 = "+[CDMSELFLogUtil cdmAllServicesSetupEnded:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM All Services Setup ended event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v14, 0xCu);
    }
  }
  return v11;
}

+ (BOOL)cdmClientSetupEnded:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v7 = (void *)MEMORY[0x263F71F68];
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 createCDMClientSetupEndedLog:a3];
  BOOL v11 = +[CDMSELFLogUtil emitEventsFromContainer:v10 mainEventLogMessage:v9 dataDispatcherContext:v8];

  if (!v11)
  {
    v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      v15 = "+[CDMSELFLogUtil cdmClientSetupEnded:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM Client Setup ended event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v14, 0xCu);
    }
  }
  return v11;
}

+ (BOOL)cdmAssetSetupStarted:(id)a3 contextId:(id)a4 serviceNames:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v27 = a3;
  id v26 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  int v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = +[CDMSELFLogUtil stringServiceTypeToEnum:](CDMSELFLogUtil, "stringServiceTypeToEnum:", *(void *)(*((void *)&v28 + 1) + 8 * i), v26);
        v21 = [NSNumber numberWithInt:v20];
        [v14 addObject:v21];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v17);
  }

  v22 = [MEMORY[0x263F71F68] createCDMAssetSetupStartedLog:v26 serviceTypes:v14 metadata:v27];
  BOOL v23 = +[CDMSELFLogUtil emitEventsFromContainer:v22 mainEventLogMessage:v12 dataDispatcherContext:v13];
  if (!v23)
  {
    v24 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "+[CDMSELFLogUtil cdmAssetSetupStarted:contextId:serviceNames:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v24, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDMAssetSetup started event, but there was an issue with emission. Log was not emitted!!", buf, 0xCu);
    }
  }
  return v23;
}

+ (BOOL)cdmAssetSetupEnded:(id)a3 contextId:(id)a4 logMessage:(id)a5 dataDispatcherContext:(id)a6
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v9 = (void *)MEMORY[0x263F71F68];
  id v10 = a6;
  id v11 = a5;
  id v12 = [v9 createCDMAssetSetupEndedLog:a4 metadata:a3];
  BOOL v13 = +[CDMSELFLogUtil emitEventsFromContainer:v12 mainEventLogMessage:v11 dataDispatcherContext:v10];

  if (!v13)
  {
    int v14 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      uint64_t v17 = "+[CDMSELFLogUtil cdmAssetSetupEnded:contextId:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDMAssetSetup ended event, but there was an issue with emission. Log was not emitted!!", (uint8_t *)&v16, 0xCu);
    }
  }
  return v13;
}

+ (BOOL)cdmAssetsReported:(id)a3 metadata:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v23 = a4;
  id v8 = a5;
  id v9 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    long long v30 = "+[CDMSELFLogUtil cdmAssetsReported:metadata:dataDispatcherContext:]";
    __int16 v31 = 2112;
    v32 = @"assets";
    __int16 v33 = 2112;
    id v34 = v7;
    _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nAssets available are: %@", buf, 0x20u);
  }
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v17 = [v11 objectForKey:v16];
        uint64_t v18 = +[CDMSELFLogUtil convertNLAssetToSISchemaAsset:v16 nlAsset:v17];
        [v10 addObject:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  v19 = [MEMORY[0x263F71F68] createCDMAssetsReportedLog:v10 metadata:v23];
  BOOL v20 = +[CDMSELFLogUtil emitEventsFromContainer:v19 mainEventLogMessage:@"Logging assets information!" dataDispatcherContext:v8];
  if (!v20)
  {
    v21 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v30 = "+[CDMSELFLogUtil cdmAssetsReported:metadata:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v21, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDMAssetsReported event, but there was an issue with emission. Log was not emitted!", buf, 0xCu);
    }
  }
  return v20;
}

+ (BOOL)cdmAllServicesWarmupStarted:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = (void *)MEMORY[0x263F71F68];
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 createCDMAllServicesWarmupStartedLog:a3];
  BOOL v11 = +[CDMSELFLogUtil emitEventsFromContainer:v10 mainEventLogMessage:v9 dataDispatcherContext:v8];

  if (!v11)
  {
    uint64_t v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      id v15 = "+[CDMSELFLogUtil cdmAllServicesWarmupStarted:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM All Services Warmup started event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v14, 0xCu);
    }
  }
  return v11;
}

+ (BOOL)emitEventsFromContainer:(id)a3 mainEventLogMessage:(id)a4 dataDispatcherContext:(id)a5
{
  return +[CDMSELFLogUtil emitEventsFromContainer:a3 mainEventLogMessage:a4 machAbsoluteTime:0 logLevel:@"LOG_DEBUG" dataDispatcherContext:a5];
}

+ (BOOL)emitEventsFromContainer:(id)a3 mainEventLogMessage:(id)a4 machAbsoluteTime:(unint64_t)a5 logLevel:(id)a6 dataDispatcherContext:(id)a7
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  int v14 = (CDMDataDispatcherContext *)a7;
  id v15 = v14;
  if (!v14
    || ([(CDMDataDispatcherContext *)v14 callingBundleId],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        !v16))
  {
    uint64_t v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
      _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s No datadispatchercontext found - using default logging policy", buf, 0xCu);
    }

    uint64_t v18 = objc_alloc_init(CDMDataDispatcherContext);
    id v15 = v18;
  }
  if (!+[CDMSELFLoggingPolicy isSELFLoggingAllowed:[(CDMDataDispatcherContext *)v15 cdmSELFLoggingPolicyType]])
  {
    __int16 v31 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136315138;
    v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
    v32 = "%s Tried to emit a SELF event, but logging is not allowed!";
LABEL_22:
    _os_log_debug_impl(&dword_2263A0000, v31, OS_LOG_TYPE_DEBUG, v32, buf, 0xCu);
    goto LABEL_29;
  }
  if (![(CDMDataDispatcherContext *)v15 isSampledForEmission])
  {
    __int16 v31 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136315138;
    v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
    v32 = "%s Supressing SELF log emission, not sampled.";
    goto LABEL_22;
  }
  if (v11)
  {
    v19 = [v11 mainEvent];

    if (!v19) {
      goto LABEL_53;
    }
    BOOL v20 = [v11 mainEvent];
    if ([v20 hasEventMetadata])
    {
      v21 = [v11 mainEvent];
      v22 = [v21 eventMetadata];
      char v23 = [v22 hasNlId];

      if (v23)
      {
        long long v24 = [v11 mainEvent];
        BOOL v25 = +[CDMSELFLogUtil isEventSampledForEmission:v24];

        if (!v25)
        {
          BOOL v34 = 0;
          goto LABEL_31;
        }
        int v26 = [(CDMDataDispatcherContext *)v15 cdmSELFLoggingPolicyType];
        long long v27 = CDMOSLoggerForCategory(0);
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
        if (v26 == 1)
        {
          if (v28)
          {
            *(_DWORD *)buf = 136315138;
            v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
            _os_log_debug_impl(&dword_2263A0000, v27, OS_LOG_TYPE_DEBUG, "%s CDM Log policy - Siri", buf, 0xCu);
          }

          long long v29 = [MEMORY[0x263F6C810] sharedStream];
          long long v30 = [v11 mainEvent];
          if (a5) {
            [v29 emitMessage:v30 timestamp:a5];
          }
          else {
            [v29 emitMessage:v30];
          }
        }
        else
        {
          if (v28)
          {
            *(_DWORD *)buf = 136315138;
            v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
            _os_log_debug_impl(&dword_2263A0000, v27, OS_LOG_TYPE_DEBUG, "%s CDM Log policy - Non Siri", buf, 0xCu);
          }

          long long v29 = [MEMORY[0x263F6C810] sharedAnalytics];
          long long v30 = [v29 defaultMessageStream];
          v36 = [v11 mainEvent];
          v37 = [(CDMDataDispatcherContext *)v15 streamUUID];
          if (a5) {
            [v30 emitMessage:v36 timestamp:a5 isolatedStreamUUID:v37];
          }
          else {
            [v30 emitMessage:v36 isolatedStreamUUID:v37];
          }
        }
        if ([v13 isEqualToString:@"LOG_DEBUG"])
        {
          v38 = CDMOSLoggerForCategory(0);
          if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
LABEL_52:

LABEL_53:
            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            __int16 v31 = [v11 tier1Events];
            uint64_t v41 = [v31 countByEnumeratingWithState:&v49 objects:v53 count:16];
            if (v41)
            {
              uint64_t v42 = v41;
              id v48 = v13;
              uint64_t v43 = *(void *)v50;
              do
              {
                for (uint64_t i = 0; i != v42; ++i)
                {
                  if (*(void *)v50 != v43) {
                    objc_enumerationMutation(v31);
                  }
                  uint64_t v45 = *(void *)(*((void *)&v49 + 1) + 8 * i);
                  if ([(CDMDataDispatcherContext *)v15 cdmSELFLoggingPolicyType] == 1)
                  {
                    v46 = [MEMORY[0x263F6C810] sharedStream];
                    v47 = v46;
                    if (a5) {
                      [v46 emitMessage:v45 timestamp:a5];
                    }
                    else {
                      [v46 emitMessage:v45];
                    }
                  }
                  else
                  {
                    v47 = CDMOSLoggerForCategory(0);
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 136315138;
                      v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataD"
                            "ispatcherContext:]";
                      _os_log_impl(&dword_2263A0000, v47, OS_LOG_TYPE_INFO, "%s [WARN]: Got a tier1Event for non-siri client", buf, 0xCu);
                    }
                  }
                }
                uint64_t v42 = [v31 countByEnumeratingWithState:&v49 objects:v53 count:16];
              }
              while (v42);
              BOOL v34 = 1;
              id v13 = v48;
            }
            else
            {
              BOOL v34 = 1;
            }
            goto LABEL_30;
          }
        }
        else
        {
          if ([v13 isEqualToString:@"LOG_WARN"])
          {
            v38 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
              __int16 v56 = 2112;
              id v57 = v12;
              _os_log_impl(&dword_2263A0000, v38, OS_LOG_TYPE_INFO, "%s [WARN]: %@", buf, 0x16u);
            }
            goto LABEL_52;
          }
          int v39 = [v13 isEqualToString:@"LOG_ERROR"];
          v40 = CDMOSLoggerForCategory(0);
          v38 = v40;
          if (v39)
          {
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
              __int16 v56 = 2112;
              id v57 = v12;
              _os_log_error_impl(&dword_2263A0000, v38, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
            }
            goto LABEL_52;
          }
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
            _os_log_impl(&dword_2263A0000, v38, OS_LOG_TYPE_INFO, "%s [WARN]: Did not get a valid log level for SELF emitEventsFromContainer. Defaulting to debug level.", buf, 0xCu);
          }

          v38 = CDMOSLoggerForCategory(0);
          if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_52;
          }
        }
        *(_DWORD *)buf = 136315394;
        v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
        __int16 v56 = 2112;
        id v57 = v12;
        _os_log_debug_impl(&dword_2263A0000, v38, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
        goto LABEL_52;
      }
    }
    else
    {
    }
    __int16 v31 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
      __int16 v33 = "%s [WARN]: Tried to emit a SELF event, but the event's NL ID was nil! This event is not emitted as it is cre"
            "ated from a test.";
      goto LABEL_28;
    }
  }
  else
  {
    __int16 v31 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
      __int16 v33 = "%s [WARN]: Tried to emit a SELF event, but the given eventContainer was nil!";
LABEL_28:
      _os_log_impl(&dword_2263A0000, v31, OS_LOG_TYPE_INFO, v33, buf, 0xCu);
    }
  }
LABEL_29:
  BOOL v34 = 0;
LABEL_30:

LABEL_31:
  return v34;
}

+ (BOOL)isEventSampledForEmission:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  unsigned int v4 = +[CDMSELFLogUtil getSampleRateForEvent:v3];
  if (v4 > 0x63) {
    goto LABEL_9;
  }
  unsigned int v5 = v4;
  int v6 = [v3 eventMetadata];
  id v7 = [v6 nlId];
  id v8 = [v7 toSafeNSUUID];
  id v9 = [v8 UUIDString];
  id v10 = [v9 substringToIndex:8];

  id v11 = v10;
  id v12 = (const char *)[v11 UTF8String];
  if (v12)
  {
    unint64_t v13 = strtoul(v12, 0, 16);
  }
  else
  {
    [MEMORY[0x263EFF940] raise:@"Invalid NL ID substring" format:@"The substring from NL ID is nil!"];
    unint64_t v13 = 0;
  }
  int v14 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 136315394;
    v19 = "+[CDMSELFLogUtil isEventSampledForEmission:]";
    __int16 v20 = 2048;
    unint64_t v21 = v13;
    _os_log_debug_impl(&dword_2263A0000, v14, OS_LOG_TYPE_DEBUG, "%s NLX SELF log sampling value: %lu", (uint8_t *)&v18, 0x16u);
  }

  if (v13 % 0x64 < v5)
  {

LABEL_9:
    BOOL v15 = 1;
    goto LABEL_13;
  }
  uint64_t v16 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 136315138;
    v19 = "+[CDMSELFLogUtil isEventSampledForEmission:]";
    _os_log_debug_impl(&dword_2263A0000, v16, OS_LOG_TYPE_DEBUG, "%s NLX SELF log sampled via NL ID", (uint8_t *)&v18, 0xCu);
  }

  BOOL v15 = 0;
LABEL_13:

  return v15;
}

+ (unsigned)getSampleRateForEvent:(id)a3
{
  id v3 = [a3 cdmXpcEventProcessingContext];

  if (v3) {
    return 5;
  }
  else {
    return 100;
  }
}

+ (id)convertNLAssetToSISchemaAsset:(id)a3 nlAsset:(id)a4
{
  unsigned int v5 = (objc_class *)MEMORY[0x263F6ECF0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  id v9 = [v6 getAssetSetName];
  [v8 setTrialNamespace:v9];

  id v10 = [v6 getAssetLocale];
  id v11 = +[CDMSELFLogUtil getAssetNameWithLocaleSuffix:v7 locale:v10];

  [v8 setAssetName:v11];
  id v12 = [v6 getAssetLocale];
  objc_msgSend(v8, "setAssetLocale:", +[CDMSELFLogUtil getLocaleForAsset:](CDMSELFLogUtil, "getLocaleForAsset:", v12));

  unint64_t v13 = [v6 getAssetVersion];

  int v14 = +[CDMSELFLogUtil getVersionForAsset:v13];
  [v8 setAssetVersion:v14];

  return v8;
}

+ (id)getAssetNameWithLocaleSuffix:(id)a3 locale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6 && ![v5 hasSuffix:v6])
  {
    id v8 = [NSString stringWithFormat:@"%@.%@", v5, v7];
  }
  else
  {
    id v8 = v5;
  }
  id v9 = v8;

  return v9;
}

+ (id)getVersionForAsset:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v3 = [a3 componentsSeparatedByString:@"."];
    id v4 = objc_alloc_init(MEMORY[0x263F6EEF0]);
    if ((unint64_t)[v3 count] >= 2 && (unint64_t)[v3 count] < 4)
    {
      id v7 = [v3 objectAtIndexedSubscript:0];
      objc_msgSend(v4, "setMajor:", objc_msgSend(v7, "intValue"));

      id v8 = [v3 objectAtIndexedSubscript:1];
      objc_msgSend(v4, "setMinor:", objc_msgSend(v8, "intValue"));

      if ([v3 count] == 3)
      {
        id v9 = [v3 objectAtIndexedSubscript:2];
        objc_msgSend(v4, "setPatch:", objc_msgSend(v9, "intValue"));
      }
      id v6 = v4;
    }
    else
    {
      id v5 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315394;
        id v12 = "+[CDMSELFLogUtil getVersionForAsset:]";
        __int16 v13 = 2048;
        uint64_t v14 = [v3 count];
        _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: Version info count is %lu", (uint8_t *)&v11, 0x16u);
      }

      id v6 = 0;
    }
  }
  else
  {
    id v3 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      id v12 = "+[CDMSELFLogUtil getVersionForAsset:]";
      _os_log_impl(&dword_2263A0000, v3, OS_LOG_TYPE_INFO, "%s [WARN]: NL Asset Version is nil", (uint8_t *)&v11, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

+ (int)stringServiceTypeToEnum:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = +[CDMServiceTypeNames getNameStringToEnumDict];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 objectForKey:v3];
      if (v6)
      {
        id v7 = v6;
        int v8 = [v6 intValue];
LABEL_14:

        goto LABEL_15;
      }
      id v9 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315138;
        id v12 = "+[CDMSELFLogUtil stringServiceTypeToEnum:]";
        _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to fetch CDMServiceType with string key, but received nil!", (uint8_t *)&v11, 0xCu);
      }

      id v7 = 0;
    }
    else
    {
      id v7 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315138;
        id v12 = "+[CDMSELFLogUtil stringServiceTypeToEnum:]";
        _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to fetch CDMServiceTypeNames stringToEnumDict, but received nil!", (uint8_t *)&v11, 0xCu);
      }
    }
    int v8 = 0;
    goto LABEL_14;
  }
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    id v12 = "+[CDMSELFLogUtil stringServiceTypeToEnum:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: Nil given to stringServiceTypeToEnum method!", (uint8_t *)&v11, 0xCu);
  }
  int v8 = 0;
LABEL_15:

  return v8;
}

+ (BOOL)cdmClientSetupStarted:(id)a3 logMessage:(id)a4 currentServiceGraph:(int)a5 dataDispatcherContext:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  id v12 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    BOOL v25 = [v9 nlId];
    uint64_t v22 = [v25 toSafeNSUUID];
    uint64_t v17 = [v9 resultCandidateId];
    long long v24 = [v9 trpId];
    int v18 = [v24 toSafeNSUUID];
    char v23 = [v9 requestId];
    v19 = [v23 toSafeNSUUID];
    __int16 v20 = [v9 subRequestId];
    [v20 toSafeNSUUID];
    *(_DWORD *)buf = 136316418;
    long long v27 = "+[CDMSELFLogUtil cdmClientSetupStarted:logMessage:currentServiceGraph:dataDispatcherContext:]";
    __int16 v28 = 2112;
    long long v29 = v22;
    __int16 v30 = 2112;
    __int16 v31 = v17;
    __int16 v32 = 2112;
    __int16 v33 = v18;
    __int16 v34 = 2112;
    uint64_t v35 = v19;
    v37 = __int16 v36 = 2112;
    unint64_t v21 = (void *)v37;
    _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s SELF Metadata for CDMClientSetupStarted \n nlxMetadata.nlId: %@ \n nlxMetadata.rcId: %@ \n nlxMetadata.trpId: %@ \nnlxMetadata.requestId: %@ \n nlxMetadata.subRequestId: %@ \n ", buf, 0x3Eu);
  }
  uint64_t v13 = [MEMORY[0x263F71F68] createCDMClientSetupStartedLog:v9 cdmServiceGraphName:v7];
  BOOL v14 = +[CDMSELFLogUtil emitEventsFromContainer:v13 mainEventLogMessage:v11 dataDispatcherContext:v10];

  if (!v14)
  {
    uint64_t v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v27 = "+[CDMSELFLogUtil cdmClientSetupStarted:logMessage:currentServiceGraph:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM Client Setup started event, but there was an issue with emission. Log was not emitted!", buf, 0xCu);
    }
  }
  return v14;
}

+ (id)mintRequestIdAndCreateSELFMetadataWithRequestId
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F71D18]);
  id v3 = NSString;
  id v4 = [MEMORY[0x263F08C38] UUID];
  id v5 = [v4 UUIDString];
  id v6 = [v3 stringWithFormat:@"%@:0", v5];
  [v2 setIdA:v6];

  uint64_t v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [v2 idA];
    *(_DWORD *)buf = 136315394;
    id v12 = "+[CDMSELFLogUtil mintRequestIdAndCreateSELFMetadataWithRequestId]";
    __int16 v13 = 2112;
    BOOL v14 = v10;
    _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s Generated request id with UUID: %@", buf, 0x16u);
  }
  int v8 = +[CDMSELFLogUtil createSELFMetadataWithRequestId:v2];

  return v8;
}

+ (int)stringXPCSystemEventTypeToEnum:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = +[CDMXPCSystemEventTypeNames getNameStringToEnumDict];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 objectForKey:v3];
      if (v6)
      {
        uint64_t v7 = v6;
        int v8 = [v6 intValue];
LABEL_14:

        goto LABEL_15;
      }
      id v9 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315138;
        id v12 = "+[CDMSELFLogUtil stringXPCSystemEventTypeToEnum:]";
        _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to fetch CDMXPCSystemEventType with string key, but received nil!", (uint8_t *)&v11, 0xCu);
      }

      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315138;
        id v12 = "+[CDMSELFLogUtil stringXPCSystemEventTypeToEnum:]";
        _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to fetch CDMXPCSystemEventTypeNames stringToEnumDict, but received nil!", (uint8_t *)&v11, 0xCu);
      }
    }
    int v8 = 0;
    goto LABEL_14;
  }
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    id v12 = "+[CDMSELFLogUtil stringXPCSystemEventTypeToEnum:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: Nil given to stringXPCSystemEventTypeToEnum method!", (uint8_t *)&v11, 0xCu);
  }
  int v8 = 0;
LABEL_15:

  return v8;
}

+ (int)stringNodeNameToEnum:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = +[CDMServiceNodeNames getNameStringToEnumDict];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 objectForKey:v3];
      if (v6)
      {
        uint64_t v7 = v6;
        int v8 = [v6 intValue];
LABEL_14:

        goto LABEL_15;
      }
      id v9 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315138;
        id v12 = "+[CDMSELFLogUtil stringNodeNameToEnum:]";
        _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to fetch CDMServiceName with string key, but received nil!", (uint8_t *)&v11, 0xCu);
      }

      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315138;
        id v12 = "+[CDMSELFLogUtil stringNodeNameToEnum:]";
        _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to fetch CDMServiceNodeNames stringToEnumDict, but received nil!", (uint8_t *)&v11, 0xCu);
      }
    }
    int v8 = 0;
    goto LABEL_14;
  }
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    id v12 = "+[CDMSELFLogUtil stringNodeNameToEnum:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: Nil given to stringNodeNameToEnum method!", (uint8_t *)&v11, 0xCu);
  }
  int v8 = 0;
LABEL_15:

  return v8;
}

+ (BOOL)cdmXpcProcessingFailed:(id)a3 reason:(int)a4 errorCode:(unsigned int)a5 metadata:(id)a6 logMessage:(id)a7 dataDispatcherContext:(id)a8
{
  uint64_t v10 = *(void *)&a5;
  uint64_t v11 = *(void *)&a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v13 = (void *)MEMORY[0x263F71F68];
  id v14 = a8;
  id v15 = a7;
  uint64_t v16 = [v13 createCdmXpcEventProcessingFailedLog:a3 reason:v11 errorCode:v10 metadata:a6];
  BOOL v17 = +[CDMSELFLogUtil emitEventsFromContainer:v16 mainEventLogMessage:v15 dataDispatcherContext:v14];

  if (!v17)
  {
    int v18 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315138;
      unint64_t v21 = "+[CDMSELFLogUtil cdmXpcProcessingFailed:reason:errorCode:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM XPC Processing failed event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v20, 0xCu);
    }
  }
  return v17;
}

+ (BOOL)cdmXpcProcessingEnded:(id)a3 metadata:(id)a4 logMessage:(id)a5 dataDispatcherContext:(id)a6
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v9 = (void *)MEMORY[0x263F71F68];
  id v10 = a6;
  id v11 = a5;
  id v12 = [v9 createCdmXpcEventProcessingEndedLog:a3 metadata:a4];
  BOOL v13 = +[CDMSELFLogUtil emitEventsFromContainer:v12 mainEventLogMessage:v11 dataDispatcherContext:v10];

  if (!v13)
  {
    id v14 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      BOOL v17 = "+[CDMSELFLogUtil cdmXpcProcessingEnded:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM XPC Processing ended event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v16, 0xCu);
    }
  }
  return v13;
}

+ (BOOL)cdmXpcProcessingStarted:(id)a3 xpcType:(int)a4 xpcSystemEventType:(int)a5 serviceName:(int)a6 metadata:(id)a7 logMessage:(id)a8 dataDispatcherContext:(id)a9
{
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  uint64_t v13 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v15 = (void *)MEMORY[0x263F71F68];
  id v16 = a9;
  id v17 = a8;
  uint64_t v18 = [v15 createCdmXpcEventProcessingStartedLog:a3 xpcType:v13 xpcSystemEventType:v12 serviceName:v11 metadata:a7];
  BOOL v19 = +[CDMSELFLogUtil emitEventsFromContainer:v18 mainEventLogMessage:v17 dataDispatcherContext:v16];

  if (!v19)
  {
    int v20 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v22 = 136315138;
      char v23 = "+[CDMSELFLogUtil cdmXpcProcessingStarted:xpcType:xpcSystemEventType:serviceName:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM XPC Processing started event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v22, 0xCu);
    }
  }
  return v19;
}

+ (BOOL)cdmSetupMissingAssetsDetected:(id)a3 contextId:(id)a4 serviceNames:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v27 = a3;
  id v26 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = +[CDMSELFLogUtil stringServiceTypeToEnum:](CDMSELFLogUtil, "stringServiceTypeToEnum:", *(void *)(*((void *)&v28 + 1) + 8 * i), v26);
        unint64_t v21 = [NSNumber numberWithInt:v20];
        [v14 addObject:v21];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v17);
  }

  int v22 = [MEMORY[0x263F71F68] createCDMSetupMissingAssetsDetectedLog:v26 services:v14 metadata:v27];
  BOOL v23 = +[CDMSELFLogUtil emitEventsFromContainer:v22 mainEventLogMessage:v12 dataDispatcherContext:v13];
  if (!v23)
  {
    uint64_t v24 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v33 = "+[CDMSELFLogUtil cdmSetupMissingAssetsDetected:contextId:serviceNames:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v24, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDMSetupMissingAssetsDetected event, but there was an issue with emission. Log was not emitted!!", buf, 0xCu);
    }
  }
  return v23;
}

+ (BOOL)cdmAssetSetupFailed:(id)a3 contextId:(id)a4 errorDomain:(int)a5 errorCode:(unsigned int)a6 logMessage:(id)a7 dataDispatcherContext:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  uint64_t v10 = *(void *)&a5;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v13 = (void *)MEMORY[0x263F71F68];
  id v14 = a8;
  id v15 = a7;
  uint64_t v16 = [v13 createCDMAssetSetupFailedLog:a4 errorDomain:v10 errorCode:v9 metadata:a3];
  BOOL v17 = +[CDMSELFLogUtil emitEventsFromContainer:v16 mainEventLogMessage:v15 dataDispatcherContext:v14];

  if (!v17)
  {
    uint64_t v18 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315138;
      unint64_t v21 = "+[CDMSELFLogUtil cdmAssetSetupFailed:contextId:errorDomain:errorCode:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDMAssetSetup failed event, but there was an issue with emission. Log was not emitted!!", (uint8_t *)&v20, 0xCu);
    }
  }
  return v17;
}

+ (BOOL)cdmAllServicesWarmupFailed:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)MEMORY[0x263F71F68];
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [v7 createCDMAllServicesWarmupFailedLog:a3];
  BOOL v11 = +[CDMSELFLogUtil emitEventsFromContainer:v10 mainEventLogMessage:v9 dataDispatcherContext:v8];

  if (!v11)
  {
    id v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      id v15 = "+[CDMSELFLogUtil cdmAllServicesWarmupFailed:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM All Services Warmup failed event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v14, 0xCu);
    }
  }
  return v11;
}

+ (BOOL)cdmClientWarmupFailed:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v11 = (void *)MEMORY[0x263F71F68];
  id v12 = a7;
  id v13 = a6;
  int v14 = [v11 createCDMClientWarmupFailedLog:a3 errorDomain:v9 errorCode:v8];
  BOOL v15 = +[CDMSELFLogUtil emitEventsFromContainer:v14 mainEventLogMessage:v13 dataDispatcherContext:v12];

  if (!v15)
  {
    uint64_t v16 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      BOOL v19 = "+[CDMSELFLogUtil cdmClientWarmupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v16, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM Client Warmup failed event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v18, 0xCu);
    }
  }
  return v15;
}

+ (BOOL)cdmClientWarmupEnded:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)MEMORY[0x263F71F68];
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [v7 createCDMClientWarmupEndedLog:a3];
  BOOL v11 = +[CDMSELFLogUtil emitEventsFromContainer:v10 mainEventLogMessage:v9 dataDispatcherContext:v8];

  if (!v11)
  {
    id v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      BOOL v15 = "+[CDMSELFLogUtil cdmClientWarmupEnded:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM Client Warmup ended event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v14, 0xCu);
    }
  }
  return v11;
}

+ (BOOL)cdmClientWarmupStarted:(id)a3 logMessage:(id)a4 currentServiceGraph:(int)a5 dataDispatcherContext:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  id v12 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    BOOL v25 = [v9 nlId];
    uint64_t v22 = [v25 toSafeNSUUID];
    BOOL v17 = [v9 resultCandidateId];
    uint64_t v24 = [v9 trpId];
    int v18 = [v24 toSafeNSUUID];
    BOOL v23 = [v9 requestId];
    BOOL v19 = [v23 toSafeNSUUID];
    uint64_t v20 = [v9 subRequestId];
    [v20 toSafeNSUUID];
    *(_DWORD *)buf = 136316418;
    id v27 = "+[CDMSELFLogUtil cdmClientWarmupStarted:logMessage:currentServiceGraph:dataDispatcherContext:]";
    __int16 v28 = 2112;
    long long v29 = v22;
    __int16 v30 = 2112;
    long long v31 = v17;
    __int16 v32 = 2112;
    __int16 v33 = v18;
    __int16 v34 = 2112;
    uint64_t v35 = v19;
    v37 = __int16 v36 = 2112;
    unint64_t v21 = (void *)v37;
    _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s SELF Metadata for CDMClientWarmupStarted \n nlxMetadata.nlId: %@ \n nlxMetadata.rcId: %@ \n nlxMetadata.trpId: %@ \nnlxMetadata.requestId: %@ \n nlxMetadata.subRequestId: %@ \n ", buf, 0x3Eu);
  }
  id v13 = [MEMORY[0x263F71F68] createCDMClientWarmupStartedLog:v9 cdmServiceGraphName:v7];
  BOOL v14 = +[CDMSELFLogUtil emitEventsFromContainer:v13 mainEventLogMessage:v11 dataDispatcherContext:v10];

  if (!v14)
  {
    BOOL v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v27 = "+[CDMSELFLogUtil cdmClientWarmupStarted:logMessage:currentServiceGraph:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM Client Warmup started event, but there was an issue with emission. Log was not emitted!", buf, 0xCu);
    }
  }
  return v14;
}

+ (BOOL)cdmAllServicesSetupFailed:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)MEMORY[0x263F71F68];
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 createCDMAllServicesSetupFailedLog:a3];
  BOOL v11 = +[CDMSELFLogUtil emitEventsFromContainer:v10 mainEventLogMessage:v9 dataDispatcherContext:v8];

  if (!v11)
  {
    id v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      BOOL v15 = "+[CDMSELFLogUtil cdmAllServicesSetupFailed:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM All Services Setup failed event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v14, 0xCu);
    }
  }
  return v11;
}

+ (BOOL)cdmClientSetupFailed:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v11 = (void *)MEMORY[0x263F71F68];
  id v12 = a7;
  id v13 = a6;
  int v14 = [v11 createCDMClientSetupFailedLog:a3 errorDomain:v9 errorCode:v8];
  BOOL v15 = +[CDMSELFLogUtil emitEventsFromContainer:v14 mainEventLogMessage:v13 dataDispatcherContext:v12];

  if (!v15)
  {
    uint64_t v16 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      BOOL v19 = "+[CDMSELFLogUtil cdmClientSetupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v16, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM Client Setup failed event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v18, 0xCu);
    }
  }
  return v15;
}

+ (BOOL)cdmClientSetupFailed:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5 logMessage:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v9 = (void *)MEMORY[0x263F71F68];
  id v10 = a6;
  BOOL v11 = [v9 createCDMClientSetupFailedLog:a3 errorDomain:v7 errorCode:v6];
  BOOL v12 = +[CDMSELFLogUtil emitEventsFromContainer:v11 mainEventLogMessage:v10];

  if (!v12)
  {
    id v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315138;
      uint64_t v16 = "+[CDMSELFLogUtil cdmClientSetupFailed:errorDomain:errorCode:logMessage:]";
      _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM Client Setup failed event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v15, 0xCu);
    }
  }
  return v12;
}

+ (BOOL)contextUpdateEnded:(id)a3 metadata:(id)a4 logMessage:(id)a5 dataDispatcherContext:(id)a6
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v9 = (void *)MEMORY[0x263F71F68];
  id v10 = a6;
  id v11 = a5;
  BOOL v12 = [v9 createContextUpdateEndedLog:0 contextUpdateResponse:a3 metadata:a4];
  BOOL v13 = +[CDMSELFLogUtil emitEventsFromContainer:v12 mainEventLogMessage:v11 dataDispatcherContext:v10];

  if (!v13)
  {
    int v14 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      uint64_t v17 = "+[CDMSELFLogUtil contextUpdateEnded:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM context update ended (response) event, but the converted object is nil!", (uint8_t *)&v16, 0xCu);
    }
  }
  return v13;
}

+ (BOOL)tokenizationEndedWithMultiResponses:(id)a3 inputType:(int)a4 metadata:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v11 = (void *)MEMORY[0x263F71F68];
  id v12 = a7;
  id v13 = a6;
  int v14 = [v11 createMultiHypoTokenizationEndedLog:0 tokenizationResponses:a3 tokenizationInputType:v9 metadata:a5];
  BOOL v15 = +[CDMSELFLogUtil emitEventsFromContainer:v14 mainEventLogMessage:v13 dataDispatcherContext:v12];

  if (!v15)
  {
    int v16 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      BOOL v19 = "+[CDMSELFLogUtil tokenizationEndedWithMultiResponses:inputType:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v16, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM tokenization ended (response) event, but the converted object is nil!", (uint8_t *)&v18, 0xCu);
    }
  }
  return v15;
}

+ (BOOL)tokenizationEnded:(id)a3 inputType:(int)a4 metadata:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v11 = (void *)MEMORY[0x263F71F68];
  id v12 = a7;
  id v13 = a6;
  int v14 = [v11 createTokenizationEndedLog:0 tokenizationResponse:a3 tokenizationInputType:v9 metadata:a5];
  BOOL v15 = +[CDMSELFLogUtil emitEventsFromContainer:v14 mainEventLogMessage:v13 dataDispatcherContext:v12];

  if (!v15)
  {
    int v16 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      BOOL v19 = "+[CDMSELFLogUtil tokenizationEnded:inputType:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v16, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM tokenization ended (response) event, but the converted object is nil!", (uint8_t *)&v18, 0xCu);
    }
  }
  return v15;
}

+ (BOOL)matchingSpanEnded:(id)a3 metadata:(id)a4 logMessage:(id)a5 dataDispatcherContext:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v9 = CDMLogContext;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  os_signpost_id_t v14 = os_signpost_id_generate(v9);
  BOOL v15 = (id)CDMLogContext;
  int v16 = v15;
  unint64_t v17 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(v25) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "SpanMatcher", "SELFLogSpanMatching", (uint8_t *)&v25, 2u);
  }

  int v18 = [MEMORY[0x263F71F68] createMatchingSpanEndedLog:0 spanMatchResponse:v13 metadata:v12];

  BOOL v19 = +[CDMSELFLogUtil emitEventsFromContainer:v18 mainEventLogMessage:v11 dataDispatcherContext:v10];
  if (v19)
  {
    uint64_t v20 = (id)CDMLogContext;
    unint64_t v21 = v20;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      LOWORD(v25) = 0;
LABEL_13:
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v21, OS_SIGNPOST_INTERVAL_END, v14, "SpanMatcher", "", (uint8_t *)&v25, 2u);
    }
  }
  else
  {
    uint64_t v22 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int v25 = 136315138;
      id v26 = "+[CDMSELFLogUtil matchingSpanEnded:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v22, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM matching span ended (response) event, but the converted object is nil!", (uint8_t *)&v25, 0xCu);
    }

    BOOL v23 = (id)CDMLogContext;
    unint64_t v21 = v23;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      LOWORD(v25) = 0;
      goto LABEL_13;
    }
  }

  return v19;
}

+ (BOOL)cdmFailed:(int)a3 errorDomainString:(id)a4 errorCode:(int)a5 metadata:(id)a6 logMessage:(id)a7 dataDispatcherContext:(id)a8
{
  uint64_t v10 = *(void *)&a5;
  uint64_t v12 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v13 = (void *)MEMORY[0x263F71F68];
  id v14 = a8;
  id v15 = a7;
  int v16 = [v13 createCDMRequestFailedLog:v12 errorDomainString:a4 errorCode:v10 metadata:a6];
  BOOL v17 = +[CDMSELFLogUtil emitEventsFromContainer:v16 mainEventLogMessage:v15 dataDispatcherContext:v14];

  if (!v17)
  {
    int v18 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315138;
      unint64_t v21 = "+[CDMSELFLogUtil cdmFailed:errorDomainString:errorCode:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM failed event, but the converted object is nil!", (uint8_t *)&v20, 0xCu);
    }
  }
  return v17;
}

+ (BOOL)cdmFailed:(int)a3 metadata:(id)a4 logMessage:(id)a5 dataDispatcherContext:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v9 = (void *)MEMORY[0x263F71F68];
  id v10 = a6;
  id v11 = a5;
  uint64_t v12 = [v9 createCDMRequestFailedLog:v8 metadata:a4];
  BOOL v13 = +[CDMSELFLogUtil emitEventsFromContainer:v12 mainEventLogMessage:v11 dataDispatcherContext:v10];

  if (!v13)
  {
    id v14 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      BOOL v17 = "+[CDMSELFLogUtil cdmFailed:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM failed event, but the converted object is nil!", (uint8_t *)&v16, 0xCu);
    }
  }
  return v13;
}

+ (BOOL)cdmEnded:(id)a3 metadata:(id)a4 logMessage:(id)a5 machAbsoluteTime:(unint64_t)a6 dataDispatcherContext:(id)a7
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v11 = (void *)MEMORY[0x263F71F68];
  id v12 = a7;
  id v13 = a5;
  id v14 = [v11 createCDMRequestEndedLog:a3 metadata:a4];
  BOOL v15 = +[CDMSELFLogUtil emitEventsFromContainer:v14 mainEventLogMessage:v13 machAbsoluteTime:a6 dataDispatcherContext:v12];

  if (!v15)
  {
    int v16 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      BOOL v19 = "+[CDMSELFLogUtil cdmEnded:metadata:logMessage:machAbsoluteTime:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v16, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM ended (response) event, but the converted object is nil!", (uint8_t *)&v18, 0xCu);
    }
  }
  return v15;
}

+ (BOOL)cdmStarted:(id)a3 metadata:(id)a4 logMessage:(id)a5 machAbsoluteTime:(unint64_t)a6 currentServiceGraph:(int)a7 dataDispatcherContext:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a8;
  id v15 = a5;
  id v16 = a3;
  BOOL v17 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    __int16 v28 = [v13 nlId];
    __int16 v30 = [v28 toSafeNSUUID];
    long long v29 = [v13 resultCandidateId];
    uint64_t v27 = [v13 trpId];
    int v25 = [v27 toSafeNSUUID];
    id v26 = [v13 requestId];
    uint64_t v22 = [v26 toSafeNSUUID];
    BOOL v23 = [v13 subRequestId];
    [v23 toSafeNSUUID];
    *(_DWORD *)buf = 136316418;
    __int16 v32 = "+[CDMSELFLogUtil cdmStarted:metadata:logMessage:machAbsoluteTime:currentServiceGraph:dataDispatcherContext:]";
    __int16 v33 = 2112;
    __int16 v34 = v30;
    __int16 v35 = 2112;
    __int16 v36 = v29;
    __int16 v37 = 2112;
    uint64_t v38 = v25;
    __int16 v39 = 2112;
    v40 = v22;
    v42 = __int16 v41 = 2112;
    uint64_t v24 = (void *)v42;
    _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s SELF Metadata for CDMRequestStarted \n nlxMetadata.nlId: %@ \n nlxMetadata.rcId: %@ \n nlxMetadata.trpId: %@ \nnlxMetadata.requestId: %@ \n nlxMetadata.subRequestId: %@ \n ", buf, 0x3Eu);
  }
  int v18 = [MEMORY[0x263F71F68] createCDMRequestStartedLog:v16 metadata:v13 cdmServiceGraphName:v9];

  BOOL v19 = +[CDMSELFLogUtil emitEventsFromContainer:v18 mainEventLogMessage:v15 machAbsoluteTime:a6 dataDispatcherContext:v14];
  if (!v19)
  {
    uint64_t v20 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v32 = "+[CDMSELFLogUtil cdmStarted:metadata:logMessage:machAbsoluteTime:currentServiceGraph:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM started (request) event, but the converted object is nil!", buf, 0xCu);
    }
  }
  return v19;
}

+ (BOOL)emitRequestLink:(id)a3 metadata:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    id v16 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    int v25 = 136315138;
    id v26 = "+[CDMSELFLogUtil emitRequestLink:metadata:dataDispatcherContext:]";
    BOOL v17 = "%s [WARN]: SELF RequestLink was attemped to be emitted, but the received RequestLinkData was nil! RequestLink not emitted!";
LABEL_9:
    _os_log_impl(&dword_2263A0000, v16, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v25, 0xCu);
    goto LABEL_10;
  }
  id v10 = [v7 targetName];

  if (!v10)
  {
    id v16 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    int v25 = 136315138;
    id v26 = "+[CDMSELFLogUtil emitRequestLink:metadata:dataDispatcherContext:]";
    BOOL v17 = "%s [WARN]: SELF RequestLink was attempted to be emitted, but the target name was not set in the received Reque"
          "stLinkData! RequestLink not emitted!";
    goto LABEL_9;
  }
  id v11 = [v7 targetName];
  int v12 = [v11 isEqualToString:@"ORCHESTRATOR"];

  if (v12)
  {
    id v13 = [v7 targetUUID];
    id v14 = [v7 nlId];
    BOOL v15 = +[CDMSELFLogUtil orchestratorRequestLink:v13 nlId:v14 metadata:v8 logMessage:@"SELF emitting RequestLink message linking NLX and Orchestrator" dataDispatcherContext:v9];
LABEL_13:
    BOOL v18 = v15;

LABEL_14:
    goto LABEL_15;
  }
  BOOL v19 = [v7 targetName];
  int v20 = [v19 isEqualToString:@"CURARE"];

  if (v20)
  {
    unint64_t v21 = [v7 targetUUID];
    +[CDMSELFLogUtil emitCurareContext:v21 metadata:v8 dataDispatcherContext:v9];

    id v13 = [v7 targetUUID];
    id v14 = [v7 nlId];
    BOOL v15 = +[CDMSELFLogUtil curareRequestLink:v13 nlId:v14 metadata:v8 logMessage:@"SELF emitting RequestLink message linking NLX and Curare" dataDispatcherContext:v9];
    goto LABEL_13;
  }
  BOOL v23 = [v7 targetName];
  int v24 = [v23 isEqualToString:@"LIGHTHOUSE"];

  if (v24)
  {
    id v13 = [v7 targetUUID];
    BOOL v18 = +[CDMSELFLogUtil emitCurareContext:v13 metadata:v8 dataDispatcherContext:v9];
    goto LABEL_14;
  }
  id v16 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v25 = 136315138;
    id v26 = "+[CDMSELFLogUtil emitRequestLink:metadata:dataDispatcherContext:]";
    BOOL v17 = "%s [WARN]: SELF RequestLink was attempted to be emitted, but the requestId target was neither ORCHESTRATOR nor"
          " CURARE! RequestLink not emitted!";
    goto LABEL_9;
  }
LABEL_10:

  BOOL v18 = 0;
LABEL_15:

  return v18;
}

+ (BOOL)emitCurareContext:(id)a3 metadata:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a5;
  if (a3)
  {
    id v8 = [MEMORY[0x263F71F68] createNLXCurareContext:a3 metadata:a4];
    BOOL v9 = +[CDMSELFLogUtil emitEventsFromContainer:v8 mainEventLogMessage:@"SELF emitting CurareContext" dataDispatcherContext:v7];
  }
  else
  {
    id v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      id v13 = "+[CDMSELFLogUtil emitCurareContext:metadata:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v10, OS_LOG_TYPE_INFO, "%s [WARN]: SELF CurareContext - given curare ID was nil! Not emitting CurareContext log as it is meaningless.", (uint8_t *)&v12, 0xCu);
    }

    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)curareRequestLink:(id)a3 nlId:(id)a4 metadata:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v11)
  {
    id v16 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      uint64_t v22 = "+[CDMSELFLogUtil curareRequestLink:nlId:metadata:logMessage:dataDispatcherContext:]";
      BOOL v18 = "%s [WARN]: Tried to create a Curare RequestLink but received nil sourceId (Curare Id)!";
LABEL_9:
      _os_log_impl(&dword_2263A0000, v16, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v21, 0xCu);
    }
LABEL_13:
    BOOL v17 = 0;
    goto LABEL_14;
  }
  if (!v12)
  {
    id v16 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      uint64_t v22 = "+[CDMSELFLogUtil curareRequestLink:nlId:metadata:logMessage:dataDispatcherContext:]";
      BOOL v18 = "%s [WARN]: Tried to create a Curare RequestLink but had nil nluRequestId!";
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  id v16 = [MEMORY[0x263F71F68] createNLXRequestLinkWithTarget:16 andTargetId:v11 metadata:v13];
  if (!+[CDMSELFLogUtil emitNLXRequestLink:v16 logMessage:v14 dataDispatcherContext:v15])
  {
    BOOL v19 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      uint64_t v22 = "+[CDMSELFLogUtil curareRequestLink:nlId:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v19, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a Curare RequestLink, but there was an issue and could not emit!", (uint8_t *)&v21, 0xCu);
    }

    goto LABEL_13;
  }
  BOOL v17 = 1;
LABEL_14:

  return v17;
}

+ (BOOL)orchestratorRequestLink:(id)a3 nlId:(id)a4 metadata:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v11)
  {
    BOOL v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v22 = 136315138;
      uint64_t v23 = "+[CDMSELFLogUtil orchestratorRequestLink:nlId:metadata:logMessage:dataDispatcherContext:]";
      BOOL v19 = "%s [WARN]: Tried to create an orchestrator RequestLink but received nil sourceId (Orchestration Id)!";
LABEL_12:
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v22, 0xCu);
    }
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (!v12)
  {
    BOOL v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v22 = 136315138;
      uint64_t v23 = "+[CDMSELFLogUtil orchestratorRequestLink:nlId:metadata:logMessage:dataDispatcherContext:]";
      BOOL v19 = "%s [WARN]: Tried to create an orchestrator RequestLink but had nil nluRequestId!";
      goto LABEL_12;
    }
    goto LABEL_16;
  }
  if (AFDeviceSupportsSAE()) {
    uint64_t v16 = 43;
  }
  else {
    uint64_t v16 = 1;
  }
  BOOL v17 = [MEMORY[0x263F71F68] createNLXRequestLinkWithTarget:v16 andTargetId:v11 metadata:v13];
  if (!+[CDMSELFLogUtil emitNLXRequestLink:v17 logMessage:v14 dataDispatcherContext:v15])
  {
    int v20 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v22 = 136315138;
      uint64_t v23 = "+[CDMSELFLogUtil orchestratorRequestLink:nlId:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit an orchestrator RequestLink, but there was an issue and could not emit!", (uint8_t *)&v22, 0xCu);
    }

    goto LABEL_16;
  }
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

+ (BOOL)emitNLXRequestLink:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [MEMORY[0x263F6C810] sharedStream];
    [v8 emitMessage:v6];

    BOOL v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315394;
      id v12 = "+[CDMSELFLogUtil emitNLXRequestLink:logMessage:dataDispatcherContext:]";
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    BOOL v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      id v12 = "+[CDMSELFLogUtil emitNLXRequestLink:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a SELF RequestLink, but the given RequestLink was nil!", (uint8_t *)&v11, 0xCu);
    }
  }

  return v6 != 0;
}

+ (BOOL)emitEventsFromContainer:(id)a3 mainEventLogMessage:(id)a4 machAbsoluteTime:(unint64_t)a5 logLevel:(id)a6
{
  return +[CDMSELFLogUtil emitEventsFromContainer:a3 mainEventLogMessage:a4 machAbsoluteTime:a5 logLevel:a6 dataDispatcherContext:0];
}

+ (BOOL)emitEventsFromContainer:(id)a3 mainEventLogMessage:(id)a4 machAbsoluteTime:(unint64_t)a5 dataDispatcherContext:(id)a6
{
  return +[CDMSELFLogUtil emitEventsFromContainer:a3 mainEventLogMessage:a4 machAbsoluteTime:a5 logLevel:@"LOG_DEBUG" dataDispatcherContext:a6];
}

+ (BOOL)emitEventsFromContainer:(id)a3 mainEventLogMessage:(id)a4
{
  return +[CDMSELFLogUtil emitEventsFromContainer:a3 mainEventLogMessage:a4 machAbsoluteTime:0 logLevel:@"LOG_DEBUG"];
}

+ (id)createSELFMetadataWithRequestId:(id)a3
{
  id v3 = [MEMORY[0x263F71F68] extractRequestLinkData:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 nlId];
    id v6 = [v4 trpId];
    id v7 = [v4 targetUUID];
    id v8 = [v4 resultCandidateId];
    BOOL v9 = [v4 targetName];
    id v10 = +[CDMSELFLogUtil createSELFMetadataWithNlId:v5 andWithTrpId:v6 andWithRequestId:v7 andWithResultCandidateId:v8 andWithConnectionId:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)createSELFMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithRequestId:(id)a5 andWithResultCandidateId:(id)a6 andWithConnectionId:(id)a7
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = v15;
  int v28 = 0;
  if (v15)
  {
    if ([v15 isEqualToString:@"ORCHESTRATOR"])
    {
      int v17 = 1;
    }
    else if ([v16 isEqualToString:@"CURARE"])
    {
      int v17 = 2;
    }
    else if ([v16 isEqualToString:@"LIGHTHOUSE"])
    {
      int v17 = 3;
    }
    else
    {
      if (![v16 isEqualToString:@"SPOTLIGHT"]) {
        goto LABEL_11;
      }
      int v17 = 5;
    }
    int v28 = v17;
  }
LABEL_11:
  BOOL v18 = [MEMORY[0x263F71F48] convertFromUUID:v13];
  int v19 = AFDeviceSupportsSAE();
  int v20 = CDMOSLoggerForCategory(0);
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v21)
    {
      *(_DWORD *)buf = 136315138;
      __int16 v30 = "+[CDMSELFLogUtil createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:]";
      _os_log_debug_impl(&dword_2263A0000, v20, OS_LOG_TYPE_DEBUG, "%s Device supports AssistantEngine flow, use incoming requestId as subRequestId for NLX", buf, 0xCu);
    }
    int v22 = 0;
    uint64_t v23 = v18;
  }
  else
  {
    if (v21)
    {
      *(_DWORD *)buf = 136315138;
      __int16 v30 = "+[CDMSELFLogUtil createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:]";
      _os_log_debug_impl(&dword_2263A0000, v20, OS_LOG_TYPE_DEBUG, "%s Device does NOT support AssistantEngine flow, use incoming requestId as is for NLX", buf, 0xCu);
    }
    uint64_t v23 = 0;
    int v22 = v18;
  }

  uint64_t v24 = (void *)MEMORY[0x263F71F68];
  id v25 = v18;
  id v26 = [v24 createNLXClientEventMetadataWithNlId:v11 andWithTrpId:v12 andWithRequestId:v22 andWithSubRequestId:v23 andWithResultCandidateId:v14 andWithRequester:&v28];

  return v26;
}

@end