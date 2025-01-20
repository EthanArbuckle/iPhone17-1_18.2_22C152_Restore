@interface NSObject(CAAnimatableValue)
- (CGColorRef)CA_addValue:()CAAnimatableValue multipliedBy:;
- (CGColorRef)CA_interpolateValue:()CAAnimatableValue byFraction:;
- (CGColorRef)CA_interpolateValues:()CAAnimatableValue ::interpolator:;
- (double)CA_distanceToValue:()CAAnimatableValue;
@end

@implementation NSObject(CAAnimatableValue)

- (double)CA_distanceToValue:()CAAnimatableValue
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFTypeID v5 = CFGetTypeID(a1);
  CFTypeID TypeID = CGColorGetTypeID();
  double result = 1.0;
  if (v5 == TypeID)
  {
    memset(v13, 0, sizeof(v13));
    memset(v12, 0, sizeof(v12));
    v8 = (CGColorSpace *)CAGetColorSpace(0x1Cu);
    CA_CGColorGetRGBComponents((CGColor *)a1, v8, (CGFloat *)v13);
    CA_CGColorGetRGBComponents(a3, v8, (CGFloat *)v12);
    float64x2_t v9 = 0uLL;
    for (uint64_t i = 0; i != 2; ++i)
    {
      float64x2_t v11 = vsubq_f64((float64x2_t)v13[i], (float64x2_t)v12[i]);
      float64x2_t v9 = vmlaq_f64(v9, v11, v11);
    }
    return sqrt(vaddvq_f64(v9));
  }
  return result;
}

- (CGColorRef)CA_interpolateValues:()CAAnimatableValue ::interpolator:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  CFTypeID v11 = CFGetTypeID(a1);
  if (v11 == CGColorGetTypeID())
  {
    *(_OWORD *)components = 0u;
    long long v22 = 0u;
    memset(v20, 0, sizeof(v20));
    memset(v19, 0, sizeof(v19));
    memset(v18, 0, sizeof(v18));
    memset(v17, 0, sizeof(v17));
    v12 = (CGColorSpace *)CAGetColorSpace(0x1Cu);
    CA_CGColorGetRGBComponents((CGColor *)a1, v12, (CGFloat *)v19);
    CA_CGColorGetRGBComponents(a4, v12, (CGFloat *)v18);
    if (a3)
    {
      v13 = (double *)v20;
      CA_CGColorGetRGBComponents(a3, v12, (CGFloat *)v20);
      if (a5)
      {
LABEL_4:
        uint64_t v14 = (double *)v17;
        CA_CGColorGetRGBComponents(a5, v12, (CGFloat *)v17);
LABEL_10:
        CA::Render::ValueInterpolator::mix_n<double>(a6, 4, components, v13, (double *)v19, (double *)v18, v14);
        return CGColorCreate(v12, components);
      }
    }
    else
    {
      v13 = 0;
      if (a5) {
        goto LABEL_4;
      }
    }
    uint64_t v14 = 0;
    goto LABEL_10;
  }
  double v15 = *a6;
  *(float *)&double v15 = *a6;

  return (CGColorRef)objc_msgSend(a1, "CA_interpolateValue:byFraction:", a4, v15);
}

- (CGColorRef)CA_interpolateValue:()CAAnimatableValue byFraction:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  CFTypeID v7 = CFGetTypeID(a1);
  if (v7 == CGColorGetTypeID())
  {
    memset(&components, 0, 32);
    *(_OWORD *)v21 = 0u;
    long long v22 = 0u;
    v8 = (CGColorSpace *)CAGetColorSpace(0x1Cu);
    CA_CGColorGetRGBComponents((CGColor *)a1, v8, &components.var0);
    CA_CGColorGetRGBComponents(a4, v8, (CGFloat *)v21);
    uint64_t v9 = 0;
    float64x2_t v10 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2), 0);
    do
    {
      *(float64x2_t *)((char *)&components.var0 + v9 * 8) = vmlaq_f64(*(float64x2_t *)((char *)&components.var0 + v9 * 8), v10, vsubq_f64(*(float64x2_t *)&v21[v9], *(float64x2_t *)((char *)&components.var0 + v9 * 8)));
      v9 += 2;
    }
    while (v9 != 4);
    return CGColorCreate(v8, &components.var0);
  }
  else if (v7 == CGPathGetTypeID())
  {
    v13 = CA::Render::Path::new_path((CGPathRef)a1, v12);
    double v15 = CA::Render::Path::new_path(a4, v14);
    components.var0 = a2;
    memset(&components.var1, 0, 112);
    v21[0] = 0;
    CA::Render::mix_objects((uint64_t)v21, v13->i32, v15->i32, &components);
    v16 = (atomic_uint *)v21[0];
    if (v21[0])
    {
      if (*((unsigned char *)v21[0] + 12) == 36)
      {
        v17 = (atomic_uint *)((char *)v21[0] + 8);
        if (!atomic_fetch_add((atomic_uint *volatile)v21[0] + 2, 1u))
        {
          v16 = 0;
          atomic_fetch_add(v17, 0xFFFFFFFF);
        }
        v18 = (const CGPath *)CA::Render::Path::cg_path((CA::Render::Path *)v16);
        CGPathRef v19 = CGPathRetain(v18);
        if (v16 && atomic_fetch_add(v16 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v16 + 16))(v16);
        }
      }
      else
      {
        CGPathRef v19 = 0;
      }
      v20 = v21[0];
      if (v21[0] && atomic_fetch_add((atomic_uint *volatile)v21[0] + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(CA::Render::Path *))(*(void *)v20 + 16))(v20);
      }
    }
    else
    {
      CGPathRef v19 = 0;
    }
    if (v15 && atomic_fetch_add(&v15->i32[2], 0xFFFFFFFF) == 1) {
      (*(void (**)(int8x16_t *))(v15->i64[0] + 16))(v15);
    }
    if (v13 && atomic_fetch_add(&v13->i32[2], 0xFFFFFFFF) == 1) {
      (*(void (**)(int8x16_t *))(v13->i64[0] + 16))(v13);
    }
    return v19;
  }
  else if (a2 >= 0.5)
  {
    return a4;
  }
  else
  {
    return (CGColorRef)a1;
  }
}

- (CGColorRef)CA_addValue:()CAAnimatableValue multipliedBy:
{
  v6 = a1;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  CFTypeID v7 = CFGetTypeID(a1);
  if (v7 == CGColorGetTypeID())
  {
    *(_OWORD *)ValueInterpolator components = 0u;
    long long v15 = 0u;
    memset(v13, 0, sizeof(v13));
    v8 = (CGColorSpace *)CAGetColorSpace(0x1Cu);
    CA_CGColorGetRGBComponents(v6, v8, components);
    CA_CGColorGetRGBComponents(a3, v8, (CGFloat *)v13);
    unint64_t v9 = 0;
    float64x2_t v10 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)a4), 0);
    do
    {
      *(float64x2_t *)&components[v9 / 8] = vmlaq_f64(*(float64x2_t *)&components[v9 / 8], v10, (float64x2_t)v13[v9 / 0x10]);
      v9 += 16;
    }
    while (v9 != 32);
    return CGColorCreate(v8, components);
  }
  if (v7 != CGPathGetTypeID()) {
    return v6;
  }
  CGPathRef v11 = CGPathRetain(v6);

  return v11;
}

@end