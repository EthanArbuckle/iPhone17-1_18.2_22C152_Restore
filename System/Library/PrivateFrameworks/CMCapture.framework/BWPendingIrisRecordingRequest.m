@interface BWPendingIrisRecordingRequest
+ (id)irisRecordingRequestWithFigCaptureMovieFileRecordingSettings:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)momentCaptureMovieRecordingMasterEndTime;
- (BOOL)isEmpty;
- (BOOL)isPairedRequestCreated;
- (BWIrisMovieInfo)irisMovieInfo;
- (FigCaptureMovieFileRecordingSettings)settings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)enqueuedHostTime;
- (void)_initWithFigCaptureMovieFileRecordingSettings:(void *)a1;
- (void)dealloc;
- (void)setEnqueuedHostTime:(int64_t)a3;
- (void)setIrisMovieInfo:(id)a3;
- (void)setMomentCaptureMovieRecordingMasterEndTime:(id *)a3;
- (void)setPairedRequestCreated:(BOOL)a3;
@end

@implementation BWPendingIrisRecordingRequest

+ (id)irisRecordingRequestWithFigCaptureMovieFileRecordingSettings:(id)a3
{
  v3 = -[BWPendingIrisRecordingRequest _initWithFigCaptureMovieFileRecordingSettings:]([BWPendingIrisRecordingRequest alloc], a3);
  return v3;
}

- (void)_initWithFigCaptureMovieFileRecordingSettings:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)BWPendingIrisRecordingRequest;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3) {
    v3[1] = a2;
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWPendingIrisRecordingRequest;
  [(BWPendingIrisRecordingRequest *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[BWPendingIrisRecordingRequest _initWithFigCaptureMovieFileRecordingSettings:](+[BWPendingIrisRecordingRequest allocWithZone:](BWPendingIrisRecordingRequest, "allocWithZone:", a3), self->_settings);
  [v4 setEnqueuedHostTime:self->_enqueuedHostTime];
  [v4 setPairedRequestCreated:self->_pairedRequestCreated];
  [v4 setIrisMovieInfo:self->_irisMovieInfo];
  return v4;
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] string];
  mach_absolute_time();
  double v4 = (double)FigHostTimeToNanoseconds() / 1000000000.0;
  uint64_t v5 = objc_opt_class();
  int64_t v6 = [(FigCaptureRecordingSettings *)self->_settings settingsID];
  v7 = @"YES";
  if (!self->_pairedRequestCreated) {
    v7 = @"NO";
  }
  [v3 appendFormat:@"%@ %p: captureID:%lld [enqueuedInterval: %.4f seconds, pairedRequestCreated: %@, irisMovieInfo: %@]", v5, self, v6, *(void *)&v4, v7, self->_irisMovieInfo];
  return v3;
}

- (void)setMomentCaptureMovieRecordingMasterEndTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_momentCaptureMovieRecordingMasterEndTime.epoch = a3->var3;
  *(_OWORD *)&self->_momentCaptureMovieRecordingMasterEndTime.value = v3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  [(BWIrisMovieInfo *)self->_irisMovieInfo setMomentCaptureMovieRecordingMasterEndTime:&v4];
}

- (BOOL)isEmpty
{
  return self->_irisMovieInfo == 0;
}

- (void)setIrisMovieInfo:(id)a3
{
  self->_irisMovieInfo = (BWIrisMovieInfo *)a3;
  int64_t v5 = [(BWPendingIrisRecordingRequest *)self enqueuedHostTime];
  irisMovieInfo = self->_irisMovieInfo;
  [(BWIrisMovieInfo *)irisMovieInfo setEnqueuedHostTime:v5];
}

- (FigCaptureMovieFileRecordingSettings)settings
{
  return self->_settings;
}

- (int64_t)enqueuedHostTime
{
  return self->_enqueuedHostTime;
}

- (void)setEnqueuedHostTime:(int64_t)a3
{
  self->_enqueuedHostTime = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)momentCaptureMovieRecordingMasterEndTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (BOOL)isPairedRequestCreated
{
  return self->_pairedRequestCreated;
}

- (void)setPairedRequestCreated:(BOOL)a3
{
  self->_pairedRequestCreated = a3;
}

- (BWIrisMovieInfo)irisMovieInfo
{
  return self->_irisMovieInfo;
}

@end