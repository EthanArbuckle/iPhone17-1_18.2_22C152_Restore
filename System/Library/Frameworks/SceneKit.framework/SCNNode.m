@interface SCNNode
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (SCNNode)node;
+ (SCNNode)nodeWithGeometry:(SCNGeometry *)geometry;
+ (SCNNode)nodeWithMDLAsset:(id)a3;
+ (SCNNode)nodeWithMDLAsset:(id)a3 options:(id)a4;
+ (SCNNode)nodeWithMDLObject:(MDLObject *)mdlObject;
+ (SCNNode)nodeWithMDLObject:(id)a3 masterObjects:(id)a4 sceneNodes:(id)a5 skinnedMeshes:(id)a6 skelNodesMap:(void *)a7 asset:(id)a8 options:(id)a9;
+ (SCNNode)nodeWithMDLObject:(id)a3 options:(id)a4;
+ (SCNNode)nodeWithNodeRef:(__C3DNode *)a3;
+ (SCNVector3)localFront;
+ (SCNVector3)localRight;
+ (SCNVector3)localUp;
+ (id)_dumpNodeTree:(id)a3 tab:(id)a4;
+ (id)keyPathsForValuesAffectingEulerAngles;
+ (id)keyPathsForValuesAffectingOrientation;
+ (id)keyPathsForValuesAffectingPosition;
+ (id)keyPathsForValuesAffectingRotation;
+ (id)keyPathsForValuesAffectingScale;
+ (id)keyPathsForValuesAffectingTransform;
+ (simd_float3)simdLocalFront;
+ (simd_float3)simdLocalRight;
+ (simd_float3)simdLocalUp;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)_childNodesPassingTest:(id)a3 recursively:(BOOL)a4 output:(id)a5;
- (BOOL)_enumerateChildNodesUsingBlock:(id)a3;
- (BOOL)_isAReference;
- (BOOL)_isEffectivelyHidden;
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)authoringEnvironmentNode;
- (BOOL)canAddChildNode:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)castsShadow;
- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4;
- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4;
- (BOOL)getFrustum:(id *)a3 withViewport:;
- (BOOL)hasActions;
- (BOOL)isAnimationForKeyPaused:(id)a3;
- (BOOL)isFocusInteractionEnabled;
- (BOOL)isGizmo;
- (BOOL)isHidden;
- (BOOL)isHittable;
- (BOOL)isJoint;
- (BOOL)isPaused;
- (BOOL)isPausedOrPausedByInheritance;
- (BOOL)isPresentationInstance;
- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)simdGetBoundingSphereCenter:(SCNNode *)self radius:(SEL)a2;
- (BOOL)usesDepthPrePass;
- (CGFloat)opacity;
- (CGRect)_focusFrameInView:(id)a3;
- (CGRect)frame;
- (GKEntity)entity;
- (NSArray)actionKeys;
- (NSArray)animationKeys;
- (NSArray)childNodes;
- (NSArray)childNodesPassingTest:(void *)predicate;
- (NSArray)constraints;
- (NSArray)filters;
- (NSArray)hitTestWithSegmentFromPoint:(SCNVector3)pointA toPoint:(SCNVector3)pointB options:(NSDictionary *)options;
- (NSArray)particleSystems;
- (NSInteger)renderingOrder;
- (NSString)description;
- (NSString)name;
- (NSUInteger)categoryBitMask;
- (SCNMatrix4)convertTransform:(SEL)a3 fromNode:(SCNMatrix4 *)transform;
- (SCNMatrix4)convertTransform:(SEL)a3 toNode:(SCNMatrix4 *)transform;
- (SCNMatrix4)pivot;
- (SCNMatrix4)transform;
- (SCNMatrix4)worldTransform;
- (SCNMovabilityHint)movabilityHint;
- (SCNNode)childNodeWithName:(NSString *)name recursively:(BOOL)recursively;
- (SCNNode)clone;
- (SCNNode)flattenedClone;
- (SCNNode)init;
- (SCNNode)initWithCoder:(id)a3;
- (SCNNode)initWithNodeRef:(__C3DNode *)a3;
- (SCNNode)parentNode;
- (SCNNode)presentationNode;
- (SCNNodeFocusBehavior)focusBehavior;
- (SCNPhysicsBody)physicsBody;
- (SCNPhysicsField)physicsField;
- (SCNQuaternion)orientation;
- (SCNQuaternion)worldOrientation;
- (SCNVector3)convertPosition:(SCNVector3)position fromNode:(SCNNode *)node;
- (SCNVector3)convertPosition:(SCNVector3)position toNode:(SCNNode *)node;
- (SCNVector3)convertVector:(SCNVector3)vector fromNode:(SCNNode *)node;
- (SCNVector3)convertVector:(SCNVector3)vector toNode:(SCNNode *)node;
- (SCNVector3)eulerAngles;
- (SCNVector3)position;
- (SCNVector3)scale;
- (SCNVector3)worldFront;
- (SCNVector3)worldPosition;
- (SCNVector3)worldRight;
- (SCNVector3)worldUp;
- (SCNVector4)rotation;
- (UICoordinateSpace)coordinateSpace;
- (__C3DAnimationManager)animationManager;
- (__C3DNode)nodeRef;
- (__C3DScene)sceneRef;
- (double)_euler;
- (id)__camera;
- (id)__geometry;
- (id)__light;
- (id)__morpher;
- (id)__skinner;
- (id)_associatedMDLObject;
- (id)_audioPlayers;
- (id)_copyRecursively;
- (id)_dumpTree;
- (id)_findComponentWithType:(int64_t)a3;
- (id)_particleSystems;
- (id)_scnAnimationForKey:(id)a3;
- (id)_scnBindings;
- (id)_subdividedCopyWithSubdivisionLevel:(int64_t)a3;
- (id)actionForKey:(id)a3;
- (id)actions;
- (id)animationForKey:(id)a3;
- (id)animationPlayerForKey:(id)a3;
- (id)attributeForKey:(id)a3;
- (id)authoringEnvironmentCompanionNode;
- (id)authoringEnvironmentPresentationNode;
- (id)childNodeWithName:(id)a3;
- (id)childNodesPassingTest:(id)a3 recursively:(BOOL)a4;
- (id)childNodesWithAttribute:(Class)a3 recursively:(BOOL)a4;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugQuickLookData;
- (id)debugQuickLookObject;
- (id)flattenedCopy;
- (id)focusItemsInRect:(CGRect)a3;
- (id)getBoundingBox;
- (id)getBoundingSphere;
- (id)identifier;
- (id)initPresentationNodeWithNodeRef:(__C3DNode *)a3;
- (id)jsChildNodesWithAttribute:(id)a3;
- (id)mutableChildNodes;
- (id)objectInAudioPlayersAtIndex:(unint64_t)a3;
- (id)objectInChildNodesAtIndex:(unint64_t)a3;
- (id)objectInChildNodesWithAttribute:(id)a3 firstOnly:(BOOL)a4;
- (id)objectInChildNodesWithName:(id)a3;
- (id)objectInParticleSystemsAtIndex:(unint64_t)a3;
- (id)parentFocusEnvironment;
- (id)postMorphingDeformers;
- (id)postSkinningDeformers;
- (id)preferredFocusEnvironments;
- (id)rendererDelegate;
- (id)scene;
- (id)valueForKeyPath:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)authoringCameraType;
- (int64_t)rotationRepresentation;
- (simd_float3)simdConvertPosition:(simd_float3)position fromNode:(SCNNode *)node;
- (simd_float3)simdConvertPosition:(simd_float3)position toNode:(SCNNode *)node;
- (simd_float3)simdConvertVector:(simd_float3)vector fromNode:(SCNNode *)node;
- (simd_float3)simdConvertVector:(simd_float3)vector toNode:(SCNNode *)node;
- (simd_float3)simdEulerAngles;
- (simd_float3)simdPosition;
- (simd_float3)simdScale;
- (simd_float3)simdWorldFront;
- (simd_float3)simdWorldPosition;
- (simd_float3)simdWorldRight;
- (simd_float3)simdWorldUp;
- (simd_float4)simdRotation;
- (simd_float4x4)simdConvertTransform:(simd_float4x4)transform fromNode:(SCNNode *)node;
- (simd_float4x4)simdConvertTransform:(simd_float4x4)transform toNode:(SCNNode *)node;
- (simd_float4x4)simdPivot;
- (simd_float4x4)simdTransform;
- (simd_float4x4)simdWorldTransform;
- (simd_quatf)simdOrientation;
- (simd_quatf)simdWorldOrientation;
- (unint64_t)countOfAudioPlayers;
- (unint64_t)countOfChildNodes;
- (unint64_t)countOfParticleSystems;
- (unint64_t)indexOfChildNode:(id)a3;
- (void)__CFObject;
- (void)__insertObject:(id)a3 inChildNodesAtIndex:(unint64_t)a4;
- (void)__removeObjectFromChildNodesAtIndex:(unint64_t)a3;
- (void)_addSkinnerWithMDLMesh:(id)a3 sceneNodes:(id)a4;
- (void)_appendFocusableNodesInRect:(CGRect)a3 ofView:(id)a4 toFocusItems:(id)a5;
- (void)_assignComponent:(id)a3 toContainerWithType:(int64_t)a4;
- (void)_bakeNodes:(id)a3 folderPath:(id)a4 inVertex:(BOOL)a5 bakeAO:(BOOL)a6 quality:(float)a7 attenuation:(float)a8 geomSetter:(id)a9 terminateSetter:(id)a10;
- (void)_childNodesWithAttribute:(Class)a3 output:(id)a4 recursively:(BOOL)a5;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_customDecodingOfSCNNode:(id)a3;
- (void)_customEncodingOfSCNNode:(id)a3 usePresentationInstance:(BOOL)a4;
- (void)_dump:(id)a3;
- (void)_encodeNodePropertiesWithCoder:(id)a3;
- (void)_initChildNodesArray;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_quaternion;
- (void)_removeAction:(id)a3 forKey:(id)a4;
- (void)_removeComponentWithType:(int64_t)a3;
- (void)_removeDeadParticleSystem:(__C3DParticleSystem *)a3;
- (void)_setAttributes:(id)a3;
- (void)_setComponent:(id)a3 withType:(int64_t)a4;
- (void)_setHasFocusableChild;
- (void)_setParent:(id)a3;
- (void)_setPausedOrPausedByInheritance:(BOOL)a3;
- (void)_setPosition:(SCNNode *)self;
- (void)_setQuaternion:(float32x4_t *)a1;
- (void)_setScale:(SCNNode *)self;
- (void)_syncEntityObjCModel;
- (void)_syncObjCAnimations;
- (void)_syncObjCModel;
- (void)_syncObjCModelAfterC3DIOSceneLoadingWithNodeRef:(__C3DNode *)a3;
- (void)_updateAffine;
- (void)_updateFocusableCache;
- (void)_updateTransform;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)addAudioPlayer:(SCNAudioPlayer *)player;
- (void)addChildNode:(SCNNode *)child;
- (void)addParticleSystem:(SCNParticleSystem *)system;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)dealloc;
- (void)dump;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateChildNodesUsingBlock:(void *)block;
- (void)enumerateHierarchyUsingBlock:(void *)block;
- (void)frame;
- (void)insertObject:(id)a3 inAudioPlayersAtIndex:(unint64_t)a4;
- (void)insertObject:(id)a3 inParticleSystemsAtIndex:(unint64_t)a4;
- (void)localRotateBy:(SCNQuaternion)rotation;
- (void)localTranslateBy:(SCNVector3)translation;
- (void)lookAt:(SCNVector3)worldTarget;
- (void)lookAt:(SCNVector3)worldTarget up:(SCNVector3)worldUp localFront:(SCNVector3)localFront;
- (void)pauseAnimationForKey:(id)a3;
- (void)removeActionForKey:(id)a3;
- (void)removeAllActions;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(double)a3;
- (void)removeAllAudioPlayers;
- (void)removeAllBindings;
- (void)removeAllChilds;
- (void)removeAllParticleSystems;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(double)a4;
- (void)removeAudioPlayer:(SCNAudioPlayer *)player;
- (void)removeFromParentNode;
- (void)removeObjectFromAudioPlayersAtIndex:(unint64_t)a3;
- (void)removeObjectFromParticleSystemsAtIndex:(unint64_t)a3;
- (void)removeParticleSystem:(SCNParticleSystem *)system;
- (void)renderInContext:(void *)a3;
- (void)replaceChildNode:(SCNNode *)oldChild with:(SCNNode *)newChild;
- (void)replaceObjectInAudioPlayerAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)replaceObjectInChildNodesAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)replaceObjectInParticleSystemsAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)resumeAnimationForKey:(id)a3;
- (void)rotateBy:(SCNQuaternion)worldRotation aroundTarget:(SCNVector3)worldTarget;
- (void)runAction:(id)a3;
- (void)runAction:(id)a3 completionHandler:(id)a4;
- (void)runAction:(id)a3 forKey:(id)a4;
- (void)runAction:(id)a3 forKey:(id)a4 completionHandler:(id)a5;
- (void)setAttribute:(id)a3 forKey:(id)a4;
- (void)setAuthoringCameraType:(int64_t)a3;
- (void)setAuthoringEnvironmentCompanionNode:(id)a3;
- (void)setAuthoringEnvironmentNode:(BOOL)a3;
- (void)setAuthoringEnvironmentPresentationNode:(id)a3;
- (void)setBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4;
- (void)setCamera:(SCNCamera *)camera;
- (void)setCastsShadow:(BOOL)castsShadow;
- (void)setCategoryBitMask:(NSUInteger)categoryBitMask;
- (void)setConstraints:(NSArray *)constraints;
- (void)setEntity:(GKEntity *)entity;
- (void)setEulerAngles:(SCNVector3)eulerAngles;
- (void)setFilters:(NSArray *)filters;
- (void)setFocusBehavior:(SCNNodeFocusBehavior)focusBehavior;
- (void)setGeometry:(SCNGeometry *)geometry;
- (void)setGizmo:(BOOL)a3;
- (void)setHidden:(BOOL)hidden;
- (void)setHittable:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsJoint:(BOOL)a3;
- (void)setLight:(SCNLight *)light;
- (void)setMorpher:(SCNMorpher *)morpher;
- (void)setMovabilityHint:(SCNMovabilityHint)movabilityHint;
- (void)setName:(NSString *)name;
- (void)setNeedsFocusUpdate;
- (void)setOpacity:(CGFloat)opacity;
- (void)setOrientation:(SCNQuaternion)orientation;
- (void)setPaused:(BOOL)paused;
- (void)setPhysicsBody:(SCNPhysicsBody *)physicsBody;
- (void)setPhysicsField:(SCNPhysicsField *)physicsField;
- (void)setPivot:(SCNMatrix4 *)pivot;
- (void)setPosition:(SCNVector3)position;
- (void)setPostMorphingDeformers:(id)a3;
- (void)setPostSkinningDeformers:(id)a3;
- (void)setRendererDelegate:(id)rendererDelegate;
- (void)setRenderingOrder:(NSInteger)renderingOrder;
- (void)setRotation:(SCNVector4)rotation;
- (void)setScale:(SCNVector3)scale;
- (void)setSimdEulerAngles:(simd_float3)simdEulerAngles;
- (void)setSimdOrientation:(simd_quatf)simdOrientation;
- (void)setSimdPivot:(simd_float4x4)simdPivot;
- (void)setSimdPosition:(simd_float3)simdPosition;
- (void)setSimdRotation:(simd_float4)simdRotation;
- (void)setSimdScale:(simd_float3)simdScale;
- (void)setSimdTransform:(simd_float4x4)simdTransform;
- (void)setSimdWorldOrientation:(simd_quatf)simdWorldOrientation;
- (void)setSimdWorldPosition:(simd_float3)simdWorldPosition;
- (void)setSimdWorldTransform:(simd_float4x4)simdWorldTransform;
- (void)setSkinner:(SCNSkinner *)skinner;
- (void)setSpeed:(double)a3 forAnimationKey:(id)a4;
- (void)setTransform:(SCNMatrix4 *)transform;
- (void)setUsesDepthPrePass:(BOOL)a3;
- (void)setValue:(id)a3 forKeyPath:(id)a4;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setWorldOrientation:(SCNQuaternion)worldOrientation;
- (void)setWorldPosition:(SCNVector3)worldPosition;
- (void)setWorldTransform:(SCNMatrix4 *)worldTransform;
- (void)simdLocalRotateBy:(simd_quatf)rotation;
- (void)simdLocalTranslateBy:(simd_float3)translation;
- (void)simdLookAt:(simd_float3)worldTarget;
- (void)simdLookAt:(simd_float3)worldTarget up:(simd_float3)worldUp localFront:(simd_float3)localFront;
- (void)simdRotateBy:(simd_quatf)worldRotation aroundTarget:(simd_float3)worldTarget;
- (void)unbindAnimatablePath:(id)a3;
- (void)updateFocusIfNeeded;
@end

@implementation SCNNode

- (__C3DScene)sceneRef
{
  v2 = [(SCNNode *)self __CFObject];

  return (__C3DScene *)C3DGetScene(v2);
}

- (void)__CFObject
{
  return self->_node;
}

void __23__SCNNode_setGeometry___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = (__C3DGeometry *)[*(id *)(a1 + 40) geometryRef];

  C3DNodeSetGeometry(v1, v2);
}

float __22__SCNNode_setOpacity___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DNodeSetOpacity(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (SCNNode)childNodeWithName:(NSString *)name recursively:(BOOL)recursively
{
  BOOL v4 = recursively;
  uint64_t v28 = *MEMORY[0x263EF8340];
  v6 = [(SCNNode *)self childNodes];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(SCNNode **)(*((void *)&v22 + 1) + 8 * v10);
      if ([(NSString *)[(SCNNode *)v11 name] isEqualToString:name]) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }
  if (!v11 && v4)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v12 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v6);
          }
          v16 = (SCNNode *)[*(id *)(*((void *)&v18 + 1) + 8 * i) childNodeWithName:name recursively:1];
          if (v16) {
            return v16;
          }
        }
        uint64_t v13 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
        v11 = 0;
        if (v13) {
          continue;
        }
        break;
      }
    }
    else
    {
      return 0;
    }
  }
  return v11;
}

- (NSString)name
{
  if ((*((unsigned char *)self + 40) & 1) == 0) {
    return self->_name;
  }
  BOOL v4 = [(SCNNode *)self sceneRef];
  uint64_t v5 = (uint64_t)v4;
  if (v4) {
    C3DSceneLock((uint64_t)v4);
  }
  Name = (NSString *)C3DEntityGetName((uint64_t)[(SCNNode *)self __CFObject]);
  if (v5) {
    C3DSceneUnlock(v5);
  }
  return Name;
}

- (NSArray)childNodes
{
  if (*((unsigned char *)self + 40))
  {
    uint64_t v5 = [(SCNNode *)self sceneRef];
    uint64_t v6 = (uint64_t)v5;
    if (v5) {
      C3DSceneLock((uint64_t)v5);
    }
    unsigned int ChildNodesCount = C3DNodeGetChildNodesCount((uint64_t)self->_node);
    uint64_t v8 = ChildNodesCount;
    BOOL v4 = (NSArray *)[MEMORY[0x263EFF980] arrayWithCapacity:ChildNodesCount];
    if (ChildNodesCount)
    {
      uint64_t v9 = 0;
      do
        [(NSArray *)v4 addObject:+[SCNNode nodeWithNodeRef:C3DNodeGetChildNodeAtIndex((uint64_t)self->_node, v9++)]];
      while (v8 != v9);
    }
    if (v6) {
      C3DSceneUnlock(v6);
    }
  }
  else
  {
    v3 = (NSArray *)(id)[(NSMutableArray *)self->_childNodes copy];
    if ([(NSArray *)v3 count]) {
      return v3;
    }
    else {
      return (NSArray *)MEMORY[0x263EFFA68];
    }
  }
  return v4;
}

- (void)_syncObjCModel
{
  v3 = [(SCNNode *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  C3DNodeGetMatrix((uint64_t)self->_node, (uint64_t)v10);
  long long v5 = v10[1];
  *(_OWORD *)&self->_anon_30[2] = v10[0];
  *(_OWORD *)&self->_anon_30[18] = v5;
  long long v6 = v10[3];
  *(_OWORD *)&self->_anon_30[34] = v10[2];
  *(_OWORD *)&self->_anon_30[50] = v6;
  *((unsigned char *)self + 41) = *((unsigned char *)self + 41) & 0xFC | 2;
  self->_opacity = C3DNodeGetOpacity((uint64_t)self->_node);
  self->_renderingOrder = (int64_t)C3DNodeGetRenderingOrder((uint64_t)self->_node);
  if (C3DNodeIsHidden((uint64_t)self->_node)) {
    char v7 = 0x80;
  }
  else {
    char v7 = 0;
  }
  *((unsigned char *)self + 41) = v7 & 0x80 | *((unsigned char *)self + 41) & 0x7F;
  *((unsigned char *)self + 42) = *((unsigned char *)self + 42) & 0xFE | C3DNodeGetCastsShadow((uint64_t)self->_node);
  self->_categoryBitMask = C3DNodeGetCategoryBitMask((uint64_t)self->_node);
  *((unsigned char *)self + 41) = ((C3DNodeGetMovability((uint64_t)self->_node) & 1) << 6) | *((unsigned char *)self + 41) & 0xBF;
  if (C3DNodeIsJoint((uint64_t)self->_node)) {
    char v8 = 8;
  }
  else {
    char v8 = 0;
  }
  *((unsigned char *)self + 41) = *((unsigned char *)self + 41) & 0xF7 | v8;
  if (C3DNodeGetHasPivot((uint64_t)self->_node)) {
    char v9 = 4;
  }
  else {
    char v9 = 0;
  }
  *((unsigned char *)self + 41) = *((unsigned char *)self + 41) & 0xFB | v9;
  [(SCNNode *)self _syncEntityObjCModel];
  if (v4) {
    C3DSceneUnlock(v4);
  }
}

- (void)_syncEntityObjCModel
{
  v3 = [(SCNNode *)self __CFObject];

  self->_name = (NSString *)(id)C3DEntityGetName((uint64_t)v3);
}

+ (SCNNode)nodeWithMDLObject:(id)a3 options:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  long long v6 = (SCNNode *)[a1 node];
  -[SCNNode setName:](v6, "setName:", [a3 name]);
  if ([a3 transform])
  {
    objc_msgSend((id)objc_msgSend(a3, "transform"), "matrix");
    v51[0] = v7;
    v51[1] = v8;
    v51[2] = v9;
    v51[3] = v10;
    [(SCNNode *)v6 setTransform:v51];
    [a3 transform];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v12 = (void *)[a3 transform];
    if (isKindOfClass)
    {
LABEL_5:
      uint64_t v13 = (void *)[v12 transformAnimation];
      if (v13)
      {
        uint64_t v14 = v13;
        [v13 duration];
        if (v15 != 0.0) {
          [(SCNNode *)v6 addAnimation:v14 forKey:@"transform"];
        }
      }
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = (void *)[a3 transform];
      goto LABEL_5;
    }
  }
LABEL_8:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v16 = (void *)[a3 submeshes];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      int v19 = 0;
      uint64_t v20 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v48 != v20) {
            objc_enumerationMutation(v16);
          }
          long long v22 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          if ([v22 faceIndexing] && objc_msgSend(v22, "geometryType") != 5) {
            return 0;
          }
          if ([v22 faceIndexing]) {
            ++v19;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v47 objects:v54 count:16];
        if (v18) {
          continue;
        }
        break;
      }
      if (v19 >= 2)
      {
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        obuint64_t j = (id)[a3 submeshes];
        uint64_t v31 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v44;
          do
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v44 != v33) {
                objc_enumerationMutation(obj);
              }
              uint64_t v35 = *(void *)(*((void *)&v43 + 1) + 8 * j);
              v36 = (void *)[a1 node];
              [v36 setName:objc_msgSend(NSString, "stringWithFormat:", @"%@_%d", objc_msgSend(a3, "name"), 0)];
              objc_msgSend(v36, "setGeometry:", +[SCNGeometry geometryWithMDLMesh:submesh:options:](SCNGeometry, "geometryWithMDLMesh:submesh:options:", a3, v35, a4));
              [(SCNNode *)v6 addChildNode:v36];
            }
            uint64_t v32 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
          }
          while (v32);
        }
        goto LABEL_29;
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SCNNode *)v6 setGeometry:+[SCNGeometry geometryWithMDLMesh:a3 options:a4]];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v23 = +[SCNLight lightWithMDLLight:a3];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(SCNNode *)v6 setCamera:+[SCNCamera cameraWithMDLCamera:a3]];
        }
        goto LABEL_29;
      }
      long long v23 = +[SCNLight lightWithMDLLightProbe:a3];
    }
    [(SCNNode *)v6 setLight:v23];
  }
LABEL_29:
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v24 = (void *)[a3 children];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = +[SCNNode nodeWithMDLObject:*(void *)(*((void *)&v39 + 1) + 8 * k) options:a4];
        if (v29) {
          [(SCNNode *)v6 addChildNode:v29];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v26);
  }
  return v6;
}

- (void)setName:(NSString *)name
{
  if (*((unsigned char *)self + 40))
  {
    long long v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNNode setName:]();
    }
  }
  else if ((unint64_t)name | (unint64_t)self->_name)
  {
    if ((-[NSString isEqual:](name, "isEqual:") & 1) == 0)
    {

      self->_name = (NSString *)[(NSString *)name copy];
      long long v5 = [(SCNNode *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __19__SCNNode_setName___block_invoke;
      v7[3] = &unk_264006160;
      v7[4] = self;
      v7[5] = name;
      +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
    }
  }
}

CFStringRef __19__SCNNode_setName___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  CFStringRef v3 = *(const __CFString **)(a1 + 40);

  return C3DEntitySetName(v2, v3);
}

- (void)addChildNode:(SCNNode *)child
{
  objc_sync_enter(self);
  [(SCNNode *)self insertObject:child inChildNodesAtIndex:[(SCNNode *)self countOfChildNodes]];

  objc_sync_exit(self);
}

- (unint64_t)countOfChildNodes
{
  return [(NSMutableArray *)self->_childNodes count];
}

- (void)__insertObject:(id)a3 inChildNodesAtIndex:(unint64_t)a4
{
  if (a3)
  {
    objc_sync_enter(self);
    if (!self->_childNodes) {
      self->_childNodes = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    }
    if ([(SCNNode *)self canAddChildNode:a3])
    {
      if ((SCNNode *)[a3 parentNode] != self)
      {
        id v7 = a3;
        [a3 removeFromParentNode];
        [a3 _setParent:self];
        [(NSMutableArray *)self->_childNodes insertObject:a3 atIndex:a4];
        if ((*((unsigned char *)a3 + 42) & 0x20) != 0) {
          [(SCNNode *)self _setHasFocusableChild];
        }
        if (a4) {
          uint64_t v8 = [(NSMutableArray *)self->_childNodes objectAtIndex:a4 - 1];
        }
        else {
          uint64_t v8 = 0;
        }
        long long v10 = [(SCNNode *)self sceneRef];
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __46__SCNNode___insertObject_inChildNodesAtIndex___block_invoke;
        v11[3] = &unk_264007B40;
        v11[4] = v8;
        v11[5] = self;
        v11[6] = a3;
        v11[7] = a4;
        +[SCNTransaction postCommandWithContext:v10 object:self applyBlock:v11];
        if (*((char *)self + 40) < 0) {
          [a3 _setPausedOrPausedByInheritance:1];
        }
      }
    }
    else
    {
      long long v9 = scn_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SCNNode __insertObject:inChildNodesAtIndex:]();
      }
    }
    objc_sync_exit(self);
  }
}

- (void)removeFromParentNode
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: error in removeFromParentNode : inconsistent tree", v2, v3, v4, v5, v6);
}

- (id)scene
{
  id result = [(SCNNode *)self sceneRef];
  if (result)
  {
    return C3DEntityGetObjCWrapper((id *)result);
  }
  return result;
}

- (BOOL)canAddChildNode:(id)a3
{
  for (BOOL i = self == 0; self; BOOL i = self == 0)
  {
    if (self == a3) {
      break;
    }
    self = [(SCNNode *)self parentNode];
  }
  return i;
}

- (SCNNode)parentNode
{
  if (*((unsigned char *)self + 40))
  {
    uint64_t v4 = [(SCNNode *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    uint64_t Parent = C3DNodeGetParent((uint64_t)self->_node);
    if (Parent)
    {
      uint64_t v3 = +[SCNNode nodeWithNodeRef:Parent];
      if (!v5) {
        return v3;
      }
    }
    else
    {
      uint64_t v3 = 0;
      if (!v5) {
        return v3;
      }
    }
    C3DSceneUnlock(v5);
    return v3;
  }
  return self->_parent;
}

- (void)_setParent:(id)a3
{
  self->_parent = (SCNNode *)a3;
}

- (void)setSimdTransform:(simd_float4x4)simdTransform
{
  if (*((unsigned char *)self + 40))
  {
    uint64_t v26 = scn_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[SCNNode(SIMD) setSimdTransform:]();
    }
  }
  else if ((*((unsigned char *)self + 41) & 2) == 0 {
         || (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32((float32x4_t)simdTransform.columns[1], *(float32x4_t *)&self->_anon_30[18]), (int8x16_t)vceqq_f32((float32x4_t)simdTransform.columns[0], *(float32x4_t *)&self->_anon_30[2])), vandq_s8((int8x16_t)vceqq_f32((float32x4_t)simdTransform.columns[2], *(float32x4_t *)&self->_anon_30[34]), (int8x16_t)vceqq_f32((float32x4_t)simdTransform.columns[3], *(float32x4_t *)&self->_anon_30[50])))) & 0x80000000) == 0)
  }
  {
    [(SCNNode *)self willChangeValueForKey:@"transform"];
    int32x4_t v4 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)simdTransform.columns[2], (int32x4_t)simdTransform.columns[2]), (int8x16_t)simdTransform.columns[2], 0xCuLL), vnegq_f32((float32x4_t)simdTransform.columns[1])), (float32x4_t)simdTransform.columns[2], (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)simdTransform.columns[1], (int32x4_t)simdTransform.columns[1]), (int8x16_t)simdTransform.columns[1], 0xCuLL));
    float32x4_t v5 = vmulq_f32((float32x4_t)simdTransform.columns[0], (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v4, v4), (int8x16_t)v4, 0xCuLL));
    BOOL v6 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), vaddq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1))).f32[0] < 0.0;
    float v7 = 1.0;
    float32x4_t v8 = vmulq_f32((float32x4_t)simdTransform.columns[0], (float32x4_t)simdTransform.columns[0]);
    float32x4_t v9 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1);
    if (v6) {
      float v7 = -1.0;
    }
    float32x4_t v10 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, v9));
    v10.f32[0] = sqrtf(v10.f32[0]);
    float32x4_t v11 = vmulq_f32((float32x4_t)simdTransform.columns[1], (float32x4_t)simdTransform.columns[1]);
    float32x4_t v12 = vmulq_f32((float32x4_t)simdTransform.columns[2], (float32x4_t)simdTransform.columns[2]);
    v10.i32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).f32[0]);
    v10.i32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1))).f32[0]);
    float32x4_t v13 = vmulq_n_f32(v10, v7);
    int32x4_t v14 = vcltzq_f32(v13);
    int32x4_t v15 = (int32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)v14, (int8x16_t)vcgezq_f32(v13)));
    v15.i32[3] = v15.i32[2];
    v15.i32[0] = vmaxvq_u32((uint32x4_t)v15);
    v14.i32[0] = -1;
    float32x4_t v16 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v15, v14), 0), (int8x16_t)v13, (int8x16_t)0);
    uint32x4_t v17 = (uint32x4_t)vceqzq_f32(v16);
    v17.i32[3] = v17.i32[2];
    if ((vmaxvq_u32(v17) & 0x80000000) != 0)
    {
      float32x4_t v16 = 0uLL;
      int8x16_t v27 = *(int8x16_t *)(MEMORY[0x263EF89A8] + 48);
      simd_float4 v22 = simdTransform.columns[3];
    }
    else
    {
      float32x4_t v18 = vdivq_f32((float32x4_t)simdTransform.columns[0], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 0));
      float32x4_t v19 = vdivq_f32((float32x4_t)simdTransform.columns[1], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1));
      int32x4_t v20 = (int32x4_t)vdivq_f32((float32x4_t)simdTransform.columns[2], (float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2));
      float v21 = *(float *)&v20.i32[2] + (float)(v18.f32[0] + v19.f32[1]);
      simd_float4 v22 = simdTransform.columns[3];
      if (v21 <= 0.0)
      {
        if (v18.f32[0] <= v19.f32[1] || v18.f32[0] <= *(float *)&v20.i32[2])
        {
          if (v19.f32[1] <= *(float *)&v20.i32[2])
          {
            float32_t v34 = (float)(*(float *)&v20.i32[2] + 1.0) - v18.f32[0];
            float32x4_t v35 = (float32x4_t)vzip2q_s32((int32x4_t)v18, vzip1q_s32(v20, (int32x4_t)v18));
            int8x16_t v36 = (int8x16_t)vrev64q_s32((int32x4_t)v19);
            float32x4_t v37 = (float32x4_t)vextq_s8(v36, v36, 8uLL);
            v37.i32[0] = v20.i32[0];
            v25.i64[0] = vaddq_f32(v35, v37).u64[0];
            v35.f32[2] = v34;
            float32x4_t v18 = vsubq_f32(v35, v37);
            v25.i64[1] = v18.i64[1];
            v20.i32[0] = v18.i32[2];
          }
          else
          {
            float32_t v29 = (float)(v19.f32[1] + 1.0) - v18.f32[0];
            float32x4_t v30 = v19;
            v30.i32[0] = v18.i32[1];
            v19.i32[1] = v20.i32[2];
            v19.i32[2] = v20.i32[1];
            int32x4_t v31 = (int32x4_t)vaddq_f32(v30, v19);
            v30.f32[1] = v29;
            v30.i32[3] = v20.i32[0];
            v19.i32[3] = v18.i32[2];
            float32x4_t v18 = vsubq_f32(v30, v19);
            float32x4_t v25 = (float32x4_t)vtrn2q_s32(vrev64q_s32(v31), (int32x4_t)v18);
            v20.i32[0] = v18.i32[1];
          }
        }
        else
        {
          float32x4_t v32 = v18;
          v32.f32[0] = (float)(v18.f32[0] + 1.0) - v19.f32[1];
          v32.i32[3] = v19.i32[2];
          float32x4_t v33 = (float32x4_t)vextq_s8((int8x16_t)v20, (int8x16_t)v20, 8uLL);
          int32x4_t v20 = (int32x4_t)vsubq_f32(v32, v33);
          v33.i32[1] = v19.i32[0];
          float32x4_t v25 = vaddq_f32(v18, v33);
          v25.i32[0] = v20.i32[0];
          v25.i32[3] = v20.i32[3];
        }
      }
      else
      {
        float32x4_t v23 = (float32x4_t)vzip2q_s32((int32x4_t)v19, vuzp1q_s32((int32x4_t)v19, v20));
        v23.i32[2] = v18.i32[1];
        float32x4_t v24 = (float32x4_t)vtrn2q_s32(v20, vzip2q_s32(v20, (int32x4_t)v18));
        v24.i32[2] = v19.i32[0];
        float32x4_t v25 = vsubq_f32(v23, v24);
        v24.i32[3] = 1.0;
        v23.f32[3] = v21;
        float32x4_t v18 = vaddq_f32(v23, v24);
        v25.i32[3] = v18.i32[3];
        v20.i32[0] = v18.i32[3];
      }
      v18.i32[0] = 0;
      float32x4_t v38 = vmulq_n_f32(v25, 0.5 / sqrtf(*(float *)v20.i32));
      int32x4_t v39 = (int32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v38), (int8x16_t)vcgezq_f32(v38)));
      v39.i32[0] = vmaxvq_u32((uint32x4_t)v39);
      int8x16_t v27 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32((int32x4_t)v18, v39), 0), *(int8x16_t *)(MEMORY[0x263EF89A8] + 48), (int8x16_t)v38);
    }
    *(simd_float4 *)&self->_position[2] = v22;
    *(int8x16_t *)&self->_anon_80[2] = v27;
    *(float32x4_t *)&self->_scale[2] = v16;
    char v40 = *((unsigned char *)self + 41) & 0xCF;
    *(simd_float4 *)&self->_anon_30[2] = simdTransform.columns[0];
    *(simd_float4 *)&self->_anon_30[18] = simdTransform.columns[1];
    *(simd_float4 *)&self->_anon_30[34] = simdTransform.columns[2];
    *(simd_float4 *)&self->_anon_30[50] = v22;
    *((unsigned char *)self + 41) = v40 | 0x23;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", [(SCNNode *)self sceneRef], self, @"transform");
    if ((*((_WORD *)self + 22) & 0x100) != 0) {
      objc_msgSend(-[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 8), "resetTransform");
    }
    [(SCNNode *)self didChangeValueForKey:@"transform"];
  }
}

+ (SCNNode)node
{
  id v2 = objc_alloc_init((Class)a1);

  return (SCNNode *)v2;
}

- (SCNNode)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCNNode;
  id v2 = [(SCNNode *)&v5 init];
  if (v2)
  {
    uint64_t v3 = C3DNodeCreate();
    v2->_node = (__C3DNode *)v3;
    if (v3) {
      C3DEntitySetObjCWrapper(v3, v2);
    }
    *((unsigned char *)v2 + 40) |= 0x3Eu;
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    v2->_valueForKeyLock._os_unfair_lock_opaque = 0;
    [(SCNNode *)v2 _syncObjCModel];
  }
  return v2;
}

- (void)setTransform:(SCNMatrix4 *)transform
{
}

void __34__SCNNode_SIMD__setSimdTransform___block_invoke_2(__n128 *a1)
{
  C3DNodeSetPosition(*(void *)(a1[5].n128_u64[0] + 8), a1[2]);
  C3DNodeSetQuaternion(*(float32x4_t **)(a1[5].n128_u64[0] + 8), a1[3]);
  id v2 = *(float32x4_t **)(a1[5].n128_u64[0] + 8);
  __n128 v3 = a1[4];

  C3DNodeSetScale(v2, v3);
}

- (SCNNode)clone
{
  id v3 = [(SCNNode *)self _copyRecursively];
  _transposeSkinnerToClone(v3, self, v3);
  _copyAnimations(self, v3);

  return (SCNNode *)v3;
}

- (NSArray)actionKeys
{
  return (NSArray *)[(SCNOrderedDictionary *)self->_actions allKeys];
}

- (id)_copyRecursively
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  *((unsigned char *)self + 42) |= 4u;
  id v3 = [(SCNNode *)self copy];
  *((unsigned char *)self + 42) &= ~4u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int32x4_t v4 = [(SCNNode *)self childNodes];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        float32x4_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 isGizmo] & 1) == 0)
        {
          float32x4_t v10 = (void *)[v9 _copyRecursively];
          [v3 addChildNode:v10];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)copy
{
  return [(SCNNode *)self copyWithZone:0];
}

- (void)_copyAnimationsFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend(a3, "animationKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        float32x4_t v11 = objc_msgSend((id)objc_msgSend(a3, "animationPlayerForKey:", v10), "copy");
        [(SCNNode *)self addAnimationPlayer:v11 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (NSArray)animationKeys
{
  p_animationsLocuint64_t k = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  int32x4_t v4 = [(SCNOrderedDictionary *)self->_animations allKeys];
  os_unfair_lock_unlock(p_animationsLock);
  if ([(NSArray *)v4 count]) {
    return v4;
  }
  else {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init((Class)objc_opt_class());
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  objc_msgSend(v4, "setName:", -[SCNNode name](self, "name"));
  objc_msgSend(v4, "setIdentifier:", -[SCNNode identifier](self, "identifier"));
  char v5 = *((unsigned char *)self + 41);
  [(SCNNode *)self simdTransform];
  objc_msgSend(v4, "setSimdTransform:");
  if (v5)
  {
    [(SCNNode *)self simdScale];
    objc_msgSend(v4, "setSimdScale:");
    int v6 = (*((unsigned __int8 *)self + 41) >> 4) & 3;
    switch(v6)
    {
      case 2:
        [(SCNNode *)self simdOrientation];
        objc_msgSend(v4, "setSimdOrientation:");
        break;
      case 1:
        [(SCNNode *)self simdRotation];
        objc_msgSend(v4, "setSimdRotation:");
        break;
      case 0:
        [(SCNNode *)self simdEulerAngles];
        objc_msgSend(v4, "setSimdEulerAngles:");
        break;
    }
  }
  if ((*((unsigned char *)self + 41) & 4) != 0)
  {
    [(SCNNode *)self simdPivot];
    objc_msgSend(v4, "setSimdPivot:");
  }
  objc_msgSend(v4, "setHidden:", -[SCNNode isHidden](self, "isHidden"));
  [(SCNNode *)self opacity];
  objc_msgSend(v4, "setOpacity:");
  objc_msgSend(v4, "setRenderingOrder:", -[SCNNode renderingOrder](self, "renderingOrder"));
  objc_msgSend(v4, "setCategoryBitMask:", -[SCNNode categoryBitMask](self, "categoryBitMask"));
  objc_msgSend(v4, "setMovabilityHint:", -[SCNNode movabilityHint](self, "movabilityHint"));
  BOOL v7 = [(NSString *)[(SCNLight *)[(SCNNode *)self light] type] isEqualToString:@"probe"];
  uint64_t v8 = [(SCNNode *)self light];
  if (v7)
  {
    id v9 = [(SCNLight *)v8 copy];
    [v4 setLight:v9];
  }
  else
  {
    [v4 setLight:v8];
  }
  objc_msgSend(v4, "setCamera:", -[SCNNode camera](self, "camera"));
  objc_msgSend(v4, "setRendererDelegate:", -[SCNNode rendererDelegate](self, "rendererDelegate"));
  objc_msgSend(v4, "setPhysicsField:", -[SCNPhysicsField copy](-[SCNNode physicsField](self, "physicsField"), "copy"));
  objc_msgSend(v4, "setCastsShadow:", -[SCNNode castsShadow](self, "castsShadow"));
  objc_msgSend(v4, "setUsesDepthPrePass:", -[SCNNode usesDepthPrePass](self, "usesDepthPrePass"));
  objc_msgSend(v4, "setConstraints:", -[SCNNode constraints](self, "constraints"));
  objc_msgSend(v4, "setPostMorphingDeformers:", -[SCNNode postMorphingDeformers](self, "postMorphingDeformers"));
  objc_msgSend(v4, "setPostSkinningDeformers:", -[SCNNode postSkinningDeformers](self, "postSkinningDeformers"));
  objc_msgSend(v4, "setAuthoringEnvironmentNode:", -[SCNNode authoringEnvironmentNode](self, "authoringEnvironmentNode"));
  objc_msgSend(v4, "setFocusBehavior:", -[SCNNode focusBehavior](self, "focusBehavior"));
  if ([(SCNNode *)self authoringEnvironmentNode]
    && [(SCNNode *)self authoringEnvironmentCompanionNode])
  {
    objc_msgSend(v4, "setAuthoringEnvironmentCompanionNode:", -[SCNNode authoringEnvironmentCompanionNode](self, "authoringEnvironmentCompanionNode"));
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v10 = [(SCNNode *)self particleSystems];
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        [v4 addParticleSystem:*(void *)(*((void *)&v27 + 1) + 8 * i)];
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v12);
  }
  objc_msgSend(v4, "setGizmo:", -[SCNNode isGizmo](self, "isGizmo"));
  os_unfair_lock_lock(&self->_valueForKeyLock);
  valueForKey = self->_valueForKey;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __24__SCNNode_copyWithZone___block_invoke;
  v26[3] = &unk_264006110;
  v26[4] = v4;
  [(NSMutableDictionary *)valueForKey enumerateKeysAndObjectsUsingBlock:v26];
  os_unfair_lock_unlock(&self->_valueForKeyLock);
  if ((*((unsigned char *)self + 42) & 4) == 0)
  {
    [v4 _copyAnimationsFrom:self];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    float32x4_t v16 = [(SCNNode *)self actionKeys];
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(v4, "runAction:forKey:", -[SCNNode actionForKey:](self, "actionForKey:", *(void *)(*((void *)&v22 + 1) + 8 * j)), *(void *)(*((void *)&v22 + 1) + 8 * j));
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v22 objects:v31 count:16];
      }
      while (v18);
    }
  }
  +[SCNTransaction commitImmediate];
  objc_msgSend(v4, "setGeometry:", -[SCNNode geometry](self, "geometry"));
  objc_msgSend(v4, "setMorpher:", -[SCNMorpher copy](-[SCNNode morpher](self, "morpher"), "copy"));
  objc_msgSend(v4, "setSkinner:", -[SCNSkinner copy](-[SCNNode skinner](self, "skinner"), "copy"));
  objc_msgSend(v4, "setPhysicsBody:", -[SCNPhysicsBody copy](-[SCNNode physicsBody](self, "physicsBody"), "copy"));
  return v4;
}

- (void)setGeometry:(SCNGeometry *)geometry
{
  if ([(SCNNode *)self geometry] != geometry)
  {
    [(SCNNode *)self _setComponent:geometry withType:2];
    char v5 = [(SCNNode *)self skinner];
    if (v5) {
      [(SCNSkinner *)v5 _setBaseGeometry:geometry];
    }
    int v6 = [(SCNNode *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __23__SCNNode_setGeometry___block_invoke;
    v9[3] = &unk_264006160;
    v9[4] = self;
    v9[5] = geometry;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v9];
    BOOL v7 = [(SCNNode *)self physicsBody];
    if (v7)
    {
      uint64_t v8 = v7;
      if (![(SCNPhysicsBody *)v7 physicsShape]) {
        [(SCNPhysicsBody *)v8 setPhysicsShape:+[SCNPhysicsShape shapeWithGeometry:geometry options:0]];
      }
    }
  }
}

- (id)__geometry
{
  id v3 = [(SCNNode *)self _findComponentWithType:2];
  id v4 = v3;
  if ((*((unsigned char *)self + 40) & 4) == 0 && !v3)
  {
    *((unsigned char *)self + 40) |= 4u;
    char v5 = [(SCNNode *)self sceneRef];
    uint64_t v6 = (uint64_t)v5;
    if (v5) {
      C3DSceneLock((uint64_t)v5);
    }
    uint64_t Geometry = C3DNodeGetGeometry((uint64_t)self->_node);
    if (Geometry)
    {
      id v4 = +[SCNGeometry geometryWithGeometryRef:Geometry];
      [(SCNNode *)self _setComponent:v4 withType:2];
      if (!v6) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    id v4 = 0;
    if (v6) {
LABEL_7:
    }
      C3DSceneUnlock(v6);
  }
LABEL_8:
  if ((*((unsigned char *)self + 40) & 1) == 0) {
    return v4;
  }

  return [(SCNGeometry *)v4 presentationGeometry];
}

- (id)_findComponentWithType:(int64_t)a3
{
  if ((((*((_WORD *)self + 22) & 0x1FFFu) >> a3) & 1) == 0) {
    return 0;
  }
  components = self->_components;
  if (!components) {
    return 0;
  }
  while ([(SCNNodeComponent *)components type] != a3)
  {
    components = [(SCNNodeComponent *)components next];
    if (!components) {
      return 0;
    }
  }

  return [(SCNNodeComponent *)components component];
}

- (id)__skinner
{
  id v3 = [(SCNNode *)self _findComponentWithType:3];
  id v4 = v3;
  if ((*((unsigned char *)self + 40) & 0x10) == 0 && !v3)
  {
    char v5 = [(SCNNode *)self sceneRef];
    uint64_t v6 = (uint64_t)v5;
    if (v5) {
      C3DSceneLock((uint64_t)v5);
    }
    *((unsigned char *)self + 40) |= 0x10u;
    uint64_t Skinner = C3DNodeGetSkinner((uint64_t)self->_node);
    if (!Skinner)
    {
      id v4 = 0;
      if (!v6) {
        return v4;
      }
      goto LABEL_9;
    }
    id v4 = +[SCNSkinner skinnerWithSkinnerRef:Skinner];
    if ([(SCNNode *)self geometry]) {
      [(SCNSkinner *)v4 _setBaseGeometry:[(SCNNode *)self geometry]];
    }
    [(SCNNode *)self _setComponent:v4 withType:3];
    if (v6) {
LABEL_9:
    }
      C3DSceneUnlock(v6);
  }
  return v4;
}

- (SCNPhysicsBody)physicsBody
{
  return (SCNPhysicsBody *)[(SCNNode *)self _findComponentWithType:8];
}

- (void)_setComponent:(id)a3 withType:(int64_t)a4
{
  if (a3) {
    [(SCNNode *)self _assignComponent:a3 toContainerWithType:a4];
  }
  else {
    [(SCNNode *)self _removeComponentWithType:a4];
  }
}

- (void)_assignComponent:(id)a3 toContainerWithType:(int64_t)a4
{
  int v7 = 1 << a4;
  if ((*((_WORD *)self + 22) & (unsigned __int16)(1 << a4) & 0x1FFF) != 0 && (components = self->_components) != 0)
  {
    while ([(SCNNodeComponent *)components type] != a4)
    {
      components = [(SCNNodeComponent *)components next];
      if (!components) {
        goto LABEL_5;
      }
    }
    [(SCNNodeComponent *)components setComponent:a3];
  }
  else
  {
LABEL_5:
    id v9 = off_264003A50;
    if (a4 != 10) {
      id v9 = off_264003A48;
    }
    uint64_t v10 = (SCNNodeComponent *)[objc_alloc(*v9) initWithType:a4 component:a3];
    [(SCNNodeComponent *)v10 setNext:self->_components];

    self->_components = v10;
    *((_WORD *)self + 22) |= v7 & 0x1FFF;
  }
}

- (void)setHidden:(BOOL)hidden
{
  if (*((unsigned char *)self + 40))
  {
    uint64_t v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNNode setHidden:]();
    }
  }
  else
  {
    unsigned int v5 = *((unsigned __int8 *)self + 41);
    if (hidden != v5 >> 7)
    {
      if (hidden) {
        char v6 = 0x80;
      }
      else {
        char v6 = 0;
      }
      *((unsigned char *)self + 41) = v6 & 0x80 | v5 & 0x7F;
      int v7 = [(SCNNode *)self sceneRef];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __21__SCNNode_setHidden___block_invoke;
      v9[3] = &unk_264004FE8;
      v9[4] = self;
      BOOL v10 = hidden;
      +[SCNTransaction postCommandWithContext:v7 object:self key:@"hidden" applyBlock:v9];
    }
  }
}

- (id)__light
{
  id v3 = [(SCNNode *)self _findComponentWithType:0];
  id v4 = v3;
  if ((*((unsigned char *)self + 40) & 2) == 0 && !v3)
  {
    unsigned int v5 = [(SCNNode *)self sceneRef];
    uint64_t v6 = (uint64_t)v5;
    if (v5) {
      C3DSceneLock((uint64_t)v5);
    }
    *((unsigned char *)self + 40) |= 2u;
    CFDictionaryRef Light = C3DNodeGetLight((uint64_t)self->_node);
    if (Light)
    {
      id v4 = +[SCNLight lightWithLightRef:Light];
      [(SCNNode *)self _setComponent:v4 withType:0];
      if (!v6) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    id v4 = 0;
    if (v6) {
LABEL_7:
    }
      C3DSceneUnlock(v6);
  }
LABEL_8:
  if ((*((unsigned char *)self + 40) & 1) == 0) {
    return v4;
  }

  return [(SCNLight *)v4 presentationLight];
}

- (BOOL)authoringEnvironmentNode
{
  return (*((unsigned __int8 *)self + 42) >> 6) & 1;
}

- (simd_float4x4)simdTransform
{
  if (*((unsigned char *)self + 40))
  {
    int v7 = [(SCNNode *)self sceneRef];
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      C3DSceneLock((uint64_t)v7);
      simd_float4 v11 = 0u;
      simd_float4 v12 = 0u;
      simd_float4 v9 = 0u;
      simd_float4 v10 = 0u;
      C3DNodeGetMatrix((uint64_t)self->_node, (uint64_t)&v9);
      C3DSceneUnlock(v8);
    }
    else
    {
      simd_float4 v11 = 0u;
      simd_float4 v12 = 0u;
      simd_float4 v9 = 0u;
      simd_float4 v10 = 0u;
      C3DNodeGetMatrix((uint64_t)self->_node, (uint64_t)&v9);
    }
    simd_float4 v3 = v9;
    simd_float4 v4 = v10;
    simd_float4 v5 = v11;
    simd_float4 v6 = v12;
  }
  else
  {
    if ((*((unsigned char *)self + 41) & 2) == 0) {
      [(SCNNode *)self _updateTransform];
    }
    simd_float4 v3 = *(simd_float4 *)&self->_anon_30[2];
    simd_float4 v4 = *(simd_float4 *)&self->_anon_30[18];
    simd_float4 v5 = *(simd_float4 *)&self->_anon_30[34];
    simd_float4 v6 = *(simd_float4 *)&self->_anon_30[50];
  }
  result.columns[3] = v6;
  result.columns[2] = v5;
  result.columns[1] = v4;
  result.columns[0] = v3;
  return result;
}

- (void)setOpacity:(CGFloat)opacity
{
  if (*((unsigned char *)self + 40))
  {
    int v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNNode setOpacity:]();
    }
  }
  else
  {
    if (opacity > 1.0) {
      opacity = 1.0;
    }
    double v4 = fmax(opacity, 0.0);
    if (v4 != self->_opacity)
    {
      float v5 = v4;
      self->_opacity = v5;
      simd_float4 v6 = [(SCNNode *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __22__SCNNode_setOpacity___block_invoke;
      v8[3] = &unk_264004FC0;
      v8[4] = self;
      *(double *)&v8[5] = v4;
      +[SCNTransaction postCommandWithContext:v6 object:self key:@"opacity" applyBlock:v8];
    }
  }
}

- (id)postSkinningDeformers
{
  return [(SCNNode *)self _findComponentWithType:12];
}

- (id)postMorphingDeformers
{
  return [(SCNNode *)self _findComponentWithType:11];
}

- (SCNPhysicsField)physicsField
{
  return (SCNPhysicsField *)[(SCNNode *)self _findComponentWithType:9];
}

- (id)__morpher
{
  simd_float4 v3 = [(SCNNode *)self _findComponentWithType:4];
  double v4 = v3;
  if ((*((unsigned char *)self + 40) & 0x20) == 0 && !v3)
  {
    float v5 = [(SCNNode *)self sceneRef];
    uint64_t v6 = (uint64_t)v5;
    if (v5) {
      C3DSceneLock((uint64_t)v5);
    }
    *((unsigned char *)self + 40) |= 0x20u;
    uint64_t Morpher = C3DNodeGetMorpher((uint64_t)self->_node);
    if (Morpher)
    {
      double v4 = +[SCNMorpher morpherWithMorphRef:C3DGeometryGetOverrideMaterial(Morpher)];
      [(SCNNode *)self _setComponent:v4 withType:4];
      if (!v6) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    double v4 = 0;
    if (v6) {
LABEL_7:
    }
      C3DSceneUnlock(v6);
  }
LABEL_8:
  if ((*((unsigned char *)self + 40) & 1) == 0) {
    return v4;
  }

  return [(SCNMorpher *)v4 presentationInstance];
}

- (void)setCamera:(SCNCamera *)camera
{
  if ([(SCNNode *)self camera] != camera)
  {
    [(SCNNode *)self _setComponent:camera withType:1];
    float v5 = [(SCNNode *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __21__SCNNode_setCamera___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    v6[5] = camera;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

- (id)__camera
{
  simd_float4 v3 = [(SCNNode *)self _findComponentWithType:1];
  double v4 = v3;
  if ((*((unsigned char *)self + 40) & 8) == 0 && !v3)
  {
    float v5 = [(SCNNode *)self sceneRef];
    uint64_t v6 = (uint64_t)v5;
    if (v5) {
      C3DSceneLock((uint64_t)v5);
    }
    *((unsigned char *)self + 40) |= 8u;
    CFDictionaryRef Camera = C3DNodeGetCamera((uint64_t)self->_node);
    if (Camera)
    {
      double v4 = +[SCNCamera cameraWithCameraRef:Camera];
      [(SCNNode *)self _setComponent:v4 withType:1];
      if (!v6) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    double v4 = 0;
    if (v6) {
LABEL_7:
    }
      C3DSceneUnlock(v6);
  }
LABEL_8:
  if ((*((unsigned char *)self + 40) & 1) == 0) {
    return v4;
  }

  return [(SCNCamera *)v4 presentationCamera];
}

- (BOOL)usesDepthPrePass
{
  if (*((unsigned char *)self + 40))
  {
    double v4 = [(SCNNode *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      char UsesDepthPrePass = C3DNodeGetUsesDepthPrePass((uint64_t)self->_node);
      C3DSceneUnlock(v5);
      LOBYTE(v3) = UsesDepthPrePass;
    }
    else
    {
      node = self->_node;
      LOBYTE(v3) = C3DNodeGetUsesDepthPrePass((uint64_t)node);
    }
  }
  else
  {
    return (*((unsigned __int8 *)self + 42) >> 1) & 1;
  }
  return v3;
}

- (void)setUsesDepthPrePass:(BOOL)a3
{
  if (*((unsigned char *)self + 40))
  {
    uint64_t v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNNode setUsesDepthPrePass:]();
    }
  }
  else
  {
    char v5 = *((unsigned char *)self + 42);
    if (((((v5 & 2) == 0) ^ a3) & 1) == 0)
    {
      if (a3) {
        char v6 = 2;
      }
      else {
        char v6 = 0;
      }
      *((unsigned char *)self + 42) = v5 & 0xFD | v6;
      int v7 = [(SCNNode *)self sceneRef];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __31__SCNNode_setUsesDepthPrePass___block_invoke;
      v9[3] = &unk_264004FE8;
      v9[4] = self;
      BOOL v10 = a3;
      +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v9];
    }
  }
}

- (void)setSkinner:(SCNSkinner *)skinner
{
  if ([(SCNNode *)self skinner] != skinner)
  {
    if ([(SCNNode *)self geometry]) {
      [(SCNSkinner *)skinner _setBaseGeometry:[(SCNNode *)self geometry]];
    }
    [(SCNNode *)self _setComponent:skinner withType:3];
    char v5 = [(SCNNode *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __22__SCNNode_setSkinner___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    v6[5] = skinner;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

- (void)setRenderingOrder:(NSInteger)renderingOrder
{
  if (*((unsigned char *)self + 40))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNNode setRenderingOrder:]();
    }
  }
  else if (self->_renderingOrder != renderingOrder)
  {
    self->_renderingOrder = renderingOrder;
    char v5 = [(SCNNode *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __29__SCNNode_setRenderingOrder___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = renderingOrder;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

- (void)setRendererDelegate:(id)rendererDelegate
{
  if (self->_rendererDelegate != rendererDelegate)
  {
    if (objc_opt_respondsToSelector())
    {
      self->_rendererDelegate = rendererDelegate;
      char v5 = (void *)C3DRendererDelegateCreate((uint64_t)_rendererCallback, 0, (uint64_t)self);
    }
    else
    {
      char v5 = 0;
      self->_rendererDelegate = 0;
    }
    char v6 = [(SCNNode *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __31__SCNNode_setRendererDelegate___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    v7[5] = v5;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

- (void)setPostSkinningDeformers:(id)a3
{
  if ([(SCNNode *)self postSkinningDeformers] != a3)
  {
    char v5 = (void *)[a3 copy];
    [(SCNNode *)self _setComponent:v5 withType:12];
    char v6 = [(SCNNode *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__SCNNode_setPostSkinningDeformers___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    v7[5] = v5;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

- (void)setPostMorphingDeformers:(id)a3
{
  if ([(SCNNode *)self postMorphingDeformers] != a3)
  {
    char v5 = (void *)[a3 copy];
    [(SCNNode *)self _setComponent:v5 withType:11];
    char v6 = [(SCNNode *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__SCNNode_setPostMorphingDeformers___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    v7[5] = v5;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

- (void)setPhysicsField:(SCNPhysicsField *)physicsField
{
  char v5 = [(SCNNode *)self physicsField];
  if (v5 != physicsField)
  {
    char v6 = v5;
    if (v5)
    {
      int v7 = v5;
      [(SCNNode *)self _removeComponentWithType:9];
    }
    if (physicsField) {
      [(SCNNode *)self _assignComponent:physicsField toContainerWithType:9];
    }
    uint64_t v8 = [(SCNNode *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __27__SCNNode_setPhysicsField___block_invoke;
    v9[3] = &unk_264006138;
    v9[4] = v6;
    void v9[5] = physicsField;
    void v9[6] = self;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v9];
  }
}

- (void)setPhysicsBody:(SCNPhysicsBody *)physicsBody
{
  char v5 = [(SCNNode *)self physicsBody];
  if (v5 != physicsBody)
  {
    char v6 = v5;
    if (v5)
    {
      if ([(SCNPhysicsBody *)v5 _owner] != self)
      {
        int v7 = scn_default_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[SCNNode setPhysicsBody:](v6);
        }
      }
      [(SCNPhysicsBody *)v6 _removeOwner];
      [(SCNNode *)self _removeComponentWithType:8];
    }
    if (physicsBody)
    {
      if ([(SCNPhysicsBody *)physicsBody _owner])
      {
        uint64_t v8 = scn_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[SCNNode setPhysicsBody:](physicsBody);
        }
      }
      [(SCNNode *)self _assignComponent:physicsBody toContainerWithType:8];
      [(SCNPhysicsBody *)physicsBody _setOwner:self];
      [(SCNPhysicsBody *)physicsBody resetTransform];
    }
  }
}

- (void)setMovabilityHint:(SCNMovabilityHint)movabilityHint
{
  if (*((unsigned char *)self + 40))
  {
    int v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNNode setMovabilityHint:]();
    }
  }
  else
  {
    unint64_t v5 = *((unsigned __int8 *)self + 41);
    if (((v5 >> 6) & 1) != movabilityHint)
    {
      *((unsigned char *)self + 41) = v5 & 0xBF | ((movabilityHint & 1) << 6);
      char v6 = [(SCNNode *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __29__SCNNode_setMovabilityHint___block_invoke;
      v8[3] = &unk_264004FC0;
      v8[4] = self;
      v8[5] = movabilityHint;
      +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v8];
    }
  }
}

- (void)setMorpher:(SCNMorpher *)morpher
{
  if ([(SCNNode *)self morpher] != morpher)
  {
    [(SCNNode *)self _setComponent:morpher withType:4];
    unint64_t v5 = [(SCNNode *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __22__SCNNode_setMorpher___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = morpher;
    v6[5] = self;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

- (void)setLight:(SCNLight *)light
{
  if ([(SCNNode *)self light] != light)
  {
    [(SCNNode *)self _setComponent:light withType:0];
    unint64_t v5 = [(SCNNode *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __20__SCNNode_setLight___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    v6[5] = light;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

- (void)setIdentifier:(id)a3
{
  double v4 = [(SCNNode *)self __CFObject];

  C3DEntitySetID((uint64_t)v4, a3);
}

- (void)setGizmo:(BOOL)a3
{
}

- (void)setFocusBehavior:(SCNNodeFocusBehavior)focusBehavior
{
  unint64_t v3 = *((unsigned __int8 *)self + 42);
  if (((v3 >> 3) & 3) != focusBehavior)
  {
    char v4 = v3 & 0xE7 | (8 * (focusBehavior & 3));
    *((unsigned char *)self + 42) = v4;
    if ((focusBehavior & 3) != 0)
    {
      *((unsigned char *)self + 42) = v4 | 0x20;
      [(SCNNode *)self->_parent _setHasFocusableChild];
    }
    else
    {
      [(SCNNode *)self _updateFocusableCache];
    }
  }
}

- (void)setConstraints:(NSArray *)constraints
{
  unint64_t v5 = [(SCNNode *)self _findComponentWithType:7];
  if (v5 != constraints)
  {
    if (v5) {
      [(SCNNode *)self _removeComponentWithType:7];
    }
    if (constraints) {
      [(SCNNode *)self _assignComponent:(id)[(NSArray *)constraints mutableCopy] toContainerWithType:7];
    }
    char v6 = [(SCNNode *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __26__SCNNode_setConstraints___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = constraints;
    v7[5] = self;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

- (void)setCategoryBitMask:(NSUInteger)categoryBitMask
{
  if (*((unsigned char *)self + 40))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNNode setCategoryBitMask:]();
    }
  }
  else if (self->_categoryBitMask != categoryBitMask)
  {
    self->_categoryBitMasuint64_t k = categoryBitMask;
    unint64_t v5 = [(SCNNode *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __30__SCNNode_setCategoryBitMask___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = categoryBitMask;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

- (void)setCastsShadow:(BOOL)castsShadow
{
  if (*((unsigned char *)self + 40))
  {
    int v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNNode setCastsShadow:]();
    }
  }
  else
  {
    char v5 = *((unsigned char *)self + 42);
    if (((((v5 & 1) == 0) ^ castsShadow) & 1) == 0)
    {
      *((unsigned char *)self + 42) = v5 & 0xFE | castsShadow;
      char v6 = [(SCNNode *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __26__SCNNode_setCastsShadow___block_invoke;
      v8[3] = &unk_264004FE8;
      v8[4] = self;
      BOOL v9 = castsShadow;
      +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v8];
    }
  }
}

- (void)setAuthoringEnvironmentNode:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 42) = *((unsigned char *)self + 42) & 0xBF | v3;
  if (a3) {
    [(SCNNode *)self setCastsShadow:0];
  }
}

- (NSInteger)renderingOrder
{
  if ((*((unsigned char *)self + 40) & 1) == 0) {
    return self->_renderingOrder;
  }
  char v4 = [(SCNNode *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    CFDictionaryRef RenderingOrder = C3DNodeGetRenderingOrder((uint64_t)self->_node);
    C3DSceneUnlock(v5);
    return (NSInteger)RenderingOrder;
  }
  else
  {
    node = self->_node;
    return (NSInteger)C3DNodeGetRenderingOrder((uint64_t)node);
  }
}

- (id)rendererDelegate
{
  return self->_rendererDelegate;
}

- (NSArray)particleSystems
{
  id v2 = objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "copy");

  return (NSArray *)v2;
}

- (CGFloat)opacity
{
  if (*((unsigned char *)self + 40))
  {
    char v4 = [(SCNNode *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float Opacity = C3DNodeGetOpacity((uint64_t)self->_node);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DNodeGetOpacity((uint64_t)self->_node);
    }
  }
  else
  {
    return self->_opacity;
  }
  return Opacity;
}

- (SCNMovabilityHint)movabilityHint
{
  if ((*((unsigned char *)self + 40) & 1) == 0) {
    return ((unint64_t)*((unsigned __int8 *)self + 41) >> 6) & 1;
  }
  char v4 = [(SCNNode *)self sceneRef];
  if (!v4) {
    return (uint64_t)(int)C3DNodeGetMovability((uint64_t)self->_node);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  SCNMovabilityHint Movability = (int)C3DNodeGetMovability((uint64_t)self->_node);
  C3DSceneUnlock(v5);
  return Movability;
}

- (BOOL)isHidden
{
  if (*((unsigned char *)self + 40))
  {
    char v4 = [(SCNNode *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      char IsHidden = C3DNodeIsHidden((uint64_t)self->_node);
      C3DSceneUnlock(v5);
      LOBYTE(v3) = IsHidden;
    }
    else
    {
      node = self->_node;
      LOBYTE(v3) = C3DNodeIsHidden((uint64_t)node);
    }
  }
  else
  {
    return *((unsigned __int8 *)self + 41) >> 7;
  }
  return v3;
}

- (BOOL)isGizmo
{
  return C3DNodeIsGizmo((uint64_t)self->_node);
}

- (id)identifier
{
  id v2 = [(SCNNode *)self __CFObject];

  return (id)C3DEntityGetID((uint64_t)v2);
}

- (SCNNodeFocusBehavior)focusBehavior
{
  return ((unint64_t)*((unsigned __int8 *)self + 42) >> 3) & 3;
}

- (NSArray)constraints
{
  id v2 = objc_msgSend(-[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 7), "copy");

  return (NSArray *)v2;
}

- (NSUInteger)categoryBitMask
{
  if ((*((unsigned char *)self + 40) & 1) == 0) {
    return self->_categoryBitMask;
  }
  char v4 = [(SCNNode *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    CategoryBitMasuint64_t k = C3DNodeGetCategoryBitMask((uint64_t)self->_node);
    C3DSceneUnlock(v5);
    return CategoryBitMask;
  }
  else
  {
    node = self->_node;
    return C3DNodeGetCategoryBitMask((uint64_t)node);
  }
}

- (BOOL)castsShadow
{
  if ((*((unsigned char *)self + 40) & 1) == 0) {
    return *((unsigned char *)self + 42) & 1;
  }
  char v4 = [(SCNNode *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    char CastsShadow = C3DNodeGetCastsShadow((uint64_t)self->_node);
    C3DSceneUnlock(v5);
    return CastsShadow;
  }
  else
  {
    node = self->_node;
    return C3DNodeGetCastsShadow((uint64_t)node);
  }
}

- (id)_particleSystems
{
  return [(SCNNode *)self _findComponentWithType:6];
}

uint64_t __46__SCNNode___insertObject_inChildNodesAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) nodeRef];
  uint64_t v3 = *(void *)(a1 + 56);
  if (!v3)
  {
    int v7 = *(void **)(a1 + 48);
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v9 = (float32x4_t *)[v7 nodeRef];
    uint64_t v10 = v8;
    uint64_t v11 = 0;
    goto LABEL_10;
  }
  uint64_t ChildNodeAtIndex = v2;
  if (v2)
  {
    uint64_t Parent = C3DNodeGetParent(v2);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Parent == v6)
    {
      BOOL v9 = (float32x4_t *)[*(id *)(a1 + 48) nodeRef];
      uint64_t v10 = Parent;
      goto LABEL_9;
    }
    uint64_t v3 = *(void *)(a1 + 56);
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  uint64_t ChildNodeAtIndex = C3DNodeGetChildNodeAtIndex(v6, (int)v3 - 1);
  simd_float4 v12 = *(void **)(a1 + 48);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v9 = (float32x4_t *)[v12 nodeRef];
  uint64_t v10 = v13;
LABEL_9:
  uint64_t v11 = ChildNodeAtIndex;
LABEL_10:

  return C3DNodeInsertChildNodeAfterChild(v10, v9, v11);
}

- (__C3DNode)nodeRef
{
  return *(__C3DNode **)(v0 + 8);
}

+ (SCNNode)nodeWithMDLObject:(MDLObject *)mdlObject
{
  return (SCNNode *)[a1 nodeWithMDLObject:mdlObject options:0];
}

- (void)setPosition:(SCNVector3)position
{
  float y = position.y;
  [(SCNNode *)self setSimdPosition:*(double *)&position.x];
}

- (BOOL)isPresentationInstance
{
  return *((unsigned char *)self + 40) & 1;
}

- (SCNVector3)convertVector:(SCNVector3)vector fromNode:(SCNNode *)node
{
  float y = vector.y;
  [(SCNNode *)self simdConvertVector:node fromNode:*(double *)&vector.x];
  float v7 = v6;
  float v9 = v8;
  result.z = v9;
  result.float y = v7;
  result.x = v5;
  return result;
}

- (simd_float3)simdConvertVector:(simd_float3)vector fromNode:(SCNNode *)node
{
  float v6 = node;
  float32x4_t v12 = (float32x4_t)vector;
  if (!node)
  {
    float v6 = (SCNNode *)objc_msgSend(-[SCNNode scene](self, "scene"), "rootNode");
    vector = (simd_float3)v12;
  }
  if (v6 != self)
  {
    [(SCNNode *)self simdWorldTransform];
    simd_float4x4 v7 = __invert_f4(v13);
    v7.columns[3] = v7.columns[0];
    if (node)
    {
      simd_float4 v10 = v7.columns[2];
      simd_float4 v11 = v7.columns[0];
      simd_float4 v9 = v7.columns[1];
      [(SCNNode *)node simdWorldTransform];
      float32x4_t v8 = vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)v7.columns[1], *(float32x2_t *)v12.f32, 1), (float32x4_t)v7.columns[0], v12.f32[0]), (float32x4_t)v7.columns[2], v12, 2);
      v7.columns[1] = v9;
      v7.columns[2] = v10;
      v7.columns[3] = v11;
    }
    else
    {
      float32x4_t v8 = v12;
    }
    return (simd_float3)vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)v7.columns[1], *(float32x2_t *)v8.f32, 1), (float32x4_t)v7.columns[3], v8.f32[0]), (float32x4_t)v7.columns[2], v8, 2);
  }
  return vector;
}

- (simd_float4x4)simdWorldTransform
{
  if (*((unsigned char *)self + 40))
  {
    simd_float4 v34 = 0u;
    simd_float4 v35 = 0u;
    simd_float4 v32 = 0u;
    simd_float4 v33 = 0u;
    long long v14 = [(SCNNode *)self sceneRef];
    if (v14)
    {
      uint64_t v15 = (uint64_t)v14;
      C3DSceneLock((uint64_t)v14);
      C3DNodeComputeWorldMatrix((float32x4_t *)self->_node, (uint64_t)&v32);
      C3DSceneUnlock(v15);
    }
    else
    {
      C3DNodeComputeWorldMatrix((float32x4_t *)self->_node, (uint64_t)&v32);
    }
    goto LABEL_14;
  }
  [(SCNNode *)self simdTransform];
  simd_float4 v24 = v4;
  simd_float4 v26 = v3;
  simd_float4 v20 = v6;
  simd_float4 v22 = v5;
  if ((*((unsigned char *)self + 41) & 4) != 0)
  {
    [(SCNNode *)self simdPivot];
    simd_float4x4 v37 = __invert_f4(v36);
    unint64_t v7 = 0;
    simd_float4 v28 = v26;
    simd_float4 v29 = v24;
    simd_float4 v30 = v22;
    simd_float4 v31 = v20;
    simd_float4 v32 = 0u;
    simd_float4 v33 = 0u;
    simd_float4 v34 = 0u;
    simd_float4 v35 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v32 + v7) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v37.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v28 + v7))), (float32x4_t)v37.columns[1], *(float32x2_t *)&v28.f32[v7 / 4], 1), (float32x4_t)v37.columns[2], *(float32x4_t *)((char *)&v28 + v7), 2), (float32x4_t)v37.columns[3], *(float32x4_t *)((char *)&v28 + v7), 3);
      v7 += 16;
    }
    while (v7 != 64);
    simd_float4 v24 = v33;
    simd_float4 v26 = v32;
    simd_float4 v20 = v35;
    simd_float4 v22 = v34;
  }
  float32x4_t v8 = [(SCNNode *)self parentNode];
  if (v8)
  {
    [(SCNNode *)v8 simdWorldTransform];
    unint64_t v13 = 0;
    simd_float4 v28 = v27;
    simd_float4 v29 = v25;
    simd_float4 v30 = v23;
    simd_float4 v31 = v21;
    simd_float4 v32 = 0u;
    simd_float4 v33 = 0u;
    simd_float4 v34 = 0u;
    simd_float4 v35 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v32 + v13) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v9, COERCE_FLOAT(*(_OWORD *)((char *)&v28 + v13))), v10, *(float32x2_t *)&v28.f32[v13 / 4], 1), v11, *(float32x4_t *)((char *)&v28 + v13), 2), v12, *(float32x4_t *)((char *)&v28 + v13), 3);
      v13 += 16;
    }
    while (v13 != 64);
LABEL_14:
    simd_float4 v16 = v32;
    simd_float4 v17 = v33;
    simd_float4 v18 = v34;
    simd_float4 v19 = v35;
    goto LABEL_15;
  }
  simd_float4 v17 = v25;
  simd_float4 v16 = v27;
  simd_float4 v19 = v21;
  simd_float4 v18 = v23;
LABEL_15:
  result.columns[3] = v19;
  result.columns[2] = v18;
  result.columns[1] = v17;
  result.columns[0] = v16;
  return result;
}

- (id)childNodesPassingTest:(id)a3 recursively:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v7 = (void *)[MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  float32x4_t v8 = [(SCNNode *)self childNodes];
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(v8);
      }
      if ([*(id *)(*((void *)&v14 + 1) + 8 * v12) _childNodesPassingTest:a3 recursively:v4 output:v7])break; {
      if (v10 == ++v12)
      }
      {
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          goto LABEL_3;
        }
        return v7;
      }
    }
  }
  return v7;
}

- (NSArray)childNodesPassingTest:(void *)predicate
{
  return (NSArray *)[(SCNNode *)self childNodesPassingTest:predicate recursively:1];
}

- (BOOL)_childNodesPassingTest:(id)a3 recursively:(BOOL)a4 output:(id)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  char v21 = 0;
  if ((*((unsigned int (**)(id, SCNNode *, char *))a3 + 2))(a3, self, &v21)) {
    [a5 addObject:self];
  }
  if (v21) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v6;
  }
  if (v9) {
    return v21 != 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [(SCNNode *)self childNodes];
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (!v11) {
    return v21 != 0;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v18;
  BOOL v14 = 1;
LABEL_9:
  uint64_t v15 = 0;
  while (1)
  {
    if (*(void *)v18 != v13) {
      objc_enumerationMutation(v10);
    }
    char v21 = [*(id *)(*((void *)&v17 + 1) + 8 * v15) _childNodesPassingTest:a3 recursively:1 output:a5];
    if (v21) {
      return v14;
    }
    if (v12 == ++v15)
    {
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v12) {
        goto LABEL_9;
      }
      return v21 != 0;
    }
  }
}

void __21__SCNNode_setCamera___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  CFDictionaryRef v2 = (const __CFDictionary *)[*(id *)(a1 + 40) cameraRef];

  C3DNodeSetCamera(v1, v2);
}

- (void)setSimdPosition:(simd_float3)simdPosition
{
  [(SCNNode *)self _setPosition:*(double *)simdPosition.i64];
  if ((*((_WORD *)self + 22) & 0x100) != 0)
  {
    id v4 = [(SCNNode *)self _findComponentWithType:8];
    [v4 resetTransform];
  }
}

- (void)_setPosition:(SCNNode *)self
{
  if (*((unsigned char *)self + 40))
  {
    BOOL v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNNode _setPosition:]();
    }
  }
  else
  {
    float32x4_t v7 = v2;
    if ((*((unsigned char *)self + 41) & 1) == 0)
    {
      [(SCNNode *)self _updateAffine];
      float32x4_t v2 = v7;
    }
    uint32x4_t v4 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_position[2], v2);
    v4.i32[3] = v4.i32[2];
    if ((vminvq_u32(v4) & 0x80000000) == 0)
    {
      [(SCNNode *)self willChangeValueForKey:@"position"];
      *((unsigned char *)self + 41) &= ~2u;
      *(float32x4_t *)&self->_position[2] = v7;
      simd_float4 v5 = [(SCNNode *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __24__SCNNode__setPosition___block_invoke;
      v8[3] = &unk_2640083D8;
      uint64_t v10 = self;
      float32x4_t v9 = v7;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"translation" applyBlock:v8];
      [(SCNNode *)self didChangeValueForKey:@"position"];
    }
  }
}

- (void)_updateAffine
{
}

- (id)_associatedMDLObject
{
  return objc_getAssociatedObject(self, @"SCNSceneKitAssociatedObject");
}

+ (SCNNode)nodeWithMDLAsset:(id)a3
{
  return (SCNNode *)[a1 nodeWithMDLAsset:a3 options:0];
}

+ (SCNNode)nodeWithMDLAsset:(id)a3 options:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = objc_alloc_init((Class)a1);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v6, "addChildNode:", +[SCNNode nodeWithMDLObject:options:](SCNNode, "nodeWithMDLObject:options:", *(void *)(*((void *)&v12 + 1) + 8 * v10++), a4));
      }
      while (v8 != v10);
      uint64_t v8 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  return (SCNNode *)v6;
}

+ (SCNNode)nodeWithMDLObject:(id)a3 masterObjects:(id)a4 sceneNodes:(id)a5 skinnedMeshes:(id)a6 skelNodesMap:(void *)a7 asset:(id)a8 options:(id)a9
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  long long v13 = (SCNNode *)[a1 node];
  if ([a3 transform])
  {
    objc_msgSend((id)objc_msgSend(a3, "transform"), "matrix");
    v57[0] = v14;
    v57[1] = v15;
    v57[2] = v16;
    v57[3] = v17;
    [(SCNNode *)v13 setTransform:v57];
    [a3 transform];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    long long v19 = (void *)[a3 transform];
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_16;
      }
      long long v19 = (void *)[a3 transform];
    }
    long long v20 = (void *)[v19 transformAnimation];
    if (v20)
    {
      char v21 = v20;
      [v20 duration];
      if (v22 != 0.0)
      {
        uint64_t v23 = (void *)[a9 valueForKey:@"kSceneSourceAnimationLoadingMode"];
        if (v23)
        {
          simd_float4 v25 = v23;
          id v26 = a3;
          objc_msgSend(v21, "setUsesSceneTimeBase:", objc_msgSend(v23, "isEqualToString:", @"playUsingSceneTime"));
          objc_msgSend(v21, "setRemovedOnCompletion:", objc_msgSend(v25, "isEqualToString:", @"playUsingSceneTime") ^ 1);
          int v27 = [v25 isEqualToString:@"playRepeatedly"];
          LODWORD(v24) = 2139095040;
          if (!v27) {
            *(float *)&double v24 = 0.0;
          }
        }
        else
        {
          id v26 = a3;
          LODWORD(v24) = 2139095040;
        }
        [v21 setRepeatCount:v24];
        [a8 endTime];
        double v29 = v28;
        [a8 startTime];
        double v31 = v29 - v30;
        if (v29 - v30 > 0.0)
        {
          [v21 duration];
          double v33 = v32;
          [v21 beginTime];
          if (v33 < v31 - v34)
          {
            [v21 beginTime];
            [v21 setDuration:v31 - v35];
          }
        }
        [(SCNNode *)v13 addAnimation:v21 forKey:@"transform"];
        a3 = v26;
      }
    }
  }
LABEL_16:
  -[SCNNode setName:](v13, "setName:", [a3 name]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v36 = [a3 path];
    uint64_t v37 = [a4 objectForKey:v36];
    if (v37)
    {
      [(SCNNode *)v13 setGeometry:v37];
    }
    else
    {
      [(SCNNode *)v13 setGeometry:+[SCNGeometry geometryWithMDLMesh:a3 options:a9]];
      int32x4_t v39 = (void *)[a3 componentConformingToProtocol:&unk_26C007A98];
      if (v39)
      {
        char v40 = v39;
        [(SCNNode *)v13 setMorpher:morpherFromMDLMorphDeformer(v39)];
        addMorphAnimation(v40, v13, a9);
      }
      if ([a3 componentConformingToProtocol:&unk_26C007C50]) {
        [a6 addObject:a3];
      }
      if ([a3 subdivisionScheme])
      {
        [(SCNGeometry *)[(SCNNode *)v13 geometry] setSubdivisionLevel:1];
        [(SCNGeometry *)[(SCNNode *)v13 geometry] setWantsAdaptiveSubdivision:1];
        long long v41 = objc_opt_new();
        [(SCNGeometry *)[(SCNNode *)v13 geometry] setTessellator:v41];
      }
      objc_msgSend(a4, "setObject:forKey:", -[SCNNode geometry](v13, "geometry"), v36);
    }
    goto LABEL_35;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float32x4_t v38 = +[SCNLight lightWithMDLLight:a3];
LABEL_23:
    [(SCNNode *)v13 setLight:v38];
    goto LABEL_35;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float32x4_t v38 = +[SCNLight lightWithMDLLightProbe:a3];
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SCNNode *)v13 setCamera:+[SCNCamera cameraWithMDLCamera:a3]];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
  }
    }
LABEL_35:
  if ([a3 instance]) {
    -[SCNNode addChildNode:](v13, "addChildNode:", +[SCNNode nodeWithMDLObject:masterObjects:sceneNodes:skinnedMeshes:skelNodesMap:asset:options:](SCNNode, "nodeWithMDLObject:masterObjects:sceneNodes:skinnedMeshes:skelNodesMap:asset:options:", [a3 instance], a4, a5, a6, a7, a8, a9));
  }
  long long v42 = v13;
  objc_msgSend(a5, "setObject:forKey:", v13, objc_msgSend(a3, "path"));
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v50 = a3;
  long long v43 = (void *)[a3 children];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v54 != v46) {
          objc_enumerationMutation(v43);
        }
        long long v48 = +[SCNNode nodeWithMDLObject:*(void *)(*((void *)&v53 + 1) + 8 * i) masterObjects:a4 sceneNodes:a5 skinnedMeshes:a6 skelNodesMap:a7 asset:a8 options:a9];
        if (v48) {
          [(SCNNode *)v42 addChildNode:v48];
        }
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v45);
  }
  -[SCNNode setHidden:](v42, "setHidden:", [v50 hidden]);
  return v42;
}

- (void)_addSkinnerWithMDLMesh:(id)a3 sceneNodes:(id)a4
{
  uint64_t v7 = [a3 componentConformingToProtocol:&unk_26C007C50];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(SCNNode *)self geometry];
    id v10 = jointNodesFromMDLSkinDeformer(v8, a4);
    id v11 = boneInverseTransformsFromMDLSkinDeformer(v8);
    [(SCNNode *)self setSkinner:v15];
  }
}

- (void)_bakeNodes:(id)a3 folderPath:(id)a4 inVertex:(BOOL)a5 bakeAO:(BOOL)a6 quality:(float)a7 attenuation:(float)a8 geomSetter:(id)a9 terminateSetter:(id)a10
{
  v30[1] = *MEMORY[0x263EF8340];
  v30[0] = self;
  long long v18 = (MDLAsset *)SCNNodesToMDLAsset((void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1]);
  long long v19 = (MDLAsset *)SCNNodesToMDLAsset(a3);
  long long v20 = FlattenedMDLMeshesFromMDLAsset(v19);
  char v21 = FlattenedMDLMeshesFromMDLAsset(v18);
  double v22 = FlattenedMDLLightsFromMDLAsset(v18);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __108__SCNNode_SCNModelIO___bakeNodes_folderPath_inVertex_bakeAO_quality_attenuation_geomSetter_terminateSetter___block_invoke;
  v29[3] = &unk_264004A50;
  v29[4] = a4;
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __108__SCNNode_SCNModelIO___bakeNodes_folderPath_inVertex_bakeAO_quality_attenuation_geomSetter_terminateSetter___block_invoke_2;
  block[3] = &unk_264004AC8;
  BOOL v27 = a6;
  BOOL v28 = a5;
  float v25 = a7;
  float v26 = a8;
  block[4] = v20;
  block[5] = v21;
  block[6] = v22;
  block[7] = v19;
  block[8] = v29;
  block[9] = a9;
  block[10] = a10;
  dispatch_async(global_queue, block);
}

uint64_t __108__SCNNode_SCNModelIO___bakeNodes_folderPath_inVertex_bakeAO_quality_attenuation_geomSetter_terminateSetter___block_invoke(uint64_t a1, void *a2)
{
  float32x4_t v2 = *(void **)(a1 + 32);
  simd_float4 v3 = NSString;
  uint64_t v4 = [a2 name];
  uint64_t v5 = [v3 stringWithFormat:@"AO_%@_%@.png", v4, objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString")];

  return [v2 stringByAppendingPathComponent:v5];
}

void __108__SCNNode_SCNModelIO___bakeNodes_folderPath_inVertex_bakeAO_quality_attenuation_geomSetter_terminateSetter___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3052000000;
  void v30[3] = __Block_byref_object_copy_;
  v30[4] = __Block_byref_object_dispose_;
  v30[5] = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3052000000;
  v29[3] = __Block_byref_object_copy_;
  v29[4] = __Block_byref_object_dispose_;
  void v29[5] = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3052000000;
  v28[3] = __Block_byref_object_copy_;
  v28[4] = __Block_byref_object_dispose_;
  v28[5] = 0;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __108__SCNNode_SCNModelIO___bakeNodes_folderPath_inVertex_bakeAO_quality_attenuation_geomSetter_terminateSetter___block_invoke_228;
  v27[3] = &unk_264004A78;
  v27[4] = v30;
  v27[5] = v29;
  v27[6] = v28;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  float32x4_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v3)
  {
    uint64_t v6 = *(void *)v24;
    uint64_t v7 = *MEMORY[0x263F13598];
    uint64_t v8 = *MEMORY[0x263F13578];
    uint64_t v9 = *MEMORY[0x263F135B0];
    char v10 = 1;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v2);
        }
        long long v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (*(unsigned char *)(a1 + 96))
        {
          LODWORD(v4) = *(_DWORD *)(a1 + 88);
          LODWORD(v5) = *(_DWORD *)(a1 + 92);
          uint64_t v13 = *(void *)(a1 + 40);
          if (*(unsigned char *)(a1 + 97)) {
            char v14 = [v12 generateAmbientOcclusionVertexColorsWithQuality:v13 attenuationFactor:v7 objectsToConsider:v4 vertexAttributeNamed:v5];
          }
          else {
            char v14 = [v12 generateAmbientOcclusionTextureWithQuality:v13 attenuationFactor:v8 objectsToConsider:@"aoTexture" vertexAttributeNamed:v4 materialPropertyNamed:v5];
          }
        }
        else if (*(unsigned char *)(a1 + 97))
        {
          char v14 = [v12 generateLightMapVertexColorsWithLightsToConsider:*(void *)(a1 + 48) objectsToConsider:*(void *)(a1 + 40) vertexAttributeNamed:v7];
        }
        else
        {
          LODWORD(v4) = *(_DWORD *)(a1 + 88);
          char v14 = [v12 generateLightMapTextureWithQuality:*(void *)(a1 + 48) lightsToConsider:*(void *)(a1 + 40) objectsToConsider:v9 vertexAttributeNamed:@"lightmapTexture" materialPropertyNamed:v4];
        }
        v10 &= v14;
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v3);
  }
  else
  {
    char v10 = 1;
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __108__SCNNode_SCNModelIO___bakeNodes_folderPath_inVertex_bakeAO_quality_attenuation_geomSetter_terminateSetter___block_invoke_2_236;
  v16[3] = &unk_264004AA0;
  char v21 = v10;
  uint64_t v15 = *(void *)(a1 + 56);
  char v22 = *(unsigned char *)(a1 + 96);
  v16[4] = v15;
  v16[5] = v27;
  long long v17 = *(_OWORD *)(a1 + 64);
  long long v19 = v29;
  long long v20 = v30;
  uint64_t v18 = *(void *)(a1 + 80);
  dispatch_async(MEMORY[0x263EF83A0], v16);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v30, 8);
}

void *__108__SCNNode_SCNModelIO___bakeNodes_folderPath_inVertex_bakeAO_quality_attenuation_geomSetter_terminateSetter___block_invoke_228(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    *(void *)(*(void *)(result[4] + 8) + 40) = a2;
    *(void *)(*(void *)(result[5] + 8) + 40) = a3;
    *(void *)(*(void *)(result[6] + 8) + 40) = a4;
  }
  return result;
}

uint64_t __108__SCNNode_SCNModelIO___bakeNodes_folderPath_inVertex_bakeAO_quality_attenuation_geomSetter_terminateSetter___block_invoke_2_236(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 88))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    float32x4_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v13;
      uint64_t v6 = *MEMORY[0x263F13578];
      uint64_t v7 = *MEMORY[0x263F135B0];
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v2);
          }
          if (*(unsigned char *)(a1 + 89))
          {
            uint64_t v9 = v6;
            char v10 = @"aoTexture";
          }
          else
          {
            uint64_t v9 = v7;
            char v10 = @"lightmapTexture";
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * i) _updateAssociatedSCNNodeWithGeometrySetter:*(void *)(a1 + 40) texturePathProvider:*(void *)(a1 + 48) vertexAttributeNamed:v9 materialPropertyNamed:v10];
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v4);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (id)initPresentationNodeWithNodeRef:(__C3DNode *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNNode;
  uint64_t v4 = [(SCNNode *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 40) |= 1u;
    v4->_node = (__C3DNode *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
    v5->_valueForKeyLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (SCNNode)initWithNodeRef:(__C3DNode *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SCNNode;
  id v4 = [(SCNNode *)&v9 init];
  if (v4)
  {
    CFTypeRef v5 = CFRetain(a3);
    *((void *)v4 + 1) = v5;
    if (v5) {
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    }
    *((_DWORD *)v4 + 50) = 0;
    *((_DWORD *)v4 + 62) = 0;
    [v4 _syncObjCModel];
    [v4 _syncObjCAnimations];
    if (C3DNodeGetChildNodesCount(*((void *)v4 + 1)))
    {
      *((void *)v4 + 3) = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v6 = *((void *)v4 + 1);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __27__SCNNode_initWithNodeRef___block_invoke;
      v8[3] = &unk_264008708;
      void v8[4] = v4;
      C3DNodeApplyChildren(v6, (uint64_t)v8);
    }
  }
  return (SCNNode *)v4;
}

uint64_t __27__SCNNode_initWithNodeRef___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[SCNNode nodeWithNodeRef:a2];
  [(SCNNode *)v3 _setParent:*(void *)(a1 + 32)];
  id v4 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v4 addObject:v3];
}

- (void)_initChildNodesArray
{
  uint64_t v3 = [(SCNNode *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  node = self->_node;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__SCNNode__initChildNodesArray__block_invoke;
  v6[3] = &unk_264008708;
  v6[4] = self;
  C3DNodeApplyChildren((uint64_t)node, (uint64_t)v6);
  if (v4) {
    C3DSceneUnlock(v4);
  }
}

void __31__SCNNode__initChildNodesArray__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 40)) {
    uint64_t v3 = [[SCNNode alloc] initPresentationNodeWithNodeRef:a2];
  }
  else {
    uint64_t v3 = +[SCNNode nodeWithNodeRef:a2];
  }
  uint64_t v4 = v3;
  [(SCNNode *)v3 _setParent:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:v4];
}

+ (SCNNode)nodeWithGeometry:(SCNGeometry *)geometry
{
  uint64_t v4 = (SCNNode *)[a1 node];
  [(SCNNode *)v4 setGeometry:geometry];
  return v4;
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ((*((unsigned char *)self + 40) & 1) == 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    childNodes = self->_childNodes;
    uint64_t v4 = [(NSMutableArray *)childNodes countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(childNodes);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) _setParent:0];
        }
        uint64_t v5 = [(NSMutableArray *)childNodes countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);
    }
    if (self->_rendererDelegate)
    {
      uint64_t v8 = [(SCNNode *)self sceneRef];
      if (v8)
      {
        uint64_t v9 = (uint64_t)v8;
        C3DSceneLock((uint64_t)v8);
        C3DNodeSetRendererDelegate((uint64_t)self->_node, 0);
        C3DSceneUnlock(v9);
      }
      else
      {
        C3DNodeSetRendererDelegate((uint64_t)self->_node, 0);
      }
    }
  }
  __int16 v10 = *((_WORD *)self + 22);
  if ((v10 & 0x200) != 0)
  {
    [(SCNPhysicsField *)[(SCNNode *)self physicsField] _removeOwner];
    __int16 v10 = *((_WORD *)self + 22);
  }
  if ((v10 & 0x100) != 0) {
    [(SCNPhysicsBody *)[(SCNNode *)self physicsBody] _ownerWillDie];
  }

  self->_components = 0;
  node = self->_node;
  if (node)
  {
    if ((*((unsigned char *)self + 40) & 1) == 0)
    {
      C3DEntitySetObjCWrapper((uint64_t)node, 0);
      node = self->_node;
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __18__SCNNode_dealloc__block_invoke;
    v13[3] = &__block_descriptor_40_e8_v16__0d8l;
    v13[4] = node;
    +[SCNTransaction postCommandWithContext:0 object:0 applyBlock:v13];
  }

  free(self->_fixedBoundingBoxExtrema);
  v12.receiver = self;
  v12.super_class = (Class)SCNNode;
  [(SCNNode *)&v12 dealloc];
}

void __18__SCNNode_dealloc__block_invoke(uint64_t a1)
{
}

- (void)setAttribute:(id)a3 forKey:(id)a4
{
  objc_super v7 = [(SCNNode *)self sceneRef];
  if (v7)
  {
    uint64_t v8 = (uint64_t)v7;
    C3DSceneLock((uint64_t)v7);
    C3DEntitySetAttribute((CFTypeRef *)[(SCNNode *)self __CFObject], a4, (const __CFDictionary *)a3);
    C3DSceneUnlock(v8);
  }
  else
  {
    uint64_t v9 = [(SCNNode *)self __CFObject];
    C3DEntitySetAttribute(v9, a4, (const __CFDictionary *)a3);
  }
}

- (id)attributeForKey:(id)a3
{
  uint64_t v5 = [(SCNNode *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  CFDictionaryRef v7 = C3DEntityGetAttribute((uint64_t)[(SCNNode *)self __CFObject], a3);
  if (v6) {
    C3DSceneUnlock(v6);
  }
  return v7;
}

- (SCNNode)presentationNode
{
  float32x4_t v2 = self;
  if ((*((unsigned char *)self + 40) & 1) == 0)
  {
    self = self->_presentationInstance;
    if (!self)
    {
      self = [[SCNNode alloc] initPresentationNodeWithNodeRef:v2->_node];
      v2->_presentationInstance = self;
    }
  }
  return self;
}

- (void)_dump:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = (const char *)objc_msgSend(a3, "cStringUsingEncoding:", objc_msgSend(NSString, "defaultCStringEncoding"));
  uint64_t v6 = [(SCNNode *)self description];
  printf("%s%s {\n", v5, -[NSString cStringUsingEncoding:](v6, "cStringUsingEncoding:", [NSString defaultCStringEncoding]));
  uint64_t v7 = [NSString stringWithFormat:@"\t%@", a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(SCNNode *)self childNodes];
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) _dump:v7];
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
  printf("%s}\n", (const char *)objc_msgSend(a3, "cStringUsingEncoding:", objc_msgSend(NSString, "defaultCStringEncoding")));
}

- (void)dump
{
}

+ (id)_dumpNodeTree:(id)a3 tab:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v7 = NSString;
  if ([a3 name]) {
    uint64_t v8 = [a3 name];
  }
  else {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"<%p>", a3);
  }
  uint64_t v9 = (void *)[v7 stringWithFormat:@"%@%@\n", a4, v8];
  uint64_t v10 = [NSString stringWithFormat:@"\t%@", a4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = (void *)[a3 childNodes];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v9 = objc_msgSend(v9, "stringByAppendingString:", objc_msgSend(a1, "_dumpNodeTree:tab:", *(void *)(*((void *)&v17 + 1) + 8 * v15++), v10));
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
  return v9;
}

- (id)_dumpTree
{
  uint64_t v3 = objc_opt_class();

  return (id)[v3 _dumpNodeTree:self tab:&stru_26BF72F58];
}

- (void)_setAttributes:(id)a3
{
  p_valueForKeyLocuint64_t k = &self->_valueForKeyLock;
  os_unfair_lock_lock(&self->_valueForKeyLock);

  self->_valueForKefloat y = (NSMutableDictionary *)a3;

  os_unfair_lock_unlock(p_valueForKeyLock);
}

uint64_t __24__SCNNode_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forKey:a2];
}

- (BOOL)_isAReference
{
  return 0;
}

+ (SCNNode)nodeWithNodeRef:(__C3DNode *)a3
{
  simd_float4x4 result = (SCNNode *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
  {
    uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithNodeRef:a3];
    return (SCNNode *)v6;
  }
  return result;
}

- (id)objectInChildNodesWithName:(id)a3
{
  return [(SCNNode *)self childNodeWithName:a3 recursively:1];
}

- (BOOL)_enumerateChildNodesUsingBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v15 = 0;
  (*((void (**)(id, SCNNode *, char *))a3 + 2))(a3, self, &v15);
  if (!v15)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = [(SCNNode *)self childNodes];
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          char v15 = [*(id *)(*((void *)&v11 + 1) + 8 * i) _enumerateChildNodesUsingBlock:a3];
          if (v15) {
            return 1;
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  return v15 != 0;
}

- (void)enumerateChildNodesUsingBlock:(void *)block
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(SCNNode *)self childNodes];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v10 != v7) {
        objc_enumerationMutation(v4);
      }
      if ([*(id *)(*((void *)&v9 + 1) + 8 * v8) _enumerateChildNodesUsingBlock:block]) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v6) {
          goto LABEL_3;
        }
        return;
      }
    }
  }
}

- (void)enumerateHierarchyUsingBlock:(void *)block
{
  char v5 = 0;
  (*((void (**)(void *, SCNNode *, char *))block + 2))(block, self, &v5);
  if (!v5) {
    [(SCNNode *)self enumerateChildNodesUsingBlock:block];
  }
}

- (void)_childNodesWithAttribute:(Class)a3 output:(id)a4 recursively:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [(SCNNode *)self childNodes];
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if ((Class)objc_opt_class() == a3 && [v13 camera]
          || (Class)objc_opt_class() == a3 && [v13 light]
          || (Class)objc_opt_class() == a3 && [v13 geometry]
          || (Class)objc_opt_class() == a3 && [v13 morpher]
          || (Class)objc_opt_class() == a3 && [v13 skinner])
        {
          [a4 addObject:v13];
        }
        if (v5) {
          [v13 _childNodesWithAttribute:a3 output:a4 recursively:1];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (id)childNodesWithAttribute:(Class)a3 recursively:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = (void *)[MEMORY[0x263EFF980] array];
  [(SCNNode *)self _childNodesWithAttribute:a3 output:v7 recursively:v4];
  return v7;
}

- (id)objectInChildNodesWithAttribute:(id)a3 firstOnly:(BOOL)a4
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  BOOL v10 = a4;
  uint64_t v6 = (void *)[MEMORY[0x263EFF980] array];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__SCNNode_objectInChildNodesWithAttribute_firstOnly___block_invoke;
  v8[3] = &unk_264008730;
  void v8[4] = a3;
  void v8[5] = v9;
  [(SCNNode *)self _childNodesPassingTest:v8 recursively:1 output:v6];
  _Block_object_dispose(v9, 8);
  return v6;
}

uint64_t __53__SCNNode_objectInChildNodesWithAttribute_firstOnly___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"kMeshKey"]
    && [a2 geometry]
    || [*(id *)(a1 + 32) isEqualToString:@"kCameraKey"]
    && [a2 camera]
    || (uint64_t result = [*(id *)(a1 + 32) isEqualToString:@"kLightKey"], result)
    && (uint64_t result = [a2 light]) != 0)
  {
    uint64_t result = 1;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a3 = 1;
    }
  }
  return result;
}

- (id)childNodeWithName:(id)a3
{
  return [(SCNNode *)self childNodeWithName:a3 recursively:1];
}

- (id)jsChildNodesWithAttribute:(id)a3
{
  return [(SCNNode *)self objectInChildNodesWithAttribute:a3 firstOnly:0];
}

- (void)_removeComponentWithType:(int64_t)a3
{
  components = self->_components;
  if (components)
  {
    if ([(SCNNodeComponent *)self->_components type] == a3)
    {
      uint64_t v6 = 0;
LABEL_7:
      uint64_t v9 = [(SCNNodeComponent *)components next];
      if (v6)
      {
        [(SCNNodeComponent *)v6 setNext:v9];
      }
      else
      {
        self->_components = v9;
      }
      *((_WORD *)self + 22) &= (unsigned __int16)~(1 << a3) | 0xE000;
    }
    else
    {
      uint64_t v7 = components;
      while (1)
      {
        uint64_t v8 = [(SCNNodeComponent *)v7 next];
        if (!v8) {
          break;
        }
        components = v8;
        uint64_t v6 = v7;
        uint64_t v7 = v8;
        if ([(SCNNodeComponent *)v8 type] == a3) {
          goto LABEL_7;
        }
      }
    }
  }
}

- (NSArray)hitTestWithSegmentFromPoint:(SCNVector3)pointA toPoint:(SCNVector3)pointB options:(NSDictionary *)options
{
  float y = pointB.y;
  float x = pointB.x;
  float v18 = pointA.y;
  float v19 = pointA.x;
  uint64_t v7 = [(SCNNode *)self sceneRef];
  if (v7)
  {
    uint64_t v8 = (__n128 *)v7;
    C3DSceneLock((uint64_t)v7);
    memset(v24, 0, sizeof(v24));
    if (options)
    {
      id v9 = [(NSDictionary *)options objectForKey:@"kHitTestRootNode"];
      BOOL v10 = self;
      if (v9) {
        BOOL v10 = [(NSDictionary *)options objectForKey:@"kHitTestRootNode"];
      }
      uint64_t v11 = [(SCNNode *)v10 nodeRef];
      id v12 = (id)[(NSDictionary *)options mutableCopy];
    }
    else
    {
      uint64_t v11 = [(SCNNode *)self nodeRef];
      id v12 = (id)[MEMORY[0x263EFF9A0] dictionary];
    }
    [v12 setObject:v11 forKey:@"kHitTestRootNode"];
    [(SCNNode *)self simdConvertPosition:0 toNode:COERCE_DOUBLE(__PAIR64__(LODWORD(v18), LODWORD(v19)))];
    long long v23 = v14;
    [(SCNNode *)self simdConvertPosition:0 toNode:COERCE_DOUBLE(__PAIR64__(LODWORD(y), LODWORD(x)))];
    __n128 v22 = v15;
    C3DRay3Make(v24, &v23, &v22);
    HitTestResultsWithSegment = (const void *)C3DSceneCreateHitTestResultsWithSegment(v8, v24, (const __CFDictionary *)v12);
    long long v13 = +[SCNHitTestResult hitTestResultsFromHitTestResultRef:HitTestResultsWithSegment];
    if (HitTestResultsWithSegment) {
      CFRelease(HitTestResultsWithSegment);
    }
    C3DSceneUnlock((uint64_t)v8);
  }
  else
  {
    long long v13 = 0;
  }
  if ([(NSArray *)v13 count]) {
    return v13;
  }
  else {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
}

- (void)_updateTransform
{
}

- (int64_t)rotationRepresentation
{
  return ((unint64_t)*((unsigned __int8 *)self + 41) >> 4) & 3;
}

- (void)_quaternion
{
  unsigned int v2 = *(unsigned __int8 *)(a1 + 41);
  if ((v2 & 1) == 0)
  {
    [(id)a1 _updateAffine];
    unsigned int v2 = *(unsigned __int8 *)(a1 + 41);
  }
  int v3 = (v2 >> 4) & 3;
  if (v3)
  {
    if (v3 == 1)
    {
      [(id)a1 simdRotation];
      float32x4_t v7 = v6;
      float32x4_t v8 = vmulq_f32(v6, v6);
      if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1))).f32[0] > 0.000000001)__sincosf_stret(vmuls_lane_f32(0.5, v7, 3)); {
    }
      }
  }
  else
  {
    float v4 = *(float *)(a1 + 132);
    float v5 = *(float *)(a1 + 136);
    __sincosf_stret(*(float *)(a1 + 128) * 0.5);
    __sincosf_stret(v4 * 0.5);
    __sincosf_stret(v5 * 0.5);
  }
}

- (SCNQuaternion)worldOrientation
{
  [(SCNNode *)self simdWorldOrientation];
  float v4 = v3;
  float v6 = v5;
  float v8 = v7;
  result.w = v8;
  result.z = v6;
  result.float y = v4;
  result.float x = v2;
  return result;
}

- (void)setWorldOrientation:(SCNQuaternion)worldOrientation
{
  float y = worldOrientation.y;
  [(SCNNode *)self setSimdWorldOrientation:*(double *)&worldOrientation.x];
}

- (SCNQuaternion)orientation
{
  [(SCNNode *)self simdOrientation];
  float v4 = v3;
  float v6 = v5;
  float v8 = v7;
  result.w = v8;
  result.z = v6;
  result.float y = v4;
  result.float x = v2;
  return result;
}

- (void)_setQuaternion:(float32x4_t *)a1
{
  if (a1[2].i8[8])
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNNode _setQuaternion:]();
    }
  }
  else
  {
    if ((a1[2].i8[9] & 1) == 0) {
      [(float32x4_t *)a1 _updateAffine];
    }
    [(float32x4_t *)a1 _quaternion];
    if ((vminvq_u32((uint32x4_t)vceqq_f32(v8, v3)) & 0x80000000) == 0)
    {
      [(float32x4_t *)a1 willChangeValueForKey:@"orientation"];
      __int8 v4 = a1[2].i8[9];
      a1[8] = v8;
      a1[2].i8[9] = v4 & 0xCD | 0x20;
      uint64_t v5 = [(float32x4_t *)a1 sceneRef];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __26__SCNNode__setQuaternion___block_invoke;
      void v9[3] = &unk_2640083D8;
      uint64_t v11 = a1;
      float32x4_t v10 = v8;
      +[SCNTransaction postCommandWithContext:v5 object:a1 key:@"orientation" applyBlock:v9];
      [(float32x4_t *)a1 didChangeValueForKey:@"orientation"];
    }
  }
}

void __26__SCNNode__setQuaternion___block_invoke(__n128 *a1)
{
}

- (void)setOrientation:(SCNQuaternion)orientation
{
  float y = orientation.y;
  [(SCNNode *)self setSimdOrientation:*(double *)&orientation.x];
}

- (double)_euler
{
  char v2 = *(unsigned char *)(a1 + 41);
  if ((v2 & 1) == 0)
  {
    [(id)a1 _updateAffine];
    char v2 = *(unsigned char *)(a1 + 41);
  }
  if ((v2 & 0x30) != 0)
  {
    [(id)a1 _quaternion];
    float32x4_t v4 = v3;
    int8x16_t v5 = (int8x16_t)vmulq_f32(v3, v3);
    float v6 = vaddv_f32(vadd_f32(*(float32x2_t *)v5.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL)));
    *(void *)&long long v7 = 0;
    if (v6 != 0.0)
    {
      float v8 = v4.f32[2];
      float v9 = v4.f32[1];
      float v10 = v4.f32[3];
      float v11 = vmlas_n_f32(vmuls_lane_f32(-v4.f32[1], v4, 3), v4.f32[2], v4.f32[0]) / v6;
      if (v11 <= 0.499)
      {
        if (v11 >= -0.499)
        {
          float v14 = *(float *)&v5.i32[1];
          uint64_t v15 = v5.i64[1];
          float v17 = v4.f32[0];
          float v18 = *(float *)v5.i32;
          atan2f((float)((float)(v4.f32[2] * v4.f32[3]) + (float)(v4.f32[0] * v4.f32[1]))+ (float)((float)(v4.f32[2] * v4.f32[3]) + (float)(v4.f32[0] * v4.f32[1])), *(float *)&v5.i32[3] + (float)((float)(*(float *)v5.i32 - *(float *)&v5.i32[1]) - *(float *)&v5.i32[2]));
          float v19 = atan2f((float)((float)(v17 * v10) + (float)(v9 * v8)) + (float)((float)(v17 * v10) + (float)(v9 * v8)), *((float *)&v15 + 1) + (float)(*(float *)&v15 + (float)((float)-v18 - v14)));
          *(void *)&long long v7 = __PAIR64__(COERCE_UNSIGNED_INT(asinf(v11 * -2.0)), LODWORD(v19));
          return *(double *)&v7;
        }
        *(float *)&long long v7 = atan2f(v4.f32[0], v4.f32[3]) * -2.0;
        long long v13 = &dword_20B5CBBB0;
      }
      else
      {
        float v12 = atan2f(v4.f32[0], v4.f32[3]);
        *(float *)&long long v7 = v12 + v12;
        long long v13 = &dword_20B5CBBB4;
      }
      DWORD1(v7) = *v13;
    }
  }
  else
  {
    long long v7 = *(_OWORD *)(a1 + 128);
  }
  return *(double *)&v7;
}

- (SCNVector3)eulerAngles
{
  [(SCNNode *)self simdEulerAngles];
  float v4 = v3;
  float v6 = v5;
  result.z = v6;
  result.float y = v4;
  result.float x = v2;
  return result;
}

- (void)setEulerAngles:(SCNVector3)eulerAngles
{
  float y = eulerAngles.y;
  [(SCNNode *)self setSimdEulerAngles:*(double *)&eulerAngles.x];
}

void __24__SCNNode__setPosition___block_invoke(__n128 *a1)
{
}

- (SCNVector3)position
{
  [(SCNNode *)self simdPosition];
  float v4 = v3;
  float v6 = v5;
  result.z = v6;
  result.float y = v4;
  result.float x = v2;
  return result;
}

- (void)_setScale:(SCNNode *)self
{
  if (*((unsigned char *)self + 40))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNNode _setScale:]();
    }
  }
  else
  {
    float32x4_t v7 = v2;
    if ((*((unsigned char *)self + 41) & 1) == 0)
    {
      [(SCNNode *)self _updateAffine];
      float32x4_t v2 = v7;
    }
    uint32x4_t v4 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_scale[2], v2);
    v4.i32[3] = v4.i32[2];
    if ((vminvq_u32(v4) & 0x80000000) == 0)
    {
      [(SCNNode *)self willChangeValueForKey:@"scale"];
      *((unsigned char *)self + 41) &= ~2u;
      *(float32x4_t *)&self->_scale[2] = v7;
      float v5 = [(SCNNode *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __21__SCNNode__setScale___block_invoke;
      v8[3] = &unk_2640083D8;
      float v10 = self;
      float32x4_t v9 = v7;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"scale" applyBlock:v8];
      [(SCNNode *)self didChangeValueForKey:@"scale"];
    }
  }
}

void __21__SCNNode__setScale___block_invoke(__n128 *a1)
{
}

- (void)setScale:(SCNVector3)scale
{
  float y = scale.y;
  [(SCNNode *)self setSimdScale:*(double *)&scale.x];
}

- (SCNVector3)scale
{
  [(SCNNode *)self simdScale];
  float v4 = v3;
  float v6 = v5;
  result.z = v6;
  result.float y = v4;
  result.float x = v2;
  return result;
}

- (void)setRotation:(SCNVector4)rotation
{
  float y = rotation.y;
  [(SCNNode *)self setSimdRotation:*(double *)&rotation.x];
}

- (SCNVector4)rotation
{
  [(SCNNode *)self simdRotation];
  float v4 = v3;
  float v6 = v5;
  float v8 = v7;
  result.w = v8;
  result.z = v6;
  result.float y = v4;
  result.float x = v2;
  return result;
}

+ (id)keyPathsForValuesAffectingPosition
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"transform", 0);
}

+ (id)keyPathsForValuesAffectingTransform
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"position", @"rotation", @"eulerAngles", @"orientation", @"scale", 0);
}

+ (id)keyPathsForValuesAffectingRotation
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"eulerAngles", @"orientation", @"transform", 0);
}

+ (id)keyPathsForValuesAffectingEulerAngles
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"rotation", @"orientation", @"transform", 0);
}

+ (id)keyPathsForValuesAffectingOrientation
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"rotation", @"eulerAngles", @"transform", 0);
}

+ (id)keyPathsForValuesAffectingScale
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"transform", 0);
}

- (SCNMatrix4)transform
{
  SCNVector4 result = (SCNMatrix4 *)[(SCNNode *)self simdTransform];
  *(_OWORD *)&retstr->m11 = v5;
  *(_OWORD *)&retstr->m21 = v6;
  *(_OWORD *)&retstr->m31 = v7;
  *(_OWORD *)&retstr->m41 = v8;
  return result;
}

- (void)setWorldPosition:(SCNVector3)worldPosition
{
  float y = worldPosition.y;
  [(SCNNode *)self setSimdWorldPosition:*(double *)&worldPosition.x];
}

- (SCNVector3)worldPosition
{
  [(SCNNode *)self simdWorldPosition];
  float v4 = v3;
  float v6 = v5;
  result.z = v6;
  result.float y = v4;
  result.float x = v2;
  return result;
}

- (void)setWorldTransform:(SCNMatrix4 *)worldTransform
{
}

- (SCNMatrix4)worldTransform
{
  SCNVector3 result = (SCNMatrix4 *)[(SCNNode *)self simdWorldTransform];
  *(_OWORD *)&retstr->m11 = v5;
  *(_OWORD *)&retstr->m21 = v6;
  *(_OWORD *)&retstr->m31 = v7;
  *(_OWORD *)&retstr->m41 = v8;
  return result;
}

- (void)setPivot:(SCNMatrix4 *)pivot
{
}

- (SCNMatrix4)pivot
{
  SCNVector3 result = (SCNMatrix4 *)[(SCNNode *)self simdPivot];
  *(_OWORD *)&retstr->m11 = v5;
  *(_OWORD *)&retstr->m21 = v6;
  *(_OWORD *)&retstr->m31 = v7;
  *(_OWORD *)&retstr->m41 = v8;
  return result;
}

void __29__SCNNode_setMovabilityHint___block_invoke(uint64_t a1)
{
}

- (BOOL)isHittable
{
  return C3DNodeGetHittable((uint64_t)self->_node);
}

- (void)setHittable:(BOOL)a3
{
}

void __26__SCNNode_setCastsShadow___block_invoke(uint64_t a1)
{
}

void __31__SCNNode_setUsesDepthPrePass___block_invoke(uint64_t a1)
{
}

__C3DCullingSystem *__30__SCNNode_setCategoryBitMask___block_invoke(uint64_t a1)
{
  return C3DNodeSetCategoryBitMask(*(void *)(*(void *)(a1 + 32) + 8), *(void *)(a1 + 40));
}

void __21__SCNNode_setHidden___block_invoke(uint64_t a1)
{
}

void __29__SCNNode_setRenderingOrder___block_invoke(uint64_t a1)
{
}

- (id)mutableChildNodes
{
  return self->_childNodes;
}

void __20__SCNNode_setLight___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(float32x4_t **)(*(void *)(a1 + 32) + 8);
  CFDictionaryRef v2 = (const __CFDictionary *)[*(id *)(a1 + 40) lightRef];

  C3DNodeSetLight(v1, v2);
}

- (BOOL)isJoint
{
  return (*((unsigned __int8 *)self + 41) >> 3) & 1;
}

- (void)setIsJoint:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 41) = *((unsigned char *)self + 41) & 0xF7 | v3;
}

void __22__SCNNode_setSkinner___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 8);
  CFDictionaryRef v2 = (uint64_t *)[*(id *)(a1 + 40) skinnerRef];

  C3DNodeSetSkinner(v1, v2);
}

void __22__SCNNode_setMorpher___block_invoke(uint64_t a1)
{
  CFDictionaryRef v2 = (const void *)[*(id *)(a1 + 32) morphRef];
  if (v2) {
    char v3 = (uint64_t *)C3DMorpherCreateWith(v2);
  }
  else {
    char v3 = 0;
  }
  C3DNodeSetMorpher(*(CFTypeRef **)(*(void *)(a1 + 40) + 8), v3);
  if (v3)
  {
    CFRelease(v3);
  }
}

void __36__SCNNode_setPostMorphingDeformers___block_invoke(uint64_t a1)
{
}

void __36__SCNNode_setPostSkinningDeformers___block_invoke(uint64_t a1)
{
}

- (void)setFilters:(NSArray *)filters
{
  if ([(SCNNode *)self filters] != filters)
  {
    [(SCNNode *)self _setComponent:(id)[(NSArray *)filters copy] withType:5];
    long long v5 = [(SCNNode *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __22__SCNNode_setFilters___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    void v6[5] = filters;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

void __22__SCNNode_setFilters___block_invoke(uint64_t a1)
{
}

- (NSArray)filters
{
  if (*((unsigned char *)self + 40))
  {
    float v4 = [(SCNNode *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      Filters = (NSArray *)C3DNodeGetFilters((uint64_t)self->_node);
      C3DSceneUnlock(v5);
      return Filters;
    }
    else
    {
      node = self->_node;
      return (NSArray *)C3DNodeGetFilters((uint64_t)node);
    }
  }
  else
  {
    return (NSArray *)[(SCNNode *)self _findComponentWithType:5];
  }
}

- (NSString)description
{
  char v3 = (void *)MEMORY[0x263F089D8];
  float v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = (void *)[v3 stringWithFormat:@"<%@: %p", NSStringFromClass(v4), self];
  if ([(NSString *)[(SCNNode *)self name] length]) {
    [v5 appendFormat:@" '%@'", -[SCNNode name](self, "name")];
  }
  [(SCNNode *)self position];
  if (v6 != 0.0 || v7 != 0.0 || v8 != 0.0) {
    objc_msgSend(v5, "appendFormat:", @" pos(%f %f %f)", v6, v7, v8);
  }
  [(SCNNode *)self rotation];
  BOOL v14 = v11 == 0.0 && v10 == 0.0 && v9 == 0.0;
  if (!v14 && v12 != 0.0) {
    objc_msgSend(v5, "appendFormat:", @" rot(%f %f %f %f)", v9, v10, v11, v12);
  }
  [(SCNNode *)self scale];
  if (v15 != 1.0 || v16 != 1.0 || v17 != 1.0) {
    objc_msgSend(v5, "appendFormat:", @" scale(%f %f %f)", v15, v16, v17);
  }
  if ([(SCNNode *)self light] || [(SCNNode *)self camera] || [(SCNNode *)self geometry]) {
    [v5 appendString:@" |"];
  }
  if ([(SCNNode *)self light]) {
    [v5 appendFormat:@" light=%@", -[SCNNode light](self, "light")];
  }
  if ([(SCNNode *)self camera]) {
    [v5 appendFormat:@" camera=%@", -[SCNNode camera](self, "camera")];
  }
  if ([(SCNNode *)self geometry]) {
    [v5 appendFormat:@" geometry=%@", -[SCNNode geometry](self, "geometry")];
  }
  NSUInteger v18 = [(NSArray *)[(SCNNode *)self childNodes] count];
  if (v18 == 1)
  {
    float v19 = @" | 1 child";
  }
  else
  {
    if (v18)
    {
      objc_msgSend(v5, "appendFormat:", @" | %d children", v18);
      goto LABEL_36;
    }
    float v19 = @" | no child";
  }
  [v5 appendString:v19];
LABEL_36:
  [v5 appendString:@">"];
  return (NSString *)v5;
}

void __31__SCNNode_setRendererDelegate___block_invoke(uint64_t a1)
{
}

- (void)renderInContext:(void *)a3
{
  uint64_t v5 = +[SCNRenderer rendererWithContext:a3 options:0];
  uint64_t v6 = [MEMORY[0x263F146E8] currentContext];
  [MEMORY[0x263F146E8] setCurrentContext:a3];
  C3DEngineContextRenderNodeTree((uint64_t)[(SCNRenderer *)v5 _engineContext], 0, [(SCNNode *)self nodeRef]);
  float v7 = (void *)MEMORY[0x263F146E8];

  [v7 setCurrentContext:v6];
}

- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5
{
  if (!objc_msgSend(a3, "hasPrefix:", @"/", a4))
  {
    uint64_t v9 = [a3 rangeOfString:@"["];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_12;
    }
    uint64_t v10 = v9;
    uint64_t v11 = v9 + 1;
    if (v9 + 1 >= (unint64_t)[a3 length]) {
      goto LABEL_12;
    }
    float v12 = (__CFString *)[a3 substringToIndex:v10];
    long long v13 = (void *)[a3 substringFromIndex:v11];
    uint64_t v14 = [v13 rangeOfString:@"]"];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_12;
    }
    int v15 = objc_msgSend((id)objc_msgSend(v13, "substringToIndex:", v14), "intValue");
    if (([(__CFString *)v12 isEqualToString:&stru_26BF72F58] & 1) != 0
      || [(__CFString *)v12 isEqualToString:@"nodes"])
    {
      float v12 = @"childNodes";
    }
    float v16 = (void *)[(SCNNode *)self valueForKey:v12];
    if ([v16 count] <= (unint64_t)v15)
    {
LABEL_12:
      LOBYTE(v8) = 0;
      return (char)v8;
    }
    float v8 = (SCNNode *)[v16 objectAtIndex:v15];
    goto LABEL_3;
  }
  float v8 = -[SCNNode childNodeWithName:recursively:](self, "childNodeWithName:recursively:", objc_msgSend(a3, "substringWithRange:", 1, objc_msgSend(a3, "length") - 1), 1);
  if (v8)
  {
LABEL_3:
    *a5 = v8;
    LOBYTE(v8) = 1;
  }
  return (char)v8;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  if (![a3 length]) {
    return 0;
  }
  uint64_t v13 = 0;
  id v14 = 0;
  uint64_t v12 = 0;
  SCNKitSplitKVCPath(a3, &v13, &v12);
  if ([(SCNNode *)self parseSpecialKey:v13 withPath:a3 intoDestination:&v14]&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    float v7 = (void *)[v14 copyAnimationChannelForKeyPath:v12 animation:a4];
    if (v7)
    {
      float v8 = v7;
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count") + 1);
      [v9 addObject:v13];
      [v9 addObjectsFromArray:v8];

      return v9;
    }
    return 0;
  }
  id v14 = (id)[(SCNNode *)self valueForKey:v13];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
  }
  uint64_t v10 = (void *)[v14 copyAnimationChannelForKeyPath:v12 animation:a4];
  if (!v10) {
    return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
  }
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v10, "count") + 1);
  [v9 addObject:v13];
  [v9 addObjectsFromArray:v10];

  return v9;
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  if ([a4 hasPrefix:@"filters."])
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    SCNKitSplitKVCPath(a4, &v13, &v12);
    if (v12)
    {
      CFStringRef v7 = C3DCFTypeCopyModelInfoAtPath((float32x4_t *)self->_node, (CFStringRef)a4, 0);
      if (v7)
      {
        CFStringRef v8 = v7;
        if (C3DModelTargetGetTargetAddress((uint64_t)v7))
        {
          uint64_t v9 = [(SCNNode *)self sceneRef];
          v11[0] = MEMORY[0x263EF8330];
          v11[1] = 3221225472;
          v11[2] = __31__SCNNode_setValue_forKeyPath___block_invoke;
          v11[3] = &unk_264008758;
          v11[4] = a4;
          v11[5] = a3;
          v11[6] = v12;
          v11[7] = self;
          +[SCNTransaction postCommandWithContext:v9 object:self keyPath:a4 applyBlock:v11];
        }
        CFRelease(v8);
      }
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SCNNode;
    [(SCNNode *)&v10 setValue:a3 forKeyPath:a4];
  }
}

uint64_t __31__SCNNode_setValue_forKeyPath___block_invoke(uint64_t result)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    if (*(void *)(result + 40))
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      SCNKitSplitKVCPath(*(void **)(result + 48), &v13, &v12);
      long long v8 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      CFDictionaryRef v2 = objc_msgSend(*(id *)(v1 + 56), "filters", 0);
      SCNVector3 result = [v2 countByEnumeratingWithState:&v8 objects:v14 count:16];
      if (result)
      {
        uint64_t v3 = result;
        uint64_t v4 = *(void *)v9;
        while (2)
        {
          uint64_t v5 = 0;
          do
          {
            if (*(void *)v9 != v4) {
              objc_enumerationMutation(v2);
            }
            uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * v5);
            CFStringRef v7 = (void *)[v6 name];
            if ([v7 isEqualToString:v13]) {
              return [v6 setValue:*(void *)(v1 + 40) forKey:v12];
            }
            ++v5;
          }
          while (v3 != v5);
          SCNVector3 result = [v2 countByEnumeratingWithState:&v8 objects:v14 count:16];
          uint64_t v3 = result;
          if (result) {
            continue;
          }
          break;
        }
      }
    }
  }
  return result;
}

- (id)valueForKeyPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  if ([a3 hasPrefix:@"filters."])
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    SCNKitSplitKVCPath((void *)[a3 substringFromIndex:objc_msgSend(@"filters.", "length")], &v18, &v17);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = [(SCNNode *)self filters];
    id result = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (result)
    {
      id v7 = result;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        long long v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v9);
          long long v11 = (void *)[v10 name];
          if ([v11 isEqualToString:v18]) {
            return (id)[v10 valueForKey:v17];
          }
          long long v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id result = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
        id v7 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SCNNode;
    return [(SCNNode *)&v12 valueForKeyPath:a3];
  }
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  if ((*((unsigned char *)self + 40) & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v5 = [(SCNNode *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  ValueForKefloat y = C3DEntityGetValueForKey((uint64_t)self->_node, a3);
  uint64_t v8 = ValueForKey;
  if (ValueForKey)
  {
    Bytes = (float32x2_t *)C3DValueGetBytes((uint64_t)ValueForKey);
    int Type = C3DValueGetType((uint64_t)v8);
    uint64_t v8 = (void *)SCNNSValueFromTypedBytes(Bytes, Type, v11, v12, v13, v14);
  }
  if (v6) {
    C3DSceneUnlock(v6);
  }
  if (!v8)
  {
LABEL_9:
    uint64_t v17 = 0;
    if ([(SCNNode *)self parseSpecialKey:a3 withPath:a3 intoDestination:&v17])
    {
      return v17;
    }
    else
    {
      os_unfair_lock_lock(&self->_valueForKeyLock);
      id v15 = (id)[(NSMutableDictionary *)self->_valueForKey objectForKey:a3];
      os_unfair_lock_unlock(&self->_valueForKeyLock);
      if (v15) {
        return v15;
      }
      else {
        return 0;
      }
    }
  }
  return v8;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  if ((*((unsigned char *)self + 40) & 1) == 0)
  {
    id v7 = (__int16 *)SCNCopyValueFromObjCProperty(self, a4);
    os_unfair_lock_lock(&self->_valueForKeyLock);
    valueForKefloat y = self->_valueForKey;
    if (a3)
    {
      if (!valueForKey)
      {
        valueForKefloat y = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        self->_valueForKefloat y = valueForKey;
      }
      [(NSMutableDictionary *)valueForKey setObject:a3 forKey:a4];
    }
    else
    {
      [(NSMutableDictionary *)valueForKey removeObjectForKey:a4];
    }
    os_unfair_lock_unlock(&self->_valueForKeyLock);
    uint64_t v10 = SCNCopyValueFromObjCProperty(self, a4);
    double v11 = (void *)v10;
    if (v7 && v10)
    {
      node = self->_node;
      C3DEntitySetValueForKey((uint64_t)node, a4, v7);
      uint64_t v13 = objc_msgSend((id)objc_msgSend(@"customProperty", "stringByAppendingString:", @"."), "stringByAppendingString:", a4);
      double v14 = [(SCNNode *)self sceneRef];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __36__SCNNode_setValue_forUndefinedKey___block_invoke;
      v15[3] = &unk_264004E20;
      v15[5] = v11;
      v15[6] = node;
      v15[4] = a4;
      +[SCNTransaction postCommandWithContext:v14 object:self keyPath:v13 applyBlock:v15];
    }
    else if (!v7)
    {
LABEL_14:

      return;
    }
    CFRelease(v7);
    goto LABEL_14;
  }
  long long v9 = scn_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[SCNNode setValue:forUndefinedKey:]();
  }
}

void __36__SCNNode_setValue_forUndefinedKey___block_invoke(uint64_t a1)
{
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  return SCNObject_resolveInstanceMethod((objc_class *)a1, a3);
}

- (__C3DAnimationManager)animationManager
{
  id result = [(SCNNode *)self sceneRef];
  if (result)
  {
    return (__C3DAnimationManager *)C3DSceneGetAnimationManager((uint64_t)result);
  }
  return result;
}

- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4
{
  if (!a4) {
    return 0;
  }
  p_animationsLocuint64_t k = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  BOOL v8 = objc_msgSend(-[SCNOrderedDictionary objectForKey:](self->_animations, "objectForKey:", a4), "animation") == (void)a3;
  if (v8)
  {
    [(SCNOrderedDictionary *)self->_animations removeObjectForKey:a4];
    long long v9 = [(SCNNode *)self __CFObject];
    if ((CFTypeIsC3DEntity(v9) & 1) == 0)
    {
      uint64_t v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[SCNNode __removeAnimation:forKey:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    C3DEntityRemoveAnimationForKey(v9, a4, 1);
  }
  os_unfair_lock_unlock(p_animationsLock);
  return v8;
}

- (void)addAnimationPlayer:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    if (!a4) {
      id v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString");
    }
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (!animations)
    {
      animations = objc_alloc_init(SCNOrderedDictionary);
      self->_animations = animations;
    }
    [(SCNOrderedDictionary *)animations setObject:a3 forKey:v5];
    os_unfair_lock_unlock(&self->_animationsLock);
    BOOL v8 = [(SCNNode *)self sceneRef];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __37__SCNNode_addAnimationPlayer_forKey___block_invoke;
    v10[3] = &unk_264006138;
    _OWORD v10[4] = a3;
    v10[5] = self;
    v10[6] = v5;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v10];
  }
  else
  {
    long long v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNMaterial addAnimationPlayer:forKey:]();
    }
  }
}

void __37__SCNNode_addAnimationPlayer_forKey___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "prepareWithTarget:implicitDuration:", a1[5]);
  if ((SCNAddAnimation(a1[4], a1[5], a1[6]) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 50);
    [*((id *)a1[5] + 26) removeObjectForKey:a1[6]];
    CFDictionaryRef v2 = (os_unfair_lock_s *)((char *)a1[5] + 200);
    os_unfair_lock_unlock(v2);
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    uint64_t v6 = (SCNAnimation *)a3;
    if (!a4) {
      id v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString");
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = +[SCNAnimation animationWithCAAnimation:v6];
    }
    id v7 = +[SCNAnimationPlayer animationPlayerWithSCNAnimation:v6];
    [(SCNNode *)self addAnimationPlayer:v7 forKey:v5];
    [(SCNAnimationPlayer *)v7 play];
    if ([(SCNNode *)self isPausedOrPausedByInheritance])
    {
      [(SCNNode *)self _pauseAnimation:1 forKey:v5 pausedByNode:1];
    }
  }
  else
  {
    BOOL v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNMaterial addAnimation:forKey:]();
    }
  }
}

- (void)addAnimation:(id)a3
{
}

- (void)removeAllAnimations
{
  p_animationsLocuint64_t k = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  [(SCNOrderedDictionary *)self->_animations removeAllObjects];
  os_unfair_lock_unlock(p_animationsLock);
  uint64_t v4 = [(SCNNode *)self sceneRef];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__SCNNode_removeAllAnimations__block_invoke;
  v5[3] = &unk_264005010;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:v4 object:self applyBlock:v5];
}

void __30__SCNNode_removeAllAnimations__block_invoke(uint64_t a1)
{
}

- (void)removeAllAnimationsWithBlendOutDuration:(double)a3
{
  p_animationsLocuint64_t k = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  [(SCNOrderedDictionary *)self->_animations removeAllObjects];
  os_unfair_lock_unlock(p_animationsLock);
  uint64_t v6 = [(SCNNode *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__SCNNode_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
}

void __51__SCNNode_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
{
}

- (void)removeAnimationForKey:(id)a3
{
  if (a3)
  {
    p_animationsLocuint64_t k = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    [(SCNOrderedDictionary *)self->_animations removeObjectForKey:a3];
    os_unfair_lock_unlock(p_animationsLock);
    uint64_t v6 = [(SCNNode *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __33__SCNNode_removeAnimationForKey___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __33__SCNNode_removeAnimationForKey___block_invoke(uint64_t a1)
{
}

- (void)removeAnimationForKey:(id)a3 blendOutDuration:(double)a4
{
  if (a3)
  {
    p_animationsLocuint64_t k = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    [(SCNOrderedDictionary *)self->_animations removeObjectForKey:a3];
    os_unfair_lock_unlock(p_animationsLock);
    BOOL v8 = [(SCNNode *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__SCNNode_removeAnimationForKey_blendOutDuration___block_invoke;
    void v9[3] = &unk_264004E20;
    void v9[4] = self;
    void v9[5] = a3;
    *(double *)&void v9[6] = a4;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v9];
  }
}

void __50__SCNNode_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
{
}

- (void)_syncObjCAnimations
{
}

- (id)animationForKey:(id)a3
{
  id v3 = [(SCNNode *)self _scnAnimationForKey:a3];
  uint64_t v4 = (void *)MEMORY[0x263F15748];

  return (id)[v4 animationWithSCNAnimation:v3];
}

- (id)_scnAnimationForKey:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    p_animationsLocuint64_t k = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations) {
      id v3 = (id)objc_msgSend(-[SCNOrderedDictionary objectForKey:](animations, "objectForKey:", v3), "animation");
    }
    else {
      id v3 = 0;
    }
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (id)animationPlayerForKey:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    p_animationsLocuint64_t k = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations) {
      id v3 = [(SCNOrderedDictionary *)animations objectForKey:v3];
    }
    else {
      id v3 = 0;
    }
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  long long v9 = [(SCNNode *)self __CFObject];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = [(SCNNode *)self animationManager];
    if (v11)
    {
      uint64_t v12 = (uint64_t)v11;
      double v13 = CACurrentMediaTime();
      C3DAnimationManagerPauseAnimationForKey(v12, v10, a4, v7, v5, v13);
    }
  }
}

- (void)pauseAnimationForKey:(id)a3
{
  BOOL v5 = [(SCNNode *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__SCNNode_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __32__SCNNode_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:1 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)resumeAnimationForKey:(id)a3
{
  BOOL v5 = [(SCNNode *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__SCNNode_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __33__SCNNode_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:0 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7 = [NSString stringWithFormat:@"animations.%@.speed", a4];
  BOOL v8 = [(SCNNode *)self sceneRef];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __36__SCNNode_setSpeed_forAnimationKey___block_invoke;
  void v9[3] = &unk_264004E20;
  void v9[4] = self;
  void v9[5] = a4;
  *(double *)&void v9[6] = a3;
  +[SCNTransaction postCommandWithContext:v8 object:self keyPath:v7 applyBlock:v9];
}

void __36__SCNNode_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  if (v2)
  {
    id v3 = (void *)v2;
    uint64_t v4 = [*(id *)(a1 + 32) animationManager];
    if (v4)
    {
      BOOL v5 = *(const void **)(a1 + 40);
      float v6 = *(double *)(a1 + 48);
      C3DAnimationManagerChangeSpeedOfAnimationForKey(v4, v3, v5, v6);
    }
  }
}

- (BOOL)isAnimationForKeyPaused:(id)a3
{
  BOOL v5 = [(SCNNode *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  uint64_t v7 = [(SCNNode *)self __CFObject];
  if (v7)
  {
    BOOL v8 = v7;
    long long v9 = [(SCNNode *)self animationManager];
    if (v9)
    {
      char IsPaused = C3DAnimationManagerGetAnimationForKeyIsPaused((uint64_t)v9, v8, a3);
      if (!v6) {
        return IsPaused;
      }
      goto LABEL_8;
    }
  }
  char IsPaused = 0;
  if (v6) {
LABEL_8:
  }
    C3DSceneUnlock(v6);
  return IsPaused;
}

- (id)_scnBindings
{
  return self->_bindings;
}

- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6
{
  if (self != a4)
  {
    v16[15] = v6;
    v16[16] = v7;
    double v13 = objc_alloc_init(C3DBinding);
    [(C3DBinding *)v13 setSourceObject:a4];
    [(C3DBinding *)v13 setKeyPathDst:a3];
    [(C3DBinding *)v13 setKeyPathSrc:a5];
    [(C3DBinding *)v13 setOptions:a6];
    bindings = self->_bindings;
    if (!bindings)
    {
      bindings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_bindings = bindings;
    }
    [(NSMutableDictionary *)bindings setValue:v13 forKey:a3];

    uint64_t v15 = [(SCNNode *)self sceneRef];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __59__SCNNode_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_264006188;
    v16[4] = self;
    v16[5] = a4;
    void v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:v15 object:self applyBlock:v16];
  }
}

void __59__SCNNode_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
{
  uint64_t v2 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  id v3 = objc_alloc_init(C3DBinding);
  -[C3DBinding setSourceObject:](v3, "setSourceObject:", objc_msgSend(*(id *)(a1 + 40), "__CFObject"));
  [(C3DBinding *)v3 setKeyPathDst:*(void *)(a1 + 48)];
  [(C3DBinding *)v3 setKeyPathSrc:*(void *)(a1 + 56)];
  [(C3DBinding *)v3 setOptions:*(void *)(a1 + 64)];
  C3DEntityAddBinding(v2, v3);
}

- (void)unbindAnimatablePath:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_bindings, "removeObjectForKey:");
  if (![(NSMutableDictionary *)self->_bindings count])
  {

    self->_bindings = 0;
  }
  BOOL v5 = [(SCNNode *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__SCNNode_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __32__SCNNode_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  uint64_t v2 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  CFStringRef v3 = *(const __CFString **)(a1 + 40);

  C3DEntityRemoveBindingWithKeyPath(v2, v3);
}

- (void)removeAllBindings
{
  self->_bindings = 0;
  CFStringRef v3 = [(SCNNode *)self sceneRef];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __28__SCNNode_removeAllBindings__block_invoke;
  v4[3] = &unk_264005010;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:v3 object:self applyBlock:v4];
}

void __28__SCNNode_removeAllBindings__block_invoke(uint64_t a1)
{
  uint64_t v1 = (CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");

  C3DEntityRemoveAllBindings(v1);
}

- (id)objectInChildNodesAtIndex:(unint64_t)a3
{
  objc_sync_enter(self);
  BOOL v5 = (void *)[(NSMutableArray *)self->_childNodes objectAtIndex:a3];
  objc_sync_exit(self);
  return v5;
}

- (void)_syncObjCModelAfterC3DIOSceneLoadingWithNodeRef:(__C3DNode *)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  [(SCNNode *)self _syncObjCModel];
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v18 = 0;
  float v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v5 = [(NSMutableArray *)self->_childNodes count];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __59__SCNNode__syncObjCModelAfterC3DIOSceneLoadingWithNodeRef___block_invoke;
  v17[3] = &unk_264008780;
  v17[4] = self;
  v17[5] = &v22;
  v17[6] = &v18;
  v17[7] = v5;
  C3DNodeApplyChildrenInterruptible((uint64_t)a3, (uint64_t)v17);
  if (v5 != v19[3])
  {
    *((unsigned char *)v23 + 24) = 1;
    goto LABEL_5;
  }
  if (*((unsigned char *)v23 + 24))
  {
LABEL_5:
    uint64_t v6 = (void *)[(NSMutableArray *)self->_childNodes copy];
    [(NSMutableArray *)self->_childNodes removeAllObjects];
    node = self->_node;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __59__SCNNode__syncObjCModelAfterC3DIOSceneLoadingWithNodeRef___block_invoke_2;
    v16[3] = &unk_264008708;
    v16[4] = self;
    C3DNodeApplyChildren((uint64_t)node, (uint64_t)v16);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  childNodes = self->_childNodes;
  uint64_t v9 = [(NSMutableArray *)childNodes countByEnumeratingWithState:&v12 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(childNodes);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) _syncObjCModelAfterC3DIOSceneLoadingWithNodeRef:*(void *)(*(void *)(*((void *)&v12 + 1) + 8 * i) + 8)];
      }
      uint64_t v9 = [(NSMutableArray *)childNodes countByEnumeratingWithState:&v12 objects:v26 count:16];
    }
    while (v9);
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

void *__59__SCNNode__syncObjCModelAfterC3DIOSceneLoadingWithNodeRef___block_invoke(void *result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = result;
  if (result[7] > a3
    && (id result = objc_msgSend(*(id *)(result[4] + 24), "objectAtIndexedSubscript:"), result[1] == a2))
  {
    *(void *)(*(void *)(v5[6] + 8) + 24) = a3 + 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(v5[5] + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __59__SCNNode__syncObjCModelAfterC3DIOSceneLoadingWithNodeRef___block_invoke_2(uint64_t a1, uint64_t a2)
{
  CFStringRef v3 = +[SCNNode nodeWithNodeRef:a2];
  [(SCNNode *)v3 _setParent:*(void *)(a1 + 32)];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v4 addObject:v3];
}

- (void)__removeObjectFromChildNodesAtIndex:(unint64_t)a3
{
  objc_sync_enter(self);
  uint64_t v5 = self;
  if ([(NSMutableArray *)self->_childNodes count] <= a3)
  {
    BOOL v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNNode __removeObjectFromChildNodesAtIndex:]();
    }
  }
  else
  {
    uint64_t v6 = (void *)[(NSMutableArray *)self->_childNodes objectAtIndex:a3];
    uint64_t v7 = [(SCNNode *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __47__SCNNode___removeObjectFromChildNodesAtIndex___block_invoke;
    void v9[3] = &unk_264005010;
    void v9[4] = v6;
    +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v9];
    [v6 _setParent:0];
    [(NSMutableArray *)self->_childNodes removeObjectAtIndex:a3];
  }
  objc_sync_exit(self);
}

void __47__SCNNode___removeObjectFromChildNodesAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(a1 + 32) nodeRef];
  if (v1)
  {
    C3DNodeRemoveFromParentNode(v1);
  }
  else
  {
    uint64_t v2 = scn_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __47__SCNNode___removeObjectFromChildNodesAtIndex___block_invoke_cold_1();
    }
  }
}

- (void)replaceObjectInChildNodesAtIndex:(unint64_t)a3 withObject:(id)a4
{
  objc_sync_enter(self);
  if (a4)
  {
    if ([(SCNNode *)self canAddChildNode:a4])
    {
      uint64_t v7 = (void *)[(NSMutableArray *)self->_childNodes objectAtIndex:a3];
      if (v7)
      {
        id v8 = a4;
        [a4 removeFromParentNode];
        [v7 _setParent:0];
        [a4 _setParent:self];
        uint64_t v9 = [(SCNNode *)self sceneRef];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __55__SCNNode_replaceObjectInChildNodesAtIndex_withObject___block_invoke;
        v12[3] = &unk_264006138;
        v12[4] = v7;
        v12[5] = a4;
        v12[6] = self;
        +[SCNTransaction postCommandWithContext:v9 object:self applyBlock:v12];
        [(NSMutableArray *)self->_childNodes replaceObjectAtIndex:a3 withObject:a4];
      }
      else
      {
        uint64_t v11 = scn_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[SCNNode replaceObjectInChildNodesAtIndex:withObject:]();
        }
      }
    }
    else
    {
      uint64_t v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SCNNode replaceObjectInChildNodesAtIndex:withObject:]();
      }
    }
  }
  else
  {
    [(SCNNode *)self removeObjectFromChildNodesAtIndex:a3];
  }
  objc_sync_exit(self);
}

void __55__SCNNode_replaceObjectInChildNodesAtIndex_withObject___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) nodeRef];
  uint64_t v3 = [*(id *)(a1 + 40) nodeRef];
  if (v3) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    uint64_t v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __55__SCNNode_replaceObjectInChildNodesAtIndex_withObject___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v6 = (float32x4_t *)v3;
    int IndexOfChildNode = C3DNodeGetIndexOfChildNode(*(void *)(*(void *)(a1 + 48) + 8), (uint64_t)v2);
    CFRetain(v6);
    C3DNodeRemoveFromParentNode(v2);
    C3DNodeRemoveFromParentNode(v6);
    C3DNodeInsertChildNodeAtIndex(*(void *)(*(void *)(a1 + 48) + 8), v6, IndexOfChildNode);
    CFRelease(v6);
  }
}

- (unint64_t)indexOfChildNode:(id)a3
{
  childNodes = self->_childNodes;
  uint64_t v5 = [(NSMutableArray *)childNodes count];
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v6 = v5;
  unint64_t v7 = 0;
  while ((id)[(NSMutableArray *)childNodes objectAtIndex:v7] != a3)
  {
    if (v6 == ++v7) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v7;
}

- (void)removeAllChilds
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(SCNNode *)self childNodes];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) removeFromParentNode];
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)replaceChildNode:(SCNNode *)oldChild with:(SCNNode *)newChild
{
  unint64_t v6 = [(SCNNode *)self indexOfChildNode:oldChild];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(SCNNode *)self replaceObjectInChildNodesAtIndex:v6 withObject:newChild];
  }
}

- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  if (!self->_node || *((char *)self + 41) < 0) {
    return 0;
  }
  v59.i32[2] = 0;
  v59.i64[0] = 0;
  v58.i32[2] = 0;
  v58.i64[0] = 0;
  if (*((unsigned char *)self + 40))
  {
    uint64_t v11 = [(SCNNode *)self sceneRef];
    if (v11)
    {
      uint64_t v12 = (uint64_t)v11;
      C3DSceneLock((uint64_t)v11);
      int v13 = C3DGetBoundingBox(self->_node, 1, (uint64_t)&v59, (uint64_t)&v58);
      C3DSceneUnlock(v12);
      if (v13)
      {
LABEL_11:
        if (a3)
        {
          float v14 = v59.f32[2];
          *(void *)&a3->float x = v59.i64[0];
          a3->float z = v14;
        }
        if (a4)
        {
          float v15 = v58.f32[2];
          *(void *)&a4->float x = v58.i64[0];
          a4->float z = v15;
        }
        return 1;
      }
    }
    else if (C3DGetBoundingBox(self->_node, 1, (uint64_t)&v59, (uint64_t)&v58))
    {
      goto LABEL_11;
    }
    return 0;
  }
  __int32 v57 = 0;
  uint64_t v56 = 0;
  __int32 v55 = 0;
  uint64_t v54 = 0;
  fixedBoundingBoxExtremSCNMatrix4 a = self->_fixedBoundingBoxExtrema;
  if (fixedBoundingBoxExtrema)
  {
    if (a3)
    {
      uint64_t v8 = *(void *)&fixedBoundingBoxExtrema->x;
      a3->float z = fixedBoundingBoxExtrema->z;
      *(void *)&a3->float x = v8;
    }
    if (a4)
    {
      long long v9 = self->_fixedBoundingBoxExtrema;
      uint64_t v10 = *(void *)&v9[1].x;
      a4->float z = v9[1].z;
      *(void *)&a4->float x = v10;
    }
    return 1;
  }
  uint64_t v17 = [(SCNNode *)self geometry];
  v18.i64[0] = 0;
  float32x4_t v40 = v18;
  float v39 = 0.0;
  if (v17 && [(SCNGeometry *)v17 getBoundingBoxMin:a3 max:a4])
  {
    float v39 = 0.0;
    float z = 0.0;
    v19.i64[0] = 0;
    if (a3)
    {
      v19.i64[0] = *(void *)&a3->x;
      float32x4_t v18 = v19;
      float z = a3->z;
      v18.f32[2] = z;
      float32x4_t v59 = v18;
    }
    float32x4_t v36 = v19;
    if (a4)
    {
      v18.i64[0] = *(void *)&a4->x;
      float v39 = a4->z;
      float32x4_t v40 = v18;
      v18.f32[2] = v39;
      float32x4_t v58 = v18;
    }
    else
    {
      v18.i64[0] = 0;
      float32x4_t v40 = v18;
    }
    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = 0;
    float z = 0.0;
    v18.i64[0] = 0;
    float32x4_t v36 = v18;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v21 = [(SCNNode *)self childNodes];
  uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (!v22)
  {
    v25.i64[0] = v40.i64[0];
    if (!v16) {
      return v16;
    }
    goto LABEL_47;
  }
  uint64_t v23 = v22;
  uint64_t v24 = *(void *)v51;
  float32x4_t v25 = v40;
  do
  {
    uint64_t v26 = 0;
    do
    {
      float32x4_t v41 = v25;
      if (*(void *)v51 != v24) {
        objc_enumerationMutation(v21);
      }
      uint64_t v27 = *(void **)(*((void *)&v50 + 1) + 8 * v26);
      if (objc_msgSend(v27, "getBoundingBoxMin:max:", &v56, &v54, *(_OWORD *)&v37))
      {
        v28.i64[0] = v56;
        v28.i32[2] = v57;
        v29.i64[0] = v54;
        v29.i32[2] = v55;
        float32x4_t v48 = v29;
        float32x4_t v49 = v28;
        memset(&v47, 0, sizeof(v47));
        if (v27)
        {
          [v27 transform];
          [v27 pivot];
        }
        else
        {
          memset(&a, 0, sizeof(a));
          memset(&m, 0, sizeof(m));
        }
        SCNMatrix4Invert(&b, &m);
        SCNMatrix4Mult(&v47, &a, &b);
        memset(v43, 0, sizeof(v43));
        C3DMatrix4x4FromSCNMatrix4(v43, (uint64_t)&v47);
        C3DTransformBoundingBox(&v49, &v48, &v49, &v48, v43);
        float32x4_t v30 = v49;
        if (v16)
        {
          float32x4_t v31 = v59;
          v30.i32[3] = 0;
          v31.i32[3] = 0;
          float32x4_t v32 = vminnmq_f32(v30, v31);
          float32x4_t v33 = v48;
          float32x4_t v34 = v58;
          v33.i32[3] = 0;
          v34.i32[3] = 0;
          float32x4_t v25 = vmaxnmq_f32(v33, v34);
          float32x4_t v30 = v32;
        }
        else
        {
          float32x4_t v25 = v48;
        }
        float32x4_t v58 = v25;
        float32x4_t v59 = v30;
        float32x4_t v37 = v30;
        float z = v30.f32[2];
        float v39 = v25.f32[2];
        BOOL v16 = 1;
      }
      else
      {
        float32x4_t v25 = v41;
      }
      ++v26;
    }
    while (v23 != v26);
    float32x4_t v42 = v25;
    uint64_t v35 = [(NSArray *)v21 countByEnumeratingWithState:&v50 objects:v60 count:16];
    float32x4_t v25 = v42;
    uint64_t v23 = v35;
  }
  while (v35);
  if (v16)
  {
LABEL_47:
    if (a3)
    {
      *(void *)&a3->float x = v37.i64[0];
      a3->float z = z;
    }
    if (a4)
    {
      *(void *)&a4->float x = v25.i64[0];
      a4->float z = v39;
    }
  }
  return v16;
}

- (void)setBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  fixedBoundingBoxExtremSCNMatrix4 a = self->_fixedBoundingBoxExtrema;
  if (a3 && a4)
  {
    if (fixedBoundingBoxExtrema)
    {
      BOOL v8 = SCNVector3EqualToVector3(*a3, *fixedBoundingBoxExtrema);
      uint64_t v10 = self->_fixedBoundingBoxExtrema;
      if (v8)
      {
        if (SCNVector3EqualToVector3(*a4, v10[1])) {
          return;
        }
        uint64_t v10 = self->_fixedBoundingBoxExtrema;
      }
    }
    else
    {
      uint64_t v10 = (SCNVector3 *)malloc_type_malloc(0x18uLL, 0x10000403E1C8BA9uLL);
      self->_fixedBoundingBoxExtremSCNMatrix4 a = v10;
    }
    uint64_t v13 = *(void *)&a3->x;
    v10->float z = a3->z;
    *(void *)&v10->float x = v13;
    float v14 = self->_fixedBoundingBoxExtrema;
    uint64_t v15 = *(void *)&a4->x;
    v14[1].float z = a4->z;
    *(void *)&v14[1].float x = v15;
    *(void *)&long long v9 = *(void *)&a3->x;
    DWORD2(v9) = LODWORD(a3->z);
    long long v17 = v9;
    DWORD2(v9) = LODWORD(a4->z);
    uint64_t v11 = [(SCNNode *)self sceneRef];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __33__SCNNode_setBoundingBoxMin_max___block_invoke_2;
    v19[3] = &unk_2640087A8;
    long long v20 = v18;
    long long v21 = v16;
    uint64_t v22 = self;
    uint64_t v12 = v19;
  }
  else
  {
    if (!fixedBoundingBoxExtrema) {
      return;
    }
    free(fixedBoundingBoxExtrema);
    self->_fixedBoundingBoxExtremSCNMatrix4 a = 0;
    uint64_t v11 = [(SCNNode *)self sceneRef];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __33__SCNNode_setBoundingBoxMin_max___block_invoke;
    v23[3] = &unk_264005010;
    v23[4] = self;
    uint64_t v12 = v23;
  }
  +[SCNTransaction postCommandWithContext:v11 object:self applyBlock:v12];
}

void __33__SCNNode_setBoundingBoxMin_max___block_invoke(uint64_t a1)
{
}

__n128 __33__SCNNode_setBoundingBoxMin_max___block_invoke_2(float32x4_t *a1)
{
  float32x4_t v1 = a1[2];
  float32x4_t v2 = a1[3];
  v3.i64[0] = 0x3F0000003F000000;
  v3.i64[1] = 0x3F0000003F000000;
  float32x4_t v4 = vmulq_f32(vaddq_f32(v1, v2), v3);
  float32x4_t v5 = vmulq_f32(vsubq_f32(v2, v1), v3);
  v4.i32[3] = 1.0;
  v5.i32[3] = 0;
  v7[0] = v4;
  v7[1] = v5;
  C3DNodeSetBoundingBox(*(void *)(a1[4].i64[0] + 8), v7, 1);
  return result;
}

- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4
{
  float v11 = 0.0;
  uint64_t v10 = 0;
  float v9 = 0.0;
  BOOL v6 = [(SCNNode *)self simdGetBoundingSphereCenter:&v10 radius:&v9];
  if (v6)
  {
    if (a3)
    {
      float v7 = v11;
      *(void *)&a3->float x = v10;
      a3->float z = v7;
    }
    if (a4) {
      *a4 = v9;
    }
  }
  return v6;
}

- (BOOL)getFrustum:(id *)a3 withViewport:
{
  __n128 v53 = v3;
  __n128 v55 = v3;
  if ([(SCNNode *)self isPresentationInstance])
  {
    BOOL v6 = [(SCNNode *)self nodeRef];
    LOBYTE(v7) = C3DComputeFrustumPlanesFromNode((float32x4_t *)v6, (float32x4_t *)a3, v53);
  }
  else
  {
    float v7 = [(SCNNode *)self camera];
    if (v7)
    {
      ProjectionInfosPtr = (_OWORD *)C3DCameraGetProjectionInfosPtr((uint64_t)[(SCNCamera *)v7 cameraRef]);
      long long v9 = ProjectionInfosPtr[1];
      v54[0] = *ProjectionInfosPtr;
      v54[1] = v9;
      long long v10 = ProjectionInfosPtr[5];
      long long v12 = ProjectionInfosPtr[2];
      long long v11 = ProjectionInfosPtr[3];
      v54[4] = ProjectionInfosPtr[4];
      v54[5] = v10;
      v54[2] = v12;
      v54[3] = v11;
      long long v13 = ProjectionInfosPtr[9];
      long long v15 = ProjectionInfosPtr[6];
      long long v14 = ProjectionInfosPtr[7];
      v54[8] = ProjectionInfosPtr[8];
      v54[9] = v13;
      v54[6] = v15;
      v54[7] = v14;
      long long v16 = ProjectionInfosPtr[13];
      long long v18 = ProjectionInfosPtr[10];
      long long v17 = ProjectionInfosPtr[11];
      v54[12] = ProjectionInfosPtr[12];
      v54[13] = v16;
      v54[10] = v18;
      v54[11] = v17;
      Matrifloat x = C3DProjectionInfosGetMatrix((char *)v54, (uint64_t)&v55, 0);
      [(SCNNode *)self simdWorldTransform];
      simd_float4x4 v63 = __invert_f4(v62);
      uint64_t v20 = 0;
      float32x4_t v21 = *(float32x4_t *)Matrix;
      float32x4_t v22 = *((float32x4_t *)Matrix + 1);
      float32x4_t v23 = *((float32x4_t *)Matrix + 2);
      float32x4_t v24 = *((float32x4_t *)Matrix + 3);
      simd_float4x4 v56 = v63;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      do
      {
        *(long long *)((char *)&v57 + v20 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(_OWORD *)&v56.columns[v20])), v22, *(float32x2_t *)v56.columns[v20].f32, 1), v23, (float32x4_t)v56.columns[v20], 2), v24, (float32x4_t)v56.columns[v20], 3);
        ++v20;
      }
      while (v20 != 4);
      float v26 = *((float *)&v57 + 2);
      float v25 = *((float *)&v58 + 2);
      float v28 = *((float *)&v59 + 2);
      float v27 = *((float *)&v60 + 2);
      float v29 = *((float *)&v57 + 3);
      v30.f32[0] = *((float *)&v57 + 3) - *(float *)&v57;
      float v31 = *((float *)&v58 + 3);
      float v32 = *((float *)&v59 + 3);
      float v33 = *((float *)&v60 + 3);
      v30.f32[1] = *((float *)&v58 + 3) - *(float *)&v58;
      v30.f32[2] = *((float *)&v59 + 3) - *(float *)&v59;
      v30.f32[3] = *((float *)&v60 + 3) - *(float *)&v60;
      int32x4_t v34 = (int32x4_t)vmulq_f32(v30, v30);
      v34.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v34, 2), vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1))).u32[0];
      float32x2_t v35 = vrsqrte_f32((float32x2_t)v34.u32[0]);
      *(float32x2_t *)v36.f32 = vmul_f32(v35, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v35, v35)));
      v34.i32[0] = vmul_f32(*(float32x2_t *)v36.f32, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(*(float32x2_t *)v36.f32, *(float32x2_t *)v36.f32))).u32[0];
      v36.f32[0] = *((float *)&v57 + 3) + *(float *)&v57;
      v36.f32[1] = *((float *)&v58 + 3) + *(float *)&v58;
      v36.f32[2] = *((float *)&v59 + 3) + *(float *)&v59;
      v36.f32[3] = *((float *)&v60 + 3) + *(float *)&v60;
      float32x4_t v37 = vmulq_f32(v36, v36);
      v37.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v37, 2), vadd_f32(*(float32x2_t *)v37.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v37.f32, 1))).u32[0];
      float32x4_t v38 = vmulq_n_f32(v30, *(float *)v34.i32);
      *(float32x2_t *)v34.i8 = vrsqrte_f32((float32x2_t)v37.u32[0]);
      *(float32x2_t *)v34.i8 = vmul_f32(*(float32x2_t *)v34.i8, vrsqrts_f32((float32x2_t)v37.u32[0], vmul_f32(*(float32x2_t *)v34.i8, *(float32x2_t *)v34.i8)));
      float32x4_t v39 = vmulq_n_f32(v36, vmul_f32(*(float32x2_t *)v34.i8, vrsqrts_f32((float32x2_t)v37.u32[0], vmul_f32(*(float32x2_t *)v34.i8, *(float32x2_t *)v34.i8))).f32[0]);
      v36.i32[0] = DWORD1(v57);
      v37.f32[0] = *((float *)&v57 + 3) + *((float *)&v57 + 1);
      float v40 = *((float *)&v58 + 1);
      float v41 = *((float *)&v59 + 1);
      v37.f32[1] = *((float *)&v58 + 3) + *((float *)&v58 + 1);
      float v42 = *((float *)&v60 + 1);
      v37.f32[2] = *((float *)&v59 + 3) + *((float *)&v59 + 1);
      v37.f32[3] = *((float *)&v60 + 3) + *((float *)&v60 + 1);
      a3->var0[0] = ($9BBE2667FA0C53BBDA0194B766E02F4A)v38;
      a3->var0[1] = ($9BBE2667FA0C53BBDA0194B766E02F4A)v39;
      int32x4_t v43 = (int32x4_t)vmulq_f32(v37, v37);
      v43.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v43, 2), vadd_f32(*(float32x2_t *)v43.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v43.i8, 1))).u32[0];
      *(float32x2_t *)v39.f32 = vrsqrte_f32((float32x2_t)v43.u32[0]);
      *(float32x2_t *)v39.f32 = vmul_f32(*(float32x2_t *)v39.f32, vrsqrts_f32((float32x2_t)v43.u32[0], vmul_f32(*(float32x2_t *)v39.f32, *(float32x2_t *)v39.f32)));
      v43.i32[0] = vmul_f32(*(float32x2_t *)v39.f32, vrsqrts_f32((float32x2_t)v43.u32[0], vmul_f32(*(float32x2_t *)v39.f32, *(float32x2_t *)v39.f32))).u32[0];
      v39.f32[0] = v29 - v36.f32[0];
      v39.f32[1] = v31 - v40;
      v39.f32[2] = v32 - v41;
      v39.f32[3] = v33 - v42;
      float32x4_t v44 = vmulq_f32(v39, v39);
      v44.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v44, 2), vadd_f32(*(float32x2_t *)v44.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v44.f32, 1))).u32[0];
      float32x4_t v45 = vmulq_n_f32(v37, *(float *)v43.i32);
      *(float32x2_t *)v37.f32 = vrsqrte_f32((float32x2_t)v44.u32[0]);
      *(float32x2_t *)v37.f32 = vmul_f32(*(float32x2_t *)v37.f32, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(*(float32x2_t *)v37.f32, *(float32x2_t *)v37.f32)));
      float32x4_t v46 = vmulq_n_f32(v39, vmul_f32(*(float32x2_t *)v37.f32, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(*(float32x2_t *)v37.f32, *(float32x2_t *)v37.f32))).f32[0]);
      v44.f32[0] = v29 - v26;
      v44.f32[1] = v31 - v25;
      v44.f32[2] = v32 - v28;
      v44.f32[3] = v33 - v27;
      a3->var0[2] = ($9BBE2667FA0C53BBDA0194B766E02F4A)v45;
      a3->var0[3] = ($9BBE2667FA0C53BBDA0194B766E02F4A)v46;
      int32x4_t v47 = (int32x4_t)vmulq_f32(v44, v44);
      v47.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v47, 2), vadd_f32(*(float32x2_t *)v47.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v47.i8, 1))).u32[0];
      *(float32x2_t *)v46.f32 = vrsqrte_f32((float32x2_t)v47.u32[0]);
      *(float32x2_t *)v46.f32 = vmul_f32(*(float32x2_t *)v46.f32, vrsqrts_f32((float32x2_t)v47.u32[0], vmul_f32(*(float32x2_t *)v46.f32, *(float32x2_t *)v46.f32)));
      v48.f32[0] = v29 + v26;
      v48.f32[1] = v31 + v25;
      v48.f32[2] = v32 + v28;
      v48.f32[3] = v33 + v27;
      int32x4_t v49 = (int32x4_t)vmulq_f32(v48, v48);
      v49.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v49, 2), vadd_f32(*(float32x2_t *)v49.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v49.i8, 1))).u32[0];
      float32x2_t v50 = vrsqrte_f32((float32x2_t)v49.u32[0]);
      float32x2_t v51 = vmul_f32(v50, vrsqrts_f32((float32x2_t)v49.u32[0], vmul_f32(v50, v50)));
      a3->var0[4] = ($9BBE2667FA0C53BBDA0194B766E02F4A)vmulq_n_f32(v44, vmul_f32(*(float32x2_t *)v46.f32, vrsqrts_f32((float32x2_t)v47.u32[0], vmul_f32(*(float32x2_t *)v46.f32, *(float32x2_t *)v46.f32))).f32[0]);
      a3->var0[5] = ($9BBE2667FA0C53BBDA0194B766E02F4A)vmulq_n_f32(v48, vmul_f32(v51, vrsqrts_f32((float32x2_t)v49.u32[0], vmul_f32(v51, v51))).f32[0]);
      LOBYTE(v7) = 1;
    }
  }
  return (char)v7;
}

- (id)getBoundingSphere
{
  int v10 = 0;
  double v8 = 0.0;
  uint64_t v9 = 0;
  BOOL v2 = [(SCNNode *)self getBoundingSphereCenter:&v9 radius:&v8];
  id result = 0;
  if (v2)
  {
    float32x4_t v4 = objc_alloc_init(SCNBoundingSphere);
    LODWORD(v6) = HIDWORD(v9);
    LODWORD(v5) = v9;
    LODWORD(v7) = v10;
    -[SCNBoundingSphere setCenter:](v4, "setCenter:", v5, v6, v7);
    [(SCNBoundingSphere *)v4 setRadius:v8];
    return v4;
  }
  return result;
}

- (id)getBoundingBox
{
  int v14 = 0;
  uint64_t v13 = 0;
  int v12 = 0;
  uint64_t v11 = 0;
  BOOL v2 = [(SCNNode *)self getBoundingBoxMin:&v13 max:&v11];
  id result = 0;
  if (v2)
  {
    float32x4_t v4 = objc_alloc_init(SCNBoundingBox);
    LODWORD(v6) = HIDWORD(v13);
    LODWORD(v5) = v13;
    LODWORD(v7) = v14;
    -[SCNBoundingBox setMin:](v4, "setMin:", v5, v6, v7);
    LODWORD(v9) = HIDWORD(v11);
    LODWORD(v8) = v11;
    LODWORD(v10) = v12;
    -[SCNBoundingBox setMax:](v4, "setMax:", v8, v9, v10);
    return v4;
  }
  return result;
}

- (SCNNode)flattenedClone
{
  id v3 = [(SCNNode *)self copy];
  [v3 setGeometry:objc_alloc_init(SCNGeometry)];
  node = self->_node;
  double v5 = [(SCNNode *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _OWORD v7[2] = __25__SCNNode_flattenedClone__block_invoke;
  v7[3] = &unk_264006160;
  v7[4] = node;
  v7[5] = v3;
  +[SCNTransaction postCommandWithContext:v5 object:v3 applyBlock:v7];
  return (SCNNode *)v3;
}

void __25__SCNNode_flattenedClone__block_invoke(uint64_t a1)
{
  BOOL v2 = (__C3DGeometry *)_C3DCreateFlattenedGeometryFromNodeHierarchy(*(float32x4_t **)(a1 + 32), 0, 0, 0);
  if (v2)
  {
    id v3 = v2;
    C3DNodeSetGeometry([*(id *)(a1 + 40) nodeRef], v2);
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "geometry"), "setGeometryRef:", v3);
    CFRelease(v3);
  }
}

- (id)flattenedCopy
{
  BOOL v2 = [(SCNNode *)self flattenedClone];

  return v2;
}

- (id)_subdividedCopyWithSubdivisionLevel:(int64_t)a3
{
  unsigned __int16 v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  double v5 = [(SCNNode *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  SubdividedCopfloat y = C3DNodeCreateSubdividedCopy((uint64_t)self->_node, v3);
  double v8 = +[SCNNode nodeWithNodeRef:SubdividedCopy];
  if (SubdividedCopy) {
    CFRelease(SubdividedCopy);
  }
  if ([(SCNNode *)v8 skinner]) {
    [(SCNSkinner *)[(SCNNode *)v8 skinner] setSkeleton:[(SCNSkinner *)[(SCNNode *)self skinner] skeleton]];
  }
  [(SCNNode *)v8 _copyAnimationsFrom:self];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v9 = [(SCNNode *)self actionKeys];
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        [(SCNNode *)v8 runAction:[(SCNNode *)self actionForKey:*(void *)(*((void *)&v15 + 1) + 8 * v13)] forKey:*(void *)(*((void *)&v15 + 1) + 8 * v13)];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
  if (v6) {
    C3DSceneUnlock(v6);
  }
  return v8;
}

- (void)_setPausedOrPausedByInheritance:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unsigned int v3 = *((unsigned __int8 *)self + 40);
  if (a3 != v3 >> 7)
  {
    BOOL v4 = a3;
    char v6 = a3 ? 0x80 : 0;
    *((unsigned char *)self + 40) = v6 & 0x80 | v3 & 0x7F;
    double v7 = [(SCNNode *)self sceneRef];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __43__SCNNode__setPausedOrPausedByInheritance___block_invoke;
    v18[3] = &unk_264004FE8;
    v18[4] = self;
    BOOL v19 = v4;
    +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v18];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v8 = [(SCNNode *)self childNodes];
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (([v13 isPaused] & 1) == 0) {
            [v13 _setPausedOrPausedByInheritance:v4];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v10);
    }
  }
}

uint64_t __43__SCNNode__setPausedOrPausedByInheritance___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  BOOL v2 = (void *)[*(id *)(a1 + 32) animationKeys];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 32) _pauseAnimation:*(unsigned __int8 *)(a1 + 40) forKey:*(void *)(*((void *)&v28 + 1) + 8 * i) pausedByNode:1];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v4);
  }
  C3DTransactionGetAtomicTime();
  double v8 = v7;
  uint64_t v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 192) allValues];
  uint64_t v10 = v9;
  if (*(unsigned char *)(a1 + 40))
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t result = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (result)
    {
      uint64_t v12 = result;
      uint64_t v13 = *(void *)v25;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v24 + 1) + 8 * v14);
          if (([v15 finished] & 1) == 0) {
            SCNActionWasPausedAtTime(v15, *(SCNNode **)(a1 + 32), v8);
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t result = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
        uint64_t v12 = result;
      }
      while (result);
    }
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t result = [v9 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (result)
    {
      uint64_t v16 = result;
      uint64_t v17 = *(void *)v21;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v10);
          }
          BOOL v19 = *(void **)(*((void *)&v20 + 1) + 8 * v18);
          if (([v19 finished] & 1) == 0) {
            SCNActionWillResumeAtTime(v19, *(SCNNode **)(a1 + 32), v8);
          }
          ++v18;
        }
        while (v16 != v18);
        uint64_t result = [v10 countByEnumeratingWithState:&v20 objects:v32 count:16];
        uint64_t v16 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)setPaused:(BOOL)paused
{
  char v3 = *((unsigned char *)self + 40);
  if (((((v3 & 0x40) == 0) ^ paused) & 1) == 0)
  {
    if (paused) {
      char v5 = 64;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 40) = v3 & 0xBF | v5;
    uint64_t v6 = [[(SCNNode *)self parentNode] isPausedOrPausedByInheritance] | paused;
    [(SCNNode *)self _setPausedOrPausedByInheritance:v6];
  }
}

- (BOOL)isPausedOrPausedByInheritance
{
  return *((unsigned __int8 *)self + 40) >> 7;
}

- (BOOL)isPaused
{
  return (*((unsigned __int8 *)self + 40) >> 6) & 1;
}

- (CGRect)_focusFrameInView:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v33[1].i32[0] = 0;
  v33[0] = 0;
  memset(v32, 0, 12);
  if ([(SCNNode *)self getBoundingBoxMin:v33 max:v32])
  {
    *(void *)&long long v6 = __PAIR64__(v32[0], v33[1].u32[0]);
    float32x2_t v34 = (float32x2_t)v33[0];
    __int32 v38 = v33[1].i32[0];
    v5.i64[0] = *(void *)((char *)v32 + 4);
    *(void *)&long long v7 = __PAIR64__(v33[1].u32[0], HIDWORD(v32[0]));
    *((int32x2_t *)&v6 + 1) = *(int32x2_t *)((char *)v33 + 4);
    long long v35 = v6;
    __int32 v36 = v33[0].i32[0];
    *((void *)&v7 + 1) = v32[0];
    long long v37 = v7;
    int32x2_t v39 = v33[0];
    int v40 = v32[1];
    int v41 = v32[0];
    *(int32x2_t *)&long long v8 = vzip2_s32(v33[0], *(int32x2_t *)((char *)v32 + 4));
    *((int32x2_t *)&v8 + 1) = vzip1_s32(v33[0], *(int32x2_t *)((char *)v32 + 4));
    int32x4_t v9 = vuzp2q_s32(v5, vzip1q_s32(v5, v5));
    int32x4_t v10 = v9;
    v10.i32[1] = v32[0];
    v10.i32[3] = v9.i32[0];
    long long v42 = v8;
    int32x4_t v43 = v10;
    [(SCNNode *)self simdWorldTransform];
    float32x4_t v30 = v13;
    float32x4_t v31 = v12;
    float32x4_t v28 = v14;
    float32x4_t v29 = v11;
    for (uint64_t i = 0; i != 24; i += 3)
    {
      uint64_t v16 = (float32x2_t *)((char *)&v34 + i * 4);
      float32x4_t v17 = vaddq_f32(v28, vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v31, v34.f32[i]), v30, v34.f32[i + 1]), v29, *(float *)((char *)&v34 + i * 4 + 8)));
      v11.i32[0] = v17.i32[2];
      objc_msgSend(a3, "projectPoint:", *(double *)v17.i64, COERCE_DOUBLE(__PAIR64__(v28.u32[1], v17.u32[1])), *(double *)v11.i64, *(_OWORD *)&v28, *(_OWORD *)&v29, *(_OWORD *)&v30, *(_OWORD *)&v31);
      v16->i32[0] = v18;
      v16->i32[1] = v19;
      v16[1].i32[0] = v11.i32[0];
    }
    float64x2_t v20 = vcvtq_f64_f32(v34);
    uint64_t v21 = 12;
    double v22 = v20.f64[0];
    float64x2_t v23 = v20;
    do
    {
      float64x2_t v24 = vcvtq_f64_f32(*(float32x2_t *)((char *)&v34 + v21));
      float64x2_t v23 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v24, v23), (int8x16_t)v23, (int8x16_t)v24);
      if (v22 < v24.f64[0]) {
        double v22 = v24.f64[0];
      }
      v21 += 12;
    }
    while (v21 != 96);
    double v25 = v22 - v23.f64[0];
    double v26 = v23.f64[1];
    double v27 = vsubq_f64(v20, v23).f64[1];
  }
  else
  {
    v23.f64[0] = 0.0;
    double v26 = 0.0;
    double v25 = 0.0;
    double v27 = 0.0;
  }
  result.origin.float x = v23.f64[0];
  result.size.height = v27;
  result.size.width = v25;
  result.origin.float y = v26;
  return result;
}

- (void)_appendFocusableNodesInRect:(CGRect)a3 ofView:(id)a4 toFocusItems:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ((*((unsigned char *)self + 42) & 0x20) != 0)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    if ([(SCNNode *)self isFocusInteractionEnabled])
    {
      if (![(SCNNode *)self _isEffectivelyHidden])
      {
        [(SCNNode *)self _focusFrameInView:a4];
        v24.origin.double x = x;
        v24.origin.double y = y;
        v24.size.double width = width;
        v24.size.double height = height;
        if (CGRectIntersectsRect(v23, v24)) {
          [a5 addObject:self];
        }
      }
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    childNodes = self->_childNodes;
    uint64_t v13 = [(NSMutableArray *)childNodes countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(childNodes);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "_appendFocusableNodesInRect:ofView:toFocusItems:", a4, a5, x, y, width, height);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)childNodes countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }
  }
}

- (void)_setHasFocusableChild
{
  if ((*((unsigned char *)self + 42) & 0x20) == 0)
  {
    *((unsigned char *)self + 42) |= 0x20u;
    [(SCNNode *)self->_parent _setHasFocusableChild];
  }
}

- (void)_updateFocusableCache
{
}

- (BOOL)canBecomeFocused
{
  return (*((unsigned char *)self + 42) & 0x18) == 16;
}

- (BOOL)isFocusInteractionEnabled
{
  return (*((unsigned char *)self + 42) & 0x18) != 0;
}

- (BOOL)_isEffectivelyHidden
{
  if ([[(SCNNode *)self parentNode] _isEffectivelyHidden]
    || [(SCNNode *)self isHidden])
  {
    return 1;
  }
  [(SCNNode *)self opacity];
  return v4 <= 0.00000011920929;
}

- (id)preferredFocusEnvironments
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = self;
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
}

- (id)parentFocusEnvironment
{
  if ([(SCNNode *)self parentNode])
  {
    return [(SCNNode *)self parentNode];
  }
  else
  {
    return +[SCNView _currentSCNViewFocusEnvironment];
  }
}

- (void)setNeedsFocusUpdate
{
  char v3 = (void *)[MEMORY[0x263F1C650] focusSystemForEnvironment:self];

  [v3 requestFocusUpdateToEnvironment:self];
}

- (void)updateFocusIfNeeded
{
  BOOL v2 = (void *)[MEMORY[0x263F1C650] focusSystemForEnvironment:self];

  [v2 updateFocusIfNeeded];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (BOOL)_isEligibleForFocusInteraction
{
  if ((*((unsigned char *)self + 42) & 0x20) != 0) {
    return ![(SCNNode *)self _isEffectivelyHidden];
  }
  else {
    return 0;
  }
}

- (CGRect)frame
{
  id v3 = +[SCNView _currentSCNViewFocusEnvironment];
  uint64_t v4 = objc_msgSend(-[SCNNode focusItemContainer](self, "focusItemContainer"), "coordinateSpace");
  if (v4 != [v3 coordinateSpace])
  {
    int32x4_t v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(SCNNode *)v5 frame];
    }
  }
  [(SCNNode *)self _focusFrameInView:v3];
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (UICoordinateSpace)coordinateSpace
{
  BOOL v2 = objc_msgSend(+[SCNView _currentSCNViewFocusEnvironment](SCNView, "_currentSCNViewFocusEnvironment"), "focusItemContainer");

  return (UICoordinateSpace *)[v2 coordinateSpace];
}

- (id)focusItemsInRect:(CGRect)a3
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)runAction:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  if (a4)
  {
    id v8 = a4;
    [(SCNNode *)self removeActionForKey:a4];
    if (!a3)
    {
LABEL_10:
      if (a5)
      {
        uint64_t v12 = (void (*)(id))*((void *)a5 + 2);
        v12(a5);
      }
      return;
    }
  }
  else
  {
    if (!a3) {
      goto LABEL_10;
    }
    id v8 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString");
  }
  uint64_t v9 = (void *)[a3 copy];
  [v9 setCompletionBlock:a5];
  [v9 setKey:v8];
  objc_sync_enter(self);
  actions = self->_actions;
  if (!actions)
  {
    actions = objc_alloc_init(SCNOrderedDictionary);
    self->_actions = actions;
  }
  [(SCNOrderedDictionary *)actions setValue:v9 forKey:v8];
  objc_sync_exit(self);
  uint64_t v11 = [(SCNNode *)self sceneRef];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__SCNNode_runAction_forKey_completionHandler___block_invoke;
  v13[3] = &unk_264006138;
  v13[4] = self;
  void v13[5] = v9;
  v13[6] = v8;
  +[SCNTransaction postCommandWithContext:v11 object:self applyBlock:v13];
}

uint64_t __46__SCNNode_runAction_forKey_completionHandler___block_invoke(uint64_t a1)
{
  C3DEntityAddAction((void *)[*(id *)(a1 + 32) nodeRef], *(const void **)(a1 + 40), *(void **)(a1 + 48));
  uint64_t v4 = a1 + 32;
  BOOL v2 = *(SCNNode **)(a1 + 32);
  id v3 = *(void **)(v4 + 8);
  C3DTransactionGetAtomicTime();

  return SCNActionWasAddedToTargetAtTime(v3, v2);
}

- (void)runAction:(id)a3
{
}

- (void)runAction:(id)a3 completionHandler:(id)a4
{
}

- (void)runAction:(id)a3 forKey:(id)a4
{
}

- (id)actions
{
  return [(SCNOrderedDictionary *)self->_actions allValues];
}

- (BOOL)hasActions
{
  return [(SCNOrderedDictionary *)self->_actions count] != 0;
}

- (id)actionForKey:(id)a3
{
  objc_sync_enter(self);
  id v5 = [(SCNOrderedDictionary *)self->_actions objectForKey:a3];
  objc_sync_exit(self);
  return v5;
}

- (void)_removeAction:(id)a3 forKey:(id)a4
{
  objc_sync_enter(self);
  if ([(SCNOrderedDictionary *)self->_actions objectForKey:a4] == a3)
  {
    [(SCNOrderedDictionary *)self->_actions removeObjectForKey:a4];
    objc_sync_exit(self);
    if (a3)
    {
      uint64_t v7 = [(SCNNode *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __32__SCNNode__removeAction_forKey___block_invoke;
      v8[3] = &unk_264006138;
      void v8[4] = self;
      void v8[5] = a3;
      void v8[6] = a4;
      +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v8];
    }
  }
  else
  {
    objc_sync_exit(self);
  }
}

void __32__SCNNode__removeAction_forKey___block_invoke(uint64_t a1)
{
  BOOL v2 = (CFTypeRef *)[*(id *)(a1 + 32) nodeRef];
  id v3 = *(const void **)(a1 + 40);
  uint64_t v4 = *(const char **)(a1 + 48);

  _C3DEntityCleanupActionForKey(v2, v3, v4);
}

- (void)removeActionForKey:(id)a3
{
  objc_sync_enter(self);
  id v5 = [(SCNOrderedDictionary *)self->_actions objectForKey:a3];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    [(SCNOrderedDictionary *)self->_actions removeObjectForKey:a3];
    objc_sync_exit(self);
    id v8 = [(SCNNode *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __30__SCNNode_removeActionForKey___block_invoke;
    void v9[3] = &unk_264006138;
    void v9[4] = self;
    void v9[5] = a3;
    void v9[6] = v6;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v9];
  }
  else
  {
    objc_sync_exit(self);
  }
}

void __30__SCNNode_removeActionForKey___block_invoke(uint64_t a1)
{
  C3DEntityRemoveActionForKey((void *)[*(id *)(a1 + 32) nodeRef], *(void **)(a1 + 40));
  BOOL v2 = *(void **)(a1 + 48);
  id v3 = *(id **)(a1 + 32);
  C3DTransactionGetAtomicTime();
  SCNActionWasRemovedFromTargetAtTime(v2, v3, v4);
  id v5 = *(void **)(a1 + 48);
}

- (void)removeAllActions
{
  objc_sync_enter(self);
  uint64_t v3 = objc_msgSend(-[SCNOrderedDictionary dictionary](self->_actions, "dictionary"), "copy");
  [(SCNOrderedDictionary *)self->_actions removeAllObjects];
  objc_sync_exit(self);
  double v4 = [(SCNNode *)self sceneRef];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27__SCNNode_removeAllActions__block_invoke;
  v5[3] = &unk_264006160;
  v5[4] = self;
  void v5[5] = v3;
  +[SCNTransaction postCommandWithContext:v4 object:self applyBlock:v5];
}

void __27__SCNNode_removeAllActions__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  C3DEntityRemoveAllActions((void *)[*(id *)(a1 + 32) nodeRef]);
  C3DTransactionGetAtomicTime();
  double v3 = v2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v4 = objc_msgSend(*(id *)(a1 + 40), "allValues", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        SCNActionWasRemovedFromTargetAtTime(*(void **)(*((void *)&v9 + 1) + 8 * v8++), *(id **)(a1 + 32), v3);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void __26__SCNNode_setConstraints___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  double v2 = *(void **)(a1 + 32);
  if (v2)
  {
    double v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "constraintRef"));
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
    C3DNodeSetConstraints(*(void *)(*(void *)(a1 + 40) + 8), (const __CFDictionary *)v3);
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    C3DNodeSetConstraints(v9, 0);
  }
}

uint64_t __27__SCNNode_setPhysicsField___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeOwner];
  double v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 _setOwner:v3];
}

- (GKEntity)entity
{
  return (GKEntity *)[(SCNNode *)self _findComponentWithType:10];
}

- (void)setEntity:(GKEntity *)entity
{
  if ([(SCNNode *)self entity] != entity)
  {
    [(SCNNode *)self _removeComponentWithType:10];
    if (entity)
    {
      [(SCNNode *)self _assignComponent:entity toContainerWithType:10];
    }
  }
}

- (void)_removeDeadParticleSystem:(__C3DParticleSystem *)a3
{
  objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "removeObject:", +[SCNParticleSystem particleSystemWithParticleSystemRef:](SCNParticleSystem, "particleSystemWithParticleSystemRef:"));
  uint64_t v5 = [(SCNNode *)self nodeRef];

  C3DNodeRemoveParticleSystem((uint64_t)v5, a3, 0);
}

- (void)addParticleSystem:(SCNParticleSystem *)system
{
  if (system)
  {
    uint64_t v5 = [(SCNNode *)self sceneRef];
    uint64_t v6 = (uint64_t)v5;
    if (v5) {
      C3DSceneLock((uint64_t)v5);
    }
    id v7 = [(SCNNode *)self _particleSystems];
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      [(SCNNode *)self _assignComponent:v7 toContainerWithType:6];
    }
    [v7 addObject:system];
    if (v6) {
      C3DSceneUnlock(v6);
    }
    uint64_t v8 = [(SCNNode *)self sceneRef];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __29__SCNNode_addParticleSystem___block_invoke;
    v10[3] = &unk_264006160;
    _OWORD v10[4] = self;
    v10[5] = system;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v10];
  }
  else
  {
    uint64_t v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNNode addParticleSystem:]();
    }
  }
}

void __29__SCNNode_addParticleSystem___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) nodeRef];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "__CFObject");

  C3DNodeAddParticleSystem(v2, v3);
}

- (void)removeAllParticleSystems
{
  uint64_t v3 = [(SCNNode *)self sceneRef];
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    C3DSceneLock((uint64_t)v3);
    [(SCNNode *)self _removeComponentWithType:6];
    C3DSceneUnlock(v4);
  }
  else
  {
    [(SCNNode *)self _removeComponentWithType:6];
  }
  uint64_t v5 = [(SCNNode *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__SCNNode_removeAllParticleSystems__block_invoke;
  v6[3] = &unk_264005010;
  v6[4] = self;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __35__SCNNode_removeAllParticleSystems__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) nodeRef];

  C3DNodeRemoveAllParticleSystems(v1);
}

- (void)removeParticleSystem:(SCNParticleSystem *)system
{
  uint64_t v5 = [(SCNNode *)self sceneRef];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    C3DSceneLock((uint64_t)v5);
    objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "removeObject:", system);
    C3DSceneUnlock(v6);
  }
  else
  {
    objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "removeObject:", system);
  }
  id v7 = [(SCNNode *)self sceneRef];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __32__SCNNode_removeParticleSystem___block_invoke;
  v8[3] = &unk_264006160;
  void v8[4] = self;
  void v8[5] = system;
  +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v8];
}

void __32__SCNNode_removeParticleSystem___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) nodeRef];
  uint64_t v3 = (const void *)objc_msgSend(*(id *)(a1 + 40), "__CFObject");

  C3DNodeRemoveParticleSystem(v2, v3, 1);
}

- (unint64_t)countOfParticleSystems
{
  id v2 = [(SCNNode *)self _particleSystems];

  return [v2 count];
}

- (id)objectInParticleSystemsAtIndex:(unint64_t)a3
{
  id v4 = [(SCNNode *)self _particleSystems];

  return (id)[v4 objectAtIndex:a3];
}

- (void)insertObject:(id)a3 inParticleSystemsAtIndex:(unint64_t)a4
{
  id v7 = [(SCNNode *)self sceneRef];
  uint64_t v8 = (uint64_t)v7;
  if (v7) {
    C3DSceneLock((uint64_t)v7);
  }
  id v9 = [(SCNNode *)self _particleSystems];
  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(SCNNode *)self _assignComponent:v9 toContainerWithType:6];
  }
  [v9 insertObject:a3 atIndex:a4];
  if (v8) {
    C3DSceneUnlock(v8);
  }
  long long v10 = [(SCNNode *)self sceneRef];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__SCNNode_insertObject_inParticleSystemsAtIndex___block_invoke;
  v11[3] = &unk_264004E20;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = a4;
  +[SCNTransaction postCommandWithContext:v10 object:self applyBlock:v11];
}

void __49__SCNNode_insertObject_inParticleSystemsAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) nodeRef];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "__CFObject");
  CFIndex v4 = *(void *)(a1 + 48);

  C3DNodeInsertParticleSystemAtIndex(v2, v3, v4);
}

- (void)removeObjectFromParticleSystemsAtIndex:(unint64_t)a3
{
  if (objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "count") <= a3)
  {
    uint64_t v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[SCNNode removeObjectFromParticleSystemsAtIndex:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  long long v13 = [(SCNNode *)self sceneRef];
  if (v13)
  {
    uint64_t v14 = (uint64_t)v13;
    C3DSceneLock((uint64_t)v13);
    objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "removeObjectAtIndex:", a3);
    C3DSceneUnlock(v14);
  }
  else
  {
    objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "removeObjectAtIndex:", a3);
  }
  uint64_t v15 = [(SCNNode *)self sceneRef];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __50__SCNNode_removeObjectFromParticleSystemsAtIndex___block_invoke;
  v16[3] = &unk_264004FC0;
  v16[4] = self;
  void v16[5] = a3;
  +[SCNTransaction postCommandWithContext:v15 object:self applyBlock:v16];
}

void __50__SCNNode_removeObjectFromParticleSystemsAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) nodeRef];
  CFIndex v3 = *(void *)(a1 + 40);

  C3DNodeRemoveParticleSystemAtIndex(v2, v3, 1);
}

- (void)replaceObjectInParticleSystemsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  if (!a4)
  {
    uint64_t v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[SCNNode replaceObjectInParticleSystemsAtIndex:withObject:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  uint64_t v15 = [(SCNNode *)self sceneRef];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__SCNNode_replaceObjectInParticleSystemsAtIndex_withObject___block_invoke;
  v18[3] = &unk_264004E20;
  v18[4] = self;
  void v18[5] = a4;
  v18[6] = a3;
  +[SCNTransaction postCommandWithContext:v15 object:self applyBlock:v18];
  double v16 = [(SCNNode *)self sceneRef];
  if (v16)
  {
    uint64_t v17 = (uint64_t)v16;
    C3DSceneLock((uint64_t)v16);
    objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "replaceObjectAtIndex:withObject:", a3, a4);
    C3DSceneUnlock(v17);
  }
  else
  {
    objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "replaceObjectAtIndex:withObject:", a3, a4);
  }
}

void __60__SCNNode_replaceObjectInParticleSystemsAtIndex_withObject___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) nodeRef];
  CFIndex v3 = objc_msgSend(*(id *)(a1 + 40), "__CFObject");
  CFIndex v4 = *(void *)(a1 + 48);

  C3DNodeReplaceParticleSystemAtIndex(v2, v3, v4);
}

- (id)_audioPlayers
{
  CFIndex v3 = [(SCNNode *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  uint64_t v5 = [(SCNNode *)self nodeRef];
  if (!v5)
  {
    id v6 = 0;
    if (!v4) {
      return v6;
    }
    goto LABEL_5;
  }
  id v6 = (id)[(__CFDictionary *)C3DNodeGetAudioPlayers((uint64_t)v5) copy];
  if (v4) {
LABEL_5:
  }
    C3DSceneUnlock(v4);
  return v6;
}

- (void)addAudioPlayer:(SCNAudioPlayer *)player
{
  if (player)
  {
    uint64_t v5 = [(SCNNode *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    _OWORD v7[2] = __26__SCNNode_addAudioPlayer___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = player;
    v7[5] = self;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
  else
  {
    id v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNNode addAudioPlayer:]();
    }
  }
}

uint64_t __26__SCNNode_addAudioPlayer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) nodeRef];
  if (v2) {
    C3DNodeRemoveAudioPlayer(v2, *(const void **)(a1 + 32), 1);
  }
  uint64_t v3 = [*(id *)(a1 + 40) nodeRef];
  [*(id *)(a1 + 32) setNodeRef:v3];
  uint64_t v4 = *(void **)(a1 + 32);

  return C3DNodeAddAudioPlayer(v3, v4);
}

- (void)removeAllAudioPlayers
{
  uint64_t v3 = [(SCNNode *)self sceneRef];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__SCNNode_removeAllAudioPlayers__block_invoke;
  v4[3] = &unk_264005010;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:v3 object:self applyBlock:v4];
}

void __32__SCNNode_removeAllAudioPlayers__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) nodeRef];

  C3DNodeRemoveAllAudioPlayers(v1);
}

- (void)removeAudioPlayer:(SCNAudioPlayer *)player
{
  uint64_t v5 = [(SCNNode *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __29__SCNNode_removeAudioPlayer___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = player;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __29__SCNNode_removeAudioPlayer___block_invoke(uint64_t a1)
{
  C3DNodeRemoveAudioPlayer([*(id *)(a1 + 32) nodeRef], *(const void **)(a1 + 40), 1);
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 recycle];
}

- (unint64_t)countOfAudioPlayers
{
  uint64_t v2 = [(SCNNode *)self audioPlayers];

  return [(NSArray *)v2 count];
}

- (id)objectInAudioPlayersAtIndex:(unint64_t)a3
{
  uint64_t v4 = [(SCNNode *)self audioPlayers];

  return [(NSArray *)v4 objectAtIndex:a3];
}

- (void)insertObject:(id)a3 inAudioPlayersAtIndex:(unint64_t)a4
{
  uint64_t v7 = [(SCNNode *)self sceneRef];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__SCNNode_insertObject_inAudioPlayersAtIndex___block_invoke;
  v8[3] = &unk_264004E20;
  void v8[4] = self;
  void v8[5] = a3;
  void v8[6] = a4;
  +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v8];
}

uint64_t __46__SCNNode_insertObject_inAudioPlayersAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) nodeRef];
  uint64_t v3 = *(void **)(a1 + 40);
  CFIndex v4 = *(void *)(a1 + 48);

  return C3DNodeInsertAudioPlayerAtIndex(v2, v3, v4);
}

- (void)removeObjectFromAudioPlayersAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(SCNNode *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__SCNNode_removeObjectFromAudioPlayersAtIndex___block_invoke;
  v6[3] = &unk_264004FC0;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __47__SCNNode_removeObjectFromAudioPlayersAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) nodeRef];
  CFIndex v3 = *(void *)(a1 + 40);

  C3DNodeRemoveAudioPlayerAtIndex(v2, v3, 1);
}

- (void)replaceObjectInAudioPlayerAtIndex:(unint64_t)a3 withObject:(id)a4
{
  if (!a4)
  {
    uint64_t v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[SCNNode replaceObjectInParticleSystemsAtIndex:withObject:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  uint64_t v15 = [(SCNNode *)self sceneRef];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__SCNNode_replaceObjectInAudioPlayerAtIndex_withObject___block_invoke;
  v16[3] = &unk_264004E20;
  v16[4] = self;
  void v16[5] = a4;
  void v16[6] = a3;
  +[SCNTransaction postCommandWithContext:v15 object:self applyBlock:v16];
}

void __56__SCNNode_replaceObjectInAudioPlayerAtIndex_withObject___block_invoke(uint64_t a1)
{
  uint64_t v2 = (float32x4_t *)[*(id *)(a1 + 32) nodeRef];
  CFIndex v3 = *(void **)(a1 + 40);
  CFIndex v4 = *(void *)(a1 + 48);

  C3DNodeReplaceAudioPlayerAtIndex(v2, v3, v4);
}

- (SCNVector3)convertPosition:(SCNVector3)position toNode:(SCNNode *)node
{
  float y = position.y;
  [(SCNNode *)self simdConvertPosition:node toNode:*(double *)&position.x];
  float v7 = v6;
  float v9 = v8;
  result.float z = v9;
  result.float y = v7;
  result.double x = v5;
  return result;
}

- (SCNVector3)convertPosition:(SCNVector3)position fromNode:(SCNNode *)node
{
  float y = position.y;
  [(SCNNode *)self simdConvertPosition:node fromNode:*(double *)&position.x];
  float v7 = v6;
  float v9 = v8;
  result.float z = v9;
  result.float y = v7;
  result.double x = v5;
  return result;
}

- (SCNVector3)convertVector:(SCNVector3)vector toNode:(SCNNode *)node
{
  float y = vector.y;
  [(SCNNode *)self simdConvertVector:node toNode:*(double *)&vector.x];
  float v7 = v6;
  float v9 = v8;
  result.float z = v9;
  result.float y = v7;
  result.double x = v5;
  return result;
}

- (SCNMatrix4)convertTransform:(SEL)a3 toNode:(SCNMatrix4 *)transform
{
  SCNVector3 result = (SCNMatrix4 *)-[SCNNode simdConvertTransform:toNode:](self, "simdConvertTransform:toNode:", node, *(double *)&transform->m11, *(double *)&transform->m21, *(double *)&transform->m31, *(double *)&transform->m41);
  *(_OWORD *)&retstr->m11 = v7;
  *(_OWORD *)&retstr->m21 = v8;
  *(_OWORD *)&retstr->m31 = v9;
  *(_OWORD *)&retstr->m41 = v10;
  return result;
}

- (SCNMatrix4)convertTransform:(SEL)a3 fromNode:(SCNMatrix4 *)transform
{
  SCNVector3 result = (SCNMatrix4 *)-[SCNNode simdConvertTransform:fromNode:](self, "simdConvertTransform:fromNode:", node, *(double *)&transform->m11, *(double *)&transform->m21, *(double *)&transform->m31, *(double *)&transform->m41);
  *(_OWORD *)&retstr->m11 = v7;
  *(_OWORD *)&retstr->m21 = v8;
  *(_OWORD *)&retstr->m31 = v9;
  *(_OWORD *)&retstr->m41 = v10;
  return result;
}

- (void)_customEncodingOfSCNNode:(id)a3 usePresentationInstance:(BOOL)a4
{
  BOOL v4 = a4;
  if ((*((unsigned char *)self + 41) & 1) == 0) {
    [(SCNNode *)self _updateAffine];
  }
  if ([(SCNNode *)self light])
  {
    long long v7 = [(SCNNode *)self light];
    uint64_t v8 = (uint64_t)v7;
    if (v4) {
      uint64_t v8 = [(SCNLight *)v7 presentationLight];
    }
    [a3 encodeObject:v8 forKey:@"light"];
  }
  if ([(SCNNode *)self geometry])
  {
    long long v9 = [(SCNNode *)self geometry];
    uint64_t v10 = (uint64_t)v9;
    if (v4) {
      uint64_t v10 = [(SCNGeometry *)v9 presentationGeometry];
    }
    [a3 encodeObject:v10 forKey:@"geometry"];
  }
  if ([(SCNNode *)self camera])
  {
    uint64_t v11 = [(SCNNode *)self camera];
    uint64_t v12 = (uint64_t)v11;
    if (v4) {
      uint64_t v12 = [(SCNCamera *)v11 presentationCamera];
    }
    [a3 encodeObject:v12 forKey:@"camera"];
  }
  if ([(SCNNode *)self skinner]) {
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode skinner](self, "skinner"), @"skinner");
  }
  if ([(SCNNode *)self morpher])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (a3
      && (isKindOfClass & 1) != 0
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", @"SCNSceneExportCompressMorphTargets"), "BOOLValue")&& SCNEncodeMorpherUsingAnimCodec(a3, self))
    {
      [a3 setSkipMorphTargets:1];
      objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode morpher](self, "morpher"), @"morpher");
      [a3 setSkipMorphTargets:0];
    }
    else
    {
      objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode morpher](self, "morpher"), @"morpher");
    }
  }
  id v14 = [(SCNNode *)self postMorphingDeformers];
  if (v14) {
    [a3 encodeObject:v14 forKey:@"postMorphingDeformers"];
  }
  id v15 = [(SCNNode *)self postSkinningDeformers];
  if (v15) {
    [a3 encodeObject:v15 forKey:@"postSkinningDeformers"];
  }
  if ([(SCNNode *)self filters]) {
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode filters](self, "filters"), @"filters");
  }
  if ([(SCNNode *)self constraints]) {
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode constraints](self, "constraints"), @"constraints");
  }
  if ([(SCNNode *)self physicsBody]) {
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode physicsBody](self, "physicsBody"), @"physicsBody");
  }
  if ([(SCNNode *)self physicsField]) {
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode physicsField](self, "physicsField"), @"physicsField");
  }
  if ([(SCNNode *)self particleSystems]) {
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode particleSystems](self, "particleSystems"), @"particleSystem");
  }
  fixedBoundingBoxExtremSCNMatrix4 a = self->_fixedBoundingBoxExtrema;
  if (fixedBoundingBoxExtrema)
  {
    *(float *)&double v16 = fixedBoundingBoxExtrema->x;
    *(float *)&double v17 = fixedBoundingBoxExtrema->y;
    *(float *)&double v18 = fixedBoundingBoxExtrema->z;
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNVector3:", v16, v17, v18), @"fixedBoundingBoxExtrema[0]");
    long long v20 = self->_fixedBoundingBoxExtrema;
    *(float *)&double v21 = v20[1].x;
    *(float *)&double v22 = v20[1].y;
    *(float *)&double v23 = v20[1].z;
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNVector3:", v21, v22, v23), @"fixedBoundingBoxExtrema[1]");
  }
  [a3 encodeBool:(*((unsigned __int8 *)self + 40) >> 6) & 1 forKey:@"paused"];
  uint64_t v24 = (*((unsigned __int8 *)self + 42) >> 3) & 3;
  if (v24) {
    [a3 encodeInt:v24 forKey:@"focusBehavior"];
  }
  if ((*((unsigned char *)self + 41) & 4) != 0)
  {
    double v25 = self;
    if (v4) {
      double v25 = [(SCNNode *)self presentationNode];
    }
    double v26 = (void *)[(SCNNode *)v25 valueForKey:@"kPivotKey"];
    if (v26)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      [v26 SCNMatrix4Value];
      v31[0] = v32;
      v31[1] = v33;
      v31[2] = v34;
      v31[3] = v35;
      SCNEncodeSCNMatrix4(a3, (const char *)@"pivot", (uint64_t)v31);
    }
  }
  actions = self->_actions;
  if (actions && !v4)
  {
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNOrderedDictionary allKeys](actions, "allKeys"), @"action-keys");
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNOrderedDictionary dictionary](self->_actions, "dictionary"), @"actions");
  }
  uint64_t ID = C3DNodeGetID((uint64_t)self->_node);
  if (ID) {
    [a3 encodeObject:ID forKey:@"nodeID"];
  }
  os_unfair_lock_lock(&self->_valueForKeyLock);
  if ([(NSMutableDictionary *)self->_valueForKey count])
  {
    float32x4_t v29 = (void *)[(NSMutableDictionary *)self->_valueForKey mutableCopy];
    [v29 removeObjectForKey:@"kPivotKey"];
    if ([v29 count]) {
      [a3 encodeObject:v29 forKey:@"clientAttributes"];
    }
  }
  os_unfair_lock_unlock(&self->_valueForKeyLock);
  if ([(SCNNode *)self _isAReference] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v30 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", @"SCNSceneExportEmbedReferences"), "BOOLValue");
  }
  else {
    int v30 = 0;
  }
  if ([(SCNNode *)self childNodes])
  {
    if ((![(SCNNode *)self _isAReference] | v30) == 1) {
      objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode childNodes](self, "childNodes"), @"childNodes");
    }
  }
}

- (void)_customDecodingOfSCNNode:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  float v5 = (const void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"nodeID"];
  if (v5) {
    C3DNodeSetID((uint64_t)self->_node, v5);
  }
  if ([a3 containsValueForKey:@"paused"])
  {
    if ([a3 decodeBoolForKey:@"paused"]) {
      char v6 = 64;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 40) = *((unsigned char *)self + 40) & 0xBF | v6;
  }
  -[SCNNode setFocusBehavior:](self, "setFocusBehavior:", (int)[a3 decodeIntForKey:@"focusBehavior"]);
  long long v7 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
  long long v8 = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
  long long v9 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
  *(_OWORD *)&self->_anon_30[2] = *MEMORY[0x263EF89A8];
  *(_OWORD *)&self->_anon_30[18] = v7;
  *(_OWORD *)&self->_anon_30[34] = v8;
  *(_OWORD *)&self->_anon_30[50] = v9;
  *((unsigned char *)self + 41) |= 2u;
  *((unsigned char *)self + 40) |= 0x3Eu;
  if ([a3 containsValueForKey:@"fixedBoundingBoxExtrema[0]"])
  {
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"fixedBoundingBoxExtrema[0]"), "SCNVector3Value");
    v52[0] = v10;
    v52[1] = v11;
    v52[2] = v12;
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"fixedBoundingBoxExtrema[1]"), "SCNVector3Value");
    v53[0] = v13;
    v53[1] = v14;
    v53[2] = v15;
    [(SCNNode *)self setBoundingBoxMin:v52 max:v53];
  }
  double v16 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"particleSystem");
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v46 != v19) {
          objc_enumerationMutation(v16);
        }
        [(SCNNode *)self addParticleSystem:*(void *)(*((void *)&v45 + 1) + 8 * i)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v18);
  }
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_msgSend(a3, "scn_decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v21, objc_opt_class(), @"actions");
  if (v22)
  {
    double v23 = (void *)v22;
    uint64_t v24 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"action-keys");
    if (!v24) {
      uint64_t v24 = (void *)[v23 allKeys];
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v42 != v27) {
            objc_enumerationMutation(v24);
          }
          -[SCNNode runAction:forKey:](self, "runAction:forKey:", [v23 objectForKeyedSubscript:*(void *)(*((void *)&v41 + 1) + 8 * j)], *(void *)(*((void *)&v41 + 1) + 8 * j));
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v26);
    }
  }
  float32x4_t v29 = (void *)[a3 decodeObjectOfClasses:SCNUserInfoClasses() forKey:@"clientAttributes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[SCNNode _setAttributes:](self, "_setAttributes:", (id)[v29 mutableCopy]);
  }
  if ([a3 containsValueForKey:@"pivot"])
  {
    SCNDecodeSCNMatrix4(a3, @"pivot", v40);
    v39[0] = v40[0];
    v39[1] = v40[1];
    v39[2] = v40[2];
    v39[3] = v40[3];
    [(SCNNode *)self setPivot:v39];
  }
  -[SCNNode setLight:](self, "setLight:", objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"light"));
  -[SCNNode setGeometry:](self, "setGeometry:", objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"geometry"));
  -[SCNNode setCamera:](self, "setCamera:", objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"camera"));
  -[SCNNode setSkinner:](self, "setSkinner:", objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"skinner"));
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(a3, "setAllTargetsFromAnimCodec:", SCNDecodeMorpherUsingAnimCodec(a3, self));
    -[SCNNode setMorpher:](self, "setMorpher:", objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"morpher"));
    [a3 setAllTargetsFromAnimCodec:0];
  }
  else
  {
    -[SCNNode setMorpher:](self, "setMorpher:", objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"morpher"));
  }
  -[SCNNode setPostMorphingDeformers:](self, "setPostMorphingDeformers:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"postMorphingDeformers"));
  -[SCNNode setPostSkinningDeformers:](self, "setPostSkinningDeformers:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"postSkinningDeformers"));
  -[SCNNode setFilters:](self, "setFilters:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"filters"));
  -[SCNNode setConstraints:](self, "setConstraints:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"constraints"));
  -[SCNNode setPhysicsField:](self, "setPhysicsField:", objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"physicsField"));
  int v30 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"childNodes");
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v35 objects:v49 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(v30);
        }
        [(SCNNode *)self addChildNode:*(void *)(*((void *)&v35 + 1) + 8 * k)];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v35 objects:v49 count:16];
    }
    while (v32);
  }
  -[SCNNode setPhysicsBody:](self, "setPhysicsBody:", objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"physicsBody"));
}

- (void)_encodeNodePropertiesWithCoder:(id)a3
{
  SCNEncodeVector3(a3, @"position", *(float *)&self->_position[2], *(float *)&self->_position[6], *(float *)&self->_position[10]);
  int v5 = (*((unsigned __int8 *)self + 41) >> 4) & 3;
  switch(v5)
  {
    case 2:
      float v6 = *(float *)&self->_anon_80[2];
      float v7 = *(float *)&self->_anon_80[6];
      float v8 = *(float *)&self->_anon_80[10];
      float v9 = *(float *)&self->_anon_80[14];
      int v10 = @"orientation";
LABEL_7:
      SCNEncodeVector4(a3, (uint64_t)v10, v6, v7, v8, v9);
      break;
    case 1:
      float v6 = *(float *)&self->_anon_80[2];
      float v7 = *(float *)&self->_anon_80[6];
      float v8 = *(float *)&self->_anon_80[10];
      float v9 = *(float *)&self->_anon_80[14];
      int v10 = @"rotation";
      goto LABEL_7;
    case 0:
      SCNEncodeVector3(a3, @"eulerAngles", *(float *)&self->_anon_80[2], *(float *)&self->_anon_80[6], *(float *)&self->_anon_80[10]);
      break;
  }
  if ((*((unsigned char *)self + 41) & 0x30) != 0x10)
  {
    [(SCNNode *)self rotation];
    SCNEncodeVector4(a3, @"rotation", v11, v12, v13, v14);
  }
  SCNEncodeVector3(a3, @"scale", *(float *)&self->_scale[2], *(float *)&self->_scale[6], *(float *)&self->_scale[10]);
  *(float *)&double v15 = self->_opacity;
  [a3 encodeFloat:@"opacity" forKey:v15];
  [a3 encodeInteger:self->_categoryBitMask forKey:@"categoryBitMask"];
  [a3 encodeInteger:((unint64_t)*((unsigned __int8 *)self + 41) >> 6) & 1 forKey:@"movabilityHint"];
  [a3 encodeInteger:self->_renderingOrder forKey:@"renderingOrder"];
  name = self->_name;
  if (name) {
    [a3 encodeObject:name forKey:@"name"];
  }
  [a3 encodeBool:*((unsigned __int8 *)self + 41) >> 7 forKey:@"hidden"];
  [a3 encodeBool:*((unsigned char *)self + 42) & 1 forKey:@"castsShadow"];
  uint64_t v17 = (*((unsigned __int8 *)self + 42) >> 1) & 1;

  [a3 encodeBool:v17 forKey:@"depthPrePass"];
}

- (void)encodeWithCoder:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", @"SCNSceneExportPresentationTree"), "BOOLValue"))
  {
    int v5 = [(SCNNode *)self presentationNode];
    [(SCNNode *)v5 _syncObjCModel];
    [(SCNNode *)v5 _updateAffine];
    [(SCNNode *)self _customEncodingOfSCNNode:a3 usePresentationInstance:1];
    [(SCNNode *)v5 _encodeNodePropertiesWithCoder:a3];
    SCNEncodeEntity(a3, self);
  }
  else
  {
    [(SCNNode *)self _customEncodingOfSCNNode:a3 usePresentationInstance:0];
    [(SCNNode *)self _encodeNodePropertiesWithCoder:a3];
    SCNEncodeEntity(a3, self);
    SCNEncodeAnimations(a3, self);
  }
}

- (SCNNode)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SCNNode;
  BOOL v4 = [(SCNNode *)&v14 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    uint64_t v6 = C3DNodeCreate();
    v4->_node = (__C3DNode *)v6;
    if (v6) {
      C3DEntitySetObjCWrapper(v6, v4);
    }
    v4->_valueForKeyLock._os_unfair_lock_opaque = 0;
    [(SCNNode *)v4 _syncObjCModel];
    -[SCNNode setName:](v4, "setName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"name"]);
    [(SCNNode *)v4 _customDecodingOfSCNNode:a3];
    *(float *)&double v7 = SCNDecodeVector3(a3, @"position");
    [(SCNNode *)v4 setPosition:v7];
    if ([a3 containsValueForKey:@"orientation"])
    {
      *(float *)&double v8 = SCNDecodeVector4(a3, @"orientation");
      [(SCNNode *)v4 setOrientation:v8];
    }
    else if ([a3 containsValueForKey:@"eulerAngles"])
    {
      *(float *)&double v9 = SCNDecodeVector3(a3, @"eulerAngles");
      [(SCNNode *)v4 setEulerAngles:v9];
    }
    else
    {
      *(float *)&double v10 = SCNDecodeVector4(a3, @"rotation");
      [(SCNNode *)v4 setRotation:v10];
    }
    *(float *)&double v11 = SCNDecodeVector3(a3, @"scale");
    [(SCNNode *)v4 setScale:v11];
    [a3 decodeFloatForKey:@"opacity"];
    [(SCNNode *)v4 setOpacity:v12];
    -[SCNNode setCategoryBitMask:](v4, "setCategoryBitMask:", [a3 decodeIntegerForKey:@"categoryBitMask"]);
    -[SCNNode setMovabilityHint:](v4, "setMovabilityHint:", [a3 decodeIntegerForKey:@"movabilityHint"]);
    -[SCNNode setRenderingOrder:](v4, "setRenderingOrder:", [a3 decodeIntegerForKey:@"renderingOrder"]);
    -[SCNNode setHidden:](v4, "setHidden:", [a3 decodeBoolForKey:@"hidden"]);
    -[SCNNode setCastsShadow:](v4, "setCastsShadow:", [a3 decodeBoolForKey:@"castsShadow"]);
    if ([a3 containsValueForKey:@"depthPrePass"]) {
      -[SCNNode setUsesDepthPrePass:](v4, "setUsesDepthPrePass:", [a3 decodeBoolForKey:@"depthPrePass"]);
    }
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    SCNDecodeEntity(a3, v4);
    SCNDecodeAnimations(a3, v4);
    [(SCNNode *)v4 _didDecodeSCNNode:a3];
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)authoringEnvironmentCompanionNode
{
  return objc_getAssociatedObject(self, &SCNAuthoringEnvironmentCompanionNodeKey);
}

- (void)setAuthoringEnvironmentCompanionNode:(id)a3
{
}

- (id)authoringEnvironmentPresentationNode
{
  return objc_getAssociatedObject(self, &SCNAuthoringEnvironmentPresentationNodeKey);
}

- (void)setAuthoringEnvironmentPresentationNode:(id)a3
{
}

+ (SCNVector3)localUp
{
  [(id)objc_opt_class() simdLocalUp];
  float v4 = v3;
  float v6 = v5;
  result.float z = v6;
  result.float y = v4;
  result.double x = v2;
  return result;
}

+ (SCNVector3)localRight
{
  [(id)objc_opt_class() simdLocalRight];
  float v4 = v3;
  float v6 = v5;
  result.float z = v6;
  result.float y = v4;
  result.double x = v2;
  return result;
}

+ (SCNVector3)localFront
{
  [(id)objc_opt_class() simdLocalFront];
  float v4 = v3;
  float v6 = v5;
  result.float z = v6;
  result.float y = v4;
  result.double x = v2;
  return result;
}

- (SCNVector3)worldUp
{
  [(SCNNode *)self simdWorldUp];
  float v4 = v3;
  float v6 = v5;
  result.float z = v6;
  result.float y = v4;
  result.double x = v2;
  return result;
}

- (SCNVector3)worldRight
{
  [(SCNNode *)self simdWorldRight];
  float v4 = v3;
  float v6 = v5;
  result.float z = v6;
  result.float y = v4;
  result.double x = v2;
  return result;
}

- (SCNVector3)worldFront
{
  [(SCNNode *)self simdWorldFront];
  float v4 = v3;
  float v6 = v5;
  result.float z = v6;
  result.float y = v4;
  result.double x = v2;
  return result;
}

- (void)lookAt:(SCNVector3)worldTarget
{
  float y = worldTarget.y;
  [(SCNNode *)self simdLookAt:*(double *)&worldTarget.x];
}

- (void)lookAt:(SCNVector3)worldTarget up:(SCNVector3)worldUp localFront:(SCNVector3)localFront
{
  float y = worldTarget.y;
  float v6 = worldUp.y;
  [(SCNNode *)self simdLookAt:*(double *)&worldTarget.x up:*(double *)&worldUp.x localFront:*(double *)&localFront.x];
}

- (void)localTranslateBy:(SCNVector3)translation
{
  float y = translation.y;
  [(SCNNode *)self simdLocalTranslateBy:*(double *)&translation.x];
}

- (void)localRotateBy:(SCNQuaternion)rotation
{
  float y = rotation.y;
  [(SCNNode *)self simdLocalRotateBy:*(double *)&rotation.x];
}

- (void)rotateBy:(SCNQuaternion)worldRotation aroundTarget:(SCNVector3)worldTarget
{
  float y = worldRotation.y;
  float v5 = worldTarget.y;
  [(SCNNode *)self simdRotateBy:*(double *)&worldRotation.x aroundTarget:*(double *)&worldTarget.x];
}

- (BOOL)simdGetBoundingSphereCenter:(SCNNode *)self radius:(SEL)a2
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  if (self->_node)
  {
    float v4 = v3;
    float v5 = v2;
    float32x4_t v59 = 0uLL;
    if (*((unsigned char *)self + 40))
    {
      float v12 = [(SCNNode *)self sceneRef];
      uint64_t v13 = (uint64_t)v12;
      if (v12) {
        C3DSceneLock((uint64_t)v12);
      }
      char v9 = C3DGetBoundingSphere(self->_node, 1, (uint64_t)&v59);
      if (v5) {
        *float v5 = v59;
      }
      if (v4) {
        *float v4 = v59.i32[3];
      }
      if (v13) {
        C3DSceneUnlock(v13);
      }
    }
    else
    {
      long long v42 = v3;
      float32x4_t v58 = 0uLL;
      double v7 = [(SCNNode *)self geometry];
      v57.i32[2] = 0;
      v57.i64[0] = 0;
      __int32 v56 = 0;
      if (v7)
      {
        v61.i32[2] = 0;
        v61.i64[0] = 0;
        v60.columns[0].i64[0] = 0;
        BOOL v8 = [(SCNGeometry *)v7 getBoundingSphereCenter:&v61 radius:&v60];
        char v9 = v8;
        if (v8)
        {
          v10.i64[0] = v61.i64[0];
          v10.i32[2] = v61.i32[2];
          float32_t v11 = *(double *)v60.columns[0].i64;
          v10.f32[3] = v11;
          float32x4_t v59 = v10;
        }
      }
      else
      {
        char v9 = 0;
      }
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      objc_super v14 = [(SCNNode *)self childNodes];
      uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v52 objects:v65 count:16];
      if (v15)
      {
        uint64_t v17 = v15;
        uint64_t v18 = *(void *)v53;
        v16.i32[0] = -1;
        int32x4_t v43 = v16;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v53 != v18) {
              objc_enumerationMutation(v14);
            }
            long long v20 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            int v21 = [v20 simdGetBoundingSphereCenter:&v57 radius:&v56];
            float32x4_t v22 = v57;
            v22.i32[3] = v56;
            float32x4_t v58 = v22;
            if (v21)
            {
              int8x16_t v50 = 0u;
              long long v51 = 0u;
              float32x4_t v48 = 0u;
              float32x4_t v49 = 0u;
              [v20 simdTransform];
              float32x4_t v46 = v24;
              float32x4_t v47 = v23;
              float32x4_t v44 = v26;
              float32x4_t v45 = v25;
              [v20 simdPivot];
              simd_float4x4 v68 = __invert_f4(v67);
              uint64_t v27 = 0;
              simd_float4x4 v60 = v68;
              float32x4_t v61 = 0u;
              float32x4_t v62 = 0u;
              int8x16_t v63 = 0u;
              long long v64 = 0u;
              do
              {
                *(float32x4_t *)((char *)&v61 + v27 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v47, COERCE_FLOAT(*(_OWORD *)&v60.columns[v27])), v46, *(float32x2_t *)v60.columns[v27].f32, 1), v45, (float32x4_t)v60.columns[v27], 2), v44, (float32x4_t)v60.columns[v27], 3);
                ++v27;
              }
              while (v27 != 4);
              float32x4_t v28 = (float32x4_t)v63;
              float32x4_t v48 = v61;
              float32x4_t v49 = v62;
              int8x16_t v29 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v28, (int32x4_t)v28), v63, 0xCuLL), vnegq_f32(v62)), (float32x4_t)v63, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v49, (int32x4_t)v49), (int8x16_t)v62, 0xCuLL));
              float32x4_t v30 = vmulq_f32(v61, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v29, (int32x4_t)v29), v29, 0xCuLL));
              BOOL v31 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v30, 2), vaddq_f32(v30, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v30.f32, 1))).f32[0] < 0.0;
              float32x4_t v32 = vmulq_f32(v48, v48);
              float32x4_t v33 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v32, 2), vaddq_f32(v32, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 1)));
              float32x4_t v34 = vmulq_f32(v49, v49);
              LODWORD(v35) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v34, 2), vaddq_f32(v34, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v34.f32, 1))).u32[0];
              float32x4_t v36 = vmulq_f32(v28, v28);
              LODWORD(v37) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1))).u32[0];
              if (v31) {
                float v38 = -1.0;
              }
              else {
                float v38 = 1.0;
              }
              v33.f32[0] = sqrtf(v33.f32[0]);
              v33.i32[1] = sqrtf(v35);
              v33.i32[2] = sqrtf(v37);
              float32x4_t v39 = vmulq_n_f32(v33, v38);
              int32x4_t v40 = (int32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v39), (int8x16_t)vcgezq_f32(v39)));
              v40.i32[3] = v40.i32[2];
              int8x16_t v50 = v63;
              long long v51 = v64;
              v40.i32[0] = vmaxvq_u32((uint32x4_t)v40);
              C3DTransformBoundingSphere(&v58, &v48, (__n128 *)&v58, (__n128)vandq_s8((int8x16_t)v39, (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v40, v43), 0)));
              if (v9) {
                C3DSphereMakeByMergingSpheres(&v59, &v58, &v59);
              }
              else {
                float32x4_t v59 = v58;
              }
              char v9 = 1;
            }
          }
          uint64_t v17 = [(NSArray *)v14 countByEnumeratingWithState:&v52 objects:v65 count:16];
        }
        while (v17);
      }
      if (v9)
      {
        if (v5) {
          *float v5 = v59;
        }
        if (v42) {
          *long long v42 = v59.i32[3];
        }
      }
    }
  }
  else
  {
    char v9 = 0;
  }
  return v9 & 1;
}

- (simd_float4x4)simdPivot
{
  if (*((unsigned char *)self + 40))
  {
    BOOL v8 = [(SCNNode *)self sceneRef];
    uint64_t v9 = (uint64_t)v8;
    if (v8) {
      C3DSceneLock((uint64_t)v8);
    }
    PivotMatridouble x = C3DNodeGetPivotMatrix((uint64_t)self->_node);
    float32_t v11 = (simd_float4 *)MEMORY[0x263EF89A8];
    if (PivotMatrix) {
      float32_t v11 = (simd_float4 *)PivotMatrix;
    }
    simd_float4 v6 = v11[2];
    simd_float4 v7 = v11[3];
    simd_float4 v4 = *v11;
    simd_float4 v5 = v11[1];
    if (v9)
    {
      simd_float4 v15 = *v11;
      simd_float4 v13 = v11[2];
      simd_float4 v14 = v11[1];
      simd_float4 v12 = v11[3];
      C3DSceneUnlock(v9);
      simd_float4 v7 = v12;
      simd_float4 v6 = v13;
      simd_float4 v5 = v14;
      simd_float4 v4 = v15;
    }
  }
  else if ((*((unsigned char *)self + 41) & 4) != 0 {
         && (float v3 = (void *)[(SCNNode *)self valueForKey:@"kPivotKey"]) != 0)
  }
  {
    objc_msgSend(v3, "SCN_simdMatrix4Value");
  }
  else
  {
    simd_float4 v4 = *(simd_float4 *)MEMORY[0x263EF89A8];
    simd_float4 v5 = *(simd_float4 *)(MEMORY[0x263EF89A8] + 16);
    simd_float4 v6 = *(simd_float4 *)(MEMORY[0x263EF89A8] + 32);
    simd_float4 v7 = *(simd_float4 *)(MEMORY[0x263EF89A8] + 48);
  }
  result.columns[3] = v7;
  result.columns[2] = v6;
  result.columns[1] = v5;
  result.columns[0] = v4;
  return result;
}

- (void)setSimdPivot:(simd_float4x4)simdPivot
{
  if (*((unsigned char *)self + 40))
  {
    float32x4_t v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SCNNode(SIMD) setSimdPivot:]();
    }
  }
  else
  {
    simd_float4 v4 = (void *)[(SCNNode *)self valueForKey:@"kPivotKey"];
    simd_float4 v5 = (float32x4_t *)MEMORY[0x263EF89A8];
    if (v4)
    {
      objc_msgSend(v4, "SCN_simdMatrix4Value");
    }
    else
    {
      float32x4_t v6 = *(float32x4_t *)MEMORY[0x263EF89A8];
      float32x4_t v7 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
      float32x4_t v8 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 32);
      float32x4_t v9 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
    }
    if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v6, (float32x4_t)simdPivot.columns[0]), (int8x16_t)vceqq_f32(v7, (float32x4_t)simdPivot.columns[1])), vandq_s8((int8x16_t)vceqq_f32(v8, (float32x4_t)simdPivot.columns[2]), (int8x16_t)vceqq_f32(v9, (float32x4_t)simdPivot.columns[3])))) & 0x80000000) == 0)
    {
      [(SCNNode *)self willChangeValueForKey:@"pivot"];
      float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x3727C5ACu);
      int v12 = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v11, vabdq_f32((float32x4_t)simdPivot.columns[1], v5[1])), (int8x16_t)vcgeq_f32(v11, vabdq_f32((float32x4_t)simdPivot.columns[0], *v5))), vandq_s8((int8x16_t)vcgeq_f32(v11, vabdq_f32((float32x4_t)simdPivot.columns[2], v5[2])), (int8x16_t)vcgeq_f32(v11, vabdq_f32((float32x4_t)simdPivot.columns[3], v5[3])))));
      *((unsigned char *)self + 41) = (*((unsigned char *)self + 41) & 0xFB | (4 * (v12 < 0))) ^ 4;
      if (v12 < 0) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = objc_msgSend(MEMORY[0x263F08D40], "SCN_valueWithSimdMatrix4:");
      }
      [(SCNNode *)self setValue:v13 forKey:@"kPivotKey"];
      v17[0] = 0;
      v17[1] = v17;
      v17[2] = 0x6010000000;
      v17[3] = &unk_20B6AE426;
      simd_float4x4 v18 = simdPivot;
      simd_float4 v14 = [(SCNNode *)self sceneRef];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __30__SCNNode_SIMD__setSimdPivot___block_invoke;
      v16[3] = &unk_2640079D8;
      v16[4] = self;
      void v16[5] = v17;
      +[SCNTransaction postCommandWithContext:v14 object:self key:@"pivot" applyBlock:v16];
      if ((*((_WORD *)self + 22) & 0x100) != 0) {
        objc_msgSend(-[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 8), "resetTransform");
      }
      [(SCNNode *)self didChangeValueForKey:@"pivot"];
      _Block_object_dispose(v17, 8);
    }
  }
}

void __30__SCNNode_SIMD__setSimdPivot___block_invoke(uint64_t a1)
{
}

void __34__SCNNode_SIMD__setSimdTransform___block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 48);
  v3[0] = *(_OWORD *)(a1 + 32);
  v3[1] = v1;
  long long v2 = *(_OWORD *)(a1 + 80);
  void v3[2] = *(_OWORD *)(a1 + 64);
  v3[3] = v2;
  C3DNodeSetMatrix(*(float32x4_t **)(*(void *)(a1 + 96) + 8), (uint64_t)v3);
}

- (simd_float3)simdPosition
{
  if (*((unsigned char *)self + 40))
  {
    simd_float4 v4 = [(SCNNode *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      *(double *)v6.i64 = C3DNodeGetPosition((__n128 *)self->_node);
      simd_float3 v8 = v6;
      C3DSceneUnlock(v5);
      return v8;
    }
    else
    {
      node = self->_node;
      *(double *)result.i64 = C3DNodeGetPosition((__n128 *)node);
    }
  }
  else
  {
    if ((*((unsigned char *)self + 41) & 1) == 0) {
      [(SCNNode *)self _updateAffine];
    }
    return *(simd_float3 *)&self->_position[2];
  }
  return result;
}

- (simd_float4)simdRotation
{
  if (*((unsigned char *)self + 40))
  {
    simd_float3 v6 = [(SCNNode *)self sceneRef];
    if (v6)
    {
      uint64_t v7 = (uint64_t)v6;
      C3DSceneLock((uint64_t)v6);
      C3DNodeGetAxisAngle((float32x4_t *)self->_node);
      simd_float4 v19 = v8;
      C3DSceneUnlock(v7);
      return v19;
    }
    else
    {
      node = self->_node;
      C3DNodeGetAxisAngle((float32x4_t *)node);
    }
  }
  else
  {
    unsigned int v3 = *((unsigned __int8 *)self + 41);
    if ((v3 & 1) == 0)
    {
      [(SCNNode *)self _updateAffine];
      unsigned int v3 = *((unsigned __int8 *)self + 41);
    }
    int v4 = (v3 >> 4) & 3;
    if (v4)
    {
      if (v4 == 2)
      {
        float32x4_t v20 = *(float32x4_t *)&self->_anon_80[2];
        _S8 = v20.i32[3];
        float v12 = acosf(v20.f32[3]);
        _Q3 = (simd_float4)v20;
        float v13 = v12 + v12;
        __asm { FMLS            S1, S8, V3.S[3] }
        *(float *)_D1.i32 = sqrtf(*(float *)_D1.i32);
        if (*(float *)_D1.i32 > 0.000001) {
          _Q3 = (simd_float4)vdivq_f32(v20, (float32x4_t)vdupq_lane_s32(_D1, 0));
        }
        _Q3.f32[3] = v13;
      }
      else
      {
        _Q3 = 0uLL;
        if (v4 == 1) {
          return *(simd_float4 *)&self->_anon_80[2];
        }
      }
    }
    else
    {
      simd_float4 v21 = 0u;
      float32x4_t v22 = 0u;
      C3DQuaternionMakeEuler(&v22, *(float *)&self->_anon_80[2], *(float *)&self->_anon_80[6], *(float *)&self->_anon_80[10]);
      C3DQuaternionGetAxisAngle(&v22, (float32x4_t *)&v21);
      return v21;
    }
    return _Q3;
  }
  return result;
}

- (void)setSimdRotation:(simd_float4)simdRotation
{
  if (*((unsigned char *)self + 40))
  {
    float32x4_t v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SCNNode(SIMD) setSimdRotation:]();
    }
  }
  else
  {
    char v4 = *((unsigned char *)self + 41);
    simd_float4 v13 = simdRotation;
    if ((v4 & 1) == 0)
    {
      [(SCNNode *)self _updateAffine];
      simdRotation = v13;
      char v4 = *((unsigned char *)self + 41);
    }
    if ((v4 & 0x30) != 0x10
      || (vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_anon_80[2], (float32x4_t)simdRotation)) & 0x80000000) == 0)
    {
      [(SCNNode *)self willChangeValueForKey:@"rotation", *(_OWORD *)&v13];
      char v5 = *((unsigned char *)self + 41);
      *(float32x4_t *)&self->_anon_80[2] = v14;
      *((unsigned char *)self + 41) = v5 & 0xCD | 0x10;
      uint32x4_t v6 = (uint32x4_t)vceqzq_f32(v14);
      v6.i32[3] = v6.i32[2];
      if ((vminvq_u32(v6) & 0x80000000) != 0)
      {
        float32x4_t v10 = v14;
      }
      else
      {
        int32x4_t v7 = (int32x4_t)vmulq_f32(v14, v14);
        v7.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v7, 2), vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v7.i8, 1))).u32[0];
        float32x2_t v8 = vrsqrte_f32((float32x2_t)v7.u32[0]);
        float32x2_t v9 = vmul_f32(v8, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v8, v8)));
        float32x4_t v10 = vmulq_n_f32(v14, vmul_f32(v9, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v9, v9))).f32[0]);
      }
      v10.i32[3] = v14.i32[3];
      float v12 = [(SCNNode *)self sceneRef];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __33__SCNNode_SIMD__setSimdRotation___block_invoke;
      v16[3] = &unk_2640083D8;
      simd_float4x4 v18 = self;
      long long v17 = v15;
      +[SCNTransaction postCommandWithContext:v12 object:self key:@"rotation" applyBlock:v16];
      if ((*((_WORD *)self + 22) & 0x100) != 0) {
        objc_msgSend(-[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 8), "resetTransform");
      }
      [(SCNNode *)self didChangeValueForKey:@"rotation"];
    }
  }
}

void __33__SCNNode_SIMD__setSimdRotation___block_invoke(__n128 *a1)
{
}

- (simd_quatf)simdOrientation
{
  if (*((unsigned char *)self + 40))
  {
    char v4 = [(SCNNode *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      C3DNodeGetQuaternion((uint64_t)self->_node);
      simd_quatf v7 = v6;
      C3DSceneUnlock(v5);
      return v7;
    }
    else
    {
      C3DNodeGetQuaternion((uint64_t)self->_node);
    }
  }
  else
  {
    [(SCNNode *)self _quaternion];
  }
  return v3;
}

- (void)setSimdOrientation:(simd_quatf)simdOrientation
{
  [(SCNNode *)self _setQuaternion:*(double *)simdOrientation.vector.i64];
  if ((*((_WORD *)self + 22) & 0x100) != 0)
  {
    id v4 = [(SCNNode *)self _findComponentWithType:8];
    [v4 resetTransform];
  }
}

- (simd_float3)simdEulerAngles
{
  if (*((unsigned char *)self + 40))
  {
    id v4 = [(SCNNode *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      *(double *)v6.i64 = C3DNodeGetEuler((float32x4_t *)self->_node);
      simd_float3 v8 = v6;
      C3DSceneUnlock(v5);
      return v8;
    }
    else
    {
      node = self->_node;
      *(double *)result.i64 = C3DNodeGetEuler((float32x4_t *)node);
    }
  }
  else
  {
    [(SCNNode *)self _euler];
  }
  return result;
}

- (void)setSimdEulerAngles:(simd_float3)simdEulerAngles
{
  if ((*((unsigned char *)self + 41) & 1) == 0) {
    [(SCNNode *)self _updateAffine];
  }
  [(SCNNode *)self _euler];
  uint32x4_t v5 = (uint32x4_t)vceqq_f32(v4, v9);
  v5.i32[3] = v5.i32[2];
  if ((vminvq_u32(v5) & 0x80000000) == 0)
  {
    [(SCNNode *)self willChangeValueForKey:@"eulerAngles"];
    char v6 = *((unsigned char *)self + 41);
    *(float32x4_t *)&self->_anon_80[2] = v9;
    *((unsigned char *)self + 41) = v6 & 0xCD;
    simd_quatf v7 = [(SCNNode *)self sceneRef];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __36__SCNNode_SIMD__setSimdEulerAngles___block_invoke;
    v10[3] = &unk_2640083D8;
    float v12 = self;
    float32x4_t v11 = v9;
    +[SCNTransaction postCommandWithContext:v7 object:self key:@"eulerAngles" applyBlock:v10];
    if ((*((_WORD *)self + 22) & 0x100) != 0) {
      objc_msgSend(-[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 8), "resetTransform");
    }
    [(SCNNode *)self didChangeValueForKey:@"eulerAngles"];
  }
}

void __36__SCNNode_SIMD__setSimdEulerAngles___block_invoke(__n128 *a1)
{
}

- (simd_float3)simdScale
{
  if (*((unsigned char *)self + 40))
  {
    float32x4_t v4 = [(SCNNode *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      *(double *)v6.i64 = C3DNodeGetScale((__n128 *)self->_node);
      simd_float3 v8 = v6;
      C3DSceneUnlock(v5);
      return v8;
    }
    else
    {
      node = self->_node;
      *(double *)result.i64 = C3DNodeGetScale((__n128 *)node);
    }
  }
  else
  {
    if ((*((unsigned char *)self + 41) & 1) == 0) {
      [(SCNNode *)self _updateAffine];
    }
    return *(simd_float3 *)&self->_scale[2];
  }
  return result;
}

- (void)setSimdScale:(simd_float3)simdScale
{
  [(SCNNode *)self _setScale:*(double *)simdScale.i64];
  if ((*((_WORD *)self + 22) & 0x100) != 0)
  {
    id v4 = [(SCNNode *)self _findComponentWithType:8];
    [v4 resetTransform];
  }
}

- (simd_float3)simdWorldPosition
{
  [(SCNNode *)self simdWorldTransform];
  return v2;
}

- (void)setSimdWorldPosition:(simd_float3)simdWorldPosition
{
  if ([(SCNNode *)self parentNode])
  {
    [[(SCNNode *)self parentNode] simdWorldTransform];
    simd_float4x4 v8 = __invert_f4(v7);
    uint64_t v4 = vaddq_f32((float32x4_t)v8.columns[3], vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)v8.columns[1], *(float32x2_t *)simdWorldPosition.f32, 1), (float32x4_t)v8.columns[0], simdWorldPosition.f32[0]), (float32x4_t)v8.columns[2], (float32x4_t)simdWorldPosition, 2)).u64[0];
  }
  else
  {
    uint64_t v4 = simdWorldPosition.i64[0];
  }

  [(SCNNode *)self setSimdPosition:*(double *)&v4];
}

- (simd_quatf)simdWorldOrientation
{
  [(SCNNode *)self simdWorldTransform];
  int8x16_t v5 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v4, (int32x4_t)v4), (int8x16_t)v4, 0xCuLL), vnegq_f32(v3)), v4, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v3, (int32x4_t)v3), (int8x16_t)v3, 0xCuLL));
  float32x4_t v6 = vmulq_f32(v2, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v5, (int32x4_t)v5), v5, 0xCuLL));
  BOOL v7 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).f32[0] < 0.0;
  float v8 = 1.0;
  if (v7) {
    float v8 = -1.0;
  }
  float32x4_t v9 = vmulq_f32(v2, v2);
  float32x4_t v10 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), vaddq_f32(v9, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1)));
  float32x4_t v11 = vmulq_f32(v3, v3);
  v10.f32[0] = sqrtf(v10.f32[0]);
  float32x4_t v12 = vmulq_f32(v4, v4);
  v10.i32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).f32[0]);
  v10.i32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1))).f32[0]);
  float32x4_t v13 = vmulq_n_f32(v10, v8);
  uint32x4_t v14 = (uint32x4_t)vceqzq_f32(v13);
  v14.i32[3] = v14.i32[2];
  if ((vmaxvq_u32(v14) & 0x80000000) != 0) {
    return *(simd_quatf *)(MEMORY[0x263EF89A8] + 48);
  }
  uint32x4_t v15 = (uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v13), (int8x16_t)vcgezq_f32(v13)));
  v15.i32[3] = v15.i32[2];
  if ((vmaxvq_u32(v15) & 0x80000000) != 0)
  {
    return *(simd_quatf *)(MEMORY[0x263EF89A8] + 48);
  }
  else
  {
    float32x4_t v16 = vdivq_f32(v2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 0));
    float32x4_t v17 = vdivq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1));
    float32x4_t v18 = vdivq_f32(v4, (float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2));
    float v19 = v18.f32[2] + (float)(v16.f32[0] + v17.f32[1]);
    if (v19 <= 0.0)
    {
      if (v16.f32[0] <= v17.f32[1] || v16.f32[0] <= v18.f32[2])
      {
        if (v17.f32[1] <= v18.f32[2])
        {
          float32_t v28 = (float)(v18.f32[2] + 1.0) - v16.f32[0];
          float32x4_t v29 = (float32x4_t)vzip2q_s32((int32x4_t)v16, vzip1q_s32((int32x4_t)v18, (int32x4_t)v16));
          int8x16_t v30 = (int8x16_t)vrev64q_s32((int32x4_t)v17);
          float32x4_t v31 = (float32x4_t)vextq_s8(v30, v30, 8uLL);
          v31.i32[0] = v18.i32[0];
          v21.i64[0] = vaddq_f32(v29, v31).u64[0];
          v29.f32[2] = v28;
          v21.i64[1] = vsubq_f32(v29, v31).i64[1];
          v18.i32[0] = v21.i32[2];
        }
        else
        {
          float32_t v24 = (float)(v17.f32[1] + 1.0) - v16.f32[0];
          float32x4_t v25 = v17;
          v25.i32[0] = v16.i32[1];
          v17.i32[1] = v18.i32[2];
          v17.i32[2] = v18.i32[1];
          int32x4_t v26 = (int32x4_t)vaddq_f32(v25, v17);
          v25.f32[1] = v24;
          v25.i32[3] = v18.i32[0];
          v17.i32[3] = v16.i32[2];
          float32x4_t v18 = vsubq_f32(v25, v17);
          float32x4_t v21 = (float32x4_t)vtrn2q_s32(vrev64q_s32(v26), (int32x4_t)v18);
          v18.i32[0] = v18.i32[1];
        }
      }
      else
      {
        float32x4_t v27 = v16;
        v27.f32[0] = (float)(v16.f32[0] + 1.0) - v17.f32[1];
        v27.i32[3] = v17.i32[2];
        float32x4_t v4 = (float32x4_t)vextq_s8((int8x16_t)v18, (int8x16_t)v18, 8uLL);
        float32x4_t v18 = vsubq_f32(v27, v4);
        v4.i32[1] = v17.i32[0];
        float32x4_t v21 = vaddq_f32(v16, v4);
        v21.i32[0] = v18.i32[0];
        v21.i32[3] = v18.i32[3];
      }
    }
    else
    {
      float32x4_t v20 = (float32x4_t)vzip2q_s32((int32x4_t)v17, vuzp1q_s32((int32x4_t)v17, (int32x4_t)v18));
      v20.i32[2] = v16.i32[1];
      float32x4_t v18 = (float32x4_t)vtrn2q_s32((int32x4_t)v18, vzip2q_s32((int32x4_t)v18, (int32x4_t)v16));
      v18.i32[2] = v17.i32[0];
      float32x4_t v21 = vsubq_f32(v20, v18);
      v18.i32[3] = 1.0;
      v20.f32[3] = v19;
      v21.i32[3] = vaddq_f32(v20, v18).i32[3];
      v18.i32[0] = v21.i32[3];
    }
    v4.i32[0] = 0;
    float32x4_t v32 = vmulq_n_f32(v21, 0.5 / sqrtf(v18.f32[0]));
    int32x4_t v33 = (int32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v32), (int8x16_t)vcgezq_f32(v32)));
    v33.i32[0] = vmaxvq_u32((uint32x4_t)v33);
    return *(simd_quatf *)&vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32((int32x4_t)v4, v33), 0), *(int8x16_t *)(MEMORY[0x263EF89A8] + 48), (int8x16_t)v32);
  }
}

- (void)setSimdWorldOrientation:(simd_quatf)simdWorldOrientation
{
  if (![(SCNNode *)self parentNode])
  {
    v6.columns[0].i64[0] = simdWorldOrientation.vector.i64[0];
    goto LABEL_20;
  }
  [[(SCNNode *)self parentNode] simdWorldTransform];
  simd_float4x4 v6 = __invert_f4(v24);
  int8x16_t v4 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v6.columns[2], (int32x4_t)v6.columns[2]), (int8x16_t)v6.columns[2], 0xCuLL), vnegq_f32((float32x4_t)v6.columns[1])), (float32x4_t)v6.columns[2], (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v6.columns[1], (int32x4_t)v6.columns[1]), (int8x16_t)v6.columns[1], 0xCuLL));
  v6.columns[3] = (simd_float4)vmulq_f32((float32x4_t)v6.columns[0], (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v4, (int32x4_t)v4), v4, 0xCuLL));
  BOOL v5 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6.columns[3], 2), vaddq_f32((float32x4_t)v6.columns[3], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.columns[3].f32, 1))).f32[0] < 0.0;
  v6.columns[3].i32[0] = 1.0;
  if (v5) {
    v6.columns[3].f32[0] = -1.0;
  }
  float32x4_t v7 = vmulq_f32((float32x4_t)v6.columns[0], (float32x4_t)v6.columns[0]);
  float32x4_t v8 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1)));
  float32x4_t v9 = vmulq_f32((float32x4_t)v6.columns[1], (float32x4_t)v6.columns[1]);
  v8.f32[0] = sqrtf(v8.f32[0]);
  float32x4_t v10 = vmulq_f32((float32x4_t)v6.columns[2], (float32x4_t)v6.columns[2]);
  v8.i32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), vaddq_f32(v9, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1))).f32[0]);
  v8.i32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).f32[0]);
  float32x4_t v11 = vmulq_n_f32(v8, v6.columns[3].f32[0]);
  uint32x4_t v12 = (uint32x4_t)vceqzq_f32(v11);
  v12.i32[3] = v12.i32[2];
  if ((vmaxvq_u32(v12) & 0x80000000) == 0)
  {
    uint32x4_t v13 = (uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v11), (int8x16_t)vcgezq_f32(v11)));
    v13.i32[3] = v13.i32[2];
    if ((vmaxvq_u32(v13) & 0x80000000) == 0)
    {
      v6.columns[3] = (simd_float4)vdivq_f32((float32x4_t)v6.columns[0], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 0));
      v6.columns[0] = (simd_float4)vdivq_f32((float32x4_t)v6.columns[1], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1));
      v6.columns[1] = (simd_float4)vdivq_f32((float32x4_t)v6.columns[2], (float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2));
      v6.columns[2].f32[0] = v6.columns[1].f32[2] + (float)(v6.columns[3].f32[0] + v6.columns[0].f32[1]);
      if (v6.columns[2].f32[0] <= 0.0)
      {
        if (v6.columns[3].f32[0] <= v6.columns[0].f32[1] || v6.columns[3].f32[0] <= v6.columns[1].f32[2])
        {
          simd_quatf v15 = simdWorldOrientation;
          if (v6.columns[0].f32[1] <= v6.columns[1].f32[2])
          {
            v6.columns[2].f32[0] = (float)(v6.columns[1].f32[2] + 1.0) - v6.columns[3].f32[0];
            v6.columns[3] = (simd_float4)vzip2q_s32((int32x4_t)v6.columns[3], vzip1q_s32((int32x4_t)v6.columns[1], (int32x4_t)v6.columns[3]));
            v6.columns[0] = (simd_float4)vrev64q_s32((int32x4_t)v6.columns[0]);
            float32x4_t v21 = (float32x4_t)vextq_s8((int8x16_t)v6.columns[0], (int8x16_t)v6.columns[0], 8uLL);
            v21.i32[0] = v6.columns[1].i32[0];
            v6.columns[0].i64[0] = vaddq_f32((float32x4_t)v6.columns[3], v21).u64[0];
            v6.columns[3].i32[2] = v6.columns[2].i32[0];
            v6.columns[0].i64[1] = vsubq_f32(*(float32x4_t *)(&v6 + 48), v21).i64[1];
            v6.columns[1].i32[0] = v6.columns[0].i32[2];
          }
          else
          {
            v6.columns[2].f32[0] = (float)(v6.columns[0].f32[1] + 1.0) - v6.columns[3].f32[0];
            float32x4_t v17 = (float32x4_t)v6.columns[0];
            v17.i32[0] = v6.columns[3].i32[1];
            v6.columns[0].i32[1] = v6.columns[1].i32[2];
            v6.columns[0].i32[2] = v6.columns[1].i32[1];
            int32x4_t v18 = (int32x4_t)vaddq_f32(v17, (float32x4_t)v6.columns[0]);
            v17.i32[1] = v6.columns[2].i32[0];
            v17.i32[3] = v6.columns[1].i32[0];
            v6.columns[0].i32[3] = v6.columns[3].i32[2];
            v6.columns[1] = (simd_float4)vsubq_f32(v17, (float32x4_t)v6.columns[0]);
            v6.columns[0] = (simd_float4)vtrn2q_s32(vrev64q_s32(v18), (int32x4_t)v6.columns[1]);
            v6.columns[1].i32[0] = v6.columns[1].i32[1];
          }
          goto LABEL_18;
        }
        float32x4_t v19 = (float32x4_t)v6.columns[3];
        v19.f32[0] = (float)(v6.columns[3].f32[0] + 1.0) - v6.columns[0].f32[1];
        v19.i32[3] = v6.columns[0].i32[2];
        v6.columns[2] = (simd_float4)vextq_s8((int8x16_t)v6.columns[1], (int8x16_t)v6.columns[1], 8uLL);
        v6.columns[1] = (simd_float4)vsubq_f32(v19, (float32x4_t)v6.columns[2]);
        v6.columns[2].i32[1] = v6.columns[0].i32[0];
        v6.columns[0] = (simd_float4)vaddq_f32((float32x4_t)v6.columns[3], (float32x4_t)v6.columns[2]);
        v6.columns[0].i32[0] = v6.columns[1].i32[0];
        v6.columns[0].i32[3] = v6.columns[1].i32[3];
      }
      else
      {
        float32x4_t v14 = (float32x4_t)vzip2q_s32((int32x4_t)v6.columns[0], vuzp1q_s32((int32x4_t)v6.columns[0], (int32x4_t)v6.columns[1]));
        v14.i32[2] = v6.columns[3].i32[1];
        v6.columns[1] = (simd_float4)vtrn2q_s32((int32x4_t)v6.columns[1], vzip2q_s32((int32x4_t)v6.columns[1], (int32x4_t)v6.columns[3]));
        v6.columns[1].i32[2] = v6.columns[0].i32[0];
        v6.columns[0] = (simd_float4)vsubq_f32(v14, (float32x4_t)v6.columns[1]);
        v6.columns[1].i32[3] = 1.0;
        v14.i32[3] = v6.columns[2].i32[0];
        v6.columns[0].i32[3] = vaddq_f32(v14, *(float32x4_t *)(&v6 + 16)).i32[3];
        v6.columns[1].i32[0] = v6.columns[0].i32[3];
      }
      simd_quatf v15 = simdWorldOrientation;
LABEL_18:
      v6.columns[2].i32[0] = 0;
      v6.columns[0] = (simd_float4)vmulq_n_f32((float32x4_t)v6.columns[0], 0.5 / sqrtf(v6.columns[1].f32[0]));
      v6.columns[1] = (simd_float4)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32((float32x4_t)v6.columns[0]), (int8x16_t)vcgezq_f32((float32x4_t)v6.columns[0])));
      v6.columns[1].i32[0] = vmaxvq_u32((uint32x4_t)v6.columns[1]);
      v6.columns[1] = (simd_float4)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32((int32x4_t)v6.columns[2], (int32x4_t)v6.columns[1]), 0), *(int8x16_t *)(MEMORY[0x263EF89A8] + 48), (int8x16_t)v6.columns[0]);
      goto LABEL_19;
    }
  }
  v6.columns[1] = *(simd_float4 *)(MEMORY[0x263EF89A8] + 48);
  simd_quatf v15 = simdWorldOrientation;
LABEL_19:
  v6.columns[0] = v6.columns[1];
  v6.columns[0].i32[3] = v6.columns[1].i32[0];
  float32x4_t v20 = (float32x4_t)vzip1q_s32((int32x4_t)v15, (int32x4_t)v15);
  v20.i32[0] = v15.vector.i32[2];
  v6.columns[2] = (simd_float4)vuzp1q_s32((int32x4_t)v15, (int32x4_t)v15);
  v6.columns[2].i32[0] = v15.vector.i32[1];
  v6.columns[0].i64[0] = vmlsq_f32(vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v15, 3), (int8x16_t)v15, 4uLL), (float32x4_t)v6.columns[0]), (float32x4_t)xmmword_20B5CBBD0), (float32x4_t)v15, (float32x4_t)v6.columns[1], 3), (float32x4_t)xmmword_20B5CBBD0, vmulq_f32(v20, (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v6.columns[1], (int8x16_t)v6.columns[1], 0xCuLL), (int8x16_t)v6.columns[1],
                                              8uLL))),
                           (float32x4_t)v6.columns[2],
                           (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v6.columns[1], (int32x4_t)v6.columns[1]), (int8x16_t)v6.columns[1], 0xCuLL)).u64[0];
LABEL_20:

  [(SCNNode *)self setSimdOrientation:*(double *)v6.columns[0].i64];
}

- (void)setSimdWorldTransform:(simd_float4x4)simdWorldTransform
{
  double v11 = *(double *)simdWorldTransform.columns[3].i64;
  double v9 = *(double *)simdWorldTransform.columns[1].i64;
  double v10 = *(double *)simdWorldTransform.columns[2].i64;
  double v8 = *(double *)simdWorldTransform.columns[0].i64;
  if ([(SCNNode *)self parentNode])
  {
    -[SCNNode simdConvertTransform:fromNode:]([(SCNNode *)self parentNode], "simdConvertTransform:fromNode:", 0, v8, v9, v10, v11);
  }
  else
  {
    double v7 = v11;
    double v5 = v9;
    double v6 = v10;
    double v4 = v8;
  }

  -[SCNNode setSimdTransform:](self, "setSimdTransform:", v4, v5, v6, v7);
}

- (simd_float3)simdConvertPosition:(simd_float3)position toNode:(SCNNode *)node
{
  double v6 = node;
  float32x4_t v11 = (float32x4_t)position;
  if (!node)
  {
    double v6 = (SCNNode *)objc_msgSend(-[SCNNode scene](self, "scene"), "rootNode");
    position = (simd_float3)v11;
  }
  if (v6 != self)
  {
    [(SCNNode *)self simdWorldTransform];
    position = (simd_float3)vaddq_f32(v10, vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(v7, *(float32x2_t *)v11.f32, 1), v8, v11.f32[0]), v9, v11, 2));
    if (node)
    {
      simd_float3 v12 = position;
      [(SCNNode *)node simdWorldTransform];
      simd_float4x4 v14 = __invert_f4(v13);
      return (simd_float3)vaddq_f32((float32x4_t)v14.columns[3], vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)v14.columns[1], *(float32x2_t *)v12.f32, 1), (float32x4_t)v14.columns[0], v12.f32[0]), (float32x4_t)v14.columns[2], (float32x4_t)v12, 2));
    }
  }
  return position;
}

- (simd_float3)simdConvertPosition:(simd_float3)position fromNode:(SCNNode *)node
{
  double v6 = node;
  float32x4_t v13 = (float32x4_t)position;
  if (!node)
  {
    double v6 = (SCNNode *)objc_msgSend(-[SCNNode scene](self, "scene"), "rootNode");
    position = (simd_float3)v13;
  }
  if (v6 != self)
  {
    [(SCNNode *)self simdWorldTransform];
    simd_float4x4 v15 = __invert_f4(v14);
    float32x4_t v7 = (float32x4_t)v15.columns[1];
    float32x4_t v8 = (float32x4_t)v15.columns[3];
    if (node)
    {
      simd_float4 v11 = v15.columns[2];
      simd_float4 v12 = v15.columns[0];
      simd_float4 v9 = v15.columns[1];
      simd_float4 v10 = v15.columns[3];
      [(SCNNode *)node simdWorldTransform];
      v15.columns[1] = (simd_float4)vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)v15.columns[1], *(float32x2_t *)v13.f32, 1), (float32x4_t)v15.columns[0], v13.f32[0]), (float32x4_t)v15.columns[2], v13, 2);
      float32x4_t v7 = (float32x4_t)v9;
      float32x4_t v8 = (float32x4_t)v10;
      v15.columns[2] = v11;
      v15.columns[0] = v12;
      v15.columns[1] = (simd_float4)vaddq_f32((float32x4_t)v15.columns[3], (float32x4_t)v15.columns[1]);
    }
    else
    {
      v15.columns[1] = (simd_float4)v13;
    }
    return (simd_float3)vaddq_f32(v8, vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(v7, *(float32x2_t *)v15.columns[1].f32, 1), (float32x4_t)v15.columns[0], v15.columns[1].f32[0]), (float32x4_t)v15.columns[2], (float32x4_t)v15.columns[1], 2));
  }
  return position;
}

- (simd_float3)simdConvertVector:(simd_float3)vector toNode:(SCNNode *)node
{
  float32x4_t v5 = (float32x4_t)vector;
  float32x4_t v7 = node;
  if (!node)
  {
    float32x4_t v7 = (SCNNode *)objc_msgSend(-[SCNNode scene](self, "scene"), "rootNode");
    float32x4_t v5 = (float32x4_t)vector;
  }
  if (v7 != self)
  {
    [(SCNNode *)self simdWorldTransform];
    float32x4_t v5 = vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(v8, *(float32x2_t *)vector.f32, 1), v9, vector.f32[0]), v10, (float32x4_t)vector, 2);
    if (node)
    {
      float32x4_t v13 = v5;
      [(SCNNode *)node simdWorldTransform];
      simd_float4x4 v15 = __invert_f4(v14);
      return (simd_float3)vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)v15.columns[1], *(float32x2_t *)v13.f32, 1), (float32x4_t)v15.columns[0], v13.f32[0]), (float32x4_t)v15.columns[2], v13, 2);
    }
  }
  return (simd_float3)v5;
}

- (simd_float4x4)simdConvertTransform:(simd_float4x4)transform toNode:(SCNNode *)node
{
  if (node)
  {
    if (node == self) {
      return transform;
    }
    simd_float4x4 v20 = transform;
    [(SCNNode *)self simdWorldTransform];
    simd_float4 v18 = v7;
    simd_float4 v19 = v6;
    simd_float4 v16 = v9;
    simd_float4 v17 = v8;
    [(SCNNode *)node simdWorldTransform];
    simd_float4x4 v24 = __invert_f4(v23);
    uint64_t v10 = 0;
    v21.columns[0] = v19;
    v21.columns[1] = v18;
    v21.columns[2] = v17;
    v21.columns[3] = v16;
    memset(&v22, 0, sizeof(v22));
    do
    {
      v22.columns[v10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v24.columns[0], COERCE_FLOAT(*(_OWORD *)&v21.columns[v10])), (float32x4_t)v24.columns[1], *(float32x2_t *)v21.columns[v10].f32, 1), (float32x4_t)v24.columns[2], (float32x4_t)v21.columns[v10], 2), (float32x4_t)v24.columns[3], (float32x4_t)v21.columns[v10], 3);
      ++v10;
    }
    while (v10 != 4);
    float32x4_t v11 = (float32x4_t)v22.columns[0];
    float32x4_t v12 = (float32x4_t)v22.columns[1];
    float32x4_t v13 = (float32x4_t)v22.columns[2];
    float32x4_t v14 = (float32x4_t)v22.columns[3];
  }
  else
  {
    simd_float4x4 v20 = transform;
    if ((SCNNode *)objc_msgSend(-[SCNNode scene](self, "scene"), "rootNode") == self) {
      return v20;
    }
    [(SCNNode *)self simdWorldTransform];
  }
  uint64_t v15 = 0;
  simd_float4x4 v21 = v20;
  memset(&v22, 0, sizeof(v22));
  do
  {
    v22.columns[v15] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, COERCE_FLOAT(*(_OWORD *)&v21.columns[v15])), v12, *(float32x2_t *)v21.columns[v15].f32, 1), v13, (float32x4_t)v21.columns[v15], 2), v14, (float32x4_t)v21.columns[v15], 3);
    ++v15;
  }
  while (v15 != 4);
  return v22;
}

- (simd_float4x4)simdConvertTransform:(simd_float4x4)transform fromNode:(SCNNode *)node
{
  simd_float4 v6 = node;
  simd_float4x4 v18 = transform;
  if (!node)
  {
    simd_float4 v6 = (SCNNode *)objc_msgSend(-[SCNNode scene](self, "scene"), "rootNode");
    transforSCNMatrix4 m = v18;
  }
  if (v6 != self)
  {
    [(SCNNode *)self simdWorldTransform];
    simd_float4x4 v22 = __invert_f4(v21);
    float32x4_t v7 = (float32x4_t)v22.columns[2];
    if (node)
    {
      float32x4_t v16 = (float32x4_t)v22.columns[1];
      float32x4_t v17 = (float32x4_t)v22.columns[0];
      float32x4_t v14 = (float32x4_t)v22.columns[3];
      float32x4_t v15 = (float32x4_t)v22.columns[2];
      [(SCNNode *)node simdWorldTransform];
      uint64_t v8 = 0;
      v19.columns[0] = v9;
      v19.columns[1] = v10;
      v19.columns[2] = v11;
      v19.columns[3] = v12;
      memset(&v20, 0, sizeof(v20));
      do
      {
        v20.columns[v8] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, COERCE_FLOAT(*(_OWORD *)&v19.columns[v8])), v16, *(float32x2_t *)v19.columns[v8].f32, 1), v15, (float32x4_t)v19.columns[v8], 2), v14, (float32x4_t)v19.columns[v8], 3);
        ++v8;
      }
      while (v8 != 4);
      v22.columns[0] = v20.columns[0];
      v22.columns[1] = v20.columns[1];
      float32x4_t v7 = (float32x4_t)v20.columns[2];
      v22.columns[3] = v20.columns[3];
    }
    uint64_t v13 = 0;
    simd_float4x4 v19 = v18;
    memset(&v20, 0, sizeof(v20));
    do
    {
      v20.columns[v13] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v22.columns[0], COERCE_FLOAT(*(_OWORD *)&v19.columns[v13])), (float32x4_t)v22.columns[1], *(float32x2_t *)v19.columns[v13].f32, 1), v7, (float32x4_t)v19.columns[v13], 2), (float32x4_t)v22.columns[3], (float32x4_t)v19.columns[v13], 3);
      ++v13;
    }
    while (v13 != 4);
    return v20;
  }
  return transform;
}

+ (simd_float3)simdLocalUp
{
  return (simd_float3)xmmword_20B5CB7D0;
}

+ (simd_float3)simdLocalRight
{
  return (simd_float3)xmmword_20B5CB820;
}

+ (simd_float3)simdLocalFront
{
  return (simd_float3)xmmword_20B5CB810;
}

- (simd_float3)simdWorldUp
{
  [(SCNNode *)self simdWorldOrientation];
  float32x4_t v11 = v2;
  [(id)objc_opt_class() simdLocalUp];
  float32x4_t v3 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v11, (int32x4_t)v11), (int8x16_t)v11, 0xCuLL);
  float32x4_t v5 = vnegq_f32(v11);
  float32x4_t v6 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v4, v4), (int8x16_t)v4, 0xCuLL), v5), (float32x4_t)v4, v3);
  int8x16_t v7 = (int8x16_t)vaddq_f32(v6, v6);
  float32x4_t v8 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v7, (int32x4_t)v7), v7, 0xCuLL);
  int8x16_t v9 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v8, (int32x4_t)v8), (int8x16_t)v8, 0xCuLL), v5), v8, v3);
  return (simd_float3)vaddq_f32(vmlaq_laneq_f32((float32x4_t)v4, v8, v11, 3), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v9, (int32x4_t)v9), v9, 0xCuLL));
}

- (simd_float3)simdWorldRight
{
  [(SCNNode *)self simdWorldOrientation];
  float32x4_t v11 = v2;
  [(id)objc_opt_class() simdLocalRight];
  float32x4_t v3 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v11, (int32x4_t)v11), (int8x16_t)v11, 0xCuLL);
  float32x4_t v5 = vnegq_f32(v11);
  float32x4_t v6 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v4, v4), (int8x16_t)v4, 0xCuLL), v5), (float32x4_t)v4, v3);
  int8x16_t v7 = (int8x16_t)vaddq_f32(v6, v6);
  float32x4_t v8 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v7, (int32x4_t)v7), v7, 0xCuLL);
  int8x16_t v9 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v8, (int32x4_t)v8), (int8x16_t)v8, 0xCuLL), v5), v8, v3);
  return (simd_float3)vaddq_f32(vmlaq_laneq_f32((float32x4_t)v4, v8, v11, 3), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v9, (int32x4_t)v9), v9, 0xCuLL));
}

- (simd_float3)simdWorldFront
{
  [(SCNNode *)self simdWorldOrientation];
  float32x4_t v11 = v2;
  [(id)objc_opt_class() simdLocalFront];
  float32x4_t v3 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v11, (int32x4_t)v11), (int8x16_t)v11, 0xCuLL);
  float32x4_t v5 = vnegq_f32(v11);
  float32x4_t v6 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v4, v4), (int8x16_t)v4, 0xCuLL), v5), (float32x4_t)v4, v3);
  int8x16_t v7 = (int8x16_t)vaddq_f32(v6, v6);
  float32x4_t v8 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v7, (int32x4_t)v7), v7, 0xCuLL);
  int8x16_t v9 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v8, (int32x4_t)v8), (int8x16_t)v8, 0xCuLL), v5), v8, v3);
  return (simd_float3)vaddq_f32(vmlaq_laneq_f32((float32x4_t)v4, v8, v11, 3), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v9, (int32x4_t)v9), v9, 0xCuLL));
}

- (void)simdLookAt:(simd_float3)worldTarget
{
  double v7 = *(double *)worldTarget.i64;
  [(SCNNode *)self simdWorldUp];
  double v6 = v4;
  +[SCNNode simdLocalFront];

  [(SCNNode *)self simdLookAt:v7 up:v6 localFront:v5];
}

- (void)simdLookAt:(simd_float3)worldTarget up:(simd_float3)worldUp localFront:(simd_float3)localFront
{
  [(SCNNode *)self simdWorldPosition];
  uint32x4_t v7 = (uint32x4_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3727C5ACu), vabdq_f32((float32x4_t)worldTarget, v6));
  v7.i32[3] = v7.i32[2];
  if ((vminvq_u32(v7) & 0x80000000) == 0)
  {
    float32x4_t v8 = vsubq_f32((float32x4_t)worldTarget, v6);
    int32x4_t v9 = (int32x4_t)vmulq_f32(v8, v8);
    v9.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v9, 2), vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v9.i8, 1))).u32[0];
    float32x2_t v10 = vrsqrte_f32((float32x2_t)v9.u32[0]);
    float32x2_t v11 = vmul_f32(v10, vrsqrts_f32((float32x2_t)v9.u32[0], vmul_f32(v10, v10)));
    float32x4_t v12 = vmulq_n_f32(v8, vmul_f32(v11, vrsqrts_f32((float32x2_t)v9.u32[0], vmul_f32(v11, v11))).f32[0]);
    simd_float3 v13 = localFront;
    int8x16_t v14 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v12, (int32x4_t)v12), (int8x16_t)v12, 0xCuLL), vnegq_f32((float32x4_t)localFront)), v12, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v13, (int32x4_t)v13), (int8x16_t)localFront, 0xCuLL));
    float32x4_t v15 = vmulq_f32(v12, (float32x4_t)localFront);
    float32x4_t v16 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v14, (int32x4_t)v14), v14, 0xCuLL);
    v8.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).f32[0];
    float32x4_t v17 = vmulq_f32((float32x4_t)v13, (float32x4_t)v13);
    float32x4_t v18 = vmulq_f32(v12, v12);
    float v19 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), vaddq_f32(v18, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 1))).f32[0];
    v16.f32[3] = v8.f32[0]
               + sqrtf(vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0], v19));
    int8x16_t v20 = (int8x16_t)vmulq_f32(v16, v16);
    *(float32x2_t *)v20.i8 = vadd_f32(*(float32x2_t *)v20.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v20, v20, 8uLL));
    float32x4_t v21 = (float32x4_t)vdupq_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v20.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v20.i8, 1)), 0);
    float32x4_t v22 = vrsqrteq_f32(v21);
    float32x4_t v23 = vmulq_f32(v22, vrsqrtsq_f32(v21, vmulq_f32(v22, v22)));
    int8x16_t v24 = (int8x16_t)vmulq_f32(v23, vrsqrtsq_f32(v21, vmulq_f32(v23, v23)));
    int8x16_t v25 = (int8x16_t)vceqzq_f32(v21);
    __asm { FMOV            V0.4S, #1.0 }
    float32x4_t v31 = vmulq_f32(v16, (float32x4_t)vbslq_s8(v25, _Q0, v24));
    float32x4_t v32 = (float32x4_t)vuzp1q_s32((int32x4_t)v31, (int32x4_t)v31);
    if (v19 <= 0.000000001)
    {
      float32x4_t v67 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
    }
    else
    {
      float32x4_t v33 = (float32x4_t)vextq_s8((int8x16_t)v32, (int8x16_t)v31, 0xCuLL);
      float32x4_t v34 = vnegq_f32(v31);
      float32x4_t v35 = (float32x4_t)vuzp1q_s32((int32x4_t)v34, (int32x4_t)v34);
      v35.i32[0] = v34.i32[1];
      float v72 = v19;
      float32x4_t v36 = (float32x4_t)vzip1q_s32((int32x4_t)v34, (int32x4_t)v34);
      v36.i32[0] = v34.i32[2];
      float32x4_t v76 = v32;
      v34.i32[3] = v31.i32[3];
      float32x4_t v37 = vmlaq_f32(vmlaq_f32(vmlaq_f32(vmulq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v34, 3), (int8x16_t)v34, 4uLL), (float32x4_t)xmmword_20B5CB7D0), (float32x4_t)xmmword_20B5CBBD0), (float32x4_t)0, v34), (float32x4_t)xmmword_20B5CBBD0, vmulq_f32(v36, (float32x4_t)xmmword_20B5CB6E0)), (float32x4_t)xmmword_20B5EE0D0, v35);
      float32x4_t v38 = (float32x4_t)vuzp1q_s32((int32x4_t)v37, (int32x4_t)v37);
      v38.i32[0] = v37.i32[1];
      float32x4_t v39 = (float32x4_t)vzip1q_s32((int32x4_t)v37, (int32x4_t)v37);
      v39.i32[0] = v37.i32[2];
      float32x4_t v40 = vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v31, (int8x16_t)v31, 0xCuLL), (int8x16_t)v31, 8uLL), v39);
      float32x4_t v41 = v31;
      v41.i32[3] = v31.i32[0];
      float32x4_t v42 = vmlsq_f32(vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32(v41, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v37, 3), (int8x16_t)v37, 4uLL)), (float32x4_t)xmmword_20B5CBBD0), v37, v31, 3), (float32x4_t)xmmword_20B5CBBD0, v40), v38, v33);
      float32x4_t v43 = vmulq_f32(v12, v42);
      float32x4_t v44 = vmlsq_lane_f32(v42, v12, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v43, 2), vaddq_f32(v43, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 1))), 0);
      float32x4_t v45 = vmulq_f32(v44, v44);
      v45.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v45, 2), vaddq_f32(v45, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v45.f32, 1))).u64[0];
      int32x4_t v46 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v45.f32[0] != 0.0)), 0x1FuLL));
      v46.i32[3] = 0;
      float32x4_t v47 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v45.f32, 0);
      float32x4_t v48 = vrsqrteq_f32(v47);
      float32x4_t v49 = vmulq_f32(v48, vrsqrtsq_f32(v47, vmulq_f32(v48, v48)));
      float32x4_t v50 = vmulq_f32(v44, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v46), (int8x16_t)vmulq_f32(v49, vrsqrtsq_f32(v47, vmulq_f32(v49, v49))), _Q0));
      float32x4_t v51 = vmulq_f32(v12, (float32x4_t)worldUp);
      float32x4_t v52 = vmlsq_lane_f32((float32x4_t)worldUp, v12, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v51, 2), vaddq_f32(v51, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v51.f32, 1))), 0);
      float32x4_t v53 = vmulq_f32(v52, v52);
      v53.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v53, 2), vaddq_f32(v53, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v53.f32, 1))).u64[0];
      int32x4_t v54 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v53.f32[0] != 0.0)), 0x1FuLL));
      v54.i32[3] = 0;
      float32x4_t v55 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v53.f32, 0);
      float32x4_t v56 = vrsqrteq_f32(v55);
      float32x4_t v57 = vmulq_f32(v56, vrsqrtsq_f32(v55, vmulq_f32(v56, v56)));
      float32x4_t v58 = vmulq_f32(v52, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v54), (int8x16_t)vmulq_f32(v57, vrsqrtsq_f32(v55, vmulq_f32(v57, v57))), _Q0));
      int8x16_t v59 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v58, (int32x4_t)v58), (int8x16_t)v58, 0xCuLL), vnegq_f32(v50)), v58, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v50, (int32x4_t)v50), (int8x16_t)v50, 0xCuLL));
      float32x4_t v60 = vmulq_f32(v12, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v59, (int32x4_t)v59), v59, 0xCuLL));
      LODWORD(v71) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v60, 2), vaddq_f32(v60, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v60.f32, 1))).u32[0];
      float32x4_t v61 = vmulq_f32(v50, v58);
      float v62 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v61, 2), vaddq_f32(v61, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v61.f32, 1))).f32[0];
      if (v62 >= 1.0) {
        float v62 = 1.0;
      }
      if (v62 <= -1.0) {
        float v62 = -1.0;
      }
      float32x4_t v74 = v12;
      float32x4_t v78 = v31;
      float v63 = acosf(v62);
      if (v71 <= 0.0) {
        float v63 = -v63;
      }
      __float2 v64 = __sincosf_stret(v63 * 0.5);
      float32x4_t v31 = v78;
      float32x2_t v65 = vrsqrte_f32((float32x2_t)LODWORD(v72));
      float32x2_t v66 = vmul_f32(v65, vrsqrts_f32((float32x2_t)LODWORD(v72), vmul_f32(v65, v65)));
      float32x4_t v32 = v76;
      float32x4_t v67 = vmulq_n_f32(vmulq_n_f32(v74, vmul_f32(v66, vrsqrts_f32((float32x2_t)LODWORD(v72), vmul_f32(v66, v66))).f32[0]), v64.__sinval);
      v67.i32[3] = LODWORD(v64.__cosval);
    }
    float32x4_t v68 = v67;
    v68.i32[3] = v67.i32[0];
    float32x4_t v69 = (float32x4_t)vzip1q_s32((int32x4_t)v31, (int32x4_t)v31);
    v69.i32[0] = v31.i32[2];
    v32.i32[0] = v31.i32[1];
    *(void *)&double v70 = vmlsq_f32(vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v31, 3), (int8x16_t)v31, 4uLL), v68), (float32x4_t)xmmword_20B5CBBD0), v31, v67, 3), (float32x4_t)xmmword_20B5CBBD0, vmulq_f32(v69, (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v67, (int8x16_t)v67, 0xCuLL), (int8x16_t)v67,
                                           8uLL))),
                        v32,
                        (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v67, (int32x4_t)v67), (int8x16_t)v67, 0xCuLL)).u64[0];
    [(SCNNode *)self setSimdWorldOrientation:v70];
  }
}

- (void)simdLocalTranslateBy:(simd_float3)translation
{
  [(SCNNode *)self simdOrientation];
  float32x4_t v5 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v4, v4), (int8x16_t)v4, 0xCuLL);
  float32x4_t v6 = vnegq_f32((float32x4_t)v4);
  float32x4_t v7 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)translation, (int32x4_t)translation), (int8x16_t)translation, 0xCuLL), v6), (float32x4_t)translation, v5);
  int8x16_t v8 = (int8x16_t)vaddq_f32(v7, v7);
  float32x4_t v9 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v8, (int32x4_t)v8), v8, 0xCuLL);
  float32x4_t v10 = vmlaq_laneq_f32((float32x4_t)translation, v9, (float32x4_t)v4, 3);
  int8x16_t v11 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v9, (int32x4_t)v9), (int8x16_t)v9, 0xCuLL), v6), v9, v5);
  float32x4_t v15 = vaddq_f32(v10, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v11, (int32x4_t)v11), v11, 0xCuLL));
  [(SCNNode *)self simdPosition];
  *(void *)&double v13 = vaddq_f32(v12, v15).u64[0];

  [(SCNNode *)self setSimdPosition:v13];
}

- (void)simdLocalRotateBy:(simd_quatf)rotation
{
  [(SCNNode *)self simdOrientation];
  float32x4_t v5 = v4;
  v5.i32[3] = v4.i32[0];
  simd_quatf v6 = rotation;
  float32x4_t v7 = (float32x4_t)vzip1q_s32((int32x4_t)v6, (int32x4_t)v6);
  v7.i32[0] = rotation.vector.i32[2];
  float32x4_t v8 = (float32x4_t)vuzp1q_s32((int32x4_t)v6, (int32x4_t)v6);
  v8.i32[0] = rotation.vector.i32[1];
  *(void *)&double v9 = vmlsq_f32(vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)rotation, 3), (int8x16_t)rotation, 4uLL), v5), (float32x4_t)xmmword_20B5CBBD0), (float32x4_t)rotation, v4, 3), (float32x4_t)xmmword_20B5CBBD0, vmulq_f32(v7, (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v4, (int8x16_t)v4, 0xCuLL), (int8x16_t)v4, 8uLL))), v8, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v4, (int32x4_t)v4), (int8x16_t)v4, 0xCuLL)).u64[0];

  [(SCNNode *)self setSimdOrientation:v9];
}

- (void)simdRotateBy:(simd_quatf)worldRotation aroundTarget:(simd_float3)worldTarget
{
  unint64_t v5 = 0;
  float32x4_t v6 = *(float32x4_t *)MEMORY[0x263EF89A8];
  float32x4_t v7 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
  float32x4_t v8 = vmulq_f32((float32x4_t)worldRotation, (float32x4_t)worldRotation);
  float32x4_t v9 = vaddq_f32(v8, v8);
  float32x4_t v10 = vmulq_laneq_f32((float32x4_t)worldRotation, (float32x4_t)worldRotation, 3);
  float v11 = vmulq_lane_f32((float32x4_t)worldRotation, *(float32x2_t *)worldRotation.vector.f32, 1).f32[0];
  v15.i32[3] = HIDWORD(*MEMORY[0x263EF89A8]);
  v15.f32[0] = (float)(1.0 - v9.f32[1]) - v9.f32[2];
  v15.f32[1] = (float)(v11 + v10.f32[2]) + (float)(v11 + v10.f32[2]);
  float32x4_t v12 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 32);
  float32x4_t v13 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
  v16.i32[3] = v7.i32[3];
  v16.f32[0] = (float)(v11 - v10.f32[2]) + (float)(v11 - v10.f32[2]);
  v9.f32[0] = 1.0 - v9.f32[0];
  v16.f32[1] = v9.f32[0] - v9.f32[2];
  float32x2_t v14 = vmul_laneq_f32(*(float32x2_t *)worldRotation.vector.f32, (float32x4_t)worldRotation, 2);
  v15.f32[2] = (float)(v14.f32[0] - v10.f32[1]) + (float)(v14.f32[0] - v10.f32[1]);
  v16.f32[2] = (float)(v14.f32[1] + v10.f32[0]) + (float)(v14.f32[1] + v10.f32[0]);
  *(int32x2_t *)v10.f32 = vrev64_s32(*(int32x2_t *)v10.f32);
  v17.i32[0] = vadd_f32(v14, *(float32x2_t *)v10.f32).u32[0];
  v17.i32[1] = vsub_f32(v14, *(float32x2_t *)&v10).i32[1];
  *(float32x2_t *)v18.f32 = vadd_f32(v17, v17);
  v18.i32[3] = vextq_s8(*(int8x16_t *)&v12, *(int8x16_t *)&v12, 8uLL).i32[1];
  v18.f32[2] = v9.f32[0] - v9.f32[1];
  float32x4_t v19 = vnegq_f32((float32x4_t)worldTarget);
  v19.i32[3] = v13.i32[3];
  float32x4_t v34 = *(float32x4_t *)MEMORY[0x263EF89A8];
  float32x4_t v35 = v7;
  float32x4_t v36 = v12;
  float32x4_t v37 = v19;
  float32x4_t v38 = 0u;
  float32x4_t v39 = 0u;
  float32x4_t v40 = 0u;
  float32x4_t v41 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v38 + v5) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v15, COERCE_FLOAT(*(_OWORD *)((char *)&v34 + v5))), v16, *(float32x2_t *)&v34.f32[v5 / 4], 1), v18, *(float32x4_t *)((char *)&v34 + v5), 2), v13, *(float32x4_t *)((char *)&v34 + v5), 3);
    v5 += 16;
  }
  while (v5 != 64);
  unint64_t v20 = 0;
  worldTarget.i32[3] = v13.i32[3];
  float32x4_t v34 = v38;
  float32x4_t v35 = v39;
  float32x4_t v36 = v40;
  float32x4_t v37 = v41;
  float32x4_t v38 = 0u;
  float32x4_t v39 = 0u;
  float32x4_t v40 = 0u;
  float32x4_t v41 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v38 + v20) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v6, COERCE_FLOAT(*(_OWORD *)((char *)&v34 + v20))), v7, *(float32x2_t *)&v34.f32[v20 / 4], 1), v12, *(float32x4_t *)((char *)&v34 + v20), 2), (float32x4_t)worldTarget, *(float32x4_t *)((char *)&v34 + v20), 3);
    v20 += 16;
  }
  while (v20 != 64);
  float32x4_t v32 = v39;
  float32x4_t v33 = v38;
  float32x4_t v30 = v41;
  float32x4_t v31 = v40;
  [(SCNNode *)self simdWorldTransform];
  unint64_t v21 = 0;
  float32x4_t v34 = v22;
  float32x4_t v35 = v23;
  float32x4_t v36 = v24;
  float32x4_t v37 = v25;
  float32x4_t v38 = 0u;
  float32x4_t v39 = 0u;
  float32x4_t v40 = 0u;
  float32x4_t v41 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v38 + v21) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v33, COERCE_FLOAT(*(_OWORD *)((char *)&v34 + v21))), v32, *(float32x2_t *)&v34.f32[v21 / 4], 1), v31, *(float32x4_t *)((char *)&v34 + v21), 2), v30, *(float32x4_t *)((char *)&v34 + v21), 3);
    v21 += 16;
  }
  while (v21 != 64);
  double v26 = *(double *)v40.i64;
  double v27 = *(double *)v41.i64;
  double v28 = *(double *)v38.i64;
  double v29 = *(double *)v39.i64;

  -[SCNNode setSimdWorldTransform:](self, "setSimdWorldTransform:", v28, v29, v26, v27);
}

- (int64_t)authoringCameraType
{
  id AssociatedObject = objc_getAssociatedObject(self, sel_authoringCameraType);

  return [AssociatedObject integerValue];
}

- (void)setAuthoringCameraType:(int64_t)a3
{
  float32x4_t v4 = (void *)[NSNumber numberWithInteger:a3];

  objc_setAssociatedObject(self, sel_authoringCameraType, v4, (void *)0x301);
}

- (id)debugQuickLookObject
{
  float32x4_t v2 = [(SCNNode *)self clone];
  [(SCNNode *)v2 setHidden:0];
  float32x4_t v3 = +[SCNScene scene];
  [(SCNNode *)[(SCNScene *)v3 rootNode] addChildNode:v2];

  return [(SCNScene *)v3 debugQuickLookObject];
}

- (id)debugQuickLookData
{
  float32x4_t v2 = [(SCNNode *)self debugQuickLookObject];

  return UIImagePNGRepresentation(v2);
}

- (void)setName:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)_setQuaternion:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)_setPosition:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)_setScale:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setMovabilityHint:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setCastsShadow:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setUsesDepthPrePass:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setCategoryBitMask:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setHidden:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setOpacity:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setRenderingOrder:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setValue:forUndefinedKey:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)__removeAnimation:(uint64_t)a3 forKey:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)__insertObject:inChildNodesAtIndex:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: attempt to add a parent node as a child node", v2, v3, v4, v5, v6);
}

- (void)__removeObjectFromChildNodesAtIndex:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: removeChildNodeAtIndex - index out of bounds", v2, v3, v4, v5, v6);
}

void __47__SCNNode___removeObjectFromChildNodesAtIndex___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: error in removeObjectFromChildNodesAtIndex -> try to remove inconsitent node", v2, v3, v4, v5, v6);
}

- (void)replaceObjectInChildNodesAtIndex:withObject:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: error in replaceObjectInChildNodesAtIndex -> index out of bounds", v2, v3, v4, v5, v6);
}

- (void)replaceObjectInChildNodesAtIndex:withObject:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_20B249000, v1, OS_LOG_TYPE_ERROR, "Unreachable code: circular reference found when trying to add %@ as a child node of %@", v2, 0x16u);
}

void __55__SCNNode_replaceObjectInChildNodesAtIndex_withObject___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: error in replaceObjectInChildNodesAtIndex", v2, v3, v4, v5, v6);
}

- (void)frame
{
}

- (void)setPhysicsBody:(void *)a1 .cold.1(void *a1)
{
  [a1 _owner];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_9_0(&dword_20B249000, v1, v2, "Error: Physics body %@ already has a owner: %@ that is not %@", v3, v4, v5, v6, v7);
}

- (void)setPhysicsBody:(void *)a1 .cold.2(void *a1)
{
  [a1 _owner];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_9_0(&dword_20B249000, v1, v2, "Error: Physics body %@ 's owner (%@) should be %@", v3, v4, v5, v6, v7);
}

- (void)addParticleSystem:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: attempt to add a null particle system on %@", v2, v3, v4, v5, v6);
}

- (void)removeObjectFromParticleSystemsAtIndex:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)replaceObjectInParticleSystemsAtIndex:(uint64_t)a3 withObject:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addAudioPlayer:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: attempt to add a null audio player on %@", v2, v3, v4, v5, v6);
}

@end