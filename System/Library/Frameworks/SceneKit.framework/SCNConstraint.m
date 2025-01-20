@interface SCNConstraint
+ (BOOL)supportsSecureCoding;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)isAnimationForKeyPaused:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isIncremental;
- (BOOL)isPausedOrPausedByInheritance;
- (CGFloat)influenceFactor;
- (NSArray)animationKeys;
- (SCNConstraint)init;
- (SCNConstraint)initWithCoder:(id)a3;
- (__C3DAnimationManager)animationManager;
- (__C3DConstraint)constraintRef;
- (__C3DScene)sceneRef;
- (id)_scnAnimationForKey:(id)a3;
- (id)_scnBindings;
- (id)animationForKey:(id)a3;
- (id)animationPlayerForKey:(id)a3;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)name;
- (id)scene;
- (void)__CFObject;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_syncObjCAnimations;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)commonInit;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)finalizeDecodeConstraint:(id)a3;
- (void)pauseAnimationForKey:(id)a3;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(double)a3;
- (void)removeAllBindings;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(double)a4;
- (void)resumeAnimationForKey:(id)a3;
- (void)setConstraintRef:(__C3DConstraint *)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setIncremental:(BOOL)incremental;
- (void)setInfluenceFactor:(CGFloat)influenceFactor;
- (void)setName:(id)a3;
- (void)setSpeed:(double)a3 forAnimationKey:(id)a4;
- (void)unbindAnimatablePath:(id)a3;
@end

@implementation SCNConstraint

- (void)commonInit
{
  self->_enabled = 1;
  self->_influenceFactor = 1.0;
  self->_incremental = C3DWasLinkedBeforeMajorOSYear2017() ^ 1;
  self->_animationsLock._os_unfair_lock_opaque = 0;
}

- (SCNConstraint)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCNConstraint;
  v2 = [(SCNConstraint *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SCNConstraint *)v2 commonInit];
  }
  return v3;
}

- (void)dealloc
{
  constraintRef = self->_constraintRef;
  if (constraintRef)
  {
    CFRelease(constraintRef);
    self->_constraintRef = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)SCNConstraint;
  [(SCNConstraint *)&v4 dealloc];
}

- (void)copyTo:(id)a3
{
  objc_msgSend(a3, "setEnabled:", -[SCNConstraint isEnabled](self, "isEnabled"));
  [(SCNConstraint *)self influenceFactor];
  objc_msgSend(a3, "setInfluenceFactor:");
  BOOL v5 = [(SCNConstraint *)self isIncremental];

  [a3 setIncremental:v5];
}

- (id)name
{
  return (id)C3DConstraintGetName((uint64_t)self->_constraintRef);
}

- (void)setName:(id)a3
{
  constraintRef = self->_constraintRef;
  CFStringRef v4 = (const __CFString *)(id)[a3 copy];

  C3DConstraintSetName((uint64_t)constraintRef, v4);
}

- (__C3DConstraint)constraintRef
{
  return self->_constraintRef;
}

- (void)setConstraintRef:(__C3DConstraint *)a3
{
  constraintRef = self->_constraintRef;
  if (constraintRef != a3)
  {
    if (constraintRef)
    {
      CFRelease(constraintRef);
      self->_constraintRef = 0;
    }
    if (a3) {
      v6 = (__C3DConstraint *)CFRetain(a3);
    }
    else {
      v6 = 0;
    }
    self->_constraintRef = v6;
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)enabled
{
  self->_enabled = enabled;
  BOOL v5 = [(SCNConstraint *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __28__SCNConstraint_setEnabled___block_invoke;
  v6[3] = &unk_264004FE8;
  v6[4] = self;
  BOOL v7 = enabled;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __28__SCNConstraint_setEnabled___block_invoke(uint64_t a1)
{
  return C3DConstraintSetEnabled(*(void *)(*(void *)(a1 + 32) + 8), *(unsigned char *)(a1 + 40));
}

- (BOOL)isIncremental
{
  return self->_incremental;
}

- (void)setIncremental:(BOOL)incremental
{
  self->_incremental = incremental;
  BOOL v5 = [(SCNConstraint *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__SCNConstraint_setIncremental___block_invoke;
  v6[3] = &unk_264004FE8;
  v6[4] = self;
  BOOL v7 = incremental;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __32__SCNConstraint_setIncremental___block_invoke(uint64_t a1)
{
  return C3DConstraintSetIncremental(*(void *)(*(void *)(a1 + 32) + 8), *(unsigned char *)(a1 + 40));
}

- (CGFloat)influenceFactor
{
  return self->_influenceFactor;
}

- (void)setInfluenceFactor:(CGFloat)influenceFactor
{
  if (self->_influenceFactor != influenceFactor)
  {
    self->_influenceFactor = influenceFactor;
    BOOL v5 = [(SCNConstraint *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36__SCNConstraint_setInfluenceFactor___block_invoke;
    v6[3] = &unk_264004FC0;
    v6[4] = self;
    *(CGFloat *)&void v6[5] = influenceFactor;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"influenceFactor" applyBlock:v6];
  }
}

uint64_t __36__SCNConstraint_setInfluenceFactor___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  return C3DConstraintSetInfluenceFactor(*(void *)(*(void *)(a1 + 32) + 8), v1);
}

- (void)finalizeDecodeConstraint:(id)a3
{
  -[SCNConstraint setEnabled:](self, "setEnabled:", [a3 decodeBoolForKey:@"enabled"]);
  [a3 decodeDoubleForKey:@"influenceFactor"];
  -[SCNConstraint setInfluenceFactor:](self, "setInfluenceFactor:");
  if ([a3 containsValueForKey:@"incremental"]) {
    -[SCNConstraint setIncremental:](self, "setIncremental:", [a3 decodeBoolForKey:@"incremental"]);
  }
  self->_animationsLock._os_unfair_lock_opaque = 0;

  SCNDecodeAnimations(a3, self);
}

- (SCNConstraint)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNConstraint;
  v3 = [(SCNConstraint *)&v6 init];
  CFStringRef v4 = v3;
  if (v3) {
    [(SCNConstraint *)v3 commonInit];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeBool:self->_enabled forKey:@"enabled"];
  [a3 encodeDouble:@"influenceFactor" forKey:self->_influenceFactor];
  [a3 encodeBool:self->_incremental forKey:@"incremental"];

  SCNEncodeAnimations(a3, self);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (void)__CFObject
{
  return self->_constraintRef;
}

- (__C3DAnimationManager)animationManager
{
  result = [(SCNConstraint *)self sceneRef];
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
    v9 = [(SCNConstraint *)self __CFObject];
    if ((CFTypeIsC3DEntity(v9) & 1) == 0)
    {
      v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[SCNTechnique __removeAnimation:forKey:](v10);
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
    BOOL v8 = [(SCNConstraint *)self sceneRef];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __43__SCNConstraint_addAnimationPlayer_forKey___block_invoke;
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

void __43__SCNConstraint_addAnimationPlayer_forKey___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "prepareWithTarget:implicitDuration:", a1[5]);
  if ((SCNAddAnimation(a1[4], a1[5], a1[6]) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 4);
    [*((id *)a1[5] + 3) removeObjectForKey:a1[6]];
    v2 = (os_unfair_lock_s *)((char *)a1[5] + 16);
    os_unfair_lock_unlock(v2);
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    objc_super v6 = (SCNAnimation *)a3;
    if (!a4) {
      id v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString");
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v6 = +[SCNAnimation animationWithCAAnimation:v6];
    }
    BOOL v7 = +[SCNAnimationPlayer animationPlayerWithSCNAnimation:v6];
    [(SCNConstraint *)self addAnimationPlayer:v7 forKey:v5];
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
  CFStringRef v4 = [(SCNConstraint *)self sceneRef];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__SCNConstraint_removeAllAnimations__block_invoke;
  v5[3] = &unk_264005010;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:v4 object:self applyBlock:v5];
}

void __36__SCNConstraint_removeAllAnimations__block_invoke(uint64_t a1)
{
}

- (void)removeAllAnimationsWithBlendOutDuration:(double)a3
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  [(SCNOrderedDictionary *)self->_animations removeAllObjects];
  os_unfair_lock_unlock(p_animationsLock);
  objc_super v6 = [(SCNConstraint *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__SCNConstraint_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
}

void __57__SCNConstraint_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
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
    objc_super v6 = [(SCNConstraint *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __39__SCNConstraint_removeAnimationForKey___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __39__SCNConstraint_removeAnimationForKey___block_invoke(uint64_t a1)
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
    BOOL v8 = [(SCNConstraint *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__SCNConstraint_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_264004E20;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v9];
  }
}

void __56__SCNConstraint_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
{
}

- (NSArray)animationKeys
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  CFStringRef v4 = [(SCNOrderedDictionary *)self->_animations allKeys];
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
  v3 = [(SCNConstraint *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(SCNOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  id v5 = [(SCNConstraint *)self __CFObject];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    if ((CFTypeIsC3DEntity(v5) & 1) == 0)
    {
      BOOL v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[SCNTechnique _syncObjCAnimations](v7);
      }
    }
    CFDictionaryRef Animations = C3DEntityGetAnimations(v6);
    if (Animations)
    {
      CFDictionaryRef v9 = Animations;
      os_unfair_lock_lock(&self->_animationsLock);
      C3DOrderedDictionaryApplyFunction(v9, (const char *)SCNConvertC3DAnimationDictionaryFunc, (uint64_t)self->_animations);
      os_unfair_lock_unlock(&self->_animationsLock);
    }
  }
  if (v4) {
    C3DSceneUnlock(v4);
  }
}

- (id)animationForKey:(id)a3
{
  id v3 = [(SCNConstraint *)self _scnAnimationForKey:a3];
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
        v11 = objc_msgSend((id)objc_msgSend(a3, "animationPlayerForKey:", v10), "copy");
        [(SCNConstraint *)self addAnimationPlayer:v11 forKey:v10];
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
  CFDictionaryRef v9 = [(SCNConstraint *)self __CFObject];
  if (v9)
  {
    uint64_t v10 = v9;
    v11 = [(SCNConstraint *)self animationManager];
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
  BOOL v5 = [(SCNConstraint *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__SCNConstraint_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __38__SCNConstraint_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:1 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)resumeAnimationForKey:(id)a3
{
  BOOL v5 = [(SCNConstraint *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__SCNConstraint_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __39__SCNConstraint_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:0 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7 = [NSString stringWithFormat:@"animations.%@.speed", a4];
  uint64_t v8 = [(SCNConstraint *)self sceneRef];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__SCNConstraint_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_264004E20;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:v8 object:self keyPath:v7 applyBlock:v9];
}

void __42__SCNConstraint_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNConstraint *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  uint64_t v7 = [(SCNConstraint *)self __CFObject];
  if (v7)
  {
    uint64_t v8 = v7;
    CFDictionaryRef v9 = [(SCNConstraint *)self animationManager];
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

    long long v15 = [(SCNConstraint *)self sceneRef];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __65__SCNConstraint_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_264006188;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:v15 object:self applyBlock:v16];
  }
}

void __65__SCNConstraint_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNConstraint *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__SCNConstraint_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __38__SCNConstraint_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  uint64_t v2 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  CFStringRef v3 = *(const __CFString **)(a1 + 40);

  C3DEntityRemoveBindingWithKeyPath(v2, v3);
}

- (void)removeAllBindings
{
  self->_bindings = 0;
  CFStringRef v3 = [(SCNConstraint *)self sceneRef];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__SCNConstraint_removeAllBindings__block_invoke;
  v4[3] = &unk_264005010;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:v3 object:self applyBlock:v4];
}

void __34__SCNConstraint_removeAllBindings__block_invoke(uint64_t a1)
{
  float v1 = (CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");

  C3DEntityRemoveAllBindings(v1);
}

- (__C3DScene)sceneRef
{
  uint64_t v2 = [(SCNConstraint *)self __CFObject];

  return (__C3DScene *)C3DGetScene(v2);
}

- (id)scene
{
  id result = [(SCNConstraint *)self sceneRef];
  if (result)
  {
    return C3DEntityGetObjCWrapper((id *)result);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CFStringRef v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[SCNConstraint copyWithZone:](v3);
  }
  return 0;
}

- (id)copy
{
  return [(SCNConstraint *)self copyWithZone:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)copyWithZone:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)float v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: attempt to copy SCNConstraint that is a virtual class", v1, 2u);
}

@end