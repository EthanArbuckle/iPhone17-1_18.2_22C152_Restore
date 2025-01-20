@interface ProcessSkinnedGeometryForJointIndex
@end

@implementation ProcessSkinnedGeometryForJointIndex

void ____ProcessSkinnedGeometryForJointIndex_block_invoke(uint64_t a1, int a2, uint8x8_t a3, uint8x8_t a4, uint8x8_t a5, uint8x8_t a6, uint64_t a7, uint64_t a8, int a9, int a10, int a11, int a12, unsigned char *a13)
{
  int v14 = a8;
  int v17 = *(_DWORD *)(a1 + 232);
  BOOL v18 = v17 == 1;
  if (v17 == 1) {
    int v19 = a11;
  }
  else {
    int v19 = a10;
  }
  if (v18) {
    int v20 = a10;
  }
  else {
    int v20 = a11;
  }
  uint64_t v21 = *(void *)(a1 + 112);
  int v22 = *(unsigned __int8 *)(a1 + 125);
  a3.i32[0] = *(_DWORD *)(v21 + (v19 * v22));
  float32x4_t v26 = (float32x4_t)vmovl_u8(a3);
  a4.i32[0] = *(_DWORD *)(v21 + (v20 * v22));
  a5.i32[0] = *(_DWORD *)(v21 + (v22 * a12));
  int16x4_t v23 = (int16x4_t)vmovl_u8(a5).u64[0];
  a6.i32[0] = *(_DWORD *)(a1 + 236);
  int16x4_t v24 = (int16x4_t)vmovl_u8(a6).u64[0];
  *(int8x8_t *)v26.f32 = vorr_s8((int8x8_t)vceq_s16(*(int16x4_t *)v26.f32, v24), (int8x8_t)vceq_s16((int16x4_t)*(_OWORD *)&vmovl_u8(a4), v24));
  int8x8_t v25 = (int8x8_t)vceq_s16(v23, v24);
  *(int8x8_t *)v26.f32 = vorr_s8(*(int8x8_t *)v26.f32, v25);
  *(int8x8_t *)v26.f32 = vuzp1_s8(*(int8x8_t *)v26.f32, *(int8x8_t *)v26.f32);
  v26.i8[0] = vmaxv_u8(*(uint8x8_t *)v26.f32);
  if (v26.i8[0] < 0)
  {
    if (*(unsigned char *)(a1 + 240))
    {
      uint64_t v28 = *(void *)(a1 + 128);
      int v29 = *(unsigned __int8 *)(a1 + 141);
      uint64_t v30 = v28 + (v19 * v29);
      v31.i64[0] = *(void *)v30;
      v31.i64[1] = *(unsigned int *)(v30 + 8);
      uint64_t v32 = v28 + (v20 * v29);
      v33.i64[0] = *(void *)v32;
      v33.i64[1] = *(unsigned int *)(v32 + 8);
      uint64_t v34 = v28 + (v29 * a12);
      v35.i64[0] = *(void *)v34;
      v35.i64[1] = *(unsigned int *)(v34 + 8);
    }
    else
    {
      *(double *)v36.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 140), (float *)(*(void *)(a1 + 128) + v19 * *(unsigned __int8 *)(a1 + 141)), v26, *(float *)v25.i32, *(float *)v23.i32);
      float32x4_t v58 = v36;
      *(double *)v39.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 140), (float *)(*(void *)(a1 + 128) + v20 * *(unsigned __int8 *)(a1 + 141)), v36, v37, v38);
      float32x4_t v57 = v39;
      *(double *)v35.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 140), (float *)(*(void *)(a1 + 128) + *(unsigned __int8 *)(a1 + 141) * a12), v39, v40, v41);
      float32x4_t v33 = v57;
      float32x4_t v31 = v58;
    }
    *(float32x4_t *)(*(void *)(*(void *)(a1 + 80) + 8) + 32) = vminq_f32(*(float32x4_t *)(*(void *)(*(void *)(a1 + 80) + 8)+ 32), v31);
    *(float32x4_t *)(*(void *)(*(void *)(a1 + 80) + 8) + 32) = vminq_f32(*(float32x4_t *)(*(void *)(*(void *)(a1 + 80) + 8)+ 32), v33);
    *(float32x4_t *)(*(void *)(*(void *)(a1 + 80) + 8) + 32) = vminq_f32(*(float32x4_t *)(*(void *)(*(void *)(a1 + 80) + 8)+ 32), v35);
    *(float32x4_t *)(*(void *)(*(void *)(a1 + 88) + 8) + 32) = vmaxq_f32(*(float32x4_t *)(*(void *)(*(void *)(a1 + 88) + 8)+ 32), v31);
    *(float32x4_t *)(*(void *)(*(void *)(a1 + 88) + 8) + 32) = vmaxq_f32(*(float32x4_t *)(*(void *)(*(void *)(a1 + 88) + 8)+ 32), v33);
    *(float32x4_t *)(*(void *)(*(void *)(a1 + 88) + 8) + 32) = vmaxq_f32(*(float32x4_t *)(*(void *)(*(void *)(a1 + 88) + 8)+ 32), v35);
    *(float32x4_t *)(*(void *)(a1 + 144)
                   + 16 * (3 * *(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))) = v31;
    *(float32x4_t *)(*(void *)(a1 + 144)
                   + 16 * (3 * *(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) + 1)) = v33;
    *(float32x4_t *)(*(void *)(a1 + 144)
                   + 16 * (3 * *(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) + 2)) = v35;
    *(_DWORD *)(*(void *)(a1 + 152)
              + 4 * (*(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))++) = a2;
  }
  uint64_t v42 = *(void *)(*(void *)(a1 + 96) + 8);
  unsigned int v43 = *(_DWORD *)(v42 + 24);
  if (v43 > 0x1F || v14 - 3 == a9 && *(_DWORD *)(a1 + 168) - 1 == a2)
  {
    *(_DWORD *)(v42 + 24) = 0;
    v44 = *(float32x4_t **)(*(void *)(a1 + 80) + 8);
    float32x4_t v45 = v44[2];
    float32x4_t v46 = *(float32x4_t *)(*(void *)(*(void *)(a1 + 88) + 8) + 32);
    v44[2] = (float32x4_t)vdupq_n_s32(0x7F7FFFFFu);
    *(void *)&long long v47 = 0x80000000800000;
    *((void *)&v47 + 1) = 0x80000000800000;
    *(_OWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 32) = v47;
    float32x4_t v48 = *(float32x4_t *)(a1 + 32);
    __n128 v49 = *(__n128 *)(a1 + 64);
    float32x4_t v50 = vmulq_f32((float32x4_t)v49, vsubq_f32(v45, v48));
    float32x4_t v51 = vmulq_f32((float32x4_t)v49, vsubq_f32(v46, v48));
    v50.i32[3] = 0;
    v51.i32[3] = 0;
    float32x4_t v52 = vminnmq_f32(v50, v51);
    float32x4_t v53 = vmaxnmq_f32(v50, v51);
    float v54 = v52.f32[2];
    if (v52.f32[0] >= v52.f32[2]) {
      float v54 = v52.f32[0];
    }
    if (v54 < v52.f32[1]) {
      float v54 = v52.f32[1];
    }
    float v55 = v53.f32[2];
    if (v53.f32[0] <= v53.f32[2]) {
      float v55 = v53.f32[0];
    }
    v53.i32[0] = v53.i32[1];
    if (v55 <= v53.f32[1]) {
      v53.f32[0] = v55;
    }
    if (v53.f32[0] >= v54
      && v54 < v49.n128_f32[3]
      && __ProcessTriangleIndicesBatch(*(void *)(a1 + 144), *(void *)(a1 + 152), v43, v48, *(float32x4_t *)(a1 + 48), v49, a8, *(unsigned char *)(a1 + 241), *(void *)(a1 + 224)))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
      *a13 = 1;
    }
  }
}

@end