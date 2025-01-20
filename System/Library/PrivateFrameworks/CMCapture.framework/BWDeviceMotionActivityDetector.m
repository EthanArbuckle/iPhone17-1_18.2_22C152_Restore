@interface BWDeviceMotionActivityDetector
+ (void)initialize;
- (BOOL)isDirectionalMotionDetectionEnabled;
- (BOOL)isStationary;
- (BWDeviceMotionActivityDetector)init;
- (void)_detectIfStationary;
- (void)dealloc;
- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setDirectionalMotionDetectionEnabled:(BOOL)a3;
@end

@implementation BWDeviceMotionActivityDetector

- (BOOL)isStationary
{
  pthread_mutex_lock((pthread_mutex_t *)self->_ringMutex);
  if (self->_newMotionDataAvailable)
  {
    -[BWDeviceMotionActivityDetector _detectIfStationary]((uint64_t)self);
    self->_newMotionDataAvailable = 0;
  }
  BOOL stationary = self->_stationary;
  pthread_mutex_unlock((pthread_mutex_t *)self->_ringMutex);
  return stationary;
}

- (void)_detectIfStationary
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  FigSimpleMutexCheckIsLockedOnThisThread();
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    goto LABEL_8;
  }
  uint64_t v2 = *(void *)(v2 + 8);
  if (!v2) {
    goto LABEL_8;
  }
  if ((*(_DWORD *)(v2 + 20) + *(_DWORD *)(v2 + 24) - *(_DWORD *)(v2 + 16)) % *(_DWORD *)(v2 + 24) < 2) {
    goto LABEL_7;
  }
  mach_absolute_time();
  double v3 = (double)(FigHostTimeToNanoseconds() / 1000) / 1000000.0;
  v4 = *(uint64_t **)(a1 + 8);
  if (v3 - *(double *)(-[BWRingBuffer lastElement](v4[1]) + 8) > 1.0
    || -[BWMotionSampleRingBuffer duration]((uint64_t)v4) < 0.5)
  {
    goto LABEL_7;
  }
  if (!*(unsigned char *)(a1 + 25))
  {
    LODWORD(v2) = *(unsigned char *)(a1 + 24) != 0;
    goto LABEL_8;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v13 = [v4 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (!v13)
  {
LABEL_7:
    LODWORD(v2) = 0;
    goto LABEL_8;
  }
  uint64_t v14 = v13;
  int v15 = 0;
  BOOL v16 = 0;
  uint64_t v17 = *(void *)v49;
  float v18 = 0.0;
  double v19 = 0.0;
  float v20 = 0.0;
  float v21 = 0.0;
  float v22 = 0.0;
  float v23 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v49 != v17) {
        objc_enumerationMutation(v4);
      }
      uint64_t v25 = *(void *)(*((void *)&v48 + 1) + 8 * i);
      double v26 = *(double *)(v25 + 8);
      long long v27 = *(_OWORD *)(v25 + 32);
      long long v46 = *(_OWORD *)(v25 + 16);
      long long v47 = v27;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      float v39 = 0.0;
      float32x2_t v38 = 0;
      if (v16)
      {
        long long v42 = v46;
        long long v43 = v47;
        long long v40 = v52;
        long long v41 = v53;
        *(void *)&long long v44 = FigMotionMultiplyByInverseOfQuaternion((double *)&v42, (uint64_t *)&v40);
        *((void *)&v44 + 1) = v28;
        *(void *)&long long v45 = v29;
        *((void *)&v45 + 1) = v30;
        *(float *)&double v31 = FigMotionRotationRateFromDeltaQuaternion((double *)&v44, &v38, v26 - v19);
        if (v32)
        {
          BOOL v16 = 1;
          continue;
        }
        float v33 = (float)((float)(v38.f32[0] * v38.f32[0]) + (float)(v38.f32[1] * v38.f32[1])) + (float)(v39 * v39);
        if (*(unsigned char *)(a1 + 26))
        {
          float v21 = v21 + v38.f32[0];
          float v20 = v20 + v38.f32[1];
          float v18 = v18 + v39;
        }
        else
        {
          float v34 = sqrtf(v33);
          if (v34 >= 0.1) {
            goto LABEL_7;
          }
          float v23 = v23 + v34;
        }
        float v22 = v22 + v33;
        ++v15;
        BOOL v16 = 1;
      }
      else
      {
        BOOL v16 = *(double *)(-[BWRingBuffer lastElement](*(void *)(*(void *)(a1 + 8) + 8)) + 8) - v26 < 1.0;
      }
      double v31 = *(double *)&v46;
      long long v52 = v46;
      long long v53 = v47;
      double v19 = v26;
    }
    uint64_t v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v48, v54, 16, v31);
  }
  while (v14);
  if (!v15) {
    goto LABEL_7;
  }
  float v35 = (float)v15;
  if (*(unsigned char *)(a1 + 26))
  {
    float v36 = (float)((float)(v18 / v35) * (float)(v18 / v35))
        + (float)((float)((float)(v20 / v35) * (float)(v20 / v35)) + (float)((float)(v21 / v35) * (float)(v21 / v35)));
    double v37 = (float)((float)(v22 / v35) - v36);
    if (v37 < 0.00004225)
    {
      if (!*(unsigned char *)(a1 + 28)) {
        goto LABEL_17;
      }
LABEL_10:
      uint64_t v5 = *(void *)(a1 + 8);
      if (v5)
      {
        v6 = (long long *)-[BWRingBuffer lastElement](*(void *)(v5 + 8));
        if (v6)
        {
          long long v7 = *v6;
          long long v8 = v6[1];
          *(_OWORD *)(a1 + 72) = v6[2];
          *(_OWORD *)(a1 + 56) = v8;
          *(_OWORD *)(a1 + 40) = v7;
        }
      }
LABEL_17:
      LOBYTE(v2) = 1;
      goto LABEL_43;
    }
    LODWORD(v2) = v36 < 0.00000625;
    if (v37 >= 0.000121) {
      LODWORD(v2) = 0;
    }
  }
  else
  {
    LODWORD(v2) = (float)(v23 / v35) < 0.005;
  }
LABEL_8:
  if (*(unsigned char *)(a1 + 28))
  {
    if (v2) {
      goto LABEL_10;
    }
    if (*(double *)(a1 + 48) == 0.0)
    {
      LOBYTE(v2) = 0;
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 8);
      if (v9)
      {
        uint64_t v10 = -[BWRingBuffer lastElement](*(void *)(v9 + 8));
        if (v10)
        {
          double v11 = FigMotionMultiplyByInverseOfQuaternion((double *)(v10 + 16), (uint64_t *)(a1 + 56));
          long double v12 = acos(v11);
          if ((v12 + v12) * 57.2957795 < *(double *)(a1 + 32)) {
            goto LABEL_17;
          }
        }
      }
      LOBYTE(v2) = 0;
      *(_OWORD *)(a1 + 56) = 0u;
      *(_OWORD *)(a1 + 72) = 0u;
      *(_OWORD *)(a1 + 40) = 0u;
    }
  }
LABEL_43:
  *(unsigned char *)(a1 + 24) = v2;
}

- (void)setDirectionalMotionDetectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  pthread_mutex_lock((pthread_mutex_t *)self->_ringMutex);
  if (self->_directionalMotionDetectionEnabled != v3)
  {
    self->_directionalMotionDetectionEnabled = v3;
    self->_directionalMotionDetectionAngularRotationThreshold = 2.0;
    *(_OWORD *)&self->_directionalMotionDetectionReferenceDirection.doingBiasEstimation = 0u;
    *(_OWORD *)&self->_directionalMotionDetectionReferenceDirection.quaternion.w = 0u;
    *(_OWORD *)&self->_directionalMotionDetectionReferenceDirection.quaternion.y = 0u;
  }
  ringMutex = self->_ringMutex;
  pthread_mutex_unlock((pthread_mutex_t *)ringMutex);
}

- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F53F90]];
    bzero(v9, 0x14A0uLL);
    int v8 = 0;
    if (v6)
    {
      if (FigMotionGetMotionDataFromISP((CFDictionaryRef)v5, v9, 0, 110, &v8, 0, 0, 0, 0))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      else
      {
        if (!self->_motionMetadataStatusChecked)
        {
          self->_motionMetadataStatusChecked = 1;
          self->_robustMethodEnabled = [v5 objectForKey:*MEMORY[0x1E4F53F98]] != 0;
        }
        pthread_mutex_lock((pthread_mutex_t *)self->_ringMutex);
        int v7 = v8;
        if (v8)
        {
          self->_newMotionDataAvailable = 1;
          -[BWMotionSampleRingBuffer addMotionDataToRingBuffer:withSampleCount:]((uint64_t)self->_motionDataRingBuffer, v9[0].f64, v7);
        }
        pthread_mutex_unlock((pthread_mutex_t *)self->_ringMutex);
      }
    }
  }
}

- (BWDeviceMotionActivityDetector)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWDeviceMotionActivityDetector;
  uint64_t v2 = [(BWDeviceMotionActivityDetector *)&v5 init];
  if (v2)
  {
    v2->_ringMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    BOOL v3 = (BWMotionSampleRingBuffer *)-[BWMotionSampleRingBuffer initWithMaxDuration:]([BWMotionSampleRingBuffer alloc], 1.0);
    v2->_motionDataRingBuffer = v3;
    if (!v3)
    {

      return 0;
    }
  }
  return v2;
}

+ (void)initialize
{
}

- (void)dealloc
{
  FigSimpleMutexDestroy();

  v3.receiver = self;
  v3.super_class = (Class)BWDeviceMotionActivityDetector;
  [(BWDeviceMotionActivityDetector *)&v3 dealloc];
}

- (BOOL)isDirectionalMotionDetectionEnabled
{
  pthread_mutex_lock((pthread_mutex_t *)self->_ringMutex);
  BOOL directionalMotionDetectionEnabled = self->_directionalMotionDetectionEnabled;
  pthread_mutex_unlock((pthread_mutex_t *)self->_ringMutex);
  return directionalMotionDetectionEnabled;
}

@end