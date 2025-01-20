@interface BWUBCaptureParameters
- (BOOL)alwaysUseAFTimeout;
- (BOOL)digitalFlashHighlightRecoveryEnabled;
- (BOOL)macroFlashQSubSwitchingEnabled;
- (BOOL)nonHDRBrightLightCapturesEnabled;
- (BOOL)preserveBlackLevel;
- (BOOL)usePreviousSIFR;
- (BWUBCaptureParameters)initWithPortType:(id)a3 sensorIDDictionary:(id)a4;
- (NSArray)afWindowParams;
- (double)deepFusionEffectiveIntegrationTimeThreshold;
- (double)digitalFlashAvailableEffectiveIntegrationTimeThreshold;
- (double)digitalFlashRecommendedEffectiveIntegrationTimeThreshold;
- (double)learnedNRUltraHighResolutionDowngradeEffectiveIntegrationTimeThreshold;
- (double)longWithoutSphereEffectiveIntegrationTimeThreshold;
- (double)lowLightEffectiveIntegrationTimeThreshold;
- (double)redSaturationMainEffectiveIntegrationTimeThreshold;
- (double)sifrMainEffectiveIntegrationTimeThreshold;
- (double)stationaryDigitalFlashRecommendedEffectiveIntegrationTimeThreshold;
- (float)autoFlashColorConstancyNormalizedSNRThreshold;
- (float)autoFlashMacroNormalizedSNRThreshold;
- (float)digitalFlashBacklitRecommendRegularFlashAERelativeDifferenceThreshold;
- (float)digitalFlashBacklitRecommendRegularFlashSNRThreshold;
- (float)digitalFlashRecommendRegularFlashSNRThreshold;
- (float)learnedNRUltraHighResolutionExposureBias;
- (float)lowLightHDRWithoutSIFRISPDGainThreshold;
- (float)nightModeMinGainThreshold;
- (float)redSaturationSIFRGainThreshold;
- (float)sifrGainThreshold;
- (float)stereoPhotoSNRDifferenceSecondarySNRThreshold;
- (float)stereoPhotoSNRDifferenceThreshold;
- (float)stereoPhotoSNRThreshold;
- (id)description;
- (id)motionAndFocusScoreWeights;
- (int)deepFusionBracketedCaptureReferenceFrameIndex;
- (int)deepFusionHDREVZeroCountForEffectiveIntegrationTime:(double)a3;
- (int)maxNumberOfFramesForAdaptiveBracketing;
- (int)referenceFrameSelectionMethod;
- (int)toneCurveBehavior;
- (void)dealloc;
@end

@implementation BWUBCaptureParameters

- (BWUBCaptureParameters)initWithPortType:(id)a3 sensorIDDictionary:(id)a4
{
  if (a3 && (uint64_t v7 = [a4 objectForKeyedSubscript:@"UBCaptureParameters"]) != 0)
  {
    v8 = (void *)v7;
    v55.receiver = self;
    v55.super_class = (Class)BWUBCaptureParameters;
    v9 = [(BWUBCaptureParameters *)&v55 init];
    if (v9)
    {
      v9->_portType = (NSString *)a3;
      v9->_nonHDRBrightLightCapturesEnabled = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"NonHDRBrightLightCapturesEnabled"), "BOOLValue");
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"LowLightEffectiveIntegrationTimeThreshold"), "doubleValue");
      v9->_lowLightEffectiveIntegrationTimeThreshold = v10;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"SIFRMainEffectiveIntegrationTimeThreshold"), "doubleValue");
      v9->_sifrMainEffectiveIntegrationTimeThreshold = v11;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"SIFRGainThreshold"), "floatValue");
      v9->_sifrGainThreshold = v12;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"LowLightHDRWithoutSIFRISPDGainThreshold"), "floatValue");
      v9->_lowLightHDRWithoutSIFRISPDGainThreshold = v13;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"LongWithoutSphereEffectiveIntegrationTimeThreshold"), "doubleValue");
      v9->_longWithoutSphereEffectiveIntegrationTimeThreshold = v14;
      v15 = (void *)[v8 objectForKeyedSubscript:@"DeepFusionEffectiveIntegrationTimeThreshold"];
      if (!v15) {
        v15 = &unk_1EFB05988;
      }
      [v15 doubleValue];
      v9->_deepFusionEffectiveIntegrationTimeThreshold = v16;
      v17 = (void *)[v8 objectForKeyedSubscript:@"DeepFusionBracketedCaptureReferenceFrameIndex"];
      if (!v17) {
        v17 = &unk_1EFB00410;
      }
      v9->_deepFusionBracketedCaptureReferenceFrameIndex = [v17 intValue];
      v18 = (NSArray *)(id)[v8 objectForKeyedSubscript:@"DeepFusionHDREVZeroCountByEffectiveIntegrationTime"];
      v9->_deepFusionHDREVZeroCountByEffectiveIntegrationTime = v18;
      if ([(NSArray *)v18 count])
      {
        fig_log_get_emitter();
        uint64_t v54 = v4;
        LODWORD(v53) = 0;
        FigDebugAssert3();

        v9->_deepFusionHDREVZeroCountByEffectiveIntegrationTime = 0;
      }
      v19 = objc_msgSend(v8, "objectForKeyedSubscript:", @"LearnedNRUltraHighResolutionDowngradeEffectiveIntegrationTimeThreshold", v53, v54);
      if (!v19) {
        v19 = &unk_1EFB05998;
      }
      [v19 doubleValue];
      v9->_learnedNRUltraHighResolutionDowngradeEffectiveIntegrationTimeThreshold = v20;
      v21 = (void *)[v8 objectForKeyedSubscript:@"LearnedNRUltraHighResolutionExposureBias"];
      if (!v21) {
        v21 = &unk_1EFB00428;
      }
      [v21 doubleValue];
      *(float *)&double v22 = v22;
      v9->_learnedNRUltraHighResolutionExposureBias = *(float *)&v22;
      v23 = (void *)[v8 objectForKeyedSubscript:@"AutoFlashColorConstancyNormalizedSNRThreshold"];
      if (!v23) {
        v23 = &unk_1EFB05998;
      }
      [v23 doubleValue];
      *(float *)&double v24 = v24;
      v9->_autoFlashColorConstancyNormalizedSNRThreshold = *(float *)&v24;
      uint64_t v25 = [v8 objectForKeyedSubscript:@"AutoFlashMacroNormalizedSNRThreshold"];
      if (v25) {
        v26 = (void *)v25;
      }
      else {
        v26 = &unk_1EFB05998;
      }
      uint64_t v27 = *MEMORY[0x1E4F52DE8];
      [(NSString *)v9->_portType isEqualToString:*MEMORY[0x1E4F52DE8]];
      [v26 doubleValue];
      *(float *)&double v28 = v28;
      v9->_autoFlashMacroNormalizedSNRThreshold = *(float *)&v28;
      [(NSString *)v9->_portType isEqualToString:v27];
      v9->_macroFlashQSubSwitchingEnabled = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"MacroFlashQSubSwitchingEnabled"), "BOOLValue");
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"RedSaturationMainEffectiveIntegrationTimeThreshold"), "doubleValue");
      v9->_redSaturationMainEffectiveIntegrationTimeThreshold = v29;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"RedSaturationSIFRGainThreshold"), "floatValue");
      v9->_redSaturationSIFRGainThreshold = v30;
      v9->_toneCurveBehavior = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"ToneCurveBehavior"), "intValue");
      v9->_preserveBlackLevel = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"PreserveBlackLevel"), "BOOLValue");
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"NightModeMinGainThreshold"), "floatValue");
      v9->_nightModeMinGainThreshold = v31;
      v9->_alwaysUseAFTimeout = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"AlwaysUseAFTimeout"), "BOOLValue");
      v9->_afWindowParams = (NSArray *)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"AFWindowParams"), "copy");
      v32 = (void *)[v8 objectForKeyedSubscript:@"AdaptiveBracketingParameters"];
      int v33 = objc_msgSend((id)objc_msgSend(v32, "objectForKeyedSubscript:", @"FirstGroupMaxNumberOfFramesCount"), "intValue");
      if (v33 <= (int)objc_msgSend((id)objc_msgSend(v32, "objectForKeyedSubscript:", @"NextGroupMaxNumberOfFramesCount"), "intValue"))v34 = @"NextGroupMaxNumberOfFramesCount"; {
      else
      }
        v34 = @"FirstGroupMaxNumberOfFramesCount";
      v9->_maxNumberOfFramesForAdaptiveBracketing = objc_msgSend((id)objc_msgSend(v32, "objectForKeyedSubscript:", v34), "intValue");
      v35 = (void *)[v8 objectForKeyedSubscript:@"DigitalFlashAvailableEffectiveIntegrationTimeThreshold"];
      if (!v35) {
        v35 = &unk_1EFB05998;
      }
      [v35 doubleValue];
      v9->_digitalFlashAvailableEffectiveIntegrationTimeThreshold = v36;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"DigitalFlashRecommendedEffectiveIntegrationTimeThreshold"), "doubleValue");
      v9->_digitalFlashRecommendedEffectiveIntegrationTimeThreshold = v37;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"StationaryDigitalFlashRecommendedEffectiveIntegrationTimeThreshold"), "doubleValue");
      v9->_stationaryDigitalFlashRecommendedEffectiveIntegrationTimeThreshold = v38;
      v39 = (void *)[v8 objectForKeyedSubscript:@"DigitalFlashRecommendRegularFlashSNRThreshold"];
      if (!v39) {
        v39 = &unk_1EFB05998;
      }
      [v39 floatValue];
      v9->_digitalFlashRecommendRegularFlashSNRThreshold = v40;
      v41 = (void *)[v8 objectForKeyedSubscript:@"DigitalFlashBacklitRecommendRegularFlashSNRThreshold"];
      if (!v41) {
        v41 = &unk_1EFB05998;
      }
      [v41 floatValue];
      v9->_digitalFlashBacklitRecommendRegularFlashSNRThreshold = v42;
      v43 = (void *)[v8 objectForKeyedSubscript:@"DigitalFlashBacklitRecommendRegularFlashAERelativeDifferenceThreshold"];
      if (!v43) {
        v43 = &unk_1EFB05998;
      }
      [v43 floatValue];
      v9->_digitalFlashBacklitRecommendRegularFlashAERelativeDifferenceThreshold = v44;
      v9->_digitalFlashHighlightRecoveryEnabled = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"DigitalFlashHighlightRecoveryEnabled"), "BOOLValue");
      v45 = (void *)[v8 objectForKeyedSubscript:@"StereoPhotoThresholdSNRThreshold"];
      if (!v45) {
        v45 = &unk_1EFB05998;
      }
      [v45 floatValue];
      v9->_stereoPhotoSNRThreshold = v46;
      v47 = (void *)[v8 objectForKeyedSubscript:@"StereoPhotoSNRDifferenceSecondarySNRThreshold"];
      if (!v47) {
        v47 = &unk_1EFB05998;
      }
      [v47 floatValue];
      v9->_stereoPhotoSNRDifferenceSecondarySNRThreshold = v48;
      v49 = (void *)[v8 objectForKeyedSubscript:@"StereoPhotoSNRDifferenceThreshold"];
      if (!v49) {
        v49 = &unk_1EFB05998;
      }
      [v49 floatValue];
      v9->_stereoPhotoSNRDifferenceThreshold = v50;
      v51 = (void *)[v8 objectForKeyedSubscript:@"ReferenceFrameSelectionParameters"];
      v9->_referenceFrameSelectionMethod = objc_msgSend((id)objc_msgSend(v51, "objectForKeyedSubscript:", @"Method"), "intValue");
      v9->_usePreviousSIFR = objc_msgSend((id)objc_msgSend(v51, "objectForKeyedSubscript:", @"UsePreviousSIFR"), "BOOLValue");
      v9->_motionAndFocusScoreWeights = (NSArray *)(id)[v51 objectForKeyedSubscript:@"MotionAndFocusScoreWeights"];
    }
  }
  else
  {

    return 0;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWUBCaptureParameters;
  [(BWUBCaptureParameters *)&v3 dealloc];
}

- (int)maxNumberOfFramesForAdaptiveBracketing
{
  return self->_maxNumberOfFramesForAdaptiveBracketing;
}

- (double)digitalFlashAvailableEffectiveIntegrationTimeThreshold
{
  return self->_digitalFlashAvailableEffectiveIntegrationTimeThreshold;
}

- (double)digitalFlashRecommendedEffectiveIntegrationTimeThreshold
{
  return self->_digitalFlashRecommendedEffectiveIntegrationTimeThreshold;
}

- (float)digitalFlashRecommendRegularFlashSNRThreshold
{
  return self->_digitalFlashRecommendRegularFlashSNRThreshold;
}

- (float)digitalFlashBacklitRecommendRegularFlashSNRThreshold
{
  return self->_digitalFlashBacklitRecommendRegularFlashSNRThreshold;
}

- (int)referenceFrameSelectionMethod
{
  return self->_referenceFrameSelectionMethod;
}

- (float)autoFlashMacroNormalizedSNRThreshold
{
  return self->_autoFlashMacroNormalizedSNRThreshold;
}

- (double)sifrMainEffectiveIntegrationTimeThreshold
{
  return self->_sifrMainEffectiveIntegrationTimeThreshold;
}

- (float)redSaturationSIFRGainThreshold
{
  return self->_redSaturationSIFRGainThreshold;
}

- (double)redSaturationMainEffectiveIntegrationTimeThreshold
{
  return self->_redSaturationMainEffectiveIntegrationTimeThreshold;
}

- (float)lowLightHDRWithoutSIFRISPDGainThreshold
{
  return self->_lowLightHDRWithoutSIFRISPDGainThreshold;
}

- (double)lowLightEffectiveIntegrationTimeThreshold
{
  return self->_lowLightEffectiveIntegrationTimeThreshold;
}

- (double)learnedNRUltraHighResolutionDowngradeEffectiveIntegrationTimeThreshold
{
  return self->_learnedNRUltraHighResolutionDowngradeEffectiveIntegrationTimeThreshold;
}

- (double)deepFusionEffectiveIntegrationTimeThreshold
{
  return self->_deepFusionEffectiveIntegrationTimeThreshold;
}

- (float)sifrGainThreshold
{
  return self->_sifrGainThreshold;
}

- (BOOL)preserveBlackLevel
{
  return self->_preserveBlackLevel;
}

- (BOOL)nonHDRBrightLightCapturesEnabled
{
  return self->_nonHDRBrightLightCapturesEnabled;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p> lowLightEIT=%f, sifrMainEIT=%f, sifrGain=%f, lowLightHDRWithoutSIFR=%f, longWithoutSphere=%f, deepFusion=%f, rsmMainEIT=%f, rsmSIFRGain=%f, toneCurveBehavior=%d, preserveBlackLevel=%d, afWindows=%p, refMethod=%d, usePreviousSIFR=%d, motionAndFocusScoreWeights=%@, maxNumberOfFramesForAdaptiveBracketing=%d, dFlashAvailableEIT=%f, dFlashRecommendedEIT=%f, dFlashStationaryRecommendedEIT=%f, dFlashRecommendRegularFlashSNR=%f, dFlashBacklitRecommendRegularFlashSNR=%f, dFlashBacklitRecommendRegularFlashAERelativeDiff=%f", objc_opt_class(), self, *(void *)&self->_lowLightEffectiveIntegrationTimeThreshold, *(void *)&self->_sifrMainEffectiveIntegrationTimeThreshold, self->_sifrGainThreshold, self->_lowLightHDRWithoutSIFRISPDGainThreshold, *(void *)&self->_longWithoutSphereEffectiveIntegrationTimeThreshold, *(void *)&self->_deepFusionEffectiveIntegrationTimeThreshold, *(void *)&self->_redSaturationMainEffectiveIntegrationTimeThreshold, self->_redSaturationSIFRGainThreshold, self->_toneCurveBehavior, self->_preserveBlackLevel, self->_afWindowParams, self->_referenceFrameSelectionMethod, self->_usePreviousSIFR, self->_motionAndFocusScoreWeights,
               self->_maxNumberOfFramesForAdaptiveBracketing,
               *(void *)&self->_digitalFlashAvailableEffectiveIntegrationTimeThreshold,
               *(void *)&self->_digitalFlashRecommendedEffectiveIntegrationTimeThreshold,
               *(void *)&self->_stationaryDigitalFlashRecommendedEffectiveIntegrationTimeThreshold,
               self->_digitalFlashRecommendRegularFlashSNRThreshold,
               self->_digitalFlashBacklitRecommendRegularFlashSNRThreshold,
               self->_digitalFlashBacklitRecommendRegularFlashAERelativeDifferenceThreshold);
}

- (int)deepFusionHDREVZeroCountForEffectiveIntegrationTime:(double)a3
{
  if (![(NSArray *)self->_deepFusionHDREVZeroCountByEffectiveIntegrationTime count]
    || ![(NSArray *)self->_deepFusionHDREVZeroCountByEffectiveIntegrationTime count])
  {
    return 3;
  }
  unint64_t v5 = 0;
  while (1)
  {
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_deepFusionHDREVZeroCountByEffectiveIntegrationTime, "objectAtIndexedSubscript:", v5), "doubleValue");
    deepFusionHDREVZeroCountByEffectiveIntegrationTime = self->_deepFusionHDREVZeroCountByEffectiveIntegrationTime;
    if (v7 < a3) {
      break;
    }
    v5 += 2;
    if ([(NSArray *)deepFusionHDREVZeroCountByEffectiveIntegrationTime count] <= v5) {
      return 3;
    }
  }
  id v9 = [(NSArray *)deepFusionHDREVZeroCountByEffectiveIntegrationTime objectAtIndexedSubscript:v5 & 0xFFFFFFFE | 1];
  return [v9 intValue];
}

- (double)stationaryDigitalFlashRecommendedEffectiveIntegrationTimeThreshold
{
  return self->_stationaryDigitalFlashRecommendedEffectiveIntegrationTimeThreshold;
}

- (float)digitalFlashBacklitRecommendRegularFlashAERelativeDifferenceThreshold
{
  return self->_digitalFlashBacklitRecommendRegularFlashAERelativeDifferenceThreshold;
}

- (BOOL)digitalFlashHighlightRecoveryEnabled
{
  return self->_digitalFlashHighlightRecoveryEnabled;
}

- (float)stereoPhotoSNRThreshold
{
  return self->_stereoPhotoSNRThreshold;
}

- (float)stereoPhotoSNRDifferenceSecondarySNRThreshold
{
  return self->_stereoPhotoSNRDifferenceSecondarySNRThreshold;
}

- (float)stereoPhotoSNRDifferenceThreshold
{
  return self->_stereoPhotoSNRDifferenceThreshold;
}

- (BOOL)usePreviousSIFR
{
  return self->_usePreviousSIFR;
}

- (id)motionAndFocusScoreWeights
{
  return self->_motionAndFocusScoreWeights;
}

- (double)longWithoutSphereEffectiveIntegrationTimeThreshold
{
  return self->_longWithoutSphereEffectiveIntegrationTimeThreshold;
}

- (int)deepFusionBracketedCaptureReferenceFrameIndex
{
  return self->_deepFusionBracketedCaptureReferenceFrameIndex;
}

- (float)learnedNRUltraHighResolutionExposureBias
{
  return self->_learnedNRUltraHighResolutionExposureBias;
}

- (BOOL)macroFlashQSubSwitchingEnabled
{
  return self->_macroFlashQSubSwitchingEnabled;
}

- (float)autoFlashColorConstancyNormalizedSNRThreshold
{
  return self->_autoFlashColorConstancyNormalizedSNRThreshold;
}

- (int)toneCurveBehavior
{
  return self->_toneCurveBehavior;
}

- (float)nightModeMinGainThreshold
{
  return self->_nightModeMinGainThreshold;
}

- (NSArray)afWindowParams
{
  return self->_afWindowParams;
}

- (BOOL)alwaysUseAFTimeout
{
  return self->_alwaysUseAFTimeout;
}

@end