@interface ARKitUserDefaults
+ (BOOL)BOOLForKey:(id)a3;
+ (BOOL)BOOLForKey:(id)a3 useCache:(BOOL)a4;
+ (BOOL)shouldUseCache;
+ (double)doubleForKey:(id)a3;
+ (double)doubleForKey:(id)a3 useCache:(BOOL)a4;
+ (float)floatForKey:(id)a3;
+ (float)floatForKey:(id)a3 useCache:(BOOL)a4;
+ (id)_numberForObject:(id)a3;
+ (id)cachedObjectForKey:(id)a3;
+ (id)defaultValues;
+ (id)keysApprovedForProcessEnvironmentOverride;
+ (id)listForKey:(id)a3;
+ (id)numberForKey:(id)a3;
+ (id)numberForKey:(id)a3 useCache:(BOOL)a4;
+ (id)objectForKey:(id)a3;
+ (id)objectForKey:(id)a3 useCache:(BOOL)a4;
+ (id)objectForKeySlow:(id)a3;
+ (id)resolutionDictionaryForKey:(id)a3;
+ (id)stringForKey:(id)a3;
+ (id)userDefaultsCache;
+ (id)valueForKey:(id)a3;
+ (int64_t)integerForKey:(id)a3;
+ (int64_t)integerForKey:(id)a3 useCache:(BOOL)a4;
+ (void)cacheObject:(id)a3 forKey:(id)a4;
+ (void)clearUserDefaultsCache;
+ (void)removeAllKeys;
+ (void)removeCachedObjectForKey:(id)a3;
+ (void)removeObjectForKey:(id)a3;
+ (void)setBool:(BOOL)a3 forKey:(id)a4;
+ (void)setObject:(id)a3 forKey:(id)a4;
+ (void)setValue:(id)a3 forKey:(id)a4;
+ (void)synchronize;
@end

@implementation ARKitUserDefaults

+ (int64_t)integerForKey:(id)a3
{
  v3 = +[ARKitUserDefaults numberForKey:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

+ (id)numberForKey:(id)a3
{
  v3 = +[ARKitUserDefaults objectForKey:a3];
  int64_t v4 = +[ARKitUserDefaults _numberForObject:v3];

  return v4;
}

+ (id)objectForKey:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() shouldUseCache]
    && (+[ARKitUserDefaults cachedObjectForKey:v3],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = (id)v4;
    id v6 = [MEMORY[0x1E4F1CA98] null];

    if (v5 == v6)
    {
      v7 = 0;
    }
    else
    {
      id v5 = v5;
      v7 = v5;
    }
  }
  else
  {
    v7 = +[ARKitUserDefaults objectForKeySlow:v3];
    +[ARKitUserDefaults cacheObject:v7 forKey:v3];
    id v5 = 0;
  }

  return v7;
}

+ (BOOL)shouldUseCache
{
  if (shouldUseCache_onceToken != -1) {
    dispatch_once(&shouldUseCache_onceToken, &__block_literal_global_75);
  }
  v2 = (void *)shouldUseCache_shouldUseCache;
  return [v2 BOOLValue];
}

+ (id)objectForKeySlow:(id)a3
{
  id v4 = a3;
  id v5 = [a1 keysApprovedForProcessEnvironmentOverride];
  int v6 = [v5 containsObject:v4];

  if (!v6) {
    goto LABEL_10;
  }
  v7 = [MEMORY[0x1E4F28F80] processInfo];
  v8 = [v7 environment];
  v9 = [v8 objectForKey:v4];

  if (!v9)
  {
LABEL_10:
    v10 = [MEMORY[0x1E4F1CB18] appleGlobalDomain];
    v9 = [v10 objectForKey:v4];

    if (!v9)
    {
      v11 = [a1 defaultValues];
      v9 = [v11 objectForKeyedSubscript:v4];
    }
  }

  return v9;
}

+ (id)userDefaultsCache
{
  if (userDefaultsCache_onceToken != -1) {
    dispatch_once(&userDefaultsCache_onceToken, &__block_literal_global_73);
  }
  v2 = (void *)userDefaultsCache_defaultsCache;
  return v2;
}

+ (id)keysApprovedForProcessEnvironmentOverride
{
  if (keysApprovedForProcessEnvironmentOverride_onceToken != -1) {
    dispatch_once(&keysApprovedForProcessEnvironmentOverride_onceToken, &__block_literal_global_79);
  }
  v2 = (void *)keysApprovedForProcessEnvironmentOverride_approvedKeys;
  return v2;
}

+ (id)defaultValues
{
  if (defaultValues_onceToken != -1) {
    dispatch_once(&defaultValues_onceToken, &__block_literal_global_16_0);
  }
  v2 = (void *)defaultValues_defaultValues;
  return v2;
}

+ (void)cacheObject:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[ARKitUserDefaults userDefaultsCache];
  os_unfair_lock_lock((os_unfair_lock_t)&gDefaultsCacheLock);
  kdebug_trace();
  if (v5)
  {
    [v7 setObject:v5 forKeyedSubscript:v6];
  }
  else
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
    [v7 setObject:v8 forKeyedSubscript:v6];
  }
  uint64_t v10 = 0;
  id v9 = v6;
  objc_msgSend(v9, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v10, 8, 0, 1, 0, 0, objc_msgSend(v9, "length"), 0);

  kdebug_trace();
  os_unfair_lock_unlock((os_unfair_lock_t)&gDefaultsCacheLock);
}

+ (id)cachedObjectForKey:(id)a3
{
  id v3 = a3;
  id v4 = +[ARKitUserDefaults userDefaultsCache];
  os_unfair_lock_lock((os_unfair_lock_t)&gDefaultsCacheLock);
  kdebug_trace();
  id v5 = [v4 objectForKeyedSubscript:v3];
  uint64_t v8 = 0;
  id v6 = v3;
  objc_msgSend(v6, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v8, 8, 0, 1, 0, 0, objc_msgSend(v6, "length"), 0);

  kdebug_trace();
  os_unfair_lock_unlock((os_unfair_lock_t)&gDefaultsCacheLock);

  return v5;
}

+ (id)_numberForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = (void *)MEMORY[0x1E4F28E58];
      id v6 = v3;
      v7 = [v5 decimalDigitCharacterSet];
      [v7 addCharactersInString:@"-."];
      uint64_t v8 = [v7 invertedSet];
      id v9 = [v6 componentsSeparatedByCharactersInSet:v8];

      uint64_t v10 = [v9 firstObject];

      id v11 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      [v11 setDecimalSeparator:@"."];
      [v11 setNumberStyle:1];
      id v4 = [v11 numberFromString:v10];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

+ (BOOL)BOOLForKey:(id)a3
{
  id v3 = +[ARKitUserDefaults objectForKey:a3];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

void __34__ARKitUserDefaults_defaultValues__block_invoke()
{
  v9[113] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = MGGetBoolAnswer();
  uint64_t v1 = MEMORY[0x1E4F1CC38];
  uint64_t v2 = MEMORY[0x1E4F1CC28];
  v8[0] = @"com.apple.arkit.useCacheForUserDefaults";
  v8[1] = @"com.apple.arkit.daemonMetrics.disableReporting";
  v9[0] = MEMORY[0x1E4F1CC38];
  v9[1] = MEMORY[0x1E4F1CC28];
  v8[2] = @"com.apple.arkit.session.featurePointAccumulationCount";
  v8[3] = @"com.apple.arkit.session.useIOKit";
  v9[2] = @"3";
  v9[3] = &unk_1F1258B70;
  v8[4] = @"com.apple.arkit.session.cameraPosition";
  v8[5] = @"com.apple.arkit.imagesensor.attemptfailurerecovery";
  v9[4] = &unk_1F1258B70;
  v9[5] = MEMORY[0x1E4F1CC28];
  v8[6] = @"com.apple.arkit.imagesensor.attemptfailurerecoveryafterbackground";
  v8[7] = @"com.apple.arkit.imagesensor.back.ultrawide.enabled";
  v9[6] = MEMORY[0x1E4F1CC38];
  v9[7] = MEMORY[0x1E4F1CC38];
  v8[8] = @"com.apple.arkit.imagesensor.back.wide.videoBinned";
  v8[9] = @"com.apple.arkit.imagesensor.back.wide.smoothAutoFocus";
  v9[8] = MEMORY[0x1E4F1CC38];
  v9[9] = MEMORY[0x1E4F1CC38];
  v8[10] = @"com.apple.arkit.imagesensor.back.wide.photoQualityPrioritization";
  v8[11] = @"com.apple.arkit.imagesensor.front.videoBinned";
  v9[10] = &unk_1F1258B70;
  v9[11] = MEMORY[0x1E4F1CC38];
  v8[12] = @"com.apple.arkit.imagesensor.face.mirror";
  v8[13] = @"com.apple.arkit.imagesensor.face.previousImageDataOnDrop";
  v9[12] = MEMORY[0x1E4F1CC38];
  v9[13] = MEMORY[0x1E4F1CC38];
  v8[14] = @"com.apple.arkit.imagesensor.back.ultrawide.frameRate";
  v8[15] = @"com.apple.arkit.imagesensor.back.ultrawide.videoBinned";
  v9[14] = &unk_1F1258B88;
  v9[15] = MEMORY[0x1E4F1CC38];
  v8[16] = @"com.apple.arkit.imagesensor.back.ultrawide.geometricDistortionCorrection";
  v8[17] = @"com.apple.arkit.imagesensor.initialFrameDrop.enabled";
  v9[16] = MEMORY[0x1E4F1CC28];
  v9[17] = MEMORY[0x1E4F1CC38];
  v8[18] = @"com.apple.arkit.imagesensor.initialFrameDrop.negativeExposureTargetOffsetThreshold";
  v8[19] = @"com.apple.arkit.imagesensor.initialFrameDrop.positiveExposureTargetOffsetThreshold";
  v9[18] = &unk_1F125C2C0;
  v9[19] = &unk_1F125C2D0;
  v8[20] = @"com.apple.arkit.imagesensor.initialFrameDrop.maxDroppedFramesCount";
  v8[21] = @"com.apple.arkit.imagesensor.calibrationData.alwaysDiscardsLateData";
  v9[20] = &unk_1F1258B88;
  v9[21] = MEMORY[0x1E4F1CC28];
  v8[22] = @"com.apple.arkit.motionSensor.sampleRate";
  v8[23] = @"com.apple.arkit.motionSensor.magnetometerEnabled";
  v9[22] = &unk_1F1258BA0;
  v9[23] = MEMORY[0x1E4F1CC28];
  v8[24] = @"com.apple.arkit.recordingTechnique.recordPearlDepthData";
  v8[25] = @"com.apple.arkit.replaySensor.deterministicMode";
  v9[24] = MEMORY[0x1E4F1CC28];
  v9[25] = MEMORY[0x1E4F1CC28];
  v8[26] = @"com.apple.arkit.replaySensor.replayVisionData";
  v8[27] = @"com.apple.arkit.planeEstimation.mlOnANEDevices";
  v9[26] = MEMORY[0x1E4F1CC38];
  v9[27] = MEMORY[0x1E4F1CC38];
  v8[28] = @"com.apple.arkit.planeEstimation.normalsKernelSize";
  v8[29] = @"com.apple.arkit.planeEstimation.enableLowQosScheduling";
  v9[28] = &unk_1F1258BB8;
  v9[29] = MEMORY[0x1E4F1CC28];
  v8[30] = @"com.apple.arkit.sceneReconstruction.bucketsCount";
  v8[31] = @"com.apple.arkit.planeEstimation.detectionMethod";
  v9[30] = &unk_1F1258B70;
  v9[31] = @"System Default";
  v8[32] = @"com.apple.arkit.planeEstimation.enableInverseDepthDetector";
  v8[33] = @"com.apple.arkit.planeEstimation.anchorRotation";
  v9[32] = MEMORY[0x1E4F1CC28];
  v9[33] = MEMORY[0x1E4F1CC28];
  v8[34] = @"com.apple.arkit.worldtracking.lineFeatures";
  v8[35] = @"com.apple.arkit.worldtracking.minVergenceAngle";
  v9[34] = MEMORY[0x1E4F1CC38];
  v9[35] = @"2";
  v8[36] = @"com.apple.arkit.worldtracking.poseGraphUpdates";
  v8[37] = @"com.apple.arkit.worldtracking.fixedIntrinsics";
  v9[36] = MEMORY[0x1E4F1CC38];
  v9[37] = MEMORY[0x1E4F1CC28];
  v8[38] = @"com.apple.arkit.worldTracking.visionData";
  v8[39] = @"com.apple.arkit.worldTracking.simulateHWFeatureDetection";
  v9[38] = MEMORY[0x1E4F1CC38];
  v9[39] = MEMORY[0x1E4F1CC28];
  v8[40] = @"com.apple.arkit.worldTracking.useLACCIfAvailable";
  v8[41] = @"com.apple.arkit.worldTracking.collaborativeMappingStatistics";
  v9[40] = MEMORY[0x1E4F1CC38];
  v9[41] = MEMORY[0x1E4F1CC38];
  v8[42] = @"com.apple.arkit.worldTracking.forceDisableFrontCamera";
  v8[43] = @"com.apple.arkit.worldTracking.participantAnchors";
  v9[42] = MEMORY[0x1E4F1CC28];
  v9[43] = MEMORY[0x1E4F1CC38];
  v9[44] = MEMORY[0x1E4F1CC28];
  v8[44] = @"com.apple.arkit.worldTracking.warningSounds";
  v8[45] = @"com.apple.arkit.worldTracking.mlRelocalizationMode";
  id v3 = [NSNumber numberWithInt:0];
  v9[45] = v3;
  v9[46] = v1;
  v8[46] = @"com.apple.arkit.worldTracking.accuratePlaneExtentCheck";
  v8[47] = @"com.apple.arkit.worldTracking.newCV3DApis";
  v9[47] = v1;
  v9[48] = v2;
  v8[48] = @"com.apple.arkit.worldTracking.enableMLCMRelocalization";
  v8[49] = @"com.apple.arkit.worldtracking.transformToExternalSubmap";
  v9[49] = v1;
  v9[50] = v2;
  v8[50] = @"com.apple.arkit.worldtracking.enableTempMappingDirectory";
  v8[51] = @"com.apple.arkit.worldtracking.usePerFrameCameraIntrinsicsForBravo";
  v8[52] = @"com.apple.arkit.worldtracking.pushVisionDataIntrinsics";
  v8[53] = @"com.apple.arkit.worldtracking.useFullResolutionVisionDataIntrinsics";
  v8[54] = @"com.apple.arkit.geotracking.useclfusion";
  v8[55] = @"com.apple.arkit.geotracking.usecmfusion";
  v8[56] = @"com.apple.arkit.geotracking.usegradualcorrection";
  v8[57] = @"com.apple.arkit.geotracking.useVLTraceRecorder";
  v9[51] = v1;
  v9[52] = v1;
  v8[58] = @"com.apple.arkit.geotracking.bypassChecksForANE";
  v8[59] = @"com.apple.arkit.geotracking.bypassChecksForGPS";
  v9[53] = v1;
  v9[54] = v1;
  v9[59] = v2;
  v9[60] = &unk_1F125C2D0;
  v8[60] = @"com.apple.arkit.geotracking.visualLocalizationCallInterval";
  v8[61] = @"com.apple.arkit.geotracking.posteriorVisualLocalizationCallInterval";
  v9[55] = v2;
  v9[56] = v1;
  v9[61] = &unk_1F1258BD0;
  v9[62] = &unk_1F1258B88;
  v8[62] = @"com.apple.arkit.geotracking.visualLocalizationCallIntervalTimeThreshold";
  v8[63] = @"com.apple.arkit.imagedetection.percentageThresholdPixels";
  v9[57] = v2;
  v9[58] = v2;
  v8[64] = @"com.apple.arkit.imageDetection.fixedPriorityProcessingQueue";
  v9[63] = @"8";
  v9[64] = v2;
  v8[65] = @"com.apple.arkit.environmentTexturing.minimumProbeUpdateInterval";
  v9[65] = @"2";
  v8[66] = @"com.apple.arkit.environmentTexturing.wantsHDR";
  v9[66] = v1;
  v8[67] = @"com.apple.arkit.environmentTexturing.maxHDR";
  v9[67] = @"10";
  v8[68] = @"com.apple.arkit.matting.erosionRadius";
  v9[68] = &unk_1F1258BE8;
  v8[69] = @"com.apple.arkit.matting.uncertaintyRadius";
  v9[69] = &unk_1F1258BE8;
  v8[70] = @"com.apple.arkit.matting.epsilon";
  v9[70] = &unk_1F125C2E0;
  v8[71] = @"com.apple.arkit.matting.disableSoftEdges";
  v9[71] = v2;
  v8[72] = @"com.apple.arkit.matting.depthScale";
  v9[72] = &unk_1F1258BD0;
  v8[73] = @"com.apple.arkit.matting.dilationRadius";
  v9[73] = &unk_1F1258C00;
  v8[74] = @"com.apple.arkit.matting.doubleMLResolutionForIPad";
  v9[74] = v1;
  v8[75] = @"com.apple.arkit.matting.useTemporalSmoothing";
  v9[75] = v2;
  v8[76] = @"com.apple.arkit.view.rendersCameraGrain";
  v9[76] = v1;
  v8[77] = @"com.apple.arkit.view.rendersMotionBlur";
  v9[77] = v2;
  v8[78] = @"com.apple.arkit.test.default";
  v9[78] = @"test";
  v8[79] = @"com.apple.arkit.multicam_mode.enabled";
  v9[79] = v1;
  v8[80] = @"com.apple.arkit.sceneReconstruction.voxelSize";
  v9[80] = &unk_1F125C2F0;
  v8[81] = @"com.apple.arkit.sceneReconstruction.waitTillVIOIsStable";
  v9[81] = v1;
  v8[82] = @"com.apple.arkit.sceneReconstruction.enableLowQosScheduling";
  v9[82] = v2;
  v8[83] = @"com.apple.arkit.objctdetection.regionProposalModel";
  v9[83] = v1;
  v8[84] = @"com.apple.arkit.jasper.enabled";
  char v4 = [NSNumber numberWithBool:v0];
  v8[85] = @"com.apple.arkit.jasper.timeOfFlightProjectorMode";
  v9[85] = &unk_1F1258C18;
  v9[84] = v4;
  v8[86] = @"com.apple.arkit.jasper.aggregationBankCount";
  v9[86] = &unk_1F1258B70;
  v8[87] = @"com.apple.arkit.appleDepth.useExpFilter";
  v9[87] = v1;
  v8[88] = @"com.apple.arkit.appleDepth.averageDepthBoundingBox";
  id v5 = [NSNumber numberWithInt:v0 ^ 1];
  v9[88] = v5;
  v8[89] = @"com.apple.arkit.appleDepth.temporalSmoothingMethod";
  v9[89] = &unk_1F1258BD0;
  v8[90] = @"com.apple.arkit.appleDepth.temporalFilteringStoredFrames";
  v9[90] = &unk_1F1258BE8;
  v8[91] = @"com.apple.arkit.appleDepth.computeNormals";
  v9[91] = v2;
  v8[92] = @"com.apple.arkit.appleDepthSPI.bundleID.approvedList";
  v9[92] = MEMORY[0x1E4F1CBF0];
  v8[93] = @"com.apple.arkit.bodytracking.multipleBodyAnchors";
  v9[93] = v2;
  v8[94] = @"com.apple.arkit.personocclusion.skipFrameWhenBusy";
  v9[94] = v1;
  v8[95] = @"com.apple.arkit.distortionCorrection.computeCoefficientsForEveryFrame";
  v9[95] = v2;
  v8[96] = @"com.apple.arkit.scaling.useOptimalMSRCoeficients";
  v8[97] = @"com.apple.arkit.bodytracking.extrapolationTimeLimitSeconds";
  v9[96] = v2;
  v9[97] = &unk_1F125C300;
  v8[98] = @"com.apple.arkit.view.attemptRenderSynchronizationARFrame";
  v9[98] = v1;
  v8[99] = @"com.apple.arkit.view.renderRawSceneUnderstandingImage";
  v9[99] = v2;
  v8[100] = @"com.apple.arkit.session.configuration.saveDotGraph";
  v9[100] = v2;
  v8[101] = @"com.apple.arkit.bodytracking.pushProjected3DSkeleton";
  v9[101] = v2;
  v8[102] = @"com.apple.arkit.bodyTracking.useSupport3DSkeleton";
  v9[102] = v1;
  v8[103] = @"com.apple.arkit.personDetectionTechnique.mergeLargelyOverlappingBoundingBoxes";
  v9[103] = v1;
  v8[104] = @"com.apple.arkit.personOcclusion.optimizationStrategy";
  v9[104] = &unk_1F1258BE8;
  v8[105] = @"com.apple.arkit.faceTracking.rgbOnly.enabled";
  v9[105] = v1;
  v8[106] = @"com.apple.arkit.semanticSegmentation.uncertaintyThreshold";
  v9[106] = &unk_1F125C310;
  v8[107] = @"com.apple.arkit.slamManager.cv3dLoggingLevel.api";
  v9[107] = &unk_1F1258C30;
  v8[108] = @"com.apple.arkit.slamManager.cv3dLoggingLevel.internal";
  v9[108] = &unk_1F1258C30;
  v8[109] = @"com.apple.arkit.sceneReconstruction.recon3DLoggingLevel.api";
  v9[109] = &unk_1F1258BD0;
  v8[110] = @"com.apple.arkit.sceneReconstruction.recon3DLoggingLevel.internal";
  v9[110] = &unk_1F1258BE8;
  v8[111] = @"com.apple.arkit.appClipCodeTracking.performanceTestMode";
  v9[111] = &unk_1F1258C48;
  v8[112] = @"com.apple.arkit.server.maximumConcurrentServicesPerClient";
  v9[112] = &unk_1F1258C60;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:113];
  v7 = (void *)defaultValues_defaultValues;
  defaultValues_defaultValues = v6;
}

void __62__ARKitUserDefaults_keysApprovedForProcessEnvironmentOverride__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.arkit.session.replay.filepath";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)keysApprovedForProcessEnvironmentOverride_approvedKeys;
  keysApprovedForProcessEnvironmentOverride_approvedKeys = v0;
}

void __38__ARKitUserDefaults_userDefaultsCache__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)userDefaultsCache_defaultsCache;
  userDefaultsCache_defaultsCache = v0;
}

void __35__ARKitUserDefaults_shouldUseCache__block_invoke()
{
  uint64_t v0 = +[ARKitUserDefaults objectForKeySlow:@"com.apple.arkit.useCacheForUserDefaults"];
  uint64_t v1 = (void *)shouldUseCache_shouldUseCache;
  shouldUseCache_shouldUseCache = v0;
}

+ (void)removeCachedObjectForKey:(id)a3
{
  id v3 = a3;
  char v4 = +[ARKitUserDefaults userDefaultsCache];
  os_unfair_lock_lock((os_unfair_lock_t)&gDefaultsCacheLock);
  kdebug_trace();
  [v4 removeObjectForKey:v3];
  uint64_t v6 = 0;
  id v5 = v3;
  objc_msgSend(v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v6, 8, 0, 1, 0, 0, objc_msgSend(v5, "length"), 0);

  kdebug_trace();
  os_unfair_lock_unlock((os_unfair_lock_t)&gDefaultsCacheLock);
}

+ (void)clearUserDefaultsCache
{
  id v2 = +[ARKitUserDefaults userDefaultsCache];
  os_unfair_lock_lock((os_unfair_lock_t)&gDefaultsCacheLock);
  kdebug_trace();
  [v2 removeAllObjects];
  kdebug_trace();
  os_unfair_lock_unlock((os_unfair_lock_t)&gDefaultsCacheLock);
}

+ (void)removeAllKeys
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "appleGlobalDomainARKitKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        uint64_t v8 = [MEMORY[0x1E4F1CB18] appleGlobalDomain];
        [v8 removeObjectForKey:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

+ (void)removeObjectForKey:(id)a3
{
  id v3 = a3;
  +[ARKitUserDefaults removeCachedObjectForKey:v3];
  id v4 = [MEMORY[0x1E4F1CB18] appleGlobalDomain];
  [v4 removeObjectForKey:v3];
}

+ (id)objectForKey:(id)a3 useCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  if (v4) {
    [v6 objectForKey:v5];
  }
  else {
  uint64_t v7 = [v6 objectForKeySlow:v5];
  }

  return v7;
}

+ (id)valueForKey:(id)a3
{
  return +[ARKitUserDefaults objectForKey:a3];
}

+ (void)setObject:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[ARKitUserDefaults removeCachedObjectForKey:v5];
  id v7 = [MEMORY[0x1E4F1CB18] appleGlobalDomain];
  [v7 setObject:v6 forKey:v5];
}

+ (void)setValue:(id)a3 forKey:(id)a4
{
}

+ (BOOL)BOOLForKey:(id)a3 useCache:(BOOL)a4
{
  BOOL v4 = +[ARKitUserDefaults objectForKey:a3 useCache:a4];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  char v5 = NSNumber;
  id v6 = a4;
  id v7 = [v5 numberWithBool:v4];
  +[ARKitUserDefaults setObject:v7 forKey:v6];
}

+ (id)stringForKey:(id)a3
{
  id v3 = +[ARKitUserDefaults objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_5:
    char v5 = v4;
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 stringValue];
    goto LABEL_5;
  }
  char v5 = 0;
LABEL_7:

  return v5;
}

+ (id)numberForKey:(id)a3 useCache:(BOOL)a4
{
  id v4 = +[ARKitUserDefaults objectForKey:a3 useCache:a4];
  char v5 = +[ARKitUserDefaults _numberForObject:v4];

  return v5;
}

+ (int64_t)integerForKey:(id)a3 useCache:(BOOL)a4
{
  id v4 = +[ARKitUserDefaults numberForKey:a3 useCache:a4];
  int64_t v5 = [v4 integerValue];

  return v5;
}

+ (float)floatForKey:(id)a3
{
  id v3 = +[ARKitUserDefaults numberForKey:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

+ (float)floatForKey:(id)a3 useCache:(BOOL)a4
{
  float v4 = +[ARKitUserDefaults numberForKey:a3 useCache:a4];
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

+ (double)doubleForKey:(id)a3
{
  id v3 = +[ARKitUserDefaults numberForKey:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

+ (double)doubleForKey:(id)a3 useCache:(BOOL)a4
{
  double v4 = +[ARKitUserDefaults numberForKey:a3 useCache:a4];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

+ (id)listForKey:(id)a3
{
  id v3 = +[ARKitUserDefaults objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = [v3 componentsSeparatedByString:@","];
  }
  else
  {
    double v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

+ (id)resolutionDictionaryForKey:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = +[ARKitUserDefaults objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = [v3 componentsSeparatedByString:@"x"];
    if ([v4 count] != 2)
    {
      long long v11 = 0;
      goto LABEL_8;
    }
    v18[0] = @"width";
    double v5 = NSNumber;
    double v6 = [v4 objectAtIndexedSubscript:0];
    [v6 floatValue];
    id v7 = objc_msgSend(v5, "numberWithFloat:");
    v18[1] = @"height";
    v19[0] = v7;
    uint64_t v8 = NSNumber;
    long long v9 = [v4 objectAtIndexedSubscript:1];
    [v9 floatValue];
    long long v10 = objc_msgSend(v8, "numberWithFloat:");
    v19[1] = v10;
    long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

LABEL_6:
LABEL_8:

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16[0] = @"width";
    long long v12 = NSNumber;
    id v13 = v3;
    double v4 = [v13 objectForKeyedSubscript:@"width"];
    [v4 floatValue];
    double v6 = objc_msgSend(v12, "numberWithFloat:");
    v16[1] = @"height";
    v17[0] = v6;
    uint64_t v14 = NSNumber;
    id v7 = objc_msgSend(v13, "objectForKeyedSubscript:");

    [v7 floatValue];
    long long v9 = objc_msgSend(v14, "numberWithFloat:");
    v17[1] = v9;
    long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    goto LABEL_6;
  }
  long long v11 = 0;
LABEL_10:

  return v11;
}

+ (void)synchronize
{
  id v2 = [MEMORY[0x1E4F1CB18] appleGlobalDomain];
  [v2 synchronize];
}

@end