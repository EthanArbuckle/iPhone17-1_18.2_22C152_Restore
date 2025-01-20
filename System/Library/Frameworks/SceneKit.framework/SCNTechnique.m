@interface SCNTechnique
+ (BOOL)supportsSecureCoding;
+ (SCNTechnique)techniqueBySequencingTechniques:(NSArray *)techniques;
+ (SCNTechnique)techniqueWithDictionary:(NSDictionary *)dictionary;
+ (SCNTechnique)techniqueWithTechniqueRef:(__C3DFXTechnique *)a3;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)isAnimationForKeyPaused:(id)a3;
- (BOOL)isPausedOrPausedByInheritance;
- (NSArray)animationKeys;
- (NSDictionary)dictionaryRepresentation;
- (SCNTechnique)initWithCoder:(id)a3;
- (SCNTechnique)initWithTechniqueRef:(__C3DFXTechnique *)a3;
- (__C3DAnimationManager)animationManager;
- (__C3DFXTechnique)techniqueRef;
- (__C3DScene)sceneRef;
- (id)_scnAnimationForKey:(id)a3;
- (id)_scnBindings;
- (id)animationForKey:(id)a3;
- (id)animationPlayerForKey:(id)a3;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initPresentationTechniqueWithTechniqueRef:(__C3DFXTechnique *)a3;
- (id)library;
- (id)passAtIndex:(unint64_t)a3;
- (id)presentationInstance;
- (id)scene;
- (id)valueForUndefinedKey:(id)a3;
- (void)__CFObject;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_customDecodingOfSCNTechnique:(id)a3;
- (void)_customEncodingOfSCNTechnique:(id)a3;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_setupPasses;
- (void)_syncObjCAnimations;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleBindingOfSymbol:(NSString *)symbol usingBlock:(SCNBindingBlock)block;
- (void)pauseAnimationForKey:(id)a3;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(double)a3;
- (void)removeAllBindings;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(double)a4;
- (void)resumeAnimationForKey:(id)a3;
- (void)setLibrary:(id)library;
- (void)setSpeed:(double)a3 forAnimationKey:(id)a4;
- (void)setValue:(id)a3 forSymbolNamed:(id)a4;
- (void)unbindAnimatablePath:(id)a3;
@end

@implementation SCNTechnique

- (id)initPresentationTechniqueWithTechniqueRef:(__C3DFXTechnique *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNTechnique;
  v4 = [(SCNTechnique *)&v7 init];
  v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 8) |= 1u;
    v4->_technique = (__C3DFXTechnique *)CFRetain(a3);
    *(void *)&v5->_valueForSymbolLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (SCNTechnique)initWithTechniqueRef:(__C3DFXTechnique *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNTechnique;
  v4 = [(SCNTechnique *)&v7 init];
  if (v4)
  {
    v5 = (__C3DFXTechnique *)CFRetain(a3);
    v4->_technique = v5;
    if (v5) {
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    }
    *(void *)&v4->_valueForSymbolLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ((*((unsigned char *)self + 8) & 1) == 0)
  {
    technique = self->_technique;
    if (technique) {
      C3DEntitySetObjCWrapper((uint64_t)technique, 0);
    }
  }

  v4 = self->_technique;
  if (v4)
  {
    CFRelease(v4);
    self->_technique = 0;
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  passes = self->_passes;
  uint64_t v6 = [(NSArray *)passes countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(passes);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) invalidate];
      }
      uint64_t v7 = [(NSArray *)passes countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)SCNTechnique;
  [(SCNTechnique *)&v10 dealloc];
}

+ (SCNTechnique)techniqueWithDictionary:(NSDictionary *)dictionary
{
  if (dictionary && [(NSDictionary *)dictionary count])
  {
    v4 = (const void *)C3DFXTechniqueCreateWithDescription(dictionary, 0);
    v5 = [[SCNTechnique alloc] initWithTechniqueRef:v4];
    CFRelease(v4);
    return v5;
  }
  else
  {
    NSLog(&cfstr_FailedToLoadTe.isa, a2, dictionary);
    return 0;
  }
}

+ (SCNTechnique)techniqueBySequencingTechniques:(NSArray *)techniques
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](techniques, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [(NSArray *)techniques countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(techniques);
        }
        objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v8++), "techniqueRef"));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)techniques countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }
  result = (SCNTechnique *)C3DFXTechniqueCreateBySequencingTechniques(v4, 0);
  if (result)
  {
    objc_super v10 = result;
    long long v11 = [[SCNTechnique alloc] initWithTechniqueRef:result];
    CFRelease(v10);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = [(NSArray *)techniques countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(techniques);
          }
          uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * v15);
          os_unfair_lock_lock((os_unfair_lock_t)(v16 + 32));
          v17 = *(void **)(v16 + 24);
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __48__SCNTechnique_techniqueBySequencingTechniques___block_invoke;
          v18[3] = &unk_264006110;
          v18[4] = v11;
          [v17 enumerateKeysAndObjectsUsingBlock:v18];
          os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 32));
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [(NSArray *)techniques countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v13);
    }
    return v11;
  }
  return result;
}

uint64_t __48__SCNTechnique_techniqueBySequencingTechniques___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forUndefinedKey:a2];
}

- (void)handleBindingOfSymbol:(NSString *)symbol usingBlock:(SCNBindingBlock)block
{
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)C3DFXTechniqueGetDescription((uint64_t)self->_technique);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = +[SCNTechnique techniqueWithDictionary:[(SCNTechnique *)self dictionaryRepresentation]];

  return v3;
}

- (id)copy
{
  return [(SCNTechnique *)self copyWithZone:0];
}

- (__C3DFXTechnique)techniqueRef
{
  return self->_technique;
}

- (void)setValue:(id)a3 forSymbolNamed:(id)a4
{
  if ((*((unsigned char *)self + 8) & 1) == 0)
  {
    os_unfair_lock_lock(&self->_valueForSymbolLock);
    valueForSymbol = self->_valueForSymbol;
    if (valueForSymbol)
    {
      if (a3)
      {
LABEL_4:
        [(NSMutableDictionary *)valueForSymbol setObject:a3 forKey:a4];
LABEL_9:
        os_unfair_lock_unlock(&self->_valueForSymbolLock);
        v9 = [(SCNTechnique *)self sceneRef];
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __40__SCNTechnique_setValue_forSymbolNamed___block_invoke;
        v10[3] = &unk_264006138;
        v10[4] = self;
        v10[5] = a4;
        v10[6] = a3;
        +[SCNTransaction postCommandWithContext:v9 object:self keyPath:a4 applyBlock:v10];
        return;
      }
    }
    else
    {
      valueForSymbol = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_valueForSymbol = valueForSymbol;
      if (a3) {
        goto LABEL_4;
      }
    }
    [(NSMutableDictionary *)valueForSymbol removeObjectForKey:a4];
    goto LABEL_9;
  }
  uint64_t v8 = scn_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[SCNTechnique setValue:forSymbolNamed:]((uint64_t)self, v8);
  }
}

void __40__SCNTechnique_setValue_forSymbolNamed___block_invoke(id *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  __int16 v12 = 0;
  C3DFXTechniqueGetValueForSymbol(*((void *)a1[4] + 2), a1[5], &v12);
  if (v12)
  {
    if (v12 != 5)
    {
      SCNWriteValueToTypedBytes(a1[6], (uint64_t)v13, v12);
      id v7 = a1[5];
      uint64_t v8 = *((void *)a1[4] + 2);
      v9 = v13;
LABEL_8:
      C3DFXTechniqueSetValueForSymbol(v8, v7, v9);
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = a1[6];
      uint64_t v3 = [v2 contents];
      if (v3)
      {
        v4 = (void *)v3;
        uint64_t v5 = (const void *)C3DFXSamplerCreate();
        TextureSampler = (const void *)C3DEffectSlotGetTextureSampler([v2 effectSlot]);
        C3DFXSamplerSetTextureSampler((uint64_t)v5, TextureSampler);
        if ([v4 conformsToProtocol:&unk_26C0078D8]) {
          C3DFXSamplerSetTexture((uint64_t)v5, v4);
        }
        else {
          C3DFXSamplerSetImage((uint64_t)v5, +[SCNMaterialProperty copyC3DImageFromImage:a1[6]]);
        }
        goto LABEL_13;
      }
      id v7 = a1[5];
      uint64_t v8 = *((void *)a1[4] + 2);
      v9 = 0;
      goto LABEL_8;
    }
    objc_super v10 = +[SCNMaterialProperty copyC3DImageFromImage:a1[6]];
    if (v10)
    {
      uint64_t v5 = v10;
LABEL_13:
      C3DFXTechniqueSetValueForSymbol(*((void *)a1[4] + 2), a1[5], v5);
      CFRelease(v5);
    }
  }
LABEL_14:
  uint64_t SharedInstance = C3DNotificationCenterGetSharedInstance();
  C3DNotificationCenterPostNotification(SharedInstance, @"kC3DNotificationEngineContextInvalidatePasses", (const void *)[a1[4] sceneRef], 0, 1u);
}

- (id)valueForUndefinedKey:(id)a3
{
  if (*((unsigned char *)self + 8))
  {
    +[SCNTransaction lock];
    __int16 v13 = 0;
    ValueForSymbol = (float32x2_t *)C3DFXTechniqueGetValueForSymbol((uint64_t)self->_technique, a3, &v13);
    __int16 v12 = (void *)SCNNSValueFromTypedBytes(ValueForSymbol, v13, v8, v9, v10, v11);
    +[SCNTransaction unlock];
    return v12;
  }
  else
  {
    os_unfair_lock_lock(&self->_valueForSymbolLock);
    id v5 = (id)[(NSMutableDictionary *)self->_valueForSymbol valueForKey:a3];
    os_unfair_lock_unlock(&self->_valueForSymbolLock);
    return v5;
  }
}

- (void)setLibrary:(id)library
{
  uint64_t v3 = self->_library;
  if (v3 != library)
  {

    self->_library = (MTLLibrary *)library;
    uint64_t v6 = [(SCNTechnique *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __27__SCNTechnique_setLibrary___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    v7[5] = library;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __27__SCNTechnique_setLibrary___block_invoke(uint64_t a1)
{
}

- (id)library
{
  return self->_library;
}

- (__C3DScene)sceneRef
{
  id v2 = [(SCNTechnique *)self __CFObject];

  return (__C3DScene *)C3DGetScene(v2);
}

- (id)scene
{
  id result = [(SCNTechnique *)self sceneRef];
  if (result)
  {
    return C3DEntityGetObjCWrapper((id *)result);
  }
  return result;
}

- (void)__CFObject
{
  return self->_technique;
}

- (__C3DAnimationManager)animationManager
{
  id result = [(SCNTechnique *)self sceneRef];
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
    double v9 = [(SCNTechnique *)self __CFObject];
    if ((CFTypeIsC3DEntity(v9) & 1) == 0)
    {
      double v10 = scn_default_log();
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
    BOOL v8 = [(SCNTechnique *)self sceneRef];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__SCNTechnique_addAnimationPlayer_forKey___block_invoke;
    v10[3] = &unk_264006138;
    v10[4] = a3;
    v10[5] = self;
    v10[6] = v5;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v10];
  }
  else
  {
    double v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNTechnique addAnimationPlayer:forKey:]((uint64_t)self, v9);
    }
  }
}

void __42__SCNTechnique_addAnimationPlayer_forKey___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "prepareWithTarget:implicitDuration:", a1[5]);
  if ((SCNAddAnimation(a1[4], a1[5], a1[6]) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 9);
    [*((id *)a1[5] + 5) removeObjectForKey:a1[6]];
    id v2 = (os_unfair_lock_s *)((char *)a1[5] + 36);
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
    [(SCNTechnique *)self addAnimationPlayer:v7 forKey:v5];
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
  v4 = [(SCNTechnique *)self sceneRef];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__SCNTechnique_removeAllAnimations__block_invoke;
  v5[3] = &unk_264005010;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:v4 object:self applyBlock:v5];
}

void __35__SCNTechnique_removeAllAnimations__block_invoke(uint64_t a1)
{
}

- (void)removeAllAnimationsWithBlendOutDuration:(double)a3
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  [(SCNOrderedDictionary *)self->_animations removeAllObjects];
  os_unfair_lock_unlock(p_animationsLock);
  uint64_t v6 = [(SCNTechnique *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__SCNTechnique_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
}

void __56__SCNTechnique_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
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
    uint64_t v6 = [(SCNTechnique *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__SCNTechnique_removeAnimationForKey___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __38__SCNTechnique_removeAnimationForKey___block_invoke(uint64_t a1)
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
    BOOL v8 = [(SCNTechnique *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __55__SCNTechnique_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_264004E20;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v9];
  }
}

void __55__SCNTechnique_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
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
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "CFTypeIsC3DEntity(cfObject)";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. sync animations: cftype is not an entity", (uint8_t *)&v1, 0xCu);
}

- (id)animationForKey:(id)a3
{
  id v3 = [(SCNTechnique *)self _scnAnimationForKey:a3];
  v4 = (void *)MEMORY[0x263F15748];

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
        double v11 = objc_msgSend((id)objc_msgSend(a3, "animationPlayerForKey:", v10), "copy");
        [(SCNTechnique *)self addAnimationPlayer:v11 forKey:v10];
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
  double v9 = [(SCNTechnique *)self __CFObject];
  if (v9)
  {
    uint64_t v10 = v9;
    double v11 = [(SCNTechnique *)self animationManager];
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
  BOOL v5 = [(SCNTechnique *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__SCNTechnique_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __37__SCNTechnique_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:1 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)resumeAnimationForKey:(id)a3
{
  BOOL v5 = [(SCNTechnique *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__SCNTechnique_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __38__SCNTechnique_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:0 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7 = [NSString stringWithFormat:@"animations.%@.speed", a4];
  uint64_t v8 = [(SCNTechnique *)self sceneRef];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__SCNTechnique_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_264004E20;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:v8 object:self keyPath:v7 applyBlock:v9];
}

void __41__SCNTechnique_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNTechnique *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  uint64_t v7 = [(SCNTechnique *)self __CFObject];
  if (v7)
  {
    uint64_t v8 = v7;
    double v9 = [(SCNTechnique *)self animationManager];
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

    long long v15 = [(SCNTechnique *)self sceneRef];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __64__SCNTechnique_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_264006188;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:v15 object:self applyBlock:v16];
  }
}

void __64__SCNTechnique_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNTechnique *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__SCNTechnique_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __37__SCNTechnique_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  uint64_t v2 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  CFStringRef v3 = *(const __CFString **)(a1 + 40);

  C3DEntityRemoveBindingWithKeyPath(v2, v3);
}

- (void)removeAllBindings
{
  self->_bindings = 0;
  CFStringRef v3 = [(SCNTechnique *)self sceneRef];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__SCNTechnique_removeAllBindings__block_invoke;
  v4[3] = &unk_264005010;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:v3 object:self applyBlock:v4];
}

void __33__SCNTechnique_removeAllBindings__block_invoke(uint64_t a1)
{
  int v1 = (CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");

  C3DEntityRemoveAllBindings(v1);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (id)presentationInstance
{
  if ((*((unsigned char *)self + 8) & 1) == 0)
  {
    id v2 = [[SCNTechnique alloc] initPresentationTechniqueWithTechniqueRef:*((void *)self + 2)];
    return v2;
  }
  return self;
}

+ (SCNTechnique)techniqueWithTechniqueRef:(__C3DFXTechnique *)a3
{
  id result = (SCNTechnique *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
  {
    uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithTechniqueRef:a3];
    return (SCNTechnique *)v6;
  }
  return result;
}

- (void)_setupPasses
{
  self->_passes = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t PassCount = C3DFXTechniqueGetPassCount((uint64_t)self->_technique);
  if (PassCount >= 1)
  {
    uint64_t v4 = PassCount;
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v6 = [[SCNPass alloc] initWithFXPass:C3DFXTechniqueGetPassAtIndex((uint64_t)self->_technique, i) technique:self];
      [(NSArray *)self->_passes addObject:v6];
    }
  }
}

- (id)passAtIndex:(unint64_t)a3
{
  passes = self->_passes;
  if (!passes)
  {
    [(SCNTechnique *)self _setupPasses];
    passes = self->_passes;
  }
  if ([(NSArray *)passes count] <= a3) {
    return 0;
  }
  uint64_t v6 = self->_passes;

  return [(NSArray *)v6 objectAtIndexedSubscript:a3];
}

- (void)_customEncodingOfSCNTechnique:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNTechnique dictionaryRepresentation](self, "dictionaryRepresentation"), @"description");
  os_unfair_lock_lock(&self->_valueForSymbolLock);
  [a3 encodeObject:self->_valueForSymbol forKey:@"valueForSymbol"];

  os_unfair_lock_unlock(&self->_valueForSymbolLock);
}

- (void)_customDecodingOfSCNTechnique:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v5 = (const void *)[a3 decodeObjectOfClasses:SCNPlistClasses() forKey:@"description"];
  if (v5)
  {
    uint64_t v6 = (__C3DFXTechnique *)C3DFXTechniqueCreateWithDescription(v5, 0);
    self->_technique = v6;
    if (v6) {
      C3DEntitySetObjCWrapper((uint64_t)v6, self);
    }
  }
  uint64_t v7 = (void *)[a3 decodeObjectOfClasses:SCNPlistClasses() forKey:@"valueForSymbol"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[SCNTechnique setValue:forSymbolNamed:](self, "setValue:forSymbolNamed:", [v7 objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * v11)], *(void *)(*((void *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)encodeWithCoder:(id)a3
{
  -[SCNTechnique _customEncodingOfSCNTechnique:](self, "_customEncodingOfSCNTechnique:");

  SCNEncodeAnimations(a3, self);
}

- (SCNTechnique)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNTechnique;
  uint64_t v4 = [(SCNTechnique *)&v7 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    v4->_valueForSymbolLock._os_unfair_lock_opaque = 0;
    [(SCNTechnique *)v4 _customDecodingOfSCNTechnique:a3];
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

- (void)setValue:(uint64_t)a1 forSymbolNamed:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  CFStringRef v3 = "-[SCNTechnique setValue:forSymbolNamed:]";
  __int16 v4 = 1024;
  int v5 = 161;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", (uint8_t *)&v2, 0x1Cu);
}

- (void)__removeAnimation:(os_log_t)log forKey:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "CFTypeIsC3DEntity(cfObject)";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. __removeAnimationForKey: cftype is not an entity", (uint8_t *)&v1, 0xCu);
}

- (void)addAnimationPlayer:(uint64_t)a1 forKey:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: attempt to add a null animation player on %@", (uint8_t *)&v2, 0xCu);
}

- (void)addAnimation:(uint64_t)a1 forKey:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: attempt to add a null animation on %@", (uint8_t *)&v2, 0xCu);
}

@end