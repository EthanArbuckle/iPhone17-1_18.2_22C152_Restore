@interface FRCFrameBurstyDropInfo
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)burstyBaseDuration;
- (int64_t)burstyIdx;
- (int64_t)burstyLen;
- (int64_t)burstyStart;
- (void)setBurstyBaseDuration:(id *)a3;
- (void)setBurstyIdx:(int64_t)a3;
- (void)setBurstyLen:(int64_t)a3;
- (void)setBurstyStart:(int64_t)a3;
@end

@implementation FRCFrameBurstyDropInfo

- (int64_t)burstyIdx
{
  return self->_burstyIdx;
}

- (void)setBurstyIdx:(int64_t)a3
{
  self->_burstyIdx = a3;
}

- (int64_t)burstyStart
{
  return self->_burstyStart;
}

- (void)setBurstyStart:(int64_t)a3
{
  self->_burstyStart = a3;
}

- (int64_t)burstyLen
{
  return self->_burstyLen;
}

- (void)setBurstyLen:(int64_t)a3
{
  self->_burstyLen = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)burstyBaseDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setBurstyBaseDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_burstyBaseDuration.epoch = a3->var3;
  *(_OWORD *)&self->_burstyBaseDuration.value = v3;
}

@end