@interface HMDCompositeSettingsHH2DatabaseAdapter
- (HMCContext)context;
- (HMDCompositeSettingsDatabaseAdapterDelegate)delegate;
- (HMDCompositeSettingsHH2DatabaseAdapter)initWithAccessory:(id)a3 homeID:(id)a4 workingManagedObjectContext:(id)a5 queue:(id)a6 notificationCenter:(id)a7;
- (NSString)strongRawDatabase;
- (NSUUID)accessoryID;
- (NSUUID)homeID;
- (OS_dispatch_queue)queue;
- (id)_modelFromAccessory:(id)a3;
- (id)emptyModelWithID:(id)a3 parentModelID:(id)a4 modelClass:(Class)a5;
- (id)fetchModelWithID:(id)a3;
- (id)logIdentifier;
- (id)rawDatabase;
- (void)_copySettingsFromModel:(id)a3 toAccessory:(id)a4;
- (void)_handleAccessoryUpdateTransaction:(id)a3;
- (void)_setDefaultVersionsOnModel:(id)a3;
- (void)addModel:(id)a3 withOptionsLabel:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)startWithDelegate:(id)a3;
@end

@implementation HMDCompositeSettingsHH2DatabaseAdapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongRawDatabase, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_homeID, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak(&self->_rawDatabase);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSString)strongRawDatabase
{
  return self->_strongRawDatabase;
}

- (HMCContext)context
{
  return self->_context;
}

- (NSUUID)homeID
{
  return self->_homeID;
}

- (NSUUID)accessoryID
{
  return self->_accessoryID;
}

- (void)setDelegate:(id)a3
{
}

- (HMDCompositeSettingsDatabaseAdapterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCompositeSettingsDatabaseAdapterDelegate *)WeakRetained;
}

- (id)rawDatabase
{
  id WeakRetained = objc_loadWeakRetained(&self->_rawDatabase);
  return WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)logIdentifier
{
  v2 = [(HMDCompositeSettingsHH2DatabaseAdapter *)self accessoryID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)_setDefaultVersionsOnModel:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setRoot_siri_soundAlert_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_siri_soundAlert_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_siri_lightWhenUsingSiri_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_siri_lightWhenUsingSiri_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_siri_siriEnabled_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_siri_siriEnabled_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_siri_language_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_siri_language_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_doorbellChime_enabled_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_doorbellChime_enabled_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_announce_enabled_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_announce_enabled_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_vision_voiceOver_enabled_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_vision_voiceOver_enabled_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_vision_speakingRateSection_speakingRate_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_holdDuration_enabled_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_holdDuration_enabled_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_holdDuration_seconds_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_holdDuration_seconds_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_touchAccommodations_enabled_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_touchAccommodations_enabled_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_ignoreRepeat_enabled_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_ignoreRepeat_seconds_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_analytics_shareSiriAnalytics_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_analytics_shareSiriAnalytics_writeVersion:", @"9.0");
  objc_msgSend(v4, "setRoot_general_analytics_shareSpeakerAnalytics_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_general_analytics_shareSpeakerAnalytics_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_airPlay_airPlayEnabled_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_airPlay_airPlayEnabled_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_siriEndpoint_enabled_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_siriEndpoint_enabled_writeVersion:", @"7.1");
  uint64_t v3 = MEMORY[0x263EFFA80];
  objc_msgSend(v4, "setRoot_music_allowExplicitContent_value:", MEMORY[0x263EFFA80]);
  objc_msgSend(v4, "setRoot_music_allowExplicitContent_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_music_allowExplicitContent_writeVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_locationServices_enabled_value:", v3);
  objc_msgSend(v4, "setRoot_locationServices_enabled_readVersion:", @"7.1");
  objc_msgSend(v4, "setRoot_locationServices_enabled_writeVersion:", @"7.1");
}

- (id)_modelFromAccessory:(id)a3
{
  id v4 = a3;
  v5 = [HMDCompositeSettingsAccessorySettingsModel alloc];
  v6 = [v4 modelID];
  v7 = [v4 modelID];
  v8 = [(HMBModel *)v5 initWithModelID:v6 parentModelID:v7];

  [(HMDCompositeSettingsHH2DatabaseAdapter *)self _setDefaultVersionsOnModel:v8];
  v9 = [v4 soundAlertEnabled];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_siri_soundAlert_value:v9];

  v10 = [v4 lightWhenUsingSiriEnabled];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_siri_lightWhenUsingSiri_value:v10];

  v11 = [v4 siriEnabled];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_siri_siriEnabled_value:v11];

  v12 = [v4 siriLanguageCode];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_siri_language_inputLanguageCodeValueName:v12];

  v13 = [v4 siriLanguageVoiceCode];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_siri_language_outputLanguageVoiceCodeValueName:v13];

  v14 = [v4 siriLanguageVoiceGenderCode];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_siri_language_outputLanguageGenderCodeValueName:v14];

  v15 = [v4 siriLanguageVoiceName];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_siri_language_voiceNameValueName:v15];

  v16 = [v4 hasDismissedHomePodHasNonMemberMediaAccountWarning];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_value:v16];

  v17 = [v4 doorbellChimeEnabled];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_doorbellChime_enabled_value:v17];

  v18 = [v4 announceEnabled];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_announce_enabled_value:v18];

  v19 = [v4 visionDoubleTapSettingsTimeoutInterval];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value:v19];

  v20 = [v4 visionVoiceOverEnabled];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_general_accessibility_vision_voiceOver_enabled_value:v20];

  v21 = [v4 visionVoiceOverAudioDuckingEnabled];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_value:v21];

  v22 = [v4 visionSpeakingRate];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_general_accessibility_vision_speakingRateSection_speakingRate_value:v22];

  v23 = [v4 interactionHoldDurationEnabled];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_general_accessibility_interaction_holdDuration_enabled_value:v23];

  v24 = [v4 interactionHoldDurationSeconds];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_general_accessibility_interaction_holdDuration_seconds_value:v24];

  v25 = [v4 interactionTouchAccommodationsEnabled];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_general_accessibility_interaction_touchAccommodations_enabled_value:v25];

  v26 = [v4 interactionIgnoreRepeatEnabled];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_general_accessibility_interaction_ignoreRepeat_enabled_value:v26];

  v27 = [v4 interactionIgnoreRepeatSeconds];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_general_accessibility_interaction_ignoreRepeat_seconds_value:v27];

  v28 = [v4 shareSiriAnalytics];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_general_analytics_shareSiriAnalytics_value:v28];

  v29 = [v4 shareSpeakerAnalytics];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_general_analytics_shareSpeakerAnalytics_value:v29];

  v30 = [v4 airPlayEnabled];
  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_airPlay_airPlayEnabled_value:v30];

  v31 = [v4 siriEndpointEnabled];

  [(HMDCompositeSettingsAccessorySettingsModel *)v8 setRoot_siriEndpoint_enabled_value:v31];
  return v8;
}

- (void)_copySettingsFromModel:(id)a3 toAccessory:(id)a4
{
  id v52 = a3;
  id v5 = a4;
  v6 = objc_msgSend(v52, "root_siri_soundAlert_value");

  if (v6)
  {
    v7 = objc_msgSend(v52, "root_siri_soundAlert_value");
    [v5 setSoundAlertEnabled:v7];
  }
  v8 = objc_msgSend(v52, "root_siri_lightWhenUsingSiri_value");

  if (v8)
  {
    v9 = objc_msgSend(v52, "root_siri_lightWhenUsingSiri_value");
    [v5 setLightWhenUsingSiriEnabled:v9];
  }
  v10 = objc_msgSend(v52, "root_siri_siriEnabled_value");

  if (v10)
  {
    v11 = objc_msgSend(v52, "root_siri_siriEnabled_value");
    [v5 setSiriEnabled:v11];
  }
  v12 = objc_msgSend(v52, "root_siri_language_inputLanguageCodeValueName");

  if (v12)
  {
    v13 = objc_msgSend(v52, "root_siri_language_inputLanguageCodeValueName");
    [v5 setSiriLanguageCode:v13];
  }
  v14 = objc_msgSend(v52, "root_siri_language_outputLanguageVoiceCodeValueName");

  if (v14)
  {
    v15 = objc_msgSend(v52, "root_siri_language_outputLanguageVoiceCodeValueName");
    [v5 setSiriLanguageVoiceCode:v15];
  }
  v16 = objc_msgSend(v52, "root_siri_language_outputLanguageGenderCodeValueName");

  if (v16)
  {
    v17 = objc_msgSend(v52, "root_siri_language_outputLanguageGenderCodeValueName");
    [v5 setSiriLanguageVoiceGenderCode:v17];
  }
  v18 = objc_msgSend(v52, "root_siri_language_voiceNameValueName");

  if (v18)
  {
    v19 = objc_msgSend(v52, "root_siri_language_voiceNameValueName");
    [v5 setSiriLanguageVoiceName:v19];
  }
  v20 = objc_msgSend(v52, "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value");

  if (v20)
  {
    v21 = objc_msgSend(v52, "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value");
    [v5 setHasDismissedHomePodHasNonMemberMediaAccountWarning:v21];
  }
  v22 = objc_msgSend(v52, "root_doorbellChime_enabled_value");

  if (v22)
  {
    v23 = objc_msgSend(v52, "root_doorbellChime_enabled_value");
    [v5 setDoorbellChimeEnabled:v23];
  }
  v24 = objc_msgSend(v52, "root_announce_enabled_value");

  if (v24)
  {
    v25 = objc_msgSend(v52, "root_announce_enabled_value");
    [v5 setAnnounceEnabled:v25];
  }
  v26 = objc_msgSend(v52, "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value");

  if (v26)
  {
    v27 = objc_msgSend(v52, "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value");
    [v5 setVisionDoubleTapSettingsTimeoutInterval:v27];
  }
  v28 = objc_msgSend(v52, "root_general_accessibility_vision_voiceOver_enabled_value");

  if (v28)
  {
    v29 = objc_msgSend(v52, "root_general_accessibility_vision_voiceOver_enabled_value");
    [v5 setVisionVoiceOverEnabled:v29];
  }
  v30 = objc_msgSend(v52, "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value");

  if (v30)
  {
    v31 = objc_msgSend(v52, "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value");
    [v5 setVisionVoiceOverAudioDuckingEnabled:v31];
  }
  v32 = objc_msgSend(v52, "root_general_accessibility_vision_speakingRateSection_speakingRate_value");

  if (v32)
  {
    v33 = objc_msgSend(v52, "root_general_accessibility_vision_speakingRateSection_speakingRate_value");
    [v5 setVisionSpeakingRate:v33];
  }
  v34 = objc_msgSend(v52, "root_general_accessibility_interaction_holdDuration_enabled_value");

  if (v34)
  {
    v35 = objc_msgSend(v52, "root_general_accessibility_interaction_holdDuration_enabled_value");
    [v5 setInteractionHoldDurationEnabled:v35];
  }
  v36 = objc_msgSend(v52, "root_general_accessibility_interaction_holdDuration_seconds_value");

  if (v36)
  {
    v37 = objc_msgSend(v52, "root_general_accessibility_interaction_holdDuration_seconds_value");
    [v5 setInteractionHoldDurationSeconds:v37];
  }
  v38 = objc_msgSend(v52, "root_general_accessibility_interaction_touchAccommodations_enabled_value");

  if (v38)
  {
    v39 = objc_msgSend(v52, "root_general_accessibility_interaction_touchAccommodations_enabled_value");
    [v5 setInteractionTouchAccommodationsEnabled:v39];
  }
  v40 = objc_msgSend(v52, "root_general_accessibility_interaction_ignoreRepeat_enabled_value");

  if (v40)
  {
    v41 = objc_msgSend(v52, "root_general_accessibility_interaction_ignoreRepeat_enabled_value");
    [v5 setInteractionIgnoreRepeatEnabled:v41];
  }
  v42 = objc_msgSend(v52, "root_general_accessibility_interaction_ignoreRepeat_seconds_value");

  if (v42)
  {
    v43 = objc_msgSend(v52, "root_general_accessibility_interaction_ignoreRepeat_seconds_value");
    [v5 setInteractionIgnoreRepeatSeconds:v43];
  }
  v44 = objc_msgSend(v52, "root_general_analytics_shareSiriAnalytics_value");

  if (v44)
  {
    v45 = objc_msgSend(v52, "root_general_analytics_shareSiriAnalytics_value");
    [v5 setShareSiriAnalytics:v45];
  }
  v46 = objc_msgSend(v52, "root_general_analytics_shareSpeakerAnalytics_value");

  if (v46)
  {
    v47 = objc_msgSend(v52, "root_general_analytics_shareSpeakerAnalytics_value");
    [v5 setShareSpeakerAnalytics:v47];
  }
  v48 = objc_msgSend(v52, "root_airPlay_airPlayEnabled_value");

  if (v48)
  {
    v49 = objc_msgSend(v52, "root_airPlay_airPlayEnabled_value");
    [v5 setAirPlayEnabled:v49];
  }
  v50 = objc_msgSend(v52, "root_siriEndpoint_enabled_value");

  if (v50)
  {
    v51 = objc_msgSend(v52, "root_siriEndpoint_enabled_value");
    [v5 setSiriEndpointEnabled:v51];
  }
}

- (void)_handleAccessoryUpdateTransaction:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v21 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Observed accessory update", buf, 0xCu);
  }
  v9 = [v4 userInfo];
  v10 = [v9 valueForKey:@"HMDHAPAccessoryUpdateTransactionTriggeredKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    v13 = [(HMDCompositeSettingsHH2DatabaseAdapter *)v6 queue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __76__HMDCompositeSettingsHH2DatabaseAdapter__handleAccessoryUpdateTransaction___block_invoke;
    v18[3] = &unk_264A2F820;
    v18[4] = v6;
    id v19 = v12;
    dispatch_async(v13, v18);
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = v6;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_FAULT, "%{public}@Received accessory update transaction that was nil or an invalid type: %@", buf, 0x16u);
    }
  }
}

void __76__HMDCompositeSettingsHH2DatabaseAdapter__handleAccessoryUpdateTransaction___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) uuid];
  id v4 = [v2 fetchModelWithID:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v53 = v5;

  v6 = [*(id *)(a1 + 40) soundAlertEnabled];

  if (v6)
  {
    v7 = [*(id *)(a1 + 40) soundAlertEnabled];
    objc_msgSend(v53, "setRoot_siri_soundAlert_value:", v7);
  }
  v8 = [*(id *)(a1 + 40) lightWhenUsingSiriEnabled];

  if (v8)
  {
    v9 = [*(id *)(a1 + 40) lightWhenUsingSiriEnabled];
    objc_msgSend(v53, "setRoot_siri_lightWhenUsingSiri_value:", v9);
  }
  v10 = [*(id *)(a1 + 40) siriEnabled];

  if (v10)
  {
    v11 = [*(id *)(a1 + 40) siriEnabled];
    objc_msgSend(v53, "setRoot_siri_siriEnabled_value:", v11);
  }
  id v12 = [*(id *)(a1 + 40) siriLanguageCode];

  if (v12)
  {
    v13 = [*(id *)(a1 + 40) siriLanguageCode];
    objc_msgSend(v53, "setRoot_siri_language_inputLanguageCodeValueName:", v13);
  }
  v14 = [*(id *)(a1 + 40) siriLanguageVoiceCode];

  if (v14)
  {
    v15 = [*(id *)(a1 + 40) siriLanguageVoiceCode];
    objc_msgSend(v53, "setRoot_siri_language_outputLanguageVoiceCodeValueName:", v15);
  }
  v16 = [*(id *)(a1 + 40) siriLanguageVoiceGenderCode];

  if (v16)
  {
    v17 = [*(id *)(a1 + 40) siriLanguageVoiceGenderCode];
    objc_msgSend(v53, "setRoot_siri_language_outputLanguageGenderCodeValueName:", v17);
  }
  v18 = [*(id *)(a1 + 40) siriLanguageVoiceName];

  if (v18)
  {
    id v19 = [*(id *)(a1 + 40) siriLanguageVoiceName];
    objc_msgSend(v53, "setRoot_siri_language_voiceNameValueName:", v19);
  }
  v20 = [*(id *)(a1 + 40) hasDismissedHomePodHasNonMemberMediaAccountWarning];

  if (v20)
  {
    v21 = [*(id *)(a1 + 40) hasDismissedHomePodHasNonMemberMediaAccountWarning];
    objc_msgSend(v53, "setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_value:", v21);
  }
  __int16 v22 = [*(id *)(a1 + 40) doorbellChimeEnabled];

  if (v22)
  {
    id v23 = [*(id *)(a1 + 40) doorbellChimeEnabled];
    objc_msgSend(v53, "setRoot_doorbellChime_enabled_value:", v23);
  }
  uint64_t v24 = [*(id *)(a1 + 40) announceEnabled];

  if (v24)
  {
    v25 = [*(id *)(a1 + 40) announceEnabled];
    objc_msgSend(v53, "setRoot_announce_enabled_value:", v25);
  }
  v26 = [*(id *)(a1 + 40) visionDoubleTapSettingsTimeoutInterval];

  if (v26)
  {
    v27 = [*(id *)(a1 + 40) visionDoubleTapSettingsTimeoutInterval];
    objc_msgSend(v53, "setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value:", v27);
  }
  v28 = [*(id *)(a1 + 40) visionVoiceOverEnabled];

  if (v28)
  {
    v29 = [*(id *)(a1 + 40) visionVoiceOverEnabled];
    objc_msgSend(v53, "setRoot_general_accessibility_vision_voiceOver_enabled_value:", v29);
  }
  v30 = [*(id *)(a1 + 40) visionVoiceOverAudioDuckingEnabled];

  if (v30)
  {
    v31 = [*(id *)(a1 + 40) visionVoiceOverAudioDuckingEnabled];
    objc_msgSend(v53, "setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_value:", v31);
  }
  v32 = [*(id *)(a1 + 40) visionSpeakingRate];

  if (v32)
  {
    v33 = [*(id *)(a1 + 40) visionSpeakingRate];
    objc_msgSend(v53, "setRoot_general_accessibility_vision_speakingRateSection_speakingRate_value:", v33);
  }
  v34 = [*(id *)(a1 + 40) interactionHoldDurationEnabled];

  if (v34)
  {
    v35 = [*(id *)(a1 + 40) interactionHoldDurationEnabled];
    objc_msgSend(v53, "setRoot_general_accessibility_interaction_holdDuration_enabled_value:", v35);
  }
  v36 = [*(id *)(a1 + 40) interactionHoldDurationSeconds];

  if (v36)
  {
    v37 = [*(id *)(a1 + 40) interactionHoldDurationSeconds];
    objc_msgSend(v53, "setRoot_general_accessibility_interaction_holdDuration_seconds_value:", v37);
  }
  v38 = [*(id *)(a1 + 40) interactionTouchAccommodationsEnabled];

  if (v38)
  {
    v39 = [*(id *)(a1 + 40) interactionTouchAccommodationsEnabled];
    objc_msgSend(v53, "setRoot_general_accessibility_interaction_touchAccommodations_enabled_value:", v39);
  }
  v40 = [*(id *)(a1 + 40) interactionIgnoreRepeatEnabled];

  if (v40)
  {
    v41 = [*(id *)(a1 + 40) interactionIgnoreRepeatEnabled];
    objc_msgSend(v53, "setRoot_general_accessibility_interaction_ignoreRepeat_enabled_value:", v41);
  }
  v42 = [*(id *)(a1 + 40) interactionIgnoreRepeatSeconds];

  if (v42)
  {
    v43 = [*(id *)(a1 + 40) interactionIgnoreRepeatSeconds];
    objc_msgSend(v53, "setRoot_general_accessibility_interaction_ignoreRepeat_seconds_value:", v43);
  }
  v44 = [*(id *)(a1 + 40) shareSiriAnalytics];

  if (v44)
  {
    v45 = [*(id *)(a1 + 40) shareSiriAnalytics];
    objc_msgSend(v53, "setRoot_general_analytics_shareSiriAnalytics_value:", v45);
  }
  v46 = [*(id *)(a1 + 40) shareSpeakerAnalytics];

  if (v46)
  {
    v47 = [*(id *)(a1 + 40) shareSpeakerAnalytics];
    objc_msgSend(v53, "setRoot_general_analytics_shareSpeakerAnalytics_value:", v47);
  }
  v48 = [*(id *)(a1 + 40) airPlayEnabled];

  if (v48)
  {
    v49 = [*(id *)(a1 + 40) airPlayEnabled];
    objc_msgSend(v53, "setRoot_airPlay_airPlayEnabled_value:", v49);
  }
  v50 = [*(id *)(a1 + 40) siriEndpointEnabled];

  if (v50)
  {
    v51 = [*(id *)(a1 + 40) siriEndpointEnabled];
    objc_msgSend(v53, "setRoot_siriEndpoint_enabled_value:", v51);
  }
  id v52 = [*(id *)(a1 + 32) delegate];
  [v52 database:*(void *)(a1 + 32) didProcessUpdateForModel:v53];
}

- (id)emptyModelWithID:(id)a3 parentModelID:(id)a4 modelClass:(Class)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)[[a5 alloc] initWithModelID:v7 parentModelID:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  if (!v11)
  {
    _HMFPreconditionFailure();
LABEL_13:
    v18 = (HMDCompositeSettingsHH2DatabaseAdapter *)_HMFPreconditionFailure();
    [(HMDCompositeSettingsHH2DatabaseAdapter *)v18 addModel:v20 withOptionsLabel:v21 completion:v22];
    return result;
  }
  id v12 = v11;
  int v13 = [v12 conformsToProtocol:&unk_26E5338B8];
  char v14 = v13;
  if (v13) {
    v15 = v12;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }

  return v12;
}

- (void)addModel:(id)a3 withOptionsLabel:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  char v14 = (void *)MEMORY[0x230FBD990]();
  v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v27 = v17;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Attempting add model via database adapter with options label: %@", buf, 0x16u);
  }
  if (v13)
  {
    v18 = [(HMDCompositeSettingsHH2DatabaseAdapter *)v15 context];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __79__HMDCompositeSettingsHH2DatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke;
    v23[3] = &unk_264A2EE80;
    v23[4] = v15;
    id v24 = v13;
    id v25 = v10;
    [v18 performBlock:v23];
  }
  else
  {
    SEL v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = v15;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to cast settings model %@ while adding to the database.", buf, 0x16u);
    }
  }
}

void __79__HMDCompositeSettingsHH2DatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) accessoryID];
  uint64_t v3 = +[HMCContext findHAPAccessoryWithModelID:v2];

  if (v3)
  {
    [*(id *)(a1 + 32) _copySettingsFromModel:*(void *)(a1 + 40) toAccessory:v3];
    id v4 = [*(id *)(a1 + 32) context];
    id v27 = 0;
    char v5 = [v4 save:&v27];
    id v6 = v27;

    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    id v10 = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v29 = v11;
        id v12 = "%{public}@Successfully saved settings update";
        id v13 = v10;
        os_log_type_t v14 = OS_LOG_TYPE_INFO;
        uint32_t v15 = 12;
LABEL_10:
        _os_log_impl(&dword_22F52A000, v13, v14, v12, buf, v15);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = v6;
      id v12 = "%{public}@Failed to save settings update: %@";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  id v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = *(id *)(a1 + 32);
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    SEL v19 = HMFGetLogIdentifier();
    id v20 = [*(id *)(a1 + 32) accessoryID];
    *(_DWORD *)buf = 138543618;
    id v29 = v19;
    __int16 v30 = 2112;
    id v31 = v20;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the MKFHAPAccessory with identifier: %@", buf, 0x16u);
  }
  id v6 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
LABEL_12:
  id v21 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__HMDCompositeSettingsHH2DatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke_6;
  block[3] = &unk_264A2F870;
  id v22 = *(id *)(a1 + 48);
  id v25 = v6;
  id v26 = v22;
  id v23 = v6;
  dispatch_async(v21, block);
}

uint64_t __79__HMDCompositeSettingsHH2DatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)fetchModelWithID:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__42033;
  id v21 = __Block_byref_object_dispose__42034;
  id v22 = 0;
  char v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  HMFGetOSLogHandle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Fetching model with id %@", buf, 0x16u);
  }
  id v9 = [(HMDCompositeSettingsHH2DatabaseAdapter *)v6 context];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__HMDCompositeSettingsHH2DatabaseAdapter_fetchModelWithID___block_invoke;
  v13[3] = &unk_264A2F698;
  id v10 = v4;
  id v14 = v10;
  uint32_t v15 = v6;
  id v16 = &v17;
  [v9 unsafeSynchronousBlock:v13];

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __59__HMDCompositeSettingsHH2DatabaseAdapter_fetchModelWithID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = +[HMCContext findHAPAccessoryWithModelID:*(void *)(a1 + 32)];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) _modelFromAccessory:v2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    char v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 40);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138543618;
      id v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the MKFHAPAccessory with identifier: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)startWithDelegate:(id)a3
{
  id v4 = a3;
  char v5 = [(HMDCompositeSettingsHH2DatabaseAdapter *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__HMDCompositeSettingsHH2DatabaseAdapter_startWithDelegate___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __60__HMDCompositeSettingsHH2DatabaseAdapter_startWithDelegate___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    char v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting composite settings database adapter", (uint8_t *)&v7, 0xCu);
  }
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  return [*(id *)(a1 + 40) database:*(void *)(a1 + 32) didConfigureWithError:0];
}

- (HMDCompositeSettingsHH2DatabaseAdapter)initWithAccessory:(id)a3 homeID:(id)a4 workingManagedObjectContext:(id)a5 queue:(id)a6 notificationCenter:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDCompositeSettingsHH2DatabaseAdapter;
  uint64_t v17 = [(HMDCompositeSettingsHH2DatabaseAdapter *)&v23 init];
  v18 = v17;
  if (v17)
  {
    strongRawDatabase = v17->_strongRawDatabase;
    v17->_strongRawDatabase = (NSString *)@"db";

    objc_storeWeak(&v18->_rawDatabase, v18->_strongRawDatabase);
    uint64_t v20 = [v12 uuid];
    accessoryID = v18->_accessoryID;
    v18->_accessoryID = (NSUUID *)v20;

    objc_storeStrong((id *)&v18->_homeID, a4);
    objc_storeStrong((id *)&v18->_context, a5);
    objc_storeStrong((id *)&v18->_queue, a6);
    [v16 addObserver:v18 selector:sel__handleAccessoryUpdateTransaction_ name:@"HMDHAPAccessoryUpdateTransactionTriggered" object:v12];
  }

  return v18;
}

@end