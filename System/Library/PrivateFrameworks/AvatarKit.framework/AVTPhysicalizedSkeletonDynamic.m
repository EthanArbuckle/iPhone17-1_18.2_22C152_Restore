@interface AVTPhysicalizedSkeletonDynamic
+ (void)enumerateDynamicsInHierarchy:(void *)a3 forAvatar:(void *)a4 usingBlock:;
- (BOOL)affectsNode:(id)a3;
- (NSString)description;
- (void)evaluateAtTime:(double)a3 physicsController:(id)a4;
- (void)resetTarget;
@end

@implementation AVTPhysicalizedSkeletonDynamic

- (NSString)description
{
  v3 = NSString;
  rootJoint = self->_rootJoint;
  v5 = [(SCNNode *)self->_drivingNode name];
  v6 = [v3 stringWithFormat:@"<AVTPhysicalizedMorpherDynamic: %p> Skeleton %p driven by \"%@\"", self, rootJoint, v5];

  return (NSString *)v6;
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
  v15[2] = __84__AVTPhysicalizedSkeletonDynamic_enumerateDynamicsInHierarchy_forAvatar_usingBlock___block_invoke;
  v15[3] = &unk_26401F580;
  id v16 = v7;
  id v17 = v8;
  id v18 = v5;
  id v12 = v5;
  id v13 = v8;
  id v14 = v7;
  [v11 enumerateKeysAndObjectsUsingBlock:v15];
}

void __84__AVTPhysicalizedSkeletonDynamic_enumerateDynamicsInHierarchy_forAvatar_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v64 = a2;
  id v60 = a3;
  v62 = [v60 objectForKeyedSubscript:@"physicalized skeleton"];
  id v5 = v62;
  if (v62)
  {
    id obj = [*(id *)(a1 + 32) childNodeWithName:v64 recursively:1];
    if (!obj)
    {
      v20 = avt_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v73) = 138412290;
        *(void *)((char *)&v73 + 4) = v64;
        _os_log_impl(&dword_20B819000, v20, OS_LOG_TYPE_DEFAULT, "Failed to find physicalized skeleton driving node named '%@'", (uint8_t *)&v73, 0xCu);
      }
      goto LABEL_44;
    }
    uint64_t v58 = [v62 objectForKeyedSubscript:@"chain root"];
    id v6 = [*(id *)(a1 + 32) childNodeWithName:v58 recursively:1];
    id v59 = v6;
    if (!v6)
    {
      v21 = avt_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v73) = 138412290;
        *(void *)((char *)&v73 + 4) = v58;
        _os_log_impl(&dword_20B819000, v21, OS_LOG_TYPE_DEFAULT, "Failed to find joint hierarchy for physicalized skeleton root joint named '%@'", (uint8_t *)&v73, 0xCu);
      }

      goto LABEL_43;
    }
    *(void *)&long long v73 = 0;
    *((void *)&v73 + 1) = &v73;
    uint64_t v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__0;
    v76 = __Block_byref_object_dispose__0;
    id v77 = 0;
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __84__AVTPhysicalizedSkeletonDynamic_enumerateDynamicsInHierarchy_forAvatar_usingBlock___block_invoke_103;
    v69[3] = &unk_26401F558;
    v69[4] = &v73;
    [v6 enumerateHierarchyUsingBlock:v69];
    [v62 objectForKeyedSubscript:@"targets"];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v65 objects:v72 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v66 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = [*(id *)(a1 + 32) childNodeWithName:*(void *)(*((void *)&v65 + 1) + 8 * i) recursively:1];
          if (v11)
          {
            id v12 = *(void **)(*((void *)&v73 + 1) + 40);
            if (!v12)
            {
              id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
              id v14 = *(void **)(*((void *)&v73 + 1) + 40);
              *(void *)(*((void *)&v73 + 1) + 40) = v13;

              id v12 = *(void **)(*((void *)&v73 + 1) + 40);
            }
            [v12 addObject:v11];
          }
          else
          {
            v15 = avt_default_log();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v71 = (uint64_t)v64;
              _os_log_impl(&dword_20B819000, v15, OS_LOG_TYPE_DEFAULT, "Failed to find physicalized skeleton target named '%@'", buf, 0xCu);
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v65 objects:v72 count:16];
      }
      while (v8);
    }

    if (![*(id *)(*((void *)&v73 + 1) + 40) count])
    {
      id v17 = avt_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v71 = v58;
        _os_log_impl(&dword_20B819000, v17, OS_LOG_TYPE_DEFAULT, "Failed to find any target node for physicalized skeleton root joint named '%@'", buf, 0xCu);
      }
      goto LABEL_42;
    }
    id v16 = [v60 objectForKeyedSubscript:@"simulation factor"];
    id v17 = v16;
    if (v16)
    {
      [v16 floatValue];
      float v19 = v18;
    }
    else
    {
      float v19 = 0.5;
    }
    uint64_t v22 = objc_opt_new();
    *(float *)(v22 + 8) = v19;
    objc_storeStrong((id *)(v22 + 16), *(id *)(a1 + 40));
    objc_storeStrong((id *)(v22 + 24), obj);
    objc_storeStrong((id *)(v22 + 32), v59);
    uint64_t v23 = [*(id *)(*((void *)&v73 + 1) + 40) copy];
    v24 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v23;

    *(_OWORD *)(v22 + 48) = 0u;
    *(_OWORD *)(v22 + 64) = 0u;
    *(_OWORD *)(v22 + 80) = 0u;
    v25 = [v62 objectForKeyedSubscript:@"rotation up down"];
    v63 = [v62 objectForKeyedSubscript:@"rotation left right"];
    v26 = [v62 objectForKeyedSubscript:@"rotation forward back"];
    v27 = v25;
    if (v25)
    {
      v28 = [v25 objectAtIndexedSubscript:0];
      [v28 floatValue];
      *(void *)&long long v57 = v29;
      v30 = [v25 objectAtIndexedSubscript:1];
      [v30 floatValue];
      int v54 = v31;
      v32 = [v25 objectAtIndexedSubscript:2];
      [v32 floatValue];
      long long v33 = v57;
      DWORD1(v33) = v54;
      DWORD2(v33) = v34;
      *(_OWORD *)(v22 + 48) = v33;
    }
    if (v63)
    {
      v35 = [v63 objectAtIndexedSubscript:0];
      [v35 floatValue];
      *(void *)&long long v57 = v36;
      v37 = [v63 objectAtIndexedSubscript:1];
      [v37 floatValue];
      int v55 = v38;
      v39 = [v63 objectAtIndexedSubscript:2];
      [v39 floatValue];
      long long v40 = v57;
      DWORD1(v40) = v55;
      DWORD2(v40) = v41;
      *(_OWORD *)(v22 + 64) = v40;
    }
    if (v26)
    {
      v42 = [v26 objectAtIndexedSubscript:0];
      [v42 floatValue];
      *(void *)&long long v57 = v43;
      v44 = [v26 objectAtIndexedSubscript:1];
      [v44 floatValue];
      int v56 = v45;
      v46 = [v26 objectAtIndexedSubscript:2];
      [v46 floatValue];
      long long v47 = v57;
      DWORD1(v47) = v56;
      DWORD2(v47) = v48;
      *(_OWORD *)(v22 + 80) = v47;
    }
    v49 = [obj name];
    int v50 = [v49 hasPrefix:@"L_"];

    if (v50)
    {
      uint64_t v51 = 1;
    }
    else
    {
      v52 = [obj name];
      int v53 = [v52 hasPrefix:@"R_"];

      if (!v53)
      {
        *(void *)(v22 + 96) = 0;
        goto LABEL_41;
      }
      uint64_t v51 = 2;
    }
    *(void *)(v22 + 96) = v51;
LABEL_41:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_42:
    _Block_object_dispose(&v73, 8);

LABEL_43:
    v20 = v58;
LABEL_44:

    id v5 = v62;
  }
}

void __84__AVTPhysicalizedSkeletonDynamic_enumerateDynamicsInHierarchy_forAvatar_usingBlock___block_invoke_103(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = [v9 name];
  int v4 = [v3 containsString:@"_DDV"];

  if (v4)
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v5 addObject:v9];
  }
}

- (void)evaluateAtTime:(double)a3 physicsController:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  float simulationFactor = self->_simulationFactor;
  [a4 offsetFromRestingPositionForNode:self->_drivingNode inCoordinateSpaceOfNode:self->_referenceNode];
  float32x4_t v22 = v5;
  unint64_t side = self->_side;
  float32x4_t v25 = *(float32x4_t *)self->_leftRightRotation;
  float32x4_t v26 = *(float32x4_t *)self->_forwardBackRotation;
  float32x4_t v24 = *(float32x4_t *)self->_upDownRotation;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = self->_targetNodes;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v11 = v8;
    v9.i64[0] = side;
    v10.i64[0] = 2;
    int8x16_t v12 = (int8x16_t)vdupq_lane_s64(vceqq_s64(v9, v10).i64[0], 0);
    int8x16_t v13 = (int8x16_t)vmulq_n_f32(v22, simulationFactor);
    *(float *)v14.i32 = -*(float *)v13.i32;
    v14.i32[1] = v13.i32[1];
    v14.i64[1] = __PAIR64__(v22.u32[3], v13.u32[2]);
    float32x4_t v15 = (float32x4_t)vbslq_s8(v12, v14, v13);
    float32x4_t v16 = vnegq_f32(v15);
    v15.i32[3] = 0;
    float32x4_t v17 = vmaxnmq_f32(v15, (float32x4_t)0);
    v17.i32[3] = 0;
    v16.i32[3] = 0;
    float32x4_t v18 = vmaxnmq_f32(v16, (float32x4_t)0);
    v18.i32[3] = 0;
    float32x4_t v19 = vsubq_f32(vminnmq_f32(v17, (float32x4_t)xmmword_20B88FDE0), vminnmq_f32(v18, (float32x4_t)xmmword_20B88FDE0));
    *(void *)&double v27 = vaddq_f32(vmulq_lane_f32(v24, *(float32x2_t *)v19.f32, 1), vaddq_f32(vmulq_n_f32(v25, v19.f32[0]), vmulq_laneq_f32(v26, v19, 2))).u64[0];
    uint64_t v20 = *(void *)v29;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v21++), "setSimdEulerAngles:", v27, *(_OWORD *)&v22);
      }
      while (v11 != v21);
      uint64_t v11 = [(NSArray *)v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }
}

- (void)resetTarget
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_targetNodes;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setSimdEulerAngles:", 0.0, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)affectsNode:(id)a3
{
  return self->_rootJoint == a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetNodes, 0);
  objc_storeStrong((id *)&self->_rootJoint, 0);
  objc_storeStrong((id *)&self->_drivingNode, 0);
  objc_storeStrong((id *)&self->_referenceNode, 0);
}

@end