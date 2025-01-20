@interface ASVSettings
+ (ASVSettingsProvider)sharedSettings;
+ (float)BOOLForKey:(id)a3;
+ (float)floatForKey:(id)a3;
- (ASVSettings)init;
- (NSDictionary)settings;
- (float)BOOLForKey:(id)a3;
- (float)floatForKey:(id)a3;
@end

@implementation ASVSettings

- (ASVSettings)init
{
  v189.receiver = self;
  v189.super_class = (Class)ASVSettings;
  v2 = [(ASVSettings *)&v189 init];
  if (v2)
  {
    v3 = objc_opt_new();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v188 = 0;
      _os_log_impl(&dword_1E2840000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "ASVSettingsVersion: 1", v188, 2u);
    }
    LODWORD(v4) = 2.75;
    v5 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v5 forKeyedSubscript:@"ASVSettingObjectInitialDistanceFromCamera"];

    LODWORD(v6) = 1051900098;
    v7 = [NSNumber numberWithFloat:v6];
    [v3 setObject:v7 forKeyedSubscript:@"ASVSettingObjectInitialPitch"];

    LODWORD(v8) = 0.75;
    v9 = [NSNumber numberWithFloat:v8];
    [v3 setObject:v9 forKeyedSubscript:@"ASVSettingTapTimeThreshold"];

    LODWORD(v10) = 1110704128;
    v11 = [NSNumber numberWithFloat:v10];
    [v3 setObject:v11 forKeyedSubscript:@"ASVSettingTapMovementThreshold"];

    LODWORD(v12) = 1051931443;
    v13 = [NSNumber numberWithFloat:v12];
    [v3 setObject:v13 forKeyedSubscript:@"ASVSettingTapDoubleTimeThreshold"];

    LODWORD(v14) = 1110704128;
    v15 = [NSNumber numberWithFloat:v14];
    [v3 setObject:v15 forKeyedSubscript:@"ASVSettingTapDoubleMovementThreshold"];

    LODWORD(v16) = 1045854032;
    v17 = [NSNumber numberWithFloat:v16];
    [v3 setObject:v17 forKeyedSubscript:@"ASVSettingRotationThreshold"];

    LODWORD(v18) = 1050728828;
    v19 = [NSNumber numberWithFloat:v18];
    [v3 setObject:v19 forKeyedSubscript:@"ASVSettingRotationThresholdHarder"];

    LODWORD(v20) = 5.0;
    v21 = [NSNumber numberWithFloat:v20];
    [v3 setObject:v21 forKeyedSubscript:@"ASVSettingScaleOvershoot"];

    LODWORD(v22) = 1050253722;
    v23 = [NSNumber numberWithFloat:v22];
    [v3 setObject:v23 forKeyedSubscript:@"ASVSettingScaleRubberBandFactor"];

    LODWORD(v24) = 1112014848;
    v25 = [NSNumber numberWithFloat:v24];
    [v3 setObject:v25 forKeyedSubscript:@"ASVSettingScaleThreshold"];

    LODWORD(v26) = 1119092736;
    v27 = [NSNumber numberWithFloat:v26];
    [v3 setObject:v27 forKeyedSubscript:@"ASVSettingScaleThresholdHarder"];

    LODWORD(v28) = 1036831949;
    v29 = [NSNumber numberWithFloat:v28];
    [v3 setObject:v29 forKeyedSubscript:@"ASVSettingScaleSnapThreshold"];

    LODWORD(v30) = 0.5;
    v31 = [NSNumber numberWithFloat:v30];
    [v3 setObject:v31 forKeyedSubscript:@"ASVSettingScaleSnapFeedbackTimeThreshold"];

    LODWORD(v32) = 1118830592;
    v33 = [NSNumber numberWithFloat:v32];
    [v3 setObject:v33 forKeyedSubscript:@"ASVSettingMinimumAssetBoundingRectSizeForTouchDetection"];

    LODWORD(v34) = 30.0;
    v35 = [NSNumber numberWithFloat:v34];
    [v3 setObject:v35 forKeyedSubscript:@"ASVSettingSingleFingerTranslationThreshold"];

    LODWORD(v36) = 1109393408;
    v37 = [NSNumber numberWithFloat:v36];
    [v3 setObject:v37 forKeyedSubscript:@"ASVSettingTwoFingerTranslationThreshold"];

    LODWORD(v38) = 1116471296;
    v39 = [NSNumber numberWithFloat:v38];
    [v3 setObject:v39 forKeyedSubscript:@"ASVSettingTwoFingerTranslationThresholdHarder"];

    LODWORD(v40) = 1008981770;
    v41 = [NSNumber numberWithFloat:v40];
    [v3 setObject:v41 forKeyedSubscript:@"ASVSettingMinimumAssetWorldScale"];

    LODWORD(v42) = 10.0;
    v43 = [NSNumber numberWithFloat:v42];
    [v3 setObject:v43 forKeyedSubscript:@"ASVSettingMaximumAssetWorldScale"];

    LODWORD(v44) = 1002740646;
    v45 = [NSNumber numberWithFloat:v44];
    [v3 setObject:v45 forKeyedSubscript:@"ASVSettingLevitationSnapLowerThreshold"];

    LODWORD(v46) = 1007908028;
    v47 = [NSNumber numberWithFloat:v46];
    [v3 setObject:v47 forKeyedSubscript:@"ASVSettingLevitationSnapUpperThreshold"];

    LODWORD(v48) = 1028443341;
    v49 = [NSNumber numberWithFloat:v48];
    [v3 setObject:v49 forKeyedSubscript:@"ASVSettingMinimumVelocityToBeginTranslationDeceleration"];

    LODWORD(v50) = 1065101558;
    v51 = [NSNumber numberWithFloat:v50];
    [v3 setObject:v51 forKeyedSubscript:@"ASVSettingWorldTranslationDecelerationRate"];

    LODWORD(v52) = 973279855;
    v53 = [NSNumber numberWithFloat:v52];
    [v3 setObject:v53 forKeyedSubscript:@"ASVSettingMinimumDeltaToEndTranslationDeceleration"];

    LODWORD(v54) = 1050728828;
    v55 = [NSNumber numberWithFloat:v54];
    [v3 setObject:v55 forKeyedSubscript:@"ASVSettingTurntableSafeZoneAngle"];

    LODWORD(v56) = 10.0;
    v57 = [NSNumber numberWithFloat:v56];
    [v3 setObject:v57 forKeyedSubscript:@"ASVSettingTurntableSingleFingerPanThreshold"];

    LODWORD(v58) = 10.0;
    v59 = [NSNumber numberWithFloat:v58];
    [v3 setObject:v59 forKeyedSubscript:@"ASVSettingTurntableTwoFingerPanThreshold"];

    LODWORD(v60) = 10.0;
    v61 = [NSNumber numberWithFloat:v60];
    [v3 setObject:v61 forKeyedSubscript:@"ASVSettingTurntableMinimumPanMoveDistance"];

    LODWORD(v62) = 20.0;
    v63 = [NSNumber numberWithFloat:v62];
    [v3 setObject:v63 forKeyedSubscript:@"ASVSettingTurntablePitchYawRotationThreshold"];

    LODWORD(v64) = 1112014848;
    v65 = [NSNumber numberWithFloat:v64];
    [v3 setObject:v65 forKeyedSubscript:@"ASVSettingTurntablePitchYawRotationThresholdHarder"];

    LODWORD(v66) = 1008981770;
    v67 = [NSNumber numberWithFloat:v66];
    [v3 setObject:v67 forKeyedSubscript:@"ASVSettingTurntableYawRadiansPerPoint"];

    LODWORD(v68) = 2.0;
    v69 = [NSNumber numberWithFloat:v68];
    [v3 setObject:v69 forKeyedSubscript:@"ASVSettingMinimumVelocityToBeginYawSpinDeceleration"];

    LODWORD(v70) = 0.5;
    v71 = [NSNumber numberWithFloat:v70];
    [v3 setObject:v71 forKeyedSubscript:@"ASVSettingMinimumVelocityToBeginPitchSpinDeceleration"];

    LODWORD(v72) = 1065151889;
    v73 = [NSNumber numberWithFloat:v72];
    [v3 setObject:v73 forKeyedSubscript:@"ASVSettingTurntablePitchSpinDecelerationRate"];

    LODWORD(v74) = 981668463;
    v75 = [NSNumber numberWithFloat:v74];
    [v3 setObject:v75 forKeyedSubscript:@"ASVSettingMinimumDeltaToEndSpinDeceleration"];

    LODWORD(v76) = 1065319662;
    v77 = [NSNumber numberWithFloat:v76];
    [v3 setObject:v77 forKeyedSubscript:@"ASVSettingTurntableYawSpinDecelerationRate"];

    LODWORD(v78) = 1008981770;
    v79 = [NSNumber numberWithFloat:v78];
    [v3 setObject:v79 forKeyedSubscript:@"ASVSettingTurntablePitchRadiansPerPoint"];

    LODWORD(v80) = 1061752795;
    v81 = [NSNumber numberWithFloat:v80];
    [v3 setObject:v81 forKeyedSubscript:@"ASVSettingTurntablePitchLimit"];

    LODWORD(v82) = 1061752795;
    v83 = [NSNumber numberWithFloat:v82];
    [v3 setObject:v83 forKeyedSubscript:@"ASVSettingTurntablePitchOvershoot"];

    LODWORD(v84) = 1050253722;
    v85 = [NSNumber numberWithFloat:v84];
    [v3 setObject:v85 forKeyedSubscript:@"ASVSettingTurntablePitchRubberBandFactor"];

    LODWORD(v86) = 1037465424;
    v87 = [NSNumber numberWithFloat:v86];
    [v3 setObject:v87 forKeyedSubscript:@"ASVSettingTurntablePitchDecelerationRubberBandUndershoot"];

    LODWORD(v88) = 981668463;
    v89 = [NSNumber numberWithFloat:v88];
    [v3 setObject:v89 forKeyedSubscript:@"ASVSettingMinimumDeltaToEndSnapDeceleration"];

    LODWORD(v90) = 1045220557;
    v91 = [NSNumber numberWithFloat:v90];
    [v3 setObject:v91 forKeyedSubscript:@"ASVSettingMinimumAssetTurntableScale"];

    LODWORD(v92) = 5.0;
    v93 = [NSNumber numberWithFloat:v92];
    [v3 setObject:v93 forKeyedSubscript:@"ASVSettingMaximumAssetTurntableScale"];

    v94 = [NSNumber numberWithBool:1];
    [v3 setObject:v94 forKeyedSubscript:@"ASVSettingTurntableDoubleTapResetsAll"];

    LODWORD(v95) = 1050253722;
    v96 = [NSNumber numberWithFloat:v95];
    [v3 setObject:v96 forKeyedSubscript:@"ASVSettingTurntableDoubleTapResetAnimationTime"];

    LODWORD(v97) = 6.0;
    v98 = [NSNumber numberWithFloat:v97];
    [v3 setObject:v98 forKeyedSubscript:@"ASVSettingPercentLozengeSafeZonePadding"];

    LODWORD(v99) = 1060320051;
    v100 = [NSNumber numberWithFloat:v99];
    [v3 setObject:v100 forKeyedSubscript:@"ASVSettingPercentLozengeFadeOutDelay"];

    LODWORD(v101) = 1050253722;
    v102 = [NSNumber numberWithFloat:v101];
    [v3 setObject:v102 forKeyedSubscript:@"ASVSettingPercentLozengeFadeOutDuration"];

    v103 = [NSNumber numberWithBool:1];
    [v3 setObject:v103 forKeyedSubscript:@"ASVSettingEnableEnvmap"];

    LODWORD(v104) = 1.0;
    v105 = [NSNumber numberWithFloat:v104];
    [v3 setObject:v105 forKeyedSubscript:@"ASVSettingEnvironmentMapUpdateFrequency"];

    LODWORD(v106) = 1.0;
    v107 = [NSNumber numberWithFloat:v106];
    [v3 setObject:v107 forKeyedSubscript:@"ASVSettingEnvironmentMapExtentScaleFactor"];

    v108 = [NSNumber numberWithBool:1];
    [v3 setObject:v108 forKeyedSubscript:@"ASVSettingUseStudioLight"];

    LODWORD(v109) = 1.0;
    v110 = [NSNumber numberWithFloat:v109];
    [v3 setObject:v110 forKeyedSubscript:@"ASVSettingEnvmapIntensity"];

    v111 = [NSNumber numberWithFloat:0.0];
    [v3 setObject:v111 forKeyedSubscript:@"ASVSettingStudioLightIntensity"];

    LODWORD(v112) = 1.0;
    v113 = [NSNumber numberWithFloat:v112];
    [v3 setObject:v113 forKeyedSubscript:@"ASVSetting3DAmbientIntensity"];

    v114 = [NSNumber numberWithBool:0];
    [v3 setObject:v114 forKeyedSubscript:@"ASVSettingEnableEnvmapDebug"];

    v115 = [NSNumber numberWithFloat:0.0];
    [v3 setObject:v115 forKeyedSubscript:@"ASVSettingEnvmapDebugRoughness"];

    LODWORD(v116) = 1.0;
    v117 = [NSNumber numberWithFloat:v116];
    [v3 setObject:v117 forKeyedSubscript:@"ASVSettingEnvmapDebugMetallic"];

    v118 = [NSNumber numberWithBool:1];
    [v3 setObject:v118 forKeyedSubscript:@"ASVSettingEnableMSAA4x"];

    v119 = [NSNumber numberWithBool:0];
    [v3 setObject:v119 forKeyedSubscript:@"ASVSettingShowGraphicsStats"];

    LODWORD(v120) = 1050253722;
    v121 = [NSNumber numberWithFloat:v120];
    [v3 setObject:v121 forKeyedSubscript:@"ASVSettingShadowFadeInTime"];

    LODWORD(v122) = 1061997773;
    v123 = [NSNumber numberWithFloat:v122];
    [v3 setObject:v123 forKeyedSubscript:@"ASVSettingProjectionShadowScale"];

    LODWORD(v124) = 1.0;
    v125 = [NSNumber numberWithFloat:v124];
    [v3 setObject:v125 forKeyedSubscript:@"ASVSettingRaytracedShadowPower"];

    LODWORD(v126) = 1.0;
    v127 = [NSNumber numberWithFloat:v126];
    [v3 setObject:v127 forKeyedSubscript:@"ASVSettingRaytracedShadowScale"];

    LODWORD(v128) = 1131413504;
    v129 = [NSNumber numberWithFloat:v128];
    [v3 setObject:v129 forKeyedSubscript:@"ASVSettingStatusLabelContainerWidth"];

    LODWORD(v130) = 1114636288;
    v131 = [NSNumber numberWithFloat:v130];
    [v3 setObject:v131 forKeyedSubscript:@"ASVSettingStatusLabelContainerHeight"];

    LODWORD(v132) = 8.0;
    v133 = [NSNumber numberWithFloat:v132];
    [v3 setObject:v133 forKeyedSubscript:@"ASVSettingStatusLabelContainerPaddingFromTopControls"];

    v134 = [NSNumber numberWithBool:0];
    [v3 setObject:v134 forKeyedSubscript:@"ASVSettingCreateDebugPlaneManager"];

    LODWORD(v135) = 1114636288;
    v136 = [NSNumber numberWithFloat:v135];
    [v3 setObject:v136 forKeyedSubscript:@"ASVSettingHitTestClusterSizeForPlacement"];

    LODWORD(v137) = 1036831949;
    v138 = [NSNumber numberWithFloat:v137];
    [v3 setObject:v138 forKeyedSubscript:@"ASVSettingPlacementClusterCylinderHeight"];

    LODWORD(v139) = 1050253722;
    v140 = [NSNumber numberWithFloat:v139];
    [v3 setObject:v140 forKeyedSubscript:@"ASVSettingPlacementClusterCylinderDiameter"];

    LODWORD(v141) = 5.0;
    v142 = [NSNumber numberWithFloat:v141];
    [v3 setObject:v142 forKeyedSubscript:@"ASVSettingDelayBeforePlacingObjectInWorldWithoutClustering"];

    LODWORD(v143) = 30.0;
    v144 = [NSNumber numberWithFloat:v143];
    [v3 setObject:v144 forKeyedSubscript:@"ASVSettingHitTestClusterSizeForMovement"];

    LODWORD(v145) = 1045220557;
    v146 = [NSNumber numberWithFloat:v145];
    [v3 setObject:v146 forKeyedSubscript:@"ASVSettingMovementClusterChainHeight"];

    LODWORD(v147) = 1045220557;
    v148 = [NSNumber numberWithFloat:v147];
    [v3 setObject:v148 forKeyedSubscript:@"ASVSettingMovementClusterChainLinkDistance"];

    LODWORD(v149) = 10.0;
    v150 = [NSNumber numberWithFloat:v149];
    [v3 setObject:v150 forKeyedSubscript:@"ASVSettingInterpolationPlaneChangeDecisionCount"];

    LODWORD(v151) = 1028443341;
    v152 = [NSNumber numberWithFloat:v151];
    [v3 setObject:v152 forKeyedSubscript:@"ASVSettingInterpolationPlaneChangeMinimumSeparationDistance"];

    LODWORD(v153) = 1050253722;
    v154 = [NSNumber numberWithFloat:v153];
    [v3 setObject:v154 forKeyedSubscript:@"ASVSettingMinimumEstimatedHitPointDistanceFromCamera"];

    LODWORD(v155) = 2.0;
    v156 = [NSNumber numberWithFloat:v155];
    [v3 setObject:v156 forKeyedSubscript:@"ASVSettingMaximumDistanceFromCameraForAssetPlacement"];

    LODWORD(v157) = 10.0;
    v158 = [NSNumber numberWithFloat:v157];
    [v3 setObject:v158 forKeyedSubscript:@"ASVSettingMaximumDistanceFromCameraForAssetTranslation"];

    LODWORD(v159) = 1036831949;
    v160 = [NSNumber numberWithFloat:v159];
    [v3 setObject:v160 forKeyedSubscript:@"ASVSettingMoveOnToPlaneExtentTolerance"];

    LODWORD(v161) = 981668463;
    v162 = [NSNumber numberWithFloat:v161];
    [v3 setObject:v162 forKeyedSubscript:@"ASVSettingMoveOnToPlaneMinimumDistanceToBeginMove"];

    LODWORD(v163) = 1028443341;
    v164 = [NSNumber numberWithFloat:v163];
    [v3 setObject:v164 forKeyedSubscript:@"ASVSettingMoveOnToPlaneMaximumDistanceToBeginMove"];

    LODWORD(v165) = 990057071;
    v166 = [NSNumber numberWithFloat:v165];
    [v3 setObject:v166 forKeyedSubscript:@"ASVSettingMoveOnToPlaneTranslationSpeed"];

    LODWORD(v167) = 3.0;
    v168 = [NSNumber numberWithFloat:v167];
    [v3 setObject:v168 forKeyedSubscript:@"ASVSetting2DControlsFadeOutDelay"];

    LODWORD(v169) = 1045220557;
    v170 = [NSNumber numberWithFloat:v169];
    [v3 setObject:v170 forKeyedSubscript:@"ASVSetting2DControlsFadeAnimationDuration"];

    v171 = [NSNumber numberWithBool:1];
    [v3 setObject:v171 forKeyedSubscript:@"ASVSettingEnableCoachingUI"];

    v172 = [NSNumber numberWithBool:1];
    [v3 setObject:v172 forKeyedSubscript:@"ASVSettingCoachingUIShowAllAnimationStatesBeforeHiding"];

    v173 = NSNumber;
    if (ARDeviceSupportsJasper()) {
      *(float *)&double v174 = 10.0;
    }
    else {
      *(float *)&double v174 = 3.0;
    }
    v175 = [v173 numberWithFloat:v174];
    [v3 setObject:v175 forKeyedSubscript:@"ASVSettingCoachingUIInactiveTimeBeforeShowingUI"];

    LODWORD(v176) = 1022739087;
    v177 = [NSNumber numberWithFloat:v176];
    [v3 setObject:v177 forKeyedSubscript:@"ASVSettingCoachingUIMoveDistanceThreshold"];

    LODWORD(v178) = 1.5;
    v179 = [NSNumber numberWithFloat:v178];
    [v3 setObject:v179 forKeyedSubscript:@"ASVSettingCoachingUIMinDisplayTime"];

    v180 = [NSNumber numberWithBool:0];
    [v3 setObject:v180 forKeyedSubscript:@"ASVSettingCoachingUIForceActivation"];

    v181 = [NSNumber numberWithBool:0];
    [v3 setObject:v181 forKeyedSubscript:@"ASVSettingCoachingUIEnableRelocalization"];

    v182 = [NSNumber numberWithBool:1];
    [v3 setObject:v182 forKeyedSubscript:@"ASVSettingCoachingUIDisableStatusWhenActive"];

    v183 = [NSNumber numberWithBool:1];
    [v3 setObject:v183 forKeyedSubscript:@"ASVSettingCoachingUIShowAnimatedUI"];

    v184 = [NSNumber numberWithBool:1];
    [v3 setObject:v184 forKeyedSubscript:@"ASVSettingCoachingUIInterceptARKitSensorData"];

    uint64_t v185 = [v3 copy];
    settings = v2->_settings;
    v2->_settings = (NSDictionary *)v185;
  }
  return v2;
}

- (float)floatForKey:(id)a3
{
  id v4 = a3;
  v5 = [(ASVSettings *)self settings];
  double v6 = [v5 objectForKeyedSubscript:v4];

  [v6 floatValue];
  float v8 = v7;

  return v8;
}

- (float)BOOLForKey:(id)a3
{
  id v4 = a3;
  v5 = [(ASVSettings *)self settings];
  double v6 = [v5 objectForKeyedSubscript:v4];

  float v7 = (float)[v6 BOOLValue];
  return v7;
}

+ (float)floatForKey:(id)a3
{
  id v3 = a3;
  id v4 = +[ASVSettings sharedSettings];
  [v4 floatForKey:v3];
  float v6 = v5;

  return v6;
}

+ (float)BOOLForKey:(id)a3
{
  id v3 = a3;
  id v4 = +[ASVSettings sharedSettings];
  [v4 BOOLForKey:v3];
  float v6 = v5;

  return v6;
}

- (NSDictionary)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
}

+ (ASVSettingsProvider)sharedSettings
{
  if (sharedSettings_onceToken != -1) {
    dispatch_once(&sharedSettings_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedSettings_sharedSettings;
  return (ASVSettingsProvider *)v2;
}

uint64_t __57__ASVSettings_ASVSettings_SharedSettings__sharedSettings__block_invoke()
{
  v0 = objc_alloc_init(ASVSettings);
  uint64_t v1 = sharedSettings_sharedSettings;
  sharedSettings_sharedSettings = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end