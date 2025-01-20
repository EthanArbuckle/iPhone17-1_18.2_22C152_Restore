@interface FRCFrameInsertionPoint
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)interpolatedFrameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp;
- (unint64_t)numberOfFramesToInsert;
- (void)setInterpolatedFrameDuration:(id *)a3;
- (void)setNumberOfFramesToInsert:(unint64_t)a3;
- (void)setPresentationTimeStamp:(id *)a3;
@end

@implementation FRCFrameInsertionPoint

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (void)setPresentationTimeStamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_presentationTimeStamp.epoch = a3->var3;
  *(_OWORD *)&self->_presentationTimeStamp.value = v3;
}

- (unint64_t)numberOfFramesToInsert
{
  return self->_numberOfFramesToInsert;
}

- (void)setNumberOfFramesToInsert:(unint64_t)a3
{
  self->_numberOfFramesToInsert = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)interpolatedFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void)setInterpolatedFrameDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_interpolatedFrameDuration.epoch = a3->var3;
  *(_OWORD *)&self->_interpolatedFrameDuration.value = v3;
}

@end