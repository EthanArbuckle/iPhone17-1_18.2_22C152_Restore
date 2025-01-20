@interface AVTAvatar
+ (AVTAvatar)avatarWithDataRepresentation:(id)a3 error:(id *)a4;
+ (AVTAvatar)avatarWithDataRepresentation:(id)a3 usageIntent:(unint64_t)a4 error:(id *)a5;
+ (AVTAvatar)avatarWithDescriptor:(id)a3 usageIntent:(unint64_t)a4 error:(id *)a5;
+ (BOOL)canLoadDataRepresentation:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (double)applyGazeCorrectionWithInputAngle:(int32x4_t)a1 translation:(__n128)a2;
+ (void)preloadAvatar:(id)a3;
- ($7647AF3F1D5EE67F7819E57318B71FB1)morphInfoForARKitBlendShapeIndex:(SEL)a3;
- (AVTAvatar)init;
- (BOOL)arMode;
- (BOOL)isTransitioning;
- (BOOL)optimizeForSnapshot;
- (BOOL)usesSkinningForEyeOrientation;
- (NSDictionary)specializationSettings;
- (SCNNode)avatarNode;
- (SCNNode)cameraNode;
- (SCNNode)headNode;
- (SCNNode)lightingNode;
- (SCNNode)neckNode;
- (SCNNode)rootJointNode;
- (__n128)arOffset;
- (double)physicsController:(id)a3 downforceForNodeNamed:(id)a4;
- (double)physicsDownforceForNodeNamed:(id)a3;
- (float)arScale;
- (float)opacity;
- (id)_cachePresentationConfigurationShaderModifiersForMaterial:(id)a3 cacheKey:(id)a4 shaderModifiersBuilder:(id)a5;
- (id)_objectsInDescriptors:(id)a3 andHierarchy:(id)a4 passingTest:(id)a5;
- (id)avatarNodeForPhysicsController:(id)a3;
- (id)bakedAnimationCopy;
- (id)bakedAnimationPlayer;
- (id)blendShapeNameForARKitBlendShapeIndex:(unint64_t)a3;
- (id)copyWithUsageIntent:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentation;
- (id)debugPoseJSONRepresentation;
- (id)effectiveMorphedNodeForTargetName:(id)a3;
- (id)newDescriptor;
- (id)nodesMatchingStickerPattern:(id)a3 inHierarchy:(id)a4 options:(unint64_t)a5 includingDerivedNodes:(BOOL)a6;
- (id)physicsState;
- (id)pose;
- (id)snapshotWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5;
- (id)stickerPhysicsStateIdentifier;
- (id)upperNodesIgnoredByDynamics;
- (int64_t)blendShapeIndexForARKitBlendShapeName:(id)a3;
- (unint64_t)usageIntent;
- (void)_addNodesMatchingStickerPattern:(id)a3 inHierarchy:(id)a4 toArray:(id)a5 options:(unint64_t)a6;
- (void)_applyBlendShapes:(const float *)a3 parameters:(const float *)a4;
- (void)_applyBlendShapesWithTrackingData:(id *)a3;
- (void)_applyHeadPoseWithTrackingData:(id *)a3 gazeCorrection:(BOOL)a4 pointOfView:(id)a5;
- (void)_avatarNodeAndHeadNodeAreNowAvailable;
- (void)_preparePrePass:(BOOL)a3;
- (void)_resetFaceToRandomPosition;
- (void)_restoreOriginalShaderModifiersOfMaterial:(id)a3;
- (void)_transitionFromPose:(id)a3 toPose:(id)a4 bakedAnimationBlendFactor:(double)a5 duration:(double)a6 delay:(double)a7 timingFunction:(id)a8 timingAnimation:(id)a9 completionHandler:(id)a10;
- (void)_updateARModeShaderModifiersForMaterial:(id)a3 withOnTopMask:(BOOL)a4;
- (void)addCustomBehavioursInHierarchy:(id)a3 forBodyParts:(unint64_t)a4;
- (void)addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:(id)a3 block:(id)a4;
- (void)addDynamicsInHierarchy:(id)a3 ignoringUpperNodes:(id)a4;
- (void)addMorpherDrivenMaterialsInHierarchy:(id)a3;
- (void)addMorphingSkinningControllersInHierarchy:(id)a3;
- (void)animatePhysicsScaleFactor:(double)a3 duration:(double)a4;
- (void)applyBlendShapesWithTrackingInfo:(id)a3;
- (void)applyHeadPoseWithTrackingInfo:(id)a3;
- (void)applyHeadPoseWithTrackingInfo:(id)a3 gazeCorrection:(BOOL)a4;
- (void)applyHeadPoseWithTrackingInfo:(id)a3 gazeCorrection:(BOOL)a4 pointOfView:(id)a5;
- (void)arMode;
- (void)avatarCommonInit;
- (void)avatarNode;
- (void)dealloc;
- (void)didAddToScene:(id)a3;
- (void)disabledBlendshapesSpecializationSettingsDidChange;
- (void)enumerateMorphInfoForCustomBlendShapeName:(id)a3 usingBlock:(id)a4;
- (void)evaluateDynamicsAtTime:(double)a3;
- (void)headNode;
- (void)newDescriptor;
- (void)opacity;
- (void)pauseBakedAnimation;
- (void)physicsSpecializationSettingsDidChange;
- (void)pose;
- (void)removeCustomBehavioursInHierarchy:(id)a3 forBodyParts:(unint64_t)a4;
- (void)removeDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:(id)a3;
- (void)removeDynamicsInHierarchy:(id)a3;
- (void)removeMorpherDrivenMaterialsInHierarchy:(id)a3;
- (void)removeMorphingSkinningControllersInHierarchy:(id)a3;
- (void)renderer:(id)a3 didApplyAnimationsAtTime:(double)a4;
- (void)resetCustomBehaviours;
- (void)resetDynamics;
- (void)resetMorpherDrivenMaterials;
- (void)resetMorphingSkinningControllers;
- (void)resetPresentationConfigurationBehavioursInHierarchy:(id)a3 forBodyParts:(unint64_t)a4;
- (void)resetToPhysicsState:(id)a3 assumeRestStateIfNil:(BOOL)a4;
- (void)resumeBakedAnimation;
- (void)setArMode:(BOOL)a3;
- (void)setBakedAnimationReferenceTime:(double)a3;
- (void)setOpacity:(float)a3;
- (void)setOptimizeForSnapshot:(BOOL)a3;
- (void)setPhysicsScaleFactor:(double)a3;
- (void)setPose:(id)a3;
- (void)setPresentationConfiguration:(id)a3;
- (void)setupEyeOrientationAndReflections;
- (void)setupMorphInfo;
- (void)setupMorphInfoForChangeInSubHierarchy;
- (void)stickerPhysicsStateIdentifier;
- (void)stopTransitionAnimation;
- (void)stopTransitionAnimationWithBlendOutDuration:(double)a3;
- (void)transitionFromPose:(id)a3 duration:(double)a4 delay:(double)a5 completionHandler:(id)a6;
- (void)transitionFromPose:(id)a3 toPose:(id)a4 duration:(double)a5 delay:(double)a6 completionHandler:(id)a7;
- (void)transitionFromPose:(id)a3 toPose:(id)a4 duration:(double)a5 delay:(double)a6 timingAnimation:(id)a7 completionHandler:(id)a8;
- (void)transitionFromPose:(id)a3 toPose:(id)a4 duration:(double)a5 delay:(double)a6 timingFunction:(id)a7 completionHandler:(id)a8;
- (void)transitionToPose:(id)a3 duration:(double)a4 delay:(double)a5 completionHandler:(id)a6;
- (void)updateAfterAnimationsEvaluatedAtTime:(double)a3 renderer:(id)a4;
- (void)updateBindings;
- (void)updateBindingsOfNode:(id)a3;
- (void)updateEyeOrientationAndReflections;
- (void)updateMorpherDrivenMaterialsWithDeltaTime:(double)a3;
- (void)updatePoseWithCVAFaceTrackingAnimationDictionary:(void *)a1 neckPosition:(uint64_t)a2 neckOrientation:(void *)a3 applySmoothing:(int)a4;
- (void)updatePoseWithFaceTrackingData:(id)a3 applySmoothing:(BOOL)a4;
- (void)updatePoseWithPoseProvider:(id)a3 applySmoothing:(BOOL)a4;
- (void)willRemoveFromScene:(id)a3;
@end

@implementation AVTAvatar

- (BOOL)optimizeForSnapshot
{
  return self->_optimizedForSnapshot;
}

- (void)setOptimizeForSnapshot:(BOOL)a3
{
  self->_optimizedForSnapshot = a3;
}

- (void)avatarCommonInit
{
  if (AVTInitializeShaderCache_onceToken != -1) {
    dispatch_once(&AVTInitializeShaderCache_onceToken, &__block_literal_global_89);
  }
  v3 = objc_alloc_init(AVTPhysicsController);
  physicsController = self->_physicsController;
  self->_physicsController = v3;

  [(AVTPhysicsController *)self->_physicsController setDelegate:self];
  self->_didUpdateAtTimeLock._os_unfair_lock_opaque = 0;
}

- (AVTAvatar)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVTAvatar;
  v2 = [(AVTAvatar *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(AVTAvatar *)v2 avatarCommonInit];
    v3->_physicsScaleFactor = 1.0;
  }
  return v3;
}

- (void)dealloc
{
  free(self->_morphInfoFromARKitBlendShapeIndex);
  free(self->_friendlyPoseMorphInfos);
  v3.receiver = self;
  v3.super_class = (Class)AVTAvatar;
  [(AVTAvatar *)&v3 dealloc];
}

- (__n128)arOffset
{
  v1 = [a1 specializationSettings];
  v2 = [v1 objectForKeyedSubscript:@"AR"];

  objc_super v3 = [v2 objectForKeyedSubscript:@"offset"];
  v4 = [v3 objectForKeyedSubscript:@"x"];
  [v4 floatValue];
  unsigned __int32 v13 = v5;

  v6 = [v3 objectForKeyedSubscript:@"y"];
  [v6 floatValue];
  unsigned __int32 v12 = v7;

  v8 = [v3 objectForKeyedSubscript:@"z"];
  [v8 floatValue];
  unsigned __int32 v11 = v9;

  result.n128_u32[0] = v13;
  result.n128_u32[1] = v12;
  result.n128_u32[2] = v11;
  return result;
}

- (float)arScale
{
  v2 = [(AVTAvatar *)self specializationSettings];
  objc_super v3 = [v2 objectForKeyedSubscript:@"AR"];

  v4 = [v3 objectForKeyedSubscript:@"scale"];
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

- (double)physicsDownforceForNodeNamed:(id)a3
{
  id v4 = a3;
  float v5 = [(AVTAvatar *)self specializationSettings];
  float v6 = [v5 objectForKeyedSubscript:@"dynamics"];

  unsigned __int32 v7 = [v6 objectForKeyedSubscript:@"apply downforce to"];
  v8 = [v6 objectForKey:@"downforce multiplier"];
  unsigned __int32 v9 = v8;
  if (v8)
  {
    [v8 floatValue];
    double v11 = v10;
  }
  else
  {
    double v11 = 1.0;
  }
  uint64_t v19 = 0;
  v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000;
  unint64_t v22 = 0xBFF0000000000000;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __42__AVTAvatar_physicsDownforceForNodeNamed___block_invoke;
  v15[3] = &unk_264020888;
  id v12 = v4;
  id v16 = v12;
  v17 = &v19;
  double v18 = v11;
  [v7 enumerateObjectsUsingBlock:v15];
  double v13 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v13;
}

double __42__AVTAvatar_physicsDownforceForNodeNamed___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if ([*(id *)(a1 + 32) isEqualToString:a2])
  {
    double result = *(double *)(a1 + 48);
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
    *a4 = 1;
  }
  return result;
}

- (void)physicsSpecializationSettingsDidChange
{
  [(AVTAvatar *)self resetDynamics];
  physicsController = self->_physicsController;
  [(AVTPhysicsController *)physicsController downforcesDidChange];
}

- (id)physicsState
{
  return [(AVTPhysicsController *)self->_physicsController physicsState];
}

- (void)resetToPhysicsState:(id)a3 assumeRestStateIfNil:(BOOL)a4
{
}

- (void)_avatarNodeAndHeadNodeAreNowAvailable
{
  __assert_rtn("-[AVTAvatar _avatarNodeAndHeadNodeAreNowAvailable]", "AVTAvatar.m", 328, "_headNode != nil && _avatarNode != nil");
}

- (SCNNode)lightingNode
{
  return 0;
}

- (SCNNode)cameraNode
{
  return 0;
}

- (SCNNode)headNode
{
  v2 = avt_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[AVTAvatar headNode]();
  }

  return 0;
}

- (SCNNode)neckNode
{
  return self->_neckNode;
}

- (SCNNode)rootJointNode
{
  return self->_rootJointNode;
}

- (SCNNode)avatarNode
{
  v2 = avt_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[AVTAvatar avatarNode]();
  }

  return 0;
}

- (void)setBakedAnimationReferenceTime:(double)a3
{
  bakedAnimationPlayer_lazy = self->_bakedAnimationPlayer_lazy;
  self->_bakedAnimationPlayer_lazy = 0;

  float v6 = [(SCNNode *)self->_avatarNode animationForKey:@"AVTPuppetAnimationGroup"];
  if (v6)
  {
    id v7 = v6;
    [v6 setBeginTime:a3];
    [v7 setTimeOffset:0.0];
    [(SCNNode *)self->_avatarNode addAnimation:v7 forKey:@"AVTPuppetAnimationGroup"];
    float v6 = v7;
  }
}

- (void)pauseBakedAnimation
{
  bakedAnimationPlayer_lazy = self->_bakedAnimationPlayer_lazy;
  self->_bakedAnimationPlayer_lazy = 0;

  avatarNode = self->_avatarNode;
  [(SCNNode *)avatarNode removeAnimationForKey:@"AVTPuppetAnimationGroup"];
}

- (void)resumeBakedAnimation
{
  bakedAnimationPlayer_lazy = self->_bakedAnimationPlayer_lazy;
  self->_bakedAnimationPlayer_lazy = 0;

  avatarNode = self->_avatarNode;
  bakedAnimation = self->_bakedAnimation;
  [(SCNNode *)avatarNode addAnimation:bakedAnimation forKey:@"AVTPuppetAnimationGroup"];
}

- (id)bakedAnimationCopy
{
  v2 = (void *)[(CAAnimation *)self->_bakedAnimation copy];
  return v2;
}

- (id)bakedAnimationPlayer
{
  if (self->_bakedAnimation && !self->_bakedAnimationPlayer_lazy)
  {
    objc_super v3 = [(SCNNode *)self->_avatarNode animationPlayerForKey:@"AVTPuppetAnimationGroup"];
    bakedAnimationPlayer_lazy = self->_bakedAnimationPlayer_lazy;
    self->_bakedAnimationPlayer_lazy = v3;
  }
  float v5 = self->_bakedAnimationPlayer_lazy;
  return v5;
}

- (void)_restoreOriginalShaderModifiersOfMaterial:(id)a3
{
  id v3 = a3;
  id v4 = objc_getAssociatedObject(v3, @"kAVTOriginalShaderModifiers");
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v5 = v3;
      float v6 = 0;
LABEL_6:
      [v5 setShaderModifiers:v6];
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v5 = v3;
      float v6 = v4;
      goto LABEL_6;
    }
    id v7 = avt_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AVTAvatar _restoreOriginalShaderModifiersOfMaterial:]();
    }
  }
LABEL_10:
}

- (id)_cachePresentationConfigurationShaderModifiersForMaterial:(id)a3 cacheKey:(id)a4 shaderModifiersBuilder:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  unsigned __int32 v9 = (void (**)(id, id))a5;
  float v10 = objc_getAssociatedObject(v7, v8);
  if (!v10)
  {
    uint64_t v11 = objc_getAssociatedObject(v7, @"kAVTOriginalShaderModifiers");
    if (!v11)
    {
      id v13 = [v7 shaderModifiers];
      if ([v13 count])
      {
        id v14 = v13;
      }
      else
      {
        id v14 = [MEMORY[0x263EFF9D0] null];
      }
      id v12 = v14;
      objc_setAssociatedObject(v7, @"kAVTOriginalShaderModifiers", v14, (void *)0x303);
      goto LABEL_14;
    }
    id v12 = (void *)v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
        id v12 = v13;
LABEL_14:
        float v10 = v9[2](v9, v13);
        objc_setAssociatedObject(v7, v8, v10, (void *)0x303);

        goto LABEL_15;
      }
      v15 = avt_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[AVTAvatar _restoreOriginalShaderModifiersOfMaterial:]();
      }
    }
    id v13 = 0;
    goto LABEL_14;
  }
LABEL_15:

  return v10;
}

- (void)_updateARModeShaderModifiersForMaterial:(id)a3 withOnTopMask:(BOOL)a4
{
  id v6 = a3;
  if ([(AVTPresentationConfiguration *)self->_presentationConfiguration usesAR])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __67__AVTAvatar__updateARModeShaderModifiersForMaterial_withOnTopMask___block_invoke;
    v8[3] = &__block_descriptor_33_e36___NSDictionary_16__0__NSDictionary_8l;
    BOOL v9 = a4;
    id v7 = [(AVTAvatar *)self _cachePresentationConfigurationShaderModifiersForMaterial:v6 cacheKey:@"kAVTARShaderModifiers" shaderModifiersBuilder:v8];
    [v6 setShaderModifiers:v7];
  }
  else
  {
    [(AVTAvatar *)self _restoreOriginalShaderModifiersOfMaterial:v6];
  }
}

id __67__AVTAvatar__updateARModeShaderModifiersForMaterial_withOnTopMask___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = @"#pragma body\n#ifdef USE_COLOR1_OUTPUT\n_output.color1.rg = 1.h - half2(onTopMask.sample(sampler(), _surface.diffuseTexcoord).rg);\n#endif\n";
  if (!*(unsigned char *)(a1 + 32)) {
    id v4 = @"#pragma body\n#ifdef USE_COLOR1_OUTPUT\n_output.color1.rg = half2(1.h, 1.h);\n#endif\n";
  }
  uint64_t v5 = *MEMORY[0x263F16BD8];
  id v6 = v4;
  id v7 = [v3 objectForKeyedSubscript:v5];
  id v8 = AVTMergeShaderModifiersForEntryPointWithPartsAndCode(0, @"#pragma arguments\ntexture2d onTopMask\n", v6, v7);;

  if ([v3 count])
  {
    BOOL v9 = (void *)[v3 mutableCopy];
    [v9 setObject:v8 forKeyedSubscript:v5];
  }
  else
  {
    uint64_t v11 = v5;
    v12[0] = v8;
    BOOL v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }

  return v9;
}

- (BOOL)arMode
{
  if ((arMode_done & 1) == 0)
  {
    arMode_done = 1;
    id v3 = avt_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      [(AVTAvatar *)v3 arMode];
    }
  }
  return [(AVTPresentationConfiguration *)self->_presentationConfiguration usesAR];
}

- (void)setArMode:(BOOL)a3
{
  BOOL v3 = a3;
  if ((setArMode__done & 1) == 0)
  {
    setArMode__done = 1;
    uint64_t v5 = avt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AVTAvatar setArMode:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (v3)
  {
    id v13 = objc_alloc_init(AVTAugmentedRealityPresentationConfiguration);
  }
  else
  {
    id v13 = +[AVTClassicPresentationConfiguration sharedConfiguration];
  }
  id v14 = v13;
  [(AVTAvatar *)self setPresentationConfiguration:v13];
}

- (void)setPresentationConfiguration:(id)a3
{
  uint64_t v5 = (AVTPresentationConfiguration *)a3;
  if (self->_presentationConfiguration != v5)
  {
    id v14 = v5;
    int v6 = [(AVTPresentationConfiguration *)v5 usesAR];
    int v7 = [(AVTPresentationConfiguration *)self->_presentationConfiguration usesAR];
    [(AVTAvatar *)self removePresentationConfigurationBehavioursInHierarchy:self->_avatarNode forBodyParts:-1];
    objc_storeStrong((id *)&self->_presentationConfiguration, a3);
    [(AVTAvatar *)self resetPresentationConfigurationBehavioursInHierarchy:self->_avatarNode forBodyParts:-1];
    uint64_t v5 = v14;
    if (v6 != v7)
    {
      v8.i32[0] = 1.0;
      if (v6) {
        v8.i32[0] = LODWORD(self->_arScale);
      }
      float32x4_t v13 = (float32x4_t)vdupq_lane_s32(v8, 0);
      [(SCNNode *)self->_neckNode simdScale];
      uint32x4_t v11 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(v10, v13));
      v11.i32[3] = v11.i32[2];
      uint64_t v5 = v14;
      if ((vmaxvq_u32(v11) & 0x80000000) != 0)
      {
        [MEMORY[0x263F16B08] begin];
        [(SCNNode *)self->_neckNode setSimdScale:*(double *)vdupq_lane_s32(v12, 0).i64];
        [MEMORY[0x263F16B08] commit];
        uint64_t v5 = v14;
      }
    }
  }
}

- (void)resetPresentationConfigurationBehavioursInHierarchy:(id)a3 forBodyParts:(unint64_t)a4
{
  presentationConfiguration = self->_presentationConfiguration;
  id v6 = a3;
  uint64_t v7 = [(AVTPresentationConfiguration *)presentationConfiguration usesAR];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __78__AVTAvatar_resetPresentationConfigurationBehavioursInHierarchy_forBodyParts___block_invoke;
  v24[3] = &unk_26401F2B0;
  v24[4] = self;
  [v6 enumerateHierarchyUsingBlock:v24];

  int32x2_t v8 = [(AVTAvatar *)self specializationSettings];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"AR"];

  float32x4_t v10 = [v9 objectForKeyedSubscript:@"additional geometries"];
  if ([v10 count])
  {
    avatarNode = self->_avatarNode;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __78__AVTAvatar_resetPresentationConfigurationBehavioursInHierarchy_forBodyParts___block_invoke_2;
    v21[3] = &unk_2640208D0;
    id v22 = v10;
    char v23 = v7;
    [(SCNNode *)avatarNode enumerateChildNodesUsingBlock:v21];
  }
  int32x2_t v12 = [v9 objectForKeyedSubscript:@"skinner"];
  float32x4_t v13 = v12;
  if (v12)
  {
    id v14 = [v12 objectForKeyedSubscript:@"normal node"];
    v15 = [(SCNNode *)self->_avatarNode childNodeWithName:v14 recursively:1];
    [v15 setHidden:v7];
    id v16 = [v13 objectForKeyedSubscript:@"AR node"];
    v17 = [(SCNNode *)self->_avatarNode childNodeWithName:v16 recursively:1];
    double v18 = [v17 morpher];

    if (!v18)
    {
      uint64_t v19 = [v15 morpher];
      v20 = (void *)[v19 copy];
      [v17 setMorpher:v20];
    }
    [v17 setHidden:v7 ^ 1];
  }
}

void __78__AVTAvatar_resetPresentationConfigurationBehavioursInHierarchy_forBodyParts___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = objc_msgSend(a2, "geometry", 0);
  uint64_t v4 = [v3 materials];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        float32x4_t v10 = [v9 customMaterialPropertyNames];
        uint64_t v11 = [v10 containsObject:@"onTopMask"];

        [*(id *)(a1 + 32) _updateARModeShaderModifiersForMaterial:v9 withOnTopMask:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

void __78__AVTAvatar_resetPresentationConfigurationBehavioursInHierarchy_forBodyParts___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 name];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v7 name];
    LODWORD(v5) = [v5 containsObject:v6];

    if (v5) {
      [v7 setHidden:*(unsigned char *)(a1 + 40) == 0];
    }
  }
}

- (void)updateBindings
{
  id v4 = [(AVTAvatar *)self headNode];
  uint64_t v3 = [v4 parentNode];
  [(AVTAvatar *)self updateBindingsOfNode:v3];
}

- (void)updateBindingsOfNode:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_headNode || !self->_morphInfoFromARKitBlendShapeIndex) {
    -[AVTAvatar updateBindingsOfNode:]();
  }
  uint64_t v5 = v4;
  strcpy(v8, "morpher.weights[000]");
  strcpy(v7, "morpher.weights[000]");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__AVTAvatar_updateBindingsOfNode___block_invoke;
  v6[3] = &unk_264020920;
  v6[4] = self;
  v6[5] = v8;
  v6[6] = v7;
  [v4 enumerateHierarchyUsingBlock:v6];
}

void __34__AVTAvatar_updateBindingsOfNode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(id *)(*(void *)(a1 + 32) + 24) != v3)
  {
    uint64_t v5 = [v3 morpher];
    if (v5)
    {
      [v4 removeAllBindings];
      uint64_t v6 = [v5 targets];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __34__AVTAvatar_updateBindingsOfNode___block_invoke_2;
      v7[3] = &unk_2640208F8;
      v7[4] = *(void *)(a1 + 32);
      id v8 = v4;
      long long v9 = *(_OWORD *)(a1 + 40);
      [v6 enumerateObjectsUsingBlock:v7];
    }
  }
}

uint64_t __34__AVTAvatar_updateBindingsOfNode___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  long long v14 = [a2 name];
  if (AVTMorphTargetNameIsUsedForBindings(v14))
  {
    uint64_t v5 = [*(id *)(a1 + 32) effectiveMorphedNodeForTargetName:v14];
    uint64_t v6 = v5;
    if (v5)
    {
      if (v5 != *(void **)(a1 + 40))
      {
        id v7 = [v5 morpher];
        uint64_t v8 = [v7 _weightIndexForTargetNamed:v14];

        if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v9 = ((unsigned __int128)(v8 * (__int128)(uint64_t)0xA3D70A3D70A3D70BLL) >> 64) + v8;
          *(unsigned char *)(*(void *)(a1 + 48) + 16) = (v9 < 0) + (v9 >> 6) + 48;
          *(unsigned char *)(*(void *)(a1 + 48) + 17) = (char)v8 / 10 + 48;
          *(unsigned char *)(*(void *)(a1 + 48) + 18) = (char)v8 % 10 + 48;
          *(unsigned char *)(*(void *)(a1 + 56) + 16) = a3 / 0x64 + 48;
          *(unsigned char *)(*(void *)(a1 + 56) + 17) = a3 / 0xA + 48;
          *(unsigned char *)(*(void *)(a1 + 56) + 18) = (a3 % 0xA) | 0x30;
          float32x4_t v10 = *(void **)(a1 + 40);
          uint64_t v11 = (void *)[[NSString alloc] initWithUTF8String:*(void *)(a1 + 56)];
          long long v12 = (void *)[[NSString alloc] initWithUTF8String:*(void *)(a1 + 48)];
          [v10 bindAnimatablePath:v11 toObject:v6 withKeyPath:v12 options:0];
        }
      }
    }
  }
  return MEMORY[0x270F9A790]();
}

- (void)resetCustomBehaviours
{
  [(AVTAvatar *)self resetMorphingSkinningControllers];
  [(AVTAvatar *)self resetPresentationConfigurationBehavioursInHierarchy:self->_avatarNode forBodyParts:-1];
  [(AVTAvatar *)self setupMorphInfoForChangeInSubHierarchy];
}

- (void)addCustomBehavioursInHierarchy:(id)a3 forBodyParts:(unint64_t)a4
{
  id v6 = a3;
  [(AVTAvatar *)self addMorphingSkinningControllersInHierarchy:v6];
  [(AVTAvatar *)self resetPresentationConfigurationBehavioursInHierarchy:v6 forBodyParts:a4];

  [(AVTAvatar *)self setupMorphInfoForChangeInSubHierarchy];
}

- (void)removeCustomBehavioursInHierarchy:(id)a3 forBodyParts:(unint64_t)a4
{
  -[AVTAvatar removeMorphingSkinningControllersInHierarchy:](self, "removeMorphingSkinningControllersInHierarchy:", a3, a4);
  [(AVTAvatar *)self setupMorphInfoForChangeInSubHierarchy];
}

- (void)disabledBlendshapesSpecializationSettingsDidChange
{
  if (self->_morphInfoFromARKitBlendShapeIndex)
  {
    id v3 = [(AVTAvatar *)self specializationSettings];
    id v9 = [v3 objectForKeyedSubscript:@"ARKit disabled blendshapes"];

    uint64_t v4 = 0;
    for (uint64_t i = 0; i != 52; ++i)
    {
      id v6 = AVTBlendShapeLocationFromARIndex(i);
      int v7 = [v9 containsObject:v6];
      uint64_t v8 = &self->_morphInfoFromARKitBlendShapeIndex[v4];
      v8->var3 = v7 ^ 1;
      if (((v7 ^ 1) & 1) == 0) {
        [v8->var0 setWeight:v8->var2 forTargetAtIndex:0.0];
      }

      ++v4;
    }
  }
}

- (void)resetMorphingSkinningControllers
{
  [(AVTAvatar *)self resetDynamics];
  [(AVTAvatar *)self resetMorpherDrivenMaterials];
}

- (void)addMorphingSkinningControllersInHierarchy:(id)a3
{
  id v4 = a3;
  [(AVTAvatar *)self addDynamicsInHierarchy:v4 ignoringUpperNodes:0];
  [(AVTAvatar *)self addMorpherDrivenMaterialsInHierarchy:v4];
}

- (void)removeMorphingSkinningControllersInHierarchy:(id)a3
{
  id v4 = a3;
  [(AVTAvatar *)self removeDynamicsInHierarchy:v4];
  [(AVTAvatar *)self removeMorpherDrivenMaterialsInHierarchy:v4];
}

- (id)_objectsInDescriptors:(id)a3 andHierarchy:(id)a4 passingTest:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__4;
    v20 = __Block_byref_object_dispose__4;
    id v21 = 0;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __60__AVTAvatar__objectsInDescriptors_andHierarchy_passingTest___block_invoke;
    v12[3] = &unk_264020948;
    id v13 = v7;
    id v14 = v9;
    long long v15 = &v16;
    [v8 enumerateHierarchyUsingBlock:v12];
    id v10 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __60__AVTAvatar__objectsInDescriptors_andHierarchy_passingTest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40)))
        {
          id v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          if (!v10)
          {
            id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
            uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
            id v13 = *(void **)(v12 + 40);
            *(void *)(v12 + 40) = v11;

            id v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          }
          objc_msgSend(v10, "addObject:", v9, (void)v14);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (id)upperNodesIgnoredByDynamics
{
  return 0;
}

- (void)resetDynamics
{
  if (self->_avatarNode)
  {
    dynamics = self->_dynamics;
    self->_dynamics = 0;

    id v4 = [(AVTAvatar *)self upperNodesIgnoredByDynamics];
    [(AVTAvatar *)self addDynamicsInHierarchy:self->_avatarNode ignoringUpperNodes:v4];
  }
}

- (void)addDynamicsInHierarchy:(id)a3 ignoringUpperNodes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[AVTAvatar optimizeForSnapshot](self, "optimizeForSnapshot") || [v7 count])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__AVTAvatar_addDynamicsInHierarchy_ignoringUpperNodes___block_invoke;
    v8[3] = &unk_264020970;
    void v8[4] = self;
    +[AVTPhysicalizedMorpherDynamic enumerateDynamicsInHierarchy:forAvatar:ignoredUpperNodes:usingBlock:]((uint64_t)AVTPhysicalizedMorpherDynamic, v6, self, v7, v8);
    +[AVTPhysicalizedSkeletonDynamic enumerateDynamicsInHierarchy:forAvatar:usingBlock:]((uint64_t)AVTPhysicalizedSkeletonDynamic, (uint64_t)v6, self, v8);
    +[AVTSpringDynamic enumerateDynamicsInHierarchy:forAvatar:usingBlock:]((uint64_t)AVTSpringDynamic, (uint64_t)v6, self, v8);
  }
}

void __55__AVTAvatar_addDynamicsInHierarchy_ignoringUpperNodes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 128);
  id v8 = v3;
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 128);
    *(void *)(v6 + 128) = v5;

    id v3 = v8;
    id v4 = *(void **)(*(void *)(a1 + 32) + 128);
  }
  [v4 addObject:v3];
}

- (void)removeDynamicsInHierarchy:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = [(AVTAvatar *)self _objectsInDescriptors:self->_dynamics andHierarchy:a3 passingTest:&__block_literal_global_162];
  if ([v4 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "resetTarget", (void)v11);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    [(NSMutableArray *)self->_dynamics removeObjectsInArray:v5];
    if (![(NSMutableArray *)self->_dynamics count])
    {
      dynamics = self->_dynamics;
      self->_dynamics = 0;
    }
  }
}

uint64_t __39__AVTAvatar_removeDynamicsInHierarchy___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "affectsNode:");
}

- (void)evaluateDynamicsAtTime:(double)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_dynamics;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "evaluateAtTime:physicsController:", self->_physicsController, a3, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)resetMorpherDrivenMaterials
{
  morpherDrivenMaterialDescriptors = self->_morpherDrivenMaterialDescriptors;
  self->_morpherDrivenMaterialDescriptors = 0;

  id v4 = [(AVTAvatar *)self avatarNode];
  [(AVTAvatar *)self addMorpherDrivenMaterialsInHierarchy:v4];
}

- (void)addMorpherDrivenMaterialsInHierarchy:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAvatar *)self specializationSettings];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"ARKit driven material"];

  if ([v6 count])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __50__AVTAvatar_addMorpherDrivenMaterialsInHierarchy___block_invoke;
    v12[3] = &unk_2640209E0;
    void v12[4] = self;
    id v13 = v4;
    [v6 enumerateKeysAndObjectsUsingBlock:v12];
    uint64_t v7 = [v6 allKeys];
    uint64_t v8 = [v7 count];
    uint64_t v9 = [(NSMutableArray *)self->_morpherDrivenMaterialDescriptors count];

    if (v8 != v9)
    {
      long long v10 = avt_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v11 = 0;
        _os_log_impl(&dword_20B819000, v10, OS_LOG_TYPE_DEFAULT, "Failed to create morpher-driven material", v11, 2u);
      }
    }
  }
}

void __50__AVTAvatar_addMorpherDrivenMaterialsInHierarchy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v40 = a1;
  uint64_t v7 = [*(id *)(a1 + 32) effectiveMorphedNodeForTargetName:v5];
  v37 = v7;
  if (v7)
  {
    uint64_t v8 = [v7 morpher];
    uint64_t v36 = [v8 _weightIndexForTargetNamed:v5];
  }
  else
  {
    uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_opt_class();
  v33 = v6;
  v34 = v5;
  if (objc_opt_isKindOfClass())
  {
    id v9 = v6;
  }
  else
  {
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObject:v6];
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v9;
  uint64_t v39 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v51;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v51 != v38) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v50 + 1) + 8 * v10);
        long long v12 = [v11 objectForKeyedSubscript:@"node"];
        id v13 = [v11 objectForKeyedSubscript:@"material"];
        long long v14 = [v11 objectForKeyedSubscript:@"property"];
        uint64_t v15 = *(void **)(v40 + 40);
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = __50__AVTAvatar_addMorpherDrivenMaterialsInHierarchy___block_invoke_2;
        v48[3] = &unk_2640209B8;
        id v43 = v12;
        id v49 = v43;
        v42 = [v15 childNodesPassingTest:v48 recursively:1];
        uint64_t v16 = [v42 lastObject];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        v41 = v16;
        long long v17 = [v16 geometry];
        uint64_t v18 = [v17 materials];

        uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v54 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v45;
          while (2)
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v45 != v21) {
                objc_enumerationMutation(v18);
              }
              char v23 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              v24 = [v23 name];
              int v25 = [v24 isEqualToString:v13];

              if (v25)
              {
                v26 = objc_alloc_init(AVTMorpherDrivenMaterialDescriptor);
                -[AVTSkinnerVariantPair setOriginalSkinner:]((uint64_t)v26, v37);
                if (v26)
                {
                  v26->_morphTargetIndex = v36;
                  -[AVTPhysicsRig setChainRoot:]((uint64_t)v26, v23);
                  objc_setProperty_nonatomic_copy(v26, v27, v14, 32);
                }
                else
                {
                  -[AVTPhysicsRig setChainRoot:](0, v23);
                }
                v28 = *(void **)(*(void *)(v40 + 32) + 136);
                if (!v28)
                {
                  id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
                  uint64_t v30 = *(void *)(v40 + 32);
                  v31 = *(void **)(v30 + 136);
                  *(void *)(v30 + 136) = v29;

                  v28 = *(void **)(*(void *)(v40 + 32) + 136);
                }
                [v28 addObject:v26];

                goto LABEL_26;
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v54 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }
LABEL_26:

        ++v10;
      }
      while (v10 != v39);
      uint64_t v32 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
      uint64_t v39 = v32;
    }
    while (v32);
  }
}

uint64_t __50__AVTAvatar_addMorpherDrivenMaterialsInHierarchy___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 geometry];
  if (v6)
  {
    uint64_t v7 = [v5 name];
    int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

    if (v8)
    {
      uint64_t v6 = 1;
      *a3 = 1;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }

  return v6;
}

- (void)removeMorpherDrivenMaterialsInHierarchy:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = [(AVTAvatar *)self _objectsInDescriptors:self->_morpherDrivenMaterialDescriptors andHierarchy:a3 passingTest:&__block_literal_global_169];
  if ([v4 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
          if (v10)
          {
            id v11 = *(id *)(v10 + 24);
            uint64_t v12 = *(void *)(v10 + 32);
          }
          else
          {
            id v11 = 0;
            uint64_t v12 = 0;
          }
          objc_msgSend(v11, "setValue:forKey:", &unk_26C00C680, v12, (void)v15);

          ++v9;
        }
        while (v7 != v9);
        uint64_t v13 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        uint64_t v7 = v13;
      }
      while (v13);
    }

    [(NSMutableArray *)self->_morpherDrivenMaterialDescriptors removeObjectsInArray:v5];
    if (![(NSMutableArray *)self->_morpherDrivenMaterialDescriptors count])
    {
      morpherDrivenMaterialDescriptors = self->_morpherDrivenMaterialDescriptors;
      self->_morpherDrivenMaterialDescriptors = 0;
    }
  }
}

BOOL __53__AVTAvatar_removeMorpherDrivenMaterialsInHierarchy___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v3 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v3 = 0;
  }
  return v3 == a3;
}

- (void)updateMorpherDrivenMaterialsWithDeltaTime:(double)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v3 = self->_morpherDrivenMaterialDescriptors;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v24 + 1) + 8 * v7);
        if (v8) {
          uint64_t v9 = (void *)v8[1];
        }
        else {
          uint64_t v9 = 0;
        }
        id v10 = v9;
        id v11 = objc_msgSend(v10, "presentationNode", (void)v24);
        uint64_t v12 = [v11 morpher];
        uint64_t v13 = v12;
        if (v8) {
          uint64_t v14 = v8[2];
        }
        else {
          uint64_t v14 = 0;
        }
        [v12 weightForTargetAtIndex:v14];
        double v16 = v15;

        if (v8) {
          long long v17 = (void *)v8[3];
        }
        else {
          long long v17 = 0;
        }
        id v19 = v17;
        float v18 = v16;
        *(float *)&double v20 = v18;
        uint64_t v21 = [NSNumber numberWithFloat:v20];
        if (v8) {
          uint64_t v22 = v8[4];
        }
        else {
          uint64_t v22 = 0;
        }
        [v19 setValue:v21 forKey:v22];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v23 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v5 = v23;
    }
    while (v23);
  }
}

- (BOOL)usesSkinningForEyeOrientation
{
  v2 = [(AVTAvatar *)self specializationSettings];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"eye behavior"];

  uint64_t v4 = [v3 objectForKeyedSubscript:@"uses skinning for orientation"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setupEyeOrientationAndReflections
{
}

- (void)updateEyeOrientationAndReflections
{
  pupilReflectionCorrectionDescriptor = self->_pupilReflectionCorrectionDescriptor;
  if (pupilReflectionCorrectionDescriptor)
  {
    uint64_t v4 = [(SCNNode *)pupilReflectionCorrectionDescriptor->_readMorpherNode presentationNode];
    char v5 = [v4 morpher];

    uint64_t v6 = self->_pupilReflectionCorrectionDescriptor;
    if (v6) {
      int64_t leftEyeTargetIndex = v6->_leftEyeTargetIndex;
    }
    else {
      int64_t leftEyeTargetIndex = 0;
    }
    [v5 weightForTargetAtIndex:leftEyeTargetIndex];
    float v9 = v8;
    id v10 = self->_pupilReflectionCorrectionDescriptor;
    if (v10) {
      id v10 = (AVTPupilReflectionCorrectionDescriptor *)v10->_leftEyeMaterial;
    }
    id v11 = NSNumber;
    float v12 = v9 * 0.5;
    uint64_t v13 = v10;
    *(float *)&double v14 = v12;
    double v15 = [v11 numberWithFloat:v14];
    [(AVTPupilReflectionCorrectionDescriptor *)v13 setValue:v15 forKey:@"blink"];

    double v16 = self->_pupilReflectionCorrectionDescriptor;
    if (v16) {
      int64_t rightEyeTargetIndex = v16->_rightEyeTargetIndex;
    }
    else {
      int64_t rightEyeTargetIndex = 0;
    }
    [v5 weightForTargetAtIndex:rightEyeTargetIndex];
    float v19 = v18;
    double v20 = self->_pupilReflectionCorrectionDescriptor;
    if (v20) {
      double v20 = (AVTPupilReflectionCorrectionDescriptor *)v20->_rightEyeMaterial;
    }
    uint64_t v21 = NSNumber;
    float v22 = v19 * 0.5;
    uint64_t v23 = v20;
    *(float *)&double v24 = v22;
    long long v25 = [v21 numberWithFloat:v24];
    [(AVTPupilReflectionCorrectionDescriptor *)v23 setValue:v25 forKey:@"blink"];
  }
  eyeSkinningDescriptor = self->_eyeSkinningDescriptor;
  if (eyeSkinningDescriptor)
  {
    long long v27 = [(SCNNode *)eyeSkinningDescriptor->_readMorpherNode presentationNode];
    v77 = [v27 morpher];

    v28 = self->_eyeSkinningDescriptor;
    if (v28) {
      int64_t leftEyeLookDownTargetIndex = v28->_leftEyeLookDownTargetIndex;
    }
    else {
      int64_t leftEyeLookDownTargetIndex = 0;
    }
    [v77 weightForTargetAtIndex:leftEyeLookDownTargetIndex];
    double v31 = v30;
    uint64_t v32 = self->_eyeSkinningDescriptor;
    if (v32) {
      int64_t leftEyeLookInTargetIndex = v32->_leftEyeLookInTargetIndex;
    }
    else {
      int64_t leftEyeLookInTargetIndex = 0;
    }
    [v77 weightForTargetAtIndex:leftEyeLookInTargetIndex];
    double v35 = v34;
    uint64_t v36 = self->_eyeSkinningDescriptor;
    if (v36) {
      int64_t leftEyeLookOutTargetIndex = v36->_leftEyeLookOutTargetIndex;
    }
    else {
      int64_t leftEyeLookOutTargetIndex = 0;
    }
    [v77 weightForTargetAtIndex:leftEyeLookOutTargetIndex];
    double v39 = v38;
    uint64_t v40 = self->_eyeSkinningDescriptor;
    if (v40) {
      int64_t leftEyeLookUpTargetIndex = v40->_leftEyeLookUpTargetIndex;
    }
    else {
      int64_t leftEyeLookUpTargetIndex = 0;
    }
    [v77 weightForTargetAtIndex:leftEyeLookUpTargetIndex];
    double v43 = v42;
    long long v44 = self->_eyeSkinningDescriptor;
    if (v44) {
      int64_t rightEyeLookDownTargetIndex = v44->_rightEyeLookDownTargetIndex;
    }
    else {
      int64_t rightEyeLookDownTargetIndex = 0;
    }
    [v77 weightForTargetAtIndex:rightEyeLookDownTargetIndex];
    double v47 = v46;
    v48 = self->_eyeSkinningDescriptor;
    if (v48) {
      int64_t rightEyeLookInTargetIndex = v48->_rightEyeLookInTargetIndex;
    }
    else {
      int64_t rightEyeLookInTargetIndex = 0;
    }
    [v77 weightForTargetAtIndex:rightEyeLookInTargetIndex];
    long long v52 = self->_eyeSkinningDescriptor;
    if (v52) {
      int64_t rightEyeLookOutTargetIndex = v52->_rightEyeLookOutTargetIndex;
    }
    else {
      int64_t rightEyeLookOutTargetIndex = 0;
    }
    *(float *)&long long v51 = v31;
    unsigned int v72 = v51;
    *(float *)&long long v51 = v35;
    unsigned int v71 = v51;
    *(float *)&long long v51 = v39;
    long long v68 = v51;
    float v54 = v43;
    float v70 = v54;
    float v55 = v47;
    float v56 = v50;
    float v74 = v56;
    float v75 = v55;
    objc_msgSend(v77, "weightForTargetAtIndex:", rightEyeLookOutTargetIndex, v68);
    *(float *)&double v57 = v57;
    __int32 v73 = LODWORD(v57);
    v58 = self->_eyeSkinningDescriptor;
    if (v58) {
      int64_t rightEyeLookUpTargetIndex = v58->_rightEyeLookUpTargetIndex;
    }
    else {
      int64_t rightEyeLookUpTargetIndex = 0;
    }
    [v77 weightForTargetAtIndex:rightEyeLookUpTargetIndex];
    v61.f32[0] = v60;
    float64x2_t v62 = (float64x2_t)vdupq_n_s64(0x3FD657184DB22790uLL);
    double v63 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(vsub_f32((float32x2_t)__PAIR64__(v69, v72), (float32x2_t)__PAIR64__(v71, LODWORD(v70)))), v62)));
    v61.i32[1] = v73;
    double v76 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(vsub_f32((float32x2_t)__PAIR64__(LODWORD(v74), LODWORD(v75)), v61)), v62)));
    v64 = self->_eyeSkinningDescriptor;
    if (v64) {
      leftEyeJoint = v64->_leftEyeJoint;
    }
    else {
      leftEyeJoint = 0;
    }
    [(SCNNode *)leftEyeJoint setSimdEulerAngles:v63];
    v66 = self->_eyeSkinningDescriptor;
    if (v66) {
      rightEyeJoint = v66->_rightEyeJoint;
    }
    else {
      rightEyeJoint = 0;
    }
    [(SCNNode *)rightEyeJoint setSimdEulerAngles:v76];
  }
}

- (void)willRemoveFromScene:(id)a3
{
  physicsController = self->_physicsController;
  id v4 = [a3 physicsWorld];
  [(AVTPhysicsController *)physicsController removeFromPhysicsWorld:v4];
}

- (void)didAddToScene:(id)a3
{
  physicsController = self->_physicsController;
  id v4 = [a3 physicsWorld];
  [(AVTPhysicsController *)physicsController addToPhysicsWorld:v4];
}

- (void)renderer:(id)a3 didApplyAnimationsAtTime:(double)a4
{
  id v4 = a3;
  __assert_rtn("-[AVTAvatar renderer:didApplyAnimationsAtTime:]", "AVTAvatar.m", 1110, "0");
}

- (void)updateAfterAnimationsEvaluatedAtTime:(double)a3 renderer:(id)a4
{
  id v6 = a4;
  double physicsScaleFactor = self->_physicsScaleFactor;
  double v8 = a3 - self->_lastRenderTime;
  if (v8 == 0.0) {
    double v8 = 0.0166666667;
  }
  if (v8 <= 0.1) {
    double v9 = v8;
  }
  else {
    double v9 = 0.1;
  }
  self->_lastRenderTime = a3;
  [(AVTPhysicsController *)self->_physicsController updateAtTime:a3 forceMultiplier:physicsScaleFactor];
  [(AVTAvatar *)self evaluateDynamicsAtTime:a3];
  [(AVTAvatar *)self updateEyeOrientationAndReflections];
  [(AVTAvatar *)self updateMorpherDrivenMaterialsWithDeltaTime:v9];
  if (self->_didUpdateAtTimeCallbackItems)
  {
    os_unfair_lock_lock(&self->_didUpdateAtTimeLock);
    uint64_t v10 = [(NSMutableArray *)self->_didUpdateAtTimeCallbackItems count];
    if (v10 - 1 >= 0)
    {
      uint64_t v11 = v10;
      do
      {
        --v11;
        char v18 = 0;
        uint64_t v12 = [(NSMutableArray *)self->_didUpdateAtTimeCallbackItems objectAtIndexedSubscript:v11];
        double v14 = (void *)v12;
        if (v12)
        {
          if (!*(unsigned char *)(v12 + 8))
          {
            *(unsigned char *)(v12 + 8) = 1;
            *(double *)(v12 + 16) = a3;
          }
          id v15 = *(id *)(v12 + 32);
          uint64_t v16 = (uint64_t)v15 + 16;
          v13.n128_u64[0] = v14[2];
        }
        else
        {
          id v15 = 0;
          v13.n128_u64[0] = 0;
          uint64_t v16 = 16;
        }
        (*(void (**)(id, AVTAvatar *, id, char *, double, __n128))v16)(v15, self, v6, &v18, a3, v13);

        if (v18)
        {
          [(NSMutableArray *)self->_didUpdateAtTimeCallbackItems removeObjectAtIndex:v11];
          if (![(NSMutableArray *)self->_didUpdateAtTimeCallbackItems count])
          {
            didUpdateAtTimeCallbackItems = self->_didUpdateAtTimeCallbackItems;
            self->_didUpdateAtTimeCallbackItems = 0;
          }
        }
      }
      while (v11 > 0);
    }
    os_unfair_lock_unlock(&self->_didUpdateAtTimeLock);
  }
}

- (void)addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_didUpdateAtTimeLock);
  double v8 = objc_alloc_init(AVTAvatarDidUpdateAtTimeCallbackItem);
  double v9 = (void *)[v6 copy];
  uint64_t v11 = v9;
  if (v8)
  {
    objc_setProperty_nonatomic_copy(v8, v10, v9, 24);

    uint64_t v12 = (void *)[v7 copy];
    objc_setProperty_nonatomic_copy(v8, v13, v12, 32);
  }
  else
  {

    uint64_t v12 = (void *)[v7 copy];
  }

  didUpdateAtTimeCallbackItems = self->_didUpdateAtTimeCallbackItems;
  if (didUpdateAtTimeCallbackItems)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __76__AVTAvatar_addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey_block___block_invoke;
    v19[3] = &unk_264020A28;
    double v20 = (NSMutableArray *)v6;
    uint64_t v15 = [(NSMutableArray *)didUpdateAtTimeCallbackItems indexOfObjectPassingTest:v19];
    uint64_t v16 = self->_didUpdateAtTimeCallbackItems;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)v16 insertObject:v8 atIndex:0];
    }
    else {
      -[NSMutableArray setObject:atIndexedSubscript:](v16, "setObject:atIndexedSubscript:", v8);
    }
    char v18 = v20;
  }
  else
  {
    long long v17 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v8, 0);
    char v18 = self->_didUpdateAtTimeCallbackItems;
    self->_didUpdateAtTimeCallbackItems = v17;
  }

  os_unfair_lock_unlock(&self->_didUpdateAtTimeLock);
}

uint64_t __76__AVTAvatar_addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey_block___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    v2 = *(void **)(a2 + 24);
  }
  else {
    v2 = 0;
  }
  return [v2 isEqualToString:*(void *)(a1 + 32)];
}

- (void)removeDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_didUpdateAtTimeLock);
  didUpdateAtTimeCallbackItems = self->_didUpdateAtTimeCallbackItems;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__AVTAvatar_removeDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey___block_invoke;
  v9[3] = &unk_264020A28;
  id v6 = v4;
  id v10 = v6;
  uint64_t v7 = [(NSMutableArray *)didUpdateAtTimeCallbackItems indexOfObjectPassingTest:v9];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_didUpdateAtTimeCallbackItems removeObjectAtIndex:v7];
    if (![(NSMutableArray *)self->_didUpdateAtTimeCallbackItems count])
    {
      double v8 = self->_didUpdateAtTimeCallbackItems;
      self->_didUpdateAtTimeCallbackItems = 0;
    }
  }
  os_unfair_lock_unlock(&self->_didUpdateAtTimeLock);
}

uint64_t __73__AVTAvatar_removeDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    v2 = *(void **)(a2 + 24);
  }
  else {
    v2 = 0;
  }
  return [v2 isEqualToString:*(void *)(a1 + 32)];
}

- (id)effectiveMorphedNodeForTargetName:(id)a3
{
  id v4 = a3;
  char v5 = [(AVTAvatar *)self specializationSettings];
  id v6 = [v5 objectForKeyedSubscript:@"ARKit driven morpher"];

  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x3032000000;
  float v22 = __Block_byref_object_copy__4;
  uint64_t v23 = __Block_byref_object_dispose__4;
  id v24 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __47__AVTAvatar_effectiveMorphedNodeForTargetName___block_invoke;
  uint64_t v16 = &unk_26401F508;
  id v7 = v4;
  id v17 = v7;
  char v18 = &v19;
  [v6 enumerateKeysAndObjectsUsingBlock:&v13];
  double v8 = self->_headNode;
  double v9 = (void *)v20[5];
  if (v9)
  {
    id v10 = objc_msgSend(v9, "objectForKeyedSubscript:", @"morphed node", v13, v14, v15, v16);
    uint64_t v11 = [(SCNNode *)self->_avatarNode childNodeWithName:v10 recursively:1];

    double v8 = (SCNNode *)v11;
  }

  _Block_object_dispose(&v19, 8);
  return v8;
}

void __47__AVTAvatar_effectiveMorphedNodeForTargetName___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([*(id *)(a1 + 32) isEqualToString:a2])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (void)setupMorphInfo
{
  headNode = self->_headNode;
  morphInfoFromARKitBlendShapeIndex = self->_morphInfoFromARKitBlendShapeIndex;
  if (headNode)
  {
    self->_morphInfoFromARKitBlendShapeIndex = ($7647AF3F1D5EE67F7819E57318B71FB1 *)malloc_type_realloc(morphInfoFromARKitBlendShapeIndex, 0x680uLL, 0x108004077A7B0B0uLL);
    char v5 = [(AVTAvatar *)self specializationSettings];
    id v17 = [v5 objectForKeyedSubscript:@"ARKit disabled blendshapes"];

    uint64_t v6 = 0;
    for (uint64_t i = 0; i != 52; ++i)
    {
      id v8 = AVTBlendShapeLocationFromARIndex(i);
      double v9 = [(AVTAvatar *)self effectiveMorphedNodeForTargetName:v8];
      id v10 = [v9 morpher];
      uint64_t v11 = [v10 _weightIndexForTargetNamed:v8];

      char v12 = 0;
      id v13 = 0;
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v15 = 0;
      if (v9 && v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v13 = (id)[v9 morpher];
        char v12 = [v17 containsObject:v8] ^ 1;
        uint64_t v15 = v9;
        uint64_t v14 = v11;
      }
      uint64_t v16 = &self->_morphInfoFromARKitBlendShapeIndex[v6];
      v16->var0 = v13;
      v16->var1 = v15;
      v16->var2 = v14;
      v16->var3 = v12;
      *(_DWORD *)(&v16->var3 + 1) = 0;
      *((_DWORD *)&v16->var3 + 1) = 0;

      ++v6;
    }
    [(AVTAvatar *)self setupMorphInfoForChangeInSubHierarchy];
  }
  else
  {
    free(morphInfoFromARKitBlendShapeIndex);
    self->_morphInfoFromARKitBlendShapeIndex = 0;
    free(self->_friendlyPoseMorphInfos);
    self->_friendlyPoseMorphInfos = 0;
    self->_friendlyPoseMorphInfoCount = 0;
  }
}

- (void)setupMorphInfoForChangeInSubHierarchy
{
  self->_friendlyPoseMorphInfoCount = 0;
  uint64_t v3 = [(AVTAvatar *)self specializationSettings];
  id v4 = [v3 objectForKeyedSubscript:@"ARKit disabled blendshapes"];

  char v5 = [v4 containsObject:@"Emoji"] ^ 1;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __50__AVTAvatar_setupMorphInfoForChangeInSubHierarchy__block_invoke;
  char v12 = &unk_264020A50;
  char v14 = v5;
  id v13 = self;
  uint64_t v6 = self->_headNode;
  if (v6)
  {
    id v7 = v6;
    while (v7 != self->_avatarNode)
    {
      uint64_t v8 = [(SCNNode *)v7 parentNode];

      id v7 = (SCNNode *)v8;
      if (!v8) {
        goto LABEL_5;
      }
    }
    v11((uint64_t)&v9, v7);
  }
  else
  {
LABEL_5:
    v11((uint64_t)&v9, self->_avatarNode);
    v11((uint64_t)&v9, self->_headNode);
    id v7 = 0;
  }
  if (!self->_friendlyPoseMorphInfoCount) {
    self->_friendlyPoseMorphInfoProxy.isEnabled = v5;
  }
}

uint64_t __50__AVTAvatar_setupMorphInfoForChangeInSubHierarchy__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__AVTAvatar_setupMorphInfoForChangeInSubHierarchy__block_invoke_2;
  v3[3] = &unk_2640208D0;
  char v4 = *(unsigned char *)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  return [a2 enumerateHierarchyUsingBlock:v3];
}

void __50__AVTAvatar_setupMorphInfoForChangeInSubHierarchy__block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 morpher];
  char v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 _weightIndexForTargetNamed:@"Emoji"];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = v5;
      char v7 = *(unsigned char *)(a1 + 40);
      ++*(void *)(*(void *)(a1 + 32) + 80);
      *(void *)(*(void *)(a1 + 32) + 72) = malloc_type_realloc(*(void **)(*(void *)(a1 + 32) + 72), 32 * *(void *)(*(void *)(a1 + 32) + 80), 0x108004077A7B0B0uLL);
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 72) + 32 * *(void *)(*(void *)(a1 + 32) + 80);
      *(void *)(v8 - 32) = v4;
      *(void *)(v8 - 24) = v9;
      *(void *)(v8 - 16) = v6;
      *(unsigned char *)(v8 - 8) = v7;
      *(_DWORD *)(v8 - 4) = 0;
      *(_DWORD *)(v8 - 7) = 0;
    }
  }
}

- (void)updatePoseWithPoseProvider:(id)a3 applySmoothing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!self->_headNode) {
    goto LABEL_21;
  }
  id v29 = v6;
  if (v4)
  {
    [MEMORY[0x263F16B08] begin];
    [MEMORY[0x263F16B08] setAnimationDuration:0.05];
    char v7 = (void *)MEMORY[0x263F16B08];
    uint64_t v8 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
    [v7 setAnimationTimingFunction:v8];
  }
  uint64_t v9 = 0;
  for (uint64_t i = 0; i != 52; ++i)
  {
    morphInfoFromARKitBlendShapeIndex = self->_morphInfoFromARKitBlendShapeIndex;
    if (morphInfoFromARKitBlendShapeIndex[v9].var3)
    {
      int64_t var2 = morphInfoFromARKitBlendShapeIndex[v9].var2;
      if (var2 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id var0 = morphInfoFromARKitBlendShapeIndex[v9].var0;
        char v14 = [(AVTAvatar *)self blendShapeNameForARKitBlendShapeIndex:i];
        [v29 weightForBlendShapeNamed:v14 index:i];
        [var0 setWeight:var2 forTargetAtIndex:v15];
      }
    }
    ++v9;
  }
  if (self->_friendlyPoseMorphInfoCount)
  {
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    do
    {
      char v18 = &self->_friendlyPoseMorphInfos[v16];
      id v19 = v18->var0;
      int64_t v20 = v18->var2;
      [v29 weightForBlendShapeNamed:@"Emoji" index:52];
      [v19 setWeight:v20 forTargetAtIndex:v21];
      ++v17;
      ++v16;
    }
    while (v17 < self->_friendlyPoseMorphInfoCount);
  }
  else
  {
    [v29 weightForBlendShapeNamed:@"Emoji" index:52];
    self->_friendlyPoseMorphInfoProxy.morphWeight = v22;
  }
  [(AVTPhysicsController *)self->_physicsController setupPhysicsIfNeeded];
  uint64_t v23 = [v29 unitSystem];
  if (v23 == 1)
  {
    [v29 neckPosition];
    float32x4_t v28 = v25;
    float v26 = AVTGetNeutralZ();
    v27.i64[0] = 0;
    v27.i64[1] = LODWORD(v26);
    *(void *)&double v24 = vmulq_f32(vsubq_f32(v28, v27), (float32x4_t)xmmword_20B88FE90).u64[0];
  }
  else
  {
    if (v23) {
      goto LABEL_19;
    }
    [v29 neckPosition];
  }
  -[SCNNode setSimdPosition:](self->_rootJointNode, "setSimdPosition:", v24, *(_OWORD *)&v28);
LABEL_19:
  [v29 neckOrientation];
  -[SCNNode setSimdOrientation:](self->_neckNode, "setSimdOrientation:");
  id v6 = v29;
  if (v4)
  {
    [MEMORY[0x263F16B08] commit];
    id v6 = v29;
  }
LABEL_21:
}

- (void)updatePoseWithFaceTrackingData:(id)a3 applySmoothing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->_headNode)
  {
    if (v4)
    {
      [MEMORY[0x263F16B08] begin];
      [MEMORY[0x263F16B08] setAnimationDuration:0.05];
      char v7 = (void *)MEMORY[0x263F16B08];
      uint64_t v8 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
      [v7 setAnimationTimingFunction:v8];
    }
    if ([v6 length] != 480)
    {
      uint64_t v9 = avt_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AVTAvatar updatePoseWithFaceTrackingData:applySmoothing:](v6, v9);
      }
    }
    uint64_t v10 = [v6 bytes];
    [(AVTAvatar *)self _applyBlendShapesWithTrackingData:v10];
    [(AVTAvatar *)self _applyHeadPoseWithTrackingData:v10 gazeCorrection:1 pointOfView:0];
    if (v4) {
      [MEMORY[0x263F16B08] commit];
    }
  }
}

- (void)updatePoseWithCVAFaceTrackingAnimationDictionary:(void *)a1 neckPosition:(uint64_t)a2 neckOrientation:(void *)a3 applySmoothing:(int)a4
{
  id v6 = a3;
  if (a1[3])
  {
    if (a4)
    {
      [MEMORY[0x263F16B08] begin];
      [MEMORY[0x263F16B08] setAnimationDuration:0.05];
      char v7 = (void *)MEMORY[0x263F16B08];
      uint64_t v8 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
      [v7 setAnimationTimingFunction:v8];
    }
    float v9 = AVTGetNeutralZ();
    v10.i64[0] = 0;
    v10.i64[1] = LODWORD(v9);
    float32x4_t v34 = vmulq_f32(vsubq_f32(v33, v10), (float32x4_t)xmmword_20B88FE90);
    long long v37 = 0u;
    long long v38 = 0u;
    memset(&v36[3], 0, 400);
    v36[0] = 0u;
    *(void *)&v36[0] = CACurrentMediaTime();
    float32x4_t v11 = v34;
    v11.i32[3] = 0;
    v36[1] = v11;
    v36[2] = v35;
    char v12 = [v6 objectForKeyedSubscript:*MEMORY[0x263F26930]];
    id v13 = [v6 objectForKeyedSubscript:*MEMORY[0x263F26938]];
    if ([v12 length] != 204)
    {
      char v14 = avt_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[AVTAvatar updatePoseWithCVAFaceTrackingAnimationDictionary:neckPosition:neckOrientation:applySmoothing:](v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    if (objc_msgSend(v12, "length", *(_OWORD *)&v34) == 204)
    {
      float v22 = (_OWORD *)[v12 bytes];
      *(_OWORD *)((char *)&v36[3] + 4) = *v22;
      long long v23 = v22[3];
      long long v24 = v22[4];
      long long v25 = v22[2];
      *(_OWORD *)((char *)&v36[4] + 4) = v22[1];
      *(_OWORD *)((char *)&v36[7] + 4) = v24;
      *(_OWORD *)((char *)&v36[6] + 4) = v23;
      *(_OWORD *)((char *)&v36[5] + 4) = v25;
      long long v26 = v22[7];
      long long v27 = v22[8];
      long long v28 = v22[6];
      *(_OWORD *)((char *)&v36[8] + 4) = v22[5];
      *(_OWORD *)((char *)&v36[11] + 4) = v27;
      *(_OWORD *)((char *)&v36[10] + 4) = v26;
      *(_OWORD *)((char *)&v36[9] + 4) = v28;
      long long v30 = v22[10];
      long long v29 = v22[11];
      long long v31 = *(_OWORD *)((char *)v22 + 188);
      *(_OWORD *)((char *)&v36[12] + 4) = v22[9];
      v36[15] = v31;
      *(_OWORD *)((char *)&v36[14] + 4) = v29;
      *(_OWORD *)((char *)&v36[13] + 4) = v30;
    }
    [v13 floatValue];
    HIDWORD(v37) = v32;
    [a1 _applyBlendShapesWithTrackingData:v36];
    [a1 _applyHeadPoseWithTrackingData:v36 gazeCorrection:1 pointOfView:0];
    if (a4) {
      [MEMORY[0x263F16B08] commit];
    }
  }
}

- (void)_applyBlendShapes:(const float *)a3 parameters:(const float *)a4
{
  if (self->_headNode)
  {
    morphInfoFromARKitBlendShapeIndex = self->_morphInfoFromARKitBlendShapeIndex;
    int64_t var2 = morphInfoFromARKitBlendShapeIndex[51].var2;
    float v8 = -1.0;
    if (var2 != 0x7FFFFFFFFFFFFFFFLL && *a4 != -1.0)
    {
      id var0 = morphInfoFromARKitBlendShapeIndex[51].var0;
      float v10 = 0.0;
      if (morphInfoFromARKitBlendShapeIndex[51].var3)
      {
        float32x4_t v11 = (void *)*MEMORY[0x263EF8EC8];
        float v10 = fmaxf(fminf(*a4, 1.0), 0.0);
        char v12 = AVTBlendShapeLocationFromARIndex(51);

        if (v12 == v11)
        {
          [var0 weightForTargetAtIndex:var2];
          *(float *)&double v13 = v13;
          float v10 = *(float *)&v13 + (float)((float)(v10 - *(float *)&v13) * 0.3);
          float v8 = v10;
        }
      }
      [var0 setWeight:var2 forTargetAtIndex:v10];
    }
    uint64_t v14 = 0;
    for (uint64_t i = 0; i != 51; ++i)
    {
      uint64_t v16 = &self->_morphInfoFromARKitBlendShapeIndex[v14];
      int64_t v17 = v16->var2;
      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
      {
        float v18 = a3[i];
        if (v18 != -1.0)
        {
          id v19 = v16->var0;
          float v20 = 0.0;
          if (v16->var3)
          {
            float v21 = fmaxf(fminf(v18, 1.0), 0.0);
            float v22 = AVTBlendShapeLocationFromARIndex(i);
            float v23 = AVTMorphWeightApplyCorrectionForTongue(v22, v21, v8);
            float v20 = AVTMorphWeightApplyBlinkCorrection(v22, v23);
          }
          [v19 setWeight:v17 forTargetAtIndex:v20];
        }
      }
      ++v14;
    }
    if (self->_friendlyPoseMorphInfoCount)
    {
      uint64_t v24 = 0;
      unint64_t v25 = 0;
      do
      {
        [self->_friendlyPoseMorphInfos[v24].var0 setWeight:self->_friendlyPoseMorphInfos[v24].var2 forTargetAtIndex:0.0];
        ++v25;
        ++v24;
      }
      while (v25 < self->_friendlyPoseMorphInfoCount);
    }
    else
    {
      self->_friendlyPoseMorphInfoProxy.morphWeight = 0.0;
    }
  }
}

- (void)_applyBlendShapesWithTrackingData:(id *)a3
{
  if (a3) {
    [(AVTAvatar *)self _applyBlendShapes:&a3->var2[10] parameters:&a3[1].var2[4]];
  }
}

- (void)_applyHeadPoseWithTrackingData:(id *)a3 gazeCorrection:(BOOL)a4 pointOfView:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  float v9 = v8;
  if (!a3) {
    goto LABEL_29;
  }
  float32x4_t v10 = *(float32x4_t *)&a3->var2[5];
  if (LOBYTE(a3->var2[9]))
  {
    if (v8)
    {
      long long v11 = *MEMORY[0x263EF89A8];
      long long v12 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
      float32x4_t v13 = vmulq_f32(v10, v10);
      float32x4_t v14 = vaddq_f32(v13, v13);
      float32x4_t v15 = vmulq_laneq_f32(v10, v10, 3);
      float v16 = vmulq_lane_f32(v10, *(float32x2_t *)v10.f32, 1).f32[0];
      *(float *)&long long v11 = (float)(1.0 - v14.f32[1]) - v14.f32[2];
      *((float *)&v11 + 1) = (float)(v16 + v15.f32[2]) + (float)(v16 + v15.f32[2]);
      *(float *)&long long v12 = (float)(v16 - v15.f32[2]) + (float)(v16 - v15.f32[2]);
      v14.f32[0] = 1.0 - v14.f32[0];
      *((float *)&v12 + 1) = v14.f32[0] - v14.f32[2];
      float32x2_t v17 = vmul_laneq_f32(*(float32x2_t *)v10.f32, v10, 2);
      *((float *)&v11 + 2) = (float)(v17.f32[0] - v15.f32[1]) + (float)(v17.f32[0] - v15.f32[1]);
      *((float *)&v12 + 2) = (float)(v17.f32[1] + v15.f32[0]) + (float)(v17.f32[1] + v15.f32[0]);
      long long v56 = v12;
      long long v58 = v11;
      *(int32x2_t *)v15.f32 = vrev64_s32(*(int32x2_t *)v15.f32);
      v18.i32[0] = vadd_f32(v17, *(float32x2_t *)v15.f32).u32[0];
      v18.i32[1] = vsub_f32(v17, *(float32x2_t *)&v15).i32[1];
      *(float32x2_t *)&long long v19 = vadd_f32(v18, v18);
      HIDWORD(v19) = HIDWORD(*(void *)(MEMORY[0x263EF89A8] + 40));
      *((float *)&v19 + 2) = v14.f32[0] - v14.f32[1];
      float32x4_t v20 = vaddq_f32(*(float32x4_t *)&a3->var2[1], *(float32x4_t *)(MEMORY[0x263EF89A8] + 48));
      v20.i32[3] = HIDWORD(*(_OWORD *)(MEMORY[0x263EF89A8] + 48));
      float32x4_t v54 = v20;
      long long v55 = v19;
      [v8 simdWorldTransform];
      uint64_t v25 = 0;
      v60[0] = v58;
      v60[1] = v56;
      v60[2] = v55;
      v60[3] = v54;
      float32x4_t v61 = 0u;
      float32x4_t v62 = 0u;
      float32x4_t v63 = 0u;
      float32x4_t v64 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v61 + v25 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(v60[v25])), v22, *(float32x2_t *)&v60[v25], 1), v23, (float32x4_t)v60[v25], 2), v24, (float32x4_t)v60[v25], 3);
        ++v25;
      }
      while (v25 != 4);
      int32x4_t v26 = (int32x4_t)vmulq_f32(v61, v61);
      v26.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v26, 2), vadd_f32(*(float32x2_t *)v26.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v26.i8, 1))).u32[0];
      float32x2_t v27 = vrsqrte_f32((float32x2_t)v26.u32[0]);
      float32x2_t v28 = vmul_f32(v27, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(v27, v27)));
      float32x4_t v29 = vmulq_n_f32(v61, vmul_f32(v28, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(v28, v28))).f32[0]);
      int32x4_t v30 = (int32x4_t)vmulq_f32(v62, v62);
      v30.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v30, 2), vadd_f32(*(float32x2_t *)v30.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v30.i8, 1))).u32[0];
      float32x2_t v31 = vrsqrte_f32((float32x2_t)v30.u32[0]);
      float32x2_t v32 = vmul_f32(v31, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v31, v31)));
      float32x4_t v33 = vmulq_n_f32(v62, vmul_f32(v32, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v32, v32))).f32[0]);
      int32x4_t v34 = (int32x4_t)vmulq_f32(v63, v63);
      v34.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v34, 2), vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1))).u32[0];
      float32x2_t v35 = vrsqrte_f32((float32x2_t)v34.u32[0]);
      float32x2_t v36 = vmul_f32(v35, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v35, v35)));
      float32x4_t v37 = vmulq_n_f32(v63, vmul_f32(v36, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v36, v36))).f32[0]);
      float v38 = (float)(v29.f32[0] + v33.f32[1]) + v37.f32[2];
      if (v38 <= 0.0)
      {
        if (v29.f32[0] <= v33.f32[1] || v29.f32[0] <= v37.f32[2])
        {
          if (v33.f32[1] <= v37.f32[2])
          {
            v51.i64[0] = v37.i64[0];
            v51.f32[2] = (float)(v37.f32[2] + 1.0) - v29.f32[0];
            v51.i32[3] = v29.i32[1];
            float32x4_t v41 = (float32x4_t)vrev64q_s32((int32x4_t)vextq_s8((int8x16_t)vtrn1q_s32((int32x4_t)v33, (int32x4_t)v29), (int8x16_t)v33, 8uLL));
            v40.i64[0] = vaddq_f32(v37, v41).u64[0];
            v40.i64[1] = vsubq_f32(v51, v41).i64[1];
            v41.i32[0] = v40.i32[2];
          }
          else
          {
            float32x4_t v46 = v33;
            v46.f32[1] = (float)(v33.f32[1] + 1.0) - v29.f32[0];
            v46.i32[3] = v37.i32[0];
            float32x4_t v47 = (float32x4_t)vzip2q_s32(vzip1q_s32((int32x4_t)v29, (int32x4_t)v37), vtrn1q_s32((int32x4_t)v37, (int32x4_t)v29));
            int32x4_t v48 = (int32x4_t)vaddq_f32(v33, v47);
            float32x4_t v41 = vsubq_f32(v46, v47);
            float32x4_t v40 = (float32x4_t)vtrn2q_s32(vrev64q_s32(v48), (int32x4_t)v41);
            v41.i32[0] = v41.i32[1];
          }
        }
        else
        {
          float32_t v49 = (float)(v29.f32[0] + 1.0) - v33.f32[1];
          float32x4_t v50 = (float32x4_t)vextq_s8((int8x16_t)v33, (int8x16_t)vtrn1q_s32((int32x4_t)v33, (int32x4_t)v37), 0xCuLL);
          float32x4_t v40 = vaddq_f32(v50, v29);
          v50.f32[0] = v49;
          v29.i32[0] = v37.i32[2];
          v29.i32[3] = v37.i32[1];
          float32x4_t v41 = vsubq_f32(v50, v29);
          v40.i32[0] = v41.i32[0];
          v40.i32[3] = v41.i32[3];
        }
      }
      else
      {
        float32x4_t v39 = (float32x4_t)vzip2q_s32((int32x4_t)v33, vuzp1q_s32((int32x4_t)v33, (int32x4_t)v37));
        v39.i32[2] = v29.i32[1];
        float32x4_t v41 = (float32x4_t)vtrn2q_s32((int32x4_t)v37, vzip2q_s32((int32x4_t)v37, (int32x4_t)v29));
        v41.i32[2] = v33.i32[0];
        float32x4_t v40 = vsubq_f32(v39, v41);
        v41.i32[3] = 1.0;
        v39.f32[3] = v38;
        v40.i32[3] = vaddq_f32(v39, v41).i32[3];
        v41.i32[0] = v40.i32[3];
      }
      *(void *)&long long v57 = vmulq_n_f32(v40, 0.5 / sqrtf(v41.f32[0])).u64[0];
      float32x4_t v59 = v64;
    }
    else
    {
      long long v57 = *(_OWORD *)&a3->var2[5];
      float32x4_t v59 = *(float32x4_t *)&a3->var2[1];
      if ((_applyHeadPoseWithTrackingData_gazeCorrection_pointOfView__done & 1) == 0)
      {
        _applyHeadPoseWithTrackingData_gazeCorrection_pointOfView__done = 1;
        long long v44 = avt_default_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          -[AVTAvatar _applyHeadPoseWithTrackingData:gazeCorrection:pointOfView:]();
        }
      }
    }
    [(AVTPhysicsController *)self->_physicsController setupPhysicsIfNeeded];
    goto LABEL_24;
  }
  long long v57 = *(_OWORD *)&a3->var2[5];
  float32x4_t v59 = *(float32x4_t *)&a3->var2[1];
  [(AVTPhysicsController *)self->_physicsController setupPhysicsIfNeeded];
  if (!v5)
  {
LABEL_24:
    neckNode = self->_neckNode;
    double v42 = *(double *)&v57;
    goto LABEL_25;
  }
  +[AVTAvatar applyGazeCorrectionWithInputAngle:*(double *)&v57 translation:*(double *)v59.i64];
  neckNode = self->_neckNode;
LABEL_25:
  [(SCNNode *)neckNode setSimdOrientation:v42];
  if (LOBYTE(a3->var2[9]))
  {
    [(SCNNode *)self->_neckNode simdConvertPosition:self->_rootJointNode toNode:*(double *)self->_arOffset];
    *(void *)&double v53 = vsubq_f32(v59, v52).u64[0];
  }
  else
  {
    double v53 = *(double *)v59.i64;
  }
  [(SCNNode *)self->_rootJointNode setSimdPosition:v53];
LABEL_29:
}

- (void)applyBlendShapesWithTrackingInfo:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 trackingData];
    [(AVTAvatar *)self _applyBlendShapesWithTrackingData:v4];
  }
}

- (void)applyHeadPoseWithTrackingInfo:(id)a3
{
}

- (void)applyHeadPoseWithTrackingInfo:(id)a3 gazeCorrection:(BOOL)a4
{
}

- (void)applyHeadPoseWithTrackingInfo:(id)a3 gazeCorrection:(BOOL)a4 pointOfView:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    float32x4_t v10 = [(SCNNode *)self->_avatarNode scene];

    if (v10)
    {
      -[AVTAvatar _applyHeadPoseWithTrackingData:gazeCorrection:pointOfView:](self, "_applyHeadPoseWithTrackingData:gazeCorrection:pointOfView:", [v8 trackingData], v6, v9);
    }
    else
    {
      long long v11 = avt_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v12 = 0;
        _os_log_impl(&dword_20B819000, v11, OS_LOG_TYPE_DEFAULT, "applyHeadPoseWithTrackingInfo - avatar has not been assigned to a scene yet, ignoring", v12, 2u);
      }
    }
  }
}

- ($7647AF3F1D5EE67F7819E57318B71FB1)morphInfoForARKitBlendShapeIndex:(SEL)a3
{
  uint64_t v4 = (char *)self[2].var0 + 32 * a4;
  long long v5 = v4[1];
  *(_OWORD *)&retstr->id var0 = *v4;
  *(_OWORD *)&retstr->int64_t var2 = v5;
  return self;
}

- (id)blendShapeNameForARKitBlendShapeIndex:(unint64_t)a3
{
  -[AVTAvatar morphInfoForARKitBlendShapeIndex:](self, "morphInfoForARKitBlendShapeIndex:", 0, 0);
  uint64_t v4 = AVTBlendShapeLocationFromARIndex(a3);
  return v4;
}

- (int64_t)blendShapeIndexForARKitBlendShapeName:(id)a3
{
  id v4 = a3;
  int64_t v5 = 0;
  while (1)
  {
    BOOL v6 = [(AVTAvatar *)self blendShapeNameForARKitBlendShapeIndex:v5];
    int v7 = [v6 isEqualToString:v4];

    if (v7) {
      break;
    }
    if (++v5 == 52)
    {
      int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
      break;
    }
  }

  return v5;
}

- (void)enumerateMorphInfoForCustomBlendShapeName:(id)a3 usingBlock:(id)a4
{
  BOOL v6 = a4;
  if ([a3 isEqualToString:@"Emoji"] && self->_friendlyPoseMorphInfoCount)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      id v9 = &self->_friendlyPoseMorphInfos[v7];
      long long v10 = *(_OWORD *)&v9->var2;
      long long v13 = *(_OWORD *)&v9->var0;
      long long v14 = v10;
      long long v11 = (void (*)(void *, _OWORD *))v6[2];
      v12[0] = v13;
      v12[1] = v10;
      v11(v6, v12);
      ++v8;
      ++v7;
    }
    while (v8 < self->_friendlyPoseMorphInfoCount);
  }
}

+ (double)applyGazeCorrectionWithInputAngle:(int32x4_t)a1 translation:(__n128)a2
{
  unint64_t v27 = a2.n128_u64[0];
  float v2 = a2.n128_f32[2] + AVTGetNeutralZ() * 100.0;
  float v3 = *((float *)&v27 + 1) / 0.2;
  float v4 = atanf(v3 / v2) + 0.104719755;
  __float2 v5 = __sincosf_stret(v4 * 0.5);
  float32x2_t v6 = vrsqrte_f32((float32x2_t)1065353216);
  float32x2_t v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(v6, v6)));
  LODWORD(v24) = vmul_f32(v7, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(v7, v7))).u32[0];
  int32x4_t v8 = (int32x4_t)vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_20B88FE60, v24), v5.__sinval);
  float32x4_t v9 = (float32x4_t)v8;
  v9.i32[3] = v8.i32[0];
  int32x4_t v10 = a1;
  float32x4_t v11 = (float32x4_t)vzip1q_s32(v10, v10);
  v11.i32[0] = a1.i32[2];
  float32x4_t v12 = vmlaq_f32(vmlaq_n_f32(vmulq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32(a1, 3), (int8x16_t)a1, 4uLL), v9), (float32x4_t)xmmword_20B890210), (float32x4_t)a1, v5.__cosval), (float32x4_t)xmmword_20B890210, vmulq_f32(v11, (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v8, (int8x16_t)v8, 0xCuLL), (int8x16_t)v8, 8uLL)));
  float32x4_t v13 = (float32x4_t)vuzp1q_s32(v10, v10);
  v13.i32[0] = a1.i32[1];
  float32x4_t v26 = vmlsq_f32(v12, v13, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v8, v8), (int8x16_t)v8, 0xCuLL));
  float v14 = atanf((float)(*(float *)&v27 + *(float *)&v27) / v2);
  __float2 v15 = __sincosf_stret(v14 * -0.5);
  int32x4_t v16 = (int32x4_t)v26;
  float32x4_t v17 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_20B88FE70, v24), v15.__sinval);
  float32x4_t v18 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v17, (int8x16_t)v17, 0xCuLL), (int8x16_t)v17, 8uLL);
  float32x4_t v19 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v17, (int32x4_t)v17), (int8x16_t)v17, 0xCuLL);
  v17.i32[3] = v17.i32[0];
  float32x4_t v20 = (float32x4_t)vzip1q_s32(v16, v16);
  v20.i32[0] = v26.i32[2];
  float32x4_t v21 = vmlaq_f32(vmlaq_n_f32(vmulq_f32(vmulq_f32(v17, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v26, 3), (int8x16_t)v26, 4uLL)), (float32x4_t)xmmword_20B890210), v26, v15.__cosval), (float32x4_t)xmmword_20B890210, vmulq_f32(v18, v20));
  float32x4_t v22 = (float32x4_t)vuzp1q_s32(v16, v16);
  v22.i32[0] = v26.i32[1];
  *(void *)&double result = vmlsq_f32(v21, v22, v19).u64[0];
  return result;
}

- (void)_resetFaceToRandomPosition
{
  float v3 = [(SCNNode *)self->_headNode morpher];
  float v4 = [v3 targets];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __39__AVTAvatar__resetFaceToRandomPosition__block_invoke;
  v13[3] = &unk_264020A78;
  v13[4] = self;
  [v4 enumerateObjectsUsingBlock:v13];

  LODWORD(v3) = rand();
  int v5 = rand();
  __asm { FMOV            V1.2D, #-0.5 }
  double v11 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(vaddq_f64(vcvtq_f64_f32(vmul_f32(vcvt_f32_s32((int32x2_t)__PAIR64__(v5, v3)), (float32x2_t)0x3000000030000000)), _Q1), (float64x2_t)xmmword_20B890220)));
  rand();
  [(SCNNode *)self->_rootJointNode setSimdPosition:v11];
  LODWORD(v3) = rand();
  double v12 = COERCE_DOUBLE(vadd_f32(vmul_f32(vcvt_f32_s32((int32x2_t)__PAIR64__(rand(), v3)), (float32x2_t)0x3000000030000000), (float32x2_t)0xBF000000BF000000));
  rand();
  [(SCNNode *)self->_rootJointNode setSimdEulerAngles:v12];
}

void __39__AVTAvatar__resetFaceToRandomPosition__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v5 = [a2 name];
  int v6 = AVTMorphTargetNameDefinesPose(v5);

  if (v6)
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 24) morpher];
    [v7 setWeight:a3 forTargetAtIndex:(float)((float)rand() * 4.6566e-10)];
  }
}

- (id)pose
{
  float v3 = objc_alloc_init(AVTAvatarPose);
  if (!self->_morphInfoFromARKitBlendShapeIndex) {
    -[AVTAvatar pose]();
  }
  float v4 = v3;
  int v5 = [(SCNNode *)self->_rootJointNode animationForKey:@"kAVTTransitionAnimation-posePosition"];
  if (v5)
  {
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      goto LABEL_6;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v5 toValue];

      if (v7)
      {
LABEL_6:
        uint64_t v8 = 0;
        for (uint64_t i = 0; i != 52; ++i)
        {
          morphInfoFromARKitBlendShapeIndex = self->_morphInfoFromARKitBlendShapeIndex;
          if (morphInfoFromARKitBlendShapeIndex[v8].var3
            && morphInfoFromARKitBlendShapeIndex[v8].var2 != 0x7FFFFFFFFFFFFFFFLL)
          {
            id var1 = morphInfoFromARKitBlendShapeIndex[v8].var1;
            double v12 = [(AVTAvatar *)self blendShapeNameForARKitBlendShapeIndex:i];
            float32x4_t v13 = [@"kAVTTransitionAnimation-" stringByAppendingString:v12];
            float v14 = __17__AVTAvatar_pose__block_invoke((uint64_t)v13, var1);
            [v14 floatValue];
            [(AVTAvatarPose *)v4 setWeight:v12 forBlendShapeNamed:v15];
          }
          ++v8;
        }
        unint64_t friendlyPoseMorphInfoCount = self->_friendlyPoseMorphInfoCount;
        if (friendlyPoseMorphInfoCount)
        {
          uint64_t v17 = 0;
          for (unint64_t j = 0; j < friendlyPoseMorphInfoCount; ++j)
          {
            float32x4_t v19 = &self->_friendlyPoseMorphInfos[v17];
            if (v19->var3)
            {
              id v20 = v19->var1;
              float32x4_t v21 = [@"kAVTTransitionAnimation-" stringByAppendingString:@"Emoji"];
              float32x4_t v22 = __17__AVTAvatar_pose__block_invoke((uint64_t)v21, v20);
              [v22 floatValue];
              [(AVTAvatarPose *)v4 setWeight:@"Emoji" forBlendShapeNamed:v23];

              unint64_t friendlyPoseMorphInfoCount = self->_friendlyPoseMorphInfoCount;
            }
            ++v17;
          }
        }
        else if (self->_friendlyPoseMorphInfoProxy.isEnabled)
        {
          uint64_t isKindOfClass = [(AVTAvatarPose *)v4 setWeight:@"Emoji" forBlendShapeNamed:self->_friendlyPoseMorphInfoProxy.morphWeight];
        }
        int32x4_t v34 = __17__AVTAvatar_pose__block_invoke(isKindOfClass, self->_rootJointNode);
        objc_msgSend(v34, "avt_float3Value");
        -[AVTAvatarPose setNeckPosition:](v4, "setNeckPosition:");

        float32x4_t v33 = __17__AVTAvatar_pose__block_invoke(v35, self->_neckNode);
        objc_msgSend(v33, "avt_float4Value");
        goto LABEL_31;
      }
    }
    else
    {
      float v24 = avt_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[AVTAvatar pose]();
      }
    }
  }
  uint64_t v25 = 0;
  for (uint64_t k = 0; k != 52; ++k)
  {
    unint64_t v27 = self->_morphInfoFromARKitBlendShapeIndex;
    if (v27[v25].var2 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v27[v25].var0, "weightForTargetAtIndex:");
      double v29 = v28;
      int32x4_t v30 = [(AVTAvatar *)self blendShapeNameForARKitBlendShapeIndex:k];
      [(AVTAvatarPose *)v4 setWeight:v30 forBlendShapeNamed:v29];
    }
    ++v25;
  }
  if (self->_friendlyPoseMorphInfoCount) {
    [self->_friendlyPoseMorphInfos->var0 weightForTargetAtIndex:self->_friendlyPoseMorphInfos->var2];
  }
  else {
    double morphWeight = self->_friendlyPoseMorphInfoProxy.morphWeight;
  }
  [(AVTAvatarPose *)v4 setWeight:@"Emoji" forBlendShapeNamed:morphWeight];
  float32x2_t v32 = [(SCNNode *)self->_rootJointNode presentationNode];
  [v32 simdPosition];
  -[AVTAvatarPose setNeckPosition:](v4, "setNeckPosition:");

  float32x4_t v33 = [(SCNNode *)self->_neckNode presentationNode];
  [v33 simdOrientation];
LABEL_31:
  -[AVTAvatarPose setNeckOrientation:](v4, "setNeckOrientation:");

  [(AVTAvatarPose *)v4 setBakedAnimationBlendFactor:1.0];
  return v4;
}

id __17__AVTAvatar_pose__block_invoke(uint64_t a1, void *a2)
{
  float v2 = objc_msgSend(a2, "animationForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v3 = [v2 values];
    float v4 = [v3 lastObject];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v4 = [v2 toValue];
    }
    else
    {
      int v5 = avt_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[AVTAvatar pose]();
      }

      float v4 = 0;
    }
  }

  return v4;
}

- (void)setPose:(id)a3
{
  id v23 = a3;
  if (self->_morphInfoFromARKitBlendShapeIndex)
  {
    uint64_t v4 = 0;
    for (uint64_t i = 0; i != 52; ++i)
    {
      int v6 = &self->_morphInfoFromARKitBlendShapeIndex[v4];
      int64_t var2 = v6->var2;
      if (var2 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id var0 = v6->var0;
        BOOL var3 = v6->var3;
        int32x4_t v10 = [(AVTAvatar *)self blendShapeNameForARKitBlendShapeIndex:i];
        double v11 = 0.0;
        if (var3) {
          objc_msgSend(v23, "weightForBlendShapeNamed:", v10, 0.0);
        }
        [var0 setWeight:var2 forTargetAtIndex:v11];
      }
      ++v4;
    }
    if (self->_friendlyPoseMorphInfoCount)
    {
      uint64_t v12 = 0;
      unint64_t v13 = 0;
      do
      {
        float v14 = &self->_friendlyPoseMorphInfos[v12];
        id v15 = v14->var0;
        int64_t v16 = v14->var2;
        double v17 = 0.0;
        if (v14->var3) {
          objc_msgSend(v23, "weightForBlendShapeNamed:", @"Emoji", 0.0);
        }
        [v15 setWeight:v16 forTargetAtIndex:v17];
        ++v13;
        ++v12;
      }
      while (v13 < self->_friendlyPoseMorphInfoCount);
    }
    else
    {
      if (self->_friendlyPoseMorphInfoProxy.isEnabled)
      {
        [v23 weightForBlendShapeNamed:@"Emoji"];
        float v19 = v18;
      }
      else
      {
        float v19 = 0.0;
      }
      self->_friendlyPoseMorphInfoProxy.double morphWeight = v19;
    }
    [(AVTPhysicsController *)self->_physicsController setupPhysicsIfNeeded];
    if (v23)
    {
      [v23 neckPosition];
      -[SCNNode setSimdPosition:](self->_rootJointNode, "setSimdPosition:");
      [v23 neckOrientation];
      -[SCNNode setSimdOrientation:](self->_neckNode, "setSimdOrientation:");
      [v23 bakedAnimationBlendFactor];
      double v21 = v20;
    }
    else
    {
      [(SCNNode *)self->_rootJointNode setSimdPosition:0.0];
      [(SCNNode *)self->_neckNode setSimdOrientation:*(double *)&_PromotedConst];
      double v21 = 1.0;
    }
    float32x4_t v22 = [(AVTAvatar *)self bakedAnimationPlayer];
    [v22 setBlendFactor:v21];
  }
}

- (id)debugPoseJSONRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  avatarNode = self->_avatarNode;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __40__AVTAvatar_debugPoseJSONRepresentation__block_invoke;
  v22[3] = &unk_26401F2B0;
  id v5 = v3;
  id v23 = v5;
  [(SCNNode *)avatarNode enumerateHierarchyUsingBlock:v22];
  id v6 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v6 appendString:@"{\n"];
  id v7 = [v5 allKeys];
  uint64_t v8 = [v7 sortedArrayUsingSelector:sel_compare_];

  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  double v17 = __40__AVTAvatar_debugPoseJSONRepresentation__block_invoke_3;
  double v18 = &unk_2640201B8;
  id v9 = v6;
  id v19 = v9;
  id v20 = v5;
  double v21 = v8;
  id v10 = v8;
  id v11 = v5;
  [v10 enumerateObjectsUsingBlock:&v15];
  objc_msgSend(v9, "appendString:", @"}", v15, v16, v17, v18);
  uint64_t v12 = v21;
  id v13 = v9;

  return v13;
}

void __40__AVTAvatar_debugPoseJSONRepresentation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 presentationNode];
  id v5 = [v4 morpher];

  id v6 = [v5 targets];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__AVTAvatar_debugPoseJSONRepresentation__block_invoke_2;
  v9[3] = &unk_26401F300;
  id v10 = v3;
  id v11 = *(id *)(a1 + 32);
  id v12 = v5;
  id v7 = v5;
  id v8 = v3;
  [v6 enumerateObjectsUsingBlock:v9];
}

void __40__AVTAvatar_debugPoseJSONRepresentation__block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  id v10 = [a2 name];
  if (AVTMorphTargetNameIsOfInterestForAnimator(v10))
  {
    id v5 = [a1[4] geometry];
    id v6 = [v5 name];

    id v7 = [a1[5] objectForKeyedSubscript:v6];
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [a1[5] setObject:v7 forKeyedSubscript:v6];
    }
    [a1[6] weightForTargetAtIndex:a3];
    *(float *)&double v8 = v8;
    id v9 = [NSNumber numberWithFloat:v8];
    [v7 setObject:v9 forKeyedSubscript:v10];
  }
}

void __40__AVTAvatar_debugPoseJSONRepresentation__block_invoke_3(id *a1, void *a2, uint64_t a3)
{
  id v5 = a1[4];
  id v6 = a2;
  [v5 appendFormat:@"  \"%@\" : {\n", v6];
  id v7 = [a1[5] objectForKeyedSubscript:v6];

  double v8 = [v7 allKeys];
  id v9 = [v8 sortedArrayUsingSelector:sel_compare_];

  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __40__AVTAvatar_debugPoseJSONRepresentation__block_invoke_4;
  double v17 = &unk_2640201B8;
  id v18 = v7;
  id v19 = a1[4];
  id v20 = v9;
  id v10 = v9;
  id v11 = v7;
  [v10 enumerateObjectsUsingBlock:&v14];
  id v12 = a1[4];
  if ([a1[6] count] - 1 == a3) {
    id v13 = "";
  }
  else {
    id v13 = ",";
  }
  objc_msgSend(v12, "appendFormat:", @"  }%s\n", v13, v14, v15, v16, v17);
}

void __40__AVTAvatar_debugPoseJSONRepresentation__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v12 = a2;
  id v6 = [v5 objectForKeyedSubscript:v12];
  [v6 floatValue];
  float v8 = v7;

  double v9 = v8;
  id v10 = *(void **)(a1 + 40);
  if ([*(id *)(a1 + 48) count] - 1 == a3) {
    id v11 = "";
  }
  else {
    id v11 = ",";
  }
  [v10 appendFormat:@"    \"%@\" : %.3f%s\n", v12, *(void *)&v9, v11];
}

- (BOOL)isTransitioning
{
  return self->_transitionCount > 0;
}

- (void)setPhysicsScaleFactor:(double)a3
{
  self->_double physicsScaleFactor = a3;
}

- (void)animatePhysicsScaleFactor:(double)a3 duration:(double)a4
{
  if (a4 <= 0.0)
  {
    [(AVTAvatar *)self setPhysicsScaleFactor:a3];
  }
  else
  {
    v7[7] = v4;
    v7[8] = v5;
    double physicsScaleFactor = self->_physicsScaleFactor;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__AVTAvatar_animatePhysicsScaleFactor_duration___block_invoke;
    v7[3] = &__block_descriptor_56_e52_v48__0__AVTAvatar_8d16d24___SCNSceneRenderer__32_B40l;
    *(double *)&v7[4] = a4;
    *(double *)&void v7[5] = physicsScaleFactor;
    *(double *)&v7[6] = a3;
    [(AVTAvatar *)self addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:@"animatePhysicsOnAvatar" block:v7];
  }
}

double *__48__AVTAvatar_animatePhysicsScaleFactor_duration___block_invoke(double *result, uint64_t a2, double a3, double a4, uint64_t a5, unsigned char *a6)
{
  float v6 = (a3 - a4) / result[4];
  float v7 = fmaxf(fminf(v6, 1.0), 0.0);
  *(double *)(a2 + 184) = result[5] + v7 * (result[6] - result[5]);
  if (v7 >= 1.0) {
    *a6 = 1;
  }
  return result;
}

- (void)transitionToPose:(id)a3 duration:(double)a4 delay:(double)a5 completionHandler:(id)a6
{
  id v12 = a3;
  id v10 = a6;
  if (v12) {
    [v12 bakedAnimationBlendFactor];
  }
  else {
    double v11 = 1.0;
  }
  [(AVTAvatar *)self _transitionFromPose:0 toPose:v12 bakedAnimationBlendFactor:0 duration:0 delay:v10 timingFunction:v11 timingAnimation:a4 completionHandler:a5];
}

- (void)transitionFromPose:(id)a3 duration:(double)a4 delay:(double)a5 completionHandler:(id)a6
{
}

- (void)transitionFromPose:(id)a3 toPose:(id)a4 duration:(double)a5 delay:(double)a6 completionHandler:(id)a7
{
  id v15 = a3;
  id v12 = a4;
  id v13 = a7;
  if (v12) {
    [v12 bakedAnimationBlendFactor];
  }
  else {
    double v14 = 1.0;
  }
  [(AVTAvatar *)self _transitionFromPose:v15 toPose:v12 bakedAnimationBlendFactor:0 duration:0 delay:v13 timingFunction:v14 timingAnimation:a5 completionHandler:a6];
}

- (void)transitionFromPose:(id)a3 toPose:(id)a4 duration:(double)a5 delay:(double)a6 timingFunction:(id)a7 completionHandler:(id)a8
{
  id v18 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  if (v14) {
    [v14 bakedAnimationBlendFactor];
  }
  else {
    double v17 = 1.0;
  }
  [(AVTAvatar *)self _transitionFromPose:v18 toPose:v14 bakedAnimationBlendFactor:v15 duration:0 delay:v16 timingFunction:v17 timingAnimation:a5 completionHandler:a6];
}

- (void)transitionFromPose:(id)a3 toPose:(id)a4 duration:(double)a5 delay:(double)a6 timingAnimation:(id)a7 completionHandler:(id)a8
{
  id v18 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  if (v14) {
    [v14 bakedAnimationBlendFactor];
  }
  else {
    double v17 = 1.0;
  }
  [(AVTAvatar *)self _transitionFromPose:v18 toPose:v14 bakedAnimationBlendFactor:0 duration:v15 delay:v16 timingFunction:v17 timingAnimation:a5 completionHandler:a6];
}

- (void)_transitionFromPose:(id)a3 toPose:(id)a4 bakedAnimationBlendFactor:(double)a5 duration:(double)a6 delay:(double)a7 timingFunction:(id)a8 timingAnimation:(id)a9 completionHandler:(id)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  double v23 = CACurrentMediaTime();
  ++self->_transitionCount;
  objc_initWeak(location, self);
  [MEMORY[0x263F16B08] begin];
  [MEMORY[0x263F16B08] setAnimationDuration:0.0];
  float v24 = (void *)MEMORY[0x263F16B08];
  v91[0] = MEMORY[0x263EF8330];
  v91[1] = 3221225472;
  v91[2] = __130__AVTAvatar__transitionFromPose_toPose_bakedAnimationBlendFactor_duration_delay_timingFunction_timingAnimation_completionHandler___block_invoke;
  v91[3] = &unk_264020AC0;
  objc_copyWeak(&v93, location);
  BOOL v94 = v19 != 0;
  id v76 = v22;
  id v92 = v76;
  [v24 setCompletionBlock:v91];
  v77 = v18;
  if (!v19 && v21)
  {
    uint64_t v25 = avt_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B819000, v25, OS_LOG_TYPE_DEFAULT, "Can't use a timing animation without a destination pose", buf, 2u);
    }

    id v21 = 0;
  }
  double v26 = v23 + a7;
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v84 = __130__AVTAvatar__transitionFromPose_toPose_bakedAnimationBlendFactor_duration_delay_timingFunction_timingAnimation_completionHandler___block_invoke_258;
  v85 = &unk_264020AE8;
  double v88 = a6;
  id v75 = v21;
  id v86 = v75;
  double v89 = v26;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  id v74 = v20;
  id v87 = v74;
  v78 = v19;
  do
  {
    double v29 = &self->_morphInfoFromARKitBlendShapeIndex[v27];
    if (v29->var3)
    {
      int64_t var2 = v29->var2;
      if (var2 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id var1 = v29->var1;
        float32x2_t v32 = [(AVTAvatar *)self blendShapeNameForARKitBlendShapeIndex:v28];
        float32x4_t v33 = [@"kAVTTransitionAnimation-" stringByAppendingString:v32];
        int32x4_t v34 = objc_msgSend(NSString, "stringWithFormat:", @"morpher.weights[%d]", var2);
        if (v77)
        {
          uint64_t v35 = NSNumber;
          [v77 weightForBlendShapeNamed:v32];
          *(float *)&double v36 = v36;
          float32x4_t v37 = [v35 numberWithFloat:v36];
          if (!v19) {
            goto LABEL_14;
          }
        }
        else
        {
          float32x4_t v37 = 0;
          if (!v19)
          {
LABEL_14:
            v84((uint64_t)v83, var1, v34, v33, v37, v19);

            id v19 = v78;
            goto LABEL_15;
          }
        }
        float v38 = v19;
        float32x4_t v39 = NSNumber;
        [v38 weightForBlendShapeNamed:v32];
        *(float *)&double v40 = v40;
        id v19 = [v39 numberWithFloat:v40];
        goto LABEL_14;
      }
    }
LABEL_15:
    ++v28;
    ++v27;
  }
  while (v28 != 52);
  if (self->_friendlyPoseMorphInfoCount)
  {
    uint64_t v41 = 0;
    unint64_t v42 = 0;
    double v43 = v77;
    while (1)
    {
      long long v44 = &self->_friendlyPoseMorphInfos[v41];
      id v45 = v44->var1;
      int64_t v46 = v44->var2;
      BOOL var3 = v44->var3;
      int32x4_t v48 = [@"kAVTTransitionAnimation-" stringByAppendingString:@"Emoji"];
      float32_t v49 = objc_msgSend(NSString, "stringWithFormat:", @"morpher.weights[%d]", v46);
      if (v43)
      {
        float32x4_t v50 = NSNumber;
        [v43 weightForBlendShapeNamed:@"Emoji"];
        *(float *)&double v51 = v51;
        float32x4_t v52 = [v50 numberWithFloat:v51];
      }
      else
      {
        float32x4_t v52 = 0;
      }
      if (!v78) {
        break;
      }
      double v53 = NSNumber;
      [v78 weightForBlendShapeNamed:@"Emoji"];
      *(float *)&double v54 = v54;
      long long v55 = [v53 numberWithFloat:v54];
      if (!var3) {
        goto LABEL_23;
      }
LABEL_24:
      v84((uint64_t)v83, v45, v49, v48, v52, v55);

      ++v42;
      ++v41;
      double v43 = v77;
      if (v42 >= self->_friendlyPoseMorphInfoCount) {
        goto LABEL_33;
      }
    }
    long long v55 = 0;
    if (var3) {
      goto LABEL_24;
    }
LABEL_23:

    long long v55 = &unk_26C00C680;
    goto LABEL_24;
  }
  double v43 = v77;
  if (self->_friendlyPoseMorphInfoProxy.isEnabled)
  {
    if (v78)
    {
      [v78 weightForBlendShapeNamed:@"Emoji"];
      float v57 = v56;
      goto LABEL_32;
    }
  }
  else
  {
    float v57 = 0.0;
LABEL_32:
    self->_friendlyPoseMorphInfoProxy.double morphWeight = v57;
  }
LABEL_33:
  if (v43)
  {
    long long v58 = (void *)MEMORY[0x263F08D40];
    [v43 neckPosition];
    float32x4_t v59 = objc_msgSend(v58, "avt_valueWithFloat3_usableWithKVCForSCNVector3:");
  }
  else
  {
    float32x4_t v59 = 0;
  }
  if (v78)
  {
    double v60 = (void *)MEMORY[0x263F08D40];
    [v78 neckPosition];
    float32x4_t v61 = objc_msgSend(v60, "avt_valueWithFloat3_usableWithKVCForSCNVector3:");
  }
  else
  {
    float32x4_t v61 = 0;
  }
  v84((uint64_t)v83, self->_rootJointNode, @"position", @"kAVTTransitionAnimation-posePosition", v59, v61);

  if (v43)
  {
    float32x4_t v62 = (void *)MEMORY[0x263F08D40];
    [v43 neckOrientation];
    float32x4_t v63 = objc_msgSend(v62, "avt_valueWithFloat4_usableWithKVCForSCNVector4:");
    if (v78) {
      goto LABEL_41;
    }
LABEL_43:
    v65 = 0;
  }
  else
  {
    float32x4_t v63 = 0;
    if (!v78) {
      goto LABEL_43;
    }
LABEL_41:
    float32x4_t v64 = (void *)MEMORY[0x263F08D40];
    [v78 neckOrientation];
    v65 = objc_msgSend(v64, "avt_valueWithFloat4_usableWithKVCForSCNVector4:");
  }
  v84((uint64_t)v83, self->_neckNode, @"orientation", @"kAVTTransitionAnimation-poseOrientation", v63, v65);

  v79[0] = MEMORY[0x263EF8330];
  v79[1] = 3221225472;
  v80 = __130__AVTAvatar__transitionFromPose_toPose_bakedAnimationBlendFactor_duration_delay_timingFunction_timingAnimation_completionHandler___block_invoke_2;
  v81 = &__block_descriptor_40_e63_v40__0__CABasicAnimation_8__NSString_16___SCNAnimatable__24__32l;
  double v82 = v26;
  v66 = [(AVTAvatar *)self bakedAnimationPlayer];
  v67 = v66;
  if (v66)
  {
    if (a6 <= 0.0)
    {
      [v66 removeAnimationForKey:@"transition-blendFactor"];
      [v67 setBlendFactor:a5];
    }
    else
    {
      long long v68 = [MEMORY[0x263F15760] animationWithKeyPath:@"blendFactor"];
      v80((uint64_t)v79, v68, @"transition-blendFactor", v67, (void (*)(void *, float))AVTInterpolateBasicAnimationFloat);
      unsigned int v69 = [NSNumber numberWithDouble:a5];
      [v68 setToValue:v69];

      [v68 setDuration:a6];
      [v68 setBeginTime:v26];
      [v68 setFillMode:*MEMORY[0x263F15AB0]];
      [v68 setRemovedOnCompletion:0];
      float v70 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
      [v68 setTimingFunction:v70];

      unsigned int v71 = [v68 fromValue];

      if (v71)
      {
        unsigned int v72 = [v68 fromValue];
        [v72 floatValue];
        [v67 setBlendFactor:v73];
      }
      [v67 addAnimation:v68 forKey:@"transition-blendFactor"];

      double v43 = v77;
    }
  }
  [MEMORY[0x263F16B08] commit];

  objc_destroyWeak(&v93);
  objc_destroyWeak(location);
}

uint64_t __130__AVTAvatar__transitionFromPose_toPose_bakedAnimationBlendFactor_duration_delay_timingFunction_timingAnimation_completionHandler___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!*(unsigned char *)(a1 + 48)) {
      --WeakRetained[28];
    }
    WeakRetained = *(_DWORD **)(a1 + 32);
    if (WeakRetained)
    {
      uint64_t v5 = v3;
      WeakRetained = (_DWORD *)(*((uint64_t (**)(void))WeakRetained + 2))();
      id v3 = v5;
    }
  }
  return MEMORY[0x270F9A758](WeakRetained, v3);
}

void __130__AVTAvatar__transitionFromPose_toPose_bakedAnimationBlendFactor_duration_delay_timingFunction_timingAnimation_completionHandler___block_invoke_258(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (*(double *)(a1 + 48) <= 0.0)
  {
    [v11 removeAnimationForKey:v13];
    if (v15) {
      [v11 setValue:v15 forKeyPath:v12];
    }
  }
  else
  {
    if (!v14)
    {
      id v16 = [v11 presentationNode];
      id v14 = [v16 valueForKeyPath:v12];
    }
    double v17 = *(void **)(a1 + 32);
    if (v17)
    {
      v99 = v14;
      v100 = v12;
      id v97 = v13;
      v98 = v11;
      id v18 = [v17 keyTimes];
      id v19 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v18, "count"));
      long long v120 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      id v20 = v18;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v120 objects:v127 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v121;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v121 != v23) {
              objc_enumerationMutation(v20);
            }
            double v25 = *(double *)(a1 + 48);
            [*(id *)(*((void *)&v120 + 1) + 8 * i) floatValue];
            double v27 = v25 * v26;
            *(float *)&double v27 = v27;
            uint64_t v28 = [NSNumber numberWithFloat:v27];
            [v19 addObject:v28];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v120 objects:v127 count:16];
        }
        while (v22);
      }
      v96 = v20;

      double v29 = [*(id *)(a1 + 32) values];
      int32x4_t v30 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v29, "count"));
      v95 = v29;
      if ([v100 isEqualToString:@"position"])
      {
        objc_msgSend(v99, "avt_float3Value");
        float32x4_t v103 = v31;
        long long v116 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        id v32 = v29;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v116 objects:v126 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v117;
          do
          {
            for (uint64_t j = 0; j != v34; ++j)
            {
              if (*(void *)v117 != v35) {
                objc_enumerationMutation(v32);
              }
              float32x4_t v37 = *(void **)(*((void *)&v116 + 1) + 8 * j);
              objc_msgSend(v15, "avt_float3Value", v95, v96);
              float32x4_t v106 = v38;
              [v37 floatValue];
              double v40 = objc_msgSend(MEMORY[0x263F08D40], "avt_valueWithFloat3_usableWithKVCForSCNVector3:", *(double *)vmlaq_n_f32(v103, vsubq_f32(v106, v103), v39).i64);
              [v30 addObject:v40];
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v116 objects:v126 count:16];
          }
          while (v34);
        }
      }
      else if ([v100 isEqualToString:@"orientation"])
      {
        objc_msgSend(v99, "avt_float4Value");
        float32x4_t v107 = v42;
        long long v112 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        id v43 = v29;
        uint64_t v44 = [v43 countByEnumeratingWithState:&v112 objects:v125 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v113;
          do
          {
            for (uint64_t k = 0; k != v45; ++k)
            {
              if (*(void *)v113 != v46) {
                objc_enumerationMutation(v43);
              }
              int32x4_t v48 = *(void **)(*((void *)&v112 + 1) + 8 * k);
              objc_msgSend(v15, "avt_float4Value", v95, v96);
              float32x4_t v104 = v49;
              [v48 floatValue];
              float v51 = v50;
              float32x4_t v52 = vmulq_f32(v107, v104);
              float32x4_t v53 = (float32x4_t)vextq_s8((int8x16_t)v52, (int8x16_t)v52, 8uLL);
              *(float32x2_t *)v52.f32 = vadd_f32(*(float32x2_t *)v52.f32, *(float32x2_t *)v53.f32);
              v52.f32[0] = vaddv_f32(*(float32x2_t *)v52.f32);
              v53.i64[0] = 0;
              float32x4_t v54 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v52, v53)), 0), (int8x16_t)vnegq_f32(v104), (int8x16_t)v104);
              float v55 = 1.0;
              float32x4_t v56 = vsubq_f32(v107, v54);
              int8x16_t v57 = (int8x16_t)vmulq_f32(v56, v56);
              float32x4_t v105 = v54;
              float32x4_t v58 = vaddq_f32(v107, v54);
              int8x16_t v59 = (int8x16_t)vmulq_f32(v58, v58);
              float v60 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v57.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v57, v57, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v59.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v59, v59, 8uLL)))));
              float v61 = v60 + v60;
              float v62 = 1.0;
              if ((float)(v60 + v60) != 0.0) {
                float v62 = sinf(v60 + v60) / v61;
              }
              float v63 = (float)(1.0 - v51) * v61;
              if (v63 != 0.0)
              {
                float v101 = v62;
                float v64 = sinf((float)(1.0 - v51) * v61);
                float v62 = v101;
                float v55 = v64 / v63;
              }
              float v65 = v51 * v61;
              float v66 = 1.0;
              if (v65 != 0.0)
              {
                float v102 = v62;
                float v67 = sinf(v65);
                float v62 = v102;
                float v66 = v67 / v65;
              }
              float v68 = v62;
              float32x2_t v69 = vrecpe_f32((float32x2_t)LODWORD(v62));
              float32x2_t v70 = vmul_f32(v69, vrecps_f32((float32x2_t)LODWORD(v68), v69));
              float v71 = vmul_f32(v70, vrecps_f32((float32x2_t)LODWORD(v68), v70)).f32[0];
              v70.f32[0] = (float)(1.0 - v51) * (float)(v71 * v55);
              float32x4_t v72 = vmlaq_f32(vmulq_n_f32(v105, v51 * (float)(v71 * v66)), v107, (float32x4_t)vdupq_lane_s32((int32x2_t)v70, 0));
              int8x16_t v73 = (int8x16_t)vmulq_f32(v72, v72);
              float32x2_t v74 = vadd_f32(*(float32x2_t *)v73.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v73, v73, 8uLL));
              double v75 = 0.0;
              if (vaddv_f32(v74) != 0.0)
              {
                unsigned __int32 v76 = vadd_f32(v74, (float32x2_t)vdup_lane_s32((int32x2_t)v74, 1)).u32[0];
                float32x2_t v77 = vrsqrte_f32((float32x2_t)v76);
                float32x2_t v78 = vmul_f32(v77, vrsqrts_f32((float32x2_t)v76, vmul_f32(v77, v77)));
                *(void *)&double v75 = vmulq_n_f32(v72, vmul_f32(v78, vrsqrts_f32((float32x2_t)v76, vmul_f32(v78, v78))).f32[0]).u64[0];
              }
              v79 = objc_msgSend(MEMORY[0x263F08D40], "avt_valueWithFloat4_usableWithKVCForSCNVector4:", v75);
              [v30 addObject:v79];
            }
            uint64_t v45 = [v43 countByEnumeratingWithState:&v112 objects:v125 count:16];
          }
          while (v45);
        }
      }
      else
      {
        [v99 floatValue];
        float v81 = v80;
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        id v82 = v29;
        uint64_t v83 = [v82 countByEnumeratingWithState:&v108 objects:v124 count:16];
        if (v83)
        {
          uint64_t v84 = v83;
          uint64_t v85 = *(void *)v109;
          do
          {
            for (uint64_t m = 0; m != v84; ++m)
            {
              if (*(void *)v109 != v85) {
                objc_enumerationMutation(v82);
              }
              id v87 = *(void **)(*((void *)&v108 + 1) + 8 * m);
              objc_msgSend(v15, "floatValue", v95, v96);
              float v89 = v88;
              [v87 floatValue];
              *(float *)&double v91 = v81 + (float)(v90 * (float)(v89 - v81));
              id v92 = [NSNumber numberWithFloat:v91];
              [v30 addObject:v92];
            }
            uint64_t v84 = [v82 countByEnumeratingWithState:&v108 objects:v124 count:16];
          }
          while (v84);
        }
      }

      id v12 = v100;
      id v93 = [MEMORY[0x263F157D8] animationWithKeyPath:v100];
      [v93 setKeyTimes:v19];
      [v93 setValues:v30];
      [v93 setFillMode:*MEMORY[0x263F15AB0]];
      [v93 setRemovedOnCompletion:0];
      [v93 setDuration:*(double *)(a1 + 48)];
      [v93 setBeginTime:*(double *)(a1 + 56)];
      [v93 setTimingFunction:0];
      id v13 = v97;
      id v11 = v98;
      [v98 addAnimation:v93 forKey:v97];

      id v14 = v99;
    }
    else
    {
      uint64_t v41 = [MEMORY[0x263F15760] animationWithKeyPath:v12];
      [v41 setFromValue:v14];
      if (v15)
      {
        [v41 setToValue:v15];
        [v41 setFillMode:*MEMORY[0x263F15AB0]];
      }
      [v41 setRemovedOnCompletion:0];
      [v41 setDuration:*(double *)(a1 + 48)];
      [v41 setBeginTime:*(double *)(a1 + 56)];
      if (*(void *)(a1 + 40))
      {
        objc_msgSend(v41, "setTimingFunction:");
      }
      else
      {
        BOOL v94 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
        [v41 setTimingFunction:v94];
      }
      [v11 addAnimation:v41 forKey:v13];
    }
  }
}

void __130__AVTAvatar__transitionFromPose_toPose_bakedAnimationBlendFactor_duration_delay_timingFunction_timingAnimation_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, void (*a5)(void *, float))
{
  id v23 = a2;
  double v9 = [a4 animationForKey:a3];
  id v10 = v9;
  if (v9)
  {
    [v9 beginTime];
    double v12 = v11;
    [v10 duration];
    if (v12 + v13 <= *(double *)(a1 + 32))
    {
      uint64_t v21 = [v10 toValue];
      goto LABEL_7;
    }
    uint64_t v14 = [v10 fromValue];
    if (v14)
    {
      id v15 = (void *)v14;
      id v16 = [v10 toValue];

      if (v16)
      {
        double v17 = *(double *)(a1 + 32);
        [v10 beginTime];
        double v19 = v17 - v18;
        [v10 duration];
        *(float *)&double v20 = v19 / v20;
        uint64_t v21 = a5(v10, *(float *)&v20);
LABEL_7:
        uint64_t v22 = (void *)v21;
        [v23 setFromValue:v21];
      }
    }
  }
}

- (void)stopTransitionAnimation
{
  if (self->_morphInfoFromARKitBlendShapeIndex)
  {
    for (uint64_t i = 8; i != 1672; i += 32)
      [*(id *)((char *)&self->_morphInfoFromARKitBlendShapeIndex->var0 + i) removeAllAnimations];
    if (self->_friendlyPoseMorphInfoCount)
    {
      unint64_t v4 = 0;
      uint64_t v5 = 8;
      do
      {
        [*(id *)((char *)&self->_friendlyPoseMorphInfos->var0 + v5) removeAllAnimations];
        ++v4;
        v5 += 32;
      }
      while (v4 < self->_friendlyPoseMorphInfoCount);
    }
    [(SCNNode *)self->_rootJointNode removeAllAnimations];
    [(SCNNode *)self->_neckNode removeAllAnimations];
    [(SCNAnimationPlayer *)self->_bakedAnimationPlayer_lazy removeAllAnimations];
    self->_transitionCount = 0;
  }
}

- (void)stopTransitionAnimationWithBlendOutDuration:(double)a3
{
  for (uint64_t i = 8; i != 1672; i += 32)
    [*(id *)((char *)&self->_morphInfoFromARKitBlendShapeIndex->var0 + i) removeAllAnimationsWithBlendOutDuration:a3];
  if (self->_friendlyPoseMorphInfoCount)
  {
    unint64_t v6 = 0;
    uint64_t v7 = 8;
    do
    {
      [*(id *)((char *)&self->_friendlyPoseMorphInfos->var0 + v7) removeAllAnimationsWithBlendOutDuration:a3];
      ++v6;
      v7 += 32;
    }
    while (v6 < self->_friendlyPoseMorphInfoCount);
  }
  [(SCNNode *)self->_rootJointNode removeAllAnimationsWithBlendOutDuration:a3];
  [(SCNNode *)self->_neckNode removeAllAnimationsWithBlendOutDuration:a3];
  [(SCNAnimationPlayer *)self->_bakedAnimationPlayer_lazy removeAllAnimationsWithBlendOutDuration:a3];
  self->_transitionCount = 0;
}

- (id)snapshotWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  id v10 = +[AVTSnapshotBuilder sharedInstance];
  objc_sync_enter(v10);
  [v10 setAvatar:self];
  double v11 = [v9 objectForKeyedSubscript:@"AVTSnapshotAnimatedKey"];
  int v12 = [v11 BOOLValue];

  if (v12) {
    objc_msgSend(v10, "animatedImageWithSize:scale:options:", v9, width, height, a4);
  }
  else {
  double v13 = objc_msgSend(v10, "imageWithSize:scale:options:", v9, width, height, a4);
  }
  objc_sync_exit(v10);

  return v13;
}

+ (void)preloadAvatar:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = (void *)MEMORY[0x2105397E0]();
  float v8 = @"AVTRendererOptionInitiallyConfigureForARMode";
  v9[0] = MEMORY[0x263EFFA80];
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  unint64_t v6 = +[SCNRenderer rendererWithDevice:0 options:v5];

  [v6 setAvatar:v3];
  uint64_t v7 = [v6 scene];
  [v6 prepareObject:v7 shouldAbortBlock:0];
}

- (unint64_t)usageIntent
{
  return 0;
}

- (id)copyWithUsageIntent:(unint64_t)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = avt_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[AVTAvatar copyWithZone:]();
  }

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)canLoadDataRepresentation:(id)a3
{
  return +[AVTAvatarDescriptor canLoadDataRepresentation:a3];
}

- (id)dataRepresentation
{
  id v2 = [(AVTAvatar *)self newDescriptor];
  id v3 = [v2 dataRepresentation];

  return v3;
}

+ (AVTAvatar)avatarWithDataRepresentation:(id)a3 error:(id *)a4
{
  return (AVTAvatar *)[a1 avatarWithDataRepresentation:a3 usageIntent:0 error:a4];
}

+ (AVTAvatar)avatarWithDataRepresentation:(id)a3 usageIntent:(unint64_t)a4 error:(id *)a5
{
  float v8 = +[AVTAvatarDescriptor descriptorWithDataRepresentation:a3 error:a5];
  id v9 = [a1 avatarWithDescriptor:v8 usageIntent:a4 error:a5];

  return (AVTAvatar *)v9;
}

- (id)newDescriptor
{
  id v2 = avt_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[AVTAvatar newDescriptor]();
  }

  return 0;
}

+ (AVTAvatar)avatarWithDescriptor:(id)a3 usageIntent:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v8 = off_26401ECC8;
LABEL_5:
    id v9 = (void *)[objc_alloc(*v8) initWithDescriptor:v7 usageIntent:a4 error:a5];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v8 = off_26401EC50;
    goto LABEL_5;
  }
  id v9 = 0;
LABEL_7:

  return (AVTAvatar *)v9;
}

- (id)avatarNodeForPhysicsController:(id)a3
{
  return self->_avatarNode;
}

- (double)physicsController:(id)a3 downforceForNodeNamed:(id)a4
{
  [(AVTAvatar *)self physicsDownforceForNodeNamed:a4];
  return result;
}

- (id)stickerPhysicsStateIdentifier
{
  id v2 = avt_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[AVTAvatar stickerPhysicsStateIdentifier]();
  }

  return 0;
}

- (id)nodesMatchingStickerPattern:(id)a3 inHierarchy:(id)a4 options:(unint64_t)a5 includingDerivedNodes:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(AVTAvatar *)self _addNodesMatchingStickerPattern:v10 inHierarchy:v11 toArray:v12 options:a5];
    if (!v6) {
      goto LABEL_17;
    }
LABEL_16:
    -[AVTAvatar addDerivedNodesMatchingStickerPattern:toArray:options:](self, "addDerivedNodesMatchingStickerPattern:toArray:options:", v10, v12, a5, (void)v19);
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    double v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          -[AVTAvatar _addNodesMatchingStickerPattern:inHierarchy:toArray:options:](self, "_addNodesMatchingStickerPattern:inHierarchy:toArray:options:", *(void *)(*((void *)&v19 + 1) + 8 * i), v11, v12, a5, (void)v19);
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }
  else
  {
    double v13 = avt_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AVTAvatar nodesMatchingStickerPattern:inHierarchy:options:includingDerivedNodes:]();
    }
  }

  if (v6) {
    goto LABEL_16;
  }
LABEL_17:

  return v12;
}

- (void)_addNodesMatchingStickerPattern:(id)a3 inHierarchy:(id)a4 toArray:(id)a5 options:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  LOBYTE(a4) = [v9 hasSuffix:@"*"];
  id v12 = objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - 1);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__AVTAvatar__addNodesMatchingStickerPattern_inHierarchy_toArray_options___block_invoke;
  v16[3] = &unk_264020B30;
  char v21 = (char)a4;
  id v17 = v12;
  id v18 = v10;
  id v19 = v9;
  unint64_t v20 = a6;
  id v13 = v9;
  id v14 = v10;
  id v15 = v12;
  [v11 enumerateHierarchyUsingBlock:v16];
}

void __73__AVTAvatar__addNodesMatchingStickerPattern_inHierarchy_toArray_options___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (*(unsigned char *)(a1 + 64))
  {
    id v3 = [v7 name];
    int v4 = [v3 hasPrefix:*(void *)(a1 + 32)];

    if (v4)
    {
      if (!AVTNodeMatchesHierarchyEnumerationOptions(v7, *(void *)(a1 + 56))) {
        goto LABEL_8;
      }
LABEL_7:
      [*(id *)(a1 + 40) addObject:v7];
      goto LABEL_8;
    }
  }
  uint64_t v5 = [v7 name];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 48)];

  if (v6 && AVTNodeMatchesHierarchyEnumerationOptions(v7, *(void *)(a1 + 56))) {
    goto LABEL_7;
  }
LABEL_8:
}

- (float)opacity
{
  id v2 = [(AVTAvatar *)self avatarNode];
  id v3 = v2;
  if (v2)
  {
    [v2 opacity];
    float v5 = v4;
  }
  else
  {
    int v6 = avt_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AVTAvatar opacity]();
    }

    float v5 = 1.0;
  }

  return v5;
}

- (void)setOpacity:(float)a3
{
  id v7 = [(AVTAvatar *)self avatarNode];
  [v7 opacity];
  if (v5 != a3)
  {
    if (a3 == 1.0 || ([v7 opacity], v6 == 1.0)) {
      [(AVTAvatar *)self _preparePrePass:a3 != 1.0];
    }
    [v7 setOpacity:a3];
  }
}

- (void)_preparePrePass:(BOOL)a3
{
  double v4 = [(AVTAvatar *)self avatarNode];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__AVTAvatar__preparePrePass___block_invoke;
  v5[3] = &__block_descriptor_33_e21_v24__0__SCNNode_8_B16l;
  BOOL v6 = a3;
  [v4 enumerateHierarchyUsingBlock:v5];
}

void __29__AVTAvatar__preparePrePass___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 renderingOrder] <= 0) {
    [v3 setUsesDepthPrePass:*(unsigned __int8 *)(a1 + 32)];
  }
}

- (NSDictionary)specializationSettings
{
  return self->_specializationSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specializationSettings, 0);
  objc_storeStrong((id *)&self->_didUpdateAtTimeCallbackItems, 0);
  objc_storeStrong((id *)&self->_bakedAnimationPlayer_lazy, 0);
  objc_storeStrong((id *)&self->_bakedAnimation, 0);
  objc_storeStrong((id *)&self->_eyeSkinningDescriptor, 0);
  objc_storeStrong((id *)&self->_pupilReflectionCorrectionDescriptor, 0);
  objc_storeStrong((id *)&self->_morpherDrivenMaterialDescriptors, 0);
  objc_storeStrong((id *)&self->_dynamics, 0);
  objc_storeStrong((id *)&self->_physicsController, 0);
  objc_storeStrong((id *)&self->_portalPresentationConfigurationNode, 0);
  objc_storeStrong((id *)&self->_presentationConfiguration, 0);
  objc_storeStrong((id *)&self->_rootJointNode, 0);
  objc_storeStrong((id *)&self->_neckNode, 0);
  objc_storeStrong((id *)&self->_rightEye, 0);
  objc_storeStrong((id *)&self->_leftEye, 0);
  objc_storeStrong((id *)&self->_headNode, 0);
  objc_storeStrong((id *)&self->_skeleton, 0);
  objc_storeStrong((id *)&self->_avatarNode, 0);
}

- (void)headNode
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_20B819000, v0, v1, "Error: Unreachable code: abstract method called: headNode", v2, v3, v4, v5, v6);
}

- (void)avatarNode
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_20B819000, v0, v1, "Error: Unreachable code: abstract method called: avatarNode", v2, v3, v4, v5, v6);
}

- (void)_restoreOriginalShaderModifiersOfMaterial:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20B819000, v0, v1, "Error: Unreachable code: Unknown stored shader modifiers %@", v2, v3, v4, v5, v6);
}

- (void)arMode
{
}

- (void)setArMode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateBindingsOfNode:.cold.1()
{
  __assert_rtn("-[AVTAvatar updateBindingsOfNode:]", "AVTAvatar.m", 645, "_headNode != nil && _morphInfoFromARKitBlendShapeIndex != nil");
}

- (void)updatePoseWithFaceTrackingData:(void *)a1 applySmoothing:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "data.length == sizeof(AVTFaceTrackingData)";
  __int16 v5 = 2048;
  uint64_t v6 = [a1 length];
  __int16 v7 = 2048;
  uint64_t v8 = 480;
  _os_log_error_impl(&dword_20B819000, a2, OS_LOG_TYPE_ERROR, "Error: Condition '%s' failed. Inconsistent size for AVTFaceTrackingData (%zu vs %zu)", (uint8_t *)&v3, 0x20u);
}

- (void)updatePoseWithCVAFaceTrackingAnimationDictionary:(uint64_t)a3 neckPosition:(uint64_t)a4 neckOrientation:(uint64_t)a5 applySmoothing:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_applyHeadPoseWithTrackingData:gazeCorrection:pointOfView:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_20B819000, v0, v1, "Error: applyHeadPoseWithTrackingInfo - missing point of view for correct AR mode", v2, v3, v4, v5, v6);
}

- (void)pose
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B819000, v2, v3, "Error: Unreachable code: Unsupported CAAnimation subclass (%@)", v4, v5, v6, v7, v8);
}

- (void)copyWithZone:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_20B819000, v0, v1, "Error: Unreachable code: copyWithZone: abstract implementation invoked", v2, v3, v4, v5, v6);
}

- (void)newDescriptor
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_20B819000, v0, v1, "Error: Unreachable code: abstract method called: -newDescriptor:", v2, v3, v4, v5, v6);
}

- (void)stickerPhysicsStateIdentifier
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_20B819000, v0, v1, "Error: Unreachable code: abstract method called: stickerPhysicsStateIdentifier", v2, v3, v4, v5, v6);
}

- (void)nodesMatchingStickerPattern:inHierarchy:options:includingDerivedNodes:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_20B819000, v0, v1, "Error: Unreachable code: Unexpected pattern", v2, v3, v4, v5, v6);
}

- (void)opacity
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_20B819000, v0, v1, "Error: avatar opacity: no avatar node", v2, v3, v4, v5, v6);
}

@end