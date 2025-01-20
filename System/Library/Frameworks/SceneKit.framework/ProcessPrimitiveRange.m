@interface ProcessPrimitiveRange
@end

@implementation ProcessPrimitiveRange

void ____ProcessPrimitiveRange_Generic_block_invoke(float32x4_t *a1, unsigned int a2, uint64_t a3, int a4, unsigned char *a5, int32x4_t a6, float32x4_t a7, float a8)
{
  uint64_t v12 = 0;
  uint64_t v13 = (a4 - 2);
  uint64_t v14 = a3 + 4;
  while (v13 != v12)
  {
    v15 = (int *)(a1[6].i8[12] ? v14 : a3);
    v16 = (int *)(a1[6].i8[12] ? a3 : v14);
    int v17 = *(_DWORD *)(a3 + 4 * (v12 + 2));
    int v18 = *v16;
    int v19 = *v15;
    if (a1[6].i8[13])
    {
      uint64_t v20 = a1[5].i64[1];
      __int32 v21 = a1[6].i32[2];
      uint64_t v22 = v20 + (v21 * v19);
      v23.i64[0] = *(void *)v22;
      v23.i64[1] = *(unsigned int *)(v22 + 8);
      uint64_t v24 = v20 + (v21 * v18);
      v25.i64[0] = *(void *)v24;
      v25.i64[1] = *(unsigned int *)(v24 + 8);
      uint64_t v26 = v20 + (v21 * v17);
      v27.i64[0] = *(void *)v26;
      v27.i64[1] = *(unsigned int *)(v26 + 8);
    }
    else
    {
      *(double *)v28.i64 = C3DConvertFloatingTypeToFloat4(a1[6].u8[14], (float *)(a1[5].i64[1] + (a1[6].i32[2] * v19)), (float32x4_t)a6, a7.f32[0], a8);
      float32x4_t v56 = v28;
      *(double *)v31.i64 = C3DConvertFloatingTypeToFloat4(a1[6].u8[14], (float *)(a1[5].i64[1] + (a1[6].i32[2] * v18)), v28, v29, v30);
      float32x4_t v54 = v31;
      *(double *)v34.i64 = C3DConvertFloatingTypeToFloat4(a1[6].u8[14], (float *)(a1[5].i64[1] + (a1[6].i32[2] * v17)), v31, v32, v33);
      float32x4_t v25 = v54;
      float32x4_t v23 = v56;
      float32x4_t v27 = v34;
    }
    float32x4_t v35 = vsubq_f32(v25, v23);
    float32x4_t v36 = vsubq_f32(v27, v23);
    float32x4_t v37 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v36, (int32x4_t)v36), (int8x16_t)v36, 0xCuLL), vnegq_f32(v35)), v36, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v35, (int32x4_t)v35), (int8x16_t)v35, 0xCuLL));
    float32x4_t v38 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v37, (int32x4_t)v37), (int8x16_t)v37, 0xCuLL);
    int32x4_t v39 = (int32x4_t)vmulq_f32(v37, v37);
    v39.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v39.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v39, 2), *(float32x2_t *)v39.i8)).u32[0];
    float32x2_t v40 = vrsqrte_f32((float32x2_t)v39.u32[0]);
    float32x4_t v42 = vmulq_n_f32(v38, vmul_f32(v40, vrsqrts_f32((float32x2_t)v39.u32[0], vmul_f32(v40, v40))).f32[0]);
    float32x4_t v41 = vmulq_f32(v23, v42);
    v42.f32[3] = -vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2), vaddq_f32(v41, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 1))).f32[0];
    float32x4_t v43 = a1[3];
    int8x16_t v44 = (int8x16_t)vmulq_f32(v42, v43);
    float v45 = vaddv_f32(vadd_f32(*(float32x2_t *)v44.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v44, v44, 8uLL)));
    if (a1[6].i8[15])
    {
      if (v45 >= 0.0) {
        return;
      }
    }
    else if (v45 == 0.0)
    {
      return;
    }
    float32x4_t v46 = a1[2];
    int8x16_t v47 = (int8x16_t)vmulq_f32(v42, v46);
    float v48 = (float)-vaddv_f32(vadd_f32(*(float32x2_t *)v47.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v47, v47, 8uLL))) / v45;
    if (v48 < 0.0 || v48 > a1[4].f32[3]) {
      break;
    }
    float v53 = v48;
    float32x4_t v55 = vmlaq_n_f32(v46, v43, v48);
    __n128 v57 = (__n128)v42;
    *(double *)v50.i64 = scn_triangle_barycentric_coordinates(v23, v25, v27, v55);
    v51.i64[0] = 0xBF000000BF000000;
    v51.i64[1] = 0xBF000000BF000000;
    float32x4_t v52 = vabsq_f32(vaddq_f32(v50, v51));
    a7.i64[0] = 0x3F0000003F000000;
    a7.i64[1] = 0x3F0000003F000000;
    a6 = vcgeq_f32(a7, v52);
    a6.i32[3] = a6.i32[2];
    a6.i32[0] = vminvq_u32((uint32x4_t)a6);
    v14 += 4;
    ++v12;
    if (a6.i32[0] < 0)
    {
      __AddLocalResult(a1[6].i64[0], a2, 0, v12, v12 + 1, v53, v55, v57);
      if ((*(_WORD *)(a1[6].i64[0] + 8) & 0x80) != 0)
      {
        *a5 = 1;
        *(unsigned char *)(*(void *)(a1[5].i64[0] + 8) + 24) = 1;
      }
      return;
    }
  }
}

void ____ProcessPrimitiveRange_Mask_block_invoke(float32x4_t *a1, unsigned int a2, uint64_t a3, int a4, unsigned char *a5, int32x4_t a6, float32x4_t a7, float a8)
{
  uint64_t v8 = (a4 - 2);
  if (a4 != 2)
  {
    uint64_t v13 = 0;
    uint64_t v14 = a3 + 4;
    do
    {
      v15 = (unsigned int *)(a1[6].i8[12] ? v14 : a3);
      v16 = (unsigned int *)(a1[6].i8[12] ? a3 : v14);
      uint64_t v17 = *(unsigned int *)(a3 + 4 * (v13 + 2));
      uint64_t v18 = *v16;
      uint64_t v19 = *v15;
      if (((*(unsigned char *)(*(void *)(a1[5].i64[1] + 304) + v18) & *(unsigned char *)(*(void *)(a1[5].i64[1] + 304)
                                                                                           + v19)) & *(unsigned char *)(*(void *)(a1[5].i64[1] + 304) + v17)) != 0)
        break;
      if (a1[6].i8[13])
      {
        uint64_t v20 = a1[6].i64[0];
        __int32 v21 = a1[6].i32[2];
        uint64_t v22 = v20 + (v21 * v19);
        v23.i64[0] = *(void *)v22;
        v23.i64[1] = *(unsigned int *)(v22 + 8);
        uint64_t v24 = v20 + (v21 * v18);
        v25.i64[0] = *(void *)v24;
        v25.i64[1] = *(unsigned int *)(v24 + 8);
        uint64_t v26 = v20 + (v21 * v17);
        v27.i64[0] = *(void *)v26;
        v27.i64[1] = *(unsigned int *)(v26 + 8);
      }
      else
      {
        *(double *)v28.i64 = C3DConvertFloatingTypeToFloat4(a1[6].u8[14], (float *)(a1[6].i64[0] + (a1[6].i32[2] * v19)), (float32x4_t)a6, a7.f32[0], a8);
        float32x4_t v56 = v28;
        *(double *)v31.i64 = C3DConvertFloatingTypeToFloat4(a1[6].u8[14], (float *)(a1[6].i64[0] + (a1[6].i32[2] * v18)), v28, v29, v30);
        float32x4_t v54 = v31;
        *(double *)v34.i64 = C3DConvertFloatingTypeToFloat4(a1[6].u8[14], (float *)(a1[6].i64[0] + (a1[6].i32[2] * v17)), v31, v32, v33);
        float32x4_t v25 = v54;
        float32x4_t v23 = v56;
        float32x4_t v27 = v34;
      }
      float32x4_t v35 = vsubq_f32(v25, v23);
      float32x4_t v36 = vsubq_f32(v27, v23);
      float32x4_t v37 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v36, (int32x4_t)v36), (int8x16_t)v36, 0xCuLL), vnegq_f32(v35)), v36, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v35, (int32x4_t)v35), (int8x16_t)v35, 0xCuLL));
      float32x4_t v38 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v37, (int32x4_t)v37), (int8x16_t)v37, 0xCuLL);
      int32x4_t v39 = (int32x4_t)vmulq_f32(v37, v37);
      v39.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v39.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v39, 2), *(float32x2_t *)v39.i8)).u32[0];
      float32x2_t v40 = vrsqrte_f32((float32x2_t)v39.u32[0]);
      float32x4_t v42 = vmulq_n_f32(v38, vmul_f32(v40, vrsqrts_f32((float32x2_t)v39.u32[0], vmul_f32(v40, v40))).f32[0]);
      float32x4_t v41 = vmulq_f32(v23, v42);
      v42.f32[3] = -vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2), vaddq_f32(v41, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 1))).f32[0];
      float32x4_t v43 = a1[3];
      int8x16_t v44 = (int8x16_t)vmulq_f32(v42, v43);
      float v45 = vaddv_f32(vadd_f32(*(float32x2_t *)v44.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v44, v44, 8uLL)));
      if (a1[6].i8[15])
      {
        if (v45 >= 0.0) {
          return;
        }
      }
      else if (v45 == 0.0)
      {
        return;
      }
      float32x4_t v46 = a1[2];
      int8x16_t v47 = (int8x16_t)vmulq_f32(v42, v46);
      float v48 = (float)-vaddv_f32(vadd_f32(*(float32x2_t *)v47.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v47, v47, 8uLL))) / v45;
      if (v48 < 0.0 || v48 > a1[4].f32[3]) {
        break;
      }
      float v53 = v48;
      float32x4_t v55 = vmlaq_n_f32(v46, v43, v48);
      __n128 v57 = (__n128)v42;
      *(double *)v50.i64 = scn_triangle_barycentric_coordinates(v23, v25, v27, v55);
      v51.i64[0] = 0xBF000000BF000000;
      v51.i64[1] = 0xBF000000BF000000;
      float32x4_t v52 = vabsq_f32(vaddq_f32(v50, v51));
      a7.i64[0] = 0x3F0000003F000000;
      a7.i64[1] = 0x3F0000003F000000;
      a6 = vcgeq_f32(a7, v52);
      a6.i32[3] = a6.i32[2];
      a6.i32[0] = vminvq_u32((uint32x4_t)a6);
      if (a6.i32[0] < 0)
      {
        __AddLocalResult(a1[5].i64[1], a2, 0, v13 + 1, v13 + 2, v53, v55, v57);
        if ((*(_WORD *)(a1[5].i64[1] + 8) & 0x80) != 0)
        {
          *a5 = 1;
          *(unsigned char *)(*(void *)(a1[5].i64[0] + 8) + 24) = 1;
          return;
        }
      }
      ++v13;
      v14 += 4;
    }
    while (v8 != v13);
  }
}

@end