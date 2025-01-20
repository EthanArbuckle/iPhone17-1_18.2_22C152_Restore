@interface BWTimeSkew
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adjusted;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)native;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)original;
- (BOOL)isBracketFrame;
- (BOOL)isSISFrame;
- (BOOL)isStartOfDiscontinuity;
- (BWTimeSkew)initWithNativeTime:(id *)a3 originalTime:(id *)a4 isBracketFrame:(BOOL)a5 isSISFrame:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAdjusted:(id *)a3;
- (void)setIsStartOfDiscontinuity:(BOOL)a3;
@end

@implementation BWTimeSkew

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)native
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- (BOOL)isBracketFrame
{
  return self->_isBracketFrame;
}

- (BWTimeSkew)initWithNativeTime:(id *)a3 originalTime:(id *)a4 isBracketFrame:(BOOL)a5 isSISFrame:(BOOL)a6
{
  v14.receiver = self;
  v14.super_class = (Class)BWTimeSkew;
  result = [(BWTimeSkew *)&v14 init];
  if (result)
  {
    long long v11 = *(_OWORD *)&a3->var0;
    result->_native.epoch = a3->var3;
    *(_OWORD *)&result->_native.value = v11;
    long long v12 = *(_OWORD *)&a4->var0;
    result->_original.epoch = a4->var3;
    *(_OWORD *)&result->_original.value = v12;
    uint64_t v13 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&result->_adjusted.value = *MEMORY[0x1E4F1F9F8];
    result->_adjusted.epoch = *(void *)(v13 + 16);
    result->_isBracketFrame = a5;
    result->_isSISFrame = a6;
    result->_isStartOfDiscontinuity = 0;
  }
  return result;
}

- (BOOL)isStartOfDiscontinuity
{
  return self->_isStartOfDiscontinuity;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  long long v5 = *(_OWORD *)&self->_native.value;
  *((void *)result + 3) = self->_native.epoch;
  *(_OWORD *)((char *)result + 8) = v5;
  int64_t epoch = self->_original.epoch;
  *((_OWORD *)result + 2) = *(_OWORD *)&self->_original.value;
  *((void *)result + 6) = epoch;
  int64_t v7 = self->_adjusted.epoch;
  *(_OWORD *)((char *)result + 56) = *(_OWORD *)&self->_adjusted.value;
  *((void *)result + 9) = v7;
  *((unsigned char *)result + 80) = self->_isBracketFrame;
  *((unsigned char *)result + 81) = self->_isSISFrame;
  *((unsigned char *)result + 82) = self->_isStartOfDiscontinuity;
  return result;
}

- (id)description
{
  v3 = NSString;
  CMTime time = (CMTime)self->_native;
  Float64 Seconds = CMTimeGetSeconds(&time);
  CMTime time = (CMTime)self->_original;
  Float64 v5 = CMTimeGetSeconds(&time);
  CMTime time = (CMTime)self->_adjusted;
  double v6 = CMTimeGetSeconds(&time);
  if (self->_isStartOfDiscontinuity) {
    uint64_t v7 = 84;
  }
  else {
    uint64_t v7 = 70;
  }
  if (self->_isSISFrame) {
    uint64_t v8 = 84;
  }
  else {
    uint64_t v8 = 70;
  }
  if (self->_isBracketFrame) {
    uint64_t v9 = 84;
  }
  else {
    uint64_t v9 = 70;
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"%.4lf:%.4lf:%.4lf:Bracket=%c:SIS=%c:StartsDiscontinuity:%c", *(void *)&Seconds, *(void *)&v5, *(void *)&v6, v9, v8, v7);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)original
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adjusted
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setAdjusted:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_adjusted.int64_t epoch = a3->var3;
  *(_OWORD *)&self->_adjusted.value = v3;
}

- (BOOL)isSISFrame
{
  return self->_isSISFrame;
}

- (void)setIsStartOfDiscontinuity:(BOOL)a3
{
  self->_isStartOfDiscontinuity = a3;
}

@end