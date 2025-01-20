@interface ADSiriAnalyticsGlobalDimensionMessageResolver
- (ADSiriAnalyticsGlobalDimensionMessageResolver)initWithQueue:(id)a3;
- (BOOL)handlesMessage:(id)a3;
- (id)_resolveDeviceFixedContext:(id)a3;
- (id)_resolveSiriAccountInformation:(id)a3;
- (void)resolveMessage:(id)a3 completion:(id)a4;
@end

@implementation ADSiriAnalyticsGlobalDimensionMessageResolver

- (void).cxx_destruct
{
}

- (id)_resolveSiriAccountInformation:(id)a3
{
  id v3 = a3;
  v4 = +[AFPreferences sharedPreferences];
  unsigned __int8 v5 = [v4 longLivedIdentifierUploadingEnabled];

  if (v5)
  {
    v6 = +[ADAccount activeAccount];
    v7 = (void *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      v9 = [v6 assistantIdentifier];
      int v17 = 136315394;
      v18 = "-[ADSiriAnalyticsGlobalDimensionMessageResolver _resolveSiriAccountInformation:]";
      __int16 v19 = 2112;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s #RPI: resolving DIMSchemaDIMSiriAccountInformation assistantIdentifier=%@", (uint8_t *)&v17, 0x16u);
    }
    v10 = [v6 assistantIdentifier];
    [v3 setSiriDeviceId:v10];

    v11 = +[ADPreferences sharedPreferences];
    v12 = [v11 sharedUserIdentifier];
    [v3 setSiriUserId:v12];

    v13 = [v6 speechIdentifier];
    [v3 setSiriSpeechId:v13];

    id v14 = v3;
  }
  else
  {
    v15 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315138;
      v18 = "-[ADSiriAnalyticsGlobalDimensionMessageResolver _resolveSiriAccountInformation:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s #RPI: resolving nil DIMSchemaDIMSiriAccountInformation", (uint8_t *)&v17, 0xCu);
    }
    id v14 = 0;
  }

  return v14;
}

- (id)_resolveDeviceFixedContext:(id)a3
{
  id v3 = a3;
  v4 = +[ADPreferences sharedPreferences];
  unsigned __int8 v5 = +[NSLocale currentLocale];
  v6 = v5;
  v52 = v5;
  if (v5)
  {
    v7 = [v5 countryCode];
    [v6 languageCode];
    if (v7) {
      v8 = {;
    }
      v9 = [v6 countryCode];
      v10 = +[NSString stringWithFormat:@"%@-%@", v8, v9];
    }
    else {
      v10 = {;
    }
    }

    if (v10) {
      objc_msgSend(v3, "setSystemLocale:", +[SIUtilities convertLanguageCodeToSchemaLocale:](SIUtilities, "convertLanguageCodeToSchemaLocale:", v10));
    }

    v6 = v52;
  }
  uint64_t v11 = [v4 languageCode];
  v51 = (void *)v11;
  if (v11) {
    id v12 = +[SIUtilities convertLanguageCodeToSchemaLocale:v11];
  }
  else {
    id v12 = 0;
  }
  [v3 setSiriInputLocale:v12];
  id v13 = objc_alloc_init((Class)SISchemaVoiceSettings);
  [v13 setVoiceGender:0];
  id v14 = [v4 outputVoice];
  id v15 = [v14 gender];

  if (v15 == (id)2)
  {
    uint64_t v16 = 1;
  }
  else
  {
    int v17 = [v4 outputVoice];
    id v18 = [v17 gender];

    if (v18 == (id)1)
    {
      uint64_t v16 = 2;
    }
    else
    {
      __int16 v19 = [v4 outputVoice];
      id v20 = [v19 gender];

      if (v20 != (id)3) {
        goto LABEL_18;
      }
      uint64_t v16 = 3;
    }
  }
  [v13 setVoiceGender:v16];
LABEL_18:
  v21 = [v4 outputVoice];
  uint64_t v22 = [v21 languageCode];

  if (v22) {
    objc_msgSend(v13, "setVoiceAccent:", +[SIUtilities convertLanguageCodeToSchemaLocale:](SIUtilities, "convertLanguageCodeToSchemaLocale:", v22));
  }
  v49 = (void *)v22;
  v23 = [v4 outputVoice];
  v24 = [v23 name];
  [v13 setVoiceName:v24];

  [v3 setSiriVoiceSettings:v13];
  v25 = (char *)[v4 siriDataSharingOptInStatus] - 1;
  if ((unint64_t)v25 < 3) {
    uint64_t v26 = (v25 + 1);
  }
  else {
    uint64_t v26 = 0;
  }
  [v3 setDataSharingOptInState:v26];
  id v27 = [v4 searchQueriesDataSharingStatus];
  if (v27 == (id)1) {
    uint64_t v28 = 1;
  }
  else {
    uint64_t v28 = 2 * (v27 == (id)2);
  }
  [v3 setSearchDataOptOutState:v28];
  id v29 = objc_alloc_init((Class)NSDateFormatter);
  [v29 setDateFormat:@"ZZZZZ"];
  v30 = +[NSTimeZone localTimeZone];
  [v29 setTimeZone:v30];

  v31 = +[NSDate date];
  uint64_t v32 = [v29 stringFromDate:v31];

  v48 = (void *)v32;
  [v3 setTimezoneOffset:v32];
  v33 = AFBuildVersion();
  [v3 setSystemBuild:v33];

  v34 = AFProductTypeForInstrumentation();
  [v3 setDeviceType:v34];

  v35 = [v4 countryCode];
  if (v35) {
    objc_msgSend(v3, "setCountryCode:", +[SIUtilities convertCountryCodeToSchemaCountryCode:](SIUtilities, "convertCountryCodeToSchemaCountryCode:", v35));
  }
  v36 = +[ADHomeInfoManager sharedInfoManager];
  if ([v36 hasOptedInHH2]) {
    uint64_t v37 = 2;
  }
  else {
    uint64_t v37 = 1;
  }
  [v3 setHomeKitConfiguration:v37];

  if (qword_100585E40 != -1) {
    dispatch_once(&qword_100585E40, &stru_1005069F0);
  }
  v50 = v13;
  [v3 setIsStoreDemoMode:byte_100585E39];
  if (([v3 hasTimeIntervalSince1970] & 1) == 0)
  {
    v38 = +[NSDate date];
    [v38 timeIntervalSince1970];
    objc_msgSend(v3, "setTimeIntervalSince1970:");
  }
  v39 = [v4 productTypePrefix];
  [v3 setDataCollectionId:v39];

  v40 = [v6 languageCode];
  [v3 setEffectiveSystemLanguage:v40];
  v41 = +[NSLocale preferredLanguages];
  [v3 setPreferredLanguages:v41];
  id v42 = objc_alloc_init((Class)DIMSchemaEntitySyncSettings);
  v43 = +[AFPreferences sharedPreferences];
  objc_msgSend(v42, "setIsMediaEntitySyncEnabled:", objc_msgSend(v43, "isMediaEntitySyncDisabled") ^ 1);

  [v3 setEntitySyncSettings:v42];
  id v44 = objc_alloc_init((Class)DIMSchemaDIMDataSharingSettings);
  [v44 setIsAppAnalyticsEnabled:sub_1001FD788()];
  [v44 setIsDiagnosticsAndUsageEnabled:AFDiagnosticsSubmissionAllowed()];
  [v3 setDataSharingSettings:v44];
  v45 = +[AFPreferences sharedPreferences];
  v46 = [v45 activeDictationLanguages];

  if (v46) {
    objc_msgSend(v3, "setAvailableDictationKeyboards:", objc_msgSend(v46, "count"));
  }

  return v3;
}

- (void)resolveMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, BOOL))a4;
  v8 = [v6 deviceFixedContext];
  BOOL v9 = v8 != 0;

  if (v8)
  {
    v10 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315394;
      id v20 = "-[ADSiriAnalyticsGlobalDimensionMessageResolver resolveMessage:completion:]";
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Resolving deviceFixedContext for message: %@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v11 = [v6 deviceFixedContext];
    id v12 = [(ADSiriAnalyticsGlobalDimensionMessageResolver *)self _resolveDeviceFixedContext:v11];
    [v6 setDeviceFixedContext:v12];
  }
  id v13 = [v6 siriAccountInformation];

  if (v13)
  {
    id v14 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315394;
      id v20 = "-[ADSiriAnalyticsGlobalDimensionMessageResolver resolveMessage:completion:]";
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Resolving siriAccountInformation for message: %@", (uint8_t *)&v19, 0x16u);
    }
    id v15 = [v6 siriAccountInformation];
    uint64_t v16 = [(ADSiriAnalyticsGlobalDimensionMessageResolver *)self _resolveSiriAccountInformation:v15];
    [v6 setSiriAccountInformation:v16];

    int v17 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315394;
      id v20 = "-[ADSiriAnalyticsGlobalDimensionMessageResolver resolveMessage:completion:]";
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Firing off DIM logging for message: %@", (uint8_t *)&v19, 0x16u);
    }
    id v18 = +[ADAnalyticsIdentifiersProvider sharedInstance];
    [v18 asyncLogAnalyticsIdentifiersDIMEvents];

    BOOL v9 = 1;
  }
  v7[2](v7, v6, v9);
}

- (BOOL)handlesMessage:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  id v4 = v3;
  unsigned __int8 v5 = [v4 deviceFixedContext];
  if (!v5)
  {
    id v6 = [v4 siriAccountInformation];

    if (v6) {
      goto LABEL_5;
    }

LABEL_9:
    BOOL v8 = 0;
    goto LABEL_10;
  }

LABEL_5:
  v7 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[ADSiriAnalyticsGlobalDimensionMessageResolver handlesMessage:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Handling message: %@", (uint8_t *)&v10, 0x16u);
  }

  BOOL v8 = 1;
LABEL_10:

  return v8;
}

- (ADSiriAnalyticsGlobalDimensionMessageResolver)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADSiriAnalyticsGlobalDimensionMessageResolver;
  id v6 = [(ADSiriAnalyticsGlobalDimensionMessageResolver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

@end