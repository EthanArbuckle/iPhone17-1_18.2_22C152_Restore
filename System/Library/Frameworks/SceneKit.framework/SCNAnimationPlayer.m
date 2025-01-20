@interface SCNAnimationPlayer
+ (BOOL)supportsSecureCoding;
+ (SCNAnimationPlayer)animationPlayerWithAnimation:(SCNAnimation *)animation;
+ (SCNAnimationPlayer)animationPlayerWithAnimationPlayerRef:(__C3DAnimationPlayer *)a3;
+ (SCNAnimationPlayer)animationPlayerWithSCNAnimation:(id)a3;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)isAnimationForKeyPaused:(id)a3;
- (BOOL)paused;
- (CGFloat)blendFactor;
- (CGFloat)speed;
- (NSArray)animationKeys;
- (NSString)description;
- (SCNAnimation)animation;
- (SCNAnimationPlayer)initWithAnimationPlayerRef:(__C3DAnimationPlayer *)a3;
- (SCNAnimationPlayer)initWithCoder:(id)a3;
- (SCNAnimationPlayer)initWithSCNAnimation:(id)a3;
- (__C3DAnimationManager)animationManager;
- (__C3DAnimationPlayer)animationPlayerRef;
- (__C3DScene)sceneRef;
- (float)weight;
- (id)_scnAnimationForKey:(id)a3;
- (id)_scnBindings;
- (id)animationForKey:(id)a3;
- (id)animationPlayerForKey:(id)a3;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)scene;
- (void)__CFObject;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_setAnimation:(id)a3;
- (void)_syncObjCAnimations;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)commonInit;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)pauseAnimationForKey:(id)a3;
- (void)play;
- (void)prepareWithTarget:(id)a3 implicitDuration:(double)a4;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(double)a3;
- (void)removeAllBindings;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(double)a4;
- (void)resumeAnimationForKey:(id)a3;
- (void)setBlendFactor:(CGFloat)blendFactor;
- (void)setPaused:(BOOL)paused;
- (void)setSpeed:(CGFloat)speed;
- (void)setSpeed:(double)a3 forAnimationKey:(id)a4;
- (void)setWeight:(float)a3;
- (void)stop;
- (void)stopWithBlendOutDuration:(NSTimeInterval)duration;
- (void)unbindAnimatablePath:(id)a3;
@end

@implementation SCNAnimationPlayer

- (void)commonInit
{
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)&self->_weight = _D0;
  self->_paused = 1;
}

+ (SCNAnimationPlayer)animationPlayerWithAnimation:(SCNAnimation *)animation
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSCNAnimation:animation];

  return (SCNAnimationPlayer *)v3;
}

- (SCNAnimationPlayer)initWithAnimationPlayerRef:(__C3DAnimationPlayer *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNAnimationPlayer;
  v4 = [(SCNAnimationPlayer *)&v7 init];
  if (v4)
  {
    v5 = (__C3DAnimationPlayer *)CFRetain(a3);
    v4->_playerRef = v5;
    v4->_animation = +[SCNAnimation animationWithC3DAnimation:C3DAnimationPlayerGetAnimation((uint64_t)v5)];
    v4->_weight = C3DAnimationPlayerGetWeight((uint64_t)a3);
    v4->_speed = C3DAnimationPlayerGetSpeed((uint64_t)a3);
    v4->_paused = C3DAnimationPlayerGetPaused((uint64_t)a3);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    [(SCNAnimationPlayer *)v4 _syncObjCAnimations];
  }
  return v4;
}

+ (SCNAnimationPlayer)animationPlayerWithAnimationPlayerRef:(__C3DAnimationPlayer *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithAnimationPlayerRef:a3];

  return (SCNAnimationPlayer *)v3;
}

- (SCNAnimationPlayer)initWithSCNAnimation:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNAnimationPlayer;
  v4 = [(SCNAnimationPlayer *)&v6 init];
  if (v4)
  {
    v4->_playerRef = (__C3DAnimationPlayer *)C3DAnimationPlayerCreateWithAnimation((const void *)[a3 animationRef]);
    v4->_animation = (SCNAnimation *)a3;
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    [(SCNAnimationPlayer *)v4 commonInit];
  }
  return v4;
}

+ (SCNAnimationPlayer)animationPlayerWithSCNAnimation:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithSCNAnimation:a3];

  return (SCNAnimationPlayer *)v3;
}

- (void)dealloc
{
  playerRef = self->_playerRef;
  if (playerRef)
  {
    CFRelease(playerRef);
    self->_playerRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNAnimationPlayer;
  [(SCNAnimationPlayer *)&v4 dealloc];
}

- (void)_setAnimation:(id)a3
{
  animation = self->_animation;
  if (animation != a3)
  {

    self->_animation = (SCNAnimation *)a3;
    playerRef = self->_playerRef;
    if (playerRef)
    {
      CFRelease(playerRef);
      self->_playerRef = 0;
    }
    if (a3)
    {
      objc_super v7 = (__C3DAnimationPlayer *)C3DAnimationPlayerCreateWithAnimation((const void *)[a3 animationRef]);
      self->_playerRef = v7;
      C3DAnimationPlayerSetWeight((uint64_t)v7, self->_weight);
      C3DAnimationPlayerSetSpeed((uint64_t)self->_playerRef, self->_speed);
      v8 = self->_playerRef;
      BOOL paused = self->_paused;
      C3DAnimationPlayerSetPaused((uint64_t)v8, paused);
    }
  }
}

- (__C3DAnimationPlayer)animationPlayerRef
{
  return self->_playerRef;
}

- (void)prepareWithTarget:(id)a3 implicitDuration:(double)a4
{
  [(SCNAnimation *)self->_animation prepareWithTarget:a3 implicitDuration:a4];
  playerRef = self->_playerRef;
  objc_super v6 = [(SCNAnimation *)self->_animation animationRef];

  C3DAnimationPlayerSetAnimation((uint64_t)playerRef, v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  objc_super v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSCNAnimation:", -[SCNAnimationPlayer animation](self, "animation"));
  [(SCNAnimationPlayer *)self weight];
  objc_msgSend(v4, "setWeight:");
  [(SCNAnimationPlayer *)self speed];
  objc_msgSend(v4, "setSpeed:");
  objc_msgSend(v4, "setPaused:", -[SCNAnimationPlayer paused](self, "paused"));
  +[SCNTransaction commit];
  return v4;
}

- (void)__CFObject
{
  return self->_playerRef;
}

- (__C3DAnimationManager)animationManager
{
  result = [(SCNAnimationPlayer *)self sceneRef];
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
    v9 = [(SCNAnimationPlayer *)self __CFObject];
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
    BOOL v8 = [(SCNAnimationPlayer *)self sceneRef];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__SCNAnimationPlayer_addAnimationPlayer_forKey___block_invoke;
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
      -[SCNMaterial addAnimationPlayer:forKey:]();
    }
  }
}

void __48__SCNAnimationPlayer_addAnimationPlayer_forKey___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "prepareWithTarget:implicitDuration:", a1[5]);
  if ((SCNAddAnimation(a1[4], a1[5], a1[6]) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 9);
    [*((id *)a1[5] + 5) removeObjectForKey:a1[6]];
    v2 = (os_unfair_lock_s *)((char *)a1[5] + 36);
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
    objc_super v7 = +[SCNAnimationPlayer animationPlayerWithSCNAnimation:v6];
    [(SCNAnimationPlayer *)self addAnimationPlayer:v7 forKey:v5];
    [(SCNAnimationPlayer *)v7 play];
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
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  [(SCNOrderedDictionary *)self->_animations removeAllObjects];
  os_unfair_lock_unlock(p_animationsLock);
  objc_super v4 = [(SCNAnimationPlayer *)self sceneRef];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__SCNAnimationPlayer_removeAllAnimations__block_invoke;
  v5[3] = &unk_264005010;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:v4 object:self applyBlock:v5];
}

void __41__SCNAnimationPlayer_removeAllAnimations__block_invoke(uint64_t a1)
{
}

- (void)removeAllAnimationsWithBlendOutDuration:(double)a3
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  [(SCNOrderedDictionary *)self->_animations removeAllObjects];
  os_unfair_lock_unlock(p_animationsLock);
  objc_super v6 = [(SCNAnimationPlayer *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__SCNAnimationPlayer_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
}

void __62__SCNAnimationPlayer_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
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
    objc_super v6 = [(SCNAnimationPlayer *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__SCNAnimationPlayer_removeAnimationForKey___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __44__SCNAnimationPlayer_removeAnimationForKey___block_invoke(uint64_t a1)
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
    BOOL v8 = [(SCNAnimationPlayer *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61__SCNAnimationPlayer_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_264004E20;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v9];
  }
}

void __61__SCNAnimationPlayer_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
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
  v3 = [(SCNAnimationPlayer *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(SCNOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  id v5 = [(SCNAnimationPlayer *)self __CFObject];
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
  id v3 = [(SCNAnimationPlayer *)self _scnAnimationForKey:a3];
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
        [(SCNAnimationPlayer *)self addAnimationPlayer:v11 forKey:v10];
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
  uint64_t v9 = [(SCNAnimationPlayer *)self __CFObject];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = [(SCNAnimationPlayer *)self animationManager];
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
  BOOL v5 = [(SCNAnimationPlayer *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__SCNAnimationPlayer_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __43__SCNAnimationPlayer_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:1 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)resumeAnimationForKey:(id)a3
{
  BOOL v5 = [(SCNAnimationPlayer *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SCNAnimationPlayer_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __44__SCNAnimationPlayer_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:0 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7 = [NSString stringWithFormat:@"animations.%@.speed", a4];
  uint64_t v8 = [(SCNAnimationPlayer *)self sceneRef];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__SCNAnimationPlayer_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_264004E20;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:v8 object:self keyPath:v7 applyBlock:v9];
}

void __47__SCNAnimationPlayer_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNAnimationPlayer *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  uint64_t v7 = [(SCNAnimationPlayer *)self __CFObject];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [(SCNAnimationPlayer *)self animationManager];
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

    long long v15 = [(SCNAnimationPlayer *)self sceneRef];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __70__SCNAnimationPlayer_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_264006188;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:v15 object:self applyBlock:v16];
  }
}

void __70__SCNAnimationPlayer_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNAnimationPlayer *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__SCNAnimationPlayer_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __43__SCNAnimationPlayer_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  uint64_t v2 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  CFStringRef v3 = *(const __CFString **)(a1 + 40);

  C3DEntityRemoveBindingWithKeyPath(v2, v3);
}

- (void)removeAllBindings
{
  self->_bindings = 0;
  CFStringRef v3 = [(SCNAnimationPlayer *)self sceneRef];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__SCNAnimationPlayer_removeAllBindings__block_invoke;
  v4[3] = &unk_264005010;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:v3 object:self applyBlock:v4];
}

void __39__SCNAnimationPlayer_removeAllBindings__block_invoke(uint64_t a1)
{
  v1 = (CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");

  C3DEntityRemoveAllBindings(v1);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (__C3DScene)sceneRef
{
  uint64_t v2 = [(SCNAnimationPlayer *)self __CFObject];

  return (__C3DScene *)C3DGetScene(v2);
}

- (id)scene
{
  id result = [(SCNAnimationPlayer *)self sceneRef];
  if (result)
  {
    return C3DEntityGetObjCWrapper((id *)result);
  }
  return result;
}

- (float)weight
{
  return self->_weight;
}

- (void)setWeight:(float)a3
{
}

- (CGFloat)blendFactor
{
  return self->_weight;
}

- (void)setBlendFactor:(CGFloat)blendFactor
{
  if (self->_weight != blendFactor)
  {
    float v3 = blendFactor;
    self->_weight = v3;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", 0, MEMORY[0x263EF8330], 3221225472, __37__SCNAnimationPlayer_setBlendFactor___block_invoke, &unk_264004FC0, self, *(void *)&blendFactor);
  }
}

float __37__SCNAnimationPlayer_setBlendFactor___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DAnimationPlayerSetWeight(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)speed
{
  return self->_speed;
}

- (void)setSpeed:(CGFloat)speed
{
  if (self->_speed != speed)
  {
    float v3 = speed;
    self->_speed = v3;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", 0, MEMORY[0x263EF8330], 3221225472, __31__SCNAnimationPlayer_setSpeed___block_invoke, &unk_264004FC0, self, *(void *)&speed);
  }
}

float __31__SCNAnimationPlayer_setSpeed___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DAnimationPlayerSetSpeed(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)paused
{
  if (self->_paused != paused)
  {
    self->_BOOL paused = paused;
    LOBYTE(v3) = paused;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, MEMORY[0x263EF8330], 3221225472, __32__SCNAnimationPlayer_setPaused___block_invoke, &unk_264004FE8, self, v3);
  }
}

void __32__SCNAnimationPlayer_setPaused___block_invoke(uint64_t a1)
{
}

- (void)play
{
  self->_BOOL paused = 0;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0);
}

CFIndex __26__SCNAnimationPlayer_play__block_invoke(uint64_t a1)
{
  return C3DAnimationPlayerPlay(*(void *)(*(void *)(a1 + 32) + 8));
}

- (void)stop
{
  self->_BOOL paused = 1;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0);
}

CFIndex __26__SCNAnimationPlayer_stop__block_invoke(uint64_t a1)
{
  return C3DAnimationPlayerStop(*(void *)(*(void *)(a1 + 32) + 8));
}

- (void)stopWithBlendOutDuration:(NSTimeInterval)duration
{
  self->_BOOL paused = 1;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, MEMORY[0x263EF8330], 3221225472, __47__SCNAnimationPlayer_stopWithBlendOutDuration___block_invoke, &unk_264004FC0, self, *(void *)&duration);
}

CFIndex __47__SCNAnimationPlayer_stopWithBlendOutDuration___block_invoke(uint64_t a1)
{
  return C3DAnimationPlayerStopWithDuration(*(void *)(*(void *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeDouble:@"weight" forKey:self->_weight];
  [a3 encodeDouble:@"speed" forKey:self->_speed];
  [a3 encodeBool:self->_paused forKey:@"paused"];

  SCNEncodeAnimations(a3, self);
}

- (SCNAnimationPlayer)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SCNAnimationPlayer;
  uint64_t v4 = [(SCNAnimationPlayer *)&v9 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [a3 decodeDoubleForKey:@"weight"];
    *(float *)&double v6 = v6;
    v4->_weight = *(float *)&v6;
    [a3 decodeDoubleForKey:@"speed"];
    *(float *)&double v7 = v7;
    v4->_speed = *(float *)&v7;
    v4->_BOOL paused = [a3 decodeBoolForKey:@"paused"];
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    SCNDecodeAnimations(a3, v4);
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<SCNAnimationPlayer(%p) animation=%@>", self, -[SCNAnimationPlayer animation](self, "animation")];
}

- (SCNAnimation)animation
{
  return self->_animation;
}

@end