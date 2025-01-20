@interface CKSearchVideoDuration
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (void)setDuration:(id *)a3;
@end

@implementation CKSearchVideoDuration

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- (void)setDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_duration.epoch = a3->var3;
  *(_OWORD *)&self->_duration.value = v3;
}

@end