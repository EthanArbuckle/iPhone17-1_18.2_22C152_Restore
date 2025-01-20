@interface CIEnhancementHistogram
+ (id)histogramFromData:(const double *)a3;
+ (id)histogramFromDoubleData:(const double *)a3;
+ (id)histogramFromFloatData:(const float *)a3;
- (const)values;
@end

@implementation CIEnhancementHistogram

+ (id)histogramFromData:(const double *)a3
{
  id result = objc_alloc_init(CIEnhancementHistogram);
  if (result)
  {
    for (uint64_t i = 0; i != 256; ++i)
      *(double *)((char *)result + i * 8 + 8) = a3[i];
  }
  return result;
}

+ (id)histogramFromFloatData:(const float *)a3
{
  id result = objc_alloc_init(CIEnhancementHistogram);
  if (result)
  {
    uint64_t v5 = 0;
    v6 = (float64x2_t *)((char *)result + 8);
    do
    {
      float32x4_t v7 = *(float32x4_t *)&a3[v5];
      float64x2_t *v6 = vcvtq_f64_f32(*(float32x2_t *)v7.f32);
      v6[1] = vcvt_hight_f64_f32(v7);
      v6 += 2;
      v5 += 4;
    }
    while (v5 != 256);
  }
  return result;
}

+ (id)histogramFromDoubleData:(const double *)a3
{
  id result = objc_alloc_init(CIEnhancementHistogram);
  if (result)
  {
    for (uint64_t i = 0; i != 256; ++i)
      *(double *)((char *)result + i * 8 + 8) = a3[i];
  }
  return result;
}

- (const)values
{
  return self->hist;
}

@end