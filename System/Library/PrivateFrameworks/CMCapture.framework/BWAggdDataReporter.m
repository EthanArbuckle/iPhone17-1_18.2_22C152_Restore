@interface BWAggdDataReporter
+ (id)sharedInstance;
+ (void)initialize;
- (BWAggdDataReporter)init;
- (__CFString)_captureTypeStringWithPrimaryCaptureType:(unsigned int)a3 secondaryCaptureType:(int)a4 captureFlags:(char)a5 sceneFlags:;
- (id)_aggdCameraStreamingTimeStringFromDeviceType:(int)a3 devicePosition:(int)a4;
- (id)_aggdGNRProcessingStatusStringFromProcessingStatus:(int)a3;
- (id)_aggdPearlInfraredProjectorUptimeStringFromCurrent:(int)a3 pattern:(int)a4 applicationID:(id)a5;
- (id)_aggdSDOFProcessingStatusStringFromProcessingStatus:(int)a3;
- (id)_aggdStereoFusionProcessingStatusStringFromProcessingStatus:(int)a3;
- (id)_aggdStereoFusionProcessingTypeStringForCaptureType:(int)a3 isStereoFusionCapture:(BOOL)a4 wideSubCaptureType:(int)a5 teleSubCaptureType:(int)a6 isOriginalImage:(BOOL)a7;
- (id)_aggdStringForPrefix:(id)a3 primaryCaptureType:(int)a4 secondaryCaptureType:(int)a5 captureFlags:(unint64_t)a6 sceneFlags:(unint64_t)a7 stillDuringVideo:(BOOL)a8 frontCamera:(BOOL)a9;
- (int)lastShutterLag;
- (void)dealloc;
- (void)reportAPSOffsetEstimatorForPortType:(id)a3 accelMotion:(float)a4 gyroMotion:(float)a5 inSessionOffset:(float)a6 deltaOffsetFC:(float)a7 deltaOffsetMI:(float)a8 deltaOffsetFATP:(float)a9 deltaOffsetLastSession:(float)a10 errorHeadroomViolated:(BOOL)a11 errorConvergenceFailed:(BOOL)a12 errorMotionTooLarge:(BOOL)a13 errorConfidenceTooLow:(BOOL)a14 errorOffsetTooLarge:(BOOL)a15 errorDeltaTooLarge:(BOOL)a16 errorSaturated:(BOOL)a17 errorCouldNotRun:(BOOL)a18 successRun:(BOOL)a19 startAPSVoltage:(int)a20 modeGCOL:(BOOL)a21 modeOL:(BOOL)a22;
- (void)reportAPSSphereInteractionCalibrationForPosition:(int)a3 residualErrorNeutral:(float)a4 calibrationZHeightNeutral:(float)a5 residualErrorMacro:(float)a6 calibrationZHeightMacro:(float)a7 calibrationStatus:(unsigned int)a8 isValid:(BOOL)a9;
- (void)reportAutoFocusCalibrationForPosition:(int)a3 freqZ:(int)a4 deltaFreqZ:(int)a5 qZ:(int)a6 deltaQZ:(int)a7 gainZ:(int)a8 calibrationStatus:(unsigned int)a9 gelModelCoefficientD1:(int *)a10 gelModelCoefficientD2:(int *)a11 gelModelCoefficientP1:(int *)a12 gelModelCoefficientP2:(int *)a13 isValid:(BOOL)a14;
- (void)reportAutoFocusPositionSensorCalibrationForPosition:(int)a3 iStopZEstimate:(int)a4 eSensorOutput:(signed __int16)a5 wSensorOutput:(signed __int16)a6 gravityZ:(int)a7 calibrationStatus:(unsigned int)a8 sensorTemp:(signed __int16)a9 successfulInfinityEndStopDelta:(int)a10 currentInfinityEndStopDelta:(int)a11 previousInfinityEndStopDelta:(int)a12 currentAngleDelta:(int)a13 previousAngleDelta:(int)a14 factoryCalibrationOffset:(int *)a15 estimatedNeutralZ:(int *)a16 deltaNeutralZFromNVM:(int *)a17 estimatedSagZ:(int *)a18 combinedSensorOutput:(int *)a19 deltaSagFromNVM:(int *)a20 isValid:(BOOL)a21 dataWasRejectedByHistory:(BOOL)a22;
- (void)reportAutoFocusPositionSensorMode:(int)a3 portType:(id)a4;
- (void)reportCalibrationStatisticsWithTime:(id)a3 timeValue:(double)a4 attemptsField:(id)a5 attemptsValue:(int64_t)a6 successField:(id)a7 successValue:(int64_t)a8 magneticFieldMagnitudeField:(id)a9 magneticFieldMagnitudeValue:(double)a10;
- (void)reportCameraAppCaptureForNonCameraAppLoggingWithFrontCamera:(BOOL)a3;
- (void)reportCameraLaunchWithPrewarm:(int)a3 reason:(id)a4;
- (void)reportCameraLaunchWithoutPrewarm:(int)a3;
- (void)reportCameraStreamingTimeInMilliseconds:(unint64_t)a3 deviceType:(int)a4 devicePosition:(int)a5;
- (void)reportCriticalFocusErrorOccurredForPortType:(id)a3;
- (void)reportFaceCount:(unsigned int)a3 frontCamera:(BOOL)a4;
- (void)reportGNRSampleBufferProcessorProcessingStatus:(int)a3;
- (void)reportISPCreateDuration:(int)a3;
- (void)reportLockScreenCameraLaunchCancelledWithPrewarming:(BOOL)a3 ispStreamingStarted:(BOOL)a4;
- (void)reportLockScreenCameraLaunchCompletedWithPrewarming:(BOOL)a3 restartedSessionDueToError:(int)a4;
- (void)reportLuxLevel:(unsigned int)a3 primaryCaptureType:(int)a4 secondaryCaptureType:(int)a5 captureFlags:(unint64_t)a6 sceneFlags:(unint64_t)a7 stillDuringVideo:(BOOL)a8 frontCamera:(BOOL)a9;
- (void)reportNonCameraAppCaptureWithPrimaryCaptureType:(int)a3 secondaryCaptureType:(int)a4 captureFlags:(unint64_t)a5 sceneFlags:(unint64_t)a6 stillDuringVideo:(BOOL)a7 frontCamera:(BOOL)a8;
- (void)reportPearlInfraredProjectorUptime:(unint64_t)a3 current:(int)a4 pattern:(int)a5 applicationID:(id)a6;
- (void)reportSDOFSampleBufferProcessorProcessingStatus:(int)a3;
- (void)reportSensorTemperature:(unsigned int)a3 frontCamera:(BOOL)a4;
- (void)reportShutterLag:(id *)a3 primaryCaptureType:(int)a4 secondaryCaptureType:(int)a5 captureFlags:(unint64_t)a6 sceneFlags:(unint64_t)a7 stillDuringVideo:(BOOL)a8 frontCamera:(BOOL)a9;
- (void)reportSphereCalibrationForPosition:(int)a3 freqX:(float)a4 deltaFreqX:(float)a5 qX:(float)a6 deltaQX:(float)a7 gainX:(float)a8 freqY:(float)a9 deltaFreqY:(float)a10 qY:(float)a11 deltaQY:(float)a12 gainY:(float)a13 calibrationStatus:(unsigned int)a14 isValid:(BOOL)a15;
- (void)reportSphereEndStopCalibrationForPosition:(int)a3 oisPositiveX:(int)a4 oisNegativeX:(int)a5 oisPositiveY:(int)a6 oisNegativeY:(int)a7 maxPositiveXDriftFromNVM:(int)a8 maxNegativeXDriftFromNVM:(int)a9 maxPositiveYDriftFromNVM:(int)a10 maxNegativeYDriftFromNVM:(int)a11 sphereStrokeX:(int)a12 sphereStrokeY:(int)a13 calibrationStatus:(unsigned int)a14 isValid:(BOOL)a15;
- (void)reportSphereJitterDetectionsForPortType:(id)a3 detectionAttemps:(int)a4 successfulDetections:(int)a5;
- (void)reportStereoFusionProcessingTypeForCaptureType:(int)a3 isStereoFusionCapture:(BOOL)a4 wideSubCaptureType:(int)a5 teleSubCaptureType:(int)a6 isOriginalImage:(BOOL)a7;
- (void)reportStereoFusionSampleBufferProcessorProcessingStatus:(int)a3;
- (void)reportStillImageAPSStatisticsForPortType:(id)a3 logicalFocusPosition:(int)a4 apsMotion:(float)a5 sphereMotion:(float)a6 accelMotion:(float)a7 gyroMotion:(float)a8 subjectDistance:(float)a9 luxLevel:(int)a10;
- (void)reportVideoRecordingAPSStatistics:(float)a3 stdDataFromAPSForTele:(float)a4 stdDataFromSphereForWide:(float)a5 stdDataFromSphereForTele:(float)a6 stdDataFromAccel:(float)a7 stdDataFromGyro:(float)a8 maxDataFromAPSForWide:(float)a9 maxDataFromAPSForTele:(float)a10 minDataFromAPSForWide:(float)a11 minDataFromAPSForTele:(float)a12 maxDataFromSphereForWide:(float)a13 maxDataFromSphereForTele:(float)a14 minDataFromSphereForWide:(float)a15 minDataFromSphereForTele:(float)a16 maxDataFromAccel:(float)a17 minDataFromAccel:(float)a18 maxDataFromGyro:(float)a19 minDataFromGyro:(float)a20;
- (void)reportZeroShutterLagFirmwareTimeMachineInitFailure;
- (void)reportZeroShutterLagInitSuccess;
- (void)reportZeroShutterLagMetadataInitFailureWithReasons:(unsigned int)a3;
- (void)reportZeroShutterLagPreviewTimeMachineInitFailure;
- (void)reportZeroShutterLagReferenceFrameSelectionFailureForCaptureType:(int)a3;
- (void)reportZeroShutterLagSphereInitFailure;
- (void)reportZeroShutterLagSuccess;
- (void)reportZoomFactor:(float)a3 primaryCaptureType:(int)a4 secondaryCaptureType:(int)a5 captureFlags:(unint64_t)a6 sceneFlags:(unint64_t)a7 stillDuringVideo:(BOOL)a8 frontCamera:(BOOL)a9;
@end

@implementation BWAggdDataReporter

- (void)reportISPCreateDuration:(int)a3
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__BWAggdDataReporter_reportISPCreateDuration___block_invoke;
  v4[3] = &unk_1E5C262A0;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(aggdDispatchQueue, v4);
}

uint64_t __46__BWAggdDataReporter_reportISPCreateDuration___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return ADClientPushValueForDistributionKey();
  }
  return result;
}

uint64_t __59__BWAggdDataReporter_reportCameraLaunchWithPrewarm_reason___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40)) {
    v2 = *(__CFString **)(a1 + 40);
  }
  else {
    v2 = @"Unspecified";
  }
  uint64_t result = [@"com.apple.coremedia.camera.lt." stringByAppendingString:v2];
  if (v1) {
    BOOL v4 = result == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    return ADClientPushValueForDistributionKey();
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_sOnceToken_0 != -1) {
    dispatch_once(&sharedInstance_sOnceToken_0, &__block_literal_global_59);
  }
  return (id)sharedInstance_sSharedAggdDataCollector;
}

- (void)reportCameraLaunchWithPrewarm:(int)a3 reason:(id)a4
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__BWAggdDataReporter_reportCameraLaunchWithPrewarm_reason___block_invoke;
  block[3] = &unk_1E5C26F78;
  int v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(aggdDispatchQueue, block);
}

+ (void)initialize
{
}

BWAggdDataReporter *__36__BWAggdDataReporter_sharedInstance__block_invoke()
{
  uint64_t result = objc_alloc_init(BWAggdDataReporter);
  sharedInstance_sSharedAggdDataCollector = (uint64_t)result;
  return result;
}

- (BWAggdDataReporter)init
{
  v4.receiver = self;
  v4.super_class = (Class)BWAggdDataReporter;
  v2 = [(BWAggdDataReporter *)&v4 init];
  if (v2) {
    v2->_aggdDispatchQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWAggdDataReporter;
  [(BWAggdDataReporter *)&v3 dealloc];
}

- (void)reportCameraStreamingTimeInMilliseconds:(unint64_t)a3 deviceType:(int)a4 devicePosition:(int)a5
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__BWAggdDataReporter_reportCameraStreamingTimeInMilliseconds_deviceType_devicePosition___block_invoke;
  block[3] = &unk_1E5C264A0;
  int v7 = a4;
  int v8 = a5;
  block[4] = self;
  block[5] = a3;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __88__BWAggdDataReporter_reportCameraStreamingTimeInMilliseconds_deviceType_devicePosition___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _aggdCameraStreamingTimeStringFromDeviceType:*(unsigned int *)(a1 + 48) devicePosition:*(unsigned int *)(a1 + 52)];
  if (result) {
    BOOL v3 = *(void *)(a1 + 32) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3 && *(void *)(a1 + 40) != *(void *)(a1 + 40) % 0x64uLL)
  {
    return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportPearlInfraredProjectorUptime:(unint64_t)a3 current:(int)a4 pattern:(int)a5 applicationID:(id)a6
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__BWAggdDataReporter_reportPearlInfraredProjectorUptime_current_pattern_applicationID___block_invoke;
  v7[3] = &unk_1E5C27F38;
  int v8 = a4;
  int v9 = a5;
  v7[4] = self;
  v7[5] = a6;
  v7[6] = a3;
  dispatch_async(aggdDispatchQueue, v7);
}

uint64_t __87__BWAggdDataReporter_reportPearlInfraredProjectorUptime_current_pattern_applicationID___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _aggdPearlInfraredProjectorUptimeStringFromCurrent:*(unsigned int *)(a1 + 56) pattern:*(unsigned int *)(a1 + 60) applicationID:*(void *)(a1 + 40)];
  if (result) {
    BOOL v3 = *(void *)(a1 + 32) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3 && *(void *)(a1 + 48) != 0)
  {
    return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportGNRSampleBufferProcessorProcessingStatus:(int)a3
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__BWAggdDataReporter_reportGNRSampleBufferProcessorProcessingStatus___block_invoke;
  v4[3] = &unk_1E5C262A0;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(aggdDispatchQueue, v4);
}

uint64_t __69__BWAggdDataReporter_reportGNRSampleBufferProcessorProcessingStatus___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _aggdGNRProcessingStatusStringFromProcessingStatus:*(unsigned int *)(a1 + 40)];
  if (result) {
    BOOL v3 = *(void *)(a1 + 32) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportStereoFusionProcessingTypeForCaptureType:(int)a3 isStereoFusionCapture:(BOOL)a4 wideSubCaptureType:(int)a5 teleSubCaptureType:(int)a6 isOriginalImage:(BOOL)a7
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __145__BWAggdDataReporter_reportStereoFusionProcessingTypeForCaptureType_isStereoFusionCapture_wideSubCaptureType_teleSubCaptureType_isOriginalImage___block_invoke;
  block[3] = &unk_1E5C27F60;
  block[4] = self;
  BOOL v12 = a4;
  int v9 = a3;
  int v10 = a5;
  int v11 = a6;
  BOOL v13 = a7;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __145__BWAggdDataReporter_reportStereoFusionProcessingTypeForCaptureType_isStereoFusionCapture_wideSubCaptureType_teleSubCaptureType_isOriginalImage___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _aggdStereoFusionProcessingTypeStringForCaptureType:*(unsigned int *)(a1 + 40) isStereoFusionCapture:*(unsigned __int8 *)(a1 + 52) wideSubCaptureType:*(unsigned int *)(a1 + 44) teleSubCaptureType:*(unsigned int *)(a1 + 48) isOriginalImage:*(unsigned __int8 *)(a1 + 53)];
  if (result) {
    BOOL v3 = *(void *)(a1 + 32) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportStereoFusionSampleBufferProcessorProcessingStatus:(int)a3
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__BWAggdDataReporter_reportStereoFusionSampleBufferProcessorProcessingStatus___block_invoke;
  v4[3] = &unk_1E5C262A0;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(aggdDispatchQueue, v4);
}

uint64_t __78__BWAggdDataReporter_reportStereoFusionSampleBufferProcessorProcessingStatus___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _aggdStereoFusionProcessingStatusStringFromProcessingStatus:*(unsigned int *)(a1 + 40)];
  if (result) {
    BOOL v3 = *(void *)(a1 + 32) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportSDOFSampleBufferProcessorProcessingStatus:(int)a3
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__BWAggdDataReporter_reportSDOFSampleBufferProcessorProcessingStatus___block_invoke;
  v4[3] = &unk_1E5C262A0;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(aggdDispatchQueue, v4);
}

uint64_t __70__BWAggdDataReporter_reportSDOFSampleBufferProcessorProcessingStatus___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _aggdSDOFProcessingStatusStringFromProcessingStatus:*(unsigned int *)(a1 + 40)];
  if (result) {
    BOOL v3 = *(void *)(a1 + 32) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportLuxLevel:(unsigned int)a3 primaryCaptureType:(int)a4 secondaryCaptureType:(int)a5 captureFlags:(unint64_t)a6 sceneFlags:(unint64_t)a7 stillDuringVideo:(BOOL)a8 frontCamera:(BOOL)a9
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __130__BWAggdDataReporter_reportLuxLevel_primaryCaptureType_secondaryCaptureType_captureFlags_sceneFlags_stillDuringVideo_frontCamera___block_invoke;
  block[3] = &unk_1E5C27F88;
  int v11 = a4;
  int v12 = a5;
  block[4] = self;
  void block[5] = a6;
  void block[6] = a7;
  BOOL v14 = a8;
  BOOL v15 = a9;
  unsigned int v13 = a3;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __130__BWAggdDataReporter_reportLuxLevel_primaryCaptureType_secondaryCaptureType_captureFlags_sceneFlags_stillDuringVideo_frontCamera___block_invoke(uint64_t a1)
{
  LOBYTE(v4) = *(unsigned char *)(a1 + 69);
  uint64_t result = [*(id *)(a1 + 32) _aggdStringForPrefix:@"lux" primaryCaptureType:*(unsigned int *)(a1 + 56) secondaryCaptureType:*(unsigned int *)(a1 + 60) captureFlags:*(void *)(a1 + 40) sceneFlags:*(void *)(a1 + 48) stillDuringVideo:*(unsigned __int8 *)(a1 + 68) frontCamera:v4];
  if (result) {
    BOOL v3 = *(void *)(a1 + 32) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    return ADClientPushValueForDistributionKey();
  }
  return result;
}

- (void)reportZoomFactor:(float)a3 primaryCaptureType:(int)a4 secondaryCaptureType:(int)a5 captureFlags:(unint64_t)a6 sceneFlags:(unint64_t)a7 stillDuringVideo:(BOOL)a8 frontCamera:(BOOL)a9
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __132__BWAggdDataReporter_reportZoomFactor_primaryCaptureType_secondaryCaptureType_captureFlags_sceneFlags_stillDuringVideo_frontCamera___block_invoke;
  block[3] = &unk_1E5C27F88;
  int v11 = a4;
  int v12 = a5;
  block[4] = self;
  void block[5] = a6;
  void block[6] = a7;
  BOOL v14 = a8;
  BOOL v15 = a9;
  float v13 = a3;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __132__BWAggdDataReporter_reportZoomFactor_primaryCaptureType_secondaryCaptureType_captureFlags_sceneFlags_stillDuringVideo_frontCamera___block_invoke(uint64_t a1)
{
  LOBYTE(v4) = *(unsigned char *)(a1 + 69);
  uint64_t result = [*(id *)(a1 + 32) _aggdStringForPrefix:@"zoom" primaryCaptureType:*(unsigned int *)(a1 + 56) secondaryCaptureType:*(unsigned int *)(a1 + 60) captureFlags:*(void *)(a1 + 40) sceneFlags:*(void *)(a1 + 48) stillDuringVideo:*(unsigned __int8 *)(a1 + 68) frontCamera:v4];
  if (result) {
    BOOL v3 = *(void *)(a1 + 32) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    return ADClientPushValueForDistributionKey();
  }
  return result;
}

- (void)reportNonCameraAppCaptureWithPrimaryCaptureType:(int)a3 secondaryCaptureType:(int)a4 captureFlags:(unint64_t)a5 sceneFlags:(unint64_t)a6 stillDuringVideo:(BOOL)a7 frontCamera:(BOOL)a8
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __144__BWAggdDataReporter_reportNonCameraAppCaptureWithPrimaryCaptureType_secondaryCaptureType_captureFlags_sceneFlags_stillDuringVideo_frontCamera___block_invoke;
  block[3] = &unk_1E5C27FB0;
  int v10 = a3;
  int v11 = a4;
  block[4] = self;
  void block[5] = a5;
  void block[6] = a6;
  BOOL v12 = a7;
  BOOL v13 = a8;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __144__BWAggdDataReporter_reportNonCameraAppCaptureWithPrimaryCaptureType_secondaryCaptureType_captureFlags_sceneFlags_stillDuringVideo_frontCamera___block_invoke(uint64_t a1)
{
  LOBYTE(v4) = *(unsigned char *)(a1 + 65);
  uint64_t result = [*(id *)(a1 + 32) _aggdStringForPrefix:@"nca" primaryCaptureType:*(unsigned int *)(a1 + 56) secondaryCaptureType:*(unsigned int *)(a1 + 60) captureFlags:*(void *)(a1 + 40) sceneFlags:*(void *)(a1 + 48) stillDuringVideo:*(unsigned __int8 *)(a1 + 64) frontCamera:v4];
  if (result) {
    BOOL v3 = *(void *)(a1 + 32) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportCameraAppCaptureForNonCameraAppLoggingWithFrontCamera:(BOOL)a3
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __82__BWAggdDataReporter_reportCameraAppCaptureForNonCameraAppLoggingWithFrontCamera___block_invoke;
  v4[3] = &unk_1E5C24B78;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(aggdDispatchQueue, v4);
}

uint64_t __82__BWAggdDataReporter_reportCameraAppCaptureForNonCameraAppLoggingWithFrontCamera___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportFaceCount:(unsigned int)a3 frontCamera:(BOOL)a4
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__BWAggdDataReporter_reportFaceCount_frontCamera___block_invoke;
  v5[3] = &unk_1E5C27FD8;
  BOOL v7 = a4;
  v5[4] = self;
  unsigned int v6 = a3;
  dispatch_async(aggdDispatchQueue, v5);
}

uint64_t __50__BWAggdDataReporter_reportFaceCount_frontCamera___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 44))
  {
    if (*(void *)(result + 32)) {
      return ADClientPushValueForDistributionKey();
    }
  }
  return result;
}

- (void)reportSensorTemperature:(unsigned int)a3 frontCamera:(BOOL)a4
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__BWAggdDataReporter_reportSensorTemperature_frontCamera___block_invoke;
  v5[3] = &unk_1E5C27FD8;
  BOOL v7 = a4;
  v5[4] = self;
  unsigned int v6 = a3;
  dispatch_async(aggdDispatchQueue, v5);
}

uint64_t __58__BWAggdDataReporter_reportSensorTemperature_frontCamera___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 44))
  {
    if (*(void *)(result + 32)) {
      return ADClientPushValueForDistributionKey();
    }
  }
  return result;
}

- (void)reportShutterLag:(id *)a3 primaryCaptureType:(int)a4 secondaryCaptureType:(int)a5 captureFlags:(unint64_t)a6 sceneFlags:(unint64_t)a7 stillDuringVideo:(BOOL)a8 frontCamera:(BOOL)a9
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __132__BWAggdDataReporter_reportShutterLag_primaryCaptureType_secondaryCaptureType_captureFlags_sceneFlags_stillDuringVideo_frontCamera___block_invoke;
  v10[3] = &unk_1E5C28000;
  int v11 = a4;
  int v12 = a5;
  v10[4] = self;
  v10[5] = a6;
  v10[6] = a7;
  BOOL v14 = a8;
  BOOL v15 = a9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a3;
  dispatch_async(aggdDispatchQueue, v10);
}

void __132__BWAggdDataReporter_reportShutterLag_primaryCaptureType_secondaryCaptureType_captureFlags_sceneFlags_stillDuringVideo_frontCamera___block_invoke(uint64_t a1)
{
  LOBYTE(v6) = *(unsigned char *)(a1 + 89);
  uint64_t v2 = [*(id *)(a1 + 32) _aggdStringForPrefix:@"shutterlag" primaryCaptureType:*(unsigned int *)(a1 + 56) secondaryCaptureType:*(unsigned int *)(a1 + 60) captureFlags:*(void *)(a1 + 40) sceneFlags:*(void *)(a1 + 48) stillDuringVideo:*(unsigned __int8 *)(a1 + 88) frontCamera:v6];
  CMTime time = *(CMTime *)(a1 + 64);
  Float64 Seconds = CMTimeGetSeconds(&time);
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(_DWORD *)(v4 + 16);
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v4 + 16), (unsigned int *)&v5, (int)(Seconds * 1000.0), memory_order_relaxed, memory_order_relaxed);
  if (v2)
  {
    if (*(void *)(a1 + 32)) {
      ADClientPushValueForDistributionKey();
    }
  }
}

- (int)lastShutterLag
{
  return self->_lastShutterLag;
}

- (void)reportZeroShutterLagFirmwareTimeMachineInitFailure
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__BWAggdDataReporter_reportZeroShutterLagFirmwareTimeMachineInitFailure__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __72__BWAggdDataReporter_reportZeroShutterLagFirmwareTimeMachineInitFailure__block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    uint64_t result = ADClientAddValueForScalarKey();
    if (*(void *)(v1 + 32))
    {
      return ADClientAddValueForScalarKey();
    }
  }
  return result;
}

- (void)reportZeroShutterLagPreviewTimeMachineInitFailure
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__BWAggdDataReporter_reportZeroShutterLagPreviewTimeMachineInitFailure__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __71__BWAggdDataReporter_reportZeroShutterLagPreviewTimeMachineInitFailure__block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    uint64_t result = ADClientAddValueForScalarKey();
    if (*(void *)(v1 + 32))
    {
      return ADClientAddValueForScalarKey();
    }
  }
  return result;
}

- (void)reportZeroShutterLagSphereInitFailure
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__BWAggdDataReporter_reportZeroShutterLagSphereInitFailure__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __59__BWAggdDataReporter_reportZeroShutterLagSphereInitFailure__block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    uint64_t result = ADClientAddValueForScalarKey();
    if (*(void *)(v1 + 32))
    {
      return ADClientAddValueForScalarKey();
    }
  }
  return result;
}

- (void)reportZeroShutterLagMetadataInitFailureWithReasons:(unsigned int)a3
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__BWAggdDataReporter_reportZeroShutterLagMetadataInitFailureWithReasons___block_invoke;
  v4[3] = &unk_1E5C262A0;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(aggdDispatchQueue, v4);
}

uint64_t __73__BWAggdDataReporter_reportZeroShutterLagMetadataInitFailureWithReasons___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(void *)(result + 32))
  {
    uint64_t result = ADClientAddValueForScalarKey();
    if (*(void *)(v1 + 32)) {
      uint64_t result = ADClientAddValueForScalarKey();
    }
  }
  int v2 = *(_DWORD *)(v1 + 40);
  if (!v2) {
    return result;
  }
  if ((v2 & 1) != 0 && *(void *)(v1 + 32))
  {
    uint64_t result = ADClientAddValueForScalarKey();
    int v2 = *(_DWORD *)(v1 + 40);
    if ((v2 & 2) == 0) {
      goto LABEL_11;
    }
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_11;
  }
  if (*(void *)(v1 + 32))
  {
    uint64_t result = ADClientAddValueForScalarKey();
    int v2 = *(_DWORD *)(v1 + 40);
  }
LABEL_11:
  if ((v2 & 4) != 0 && *(void *)(v1 + 32))
  {
    uint64_t result = ADClientAddValueForScalarKey();
    int v2 = *(_DWORD *)(v1 + 40);
    if ((v2 & 8) != 0)
    {
LABEL_14:
      if (*(void *)(v1 + 32))
      {
        uint64_t result = ADClientAddValueForScalarKey();
        int v2 = *(_DWORD *)(v1 + 40);
      }
    }
  }
  else if ((v2 & 8) != 0)
  {
    goto LABEL_14;
  }
  if ((v2 & 0x10) != 0 && *(void *)(v1 + 32))
  {
    uint64_t result = ADClientAddValueForScalarKey();
    if ((*(_DWORD *)(v1 + 40) & 0x20) == 0) {
      return result;
    }
  }
  else if ((v2 & 0x20) == 0)
  {
    return result;
  }
  if (*(void *)(v1 + 32))
  {
    return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportZeroShutterLagInitSuccess
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__BWAggdDataReporter_reportZeroShutterLagInitSuccess__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __53__BWAggdDataReporter_reportZeroShutterLagInitSuccess__block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportZeroShutterLagReferenceFrameSelectionFailureForCaptureType:(int)a3
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87__BWAggdDataReporter_reportZeroShutterLagReferenceFrameSelectionFailureForCaptureType___block_invoke;
  v4[3] = &unk_1E5C262A0;
  int v5 = a3;
  v4[4] = self;
  dispatch_async(aggdDispatchQueue, v4);
}

uint64_t __87__BWAggdDataReporter_reportZeroShutterLagReferenceFrameSelectionFailureForCaptureType___block_invoke(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 40);
  if (v1 == 5)
  {
    if (!*(void *)(result + 32)) {
      return result;
    }
    return ADClientAddValueForScalarKey();
  }
  if (v1 == 4)
  {
    if (!*(void *)(result + 32)) {
      return result;
    }
    return ADClientAddValueForScalarKey();
  }
  if (v1 == 1 && *(void *)(result + 32)) {
    return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportZeroShutterLagSuccess
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__BWAggdDataReporter_reportZeroShutterLagSuccess__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __49__BWAggdDataReporter_reportZeroShutterLagSuccess__block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportCameraLaunchWithoutPrewarm:(int)a3
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__BWAggdDataReporter_reportCameraLaunchWithoutPrewarm___block_invoke;
  v4[3] = &unk_1E5C262A0;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(aggdDispatchQueue, v4);
}

uint64_t __55__BWAggdDataReporter_reportCameraLaunchWithoutPrewarm___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return ADClientPushValueForDistributionKey();
  }
  return result;
}

- (void)reportLockScreenCameraLaunchCompletedWithPrewarming:(BOOL)a3 restartedSessionDueToError:(int)a4
{
  int v5 = @"unknown";
  if (a4 == 1) {
    int v5 = @"cameraInUseByOtherClient";
  }
  if (!a4) {
    int v5 = @"none";
  }
  uint64_t v6 = @"nonPrewarmed";
  if (a3) {
    uint64_t v6 = @"prewarmed";
  }
  uint64_t v7 = [NSString stringWithFormat:@"com.apple.coremedia.lockscreen.camera.launch.completed.%@.restartError.%@", v6, v5];
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__BWAggdDataReporter_reportLockScreenCameraLaunchCompletedWithPrewarming_restartedSessionDueToError___block_invoke;
  block[3] = &unk_1E5C24458;
  block[4] = self;
  void block[5] = v7;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __101__BWAggdDataReporter_reportLockScreenCameraLaunchCompletedWithPrewarming_restartedSessionDueToError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(a1 + 40);
  if (v2) {
    BOOL v3 = result == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3) {
    return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportLockScreenCameraLaunchCancelledWithPrewarming:(BOOL)a3 ispStreamingStarted:(BOOL)a4
{
  int v5 = @"nonPrewarmed";
  if (a3) {
    int v5 = @"prewarmed";
  }
  uint64_t v6 = @"ispStreamingNotStarted";
  if (a4) {
    uint64_t v6 = @"ispStreamingStarted";
  }
  uint64_t v7 = [NSString stringWithFormat:@"com.apple.coremedia.lockscreen.camera.launch.cancelled.%@.%@", v5, v6];
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__BWAggdDataReporter_reportLockScreenCameraLaunchCancelledWithPrewarming_ispStreamingStarted___block_invoke;
  block[3] = &unk_1E5C24458;
  block[4] = self;
  void block[5] = v7;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __94__BWAggdDataReporter_reportLockScreenCameraLaunchCancelledWithPrewarming_ispStreamingStarted___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(a1 + 40);
  if (v2) {
    BOOL v3 = result == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3) {
    return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportCalibrationStatisticsWithTime:(id)a3 timeValue:(double)a4 attemptsField:(id)a5 attemptsValue:(int64_t)a6 successField:(id)a7 successValue:(int64_t)a8 magneticFieldMagnitudeField:(id)a9 magneticFieldMagnitudeValue:(double)a10
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __178__BWAggdDataReporter_reportCalibrationStatisticsWithTime_timeValue_attemptsField_attemptsValue_successField_successValue_magneticFieldMagnitudeField_magneticFieldMagnitudeValue___block_invoke;
  block[3] = &unk_1E5C28028;
  block[4] = self;
  void block[5] = a3;
  *(double *)&block[9] = a4;
  void block[6] = a5;
  void block[7] = a7;
  block[10] = a6;
  block[11] = a8;
  block[8] = a9;
  *(double *)&block[12] = a10;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __178__BWAggdDataReporter_reportCalibrationStatisticsWithTime_timeValue_attemptsField_attemptsValue_successField_successValue_magneticFieldMagnitudeField_magneticFieldMagnitudeValue___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v3) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    ADClientSetValueForScalarKey();
    uint64_t v3 = *(void *)(a1 + 32);
  }
  if (v3) {
    BOOL v5 = *(void *)(a1 + 48) == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5 && *(void *)(a1 + 80) != 0)
  {
    ADClientAddValueForScalarKey();
    uint64_t v3 = *(void *)(a1 + 32);
  }
  if (v3) {
    BOOL v7 = *(void *)(a1 + 56) == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7 && *(void *)(a1 + 88) != 0) {
    ADClientAddValueForScalarKey();
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result && *(double *)(a1 + 96) > 0.0 && *(void *)(a1 + 32))
  {
    return ADClientSetValueForScalarKey();
  }
  return result;
}

- (void)reportAutoFocusPositionSensorCalibrationForPosition:(int)a3 iStopZEstimate:(int)a4 eSensorOutput:(signed __int16)a5 wSensorOutput:(signed __int16)a6 gravityZ:(int)a7 calibrationStatus:(unsigned int)a8 sensorTemp:(signed __int16)a9 successfulInfinityEndStopDelta:(int)a10 currentInfinityEndStopDelta:(int)a11 previousInfinityEndStopDelta:(int)a12 currentAngleDelta:(int)a13 previousAngleDelta:(int)a14 factoryCalibrationOffset:(int *)a15 estimatedNeutralZ:(int *)a16 deltaNeutralZFromNVM:(int *)a17 estimatedSagZ:(int *)a18 combinedSensorOutput:(int *)a19 deltaSagFromNVM:(int *)a20 isValid:(BOOL)a21 dataWasRejectedByHistory:(BOOL)a22
{
  if (a15) {
    int v22 = *a15;
  }
  else {
    int v22 = 0;
  }
  if (a16) {
    int v23 = *a16;
  }
  else {
    int v23 = 0;
  }
  if (a17) {
    int v24 = *a17;
  }
  else {
    int v24 = 0;
  }
  if (a18)
  {
    int v25 = *a18;
    if (a19)
    {
LABEL_12:
      int v26 = *a19;
      goto LABEL_15;
    }
  }
  else
  {
    int v25 = 0;
    if (a19) {
      goto LABEL_12;
    }
  }
  int v26 = 0;
LABEL_15:
  if (a20) {
    int v27 = *a20;
  }
  else {
    int v27 = 0;
  }
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __428__BWAggdDataReporter_reportAutoFocusPositionSensorCalibrationForPosition_iStopZEstimate_eSensorOutput_wSensorOutput_gravityZ_calibrationStatus_sensorTemp_successfulInfinityEndStopDelta_currentInfinityEndStopDelta_previousInfinityEndStopDelta_currentAngleDelta_previousAngleDelta_factoryCalibrationOffset_estimatedNeutralZ_deltaNeutralZFromNVM_estimatedSagZ_combinedSensorOutput_deltaSagFromNVM_isValid_dataWasRejectedByHistory___block_invoke;
  block[3] = &unk_1E5C28050;
  block[4] = self;
  int v31 = a3;
  unsigned int v32 = a8;
  BOOL v49 = a22;
  BOOL v50 = a21;
  int v33 = a11;
  int v34 = a12;
  int v35 = a13;
  int v36 = a14;
  signed __int16 v46 = a5;
  signed __int16 v47 = a6;
  signed __int16 v48 = a9;
  int v37 = a4;
  int v38 = a10;
  BOOL v51 = a15 != 0;
  int v39 = a7;
  int v40 = v22;
  BOOL v52 = a16 != 0;
  BOOL v53 = a17 != 0;
  int v41 = v23;
  int v42 = v24;
  BOOL v54 = a18 != 0;
  BOOL v55 = a19 != 0;
  int v43 = v25;
  int v44 = v26;
  BOOL v56 = a20 != 0;
  int v45 = v27;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __428__BWAggdDataReporter_reportAutoFocusPositionSensorCalibrationForPosition_iStopZEstimate_eSensorOutput_wSensorOutput_gravityZ_calibrationStatus_sensorTemp_successfulInfinityEndStopDelta_currentInfinityEndStopDelta_previousInfinityEndStopDelta_currentAngleDelta_previousAngleDelta_factoryCalibrationOffset_estimatedNeutralZ_deltaNeutralZFromNVM_estimatedSagZ_combinedSensorOutput_deltaSagFromNVM_isValid_dataWasRejectedByHistory___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.fieldcal.status.%d", *(unsigned int *)(a1 + 40));
  if (v2) {
    BOOL v4 = result == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    uint64_t result = ADClientSetValueForScalarKey();
  }
  if (*(unsigned char *)(a1 + 106) || *(unsigned char *)(a1 + 107))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.fieldcal.istop.deltachangeum.%d", *(unsigned int *)(a1 + 40));
    if (v5 && v6) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.fieldcal.istop.prevdeltachangeum.%d", *(unsigned int *)(a1 + 40));
    if (v7 && result) {
      uint64_t result = ADClientSetValueForScalarKey();
    }
    if (*(void *)(a1 + 32))
    {
      uint64_t result = ADClientSetValueForScalarKey();
      if (*(void *)(a1 + 32)) {
        uint64_t result = ADClientSetValueForScalarKey();
      }
    }
  }
  if (*(unsigned char *)(a1 + 107))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.fieldcal.istop.deltaum.%d", *(unsigned int *)(a1 + 40));
    if (v8 && v9) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.fieldcal.istop.sensor.E.%d", *(unsigned int *)(a1 + 40));
    if (v10 && v11) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.fieldcal.istop.sensor.W.%d", *(unsigned int *)(a1 + 40));
    if (v12 && v13) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.fieldcal.sensorTemp.%d", *(unsigned int *)(a1 + 40));
    if (v14 && v15) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.fieldcal.istop.passingdeltachangeum.%d", *(unsigned int *)(a1 + 40));
    if (v16 && result) {
      uint64_t result = ADClientSetValueForScalarKey();
    }
    if (*(void *)(a1 + 32)) {
      uint64_t result = ADClientSetValueForScalarKey();
    }
    if (*(unsigned char *)(a1 + 108))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.fieldcal.istop.factorydeltaum.%d", *(unsigned int *)(a1 + 40));
      if (v17)
      {
        if (result) {
          uint64_t result = ADClientSetValueForScalarKey();
        }
      }
    }
    if (*(unsigned char *)(a1 + 109))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.fieldcal.sag.neutralEst.s.%d", *(unsigned int *)(a1 + 40));
      if (v18)
      {
        if (result) {
          uint64_t result = ADClientSetValueForScalarKey();
        }
      }
    }
    if (*(unsigned char *)(a1 + 110))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.fieldcal.sag.factorydeltaum.s.%d", *(unsigned int *)(a1 + 40));
      if (v19)
      {
        if (result) {
          uint64_t result = ADClientSetValueForScalarKey();
        }
      }
    }
    if (*(unsigned char *)(a1 + 111))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.fieldcal.sag.estimatePerG.s.%d", *(unsigned int *)(a1 + 40));
      if (v20)
      {
        if (result) {
          uint64_t result = ADClientSetValueForScalarKey();
        }
      }
    }
    if (*(unsigned char *)(a1 + 112))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.fieldcal.istop.fieldsense.%d", *(unsigned int *)(a1 + 40));
      if (v21)
      {
        if (result) {
          uint64_t result = ADClientSetValueForScalarKey();
        }
      }
    }
    if (*(unsigned char *)(a1 + 113))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.fieldcal.sag.factorydeltaSag.s.%d", *(unsigned int *)(a1 + 40));
      if (v22)
      {
        if (result)
        {
          return ADClientSetValueForScalarKey();
        }
      }
    }
  }
  return result;
}

- (void)reportAutoFocusCalibrationForPosition:(int)a3 freqZ:(int)a4 deltaFreqZ:(int)a5 qZ:(int)a6 deltaQZ:(int)a7 gainZ:(int)a8 calibrationStatus:(unsigned int)a9 gelModelCoefficientD1:(int *)a10 gelModelCoefficientD2:(int *)a11 gelModelCoefficientP1:(int *)a12 gelModelCoefficientP2:(int *)a13 isValid:(BOOL)a14
{
  if (a10) {
    int v14 = *a10;
  }
  else {
    int v14 = 0;
  }
  if (a11)
  {
    int v15 = *a11;
    if (a12)
    {
LABEL_6:
      int v16 = *a12;
      goto LABEL_9;
    }
  }
  else
  {
    int v15 = 0;
    if (a12) {
      goto LABEL_6;
    }
  }
  int v16 = 0;
LABEL_9:
  if (a13) {
    int v17 = *a13;
  }
  else {
    int v17 = 0;
  }
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __208__BWAggdDataReporter_reportAutoFocusCalibrationForPosition_freqZ_deltaFreqZ_qZ_deltaQZ_gainZ_calibrationStatus_gelModelCoefficientD1_gelModelCoefficientD2_gelModelCoefficientP1_gelModelCoefficientP2_isValid___block_invoke;
  v19[3] = &unk_1E5C28078;
  v19[4] = self;
  int v20 = a3;
  unsigned int v21 = a9;
  BOOL v31 = a14;
  int v22 = a4;
  int v23 = a5;
  int v24 = a6;
  int v25 = a7;
  BOOL v32 = a10 != 0;
  int v26 = a8;
  int v27 = v14;
  BOOL v33 = a11 != 0;
  BOOL v34 = a12 != 0;
  int v28 = v15;
  int v29 = v16;
  BOOL v35 = a13 != 0;
  int v30 = v17;
  dispatch_async(aggdDispatchQueue, v19);
}

uint64_t __208__BWAggdDataReporter_reportAutoFocusCalibrationForPosition_freqZ_deltaFreqZ_qZ_deltaQZ_gainZ_calibrationStatus_gelModelCoefficientD1_gelModelCoefficientD2_gelModelCoefficientP1_gelModelCoefficientP2_isValid___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.af.fieldcal.status.s.%d", *(unsigned int *)(a1 + 40));
  if (v2) {
    BOOL v4 = result == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    uint64_t result = ADClientSetValueForScalarKey();
  }
  if (*(unsigned char *)(a1 + 84))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.af.fieldcal.Freq.s.%d", *(unsigned int *)(a1 + 40));
    if (v5 && v6) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.af.fieldcal.FreqChange.s.%d", *(unsigned int *)(a1 + 40));
    if (v7 && v8) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.af.fieldcal.Q.s.%d", *(unsigned int *)(a1 + 40));
    if (v9 && v10) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.af.fieldcal.QChange.s.%d", *(unsigned int *)(a1 + 40));
    if (v11 && v12) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.af.fieldcal.LoopGain.s.%d", *(unsigned int *)(a1 + 40));
    if (v13 && result) {
      uint64_t result = ADClientSetValueForScalarKey();
    }
    if (*(unsigned char *)(a1 + 85))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.af.fieldcal.gelModelCoeffD1.s.%d", *(unsigned int *)(a1 + 40));
      if (v14)
      {
        if (result) {
          uint64_t result = ADClientSetValueForScalarKey();
        }
      }
    }
    if (*(unsigned char *)(a1 + 86))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.af.fieldcal.gelModelCoeffD2.s.%d", *(unsigned int *)(a1 + 40));
      if (v15)
      {
        if (result) {
          uint64_t result = ADClientSetValueForScalarKey();
        }
      }
    }
    if (*(unsigned char *)(a1 + 87))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.af.fieldcal.gelModelCoeffP1.s.%d", *(unsigned int *)(a1 + 40));
      if (v16)
      {
        if (result) {
          uint64_t result = ADClientSetValueForScalarKey();
        }
      }
    }
    if (*(unsigned char *)(a1 + 88))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.af.fieldcal.gelModelCoeffP2.s.%d", *(unsigned int *)(a1 + 40));
      if (v17)
      {
        if (result)
        {
          return ADClientSetValueForScalarKey();
        }
      }
    }
  }
  return result;
}

- (void)reportSphereCalibrationForPosition:(int)a3 freqX:(float)a4 deltaFreqX:(float)a5 qX:(float)a6 deltaQX:(float)a7 gainX:(float)a8 freqY:(float)a9 deltaFreqY:(float)a10 qY:(float)a11 deltaQY:(float)a12 gainY:(float)a13 calibrationStatus:(unsigned int)a14 isValid:(BOOL)a15
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __151__BWAggdDataReporter_reportSphereCalibrationForPosition_freqX_deltaFreqX_qX_deltaQX_gainX_freqY_deltaFreqY_qY_deltaQY_gainY_calibrationStatus_isValid___block_invoke;
  v16[3] = &unk_1E5C28078;
  v16[4] = self;
  int v17 = a3;
  unsigned int v18 = a14;
  BOOL v29 = a15;
  float v19 = a4;
  float v20 = a5;
  float v21 = a6;
  float v22 = a7;
  float v23 = a8;
  float v24 = a9;
  float v25 = a10;
  float v26 = a11;
  float v27 = a12;
  float v28 = a13;
  dispatch_async(aggdDispatchQueue, v16);
}

uint64_t __151__BWAggdDataReporter_reportSphereCalibrationForPosition_freqX_deltaFreqX_qX_deltaQX_gainX_freqY_deltaFreqY_qY_deltaQY_gainY_calibrationStatus_isValid___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.fieldcal.status.s.%d", *(unsigned int *)(a1 + 40));
  if (v2) {
    BOOL v4 = result == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    uint64_t result = ADClientSetValueForScalarKey();
  }
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.fieldcal.XFreq.s.%d", *(unsigned int *)(a1 + 40));
    if (v5 && v6) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.fieldcal.XFreqChange.s.%d", *(unsigned int *)(a1 + 40));
    if (v7 && v8) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.fieldcal.XQ.s.%d", *(unsigned int *)(a1 + 40));
    if (v9 && v10) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.fieldcal.XQChange.s.%d", *(unsigned int *)(a1 + 40));
    if (v11 && v12) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.fieldcal.XLoopGain.s.%d", *(unsigned int *)(a1 + 40));
    if (v13 && v14) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.fieldcal.YFreq.s.%d", *(unsigned int *)(a1 + 40));
    if (v15 && v16) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.fieldcal.YFreqChange.s.%d", *(unsigned int *)(a1 + 40));
    if (v17 && v18) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.fieldcal.YQ.s.%d", *(unsigned int *)(a1 + 40));
    if (v19 && v20) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.fieldcal.YQChange.s.%d", *(unsigned int *)(a1 + 40));
    if (v21 && v22) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.fieldcal.YLoopGain.s.%d", *(unsigned int *)(a1 + 40));
    if (v23 && result)
    {
      return ADClientSetValueForScalarKey();
    }
  }
  return result;
}

- (void)reportAPSSphereInteractionCalibrationForPosition:(int)a3 residualErrorNeutral:(float)a4 calibrationZHeightNeutral:(float)a5 residualErrorMacro:(float)a6 calibrationZHeightMacro:(float)a7 calibrationStatus:(unsigned int)a8 isValid:(BOOL)a9
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __187__BWAggdDataReporter_reportAPSSphereInteractionCalibrationForPosition_residualErrorNeutral_calibrationZHeightNeutral_residualErrorMacro_calibrationZHeightMacro_calibrationStatus_isValid___block_invoke;
  block[3] = &unk_1E5C280A0;
  block[4] = self;
  int v11 = a3;
  unsigned int v12 = a8;
  BOOL v17 = a9;
  float v13 = a4;
  float v14 = a5;
  float v15 = a6;
  float v16 = a7;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __187__BWAggdDataReporter_reportAPSSphereInteractionCalibrationForPosition_residualErrorNeutral_calibrationZHeightNeutral_residualErrorMacro_calibrationZHeightMacro_calibrationStatus_isValid___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.sphcal.status.s.%d", *(unsigned int *)(a1 + 40));
  if (v2) {
    BOOL v4 = result == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    uint64_t result = ADClientSetValueForScalarKey();
  }
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.sphcal.sphErrorNeutral.s.%d", *(unsigned int *)(a1 + 40));
    if (v5 && v6) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.sphcal.sphNeutralZ.s.%d", *(unsigned int *)(a1 + 40));
    if (v7 && v8) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.sphcal.sphErrorMacro.s.%d", *(unsigned int *)(a1 + 40));
    if (v9 && v10) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.sphcal.sphMacroZ.s.%d", *(unsigned int *)(a1 + 40));
    if (v11 && result)
    {
      return ADClientSetValueForScalarKey();
    }
  }
  return result;
}

- (void)reportSphereEndStopCalibrationForPosition:(int)a3 oisPositiveX:(int)a4 oisNegativeX:(int)a5 oisPositiveY:(int)a6 oisNegativeY:(int)a7 maxPositiveXDriftFromNVM:(int)a8 maxNegativeXDriftFromNVM:(int)a9 maxPositiveYDriftFromNVM:(int)a10 maxNegativeYDriftFromNVM:(int)a11 sphereStrokeX:(int)a12 sphereStrokeY:(int)a13 calibrationStatus:(unsigned int)a14 isValid:(BOOL)a15
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __270__BWAggdDataReporter_reportSphereEndStopCalibrationForPosition_oisPositiveX_oisNegativeX_oisPositiveY_oisNegativeY_maxPositiveXDriftFromNVM_maxNegativeXDriftFromNVM_maxPositiveYDriftFromNVM_maxNegativeYDriftFromNVM_sphereStrokeX_sphereStrokeY_calibrationStatus_isValid___block_invoke;
  v16[3] = &unk_1E5C28078;
  v16[4] = self;
  int v17 = a3;
  unsigned int v18 = a14;
  BOOL v26 = a15;
  int v19 = a4;
  int v20 = a5;
  int v21 = a6;
  int v22 = a7;
  int v23 = a8;
  long long v24 = *(_OWORD *)&a9;
  int v25 = a13;
  dispatch_async(aggdDispatchQueue, v16);
}

uint64_t __270__BWAggdDataReporter_reportSphereEndStopCalibrationForPosition_oisPositiveX_oisNegativeX_oisPositiveY_oisNegativeY_maxPositiveXDriftFromNVM_maxNegativeXDriftFromNVM_maxPositiveYDriftFromNVM_maxNegativeYDriftFromNVM_sphereStrokeX_sphereStrokeY_calibrationStatus_isValid___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.endstopcal.status.s.%d", *(unsigned int *)(a1 + 40));
  if (v2) {
    BOOL v4 = result == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    uint64_t result = ADClientSetValueForScalarKey();
  }
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.endstopcal.SphXpos.s.%d", *(unsigned int *)(a1 + 40));
    if (v5 && v6) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.endstopcal.SphXneg.s.%d", *(unsigned int *)(a1 + 40));
    if (v7 && v8) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.endstopcal.SphYpos.s.%d", *(unsigned int *)(a1 + 40));
    if (v9 && v10) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.endstopcal.SphYneg.s.%d", *(unsigned int *)(a1 + 40));
    if (v11 && v12) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.endstopcal.SphXposDelta.s.%d", *(unsigned int *)(a1 + 40));
    if (v13 && v14) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.endstopcal.SphXnegDelta.s.%d", *(unsigned int *)(a1 + 40));
    if (v15 && v16) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.endstopcal.SphYposDelta.s.%d", *(unsigned int *)(a1 + 40));
    if (v17 && v18) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.endstopcal.SphYnegDelta.s.%d", *(unsigned int *)(a1 + 40));
    if (v19 && v20) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.endstopcal.SphXStroke.s.%d", *(unsigned int *)(a1 + 40));
    if (v21 && v22) {
      ADClientSetValueForScalarKey();
    }
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.sph.endstopcal.SphYStroke.s.%d", *(unsigned int *)(a1 + 40));
    if (v23 && result)
    {
      return ADClientSetValueForScalarKey();
    }
  }
  return result;
}

- (void)reportAutoFocusPositionSensorMode:(int)a3 portType:(id)a4
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__BWAggdDataReporter_reportAutoFocusPositionSensorMode_portType___block_invoke;
  block[3] = &unk_1E5C26F78;
  block[4] = a4;
  void block[5] = self;
  int v6 = a3;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __65__BWAggdDataReporter_reportAutoFocusPositionSensorMode_portType___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F52DD8]])
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F52DF0]];
    if (!result) {
      return result;
    }
    uint64_t v2 = 2;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.af.apsmode.%d", v2);
  if (v4) {
    BOOL v5 = result == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    return ADClientSetValueForScalarKey();
  }
  return result;
}

- (void)reportAPSOffsetEstimatorForPortType:(id)a3 accelMotion:(float)a4 gyroMotion:(float)a5 inSessionOffset:(float)a6 deltaOffsetFC:(float)a7 deltaOffsetMI:(float)a8 deltaOffsetFATP:(float)a9 deltaOffsetLastSession:(float)a10 errorHeadroomViolated:(BOOL)a11 errorConvergenceFailed:(BOOL)a12 errorMotionTooLarge:(BOOL)a13 errorConfidenceTooLow:(BOOL)a14 errorOffsetTooLarge:(BOOL)a15 errorDeltaTooLarge:(BOOL)a16 errorSaturated:(BOOL)a17 errorCouldNotRun:(BOOL)a18 successRun:(BOOL)a19 startAPSVoltage:(int)a20 modeGCOL:(BOOL)a21 modeOL:(BOOL)a22
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F52DD8]])
  {
    int v36 = 1;
  }
  else
  {
    if (![a3 isEqualToString:*MEMORY[0x1E4F52DF0]]) {
      return;
    }
    int v36 = 2;
  }
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __365__BWAggdDataReporter_reportAPSOffsetEstimatorForPortType_accelMotion_gyroMotion_inSessionOffset_deltaOffsetFC_deltaOffsetMI_deltaOffsetFATP_deltaOffsetLastSession_errorHeadroomViolated_errorConvergenceFailed_errorMotionTooLarge_errorConfidenceTooLow_errorOffsetTooLarge_errorDeltaTooLarge_errorSaturated_errorCouldNotRun_successRun_startAPSVoltage_modeGCOL_modeOL___block_invoke;
  block[3] = &unk_1E5C280C8;
  block[4] = self;
  float v39 = a4;
  float v40 = a5;
  float v41 = a7;
  int v42 = v36;
  float v43 = a8;
  float v44 = a9;
  BOOL v48 = a11;
  BOOL v49 = a12;
  BOOL v50 = a13;
  BOOL v51 = a14;
  BOOL v52 = a15;
  BOOL v53 = a16;
  BOOL v54 = a17;
  BOOL v55 = a18;
  BOOL v56 = a19;
  float v45 = a10;
  float v46 = a6;
  int v47 = a20;
  BOOL v57 = a21;
  BOOL v58 = a22;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __365__BWAggdDataReporter_reportAPSOffsetEstimatorForPortType_accelMotion_gyroMotion_inSessionOffset_deltaOffsetFC_deltaOffsetMI_deltaOffsetFATP_deltaOffsetLastSession_errorHeadroomViolated_errorConvergenceFailed_errorMotionTooLarge_errorConfidenceTooLow_errorOffsetTooLarge_errorDeltaTooLarge_errorSaturated_errorCouldNotRun_successRun_startAPSVoltage_modeGCOL_modeOL___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) && (ADClientPushValueForDistributionKey(), *(void *)(a1 + 32)))
  {
    ADClientPushValueForDistributionKey();
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v2 = 0;
  }
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.insession.delta_fc.%d", *(unsigned int *)(a1 + 52));
  if (v2 && v3) {
    ADClientPushValueForDistributionKey();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.insession.delta_nvm.%d", *(unsigned int *)(a1 + 52));
  if (v4 && v5) {
    ADClientPushValueForDistributionKey();
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.insession.delta_syscfg.%d", *(unsigned int *)(a1 + 52));
  if (v6 && v7) {
    ADClientPushValueForDistributionKey();
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.insession.delta_offset.%d", *(unsigned int *)(a1 + 52));
  if (v8 && v9) {
    ADClientPushValueForDistributionKey();
  }
  if (*(unsigned char *)(a1 + 76))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.insession.num_err_hdrm.%d", *(unsigned int *)(a1 + 52));
    if (v10)
    {
      if (v11) {
        ADClientAddValueForScalarKey();
      }
    }
  }
  if (*(unsigned char *)(a1 + 77))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.insession.num_err_converge.%d", *(unsigned int *)(a1 + 52));
    if (v12)
    {
      if (v13) {
        ADClientAddValueForScalarKey();
      }
    }
  }
  if (*(unsigned char *)(a1 + 78))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.insession.num_err_motion.%d", *(unsigned int *)(a1 + 52));
    if (v14)
    {
      if (v15) {
        ADClientAddValueForScalarKey();
      }
    }
  }
  if (*(unsigned char *)(a1 + 79))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.insession.num_err_confidence.%d", *(unsigned int *)(a1 + 52));
    if (v16)
    {
      if (v17) {
        ADClientAddValueForScalarKey();
      }
    }
  }
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.insession.num_err_offset.%d", *(unsigned int *)(a1 + 52));
    if (v18)
    {
      if (v19) {
        ADClientAddValueForScalarKey();
      }
    }
  }
  if (*(unsigned char *)(a1 + 81))
  {
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.insession.num_err_deltaoffset.%d", *(unsigned int *)(a1 + 52));
    if (v20)
    {
      if (v21) {
        ADClientAddValueForScalarKey();
      }
    }
  }
  if (*(unsigned char *)(a1 + 82))
  {
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.insession.num_err_saturated.%d", *(unsigned int *)(a1 + 52));
    if (v22)
    {
      if (v23) {
        ADClientAddValueForScalarKey();
      }
    }
  }
  if (*(unsigned char *)(a1 + 83))
  {
    uint64_t v24 = *(void *)(a1 + 32);
    uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.insession.num_err_run.%d", *(unsigned int *)(a1 + 52));
    if (v24)
    {
      if (v25) {
        ADClientAddValueForScalarKey();
      }
    }
  }
  if (*(unsigned char *)(a1 + 84))
  {
    uint64_t v26 = *(void *)(a1 + 32);
    uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.insession.num_success.%d", *(unsigned int *)(a1 + 52));
    if (v26 && v27) {
      ADClientAddValueForScalarKey();
    }
    uint64_t v28 = *(void *)(a1 + 32);
    uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.insession.offset.%d", *(unsigned int *)(a1 + 52));
    if (v28 && v29) {
      ADClientPushValueForDistributionKey();
    }
  }
  uint64_t v30 = *(void *)(a1 + 32);
  uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.aps.insession.num_sessions.%d", *(unsigned int *)(a1 + 52));
  if (v30 && v31) {
    ADClientAddValueForScalarKey();
  }
  uint64_t v32 = *(void *)(a1 + 32);
  uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.startup.af.raw_aps.%d", *(unsigned int *)(a1 + 52));
  if (v32 && result) {
    uint64_t result = ADClientPushValueForDistributionKey();
  }
  if (*(unsigned char *)(a1 + 85))
  {
    uint64_t v34 = *(void *)(a1 + 32);
    uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.af.num_gcol.%d", *(unsigned int *)(a1 + 52));
    if (v34)
    {
      if (result) {
        uint64_t result = ADClientAddValueForScalarKey();
      }
    }
  }
  if (*(unsigned char *)(a1 + 86))
  {
    uint64_t v35 = *(void *)(a1 + 32);
    uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.af.num_cl.%d", *(unsigned int *)(a1 + 52));
    if (v35)
    {
      if (result)
      {
        return ADClientAddValueForScalarKey();
      }
    }
  }
  return result;
}

- (void)reportStillImageAPSStatisticsForPortType:(id)a3 logicalFocusPosition:(int)a4 apsMotion:(float)a5 sphereMotion:(float)a6 accelMotion:(float)a7 gyroMotion:(float)a8 subjectDistance:(float)a9 luxLevel:(int)a10
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F52DD8]])
  {
    int v19 = 1;
  }
  else
  {
    if (![a3 isEqualToString:*MEMORY[0x1E4F52DF0]]) {
      return;
    }
    int v19 = 2;
  }
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __155__BWAggdDataReporter_reportStillImageAPSStatisticsForPortType_logicalFocusPosition_apsMotion_sphereMotion_accelMotion_gyroMotion_subjectDistance_luxLevel___block_invoke;
  block[3] = &unk_1E5C280F0;
  block[4] = self;
  int v22 = a4;
  int v23 = v19;
  float v24 = a5;
  float v25 = a6;
  float v26 = a7;
  float v27 = a8;
  float v28 = a9;
  int v29 = a10;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __155__BWAggdDataReporter_reportStillImageAPSStatisticsForPortType_logicalFocusPosition_apsMotion_sphereMotion_accelMotion_gyroMotion_subjectDistance_luxLevel___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.capture.af.focuspos.%d", *(unsigned int *)(a1 + 44));
  if (v2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    ADClientPushValueForDistributionKey();
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.capture.af.ze_std.%d", *(unsigned int *)(a1 + 44));
  if (v5 && v6) {
    ADClientPushValueForDistributionKey();
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.capture.sph.xy_std.%d", *(unsigned int *)(a1 + 44));
  if (v7 && v8) {
    ADClientPushValueForDistributionKey();
  }
  if (*(void *)(a1 + 32) && (ADClientPushValueForDistributionKey(), *(void *)(a1 + 32)))
  {
    ADClientPushValueForDistributionKey();
    uint64_t v9 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.capture.aps_do.%d", *(unsigned int *)(a1 + 44));
  if (v9 && result) {
    uint64_t result = ADClientPushValueForDistributionKey();
  }
  float v11 = *(float *)(a1 + 64);
  if (*(_DWORD *)(a1 + 44) == 1)
  {
    if (v11 < 0.0)
    {
      if (!*(void *)(a1 + 32)) {
        return result;
      }
      goto LABEL_72;
    }
    if (v11 < 15.0)
    {
      if (!*(void *)(a1 + 32)) {
        return result;
      }
      goto LABEL_72;
    }
    if (v11 < 17.0)
    {
      if (!*(void *)(a1 + 32)) {
        return result;
      }
      goto LABEL_72;
    }
    if (v11 < 20.0)
    {
      if (!*(void *)(a1 + 32)) {
        return result;
      }
      goto LABEL_72;
    }
    if (v11 < 24.0)
    {
      if (!*(void *)(a1 + 32)) {
        return result;
      }
      goto LABEL_72;
    }
    if (v11 < 30.0)
    {
      if (!*(void *)(a1 + 32)) {
        return result;
      }
      goto LABEL_72;
    }
    if (v11 < 40.0)
    {
      if (!*(void *)(a1 + 32)) {
        return result;
      }
      goto LABEL_72;
    }
    if (v11 < 60.0)
    {
      if (!*(void *)(a1 + 32)) {
        return result;
      }
      goto LABEL_72;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = @"com.apple.coremedia.camera.capture.lux.1.apsdo_120_infcm";
    uint64_t v14 = @"com.apple.coremedia.camera.capture.lux.1.apsdo_60_120cm";
    float v15 = 120.0;
  }
  else
  {
    if (v11 < 0.0)
    {
      if (!*(void *)(a1 + 32)) {
        return result;
      }
      goto LABEL_72;
    }
    if (v11 < 34.0)
    {
      if (!*(void *)(a1 + 32)) {
        return result;
      }
      goto LABEL_72;
    }
    if (v11 < 40.0)
    {
      if (!*(void *)(a1 + 32)) {
        return result;
      }
      goto LABEL_72;
    }
    if (v11 < 48.0)
    {
      if (!*(void *)(a1 + 32)) {
        return result;
      }
      goto LABEL_72;
    }
    if (v11 < 60.0)
    {
      if (!*(void *)(a1 + 32)) {
        return result;
      }
      goto LABEL_72;
    }
    if (v11 < 80.0)
    {
      if (!*(void *)(a1 + 32)) {
        return result;
      }
      goto LABEL_72;
    }
    if (v11 < 120.0)
    {
      if (!*(void *)(a1 + 32)) {
        return result;
      }
      goto LABEL_72;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = @"com.apple.coremedia.camera.capture.lux.2.apsdo_240_infcm";
    uint64_t v14 = @"com.apple.coremedia.camera.capture.lux.2.apsdo_120_240cm";
    float v15 = 240.0;
  }
  if (v11 >= v15) {
    uint64_t result = (uint64_t)v13;
  }
  else {
    uint64_t result = (uint64_t)v14;
  }
  if (v12)
  {
LABEL_72:
    return ADClientPushValueForDistributionKey();
  }
  return result;
}

- (void)reportVideoRecordingAPSStatistics:(float)a3 stdDataFromAPSForTele:(float)a4 stdDataFromSphereForWide:(float)a5 stdDataFromSphereForTele:(float)a6 stdDataFromAccel:(float)a7 stdDataFromGyro:(float)a8 maxDataFromAPSForWide:(float)a9 maxDataFromAPSForTele:(float)a10 minDataFromAPSForWide:(float)a11 minDataFromAPSForTele:(float)a12 maxDataFromSphereForWide:(float)a13 maxDataFromSphereForTele:(float)a14 minDataFromSphereForWide:(float)a15 minDataFromSphereForTele:(float)a16 maxDataFromAccel:(float)a17 minDataFromAccel:(float)a18 maxDataFromGyro:(float)a19 minDataFromGyro:(float)a20
{
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __415__BWAggdDataReporter_reportVideoRecordingAPSStatistics_stdDataFromAPSForTele_stdDataFromSphereForWide_stdDataFromSphereForTele_stdDataFromAccel_stdDataFromGyro_maxDataFromAPSForWide_maxDataFromAPSForTele_minDataFromAPSForWide_minDataFromAPSForTele_maxDataFromSphereForWide_maxDataFromSphereForTele_minDataFromSphereForWide_minDataFromSphereForTele_maxDataFromAccel_minDataFromAccel_maxDataFromGyro_minDataFromGyro___block_invoke;
  v21[3] = &unk_1E5C28118;
  v21[4] = self;
  float v22 = a3;
  float v23 = a4;
  float v24 = a5;
  float v25 = a6;
  float v26 = a7;
  float v27 = a8;
  float v28 = a9;
  float v29 = a10;
  long long v30 = *(_OWORD *)&a11;
  long long v31 = *(_OWORD *)&a15;
  float v32 = a19;
  float v33 = a20;
  dispatch_async(aggdDispatchQueue, v21);
}

uint64_t __415__BWAggdDataReporter_reportVideoRecordingAPSStatistics_stdDataFromAPSForTele_stdDataFromSphereForWide_stdDataFromSphereForTele_stdDataFromAccel_stdDataFromGyro_maxDataFromAPSForWide_maxDataFromAPSForTele_minDataFromAPSForWide_minDataFromAPSForTele_maxDataFromSphereForWide_maxDataFromSphereForTele_minDataFromSphereForWide_minDataFromSphereForTele_maxDataFromAccel_minDataFromAccel_maxDataFromGyro_minDataFromGyro___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    uint64_t result = ADClientPushValueForDistributionKey();
    if (*(void *)(v1 + 32))
    {
      uint64_t result = ADClientPushValueForDistributionKey();
      if (*(void *)(v1 + 32))
      {
        uint64_t result = ADClientPushValueForDistributionKey();
        if (*(void *)(v1 + 32))
        {
          uint64_t result = ADClientPushValueForDistributionKey();
          if (*(void *)(v1 + 32))
          {
            uint64_t result = ADClientPushValueForDistributionKey();
            if (*(void *)(v1 + 32))
            {
              uint64_t result = ADClientPushValueForDistributionKey();
              if (*(void *)(v1 + 32))
              {
                uint64_t result = ADClientPushValueForDistributionKey();
                if (*(void *)(v1 + 32))
                {
                  uint64_t result = ADClientPushValueForDistributionKey();
                  if (*(void *)(v1 + 32))
                  {
                    uint64_t result = ADClientPushValueForDistributionKey();
                    if (*(void *)(v1 + 32))
                    {
                      uint64_t result = ADClientPushValueForDistributionKey();
                      if (*(void *)(v1 + 32))
                      {
                        uint64_t result = ADClientPushValueForDistributionKey();
                        if (*(void *)(v1 + 32))
                        {
                          uint64_t result = ADClientPushValueForDistributionKey();
                          if (*(void *)(v1 + 32))
                          {
                            uint64_t result = ADClientPushValueForDistributionKey();
                            if (*(void *)(v1 + 32))
                            {
                              uint64_t result = ADClientPushValueForDistributionKey();
                              if (*(void *)(v1 + 32))
                              {
                                uint64_t result = ADClientPushValueForDistributionKey();
                                if (*(void *)(v1 + 32))
                                {
                                  uint64_t result = ADClientPushValueForDistributionKey();
                                  if (*(void *)(v1 + 32))
                                  {
                                    uint64_t result = ADClientPushValueForDistributionKey();
                                    if (*(void *)(v1 + 32))
                                    {
                                      return ADClientPushValueForDistributionKey();
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (void)reportCriticalFocusErrorOccurredForPortType:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F52DD8]])
  {
    int v5 = 1;
  }
  else
  {
    if (![a3 isEqualToString:*MEMORY[0x1E4F52DF0]]) {
      return;
    }
    int v5 = 2;
  }
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__BWAggdDataReporter_reportCriticalFocusErrorOccurredForPortType___block_invoke;
  v7[3] = &unk_1E5C262A0;
  v7[4] = self;
  int v8 = v5;
  dispatch_async(aggdDispatchQueue, v7);
}

uint64_t __66__BWAggdDataReporter_reportCriticalFocusErrorOccurredForPortType___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.capture.focus_err.%d", *(unsigned int *)(a1 + 40));
  if (v1) {
    BOOL v3 = result == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportSphereJitterDetectionsForPortType:(id)a3 detectionAttemps:(int)a4 successfulDetections:(int)a5
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F52DD8]])
  {
    uint64_t v9 = @"BackAccumulatedSuccessfulDetections";
    int v10 = 1;
    float v11 = @"BackAccumulatedDetectionAttempts";
  }
  else
  {
    if (![a3 isEqualToString:*MEMORY[0x1E4F52DF0]]) {
      return;
    }
    uint64_t v9 = @"BackTelephotoAccumulatedSuccessfulDetections";
    int v10 = 2;
    float v11 = @"BackTelephotoAccumulatedDetectionAttempts";
  }
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__BWAggdDataReporter_reportSphereJitterDetectionsForPortType_detectionAttemps_successfulDetections___block_invoke;
  block[3] = &unk_1E5C28140;
  block[4] = v11;
  void block[5] = v9;
  int v14 = a4;
  int v15 = a5;
  void block[6] = self;
  int v16 = v10;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __100__BWAggdDataReporter_reportSphereJitterDetectionsForPortType_detectionAttemps_successfulDetections___block_invoke(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  BOOL v4 = (void *)CFPreferencesCopyValue(@"SphereJitterDetectionInfo", @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v4) {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v4];
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(_DWORD *)(a1 + 56)
     + objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *(void *)(a1 + 32)), "intValue");
  uint64_t v8 = *(_DWORD *)(a1 + 60)
     + objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *(void *)(a1 + 40)), "intValue");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v7), *(void *)(a1 + 32));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v8), *(void *)(a1 + 40));
  CFPreferencesSetValue(@"SphereJitterDetectionInfo", v6, @"com.apple.cameracapture.volatile", v2, v3);
  CFPreferencesSynchronize(@"com.apple.cameracapture.volatile", v2, v3);

  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.video.sph.esd_recovery_attempts.%d", *(unsigned int *)(a1 + 64));
  if (v9 && v10 && *(_DWORD *)(a1 + 56)) {
    ADClientAddValueForScalarKey();
  }
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.video.sph.esd_recovery_detects.%d", *(unsigned int *)(a1 + 64));
  int v13 = *(_DWORD *)(a1 + 60);
  if (v11 && v12 && v13)
  {
    ADClientAddValueForScalarKey();
    int v13 = *(_DWORD *)(a1 + 60);
  }
  if (v13)
  {
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.video.sph.esd_recovery_entries.%d", *(unsigned int *)(a1 + 64));
    if (v14)
    {
      if (v15) {
        ADClientAddValueForScalarKey();
      }
    }
  }
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t result = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.camera.video.sph.esd_detect_ratio.%d", *(unsigned int *)(a1 + 64));
  if (v16 && result)
  {
    return ADClientSetValueForScalarKey();
  }
  return result;
}

- (id)_aggdCameraStreamingTimeStringFromDeviceType:(int)a3 devicePosition:(int)a4
{
  if (a4 == 2)
  {
    int v4 = a3 - 2;
    if ((a3 - 2) < 5)
    {
      id v5 = &off_1E5C281A8;
      return v5[v4];
    }
  }
  else if (a4 == 1)
  {
    int v4 = a3 - 2;
    if ((a3 - 2) < 9)
    {
      id v5 = off_1E5C28160;
      return v5[v4];
    }
  }
  return 0;
}

- (id)_aggdPearlInfraredProjectorUptimeStringFromCurrent:(int)a3 pattern:(int)a4 applicationID:(id)a5
{
  if (a3 != 1 || a4)
  {
    if (a3 == 1 && a4 == 1)
    {
      BOOL v6 = 0;
      uint64_t v7 = @"lowpowerdense";
    }
    else if (a3 != 2 || a4)
    {
      BOOL v6 = a3 != 2 || a4 != 1;
      if (a3 == 2 && a4 == 1) {
        uint64_t v7 = @"highpowerdense";
      }
      else {
        uint64_t v7 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
      uint64_t v7 = @"highpowersparse";
    }
  }
  else
  {
    BOOL v6 = 0;
    uint64_t v7 = @"lowpowersparse";
  }
  if (([a5 isEqualToString:0x1EFA44100] & 1) != 0
    || ([a5 isEqualToString:0x1EFA55880] & 1) != 0)
  {
    uint64_t v8 = @"cameraapp";
  }
  else if ([a5 isEqualToString:0x1EFA557C0])
  {
    uint64_t v8 = @"jellyfish";
  }
  else
  {
    int v10 = [a5 isEqualToString:0x1EFA55AE0];
    uint64_t v8 = @"3rdparty";
    if (v10) {
      uint64_t v8 = @"facetime";
    }
  }
  if (v6) {
    return 0;
  }
  else {
    return (id)[NSString stringWithFormat:@"com.apple.coremedia.camera.pearl.projectoruptime.%@.%@", v7, v8];
  }
}

- (id)_aggdGNRProcessingStatusStringFromProcessingStatus:(int)a3
{
  CFStringRef v3 = @"success";
  int v4 = @"other-failure";
  if (a3 == -17401) {
    int v4 = @"reg-failure";
  }
  if (a3) {
    CFStringRef v3 = v4;
  }
  if (a3 == -17402) {
    CFStringRef v3 = @"fusion-failure";
  }
  return (id)[NSString stringWithFormat:@"com.apple.coremedia.camera.still.processing.gnr.status.%@", v3];
}

- (id)_aggdStereoFusionProcessingTypeStringForCaptureType:(int)a3 isStereoFusionCapture:(BOOL)a4 wideSubCaptureType:(int)a5 teleSubCaptureType:(int)a6 isOriginalImage:(BOOL)a7
{
  if (a4)
  {
    switch(a3)
    {
      case 1:
        if (a5 != 1 || a6 != 1) {
          goto LABEL_25;
        }
        uint64_t v7 = @"wysiwyg";
        return (id)[NSString stringWithFormat:@"com.apple.coremedia.camera.still.processing.stereofusion.type.%@", v7];
      case 2:
        if (a5 != 2 || a6 != 2) {
          goto LABEL_25;
        }
        uint64_t v7 = @"flash";
        return (id)[NSString stringWithFormat:@"com.apple.coremedia.camera.still.processing.stereofusion.type.%@", v7];
      case 3:
        uint64_t v7 = @"hdr";
        if (a7) {
          uint64_t v7 = @"wysiwyg";
        }
        if (a5 == 3 && a6 == 3) {
          return (id)[NSString stringWithFormat:@"com.apple.coremedia.camera.still.processing.stereofusion.type.%@", v7];
        }
        goto LABEL_25;
      case 4:
        if (a5 != 4 || a6 != 4) {
          goto LABEL_25;
        }
        uint64_t v7 = @"sis";
        return (id)[NSString stringWithFormat:@"com.apple.coremedia.camera.still.processing.stereofusion.type.%@", v7];
      case 5:
        if (a5 == 5 && a6 == 5)
        {
          uint64_t v7 = @"ois";
          return (id)[NSString stringWithFormat:@"com.apple.coremedia.camera.still.processing.stereofusion.type.%@", v7];
        }
        if (a5 == 5 && a6 == 4)
        {
          uint64_t v7 = @"ois-sis";
          return (id)[NSString stringWithFormat:@"com.apple.coremedia.camera.still.processing.stereofusion.type.%@", v7];
        }
LABEL_25:
        id result = 0;
        break;
      default:
        goto LABEL_25;
    }
  }
  else
  {
    uint64_t v7 = @"not-processed";
    return (id)[NSString stringWithFormat:@"com.apple.coremedia.camera.still.processing.stereofusion.type.%@", v7];
  }
  return result;
}

- (id)_aggdStereoFusionProcessingStatusStringFromProcessingStatus:(int)a3
{
  CFStringRef v3 = @"other-failure";
  if (a3 == -17411) {
    CFStringRef v3 = @"adc-failure";
  }
  if (!a3) {
    CFStringRef v3 = @"success";
  }
  return (id)[NSString stringWithFormat:@"com.apple.coremedia.camera.still.processing.stereofusion.status.%@", v3];
}

- (id)_aggdSDOFProcessingStatusStringFromProcessingStatus:(int)a3
{
  CFStringRef v3 = @"other-failure";
  if (a3 == -17411) {
    CFStringRef v3 = @"adc-failure";
  }
  if (!a3) {
    CFStringRef v3 = @"success";
  }
  return (id)[NSString stringWithFormat:@"com.apple.coremedia.camera.still.processing.sdof.status.%@", v3];
}

- (id)_aggdStringForPrefix:(id)a3 primaryCaptureType:(int)a4 secondaryCaptureType:(int)a5 captureFlags:(unint64_t)a6 sceneFlags:(unint64_t)a7 stillDuringVideo:(BOOL)a8 frontCamera:(BOOL)a9
{
  if (!a3) {
    return 0;
  }
  __int16 v9 = a6;
  if (a9) {
    uint64_t v11 = @"ffc";
  }
  else {
    uint64_t v11 = @"rfc";
  }
  if ((a6 & 0x400) != 0) {
    uint64_t v12 = @".stereofusion";
  }
  else {
    uint64_t v12 = &stru_1EFA403E0;
  }
  if (a8)
  {
    int v13 = @"stillduringvideo";
  }
  else
  {
    int v13 = -[BWAggdDataReporter _captureTypeStringWithPrimaryCaptureType:secondaryCaptureType:captureFlags:sceneFlags:]((__CFString *)self, a4, a5, (unsigned __int16)a6, a7);
    if (!v13) {
      return 0;
    }
  }
  if ((v9 & 0x800) != 0) {
    uint64_t v14 = @".depth";
  }
  else {
    uint64_t v14 = &stru_1EFA403E0;
  }
  uint64_t v15 = [NSString stringWithFormat:@"%@%@.%@%@", *(void *)&a4, *(void *)&a5, v11, v12, v13, v14];
  if (v15) {
    return (id)[NSString stringWithFormat:@"com.apple.coremedia.camera.%@.%@", a3, v15];
  }
  return 0;
}

- (__CFString)_captureTypeStringWithPrimaryCaptureType:(unsigned int)a3 secondaryCaptureType:(int)a4 captureFlags:(char)a5 sceneFlags:
{
  if (result)
  {
    id result = @"wysiwyg";
    switch(a2)
    {
      case 1:
      case 8:
        return result;
      case 2:
        id result = @"flash";
        break;
      case 3:
        id result = @"HDR";
        break;
      case 4:
        id v5 = @"SIS";
        if (a3) {
          id v5 = 0;
        }
        if (a3 == 4) {
          id result = @"SIS+SIS";
        }
        else {
          id result = v5;
        }
        break;
      case 5:
        if (a3 >= 6) {
          goto LABEL_21;
        }
        id result = *(&off_1E5C281D0 + (int)a3);
        break;
      case 6:
        id result = @"nightmode";
        break;
      case 7:
        id result = @"bracket";
        break;
      case 10:
        BOOL v6 = @"HDR";
        uint64_t v7 = @"NR.HR";
        if ((a5 & 0x80) == 0) {
          uint64_t v7 = @"NR";
        }
        if ((a5 & 0xC) == 0) {
          uint64_t v7 = @"wysiwyg";
        }
        if ((a4 & 0x100000) == 0) {
          BOOL v6 = v7;
        }
        id result = (__CFString *)[NSString stringWithFormat:@"UB.%@", v6];
        break;
      case 11:
        id result = @"digitalflash";
        break;
      case 12:
        id result = @"deepfusion";
        break;
      default:
LABEL_21:
        id result = 0;
        break;
    }
  }
  return result;
}

@end