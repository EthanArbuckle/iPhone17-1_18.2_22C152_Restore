void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_2(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void AVTCoordinatorLoadPoseAtPath(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a3;
  id v6 = a2;
  id v7 = a1;
  v8 = [v6 lastPathComponent];
  uint64_t v9 = [v8 stringByDeletingPathExtension];

  uint64_t v10 = NSURL;
  v11 = [v7 stringByAppendingPathComponent:v6];

  v12 = [v10 fileURLWithPath:v11 isDirectory:0];

  v13 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v12 error:0];
  v14 = [[AVTAvatarPose alloc] initWithDictionaryRepresentation:v13];
  [(AVTAvatarPose *)v14 setBakedAnimationBlendFactor:1.0];
  if (v14)
  {
    if (v9) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  v15 = avt_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    AVTCoordinatorLoadPoseAtPath_cold_2(v15, v16, v17, v18, v19, v20, v21, v22);
  }

  if (!v9)
  {
LABEL_7:
    v23 = avt_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      AVTCoordinatorLoadPoseAtPath_cold_1(v23, v24, v25, v26, v27, v28, v29, v30);
    }
  }
LABEL_10:
  v5[2](v5, v14, v9);
}

void AVTCoordinatorLoadPosesAtPaths(void *a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  v31 = a3;
  uint64_t v7 = [v6 count];
  v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v7];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v7];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v36 + 1) + 8 * v13);
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __AVTCoordinatorLoadPosesAtPaths_block_invoke;
        v33[3] = &unk_26401F210;
        id v34 = v8;
        id v35 = v9;
        AVTCoordinatorLoadPoseAtPath(v5, v14, v33);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v11);
  }

  if (![v8 count])
  {
    v15 = avt_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      AVTCoordinatorLoadPosesAtPaths_cold_2(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  if (![v9 count])
  {
    v23 = avt_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      AVTCoordinatorLoadPosesAtPaths_cold_1(v23, v24, v25, v26, v27, v28, v29, v30);
    }
  }
  v31[2](v31, v8, v9);
}

void __AVTCoordinatorLoadPosesAtPaths_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 addObject:a2];
  [*(id *)(a1 + 40) addObject:v6];
}

void AVTCoordinatorLoadPoseAnimationsAtPaths(void *a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v38 = a1;
  id v5 = a2;
  long long v36 = a3;
  uint64_t v6 = [v5 count];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v6];
  v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v6];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v14 = [v13 lastPathComponent];
        v15 = [v14 stringByDeletingPathExtension];

        uint64_t v16 = NSURL;
        uint64_t v17 = [v38 stringByAppendingPathComponent:v13];
        uint64_t v18 = [v16 fileURLWithPath:v17 isDirectory:0];

        uint64_t v19 = [[AVTAvatarPoseAnimation alloc] initWithAnimatedPoseRepresentationAtURL:v18];
        [v7 addObject:v19];
        [v8 addObject:v15];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v10);
  }

  if (![v7 count])
  {
    uint64_t v20 = avt_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      AVTCoordinatorLoadPoseAnimationsAtPaths_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
  if (![v8 count])
  {
    uint64_t v28 = avt_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      AVTCoordinatorLoadPosesAtPaths_cold_1(v28, v29, v30, v31, v32, v33, v34, v35);
    }
  }
  v36[2](v36, v7, v8);
}

void sub_20B81DF7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

void sub_20B8207C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
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

void sub_20B820D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_20B822798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20B823E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
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

void sub_20B824B58(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t AVTIsRunningInAppExtensionOrViewService()
{
  if (_UIApplicationIsExtension()) {
    return 1;
  }
  uint64_t v1 = [MEMORY[0x263F1CBC8] _applicationKeyWindow];
  uint64_t v2 = [v1 _isHostedInAnotherProcess];

  return v2;
}

void sub_20B826698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_20B826BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void AVTTrackingDataFromARFrame(uint64_t a1, void *a2, unint64_t a3, void *a4, uint64_t a5, uint64_t a6, int a7, int a8, float *a9)
{
  id v16 = a2;
  id v17 = a4;
  [v17 transform];
  __n128 v22 = _convertARFaceAnchorTransformToSceneKitTransform(a5, a6, a7, v16, a3, v18, v19, v20, v21);
  long long v66 = v23;
  float32x4_t v68 = (float32x4_t)v22;
  long long v62 = v25;
  long long v64 = v24;
  if (a9) {
    *a9 = fabsf(atan2f(-v22.n128_f32[1], v22.n128_f32[0]));
  }
  objc_msgSend(v16, "timestamp", v62, v64, v66);
  *(void *)a1 = v26;
  int32x4_t v27 = (int32x4_t)vmulq_f32(v68, v68);
  v27.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v27, 2), vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.i8, 1))).u32[0];
  *(_OWORD *)(a1 + 16) = v63;
  float32x2_t v28 = vrsqrte_f32((float32x2_t)v27.u32[0]);
  float32x2_t v29 = vmul_f32(v28, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v28, v28)));
  float32x4_t v30 = vmulq_n_f32(v68, vmul_f32(v29, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v29, v29))).f32[0]);
  int32x4_t v31 = (int32x4_t)vmulq_f32(v65, v65);
  v31.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v31, 2), vadd_f32(*(float32x2_t *)v31.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v31.i8, 1))).u32[0];
  float32x2_t v32 = vrsqrte_f32((float32x2_t)v31.u32[0]);
  float32x2_t v33 = vmul_f32(v32, vrsqrts_f32((float32x2_t)v31.u32[0], vmul_f32(v32, v32)));
  float32x4_t v34 = vmulq_n_f32(v65, vmul_f32(v33, vrsqrts_f32((float32x2_t)v31.u32[0], vmul_f32(v33, v33))).f32[0]);
  int32x4_t v35 = (int32x4_t)vmulq_f32(v67, v67);
  v35.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v35, 2), vadd_f32(*(float32x2_t *)v35.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v35.i8, 1))).u32[0];
  float32x2_t v36 = vrsqrte_f32((float32x2_t)v35.u32[0]);
  float32x2_t v37 = vmul_f32(v36, vrsqrts_f32((float32x2_t)v35.u32[0], vmul_f32(v36, v36)));
  float32x4_t v38 = vmulq_n_f32(v67, vmul_f32(v37, vrsqrts_f32((float32x2_t)v35.u32[0], vmul_f32(v37, v37))).f32[0]);
  float v39 = (float)(v30.f32[0] + v34.f32[1]) + v38.f32[2];
  if (v39 <= 0.0)
  {
    if (v30.f32[0] <= v34.f32[1] || v30.f32[0] <= v38.f32[2])
    {
      if (v34.f32[1] <= v38.f32[2])
      {
        v49.i64[0] = v38.i64[0];
        v49.f32[2] = (float)(v38.f32[2] + 1.0) - v30.f32[0];
        v49.i32[3] = v30.i32[1];
        float32x4_t v42 = (float32x4_t)vrev64q_s32((int32x4_t)vextq_s8((int8x16_t)vtrn1q_s32((int32x4_t)v34, (int32x4_t)v30), (int8x16_t)v34, 8uLL));
        v41.i64[0] = vaddq_f32(v38, v42).u64[0];
        v41.i64[1] = vsubq_f32(v49, v42).i64[1];
        v42.i32[0] = v41.i32[2];
      }
      else
      {
        float32x4_t v44 = v34;
        v44.f32[1] = (float)(v34.f32[1] + 1.0) - v30.f32[0];
        v44.i32[3] = v38.i32[0];
        float32x4_t v45 = (float32x4_t)vzip2q_s32(vzip1q_s32((int32x4_t)v30, (int32x4_t)v38), vtrn1q_s32((int32x4_t)v38, (int32x4_t)v30));
        int32x4_t v46 = (int32x4_t)vaddq_f32(v34, v45);
        float32x4_t v42 = vsubq_f32(v44, v45);
        float32x4_t v41 = (float32x4_t)vtrn2q_s32(vrev64q_s32(v46), (int32x4_t)v42);
        v42.i32[0] = v42.i32[1];
      }
    }
    else
    {
      float32_t v47 = (float)(v30.f32[0] + 1.0) - v34.f32[1];
      float32x4_t v48 = (float32x4_t)vextq_s8((int8x16_t)v34, (int8x16_t)vtrn1q_s32((int32x4_t)v34, (int32x4_t)v38), 0xCuLL);
      float32x4_t v41 = vaddq_f32(v48, v30);
      v48.f32[0] = v47;
      v30.i32[0] = v38.i32[2];
      v30.i32[3] = v38.i32[1];
      float32x4_t v42 = vsubq_f32(v48, v30);
      v41.i32[0] = v42.i32[0];
      v41.i32[3] = v42.i32[3];
    }
  }
  else
  {
    float32x4_t v40 = (float32x4_t)vzip2q_s32((int32x4_t)v34, vuzp1q_s32((int32x4_t)v34, (int32x4_t)v38));
    v40.i32[2] = v30.i32[1];
    float32x4_t v42 = (float32x4_t)vtrn2q_s32((int32x4_t)v38, vzip2q_s32((int32x4_t)v38, (int32x4_t)v30));
    v42.i32[2] = v34.i32[0];
    float32x4_t v41 = vsubq_f32(v40, v42);
    v42.i32[3] = 1.0;
    v40.f32[3] = v39;
    v41.i32[3] = vaddq_f32(v40, v42).i32[3];
    v42.i32[0] = v41.i32[3];
  }
  uint64_t v50 = 0;
  *(float32x4_t *)(a1 + 32) = vmulq_n_f32(v41, 0.5 / sqrtf(v42.f32[0]));
  *(unsigned char *)(a1 + 48) = a7 ^ 1;
  do
  {
    v51 = AVTBlendShapeLocationFromARIndex(v50);
    objc_msgSend(v17, "_avt_rawBlendShapeAtLocation:", v51);
    *(_DWORD *)(a1 + 4 * v50 + 256) = v52;

    ++v50;
  }
  while (v50 != 51);
  v53 = AVTBlendShapeLocationFromARIndex(51);
  objc_msgSend(v17, "_avt_rawBlendShapeAtLocation:", v53);
  *(_DWORD *)(a1 + 464) = v54;

  if (a8)
  {
    long long v55 = *(_OWORD *)(a1 + 384);
    *(_OWORD *)(a1 + 196) = *(_OWORD *)(a1 + 400);
    long long v56 = *(_OWORD *)(a1 + 432);
    *(_OWORD *)(a1 + 212) = *(_OWORD *)(a1 + 416);
    *(_OWORD *)(a1 + 228) = v56;
    long long v57 = *(_OWORD *)(a1 + 320);
    *(_OWORD *)(a1 + 132) = *(_OWORD *)(a1 + 336);
    long long v58 = *(_OWORD *)(a1 + 368);
    *(_OWORD *)(a1 + 148) = *(_OWORD *)(a1 + 352);
    *(_OWORD *)(a1 + 164) = v58;
    *(_OWORD *)(a1 + 180) = v55;
    long long v59 = *(_OWORD *)(a1 + 256);
    *(_OWORD *)(a1 + 68) = *(_OWORD *)(a1 + 272);
    long long v60 = *(_OWORD *)(a1 + 304);
    *(_OWORD *)(a1 + 84) = *(_OWORD *)(a1 + 288);
    *(_OWORD *)(a1 + 100) = v60;
    *(_OWORD *)(a1 + 116) = v57;
    *(_OWORD *)(a1 + 52) = v59;
    *(_OWORD *)(a1 + 240) = *(_OWORD *)(a1 + 444);
    *(_DWORD *)(a1 + 460) = *(_DWORD *)(a1 + 464);
  }
  else
  {
    v61 = [v17 blendShapes];
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __AVTTrackingDataFromARFrame_block_invoke;
    v69[3] = &unk_26401F708;
    uint64_t v71 = a1;
    id v70 = v17;
    [v61 enumerateKeysAndObjectsUsingBlock:v69];
  }
}

__n128 _convertARFaceAnchorTransformToSceneKitTransform(uint64_t a1, uint64_t a2, int a3, void *a4, unint64_t a5, __n128 a6, __n128 a7, __n128 a8, __n128 a9)
{
  id v13 = a4;
  v14 = v13;
  if (a3)
  {
    v15 = [v13 camera];
    [v15 displayCenterTransform];
    __int32 v39 = v16;
    __int32 v41 = v17;
    float32x4_t v42 = v19;
    __int32 v45 = v18;

    unint64_t v20 = 0;
    float32x4_t v21 = (float32x4_t)xmmword_20B88FE60;
    v21.i32[3] = v39;
    float32x4_t v22 = (float32x4_t)xmmword_20B88FE70;
    v22.i32[3] = v41;
    float32x4_t v23 = (float32x4_t)xmmword_20B88FE80;
    v23.i32[3] = v45;
    float32x4_t v24 = vnegq_f32(v42);
    v24.i32[3] = v42.i32[3];
    __n128 v54 = a6;
    __n128 v55 = a7;
    __n128 v56 = a8;
    __n128 v57 = a9;
    __n128 v58 = 0u;
    __n128 v59 = 0u;
    __n128 v60 = 0u;
    float32x4_t v61 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v58 + v20) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(_OWORD *)((char *)&v54 + v20))), v22, (float32x2_t)v54.n128_u64[v20 / 8], 1), v23, *(float32x4_t *)((char *)&v54 + v20), 2), v24, *(float32x4_t *)((char *)&v54 + v20), 3);
      v20 += 16;
    }
    while (v20 != 64);
    a6 = v58;
    a7 = v59;
    a8 = v60;
    a9 = (__n128)v61;
  }
  __n128 v25 = AVTARKitTransformToSceneKitTransformMatrix(a5, a1, a2);
  unint64_t v29 = 0;
  __n128 v54 = a6;
  __n128 v55 = a7;
  __n128 v56 = a8;
  __n128 v57 = a9;
  __n128 v58 = 0u;
  __n128 v59 = 0u;
  __n128 v60 = 0u;
  float32x4_t v61 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v58 + v29) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v25, COERCE_FLOAT(*(_OWORD *)((char *)&v54 + v29))), v26, (float32x2_t)v54.n128_u64[v29 / 8], 1), v27, *(float32x4_t *)((char *)&v54 + v29), 2), v28, *(float32x4_t *)((char *)&v54 + v29), 3);
    v29 += 16;
  }
  while (v29 != 64);
  __n128 v51 = v59;
  __n128 v53 = v58;
  __n128 v49 = v60;
  if (a3)
  {
    AVTGetNeutralZ();
  }
  else
  {
    float32x4_t v30 = vmulq_f32(v61, (float32x4_t)vdupq_n_s32(0x42C80000u));
    v30.i32[3] = v61.i32[3];
    __n128 v47 = (__n128)v30;
    int32x4_t v31 = [v14 camera];
    [v31 transform];
    simd_float4 v43 = v33;
    simd_float4 v44 = v32;
    simd_float4 v38 = v35;
    simd_float4 v40 = v34;

    v62.columns[1] = v43;
    v62.columns[0] = v44;
    v62.columns[3] = v38;
    v62.columns[2] = v40;
    simd_float4x4 v63 = __invert_f4(v62);
    unint64_t v36 = 0;
    __n128 v54 = v53;
    __n128 v55 = v51;
    __n128 v56 = v49;
    __n128 v57 = v47;
    __n128 v58 = 0u;
    __n128 v59 = 0u;
    __n128 v60 = 0u;
    float32x4_t v61 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v58 + v36) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v63.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v54 + v36))), (float32x4_t)v63.columns[1], (float32x2_t)v54.n128_u64[v36 / 8], 1), (float32x4_t)v63.columns[2], *(float32x4_t *)((char *)&v54 + v36), 2), (float32x4_t)v63.columns[3], *(float32x4_t *)((char *)&v54 + v36), 3);
      v36 += 16;
    }
    while (v36 != 64);
    __n128 v53 = v58;
  }

  return v53;
}

void __AVTTrackingDataFromARFrame_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = AVTBlendShapeLocationToARIndex(v9);
  if (v6 > 50)
  {
    objc_msgSend(*(id *)(a1 + 32), "_avt_rawBlendShapeAtLocation:", v9);
    *(_DWORD *)(*(void *)(a1 + 40) + 4 * v6 + 256) = v8;
  }
  else
  {
    [v5 floatValue];
    *(_DWORD *)(*(void *)(a1 + 40) + 4 * v6 + 52) = v7;
  }
}

uint64_t ___slowestToFastestVideoFormatsForConfiguration_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "framesPerSecond"));
  int v7 = NSNumber;
  uint64_t v8 = [v5 framesPerSecond];

  id v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

void sub_20B82B934(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 120));
  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_20B82BCD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20B82C8A4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 120));
  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_20B82CC48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20B82D1E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B82D6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B82DB2C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 120));
  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_20B82DF90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20B82E278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVTPosterExpectsExtraTallContent(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 showsBody];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v3 name];
      uint64_t v5 = [v6 isEqualToString:@"giraffe"];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

void sub_20B832258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20B832894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

id AVTPlistDatabaseMemojiAssetWithIdentifier(void *a1)
{
  id v1 = a1;
  if (AVTPlistDatabaseMemojiAssetWithIdentifier::onceToken != -1) {
    dispatch_once(&AVTPlistDatabaseMemojiAssetWithIdentifier::onceToken, &__block_literal_global_3);
  }
  uint64_t v2 = [(id)AVTPlistDatabaseMemojiAssetWithIdentifier::kAVTPlistDatabase_assetByIdentifier objectForKeyedSubscript:v1];

  return v2;
}

void sub_20B8351BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __AVTPlistDatabaseMemojiAssetWithIdentifier_block_invoke()
{
  v0 = +[AVTResourceLocator sharedResourceLocator]();
  id v1 = +[AVTResourceLocator generatedPlistFolderName]();
  -[AVTResourceLocator pathForMemojiResource:ofType:inDirectory:isDirectory:](v0, @"assetByIdentifier", @"plist", (uint64_t)v1, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v2 = [NSDictionary dictionaryWithContentsOfFile:v4];
  id v3 = (void *)AVTPlistDatabaseMemojiAssetWithIdentifier::kAVTPlistDatabase_assetByIdentifier;
  AVTPlistDatabaseMemojiAssetWithIdentifier::kAVTPlistDatabase_assetByIdentifier = v2;
}

void sub_20B835284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id AVTPlistDatabaseMemojiAssetsForComponentType(unint64_t a1)
{
  if (AVTPlistDatabaseMemojiAssetsForComponentType::onceToken != -1) {
    dispatch_once(&AVTPlistDatabaseMemojiAssetsForComponentType::onceToken, &__block_literal_global_28);
  }
  uint64_t v2 = (void *)AVTPlistDatabaseMemojiAssetsForComponentType::kAVTPlistDatabase_assetIdentifiersByComponentType;
  id v3 = AVTComponentTypeToString(a1);
  id v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

void sub_20B835338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __AVTPlistDatabaseMemojiAssetsForComponentType_block_invoke()
{
  v0 = +[AVTResourceLocator sharedResourceLocator]();
  id v1 = +[AVTResourceLocator generatedPlistFolderName]();
  -[AVTResourceLocator pathForMemojiResource:ofType:inDirectory:isDirectory:](v0, @"assetIdentifiersByComponentType", @"plist", (uint64_t)v1, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v2 = [NSDictionary dictionaryWithContentsOfFile:v4];
  id v3 = (void *)AVTPlistDatabaseMemojiAssetsForComponentType::kAVTPlistDatabase_assetIdentifiersByComponentType;
  AVTPlistDatabaseMemojiAssetsForComponentType::kAVTPlistDatabase_assetIdentifiersByComponentType = v2;
}

void sub_20B835400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t AVTBlendShapeLocationToARIndex(void *a1)
{
  id v1 = a1;
  if (_initialiseBlendshapeMappingIfNeeded_onceToken != -1) {
    dispatch_once(&_initialiseBlendshapeMappingIfNeeded_onceToken, &__block_literal_global_4);
  }
  uint64_t v2 = [(id)kAVTBlendShapeLocationIndices objectForKeyedSubscript:v1];
  id v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 integerValue];
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

id AVTBlendShapeLocationFromARIndex(uint64_t a1)
{
  if (_initialiseBlendshapeMappingIfNeeded_onceToken != -1) {
    dispatch_once(&_initialiseBlendshapeMappingIfNeeded_onceToken, &__block_literal_global_4);
  }
  uint64_t v2 = (void *)kAVTBlendShapeLocationFromARIndex[a1];
  return v2;
}

BOOL AVTMorphTargetNameIsUsedForFaceAnimation(void *a1)
{
  uint64_t v1 = _initialiseBlendshapeMappingIfNeeded_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_initialiseBlendshapeMappingIfNeeded_onceToken, &__block_literal_global_4);
  }
  id v3 = [(id)kAVTBlendShapeLocationIndices objectForKeyedSubscript:v2];

  return v3 != 0;
}

uint64_t AVTMorphTargetNameIsUsedForDynamics(void *a1, const char *a2)
{
  return [a1 containsString:@"_DYN_"];
}

uint64_t AVTMorphTargetNameIsUsedForBindings(void *a1)
{
  id v1 = a1;
  if (([v1 containsString:@"__"] & 1) != 0
    || ([v1 containsString:@"_0_"] & 1) != 0
    || ([v1 hasSuffix:@"_backward"] & 1) != 0
    || ([v1 hasSuffix:@"_forward"] & 1) != 0
    || ([v1 hasSuffix:@"_rightward"] & 1) != 0
    || ([v1 hasSuffix:@"_leftward"] & 1) != 0
    || ([v1 hasSuffix:@"_downward"] & 1) != 0
    || ([v1 hasSuffix:@"_upward"] & 1) != 0)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"Emoji"] ^ 1;
  }

  return v2;
}

uint64_t AVTMorphTargetNameDefinesPose(void *a1)
{
  id v1 = a1;
  if (([v1 containsString:@"__"] & 1) != 0
    || ([v1 containsString:@"_0_"] & 1) != 0
    || ([v1 hasSuffix:@"_backward"] & 1) != 0
    || ([v1 hasSuffix:@"_forward"] & 1) != 0
    || ([v1 hasSuffix:@"_rightward"] & 1) != 0
    || ([v1 hasSuffix:@"_leftward"] & 1) != 0
    || ([v1 hasSuffix:@"_downward"] & 1) != 0
    || ([v1 hasSuffix:@"_upward"] & 1) != 0)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = [v1 hasPrefix:@"variant_"] ^ 1;
  }

  return v2;
}

uint64_t AVTMorphTargetNameIsOfInterestForAnimator(void *a1)
{
  id v1 = a1;
  if (([v1 containsString:@"_0_"] & 1) != 0
    || ([v1 hasSuffix:@"_backward"] & 1) != 0
    || ([v1 hasSuffix:@"_forward"] & 1) != 0
    || ([v1 hasSuffix:@"_rightward"] & 1) != 0
    || ([v1 hasSuffix:@"_leftward"] & 1) != 0
    || ([v1 hasSuffix:@"_downward"] & 1) != 0
    || ([v1 hasSuffix:@"_upward"] & 1) != 0)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"Emoji"] ^ 1;
  }

  return v2;
}

void ___initialiseBlendshapeMappingIfNeeded_block_invoke()
{
  v37[51] = *MEMORY[0x263EF8340];
  if (AVTFaceTrackingIsSupported_onceToken != -1) {
    dispatch_once(&AVTFaceTrackingIsSupported_onceToken, &__block_literal_global_62);
  }
  if (AVTFaceTrackingIsSupported_kAVTFaceTrackingIsSupported)
  {
    uint64_t v36 = 0;
    CVAFaceTrackingCopySemantics();
    v0 = [0 objectForKeyedSubscript:*MEMORY[0x263F26940]];
  }
  else
  {
    uint64_t v1 = *MEMORY[0x263EF8D78];
    v37[0] = *MEMORY[0x263EF8D70];
    v37[1] = v1;
    uint64_t v2 = *MEMORY[0x263EF8DC8];
    v37[2] = *MEMORY[0x263EF8DC0];
    v37[3] = v2;
    uint64_t v3 = *MEMORY[0x263EF8D88];
    v37[4] = *MEMORY[0x263EF8D80];
    v37[5] = v3;
    uint64_t v4 = *MEMORY[0x263EF8D98];
    v37[6] = *MEMORY[0x263EF8D90];
    v37[7] = v4;
    uint64_t v5 = *MEMORY[0x263EF8DD8];
    v37[8] = *MEMORY[0x263EF8DD0];
    v37[9] = v5;
    uint64_t v6 = *MEMORY[0x263EF8DA8];
    v37[10] = *MEMORY[0x263EF8DA0];
    v37[11] = v6;
    uint64_t v7 = *MEMORY[0x263EF8DB8];
    v37[12] = *MEMORY[0x263EF8DB0];
    v37[13] = v7;
    uint64_t v8 = *MEMORY[0x263EF8D38];
    v37[14] = *MEMORY[0x263EF8D30];
    v37[15] = v8;
    uint64_t v9 = *MEMORY[0x263EF8D48];
    v37[16] = *MEMORY[0x263EF8D40];
    v37[17] = v9;
    uint64_t v10 = *MEMORY[0x263EF8DF0];
    v37[18] = *MEMORY[0x263EF8D50];
    v37[19] = v10;
    uint64_t v11 = *MEMORY[0x263EF8DE8];
    v37[20] = *MEMORY[0x263EF8E00];
    v37[21] = v11;
    uint64_t v12 = *MEMORY[0x263EF8DE0];
    v37[22] = *MEMORY[0x263EF8DF8];
    v37[23] = v12;
    uint64_t v13 = *MEMORY[0x263EF8EB0];
    v37[24] = *MEMORY[0x263EF8EA8];
    v37[25] = v13;
    uint64_t v14 = *MEMORY[0x263EF8E40];
    v37[26] = *MEMORY[0x263EF8E38];
    v37[27] = v14;
    uint64_t v15 = *MEMORY[0x263EF8E68];
    v37[28] = *MEMORY[0x263EF8E70];
    v37[29] = v15;
    uint64_t v16 = *MEMORY[0x263EF8E90];
    v37[30] = *MEMORY[0x263EF8E88];
    v37[31] = v16;
    uint64_t v17 = *MEMORY[0x263EF8E10];
    v37[32] = *MEMORY[0x263EF8E08];
    v37[33] = v17;
    uint64_t v18 = *MEMORY[0x263EF8EA0];
    v37[34] = *MEMORY[0x263EF8E98];
    v37[35] = v18;
    uint64_t v19 = *MEMORY[0x263EF8E20];
    v37[36] = *MEMORY[0x263EF8E18];
    v37[37] = v19;
    uint64_t v20 = *MEMORY[0x263EF8E50];
    v37[38] = *MEMORY[0x263EF8E48];
    v37[39] = v20;
    uint64_t v21 = *MEMORY[0x263EF8E28];
    v37[40] = *MEMORY[0x263EF8E58];
    v37[41] = v21;
    uint64_t v22 = *MEMORY[0x263EF8E60];
    v37[42] = *MEMORY[0x263EF8E30];
    v37[43] = v22;
    uint64_t v23 = *MEMORY[0x263EF8E80];
    v37[44] = *MEMORY[0x263EF8E78];
    v37[45] = v23;
    uint64_t v24 = *MEMORY[0x263EF8EC0];
    v37[46] = *MEMORY[0x263EF8EB8];
    v37[47] = v24;
    uint64_t v25 = *MEMORY[0x263EF8D60];
    v37[48] = *MEMORY[0x263EF8D58];
    v37[49] = v25;
    v37[50] = *MEMORY[0x263EF8D68];
    v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:51];
  }
  if ([v0 count] != 51) {
    ___initialiseBlendshapeMappingIfNeeded_block_invoke_cold_1();
  }
  float32x4_t v26 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:52];
  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 3221225472;
  simd_float4 v33 = ___initialiseBlendshapeMappingIfNeeded_block_invoke_2;
  simd_float4 v34 = &unk_26401FC78;
  id v35 = v26;
  id v27 = v26;
  [v0 enumerateObjectsUsingBlock:&v31];
  uint64_t v28 = *MEMORY[0x263EF8EC8];
  objc_storeStrong(&qword_2676A5028, (id)*MEMORY[0x263EF8EC8]);
  objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_26C00C460, v28, v31, v32, v33, v34);
  uint64_t v29 = [v27 copy];
  float32x4_t v30 = (void *)kAVTBlendShapeLocationIndices;
  kAVTBlendShapeLocationIndices = v29;
}

void ___initialiseBlendshapeMappingIfNeeded_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  objc_storeStrong((id *)&kAVTBlendShapeLocationFromARIndex[a3], a2);
  id v6 = a2;
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

uint64_t __AVTFaceTrackingIsSupported_block_invoke()
{
  int v0 = MGIsQuestionValid();
  if (v0) {
    LOBYTE(v0) = MGGetBoolAnswer();
  }
  AVTFaceTrackingIsSupported_kAVTFaceTrackingIsSupported = v0;
  uint64_t result = MGIsQuestionValid();
  if (result) {
    uint64_t result = MGGetBoolAnswer();
  }
  AVTFaceTrackingIsSupported_kAVTFaceTrackingIsSupported |= result;
  return result;
}

__CFString *AVTComponentTypeToString(unint64_t a1)
{
  if (a1 > 0x29) {
    return 0;
  }
  else {
    return off_26401FCC8[a1];
  }
}

uint64_t AVTComponentTypeFromString(void *a1)
{
  id v1 = a1;
  if (AVTComponentTypeFromString_onceToken != -1) {
    dispatch_once(&AVTComponentTypeFromString_onceToken, &__block_literal_global_5);
  }
  uint64_t v2 = [(id)AVTComponentTypeFromString_nameToType objectForKeyedSubscript:v1];
  if (v2)
  {
    uint64_t v3 = [(id)AVTComponentTypeFromString_nameToType objectForKeyedSubscript:v1];
    uint64_t v4 = (int)[v3 intValue];
  }
  else
  {
    uint64_t v4 = 42;
  }

  return v4;
}

void __AVTComponentTypeFromString_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:42];
  id v1 = (void *)AVTComponentTypeFromString_nameToType;
  AVTComponentTypeFromString_nameToType = v0;

  for (unint64_t i = 0; i != 42; ++i)
  {
    uint64_t v3 = [NSNumber numberWithInteger:i];
    uint64_t v4 = (void *)AVTComponentTypeFromString_nameToType;
    uint64_t v5 = AVTComponentTypeToString(i);
    [v4 setObject:v3 forKeyedSubscript:v5];
  }
}

uint64_t AVTComponentTypeIsPairable(unint64_t a1)
{
  return (a1 < 0x1C) & (0xC600000u >> a1);
}

BOOL AVTComponentTypeIsOnLeftInPair(uint64_t a1)
{
  return a1 == 26 || a1 == 21;
}

BOOL AVTComponentTypeIsOnRightInPair(uint64_t a1)
{
  return a1 == 27 || a1 == 22;
}

uint64_t AVTBodyRegionForComponentType(uint64_t a1)
{
  if ((unint64_t)(a1 - 34) > 7) {
    return 0;
  }
  else {
    return qword_20B88FF88[a1 - 34];
  }
}

void addAnimation(void *a1, void *a2, void *a3, void *a4, unsigned __int8 *a5)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  long long v64 = v10;
  [v10 subAnimations];
  long long v70 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v67 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v67 objects:v79 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v68 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v67 + 1) + 8 * i);
        long long v18 = *((_OWORD *)a5 + 1);
        long long v71 = *(_OWORD *)a5;
        long long v72 = v18;
        addAnimation(v9, v17, v11, v12, &v71);
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v67 objects:v79 count:16];
    }
    while (v14);
  }

  if (![v13 count])
  {
    int v19 = *a5;
    double v20 = *((double *)a5 + 1);
    double v21 = *((double *)a5 + 3);
    id v22 = v10;
    [v22 startDelay];
    double v24 = v23;
    [v22 setUsesSceneTimeBase:0];
    [v22 setStartDelay:0.0];
    uint64_t v25 = [v22 caAnimation];

    [v25 setUsesSceneTimeBase:0];
    [v25 setBeginTime:0.0];
    if (v19 && v24 != 0.0 && vabdd_f64(v20 / v21, v24) >= 0.001)
    {
      float32x4_t v26 = avt_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        addAnimation_cold_5(v26, v24);
      }
    }
    simd_float4x4 v63 = [v22 keyPath];
    int v27 = [v63 containsString:@"morpher.weights"];
    float32x4_t v61 = [v63 componentsSeparatedByString:@"/"];
    simd_float4x4 v62 = [v61 lastObject];
    uint64_t v29 = [v62 rangeOfString:@"."];
    if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
      int v30 = 1;
    }
    else {
      int v30 = v27;
    }
    if (v30 == 1)
    {
      __n128 v60 = [v9 name];
      id v31 = v62;
    }
    else
    {
      uint64_t v32 = v28;
      __n128 v60 = [v62 substringToIndex:v29];
      id v31 = [v62 substringFromIndex:v29 + v32];

      [v22 setKeyPath:v31];
      [MEMORY[0x263F16B08] flush];
      simd_float4x4 v63 = v31;
    }
    if (([v31 isEqualToString:@"transform"] & 1) != 0
      || ([v31 isEqualToString:@"position"] & 1) != 0
      || ([v31 isEqualToString:@"orientation"] & 1) != 0
      || ([v31 isEqualToString:@"rotation"] & 1) != 0
      || [v31 isEqualToString:@"eulerAngles"])
    {
      uint64_t v75 = 0;
      v76 = &v75;
      uint64_t v77 = 0x2020000000;
      char v78 = 0;
      simd_float4 v33 = [v22 caAnimation];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        simd_float4 v34 = v33;
        *(void *)&long long v71 = 0;
        *((void *)&v71 + 1) = &v71;
        *(void *)&long long v72 = 0x3032000000;
        *((void *)&v72 + 1) = __Block_byref_object_copy__3;
        v73 = __Block_byref_object_dispose__3;
        id v74 = 0;
        id v35 = [v34 values];
        v66[0] = MEMORY[0x263EF8330];
        v66[1] = 3221225472;
        v66[2] = __addAnimation_block_invoke;
        v66[3] = &unk_264020228;
        v66[4] = &v71;
        v66[5] = &v75;
        [v35 enumerateObjectsUsingBlock:v66];

        _Block_object_dispose(&v71, 8);
      }
      else
      {
        simd_float4 v34 = avt_default_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          uint64_t v36 = (objc_class *)objc_opt_class();
          float32x2_t v37 = NSStringFromClass(v36);
          addAnimation_cold_1(v37, (uint64_t)&v71, v34);
        }
      }

      if (*((unsigned char *)v76 + 24))
      {
        id v38 = [v12 objectForKeyedSubscript:v60];
        if (!v38)
        {
          id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v12 setObject:v38 forKeyedSubscript:v60];
        }
        [v38 addObject:v22];
      }
      __int32 v39 = &v75;
    }
    else
    {
      if (!v27)
      {
        simd_float4 v43 = avt_default_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          addAnimation_cold_4(v22, v43);
        }

        goto LABEL_36;
      }
      *(void *)&long long v71 = 0;
      *((void *)&v71 + 1) = &v71;
      *(void *)&long long v72 = 0x2020000000;
      BYTE8(v72) = 0;
      simd_float4 v40 = [v22 caAnimation];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int32 v41 = v40;
        float32x4_t v42 = [v41 values];
        v65[0] = MEMORY[0x263EF8330];
        v65[1] = 3221225472;
        v65[2] = __addAnimation_block_invoke_245;
        v65[3] = &unk_264020250;
        v65[4] = &v71;
        [v42 enumerateObjectsUsingBlock:v65];
      }
      else
      {
        __int32 v41 = avt_default_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          simd_float4 v44 = (objc_class *)objc_opt_class();
          __int32 v45 = NSStringFromClass(v44);
          addAnimation_cold_1(v45, (uint64_t)&v75, v41);
        }
      }

      if (*(unsigned char *)(*((void *)&v71 + 1) + 24))
      {
        __n128 v58 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"morpher\\.weights\\[([0-9]+)\\]" options:0 error:0];
        __n128 v59 = objc_msgSend(v58, "matchesInString:options:range:", v63, 0, 0, objc_msgSend(v63, "length"));
        if ([v59 count])
        {
          int32x4_t v46 = [v59 firstObject];
          uint64_t v47 = [v46 rangeAtIndex:1];
          uint64_t v49 = v48;

          __n128 v57 = objc_msgSend(v63, "substringWithRange:", v47, v49);
          uint64_t v50 = [v57 integerValue];
          __n128 v51 = [v9 morpher];
          int v52 = [v51 targets];
          __n128 v53 = [v52 objectAtIndexedSubscript:v50];
          uint64_t v56 = [v53 name];

          __n128 v54 = v57;
          simd_float4x4 v63 = (void *)v56;
        }
        else
        {
          __n128 v54 = avt_default_log();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
            addAnimation_cold_2(v54);
          }
        }

        if (v63 && AVTMorphTargetNameDefinesPose(v63))
        {
          __n128 v55 = [v11 objectForKeyedSubscript:v63];
          if (!v55) {
            [v11 setObject:v22 forKeyedSubscript:v63];
          }
        }
      }

      __int32 v39 = (uint64_t *)&v71;
    }
    _Block_object_dispose(v39, 8);
LABEL_36:
  }
}

void sub_20B8397C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_20B83A990(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __addAnimation_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v9 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v10 = v8;
  if (a3)
  {
    if (([v8 isEqual:*v9] & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {
    objc_storeStrong(v9, a2);
  }
}

uint64_t __addAnimation_block_invoke_245(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 floatValue];
  if (v7 != 0.0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void sub_20B83F428(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id AVTGetCapturedDepthTexture(void *a1, __CVMetalTextureCache *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 depthDataByConvertingToDepthDataType:1717855600];
    id v6 = (__CVBuffer *)[v5 depthDataMap];
    size_t Width = CVPixelBufferGetWidth(v6);
    size_t Height = CVPixelBufferGetHeight(v6);
    CVMetalTextureRef image = 0;
    if (CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, v6, 0, MTLPixelFormatR32Float, Width, Height, 0, &image))
    {
      id v9 = 0;
    }
    else
    {
      id v9 = CVMetalTextureGetTexture(image);
      CFRelease(image);
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void sub_20B8416B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __AVTDebugARMask_block_invoke()
{
  id v0 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.UIKit"];
  AVTDebugARMask_debugMode = [v0 BOOLForKey:@"avatarKit.showARLayers"];
}

__n128 AVTColor4WithCGColor(CGColor *a1)
{
  uint64_t v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002C8]);
  if (CGColorGetColorSpace(a1) == v2)
  {
    uint64_t v4 = CGColorRetain(a1);
  }
  else
  {
    id v3 = (const void *)MEMORY[0x2105390E0](v2, 0);
    uint64_t v4 = (CGColor *)CGColorTransformConvertColor();
    CFRelease(v3);
  }
  CFRelease(v2);
  size_t NumberOfComponents = CGColorGetNumberOfComponents(v4);
  Components = (float64x2_t *)CGColorGetComponents(v4);
  if (NumberOfComponents >= 4)
  {
    *(float *)&__int32 v7 = Components[1].f64[1];
    v8.i64[0] = 0;
    v8.i32[2] = 0;
    v8.i32[3] = v7;
LABEL_10:
    *(float32x2_t *)&long long v10 = vcvt_f32_f64(*Components);
    *((void *)&v10 + 1) = vextq_s8(v8, v8, 8uLL).u64[0];
    float v11 = Components[1].f64[0];
LABEL_13:
    *((float *)&v10 + 2) = v11;
    goto LABEL_14;
  }
  if (NumberOfComponents == 2)
  {
    float v9 = Components->f64[1];
    *((float *)&v10 + 3) = v9;
    goto LABEL_12;
  }
  if (NumberOfComponents >= 3)
  {
    int8x16_t v8 = (int8x16_t)xmmword_20B88FF70;
    goto LABEL_10;
  }
  long long v10 = xmmword_20B88FF70;
  if (NumberOfComponents)
  {
LABEL_12:
    float v11 = Components->f64[0];
    *(float *)&long long v10 = v11;
    *((float *)&v10 + 1) = v11;
    goto LABEL_13;
  }
LABEL_14:
  long long v13 = v10;
  CGColorRelease(v4);
  return (__n128)v13;
}

double AVTGetColorComponents(void *a1, const char *a2)
{
  if (!a1) {
    return 0.0;
  }
  objc_msgSend(a1, "avt_colorToColor4");
  return result;
}

__n128 AVTGetColorComponentsMetal(void *a1)
{
  id v1 = a1;
  id v3 = v1;
  if (v1)
  {
    objc_msgSend(v1, "avt_colorToColor4");
    float32x4_t v4 = v2;
  }
  else
  {
    float32x4_t v4 = 0uLL;
  }
  float32x4_t v13 = v4;
  if (v4.f32[0] <= 0.04045)
  {
    v2.f32[0] = v4.f32[0] / 12.92;
  }
  else
  {
    v2.f32[0] = powf((float)(v4.f32[0] + 0.055) / 1.055, 2.4);
    float32x4_t v4 = v13;
  }
  float32x4_t v12 = v2;
  if (v4.f32[1] <= 0.04045)
  {
    float v6 = v4.f32[1] / 12.92;
  }
  else
  {
    float v5 = powf((float)(v4.f32[1] + 0.055) / 1.055, 2.4);
    float32x4_t v4 = v13;
    float v6 = v5;
  }
  if (v4.f32[2] <= 0.04045)
  {
    float v7 = v4.f32[2] / 12.92;
  }
  else
  {
    float v11 = v6;
    float v7 = powf((float)(v4.f32[2] + 0.055) / 1.055, 2.4);
    float v6 = v11;
    float32x4_t v4 = v13;
  }
  float32x4_t v8 = v12;
  v8.f32[1] = v6;
  v8.f32[2] = v7;
  float32x4_t v9 = vmulq_laneq_f32(v8, v4, 3);
  v9.i32[3] = v4.i32[3];
  float32x4_t v14 = v9;

  return (__n128)v14;
}

float AVTGetNeutralZ()
{
  if (AVTGetNeutralZ_onceToken != -1) {
    dispatch_once(&AVTGetNeutralZ_onceToken, &__block_literal_global_11);
  }
  return *(float *)&AVTGetNeutralZ_avt_neutral_z;
}

void __AVTGetNeutralZ_block_invoke()
{
  id v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1 == 1) {
    AVTGetNeutralZ_avt_neutral_z = -1091693445;
  }
}

void *PerfTimesCreate@<X0>(unsigned int a1@<W0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = 0;
  double result = malloc_type_malloc(24 * a1, 0x1000040504FFAC1uLL);
  *(void *)(a2 + 8) = result;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = a1;
  *(unsigned char *)(a2 + 24) = a1 != 0;
  return result;
}

void PerfTimesFree(uint64_t a1)
{
  *(_DWORD *)(a1 + 20) = 0;
}

void PerfTimesPush(os_unfair_lock_t lock, long long *a2)
{
  if (lock && lock[5]._os_unfair_lock_opaque)
  {
    os_unfair_lock_lock(lock);
    uint64_t v4 = *(void *)&lock[2]._os_unfair_lock_opaque + 24 * (int)lock[4]._os_unfair_lock_opaque;
    long long v5 = *a2;
    *(void *)(v4 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v4 = v5;
    uint32_t os_unfair_lock_opaque = lock[4]._os_unfair_lock_opaque;
    if (os_unfair_lock_opaque == lock[5]._os_unfair_lock_opaque - 1)
    {
      uint32_t v7 = 0;
      LOBYTE(lock[6]._os_unfair_lock_opaque) = 1;
    }
    else
    {
      uint32_t v7 = os_unfair_lock_opaque + 1;
    }
    lock[4]._uint32_t os_unfair_lock_opaque = v7;
    os_unfair_lock_unlock(lock);
  }
}

uint64_t PerfTimesNextIndex(uint64_t a1, int a2)
{
  if (*(_DWORD *)(a1 + 20) == a2) {
    return 0;
  }
  else {
    return (a2 + 1);
  }
}

void PerfTimesForEach(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && *(_DWORD *)(a1 + 20))
  {
    float32x4_t v8 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)a1);
    if (*(unsigned char *)(a1 + 24))
    {
      int v4 = *(_DWORD *)(a1 + 16);
      if (*(_DWORD *)(a1 + 20) == v4) {
        int v5 = 0;
      }
      else {
        int v5 = v4 + 1;
      }
    }
    else
    {
      int v5 = 0;
    }
    uint64_t v6 = 20;
    if (!*(unsigned char *)(a1 + 24)) {
      uint64_t v6 = 16;
    }
    int v7 = *(_DWORD *)(a1 + v6);
    if (v7 >= 1)
    {
      do
      {
        v8[2](v8, *(void *)(a1 + 8) + 24 * v5);
        if (*(_DWORD *)(a1 + 20) == v5) {
          int v5 = 0;
        }
        else {
          ++v5;
        }
        --v7;
      }
      while (v7);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)a1);
    id v3 = v8;
  }
}

double PerfTimesMinForKind(uint64_t a1, int a2)
{
  uint64_t v6 = 0;
  int v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x7FEFFFFFFFFFFFFFLL;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __PerfTimesMinForKind_block_invoke;
  v4[3] = &unk_264020320;
  int v5 = a2;
  v4[4] = &v6;
  PerfTimesForEach(a1, v4);
  double v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v2;
}

void sub_20B842088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PerfTimesMinForKind_block_invoke(uint64_t result, uint64_t a2)
{
  double v2 = *(double *)(a2 + 8 * *(unsigned int *)(result + 40));
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  if (v2 < *(double *)(v3 + 24)) {
    *(double *)(v3 + 24) = v2;
  }
  return result;
}

double PerfTimesMaxForKind(uint64_t a1, int a2)
{
  uint64_t v6 = 0;
  int v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x10000000000000;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __PerfTimesMaxForKind_block_invoke;
  v4[3] = &unk_264020320;
  int v5 = a2;
  v4[4] = &v6;
  PerfTimesForEach(a1, v4);
  double v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v2;
}

void sub_20B842178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PerfTimesMaxForKind_block_invoke(uint64_t result, uint64_t a2)
{
  double v2 = *(double *)(a2 + 8 * *(unsigned int *)(result + 40));
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  if (v2 > *(double *)(v3 + 24)) {
    *(double *)(v3 + 24) = v2;
  }
  return result;
}

double PerfTimesMin(uint64_t a1)
{
  uint64_t v4 = 0;
  int v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0x7FEFFFFFFFFFFFFFLL;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __PerfTimesMin_block_invoke;
  v3[3] = &unk_264020348;
  v3[4] = &v4;
  PerfTimesForEach(a1, v3);
  double v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20B842264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PerfTimesMin_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = 0;
  double v3 = 0.0;
  do
  {
    double v3 = v3 + *(double *)(a2 + v2);
    v2 += 8;
  }
  while (v2 != 24);
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  if (v3 < *(double *)(v4 + 24)) {
    *(double *)(v4 + 24) = v3;
  }
  return result;
}

double PerfTimesMax(uint64_t a1)
{
  uint64_t v4 = 0;
  int v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0x10000000000000;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __PerfTimesMax_block_invoke;
  v3[3] = &unk_264020348;
  v3[4] = &v4;
  PerfTimesForEach(a1, v3);
  double v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20B842364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PerfTimesMax_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = 0;
  double v3 = 0.0;
  do
  {
    double v3 = v3 + *(double *)(a2 + v2);
    v2 += 8;
  }
  while (v2 != 24);
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  if (v3 > *(double *)(v4 + 24)) {
    *(double *)(v4 + 24) = v3;
  }
  return result;
}

double PerfTimesAverageLatency(uint64_t a1)
{
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  uint64_t v4 = 0;
  int v5 = (int *)&v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __PerfTimesAverageLatency_block_invoke;
  v3[3] = &unk_264020370;
  v3[4] = &v8;
  void v3[5] = &v4;
  PerfTimesForEach(a1, v3);
  double v1 = v9[3] / (double)v5[6];
  _Block_object_dispose(&v4, 8);
  _Block_object_dispose(&v8, 8);
  return v1;
}

void sub_20B84248C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __PerfTimesAverageLatency_block_invoke(uint64_t result, uint64_t a2)
{
  for (uint64_t i = 0; i != 24; i += 8)
    *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(double *)(a2 + i)
                                                                    + *(double *)(*(void *)(*(void *)(result + 32)
                                                                                            + 8)
                                                                                + 24);
  ++*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

double PerfTimesAverageLatencyForKind(uint64_t a1, int a2)
{
  uint64_t v10 = 0;
  uint64_t v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = (int *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __PerfTimesAverageLatencyForKind_block_invoke;
  v4[3] = &unk_264020398;
  int v5 = a2;
  v4[4] = &v10;
  void v4[5] = &v6;
  PerfTimesForEach(a1, v4);
  double v2 = v11[3] / (double)v7[6];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return v2;
}

void sub_20B8425CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

double __PerfTimesAverageLatencyForKind_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(a2 + 8 * *(unsigned int *)(a1 + 48)) + *(double *)(v2 + 24);
  *(double *)(v2 + 24) = result;
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

__n128 AVTARKitTransformToSceneKitTransformMatrix(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >= 2)
  {
    if (a1 == 2 && (unint64_t)(a2 - 2) < 3)
    {
      unint64_t v6 = qword_20B890150[a2 - 2];
      goto LABEL_9;
    }
  }
  else
  {
    int v5 = avt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      AVTARKitTransformToSceneKitTransformMatrix_cold_1(a1, v5);
    }
  }
  unint64_t v6 = 0;
LABEL_9:
  unint64_t v7 = v6 + 3;
  unint64_t v8 = v6 + 2;
  if (a3 != 2) {
    unint64_t v8 = v6;
  }
  if (a3 == 3) {
    unint64_t v9 = v6 + 1;
  }
  else {
    unint64_t v9 = v8;
  }
  if (a3 == 4) {
    unint64_t v9 = v7;
  }
  if (v9 >= 4) {
    v9 -= 4;
  }
  return AVTARKitTransformToSceneKitTransformMatrix_rotationMatrices[4 * v9];
}

__n128 AVTSceneKitTextureCoordinatesForCaptureDeviceTexture(void *a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  id v7 = a1;
  unint64_t v9 = v7;
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
      *(void *)&_Q0 = 0;
      long long v22 = _Q0;
      __asm { FMOV            V0.2S, #1.0 }
      goto LABEL_5;
    case 2uLL:
      __asm { FMOV            V0.2S, #1.0 }
      long long v22 = _Q0;
      *(void *)&_Q0 = 0;
LABEL_5:
      long long v23 = _Q0;
      break;
    case 3uLL:
      *(void *)&_Q0 = 1065353216;
      long long v22 = _Q0;
      *(void *)&_Q0 = 0x3F80000000000000;
      long long v23 = _Q0;
      __asm { FMOV            V0.2S, #1.0 }
      break;
    case 4uLL:
      *(void *)&_Q0 = 0x3F80000000000000;
      long long v22 = _Q0;
      *(void *)&_Q0 = 1065353216;
      long long v23 = _Q0;
      __asm { FMOV            V0.2S, #1.0 }
      break;
    default:
      *(void *)&_Q0 = 0;
      long long v22 = _Q0;
      *(void *)&_Q0 = 0;
      long long v23 = _Q0;
      break;
  }
  unint64_t v16 = objc_msgSend(v7, "width", v22);
  unint64_t v17 = [v9 height];
  if (a4 <= 2)
  {
    unint64_t v16 = [v9 height];
    unint64_t v17 = [v9 width];
  }
  float v18 = (float)a3 * (float)v16;
  float v19 = (float)a2 * (float)v17;
  long long v20 = v23;
  if (v18 <= v19)
  {
    if (v18 < v19)
    {
      *(float *)&long long v20 = (float)((float)(*(float *)&v23 + -0.5) * (float)(v18 / v19)) + 0.5;
      long long v23 = v20;
    }
  }
  else
  {
    *((float *)&v20 + 1) = (float)((float)(*((float *)&v23 + 1) + -0.5) * (float)(v19 / v18)) + 0.5;
    long long v23 = v20;
  }

  return (__n128)v23;
}

id AVTRenderingCacheFolderURL()
{
  +[AVTResourceLocator sharedResourceLocator]();
  id v0 = (id *)objc_claimAutoreleasedReturnValue();
  double v1 = -[AVTResourceLocator rootCacheURL](v0);

  return v1;
}

void AVTSetARCompositingEnabled(void *a1, uint64_t a2)
{
  id v3 = a1;
  objc_msgSend(v3, "set_enableARMode:", a2);
  id v6 = [v3 pointOfView];

  if (a2) {
    double v4 = 0.82;
  }
  else {
    double v4 = 0.0;
  }
  int v5 = [v6 camera];
  [v5 setGrainIntensity:v4];
}

void AVTApplyARGrainIfNeeded(void *a1, void *a2)
{
  id v22 = a1;
  id v3 = a2;
  double v4 = [v22 pointOfView];
  int v5 = [v4 camera];
  [v3 cameraGrainIntensity];
  if (v6 == 0.0)
  {
    [v5 setGrainIntensity:0.0];
  }
  else
  {
    [v5 setGrainIntensity:0.82];
    [v22 _backingSize];
    double v8 = v7;
    double v10 = v9;
    uint64_t v11 = [v3 camera];
    [v11 imageResolution];
    double v13 = v12;
    double v15 = v14;

    float v16 = v13;
    float v17 = v15;
    float v18 = fmax(v8, v10);
    float v19 = fmin(v8, v10);
    objc_msgSend(v5, "setGrainScale:", fmaxf(v18 / v16, v19 / v17));
    [v5 setGrainIsColored:1];
    long long v20 = [v3 cameraGrainTexture];
    [v5 setGrainTexture:v20];

    [v3 cameraGrainIntensity];
    [v5 setGrainSlice:v21];
  }
}

uint64_t AVTMTLDeviceSupportsNonUniformThreadgroupSize(void *a1, const char *a2)
{
  return [a1 supportsFeatureSet:11];
}

uint64_t AVTMTLDeviceSupportsReadWritePixelFormat()
{
  return MEMORY[0x270EF5F40]();
}

id AVTMTLTextureDescriptorCreateFromTexture(void *a1)
{
  if (a1)
  {
    double v1 = (objc_class *)MEMORY[0x263F12A58];
    id v2 = a1;
    id v3 = objc_alloc_init(v1);
    objc_msgSend(v3, "setTextureType:", objc_msgSend(v2, "textureType"));
    objc_msgSend(v3, "setPixelFormat:", objc_msgSend(v2, "pixelFormat"));
    objc_msgSend(v3, "setWidth:", objc_msgSend(v2, "width"));
    objc_msgSend(v3, "setHeight:", objc_msgSend(v2, "height"));
    objc_msgSend(v3, "setDepth:", objc_msgSend(v2, "depth"));
    objc_msgSend(v3, "setMipmapLevelCount:", objc_msgSend(v2, "mipmapLevelCount"));
    objc_msgSend(v3, "setSampleCount:", objc_msgSend(v2, "sampleCount"));
    objc_msgSend(v3, "setArrayLength:", objc_msgSend(v2, "arrayLength"));
    objc_msgSend(v3, "setCpuCacheMode:", objc_msgSend(v2, "cpuCacheMode"));
    objc_msgSend(v3, "setStorageMode:", objc_msgSend(v2, "storageMode"));
    uint64_t v4 = [v2 usage];

    [v3 setUsage:v4];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

id plistWithVector(__n128 a1)
{
  v9[3] = *MEMORY[0x263EF8340];
  double v1 = numberFromDouble(a1.n128_f32[0]);
  id v2 = numberFromDouble(a1.n128_f32[1]);
  id v3 = numberFromDouble(a1.n128_f32[2]);
  if (objc_msgSend(v1, "isEqualToNumber:", v2, a1.n128_u64[0])
    && [v1 isEqualToNumber:v3])
  {
    id v4 = v1;
  }
  else
  {
    v8[0] = @"x";
    v8[1] = @"y";
    v9[0] = v1;
    v9[1] = v2;
    v8[2] = @"z";
    v9[2] = v3;
    id v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
  }
  int v5 = v4;

  return v5;
}

id numberFromDouble(double a1)
{
  id v2 = [MEMORY[0x263F087B8] decimalNumberHandlerWithRoundingMode:0 scale:3 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
  id v3 = [MEMORY[0x263F087B0] numberWithDouble:a1];
  id v4 = [v3 decimalNumberByRoundingAccordingToBehavior:v2];

  return v4;
}

id AVTMergeSpecializationSettings(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = objc_opt_class();
  float v6 = __AVTMergeSpecializationSettings(0, v4, v3, @"ARKit driven morpher", v5);
  uint64_t v7 = objc_opt_class();
  double v8 = __AVTMergeSpecializationSettings(v6, v4, v3, @"ARKit driven material", v7);

  uint64_t v9 = objc_opt_class();
  double v10 = __AVTMergeSpecializationSettings(v8, v4, v3, @"ARKit disabled blendshapes", v9);

  uint64_t v11 = objc_opt_class();
  double v12 = __AVTMergeSpecializationSettings(v10, v4, v3, @"dynamics", v11);

  uint64_t v13 = objc_opt_class();
  double v14 = __AVTMergeSpecializationSettings(v12, v4, v3, @"AR", v13);

  return v14;
}

id __AVTMergeSpecializationSettings(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a1;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [a2 objectForKeyedSubscript:v10];
  uint64_t v13 = [v11 objectForKeyedSubscript:v10];

  if (v12 | v13)
  {
    if (objc_opt_class() == a5)
    {
      id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      double v15 = v16;
      if (v12) {
        [v16 addEntriesFromDictionary:v12];
      }
      if (v13) {
        [v15 addEntriesFromDictionary:v13];
      }
    }
    else
    {
      id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
      double v15 = v14;
      if (v12) {
        [v14 addObjectsFromArray:v12];
      }
      if (v13) {
        [v15 addObjectsFromArray:v13];
      }
    }
    if (!v9) {
      id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    [v9 setObject:v15 forKeyedSubscript:v10];
  }
  return v9;
}

void sub_20B847A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AVTColorApplyVariation(void *a1, void *a2, void *a3, double a4)
{
  id v6 = a1;
  id v7 = a2;
  id v8 = a3;
  id v10 = v8;
  if (*(float *)&a4 == 0.0) {
    goto LABEL_2;
  }
  if (*(float *)&a4 <= 0.0)
  {
    if (v7)
    {
      *(double *)v16.i64 = AVTGetColorComponents(v6, v9);
      float32x4_t v21 = v16;
      *(double *)v18.i64 = AVTGetColorComponents(v7, v17);
      float32x4_t v15 = vmlsq_lane_f32(v21, vsubq_f32(v18, v21), *(float32x2_t *)&a4, 0);
      goto LABEL_8;
    }
LABEL_2:
    id v11 = v6;
    goto LABEL_9;
  }
  if (!v8) {
    goto LABEL_2;
  }
  *(double *)v12.i64 = AVTGetColorComponents(v6, v9);
  float32x4_t v21 = v12;
  *(double *)v14.i64 = AVTGetColorComponents(v10, v13);
  float32x4_t v15 = vmlaq_n_f32(v21, vsubq_f32(v14, v21), *(float *)&a4);
LABEL_8:
  objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", v15.f32[0], v15.f32[1], v15.f32[2], v15.f32[3], *(_OWORD *)&v21);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  float v19 = v11;

  return v19;
}

void *_scanColor(void *result, float *a2, float *a3, float *a4, float *a5)
{
  if (result)
  {
    int v14 = 0;
    int v13 = 0;
    uint64_t v12 = 0;
    double result = (void *)sscanf((const char *)[result UTF8String], "%d %d %d %d", &v14, &v13, (char *)&v12 + 4, &v12);
    float v9 = (float)v13 / 255.0;
    float v10 = 1.0;
    float v11 = (float)SHIDWORD(v12) / 255.0;
    if (result != 3)
    {
      if (result == 1)
      {
        float v9 = (float)v14 / 255.0;
        float v11 = v9;
      }
      else
      {
        float v10 = (float)(int)v12 / 255.0;
      }
    }
    *a2 = (float)v14 / 255.0;
    *a3 = v9;
    *a4 = v11;
    *a5 = v10;
  }
  return result;
}

__n128 AVTAvatarPoseRepresentationGetTransform(void *a1)
{
  id v1 = a1;
  if ([v1 count] == 16)
  {
    __n128 v53 = [v1 objectAtIndexedSubscript:0];
    [v53 floatValue];
    unsigned int v59 = v2;
    __n128 v51 = [v1 objectAtIndexedSubscript:1];
    [v51 floatValue];
    unsigned int v57 = v3;
    uint64_t v49 = [v1 objectAtIndexedSubscript:2];
    [v49 floatValue];
    unsigned int v56 = v4;
    uint64_t v48 = [v1 objectAtIndexedSubscript:3];
    [v48 floatValue];
    v5.i64[0] = __PAIR64__(v57, v59);
    v5.i64[1] = __PAIR64__(v6, v56);
    float32x4_t v60 = v5;
    uint64_t v47 = [v1 objectAtIndexedSubscript:4];
    [v47 floatValue];
    int32x4_t v46 = [v1 objectAtIndexedSubscript:5];
    [v46 floatValue];
    __int32 v45 = [v1 objectAtIndexedSubscript:6];
    [v45 floatValue];
    id v7 = [v1 objectAtIndexedSubscript:7];
    [v7 floatValue];
    id v8 = [v1 objectAtIndexedSubscript:8];
    [v8 floatValue];
    float v9 = [v1 objectAtIndexedSubscript:9];
    [v9 floatValue];
    float v10 = [v1 objectAtIndexedSubscript:10];
    [v10 floatValue];
    float v11 = [v1 objectAtIndexedSubscript:11];
    [v11 floatValue];
    uint64_t v12 = [v1 objectAtIndexedSubscript:12];
    [v12 floatValue];
    int v13 = [v1 objectAtIndexedSubscript:13];
    [v13 floatValue];
    int v14 = [v1 objectAtIndexedSubscript:14];
    [v14 floatValue];
    float32x4_t v15 = [v1 objectAtIndexedSubscript:15];
    [v15 floatValue];
  }
  else
  {
    id v16 = v1;
    float v17 = [v16 objectAtIndexedSubscript:0];
    [v17 floatValue];
    float32x4_t v18 = [v16 objectAtIndexedSubscript:1];
    [v18 floatValue];
    float v19 = [v16 objectAtIndexedSubscript:2];

    [v19 floatValue];
    id v20 = v16;
    float32x4_t v21 = [v20 objectAtIndexedSubscript:3];
    [v21 floatValue];
    v55.i64[0] = v22;
    long long v23 = [v20 objectAtIndexedSubscript:4];
    [v23 floatValue];
    float v61 = v24;
    uint64_t v25 = [v20 objectAtIndexedSubscript:5];
    [v25 floatValue];
    float v58 = v26;
    int v27 = [v20 objectAtIndexedSubscript:6];

    [v27 floatValue];
    float32x4_t v28 = v55;
    v28.f32[1] = v61;
    v28.f32[2] = v58;
    float32x4_t v52 = v28;
    v28.i32[3] = v29;
    float32x4_t v50 = v28;

    id v30 = v20;
    if ([v30 count] == 10)
    {
      id v31 = [v30 objectAtIndexedSubscript:7];
      [v31 floatValue];
      float v54 = v32;
      simd_float4 v33 = [v30 objectAtIndexedSubscript:8];
      [v33 floatValue];
      simd_float4 v34 = [v30 objectAtIndexedSubscript:9];
      [v34 floatValue];
    }
    else
    {
      __asm { FMOV            V0.4S, #1.0 }
      float v54 = *(float *)&_Q0;
    }

    float32x4_t v40 = *(float32x4_t *)MEMORY[0x263EF89A8];
    float32x4_t v41 = vmulq_f32(v50, v50);
    float32x4_t v42 = vaddq_f32(v41, v41);
    float32x4_t v43 = vmulq_laneq_f32(v52, v50, 3);
    v40.f32[0] = (float)(1.0 - v42.f32[1]) - v42.f32[2];
    v40.f32[1] = (float)((float)(v55.f32[0] * v61) + v43.f32[2]) + (float)((float)(v55.f32[0] * v61) + v43.f32[2]);
    v40.f32[2] = (float)((float)(v55.f32[0] * v58) - v43.f32[1]) + (float)((float)(v55.f32[0] * v58) - v43.f32[1]);
    float32x4_t v60 = vmulq_n_f32(v40, v54);
  }

  return (__n128)v60;
}

void _simd_slerp_internal(float32x4_t a1, float32x4_t a2, float a3)
{
  float v5 = 1.0 - a3;
  float32x4_t v6 = vsubq_f32(a1, a2);
  int8x16_t v7 = (int8x16_t)vmulq_f32(v6, v6);
  float32x4_t v8 = vaddq_f32(a1, a2);
  int8x16_t v9 = (int8x16_t)vmulq_f32(v8, v8);
  float v10 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL)))));
  float v11 = v10 + v10;
  if ((float)(v10 + v10) != 0.0) {
    sinf(v11);
  }
  if ((float)(v5 * v11) != 0.0) {
    sinf(v5 * v11);
  }
  float v12 = v11 * a3;
  if (v12 != 0.0) {
    sinf(v12);
  }
}

__CFString *AVTPrereleaseStickerPackForStickerPack(void *a1)
{
  id v1 = a1;
  unsigned int v2 = @"stickers";
  if ([(__CFString *)v1 isEqualToString:@"stickers"])
  {
    unsigned int v3 = @"stickersPrerelease";
  }
  else
  {
    unsigned int v2 = @"posesPack";
    if ([(__CFString *)v1 isEqualToString:@"posesPack"])
    {
      unsigned int v3 = @"posesPackPrerelease";
    }
    else
    {
      unsigned int v2 = @"memojiEditorCarousel";
      if ([(__CFString *)v1 isEqualToString:@"memojiEditorCarousel"])
      {
        unsigned int v3 = @"memojiEditorCarouselPrerelease";
      }
      else
      {
        unsigned int v2 = @"memojiEditorCarousel_poses";
        int v4 = [(__CFString *)v1 isEqualToString:@"memojiEditorCarousel_poses"];
        float v5 = v1;
        if (!v4) {
          goto LABEL_12;
        }
        unsigned int v3 = @"memojiEditorCarousel_posesPrerelease";
      }
    }
  }
  if (AVTPrecompiledStickerPackIsEmpty(v3)) {
    float v5 = v2;
  }
  else {
    float v5 = v3;
  }
LABEL_12:
  float32x4_t v6 = v5;

  return v6;
}

BOOL AVTPrecompiledStickerPackIsEmpty(void *a1)
{
  id v1 = AVTPrecompiledStickerPackPlist(a1);
  BOOL v2 = [v1 count] == 0;

  return v2;
}

id AVTPrecompiledStickerPackPlistForPuppetNamed(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = AVTPrecompiledStickerPackPlist(a1);
  float v5 = [v4 objectForKeyedSubscript:v3];

  if (!v5)
  {
    float v5 = [v4 objectForKeyedSubscript:@"animoji"];
  }

  return v5;
}

id AVTPrecompiledStickerPackPlist(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"stickers"])
  {
    if (AVTPrecompiledStickerPackPlist_onceToken != -1) {
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken, &__block_literal_global_15);
    }
    BOOL v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_stickers;
LABEL_41:
    id v3 = v2;
    goto LABEL_42;
  }
  if ([v1 isEqualToString:@"stickersPrerelease"])
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_1813 != -1) {
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_1813, &__block_literal_global_1815);
    }
    BOOL v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_stickersPrerelease;
    goto LABEL_41;
  }
  if ([v1 isEqualToString:@"posesPack"])
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_1816 != -1) {
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_1816, &__block_literal_global_1818);
    }
    BOOL v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_posesPack;
    goto LABEL_41;
  }
  if ([v1 isEqualToString:@"posesPackPrerelease"])
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_2180 != -1) {
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_2180, &__block_literal_global_2182);
    }
    BOOL v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_posesPackPrerelease;
    goto LABEL_41;
  }
  if ([v1 isEqualToString:@"memojiEditorCarousel"])
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_2183 != -1) {
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_2183, &__block_literal_global_2185);
    }
    BOOL v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorCarousel;
    goto LABEL_41;
  }
  if ([v1 isEqualToString:@"memojiEditorCarouselPrerelease"])
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_2199 != -1) {
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_2199, &__block_literal_global_2201);
    }
    BOOL v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorCarouselPrerelease;
    goto LABEL_41;
  }
  if ([v1 isEqualToString:@"memojiEditorCarousel_poses"])
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_2202 != -1) {
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_2202, &__block_literal_global_2204);
    }
    BOOL v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorCarousel_poses;
    goto LABEL_41;
  }
  if ([v1 isEqualToString:@"memojiEditorCarousel_posesPrerelease"])
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_2218 != -1) {
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_2218, &__block_literal_global_2220);
    }
    BOOL v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorCarousel_posesPrerelease;
    goto LABEL_41;
  }
  if ([v1 isEqualToString:@"memojiEditorThumbnails"])
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_2221 != -1) {
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_2221, &__block_literal_global_2223);
    }
    BOOL v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorThumbnails;
    goto LABEL_41;
  }
  if ([v1 isEqualToString:@"allStickers"])
  {
    if (AVTPrecompiledStickerPackPlist_onceToken_2243 != -1) {
      dispatch_once(&AVTPrecompiledStickerPackPlist_onceToken_2243, &__block_literal_global_2245);
    }
    BOOL v2 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_allStickers;
    goto LABEL_41;
  }
  float v5 = avt_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    AVTPrecompiledStickerPackPlist_cold_1((uint64_t)v1, v5, v6, v7, v8, v9, v10, v11);
  }

  id v3 = 0;
LABEL_42:

  return v3;
}

void sub_20B85210C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20B8524B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void __AVTPrecompiledStickerPackPlist_block_invoke()
{
  id v0 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_stickers;
  AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_stickers = (uint64_t)&unk_26C0142C8;
}

void __AVTPrecompiledStickerPackPlist_block_invoke_2()
{
  id v0 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_stickersPrerelease;
  AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_stickersPrerelease = MEMORY[0x263EFFA78];
}

void __AVTPrecompiledStickerPackPlist_block_invoke_3()
{
  id v0 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_posesPack;
  AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_posesPack = (uint64_t)&unk_26C0142F0;
}

void __AVTPrecompiledStickerPackPlist_block_invoke_4()
{
  id v0 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_posesPackPrerelease;
  AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_posesPackPrerelease = MEMORY[0x263EFFA78];
}

void __AVTPrecompiledStickerPackPlist_block_invoke_5()
{
  id v0 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorCarousel;
  AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorCarousel = (uint64_t)&unk_26C014318;
}

void __AVTPrecompiledStickerPackPlist_block_invoke_6()
{
  id v0 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorCarouselPrerelease;
  AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorCarouselPrerelease = MEMORY[0x263EFFA78];
}

void __AVTPrecompiledStickerPackPlist_block_invoke_7()
{
  id v0 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorCarousel_poses;
  AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorCarousel_poses = (uint64_t)&unk_26C014340;
}

void __AVTPrecompiledStickerPackPlist_block_invoke_8()
{
  id v0 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorCarousel_posesPrerelease;
  AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorCarousel_posesPrerelease = MEMORY[0x263EFFA78];
}

void __AVTPrecompiledStickerPackPlist_block_invoke_9()
{
  id v0 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorThumbnails;
  AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_memojiEditorThumbnails = (uint64_t)&unk_26C014368;
}

void __AVTPrecompiledStickerPackPlist_block_invoke_10()
{
  id v0 = (void *)AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_allStickers;
  AVTPrecompiledStickerPackPlist_kAVTPrecompiledStickerPack_allStickers = (uint64_t)&unk_26C014390;
}

uint64_t AVTAvatarKitVersionNumber()
{
  return 346;
}

uint64_t AVTAvatarKitSnapshotVersionNumber()
{
  if (AVTAvatarKitSnapshotVersionNumber_onceToken != -1) {
    dispatch_once(&AVTAvatarKitSnapshotVersionNumber_onceToken, &__block_literal_global_16);
  }
  return AVTAvatarKitSnapshotVersionNumber_kAVTAvatarKitSnapshotVersionNumber;
}

void __AVTAvatarKitSnapshotVersionNumber_block_invoke()
{
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v0 = [v9 infoDictionary];
  id v1 = [v0 objectForKeyedSubscript:@"CFBundleVersion"];

  BOOL v2 = [v1 componentsSeparatedByString:@"."];
  id v3 = [v2 firstObject];
  uint64_t v4 = [v3 integerValue];

  if ((unint64_t)[v2 count] < 2)
  {
    uint64_t v6 = 0;
  }
  else
  {
    float v5 = [v2 objectAtIndexedSubscript:1];
    uint64_t v6 = [v5 integerValue];
  }
  if ((unint64_t)[v2 count] < 3)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = [v2 objectAtIndexedSubscript:2];
    uint64_t v8 = [v7 integerValue];
  }
  AVTAvatarKitSnapshotVersionNumber_kAVTAvatarKitSnapshotVersionNumber = v8 + 1000 * (v6 + 1000 * v4);
}

id AVTAvatarKitSnapshotVersionString()
{
  if (AVTAvatarKitSnapshotVersionString_onceToken != -1) {
    dispatch_once(&AVTAvatarKitSnapshotVersionString_onceToken, &__block_literal_global_37);
  }
  id v0 = (void *)AVTAvatarKitSnapshotVersionString_kAVTAvatarKitSnapshotVersionString;
  return v0;
}

void __AVTAvatarKitSnapshotVersionString_block_invoke()
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v0 = [v3 infoDictionary];
  uint64_t v1 = [v0 objectForKeyedSubscript:@"CFBundleVersion"];
  BOOL v2 = (void *)AVTAvatarKitSnapshotVersionString_kAVTAvatarKitSnapshotVersionString;
  AVTAvatarKitSnapshotVersionString_kAVTAvatarKitSnapshotVersionString = v1;
}

uint64_t AVTAvatarKitSnapshotVersionNumberFromString(void *a1)
{
  uint64_t v1 = [a1 componentsSeparatedByString:@"."];
  BOOL v2 = [v1 firstObject];
  uint64_t v3 = [v2 integerValue];

  if ((unint64_t)[v1 count] < 2)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v4 = [v1 objectAtIndexedSubscript:1];
    uint64_t v5 = [v4 integerValue];
  }
  if ((unint64_t)[v1 count] < 3)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v6 = [v1 objectAtIndexedSubscript:2];
    uint64_t v7 = [v6 integerValue];
  }
  return v7 + 1000 * (v5 + 1000 * v3);
}

id AVTSceneKitSnapshotVersionString()
{
  if (AVTSceneKitSnapshotVersionString_onceToken != -1) {
    dispatch_once(&AVTSceneKitSnapshotVersionString_onceToken, &__block_literal_global_39);
  }
  id v0 = (void *)AVTSceneKitSnapshotVersionString_kAVTSceneKitSnapshotVersionString;
  return v0;
}

void __AVTSceneKitSnapshotVersionString_block_invoke()
{
  id v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (!v0)
  {
    uint64_t v1 = avt_default_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __AVTSceneKitSnapshotVersionString_block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
  id v9 = [v0 infoDictionary];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"CFBundleVersion"];
  uint64_t v11 = (void *)AVTSceneKitSnapshotVersionString_kAVTSceneKitSnapshotVersionString;
  AVTSceneKitSnapshotVersionString_kAVTSceneKitSnapshotVersionString = v10;
}

BOOL AVTNodeMatchesHierarchyEnumerationOptions(void *a1, char a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if ((a2 & 1) != 0
    && ([v3 morpher], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    BOOL v6 = 0;
  }
  else if ((a2 & 2) != 0)
  {
    uint64_t v7 = [v4 geometry];
    BOOL v6 = v7 != 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

void AVTInitializeShaderCache()
{
  if (AVTInitializeShaderCache_onceToken != -1) {
    dispatch_once(&AVTInitializeShaderCache_onceToken, &__block_literal_global_89);
  }
}

void __AVTInitializeShaderCache_block_invoke()
{
  id v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  [v0 load];
  +[AVTResourceLocator sharedResourceLocator]();
  uint64_t v1 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = -[AVTResourceLocator urlForFrameworkResourceAtPath:isDirectory:](v1, @"default.metallib", 0);

  if (v2)
  {
    MEMORY[0x210539530](v2);
  }
  else
  {
    id v3 = avt_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __AVTInitializeShaderCache_block_invoke_cold_1();
    }
  }
}

void sub_20B853748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B854ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

float AVTMorphWeightApplyBlinkCorrection(void *a1, float a2)
{
  id v3 = a1;
  if (([v3 isEqualToString:*MEMORY[0x263EF8D70]] & 1) != 0
    || [v3 isEqualToString:*MEMORY[0x263EF8D78]])
  {
    float v4 = a2 * 1.1;
    if (a2 < 0.0) {
      float v4 = 0.0;
    }
    float v5 = pow(fminf(v4, 1.0), 0.666666667);
    a2 = fminf(v5, 1.0);
  }

  return a2;
}

float AVTMorphWeightApplyCorrectionForTongue(void *a1, float a2, float a3)
{
  id v5 = a1;
  BOOL v6 = v5;
  if (a3 != -1.0
    && (([v5 isEqualToString:*MEMORY[0x263EF8E28]] & 1) != 0
     || ([v6 isEqualToString:*MEMORY[0x263EF8E58]] & 1) != 0
     || ([v6 isEqualToString:*MEMORY[0x263EF8E68]] & 1) != 0
     || ([v6 isEqualToString:*MEMORY[0x263EF8E48]] & 1) != 0
     || ([v6 isEqualToString:*MEMORY[0x263EF8E50]] & 1) != 0
     || ([v6 isEqualToString:*MEMORY[0x263EF8E78]] & 1) != 0
     || [v6 isEqualToString:*MEMORY[0x263EF8E00]]))
  {
    a2 = (1.0 - a3) * a2;
  }

  return a2;
}

void sub_20B856DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B859CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 144));
  _Unwind_Resume(a1);
}

void sub_20B85A900(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double AVTDebugViewValueForIndex(uint64_t a1, int a2)
{
  uint64_t v2 = a1 + 24;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = a1 + 8;
  if (a2 != 1) {
    uint64_t v4 = a1;
  }
  if (a2 != 2) {
    uint64_t v3 = v4;
  }
  if (a2 != 3) {
    uint64_t v2 = v3;
  }
  return *(double *)v2;
}

void sub_20B85CEEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20B85DF88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20B85E260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20B85E468(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_20B85E720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20B85F5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20B85FAA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id avt_default_log()
{
  if (avt_default_log_once != -1) {
    dispatch_once(&avt_default_log_once, &__block_literal_global_17);
  }
  id v0 = (void *)avt_default_log_logger;
  return v0;
}

uint64_t __avt_default_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.avatarkit", "AvatarKit");
  uint64_t v1 = avt_default_log_logger;
  avt_default_log_logger = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

BOOL AVTLogAllowsInternalCrash()
{
  if (!os_variant_has_internal_diagnostics()) {
    return 0;
  }
  os_log_t v0 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v1 = [v0 bundleIdentifier];

  if ([v1 isEqualToString:@"com.apple.loginwindow"])
  {

    return 0;
  }
  int v2 = [v1 isEqualToString:@"com.apple.SecurityAgent"];

  return !v2;
}

id AVTEditorMetadata()
{
  if (AVTEditorMetadata_onceToken != -1) {
    dispatch_once(&AVTEditorMetadata_onceToken, &__block_literal_global_18);
  }
  os_log_t v0 = (void *)AVTEditorMetadata_kAVTEditorMetadata;
  return v0;
}

void __AVTEditorMetadata_block_invoke()
{
  os_log_t v0 = (void *)MEMORY[0x263F08AC0];
  AVTPrecompiledMemojiEditorMetadata();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 dataWithPropertyList:v3 format:200 options:0 error:0];
  int v2 = (void *)AVTEditorMetadata_kAVTEditorMetadata;
  AVTEditorMetadata_kAVTEditorMetadata = v1;
}

id AVTPrereleaseEditorMetadata()
{
  if (AVTPrereleaseEditorMetadata_onceToken != -1) {
    dispatch_once(&AVTPrereleaseEditorMetadata_onceToken, &__block_literal_global_21);
  }
  os_log_t v0 = (void *)AVTPrereleaseEditorMetadata_kAVTPrereleaseEditorMetadata;
  return v0;
}

void __AVTPrereleaseEditorMetadata_block_invoke()
{
  AVTPrecompiledMemojiPrereleaseEditorMetadata();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if ([v4 count])
  {
    id v0 = v4;
  }
  else
  {
    uint64_t v1 = AVTPrecompiledMemojiEditorMetadata();

    id v0 = (id)v1;
  }
  id v5 = v0;
  uint64_t v2 = [MEMORY[0x263F08AC0] dataWithPropertyList:v0 format:200 options:0 error:0];
  id v3 = (void *)AVTPrereleaseEditorMetadata_kAVTPrereleaseEditorMetadata;
  AVTPrereleaseEditorMetadata_kAVTPrereleaseEditorMetadata = v2;
}

id AVTMakePresetLocalizableKey(unint64_t a1, void *a2)
{
  id v3 = a2;
  if (!AVTPresetCategoryIsPairable(a1))
  {
    id v4 = AVTPresetCategoryToString(a1);
    goto LABEL_6;
  }
  id v4 = AVTPresetCategoryPairToString(a1);
  if ([v3 isEqualToString:@"none"])
  {
LABEL_6:
    [NSString stringWithFormat:@"%@_%@", v4, v3];
    goto LABEL_7;
  }
  if (AVTPresetCategoryIsOnLeftInPair(a1)) {
    [NSString stringWithFormat:@"%@_%@_LEFT", v4, v3];
  }
  else {
    [NSString stringWithFormat:@"%@_%@_RIGHT", v4, v3];
  }
  id v5 = LABEL_7:;
  BOOL v6 = [v5 uppercaseString];

  return v6;
}

id AVTMakePresetPairLocalizableKey(unint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = AVTPresetCategoryPairToString(a1);
  id v5 = [NSString stringWithFormat:@"%@_%@", v4, v3];

  BOOL v6 = [v5 uppercaseString];

  return v6;
}

id AVTMakeColorPresetLocalizableKey(unint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = AVTPresetCategoryToColorCategoryString(a1);
  id v5 = [NSString stringWithFormat:@"%@_%@", v4, v3];

  BOOL v6 = [v5 uppercaseString];

  return v6;
}

id AVTLocalizedEditorString(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  id v3 = [v1 bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:v2 value:&stru_26BFE2E80 table:@"memoji_editor"];

  return v4;
}

id AVTLocalizedPresetString(unint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a2;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  BOOL v6 = AVTMakePresetLocalizableKey(a1, v4);
  uint64_t v7 = [v5 localizedStringForKey:v6 value:&stru_26BFE2E80 table:@"memoji_presets"];

  if ([v7 length]) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v4;
  }
  id v9 = v8;

  return v9;
}

id AVTLocalizedPresetPairString(unint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a2;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  BOOL v6 = AVTMakePresetPairLocalizableKey(a1, v4);
  uint64_t v7 = [v5 localizedStringForKey:v6 value:&stru_26BFE2E80 table:@"memoji_presets"];

  if ([v7 length]) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v4;
  }
  id v9 = v8;

  return v9;
}

id AVTLocalizedPaletteString(unint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a2;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  BOOL v6 = AVTMakeColorPresetLocalizableKey(a1, v4);
  uint64_t v7 = [v5 localizedStringForKey:v6 value:&stru_26BFE2E80 table:@"memoji_palettes"];

  if ([v7 length]) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v4;
  }
  id v9 = v8;

  return v9;
}

id AVTLocalizedStickerName(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  id v3 = [v1 bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:v2 value:&stru_26BFE2E80 table:@"stickers"];

  if ([v4 length]) {
    id v5 = v4;
  }
  else {
    id v5 = v2;
  }
  id v6 = v5;

  return v6;
}

void sub_20B864A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20B8653F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AVTUpgradesForPresetCategory(unint64_t a1, unsigned int a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v16 = AVTPrecompiledMemojiPresetPlist();
  id v4 = [v16 objectForKeyedSubscript:@"upgrade"];
  float32x4_t v15 = [v4 objectForKeyedSubscript:@"preset-categories"];

  if (v15)
  {
    id v5 = AVTPresetCategoryToString(a1);
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    int v27 = __Block_byref_object_copy__5;
    float32x4_t v28 = __Block_byref_object_dispose__5;
    id v29 = 0;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v15;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"upgrade-if-version-less-than", v15);
          float v12 = v11;
          if (!v11 || [v11 unsignedIntegerValue] > (unint64_t)a2)
          {
            v17[0] = MEMORY[0x263EF8330];
            v17[1] = 3221225472;
            v17[2] = __AVTUpgradesForPresetCategory_block_invoke;
            v17[3] = &unk_264020DE0;
            id v18 = v5;
            float v19 = &v24;
            [v10 enumerateKeysAndObjectsUsingBlock:v17];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
      }
      while (v7);
    }

    id v13 = (id)v25[5];
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void sub_20B86737C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *AVTPresetCategoryToString(unint64_t a1)
{
  if (a1 > 0x27) {
    return 0;
  }
  else {
    return off_264020ED8[a1];
  }
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __AVTUpgradesForPresetCategory_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 isEqualToString:*(void *)(a1 + 32)])
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v6)
    {
      [v6 addObject:v10];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x263EFF980] arrayWithObject:v10];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
  }
}

id AVTUpgradePresetIdentifierIfNeeded(unint64_t a1, void *a2, unsigned int a3)
{
  id v5 = a2;
  id v6 = AVTPrecompiledMemojiPresetPlist();
  uint64_t v7 = [v6 objectForKeyedSubscript:@"upgrade"];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"preset-identifiers"];

  id v9 = _AVTRemapIdentifier(a1, v5, a3, v8);

  return v9;
}

id _AVTRemapIdentifier(unint64_t a1, void *a2, unsigned int a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    uint64_t v25 = AVTPresetCategoryToString(a1);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v23 = v8;
    id obj = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      unint64_t v12 = a3;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          float32x4_t v15 = [v14 objectForKeyedSubscript:@"upgrade-if-version-less-than"];
          id v16 = v15;
          if (!v15 || [v15 unsignedIntegerValue] > v12)
          {
            float v17 = [v14 objectForKeyedSubscript:v25];
            id v18 = [v17 objectForKeyedSubscript:v7];
            float v19 = v18;
            if (v18)
            {
              id v20 = v18;

              id v7 = v20;
            }
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v10);
    }

    id v21 = v7;
    id v8 = v23;
  }
  else
  {
    id v21 = v7;
  }

  return v21;
}

id AVTPresetCategoriesPairs()
{
  v7[2] = *MEMORY[0x263EF8340];
  v5[0] = @"earrings_left";
  v5[1] = @"earrings_right";
  v6[0] = @"earrings";
  id v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  v6[1] = @"audio";
  v7[0] = v0;
  v4[0] = @"audio_left";
  v4[1] = @"audio_right";
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  v7[1] = v1;
  id v2 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v2;
}

id AVTUpgradePairedPresetCategoriesIfNeeded(void *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v1 = a1;
  AVTPresetCategoriesPairs();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  id v2 = 0;
  if (v17)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v5 = [v1 objectForKeyedSubscript:v4];

        if (v5)
        {
          if (!v2) {
            id v2 = (void *)[v1 mutableCopy];
          }
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v6 = [obj objectForKeyedSubscript:v4];
          uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v8; ++j)
              {
                if (*(void *)v20 != v9) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * j);
                unint64_t v12 = [v1 objectForKeyedSubscript:v4];
                [v2 setObject:v12 forKeyedSubscript:v11];
              }
              uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v8);
          }
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v17);
  }
  if (v2) {
    id v13 = v2;
  }
  else {
    id v13 = v1;
  }
  id v14 = v13;

  return v14;
}

id AVTUpgradeColorPresetIdentifierIfNeeded(unint64_t a1, void *a2, unsigned int a3)
{
  id v5 = a2;
  id v6 = AVTColorPalettes();
  uint64_t v7 = [v6 objectForKeyedSubscript:@"upgrade"];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"color-preset-identifiers"];

  uint64_t v9 = _AVTRemapIdentifier(a1, v5, a3, v8);

  return v9;
}

id AVTIdentifierOfUpgradedColorPresetForAssetPresetIdentifier(unint64_t a1, void *a2, unint64_t a3, _DWORD *a4, unsigned int a5)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v42 = a2;
  uint64_t v8 = AVTPrecompiledMemojiPresetPlist();
  uint64_t v9 = [v8 objectForKeyedSubscript:@"upgrade"];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"preset-colors"];

  if (v10)
  {
    uint64_t v11 = AVTPresetCategoryToString(a1);
    if (a3 >= 3)
    {
      id v30 = avt_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        AVTIdentifierOfUpgradedColorPresetForAssetPresetIdentifier_cold_1(v30);
      }

      id v29 = 0;
    }
    else
    {
      float v32 = v10;
      simd_float4 v33 = v8;
      float32x2_t v37 = off_264021018[a3];
      __int32 v39 = off_264021030[a3];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id obj = v10;
      uint64_t v12 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        float32x4_t v41 = 0;
        uint64_t v14 = *(void *)v44;
        unint64_t v15 = a5;
        uint64_t v35 = *(void *)v44;
        unint64_t v36 = a5;
        simd_float4 v34 = v11;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v44 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            id v18 = [v17 objectForKeyedSubscript:@"upgrade-if-version-less-than"];
            long long v19 = v18;
            if (!v18 || [v18 unsignedIntegerValue] > v15)
            {
              long long v20 = [v17 objectForKeyedSubscript:v11];
              long long v21 = [v20 objectForKeyedSubscript:v42];
              long long v22 = v21;
              if (v21)
              {
                uint64_t v23 = v13;
                long long v24 = [v21 objectForKeyedSubscript:v39];
                long long v25 = v24;
                if (v24)
                {
                  id v26 = v24;

                  long long v27 = [v22 objectForKeyedSubscript:v37];
                  [v27 floatValue];
                  *a4 = v28;

                  float32x4_t v41 = v26;
                  uint64_t v11 = v34;
                  uint64_t v14 = v35;
                  unint64_t v15 = v36;
                }

                uint64_t v13 = v23;
              }
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
        }
        while (v13);
      }
      else
      {
        float32x4_t v41 = 0;
      }

      id v29 = v41;
      uint64_t v10 = v32;
      uint64_t v8 = v33;
    }
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

uint64_t AVTPresetCategoryIsPrerelease()
{
  return 0;
}

uint64_t AVTPresetCategoryIsPairable(unint64_t a1)
{
  return (a1 < 0x20) & (0xC6000000 >> a1);
}

BOOL AVTPresetCategoryIsOnLeftInPair(uint64_t a1)
{
  return a1 == 30 || a1 == 25;
}

BOOL AVTPresetCategoryIsOnRightInPair(uint64_t a1)
{
  return a1 == 31 || a1 == 26;
}

__CFString *AVTPresetCategoryPairToString(unint64_t a1)
{
  unint64_t v1 = a1 - 25;
  if (a1 - 25 < 7 && ((0x63u >> v1) & 1) != 0)
  {
    id v2 = off_264021048[v1];
  }
  else
  {
    AVTPresetCategoryToString(a1);
    id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *AVTPresetCategoryToColorCategoryString(unint64_t a1)
{
  if (a1 - 25 < 2)
  {
    id v2 = @"audio";
  }
  else if (a1 - 30 >= 2)
  {
    if (a1)
    {
      AVTPresetCategoryToString(a1);
      id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v2 = @"skin";
    }
  }
  else
  {
    id v2 = @"earrings";
  }
  return v2;
}

uint64_t AVTColorCategoryFromString(void *a1)
{
  id v1 = a1;
  if (AVTColorCategoryFromString_onceToken != -1) {
    dispatch_once(&AVTColorCategoryFromString_onceToken, &__block_literal_global_20);
  }
  id v2 = [(id)AVTColorCategoryFromString_nameToCategory objectForKeyedSubscript:v1];
  if (v2)
  {
    id v3 = [(id)AVTColorCategoryFromString_nameToCategory objectForKeyedSubscript:v1];
    uint64_t v4 = (int)[v3 intValue];
  }
  else
  {
    uint64_t v4 = 40;
  }

  return v4;
}

void __AVTColorCategoryFromString_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:40];
  id v1 = (void *)AVTColorCategoryFromString_nameToCategory;
  AVTColorCategoryFromString_nameToCategory = v0;

  for (unint64_t i = 0; i != 40; ++i)
  {
    id v3 = [NSNumber numberWithInteger:i];
    uint64_t v4 = (void *)AVTColorCategoryFromString_nameToCategory;
    id v5 = AVTPresetCategoryToColorCategoryString(i);
    [v4 setObject:v3 forKeyedSubscript:v5];
  }
}

uint64_t AVTPresetCategoryFromString(void *a1)
{
  id v1 = a1;
  if (AVTPresetCategoryFromString_onceToken != -1) {
    dispatch_once(&AVTPresetCategoryFromString_onceToken, &__block_literal_global_192);
  }
  id v2 = [(id)AVTPresetCategoryFromString_nameToCategory objectForKeyedSubscript:v1];
  if (v2)
  {
    id v3 = [(id)AVTPresetCategoryFromString_nameToCategory objectForKeyedSubscript:v1];
    uint64_t v4 = [v3 integerValue];
  }
  else
  {
    uint64_t v4 = 40;
  }

  return v4;
}

void __AVTPresetCategoryFromString_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:40];
  id v1 = (void *)AVTPresetCategoryFromString_nameToCategory;
  AVTPresetCategoryFromString_nameToCategory = v0;

  for (unint64_t i = 0; i != 40; ++i)
  {
    id v3 = [NSNumber numberWithInteger:i];
    uint64_t v4 = (void *)AVTPresetCategoryFromString_nameToCategory;
    id v5 = AVTPresetCategoryToString(i);
    [v4 setObject:v3 forKeyedSubscript:v5];
  }
}

uint64_t AVTPresetCategoryToComponentType(unint64_t a1)
{
  if (a1 >= 0x29) {
    AVTPresetCategoryToComponentType_cold_1();
  }
  return qword_20B890300[a1];
}

uint64_t AVTAvatarBodyPartForComponentType(uint64_t a1)
{
  if ((unint64_t)(a1 - 34) > 7) {
    return 1;
  }
  else {
    return qword_20B890448[a1 - 34];
  }
}

uint64_t AVTEnumeratePresetCategories(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    for (uint64_t i = 0; i != 40; ++i)
      double result = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, i);
  }
  return result;
}

void AVTEvaluateNameMatchingRules(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    id v7 = a1;
    uint64_t v8 = [v7 objectForKeyedSubscript:@"exclude"];
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass() & 1;
    objc_opt_class();
    char v10 = objc_opt_isKindOfClass() & 1;
    uint64_t v11 = [v7 objectForKeyedSubscript:@"include"];

    objc_opt_class();
    LOBYTE(v7) = objc_opt_isKindOfClass() & 1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __AVTEvaluateNameMatchingRules_block_invoke;
    v16[3] = &unk_264020E08;
    char v13 = isKindOfClass & 1;
    char v20 = v9;
    char v21 = v10;
    char v22 = (char)v7;
    id v17 = v8;
    id v18 = v11;
    id v19 = v5;
    char v23 = v13;
    id v14 = v11;
    id v15 = v8;
    [v6 enumerateHierarchyUsingBlock:v16];
  }
}

void __AVTEvaluateNameMatchingRules_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 name];
  id v5 = v4;
  if (!v4) {
    goto LABEL_30;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    if ([v4 containsString:*(void *)(a1 + 32)]) {
      goto LABEL_30;
    }
  }
  else if (*(unsigned char *)(a1 + 57))
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
LABEL_8:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([v5 containsString:*(void *)(*((void *)&v19 + 1) + 8 * v10)]) {
          goto LABEL_29;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
          if (v8) {
            goto LABEL_8;
          }
          break;
        }
      }
    }
  }
  if (!*(unsigned char *)(a1 + 58))
  {
    if (!*(unsigned char *)(a1 + 59)) {
      goto LABEL_30;
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = *(id *)(a1 + 40);
    uint64_t v11 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(v5, "containsString:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15))
          {
            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
            goto LABEL_29;
          }
        }
        uint64_t v12 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_29:

    goto LABEL_30;
  }
  if ([v5 containsString:*(void *)(a1 + 40)]) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_30:
}

void __AVTPresetLoadPresetsIfNeeded_block_invoke()
{
  AVTPrecompiledMemojiPresetPlist();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_319];
  [v0 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_361];
}

void sub_20B86AD78(_Unwind_Exception *a1)
{
  __destructor_8_s72_s80(v1);
  _Unwind_Resume(a1);
}

void __destructor_8_s72_s80(uint64_t a1)
{
  id v2 = *(void **)(a1 + 80);
}

void sub_20B86AFDC(_Unwind_Exception *a1)
{
  __destructor_8_s72_s80(v1);
  _Unwind_Resume(a1);
}

id AVTSetInitialValuesExportedAsAnimations(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v36 = a1;
  id v7 = a2;
  uint64_t v8 = a4;
  if (a3)
  {
    id v12 = 0;
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      AVTSetInitialValuesExportedAsAnimations_cold_1();
    }
    id v13 = v7;
    id v14 = [v13 animations];
    long long v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v14, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      simd_float4 v34 = v13;
      id v35 = v7;
      char v19 = 0;
      uint64_t v20 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v38 != v20) {
            objc_enumerationMutation(v16);
          }
          long long v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          char v23 = AVTSetInitialValuesExportedAsAnimations(v36, v22, a3, v8);
          if (v23) {
            [v15 addObject:v23];
          }
          v19 |= v23 != v22;
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v18);

      id v13 = v34;
      id v7 = v35;
      if (v19)
      {
        if ([v15 count])
        {
          id v12 = (id)[v34 copy];
          [v12 setAnimations:v15];
        }
        else
        {
          id v12 = 0;
        }
        goto LABEL_27;
      }
    }
    else
    {
    }
    id v12 = v13;
LABEL_27:

    goto LABEL_28;
  }
  id v9 = v7;
  uint64_t v10 = [v9 keyTimes];
  uint64_t v11 = [v10 count];

  if ((a3 & 2) != 0 || v11 == 1)
  {
    long long v24 = [v9 values];
    uint64_t v25 = [v24 objectAtIndexedSubscript:0];

    id v26 = [v9 keyPath];
    [v36 setValue:v25 forKeyPath:v26];

    long long v27 = [v9 keyTimes];
    unint64_t v28 = [v27 count];

    if (v8 && v28 >= 2)
    {
      id v29 = NSString;
      id v30 = [v36 name];
      uint64_t v31 = [v9 keyTimes];
      float v32 = [v29 stringWithFormat:@"Removed animation with more than one keyframe from \"%@\" (%d keyframes)", v30, objc_msgSend(v31, "count")];
      v8[2](v8, v32);
    }
    id v12 = 0;
  }
  else
  {
    id v12 = v9;
  }

LABEL_28:
  return v12;
}

id AVTCloneNodesAndMaterials(void *a1)
{
  uint64_t v1 = (objc_class *)MEMORY[0x263F08968];
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithKeyOptions:0 valueOptions:0 capacity:0];
  uint64_t v4 = _AVTNodeDeepCopyWithCache(v2, v2, v3);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = ___AVTNodeDeepCopy_block_invoke;
  void v7[3] = &unk_26401F2B0;
  id v8 = v3;
  id v5 = v3;
  [v2 enumerateHierarchyUsingBlock:v7];

  return v4;
}

void _AVTSplitShaderModifier(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v26 = a1;
  id v9 = a2;
  unint64_t v10 = [v26 rangeOfString:@"#pragma arguments\n"];
  unint64_t v11 = [v26 rangeOfString:@"#pragma declaration\n"];
  uint64_t v12 = [v26 rangeOfString:@"#pragma body\n"];
  uint64_t v14 = v13;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v10 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v15 = v10 - v11, v10 <= v11))
    {
      id v16 = v26;
      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
        _AVTSplitShaderModifier_cold_4();
      }
      unint64_t v15 = v12 - v11;
    }
    else
    {
      id v16 = v26;
    }
    char v19 = objc_msgSend(v16, "substringWithRange:", v11, v15);
    goto LABEL_15;
  }
  if ([v26 containsString:@"#pragma declaration\n"]) {
    _AVTSplitShaderModifier_cold_5();
  }
  if (v10 && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    char v19 = [v26 substringToIndex:v10];
LABEL_15:
    id v17 = v19;
    goto LABEL_16;
  }
  id v17 = 0;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v12)
  {
    *a3 = [v26 substringToIndex:v12];
    uint64_t v18 = v26;
    goto LABEL_26;
  }
LABEL_16:
  *a3 = v17;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v18 = v26;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL && v11 > v10)
    {
      objc_msgSend(v26, "substringWithRange:", v10, v11 - v10);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
LABEL_26:
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      _AVTSplitShaderModifier_cold_3();
    }
    objc_msgSend(v18, "substringWithRange:", v10, v12 - v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if ([v26 containsString:@"#pragma arguments"]) {
    _AVTSplitShaderModifier_cold_1();
  }
  id v20 = 0;
LABEL_22:
  *a4 = v20;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_28:
    if (v9)
    {
      long long v22 = objc_msgSend(v26, "substringWithRange:", v12, v14);
      char v23 = objc_msgSend(v26, "substringWithRange:", v12 + v14, objc_msgSend(v26, "length") - (v12 + v14));
      long long v24 = v9[2](v9, v23);

      *a5 = [v22 stringByAppendingString:v24];

      goto LABEL_34;
    }
    long long v21 = objc_msgSend(v26, "substringWithRange:", v12, objc_msgSend(v26, "length") - v12);
    goto LABEL_31;
  }
  if ([v26 containsString:@"#pragma body"]) {
    _AVTSplitShaderModifier_cold_2();
  }
  if (!v9)
  {
    id v25 = v26;
    goto LABEL_33;
  }
  long long v21 = v9[2](v9, v26);
LABEL_31:
  id v25 = v21;
LABEL_33:
  *a5 = v25;
LABEL_34:
}

id AVTMergeShaderModifiers(void *a1, void *a2, void *a3, void *a4)
{
  v21[4] = *MEMORY[0x263EF8340];
  id v20 = a1;
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v21[0] = (id)*MEMORY[0x263F16BE0];
  v21[1] = (id)*MEMORY[0x263F16BF0];
  v21[2] = (id)*MEMORY[0x263F16BE8];
  v21[3] = (id)*MEMORY[0x263F16BD8];
  unint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:4];
  for (uint64_t i = 0; i != 4; ++i)
  {
    id v12 = (id)v21[i];
    uint64_t v13 = [v20 objectForKeyedSubscript:v12];
    uint64_t v14 = [v8 objectForKeyedSubscript:v12];
    unint64_t v15 = AVTMergeShaderModifiersForEntryPoint(v13, v7, v14, v9);
    if (v15) {
      [v10 setObject:v15 forKeyedSubscript:v12];
    }
  }
  if ([v10 count]) {
    id v16 = v10;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  for (uint64_t j = 3; j != -1; --j)
  return v17;
}

id AVTMergeShaderModifiersForEntryPoint(void *a1, void *a2, void *a3, void *a4)
{
  unint64_t v7 = a1;
  unint64_t v8 = a2;
  unint64_t v9 = a3;
  unint64_t v10 = a4;
  if (v7 | v10)
  {
    if (v8 | v9)
    {
      id v25 = 0;
      id v26 = 0;
      id v24 = 0;
      _AVTSplitShaderModifier((void *)v7, (void *)v8, &v26, &v25, &v24);
      id v13 = v26;
      id v14 = v25;
      id v15 = v24;
      id v20 = v13;
      if (v10)
      {
        id v22 = 0;
        id v23 = 0;
        id v21 = 0;
        _AVTSplitShaderModifier((void *)v9, (void *)v10, &v23, &v22, &v21);
        id v16 = v23;
        id v17 = v22;
        id v18 = v21;
        id v12 = AVTMergeShaderModifiersForEntryPointWithPartsAndParts(v13, v14, v15, v16, v17, v18);
      }
      else
      {
        id v12 = AVTMergeShaderModifiersForEntryPointWithPartsAndCode(v13, v14, v15, (void *)v9);
      }

      goto LABEL_10;
    }
    id v11 = (id)v7;
  }
  else
  {
    id v11 = (id)v9;
  }
  id v12 = v11;
LABEL_10:

  return v12;
}

id AVTMergeShaderModifiersForEntryPointWithPartsAndParts(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (v14) {
    id v17 = v14;
  }
  else {
    id v17 = &stru_26BFE2E80;
  }
  id v18 = v17;
  if ([v11 length])
  {
    uint64_t v19 = [(__CFString *)v18 rangeOfString:@"#pragma declaration\n"];
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([(__CFString *)v18 containsString:@"#pragma declaration"]) {
        AVTMergeShaderModifiersForEntryPointWithPartsAndParts_cold_3();
      }
      id v21 = (__CFString *)v11;
    }
    else
    {
      -[__CFString stringByReplacingCharactersInRange:withString:](v18, "stringByReplacingCharactersInRange:withString:", v19, v20, v11);
      id v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    id v22 = v21;

    id v18 = v22;
  }
  if (v15) {
    id v23 = v15;
  }
  else {
    id v23 = &stru_26BFE2E80;
  }
  id v24 = v23;
  long long v44 = v12;
  if ([v12 length])
  {
    uint64_t v25 = [(__CFString *)v24 rangeOfString:@"#pragma arguments\n"];
    if (v25 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([(__CFString *)v24 containsString:@"#pragma arguments"]) {
        AVTMergeShaderModifiersForEntryPointWithPartsAndParts_cold_2();
      }
      long long v27 = (__CFString *)v12;
    }
    else
    {
      -[__CFString stringByReplacingCharactersInRange:withString:](v24, "stringByReplacingCharactersInRange:withString:", v25, v26, v12);
      long long v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    unint64_t v28 = v27;

    id v24 = v28;
  }
  if (v16) {
    id v29 = v16;
  }
  else {
    id v29 = &stru_26BFE2E80;
  }
  id v30 = v29;
  if ([v13 length])
  {
    uint64_t v31 = [(__CFString *)v30 rangeOfString:@"#pragma body\n"];
    if (v31 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([(__CFString *)v30 containsString:@"#pragma body"]) {
        AVTMergeShaderModifiersForEntryPointWithPartsAndParts_cold_1();
      }
      simd_float4 v33 = v14;
      id v34 = v11;
      uint64_t v35 = [(__CFString *)v30 rangeOfString:@"#pragma transparent\n"];
      if (v35 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v39 = v35;
        uint64_t v43 = v36;
        long long v38 = (__CFString *)[(__CFString *)v30 mutableCopy];
        [(__CFString *)v38 insertString:v13 atIndex:v39 + v43];
        goto LABEL_30;
      }
      long long v37 = (__CFString *)v13;
    }
    else
    {
      simd_float4 v33 = v14;
      id v34 = v11;
      -[__CFString stringByReplacingCharactersInRange:withString:](v30, "stringByReplacingCharactersInRange:withString:", v31, v32, v13);
      long long v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    long long v38 = v37;
LABEL_30:

    id v30 = v38;
    id v11 = v34;
    id v14 = v33;
  }
  long long v40 = [(__CFString *)v18 stringByAppendingString:v24];
  float32x4_t v41 = [v40 stringByAppendingString:v30];

  return v41;
}

__CFString *AVTMergeShaderModifiersForEntryPointWithPartsAndCode(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  unint64_t v10 = a4;
  if (![v9 length])
  {
    id v12 = v10;
    goto LABEL_26;
  }
  id v11 = &stru_26BFE2E80;
  if (v10) {
    id v11 = v10;
  }
  id v12 = v11;
  if ([v7 length])
  {
    uint64_t v13 = [(__CFString *)v12 rangeOfString:@"#pragma declaration\n"];
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([(__CFString *)v12 containsString:@"#pragma declaration"]) {
        AVTMergeShaderModifiersForEntryPointWithPartsAndCode_cold_3();
      }
      uint64_t v15 = [v7 stringByAppendingString:v12];
    }
    else
    {
      uint64_t v15 = -[__CFString stringByReplacingCharactersInRange:withString:](v12, "stringByReplacingCharactersInRange:withString:", v13, v14, v7);
    }
    id v16 = (__CFString *)v15;

    id v12 = v16;
  }
  if ([v8 length])
  {
    uint64_t v17 = [(__CFString *)v12 rangeOfString:@"#pragma arguments\n"];
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([(__CFString *)v12 containsString:@"#pragma arguments"]) {
        AVTMergeShaderModifiersForEntryPointWithPartsAndCode_cold_2();
      }
      uint64_t v19 = [v8 stringByAppendingString:v12];
    }
    else
    {
      uint64_t v19 = -[__CFString stringByReplacingCharactersInRange:withString:](v12, "stringByReplacingCharactersInRange:withString:", v17, v18, v8);
    }
    uint64_t v20 = (__CFString *)v19;

    id v12 = v20;
  }
  if (v9)
  {
    uint64_t v21 = [(__CFString *)v12 rangeOfString:@"#pragma body\n"];
    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([(__CFString *)v12 containsString:@"#pragma body"]) {
        AVTMergeShaderModifiersForEntryPointWithPartsAndCode_cold_1();
      }
      uint64_t v23 = [(__CFString *)v12 rangeOfString:@"#pragma transparent\n"];
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v27 = v23;
        uint64_t v28 = v24;
        uint64_t v26 = (__CFString *)[(__CFString *)v12 mutableCopy];
        [(__CFString *)v26 insertString:v9 atIndex:v27 + v28];
        goto LABEL_25;
      }
      uint64_t v25 = [(__CFString *)v12 stringByAppendingString:v9];
    }
    else
    {
      uint64_t v25 = -[__CFString stringByReplacingCharactersInRange:withString:](v12, "stringByReplacingCharactersInRange:withString:", v21, v22, v9);
    }
    uint64_t v26 = (__CFString *)v25;
LABEL_25:

    id v12 = v26;
  }
LABEL_26:

  return v12;
}

__CFString *AVTMergeShaderModifiersForEntryPointWithCodeAndParts(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if ([v10 length])
  {
    id v11 = &stru_26BFE2E80;
    if (v7) {
      id v11 = v7;
    }
    id v12 = v11;
    if ([v8 length])
    {
      uint64_t v13 = [(__CFString *)v12 rangeOfString:@"#pragma declaration\n"];
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([(__CFString *)v12 containsString:@"#pragma declaration"]) {
          AVTMergeShaderModifiersForEntryPointWithCodeAndParts_cold_2();
        }
        uint64_t v15 = [v8 stringByAppendingString:v12];
      }
      else
      {
        uint64_t v15 = -[__CFString stringByReplacingCharactersInRange:withString:](v12, "stringByReplacingCharactersInRange:withString:", v13, v14, v8);
      }
      uint64_t v17 = (__CFString *)v15;

      id v12 = v17;
    }
    if ([v9 length])
    {
      uint64_t v18 = [(__CFString *)v12 rangeOfString:@"#pragma arguments\n"];
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([(__CFString *)v12 containsString:@"#pragma arguments"]) {
          AVTMergeShaderModifiersForEntryPointWithCodeAndParts_cold_1();
        }
        uint64_t v20 = [v9 stringByAppendingString:v12];
      }
      else
      {
        uint64_t v20 = -[__CFString stringByReplacingCharactersInRange:withString:](v12, "stringByReplacingCharactersInRange:withString:", v18, v19, v9);
      }
      uint64_t v21 = (__CFString *)v20;

      id v12 = v21;
    }
    id v16 = [(__CFString *)v12 stringByAppendingString:v10];
  }
  else
  {
    id v16 = v7;
  }

  return v16;
}

id _AVTNodeDeepCopyWithCache(void *a1, void *a2, void *a3)
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [v7 objectForKey:v6];
  if (v8)
  {
    id v9 = v8;
    goto LABEL_56;
  }
  id v10 = objc_alloc_init(MEMORY[0x263F16A98]);
  [v7 setObject:v10 forKey:v6];
  id v11 = [v6 name];
  [v10 setName:v11];

  [v6 simdTransform];
  objc_msgSend(v10, "setSimdTransform:");
  objc_msgSend(v10, "setHidden:", objc_msgSend(v6, "isHidden"));
  [v6 opacity];
  objc_msgSend(v10, "setOpacity:");
  objc_msgSend(v10, "setRenderingOrder:", objc_msgSend(v6, "renderingOrder"));
  objc_msgSend(v10, "setCategoryBitMask:", objc_msgSend(v6, "categoryBitMask"));
  id v12 = [v6 light];
  [v10 setLight:v12];

  uint64_t v13 = [v6 camera];
  [v10 setCamera:v13];

  objc_msgSend(v10, "setCastsShadow:", objc_msgSend(v6, "castsShadow"));
  objc_msgSend(v10, "setUsesDepthPrePass:", objc_msgSend(v6, "usesDepthPrePass"));
  uint64_t v14 = [v6 valueForKey:@"_valueForKey"];
  v97[0] = MEMORY[0x263EF8330];
  v97[1] = 3221225472;
  v97[2] = ___AVTNodeDeepCopyWithCache_block_invoke;
  v97[3] = &unk_2640205D0;
  id v15 = v10;
  id v98 = v15;
  [v14 enumerateKeysAndObjectsUsingBlock:v97];
  uint64_t v16 = [v6 geometry];
  char v78 = (void *)v16;
  v79 = v14;
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    uint64_t v18 = [v7 objectForKey:v16];
    if (!v18)
    {
      id v74 = v6;
      uint64_t v19 = (void *)[v17 copy];
      [v7 setObject:v19 forKey:v17];
      uint64_t v20 = [v17 tessellator];
      uint64_t v21 = (void *)[v20 copy];
      v76 = v19;
      [v19 setTessellator:v21];

      uint64_t v22 = (void *)MEMORY[0x263EFF980];
      uint64_t v23 = [v17 materials];
      uint64_t v24 = objc_msgSend(v22, "arrayWithCapacity:", objc_msgSend(v23, "count"));

      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      uint64_t v25 = [v17 materials];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v93 objects:v102 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v94;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v94 != v28) {
              objc_enumerationMutation(v25);
            }
            id v30 = *(void **)(*((void *)&v93 + 1) + 8 * i);
            uint64_t v31 = [v7 objectForKey:v30];
            if (!v31)
            {
              uint64_t v31 = (void *)[v30 copy];
              [v7 setObject:v31 forKey:v30];
            }
            [v24 addObject:v31];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v93 objects:v102 count:16];
        }
        while (v27);
      }

      uint64_t v18 = v76;
      [v76 setMaterials:v24];

      id v6 = v74;
    }
    [v15 setGeometry:v18];
  }
  uint64_t v32 = [v6 morpher];
  if (v32)
  {
    simd_float4 v33 = [v7 objectForKey:v32];
    if (!v33)
    {
      simd_float4 v33 = (void *)[v32 copy];
      [v7 setObject:v33 forKey:v32];
    }
    [v15 setMorpher:v33];
  }
  uint64_t v77 = v32;
  id v34 = [v6 skinner];
  if (v34)
  {
    uint64_t v35 = [v7 objectForKey:v34];
    if (v35)
    {
LABEL_47:
      objc_msgSend(v15, "setSkinner:", v35, v70);

      goto LABEL_48;
    }
    uint64_t v36 = [v34 bones];
    long long v37 = [v34 skeleton];
    long long v38 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v36, "count"));
    v73 = v36;
    id v75 = v6;
    long long v72 = v37;
    if (!v37) {
      goto LABEL_28;
    }
    id v39 = v37;
    if (v39 == v5)
    {
    }
    else
    {
      id v40 = v39;
      do
      {
        float32x4_t v41 = v40;
        id v40 = [v40 parentNode];
      }
      while (v40 && v40 != v5);

      if (!v40)
      {
LABEL_28:
        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        id v42 = v36;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v85 objects:v100 count:16];
        if (!v43)
        {
          long long v71 = 0;
          goto LABEL_46;
        }
        uint64_t v44 = v43;
        long long v70 = v34;
        uint64_t v45 = *(void *)v86;
        do
        {
          for (uint64_t j = 0; j != v44; ++j)
          {
            if (*(void *)v86 != v45) {
              objc_enumerationMutation(v42);
            }
            uint64_t v47 = *(void **)(*((void *)&v85 + 1) + 8 * j);
            id v48 = objc_alloc_init(MEMORY[0x263F16A98]);
            uint64_t v49 = [v47 name];
            [v48 setName:v49];

            [v38 addObject:v48];
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v85 objects:v100 count:16];
        }
        while (v44);
        long long v71 = 0;
        goto LABEL_44;
      }
    }
    float32x4_t v50 = [v34 skeleton];
    long long v71 = _AVTNodeDeepCopyWithCache(v5, v50, v7);

    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v51 = v36;
    uint64_t v52 = [v51 countByEnumeratingWithState:&v89 objects:v101 count:16];
    if (!v52)
    {
LABEL_46:

      unsigned int v57 = (void *)MEMORY[0x263F16AE0];
      float v58 = [v15 geometry];
      unsigned int v59 = [v34 boneInverseBindTransforms];
      float32x4_t v60 = [v34 boneWeights];
      float v61 = [v34 boneIndices];
      uint64_t v35 = [v57 skinnerWithBaseGeometry:v58 bones:v38 boneInverseBindTransforms:v59 boneWeights:v60 boneIndices:v61];

      [v34 baseGeometryBindTransform];
      v84[0] = v84[4];
      v84[1] = v84[5];
      v84[2] = v84[6];
      v84[3] = v84[7];
      [v35 setBaseGeometryBindTransform:v84];
      [v35 setSkeleton:v71];
      [v7 setObject:v35 forKey:v34];

      id v6 = v75;
      goto LABEL_47;
    }
    uint64_t v53 = v52;
    long long v70 = v34;
    uint64_t v54 = *(void *)v90;
    do
    {
      for (uint64_t k = 0; k != v53; ++k)
      {
        if (*(void *)v90 != v54) {
          objc_enumerationMutation(v51);
        }
        unsigned int v56 = _AVTNodeDeepCopyWithCache(v5, *(void *)(*((void *)&v89 + 1) + 8 * k), v7);
        [v38 addObject:v56];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v89 objects:v101 count:16];
    }
    while (v53);
LABEL_44:
    id v34 = v70;
    uint64_t v36 = v73;
    goto LABEL_46;
  }
LABEL_48:
  simd_float4x4 v62 = v34;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  simd_float4x4 v63 = [v6 childNodes];
  uint64_t v64 = [v63 countByEnumeratingWithState:&v80 objects:v99 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v81;
    do
    {
      for (uint64_t m = 0; m != v65; ++m)
      {
        if (*(void *)v81 != v66) {
          objc_enumerationMutation(v63);
        }
        long long v68 = _AVTNodeDeepCopyWithCache(v5, *(void *)(*((void *)&v80 + 1) + 8 * m), v7);
        [v15 addChildNode:v68];
      }
      uint64_t v65 = [v63 countByEnumeratingWithState:&v80 objects:v99 count:16];
    }
    while (v65);
  }

  id v9 = v15;
LABEL_56:

  return v9;
}

void _AVTMemojiRandomize(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  uint64_t v5 = 0;
  uint64_t v23 = v25;
  do
  {
    id v6 = +[AVTPreset availablePresetsForCategory:](AVTPreset, "availablePresetsForCategory:", v5, v23);
    if ([v6 count])
    {
      uint32_t v7 = arc4random_uniform([v6 count]);
      double v8 = 1.0;
      if ((unint64_t)(v5 - 1) <= 0x22) {
        double v8 = dbl_20B8905A8[v5 - 1];
      }
      if (_AVTMemojiRandomizationInitializeRand_onceToken != -1) {
        dispatch_once(&_AVTMemojiRandomizationInitializeRand_onceToken, &__block_literal_global_533);
      }
      if (drand48() <= v8)
      {
        uint64_t v10 = v7;
      }
      else
      {
        uint64_t v9 = [v6 indexOfObjectPassingTest:&__block_literal_global_531];
        if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v10 = 0;
        }
        else {
          uint64_t v10 = v9;
        }
      }
      id v11 = [v6 objectAtIndex:v10];
      v3[2](v3, v11, v5);
    }
    id v12 = +[AVTColorPreset colorPresetsForCategory:v5];
    if ([v12 count])
    {
      uint32_t v13 = arc4random_uniform([v12 count]);
      if (v5)
      {
        if (v5 == 10)
        {
          uint32_t v14 = 1;
        }
        else
        {
          if (v5 != 1)
          {
LABEL_21:
            id v15 = [v12 objectAtIndex:v13];
            if (_AVTMemojiRandomizationInitializeRand_onceToken != -1) {
              dispatch_once(&_AVTMemojiRandomizationInitializeRand_onceToken, &__block_literal_global_533);
            }
            double v16 = drand48();
            *(float *)&double v16 = v16;
            *(float *)&double v16 = (float)(*(float *)&v16 * 2.0) + -1.0;
            uint64_t v17 = [v15 colorPresetWithVariation:v16];

            v4[2](v4, v17, v5, 0);
            v24[0] = MEMORY[0x263EF8330];
            v24[1] = 3221225472;
            v25[0] = ___AVTMemojiRandomize_block_invoke_2;
            v25[1] = &unk_264021438;
            uint64_t v26 = v4;
            [v17 enumerateDerivedColorPresetsUsingBlock:v24];

            goto LABEL_24;
          }
          uint32_t v14 = 7;
        }
      }
      else
      {
        uint32_t v14 = 8;
      }
      uint32_t v13 = arc4random_uniform(v14);
      goto LABEL_21;
    }
LABEL_24:
    if (v5 != 7)
    {
      for (uint64_t i = 1; i != 3; ++i)
      {
        uint64_t v19 = v12;
        id v12 = +[AVTPreset colorPresetsForCategory:v5 colorIndex:i];

        if ([v12 count])
        {
          uint64_t v20 = objc_msgSend(v12, "objectAtIndex:", arc4random_uniform(objc_msgSend(v12, "count")));
          if (_AVTMemojiRandomizationInitializeRand_onceToken != -1) {
            dispatch_once(&_AVTMemojiRandomizationInitializeRand_onceToken, &__block_literal_global_533);
          }
          double v21 = drand48();
          *(float *)&double v21 = v21;
          *(float *)&double v21 = (float)(*(float *)&v21 * 2.0) + -1.0;
          uint64_t v22 = [v20 colorPresetWithVariation:v21];

          v4[2](v4, v22, v5, i);
        }
      }
    }

    ++v5;
  }
  while (v5 != 40);
}

double AVTRGB2HSB(__n128 a1)
{
  if (a1.n128_f32[0] >= a1.n128_f32[1]) {
    float v1 = a1.n128_f32[0];
  }
  else {
    float v1 = a1.n128_f32[1];
  }
  if (a1.n128_f32[0] >= a1.n128_f32[1]) {
    float v2 = a1.n128_f32[1];
  }
  else {
    float v2 = a1.n128_f32[0];
  }
  if (v1 >= a1.n128_f32[2]) {
    float v3 = v1;
  }
  else {
    float v3 = a1.n128_f32[2];
  }
  if (v2 >= a1.n128_f32[2]) {
    float v4 = a1.n128_f32[2];
  }
  else {
    float v4 = v2;
  }
  float v5 = v3 - v4;
  float v6 = 0.0;
  if ((float)(v3 - v4) != 0.0)
  {
    float v7 = (float)((float)(a1.n128_f32[0] - a1.n128_f32[1]) / v5) + 4.0;
    if (a1.n128_f32[1] == v3) {
      float v7 = (float)((float)(a1.n128_f32[2] - a1.n128_f32[0]) / v5) + 2.0;
    }
    float v8 = (float)(a1.n128_f32[1] - a1.n128_f32[2]) / v5;
    if (a1.n128_f32[0] != v3) {
      float v8 = v7;
    }
    float v6 = v8 * 60.0;
    if ((float)(v8 * 60.0) < 0.0) {
      float v6 = v6 + 360.0;
    }
  }
  float v9 = v5 / v3;
  if (v3 == 0.0) {
    float v9 = 0.0;
  }
  *(float *)&double v10 = v6 / 360.0;
  *((float *)&v10 + 1) = v9;
  return v10;
}

double AVTHSB2RGB(__n128 a1)
{
  float v1 = 0.0;
  float v2 = fmaxf(fminf(a1.n128_f32[1], 1.0), 0.0);
  float v3 = fmaxf(fminf(a1.n128_f32[2], 1.0), 0.0);
  if (v2 == 0.0)
  {
    *(float *)&double v4 = v3;
    float v5 = v3;
  }
  else
  {
    float v7 = fmaxf(fminf(a1.n128_f32[0], 1.0), 0.0) * 360.0;
    if (v7 != 360.0) {
      float v1 = v7 / 60.0;
    }
    int v8 = (int)v1;
    float v9 = v1 - (float)(int)v1;
    float v10 = v3 * (float)(1.0 - v2);
    float v11 = v3 * (float)(1.0 - (float)(v2 * v9));
    float v12 = v3 * (float)(1.0 - (float)(v2 * (float)(1.0 - v9)));
    *(float *)&double v4 = v3;
    float v5 = v12;
    switch(v8)
    {
      case 0:
        break;
      case 1:
        *(float *)&double v4 = v11;
        float v5 = v3;
        break;
      case 2:
        *(float *)&double v4 = v10;
        float v5 = v3;
        break;
      case 3:
        *(float *)&double v4 = v10;
        float v5 = v11;
        break;
      case 4:
        *(float *)&double v4 = v12;
        float v5 = v10;
        break;
      default:
        *(float *)&double v4 = v3;
        float v5 = v10;
        break;
    }
  }
  *((float *)&v4 + 1) = v5;
  return v4;
}

void sub_20B8741D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20B874934(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20B874B28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20B8761BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_20B876DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B8783D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B87A434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
}

uint64_t AVTInterpolateBasicAnimationFloat(void *a1, float a2)
{
  id v3 = a1;
  double v4 = [v3 fromValue];
  [v4 floatValue];
  float v6 = v5;

  float v7 = [v3 toValue];

  [v7 floatValue];
  float v9 = v8;

  float v11 = NSNumber;
  *(float *)&double v10 = v6 + (float)(a2 * (float)(v9 - v6));
  return [v11 numberWithFloat:v10];
}

uint64_t AVTInterpolateBasicAnimationFloat4(void *a1, float a2)
{
  id v2 = a1;
  id v3 = [v2 fromValue];
  objc_msgSend(v3, "avt_float4Value");
  float32x4_t v11 = v4;

  float v5 = [v2 toValue];

  objc_msgSend(v5, "avt_float4Value");
  float32x4_t v10 = v6;

  *(void *)&double v7 = vmlaq_n_f32(v11, vsubq_f32(v10, v11), a2).u64[0];
  float v8 = (void *)MEMORY[0x263F08D40];
  return objc_msgSend(v8, "avt_valueWithFloat4_usableWithKVCForSCNVector4:", v7);
}

uint64_t AVTInterpolateBasicAnimationQuaternion(void *a1, float a2)
{
  id v3 = a1;
  float32x4_t v4 = [v3 fromValue];
  objc_msgSend(v4, "avt_float4Value");
  float32x4_t v43 = v5;

  float32x4_t v6 = [v3 toValue];

  objc_msgSend(v6, "avt_float4Value");
  float32x4_t v41 = v7;

  float32x4_t v8 = vmulq_f32(v43, v41);
  float32x4_t v9 = (float32x4_t)vextq_s8((int8x16_t)v8, (int8x16_t)v8, 8uLL);
  *(float32x2_t *)v8.f32 = vadd_f32(*(float32x2_t *)v8.f32, *(float32x2_t *)v9.f32);
  v8.f32[0] = vaddv_f32(*(float32x2_t *)v8.f32);
  v9.i64[0] = 0;
  float32x4_t v10 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v8, v9)), 0), (int8x16_t)vnegq_f32(v41), (int8x16_t)v41);
  float v11 = 1.0;
  float v12 = 1.0 - a2;
  float32x4_t v13 = vsubq_f32(v43, v10);
  int8x16_t v14 = (int8x16_t)vmulq_f32(v13, v13);
  float32x4_t v42 = v10;
  float32x4_t v15 = vaddq_f32(v43, v10);
  int8x16_t v16 = (int8x16_t)vmulq_f32(v15, v15);
  float v17 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v14.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v14, v14, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v16.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v16, v16, 8uLL)))));
  float v18 = v17 + v17;
  BOOL v19 = (float)(v17 + v17) == 0.0;
  float v20 = 1.0;
  if (!v19) {
    float v20 = sinf(v18) / v18;
  }
  float v21 = v20;
  float32x2_t v22 = vrecpe_f32((float32x2_t)LODWORD(v20));
  float32x2_t v23 = vmul_f32(v22, vrecps_f32((float32x2_t)LODWORD(v21), v22));
  LODWORD(v24) = vmul_f32(v23, vrecps_f32((float32x2_t)LODWORD(v21), v23)).u32[0];
  if ((float)(v12 * v18) != 0.0)
  {
    float v39 = v24;
    v23.f32[0] = sinf(v12 * v18);
    float v24 = v39;
    float v11 = v23.f32[0] / (float)(v12 * v18);
  }
  v23.f32[0] = v12 * (float)(v24 * v11);
  float32x4_t v25 = (float32x4_t)vdupq_lane_s32((int32x2_t)v23, 0);
  float v26 = v18 * a2;
  float v27 = 1.0;
  if (v26 != 0.0)
  {
    float32x4_t v38 = v25;
    float v40 = v24;
    float v28 = sinf(v26);
    float32x4_t v25 = v38;
    float v24 = v40;
    float v27 = v28 / v26;
  }
  float32x4_t v29 = vmlaq_f32(vmulq_n_f32(v42, (float)(v24 * v27) * a2), v43, v25);
  int8x16_t v30 = (int8x16_t)vmulq_f32(v29, v29);
  float32x2_t v31 = vadd_f32(*(float32x2_t *)v30.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v30, v30, 8uLL));
  if (vaddv_f32(v31) == 0.0)
  {
    double v32 = 0.0;
  }
  else
  {
    unsigned __int32 v33 = vadd_f32(v31, (float32x2_t)vdup_lane_s32((int32x2_t)v31, 1)).u32[0];
    float32x2_t v34 = vrsqrte_f32((float32x2_t)v33);
    float32x2_t v35 = vmul_f32(v34, vrsqrts_f32((float32x2_t)v33, vmul_f32(v34, v34)));
    *(void *)&double v32 = vmulq_n_f32(v29, vmul_f32(v35, vrsqrts_f32((float32x2_t)v33, vmul_f32(v35, v35))).f32[0]).u64[0];
  }
  uint64_t v36 = (void *)MEMORY[0x263F08D40];
  return objc_msgSend(v36, "avt_valueWithFloat4_usableWithKVCForSCNVector4:", v32);
}

void sub_20B87FD60(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_20B881C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

id AVTPrecompiledAnimojiSpecializationSettings()
{
  if (AVTPrecompiledAnimojiSpecializationSettings_onceToken != -1) {
    dispatch_once(&AVTPrecompiledAnimojiSpecializationSettings_onceToken, &__block_literal_global_24);
  }
  id v0 = (void *)AVTPrecompiledAnimojiSpecializationSettings_kAVTAnimojiPrecompiledPlist_specializationSettings;
  return v0;
}

void __AVTPrecompiledAnimojiSpecializationSettings_block_invoke()
{
  id v0 = (void *)AVTPrecompiledAnimojiSpecializationSettings_kAVTAnimojiPrecompiledPlist_specializationSettings;
  AVTPrecompiledAnimojiSpecializationSettings_kAVTAnimojiPrecompiledPlist_specializationSettings = (uint64_t)&unk_26C016FC8;
}

id AVTPrecompiledMemojiAssetWithIdentifier(void *a1)
{
  uint64_t v1 = AVTPrecompiledMemojiAssetWithIdentifier_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&AVTPrecompiledMemojiAssetWithIdentifier_onceToken, &__block_literal_global_1619);
  }
  id v3 = [(id)AVTPrecompiledMemojiAssetWithIdentifier_kAVTMemojiPrecompiledPlist_assetByIdentifier objectForKeyedSubscript:v2];

  return v3;
}

void __AVTPrecompiledMemojiAssetWithIdentifier_block_invoke()
{
  id v0 = (void *)AVTPrecompiledMemojiAssetWithIdentifier_kAVTMemojiPrecompiledPlist_assetByIdentifier;
  AVTPrecompiledMemojiAssetWithIdentifier_kAVTMemojiPrecompiledPlist_assetByIdentifier = (uint64_t)&unk_26C030B80;
}

id AVTPrecompiledMemojiAssetsForComponentType(unint64_t a1)
{
  if (AVTPrecompiledMemojiAssetsForComponentType_onceToken != -1) {
    dispatch_once(&AVTPrecompiledMemojiAssetsForComponentType_onceToken, &__block_literal_global_16034);
  }
  id v2 = (void *)AVTPrecompiledMemojiAssetsForComponentType_kAVTMemojiPrecompiledPlist_assetIdentifiersByComponentType;
  id v3 = AVTComponentTypeToString(a1);
  float32x4_t v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

void __AVTPrecompiledMemojiAssetsForComponentType_block_invoke()
{
  id v0 = (void *)AVTPrecompiledMemojiAssetsForComponentType_kAVTMemojiPrecompiledPlist_assetIdentifiersByComponentType;
  AVTPrecompiledMemojiAssetsForComponentType_kAVTMemojiPrecompiledPlist_assetIdentifiersByComponentType = (uint64_t)&unk_26C031080;
}

id AVTPrecompiledMemojiCompositorPropertyNames()
{
  if (AVTPrecompiledMemojiCompositorPropertyNames_onceToken != -1) {
    dispatch_once(&AVTPrecompiledMemojiCompositorPropertyNames_onceToken, &__block_literal_global_17703);
  }
  id v0 = (void *)AVTPrecompiledMemojiCompositorPropertyNames_kAVTPrecompiledMemojiCompositorPropertyNames;
  return v0;
}

void __AVTPrecompiledMemojiCompositorPropertyNames_block_invoke()
{
  id v0 = (void *)AVTPrecompiledMemojiCompositorPropertyNames_kAVTPrecompiledMemojiCompositorPropertyNames;
  AVTPrecompiledMemojiCompositorPropertyNames_kAVTPrecompiledMemojiCompositorPropertyNames = (uint64_t)&unk_26C00F750;
}

id AVTPrecompiledMemojiColorPalettes()
{
  if (AVTPrecompiledMemojiColorPalettes_onceToken != -1) {
    dispatch_once(&AVTPrecompiledMemojiColorPalettes_onceToken, &__block_literal_global_17720);
  }
  id v0 = (void *)AVTPrecompiledMemojiColorPalettes_kAVTMemojiPrecompiledPlist_palettes;
  return v0;
}

void __AVTPrecompiledMemojiColorPalettes_block_invoke()
{
  id v0 = (void *)AVTPrecompiledMemojiColorPalettes_kAVTMemojiPrecompiledPlist_palettes;
  AVTPrecompiledMemojiColorPalettes_kAVTMemojiPrecompiledPlist_palettes = (uint64_t)&unk_26C043EB0;
}

id AVTPrecompiledMemojiPresetPlist()
{
  if (AVTPrecompiledMemojiPresetPlist_onceToken != -1) {
    dispatch_once(&AVTPrecompiledMemojiPresetPlist_onceToken, &__block_literal_global_27525);
  }
  id v0 = (void *)AVTPrecompiledMemojiPresetPlist_kAVTMemojiPrecompiledPlist_presets;
  return v0;
}

void __AVTPrecompiledMemojiPresetPlist_block_invoke()
{
  id v0 = (void *)AVTPrecompiledMemojiPresetPlist_kAVTMemojiPrecompiledPlist_presets;
  AVTPrecompiledMemojiPresetPlist_kAVTMemojiPrecompiledPlist_presets = (uint64_t)&unk_26C059C60;
}

id AVTPrecompiledMemojiEditorMetadata()
{
  if (AVTPrecompiledMemojiEditorMetadata_onceToken != -1) {
    dispatch_once(&AVTPrecompiledMemojiEditorMetadata_onceToken, &__block_literal_global_40980);
  }
  id v0 = (void *)AVTPrecompiledMemojiEditorMetadata_kAVTMemojiPrecompiledPlist_editor;
  return v0;
}

void __AVTPrecompiledMemojiEditorMetadata_block_invoke()
{
  id v0 = (void *)AVTPrecompiledMemojiEditorMetadata_kAVTMemojiPrecompiledPlist_editor;
  AVTPrecompiledMemojiEditorMetadata_kAVTMemojiPrecompiledPlist_editor = (uint64_t)&unk_26C063030;
}

id AVTPrecompiledMemojiPrereleaseEditorMetadata()
{
  if (AVTPrecompiledMemojiPrereleaseEditorMetadata_onceToken != -1) {
    dispatch_once(&AVTPrecompiledMemojiPrereleaseEditorMetadata_onceToken, &__block_literal_global_46266);
  }
  id v0 = (void *)AVTPrecompiledMemojiPrereleaseEditorMetadata_kAVTMemojiPrecompiledPlist_editorPrerelease;
  return v0;
}

void __AVTPrecompiledMemojiPrereleaseEditorMetadata_block_invoke()
{
  id v0 = (void *)AVTPrecompiledMemojiPrereleaseEditorMetadata_kAVTMemojiPrecompiledPlist_editorPrerelease;
  AVTPrecompiledMemojiPrereleaseEditorMetadata_kAVTMemojiPrecompiledPlist_editorPrerelease = MEMORY[0x263EFFA78];
}

id AVTPrecompiledToyboxAnimojiNames()
{
  if (AVTPrecompiledToyboxAnimojiNames_onceToken != -1) {
    dispatch_once(&AVTPrecompiledToyboxAnimojiNames_onceToken, &__block_literal_global_46268);
  }
  id v0 = (void *)AVTPrecompiledToyboxAnimojiNames_kAVTWatchFacesPrecompiledPlist_toyboxAnimojiNames;
  return v0;
}

void __AVTPrecompiledToyboxAnimojiNames_block_invoke()
{
  id v0 = (void *)AVTPrecompiledToyboxAnimojiNames_kAVTWatchFacesPrecompiledPlist_toyboxAnimojiNames;
  AVTPrecompiledToyboxAnimojiNames_kAVTWatchFacesPrecompiledPlist_toyboxAnimojiNames = (uint64_t)&unk_26C014238;
}

id _AVTPoseRoundingBehaviour()
{
  if (_AVTPoseRoundingBehaviour_onceToken != -1) {
    dispatch_once(&_AVTPoseRoundingBehaviour_onceToken, &__block_literal_global_26);
  }
  id v0 = (void *)_AVTPoseRoundingBehaviour_behavior;
  return v0;
}

void sub_20B8845F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVTCoordinatorLoadPoseAtPath_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AVTCoordinatorLoadPoseAtPath_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AVTCoordinatorLoadPosesAtPaths_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AVTCoordinatorLoadPosesAtPaths_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AVTCoordinatorLoadPoseAnimationsAtPaths_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___initialiseBlendshapeMappingIfNeeded_block_invoke_cold_1()
{
  __assert_rtn("_initialiseBlendshapeMappingIfNeeded_block_invoke", "AVT_ARKitExtensions.m", 228, "blendshapeNames.count == AVT_APPLECVA_BLENDSHAPE_COUNT");
}

void addAnimation_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_20B819000, a2, a3, "Error: Unreachable code: Unsupported CAPropertyAnimation subclass (%@)", (uint8_t *)a2);
}

void addAnimation_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B819000, log, OS_LOG_TYPE_ERROR, "Error: Unreachable code: Could not infer blendshape name", v1, 2u);
}

void addAnimation_cold_4(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 keyPath];
  int v4 = 138412290;
  float32x4_t v5 = v3;
  _os_log_error_impl(&dword_20B819000, a2, OS_LOG_TYPE_ERROR, "Error: Unreachable code: Unknown animation target %@", (uint8_t *)&v4, 0xCu);
}

void addAnimation_cold_5(os_log_t log, double a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "fabs(delta - beginTime) < 1e-3";
  __int16 v4 = 2048;
  double v5 = a2;
  _os_log_error_impl(&dword_20B819000, log, OS_LOG_TYPE_ERROR, "Error: Condition '%s' failed. We did not expect a beginTime of %.3f", (uint8_t *)&v2, 0x16u);
}

void AVTARKitTransformToSceneKitTransformMatrix_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B819000, a2, OS_LOG_TYPE_ERROR, "Error: Unreachable code: Unsupported worldAlignment %ld", (uint8_t *)&v2, 0xCu);
}

void AVTPrecompiledStickerPackPlist_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __AVTSceneKitSnapshotVersionString_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __AVTInitializeShaderCache_block_invoke_cold_1()
{
  id v0 = [0 path];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B819000, v1, v2, "Error: Can't find Metal library at path %@", v3, v4, v5, v6, v7);
}

void AVTIdentifierOfUpgradedColorPresetForAssetPresetIdentifier_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B819000, log, OS_LOG_TYPE_ERROR, "Error: Unreachable code: Unsupported color index", v1, 2u);
}

void AVTPresetCategoryToComponentType_cold_1()
{
}

void AVTSetInitialValuesExportedAsAnimations_cold_1()
{
}

void _AVTSplitShaderModifier_cold_1()
{
  __assert_rtn("_AVTSplitShaderModifier", "SceneKit+AVTExtensions.m", 1210, "[modifier containsString:kAVTShaderModifierPragmaArgumentsMarker] == NO");
}

void _AVTSplitShaderModifier_cold_2()
{
  __assert_rtn("_AVTSplitShaderModifier", "SceneKit+AVTExtensions.m", 1233, "[modifier containsString:kAVTShaderModifierPragmaBodyMarker] == NO");
}

void _AVTSplitShaderModifier_cold_3()
{
}

void _AVTSplitShaderModifier_cold_4()
{
}

void _AVTSplitShaderModifier_cold_5()
{
  __assert_rtn("_AVTSplitShaderModifier", "SceneKit+AVTExtensions.m", 1173, "[modifier containsString:kAVTShaderModifierPragmaDeclarationLine] == NO");
}

void AVTMergeShaderModifiersForEntryPointWithPartsAndParts_cold_1()
{
  __assert_rtn("AVTMergeShaderModifiersForEntryPointWithPartsAndParts", "SceneKit+AVTExtensions.m", 1472, "[mergedBody containsString:kAVTShaderModifierPragmaBodyMarker] == NO");
}

void AVTMergeShaderModifiersForEntryPointWithPartsAndParts_cold_2()
{
  __assert_rtn("AVTMergeShaderModifiersForEntryPointWithPartsAndParts", "SceneKit+AVTExtensions.m", 1457, "[mergedArguments containsString:kAVTShaderModifierPragmaArgumentsMarker] == NO");
}

void AVTMergeShaderModifiersForEntryPointWithPartsAndParts_cold_3()
{
  __assert_rtn("AVTMergeShaderModifiersForEntryPointWithPartsAndParts", "SceneKit+AVTExtensions.m", 1442, "[mergedDeclarations containsString:kAVTShaderModifierPragmaDeclarationMarker] == NO");
}

void AVTMergeShaderModifiersForEntryPointWithPartsAndCode_cold_1()
{
  __assert_rtn("AVTMergeShaderModifiersForEntryPointWithPartsAndCode", "SceneKit+AVTExtensions.m", 1356, "[mergedCode containsString:kAVTShaderModifierPragmaBodyMarker] == NO");
}

void AVTMergeShaderModifiersForEntryPointWithPartsAndCode_cold_2()
{
  __assert_rtn("AVTMergeShaderModifiersForEntryPointWithPartsAndCode", "SceneKit+AVTExtensions.m", 1342, "[mergedCode containsString:kAVTShaderModifierPragmaArgumentsMarker] == NO");
}

void AVTMergeShaderModifiersForEntryPointWithPartsAndCode_cold_3()
{
  __assert_rtn("AVTMergeShaderModifiersForEntryPointWithPartsAndCode", "SceneKit+AVTExtensions.m", 1326, "[mergedCode containsString:kAVTShaderModifierPragmaDeclarationMarker] == NO");
}

void AVTMergeShaderModifiersForEntryPointWithCodeAndParts_cold_1()
{
  __assert_rtn("AVTMergeShaderModifiersForEntryPointWithCodeAndParts", "SceneKit+AVTExtensions.m", 1409, "[mergedCode containsString:kAVTShaderModifierPragmaArgumentsMarker] == NO");
}

void AVTMergeShaderModifiersForEntryPointWithCodeAndParts_cold_2()
{
  __assert_rtn("AVTMergeShaderModifiersForEntryPointWithCodeAndParts", "SceneKit+AVTExtensions.m", 1393, "[mergedCode containsString:kAVTShaderModifierPragmaDeclarationMarker] == NO");
}

uint64_t ARAdjustIntrincisForOrientation()
{
  return MEMORY[0x270EDDF30]();
}

uint64_t ARAdjustIntrinsicsForViewportSize()
{
  return MEMORY[0x270EDDF38]();
}

uint64_t ARCameraToDisplayRotation()
{
  return MEMORY[0x270EDDF40]();
}

uint64_t ARMatrix3x3FromArray()
{
  return MEMORY[0x270EDDF48]();
}

uint64_t ARMatrix4x4FromRotationAndTranslation()
{
  return MEMORY[0x270EDDF50]();
}

uint64_t ARVector3FromArray()
{
  return MEMORY[0x270EDDF68]();
}

uint64_t ARVector3ScalarMultiplication()
{
  return MEMORY[0x270EDDF70]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x270EE5A38](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x270EE5A50](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x270EE5A58](context);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x270EE5BE0](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x270EE5C20](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

uint64_t CGColorTransformConvertColor()
{
  return MEMORY[0x270EE5D98]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x270EE5DB0]();
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
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

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF4FF8](isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5048](isrc);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

OSStatus CMAudioFormatDescriptionCreate(CFAllocatorRef allocator, const AudioStreamBasicDescription *asbd, size_t layoutSize, const AudioChannelLayout *layout, size_t magicCookieSize, const void *magicCookie, CFDictionaryRef extensions, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7980](allocator, asbd, layoutSize, layout, magicCookieSize, magicCookie, extensions, formatDescriptionOut);
}

OSStatus CMAudioSampleBufferCreateReadyWithPacketDescriptions(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE79A0](allocator, dataBuffer, formatDescription, numSamples, presentationTimeStamp, packetDescriptions, sampleBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE7A08](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferFillDataBytes(char fillByte, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x270EE7A18](fillByte, destinationBuffer, offsetIntoDestination, dataLength);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x270EE7C58](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C78](retstr, sbuf);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x270EE7EF8](retstr, start, duration);
}

uint64_t CVAFaceTrackingCopySemantics()
{
  return MEMORY[0x270F0CED8]();
}

uint64_t CVAFaceTrackingPostProcessRecordingExt()
{
  return MEMORY[0x270F0CEF0]();
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x270EEA0E0](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x270EEA0F0](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x270EEA110](image);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x270F96018]();
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl NSMapInsertIfAbsent(NSMapTable *table, const void *key, const void *value)
{
  return (void *)MEMORY[0x270EF2B40](table, key, value);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t SCNGetPerformanceStatistics()
{
  return MEMORY[0x270EFD268]();
}

uint64_t SCNGetShaderCollectionOutputURL()
{
  return MEMORY[0x270EFD270]();
}

uint64_t SCNSetPerformanceStatisticsEnabled()
{
  return MEMORY[0x270EFD290]();
}

uint64_t SCNSetShaderCollectionEnabled()
{
  return MEMORY[0x270EFD298]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _SCNSetShaderCacheURL()
{
  return MEMORY[0x270EFD2A0]();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x270F06310]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x270ED7E20]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x270ED8068]();
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

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x270ED86C0](a1);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

double drand48(void)
{
  MEMORY[0x270ED9670]();
  return result;
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

void srand48(uint64_t a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

float tanf(float a1)
{
  MEMORY[0x270EDB818](a1);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}