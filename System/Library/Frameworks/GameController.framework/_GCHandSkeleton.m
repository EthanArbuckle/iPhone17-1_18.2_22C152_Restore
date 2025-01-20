@interface _GCHandSkeleton
- (BOOL)fingerPositionsChangedForCurlAmts:(id *)a3;
- (BOOL)rightHand;
- (_GCHandSkeleton)initWithBoneData:(const void *)a3 profile:(void *)a4 handedness:(int64_t)a5;
- (float)getFingerCurlAmt:(id *)a3 boneType:(int64_t)a4;
- (void)_boneDataWithMotionRange:(void *)a3@<X8> curlAmts:;
- (void)_boneDataWithMotionRangeDq:(void *)a3@<X8> curlAmts:;
- (void)_convertToModelSpaceUsingDQs:(uint64_t)a1@<X2>;
- (void)_convertToModelSpaceUsingMatrices:(uint64_t)a1@<X2>;
- (void)_setInterpolationMethod:(int64_t)a3;
- (void)boneDataWithTransformSpace:(uint64_t)a3@<X3> motionRange:(void *)a4@<X8>;
- (void)boneDataWithTransformSpace:(uint64_t)a3@<X3> referencePose:(void *)a4@<X8>;
@end

@implementation _GCHandSkeleton

- (_GCHandSkeleton)initWithBoneData:(const void *)a3 profile:(void *)a4 handedness:(int64_t)a5
{
  id v8 = a4;
  v18.receiver = a1;
  v18.super_class = (Class)_GCHandSkeleton;
  v9 = [(_GCHandSkeleton *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_physicalInput, v8);
    memcpy(&v10->_boneData, a3, 0x3E0uLL);
    uint64_t v11 = 0;
    v10->_handedness = a5;
    v12 = (const $8EF4127CF77ECA3DDB612FCF233DC3A8 **)&kRightSkeletons;
    if (a5 == 1) {
      v12 = (const $8EF4127CF77ECA3DDB612FCF233DC3A8 **)&kLeftSkeletons;
    }
    v10->referenceSkeletons = v12;
    v10->_interpolationMethod = 1;
    v13 = v10;
    do
    {
      for (uint64_t i = 0; i != 992; i += 32)
      {
        v15 = (float32x4_t *)((char *)v13 + i);
        v15[65] = dqMakeDualQuaternion(*(float32x4_t *)((char *)v10->referenceSkeletons[v11] + i + 16));
        v15[66] = v16;
      }
      ++v11;
      v13 = (_GCHandSkeleton *)((char *)v13 + 992);
    }
    while (v11 != 4);
  }

  return v10;
}

- (BOOL)rightHand
{
  return self->_handedness == 2;
}

- (void)boneDataWithTransformSpace:(uint64_t)a3@<X3> motionRange:(void *)a4@<X8>
{
  uint64_t v20 = a1 + 32;
  memcpy(a4, (const void *)(a1 + 32), 0x3E0uLL);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  v5 = [WeakRetained objectForKeyedSubscript:@"XRPropertyButtonFingerThumb"];
  [v5 value];
  v26[0] = v6;
  id v7 = objc_loadWeakRetained((id *)(a1 + 8));
  id v8 = [v7 objectForKeyedSubscript:@"XRPropertyButtonFingerIndex"];
  [v8 value];
  v26[1] = v9;
  id v10 = objc_loadWeakRetained((id *)(a1 + 8));
  uint64_t v11 = [v10 objectForKeyedSubscript:@"XRPropertyButtonFingerMiddle"];
  [v11 value];
  v26[2] = v12;
  id v13 = objc_loadWeakRetained((id *)(a1 + 8));
  v14 = [v13 objectForKeyedSubscript:@"XRPropertyButtonFingerRing"];
  [v14 value];
  v26[3] = v15;
  id v16 = objc_loadWeakRetained((id *)(a1 + 8));
  v17 = [v16 objectForKeyedSubscript:@"XRPropertyButtonFingerLittle"];
  [v17 value];
  v26[4] = v18;

  result = (void *)[(id)a1 fingerPositionsChangedForCurlAmts:v26];
  if (result)
  {
    if (*(void *)(a1 + 5008)) {
      [(id)a1 _boneDataWithMotionRangeDq:a3 curlAmts:v26];
    }
    else {
      [(id)a1 _boneDataWithMotionRange:a3 curlAmts:v26];
    }
    result = memcpy(a4, __src, 0x3E0uLL);
  }
  if (!a2)
  {
    [(id)a1 _convertToModelSpaceUsingDQs:v20];
    return memcpy(a4, __src, 0x3E0uLL);
  }
  return result;
}

- (BOOL)fingerPositionsChangedForCurlAmts:(id *)a3
{
  if (a3->var0 == self->_lastFingerPositions[0]
    && a3->var1 == self->_lastFingerPositions[1]
    && a3->var2 == self->_lastFingerPositions[2]
    && a3->var3 == self->_lastFingerPositions[3]
    && a3->var4 == self->_lastFingerPositions[4])
  {
    return 0;
  }
  *($599F175E452E455E49EC8439362DB023 *)self->_lastFingerPositions = *a3;
  return 1;
}

- (float)getFingerCurlAmt:(id *)a3 boneType:(int64_t)a4
{
  switch(a4)
  {
    case 1:
      goto LABEL_7;
    case 2:
      a3 = (const $599F175E452E455E49EC8439362DB023 *)((char *)a3 + 4);
      goto LABEL_7;
    case 3:
      a3 = (const $599F175E452E455E49EC8439362DB023 *)((char *)a3 + 8);
      goto LABEL_7;
    case 4:
      a3 = (const $599F175E452E455E49EC8439362DB023 *)((char *)a3 + 12);
      goto LABEL_7;
    case 5:
      a3 = (const $599F175E452E455E49EC8439362DB023 *)((char *)a3 + 16);
LABEL_7:
      float result = a3->var0;
      break;
    default:
      float result = 0.0;
      break;
  }
  return result;
}

- (void)_boneDataWithMotionRange:(void *)a3@<X8> curlAmts:
{
  memcpy(a3, a1 + 4, 0x3E0uLL);
  uint64_t v5 = 0x1FFFFFFFFFFFFF84;
  int v6 = &kBoneTypes;
  long long v44 = xmmword_220A91FE0;
  do
  {
    uint64_t v7 = *v6++;
    id v8 = (void *)a1[128];
    int v9 = (float32x4_t *)(*v8 + v5 * 8);
    id v10 = v9 + 63;
    uint64_t v11 = v8[2];
    objc_msgSend(a1, "getFingerCurlAmt:boneType:", a2, v7, v44);
    if (v12 <= 0.0)
    {
      v43 = (float32x4_t *)&a1[v5];
      v43[64] = v9[62];
      v43[65] = *v10;
    }
    else
    {
      float v13 = v12;
      *(float32x4_t *)&a1[v5 + 128] = vmlaq_n_f32(v9[62], vsubq_f32(*(float32x4_t *)(v11 + v5 * 8 + 992), v9[62]), v12);
      float32x4_t v14 = *(float32x4_t *)(v11 + v5 * 8 + 1008);
      float32x4_t v15 = vmulq_f32(*v10, v14);
      float32x4_t v16 = (float32x4_t)vextq_s8((int8x16_t)v15, (int8x16_t)v15, 8uLL);
      *(float32x2_t *)v15.f32 = vadd_f32(*(float32x2_t *)v15.f32, *(float32x2_t *)v16.f32);
      v15.f32[0] = vaddv_f32(*(float32x2_t *)v15.f32);
      v16.i64[0] = 0;
      float32x4_t v17 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v15, v16)), 0), (int8x16_t)vnegq_f32(v14), (int8x16_t)v14);
      float v18 = 1.0;
      float32x4_t v19 = vsubq_f32(*v10, v17);
      int8x16_t v20 = (int8x16_t)vmulq_f32(v19, v19);
      float32x4_t v47 = v17;
      float32x4_t v48 = *v10;
      float32x4_t v21 = vaddq_f32(*v10, v17);
      int8x16_t v22 = (int8x16_t)vmulq_f32(v21, v21);
      float v49 = v13;
      float v23 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v20.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v20, v20, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v22.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v22, v22, 8uLL)))));
      float v24 = v23 + v23;
      float v25 = 1.0;
      if ((float)(v23 + v23) != 0.0) {
        float v25 = sinf(v23 + v23) / v24;
      }
      float v26 = (float)(1.0 - v49) * v24;
      float v27 = v49;
      if (v26 != 0.0)
      {
        float v45 = v25;
        float v28 = sinf((float)(1.0 - v49) * v24);
        float v25 = v45;
        float v27 = v49;
        float v18 = v28 / v26;
      }
      float v29 = v27 * v24;
      float v30 = 1.0;
      if (v29 != 0.0)
      {
        float v46 = v25;
        float v31 = sinf(v29);
        float v25 = v46;
        float v27 = v49;
        float v30 = v31 / v29;
      }
      float v32 = v25;
      float32x2_t v33 = vrecpe_f32((float32x2_t)LODWORD(v25));
      float32x2_t v34 = vmul_f32(v33, vrecps_f32((float32x2_t)LODWORD(v32), v33));
      float v35 = vmul_f32(v34, vrecps_f32((float32x2_t)LODWORD(v32), v34)).f32[0];
      v34.f32[0] = (float)(1.0 - v49) * (float)(v35 * v18);
      float32x4_t v36 = vmlaq_f32(vmulq_n_f32(v47, v27 * (float)(v35 * v30)), v48, (float32x4_t)vdupq_lane_s32((int32x2_t)v34, 0));
      int8x16_t v37 = (int8x16_t)vmulq_f32(v36, v36);
      float32x2_t v38 = vadd_f32(*(float32x2_t *)v37.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v37, v37, 8uLL));
      float32x4_t v39 = (float32x4_t)v44;
      if (vaddv_f32(v38) != 0.0)
      {
        unsigned __int32 v40 = vadd_f32(v38, (float32x2_t)vdup_lane_s32((int32x2_t)v38, 1)).u32[0];
        float32x2_t v41 = vrsqrte_f32((float32x2_t)v40);
        float32x2_t v42 = vmul_f32(v41, vrsqrts_f32((float32x2_t)v40, vmul_f32(v41, v41)));
        float32x4_t v39 = vmulq_n_f32(v36, vmul_f32(v42, vrsqrts_f32((float32x2_t)v40, vmul_f32(v42, v42))).f32[0]);
      }
      *(float32x4_t *)&a1[v5 + 130] = v39;
    }
    v5 += 4;
  }
  while (v5 * 8);
}

- (void)_boneDataWithMotionRangeDq:(void *)a3@<X8> curlAmts:
{
  memcpy(a3, (const void *)(a1 + 32), 0x3E0uLL);
  uint64_t v5 = 0;
  int v6 = &kBoneTypes;
  do
  {
    uint64_t v7 = *v6++;
    objc_msgSend((id)a1, "getFingerCurlAmt:boneType:", a2, v7, *(_OWORD *)&v19, *(_OWORD *)&v20);
    if (v8 <= 0.0)
    {
      uint64_t v16 = a1 + v5;
      *(_OWORD *)(v16 + 32) = *(_OWORD *)(**(void **)(a1 + 1024) + v5);
      *(_OWORD *)(v16 + 48) = *(_OWORD *)(**(void **)(a1 + 1024) + v5 + 16);
    }
    else
    {
      float v9 = v8;
      dqIdentity();
      float32x4_t v10 = *(float32x4_t *)(a1 + v5 + 1040);
      float32x4_t v11 = *(float32x4_t *)(a1 + v5 + 1056);
      float32x4_t v12 = *(float32x4_t *)(a1 + v5 + 3024);
      float32x4_t v13 = *(float32x4_t *)(a1 + v5 + 3040);
      if (*(void *)(a1 + 5008) == 1) {
        *(double *)v14.i64 = dqDLB(v10, *(double *)v11.i64, v12, *(double *)v13.i64, v9);
      }
      else {
        dqScLERP(v10, v11, v12, v13, v9);
      }
      __n128 v19 = (__n128)v15;
      __n128 v20 = (__n128)v14;
      *(double *)&long long v17 = dqGetTranslation(v14, v15);
      *(_OWORD *)(a1 + v5 + 32) = v17;
      *(double *)&long long v18 = dqGetRotation(v20, v19);
      *(_OWORD *)(a1 + v5 + 48) = v18;
    }
    v5 += 32;
  }
  while (v5 != 992);
}

- (void)boneDataWithTransformSpace:(uint64_t)a3@<X3> referencePose:(void *)a4@<X8>
{
  bzero(a4, 0x3E0uLL);
  switch(a3)
  {
    case 0:
    case 1:
      float v8 = (const void **)(*(void *)(a1 + 1024) + 8 * (a2 == 0));
      break;
    case 2:
    case 3:
      uint64_t v9 = *(void *)(a1 + 1024);
      float32x4_t v10 = (const void **)(v9 + 16);
      float v8 = (const void **)(v9 + 24);
      if (a2) {
        float v8 = v10;
      }
      break;
    default:
      -[_GCHandSkeleton boneDataWithTransformSpace:referencePose:]();
  }
  float32x4_t v11 = *v8;

  return memcpy(a4, v11, 0x3E0uLL);
}

- (void)_convertToModelSpaceUsingMatrices:(uint64_t)a1@<X2>
{
  uint64_t v2 = 0;
  a2[30] = 0u;
  a2[31] = 0u;
  a2[28] = 0u;
  a2[29] = 0u;
  a2[26] = 0u;
  a2[27] = 0u;
  a2[24] = 0u;
  a2[25] = 0u;
  a2[22] = 0u;
  a2[23] = 0u;
  a2[20] = 0u;
  a2[21] = 0u;
  a2[18] = 0u;
  a2[19] = 0u;
  a2[16] = 0u;
  a2[17] = 0u;
  a2[14] = 0u;
  a2[15] = 0u;
  a2[12] = 0u;
  a2[13] = 0u;
  a2[10] = 0u;
  a2[11] = 0u;
  a2[8] = 0u;
  a2[9] = 0u;
  a2[6] = 0u;
  a2[7] = 0u;
  a2[4] = 0u;
  a2[5] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  __asm { FMOV            V3.2S, #0.25 }
  *a2 = 0u;
  a2[1] = 0u;
  do
  {
    if (v2)
    {
      uint64_t v7 = 0;
      float v8 = (float *)(a1 + 32 * v2);
      float v10 = v8[6];
      float v9 = v8[7];
      float v12 = v8[4];
      float v11 = v8[5];
      long long v13 = *(_OWORD *)v8;
      HIDWORD(v14) = 0;
      *(float *)&long long v14 = (float)((float)((float)(v12 * v12) - (float)(v11 * v11)) - (float)(v10 * v10)) + (float)(v9 * v9);
      *((float *)&v14 + 1) = (float)((float)(v9 * v10) + (float)(v12 * v11))
                           + (float)((float)(v9 * v10) + (float)(v12 * v11));
      *((float *)&v14 + 2) = (float)-(float)((float)(v9 * v11) - (float)(v12 * v10))
                           - (float)((float)(v9 * v11) - (float)(v12 * v10));
      HIDWORD(v15) = 0;
      *(float *)&long long v15 = (float)-(float)((float)(v9 * v10) - (float)(v12 * v11))
                     - (float)((float)(v9 * v10) - (float)(v12 * v11));
      *((float *)&v15 + 1) = (float)((float)((float)(v11 * v11) - (float)(v10 * v10)) + (float)(v9 * v9))
                           - (float)(v12 * v12);
      *((float *)&v15 + 2) = (float)((float)(v9 * v12) + (float)(v11 * v10))
                           + (float)((float)(v9 * v12) + (float)(v11 * v10));
      float v16 = (float)(v9 * v11) + (float)(v10 * v12);
      float v17 = -(float)((float)(v9 * v12) - (float)(v11 * v10));
      float v18 = (float)(v9 * v9) + (float)(v10 * v10);
      __n128 v19 = (float32x4_t *)&v68[4 * (uint64_t)parentIndices[v2]];
      float32x4_t v20 = *v19;
      float32x4_t v21 = v19[1];
      float32x4_t v22 = v19[2];
      float32x4_t v23 = v19[3];
      *(float *)&unsigned int v24 = (float)(v18 - (float)(v12 * v12)) - (float)(v11 * v11);
      *(float *)&long long v25 = v16 + v16;
      *((float *)&v25 + 1) = v17 + v17;
      *((void *)&v25 + 1) = v24;
      HIDWORD(v13) = 1.0;
      v63[0] = v14;
      v63[1] = v15;
      v63[2] = v25;
      v63[3] = v13;
      int32x4_t v64 = 0uLL;
      int32x4_t v65 = 0uLL;
      simd_float4 v66 = 0uLL;
      simd_float4 v67 = 0uLL;
      do
      {
        *(float32x4_t *)((char *)&v64 + v7 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v20, COERCE_FLOAT(v63[v7])), v21, *(float32x2_t *)&v63[v7], 1), v22, (float32x4_t)v63[v7], 2), v23, (float32x4_t)v63[v7], 3);
        ++v7;
      }
      while (v7 != 4);
      float v26 = (int32x4_t *)&v68[4 * v2];
      int32x4_t v27 = v64;
      int32x4_t v28 = v65;
      simd_float4 v29 = v66;
      simd_float4 v30 = v67;
      *float v26 = v64;
      v26[1] = v28;
      v26[2] = (int32x4_t)v29;
      v26[3] = (int32x4_t)v30;
    }
    else
    {
      int32x4_t v28 = (int32x4_t)matrix_identity_float4x4.columns[1];
      v68[0] = matrix_identity_float4x4.columns[0];
      v68[1] = v28;
      simd_float4 v31 = matrix_identity_float4x4.columns[3];
      simd_float4 v69 = matrix_identity_float4x4.columns[2];
      simd_float4 v70 = v31;
      int32x4_t v27 = (int32x4_t)v68[0];
      simd_float4 v29 = v69;
      simd_float4 v30 = v70;
    }
    float v32 = (simd_float4 *)&a2[2 * v2];
    *float v32 = v30;
    f32 = (_OWORD *)v32[1].f32;
    float v34 = v29.f32[2] + (float)(*(float *)v27.i32 + *(float *)&v28.i32[1]);
    if (v34 >= 0.0)
    {
      float v42 = sqrtf(v34 + 1.0);
      float32_t v43 = v42 + v42;
      float32x2_t v44 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v42 + v42));
      float32x2_t v45 = vmul_f32(v44, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v42 + v42), v44));
      v45.i32[0] = vmul_f32(v45, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v42 + v42), v45)).u32[0];
      *(float32x2_t *)&long long v53 = vmul_n_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v28, (int8x16_t)v28, 8uLL), *(int32x2_t *)v29.f32), (float32x2_t)vext_s8(*(int8x8_t *)v29.f32, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)v27, (int8x16_t)v27, 8uLL), 4uLL)), v45.f32[0]);
      v46.i32[0] = vsub_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)v27.i8, 1), *(float32x2_t *)v28.i8).u32[0];
      v46.f32[1] = v43;
      v45.i32[1] = 0.25;
      float32x2_t v55 = vmul_f32(v46, v45);
    }
    else if (*(float *)v27.i32 < *(float *)&v28.i32[1] || *(float *)v27.i32 < v29.f32[2])
    {
      float v36 = 1.0 - *(float *)v27.i32;
      if (*(float *)&v28.i32[1] >= v29.f32[2])
      {
        float v56 = sqrtf(*(float *)&v28.i32[1] + (float)(v36 - v29.f32[2]));
        *(float *)&unsigned int v57 = v56 + v56;
        float32x2_t v58 = vrecpe_f32((float32x2_t)v57);
        float32x2_t v59 = vmul_f32(v58, vrecps_f32((float32x2_t)v57, v58));
        v60.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)v27.i8, 1), *(float32x2_t *)v28.i8).u32[0];
        v60.i32[1] = v57;
        float32x2_t v61 = (float32x2_t)vrev64_s32(*(int32x2_t *)v29.f32);
        v62.i32[0] = vadd_f32(v61, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v28, (int8x16_t)v28, 8uLL)).u32[0];
        v62.i32[1] = vsub_f32(v61, (float32x2_t)vdup_laneq_s32(v27, 2)).i32[1];
        v61.i32[0] = vmul_f32(v59, vrecps_f32((float32x2_t)v57, v59)).u32[0];
        float32x2_t v55 = vmul_n_f32(v62, v61.f32[0]);
        v61.i32[1] = 0.25;
        *(float32x2_t *)&long long v53 = vmul_f32(v60, v61);
      }
      else
      {
        *(float32x2_t *)v29.f32 = vadd_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v27, (int8x16_t)v27, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v28, (int8x16_t)v28, 8uLL)), *(float32x2_t *)v29.f32);
        float32x2_t v37 = (float32x2_t)__PAIR64__(v27.u32[1], COERCE_UNSIGNED_INT(sqrtf(v29.f32[2] + (float)(v36 - *(float *)&v28.i32[1]))));
        float32x2_t v38 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v28.i8, 0);
        float32x2_t v39 = vsub_f32(*(float32x2_t *)v27.i8, v38);
        v38.i32[0] = 2.0;
        v38.i32[0] = vmul_f32(v37, v38).u32[0];
        v38.i32[1] = v39.i32[1];
        float32x2_t v40 = vrecpe_f32((float32x2_t)v38.u32[0]);
        float32x2_t v41 = vmul_f32(v40, vrecps_f32((float32x2_t)v38.u32[0], v40));
        v39.i32[0] = vmul_f32(v41, vrecps_f32((float32x2_t)v38.u32[0], v41)).u32[0];
        *(float32x2_t *)&long long v53 = vmul_n_f32(*(float32x2_t *)v29.f32, v39.f32[0]);
        float32x2_t v55 = vmul_f32(v38, (float32x2_t)__PAIR64__(v39.u32[0], _D3));
      }
    }
    else
    {
      float32x2_t v47 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v28.i8, 0);
      float32x2_t v48 = vadd_f32(*(float32x2_t *)v27.i8, v47);
      v47.i32[0] = 2.0;
      v47.i32[0] = vmul_f32((float32x2_t)__PAIR64__(v27.u32[1], COERCE_UNSIGNED_INT(sqrtf(*(float *)v27.i32 + (float)((float)(1.0- *(float *)&v28.i32[1])- v29.f32[2])))), v47).u32[0];
      v47.i32[1] = v48.i32[1];
      float32x2_t v49 = vrecpe_f32((float32x2_t)v47.u32[0]);
      float32x2_t v50 = vmul_f32(v49, vrecps_f32((float32x2_t)v47.u32[0], v49));
      LODWORD(v51) = vmul_f32(v50, vrecps_f32((float32x2_t)v47.u32[0], v50)).u32[0];
      __asm { FMOV            V18.2S, #0.25 }
      _D18.f32[1] = v51;
      *(float32x2_t *)&long long v53 = vmul_f32(v47, _D18);
      v54.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v27, (int8x16_t)v27, 8uLL), *(float32x2_t *)v29.f32).u32[0];
      v54.i32[1] = vsub_f32((float32x2_t)vdup_laneq_s32(v28, 2), *(float32x2_t *)&v29).i32[1];
      float32x2_t v55 = vmul_n_f32(v54, v51);
    }
    *((float32x2_t *)&v53 + 1) = v55;
    _OWORD *f32 = v53;
    ++v2;
  }
  while (v2 != 31);
}

- (void)_convertToModelSpaceUsingDQs:(uint64_t)a1@<X2>
{
  uint64_t v4 = 0;
  a2[30] = 0u;
  a2[31] = 0u;
  a2[28] = 0u;
  a2[29] = 0u;
  a2[26] = 0u;
  a2[27] = 0u;
  a2[24] = 0u;
  a2[25] = 0u;
  a2[22] = 0u;
  a2[23] = 0u;
  a2[20] = 0u;
  a2[21] = 0u;
  a2[18] = 0u;
  a2[19] = 0u;
  a2[16] = 0u;
  a2[17] = 0u;
  a2[14] = 0u;
  a2[15] = 0u;
  a2[12] = 0u;
  a2[13] = 0u;
  a2[10] = 0u;
  a2[11] = 0u;
  a2[8] = 0u;
  a2[9] = 0u;
  a2[6] = 0u;
  a2[7] = 0u;
  a2[4] = 0u;
  a2[5] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  uint64_t v5 = parentIndices;
  *a2 = 0u;
  a2[1] = 0u;
  do
  {
    uint64_t v7 = *v5++;
    uint64_t v6 = v7;
    float32x4_t DualQuaternion = dqMakeDualQuaternion(*(float32x4_t *)(a1 + v4 * 16 + 16));
    if (v4 * 16)
    {
      float v10 = (float32x4_t *)&v17[v4];
      *(double *)v11.i64 = dqMul(DualQuaternion, v9, (float32x4_t)v17[2 * v6]);
      float32x4_t *v10 = v11;
      v10[1] = v12;
    }
    else
    {
      *(double *)v11.i64 = dqIdentity();
      v17[0] = v11;
      v17[1] = v12;
    }
    __n128 v15 = (__n128)v12;
    __n128 v16 = (__n128)v11;
    *(double *)&long long v13 = dqGetTranslation(v11, v12);
    a2[v4] = v13;
    *(double *)&long long v14 = dqGetRotation(v16, v15);
    a2[v4 + 1] = v14;
    v4 += 2;
  }
  while (v4 != 62);
}

- (void)_setInterpolationMethod:(int64_t)a3
{
  self->_interpolationMethod = a3;
}

- (void).cxx_destruct
{
}

- (void)boneDataWithTransformSpace:referencePose:.cold.1()
{
}

@end