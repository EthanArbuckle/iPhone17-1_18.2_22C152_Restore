@interface AccessibilityAirPodSettingsController
- (AccessibilityAirPodSettingsController)init;
- (BOOL)isBeatsProduct;
- (BOOL)isInWatchSettings;
- (BOOL)supportsSpatialAudio;
- (BluetoothDevice)bluetoothDevice;
- (double)defaultToneVolumeValue;
- (double)displayedMaxValue;
- (double)holdSpeedValue;
- (double)tapSpeedValue;
- (double)toneVolumeValue;
- (double)volumeSwipeDurationValue;
- (id)_btDeviceAddress;
- (id)caseTonesEnabled;
- (id)noiseCancellation:(id)a3;
- (id)spatialAudioLock:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)toneVolume:(id)a3;
- (id)volumeSwipeEnabled:(id)a3;
- (void)_updateToneVolumeFooter:(float)a3;
- (void)applyHapticIfNecessary:(id)a3;
- (void)confirmationViewAcceptedForSpecifier:(id)a3;
- (void)jumpToAVSettings:(id)a3;
- (void)loudNoiseToggled:(id)a3;
- (void)setBluetoothDevice:(id)a3;
- (void)setCaseTonesEnabled:(id)a3 specifier:(id)a4;
- (void)setNoiseCancellation:(id)a3 specifier:(id)a4;
- (void)setSpatialAudioLock:(id)a3 specifier:(id)a4;
- (void)setSpecifier:(id)a3;
- (void)setToneVolume:(id)a3 specifier:(id)a4;
- (void)setVolumeSwipeEnabled:(id)a3 specifier:(id)a4;
- (void)showLoudNoiseLearnMore;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AccessibilityAirPodSettingsController

- (BOOL)isInWatchSettings
{
  return 0;
}

- (AccessibilityAirPodSettingsController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AccessibilityAirPodSettingsController;
  v2 = [(AXUISettingsSetupCapableListController *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_reloadSpecifiers name:*MEMORY[0x1E4FB8FF0] object:0];

    v4 = v2;
  }

  return v2;
}

- (double)toneVolumeValue
{
  BOOL v3 = [(AccessibilityAirPodSettingsController *)self isInWatchSettings];
  v4 = [MEMORY[0x1E4F49418] sharedInstance];
  v5 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
  if (v3)
  {
    objc_msgSend(v4, "nps_toneVolumeForDeviceAddress:", v5);
    double v7 = v6;
  }
  else
  {
    double v7 = (double)[v4 toneVolumeForDeviceAddress:v5];
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AccessibilityAirPodSettingsController;
  [(AccessibilityAirPodSettingsController *)&v5 viewWillAppear:a3];
  [(AccessibilityAirPodSettingsController *)self toneVolumeValue];
  *(float *)&double v4 = v4;
  [(AccessibilityAirPodSettingsController *)self _updateToneVolumeFooter:v4];
}

- (BOOL)supportsSpatialAudio
{
  if ([(AccessibilityAirPodSettingsController *)self isInWatchSettings]) {
    return 0;
  }
  BOOL v3 = [MEMORY[0x1E4F49418] sharedInstance];
  char v4 = [v3 supportsSpatialAudio];

  return v4;
}

- (void)setSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AccessibilityAirPodSettingsController;
  [(AccessibilityAirPodSettingsController *)&v7 setSpecifier:a3];
  char v4 = [(AccessibilityAirPodSettingsController *)self specifier];
  objc_super v5 = [v4 propertyForKey:@"AirPods"];
  float v6 = [v5 firstObject];

  if (v6) {
    objc_storeStrong((id *)&self->_btDevice, v6);
  }
}

- (BOOL)isBeatsProduct
{
  BOOL v3 = [MEMORY[0x1E4F49418] sharedInstance];
  LOBYTE(self) = [v3 isBeatsProduct:self->_btDevice];

  return (char)self;
}

- (double)defaultToneVolumeValue
{
  BOOL v3 = [(AccessibilityAirPodSettingsController *)self isInWatchSettings];
  char v4 = [MEMORY[0x1E4F49418] sharedInstance];
  objc_super v5 = [(BluetoothDevice *)self->_btDevice address];
  if (v3) {
    unsigned int v6 = objc_msgSend(v4, "nps_defaultToneVolumeForDeviceAddress:", v5);
  }
  else {
    unsigned int v6 = [v4 defaultToneVolumeForDeviceAddress:v5];
  }
  unsigned int v7 = v6;

  return (double)v7;
}

- (double)displayedMaxValue
{
  [(AccessibilityAirPodSettingsController *)self defaultToneVolumeValue];
  return 10000.0 / (double)v2;
}

- (double)holdSpeedValue
{
  BOOL v3 = [(AccessibilityAirPodSettingsController *)self isInWatchSettings];
  char v4 = [MEMORY[0x1E4F49418] sharedInstance];
  objc_super v5 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
  if (v3) {
    objc_msgSend(v4, "nps_holdDurationForDeviceAddress:", v5);
  }
  else {
    [v4 holdDurationForDeviceAddress:v5];
  }
  float v7 = v6;

  return v7;
}

- (double)tapSpeedValue
{
  BOOL v3 = [(AccessibilityAirPodSettingsController *)self isInWatchSettings];
  char v4 = [MEMORY[0x1E4F49418] sharedInstance];
  objc_super v5 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
  if (v3) {
    objc_msgSend(v4, "nps_tapSpeedForDeviceAddress:", v5);
  }
  else {
    [v4 tapSpeedForDeviceAddress:v5];
  }
  float v7 = v6;

  return v7;
}

- (double)volumeSwipeDurationValue
{
  BOOL v3 = [(AccessibilityAirPodSettingsController *)self isInWatchSettings];
  char v4 = [MEMORY[0x1E4F49418] sharedInstance];
  objc_super v5 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
  if (v3) {
    objc_msgSend(v4, "nps_volumeSwipeDurationForDeviceAddress:", v5);
  }
  else {
    [v4 volumeSwipeDurationForDeviceAddress:v5];
  }
  float v7 = v6;

  return v7;
}

- (id)specifiers
{
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  if (!v3)
  {
    uint64_t v158 = (int)*MEMORY[0x1E4F92F08];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_super v5 = [MEMORY[0x1E4F49418] sharedInstance];
    float v6 = [(BluetoothDevice *)self->_btDevice address];
    int v7 = [v5 supportsTapSpeedForDeviceAddress:v6];

    v8 = (uint64_t *)MEMORY[0x1E4F931A8];
    v157 = v4;
    if (v7)
    {
      v9 = (void *)MEMORY[0x1E4F92E70];
      v10 = AXAirPodsLocalizedStringForKey();
      v11 = [v9 groupSpecifierWithName:v10];
      doubleTapGroup = self->_doubleTapGroup;
      self->_doubleTapGroup = v11;

      uint64_t v13 = *v8;
      [(PSSpecifier *)self->_doubleTapGroup setProperty:MEMORY[0x1E4F1CC38] forKey:v13];
      v14 = self->_doubleTapGroup;
      v15 = AXAirPodsLocalizedStringForKey();
      uint64_t v16 = *MEMORY[0x1E4F93170];
      [(PSSpecifier *)v14 setProperty:v15 forKey:*MEMORY[0x1E4F93170]];

      uint64_t v17 = *MEMORY[0x1E4F93188];
      [(PSSpecifier *)self->_doubleTapGroup setProperty:@"TapGroup" forKey:*MEMORY[0x1E4F93188]];
      v18 = (void *)MEMORY[0x1E4F92E70];
      v19 = AXAirPodsLocalizedStringForKey();
      v20 = [v18 preferenceSpecifierNamed:v19 target:0 set:0 get:0 detail:0 cell:3 edit:0];

      [v20 setProperty:@"TapDefault" forKey:v17];
      v21 = (void *)MEMORY[0x1E4F92E70];
      v22 = AXAirPodsLocalizedStringForKey();
      v23 = [v21 preferenceSpecifierNamed:v22 target:0 set:0 get:0 detail:0 cell:3 edit:0];

      [v23 setProperty:@"TapSlow" forKey:v17];
      v24 = (void *)MEMORY[0x1E4F92E70];
      v25 = AXAirPodsLocalizedStringForKey();
      v26 = [v24 preferenceSpecifierNamed:v25 target:0 set:0 get:0 detail:0 cell:3 edit:0];

      [v26 setProperty:@"TapSlowest" forKey:v17];
      [(AccessibilityAirPodSettingsController *)self tapSpeedValue];
      *(float *)&double v27 = v27;
      double v28 = *(float *)&v27;
      v29 = v20;
      if (fabs(v28 + -0.25) <= 0.0500000007
        || (v29 = v23, fabs(v28 + -0.45) <= 0.0500000007)
        || (v29 = v26, fabs(v28 + -0.65) <= 0.0500000007))
      {
        [(PSSpecifier *)self->_doubleTapGroup setProperty:v29 forKey:*MEMORY[0x1E4F931D8]];
      }
      v155 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_doubleTapGroup, v20, v23, v26, 0);
      objc_msgSend(v4, "addObjectsFromArray:");
      v30 = (void *)MEMORY[0x1E4F92E70];
      v31 = AXAirPodsLocalizedStringForKey();
      v32 = [v30 groupSpecifierWithName:v31];
      holdGroup = self->_holdGroup;
      self->_holdGroup = v32;

      [(PSSpecifier *)self->_holdGroup setProperty:MEMORY[0x1E4F1CC38] forKey:v13];
      v34 = self->_holdGroup;
      v35 = AXAirPodsLocalizedStringForKey();
      [(PSSpecifier *)v34 setProperty:v35 forKey:v16];

      [(PSSpecifier *)self->_holdGroup setProperty:@"HoldGroup" forKey:v17];
      if ([(AccessibilityAirPodSettingsController *)self isBeatsProduct])
      {
        v36 = self->_holdGroup;
        v37 = AXBeats463LocalizedStringForKey();
        [(PSSpecifier *)v36 setProperty:v37 forKey:v16];
      }
      v38 = (void *)MEMORY[0x1E4F92E70];
      v39 = AXAirPodsLocalizedStringForKey();
      v40 = [v38 preferenceSpecifierNamed:v39 target:0 set:0 get:0 detail:0 cell:3 edit:0];

      [v40 setProperty:@"HoldDefault" forKey:v17];
      v41 = (void *)MEMORY[0x1E4F92E70];
      v42 = AXAirPodsLocalizedStringForKey();
      v43 = [v41 preferenceSpecifierNamed:v42 target:0 set:0 get:0 detail:0 cell:3 edit:0];

      [v43 setProperty:@"HoldFast" forKey:v17];
      v44 = (void *)MEMORY[0x1E4F92E70];
      v45 = AXAirPodsLocalizedStringForKey();
      v46 = [v44 preferenceSpecifierNamed:v45 target:0 set:0 get:0 detail:0 cell:3 edit:0];

      [v46 setProperty:@"HoldFastest" forKey:v17];
      [(AccessibilityAirPodSettingsController *)self holdSpeedValue];
      *(float *)&double v47 = v47;
      double v48 = *(float *)&v47;
      v49 = v40;
      if (fabs(v48 + -0.5) <= 0.0500000007
        || (v49 = v43, fabs(v48 + -0.4) <= 0.0500000007)
        || (v49 = v46, fabs(v48 + -0.35) <= 0.0500000007))
      {
        [(PSSpecifier *)self->_holdGroup setProperty:v49 forKey:*MEMORY[0x1E4F931D8]];
      }
      v50 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_holdGroup, v40, v43, v46, 0);
      id v4 = v157;
      [v157 addObjectsFromArray:v50];
    }
    v51 = [MEMORY[0x1E4F49418] sharedInstance];
    v52 = [(BluetoothDevice *)self->_btDevice address];
    int v53 = [v51 supportsNoiseCancellationEnabledForDeviceAddress:v52];

    if (v53)
    {
      v54 = AXAirPodsLocalizedStringForKey();
      if ([(AccessibilityAirPodSettingsController *)self isBeatsProduct])
      {
        uint64_t v55 = AXAirPodsB494LocalizedStringForKey();

        v54 = (void *)v55;
      }
      AXDeviceIsRealityDevice();
      v58 = (void *)MEMORY[0x1E4F92E70];
      v59 = AXAirPodsLocalizedStringForKey();
      v57 = [v58 groupSpecifierWithName:v59];

      [v57 setProperty:v54 forKey:*MEMORY[0x1E4F93170]];
      uint64_t v60 = *MEMORY[0x1E4F93188];
      [v57 setProperty:@"NoiseControlGroup" forKey:*MEMORY[0x1E4F93188]];
      [v4 addObject:v57];
      v61 = (void *)MEMORY[0x1E4F92E70];
      v62 = AXAirPodsLocalizedStringForKey();
      v56 = [v61 preferenceSpecifierNamed:v62 target:self set:sel_setNoiseCancellation_specifier_ get:sel_noiseCancellation_ detail:0 cell:6 edit:0];

      [v56 setProperty:@"NoiseControl" forKey:v60];
      [v4 addObject:v56];
    }
    else
    {
      v56 = 0;
      v57 = 0;
    }
    AXDeviceIsPhone();
    v63 = AXAirPodsLocalizedStringForKey();
    if ([(AccessibilityAirPodSettingsController *)self isBeatsProduct])
    {
      if (AXDeviceIsPhone()) {
        AXAirPodsLocalizedStringForKey();
      }
      else {
      uint64_t v64 = AXAirPodsB494LocalizedStringForKey();
      }

      v63 = (void *)v64;
    }
    if (![(AccessibilityAirPodSettingsController *)self isInWatchSettings])
    {
      v156 = v56;
      v65 = [(BluetoothDevice *)self->_btDevice address];
      if (_os_feature_enabled_impl())
      {
        v66 = [getHUAccessoryHearingSettingsClass() sharedInstance];
        int v67 = [v66 activeHearingProtectionAvailableForAddress:v65];

        if (v67)
        {
          v68 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
          v69 = accessibilityHearingAidSupportBundle_Soft();
          v154 = [v69 localizedStringForKey:@"LoudNoiseToggleFooter" value:@"LoudNoiseToggleFooter" table:@"HearingProtection-Yodel"];

          v70 = accessibilityHearingAidSupportBundle_Soft();
          uint64_t v71 = [v70 localizedStringForKey:@"LoudNoiseToggleLearnMore" value:@"LoudNoiseToggleLearnMore" table:@"HearingProtection-Yodel"];

          v153 = (void *)v71;
          v72 = [v154 stringByAppendingFormat:@" %@", v71];
          v73 = (objc_class *)objc_opt_class();
          v74 = NSStringFromClass(v73);
          [v68 setProperty:v74 forKey:*MEMORY[0x1E4F93140]];

          v152 = v72;
          [v68 setProperty:v72 forKey:*MEMORY[0x1E4F93160]];
          v161.location = [v72 rangeOfString:v71];
          v75 = NSStringFromRange(v161);
          [v68 setProperty:v75 forKey:*MEMORY[0x1E4F93150]];

          v76 = NSStringFromSelector(sel_showLoudNoiseLearnMore);
          [v68 setProperty:v76 forKey:*MEMORY[0x1E4F93148]];

          v77 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
          [v68 setProperty:v77 forKey:*MEMORY[0x1E4F93158]];

          [v4 addObject:v68];
          v78 = [getHUAccessoryHearingSettingsClass() sharedInstance];
          int v79 = [v78 activeHearingProtectionEnabledForAddress:v65];
          v80 = @"LoudNoiseToggleOn";
          if (v79) {
            v80 = @"LoudNoiseToggleOff";
          }
          v81 = v80;

          v82 = (void *)MEMORY[0x1E4F92E70];
          v83 = accessibilityHearingAidSupportBundle_Soft();
          [v83 localizedStringForKey:v81 value:v81 table:@"HearingProtection-Yodel"];
          v85 = v84 = v4;

          v86 = [v82 preferenceSpecifierNamed:v85 target:self set:0 get:0 detail:0 cell:13 edit:0];

          id v4 = v84;
          [v86 setButtonAction:sel_loudNoiseToggled_];
          [v84 addObject:v86];
        }
      }
      v87 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
      [v87 setProperty:v63 forKey:*MEMORY[0x1E4F93170]];
      [v4 addObject:v87];
      AXDeviceIsPhone();
      v88 = AXAirPodsLocalizedStringForKey();
      v89 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v88 target:self set:0 get:0 detail:0 cell:13 edit:0];
      [v89 setButtonAction:sel_jumpToAVSettings_];
      [v89 setProperty:@"PERSONAL_AUDIO_AIRPODS_BUTTON" forKey:*MEMORY[0x1E4F93188]];
      [v4 addObject:v89];

      v56 = v156;
    }
    if ([(AccessibilityAirPodSettingsController *)self supportsSpatialAudio])
    {
      v90 = [MEMORY[0x1E4F49418] sharedInstance];
      v91 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
      int v92 = [v90 supportsSpatialAudioForDeviceAddress:v91];

      if (v92)
      {
        v93 = (void *)MEMORY[0x1E4F92E70];
        v94 = AXAirPodsLocalizedStringForKey();
        v95 = [v93 groupSpecifierWithName:v94];

        v96 = AXLocStringKeyForModel();
        v97 = AXAirPodsLocalizedStringForKey();
        [v95 setProperty:v97 forKey:*MEMORY[0x1E4F93170]];

        uint64_t v98 = *MEMORY[0x1E4F93188];
        [v95 setProperty:@"SPATIAL_AUDIO_GROUP" forKey:*MEMORY[0x1E4F93188]];
        [v95 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F931A8]];
        [v4 addObject:v95];
        v99 = (void *)MEMORY[0x1E4F92E70];
        v100 = AXLocStringKeyForModel();
        v101 = AXAirPodsLocalizedStringForKey();
        v102 = [v99 preferenceSpecifierNamed:v101 target:self set:sel_setSpatialAudioLock_specifier_ get:sel_spatialAudioLock_ detail:0 cell:6 edit:0];

        [v102 setProperty:@"SPATIAL_AUDIO_SWITCH" forKey:v98];
        [v4 addObject:v102];
        v56 = v102;
        v57 = v95;
      }
    }
    v103 = [MEMORY[0x1E4F49418] sharedInstance];
    v104 = [(BluetoothDevice *)self->_btDevice address];
    int v105 = [v103 supportsCaseTonesForDeviceAddress:v104];

    if (v105)
    {
      v106 = (void *)MEMORY[0x1E4F92E70];
      v107 = AXBeats463LocalizedStringForKey();
      v108 = [v106 groupSpecifierWithName:v107];

      [v108 setProperty:@"CASE_TONES" forKey:*MEMORY[0x1E4F93188]];
      v109 = AXBeats463LocalizedStringForKey();
      [v108 setProperty:v109 forKey:*MEMORY[0x1E4F93170]];

      [v4 addObject:v108];
      v110 = AXBeats463LocalizedStringForKey();
      v111 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v110 target:self set:sel_setCaseTonesEnabled_specifier_ get:sel_caseTonesEnabled detail:0 cell:6 edit:0];
      [v4 addObject:v111];

      v57 = v108;
    }
    v112 = [MEMORY[0x1E4F49418] sharedInstance];
    v113 = [(BluetoothDevice *)self->_btDevice address];
    int v114 = [v112 supportsToneVolumeForDeviceAddress:v113];

    if (v114)
    {
      v115 = (void *)MEMORY[0x1E4F92E70];
      v116 = AXAirPodsLocalizedStringForKey();
      v117 = [v115 groupSpecifierWithName:v116];

      uint64_t v118 = *MEMORY[0x1E4F93188];
      [v117 setProperty:@"ToneVolumeFooterID" forKey:*MEMORY[0x1E4F93188]];
      [v4 addObject:v117];
      v119 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:self set:sel_setToneVolume_specifier_ get:sel_toneVolume_ detail:0 cell:5 edit:0];
      v120 = AXSpeakerMaxImage();
      [v119 setProperty:v120 forKey:*MEMORY[0x1E4F931F0]];

      v121 = AXSpeakerMuteImage();
      [v119 setProperty:v121 forKey:*MEMORY[0x1E4F931E8]];

      [v119 setProperty:&unk_1F1F201C8 forKey:*MEMORY[0x1E4F930F8]];
      [v119 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
      [v119 setProperty:&unk_1F1F201E0 forKey:*MEMORY[0x1E4F93100]];
      [v119 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93198]];
      [v119 setProperty:@"TONE_VOLUME" forKey:v118];
      v122 = [(BluetoothDevice *)self->_btDevice address];
      [v119 setProperty:v122 forKey:@"BTAddress"];

      [v4 addObject:v119];
      v57 = v117;
    }
    v123 = [MEMORY[0x1E4F49418] sharedInstance];
    v124 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
    int v125 = [v123 supportsVolumeSwipeForDeviceAddress:v124];

    if (v125)
    {
      v159 = v63;
      v126 = (void *)MEMORY[0x1E4F92E70];
      v127 = AXAirPodsB698LocalizedStringForKey();
      v128 = [v126 groupSpecifierWithName:v127];

      v129 = AXAirPodsB698LocalizedStringForKey();
      uint64_t v130 = *MEMORY[0x1E4F93170];
      [v128 setProperty:v129 forKey:*MEMORY[0x1E4F93170]];

      [v4 addObject:v128];
      v131 = (void *)MEMORY[0x1E4F92E70];
      v132 = AXAirPodsB698LocalizedStringForKey();
      v133 = [v131 preferenceSpecifierNamed:v132 target:self set:sel_setVolumeSwipeEnabled_specifier_ get:sel_volumeSwipeEnabled_ detail:0 cell:6 edit:0];

      uint64_t v134 = *MEMORY[0x1E4F93188];
      [v133 setProperty:@"VOLUME_SWIPE_SWITCH" forKey:*MEMORY[0x1E4F93188]];
      [v4 addObject:v133];
      v135 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
      v136 = AXAirPodsB698LocalizedStringForKey();
      [v135 setProperty:v136 forKey:v130];

      [v135 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F931A8]];
      [v135 setProperty:@"VOLUME_SWIPE_GROUP" forKey:v134];
      v137 = (void *)MEMORY[0x1E4F92E70];
      v138 = AXAirPodsB698LocalizedStringForKey();
      v139 = [v137 preferenceSpecifierNamed:v138 target:0 set:0 get:0 detail:0 cell:3 edit:0];

      [v139 setProperty:@"VOLUME_SWIPE_DEFAULT" forKey:v134];
      v140 = (void *)MEMORY[0x1E4F92E70];
      v141 = AXAirPodsB698LocalizedStringForKey();
      v142 = [v140 preferenceSpecifierNamed:v141 target:0 set:0 get:0 detail:0 cell:3 edit:0];

      [v142 setProperty:@"VOLUME_SWIPE_LONG" forKey:v134];
      v143 = (void *)MEMORY[0x1E4F92E70];
      v144 = AXAirPodsB698LocalizedStringForKey();
      v145 = [v143 preferenceSpecifierNamed:v144 target:0 set:0 get:0 detail:0 cell:3 edit:0];

      [v145 setProperty:@"VOLUME_SWIPE_LONGEST" forKey:v134];
      [(AccessibilityAirPodSettingsController *)self volumeSwipeDurationValue];
      *(float *)&double v146 = v146;
      double v147 = *(float *)&v146;
      v148 = v139;
      if (fabs(v147 + -0.5) <= 0.0500000007
        || (v148 = v142, fabs(v147 + -0.4) <= 0.0500000007)
        || (v148 = v145, fabs(v147 + -0.35) <= 0.0500000007))
      {
        [v135 setProperty:v148 forKey:*MEMORY[0x1E4F931D8]];
      }
      v149 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v135, v139, v142, v145, 0);
      [v157 addObjectsFromArray:v149];

      id v4 = v157;
      v56 = v133;
      v57 = v128;
      v63 = v159;
    }
    v150 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v158);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v158) = (Class)v4;

    BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v158);
  }
  return v3;
}

- (void)showLoudNoiseLearnMore
{
  double v2 = (void *)*MEMORY[0x1E4FB2608];
  [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/120850?cid=mc-ols-airpods-article_120850-settings_ui-08212024"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 openURL:v3 withCompletionHandler:0];
}

- (void)confirmationViewAcceptedForSpecifier:(id)a3
{
  id v4 = [getHUAccessoryHearingSettingsClass() sharedInstance];
  objc_super v5 = [(BluetoothDevice *)self->_btDevice address];
  [v4 setActiveHearingProtectionEnabled:0 forAddress:v5];

  [(AccessibilityAirPodSettingsController *)self reloadSpecifiers];
}

- (void)loudNoiseToggled:(id)a3
{
  btDevice = self->_btDevice;
  id v5 = a3;
  id v26 = [(BluetoothDevice *)btDevice address];
  float v6 = [getHUAccessoryHearingSettingsClass() sharedInstance];
  int v7 = [v6 activeHearingProtectionEnabledForAddress:v26];

  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F92E20]);
    v9 = accessibilityHearingAidSupportBundle_Soft();
    v10 = [v9 localizedStringForKey:@"LoudNoiseToggleAlertTitle" value:@"LoudNoiseToggleAlertTitle" table:@"HearingProtection-Yodel"];
    [v8 setTitle:v10];

    v11 = NSString;
    v12 = accessibilityHearingAidSupportBundle_Soft();
    uint64_t v13 = [v12 localizedStringForKey:@"LoudNoiseToggleAlertDescription" value:@"LoudNoiseToggleAlertDescription" table:@"HearingProtection-Yodel"];
    v14 = [(BluetoothDevice *)self->_btDevice name];
    v15 = objc_msgSend(v11, "stringWithFormat:", v13, v14);
    [v8 setPrompt:v15];

    uint64_t v16 = accessibilityHearingAidSupportBundle_Soft();
    uint64_t v17 = [v16 localizedStringForKey:@"hpCancel" value:@"hpCancel" table:@"HearingProtection-Yodel"];
    [v8 setCancelButton:v17];

    v18 = accessibilityHearingAidSupportBundle_Soft();
    v19 = [v18 localizedStringForKey:@"hpOk" value:@"hpOk" table:@"HearingProtection-Yodel"];
    [v8 setOkButton:v19];

    [(AccessibilityAirPodSettingsController *)self showConfirmationViewForSpecifier:v8 useAlert:1];
  }
  else
  {
    id v8 = [getHUAccessoryHearingSettingsClass() sharedInstance];
    [v8 setActiveHearingProtectionEnabled:1 forAddress:v26];
  }

  v20 = [getHUAccessoryHearingSettingsClass() sharedInstance];
  int v21 = [v20 activeHearingProtectionEnabledForAddress:v26];
  v22 = @"LoudNoiseToggleOn";
  if (v21) {
    v22 = @"LoudNoiseToggleOff";
  }
  v23 = v22;

  v24 = accessibilityHearingAidSupportBundle_Soft();
  v25 = [v24 localizedStringForKey:v23 value:v23 table:@"HearingProtection-Yodel"];

  [v5 setName:v25];
  [(AccessibilityAirPodSettingsController *)self reloadSpecifier:v5];
}

- (void)setVolumeSwipeEnabled:(id)a3 specifier:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F49418];
  id v6 = a3;
  id v9 = [v5 sharedInstance];
  uint64_t v7 = [v6 BOOLValue];

  id v8 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
  [v9 setVolumeSwipeEnabled:v7 forDeviceAddress:v8];
}

- (id)volumeSwipeEnabled:(id)a3
{
  id v4 = NSNumber;
  id v5 = objc_msgSend(MEMORY[0x1E4F49418], "sharedInstance", a3);
  id v6 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
  uint64_t v7 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "volumeSwipeEnabledForDeviceAddress:", v6));

  return v7;
}

- (void)applyHapticIfNecessary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F49418] sharedInstance];
  id v6 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
  float v7 = (float)[v5 defaultToneVolumeForDeviceAddress:v6];

  id v8 = AXLogAirPodSettings();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(float *)&double v9 = v7;
    v10 = [NSNumber numberWithFloat:v9];
    v11 = [NSNumber numberWithBool:self->_hapticPlayedValue];
    int v17 = 138412802;
    v18 = v10;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1C39D1000, v8, OS_LOG_TYPE_INFO, "Apply haptic: %@ value: %@ current hap: %@", (uint8_t *)&v17, 0x20u);
  }
  [v4 floatValue];
  float v13 = vabds_f32(v12, v7);
  if (v13 >= 0.5 || self->_hapticPlayedValue)
  {
    if (v13 > 2.0) {
      self->_hapticPlayedValue = 0;
    }
  }
  else
  {
    hapticGenerator = self->_hapticGenerator;
    if (!hapticGenerator)
    {
      v15 = (UIImpactFeedbackGenerator *)[objc_alloc(MEMORY[0x1E4FB1840]) initWithStyle:1];
      uint64_t v16 = self->_hapticGenerator;
      self->_hapticGenerator = v15;

      hapticGenerator = self->_hapticGenerator;
    }
    [(UIImpactFeedbackGenerator *)hapticGenerator impactOccurred];
    self->_hapticPlayedValue = 1;
  }
}

- (void)setCaseTonesEnabled:(id)a3 specifier:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F49418];
  id v6 = a3;
  id v9 = [v5 sharedInstance];
  uint64_t v7 = [v6 BOOLValue];

  id v8 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
  [v9 setCaseTonesEnabled:v7 forDeviceAddress:v8];
}

- (id)caseTonesEnabled
{
  id v3 = NSNumber;
  id v4 = [MEMORY[0x1E4F49418] sharedInstance];
  id v5 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
  id v6 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "caseTonesEnabledForDeviceAddress:", v5));

  return v6;
}

- (void)setToneVolume:(id)a3 specifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [a3 floatValue];
  float v6 = v5;
  uint64_t v7 = [MEMORY[0x1E4F49418] sharedInstance];
  id v8 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
  float v9 = (float)[v7 defaultToneVolumeForDeviceAddress:v8];

  if (vabds_f32(v6, v9) <= 2.0 && ([(UISlider *)self->_toneVolumeSlider isTracking] & 1) == 0)
  {
    *(float *)&double v10 = v9;
    [(UISlider *)self->_toneVolumeSlider setValue:1 animated:v10];
    float v6 = v9;
  }
  v11 = AXLogAirPodSettings();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(float *)&double v12 = v6;
    float v13 = [NSNumber numberWithFloat:v12];
    int v19 = 138412290;
    id v20 = v13;
    _os_log_impl(&dword_1C39D1000, v11, OS_LOG_TYPE_DEFAULT, "Set tone volume value: %@", (uint8_t *)&v19, 0xCu);
  }
  BOOL v14 = [(AccessibilityAirPodSettingsController *)self isInWatchSettings];
  v15 = [MEMORY[0x1E4F49418] sharedInstance];
  [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
  if (v14) {
    uint64_t v16 = {;
  }
    *(float *)&double v17 = v6;
    objc_msgSend(v15, "nps_setToneVolume:forDeviceAddress:", v16, v17);
  }
  else {
    uint64_t v16 = {;
  }
    [v15 setToneVolume:v6 forDeviceAddress:v16];
  }

  if (([(UISlider *)self->_toneVolumeSlider isTracking] & 1) == 0)
  {
    *(float *)&double v18 = v6;
    [(AccessibilityAirPodSettingsController *)self _updateToneVolumeFooter:v18];
  }
}

- (void)_updateToneVolumeFooter:(float)a3
{
  id v12 = [(AccessibilityAirPodSettingsController *)self specifierForID:@"ToneVolumeFooterID"];
  float v5 = AXAirPodsLocalizedStringForKey();
  if ([(AccessibilityAirPodSettingsController *)self isBeatsProduct])
  {
    uint64_t v6 = AXAirPodsLocalizedStringForKey();

    float v5 = (void *)v6;
  }
  uint64_t v7 = [MEMORY[0x1E4F49418] sharedInstance];
  id v8 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
  float v9 = (float)[v7 defaultToneVolumeForDeviceAddress:v8];

  if (v9 < a3)
  {
    double v10 = AXAirPodsLocalizedStringForKey();
    uint64_t v11 = [v5 stringByAppendingFormat:@" %@", v10];

    float v5 = (void *)v11;
  }
  [v12 setProperty:v5 forKey:*MEMORY[0x1E4F93170]];
  [(AccessibilityAirPodSettingsController *)self reloadSpecifier:v12];
}

- (id)toneVolume:(id)a3
{
  BOOL v4 = [(AccessibilityAirPodSettingsController *)self isInWatchSettings];
  float v5 = NSNumber;
  uint64_t v6 = [MEMORY[0x1E4F49418] sharedInstance];
  uint64_t v7 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
  if (v4)
  {
    objc_msgSend(v6, "nps_toneVolumeForDeviceAddress:", v7);
    objc_msgSend(v5, "numberWithFloat:");
  }
  else
  {
    objc_msgSend(v5, "numberWithUnsignedInt:", objc_msgSend(v6, "toneVolumeForDeviceAddress:", v7));
  id v8 = };

  return v8;
}

- (void)setSpatialAudioLock:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 0;
  }
  MEMORY[0x1F4178FE0](v4);
}

- (id)spatialAudioLock:(id)a3
{
  BOOL v3 = _AXSSpatialAudioHeadTracking() != 0;
  uint64_t v4 = NSNumber;
  return (id)[v4 numberWithInt:v3];
}

- (void)jumpToAVSettings:(id)a3
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=ACCESSIBILITY&path=AUDIO_VISUAL_TITLE"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (id)_btDeviceAddress
{
  return (id)[(BluetoothDevice *)self->_btDevice address];
}

- (id)noiseCancellation:(id)a3
{
  BOOL v4 = [(AccessibilityAirPodSettingsController *)self isInWatchSettings];
  float v5 = NSNumber;
  uint64_t v6 = [MEMORY[0x1E4F49418] sharedInstance];
  uint64_t v7 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
  if (v4) {
    uint64_t v8 = objc_msgSend(v6, "nps_noiseCancellationEnabledWithOneUnitForDeviceAddress:", v7);
  }
  else {
    uint64_t v8 = [v6 noiseCancellationEnabledWithOneUnitForDeviceAddress:v7];
  }
  float v9 = [v5 numberWithBool:v8];

  return v9;
}

- (void)setNoiseCancellation:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  BOOL v6 = [(AccessibilityAirPodSettingsController *)self isInWatchSettings];
  id v9 = [MEMORY[0x1E4F49418] sharedInstance];
  uint64_t v7 = [v5 BOOLValue];

  uint64_t v8 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
  if (v6) {
    objc_msgSend(v9, "nps_setNoiseCancellationEnabledWithOneUnit:forDeviceAddress:", v7, v8);
  }
  else {
    [v9 setNoiseCancellationEnabledWithOneUnit:v7 forDeviceAddress:v8];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)AccessibilityAirPodSettingsController;
  id v6 = a4;
  uint64_t v7 = [(AccessibilityAirPodSettingsController *)&v19 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = -[AccessibilityAirPodSettingsController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v19.receiver, v19.super_class);

  uint64_t v9 = *MEMORY[0x1E4F93188];
  double v10 = [v8 propertyForKey:*MEMORY[0x1E4F93188]];
  if ([v10 isEqualToString:@"NoiseControl"])
  {

LABEL_4:
    float v13 = [v7 textLabel];
    [v13 setNumberOfLines:0];

    goto LABEL_5;
  }
  uint64_t v11 = [v8 propertyForKey:v9];
  int v12 = [v11 isEqualToString:@"PERSONAL_AUDIO_AIRPODS_BUTTON"];

  if (v12) {
    goto LABEL_4;
  }
  v15 = [v8 propertyForKey:v9];
  int v16 = [v15 isEqualToString:@"TONE_VOLUME"];

  if (v16)
  {
    [v7 setController:self];
    double v17 = [v7 slider];
    toneVolumeSlider = self->_toneVolumeSlider;
    self->_toneVolumeSlider = v17;

    [v7 layoutSubviews];
  }
LABEL_5:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v43.receiver = self;
  v43.super_class = (Class)AccessibilityAirPodSettingsController;
  id v6 = a4;
  [(AXUISettingsSetupCapableListController *)&v43 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = objc_msgSend(v6, "section", v43.receiver, v43.super_class);

  uint64_t v8 = [(AccessibilityAirPodSettingsController *)self specifierAtIndex:[(AccessibilityAirPodSettingsController *)self indexOfGroup:v7]];
  uint64_t v9 = *MEMORY[0x1E4F93188];
  double v10 = [v8 propertyForKey:*MEMORY[0x1E4F93188]];
  int v11 = [v10 isEqualToString:@"TapGroup"];

  if (v11)
  {
    int v12 = [v8 propertyForKey:*MEMORY[0x1E4F931D8]];
    float v13 = [v12 propertyForKey:v9];

    BOOL v14 = [MEMORY[0x1E4F49418] sharedInstance];
    v15 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
    [v14 tapSpeedForDeviceAddress:v15];
    float v17 = v16;

    float v18 = 0.25;
    if (([v13 isEqualToString:@"TapDefault"] & 1) == 0)
    {
      if ([v13 isEqualToString:@"TapSlow"])
      {
        float v18 = 0.45;
      }
      else if ([v13 isEqualToString:@"TapSlowest"])
      {
        float v18 = 0.65;
      }
      else
      {
        float v18 = v17;
      }
    }
    BOOL v35 = [(AccessibilityAirPodSettingsController *)self isInWatchSettings];
    v36 = [MEMORY[0x1E4F49418] sharedInstance];
    v37 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
    *(float *)&double v38 = v18;
    if (v35) {
      objc_msgSend(v36, "nps_setTapSpeed:forDeviceAddress:", v37, v38);
    }
    else {
      [v36 setTapSpeed:v37 forDeviceAddress:v38];
    }
LABEL_31:

    goto LABEL_32;
  }
  objc_super v19 = [v8 propertyForKey:v9];
  int v20 = [v19 isEqualToString:@"HoldGroup"];

  if (v20)
  {
    uint64_t v21 = [v8 propertyForKey:*MEMORY[0x1E4F931D8]];
    float v13 = [v21 propertyForKey:v9];

    v22 = [MEMORY[0x1E4F49418] sharedInstance];
    uint64_t v23 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
    [v22 holdDurationForDeviceAddress:v23];
    float v25 = v24;

    float v26 = 0.5;
    if (([v13 isEqualToString:@"HoldDefault"] & 1) == 0)
    {
      if ([v13 isEqualToString:@"HoldFast"])
      {
        float v26 = 0.4;
      }
      else if ([v13 isEqualToString:@"HoldFastest"])
      {
        float v26 = 0.35;
      }
      else
      {
        float v26 = v25;
      }
    }
    BOOL v39 = [(AccessibilityAirPodSettingsController *)self isInWatchSettings];
    v36 = [MEMORY[0x1E4F49418] sharedInstance];
    v37 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
    *(float *)&double v40 = v26;
    if (v39) {
      objc_msgSend(v36, "nps_setHoldDuration:forDeviceAddress:", v37, v40);
    }
    else {
      [v36 setHoldDuration:v37 forDeviceAddress:v40];
    }
    goto LABEL_31;
  }
  double v27 = [v8 propertyForKey:v9];
  int v28 = [v27 isEqualToString:@"VOLUME_SWIPE_GROUP"];

  if (v28)
  {
    v29 = [v8 propertyForKey:*MEMORY[0x1E4F931D8]];
    float v13 = [v29 propertyForKey:v9];

    v30 = [MEMORY[0x1E4F49418] sharedInstance];
    v31 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
    [v30 volumeSwipeDurationForDeviceAddress:v31];
    float v33 = v32;

    float v34 = 0.5;
    if (([v13 isEqualToString:@"VOLUME_SWIPE_DEFAULT"] & 1) == 0)
    {
      if ([v13 isEqualToString:@"VOLUME_SWIPE_LONG"])
      {
        float v34 = 0.4;
      }
      else if ([v13 isEqualToString:@"VOLUME_SWIPE_LONGEST"])
      {
        float v34 = 0.35;
      }
      else
      {
        float v34 = v33;
      }
    }
    BOOL v41 = [(AccessibilityAirPodSettingsController *)self isInWatchSettings];
    v36 = [MEMORY[0x1E4F49418] sharedInstance];
    v37 = [(AccessibilityAirPodSettingsController *)self _btDeviceAddress];
    *(float *)&double v42 = v34;
    if (v41) {
      objc_msgSend(v36, "nps_setVolumeSwipeDuration:forDeviceAddress:", v37, v42);
    }
    else {
      [v36 setVolumeSwipeDuration:v37 forDeviceAddress:v42];
    }
    goto LABEL_31;
  }
LABEL_32:
}

- (BluetoothDevice)bluetoothDevice
{
  return self->_bluetoothDevice;
}

- (void)setBluetoothDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothDevice, 0);
  objc_storeStrong((id *)&self->_hapticGenerator, 0);
  objc_storeStrong((id *)&self->_toneVolumeSlider, 0);
  objc_storeStrong((id *)&self->_btDevice, 0);
  objc_storeStrong((id *)&self->_holdGroup, 0);
  objc_storeStrong((id *)&self->_doubleTapGroup, 0);
}

@end