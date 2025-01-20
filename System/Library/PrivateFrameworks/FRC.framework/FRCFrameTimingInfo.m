@interface FRCFrameTimingInfo
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp;
- (void)setPresentationTimeStamp:(id *)a3;
@end

@implementation FRCFrameTimingInfo

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- (void)setPresentationTimeStamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_presentationTimeStamp.epoch = a3->var3;
  *(_OWORD *)&self->_presentationTimeStamp.value = v3;
}

@end