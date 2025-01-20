@interface BWZoomCommandHandler
+ (void)initialize;
- (BWZoomCommandHandler)init;
- (BWZoomCompletionDelegate)zoomCompletionDelegate;
- (BWZoomCompletionDelegate)zoomCompletionDelegateForStereoAudio;
- (float)_applyFudgeToZoomFactor:(uint64_t)a1;
- (float)_removeFudgeFromZoomFactor:(uint64_t)a1;
- (float)_updateZoomModelForNextFrameWithPTS:(uint64_t)a1;
- (float)_zoomFactorForDurationBasedRampAtPTS:(int)a3 updateCurrentZoomRampState:;
- (float)_zoomFactorForRampAtPTS:(int)a3 updateCurrentZoomRampState:;
- (float)_zoomFactorForRateBasedRampAtPTS:(int)a3 updateCurrentZoomRampState:;
- (float)_zoomFactorForSpringBasedRampAtPTS:(int)a3 updateCurrentZoomRampState:;
- (float)allowableMinimumDigitalZoomFactorDuringZoomOut;
- (float)appliedZoomFactor;
- (float)appliedZoomFactorWithoutFudge;
- (float)applyFudgeToZoomFactor:(float)a3;
- (float)earlySwitchOverScaleFactorForZoomIn;
- (float)predictRampZoomFactorAfterNumberOfFrames:(int)a3 settingZoomFactorOfInterest:(float)a4;
- (float)rampTargetZoomFactor;
- (float)rampZoomFactorOfInterest;
- (float)removeFudgeFromZoomFactor:(float)a3;
- (float)requestedZoomFactor;
- (float)requestedZoomFactorWithoutFudge;
- (float)updateZoomModelAndAppliedZoomFactorForNextFrameWithPTS:(id *)a3 captureID:(int)a4 delayedISPAppliedZoomFactor:(float)a5;
- (float)updateZoomModelForNextFrameWithPTS:(id *)a3 captureID:(int)a4;
- (int)rampTuning;
- (int64_t)timeForLastRequestedZoomFactor;
- (uint64_t)_updateAppliedZoomFactorForDelayedISPAppliedZoomFactor:(float)a3 zoomFactorChangedOut:;
- (void)dealloc;
- (void)rampToVideoZoomFactor:(float)a3 usingSpringWithTension:(float)a4 friction:(float)a5 snapFraction:(float)a6 rampTuning:(int)a7 earlySwitchOverScaleFactorForZoomIn:(float)a8 allowableMinimumDigitalZoomFactorDuringZoomOut:(float)a9 rampStartFrameDelayAt30fps:(int)a10 commandID:(int)a11;
- (void)rampToVideoZoomFactor:(float)a3 withRampType:(int)a4 rate:(float)a5 duration:(double)a6 snapToTargetZoomFactorWithinRampFraction:(float)a7 rampTuning:(int)a8 earlySwitchOverScaleFactorForZoomIn:(float)a9 allowableMinimumDigitalZoomFactorDuringZoomOut:(float)a10 commandID:(int)a11;
- (void)reset;
- (void)resetZoomFactorOfInterest;
- (void)setFudgedZoomRanges:(id)a3;
- (void)setRequestedZoomFactor:(float)a3;
- (void)setTypicalISPZoomDelay:(unsigned int)a3 maxISPZoomDelay:(unsigned int)a4 clientCanCompensateForDelay:(BOOL)a5;
- (void)setZoomCompletionDelegate:(id)a3;
- (void)setZoomCompletionDelegateForStereoAudio:(id)a3;
- (void)updateAppliedZoomFactorForDelayedISPAppliedZoomFactor:(float)a3;
- (void)updateISPZoomDelay:(unsigned int)a3;
@end

@implementation BWZoomCommandHandler

- (void)setZoomCompletionDelegate:(id)a3
{
  self->_zoomCompletionDelegate = (BWZoomCompletionDelegate *)a3;
}

- (BWZoomCommandHandler)init
{
  v11.receiver = self;
  v11.super_class = (Class)BWZoomCommandHandler;
  result = [(BWZoomCommandHandler *)&v11 init];
  if (result)
  {
    v3 = (long long *)MEMORY[0x1E4F1F9F8];
    __asm { FMOV            V0.2S, #1.0 }
    *(void *)&result->_appliedZoomFactor = _D0;
    long long v9 = *v3;
    *(_OWORD *)&result->_rampStartTime.value = *v3;
    int64_t v10 = *((void *)v3 + 2);
    result->_rampStartTime.epoch = v10;
    result->_rampTargetFactor = 1.0;
    *(void *)&result->_rampAcceleration = 0x3F80000041700000;
    *(_OWORD *)&result->_lastFramePTSes[0].value = v9;
    result->_lastFramePTSes[0].epoch = v10;
    *(_OWORD *)&result->_lastFramePTSes[1].value = v9;
    result->_lastFramePTSes[1].epoch = v10;
    result->_zoomLock._os_unfair_lock_opaque = 0;
    *(void *)&result->_earlySwitchOverScaleFactorForZoomIn = _D0;
    result->_lastFrameCaptureID = -1;
  }
  return result;
}

- (float)appliedZoomFactor
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  float v4 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:]((uint64_t)self, self->_appliedZoomFactor);
  os_unfair_lock_unlock(p_zoomLock);
  return v4;
}

- (float)requestedZoomFactor
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  float v4 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:]((uint64_t)self, self->_lastRequestedZoomFactor);
  os_unfair_lock_unlock(p_zoomLock);
  return v4;
}

- (float)_applyFudgeToZoomFactor:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0.0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = *(void **)(a1 + 208);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v8 lowerBound];
        if (v9 <= a2)
        {
          [v8 upperBound];
          if (*(float *)&v10 >= a2)
          {
            *(float *)&double v10 = a2;
            [v8 applyFudgeToZoomFactor:v10];
            return v11;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  return a2;
}

- (float)earlySwitchOverScaleFactorForZoomIn
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  float earlySwitchOverScaleFactorForZoomIn = self->_earlySwitchOverScaleFactorForZoomIn;
  os_unfair_lock_unlock(p_zoomLock);
  return earlySwitchOverScaleFactorForZoomIn;
}

- (float)rampTargetZoomFactor
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  if (self->_rampCommandID) {
    float v4 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:]((uint64_t)self, self->_rampTargetFactor);
  }
  else {
    float v4 = 0.0;
  }
  os_unfair_lock_unlock(p_zoomLock);
  return v4;
}

- (int)rampTuning
{
  v2 = self;
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  LODWORD(v2) = v2->_rampTuning;
  os_unfair_lock_unlock(p_zoomLock);
  return (int)v2;
}

- (float)allowableMinimumDigitalZoomFactorDuringZoomOut
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  float allowableMinimumDigitalZoomFactorDuringZoomOut = self->_allowableMinimumDigitalZoomFactorDuringZoomOut;
  os_unfair_lock_unlock(p_zoomLock);
  return allowableMinimumDigitalZoomFactorDuringZoomOut;
}

- (float)applyFudgeToZoomFactor:(float)a3
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  float v6 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:]((uint64_t)self, a3);
  os_unfair_lock_unlock(p_zoomLock);
  return v6;
}

- (float)appliedZoomFactorWithoutFudge
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  float appliedZoomFactor = self->_appliedZoomFactor;
  os_unfair_lock_unlock(p_zoomLock);
  return appliedZoomFactor;
}

- (void)setFudgedZoomRanges:(id)a3
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);

  self->_fudgedZoomRanges = (NSArray *)[a3 copy];
  os_unfair_lock_unlock(p_zoomLock);
}

- (float)rampZoomFactorOfInterest
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  float rampZoomFactorOfInterest = self->_rampZoomFactorOfInterest;
  os_unfair_lock_unlock(p_zoomLock);
  return rampZoomFactorOfInterest;
}

- (float)predictRampZoomFactorAfterNumberOfFrames:(int)a3 settingZoomFactorOfInterest:(float)a4
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  BOOL v8 = self->_rampTargetVelocity != 0.0 || self->_rampCurrentVelocity != 0.0 || self->_rampCommandID != 0;
  if (self->_lastFramePTSes[0].flags) {
    unsigned int v9 = self->_lastFramePTSes[1].flags & 1;
  }
  else {
    unsigned int v9 = 0;
  }
  if ((v9 & v8) == 0)
  {
    float v11 = 0.0;
    goto LABEL_18;
  }
  memset(&v20, 0, sizeof(v20));
  CMTime lhs = (CMTime)self->_lastFramePTSes[0];
  $95D729B680665BEAEFA1D6FCA8238556 v16 = self->_lastFramePTSes[1];
  CMTimeSubtract(&time, &lhs, (CMTime *)&v16);
  CMTimeMultiply(&rhs, &time, a3);
  CMTime lhs = (CMTime)self->_lastFramePTSes[0];
  CMTimeAdd(&v20, &lhs, &rhs);
  CMTime lhs = v20;
  float v10 = -[BWZoomCommandHandler _zoomFactorForRampAtPTS:updateCurrentZoomRampState:]((uint64_t)self, (uint64_t)&lhs, 0);
  float v11 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:]((uint64_t)self, v10);
  if (a4 != 0.0 && self->_rampZoomFactorOfInterest == 0.0)
  {
    float rampStartFactor = self->_rampStartFactor;
    float rampTargetFactor = self->_rampTargetFactor;
    float v14 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:]((uint64_t)self, self->_lastRequestedZoomFactor);
    if (rampStartFactor < rampTargetFactor)
    {
      if (v14 >= a4 || v11 < a4) {
        goto LABEL_18;
      }
LABEL_17:
      self->_float rampZoomFactorOfInterest = a4;
      goto LABEL_18;
    }
    if (v14 > a4 && v11 <= a4) {
      goto LABEL_17;
    }
  }
LABEL_18:
  os_unfair_lock_unlock(p_zoomLock);
  return v11;
}

- (void)updateAppliedZoomFactorForDelayedISPAppliedZoomFactor:(float)a3
{
  BOOL v10 = 0;
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  -[BWZoomCommandHandler _updateAppliedZoomFactorForDelayedISPAppliedZoomFactor:zoomFactorChangedOut:]((uint64_t)self, &v10, a3);
  unint64_t v7 = v6;
  os_unfair_lock_unlock(p_zoomLock);
  if (v10)
  {
    zoomCompletionDelegate = self->_zoomCompletionDelegate;
    [(BWZoomCommandHandler *)self appliedZoomFactor];
    -[BWZoomCompletionDelegate zoomCommandHandler:didApplyZoomFactor:zoomFactorWithoutFudge:targetZoomFactor:rampComplete:rampCommandID:](zoomCompletionDelegate, "zoomCommandHandler:didApplyZoomFactor:zoomFactorWithoutFudge:targetZoomFactor:rampComplete:rampCommandID:", self, HIDWORD(v7) & 1, v7);
    zoomCompletionDelegateForStereoAudio = self->_zoomCompletionDelegateForStereoAudio;
    [(BWZoomCommandHandler *)self appliedZoomFactor];
    -[BWZoomCompletionDelegate zoomCommandHandler:didApplyZoomFactor:zoomFactorWithoutFudge:targetZoomFactor:rampComplete:rampCommandID:](zoomCompletionDelegateForStereoAudio, "zoomCommandHandler:didApplyZoomFactor:zoomFactorWithoutFudge:targetZoomFactor:rampComplete:rampCommandID:", self, HIDWORD(v7) & 1, v7);
  }
}

- (float)updateZoomModelForNextFrameWithPTS:(id *)a3 captureID:(int)a4
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  if (!self
    || a4 == -1
    || (int lastFrameCaptureID = self->_lastFrameCaptureID,
        BOOL v9 = __OFSUB__(lastFrameCaptureID, a4),
        int v10 = lastFrameCaptureID - a4,
        (v10 < 0) ^ v9)
    || (float v11 = 0.0, v10 >= 1000))
  {
    long long v13 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    float v11 = -[BWZoomCommandHandler _updateZoomModelForNextFrameWithPTS:]((uint64_t)self, &v13);
    self->_int lastFrameCaptureID = a4;
  }
  os_unfair_lock_unlock(p_zoomLock);
  return v11;
}

- (float)updateZoomModelAndAppliedZoomFactorForNextFrameWithPTS:(id *)a3 captureID:(int)a4 delayedISPAppliedZoomFactor:(float)a5
{
  BOOL v21 = 0;
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  if (!self
    || a4 == -1
    || (int lastFrameCaptureID = self->_lastFrameCaptureID,
        BOOL v11 = __OFSUB__(lastFrameCaptureID, a4),
        int v12 = lastFrameCaptureID - a4,
        (v12 < 0) ^ v11)
    || v12 >= 1000)
  {
    long long v19 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    float v14 = -[BWZoomCommandHandler _updateZoomModelForNextFrameWithPTS:]((uint64_t)self, &v19);
    -[BWZoomCommandHandler _updateAppliedZoomFactorForDelayedISPAppliedZoomFactor:zoomFactorChangedOut:]((uint64_t)self, &v21, a5);
    unint64_t v13 = v15;
    self->_int lastFrameCaptureID = a4;
  }
  else
  {
    unint64_t v13 = 0;
    float v14 = 0.0;
  }
  os_unfair_lock_unlock(p_zoomLock);
  if (v21)
  {
    zoomCompletionDelegate = self->_zoomCompletionDelegate;
    [(BWZoomCommandHandler *)self appliedZoomFactor];
    -[BWZoomCompletionDelegate zoomCommandHandler:didApplyZoomFactor:zoomFactorWithoutFudge:targetZoomFactor:rampComplete:rampCommandID:](zoomCompletionDelegate, "zoomCommandHandler:didApplyZoomFactor:zoomFactorWithoutFudge:targetZoomFactor:rampComplete:rampCommandID:", self, HIDWORD(v13) & 1, v13);
    zoomCompletionDelegateForStereoAudio = self->_zoomCompletionDelegateForStereoAudio;
    [(BWZoomCommandHandler *)self appliedZoomFactor];
    -[BWZoomCompletionDelegate zoomCommandHandler:didApplyZoomFactor:zoomFactorWithoutFudge:targetZoomFactor:rampComplete:rampCommandID:](zoomCompletionDelegateForStereoAudio, "zoomCommandHandler:didApplyZoomFactor:zoomFactorWithoutFudge:targetZoomFactor:rampComplete:rampCommandID:", self, HIDWORD(v13) & 1, v13);
  }
  return v14;
}

- (float)_updateZoomModelForNextFrameWithPTS:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a1 + 56);
  *(void *)(a1 + 96) = *(void *)(a1 + 72);
  uint64_t v3 = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 56) = *a2;
  *(void *)(a1 + 72) = v3;
  if (*(float *)(a1 + 160) == 0.0
    && *(float *)(a1 + 196) == 0.0
    && *(double *)(a1 + 184) == 0.0
    && !*(_DWORD *)(a1 + 164))
  {
    uint64_t v5 = 0;
  }
  else
  {
    long long v16 = *a2;
    uint64_t v17 = *((void *)a2 + 2);
    float v4 = -[BWZoomCommandHandler _zoomFactorForRampAtPTS:updateCurrentZoomRampState:](a1, (uint64_t)&v16, 1);
    if (v4 >= 1.0 && v4 != *(float *)(a1 + 16))
    {
      *(float *)(a1 + 16) = v4;
      *(unsigned char *)(a1 + 20) = 0;
      *(void *)(a1 + 112) = FigGetUpTimeNanoseconds() / 0xF4240uLL;
    }
    uint64_t v5 = *(unsigned int *)(a1 + 164);
    if (v4 == *(float *)(a1 + 156) || *(float *)(a1 + 160) == 0.0 && *(float *)(a1 + 196) == 0.0)
    {
      v5 |= 0x100000000uLL;
      *(void *)(a1 + 160) = 0;
      *(_DWORD *)(a1 + 196) = 0;
      *(void *)(a1 + 184) = 0;
      *(_DWORD *)(a1 + 176) = 0;
      __asm { FMOV            V0.2S, #1.0 }
      *(void *)(a1 + 240) = _D0;
      *(_DWORD *)(a1 + 248) = 0;
    }
    else if (!*(unsigned char *)(a1 + 168))
    {
      if (*(unsigned char *)(a1 + 32))
      {
        uint64_t v15 = *(void *)(a1 + 24);
        if (v15) {
          *(_DWORD *)(v15 + 32) = 1;
        }
      }
      *(unsigned char *)(a1 + 168) = 1;
    }
  }
  unsigned int v11 = *(_DWORD *)(a1 + 16);
  uint64_t v12 = *(unsigned int *)(a1 + 156);
  float v13 = 0.0;
  if (!*(unsigned char *)(a1 + 20))
  {
    float v13 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:](a1, *(float *)(a1 + 16));
    *(unsigned char *)(a1 + 20) = 1;
  }
  [(BWZoomDelayBuffer *)*(void *)(a1 + 24) addZoomRequest:v5];
  return v13;
}

- (uint64_t)_updateAppliedZoomFactorForDelayedISPAppliedZoomFactor:(float)a3 zoomFactorChangedOut:
{
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)(result + 24);
    result = -[BWZoomDelayBuffer zoomRequestForISPAppliedZoomFactor:earlySwitchOverScaleFactorForZoomIn:](v5, a3, *(float *)(result + 240));
    float v7 = *(float *)(v4 + 12);
    if (v7 != *(float *)&result) {
      *(_DWORD *)(v4 + 12) = result;
    }
    if (!v6 && *(float *)(v4 + 196) == 0.0 && *(float *)(v4 + 160) == 0.0 && *(unsigned char *)(v4 + 168))
    {
      if (v5 && *(unsigned char *)(v4 + 32)) {
        *(_DWORD *)(v5 + 32) = 0;
      }
      *(unsigned char *)(v4 + 168) = 0;
    }
    if (a2) {
      *a2 = v7 != *(float *)&result;
    }
  }
  return result;
}

- (void)setRequestedZoomFactor:(float)a3
{
  if (a3 >= 1.0) {
    float v4 = a3;
  }
  else {
    float v4 = 1.0;
  }
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  if (v4 != self->_lastRequestedZoomFactor)
  {
    self->_lastRequestedZoomFactor = v4;
    self->_zoomFactorServiced = 0;
    self->_timeForLastRequestedZoomFactor = FigGetUpTimeNanoseconds() / 0xF4240uLL;
  }
  if (self->_rampTargetVelocity != 0.0 || self->_rampCurrentVelocity != 0.0)
  {
    *(void *)&self->_rampTargetVelocity = 0;
    self->_rampCurrentVelocity = 0.0;
    self->_float rampZoomFactorOfInterest = 0.0;
  }
  os_unfair_lock_unlock(p_zoomLock);
}

- (void)setTypicalISPZoomDelay:(unsigned int)a3 maxISPZoomDelay:(unsigned int)a4 clientCanCompensateForDelay:(BOOL)a5
{
  BOOL v5 = a5;
  self->_clientCanCompensateForDelay = a5;
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  BOOL v10 = self->_rampTargetVelocity != 0.0 || self->_rampCurrentVelocity != 0.0;
  self->_int rampActive = v10;

  unsigned int v11 = (BWZoomDelayBuffer *)-[BWZoomDelayBuffer initWithMaxZoomDelay:currentZoomDelay:]([BWZoomDelayBuffer alloc], a4, a3);
  self->_zoomDelayBuffer = v11;
  if (v5)
  {
    if (!v11) {
      goto LABEL_10;
    }
    int rampActive = self->_rampActive;
  }
  else
  {
    if (!v11) {
      goto LABEL_10;
    }
    int rampActive = 2 * (a3 != 0);
  }
  v11->_operatingMode = rampActive;
LABEL_10:
  os_unfair_lock_unlock(p_zoomLock);
}

- (void)reset
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);

  self->_zoomDelayBuffer = (BWZoomDelayBuffer *)-[BWZoomDelayBuffer initWithMaxZoomDelay:currentZoomDelay:]([BWZoomDelayBuffer alloc], 0, 0);
  self->_int lastFrameCaptureID = -1;
  os_unfair_lock_unlock(p_zoomLock);
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWZoomCommandHandler;
  [(BWZoomCommandHandler *)&v3 dealloc];
}

- (float)requestedZoomFactorWithoutFudge
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  float lastRequestedZoomFactor = self->_lastRequestedZoomFactor;
  os_unfair_lock_unlock(p_zoomLock);
  return lastRequestedZoomFactor;
}

- (float)removeFudgeFromZoomFactor:(float)a3
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  float v6 = -[BWZoomCommandHandler _removeFudgeFromZoomFactor:]((uint64_t)self, a3);
  os_unfair_lock_unlock(p_zoomLock);
  return v6;
}

- (float)_removeFudgeFromZoomFactor:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  float v2 = 0.0;
  if (a1)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    float v4 = *(void **)(a1 + 208);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          BOOL v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          [v9 fudgedLowerBound];
          if (v10 <= a2)
          {
            [v9 fudgedUpperBound];
            if (*(float *)&v11 >= a2)
            {
              *(float *)&double v11 = a2;
              [v9 removeFudgeFromZoomFactor:v11];
              return v12;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  return v2;
}

- (void)rampToVideoZoomFactor:(float)a3 withRampType:(int)a4 rate:(float)a5 duration:(double)a6 snapToTargetZoomFactorWithinRampFraction:(float)a7 rampTuning:(int)a8 earlySwitchOverScaleFactorForZoomIn:(float)a9 allowableMinimumDigitalZoomFactorDuringZoomOut:(float)a10 commandID:(int)a11
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  self->_rampStartTime = self->_lastFramePTSes[0];
  float lastRequestedZoomFactor = self->_lastRequestedZoomFactor;
  float rampCurrentVelocity = self->_rampCurrentVelocity;
  self->_float rampStartFactor = lastRequestedZoomFactor;
  self->_rampStartVelocity = rampCurrentVelocity;
  self->_float rampTargetFactor = a3;
  self->_rampCommandID = a11;
  self->_float rampZoomFactorOfInterest = 0.0;
  self->_rampType = a4;
  self->_rampTuning = a8;
  self->_float earlySwitchOverScaleFactorForZoomIn = a9;
  self->_float allowableMinimumDigitalZoomFactorDuringZoomOut = a10;
  switch(a4)
  {
    case 3:
      self->_rampTargetVelocity = 0.0;
      self->_rampDuration = a6;
      self->_rampSnapFraction = a7;
      *(int8x8_t *)&self->_springRampTension = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(lastRequestedZoomFactor < a3), 0x1FuLL)), (int8x8_t)0x41A8000042B80000, (int8x8_t)0x41B8000043070000);
      self->_springRampStartFrameDelayAt30fps = 1;
      break;
    case 2:
      self->_rampTargetVelocity = 0.0;
      self->_rampDuration = a6;
      self->_rampSnapFraction = a7;
      break;
    case 1:
      float v24 = fabsf(a5);
      if (lastRequestedZoomFactor >= a3) {
        float v25 = -v24;
      }
      else {
        float v25 = v24;
      }
      self->_rampTargetVelocity = v25;
      self->_rampDuration = 0.0;
      self->_rampSnapFraction = 0.0;
      break;
  }
  os_unfair_lock_unlock(p_zoomLock);
}

- (void)rampToVideoZoomFactor:(float)a3 usingSpringWithTension:(float)a4 friction:(float)a5 snapFraction:(float)a6 rampTuning:(int)a7 earlySwitchOverScaleFactorForZoomIn:(float)a8 allowableMinimumDigitalZoomFactorDuringZoomOut:(float)a9 rampStartFrameDelayAt30fps:(int)a10 commandID:(int)a11
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  self->_rampStartTime = self->_lastFramePTSes[0];
  float rampCurrentVelocity = self->_rampCurrentVelocity;
  self->_float rampStartFactor = self->_lastRequestedZoomFactor;
  self->_rampStartVelocity = rampCurrentVelocity;
  self->_float rampTargetFactor = a3;
  self->_float rampZoomFactorOfInterest = 0.0;
  self->_rampType = 3;
  self->_rampTuning = a7;
  self->_rampTargetVelocity = 0.0;
  self->_rampCommandID = a11;
  self->_rampSnapFraction = a6;
  self->_springRampTension = a4;
  self->_springRampFriction = a5;
  self->_float earlySwitchOverScaleFactorForZoomIn = a8;
  self->_float allowableMinimumDigitalZoomFactorDuringZoomOut = a9;
  self->_springRampStartFrameDelayAt30fps = a10;
  os_unfair_lock_unlock(p_zoomLock);
}

- (void)updateISPZoomDelay:(unsigned int)a3
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  -[BWZoomDelayBuffer updateZoomDelay:]((uint64_t)self->_zoomDelayBuffer, a3);
  os_unfair_lock_unlock(p_zoomLock);
}

- (float)_zoomFactorForRampAtPTS:(int)a3 updateCurrentZoomRampState:
{
  float v3 = 0.0;
  if (a1)
  {
    if (*(unsigned char *)(a2 + 12))
    {
      CMTime time1 = *(CMTime *)a2;
      CMTime v10 = *(CMTime *)(a1 + 120);
      if (CMTimeCompare(&time1, &v10) >= 1)
      {
        int v7 = *(_DWORD *)(a1 + 172);
        switch(v7)
        {
          case 1:
            CMTime time1 = *(CMTime *)a2;
            return -[BWZoomCommandHandler _zoomFactorForRateBasedRampAtPTS:updateCurrentZoomRampState:](a1, &time1, a3);
          case 3:
            CMTime time1 = *(CMTime *)a2;
            return -[BWZoomCommandHandler _zoomFactorForSpringBasedRampAtPTS:updateCurrentZoomRampState:](a1, &time1, a3);
          case 2:
            CMTime time1 = *(CMTime *)a2;
            return -[BWZoomCommandHandler _zoomFactorForDurationBasedRampAtPTS:updateCurrentZoomRampState:](a1, &time1, a3);
        }
      }
    }
  }
  return v3;
}

- (void)resetZoomFactorOfInterest
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  self->_float rampZoomFactorOfInterest = 0.0;
  os_unfair_lock_unlock(p_zoomLock);
}

- (int64_t)timeForLastRequestedZoomFactor
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  int64_t timeForLastRequestedZoomFactor = self->_timeForLastRequestedZoomFactor;
  os_unfair_lock_unlock(p_zoomLock);
  return timeForLastRequestedZoomFactor;
}

- (float)_zoomFactorForDurationBasedRampAtPTS:(int)a3 updateCurrentZoomRampState:
{
  if (!a1) {
    return 0.0;
  }
  CMTime lhs = *a2;
  CMTime v16 = *(CMTime *)(a1 + 120);
  CMTimeSubtract(&time, &lhs, &v16);
  float Seconds = CMTimeGetSeconds(&time);
  float v6 = 1.0 - pow(0.00499999523, Seconds / *(double *)(a1 + 184));
  float v7 = *(float *)(a1 + 148);
  float v8 = *(float *)(a1 + 156);
  if (v7 < v8) {
    int v9 = -1;
  }
  else {
    int v9 = v7 > v8;
  }
  if ((float)(1.0 - *(float *)(a1 + 192)) <= v6) {
    float v10 = *(float *)(a1 + 156);
  }
  else {
    float v10 = v7 + (float)(v6 * (float)(v8 - v7));
  }
  if (Seconds != 0.0 && a3 != 0)
  {
    float v12 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:](a1, v10);
    float v13 = *(float *)(a1 + 200);
    if (v13 != 0.0)
    {
      BOOL v14 = v7 < v8;
      if (v12 >= v13) {
        BOOL v14 = v9 == v12 > v13;
      }
      if (!v14) {
        *(_DWORD *)(a1 + 200) = 0;
      }
    }
    *(float *)(a1 + 196) = log2f(vabds_f32(*(float *)(a1 + 148), v10) / Seconds) * (float)-v9;
  }
  return v10;
}

- (float)_zoomFactorForRateBasedRampAtPTS:(int)a3 updateCurrentZoomRampState:
{
  if (!a1) {
    return 0.0;
  }
  CMTime lhs = *a2;
  CMTime v27 = *(CMTime *)(a1 + 120);
  CMTimeSubtract(&time, &lhs, &v27);
  float Seconds = CMTimeGetSeconds(&time);
  float v7 = *(float *)(a1 + 156);
  float v6 = *(float *)(a1 + 160);
  float v9 = *(float *)(a1 + 148);
  float v8 = *(float *)(a1 + 152);
  BOOL v10 = v8 < v6;
  int v11 = v8 > v6;
  if (v8 < v6) {
    int v11 = -1;
  }
  float v12 = *(float *)(a1 + 144);
  if (v11 >= 1) {
    float v12 = -v12;
  }
  float v13 = v8 + (float)(v12 * Seconds);
  BOOL v14 = v11 == v13 > v6;
  if (v13 >= v6) {
    BOOL v10 = v14;
  }
  if (v9 < v7) {
    int v15 = -1;
  }
  else {
    int v15 = v9 > v7;
  }
  float v16 = (float)(v6 * (float)(1.0 - (float)((float)((float)(v6 - v8) / v12) / Seconds)))
      + (float)((float)((float)(v8 + v6) * 0.5) * (float)((float)((float)(v6 - v8) / v12) / Seconds));
  float v17 = (float)(v8 + v13) * 0.5;
  if (v10)
  {
    float v18 = v13;
  }
  else
  {
    float v17 = v16;
    float v18 = *(float *)(a1 + 160);
  }
  float v19 = v17 * 0.693147181 * Seconds;
  float v20 = v9 * expf(v19);
  if (v20 < 1.0) {
    float v20 = 1.0;
  }
  BOOL v21 = v15 == v20 > v7;
  if (v20 < v7) {
    BOOL v21 = v9 < v7;
  }
  if (v21) {
    float v22 = v20;
  }
  else {
    float v22 = v7;
  }
  if (a3)
  {
    float v23 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:](a1, v22);
    float v24 = *(float *)(a1 + 200);
    if (v24 != 0.0)
    {
      BOOL v25 = v9 < v7;
      if (v23 >= v24) {
        BOOL v25 = v15 == v23 > v24;
      }
      if (!v25) {
        *(_DWORD *)(a1 + 200) = 0;
      }
    }
    *(float *)(a1 + 196) = v18;
  }
  return v22;
}

- (float)_zoomFactorForSpringBasedRampAtPTS:(int)a3 updateCurrentZoomRampState:
{
  if (!a1) {
    return 0.0;
  }
  CMTime lhs = *a2;
  CMTime v22 = *(CMTime *)(a1 + 120);
  CMTimeSubtract(&time, &lhs, &v22);
  float Seconds = CMTimeGetSeconds(&time);
  float v6 = *(float *)(a1 + 156);
  float v7 = *(float *)(a1 + 148);
  if (v7 < v6) {
    int v8 = -1;
  }
  else {
    int v8 = v7 > v6;
  }
  double v9 = (float)(*(float *)(a1 + 152) * (float)-v8);
  BOOL v10 = objc_alloc_init(BWSpringSimulation);
  [(BWSpringSimulation *)v10 setTension:*(float *)(a1 + 232)];
  [(BWSpringSimulation *)v10 setFriction:*(float *)(a1 + 236)];
  [(BWSpringSimulation *)v10 resetWithInput:1.0 initialOutput:0.0 initialVelocity:v9 convergedSpeed:0.001];
  int v11 = FigCaptureRoundFloatToMultipleOf(1, Seconds * 60.0);
  int v12 = *(_DWORD *)(a1 + 248);
  if (((2 * v12) | 1) <= v11)
  {
    int v13 = v11 - 2 * v12;
    while (1)
    {
      [(BWSpringSimulation *)v10 update];
      if (*(float *)(a1 + 192) > 0.0)
      {
        [(BWSpringSimulation *)v10 output];
        if (v14 >= 1.0 - *(float *)(a1 + 192)) {
          break;
        }
      }
      if (!--v13) {
        goto LABEL_10;
      }
    }
LABEL_11:
    float v15 = *(float *)(a1 + 156);
    if (!a3) {
      goto LABEL_22;
    }
LABEL_14:
    if (Seconds != 0.0)
    {
      float v17 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:](a1, v15);
      float v18 = *(float *)(a1 + 200);
      if (v18 != 0.0)
      {
        if (v17 >= v18) {
          BOOL v19 = v8 == v17 > v18;
        }
        else {
          BOOL v19 = v7 < v6;
        }
        if (!v19) {
          *(_DWORD *)(a1 + 200) = 0;
        }
      }
      [(BWSpringSimulation *)v10 velocity];
      *(float *)&double v20 = v20 * (double)-v8;
      *(_DWORD *)(a1 + 196) = LODWORD(v20);
    }
    goto LABEL_22;
  }
LABEL_10:
  if ([(BWSpringSimulation *)v10 isCompleted]) {
    goto LABEL_11;
  }
  [(BWSpringSimulation *)v10 output];
  *(float *)&double v16 = v16;
  float v15 = *(float *)(a1 + 148) + (float)(*(float *)&v16 * (float)(*(float *)(a1 + 156) - *(float *)(a1 + 148)));
  if (a3) {
    goto LABEL_14;
  }
LABEL_22:

  return v15;
}

- (BWZoomCompletionDelegate)zoomCompletionDelegate
{
  return self->_zoomCompletionDelegate;
}

- (BWZoomCompletionDelegate)zoomCompletionDelegateForStereoAudio
{
  return self->_zoomCompletionDelegateForStereoAudio;
}

- (void)setZoomCompletionDelegateForStereoAudio:(id)a3
{
  self->_zoomCompletionDelegateForStereoAudio = (BWZoomCompletionDelegate *)a3;
}

@end