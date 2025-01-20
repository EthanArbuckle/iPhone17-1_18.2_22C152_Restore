@interface NSValue(AVTExtensions)
+ (id)avt_valueWithFloat3_usableWithKVCForSCNVector3:()AVTExtensions;
+ (id)avt_valueWithFloat4_usableWithKVCForSCNVector4:()AVTExtensions;
+ (id)avt_valueWithFloat4x4:()AVTExtensions;
+ (uint64_t)avt_valueWithFloat3:()AVTExtensions;
+ (uint64_t)avt_valueWithFloat4:()AVTExtensions;
- (double)avt_float4x4Value;
- (float32x2_t)avt_float3Value;
- (float64_t)avt_float4Value;
@end

@implementation NSValue(AVTExtensions)

+ (id)avt_valueWithFloat3_usableWithKVCForSCNVector3:()AVTExtensions
{
  __n128 v3 = a1;
  v1 = [MEMORY[0x263F08D40] valueWithBytes:&v3 objCType:"{SCNVector3=fff}"];
  return v1;
}

+ (id)avt_valueWithFloat4_usableWithKVCForSCNVector4:()AVTExtensions
{
  __n128 v3 = a1;
  v1 = [MEMORY[0x263F08D40] valueWithBytes:&v3 objCType:"{SCNVector4=ffff}"];
  return v1;
}

+ (uint64_t)avt_valueWithFloat3:()AVTExtensions
{
  return objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", a1.n128_f32[0], a1.n128_f32[1], a1.n128_f32[2], 0.0);
}

- (float32x2_t)avt_float3Value
{
  id v1 = a1;
  if (!strcmp((const char *)[v1 objCType], "{SCNVector3=fff}"))
  {
LABEL_4:
    LODWORD(v5.f64[1]) = 0;
    v5.f64[0] = 0.0;
    objc_msgSend(v1, "getValue:", &v5, *(double *)&result);
    return *(float32x2_t *)&v5.f64[0];
  }
  id v3 = v1;
  if (strcmp((const char *)[v3 objCType], "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    id v1 = v3;
    v4 = (unsigned char *)[v1 objCType];
    float32x2_t result = 0;
    if (*v4) {
      return result;
    }
    goto LABEL_4;
  }
  memset(&v5, 0, 32);
  [v3 getValue:&v5];
  return vcvt_f32_f64(v5);
}

+ (uint64_t)avt_valueWithFloat4:()AVTExtensions
{
  return objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", a1.n128_f32[0], a1.n128_f32[1], a1.n128_f32[2], a1.n128_f32[3]);
}

- (float64_t)avt_float4Value
{
  id v1 = a1;
  if (!strcmp((const char *)[v1 objCType], "{SCNVector4=ffff}"))
  {
LABEL_4:
    float64x2_t v5 = 0uLL;
    objc_msgSend(v1, "getValue:", &v5, result);
    return v5.f64[0];
  }
  id v3 = v1;
  if (strcmp((const char *)[v3 objCType], "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    id v1 = v3;
    v4 = (unsigned char *)[v1 objCType];
    float64_t result = 0.0;
    if (*v4) {
      return result;
    }
    goto LABEL_4;
  }
  float64x2_t v5 = 0u;
  float64x2_t v6 = 0u;
  [v3 getValue:&v5];
  *(void *)&float64_t result = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v5), v6).u64[0];
  return result;
}

+ (id)avt_valueWithFloat4x4:()AVTExtensions
{
  v7[0] = vcvtq_f64_f32(*(float32x2_t *)a2.f32);
  v7[1] = vcvt_hight_f64_f32(a2);
  v7[2] = vcvtq_f64_f32(*(float32x2_t *)a3.f32);
  v7[3] = vcvt_hight_f64_f32(a3);
  v7[4] = vcvtq_f64_f32(*(float32x2_t *)a4.f32);
  v7[5] = vcvt_hight_f64_f32(a4);
  v7[6] = vcvtq_f64_f32(*(float32x2_t *)a5.f32);
  v7[7] = vcvt_hight_f64_f32(a5);
  float64x2_t v5 = [a1 valueWithCATransform3D:v7];
  return v5;
}

- (double)avt_float4x4Value
{
  id v1 = a1;
  if (!strcmp((const char *)[v1 objCType], "{?=[4]}"))
  {
    float32x4_t v21 = 0u;
    float32x4_t v22 = 0u;
    float32x4_t v19 = 0u;
    float32x4_t v20 = 0u;
    [v1 getValue:&v19];
  }
  else
  {
    id v2 = v1;
    if (!strcmp((const char *)[v2 objCType], "{SCNMatrix4=ffffffffffffffff}"))
    {
      float32x4_t v17 = 0u;
      float32x4_t v18 = 0u;
      float32x4_t v15 = 0u;
      float32x4_t v16 = 0u;
      [v2 getValue:&v15];
      float32x4_t v19 = v15;
      float32x4_t v20 = v16;
      float32x4_t v21 = v17;
      float32x4_t v22 = v18;
    }
    else
    {
      id v3 = v2;
      if (!strcmp((const char *)[v3 objCType], "{CATransform3D=dddddddddddddddd}"))
      {
        [v3 CATransform3DValue];
        float32x4_t v19 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v7), v8);
        float32x4_t v20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v10);
        float32x4_t v21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v11), v12);
        float32x4_t v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v13), v14);
      }
      else
      {
        float32x4_t v4 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
        float32x4_t v19 = *(float32x4_t *)MEMORY[0x263EF89A8];
        float32x4_t v20 = v4;
        float32x4_t v5 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
        float32x4_t v21 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 32);
        float32x4_t v22 = v5;
      }
    }
  }
  return *(double *)v19.i64;
}

@end