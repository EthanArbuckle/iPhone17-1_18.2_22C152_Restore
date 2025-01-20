@interface ADAssetManager
+ (ADAssetManager)sharedInstance;
- (ADAssetManager)init;
- (ADAssetManager)initWithLanguageCode:(id)a3 speechAssetManager:(id)a4 cdmClient:(id)a5 morphunAssetManager:(id)a6 supportsSiriUoD:(BOOL)a7 supportsSiriHybridUoD:(BOOL)a8;
- (BOOL)_shouldLogAssetsPreparedEvent;
- (id)_fetchAssetStatusForLanguage:(id)a3;
- (id)assetsAvailableStatusForLanguage:(id)a3;
- (void)_checkAssetsStatusForIntervalRecording;
- (void)_emitUODAssetPreparedEventWithLanguage:(id)a3 elapsed:(unsigned int)a4;
- (void)_recordAssetsNeededForLanguage:(id)a3 resetPrevious:(BOOL)a4;
- (void)_registerAssetStatusTrackers;
- (void)_registerCDMStatusTracker;
- (void)_subscribeToMorphunAssetStatusForLanguage:(id)a3;
- (void)addAvailabilityObserver:(id)a3;
- (void)assetStatus:(id)a3;
- (void)assetsAvailableForLocale:(id)a3 withType:(int64_t)a4;
- (void)assetsUnavailableWithType:(int64_t)a3;
- (void)attentionAssetStatus:(id)a3;
- (void)dumpAssistantStateChunk:(id)a3;
- (void)fetchAssetsAvailabilityForLanguage:(id)a3 completion:(id)a4;
- (void)languageCodeWasChangedTo:(id)a3;
- (void)notifyObserversAssetAvailabilityChanged;
- (void)notifyObserversLanguageCodeChanged:(id)a3;
- (void)removeAvailabilityObserver:(id)a3;
@end

@implementation ADAssetManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityObservers, 0);
  objc_storeStrong((id *)&self->_morphunAssetsManager, 0);
  objc_storeStrong((id *)&self->_cdmClient, 0);
  objc_storeStrong(&self->_attentionAssetManager, 0);
  objc_storeStrong((id *)&self->_attentionAssetStatus, 0);
  objc_storeStrong((id *)&self->_nlRouterAssetStatus, 0);
  objc_storeStrong((id *)&self->_nlAssetStatus, 0);
  objc_storeStrong((id *)&self->_speechAssetManager, 0);
  objc_storeStrong((id *)&self->_speechAssetTasksForLocale, 0);
  objc_storeStrong((id *)&self->_speechAssetStatusForLocale, 0);
  objc_storeStrong((id *)&self->_assetFetchIntervalBeginDates, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentLanguageCode, 0);
}

- (void)dumpAssistantStateChunk:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10022C228;
  v9[3] = &unk_10050D080;
  id v10 = a3;
  id v4 = v10;
  v5 = objc_retainBlock(v9);
  id v6 = objc_alloc((Class)NSMutableDictionary);
  v7 = [(ADAssetManager *)self assetsAvailableStatusForLanguage:self->_currentLanguageCode];
  id v8 = [v6 initWithDictionary:v7 copyItems:1];

  [v8 setValue:self->_currentLanguageCode forKey:@"LANGUAGE"];
  ((void (*)(void *, id))v5[2])(v5, v8);
}

- (void)_emitUODAssetPreparedEventWithLanguage:(id)a3 elapsed:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = objc_alloc_init((Class)SADSchemaSADUODAssetsPrepared);
  v7 = [v5 uppercaseString];

  id v8 = [v7 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

  v9 = +[NSString stringWithFormat:@"LOCALE_%@", v8];

  id v10 = v9;
  if ([v10 isEqualToString:@"LOCALE_UNKNOWN_LOCALE"])
  {
    uint64_t v11 = 0;
  }
  else if ([v10 isEqualToString:@"LOCALE_AR_AE"])
  {
    uint64_t v11 = 1;
  }
  else if ([v10 isEqualToString:@"LOCALE_AR_SA"])
  {
    uint64_t v11 = 2;
  }
  else if ([v10 isEqualToString:@"LOCALE_CA_ES"])
  {
    uint64_t v11 = 3;
  }
  else if ([v10 isEqualToString:@"LOCALE_CS_CZ"])
  {
    uint64_t v11 = 4;
  }
  else if ([v10 isEqualToString:@"LOCALE_DA_DK"])
  {
    uint64_t v11 = 5;
  }
  else if ([v10 isEqualToString:@"LOCALE_DE_AT"])
  {
    uint64_t v11 = 6;
  }
  else if ([v10 isEqualToString:@"LOCALE_DE_CH"])
  {
    uint64_t v11 = 7;
  }
  else if ([v10 isEqualToString:@"LOCALE_DE_DE"])
  {
    uint64_t v11 = 8;
  }
  else if ([v10 isEqualToString:@"LOCALE_EL_GR"])
  {
    uint64_t v11 = 9;
  }
  else if ([v10 isEqualToString:@"LOCALE_EN_AE"])
  {
    uint64_t v11 = 10;
  }
  else if ([v10 isEqualToString:@"LOCALE_EN_AU"])
  {
    uint64_t v11 = 11;
  }
  else if ([v10 isEqualToString:@"LOCALE_EN_CA"])
  {
    uint64_t v11 = 12;
  }
  else if ([v10 isEqualToString:@"LOCALE_EN_GB"])
  {
    uint64_t v11 = 13;
  }
  else if ([v10 isEqualToString:@"LOCALE_EN_ID"])
  {
    uint64_t v11 = 14;
  }
  else if ([v10 isEqualToString:@"LOCALE_EN_IE"])
  {
    uint64_t v11 = 15;
  }
  else if ([v10 isEqualToString:@"LOCALE_EN_IN"])
  {
    uint64_t v11 = 16;
  }
  else if ([v10 isEqualToString:@"LOCALE_EN_MY"])
  {
    uint64_t v11 = 17;
  }
  else if ([v10 isEqualToString:@"LOCALE_EN_NZ"])
  {
    uint64_t v11 = 18;
  }
  else if ([v10 isEqualToString:@"LOCALE_EN_PH"])
  {
    uint64_t v11 = 19;
  }
  else if ([v10 isEqualToString:@"LOCALE_EN_SG"])
  {
    uint64_t v11 = 20;
  }
  else if ([v10 isEqualToString:@"LOCALE_EN_SA"])
  {
    uint64_t v11 = 21;
  }
  else if ([v10 isEqualToString:@"LOCALE_EN_US"])
  {
    uint64_t v11 = 22;
  }
  else if ([v10 isEqualToString:@"LOCALE_EN_ZA"])
  {
    uint64_t v11 = 23;
  }
  else if ([v10 isEqualToString:@"LOCALE_ES_CL"])
  {
    uint64_t v11 = 24;
  }
  else if ([v10 isEqualToString:@"LOCALE_ES_CO"])
  {
    uint64_t v11 = 25;
  }
  else if ([v10 isEqualToString:@"LOCALE_ES_ES"])
  {
    uint64_t v11 = 26;
  }
  else if ([v10 isEqualToString:@"LOCALE_ES_MX"])
  {
    uint64_t v11 = 27;
  }
  else if ([v10 isEqualToString:@"LOCALE_ES_US"])
  {
    uint64_t v11 = 28;
  }
  else if ([v10 isEqualToString:@"LOCALE_FI_FI"])
  {
    uint64_t v11 = 29;
  }
  else if ([v10 isEqualToString:@"LOCALE_FR_BE"])
  {
    uint64_t v11 = 30;
  }
  else if ([v10 isEqualToString:@"LOCALE_FR_CA"])
  {
    uint64_t v11 = 31;
  }
  else if ([v10 isEqualToString:@"LOCALE_FR_CH"])
  {
    uint64_t v11 = 32;
  }
  else if ([v10 isEqualToString:@"LOCALE_FR_FR"])
  {
    uint64_t v11 = 33;
  }
  else if ([v10 isEqualToString:@"LOCALE_HE_IL"])
  {
    uint64_t v11 = 34;
  }
  else if ([v10 isEqualToString:@"LOCALE_HI_IN"])
  {
    uint64_t v11 = 35;
  }
  else if ([v10 isEqualToString:@"LOCALE_HR_HR"])
  {
    uint64_t v11 = 36;
  }
  else if ([v10 isEqualToString:@"LOCALE_HU_HU"])
  {
    uint64_t v11 = 37;
  }
  else if ([v10 isEqualToString:@"LOCALE_ID_ID"])
  {
    uint64_t v11 = 38;
  }
  else if ([v10 isEqualToString:@"LOCALE_IT_CH"])
  {
    uint64_t v11 = 39;
  }
  else if ([v10 isEqualToString:@"LOCALE_IT_IT"])
  {
    uint64_t v11 = 40;
  }
  else if ([v10 isEqualToString:@"LOCALE_JA_JP"])
  {
    uint64_t v11 = 41;
  }
  else if ([v10 isEqualToString:@"LOCALE_KO_KR"])
  {
    uint64_t v11 = 42;
  }
  else if ([v10 isEqualToString:@"LOCALE_MS_MY"])
  {
    uint64_t v11 = 43;
  }
  else if ([v10 isEqualToString:@"LOCALE_NB_NO"])
  {
    uint64_t v11 = 44;
  }
  else if ([v10 isEqualToString:@"LOCALE_NL_BE"])
  {
    uint64_t v11 = 45;
  }
  else if ([v10 isEqualToString:@"LOCALE_NL_NL"])
  {
    uint64_t v11 = 46;
  }
  else if ([v10 isEqualToString:@"LOCALE_PL_PL"])
  {
    uint64_t v11 = 47;
  }
  else if ([v10 isEqualToString:@"LOCALE_PT_BR"])
  {
    uint64_t v11 = 48;
  }
  else if ([v10 isEqualToString:@"LOCALE_PT_PT"])
  {
    uint64_t v11 = 49;
  }
  else if ([v10 isEqualToString:@"LOCALE_RO_RO"])
  {
    uint64_t v11 = 50;
  }
  else if ([v10 isEqualToString:@"LOCALE_RU_RU"])
  {
    uint64_t v11 = 51;
  }
  else if ([v10 isEqualToString:@"LOCALE_SK_SK"])
  {
    uint64_t v11 = 52;
  }
  else if ([v10 isEqualToString:@"LOCALE_SV_SE"])
  {
    uint64_t v11 = 53;
  }
  else if ([v10 isEqualToString:@"LOCALE_TH_TH"])
  {
    uint64_t v11 = 54;
  }
  else if ([v10 isEqualToString:@"LOCALE_TR_TR"])
  {
    uint64_t v11 = 55;
  }
  else if ([v10 isEqualToString:@"LOCALE_UK_UA"])
  {
    uint64_t v11 = 56;
  }
  else if ([v10 isEqualToString:@"LOCALE_VI_VN"])
  {
    uint64_t v11 = 57;
  }
  else if ([v10 isEqualToString:@"LOCALE_WUU_CN"])
  {
    uint64_t v11 = 58;
  }
  else if ([v10 isEqualToString:@"LOCALE_YUE_CN"])
  {
    uint64_t v11 = 59;
  }
  else if ([v10 isEqualToString:@"LOCALE_ZH_CN"])
  {
    uint64_t v11 = 60;
  }
  else if ([v10 isEqualToString:@"LOCALE_ZH_HK"])
  {
    uint64_t v11 = 61;
  }
  else if ([v10 isEqualToString:@"LOCALE_ZH_TW"])
  {
    uint64_t v11 = 62;
  }
  else
  {
    uint64_t v11 = 0;
  }

  [v6 setLocale:v11];
  [v6 setElapsedSeconds:v4];
  id v12 = objc_alloc_init((Class)SADSchemaSADClientEvent);
  [v12 setUodAssetsPrepared:v6];
  v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[ADAssetManager _emitUODAssetPreparedEventWithLanguage:elapsed:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Emitting asset prepared event", buf, 0xCu);
  }
  v14 = +[AssistantSiriAnalytics sharedStream];
  [v14 emitMessage:v12];
}

- (void)_checkAssetsStatusForIntervalRecording
{
  if ([(ADAssetManager *)self _shouldLogAssetsPreparedEvent])
  {
    currentLanguageCode = self->_currentLanguageCode;
    if (currentLanguageCode)
    {
      uint64_t v4 = [(NSString *)currentLanguageCode stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
      id v5 = [(ADAssetManager *)self _fetchAssetStatusForLanguage:self->_currentLanguageCode];
      id v6 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315650;
        v13 = "-[ADAssetManager _checkAssetsStatusForIntervalRecording]";
        __int16 v14 = 2112;
        v15 = v4;
        __int16 v16 = 2112;
        v17 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s For measuring asset fetch time, status for %@: %@", (uint8_t *)&v12, 0x20u);
      }
      if (AFUODStatusSupportedFull())
      {
        v7 = [(NSMutableDictionary *)self->_assetFetchIntervalBeginDates objectForKey:v4];
        if (v7)
        {
          [(NSMutableDictionary *)self->_assetFetchIntervalBeginDates removeObjectForKey:v4];
          id v8 = +[NSDate date];
          [v8 timeIntervalSinceDate:v7];
          unint64_t v10 = llround(v9);

          if (v10)
          {
            uint64_t v11 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              int v12 = 136315906;
              v13 = "-[ADAssetManager _checkAssetsStatusForIntervalRecording]";
              __int16 v14 = 2112;
              v15 = v4;
              __int16 v16 = 2112;
              v17 = v7;
              __int16 v18 = 1024;
              int v19 = v10;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Asset fetch for %@ began at %@ and took %u seconds", (uint8_t *)&v12, 0x26u);
            }
            [(ADAssetManager *)self _emitUODAssetPreparedEventWithLanguage:v4 elapsed:v10];
          }
        }
      }
    }
  }
}

- (void)_recordAssetsNeededForLanguage:(id)a3 resetPrevious:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(ADAssetManager *)self _shouldLogAssetsPreparedEvent]) {
    goto LABEL_11;
  }
  v7 = +[AFPreferences sharedPreferences];
  if (([v7 assistantIsEnabled] & 1) == 0)
  {

    goto LABEL_11;
  }
  currentLanguageCode = self->_currentLanguageCode;

  if (!currentLanguageCode)
  {
LABEL_11:
    double v9 = v6;
    goto LABEL_12;
  }
  double v9 = [v6 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  unint64_t v10 = [(NSMutableDictionary *)self->_assetFetchIntervalBeginDates valueForKey:v9];
  if (!v10 || v4)
  {
    uint64_t v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      v15 = "-[ADAssetManager _recordAssetsNeededForLanguage:resetPrevious:]";
      __int16 v16 = 2112;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Saving date when %@ assets are first known to be needed", (uint8_t *)&v14, 0x16u);
    }
    assetFetchIntervalBeginDates = self->_assetFetchIntervalBeginDates;
    v13 = +[NSDate date];
    [(NSMutableDictionary *)assetFetchIntervalBeginDates setValue:v13 forKey:v9];
  }
LABEL_12:
}

- (BOOL)_shouldLogAssetsPreparedEvent
{
  return self->_assetFetchIntervalBeginDates != 0;
}

- (void)_subscribeToMorphunAssetStatusForLanguage:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:self->_currentLanguageCode] & 1) == 0)
  {
    morphunAssetsManager = self->_morphunAssetsManager;
    id v6 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:self->_currentLanguageCode];
    [(MorphunAssets *)morphunAssetsManager unsubscribeFromLocale:v6];
  }
  objc_initWeak(&location, self);
  v7 = self->_morphunAssetsManager;
  id v8 = +[NSLocale localeWithLocaleIdentifier:v4];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10022CF9C;
  v10[3] = &unk_100507700;
  objc_copyWeak(&v12, &location);
  id v9 = v4;
  id v11 = v9;
  [(MorphunAssets *)v7 subscribeToLocale:v8 withCompletion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)_fetchAssetStatusForLanguage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = +[NSLocale localeWithLocaleIdentifier:v4];
  uint64_t v6 = [v5 languageCode];
  uint64_t v7 = +[SFUtilities languageStringForLocaleString:v4];
  uint64_t v35 = [(NSDictionary *)self->_speechAssetStatusForLocale objectForKeyedSubscript:v7];
  if (AFOfflineDictationStatusStringIsInstalled())
  {
    if (AFIsNano() && AFDeviceSupportsFullSiriUOD())
    {
      id v8 = -[NSDictionary objectForKey:](self->_speechAssetTasksForLocale, "objectForKey:", v7, v35);
      uint64_t v9 = (uint64_t)[v8 supportsAssistant];
      if ((v9 & 1) == 0)
      {
        unint64_t v10 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v42 = "-[ADAssetManager _fetchAssetStatusForLanguage:]";
          __int16 v43 = 2112;
          *(void *)v44 = v7;
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Speech asset for %@ does not support Assistant.", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_nlAssetStatus, "objectForKeyedSubscript:", v4, v35);
  v37 = (void *)v7;
  if ([v11 BOOLValue])
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    v13 = [(NSMutableDictionary *)self->_nlAssetStatus objectForKeyedSubscript:v6];
    unsigned __int8 v12 = [v13 BOOLValue];
  }
  int v14 = [(NSMutableDictionary *)self->_nlRouterAssetStatus objectForKeyedSubscript:v4];
  if ([v14 BOOLValue])
  {
    uint64_t v15 = 1;
  }
  else
  {
    __int16 v16 = [(NSMutableDictionary *)self->_nlRouterAssetStatus objectForKeyedSubscript:v6];
    uint64_t v15 = (uint64_t)[v16 BOOLValue];
  }
  id v17 = [(MorphunAssets *)self->_morphunAssetsManager isAssetReadyForLocale:v5];
  if (v12)
  {
    uint64_t v18 = 1;
  }
  else if (_AFPreferencesSiriXNLAssetOverride())
  {
    int v19 = AFSiriLogContextDaemon;
    uint64_t v18 = 1;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v42 = "-[ADAssetManager _fetchAssetStatusForLanguage:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s NL asset overriden as available", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  v20 = [(NSDictionary *)self->_attentionAssetStatus objectForKeyedSubscript:v4];
  v38 = (void *)v6;
  if ([v20 BOOLValue])
  {
    uint64_t v21 = 1;
  }
  else
  {
    v22 = [(NSDictionary *)self->_attentionAssetStatus objectForKeyedSubscript:v6];
    uint64_t v21 = (uint64_t)[v22 BOOLValue];
  }
  v23 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    BOOL supportsSiriUoD = self->_supportsSiriUoD;
    BOOL supportsSiriHybridUoD = self->_supportsSiriHybridUoD;
    *(_DWORD *)buf = 136317186;
    v42 = "-[ADAssetManager _fetchAssetStatusForLanguage:]";
    __int16 v43 = 1024;
    *(_DWORD *)v44 = v9;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = v18;
    __int16 v45 = 1024;
    int v46 = (int)v17;
    __int16 v47 = 1024;
    int v48 = v21;
    __int16 v49 = 1024;
    int v50 = v15;
    __int16 v51 = 2112;
    id v52 = v4;
    __int16 v53 = 1024;
    BOOL v54 = supportsSiriUoD;
    __int16 v55 = 1024;
    BOOL v56 = supportsSiriHybridUoD;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Retrieved asset status ASR: %u, NL: %u, Morphun: %u, Attention: %u, NLRouter: %u, (lang:%@, uod:%d, hybrid:%d)", buf, 0x40u);
  }
  if (self->_supportsSiriUoD
    && (self->_speechAssetManager
     || (v26 = AFSiriLogContextDaemon, !os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
     || (*(_DWORD *)buf = 136315138,
         v42 = "-[ADAssetManager _fetchAssetStatusForLanguage:]",
         _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s UOD without a speech manager", buf, 0xCu), self->_supportsSiriUoD))|| self->_supportsSiriHybridUoD)
  {
    if (!self->_cdmClient)
    {
      v27 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v42 = "-[ADAssetManager _fetchAssetStatusForLanguage:]";
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s UOD or Hybrid without a CDM client", buf, 0xCu);
      }
    }
  }
  v39[0] = AFAssetManagerNLAssetsTag;
  v28 = +[NSNumber numberWithBool:v18];
  v40[0] = v28;
  v39[1] = AFAssetManagerSpeechAssetsTag;
  v29 = +[NSNumber numberWithBool:v9];
  v40[1] = v29;
  v39[2] = AFAssetManagerMorphunAssetsTag;
  v30 = +[NSNumber numberWithBool:v17];
  v40[2] = v30;
  v39[3] = AFAssetManagerAttentionAssetsTag;
  v31 = +[NSNumber numberWithBool:v21];
  v40[3] = v31;
  v39[4] = AFAssetManagerNLRouterAssetsTag;
  v32 = +[NSNumber numberWithBool:v15];
  v40[4] = v32;
  v33 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:5];

  if ([(ADAssetManager *)self _shouldLogAssetsPreparedEvent]
    && (AFUODStatusSupportedFull() & 1) == 0)
  {
    [(ADAssetManager *)self _recordAssetsNeededForLanguage:v4 resetPrevious:0];
  }

  return v33;
}

- (void)_registerAssetStatusTrackers
{
  objc_initWeak(&location, self);
  if (self->_supportsSiriUoD)
  {
    delegateQueue = self->_delegateQueue;
    group = self->_group;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10022DC48;
    block[3] = &unk_10050B790;
    objc_copyWeak(&v22, &location);
    dispatch_group_async(group, delegateQueue, block);
    uint64_t v6 = self->_delegateQueue;
    id v5 = self->_group;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10022DE04;
    v19[3] = &unk_10050B790;
    objc_copyWeak(&v20, &location);
    dispatch_group_async(v5, v6, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
  }
  else
  {
    uint64_t v7 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315138;
    v25 = "-[ADAssetManager _registerAssetStatusTrackers]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Device does not support full Siri UoD, not registering assets change for ASR assets", buf, 0xCu);
  }
  if (self->_supportsSiriUoD)
  {
LABEL_7:
    uint64_t v9 = self->_delegateQueue;
    id v8 = self->_group;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10022DFBC;
    v17[3] = &unk_10050B790;
    objc_copyWeak(&v18, &location);
    dispatch_group_async(v8, v9, v17);
    objc_destroyWeak(&v18);
    goto LABEL_8;
  }
LABEL_6:
  if (self->_supportsSiriHybridUoD) {
    goto LABEL_7;
  }
  v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ADAssetManager _registerAssetStatusTrackers]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Device does not support full Siri UoD or Hybrid UoD, not registering assets change for NL assets", buf, 0xCu);
  }
LABEL_8:
  if (self->_supportsSiriUoD || self->_supportsSiriHybridUoD)
  {
    p_delegateQueue = &self->_delegateQueue;
    unint64_t v10 = self->_delegateQueue;
    id v11 = p_delegateQueue[1];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10022E000;
    v15[3] = &unk_10050B790;
    objc_copyWeak(&v16, &location);
    dispatch_group_async(v11, v10, v15);
    objc_destroyWeak(&v16);
  }
  else
  {
    int v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[ADAssetManager _registerAssetStatusTrackers]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Device does not support full Siri UoD or Hybrid UoD, not registering assets change for Morphun assets", buf, 0xCu);
    }
  }
  objc_destroyWeak(&location);
}

- (void)_registerCDMStatusTracker
{
  os_signpost_id_t v3 = os_signpost_id_generate(AFSiriLogContextDaemon);
  id v4 = AFSiriLogContextDaemon;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "RegisterAssetNL", (const char *)&unk_100458042, (uint8_t *)&v17, 2u);
  }

  uint64_t v6 = (CDMClient *)objc_alloc_init((Class)CDMClient);
  cdmClient = self->_cdmClient;
  self->_cdmClient = v6;

  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    id v18 = "-[ADAssetManager _registerCDMStatusTracker]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Registering NL delegate", (uint8_t *)&v17, 0xCu);
  }
  [(CDMClient *)self->_cdmClient registerWithAssetsDelegate:self withType:0];
  uint64_t v9 = AFSiriLogContextDaemon;
  unint64_t v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, v3, "RegisterAssetNL", (const char *)&unk_100458042, (uint8_t *)&v17, 2u);
  }

  os_signpost_id_t v11 = os_signpost_id_generate(AFSiriLogContextDaemon);
  unsigned __int8 v12 = AFSiriLogContextDaemon;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "RegisterAssetNLRouter", (const char *)&unk_100458042, (uint8_t *)&v17, 2u);
  }

  int v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    id v18 = "-[ADAssetManager _registerCDMStatusTracker]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Registering NL router delegate", (uint8_t *)&v17, 0xCu);
  }
  [(CDMClient *)self->_cdmClient registerWithAssetsDelegate:self withType:1];
  uint64_t v15 = AFSiriLogContextDaemon;
  id v16 = v15;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, v11, "RegisterAssetNLRouter", (const char *)&unk_100458042, (uint8_t *)&v17, 2u);
  }
}

- (void)assetsUnavailableWithType:(int64_t)a3
{
  objc_initWeak(&location, self);
  if (a3 == 1)
  {
    group = self->_group;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10022E788;
    block[3] = &unk_10050B790;
    uint64_t v7 = &v11;
    objc_copyWeak(&v11, &location);
    id v8 = block;
    goto LABEL_5;
  }
  if (!a3)
  {
    group = self->_group;
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10022E640;
    v12[3] = &unk_10050B790;
    uint64_t v7 = &v13;
    objc_copyWeak(&v13, &location);
    id v8 = v12;
LABEL_5:
    dispatch_group_async(group, queue, v8);
    objc_destroyWeak(v7);
    goto LABEL_8;
  }
  uint64_t v9 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v16 = "-[ADAssetManager assetsUnavailableWithType:]";
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Unknown NL delegate type", buf, 0xCu);
  }
LABEL_8:
  objc_destroyWeak(&location);
}

- (void)assetsAvailableForLocale:(id)a3 withType:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  if (a4 == 1)
  {
    group = self->_group;
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10022EC64;
    v14[3] = &unk_10050C7C8;
    uint64_t v9 = &v16;
    objc_copyWeak(&v16, &location);
    id v15 = v6;
    dispatch_group_async(group, queue, v14);
    unint64_t v10 = v15;
    goto LABEL_5;
  }
  if (!a4)
  {
    uint64_t v7 = self->_group;
    id v8 = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10022EABC;
    block[3] = &unk_10050C7C8;
    uint64_t v9 = &v19;
    objc_copyWeak(&v19, &location);
    id v18 = v6;
    dispatch_group_async(v7, v8, block);
    unint64_t v10 = v18;
LABEL_5:

    objc_destroyWeak(v9);
    goto LABEL_8;
  }
  id v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "-[ADAssetManager assetsAvailableForLocale:withType:]";
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Unknown NL delegate type", buf, 0xCu);
  }
LABEL_8:
  objc_destroyWeak(&location);
}

- (void)attentionAssetStatus:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  group = self->_group;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022EEDC;
  block[3] = &unk_10050C7C8;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_group_async(group, queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)assetStatus:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  group = self->_group;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022F124;
  block[3] = &unk_10050C7C8;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_group_async(group, queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)notifyObserversLanguageCodeChanged:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_availabilityObservers count])
  {
    id v5 = [(NSMutableSet *)self->_availabilityObservers copy];
    objc_initWeak(&location, self);
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10022F3C0;
    v8[3] = &unk_10050A280;
    objc_copyWeak(&v11, &location);
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(queue, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)notifyObserversAssetAvailabilityChanged
{
  if ([(NSMutableSet *)self->_availabilityObservers count])
  {
    id v3 = [(NSMutableSet *)self->_availabilityObservers copy];
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10022F5B4;
    block[3] = &unk_10050C7C8;
    objc_copyWeak(&v8, &location);
    id v7 = v3;
    id v5 = v3;
    dispatch_async(queue, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)removeAvailabilityObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022F78C;
  block[3] = &unk_10050C7C8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)addAvailabilityObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022F8B4;
  block[3] = &unk_10050C7C8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)languageCodeWasChangedTo:(id)a3
{
  id v4 = a3;
  if (*(_WORD *)&self->_supportsSiriUoD)
  {
    objc_initWeak(location, self);
    p_delegateQueue = &self->_delegateQueue;
    delegateQueue = self->_delegateQueue;
    id v6 = p_delegateQueue[1];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10022FA98;
    v9[3] = &unk_10050C7C8;
    objc_copyWeak(&v11, location);
    id v10 = v4;
    dispatch_group_notify(v6, delegateQueue, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  else
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[ADAssetManager languageCodeWasChangedTo:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Device does not support full Siri UoD or Hybrid UoD, not registering assets change for Morphun assets", (uint8_t *)location, 0xCu);
    }
  }
}

- (void)fetchAssetsAvailabilityForLanguage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([v6 length])
    {
      if (self->_supportsSiriUoD || self->_supportsSiriHybridUoD)
      {
        objc_initWeak(location, self);
        group = self->_group;
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10022FF24;
        block[3] = &unk_100507F60;
        objc_copyWeak(&v19, location);
        id v17 = v6;
        id v18 = v7;
        dispatch_group_notify(group, queue, block);

        objc_destroyWeak(&v19);
        objc_destroyWeak(location);
        goto LABEL_12;
      }
      int v14 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(location[0]) = 136315138;
        *(id *)((char *)location + 4) = "-[ADAssetManager fetchAssetsAvailabilityForLanguage:completion:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s Siri UoD not supported. Returning empty assets status", (uint8_t *)location, 0xCu);
      }
      id v15 = self->_queue;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10022FF0C;
      v20[3] = &unk_10050D0D0;
      id v21 = v7;
      dispatch_async(v15, v20);
      id v13 = v21;
    }
    else
    {
      id v11 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(location[0]) = 136315138;
        *(id *)((char *)location + 4) = "-[ADAssetManager fetchAssetsAvailabilityForLanguage:completion:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Input language code is nil. Returning empty assets status", (uint8_t *)location, 0xCu);
      }
      unsigned __int8 v12 = self->_queue;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10022FEF4;
      v22[3] = &unk_10050D0D0;
      id v23 = v7;
      dispatch_async(v12, v22);
      id v13 = v23;
    }

    goto LABEL_12;
  }
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(location[0]) = 136315138;
    *(id *)((char *)location + 4) = "-[ADAssetManager fetchAssetsAvailabilityForLanguage:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Completion block is nil", (uint8_t *)location, 0xCu);
  }
LABEL_12:
}

- (id)assetsAvailableStatusForLanguage:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v8 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADAssetManager assetsAvailableStatusForLanguage:]";
    id v9 = "%s Input language code is nil. Returning nil assets status";
LABEL_13:
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&buf, 0xCu);
    goto LABEL_11;
  }
  if (self->_supportsSiriUoD || self->_supportsSiriHybridUoD)
  {
    dispatch_group_wait((dispatch_group_t)self->_group, 0xFFFFFFFFFFFFFFFFLL);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_1002301D4;
    id v16 = sub_1002301E4;
    id v17 = 0;
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002301EC;
    block[3] = &unk_10050C700;
    p_long long buf = &buf;
    void block[4] = self;
    id v11 = v4;
    dispatch_sync(queue, block);
    id v6 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
    goto LABEL_5;
  }
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADAssetManager assetsAvailableStatusForLanguage:]";
    id v9 = "%s Siri UoD not supported. Returning nil assets status";
    goto LABEL_13;
  }
LABEL_11:
  id v6 = 0;
LABEL_5:

  return v6;
}

- (ADAssetManager)initWithLanguageCode:(id)a3 speechAssetManager:(id)a4 cdmClient:(id)a5 morphunAssetManager:(id)a6 supportsSiriUoD:(BOOL)a7 supportsSiriHybridUoD:(BOOL)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v41.receiver = self;
  v41.super_class = (Class)ADAssetManager;
  id v17 = [(ADAssetManager *)&v41 init];
  if (v17)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v18 = v38 = v14;
    id v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.ADAssetManager", v19);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v20;

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.ADAssetManager.delegate", v19);
    delegateQueue = v17->_delegateQueue;
    v17->_delegateQueue = (OS_dispatch_queue *)v22;

    dispatch_group_t v24 = dispatch_group_create();
    group = v17->_group;
    v17->_group = (OS_dispatch_group *)v24;

    v26 = +[AFPreferences sharedPreferences];
    uint64_t v27 = [v26 languageCode];
    currentLanguageCode = v17->_currentLanguageCode;
    v17->_currentLanguageCode = (NSString *)v27;

    uint64_t v29 = objc_opt_new();
    nlAssetStatus = v17->_nlAssetStatus;
    v17->_nlAssetStatus = (NSMutableDictionary *)v29;

    uint64_t v31 = objc_opt_new();
    nlRouterAssetStatus = v17->_nlRouterAssetStatus;
    v17->_nlRouterAssetStatus = (NSMutableDictionary *)v31;

    objc_storeStrong((id *)&v17->_currentLanguageCode, a3);
    v17->_BOOL supportsSiriUoD = a7;
    v17->_BOOL supportsSiriHybridUoD = a8;
    objc_storeStrong((id *)&v17->_speechAssetManager, a4);
    objc_storeStrong((id *)&v17->_cdmClient, a5);
    objc_storeStrong((id *)&v17->_morphunAssetsManager, a6);
    uint64_t v33 = +[NSMutableSet set];
    availabilityObservers = v17->_availabilityObservers;
    v17->_availabilityObservers = (NSMutableSet *)v33;

    [(ADAssetManager *)v17 _registerAssetStatusTrackers];
    id v14 = v38;
    uint64_t v35 = +[NSMutableDictionary dictionary];
    assetFetchIntervalBeginDates = v17->_assetFetchIntervalBeginDates;
    v17->_assetFetchIntervalBeginDates = (NSMutableDictionary *)v35;
  }
  return v17;
}

- (ADAssetManager)init
{
  id v3 = +[AFPreferences sharedPreferences];
  id v4 = [v3 languageCode];
  uint64_t v5 = AFDeviceSupportsSiriUOD();
  id v6 = [(ADAssetManager *)self initWithLanguageCode:v4 speechAssetManager:0 cdmClient:0 morphunAssetManager:0 supportsSiriUoD:v5 supportsSiriHybridUoD:AFDeviceSupportsHybridUOD()];

  return v6;
}

+ (ADAssetManager)sharedInstance
{
  if (qword_100585F70 != -1) {
    dispatch_once(&qword_100585F70, &stru_1005076B0);
  }
  v2 = (void *)qword_100585F68;
  return (ADAssetManager *)v2;
}

@end