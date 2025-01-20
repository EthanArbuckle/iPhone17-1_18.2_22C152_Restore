@interface NSAffineTransform(CAAnimatableValue)
- (void)CA_addValue:()CAAnimatableValue multipliedBy:;
- (void)CA_interpolateValue:()CAAnimatableValue byFraction:;
@end

@implementation NSAffineTransform(CAAnimatableValue)

- (void)CA_interpolateValue:()CAAnimatableValue byFraction:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    objc_msgSend(a1, "CA_CGAffineTransformValue");
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
  }
  v19[0] = v16;
  v19[1] = v17;
  v19[2] = v18;
  if (a4)
  {
    objc_msgSend(a4, "CA_CGAffineTransformValue");
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  long long v16 = v10;
  long long v17 = v11;
  long long v18 = v12;
  v7 = objc_msgSend(MEMORY[0x1E4F28AF0], "transform", CA::Mat2Impl::mat2_mix((CA::Mat2Impl *)&v13, (double *)v19, (const double *)&v16, a5, a2).f64[0]);
  v9[0] = v13;
  v9[1] = v14;
  v9[2] = v15;
  [v7 setTransformStruct:v9];
  return v7;
}

- (void)CA_addValue:()CAAnimatableValue multipliedBy:
{
  v4 = (double *)a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    objc_msgSend(a1, "CA_CGAffineTransformValue");
    float64x2_t v10 = v18;
    float64x2_t v11 = v19;
    float64x2_t v12 = v20;
    if (a3)
    {
LABEL_3:
      objc_msgSend(a3, "CA_CGAffineTransformValue");
      goto LABEL_6;
    }
  }
  else
  {
    float64x2_t v11 = 0u;
    float64x2_t v12 = 0u;
    float64x2_t v10 = 0u;
    if (a3) {
      goto LABEL_3;
    }
  }
  float64x2_t v16 = 0u;
  float64x2_t v17 = 0u;
  float64x2_t v15 = 0u;
LABEL_6:
  float64x2_t v18 = v15;
  float64x2_t v19 = v16;
  float64x2_t v20 = v17;
  if ((v4 & 0x80000000) != 0)
  {
    CA::Mat2Impl::mat2_invert((CA::Mat2Impl *)&v18, v18.f64, (const double *)a3);
    v4 = (double *)-(int)v4;
  }
  CA::Mat2Impl::mat2_pow((CA::Mat2Impl *)&v18, v4, (const double *)a3, a4);
  float64x2_t v8 = vmlaq_n_f64(vmulq_n_f64(v10, v19.f64[0]), v11, v19.f64[1]);
  float64x2_t v9 = vmlaq_n_f64(vmulq_n_f64(v10, v18.f64[0]), v11, v18.f64[1]);
  float64x2_t v13 = vmlaq_n_f64(vmlaq_n_f64(v12, v10, v20.f64[0]), v11, v20.f64[1]);
  v6 = (void *)[MEMORY[0x1E4F28AF0] transform];
  v14[0] = v9;
  v14[1] = v8;
  v14[2] = v13;
  [v6 setTransformStruct:v14];
  return v6;
}

@end