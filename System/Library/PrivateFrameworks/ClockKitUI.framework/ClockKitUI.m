void sub_1D317703C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1D3177D60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n64 _convertToRGBfFromSRGB8_fast(__int16 a1)
{
  result.n64_u32[0] = _CLKUIDecodeSRGBTable[a1];
  result.n64_u32[1] = _CLKUIDecodeSRGBTable[HIBYTE(a1)];
  return result;
}

double _convertToRGBfFromSRGBf_fast(double a1)
{
  LODWORD(v1) = _CLKUIDecodeSRGBTable[(float)(255.0 * *(float *)&a1)];
  HIDWORD(v1) = _CLKUIDecodeSRGBTable[vmuls_lane_f32(255.0, *(float32x2_t *)&a1, 1)];
  return v1;
}

double CLKUIConvertToRGBfFromXRSRGBf(int8x16_t a1)
{
  v2.i64[0] = 0x8000000080000000;
  v2.i64[1] = 0x8000000080000000;
  __asm { FMOV            V1.4S, #1.0 }
  unsigned long long v10 = *(_OWORD *)&a1 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
  float32x4_t v11 = (float32x4_t)vbicq_s8(vorrq_s8(vandq_s8(a1, v2), _Q1), (int8x16_t)vceqzq_f32((float32x4_t)a1));
  float32x4_t v8 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3D25AEE6u), (float32x4_t)v10), (int8x16_t)vmulq_f32((float32x4_t)v10, (float32x4_t)vdupq_n_s32(0x3D9E8391u)), (int8x16_t)_simd_pow_f4((simd_float4)vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D55891Au), (float32x4_t)v10, (float32x4_t)vdupq_n_s32(0x3F72A76Fu)), (simd_float4)vdupq_n_s64(0x4019999A4019999AuLL)));
  v8.i32[3] = HIDWORD(v10);
  *(void *)&double result = vmulq_f32(v8, v11).u64[0];
  return result;
}

double CLKUIConvertToXRSRGBfFromRGBf(int8x16_t a1)
{
  v1.i64[0] = 0x8000000080000000;
  v1.i64[1] = 0x8000000080000000;
  int8x16_t v2 = vandq_s8(a1, v1);
  __asm { FMOV            V1.4S, #1.0 }
  unsigned long long v10 = *(_OWORD *)&a1 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
  float32x4_t v11 = (float32x4_t)vbicq_s8(vorrq_s8(v2, _Q1), (int8x16_t)vceqzq_f32((float32x4_t)a1));
  float32x4_t v8 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3B4D2C6Eu), (float32x4_t)v10), (int8x16_t)vmulq_f32((float32x4_t)v10, (float32x4_t)vdupq_n_s32(0x414EB852u)), (int8x16_t)vmlaq_f32((float32x4_t)vdupq_n_s32(0xBD6147AE), (float32x4_t)_simd_pow_f4((simd_float4)v10, (simd_float4)vdupq_n_s64(0x3ED555553ED55555uLL)), (float32x4_t)vdupq_n_s32(0x3F870A3Du)));
  v8.i32[3] = HIDWORD(v10);
  *(void *)&double result = vmulq_f32(v8, v11).u64[0];
  return result;
}

__n64 CLKUIConvertToRGBfFromSRGBf_fast(float32x4_t a1)
{
  __asm { FMOV            V1.4S, #1.0 }
  _Q1.i64[0] = vminnmq_f32(vmaxnmq_f32(a1, (float32x4_t)0), _Q1).u64[0];
  result.n64_u32[0] = _CLKUIDecodeSRGBTable[(float)(255.0 * _Q1.f32[0])];
  result.n64_u32[1] = _CLKUIDecodeSRGBTable[vmuls_lane_f32(255.0, *(float32x2_t *)_Q1.f32, 1)];
  return result;
}

__n64 CLKUIConvertToSRGBfFromRGBf_fast(float32x4_t a1)
{
  __asm { FMOV            V1.4S, #1.0 }
  unint64_t v6 = vmulq_f32(vminnmq_f32(vmaxnmq_f32(a1, (float32x4_t)0), _Q1), (float32x4_t)vdupq_n_s32(0x45CDF000u)).u64[0];
  result.n64_u32[0] = _CLKUIEncodeSRGBTable[*(float *)&v6];
  result.n64_u32[1] = _CLKUIEncodeSRGBTable[*((float *)&v6 + 1)];
  return result;
}

uint64_t CLKUIConvertToSRGB8FromRGBf_fast(float32x4_t a1)
{
  float32x4_t v1 = vmulq_f32(a1, (float32x4_t)vdupq_n_s32(0x45CDF000u));
  v1.i32[0] = _CLKUIEncodeSRGBTable[v1.f32[0]];
  v1.i32[1] = _CLKUIEncodeSRGBTable[v1.f32[1]];
  v1.i32[2] = _CLKUIEncodeSRGBTable[v1.f32[2]];
  v1.i32[3] = a1.i32[3];
  int8x16_t v2 = (int8x16_t)vmulq_f32(v1, (float32x4_t)vdupq_n_s32(0x437F0000u));
  int v3 = (int)*(float *)v2.i32;
  v2.i32[0] = vextq_s8(v2, v2, 8uLL).i32[1];
  *(uint32x2_t *)v2.i8 = vshl_u32((uint32x2_t)vcvt_s32_f32(*(float32x2_t *)v2.i8), (uint32x2_t)0x800000018);
  return v2.i32[0] | ((int)*(float *)&v2.i32[2] << 16) | v3 | v2.i32[1];
}

__n64 CLKUIConvertToRGBfFromSRGB8_fast(__int16 a1)
{
  result.n64_u32[0] = _CLKUIDecodeSRGBTable[a1];
  result.n64_u32[1] = _CLKUIDecodeSRGBTable[HIBYTE(a1)];
  return result;
}

__n64 CLKUIConvertToRGBfFromUIColor_fast(void *a1)
{
  double v7 = 0.0;
  uint64_t v5 = 0;
  double v6 = 0.0;
  uint64_t v4 = 0;
  [a1 getRed:&v7 green:&v6 blue:&v5 alpha:&v4];
  float v1 = v7;
  float v2 = v6;
  result.n64_u32[0] = _CLKUIDecodeSRGBTable[(float)(v1 * 255.0)];
  result.n64_u32[1] = _CLKUIDecodeSRGBTable[(float)(v2 * 255.0)];
  return result;
}

uint64_t CLKUIConvertToUIColorFromRGBf_fast(float32x4_t a1)
{
  float32x4_t v1 = vmulq_f32(a1, (float32x4_t)vdupq_n_s32(0x45CDF000u));
  return [MEMORY[0x1E4FB1618] colorWithRed:*(float *)&_CLKUIEncodeSRGBTable[v1.f32[0]] green:*(float *)&_CLKUIEncodeSRGBTable[v1.f32[1]] blue:*(float *)&_CLKUIEncodeSRGBTable[v1.f32[2]] alpha:a1.f32[3]];
}

int8x16_t CLKUIConvertToRGBfFromUIColor(void *a1)
{
  float64_t v8 = 0.0;
  float64_t v9 = 0.0;
  float64_t v6 = 0.0;
  float64_t v7 = 0.0;
  [a1 getRed:&v9 green:&v8 blue:&v7 alpha:&v6];
  v1.f64[0] = v9;
  v2.f64[0] = v7;
  v1.f64[1] = v8;
  v2.f64[1] = v6;
  float32x4_t v4 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v1), v2);
  __int32 v5 = vcvt_f32_f64(v2).i32[1];
  int8x16_t result = (int8x16_t)_simd_pow_f4((simd_float4)vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D55891Au), v4, (float32x4_t)vdupq_n_s32(0x3F72A76Fu)), (simd_float4)vdupq_n_s64(0x4019999A4019999AuLL));
  result.i64[0] = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3D25AEE6u), v4), (int8x16_t)vmulq_f32(v4, (float32x4_t)vdupq_n_s32(0x3D9E8391u)), result).u64[0];
  result.i32[3] = v5;
  return result;
}

uint64_t CLKUIConvertToUIColorFromRGBf(float32x4_t a1)
{
  int8x16_t v1 = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3B4D2C6Eu), a1), (int8x16_t)vmulq_f32(a1, (float32x4_t)vdupq_n_s32(0x414EB852u)), (int8x16_t)vmlaq_f32((float32x4_t)vdupq_n_s32(0xBD6147AE), (float32x4_t)_simd_pow_f4((simd_float4)a1, (simd_float4)vdupq_n_s64(0x3ED555553ED55555uLL)), (float32x4_t)vdupq_n_s32(0x3F870A3Du)));
  float64x2_t v2 = (void *)MEMORY[0x1E4FB1618];
  return [v2 colorWithRed:*(float *)v1.i32 green:*(float *)&v1.i32[1] blue:*(float *)&v1.i32[2] alpha:a1.f32[3]];
}

int8x16_t CLKUIConvertToRGBfFromUIColor_dynamic(void *a1)
{
  double v16 = 0.0;
  double v17 = 0.0;
  float64_t v14 = 0.0;
  float64_t v15 = 0.0;
  [a1 getRed:&v17 green:&v16 blue:&v15 alpha:&v14];
  float v1 = v17;
  *(float *)result.i32 = v16;
  v3.f64[0] = v15;
  v3.f64[1] = v14;
  float32x2_t v4 = vcvt_f32_f64(v3);
  float32x4_t v5 = vcvt_hight_f32_f64((int32x2_t)__PAIR64__(result.u32[0], LODWORD(v1)), v3);
  if ((vmaxvq_u32((uint32x4_t)vcltzq_f32(v5)) & 0x80000000) != 0) {
    goto LABEL_4;
  }
  __asm { FMOV            V2.4S, #1.0 }
  if ((vmaxvq_u32((uint32x4_t)vcgtq_f32(v5, _Q2)) & 0x80000000) != 0)
  {
LABEL_4:
    float32x4_t v12 = v5;
    unsigned __int32 v13 = v4.u32[1];
    int8x16_t result = (int8x16_t)_simd_pow_f4((simd_float4)vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D55891Au), v5, (float32x4_t)vdupq_n_s32(0x3F72A76Fu)), (simd_float4)vdupq_n_s64(0x4019999A4019999AuLL));
    result.i64[0] = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3D25AEE6u), v12), (int8x16_t)vmulq_f32(v12, (float32x4_t)vdupq_n_s32(0x3D9E8391u)), result).u64[0];
    result.i32[3] = v13;
  }
  else
  {
    float32x4_t v11 = &_CLKUIDecodeSRGBTable[(float)(*(float *)result.i32 * 255.0)];
    result.i32[0] = _CLKUIDecodeSRGBTable[(float)(v1 * 255.0)];
    result.i32[1] = *v11;
  }
  return result;
}

uint64_t CLKUIConvertToUIColorFromRGBf_dynamic(float32x4_t a1)
{
  float32x4_t v1 = a1;
  if ((vmaxvq_u32((uint32x4_t)vcltzq_f32(a1)) & 0x80000000) != 0) {
    goto LABEL_4;
  }
  __asm { FMOV            V0.4S, #1.0 }
  if ((vmaxvq_u32((uint32x4_t)vcgtq_f32(v1, _Q0)) & 0x80000000) != 0)
  {
LABEL_4:
    float32x4_t v12 = v1;
    float32x4_t v9 = (float32x4_t)_simd_pow_f4((simd_float4)v1, (simd_float4)vdupq_n_s64(0x3ED555553ED55555uLL));
    v1.i32[3] = v12.i32[3];
    int8x16_t v8 = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3B4D2C6Eu), v12), (int8x16_t)vmulq_f32(v12, (float32x4_t)vdupq_n_s32(0x414EB852u)), (int8x16_t)vmlaq_f32((float32x4_t)vdupq_n_s32(0xBD6147AE), v9, (float32x4_t)vdupq_n_s32(0x3F870A3Du)));
  }
  else
  {
    float32x4_t v7 = vmulq_f32(v1, (float32x4_t)vdupq_n_s32(0x45CDF000u));
    v8.i32[0] = _CLKUIEncodeSRGBTable[v7.f32[0]];
    v8.i32[1] = _CLKUIEncodeSRGBTable[v7.f32[1]];
    v8.i32[2] = _CLKUIEncodeSRGBTable[v7.f32[2]];
  }
  unsigned long long v10 = (void *)MEMORY[0x1E4FB1618];
  return [v10 colorWithRed:*(float *)v8.i32 green:*(float *)&v8.i32[1] blue:*(float *)&v8.i32[2] alpha:v1.f32[3]];
}

float CLKUIConvertToRGBFromSRGB_fast(float a1)
{
  return *(float *)&_CLKUIDecodeSRGBTable[(float)(a1 * 255.0)];
}

float CLKUIConvertToSRGBFromRGB_fast(float a1)
{
  return *(float *)&_CLKUIEncodeSRGBTable[(float)(a1 * 6590.0)];
}

uint64_t _CLKUIRawImageGenerateMipmapsSRGB8(uint64_t result, unsigned int a2)
{
  if ((int)a2 >= 2)
  {
    float64x2_t v2 = (unsigned __int32 *)(result + 4 * a2 * a2);
    float32x4_t v3 = (float32x4_t)vdupq_n_s32(0x44CDF000u);
    __asm { FMOV            V1.4S, #0.25 }
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    do
    {
      unint64_t v10 = 0;
      uint64_t v11 = a2;
      float32x4_t v12 = v2;
      unint64_t v13 = a2;
      do
      {
        float64_t v14 = (int *)(result + 4 * v10 * v13);
        float64_t v15 = &v14[v13];
        do
        {
          double v16 = &v14[v11];
          int v17 = *v14;
          int v18 = v14[1];
          v14 += 2;
          float v19 = (float)HIBYTE(v17);
          v20.i32[0] = _CLKUIDecodeSRGBTable[v17];
          v20.i32[1] = _CLKUIDecodeSRGBTable[BYTE1(v17)];
          v21.i32[0] = _CLKUIDecodeSRGBTable[v18];
          v21.i32[1] = _CLKUIDecodeSRGBTable[BYTE1(v18)];
          v20.i32[2] = _CLKUIDecodeSRGBTable[BYTE2(v17)];
          v21.i32[2] = _CLKUIDecodeSRGBTable[BYTE2(v18)];
          int v22 = *v16;
          LODWORD(v16) = v16[1];
          v23.i32[0] = _CLKUIDecodeSRGBTable[v22];
          v23.i32[1] = _CLKUIDecodeSRGBTable[BYTE1(v22)];
          v23.i32[2] = _CLKUIDecodeSRGBTable[BYTE2(v22)];
          v20.f32[3] = v19 * 0.0039216;
          v21.f32[3] = (float)HIBYTE(v18) * 0.0039216;
          v23.f32[3] = (float)HIBYTE(v22) * 0.0039216;
          v24.i32[0] = _CLKUIDecodeSRGBTable[v16];
          v24.i32[1] = _CLKUIDecodeSRGBTable[BYTE1(v16)];
          v24.i32[2] = _CLKUIDecodeSRGBTable[BYTE2(v16)];
          v24.f32[3] = (float)BYTE3(v16) * 0.0039216;
          float32x4_t v25 = vaddq_f32(vaddq_f32(v21, v20), vaddq_f32(v23, v24));
          float32x4_t v26 = vmulq_f32(v25, v3);
          v26.i32[0] = _CLKUIEncodeSRGBTable[v26.f32[0]];
          v26.i32[1] = _CLKUIEncodeSRGBTable[v26.f32[1]];
          v26.i32[2] = _CLKUIEncodeSRGBTable[v26.f32[2]];
          v26.i32[3] = vmulq_f32(v25, _Q1).i32[3];
          int8x16_t v27 = (int8x16_t)vmulq_f32(v26, v9);
          LODWORD(v16) = (int)*(float *)v27.i32;
          v27.i32[0] = vextq_s8(v27, v27, 8uLL).i32[1];
          *(uint32x2_t *)v27.i8 = vshl_u32((uint32x2_t)vcvt_s32_f32(*(float32x2_t *)v27.i8), (uint32x2_t)0x800000018);
          *v12++ = v27.i32[0] | ((int)*(float *)&v27.i32[2] << 16) | v16 | v27.i32[1];
        }
        while (v14 < v15);
        v10 += 2;
      }
      while (v10 < v13);
      result += 4 * (v13 * v13);
      a2 = v13 >> 1;
      v2 += a2 * a2;
    }
    while (v13 > 3);
  }
  return result;
}

uint64_t _CLKUIRawImageWriteToFileSRGB8(const void *a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  int8x16_t v8 = CGDataProviderCreateWithData(0, a1, 4 * a2 * a3, 0);
  float32x4_t v9 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  unint64_t v10 = CGImageCreate(a2, a3, 8uLL, 0x20uLL, 4 * a2, v9, 0, v8, 0, 0, kCGRenderingIntentDefault);
  uint64_t v11 = [MEMORY[0x1E4FB1818] imageWithCGImage:v10];
  float32x4_t v12 = UIImagePNGRepresentation(v11);
  [v12 writeToFile:v7 atomically:1];
  CGImageRelease(v10);
  CGDataProviderRelease(v8);
  CGColorSpaceRelease(v9);

  return 1;
}

void sub_1D3178B94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D3178BA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D3178BB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D3178BC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D3178BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D3178BE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CLKUIInterpolateBetweenColors(void *a1, void *a2, float a3)
{
  id v4 = a1;
  id v5 = a2;
  if (CLKEqualObjects())
  {
    id v6 = v5;
  }
  else
  {
    double v42 = 0.0;
    double v43 = 0.0;
    float64_t v40 = 0.0;
    float64_t v41 = 0.0;
    [v4 getRed:&v43 green:&v42 blue:&v41 alpha:&v40];
    float v7 = v43;
    v8.f64[0] = v41;
    *(float *)v9.i32 = v42;
    v8.f64[1] = v40;
    *(float32x2_t *)&long long v10 = vcvt_f32_f64(v8);
    float32x4_t v11 = vcvt_hight_f32_f64((int32x2_t)__PAIR64__(v9.u32[0], LODWORD(v7)), v8);
    __asm { FMOV            V3.4S, #1.0 }
    long long v35 = v10;
    float32x4_t v36 = _Q3;
    if ((vmaxvq_u32((uint32x4_t)vcltzq_f32(v11)) & 0x80000000) != 0
      || (vmaxvq_u32((uint32x4_t)vcgtq_f32(v11, _Q3)) & 0x80000000) != 0)
    {
      int8x16_t v9 = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3D25AEE6u), v11), (int8x16_t)vmulq_f32(v11, (float32x4_t)vdupq_n_s32(0x3D9E8391u)), (int8x16_t)_simd_pow_f4((simd_float4)vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D55891Au), v11, (float32x4_t)vdupq_n_s32(0x3F72A76Fu)), (simd_float4)vdupq_n_s64(0x4019999A4019999AuLL)));
    }
    else
    {
      int v17 = &_CLKUIDecodeSRGBTable[(float)(*(float *)v9.i32 * 255.0)];
      v9.i32[0] = _CLKUIDecodeSRGBTable[(float)(v7 * 255.0)];
      v9.i32[1] = *v17;
      v9.i32[2] = _CLKUIDecodeSRGBTable[(float)(255.0 * *(float *)&v10)];
    }
    float32x4_t v38 = (float32x4_t)v9;
    double v42 = 0.0;
    double v43 = 0.0;
    float64_t v40 = 0.0;
    float64_t v41 = 0.0;
    [v5 getRed:&v43 green:&v42 blue:&v41 alpha:&v40];
    float v18 = v43;
    v19.f64[0] = v41;
    float v20 = v42;
    v19.f64[1] = v40;
    *(float32x2_t *)&long long v21 = vcvt_f32_f64(v19);
    float32x4_t v22 = vcvt_hight_f32_f64((int32x2_t)__PAIR64__(LODWORD(v20), LODWORD(v18)), v19);
    if ((vmaxvq_u32((uint32x4_t)vcltzq_f32(v22)) & 0x80000000) != 0
      || (vmaxvq_u32((uint32x4_t)vcgtq_f32(v22, v36)) & 0x80000000) != 0)
    {
      float32x4_t v33 = v22;
      long long v34 = v21;
      int8x16_t v25 = (int8x16_t)_simd_pow_f4((simd_float4)vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D55891Au), v22, (float32x4_t)vdupq_n_s32(0x3F72A76Fu)), (simd_float4)vdupq_n_s64(0x4019999A4019999AuLL));
      *(void *)&long long v21 = v34;
      float32x4_t v24 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3D25AEE6u), v33), (int8x16_t)vmulq_f32(v33, (float32x4_t)vdupq_n_s32(0x3D9E8391u)), v25);
    }
    else
    {
      float32x4_t v23 = &_CLKUIDecodeSRGBTable[(float)(v20 * 255.0)];
      v24.i32[0] = _CLKUIDecodeSRGBTable[(float)(v18 * 255.0)];
      v24.i32[1] = *v23;
      v24.i32[2] = _CLKUIDecodeSRGBTable[(float)(255.0 * *(float *)&v21)];
    }
    float32x4_t v26 = v38;
    v26.i32[3] = DWORD1(v35);
    v24.i32[3] = DWORD1(v21);
    float32x4_t v27 = vmlaq_n_f32(v26, vsubq_f32(v24, v26), a3);
    if ((vmaxvq_u32((uint32x4_t)vcltzq_f32(v27)) & 0x80000000) != 0
      || (vmaxvq_u32((uint32x4_t)vcgtq_f32(v27, v36)) & 0x80000000) != 0)
    {
      float32x4_t v39 = v27;
      float32x4_t v30 = (float32x4_t)_simd_pow_f4((simd_float4)v27, (simd_float4)vdupq_n_s64(0x3ED555553ED55555uLL));
      v27.i32[3] = v39.i32[3];
      int8x16_t v29 = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3B4D2C6Eu), v39), (int8x16_t)vmulq_f32(v39, (float32x4_t)vdupq_n_s32(0x414EB852u)), (int8x16_t)vmlaq_f32((float32x4_t)vdupq_n_s32(0xBD6147AE), v30, (float32x4_t)vdupq_n_s32(0x3F870A3Du)));
    }
    else
    {
      float32x4_t v28 = vmulq_f32(v27, (float32x4_t)vdupq_n_s32(0x45CDF000u));
      v29.i32[0] = _CLKUIEncodeSRGBTable[v28.f32[0]];
      v29.i32[1] = _CLKUIEncodeSRGBTable[v28.f32[1]];
      v29.i32[2] = _CLKUIEncodeSRGBTable[v28.f32[2]];
    }
    objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", *(float *)v29.i32, *(float *)&v29.i32[1], *(float *)&v29.i32[2], v27.f32[3], *(double *)&v21, *(_OWORD *)&v33, v34, v35);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v31 = v6;

  return v31;
}

void sub_1D3178FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D3178FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D3178FD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D3178FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double _CLKUIRGB2LAB(float32x4_t a1)
{
  float32x4_t v1 = vmulq_f32(vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)xmmword_1D31AF3E0, *(float32x2_t *)a1.f32, 1), (float32x4_t)xmmword_1D31AF3D0, a1.f32[0]), (float32x4_t)xmmword_1D31AF3F0, a1, 2), (float32x4_t)xmmword_1D31AF400);
  float32x4_t v9 = v1;
  if (v1.f32[0] < 0.0088565)
  {
    float v2 = (float)(v1.f32[0] * 7.787) + 0.13793;
    float v3 = v1.f32[1];
    if (v1.f32[1] >= 0.0088565) {
      goto LABEL_3;
    }
LABEL_6:
    float v4 = (float)(v3 * 7.787) + 0.13793;
    float v5 = v1.f32[2];
    if (v1.f32[2] < 0.0088565) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  float v6 = cbrtf(v1.f32[0]);
  v1.i32[2] = v9.i32[2];
  float v2 = v6;
  float v3 = v9.f32[1];
  if (v9.f32[1] < 0.0088565) {
    goto LABEL_6;
  }
LABEL_3:
  float v4 = cbrtf(v3);
  float v5 = v9.f32[2];
  if (v9.f32[2] >= 0.0088565) {
LABEL_4:
  }
    cbrtf(v5);
LABEL_7:
  *(float *)&double v7 = (float)(v4 * 116.0) + -16.0;
  *((float *)&v7 + 1) = (float)(v2 - v4) * 500.0;
  return v7;
}

double _CLKUILAB2RGB(int32x4_t a1, double a2, float32x2_t a3, double a4, double a5, double a6)
{
  float32x2_t v6 = (float32x2_t)vdup_laneq_s32(a1, 2);
  v6.f32[0] = 0.0086207 * *(float *)a1.i32;
  a3.i32[0] = 1041055179;
  v7.f32[0] = vadd_f32(v6, a3).f32[0];
  int32x2_t v8 = (int32x2_t)vmul_f32(v6, (float32x2_t)vdup_n_s32(0x3BA3D70Au));
  *(float *)&a2 = v7.f32[0] + vmuls_lane_f32(0.002, *(float32x2_t *)a1.i8, 1);
  v7.i32[1] = v8.i32[1];
  float32x2_t v9 = vsub_f32(v7, (float32x2_t)vdup_lane_s32(v8, 1));
  *(float *)&a6 = *(float *)&a2 * 0.12842;
  float32x2_t v10 = (float32x2_t)vzip1_s32(*(int32x2_t *)&a2, (int32x2_t)v7);
  float32x2_t v11 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)a1.i8, 0);
  v11.i32[0] = LODWORD(a6);
  LODWORD(a6) = -1131341145;
  v11.i32[0] = vadd_f32(v11, *(float32x2_t *)&a6).u32[0];
  v11.i32[1] = vmul_n_f32((float32x2_t)vdup_n_s32(0x3A911AA7u), *(float *)&a1).i32[1];
  *(int8x8_t *)a1.i8 = vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)vdup_n_s32(0x3E53DCB1u), v10), (int8x8_t)v11, (int8x8_t)vmul_f32(vmul_f32(v10, v10), v10));
  unsigned __int32 v12 = vmul_f32(vmul_f32(v9, v9), v9).u32[0];
  if (v9.f32[0] < 0.2069) {
    *(float *)&unsigned __int32 v12 = (float)(0.12842 * v9.f32[0]) + -0.017713;
  }
  a1.i32[2] = v12;
  float32x4_t v13 = vmulq_f32((float32x4_t)a1, (float32x4_t)xmmword_1D31AF410);
  *(void *)&double result = vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)xmmword_1D31AF430, *(float32x2_t *)v13.f32, 1), (float32x4_t)xmmword_1D31AF420, v13.f32[0]), (float32x4_t)xmmword_1D31AF440, v13, 2).u64[0];
  return result;
}

double CLKUIConvertRGBtoLAB(float32x4_t a1)
{
  float32x4_t v1 = vmulq_f32(vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)xmmword_1D31AF3E0, *(float32x2_t *)a1.f32, 1), (float32x4_t)xmmword_1D31AF3D0, a1.f32[0]), (float32x4_t)xmmword_1D31AF3F0, a1, 2), (float32x4_t)xmmword_1D31AF400);
  float32x4_t v9 = v1;
  if (v1.f32[0] < 0.0088565)
  {
    float v2 = (float)(v1.f32[0] * 7.787) + 0.13793;
    float v3 = v1.f32[1];
    if (v1.f32[1] >= 0.0088565) {
      goto LABEL_3;
    }
LABEL_6:
    float v4 = (float)(v3 * 7.787) + 0.13793;
    float v5 = v1.f32[2];
    if (v1.f32[2] < 0.0088565) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  float v6 = cbrtf(v1.f32[0]);
  v1.i32[2] = v9.i32[2];
  float v2 = v6;
  float v3 = v9.f32[1];
  if (v9.f32[1] < 0.0088565) {
    goto LABEL_6;
  }
LABEL_3:
  float v4 = cbrtf(v3);
  float v5 = v9.f32[2];
  if (v9.f32[2] >= 0.0088565) {
LABEL_4:
  }
    cbrtf(v5);
LABEL_7:
  *(float *)&double v7 = (float)(v4 * 116.0) + -16.0;
  *((float *)&v7 + 1) = (float)(v2 - v4) * 500.0;
  return v7;
}

double CLKUIConvertLABtoRGB(int32x4_t a1, float32x4_t a2, double a3, double a4, double a5, float32x2_t a6)
{
  float32x2_t v6 = (float32x2_t)vdup_laneq_s32(a1, 2);
  v6.f32[0] = 0.0086207 * *(float *)a1.i32;
  a2.i32[0] = 1041055179;
  v7.f32[0] = vadd_f32(v6, *(float32x2_t *)a2.f32).f32[0];
  int32x2_t v8 = (int32x2_t)vmul_f32(v6, (float32x2_t)vdup_n_s32(0x3BA3D70Au));
  *(float *)&a3 = v7.f32[0] + vmuls_lane_f32(0.002, *(float32x2_t *)a1.i8, 1);
  v7.i32[1] = v8.i32[1];
  float32x2_t v9 = vsub_f32(v7, (float32x2_t)vdup_lane_s32(v8, 1));
  float32x2_t v10 = (float32x2_t)vzip1_s32(*(int32x2_t *)&a3, (int32x2_t)v7);
  float32x2_t v11 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)a1.i8, 0);
  v11.f32[0] = *(float *)&a3 * 0.12842;
  a6.i32[0] = -1131341145;
  v12.i32[0] = vadd_f32(v11, a6).u32[0];
  v12.i32[1] = vmul_n_f32((float32x2_t)vdup_n_s32(0x3A911AA7u), *(float *)&a1).i32[1];
  *(int8x8_t *)a2.f32 = vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)vdup_n_s32(0x3E53DCB1u), v10), v12, (int8x8_t)vmul_f32(vmul_f32(v10, v10), v10));
  unsigned __int32 v13 = vmul_f32(vmul_f32(v9, v9), v9).u32[0];
  if (v9.f32[0] < 0.2069) {
    *(float *)&unsigned __int32 v13 = (float)(0.12842 * v9.f32[0]) + -0.017713;
  }
  a2.i32[2] = v13;
  float32x4_t v14 = vmulq_f32(a2, (float32x4_t)xmmword_1D31AF410);
  *(void *)&double result = vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)xmmword_1D31AF430, *(float32x2_t *)v14.f32, 1), (float32x4_t)xmmword_1D31AF420, v14.f32[0]), (float32x4_t)xmmword_1D31AF440, v14, 2).u64[0];
  return result;
}

float CLKUILightnessForColor(void *a1)
{
  id v1 = a1;
  double v19 = 0.0;
  double v20 = 0.0;
  float64_t v17 = 0.0;
  float64_t v18 = 0.0;
  [v1 getRed:&v20 green:&v19 blue:&v18 alpha:&v17];
  float v2 = v20;
  float v3 = v19;
  v4.f64[0] = v18;
  v4.f64[1] = v17;
  float32x4_t v5 = vcvt_hight_f32_f64((int32x2_t)__PAIR64__(LODWORD(v3), LODWORD(v2)), v4);
  if ((vmaxvq_u32((uint32x4_t)vcltzq_f32(v5)) & 0x80000000) != 0) {
    goto LABEL_4;
  }
  __asm { FMOV            V3.4S, #1.0 }
  if ((vmaxvq_u32((uint32x4_t)vcgtq_f32(v5, _Q3)) & 0x80000000) != 0)
  {
LABEL_4:
    float64x2_t v4 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3D25AEE6u), v5), (int8x16_t)vmulq_f32(v5, (float32x4_t)vdupq_n_s32(0x3D9E8391u)), (int8x16_t)_simd_pow_f4((simd_float4)vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D55891Au), v5, (float32x4_t)vdupq_n_s32(0x3F72A76Fu)), (simd_float4)vdupq_n_s64(0x4019999A4019999AuLL)));
  }
  else
  {
    float32x2_t v11 = &_CLKUIDecodeSRGBTable[(float)(255.0 * vcvt_f32_f64(v4).f32[0])];
    LODWORD(v4.f64[0]) = _CLKUIDecodeSRGBTable[(float)(v2 * 255.0)];
    HIDWORD(v4.f64[0]) = _CLKUIDecodeSRGBTable[(float)(v3 * 255.0)];
    LODWORD(v4.f64[1]) = *v11;
  }
  float32x2_t v12 = vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v4, (int8x16_t)v4, 4uLL), (float32x2_t)0x3D93DDDB3F371567);
  float v13 = (float)(v12.f32[0] + (float)(0.21259 * *(float *)v4.f64)) + v12.f32[1];
  if (v13 >= 0.0088565) {
    float v14 = cbrtf(v13);
  }
  else {
    float v14 = (float)(v13 * 7.787) + 0.13793;
  }
  float v15 = (float)(v14 * 116.0) + -16.0;

  return v15;
}

void sub_1D31796D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CLKUICompareColorsByLightness(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 isEqual:v4])
  {
    uint64_t v5 = 0;
  }
  else
  {
    float v6 = CLKUILightnessForColor(v3);
    float v7 = CLKUILightnessForColor(v4);
    if (v6 >= v7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = -1;
    }
    if (v6 > v7) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = v8;
    }
  }

  return v5;
}

void sub_1D3179764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D3179778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D317978C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CLKGetBytesFromImage(void *a1, size_t a2, size_t a3, uint64_t a4, size_t a5, CGColorSpace *a6, uint32_t a7)
{
  float v13 = (CGImage *)[a1 CGImage];
  size_t v14 = a4 * a2;
  float v15 = malloc_type_calloc(v14 * a3, 1uLL, 0x100004077774924uLL);
  double v16 = CGBitmapContextCreate(v15, a2, a3, a5, v14, a6, a7);
  v20.size.width = (double)a2;
  v20.size.height = (double)a3;
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  CGContextDrawImage(v16, v20, v13);
  CGContextRelease(v16);
  float64_t v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v15 length:v14 * a3];
  free(v15);
  return v17;
}

id CLKCreateImageFromBytes(UInt8 *bytes, size_t a2, size_t a3, uint64_t a4, size_t a5, CGColorSpace *a6, CGBitmapInfo a7)
{
  size_t v13 = a4 * a2;
  CFDataRef v14 = CFDataCreate(0, bytes, a4 * a2 * a3);
  float v15 = CGDataProviderCreateWithCFData(v14);
  double v16 = CGImageCreate(a2, a3, a5, a5 * a4, v13, a6, a7, v15, 0, 0, kCGRenderingIntentDefault);
  CGDataProviderRelease(v15);
  CFRelease(v14);
  float64_t v17 = [MEMORY[0x1E4FB1818] imageWithCGImage:v16];
  CGImageRelease(v16);
  return v17;
}

void sub_1D3179994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CLKTextureCoordinateToRgb(double a1)
{
  return (int)(a1 * 127.5 + 127.5);
}

double _CLKIntensityForPixel(float32x4_t a1)
{
  return vaddq_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a1.f32, 1), a1), (float32x4_t)vdupq_laneq_s32((int32x4_t)a1, 2)).f32[0]* 0.333333333;
}

unint64_t _CLKClamp(uint64_t a1, unint64_t a2)
{
  if (a1 <= a2) {
    return a1 & ~(a1 >> 63);
  }
  else {
    return a2;
  }
}

double _CLKPixelAtPosition(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint8x8_t a6)
{
  uint64_t v6 = a2 - 1;
  if (a2 - 1 >= (unint64_t)a4) {
    uint64_t v6 = a4 & ~(a4 >> 63);
  }
  uint64_t v7 = a3 - 1;
  if (a3 - 1 >= (unint64_t)a5) {
    uint64_t v7 = a5 & ~(a5 >> 63);
  }
  a6.i32[0] = *(_DWORD *)&a1[4 * v6 + 4 * v7 * a2];
  *(void *)&double result = vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a6))).u64[0];
  return result;
}

double _CLKIntensityForPixelAtPosition(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, float a6, float a7, float a8)
{
  uint64_t v8 = a2 - 1;
  if (a2 - 1 >= (unint64_t)a4) {
    uint64_t v8 = a4 & ~(a4 >> 63);
  }
  uint64_t v9 = a3 - 1;
  if (a3 - 1 >= (unint64_t)a5) {
    uint64_t v9 = a5 & ~(a5 >> 63);
  }
  float32x2_t v10 = &a1[4 * v8 + 4 * v9 * a2];
  LOBYTE(a6) = *v10;
  LOBYTE(a7) = v10[1];
  LOBYTE(a8) = v10[2];
  return (float)((float)((float)LODWORD(a7) + (float)LODWORD(a6)) + (float)LODWORD(a8)) * 0.333333333;
}

double _CLKCalculateNormal(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, float a6, float a7, float a8, float a9, float a10, float a11, float a12, float a13)
{
  uint64_t v16 = a5 - 1;
  unint64_t v17 = a2 - 1;
  if (a2 - 1 >= (unint64_t)(a4 - 1)) {
    uint64_t v18 = (a4 - 1) & ~((a4 - 1) >> 63);
  }
  else {
    uint64_t v18 = a2 - 1;
  }
  unint64_t v19 = a3 - 1;
  uint64_t v20 = v16 & ~(v16 >> 63);
  if (a3 - 1 < (unint64_t)v16) {
    uint64_t v20 = a3 - 1;
  }
  uint64_t v21 = v20 * a2;
  float32x4_t v22 = &a1[4 * v21 + 4 * v18];
  LOBYTE(a6) = *v22;
  LOBYTE(a7) = v22[1];
  LOBYTE(a8) = v22[2];
  float v23 = (float)LODWORD(a8);
  double v24 = (float)((float)((float)LODWORD(a7) + (float)LODWORD(a6)) + v23);
  unsigned int v25 = 1431655765;
  double v26 = v24 * -0.333333333;
  uint64_t v27 = a5 & ~(a5 >> 63);
  if (v19 < a5) {
    uint64_t v27 = a3 - 1;
  }
  uint64_t v28 = v27 * a2;
  int8x16_t v29 = &a1[4 * v28 + 4 * v18];
  LOBYTE(v25) = *v29;
  LOBYTE(v23) = v29[1];
  float v30 = (float)LODWORD(v23);
  LOBYTE(a9) = v29[2];
  float v31 = (float)LODWORD(a9);
  double v32 = (float)((float)(v30 + (float)v25) + v31);
  if (v19 >= a5 + 1) {
    unint64_t v19 = (a5 + 1) & ~((a5 + 1) >> 63);
  }
  unint64_t v33 = v19 * a2;
  long long v34 = &a1[4 * v33 + 4 * v18];
  LOBYTE(v30) = *v34;
  LOBYTE(v31) = v34[1];
  LOBYTE(a10) = v34[2];
  float v35 = (float)LODWORD(a10);
  double v36 = (float)((float)((float)LODWORD(v31) + (float)LODWORD(v30)) + v35) * 0.333333333;
  uint64_t v37 = a4 & ~(a4 >> 63);
  if (v17 < a4) {
    uint64_t v37 = a2 - 1;
  }
  float32x4_t v38 = &a1[4 * v21 + 4 * v37];
  LOBYTE(v35) = *v38;
  LOBYTE(a11) = v38[1];
  *(float *)&unsigned int v39 = (float)LODWORD(a11);
  LOBYTE(a12) = v38[2];
  *(float *)&unsigned int v40 = (float)LODWORD(a12);
  double v41 = (float)((float)(*(float *)&v39 + (float)LODWORD(v35)) + *(float *)&v40);
  double v42 = &a1[4 * v33 + 4 * v37];
  LOBYTE(v39) = *v42;
  LOBYTE(v40) = v42[1];
  float v43 = (float)v40;
  LOBYTE(a13) = v42[2];
  float v44 = (float)LODWORD(a13);
  double v45 = (float)((float)(v43 + (float)v39) + v44);
  if (v17 >= a4 + 1) {
    unint64_t v17 = (a4 + 1) & ~((a4 + 1) >> 63);
  }
  v46 = &a1[4 * v21 + 4 * v17];
  LOBYTE(v43) = *v46;
  LOBYTE(v44) = v46[1];
  *(float *)&unsigned int v47 = (float)LODWORD(v44);
  LOBYTE(v13) = v46[2];
  *(float *)&unsigned int v48 = (float)v13;
  double v49 = (float)((float)(*(float *)&v47 + (float)LODWORD(v43)) + *(float *)&v48) * 0.333333333;
  v50 = &a1[4 * v28 + 4 * v17];
  LOBYTE(v47) = *v50;
  LOBYTE(v48) = v50[1];
  *(float *)&unsigned int v51 = (float)v48;
  LOBYTE(v14) = v50[2];
  *(float *)&unsigned int v52 = (float)v14;
  double v53 = (float)((float)(*(float *)&v51 + (float)v47) + *(float *)&v52);
  v54 = &a1[4 * v33 + 4 * v17];
  LOBYTE(v51) = *v54;
  LOBYTE(v52) = v54[1];
  LOBYTE(v15) = v54[2];
  double v55 = (float)((float)((float)v52 + (float)v51) + (float)v15) * 0.333333333;
  float32_t v56 = v26 - v36 + v49 + (v53 - v32) * 0.666666667 + v55;
  double v57 = v36 + v26 + (v45 - v41) * 0.666666667 - v49 + v55;
  v58.i64[1] = 0x3F0000003F000000;
  v58.f32[0] = v56;
  *(float *)&double v57 = v57;
  v58.i32[1] = LODWORD(v57);
  int32x4_t v59 = (int32x4_t)vmulq_f32(v58, v58);
  v59.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v59.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v59.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v59, 2)).u32[0];
  float32x2_t v60 = vrsqrte_f32((float32x2_t)v59.u32[0]);
  *(void *)&double result = vmulq_n_f32(v58, vmul_f32(vrsqrts_f32((float32x2_t)v59.u32[0], vmul_f32(v60, v60)), v60).f32[0]).u64[0];
  return result;
}

char *_CLKGenerateNormalMap(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double result = (char *)malloc_type_malloc(a3 * a2 * a4, 0x100004077774924uLL);
  if (a2 && a3)
  {
    unint64_t v18 = 0;
    unint64_t v19 = a2 - 1;
    unint64_t v20 = a3 - 1;
    uint64_t v21 = result + 1;
    do
    {
      unint64_t v22 = 0;
      unint64_t v23 = v18;
      uint64_t v24 = v18 - 1;
      uint64_t v25 = v24 & ~(v24 >> 63);
      if (v19 < v24) {
        uint64_t v25 = a2 - 1;
      }
      if (v19 >= v23) {
        unint64_t v26 = v23;
      }
      else {
        unint64_t v26 = a2 - 1;
      }
      unint64_t v18 = v23 + 1;
      if (v19 >= v23 + 1) {
        unint64_t v27 = v23 + 1;
      }
      else {
        unint64_t v27 = a2 - 1;
      }
      uint64_t v28 = v21;
      do
      {
        if (v20 >= v22 - 1) {
          uint64_t v29 = (v22 - 1) & ~((uint64_t)(v22 - 1) >> 63);
        }
        else {
          uint64_t v29 = a3 - 1;
        }
        uint64_t v30 = v29 * a2;
        float v31 = &a1[4 * v29 * a2 + 4 * v25];
        LOBYTE(v9) = *v31;
        float v32 = (float)LODWORD(v9);
        LOBYTE(v9) = v31[1];
        float v33 = (float)LODWORD(v9);
        v10.i8[0] = v31[2];
        if (v20 >= v22) {
          unint64_t v34 = v22;
        }
        else {
          unint64_t v34 = a3 - 1;
        }
        unint64_t v35 = v34 * a2;
        float v36 = (float)v10.u32[0];
        uint64_t v37 = &a1[4 * v34 * a2 + 4 * v25];
        LOBYTE(v11) = *v37;
        float v38 = (float)LODWORD(v11);
        LOBYTE(v12) = v37[1];
        *(float *)&double v12 = (float)LODWORD(v12);
        LOBYTE(v13) = v37[2];
        *(float *)&double v13 = (float)LODWORD(v13);
        unint64_t v39 = v22 + 1;
        if (v20 >= v22 + 1) {
          unint64_t v40 = v22 + 1;
        }
        else {
          unint64_t v40 = a3 - 1;
        }
        float v41 = v33 + v32;
        unint64_t v42 = v40 * a2;
        float v43 = &a1[4 * v42 + 4 * v25];
        LOBYTE(v33) = *v43;
        float v44 = *(float *)&v12 + v38;
        LOBYTE(v12) = v43[1];
        *(float *)&unsigned int v45 = (float)LODWORD(v12);
        LOBYTE(v14) = v43[2];
        *(float *)&unsigned int v46 = (float)v14;
        float v47 = *(float *)&v45 + (float)LODWORD(v33);
        unsigned int v48 = &a1[4 * v30 + 4 * v26];
        LOBYTE(v45) = *v48;
        float v49 = v44 + *(float *)&v13;
        LOBYTE(v13) = v48[1];
        *(float *)&unsigned int v50 = (float)LODWORD(v13);
        LOBYTE(v15) = v48[2];
        *(float *)&unsigned int v51 = (float)LODWORD(v15);
        float v52 = v47 + *(float *)&v46;
        float v53 = (float)(*(float *)&v50 + (float)v45) + *(float *)&v51;
        v54 = &a1[4 * v42 + 4 * v26];
        LOBYTE(v50) = *v54;
        LOBYTE(v46) = v54[1];
        *(float *)&unsigned int v55 = (float)v46;
        LOBYTE(v51) = v54[2];
        *(float *)&unsigned int v56 = (float)v51;
        float v57 = (float)(*(float *)&v55 + (float)v50) + *(float *)&v56;
        float32x4_t v58 = &a1[4 * v30 + 4 * v27];
        LOBYTE(v55) = *v58;
        LOBYTE(v56) = v58[1];
        *(float *)&unsigned int v59 = (float)v56;
        LOBYTE(v16) = v58[2];
        *(float *)&unsigned int v60 = (float)LODWORD(v16);
        *(float *)&unsigned int v61 = *(float *)&v59 + (float)v55;
        double v62 = (float)(v41 + v36) * -0.333333333;
        double v63 = (float)(*(float *)&v61 + *(float *)&v60);
        v64 = &a1[4 * v35 + 4 * v27];
        LOBYTE(v61) = *v64;
        LOBYTE(v59) = v64[1];
        *(float *)&unsigned int v65 = (float)v59;
        LOBYTE(v60) = v64[2];
        *(float *)&unsigned int v66 = (float)v60;
        double v67 = v52 * 0.333333333;
        double v68 = (float)((float)(*(float *)&v65 + (float)v61) + *(float *)&v66);
        v69 = &a1[4 * v42 + 4 * v27];
        double v13 = v57;
        LOBYTE(v65) = *v69;
        LOBYTE(v66) = v69[1];
        float v16 = (float)v66;
        LOBYTE(v17) = v69[2];
        double v70 = v63 * 0.333333333;
        float v17 = (float)LODWORD(v17);
        double v71 = v68 - v49;
        double v72 = (float)((float)(v16 + (float)v65) + v17) * 0.333333333;
        unsigned int v14 = 1431655765;
        double v15 = v62 - v67 + v70;
        float v11 = v15 + v71 * 0.666666667 + v72;
        double v12 = v13 - v53;
        *(float *)&double v62 = v67 + v62 + v12 * 0.666666667 - v70 + v72;
        v73.i64[1] = 0x3F0000003F000000;
        v73.i64[0] = __PAIR64__(LODWORD(v62), LODWORD(v11));
        int32x4_t v74 = (int32x4_t)vmulq_f32(v73, v73);
        v74.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v74.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v74.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v74, 2)).u32[0];
        float32x2_t v75 = vrsqrte_f32((float32x2_t)v74.u32[0]);
        float32x2_t v10 = vmul_f32(v75, v75);
        float32x4_t v76 = vmulq_n_f32(v73, vmul_f32(vrsqrts_f32((float32x2_t)v74.u32[0], v10), v75).f32[0]);
        LODWORD(v69) = (int)(v76.f32[0] * 127.5 + 127.5);
        int v77 = (int)(v76.f32[1] * 127.5 + 127.5);
        double v9 = v76.f32[2] * 127.5 + 127.5;
        *(v28 - 1) = (_BYTE)v69;
        *uint64_t v28 = v77;
        v28[1] = (int)v9;
        v28[2] = 1;
        v28 += a4 * a2;
        unint64_t v22 = v39;
      }
      while (a3 != v39);
      v21 += a4;
    }
    while (v18 != a2);
  }
  return result;
}

id CLKGenerateNormalMapFromImageInRGBA8(void *a1)
{
  id v1 = a1;
  float v2 = (CGImage *)[v1 CGImage];
  unint64_t Width = CGImageGetWidth(v2);
  unint64_t Height = CGImageGetHeight(v2);
  uint64_t v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  id v6 = v1;
  uint64_t v7 = (CGImage *)[v6 CGImage];
  size_t v8 = Height * 4 * Width;
  double v9 = malloc_type_calloc(v8, 1uLL, 0x100004077774924uLL);
  float32x2_t v10 = CGBitmapContextCreate(v9, Width, Height, 8uLL, 4 * Width, v5, 0x4001u);
  v17.size.width = (double)Width;
  v17.size.height = (double)Height;
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  CGContextDrawImage(v10, v17, v7);
  CGContextRelease(v10);
  float v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v9 length:v8];
  free(v9);
  CGColorSpaceRelease(v5);
  id v12 = v11;
  double v13 = _CLKGenerateNormalMap((unsigned __int8 *)[v12 bytes], Width, Height, 4);
  unsigned int v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v13 length:v8];
  free(v13);

  return v14;
}

void sub_1D317A1B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D317A20C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CLKUIConvertUIImageToMTLTexture(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[CLKUIMetalResourceManager sharedDevice];
  id v5 = v3;
  id v6 = (CGImage *)[v5 CGImage];
  size_t Width = CGImageGetWidth(v6);
  size_t Height = CGImageGetHeight(v6);
  size_t BytesPerRow = CGImageGetBytesPerRow(v6);
  size_t BitsPerPixel = CGImageGetBitsPerPixel(v6);
  if ((BitsPerPixel & 7) != 0) {
    __assert_rtn("CLKUIConvertUIImageToMTLTexture", "CLKUIImageUtilities.mm", 1301, "bitsPerPixel % 8 == 0");
  }
  id v25 = v3;
  unint64_t v26 = v4;
  size_t v11 = BitsPerPixel >> 3;
  size_t v12 = (BitsPerPixel >> 3) * Width;
  id v27 = (id)objc_msgSend(v4, "newBufferWithLength:options:", v12 * Height, 0, v25);
  DataProvider = CGImageGetDataProvider(v6);
  CFDataRef v14 = CGDataProviderCopyData(DataProvider);
  CFDataRef v15 = v14;
  if (v14)
  {
    BytePtr = CFDataGetBytePtr(v14);
    id v17 = v27;
    uint64_t v18 = [v17 contents];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __CLKUIConvertUIImageToMTLTexture_block_invoke;
    block[3] = &__block_descriptor_72_e8_v16__0Q8l;
    block[4] = BytePtr;
    block[5] = Height;
    block[6] = BytesPerRow;
    block[7] = v18;
    block[8] = v12;
    dispatch_apply(Height, 0, block);
    CFRelease(v15);
    unint64_t v19 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:a2 width:Width height:Height mipmapped:0];
    [v19 setStorageMode:2];
    [v19 setUsage:1];
    unint64_t v20 = (void *)[v26 newTextureWithDescriptor:v19];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __CLKUIConvertUIImageToMTLTexture_block_invoke_2;
    aBlock[3] = &unk_1E697B9B8;
    size_t v31 = Width;
    size_t v32 = v11;
    size_t v33 = Height;
    id v29 = v17;
    id v30 = v20;
    id v21 = v20;
    unint64_t v22 = _Block_copy(aBlock);
    unint64_t v23 = _Block_copy(v22);
  }
  else
  {
    unint64_t v23 = 0;
  }

  return v23;
}

void sub_1D317A4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1D317A548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *__CLKUIConvertUIImageToMTLTexture_block_invoke(void *a1, uint64_t a2)
{
  return memcpy((void *)(a1[7] + a1[8] * a2), (const void *)(a1[4] + (a1[5] + ~a2) * a1[6]), a1[8]);
}

id __CLKUIConvertUIImageToMTLTexture_block_invoke_2(uint64_t *a1, void *a2)
{
  id v3 = [a2 blitCommandEncoder];
  uint64_t v4 = a1[7] * a1[6];
  uint64_t v5 = a1[8];
  v11[0] = a1[6];
  v11[1] = v5;
  v11[2] = 1;
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  memset(v10, 0, sizeof(v10));
  [v3 copyFromBuffer:v6 sourceOffset:0 sourceBytesPerRow:v4 sourceBytesPerImage:v4 * v5 sourceSize:v11 toTexture:v7 destinationSlice:0 destinationLevel:0 destinationOrigin:v10];
  [v3 endEncoding];
  id v8 = (id)a1[5];

  return v8;
}

void sub_1D317A614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void frameBufferReleaseCallback(void *a1, void *a2)
{
}

id CLKUIConvertMTLTextureToUIImage(void *a1, uint64_t a2, double a3)
{
  id v5 = a1;
  uint64_t v6 = v5;
  if (!v5)
  {
    double v9 = 0;
    goto LABEL_16;
  }
  int v7 = 1397;
  if (a2 <= 552)
  {
    if (a2 == 80)
    {
      id v8 = (CFStringRef *)MEMORY[0x1E4F1DC10];
      goto LABEL_14;
    }
    if (a2 == 81)
    {
      id v8 = (CFStringRef *)MEMORY[0x1E4F1DC98];
LABEL_14:
      float32x2_t v10 = CGColorSpaceCreateWithName(*v8);
      CGBitmapInfo v11 = 8194;
      size_t v12 = 8;
      goto LABEL_15;
    }
LABEL_20:
    __assert_rtn("CLKUIConvertMTLTextureToUIImage", "CLKUIImageUtilities.mm", v7, "NO");
  }
  if (a2 != 553 && a2 != 555) {
    goto LABEL_20;
  }
  if (objc_msgSend(v5, "pixelFormat", 1397) != 555)
  {
    if ([v6 pixelFormat] == 71)
    {
      id v8 = (CFStringRef *)MEMORY[0x1E4F1DB90];
      goto LABEL_14;
    }
    int v7 = 1392;
    goto LABEL_20;
  }
  float32x2_t v10 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
  CGBitmapInfo v11 = 270336;
  size_t v12 = 10;
LABEL_15:
  double v13 = (double)(unint64_t)[v6 width];
  double v14 = (double)(unint64_t)[v6 height];
  size_t v15 = (unint64_t)(v14 * trunc(v13 * 4.0));
  float v16 = malloc_type_malloc(v15, 0x772CBF55uLL);
  size_t v17 = vcvtd_n_u64_f64(v13, 2uLL);
  memset(v21, 0, 24);
  v21[3] = (unint64_t)v13;
  v21[4] = (unint64_t)v14;
  v21[5] = 1;
  [v6 getBytes:v16 bytesPerRow:v17 fromRegion:v21 mipmapLevel:0];
  uint64_t v18 = CGDataProviderCreateWithData(0, v16, v15, (CGDataProviderReleaseDataCallback)frameBufferReleaseCallback);
  unint64_t v19 = CGImageCreate((unint64_t)v13, (unint64_t)v14, v12, 0x20uLL, v17, v10, v11, v18, 0, 1, kCGRenderingIntentDefault);
  double v9 = [MEMORY[0x1E4FB1818] imageWithCGImage:v19 scale:0 orientation:a3];
  CGImageRelease(v19);
  CGColorSpaceRelease(v10);
  CGDataProviderRelease(v18);
LABEL_16:

  return v9;
}

void sub_1D317A888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D317A8B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CLKUIShadowImage(void *a1, void *a2, void *a3, double a4, double a5, double a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  double v14 = v13;
  if (v11)
  {
    if (v13) {
      [v13 CGSizeValue];
    }
    else {
      [v11 size];
    }
    double v18 = v15;
    double v19 = v16;
    size_t v17 = 0;
    if (v15 >= 1.0 && v16 >= 1.0)
    {
      [v11 scale];
      double v21 = v20;
      id v22 = v11;
      unint64_t v23 = (CGImage *)[v22 CGImage];
      uint64_t v24 = (CGColor *)[v12 CGColor];
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      size_t BitsPerComponent = CGImageGetBitsPerComponent(v23);
      id v27 = CGBitmapContextCreate(0, (unint64_t)(v21 * (v18 + a4 + a6 + a4 + a6)), (unint64_t)(v21 * (v19 + a5 + a6 + a5 + a6)), BitsPerComponent, 0, DeviceRGB, 1u);
      CGColorSpaceRelease(DeviceRGB);
      v31.width = v21 * a4;
      v31.height = v21 * a5;
      CGContextSetShadowWithColor(v27, v31, v21 * a6, v24);
      CGContextSetFillColorWithColor(v27, v24);
      CGContextSetBlendMode(v27, kCGBlendModeColor);
      v32.origin.x = v21 * (a4 + a6);
      v32.origin.y = v21 * (a5 + a6);
      v32.size.width = v21 * v18;
      v32.size.height = v21 * v19;
      CGContextDrawImage(v27, v32, v23);
      Image = CGBitmapContextCreateImage(v27);
      CGContextRelease(v27);
      size_t v17 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:scale:orientation:", Image, objc_msgSend(v22, "imageOrientation"), v21);
      CGImageRelease(Image);
    }
  }
  else
  {
    size_t v17 = 0;
  }

  return v17;
}

void sub_1D317AAC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D317AAE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D317AAFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D317AB14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D317AB2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D317AB44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D317AB5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D317AB74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D317AB8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CLKUIShadowImageFromView(void *a1, void *a2, void *a3, double a4, double a5, double a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  if (!v11)
  {
    double v21 = 0;
    goto LABEL_14;
  }
  id v14 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v15 = [v11 image];
  double v16 = (void *)[v14 initWithImage:v15];

  if (v13)
  {
    [v13 CGSizeValue];
    double v18 = v17;
    double v20 = v19;
    double v21 = 0;
    double v22 = 1.0;
    if (v18 < 1.0) {
      goto LABEL_13;
    }
LABEL_7:
    if (v20 >= v22)
    {
      id v25 = [v16 image];
      [v25 scale];
      double v27 = v26;

      uint64_t v28 = [v16 layer];
      LODWORD(v29) = 1.0;
      [v28 setShadowOpacity:v29];
      double v30 = v27 * a6;
      [v28 setShadowRadius:v27 * a6];
      CGSize v31 = v12;
      if (!v12)
      {
        CGSize v31 = [MEMORY[0x1E4FB1618] blackColor];
      }
      objc_msgSend(v28, "setShadowColor:", objc_msgSend(v31, "CGColor"));
      double v32 = v27 * (v18 + a4 + a6 + a4 + a6);
      if (!v12) {

      }
      objc_msgSend(v28, "setShadowOffset:", -v32, 0.0);
      objc_msgSend(v16, "setFrame:", a4, a5, v18, v20);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      double v34 = v27 * (v20 + a5 + a6 + a5 + a6);
      unint64_t v35 = CGBitmapContextCreate(0, (unint64_t)v32, (unint64_t)v34, 8uLL, 0, DeviceRGB, 1u);
      CGColorSpaceRelease(DeviceRGB);
      CGContextTranslateCTM(v35, v32 + v30, v34 - v30);
      CGContextScaleCTM(v35, v27, -v27);
      [v28 renderInContext:v35];
      Image = CGBitmapContextCreateImage(v35);
      CGContextRelease(v35);
      double v21 = [MEMORY[0x1E4FB1818] imageWithCGImage:Image scale:0 orientation:v27];
      CGImageRelease(Image);
    }
    goto LABEL_13;
  }
  [v11 frame];
  double v18 = v23;
  double v20 = v24;
  double v21 = 0;
  double v22 = 1.0;
  if (v23 >= 1.0) {
    goto LABEL_7;
  }
LABEL_13:

LABEL_14:
  return v21;
}

void sub_1D317AE40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D317AE88()
{
  if (!v0) {

  }
  JUMPOUT(0x1D317AED4);
}

void sub_1D317AE98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D317AEB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D317AED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *CLKUIMetalElapsedTimeCategoryDescription(uint64_t a1)
{
  id v1 = @"Binary Archive";
  if (a1 == 1) {
    id v1 = @"Render Pipeline";
  }
  if (a1 == 2) {
    return @"Function";
  }
  else {
    return v1;
  }
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void _LayoutConstants(void *a1@<X0>, void *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice);
    if (v5 == obj)
    {
      uint64_t v6 = [obj version];
      uint64_t v7 = _LayoutConstants___previousCLKDeviceVersion;

      if (v6 == v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&_LayoutConstants___cachedDevice, obj);
  _LayoutConstants___previousCLKDeviceVersion = [obj version];

  ___LayoutConstants_block_invoke(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock);
  memcpy(a2, &_LayoutConstants___constants, 0x138uLL);
}

void sub_1D317F0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id filterNamesToIndicesMap()
{
  if (filterNamesToIndicesMap_onceToken != -1) {
    dispatch_once(&filterNamesToIndicesMap_onceToken, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)filterNamesToIndicesMap_namesToIndices;
  return v0;
}

void __filterNamesToIndicesMap_block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"CLKUITritiumViewFilterTypeBrightnessName";
  v2[1] = @"CLKUITritiumViewFilterTypeSaturationName";
  v3[0] = &unk_1F2A6A4B8;
  v3[1] = &unk_1F2A6A4D0;
  v2[2] = @"CLKUIViewFilterTypeNameTritiumTapThrough";
  v3[2] = &unk_1F2A6A4E8;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  id v1 = (void *)filterNamesToIndicesMap_namesToIndices;
  filterNamesToIndicesMap_namesToIndices = v0;
}

float CLKUITritiumMaxAPL()
{
  if (qword_1EA6A51E0 == -1)
  {
    unint64_t v0 = 0x1EA6A4000uLL;
    if (_MergedGlobals) {
      return *(float *)(v0 + 2696);
    }
  }
  else
  {
    dispatch_once(&qword_1EA6A51E0, &__block_literal_global_1);
    unint64_t v0 = 0x1EA6A4000;
    if (_MergedGlobals) {
      return *(float *)(v0 + 2696);
    }
  }
  _MergedGlobals = 1;
  id v1 = [MEMORY[0x1E4F19A30] currentDevice];
  unint64_t v2 = [v1 deviceCategory];

  if (v2 <= 5) {
    *(_DWORD *)(v0 + 2696) = dword_1D31B6428[v2];
  }
  id v3 = (void *)CFPreferencesCopyAppValue(@"NTKMaxTritiumFaceAPL", @"com.apple.NanoTimeKit");
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 floatValue];
    float v6 = fmin(fmax(v5 * 0.01, 0.0), 1.0);
    *(float *)(v0 + 2696) = v6;
  }

  return *(float *)(v0 + 2696);
}

uint64_t __CLKUITritiumMaxAPL_block_invoke()
{
  unint64_t v0 = (const char *)[@"com.apple.NanoTimeKit.MaxAPLChanged" UTF8String];
  id v1 = MEMORY[0x1E4F14428];
  return notify_register_dispatch(v0, (int *)&CLKUITritiumMaxAPL_notifyToken, v1, &__block_literal_global_4);
}

void __CLKUITritiumMaxAPL_block_invoke_2()
{
  _MergedGlobals = 0;
}

double _linearizeAndComputeAPL(uint64_t a1, vDSP_Length a2)
{
  if (!a1)
  {
    id v14 = _CLKUILoggingObjectForDomain(1, (uint64_t)"CLKUILoggingDomainTritium");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      _linearizeAndComputeAPL_cold_1();
    }
    goto LABEL_11;
  }
  uint64_t v4 = (const float *)malloc_type_malloc(12 * a2, 0x100004052888210uLL);
  if (!v4)
  {
    id v14 = _CLKUILoggingObjectForDomain(1, (uint64_t)"CLKUILoggingDomainTritium");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      _linearizeAndComputeAPL_cold_2();
    }
LABEL_11:

    return 0.0;
  }
  float v5 = (float *)v4;
  float v6 = &v4[a2];
  uint64_t v7 = &v4[2 * a2];
  if (a2)
  {
    id v8 = (unsigned __int8 *)(a1 + 2);
    vDSP_Length v9 = a2;
    float32x2_t v10 = (float *)v4;
    do
    {
      *float32x2_t v10 = _NTKAPLGammaTable[*(v8 - 2)];
      v10[a2] = _NTKAPLGammaTable[*(v8 - 1)];
      int v11 = *v8;
      v8 += 4;
      v10[2 * a2] = _NTKAPLGammaTable[v11];
      ++v10;
      --v9;
    }
    while (v9);
  }
  uint64_t __C = 0;
  float32_t v15 = 0.0;
  vDSP_meanv(v4, 1, (float *)&__C + 1, a2);
  vDSP_meanv(v6, 1, (float *)&__C, a2);
  vDSP_meanv(v7, 1, &v15, a2);
  free(v5);
  v12.i64[0] = __PAIR64__(__C, HIDWORD(__C));
  v12.f32[2] = v15;
  return CLKUIConvertP3ToAPL(v12);
}

CGContext *CreateDrawImageToBitmap(void *a1)
{
  id v1 = a1;
  [v1 size];
  double v4 = v2 * v3;
  double v5 = 1.0;
  if (v2 * v3 > 64000000.0) {
    double v5 = 2.0;
  }
  if (v4 > 16000000.0) {
    double v5 = v5 + v5;
  }
  if (v4 > 4000000.0) {
    double v5 = v5 + v5;
  }
  if (v4 <= 1000000.0) {
    double v6 = v5;
  }
  else {
    double v6 = v5 + v5;
  }
  double v7 = v2 / v6;
  if (v2 / v6 == 0.0 || (double v8 = v3 / v6, v3 / v6 == 0.0))
  {
    float32x4_t v12 = _CLKUILoggingObjectForDomain(1, (uint64_t)"CLKUILoggingDomainTritium");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_1D3174000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to compute apl of image with 0 size.", v14, 2u);
    }

    float32x2_t v10 = 0;
  }
  else
  {
    vDSP_Length v9 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
    float32x2_t v10 = CGBitmapContextCreate(0, (unint64_t)v7, (unint64_t)v8, 8uLL, 0, v9, 1u);
    CGContextSetInterpolationQuality(v10, kCGInterpolationNone);
    int v11 = (CGImage *)[v1 CGImage];
    v15.origin.x = 0.0;
    v15.origin.y = 0.0;
    v15.size.width = v7;
    v15.size.height = v8;
    CGContextDrawImage(v10, v15, v11);
    CGColorSpaceRelease(v9);
  }

  return v10;
}

void CLKUIComputeDimmingRequiredToObtainAPLGivenAPL(float a1, float a2, float a3)
{
  float v6 = CLKUITritiumMaxAPL();
  powf(fmaxf(v6 - a2, 0.0) / (float)(a3 * a1), 0.45455);
}

float CLKUIComputeImageAPL(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  double v2 = v1;
  float v3 = 0.0;
  if (v1)
  {
    DrawImageToBitmap = CreateDrawImageToBitmap(v1);
    if (DrawImageToBitmap)
    {
      double v5 = DrawImageToBitmap;
      size_t Width = CGBitmapContextGetWidth(DrawImageToBitmap);
      size_t Height = CGBitmapContextGetHeight(v5);
      Data = CGBitmapContextGetData(v5);
      if (Data)
      {
        double v9 = _linearizeAndComputeAPL((uint64_t)Data, (unint64_t)((double)Height * (double)Width));
        float v3 = *(float *)&v9;
      }
      else
      {
        float32x4_t v12 = _CLKUILoggingObjectForDomain(1, (uint64_t)"CLKUILoggingDomainTritium");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          CLKUIComputeImageAPL_cold_1();
        }
      }
      CGContextRelease(v5);
    }
    else
    {
      float32x2_t v10 = _CLKUILoggingObjectForDomain(1, (uint64_t)"CLKUILoggingDomainTritium");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = [v2 description];
        int v14 = 138412290;
        CGRect v15 = v11;
        _os_log_impl(&dword_1D3174000, v10, OS_LOG_TYPE_DEFAULT, "Failed to create bitmap context for APL computation of image %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }

  return v3;
}

void CLKUIComputeDimmingRequiredToObtainImageAPLUnclamped(void *a1, float a2, float a3)
{
  float v5 = CLKUIComputeImageAPL(a1);
  float v6 = CLKUITritiumMaxAPL();
  powf(fmaxf(v6 - a2, 0.0) / (float)(v5 * a3), 0.45455);
}

float CLKUIComputeDimmingRequiredToObtainImageAPL(void *a1, float a2, float a3)
{
  float v5 = CLKUIComputeImageAPL(a1);
  float v6 = CLKUITritiumMaxAPL();
  return fmin(powf(fmaxf(v6 - a2, 0.0) / (float)(v5 * a3), 0.45455), 1.0);
}

float CLKUIComputeDimmingRequiredToObtainImageAPLClamped(void *a1, float a2)
{
  float v2 = a2 + -0.082;
  float v3 = CLKUIComputeImageAPL(a1);
  float v4 = CLKUITritiumMaxAPL();
  return fmin(powf(fmaxf(v4 + v2, 0.0) / v3, 0.45455), 1.0);
}

void CLKUIComputeDimmingRequiredToObtainQuadAPLUnclamped(void *a1, float a2, float a3)
{
  [a1 computeAPL];
  float v6 = v5;
  float v7 = CLKUITritiumMaxAPL();
  powf(fmaxf(v7 - a2, 0.0) / (float)(v6 * a3), 0.45455);
}

float CLKUIComputeDimmingRequiredToObtainQuadAPL(void *a1, float a2, float a3)
{
  [a1 computeAPL];
  float v6 = v5;
  float v7 = CLKUITritiumMaxAPL();
  return fmin(powf(fmaxf(v7 - a2, 0.0) / (float)(v6 * a3), 0.45455), 1.0);
}

id _CLKUIComputeTextureAPL(void *a1, void *a2, id *a3)
{
  id v6 = a2;
  id v7 = a1;
  double v8 = +[CLKUIMetalResourceManager sharedDevice];
  int v9 = [v8 supportsFamily:1004];
  if (!*a3)
  {
    float32x2_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v30 = 0;
    int v11 = (void *)[v8 newDefaultLibraryWithBundle:v10 error:&v30];
    id v12 = v30;

    id v13 = (void *)[v11 newFunctionWithName:@"compute_apl"];
    id v29 = v12;
    float v3 = (void *)[v8 newComputePipelineStateWithFunction:v13 error:&v29];
    id v14 = v29;

    id v15 = v3;
    *a3 = v15;
  }
  uint64_t v16 = (void *)[v8 newBufferWithLength:12 options:1];
  double v17 = [v6 computeCommandEncoder];

  [v17 setComputePipelineState:*a3];
  [v17 setBuffer:v16 offset:0 atIndex:2];
  [v17 setBuffer:v16 offset:4 atIndex:3];
  [v17 setBuffer:v16 offset:8 atIndex:4];
  [v17 setTexture:v7 atIndex:0];
  unint64_t v18 = [*a3 threadExecutionWidth];
  unint64_t v19 = [*a3 maxTotalThreadsPerThreadgroup] / v18;
  LODWORD(v3) = vcvtpd_u64_f64((double)(unint64_t)[v7 width] * 0.166666667);
  unint64_t v20 = [v7 height];

  LODWORD(v21) = vcvtpd_u64_f64((double)v20 * 0.166666667);
  if (v9)
  {
    unint64_t v26 = (unint64_t)v3;
    unint64_t v27 = v21;
    uint64_t v28 = 1;
    unint64_t v23 = v18;
    unint64_t v24 = v19;
    uint64_t v25 = 1;
    [v17 dispatchThreads:&v26 threadsPerThreadgroup:&v23];
  }
  else
  {
    unint64_t v26 = ((unint64_t)v3 + v18 - 1) / v18;
    unint64_t v27 = (v19 + v21 - 1) / v19;
    uint64_t v28 = 1;
    unint64_t v23 = v18;
    unint64_t v24 = v19;
    uint64_t v25 = 1;
    [v17 dispatchThreadgroups:&v26 threadsPerThreadgroup:&v23];
  }
  [v17 endEncoding];

  return v16;
}

double CLKUIGetAPLFromSumBuffer(void *a1, uint64_t a2, uint64_t a3)
{
  *(double *)&uint64_t v8 = (double)(unint64_t)(a3 * a2) * 255.0;
  uint64_t v3 = [a1 contents];
  v4.i64[0] = *(void *)v3;
  v4.i64[1] = HIDWORD(*(void *)v3);
  float64x2_t v5 = (float64x2_t)vdupq_lane_s64(v8, 0);
  float32x4_t v6 = (float32x4_t)vdivq_f64(vcvtq_f64_u64(v4), v5);
  *(float32x2_t *)v6.f32 = vcvt_f32_f64((float64x2_t)v6);
  LODWORD(v5.f64[0]) = *(_DWORD *)(v3 + 8);
  *(float *)v5.f64 = (double)*(unint64_t *)&v5.f64[0] / *(double *)&v8;
  v6.i32[2] = LODWORD(v5.f64[0]);
  return CLKUIConvertSRGBToAPL(v6);
}

id CLKUIComputeTextureAPL(void *a1, void *a2, id *a3)
{
  id v5 = a1;
  float32x4_t v6 = _CLKUIComputeTextureAPL(v5, a2, a3);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __CLKUIComputeTextureAPL_block_invoke;
  v12[3] = &unk_1E697BAF0;
  id v13 = v6;
  id v14 = v5;
  id v7 = v5;
  id v8 = v6;
  int v9 = _Block_copy(v12);
  float32x2_t v10 = _Block_copy(v9);

  return v10;
}

double __CLKUIComputeTextureAPL_block_invoke(uint64_t a1)
{
  float v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) width];
  *(double *)&uint64_t v9 = (double)(unint64_t)([*(id *)(a1 + 40) height] * v3) * 255.0;
  uint64_t v4 = [v2 contents];
  v5.i64[0] = *(void *)v4;
  v5.i64[1] = HIDWORD(*(void *)v4);
  float64x2_t v6 = (float64x2_t)vdupq_lane_s64(v9, 0);
  float32x4_t v7 = (float32x4_t)vdivq_f64(vcvtq_f64_u64(v5), v6);
  *(float32x2_t *)v7.f32 = vcvt_f32_f64((float64x2_t)v7);
  LODWORD(v6.f64[0]) = *(_DWORD *)(v4 + 8);
  *(float *)v6.f64 = (double)*(unint64_t *)&v6.f64[0] / *(double *)&v9;
  v7.i32[2] = LODWORD(v6.f64[0]);
  return CLKUIConvertSRGBToAPL(v7);
}

float CLKUIComputeColorAPL(void *a1)
{
  CFStringRef v1 = (const __CFString *)*MEMORY[0x1E4F1DBC8];
  id v2 = a1;
  uint64_t v3 = CGColorSpaceCreateWithName(v1);
  id v4 = v2;
  uint64x2_t v5 = (CGColor *)[v4 CGColor];

  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v3, kCGRenderingIntentDefault, v5, 0);
  Components = (float64x2_t *)CGColorGetComponents(CopyByMatchingToColorSpace);
  float32x4_t v8 = *(float32x4_t *)Components;
  *(float32x2_t *)v8.f32 = vcvt_f32_f64(*Components);
  float32_t v9 = Components[1].f64[0];
  v8.f32[2] = v9;
  double v10 = CLKUIConvertP3ToAPL(v8);
  float v11 = *(float *)&v10;
  CGColorRelease(CopyByMatchingToColorSpace);
  CGColorSpaceRelease(v3);
  return v11;
}

void CLKUIComputeDimmingRequiredToObtainColorAPLUnclamped(void *a1, float a2, float a3)
{
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1DBC8];
  id v6 = a1;
  float32x4_t v7 = CGColorSpaceCreateWithName(v5);
  id v8 = v6;
  float32_t v9 = (CGColor *)[v8 CGColor];

  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v7, kCGRenderingIntentDefault, v9, 0);
  Components = (float64x2_t *)CGColorGetComponents(CopyByMatchingToColorSpace);
  float32x4_t v12 = *(float32x4_t *)Components;
  *(float32x2_t *)v12.f32 = vcvt_f32_f64(*Components);
  float32_t v13 = Components[1].f64[0];
  v12.f32[2] = v13;
  double v14 = CLKUIConvertP3ToAPL(v12);
  float v15 = *(float *)&v14;
  CGColorRelease(CopyByMatchingToColorSpace);
  CGColorSpaceRelease(v7);
  float v16 = CLKUITritiumMaxAPL();
  powf(fmaxf(v16 - a2, 0.0) / (float)(v15 * a3), 0.45455);
}

float CLKUIComputeDimmingRequiredToObtainColorAPL(void *a1, float a2, float a3)
{
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1DBC8];
  id v6 = a1;
  float32x4_t v7 = CGColorSpaceCreateWithName(v5);
  id v8 = v6;
  float32_t v9 = (CGColor *)[v8 CGColor];

  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v7, kCGRenderingIntentDefault, v9, 0);
  Components = (float64x2_t *)CGColorGetComponents(CopyByMatchingToColorSpace);
  float32x4_t v12 = *(float32x4_t *)Components;
  *(float32x2_t *)v12.f32 = vcvt_f32_f64(*Components);
  float32_t v13 = Components[1].f64[0];
  v12.f32[2] = v13;
  double v14 = CLKUIConvertP3ToAPL(v12);
  float v15 = *(float *)&v14;
  CGColorRelease(CopyByMatchingToColorSpace);
  CGColorSpaceRelease(v7);
  float v16 = CLKUITritiumMaxAPL();
  return fmin(powf(fmaxf(v16 - a2, 0.0) / (float)(v15 * a3), 0.45455), 1.0);
}

void CLKUIConvertTextureFromXRSRGBtoP3(void *a1, void *a2, void *a3, id *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = [v7 width];
  if (v10 == [v8 width])
  {
    uint64_t v11 = [v7 height];
    uint64_t v12 = [v8 height];
    if (v8)
    {
      if (v7 && v11 == v12)
      {
        float32_t v13 = +[CLKUIMetalResourceManager sharedDevice];
        int v14 = [v13 supportsFamily:1004];
        if (!*a4)
        {
          float v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          id v39 = 0;
          float v16 = (void *)[v13 newDefaultLibraryWithBundle:v15 error:&v39];
          id v17 = v39;

          if (v17)
          {
            unint64_t v18 = _CLKUILoggingObjectForDomain(0, (uint64_t)"CLKUILoggingDomainMetalQuadView");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
              CLKUIConvertTextureFromXRSRGBtoP3_cold_5((uint64_t)v17, v18);
            }
          }
          if (!v16)
          {
            unint64_t v19 = _CLKUILoggingObjectForDomain(0, (uint64_t)"CLKUILoggingDomainMetalQuadView");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
              CLKUIConvertTextureFromXRSRGBtoP3_cold_4();
            }
          }
          unint64_t v20 = (void *)[v16 newFunctionWithName:@"compute_convert_xrsrgb_to_p3"];
          if (!v20)
          {
            unint64_t v21 = _CLKUILoggingObjectForDomain(0, (uint64_t)"CLKUILoggingDomainMetalQuadView");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
              CLKUIConvertTextureFromXRSRGBtoP3_cold_3();
            }
          }
          id v38 = 0;
          double v22 = (void *)[v13 newComputePipelineStateWithFunction:v20 error:&v38];
          id v23 = v38;
          id v24 = v22;
          *a4 = v24;
          if (v23)
          {
            uint64_t v25 = _CLKUILoggingObjectForDomain(0, (uint64_t)"CLKUILoggingDomainMetalQuadView");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
              CLKUIConvertTextureFromXRSRGBtoP3_cold_2((uint64_t)v23, v25);
            }

            id v24 = *a4;
          }
          if (!v24)
          {
            unint64_t v26 = _CLKUILoggingObjectForDomain(0, (uint64_t)"CLKUILoggingDomainMetalQuadView");
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
              CLKUIConvertTextureFromXRSRGBtoP3_cold_1();
            }
          }
        }
        unint64_t v27 = [v9 computeCommandEncoder];
        [v27 setComputePipelineState:*a4];
        [v27 setTexture:v7 atIndex:0];
        [v27 setTexture:v8 atIndex:1];
        unint64_t v28 = [*a4 threadExecutionWidth];
        unint64_t v29 = [*a4 maxTotalThreadsPerThreadgroup] / v28;
        uint64_t v30 = [v7 width];
        uint64_t v31 = [v7 height];
        if (v14)
        {
          unint64_t v35 = v30;
          unint64_t v36 = v31;
          uint64_t v37 = 1;
          unint64_t v32 = v28;
          unint64_t v33 = v29;
          uint64_t v34 = 1;
          [v27 dispatchThreads:&v35 threadsPerThreadgroup:&v32];
        }
        else
        {
          unint64_t v35 = (v28 + v30 - 1) / v28;
          unint64_t v36 = (v29 + v31 - 1) / v29;
          uint64_t v37 = 1;
          unint64_t v32 = v28;
          unint64_t v33 = v29;
          uint64_t v34 = 1;
          [v27 dispatchThreadgroups:&v35 threadsPerThreadgroup:&v32];
        }
        [v27 endEncoding];
      }
    }
  }
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_1D3182200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D31822B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___disabledLayerActions_block_invoke()
{
  v4[11] = *MEMORY[0x1E4F143B8];
  unint64_t v0 = [MEMORY[0x1E4F1CA98] null];
  v3[0] = @"affineTransform";
  v3[1] = @"backgroundColor";
  v4[0] = v0;
  v4[1] = v0;
  v3[2] = @"bounds";
  v3[3] = @"contentsMultiplyColor";
  v4[2] = v0;
  v4[3] = v0;
  void v3[4] = @"hidden";
  v3[5] = @"instanceCount";
  v4[4] = v0;
  v4[5] = v0;
  v3[6] = @"instanceDelay";
  v3[7] = @"instanceTransform";
  v4[6] = v0;
  v4[7] = v0;
  v3[8] = @"opacity";
  v3[9] = @"position";
  v4[8] = v0;
  v4[9] = v0;
  v3[10] = @"transform";
  v4[10] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:11];
  id v2 = (void *)_disabledLayerActions__dictionary;
  _disabledLayerActions__dictionary = v1;
}

id CLKUILocalizedString(void *a1)
{
  id v1 = a1;
  id v2 = _CLKUIBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_1F2A5F488 table:@"ClockKitUI"];

  return v3;
}

id _CLKUIBundle()
{
  if (_CLKUIBundle_onceToken != -1) {
    dispatch_once(&_CLKUIBundle_onceToken, &__block_literal_global_185);
  }
  unint64_t v0 = (void *)_CLKUIBundle___bundle;
  return v0;
}

uint64_t _ImageNamedInBundle(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4FB1818] imageNamed:a1 inBundle:a2 compatibleWithTraitCollection:0];
}

id CLKUIImageNamed(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F19A90];
  id v2 = a1;
  uint64_t v3 = [v1 sharedRenderingContext];
  id v4 = [v3 device];
  CFStringRef v5 = CLKUIImageNamedForDevice(v2, v4);

  return v5;
}

id CLKUIImageNamedForDevice(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  CFStringRef v5 = _CLKUIBundle();
  id v6 = CLKUIImageNamedFromBundleForDevice(v5, v4, v3);

  return v6;
}

id CLKUIImageNamedFromBundleForDevice(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if ([v7 deviceCategory] != 3
    || ([v6 stringByAppendingString:@"-aloe"],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [MEMORY[0x1E4FB1818] imageNamed:v8 inBundle:v5 compatibleWithTraitCollection:0],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    uint64_t v10 = _CLKVersionedImageNameIfPreGlory(v6, v7);
    uint64_t v9 = [MEMORY[0x1E4FB1818] imageNamed:v10 inBundle:v5 compatibleWithTraitCollection:0];
  }
  return v9;
}

id _CLKVersionedImageNameIfPreGlory(void *a1, void *a2)
{
  id v3 = a1;
  [a2 nrDeviceVersion];
  id v4 = v3;
  if ((NRVersionIsGreaterThanOrEqual() & 1) == 0)
  {
    id v5 = _PreGloryVersionedImageNames();
    int v6 = [v5 containsObject:v3];

    id v4 = v3;
    if (v6)
    {
      id v4 = [v3 stringByAppendingString:@"-pre5_0"];
    }
  }

  return v4;
}

uint64_t _CLKUIOrderedImageSizeSuffixesForSizeClass(unint64_t a1)
{
  if (a1 > 8) {
    return 0;
  }
  else {
    return (uint64_t)*(&off_1E697BB80 + a1);
  }
}

id CLKUIOrderedSuffixesForDevice(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKUIOrderedSuffixesForDevice___lock);
  id WeakRetained = objc_loadWeakRetained(&CLKUIOrderedSuffixesForDevice___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CLKUIOrderedSuffixesForDevice___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CLKUIOrderedSuffixesForDevice___cachedDevice, v1);
    CLKUIOrderedSuffixesForDevice___previousCLKDeviceVersion = [v1 version];

    __CLKUIOrderedSuffixesForDevice_block_invoke(v8, v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CLKUIOrderedSuffixesForDevice___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKUIOrderedSuffixesForDevice___lock);
  id v9 = (id)CLKUIOrderedSuffixesForDevice___suffixes;

  return v9;
}

void __CLKUIOrderedSuffixesForDevice_block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 sizeClass];
  if (v2 > 8) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = (uint64_t)*(&off_1E697BB80 + v2);
  }
  id v4 = (void *)CLKUIOrderedSuffixesForDevice___suffixes;
  CLKUIOrderedSuffixesForDevice___suffixes = v3;
}

id _CLKUIImageNamedFromBundleForDeviceWithSuffixes(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a1;
  id v7 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = a4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        float32_t v13 = objc_msgSend(v7, "stringByAppendingString:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        int v14 = [MEMORY[0x1E4FB1818] imageNamed:v13 inBundle:v6 compatibleWithTraitCollection:0];

        if (v14)
        {

          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  int v14 = [MEMORY[0x1E4FB1818] imageNamed:v7 inBundle:v6 compatibleWithTraitCollection:0];
LABEL_11:

  return v14;
}

id CLKUIAssetBundleSuffixesForSizeClass()
{
  unint64_t v0 = [MEMORY[0x1E4F1CA48] array];
  [v0 addObject:&stru_1F2A5F488];
  [v0 addObject:@"-agave"];
  [v0 addObject:@"-aloe"];
  [v0 addObject:@"-luxo"];
  [v0 addObject:@"-sunscreen"];
  return v0;
}

id CLKUIImageNamedFromAssetBundleForDevice(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKUIImageNamedFromAssetBundleForDevice___lock);
  id WeakRetained = objc_loadWeakRetained(&CLKUIImageNamedFromAssetBundleForDevice___cachedDevice);
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained;
    id v10 = objc_loadWeakRetained(&CLKUIImageNamedFromAssetBundleForDevice___cachedDevice);
    if (v10 == v5)
    {
      uint64_t v11 = [v5 version];
      uint64_t v12 = CLKUIImageNamedFromAssetBundleForDevice___previousCLKDeviceVersion;

      if (v11 == v12) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v13 = objc_storeWeak(&CLKUIImageNamedFromAssetBundleForDevice___cachedDevice, v5);
  CLKUIImageNamedFromAssetBundleForDevice___previousCLKDeviceVersion = [v5 version];

  __CLKUIImageNamedFromAssetBundleForDevice_block_invoke(v14, v5);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKUIImageNamedFromAssetBundleForDevice___lock);
  long long v16 = _CLKUIImageNamedFromBundleForDeviceWithSuffixes(v7, v6, v15, (void *)CLKUIImageNamedFromAssetBundleForDevice___suffixes);

  return v16;
}

uint64_t __CLKUIImageNamedFromAssetBundleForDevice_block_invoke(uint64_t a1, void *a2)
{
  [a2 sizeClass];
  uint64_t v2 = CLKUIAssetBundleSuffixesForSizeClass();
  uint64_t v3 = CLKUIImageNamedFromAssetBundleForDevice___suffixes;
  CLKUIImageNamedFromAssetBundleForDevice___suffixes = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

id _PreGloryVersionedImageNames()
{
  if (_PreGloryVersionedImageNames_onceToken != -1) {
    dispatch_once(&_PreGloryVersionedImageNames_onceToken, &__block_literal_global_77);
  }
  unint64_t v0 = (void *)_PreGloryVersionedImageNames___preGloryVersionedImages;
  return v0;
}

void sub_1D3183EE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _CLKUILoggingObjectForDomain(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (dispatch_once_t *)((char *)&_CLKUILoggingObjectForDomain_onceTokens + 8 * a1);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___CLKUILoggingObjectForDomain_block_invoke;
  v6[3] = &__block_descriptor_48_e5_v8__0l;
  v6[4] = a1;
  v6[5] = a2;
  if (*v3 != -1) {
    dispatch_once(v3, v6);
  }
  id v4 = (void *)_CLKUILoggingObjectForDomain___logObjects[a1];
  return v4;
}

double CLKUITextureFormatGetASTCBlockSize(int a1)
{
  return s_artFormatsAstcBlockSize[a1];
}

double CLKUIComputePow2SubRect(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    [v1 size];
    [v1 scale];
    [v1 size];
    [v1 scale];
  }
  return 0.0;
}

uint64_t _CLKUIDeterminePlaneLength(int a1, int a2, int a3, int a4)
{
  if ((a1 - 5) > 1)
  {
    if ((a1 - 11) > 0x37)
    {
      return (a3 * a2 * a4);
    }
    else
    {
      unsigned int v6 = HIDWORD(*(void *)&s_artFormatsAstcBlockSize[a1]);
      unsigned int v7 = *(void *)&s_artFormatsAstcBlockSize[a1];
      return 16 * (a2 + v7 - 1) / v7 * ((a3 + v6 - 1) / v6);
    }
  }
  else
  {
    unsigned int v4 = 4 * a3 * a2 + 7;
    if (v4 >= 0x100) {
      return v4 >> 3;
    }
    else {
      return 0;
    }
  }
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t CLKUIAnalogHandsDefaultPreferredFramesPerSecondForDevice()
{
  CLKValueForDeviceMetrics();
  return (uint64_t)v0;
}

void startAndEndOfDayForDateInTimeZone(void *a1, void *a2, void *a3, void *a4)
{
  unsigned int v7 = (void *)MEMORY[0x1E4F1C9A8];
  id v8 = a4;
  id v9 = a3;
  id v11 = [v7 currentCalendar];
  [v11 setTimeZone:v8];

  *a1 = [v11 startOfDayForDate:v9];
  id v10 = [v11 dateByAddingUnit:16 value:1 toDate:v9 options:0];

  *a2 = [v11 startOfDayForDate:v10];
}

BOOL isDateBetweenDates(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  uint64_t v7 = [a2 compare:v5];
  if (v7) {
    BOOL v8 = v7 == -1 && [v6 compare:v5] >= 0;
  }
  else {
    BOOL v8 = 1;
  }

  return v8;
}

double _LayoutConstants_0(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_0);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_0);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&_LayoutConstants___cachedDevice_0, v1);
    _LayoutConstants___previousCLKDeviceVersion_0 = [v1 version];

    ___LayoutConstants_block_invoke_0(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = _LayoutConstants___previousCLKDeviceVersion_0;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_0);
  double v9 = *(double *)&_LayoutConstants__constants_0;

  return v9;
}

uint64_t CLKUIFetchPrimaryGamutMatrix(_OWORD *a1)
{
  uint64_t v1 = MEMORY[0x1E4F14998];
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
  *a1 = *MEMORY[0x1E4F14998];
  a1[1] = v2;
  a1[2] = *(_OWORD *)(v1 + 32);
  return 1;
}

double CLKUIPrimaryGamutMatrix()
{
  if (CLKUIPrimaryGamutMatrix_onceToken != -1) {
    dispatch_once(&CLKUIPrimaryGamutMatrix_onceToken, &__block_literal_global_5);
  }
  return *(double *)&CLKUIPrimaryGamutMatrix_p3ToNativeMatrix;
}

double CLKUINativeToAPLCoeff()
{
  if (CLKUINativeToAPLCoeff_onceToken != -1) {
    dispatch_once(&CLKUINativeToAPLCoeff_onceToken, &__block_literal_global_2);
  }
  return *(double *)&CLKUINativeToAPLCoeff_coefficients;
}

double __CLKUINativeToAPLCoeff_block_invoke()
{
  double result = 0.0000000422954612;
  CLKUINativeToAPLCoeff_coefficients = xmmword_1D31B6760;
  return result;
}

double CLKUIConvertP3ToNative(float32x4_t a1)
{
  float32x4_t v1 = a1;
  if (CLKUIPrimaryGamutMatrix_onceToken != -1)
  {
    dispatch_once(&CLKUIPrimaryGamutMatrix_onceToken, &__block_literal_global_5);
    float32x4_t v1 = a1;
  }
  float32x4_t v2 = (float32x4_t)vtrn2q_s32((int32x4_t)CLKUIPrimaryGamutMatrix_p3ToNativeMatrix, *(int32x4_t *)algn_1EA6A52D0);
  v2.i32[2] = DWORD1(xmmword_1EA6A52E0);
  *(void *)&double result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(vzip1q_s32((int32x4_t)CLKUIPrimaryGamutMatrix_p3ToNativeMatrix, (int32x4_t)xmmword_1EA6A52E0), *(int32x4_t *)algn_1EA6A52D0), v1.f32[0]), v2, *(float32x2_t *)v1.f32, 1), (float32x4_t)vzip1q_s32(vzip2q_s32((int32x4_t)CLKUIPrimaryGamutMatrix_p3ToNativeMatrix, (int32x4_t)xmmword_1EA6A52E0), vdupq_laneq_s32(*(int32x4_t *)algn_1EA6A52D0, 2)), v1, 2).u64[0];
  return result;
}

double CLKUIConvertNativeToAPL(float32x4_t a1)
{
  if (CLKUINativeToAPLCoeff_onceToken != -1)
  {
    float32x4_t v3 = a1;
    dispatch_once(&CLKUINativeToAPLCoeff_onceToken, &__block_literal_global_2);
    a1 = v3;
  }
  float32x4_t v1 = vmulq_f32((float32x4_t)CLKUINativeToAPLCoeff_coefficients, a1);
  *(void *)&double result = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v1, 2), vaddq_f32(v1, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v1.f32, 1))).u64[0];
  return result;
}

double CLKUIConvertP3ToAPL(float32x4_t a1)
{
  if (CLKUIPrimaryGamutMatrix_onceToken != -1)
  {
    float32x4_t v10 = a1;
    dispatch_once(&CLKUIPrimaryGamutMatrix_onceToken, &__block_literal_global_5);
    a1 = v10;
  }
  int32x4_t v2 = (int32x4_t)CLKUIPrimaryGamutMatrix_p3ToNativeMatrix;
  int32x4_t v1 = *(int32x4_t *)algn_1EA6A52D0;
  int32x4_t v3 = (int32x4_t)xmmword_1EA6A52E0;
  if (CLKUINativeToAPLCoeff_onceToken != -1)
  {
    float32x4_t v11 = a1;
    long long v8 = CLKUIPrimaryGamutMatrix_p3ToNativeMatrix;
    int32x4_t v9 = *(int32x4_t *)algn_1EA6A52D0;
    long long v7 = xmmword_1EA6A52E0;
    dispatch_once(&CLKUINativeToAPLCoeff_onceToken, &__block_literal_global_2);
    int32x4_t v3 = (int32x4_t)v7;
    int32x4_t v2 = (int32x4_t)v8;
    int32x4_t v1 = v9;
    a1 = v11;
  }
  float32x4_t v4 = (float32x4_t)vtrn2q_s32(v2, v1);
  v4.i32[2] = v3.i32[1];
  float32x4_t v5 = vmulq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(vzip1q_s32(v2, v3), v1), a1.f32[0]), v4, *(float32x2_t *)a1.f32, 1), (float32x4_t)vzip1q_s32(vzip2q_s32(v2, v3), vdupq_laneq_s32(v1, 2)), a1, 2), (float32x4_t)CLKUINativeToAPLCoeff_coefficients);
  *(void *)&double result = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), vaddq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1))).u64[0];
  return result;
}

double sRGBtoNative()
{
  if (sRGBtoNative_onceToken != -1) {
    dispatch_once(&sRGBtoNative_onceToken, &__block_literal_global_4_0);
  }
  return *(double *)&sRGBtoNative_sRGBToNative;
}

double __sRGBtoNative_block_invoke()
{
  if (CLKUIPrimaryGamutMatrix_onceToken != -1) {
    dispatch_once(&CLKUIPrimaryGamutMatrix_onceToken, &__block_literal_global_5);
  }
  uint64_t v0 = 0;
  long long v1 = CLKUIPrimaryGamutMatrix_p3ToNativeMatrix;
  long long v2 = *(_OWORD *)algn_1EA6A52D0;
  HIDWORD(v1) = 0;
  HIDWORD(v2) = 0;
  long long v3 = xmmword_1EA6A52E0;
  HIDWORD(v3) = 0;
  v5[0] = v1;
  v5[1] = v2;
  v5[2] = v3;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  do
  {
    *(long long *)((char *)&v6 + v0 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1D31B6770, COERCE_FLOAT(v5[v0])), (float32x4_t)xmmword_1D31B6780, *(float32x2_t *)&v5[v0], 1), (float32x4_t)xmmword_1D31B6790, (float32x4_t)v5[v0], 2);
    ++v0;
  }
  while (v0 != 3);
  double result = *(double *)&v6;
  DWORD2(sRGBtoNative_sRGBToNative) = DWORD2(v6);
  *(_DWORD *)algn_1EA6A5328 = DWORD2(v7);
  *(void *)&sRGBtoNative_sRGBToNative = v6;
  qword_1EA6A5320 = v7;
  DWORD2(xmmword_1EA6A5330) = DWORD2(v8);
  *(void *)&xmmword_1EA6A5330 = v8;
  return result;
}

double CLKUIConvertSRGBToAPL(float32x4_t a1)
{
  if (sRGBtoNative_onceToken != -1)
  {
    float32x4_t v10 = a1;
    dispatch_once(&sRGBtoNative_onceToken, &__block_literal_global_4_0);
    a1 = v10;
  }
  int32x4_t v2 = (int32x4_t)sRGBtoNative_sRGBToNative;
  int32x4_t v1 = *(int32x4_t *)&qword_1EA6A5320;
  int32x4_t v3 = (int32x4_t)xmmword_1EA6A5330;
  if (CLKUINativeToAPLCoeff_onceToken != -1)
  {
    float32x4_t v11 = a1;
    long long v8 = sRGBtoNative_sRGBToNative;
    int32x4_t v9 = *(int32x4_t *)&qword_1EA6A5320;
    long long v7 = xmmword_1EA6A5330;
    dispatch_once(&CLKUINativeToAPLCoeff_onceToken, &__block_literal_global_2);
    int32x4_t v3 = (int32x4_t)v7;
    int32x4_t v2 = (int32x4_t)v8;
    int32x4_t v1 = v9;
    a1 = v11;
  }
  float32x4_t v4 = (float32x4_t)vtrn2q_s32(v2, v1);
  v4.i32[2] = v3.i32[1];
  float32x4_t v5 = vmulq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(vzip1q_s32(v2, v3), v1), a1.f32[0]), v4, *(float32x2_t *)a1.f32, 1), (float32x4_t)vzip1q_s32(vzip2q_s32(v2, v3), vdupq_laneq_s32(v1, 2)), a1, 2), (float32x4_t)CLKUINativeToAPLCoeff_coefficients);
  *(void *)&double result = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), vaddq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1))).u64[0];
  return result;
}

float interpolate_identity_to_color@<S0>(void *a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
  double v11 = 0.0;
  double v12 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  [a1 getRed:&v12 green:&v11 blue:&v10 alpha:&v9];
  *(float *)a2 = 1.0 - a3;
  *(void *)(a2 + 4) = 0;
  *(_DWORD *)(a2 + 12) = 0;
  float v5 = v12 * a3;
  *(float *)(a2 + 16) = v5;
  *(_DWORD *)(a2 + 20) = 0;
  *(float *)(a2 + 24) = 1.0 - a3;
  *(void *)(a2 + 28) = 0;
  float v6 = v11 * a3;
  *(float *)(a2 + 36) = v6;
  *(void *)(a2 + 40) = 0;
  *(float *)(a2 + 48) = 1.0 - a3;
  *(_DWORD *)(a2 + 52) = 0;
  float v7 = v10 * a3;
  *(float *)(a2 + 56) = v7;
  *(void *)(a2 + 60) = 0;
  *(_DWORD *)(a2 + 68) = 0;
  float result = (float)(1.0 - a3) + a3 * v9;
  *(float *)(a2 + 72) = result;
  *(_DWORD *)(a2 + 76) = 0;
  return result;
}

uint64_t source_over_for_color(void *a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  [a1 getRed:&v5 green:&v4 blue:&v3 alpha:&v2];
  return CAColorMatrixMakeColorSourceOver();
}

id CLKUIFlatMonochromeFilters(void *a1, double a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  if (a2 == 1.0)
  {
    source_over_for_color(a1);
    uint64_t v2 = (void *)MEMORY[0x1E4F39BC0];
    uint64_t v3 = (void *)MEMORY[0x1E4F3A350];
  }
  else
  {
    float v4 = a2;
    interpolate_identity_to_color(a1, (uint64_t)&v10, v4);
    uint64_t v2 = (void *)MEMORY[0x1E4F39BC0];
    uint64_t v3 = (void *)MEMORY[0x1E4F3A038];
  }
  uint64_t v5 = [v2 filterWithType:*v3];
  v9[2] = v12;
  v9[3] = v13;
  v9[4] = v14;
  v9[0] = v10;
  v9[1] = v11;
  float v6 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v9];
  [v5 setValue:v6 forKey:@"inputColorMatrix"];

  v15[0] = v5;
  float v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

  return v7;
}

id CLKUIFlatMonochromeFiltersOpaque(void *a1)
{
  return CLKUIFlatMonochromeFilters(a1, 1.0);
}

id CLKUIFlatMonochromeFiltersWhite(double a1)
{
  uint64_t v2 = CLKUIDefaultComplicationBackgroundColor();
  uint64_t v3 = CLKUIFlatMonochromeFilters(v2, a1);

  return v3;
}

id CLKUIDefaultComplicationBackgroundColor()
{
  if (CLKUIDefaultComplicationBackgroundColor_onceToken != -1) {
    dispatch_once(&CLKUIDefaultComplicationBackgroundColor_onceToken, &__block_literal_global_6_0);
  }
  uint64_t v0 = (void *)CLKUIDefaultComplicationBackgroundColor___backgroundColor;
  return v0;
}

id CLKUIFlatMonochromeFiltersWhiteOpaque()
{
  uint64_t v0 = CLKUIDefaultComplicationBackgroundColor();
  int32x4_t v1 = CLKUIFlatMonochromeFilters(v0, 1.0);

  return v1;
}

CGImageRef _CLKUICreateMonochromeMapImage(void *a1, double a2)
{
  id v3 = a1;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  uint64_t v5 = CGBitmapContextCreate(0, 0xFFuLL, 1uLL, 8uLL, 0x1FE0uLL, DeviceRGB, 0x4001u);
  id v6 = v3;
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(DeviceRGB, kCGRenderingIntentDefault, (CGColorRef)[v6 CGColor], 0);
  Components = CGColorGetComponents(CopyByMatchingToColorSpace);
  for (unint64_t i = 0; i != 255; ++i)
  {
    if (i) {
      double v10 = (float)((float)i / 254.0) + a2;
    }
    else {
      double v10 = 0.0;
    }
    CGContextSetRGBFillColor(v5, *Components, Components[1], Components[2], v10);
    v13.origin.x = (double)i;
    v13.origin.y = 0.0;
    v13.size.width = 1.0;
    v13.size.height = 1.0;
    CGContextFillRect(v5, v13);
  }
  CGImageRef Image = CGBitmapContextCreateImage(v5);
  CGColorRelease(CopyByMatchingToColorSpace);
  CGContextRelease(v5);
  CGColorSpaceRelease(DeviceRGB);

  return Image;
}

id CLKUIDesatMonochromeFiltersWithTintedBackground(void *a1, void *a2, double a3)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  float v7 = v6;
  if (v6)
  {
    [v6 _luminance];
    [v5 _luminance];
  }
  double v30 = 0.0;
  double v31 = 0.0;
  double v29 = 0.0;
  [v5 getRed:&v31 green:&v30 blue:&v29 alpha:0];
  float v8 = a3;
  float v9 = v31 * v8;
  float v10 = v30 * v8;
  float v11 = v29 * v8;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  *(float *)&long long v19 = 1.0 - v8;
  *(void *)((char *)&v19 + 4) = 0;
  *((float *)&v19 + 3) = v9;
  *(void *)&long long v20 = 0;
  *((void *)&v20 + 1) = COERCE_UNSIGNED_INT(1.0 - v8);
  *(float *)&long long v21 = v10;
  *(void *)((char *)&v21 + 4) = 0;
  HIDWORD(v21) = 0;
  *(float *)&long long v22 = 1.0 - v8;
  *((float *)&v22 + 1) = v11;
  *((void *)&v22 + 1) = 0;
  *(void *)&long long v23 = 0;
  *((void *)&v23 + 1) = 1065353216;
  *(float *)&unsigned int v16 = 1.0 - v8;
  *(float *)&unsigned int v17 = 1.0 - v8;
  *(float *)&unsigned int v18 = 1.0 - v8;
  CAColorMatrixConcat();
  long long v12 = objc_msgSend(MEMORY[0x1E4F39BC0], "filterWithType:", *MEMORY[0x1E4F3A038], v16, 0, 0, v17, 0, 0, v18);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  CGRect v13 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v19];
  [v12 setValue:v13 forKey:*MEMORY[0x1E4F3A168]];

  [v12 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3A1C8]];
  v32[0] = v12;
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];

  return v14;
}

id CLKUIDesatMonochromeFilters(void *a1, double a2)
{
  return CLKUIDesatMonochromeFiltersWithTintedBackground(a1, 0, a2);
}

id CLKUIDesatMonochromeFiltersOpaque(void *a1)
{
  return CLKUIDesatMonochromeFiltersWithTintedBackground(a1, 0, 1.0);
}

id CLKUIDesatMonochromeFiltersWhite(double a1)
{
  uint64_t v2 = CLKUIDefaultAlternateComplicationColor();
  id v3 = CLKUIDesatMonochromeFiltersWithTintedBackground(v2, 0, a1);

  return v3;
}

id CLKUIDefaultAlternateComplicationColor()
{
  if (CLKUIDefaultAlternateComplicationColor_onceToken != -1) {
    dispatch_once(&CLKUIDefaultAlternateComplicationColor_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)CLKUIDefaultAlternateComplicationColor___color;
  return v0;
}

id CLKUIDesatMonochromeFiltersWhiteOpaque()
{
  uint64_t v0 = CLKUIDefaultAlternateComplicationColor();
  int32x4_t v1 = CLKUIDesatMonochromeFiltersWithTintedBackground(v0, 0, 1.0);

  return v1;
}

id CLKUIMonochromeFiltersForStyle(void *a1, void *a2, void *a3, double a4)
{
  return CLKUIMonochromeFiltersForStyleWithTintedBackground(a1, a2, a3, 0, a4);
}

id CLKUIMonochromeFiltersForStyleWithTintedBackground(void *a1, void *a2, void *a3, void *a4, double a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (fabs(a5) >= 0.00000011920929)
  {
    switch((unint64_t)a1)
    {
      case 0uLL:
        double v12 = a5;
        CGRect v13 = v9;
        goto LABEL_7;
      case 1uLL:
        double v14 = a5;
        uint64_t v15 = v9;
        goto LABEL_9;
      case 2uLL:
        double v12 = a5;
        CGRect v13 = v10;
LABEL_7:
        uint64_t v16 = CLKUIFlatMonochromeFilters(v13, v12);
        goto LABEL_14;
      case 3uLL:
        double v14 = a5;
        uint64_t v15 = v10;
LABEL_9:
        unsigned int v17 = 0;
        goto LABEL_13;
      case 4uLL:
        double v14 = a5;
        uint64_t v15 = v9;
        goto LABEL_12;
      case 5uLL:
        double v14 = a5;
        uint64_t v15 = v10;
LABEL_12:
        unsigned int v17 = v11;
LABEL_13:
        uint64_t v16 = CLKUIDesatMonochromeFiltersWithTintedBackground(v15, v17, v14);
LABEL_14:
        a1 = (void *)v16;
        break;
      default:
        break;
    }
  }
  else
  {
    a1 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return a1;
}

uint64_t CLKUIAssociatedNonAccentStyle(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return 0;
  }
  else {
    return qword_1D31B6820[a1 - 1];
  }
}

uint64_t CLKUIAssociatedAccentStyle(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return 2;
  }
  else {
    return qword_1D31B6848[a1 - 1];
  }
}

uint64_t CLKUIAssociatedDesaturatedType(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 3) {
    return 1;
  }
  else {
    return qword_1D31B6870[a1 - 2];
  }
}

uint64_t __CLKUIDefaultAlternateComplicationColor_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithWhite:0.9 alpha:1.0];
  uint64_t v1 = CLKUIDefaultAlternateComplicationColor___color;
  CLKUIDefaultAlternateComplicationColor___color = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __CLKUIDefaultComplicationBackgroundColor_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.1];
  uint64_t v1 = CLKUIDefaultComplicationBackgroundColor___backgroundColor;
  CLKUIDefaultComplicationBackgroundColor___backgroundColor = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t CLKUIDefaultComplicationBackgroundColorWithNonAccentColor(void *a1, const char *a2)
{
  return [a1 colorWithAlphaComponent:0.1];
}

id NTKFlatMonochromeFilter(void *a1, double a2)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a2 == 1.0)
  {
    source_over_for_color(a1);
    uint64_t v2 = (void *)MEMORY[0x1E4F39BC0];
    id v3 = (void *)MEMORY[0x1E4F3A350];
  }
  else
  {
    float v4 = a2;
    interpolate_identity_to_color(a1, (uint64_t)&v9, v4);
    uint64_t v2 = (void *)MEMORY[0x1E4F39BC0];
    id v3 = (void *)MEMORY[0x1E4F3A038];
  }
  id v5 = [v2 filterWithType:*v3];
  v8[2] = v11;
  v8[3] = v12;
  v8[4] = v13;
  v8[0] = v9;
  v8[1] = v10;
  id v6 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v8];
  [v5 setValue:v6 forKey:@"inputColorMatrix"];

  return v5;
}

id NTKFlatMonochromeFilterOpaque(void *a1)
{
  return NTKFlatMonochromeFilter(a1, 1.0);
}

id NTKFlatMonochromeFilterWhite(double a1)
{
  uint64_t v2 = CLKUIDefaultComplicationBackgroundColor();
  id v3 = NTKFlatMonochromeFilter(v2, a1);

  return v3;
}

id NTKFlatMonochromeFilterWhiteOpaque()
{
  uint64_t v0 = CLKUIDefaultComplicationBackgroundColor();
  uint64_t v1 = NTKFlatMonochromeFilter(v0, 1.0);

  return v1;
}

id NTKDesatMonochromeFilter(void *a1, double a2)
{
  id v3 = (void *)MEMORY[0x1E4F39BC0];
  uint64_t v4 = *MEMORY[0x1E4F3A268];
  id v5 = a1;
  id v6 = [v3 filterWithType:v4];
  float v7 = [NSNumber numberWithDouble:a2 * 0.95];
  [v6 setValue:v7 forKey:@"inputAmount"];

  float v8 = _CLKUICreateMonochromeMapImage(v5, a2 * 0.2);
  [v6 setValue:v8 forKey:@"inputColorMap"];
  CGImageRelease(v8);
  return v6;
}

id NTKDesatMonochromeFilterOpaque(void *a1)
{
  return NTKDesatMonochromeFilter(a1, 1.0);
}

id NTKDesatMonochromeFilterWhite(double a1)
{
  uint64_t v2 = CLKUIDefaultAlternateComplicationColor();
  id v3 = NTKDesatMonochromeFilter(v2, a1);

  return v3;
}

id NTKDesatMonochromeFilterWhiteOpaque()
{
  uint64_t v0 = CLKUIDefaultAlternateComplicationColor();
  uint64_t v1 = NTKDesatMonochromeFilter(v0, 1.0);

  return v1;
}

id NTKMonochromeFilterForStyle(unint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = a2;
  id v8 = a3;
  long long v9 = v8;
  if (a1 <= 5)
  {
    if (((1 << a1) & 0x13) != 0) {
      id v8 = v7;
    }
    a1 = NTKDesatMonochromeFilter(v8, a4);
  }

  return (id)a1;
}

void sub_1D318A64C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D318AE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1D318B804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double CLKUICurvedColoringLabelCornerSize(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKUICurvedColoringLabelCornerSize___lock);
  id WeakRetained = objc_loadWeakRetained(&CLKUICurvedColoringLabelCornerSize___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CLKUICurvedColoringLabelCornerSize___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CLKUICurvedColoringLabelCornerSize___cachedDevice, v1);
    CLKUICurvedColoringLabelCornerSize___previousCLKDeviceVersion = [v1 version];

    __CLKUICurvedColoringLabelCornerSize_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CLKUICurvedColoringLabelCornerSize___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKUICurvedColoringLabelCornerSize___lock);
  double v9 = *(double *)&CLKUICurvedColoringLabelCornerSize__size_0;

  return v9;
}

void __CLKUICurvedColoringLabelCornerSize_block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  objc_msgSend(v4, "scaledSize:withOverride:forSizeClass:", 3, 67.0, 56.0, 78.0, 63.0);
  *(double *)&CLKUICurvedColoringLabelCornerSize__size_0 = v2 + -3.0;
  *(double *)&CLKUICurvedColoringLabelCornerSize__size_1 = v3 + -3.0;
}

double CLKUICurvedColoringLabelCenterSize(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CLKUICurvedColoringLabelCenterSize___lock);
  id WeakRetained = objc_loadWeakRetained(&CLKUICurvedColoringLabelCenterSize___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&CLKUICurvedColoringLabelCenterSize___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&CLKUICurvedColoringLabelCenterSize___cachedDevice, v1);
    CLKUICurvedColoringLabelCenterSize___previousCLKDeviceVersion = [v1 version];

    __CLKUICurvedColoringLabelCenterSize_block_invoke(v8, v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = CLKUICurvedColoringLabelCenterSize___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CLKUICurvedColoringLabelCenterSize___lock);
  double v9 = *(double *)&CLKUICurvedColoringLabelCenterSize__size_0;

  return v9;
}

void __CLKUICurvedColoringLabelCenterSize_block_invoke(uint64_t a1, void *a2)
{
  double v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  id v12 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v12 scaledValue:3 withOverride:54.5 forSizeClass:59.5];
  double v5 = v4;
  [v12 scaledValue:2 withOverride:3.0 forSizeClass:1.0];
  double v7 = v6;
  [v12 scaledValue:6.5];
  double v9 = v7 + v8;
  [v3 screenBounds];
  uint64_t v11 = v10;

  CLKUICurvedColoringLabelCenterSize__size_0 = v11;
  *(double *)&CLKUICurvedColoringLabelCenterSize__size_1 = v5 + -3.0 + v9;
}

void _LayoutConstants_1(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_2);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_2);
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_2);
    if (v5 == obj)
    {
      uint64_t v6 = [obj version];
      uint64_t v7 = _LayoutConstants___previousCLKDeviceVersion_2;

      if (v6 == v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&_LayoutConstants___cachedDevice_2, obj);
  _LayoutConstants___previousCLKDeviceVersion_2 = [obj version];

  ___LayoutConstants_block_invoke_2(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_2);
  long long v10 = xmmword_1EA6A5418;
  *(_OWORD *)a2 = _LayoutConstants__constants;
  *(_OWORD *)(a2 + 16) = v10;
  *(void *)(a2 + 32) = qword_1EA6A5428;
}

id _FontWithCenteredColons(void *a1, uint64_t a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a1 fontDescriptor];
  if ((unint64_t)(a2 + 1) > 1)
  {
    if ((unint64_t)(a2 - 1) > 0xD) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = off_1E697BEC8[a2 - 1];
    }
    uint64_t v10 = *MEMORY[0x1E4F24550];
    uint64_t v15 = v9;
    uint64_t v16 = v10;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    uint64_t v17 = v5;
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v7 = &v17;
    id v8 = &v16;
  }
  else
  {
    if (_FontWithCenteredColons_onceToken != -1) {
      dispatch_once(&_FontWithCenteredColons_onceToken, &__block_literal_global_8);
    }
    uint64_t v4 = *MEMORY[0x1E4FB2868];
    uint64_t v18 = _FontWithCenteredColons___centeredColonsFeatureSetting;
    uint64_t v19 = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    v20[0] = v5;
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v7 = (void **)v20;
    id v8 = &v19;
  }
  uint64_t v11 = [v6 dictionaryWithObjects:v7 forKeys:v8 count:1];
  id v12 = [v3 fontDescriptorByAddingAttributes:v11];

  uint64_t v13 = [MEMORY[0x1E4F19A50] fontWithDescriptor:v12 size:0.0];

  return v13;
}

id _IdentifyingInfoForView(void *a1)
{
  id v1 = NSString;
  id v2 = a1;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [v2 window];
  id v5 = [v4 recursiveDescription];
  uint64_t v6 = [v1 stringWithFormat:@"%@ <%p> in window %@", v3, v2, v5];

  return v6;
}

void sub_1D3199E30(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1D319A1C0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D319A780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D319B8C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D319BC10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__38(uint64_t a1, uint64_t a2)
{
  float result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__39(uint64_t a1)
{
}

void _LayoutConstants_2(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_3);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_3);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_3);
    if (v5 == obj)
    {
      uint64_t v6 = [obj version];
      uint64_t v7 = _LayoutConstants___previousCLKDeviceVersion_3;

      if (v6 == v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&_LayoutConstants___cachedDevice_3, obj);
  _LayoutConstants___previousCLKDeviceVersion_3 = [obj version];

  ___LayoutConstants_block_invoke_3(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_3);
  long long v10 = *(_OWORD *)&qword_1EA6A54B0;
  *(_OWORD *)(a2 + 64) = xmmword_1EA6A54A0;
  *(_OWORD *)(a2 + 80) = v10;
  *(_OWORD *)(a2 + 96) = xmmword_1EA6A54C0;
  *(void *)(a2 + 112) = qword_1EA6A54D0;
  long long v11 = *(_OWORD *)&qword_1EA6A5470;
  *(_OWORD *)a2 = _LayoutConstants__constants_0;
  *(_OWORD *)(a2 + 16) = v11;
  long long v12 = *(_OWORD *)&qword_1EA6A5490;
  *(_OWORD *)(a2 + 32) = xmmword_1EA6A5480;
  *(_OWORD *)(a2 + 48) = v12;
}

void sub_1D319D094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D319D120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D31A0688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D31A17A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

double _centerInBounds(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  double v14 = MidX - a6 * __sincos_stret(a7).__sinval;
  v16.origin.x = a1;
  v16.origin.y = a2;
  v16.size.width = a3;
  v16.size.height = a4;
  CGRectGetMinY(v16);
  return v14;
}

double _angleForPositionInWidth(double a1, double a2, double a3, double a4)
{
  double v4 = 0.0;
  if (a3 != 0.0) {
    return (a1 + a2 * -0.5) / a3 + a4;
  }
  return v4;
}

void sub_1D31A2118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D31A3308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D31A3474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *CLKUIMetalAtlasPrewarmStateDescription(uint64_t a1)
{
  uint64_t v1 = @"none";
  if (a1 == 1) {
    uint64_t v1 = @"prewarming";
  }
  if (a1 == 2) {
    return @"prewarmed";
  }
  else {
    return v1;
  }
}

uint64_t _CLKUICalculateNumCompressedTexMipmaps(unsigned int a1, unsigned int a2, unsigned int a3)
{
  if (a3 < 0x20) {
    goto LABEL_9;
  }
  LODWORD(result) = 0;
  do
  {
    if (a1 == 1 && a2 == 1) {
      return (result + 1);
    }
    char v5 = a1 > 1;
    a1 >>= a1 > 1;
    char v6 = a2 > 1;
    a2 >>= a2 > 1;
    a3 = a3 >> v5 >> v6;
    uint64_t result = (result + 1);
  }
  while (a3 >= 0x20);
  if (!result) {
LABEL_9:
  }
    _CLKUICalculateNumCompressedTexMipmaps_cold_1();
  return result;
}

uint64_t _CLKUIMetalAtlasComputeCompressedPlaneLength(int a1, int a2, int a3)
{
  if ((a1 - 5) > 1u)
  {
    if ((a1 - 11) > 0x37)
    {
      return 0;
    }
    else
    {
      double ASTCBlockSize = CLKUITextureFormatGetASTCBlockSize(a1);
      return 16
           * (a2 + LODWORD(ASTCBlockSize) - 1)
           / LODWORD(ASTCBlockSize)
           * ((a3 + HIDWORD(ASTCBlockSize) - 1)
            / HIDWORD(ASTCBlockSize));
    }
  }
  else
  {
    unsigned int v5 = 4 * a2 * a3 + 7;
    if (v5 >= 0x100) {
      return v5 >> 3;
    }
    else {
      return 0;
    }
  }
}

void sub_1D31A47C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double SlopedPoint.point.getter()
{
  return sub_1D31A5974(&OBJC_IVAR___CLKUISlopedPoint_point);
}

uint64_t SlopedPoint.point.setter(double a1, double a2)
{
  return sub_1D31A5A24(&OBJC_IVAR___CLKUISlopedPoint_point, a1, a2);
}

uint64_t (*SlopedPoint.point.modify())()
{
  return j__swift_endAccess;
}

double sub_1D31A5924(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1 + *a3;
  swift_beginAccess();
  return *(double *)v3;
}

double SlopedPoint.tangent.getter()
{
  return sub_1D31A5974(&OBJC_IVAR___CLKUISlopedPoint_tangent);
}

double sub_1D31A5974(void *a1)
{
  uint64_t v2 = v1 + *a1;
  swift_beginAccess();
  return *(double *)v2;
}

uint64_t sub_1D31A59C4(uint64_t a1, double a2, double a3, uint64_t a4, void *a5)
{
  uint64_t v7 = (double *)(a1 + *a5);
  uint64_t result = swift_beginAccess();
  *uint64_t v7 = a2;
  v7[1] = a3;
  return result;
}

uint64_t SlopedPoint.tangent.setter(double a1, double a2)
{
  return sub_1D31A5A24(&OBJC_IVAR___CLKUISlopedPoint_tangent, a1, a2);
}

uint64_t sub_1D31A5A24(void *a1, double a2, double a3)
{
  char v6 = (double *)(v3 + *a1);
  uint64_t result = swift_beginAccess();
  *char v6 = a2;
  v6[1] = a3;
  return result;
}

uint64_t (*SlopedPoint.tangent.modify())()
{
  return j_j__swift_endAccess;
}

id SlopedPoint.__allocating_init(point:tangent:)(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  long long v10 = (double *)&v9[OBJC_IVAR___CLKUISlopedPoint_point];
  *long long v10 = a1;
  v10[1] = a2;
  long long v11 = (double *)&v9[OBJC_IVAR___CLKUISlopedPoint_tangent];
  *long long v11 = a3;
  v11[1] = a4;
  v13.receiver = v9;
  v13.super_class = v4;
  return objc_msgSendSuper2(&v13, sel_init);
}

id SlopedPoint.init(point:tangent:)(double a1, double a2, double a3, double a4)
{
  ObjectType = (objc_class *)swift_getObjectType();
  long long v10 = (double *)&v4[OBJC_IVAR___CLKUISlopedPoint_point];
  *long long v10 = a1;
  v10[1] = a2;
  long long v11 = (double *)&v4[OBJC_IVAR___CLKUISlopedPoint_tangent];
  *long long v11 = a3;
  v11[1] = a4;
  v13.receiver = v4;
  v13.super_class = ObjectType;
  return objc_msgSendSuper2(&v13, sel_init);
}

id SlopedPoint.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SlopedPoint.init()()
{
}

id sub_1D31A5CDC(double a1)
{
  sub_1D31A8DD8(v1, (uint64_t)&v23);
  if (v28)
  {
    long long v20 = v24;
    long long v21 = v23;
    if (v28 == 1)
    {
      long long v3 = v25;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A5010);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1D31B6C70;
      *(_OWORD *)(inited + 32) = v21;
      *(_OWORD *)(inited + 48) = v20;
      *(_OWORD *)(inited + 64) = v3;
    }
    else
    {
      long long v19 = v25;
      uint64_t v16 = v26;
      uint64_t v17 = v27;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A5010);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1D31B6C60;
      *(_OWORD *)(inited + 32) = v21;
      *(_OWORD *)(inited + 48) = v20;
      *(_OWORD *)(inited + 64) = v19;
      *(void *)(inited + 80) = v16;
      *(void *)(inited + 88) = v17;
    }
    id v15 = sub_1D31A839C(inited, a1);
    swift_setDeallocating();
  }
  else
  {
    double v5 = *(double *)&v23;
    double v6 = v5 + (*(double *)&v24 - v5) * a1;
    double v7 = *((double *)&v23 + 1) + (*((double *)&v24 + 1) - *((double *)&v23 + 1)) * a1;
    double v8 = sqrt((v5 - *(double *)&v24) * (v5 - *(double *)&v24)+ (*((double *)&v23 + 1) - *((double *)&v24 + 1)) * (*((double *)&v23 + 1) - *((double *)&v24 + 1)));
    double v9 = (*(double *)&v24 - *(double *)&v23) / v8;
    double v10 = (*((double *)&v24 + 1) - *((double *)&v23 + 1)) / v8;
    long long v11 = (objc_class *)type metadata accessor for SlopedPoint();
    long long v12 = (char *)objc_allocWithZone(v11);
    objc_super v13 = (double *)&v12[OBJC_IVAR___CLKUISlopedPoint_point];
    *objc_super v13 = v6;
    v13[1] = v7;
    double v14 = (double *)&v12[OBJC_IVAR___CLKUISlopedPoint_tangent];
    *double v14 = v9;
    v14[1] = v10;
    v22.receiver = v12;
    v22.super_class = v11;
    return objc_msgSendSuper2(&v22, sel_init);
  }
  return v15;
}

uint64_t sub_1D31A5E70(uint64_t result, double a2)
{
  unint64_t v2 = *(void *)(result + 16);
  if (!v2)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (*(double *)(result + 40) <= a2)
  {
    uint64_t v3 = result + 32;
    uint64_t v4 = v2 - 1;
    if (*(double *)(result + 32 + 16 * (v2 - 1) + 8) > a2)
    {
      if (v2 >= 2)
      {
        unint64_t v5 = 0;
        while (1)
        {
          uint64_t v6 = v5 + v4;
          if (__OFADD__(v5, v4)) {
            break;
          }
          if (v6 >= 0) {
            uint64_t v7 = v5 + v4;
          }
          else {
            uint64_t v7 = v6 + 1;
          }
          if (v6 < -1) {
            goto LABEL_28;
          }
          uint64_t v8 = v7 >> 1;
          if (v7 >> 1 >= (uint64_t)v2) {
            goto LABEL_28;
          }
          if (*(double *)(v3 + 16 * v8 + 8) < a2) {
            unint64_t v5 = v8 + 1;
          }
          else {
            uint64_t v4 = v7 >> 1;
          }
          if ((uint64_t)v5 >= v4) {
            goto LABEL_18;
          }
        }
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      unint64_t v5 = 0;
LABEL_18:
      if (v5 >= v2) {
        goto LABEL_30;
      }
      double v9 = *(double *)(v3 + 16 * v5 + 8);
      if (v9 <= a2)
      {
        if (v9 >= a2) {
          return result;
        }
        unint64_t v10 = v5++;
        if (v10 < v2) {
          goto LABEL_21;
        }
      }
      else if (v5 - 1 < v2)
      {
LABEL_21:
        if (v5 >= v2)
        {
LABEL_31:
          __break(1u);
          return result;
        }
        return result;
      }
      __break(1u);
    }
  }
  return result;
}

void *CLKUIBezierPathStepper.path.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___CLKUIBezierPathStepper_path);
  swift_beginAccess();
  unint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void CLKUIBezierPathStepper.path.setter(void *a1)
{
  id v3 = (id *)(v1 + OBJC_IVAR___CLKUIBezierPathStepper_path);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
  id v5 = a1;

  if (*v3)
  {
    id v6 = *v3;
    CLKUIBezierPathStepper.updateSegments(path:)((UIBezierPath)v6);

    id v5 = v6;
  }
}

id sub_1D31A6140@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  id v3 = (void **)(*a1 + OBJC_IVAR___CLKUIBezierPathStepper_path);
  swift_beginAccess();
  id v4 = *v3;
  *a2 = *v3;
  return v4;
}

void sub_1D31A61A4(void **a1, void *a2)
{
  unint64_t v2 = *a1;
  id v3 = (id *)(*a2 + OBJC_IVAR___CLKUIBezierPathStepper_path);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = v2;
  id v5 = v2;

  if (*v3)
  {
    id v6 = *v3;
    CLKUIBezierPathStepper.updateSegments(path:)((UIBezierPath)v6);

    id v5 = v6;
  }
}

Swift::Void __swiftcall CLKUIBezierPathStepper.updateSegments(path:)(UIBezierPath path)
{
  v14[0] = 0;
  v14[1] = 0;
  v13[0] = 0;
  v13[1] = 0;
  uint64_t v2 = MEMORY[0x1E4FBC860];
  uint64_t v12 = MEMORY[0x1E4FBC860];
  id v3 = (const CGPath *)[(objc_class *)path.super.isa CGPath];
  id v4 = (void *)swift_allocObject();
  v4[2] = v14;
  v4[3] = v13;
  v4[4] = &v12;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_1D31A6940;
  *(void *)(v5 + 24) = v4;
  void aBlock[4] = sub_1D31A695C;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D31A6984;
  aBlock[3] = &block_descriptor;
  id v6 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  CGPathApplyWithBlock(v3, v6);

  _Block_release(v6);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    *(void *)&v1[OBJC_IVAR___CLKUIBezierPathStepper_segments] = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v7 = OBJC_IVAR___CLKUIBezierPathStepper_segmentLengthTables;
    *(void *)&v1[OBJC_IVAR___CLKUIBezierPathStepper_segmentLengthTables] = v2;
    swift_bridgeObjectRelease();
    uint64_t v8 = v1;
    uint64_t v9 = swift_bridgeObjectRetain();
    uint64_t v10 = sub_1D31A8C98(v9);
    swift_bridgeObjectRelease();

    *(void *)&v1[v7] = v10;
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
  }
}

void (*CLKUIBezierPathStepper.path.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___CLKUIBezierPathStepper_path;
  v3[3] = v1;
  void v3[4] = v4;
  swift_beginAccess();
  return sub_1D31A64A4;
}

void sub_1D31A64A4(void **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = *(void **)(v3[3] + v3[4]);
    if (v4)
    {
      id v5 = v4;
      CLKUIBezierPathStepper.updateSegments(path:)((UIBezierPath)v5);
    }
  }
  free(v3);
}

id CLKUIBezierPathStepper.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = (void **)&v0[OBJC_IVAR___CLKUIBezierPathStepper_path];
  *(void *)&v0[OBJC_IVAR___CLKUIBezierPathStepper_path] = 0;
  uint64_t v3 = MEMORY[0x1E4FBC860];
  *(void *)&v0[OBJC_IVAR___CLKUIBezierPathStepper_segments] = MEMORY[0x1E4FBC860];
  *(void *)&v0[OBJC_IVAR___CLKUIBezierPathStepper_segmentLengthTables] = v3;
  swift_beginAccess();
  uint64_t v4 = *v2;
  *uint64_t v2 = 0;

  v6.receiver = v0;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t sub_1D31A6644(uint64_t result, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  id v5 = *(uint64_t **)(result + 8);
  switch(*(_DWORD *)result)
  {
    case 0:
      uint64_t v6 = *v5;
      uint64_t v7 = v5[1];
      *a2 = *v5;
      a2[1] = v7;
      *a3 = v6;
      a3[1] = v7;
      return result;
    case 1:
      uint64_t v10 = *v5;
      uint64_t v11 = v5[1];
      uint64_t v8 = *a2;
      uint64_t v9 = a2[1];
      goto LABEL_16;
    case 2:
      uint64_t v12 = *a2;
      uint64_t v13 = a2[1];
      uint64_t v14 = *v5;
      uint64_t v15 = v5[1];
      uint64_t v16 = v5[2];
      uint64_t v17 = v5[3];
      *a2 = v16;
      a2[1] = v17;
      uint64_t v18 = *a4;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      *a4 = v18;
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1D31A7218(0, *(void *)(v18 + 16) + 1, 1, (char *)v18);
        uint64_t v18 = result;
        *a4 = result;
      }
      unint64_t v20 = *(void *)(v18 + 16);
      unint64_t v19 = *(void *)(v18 + 24);
      unint64_t v21 = v20 + 1;
      if (v20 >= v19 >> 1)
      {
        uint64_t result = (uint64_t)sub_1D31A7218((char *)(v19 > 1), v20 + 1, 1, (char *)v18);
        unint64_t v21 = v20 + 1;
        uint64_t v18 = result;
      }
      *(void *)(v18 + 16) = v21;
      unint64_t v22 = v18 + 72 * v20;
      *(void *)(v22 + 32) = v12;
      *(void *)(v22 + 40) = v13;
      *(void *)(v22 + 48) = v14;
      *(void *)(v22 + 56) = v15;
      *(void *)(v22 + 64) = v16;
      *(void *)(v22 + 72) = v17;
      *(void *)(v22 + 80) = 0;
      *(void *)(v22 + 88) = 0;
      char v23 = 1;
      goto LABEL_14;
    case 3:
      uint64_t v24 = *a2;
      uint64_t v25 = a2[1];
      uint64_t v26 = *v5;
      uint64_t v27 = v5[1];
      uint64_t v28 = v5[2];
      uint64_t v29 = v5[3];
      uint64_t v30 = v5[4];
      uint64_t v31 = v5[5];
      *a2 = v30;
      a2[1] = v31;
      uint64_t v18 = *a4;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      *a4 = v18;
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1D31A7218(0, *(void *)(v18 + 16) + 1, 1, (char *)v18);
        uint64_t v18 = result;
        *a4 = result;
      }
      unint64_t v32 = *(void *)(v18 + 16);
      unint64_t v33 = *(void *)(v18 + 24);
      unint64_t v34 = v32 + 1;
      if (v32 >= v33 >> 1)
      {
        unint64_t v41 = v32 + 1;
        id v39 = (char *)v18;
        unint64_t v40 = *(void *)(v18 + 16);
        uint64_t result = (uint64_t)sub_1D31A7218((char *)(v33 > 1), v32 + 1, 1, v39);
        unint64_t v32 = v40;
        unint64_t v34 = v41;
        uint64_t v18 = result;
      }
      *(void *)(v18 + 16) = v34;
      unint64_t v22 = v18 + 72 * v32;
      *(void *)(v22 + 32) = v24;
      *(void *)(v22 + 40) = v25;
      *(void *)(v22 + 48) = v26;
      *(void *)(v22 + 56) = v27;
      *(void *)(v22 + 64) = v28;
      *(void *)(v22 + 72) = v29;
      *(void *)(v22 + 80) = v30;
      *(void *)(v22 + 88) = v31;
      char v23 = 2;
LABEL_14:
      *(unsigned char *)(v22 + 96) = v23;
      break;
    case 4:
      uint64_t v8 = *a2;
      uint64_t v9 = a2[1];
      uint64_t v10 = *a3;
      uint64_t v11 = a3[1];
LABEL_16:
      *a2 = v10;
      a2[1] = v11;
      uint64_t v18 = *a4;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      *a4 = v18;
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1D31A7218(0, *(void *)(v18 + 16) + 1, 1, (char *)v18);
        uint64_t v18 = result;
        *a4 = result;
      }
      unint64_t v36 = *(void *)(v18 + 16);
      unint64_t v35 = *(void *)(v18 + 24);
      unint64_t v37 = v36 + 1;
      if (v36 >= v35 >> 1)
      {
        uint64_t result = (uint64_t)sub_1D31A7218((char *)(v35 > 1), v36 + 1, 1, (char *)v18);
        unint64_t v37 = v36 + 1;
        uint64_t v18 = result;
      }
      *(void *)(v18 + 16) = v37;
      unint64_t v38 = v18 + 72 * v36;
      *(void *)(v38 + 32) = v8;
      *(void *)(v38 + 40) = v9;
      *(void *)(v38 + 48) = v10;
      *(void *)(v38 + 56) = v11;
      *(_OWORD *)(v38 + 64) = 0u;
      *(_OWORD *)(v38 + 80) = 0u;
      *(unsigned char *)(v38 + 96) = 0;
      break;
    default:
      sub_1D31AA768();
      __break(1u);
      JUMPOUT(0x1D31A691CLL);
  }
  *a4 = v18;
  return result;
}

uint64_t sub_1D31A6930()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1D31A6940(uint64_t a1)
{
  return sub_1D31A6644(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1D31A694C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D31A695C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1D31A6984(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 32))(a2);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1D31A6A30(uint64_t a1)
{
  uint64_t v10 = MEMORY[0x1E4FBC860];
  sub_1D31A74B4(0, 0, 0);
  uint64_t v2 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = *(void *)(v10 + 16);
    uint64_t v5 = 16 * v4;
    do
    {
      uint64_t v6 = *(void *)(a1 + 32 + 8 * v3);
      unint64_t v7 = *(void *)(v10 + 24);
      if (v4 + v3 >= v7 >> 1) {
        sub_1D31A74B4((char *)(v7 > 1), v4 + v3 + 1, 1);
      }
      *(void *)(v10 + 16) = v4 + v3 + 1;
      uint64_t v8 = v10 + v5;
      *(void *)(v8 + 32) = v3;
      *(void *)(v8 + 40) = v6;
      v5 += 16;
      ++v3;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1D31A6B3C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x1E4FBC860];
    sub_1D31A7444(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A5038);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A5040);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1D31A7444(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1D31A7444((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      *(_OWORD *)(v2 + 16 * v6 + 32) = v8;
      v4 += 16;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t CLKUIBezierPathStepper.mapOffsetsToPathPositions(_:)()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  int64_t v1 = (char *)sub_1D31A6A30(v0);
  swift_bridgeObjectRelease();
  v35[0] = v1;
  swift_bridgeObjectRetain();
  sub_1D31A78C8(v35);
  swift_bridgeObjectRelease();
  uint64_t v2 = v35[0];
  uint64_t v3 = (objc_class *)type metadata accessor for SlopedPoint();
  uint64_t v4 = (char *)objc_allocWithZone(v3);
  unint64_t v5 = &v4[OBJC_IVAR___CLKUISlopedPoint_point];
  *(void *)unint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  unint64_t v6 = &v4[OBJC_IVAR___CLKUISlopedPoint_tangent];
  *(void *)unint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  v33.receiver = v4;
  v33.super_class = v3;
  id v7 = objc_msgSendSuper2(&v33, sel_init);
  unint64_t v34 = sub_1D31A6ED0(v7, *((void *)v2 + 2));
  uint64_t v8 = *((void *)v2 + 2);
  if (v8)
  {
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    uint64_t v11 = OBJC_IVAR___CLKUIBezierPathStepper_segments;
    uint64_t v12 = OBJC_IVAR___CLKUIBezierPathStepper_segmentLengthTables;
    double v13 = 0.0;
    while (v10 < *((void *)v2 + 2))
    {
      uint64_t v14 = *(void *)(v32 + v11);
      uint64_t v15 = *(void *)(v14 + 16);
      if ((uint64_t)v9 >= v15) {
        goto LABEL_20;
      }
      uint64_t v16 = (uint64_t)&v2[16 * v10 + 32];
      unint64_t v17 = *(void *)v16;
      double v18 = *(double *)(v16 + 8);
      ++v10;
      uint64_t v19 = *(void *)(v32 + v12);
      unint64_t v20 = *(void *)(v19 + 16);
      if (v9 > v20) {
        unint64_t v20 = v9;
      }
      unint64_t v21 = (double *)(v19 + 16 * v9 + 40);
      uint64_t v22 = v14 + 72 * v9 + 32;
      while (1)
      {
        if (v20 == v9)
        {
          __break(1u);
          goto LABEL_22;
        }
        double v23 = v13 + *v21;
        if (v23 >= v18) {
          break;
        }
        ++v9;
        v21 += 2;
        v22 += 72;
        double v13 = v23;
        if (v15 == v9) {
          goto LABEL_20;
        }
      }
      sub_1D31A5E70(*((void *)v21 - 1), v18 - v13);
      if (v9 >= *(void *)(v14 + 16)) {
        goto LABEL_23;
      }
      double v25 = v24;
      sub_1D31A8DD8(v22, (uint64_t)v35);
      id v26 = sub_1D31A5CDC(v25);
      unint64_t v27 = (unint64_t)v34;
      id v28 = v26;
      if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
        || (v27 & 0x8000000000000000) != 0
        || (v27 & 0x4000000000000000) != 0)
      {
        sub_1D31A7934(v27);
        unint64_t v27 = (unint64_t)v29;
        unint64_t v34 = v29;
      }
      if ((v17 & 0x8000000000000000) != 0) {
        goto LABEL_24;
      }
      if (v17 >= *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_25;
      }
      uint64_t v30 = *(void **)((v27 & 0xFFFFFFFFFFFFFF8) + 8 * v17 + 0x20);
      *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 8 * v17 + 0x20) = v28;

      sub_1D31AA6C8();
      if (v10 == v8) {
        goto LABEL_20;
      }
    }
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    uint64_t result = swift_release();
    __break(1u);
  }
  else
  {
LABEL_20:
    swift_release();
    return (uint64_t)v34;
  }
  return result;
}

void *sub_1D31A6ED0(void *result, uint64_t a2)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result;
    if (a2)
    {
      type metadata accessor for SlopedPoint();
      uint64_t v4 = sub_1D31AA6D8();
      uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8;
      *(void *)(v5 + 16) = a2;
      uint64_t v10 = v4;
      *(void *)(v5 + 32) = v3;
      if (a2 != 1)
      {
        *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x28) = v3;
        uint64_t v6 = a2 - 2;
        if (v6)
        {
          id v7 = (void *)(v5 + 48);
          do
          {
            *v7++ = v3;
            id v8 = v3;
            --v6;
          }
          while (v6);
        }
        id v9 = v3;
      }
    }
    else
    {
      uint64_t v10 = MEMORY[0x1E4FBC860];
    }
    sub_1D31AA6C8();
    return (void *)v10;
  }
  return result;
}

void CLKUIBezierPathStepper.totalLength()()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + OBJC_IVAR___CLKUIBezierPathStepper_segments) + 16);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR___CLKUIBezierPathStepper_segmentLengthTables);
    unint64_t v3 = *(void *)(v2 + 16);
    unint64_t v4 = v1 - 1;
    uint64_t v5 = (double *)(v2 + 40);
    double v6 = 0.0;
    while (v3 > v4)
    {
      double v7 = *v5;
      v5 += 2;
      double v6 = v6 + v7;
      if (!--v1) {
        return;
      }
    }
    __break(1u);
  }
}

id _s10ClockKitUI11SlopedPointCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_1D31A711C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A5010);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  double v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1D31A7218(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A5060);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 72);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  double v13 = a4 + 32;
  size_t v14 = 72 * v8;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v14);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1D31A7328(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A5030);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  double v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1D31A7424(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1D31A74D4(a1, a2, a3, *v3);
  *unint64_t v3 = result;
  return result;
}

char *sub_1D31A7444(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1D31A75D8(a1, a2, a3, *v3, &qword_1EA6A5048);
  *unint64_t v3 = result;
  return result;
}

char *sub_1D31A746C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1D31A75D8(a1, a2, a3, *v3, &qword_1EA6A5050);
  *unint64_t v3 = result;
  return result;
}

char *sub_1D31A7494(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1D31A76D0(a1, a2, a3, *v3);
  *unint64_t v3 = result;
  return result;
}

char *sub_1D31A74B4(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1D31A77CC(a1, a2, a3, *v3);
  *unint64_t v3 = result;
  return result;
}

char *sub_1D31A74D4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A5058);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  double v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1D31A75D8(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    int64_t v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    int64_t v11 = (char *)MEMORY[0x1E4FBC860];
  }
  size_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v14 >= &v15[16 * v9]) {
      memmove(v14, v15, 16 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 16 * v9);
  }
  swift_release();
  return v11;
}

char *sub_1D31A76D0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A5030);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

char *sub_1D31A77CC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A5028);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_1D31A78C8(char **a1)
{
  objc_super v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    objc_super v2 = sub_1D31A8388((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  uint64_t result = sub_1D31A79B0(v5);
  *a1 = v2;
  return result;
}

void sub_1D31A7934(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1D31AA778();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x1D9430E70);
}

uint64_t sub_1D31A79B0(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_1D31AA798();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_138;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v82 = *a1;
      uint64_t v83 = *a1 + 8;
      uint64_t v84 = -1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        double v86 = *(double *)(v82 + 16 * i + 8);
        uint64_t v87 = v84;
        uint64_t v88 = v83;
        do
        {
          if (v86 >= *(double *)v88) {
            break;
          }
          if (!v82) {
            goto LABEL_142;
          }
          uint64_t v89 = *(void *)(v88 + 8);
          *(_OWORD *)(v88 + 8) = *(_OWORD *)(v88 - 8);
          *(void *)(v88 - 8) = v89;
          *(double *)uint64_t v88 = v86;
          v88 -= 16;
        }
        while (!__CFADD__(v87++, 1));
        v83 += 16;
        --v84;
      }
    }
  }
  else
  {
    if (v3 >= 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 + 1;
    }
    if (v3 < -1) {
      goto LABEL_137;
    }
    uint64_t v6 = result;
    v98 = a1;
    if (v3 > 1)
    {
      uint64_t v7 = v5 >> 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A5018);
      uint64_t result = sub_1D31AA6D8();
      *(void *)(result + 16) = v7;
      uint64_t v100 = result;
      v104 = (double *)(result + 32);
LABEL_13:
      uint64_t v9 = 0;
      uint64_t v10 = *a1;
      uint64_t v99 = *a1 + 40;
      uint64_t v11 = MEMORY[0x1E4FBC860];
      uint64_t v101 = v6;
      uint64_t v102 = v3;
      uint64_t v103 = v10;
      while (1)
      {
        uint64_t v13 = v9++;
        if (v9 < v3)
        {
          double v14 = *(double *)(v10 + 16 * v9 + 8);
          double v15 = *(double *)(v10 + 16 * v13 + 8);
          uint64_t v9 = v13 + 2;
          if (v13 + 2 < v3)
          {
            uint64_t v16 = (double *)(v99 + 16 * v13);
            double v17 = v14;
            while (1)
            {
              double v18 = v17;
              double v17 = *v16;
              if (v14 < v15 == *v16 >= v18) {
                break;
              }
              ++v9;
              v16 += 2;
              if (v3 == v9)
              {
                uint64_t v9 = v3;
                break;
              }
            }
          }
          if (v14 < v15)
          {
            if (v9 < v13) {
              goto LABEL_139;
            }
            if (v13 < v9)
            {
              uint64_t v19 = 16 * v9;
              uint64_t v20 = 16 * v13;
              uint64_t v21 = v9;
              uint64_t v22 = v13;
              do
              {
                if (v22 != --v21)
                {
                  if (!v10) {
                    goto LABEL_145;
                  }
                  uint64_t v23 = v10 + v19;
                  uint64_t v24 = *(void *)(v10 + v20);
                  uint64_t v25 = *(void *)(v10 + v20 + 8);
                  *(_OWORD *)(v10 + v20) = *(_OWORD *)(v10 + v19 - 16);
                  *(void *)(v23 - 16) = v24;
                  *(void *)(v23 - 8) = v25;
                }
                ++v22;
                v19 -= 16;
                v20 += 16;
              }
              while (v22 < v21);
            }
          }
        }
        if (v9 < v3)
        {
          if (__OFSUB__(v9, v13)) {
            goto LABEL_136;
          }
          if (v9 - v13 < v6)
          {
            uint64_t v26 = v13 + v6;
            if (__OFADD__(v13, v6)) {
              goto LABEL_140;
            }
            if (v26 >= v3) {
              uint64_t v26 = v3;
            }
            if (v26 < v13)
            {
LABEL_141:
              __break(1u);
LABEL_142:
              __break(1u);
LABEL_143:
              __break(1u);
LABEL_144:
              __break(1u);
LABEL_145:
              __break(1u);
LABEL_146:
              __break(1u);
              return result;
            }
            if (v9 != v26)
            {
              unint64_t v27 = (double *)(v10 + 16 * v9);
              do
              {
                double v28 = *(double *)(v10 + 16 * v9 + 8);
                uint64_t v29 = v13;
                uint64_t v30 = v27;
                do
                {
                  if (v28 >= *(v30 - 1)) {
                    break;
                  }
                  if (!v10) {
                    goto LABEL_143;
                  }
                  double v31 = *v30;
                  *(_OWORD *)uint64_t v30 = *((_OWORD *)v30 - 1);
                  *(v30 - 1) = v28;
                  *(v30 - 2) = v31;
                  v30 -= 2;
                  ++v29;
                }
                while (v9 != v29);
                ++v9;
                v27 += 2;
              }
              while (v9 != v26);
              uint64_t v9 = v26;
            }
          }
        }
        if (v9 < v13) {
          goto LABEL_131;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_1D31A8278(0, *(void *)(v11 + 16) + 1, 1, (char *)v11);
          uint64_t v11 = result;
        }
        unint64_t v33 = *(void *)(v11 + 16);
        unint64_t v32 = *(void *)(v11 + 24);
        unint64_t v12 = v33 + 1;
        uint64_t v10 = v103;
        if (v33 >= v32 >> 1)
        {
          uint64_t result = (uint64_t)sub_1D31A8278((char *)(v32 > 1), v33 + 1, 1, (char *)v11);
          uint64_t v10 = v103;
          uint64_t v11 = result;
        }
        *(void *)(v11 + 16) = v12;
        uint64_t v34 = v11 + 32;
        unint64_t v35 = (uint64_t *)(v11 + 32 + 16 * v33);
        *unint64_t v35 = v13;
        v35[1] = v9;
        if (v33)
        {
          while (1)
          {
            unint64_t v36 = v12 - 1;
            if (v12 >= 4)
            {
              unint64_t v41 = v34 + 16 * v12;
              uint64_t v42 = *(void *)(v41 - 64);
              uint64_t v43 = *(void *)(v41 - 56);
              BOOL v47 = __OFSUB__(v43, v42);
              uint64_t v44 = v43 - v42;
              if (v47) {
                goto LABEL_120;
              }
              uint64_t v46 = *(void *)(v41 - 48);
              uint64_t v45 = *(void *)(v41 - 40);
              BOOL v47 = __OFSUB__(v45, v46);
              uint64_t v39 = v45 - v46;
              char v40 = v47;
              if (v47) {
                goto LABEL_121;
              }
              unint64_t v48 = v12 - 2;
              float v49 = (uint64_t *)(v34 + 16 * (v12 - 2));
              uint64_t v51 = *v49;
              uint64_t v50 = v49[1];
              BOOL v47 = __OFSUB__(v50, v51);
              uint64_t v52 = v50 - v51;
              if (v47) {
                goto LABEL_122;
              }
              BOOL v47 = __OFADD__(v39, v52);
              uint64_t v53 = v39 + v52;
              if (v47) {
                goto LABEL_124;
              }
              if (v53 >= v44)
              {
                double v71 = (uint64_t *)(v34 + 16 * v36);
                uint64_t v73 = *v71;
                uint64_t v72 = v71[1];
                BOOL v47 = __OFSUB__(v72, v73);
                uint64_t v74 = v72 - v73;
                if (v47) {
                  goto LABEL_130;
                }
                BOOL v64 = v39 < v74;
                goto LABEL_83;
              }
            }
            else
            {
              if (v12 != 3)
              {
                uint64_t v65 = *(void *)(v11 + 32);
                uint64_t v66 = *(void *)(v11 + 40);
                BOOL v47 = __OFSUB__(v66, v65);
                uint64_t v58 = v66 - v65;
                char v59 = v47;
                goto LABEL_77;
              }
              uint64_t v38 = *(void *)(v11 + 32);
              uint64_t v37 = *(void *)(v11 + 40);
              BOOL v47 = __OFSUB__(v37, v38);
              uint64_t v39 = v37 - v38;
              char v40 = v47;
            }
            if (v40) {
              goto LABEL_123;
            }
            unint64_t v48 = v12 - 2;
            v54 = (uint64_t *)(v34 + 16 * (v12 - 2));
            uint64_t v56 = *v54;
            uint64_t v55 = v54[1];
            BOOL v57 = __OFSUB__(v55, v56);
            uint64_t v58 = v55 - v56;
            char v59 = v57;
            if (v57) {
              goto LABEL_125;
            }
            unsigned int v60 = (uint64_t *)(v34 + 16 * v36);
            uint64_t v62 = *v60;
            uint64_t v61 = v60[1];
            BOOL v47 = __OFSUB__(v61, v62);
            uint64_t v63 = v61 - v62;
            if (v47) {
              goto LABEL_127;
            }
            if (__OFADD__(v58, v63)) {
              goto LABEL_129;
            }
            if (v58 + v63 >= v39)
            {
              BOOL v64 = v39 < v63;
LABEL_83:
              if (v64) {
                unint64_t v36 = v48;
              }
              goto LABEL_85;
            }
LABEL_77:
            if (v59) {
              goto LABEL_126;
            }
            double v67 = (uint64_t *)(v34 + 16 * v36);
            uint64_t v69 = *v67;
            uint64_t v68 = v67[1];
            BOOL v47 = __OFSUB__(v68, v69);
            uint64_t v70 = v68 - v69;
            if (v47) {
              goto LABEL_128;
            }
            if (v70 < v58) {
              goto LABEL_15;
            }
LABEL_85:
            unint64_t v75 = v36 - 1;
            if (v36 - 1 >= v12)
            {
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
              __break(1u);
LABEL_119:
              __break(1u);
LABEL_120:
              __break(1u);
LABEL_121:
              __break(1u);
LABEL_122:
              __break(1u);
LABEL_123:
              __break(1u);
LABEL_124:
              __break(1u);
LABEL_125:
              __break(1u);
LABEL_126:
              __break(1u);
LABEL_127:
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              __break(1u);
LABEL_130:
              __break(1u);
LABEL_131:
              __break(1u);
LABEL_132:
              __break(1u);
LABEL_133:
              __break(1u);
LABEL_134:
              __break(1u);
LABEL_135:
              __break(1u);
LABEL_136:
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
LABEL_140:
              __break(1u);
              goto LABEL_141;
            }
            if (!v10) {
              goto LABEL_144;
            }
            uint64_t v76 = v11;
            int v77 = (uint64_t *)(v34 + 16 * v75);
            uint64_t v78 = *v77;
            v79 = (void *)(v34 + 16 * v36);
            uint64_t v80 = v79[1];
            uint64_t result = sub_1D31A8050((double *)(v10 + 16 * *v77), (double *)(v10 + 16 * *v79), v10 + 16 * v80, v104);
            if (v1) {
              goto LABEL_93;
            }
            if (v80 < v78) {
              goto LABEL_117;
            }
            if (v36 > *(void *)(v76 + 16)) {
              goto LABEL_118;
            }
            *int v77 = v78;
            *(void *)(v34 + 16 * v75 + 8) = v80;
            unint64_t v81 = *(void *)(v76 + 16);
            if (v36 >= v81) {
              goto LABEL_119;
            }
            uint64_t v11 = v76;
            unint64_t v12 = v81 - 1;
            uint64_t result = (uint64_t)memmove((void *)(v34 + 16 * v36), v79 + 2, 16 * (v81 - 1 - v36));
            *(void *)(v76 + 16) = v81 - 1;
            uint64_t v10 = v103;
            if (v81 <= 2) {
              goto LABEL_15;
            }
          }
        }
        unint64_t v12 = 1;
LABEL_15:
        uint64_t v6 = v101;
        uint64_t v3 = v102;
        if (v9 >= v102)
        {
          uint64_t v8 = v100;
          goto LABEL_103;
        }
      }
    }
    uint64_t v8 = MEMORY[0x1E4FBC860];
    v104 = (double *)(MEMORY[0x1E4FBC860] + 32);
    if (v3 == 1)
    {
      uint64_t v100 = MEMORY[0x1E4FBC860];
      goto LABEL_13;
    }
    unint64_t v12 = *(void *)(MEMORY[0x1E4FBC860] + 16);
    uint64_t v11 = MEMORY[0x1E4FBC860];
LABEL_103:
    uint64_t result = v11;
    uint64_t v100 = v8;
    if (v12 >= 2)
    {
      uint64_t v91 = *v98;
      do
      {
        unint64_t v92 = v12 - 2;
        if (v12 < 2) {
          goto LABEL_132;
        }
        if (!v91) {
          goto LABEL_146;
        }
        uint64_t v93 = result;
        uint64_t v94 = *(void *)(result + 32 + 16 * v92);
        uint64_t v95 = *(void *)(result + 32 + 16 * (v12 - 1) + 8);
        uint64_t result = sub_1D31A8050((double *)(v91 + 16 * v94), (double *)(v91 + 16 * *(void *)(result + 32 + 16 * (v12 - 1))), v91 + 16 * v95, v104);
        if (v1) {
          break;
        }
        if (v95 < v94) {
          goto LABEL_133;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_1D31A8374(v93);
          uint64_t v93 = result;
        }
        if (v92 >= *(void *)(v93 + 16)) {
          goto LABEL_134;
        }
        v96 = (void *)(v93 + 32 + 16 * v92);
        void *v96 = v94;
        v96[1] = v95;
        unint64_t v97 = *(void *)(v93 + 16);
        if (v12 > v97) {
          goto LABEL_135;
        }
        memmove((void *)(v93 + 32 + 16 * (v12 - 1)), (const void *)(v93 + 32 + 16 * v12), 16 * (v97 - v12));
        uint64_t result = v93;
        *(void *)(v93 + 16) = v97 - 1;
        unint64_t v12 = v97 - 1;
      }
      while (v97 > 2);
    }
LABEL_93:
    swift_bridgeObjectRelease();
    *(void *)(v100 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1D31A8050(double *__dst, double *__src, unint64_t a3, double *a4)
{
  unint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = (char *)__src - (char *)__dst;
  int64_t v9 = (char *)__src - (char *)__dst + 15;
  if ((char *)__src - (char *)__dst >= 0) {
    int64_t v9 = (char *)__src - (char *)__dst;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 15;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 4;
  if (v10 >= v12 >> 4)
  {
    if (a4 != __src || &__src[2 * v13] <= a4) {
      memmove(a4, __src, 16 * v13);
    }
    double v14 = &v4[2 * v13];
    if (v7 >= v6 || v11 < 16) {
      goto LABEL_43;
    }
    double v18 = (double *)(a3 - 16);
    while (1)
    {
      uint64_t v19 = v18 + 2;
      if (*(v14 - 1) >= *(v6 - 1))
      {
        uint64_t v20 = v14 - 2;
        if (v19 != v14)
        {
          v14 -= 2;
          goto LABEL_40;
        }
        BOOL v21 = v18 >= v14;
        v14 -= 2;
        if (v21) {
          goto LABEL_40;
        }
      }
      else
      {
        uint64_t v20 = v6 - 2;
        if (v19 != v6)
        {
          v6 -= 2;
LABEL_40:
          *(_OWORD *)double v18 = *(_OWORD *)v20;
          goto LABEL_41;
        }
        BOOL v21 = v18 >= v6;
        v6 -= 2;
        if (v21) {
          goto LABEL_40;
        }
      }
LABEL_41:
      if (v6 > v7)
      {
        v18 -= 2;
        if (v14 > v4) {
          continue;
        }
      }
      goto LABEL_43;
    }
  }
  if (a4 != __dst || &__dst[2 * v10] <= a4) {
    memmove(a4, __dst, 16 * v10);
  }
  double v14 = &v4[2 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      if (v6[1] >= v4[1])
      {
        double v17 = v4 + 2;
        uint64_t v16 = v4;
        double v15 = v6;
        if (v7 == v4)
        {
          v4 += 2;
          if (v7 < v17) {
            goto LABEL_20;
          }
        }
        else
        {
          v4 += 2;
        }
      }
      else
      {
        double v15 = v6 + 2;
        uint64_t v16 = v6;
        if (v7 == v6 && v7 < v15) {
          goto LABEL_20;
        }
      }
      *(_OWORD *)uint64_t v7 = *(_OWORD *)v16;
LABEL_20:
      v7 += 2;
      if (v4 < v14)
      {
        uint64_t v6 = v15;
        if ((unint64_t)v15 < a3) {
          continue;
        }
      }
      break;
    }
  }
  uint64_t v6 = v7;
LABEL_43:
  int64_t v22 = (char *)v14 - (char *)v4 + ((char *)v14 - (char *)v4 < 0 ? 0xFuLL : 0);
  if (v6 != v4 || v6 >= (double *)((char *)v4 + (v22 & 0xFFFFFFFFFFFFFFF0))) {
    memmove(v6, v4, 16 * (v22 >> 4));
  }
  return 1;
}

char *sub_1D31A8278(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A5020);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  double v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1D31A8374(uint64_t a1)
{
  return sub_1D31A8278(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_1D31A8388(uint64_t a1)
{
  return sub_1D31A77CC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

id sub_1D31A839C(uint64_t a1, double a2)
{
  objc_super v2 = (char *)a1;
  unint64_t v3 = *(void *)(a1 + 16);
  id result = (id)swift_bridgeObjectRetain();
  if (v3 >= 3)
  {
    char v5 = (char *)MEMORY[0x1E4FBC860];
    do
    {
      unint64_t v6 = (float64x2_t *)(v2 + 48);
      objc_super v2 = sub_1D31A711C(0, 1, 1, v5);
      unint64_t v7 = *((void *)v2 + 2);
      unint64_t v8 = v3 - 1;
      double v9 = a2;
      do
      {
        float64x2_t v11 = v6[-1];
        float64x2_t v10 = *v6;
        unint64_t v12 = *((void *)v2 + 3);
        if (v7 >= v12 >> 1)
        {
          float64x2_t v28 = *v6;
          float64x2_t v29 = v6[-1];
          uint64_t v13 = sub_1D31A711C((char *)(v12 > 1), v7 + 1, 1, v2);
          float64x2_t v10 = v28;
          float64x2_t v11 = v29;
          double v9 = a2;
          objc_super v2 = v13;
        }
        *((void *)v2 + 2) = v7 + 1;
        *(float64x2_t *)&v2[16 * v7 + 32] = vaddq_f64(v11, vmulq_n_f64(vsubq_f64(v10, v11), v9));
        ++v6;
        ++v7;
        --v8;
      }
      while (v8);
      id result = (id)swift_bridgeObjectRelease();
      unint64_t v3 = *((void *)v2 + 2);
    }
    while (v3 > 2);
  }
  if (v3)
  {
    if (v3 != 1)
    {
      double v15 = *((double *)v2 + 4);
      double v14 = *((double *)v2 + 5);
      double v16 = *((double *)v2 + 6);
      double v17 = *((double *)v2 + 7);
      swift_bridgeObjectRelease();
      double v18 = v17 - v14;
      double v19 = v15 + (v16 - v15) * a2;
      double v20 = v14 + (v17 - v14) * a2;
      double v21 = sqrt((v15 - v16) * (v15 - v16) + (v14 - v17) * (v14 - v17));
      double v22 = (v16 - v15) / v21;
      double v23 = v18 / v21;
      uint64_t v24 = (objc_class *)type metadata accessor for SlopedPoint();
      uint64_t v25 = (char *)objc_allocWithZone(v24);
      uint64_t v26 = (double *)&v25[OBJC_IVAR___CLKUISlopedPoint_point];
      *uint64_t v26 = v19;
      v26[1] = v20;
      unint64_t v27 = (double *)&v25[OBJC_IVAR___CLKUISlopedPoint_tangent];
      *unint64_t v27 = v22;
      v27[1] = v23;
      v31.receiver = v25;
      v31.super_class = v24;
      return objc_msgSendSuper2(&v31, sel_init);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1D31A8560(uint64_t a1, double (*a2)(uint64_t, double))
{
  uint64_t v14 = MEMORY[0x1E4FBC860];
  sub_1D31A746C(0, 0, 0);
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a1 + 32;
    do
    {
      double v7 = a2(v5, *(double *)(v6 + 8 * v5));
      uint64_t v9 = v8;
      unint64_t v11 = *(void *)(v14 + 16);
      unint64_t v10 = *(void *)(v14 + 24);
      if (v11 >= v10 >> 1) {
        sub_1D31A746C((char *)(v10 > 1), v11 + 1, 1);
      }
      ++v5;
      *(void *)(v14 + 16) = v11 + 1;
      uint64_t v12 = v14 + 16 * v11;
      *(double *)(v12 + 32) = v7;
      *(void *)(v12 + 40) = v9;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1D31A8678(uint64_t a1, int64_t a2)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_43;
  }
  unint64_t v4 = MEMORY[0x1E4FBC860];
  if (a2)
  {
    *(void *)&long long v71 = MEMORY[0x1E4FBC860];
    sub_1D31A7494(0, a2, 0);
    uint64_t v8 = 0;
    uint64_t v3 = v71;
    unint64_t v9 = *(void *)(v71 + 16);
    do
    {
      *(void *)&long long v71 = v3;
      unint64_t v10 = *(void *)(v3 + 24);
      unint64_t v11 = v9 + 1;
      if (v9 >= v10 >> 1)
      {
        sub_1D31A7494((char *)(v10 > 1), v9 + 1, 1);
        uint64_t v3 = v71;
      }
      *(void *)(v3 + 16) = v11;
      *(double *)(v3 + 8 * v9++ + 32) = (double)v8++ / (double)(a2 - 1);
    }
    while (a2 != v8);
  }
  else
  {
    unint64_t v11 = *(void *)(MEMORY[0x1E4FBC860] + 16);
    uint64_t v3 = MEMORY[0x1E4FBC860];
    if (!v11) {
      goto LABEL_18;
    }
  }
  unint64_t v70 = v4;
  sub_1D31AA738();
  uint64_t v12 = 0;
  do
  {
    double v23 = *(double *)(v3 + 8 * v12 + 32);
    sub_1D31A8DD8(a1, (uint64_t)&v71);
    if (v76)
    {
      long long v64 = v72;
      long long v66 = v71;
      if (v76 == 1)
      {
        long long v24 = v73;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A5010);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_1D31B6C70;
        *(_OWORD *)(inited + 32) = v66;
        *(_OWORD *)(inited + 48) = v64;
        *(_OWORD *)(inited + 64) = v24;
      }
      else
      {
        long long v63 = v73;
        uint64_t v26 = v74;
        uint64_t v27 = v75;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A5010);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_1D31B6C60;
        *(_OWORD *)(inited + 32) = v66;
        *(_OWORD *)(inited + 48) = v64;
        *(_OWORD *)(inited + 64) = v63;
        *(void *)(inited + 80) = v26;
        *(void *)(inited + 88) = v27;
      }
      sub_1D31A839C(inited, v23);
      swift_setDeallocating();
    }
    else
    {
      double v13 = *(double *)&v71;
      double v14 = v13 + v23 * (*(double *)&v72 - v13);
      double v15 = *((double *)&v71 + 1) + v23 * (*((double *)&v72 + 1) - *((double *)&v71 + 1));
      double v16 = sqrt((v13 - *(double *)&v72) * (v13 - *(double *)&v72)+ (*((double *)&v71 + 1) - *((double *)&v72 + 1)) * (*((double *)&v71 + 1) - *((double *)&v72 + 1)));
      double v17 = (*(double *)&v72 - *(double *)&v71) / v16;
      double v18 = (*((double *)&v72 + 1) - *((double *)&v71 + 1)) / v16;
      double v19 = (objc_class *)type metadata accessor for SlopedPoint();
      double v20 = (char *)objc_allocWithZone(v19);
      double v21 = (double *)&v20[OBJC_IVAR___CLKUISlopedPoint_point];
      *double v21 = v14;
      v21[1] = v15;
      double v22 = (double *)&v20[OBJC_IVAR___CLKUISlopedPoint_tangent];
      *double v22 = v17;
      v22[1] = v18;
      v68.receiver = v20;
      v68.super_class = v19;
      objc_msgSendSuper2(&v68, sel_init);
    }
    ++v12;
    sub_1D31AA718();
    sub_1D31AA748();
    sub_1D31AA758();
    sub_1D31AA728();
  }
  while (v11 != v12);
  unint64_t v4 = v70;
LABEL_18:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A5030);
  uint64_t v2 = swift_initStackObject();
  *(_OWORD *)(v2 + 16) = xmmword_1D31B6C80;
  *(void *)(v2 + 32) = 0;
  uint64_t v69 = v2;
  unint64_t v5 = v4 & 0xC000000000000001;
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_43:
    float64x2_t v28 = (char *)MEMORY[0x1D9430E60](0, v4);
    goto LABEL_21;
  }
  if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  float64x2_t v28 = (char *)*(id *)(v4 + 32);
LABEL_21:
  float64x2_t v29 = v28;
  if (!(v4 >> 62))
  {
    uint64_t v30 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v30 >= 1) {
      uint64_t v31 = 1;
    }
    else {
      uint64_t v31 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v30 >= (unint64_t)v31) {
      goto LABEL_26;
    }
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  swift_bridgeObjectRetain();
  uint64_t v30 = sub_1D31AA778();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v30 & 0x8000000000000000) == 0)
  {
    if (v30 >= 1) {
      uint64_t v31 = 1;
    }
    else {
      uint64_t v31 = v30;
    }
    swift_bridgeObjectRetain();
    uint64_t v65 = sub_1D31AA778();
    swift_bridgeObjectRelease();
    if (v65 >= v31)
    {
      swift_bridgeObjectRetain();
      uint64_t v62 = sub_1D31AA778();
      swift_bridgeObjectRelease();
      if (v62 >= v30)
      {
LABEL_26:
        if (v5 && (unint64_t)v30 >= 2)
        {
          type metadata accessor for SlopedPoint();
          uint64_t v32 = v31;
          do
          {
            uint64_t v33 = v32 + 1;
            sub_1D31AA6E8();
            uint64_t v32 = v33;
          }
          while (v30 != v33);
        }
        if (v4 >> 62)
        {
          swift_bridgeObjectRetain();
          sub_1D31AA788();
          uint64_t v34 = v35;
          uint64_t v31 = v36;
          unint64_t v38 = v37;
          swift_bridgeObjectRelease_n();
          uint64_t v30 = v38 >> 1;
        }
        else
        {
          uint64_t v34 = (v4 & 0xFFFFFFFFFFFFFF8) + 32;
        }
        BOOL v39 = __OFSUB__(v30, v31);
        uint64_t v40 = v30 - v31;
        uint64_t v67 = v3;
        if (!v40)
        {
          uint64_t v41 = swift_unknownObjectRelease();
LABEL_41:
          MEMORY[0x1F4188790](v41, v42, v43, v44, v45, v46);
          uint64_t v59 = sub_1D31A8560(v67, (double (*)(uint64_t, double))sub_1D31A9224);
          swift_bridgeObjectRelease();
          uint64_t v60 = sub_1D31A6B3C(v59);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v60;
        }
        if (!((v40 < 0) ^ v39 | (v40 == 0)))
        {
          BOOL v47 = (void **)(v34 + 8 * v31);
          double v48 = 0.0;
          do
          {
            float v49 = *v47;
            uint64_t v50 = (double *)((char *)*v47 + OBJC_IVAR___CLKUISlopedPoint_point);
            swift_beginAccess();
            double v52 = *v50;
            double v51 = v50[1];
            uint64_t v53 = (double *)&v29[OBJC_IVAR___CLKUISlopedPoint_point];
            swift_beginAccess();
            double v55 = *v53;
            double v54 = v53[1];
            unint64_t v56 = *(void *)(v2 + 16);
            unint64_t v57 = *(void *)(v2 + 24);
            uint64_t v58 = v49;
            if (v56 >= v57 >> 1) {
              uint64_t v2 = (uint64_t)sub_1D31A7328((char *)(v57 > 1), v56 + 1, 1, (char *)v2);
            }
            double v48 = v48 + sqrt((v52 - v55) * (v52 - v55) + (v51 - v54) * (v51 - v54));
            *(void *)(v2 + 16) = v56 + 1;
            *(double *)(v2 + 8 * v56 + 32) = v48;

            ++v47;
            float64x2_t v29 = v58;
            --v40;
          }
          while (v40);
          uint64_t v41 = swift_unknownObjectRelease();
          uint64_t v69 = v2;
          float64x2_t v29 = v58;
          goto LABEL_41;
        }
LABEL_53:
        __break(1u);
      }
      __break(1u);
    }
    goto LABEL_51;
  }
  __break(1u);
  return result;
}

uint64_t sub_1D31A8C98(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v13 = MEMORY[0x1E4FBC860];
    sub_1D31A7424(0, v1, 0);
    uint64_t v2 = v13;
    uint64_t v4 = a1 + 32;
    do
    {
      sub_1D31A8DD8(v4, (uint64_t)v14);
      sub_1D31A8DD8((uint64_t)v14, (uint64_t)v15);
      if (v15[64]) {
        int64_t v5 = 16;
      }
      else {
        int64_t v5 = 2;
      }
      uint64_t v6 = sub_1D31A8678((uint64_t)v14, v5);
      uint64_t v8 = v7;
      unint64_t v10 = *(void *)(v13 + 16);
      unint64_t v9 = *(void *)(v13 + 24);
      if (v10 >= v9 >> 1) {
        sub_1D31A7424((char *)(v9 > 1), v10 + 1, 1);
      }
      *(void *)(v13 + 16) = v10 + 1;
      uint64_t v11 = v13 + 16 * v10;
      *(void *)(v11 + 32) = v6;
      *(void *)(v11 + 40) = v8;
      v4 += 72;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t type metadata accessor for SlopedPoint()
{
  return self;
}

uint64_t sub_1D31A8DD8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  long long v2 = *(_OWORD *)(a1 + 16);
  long long v3 = *(_OWORD *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  *(unsigned char *)(a2 + 64) = *(unsigned char *)(a1 + 64);
  *(_OWORD *)(a2 + 32) = v3;
  *(_OWORD *)(a2 + 48) = v4;
  *(_OWORD *)(a2 + 16) = v2;
  return a2;
}

uint64_t method lookup function for SlopedPoint(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SlopedPoint);
}

uint64_t dispatch thunk of SlopedPoint.__allocating_init(point:tangent:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t type metadata accessor for CLKUIBezierPathStepper()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for LengthTable(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LengthTable()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for LengthTable(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for LengthTable(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for LengthTable(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LengthTable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LengthTable()
{
  return &type metadata for LengthTable;
}

void type metadata accessor for CGVector(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for PathSegment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for PathSegment(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 65)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 64);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PathSegment(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 65) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 65) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 64) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1D31A90C8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 64);
}

uint64_t sub_1D31A90D4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 64) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PathSegment()
{
  return &type metadata for PathSegment;
}

uint64_t sub_1D31A90EC(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)(a1 + 8)) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t sub_1D31A9130(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = 0;
    }
  }
  return result;
}

void type metadata accessor for CGPathElement(uint64_t a1)
{
}

uint64_t sub_1D31A9180(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1D31A91A0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1D31A9224(unint64_t result)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (*(void *)(**(void **)(v1 + 16) + 16) <= result) {
LABEL_5:
  }
    __break(1u);
  return result;
}

void type metadata accessor for CGPathElementType(uint64_t a1)
{
}

void sub_1D31A9264(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1D31A92C0()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void _linearizeAndComputeAPL_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3174000, v0, v1, "Cannot compute APL for NULL pixels.", v2, v3, v4, v5, v6);
}

void _linearizeAndComputeAPL_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3174000, v0, v1, "Failed to allocate memory for APL workspace.", v2, v3, v4, v5, v6);
}

void CLKUIComputeImageAPL_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3174000, v0, v1, "Failed to get data from bitmap context", v2, v3, v4, v5, v6);
}

void CLKUIConvertTextureFromXRSRGBtoP3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3174000, v0, v1, "xsrgb: newComputePipelineStateWithFunction returned nil", v2, v3, v4, v5, v6);
}

void CLKUIConvertTextureFromXRSRGBtoP3_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D3174000, a2, OS_LOG_TYPE_FAULT, "xsrgb: newComputePipelineStateWithFunction error=%@", (uint8_t *)&v2, 0xCu);
}

void CLKUIConvertTextureFromXRSRGBtoP3_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3174000, v0, v1, "xsrgb: newFunctionWithName returned nil", v2, v3, v4, v5, v6);
}

void CLKUIConvertTextureFromXRSRGBtoP3_cold_4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3174000, v0, v1, "xsrgb: newDefaultLibraryWithBundle returned nil", v2, v3, v4, v5, v6);
}

void CLKUIConvertTextureFromXRSRGBtoP3_cold_5(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D3174000, a2, OS_LOG_TYPE_FAULT, "xsrgb: newDefaultLibraryWithBundle error=%@", (uint8_t *)&v2, 0xCu);
}

void _CLKUICalculateNumCompressedTexMipmaps_cold_1()
{
  __assert_rtn("_CLKUICalculateNumCompressedTexMipmaps", "CLKUIMetalTexture.m", 100, "mipCount != 0");
}

uint64_t sub_1D31AA6A8()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1D31AA6B8()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1D31AA6C8()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1D31AA6D8()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1D31AA6E8()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1D31AA6F8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1D31AA708()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1D31AA718()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1D31AA728()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1D31AA738()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1D31AA748()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1D31AA758()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1D31AA768()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1D31AA778()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1D31AA788()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1D31AA798()
{
  return MEMORY[0x1F4185740]();
}

uint64_t BSCurrentUserDirectory()
{
  return MEMORY[0x1F410C1E8]();
}

uint64_t CAColorMatrixConcat()
{
  return MEMORY[0x1F40F4A48]();
}

uint64_t CAColorMatrixMakeColorSourceOver()
{
  return MEMORY[0x1F40F4A58]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D18](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D48](retstr, t, angle, x, y, z);
}

CFMutableAttributedStringRef CFAttributedStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableAttributedStringRef)MEMORY[0x1F40D7250](alloc, maxLength);
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x1F40D7298](aStr);
}

void CFAttributedStringReplaceString(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef replacement)
{
}

void CFAttributedStringSetAttribute(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef attrName, CFTypeRef value)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1F40D9870](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1F40D9878](context);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x1F40D9980](a1, *(void *)&intent, color, options);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextSetShouldSubpixelQuantizeFonts(CGContextRef c, BOOL shouldSubpixelQuantizeFonts)
{
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1F40DA2E8](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA920](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB178](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CLKBuildVersion()
{
  return MEMORY[0x1F40D5DB8]();
}

uint64_t CLKCeilForDevice()
{
  return MEMORY[0x1F40D5DC0]();
}

uint64_t CLKCompressFraction()
{
  return MEMORY[0x1F40D5DE8]();
}

uint64_t CLKDialDiameterForDevice()
{
  return MEMORY[0x1F40D5E08]();
}

uint64_t CLKEqualObjects()
{
  return MEMORY[0x1F40D5E18]();
}

uint64_t CLKFloatEqualsFloat()
{
  return MEMORY[0x1F40D5E20]();
}

uint64_t CLKFloorForDevice()
{
  return MEMORY[0x1F40D5E28]();
}

uint64_t CLKHourMinuteSecondAnglesForTime()
{
  return MEMORY[0x1F40D5E48]();
}

uint64_t CLKInternalBuild()
{
  return MEMORY[0x1F40D5E50]();
}

uint64_t CLKInterpolateBetweenColors()
{
  return MEMORY[0x1F40D5E58]();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return MEMORY[0x1F40D5E60]();
}

uint64_t CLKKernValueForDesignSpecTrackingValue()
{
  return MEMORY[0x1F40D5ED0]();
}

uint64_t CLKLocaleRenderingHintLanguageIdentifierForNumberingSystem()
{
  return MEMORY[0x1F40D5F10]();
}

uint64_t CLKLoggingObjectForDomain()
{
  return MEMORY[0x1F40D5F18]();
}

uint64_t CLKNormalizeAngle()
{
  return MEMORY[0x1F40D5F28]();
}

uint64_t CLKPixelAlignRectForDevice()
{
  return MEMORY[0x1F40D5F30]();
}

uint64_t CLKRectEqualsRect()
{
  return MEMORY[0x1F40D5F60]();
}

uint64_t CLKRectGetCenter()
{
  return MEMORY[0x1F40D5F68]();
}

uint64_t CLKRoundForDevice()
{
  return MEMORY[0x1F40D5FA8]();
}

uint64_t CLKRunningInProcess()
{
  return MEMORY[0x1F40D5FB0]();
}

uint64_t CLKSizeEqualsSize()
{
  return MEMORY[0x1F40D5FD0]();
}

uint64_t CLKSizeIsEmpty()
{
  return MEMORY[0x1F40D5FE0]();
}

uint64_t CLKValueForDeviceMetrics()
{
  return MEMORY[0x1F40D5FF8]();
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  MEMORY[0x1F40DF4C0](font, *(void *)&orientation, glyphs, boundingRects, count);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

CGRect CTFontGetOpticalBoundsForGlyphs(CTFontRef font, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count, CFOptionFlags options)
{
  MEMORY[0x1F40DF540](font, glyphs, boundingRects, count, options);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  MEMORY[0x1F40DF7C8](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect CTLineGetImageBounds(CTLineRef line, CGContextRef context)
{
  MEMORY[0x1F40DF7E8](line, context);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x1F40DF820](line, ascent, descent, leading);
  return result;
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

uint64_t NRVersionIsGreaterThanOrEqual()
{
  return MEMORY[0x1F41306E8]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4166AB0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

simd_float4 _simd_pow_f4(simd_float4 x, simd_float4 y)
{
  MEMORY[0x1F40CA188]((__n128)x, (__n128)y);
  return result;
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

long double acos(long double __x)
{
  MEMORY[0x1F40CA330](__x);
  return result;
}

float asinf(float a1)
{
  MEMORY[0x1F40CA3D8](a1);
  return result;
}

float cbrtf(float a1)
{
  MEMORY[0x1F40CA690](a1);
  return result;
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1F417F0C0](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0D0](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1F417F0E0](stream, *(void *)&flags);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

uint64_t geo_isDayLightForLocation()
{
  return MEMORY[0x1F411C6C8]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCB08](a1, a2, *(void *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

size_t os_proc_available_memory(void)
{
  return MEMORY[0x1F40CD538]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}