@interface ADGeneralProperties
- (ADGeneralProperties)initWithQueue:(id)a3;
- (BOOL)_getIsStoreDemoMode;
- (id)_getSystemLocale;
- (int)_getUTCOffset;
- (void)_getStoreFrontIdWithCompletion:(id)a3;
- (void)getODDGeneralPropertiesWithCompletion:(id)a3;
@end

@implementation ADGeneralProperties

- (void).cxx_destruct
{
}

- (BOOL)_getIsStoreDemoMode
{
  if (qword_100585E40 != -1) {
    dispatch_once(&qword_100585E40, &stru_1005069F0);
  }
  return byte_100585E39;
}

- (int)_getUTCOffset
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  [v2 setDateFormat:@"ZZZZZ"];
  v3 = +[NSTimeZone localTimeZone];
  [v2 setTimeZone:v3];

  v4 = +[NSDate date];
  v5 = [v2 stringFromDate:v4];

  LODWORD(v4) = +[ADGeneralPropertiesUtils SISchemaUTCOffsetFromTimeZoneOffset:v5];
  return (int)v4;
}

- (void)_getStoreFrontIdWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADGeneralProperties _getStoreFrontIdWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Retrieving", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10011F604;
  v26 = sub_10011F614;
  id v27 = 0;
  id v6 = objc_alloc((Class)AFOneArgumentSafetyBlock);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10011F61C;
  v20[3] = &unk_1005029F0;
  v20[4] = self;
  p_long long buf = &buf;
  id v7 = v4;
  id v21 = v7;
  id v8 = [v6 initWithBlock:v20];
  v9 = +[ADAssistantDataManager sharedDataManager];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10011F6E4;
  v18[3] = &unk_100509F60;
  id v10 = v8;
  id v19 = v10;
  [v9 getiTunesStoreFrontIdentifierWithCompletion:v18];

  id v11 = objc_alloc((Class)AFWatchdogTimer);
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10011F6F0;
  v16[3] = &unk_10050E138;
  id v13 = v10;
  id v17 = v13;
  id v14 = [v11 initWithTimeoutInterval:queue onQueue:v16 timeoutHandler:3.0];
  v15 = *(void **)(*((void *)&buf + 1) + 40);
  *(void *)(*((void *)&buf + 1) + 40) = v14;

  [*(id *)(*((void *)&buf + 1) + 40) start];
  _Block_object_dispose(&buf, 8);
}

- (id)_getSystemLocale
{
  id v2 = +[NSLocale currentLocale];
  v3 = [v2 objectForKey:NSLocaleIdentifier];

  id v4 = [v3 uppercaseString];
  v5 = [v4 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

  id v6 = +[NSString stringWithFormat:@"LOCALE_%@", v5];
  if ([v6 isEqualToString:@"LOCALE_UNKNOWN_LOCALE"])
  {
    uint64_t v7 = 0;
  }
  else if ([v6 isEqualToString:@"LOCALE_AR_AE"])
  {
    uint64_t v7 = 1;
  }
  else if ([v6 isEqualToString:@"LOCALE_AR_SA"])
  {
    uint64_t v7 = 2;
  }
  else if ([v6 isEqualToString:@"LOCALE_CA_ES"])
  {
    uint64_t v7 = 3;
  }
  else if ([v6 isEqualToString:@"LOCALE_CS_CZ"])
  {
    uint64_t v7 = 4;
  }
  else if ([v6 isEqualToString:@"LOCALE_DA_DK"])
  {
    uint64_t v7 = 5;
  }
  else if ([v6 isEqualToString:@"LOCALE_DE_AT"])
  {
    uint64_t v7 = 6;
  }
  else if ([v6 isEqualToString:@"LOCALE_DE_CH"])
  {
    uint64_t v7 = 7;
  }
  else if ([v6 isEqualToString:@"LOCALE_DE_DE"])
  {
    uint64_t v7 = 8;
  }
  else if ([v6 isEqualToString:@"LOCALE_EL_GR"])
  {
    uint64_t v7 = 9;
  }
  else if ([v6 isEqualToString:@"LOCALE_EN_AE"])
  {
    uint64_t v7 = 10;
  }
  else if ([v6 isEqualToString:@"LOCALE_EN_AU"])
  {
    uint64_t v7 = 11;
  }
  else if ([v6 isEqualToString:@"LOCALE_EN_CA"])
  {
    uint64_t v7 = 12;
  }
  else if ([v6 isEqualToString:@"LOCALE_EN_GB"])
  {
    uint64_t v7 = 13;
  }
  else if ([v6 isEqualToString:@"LOCALE_EN_ID"])
  {
    uint64_t v7 = 14;
  }
  else if ([v6 isEqualToString:@"LOCALE_EN_IE"])
  {
    uint64_t v7 = 15;
  }
  else if ([v6 isEqualToString:@"LOCALE_EN_IN"])
  {
    uint64_t v7 = 16;
  }
  else if ([v6 isEqualToString:@"LOCALE_EN_MY"])
  {
    uint64_t v7 = 17;
  }
  else if ([v6 isEqualToString:@"LOCALE_EN_NZ"])
  {
    uint64_t v7 = 18;
  }
  else if ([v6 isEqualToString:@"LOCALE_EN_PH"])
  {
    uint64_t v7 = 19;
  }
  else if ([v6 isEqualToString:@"LOCALE_EN_SG"])
  {
    uint64_t v7 = 20;
  }
  else if ([v6 isEqualToString:@"LOCALE_EN_SA"])
  {
    uint64_t v7 = 21;
  }
  else if ([v6 isEqualToString:@"LOCALE_EN_US"])
  {
    uint64_t v7 = 22;
  }
  else if ([v6 isEqualToString:@"LOCALE_EN_ZA"])
  {
    uint64_t v7 = 23;
  }
  else if ([v6 isEqualToString:@"LOCALE_ES_CL"])
  {
    uint64_t v7 = 24;
  }
  else if ([v6 isEqualToString:@"LOCALE_ES_CO"])
  {
    uint64_t v7 = 25;
  }
  else if ([v6 isEqualToString:@"LOCALE_ES_ES"])
  {
    uint64_t v7 = 26;
  }
  else if ([v6 isEqualToString:@"LOCALE_ES_MX"])
  {
    uint64_t v7 = 27;
  }
  else if ([v6 isEqualToString:@"LOCALE_ES_US"])
  {
    uint64_t v7 = 28;
  }
  else if ([v6 isEqualToString:@"LOCALE_FI_FI"])
  {
    uint64_t v7 = 29;
  }
  else if ([v6 isEqualToString:@"LOCALE_FR_BE"])
  {
    uint64_t v7 = 30;
  }
  else if ([v6 isEqualToString:@"LOCALE_FR_CA"])
  {
    uint64_t v7 = 31;
  }
  else if ([v6 isEqualToString:@"LOCALE_FR_CH"])
  {
    uint64_t v7 = 32;
  }
  else if ([v6 isEqualToString:@"LOCALE_FR_FR"])
  {
    uint64_t v7 = 33;
  }
  else if ([v6 isEqualToString:@"LOCALE_HE_IL"])
  {
    uint64_t v7 = 34;
  }
  else if ([v6 isEqualToString:@"LOCALE_HI_IN"])
  {
    uint64_t v7 = 35;
  }
  else if ([v6 isEqualToString:@"LOCALE_HR_HR"])
  {
    uint64_t v7 = 36;
  }
  else if ([v6 isEqualToString:@"LOCALE_HU_HU"])
  {
    uint64_t v7 = 37;
  }
  else if ([v6 isEqualToString:@"LOCALE_ID_ID"])
  {
    uint64_t v7 = 38;
  }
  else if ([v6 isEqualToString:@"LOCALE_IT_CH"])
  {
    uint64_t v7 = 39;
  }
  else if ([v6 isEqualToString:@"LOCALE_IT_IT"])
  {
    uint64_t v7 = 40;
  }
  else if ([v6 isEqualToString:@"LOCALE_JA_JP"])
  {
    uint64_t v7 = 41;
  }
  else if ([v6 isEqualToString:@"LOCALE_KO_KR"])
  {
    uint64_t v7 = 42;
  }
  else if ([v6 isEqualToString:@"LOCALE_MS_MY"])
  {
    uint64_t v7 = 43;
  }
  else if ([v6 isEqualToString:@"LOCALE_NB_NO"])
  {
    uint64_t v7 = 44;
  }
  else if ([v6 isEqualToString:@"LOCALE_NL_BE"])
  {
    uint64_t v7 = 45;
  }
  else if ([v6 isEqualToString:@"LOCALE_NL_NL"])
  {
    uint64_t v7 = 46;
  }
  else if ([v6 isEqualToString:@"LOCALE_PL_PL"])
  {
    uint64_t v7 = 47;
  }
  else if ([v6 isEqualToString:@"LOCALE_PT_BR"])
  {
    uint64_t v7 = 48;
  }
  else if ([v6 isEqualToString:@"LOCALE_PT_PT"])
  {
    uint64_t v7 = 49;
  }
  else if ([v6 isEqualToString:@"LOCALE_RO_RO"])
  {
    uint64_t v7 = 50;
  }
  else if ([v6 isEqualToString:@"LOCALE_RU_RU"])
  {
    uint64_t v7 = 51;
  }
  else if ([v6 isEqualToString:@"LOCALE_SK_SK"])
  {
    uint64_t v7 = 52;
  }
  else if ([v6 isEqualToString:@"LOCALE_SV_SE"])
  {
    uint64_t v7 = 53;
  }
  else if ([v6 isEqualToString:@"LOCALE_TH_TH"])
  {
    uint64_t v7 = 54;
  }
  else if ([v6 isEqualToString:@"LOCALE_TR_TR"])
  {
    uint64_t v7 = 55;
  }
  else if ([v6 isEqualToString:@"LOCALE_UK_UA"])
  {
    uint64_t v7 = 56;
  }
  else if ([v6 isEqualToString:@"LOCALE_VI_VN"])
  {
    uint64_t v7 = 57;
  }
  else if ([v6 isEqualToString:@"LOCALE_WUU_CN"])
  {
    uint64_t v7 = 58;
  }
  else if ([v6 isEqualToString:@"LOCALE_YUE_CN"])
  {
    uint64_t v7 = 59;
  }
  else if ([v6 isEqualToString:@"LOCALE_ZH_CN"])
  {
    uint64_t v7 = 60;
  }
  else if ([v6 isEqualToString:@"LOCALE_ZH_HK"])
  {
    uint64_t v7 = 61;
  }
  else if ([v6 isEqualToString:@"LOCALE_ZH_TW"])
  {
    uint64_t v7 = 62;
  }
  else
  {
    uint64_t v7 = 0;
  }

  id v8 = +[ADAssistantPropertiesUtils SISchemaLocaleToSISchemaISOLocale:v7];

  return v8;
}

- (void)getODDGeneralPropertiesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    id v17 = "-[ADGeneralProperties getODDGeneralPropertiesWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  id v6 = objc_alloc_init((Class)ODDSiriSchemaODDGeneralProperties);
  uint64_t v7 = [(ADGeneralProperties *)self _getSystemLocale];
  [v6 setSystemLocale:v7];

  objc_msgSend(v6, "setUTCOffset:", -[ADGeneralProperties _getUTCOffset](self, "_getUTCOffset"));
  id v8 = [(ADGeneralProperties *)self _getDeviceType];
  [v6 setDeviceType:v8];

  v9 = [(ADGeneralProperties *)self _getModelNumber];
  [v6 setModelNumber:v9];

  id v10 = [(ADGeneralProperties *)self _getDeviceOS];
  [v6 setDeviceOS:v10];

  objc_msgSend(v6, "setIsStoreDemoMode:", -[ADGeneralProperties _getIsStoreDemoMode](self, "_getIsStoreDemoMode"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100120298;
  v13[3] = &unk_1005029C8;
  id v14 = v6;
  id v15 = v4;
  id v11 = v4;
  id v12 = v6;
  [(ADGeneralProperties *)self _getStoreFrontIdWithCompletion:v13];
}

- (ADGeneralProperties)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADGeneralProperties;
  id v6 = [(ADGeneralProperties *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

@end