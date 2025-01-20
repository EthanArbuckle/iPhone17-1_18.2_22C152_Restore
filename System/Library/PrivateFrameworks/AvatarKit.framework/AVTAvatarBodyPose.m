@interface AVTAvatarBodyPose
+ (id)neutralPose;
+ (id)posesInPosePack:(id)a3;
- (AVTAvatarBodyPose)initWithDictionaryRepresentation:(id)a3;
- (AVTAvatarBodyPose)initWithHierarchy:(id)a3;
- (AVTAvatarBodyPose)initWithRootJoints:(id)a3;
- (AVTAvatarBodyPose)initWithSceneAtURL:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (void)_applyBodyPoseWithDictionaryRepresentation:(id)a3 skeletonRootJoint:(id)a4;
- (void)_applyBodyPoseWithDictionaryRepresentationA:(id)a3 dictionaryRepresentationB:(id)a4 dictionaryRepresentationC:(id)a5 dictionaryRepresentationD:(id)a6 variantIntensityX:(float)a7 variantIntensityY:(float)a8 skeletonRootJoint:(id)a9;
- (void)_applyBodyPoseWithDictionaryRepresentationA:(id)a3 dictionaryRepresentationB:(id)a4 variantIntensity:(float)a5 skeletonRootJoint:(id)a6;
- (void)applyToBodySkeletonWithRootJoint:(id)a3 ageBodyPoseVariantIntensity:(float)a4 shoulderWidthBodyPoseVariantIntensity:(float)a5;
@end

@implementation AVTAvatarBodyPose

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

+ (id)neutralPose
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__AVTAvatarBodyPose_neutralPose__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (neutralPose_onceToken != -1) {
    dispatch_once(&neutralPose_onceToken, block);
  }
  v2 = (void *)neutralPose_neutralPose;
  return v2;
}

uint64_t __32__AVTAvatarBodyPose_neutralPose__block_invoke(uint64_t a1)
{
  if (kAVTBodyPosePackMemojiEditor_block_invoke_onceToken != -1) {
    dispatch_once(&kAVTBodyPosePackMemojiEditor_block_invoke_onceToken, &__block_literal_global_14);
  }
  id v2 = objc_alloc(*(Class *)(a1 + 32));
  uint64_t v3 = [v2 initWithDictionaryRepresentation:kAVTBodyPosePackMemojiEditor_block_invoke_kAVTPrecompiledNeutralBodyPoseRepresentation];
  uint64_t v4 = neutralPose_neutralPose;
  neutralPose_neutralPose = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

void __32__AVTAvatarBodyPose_neutralPose__block_invoke_2()
{
  v0 = (void *)kAVTBodyPosePackMemojiEditor_block_invoke_kAVTPrecompiledNeutralBodyPoseRepresentation;
  kAVTBodyPosePackMemojiEditor_block_invoke_kAVTPrecompiledNeutralBodyPoseRepresentation = (uint64_t)&unk_26C0142A0;
}

+ (id)posesInPosePack:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"memojiEditor"])
  {
    if (posesInPosePack__onceToken != -1) {
      dispatch_once(&posesInPosePack__onceToken, &__block_literal_global_1920);
    }
    id v4 = (id)posesInPosePack__poses;
  }
  else
  {
    v5 = avt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[AVTAvatarBodyPose posesInPosePack:]((uint64_t)v3, v5);
    }

    id v4 = (id)MEMORY[0x263EFFA68];
  }

  return v4;
}

void __37__AVTAvatarBodyPose_posesInPosePack___block_invoke()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v0 = objc_alloc_init(MEMORY[0x263EFF980]);
  v1 = (void *)posesInPosePack__poses;
  posesInPosePack__poses = (uint64_t)v0;

  id v2 = +[AVTStickerConfiguration stickerConfigurationsForMemojiInStickerPack:@"memojiEditorCarousel"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v7 loadIfNeeded];
        v8 = (void *)posesInPosePack__poses;
        v9 = [v7 bodyPose];
        [v8 addObject:v9];

        [v7 unload];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (AVTAvatarBodyPose)initWithRootJoints:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AVTAvatarBodyPose;
  uint64_t v5 = [(AVTAvatarBodyPose *)&v16 init];
  if (v5)
  {
    v6 = _AVTPoseRoundingBehaviour();
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __40__AVTAvatarBodyPose_initWithRootJoints___block_invoke;
    v13[3] = &unk_2640206C0;
    id v14 = v6;
    v8 = (NSDictionary *)v7;
    uint64_t v15 = v8;
    id v9 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v13];
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = v8;
    long long v11 = v8;
  }
  return v5;
}

void __40__AVTAvatarBodyPose_initWithRootJoints___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a2;
  id v8 = objc_alloc_init(v6);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__AVTAvatarBodyPose_initWithRootJoints___block_invoke_2;
  v11[3] = &unk_264020698;
  id v12 = v5;
  id v13 = v8;
  id v14 = *(id *)(a1 + 32);
  id v9 = v8;
  id v10 = v5;
  [v10 enumerateChildNodesUsingBlock:v11];
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v7];
}

void __40__AVTAvatarBodyPose_initWithRootJoints___block_invoke_2(uint64_t a1, void *a2)
{
  v118[16] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 name];
  id v5 = [v3 parentNode];
  if (([v4 isEqualToString:@"L_eye_JNT"] & 1) == 0
    && ([v4 isEqualToString:@"R_eye_JNT"] & 1) == 0)
  {
    [v3 simdTransform];
    float32x4_t v10 = v6;
    float32x4_t v11 = v7;
    float32x4_t v12 = v8;
    float32x4_t v13 = v9;
    id v14 = *(void **)(a1 + 32);
    if (v5 != v14)
    {
      objc_msgSend(v14, "simdConvertTransform:fromNode:", v5, *(double *)v6.i64, *(double *)v7.i64, *(double *)v8.i64, *(double *)v9.i64);
      float32x4_t v10 = v15;
      float32x4_t v11 = v16;
      float32x4_t v12 = v17;
      float32x4_t v13 = v18;
    }
    int32x4_t v19 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v12, (int32x4_t)v12), (int8x16_t)v12, 0xCuLL), vnegq_f32(v11)), v12, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v11, (int32x4_t)v11), (int8x16_t)v11, 0xCuLL));
    float32x4_t v20 = vmulq_f32(v10, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v19, v19), (int8x16_t)v19, 0xCuLL));
    _NF = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).f32[0] < 0.0;
    float v22 = -1.0;
    if (!_NF) {
      float v22 = 1.0;
    }
    float32x4_t v23 = vmulq_f32(v10, v10);
    float32x4_t v24 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2), vaddq_f32(v23, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 1)));
    v24.f32[0] = sqrtf(v24.f32[0]);
    float32x4_t v25 = vmulq_f32(v11, v11);
    float32x4_t v26 = vmulq_f32(v12, v12);
    v24.i32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v25, 2), vaddq_f32(v25, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.f32, 1))).f32[0]);
    v24.i32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v26, 2), vaddq_f32(v26, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v26.f32, 1))).f32[0]);
    float32x4_t v27 = vmulq_n_f32(v24, v22);
    float32x4_t v28 = vdivq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 0));
    float32x4_t v29 = vdivq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1));
    int32x4_t v30 = (int32x4_t)vdivq_f32(v12, (float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2));
    float v31 = *(float *)&v30.i32[2] + (float)(v28.f32[0] + v29.f32[1]);
    if (v31 <= 0.0)
    {
      if (v28.f32[0] <= v29.f32[1] || v28.f32[0] <= *(float *)&v30.i32[2])
      {
        if (v29.f32[1] <= *(float *)&v30.i32[2])
        {
          float32_t v43 = (float)(*(float *)&v30.i32[2] + 1.0) - v28.f32[0];
          float32x4_t v44 = (float32x4_t)vzip2q_s32((int32x4_t)v28, vzip1q_s32(v30, (int32x4_t)v28));
          int8x16_t v45 = (int8x16_t)vrev64q_s32((int32x4_t)v29);
          float32x4_t v46 = (float32x4_t)vextq_s8(v45, v45, 8uLL);
          v46.i32[0] = v30.i32[0];
          v34.i64[0] = vaddq_f32(v44, v46).u64[0];
          v44.f32[2] = v43;
          v34.i64[1] = vsubq_f32(v44, v46).i64[1];
          v35.i32[0] = v34.i32[2];
        }
        else
        {
          float32_t v37 = (float)(v29.f32[1] + 1.0) - v28.f32[0];
          float32x4_t v38 = v29;
          v38.i32[0] = v28.i32[1];
          v29.i32[1] = v30.i32[2];
          v29.i32[2] = v30.i32[1];
          int32x4_t v39 = (int32x4_t)vaddq_f32(v38, v29);
          v38.f32[1] = v37;
          v38.i32[3] = v30.i32[0];
          v29.i32[3] = v28.i32[2];
          int32x4_t v40 = (int32x4_t)vsubq_f32(v38, v29);
          float32x4_t v34 = (float32x4_t)vtrn2q_s32(vrev64q_s32(v39), v40);
          v35.i32[0] = v40.i32[1];
        }
      }
      else
      {
        float32x4_t v41 = v28;
        v41.f32[0] = (float)(v28.f32[0] + 1.0) - v29.f32[1];
        v41.i32[3] = v29.i32[2];
        float32x4_t v42 = (float32x4_t)vextq_s8((int8x16_t)v30, (int8x16_t)v30, 8uLL);
        float32x4_t v35 = vsubq_f32(v41, v42);
        v42.i32[1] = v29.i32[0];
        float32x4_t v34 = vaddq_f32(v28, v42);
        v34.i32[0] = v35.i32[0];
        v34.i32[3] = v35.i32[3];
      }
    }
    else
    {
      float32x4_t v32 = (float32x4_t)vzip2q_s32((int32x4_t)v29, vuzp1q_s32((int32x4_t)v29, v30));
      v32.i32[2] = v28.i32[1];
      float32x4_t v33 = (float32x4_t)vtrn2q_s32(v30, vzip2q_s32(v30, (int32x4_t)v28));
      v33.i32[2] = v29.i32[0];
      float32x4_t v34 = vsubq_f32(v32, v33);
      v33.i32[3] = 1.0;
      v32.f32[3] = v31;
      v34.i32[3] = vaddq_f32(v32, v33).i32[3];
      v35.i32[0] = v34.i32[3];
    }
    float32x4_t v47 = vmulq_n_f32(v34, 0.5 / sqrtf(v35.f32[0]));
    float32x4_t v48 = *(float32x4_t *)MEMORY[0x263EF89A8];
    float32x4_t v49 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
    float32x4_t v50 = vmulq_f32(v47, v47);
    float32x4_t v51 = vaddq_f32(v50, v50);
    float32x4_t v52 = vmulq_laneq_f32(v47, v47, 3);
    float v53 = vmulq_lane_f32(v47, *(float32x2_t *)v47.f32, 1).f32[0];
    v48.f32[0] = (float)(1.0 - v51.f32[1]) - v51.f32[2];
    v48.f32[1] = (float)(v53 + v52.f32[2]) + (float)(v53 + v52.f32[2]);
    v49.f32[0] = (float)(v53 - v52.f32[2]) + (float)(v53 - v52.f32[2]);
    v51.f32[0] = 1.0 - v51.f32[0];
    v49.f32[1] = v51.f32[0] - v51.f32[2];
    float32x2_t v54 = vmul_laneq_f32(*(float32x2_t *)v47.f32, v47, 2);
    v48.f32[2] = (float)(v54.f32[0] - v52.f32[1]) + (float)(v54.f32[0] - v52.f32[1]);
    v49.f32[2] = (float)(v54.f32[1] + v52.f32[0]) + (float)(v54.f32[1] + v52.f32[0]);
    *(int32x2_t *)v52.f32 = vrev64_s32(*(int32x2_t *)v52.f32);
    v55.i32[0] = vadd_f32(v54, *(float32x2_t *)v52.f32).u32[0];
    v55.i32[1] = vsub_f32(v54, *(float32x2_t *)&v52).i32[1];
    *(float32x2_t *)v56.f32 = vadd_f32(v55, v55);
    v56.i32[3] = HIDWORD(*(void *)(MEMORY[0x263EF89A8] + 40));
    v56.f32[2] = v51.f32[0] - v51.f32[1];
    float32x4_t v57 = vmulq_laneq_f32(v56, v27, 2);
    float32x4_t v58 = vaddq_f32(v13, *(float32x4_t *)(MEMORY[0x263EF89A8] + 48));
    v58.i32[3] = HIDWORD(*(_OWORD *)(MEMORY[0x263EF89A8] + 48));
    float32x4_t v59 = (float32x4_t)vdupq_n_s32(0x358637BDu);
    uint32x4_t v60 = (uint32x4_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v59, vabdq_f32(v11, vmulq_lane_f32(v49, *(float32x2_t *)v27.f32, 1))), (int8x16_t)vcgeq_f32(v59, vabdq_f32(v13, v58))), (int8x16_t)vcgeq_f32(v59, vabdq_f32(v12, v57))), (int8x16_t)vcgeq_f32(v59, vabdq_f32(v10, vmulq_n_f32(v48, v27.f32[0]))));
    if ((vminvq_u32(v60) & 0x80000000) != 0)
    {
      if (v5 == *(void **)(a1 + 32))
      {
        [v3 simdPosition];
        float32x4_t v114 = v77;
        [v3 simdOrientation];
        float32x4_t v112 = v78;
        [v3 simdScale];
        float32x4_t v13 = v114;
        float32x4_t v27 = v79;
      }
      else
      {
        float32x4_t v112 = v47;
      }
      float32x4_t v115 = v13;
      float32x4_t v110 = v27;
      __asm { FMOV            V0.4S, #-1.0 }
      uint32x4_t v84 = (uint32x4_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x358637BDu), vabsq_f32(vaddq_f32(v27, _Q0)));
      v84.i32[3] = v84.i32[2];
      unsigned int v85 = vminvq_u32(v84);
      v84.i32[0] = v13.i32[0];
      v106 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), *(double *)v84.i64);
      LODWORD(v86) = v115.i32[1];
      if ((v85 & 0x80000000) != 0)
      {
        v117[0] = v106;
        v105 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), v86);
        v117[1] = v105;
        LODWORD(v94) = v115.i32[2];
        v76 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), v94);
        v117[2] = v76;
        v74 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), *(double *)v112.i64);
        v117[3] = v74;
        LODWORD(v95) = v112.i32[1];
        v73 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), v95);
        v117[4] = v73;
        v108 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v112.u32[1], v112.u32[2])));
        v117[5] = v108;
        v75 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v112.u32[1], v112.u32[3])));
        v117[6] = v75;
        v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:7];
        [*(id *)(a1 + 40) setObject:v72 forKeyedSubscript:v4];
      }
      else
      {
        v116[0] = v106;
        v105 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), v86);
        v116[1] = v105;
        LODWORD(v87) = v115.i32[2];
        v76 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), v87);
        v116[2] = v76;
        uint64_t v104 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), *(double *)v112.i64);
        v116[3] = v104;
        LODWORD(v88) = v112.i32[1];
        uint64_t v102 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), v88);
        v116[4] = v102;
        v108 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v112.u32[1], v112.u32[2])));
        v116[5] = v108;
        uint64_t v89 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v112.u32[1], v112.u32[3])));
        v116[6] = v89;
        v72 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), *(double *)v110.i64);
        v116[7] = v72;
        HIDWORD(v90) = v110.i32[1];
        LODWORD(v90) = v110.i32[1];
        v91 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), v90);
        v116[8] = v91;
        v92 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v110.u32[1], v110.u32[2])));
        v116[9] = v92;
        v93 = [MEMORY[0x263EFF8C0] arrayWithObjects:v116 count:10];
        [*(id *)(a1 + 40) setObject:v93 forKeyedSubscript:v4];

        v73 = (void *)v102;
        v75 = (void *)v89;

        v74 = (void *)v104;
      }
    }
    else
    {
      v100 = v5;
      v60.i32[0] = v10.i32[0];
      float32x4_t v111 = v12;
      float32x4_t v113 = v13;
      float32x4_t v107 = v10;
      float32x4_t v109 = v11;
      v106 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), *(double *)v60.i64);
      v118[0] = v106;
      HIDWORD(v61) = v107.i32[1];
      LODWORD(v61) = v107.i32[1];
      v105 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), v61);
      v118[1] = v105;
      uint64_t v99 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v107.u32[1], v107.u32[2])));
      v118[2] = v99;
      uint64_t v103 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v107.u32[1], v107.u32[3])));
      v118[3] = v103;
      uint64_t v101 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), *(double *)v109.i64);
      v118[4] = v101;
      HIDWORD(v62) = v109.i32[1];
      LODWORD(v62) = v109.i32[1];
      v108 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), v62);
      v118[5] = v108;
      uint64_t v98 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v109.u32[1], v109.u32[2])));
      v118[6] = v98;
      uint64_t v96 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v109.u32[1], v109.u32[3])));
      v118[7] = v96;
      v109.i64[0] = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), *(double *)v111.i64);
      v118[8] = v109.i64[0];
      HIDWORD(v63) = v111.i32[1];
      LODWORD(v63) = v111.i32[1];
      v97 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), v63);
      v118[9] = v97;
      v64 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v111.u32[1], v111.u32[2])));
      v118[10] = v64;
      v65 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v111.u32[1], v111.u32[3])));
      v118[11] = v65;
      v66 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), *(double *)v113.i64);
      v118[12] = v66;
      HIDWORD(v67) = v113.i32[1];
      LODWORD(v67) = v113.i32[1];
      v68 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), v67);
      v118[13] = v68;
      v69 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v113.u32[1], v113.u32[2])));
      v118[14] = v69;
      v70 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", *(void *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v113.u32[1], v113.u32[3])));
      v118[15] = v70;
      v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:v118 count:16];
      [*(id *)(a1 + 40) setObject:v71 forKeyedSubscript:v4];

      v72 = (void *)v96;
      id v5 = v100;

      v73 = (void *)v101;
      v74 = (void *)v103;

      v75 = (void *)v98;
      v76 = (void *)v99;
    }
  }
}

- (AVTAvatarBodyPose)initWithHierarchy:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [a3 childNodesPassingTest:&__block_literal_global_1934 recursively:1];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        float32x4_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        float32x4_t v11 = [v10 name];
        int v12 = [v11 isEqualToString:@"bodyRoot_JNT"];

        if (v12)
        {
          [v4 setObject:v10 forKeyedSubscript:@"none"];
        }
        else
        {
          float32x4_t v13 = [v10 name];
          uint64_t v14 = [v13 rangeOfString:@"_variant_"];
          uint64_t v16 = v15;

          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            float32x4_t v17 = [v10 name];
            float32x4_t v18 = [v17 substringFromIndex:v14 + v16];

            [v4 setObject:v10 forKeyedSubscript:v18];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  int32x4_t v19 = [(AVTAvatarBodyPose *)self initWithRootJoints:v4];
  return v19;
}

uint64_t __39__AVTAvatarBodyPose_initWithHierarchy___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 name];
  uint64_t v3 = [v2 hasPrefix:@"bodyRoot_JNT"];

  return v3;
}

- (AVTAvatarBodyPose)initWithSceneAtURL:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  id v5 = objc_msgSend(MEMORY[0x263F16AD8], "avt_newSceneWithURL:options:error:", v4, 0, &v11);
  id v6 = v11;
  objc_msgSend(v5, "avt_fixQuirksOfNewUSDSchemaWithOptions:handler:", 0, 0);
  if (v6)
  {
    uint64_t v7 = avt_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AVTAvatarPoseAnimation initWithSceneAtURL:usdaMetadata:](v4, v6, v7);
    }
  }
  uint64_t v8 = [v5 rootNode];
  float32x4_t v9 = [(AVTAvatarBodyPose *)self initWithHierarchy:v8];

  return v9;
}

- (AVTAvatarBodyPose)initWithDictionaryRepresentation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarBodyPose;
  id v6 = [(AVTAvatarBodyPose *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dictionaryRepresentation, a3);
  }

  return v7;
}

- (void)applyToBodySkeletonWithRootJoint:(id)a3 ageBodyPoseVariantIntensity:(float)a4 shoulderWidthBodyPoseVariantIntensity:(float)a5
{
  id v20 = a3;
  uint64_t v8 = +[AVTAvatarBodyPose neutralPose];

  if (v8 == self)
  {
    objc_super v9 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:@"none"];
    [(AVTAvatarBodyPose *)self _applyBodyPoseWithDictionaryRepresentation:v9 skeletonRootJoint:v20];
    goto LABEL_9;
  }
  if (a5 == 0.0)
  {
    objc_super v9 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:@"none"];
    float32x4_t v10 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:@"age_child"];
    id v11 = self;
    int v12 = v9;
    float32x4_t v13 = v10;
    *(float *)&double v14 = a4;
  }
  else
  {
    objc_super v9 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:@"none"];
    dictionaryRepresentation = self->_dictionaryRepresentation;
    if (a4 != 0.0)
    {
      float32x4_t v10 = [(NSDictionary *)dictionaryRepresentation objectForKeyedSubscript:@"age_child"];
      uint64_t v16 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:@"wide_shoulders_adult"];
      float32x4_t v17 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:@"wide_shoulders_child"];
      *(float *)&double v18 = a4;
      *(float *)&double v19 = a5;
      [(AVTAvatarBodyPose *)self _applyBodyPoseWithDictionaryRepresentationA:v9 dictionaryRepresentationB:v10 dictionaryRepresentationC:v16 dictionaryRepresentationD:v17 variantIntensityX:v20 variantIntensityY:v18 skeletonRootJoint:v19];

      goto LABEL_8;
    }
    float32x4_t v10 = [(NSDictionary *)dictionaryRepresentation objectForKeyedSubscript:@"wide_shoulders_adult"];
    id v11 = self;
    int v12 = v9;
    float32x4_t v13 = v10;
    *(float *)&double v14 = a5;
  }
  [(AVTAvatarBodyPose *)v11 _applyBodyPoseWithDictionaryRepresentationA:v12 dictionaryRepresentationB:v13 variantIntensity:v20 skeletonRootJoint:v14];
LABEL_8:

LABEL_9:
}

- (void)_applyBodyPoseWithDictionaryRepresentation:(id)a3 skeletonRootJoint:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__AVTAvatarBodyPose__applyBodyPoseWithDictionaryRepresentation_skeletonRootJoint___block_invoke;
  v9[3] = &unk_26401F5D0;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  [v7 enumerateHierarchyUsingBlock:v9];
}

void __82__AVTAvatarBodyPose__applyBodyPoseWithDictionaryRepresentation_skeletonRootJoint___block_invoke(uint64_t a1, void *a2)
{
  id v72 = a2;
  uint64_t v3 = [v72 name];
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    id v5 = v4;
    if (v4)
    {
      if ([v4 count] == 16)
      {
        unint64_t v69 = AVTAvatarPoseRepresentationGetTransform(v5).n128_u64[0];
        double v61 = v7;
        double v64 = v6;
        double v59 = v8;
        objc_super v9 = [v72 parentNode];
        id v10 = v9;
        uint64_t v11 = *(void *)(a1 + 40);
        double v12 = *(double *)&v69;
        double v14 = v61;
        double v13 = v64;
        double v15 = v59;
      }
      else
      {
        id v16 = v5;
        float32x4_t v17 = [v16 objectAtIndexedSubscript:0];
        [v17 floatValue];
        v68.i64[0] = v18;
        double v19 = [v16 objectAtIndexedSubscript:1];
        [v19 floatValue];
        __int32 v65 = v20;
        v21 = [v16 objectAtIndexedSubscript:2];

        [v21 floatValue];
        float32x4_t v22 = v68;
        v22.i32[1] = v65;
        v22.i32[2] = v23;
        float32x4_t v70 = v22;

        id v24 = v16;
        long long v25 = [v24 objectAtIndexedSubscript:3];
        [v25 floatValue];
        v58.i64[0] = v26;
        uint64_t v27 = [v24 objectAtIndexedSubscript:4];
        [v27 floatValue];
        float v66 = v28;
        float32x4_t v29 = [v24 objectAtIndexedSubscript:5];
        [v29 floatValue];
        float v62 = v30;
        float v31 = [v24 objectAtIndexedSubscript:6];

        [v31 floatValue];
        float32x4_t v32 = v58;
        v32.f32[1] = v66;
        v32.f32[2] = v62;
        float32x4_t v55 = v32;
        v32.i32[3] = v33;
        float32x4_t v54 = v32;

        id v34 = v24;
        if ([v34 count] == 10)
        {
          float32x4_t v35 = [v34 objectAtIndexedSubscript:7];
          [v35 floatValue];
          v56.i64[0] = v36;
          float32_t v37 = [v34 objectAtIndexedSubscript:8];
          [v37 floatValue];
          __int32 v53 = v38;
          int32x4_t v39 = [v34 objectAtIndexedSubscript:9];
          [v39 floatValue];
          float32x4_t v40 = v56;
          v40.i32[1] = v53;
          v40.i32[2] = v41;
          float32x4_t v57 = v40;
        }
        else
        {
          __asm { FMOV            V0.4S, #1.0 }
          float32x4_t v57 = _Q0;
        }

        float32x4_t v47 = *(float32x4_t *)MEMORY[0x263EF89A8];
        float32x4_t v48 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
        float32x4_t v49 = vmulq_f32(v54, v54);
        float32x4_t v50 = vaddq_f32(v49, v49);
        float32x4_t v51 = vmulq_laneq_f32(v55, v54, 3);
        v47.f32[0] = (float)(1.0 - v50.f32[1]) - v50.f32[2];
        v47.f32[1] = (float)((float)(v58.f32[0] * v66) + v51.f32[2]) + (float)((float)(v58.f32[0] * v66) + v51.f32[2]);
        v47.f32[2] = (float)((float)(v58.f32[0] * v62) - v51.f32[1]) + (float)((float)(v58.f32[0] * v62) - v51.f32[1]);
        v48.f32[0] = (float)((float)(v58.f32[0] * v66) - v51.f32[2]) + (float)((float)(v58.f32[0] * v66) - v51.f32[2]);
        v50.f32[0] = 1.0 - v50.f32[0];
        v48.f32[1] = v50.f32[0] - v50.f32[2];
        v48.f32[2] = (float)((float)(v66 * v62) + v51.f32[0]) + (float)((float)(v66 * v62) + v51.f32[0]);
        float32x4_t v52 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 32);
        v52.f32[0] = (float)((float)(v58.f32[0] * v62) + v51.f32[1]) + (float)((float)(v58.f32[0] * v62) + v51.f32[1]);
        v52.f32[1] = (float)((float)(v66 * v62) - v51.f32[0]) + (float)((float)(v66 * v62) - v51.f32[0]);
        v52.f32[2] = v50.f32[0] - v50.f32[1];
        unint64_t v63 = vmulq_lane_f32(v48, *(float32x2_t *)v57.f32, 1).u64[0];
        unint64_t v67 = vmulq_n_f32(v47, v57.f32[0]).u64[0];
        unint64_t v60 = vmulq_laneq_f32(v52, v57, 2).u64[0];
        unint64_t v71 = vaddq_f32(v70, *(float32x4_t *)(MEMORY[0x263EF89A8] + 48)).u64[0];
        objc_super v9 = [v72 parentNode];
        id v10 = v9;
        uint64_t v11 = *(void *)(a1 + 40);
        double v13 = *(double *)&v63;
        double v12 = *(double *)&v67;
        double v14 = *(double *)&v60;
        double v15 = *(double *)&v71;
      }
      objc_msgSend(v9, "simdConvertTransform:fromNode:", v11, v12, v13, v14, v15);
      objc_msgSend(v72, "setSimdTransform:");
    }
  }
}

- (void)_applyBodyPoseWithDictionaryRepresentationA:(id)a3 dictionaryRepresentationB:(id)a4 variantIntensity:(float)a5 skeletonRootJoint:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (a5 == 0.0)
  {
    double v13 = self;
    id v14 = v10;
  }
  else
  {
    if (a5 != 1.0)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __126__AVTAvatarBodyPose__applyBodyPoseWithDictionaryRepresentationA_dictionaryRepresentationB_variantIntensity_skeletonRootJoint___block_invoke;
      v15[3] = &unk_264020708;
      id v16 = v10;
      id v17 = v11;
      float v19 = a5;
      id v18 = v12;
      [v18 enumerateHierarchyUsingBlock:v15];

      goto LABEL_6;
    }
    double v13 = self;
    id v14 = v11;
  }
  [(AVTAvatarBodyPose *)v13 _applyBodyPoseWithDictionaryRepresentation:v14 skeletonRootJoint:v12];
LABEL_6:
}

void __126__AVTAvatarBodyPose__applyBodyPoseWithDictionaryRepresentationA_dictionaryRepresentationB_variantIntensity_skeletonRootJoint___block_invoke(uint64_t a1, void *a2)
{
  id v122 = a2;
  uint64_t v3 = [v122 name];
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    uint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
    double v6 = (void *)v5;
    if (v4) {
      _ZF = v5 == 0;
    }
    else {
      _ZF = 1;
    }
    if (!_ZF)
    {
      if ([v4 count] == 16 || objc_msgSend(v6, "count") == 16)
      {
        __n128 Transform = AVTAvatarPoseRepresentationGetTransform(v4);
        float32x4_t v108 = v8;
        simd_quatf v112 = v9;
        float32x4_t v117 = v10;
        __n128 v11 = AVTAvatarPoseRepresentationGetTransform(v6);
        float v12 = *(float *)(a1 + 56);
        Transform.n128_u64[0] = vmlaq_n_f32(vmulq_n_f32((float32x4_t)v11, v12), (float32x4_t)Transform, 1.0 - v12).u64[0];
        v108.i64[0] = vmlaq_n_f32(vmulq_n_f32(v13, v12), v108, 1.0 - v12).u64[0];
        v112.vector.i64[0] = vmlaq_n_f32(vmulq_n_f32(v14, v12), (float32x4_t)v112, 1.0 - v12).u64[0];
        unint64_t v118 = vmlaq_n_f32(vmulq_n_f32(v15, v12), v117, 1.0 - v12).u64[0];
        id v16 = [v122 parentNode];
        id v17 = v16;
        uint64_t v18 = *(void *)(a1 + 48);
        double v19 = Transform.n128_f64[0];
        double v20 = *(double *)v108.i64;
        double v21 = *(double *)v112.vector.i64;
      }
      else
      {
        id v22 = v4;
        __int32 v23 = [v22 objectAtIndexedSubscript:0];
        [v23 floatValue];
        v116.i64[0] = v24;
        long long v25 = [v22 objectAtIndexedSubscript:1];
        [v25 floatValue];
        v111.vector.i32[0] = v26;
        uint64_t v27 = [v22 objectAtIndexedSubscript:2];

        [v27 floatValue];
        v107.i32[0] = v28;
        float32x4_t v29 = v116;
        v29.i32[1] = v111.vector.i32[0];
        float32x4_t v119 = v29;

        id v30 = v22;
        float v31 = [v30 objectAtIndexedSubscript:3];
        [v31 floatValue];
        v111.vector.i64[0] = v32;
        __int32 v33 = [v30 objectAtIndexedSubscript:4];
        [v33 floatValue];
        __int32 v99 = v34;
        float32x4_t v35 = [v30 objectAtIndexedSubscript:5];
        [v35 floatValue];
        __int32 v97 = v36;
        float32_t v37 = [v30 objectAtIndexedSubscript:6];

        [v37 floatValue];
        __int32 v102 = v38;
        simd_quatf v39 = v111;
        v39.vector.i32[1] = v99;
        v39.vector.i32[2] = v97;
        simd_quatf v113 = v39;

        id v40 = v30;
        uint64_t v41 = [v40 count];
        __asm { FMOV            V0.4S, #1.0 }
        float32x4_t v98 = _Q0;
        float32x4_t v100 = _Q0;
        if (v41 == 10)
        {
          float32x4_t v46 = [v40 objectAtIndexedSubscript:7];
          [v46 floatValue];
          v100.i64[0] = v47;
          float32x4_t v48 = [v40 objectAtIndexedSubscript:8];
          [v48 floatValue];
          __int32 v93 = v49;
          float32x4_t v50 = [v40 objectAtIndexedSubscript:9];
          [v50 floatValue];
          float32x4_t v51 = v100;
          v51.i32[1] = v93;
          v51.i32[2] = v52;
          float32x4_t v100 = v51;
        }
        float32x4_t v53 = v119;
        v53.i32[2] = v107.i32[0];
        float32x4_t v120 = v53;
        simd_quatf v54 = v113;
        v54.vector.i32[3] = v102;
        simd_quatf v114 = v54;

        id v55 = v6;
        float32x4_t v56 = [v55 objectAtIndexedSubscript:0];
        [v56 floatValue];
        v107.i64[0] = v57;
        float32x4_t v58 = [v55 objectAtIndexedSubscript:1];
        [v58 floatValue];
        __int32 v103 = v59;
        unint64_t v60 = [v55 objectAtIndexedSubscript:2];

        [v60 floatValue];
        float32x4_t v61 = v107;
        v61.i32[1] = v103;
        v61.i32[2] = v62;
        float32x4_t v109 = v61;

        id v63 = v55;
        double v64 = [v63 objectAtIndexedSubscript:3];
        [v64 floatValue];
        unsigned int v104 = v65;
        float v66 = [v63 objectAtIndexedSubscript:4];
        [v66 floatValue];
        unsigned int v94 = v67;
        float32x4_t v68 = [v63 objectAtIndexedSubscript:5];
        [v68 floatValue];
        unsigned int v92 = v69;
        float32x4_t v70 = [v63 objectAtIndexedSubscript:6];

        [v70 floatValue];
        v71.i64[0] = __PAIR64__(v94, v104);
        v71.i64[1] = __PAIR64__(v72, v92);
        float32x4_t v105 = v71;

        id v73 = v63;
        if ([v73 count] == 10)
        {
          v74 = [v73 objectAtIndexedSubscript:7];
          [v74 floatValue];
          v98.i64[0] = v75;
          v76 = [v73 objectAtIndexedSubscript:8];
          [v76 floatValue];
          __int32 v95 = v77;
          float32x4_t v78 = [v73 objectAtIndexedSubscript:9];
          [v78 floatValue];
          float32x4_t v79 = v98;
          v79.i32[1] = v95;
          v79.i32[2] = v80;
          float32x4_t v98 = v79;
        }
        float v96 = *(float *)(a1 + 56);
        float32x4_t v121 = vmlaq_n_f32(v120, vsubq_f32(v109, v120), v96);
        float32x4_t v81 = vmulq_f32((float32x4_t)v114, v105);
        float32x4_t v82 = (float32x4_t)vextq_s8((int8x16_t)v81, (int8x16_t)v81, 8uLL);
        v81.f32[0] = vaddv_f32(vadd_f32(*(float32x2_t *)v81.f32, *(float32x2_t *)v82.f32));
        v82.i64[0] = 0;
        _simd_slerp_internal((float32x4_t)v114, (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v81, v82)), 0), (int8x16_t)vnegq_f32(v105), (int8x16_t)v105), v96);
        float32x4_t v83 = vmlaq_n_f32(v100, vsubq_f32(v98, v100), v96);
        float32x4_t v84 = *(float32x4_t *)MEMORY[0x263EF89A8];
        float32x4_t v85 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
        float32x4_t v87 = vmulq_f32(v86, v86);
        float32x4_t v88 = vaddq_f32(v87, v87);
        float32x4_t v89 = vmulq_laneq_f32(v86, v86, 3);
        float v90 = vmulq_lane_f32(v86, *(float32x2_t *)v86.f32, 1).f32[0];
        v84.f32[0] = (float)(1.0 - v88.f32[1]) - v88.f32[2];
        v84.f32[1] = (float)(v90 + v89.f32[2]) + (float)(v90 + v89.f32[2]);
        v85.f32[0] = (float)(v90 - v89.f32[2]) + (float)(v90 - v89.f32[2]);
        v88.f32[0] = 1.0 - v88.f32[0];
        v85.f32[1] = v88.f32[0] - v88.f32[2];
        *(float32x2_t *)v86.f32 = vmul_laneq_f32(*(float32x2_t *)v86.f32, v86, 2);
        v84.f32[2] = (float)(v86.f32[0] - v89.f32[1]) + (float)(v86.f32[0] - v89.f32[1]);
        v85.f32[2] = (float)(v86.f32[1] + v89.f32[0]) + (float)(v86.f32[1] + v89.f32[0]);
        *(int32x2_t *)v89.f32 = vrev64_s32(*(int32x2_t *)v89.f32);
        v91.i32[0] = vadd_f32(*(float32x2_t *)v86.f32, *(float32x2_t *)v89.f32).u32[0];
        v91.i32[1] = vsub_f32(*(float32x2_t *)&v86, *(float32x2_t *)&v89).i32[1];
        *(float32x2_t *)v86.f32 = vadd_f32(v91, v91);
        v86.i32[3] = HIDWORD(*(void *)(MEMORY[0x263EF89A8] + 40));
        v86.f32[2] = v88.f32[0] - v88.f32[1];
        unint64_t v110 = vmulq_lane_f32(v85, *(float32x2_t *)v83.f32, 1).u64[0];
        unint64_t v115 = vmulq_n_f32(v84, v83.f32[0]).u64[0];
        unint64_t v106 = vmulq_laneq_f32(v86, v83, 2).u64[0];
        unint64_t v118 = vaddq_f32(v121, *(float32x4_t *)(MEMORY[0x263EF89A8] + 48)).u64[0];
        id v16 = [v122 parentNode];
        id v17 = v16;
        uint64_t v18 = *(void *)(a1 + 48);
        double v20 = *(double *)&v110;
        double v19 = *(double *)&v115;
        double v21 = *(double *)&v106;
      }
      objc_msgSend(v16, "simdConvertTransform:fromNode:", v18, v19, v20, v21, *(double *)&v118);
      objc_msgSend(v122, "setSimdTransform:");
    }
  }
}

- (void)_applyBodyPoseWithDictionaryRepresentationA:(id)a3 dictionaryRepresentationB:(id)a4 dictionaryRepresentationC:(id)a5 dictionaryRepresentationD:(id)a6 variantIntensityX:(float)a7 variantIntensityY:(float)a8 skeletonRootJoint:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  if (a7 == 0.0)
  {
    id v22 = self;
    id v23 = v16;
    id v24 = v18;
LABEL_5:
    *(float *)&double v21 = a8;
    goto LABEL_6;
  }
  if (a7 == 1.0)
  {
    id v22 = self;
    id v23 = v17;
    id v24 = v19;
    goto LABEL_5;
  }
  if (a8 == 0.0)
  {
    id v22 = self;
    id v23 = v16;
    id v24 = v17;
  }
  else
  {
    if (a8 != 1.0)
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __197__AVTAvatarBodyPose__applyBodyPoseWithDictionaryRepresentationA_dictionaryRepresentationB_dictionaryRepresentationC_dictionaryRepresentationD_variantIntensityX_variantIntensityY_skeletonRootJoint___block_invoke;
      v25[3] = &unk_264020730;
      id v26 = v16;
      id v27 = v17;
      id v28 = v18;
      id v29 = v19;
      float v30 = a7;
      float v31 = a8;
      [v20 enumerateHierarchyUsingBlock:v25];

      goto LABEL_7;
    }
    id v22 = self;
    id v23 = v18;
    id v24 = v19;
  }
  *(float *)&double v21 = a7;
LABEL_6:
  [(AVTAvatarBodyPose *)v22 _applyBodyPoseWithDictionaryRepresentationA:v23 dictionaryRepresentationB:v24 variantIntensity:v20 skeletonRootJoint:v21];
LABEL_7:
}

void __197__AVTAvatarBodyPose__applyBodyPoseWithDictionaryRepresentationA_dictionaryRepresentationB_dictionaryRepresentationC_dictionaryRepresentationD_variantIntensityX_variantIntensityY_skeletonRootJoint___block_invoke(uint64_t a1, void *a2)
{
  id v235 = a2;
  uint64_t v3 = [v235 name];
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    uint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
    double v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:v3];
    uint64_t v7 = [*(id *)(a1 + 56) objectForKeyedSubscript:v3];
    float32x4_t v8 = (void *)v7;
    if (v4 && v5 && v6 && v7)
    {
      if ([v4 count] == 16 || objc_msgSend(v5, "count") == 16 || objc_msgSend(v6, "count") == 16)
      {
        __n128 Transform = AVTAvatarPoseRepresentationGetTransform(v4);
        float32x4_t v225 = v10;
        float32x4_t v231 = (float32x4_t)Transform;
        float32x4_t v214 = v12;
        float32x4_t v219 = v11;
        __n128 v210 = AVTAvatarPoseRepresentationGetTransform(v5);
        float32x4_t v199 = v14;
        float32x4_t v203 = v13;
        float32x4_t v195 = v15;
        __n128 v16 = AVTAvatarPoseRepresentationGetTransform(v6);
        float32x4_t v188 = v17;
        float32x4_t v193 = (float32x4_t)v16;
        float32x4_t v182 = v19;
        float32x4_t v186 = v18;
        __n128 v20 = AVTAvatarPoseRepresentationGetTransform(v8);
        float v21 = *(float *)(a1 + 64);
        float v22 = *(float *)(a1 + 68);
        unint64_t v26 = vmlaq_n_f32(vmulq_n_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)v20, v21), v193, 1.0 - v21), v22), vmlaq_n_f32(vmulq_n_f32((float32x4_t)v210, v21), v231, 1.0 - v21), 1.0 - v22).u64[0];
        unint64_t v27 = vmlaq_n_f32(vmulq_n_f32(vmlaq_n_f32(vmulq_n_f32(v23, v21), v188, 1.0 - v21), v22), vmlaq_n_f32(vmulq_n_f32(v203, v21), v225, 1.0 - v21), 1.0 - v22).u64[0];
        unint64_t v28 = vmlaq_n_f32(vmulq_n_f32(vmlaq_n_f32(vmulq_n_f32(v24, v21), v186, 1.0 - v21), v22), vmlaq_n_f32(vmulq_n_f32(v199, v21), v219, 1.0 - v21), 1.0 - v22).u64[0];
        unint64_t v29 = vmlaq_n_f32(vmulq_n_f32(vmlaq_n_f32(vmulq_n_f32(v25, v21), v182, 1.0 - v21), v22), vmlaq_n_f32(vmulq_n_f32(v195, v21), v214, 1.0 - v21), 1.0 - v22).u64[0];
      }
      else
      {
        id v30 = v4;
        float v31 = [v30 objectAtIndexedSubscript:0];
        [v31 floatValue];
        v230.i64[0] = v32;
        __int32 v33 = [v30 objectAtIndexedSubscript:1];
        [v33 floatValue];
        v213.i32[0] = v34;
        float32x4_t v35 = [v30 objectAtIndexedSubscript:2];

        [v35 floatValue];
        __int32 v189 = v36;

        id v37 = v30;
        v204 = [v37 objectAtIndexedSubscript:3];
        [v204 floatValue];
        v224.i64[0] = v38;
        simd_quatf v39 = [v37 objectAtIndexedSubscript:4];
        [v39 floatValue];
        v218.i32[0] = v40;
        uint64_t v41 = [v37 objectAtIndexedSubscript:5];
        [v41 floatValue];
        v209.i32[0] = v42;
        float32_t v43 = [v37 objectAtIndexedSubscript:6];

        [v43 floatValue];
        v185.i32[0] = v44;

        id v45 = v37;
        uint64_t v46 = [v45 count];
        __asm { FMOV            V0.4S, #1.0 }
        float32x4_t v194 = _Q0;
        float32x4_t v200 = _Q0;
        if (v46 == 10)
        {
          __int32 v52 = [v45 objectAtIndexedSubscript:7];
          [v52 floatValue];
          v200.i64[0] = v53;
          simd_quatf v54 = [v45 objectAtIndexedSubscript:8];
          [v54 floatValue];
          __int32 v205 = v55;
          float32x4_t v56 = [v45 objectAtIndexedSubscript:9];
          [v56 floatValue];
          float32x4_t v57 = v200;
          v57.i32[1] = v205;
          v57.i32[2] = v58;
          float32x4_t v200 = v57;
        }
        float32x4_t v59 = v224;
        v59.i32[1] = v218.i32[0];
        float32x4_t v226 = v59;

        id v60 = v5;
        float32x4_t v61 = [v60 objectAtIndexedSubscript:0];
        [v61 floatValue];
        v202.i64[0] = v62;
        id v63 = [v60 objectAtIndexedSubscript:1];
        [v63 floatValue];
        int v196 = v64;
        unsigned int v65 = [v60 objectAtIndexedSubscript:2];

        [v65 floatValue];
        __int32 v178 = v66;

        id v67 = v60;
        v183 = [v67 objectAtIndexedSubscript:3];
        [v183 floatValue];
        v218.i64[0] = v68;
        unsigned int v69 = [v67 objectAtIndexedSubscript:4];
        [v69 floatValue];
        int v170 = v70;
        float32x4_t v71 = [v67 objectAtIndexedSubscript:5];
        [v71 floatValue];
        int v173 = v72;
        id v73 = [v67 objectAtIndexedSubscript:6];

        [v73 floatValue];
        __int32 v176 = v74;
        float32x4_t v75 = v218;
        v75.i32[1] = v170;
        float32x4_t v220 = v75;

        id v76 = v67;
        float32x4_t v184 = v194;
        if ([v76 count] == 10)
        {
          __int32 v77 = [v76 objectAtIndexedSubscript:7];
          [v77 floatValue];
          v184.i64[0] = v78;
          float32x4_t v79 = [v76 objectAtIndexedSubscript:8];
          [v79 floatValue];
          __int32 v171 = v80;
          float32x4_t v81 = [v76 objectAtIndexedSubscript:9];
          [v81 floatValue];
          float32x4_t v82 = v184;
          v82.i32[1] = v171;
          v82.i32[2] = v83;
          float32x4_t v184 = v82;
        }
        float32x4_t v84 = v230;
        v84.i32[1] = v213.i32[0];
        float32x4_t v232 = v84;
        float32x4_t v85 = v226;
        v85.i32[2] = v209.i32[0];
        float32x4_t v227 = v85;
        float32x4_t v86 = v202;
        v86.i32[1] = v196;
        float32x4_t v206 = v86;
        float32x4_t v87 = v220;
        v87.i32[2] = v173;
        float32x4_t v221 = v87;

        id v88 = v6;
        float32x4_t v89 = [v88 objectAtIndexedSubscript:0];
        [v89 floatValue];
        v213.i64[0] = v90;
        float32x2_t v91 = [v88 objectAtIndexedSubscript:1];
        [v91 floatValue];
        v209.i32[0] = v92;
        __int32 v93 = [v88 objectAtIndexedSubscript:2];

        [v93 floatValue];
        __int32 v174 = v94;
        float32x4_t v95 = v213;
        v95.i32[1] = v209.i32[0];
        float32x4_t v215 = v95;

        id v96 = v88;
        v197 = [v96 objectAtIndexedSubscript:3];
        [v197 floatValue];
        v209.i64[0] = v97;
        float32x4_t v98 = [v96 objectAtIndexedSubscript:4];
        [v98 floatValue];
        int v168 = v99;
        float32x4_t v100 = [v96 objectAtIndexedSubscript:5];
        [v100 floatValue];
        int v167 = v101;
        __int32 v102 = [v96 objectAtIndexedSubscript:6];

        [v102 floatValue];
        __int32 v172 = v103;
        float32x4_t v104 = v209;
        v104.i32[1] = v168;
        v104.i32[2] = v167;
        float32x4_t v211 = v104;

        id v105 = v96;
        float32x4_t v198 = v194;
        if ([v105 count] == 10)
        {
          unint64_t v106 = [v105 objectAtIndexedSubscript:7];
          [v106 floatValue];
          v198.i64[0] = v107;
          float32x4_t v108 = [v105 objectAtIndexedSubscript:8];
          [v108 floatValue];
          __int32 v169 = v109;
          unint64_t v110 = [v105 objectAtIndexedSubscript:9];
          [v110 floatValue];
          float32x4_t v111 = v198;
          v111.i32[1] = v169;
          v111.i32[2] = v112;
          float32x4_t v198 = v111;
        }
        float32x4_t v113 = v232;
        v113.i32[2] = v189;
        float32x4_t v233 = v113;
        float32x4_t v114 = v227;
        v114.i32[3] = v185.i32[0];
        float32x4_t v228 = v114;
        float32x4_t v115 = v206;
        v115.i32[2] = v178;
        float32x4_t v207 = v115;
        float32x4_t v116 = v221;
        v116.i32[3] = v176;
        float32x4_t v222 = v116;
        float32x4_t v117 = v215;
        v117.i32[2] = v174;
        float32x4_t v216 = v117;
        float32x4_t v118 = v211;
        v118.i32[3] = v172;
        float32x4_t v212 = v118;

        id v119 = v8;
        float32x4_t v120 = [v119 objectAtIndexedSubscript:0];
        [v120 floatValue];
        v185.i64[0] = v121;
        id v122 = [v119 objectAtIndexedSubscript:1];
        [v122 floatValue];
        __int32 v190 = v123;
        v124 = [v119 objectAtIndexedSubscript:2];

        [v124 floatValue];
        float32x4_t v125 = v185;
        v125.i32[1] = v190;
        v125.i32[2] = v126;
        float32x4_t v187 = v125;

        id v127 = v119;
        v179 = [v127 objectAtIndexedSubscript:3];
        [v179 floatValue];
        unsigned int v191 = v128;
        v129 = [v127 objectAtIndexedSubscript:4];
        [v129 floatValue];
        unsigned int v177 = v130;
        v131 = [v127 objectAtIndexedSubscript:5];
        [v131 floatValue];
        unsigned int v175 = v132;
        v133 = [v127 objectAtIndexedSubscript:6];

        [v133 floatValue];
        v134.i64[0] = __PAIR64__(v177, v191);
        v134.i64[1] = __PAIR64__(v135, v175);
        float32x4_t v192 = v134;

        id v136 = v127;
        if ([v136 count] == 10)
        {
          v137 = [v136 objectAtIndexedSubscript:7];
          [v137 floatValue];
          v194.i64[0] = v138;
          v139 = [v136 objectAtIndexedSubscript:8];
          [v139 floatValue];
          __int32 v180 = v140;
          v141 = [v136 objectAtIndexedSubscript:9];
          [v141 floatValue];
          float32x4_t v142 = v194;
          v142.i32[1] = v180;
          v142.i32[2] = v143;
          float32x4_t v194 = v142;
        }
        float v144 = *(float *)(a1 + 64);
        float32x4_t v234 = vmlaq_n_f32(v233, vsubq_f32(v207, v233), v144);
        int8x16_t v145 = (int8x16_t)vmulq_f32(v228, v222);
        int32x2_t v146 = (int32x2_t)vadd_f32(*(float32x2_t *)v145.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v145, v145, 8uLL));
        float v147 = v144;
        float32x4_t v201 = vmlaq_n_f32(v200, vsubq_f32(v184, v200), v144);
        int8x16_t v148 = (int8x16_t)vmulq_f32(v212, v192);
        *(float32x2_t *)v148.i8 = vadd_f32(*(float32x2_t *)v148.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v148, v148, 8uLL));
        *(int32x2_t *)v145.i8 = vzip1_s32(*(int32x2_t *)v148.i8, v146);
        float32x2_t v149 = (float32x2_t)vzip2_s32(*(int32x2_t *)v148.i8, v146);
        int8x16_t v150 = (int8x16_t)vnegq_f32(v222);
        *(int8x8_t *)v145.i8 = vmvn_s8((int8x8_t)vcgez_f32(vadd_f32(*(float32x2_t *)v145.i8, v149)));
        __int8 v208 = v145.i8[0];
        float v181 = v147;
        float32x4_t v217 = vmlaq_n_f32(v216, vsubq_f32(v187, v216), v147);
        if (v145.i8[4]) {
          unsigned int v151 = -1;
        }
        else {
          unsigned int v151 = 0;
        }
        _simd_slerp_internal(v228, (float32x4_t)vbslq_s8((int8x16_t)vdupq_n_s32(v151), v150, (int8x16_t)v222), v147);
        float32x4_t v229 = v152;
        int8x16_t v153 = (int8x16_t)vnegq_f32(v192);
        if (v208) {
          unsigned int v154 = -1;
        }
        else {
          unsigned int v154 = 0;
        }
        _simd_slerp_internal(v212, (float32x4_t)vbslq_s8((int8x16_t)vdupq_n_s32(v154), v153, (int8x16_t)v192), v181);
        float v223 = *(float *)(a1 + 68);
        float32x4_t v156 = vmulq_f32(v229, v155);
        float32x4_t v157 = (float32x4_t)vextq_s8((int8x16_t)v156, (int8x16_t)v156, 8uLL);
        *(float32x2_t *)v156.f32 = vadd_f32(*(float32x2_t *)v156.f32, *(float32x2_t *)v157.f32);
        v156.f32[0] = vaddv_f32(*(float32x2_t *)v156.f32);
        v157.i64[0] = 0;
        _simd_slerp_internal(v229, (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v156, v157)), 0), (int8x16_t)vnegq_f32(v155), (int8x16_t)v155), v223);
        float32x4_t v158 = vmlaq_n_f32(v201, vsubq_f32(vmlaq_n_f32(v198, vsubq_f32(v194, v198), v181), v201), v223);
        float32x4_t v159 = *(float32x4_t *)MEMORY[0x263EF89A8];
        float32x4_t v160 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
        float32x4_t v162 = vmulq_f32(v161, v161);
        float32x4_t v163 = vaddq_f32(v162, v162);
        float32x4_t v164 = vmulq_laneq_f32(v161, v161, 3);
        float v165 = vmulq_lane_f32(v161, *(float32x2_t *)v161.f32, 1).f32[0];
        v159.f32[0] = (float)(1.0 - v163.f32[1]) - v163.f32[2];
        v159.f32[1] = (float)(v165 + v164.f32[2]) + (float)(v165 + v164.f32[2]);
        v160.f32[0] = (float)(v165 - v164.f32[2]) + (float)(v165 - v164.f32[2]);
        v163.f32[0] = 1.0 - v163.f32[0];
        v160.f32[1] = v163.f32[0] - v163.f32[2];
        *(float32x2_t *)v161.f32 = vmul_laneq_f32(*(float32x2_t *)v161.f32, v161, 2);
        v159.f32[2] = (float)(v161.f32[0] - v164.f32[1]) + (float)(v161.f32[0] - v164.f32[1]);
        v160.f32[2] = (float)(v161.f32[1] + v164.f32[0]) + (float)(v161.f32[1] + v164.f32[0]);
        *(int32x2_t *)v164.f32 = vrev64_s32(*(int32x2_t *)v164.f32);
        v166.i32[0] = vadd_f32(*(float32x2_t *)v161.f32, *(float32x2_t *)v164.f32).u32[0];
        v166.i32[1] = vsub_f32(*(float32x2_t *)&v161, *(float32x2_t *)&v164).i32[1];
        *(float32x2_t *)v164.f32 = vadd_f32(v166, v166);
        v161.i64[0] = *(void *)(MEMORY[0x263EF89A8] + 40);
        v161.f32[0] = v163.f32[0] - v163.f32[1];
        v164.i64[1] = v161.i64[0];
        unint64_t v26 = vmulq_n_f32(v159, v158.f32[0]).u64[0];
        unint64_t v27 = vmulq_lane_f32(v160, *(float32x2_t *)v158.f32, 1).u64[0];
        unint64_t v28 = vmulq_laneq_f32(v164, v158, 2).u64[0];
        unint64_t v29 = vaddq_f32(vmlaq_n_f32(v234, vsubq_f32(v217, v234), v223), *(float32x4_t *)(MEMORY[0x263EF89A8] + 48)).u64[0];
      }
      objc_msgSend(v235, "setSimdWorldTransform:", *(double *)&v26, *(double *)&v27, *(double *)&v28, *(double *)&v29);
    }
  }
}

- (void).cxx_destruct
{
}

+ (void)posesInPosePack:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B819000, a2, OS_LOG_TYPE_ERROR, "Error: Failed to find pose pack named \"%@\"", (uint8_t *)&v2, 0xCu);
}

@end