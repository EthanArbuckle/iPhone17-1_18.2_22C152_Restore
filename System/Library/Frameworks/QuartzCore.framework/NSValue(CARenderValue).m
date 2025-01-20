@interface NSValue(CARenderValue)
- CA_copyRenderValue;
- (uint64_t)CA_copyNumericValue:()CARenderValue;
- (uint64_t)CA_numericValueCount;
@end

@implementation NSValue(CARenderValue)

- (uint64_t)CA_copyNumericValue:()CARenderValue
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = (const char *)[a1 objCType];
  v6 = v5;
  if (!v5) {
    goto LABEL_8;
  }
  if (!strcmp(v5, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    [a1 rectValue];
    *a3 = v8;
    a3[1] = v9;
    a3[2] = v8 + v10;
    a3[3] = v9 + v11;
    return 4;
  }
  if (!strcmp(v6, "{CGPoint=dd}") || !strcmp(v6, "{CGSize=dd}"))
  {
    [a1 getValue:a3 size:16];
    return 2;
  }
  if (!strcmp(v6, "{CATransform3D=dddddddddddddddd}"))
  {
    [a1 getValue:a3 size:128];
    return 16;
  }
  if (!strcmp(v6, "{CAPoint3D=ddd}"))
  {
    [a1 getValue:a3 size:24];
    return 3;
  }
  if (!strcmp(v6, "{CACornerRadii={CGSize=dd}{CGSize=dd}{CGSize=dd}{CGSize=dd}}"))
  {
    [a1 getValue:a3 size:64];
    return 8;
  }
  else
  {
LABEL_8:
    if (!strcmp(v6, "{CAColorMatrix=ffffffffffffffffffff}"))
    {
      memset(v14, 0, sizeof(v14));
      [a1 getValue:v14 size:80];
      for (uint64_t i = 0; i != 5; ++i)
      {
        float32x4_t v13 = (float32x4_t)v14[i];
        *(float64x2_t *)a3 = vcvtq_f64_f32(*(float32x2_t *)v13.f32);
        *((float64x2_t *)a3 + 1) = vcvt_hight_f64_f32(v13);
        a3 += 4;
      }
      return 20;
    }
    else
    {
      return 0;
    }
  }
}

- (uint64_t)CA_numericValueCount
{
  v1 = (const char *)[a1 objCType];
  v2 = v1;
  if (!v1) {
    goto LABEL_18;
  }
  if (!strcmp(v1, "{CGRect={CGPoint=dd}{CGSize=dd}}")) {
    return 4;
  }
  if (!strcmp(v2, "{CGPoint=dd}") || !strcmp(v2, "{CGSize=dd}")) {
    return 2;
  }
  if (!strcmp(v2, "{CATransform3D=dddddddddddddddd}")) {
    return 16;
  }
  if (!strcmp(v2, "{CAPoint3D=ddd}")) {
    return 3;
  }
  if (!strcmp(v2, "{CACornerRadii={CGSize=dd}{CGSize=dd}{CGSize=dd}{CGSize=dd}}")) {
    return 8;
  }
LABEL_18:
  if (!strcmp(v2, "{CAColorMatrix=ffffffffffffffffffff}")) {
    return 20;
  }
  return 0;
}

- CA_copyRenderValue
{
  const char *v2;
  const char *v3;
  const double *v4;
  uint64_t v6;
  uint64_t v7;
  double v8;
  int8x16_t v9;
  float64x2_t v10;
  float64x2_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t *v17;
  uint64_t v18;
  uint64_t v19;
  float64x2_t *v20;
  float32x4_t v21;
  float64_t v22;
  float64_t v23;
  float64x2_t v24;
  float64x2_t v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  float64x2_t v32;
  float64x2_t v33;
  long long v34;
  float64_t v35;
  float64_t v36;
  float64_t v37;
  float64x2_t v38;
  float64x2_t v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  long long v46;
  long long v47;
  float64x2_t v48;
  float64x2_t v49;
  long long v50;
  long long v51;
  long long v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E4F143B8];
  v2 = (const char *)[a1 objCType];
  v3 = v2;
  if (v2)
  {
    if (!strcmp(v2, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
    {
      [a1 rectValue];
      *(double *)v9.i64 = v8;
      v9.i64[1] = v6;
      v10.f64[0] = 0.0;
      v12.i64[0] = *(void *)&v11.f64[0];
      v12.i64[1] = v7;
      float32x4_t v13 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v10, v11).i64[0], 0);
      v14.i64[1] = v6;
      *(double *)v14.i64 = v11.f64[0] + v8;
      uint64_t v15 = (float64x2_t)vbslq_s8(v13, v14, v9);
      v9.i64[1] = v7;
      *(double *)v9.i64 = -v11.f64[0];
      v16 = (float64x2_t)vbslq_s8(v13, v9, v12);
      if (*(double *)&v7 < 0.0)
      {
        v15.f64[1] = *(double *)&v7 + *(double *)&v6;
        v16.f64[1] = -*(double *)&v7;
      }
      v38 = v15;
      v39 = vaddq_f64(v16, v15);
      v17 = &v38;
      v18 = 4;
      return CA::Render::Vector::new_vector((CA::Render::Vector *)v18, v17, v4);
    }
    if (!strcmp(v3, "{CGPoint=dd}"))
    {
      [a1 pointValue];
    }
    else
    {
      if (strcmp(v3, "{CGSize=dd}"))
      {
        if (!strcmp(v3, "{CATransform3D=dddddddddddddddd}"))
        {
          if (a1)
          {
            [a1 CATransform3DValue];
            v25 = v38;
            v24 = v39;
            v27 = v40;
            v26 = v41;
            v29 = v42;
            v28 = v43;
            v31 = v44;
            v30 = v45;
          }
          else
          {
            v30 = 0uLL;
            v31 = 0uLL;
            v28 = 0uLL;
            v29 = 0uLL;
            v26 = 0uLL;
            v27 = 0uLL;
            v24 = 0uLL;
            v25 = 0uLL;
          }
          v38 = v25;
          v39 = v24;
          v40 = v27;
          v41 = v26;
          v42 = v29;
          v43 = v28;
          v44 = v31;
          v45 = v30;
          v17 = &v38;
          v18 = 16;
          return CA::Render::Vector::new_vector((CA::Render::Vector *)v18, v17, v4);
        }
        if (!strcmp(v3, "{CGAffineTransform=dddddd}"))
        {
          if (a1)
          {
            objc_msgSend(a1, "CA_CGAffineTransformValue");
            v33 = v38;
            v32 = v39;
            v34 = v40;
          }
          else
          {
            v34 = 0uLL;
            v32 = 0uLL;
            v33 = 0uLL;
          }
          v38 = v33;
          v39 = v32;
          v40 = v34;
          v17 = &v38;
          v18 = 6;
          return CA::Render::Vector::new_vector((CA::Render::Vector *)v18, v17, v4);
        }
        if (!strcmp(v3, "{CAPoint3D=ddd}"))
        {
          [a1 CAPoint3DValue];
          v38.f64[0] = v35;
          v38.f64[1] = v36;
          v39.f64[0] = v37;
          v17 = &v38;
          v18 = 3;
          return CA::Render::Vector::new_vector((CA::Render::Vector *)v18, v17, v4);
        }
        if (!strcmp(v3, "{CACornerRadii={CGSize=dd}{CGSize=dd}{CGSize=dd}{CGSize=dd}}"))
        {
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          if (a1) {
            [a1 CACornerRadiiValue];
          }
          v48 = v38;
          v49 = v39;
          v50 = v40;
          v51 = v41;
          v17 = &v48;
          v18 = 8;
          return CA::Render::Vector::new_vector((CA::Render::Vector *)v18, v17, v4);
        }
        goto LABEL_9;
      }
      [a1 sizeValue];
    }
    v38.f64[0] = v22;
    v38.f64[1] = v23;
    v17 = &v38;
    v18 = 2;
    return CA::Render::Vector::new_vector((CA::Render::Vector *)v18, v17, v4);
  }
LABEL_9:
  if (strcmp(v3, "{CAColorMatrix=ffffffffffffffffffff}")) {
    return 0;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v48 = 0u;
  [a1 getValue:&v48 size:80];
  v19 = 0;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v20 = &v38;
  v38 = 0u;
  v39 = 0u;
  do
  {
    v21 = *(float32x4_t *)((char *)&v48 + v19);
    *v20 = vcvtq_f64_f32(*(float32x2_t *)v21.f32);
    v20[1] = vcvt_hight_f64_f32(v21);
    v20 += 2;
    v19 += 16;
  }
  while (v19 != 80);
  v17 = &v38;
  v18 = 20;
  return CA::Render::Vector::new_vector((CA::Render::Vector *)v18, v17, v4);
}

@end