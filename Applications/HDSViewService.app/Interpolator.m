@interface Interpolator
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)interpolatedTimes;
- (Interpolator)init;
- (float)interpolatedValues;
- (unsigned)interpolatedLength;
- (void)dealloc;
- (void)interpolateData:(float *)a3 atTimes:(id *)a4 andLength:(unsigned int)a5 toRate:(float)a6;
@end

@implementation Interpolator

- (Interpolator)init
{
  v3.receiver = self;
  v3.super_class = (Class)Interpolator;
  result = [(Interpolator *)&v3 init];
  if (result)
  {
    result->_interpolatedLength = 0;
    result->_interpolatedValues = 0;
    result->_interpolatedTimes = 0;
  }
  return result;
}

- (void)dealloc
{
  interpolatedTimes = self->_interpolatedTimes;
  if (interpolatedTimes) {
    free(interpolatedTimes);
  }
  interpolatedValues = self->_interpolatedValues;
  if (interpolatedValues) {
    free(interpolatedValues);
  }
  v5.receiver = self;
  v5.super_class = (Class)Interpolator;
  [(Interpolator *)&v5 dealloc];
}

- (void)interpolateData:(float *)a3 atTimes:(id *)a4 andLength:(unsigned int)a5 toRate:(float)a6
{
  CMTime v24 = *(CMTime *)a4;
  CMTime lhs = (CMTime)a4[a5 - 1];
  CMTime rhs = *(CMTime *)a4;
  CMTimeSubtract(&time, &lhs, &rhs);
  unsigned int interpolatedLength = (CMTimeGetSeconds(&time) * a6 + 0.5) + 1;
  interpolatedTimes = self->_interpolatedTimes;
  if (!interpolatedTimes || self->_interpolatedLength != interpolatedLength)
  {
    self->_unsigned int interpolatedLength = interpolatedLength;
    self->_interpolatedTimes = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)malloc_type_realloc(interpolatedTimes, 24 * interpolatedLength, 0x1000040504FFAC1uLL);
    self->_interpolatedValues = (float *)malloc_type_realloc(self->_interpolatedValues, 4 * self->_interpolatedLength, 0x100004052888210uLL);
    unsigned int interpolatedLength = self->_interpolatedLength;
  }
  if (interpolatedLength)
  {
    uint64_t v13 = 0;
    int v14 = 0;
    unint64_t v15 = 0;
    do
    {
      memset(&lhs, 0, sizeof(lhs));
      CMTimeMake(&lhs, v14 & 0xFFFFFFFE, (int)(float)(a6 * 10.0));
      v16 = &self->_interpolatedTimes[v13];
      CMTime v20 = v24;
      CMTime v19 = lhs;
      CMTimeAdd(&rhs, &v20, &v19);
      long long v17 = *(_OWORD *)&rhs.value;
      v16->var3 = rhs.epoch;
      *(_OWORD *)&v16->var0 = v17;
      ++v15;
      unint64_t v18 = self->_interpolatedLength;
      v14 += 10;
      ++v13;
    }
    while (v15 < v18);
  }
  else
  {
    LODWORD(v18) = 0;
  }
  sub_100009A54((CMTime *)a4, (uint64_t)a3, a5, (uint64_t)self->_interpolatedTimes, v18, (uint64_t)self->_interpolatedValues);
}

- (float)interpolatedValues
{
  return self->_interpolatedValues;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)interpolatedTimes
{
  return self->_interpolatedTimes;
}

- (unsigned)interpolatedLength
{
  return self->_interpolatedLength;
}

@end