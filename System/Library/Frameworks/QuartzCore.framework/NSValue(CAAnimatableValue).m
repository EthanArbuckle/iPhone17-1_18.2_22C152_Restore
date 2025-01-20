@interface NSValue(CAAnimatableValue)
- (float64_t)CA_distanceToValue:()CAAnimatableValue;
- (id)CA_roundToIntegerFromValue:()CAAnimatableValue;
- (uint64_t)CA_addValue:()CAAnimatableValue multipliedBy:;
- (uint64_t)CA_interpolateValue:()CAAnimatableValue byFraction:;
- (uint64_t)CA_interpolateValues:()CAAnimatableValue ::interpolator:;
@end

@implementation NSValue(CAAnimatableValue)

- (uint64_t)CA_interpolateValue:()CAAnimatableValue byFraction:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v6 = [(NSValue *)a1 objCType];
  v7 = v6;
  if (v6)
  {
    if (!strcmp(v6, "{CATransform3D=dddddddddddddddd}"))
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      float64x2_t v29 = 0u;
      long long v30 = 0u;
      if (a1)
      {
        [(NSValue *)a1 CATransform3DValue];
      }
      else
      {
        long long v43 = 0uLL;
        long long v44 = 0uLL;
        long long v41 = 0uLL;
        long long v42 = 0uLL;
        long long v39 = 0uLL;
        long long v40 = 0uLL;
        float64x2_t v37 = 0uLL;
        long long v38 = 0uLL;
      }
      long long v49 = v41;
      long long v50 = v42;
      long long v51 = v43;
      long long v52 = v44;
      float64x2_t v45 = v37;
      long long v46 = v38;
      long long v47 = v39;
      long long v48 = v40;
      if (a4)
      {
        [(NSValue *)a4 CATransform3DValue];
      }
      else
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        *(_OWORD *)v21 = 0u;
        long long v22 = 0u;
      }
      long long v41 = v25;
      long long v42 = v26;
      long long v43 = v27;
      long long v44 = v28;
      float64x2_t v37 = *(float64x2_t *)v21;
      long long v38 = v22;
      long long v39 = v23;
      long long v40 = v24;
      CA::Mat4Impl::mat4_mix((CA::Mat4Impl *)&v29, &v45, v37.f64, v8, *(float *)&a2);
      v20[4] = v33;
      v20[5] = v34;
      v20[6] = v35;
      v20[7] = v36;
      v20[0] = v29;
      v20[1] = v30;
      v20[2] = v31;
      v20[3] = v32;
      return [MEMORY[0x1E4F29238] valueWithCATransform3D:v20];
    }
    if (!strcmp(v7, "{CGAffineTransform=dddddd}"))
    {
      long long v30 = 0u;
      long long v31 = 0u;
      float64x2_t v29 = 0u;
      if (a1)
      {
        [(NSValue *)a1 CA_CGAffineTransformValue];
      }
      else
      {
        long long v38 = 0uLL;
        long long v39 = 0uLL;
        float64x2_t v37 = 0uLL;
      }
      float64x2_t v45 = v37;
      long long v46 = v38;
      long long v47 = v39;
      if (a4)
      {
        [(NSValue *)a4 CA_CGAffineTransformValue];
      }
      else
      {
        long long v22 = 0u;
        long long v23 = 0u;
        *(_OWORD *)v21 = 0u;
      }
      float64x2_t v37 = *(float64x2_t *)v21;
      long long v38 = v22;
      long long v39 = v23;
      return objc_msgSend(MEMORY[0x1E4F29238], "value:withObjCType:", &v29, "{CGAffineTransform=dddddd}", CA::Mat2Impl::mat2_mix((CA::Mat2Impl *)&v29, v45.f64, v37.f64, v9, *(float *)&a2).f64[0]);
    }
  }
  if (!strcmp(v7, "{CAColorMatrix=ffffffffffffffffffff}"))
  {
    if (a1)
    {
      [(NSValue *)a1 CAColorMatrixValue];
    }
    else
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      float64x2_t v37 = 0u;
    }
    long long v47 = v39;
    long long v48 = v40;
    long long v49 = v41;
    float64x2_t v45 = v37;
    long long v46 = v38;
    if (a4)
    {
      [(NSValue *)a4 CAColorMatrixValue];
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      float64x2_t v29 = 0u;
    }
    uint64_t v16 = 0;
    long long v39 = v31;
    long long v40 = v32;
    long long v41 = v33;
    float64x2_t v37 = v29;
    long long v38 = v30;
    float32x4_t v17 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a2, 0);
    do
    {
      *(float32x4_t *)((char *)&v45 + v16) = vmlaq_f32(*(float32x4_t *)((char *)&v45 + v16), v17, vsubq_f32(*(float32x4_t *)((char *)&v37 + v16), *(float32x4_t *)((char *)&v45 + v16)));
      v16 += 16;
    }
    while (v16 != 80);
    v19[2] = v47;
    v19[3] = v48;
    v19[4] = v49;
    v19[0] = v45;
    v19[1] = v46;
    return [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v19];
  }
  else
  {
    long long v47 = 0u;
    long long v48 = 0u;
    float64x2_t v45 = 0u;
    long long v46 = 0u;
    float64x2_t v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    float64x2_t v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v21[0] = 8;
    getValues(a1, v37.f64, v21);
    getValues(a4, v29.f64, v21);
    unint64_t v10 = v21[0];
    if (v21[0])
    {
      uint64_t v11 = 0;
      do
      {
        double v12 = v37.f64[v11];
        double v13 = v29.f64[v11];
        if (v12 == v13) {
          double v14 = 0.0;
        }
        else {
          double v14 = (v13 - v12) * *(float *)&a2;
        }
        v45.f64[v11++] = v14 + v12;
      }
      while (v10 != v11);
      return makeValue(&v45, v10, (objc_object *)a1);
    }
    else
    {
      [(NSValue *)a1 objCType];
      return 0;
    }
  }
}

- (uint64_t)CA_addValue:()CAAnimatableValue multipliedBy:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v7 = [(NSValue *)a1 objCType];
  v8 = v7;
  if (!v7)
  {
LABEL_4:
    if (!strcmp(v8, "{CAColorMatrix=ffffffffffffffffffff}"))
    {
      if (a1)
      {
        [(NSValue *)a1 CAColorMatrixValue];
      }
      else
      {
        long long v37 = 0u;
        long long v38 = 0u;
        float64x2_t v35 = 0u;
        float64x2_t v36 = 0u;
        float64x2_t v34 = 0u;
      }
      float64x2_t v44 = v36;
      long long v45 = v37;
      long long v46 = v38;
      float64x2_t v42 = v34;
      float64x2_t v43 = v35;
      if (a3)
      {
        [(NSValue *)a3 CAColorMatrixValue];
      }
      else
      {
        long long v29 = 0u;
        long long v30 = 0u;
        float64x2_t v27 = 0u;
        float64x2_t v28 = 0u;
        float64x2_t v26 = 0u;
      }
      uint64_t v17 = 0;
      float64x2_t v36 = v28;
      long long v37 = v29;
      long long v38 = v30;
      v18.i32[1] = HIDWORD(v27.f64[0]);
      float64x2_t v34 = v26;
      float64x2_t v35 = v27;
      *(float *)v18.i32 = (float)(int)a4;
      float32x4_t v19 = (float32x4_t)vdupq_lane_s32(v18, 0);
      do
      {
        *(float32x4_t *)((char *)&v42 + v17) = vmlaq_f32(*(float32x4_t *)((char *)&v42 + v17), v19, *(float32x4_t *)((char *)&v34 + v17));
        v17 += 16;
      }
      while (v17 != 80);
      v23[2] = v44;
      v23[3] = v45;
      v23[4] = v46;
      v23[0] = v42;
      v23[1] = v43;
      return [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v23];
    }
    else
    {
      float64x2_t v44 = 0u;
      long long v45 = 0u;
      float64x2_t v42 = 0u;
      float64x2_t v43 = 0u;
      float64x2_t v34 = 0u;
      float64x2_t v35 = 0u;
      float64x2_t v36 = 0u;
      long long v37 = 0u;
      float64x2_t v26 = 0u;
      float64x2_t v27 = 0u;
      float64x2_t v28 = 0u;
      long long v29 = 0u;
      unint64_t v25 = 8;
      getValues(a1, v34.f64, &v25);
      getValues(a3, v26.f64, &v25);
      unint64_t v13 = v25;
      if (v25)
      {
        uint64_t v14 = 0;
        do
        {
          v42.f64[v14] = v34.f64[v14] + v26.f64[v14] * (double)(int)a4;
          ++v14;
        }
        while (v13 != v14);
        return makeValue(&v42, v13, (objc_object *)a1);
      }
      else
      {
        [(NSValue *)a1 objCType];
        return 0;
      }
    }
  }
  if (!strcmp(v7, "{CATransform3D=dddddddddddddddd}"))
  {
    if (a1)
    {
      [(NSValue *)a1 CATransform3DValue];
    }
    else
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      float64x2_t v36 = 0u;
      long long v37 = 0u;
      float64x2_t v34 = 0u;
      float64x2_t v35 = 0u;
    }
    long long v46 = v38;
    long long v47 = v39;
    long long v48 = v40;
    long long v49 = v41;
    float64x2_t v42 = v34;
    float64x2_t v43 = v35;
    float64x2_t v44 = v36;
    long long v45 = v37;
    if (a3)
    {
      [(NSValue *)a3 CATransform3DValue];
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      float64x2_t v28 = 0u;
      long long v29 = 0u;
      float64x2_t v26 = 0u;
      float64x2_t v27 = 0u;
    }
    long long v38 = v30;
    long long v39 = v31;
    long long v40 = v32;
    long long v41 = v33;
    float64x2_t v34 = v26;
    float64x2_t v35 = v27;
    float64x2_t v36 = v28;
    long long v37 = v29;
    if ((a4 & 0x80000000) != 0)
    {
      CA::Mat4Impl::mat4_invert((CA::Mat4Impl *)&v34, (CA::Mat4Impl *)&v34, v9);
      a4 = (double *)-(int)a4;
    }
    CA::Mat4Impl::mat4_pow((CA::Mat4Impl *)&v34, a4, v9, v10);
    CA::Mat4Impl::mat4_concat(&v42, v34.f64, v42.f64, v16);
    v24[4] = v46;
    v24[5] = v47;
    v24[6] = v48;
    v24[7] = v49;
    v24[0] = v42;
    v24[1] = v43;
    v24[2] = v44;
    v24[3] = v45;
    return [MEMORY[0x1E4F29238] valueWithCATransform3D:v24];
  }
  else
  {
    if (strcmp(v8, "{CGAffineTransform=dddddd}")) {
      goto LABEL_4;
    }
    if (a1)
    {
      [(NSValue *)a1 CA_CGAffineTransformValue];
    }
    else
    {
      float64x2_t v35 = 0u;
      float64x2_t v36 = 0u;
      float64x2_t v34 = 0u;
    }
    float64x2_t v42 = v34;
    float64x2_t v43 = v35;
    float64x2_t v44 = v36;
    if (a3)
    {
      [(NSValue *)a3 CA_CGAffineTransformValue];
    }
    else
    {
      float64x2_t v27 = 0u;
      float64x2_t v28 = 0u;
      float64x2_t v26 = 0u;
    }
    float64x2_t v34 = v26;
    float64x2_t v35 = v27;
    float64x2_t v36 = v28;
    if ((a4 & 0x80000000) != 0)
    {
      CA::Mat2Impl::mat2_invert((CA::Mat2Impl *)&v34, v34.f64, v11);
      a4 = (double *)-(int)a4;
    }
    CA::Mat2Impl::mat2_pow((CA::Mat2Impl *)&v34, a4, v11, v12);
    float64x2_t v20 = v42;
    float64x2_t v21 = v43;
    float64x2_t v22 = vmlaq_n_f64(vmulq_n_f64(v42, v35.f64[0]), v43, v35.f64[1]);
    float64x2_t v42 = vmlaq_n_f64(vmulq_n_f64(v42, v34.f64[0]), v43, v34.f64[1]);
    float64x2_t v43 = v22;
    float64x2_t v44 = vmlaq_n_f64(vmlaq_n_f64(v44, v20, v36.f64[0]), v21, v36.f64[1]);
    return [MEMORY[0x1E4F29238] value:&v42 withObjCType:"{CGAffineTransform=dddddd}"];
  }
}

- (float64_t)CA_distanceToValue:()CAAnimatableValue
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(v11, 0, sizeof(v11));
  memset(v10, 0, sizeof(v10));
  unint64_t v9 = 8;
  getValues(a1, v11[0].f64, &v9);
  getValues(a3, v10[0].f64, &v9);
  if (v9 == 3)
  {
    float64x2_t v5 = vsubq_f64(*(float64x2_t *)((char *)v11 + 8), *(float64x2_t *)((char *)v10 + 8));
    float64x2_t v6 = vmulq_f64(v5, v5);
    double v7 = v6.f64[0] + (v11[0].f64[0] - v10[0].f64[0]) * (v11[0].f64[0] - v10[0].f64[0]) + v6.f64[1];
    return sqrt(v7);
  }
  if (v9 == 2)
  {
    float64x2_t v8 = vsubq_f64(v11[0], v10[0]);
    double v7 = vaddvq_f64(vmulq_f64(v8, v8));
    return sqrt(v7);
  }
  float64_t result = 0.0;
  if (v9 == 1) {
    return v10[0].f64[0];
  }
  return result;
}

- (id)CA_roundToIntegerFromValue:()CAAnimatableValue
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  float64x2_t v5 = [(NSValue *)a1 objCType];
  if (v5 && !strcmp(v5, "{CATransform3D=dddddddddddddddd}"))
  {
    v9.receiver = a1;
    v9.super_class = (Class)&off_1ED06C0C0;
    return [(NSValue *)&v9 CA_roundToIntegerFromValue:a3];
  }
  else
  {
    memset(&v12, 0, 64);
    memset(v11, 0, sizeof(v11));
    unint64_t v10 = 8;
    getValues(a1, v12.f64, &v10);
    getValues(a3, (double *)v11, &v10);
    unint64_t v6 = v10;
    if (v10)
    {
      uint64_t v7 = 0;
      do
      {
        v12.f64[v7] = round(v12.f64[v7] - *((double *)v11 + v7)) + *((double *)v11 + v7);
        ++v7;
      }
      while (v6 != v7);
      return (id)makeValue(&v12, v6, (objc_object *)a1);
    }
    else
    {
      [(NSValue *)a1 objCType];
      return 0;
    }
  }
}

- (uint64_t)CA_interpolateValues:()CAAnimatableValue ::interpolator:
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  memset(v59, 0, sizeof(v59));
  memset(v58, 0, sizeof(v58));
  uint64_t v11 = [(NSValue *)a1 objCType];
  float64x2_t v12 = v11;
  if (v11 && !strcmp(v11, "{CATransform3D=dddddddddddddddd}"))
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    float64x2_t v34 = 0u;
    long long v35 = 0u;
    if (a1)
    {
      [(NSValue *)a1 CATransform3DValue];
    }
    else
    {
      long long v48 = 0uLL;
      long long v49 = 0uLL;
      long long v46 = 0uLL;
      long long v47 = 0uLL;
      long long v44 = 0uLL;
      long long v45 = 0uLL;
      float64x2_t v42 = 0uLL;
      long long v43 = 0uLL;
    }
    long long v54 = v46;
    long long v55 = v47;
    long long v56 = v48;
    long long v57 = v49;
    float64x2_t v50 = v42;
    long long v51 = v43;
    long long v52 = v44;
    long long v53 = v45;
    if (a4)
    {
      [(NSValue *)a4 CATransform3DValue];
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      *(_OWORD *)float64x2_t v26 = 0u;
      long long v27 = 0u;
    }
    long long v46 = v30;
    long long v47 = v31;
    long long v48 = v32;
    long long v49 = v33;
    float64x2_t v42 = *(float64x2_t *)v26;
    long long v43 = v27;
    long long v44 = v28;
    long long v45 = v29;
    CA::Mat4Impl::mat4_mix((CA::Mat4Impl *)&v34, &v50, v42.f64, v13, *a6);
    v25[4] = v38;
    v25[5] = v39;
    v25[6] = v40;
    v25[7] = v41;
    v25[0] = v34;
    v25[1] = v35;
    v25[2] = v36;
    v25[3] = v37;
    return [MEMORY[0x1E4F29238] valueWithCATransform3D:v25];
  }
  else
  {
    if (strcmp(v12, "{CAColorMatrix=ffffffffffffffffffff}"))
    {
      long long v44 = 0u;
      long long v45 = 0u;
      float64x2_t v42 = 0u;
      long long v43 = 0u;
      float64x2_t v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v26[0] = 8;
      getValues(a1, v42.f64, v26);
      getValues(a4, v34.f64, v26);
      if (a3)
      {
        uint64_t v14 = (double *)v59;
        getValues(a3, (double *)v59, v26);
        if (a5)
        {
LABEL_6:
          v15 = (double *)v58;
          getValues(a5, (double *)v58, v26);
LABEL_13:
          long long v52 = 0u;
          long long v53 = 0u;
          float64x2_t v50 = 0u;
          long long v51 = 0u;
          unint64_t v16 = v26[0];
          CA::Render::ValueInterpolator::mix_n<double>(a6, v26[0], v50.f64, v14, v42.f64, v34.f64, v15);
          return makeValue(&v50, v16, (objc_object *)a1);
        }
      }
      else
      {
        uint64_t v14 = 0;
        if (a5) {
          goto LABEL_6;
        }
      }
      v15 = 0;
      goto LABEL_13;
    }
    if (a1)
    {
      [(NSValue *)a1 CAColorMatrixValue];
    }
    else
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      float64x2_t v42 = 0u;
    }
    long long v52 = v44;
    long long v53 = v45;
    long long v54 = v46;
    float64x2_t v50 = v42;
    long long v51 = v43;
    if (a4)
    {
      [(NSValue *)a4 CAColorMatrixValue];
    }
    else
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      float64x2_t v34 = 0u;
    }
    uint64_t v18 = 0;
    long long v44 = v36;
    long long v45 = v37;
    long long v46 = v38;
    float64x2_t v42 = v34;
    long long v43 = v35;
    float64x2_t v19 = (float64x2_t)vdupq_lane_s64(*(void *)a6, 0);
    do
    {
      float32x4_t v20 = *(float32x4_t *)((char *)&v50 + v18);
      float64x2_t v21 = vcvtq_f64_f32(*(float32x2_t *)v20.f32);
      float64x2_t v22 = vcvt_hight_f64_f32(v20);
      float32x4_t v23 = vsubq_f32(*(float32x4_t *)((char *)&v42 + v18), v20);
      *(float32x4_t *)((char *)&v50 + v18) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_f64(v21, vcvtq_f64_f32(*(float32x2_t *)v23.f32), v19)), vmlaq_f64(v22, vcvt_hight_f64_f32(v23), v19));
      v18 += 16;
    }
    while (v18 != 80);
    v24[2] = v52;
    v24[3] = v53;
    v24[4] = v54;
    v24[0] = v50;
    v24[1] = v51;
    return [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v24];
  }
}

@end