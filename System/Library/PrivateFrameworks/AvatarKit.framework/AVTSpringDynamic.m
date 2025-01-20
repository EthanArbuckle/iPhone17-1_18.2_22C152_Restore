@interface AVTSpringDynamic
+ (void)enumerateDynamicsInHierarchy:(void *)a3 forAvatar:(void *)a4 usingBlock:;
- (BOOL)affectsNode:(id)a3;
- (NSString)description;
- (void)evaluateAtTime:(double)a3 physicsController:(id)a4;
- (void)resetTarget;
@end

@implementation AVTSpringDynamic

- (NSString)description
{
  v3 = NSString;
  v4 = [(SCNNode *)self->_dynamicNode name];
  v5 = [v3 stringWithFormat:@"<AVTSpringDynamic: %p> Spring \"%@\"", self, v4];

  return (NSString *)v5;
}

+ (void)enumerateDynamicsInHierarchy:(void *)a3 forAvatar:(void *)a4 usingBlock:
{
  id v5 = a4;
  id v6 = a3;
  self;
  v7 = [v6 avatarNode];
  v8 = [v7 childNodeWithName:@"head_JNT" recursively:1];
  v9 = [v6 specializationSettings];

  v10 = [v9 objectForKeyedSubscript:@"dynamics"];
  v11 = [v10 objectForKeyedSubscript:@"dynamic nodes"];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __70__AVTSpringDynamic_enumerateDynamicsInHierarchy_forAvatar_usingBlock___block_invoke;
  v15[3] = &unk_26401F580;
  id v16 = v7;
  id v17 = v8;
  id v18 = v5;
  id v12 = v5;
  id v13 = v8;
  id v14 = v7;
  [v11 enumerateKeysAndObjectsUsingBlock:v15];
}

void __70__AVTSpringDynamic_enumerateDynamicsInHierarchy_forAvatar_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [a3 objectForKeyedSubscript:@"spring"];
  if (v6)
  {
    v7 = [*(id *)(a1 + 32) childNodeWithName:v5 recursively:1];
    v8 = v7;
    if (!v7)
    {
      id v18 = avt_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v5;
        _os_log_impl(&dword_20B819000, v18, OS_LOG_TYPE_DEFAULT, "Failed to find spring node named '%@'", buf, 0xCu);
      }

      goto LABEL_14;
    }
    v9 = [v7 parentNode];
    [v8 simdPosition];
    objc_msgSend(v9, "simdConvertPosition:toNode:", *(void *)(a1 + 40));
    long long v41 = v10;
    v11 = [v6 objectForKeyedSubscript:@"duration"];
    uint64_t v12 = [v6 objectForKeyedSubscript:@"bounce"];
    id v13 = (void *)v12;
    if (v11)
    {
      [v11 floatValue];
      double v15 = v14;
      if (v13)
      {
LABEL_5:
        [v13 floatValue];
        float v17 = v16;
LABEL_11:
        uint64_t v19 = objc_opt_new();
        objc_storeStrong((id *)(v19 + 8), v8);
        uint64_t v20 = [v8 presentationNode];
        v21 = *(void **)(v19 + 16);
        *(void *)(v19 + 16) = v20;

        uint64_t v22 = [v9 presentationNode];
        v23 = *(void **)(v19 + 24);
        *(void *)(v19 + 24) = v22;

        uint64_t v24 = [*(id *)(a1 + 40) presentationNode];
        v25 = *(void **)(v19 + 32);
        *(void *)(v19 + 32) = v24;

        *(_OWORD *)(v19 + 48) = v41;
        *(unsigned char *)(v19 + 192) = 1;
        v26 = -[AVTMassSpringDamperSystem initWithPerceptualDuration:bounce:]([AVTMassSpringDamperSystem alloc], v15, v17);
        v27 = *(void **)(v19 + 96);
        *(void *)(v19 + 96) = v26;

        v28 = [v6 objectForKeyedSubscript:@"XYZ max offsets"];
        if ([v28 count] == 3)
        {
          *(unsigned char *)(v19 + 64) = 1;
          v40 = [v28 objectAtIndexedSubscript:0];
          [v40 floatValue];
          *(void *)&long long v39 = v29;
          v30 = [v28 objectAtIndexedSubscript:1];
          [v30 floatValue];
          int v38 = v31;
          [v28 objectAtIndexedSubscript:2];
          v42 = v13;
          id v32 = v5;
          v33 = v11;
          v35 = v34 = v9;
          [v35 floatValue];
          long long v36 = v39;
          DWORD1(v36) = v38;
          DWORD2(v36) = v37;
          *(_OWORD *)(v19 + 80) = v36;

          v9 = v34;
          v11 = v33;
          id v5 = v32;
          id v13 = v42;
        }
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {
      double v15 = 0.5;
      if (v12) {
        goto LABEL_5;
      }
    }
    float v17 = 0.5;
    goto LABEL_11;
  }
LABEL_15:
}

- (void)evaluateAtTime:(double)a3 physicsController:(id)a4
{
  [(SCNNode *)self->_referencePresentationNode simdConvertPosition:0 toNode:*(double *)self->_restPosition];
  if (self->_shouldReset)
  {
    self->_shouldReset = 0;
    self->_beginTime = a3;
    *(_OWORD *)self->_beginVelocity = 0u;
    *(float32x4_t *)self->_beginWorldPosition = v6;
    *(float32x4_t *)self->_endWorldPosition = v6;
  }
  else
  {
    float32x4_t v7 = *(float32x4_t *)self->_endWorldPosition;
    uint32x4_t v8 = (uint32x4_t)vcgtq_f32(vabdq_f32(v7, v6), (float32x4_t)vdupq_n_s32(0x3A83126Fu));
    v8.i32[3] = v8.i32[2];
    if ((vmaxvq_u32(v8) & 0x80000000) != 0)
    {
      float32x4_t v23 = v6;
      -[AVTMassSpringDamperSystem float3VelocityAtTime:initialValue:initialVelocity:targetValue:]((uint64_t)self->_system, self->_lastEvaluationTime - self->_beginTime, *(float32x4_t *)self->_beginWorldPosition, *(double *)self->_beginVelocity, v7);
      float32x4_t v11 = v12;
      float32x4_t v10 = *(float32x4_t *)self->_lastWorldPosition;
      if (self->_hasMaxOffsets)
      {
        float32x4_t v21 = *(float32x4_t *)self->_lastWorldPosition;
        float32x4_t v22 = v12;
        [(SCNNode *)self->_dynamicPresentationNode simdConvertVector:0 fromNode:*(double *)vsubq_f32(v10, v23).i64];
        float32x4_t v13 = *(float32x4_t *)self->_maxOffsets;
        float32x4_t v15 = vdivq_f32(v14, v13);
        float32x4_t v16 = vmulq_f32(v15, v15);
        float v17 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1))).f32[0];
        float32x4_t v10 = v21;
        float32x4_t v11 = v22;
        float32x4_t v7 = v23;
        if (v17 > 1.0)
        {
          float32x2_t v18 = vrsqrte_f32((float32x2_t)LODWORD(v17));
          float32x2_t v19 = vmul_f32(v18, vrsqrts_f32((float32x2_t)LODWORD(v17), vmul_f32(v18, v18)));
          -[SCNNode simdConvertVector:toNode:](self->_dynamicPresentationNode, "simdConvertVector:toNode:", 0, *(double *)vmulq_f32(v13, vmulq_n_f32(v15, vmul_f32(v19, vrsqrts_f32((float32x2_t)LODWORD(v17), vmul_f32(v19, v19))).f32[0])).i64, *(double *)v21.i64);
          float32x4_t v11 = v22;
          float32x4_t v7 = v23;
          float32x4_t v10 = vaddq_f32(v23, v20);
        }
      }
      else
      {
        float32x4_t v7 = v23;
      }
      double lastEvaluationTime = self->_lastEvaluationTime;
      self->_beginTime = lastEvaluationTime;
      *(float32x4_t *)self->_beginVelocity = v11;
      *(float32x4_t *)self->_beginWorldPosition = v10;
      *(float32x4_t *)self->_endWorldPosition = v7;
    }
    else
    {
      double lastEvaluationTime = self->_beginTime;
      float32x4_t v11 = *(float32x4_t *)self->_beginVelocity;
      float32x4_t v10 = *(float32x4_t *)self->_beginWorldPosition;
    }
    *(double *)v6.i64 = -[AVTMassSpringDamperSystem float3ValueAtTime:initialValue:initialVelocity:targetValue:]((uint64_t)self->_system, a3 - lastEvaluationTime, v10, v11, v7);
  }
  *(float32x4_t *)self->_lastWorldPosition = v6;
  -[SCNNode simdConvertPosition:fromNode:](self->_dynamicParentPresentationNode, "simdConvertPosition:fromNode:", 0);
  -[SCNNode setSimdPosition:](self->_dynamicNode, "setSimdPosition:");
  self->_double lastEvaluationTime = a3;
}

- (void)resetTarget
{
  [(SCNNode *)self->_dynamicParentPresentationNode simdConvertPosition:self->_referencePresentationNode fromNode:*(double *)self->_restPosition];
  dynamicNode = self->_dynamicNode;
  -[SCNNode setSimdPosition:](dynamicNode, "setSimdPosition:");
}

- (BOOL)affectsNode:(id)a3
{
  return self->_dynamicNode == a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_referencePresentationNode, 0);
  objc_storeStrong((id *)&self->_dynamicParentPresentationNode, 0);
  objc_storeStrong((id *)&self->_dynamicPresentationNode, 0);
  objc_storeStrong((id *)&self->_dynamicNode, 0);
}

@end