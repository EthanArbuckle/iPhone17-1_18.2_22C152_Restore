@interface SCNMorpher
+ (BOOL)supportsSecureCoding;
+ (Class)SCNUID_classForElementOfArray:(id)a3;
+ (SCNMorpher)morpherWithMorphRef:(__C3DMorph *)a3;
+ (id)morpher;
+ (id)weightIndexStringForIndex:(int64_t)a3;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)_isUsingSparseTargets;
- (BOOL)_validateTargetsAndInBetweens:(void *)a3 inBetweenCounts:(void *)a4 inBetweenWeights:;
- (BOOL)isAnimationForKeyPaused:(id)a3;
- (BOOL)isPausedOrPausedByInheritance;
- (BOOL)shouldClearCPUDataAfterUpload;
- (BOOL)shouldMorphNormals;
- (BOOL)unifiesNormals;
- (CGFloat)weightForTargetAtIndex:(NSUInteger)targetIndex;
- (CGFloat)weightForTargetNamed:(NSString *)targetName;
- (NSArray)animationKeys;
- (NSArray)targets;
- (NSArray)weights;
- (NSString)description;
- (SCNMorpher)init;
- (SCNMorpher)initWithCoder:(id)a3;
- (SCNMorpher)initWithMorphRef:(__C3DMorph *)a3;
- (SCNMorpherCalculationMode)calculationMode;
- (__C3DAnimationManager)animationManager;
- (__C3DMorph)morphRef;
- (__C3DScene)sceneRef;
- (double)_presentationWeightForTargetAtIndex:(unint64_t)a3 token:(const void *)a4;
- (float)weightIncrementalThreshold;
- (id)_scnAnimationForKey:(id)a3;
- (id)_scnBindings;
- (id)_sortTargetsAndInBetweens:(void *)a3 inBetweenCounts:(void *)a4 inBetweenWeights:;
- (id)animationForKey:(id)a3;
- (id)animationPlayerForKey:(id)a3;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)correctiveDriverCounts;
- (id)correctiveDriverIndices;
- (id)correctiveDriverIndicesForCorrectiveAtIndex:(unint64_t)a3;
- (id)correctiveInBetweenCounts;
- (id)correctiveInBetweenWeights;
- (id)correctives;
- (id)correctivesAndInBetween;
- (id)identifier;
- (id)inBetweenCounts;
- (id)inBetweenTargetsForCorrectiveAtIndex:(unint64_t)a3;
- (id)inBetweenTargetsForTargetAtIndex:(unint64_t)a3;
- (id)inBetweenWeights;
- (id)inBetweenWeightsForCorrectiveAtIndex:(unint64_t)a3;
- (id)inBetweenWeightsForTargetAtIndex:(unint64_t)a3;
- (id)initPresentationMorpherWithMorphRef:(__C3DMorph *)a3;
- (id)name;
- (id)presentationMorpher;
- (id)scene;
- (id)targetsAndInBetween;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)_weightIndexForTargetNamed:(id)a3;
- (unint64_t)correctiveDriverCountForCorrectiveAtIndex:(unint64_t)a3;
- (void)__CFObject;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_customDecodingOfSCNMorpher:(id)a3;
- (void)_customEncodingOfSCNMorpher:(id)a3;
- (void)_didDecodeSCNMorpher:(id)a3;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_syncEntityObjCModel;
- (void)_syncObjCAnimations;
- (void)_syncObjCModel;
- (void)_updateCorrectivesAndInBetween:(id)a3;
- (void)_updateTargetsAndInBetween:(id)a3;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)clearCorrectives;
- (void)clearInBetweens;
- (void)convertToAdditiveWithBaseGeometry:(id)a3;
- (void)convertToSparseWithBaseGeometry:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)pauseAnimationForKey:(id)a3;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(double)a3;
- (void)removeAllBindings;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(double)a4;
- (void)resumeAnimationForKey:(id)a3;
- (void)setCalculationMode:(SCNMorpherCalculationMode)calculationMode;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setShouldClearCPUDataAfterUpload:(BOOL)a3;
- (void)setShouldMorphNormals:(BOOL)a3;
- (void)setSpeed:(double)a3 forAnimationKey:(id)a4;
- (void)setTargets:(NSArray *)targets;
- (void)setTargets:(id)a3 withInBetweenTargetCounts:(id)a4 inBetweenWeights:(id)a5;
- (void)setTargetsAndInBetweens:(id)a3 inBetweenCounts:(id)a4 inBetweenWeights:(id)a5 correctives:(id)a6 driverCounts:(id)a7 driverIndices:(id)a8 inBetweenCounts:(id)a9 inBetweenWeights:(id)a10;
- (void)setUnifiesNormals:(BOOL)unifiesNormals;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setWeight:(CGFloat)weight forTargetAtIndex:(NSUInteger)targetIndex;
- (void)setWeight:(CGFloat)weight forTargetNamed:(NSString *)targetName;
- (void)setWeightIncrementalThreshold:(float)a3;
- (void)setWeights:(NSArray *)weights;
- (void)unbindAnimatablePath:(id)a3;
@end

@implementation SCNMorpher

- (SCNMorpher)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCNMorpher;
  v2 = [(SCNMorpher *)&v5 init];
  if (v2)
  {
    uint64_t v3 = C3DMorphCreate();
    v2->_morpher = (__C3DMorph *)v3;
    if (v3) {
      C3DEntitySetObjCWrapper(v3, v2);
    }
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    [(SCNMorpher *)v2 _syncObjCModel];
  }
  return v2;
}

- (SCNMorpher)initWithMorphRef:(__C3DMorph *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNMorpher;
  v4 = [(SCNMorpher *)&v7 init];
  if (v4)
  {
    objc_super v5 = (__C3DMorph *)CFRetain(a3);
    v4->_morpher = v5;
    if (v5) {
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    }
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    [(SCNMorpher *)v4 _syncObjCModel];
    [(SCNMorpher *)v4 _syncObjCAnimations];
  }
  return v4;
}

- (id)initPresentationMorpherWithMorphRef:(__C3DMorph *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNMorpher;
  v4 = [(SCNMorpher *)&v7 init];
  objc_super v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 16) |= 1u;
    v4->_morpher = (__C3DMorph *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (SCNMorpher)morpherWithMorphRef:(__C3DMorph *)a3
{
  result = (SCNMorpher *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
  {
    v6 = (void *)[objc_alloc((Class)a1) initWithMorphRef:a3];
    return (SCNMorpher *)v6;
  }
  return result;
}

+ (id)morpher
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (void)clearInBetweens
{
  self->_mainTargetsAndInBetweens = 0;
  self->_inBetweenCounts = 0;
  self->_inBetweenInfluenceWeights = 0;
}

- (void)clearCorrectives
{
  self->_correctiveInBetweenInfluenceWeights = 0;
  *(_OWORD *)&self->_correctiveDriverIndices = 0u;
  *(_OWORD *)&self->_correctivesAndInBetweens = 0u;
}

- (void)dealloc
{
  morpher = self->_morpher;
  if (morpher)
  {
    if ((*((unsigned char *)self + 16) & 1) == 0)
    {
      C3DEntitySetObjCWrapper((uint64_t)morpher, 0);
      morpher = self->_morpher;
    }
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __21__SCNMorpher_dealloc__block_invoke;
    v5[3] = &__block_descriptor_40_e8_v16__0d8l;
    v5[4] = morpher;
    +[SCNTransaction postCommandWithContext:0 object:0 applyBlock:v5];
  }
  [(SCNMorpher *)self clearInBetweens];
  [(SCNMorpher *)self clearCorrectives];

  free(self->_weights);
  v4.receiver = self;
  v4.super_class = (Class)SCNMorpher;
  [(SCNMorpher *)&v4 dealloc];
}

void __21__SCNMorpher_dealloc__block_invoke(uint64_t a1)
{
}

- (void)setName:(id)a3
{
  if (*((unsigned char *)self + 16))
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNMorpher setName:]();
    }
  }
  else if ((unint64_t)a3 | (unint64_t)self->_name)
  {
    if ((objc_msgSend(a3, "isEqual:") & 1) == 0)
    {

      self->_name = (NSString *)[a3 copy];
      objc_super v5 = [(SCNMorpher *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __22__SCNMorpher_setName___block_invoke;
      v7[3] = &unk_264006160;
      v7[4] = self;
      v7[5] = a3;
      +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
    }
  }
}

CFStringRef __22__SCNMorpher_setName___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  CFStringRef v3 = *(const __CFString **)(a1 + 40);

  return C3DEntitySetName(v2, v3);
}

- (id)name
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_name;
  }
  objc_super v4 = [(SCNMorpher *)self sceneRef];
  uint64_t v5 = (uint64_t)v4;
  if (v4) {
    C3DSceneLock((uint64_t)v4);
  }
  Name = (void *)C3DEntityGetName((uint64_t)[(SCNMorpher *)self __CFObject]);
  if (v5) {
    C3DSceneUnlock(v5);
  }
  return Name;
}

- (void)setIdentifier:(id)a3
{
  objc_super v4 = [(SCNMorpher *)self __CFObject];

  C3DEntitySetID((uint64_t)v4, a3);
}

- (id)identifier
{
  uint64_t v2 = [(SCNMorpher *)self __CFObject];

  return (id)C3DEntityGetID((uint64_t)v2);
}

- (void)_syncEntityObjCModel
{
  CFStringRef v3 = [(SCNMorpher *)self __CFObject];

  self->_name = (NSString *)(id)C3DEntityGetName((uint64_t)v3);
}

- (__C3DMorph)morphRef
{
  return self->_morpher;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<SCNMorpher %p>", self);
}

- (void)__CFObject
{
  return self->_morpher;
}

- (__C3DAnimationManager)animationManager
{
  result = [(SCNMorpher *)self sceneRef];
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
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  BOOL v8 = objc_msgSend(-[SCNOrderedDictionary objectForKey:](self->_animations, "objectForKey:", a4), "animation") == (void)a3;
  if (v8)
  {
    [(SCNOrderedDictionary *)self->_animations removeObjectForKey:a4];
    v9 = [(SCNMorpher *)self __CFObject];
    if ((CFTypeIsC3DEntity(v9) & 1) == 0)
    {
      v10 = scn_default_log();
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
    BOOL v8 = [(SCNMorpher *)self sceneRef];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __40__SCNMorpher_addAnimationPlayer_forKey___block_invoke;
    v10[3] = &unk_264006138;
    v10[4] = a3;
    v10[5] = self;
    v10[6] = v5;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v10];
  }
  else
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNTechnique addAnimationPlayer:forKey:]((uint64_t)self, v9);
    }
  }
}

void __40__SCNMorpher_addAnimationPlayer_forKey___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "prepareWithTarget:implicitDuration:", a1[5]);
  if ((SCNAddAnimation(a1[4], a1[5], a1[6]) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 8);
    [*((id *)a1[5] + 5) removeObjectForKey:a1[6]];
    uint64_t v2 = (os_unfair_lock_s *)((char *)a1[5] + 32);
    os_unfair_lock_unlock(v2);
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    v6 = (SCNAnimation *)a3;
    if (!a4) {
      id v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString");
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = +[SCNAnimation animationWithCAAnimation:v6];
    }
    objc_super v7 = +[SCNAnimationPlayer animationPlayerWithSCNAnimation:v6];
    [(SCNMorpher *)self addAnimationPlayer:v7 forKey:v5];
    [(SCNAnimationPlayer *)v7 play];
  }
  else
  {
    BOOL v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNTechnique addAnimation:forKey:]((uint64_t)self, v8);
    }
  }
}

- (void)addAnimation:(id)a3
{
}

- (void)removeAllAnimations
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  [(SCNOrderedDictionary *)self->_animations removeAllObjects];
  os_unfair_lock_unlock(p_animationsLock);
  objc_super v4 = [(SCNMorpher *)self sceneRef];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__SCNMorpher_removeAllAnimations__block_invoke;
  v5[3] = &unk_264005010;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:v4 object:self applyBlock:v5];
}

void __33__SCNMorpher_removeAllAnimations__block_invoke(uint64_t a1)
{
}

- (void)removeAllAnimationsWithBlendOutDuration:(double)a3
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  [(SCNOrderedDictionary *)self->_animations removeAllObjects];
  os_unfair_lock_unlock(p_animationsLock);
  v6 = [(SCNMorpher *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SCNMorpher_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
}

void __54__SCNMorpher_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
{
}

- (void)removeAnimationForKey:(id)a3
{
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    [(SCNOrderedDictionary *)self->_animations removeObjectForKey:a3];
    os_unfair_lock_unlock(p_animationsLock);
    v6 = [(SCNMorpher *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__SCNMorpher_removeAnimationForKey___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __36__SCNMorpher_removeAnimationForKey___block_invoke(uint64_t a1)
{
}

- (void)removeAnimationForKey:(id)a3 blendOutDuration:(double)a4
{
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    [(SCNOrderedDictionary *)self->_animations removeObjectForKey:a3];
    os_unfair_lock_unlock(p_animationsLock);
    BOOL v8 = [(SCNMorpher *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__SCNMorpher_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_264004E20;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v9];
  }
}

void __53__SCNMorpher_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
{
}

- (NSArray)animationKeys
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  objc_super v4 = [(SCNOrderedDictionary *)self->_animations allKeys];
  os_unfair_lock_unlock(p_animationsLock);
  if ([(NSArray *)v4 count]) {
    return v4;
  }
  else {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
}

- (void)_syncObjCAnimations
{
  CFStringRef v3 = [(SCNMorpher *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(SCNOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  id v5 = [(SCNMorpher *)self __CFObject];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    if ((CFTypeIsC3DEntity(v5) & 1) == 0)
    {
      objc_super v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        [(SCNNode *)v7 _syncObjCAnimations];
      }
    }
    CFDictionaryRef Animations = C3DEntityGetAnimations(v6);
    if (Animations)
    {
      CFDictionaryRef v16 = Animations;
      os_unfair_lock_lock(&self->_animationsLock);
      C3DOrderedDictionaryApplyFunction(v16, (const char *)SCNConvertC3DAnimationDictionaryFunc, (uint64_t)self->_animations);
      os_unfair_lock_unlock(&self->_animationsLock);
    }
  }
  if (v4) {
    C3DSceneUnlock(v4);
  }
}

- (id)animationForKey:(id)a3
{
  id v3 = [(SCNMorpher *)self _scnAnimationForKey:a3];
  uint64_t v4 = (void *)MEMORY[0x263F15748];

  return (id)[v4 animationWithSCNAnimation:v3];
}

- (id)_scnAnimationForKey:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
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

- (void)_copyAnimationsFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(a3, "animationKeys", 0);
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
        uint64_t v11 = objc_msgSend((id)objc_msgSend(a3, "animationPlayerForKey:", v10), "copy");
        [(SCNMorpher *)self addAnimationPlayer:v11 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)animationPlayerForKey:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
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
  uint64_t v9 = [(SCNMorpher *)self __CFObject];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = [(SCNMorpher *)self animationManager];
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
  BOOL v5 = [(SCNMorpher *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__SCNMorpher_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __35__SCNMorpher_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:1 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)resumeAnimationForKey:(id)a3
{
  BOOL v5 = [(SCNMorpher *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__SCNMorpher_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __36__SCNMorpher_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:0 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7 = [NSString stringWithFormat:@"animations.%@.speed", a4];
  uint64_t v8 = [(SCNMorpher *)self sceneRef];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__SCNMorpher_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_264004E20;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:v8 object:self keyPath:v7 applyBlock:v9];
}

void __39__SCNMorpher_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNMorpher *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  uint64_t v7 = [(SCNMorpher *)self __CFObject];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [(SCNMorpher *)self animationManager];
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

    long long v15 = [(SCNMorpher *)self sceneRef];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __62__SCNMorpher_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_264006188;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:v15 object:self applyBlock:v16];
  }
}

void __62__SCNMorpher_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNMorpher *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__SCNMorpher_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __35__SCNMorpher_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  uint64_t v2 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  CFStringRef v3 = *(const __CFString **)(a1 + 40);

  C3DEntityRemoveBindingWithKeyPath(v2, v3);
}

- (void)removeAllBindings
{
  self->_bindings = 0;
  CFStringRef v3 = [(SCNMorpher *)self sceneRef];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__SCNMorpher_removeAllBindings__block_invoke;
  v4[3] = &unk_264005010;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:v3 object:self applyBlock:v4];
}

void __31__SCNMorpher_removeAllBindings__block_invoke(uint64_t a1)
{
  v1 = (CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");

  C3DEntityRemoveAllBindings(v1);
}

- (void)_syncObjCModel
{
  CFStringRef v3 = [(SCNMorpher *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  morpher = self->_morpher;
  if (!morpher) {
    goto LABEL_32;
  }
  self->_unifyNormal = C3DMorphGetMorphNormals((uint64_t)self->_morpher) ^ 1;
  self->_useSparseTargets = C3DMorphIsUsingSparseTargets((uint64_t)morpher);
  uint64_t v6 = C3DMorphCopyMainTargets((uint64_t)morpher);
  if (v6)
  {
    uint64_t v7 = v6;

    [(SCNMorpher *)self clearInBetweens];
    [(SCNMorpher *)self clearCorrectives];
    self->_mainTargets = (NSArray *)_createSCNGeometryArrayFromC3DGeometryArray(v7);
    CFIndex Count = CFArrayGetCount(v7);
    BOOL v9 = Count > 0;
    if (Count >= 1)
    {
      CFIndex v10 = Count;
      self->_weightCFIndex Count = Count;
      uint64_t v11 = 0;
      self->_weights = (float *)malloc_type_realloc(self->_weights, 4 * Count, 0x100004052888210uLL);
      do
      {
        self->_weights[v11] = C3DMorphGetWeightAtIndex((uint64_t)morpher, v11);
        ++v11;
      }
      while (v10 != v11);
    }
    CFRelease(v7);
  }
  else
  {
    BOOL v9 = 0;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  C3DMorpherGetExtraTargetInfo((uint64_t)morpher, (uint64_t)&v32);
  int v12 = DWORD1(v32);
  if (DWORD1(v32))
  {
    uint64_t v13 = (v32 + DWORD1(v32));
    OverrideMaterial = (void *)C3DGeometryGetOverrideMaterial((uint64_t)morpher);
    self->_mainTargetsAndInBetweens = (NSArray *)_createSCNGeometrySubArrayFromC3DGeometryArray(OverrideMaterial, 0, v13);
    id v15 = objc_alloc(MEMORY[0x263EFF980]);
    self->_inBetweenCounts = (NSArray *)[v15 initWithCapacity:v32];
    if (v32)
    {
      unint64_t v16 = 0;
      do
        -[NSArray addObject:](self->_inBetweenCounts, "addObject:", [NSNumber numberWithUnsignedInt:*(unsigned int *)(*((void *)&v32 + 1) + 4 * v16++)]);
      while (v16 < v32);
    }
    id v17 = objc_alloc(MEMORY[0x263EFF980]);
    self->_inBetweenInfluenceWeights = (NSArray *)[v17 initWithCapacity:DWORD1(v32)];
    int v12 = DWORD1(v32);
    if (DWORD1(v32))
    {
      unint64_t v19 = 0;
      do
      {
        LODWORD(v18) = *(_DWORD *)(v33 + 4 * v19);
        -[NSArray addObject:](self->_inBetweenInfluenceWeights, "addObject:", [NSNumber numberWithFloat:v18]);
        ++v19;
        int v12 = DWORD1(v32);
      }
      while (v19 < DWORD1(v32));
    }
  }
  if (DWORD2(v33))
  {
    unint64_t v20 = (v12 + v32);
    uint64_t v21 = (DWORD2(v35) + DWORD2(v33));
    v22 = (void *)C3DGeometryGetOverrideMaterial((uint64_t)morpher);
    self->_correctivesAndInBetweens = (NSArray *)_createSCNGeometrySubArrayFromC3DGeometryArray(v22, v20, v21);
    id v23 = objc_alloc(MEMORY[0x263EFF980]);
    self->_correctiveDriverCounts = (NSArray *)[v23 initWithCapacity:DWORD2(v33)];
    if (DWORD2(v33))
    {
      unint64_t v24 = 0;
      do
        -[NSArray addObject:](self->_correctiveDriverCounts, "addObject:", [NSNumber numberWithUnsignedInt:*(unsigned int *)(v34 + 4 * v24++)]);
      while (v24 < DWORD2(v33));
    }
    id v25 = objc_alloc(MEMORY[0x263EFF980]);
    self->_correctiveDriverIndices = (NSArray *)[v25 initWithCapacity:DWORD2(v34)];
    if (DWORD2(v34))
    {
      unint64_t v26 = 0;
      do
        -[NSArray addObject:](self->_correctiveDriverIndices, "addObject:", [NSNumber numberWithUnsignedInt:*(unsigned int *)(v35 + 4 * v26++)]);
      while (v26 < DWORD2(v34));
    }
    if (DWORD2(v35))
    {
      id v27 = objc_alloc(MEMORY[0x263EFF980]);
      self->_correctiveInBetweenCounts = (NSArray *)[v27 initWithCapacity:DWORD2(v33)];
      if (DWORD2(v33))
      {
        unint64_t v28 = 0;
        do
          -[NSArray addObject:](self->_correctiveInBetweenCounts, "addObject:", [NSNumber numberWithUnsignedInt:*(unsigned int *)(v36 + 4 * v28++)]);
        while (v28 < DWORD2(v33));
      }
      id v29 = objc_alloc(MEMORY[0x263EFF980]);
      self->_correctiveInBetweenInfluenceWeights = (NSArray *)[v29 initWithCapacity:DWORD2(v35)];
      if (DWORD2(v35))
      {
        unint64_t v31 = 0;
        do
        {
          LODWORD(v30) = *(_DWORD *)(*((void *)&v36 + 1) + 4 * v31);
          -[NSArray addObject:](self->_correctiveInBetweenInfluenceWeights, "addObject:", [NSNumber numberWithFloat:v30]);
          ++v31;
        }
        while (v31 < DWORD2(v35));
      }
    }
  }
  self->_calculationMode = C3DMorphGetCalculationMode((uint64_t)morpher) == 1;
  if (!v9)
  {
LABEL_32:
    free(self->_weights);
    self->_weightCFIndex Count = 0;
  }
  [(SCNMorpher *)self _syncEntityObjCModel];
  if (v4) {
    C3DSceneUnlock(v4);
  }
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (id)presentationMorpher
{
  if ((*((unsigned char *)self + 16) & 1) == 0)
  {
    id v2 = [[SCNMorpher alloc] initPresentationMorpherWithMorphRef:*((void *)self + 1)];
    return v2;
  }
  return self;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (void)setTargets:(NSArray *)targets
{
  [(SCNMorpher *)self clearInBetweens];
  [(SCNMorpher *)self clearCorrectives];

  self->_mainTargets = (NSArray *)[(NSArray *)targets copy];
  self->_mainTargetNamesToIndexes = 0;
  BOOL v5 = [(SCNMorpher *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __25__SCNMorpher_setTargets___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = targets;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __25__SCNMorpher_setTargets___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) morphRef];
  if (v2)
  {
    uint64_t v3 = v2;
    CFArrayRef C3DGeometryArrayFromSCNGeometryArray = (const __CFArray *)_createC3DGeometryArrayFromSCNGeometryArray(*(void **)(a1 + 40));
    C3DMorphSetTargets(v3, C3DGeometryArrayFromSCNGeometryArray, *(unsigned __int8 *)(*(void *)(a1 + 32) + 161));
  }
}

- (NSArray)targets
{
  if ((*((unsigned char *)self + 16) & 1) == 0)
  {
    if ([(NSArray *)self->_mainTargets count]) {
      return self->_mainTargets;
    }
    else {
      return (NSArray *)MEMORY[0x263EFFA68];
    }
  }
  uint64_t v4 = [(SCNMorpher *)self sceneRef];
  uint64_t v5 = (uint64_t)v4;
  if (v4) {
    C3DSceneLock((uint64_t)v4);
  }
  morpher = self->_morpher;
  if (!morpher || (uint64_t v7 = C3DMorphCopyMainTargets((uint64_t)morpher)) == 0)
  {
    SCNGeometryArrayFromC3DGeometryArray = 0;
    if (!v5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v8 = v7;
  SCNGeometryArrayFromC3DGeometryArray = _createSCNGeometryArrayFromC3DGeometryArray(v7);
  CFRelease(v8);
  if (v5) {
LABEL_11:
  }
    C3DSceneUnlock(v5);
LABEL_12:
  result = SCNGeometryArrayFromC3DGeometryArray;
  if (!result) {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
  return result;
}

- (NSArray)weights
{
  if (*((unsigned char *)self + 16))
  {
    CFIndex v10 = [(SCNMorpher *)self sceneRef];
    uint64_t v11 = (uint64_t)v10;
    if (v10) {
      C3DSceneLock((uint64_t)v10);
    }
    morpher = self->_morpher;
    if (morpher)
    {
      WeightCFIndex Count = C3DMorphGetWeightCount((uint64_t)self->_morpher);
      long long v14 = (NSArray *)[MEMORY[0x263EFF980] arrayWithCapacity:WeightCount];
      if (WeightCount >= 1)
      {
        for (uint64_t i = 0; i != WeightCount; ++i)
        {
          *(float *)&double v16 = C3DMorphGetWeightAtIndex((uint64_t)morpher, i);
          -[NSArray addObject:](v14, "addObject:", [NSNumber numberWithFloat:v16]);
        }
      }
      if (!v11) {
        goto LABEL_17;
      }
    }
    else
    {
      long long v14 = 0;
      if (!v11)
      {
LABEL_17:
        if (v14) {
          return v14;
        }
        else {
          return (NSArray *)MEMORY[0x263EFFA68];
        }
      }
    }
    C3DSceneUnlock(v11);
    goto LABEL_17;
  }
  NSUInteger v3 = [(NSArray *)self->_mainTargets count];
  uint64_t v4 = (NSArray *)[MEMORY[0x263EFF980] arrayWithCapacity:self->_weightCount];
  unint64_t v6 = self->_weightCount;
  if (v6)
  {
    for (unint64_t j = 0; j < v6; ++j)
    {
      *(float *)&double v5 = self->_weights[j];
      -[NSArray addObject:](v4, "addObject:", [NSNumber numberWithFloat:v5]);
      unint64_t v6 = self->_weightCount;
    }
  }
  BOOL v8 = v3 > v6;
  NSUInteger v9 = v3 - v6;
  if (v8)
  {
    do
    {
      [(NSArray *)v4 addObject:&unk_26BFC1908];
      --v9;
    }
    while (v9);
  }
  return v4;
}

- (void)setWeights:(NSArray *)weights
{
  unint64_t v5 = [(NSArray *)weights count];
  self->_weightCFIndex Count = v5;
  unint64_t v6 = self->_weights;
  if (v5)
  {
    self->_weights = (float *)malloc_type_realloc(v6, 4 * v5, 0x100004052888210uLL);
    if (self->_weightCount)
    {
      unint64_t v7 = 0;
      do
      {
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](weights, "objectAtIndexedSubscript:", v7), "floatValue");
        weightCFIndex Count = self->_weightCount;
        self->_weights[v7++] = v9;
      }
      while (v7 < weightCount);
    }
  }
  else
  {
    free(v6);
    self->_weights = 0;
  }
  CFIndex v10 = [(SCNMorpher *)self sceneRef];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __25__SCNMorpher_setWeights___block_invoke;
  v11[3] = &unk_264006160;
  v11[4] = self;
  v11[5] = weights;
  +[SCNTransaction postCommandWithContext:v10 object:self applyBlock:v11];
}

void __25__SCNMorpher_setWeights___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) morphRef];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = [*(id *)(a1 + 40) count];
    if (v4 >= 1)
    {
      uint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i), "floatValue");
        C3DMorphSetWeightAtIndex(v3, i, v7);
      }
    }
  }
}

- (int64_t)_weightIndexForTargetNamed:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  mainTargetNamesToIndexes = self->_mainTargetNamesToIndexes;
  if (!mainTargetNamesToIndexes)
  {
    id v15 = a3;
    uint64_t v5 = [(SCNMorpher *)self targets];
    unint64_t v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSArray count](v5, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v5);
          }
          int v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v12 name]) {
            objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v9++), objc_msgSend(v12, "name"));
          }
        }
        uint64_t v8 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
    mainTargetNamesToIndexes = (NSDictionary *)[v6 copy];
    self->_mainTargetNamesToIndexes = mainTargetNamesToIndexes;
    a3 = v15;
  }
  id v13 = [(NSDictionary *)mainTargetNamesToIndexes objectForKeyedSubscript:a3];
  if (v13) {
    return [v13 integerValue];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)setWeight:(CGFloat)weight forTargetNamed:(NSString *)targetName
{
  int64_t v6 = [(SCNMorpher *)self _weightIndexForTargetNamed:targetName];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(SCNMorpher *)self setWeight:v6 forTargetAtIndex:weight];
  }
}

- (CGFloat)weightForTargetNamed:(NSString *)targetName
{
  int64_t v4 = [(SCNMorpher *)self _weightIndexForTargetNamed:targetName];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0.0;
  }

  [(SCNMorpher *)self weightForTargetAtIndex:v4];
  return result;
}

+ (id)weightIndexStringForIndex:(int64_t)a3
{
  if (weightIndexStringForIndex__onceToken != -1) {
    dispatch_once(&weightIndexStringForIndex__onceToken, &__block_literal_global_108);
  }
  if (a3 > 127) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"weights[%d]", a3);
  }
  else {
    return (id)weightIndexStringForIndex__s_strings[a3];
  }
}

uint64_t __40__SCNMorpher_weightIndexStringForIndex___block_invoke()
{
  for (uint64_t i = 0; i != 128; ++i)
  {
    uint64_t result = objc_msgSend([NSString alloc], "initWithFormat:", @"weights[%d]", i);
    weightIndexStringForIndex__s_strings[i] = result;
  }
  return result;
}

- (void)setWeight:(CGFloat)weight forTargetAtIndex:(NSUInteger)targetIndex
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)self + 16))
  {
    id v13 = scn_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SCNMorpher setWeight:forTargetAtIndex:]();
    }
  }
  else
  {
    NSUInteger v7 = [(NSArray *)self->_mainTargets count];
    if (v7 <= targetIndex)
    {
      int v14 = v7;
      id v15 = scn_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        long long v18 = self;
        __int16 v19 = 1024;
        int v20 = targetIndex;
        __int16 v21 = 1024;
        int v22 = v14;
        _os_log_error_impl(&dword_20B249000, v15, OS_LOG_TYPE_ERROR, "Error: %@ setWeight:forTargetAtIndex:%d - index out of bounds (%d)", buf, 0x18u);
      }
    }
    else
    {
      if (self->_weightCount <= targetIndex)
      {
        uint64_t v8 = (float *)malloc_type_realloc(self->_weights, 4 * (targetIndex + 1), 0x100004052888210uLL);
        self->_weights = v8;
        bzero(&v8[self->_weightCount], 4 * (targetIndex + 1 - self->_weightCount));
        self->_weightCFIndex Count = targetIndex + 1;
      }
      weights = self->_weights;
      if (weights[targetIndex] != weight)
      {
        float v10 = weight;
        weights[targetIndex] = v10;
        id v11 = +[SCNMorpher weightIndexStringForIndex:targetIndex];
        int v12 = [(SCNMorpher *)self sceneRef];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __41__SCNMorpher_setWeight_forTargetAtIndex___block_invoke;
        v16[3] = &unk_264007A28;
        v16[4] = self;
        v16[5] = targetIndex;
        *(CGFloat *)&v16[6] = weight;
        +[SCNTransaction postCommandWithContext:v12 object:self key:@"weights" subscriptIndex:targetIndex derivedKeyPath:v11 applyBlock:v16];
      }
    }
  }
}

void __41__SCNMorpher_setWeight_forTargetAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) morphRef];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    float v4 = *(double *)(a1 + 48);
    C3DMorphSetWeightAtIndex(v2, v3, v4);
  }
}

- (CGFloat)weightForTargetAtIndex:(NSUInteger)targetIndex
{
  if (*((unsigned char *)self + 16))
  {
    int64_t v6 = [(SCNMorpher *)self sceneRef];
    uint64_t v7 = (uint64_t)v6;
    if (v6) {
      C3DSceneLock((uint64_t)v6);
    }
    morpher = self->_morpher;
    if (morpher)
    {
      double WeightAtIndex = C3DMorphGetWeightAtIndex((uint64_t)morpher, targetIndex);
      if (!v7) {
        return WeightAtIndex;
      }
    }
    else
    {
      double WeightAtIndex = 0.0;
      if (!v7) {
        return WeightAtIndex;
      }
    }
    C3DSceneUnlock(v7);
    return WeightAtIndex;
  }
  double WeightAtIndex = 0.0;
  if (self->_weightCount > targetIndex) {
    return self->_weights[targetIndex];
  }
  return WeightAtIndex;
}

- (double)_presentationWeightForTargetAtIndex:(unint64_t)a3 token:(const void *)a4
{
  if (*(__C3DScene **)a4 != [(SCNMorpher *)self sceneRef])
  {
    int64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[SCNMorpher _presentationWeightForTargetAtIndex:token:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  morpher = self->_morpher;
  if (morpher) {
    return C3DMorphGetWeightAtIndex((uint64_t)morpher, a3);
  }
  else {
    return 0.0;
  }
}

- (id)targetsAndInBetween
{
  id result = self->_mainTargetsAndInBetweens;
  if (!result) {
    return self->_mainTargets;
  }
  return result;
}

- (id)correctives
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (![(NSArray *)self->_correctivesAndInBetweens count]) {
    return 0;
  }
  if (![(NSArray *)self->_correctiveInBetweenCounts count]) {
    return self->_correctivesAndInBetweens;
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_correctiveDriverCounts, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  correctiveInBetweenCounts = self->_correctiveInBetweenCounts;
  uint64_t v5 = [(NSArray *)correctiveInBetweenCounts countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(correctiveInBetweenCounts);
        }
        v7 += [*(id *)(*((void *)&v11 + 1) + 8 * i) unsignedIntegerValue];
        objc_msgSend(v3, "addObject:", -[NSArray objectAtIndexedSubscript:](self->_correctivesAndInBetweens, "objectAtIndexedSubscript:", v7 - 1));
      }
      uint64_t v6 = [(NSArray *)correctiveInBetweenCounts countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)correctivesAndInBetween
{
  return self->_correctivesAndInBetweens;
}

- (void)_updateTargetsAndInBetween:(id)a3
{
  mainTargetsAndInBetweens = self->_mainTargetsAndInBetweens;
  if (!mainTargetsAndInBetweens) {
    mainTargetsAndInBetweens = self->_mainTargets;
  }
  uint64_t v6 = [(NSArray *)mainTargetsAndInBetweens count];
  if (v6 != [a3 count])
  {
    uint64_t v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[SCNMorpher _updateTargetsAndInBetween:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  [(SCNMorpher *)self setTargetsAndInBetweens:a3 inBetweenCounts:self->_inBetweenCounts inBetweenWeights:self->_inBetweenInfluenceWeights correctives:self->_correctivesAndInBetweens driverCounts:self->_correctiveDriverCounts driverIndices:self->_correctiveDriverIndices inBetweenCounts:self->_correctiveInBetweenCounts inBetweenWeights:self->_correctiveInBetweenInfluenceWeights];
}

- (void)_updateCorrectivesAndInBetween:(id)a3
{
  NSUInteger v5 = [(NSArray *)self->_correctivesAndInBetweens count];
  if (v5 != [a3 count])
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[SCNMorpher _updateCorrectivesAndInBetween:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  mainTargetsAndInBetweens = self->_mainTargetsAndInBetweens;
  if (!mainTargetsAndInBetweens) {
    mainTargetsAndInBetweens = self->_mainTargets;
  }
  [(SCNMorpher *)self setTargetsAndInBetweens:mainTargetsAndInBetweens inBetweenCounts:self->_inBetweenCounts inBetweenWeights:self->_inBetweenInfluenceWeights correctives:a3 driverCounts:self->_correctiveDriverCounts driverIndices:self->_correctiveDriverIndices inBetweenCounts:self->_correctiveInBetweenCounts inBetweenWeights:self->_correctiveInBetweenInfluenceWeights];
}

- (id)inBetweenCounts
{
  return self->_inBetweenCounts;
}

- (id)inBetweenWeights
{
  return self->_inBetweenInfluenceWeights;
}

- (id)inBetweenTargetsForTargetAtIndex:(unint64_t)a3
{
  if (![(NSArray *)self->_inBetweenCounts count]) {
    return 0;
  }
  uint64_t v5 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_inBetweenCounts, "objectAtIndexedSubscript:", a3), "unsignedIntegerValue");
  uint64_t v6 = v5 - 1;
  if (v5 == 1) {
    return 0;
  }
  if (a3)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    do
      v8 += objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_inBetweenCounts, "objectAtIndexedSubscript:", v7++), "unsignedIntegerValue");
    while (a3 != v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  mainTargetsAndInBetweens = self->_mainTargetsAndInBetweens;

  return -[NSArray subarrayWithRange:](mainTargetsAndInBetweens, "subarrayWithRange:", v8, v6);
}

- (id)inBetweenWeightsForTargetAtIndex:(unint64_t)a3
{
  if (![(NSArray *)self->_inBetweenCounts count]) {
    return 0;
  }
  uint64_t v5 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_inBetweenCounts, "objectAtIndexedSubscript:", a3), "unsignedIntegerValue");
  uint64_t v6 = v5 - 1;
  if (v5 == 1) {
    return 0;
  }
  if (a3)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    do
      uint64_t v8 = v8
         + objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_inBetweenCounts, "objectAtIndexedSubscript:", v7++), "unsignedIntegerValue")- 1;
    while (a3 != v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  inBetweenInfluenceWeights = self->_inBetweenInfluenceWeights;

  return -[NSArray subarrayWithRange:](inBetweenInfluenceWeights, "subarrayWithRange:", v8, v6);
}

- (id)correctiveDriverCounts
{
  return self->_correctiveDriverCounts;
}

- (id)correctiveDriverIndices
{
  return self->_correctiveDriverIndices;
}

- (unint64_t)correctiveDriverCountForCorrectiveAtIndex:(unint64_t)a3
{
  if (![(NSArray *)self->_correctiveDriverCounts count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v5 = [(NSArray *)self->_correctiveDriverCounts objectAtIndexedSubscript:a3];

  return [v5 unsignedIntegerValue];
}

- (id)correctiveDriverIndicesForCorrectiveAtIndex:(unint64_t)a3
{
  if (![(NSArray *)self->_correctiveDriverCounts count]) {
    return 0;
  }
  uint64_t v5 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_correctiveDriverCounts, "objectAtIndexedSubscript:", a3), "unsignedIntegerValue");
  if (![(NSArray *)self->_correctiveDriverIndices count]) {
    return 0;
  }
  if (a3)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    do
      v7 += objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_correctiveDriverCounts, "objectAtIndexedSubscript:", v6++), "unsignedIntegerValue");
    while (a3 != v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  correctiveDriverIndices = self->_correctiveDriverIndices;

  return -[NSArray subarrayWithRange:](correctiveDriverIndices, "subarrayWithRange:", v7, v5);
}

- (id)correctiveInBetweenCounts
{
  return self->_correctiveInBetweenCounts;
}

- (id)correctiveInBetweenWeights
{
  return self->_correctiveInBetweenInfluenceWeights;
}

- (id)inBetweenTargetsForCorrectiveAtIndex:(unint64_t)a3
{
  if (![(NSArray *)self->_correctiveInBetweenCounts count]) {
    return 0;
  }
  uint64_t v5 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_correctiveInBetweenCounts, "objectAtIndexedSubscript:", a3), "unsignedIntegerValue");
  uint64_t v6 = v5 - 1;
  if (v5 == 1) {
    return 0;
  }
  if (a3)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    do
      v8 += objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_correctiveInBetweenCounts, "objectAtIndexedSubscript:", v7++), "unsignedIntegerValue");
    while (a3 != v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  correctivesAndInBetweens = self->_correctivesAndInBetweens;

  return -[NSArray subarrayWithRange:](correctivesAndInBetweens, "subarrayWithRange:", v8, v6);
}

- (id)inBetweenWeightsForCorrectiveAtIndex:(unint64_t)a3
{
  if (![(NSArray *)self->_correctiveInBetweenCounts count]) {
    return 0;
  }
  uint64_t v5 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_correctiveInBetweenCounts, "objectAtIndexedSubscript:", a3), "unsignedIntegerValue");
  uint64_t v6 = v5 - 1;
  if (v5 == 1) {
    return 0;
  }
  if (a3)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    do
      uint64_t v8 = v8
         + objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_correctiveInBetweenCounts, "objectAtIndexedSubscript:", v7++), "unsignedIntegerValue")- 1;
    while (a3 != v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  correctiveInBetweenInfluenceWeights = self->_correctiveInBetweenInfluenceWeights;

  return -[NSArray subarrayWithRange:](correctiveInBetweenInfluenceWeights, "subarrayWithRange:", v8, v6);
}

- (void)setTargets:(id)a3 withInBetweenTargetCounts:(id)a4 inBetweenWeights:(id)a5
{
}

- (void)setTargetsAndInBetweens:(id)a3 inBetweenCounts:(id)a4 inBetweenWeights:(id)a5 correctives:(id)a6 driverCounts:(id)a7 driverIndices:(id)a8 inBetweenCounts:(id)a9 inBetweenWeights:(id)a10
{
  id v17 = a9;
  uint64_t v71 = *MEMORY[0x263EF8340];
  v67 = (NSArray *)a3;
  v65 = (NSArray *)a5;
  v66 = (NSArray *)a4;
  v64 = (NSArray *)a6;
  uint64_t v18 = [a4 count];
  uint64_t v19 = [a6 count];
  if (v19)
  {
    uint64_t v54 = v19;
    BOOL v55 = v19 != 0;
    BOOL v20 = [v17 count] != 0;
    if (!v18) {
      goto LABEL_23;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    uint64_t v54 = 0;
    BOOL v55 = v19 != 0;
    BOOL v20 = 0;
LABEL_6:
    if (-[SCNMorpher _validateTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:]((BOOL)self, a3, a4, a5))
    {
      id v50 = a7;
      id v51 = a8;
      -[SCNMorpher _sortTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:](self, &v67, (void **)&v66, (void **)&v65);
      BOOL v49 = v20;
      if (v20) {
        -[SCNMorpher _sortTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:](self, &v64, &a9, &a10);
      }
      v52 = self;
      id v21 = objc_alloc(MEMORY[0x263EFF980]);
      int v22 = v66;
      uint64_t v23 = (NSArray *)objc_msgSend(v21, "initWithCapacity:", -[NSArray count](v66, "count"));
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v60 objects:v70 count:16];
      id v25 = v67;
      if (v24)
      {
        uint64_t v26 = v24;
        uint64_t v27 = 0;
        uint64_t v28 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v61 != v28) {
              objc_enumerationMutation(v22);
            }
            v27 += [*(id *)(*((void *)&v60 + 1) + 8 * i) unsignedIntegerValue];
            if (v27 - 1 >= [(NSArray *)v25 count])
            {
              double v30 = scn_default_log();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
                -[SCNMorpher setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:](buf, &v69, v30);
              }
            }
            [(NSArray *)v23 addObject:[(NSArray *)v25 objectAtIndexedSubscript:v27 - 1]];
          }
          uint64_t v26 = [(NSArray *)v22 countByEnumeratingWithState:&v60 objects:v70 count:16];
        }
        while (v26);
      }
      self = v52;

      v52->_mainTargets = v23;
      mainTargetsAndInBetweens = v52->_mainTargetsAndInBetweens;
      if (mainTargetsAndInBetweens != v25)
      {

        v52->_mainTargetsAndInBetweens = (NSArray *)[(NSArray *)v25 copy];
      }
      char v53 = 1;
      a7 = v50;
      a8 = v51;
      BOOL v32 = v49;
      goto LABEL_28;
    }
    long long v33 = scn_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B249000, v33, OS_LOG_TYPE_ERROR, "Error: invalid in-between buffer, ignoring in-betweens", buf, 2u);
      BOOL v32 = v20;
      if (!v20) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
LABEL_23:
    BOOL v32 = v20;
    if (!v20)
    {
LABEL_25:
      mainTargets = self->_mainTargets;
      id v25 = v67;
      if (mainTargets != v67)
      {

        self->_mainTargets = (NSArray *)[(NSArray *)v25 copy];
      }

      char v53 = 0;
      self->_mainTargetsAndInBetweens = 0;
LABEL_28:

      self->_mainTargetNamesToIndexes = 0;
      free(self->_weights);
      self->_weightCFIndex Count = 0;
      self->_weights = 0;
      inBetweenInfluenceWeights = self->_inBetweenInfluenceWeights;
      long long v36 = v65;
      if (inBetweenInfluenceWeights != v65)
      {

        self->_inBetweenInfluenceWeights = (NSArray *)[(NSArray *)v36 copy];
      }
      inBetweenCounts = self->_inBetweenCounts;
      v38 = v66;
      if (inBetweenCounts != v66)
      {

        self->_inBetweenCounts = (NSArray *)[(NSArray *)v38 copy];
      }
      correctivesAndInBetweens = self->_correctivesAndInBetweens;
      v40 = v64;
      if (correctivesAndInBetweens != v64)
      {

        self->_correctivesAndInBetweens = (NSArray *)[(NSArray *)v40 copy];
      }
      correctiveDriverCounts = self->_correctiveDriverCounts;
      if (correctiveDriverCounts != a7)
      {

        self->_correctiveDriverCounts = (NSArray *)[a7 copy];
      }
      correctiveDriverIndices = self->_correctiveDriverIndices;
      if (correctiveDriverIndices != a8)
      {

        self->_correctiveDriverIndices = (NSArray *)[a8 copy];
      }
      correctiveInBetweenCounts = self->_correctiveInBetweenCounts;
      id v44 = a9;
      if (correctiveInBetweenCounts != a9)
      {

        self->_correctiveInBetweenCounts = (NSArray *)[v44 copy];
      }
      correctiveInBetweenInfluenceWeights = self->_correctiveInBetweenInfluenceWeights;
      id v46 = a10;
      if (correctiveInBetweenInfluenceWeights != a10)
      {

        self->_correctiveInBetweenInfluenceWeights = (NSArray *)[v46 copy];
      }
      if (v54) {
        id v25 = [(NSArray *)v25 arrayByAddingObjectsFromArray:v40];
      }
      CFArrayRef C3DGeometryArrayFromSCNGeometryArray = _createC3DGeometryArrayFromSCNGeometryArray(v25);
      v48 = [(SCNMorpher *)self sceneRef];
      v56[0] = MEMORY[0x263EF8330];
      v56[1] = 3221225472;
      v56[2] = __143__SCNMorpher_setTargetsAndInBetweens_inBetweenCounts_inBetweenWeights_correctives_driverCounts_driverIndices_inBetweenCounts_inBetweenWeights___block_invoke;
      v56[3] = &unk_264009B20;
      char v57 = v53;
      v56[4] = v38;
      v56[5] = v36;
      BOOL v58 = v55;
      v56[6] = v67;
      v56[7] = a7;
      BOOL v59 = v32;
      v56[8] = a8;
      v56[9] = v44;
      v56[10] = v46;
      v56[11] = self;
      v56[12] = C3DGeometryArrayFromSCNGeometryArray;
      +[SCNTransaction postCommandWithContext:v48 object:self applyBlock:v56];

      return;
    }
LABEL_24:
    -[SCNMorpher _sortTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:](self, &v64, &a9, &a10);
    goto LABEL_25;
  }

  [(SCNMorpher *)self setTargets:a3];
}

- (BOOL)_validateTargetsAndInBetweens:(void *)a3 inBetweenCounts:(void *)a4 inBetweenWeights:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (result)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v18;
      id v15 = &v22;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(a3);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "unsignedIntegerValue", v15);
          v8 += v12;
          if (v8 - 1 >= (unint64_t)[a2 count])
          {
            uint64_t v13 = scn_default_log();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
              -[SCNMorpher setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:](buf, v15, v13);
            }
          }
          if (v8 - 1 >= (unint64_t)[a2 count]) {
            return 0;
          }
          uint64_t v9 = v9 + v12 - 1;
        }
        uint64_t v7 = [a3 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    if ([a4 count] != v9)
    {
      uint64_t v14 = scn_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[SCNMorpher _validateTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:](a4);
      }
    }
    return [a4 count] == v9;
  }
  return result;
}

- (id)_sortTargetsAndInBetweens:(void *)a3 inBetweenCounts:(void *)a4 inBetweenWeights:
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v7 = (void *)*a2;
    uint64_t v8 = *a3;
    uint64_t v9 = *a4;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    obunint64_t j = v8;
    BOOL v49 = v7;
    id result = (id)[v8 countByEnumeratingWithState:&v59 objects:v65 count:16];
    if (result)
    {
      id v10 = result;
      v41 = a2;
      v42 = a3;
      v43 = a4;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v60;
      char v13 = 1;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v60 != v12) {
            objc_enumerationMutation(obj);
          }
          unint64_t v15 = objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * (void)v14), "unsignedIntegerValue", v41, v42, v43);
          if (v15 >= 2)
          {
            unint64_t v16 = v15 - 1;
            float v17 = 0.0;
            uint64_t v18 = v11;
            unint64_t v19 = v15 - 1;
            while (1)
            {
              objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v18), "floatValue");
              if (v17 > v20) {
                break;
              }
              ++v18;
              float v17 = v20;
              if (!--v19) {
                goto LABEL_13;
              }
            }
            char v13 = 0;
LABEL_13:
            v11 += v16;
          }
          uint64_t v14 = (char *)v14 + 1;
        }
        while (v14 != v10);
        id result = (id)[obj countByEnumeratingWithState:&v59 objects:v65 count:16];
        id v10 = result;
      }
      while (result);
      if ((v13 & 1) == 0)
      {
        id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
        int v22 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v49, "count"));
        uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        uint64_t v24 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          uint64_t v47 = *(void *)v56;
          unint64_t v28 = 0x263F08000uLL;
          do
          {
            uint64_t v29 = 0;
            uint64_t v44 = v25;
            do
            {
              if (*(void *)v56 != v47) {
                objc_enumerationMutation(obj);
              }
              unint64_t v30 = [*(id *)(*((void *)&v55 + 1) + 8 * v29) unsignedIntegerValue];
              uint64_t v31 = v27;
              if (v30 >= 2)
              {
                uint64_t v46 = v29;
                objc_msgSend(v21, "removeAllObjects", v27);
                uint64_t v32 = 0;
                unint64_t v45 = v30;
                unint64_t v33 = v30 - 1;
                do
                  objc_msgSend(v21, "addObject:", objc_msgSend(*(id *)(v28 + 2584), "numberWithUnsignedInteger:", v32++));
                while (v33 != v32);
                v54[0] = MEMORY[0x263EF8330];
                v54[1] = 3221225472;
                v54[2] = __73__SCNMorpher__sortTargetsAndInBetweens_inBetweenCounts_inBetweenWeights___block_invoke;
                v54[3] = &unk_264009B48;
                v54[4] = v9;
                v54[5] = v26;
                [v21 sortUsingComparator:v54];
                long long v52 = 0u;
                long long v53 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
                uint64_t v34 = [v21 countByEnumeratingWithState:&v50 objects:v63 count:16];
                if (v34)
                {
                  uint64_t v35 = v34;
                  uint64_t v36 = *(void *)v51;
                  do
                  {
                    v37 = v21;
                    for (uint64_t i = 0; i != v35; ++i)
                    {
                      if (*(void *)v51 != v36) {
                        objc_enumerationMutation(v37);
                      }
                      uint64_t v39 = [*(id *)(*((void *)&v50 + 1) + 8 * i) unsignedIntegerValue];
                      objc_msgSend(v22, "addObject:", objc_msgSend(v49, "objectAtIndexedSubscript:", v39 + v27));
                      objc_msgSend(v23, "addObject:", objc_msgSend(v9, "objectAtIndexedSubscript:", v39 + v26));
                    }
                    id v21 = v37;
                    uint64_t v35 = [v37 countByEnumeratingWithState:&v50 objects:v63 count:16];
                  }
                  while (v35);
                }
                uint64_t v25 = v44;
                unint64_t v30 = v45;
                uint64_t v31 = v27 + v45 - 1;
                unint64_t v28 = 0x263F08000;
                uint64_t v29 = v46;
              }
              objc_msgSend(v22, "addObject:", objc_msgSend(v49, "objectAtIndexedSubscript:", v31));
              v27 += v30;
              uint64_t v26 = v26 + v30 - 1;
              ++v29;
            }
            while (v29 != v25);
            uint64_t v25 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
          }
          while (v25);
        }

        id v40 = v22;
        id result = v23;
        void *v41 = v40;
        *v42 = obj;
        *v43 = result;
      }
    }
  }
  return result;
}

void __143__SCNMorpher_setTargetsAndInBetweens_inBetweenCounts_inBetweenWeights_correctives_driverCounts_driverIndices_inBetweenCounts_inBetweenWeights___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 104))
  {
    unsigned int v2 = [*(id *)(a1 + 32) count];
    uint64_t v3 = malloc_type_malloc(4 * v2, 0x100004052888210uLL);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        v3[i] = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i), "intValue");
    }
    unsigned int v5 = [*(id *)(a1 + 40) count];
    uint64_t v6 = malloc_type_malloc(4 * v5, 0x100004052888210uLL);
    if (v5)
    {
      for (uint64_t j = 0; j != v5; v6[j++] = v8)
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", j), "floatValue");
    }
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v3 = 0;
    unsigned int v5 = 0;
    unsigned int v2 = [*(id *)(a1 + 48) count];
  }
  unsigned int v31 = v5;
  unsigned int v32 = v2;
  if (*(unsigned char *)(a1 + 105))
  {
    unsigned int v9 = [*(id *)(a1 + 56) count];
    size_t v10 = 4 * v9;
    uint64_t v11 = malloc_type_malloc(v10, 0x100004052888210uLL);
    if (v9)
    {
      for (uint64_t k = 0; k != v9; ++k)
        v11[k] = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", k), "intValue");
    }
    unsigned int v29 = v9;
    unsigned int v13 = [*(id *)(a1 + 64) count];
    uint64_t v14 = malloc_type_malloc(4 * v13, 0x100004052888210uLL);
    unsigned int v28 = v13;
    if (v13)
    {
      uint64_t v15 = 0;
      do
      {
        v14[v15] = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:", v15), "intValue");
        ++v15;
      }
      while (v28 != v15);
    }
    if (*(unsigned char *)(a1 + 106))
    {
      unint64_t v16 = malloc_type_malloc(v10, 0x100004052888210uLL);
      if (v29)
      {
        for (uint64_t m = 0; m != v29; ++m)
          v16[m] = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 72), "objectAtIndexedSubscript:", m), "intValue");
      }
      unsigned int v18 = [*(id *)(a1 + 80) count];
      unint64_t v19 = malloc_type_malloc(4 * v18, 0x100004052888210uLL);
      if (v18)
      {
        uint64_t v20 = 0;
        unsigned int v30 = v18;
        do
        {
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 80), "objectAtIndexedSubscript:", v20), "floatValue");
          v19[v20++] = v21;
        }
        while (v18 != v20);
      }
      else
      {
        unsigned int v30 = 0;
      }
    }
    else
    {
      unsigned int v30 = 0;
      unint64_t v16 = 0;
      unint64_t v19 = 0;
    }
    unsigned int v23 = v28;
    unsigned int v22 = v29;
  }
  else
  {
    unsigned int v22 = 0;
    uint64_t v11 = 0;
    unsigned int v23 = 0;
    uint64_t v14 = 0;
    unsigned int v30 = 0;
    unint64_t v16 = 0;
    unint64_t v19 = 0;
  }
  uint64_t v24 = [*(id *)(a1 + 88) morphRef];
  uint64_t v25 = *(const void **)(a1 + 96);
  size_t v26 = *(unsigned __int8 *)(*(void *)(a1 + 88) + 161);
  v33[0] = (const void *)__PAIR64__(v31, v32);
  v33[1] = v3;
  v33[2] = v6;
  unsigned int v34 = v22;
  int v35 = 0;
  uint64_t v36 = v11;
  unsigned int v37 = v23;
  int v38 = 0;
  uint64_t v39 = v14;
  unsigned int v40 = v30;
  int v41 = 0;
  v42 = v16;
  v43 = v19;
  C3DMorphSetTargetsWithExtraTargetInfo(v24, v25, v26, v33);
  free(v3);
  free(v6);
  free(v11);
  free(v14);
  free(v16);
  free(v19);
  if (v32)
  {
    for (uint64_t n = 0; n != v32; C3DMorphSetWeightAtIndex(v24, n++, 0.0))
      ;
  }
}

uint64_t __73__SCNMorpher__sortTargetsAndInBetweens_inBetweenCounts_inBetweenWeights___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(a2, "unsignedIntegerValue") + *(void *)(a1 + 40)), "floatValue");
  float v6 = v5;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(a3, "unsignedIntegerValue") + *(void *)(a1 + 40)), "floatValue");
  if (v6 < v7) {
    return -1;
  }
  else {
    return v6 > v7;
  }
}

- (void)setCalculationMode:(SCNMorpherCalculationMode)calculationMode
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNMorpher setCalculationMode:]();
    }
  }
  else if (self->_calculationMode != calculationMode)
  {
    self->_calculationMode = calculationMode;
    float v5 = [(SCNMorpher *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __33__SCNMorpher_setCalculationMode___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = calculationMode;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

uint64_t __33__SCNMorpher_setCalculationMode___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) morphRef];
  if (result)
  {
    BOOL v3 = *(void *)(a1 + 40) == 1;
    return C3DMorphSetCalculationMode(result, v3);
  }
  return result;
}

- (SCNMorpherCalculationMode)calculationMode
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNMorpher *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    morpher = self->_morpher;
    if (morpher)
    {
      SCNMorpherCalculationMode v3 = (unint64_t)(C3DMorphGetCalculationMode((uint64_t)morpher) == 1);
      if (!v5) {
        return v3;
      }
    }
    else
    {
      SCNMorpherCalculationMode v3 = SCNMorpherCalculationModeNormalized;
      if (!v5) {
        return v3;
      }
    }
    C3DSceneUnlock(v5);
    return v3;
  }
  return self->_calculationMode;
}

- (BOOL)unifiesNormals
{
  return self->_unifyNormal;
}

- (void)setUnifiesNormals:(BOOL)unifiesNormals
{
  if (self->_unifyNormal != unifiesNormals)
  {
    self->_unifyNormal = unifiesNormals;
    uint64_t v5 = [(SCNMorpher *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __32__SCNMorpher_setUnifiesNormals___block_invoke;
    v6[3] = &unk_264004FE8;
    v6[4] = self;
    BOOL v7 = unifiesNormals;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

uint64_t __32__SCNMorpher_setUnifiesNormals___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) morphRef];
  if (result)
  {
    char v3 = *(unsigned char *)(a1 + 40) == 0;
    return C3DMorphSetMorphNormals(result, v3);
  }
  return result;
}

- (BOOL)shouldMorphNormals
{
  return !self->_unifyNormal;
}

- (void)setShouldMorphNormals:(BOOL)a3
{
}

- (BOOL)shouldClearCPUDataAfterUpload
{
  return C3DMorphGetClearCPUDataAfterUpload((uint64_t)self->_morpher);
}

- (void)setShouldClearCPUDataAfterUpload:(BOOL)a3
{
}

- (float)weightIncrementalThreshold
{
  char v3 = [(SCNMorpher *)self sceneRef];
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    C3DSceneLock((uint64_t)v3);
    float WeightIncrementalThreshold = C3DMorphGetWeightIncrementalThreshold((uint64_t)self->_morpher);
    C3DSceneUnlock(v4);
    return WeightIncrementalThreshold;
  }
  else
  {
    morpher = self->_morpher;
    return C3DMorphGetWeightIncrementalThreshold((uint64_t)morpher);
  }
}

- (void)setWeightIncrementalThreshold:(float)a3
{
  uint64_t v5 = [(SCNMorpher *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SCNMorpher_setWeightIncrementalThreshold___block_invoke;
  v6[3] = &unk_264009038;
  v6[4] = self;
  float v7 = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __44__SCNMorpher_setWeightIncrementalThreshold___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) morphRef];
  float v3 = *(float *)(a1 + 40);

  C3DMorphSetWeightIncrementalThreshold(v2, v3);
}

- (void)convertToAdditiveWithBaseGeometry:(id)a3
{
  uint64_t v5 = [(SCNMorpher *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__SCNMorpher_convertToAdditiveWithBaseGeometry___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __48__SCNMorpher_convertToAdditiveWithBaseGeometry___block_invoke(uint64_t a1)
{
  uint64_t result = C3DMorphConvertToCalculationMode([*(id *)(a1 + 32) morphRef], objc_msgSend(*(id *)(a1 + 40), "geometryRef"), 1, (uint64_t)&__block_literal_global_32);
  if (result)
  {
    float v3 = *(void **)(a1 + 32);
    return [v3 _syncObjCModel];
  }
  return result;
}

- (BOOL)_isUsingSparseTargets
{
  return self->_useSparseTargets;
}

- (void)convertToSparseWithBaseGeometry:(id)a3
{
  uint64_t v5 = [(SCNMorpher *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__SCNMorpher_convertToSparseWithBaseGeometry___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __46__SCNMorpher_convertToSparseWithBaseGeometry___block_invoke(uint64_t a1)
{
  uint64_t result = C3DMorphConvertToSparse([*(id *)(a1 + 32) morphRef], objc_msgSend(*(id *)(a1 + 40), "geometryRef"), 1, (uint64_t)&__block_literal_global_32);
  if (result)
  {
    float v3 = *(void **)(a1 + 32);
    return [v3 _syncObjCModel];
  }
  return result;
}

- (__C3DScene)sceneRef
{
  uint64_t v2 = [(SCNMorpher *)self __CFObject];

  return (__C3DScene *)C3DGetScene(v2);
}

- (id)scene
{
  id result = [(SCNMorpher *)self sceneRef];
  if (result)
  {
    return C3DEntityGetObjCWrapper((id *)result);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init((Class)objc_opt_class());
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  v4[161] = self->_useSparseTargets;
  if (self->_inBetweenCounts || self->_correctiveDriverCounts)
  {
    mainTargetsAndInBetweens = self->_mainTargetsAndInBetweens;
    if (!mainTargetsAndInBetweens) {
      mainTargetsAndInBetweens = self->_mainTargets;
    }
    objc_msgSend(v4, "setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:", mainTargetsAndInBetweens, self->_correctiveInBetweenCounts, self->_correctiveInBetweenInfluenceWeights);
  }
  else
  {
    objc_msgSend(v4, "setTargets:", -[SCNMorpher targets](self, "targets"));
    weightCFIndex Count = self->_weightCount;
    if (weightCount)
    {
      for (uint64_t i = 0; i != weightCount; ++i)
      {
        [(SCNMorpher *)self weightForTargetAtIndex:i];
        objc_msgSend(v4, "setWeight:forTargetAtIndex:", i);
      }
    }
  }
  objc_msgSend(v4, "setCalculationMode:", -[SCNMorpher calculationMode](self, "calculationMode"));
  objc_msgSend(v4, "setName:", -[SCNMorpher name](self, "name"));
  objc_msgSend(v4, "setIdentifier:", -[SCNMorpher identifier](self, "identifier"));
  objc_msgSend(v4, "setUnifiesNormals:", -[SCNMorpher unifiesNormals](self, "unifiesNormals"));
  [v4 _copyAnimationsFrom:self];
  +[SCNTransaction commitImmediate];
  return v4;
}

- (id)copy
{
  return [(SCNMorpher *)self copyWithZone:0];
}

- (void)_customDecodingOfSCNMorpher:(id)a3
{
  uint64_t v4 = (__C3DMorph *)C3DMorphCreate();
  self->_morpher = v4;
  if (v4)
  {
    C3DEntitySetObjCWrapper((uint64_t)v4, self);
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  if ([a3 rangeOfString:@"weights["]
    || (uint64_t v6 = v5, (unint64_t)[a3 length] < 2)
    || (float v7 = (void *)[a3 substringFromIndex:v6],
        uint64_t v8 = [v7 rangeOfString:@"]"],
        v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v12.receiver = self;
    v12.super_class = (Class)SCNMorpher;
    return [(SCNMorpher *)&v12 valueForUndefinedKey:a3];
  }
  else
  {
    -[SCNMorpher weightForTargetAtIndex:](self, "weightForTargetAtIndex:", objc_msgSend((id)objc_msgSend(v7, "substringToIndex:", v8), "integerValue"));
    *(float *)&double v10 = v10;
    uint64_t v11 = NSNumber;
    return (id)[v11 numberWithFloat:v10];
  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SCNMorpher setValue:forUndefinedKey:]();
    }
  }
  else if ([a4 rangeOfString:@"weights["] {
         || (uint64_t v8 = v7, (unint64_t)[a4 length] < 2)
  }
         || (unsigned int v9 = (void *)[a4 substringFromIndex:v8],
             uint64_t v10 = [v9 rangeOfString:@"]"],
             v10 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v15.receiver = self;
    v15.super_class = (Class)SCNMorpher;
    [(SCNMorpher *)&v15 setValue:a3 forUndefinedKey:a4];
  }
  else
  {
    uint64_t v12 = objc_msgSend((id)objc_msgSend(v9, "substringToIndex:", v10), "integerValue");
    [a3 floatValue];
    double v14 = v13;
    [(SCNMorpher *)self setWeight:v12 forTargetAtIndex:v14];
  }
}

- (void)_customEncodingOfSCNMorpher:(id)a3
{
  uint64_t WeightsSource = C3DMorphGetWeightsSource((uint64_t)self->_morpher);
  if (WeightsSource)
  {
    uint64_t ID = C3DEntityGetID(WeightsSource);
    if (ID)
    {
      [a3 encodeObject:ID forKey:@"weightID"];
    }
  }
}

- (void)_didDecodeSCNMorpher:(id)a3
{
  uint64_t v4 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"weightID"];
  if (v4)
  {
    uint64_t v5 = (const void *)v4;
    uint64_t WeightsSource = C3DMorphGetWeightsSource((uint64_t)self->_morpher);
    if (WeightsSource)
    {
      C3DEntitySetID(WeightsSource, v5);
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  if (*((unsigned char *)self + 16)) {
    [(SCNMorpher *)self _syncObjCModel];
  }
  [(SCNMorpher *)self _customEncodingOfSCNMorpher:a3];
  [a3 encodeInteger:self->_calculationMode forKey:@"calculationMode"];
  [a3 encodeBool:self->_useSparseTargets forKey:@"useSparseTargets"];
  if (self->_weightCount) {
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNMorpher weights](self, "weights"), @"weights");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [a3 skipMorphTargets];
  }
  else {
    char v5 = 0;
  }
  if ([(NSArray *)self->_inBetweenCounts count])
  {
    p_inBetweenInfluenceWeights = &self->_inBetweenInfluenceWeights;
    if ([(NSArray *)self->_inBetweenInfluenceWeights count])
    {
      if ((v5 & 1) == 0) {
        [a3 encodeObject:self->_mainTargetsAndInBetweens forKey:@"targets"];
      }
      [a3 encodeObject:self->_inBetweenCounts forKey:@"inBetweenCounts"];
      uint64_t v7 = @"inBetweenInfluenceWeights";
      goto LABEL_15;
    }
  }
  if ((v5 & 1) == 0)
  {
    p_inBetweenInfluenceWeights = &self->_mainTargets;
    uint64_t v7 = @"targets";
LABEL_15:
    [a3 encodeObject:*p_inBetweenInfluenceWeights forKey:v7];
  }
  if ([(NSArray *)self->_correctiveDriverCounts count]
    && [(NSArray *)self->_correctiveDriverIndices count])
  {
    if ((v5 & 1) == 0) {
      [a3 encodeObject:self->_correctivesAndInBetweens forKey:@"correctives"];
    }
    [a3 encodeObject:self->_correctiveDriverCounts forKey:@"correctiveDriverCounts"];
    [a3 encodeObject:self->_correctiveDriverIndices forKey:@"correctiveDriverIndices"];
    if ([(NSArray *)self->_correctiveInBetweenCounts count]
      && [(NSArray *)self->_correctiveInBetweenInfluenceWeights count])
    {
      [a3 encodeObject:self->_correctiveInBetweenCounts forKey:@"correctiveInBetweenCounts"];
      [a3 encodeObject:self->_correctiveInBetweenInfluenceWeights forKey:@"correctiveInBetweenInfluenceWeights"];
    }
  }
  name = self->_name;
  if (name) {
    [a3 encodeObject:name forKey:@"name"];
  }
  [a3 encodeBool:!self->_unifyNormal forKey:@"shouldMorphNormals"];
  SCNEncodeEntity(a3, self);

  SCNEncodeAnimations(a3, self);
}

- (SCNMorpher)initWithCoder:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)SCNMorpher;
  uint64_t v4 = [(SCNMorpher *)&v36 init];
  if (!v4) {
    return v4;
  }
  unint64_t v5 = 0x264003000uLL;
  uint64_t v6 = +[SCNTransaction immediateMode];
  +[SCNTransaction setImmediateMode:1];
  [(SCNMorpher *)v4 _customDecodingOfSCNMorpher:a3];
  v4->_useSparseTargets = [a3 decodeBoolForKey:@"useSparseTargets"];
  -[SCNMorpher setCalculationMode:](v4, "setCalculationMode:", [a3 decodeIntegerForKey:@"calculationMode"]);
  uint64_t v7 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"inBetweenCounts");
  uint64_t v8 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"inBetweenInfluenceWeights");
  if (v7 | v8)
  {
    uint64_t v10 = (void *)v8;
    goto LABEL_16;
  }
  unsigned int v29 = v6;
  uint64_t v7 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"channelTargetCounts");
  unsigned int v9 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"channelTargetWeights");
  if (![(id)v7 count] || !objc_msgSend(v9, "count"))
  {
    uint64_t v10 = 0;
    uint64_t v7 = 0;
    goto LABEL_15;
  }
  uint64_t v10 = (void *)[MEMORY[0x263EFF980] array];
  if (![(id)v7 count])
  {
LABEL_15:
    uint64_t v6 = v29;
    goto LABEL_16;
  }
  uint64_t v11 = 0;
  unint64_t v12 = 0;
  do
  {
    uint64_t v13 = objc_msgSend((id)objc_msgSend((id)v7, "objectAtIndexedSubscript:", v12), "unsignedIntegerValue");
    uint64_t v14 = v13 - 1;
    if (v13 != 1)
    {
      uint64_t v15 = v14 + v11;
      do
      {
        objc_msgSend(v10, "addObject:", objc_msgSend(v9, "objectAtIndexedSubscript:", v11++));
        --v14;
      }
      while (v14);
      uint64_t v11 = v15;
    }
    ++v11;
    ++v12;
  }
  while (v12 < [(id)v7 count]);
  unint64_t v5 = 0x264003000;
  uint64_t v6 = v29;
LABEL_16:
  unint64_t v16 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"correctiveDriverCounts");
  objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"correctiveDriverIndices");
  float v17 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"correctiveInBetweenCounts");
  uint64_t v31 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"correctiveInBetweenInfluenceWeights");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [a3 allTargetsFromAnimCodec];
    if (v18)
    {
      unint64_t v19 = (void *)v18;
      if ([v17 count])
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v20 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (!v20)
        {
          uint64_t v27 = 0;
          goto LABEL_33;
        }
        uint64_t v21 = v20;
        unsigned int v30 = v6;
        uint64_t v22 = 0;
        uint64_t v23 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v33 != v23) {
              objc_enumerationMutation(v17);
            }
            v22 += [*(id *)(*((void *)&v32 + 1) + 8 * i) unsignedIntegerValue];
          }
          uint64_t v21 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v21);
        if (v22) {
          goto LABEL_27;
        }
      }
      else
      {
        unsigned int v30 = v6;
        uint64_t v22 = [v16 count];
        if (v22)
        {
LABEL_27:
          uint64_t v25 = [v19 count] - v22;
          uint64_t v26 = objc_msgSend(v19, "subarrayWithRange:", 0, v25);
          uint64_t v27 = objc_msgSend(v19, "subarrayWithRange:", v25, v22);
          unint64_t v19 = (void *)v26;
LABEL_31:
          unint64_t v5 = 0x264003000;
          uint64_t v6 = v30;
          goto LABEL_33;
        }
      }
      uint64_t v27 = 0;
      goto LABEL_31;
    }
  }
  unint64_t v19 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"targets");
  uint64_t v27 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"correctives");
LABEL_33:
  if (v7 | v27) {
    -[SCNMorpher setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:](v4, "setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:", v19, v7, v10, v17, v31);
  }
  else {
    [(SCNMorpher *)v4 setTargets:v19];
  }
  -[SCNMorpher setWeights:](v4, "setWeights:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"weights"));
  -[SCNMorpher setName:](v4, "setName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"name"]);
  if ([a3 containsValueForKey:@"shouldMorphNormals"]) {
    -[SCNMorpher setUnifiesNormals:](v4, "setUnifiesNormals:", [a3 decodeBoolForKey:@"shouldMorphNormals"] ^ 1);
  }
  v4->_animationsLock._os_unfair_lock_opaque = 0;
  SCNDecodeEntity(a3, v4);
  SCNDecodeAnimations(a3, v4);
  [(SCNMorpher *)v4 _didDecodeSCNMorpher:a3];
  [*(id *)(v5 + 2904) setImmediateMode:v6];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)SCNUID_classForElementOfArray:(id)a3
{
  if (([a3 isEqualToString:@"weights"] & 1) == 0
    && ([a3 isEqualToString:@"channelTargetWeights"] & 1) == 0
    && ![a3 isEqualToString:@"channelTargetCounts"])
  {
    return 0;
  }

  return (Class)objc_opt_class();
}

- (void)setName:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setWeight:forTargetAtIndex:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)_presentationWeightForTargetAtIndex:(uint64_t)a3 token:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateTargetsAndInBetween:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateCorrectivesAndInBetween:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setTargetsAndInBetweens:(os_log_t)log inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:.cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "inBetweenIndex < targetsAndInBetweens.count";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Invalid in-between count (out of bounds) passed to morpher initialization", buf, 0xCu);
}

- (void)_validateTargetsAndInBetweens:(void *)a1 inBetweenCounts:inBetweenWeights:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_2_8(&dword_20B249000, v1, v2, "Assertion '%s' failed. Expected %u in-betweens but found %u", v3, v4, v5, v6, 2u);
}

- (void)setCalculationMode:.cold.1()
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

@end