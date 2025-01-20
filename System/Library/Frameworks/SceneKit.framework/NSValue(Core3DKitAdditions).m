@interface NSValue(Core3DKitAdditions)
+ (uint64_t)SCN_valueWithCGPoint:()Core3DKitAdditions;
+ (uint64_t)SCN_valueWithSimdMatrix4:()Core3DKitAdditions;
+ (uint64_t)valueWithSCNMatrix4:()Core3DKitAdditions;
+ (uint64_t)valueWithSCNVector3:()Core3DKitAdditions;
+ (uint64_t)valueWithSCNVector4:()Core3DKitAdditions;
- (double)SCN_CGPointValue;
- (double)SCN_simdMatrix4Value;
- (float)SCNVector4Value;
- (float32_t)SCNVector3Value;
- (uint64_t)SCNMatrix4Value;
@end

@implementation NSValue(Core3DKitAdditions)

+ (uint64_t)valueWithSCNVector3:()Core3DKitAdditions
{
  return objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", a1, a2, a3, 0.0);
}

- (float32_t)SCNVector3Value
{
  if (!strcmp((const char *)[a1 objCType], "{SCNVector3=fff}"))
  {
    float v7 = 0.0;
    float32x2_t v6 = 0;
    [a1 getValue:&v6 size:12];
  }
  else if (!strcmp((const char *)[a1 objCType], "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    float64x2_t v4 = 0u;
    long long v5 = 0u;
    [a1 getValue:&v4 size:32];
    float v2 = *(double *)&v5;
    float32x2_t v6 = vcvt_f32_f64(v4);
    float v7 = v2;
  }
  else
  {
    float32x2_t v6 = 0;
    float v7 = 0.0;
  }
  return v6.f32[0];
}

- (float)SCNVector4Value
{
  if (!strcmp((const char *)[a1 objCType], "{SCNVector4=ffff}"))
  {
    SCNVector4 v5 = (SCNVector4)0;
    [a1 getValue:&v5 size:16];
  }
  else if (!strcmp((const char *)[a1 objCType], "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    float64x2_t v3 = 0u;
    float64x2_t v4 = 0u;
    [a1 getValue:&v3 size:32];
    SCNVector4 v5 = (SCNVector4)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v3), v4);
  }
  else
  {
    SCNVector4 v5 = SCNVector4Zero;
  }
  return v5.x;
}

+ (uint64_t)SCN_valueWithCGPoint:()Core3DKitAdditions
{
  *(double *)float64x2_t v3 = a1;
  *(double *)&v3[1] = a2;
  return [MEMORY[0x263F08D40] valueWithBytes:v3 objCType:"{CGPoint=dd}"];
}

- (double)SCN_CGPointValue
{
  v2[0] = 0;
  v2[1] = 0;
  [a1 getValue:v2 size:16];
  return *(double *)v2;
}

+ (uint64_t)valueWithSCNVector4:()Core3DKitAdditions
{
  return objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", a1, a2, a3, a4);
}

+ (uint64_t)valueWithSCNMatrix4:()Core3DKitAdditions
{
  float64x2_t v3 = vcvtq_f64_f32(a3[1]);
  v8[0] = vcvtq_f64_f32(*a3);
  v8[1] = v3;
  float64x2_t v4 = vcvtq_f64_f32(a3[3]);
  v8[2] = vcvtq_f64_f32(a3[2]);
  v8[3] = v4;
  float64x2_t v5 = vcvtq_f64_f32(a3[5]);
  v8[4] = vcvtq_f64_f32(a3[4]);
  v8[5] = v5;
  float64x2_t v6 = vcvtq_f64_f32(a3[7]);
  v8[6] = vcvtq_f64_f32(a3[6]);
  v8[7] = v6;
  return [a1 valueWithCATransform3D:v8];
}

- (uint64_t)SCNMatrix4Value
{
  if (!strcmp((const char *)[a1 objCType], "{SCNMatrix4=ffffffffffffffff}"))
  {
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
    return [a1 getValue:a2 size:64];
  }
  else
  {
    uint64_t result = strcmp((const char *)[a1 objCType], "{CATransform3D=dddddddddddddddd}");
    if (result)
    {
      uint64_t result = strcmp((const char *)[a1 objCType], "{?=[4]}");
      if (result)
      {
        *(SCNMatrix4 *)a2->f32 = SCNMatrix4Identity;
        return result;
      }
      float64x2_t v11 = 0u;
      float64x2_t v12 = 0u;
      float64x2_t v9 = 0u;
      float64x2_t v10 = 0u;
      uint64_t result = [a1 getValue:&v9 size:64];
      float32x4_t v5 = (float32x4_t)v9;
      float32x4_t v6 = (float32x4_t)v10;
      float32x4_t v7 = (float32x4_t)v11;
      float32x4_t v8 = (float32x4_t)v12;
    }
    else
    {
      float32x4_t v5 = 0uLL;
      float64x2_t v15 = 0u;
      float64x2_t v16 = 0u;
      float64x2_t v13 = 0u;
      float64x2_t v14 = 0u;
      float64x2_t v11 = 0u;
      float64x2_t v12 = 0u;
      float32x4_t v6 = 0uLL;
      float32x4_t v7 = 0uLL;
      float32x4_t v8 = 0uLL;
      float64x2_t v9 = 0u;
      float64x2_t v10 = 0u;
      if (a1)
      {
        uint64_t result = [a1 CATransform3DValue];
        float32x4_t v5 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v10);
        float32x4_t v6 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v11), v12);
        float32x4_t v7 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v13), v14);
        float32x4_t v8 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v15), v16);
      }
    }
    *a2 = v5;
    a2[1] = v6;
    a2[2] = v7;
    a2[3] = v8;
  }
  return result;
}

+ (uint64_t)SCN_valueWithSimdMatrix4:()Core3DKitAdditions
{
  v6[0] = vcvtq_f64_f32(*(float32x2_t *)a2.f32);
  v6[1] = vcvt_hight_f64_f32(a2);
  v6[2] = vcvtq_f64_f32(*(float32x2_t *)a3.f32);
  v6[3] = vcvt_hight_f64_f32(a3);
  v6[4] = vcvtq_f64_f32(*(float32x2_t *)a4.f32);
  v6[5] = vcvt_hight_f64_f32(a4);
  v6[6] = vcvtq_f64_f32(*(float32x2_t *)a5.f32);
  v6[7] = vcvt_hight_f64_f32(a5);
  return [a1 valueWithCATransform3D:v6];
}

- (double)SCN_simdMatrix4Value
{
  if (!strcmp((const char *)[a1 objCType], "{?=[4]}"))
  {
    float32x4_t v23 = 0u;
    float32x4_t v24 = 0u;
    float32x4_t v21 = 0u;
    float32x4_t v22 = 0u;
    [a1 getValue:&v21 size:64];
  }
  else if (!strcmp((const char *)[a1 objCType], "{SCNMatrix4=ffffffffffffffff}"))
  {
    float32x4_t v19 = 0u;
    float32x4_t v20 = 0u;
    float32x4_t v17 = 0u;
    float32x4_t v18 = 0u;
    [a1 getValue:&v17 size:64];
    float32x4_t v21 = v17;
    float32x4_t v22 = v18;
    float32x4_t v23 = v19;
    float32x4_t v24 = v20;
  }
  else if (!strcmp((const char *)[a1 objCType], "{CATransform3D=dddddddddddddddd}"))
  {
    if (a1)
    {
      [a1 CATransform3DValue];
      float32x4_t v4 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v15), v16);
      float32x4_t v5 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v13), v14);
      float32x4_t v6 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v11), v12);
      float32x4_t v7 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v10);
    }
    else
    {
      float32x4_t v7 = 0uLL;
      float32x4_t v6 = 0uLL;
      float32x4_t v5 = 0uLL;
      float32x4_t v4 = 0uLL;
    }
    float32x4_t v21 = v7;
    float32x4_t v22 = v6;
    float32x4_t v23 = v5;
    float32x4_t v24 = v4;
  }
  else
  {
    float32x4_t v2 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
    float32x4_t v21 = *(float32x4_t *)MEMORY[0x263EF89A8];
    float32x4_t v22 = v2;
    float32x4_t v3 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
    float32x4_t v23 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 32);
    float32x4_t v24 = v3;
  }
  return *(double *)v21.i64;
}

@end