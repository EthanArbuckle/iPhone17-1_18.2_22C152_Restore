@interface PKInterpolateColorAnimation
- (char)colorAtTime:(char *)a1;
- (uint64_t)initWithStartColor:(void *)a3 endColor:(double)a4 startTime:(double)a5 duration:;
@end

@implementation PKInterpolateColorAnimation

- (uint64_t)initWithStartColor:(void *)a3 endColor:(double)a4 startTime:(double)a5 duration:
{
  id v10 = a3;
  if (a1)
  {
    *(double *)(a1 + 72) = a4;
    *(double *)(a1 + 80) = a5;
    int v11 = [a2 getRed:a1 + 8 green:a1 + 16 blue:a1 + 24 alpha:a1 + 32];
    char v12 = [v10 getRed:a1 + 40 green:a1 + 48 blue:a1 + 56 alpha:a1 + 64];
    if (!v11 || (v12 & 1) == 0) {
      objc_storeStrong((id *)(a1 + 88), a3);
    }
    id v13 = (id)a1;
  }

  return a1;
}

- (char)colorAtTime:(char *)a1
{
  v9[4] = *(double *)MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (void *)*((void *)a1 + 11);
    if (v2)
    {
      a1 = v2;
    }
    else
    {
      double v3 = *((double *)a1 + 10);
      double v4 = a2 - *((double *)a1 + 9);
      double v5 = 0.0;
      if (v4 >= 0.0)
      {
        double v5 = v4;
        if (v4 > v3) {
          double v5 = *((double *)a1 + 10);
        }
      }
      uint64_t v6 = 0;
      float64x2_t v7 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v5 / v3), 0);
      do
      {
        *(float64x2_t *)&v9[v6] = vmlaq_f64(*(float64x2_t *)&a1[v6 * 8 + 8], v7, vsubq_f64(*(float64x2_t *)&a1[v6 * 8 + 40], *(float64x2_t *)&a1[v6 * 8 + 8]));
        v6 += 2;
      }
      while (v6 != 4);
      a1 = [MEMORY[0x1E4FB1618] colorWithRed:v9[0] green:v9[1] blue:v9[2] alpha:v9[3]];
    }
  }

  return a1;
}

- (void).cxx_destruct
{
}

@end