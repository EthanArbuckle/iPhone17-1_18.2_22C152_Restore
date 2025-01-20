@interface ADAssistantDataManager
+ (id)sharedDataManager;
- (ADAddressBookManager)_addressBookManager;
- (ADAssistantDataManager)init;
- (ADAssistantDataManager)initWithInstanceContext:(id)a3;
- (BOOL)voiceOverIsActive;
- (id)_cachedAssistantData;
- (id)_cachedRestrictions;
- (id)_mcQueue;
- (id)_redactedCopyMeCards:(id)a3;
- (id)_unredactedMeCards;
- (id)unredactedAnchor;
- (void)_censorSpeechDidChange:(id)a3;
- (void)_countryCodeDidChange:(id)a3;
- (void)_currentLocaleDidChange:(id)a3;
- (void)_fetchDictationAllowedStatus:(id)a3;
- (void)_fetchDictationHIPAAMDMStatus:(id)a3;
- (void)_generateAssistantData;
- (void)_locationRestrictionDidChange:(id)a3;
- (void)_notifyAnnouncementEligibilityObserverVoiceAssetsDidChange;
- (void)_notifyObserversOfDictationHIPAAMDMStatus;
- (void)_notifyObserversOfSAD:(id)a3;
- (void)_onMainThreadUpdateCountryCodeWithCountryConfiguration:(id)a3 completion:(id)a4;
- (void)_outputVoiceDidChange:(id)a3;
- (void)_safeGenerateAssistantDataForVoiceTriggerEnabled;
- (void)_safeUpdateVoiceOverStatus;
- (void)_setAllowExplicitContent:(BOOL)a3;
- (void)_setAllowExplicitContentAndCensorSpeech:(BOOL)a3;
- (void)_storeFrontDidChange:(id)a3;
- (void)_systemTimeZoneDidChange:(id)a3;
- (void)_updateCallCapability:(id)a3;
- (void)_updateDictationAllowedStatus;
- (void)_updateItunesStoreIdentifier:(id)a3;
- (void)_updateRestrictions:(id)a3;
- (void)_updateVoice:(id)a3;
- (void)_updateVoiceOverStatus:(id)a3;
- (void)_voiceAssetsUpdated:(id)a3;
- (void)addObserver:(id)a3;
- (void)addressBookManagerDidUpdateData:(id)a3 meCard:(id)a4;
- (void)contextCollector:(id)a3 didChangeDisplayScale:(double)a4;
- (void)dealloc;
- (void)didChangeTelephonyCallingSupport;
- (void)getAssistantDataWithCompletion:(id)a3;
- (void)getMeCardsWithCompletion:(id)a3;
- (void)getiTunesStoreFrontIdentifierWithCompletion:(id)a3;
- (void)localMeCardDidUpdate:(id)a3;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)removeObserver:(id)a3;
- (void)requestAssistantDataUpdateHighPriority:(BOOL)a3;
- (void)setAllowExplicitContentAndCensorSpeech:(BOOL)a3;
- (void)setVoiceOverIsActive:(BOOL)a3;
@end

@implementation ADAssistantDataManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressBookManager, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_unredactedAnchor, 0);
  objc_storeStrong((id *)&self->_cachedSAD, 0);
  objc_storeStrong((id *)&self->_cachedStoreFrontId, 0);
  objc_storeStrong((id *)&self->_displayScaleMonitor, 0);
  objc_storeStrong((id *)&self->_cachedContentRatingRestrictions, 0);
  objc_storeStrong((id *)&self->_cachedVoice, 0);
  objc_storeStrong((id *)&self->_cachedCountryCode, 0);
  objc_storeStrong((id *)&self->_cachedRestrictions, 0);
  objc_storeStrong((id *)&self->_fetchingMeCardGroup, 0);
  objc_storeStrong((id *)&self->_cachedMeCards, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (ADAddressBookManager)_addressBookManager
{
  return self->_addressBookManager;
}

- (void)setVoiceOverIsActive:(BOOL)a3
{
  self->_voiceOverIsActive = a3;
}

- (BOOL)voiceOverIsActive
{
  return self->_voiceOverIsActive;
}

- (void)localMeCardDidUpdate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002F7D50;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_updateVoiceOverStatus:(id)a3
{
  id v4 = (void (**)(id, BOOL))a3;
  v5 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    v9 = "-[ADAssistantDataManager _updateVoiceOverStatus:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s VoiceOver status changed, updating assistant data", (uint8_t *)&v8, 0xCu);
  }
  BOOL v6 = _AXSVoiceOverTouchEnabled() != 0;
  BOOL v7 = self->_voiceOverIsActive != v6;
  self->_voiceOverIsActive = v6;
  v4[2](v4, v7);
}

- (void)_updateItunesStoreIdentifier:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  v5 = self->_cachedStoreFrontId;
  BOOL v6 = +[ACAccountStore ams_sharedAccountStore];
  BOOL v7 = v6;
  if (!v6)
  {
    v11 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315138;
      v21 = "-[ADAssistantDataManager _updateItunesStoreIdentifier:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Unable to get the shared instance of ACAccountStore.", (uint8_t *)&v20, 0xCu);
    }
LABEL_6:
    uint64_t v12 = 0;
    if (!v4) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  int v8 = objc_msgSend(v6, "ams_activeiTunesAccount");
  uint64_t v9 = objc_msgSend(v8, "ams_storefront");
  if (v9)
  {
    v10 = (NSString *)v9;
    goto LABEL_15;
  }
  v13 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315138;
    v21 = "-[ADAssistantDataManager _updateItunesStoreIdentifier:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Using local identifier", (uint8_t *)&v20, 0xCu);
  }
  v14 = objc_msgSend(v7, "ams_localiTunesAccount");
  if (!v14)
  {
    v15 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315138;
      v21 = "-[ADAssistantDataManager _updateItunesStoreIdentifier:]";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Unable to get the local iTunes Account.", (uint8_t *)&v20, 0xCu);
    }
  }
  uint64_t v16 = objc_msgSend(v14, "ams_storefront");
  if (!v16)
  {
    v19 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315138;
      v21 = "-[ADAssistantDataManager _updateItunesStoreIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s No store front identifier available", (uint8_t *)&v20, 0xCu);
    }

    goto LABEL_6;
  }
  v10 = (NSString *)v16;

LABEL_15:
  cachedStoreFrontId = self->_cachedStoreFrontId;
  self->_cachedStoreFrontId = v10;
  v18 = v10;

  uint64_t v12 = [(NSString *)self->_cachedStoreFrontId isEqualToString:v5] ^ 1;
  if (v4) {
LABEL_16:
  }
    v4[2](v4, v12);
LABEL_17:
}

- (void)_updateCallCapability:(id)a3
{
  id v4 = a3;
  if (qword_1005862D0 != -1) {
    dispatch_once(&qword_1005862D0, &stru_10050BA70);
  }
  v5 = qword_1005862D8;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002F82C8;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_updateVoice:(id)a3
{
  id v4 = a3;
  if (sub_1001FA16C())
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1002F86A8;
    v28[3] = &unk_10050BA00;
    v28[4] = self;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1002F8794;
    v25[3] = &unk_10050C868;
    v5 = objc_retainBlock(v28);
    id v26 = v5;
    id v6 = v4;
    id v27 = v6;
    BOOL v7 = objc_retainBlock(v25);
    id v8 = +[AFPreferences sharedPreferences];
    uint64_t v9 = [v8 inProgressOutputVoice];

    if (v9)
    {
      v10 = [v9 languageCode];
      v11 = [v9 name];
      id v12 = [objc_alloc((Class)SiriTTSSynthesisVoice) initWithLanguage:v10 name:v11];
      v13 = +[SiriTTSDaemonSession afSharedSession];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1002F898C;
      v17[3] = &unk_10050BA50;
      id v18 = v9;
      id v19 = v10;
      id v20 = v11;
      id v21 = v12;
      v22 = v7;
      v23 = v5;
      id v24 = v6;
      id v14 = v12;
      id v15 = v11;
      id v16 = v10;
      [v13 getSynthesisVoiceMatching:v14 reply:v17];
    }
    else
    {
      ((void (*)(void *))v7[2])(v7);
    }
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (id)_cachedRestrictions
{
  cachedRestrictions = [(NSArray *)self->_cachedRestrictions count];
  if (cachedRestrictions) {
    cachedRestrictions = self->_cachedRestrictions;
  }
  return cachedRestrictions;
}

- (void)_updateRestrictions:(id)a3
{
  id v13 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  char v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  char v47 = 1;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  char v45 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_1002F93D4;
  v39[4] = sub_1002F93E4;
  id v40 = 0;
  v5 = dispatch_group_create();
  id v6 = [(ADAssistantDataManager *)self _mcQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F93EC;
  block[3] = &unk_10050B988;
  id v7 = v4;
  id v32 = v7;
  v33 = v48;
  v34 = v46;
  v35 = v44;
  v36 = v43;
  v37 = v42;
  v38 = v41;
  dispatch_group_async(v5, v6, block);

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 0;
  dispatch_group_enter(v5);
  id v8 = +[ADCommandCenter sharedCommandCenter];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1002F96A4;
  v26[3] = &unk_10050B9B0;
  v28 = v29;
  uint64_t v9 = v5;
  id v27 = v9;
  [v8 fetchLocationAuthorization:v26];

  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002F96C0;
  v14[3] = &unk_10050B9D8;
  id v15 = v7;
  id v16 = self;
  id v19 = v39;
  id v20 = v48;
  id v21 = v46;
  v22 = v44;
  v23 = v43;
  id v24 = v42;
  v25 = v41;
  id v18 = v29;
  id v17 = v13;
  id v11 = v13;
  id v12 = v7;
  dispatch_group_notify(v9, queue, v14);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);
}

- (void)_fetchDictationAllowedStatus:(id)a3
{
  id v4 = a3;
  v5 = [(ADAssistantDataManager *)self _mcQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F9A04;
  block[3] = &unk_10050D0D0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)_fetchDictationHIPAAMDMStatus:(id)a3
{
  id v4 = a3;
  v5 = [(ADAssistantDataManager *)self _mcQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F9B08;
  block[3] = &unk_10050D0D0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (id)_mcQueue
{
  if (qword_1005862C0 != -1) {
    dispatch_once(&qword_1005862C0, &stru_10050B960);
  }
  v2 = (void *)qword_1005862C8;
  return v2;
}

- (void)_setAllowExplicitContentAndCensorSpeech:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[ADPreferences sharedPreferences];
  [v5 setAllowExplicitContent:v3];

  self->_cachedAllowsExplicitContent = v3;
  self->_cachedCensorSpeech = !v3;
  [(ADAssistantDataManager *)self _generateAssistantData];
}

- (void)_setAllowExplicitContent:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[ADPreferences sharedPreferences];
  [v5 setAllowExplicitContent:v3];

  self->_cachedAllowsExplicitContent = v3;
  [(ADAssistantDataManager *)self _generateAssistantData];
}

- (id)_unredactedMeCards
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1002F93D4;
  v10 = sub_1002F93E4;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002F9DD0;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_cachedAssistantData
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1002F93D4;
  v10 = sub_1002F93E4;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002F9F0C;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_onMainThreadUpdateCountryCodeWithCountryConfiguration:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!+[NSThread isMainThread])
  {
    id v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"ADAssistantDataManager.m" lineNumber:913 description:@"called from non-main thread"];
  }
  uint64_t v9 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v19 = "-[ADAssistantDataManager _onMainThreadUpdateCountryCodeWithCountryConfiguration:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Updating country configuration for assistant data", buf, 0xCu);
  }
  v10 = [v7 countryCode];
  if (!v10) {
    [v7 updateProvidersForCurrentCountry];
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FA0E4;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v12 = v8;
  id v13 = v10;
  dispatch_async(queue, block);
}

- (void)_updateDictationAllowedStatus
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1002FA204;
  v2[3] = &unk_10050B918;
  v2[4] = self;
  [(ADAssistantDataManager *)self _fetchDictationAllowedStatus:v2];
}

- (void)_notifyObserversOfDictationHIPAAMDMStatus
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1002FA44C;
  v2[3] = &unk_10050B918;
  v2[4] = self;
  [(ADAssistantDataManager *)self _fetchDictationHIPAAMDMStatus:v2];
}

- (void)_notifyObserversOfSAD:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_observers;
  id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 assistantDataManager:self didUpdateAssistantData:v4 meCards:self->_cachedMeCards unredactedAnchor:self->_unredactedAnchor];
        }
        else {
          objc_msgSend(v10, "assistantDataManager:didUpdateAssistantData:", self, v4, (void)v11);
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_generateAssistantData
{
  if (self->_initialFetchComplete
    && (self->_cachedCountryCode || self->_receivedGeoCountryConfigurationResponse || self->_cachedVoice))
  {
    id v3 = objc_alloc_init((Class)SASetAssistantData);
    id v4 = +[NSLocale currentLocale];
    v5 = +[NSTimeZone systemTimeZone];
    id v6 = [v5 name];
    [v3 setTimeZoneId:v6];

    id v7 = [v4 localeIdentifier];
    [v3 setRegion:v7];

    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AppleICUForce24HourTime", kCFPreferencesAnyApplication, 0);
    if (AppBooleanValue
      || CFPreferencesGetAppBooleanValue(@"AppleICUForce12HourTime", kCFPreferencesAnyApplication, 0))
    {
      uint64_t v9 = +[NSNumber numberWithBool:AppBooleanValue != 0];
    }
    else
    {
      uint64_t v9 = 0;
    }
    [v3 setTwentyFourHourTimeDisplay:v9];

    v10 = [(ADAssistantDataManager *)self _cachedRestrictions];
    [v3 setParentalRestrictions:v10];

    [v3 setCensorSpeech:self->_cachedCensorSpeech];
    long long v11 = +[NSNumber numberWithBool:self->_cachedAllowUserGeneratedContent];
    [v3 setAllowUserGeneratedContent:v11];

    [v3 setMediaPlayerExplicitContentDisallowed:!self->_cachedAllowsExplicitContent];
    [v3 setMediaContentRatingRestrictions:self->_cachedContentRatingRestrictions];
    [v3 setCountryCode:self->_cachedCountryCode];
    [(ADDisplayScaleContextCollector *)self->_displayScaleMonitor displayScale];
    long long v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setUiScale:v12];

    [v3 setTtsVoice:self->_cachedVoice];
    [v3 setMeCards:self->_cachedMeCards];
    long long v13 = AFDeviceColor();
    [v3 setDeviceColor:v13];

    long long v14 = AFDeviceEnclosureColor();
    [v3 setDeviceEnclosure:v14];

    [v3 setInRetailStoreDemoMode:self->_cachedInRetailStoreDemoMode];
    id v15 = +[NSLocale preferredLanguages];
    id v16 = [v15 firstObject];
    [v3 setPreferredLanguage:v16];

    [v3 setFullStorefrontId:self->_cachedStoreFrontId];
    id v17 = +[NSNumber numberWithBool:self->_cachedServerFlagsEnabled];
    [v3 setDebugFlags:v17];

    id v18 = +[NSNumber numberWithBool:sub_1001FD6CC()];
    [v3 setVoiceTriggerEnabled:v18];

    if (self->_cachedSupportsTelephonyCalls)
    {
      uint64_t v49 = SADeviceCapabilityTelephonyValue;
      id v19 = +[NSArray arrayWithObjects:&v49 count:1];
      [v3 setDeviceCapabilities:v19];
    }
    id v20 = objc_msgSend(v4, "af_aceTemperatureUnit");
    [v3 setTemperatureUnit:v20];

    [v3 setVoiceOver:self->_voiceOverIsActive];
    id v21 = +[AFPreferences sharedPreferences];
    v22 = [v21 manualEndpointingThreshold];
    [v22 doubleValue];
    double v24 = v23 * 1000.0;

    v25 = +[NSNumber numberWithDouble:v24];
    [v3 setHoldToTalkThresholdInMilliseconds:v25];

    id v26 = AFCurrentUserInterfaceIdiom();
    [v3 setUserInterfaceIdiom:v26];

    id v27 = [v3 properties];
    v28 = [v27 allKeys];
    id v29 = [v28 mutableCopy];

    [v29 removeObject:SASetAssistantDataAnchorPListKey];
    char v30 = +[NSNull null];
    v31 = [v27 objectsForKeys:v29 notFoundMarker:v30];
    sub_1001FD1D8(v31);
    id v32 = (NSString *)objc_claimAutoreleasedReturnValue();
    unredactedAnchor = self->_unredactedAnchor;
    self->_unredactedAnchor = v32;

    v34 = [(ADAssistantDataManager *)self _redactedCopyMeCards:self->_cachedMeCards];
    [v3 setMeCards:v34];

    v35 = [v3 properties];

    v36 = [v35 objectsForKeys:v29 notFoundMarker:v30];

    v37 = sub_1001FD1D8(v36);
    [v3 setAnchor:v37];
    v38 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v39 = self->_unredactedAnchor;
      int v43 = 136315650;
      v44 = "-[ADAssistantDataManager _generateAssistantData]";
      __int16 v45 = 2112;
      v46 = v37;
      __int16 v47 = 2112;
      v48 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s SADanchor:%@\tunredacted:%@", (uint8_t *)&v43, 0x20u);
    }
    cachedSAD = self->_cachedSAD;
    self->_cachedSAD = (SASetAssistantData *)v3;
    id v41 = v3;

    [(ADAssistantDataManager *)self _notifyObserversOfSAD:self->_cachedSAD];
  }
  else
  {
    v42 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v43 = 136315138;
      v44 = "-[ADAssistantDataManager _generateAssistantData]";
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%s Not generating assistant data because we don't have some necessary cached data", (uint8_t *)&v43, 0xCu);
    }
  }
}

- (id)_redactedCopyMeCards:(id)a3
{
  id v3 = a3;
  id v4 = [v3 count];
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v4];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v3;
    id v7 = (char *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = _AFRedactedCopyPerson();
          objc_msgSend(v5, "addObject:", v11, v13);
        }
        uint64_t v8 = (char *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = &__NSArray0__struct;
  }

  return v5;
}

- (void)_notifyAnnouncementEligibilityObserverVoiceAssetsDidChange
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v3 = (const __CFString *)AFUpdateAnnouncementEligibilityDarwinNotification;
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 1u);
}

- (void)_censorSpeechDidChange:(id)a3
{
  id v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[ADAssistantDataManager _censorSpeechDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FB0D8;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_safeUpdateVoiceOverStatus
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FB1CC;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_safeGenerateAssistantDataForVoiceTriggerEnabled
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FB2C0;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_countryCodeDidChange:(id)a3
{
  id v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ADAssistantDataManager _countryCodeDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FB490;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_outputVoiceDidChange:(id)a3
{
  id v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[ADAssistantDataManager _outputVoiceDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FB648;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_systemTimeZoneDidChange:(id)a3
{
  id v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[ADAssistantDataManager _systemTimeZoneDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FB870;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_storeFrontDidChange:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    long long v11 = "-[ADAssistantDataManager _storeFrontDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v6 = +[ACAccountStore ams_sharedAccountStore];
  if (v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002FBA38;
    block[3] = &unk_10050E138;
    void block[4] = self;
    dispatch_async(queue, block);
  }
  else
  {
    uint64_t v8 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      long long v11 = "-[ADAssistantDataManager _storeFrontDidChange:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Unable to get the shared instance of ACAccountStore.", buf, 0xCu);
    }
  }
}

- (void)_locationRestrictionDidChange:(id)a3
{
  id v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[ADAssistantDataManager _locationRestrictionDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FBC9C;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_currentLocaleDidChange:(id)a3
{
  id v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v9 = "-[ADAssistantDataManager _currentLocaleDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FBE44;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"ADSharedDataDidChangeNotification" object:0];
}

- (void)_voiceAssetsUpdated:(id)a3
{
  id v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[ADAssistantDataManager _voiceAssetsUpdated:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FBF4C;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)contextCollector:(id)a3 didChangeDisplayScale:(double)a4
{
  id v6 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    uint64_t v8 = +[NSNumber numberWithDouble:a4];
    *(_DWORD *)buf = 136315394;
    long long v12 = "-[ADAssistantDataManager contextCollector:didChangeDisplayScale:]";
    __int16 v13 = 2112;
    long long v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FC1AC;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)addressBookManagerDidUpdateData:(id)a3 meCard:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002FC24C;
  v8[3] = &unk_10050E160;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[ADAssistantDataManager profileConnectionDidReceiveEffectiveSettingsChangedNotification:userInfo:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FC4CC;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)didChangeTelephonyCallingSupport
{
  CFStringRef v3 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[ADAssistantDataManager didChangeTelephonyCallingSupport]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002FC668;
  v4[3] = &unk_10050B918;
  v4[4] = self;
  [(ADAssistantDataManager *)self _updateCallCapability:v4];
}

- (void)getAssistantDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002FC720;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)setAllowExplicitContentAndCensorSpeech:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002FC890;
  v4[3] = &unk_10050CD50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (id)unredactedAnchor
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1002F93D4;
  v10 = sub_1002F93E4;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002FC990;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)getMeCardsWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002FCA84;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getiTunesStoreFrontIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002FD030;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)requestAssistantDataUpdateHighPriority:(BOOL)a3
{
  BOOL v3 = a3;
  qos_class_t v5 = qos_class_self();
  if (v5 <= QOS_CLASS_USER_INITIATED) {
    int v6 = 25;
  }
  else {
    int v6 = v5;
  }
  if (v3) {
    dispatch_qos_class_t v7 = v6;
  }
  else {
    dispatch_qos_class_t v7 = v5;
  }
  id v8 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v13 = "-[ADAssistantDataManager requestAssistantDataUpdateHighPriority:]";
    __int16 v14 = 1024;
    dispatch_qos_class_t v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Manually requesting assistant data update at qos_class_t %#02X", buf, 0x12u);
  }
  if (v3) {
    dispatch_block_flags_t v9 = DISPATCH_BLOCK_ENFORCE_QOS_CLASS;
  }
  else {
    dispatch_block_flags_t v9 = DISPATCH_BLOCK_INHERIT_QOS_CLASS;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FD318;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_block_t v10 = dispatch_block_create_with_qos_class(v9, v7, 0, block);
  dispatch_async((dispatch_queue_t)self->_queue, v10);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002FD3C4;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002FD468;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)dealloc
{
  BOOL v3 = +[MCProfileConnection sharedConnection];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
  [(ADAssistantDataManager *)self removeiTunesObserver];
  +[TUCallCapabilities removeDelegate:self];
  v6.receiver = self;
  v6.super_class = (Class)ADAssistantDataManager;
  [(ADAssistantDataManager *)&v6 dealloc];
}

- (ADAssistantDataManager)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v90.receiver = self;
  v90.super_class = (Class)ADAssistantDataManager;
  id v5 = [(ADAssistantDataManager *)&v90 init];
  if (v5)
  {
    objc_super v6 = dispatch_queue_attr_make_initially_inactive(0);
    dispatch_qos_class_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    dispatch_queue_t v8 = dispatch_queue_create("ADAssistantDataManager", v7);
    dispatch_block_flags_t v9 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v8;

    dispatch_set_qos_class_floor(*((dispatch_object_t *)v5 + 1), QOS_CLASS_DEFAULT, 0);
    dispatch_activate(*((dispatch_object_t *)v5 + 1));
    if (v4)
    {
      id v10 = v4;
    }
    else
    {
      id v10 = +[AFInstanceContext defaultContext];
    }
    id v11 = (void *)*((void *)v5 + 20);
    *((void *)v5 + 20) = v10;

    id v12 = [objc_alloc((Class)NSHashTable) initWithOptions:5 capacity:1];
    __int16 v13 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v12;

    __int16 v14 = dispatch_group_create();
    dispatch_qos_class_t v15 = [[ADDisplayScaleContextCollector alloc] initWithDelegate:v5];
    long long v16 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v15;

    dispatch_group_t v17 = dispatch_group_create();
    id v18 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v17;

    int HasAddressBook = AFDeviceHasAddressBook();
    dispatch_group_enter(*((dispatch_group_t *)v5 + 4));
    if (HasAddressBook)
    {
      id v20 = [[ADAddressBookManager alloc] initWithDelegate:v5];
      id v21 = (void *)*((void *)v5 + 22);
      *((void *)v5 + 22) = v20;

      dispatch_group_enter(v14);
      v22 = (void *)*((void *)v5 + 22);
      v87[0] = _NSConcreteStackBlock;
      v87[1] = 3221225472;
      v87[2] = sub_1002FDEC0;
      v87[3] = &unk_10050B8F0;
      double v23 = &v88;
      id v88 = v5;
      double v24 = (id *)&v89;
      v89 = v14;
      [v22 getMeCard:v87];
    }
    else
    {
      dispatch_group_enter(v14);
      v25 = +[ADLocalMeCardStore sharedStore];
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472;
      v84[2] = sub_1002FDF88;
      v84[3] = &unk_10050B8F0;
      double v23 = &v85;
      id v26 = v5;
      id v85 = v26;
      double v24 = (id *)&v86;
      v86 = v14;
      [v25 meCard:v84];

      id v27 = +[ADLocalMeCardStore sharedStore];
      [v27 addMeCardObserver:v26];
    }
    dispatch_group_enter(v14);
    qos_class_t v28 = qos_class_self();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002FE050;
    block[3] = &unk_10050E160;
    id v29 = v5;
    id v82 = v29;
    char v30 = v14;
    v83 = v30;
    dispatch_block_t v61 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v28, 0, block);
    dispatch_async(*((dispatch_queue_t *)v5 + 1), v61);
    *((_WORD *)v29 + 28) = 256;
    *((unsigned char *)v29 + 89) = 0;
    *((unsigned char *)v29 + 120) = _AFPreferencesGetEnableServerDebugFlags();
    id v31 = objc_alloc_init((Class)SAMediaContentRatingRestrictions);
    id v32 = (void *)*((void *)v29 + 12);
    *((void *)v29 + 12) = v31;

    if (qword_100585E40 != -1) {
      dispatch_once(&qword_100585E40, &stru_1005069F0);
    }
    *((unsigned char *)v29 + 58) = byte_100585E39;
    dispatch_group_enter(v30);
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_1002FE0D8;
    v79[3] = &unk_10050B918;
    v33 = v30;
    v80 = v33;
    [v29 _updateRestrictions:v79];
    dispatch_group_enter(v33);
    qos_class_t v34 = qos_class_self();
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_1002FE0E0;
    v76[3] = &unk_10050E160;
    id v35 = v29;
    id v77 = v35;
    v36 = v33;
    v78 = v36;
    dispatch_block_t v37 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v34, 0, v76);
    dispatch_async(*((dispatch_queue_t *)v5 + 1), v37);
    dispatch_group_enter(v36);
    qos_class_t v38 = qos_class_self();
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_1002FE168;
    v73[3] = &unk_10050E160;
    v39 = v35;
    id v74 = v39;
    id v40 = v36;
    v75 = v40;
    dispatch_block_t v41 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v38, 0, v73);
    dispatch_async(*((dispatch_queue_t *)v5 + 1), v41);
    v42 = +[ADPreferences sharedPreferences];
    uint64_t v43 = [v42 countryCode];
    v44 = (void *)v39[8];
    v39[8] = v43;

    dispatch_group_enter(v40);
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_1002FE1F0;
    v70[3] = &unk_10050E160;
    __int16 v45 = v39;
    id v71 = v45;
    v46 = v40;
    v72 = v46;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v70);
    AFIsNano();
    v45[104] = 1;
    dispatch_group_enter(v46);
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_1002FE2A0;
    v68[3] = &unk_10050B918;
    v69 = v46;
    __int16 v47 = v46;
    [v45 _updateCallCapability:v68];
    LODWORD(v40) = qos_class_self();
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_1002FE2A8;
    v66[3] = &unk_10050E138;
    v48 = v45;
    id v67 = v48;
    dispatch_block_t v49 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, (dispatch_qos_class_t)v40, 0, v66);
    dispatch_time_t v50 = dispatch_time(0, 3000000000);
    dispatch_after(v50, *((dispatch_queue_t *)v5 + 1), v49);
    LODWORD(v40) = qos_class_self();
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_1002FE37C;
    v64[3] = &unk_10050E138;
    v51 = v48;
    id v65 = v51;
    dispatch_block_t v52 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, (dispatch_qos_class_t)v40, 0, v64);
    dispatch_group_notify(v47, *((dispatch_queue_t *)v5 + 1), v52);
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_1002FE390;
    v62[3] = &unk_10050B918;
    v53 = v51;
    id v63 = v53;
    [v53 _fetchDictationHIPAAMDMStatus:v62];
    v54 = +[AFPreferences sharedPreferences];
    v53[106] = [v54 _dictationIsAllowed];

    [v53 _updateDictationAllowedStatus];
    v55 = +[NSNotificationCenter defaultCenter];
    [v55 addObserver:v53 selector:"_locationRestrictionDidChange:" name:@"ADLocationRestrictionDidChangeNotification" object:0];
    [v55 addObserver:v53 selector:"_currentLocaleDidChange:" name:NSCurrentLocaleDidChangeNotification object:0];
    [v55 addObserver:v53 selector:"_systemTimeZoneDidChange:" name:NSSystemTimeZoneDidChangeNotification object:0];
    [v55 addObserver:v53 selector:"_outputVoiceDidChange:" name:@"ADPreferencesOutputVoiceDidChangeNotification" object:0];
    [v55 addObserver:v53 selector:"_voiceAssetsUpdated:" name:@"ADVoiceAssetsUpdatedNotification" object:0];
    [v55 addObserver:v53 selector:"_censorSpeechDidChange:" name:@"ADShouldCensorSpeechDidChangeNotification" object:0];
    +[TUCallCapabilities addDelegate:v53 queue:*((void *)v5 + 1)];
    v56 = +[NSNotificationCenter defaultCenter];
    [v56 addObserver:v53 selector:"_storeFrontDidChange:" name:ACAccountStoreDidChangeNotification object:0];

    [v55 addObserver:v53 selector:"_countryCodeDidChange:" name:GEOCountryConfigurationCountryCodeDidChangeNotification object:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v53, (CFNotificationCallback)sub_1002FE42C, kVTPreferencesVoiceTriggerEnabledDidChangeDarwinNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v53, (CFNotificationCallback)sub_1002FE424, kAXSVoiceOverTouchEnabledNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v59 = +[MCProfileConnection sharedConnection];
    [v59 addObserver:v53];

    [v53 addiTunesObserver];
  }

  return (ADAssistantDataManager *)v5;
}

- (ADAssistantDataManager)init
{
  BOOL v3 = +[AFInstanceContext currentContext];
  id v4 = [(ADAssistantDataManager *)self initWithInstanceContext:v3];

  return v4;
}

+ (id)sharedDataManager
{
  if (qword_1005862B8 != -1) {
    dispatch_once(&qword_1005862B8, &stru_10050B8C8);
  }
  v2 = (void *)qword_1005862B0;
  return v2;
}

@end