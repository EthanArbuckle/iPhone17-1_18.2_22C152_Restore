@interface SCNParticleSystem
+ (BOOL)supportsSecureCoding;
+ (SCNParticleSystem)particleSystem;
+ (SCNParticleSystem)particleSystemNamed:(NSString *)name inDirectory:(NSString *)directory;
+ (SCNParticleSystem)particleSystemWithParticleSystemRef:(__C3DParticleSystem *)a3;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)_isAReference;
- (BOOL)affectedByGravity;
- (BOOL)affectedByPhysicsFields;
- (BOOL)blackPassEnabled;
- (BOOL)isAnimationForKeyPaused:(id)a3;
- (BOOL)isLocal;
- (BOOL)isPausedOrPausedByInheritance;
- (BOOL)lightingEnabled;
- (BOOL)loops;
- (BOOL)particleDiesOnCollision;
- (BOOL)physicsCollisionsEnabled;
- (BOOL)softParticlesEnabled;
- (BOOL)writesToDepthBuffer;
- (CGFloat)birthRate;
- (CGFloat)birthRateVariation;
- (CGFloat)dampingFactor;
- (CGFloat)emissionDuration;
- (CGFloat)emissionDurationVariation;
- (CGFloat)fresnelExponent;
- (CGFloat)idleDuration;
- (CGFloat)idleDurationVariation;
- (CGFloat)imageSequenceFrameRate;
- (CGFloat)imageSequenceFrameRateVariation;
- (CGFloat)imageSequenceInitialFrame;
- (CGFloat)imageSequenceInitialFrameVariation;
- (CGFloat)particleAngle;
- (CGFloat)particleAngleVariation;
- (CGFloat)particleAngularVelocity;
- (CGFloat)particleAngularVelocityVariation;
- (CGFloat)particleBounce;
- (CGFloat)particleBounceVariation;
- (CGFloat)particleCharge;
- (CGFloat)particleChargeVariation;
- (CGFloat)particleFriction;
- (CGFloat)particleFrictionVariation;
- (CGFloat)particleIntensity;
- (CGFloat)particleIntensityVariation;
- (CGFloat)particleLifeSpan;
- (CGFloat)particleLifeSpanVariation;
- (CGFloat)particleMass;
- (CGFloat)particleMassVariation;
- (CGFloat)particleSize;
- (CGFloat)particleSizeVariation;
- (CGFloat)particleVelocity;
- (CGFloat)particleVelocityVariation;
- (CGFloat)speedFactor;
- (CGFloat)spreadingAngle;
- (CGFloat)stretchFactor;
- (CGFloat)warmupDuration;
- (NSArray)animationKeys;
- (NSArray)colliderNodes;
- (NSDictionary)propertyControllers;
- (NSUInteger)imageSequenceColumnCount;
- (NSUInteger)imageSequenceRowCount;
- (SCNGeometry)emitterShape;
- (SCNParticleBirthDirection)birthDirection;
- (SCNParticleBirthLocation)birthLocation;
- (SCNParticleBlendMode)blendMode;
- (SCNParticleImageSequenceAnimationMode)imageSequenceAnimationMode;
- (SCNParticleOrientationMode)orientationMode;
- (SCNParticleSortingMode)sortingMode;
- (SCNParticleSystem)init;
- (SCNParticleSystem)initWithCoder:(id)a3;
- (SCNParticleSystem)initWithParticleSystemRef:(__C3DParticleSystem *)a3;
- (SCNParticleSystem)systemSpawnedOnCollision;
- (SCNParticleSystem)systemSpawnedOnDying;
- (SCNParticleSystem)systemSpawnedOnLiving;
- (SCNVector3)acceleration;
- (SCNVector3)emittingDirection;
- (SCNVector3)orientationDirection;
- (SCNVector4)particleColorVariation;
- (UIColor)particleColor;
- (__C3DAnimationManager)animationManager;
- (__C3DParticleSystem)particleSystemRef;
- (__C3DScene)sceneRef;
- (double)fixedTimeStep;
- (double)lightEmissionRadiusFactor;
- (id)_scnAnimationForKey:(id)a3;
- (id)_scnBindings;
- (id)animationForKey:(id)a3;
- (id)animationPlayerForKey:(id)a3;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (id)initPresentationSystemWithSystemRef:(__C3DParticleSystem *)a3;
- (id)name;
- (id)particleGeometries;
- (id)particleImage;
- (id)presentationInstance;
- (id)referenceName;
- (id)scene;
- (int64_t)renderingMode;
- (int64_t)seed;
- (signed)typeOfProperty:(id)a3;
- (void)__CFObject;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_customDecodingOfSCNParticleSystem:(id)a3;
- (void)_customEncodingOfSCNParticleSystem:(id)a3;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_setParticleImagePath:(id)a3 withResolvedPath:(id)a4;
- (void)_syncEntityObjCModel;
- (void)_syncObjCAnimations;
- (void)_syncObjCModel;
- (void)_updateParticleC3DImage:(id)a3;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)addModifierForProperties:(NSArray *)properties atStage:(SCNParticleModifierStage)stage withBlock:(SCNParticleModifierBlock)block;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleEvent:(SCNParticleEvent)event forProperties:(NSArray *)properties withBlock:(SCNParticleEventBlock)block;
- (void)pauseAnimationForKey:(id)a3;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(double)a3;
- (void)removeAllBindings;
- (void)removeAllModifiers;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(double)a4;
- (void)removeModifiersOfStage:(SCNParticleModifierStage)stage;
- (void)reset;
- (void)resumeAnimationForKey:(id)a3;
- (void)setAcceleration:(SCNVector3)acceleration;
- (void)setAffectedByGravity:(BOOL)affectedByGravity;
- (void)setAffectedByPhysicsFields:(BOOL)affectedByPhysicsFields;
- (void)setBirthDirection:(SCNParticleBirthDirection)birthDirection;
- (void)setBirthLocation:(SCNParticleBirthLocation)birthLocation;
- (void)setBirthRate:(CGFloat)birthRate;
- (void)setBirthRateVariation:(CGFloat)birthRateVariation;
- (void)setBlackPassEnabled:(BOOL)blackPassEnabled;
- (void)setBlendMode:(SCNParticleBlendMode)blendMode;
- (void)setColliderNodes:(NSArray *)colliderNodes;
- (void)setDampingFactor:(CGFloat)dampingFactor;
- (void)setEmissionDuration:(CGFloat)emissionDuration;
- (void)setEmissionDurationVariation:(CGFloat)emissionDurationVariation;
- (void)setEmitterShape:(SCNGeometry *)emitterShape;
- (void)setEmittingDirection:(SCNVector3)emittingDirection;
- (void)setFixedTimeStep:(double)a3;
- (void)setFresnelExponent:(CGFloat)fresnelExponent;
- (void)setIdentifier:(id)a3;
- (void)setIdleDuration:(CGFloat)idleDuration;
- (void)setIdleDurationVariation:(CGFloat)idleDurationVariation;
- (void)setImageSequenceAnimationMode:(SCNParticleImageSequenceAnimationMode)imageSequenceAnimationMode;
- (void)setImageSequenceColumnCount:(NSUInteger)imageSequenceColumnCount;
- (void)setImageSequenceFrameRate:(CGFloat)imageSequenceFrameRate;
- (void)setImageSequenceFrameRateVariation:(CGFloat)imageSequenceFrameRateVariation;
- (void)setImageSequenceInitialFrame:(CGFloat)imageSequenceInitialFrame;
- (void)setImageSequenceInitialFrameVariation:(CGFloat)imageSequenceInitialFrameVariation;
- (void)setImageSequenceRowCount:(NSUInteger)imageSequenceRowCount;
- (void)setIsLocal:(BOOL)a3;
- (void)setLightEmissionRadiusFactor:(double)a3;
- (void)setLightingEnabled:(BOOL)lightingEnabled;
- (void)setLoops:(BOOL)loops;
- (void)setName:(id)a3;
- (void)setOrientationDirection:(SCNVector3)orientationDirection;
- (void)setOrientationMode:(SCNParticleOrientationMode)orientationMode;
- (void)setParticleAngle:(CGFloat)particleAngle;
- (void)setParticleAngleVariation:(CGFloat)particleAngleVariation;
- (void)setParticleAngularVelocity:(CGFloat)particleAngularVelocity;
- (void)setParticleAngularVelocityVariation:(CGFloat)particleAngularVelocityVariation;
- (void)setParticleBounce:(CGFloat)particleBounce;
- (void)setParticleBounceVariation:(CGFloat)particleBounceVariation;
- (void)setParticleCharge:(CGFloat)particleCharge;
- (void)setParticleChargeVariation:(CGFloat)particleChargeVariation;
- (void)setParticleColor:(UIColor *)particleColor;
- (void)setParticleColorVariation:(SCNVector4)particleColorVariation;
- (void)setParticleDiesOnCollision:(BOOL)particleDiesOnCollision;
- (void)setParticleFriction:(CGFloat)particleFriction;
- (void)setParticleFrictionVariation:(CGFloat)particleFrictionVariation;
- (void)setParticleGeometries:(id)a3;
- (void)setParticleImage:(id)particleImage;
- (void)setParticleIntensity:(CGFloat)particleIntensity;
- (void)setParticleIntensityVariation:(CGFloat)particleIntensityVariation;
- (void)setParticleLifeSpan:(CGFloat)particleLifeSpan;
- (void)setParticleLifeSpanVariation:(CGFloat)particleLifeSpanVariation;
- (void)setParticleMass:(CGFloat)particleMass;
- (void)setParticleMassVariation:(CGFloat)particleMassVariation;
- (void)setParticleSize:(CGFloat)particleSize;
- (void)setParticleSizeVariation:(CGFloat)particleSizeVariation;
- (void)setParticleVelocity:(CGFloat)particleVelocity;
- (void)setParticleVelocityVariation:(CGFloat)particleVelocityVariation;
- (void)setPhysicsCollisionsEnabled:(BOOL)a3;
- (void)setPropertyControllers:(NSDictionary *)propertyControllers;
- (void)setReferenceName:(id)a3;
- (void)setRenderingMode:(int64_t)a3;
- (void)setSeed:(int64_t)a3;
- (void)setSoftParticlesEnabled:(BOOL)a3;
- (void)setSortingMode:(SCNParticleSortingMode)sortingMode;
- (void)setSpeed:(double)a3 forAnimationKey:(id)a4;
- (void)setSpeedFactor:(CGFloat)speedFactor;
- (void)setSpreadingAngle:(CGFloat)spreadingAngle;
- (void)setStretchFactor:(CGFloat)stretchFactor;
- (void)setSystemSpawnedOnCollision:(SCNParticleSystem *)systemSpawnedOnCollision;
- (void)setSystemSpawnedOnDying:(SCNParticleSystem *)systemSpawnedOnDying;
- (void)setSystemSpawnedOnLiving:(SCNParticleSystem *)systemSpawnedOnLiving;
- (void)setWarmupDuration:(CGFloat)warmupDuration;
- (void)setWritesToDepthBuffer:(BOOL)writesToDepthBuffer;
- (void)unbindAnimatablePath:(id)a3;
@end

@implementation SCNParticleSystem

- (void)setName:(id)a3
{
  if (*((unsigned char *)self + 16))
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setName:]();
    }
  }
  else if ((unint64_t)a3 | (unint64_t)self->_name)
  {
    if ((objc_msgSend(a3, "isEqual:") & 1) == 0)
    {

      self->_name = (NSString *)[a3 copy];
      v5 = [(SCNParticleSystem *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __29__SCNParticleSystem_setName___block_invoke;
      v7[3] = &unk_264006160;
      v7[4] = self;
      v7[5] = a3;
      +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
    }
  }
}

CFStringRef __29__SCNParticleSystem_setName___block_invoke(uint64_t a1)
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
  v4 = [(SCNParticleSystem *)self sceneRef];
  uint64_t v5 = (uint64_t)v4;
  if (v4) {
    C3DSceneLock((uint64_t)v4);
  }
  Name = (void *)C3DEntityGetName((uint64_t)[(SCNParticleSystem *)self __CFObject]);
  if (v5) {
    C3DSceneUnlock(v5);
  }
  return Name;
}

- (void)setIdentifier:(id)a3
{
  v4 = [(SCNParticleSystem *)self __CFObject];

  C3DEntitySetID((uint64_t)v4, a3);
}

- (id)identifier
{
  uint64_t v2 = [(SCNParticleSystem *)self __CFObject];

  return (id)C3DEntityGetID((uint64_t)v2);
}

- (void)_syncEntityObjCModel
{
  CFStringRef v3 = [(SCNParticleSystem *)self __CFObject];

  self->_name = (NSString *)(id)C3DEntityGetName((uint64_t)v3);
}

- (__C3DScene)sceneRef
{
  uint64_t v2 = [(SCNParticleSystem *)self __CFObject];

  return (__C3DScene *)C3DGetScene(v2);
}

- (id)scene
{
  id result = [(SCNParticleSystem *)self sceneRef];
  if (result)
  {
    return C3DEntityGetObjCWrapper((id *)result);
  }
  return result;
}

- (void)__CFObject
{
  return self->_particleSystem;
}

- (__C3DAnimationManager)animationManager
{
  id result = [(SCNParticleSystem *)self sceneRef];
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
    v9 = [(SCNParticleSystem *)self __CFObject];
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
    BOOL v8 = [(SCNParticleSystem *)self sceneRef];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__SCNParticleSystem_addAnimationPlayer_forKey___block_invoke;
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

void __47__SCNParticleSystem_addAnimationPlayer_forKey___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "prepareWithTarget:implicitDuration:", a1[5]);
  if ((SCNAddAnimation(a1[4], a1[5], a1[6]) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 5);
    [*((id *)a1[5] + 3) removeObjectForKey:a1[6]];
    uint64_t v2 = (os_unfair_lock_s *)((char *)a1[5] + 20);
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
    v7 = +[SCNAnimationPlayer animationPlayerWithSCNAnimation:v6];
    [(SCNParticleSystem *)self addAnimationPlayer:v7 forKey:v5];
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
  v4 = [(SCNParticleSystem *)self sceneRef];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__SCNParticleSystem_removeAllAnimations__block_invoke;
  v5[3] = &unk_264005010;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:v4 object:self applyBlock:v5];
}

void __40__SCNParticleSystem_removeAllAnimations__block_invoke(uint64_t a1)
{
}

- (void)removeAllAnimationsWithBlendOutDuration:(double)a3
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  [(SCNOrderedDictionary *)self->_animations removeAllObjects];
  os_unfair_lock_unlock(p_animationsLock);
  v6 = [(SCNParticleSystem *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__SCNParticleSystem_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
}

void __61__SCNParticleSystem_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
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
    v6 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __43__SCNParticleSystem_removeAnimationForKey___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __43__SCNParticleSystem_removeAnimationForKey___block_invoke(uint64_t a1)
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
    BOOL v8 = [(SCNParticleSystem *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__SCNParticleSystem_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_264004E20;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v9];
  }
}

void __60__SCNParticleSystem_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
{
}

- (NSArray)animationKeys
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  v4 = [(SCNOrderedDictionary *)self->_animations allKeys];
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
  CFStringRef v3 = [(SCNParticleSystem *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(SCNOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  id v5 = [(SCNParticleSystem *)self __CFObject];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    if ((CFTypeIsC3DEntity(v5) & 1) == 0)
    {
      v7 = scn_default_log();
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
  id v3 = [(SCNParticleSystem *)self _scnAnimationForKey:a3];
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
        [(SCNParticleSystem *)self addAnimationPlayer:v11 forKey:v10];
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
  CFDictionaryRef v9 = [(SCNParticleSystem *)self __CFObject];
  if (v9)
  {
    uint64_t v10 = v9;
    v11 = [(SCNParticleSystem *)self animationManager];
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
  BOOL v5 = [(SCNParticleSystem *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__SCNParticleSystem_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __42__SCNParticleSystem_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:1 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)resumeAnimationForKey:(id)a3
{
  BOOL v5 = [(SCNParticleSystem *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__SCNParticleSystem_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __43__SCNParticleSystem_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:0 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7 = [NSString stringWithFormat:@"animations.%@.speed", a4];
  uint64_t v8 = [(SCNParticleSystem *)self sceneRef];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__SCNParticleSystem_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_264004E20;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:v8 object:self keyPath:v7 applyBlock:v9];
}

void __46__SCNParticleSystem_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNParticleSystem *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  uint64_t v7 = [(SCNParticleSystem *)self __CFObject];
  if (v7)
  {
    uint64_t v8 = v7;
    CFDictionaryRef v9 = [(SCNParticleSystem *)self animationManager];
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

    long long v15 = [(SCNParticleSystem *)self sceneRef];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __69__SCNParticleSystem_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_264006188;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:v15 object:self applyBlock:v16];
  }
}

void __69__SCNParticleSystem_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNParticleSystem *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__SCNParticleSystem_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __42__SCNParticleSystem_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  uint64_t v2 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  CFStringRef v3 = *(const __CFString **)(a1 + 40);

  C3DEntityRemoveBindingWithKeyPath(v2, v3);
}

- (void)removeAllBindings
{
  self->_bindings = 0;
  CFStringRef v3 = [(SCNParticleSystem *)self sceneRef];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__SCNParticleSystem_removeAllBindings__block_invoke;
  v4[3] = &unk_264005010;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:v3 object:self applyBlock:v4];
}

void __38__SCNParticleSystem_removeAllBindings__block_invoke(uint64_t a1)
{
  v1 = (CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");

  C3DEntityRemoveAllBindings(v1);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

+ (SCNParticleSystem)particleSystem
{
  id v2 = objc_alloc_init((Class)a1);

  return (SCNParticleSystem *)v2;
}

+ (SCNParticleSystem)particleSystemNamed:(NSString *)name inDirectory:(NSString *)directory
{
  uint64_t v6 = [(NSString *)name pathExtension];
  uint64_t v7 = (void *)SCNGetResourceBundle();
  uint64_t v8 = [(NSString *)name stringByDeletingPathExtension];
  if ([(NSString *)v6 length]) {
    CFDictionaryRef v9 = (__CFString *)v6;
  }
  else {
    CFDictionaryRef v9 = @"scnp";
  }
  uint64_t v10 = [v7 URLForResource:v8 withExtension:v9 subdirectory:directory];
  if (!v10) {
    return 0;
  }
  CFURLRef v11 = (const __CFURL *)v10;
  uint64_t v12 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v10];
  if (!v12) {
    return 0;
  }
  double v13 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v12 error:0];
  uint64_t v14 = objc_opt_class();
  if (v14 != objc_opt_class())
  {
    uint64_t v15 = objc_opt_class();
    v16 = (objc_class *)objc_opt_class();
    [v13 setClass:v15 forClassName:NSStringFromClass(v16)];
  }
  objc_msgSend(v13, "setRequiresSecureCoding:", C3DIOShouldActivateSecurityChecks(v11, 0));
  [v13 setDecodingFailurePolicy:0];
  uint64_t v17 = (SCNParticleSystem *)[v13 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F081D0]];

  return v17;
}

- (SCNParticleSystem)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCNParticleSystem;
  id v2 = [(SCNParticleSystem *)&v5 init];
  if (v2)
  {
    uint64_t v3 = C3DParticleSystemCreate();
    v2->_particleSystem = (__C3DParticleSystem *)v3;
    if (v3) {
      C3DEntitySetObjCWrapper(v3, v2);
    }
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    [(SCNParticleSystem *)v2 _syncObjCModel];
  }
  return v2;
}

- (SCNParticleSystem)initWithParticleSystemRef:(__C3DParticleSystem *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNParticleSystem;
  uint64_t v4 = [(SCNParticleSystem *)&v6 init];
  if (v4)
  {
    v4->_particleSystem = (__C3DParticleSystem *)CFRetain(a3);
    if (a3) {
      C3DEntitySetObjCWrapper((uint64_t)a3, v4);
    }
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    [(SCNParticleSystem *)v4 _syncObjCModel];
    [(SCNParticleSystem *)v4 _syncObjCAnimations];
  }
  return v4;
}

- (id)initPresentationSystemWithSystemRef:(__C3DParticleSystem *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNParticleSystem;
  uint64_t v4 = [(SCNParticleSystem *)&v6 init];
  if (v4)
  {
    v4->_particleSystem = (__C3DParticleSystem *)CFRetain(a3);
    *((unsigned char *)v4 + 16) |= 1u;
    v4->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)dealloc
{
  if ((*((unsigned char *)self + 16) & 1) == 0)
  {
    particleSystem = self->_particleSystem;
    if (particleSystem) {
      C3DEntitySetObjCWrapper((uint64_t)particleSystem, 0);
    }
  }
  CFRelease(self->_particleSystem);
  v4.receiver = self;
  v4.super_class = (Class)SCNParticleSystem;
  [(SCNParticleSystem *)&v4 dealloc];
}

- (void)_syncObjCModel
{
  uint64_t v3 = [(SCNParticleSystem *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  objc_super v5 = [(SCNParticleSystem *)self particleSystemRef];
  self->_emissionDuration = C3DParticleSystemGetEmissionDuration((uint64_t)v5);
  self->_emissionDurationVariation = C3DParticleSystemGetEmissionDurationVariation((uint64_t)v5);
  self->_idleDuration = C3DParticleSystemGetIdleDuration((uint64_t)v5);
  self->_idleDurationVariation = C3DParticleSystemGetIdleDurationVariation((uint64_t)v5);
  self->_birthRate = C3DParticleSystemGetBirthRate((uint64_t)v5);
  self->_birthRateVariation = C3DParticleSystemGetBirthRateVariation((uint64_t)v5);
  self->_warmupDuration = C3DParticleSystemGetWarmupDuration((uint64_t)v5);
  uint64_t EmitterShape = C3DParticleSystemGetEmitterShape((uint64_t)v5);
  if (EmitterShape) {
    [(SCNParticleSystem *)self setEmitterShape:+[SCNGeometry geometryWithGeometryRef:EmitterShape]];
  }
  self->_birthLocation = C3DParticleSystemGetBirthLocation((uint64_t)v5);
  self->_birthDirection = C3DParticleSystemGetBirthDirection((uint64_t)v5);
  __n128 EmittingDirection = C3DParticleSystemGetEmittingDirection((__n128 *)v5);
  *(void *)&self->_emittingDirection.x = EmittingDirection.n128_u64[0];
  LODWORD(self->_emittingDirection.z) = EmittingDirection.n128_u32[2];
  __n128 OrientationDirection = C3DParticleSystemGetOrientationDirection((__n128 *)v5);
  *(void *)&self->_orientationDirection.x = OrientationDirection.n128_u64[0];
  LODWORD(self->_orientationDirection.z) = OrientationDirection.n128_u32[2];
  __n128 Acceleration = C3DParticleSystemGetAcceleration((__n128 *)v5);
  *(void *)&self->_acceleration.x = Acceleration.n128_u64[0];
  LODWORD(self->_acceleration.z) = Acceleration.n128_u32[2];
  self->_spreadingAngle = C3DParticleSystemGetSpreadingAngle((uint64_t)v5);
  self->_loops = C3DParticleSystemGetLoops((uint64_t)v5);
  self->_isLocal = C3DParticleSystemGetIsLocal((uint64_t)v5);
  self->_affectedByGravity = C3DParticleSystemGetAffectedByGravity((uint64_t)v5);
  self->_affectedByPhysicsFields = C3DParticleSystemGetAffectedByPhysicsFields((uint64_t)v5);
  self->_physicsCollisionsEnabled = C3DParticleSystemGetPhysicsCollisionsEnabled((uint64_t)v5);
  self->_lightingEnabled = C3DParticleSystemGetLightingEnabled((uint64_t)v5);
  self->_softParticlesEnabled = C3DParticleSystemGetSoftParticlesEnabled((uint64_t)v5);
  self->_particleDiesOnCollision = C3DParticleSystemGetParticleDiesOnCollision((uint64_t)v5);
  self->_blackPassEnabled = C3DParticleSystemGetBlackPassEnabled((uint64_t)v5);
  self->_writesToDepthBuffer = C3DParticleSystemGetWritesToDepthBuffer((uint64_t)v5);
  self->_particleAngle = C3DParticleSystemGetParticleAngle((uint64_t)v5);
  self->_particleAngleVariation = C3DParticleSystemGetParticleAngleVariation((uint64_t)v5);
  self->_particleVelocity = C3DParticleSystemGetParticleVelocity((uint64_t)v5);
  self->_particleVelocityVariation = C3DParticleSystemGetParticleVelocityVariation((uint64_t)v5);
  self->_particleAngularVelocity = C3DParticleSystemGetParticleAngularVelocity((uint64_t)v5);
  self->_particleAngularVelocityVariation = C3DParticleSystemGetParticleAngularVelocityVariation((uint64_t)v5);
  self->_particleLifeSpan = C3DParticleSystemGetParticleLifeSpan((uint64_t)v5);
  self->_particleLifeSpanVariation = C3DParticleSystemGetParticleLifeSpanVariation((uint64_t)v5);
  self->_particleBounce = C3DParticleSystemGetParticleBounce((uint64_t)v5);
  self->_particleBounceVariation = C3DParticleSystemGetParticleBounceVariation((uint64_t)v5);
  self->_particleFriction = C3DParticleSystemGetParticleFriction((uint64_t)v5);
  self->_particleFrictionVariation = C3DParticleSystemGetParticleFrictionVariation((uint64_t)v5);
  uint64_t ParticleColor = C3DParticleSystemGetParticleColor((uint64_t)v5);
  [(SCNParticleSystem *)self setParticleColor:C3DColor4ToRGBCFColor(ParticleColor)];
  self->_particleColorVariation = (SCNVector4)C3DParticleSystemGetParticleColorVariation((__n128 *)v5);
  self->_particleSize = C3DParticleSystemGetParticleSize((uint64_t)v5);
  self->_particleSizeVariation = C3DParticleSystemGetParticleSizeVariation((uint64_t)v5);
  self->_particleIntensity = C3DParticleSystemGetParticleIntensity((uint64_t)v5);
  self->_particleIntensityVariation = C3DParticleSystemGetParticleIntensityVariation((uint64_t)v5);
  self->_seed = (int)C3DParticleSystemGetSeed((uint64_t)v5);
  self->_blendMode = C3DParticleSystemGetBlendMode((uint64_t)v5);
  self->_renderingMode = C3DParticleSystemGetRenderingMode((uint64_t)v5);
  self->_orientationMode = C3DParticleSystemGetOrientationMode((uint64_t)v5);
  self->_imageSequenceAnimationMode = C3DParticleSystemGetImageSequenceAnimationMode((uint64_t)v5);
  self->_sortingMode = C3DParticleSystemGetSortingMode((uint64_t)v5);
  self->_particleMass = C3DParticleSystemGetParticleMass((uint64_t)v5);
  self->_particleMassVariation = C3DParticleSystemGetParticleMassVariation((uint64_t)v5);
  self->_dampingFactor = C3DParticleSystemGetDampingFactor((uint64_t)v5);
  self->_speedFactor = C3DParticleSystemGetSpeedFactor((uint64_t)v5);
  self->_fixedTimeStep = C3DParticleSystemGetFixedTimeStep((uint64_t)v5);
  self->_stretchFactor = C3DParticleSystemGetStretchFactor((uint64_t)v5);
  self->_imageSequenceRowCount = C3DParticleSystemGetImageSequenceRowCount((uint64_t)v5);
  self->_imageSequenceColumnCount = C3DParticleSystemGetImageSequenceColumnCount((uint64_t)v5);
  self->_imageSequenceInitialFrame = C3DParticleSystemGetImageSequenceInitialFrame((uint64_t)v5);
  self->_imageSequenceInitialFrameVariation = C3DParticleSystemGetImageSequenceInitialFrameVariation((uint64_t)v5);
  self->_imageSequenceFrameRate = C3DParticleSystemGetImageSequenceFrameRate((uint64_t)v5);
  self->_imageSequenceFrameRateVariation = C3DParticleSystemGetImageSequenceFrameRateVariation((uint64_t)v5);
  [(SCNParticleSystem *)self _syncEntityObjCModel];
  if (v4)
  {
    C3DSceneUnlock(v4);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  objc_msgSend(v4, "setName:", -[SCNParticleSystem name](self, "name"));
  objc_msgSend(v4, "setParticleImage:", -[SCNParticleSystem particleImage](self, "particleImage"));
  [(SCNParticleSystem *)self emissionDuration];
  objc_msgSend(v4, "setEmissionDuration:");
  [(SCNParticleSystem *)self emissionDurationVariation];
  objc_msgSend(v4, "setEmissionDurationVariation:");
  [(SCNParticleSystem *)self idleDuration];
  objc_msgSend(v4, "setIdleDuration:");
  [(SCNParticleSystem *)self idleDurationVariation];
  objc_msgSend(v4, "setIdleDurationVariation:");
  [(SCNParticleSystem *)self birthRate];
  objc_msgSend(v4, "setBirthRate:");
  [(SCNParticleSystem *)self birthRateVariation];
  objc_msgSend(v4, "setBirthRateVariation:");
  [(SCNParticleSystem *)self warmupDuration];
  objc_msgSend(v4, "setWarmupDuration:");
  objc_msgSend(v4, "setEmitterShape:", -[SCNParticleSystem emitterShape](self, "emitterShape"));
  objc_msgSend(v4, "setBirthLocation:", -[SCNParticleSystem birthLocation](self, "birthLocation"));
  objc_msgSend(v4, "setBirthDirection:", -[SCNParticleSystem birthDirection](self, "birthDirection"));
  [(SCNParticleSystem *)self emittingDirection];
  objc_msgSend(v4, "setEmittingDirection:");
  [(SCNParticleSystem *)self orientationDirection];
  objc_msgSend(v4, "setOrientationDirection:");
  [(SCNParticleSystem *)self acceleration];
  objc_msgSend(v4, "setAcceleration:");
  [(SCNParticleSystem *)self spreadingAngle];
  objc_msgSend(v4, "setSpreadingAngle:");
  objc_msgSend(v4, "setLoops:", -[SCNParticleSystem loops](self, "loops"));
  objc_msgSend(v4, "setIsLocal:", -[SCNParticleSystem isLocal](self, "isLocal"));
  objc_msgSend(v4, "setAffectedByGravity:", -[SCNParticleSystem affectedByGravity](self, "affectedByGravity"));
  objc_msgSend(v4, "setAffectedByPhysicsFields:", -[SCNParticleSystem affectedByPhysicsFields](self, "affectedByPhysicsFields"));
  objc_msgSend(v4, "setPhysicsCollisionsEnabled:", -[SCNParticleSystem physicsCollisionsEnabled](self, "physicsCollisionsEnabled"));
  objc_msgSend(v4, "setLightingEnabled:", -[SCNParticleSystem isLightingEnabled](self, "isLightingEnabled"));
  objc_msgSend(v4, "setSoftParticlesEnabled:", -[SCNParticleSystem areSoftParticlesEnabled](self, "areSoftParticlesEnabled"));
  objc_msgSend(v4, "setParticleDiesOnCollision:", -[SCNParticleSystem particleDiesOnCollision](self, "particleDiesOnCollision"));
  objc_msgSend(v4, "setBlackPassEnabled:", -[SCNParticleSystem isBlackPassEnabled](self, "isBlackPassEnabled"));
  [(SCNParticleSystem *)self particleAngle];
  objc_msgSend(v4, "setParticleAngle:");
  [(SCNParticleSystem *)self particleAngleVariation];
  objc_msgSend(v4, "setParticleAngleVariation:");
  [(SCNParticleSystem *)self particleVelocity];
  objc_msgSend(v4, "setParticleVelocity:");
  [(SCNParticleSystem *)self particleVelocityVariation];
  objc_msgSend(v4, "setParticleVelocityVariation:");
  [(SCNParticleSystem *)self particleAngularVelocity];
  objc_msgSend(v4, "setParticleAngularVelocity:");
  [(SCNParticleSystem *)self particleAngularVelocityVariation];
  objc_msgSend(v4, "setParticleAngularVelocityVariation:");
  [(SCNParticleSystem *)self particleLifeSpan];
  objc_msgSend(v4, "setParticleLifeSpan:");
  [(SCNParticleSystem *)self particleLifeSpanVariation];
  objc_msgSend(v4, "setParticleLifeSpanVariation:");
  [(SCNParticleSystem *)self particleBounce];
  objc_msgSend(v4, "setParticleBounce:");
  [(SCNParticleSystem *)self particleBounceVariation];
  objc_msgSend(v4, "setParticleBounceVariation:");
  [(SCNParticleSystem *)self particleFriction];
  objc_msgSend(v4, "setParticleFriction:");
  [(SCNParticleSystem *)self particleFrictionVariation];
  objc_msgSend(v4, "setParticleFrictionVariation:");
  [(SCNParticleSystem *)self particleCharge];
  objc_msgSend(v4, "setParticleCharge:");
  [(SCNParticleSystem *)self particleChargeVariation];
  objc_msgSend(v4, "setParticleChargeVariation:");
  objc_msgSend(v4, "setParticleColor:", -[SCNParticleSystem particleColor](self, "particleColor"));
  [(SCNParticleSystem *)self particleColorVariation];
  objc_msgSend(v4, "setParticleColorVariation:");
  objc_msgSend(v4, "setSystemSpawnedOnCollision:", -[SCNParticleSystem systemSpawnedOnCollision](self, "systemSpawnedOnCollision"));
  objc_msgSend(v4, "setSystemSpawnedOnDying:", -[SCNParticleSystem systemSpawnedOnDying](self, "systemSpawnedOnDying"));
  objc_msgSend(v4, "setSystemSpawnedOnLiving:", -[SCNParticleSystem systemSpawnedOnLiving](self, "systemSpawnedOnLiving"));
  [(SCNParticleSystem *)self particleSize];
  objc_msgSend(v4, "setParticleSize:");
  [(SCNParticleSystem *)self particleSizeVariation];
  objc_msgSend(v4, "setParticleSizeVariation:");
  objc_msgSend(v4, "setSeed:", -[SCNParticleSystem seed](self, "seed"));
  objc_msgSend(v4, "setBlendMode:", -[SCNParticleSystem blendMode](self, "blendMode"));
  objc_msgSend(v4, "setRenderingMode:", -[SCNParticleSystem renderingMode](self, "renderingMode"));
  objc_msgSend(v4, "setOrientationMode:", -[SCNParticleSystem orientationMode](self, "orientationMode"));
  objc_msgSend(v4, "setImageSequenceAnimationMode:", -[SCNParticleSystem imageSequenceAnimationMode](self, "imageSequenceAnimationMode"));
  objc_msgSend(v4, "setParticleGeometries:", -[SCNParticleSystem particleGeometries](self, "particleGeometries"));
  objc_msgSend(v4, "setColliderNodes:", -[SCNParticleSystem colliderNodes](self, "colliderNodes"));
  objc_msgSend(v4, "setPropertyControllers:", -[SCNParticleSystem propertyControllers](self, "propertyControllers"));
  objc_msgSend(v4, "setSortingMode:", -[SCNParticleSystem sortingMode](self, "sortingMode"));
  [(SCNParticleSystem *)self particleMass];
  objc_msgSend(v4, "setParticleMass:");
  [(SCNParticleSystem *)self particleMassVariation];
  objc_msgSend(v4, "setParticleMassVariation:");
  [(SCNParticleSystem *)self dampingFactor];
  objc_msgSend(v4, "setDampingFactor:");
  [(SCNParticleSystem *)self speedFactor];
  objc_msgSend(v4, "setSpeedFactor:");
  [(SCNParticleSystem *)self fixedTimeStep];
  objc_msgSend(v4, "setFixedTimeStep:");
  [(SCNParticleSystem *)self stretchFactor];
  objc_msgSend(v4, "setStretchFactor:");
  objc_msgSend(v4, "setImageSequenceRowCount:", -[SCNParticleSystem imageSequenceRowCount](self, "imageSequenceRowCount"));
  objc_msgSend(v4, "setImageSequenceColumnCount:", -[SCNParticleSystem imageSequenceColumnCount](self, "imageSequenceColumnCount"));
  [(SCNParticleSystem *)self imageSequenceInitialFrame];
  objc_msgSend(v4, "setImageSequenceInitialFrame:");
  [(SCNParticleSystem *)self imageSequenceInitialFrameVariation];
  objc_msgSend(v4, "setImageSequenceInitialFrameVariation:");
  [(SCNParticleSystem *)self imageSequenceFrameRate];
  objc_msgSend(v4, "setImageSequenceFrameRate:");
  [(SCNParticleSystem *)self imageSequenceFrameRateVariation];
  objc_msgSend(v4, "setImageSequenceFrameRateVariation:");
  objc_msgSend(v4, "setWritesToDepthBuffer:", -[SCNParticleSystem writesToDepthBuffer](self, "writesToDepthBuffer"));
  objc_msgSend(v4, "setReferenceName:", -[SCNParticleSystem referenceName](self, "referenceName"));
  [v4 _copyAnimationsFrom:self];
  +[SCNTransaction commitImmediate];
  return v4;
}

+ (SCNParticleSystem)particleSystemWithParticleSystemRef:(__C3DParticleSystem *)a3
{
  id result = (SCNParticleSystem *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
  {
    objc_super v6 = (void *)[objc_alloc((Class)a1) initWithParticleSystemRef:a3];
    return (SCNParticleSystem *)v6;
  }
  return result;
}

- (id)copy
{
  return [(SCNParticleSystem *)self copyWithZone:0];
}

- (id)presentationInstance
{
  id v2 = [[SCNParticleSystem alloc] initPresentationSystemWithSystemRef:self->_particleSystem];

  return v2;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (__C3DParticleSystem)particleSystemRef
{
  return self->_particleSystem;
}

- (id)particleGeometries
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleGeometries;
  }
  id result = [(SCNParticleSystem *)self sceneRef];
  if (result)
  {
    id v3 = result;
    C3DSceneLock((uint64_t)result);
    C3DSceneUnlock((uint64_t)v3);
    return 0;
  }
  return result;
}

- (signed)typeOfProperty:(id)a3
{
  v9[12] = *MEMORY[0x263EF8340];
  id v4 = (void *)typeOfProperty__s_properties;
  if (!typeOfProperty__s_properties)
  {
    v8[0] = @"Position";
    v8[1] = @"Angle";
    v9[0] = &unk_26BFC1468;
    v9[1] = &unk_26BFC1480;
    v8[2] = @"RotationAxis";
    v8[3] = @"Velocity";
    v9[2] = &unk_26BFC1468;
    v9[3] = &unk_26BFC1468;
    v8[4] = @"AngularVelocity";
    v8[5] = @"Life";
    v9[4] = &unk_26BFC1480;
    v9[5] = &unk_26BFC1480;
    v8[6] = @"Color";
    v8[7] = @"Opacity";
    v9[6] = &unk_26BFC1498;
    void v9[7] = &unk_26BFC1480;
    v8[8] = @"Size";
    v8[9] = @"Bounce";
    v9[8] = &unk_26BFC1480;
    v9[9] = &unk_26BFC1480;
    v8[10] = @"Friction";
    v8[11] = @"Charge";
    v9[10] = &unk_26BFC1480;
    v9[11] = &unk_26BFC1480;
    typeOfProperty__s_properties = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:12];
    id v5 = (id)typeOfProperty__s_properties;
    id v4 = (void *)typeOfProperty__s_properties;
  }
  objc_super v6 = (void *)[v4 objectForKey:a3];
  if (v6) {
    LOWORD(v6) = [v6 intValue];
  }
  return (__int16)v6;
}

- (void)setParticleGeometries:(id)a3
{
  if (*((unsigned char *)self + 16))
  {
    id v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleGeometries:]();
    }
  }
  else if (self->_particleGeometries != a3)
  {
    self->_particleGeometries = (NSArray *)a3;
    id v4 = [(SCNParticleSystem *)self sceneRef];
    +[SCNTransaction postCommandWithContext:v4 object:self applyBlock:&__block_literal_global_71];
  }
}

- (NSArray)colliderNodes
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_colliderNodes;
  }
  id result = [(SCNParticleSystem *)self sceneRef];
  if (result)
  {
    id v3 = result;
    C3DSceneLock((uint64_t)result);
    C3DSceneUnlock((uint64_t)v3);
    return 0;
  }
  return result;
}

- (void)setColliderNodes:(NSArray *)colliderNodes
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setColliderNodes:]();
    }
  }
  else
  {
    id v5 = self->_colliderNodes;
    if (v5 != colliderNodes)
    {

      self->_colliderNodes = (NSArray *)[(NSArray *)colliderNodes copy];
      objc_super v6 = [(SCNParticleSystem *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __38__SCNParticleSystem_setColliderNodes___block_invoke;
      v8[3] = &unk_264006160;
      v8[4] = colliderNodes;
      v8[5] = self;
      +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v8];
    }
  }
}

void __38__SCNParticleSystem_setColliderNodes___block_invoke(uint64_t a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex v3 = [*(id *)(a1 + 32) count];
  CFMutableArrayRef Mutable = CFArrayCreateMutable(v2, v3, MEMORY[0x263EFFF70]);
  id v5 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__SCNParticleSystem_setColliderNodes___block_invoke_2;
  v6[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  v6[4] = Mutable;
  [v5 enumerateObjectsUsingBlock:v6];
  C3DParticleSystemSetColliderNodes(*(void *)(*(void *)(a1 + 40) + 8), Mutable);
  CFRelease(Mutable);
}

void __38__SCNParticleSystem_setColliderNodes___block_invoke_2(uint64_t a1, void *a2)
{
  CFAllocatorRef v2 = *(__CFArray **)(a1 + 32);
  CFIndex v3 = (const void *)objc_msgSend(a2, "__CFObject");

  CFArrayAppendValue(v2, v3);
}

- (NSDictionary)propertyControllers
{
  return self->_propertyControllers;
}

- (void)setPropertyControllers:(NSDictionary *)propertyControllers
{
  if (*((unsigned char *)self + 16))
  {
    objc_super v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setPropertyControllers:]();
    }
  }
  else
  {

    self->_propertyControllers = (NSDictionary *)[(NSDictionary *)propertyControllers copy];
    id v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__SCNParticleSystem_setPropertyControllers___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = propertyControllers;
    v7[5] = self;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __44__SCNParticleSystem_setPropertyControllers___block_invoke(uint64_t a1)
{
  *(uint64_t *)((char *)&v43[1] + 4) = *MEMORY[0x263EF8340];
  v1 = *(void **)(a1 + 32);
  v30 = *(void **)(a1 + 40);
  cf = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v1, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)[v1 allKeys];
  uint64_t v2 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v34;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v34 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v33 + 1) + 8 * v5);
        uint64_t v7 = (void *)[v1 valueForKey:v6];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v8 = (void *)[MEMORY[0x263EFF9A0] dictionary];
          uint64_t v9 = [v7 animation];
          if (v9)
          {
            uint64_t v10 = (void *)v9;
            unsigned int v11 = [v30 typeOfProperty:v6];
            if (v11)
            {
              unsigned int v12 = v11;
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                double v13 = CABasicAnimationToC3DAnimation(v10, v12, 0);
                goto LABEL_16;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                double v13 = CAKeyframeAnimationToC3DAnimation(v10, v12, 0);
LABEL_16:
                uint64_t v17 = v13;
                if (v13)
                {
                  C3DAnimationSetup(v13, 0);
                  [v8 setValue:v17 forKey:@"ControllerAnimation"];
                  uint64_t v14 = v7;
                  uint64_t v15 = v17;
LABEL_18:
                  [v14 setC3dAnimation:v15];
                }
              }
              else
              {
                v27 = scn_default_log();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                  __44__SCNParticleSystem_setPropertyControllers___block_invoke_cold_2(v42, (uint64_t)v10, v43, v27);
                }
              }
            }
            else
            {
              v16 = scn_default_log();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v41 = v6;
                _os_log_error_impl(&dword_20B249000, v16, OS_LOG_TYPE_ERROR, "Error: Can't introspect type of property %@", buf, 0xCu);
              }
            }
            [v7 inputScale];
            if (v18 != 1.0)
            {
              v19 = NSNumber;
              [v7 inputScale];
              *(float *)&double v20 = v20;
              objc_msgSend(v8, "setValue:forKey:", objc_msgSend(v19, "numberWithFloat:", v20), @"ControllerVariableScale");
            }
            [v7 inputBias];
            if (v21 != 0.0)
            {
              v22 = NSNumber;
              [v7 inputBias];
              *(float *)&double v23 = v23;
              objc_msgSend(v8, "setValue:forKey:", objc_msgSend(v22, "numberWithFloat:", v23), @"ControllerVariableBias");
            }
            if ([v7 inputOrigin]) {
              objc_msgSend(v8, "setValue:forKey:", objc_msgSend((id)objc_msgSend(v7, "inputOrigin"), "nodeRef"), @"ControllerVariableOrigin");
            }
            uint64_t v24 = [v7 inputMode];
            v25 = @"ControllerVariableOverLife";
            if (v24)
            {
              v25 = @"ControllerVariableOverOtherProperty";
              if (v24 != 2)
              {
                v25 = @"ControllerVariableOverDistance";
                if (v24 != 1)
                {
                  v26 = scn_default_log();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                    __44__SCNParticleSystem_setPropertyControllers___block_invoke_cold_1(&v37, v38, v26);
                  }
                  v25 = 0;
                }
              }
            }
            [v8 setValue:v25 forKey:@"ControllerVariableMode"];
            objc_msgSend(v8, "setValue:forKey:", objc_msgSend(v7, "inputProperty"), @"ControllerVariableOverOtherProperty");
            [cf setObject:v8 forKey:v6];
            goto LABEL_32;
          }
          uint64_t v14 = v7;
          uint64_t v15 = 0;
          goto LABEL_18;
        }
LABEL_32:
        ++v5;
      }
      while (v3 != v5);
      uint64_t v28 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      uint64_t v3 = v28;
    }
    while (v28);
  }
  C3DParticleSystemSetProperyControllers(*(void *)(*(void *)(a1 + 40) + 8), cf);
}

- (id)particleImage
{
  return self->_particleImage;
}

- (void)_updateParticleC3DImage:(id)a3
{
  uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__SCNParticleSystem__updateParticleC3DImage___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = a3;
  void v6[5] = self;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __45__SCNParticleSystem__updateParticleC3DImage___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = +[SCNMaterialProperty copyC3DImageFromImage:](SCNMaterialProperty, "copyC3DImageFromImage:");
    if (v2)
    {
      uint64_t v3 = v2;
      C3DParticleSystemSetParticleTexture(*(void *)(*(void *)(a1 + 40) + 8), v2);
      CFRelease(v3);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    C3DParticleSystemSetParticleTexture(v4, 0);
  }
}

- (void)setParticleImage:(id)particleImage
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleImage:]();
    }
  }
  else
  {
    id v5 = self->_particleImage;
    if (v5 != particleImage)
    {

      self->_particleImage = particleImage;
      [(SCNParticleSystem *)self _updateParticleC3DImage:particleImage];
    }
  }
}

- (void)_setParticleImagePath:(id)a3 withResolvedPath:(id)a4
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem _setParticleImagePath:withResolvedPath:]();
    }
  }
  else
  {

    self->_particleImage = a3;
    [(SCNParticleSystem *)self _updateParticleC3DImage:a4];
  }
}

- (SCNVector3)orientationDirection
{
  if (*((unsigned char *)self + 16))
  {
    id v5 = [(SCNParticleSystem *)self sceneRef];
    uint64_t v6 = (uint64_t)v5;
    if (v5) {
      C3DSceneLock((uint64_t)v5);
    }
    __n128 OrientationDirection = C3DParticleSystemGetOrientationDirection((__n128 *)self->_particleSystem);
    int8x8_t v4 = vext_s8((int8x8_t)OrientationDirection.n128_u64[0], (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)OrientationDirection, (int8x16_t)OrientationDirection, 8uLL), 4uLL);
    if (v6)
    {
      int8x8_t v8 = v4;
      unsigned __int32 v9 = OrientationDirection.n128_u32[0];
      C3DSceneUnlock(v6);
      int8x8_t v4 = v8;
      OrientationDirection.n128_u32[0] = v9;
    }
  }
  else
  {
    OrientationDirection.n128_u32[0] = LODWORD(self->_orientationDirection.x);
    int8x8_t v4 = *(int8x8_t *)&self->_orientationDirection.y;
  }
  float v7 = *(float *)&v4.i32[1];
  result.x = OrientationDirection.n128_f32[0];
  result.y = *(float *)v4.i32;
  result.z = v7;
  return result;
}

- (void)setOrientationDirection:(SCNVector3)orientationDirection
{
  if (*((unsigned char *)self + 16))
  {
    int8x8_t v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setOrientationDirection:]();
    }
  }
  else
  {
    float z = orientationDirection.z;
    float y = orientationDirection.y;
    float x = orientationDirection.x;
    if (!SCNVector3EqualToVector3(orientationDirection, self->_orientationDirection))
    {
      self->_orientationDirection.float x = x;
      self->_orientationDirection.float y = y;
      self->_orientationDirection.float z = z;
      float v7 = [(SCNParticleSystem *)self sceneRef];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __45__SCNParticleSystem_setOrientationDirection___block_invoke;
      v9[3] = &unk_264005038;
      v9[4] = self;
      float v10 = x;
      float v11 = y;
      float v12 = z;
      +[SCNTransaction postCommandWithContext:v7 object:self key:@"orientationDirection" applyBlock:v9];
    }
  }
}

void __45__SCNParticleSystem_setOrientationDirection___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(void *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  C3DParticleSystemSetOrientationDirection(*(__n128 **)(*(void *)(a1 + 32) + 8), a2);
}

- (double)lightEmissionRadiusFactor
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_lightEmissionRadiusFactor;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetLightEmissionRadiusFactor((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double LightEmissionRadiusFactor = C3DParticleSystemGetLightEmissionRadiusFactor((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return LightEmissionRadiusFactor;
}

- (void)setLightEmissionRadiusFactor:(double)a3
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setLightEmissionRadiusFactor:]();
    }
  }
  else if (self->_lightEmissionRadiusFactor != a3)
  {
    self->_lightEmissionRadiusFactor = a3;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__SCNParticleSystem_setLightEmissionRadiusFactor___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"fixedTimeStep" applyBlock:v7];
  }
}

float __50__SCNParticleSystem_setLightEmissionRadiusFactor___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetLightEmissionRadiusFactor(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (SCNVector3)acceleration
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    uint64_t v6 = (uint64_t)v5;
    if (v5) {
      C3DSceneLock((uint64_t)v5);
    }
    __n128 Acceleration = C3DParticleSystemGetAcceleration((__n128 *)self->_particleSystem);
    int8x8_t v4 = vext_s8((int8x8_t)Acceleration.n128_u64[0], (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)Acceleration, (int8x16_t)Acceleration, 8uLL), 4uLL);
    if (v6)
    {
      int8x8_t v8 = v4;
      unsigned __int32 v9 = Acceleration.n128_u32[0];
      C3DSceneUnlock(v6);
      int8x8_t v4 = v8;
      Acceleration.n128_u32[0] = v9;
    }
  }
  else
  {
    Acceleration.n128_u32[0] = LODWORD(self->_acceleration.x);
    int8x8_t v4 = *(int8x8_t *)&self->_acceleration.y;
  }
  float v7 = *(float *)&v4.i32[1];
  result.float x = Acceleration.n128_f32[0];
  result.float y = *(float *)v4.i32;
  result.float z = v7;
  return result;
}

- (BOOL)affectedByGravity
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_affectedByGravity;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    AffectedByGravitfloat y = C3DParticleSystemGetAffectedByGravity((uint64_t)self->_particleSystem);
    C3DSceneUnlock(v5);
    return AffectedByGravity;
  }
  else
  {
    particleSystem = self->_particleSystem;
    return C3DParticleSystemGetAffectedByGravity((uint64_t)particleSystem);
  }
}

- (void)setAffectedByGravity:(BOOL)affectedByGravity
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setAffectedByGravity:]();
    }
  }
  else if (self->_affectedByGravity != affectedByGravity)
  {
    self->_affectedByGravitfloat y = affectedByGravity;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __42__SCNParticleSystem_setAffectedByGravity___block_invoke;
    v7[3] = &unk_264004FE8;
    v7[4] = self;
    BOOL v8 = affectedByGravity;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"affectedByGravity" applyBlock:v7];
  }
}

void __42__SCNParticleSystem_setAffectedByGravity___block_invoke(uint64_t a1)
{
}

- (BOOL)affectedByPhysicsFields
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_affectedByPhysicsFields;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    char AffectedByPhysicsFields = C3DParticleSystemGetAffectedByPhysicsFields((uint64_t)self->_particleSystem);
    C3DSceneUnlock(v5);
    return AffectedByPhysicsFields;
  }
  else
  {
    particleSystem = self->_particleSystem;
    return C3DParticleSystemGetAffectedByPhysicsFields((uint64_t)particleSystem);
  }
}

- (void)setAffectedByPhysicsFields:(BOOL)affectedByPhysicsFields
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setAffectedByPhysicsFields:]();
    }
  }
  else if (self->_affectedByPhysicsFields != affectedByPhysicsFields)
  {
    self->_affectedByPhysicsFields = affectedByPhysicsFields;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__SCNParticleSystem_setAffectedByPhysicsFields___block_invoke;
    v7[3] = &unk_264004FE8;
    v7[4] = self;
    BOOL v8 = affectedByPhysicsFields;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __48__SCNParticleSystem_setAffectedByPhysicsFields___block_invoke(uint64_t a1)
{
}

- (SCNParticleBirthDirection)birthDirection
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_birthDirection;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return (unint64_t)C3DParticleSystemGetBirthDirection((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  SCNParticleBirthDirection BirthDirection = (unint64_t)C3DParticleSystemGetBirthDirection((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return BirthDirection;
}

- (void)setBirthDirection:(SCNParticleBirthDirection)birthDirection
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setBirthDirection:]();
    }
  }
  else if (self->_birthDirection != birthDirection)
  {
    self->_birthDirection = birthDirection;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __39__SCNParticleSystem_setBirthDirection___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = birthDirection;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __39__SCNParticleSystem_setBirthDirection___block_invoke(uint64_t a1)
{
}

- (SCNParticleBirthLocation)birthLocation
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_birthLocation;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return (unint64_t)C3DParticleSystemGetBirthLocation((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  SCNParticleBirthLocation BirthLocation = (unint64_t)C3DParticleSystemGetBirthLocation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return BirthLocation;
}

- (void)setBirthLocation:(SCNParticleBirthLocation)birthLocation
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setBirthLocation:]();
    }
  }
  else if (self->_birthLocation != birthLocation)
  {
    self->_birthLocation = birthLocation;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__SCNParticleSystem_setBirthLocation___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = birthLocation;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __38__SCNParticleSystem_setBirthLocation___block_invoke(uint64_t a1)
{
}

- (CGFloat)birthRate
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_birthRate;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetBirthRate((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double BirthRate = C3DParticleSystemGetBirthRate((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return BirthRate;
}

- (void)setBirthRate:(CGFloat)birthRate
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setBirthRate:]();
    }
  }
  else if (self->_birthRate != birthRate)
  {
    self->_birthRate = birthRate;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__SCNParticleSystem_setBirthRate___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = birthRate;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"birthRate" applyBlock:v7];
  }
}

float __34__SCNParticleSystem_setBirthRate___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetBirthRate(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)birthRateVariation
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_birthRateVariation;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetBirthRateVariation((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double BirthRateVariation = C3DParticleSystemGetBirthRateVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return BirthRateVariation;
}

- (void)setBirthRateVariation:(CGFloat)birthRateVariation
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setBirthRateVariation:]();
    }
  }
  else if (self->_birthRateVariation != birthRateVariation)
  {
    self->_birthRateVariation = birthRateVariation;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __43__SCNParticleSystem_setBirthRateVariation___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = birthRateVariation;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"birthRateVariation" applyBlock:v7];
  }
}

float __43__SCNParticleSystem_setBirthRateVariation___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetBirthRateVariation(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (BOOL)blackPassEnabled
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_blackPassEnabled;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    char BlackPassEnabled = C3DParticleSystemGetBlackPassEnabled((uint64_t)self->_particleSystem);
    C3DSceneUnlock(v5);
    return BlackPassEnabled;
  }
  else
  {
    particleSystem = self->_particleSystem;
    return C3DParticleSystemGetBlackPassEnabled((uint64_t)particleSystem);
  }
}

- (void)setBlackPassEnabled:(BOOL)blackPassEnabled
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setBlackPassEnabled:]();
    }
  }
  else if (self->_blackPassEnabled != blackPassEnabled)
  {
    self->_blackPassEnabled = blackPassEnabled;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__SCNParticleSystem_setBlackPassEnabled___block_invoke;
    v7[3] = &unk_264004FE8;
    v7[4] = self;
    BOOL v8 = blackPassEnabled;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __41__SCNParticleSystem_setBlackPassEnabled___block_invoke(uint64_t a1)
{
}

- (SCNParticleBlendMode)blendMode
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_blendMode;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return (unint64_t)C3DParticleSystemGetBlendMode((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  SCNParticleBlendMode BlendMode = (unint64_t)C3DParticleSystemGetBlendMode((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return BlendMode;
}

- (void)setBlendMode:(SCNParticleBlendMode)blendMode
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setBlendMode:]();
    }
  }
  else if (self->_blendMode != blendMode)
  {
    self->_blendMode = blendMode;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__SCNParticleSystem_setBlendMode___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = blendMode;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __34__SCNParticleSystem_setBlendMode___block_invoke(uint64_t a1)
{
}

- (CGFloat)dampingFactor
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_dampingFactor;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetDampingFactor((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double DampingFactor = C3DParticleSystemGetDampingFactor((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return DampingFactor;
}

- (void)setDampingFactor:(CGFloat)dampingFactor
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setDampingFactor:]();
    }
  }
  else if (self->_dampingFactor != dampingFactor)
  {
    self->_dampingFactor = dampingFactor;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__SCNParticleSystem_setDampingFactor___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = dampingFactor;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"dampingFactor" applyBlock:v7];
  }
}

float __38__SCNParticleSystem_setDampingFactor___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetDampingFactor(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)emissionDuration
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_emissionDuration;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetEmissionDuration((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double EmissionDuration = C3DParticleSystemGetEmissionDuration((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return EmissionDuration;
}

- (void)setEmissionDuration:(CGFloat)emissionDuration
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setEmissionDuration:]();
    }
  }
  else if (self->_emissionDuration != emissionDuration)
  {
    self->_emissionDuration = emissionDuration;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__SCNParticleSystem_setEmissionDuration___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = emissionDuration;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"emissionDuration" applyBlock:v7];
  }
}

float __41__SCNParticleSystem_setEmissionDuration___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetEmissionDuration(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)emissionDurationVariation
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_emissionDurationVariation;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetEmissionDurationVariation((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double EmissionDurationVariation = C3DParticleSystemGetEmissionDurationVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return EmissionDurationVariation;
}

- (void)setEmissionDurationVariation:(CGFloat)emissionDurationVariation
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setEmissionDurationVariation:]();
    }
  }
  else if (self->_emissionDurationVariation != emissionDurationVariation)
  {
    self->_emissionDurationVariation = emissionDurationVariation;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__SCNParticleSystem_setEmissionDurationVariation___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = emissionDurationVariation;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"emissionDurationVariation" applyBlock:v7];
  }
}

float __50__SCNParticleSystem_setEmissionDurationVariation___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetEmissionDurationVariation(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (SCNGeometry)emitterShape
{
  if (*((unsigned char *)self + 16))
  {
    int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    uint64_t EmitterShape = C3DParticleSystemGetEmitterShape((uint64_t)self->_particleSystem);
    if (EmitterShape)
    {
      uint64_t v3 = +[SCNGeometry geometryWithGeometryRef:EmitterShape];
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
  return self->_emitterShape;
}

- (void)setEmitterShape:(SCNGeometry *)emitterShape
{
  if (*((unsigned char *)self + 16))
  {
    float v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setEmitterShape:]();
    }
  }
  else
  {
    uint64_t v5 = self->_emitterShape;
    if (v5 != emitterShape)
    {

      self->_emitterShape = emitterShape;
      uint64_t v6 = [(SCNParticleSystem *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __37__SCNParticleSystem_setEmitterShape___block_invoke;
      v8[3] = &unk_264006160;
      v8[4] = self;
      v8[5] = emitterShape;
      +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v8];
    }
  }
}

CFTypeRef __37__SCNParticleSystem_setEmitterShape___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = (const void *)objc_msgSend(*(id *)(a1 + 40), "__CFObject");

  return C3DParticleSystemSetEmitterShape(v1, v2);
}

- (SCNVector3)emittingDirection
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    uint64_t v6 = (uint64_t)v5;
    if (v5) {
      C3DSceneLock((uint64_t)v5);
    }
    __n128 EmittingDirection = C3DParticleSystemGetEmittingDirection((__n128 *)self->_particleSystem);
    int8x8_t v4 = vext_s8((int8x8_t)EmittingDirection.n128_u64[0], (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)EmittingDirection, (int8x16_t)EmittingDirection, 8uLL), 4uLL);
    if (v6)
    {
      int8x8_t v8 = v4;
      unsigned __int32 v9 = EmittingDirection.n128_u32[0];
      C3DSceneUnlock(v6);
      int8x8_t v4 = v8;
      EmittingDirection.n128_u32[0] = v9;
    }
  }
  else
  {
    EmittingDirection.n128_u32[0] = LODWORD(self->_emittingDirection.x);
    int8x8_t v4 = *(int8x8_t *)&self->_emittingDirection.y;
  }
  float v7 = *(float *)&v4.i32[1];
  result.float x = EmittingDirection.n128_f32[0];
  result.float y = *(float *)v4.i32;
  result.float z = v7;
  return result;
}

- (double)fixedTimeStep
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_fixedTimeStep;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetFixedTimeStep((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double FixedTimeStep = C3DParticleSystemGetFixedTimeStep((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return FixedTimeStep;
}

- (void)setFixedTimeStep:(double)a3
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setFixedTimeStep:]();
    }
  }
  else if (self->_fixedTimeStep != a3)
  {
    self->_fixedTimeStep = a3;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__SCNParticleSystem_setFixedTimeStep___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(double *)&void v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"fixedTimeStep" applyBlock:v7];
  }
}

float __38__SCNParticleSystem_setFixedTimeStep___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetFixedTimeStep(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)fresnelExponent
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_fresnelExponent;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetFresnelExponent((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double FresnelExponent = C3DParticleSystemGetFresnelExponent((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return FresnelExponent;
}

- (void)setFresnelExponent:(CGFloat)fresnelExponent
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setFresnelExponent:]();
    }
  }
  else if (self->_fresnelExponent != fresnelExponent)
  {
    self->_fresnelExponent = fresnelExponent;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__SCNParticleSystem_setFresnelExponent___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = fresnelExponent;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"fresnelExponent" applyBlock:v7];
  }
}

float __40__SCNParticleSystem_setFresnelExponent___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetFresnelExponent(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)idleDuration
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_idleDuration;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetIdleDuration((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double IdleDuration = C3DParticleSystemGetIdleDuration((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return IdleDuration;
}

- (void)setIdleDuration:(CGFloat)idleDuration
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setIdleDuration:]();
    }
  }
  else if (self->_idleDuration != idleDuration)
  {
    self->_idleDuration = idleDuration;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__SCNParticleSystem_setIdleDuration___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = idleDuration;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"idleDuration" applyBlock:v7];
  }
}

float __37__SCNParticleSystem_setIdleDuration___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetIdleDuration(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)idleDurationVariation
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_idleDurationVariation;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetIdleDurationVariation((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double IdleDurationVariation = C3DParticleSystemGetIdleDurationVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return IdleDurationVariation;
}

- (void)setIdleDurationVariation:(CGFloat)idleDurationVariation
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setIdleDurationVariation:]();
    }
  }
  else if (self->_idleDurationVariation != idleDurationVariation)
  {
    self->_idleDurationVariation = idleDurationVariation;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __46__SCNParticleSystem_setIdleDurationVariation___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = idleDurationVariation;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"idleDurationVariation" applyBlock:v7];
  }
}

float __46__SCNParticleSystem_setIdleDurationVariation___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetIdleDurationVariation(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (SCNParticleImageSequenceAnimationMode)imageSequenceAnimationMode
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_imageSequenceAnimationMode;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return (unint64_t)C3DParticleSystemGetImageSequenceAnimationMode((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  SCNParticleImageSequenceAnimationMode ImageSequenceAnimationMode = (unint64_t)C3DParticleSystemGetImageSequenceAnimationMode((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ImageSequenceAnimationMode;
}

- (void)setImageSequenceAnimationMode:(SCNParticleImageSequenceAnimationMode)imageSequenceAnimationMode
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setImageSequenceAnimationMode:]();
    }
  }
  else if (self->_imageSequenceAnimationMode != imageSequenceAnimationMode)
  {
    self->_imageSequenceAnimationMode = imageSequenceAnimationMode;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__SCNParticleSystem_setImageSequenceAnimationMode___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = imageSequenceAnimationMode;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __51__SCNParticleSystem_setImageSequenceAnimationMode___block_invoke(uint64_t a1)
{
}

- (NSUInteger)imageSequenceColumnCount
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_imageSequenceColumnCount;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetImageSequenceColumnCount((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  NSUInteger ImageSequenceColumnCount = C3DParticleSystemGetImageSequenceColumnCount((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ImageSequenceColumnCount;
}

- (void)setImageSequenceColumnCount:(NSUInteger)imageSequenceColumnCount
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setImageSequenceColumnCount:]();
    }
  }
  else if (self->_imageSequenceColumnCount != imageSequenceColumnCount)
  {
    self->_imageSequenceColumnCount = imageSequenceColumnCount;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __49__SCNParticleSystem_setImageSequenceColumnCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = imageSequenceColumnCount;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"imageSequenceColumnCount" applyBlock:v7];
  }
}

void __49__SCNParticleSystem_setImageSequenceColumnCount___block_invoke(uint64_t a1)
{
}

- (CGFloat)imageSequenceFrameRate
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_imageSequenceFrameRate;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetImageSequenceFrameRate((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ImageSequenceFrameRate = C3DParticleSystemGetImageSequenceFrameRate((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ImageSequenceFrameRate;
}

- (void)setImageSequenceFrameRate:(CGFloat)imageSequenceFrameRate
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setImageSequenceFrameRate:]();
    }
  }
  else if (self->_imageSequenceFrameRate != imageSequenceFrameRate)
  {
    self->_imageSequenceFrameRate = imageSequenceFrameRate;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__SCNParticleSystem_setImageSequenceFrameRate___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = imageSequenceFrameRate;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"imageSequenceFrameRate" applyBlock:v7];
  }
}

float __47__SCNParticleSystem_setImageSequenceFrameRate___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetImageSequenceFrameRate(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)imageSequenceFrameRateVariation
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_imageSequenceFrameRateVariation;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetImageSequenceFrameRateVariation((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ImageSequenceFrameRateVariation = C3DParticleSystemGetImageSequenceFrameRateVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ImageSequenceFrameRateVariation;
}

- (void)setImageSequenceFrameRateVariation:(CGFloat)imageSequenceFrameRateVariation
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setImageSequenceFrameRateVariation:]();
    }
  }
  else if (self->_imageSequenceFrameRateVariation != imageSequenceFrameRateVariation)
  {
    self->_imageSequenceFrameRateVariation = imageSequenceFrameRateVariation;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __56__SCNParticleSystem_setImageSequenceFrameRateVariation___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = imageSequenceFrameRateVariation;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"imageSequenceFrameRateVariation" applyBlock:v7];
  }
}

float __56__SCNParticleSystem_setImageSequenceFrameRateVariation___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetImageSequenceFrameRateVariation(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)imageSequenceInitialFrame
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_imageSequenceInitialFrame;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetImageSequenceInitialFrame((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ImageSequenceInitialFrame = C3DParticleSystemGetImageSequenceInitialFrame((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ImageSequenceInitialFrame;
}

- (void)setImageSequenceInitialFrame:(CGFloat)imageSequenceInitialFrame
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setImageSequenceInitialFrame:]();
    }
  }
  else if (self->_imageSequenceInitialFrame != imageSequenceInitialFrame)
  {
    self->_imageSequenceInitialFrame = imageSequenceInitialFrame;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__SCNParticleSystem_setImageSequenceInitialFrame___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = imageSequenceInitialFrame;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"imageSequenceInitialFrame" applyBlock:v7];
  }
}

float __50__SCNParticleSystem_setImageSequenceInitialFrame___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetImageSequenceInitialFrame(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)imageSequenceInitialFrameVariation
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_imageSequenceInitialFrameVariation;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetImageSequenceInitialFrameVariation((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ImageSequenceInitialFrameVariation = C3DParticleSystemGetImageSequenceInitialFrameVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ImageSequenceInitialFrameVariation;
}

- (void)setImageSequenceInitialFrameVariation:(CGFloat)imageSequenceInitialFrameVariation
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setImageSequenceInitialFrameVariation:]();
    }
  }
  else if (self->_imageSequenceInitialFrameVariation != imageSequenceInitialFrameVariation)
  {
    self->_imageSequenceInitialFrameVariation = imageSequenceInitialFrameVariation;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__SCNParticleSystem_setImageSequenceInitialFrameVariation___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = imageSequenceInitialFrameVariation;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"imageSequenceInitialFrameVariation" applyBlock:v7];
  }
}

float __59__SCNParticleSystem_setImageSequenceInitialFrameVariation___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetImageSequenceInitialFrameVariation(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (NSUInteger)imageSequenceRowCount
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_imageSequenceRowCount;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetImageSequenceRowCount((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  NSUInteger ImageSequenceRowCount = C3DParticleSystemGetImageSequenceRowCount((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ImageSequenceRowCount;
}

- (void)setImageSequenceRowCount:(NSUInteger)imageSequenceRowCount
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setImageSequenceRowCount:]();
    }
  }
  else if (self->_imageSequenceRowCount != imageSequenceRowCount)
  {
    self->_imageSequenceRowCount = imageSequenceRowCount;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __46__SCNParticleSystem_setImageSequenceRowCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = imageSequenceRowCount;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"imageSequenceRowCount" applyBlock:v7];
  }
}

void __46__SCNParticleSystem_setImageSequenceRowCount___block_invoke(uint64_t a1)
{
}

- (BOOL)isLocal
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_isLocal;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    char IsLocal = C3DParticleSystemGetIsLocal((uint64_t)self->_particleSystem);
    C3DSceneUnlock(v5);
    return IsLocal;
  }
  else
  {
    particleSystem = self->_particleSystem;
    return C3DParticleSystemGetIsLocal((uint64_t)particleSystem);
  }
}

- (void)setIsLocal:(BOOL)a3
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setIsLocal:]();
    }
  }
  else if (self->_isLocal != a3)
  {
    self->_isLocal = a3;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __32__SCNParticleSystem_setIsLocal___block_invoke;
    v7[3] = &unk_264004FE8;
    v7[4] = self;
    BOOL v8 = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"isLocal" applyBlock:v7];
  }
}

void __32__SCNParticleSystem_setIsLocal___block_invoke(uint64_t a1)
{
}

- (BOOL)lightingEnabled
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_lightingEnabled;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    char LightingEnabled = C3DParticleSystemGetLightingEnabled((uint64_t)self->_particleSystem);
    C3DSceneUnlock(v5);
    return LightingEnabled;
  }
  else
  {
    particleSystem = self->_particleSystem;
    return C3DParticleSystemGetLightingEnabled((uint64_t)particleSystem);
  }
}

- (void)setLightingEnabled:(BOOL)lightingEnabled
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setLightingEnabled:]();
    }
  }
  else if (self->_lightingEnabled != lightingEnabled)
  {
    self->_lightingEnabled = lightingEnabled;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__SCNParticleSystem_setLightingEnabled___block_invoke;
    v7[3] = &unk_264004FE8;
    v7[4] = self;
    BOOL v8 = lightingEnabled;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __40__SCNParticleSystem_setLightingEnabled___block_invoke(uint64_t a1)
{
}

- (BOOL)loops
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_loops;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    char Loops = C3DParticleSystemGetLoops((uint64_t)self->_particleSystem);
    C3DSceneUnlock(v5);
    return Loops;
  }
  else
  {
    particleSystem = self->_particleSystem;
    return C3DParticleSystemGetLoops((uint64_t)particleSystem);
  }
}

- (void)setLoops:(BOOL)loops
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setLoops:]();
    }
  }
  else if (self->_loops != loops)
  {
    self->_loops = loops;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __30__SCNParticleSystem_setLoops___block_invoke;
    v7[3] = &unk_264004FE8;
    v7[4] = self;
    BOOL v8 = loops;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"loops" applyBlock:v7];
  }
}

void __30__SCNParticleSystem_setLoops___block_invoke(uint64_t a1)
{
}

- (SCNParticleOrientationMode)orientationMode
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_orientationMode;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return (unint64_t)C3DParticleSystemGetOrientationMode((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  SCNParticleOrientationMode OrientationMode = (unint64_t)C3DParticleSystemGetOrientationMode((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return OrientationMode;
}

- (void)setOrientationMode:(SCNParticleOrientationMode)orientationMode
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setOrientationMode:]();
    }
  }
  else if (self->_orientationMode != orientationMode)
  {
    self->_orientationMode = orientationMode;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__SCNParticleSystem_setOrientationMode___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = orientationMode;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __40__SCNParticleSystem_setOrientationMode___block_invoke(uint64_t a1)
{
}

- (CGFloat)particleAngle
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleAngle;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleAngle((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ParticleAngle = C3DParticleSystemGetParticleAngle((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleAngle;
}

- (void)setParticleAngle:(CGFloat)particleAngle
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleAngle:]();
    }
  }
  else if (self->_particleAngle != particleAngle)
  {
    self->_particleAngle = particleAngle;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__SCNParticleSystem_setParticleAngle___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleAngle;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleAngle" applyBlock:v7];
  }
}

float __38__SCNParticleSystem_setParticleAngle___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleAngle(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleAngleVariation
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleAngleVariation;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleAngleVariation((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ParticleAngleVariation = C3DParticleSystemGetParticleAngleVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleAngleVariation;
}

- (void)setParticleAngleVariation:(CGFloat)particleAngleVariation
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleAngleVariation:]();
    }
  }
  else if (self->_particleAngleVariation != particleAngleVariation)
  {
    self->_particleAngleVariation = particleAngleVariation;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__SCNParticleSystem_setParticleAngleVariation___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleAngleVariation;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleAngleVariation" applyBlock:v7];
  }
}

float __47__SCNParticleSystem_setParticleAngleVariation___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleAngleVariation(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleAngularVelocity
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleAngularVelocity;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleAngularVelocity((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleAngularVelocitfloat y = C3DParticleSystemGetParticleAngularVelocity((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleAngularVelocity;
}

- (void)setParticleAngularVelocity:(CGFloat)particleAngularVelocity
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleAngularVelocity:]();
    }
  }
  else if (self->_particleAngularVelocity != particleAngularVelocity)
  {
    self->_particleAngularVelocitfloat y = particleAngularVelocity;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__SCNParticleSystem_setParticleAngularVelocity___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleAngularVelocity;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleAngularVelocity" applyBlock:v7];
  }
}

float __48__SCNParticleSystem_setParticleAngularVelocity___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleAngularVelocity(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleAngularVelocityVariation
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleAngularVelocityVariation;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleAngularVelocityVariation((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ParticleAngularVelocityVariation = C3DParticleSystemGetParticleAngularVelocityVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleAngularVelocityVariation;
}

- (void)setParticleAngularVelocityVariation:(CGFloat)particleAngularVelocityVariation
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleAngularVelocityVariation:]();
    }
  }
  else if (self->_particleAngularVelocityVariation != particleAngularVelocityVariation)
  {
    self->_particleAngularVelocityVariation = particleAngularVelocityVariation;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__SCNParticleSystem_setParticleAngularVelocityVariation___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleAngularVelocityVariation;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleAngularVelocityVariation" applyBlock:v7];
  }
}

float __57__SCNParticleSystem_setParticleAngularVelocityVariation___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleAngularVelocityVariation(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleBounce
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleBounce;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleBounce((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ParticleBounce = C3DParticleSystemGetParticleBounce((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleBounce;
}

- (void)setParticleBounce:(CGFloat)particleBounce
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleBounce:]();
    }
  }
  else if (self->_particleBounce != particleBounce)
  {
    self->_particleBounce = particleBounce;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __39__SCNParticleSystem_setParticleBounce___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleBounce;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleBounce" applyBlock:v7];
  }
}

float __39__SCNParticleSystem_setParticleBounce___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleBounce(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleBounceVariation
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleBounceVariation;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleBounceVariation((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ParticleBounceVariation = C3DParticleSystemGetParticleBounceVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleBounceVariation;
}

- (void)setParticleBounceVariation:(CGFloat)particleBounceVariation
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleBounceVariation:]();
    }
  }
  else if (self->_particleBounceVariation != particleBounceVariation)
  {
    self->_particleBounceVariation = particleBounceVariation;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__SCNParticleSystem_setParticleBounceVariation___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleBounceVariation;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleBounceVariation" applyBlock:v7];
  }
}

float __48__SCNParticleSystem_setParticleBounceVariation___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleBounceVariation(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleCharge
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleCharge;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleCharge((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ParticleCharge = C3DParticleSystemGetParticleCharge((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleCharge;
}

- (void)setParticleCharge:(CGFloat)particleCharge
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleCharge:]();
    }
  }
  else if (self->_particleCharge != particleCharge)
  {
    self->_particleCharge = particleCharge;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __39__SCNParticleSystem_setParticleCharge___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleCharge;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleCharge" applyBlock:v7];
  }
}

float __39__SCNParticleSystem_setParticleCharge___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleCharge(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleChargeVariation
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleChargeVariation;
  }
  int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleChargeVariation((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ParticleChargeVariation = C3DParticleSystemGetParticleChargeVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleChargeVariation;
}

- (void)setParticleChargeVariation:(CGFloat)particleChargeVariation
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleChargeVariation:]();
    }
  }
  else if (self->_particleChargeVariation != particleChargeVariation)
  {
    self->_particleChargeVariation = particleChargeVariation;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__SCNParticleSystem_setParticleChargeVariation___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleChargeVariation;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleChargeVariation" applyBlock:v7];
  }
}

float __48__SCNParticleSystem_setParticleChargeVariation___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleChargeVariation(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (UIColor)particleColor
{
  if (*((unsigned char *)self + 16))
  {
    int8x8_t v4 = [(SCNParticleSystem *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    uint64_t ParticleColor = C3DParticleSystemGetParticleColor((uint64_t)self->_particleSystem);
    uint64_t v3 = (void *)C3DColor4ToRGBCFColor(ParticleColor);
    if (v5) {
      C3DSceneUnlock(v5);
    }
  }
  else
  {
    uint64_t v3 = self->_particleColor;
  }
  float v7 = (void *)[v3 copy];

  return (UIColor *)v7;
}

- (void)setParticleColor:(UIColor *)particleColor
{
  if (*((unsigned char *)self + 16))
  {
    float v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleColor:]();
    }
  }
  else
  {
    uint64_t v5 = self->_particleColor;
    if (v5 != particleColor)
    {

      self->_particleColor = (UIColor *)[(UIColor *)particleColor copy];
      uint64_t v6 = [(SCNParticleSystem *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __38__SCNParticleSystem_setParticleColor___block_invoke;
      v8[3] = &unk_264006160;
      v8[4] = particleColor;
      v8[5] = self;
      +[SCNTransaction postCommandWithContext:v6 object:self key:@"particleColor" applyBlock:v8];
    }
  }
}

double __38__SCNParticleSystem_setParticleColor___block_invoke(uint64_t a1)
{
  v4.n128_u64[0] = C3DColor4FromRGBCFColor(*(const void **)(a1 + 32), 0);
  v4.n128_u64[1] = v2;
  *(void *)&double result = C3DParticleSystemSetParticleColor((__n128 *)*(void *)(*(void *)(a1 + 40) + 8), &v4).n128_u64[0];
  return result;
}

- (SCNVector4)particleColorVariation
{
  if (*((unsigned char *)self + 16))
  {
    __n128 v4 = [(SCNParticleSystem *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    __n128 ParticleColorVariation = C3DParticleSystemGetParticleColorVariation((__n128 *)self->_particleSystem);
    if (v5)
    {
      __n128 v9 = ParticleColorVariation;
      C3DSceneUnlock(v5);
      __n128 ParticleColorVariation = v9;
    }
  }
  else
  {
    __n128 ParticleColorVariation = (__n128)self->_particleColorVariation;
  }
  float v6 = ParticleColorVariation.n128_f32[1];
  float v8 = ParticleColorVariation.n128_f32[3];
  float v7 = ParticleColorVariation.n128_f32[2];
  result.float x = ParticleColorVariation.n128_f32[0];
  result.w = v8;
  result.float z = v7;
  result.float y = v6;
  return result;
}

- (BOOL)particleDiesOnCollision
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleDiesOnCollision;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    char ParticleDiesOnCollision = C3DParticleSystemGetParticleDiesOnCollision((uint64_t)self->_particleSystem);
    C3DSceneUnlock(v5);
    return ParticleDiesOnCollision;
  }
  else
  {
    particleSystem = self->_particleSystem;
    return C3DParticleSystemGetParticleDiesOnCollision((uint64_t)particleSystem);
  }
}

- (void)setParticleDiesOnCollision:(BOOL)particleDiesOnCollision
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleDiesOnCollision:]();
    }
  }
  else if (self->_particleDiesOnCollision != particleDiesOnCollision)
  {
    self->_particleDiesOnCollision = particleDiesOnCollision;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__SCNParticleSystem_setParticleDiesOnCollision___block_invoke;
    v7[3] = &unk_264004FE8;
    v7[4] = self;
    BOOL v8 = particleDiesOnCollision;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __48__SCNParticleSystem_setParticleDiesOnCollision___block_invoke(uint64_t a1)
{
}

- (CGFloat)particleFriction
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleFriction;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleFriction((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ParticleFriction = C3DParticleSystemGetParticleFriction((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleFriction;
}

- (void)setParticleFriction:(CGFloat)particleFriction
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleFriction:]();
    }
  }
  else if (self->_particleFriction != particleFriction)
  {
    self->_particleFriction = particleFriction;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__SCNParticleSystem_setParticleFriction___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleFriction;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleFriction" applyBlock:v7];
  }
}

float __41__SCNParticleSystem_setParticleFriction___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleFriction(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleFrictionVariation
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleFrictionVariation;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleFrictionVariation((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ParticleFrictionVariation = C3DParticleSystemGetParticleFrictionVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleFrictionVariation;
}

- (void)setParticleFrictionVariation:(CGFloat)particleFrictionVariation
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleFrictionVariation:]();
    }
  }
  else if (self->_particleFrictionVariation != particleFrictionVariation)
  {
    self->_particleFrictionVariation = particleFrictionVariation;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__SCNParticleSystem_setParticleFrictionVariation___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleFrictionVariation;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleFrictionVariation" applyBlock:v7];
  }
}

float __50__SCNParticleSystem_setParticleFrictionVariation___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleFrictionVariation(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleLifeSpan
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleLifeSpan;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleLifeSpan((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ParticleLifeSpan = C3DParticleSystemGetParticleLifeSpan((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleLifeSpan;
}

- (void)setParticleLifeSpan:(CGFloat)particleLifeSpan
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleLifeSpan:]();
    }
  }
  else if (self->_particleLifeSpan != particleLifeSpan)
  {
    self->_particleLifeSpan = particleLifeSpan;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__SCNParticleSystem_setParticleLifeSpan___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleLifeSpan;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleLifeSpan" applyBlock:v7];
  }
}

float __41__SCNParticleSystem_setParticleLifeSpan___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleLifeSpan(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleLifeSpanVariation
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleLifeSpanVariation;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleLifeSpanVariation((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ParticleLifeSpanVariation = C3DParticleSystemGetParticleLifeSpanVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleLifeSpanVariation;
}

- (void)setParticleLifeSpanVariation:(CGFloat)particleLifeSpanVariation
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleLifeSpanVariation:]();
    }
  }
  else if (self->_particleLifeSpanVariation != particleLifeSpanVariation)
  {
    self->_particleLifeSpanVariation = particleLifeSpanVariation;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__SCNParticleSystem_setParticleLifeSpanVariation___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleLifeSpanVariation;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleLifeSpanVariation" applyBlock:v7];
  }
}

float __50__SCNParticleSystem_setParticleLifeSpanVariation___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleLifeSpanVariation(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleMass
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleMass;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleMass((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ParticleMass = C3DParticleSystemGetParticleMass((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleMass;
}

- (void)setParticleMass:(CGFloat)particleMass
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleMass:]();
    }
  }
  else if (self->_particleMass != particleMass)
  {
    self->_particleMass = particleMass;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__SCNParticleSystem_setParticleMass___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleMass;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleMass" applyBlock:v7];
  }
}

float __37__SCNParticleSystem_setParticleMass___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleMass(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleMassVariation
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleMassVariation;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleMassVariation((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ParticleMassVariation = C3DParticleSystemGetParticleMassVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleMassVariation;
}

- (void)setParticleMassVariation:(CGFloat)particleMassVariation
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleMassVariation:]();
    }
  }
  else if (self->_particleMassVariation != particleMassVariation)
  {
    self->_particleMassVariation = particleMassVariation;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __46__SCNParticleSystem_setParticleMassVariation___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleMassVariation;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleMassVariation" applyBlock:v7];
  }
}

float __46__SCNParticleSystem_setParticleMassVariation___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleMassVariation(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleSize
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleSize;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleSize((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ParticleSize = C3DParticleSystemGetParticleSize((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleSize;
}

- (void)setParticleSize:(CGFloat)particleSize
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleSize:]();
    }
  }
  else if (self->_particleSize != particleSize)
  {
    self->_particleSize = particleSize;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__SCNParticleSystem_setParticleSize___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleSize;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleSize" applyBlock:v7];
  }
}

float __37__SCNParticleSystem_setParticleSize___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleSize(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleSizeVariation
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleSizeVariation;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleSizeVariation((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ParticleSizeVariation = C3DParticleSystemGetParticleSizeVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleSizeVariation;
}

- (void)setParticleSizeVariation:(CGFloat)particleSizeVariation
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleSizeVariation:]();
    }
  }
  else if (self->_particleSizeVariation != particleSizeVariation)
  {
    self->_particleSizeVariation = particleSizeVariation;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __46__SCNParticleSystem_setParticleSizeVariation___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleSizeVariation;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleSizeVariation" applyBlock:v7];
  }
}

float __46__SCNParticleSystem_setParticleSizeVariation___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleSizeVariation(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleVelocity
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleVelocity;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleVelocity((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleVelocitfloat y = C3DParticleSystemGetParticleVelocity((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleVelocity;
}

- (void)setParticleVelocity:(CGFloat)particleVelocity
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleVelocity:]();
    }
  }
  else if (self->_particleVelocity != particleVelocity)
  {
    self->_particleVelocitfloat y = particleVelocity;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__SCNParticleSystem_setParticleVelocity___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleVelocity;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleVelocity" applyBlock:v7];
  }
}

float __41__SCNParticleSystem_setParticleVelocity___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleVelocity(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleVelocityVariation
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleVelocityVariation;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleVelocityVariation((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ParticleVelocityVariation = C3DParticleSystemGetParticleVelocityVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleVelocityVariation;
}

- (void)setParticleVelocityVariation:(CGFloat)particleVelocityVariation
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleVelocityVariation:]();
    }
  }
  else if (self->_particleVelocityVariation != particleVelocityVariation)
  {
    self->_particleVelocityVariation = particleVelocityVariation;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__SCNParticleSystem_setParticleVelocityVariation___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleVelocityVariation;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleVelocityVariation" applyBlock:v7];
  }
}

float __50__SCNParticleSystem_setParticleVelocityVariation___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleVelocityVariation(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (BOOL)physicsCollisionsEnabled
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_physicsCollisionsEnabled;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    char PhysicsCollisionsEnabled = C3DParticleSystemGetPhysicsCollisionsEnabled((uint64_t)self->_particleSystem);
    C3DSceneUnlock(v5);
    return PhysicsCollisionsEnabled;
  }
  else
  {
    particleSystem = self->_particleSystem;
    return C3DParticleSystemGetPhysicsCollisionsEnabled((uint64_t)particleSystem);
  }
}

- (void)setPhysicsCollisionsEnabled:(BOOL)a3
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setPhysicsCollisionsEnabled:]();
    }
  }
  else if (self->_physicsCollisionsEnabled != a3)
  {
    self->_physicsCollisionsEnabled = a3;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __49__SCNParticleSystem_setPhysicsCollisionsEnabled___block_invoke;
    v7[3] = &unk_264004FE8;
    v7[4] = self;
    BOOL v8 = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __49__SCNParticleSystem_setPhysicsCollisionsEnabled___block_invoke(uint64_t a1)
{
}

- (int64_t)renderingMode
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_renderingMode;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetRenderingMode((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  int64_t RenderingMode = C3DParticleSystemGetRenderingMode((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return RenderingMode;
}

- (void)setRenderingMode:(int64_t)a3
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setRenderingMode:]();
    }
  }
  else if (self->_renderingMode != a3)
  {
    self->_renderingMode = a3;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__SCNParticleSystem_setRenderingMode___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __38__SCNParticleSystem_setRenderingMode___block_invoke(uint64_t a1)
{
}

- (int64_t)seed
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_seed;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return (int)C3DParticleSystemGetSeed((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  int64_t Seed = (int)C3DParticleSystemGetSeed((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return Seed;
}

- (void)setSeed:(int64_t)a3
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setSeed:]();
    }
  }
  else if (self->_seed != a3)
  {
    self->_seed = a3;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __29__SCNParticleSystem_setSeed___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __29__SCNParticleSystem_setSeed___block_invoke(uint64_t a1)
{
}

- (BOOL)softParticlesEnabled
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_softParticlesEnabled;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    char SoftParticlesEnabled = C3DParticleSystemGetSoftParticlesEnabled((uint64_t)self->_particleSystem);
    C3DSceneUnlock(v5);
    return SoftParticlesEnabled;
  }
  else
  {
    particleSystem = self->_particleSystem;
    return C3DParticleSystemGetSoftParticlesEnabled((uint64_t)particleSystem);
  }
}

- (void)setSoftParticlesEnabled:(BOOL)a3
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setSoftParticlesEnabled:]();
    }
  }
  else if (self->_softParticlesEnabled != a3)
  {
    self->_softParticlesEnabled = a3;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__SCNParticleSystem_setSoftParticlesEnabled___block_invoke;
    v7[3] = &unk_264004FE8;
    v7[4] = self;
    BOOL v8 = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __45__SCNParticleSystem_setSoftParticlesEnabled___block_invoke(uint64_t a1)
{
}

- (SCNParticleSortingMode)sortingMode
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_sortingMode;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return (unint64_t)C3DParticleSystemGetSortingMode((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  SCNParticleSortingMode SortingMode = (unint64_t)C3DParticleSystemGetSortingMode((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return SortingMode;
}

- (void)setSortingMode:(SCNParticleSortingMode)sortingMode
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setSortingMode:]();
    }
  }
  else if (self->_sortingMode != sortingMode)
  {
    self->_sortingMode = sortingMode;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__SCNParticleSystem_setSortingMode___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = sortingMode;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __36__SCNParticleSystem_setSortingMode___block_invoke(uint64_t a1)
{
}

- (CGFloat)speedFactor
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_speedFactor;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetSpeedFactor((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double SpeedFactor = C3DParticleSystemGetSpeedFactor((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return SpeedFactor;
}

- (void)setSpeedFactor:(CGFloat)speedFactor
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setSpeedFactor:]();
    }
  }
  else if (self->_speedFactor != speedFactor)
  {
    self->_speedFactor = speedFactor;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__SCNParticleSystem_setSpeedFactor___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = speedFactor;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"speedFactor" applyBlock:v7];
  }
}

float __36__SCNParticleSystem_setSpeedFactor___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetSpeedFactor(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)spreadingAngle
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_spreadingAngle;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetSpreadingAngle((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double SpreadingAngle = C3DParticleSystemGetSpreadingAngle((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return SpreadingAngle;
}

- (void)setSpreadingAngle:(CGFloat)spreadingAngle
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setSpreadingAngle:]();
    }
  }
  else if (self->_spreadingAngle != spreadingAngle)
  {
    self->_spreadingAngle = spreadingAngle;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __39__SCNParticleSystem_setSpreadingAngle___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = spreadingAngle;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"spreadingAngle" applyBlock:v7];
  }
}

float __39__SCNParticleSystem_setSpreadingAngle___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetSpreadingAngle(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)stretchFactor
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_stretchFactor;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetStretchFactor((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double StretchFactor = C3DParticleSystemGetStretchFactor((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return StretchFactor;
}

- (void)setStretchFactor:(CGFloat)stretchFactor
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setStretchFactor:]();
    }
  }
  else if (self->_stretchFactor != stretchFactor)
  {
    self->_stretchFactor = stretchFactor;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__SCNParticleSystem_setStretchFactor___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = stretchFactor;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"stretchFactor" applyBlock:v7];
  }
}

float __38__SCNParticleSystem_setStretchFactor___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetStretchFactor(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (void)setSystemSpawnedOnCollision:(SCNParticleSystem *)systemSpawnedOnCollision
{
  if (*((unsigned char *)self + 16))
  {
    float v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setSystemSpawnedOnCollision:]();
    }
  }
  else
  {
    uint64_t v5 = self->_systemSpawnedOnCollision;
    if (v5 != systemSpawnedOnCollision)
    {

      self->_systemSpawnedOnCollision = systemSpawnedOnCollision;
      float v6 = [(SCNParticleSystem *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __49__SCNParticleSystem_setSystemSpawnedOnCollision___block_invoke;
      v8[3] = &unk_264006160;
      v8[4] = self;
      v8[5] = systemSpawnedOnCollision;
      +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v8];
    }
  }
}

CFTypeRef __49__SCNParticleSystem_setSystemSpawnedOnCollision___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v2 = (const void *)objc_msgSend(*(id *)(a1 + 40), "__CFObject");

  return C3DParticleSystemSetSystemSpawnedOnCollision(v1, v2);
}

- (void)setSystemSpawnedOnDying:(SCNParticleSystem *)systemSpawnedOnDying
{
  if (*((unsigned char *)self + 16))
  {
    float v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setSystemSpawnedOnDying:]();
    }
  }
  else
  {
    uint64_t v5 = self->_systemSpawnedOnDying;
    if (v5 != systemSpawnedOnDying)
    {

      self->_systemSpawnedOnDying = systemSpawnedOnDying;
      float v6 = [(SCNParticleSystem *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __45__SCNParticleSystem_setSystemSpawnedOnDying___block_invoke;
      v8[3] = &unk_264006160;
      v8[4] = self;
      v8[5] = systemSpawnedOnDying;
      +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v8];
    }
  }
}

CFTypeRef __45__SCNParticleSystem_setSystemSpawnedOnDying___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v2 = (const void *)objc_msgSend(*(id *)(a1 + 40), "__CFObject");

  return C3DParticleSystemSetSystemSpawnedOnDying(v1, v2);
}

- (void)setSystemSpawnedOnLiving:(SCNParticleSystem *)systemSpawnedOnLiving
{
  if (*((unsigned char *)self + 16))
  {
    float v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setSystemSpawnedOnLiving:]();
    }
  }
  else
  {
    uint64_t v5 = self->_systemSpawnedOnLiving;
    if (v5 != systemSpawnedOnLiving)
    {

      self->_systemSpawnedOnLiving = systemSpawnedOnLiving;
      float v6 = [(SCNParticleSystem *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __46__SCNParticleSystem_setSystemSpawnedOnLiving___block_invoke;
      v8[3] = &unk_264006160;
      v8[4] = self;
      v8[5] = systemSpawnedOnLiving;
      +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v8];
    }
  }
}

CFTypeRef __46__SCNParticleSystem_setSystemSpawnedOnLiving___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v2 = (const void *)objc_msgSend(*(id *)(a1 + 40), "__CFObject");

  return C3DParticleSystemSetSystemSpawnedOnLiving(v1, v2);
}

- (CGFloat)warmupDuration
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_warmupDuration;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetWarmupDuration((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double WarmupDuration = C3DParticleSystemGetWarmupDuration((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return WarmupDuration;
}

- (void)setWarmupDuration:(CGFloat)warmupDuration
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setWarmupDuration:]();
    }
  }
  else if (self->_warmupDuration != warmupDuration)
  {
    self->_warmupDuration = warmupDuration;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __39__SCNParticleSystem_setWarmupDuration___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = warmupDuration;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"warmupDuration" applyBlock:v7];
  }
}

float __39__SCNParticleSystem_setWarmupDuration___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetWarmupDuration(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (BOOL)writesToDepthBuffer
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_writesToDepthBuffer;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    char WritesToDepthBuffer = C3DParticleSystemGetWritesToDepthBuffer((uint64_t)self->_particleSystem);
    C3DSceneUnlock(v5);
    return WritesToDepthBuffer;
  }
  else
  {
    particleSystem = self->_particleSystem;
    return C3DParticleSystemGetWritesToDepthBuffer((uint64_t)particleSystem);
  }
}

- (void)setWritesToDepthBuffer:(BOOL)writesToDepthBuffer
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setWritesToDepthBuffer:]();
    }
  }
  else if (self->_writesToDepthBuffer != writesToDepthBuffer)
  {
    self->_writesToDepthBuffer = writesToDepthBuffer;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__SCNParticleSystem_setWritesToDepthBuffer___block_invoke;
    v7[3] = &unk_264004FE8;
    v7[4] = self;
    BOOL v8 = writesToDepthBuffer;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __44__SCNParticleSystem_setWritesToDepthBuffer___block_invoke(uint64_t a1)
{
}

- (SCNParticleSystem)systemSpawnedOnCollision
{
  return self->_systemSpawnedOnCollision;
}

- (SCNParticleSystem)systemSpawnedOnDying
{
  return self->_systemSpawnedOnDying;
}

- (SCNParticleSystem)systemSpawnedOnLiving
{
  return self->_systemSpawnedOnLiving;
}

- (CGFloat)particleIntensity
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleIntensity;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleIntensity((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleIntensitfloat y = C3DParticleSystemGetParticleIntensity((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleIntensity;
}

- (void)setParticleIntensity:(CGFloat)particleIntensity
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleIntensity:]();
    }
  }
  else if (self->_particleIntensity != particleIntensity)
  {
    self->_particleIntensitfloat y = particleIntensity;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __42__SCNParticleSystem_setParticleIntensity___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleIntensity;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleIntensity" applyBlock:v7];
  }
}

float __42__SCNParticleSystem_setParticleIntensity___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleIntensity(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleIntensityVariation
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_particleIntensityVariation;
  }
  __n128 v4 = [(SCNParticleSystem *)self sceneRef];
  if (!v4) {
    return C3DParticleSystemGetParticleIntensityVariation((uint64_t)self->_particleSystem);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ParticleIntensityVariation = C3DParticleSystemGetParticleIntensityVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleIntensityVariation;
}

- (void)setParticleIntensityVariation:(CGFloat)particleIntensityVariation
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleIntensityVariation:]();
    }
  }
  else if (self->_particleIntensityVariation != particleIntensityVariation)
  {
    self->_particleIntensityVariation = particleIntensityVariation;
    uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__SCNParticleSystem_setParticleIntensityVariation___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = particleIntensityVariation;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"particleIntensityVariation" applyBlock:v7];
  }
}

float __51__SCNParticleSystem_setParticleIntensityVariation___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleIntensityVariation(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (void)setParticleColorVariation:(SCNVector4)particleColorVariation
{
  if (*((unsigned char *)self + 16))
  {
    __n128 v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setParticleColorVariation:]();
    }
  }
  else
  {
    float w = particleColorVariation.w;
    float z = particleColorVariation.z;
    float y = particleColorVariation.y;
    float x = particleColorVariation.x;
    if (!SCNVector4EqualToVector4(particleColorVariation, self->_particleColorVariation))
    {
      self->_particleColorVariation.float x = x;
      self->_particleColorVariation.float y = y;
      self->_particleColorVariation.float z = z;
      self->_particleColorVariation.float w = w;
      BOOL v8 = [(SCNParticleSystem *)self sceneRef];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __47__SCNParticleSystem_setParticleColorVariation___block_invoke;
      v10[3] = &unk_264007A28;
      v10[4] = self;
      float v11 = x;
      float v12 = y;
      float v13 = z;
      float v14 = w;
      +[SCNTransaction postCommandWithContext:v8 object:self key:@"particleColorVariation" applyBlock:v10];
    }
  }
}

void __47__SCNParticleSystem_setParticleColorVariation___block_invoke(uint64_t a1)
{
}

- (void)setEmittingDirection:(SCNVector3)emittingDirection
{
  if (*((unsigned char *)self + 16))
  {
    BOOL v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setEmittingDirection:]();
    }
  }
  else
  {
    float z = emittingDirection.z;
    float y = emittingDirection.y;
    float x = emittingDirection.x;
    if (!SCNVector3EqualToVector3(emittingDirection, self->_emittingDirection))
    {
      self->_emittingDirection.float x = x;
      self->_emittingDirection.float y = y;
      self->_emittingDirection.float z = z;
      float v7 = [(SCNParticleSystem *)self sceneRef];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __42__SCNParticleSystem_setEmittingDirection___block_invoke;
      v9[3] = &unk_264005038;
      v9[4] = self;
      float v10 = x;
      float v11 = y;
      float v12 = z;
      +[SCNTransaction postCommandWithContext:v7 object:self key:@"emittingDirection" applyBlock:v9];
    }
  }
}

void __42__SCNParticleSystem_setEmittingDirection___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(void *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  C3DParticleSystemSetEmittingDirection(*(__n128 **)(*(void *)(a1 + 32) + 8), a2);
}

- (void)setAcceleration:(SCNVector3)acceleration
{
  if (*((unsigned char *)self + 16))
  {
    BOOL v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNParticleSystem setAcceleration:]();
    }
  }
  else
  {
    float z = acceleration.z;
    float y = acceleration.y;
    float x = acceleration.x;
    if (!SCNVector3EqualToVector3(acceleration, self->_acceleration))
    {
      self->_acceleration.float x = x;
      self->_acceleration.float y = y;
      self->_acceleration.float z = z;
      float v7 = [(SCNParticleSystem *)self sceneRef];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __37__SCNParticleSystem_setAcceleration___block_invoke;
      v9[3] = &unk_264005038;
      v9[4] = self;
      float v10 = x;
      float v11 = y;
      float v12 = z;
      +[SCNTransaction postCommandWithContext:v7 object:self key:@"acceleration" applyBlock:v9];
    }
  }
}

void __37__SCNParticleSystem_setAcceleration___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(void *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  C3DParticleSystemSetAcceleration(*(__n128 **)(*(void *)(a1 + 32) + 8), a2);
}

- (void)reset
{
  uint64_t v3 = [(SCNParticleSystem *)self sceneRef];
  if (v3) {
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", MEMORY[0x263EF8330], 3221225472, __26__SCNParticleSystem_reset__block_invoke, &unk_264004FC0, self, v3);
  }
}

void __26__SCNParticleSystem_reset__block_invoke(uint64_t a1)
{
  ParticleManager = C3DSceneGetParticleManager(*(void *)(a1 + 40), 0);
  if (ParticleManager)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    C3DParticleManagerResetAllInstanceOfSystem((uint64_t)ParticleManager, v3);
  }
}

- (void)handleEvent:(SCNParticleEvent)event forProperties:(NSArray *)properties withBlock:(SCNParticleEventBlock)block
{
  __n128 v9 = [(SCNParticleSystem *)self sceneRef];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__SCNParticleSystem_handleEvent_forProperties_withBlock___block_invoke;
  v10[3] = &unk_264008680;
  v10[6] = block;
  void v10[7] = event;
  v10[4] = self;
  void v10[5] = properties;
  +[SCNTransaction postCommandWithContext:v9 object:self applyBlock:v10];
}

void __57__SCNParticleSystem_handleEvent_forProperties_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  unsigned int v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 48);
  __n128 v4 = (const void *)[*(id *)(a1 + 40) copy];

  C3DParticleSystemSetEventBlock(v1, v2, v3, v4);
}

- (void)addModifierForProperties:(NSArray *)properties atStage:(SCNParticleModifierStage)stage withBlock:(SCNParticleModifierBlock)block
{
  __n128 v9 = [(SCNParticleSystem *)self sceneRef];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__SCNParticleSystem_addModifierForProperties_atStage_withBlock___block_invoke;
  v10[3] = &unk_2640086A8;
  v10[6] = block;
  void v10[7] = stage;
  v10[4] = properties;
  void v10[5] = self;
  +[SCNTransaction postCommandWithContext:v9 object:self applyBlock:v10];
}

void __64__SCNParticleSystem_addModifierForProperties_atStage_withBlock___block_invoke(uint64_t a1)
{
  unsigned int v2 = (void *)C3DParticleModifierCreate();
  C3DParticleModifierSetStage((uint64_t)v2, *(unsigned char *)(a1 + 56));
  C3DParticleModifierSetBlock((uint64_t)v2, *(void **)(a1 + 48));
  C3DParticleModifierSetProperties((uint64_t)v2, (id)[*(id *)(a1 + 32) copy]);
  C3DParticleSystemAddModifier(*(void *)(*(void *)(a1 + 40) + 8), v2);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (void)removeModifiersOfStage:(SCNParticleModifierStage)stage
{
  uint64_t v5 = [(SCNParticleSystem *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SCNParticleSystem_removeModifiersOfStage___block_invoke;
  v6[3] = &unk_264004FC0;
  v6[4] = self;
  void v6[5] = stage;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __44__SCNParticleSystem_removeModifiersOfStage___block_invoke(uint64_t a1)
{
}

- (void)removeAllModifiers
{
  uint64_t v3 = [(SCNParticleSystem *)self sceneRef];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__SCNParticleSystem_removeAllModifiers__block_invoke;
  v4[3] = &unk_264005010;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:v3 object:self applyBlock:v4];
}

void __39__SCNParticleSystem_removeAllModifiers__block_invoke(uint64_t a1)
{
}

- (void)setReferenceName:(id)a3
{
  referenceName = self->_referenceName;
  if (referenceName != a3)
  {

    self->_referenceName = (NSString *)a3;
  }
}

- (id)referenceName
{
  return self->_referenceName;
}

- (BOOL)_isAReference
{
  return [(SCNParticleSystem *)self referenceName] != 0;
}

- (void)_customEncodingOfSCNParticleSystem:(id)a3
{
  [a3 encodeBool:self->_loops forKey:@"loops"];
  particleColor = self->_particleColor;
  if (particleColor) {
    SCNEncodeUnsafeObjectForKey(a3, (uint64_t)particleColor, @"particleColor");
  }
  id particleImage = self->_particleImage;
  if (particleImage)
  {
    SCNEncodeImageContents(a3, @"particleImage", particleImage);
  }
}

- (void)_customDecodingOfSCNParticleSystem:(id)a3
{
  if ([a3 containsValueForKey:@"loops"]) {
    -[SCNParticleSystem setLoops:](self, "setLoops:", [a3 decodeBoolForKey:@"loops"]);
  }
  [(SCNParticleSystem *)self setParticleColor:SCNDecodeUnsecureColor(a3, @"particleColor")];
  id v5 = SCNDecodeImageContents(a3, @"particleImage");
  if (v5)
  {
    float v6 = v5;
    id v7 = SCNEnclosingURLForSceneDecoder(a3);
    if (v7 && (uint64_t v8 = SCNResolveImageContents(v6, v7)) != 0)
    {
      [(SCNParticleSystem *)self _updateParticleC3DImage:v8];

      self->_id particleImage = v6;
    }
    else
    {
      [(SCNParticleSystem *)self setParticleImage:v6];
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  if (*((unsigned char *)self + 16)) {
    [(SCNParticleSystem *)self _syncObjCModel];
  }
  if ([(SCNParticleSystem *)self _isAReference])
  {
    id v5 = [(SCNParticleSystem *)self referenceName];
    [a3 encodeObject:v5 forKey:@"referenceName"];
  }
  else
  {
    [(SCNParticleSystem *)self _customEncodingOfSCNParticleSystem:a3];
    name = self->_name;
    if (name) {
      [a3 encodeObject:name forKey:@"name"];
    }
    [a3 encodeDouble:@"emissionDuration" forKey:self->_emissionDuration];
    [a3 encodeDouble:@"emissionDurationVariation" forKey:self->_emissionDurationVariation];
    [a3 encodeDouble:@"idleDuration" forKey:self->_idleDuration];
    [a3 encodeDouble:@"idleDurationVariation" forKey:self->_idleDurationVariation];
    [a3 encodeDouble:@"birthRate" forKey:self->_birthRate];
    [a3 encodeDouble:@"birthRateVariation" forKey:self->_birthRateVariation];
    [a3 encodeDouble:@"warmupDuration" forKey:self->_warmupDuration];
    emitterShape = self->_emitterShape;
    if (emitterShape) {
      [a3 encodeObject:emitterShape forKey:@"emitterShape"];
    }
    [a3 encodeInteger:self->_birthLocation forKey:@"birthLocation"];
    [a3 encodeInteger:self->_birthDirection forKey:@"birthDirection"];
    SCNEncodeVector3(a3, @"emittingDirection", self->_emittingDirection.x, self->_emittingDirection.y, self->_emittingDirection.z);
    SCNEncodeVector3(a3, @"orientationDirection", self->_orientationDirection.x, self->_orientationDirection.y, self->_orientationDirection.z);
    SCNEncodeVector3(a3, @"acceleration", self->_acceleration.x, self->_acceleration.y, self->_acceleration.z);
    [a3 encodeDouble:@"spreadingAngle" forKey:self->_spreadingAngle];
    [a3 encodeBool:self->_isLocal forKey:@"isLocal"];
    [a3 encodeBool:self->_affectedByGravity forKey:@"affectedByGravity"];
    [a3 encodeBool:self->_affectedByPhysicsFields forKey:@"affectedByPhysicsFields"];
    [a3 encodeBool:self->_physicsCollisionsEnabled forKey:@"physicsCollisionsEnabled"];
    [a3 encodeBool:self->_lightingEnabled forKey:@"lightingEnabled"];
    [a3 encodeBool:self->_softParticlesEnabled forKey:@"softParticlesEnabled"];
    [a3 encodeBool:self->_particleDiesOnCollision forKey:@"particleDiesOnCollision"];
    [a3 encodeBool:self->_blackPassEnabled forKey:@"blackPassEnabled"];
    [a3 encodeBool:self->_writesToDepthBuffer forKey:@"writesToDepthBuffer"];
    [a3 encodeDouble:@"particleAngle" forKey:self->_particleAngle];
    [a3 encodeDouble:@"particleAngleVariation" forKey:self->_particleAngleVariation];
    [a3 encodeDouble:@"particleVelocity" forKey:self->_particleVelocity];
    [a3 encodeDouble:@"particleVelocityVariation" forKey:self->_particleVelocityVariation];
    [a3 encodeDouble:@"particleAngularVelocity" forKey:self->_particleAngularVelocity];
    [a3 encodeDouble:@"particleAngularVelocityVariation" forKey:self->_particleAngularVelocityVariation];
    [a3 encodeDouble:@"particleLifeSpan" forKey:self->_particleLifeSpan];
    [a3 encodeDouble:@"particleLifeSpanVariation" forKey:self->_particleLifeSpanVariation];
    [a3 encodeDouble:@"particleBounce" forKey:self->_particleBounce];
    [a3 encodeDouble:@"particleBounceVariation" forKey:self->_particleBounceVariation];
    [a3 encodeDouble:@"particleFriction" forKey:self->_particleFriction];
    [a3 encodeDouble:@"particleFrictionVariation" forKey:self->_particleFrictionVariation];
    [a3 encodeDouble:@"particleCharge" forKey:self->_particleCharge];
    [a3 encodeDouble:@"particleChargeVariation" forKey:self->_particleChargeVariation];
    SCNEncodeVector4(a3, @"particleColorVariation", self->_particleColorVariation.x, self->_particleColorVariation.y, self->_particleColorVariation.z, self->_particleColorVariation.w);
    systemSpawnedOnCollision = self->_systemSpawnedOnCollision;
    if (systemSpawnedOnCollision) {
      [a3 encodeObject:systemSpawnedOnCollision forKey:@"systemSpawnedOnCollision"];
    }
    systemSpawnedOnDying = self->_systemSpawnedOnDying;
    if (systemSpawnedOnDying) {
      [a3 encodeObject:systemSpawnedOnDying forKey:@"systemSpawnedOnDying"];
    }
    systemSpawnedOnLiving = self->_systemSpawnedOnLiving;
    if (systemSpawnedOnLiving) {
      [a3 encodeObject:systemSpawnedOnLiving forKey:@"systemSpawnedOnLiving"];
    }
    [a3 encodeDouble:@"particleSize" forKey:self->_particleSize];
    [a3 encodeDouble:@"particleSizeVariation" forKey:self->_particleSizeVariation];
    [a3 encodeDouble:@"particleIntensity" forKey:self->_particleIntensity];
    [a3 encodeDouble:@"particleIntensityVariation" forKey:self->_particleIntensityVariation];
    [a3 encodeInteger:self->_seed forKey:@"seed"];
    [a3 encodeInteger:self->_blendMode forKey:@"blendMode"];
    [a3 encodeInteger:self->_renderingMode forKey:@"renderingMode"];
    [a3 encodeInteger:self->_orientationMode forKey:@"orientationMode"];
    [a3 encodeInteger:self->_imageSequenceAnimationMode forKey:@"imageSequenceAnimationMode"];
    particleGeometries = self->_particleGeometries;
    if (particleGeometries) {
      [a3 encodeObject:particleGeometries forKey:@"particleGeometries"];
    }
    colliderNodes = self->_colliderNodes;
    if (colliderNodes) {
      [a3 encodeObject:colliderNodes forKey:@"colliderNodes"];
    }
    propertyControllers = self->_propertyControllers;
    if (propertyControllers) {
      [a3 encodeObject:propertyControllers forKey:@"propertyControllers"];
    }
    [a3 encodeInteger:self->_sortingMode forKey:@"sortingMode"];
    [a3 encodeDouble:@"particleMass" forKey:self->_particleMass];
    [a3 encodeDouble:@"particleMassVariation" forKey:self->_particleMassVariation];
    [a3 encodeDouble:@"dampingFactor" forKey:self->_dampingFactor];
    [a3 encodeDouble:@"speedFactor" forKey:self->_speedFactor];
    [a3 encodeDouble:@"fixedTimeStep" forKey:self->_fixedTimeStep];
    [a3 encodeDouble:@"stretchFactor" forKey:self->_stretchFactor];
    [a3 encodeDouble:@"fresnelExponent" forKey:self->_fresnelExponent];
    [a3 encodeInteger:self->_imageSequenceColumnCount forKey:@"imageSequenceColumnCount"];
    [a3 encodeInteger:self->_imageSequenceRowCount forKey:@"imageSequenceRowCount"];
    [a3 encodeDouble:@"imageSequenceInitialFrame" forKey:self->_imageSequenceInitialFrame];
    [a3 encodeDouble:@"imageSequenceInitialFrameVariation" forKey:self->_imageSequenceInitialFrameVariation];
    [a3 encodeDouble:@"imageSequenceFrameRate" forKey:self->_imageSequenceFrameRate];
    [a3 encodeDouble:@"imageSequenceFrameRateVariation" forKey:self->_imageSequenceFrameRateVariation];
    SCNEncodeEntity(a3, self);
    SCNEncodeAnimations(a3, self);
  }
}

- (SCNParticleSystem)initWithCoder:(id)a3
{
  v18[4] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)SCNParticleSystem;
  __n128 v4 = [(SCNParticleSystem *)&v17 init];
  if (v4)
  {
    if ([a3 containsValueForKey:@"referenceName"])
    {
      -[SCNParticleSystem setReferenceName:](v4, "setReferenceName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"referenceName"]);
      if ([(SCNParticleSystem *)v4 referenceName])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v5 = objc_msgSend((id)objc_msgSend(a3, "assetCatalog"), "particleSystemNamed:", -[SCNParticleSystem referenceName](v4, "referenceName"));
          if (v5)
          {
            float v6 = v5;
            objc_msgSend(v5, "setReferenceName:", -[SCNParticleSystem referenceName](v4, "referenceName"));

            return (SCNParticleSystem *)v6;
          }
        }
        else
        {
          uint64_t v8 = scn_default_log();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            -[SCNParticleSystem initWithCoder:](v8);
          }
        }
      }
      else
      {
        id v7 = scn_default_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[SCNParticleSystem initWithCoder:](v7);
        }
      }
    }
    BOOL v9 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    uint64_t v10 = C3DParticleSystemCreate();
    v4->_particleSystem = (__C3DParticleSystem *)v10;
    if (v10) {
      C3DEntitySetObjCWrapper(v10, v4);
    }
    [(SCNParticleSystem *)v4 _syncObjCModel];
    [(SCNParticleSystem *)v4 _customDecodingOfSCNParticleSystem:a3];
    -[SCNParticleSystem setName:](v4, "setName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"name"]);
    [a3 decodeDoubleForKey:@"emissionDuration"];
    -[SCNParticleSystem setEmissionDuration:](v4, "setEmissionDuration:");
    [a3 decodeDoubleForKey:@"emissionDurationVariation"];
    -[SCNParticleSystem setEmissionDurationVariation:](v4, "setEmissionDurationVariation:");
    [a3 decodeDoubleForKey:@"idleDuration"];
    -[SCNParticleSystem setIdleDuration:](v4, "setIdleDuration:");
    [a3 decodeDoubleForKey:@"idleDurationVariation"];
    -[SCNParticleSystem setIdleDurationVariation:](v4, "setIdleDurationVariation:");
    [a3 decodeDoubleForKey:@"birthRate"];
    -[SCNParticleSystem setBirthRate:](v4, "setBirthRate:");
    [a3 decodeDoubleForKey:@"birthRateVariation"];
    -[SCNParticleSystem setBirthRateVariation:](v4, "setBirthRateVariation:");
    [a3 decodeDoubleForKey:@"warmupDuration"];
    -[SCNParticleSystem setWarmupDuration:](v4, "setWarmupDuration:");
    -[SCNParticleSystem setEmitterShape:](v4, "setEmitterShape:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"emitterShape"]);
    -[SCNParticleSystem setBirthLocation:](v4, "setBirthLocation:", [a3 decodeIntegerForKey:@"birthLocation"]);
    -[SCNParticleSystem setBirthDirection:](v4, "setBirthDirection:", [a3 decodeIntegerForKey:@"birthDirection"]);
    *(float *)&double v11 = SCNDecodeVector3(a3, @"emittingDirection");
    [(SCNParticleSystem *)v4 setEmittingDirection:v11];
    *(float *)&double v12 = SCNDecodeVector3(a3, @"orientationDirection");
    [(SCNParticleSystem *)v4 setOrientationDirection:v12];
    *(float *)&double v13 = SCNDecodeVector3(a3, @"acceleration");
    [(SCNParticleSystem *)v4 setAcceleration:v13];
    [a3 decodeDoubleForKey:@"spreadingAngle"];
    -[SCNParticleSystem setSpreadingAngle:](v4, "setSpreadingAngle:");
    -[SCNParticleSystem setIsLocal:](v4, "setIsLocal:", [a3 decodeBoolForKey:@"isLocal"]);
    -[SCNParticleSystem setAffectedByGravity:](v4, "setAffectedByGravity:", [a3 decodeBoolForKey:@"affectedByGravity"]);
    -[SCNParticleSystem setAffectedByPhysicsFields:](v4, "setAffectedByPhysicsFields:", [a3 decodeBoolForKey:@"affectedByPhysicsFields"]);
    -[SCNParticleSystem setPhysicsCollisionsEnabled:](v4, "setPhysicsCollisionsEnabled:", [a3 decodeBoolForKey:@"physicsCollisionsEnabled"]);
    -[SCNParticleSystem setLightingEnabled:](v4, "setLightingEnabled:", [a3 decodeBoolForKey:@"lightingEnabled"]);
    -[SCNParticleSystem setSoftParticlesEnabled:](v4, "setSoftParticlesEnabled:", [a3 decodeBoolForKey:@"softParticlesEnabled"]);
    -[SCNParticleSystem setParticleDiesOnCollision:](v4, "setParticleDiesOnCollision:", [a3 decodeBoolForKey:@"particleDiesOnCollision"]);
    -[SCNParticleSystem setBlackPassEnabled:](v4, "setBlackPassEnabled:", [a3 decodeBoolForKey:@"blackPassEnabled"]);
    [a3 decodeDoubleForKey:@"particleAngle"];
    -[SCNParticleSystem setParticleAngle:](v4, "setParticleAngle:");
    [a3 decodeDoubleForKey:@"particleAngleVariation"];
    -[SCNParticleSystem setParticleAngleVariation:](v4, "setParticleAngleVariation:");
    [a3 decodeDoubleForKey:@"particleVelocity"];
    -[SCNParticleSystem setParticleVelocity:](v4, "setParticleVelocity:");
    [a3 decodeDoubleForKey:@"particleVelocityVariation"];
    -[SCNParticleSystem setParticleVelocityVariation:](v4, "setParticleVelocityVariation:");
    [a3 decodeDoubleForKey:@"particleAngularVelocity"];
    -[SCNParticleSystem setParticleAngularVelocity:](v4, "setParticleAngularVelocity:");
    [a3 decodeDoubleForKey:@"particleAngularVelocityVariation"];
    -[SCNParticleSystem setParticleAngularVelocityVariation:](v4, "setParticleAngularVelocityVariation:");
    [a3 decodeDoubleForKey:@"particleLifeSpan"];
    -[SCNParticleSystem setParticleLifeSpan:](v4, "setParticleLifeSpan:");
    [a3 decodeDoubleForKey:@"particleLifeSpanVariation"];
    -[SCNParticleSystem setParticleLifeSpanVariation:](v4, "setParticleLifeSpanVariation:");
    [a3 decodeDoubleForKey:@"particleBounce"];
    -[SCNParticleSystem setParticleBounce:](v4, "setParticleBounce:");
    [a3 decodeDoubleForKey:@"particleBounceVariation"];
    -[SCNParticleSystem setParticleBounceVariation:](v4, "setParticleBounceVariation:");
    [a3 decodeDoubleForKey:@"particleFriction"];
    -[SCNParticleSystem setParticleFriction:](v4, "setParticleFriction:");
    [a3 decodeDoubleForKey:@"particleFrictionVariation"];
    -[SCNParticleSystem setParticleFrictionVariation:](v4, "setParticleFrictionVariation:");
    [a3 decodeDoubleForKey:@"particleCharge"];
    -[SCNParticleSystem setParticleCharge:](v4, "setParticleCharge:");
    [a3 decodeDoubleForKey:@"particleChargeVariation"];
    -[SCNParticleSystem setParticleChargeVariation:](v4, "setParticleChargeVariation:");
    *(float *)&double v14 = SCNDecodeVector4(a3, @"particleColorVariation");
    [(SCNParticleSystem *)v4 setParticleColorVariation:v14];
    -[SCNParticleSystem setSystemSpawnedOnCollision:](v4, "setSystemSpawnedOnCollision:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"systemSpawnedOnCollision"]);
    -[SCNParticleSystem setSystemSpawnedOnDying:](v4, "setSystemSpawnedOnDying:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"systemSpawnedOnDying"]);
    -[SCNParticleSystem setSystemSpawnedOnLiving:](v4, "setSystemSpawnedOnLiving:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"systemSpawnedOnLiving"]);
    [a3 decodeDoubleForKey:@"particleSize"];
    -[SCNParticleSystem setParticleSize:](v4, "setParticleSize:");
    [a3 decodeDoubleForKey:@"particleSizeVariation"];
    -[SCNParticleSystem setParticleSizeVariation:](v4, "setParticleSizeVariation:");
    if ([a3 containsValueForKey:@"particleIntensity"])
    {
      [a3 decodeDoubleForKey:@"particleIntensity"];
      -[SCNParticleSystem setParticleIntensity:](v4, "setParticleIntensity:");
      [a3 decodeDoubleForKey:@"particleIntensityVariation"];
      -[SCNParticleSystem setParticleIntensityVariation:](v4, "setParticleIntensityVariation:");
    }
    if ([a3 containsValueForKey:@"writesToDepthBuffer"]) {
      -[SCNParticleSystem setWritesToDepthBuffer:](v4, "setWritesToDepthBuffer:", [a3 decodeBoolForKey:@"writesToDepthBuffer"]);
    }
    -[SCNParticleSystem setSeed:](v4, "setSeed:", [a3 decodeIntegerForKey:@"seed"]);
    -[SCNParticleSystem setBlendMode:](v4, "setBlendMode:", [a3 decodeIntegerForKey:@"blendMode"]);
    -[SCNParticleSystem setRenderingMode:](v4, "setRenderingMode:", [a3 decodeIntegerForKey:@"renderingMode"]);
    -[SCNParticleSystem setOrientationMode:](v4, "setOrientationMode:", [a3 decodeIntegerForKey:@"orientationMode"]);
    -[SCNParticleSystem setImageSequenceAnimationMode:](v4, "setImageSequenceAnimationMode:", [a3 decodeIntegerForKey:@"imageSequenceAnimationMode"]);
    -[SCNParticleSystem setParticleGeometries:](v4, "setParticleGeometries:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"particleGeometries"));
    -[SCNParticleSystem setColliderNodes:](v4, "setColliderNodes:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"colliderNodes"));
    uint64_t v15 = (void *)MEMORY[0x263EFFA08];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    -[SCNParticleSystem setPropertyControllers:](v4, "setPropertyControllers:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v15, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v18, 4)), @"propertyControllers"));
    -[SCNParticleSystem setSortingMode:](v4, "setSortingMode:", [a3 decodeIntegerForKey:@"sortingMode"]);
    [a3 decodeDoubleForKey:@"particleMass"];
    -[SCNParticleSystem setParticleMass:](v4, "setParticleMass:");
    [a3 decodeDoubleForKey:@"particleMassVariation"];
    -[SCNParticleSystem setParticleMassVariation:](v4, "setParticleMassVariation:");
    [a3 decodeDoubleForKey:@"dampingFactor"];
    -[SCNParticleSystem setDampingFactor:](v4, "setDampingFactor:");
    [a3 decodeDoubleForKey:@"speedFactor"];
    -[SCNParticleSystem setSpeedFactor:](v4, "setSpeedFactor:");
    [a3 decodeDoubleForKey:@"fixedTimeStep"];
    -[SCNParticleSystem setFixedTimeStep:](v4, "setFixedTimeStep:");
    [a3 decodeDoubleForKey:@"stretchFactor"];
    -[SCNParticleSystem setStretchFactor:](v4, "setStretchFactor:");
    [a3 decodeDoubleForKey:@"fresnelExponent"];
    -[SCNParticleSystem setFresnelExponent:](v4, "setFresnelExponent:");
    -[SCNParticleSystem setImageSequenceColumnCount:](v4, "setImageSequenceColumnCount:", [a3 decodeIntegerForKey:@"imageSequenceColumnCount"]);
    -[SCNParticleSystem setImageSequenceRowCount:](v4, "setImageSequenceRowCount:", [a3 decodeIntegerForKey:@"imageSequenceRowCount"]);
    [a3 decodeDoubleForKey:@"imageSequenceInitialFrame"];
    -[SCNParticleSystem setImageSequenceInitialFrame:](v4, "setImageSequenceInitialFrame:");
    [a3 decodeDoubleForKey:@"imageSequenceInitialFrameVariation"];
    -[SCNParticleSystem setImageSequenceInitialFrameVariation:](v4, "setImageSequenceInitialFrameVariation:");
    [a3 decodeDoubleForKey:@"imageSequenceFrameRate"];
    -[SCNParticleSystem setImageSequenceFrameRate:](v4, "setImageSequenceFrameRate:");
    [a3 decodeDoubleForKey:@"imageSequenceFrameRateVariation"];
    -[SCNParticleSystem setImageSequenceFrameRateVariation:](v4, "setImageSequenceFrameRateVariation:");
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    SCNDecodeEntity(a3, v4);
    SCNDecodeAnimations(a3, v4);
    +[SCNTransaction setImmediateMode:v9];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setName:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleGeometries:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setColliderNodes:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setPropertyControllers:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

void __44__SCNParticleSystem_setPropertyControllers___block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: unknown particle controller input mode", buf, 2u);
}

void __44__SCNParticleSystem_setPropertyControllers___block_invoke_cold_2(uint8_t *a1, uint64_t a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7 = objc_opt_class();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_20B249000, a4, OS_LOG_TYPE_ERROR, "Error: animation class %@ is not supported for particle systems", a1, 0xCu);
}

- (void)setParticleImage:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)_setParticleImagePath:withResolvedPath:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setOrientationDirection:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setLightEmissionRadiusFactor:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setAffectedByGravity:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setAffectedByPhysicsFields:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setBirthDirection:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setBirthLocation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setBirthRate:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setBirthRateVariation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setBlackPassEnabled:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setBlendMode:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setDampingFactor:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setEmissionDuration:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setEmissionDurationVariation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setEmitterShape:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setFixedTimeStep:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setFresnelExponent:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setIdleDuration:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setIdleDurationVariation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setImageSequenceAnimationMode:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setImageSequenceColumnCount:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setImageSequenceFrameRate:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setImageSequenceFrameRateVariation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setImageSequenceInitialFrame:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setImageSequenceInitialFrameVariation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setImageSequenceRowCount:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setIsLocal:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setLightingEnabled:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setLoops:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setOrientationMode:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleAngle:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleAngleVariation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleAngularVelocity:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleAngularVelocityVariation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleBounce:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleBounceVariation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleCharge:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleChargeVariation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleColor:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleDiesOnCollision:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleFriction:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleFrictionVariation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleLifeSpan:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleLifeSpanVariation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleMass:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleMassVariation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleSize:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleSizeVariation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleVelocity:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleVelocityVariation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setPhysicsCollisionsEnabled:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setRenderingMode:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setSeed:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setSoftParticlesEnabled:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setSortingMode:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setSpeedFactor:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setSpreadingAngle:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setStretchFactor:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setSystemSpawnedOnCollision:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setSystemSpawnedOnDying:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setSystemSpawnedOnLiving:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setWarmupDuration:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setWritesToDepthBuffer:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleIntensity:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleIntensityVariation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setParticleColorVariation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setEmittingDirection:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setAcceleration:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: particle reference name is nil", v1, 2u);
}

- (void)initWithCoder:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: referenced particle systems can't be resolved without a SCNAssetCatalog", v1, 2u);
}

@end