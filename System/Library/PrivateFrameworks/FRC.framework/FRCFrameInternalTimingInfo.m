@interface FRCFrameInternalTimingInfo
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)interpolatedFrameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp;
- (int64_t)frameIsAtBigGap;
- (int64_t)framesToBeDuplicated;
- (void)setFrameDuration:(id *)a3;
- (void)setFrameIsAtBigGap:(int64_t)a3;
- (void)setFramesToBeDuplicated:(int64_t)a3;
- (void)setInterpolatedFrameDuration:(id *)a3;
- (void)setPresentationTimeStamp:(id *)a3;
@end

@implementation FRCFrameInternalTimingInfo

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (void)setPresentationTimeStamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_presentationTimeStamp.epoch = a3->var3;
  *(_OWORD *)&self->_presentationTimeStamp.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (void)setFrameDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_frameDuration.epoch = a3->var3;
  *(_OWORD *)&self->_frameDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)interpolatedFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (void)setInterpolatedFrameDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_interpolatedFrameDuration.epoch = a3->var3;
  *(_OWORD *)&self->_interpolatedFrameDuration.value = v3;
}

- (int64_t)framesToBeDuplicated
{
  return self->_framesToBeDuplicated;
}

- (void)setFramesToBeDuplicated:(int64_t)a3
{
  self->_framesToBeDuplicated = a3;
}

- (int64_t)frameIsAtBigGap
{
  return self->_frameIsAtBigGap;
}

- (void)setFrameIsAtBigGap:(int64_t)a3
{
  self->_frameIsAtBigGap = a3;
}

@end