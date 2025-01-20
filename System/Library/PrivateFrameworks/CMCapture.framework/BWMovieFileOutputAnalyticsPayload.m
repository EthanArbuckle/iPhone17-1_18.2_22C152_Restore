@interface BWMovieFileOutputAnalyticsPayload
- (BOOL)afDriverShortOccurred;
- (BOOL)audioMixWithOthersEnabled;
- (BOOL)audioWasPlayingDuringCapture;
- (BOOL)capturingOntoExternalStorageDevice;
- (BOOL)cinematicAudioEnabled;
- (BOOL)cinematicVideoEnabled;
- (BOOL)hdrVideo;
- (BOOL)proresVideo;
- (BOOL)stereoVideoCaptureEnabled;
- (BOOL)videoMirrored;
- (BWCoreAnalyticsMovieRecordingCinematicVideoStatistics)cinematicVideoMovieRecordingStats;
- (BWCoreAnalyticsMovieRecordingSphereAFStatistics)sphereAFStatistics;
- (BWCoreAnalyticsMovieRecordingVideoSTFStatistics)videoSTFStatistics;
- (BWMovieFileOutputAnalyticsPayload)init;
- (NSDictionary)APSModeByPortType;
- (NSDictionary)cameraSwitchStatistics;
- (NSDictionary)sphereModeByPortType;
- (NSDictionary)variableFrameRateStatistics;
- (NSString)clientApplicationID;
- (NSString)externalStorageDeviceProductName;
- (NSString)externalStorageDeviceVendorName;
- (NSString)videoCodec;
- (double)duration;
- (double)durationFront;
- (double)durationFrontSuperWide;
- (double)durationRearSuperWide;
- (double)durationRearTele;
- (double)durationRearWide;
- (float)averageSystemPressureLevel;
- (float)maxUIZoomDuringVideoRecording;
- (float)minUIZoomDuringVideoRecording;
- (float)nominalFramerate;
- (float)percentageOfAvailableDataStorageAfterWritingMovie;
- (float)startingUIZoom;
- (id)eventDictionary;
- (id)eventName;
- (int)activeDeviceMask;
- (int)calibrationValidationStatusCmCl;
- (int)calibrationValidationStatusCmPM;
- (int)calibrationValidationStatusFCCl;
- (int)cameraPosture;
- (int)colorSpace;
- (int)coreRepairStatusFrontCameraAssembly;
- (int)coreRepairStatusRearCameraAssembly;
- (int)devicePosition;
- (int)deviceType;
- (int)height;
- (int)maxSystemPressureLevel;
- (int)numberOfTimesRecordingWasPaused;
- (int)stereoVideoCaptureStatus;
- (int)videoOrientation;
- (int)width;
- (int64_t)movieFileSize;
- (int64_t)timeToCriticalSystemPressureInMS;
- (int64_t)totalNANDReadBytesDuringRecording;
- (int64_t)totalNANDWriteBytesDuringRecording;
- (unint64_t)externalStorageDeviceBaseOffset;
- (unint64_t)externalStorageDeviceTotalSize;
- (unint64_t)numberOfFramesDroppedDueToFormatWriterQueueFull;
- (unint64_t)numberOfISPFrames;
- (unint64_t)numberOfISPFramesDropped;
- (unint64_t)totalNumberOfFramesDropped;
- (unsigned)systemPressureFactors;
- (void)dealloc;
- (void)reset;
- (void)setAPSModeByPortType:(id)a3;
- (void)setActiveDeviceMask:(int)a3;
- (void)setAfDriverShortOccurred:(BOOL)a3;
- (void)setAudioMixWithOthersEnabled:(BOOL)a3;
- (void)setAudioWasPlayingDuringCapture:(BOOL)a3;
- (void)setAverageSystemPressureLevel:(float)a3;
- (void)setCalibrationValidationStatusCmCl:(int)a3;
- (void)setCalibrationValidationStatusCmPM:(int)a3;
- (void)setCalibrationValidationStatusFCCl:(int)a3;
- (void)setCameraPosture:(int)a3;
- (void)setCameraSwitchStatistics:(id)a3;
- (void)setCapturingOntoExternalStorageDevice:(BOOL)a3;
- (void)setCinematicAudioEnabled:(BOOL)a3;
- (void)setCinematicVideoEnabled:(BOOL)a3;
- (void)setCinematicVideoMovieRecordingStats:(BWCoreAnalyticsMovieRecordingCinematicVideoStatistics *)a3;
- (void)setClientApplicationID:(id)a3;
- (void)setColorSpace:(int)a3;
- (void)setCoreRepairStatusFrontCameraAssembly:(int)a3;
- (void)setCoreRepairStatusRearCameraAssembly:(int)a3;
- (void)setDevicePosition:(int)a3;
- (void)setDeviceType:(int)a3;
- (void)setDuration:(double)a3;
- (void)setDurationFront:(double)a3;
- (void)setDurationFrontSuperWide:(double)a3;
- (void)setDurationRearSuperWide:(double)a3;
- (void)setDurationRearTele:(double)a3;
- (void)setDurationRearWide:(double)a3;
- (void)setExternalStorageDeviceBaseOffset:(unint64_t)a3;
- (void)setExternalStorageDeviceProductName:(id)a3;
- (void)setExternalStorageDeviceTotalSize:(unint64_t)a3;
- (void)setExternalStorageDeviceVendorName:(id)a3;
- (void)setHdrVideo:(BOOL)a3;
- (void)setHeight:(int)a3;
- (void)setMaxSystemPressureLevel:(int)a3;
- (void)setMaxUIZoomDuringVideoRecording:(float)a3;
- (void)setMinUIZoomDuringVideoRecording:(float)a3;
- (void)setMovieFileSize:(int64_t)a3;
- (void)setNominalFramerate:(float)a3;
- (void)setNumberOfFramesDroppedDueToFormatWriterQueueFull:(unint64_t)a3;
- (void)setNumberOfISPFrames:(unint64_t)a3;
- (void)setNumberOfISPFramesDropped:(unint64_t)a3;
- (void)setNumberOfTimesRecordingWasPaused:(int)a3;
- (void)setPercentageOfAvailableDataStorageAfterWritingMovie:(float)a3;
- (void)setProresVideo:(BOOL)a3;
- (void)setSphereAFStatistics:(BWCoreAnalyticsMovieRecordingSphereAFStatistics *)a3;
- (void)setSphereModeByPortType:(id)a3;
- (void)setStartingUIZoom:(float)a3;
- (void)setStereoVideoCaptureEnabled:(BOOL)a3;
- (void)setStereoVideoCaptureStatus:(int)a3;
- (void)setSystemPressureFactors:(unsigned int)a3;
- (void)setTimeToCriticalSystemPressureInMS:(int64_t)a3;
- (void)setTotalNANDReadBytesDuringRecording:(int64_t)a3;
- (void)setTotalNANDWriteBytesDuringRecording:(int64_t)a3;
- (void)setTotalNumberOfFramesDropped:(unint64_t)a3;
- (void)setVariableFrameRateStatistics:(id)a3;
- (void)setVideoCodec:(id)a3;
- (void)setVideoMirrored:(BOOL)a3;
- (void)setVideoOrientation:(int)a3;
- (void)setVideoSTFStatistics:(BWCoreAnalyticsMovieRecordingVideoSTFStatistics *)a3;
- (void)setWidth:(int)a3;
@end

@implementation BWMovieFileOutputAnalyticsPayload

- (BWMovieFileOutputAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWMovieFileOutputAnalyticsPayload;
  v2 = [(BWMovieFileOutputAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWMovieFileOutputAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  v2 = self;
  self->_deviceType = 0;
  *(void *)&self->_activeDeviceMask = 0;
  *(void *)&self->_videoOrientation = 0;
  self->_videoMirrored = 0;
  self->_duration = 0.0;
  self->_durationFront = 0.0;
  self->_durationRearTele = 0.0;
  self->_durationRearSuperWide = 0.0;
  self->_durationRearWide = 0.0;
  self->_nominalFramerate = 3.4028e38;
  *(void *)&self->_height = 0x8000000080000000;
  self->_numberOfTimesRecordingWasPaused = 0;
  *(_OWORD *)&self->_startingUIZoom = xmmword_1A5F0C920;
  self->_maxSystemPressureLevel = 0;
  self->_timeToCriticalSystemPressureInMS = -1;
  self->_systemPressureFactors = 0;

  v2->_clientApplicationID = 0;
  v2->_sphereAFStatistics = 0;

  v2->_sphereModeByPortType = 0;
  v2->_APSModeByPortType = 0;

  v2->_variableFrameRateStatistics = 0;
  v2->_afDriverShortOccurred = 0;
  v2->_totalNumberOfFramesDropped = 0;
  v2->_numberOfFramesDroppedDueToFormatWriterQueueFull = 0;
  *(_WORD *)&v2->_hdrVideo = 0;
  v2->_colorSpace = -1;
  v2->_stereoVideoCaptureEnabled = 0;
  v2->_stereoVideoCaptureStatus = 1;
  v2->_numberOfISPFramesDropped = 0;
  v2->_numberOfISPFrames = 0;

  v2->_cameraSwitchStatistics = 0;
  *(_OWORD *)&v2->_cinematicVideoMovieRecordingStats.countOfSoftFocusRequests = 0u;
  v2 = (BWMovieFileOutputAnalyticsPayload *)((char *)v2 + 252);
  *(void *)&v2[-1]._calibrationValidationStatusFCCl = 0;
  LOBYTE(v2[-1]._coreRepairStatusFrontCameraAssembly) = 0;
  *(_OWORD *)&v2->_videoOrientation = 0u;
  LOBYTE(v2->_clientApplicationID) = 0;

  *(void *)(&v2->_numberOfTimesRecordingWasPaused + 1) = 0;
  *(NSString **)((char *)&v2->_clientApplicationID + 4) = 0;
  HIDWORD(v2->_duration) = -1082130432;
  *(double *)((char *)&v2->_durationFront + 4) = NAN;
  *(double *)((char *)&v2->_durationFrontSuperWide + 4) = NAN;
  BYTE4(v2->_durationRearWide) = 0;

  *(double *)((char *)&v2->_durationRearSuperWide + 4) = 0.0;
  *(double *)((char *)&v2->_durationRearTele + 4) = 0.0;
  *(_OWORD *)&v2->_height = xmmword_1A5F0C930;
  LOWORD(v2->_maxUIZoomDuringVideoRecording) = 0;
  *(void *)&long long v3 = 0x8000000080000000;
  *((void *)&v3 + 1) = 0x8000000080000000;
  *(_OWORD *)&v2->_averageSystemPressureLevel = v3;
  v2->_systemPressureFactors = 0x7FFFFFFF;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWMovieFileOutputAnalyticsPayload;
  [(BWMovieFileOutputAnalyticsPayload *)&v3 dealloc];
}

- (id)eventName
{
  if (self->_proresVideo) {
    return @"com.apple.coremedia.camera.ProResMovieFileCapture";
  }
  else {
    return @"com.apple.coremedia.camera.MovieFileCapture";
  }
}

- (id)eventDictionary
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), @"clientIDType");
  [v3 setObject:self->_clientApplicationID forKeyedSubscript:@"clientApplicationID"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_videoMirrored), @"videoMirrored");
  if (self->_activeDeviceMask) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"activeDeviceMask");
  }
  if (self->_devicePosition) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"devicePosition");
  }
  if (self->_videoOrientation) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"videoOrientation");
  }
  if (self->_cameraPosture) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"cameraPosture");
  }
  if (self->_deviceType) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"deviceType");
  }
  if (self->_numberOfTimesRecordingWasPaused) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"numberOfTimesRecordingWasPaused");
  }
  if (self->_duration != 0.0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:"), @"duration");
  }
  if (self->_durationFront != 0.0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:"), @"durationFront");
  }
  if (self->_durationFrontSuperWide != 0.0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_durationFront), @"durationFrontSuperWide");
  }
  if (self->_durationRearWide != 0.0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:"), @"durationRearWide");
  }
  if (self->_durationRearTele != 0.0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:"), @"durationRearTele");
  }
  double durationRearSuperWide = self->_durationRearSuperWide;
  if (durationRearSuperWide != 0.0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:"), @"durationRearSuperWide");
  }
  if (self->_nominalFramerate != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"nominalFramerate");
  }
  if (self->_height != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"height");
  }
  if (self->_width != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"width");
  }
  if (self->_startingUIZoom != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"startingUIZoom");
  }
  if (self->_minUIZoomDuringVideoRecording != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"minUIZoomDuringVideoRecording");
  }
  if (self->_maxUIZoomDuringVideoRecording != 1.1755e-38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"maxUIZoomDuringVideoRecording");
  }
  *(float *)&double durationRearSuperWide = self->_averageSystemPressureLevel;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", durationRearSuperWide), @"averageSystemPressureLevel");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_maxSystemPressureLevel), @"maxSystemPressureLevel");
  if ((self->_timeToCriticalSystemPressureInMS & 0x8000000000000000) == 0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:"), @"timeToCriticalSystemPressure");
  }
  if (self->_systemPressureFactors) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"systemPressureFactors");
  }
  sphereAFStatistics = self->_sphereAFStatistics;
  if (sphereAFStatistics)
  {
    *(float *)&double v5 = sphereAFStatistics->accelStandardDeviation;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v5), @"accelStd");
    *(float *)&double v7 = self->_sphereAFStatistics->gyroStandardDeviation;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v7), @"gyroStd");
    v9 = self->_sphereAFStatistics;
    if (v9->numberOfSamplesWide)
    {
      v8.i32[0] = LODWORD(v9->sphereMaxTrackErrorWide);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", *(double *)v8.i64), @"oisMaxTrackErrorWide");
      *(float *)&double v10 = self->_sphereAFStatistics->afMaxTrackErrorWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v10), @"afMaxTrackErrorWide");
      *(float *)&double v11 = sqrtf(self->_sphereAFStatistics->sphereStdTrackErrorSumXXWide/ (float)self->_sphereAFStatistics->numberOfSamplesWide);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v11), @"oisStdTrackErrorWide");
      *(float *)&double v12 = sqrtf(self->_sphereAFStatistics->afStdTrackErrorSumXXWide/ (float)self->_sphereAFStatistics->numberOfSamplesWide);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v12), @"afStdTrackErrorWide");
      *(float *)&double v13 = self->_sphereAFStatistics->sphereMinDistanceFromEndStopWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v13), @"oisMinDistFromEndStopWide");
      *(float *)&double v14 = self->_sphereAFStatistics->spherePowerWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v14), @"oisPowerWide");
      *(float *)&double v15 = self->_sphereAFStatistics->afPowerWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v15), @"afPowerWide");
      *(float *)&double v16 = self->_sphereAFStatistics->sphereMaxPeakCurrentWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v16), @"oisMaxPeakCurrentWide");
      *(float *)&double v17 = self->_sphereAFStatistics->afMaxPeakCurrentWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v17), @"afMaxPeakCurrentWide");
      *(float *)&double v18 = self->_sphereAFStatistics->afAndSphereMaxPeakCurrentWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v18), @"afAndOisMaxPeakCurrentWide");
      v19 = self->_sphereAFStatistics;
      int32x4_t v8 = *(int32x4_t *)&v19->range_0_90umBinWide;
      unsigned int v20 = vaddvq_s32(vaddq_s32(v8, *(int32x4_t *)&v19->range_150_175umBinWide));
      if (v20)
      {
        float v21 = (float)v20;
        *(float *)v8.i32 = (float)v8.u32[0] / (float)v20;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", *(double *)v8.i64), @"oisPos0to90micronsWide");
        *(float *)&double v22 = (float)self->_sphereAFStatistics->range_90_110umBinWide / v21;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v22), @"oisPos90to110micronsWide");
        *(float *)&double v23 = (float)self->_sphereAFStatistics->range_110_130umBinWide / v21;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v23), @"oisPos110to130micronsWide");
        *(float *)&double v24 = (float)self->_sphereAFStatistics->range_130_150umBinWide / v21;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v24), @"oisPos130to150micronsWide");
        *(float *)&double v25 = (float)self->_sphereAFStatistics->range_150_175umBinWide / v21;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v25), @"oisPos150to175micronsWide");
        v27 = self->_sphereAFStatistics;
        v28 = NSNumber;
        if (v27->sphereTravelRangeHistogramExtended)
        {
          *(float *)&double v26 = (float)v27->range_175_220umBinWide / v21;
          objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v26), @"oisPos175to220micronsWide");
          v28 = NSNumber;
          p_range_220_infinityBinWide = &self->_sphereAFStatistics->range_220_infinityBinWide;
          v30 = @"oisPos220toInfmicronsWide";
        }
        else
        {
          p_range_220_infinityBinWide = &v27->range_175_infinityBinWide;
          v30 = @"oisPos175toInfmicronsWide";
        }
        *(float *)&double v26 = (float)*p_range_220_infinityBinWide / v21;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v28, "numberWithFloat:", v26), v30);
      }
    }
    v31 = self->_sphereAFStatistics;
    if (v31->numberOfSamplesTele)
    {
      v8.i32[0] = LODWORD(v31->sphereMaxTrackErrorTele);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", *(double *)v8.i64), @"oisMaxTrackErrorTele");
      *(float *)&double v32 = self->_sphereAFStatistics->afMaxTrackErrorTele;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v32), @"afMaxTrackErrorTele");
      *(float *)&double v33 = sqrtf(self->_sphereAFStatistics->sphereStdTrackErrorSumXXTele/ (float)self->_sphereAFStatistics->numberOfSamplesTele);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v33), @"oisStdTrackErrorTele");
      *(float *)&double v34 = sqrtf(self->_sphereAFStatistics->afStdTrackErrorSumXXTele/ (float)self->_sphereAFStatistics->numberOfSamplesTele);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v34), @"afStdTrackErrorTele");
      *(float *)&double v35 = self->_sphereAFStatistics->sphereMinDistanceFromEndStopTele;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v35), @"oisMinDistFromEndStopTele");
      *(float *)&double v36 = self->_sphereAFStatistics->spherePowerTele;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v36), @"oisPowerTele");
      *(float *)&double v37 = self->_sphereAFStatistics->afPowerTele;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v37), @"afPowerTele");
      *(float *)&double v38 = self->_sphereAFStatistics->sphereMaxPeakCurrentTele;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v38), @"oisMaxPeakCurrentTele");
      *(float *)&double v39 = self->_sphereAFStatistics->afMaxPeakCurrentTele;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v39), @"afMaxPeakCurrentTele");
      *(float *)&double v40 = self->_sphereAFStatistics->afAndSphereMaxPeakCurrentTele;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v40), @"afAndOisMaxPeakCurrentTele");
      v41 = self->_sphereAFStatistics;
      int32x4_t v8 = *(int32x4_t *)&v41->range_0_90umBinTele;
      unsigned int v42 = vaddvq_s32(vaddq_s32(v8, *(int32x4_t *)&v41->range_150_175umBinTele));
      if (v42)
      {
        float v43 = (float)v42;
        *(float *)v8.i32 = (float)v8.u32[0] / (float)v42;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", *(double *)v8.i64), @"oisPos0to90micronsTele");
        *(float *)&double v44 = (float)self->_sphereAFStatistics->range_90_110umBinTele / v43;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v44), @"oisPos90to110micronsTele");
        *(float *)&double v45 = (float)self->_sphereAFStatistics->range_110_130umBinTele / v43;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v45), @"oisPos110to130micronsTele");
        *(float *)&double v46 = (float)self->_sphereAFStatistics->range_130_150umBinTele / v43;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v46), @"oisPos130to150micronsTele");
        *(float *)&double v47 = (float)self->_sphereAFStatistics->range_150_175umBinTele / v43;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v47), @"oisPos150to175micronsTele");
        v49 = self->_sphereAFStatistics;
        v50 = NSNumber;
        if (v49->sphereTravelRangeHistogramExtended)
        {
          *(float *)&double v48 = (float)v49->range_175_220umBinTele / v43;
          objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v48), @"oisPos175to220micronsTele");
          v50 = NSNumber;
          p_range_220_infinityBinTele = &self->_sphereAFStatistics->range_220_infinityBinTele;
          v52 = @"oisPos220toInfmicronsTele";
        }
        else
        {
          p_range_220_infinityBinTele = &v49->range_175_infinityBinTele;
          v52 = @"oisPos175toInfmicronsTele";
        }
        *(float *)&double v48 = (float)*p_range_220_infinityBinTele / v43;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v50, "numberWithFloat:", v48), v52);
      }
    }
    v53 = self->_sphereAFStatistics;
    if (v53->numberOfSamplesSuperWide)
    {
      v8.i32[0] = LODWORD(v53->afMaxTrackErrorSuperWide);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", *(double *)v8.i64), @"afMaxTrackErrorSuperWide");
      *(float *)&double v54 = sqrtf(self->_sphereAFStatistics->afStdTrackErrorSumXXSuperWide/ (float)self->_sphereAFStatistics->numberOfSamplesSuperWide);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v54), @"afStdTrackErrorSuperWide");
      *(float *)&double v55 = self->_sphereAFStatistics->afPowerSuperWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v55), @"afPowerSuperWide");
      *(float *)&double v56 = self->_sphereAFStatistics->afMaxPeakCurrentSuperWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v56), @"afMaxPeakCurrentSuperWide");
      v53 = self->_sphereAFStatistics;
    }
    v8.i32[0] = LODWORD(v53->sphereMaxPeakCurrentAllChannels);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", *(double *)v8.i64), @"oisMaxPeakCurrentAllChannels");
    *(float *)&double v57 = self->_sphereAFStatistics->afMaxPeakCurrentAllChannels;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v57), @"afMaxPeakCurrentAllChannels");
    *(float *)&double v58 = self->_sphereAFStatistics->afAndSphereMaxPeakCurrentAllChannels;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v58), @"afAndOisMaxPeakCurrentAllChannels");
  }
  sphereModeByPortType = self->_sphereModeByPortType;
  v60 = (uint64_t *)MEMORY[0x1E4F52DD8];
  v61 = (uint64_t *)MEMORY[0x1E4F52DF0];
  if (sphereModeByPortType)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](sphereModeByPortType, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DD8]), @"sphereModeWide");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_sphereModeByPortType, "objectForKeyedSubscript:", *v61), @"sphereModeTele");
  }
  APSModeByPortType = self->_APSModeByPortType;
  v63 = (uint64_t *)MEMORY[0x1E4F52DE8];
  if (APSModeByPortType)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](APSModeByPortType, "objectForKeyedSubscript:", *v60), @"apsModeWide");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_APSModeByPortType, "objectForKeyedSubscript:", *v61), @"apsModeTele");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_APSModeByPortType, "objectForKeyedSubscript:", *v63), @"apsModeSuperWide");
  }
  variableFrameRateStatistics = self->_variableFrameRateStatistics;
  if (variableFrameRateStatistics)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](variableFrameRateStatistics, "objectForKeyedSubscript:", 0x1EFA73A40), @"vfrEnabled");
    id v65 = [(NSDictionary *)self->_variableFrameRateStatistics objectForKeyedSubscript:0x1EFA73A60];
    v66 = (void *)[v65 objectForKeyedSubscript:&unk_1EFB00530];
    v67 = NSNumber;
    if (v66) {
      uint64_t v68 = [v66 intValue];
    }
    else {
      uint64_t v68 = 0;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v67, "numberWithInt:", v68), @"countOfFrameRateChangesDueToInitialization");
    v69 = (void *)[v65 objectForKeyedSubscript:&unk_1EFB00548];
    v70 = NSNumber;
    if (v69) {
      uint64_t v71 = [v69 intValue];
    }
    else {
      uint64_t v71 = 0;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v70, "numberWithInt:", v71), @"countOfFrameRateChangesDueToHighLightStable");
    v72 = (void *)[v65 objectForKeyedSubscript:&unk_1EFB00560];
    v73 = NSNumber;
    if (v72) {
      uint64_t v74 = [v72 intValue];
    }
    else {
      uint64_t v74 = 0;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v73, "numberWithInt:", v74), @"countOfFrameRateChangesDueToHighLightUnstable");
    v75 = (void *)[v65 objectForKeyedSubscript:&unk_1EFB00578];
    v76 = NSNumber;
    if (v75) {
      uint64_t v77 = [v75 intValue];
    }
    else {
      uint64_t v77 = 0;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v76, "numberWithInt:", v77), @"countOfFrameRateChangesDueToHighLightAELimitsReached");
    v78 = (void *)[v65 objectForKeyedSubscript:&unk_1EFB00590];
    v79 = NSNumber;
    if (v78) {
      uint64_t v80 = [v78 intValue];
    }
    else {
      uint64_t v80 = 0;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v79, "numberWithInt:", v80), @"countOfFrameRateChangesDueToHighLightFlickerDetected");
    v81 = (void *)[v65 objectForKeyedSubscript:&unk_1EFB005A8];
    v82 = NSNumber;
    if (v81) {
      uint64_t v83 = [v81 intValue];
    }
    else {
      uint64_t v83 = 0;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v82, "numberWithInt:", v83), @"countOfFrameRateChangesDueToMediumLight");
    v84 = (void *)[v65 objectForKeyedSubscript:&unk_1EFB005C0];
    v85 = NSNumber;
    if (v84) {
      uint64_t v86 = [v84 intValue];
    }
    else {
      uint64_t v86 = 0;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v85, "numberWithInt:", v86), @"countOfFrameRateChangesDueToMediumLightAELimitsReached");
    v87 = (void *)[v65 objectForKeyedSubscript:&unk_1EFB005D8];
    v88 = NSNumber;
    if (v87) {
      uint64_t v89 = [v87 intValue];
    }
    else {
      uint64_t v89 = 0;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v88, "numberWithInt:", v89), @"countOfFrameRateChangesDueToLowLightToHighLightStopOver");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_afDriverShortOccurred), @"afDriverShortOccurred");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_totalNumberOfFramesDropped), @"totalNumberOfFramesDropped");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_numberOfFramesDroppedDueToFormatWriterQueueFull), @"numberOfFramesDroppedDueToFormatWriterQueueFull");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_numberOfISPFrames), @"numberOfISPFrames");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_numberOfISPFramesDropped), @"numberOfISPFramesDropped");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_hdrVideo), @"hdrVideo");
  videoSTFStatistics = self->_videoSTFStatistics;
  if (videoSTFStatistics)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", videoSTFStatistics->videoSTFEnabled), @"videoSTFEnabled");
    v91 = self->_videoSTFStatistics;
    if (v91->videoSTFEnabled)
    {
      [v3 setObject:v91->cancelReason forKeyedSubscript:@"videoSTFCancelReason"];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_videoSTFStatistics->version), @"videoSTFVersion");
      *(float *)&double v92 = self->_videoSTFStatistics->videoSTFAppliedFrameCountPercentage;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v92), @"videoSTFAppliedFrameCountPercentage");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_videoSTFStatistics->videoSTFAppliedFrameCountPercentage > 0.0), @"videoSTFApplied");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_videoSTFStatistics->lowMeanCorrectionLevelFrameCount), @"videoSTFLowMeanCorrectionLevelFrameCount");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_videoSTFStatistics->moderateMeanCorrectionLevelFrameCount), @"videoSTFModerateMeanCorrectionLevelFrameCount");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_videoSTFStatistics->highMeanCorrectionLevelFrameCount), @"videoSTFHighMeanCorrectionLevelFrameCount");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_videoSTFStatistics->veryHighMeanCorrectionLevelFrameCount), @"videoSTFVeryHighMeanCorrectionLevelFrameCount");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_videoSTFStatistics->extremeMeanCorrectionLevelFrameCount), @"videoSTFExtremeMeanCorrectionLevelFrameCount");
      *(float *)&double v93 = self->_videoSTFStatistics->largestMaxCorrectionLevel;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v93), @"videoSTFLargestMaxCorrectionLevel");
    }
  }
  uint64_t v94 = *v60;
  id v95 = [(NSDictionary *)self->_cameraSwitchStatistics objectForKeyedSubscript:*v60];
  uint64_t v96 = *v63;
  uint64_t v97 = [v95 objectForKeyedSubscript:*v63];
  if (v97) {
    v98 = (void *)v97;
  }
  else {
    v98 = &unk_1EFB005F0;
  }
  [v3 setObject:v98 forKeyedSubscript:@"countOfWideToSuperWide"];
  uint64_t v99 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_cameraSwitchStatistics, "objectForKeyedSubscript:", v96), "objectForKeyedSubscript:", v94);
  if (v99) {
    v100 = (void *)v99;
  }
  else {
    v100 = &unk_1EFB005F0;
  }
  [v3 setObject:v100 forKeyedSubscript:@"countOfSuperWideToWide"];
  id v101 = [(NSDictionary *)self->_cameraSwitchStatistics objectForKeyedSubscript:v96];
  uint64_t v102 = *v61;
  uint64_t v103 = [v101 objectForKeyedSubscript:v102];
  if (v103) {
    v104 = (void *)v103;
  }
  else {
    v104 = &unk_1EFB005F0;
  }
  [v3 setObject:v104 forKeyedSubscript:@"countOfSuperWideToTele"];
  uint64_t v105 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_cameraSwitchStatistics, "objectForKeyedSubscript:", v102), "objectForKeyedSubscript:", v96);
  if (v105) {
    v106 = (void *)v105;
  }
  else {
    v106 = &unk_1EFB005F0;
  }
  [v3 setObject:v106 forKeyedSubscript:@"countOfTeleToSuperWide"];
  uint64_t v107 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_cameraSwitchStatistics, "objectForKeyedSubscript:", v94), "objectForKeyedSubscript:", v102);
  if (v107) {
    v108 = (void *)v107;
  }
  else {
    v108 = &unk_1EFB005F0;
  }
  [v3 setObject:v108 forKeyedSubscript:@"countOfWideToTele"];
  uint64_t v109 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_cameraSwitchStatistics, "objectForKeyedSubscript:", v102), "objectForKeyedSubscript:", v94);
  if (v109) {
    v110 = (void *)v109;
  }
  else {
    v110 = &unk_1EFB005F0;
  }
  [v3 setObject:v110 forKeyedSubscript:@"countOfTeleToWide"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_cinematicVideoEnabled), @"cinematicVideoEnabled");
  if (self->_cinematicVideoEnabled)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_cinematicVideoMovieRecordingStats.countOfSoftFocusRequests), @"cinematicVideoCountOfSoftFocusRequests");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_cinematicVideoMovieRecordingStats.countOfHardFocusRequests), @"cinematicVideoCountOfHardFocusRequests");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_cinematicVideoMovieRecordingStats.countOfFixedPlaneFocusRequests), @"cinematicVideoCountOfFixedPlaneFocusRequests");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_cinematicVideoMovieRecordingStats.countOfTapToTrackFailures), @"cinematicVideoCountOfTapToTrackFailures");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_cinematicVideoMovieRecordingStats.countOfFixedTaxonomyFocusDecisions), @"cinematicVideoCountOfFixedTaxonomyFocusDecisions");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_cinematicVideoMovieRecordingStats.countOfNonTaxonomyFocusDecisions), @"cinematicVideoCountOfNonTaxonomyFocusDecisions");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_cinematicVideoMovieRecordingStats.countOfCustomFocusDecisions), @"cinematicVideoCountOfCustomFocusDecisions");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_cinematicVideoMovieRecordingStats.countOfAutoFocusDecisions), @"cinematicVideoCountOfAutoFocusDecisions");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_cinematicAudioEnabled), @"cinematicAudioEnabled");
  [v3 setObject:self->_videoCodec forKeyedSubscript:@"videoCodec"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_movieFileSize), @"fileSize");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", (double)self->_movieFileSize * 0.000000953674316), @"fileSizeInMB");
  *(float *)&double v111 = self->_percentageOfAvailableDataStorageAfterWritingMovie;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v111), @"percentageOfAvailableDataStorageAfterWritingMovie");
  int64_t totalNANDReadBytesDuringRecording = self->_totalNANDReadBytesDuringRecording;
  if ((totalNANDReadBytesDuringRecording & 0x8000000000000000) == 0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", (double)totalNANDReadBytesDuringRecording * 0.000000953674316), @"totalNANDReadSizeDuringRecordingInMB");
  }
  int64_t totalNANDWriteBytesDuringRecording = self->_totalNANDWriteBytesDuringRecording;
  if ((totalNANDWriteBytesDuringRecording & 0x8000000000000000) == 0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", (double)(totalNANDWriteBytesDuringRecording - self->_movieFileSize) * 0.000000953674316), @"totalNANDWriteSizeAndFileSizeDifferenceInMB");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_capturingOntoExternalStorageDevice), @"capturingOntoExternalStorageDevice");
  externalStorageDeviceProductName = self->_externalStorageDeviceProductName;
  if (externalStorageDeviceProductName) {
    [v3 setObject:externalStorageDeviceProductName forKeyedSubscript:@"externalStorageDeviceProductName"];
  }
  externalStorageDeviceVendorName = self->_externalStorageDeviceVendorName;
  if (externalStorageDeviceVendorName) {
    [v3 setObject:externalStorageDeviceVendorName forKeyedSubscript:@"externalStorageDeviceVendorName"];
  }
  if (self->_externalStorageDeviceTotalSize) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:"), @"externalStorageDeviceTotalSize");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_externalStorageDeviceBaseOffset), @"externalStorageDeviceBaseOffset");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_colorSpace), @"colorSpace");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_stereoVideoCaptureEnabled), @"stereoVideoCaptureEnabled");
  if (self->_stereoVideoCaptureEnabled) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_stereoVideoCaptureStatus), @"stereoVideoCaptureStatus");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_audioWasPlayingDuringCapture), @"audioWasPlayingDuringCapture");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_audioMixWithOthersEnabled), @"audioMixWithOthersEnabled");
  if (self->_calibrationValidationStatusCmCl != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"calibrationValidationStatusCmCl");
  }
  if (self->_calibrationValidationStatusCmPM != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"calibrationValidationStatusCmPM");
  }
  if (self->_calibrationValidationStatusFCCl != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"calibrationValidationStatusFCCl");
  }
  if (self->_coreRepairStatusRearCameraAssembly != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"coreRepairStatusRearCameraAssembly");
  }
  if (self->_coreRepairStatusFrontCameraAssembly != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"coreRepairStatusFrontCameraAssembly");
  }
  return v3;
}

- (int)activeDeviceMask
{
  return self->_activeDeviceMask;
}

- (void)setActiveDeviceMask:(int)a3
{
  self->_activeDeviceMask = a3;
}

- (int)devicePosition
{
  return self->_devicePosition;
}

- (void)setDevicePosition:(int)a3
{
  self->_devicePosition = a3;
}

- (int)videoOrientation
{
  return self->_videoOrientation;
}

- (void)setVideoOrientation:(int)a3
{
  self->_videoOrientation = a3;
}

- (int)cameraPosture
{
  return self->_cameraPosture;
}

- (void)setCameraPosture:(int)a3
{
  self->_cameraPosture = a3;
}

- (BOOL)videoMirrored
{
  return self->_videoMirrored;
}

- (void)setVideoMirrored:(BOOL)a3
{
  self->_videoMirrored = a3;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int)a3
{
  self->_deviceType = a3;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
}

- (int)numberOfTimesRecordingWasPaused
{
  return self->_numberOfTimesRecordingWasPaused;
}

- (void)setNumberOfTimesRecordingWasPaused:(int)a3
{
  self->_numberOfTimesRecordingWasPaused = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)durationFront
{
  return self->_durationFront;
}

- (void)setDurationFront:(double)a3
{
  self->_durationFront = a3;
}

- (double)durationFrontSuperWide
{
  return self->_durationFrontSuperWide;
}

- (void)setDurationFrontSuperWide:(double)a3
{
  self->_durationFrontSuperWide = a3;
}

- (double)durationRearWide
{
  return self->_durationRearWide;
}

- (void)setDurationRearWide:(double)a3
{
  self->_durationRearWide = a3;
}

- (double)durationRearTele
{
  return self->_durationRearTele;
}

- (void)setDurationRearTele:(double)a3
{
  self->_durationRearTele = a3;
}

- (double)durationRearSuperWide
{
  return self->_durationRearSuperWide;
}

- (void)setDurationRearSuperWide:(double)a3
{
  self->_double durationRearSuperWide = a3;
}

- (float)nominalFramerate
{
  return self->_nominalFramerate;
}

- (void)setNominalFramerate:(float)a3
{
  self->_nominalFramerate = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (float)startingUIZoom
{
  return self->_startingUIZoom;
}

- (void)setStartingUIZoom:(float)a3
{
  self->_startingUIZoom = a3;
}

- (float)minUIZoomDuringVideoRecording
{
  return self->_minUIZoomDuringVideoRecording;
}

- (void)setMinUIZoomDuringVideoRecording:(float)a3
{
  self->_minUIZoomDuringVideoRecording = a3;
}

- (float)maxUIZoomDuringVideoRecording
{
  return self->_maxUIZoomDuringVideoRecording;
}

- (void)setMaxUIZoomDuringVideoRecording:(float)a3
{
  self->_maxUIZoomDuringVideoRecording = a3;
}

- (float)averageSystemPressureLevel
{
  return self->_averageSystemPressureLevel;
}

- (void)setAverageSystemPressureLevel:(float)a3
{
  self->_averageSystemPressureLevel = a3;
}

- (int)maxSystemPressureLevel
{
  return self->_maxSystemPressureLevel;
}

- (void)setMaxSystemPressureLevel:(int)a3
{
  self->_maxSystemPressureLevel = a3;
}

- (int64_t)timeToCriticalSystemPressureInMS
{
  return self->_timeToCriticalSystemPressureInMS;
}

- (void)setTimeToCriticalSystemPressureInMS:(int64_t)a3
{
  self->_timeToCriticalSystemPressureInMS = a3;
}

- (unsigned)systemPressureFactors
{
  return self->_systemPressureFactors;
}

- (void)setSystemPressureFactors:(unsigned int)a3
{
  self->_systemPressureFactors = a3;
}

- (BWCoreAnalyticsMovieRecordingSphereAFStatistics)sphereAFStatistics
{
  return self->_sphereAFStatistics;
}

- (void)setSphereAFStatistics:(BWCoreAnalyticsMovieRecordingSphereAFStatistics *)a3
{
  self->_sphereAFStatistics = a3;
}

- (NSDictionary)cameraSwitchStatistics
{
  return self->_cameraSwitchStatistics;
}

- (void)setCameraSwitchStatistics:(id)a3
{
}

- (NSDictionary)sphereModeByPortType
{
  return self->_sphereModeByPortType;
}

- (void)setSphereModeByPortType:(id)a3
{
}

- (NSDictionary)APSModeByPortType
{
  return self->_APSModeByPortType;
}

- (void)setAPSModeByPortType:(id)a3
{
}

- (NSDictionary)variableFrameRateStatistics
{
  return self->_variableFrameRateStatistics;
}

- (void)setVariableFrameRateStatistics:(id)a3
{
}

- (BOOL)afDriverShortOccurred
{
  return self->_afDriverShortOccurred;
}

- (void)setAfDriverShortOccurred:(BOOL)a3
{
  self->_afDriverShortOccurred = a3;
}

- (unint64_t)totalNumberOfFramesDropped
{
  return self->_totalNumberOfFramesDropped;
}

- (void)setTotalNumberOfFramesDropped:(unint64_t)a3
{
  self->_totalNumberOfFramesDropped = a3;
}

- (unint64_t)numberOfFramesDroppedDueToFormatWriterQueueFull
{
  return self->_numberOfFramesDroppedDueToFormatWriterQueueFull;
}

- (void)setNumberOfFramesDroppedDueToFormatWriterQueueFull:(unint64_t)a3
{
  self->_numberOfFramesDroppedDueToFormatWriterQueueFull = a3;
}

- (BOOL)hdrVideo
{
  return self->_hdrVideo;
}

- (void)setHdrVideo:(BOOL)a3
{
  self->_hdrVideo = a3;
}

- (BOOL)proresVideo
{
  return self->_proresVideo;
}

- (void)setProresVideo:(BOOL)a3
{
  self->_proresVideo = a3;
}

- (int)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(int)a3
{
  self->_colorSpace = a3;
}

- (BOOL)stereoVideoCaptureEnabled
{
  return self->_stereoVideoCaptureEnabled;
}

- (void)setStereoVideoCaptureEnabled:(BOOL)a3
{
  self->_stereoVideoCaptureEnabled = a3;
}

- (int)stereoVideoCaptureStatus
{
  return self->_stereoVideoCaptureStatus;
}

- (void)setStereoVideoCaptureStatus:(int)a3
{
  self->_stereoVideoCaptureStatus = a3;
}

- (unint64_t)numberOfISPFramesDropped
{
  return self->_numberOfISPFramesDropped;
}

- (void)setNumberOfISPFramesDropped:(unint64_t)a3
{
  self->_numberOfISPFramesDropped = a3;
}

- (unint64_t)numberOfISPFrames
{
  return self->_numberOfISPFrames;
}

- (void)setNumberOfISPFrames:(unint64_t)a3
{
  self->_numberOfISPFrames = a3;
}

- (BWCoreAnalyticsMovieRecordingVideoSTFStatistics)videoSTFStatistics
{
  return self->_videoSTFStatistics;
}

- (void)setVideoSTFStatistics:(BWCoreAnalyticsMovieRecordingVideoSTFStatistics *)a3
{
  self->_videoSTFStatistics = a3;
}

- (BOOL)cinematicVideoEnabled
{
  return self->_cinematicVideoEnabled;
}

- (void)setCinematicVideoEnabled:(BOOL)a3
{
  self->_cinematicVideoEnabled = a3;
}

- (BWCoreAnalyticsMovieRecordingCinematicVideoStatistics)cinematicVideoMovieRecordingStats
{
  long long v3 = *(_OWORD *)&self[8].countOfTapToTrackFailures;
  *(_OWORD *)&retstr->countOfSoftFocusRequests = *(_OWORD *)&self[7].countOfAutoFocusDecisions;
  *(_OWORD *)&retstr->countOfFixedTaxonomyFocusDecisions = v3;
  return self;
}

- (void)setCinematicVideoMovieRecordingStats:(BWCoreAnalyticsMovieRecordingCinematicVideoStatistics *)a3
{
  long long v3 = *(_OWORD *)&a3->countOfSoftFocusRequests;
  *(_OWORD *)&self->_cinematicVideoMovieRecordingStats.countOfFixedTaxonomyFocusDecisions = *(_OWORD *)&a3->countOfFixedTaxonomyFocusDecisions;
  *(_OWORD *)&self->_cinematicVideoMovieRecordingStats.countOfSoftFocusRequests = v3;
}

- (BOOL)cinematicAudioEnabled
{
  return self->_cinematicAudioEnabled;
}

- (void)setCinematicAudioEnabled:(BOOL)a3
{
  self->_cinematicAudioEnabled = a3;
}

- (NSString)videoCodec
{
  return self->_videoCodec;
}

- (void)setVideoCodec:(id)a3
{
}

- (int64_t)movieFileSize
{
  return self->_movieFileSize;
}

- (void)setMovieFileSize:(int64_t)a3
{
  self->_movieFileSize = a3;
}

- (float)percentageOfAvailableDataStorageAfterWritingMovie
{
  return self->_percentageOfAvailableDataStorageAfterWritingMovie;
}

- (void)setPercentageOfAvailableDataStorageAfterWritingMovie:(float)a3
{
  self->_percentageOfAvailableDataStorageAfterWritingMovie = a3;
}

- (int64_t)totalNANDReadBytesDuringRecording
{
  return self->_totalNANDReadBytesDuringRecording;
}

- (void)setTotalNANDReadBytesDuringRecording:(int64_t)a3
{
  self->_int64_t totalNANDReadBytesDuringRecording = a3;
}

- (int64_t)totalNANDWriteBytesDuringRecording
{
  return self->_totalNANDWriteBytesDuringRecording;
}

- (void)setTotalNANDWriteBytesDuringRecording:(int64_t)a3
{
  self->_int64_t totalNANDWriteBytesDuringRecording = a3;
}

- (BOOL)capturingOntoExternalStorageDevice
{
  return self->_capturingOntoExternalStorageDevice;
}

- (void)setCapturingOntoExternalStorageDevice:(BOOL)a3
{
  self->_capturingOntoExternalStorageDevice = a3;
}

- (NSString)externalStorageDeviceVendorName
{
  return self->_externalStorageDeviceVendorName;
}

- (void)setExternalStorageDeviceVendorName:(id)a3
{
}

- (NSString)externalStorageDeviceProductName
{
  return self->_externalStorageDeviceProductName;
}

- (void)setExternalStorageDeviceProductName:(id)a3
{
}

- (unint64_t)externalStorageDeviceTotalSize
{
  return self->_externalStorageDeviceTotalSize;
}

- (void)setExternalStorageDeviceTotalSize:(unint64_t)a3
{
  self->_externalStorageDeviceTotalSize = a3;
}

- (unint64_t)externalStorageDeviceBaseOffset
{
  return self->_externalStorageDeviceBaseOffset;
}

- (void)setExternalStorageDeviceBaseOffset:(unint64_t)a3
{
  self->_externalStorageDeviceBaseOffset = a3;
}

- (BOOL)audioWasPlayingDuringCapture
{
  return self->_audioWasPlayingDuringCapture;
}

- (void)setAudioWasPlayingDuringCapture:(BOOL)a3
{
  self->_audioWasPlayingDuringCapture = a3;
}

- (BOOL)audioMixWithOthersEnabled
{
  return self->_audioMixWithOthersEnabled;
}

- (void)setAudioMixWithOthersEnabled:(BOOL)a3
{
  self->_audioMixWithOthersEnabled = a3;
}

- (int)calibrationValidationStatusCmCl
{
  return self->_calibrationValidationStatusCmCl;
}

- (void)setCalibrationValidationStatusCmCl:(int)a3
{
  self->_calibrationValidationStatusCmCl = a3;
}

- (int)calibrationValidationStatusCmPM
{
  return self->_calibrationValidationStatusCmPM;
}

- (void)setCalibrationValidationStatusCmPM:(int)a3
{
  self->_calibrationValidationStatusCmPM = a3;
}

- (int)calibrationValidationStatusFCCl
{
  return self->_calibrationValidationStatusFCCl;
}

- (void)setCalibrationValidationStatusFCCl:(int)a3
{
  self->_calibrationValidationStatusFCCl = a3;
}

- (int)coreRepairStatusRearCameraAssembly
{
  return self->_coreRepairStatusRearCameraAssembly;
}

- (void)setCoreRepairStatusRearCameraAssembly:(int)a3
{
  self->_coreRepairStatusRearCameraAssembly = a3;
}

- (int)coreRepairStatusFrontCameraAssembly
{
  return self->_coreRepairStatusFrontCameraAssembly;
}

- (void)setCoreRepairStatusFrontCameraAssembly:(int)a3
{
  self->_coreRepairStatusFrontCameraAssembly = a3;
}

@end