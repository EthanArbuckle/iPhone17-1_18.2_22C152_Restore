@interface NTKSnowglobeDigitController
- (BOOL)exiting;
- (BOOL)pausePhysics;
- (NTKSnowglobeDigitController)initWithDigit:(unint64_t)a3 scene:(id)a4 queue:(id)a5 group:(id)a6 configureNode:(id)a7;
- (SCNNode)node;
- (SCNVector3)_effectiveOrigin;
- (SCNVector3)exitOrigin;
- (SCNVector3)origin;
- (__n128)setTritiumRotation:(__n128 *)result;
- (__n128)tritiumOrigin;
- (__n128)tritiumRotation;
- (double)_legMomentOfInertiaForNode:(void *)a3 body:(float32x4_t *)a4;
- (float32x2_t)_bodyMomentOfInertia;
- (unint64_t)digit;
- (void)_applyLegSpring:(id)a3;
- (void)_applyMotionAcceleration;
- (void)_queue_applyAcceleration;
- (void)_queue_applyLinearSpring;
- (void)_queue_applyRandAcceleration;
- (void)_queue_applyRotationSprings;
- (void)_queue_applyVelocity;
- (void)_queue_didAddToWorld;
- (void)_queue_setGrainIntensity:(float)a3 withCommit:(BOOL)a4;
- (void)_setupWithNode:(id)a3 configureNode:(id)a4;
- (void)applyTapAtLocalPosition:(SCNVector3)a3;
- (void)dealloc;
- (void)destroy;
- (void)didCollide;
- (void)resetToOrigin;
- (void)setExitOrigin:(SCNVector3)a3;
- (void)setExiting:(BOOL)a3;
- (void)setNode:(id)a3;
- (void)setOrigin:(SCNVector3)a3;
- (void)setPausePhysics:(BOOL)a3;
- (void)setTritiumOrigin:(NTKSnowglobeDigitController *)self;
- (void)updateAtTime:(double)a3;
@end

@implementation NTKSnowglobeDigitController

- (NTKSnowglobeDigitController)initWithDigit:(unint64_t)a3 scene:(id)a4 queue:(id)a5 group:(id)a6 configureNode:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)NTKSnowglobeDigitController;
  v17 = [(NTKSnowglobeDigitController *)&v30 init];
  if (v17)
  {
    dispatch_assert_queue_V2(v14);
    objc_storeStrong((id *)&v17->_scene, a4);
    uint64_t v18 = objc_opt_new();
    physicsBehaviors = v17->_physicsBehaviors;
    v17->_physicsBehaviors = (NSMutableArray *)v18;

    v17->_random = (double)(arc4random() / 0x3E8);
    v17->_random1 = (double)arc4random() / 4294967300.0;
    v17->_random2 = (double)arc4random() / 4294967300.0;
    v17->_random3 = (double)arc4random() / 4294967300.0;
    v17->_random4 = (double)arc4random() / 4294967300.0;
    *(_OWORD *)&v17->_anon_70[16] = 0u;
    *(_OWORD *)&v17->_anon_70[48] = 0u;
    v17->_accumulatedKick = 0.0;
    v17->_unint64_t digit = a3;
    uint64_t v20 = +[NTKSnowglobeDigitProfile profileForCharacter:a3];
    profile = v17->_profile;
    v17->_profile = (NTKSnowglobeDigitProfile *)v20;

    v17->_destroyed = 0;
    objc_storeStrong((id *)&v17->_renderQueue, a5);
    objc_storeStrong((id *)&v17->_loadGroup, a6);
    if (v17->_loadGroup)
    {
      v22 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t digit = v17->_digit;
        *(_DWORD *)buf = 134218242;
        unint64_t v32 = digit;
        __int16 v33 = 2112;
        v34 = v17;
        _os_log_impl(&dword_1DAFDF000, v22, OS_LOG_TYPE_DEFAULT, "Snowglobe enter group loading digit %lu for %@", buf, 0x16u);
      }

      dispatch_group_enter((dispatch_group_t)v17->_loadGroup);
    }
    v24 = +[NTKSnowglobeAssetLibrary sharedInstance];
    renderQueue = v17->_renderQueue;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1DAFE390C;
    v27[3] = &unk_1E6BE4D98;
    v28 = v17;
    id v29 = v16;
    [v24 digitNodeForNumber:a3 queue:renderQueue withCompletion:v27];
  }
  return v17;
}

- (void)_setupWithNode:(id)a3 configureNode:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, NTKSnowglobeDigitController *, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  v8 = self;
  objc_sync_enter(v8);
  if (v8->_destroyed)
  {
    v9 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_1DAFDF000, v9, OS_LOG_TYPE_DEFAULT, "Snowglobe early bail loading %@", (uint8_t *)&v14, 0xCu);
    }

    v7[2](v7, v8, 0);
    objc_sync_exit(v8);
LABEL_13:

    goto LABEL_14;
  }
  objc_sync_exit(v8);

  [(NTKSnowglobeDigitController *)v8 setNode:v6];
  if (v7) {
    ((void (**)(id, NTKSnowglobeDigitController *, id))v7)[2](v7, v8, v6);
  }
  v10 = [(SCNScene *)v8->_scene rootNode];
  [v10 addChildNode:v6];

  [(NTKSnowglobeDigitController *)v8 _queue_didAddToWorld];
  v11 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v8;
    _os_log_impl(&dword_1DAFDF000, v11, OS_LOG_TYPE_DEFAULT, "Snowglobe loaded digit for %@", (uint8_t *)&v14, 0xCu);
  }

  if (v8->_loadGroup)
  {
    v12 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_1DAFDF000, v12, OS_LOG_TYPE_DEFAULT, "Snowglobe leaving group for %@", (uint8_t *)&v14, 0xCu);
    }

    dispatch_group_leave((dispatch_group_t)v8->_loadGroup);
    loadGroup = v8->_loadGroup;
    v8->_loadGroup = 0;
    v8 = (NTKSnowglobeDigitController *)loadGroup;
    goto LABEL_13;
  }
LABEL_14:
}

- (void)destroy
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_destroyed)
  {
    objc_sync_exit(obj);
  }
  else
  {
    obj->_destroyed = 1;
    objc_sync_exit(obj);

    v2 = obj->_scene;
    v3 = obj->_node;
    v4 = obj->_physicsBehaviors;
    v5 = obj->_loadGroup;
    node = obj->_node;
    obj->_node = 0;

    loadGroup = obj->_loadGroup;
    obj->_loadGroup = 0;

    if (v5)
    {
      v8 = [(NTKSnowglobeDigitController *)obj description];
    }
    else
    {
      v8 = 0;
    }
    renderQueue = obj->_renderQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1DAFE3DA0;
    block[3] = &unk_1E6BE4DC0;
    v17 = v3;
    uint64_t v18 = v4;
    v19 = v2;
    uint64_t v20 = v5;
    id v21 = v8;
    id v10 = v8;
    v11 = v5;
    v12 = v2;
    id v13 = v4;
    int v14 = v3;
    dispatch_async(renderQueue, block);
  }
}

- (void)dealloc
{
  [(NTKSnowglobeDigitController *)self destroy];
  v3.receiver = self;
  v3.super_class = (Class)NTKSnowglobeDigitController;
  [(NTKSnowglobeDigitController *)&v3 dealloc];
}

- (void)setNode:(id)a3
{
  objc_super v30 = (SCNNode *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  node = self->_node;
  if (node != v30)
  {
    p_node = &self->_node;
    if (node)
    {
      [(SCNNode *)node position];
      -[SCNNode setPosition:](v30, "setPosition:");
      [(SCNNode *)*p_node rotation];
      -[SCNNode setRotation:](v30, "setRotation:");
      [(SCNNode *)*p_node removeFromParentNode];
    }
    objc_storeStrong((id *)&self->_node, a3);
    if (v30)
    {
      v7 = [(SCNNode *)v30 childNodeWithName:@"LeftEye" recursively:1];
      v8 = [(SCNNode *)v30 childNodeWithName:@"RightEye" recursively:1];
      v9 = [[NTKSnowglobeEyeController alloc] initWithLeftNode:v7 rightNode:v8 digitProfile:self->_profile];
      eyeController = self->_eyeController;
      self->_eyeController = v9;

      [(NTKSnowglobeEyeController *)self->_eyeController setAnimationEnabled:!self->_pausePhysics];
      v11 = [(SCNNode *)v30 childNodesPassingTest:&unk_1F3527EF8];
      v12 = [v11 firstObject];
      leg1 = self->_leg1;
      self->_leg1 = v12;

      int v14 = [(SCNNode *)v30 childNodesPassingTest:&unk_1F3527F18];
      id v15 = [v14 firstObject];
      leg2 = self->_leg2;
      self->_leg2 = v15;

      [(SCNNode *)self->_leg1 setSimdEulerAngles:0.0];
      [(SCNNode *)self->_leg2 setSimdEulerAngles:0.0];
      [(SCNNode *)self->_leg1 position];
      int v18 = v17;
      int v20 = v19;
      [(SCNNode *)self->_leg2 position];
      int v22 = v21;
      int v24 = v23;
      LODWORD(v25) = v18;
      LODWORD(v26) = v20;
      -[SCNNode setPosition:](self->_leg1, "setPosition:", v25, v26, 0.0);
      LODWORD(v27) = v22;
      LODWORD(v28) = v24;
      -[SCNNode setPosition:](self->_leg2, "setPosition:", v27, v28, 0.0);
      *(_OWORD *)&self->_anon_c0[64] = xmmword_1DAFF0930;
      *(_OWORD *)&self->_anon_110[64] = xmmword_1DAFF0940;
      [(NTKSnowglobeDigitController *)self _queue_setGrainIntensity:0 withCommit:-0.000000381469873];
    }
    else
    {
      id v29 = self->_leg1;
      self->_leg1 = 0;

      v7 = self->_leg2;
      self->_leg2 = 0;
    }
  }
}

- (void)_queue_didAddToWorld
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  objc_super v3 = (void *)MEMORY[0x1E4F3B238];
  v4 = [(SCNNode *)self->_leg1 physicsBody];
  v5 = [(SCNNode *)self->_node physicsBody];
  leg1 = self->_leg1;
  if (leg1) {
    [(SCNNode *)leg1 transform];
  }
  else {
    memset(v26, 0, sizeof(v26));
  }
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F3B358] + 16);
  long long v22 = *MEMORY[0x1E4F3B358];
  long long v23 = v18;
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F3B358] + 48);
  long long v24 = *(_OWORD *)(MEMORY[0x1E4F3B358] + 32);
  long long v25 = v15;
  v7 = objc_msgSend(v3, "jointWithBodyA:frameA:bodyB:frameB:", v4, &v22, v5, v26, v15, v24, v18, v22);

  [v7 setMaximumTwistAngle:1.57079633];
  [v7 setMaximumAngularLimit1:0.314159265];
  [v7 setMaximumAngularLimit2:0.0];
  v8 = [(SCNScene *)self->_scene physicsWorld];
  [v8 addBehavior:v7];

  v9 = (void *)MEMORY[0x1E4F3B238];
  id v10 = [(SCNNode *)self->_leg2 physicsBody];
  v11 = [(SCNNode *)self->_node physicsBody];
  leg2 = self->_leg2;
  if (leg2) {
    [(SCNNode *)leg2 transform];
  }
  else {
    memset(v21, 0, sizeof(v21));
  }
  long long v22 = v20;
  long long v23 = v19;
  long long v24 = v17;
  long long v25 = v16;
  id v13 = [v9 jointWithBodyA:v10 frameA:&v22 bodyB:v11 frameB:v21];

  [v13 setMaximumTwistAngle:1.57079633];
  [v13 setMaximumAngularLimit1:0.314159265];
  [v13 setMaximumAngularLimit2:0.0];
  int v14 = [(SCNScene *)self->_scene physicsWorld];
  [v14 addBehavior:v13];

  [(NSMutableArray *)self->_physicsBehaviors addObject:v7];
  [(NSMutableArray *)self->_physicsBehaviors addObject:v13];
}

- (void)_queue_setGrainIntensity:(float)a3 withCommit:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  if (v4) {
    [MEMORY[0x1E4F3B280] begin];
  }
  node = self->_node;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1DAFE4558;
  v8[3] = &unk_1E6BE4E00;
  float v9 = a3;
  [(SCNNode *)node enumerateHierarchyUsingBlock:v8];
  if (v4) {
    [MEMORY[0x1E4F3B280] commit];
  }
}

- (void)resetToOrigin
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  if (self->_tritium)
  {
    [(NTKSnowglobeDigitController *)self tritiumOrigin];
    -[SCNNode setSimdPosition:](self->_node, "setSimdPosition:");
    [(NTKSnowglobeDigitController *)self tritiumRotation];
    -[SCNNode setSimdOrientation:](self->_node, "setSimdOrientation:");
    int v3 = *MEMORY[0x1E4F3B3F0];
    int v4 = *(_DWORD *)(MEMORY[0x1E4F3B3F0] + 4);
    int v5 = *(_DWORD *)(MEMORY[0x1E4F3B3F0] + 8);
    int v6 = *(_DWORD *)(MEMORY[0x1E4F3B3F0] + 12);
  }
  else
  {
    [(NTKSnowglobeDigitController *)self _effectiveOrigin];
    -[SCNNode setPosition:](self->_node, "setPosition:");
    int v3 = *MEMORY[0x1E4F3B3F0];
    int v4 = *(_DWORD *)(MEMORY[0x1E4F3B3F0] + 4);
    int v5 = *(_DWORD *)(MEMORY[0x1E4F3B3F0] + 8);
    int v6 = *(_DWORD *)(MEMORY[0x1E4F3B3F0] + 12);
    LODWORD(v7) = *MEMORY[0x1E4F3B3F0];
    LODWORD(v8) = v4;
    LODWORD(v9) = v5;
    LODWORD(v10) = v6;
    -[SCNNode setRotation:](self->_node, "setRotation:", v7, v8, v9, v10);
  }
  int v11 = *MEMORY[0x1E4F3B3E8];
  int v12 = *(_DWORD *)(MEMORY[0x1E4F3B3E8] + 4);
  int v13 = *(_DWORD *)(MEMORY[0x1E4F3B3E8] + 8);
  int v14 = [(SCNNode *)self->_node physicsBody];
  LODWORD(v15) = v11;
  LODWORD(v16) = v12;
  LODWORD(v17) = v13;
  objc_msgSend(v14, "setVelocity:", v15, v16, v17);

  long long v18 = [(SCNNode *)self->_node physicsBody];
  LODWORD(v19) = v3;
  LODWORD(v20) = v4;
  LODWORD(v21) = v5;
  LODWORD(v22) = v6;
  objc_msgSend(v18, "setAngularVelocity:", v19, v20, v21, v22);

  long long v23 = [(SCNNode *)self->_node physicsBody];
  [v23 resetTransform];

  long long v24 = [(SCNNode *)self->_leg1 physicsBody];
  [v24 resetTransform];

  id v25 = [(SCNNode *)self->_leg2 physicsBody];
  [v25 resetTransform];
}

- (void)setPausePhysics:(BOOL)a3
{
  if (self->_pausePhysics != a3)
  {
    self->_pausePhysics = a3;
    [(NTKSnowglobeEyeController *)self->_eyeController setAnimationEnabled:!a3];
  }
}

- (void)updateAtTime:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  node = self->_node;
  if (node)
  {
    int v6 = [(SCNNode *)node presentationNode];

    if (v6)
    {
      [(NTKSnowglobeEyeController *)self->_eyeController updateAtTime:a3];
      if (!self->started)
      {
        self->started = 1;
        self->startTime = a3;
      }
      double v7 = [(SCNNode *)self->_node physicsBody];
      uint64_t v8 = [v7 collisionBitMask];

      if (v8 != -1)
      {
        [(NTKSnowglobeDigitController *)self _effectiveOrigin];
        v10.i32[1] = v9;
        v10.i32[2] = v11;
        float32x4_t v50 = v10;
        int v12 = [(SCNNode *)self->_node presentationNode];
        [v12 simdPosition];
        float32x4_t v51 = vsubq_f32(v50, v13);

        float32x4_t v14 = vmulq_f32(v51, v51);
        if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))).f32[0] < 0.5)
        {
          double v15 = [(SCNNode *)self->_node physicsBody];
          [v15 setCollisionBitMask:-1];

          double v16 = [(SCNNode *)self->_node physicsBody];
          [v16 setContactTestBitMask:-1];
        }
      }
      if (!self->_pausePhysics)
      {
        double v17 = [(SCNNode *)self->_node physicsBody];
        [v17 velocity];
        v49.i64[0] = v18;
        __int32 v48 = v19;
        __int32 v52 = v20;

        float32x4_t v21 = v49;
        v21.i32[1] = v48;
        v21.i32[2] = v52;
        float32x4_t v22 = vmulq_f32(v21, v21);
        double v23 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0]);
        double v24 = NTKSnowglobeTunableFloat(@"kickSpeed", 0.5);
        [(NTKSnowglobeDigitProfile *)self->_profile kickMultiplier];
        double v26 = self->_accumulatedKick
            + (v24 * v25 + NTKSnowglobeTunableFloat(@"kickSpeedMotionMultiplier", 0.7) * v23) * 0.0333333333;
        self->_accumulatedKick = v26;
        float v27 = sin((self->_random1 * 2.0 + 1.0) * (v26 + v26)) * -3.14159265 / 3.0;
        *(float *)&double v26 = sin((self->_random2 * 2.0 + 1.0) * (v26 * -2.0)) * -3.14159265 / 3.0;
        [(NTKSnowglobeDigitController *)self _applyLegSpring:self->_leg1];
        [(NTKSnowglobeDigitController *)self _applyLegSpring:self->_leg2];
        double v28 = [(SCNNode *)self->_leg1 physicsBody];
        id v29 = [(SCNNode *)self->_leg1 physicsBody];
        [v29 mass];
        double v31 = v27 * 0.0333333333 * v30;
        *(float *)&double v32 = v31;
        LODWORD(v31) = 1.0;
        objc_msgSend(v28, "applyTorque:impulse:", 1, v31, 0.0, 0.0, v32);

        __int16 v33 = [(SCNNode *)self->_leg2 physicsBody];
        v34 = [(SCNNode *)self->_leg2 physicsBody];
        [v34 mass];
        double v36 = *(float *)&v26 * 0.0333333333 * v35;
        *(float *)&double v37 = v36;
        LODWORD(v36) = 1.0;
        objc_msgSend(v33, "applyTorque:impulse:", 1, v36, 0.0, 0.0, v37);

        v38 = [(SCNNode *)self->_node physicsBody];
        [v38 velocity];
        DWORD1(v40) = v39;
        DWORD2(v40) = v41;
        *(_OWORD *)self->_anon_70 = v40;

        v42 = [(SCNNode *)self->_node physicsBody];
        [v42 angularVelocity];
        v44.i32[1] = v43;
        v44.i64[1] = __PAIR64__(v46, v45);
        NTKMakeEulerAnglesFromAxisAngle(v44);
        *(_OWORD *)&self->_anon_70[32] = v47;

        [(NTKSnowglobeDigitController *)self _queue_applyRandAcceleration];
        [(NTKSnowglobeDigitController *)self _queue_applyRotationSprings];
        [(NTKSnowglobeDigitController *)self _queue_applyLinearSpring];
        [(NTKSnowglobeDigitController *)self _applyMotionAcceleration];
        [(NTKSnowglobeDigitController *)self _queue_applyVelocity];
        [(NTKSnowglobeDigitController *)self _queue_applyAcceleration];
        *(_OWORD *)&self->_anon_70[16] = 0u;
        *(_OWORD *)&self->_anon_70[48] = 0u;
      }
    }
  }
}

- (void)_queue_applyAcceleration
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  float32x4_t v16 = vmulq_f32(*(float32x4_t *)&self->_anon_70[16], (float32x4_t)vdupq_n_s32(0x3D088889u));
  int v3 = [(SCNNode *)self->_node physicsBody];
  LODWORD(v5) = v16.i32[2];
  LODWORD(v4) = v16.i32[1];
  objc_msgSend(v3, "applyForce:impulse:", 1, *(double *)v16.i64, v4, v5);

  float32x4_t v6 = *(float32x4_t *)&self->_anon_70[48];
  float32x4_t v7 = vmulq_f32(v6, v6);
  if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).f32[0] > 0.0)
  {
    double v17 = NTKMakeAxisAngleFromEulerAngles(v6);
    float v9 = v8 * 0.0333333333;
    int v11 = v10;
    id v15 = [(SCNNode *)self->_node physicsBody];
    LODWORD(v12) = HIDWORD(v17);
    LODWORD(v13) = v11;
    *(float *)&double v14 = v9;
    objc_msgSend(v15, "applyTorque:impulse:", 1, v17, v12, v13, v14);
  }
}

- (void)_queue_applyVelocity
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  int v3 = [(SCNNode *)self->_node physicsBody];
  [v3 velocity];
  DWORD1(v5) = v4;
  DWORD2(v5) = v6;
  *(_OWORD *)self->_anon_70 = v5;

  id v12 = [(SCNNode *)self->_node physicsBody];
  [v12 angularVelocity];
  v8.i32[1] = v7;
  v8.i64[1] = __PAIR64__(v10, v9);
  NTKMakeEulerAnglesFromAxisAngle(v8);
  *(_OWORD *)&self->_anon_70[32] = v11;
}

- (void)_queue_applyRandAcceleration
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  v3.i64[0] = arc4random();
  v3.i64[1] = arc4random();
  float32x4_t v4 = (float32x4_t)vdivq_f64(vcvtq_f64_u64(v3), (float64x2_t)vdupq_n_s64(0x41EFFFFFFFE00000uLL));
  *(float32x2_t *)v4.f32 = vcvt_f32_f64((float64x2_t)v4);
  v4.i32[2] = 0;
  v5.i64[0] = 0x4000000040000000;
  v5.i64[1] = 0x4000000040000000;
  __asm { FMOV            V2.4S, #-1.0 }
  float32x4_t v11 = vmlaq_f32(_Q2, v5, v4);
  float32x4_t v12 = vaddq_f32(v11, v11);
  v12.i32[2] = 0;
  float32x4_t v16 = v12;
  [(NTKSnowglobeDigitProfile *)self->_profile randomMotionMultiplier];
  float v14 = NTKSnowglobeTunableFloat(@"randomMotionMultiplier", 0.3) * v13;
  float32x4_t v15 = vmlaq_f32(vmulq_f32(vmulq_n_f32(v16, v14), (float32x4_t)vdupq_n_s32(0x3DCCCCCDu)), (float32x4_t)vdupq_n_s32(0x3F666666u), *(float32x4_t *)self->_randAccel);
  *(float32x4_t *)self->_randAccel = v15;
  *(float32x4_t *)&self->_anon_70[16] = vaddq_f32(*(float32x4_t *)&self->_anon_70[16], v15);
}

- (void)_queue_applyRotationSprings
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  uint64x2_t v3 = [(SCNNode *)self->_node presentationNode];
  [v3 simdOrientation];
  float32x4_t v23 = v4;

  float32x4_t v5 = vmulq_f32(v23, (float32x4_t)xmmword_1DAFF0950);
  float32x4_t v6 = (float32x4_t)vextq_s8((int8x16_t)v5, (int8x16_t)v5, 8uLL);
  *(float32x2_t *)v5.f32 = vadd_f32(*(float32x2_t *)v5.f32, *(float32x2_t *)v6.f32);
  v5.f32[0] = vaddv_f32(*(float32x2_t *)v5.f32);
  v6.i64[0] = 0;
  float32x4_t v21 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v6, v5), 0), (int8x16_t)xmmword_1DAFF0960, (int8x16_t)xmmword_1DAFF0950);
  [(NTKSnowglobeDigitProfile *)self->_profile springMultiplier];
  int8x16_t v7 = (int8x16_t)vmulq_f32(v23, v23);
  *(float32x2_t *)v7.i8 = vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL));
  v7.i32[0] = vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v7.i8, 1)).u32[0];
  float32x2_t v8 = vrecpe_f32((float32x2_t)v7.u32[0]);
  float32x2_t v9 = vmul_f32(v8, vrecps_f32((float32x2_t)v7.u32[0], v8));
  float32x4_t v10 = vmulq_n_f32(vmulq_f32(v23, (float32x4_t)xmmword_1DAFF0970), vmul_f32(v9, vrecps_f32((float32x2_t)v7.u32[0], v9)).f32[0]);
  int32x4_t v11 = (int32x4_t)vnegq_f32(v10);
  int8x16_t v12 = (int8x16_t)vtrn2q_s32((int32x4_t)v10, vtrn1q_s32((int32x4_t)v10, v11));
  float32x4_t v13 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v10, (int8x16_t)v11, 8uLL), *(float32x2_t *)v21.f32, 1), (float32x4_t)vextq_s8(v12, v12, 8uLL), v21.f32[0]);
  float32x4_t v14 = (float32x4_t)vrev64q_s32((int32x4_t)v10);
  v14.i32[0] = v11.i32[1];
  v14.i32[3] = v11.i32[2];
  float32x4_t v16 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v10, v21, 3), v14, v21, 2), v13);
  float v17 = (float)(v15 + v15) * 0.0333333333;
  __n128 v24 = NTKMakeAxisAngleFromQuat(vmulq_n_f32(v16, v17), *(double *)v16.i64);
  float32x4_t v22 = [(SCNNode *)self->_node physicsBody];
  LODWORD(v19) = v24.n128_u32[2];
  LODWORD(v18) = v24.n128_u32[1];
  LODWORD(v20) = v24.n128_u32[3];
  objc_msgSend(v22, "applyTorque:impulse:", 1, v24.n128_f64[0], v18, v19, v20);
}

- (void)_queue_applyLinearSpring
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_renderQueue);
  [(NTKSnowglobeDigitController *)self _effectiveOrigin];
  v21.i64[0] = v3;
  __int32 v20 = v4;
  __int32 v24 = v5;
  float32x4_t v6 = [(SCNNode *)self->_node presentationNode];
  [v6 simdPosition];
  float32x4_t v7 = v21;
  v7.i32[1] = v20;
  v7.i32[2] = v24;
  float32x4_t v25 = vsubq_f32(v8, v7);

  float32x4_t v9 = v25;
  float32x4_t v10 = vmulq_f32(v9, v9);
  float v11 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).f32[0];
  float32x2_t v12 = 0;
  if (v11 > 0.001)
  {
    uint64_t v13 = LODWORD(v11);
    float32x2_t v14 = vrsqrte_f32((float32x2_t)LODWORD(v11));
    float32x2_t v15 = vmul_f32(v14, vrsqrts_f32((float32x2_t)v13, vmul_f32(v14, v14)));
    float32x4_t v22 = vmulq_f32(vmulq_n_f32(v25, vmul_f32(v15, vrsqrts_f32((float32x2_t)v13, vmul_f32(v15, v15))).f32[0]), (float32x4_t)xmmword_1DAFF0980);
    [(NTKSnowglobeDigitProfile *)self->_profile springMultiplier];
    float32x4_t v23 = vmulq_n_f32(v22, v16);
    double v17 = NTKSnowglobeTunableFloat(@"springMultiplier", 0.8);
    float32x4_t v9 = v25;
    *(float *)&double v17 = v17;
    float32x4_t v18 = vmulq_n_f32(v23, *(float *)&v17);
    float32x4_t v19 = vmulq_f32(v18, v18);
    float32x2_t v12 = (float32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2), vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1))).u64[0];
    v12.f32[0] = sqrtf(v12.f32[0]);
  }
  *(float32x4_t *)&self->_anon_70[16] = vaddq_f32(*(float32x4_t *)&self->_anon_70[16], vmlsq_lane_f32(vmulq_f32(*(float32x4_t *)self->_anon_70, (float32x4_t)xmmword_1DAFF0990), v9, v12, 0));
}

- (double)_legMomentOfInertiaForNode:(void *)a3 body:(float32x4_t *)a4
{
  float32x4_t v11 = a4[4];
  [a3 simdTransform];
  float32x4_t v8 = vaddq_f32(v7, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, v11.f32[0]), v5, *(float32x2_t *)v11.f32, 1), v6, v11, 2));
  int32x4_t v9 = (int32x4_t)vmulq_f32(v8, v8);
  *(int32x2_t *)v7.f32 = vrev64_s32(*(int32x2_t *)v8.f32);
  *(float32x2_t *)v6.f32 = vmla_f32((float32x2_t)vdup_laneq_s32(v9, 2), *(float32x2_t *)v7.f32, *(float32x2_t *)v7.f32);
  v6.i32[2] = vmlas_n_f32(*(float *)&v9.i32[1], v8.f32[0], v8.f32[0]);
  *(void *)&double result = vmulq_f32(v6, (float32x4_t)vdupq_n_s32(0x3E4CCCCDu)).u64[0];
  return result;
}

- (float32x2_t)_bodyMomentOfInertia
{
  return vcvt_f32_f64(vmulq_f64(vmulq_n_f64((float64x2_t)xmmword_1DAFF09A0, NTKSnowglobeTunableFloat(@"bodyMass", 20.0) * 0.666666667), (float64x2_t)xmmword_1DAFF09A0));
}

- (void)_applyLegSpring:(id)a3
{
  id v3 = a3;
  float32x4_t v4 = [v3 presentationNode];
  [v4 simdOrientation];
  *(_OWORD *)float32x4_t v23 = v5;

  float32x4_t v6 = vmulq_f32(*(float32x4_t *)v23, (float32x4_t)xmmword_1DAFF0950);
  float32x4_t v7 = (float32x4_t)vextq_s8((int8x16_t)v6, (int8x16_t)v6, 8uLL);
  *(float32x2_t *)v6.f32 = vadd_f32(*(float32x2_t *)v6.f32, *(float32x2_t *)v7.f32);
  v6.f32[0] = vaddv_f32(*(float32x2_t *)v6.f32);
  v7.i64[0] = 0;
  float32x4_t v8 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v7, v6), 0), (int8x16_t)xmmword_1DAFF0960, (int8x16_t)xmmword_1DAFF0950);
  int8x16_t v9 = (int8x16_t)vmulq_f32(*(float32x4_t *)v23, *(float32x4_t *)v23);
  *(float32x2_t *)v9.i8 = vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL));
  v9.i32[0] = vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v9.i8, 1)).u32[0];
  float32x2_t v10 = vrecpe_f32((float32x2_t)v9.u32[0]);
  float32x2_t v11 = vmul_f32(v10, vrecps_f32((float32x2_t)v9.u32[0], v10));
  float32x4_t v12 = vmulq_n_f32(vmulq_f32(*(float32x4_t *)v23, (float32x4_t)xmmword_1DAFF0970), vmul_f32(v11, vrecps_f32((float32x2_t)v9.u32[0], v11)).f32[0]);
  int32x4_t v13 = (int32x4_t)vnegq_f32(v12);
  int8x16_t v14 = (int8x16_t)vtrn2q_s32((int32x4_t)v12, vtrn1q_s32((int32x4_t)v12, v13));
  float32x4_t v15 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v12, (int8x16_t)v13, 8uLL), *(float32x2_t *)v8.f32, 1), (float32x4_t)vextq_s8(v14, v14, 8uLL), v8.f32[0]);
  float32x4_t v16 = (float32x4_t)vrev64q_s32((int32x4_t)v12);
  v16.i32[0] = v13.i32[1];
  v16.i32[3] = v13.i32[2];
  float32x4_t v17 = vaddq_f32(v15, vmlaq_laneq_f32(vmulq_laneq_f32(v12, v8, 3), v16, v8, 2));
  float32x4_t v18 = (float32x4_t)vdupq_n_s32(0x3BF04C75u);
  __n128 v22 = NTKMakeAxisAngleFromQuat(vmulq_f32(v17, v18), *(double *)v18.i64);
  __int32 v24 = [v3 physicsBody];

  LODWORD(v20) = v22.n128_u32[2];
  LODWORD(v19) = v22.n128_u32[1];
  LODWORD(v21) = v22.n128_u32[3];
  objc_msgSend(v24, "applyTorque:impulse:", 1, v22.n128_f64[0], v19, v20, v21);
}

- (SCNVector3)_effectiveOrigin
{
  uint64_t v2 = 548;
  uint64_t v3 = 552;
  if (!self->_exiting) {
    uint64_t v3 = 540;
  }
  uint64_t v4 = 556;
  if (!self->_exiting) {
    uint64_t v4 = 544;
  }
  float v5 = *(float *)((char *)&self->super.isa + v4);
  float v6 = *(float *)((char *)&self->super.isa + v3);
  if (!self->_exiting) {
    uint64_t v2 = 536;
  }
  float v7 = *(float *)((char *)&self->super.isa + v2);
  result.z = v5;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)applyTapAtLocalPosition:(SCNVector3)a3
{
  if (!self->_pausePhysics)
  {
    float y = a3.y;
    float x = a3.x;
    double v5 = NTKSnowglobeTunableFloat(@"tapAcceleration", 300.0);
    double v6 = NTKSnowglobeTunableFloat(@"tapRotation", 100.0);
    float v7 = v5;
    v8.i64[0] = 0;
    v8.i32[3] = 0;
    v8.f32[2] = -v7;
    *(float *)&unint64_t v9 = -y;
    *((float *)&v9 + 1) = x;
    *(float32x4_t *)&self->_anon_70[16] = vaddq_f32(v8, *(float32x4_t *)&self->_anon_70[16]);
    *(float *)&double v6 = v6;
    *(float32x4_t *)&self->_anon_70[48] = vaddq_f32(*(float32x4_t *)&self->_anon_70[48], vmulq_n_f32((float32x4_t)v9, *(float *)&v6));
  }
}

- (void)_applyMotionAcceleration
{
  if (!self->_pausePhysics)
  {
    long long v40 = +[NTKSnowglobeMotionManager sharedInstance];
    [v40 userAcceleration];
    float64_t v34 = v4;
    float64_t v37 = v3;
    double v6 = v5;
    [v40 rotationRate];
    double v8 = v7;
    *(double *)&long long v9 = NTKSnowglobeTunableFloat(@"motionLateralAcceleration", 8.0);
    *(float *)&long long v9 = *(double *)&v9;
    long long v33 = v9;
    double v10 = NTKSnowglobeTunableFloat(@"motionLateralAccelerationMax", 1.0);
    *(float *)&double v10 = v10;
    v11.f64[0] = v37;
    v11.f64[1] = v34;
    *(float32x2_t *)&v11.f64[0] = vcvt_f32_f64(v11);
    float v12 = v6;
    *(float *)&v11.f64[1] = v12;
    float32x4_t v14 = (float32x4_t)vdupq_n_s32(0x3D088889u);
    float32x4_t v13 = vdivq_f32((float32x4_t)v11, v14);
    v14.f32[0] = -*(float *)&v10;
    *(float32x2_t *)v17.f32 = vmul_n_f32(*(float32x2_t *)v13.f32, *(float *)&v33);
    float32x2_t v15 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v10, 0);
    *(int8x8_t *)v17.f32 = vbsl_s8((int8x8_t)vcgt_f32(v15, *(float32x2_t *)v17.f32), *(int8x8_t *)v17.f32, (int8x8_t)v15);
    float32x2_t v16 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v14.f32, 0);
    *(int8x8_t *)v17.f32 = vbsl_s8((int8x8_t)vcgt_f32(v16, *(float32x2_t *)v17.f32), (int8x8_t)v16, *(int8x8_t *)v17.f32);
    float v18 = vmuls_lane_f32(*(float *)&v33, v13, 2);
    if (v18 < *(float *)&v10) {
      *(float *)&double v10 = v18;
    }
    if (*(float *)&v10 < v14.f32[0]) {
      *(float *)&double v10 = v14.f32[0];
    }
    v17.i32[2] = LODWORD(v10);
    float32x4_t v38 = v17;
    [(NTKSnowglobeDigitProfile *)self->_profile accelerometerFactor];
    float32x4_t v20 = vmulq_n_f32(v38, v19);
    node = self->_node;
    if (node)
    {
      float32x4_t v39 = v20;
      __n128 v22 = [(SCNNode *)node presentationNode];
      [v22 simdPosition];
      float32x4_t v35 = v23;

      float32x4_t v24 = v35;
      v24.i32[2] = 0;
      float32x4_t v36 = v24;
      float v25 = NTKSnowglobeTunableFloat(@"spinAcceleration", 1.6);
      float v26 = NTKSnowglobeTunableFloat(@"spinAccelerationMax", 0.6);
      double v27 = v8 * v25;
      if (v27 >= v26) {
        double v27 = v26;
      }
      float v28 = -v26;
      if (v27 >= v28)
      {
        float v29 = v27;
        float v28 = v29;
      }
      LODWORD(v30) = 0;
      v31.i64[0] = 0;
      v31.i64[1] = LODWORD(v28);
      int32x4_t v32 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v31, v31), (int8x16_t)v31, 0xCuLL), vnegq_f32(v36)), (float32x4_t)v31, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v36, (int32x4_t)v36), (int8x16_t)v36, 0xCuLL));
      float32x4_t v20 = vaddq_f32(v39, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v32, v32), (int8x16_t)v32, 0xCuLL));
      *((float *)&v30 + 1) = -v28;
      *(_OWORD *)&self->_anon_70[48] = v30;
    }
    *(float32x4_t *)&self->_anon_70[16] = vaddq_f32(v20, *(float32x4_t *)&self->_anon_70[16]);
  }
}

- (void)didCollide
{
  [(NTKSnowglobeEyeController *)self->_eyeController transitionToState:2 withDuration:0.1];
  p_collisionAngerTimer = &self->_collisionAngerTimer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collisionAngerTimer);
  [WeakRetained invalidate];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DAFE5694;
  v7[3] = &unk_1E6BE4E28;
  v7[4] = self;
  double v5 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:0 repeats:v7 block:2.0];
  double v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v6 addTimer:v5 forMode:*MEMORY[0x1E4F1C4B0]];

  objc_storeWeak((id *)p_collisionAngerTimer, v5);
}

- (SCNNode)node
{
  return self->_node;
}

- (SCNVector3)origin
{
  float x = self->_origin.x;
  float y = self->_origin.y;
  float z = self->_origin.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setOrigin:(SCNVector3)a3
{
  self->_origin = a3;
}

- (unint64_t)digit
{
  return self->_digit;
}

- (__n128)tritiumRotation
{
  return a1[35];
}

- (__n128)setTritiumRotation:(__n128 *)result
{
  result[35] = a2;
  return result;
}

- (__n128)tritiumOrigin
{
  return a1[36];
}

- (void)setTritiumOrigin:(NTKSnowglobeDigitController *)self
{
  *(_OWORD *)self->_tritiumOrigin = v2;
}

- (SCNVector3)exitOrigin
{
  float x = self->_exitOrigin.x;
  float y = self->_exitOrigin.y;
  float z = self->_exitOrigin.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setExitOrigin:(SCNVector3)a3
{
  self->_exitOrigin = a3;
}

- (BOOL)exiting
{
  return self->_exiting;
}

- (void)setExiting:(BOOL)a3
{
  self->_exiting = a3;
}

- (BOOL)pausePhysics
{
  return self->_pausePhysics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_loadGroup, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);
  objc_destroyWeak((id *)&self->_collisionAngerTimer);
  objc_storeStrong((id *)&self->_eyeController, 0);
  objc_storeStrong((id *)&self->_physicsBehaviors, 0);
  objc_storeStrong((id *)&self->_leg2, 0);
  objc_storeStrong((id *)&self->_leg1, 0);

  objc_storeStrong((id *)&self->_scene, 0);
}

@end