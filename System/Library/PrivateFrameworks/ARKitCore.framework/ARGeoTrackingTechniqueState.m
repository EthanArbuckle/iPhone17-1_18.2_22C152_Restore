@interface ARGeoTrackingTechniqueState
+ (id)_findClosestDataToTimestamp:(double)a3 inBuffer:(id)a4;
- (ARCircularArray)deviceMotionCircularBuffer;
- (ARCircularArray)vioPoseCircularBuffer;
- (ARDeviceOrientationData)lastCMDeviceMotion;
- (ARGeoTrackingConsensusAndAverageFilter)consensusAverageFilter;
- (ARGeoTrackingGradualCorrectionFilter)gradualCorrectionFilter;
- (ARGeoTrackingTechniqueState)initWithResetCount:(int64_t)a3;
- (ARLocationData)enuOrigin;
- (ARLocationData)lastCLLocation;
- (ARLocationData)lastLocationProcessedForFusion;
- (BOOL)VLHasExecuted;
- (BOOL)hasReturnedAvailabilityCheck;
- (BOOL)hasReturnedLocalization;
- (BOOL)hasStartedAvailabilityCheck;
- (BOOL)hasStartedLocalization;
- (NSMutableArray)resultDatas;
- (VLLocalizer)VLHandle;
- (__n128)lastLoggedVioPosition;
- (double)firstRequestResultTimestamp;
- (double)firstVLExecutionAttemptTimestamp;
- (double)lastGradualCorrectionTime;
- (double)lastLoggedVioTimestamp;
- (double)lastPoseOriginTimestamp;
- (double)lastVLExecutionAttemptTimestamp;
- (double)lastVLExecutionTimestamp;
- (id)findClosestDeviceMotionDataToTimestamp:(double)a3;
- (id)findClosestVioPoseToTimestamp:(double)a3;
- (int)poseOkCount;
- (int64_t)failureLogCount;
- (int64_t)failureReasons;
- (int64_t)lastLoggedFailureReasons;
- (int64_t)resetCount;
- (int64_t)trackingAccuracy;
- (int64_t)trackingState;
- (void)addDeviceMotionData:(id)a3;
- (void)addFailureReason:(int64_t)a3;
- (void)addVioPoseData:(id)a3;
- (void)enuFromVIO;
- (void)removeFailureReason:(int64_t)a3;
- (void)setConsensusAverageFilter:(id)a3;
- (void)setDeviceMotionCircularBuffer:(id)a3;
- (void)setEnuFromVIO:(long long *)a3;
- (void)setEnuFromVIORotation:(uint64_t)a3;
- (void)setEnuFromVIOTranslation:(ARGeoTrackingTechniqueState *)self;
- (void)setEnuOrigin:(id)a3;
- (void)setFailureLogCount:(int64_t)a3;
- (void)setFailureReasons:(int64_t)a3;
- (void)setFirstRequestResultTimestamp:(double)a3;
- (void)setFirstVLExecutionAttemptTimestamp:(double)a3;
- (void)setGradualCorrectionFilter:(id)a3;
- (void)setHasReturnedAvailabilityCheck:(BOOL)a3;
- (void)setHasReturnedLocalization:(BOOL)a3;
- (void)setHasStartedAvailabilityCheck:(BOOL)a3;
- (void)setHasStartedLocalization:(BOOL)a3;
- (void)setLastCLLocation:(id)a3;
- (void)setLastCMDeviceMotion:(id)a3;
- (void)setLastGradualCorrectionTime:(double)a3;
- (void)setLastLocationProcessedForFusion:(id)a3;
- (void)setLastLoggedFailureReasons:(int64_t)a3;
- (void)setLastLoggedVioPosition:(ARGeoTrackingTechniqueState *)self;
- (void)setLastLoggedVioTimestamp:(double)a3;
- (void)setLastPoseOriginTimestamp:(double)a3;
- (void)setLastVLExecutionAttemptTimestamp:(double)a3;
- (void)setLastVLExecutionTimestamp:(double)a3;
- (void)setPoseOkCount:(int)a3;
- (void)setResetCount:(int64_t)a3;
- (void)setResultDatas:(id)a3;
- (void)setTrackingAccuracy:(int64_t)a3;
- (void)setTrackingState:(int64_t)a3;
- (void)setVLHandle:(id)a3;
- (void)setVioPoseCircularBuffer:(id)a3;
@end

@implementation ARGeoTrackingTechniqueState

- (ARGeoTrackingTechniqueState)initWithResetCount:(int64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)ARGeoTrackingTechniqueState;
  v4 = [(ARGeoTrackingTechniqueState *)&v26 init];
  v5 = v4;
  if (v4)
  {
    v4->_int64_t resetCount = a3;
    if (_ARLogTechnique_onceToken_20 != -1) {
      dispatch_once(&_ARLogTechnique_onceToken_20, &__block_literal_global_120);
    }
    v6 = (void *)_ARLogTechnique_logObj_20;
    if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj_20, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      int64_t resetCount = v5->_resetCount;
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 2048;
      int64_t v28 = resetCount;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Geo tracking has reset! Count=%ld", buf, 0x20u);
    }
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    resultDatas = v5->_resultDatas;
    v5->_resultDatas = (NSMutableArray *)v11;

    [(ARGeoTrackingTechniqueState *)v5 setLastCMDeviceMotion:0];
    [(ARGeoTrackingTechniqueState *)v5 setLastCLLocation:0];
    v5->_enuFromVIOLock._os_unfair_lock_opaque = 0;
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F14990] + 16);
    var20[0] = *MEMORY[0x1E4F14990];
    var20[1] = v13;
    var20[2] = *(_OWORD *)(MEMORY[0x1E4F14990] + 32);
    [(ARGeoTrackingTechniqueState *)v5 setEnuFromVIO:var20];
    [(ARGeoTrackingTechniqueState *)v5 setEnuOrigin:0];
    v5->_poseOkCount = 0;
    v5->_lastVLExecutionTimestamp = -1.0;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v5->_firstVLExecutionAttemptTimestamp = _Q0;
    [(ARGeoTrackingTechniqueState *)v5 setVLHandle:0];
    *(_DWORD *)&v5->_hasStartedAvailabilityCheck = 0;
    [(ARGeoTrackingTechniqueState *)v5 setTrackingState:1];
    [(ARGeoTrackingTechniqueState *)v5 setTrackingAccuracy:0];
    [(ARGeoTrackingTechniqueState *)v5 setConsensusAverageFilter:0];
    [(ARGeoTrackingTechniqueState *)v5 setGradualCorrectionFilter:0];
    v5->_lastGradualCorrectionTime = 0.0;
    [(ARGeoTrackingTechniqueState *)v5 setFailureReasons:1024];
    *(_OWORD *)&v5->_lastPoseOriginTimestamp = 0u;
    *(_OWORD *)&v5->_lastLoggedFailureReasons = 0u;
    v19 = [[ARCircularArray alloc] initWithCapacity:30];
    vioPoseCircularBuffer = v5->_vioPoseCircularBuffer;
    v5->_vioPoseCircularBuffer = v19;

    v5->_vioPoseBufferLock._os_unfair_lock_opaque = 0;
    v21 = [[ARCircularArray alloc] initWithCapacity:50];
    deviceMotionCircularBuffer = v5->_deviceMotionCircularBuffer;
    v5->_deviceMotionCircularBuffer = v21;

    v5->_deviceMotionBufferLock._os_unfair_lock_opaque = 0;
    lastLocationProcessedForFusion = v5->_lastLocationProcessedForFusion;
    v5->_lastLocationProcessedForFusion = 0;

    *(void *)v5->_lastLoggedVioPosition = 0;
    *(void *)&v5->_lastLoggedVioPosition[8] = 0;
    *(_OWORD *)&v5->_lastLoggedVioPosition[16] = 0u;
    v5->_lastLoggedVioTimestamp = -1.0;
  }
  return v5;
}

- (void)enuFromVIO
{
  v4 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  long long v5 = *(_OWORD *)(a1 + 336);
  a2[4] = *(_OWORD *)(a1 + 320);
  a2[5] = v5;
  long long v6 = *(_OWORD *)(a1 + 368);
  a2[6] = *(_OWORD *)(a1 + 352);
  a2[7] = v6;
  long long v7 = *(_OWORD *)(a1 + 272);
  *a2 = *(_OWORD *)(a1 + 256);
  a2[1] = v7;
  long long v8 = *(_OWORD *)(a1 + 304);
  a2[2] = *(_OWORD *)(a1 + 288);
  a2[3] = v8;
  os_unfair_lock_unlock(v4);
}

- (void)setEnuFromVIO:(long long *)a3
{
  long long v5 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  long long v6 = *a3;
  long long v7 = a3[1];
  long long v8 = a3[3];
  *(_OWORD *)(a1 + 288) = a3[2];
  *(_OWORD *)(a1 + 304) = v8;
  *(_OWORD *)(a1 + 256) = v6;
  *(_OWORD *)(a1 + 272) = v7;
  long long v9 = a3[4];
  long long v10 = a3[5];
  long long v11 = a3[7];
  *(_OWORD *)(a1 + 352) = a3[6];
  *(_OWORD *)(a1 + 368) = v11;
  *(_OWORD *)(a1 + 320) = v9;
  *(_OWORD *)(a1 + 336) = v10;
  os_unfair_lock_unlock(v5);
}

- (void)setEnuFromVIOTranslation:(ARGeoTrackingTechniqueState *)self
{
  long long v6 = v2[1];
  long long v7 = *v2;
  p_enuFromVIOLock = &self->_enuFromVIOLock;
  os_unfair_lock_lock(&self->_enuFromVIOLock);
  *(void *)&long long v5 = v6;
  *((void *)&v5 + 1) = 1.0;
  *(_OWORD *)&self[1]._gradualCorrectionFilter = v7;
  *(_OWORD *)&self[1]._int64_t resetCount = v5;
  os_unfair_lock_unlock(p_enuFromVIOLock);
}

- (void)setEnuFromVIORotation:(uint64_t)a3
{
  long long v5 = a1 + 2;
  os_unfair_lock_lock(a1 + 2);
  for (uint64_t i = 0; i != 24; i += 8)
  {
    long long v7 = *(_OWORD *)(a3 + i * 4 + 16);
    long long v8 = &a1[i + 64];
    *(_OWORD *)&v8->_os_unfair_lock_opaque = *(_OWORD *)(a3 + i * 4);
    *(_OWORD *)&v8[4]._os_unfair_lock_opaque = v7;
  }
  os_unfair_lock_unlock(v5);
}

- (void)addFailureReason:(int64_t)a3
{
  int64_t v4 = [(ARGeoTrackingTechniqueState *)self failureReasons] | a3;
  [(ARGeoTrackingTechniqueState *)self setFailureReasons:v4];
}

- (void)removeFailureReason:(int64_t)a3
{
  int64_t v4 = [(ARGeoTrackingTechniqueState *)self failureReasons] & ~a3;
  [(ARGeoTrackingTechniqueState *)self setFailureReasons:v4];
}

- (BOOL)VLHasExecuted
{
  [(ARGeoTrackingTechniqueState *)self lastVLExecutionTimestamp];
  return v2 > 0.0;
}

+ (id)_findClosestDataToTimestamp:(double)a3 inBuffer:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    long long v8 = 0;
    uint64_t v9 = *(void *)v18;
    double v10 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v12 timestamp];
        double v14 = vabdd_f64(a3, v13);
        if (v14 < v10)
        {
          id v15 = v12;

          double v10 = v14;
          long long v8 = v15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  else
  {
    long long v8 = 0;
  }

  return v8;
}

- (id)findClosestVioPoseToTimestamp:(double)a3
{
  p_vioPoseBufferLock = &self->_vioPoseBufferLock;
  os_unfair_lock_lock(&self->_vioPoseBufferLock);
  uint64_t v6 = [(id)objc_opt_class() _findClosestDataToTimestamp:self->_vioPoseCircularBuffer inBuffer:a3];
  os_unfair_lock_unlock(p_vioPoseBufferLock);
  return v6;
}

- (void)addVioPoseData:(id)a3
{
  id v4 = a3;
  id v5 = [ARGeoTrackingTechniqueStatePose alloc];
  [v4 timestamp];
  double v7 = v6;
  [v4 visionCameraTransform];
  ARMatrix4x4FloatToDouble(v14, v8, v9, v10, v11);
  v12 = [(ARGeoTrackingTechniqueStatePose *)v5 initWithTimestamp:v14 transform:0 fused:v7 heading:0.0];
  os_unfair_lock_lock(&self->_vioPoseBufferLock);
  id v13 = [(ARCircularArray *)self->_vioPoseCircularBuffer addObject:v12];
  os_unfair_lock_unlock(&self->_vioPoseBufferLock);
}

- (id)findClosestDeviceMotionDataToTimestamp:(double)a3
{
  p_deviceMotionBufferLock = &self->_deviceMotionBufferLock;
  os_unfair_lock_lock(&self->_deviceMotionBufferLock);
  double v6 = [(id)objc_opt_class() _findClosestDataToTimestamp:self->_deviceMotionCircularBuffer inBuffer:a3];
  os_unfair_lock_unlock(p_deviceMotionBufferLock);
  return v6;
}

- (void)addDeviceMotionData:(id)a3
{
  id v4 = a3;
  id v5 = [ARGeoTrackingTechniqueStatePose alloc];
  [v4 timestamp];
  double v7 = v6;
  [v4 rotationMatrixENU];
  v12 = objc_msgSend(v4, "deviceMotion", ARMatrix4x4FloatToDouble(v16, v8, v9, v10, v11).f64[0]);
  [v12 heading];
  double v14 = [(ARGeoTrackingTechniqueStatePose *)v5 initWithTimestamp:v16 transform:0 fused:v7 heading:v13 * 3.14159265 / 180.0];

  os_unfair_lock_lock(&self->_deviceMotionBufferLock);
  id v15 = [(ARCircularArray *)self->_deviceMotionCircularBuffer addObject:v14];
  os_unfair_lock_unlock(&self->_deviceMotionBufferLock);
}

- (VLLocalizer)VLHandle
{
  return self->_VLHandle;
}

- (void)setVLHandle:(id)a3
{
}

- (ARDeviceOrientationData)lastCMDeviceMotion
{
  return (ARDeviceOrientationData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastCMDeviceMotion:(id)a3
{
}

- (ARLocationData)lastCLLocation
{
  return (ARLocationData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastCLLocation:(id)a3
{
}

- (double)lastVLExecutionTimestamp
{
  return self->_lastVLExecutionTimestamp;
}

- (void)setLastVLExecutionTimestamp:(double)a3
{
  self->_lastVLExecutionTimestamp = a3;
}

- (int64_t)trackingState
{
  return self->_trackingState;
}

- (void)setTrackingState:(int64_t)a3
{
  self->_trackingState = a3;
}

- (int64_t)trackingAccuracy
{
  return self->_trackingAccuracy;
}

- (void)setTrackingAccuracy:(int64_t)a3
{
  self->_trackingAccuracy = a3;
}

- (int64_t)failureReasons
{
  return self->_failureReasons;
}

- (void)setFailureReasons:(int64_t)a3
{
  self->_failureReasons = a3;
}

- (ARGeoTrackingConsensusAndAverageFilter)consensusAverageFilter
{
  return self->_consensusAverageFilter;
}

- (void)setConsensusAverageFilter:(id)a3
{
}

- (ARGeoTrackingGradualCorrectionFilter)gradualCorrectionFilter
{
  return self->_gradualCorrectionFilter;
}

- (void)setGradualCorrectionFilter:(id)a3
{
}

- (ARLocationData)enuOrigin
{
  return (ARLocationData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setEnuOrigin:(id)a3
{
}

- (int64_t)resetCount
{
  return self->_resetCount;
}

- (void)setResetCount:(int64_t)a3
{
  self->_int64_t resetCount = a3;
}

- (NSMutableArray)resultDatas
{
  return self->_resultDatas;
}

- (void)setResultDatas:(id)a3
{
}

- (int)poseOkCount
{
  return self->_poseOkCount;
}

- (void)setPoseOkCount:(int)a3
{
  self->_poseOkCount = a3;
}

- (double)firstVLExecutionAttemptTimestamp
{
  return self->_firstVLExecutionAttemptTimestamp;
}

- (void)setFirstVLExecutionAttemptTimestamp:(double)a3
{
  self->_firstVLExecutionAttemptTimestamp = a3;
}

- (double)lastVLExecutionAttemptTimestamp
{
  return self->_lastVLExecutionAttemptTimestamp;
}

- (void)setLastVLExecutionAttemptTimestamp:(double)a3
{
  self->_lastVLExecutionAttemptTimestamp = a3;
}

- (BOOL)hasStartedAvailabilityCheck
{
  return self->_hasStartedAvailabilityCheck;
}

- (void)setHasStartedAvailabilityCheck:(BOOL)a3
{
  self->_hasStartedAvailabilityCheck = a3;
}

- (BOOL)hasReturnedAvailabilityCheck
{
  return self->_hasReturnedAvailabilityCheck;
}

- (void)setHasReturnedAvailabilityCheck:(BOOL)a3
{
  self->_hasReturnedAvailabilityCheck = a3;
}

- (BOOL)hasStartedLocalization
{
  return self->_hasStartedLocalization;
}

- (void)setHasStartedLocalization:(BOOL)a3
{
  self->_hasStartedLocalization = a3;
}

- (BOOL)hasReturnedLocalization
{
  return self->_hasReturnedLocalization;
}

- (void)setHasReturnedLocalization:(BOOL)a3
{
  self->_hasReturnedLocalization = a3;
}

- (double)lastGradualCorrectionTime
{
  return self->_lastGradualCorrectionTime;
}

- (void)setLastGradualCorrectionTime:(double)a3
{
  self->_lastGradualCorrectionTime = a3;
}

- (int64_t)lastLoggedFailureReasons
{
  return self->_lastLoggedFailureReasons;
}

- (void)setLastLoggedFailureReasons:(int64_t)a3
{
  self->_lastLoggedFailureReasons = a3;
}

- (int64_t)failureLogCount
{
  return self->_failureLogCount;
}

- (void)setFailureLogCount:(int64_t)a3
{
  self->_failureLogCount = a3;
}

- (double)lastPoseOriginTimestamp
{
  return self->_lastPoseOriginTimestamp;
}

- (void)setLastPoseOriginTimestamp:(double)a3
{
  self->_lastPoseOriginTimestamp = a3;
}

- (double)firstRequestResultTimestamp
{
  return self->_firstRequestResultTimestamp;
}

- (void)setFirstRequestResultTimestamp:(double)a3
{
  self->_firstRequestResultTimestamp = a3;
}

- (__n128)lastLoggedVioPosition
{
  __n128 result = *(__n128 *)(a1 + 224);
  long long v3 = *(_OWORD *)(a1 + 240);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setLastLoggedVioPosition:(ARGeoTrackingTechniqueState *)self
{
  long long v3 = v2[1];
  *(_OWORD *)self->_lastLoggedVioPosition = *v2;
  *(_OWORD *)&self->_lastLoggedVioPosition[16] = v3;
}

- (double)lastLoggedVioTimestamp
{
  return self->_lastLoggedVioTimestamp;
}

- (void)setLastLoggedVioTimestamp:(double)a3
{
  self->_lastLoggedVioTimestamp = a3;
}

- (ARCircularArray)vioPoseCircularBuffer
{
  return self->_vioPoseCircularBuffer;
}

- (void)setVioPoseCircularBuffer:(id)a3
{
}

- (ARCircularArray)deviceMotionCircularBuffer
{
  return self->_deviceMotionCircularBuffer;
}

- (void)setDeviceMotionCircularBuffer:(id)a3
{
}

- (ARLocationData)lastLocationProcessedForFusion
{
  return self->_lastLocationProcessedForFusion;
}

- (void)setLastLocationProcessedForFusion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocationProcessedForFusion, 0);
  objc_storeStrong((id *)&self->_deviceMotionCircularBuffer, 0);
  objc_storeStrong((id *)&self->_vioPoseCircularBuffer, 0);
  objc_storeStrong((id *)&self->_resultDatas, 0);
  objc_storeStrong((id *)&self->_enuOrigin, 0);
  objc_storeStrong((id *)&self->_gradualCorrectionFilter, 0);
  objc_storeStrong((id *)&self->_consensusAverageFilter, 0);
  objc_storeStrong((id *)&self->_lastCLLocation, 0);
  objc_storeStrong((id *)&self->_lastCMDeviceMotion, 0);
  objc_storeStrong((id *)&self->_VLHandle, 0);
}

@end