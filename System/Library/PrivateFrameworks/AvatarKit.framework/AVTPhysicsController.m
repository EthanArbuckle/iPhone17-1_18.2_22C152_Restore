@interface AVTPhysicsController
- (AVTPhysicsControllerDelegate)delegate;
- (__n128)offsetFromRestingPositionForNode:(void *)a3 inCoordinateSpaceOfNode:(void *)a4;
- (id)physicsState;
- (void)_setupCollisionNode:(id)a3;
- (void)_setupPhysicsChain:(id)a3 physicsRigs:(id)a4;
- (void)addToPhysicsWorld:(id)a3;
- (void)applyForcesWithMultiplier:(double)a3;
- (void)downforcesDidChange;
- (void)installPhysics;
- (void)physicsState;
- (void)removeFromPhysicsWorld:(id)a3;
- (void)resetToPhysicsState:(id)a3 assumeRestStateIfNil:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setupPhysics;
- (void)setupPhysicsIfNeeded;
- (void)updateAtTime:(double)a3 forceMultiplier:(double)a4;
@end

@implementation AVTPhysicsController

- (void)applyForcesWithMultiplier:(double)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  if (!self->_hasPhysicsStateOverride)
  {
    if (!self->_setupDone)
    {
      v5 = avt_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[AVTPhysicsController applyForcesWithMultiplier:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_physicsWorld);
    [WeakRetained scale];
    double v15 = v14;

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v16 = self->_physicsRigs;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v17)
    {
      uint64_t v19 = v17;
      *(float *)v18.i32 = v15;
      uint64_t v20 = *(void *)v54;
      float v21 = *(float *)v18.i32 * a3;
      float32x4_t v49 = (float32x4_t)vdupq_lane_s32(v18, 0);
      __asm { FMOV            V0.4S, #5.0 }
      float32x4_t v51 = _Q0;
      float v52 = v21;
      float32x4_t v47 = (float32x4_t)vdupq_n_s32(0x42440000u);
      float32x4_t v48 = (float32x4_t)xmmword_20B88FE10;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v54 != v20) {
            objc_enumerationMutation(v16);
          }
          uint64_t v28 = *(void *)(*((void *)&v53 + 1) + 8 * v27);
          if (v28) {
            v29 = *(void **)(v28 + 16);
          }
          else {
            v29 = 0;
          }
          v30 = objc_msgSend(v29, "presentationNode", *(_OWORD *)&v47, *(_OWORD *)&v48, *(_OWORD *)&v49);
          if (v28) {
            v31 = *(void **)(v28 + 24);
          }
          else {
            v31 = 0;
          }
          v32 = [v31 presentationNode];
          if (v28) {
            v33 = *(void **)(v28 + 32);
          }
          else {
            v33 = 0;
          }
          id v34 = v33;
          [v30 simdConvertPosition:v32 toNode:0.0];
          if (v28) {
            float32x4_t v36 = *(float32x4_t *)(v28 + 64);
          }
          else {
            float32x4_t v36 = 0uLL;
          }
          float32x4_t v37 = vmulq_f32(vsubq_f32(v36, v35), v51);
          float32x4_t v38 = vmulq_f32(v37, v37);
          float v39 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))).f32[0]);
          if (v39 > 20.0) {
            v37.i64[0] = vmulq_n_f32(v37, 20.0 / v39).u64[0];
          }
          [v32 simdConvertVector:0 toNode:*(double *)v37.i64];
          float32x4_t v42 = vmulq_n_f32(v41, v52);
          if (v28)
          {
            double v43 = *(double *)(v28 + 48);
            if (v43 < 0.0) {
              goto LABEL_27;
            }
            float32x4_t v50 = v42;
            float32x4_t v42 = *(float32x4_t *)(v28 + 80);
          }
          else
          {
            float32x4_t v50 = v42;
            v42.i64[0] = 0;
          }
          [v32 simdConvertVector:0 toNode:*(double *)v42.i64];
          if (v28) {
            double v43 = *(double *)(v28 + 48);
          }
          else {
            double v43 = 0.0;
          }
          float32x4_t v40 = vmulq_f32(vmlsq_f32(v48, v49, v44), v47);
          float v45 = v43;
          float32x4_t v42 = vmlaq_n_f32(v50, v40, v45);
LABEL_27:
          LODWORD(v43) = v42.i32[1];
          v40.i32[0] = v42.i32[2];
          objc_msgSend(v34, "applyForce:impulse:", 0, *(double *)v42.i64, v43, *(double *)v40.i64);

          ++v27;
        }
        while (v19 != v27);
        uint64_t v46 = [(NSArray *)v16 countByEnumeratingWithState:&v53 objects:v57 count:16];
        uint64_t v19 = v46;
      }
      while (v46);
    }
  }
}

- (void)updateAtTime:(double)a3 forceMultiplier:(double)a4
{
  if (!self->_hasPhysicsStateOverride)
  {
    if (self->_physicsBehaviorsAreInstalledInPhysicsWorld)
    {
      [(AVTPhysicsController *)self applyForcesWithMultiplier:a4];
    }
    else
    {
      self->_physicsBehaviorsAreInstalledInPhysicsWorld = 1;
      [(AVTPhysicsController *)self installPhysics];
    }
  }
}

- (__n128)offsetFromRestingPositionForNode:(void *)a3 inCoordinateSpaceOfNode:(void *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  float32x4_t v31 = 0u;
  id v8 = *(id *)(a1 + 16);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * v12);
        if (v13) {
          id v14 = *(id *)(v13 + 16);
        }
        else {
          id v14 = 0;
        }
        if (v14 == v6)
        {
          if (*(unsigned char *)(a1 + 33))
          {
            if (v13)
            {
              id v16 = *(id *)(v13 + 24);
              long long v17 = *(_OWORD *)(v13 + 64);
            }
            else
            {
              id v16 = 0;
              *(void *)&long long v17 = 0;
            }
            [v16 simdConvertPosition:v7 toNode:*(double *)&v17];
            float32x4_t v32 = v18;

            [v6 simdConvertPosition:v7 toNode:0.0];
            float32x4_t v31 = vsubq_f32(v19, v32);
          }
          else
          {
            uint64_t v20 = [v7 presentationNode];
            if (v13) {
              float v21 = *(void **)(v13 + 24);
            }
            else {
              float v21 = 0;
            }
            id v22 = v21;
            v23 = [v22 presentationNode];
            v24 = v23;
            if (v13) {
              long long v25 = *(_OWORD *)(v13 + 64);
            }
            else {
              *(void *)&long long v25 = 0;
            }
            [v23 simdConvertPosition:v20 toNode:*(double *)&v25];
            float32x4_t v33 = v26;

            uint64_t v27 = [v6 presentationNode];
            [v27 simdConvertPosition:v20 toNode:0.0];
            float32x4_t v30 = v28;

            float32x4_t v31 = vsubq_f32(v30, v33);
          }
          goto LABEL_23;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v15 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
      uint64_t v10 = v15;
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_23:

  return (__n128)v31;
}

- (void)installPhysics
{
  [(AVTPhysicsController *)self setupPhysicsIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_physicsWorld);
  v4 = (void *)MEMORY[0x263F16B08];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__AVTPhysicsController_installPhysics__block_invoke;
  v6[3] = &unk_26401F5A8;
  v6[4] = self;
  id v7 = WeakRetained;
  id v5 = WeakRetained;
  [v4 enqueueCommandForObject:v5 immediateTransactionBlock:v6];
}

uint64_t __38__AVTPhysicsController_installPhysics__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        if (!v7 || !*(void *)(v7 + 40))
        {
          id v8 = avt_default_log();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            __38__AVTPhysicsController_installPhysics__block_invoke_cold_1(buf, &v18, v8);
          }
        }
        if (v7) {
          uint64_t v9 = *(void *)(v7 + 40);
        }
        else {
          uint64_t v9 = 0;
        }
        objc_msgSend(*(id *)(a1 + 40), "addBehavior:", v9, (void)v13);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v10 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
      uint64_t v4 = v10;
    }
    while (v10);
  }

  [*(id *)(a1 + 40) setSpeed:8.0];
  int v11 = 60;
  do
  {
    objc_msgSend(*(id *)(a1 + 32), "applyForcesWithMultiplier:", 1.0, (void)v13);
    [*(id *)(a1 + 40) _step:0.0166666667];
    --v11;
  }
  while (v11);
  return [*(id *)(a1 + 40) setSpeed:4.0];
}

- (void)setupPhysicsIfNeeded
{
  if (!self->_setupDone)
  {
    obj = self;
    objc_sync_enter(obj);
    if (!self->_setupDone)
    {
      [(AVTPhysicsController *)obj setupPhysics];
      self->_setupDone = 1;
    }
    objc_sync_exit(obj);
  }
}

- (void)setupPhysics
{
}

void __36__AVTPhysicsController_setupPhysics__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 name];
  int v4 = [v3 hasSuffix:@"_DYN"];

  if (v4)
  {
    uint64_t v5 = [v8 parentNode];
    uint64_t v6 = [v5 name];
    char v7 = [v6 hasSuffix:@"_DYN"];

    if ((v7 & 1) == 0) {
      [*(id *)(a1 + 32) _setupPhysicsChain:v8 physicsRigs:*(void *)(a1 + 40)];
    }
  }
}

- (void)_setupCollisionNode:(id)a3
{
}

void __44__AVTPhysicsController__setupCollisionNode___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v2 = [v7 geometry];

  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F16AA0] kinematicBody];
    [v7 setPhysicsBody:v3];

    int v4 = [v7 physicsBody];
    [v4 setRestitution:0.0];

    uint64_t v5 = [v7 physicsBody];
    [v5 setFriction:1.0];

    uint64_t v6 = [v7 physicsBody];
    [v6 setCategoryBitMask:8];

    [v7 setOpacity:0.0];
  }
}

- (void)_setupPhysicsChain:(id)a3 physicsRigs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [MEMORY[0x263F16AF8] sphereWithRadius:1.5];
    [v8 setSegmentCount:12];
    [v6 setGeometry:v8];
    [v6 setOpacity:0.0];
    uint64_t v9 = [MEMORY[0x263F16AA0] kinematicBody];
    [v9 setAffectedByGravity:0];
    [v9 setDamping:0.8];
    [v9 setAngularDamping:0.8];
    [v6 setPhysicsBody:v9];
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy__1;
    v20[4] = __Block_byref_object_dispose__1;
    id v10 = v6;
    id v21 = v10;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__AVTPhysicsController__setupPhysicsChain_physicsRigs___block_invoke;
    v13[3] = &unk_26401F618;
    id v11 = v8;
    id v14 = v11;
    float32x4_t v19 = v20;
    id v15 = v10;
    long long v16 = self;
    id v12 = v9;
    id v17 = v12;
    id v18 = v7;
    [v15 enumerateChildNodesUsingBlock:v13];

    _Block_object_dispose(v20, 8);
  }
}

void __55__AVTPhysicsController__setupPhysicsChain_physicsRigs___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setGeometry:*(void *)(a1 + 32)];
  [v5 setOpacity:0.0];
  id v6 = objc_alloc_init(AVTPhysicsRig);
  -[AVTPhysicsRig setRig:]((uint64_t)v6, v5);
  -[AVTPhysicsRig setChainRoot:]((uint64_t)v6, *(void **)(a1 + 40));
  id v7 = [MEMORY[0x263F16AA0] dynamicBody];
  [v7 setCategoryBitMask:3];
  [v7 setCollisionBitMask:8];
  [v7 setAffectedByGravity:0];
  [v7 setDamping:0.8];
  [v7 setAngularDamping:0.8];
  [v5 setPhysicsBody:v7];
  -[AVTPhysicsRig setPhysicsBody:]((uint64_t)v6, v7);
  [v5 simdConvertPosition:*(void *)(a1 + 40) toNode:0.0];
  long long v45 = v8;
  [v5 simdConvertPosition:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) toNode:0.0];
  float32x4_t v46 = v9;
  if (v6)
  {
    *(_OWORD *)v6->_restPosition_chainRoot = v45;
    [*(id *)(a1 + 40) simdConvertVector:0 fromNode:-0.0078125];
    *(_OWORD *)v6->_restGravityVector_chainRoot = v10;
  }
  else
  {
    [*(id *)(a1 + 40) simdConvertVector:0 fromNode:-0.0078125];
  }
  id v11 = [v5 name];
  if (v11)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 40));
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v3 = [v5 name];
    [WeakRetained physicsController:v12 downforceForNodeNamed:v3];
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  double v13 = -1.0;
  if (v6) {
LABEL_5:
  }
    v6->_downForceFactor = v13;
LABEL_6:
  if (v11)
  {
  }
  float32x4_t v14 = vmulq_f32(v46, v46);
  LODWORD(v15) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))).u32[0];
  if (v6)
  {
    v6->_coneConstraintLength = sqrtf(v15);
    v6->_coneConstraintSinusAngularLimit = 0.30902;
  }
  float v16 = v15;
  float32x2_t v17 = vrsqrte_f32((float32x2_t)LODWORD(v15));
  float32x2_t v18 = vmul_f32(v17, vrsqrts_f32((float32x2_t)LODWORD(v16), vmul_f32(v17, v17)));
  float32x4_t v19 = vmulq_n_f32(v46, vmul_f32(v18, vrsqrts_f32((float32x2_t)LODWORD(v16), vmul_f32(v18, v18))).f32[0]);
  float32x4_t v20 = vabsq_f32(v19);
  if (v20.f32[0] >= v20.f32[1])
  {
    if (v20.f32[1] < v20.f32[2])
    {
      v21.i32[1] = 0;
      v21.f32[0] = -v19.f32[2];
      v21.i64[1] = v19.u32[0];
      goto LABEL_16;
    }
  }
  else if (v20.f32[0] < v20.f32[2])
  {
    v21.i32[0] = 0;
    v21.f32[1] = -v19.f32[2];
    v21.i64[1] = v19.u32[1];
    goto LABEL_16;
  }
  v21.i64[1] = 0;
  v21.f32[0] = -v19.f32[1];
  v21.i32[1] = v19.i32[0];
LABEL_16:
  if (v6)
  {
    int32x4_t v22 = (int32x4_t)vmulq_f32(v21, v21);
    v22.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v22, 2), vadd_f32(*(float32x2_t *)v22.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v22.i8, 1))).u32[0];
    float32x2_t v23 = vrsqrte_f32((float32x2_t)v22.u32[0]);
    float32x2_t v24 = vmul_f32(v23, vrsqrts_f32((float32x2_t)v22.u32[0], vmul_f32(v23, v23)));
    float32x4_t v25 = vmulq_n_f32(v21, vmul_f32(v24, vrsqrts_f32((float32x2_t)v22.u32[0], vmul_f32(v24, v24))).f32[0]);
    int32x4_t v26 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v25, (int32x4_t)v25), (int8x16_t)v25, 0xCuLL), vnegq_f32(v19)), v25, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v19, (int32x4_t)v19), (int8x16_t)v19, 0xCuLL));
    *(float32x4_t *)v6->_anon_60 = v19;
    *(float32x4_t *)&v6->_anon_60[16] = v25;
    *(int8x16_t *)&v6->_anon_60[32] = vextq_s8((int8x16_t)vuzp1q_s32(v26, v26), (int8x16_t)v26, 0xCuLL);
  }
  objc_msgSend(v5, "simdConvertTransform:fromNode:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48));
  if (v6)
  {
    *(_OWORD *)&v6[1].super.isa = v27;
    *(_OWORD *)&v6[1]._rig = v28;
    *(_OWORD *)&v6[1]._physicsBody = v29;
    *(_OWORD *)&v6[1]._downForceFactor = v30;
  }
  uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v32 = *(void *)(a1 + 40);
  float32x4_t v33 = (void *)MEMORY[0x263F16AA8];
  if (v31 == v32)
  {
    long long v34 = *(void **)(a1 + 56);
    if (v6) {
      goto LABEL_22;
    }
  }
  else
  {
    long long v34 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) physicsBody];
    if (v6)
    {
LABEL_22:
      long long v36 = *(_OWORD *)&v6[1].super.isa;
      long long v35 = *(_OWORD *)&v6[1]._rig;
      long long v37 = *(_OWORD *)&v6[1]._physicsBody;
      long long v38 = *(_OWORD *)&v6[1]._downForceFactor;
      goto LABEL_23;
    }
  }
  long long v37 = 0uLL;
  long long v35 = 0uLL;
  long long v36 = 0uLL;
  long long v38 = 0uLL;
LABEL_23:
  v48[0] = v36;
  v48[1] = v35;
  v48[2] = v37;
  v48[3] = v38;
  long long v39 = *(_OWORD *)(MEMORY[0x263F16BB0] + 16);
  v47[0] = *MEMORY[0x263F16BB0];
  v47[1] = v39;
  long long v40 = *(_OWORD *)(MEMORY[0x263F16BB0] + 48);
  v47[2] = *(_OWORD *)(MEMORY[0x263F16BB0] + 32);
  v47[3] = v40;
  float32x4_t v41 = [v33 jointWithBodyA:v34 frameA:v47 bodyB:v7 frameB:v48];
  if (v31 == v32)
  {
    double v42 = 0.0;
  }
  else
  {

    double v42 = 0.314159265;
  }
  [v41 setMaximumAngularLimit1:0.314159265];
  [v41 setMaximumAngularLimit2:0.314159265];
  [v41 setMaximumTwistAngle:v42];
  -[AVTPhysicsRig setPhysicsBehavior:]((uint64_t)v6, v41);
  [*(id *)(a1 + 64) addObject:v6];
  uint64_t v43 = *(void *)(*(void *)(a1 + 72) + 8);
  float32x4_t v44 = *(void **)(v43 + 40);
  *(void *)(v43 + 40) = v5;
}

- (void)downforcesDidChange
{
}

- (id)physicsState
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (!self->_physicsRigs)
  {
    uint64_t v3 = avt_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      [(AVTPhysicsController *)v3 physicsState];
    }
  }
  float32x4_t v33 = _AVTPoseRoundingBehaviour();
  uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[NSArray count](self->_physicsRigs, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v11 = self->_physicsRigs;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v34 + 1) + 8 * v15);
        if (v16)
        {
          id v17 = *(id *)(v16 + 16);
          float32x2_t v18 = *(void **)(v16 + 24);
        }
        else
        {
          id v17 = 0;
          float32x2_t v18 = 0;
        }
        id v19 = v18;
        if (self->_physicsBehaviorsAreInstalledInPhysicsWorld)
        {
          uint64_t v20 = [v17 presentationNode];

          uint64_t v21 = [v19 presentationNode];

          id v19 = (id)v21;
          id v17 = (id)v20;
        }
        int32x4_t v22 = objc_msgSend(v17, "name", v32);
        [v19 simdConvertPosition:v17 fromNode:0.0];
        if (v16) {
          float32x4_t v24 = *(float32x4_t *)(v16 + 64);
        }
        else {
          float32x4_t v24 = 0uLL;
        }
        float32x4_t v25 = vabdq_f32(v23, v24);
        float32x4_t v26 = vmulq_f32(v25, v25);
        if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v26, 2), vaddq_f32(v26, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v26.f32, 1))).f32[0] >= 0.1)
        {
          long long v38 = @"offset";
          long long v27 = objc_msgSend(MEMORY[0x263EFF8C0], "avt_arrayWithFloat3:roundingBehavior:", v33, *(double *)vsubq_f32(v23, v24).i64);
          long long v39 = v27;
          long long v28 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
          [v32 setObject:v28 forKeyedSubscript:v22];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v29 = [(NSArray *)v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
      uint64_t v13 = v29;
    }
    while (v29);
  }

  long long v30 = [[AVTAvatarPhysicsState alloc] initWithDictionaryRepresentation:v32];
  return v30;
}

- (void)resetToPhysicsState:(id)a3 assumeRestStateIfNil:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(AVTPhysicsController *)self setupPhysicsIfNeeded];
  if (v6 || v4)
  {
    self->_hasPhysicsStateOverride = 1;
    objc_msgSend(v6, "dictionaryRepresentation", v6);
    obj = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    float32x4_t v33 = self->_physicsRigs;
    uint64_t v15 = [(NSArray *)v33 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v41;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v41 != v17) {
            objc_enumerationMutation(v33);
          }
          uint64_t v19 = *(void *)(*((void *)&v40 + 1) + 8 * v18);
          if (v19)
          {
            id v20 = *(id *)(v19 + 16);
            uint64_t v21 = *(void **)(v19 + 24);
          }
          else
          {
            id v20 = 0;
            uint64_t v21 = 0;
          }
          id v22 = v21;
          float32x4_t v23 = [v20 parentNode];
          float32x4_t v24 = [v20 name];
          float32x4_t v25 = [(NSArray *)obj objectForKeyedSubscript:v24];
          float32x4_t v26 = v25;
          if (v25)
          {
            long long v27 = [v25 objectForKeyedSubscript:@"offset"];
            objc_msgSend(v27, "avt_float3");
            float32x4_t v34 = v28;

            if (v19) {
              float32x4_t v29 = *(float32x4_t *)(v19 + 64);
            }
            else {
              float32x4_t v29 = 0uLL;
            }
            v29.i64[0] = vaddq_f32(v34, v29).u64[0];
          }
          else if (v19)
          {
            float32x4_t v29 = *(float32x4_t *)(v19 + 64);
          }
          else
          {
            v29.i64[0] = 0;
          }
          [v22 simdConvertPosition:v23 toNode:*(double *)v29.i64];
          objc_msgSend(v20, "setSimdPosition:");
          long long v30 = [v20 physicsBody];
          [v30 setResting:1];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v31 = [(NSArray *)v33 countByEnumeratingWithState:&v40 objects:v45 count:16];
        uint64_t v16 = v31;
      }
      while (v31);
    }

    id v6 = v32;
  }
  else
  {
    self->_hasPhysicsStateOverride = 0;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obj = self->_physicsRigs;
    uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v37;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v37 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v36 + 1) + 8 * v10);
          if (v11) {
            uint64_t v12 = *(void **)(v11 + 16);
          }
          else {
            uint64_t v12 = 0;
          }
          uint64_t v13 = [v12 physicsBody];
          [v13 setResting:0];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v14 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v44 count:16];
        uint64_t v8 = v14;
      }
      while (v14);
    }
  }
}

- (void)addToPhysicsWorld:(id)a3
{
  id v4 = a3;
  p_physicsWorld = &self->_physicsWorld;
  id WeakRetained = objc_loadWeakRetained((id *)p_physicsWorld);

  if (WeakRetained)
  {
    uint64_t v7 = avt_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AVTPhysicsController addToPhysicsWorld:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  objc_storeWeak((id *)p_physicsWorld, v4);
}

- (void)removeFromPhysicsWorld:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_physicsWorld = &self->_physicsWorld;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_physicsWorld);

  if (WeakRetained != v4)
  {
    uint64_t v7 = avt_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AVTPhysicsController removeFromPhysicsWorld:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  if (self->_physicsBehaviorsAreInstalledInPhysicsWorld)
  {
    self->_physicsBehaviorsAreInstalledInPhysicsWorld = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v15 = self->_physicsRigs;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * v19);
          if (v20)
          {
            [v4 removeBehavior:*(void *)(v20 + 40)];
            uint64_t v21 = *(void **)(v20 + 16);
          }
          else
          {
            objc_msgSend(v4, "removeBehavior:", 0, (void)v23);
            uint64_t v21 = 0;
          }
          objc_msgSend(v21, "setPhysicsBody:", 0, (void)v23);
          ++v19;
        }
        while (v17 != v19);
        uint64_t v22 = [(NSArray *)v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
        uint64_t v17 = v22;
      }
      while (v22);
    }
  }
  objc_storeWeak((id *)p_physicsWorld, 0);
}

- (AVTPhysicsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTPhysicsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_physicsRigs, 0);
  objc_destroyWeak((id *)&self->_physicsWorld);
}

- (void)applyForcesWithMultiplier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __38__AVTPhysicsController_installPhysics__block_invoke_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "physicsRig.physicsBehavior";
}

- (void)physicsState
{
}

- (void)addToPhysicsWorld:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeFromPhysicsWorld:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end