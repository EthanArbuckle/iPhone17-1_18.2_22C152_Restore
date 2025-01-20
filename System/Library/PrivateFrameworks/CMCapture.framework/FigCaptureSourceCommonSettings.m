@interface FigCaptureSourceCommonSettings
- (BOOL)RGBIRStereoFusionThresholdsEnabled;
- (BOOL)flashMitigationRequired;
- (BOOL)frameRateSwitchBasedOnMotionForVFRDisabled;
- (BOOL)highPriorityLaunchFromLockScreenSupported;
- (BOOL)livePhotoVitalityScoringSupported;
- (BOOL)previewRegistrationExcludeStaticComponentFromAlignmentShiftsEnabled;
- (BOOL)realtimeFSDNetSupported;
- (BOOL)variableFrameRateVideoCaptureFromFWSupported;
- (BOOL)videoStabilizationAdaptiveOverscanSupported;
- (NSDictionary)memoryPoolSizeDistributions;
- (NSDictionary)photoProcessingTimeRangesInMS;
- (float)livePhotoJPEGIntermediateCompressionRatioDefaultOverride;
- (int)previewRegistrationType;
- (int)semanticRenderingVersion;
- (int)smartStyleRenderingVersion;
- (int)swfrVersion;
- (void)dealloc;
- (void)initWithCommonSettingsDictionary:(void *)a1;
@end

@implementation FigCaptureSourceCommonSettings

- (BOOL)variableFrameRateVideoCaptureFromFWSupported
{
  return self->_variableFrameRateVideoCaptureFromFWSupported;
}

- (float)livePhotoJPEGIntermediateCompressionRatioDefaultOverride
{
  return self->_livePhotoJPEGIntermediateCompressionRatioDefaultOverride;
}

- (int)semanticRenderingVersion
{
  return self->_semanticRenderingVersion;
}

- (BOOL)realtimeFSDNetSupported
{
  return self->_realtimeFSDNetSupported;
}

- (int)swfrVersion
{
  return self->_swfrVersion;
}

- (int)smartStyleRenderingVersion
{
  return self->_smartStyleRenderingVersion;
}

- (BOOL)livePhotoVitalityScoringSupported
{
  return self->_livePhotoVitalityScoringSupported;
}

- (NSDictionary)memoryPoolSizeDistributions
{
  return self->_memoryPoolSizeDistributions;
}

- (int)previewRegistrationType
{
  return self->_previewRegistrationType;
}

- (BOOL)previewRegistrationExcludeStaticComponentFromAlignmentShiftsEnabled
{
  return self->_previewRegistrationExcludeStaticComponentFromAlignmentShiftsEnabled;
}

- (BOOL)highPriorityLaunchFromLockScreenSupported
{
  return self->_highPriorityLaunchFromLockScreenSupported;
}

- (void)initWithCommonSettingsDictionary:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)FigCaptureSourceCommonSettings;
  v3 = objc_msgSendSuper2(&v6, sel_init);
  if (v3)
  {
    v3[1] = (id)[a2 objectForKeyedSubscript:@"initialMemoryPoolSizeDistributionsMB"];
    *((unsigned char *)v3 + 16) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"livePhotoVitalityScoringSupported"), "BOOLValue");
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"livePhotoJPEGIntermediateCompressionRatioDefaultOverride"), "floatValue");
    *((_DWORD *)v3 + 5) = v4;
    *((_DWORD *)v3 + 6) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"PreviewRegistrationType"), "intValue");
    *((unsigned char *)v3 + 28) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"PreviewRegistrationExcludeStaticComponentFromAlignmentShiftsEnabled"), "BOOLValue");
    v3[4] = (id)[a2 objectForKeyedSubscript:@"PhotoProcessingTimeRangesInMS"];
    *((unsigned char *)v3 + 40) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"RGBIRStereoFusionThresholdsEnabled"), "BOOLValue");
    *((unsigned char *)v3 + 41) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"flashMitigationRequired"), "BOOLValue");
    *((_DWORD *)v3 + 12) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"SWFRVersion"), "intValue");
    *((_DWORD *)v3 + 13) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"SemanticRenderingVersion"), "intValue");
    *((unsigned char *)v3 + 42) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"realtimeFSDNetSupported"), "BOOLValue");
    *((unsigned char *)v3 + 43) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"FrameRateSwitchBasedOnMotionForVFRDisabled"), "BOOLValue");
    *((unsigned char *)v3 + 44) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"VideoStabilizationAdaptiveOverscanSupported"), "BOOLValue");
    *((unsigned char *)v3 + 45) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"VariableFrameRateVideoCaptureFromFWSupported"), "BOOLValue");
    *((unsigned char *)v3 + 46) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"HighPriorityLaunchFromLockScreenSupported"), "BOOLValue");
    *((_DWORD *)v3 + 14) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"SmartStyleRenderingVersion"), "intValue");
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSourceCommonSettings;
  [(FigCaptureSourceCommonSettings *)&v3 dealloc];
}

- (NSDictionary)photoProcessingTimeRangesInMS
{
  return self->_photoProcessingTimeRangesInMS;
}

- (BOOL)RGBIRStereoFusionThresholdsEnabled
{
  return self->_RGBIRStereoFusionThresholdsEnabled;
}

- (BOOL)flashMitigationRequired
{
  return self->_flashMitigationRequired;
}

- (BOOL)frameRateSwitchBasedOnMotionForVFRDisabled
{
  return self->_frameRateSwitchBasedOnMotionForVFRDisabled;
}

- (BOOL)videoStabilizationAdaptiveOverscanSupported
{
  return self->_videoStabilizationAdaptiveOverscanSupported;
}

@end