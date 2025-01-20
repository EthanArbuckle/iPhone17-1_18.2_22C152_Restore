@interface HMDCompositeSettingsAccessorySettingsModel
+ (id)allKeyPaths;
+ (id)hmbProperties;
- (id)keyPathsToSettingMetadata;
- (id)keyPathsToSettings;
- (id)keyPathsToSettingsForMigration;
- (void)setSetting:(id)a3 forKeyPath:(id)a4 withError:(id *)a5;
@end

@implementation HMDCompositeSettingsAccessorySettingsModel

+ (id)allKeyPaths
{
  if (allKeyPaths_onceToken != -1) {
    dispatch_once(&allKeyPaths_onceToken, &__block_literal_global_310_121506);
  }
  v2 = (void *)allKeyPaths_allKeyPaths;
  return v2;
}

void __57__HMDCompositeSettingsAccessorySettingsModel_allKeyPaths__block_invoke()
{
  v0 = (void *)allKeyPaths_allKeyPaths;
  allKeyPaths_allKeyPaths = (uint64_t)&unk_26E474140;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_121573 != -1) {
    dispatch_once(&hmbProperties_onceToken_121573, &__block_literal_global_121574);
  }
  v2 = (void *)hmbProperties_properties_121575;
  return v2;
}

void __59__HMDCompositeSettingsAccessorySettingsModel_hmbProperties__block_invoke()
{
  v75[72] = *MEMORY[0x263EF8340];
  v74[0] = @"root_siri_soundAlert_value";
  v73 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[0] = v73;
  v74[1] = @"root_siri_soundAlert_readVersion";
  v72 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[1] = v72;
  v74[2] = @"root_siri_soundAlert_writeVersion";
  v71 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[2] = v71;
  v74[3] = @"root_siri_lightWhenUsingSiri_value";
  v70 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[3] = v70;
  v74[4] = @"root_siri_lightWhenUsingSiri_readVersion";
  v69 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[4] = v69;
  v74[5] = @"root_siri_lightWhenUsingSiri_writeVersion";
  v68 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[5] = v68;
  v74[6] = @"root_siri_siriEnabled_value";
  v67 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[6] = v67;
  v74[7] = @"root_siri_siriEnabled_readVersion";
  v66 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[7] = v66;
  v74[8] = @"root_siri_siriEnabled_writeVersion";
  v65 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[8] = v65;
  v74[9] = @"root_siri_language_inputLanguageCodeValueName";
  v64 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[9] = v64;
  v74[10] = @"root_siri_language_outputLanguageVoiceCodeValueName";
  v63 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[10] = v63;
  v74[11] = @"root_siri_language_outputLanguageGenderCodeValueName";
  v62 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[11] = v62;
  v74[12] = @"root_siri_language_voiceNameValueName";
  v61 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[12] = v61;
  v74[13] = @"root_siri_language_readVersion";
  v60 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[13] = v60;
  v74[14] = @"root_siri_language_writeVersion";
  v59 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[14] = v59;
  v74[15] = @"root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value";
  v58 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[15] = v58;
  v74[16] = @"root_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion";
  v57 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[16] = v57;
  v74[17] = @"root_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion";
  v56 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[17] = v56;
  v74[18] = @"root_locationServices_enabled_value";
  v55 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[18] = v55;
  v74[19] = @"root_locationServices_enabled_readVersion";
  v54 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[19] = v54;
  v74[20] = @"root_locationServices_enabled_writeVersion";
  v53 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[20] = v53;
  v74[21] = @"root_doorbellChime_enabled_value";
  v52 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[21] = v52;
  v74[22] = @"root_doorbellChime_enabled_readVersion";
  v51 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[22] = v51;
  v74[23] = @"root_doorbellChime_enabled_writeVersion";
  v50 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[23] = v50;
  v74[24] = @"root_announce_enabled_value";
  v49 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[24] = v49;
  v74[25] = @"root_announce_enabled_readVersion";
  v48 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[25] = v48;
  v74[26] = @"root_announce_enabled_writeVersion";
  v47 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[26] = v47;
  v74[27] = @"root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value";
  v46 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[27] = v46;
  v74[28] = @"root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion";
  v45 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[28] = v45;
  v74[29] = @"root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion";
  v44 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[29] = v44;
  v74[30] = @"root_general_accessibility_vision_voiceOver_enabled_value";
  v43 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[30] = v43;
  v74[31] = @"root_general_accessibility_vision_voiceOver_enabled_readVersion";
  v42 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[31] = v42;
  v74[32] = @"root_general_accessibility_vision_voiceOver_enabled_writeVersion";
  v41 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[32] = v41;
  v74[33] = @"root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value";
  v40 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[33] = v40;
  v74[34] = @"root_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion";
  v39 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[34] = v39;
  v74[35] = @"root_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion";
  v38 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[35] = v38;
  v74[36] = @"root_general_accessibility_vision_speakingRateSection_speakingRate_value";
  v37 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[36] = v37;
  v74[37] = @"root_general_accessibility_vision_speakingRateSection_speakingRate_readVersion";
  v36 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[37] = v36;
  v74[38] = @"root_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion";
  v35 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[38] = v35;
  v74[39] = @"root_general_accessibility_interaction_holdDuration_enabled_value";
  v34 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[39] = v34;
  v74[40] = @"root_general_accessibility_interaction_holdDuration_enabled_readVersion";
  v33 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[40] = v33;
  v74[41] = @"root_general_accessibility_interaction_holdDuration_enabled_writeVersion";
  v32 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[41] = v32;
  v74[42] = @"root_general_accessibility_interaction_holdDuration_seconds_value";
  v31 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[42] = v31;
  v74[43] = @"root_general_accessibility_interaction_holdDuration_seconds_readVersion";
  v30 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[43] = v30;
  v74[44] = @"root_general_accessibility_interaction_holdDuration_seconds_writeVersion";
  v29 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[44] = v29;
  v74[45] = @"root_general_accessibility_interaction_touchAccommodations_enabled_value";
  v28 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[45] = v28;
  v74[46] = @"root_general_accessibility_interaction_touchAccommodations_enabled_readVersion";
  v27 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[46] = v27;
  v74[47] = @"root_general_accessibility_interaction_touchAccommodations_enabled_writeVersion";
  v26 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[47] = v26;
  v74[48] = @"root_general_accessibility_interaction_ignoreRepeat_enabled_value";
  v25 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[48] = v25;
  v74[49] = @"root_general_accessibility_interaction_ignoreRepeat_enabled_readVersion";
  v24 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[49] = v24;
  v74[50] = @"root_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion";
  v23 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[50] = v23;
  v74[51] = @"root_general_accessibility_interaction_ignoreRepeat_seconds_value";
  v22 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[51] = v22;
  v74[52] = @"root_general_accessibility_interaction_ignoreRepeat_seconds_readVersion";
  v21 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[52] = v21;
  v74[53] = @"root_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion";
  v20 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[53] = v20;
  v74[54] = @"root_general_analytics_shareSiriAnalytics_value";
  v19 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[54] = v19;
  v74[55] = @"root_general_analytics_shareSiriAnalytics_readVersion";
  v18 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[55] = v18;
  v74[56] = @"root_general_analytics_shareSiriAnalytics_writeVersion";
  v17 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[56] = v17;
  v74[57] = @"root_general_analytics_shareSpeakerAnalytics_value";
  v16 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[57] = v16;
  v74[58] = @"root_general_analytics_shareSpeakerAnalytics_readVersion";
  v15 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[58] = v15;
  v74[59] = @"root_general_analytics_shareSpeakerAnalytics_writeVersion";
  v14 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[59] = v14;
  v74[60] = @"root_music_allowExplicitContent_value";
  v13 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[60] = v13;
  v74[61] = @"root_music_allowExplicitContent_readVersion";
  v12 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[61] = v12;
  v74[62] = @"root_music_allowExplicitContent_writeVersion";
  v11 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[62] = v11;
  v74[63] = @"root_airPlay_airPlayEnabled_value";
  v0 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[63] = v0;
  v74[64] = @"root_airPlay_airPlayEnabled_readVersion";
  v1 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[64] = v1;
  v74[65] = @"root_airPlay_airPlayEnabled_writeVersion";
  v2 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[65] = v2;
  v74[66] = @"root_siriEndpoint_enabled_value";
  v3 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[66] = v3;
  v74[67] = @"root_siriEndpoint_enabled_readVersion";
  v4 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[67] = v4;
  v74[68] = @"root_siriEndpoint_enabled_writeVersion";
  v5 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[68] = v5;
  v74[69] = @"root_general_accessibility_interaction_tapAssistance_selection_value";
  v6 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[69] = v6;
  v74[70] = @"root_general_accessibility_interaction_tapAssistance_selection_readVersion";
  v7 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[70] = v7;
  v74[71] = @"root_general_accessibility_interaction_tapAssistance_selection_writeVersion";
  v8 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v75[71] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:72];
  v10 = (void *)hmbProperties_properties_121575;
  hmbProperties_properties_121575 = v9;
}

- (void)setSetting:(id)a3 forKeyPath:(id)a4 withError:(id *)a5
{
  id v127 = a3;
  id v8 = a4;
  if ([v8 isEqualToString:&stru_26E2EB898])
  {
    if (!a5) {
      goto LABEL_141;
    }
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = 3;
    goto LABEL_4;
  }
  if ([v8 isEqualToString:@"root.siri.soundAlert"])
  {
    id v11 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siri_soundAlert_value:v14];

      v15 = [v13 writeVersion];
      v16 = [v15 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siri_soundAlert_writeVersion:v16];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siri_soundAlert_readVersion:v18];
LABEL_137:

LABEL_140:
      goto LABEL_141;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.siri.lightWhenUsingSiri"])
  {
    id v19 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    id v13 = v20;

    if (v13)
    {
      v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siri_lightWhenUsingSiri_value:v21];

      v22 = [v13 writeVersion];
      v23 = [v22 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siri_lightWhenUsingSiri_writeVersion:v23];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siri_lightWhenUsingSiri_readVersion:v18];
      goto LABEL_137;
    }
LABEL_138:
    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
    }
    goto LABEL_140;
  }
  if ([v8 isEqualToString:@"root.siri.siriEnabled"])
  {
    id v24 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v25 = v24;
    }
    else {
      v25 = 0;
    }
    id v13 = v25;

    if (v13)
    {
      v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siri_siriEnabled_value:v26];

      v27 = [v13 writeVersion];
      v28 = [v27 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siri_siriEnabled_writeVersion:v28];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siri_siriEnabled_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.siri.language"])
  {
    id v29 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v30 = v29;
    }
    else {
      v30 = 0;
    }
    id v13 = v30;

    if (v13)
    {
      v31 = [v13 inputLanguageCode];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siri_language_inputLanguageCodeValueName:v31];

      v32 = [v13 outputVoiceGenderCode];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siri_language_outputLanguageGenderCodeValueName:v32];

      v33 = [v13 outputVoiceLanguageCode];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siri_language_outputLanguageVoiceCodeValueName:v33];

      v34 = [v13 voiceName];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siri_language_voiceNameValueName:v34];

      v35 = [v13 writeVersion];
      v36 = [v35 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siri_language_writeVersion:v36];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siri_language_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.home.dismissedHomePodHasNonMemberMediaAccountWarning"])
  {
    id v37 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v38 = v37;
    }
    else {
      v38 = 0;
    }
    id v13 = v38;

    if (v13)
    {
      v39 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_value:v39];

      v40 = [v13 writeVersion];
      v41 = [v40 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion:v41];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.locationServices.enabled"])
  {
    id v42 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v43 = v42;
    }
    else {
      v43 = 0;
    }
    id v13 = v43;

    if (v13)
    {
      v44 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_locationServices_enabled_value:v44];

      v45 = [v13 writeVersion];
      v46 = [v45 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_locationServices_enabled_writeVersion:v46];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_locationServices_enabled_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.doorbellChime.enabled"])
  {
    id v47 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v48 = v47;
    }
    else {
      v48 = 0;
    }
    id v13 = v48;

    if (v13)
    {
      v49 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_doorbellChime_enabled_value:v49];

      v50 = [v13 writeVersion];
      v51 = [v50 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_doorbellChime_enabled_writeVersion:v51];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_doorbellChime_enabled_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.announce.enabled"])
  {
    id v52 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v53 = v52;
    }
    else {
      v53 = 0;
    }
    id v13 = v53;

    if (v13)
    {
      v54 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_announce_enabled_value:v54];

      v55 = [v13 writeVersion];
      v56 = [v55 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_announce_enabled_writeVersion:v56];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_announce_enabled_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.general.accessibility.vision.doubleTapSettings.timeoutSettings.timeoutInterval"])
  {
    id v57 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v58 = v57;
    }
    else {
      v58 = 0;
    }
    id v13 = v58;

    if (v13)
    {
      v59 = [v13 numberValue];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value:v59];

      v60 = [v13 writeVersion];
      v61 = [v60 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion:v61];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.general.accessibility.vision.voiceOver.enabled"])
  {
    id v62 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v63 = v62;
    }
    else {
      v63 = 0;
    }
    id v13 = v63;

    if (v13)
    {
      v64 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_vision_voiceOver_enabled_value:v64];

      v65 = [v13 writeVersion];
      v66 = [v65 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_vision_voiceOver_enabled_writeVersion:v66];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_vision_voiceOver_enabled_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.general.accessibility.vision.voiceOver.audioDuckingEnabled"])
  {
    id v67 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v68 = v67;
    }
    else {
      v68 = 0;
    }
    id v13 = v68;

    if (v13)
    {
      v69 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_value:v69];

      v70 = [v13 writeVersion];
      v71 = [v70 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion:v71];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.general.accessibility.vision.speakingRateSection.speakingRate"])
  {
    id v72 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v73 = v72;
    }
    else {
      v73 = 0;
    }
    id v13 = v73;

    if (v13)
    {
      v74 = [v13 numberValue];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_vision_speakingRateSection_speakingRate_value:v74];

      v75 = [v13 writeVersion];
      v76 = [v75 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion:v76];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_vision_speakingRateSection_speakingRate_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.general.accessibility.interaction.holdDuration.enabled"])
  {
    id v77 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v78 = v77;
    }
    else {
      v78 = 0;
    }
    id v13 = v78;

    if (v13)
    {
      v79 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_interaction_holdDuration_enabled_value:v79];

      v80 = [v13 writeVersion];
      v81 = [v80 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_interaction_holdDuration_enabled_writeVersion:v81];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_interaction_holdDuration_enabled_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.general.accessibility.interaction.holdDuration.seconds"])
  {
    id v82 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v83 = v82;
    }
    else {
      v83 = 0;
    }
    id v13 = v83;

    if (v13)
    {
      v84 = [v13 numberValue];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_interaction_holdDuration_seconds_value:v84];

      v85 = [v13 writeVersion];
      v86 = [v85 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_interaction_holdDuration_seconds_writeVersion:v86];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_interaction_holdDuration_seconds_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.general.accessibility.interaction.touchAccommodations.enabled"])
  {
    id v87 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v88 = v87;
    }
    else {
      v88 = 0;
    }
    id v13 = v88;

    if (v13)
    {
      v89 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_interaction_touchAccommodations_enabled_value:v89];

      v90 = [v13 writeVersion];
      v91 = [v90 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_interaction_touchAccommodations_enabled_writeVersion:v91];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_interaction_touchAccommodations_enabled_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.general.accessibility.interaction.ignoreRepeat.enabled"])
  {
    id v92 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v93 = v92;
    }
    else {
      v93 = 0;
    }
    id v13 = v93;

    if (v13)
    {
      v94 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_interaction_ignoreRepeat_enabled_value:v94];

      v95 = [v13 writeVersion];
      v96 = [v95 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion:v96];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_interaction_ignoreRepeat_enabled_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.general.accessibility.interaction.ignoreRepeat.seconds"])
  {
    id v97 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v98 = v97;
    }
    else {
      v98 = 0;
    }
    id v13 = v98;

    if (v13)
    {
      v99 = [v13 numberValue];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_interaction_ignoreRepeat_seconds_value:v99];

      v100 = [v13 writeVersion];
      v101 = [v100 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion:v101];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_accessibility_interaction_ignoreRepeat_seconds_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.general.analytics.shareSiriAnalytics"])
  {
    id v102 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v103 = v102;
    }
    else {
      v103 = 0;
    }
    id v13 = v103;

    if (v13)
    {
      v104 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_analytics_shareSiriAnalytics_value:v104];

      v105 = [v13 writeVersion];
      v106 = [v105 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_analytics_shareSiriAnalytics_writeVersion:v106];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_analytics_shareSiriAnalytics_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.general.analytics.shareSpeakerAnalytics"])
  {
    id v107 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v108 = v107;
    }
    else {
      v108 = 0;
    }
    id v13 = v108;

    if (v13)
    {
      v109 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_analytics_shareSpeakerAnalytics_value:v109];

      v110 = [v13 writeVersion];
      v111 = [v110 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_analytics_shareSpeakerAnalytics_writeVersion:v111];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_general_analytics_shareSpeakerAnalytics_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.music.allowExplicitContent"])
  {
    id v112 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v113 = v112;
    }
    else {
      v113 = 0;
    }
    id v13 = v113;

    if (v13)
    {
      v114 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_music_allowExplicitContent_value:v114];

      v115 = [v13 writeVersion];
      v116 = [v115 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_music_allowExplicitContent_writeVersion:v116];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_music_allowExplicitContent_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.airPlay.airPlayEnabled"])
  {
    id v117 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v118 = v117;
    }
    else {
      v118 = 0;
    }
    id v13 = v118;

    if (v13)
    {
      v119 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_airPlay_airPlayEnabled_value:v119];

      v120 = [v13 writeVersion];
      v121 = [v120 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_airPlay_airPlayEnabled_writeVersion:v121];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_airPlay_airPlayEnabled_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if ([v8 isEqualToString:@"root.siriEndpoint.enabled"])
  {
    id v122 = v127;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v123 = v122;
    }
    else {
      v123 = 0;
    }
    id v13 = v123;

    if (v13)
    {
      v124 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siriEndpoint_enabled_value:v124];

      v125 = [v13 writeVersion];
      v126 = [v125 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siriEndpoint_enabled_writeVersion:v126];

      v17 = [v13 readVersion];
      v18 = [v17 versionString];
      [(HMDCompositeSettingsAccessorySettingsModel *)self setRoot_siriEndpoint_enabled_readVersion:v18];
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  if (a5)
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = 5;
LABEL_4:
    *a5 = [v9 hmfErrorWithCode:v10];
  }
LABEL_141:
}

- (id)keyPathsToSettingsForMigration
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v4 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_soundAlert_value];
  if (!v4) {
    goto LABEL_7;
  }
  v5 = (void *)v4;
  uint64_t v6 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_soundAlert_readVersion];
  if (!v6)
  {

    goto LABEL_7;
  }
  v7 = (void *)v6;
  id v8 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_soundAlert_writeVersion];

  if (!v8)
  {
LABEL_7:
    id v13 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v13 forKeyedSubscript:@"root.siri.soundAlert"];
    goto LABEL_8;
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v10 = objc_alloc(MEMORY[0x263F42670]);
  id v11 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_soundAlert_readVersion];
  v12 = (void *)[v10 initWithVersionString:v11];
  if ([v9 isGreaterThanVersion:v12])
  {
  }
  else
  {
    id v47 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v48 = objc_alloc(MEMORY[0x263F42670]);
    v49 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_soundAlert_writeVersion];
    v50 = (void *)[v48 initWithVersionString:v49];
    int v51 = [v47 isGreaterThanVersion:v50];

    if (!v51) {
      goto LABEL_9;
    }
  }
  id v52 = [HMDCompositeBoolSetting alloc];
  id v13 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_soundAlert_value];
  v53 = [(HMDCompositeBoolSetting *)v52 initWithValue:[(HMDCompositeBoolSetting *)v13 BOOLValue] readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v53 forKeyedSubscript:@"root.siri.soundAlert"];

LABEL_8:
LABEL_9:
  uint64_t v14 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_lightWhenUsingSiri_value];
  if (!v14) {
    goto LABEL_15;
  }
  v15 = (void *)v14;
  uint64_t v16 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_lightWhenUsingSiri_readVersion];
  if (!v16)
  {

    goto LABEL_15;
  }
  v17 = (void *)v16;
  v18 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_lightWhenUsingSiri_writeVersion];

  if (!v18)
  {
LABEL_15:
    v23 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v23 forKeyedSubscript:@"root.siri.lightWhenUsingSiri"];
    goto LABEL_16;
  }
  id v19 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v20 = objc_alloc(MEMORY[0x263F42670]);
  v21 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_lightWhenUsingSiri_readVersion];
  v22 = (void *)[v20 initWithVersionString:v21];
  if ([v19 isGreaterThanVersion:v22])
  {
  }
  else
  {
    v54 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v55 = objc_alloc(MEMORY[0x263F42670]);
    v56 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_lightWhenUsingSiri_writeVersion];
    id v57 = (void *)[v55 initWithVersionString:v56];
    int v58 = [v54 isGreaterThanVersion:v57];

    if (!v58) {
      goto LABEL_17;
    }
  }
  v59 = [HMDCompositeBoolSetting alloc];
  v23 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_lightWhenUsingSiri_value];
  v60 = [(HMDCompositeBoolSetting *)v59 initWithValue:[(HMDCompositeBoolSetting *)v23 BOOLValue] readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v60 forKeyedSubscript:@"root.siri.lightWhenUsingSiri"];

LABEL_16:
LABEL_17:
  uint64_t v24 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_siriEnabled_value];
  if (!v24) {
    goto LABEL_23;
  }
  v25 = (void *)v24;
  uint64_t v26 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_siriEnabled_readVersion];
  if (!v26)
  {

    goto LABEL_23;
  }
  v27 = (void *)v26;
  v28 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_siriEnabled_writeVersion];

  if (!v28)
  {
LABEL_23:
    v33 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v33 forKeyedSubscript:@"root.siri.siriEnabled"];
LABEL_24:

    goto LABEL_25;
  }
  id v29 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v30 = objc_alloc(MEMORY[0x263F42670]);
  v31 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_siriEnabled_readVersion];
  v32 = (void *)[v30 initWithVersionString:v31];
  if ([v29 isGreaterThanVersion:v32])
  {

LABEL_37:
    v66 = [HMDCompositeBoolSetting alloc];
    v33 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_siriEnabled_value];
    id v67 = [(HMDCompositeBoolSetting *)v66 initWithValue:[(HMDCompositeBoolSetting *)v33 BOOLValue] readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v67 forKeyedSubscript:@"root.siri.siriEnabled"];

    goto LABEL_24;
  }
  v61 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v62 = objc_alloc(MEMORY[0x263F42670]);
  v63 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_siriEnabled_writeVersion];
  v64 = (void *)[v62 initWithVersionString:v63];
  int v65 = [v61 isGreaterThanVersion:v64];

  if (v65) {
    goto LABEL_37;
  }
LABEL_25:
  uint64_t v34 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_inputLanguageCodeValueName];
  if (!v34)
  {
LABEL_41:
    v68 = [[HMDCompositeLanguageSetting alloc] initWithInputLanguage:@"en-US" outputVoiceLanguageCode:@"en-US" outputVoiceGenderCode:@"f" voiceName:0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v68 forKeyedSubscript:@"root.siri.language"];
    goto LABEL_42;
  }
  v35 = (void *)v34;
  uint64_t v36 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_readVersion];
  if (!v36)
  {
LABEL_40:

    goto LABEL_41;
  }
  id v37 = (void *)v36;
  uint64_t v38 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_writeVersion];
  if (!v38)
  {
LABEL_39:

    goto LABEL_40;
  }
  v39 = (void *)v38;
  uint64_t v40 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_outputLanguageVoiceCodeValueName];
  if (!v40)
  {

    goto LABEL_39;
  }
  v41 = (void *)v40;
  id v42 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_outputLanguageGenderCodeValueName];

  if (!v42) {
    goto LABEL_41;
  }
  v43 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v44 = objc_alloc(MEMORY[0x263F42670]);
  v45 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_readVersion];
  v46 = (void *)[v44 initWithVersionString:v45];
  if ([v43 isGreaterThanVersion:v46])
  {
  }
  else
  {
    v377 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v378 = objc_alloc(MEMORY[0x263F42670]);
    v379 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_writeVersion];
    v380 = (void *)[v378 initWithVersionString:v379];
    int v381 = [v377 isGreaterThanVersion:v380];

    if (!v381) {
      goto LABEL_43;
    }
  }
  v382 = [HMDCompositeLanguageSetting alloc];
  v68 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_inputLanguageCodeValueName];
  v383 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_outputLanguageVoiceCodeValueName];
  v384 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_outputLanguageGenderCodeValueName];
  v385 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_voiceNameValueName];
  v386 = [(HMDCompositeLanguageSetting *)v382 initWithInputLanguage:v68 outputVoiceLanguageCode:v383 outputVoiceGenderCode:v384 voiceName:v385 readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v386 forKeyedSubscript:@"root.siri.language"];

LABEL_42:
LABEL_43:
  uint64_t v69 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value];
  if (!v69) {
    goto LABEL_49;
  }
  v70 = (void *)v69;
  uint64_t v71 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion];
  if (!v71)
  {

    goto LABEL_49;
  }
  id v72 = (void *)v71;
  v73 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion];

  if (!v73)
  {
LABEL_49:
    v78 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v78 forKeyedSubscript:@"root.home.dismissedHomePodHasNonMemberMediaAccountWarning"];
    goto LABEL_50;
  }
  v74 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v75 = objc_alloc(MEMORY[0x263F42670]);
  v76 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion];
  id v77 = (void *)[v75 initWithVersionString:v76];
  if ([v74 isGreaterThanVersion:v77])
  {
  }
  else
  {
    v251 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v252 = objc_alloc(MEMORY[0x263F42670]);
    v253 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion];
    v254 = (void *)[v252 initWithVersionString:v253];
    int v255 = [v251 isGreaterThanVersion:v254];

    if (!v255) {
      goto LABEL_51;
    }
  }
  v256 = [HMDCompositeBoolSetting alloc];
  v78 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value];
  v257 = [(HMDCompositeBoolSetting *)v256 initWithValue:[(HMDCompositeBoolSetting *)v78 BOOLValue] readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v257 forKeyedSubscript:@"root.home.dismissedHomePodHasNonMemberMediaAccountWarning"];

LABEL_50:
LABEL_51:
  uint64_t v79 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_locationServices_enabled_value];
  if (!v79) {
    goto LABEL_57;
  }
  v80 = (void *)v79;
  uint64_t v81 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_locationServices_enabled_readVersion];
  if (!v81)
  {

    goto LABEL_57;
  }
  id v82 = (void *)v81;
  v83 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_locationServices_enabled_writeVersion];

  if (!v83)
  {
LABEL_57:
    v88 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v88 forKeyedSubscript:@"root.locationServices.enabled"];
    goto LABEL_58;
  }
  v84 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v85 = objc_alloc(MEMORY[0x263F42670]);
  v86 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_locationServices_enabled_readVersion];
  id v87 = (void *)[v85 initWithVersionString:v86];
  if ([v84 isGreaterThanVersion:v87])
  {
  }
  else
  {
    v258 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v259 = objc_alloc(MEMORY[0x263F42670]);
    v260 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_locationServices_enabled_writeVersion];
    v261 = (void *)[v259 initWithVersionString:v260];
    int v262 = [v258 isGreaterThanVersion:v261];

    if (!v262) {
      goto LABEL_59;
    }
  }
  v263 = [HMDCompositeBoolSetting alloc];
  v88 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_locationServices_enabled_value];
  v264 = [(HMDCompositeBoolSetting *)v263 initWithValue:[(HMDCompositeBoolSetting *)v88 BOOLValue] readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v264 forKeyedSubscript:@"root.locationServices.enabled"];

LABEL_58:
LABEL_59:
  uint64_t v89 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_doorbellChime_enabled_value];
  if (!v89) {
    goto LABEL_65;
  }
  v90 = (void *)v89;
  uint64_t v91 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_doorbellChime_enabled_readVersion];
  if (!v91)
  {

    goto LABEL_65;
  }
  id v92 = (void *)v91;
  v93 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_doorbellChime_enabled_writeVersion];

  if (!v93)
  {
LABEL_65:
    v98 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v98 forKeyedSubscript:@"root.doorbellChime.enabled"];
    goto LABEL_66;
  }
  v94 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v95 = objc_alloc(MEMORY[0x263F42670]);
  v96 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_doorbellChime_enabled_readVersion];
  id v97 = (void *)[v95 initWithVersionString:v96];
  if ([v94 isGreaterThanVersion:v97])
  {
  }
  else
  {
    v265 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v266 = objc_alloc(MEMORY[0x263F42670]);
    v267 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_doorbellChime_enabled_writeVersion];
    v268 = (void *)[v266 initWithVersionString:v267];
    int v269 = [v265 isGreaterThanVersion:v268];

    if (!v269) {
      goto LABEL_67;
    }
  }
  v270 = [HMDCompositeBoolSetting alloc];
  v98 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_doorbellChime_enabled_value];
  v271 = [(HMDCompositeBoolSetting *)v270 initWithValue:[(HMDCompositeBoolSetting *)v98 BOOLValue] readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v271 forKeyedSubscript:@"root.doorbellChime.enabled"];

LABEL_66:
LABEL_67:
  uint64_t v99 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_announce_enabled_value];
  if (!v99) {
    goto LABEL_73;
  }
  v100 = (void *)v99;
  uint64_t v101 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_announce_enabled_readVersion];
  if (!v101)
  {

    goto LABEL_73;
  }
  id v102 = (void *)v101;
  v103 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_announce_enabled_writeVersion];

  if (!v103)
  {
LABEL_73:
    v108 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v108 forKeyedSubscript:@"root.announce.enabled"];
    goto LABEL_74;
  }
  v104 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v105 = objc_alloc(MEMORY[0x263F42670]);
  v106 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_announce_enabled_readVersion];
  id v107 = (void *)[v105 initWithVersionString:v106];
  if ([v104 isGreaterThanVersion:v107])
  {
  }
  else
  {
    v272 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v273 = objc_alloc(MEMORY[0x263F42670]);
    v274 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_announce_enabled_writeVersion];
    v275 = (void *)[v273 initWithVersionString:v274];
    int v276 = [v272 isGreaterThanVersion:v275];

    if (!v276) {
      goto LABEL_75;
    }
  }
  v277 = [HMDCompositeBoolSetting alloc];
  v108 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_announce_enabled_value];
  v278 = [(HMDCompositeBoolSetting *)v277 initWithValue:[(HMDCompositeBoolSetting *)v108 BOOLValue] readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v278 forKeyedSubscript:@"root.announce.enabled"];

LABEL_74:
LABEL_75:
  uint64_t v109 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value];
  if (!v109) {
    goto LABEL_81;
  }
  v110 = (void *)v109;
  uint64_t v111 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion];
  if (!v111)
  {

    goto LABEL_81;
  }
  id v112 = (void *)v111;
  v113 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion];

  if (!v113)
  {
LABEL_81:
    v118 = [[HMDCompositeNumberSetting alloc] initWithValue:&unk_26E4719E0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v118 forKeyedSubscript:@"root.general.accessibility.vision.doubleTapSettings.timeoutSettings.timeoutInterval"];
    goto LABEL_82;
  }
  v114 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v115 = objc_alloc(MEMORY[0x263F42670]);
  v116 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion];
  id v117 = (void *)[v115 initWithVersionString:v116];
  if ([v114 isGreaterThanVersion:v117])
  {
  }
  else
  {
    v279 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v280 = objc_alloc(MEMORY[0x263F42670]);
    v281 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion];
    v282 = (void *)[v280 initWithVersionString:v281];
    int v283 = [v279 isGreaterThanVersion:v282];

    if (!v283) {
      goto LABEL_83;
    }
  }
  v284 = [HMDCompositeNumberSetting alloc];
  v118 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value];
  v285 = [(HMDCompositeNumberSetting *)v284 initWithValue:v118 readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v285 forKeyedSubscript:@"root.general.accessibility.vision.doubleTapSettings.timeoutSettings.timeoutInterval"];

LABEL_82:
LABEL_83:
  uint64_t v119 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_enabled_value];
  if (!v119) {
    goto LABEL_89;
  }
  v120 = (void *)v119;
  uint64_t v121 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_enabled_readVersion];
  if (!v121)
  {

    goto LABEL_89;
  }
  id v122 = (void *)v121;
  v123 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_enabled_writeVersion];

  if (!v123)
  {
LABEL_89:
    v128 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v128 forKeyedSubscript:@"root.general.accessibility.vision.voiceOver.enabled"];
    goto LABEL_90;
  }
  v124 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v125 = objc_alloc(MEMORY[0x263F42670]);
  v126 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_enabled_readVersion];
  id v127 = (void *)[v125 initWithVersionString:v126];
  if ([v124 isGreaterThanVersion:v127])
  {
  }
  else
  {
    v286 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v287 = objc_alloc(MEMORY[0x263F42670]);
    v288 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_enabled_writeVersion];
    v289 = (void *)[v287 initWithVersionString:v288];
    int v290 = [v286 isGreaterThanVersion:v289];

    if (!v290) {
      goto LABEL_91;
    }
  }
  v291 = [HMDCompositeBoolSetting alloc];
  v128 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_enabled_value];
  v292 = [(HMDCompositeBoolSetting *)v291 initWithValue:[(HMDCompositeBoolSetting *)v128 BOOLValue] readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v292 forKeyedSubscript:@"root.general.accessibility.vision.voiceOver.enabled"];

LABEL_90:
LABEL_91:
  uint64_t v129 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value];
  if (!v129) {
    goto LABEL_97;
  }
  v130 = (void *)v129;
  uint64_t v131 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion];
  if (!v131)
  {

    goto LABEL_97;
  }
  v132 = (void *)v131;
  v133 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion];

  if (!v133)
  {
LABEL_97:
    v138 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v138 forKeyedSubscript:@"root.general.accessibility.vision.voiceOver.audioDuckingEnabled"];
    goto LABEL_98;
  }
  v134 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v135 = objc_alloc(MEMORY[0x263F42670]);
  v136 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion];
  v137 = (void *)[v135 initWithVersionString:v136];
  if ([v134 isGreaterThanVersion:v137])
  {
  }
  else
  {
    v293 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v294 = objc_alloc(MEMORY[0x263F42670]);
    v295 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion];
    v296 = (void *)[v294 initWithVersionString:v295];
    int v297 = [v293 isGreaterThanVersion:v296];

    if (!v297) {
      goto LABEL_99;
    }
  }
  v298 = [HMDCompositeBoolSetting alloc];
  v138 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value];
  v299 = [(HMDCompositeBoolSetting *)v298 initWithValue:[(HMDCompositeBoolSetting *)v138 BOOLValue] readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v299 forKeyedSubscript:@"root.general.accessibility.vision.voiceOver.audioDuckingEnabled"];

LABEL_98:
LABEL_99:
  uint64_t v139 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_speakingRateSection_speakingRate_value];
  if (!v139) {
    goto LABEL_105;
  }
  v140 = (void *)v139;
  uint64_t v141 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_speakingRateSection_speakingRate_readVersion];
  if (!v141)
  {

    goto LABEL_105;
  }
  v142 = (void *)v141;
  v143 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion];

  if (!v143)
  {
LABEL_105:
    v148 = [[HMDCompositeNumberSetting alloc] initWithValue:&unk_26E4719F8 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v148 forKeyedSubscript:@"root.general.accessibility.vision.speakingRateSection.speakingRate"];
    goto LABEL_106;
  }
  v144 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v145 = objc_alloc(MEMORY[0x263F42670]);
  v146 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_speakingRateSection_speakingRate_readVersion];
  v147 = (void *)[v145 initWithVersionString:v146];
  if ([v144 isGreaterThanVersion:v147])
  {
  }
  else
  {
    v300 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v301 = objc_alloc(MEMORY[0x263F42670]);
    v302 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion];
    v303 = (void *)[v301 initWithVersionString:v302];
    int v304 = [v300 isGreaterThanVersion:v303];

    if (!v304) {
      goto LABEL_107;
    }
  }
  v305 = [HMDCompositeNumberSetting alloc];
  v148 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_speakingRateSection_speakingRate_value];
  v306 = [(HMDCompositeNumberSetting *)v305 initWithValue:v148 readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v306 forKeyedSubscript:@"root.general.accessibility.vision.speakingRateSection.speakingRate"];

LABEL_106:
LABEL_107:
  uint64_t v149 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_enabled_value];
  if (!v149) {
    goto LABEL_113;
  }
  v150 = (void *)v149;
  uint64_t v151 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_enabled_readVersion];
  if (!v151)
  {

    goto LABEL_113;
  }
  v152 = (void *)v151;
  v153 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_enabled_writeVersion];

  if (!v153)
  {
LABEL_113:
    v158 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v158 forKeyedSubscript:@"root.general.accessibility.interaction.holdDuration.enabled"];
    goto LABEL_114;
  }
  v154 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v155 = objc_alloc(MEMORY[0x263F42670]);
  v156 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_enabled_readVersion];
  v157 = (void *)[v155 initWithVersionString:v156];
  if ([v154 isGreaterThanVersion:v157])
  {
  }
  else
  {
    v307 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v308 = objc_alloc(MEMORY[0x263F42670]);
    v309 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_enabled_writeVersion];
    v310 = (void *)[v308 initWithVersionString:v309];
    int v311 = [v307 isGreaterThanVersion:v310];

    if (!v311) {
      goto LABEL_115;
    }
  }
  v312 = [HMDCompositeBoolSetting alloc];
  v158 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_enabled_value];
  v313 = [(HMDCompositeBoolSetting *)v312 initWithValue:[(HMDCompositeBoolSetting *)v158 BOOLValue] readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v313 forKeyedSubscript:@"root.general.accessibility.interaction.holdDuration.enabled"];

LABEL_114:
LABEL_115:
  uint64_t v159 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_seconds_value];
  if (!v159) {
    goto LABEL_121;
  }
  v160 = (void *)v159;
  uint64_t v161 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_seconds_readVersion];
  if (!v161)
  {

    goto LABEL_121;
  }
  v162 = (void *)v161;
  v163 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_seconds_writeVersion];

  if (!v163)
  {
LABEL_121:
    v168 = [[HMDCompositeNumberSetting alloc] initWithValue:&unk_26E471A10 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v168 forKeyedSubscript:@"root.general.accessibility.interaction.holdDuration.seconds"];
    goto LABEL_122;
  }
  v164 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v165 = objc_alloc(MEMORY[0x263F42670]);
  v166 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_seconds_readVersion];
  v167 = (void *)[v165 initWithVersionString:v166];
  if ([v164 isGreaterThanVersion:v167])
  {
  }
  else
  {
    v314 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v315 = objc_alloc(MEMORY[0x263F42670]);
    v316 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_seconds_writeVersion];
    v317 = (void *)[v315 initWithVersionString:v316];
    int v318 = [v314 isGreaterThanVersion:v317];

    if (!v318) {
      goto LABEL_123;
    }
  }
  v319 = [HMDCompositeNumberSetting alloc];
  v168 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_seconds_value];
  v320 = [(HMDCompositeNumberSetting *)v319 initWithValue:v168 readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v320 forKeyedSubscript:@"root.general.accessibility.interaction.holdDuration.seconds"];

LABEL_122:
LABEL_123:
  uint64_t v169 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_touchAccommodations_enabled_value];
  if (!v169) {
    goto LABEL_129;
  }
  v170 = (void *)v169;
  uint64_t v171 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_touchAccommodations_enabled_readVersion];
  if (!v171)
  {

    goto LABEL_129;
  }
  v172 = (void *)v171;
  v173 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_touchAccommodations_enabled_writeVersion];

  if (!v173)
  {
LABEL_129:
    v178 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v178 forKeyedSubscript:@"root.general.accessibility.interaction.touchAccommodations.enabled"];
    goto LABEL_130;
  }
  v174 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v175 = objc_alloc(MEMORY[0x263F42670]);
  v176 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_touchAccommodations_enabled_readVersion];
  v177 = (void *)[v175 initWithVersionString:v176];
  if ([v174 isGreaterThanVersion:v177])
  {
  }
  else
  {
    v321 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v322 = objc_alloc(MEMORY[0x263F42670]);
    v323 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_touchAccommodations_enabled_writeVersion];
    v324 = (void *)[v322 initWithVersionString:v323];
    int v325 = [v321 isGreaterThanVersion:v324];

    if (!v325) {
      goto LABEL_131;
    }
  }
  v326 = [HMDCompositeBoolSetting alloc];
  v178 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_touchAccommodations_enabled_value];
  v327 = [(HMDCompositeBoolSetting *)v326 initWithValue:[(HMDCompositeBoolSetting *)v178 BOOLValue] readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v327 forKeyedSubscript:@"root.general.accessibility.interaction.touchAccommodations.enabled"];

LABEL_130:
LABEL_131:
  uint64_t v179 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_enabled_value];
  if (!v179) {
    goto LABEL_137;
  }
  v180 = (void *)v179;
  uint64_t v181 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_enabled_readVersion];
  if (!v181)
  {

    goto LABEL_137;
  }
  v182 = (void *)v181;
  v183 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion];

  if (!v183)
  {
LABEL_137:
    v188 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v188 forKeyedSubscript:@"root.general.accessibility.interaction.ignoreRepeat.enabled"];
    goto LABEL_138;
  }
  v184 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v185 = objc_alloc(MEMORY[0x263F42670]);
  v186 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_enabled_readVersion];
  v187 = (void *)[v185 initWithVersionString:v186];
  if ([v184 isGreaterThanVersion:v187])
  {
  }
  else
  {
    v328 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v329 = objc_alloc(MEMORY[0x263F42670]);
    v330 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion];
    v331 = (void *)[v329 initWithVersionString:v330];
    int v332 = [v328 isGreaterThanVersion:v331];

    if (!v332) {
      goto LABEL_139;
    }
  }
  v333 = [HMDCompositeBoolSetting alloc];
  v188 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_enabled_value];
  v334 = [(HMDCompositeBoolSetting *)v333 initWithValue:[(HMDCompositeBoolSetting *)v188 BOOLValue] readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v334 forKeyedSubscript:@"root.general.accessibility.interaction.ignoreRepeat.enabled"];

LABEL_138:
LABEL_139:
  uint64_t v189 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_seconds_value];
  if (!v189) {
    goto LABEL_145;
  }
  v190 = (void *)v189;
  uint64_t v191 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_seconds_readVersion];
  if (!v191)
  {

    goto LABEL_145;
  }
  v192 = (void *)v191;
  v193 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion];

  if (!v193)
  {
LABEL_145:
    v198 = [[HMDCompositeNumberSetting alloc] initWithValue:&unk_26E471A10 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v198 forKeyedSubscript:@"root.general.accessibility.interaction.ignoreRepeat.seconds"];
    goto LABEL_146;
  }
  v194 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v195 = objc_alloc(MEMORY[0x263F42670]);
  v196 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_seconds_readVersion];
  v197 = (void *)[v195 initWithVersionString:v196];
  if ([v194 isGreaterThanVersion:v197])
  {
  }
  else
  {
    v335 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v336 = objc_alloc(MEMORY[0x263F42670]);
    v337 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion];
    v338 = (void *)[v336 initWithVersionString:v337];
    int v339 = [v335 isGreaterThanVersion:v338];

    if (!v339) {
      goto LABEL_147;
    }
  }
  v340 = [HMDCompositeNumberSetting alloc];
  v198 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_seconds_value];
  v341 = [(HMDCompositeNumberSetting *)v340 initWithValue:v198 readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v341 forKeyedSubscript:@"root.general.accessibility.interaction.ignoreRepeat.seconds"];

LABEL_146:
LABEL_147:
  uint64_t v199 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSiriAnalytics_value];
  if (!v199) {
    goto LABEL_153;
  }
  v200 = (void *)v199;
  uint64_t v201 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSiriAnalytics_readVersion];
  if (!v201)
  {

    goto LABEL_153;
  }
  v202 = (void *)v201;
  v203 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSiriAnalytics_writeVersion];

  if (!v203)
  {
LABEL_153:
    v208 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.1" writeVersion:@"9.0"];
    [v3 setObject:v208 forKeyedSubscript:@"root.general.analytics.shareSiriAnalytics"];
    goto LABEL_154;
  }
  v204 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v205 = objc_alloc(MEMORY[0x263F42670]);
  v206 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSiriAnalytics_readVersion];
  v207 = (void *)[v205 initWithVersionString:v206];
  if ([v204 isGreaterThanVersion:v207])
  {
  }
  else
  {
    v342 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"9.0"];
    id v343 = objc_alloc(MEMORY[0x263F42670]);
    v344 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSiriAnalytics_writeVersion];
    v345 = (void *)[v343 initWithVersionString:v344];
    int v346 = [v342 isGreaterThanVersion:v345];

    if (!v346) {
      goto LABEL_155;
    }
  }
  v347 = [HMDCompositeBoolSetting alloc];
  v208 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSiriAnalytics_value];
  v348 = [(HMDCompositeBoolSetting *)v347 initWithValue:[(HMDCompositeBoolSetting *)v208 BOOLValue] readVersion:@"7.1" writeVersion:@"9.0"];
  [v3 setObject:v348 forKeyedSubscript:@"root.general.analytics.shareSiriAnalytics"];

LABEL_154:
LABEL_155:
  uint64_t v209 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSpeakerAnalytics_value];
  if (!v209) {
    goto LABEL_161;
  }
  v210 = (void *)v209;
  uint64_t v211 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSpeakerAnalytics_readVersion];
  if (!v211)
  {

    goto LABEL_161;
  }
  v212 = (void *)v211;
  v213 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSpeakerAnalytics_writeVersion];

  if (!v213)
  {
LABEL_161:
    v218 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v218 forKeyedSubscript:@"root.general.analytics.shareSpeakerAnalytics"];
    goto LABEL_162;
  }
  v214 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v215 = objc_alloc(MEMORY[0x263F42670]);
  v216 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSpeakerAnalytics_readVersion];
  v217 = (void *)[v215 initWithVersionString:v216];
  if ([v214 isGreaterThanVersion:v217])
  {
  }
  else
  {
    v349 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v350 = objc_alloc(MEMORY[0x263F42670]);
    v351 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSpeakerAnalytics_writeVersion];
    v352 = (void *)[v350 initWithVersionString:v351];
    int v353 = [v349 isGreaterThanVersion:v352];

    if (!v353) {
      goto LABEL_163;
    }
  }
  v354 = [HMDCompositeBoolSetting alloc];
  v218 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSpeakerAnalytics_value];
  v355 = [(HMDCompositeBoolSetting *)v354 initWithValue:[(HMDCompositeBoolSetting *)v218 BOOLValue] readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v355 forKeyedSubscript:@"root.general.analytics.shareSpeakerAnalytics"];

LABEL_162:
LABEL_163:
  uint64_t v219 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_music_allowExplicitContent_value];
  if (!v219) {
    goto LABEL_169;
  }
  v220 = (void *)v219;
  uint64_t v221 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_music_allowExplicitContent_readVersion];
  if (!v221)
  {

    goto LABEL_169;
  }
  v222 = (void *)v221;
  v223 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_music_allowExplicitContent_writeVersion];

  if (!v223)
  {
LABEL_169:
    v228 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v228 forKeyedSubscript:@"root.music.allowExplicitContent"];
    goto LABEL_170;
  }
  v224 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v225 = objc_alloc(MEMORY[0x263F42670]);
  v226 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_music_allowExplicitContent_readVersion];
  v227 = (void *)[v225 initWithVersionString:v226];
  if ([v224 isGreaterThanVersion:v227])
  {
  }
  else
  {
    v356 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v357 = objc_alloc(MEMORY[0x263F42670]);
    v358 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_music_allowExplicitContent_writeVersion];
    v359 = (void *)[v357 initWithVersionString:v358];
    int v360 = [v356 isGreaterThanVersion:v359];

    if (!v360) {
      goto LABEL_171;
    }
  }
  v361 = [HMDCompositeBoolSetting alloc];
  v228 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_music_allowExplicitContent_value];
  v362 = [(HMDCompositeBoolSetting *)v361 initWithValue:[(HMDCompositeBoolSetting *)v228 BOOLValue] readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v362 forKeyedSubscript:@"root.music.allowExplicitContent"];

LABEL_170:
LABEL_171:
  uint64_t v229 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_airPlay_airPlayEnabled_value];
  if (!v229) {
    goto LABEL_177;
  }
  v230 = (void *)v229;
  uint64_t v231 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_airPlay_airPlayEnabled_readVersion];
  if (!v231)
  {

    goto LABEL_177;
  }
  v232 = (void *)v231;
  v233 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_airPlay_airPlayEnabled_writeVersion];

  if (!v233)
  {
LABEL_177:
    v238 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v238 forKeyedSubscript:@"root.airPlay.airPlayEnabled"];
    goto LABEL_178;
  }
  v234 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v235 = objc_alloc(MEMORY[0x263F42670]);
  v236 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_airPlay_airPlayEnabled_readVersion];
  v237 = (void *)[v235 initWithVersionString:v236];
  if ([v234 isGreaterThanVersion:v237])
  {
  }
  else
  {
    v363 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
    id v364 = objc_alloc(MEMORY[0x263F42670]);
    v365 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_airPlay_airPlayEnabled_writeVersion];
    v366 = (void *)[v364 initWithVersionString:v365];
    int v367 = [v363 isGreaterThanVersion:v366];

    if (!v367) {
      goto LABEL_179;
    }
  }
  v368 = [HMDCompositeBoolSetting alloc];
  v238 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_airPlay_airPlayEnabled_value];
  v369 = [(HMDCompositeBoolSetting *)v368 initWithValue:[(HMDCompositeBoolSetting *)v238 BOOLValue] readVersion:@"7.1" writeVersion:@"7.1"];
  [v3 setObject:v369 forKeyedSubscript:@"root.airPlay.airPlayEnabled"];

LABEL_178:
LABEL_179:
  uint64_t v239 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siriEndpoint_enabled_value];
  if (!v239) {
    goto LABEL_185;
  }
  v240 = (void *)v239;
  uint64_t v241 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siriEndpoint_enabled_readVersion];
  if (!v241)
  {

    goto LABEL_185;
  }
  v242 = (void *)v241;
  v243 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siriEndpoint_enabled_writeVersion];

  if (!v243)
  {
LABEL_185:
    v248 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v248 forKeyedSubscript:@"root.siriEndpoint.enabled"];
LABEL_186:

    goto LABEL_187;
  }
  v244 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v245 = objc_alloc(MEMORY[0x263F42670]);
  v246 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siriEndpoint_enabled_readVersion];
  v247 = (void *)[v245 initWithVersionString:v246];
  if ([v244 isGreaterThanVersion:v247])
  {

LABEL_225:
    v375 = [HMDCompositeBoolSetting alloc];
    v248 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siriEndpoint_enabled_value];
    v376 = [(HMDCompositeBoolSetting *)v375 initWithValue:[(HMDCompositeBoolSetting *)v248 BOOLValue] readVersion:@"7.1" writeVersion:@"7.1"];
    [v3 setObject:v376 forKeyedSubscript:@"root.siriEndpoint.enabled"];

    goto LABEL_186;
  }
  v370 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"7.1"];
  id v371 = objc_alloc(MEMORY[0x263F42670]);
  v372 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siriEndpoint_enabled_writeVersion];
  v373 = (void *)[v371 initWithVersionString:v372];
  int v374 = [v370 isGreaterThanVersion:v373];

  if (v374) {
    goto LABEL_225;
  }
LABEL_187:
  v249 = (void *)[v3 copy];

  return v249;
}

- (id)keyPathsToSettingMetadata
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  uint64_t v4 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.siri.soundAlert" constraint:0 privileges:v3];
  [v2 setObject:v4 forKeyedSubscript:@"root.siri.soundAlert"];

  v5 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  uint64_t v6 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.siri.lightWhenUsingSiri" constraint:0 privileges:v5];
  [v2 setObject:v6 forKeyedSubscript:@"root.siri.lightWhenUsingSiri"];

  v7 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  id v8 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.siri.siriEnabled" constraint:0 privileges:v7];
  [v2 setObject:v8 forKeyedSubscript:@"root.siri.siriEnabled"];

  uint64_t v9 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:0];
  id v10 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.siri.language" constraint:0 privileges:v9];
  [v2 setObject:v10 forKeyedSubscript:@"root.siri.language"];

  id v11 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  v12 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.home.dismissedHomePodHasNonMemberMediaAccountWarning" constraint:0 privileges:v11];
  [v2 setObject:v12 forKeyedSubscript:@"root.home.dismissedHomePodHasNonMemberMediaAccountWarning"];

  id v13 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  uint64_t v14 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.locationServices.enabled" constraint:0 privileges:v13];
  [v2 setObject:v14 forKeyedSubscript:@"root.locationServices.enabled"];

  v15 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  uint64_t v16 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.doorbellChime.enabled" constraint:0 privileges:v15];
  [v2 setObject:v16 forKeyedSubscript:@"root.doorbellChime.enabled"];

  v17 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:0];
  v18 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.announce.enabled" constraint:0 privileges:v17];
  [v2 setObject:v18 forKeyedSubscript:@"root.announce.enabled"];

  id v19 = [[HMDCompositeSettingIntegerConstraint alloc] initWithMaxValue:50 minValue:20 stepValue:5];
  id v20 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  v21 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.general.accessibility.vision.doubleTapSettings.timeoutSettings.timeoutInterval" constraint:v19 privileges:v20];
  [v2 setObject:v21 forKeyedSubscript:@"root.general.accessibility.vision.doubleTapSettings.timeoutSettings.timeoutInterval"];

  v22 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  v23 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.general.accessibility.vision.voiceOver.enabled" constraint:0 privileges:v22];
  [v2 setObject:v23 forKeyedSubscript:@"root.general.accessibility.vision.voiceOver.enabled"];

  uint64_t v24 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  v25 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.general.accessibility.vision.voiceOver.audioDuckingEnabled" constraint:0 privileges:v24];
  [v2 setObject:v25 forKeyedSubscript:@"root.general.accessibility.vision.voiceOver.audioDuckingEnabled"];

  uint64_t v26 = [[HMDCompositeSettingIntegerConstraint alloc] initWithMaxValue:400 minValue:0 stepValue:10];
  v27 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  v28 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.general.accessibility.vision.speakingRateSection.speakingRate" constraint:v26 privileges:v27];
  [v2 setObject:v28 forKeyedSubscript:@"root.general.accessibility.vision.speakingRateSection.speakingRate"];

  id v29 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  id v30 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.general.accessibility.interaction.holdDuration.enabled" constraint:0 privileges:v29];
  [v2 setObject:v30 forKeyedSubscript:@"root.general.accessibility.interaction.holdDuration.enabled"];

  v31 = [[HMDCompositeSettingIntegerConstraint alloc] initWithMaxValue:400 minValue:10 stepValue:10];
  v32 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  v33 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.general.accessibility.interaction.holdDuration.seconds" constraint:v31 privileges:v32];
  [v2 setObject:v33 forKeyedSubscript:@"root.general.accessibility.interaction.holdDuration.seconds"];

  uint64_t v34 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  v35 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.general.accessibility.interaction.touchAccommodations.enabled" constraint:0 privileges:v34];
  [v2 setObject:v35 forKeyedSubscript:@"root.general.accessibility.interaction.touchAccommodations.enabled"];

  uint64_t v36 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  id v37 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.general.accessibility.interaction.ignoreRepeat.enabled" constraint:0 privileges:v36];
  [v2 setObject:v37 forKeyedSubscript:@"root.general.accessibility.interaction.ignoreRepeat.enabled"];

  uint64_t v38 = [[HMDCompositeSettingIntegerConstraint alloc] initWithMaxValue:400 minValue:10 stepValue:10];
  v39 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  uint64_t v40 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.general.accessibility.interaction.ignoreRepeat.seconds" constraint:v38 privileges:v39];
  [v2 setObject:v40 forKeyedSubscript:@"root.general.accessibility.interaction.ignoreRepeat.seconds"];

  v41 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  id v42 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.general.analytics.shareSiriAnalytics" constraint:0 privileges:v41];
  [v2 setObject:v42 forKeyedSubscript:@"root.general.analytics.shareSiriAnalytics"];

  v43 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  id v44 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.general.analytics.shareSpeakerAnalytics" constraint:0 privileges:v43];
  [v2 setObject:v44 forKeyedSubscript:@"root.general.analytics.shareSpeakerAnalytics"];

  v45 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  v46 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.music.allowExplicitContent" constraint:0 privileges:v45];
  [v2 setObject:v46 forKeyedSubscript:@"root.music.allowExplicitContent"];

  id v47 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  id v48 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.airPlay.airPlayEnabled" constraint:0 privileges:v47];
  [v2 setObject:v48 forKeyedSubscript:@"root.airPlay.airPlayEnabled"];

  v49 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
  v50 = [[HMDCompositeSettingMetadata alloc] initWithKeyPath:@"root.siriEndpoint.enabled" constraint:0 privileges:v49];
  [v2 setObject:v50 forKeyedSubscript:@"root.siriEndpoint.enabled"];

  int v51 = (void *)[v2 copy];
  return v51;
}

- (id)keyPathsToSettings
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v4 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_soundAlert_value];
  if (v4)
  {
    v5 = (void *)v4;
    uint64_t v6 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_soundAlert_readVersion];
    if (v6)
    {
      v7 = (void *)v6;
      id v8 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_soundAlert_writeVersion];

      if (!v8) {
        goto LABEL_6;
      }
      uint64_t v9 = [HMDCompositeBoolSetting alloc];
      v5 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_soundAlert_value];
      uint64_t v10 = [v5 BOOLValue];
      id v11 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_soundAlert_readVersion];
      v12 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_soundAlert_writeVersion];
      id v13 = [(HMDCompositeBoolSetting *)v9 initWithValue:v10 readVersion:v11 writeVersion:v12];
      [v3 setObject:v13 forKeyedSubscript:@"root.siri.soundAlert"];
    }
  }
LABEL_6:
  uint64_t v14 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_lightWhenUsingSiri_value];
  if (!v14) {
    goto LABEL_11;
  }
  v15 = (void *)v14;
  uint64_t v16 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_lightWhenUsingSiri_readVersion];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_lightWhenUsingSiri_writeVersion];

    if (!v18) {
      goto LABEL_11;
    }
    id v19 = [HMDCompositeBoolSetting alloc];
    v15 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_lightWhenUsingSiri_value];
    uint64_t v20 = [v15 BOOLValue];
    v21 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_lightWhenUsingSiri_readVersion];
    v22 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_lightWhenUsingSiri_writeVersion];
    v23 = [(HMDCompositeBoolSetting *)v19 initWithValue:v20 readVersion:v21 writeVersion:v22];
    [v3 setObject:v23 forKeyedSubscript:@"root.siri.lightWhenUsingSiri"];
  }
LABEL_11:
  uint64_t v24 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_siriEnabled_value];
  if (!v24) {
    goto LABEL_16;
  }
  v25 = (void *)v24;
  uint64_t v26 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_siriEnabled_readVersion];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_siriEnabled_writeVersion];

    if (!v28) {
      goto LABEL_16;
    }
    id v29 = [HMDCompositeBoolSetting alloc];
    v25 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_siriEnabled_value];
    uint64_t v30 = [v25 BOOLValue];
    v31 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_siriEnabled_readVersion];
    v32 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_siriEnabled_writeVersion];
    v33 = [(HMDCompositeBoolSetting *)v29 initWithValue:v30 readVersion:v31 writeVersion:v32];
    [v3 setObject:v33 forKeyedSubscript:@"root.siri.siriEnabled"];
  }
LABEL_16:
  uint64_t v34 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_readVersion];
  if (!v34) {
    goto LABEL_25;
  }
  v35 = (void *)v34;
  uint64_t v36 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_writeVersion];
  if (v36)
  {
    id v37 = (void *)v36;
    uint64_t v38 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_inputLanguageCodeValueName];
    if (v38)
    {
      v39 = (void *)v38;
      uint64_t v40 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_outputLanguageVoiceCodeValueName];
      if (v40)
      {
        v41 = (void *)v40;
        id v42 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_outputLanguageGenderCodeValueName];

        if (!v42) {
          goto LABEL_25;
        }
        v43 = [HMDCompositeLanguageSetting alloc];
        v35 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_inputLanguageCodeValueName];
        id v37 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_outputLanguageVoiceCodeValueName];
        v39 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_outputLanguageGenderCodeValueName];
        id v44 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_voiceNameValueName];
        v45 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_readVersion];
        v46 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siri_language_writeVersion];
        id v47 = [(HMDCompositeLanguageSetting *)v43 initWithInputLanguage:v35 outputVoiceLanguageCode:v37 outputVoiceGenderCode:v39 voiceName:v44 readVersion:v45 writeVersion:v46];
        [v3 setObject:v47 forKeyedSubscript:@"root.siri.language"];
      }
    }
  }
LABEL_25:
  uint64_t v48 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value];
  if (!v48) {
    goto LABEL_30;
  }
  v49 = (void *)v48;
  uint64_t v50 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion];
  if (v50)
  {
    int v51 = (void *)v50;
    id v52 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion];

    if (!v52) {
      goto LABEL_30;
    }
    v53 = [HMDCompositeBoolSetting alloc];
    v49 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value];
    uint64_t v54 = [v49 BOOLValue];
    id v55 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion];
    v56 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion];
    id v57 = [(HMDCompositeBoolSetting *)v53 initWithValue:v54 readVersion:v55 writeVersion:v56];
    [v3 setObject:v57 forKeyedSubscript:@"root.home.dismissedHomePodHasNonMemberMediaAccountWarning"];
  }
LABEL_30:
  uint64_t v58 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_locationServices_enabled_value];
  if (!v58) {
    goto LABEL_35;
  }
  v59 = (void *)v58;
  uint64_t v60 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_locationServices_enabled_readVersion];
  if (v60)
  {
    v61 = (void *)v60;
    id v62 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_locationServices_enabled_writeVersion];

    if (!v62) {
      goto LABEL_35;
    }
    v63 = [HMDCompositeBoolSetting alloc];
    v59 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_locationServices_enabled_value];
    uint64_t v64 = [v59 BOOLValue];
    int v65 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_locationServices_enabled_readVersion];
    v66 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_locationServices_enabled_writeVersion];
    id v67 = [(HMDCompositeBoolSetting *)v63 initWithValue:v64 readVersion:v65 writeVersion:v66];
    [v3 setObject:v67 forKeyedSubscript:@"root.locationServices.enabled"];
  }
LABEL_35:
  uint64_t v68 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_doorbellChime_enabled_value];
  if (!v68) {
    goto LABEL_40;
  }
  uint64_t v69 = (void *)v68;
  uint64_t v70 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_doorbellChime_enabled_readVersion];
  if (v70)
  {
    uint64_t v71 = (void *)v70;
    id v72 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_doorbellChime_enabled_writeVersion];

    if (!v72) {
      goto LABEL_40;
    }
    v73 = [HMDCompositeBoolSetting alloc];
    uint64_t v69 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_doorbellChime_enabled_value];
    uint64_t v74 = [v69 BOOLValue];
    id v75 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_doorbellChime_enabled_readVersion];
    v76 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_doorbellChime_enabled_writeVersion];
    id v77 = [(HMDCompositeBoolSetting *)v73 initWithValue:v74 readVersion:v75 writeVersion:v76];
    [v3 setObject:v77 forKeyedSubscript:@"root.doorbellChime.enabled"];
  }
LABEL_40:
  uint64_t v78 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_announce_enabled_value];
  if (!v78) {
    goto LABEL_45;
  }
  uint64_t v79 = (void *)v78;
  uint64_t v80 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_announce_enabled_readVersion];
  if (v80)
  {
    uint64_t v81 = (void *)v80;
    id v82 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_announce_enabled_writeVersion];

    if (!v82) {
      goto LABEL_45;
    }
    v83 = [HMDCompositeBoolSetting alloc];
    uint64_t v79 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_announce_enabled_value];
    uint64_t v84 = [v79 BOOLValue];
    id v85 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_announce_enabled_readVersion];
    v86 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_announce_enabled_writeVersion];
    id v87 = [(HMDCompositeBoolSetting *)v83 initWithValue:v84 readVersion:v85 writeVersion:v86];
    [v3 setObject:v87 forKeyedSubscript:@"root.announce.enabled"];
  }
LABEL_45:
  uint64_t v88 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value];
  if (!v88) {
    goto LABEL_50;
  }
  uint64_t v89 = (void *)v88;
  uint64_t v90 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion];
  if (v90)
  {
    uint64_t v91 = (void *)v90;
    id v92 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion];

    if (!v92) {
      goto LABEL_50;
    }
    v93 = [HMDCompositeNumberSetting alloc];
    uint64_t v89 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value];
    v94 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion];
    id v95 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion];
    v96 = [(HMDCompositeNumberSetting *)v93 initWithValue:v89 readVersion:v94 writeVersion:v95];
    [v3 setObject:v96 forKeyedSubscript:@"root.general.accessibility.vision.doubleTapSettings.timeoutSettings.timeoutInterval"];
  }
LABEL_50:
  uint64_t v97 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_enabled_value];
  if (!v97) {
    goto LABEL_55;
  }
  v98 = (void *)v97;
  uint64_t v99 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_enabled_readVersion];
  if (v99)
  {
    v100 = (void *)v99;
    uint64_t v101 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_enabled_writeVersion];

    if (!v101) {
      goto LABEL_55;
    }
    id v102 = [HMDCompositeBoolSetting alloc];
    v98 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_enabled_value];
    uint64_t v103 = [v98 BOOLValue];
    v104 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_enabled_readVersion];
    id v105 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_enabled_writeVersion];
    v106 = [(HMDCompositeBoolSetting *)v102 initWithValue:v103 readVersion:v104 writeVersion:v105];
    [v3 setObject:v106 forKeyedSubscript:@"root.general.accessibility.vision.voiceOver.enabled"];
  }
LABEL_55:
  uint64_t v107 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value];
  if (!v107) {
    goto LABEL_60;
  }
  v108 = (void *)v107;
  uint64_t v109 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion];
  if (v109)
  {
    v110 = (void *)v109;
    uint64_t v111 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion];

    if (!v111) {
      goto LABEL_60;
    }
    id v112 = [HMDCompositeBoolSetting alloc];
    v108 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value];
    uint64_t v113 = [v108 BOOLValue];
    v114 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion];
    id v115 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion];
    v116 = [(HMDCompositeBoolSetting *)v112 initWithValue:v113 readVersion:v114 writeVersion:v115];
    [v3 setObject:v116 forKeyedSubscript:@"root.general.accessibility.vision.voiceOver.audioDuckingEnabled"];
  }
LABEL_60:
  uint64_t v117 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_speakingRateSection_speakingRate_value];
  if (!v117) {
    goto LABEL_65;
  }
  v118 = (void *)v117;
  uint64_t v119 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_speakingRateSection_speakingRate_readVersion];
  if (v119)
  {
    v120 = (void *)v119;
    uint64_t v121 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion];

    if (!v121) {
      goto LABEL_65;
    }
    id v122 = [HMDCompositeNumberSetting alloc];
    v118 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_speakingRateSection_speakingRate_value];
    v123 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_speakingRateSection_speakingRate_readVersion];
    v124 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion];
    id v125 = [(HMDCompositeNumberSetting *)v122 initWithValue:v118 readVersion:v123 writeVersion:v124];
    [v3 setObject:v125 forKeyedSubscript:@"root.general.accessibility.vision.speakingRateSection.speakingRate"];
  }
LABEL_65:
  uint64_t v126 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_enabled_value];
  if (!v126) {
    goto LABEL_70;
  }
  id v127 = (void *)v126;
  uint64_t v128 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_enabled_readVersion];
  if (v128)
  {
    uint64_t v129 = (void *)v128;
    v130 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_enabled_writeVersion];

    if (!v130) {
      goto LABEL_70;
    }
    uint64_t v131 = [HMDCompositeBoolSetting alloc];
    id v127 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_enabled_value];
    uint64_t v132 = [v127 BOOLValue];
    v133 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_enabled_readVersion];
    v134 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_enabled_writeVersion];
    id v135 = [(HMDCompositeBoolSetting *)v131 initWithValue:v132 readVersion:v133 writeVersion:v134];
    [v3 setObject:v135 forKeyedSubscript:@"root.general.accessibility.interaction.holdDuration.enabled"];
  }
LABEL_70:
  uint64_t v136 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_seconds_value];
  if (!v136) {
    goto LABEL_75;
  }
  v137 = (void *)v136;
  uint64_t v138 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_seconds_readVersion];
  if (v138)
  {
    uint64_t v139 = (void *)v138;
    v140 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_seconds_writeVersion];

    if (!v140) {
      goto LABEL_75;
    }
    uint64_t v141 = [HMDCompositeNumberSetting alloc];
    v137 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_seconds_value];
    v142 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_seconds_readVersion];
    v143 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_holdDuration_seconds_writeVersion];
    v144 = [(HMDCompositeNumberSetting *)v141 initWithValue:v137 readVersion:v142 writeVersion:v143];
    [v3 setObject:v144 forKeyedSubscript:@"root.general.accessibility.interaction.holdDuration.seconds"];
  }
LABEL_75:
  uint64_t v145 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_touchAccommodations_enabled_value];
  if (!v145) {
    goto LABEL_80;
  }
  v146 = (void *)v145;
  uint64_t v147 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_touchAccommodations_enabled_readVersion];
  if (v147)
  {
    v148 = (void *)v147;
    uint64_t v149 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_touchAccommodations_enabled_writeVersion];

    if (!v149) {
      goto LABEL_80;
    }
    v150 = [HMDCompositeBoolSetting alloc];
    v146 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_touchAccommodations_enabled_value];
    uint64_t v151 = [v146 BOOLValue];
    v152 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_touchAccommodations_enabled_readVersion];
    v153 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_touchAccommodations_enabled_writeVersion];
    v154 = [(HMDCompositeBoolSetting *)v150 initWithValue:v151 readVersion:v152 writeVersion:v153];
    [v3 setObject:v154 forKeyedSubscript:@"root.general.accessibility.interaction.touchAccommodations.enabled"];
  }
LABEL_80:
  uint64_t v155 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_enabled_value];
  if (!v155) {
    goto LABEL_85;
  }
  v156 = (void *)v155;
  uint64_t v157 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_enabled_readVersion];
  if (v157)
  {
    v158 = (void *)v157;
    uint64_t v159 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion];

    if (!v159) {
      goto LABEL_85;
    }
    v160 = [HMDCompositeBoolSetting alloc];
    v156 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_enabled_value];
    uint64_t v161 = [v156 BOOLValue];
    v162 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_enabled_readVersion];
    v163 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion];
    v164 = [(HMDCompositeBoolSetting *)v160 initWithValue:v161 readVersion:v162 writeVersion:v163];
    [v3 setObject:v164 forKeyedSubscript:@"root.general.accessibility.interaction.ignoreRepeat.enabled"];
  }
LABEL_85:
  uint64_t v165 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_seconds_value];
  if (!v165) {
    goto LABEL_90;
  }
  v166 = (void *)v165;
  uint64_t v167 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_seconds_readVersion];
  if (v167)
  {
    v168 = (void *)v167;
    uint64_t v169 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion];

    if (!v169) {
      goto LABEL_90;
    }
    v170 = [HMDCompositeNumberSetting alloc];
    v166 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_seconds_value];
    uint64_t v171 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_seconds_readVersion];
    v172 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion];
    v173 = [(HMDCompositeNumberSetting *)v170 initWithValue:v166 readVersion:v171 writeVersion:v172];
    [v3 setObject:v173 forKeyedSubscript:@"root.general.accessibility.interaction.ignoreRepeat.seconds"];
  }
LABEL_90:
  uint64_t v174 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSiriAnalytics_value];
  if (!v174) {
    goto LABEL_95;
  }
  id v175 = (void *)v174;
  uint64_t v176 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSiriAnalytics_readVersion];
  if (v176)
  {
    v177 = (void *)v176;
    v178 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSiriAnalytics_writeVersion];

    if (!v178) {
      goto LABEL_95;
    }
    uint64_t v179 = [HMDCompositeBoolSetting alloc];
    id v175 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSiriAnalytics_value];
    uint64_t v180 = [v175 BOOLValue];
    uint64_t v181 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSiriAnalytics_readVersion];
    v182 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSiriAnalytics_writeVersion];
    v183 = [(HMDCompositeBoolSetting *)v179 initWithValue:v180 readVersion:v181 writeVersion:v182];
    [v3 setObject:v183 forKeyedSubscript:@"root.general.analytics.shareSiriAnalytics"];
  }
LABEL_95:
  uint64_t v184 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSpeakerAnalytics_value];
  if (!v184) {
    goto LABEL_100;
  }
  id v185 = (void *)v184;
  uint64_t v186 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSpeakerAnalytics_readVersion];
  if (v186)
  {
    v187 = (void *)v186;
    v188 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSpeakerAnalytics_writeVersion];

    if (!v188) {
      goto LABEL_100;
    }
    uint64_t v189 = [HMDCompositeBoolSetting alloc];
    id v185 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSpeakerAnalytics_value];
    uint64_t v190 = [v185 BOOLValue];
    uint64_t v191 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSpeakerAnalytics_readVersion];
    v192 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_general_analytics_shareSpeakerAnalytics_writeVersion];
    v193 = [(HMDCompositeBoolSetting *)v189 initWithValue:v190 readVersion:v191 writeVersion:v192];
    [v3 setObject:v193 forKeyedSubscript:@"root.general.analytics.shareSpeakerAnalytics"];
  }
LABEL_100:
  uint64_t v194 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_music_allowExplicitContent_value];
  if (!v194) {
    goto LABEL_105;
  }
  id v195 = (void *)v194;
  uint64_t v196 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_music_allowExplicitContent_readVersion];
  if (v196)
  {
    v197 = (void *)v196;
    v198 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_music_allowExplicitContent_writeVersion];

    if (!v198) {
      goto LABEL_105;
    }
    uint64_t v199 = [HMDCompositeBoolSetting alloc];
    id v195 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_music_allowExplicitContent_value];
    uint64_t v200 = [v195 BOOLValue];
    uint64_t v201 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_music_allowExplicitContent_readVersion];
    v202 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_music_allowExplicitContent_writeVersion];
    v203 = [(HMDCompositeBoolSetting *)v199 initWithValue:v200 readVersion:v201 writeVersion:v202];
    [v3 setObject:v203 forKeyedSubscript:@"root.music.allowExplicitContent"];
  }
LABEL_105:
  uint64_t v204 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_airPlay_airPlayEnabled_value];
  if (!v204) {
    goto LABEL_110;
  }
  id v205 = (void *)v204;
  uint64_t v206 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_airPlay_airPlayEnabled_readVersion];
  if (v206)
  {
    v207 = (void *)v206;
    v208 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_airPlay_airPlayEnabled_writeVersion];

    if (!v208) {
      goto LABEL_110;
    }
    uint64_t v209 = [HMDCompositeBoolSetting alloc];
    id v205 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_airPlay_airPlayEnabled_value];
    uint64_t v210 = [v205 BOOLValue];
    uint64_t v211 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_airPlay_airPlayEnabled_readVersion];
    v212 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_airPlay_airPlayEnabled_writeVersion];
    v213 = [(HMDCompositeBoolSetting *)v209 initWithValue:v210 readVersion:v211 writeVersion:v212];
    [v3 setObject:v213 forKeyedSubscript:@"root.airPlay.airPlayEnabled"];
  }
LABEL_110:
  uint64_t v214 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siriEndpoint_enabled_value];
  if (!v214) {
    goto LABEL_115;
  }
  id v215 = (void *)v214;
  uint64_t v216 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siriEndpoint_enabled_readVersion];
  if (v216)
  {
    v217 = (void *)v216;
    v218 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siriEndpoint_enabled_writeVersion];

    if (!v218) {
      goto LABEL_115;
    }
    uint64_t v219 = [HMDCompositeBoolSetting alloc];
    id v215 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siriEndpoint_enabled_value];
    uint64_t v220 = [v215 BOOLValue];
    uint64_t v221 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siriEndpoint_enabled_readVersion];
    v222 = [(HMDCompositeSettingsAccessorySettingsModel *)self root_siriEndpoint_enabled_writeVersion];
    v223 = [(HMDCompositeBoolSetting *)v219 initWithValue:v220 readVersion:v221 writeVersion:v222];
    [v3 setObject:v223 forKeyedSubscript:@"root.siriEndpoint.enabled"];
  }
LABEL_115:
  v224 = (void *)[v3 copy];

  return v224;
}

@end